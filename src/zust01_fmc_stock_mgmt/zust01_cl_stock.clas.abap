CLASS zust01_cl_stock DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider .

    TYPES: rt_dats  TYPE if_rap_query_filter=>tt_range_option,
           tt_current_stock  TYPE TABLE OF zust01_materialmultistockbydat WITH DEFAULT KEY,
           tt_floating_stock TYPE TABLE OF ZUST01_SUPPLYDEMANDITEMS WITH DEFAULT KEY.

    METHODS get_stock
      IMPORTING
                it_filter_cond       TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                  TYPE i OPTIONAL
                skip                 TYPE i OPTIONAL
      RETURNING VALUE(et_stock_data) TYPE tt_current_stock

      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS get_current_stock
      IMPORTING
                it_filter_cond          TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                     TYPE i OPTIONAL
                skip                    TYPE i OPTIONAL
      RETURNING VALUE(et_curr_stock) TYPE tt_current_stock

      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS get_floating_stock
      IMPORTING
                it_filter_cond          TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                     TYPE i OPTIONAL
                skip                    TYPE i OPTIONAL
      RETURNING VALUE(et_float_stock) TYPE tt_floating_stock

      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS ZUST01_CL_STOCK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    DATA: lt_business_data     TYPE TABLE OF ZUST01_MATERIALMULTISTOCKBYDAT,
*          lt_filter_conditions TYPE if_rap_query_filter=>tt_name_range_pairs.
*
*    TRY.
*
*        out->write( lt_business_data ).
*
*      CATCH cx_root INTO DATA(exception).
*        out->write( cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ) ).
*    ENDTRY.

  ENDMETHOD.


  METHOD if_rap_query_provider~select.

    TRY.
        DATA: business_data TYPE TABLE OF zust01_materialmultistockbydat.
        DATA(top)     = io_request->get_paging( )->get_page_size( ).
        DATA(skip)    = io_request->get_paging( )->get_offset( ).
        DATA(requested_fields)  = io_request->get_requested_elements( ).
        DATA(sort_order)    = io_request->get_sort_elements( ).


        DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

*        get_stock(
*          EXPORTING
*            it_filter_cond   = lt_filter_cond
*            top              = CONV i( top )
*            skip             = CONV i( skip )
*          IMPORTING
*            et_business_data = business_data
*        ).

        io_response->set_total_number_of_records( lines( business_data ) ).
        io_response->set_data( business_data ).

      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.


  METHOD get_stock.

    TRY.
        et_stock_data = get_current_stock( it_filter_cond = it_filter_cond  ).
      CATCH cx_root INTO DATA(lo_err).
        DATA(lv_ErrMsg) = lo_err->get_longtext( ).
    ENDTRY.

  ENDMETHOD.


  METHOD get_current_stock.

    DATA: lt_business_data TYPE TABLE OF zust01_materialmultistockbydat,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.


    TRY.


        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
          i_name       = 'S4H'
          i_authn_mode = if_a4c_cp_service=>service_specific ).


        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
          ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZUST01_FMC_STOCK_MGMT_SC'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/MMIM_MULTIPLE_MATERIAL_SRV/' ).


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'MATERIALMULTISTOCKBYDATES' )->create_request_for_read( ).


        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        LOOP AT it_filter_cond ASSIGNING FIELD-SYMBOL(<lfs_cond>).
          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = <lfs_cond>-name
                                                               it_range         = <lfs_cond>-range ).
          IF lo_filter_node_root IS INITIAL.
            lo_filter_node_root = lo_filter_node.
          ELSE.
            lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
          ENDIF.
        ENDLOOP.


        IF lo_filter_node_root IS NOT INITIAL.
          lo_request->set_filter( lo_filter_node_root ).
        ENDIF.

        IF top > 0.
          lo_request->set_top( top ).
        ENDIF.

        lo_request->set_skip( skip ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).

        lo_response->get_business_data( IMPORTING et_business_data = et_curr_stock ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection
        DATA(lv_errmsg) = lx_remote->get_longtext(  ).

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        lv_errmsg = lx_gateway->get_longtext(  ).

        " Handle Exception

    ENDTRY.
  ENDMETHOD.


  METHOD get_floating_stock.

    DATA: lt_business_data TYPE TABLE OF zust01_materialmultistockbydat,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.


    TRY.


        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
          i_name       = 'S4H'
          i_authn_mode = if_a4c_cp_service=>service_specific ).


        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
          ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZUST01_FMC_MRP_MATERIALS_SC'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_MRP_MATERIALS_SRV_01/' ).


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'SUPPLYDEMANDITEMS' )->create_request_for_read( ).


        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        LOOP AT it_filter_cond ASSIGNING FIELD-SYMBOL(<lfs_cond>).
          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = <lfs_cond>-name
                                                               it_range         = <lfs_cond>-range ).
          IF lo_filter_node_root IS INITIAL.
            lo_filter_node_root = lo_filter_node.
          ELSE.
            lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
          ENDIF.
        ENDLOOP.


        IF lo_filter_node_root IS NOT INITIAL.
          lo_request->set_filter( lo_filter_node_root ).
        ENDIF.

        IF top > 0.
          lo_request->set_top( top ).
        ENDIF.

        lo_request->set_skip( skip ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).

        lo_response->get_business_data( IMPORTING et_business_data = et_float_stock ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection
        DATA(lv_errmsg) = lx_remote->get_longtext(  ).

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        lv_errmsg = lx_gateway->get_longtext(  ).

        " Handle Exception

    ENDTRY.
  ENDMETHOD.
ENDCLASS.
