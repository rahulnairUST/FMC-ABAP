CLASS zust01_cl_alloc_obj_f4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider .
    TYPES t_prdalc_data         TYPE STANDARD TABLE OF zust01_a_prodallocationobject.
    METHODS get_prdalcdata
      IMPORTING
        it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
        top              TYPE int8 OPTIONAL
        skip             TYPE int8 OPTIONAL
      EXPORTING
        et_business_data TYPE  t_prdalc_data
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUST01_CL_ALLOC_OBJ_F4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD get_prdalcdata.
    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response     TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.

    DATA lv_top type i.
    DATA lv_skip type i.

    lv_top = top.
    lv_skip = skip.

    TRY.
    DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
      i_name       = 'S4H'
      i_authn_mode = if_a4c_cp_service=>service_specific ).


    lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
      ).

    lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
      EXPORTING
        iv_service_definition_name = 'ZUST01_FMC_ALLOC_MGMT_SC'
        io_http_client             = lo_http_client
        iv_relative_service_root   = '/sap/opu/odata/sap/API_PRODUCT_ALLOCATION_OBJECT_SRV/' ).


    " Navigate to the resource and create a request for the read operation
    lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCATIONOBJECT' )->create_request_for_read( ).

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

        IF lv_top > 0.
          lo_request->set_top( lv_top ).
        ENDIF.

        lo_request->set_skip( lv_skip ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).

        lo_response->get_business_data( IMPORTING et_business_data = et_business_data ).
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    DATA lt_prdalc_data TYPE TABLE OF zust01_a_prodallocationobject.
    DATA lt_final_data type table of zust01_ce_alloc_obj.
    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).
    DATA lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie.

    FIELD-SYMBOLS: <fs_any> TYPE any.

    TRY.

        DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).

*   Get product allocation
        get_prdalcdata(
        EXPORTING
            it_filter_cond   = filter_condition
            top = top
            skip = skip
          IMPORTING
            et_business_data = lt_prdalc_data ).
    CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.

    MOVE-CORRESPONDING lt_prdalc_data to lt_final_data.

*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_final_data ) ).
          io_response->set_data( lt_final_data ).

  ENDMETHOD.
ENDCLASS.
