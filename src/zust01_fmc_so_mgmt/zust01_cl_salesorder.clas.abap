CLASS zust01_cl_salesorder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.

    TYPES: rt_dats       TYPE if_rap_query_filter=>tt_range_option,
           tt_salesorder TYPE TABLE OF zust01_ce_salesorder_01 WITH DEFAULT KEY.
    TYPES t_salesord_itm TYPE TABLE OF zust01_a_salesorderitem WITH DEFAULT KEY
                                                                      WITH NON-UNIQUE SORTED KEY key_order COMPONENTS salesorder.

    TYPES t_salesord_hdr TYPE TABLE OF zust01_a_salesorder WITH DEFAULT KEY
                                                           WITH NON-UNIQUE SORTED KEY key_date COMPONENTS SalesOrderDate.

    METHODS get_sales_order
      IMPORTING
                it_filter_cond        TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                   TYPE i OPTIONAL
                skip                  TYPE i OPTIONAL
      RETURNING VALUE(rt_sales_order) TYPE  tt_salesorder
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.


  PROTECTED SECTION.
  PRIVATE SECTION.


*  Get Sales Order Item Level
    METHODS get_salesord_itm
      IMPORTING
                it_filter_cond TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top            TYPE i OPTIONAL
                skip           TYPE i OPTIONAL
      RETURNING VALUE(rt_data) TYPE  t_salesord_itm
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

*  Get Sales Order Header Level
    METHODS get_salesorder_hdr
      IMPORTING
                it_filter_cond TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top            TYPE i OPTIONAL
                skip           TYPE i OPTIONAL

      RETURNING VALUE(rt_data) TYPE  t_salesord_hdr
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

*  Calculation / Custom Function
    METHODS custom_calculation
      IMPORTING
                it_filter_cond TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top            TYPE i OPTIONAL
                skip           TYPE i OPTIONAL
      RETURNING VALUE(rt_data) TYPE  t_salesord_itm
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

ENDCLASS.



CLASS zust01_cl_salesorder IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie,
          lt_filter_conditions   TYPE if_rap_query_filter=>tt_name_range_pairs.

    TRY.

        out->write( lt_prdalc_tmesers_data ).

      CATCH cx_root INTO DATA(exception).
        out->write( cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ) ).
    ENDTRY.

  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    TRY.
        DATA(top)     = io_request->get_paging( )->get_page_size( ).
        DATA(skip)    = io_request->get_paging( )->get_offset( ).
        DATA(requested_fields)  = io_request->get_requested_elements( ).
        DATA(sort_order)    = io_request->get_sort_elements( ).


        DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lt_salesord_itm) = get_sales_order( EXPORTING it_filter_cond = lt_filter_cond ).
*       OData result/push back to web service
        io_response->set_total_number_of_records( lines( lt_salesord_itm ) ).
        io_response->set_data( lt_salesord_itm ).


      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.


  ENDMETHOD.


  METHOD get_sales_order.


*       Get Sales Order Header Data
    DATA(lt_saleord_hdr) = get_salesorder_hdr( it_filter_cond = it_filter_cond ).
    SORT lt_saleord_hdr BY salesorder.


*       Get Sales Order Item Data
    DATA(lt_salesord_itm) = get_salesord_itm( it_filter_cond = it_filter_cond ).
    SORT lt_salesord_itm BY salesorder SalesOrderItem.

*    rt_sales_order

    LOOP AT lt_saleord_hdr ASSIGNING FIELD-SYMBOL(<fs_so_hdr>).
      LOOP AT lt_salesord_itm
          ASSIGNING FIELD-SYMBOL(<fs_so_itm>)
              WHERE salesorder = <fs_so_hdr>-SalesOrder.

        APPEND INITIAL LINE TO rt_sales_order ASSIGNING FIELD-SYMBOL(<fs_fin_out>).
        <fs_fin_out> = CORRESPONDING #( <fs_so_itm> ).

      ENDLOOP.
    ENDLOOP.


  ENDMETHOD.

  METHOD get_salesord_itm.

    TYPES: BEGIN OF ty_filter_cond,
             cond_nam TYPE zust01_fmc_amc_column_descr,
             cond_val TYPE zust01_fmc_amc_api_filter_val,
           END OF ty_filter_cond,
           tt_filter_cond TYPE TABLE OF ty_filter_cond WITH DEFAULT KEY.


    DATA: lo_http_client      TYPE REF TO if_web_http_client,
          lo_client_proxy     TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request          TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response         TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_filter_def       TYPE if_rap_query_filter=>ty_name_range_pairs,
          lt_filter_cond      TYPE tt_filter_cond.

    DATA: lt_split    TYPE TABLE OF char40.

    TRY.

        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
          i_name       = 'S4H'
          i_authn_mode = if_a4c_cp_service=>service_specific ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
          ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZUST01_FMC_SALES_ORDER'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_SALES_ORDER_SRV/' ).

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SALESORDERITEM' )->create_request_for_read( ).
        lo_filter_factory = lo_request->create_filter_factory( ).



*       Extracting the CVC Filter
        DATA(lt_cvcfilter) = VALUE #( it_filter_cond[ name = 'CVCFILTER' ] DEFAULT ls_filter_def ).
        DATA(lv_cvcfilter) = VALUE #( lt_cvcfilter-range[ 1 ]-low DEFAULT ''  ).

        IF NOT lv_cvcfilter IS INITIAL.
          SPLIT lv_cvcfilter AT ',' INTO TABLE lt_split.

          LOOP AT lt_split ASSIGNING FIELD-SYMBOL(<fs_split>).

            SPLIT <fs_split> AT '=' INTO: DATA(lv_fldname) DATA(lv_fldval).

            APPEND INITIAL LINE TO lt_filter_cond ASSIGNING FIELD-SYMBOL(<fs_filter_cond>).
            <fs_filter_cond>-cond_nam = lv_fldname.
            <fs_filter_cond>-cond_val = lv_fldval.

          ENDLOOP.

        ENDIF.


*     Get data from SCRCOL
        SELECT *
            FROM zust01_scrcol
              FOR ALL ENTRIES IN @lt_filter_cond
                WHERE description  = @lt_filter_cond-cond_nam
                  AND zapi_service = 'A_SALESORDERITEM'
                  INTO TABLE @DATA(lt_scrcol).

        IF sy-subrc EQ 0.

          LOOP AT lt_scrcol ASSIGNING FIELD-SYMBOL(<fs_scrcol>).

            DATA(lv_condval) = VALUE #( lt_filter_cond[ cond_nam = <fs_scrcol>-description ]-cond_val DEFAULT '' ).

            IF NOT lv_condval IS INITIAL.

              DATA(lr_t_cond) = VALUE if_rap_query_filter=>tt_range_option(
                                          LET s = 'I'
                                              o = 'EQ'
                                          IN sign   = s
                                             option = o
                                             ( low = lv_condval )
                                                ) .
              lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = to_upper( <fs_scrcol>-zapi_field )
                                                                   it_range         = lr_t_cond ).

              IF lo_filter_node_root IS INITIAL.
                lo_filter_node_root = lo_filter_node.
              ELSE.
                lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
              ENDIF.

            ENDIF.
          ENDLOOP.

        ENDIF.




        IF lo_filter_node_root IS NOT INITIAL.
          lo_request->set_filter( lo_filter_node_root ).
        ENDIF.

        IF top > 0.
          lo_request->set_top( top ).
        ENDIF.


        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).


        DATA: lt_salesord TYPE STANDARD TABLE OF zsc01a_salesorderitem.
        lo_response->get_business_data( IMPORTING et_business_data = rt_data ).




      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception
    ENDTRY.
  ENDMETHOD.

  METHOD get_salesorder_hdr.

    TYPES: BEGIN OF ty_filter_cond,
             cond_nam TYPE zust01_fmc_amc_column_descr,
             cond_val TYPE zust01_fmc_amc_api_filter_val,
           END OF ty_filter_cond,
           tt_filter_cond TYPE TABLE OF ty_filter_cond WITH DEFAULT KEY.


    DATA: lo_http_client      TYPE REF TO if_web_http_client,
          lo_client_proxy     TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request          TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response         TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_filter_def       TYPE if_rap_query_filter=>ty_name_range_pairs,
          lt_filter_cond      TYPE tt_filter_cond.

    DATA: lt_split    TYPE TABLE OF char40.

    TRY.

        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
          i_name       = 'S4H'
          i_authn_mode = if_a4c_cp_service=>service_specific ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
          ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZUST01_FMC_SALES_ORDER'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_SALES_ORDER_SRV/' ).

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SALESORDER' )->create_request_for_read( ).
        lo_filter_factory = lo_request->create_filter_factory( ).


*       Extracting the CVC Filter
        DATA(lt_cvcfilter) = VALUE #( it_filter_cond[ name = 'CVCFILTER' ] DEFAULT ls_filter_def ).
        DATA(lv_cvcfilter) = VALUE #( lt_cvcfilter-range[ 1 ]-low DEFAULT ''  ).

        IF NOT lv_cvcfilter IS INITIAL.
          SPLIT lv_cvcfilter AT ',' INTO TABLE lt_split.

          LOOP AT lt_split ASSIGNING FIELD-SYMBOL(<fs_split>).

            SPLIT <fs_split> AT '=' INTO: DATA(lv_fldname) DATA(lv_fldval).

            APPEND INITIAL LINE TO lt_filter_cond ASSIGNING FIELD-SYMBOL(<fs_filter_cond>).
            <fs_filter_cond>-cond_nam = lv_fldname.
            <fs_filter_cond>-cond_val = lv_fldval.

          ENDLOOP.

        ENDIF.


*     Get data from SCRCOL
        SELECT *
            FROM zust01_scrcol
              FOR ALL ENTRIES IN @lt_filter_cond
                WHERE description  = @lt_filter_cond-cond_nam
                  AND zapi_service = 'A_SALESORDER'
                  INTO TABLE @DATA(lt_scrcol).

        IF sy-subrc EQ 0.

          LOOP AT lt_scrcol ASSIGNING FIELD-SYMBOL(<fs_scrcol>).

            DATA(lv_condval) = VALUE #( lt_filter_cond[ cond_nam = <fs_scrcol>-description ]-cond_val DEFAULT '' ).

            IF NOT lv_condval IS INITIAL.

              DATA(lr_t_cond) = VALUE if_rap_query_filter=>tt_range_option(
                                          LET s = 'I'
                                              o = 'EQ'
                                          IN sign   = s
                                             option = o
                                             ( low = lv_condval )
                                                ) .
              lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = to_upper( <fs_scrcol>-zapi_field )
                                                                   it_range         = lr_t_cond ).


              IF lo_filter_node_root IS INITIAL.
                lo_filter_node_root = lo_filter_node.
              ELSE.
                lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
              ENDIF.

            ENDIF.
          ENDLOOP.

        ENDIF.




        IF lo_filter_node_root IS NOT INITIAL.
          lo_request->set_filter( lo_filter_node_root ).
        ENDIF.

        IF top > 0.
          lo_request->set_top( top ).
        ENDIF.


        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).


        DATA: lt_salesord TYPE STANDARD TABLE OF zsc01a_salesorderitem.
        lo_response->get_business_data( IMPORTING et_business_data = rt_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception
    ENDTRY.
  ENDMETHOD.

  METHOD custom_calculation.

  ENDMETHOD.

ENDCLASS.
