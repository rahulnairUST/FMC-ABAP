CLASS zust01_cl_prodallocation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.
    INTERFACES if_rap_query_filter.

    TYPES t_prdalc_data         TYPE STANDARD TABLE OF zust01_a_prodallocationobject.
    TYPES t_prdalc_cvc_data     TYPE TABLE OF zust01_a_prodalloccharcvalcomb.
    TYPES t_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie WITH DEFAULT KEY.
    TYPES t_salesord_itm        TYPE TABLE OF zust01_a_salesorderitem WITH DEFAULT KEY
                                                                    WITH NON-UNIQUE SORTED KEY key_order COMPONENTS salesorder.

    TYPES t_salesord_hdr        TYPE TABLE OF zust01_a_salesorder WITH DEFAULT KEY
                                                                WITH NON-UNIQUE SORTED KEY key_date COMPONENTS SalesOrderDate.

    TYPES t_salesord_summ       TYPE TABLE OF zust01_cs_salesord_summ WITH DEFAULT KEY
                                                                WITH NON-UNIQUE SORTED KEY key_order COMPONENTS material
                                                                                                                customergrp
                                                                                                                soldtoparty
                                                                                                                bucketidx.

    TYPES t_prdalloc_cvc_demo   TYPE TABLE OF zust01_ce_prodallocation WITH DEFAULT KEY.
    TYPES t_bucket_list         TYPE TABLE OF zst_bucket_list WITH DEFAULT KEY.
    TYPES: rt_dats              TYPE if_rap_query_filter=>tt_range_option.
    TYPES t_quantity            TYPE zust01_cs_salesord_summ-orderqty.
    TYPES t_currstock           TYPE zust01_cl_stock=>tt_current_stock.
    TYPES t_floatstock          TYPE TABLE OF zust_cs_floating_stk WITH DEFAULT KEY
                                                                   WITH NON-UNIQUE SORTED KEY key_material COMPONENTS material
                                                                                                                      bucketidx.

    TYPES: gty_t_scrrow TYPE TABLE OF zust01_scrrow WITH DEFAULT KEY.

    DATA: gs_selid_d TYPE zust01_selid_d.

    CONSTANTS: BEGIN OF gs_scrrow,
                 alc_qty           TYPE zust01_scrrow-line_name VALUE 'ALLOCATION_QTY',
                 ord_qty           TYPE zust01_scrrow-line_name VALUE 'ORDER_INCOMING_QTY',
                 rem_qty           TYPE zust01_scrrow-line_name VALUE 'REMAINING_QTY',
                 rem_qty_perc      TYPE zust01_scrrow-line_name VALUE 'REMAINING_QTY_PERCENT',
                 stk_recpts        TYPE zust01_scrrow-line_name VALUE 'MT_STOCK_AND_RECEIPTS',
                 stk_recpts_cumltd TYPE zust01_scrrow-line_name VALUE 'MT_STOCK_AND_RECEIPTS_CUM',
               END OF gs_scrrow.



    METHODS get_prdalcdata
      IMPORTING
        it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
        top              TYPE i OPTIONAL
        skip             TYPE i OPTIONAL
      EXPORTING
        et_business_data TYPE  t_prdalc_data
        et_filter_prdalc TYPE if_rap_query_filter=>tt_name_range_pairs
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.

    METHODS get_prdalc_cvc_data
      IMPORTING
        it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
        top              TYPE i OPTIONAL
        skip             TYPE i OPTIONAL
      EXPORTING
        et_business_data TYPE  t_prdalc_cvc_data
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.

    METHODS get_prdalc_tmesers_data
      IMPORTING
                prodalloccharcvalcombn TYPE zust01_a_prodalloccharcvalcombn-CharcValueCombinationUUID
                it_filter_cond         TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                    TYPE i OPTIONAL
                skip                   TYPE i OPTIONAL
      RETURNING VALUE(rt_data)         TYPE  t_prdalc_tmesers_data
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

* Method to generate the report (Time Series and CVC put together)
    METHODS fill_final_tab
      IMPORTING
                it_filter_cond       TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                it_cvc_data          TYPE t_prdalc_cvc_data
                it_salesord          TYPE t_salesord_summ
                it_buckets           TYPE t_bucket_list
                it_curr_stock        TYPE t_currstock
                it_float_stock       TYPE t_floatstock
      RETURNING VALUE(rt_prod_alloc) TYPE t_prdalloc_cvc_demo
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

* Get Domain values
    METHODS get_domvalues_get
      IMPORTING
                domname        TYPE char30
      RETURNING VALUE(rt_data) TYPE t_prdalloc_cvc_demo
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

  PROTECTED SECTION.

  PRIVATE SECTION.

* Create Buckets for Column Headers
    METHODS create_buckets
      IMPORTING
                it_filter_cond    TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top               TYPE i OPTIONAL
                skip              TYPE i OPTIONAL
      RETURNING VALUE(rt_buckets) TYPE  t_bucket_list
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

*  Get Sales Order Data (Header and Item) and populate bucket index for column mapping
    METHODS get_salesord_data
      IMPORTING
                it_filter_cond     TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                TYPE i OPTIONAL
                skip               TYPE i OPTIONAL
                it_date_range      TYPE rt_dats
                it_buckets         TYPE t_bucket_list
      RETURNING VALUE(rt_salesord) TYPE  t_salesord_summ
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

*  Get Sales Order Item Level
    METHODS get_salesord_itm
      IMPORTING
                it_filter_cond TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top            TYPE i OPTIONAL
                skip           TYPE i OPTIONAL
                it_date_range  TYPE rt_dats

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
                it_date_range  TYPE rt_dats

      RETURNING VALUE(rt_data) TYPE  t_salesord_hdr
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS clear_quantity
      CHANGING cs_data TYPE zust01_ce_prodallocation
      RAISING
               /iwbep/cx_cp_remote
               /iwbep/cx_gateway
               cx_web_http_client_error
               cx_http_dest_provider_error.

*  Get Stock
    METHODS get_current_stock
      IMPORTING
                it_filter_cond       TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                  TYPE i OPTIONAL
                skip                 TYPE i OPTIONAL
                it_date_range        TYPE rt_dats
                it_cvc_data          TYPE t_prdalc_cvc_data

      RETURNING VALUE(rt_curr_stock) TYPE  t_currstock
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

*  Get Stock
    METHODS get_floating_stock
      IMPORTING
                it_filter_cond        TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                   TYPE i OPTIONAL
                skip                  TYPE i OPTIONAL
                it_date_range         TYPE rt_dats
                it_cvc_data           TYPE t_prdalc_cvc_data
                it_buckets            TYPE t_bucket_list

      RETURNING VALUE(rt_float_stock) TYPE  t_floatstock
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.


*    Fill-in Time Series Data to the final table
    METHODS m_fill_allocation_qty
      IMPORTING
                is_cvc_keyflds      TYPE zust01_ce_prodallocation
                is_cvc_data         TYPE zust01_a_prodalloccharcvalcomb
                is_keyfigures       TYPE if_rap_query_filter=>ty_name_range_pairs
                it_scrrow           TYPE gty_t_scrrow
                it_buckets          TYPE t_bucket_list
                it_filter_cond      TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                iv_planningscr      TYPE zust01_fmc_amc_planning_screen OPTIONAL
      RETURNING VALUE(rt_prodalloc) TYPE t_prdalloc_cvc_demo
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.


*    Fill-in ORDER INCOMING QTY
    METHODS m_fill_ORDER_INCOMING_QTY
      IMPORTING
                is_cvc_keyflds      TYPE zust01_ce_prodallocation
                is_cvc_data         TYPE zust01_a_prodalloccharcvalcomb
                is_keyfigures       TYPE if_rap_query_filter=>ty_name_range_pairs
                it_scrrow           TYPE gty_t_scrrow
                it_buckets          TYPE t_bucket_list
                it_salesord         TYPE t_salesord_summ
                it_filter_cond      TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                iv_planningscr      TYPE zust01_fmc_amc_planning_screen OPTIONAL
      RETURNING VALUE(rt_prodalloc) TYPE t_prdalloc_cvc_demo
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

* REMAINING_QTY
    METHODS m_fill_REMAINING_QTY
      IMPORTING
                is_cvc_data    TYPE zust01_a_prodalloccharcvalcomb
                is_keyfigures  TYPE if_rap_query_filter=>ty_name_range_pairs
                it_scrrow      TYPE gty_t_scrrow
                it_filter_cond TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                iv_planningscr      TYPE zust01_fmc_amc_planning_screen OPTIONAL
      CHANGING  ct_prodalloc   TYPE t_prdalloc_cvc_demo
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.


**   004 - MT_STOCK_AND_RECEIPTS
    METHODS m_fill_MT_STOCK_AND_RECEIPTS
      IMPORTING
                is_cvc_data         TYPE zust01_a_prodalloccharcvalcomb
                is_keyfigures       TYPE if_rap_query_filter=>ty_name_range_pairs
                it_scrrow           TYPE gty_t_scrrow
                it_buckets          TYPE t_bucket_list
                it_curr_stock       TYPE t_currstock
                it_float_stock      TYPE t_floatstock
                it_filter_cond      TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                iv_planningscr      TYPE zust01_fmc_amc_planning_screen OPTIONAL
      RETURNING VALUE(rt_prodalloc) TYPE t_prdalloc_cvc_demo
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS m_patch_update
      IMPORTING
        it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
        top              TYPE i OPTIONAL
        skip             TYPE i OPTIONAL
      EXPORTING
        et_business_data TYPE  t_prdalc_data
        et_filter_prdalc TYPE if_rap_query_filter=>tt_name_range_pairs
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.


      METHODS execute_action
      IMPORTING i_action_name      TYPE string
                i_query_parameters TYPE if_web_http_request=>name_value_pairs OPTIONAL
      RETURNING VALUE(response)    TYPE string
      RAISING   cx_http_dest_provider_error
                cx_web_http_client_error .

ENDCLASS.



CLASS ZUST01_CL_PRODALLOCATION IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_prdalc_data         TYPE TABLE OF zust01_a_prodallocationobject,
          lt_prdalc_cvc_data     TYPE TABLE OF zust01_a_prodalloccharcvalcombn,
          lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie,
          lt_filter_conditions   TYPE if_rap_query_filter=>tt_name_range_pairs.

    TRY.

*        out->write( lt_prdalc_tmesers_data ).


    DATA query_parameters TYPE if_web_http_request=>name_value_pairs  .
    DATA : action_name TYPE string,
           lv_settoactive TYPE c.

    query_parameters = VALUE #( ( name = 'CharcValueCombinationUUID' value = |guid'000d3adf-a6f0-1eda-bdf5-dc74bbe68465'| ) ).
    action_name = 'SetLifecycleStatusToInactive'.
    if lv_settoactive is initial.
        action_name = 'SetLifecycleStatusToInactive'.
    ELSE.
        action_name = 'SetLifecycleStatusToActive'.
    ENDIF.

    TRY.
        DATA(response) = execute_action(
          EXPORTING
            i_action_name        = action_name
            i_query_parameters   = query_parameters
        ).
        out->write( |response: { response } | ).
      CATCH cx_http_dest_provider_error INTO DATA(http_dest_provider_error).
        "handle exception
        out->write( http_dest_provider_error->get_longtext(  ) ).
      CATCH cx_web_http_client_error INTO DATA(web_http_client_error).
        "handle exception
        out->write( web_http_client_error->get_longtext(  ) ).
    ENDTRY.


      CATCH cx_root INTO DATA(exception).
        out->write( cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ) ).
    ENDTRY.

  ENDMETHOD.


  METHOD execute_action.

    DATA(demo_mode) = abap_false.

    DATA http_header_fields  TYPE if_web_http_request=>name_value_pairs  .

    http_header_fields = VALUE #( ( name = if_web_http_header=>accept value = |application/json| )
                                  ( name = if_web_http_header=>content_type value =  |application/json|  )
                                  ( name = 'x-csrf-token' value = 'fetch' ) ).

    DATA(service_relative_url) = '/sap/opu/odata/sap/API_PRODUCT_ALLOCATION_OBJECT_SRV/'.
    DATA(sap_client) = '100'.
    DATA(destination_name_in_dest_srv) = 'S4H'.

    "Destination Required for Basic Authentication. Credentials are stored in the SAP BTP destination service
    DATA(lo_http_destination) = cl_http_destination_provider=>create_by_cloud_destination(
                                  i_name                  =  'S4H'
                                  i_authn_mode            = if_a4c_cp_service=>service_specific
                                ).
    DATA(relative_url) = |{ service_relative_url }?sap-client={ sap_client }|.

    DATA(http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ).

    "remove any white spaces since the method set_uri_path does not check for white spaces
    CONDENSE relative_url NO-GAPS.

    " GET CSRF token
    http_client->get_http_request( )->set_uri_path( i_uri_path = relative_url ).
    http_client->get_http_request( )->set_header_fields( http_header_fields ).

    DATA(http_response) = http_client->execute( if_web_http_client=>get ).  "--> works
    DATA(http_status_code) = http_response->get_status( ).
    DATA(x_csrf_token) =  http_response->get_header_field( 'x-csrf-token' ).
    DATA(http_response_body) =  http_response->get_text( ).


    " Prepare POST request
    IF demo_mode = abap_false.
      relative_url = |{ service_relative_url }{ i_action_name }?sap-client={ sap_client }&{ i_query_parameters[ 1 ]-name }={ i_query_parameters[ 1 ]-value  } |.
      "remove any white spaces since the method set_uri_path does not check for white spaces
      CONDENSE relative_url NO-GAPS.
    ELSE.
      EXIT.
    ENDIF.

    http_client->get_http_request( )->set_uri_path( i_uri_path = relative_url ).

    http_header_fields = VALUE #( ( name = if_web_http_header=>accept value = |application/json| )
                                  ( name = 'x-csrf-token' value =  x_csrf_token ) ).

    http_client->get_http_request( )->set_header_fields( http_header_fields ).

*   DATA(http_request_body) = | { add json string } |.
*   http_client->get_http_request( )->set_text( http_request_body ).

    http_response = http_client->execute( if_web_http_client=>post ).
    http_status_code = http_response->get_status( ).
    response =  http_response->get_text( ).

  ENDMETHOD.


  METHOD get_prdalcdata.
    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response     TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.

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

    DATA(lt_filter_cond) = it_filter_cond[].
    DELETE lt_filter_cond WHERE name <> 'PLANNINGSCREEN'.

    IF lines( lt_filter_cond ) GT 0.
      DATA(lv_planning_scr) = VALUE #( lt_filter_cond[ 1 ]-range[ 1 ]-low DEFAULT '' ).
    ENDIF.


    SELECT SINGLE *
        FROM zust01_scrheadv
        WHERE planning_screen = @lv_planning_scr
        INTO @DATA(ls_planscr).

    IF sy-subrc EQ 0.


    ENDIF.


    TRY.

        LOOP AT lt_filter_cond ASSIGNING FIELD-SYMBOL(<lfs_cond>).

          <lfs_cond>-range[ 1 ]-low = |{ ls_planscr-product_allocation_object }|.

          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'PRODUCTALLOCATIONOBJECT'
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

        lo_response->get_business_data( IMPORTING et_business_data = et_business_data ).
        et_filter_prdalc[] = lt_filter_cond[].
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.
  ENDMETHOD.


  METHOD get_prdalc_cvc_data.
    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response     TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_resource     TYPE REF TO /iwbep/if_cp_resource_list.

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
            iv_service_definition_name = 'ZUST01_FMC_ALLOC_MGMT_SC'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_PRODUCT_ALLOCATION_OBJECT_SRV/' ).


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCCHARCVALCOMBN' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).



        LOOP AT it_filter_cond ASSIGNING FIELD-SYMBOL(<lfs_cond>).


          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'PRODUCTALLOCATIONOBJECT'
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

        lo_response->get_business_data( IMPORTING et_business_data = et_business_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.
  ENDMETHOD.


  METHOD get_prdalc_tmesers_data.

    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response     TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_resource     TYPE REF TO /iwbep/if_cp_resource_list.

    DATA lt_prdalc_cvc_data TYPE TABLE OF zust01_a_prodalloccharcvalcombn.
    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
    DATA: lo_entity_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_target_list_resource TYPE REF TO /iwbep/if_cp_resource_list.

    TYPES: BEGIN OF ty_entity_key,
             CharcValueCombinationUUID TYPE zust01_a_prodalloccharcvalcombn-CharcValueCombinationUUID,
           END OF ty_entity_key.

    DATA: ls_entity_key          TYPE ty_entity_key,
          lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie.



    ls_entity_key = VALUE #(
     CharcValueCombinationUUID =  prodalloccharcvalcombn ).

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

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCCHARCVALCOMBN' )->navigate_with_key( ls_entity_key )->navigate_to_many( '_PRODALLOCOBJTIMESERIESTP' )->create_request_for_read(  ).

*       Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        DATA(lt_filter_cond) = it_filter_cond.
        DELETE lt_filter_cond WHERE name <> 'PRODALLOCPERDSTARTUTCDATETIME'.
        LOOP AT lt_filter_cond ASSIGNING FIELD-SYMBOL(<lfs_cond>).

          <lfs_cond>-range[ 1 ]-low = |{ <lfs_cond>-range[ 1 ]-low }000000|.
          <lfs_cond>-range[ 1 ]-high = |{ <lfs_cond>-range[ 1 ]-high }000000|.

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

        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = rt_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception
    ENDTRY.

  ENDMETHOD.


  METHOD if_rap_query_provider~select.

    DATA lt_prdalc_cvc_data TYPE TABLE OF zust01_a_prodalloccharcvalcombn.
    DATA lt_prdalc_data TYPE TABLE OF zust01_a_prodallocationobject.
    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).
    DATA lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie.

    FIELD-SYMBOLS: <fs_any> TYPE any.

    TRY.

*    m_patch_update(  ).

        DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).

*   Get product allocation
        get_prdalcdata(
        EXPORTING
            it_filter_cond   = filter_condition
          IMPORTING
            et_business_data = lt_prdalc_data
            et_filter_prdalc = DATA(lt_filter_prdalc) ).

        IF lt_prdalc_data IS NOT INITIAL.

*       Get and Create CVC Records
          get_prdalc_cvc_data(
            EXPORTING
              it_filter_cond   = lt_filter_prdalc
              top              = CONV i( top )
              skip             = CONV i( skip )
            IMPORTING
              et_business_data = lt_prdalc_cvc_data ).


*   create a bucket list for column headers
          DATA(lt_bucketlist) = create_buckets(
                                      EXPORTING
                                        top            = 12
                                        it_filter_cond = filter_condition ).

*   create date range criteria out of the bucket list
          DATA(lv_endcount) = lines( lt_bucketlist ).
          DATA(lr_t_date) = VALUE rt_dats( LET s = 'I'
                                               o = 'BT'
                                           IN sign   = s
                                              option = o
                                         ( low  = |{ lt_bucketlist[ 1 ]-tstfr }000000|
                                           high = |{ lt_bucketlist[ lv_endcount ]-tstfr }000000| ) ).

*       Get Sales Order Data based on Date filters
          DATA(lt_salesord) = get_salesord_data( EXPORTING
                                                    it_date_range = lr_t_date
                                                    it_buckets    = lt_bucketlist ).


          DATA(lt_float_stock) = get_floating_stock( it_filter_cond = filter_condition
                                                     it_date_range  = lr_t_date
                                                     it_cvc_data    = lt_prdalc_cvc_data
                                                     it_buckets     = lt_bucketlist ).
*       get current stock
          DATA(lt_curr_stock) = get_current_stock( it_filter_cond = filter_condition
                                                      it_date_range  = lr_t_date
                                                      it_cvc_data    = lt_prdalc_cvc_data ).



*       Processing and validation of data
          DATA(lt_final_data) = fill_final_tab(
                                   EXPORTING
                                     it_filter_cond = filter_condition
                                     it_cvc_data    = lt_prdalc_cvc_data
                                     it_salesord    = lt_salesord
                                     it_buckets     = lt_bucketlist
                                     it_curr_stock  = lt_curr_stock
                                     it_float_stock = lt_float_stock  ).


*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_final_data ) ).
          io_response->set_data( lt_final_data ).


        ENDIF.

      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.
  ENDMETHOD.


  METHOD get_salesord_data.



*       Get Sales Order HDR based on Date filters
    DATA(lt_saleord_hdr) = get_salesorder_hdr( it_date_range ).
    SORT lt_saleord_hdr BY salesorder.


*       Get Sales Order Data based on Date filters
    DATA(lt_salesord_itm) = get_salesord_itm( it_date_range ).
    SORT lt_salesord_itm BY salesorder.


    LOOP AT lt_salesord_itm ASSIGNING FIELD-SYMBOL(<fs_itm>).

      APPEND INITIAL LINE TO rt_salesord ASSIGNING FIELD-SYMBOL(<fs_salesord>).
      <fs_salesord>-ProductionPlant = <fs_itm>-ProductionPlant.
      <fs_salesord>-material      = <fs_itm>-Material.
      <fs_salesord>-customergrp   = <fs_itm>-CustomerGroup.
      <fs_salesord>-orderqty      = <fs_itm>-RequestedQuantity.
      <fs_salesord>-soldtoparty   = VALUE #( lt_saleord_hdr[ SalesOrder = <fs_itm>-salesorder ]-SoldToParty DEFAULT '' ).



      CONVERT TIME STAMP VALUE #( lt_saleord_hdr[ SalesOrder = <fs_itm>-salesorder ]-SalesOrderDate DEFAULT '' ) TIME ZONE 'UTC'
          INTO DATE DATA(lv_date) TIME DATA(lv_time)
          DAYLIGHT SAVING TIME DATA(lv_dst).



      LOOP AT it_buckets INTO DATA(ls_buckets).

        IF lv_date GE ls_buckets-tstfr
         AND lv_date LE ls_buckets-tstto.

          <fs_salesord>-bucketidx = ls_buckets-column_idx.
          EXIT.
        ENDIF.

      ENDLOOP.

    ENDLOOP.

    IF lines( rt_salesord ) GT 0.
      SORT rt_salesord BY material
                          customergrp
                          soldtoparty.
    ENDIF.

  ENDMETHOD.


  METHOD get_salesord_itm.

    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response     TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_resource     TYPE REF TO /iwbep/if_cp_resource_list.


    DATA lt_prdalc_cvc_data TYPE TABLE OF zust01_a_prodalloccharcvalcombn.
    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
    DATA: lo_entity_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_target_list_resource TYPE REF TO /iwbep/if_cp_resource_list.

    TYPES: BEGIN OF ty_salesorder_key,
             SalesOrder     TYPE zsc01a_salesorder-SalesOrder,
             SalesOrderItem TYPE zsc01a_salesorder-SalesOrder,
           END OF ty_salesorder_key.

    DATA: ls_entity_key          TYPE ty_salesorder_key,
          lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie.

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



        lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'BILLINGDOCUMENTDATE'
                                                             it_range         = it_date_range ).
        IF lo_filter_node_root IS INITIAL.
          lo_filter_node_root = lo_filter_node.
        ELSE.
          lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
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
    DATA: lo_http_client  TYPE REF TO if_web_http_client,
          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response     TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_resource     TYPE REF TO /iwbep/if_cp_resource_list.


    DATA lt_prdalc_cvc_data TYPE TABLE OF zust01_a_prodalloccharcvalcombn.
    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
    DATA: lo_entity_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_target_list_resource TYPE REF TO /iwbep/if_cp_resource_list.

    TYPES: BEGIN OF ty_salesorder_key,
             SalesOrder     TYPE zsc01a_salesorder-SalesOrder,
             SalesOrderItem TYPE zsc01a_salesorder-SalesOrder,
           END OF ty_salesorder_key.

    DATA: ls_entity_key          TYPE ty_salesorder_key,
          lt_prdalc_tmesers_data TYPE TABLE OF zust01_a_prodallocobjtimeserie.

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



        lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'BILLINGDOCUMENTDATE'
                                                             it_range         = it_date_range ).
        IF lo_filter_node_root IS INITIAL.
          lo_filter_node_root = lo_filter_node.
        ELSE.
          lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
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


  METHOD create_buckets.



    TRY.
        DATA lv_date TYPE datn.

        DATA(ls_filter) = VALUE #( it_filter_cond[ name = 'PRODALLOCPERDSTARTUTCDATETIME' ] ) .
        IF NOT ls_filter IS INITIAL.
          IF lines( ls_filter-range ) GT 0.
            DATA(ls_start_date) = VALUE #( ls_filter-range[ 1 ]-low DEFAULT '' ).
            DATA(ls_end_date) = VALUE #( ls_filter-range[ 1 ]-high DEFAULT '' ).
          ENDIF.
        ENDIF.

        DATA(lv_flg_stop) = abap_false.
        lv_date = ls_start_date.

        DATA(lv_idx) = 1.
        WHILE lv_flg_stop IS INITIAL.
          APPEND INITIAL LINE TO rt_buckets ASSIGNING FIELD-SYMBOL(<fs_buckets>).

          <fs_buckets>-column_idx   = lv_idx.
          <fs_buckets>-display_name = |{ lv_date DATE = USER }|.
          <fs_buckets>-tstfr        = lv_date.
          <fs_buckets>-tstto        = lv_date + 6.


          lv_date = lv_date + 7.
          lv_idx  = lv_idx + 1.

          IF lv_date GT ls_end_date.
            lv_flg_stop =  abap_true.
          ENDIF.

          IF NOT top IS INITIAL.
            IF lv_idx GT top.
              lv_flg_stop =  abap_true.
            ENDIF.
          ENDIF.
        ENDWHILE.




      CATCH cx_root INTO DATA(lo_err).

        DATA(lv_errmsg) = lo_err->get_longtext(  ).

    ENDTRY.


  ENDMETHOD.


  METHOD fill_final_tab.


    TYPES: ltt_line_name    TYPE RANGE OF zust01_scrrow-line_name.
    DATA: lo_struct_descr   TYPE REF TO cl_abap_structdescr.
    DATA: ls_salesord      LIKE LINE OF it_salesord,
          ls_data          LIKE LINE OF rt_prod_alloc,
          ls_filter_def    TYPE if_rap_query_filter=>ty_name_range_pairs,
          ls_prodalloc_cvc TYPE zust01_ce_prodallocation,
          ls_currstk_def   TYPE zust01_materialmultistockbydat.

    FIELD-SYMBOLS: <fs_any>    TYPE any,
                   <fs_ordqty> TYPE any,
                   <fs_remqty> TYPE any.


*   Get the planning screen sent from UI
    DATA(ls_filter_cond_plscr)  = VALUE #( it_filter_cond[ name = 'PLANNINGSCREEN' ] DEFAULT ls_filter_def ).
    DATA(lv_planning_scr)       = VALUE #( ls_filter_cond_plscr-range[ 1 ]-low DEFAULT 'ZUST_FMC_ALLOC_DEMO'  ).

*  Get the KeyFigures From the filters coming from UI
    DATA(ls_filter_cond) = VALUE #( it_filter_cond[ name = 'KEYFIGURE' ] DEFAULT ls_filter_def ).
    DATA(lr_t_line_name) = VALUE ltt_line_name( FOR lwa_line_name IN ls_filter_cond-range
                                                  LET s = 'I'
                                                      o = 'EQ'
                                                    IN sign   = s
                                                       option = o
                                                ( low = lwa_line_name-low  ) ).


*  Get the SCRROW data for dynamic Keyfigures display
    DATA(lt_scrrow) = VALUE gty_t_scrrow( ).
    SELECT *
        FROM zust01_scrrow
         WHERE planning_screen = @lv_planning_scr
           AND line_name IN @lr_t_line_name
         INTO CORRESPONDING FIELDS OF TABLE @lt_scrrow.

    IF sy-subrc EQ 0.
        SORT lt_scrrow by line_name.
    ENDIF.



*  Get the SCRCOL data for CVC Description to display on UI
    SELECT *
        FROM zust01_scrcol
         WHERE planning_screen EQ @lv_planning_scr
         INTO TABLE @DATA(lt_scrcol).

    IF sy-subrc EQ 0.
      SORT lt_scrcol BY sorting ASCENDING.

      LOOP AT lt_scrcol INTO DATA(ls_scrcol).
        DATA(lv_tabix) = sy-tabix.
        DATA(lv_alloccvc) = |ProdAllocCVC0{ lv_tabix }|.

        ASSIGN COMPONENT lv_alloccvc OF STRUCTURE ls_prodalloc_cvc TO <fs_any>.
        <fs_any> = ls_scrcol-description.

        ls_prodalloc_cvc-PlanningScreen = lv_planning_scr.

      ENDLOOP.
    ENDIF.

    LOOP AT it_cvc_data INTO DATA(ls_cvc).

**    001 - ALLOCATION_QTY
      if NOT VALUE #( lt_scrrow[ line_name = gs_scrrow-alc_qty ]-line_name DEFAULT '' ) is INITIAL.

          APPEND LINES OF m_fill_allocation_qty(  EXPORTING
                                                    is_cvc_keyflds = ls_prodalloc_cvc
                                                    is_cvc_data    = ls_cvc
                                                    is_keyfigures  = ls_filter_cond
                                                    it_scrrow      = lt_scrrow
                                                    it_buckets     = it_buckets
                                                    it_filter_cond = it_filter_cond
                                                    iv_planningscr = CONV #( lv_planning_scr )  ) TO rt_prod_alloc.

      ENDIF.

**    002 - ORDER_INCOMING_QTY
      if NOT VALUE #( lt_scrrow[ line_name = gs_scrrow-ord_qty ]-line_name DEFAULT '' ) is INITIAL.

          APPEND LINES OF m_fill_order_incoming_qty(  EXPORTING
                                                         is_cvc_keyflds = ls_prodalloc_cvc
                                                         is_cvc_data    = ls_cvc
                                                         is_keyfigures  = ls_filter_cond
                                                         it_scrrow      = lt_scrrow
                                                         it_buckets     = it_buckets
                                                         it_salesord    = it_salesord
                                                         it_filter_cond = it_filter_cond
                                                         iv_planningscr = CONV #( lv_planning_scr )  ) TO rt_prod_alloc.


     ENDIF.

**  003 - REMAINING_QTY_PERCENT
      if NOT VALUE #( lt_scrrow[ line_name = gs_scrrow-rem_qty_perc ]-line_name DEFAULT '' ) is INITIAL.

          DATA(lv_keyfigure) = VALUE #( ls_filter_cond-range[ low = gs_scrrow-rem_qty_perc ]-low DEFAULT '' ).
          IF NOT lv_keyfigure IS INITIAL.

            DATA(lv_keyfigure_dsc)  = VALUE #( lt_scrrow[ line_name = lv_keyfigure ]-description DEFAULT '' ).


            APPEND INITIAL LINE TO rt_prod_alloc ASSIGNING FIELD-SYMBOL(<fs_data>).
            <fs_data> = CORRESPONDING #( ls_cvc ).
            <fs_data>-KeyFigure = lv_keyfigure_dsc.
            <fs_data>-KeyFigureID = 3.


*            Clear quantity data.
            clear_quantity( CHANGING cs_data = <fs_data> ).


          ENDIF.
      ENDIF.

**   004 - REMAINING_QTY
       if NOT VALUE #( lt_scrrow[ line_name = gs_scrrow-rem_qty ]-line_name DEFAULT '' ) is INITIAL.
          m_fill_remaining_qty(  EXPORTING
                                   is_cvc_data    = ls_cvc
                                   is_keyfigures  = ls_filter_cond
                                   it_scrrow      = lt_scrrow
                                   it_filter_cond = it_filter_cond
                                   iv_planningscr = CONV #( lv_planning_scr )
                                 CHANGING
                                    ct_prodalloc = rt_prod_alloc ) .
        ENDIF.
**   005 - MT_STOCK_AND_RECEIPTS
       if NOT VALUE #( lt_scrrow[ line_name = gs_scrrow-stk_recpts ]-line_name DEFAULT '' ) is INITIAL.

          APPEND LINES OF m_fill_mt_stock_and_receipts(  EXPORTING
                                                             is_cvc_data    = ls_cvc
                                                             is_keyfigures  = ls_filter_cond
                                                             it_scrrow      = lt_scrrow
                                                             it_buckets     = it_buckets
                                                             it_curr_stock  = it_curr_stock
                                                             it_float_stock = it_float_stock
                                                             it_filter_cond = it_filter_cond
                                                             iv_planningscr = CONV #( lv_planning_scr )  ) TO rt_prod_alloc.
       ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD get_domvalues_get.

*    SELECT *
*        FROM dd07l
*        INTO TABLE @DATA(lt_table).

    IF sy-subrc EQ 0.

    ENDIF.
*    IF bypass_buffer = 'X'.
*       SELECT * FROM dd07l BYPASSING BUFFER
*              WHERE domname   = domname AND
*                    as4local   = active.
*           MOVE-CORRESPONDING dd07l TO dd07v_tab.
*           APPEND dd07v_tab.
*       ENDSELECT.
*    ELSE.
*       SELECT * FROM dd07l
*              WHERE domname   = domname AND
*                    as4local   = active.
*           MOVE-CORRESPONDING dd07l TO dd07v_tab.
*           APPEND dd07v_tab.
*       ENDSELECT.
*    ENDIF.
*
*    rc = sy-subrc.
  ENDMETHOD.


  METHOD clear_quantity.
    CLEAR:
          cs_data-ProductAllocationQty1,
          cs_data-ProductAllocationQty2,
          cs_data-ProductAllocationQty3,
          cs_data-ProductAllocationQty4,
          cs_data-ProductAllocationQty5,
          cs_data-ProductAllocationQty6,
          cs_data-ProductAllocationQty7,
          cs_data-ProductAllocationQty8,
          cs_data-ProductAllocationQty9,
          cs_data-ProductAllocationQty10,
          cs_data-ProductAllocationQty11,
          cs_data-ProductAllocationQty12.
  ENDMETHOD.


  METHOD get_floating_stock.

*    DATA: ls_filter_def     TYPE if_rap_query_filter=>ty_name_range_pairs.
    DATA(lo_stock) = NEW zust01_cl_stock(  ).

    DATA: lo_tabtype     TYPE REF TO cl_abap_tabledescr,
          lo_struct_type TYPE REF TO cl_abap_structdescr,
          lr_data        TYPE REF TO data,
          lt_comp_tab    TYPE cl_abap_structdescr=>component_table,
          ls_comp_fld    TYPE cl_abap_structdescr=>component,
          ls_filter_def    TYPE if_rap_query_filter=>ty_name_range_pairs.

    FIELD-SYMBOLS: <fs_tab> TYPE ANY TABLE,
                   <fs_fld> TYPE any.


    DATA:
        lo_ref TYPE REF TO data.

*   Get the planning screen sent from UI
    DATA(ls_filter_cond_plscr)  = VALUE #( it_filter_cond[ name = 'PLANNINGSCREEN' ] DEFAULT ls_filter_def ).
    DATA(lv_planning_scr)       = VALUE #( ls_filter_cond_plscr-range[ 1 ]-low DEFAULT 'ZUST_FMC_ALLOC_DEMO'  ).

    SELECT SINGLE READ_SELECTIONID
        FROM zust01_SCRROW
        WHERE PLANNING_SCREEN = @lv_planning_scr
          AND LINE_NAME = 'MT_STOCK_AND_RECEIPTS'
          INTO @DATA(LV_SELECTIONID).

    if sy-subrc EQ 0.

    ENDIF.

    SELECT SINGLE *
        FROM zust01_selid
            WHERE selection_id = @LV_SELECTIONID
            INTO @DATA(ls_zust01_selid).

    IF sy-subrc EQ 0.
      DATA(lv_table_name) = |zust01_selid_{ ls_zust01_selid-source  }|.
      TRANSLATE lv_table_name TO UPPER CASE.

      CREATE DATA lo_ref TYPE TABLE OF (lv_table_name).


      lo_struct_type ?= cl_abap_typedescr=>describe_by_name( lv_table_name ).
      lt_comp_tab  = lo_struct_type->get_components( ).
      lo_struct_type = cl_abap_structdescr=>create( lt_comp_tab ).
      lo_tabtype     = cl_abap_tabledescr=>create( lo_struct_type ).

      CREATE DATA lr_data TYPE HANDLE lo_tabtype.
      ASSIGN lr_data->* TO <fs_tab>.


      SELECT *
          FROM (lv_table_name)
              WHERE selection_id  = @ls_zust01_selid-selection_id
              INTO TABLE @<fs_tab>.

      IF sy-subrc EQ 0.

        IF lv_table_name = 'ZUST01_SELID_D'.

          LOOP AT <fs_tab> ASSIGNING FIELD-SYMBOL(<fs>).

            gs_selid_d = CORRESPONDING #( <fs> ).
            IF <fs> IS NOT INITIAL.
              EXIT.
            ENDIF.

          ENDLOOP.


**  Generate allowed Material Element Category
          DATA(lr_t_matelemcat) = VALUE if_rap_query_filter=>tt_range_option( ).
          LOOP AT lt_comp_tab ASSIGNING FIELD-SYMBOL(<fs_comp>).

            ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE gs_selid_d TO <fs_fld>.
            DATA(lr_s_range) = VALUE if_rap_query_filter=>ty_range_option( sign = 'I'
                                                                              option = 'EQ' ).

            IF NOT <fs_fld> IS INITIAL.
              CASE <fs_comp>-name.

                WHEN 'SHIPPING_NOTIFICATIONS'.
                  lr_s_range-low = 'LA'.
                  APPEND lr_s_range TO lr_t_matelemcat.


                WHEN 'NO_RECEIPTS_IN_PAST'.
*                            TBD
                WHEN 'DELIVERIES'.
                  lr_s_range-low = 'VJ'.
                  APPEND lr_s_range TO lr_t_matelemcat.

                WHEN 'RESERVATIONS'.
                  lr_s_range-low = 'MR'.
                  APPEND lr_s_range TO lr_t_matelemcat.


                WHEN 'DEPENDENT_REQUIREMENTS'.
                  lr_s_range-low = 'SB'.
                  APPEND lr_s_range TO lr_t_matelemcat.


              ENDCASE.
            ENDIF.

*
            IF <fs_fld> = 'X'.
              CASE <fs_comp>-name.
                WHEN 'PURCHASE_ORDERS'.
                  lr_s_range-low = 'BE'.
                  APPEND lr_s_range TO lr_t_matelemcat.


                WHEN 'STOCK_QUALITY'.
                  lr_s_range-low = 'S2'.
                  APPEND lr_s_range TO lr_t_matelemcat.

                WHEN 'PURCHASE_REQUISITIONS'.
                  lr_s_range-low = 'BA'.
                  APPEND lr_s_range TO lr_t_matelemcat.


                WHEN 'PLANNED_ORDERS'.
                  lr_s_range-low = 'PA'.
                  APPEND lr_s_range TO lr_t_matelemcat.


                WHEN 'PRODUCTION_ORDERS'.

                  lr_s_range-low = 'FE'.
                  APPEND lr_s_range TO lr_t_matelemcat.

                WHEN 'SALES_ORDERS'.
                  lr_s_range-low = 'VC'.
                  APPEND lr_s_range TO lr_t_matelemcat.


                WHEN 'STO_REQUIREMENTS'.
                  lr_s_range-low = 'UR'.
                  APPEND lr_s_range TO lr_t_matelemcat.

                WHEN 'DEPENDENT_RESERVATIONS'.
                  lr_s_range-low = 'AR'.
                  APPEND lr_s_range TO lr_t_matelemcat.

              ENDCASE.
            ENDIF.




          ENDLOOP.

        ENDIF.
      ENDIF.



    ENDIF.




    SELECT DISTINCT ProdAllocCharc01
        FROM @it_cvc_data AS a
        INTO TABLE @DATA(lt_material).
    IF sy-subrc EQ 0.

    ENDIF.



*  Generate material filter for pulling the data
    DATA(lr_t_material)   = VALUE if_rap_query_filter=>tt_range_option( FOR lwa_material IN lt_material
                                                                        LET s = 'I'
                                                                           o = 'EQ'
                                                                        IN sign   = s
                                                                           option = o
                                                                    ( low = lwa_material-ProdAllocCharc01 ) ).

    DATA(lt_filter) = VALUE if_rap_query_filter=>tt_name_range_pairs(
                                                                      ( name = 'MATERIAL'
                                                                        range = lr_t_material )
                                                                      ).


    DATA(lt_float_stk) = lo_stock->get_floating_stock( EXPORTING
                                                         it_filter_cond = lt_filter ).


    SELECT a~*
        FROM @lt_float_stk AS a
            WHERE mrpelementcategory IN @lr_t_matelemcat
              AND mrpelementavailyorrqmtdate IN @it_date_range
            INTO TABLE @DATA(lt_float_stk_fin).
    IF sy-subrc EQ 0.

      LOOP AT lt_float_stk_fin ASSIGNING FIELD-SYMBOL(<fs_float_stk>).

        APPEND INITIAL LINE TO rt_float_stock ASSIGNING FIELD-SYMBOL(<fs_return>).
        <fs_return> = CORRESPONDING #( <fs_float_stk> ).



        CONVERT TIME STAMP <fs_float_stk>-MRPElementAvailyOrRqmtDate TIME ZONE sy-zonlo
            INTO DATE DATA(lv_date) TIME DATA(lv_time)
            DAYLIGHT SAVING TIME DATA(lv_dst).


        LOOP AT it_buckets INTO DATA(ls_buckets).


          IF lv_date GE ls_buckets-tstfr
           AND lv_date LE ls_buckets-tstto.

            <fs_return>-bucketidx = ls_buckets-column_idx.
            EXIT.
          ENDIF.

        ENDLOOP.

      ENDLOOP.
    ENDIF.
*

  ENDMETHOD.


  METHOD get_current_stock.
*> Start of modification
    TYPES: ltt_line_name    TYPE RANGE OF zust01_scrrow-line_name.
    DATA: ls_filter_def     TYPE if_rap_query_filter=>ty_name_range_pairs.
    DATA(lo_stock) = NEW zust01_cl_stock(  ).



    SELECT DISTINCT ProdAllocCharc01
        FROM @it_cvc_data AS a
        INTO TABLE @DATA(lt_material).
    IF sy-subrc EQ 0.

    ENDIF.




*  Get the KeyFigures From the filters coming from UI
    DATA(lr_t_material)   = VALUE if_rap_query_filter=>tt_range_option( FOR lwa_material IN lt_material
                                                                        LET s = 'I'
                                                                           o = 'EQ'
                                                                        IN sign   = s
                                                                           option = o
                                                                    ( low = lwa_material-ProdAllocCharc01 ) ).


    DATA(lt_filter) = VALUE if_rap_query_filter=>tt_name_range_pairs(
                                                                      ( name = 'MATERIAL'
                                                                        range = lr_t_material ) ).


*    GET TIME STAMP FIELD DATA(ts).

    DATA: lv_calendar_dt TYPE rap_cp_odata_v2_edm_datetime.


    lv_calendar_dt = sy-datum.
    DATA(lr_t_date) = VALUE rt_dats( LET s = 'I'
                                                   o = 'GE'
                                               IN sign   = s
                                                  option = o
                                             ( low  = |{ sy-datum }000000.0000000| ) ).



    rt_curr_stock = lo_stock->get_stock( EXPORTING
                                           it_filter_cond = lt_filter ).



*< End of modification
  ENDMETHOD.


  METHOD m_fill_allocation_qty.

    FIELD-SYMBOLS:
      <fs_anyfld> TYPE any.

    DATA(lv_keyfigure)    = VALUE #( is_keyfigures-range[ low = gs_scrrow-alc_qty ]-low DEFAULT '' ).
    IF NOT lv_keyfigure IS INITIAL.

      DATA(lv_keyfigure_dsc)  = VALUE #( it_scrrow[ line_name = lv_keyfigure ]-description DEFAULT '' ).
      APPEND INITIAL LINE TO rt_prodalloc ASSIGNING FIELD-SYMBOL(<fs_prodalloc>).

      <fs_prodalloc> = CORRESPONDING #( is_cvc_data ).
      <fs_prodalloc>-KeyFigure = lv_keyfigure_dsc.
      <fs_prodalloc>-KeyFigureID = 1.

      <fs_prodalloc>-PlanningScreen = iv_planningscr.
      <fs_prodalloc>-ProductAllocationObject = is_cvc_data-ProductAllocationObject.
      <fs_prodalloc>-ProductAllocationObjectUUID = is_cvc_data-ProductAllocationObjectUUID.



      <fs_prodalloc>-ProdAllocCVC01 = is_cvc_keyflds-ProdAllocCVC01.
      <fs_prodalloc>-ProdAllocCVC02 = is_cvc_keyflds-ProdAllocCVC02.
      <fs_prodalloc>-ProdAllocCVC03 = is_cvc_keyflds-ProdAllocCVC03.
      <fs_prodalloc>-ProdAllocCVC04 = is_cvc_keyflds-ProdAllocCVC04.
      <fs_prodalloc>-ProdAllocCVC05 = is_cvc_keyflds-ProdAllocCVC05.
      <fs_prodalloc>-ProdAllocCVC06 = is_cvc_keyflds-ProdAllocCVC06.
      <fs_prodalloc>-ProdAllocCVC07 = is_cvc_keyflds-ProdAllocCVC07.



*     Set the column bucket display
      LOOP AT it_buckets INTO DATA(ls_buckets).
        DATA(lv_tabix)    = sy-tabix.
        DATA(lv_allocdat) = |ProdAllocDate{ lv_tabix }|.

        ASSIGN COMPONENT lv_allocdat OF STRUCTURE <fs_prodalloc> TO <fs_anyfld>.
        <fs_anyfld> = ls_buckets-display_name.

      ENDLOOP.

*     Get the time series data
      DATA(lt_time_series) = get_prdalc_tmesers_data(
                                     EXPORTING
                                       prodalloccharcvalcombn = is_cvc_data-CharcValueCombinationUUID
                                       it_filter_cond         = it_filter_cond
                                      ).

      SORT lt_time_series BY ProdAllocPerdStartUTCDateTime ASCENDING.

      LOOP AT lt_time_series INTO DATA(ls_timesrs) .

        CONVERT TIME STAMP ls_timesrs-ProdAllocPerdStartUTCDateTime TIME ZONE ls_timesrs-ProdAllocPeriodStartTimeZone
            INTO DATE DATA(lv_date) TIME DATA(lv_time)
            DAYLIGHT SAVING TIME DATA(lv_dst).


        lv_tabix = VALUE #( it_buckets[ tstfr = lv_date ]-column_idx DEFAULT 0 ).

        IF lv_tabix IS INITIAL.
          CONTINUE.
        ENDIF.

        DATA(lv_allocqty) = |ProductAllocationQty{ lv_tabix }|.

        ASSIGN COMPONENT lv_allocqty OF STRUCTURE <fs_prodalloc> TO <fs_anyfld>.
        IF sy-subrc = 0.
          <fs_anyfld> = ls_timesrs-ProductAllocationQuantity.
        ENDIF.


        DATA(lv_timeseries) = |TimeSeriesUUID{ lv_tabix }|.
        ASSIGN COMPONENT lv_timeseries OF STRUCTURE <fs_prodalloc> TO <fs_anyfld>.
        IF sy-subrc = 0.
          <fs_anyfld> = ls_timesrs-ProdAllocationTimeSeriesUUID.
        ENDIF.

      ENDLOOP.


    ENDIF.

  ENDMETHOD.


  METHOD m_fill_ORDER_INCOMING_QTY.
    DATA:
       ls_salesord      LIKE LINE OF it_salesord.

    FIELD-SYMBOLS:
      <fs_anyfld> TYPE any.

    DATA(lv_keyfigure)    = VALUE #( is_keyfigures-range[ low = gs_scrrow-ord_qty ]-low DEFAULT '' ).
    IF NOT lv_keyfigure IS INITIAL.

      DATA(lv_keyfigure_dsc)  = VALUE #( it_scrrow[ line_name = lv_keyfigure ]-description DEFAULT '' ).

      APPEND INITIAL LINE TO rt_prodalloc ASSIGNING FIELD-SYMBOL(<fs_prodalloc>).
      <fs_prodalloc> = CORRESPONDING #( is_cvc_data ).
      <fs_prodalloc>-KeyFigure = lv_keyfigure_dsc.
      <fs_prodalloc>-KeyFigureID = 2.

      <fs_prodalloc>-PlanningScreen = iv_planningscr.
      <fs_prodalloc>-ProductAllocationObject = is_cvc_data-ProductAllocationObject.
      <fs_prodalloc>-ProductAllocationObjectUUID = is_cvc_data-ProductAllocationObjectUUID.
      <fs_prodalloc>-line_name = is_cvc_keyflds-line_name.

*        Clear quantity data.
      clear_quantity( CHANGING cs_data = <fs_prodalloc> ).



*     sets the order
      LOOP AT it_buckets ASSIGNING FIELD-SYMBOL(<fs_bucket>).
        DATA(lv_tabix) = sy-tabix.
        DATA(lv_order) = |ProductAllocationQty{ lv_tabix }|.

        ASSIGN COMPONENT lv_order OF STRUCTURE <fs_prodalloc> TO <fs_anyfld>.


        ls_salesord-material    = is_cvc_data-ProdAllocCharc01.
        ls_salesord-customergrp = is_cvc_data-ProdAllocCharc02.
        ls_salesord-soldtoparty = |{ is_cvc_data-ProdAllocCharc03 ALPHA = OUT }|.

        CONDENSE: ls_salesord-material NO-GAPS,
                  ls_salesord-customergrp NO-GAPS,
                  ls_salesord-soldtoparty NO-GAPS.


        DATA(lv_value) = REDUCE #( INIT val TYPE zust_cs_floating_stk-mrpavailablequantity
                                     FOR wa IN
                                     FILTER #( it_salesord
                                               USING KEY key_order
                                               WHERE material      EQ ls_salesord-material
                                                 AND customergrp   EQ ls_salesord-customergrp
                                                 AND soldtoparty   EQ ls_salesord-soldtoparty
                                                 AND bucketidx     EQ lv_tabix  )
                                     NEXT val = val + wa-orderqty ).

        <fs_anyfld> = lv_value.
      ENDLOOP.

    ENDIF.
  ENDMETHOD.


  METHOD m_fill_REMAINING_QTY.
    DATA: ls_salesord TYPE zust01_cs_salesord_summ,
          ls_data     LIKE LINE OF ct_prodalloc.

    FIELD-SYMBOLS: <fs_ordqty>      TYPE any,
                   <fs_remqty>      TYPE any,
                   <fs_remperc_val> TYPE any.

    DATA(lv_keyfigure)    = VALUE #( is_keyfigures-range[ low = gs_scrrow-rem_qty ]-low DEFAULT '' ).
    IF NOT lv_keyfigure IS INITIAL.

      DATA(lv_keyfigure_dsc)  = VALUE #( it_scrrow[ line_name = lv_keyfigure ]-description DEFAULT '' ).

      APPEND INITIAL LINE TO ct_prodalloc ASSIGNING FIELD-SYMBOL(<fs_prodalloc>).
      <fs_prodalloc> = CORRESPONDING #( is_cvc_data ).
      <fs_prodalloc>-KeyFigure = lv_keyfigure_dsc.
      <fs_prodalloc>-KeyFigureID = 4.

      <fs_prodalloc>-PlanningScreen = iv_planningscr.
      <fs_prodalloc>-ProductAllocationObject = is_cvc_data-ProductAllocationObject.
      <fs_prodalloc>-ProductAllocationObjectUUID = is_cvc_data-ProductAllocationObjectUUID.

*        Clear quantity data.
      clear_quantity( CHANGING cs_data = <fs_prodalloc> ).

      ls_salesord-material    = is_cvc_data-ProdAllocCharc01.
      ls_salesord-customergrp = is_cvc_data-ProdAllocCharc02.
      ls_salesord-soldtoparty = |{ is_cvc_data-ProdAllocCharc03 ALPHA = IN }|.


*    Get the data from Allocation Quantity for computation
      DATA(ls_prodalloc) = VALUE #( ct_prodalloc[ ProdAllocCharc01 = ls_salesord-material
                                                  ProdAllocCharc02 = ls_salesord-customergrp
                                                  ProdAllocCharc03 = is_cvc_data-ProdAllocCharc03
                                                  KeyFigureID      = 1 ] DEFAULT ls_data ).

*    Get the data from Incoming Order for computation
     DATA(ls_ordqty) = VALUE #( ct_prodalloc[   ProdAllocCharc01 = ls_salesord-material
                                                ProdAllocCharc02 = ls_salesord-customergrp
                                                ProdAllocCharc03 = is_cvc_data-ProdAllocCharc03
                                                 KeyFigureID     = 2 ] DEFAULT ls_data ).

*   Get and Assign the Remaining Quantity Percent
      READ TABLE ct_prodalloc
        WITH KEY ProdAllocCharc01 = ls_salesord-material
                 ProdAllocCharc02 = ls_salesord-customergrp
                 ProdAllocCharc03 = is_cvc_data-ProdAllocCharc03
                 KeyFigureID      = 3
                 ASSIGNING FIELD-SYMBOL(<fs_remperc>).

      IF sy-subrc EQ 0.

      ENDIF.


      DATA(lv_count) = 1.

      DO 12 TIMES.


        DATA(lv_bucketname) = |ProductAllocationQty{ lv_count }|.
        IF NOT ls_prodalloc IS INITIAL.
          ASSIGN COMPONENT lv_bucketname OF STRUCTURE ls_prodalloc TO FIELD-SYMBOL(<fs_allocqty>).
        ENDIF.

        IF NOT ls_ordqty IS INITIAL.
          ASSIGN COMPONENT lv_bucketname OF STRUCTURE ls_ordqty TO <fs_ordqty>.
        ENDIF.

        IF <fs_prodalloc> IS ASSIGNED.
          ASSIGN COMPONENT lv_bucketname OF STRUCTURE <fs_prodalloc> TO <fs_remqty>.
        ENDIF.


        TRY.
*           Computation for Remaining Quantity and Remaining Percent Quantity
            IF <fs_allocqty> IS ASSIGNED
              AND <fs_ordqty> IS ASSIGNED
              AND <fs_remqty> IS ASSIGNED.

              <fs_remqty> = <fs_allocqty> - <fs_ordqty>.


              IF <fs_remperc> IS ASSIGNED.
                ASSIGN COMPONENT lv_bucketname OF STRUCTURE <fs_remperc> TO <fs_remperc_val>.

                IF  <fs_allocqty> GT 0
                    AND <fs_remqty> GT 0.

                  DATA(lv_perc_val) = ( <fs_remqty> / <fs_allocqty>  ) * 100.

                  <fs_remperc_val> = lv_perc_val.
                ENDIF.

              ENDIF.

            ENDIF.

          CATCH cx_sy_arithmetic_overflow.

          CATCH cx_sy_zerodivide.

        ENDTRY.

        lv_count = lv_count + 1.

      ENDDO.

    ENDIF.

  ENDMETHOD.


  METHOD m_fill_MT_STOCK_AND_RECEIPTS.
*  **   004 - MT_STOCK_AND_RECEIPTS
    FIELD-SYMBOLS: <fs_anyfld> TYPE any.


    DATA(lv_keyfigure) = VALUE #( is_keyfigures-range[ low = gs_scrrow-stk_recpts ]-low DEFAULT '' ).
    IF NOT lv_keyfigure IS INITIAL.



      DATA(lv_keyfigure_dsc)  = VALUE #( it_scrrow[ line_name = lv_keyfigure ]-description DEFAULT '' ).

      APPEND INITIAL LINE TO rt_prodalloc ASSIGNING FIELD-SYMBOL(<fs_prodalloc>).
      <fs_prodalloc> = CORRESPONDING #( is_cvc_data ).
      <fs_prodalloc>-KeyFigure = lv_keyfigure_dsc.
      <fs_prodalloc>-KeyFigureID = 4.

*        Clear quantity data.
      clear_quantity( CHANGING cs_data = <fs_prodalloc> ).

*       Unrestricted [STOCK_UNRESTRICTED]

      DATA(lv_curr_stock) = VALUE #( it_curr_stock[ Material = is_cvc_data-ProdAllocCharc01  ]-CurrentStock DEFAULT 0 ).


      IF gs_selid_d-stock_blocked IS INITIAL.
        lv_curr_stock = lv_curr_stock + VALUE #( it_curr_stock[ Material = is_cvc_data-ProdAllocCharc01  ]-BlockedStockQuantity DEFAULT 0 ).
      ENDIF.

      IF gs_selid_d-stock_safety IS INITIAL.
        lv_curr_stock = lv_curr_stock + VALUE #( it_curr_stock[ Material = is_cvc_data-ProdAllocCharc01  ]-QualityInspectionStockQuantity DEFAULT 0 ).
      ENDIF.

      <fs_prodalloc>-ProductAllocationQty1 = lv_curr_stock.


*     sets the order
      LOOP AT it_buckets ASSIGNING FIELD-SYMBOL(<fs_bucket>).
        DATA(lv_tabix) = sy-tabix.
        DATA(lv_bucket_qty) = |ProductAllocationQty{ lv_tabix }|.

        ASSIGN COMPONENT lv_bucket_qty OF STRUCTURE <fs_prodalloc> TO <fs_anyfld>.


        DATA(lv_material) = is_cvc_data-ProdAllocCharc01.
        CONDENSE: lv_material NO-GAPS.


        DATA(lv_flt_qty) = REDUCE #( INIT val TYPE zust_cs_floating_stk-mrpavailablequantity
                                     FOR wa_floatstk IN
                                     FILTER #( it_float_stock
                                               USING KEY key_material
                                               WHERE material      EQ lv_material
                                                 AND bucketidx     EQ lv_tabix  )
                                     NEXT val = val + wa_floatstk-mrpavailablequantity ).

        <fs_anyfld> = <fs_anyfld> + lv_flt_qty.
      ENDLOOP.




    ENDIF.

    lv_keyfigure = VALUE #( is_keyfigures-range[ low = gs_scrrow-stk_recpts_cumltd ]-low DEFAULT '' ).
    IF NOT lv_keyfigure IS INITIAL.



      lv_keyfigure_dsc  = VALUE #( it_scrrow[ line_name = lv_keyfigure ]-description DEFAULT '' ).

      APPEND INITIAL LINE TO rt_prodalloc ASSIGNING <fs_prodalloc>.
      <fs_prodalloc> = CORRESPONDING #( is_cvc_data ).
      <fs_prodalloc>-KeyFigure = lv_keyfigure_dsc.
      <fs_prodalloc>-KeyFigureID = 4.

*        Clear quantity data.
*      clear_quantity( CHANGING cs_data = <fs_data> ).

*        DATA(lv_curr_stock) = VALUE #( it_curr_stock[ Material = ls_cvc-ProdAllocCharc01  ]-CurrentStock DEFAULT 0 ).
      <fs_prodalloc>-ProductAllocationQty1 = lv_curr_stock.

      <fs_prodalloc>-PlanningScreen = iv_planningscr.
      <fs_prodalloc>-ProductAllocationObject = is_cvc_data-ProductAllocationObject.
      <fs_prodalloc>-ProductAllocationObjectUUID = is_cvc_data-ProductAllocationObjectUUID.


    ENDIF.

  ENDMETHOD.


  METHOD m_patch_update.

TYPES:
    BEGIN OF tys_parameter,
        CharcValueCombinationUUID TYPE sysuuid_x16,
    END OF tys_parameter.

  DATA: lo_http_client  TYPE REF TO if_web_http_client,
*          lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request      TYPE REF TO /iwbep/if_cp_request_update,
          lo_response     TYPE REF TO /iwbep/if_cp_response_update.

DATA: lo_client_proxy      TYPE REF TO /iwbep/if_cp_client_proxy,
    lo_function_resource TYPE REF TO /iwbep/if_cp_resource_function,
    lo_function_request  TYPE REF TO /iwbep/if_cp_request_function,
    lo_function_response TYPE REF TO /iwbep/if_cp_response_function,
    ls_parameter         TYPE tys_parameter.


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

  lo_function_resource = lo_client_proxy->create_resource_for_function( 'SetLifecycleStatusToInactive').
  ls_parameter = VALUE #( CharcValueCombinationUUID = '000D3ADFA6F01EDABDF5DC74BBE68465'  ).


  lo_function_resource->set_parameter( ls_parameter ).
  lo_function_request = lo_function_resource->create_request( ).
*  lo_function_request->set_if_match( ‘2407’ ).

  lo_function_response = lo_function_request->execute(  ).
  CHECK lo_function_response->has_business_data( ) = abap_true.
  lo_function_response->get_business_data( ).

*  lo_function_response->get_business_data( IMPORTING ea_response_data = ls_busi_data ).




*
*    DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*
*    DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
*      i_name       = 'S4H'
*      i_authn_mode = if_a4c_cp_service=>service_specific ).
*
*
*    lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
*      ).
*
*    lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*      EXPORTING
*        iv_service_definition_name = 'ZUST01_FMC_ALLOC_MGMT_SC'
*        io_http_client             = lo_http_client
*        iv_relative_service_root   = '/sap/opu/odata/sap/API_PRODUCT_ALLOCATION_OBJECT_SRV/' ).
*
*
*    " Navigate to the resource and create a request for the read operation
*    DATA(lo_request1) = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCATIONOBJECT' )->create_request_for_update( ).
**lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCATIONOBJECT' )->create_request_for_update( ).
*    " Create the filter tree
**    lo_filter_factory = lo_request->create_filter_factory( ).
*
*    DATA(lt_filter_cond) = it_filter_cond[].
*    DELETE lt_filter_cond WHERE name <> 'PLANNINGSCREEN'.
*
*    IF lines( lt_filter_cond ) GT 0.
*      DATA(lv_planning_scr) = VALUE #( lt_filter_cond[ 1 ]-range[ 1 ]-low DEFAULT '' ).
*    ENDIF.
*
*
*
*
*
*    TRY.
*
*
*
**        IF top > 0.
**          lo_request->set_top( top ).
**        ENDIF.
**
**        lo_request->set_skip( skip ).
*
*        " Execute the request and retrieve the business data
*        lo_response = lo_request->execute( ).
*        lo_response->get_business_data( ).
*
*
*      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
*        " Handle remote Exception
*        " It contains details about the problems of your http(s) connection
*
*      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
*        " Handle Exception
*
*    ENDTRY.

  ENDMETHOD.
ENDCLASS.
