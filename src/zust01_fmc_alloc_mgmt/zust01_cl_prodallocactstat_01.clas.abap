CLASS zust01_cl_prodallocactstat_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.
    INTERFACES if_rap_query_filter.

    TYPES t_prdalc_cvc_data     TYPE TABLE OF zust01_a_prodalloccharcvalcomb WITH DEFAULT KEY.
    TYPES t_prdalloc_act_stat   TYPE TABLE OF zust01_ce_prodallocactstat WITH DEFAULT KEY.
    TYPES t_charcvaluecombUUID  TYPE c LENGTH 40.

    TYPES: BEGIN OF gty_constraint_stat,
            CharcValueCombinationUUID       TYPE c LENGTH 40,
            NewConstraintStatus             TYPE c LENGTH 2,
            OldConstraintStatus             TYPE c LENGTH 2,
           END OF gty_constraint_stat,
           gtt_constraint_stat              TYPE TABLE OF gty_constraint_stat WITH DEFAULT KEY.


    METHODS set_activation_status
      IMPORTING
                is_activation_det TYPE zust01_ce_prodallocactstat
      RETURNING VALUE(response)   TYPE string
      RAISING   cx_http_dest_provider_error
                cx_web_http_client_error .

    METHODS get_prdalc_cvc_data
      IMPORTING
                it_filter_cond TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top            TYPE i OPTIONAL
                skip           TYPE i OPTIONAL
      RETURNING VALUE(rt_data) TYPE t_prdalc_cvc_data
      RAISING   cx_http_dest_provider_error
                cx_web_http_client_error .


    METHODS set_constraint_status
      IMPORTING
                is_constraints TYPE gty_constraint_stat
      RETURNING VALUE(response)   TYPE string
      RAISING   cx_http_dest_provider_error
                cx_web_http_client_error .

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS execute_action
      IMPORTING i_action_name      TYPE string
                i_query_parameters TYPE if_web_http_request=>name_value_pairs OPTIONAL
      RETURNING VALUE(response)    TYPE string
      RAISING   cx_http_dest_provider_error
                cx_web_http_client_error .


ENDCLASS.



CLASS ZUST01_CL_PRODALLOCACTSTAT_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.

    DATA(top)               = io_request->get_paging( )->get_page_size( ).
    DATA(skip)              = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)        = io_request->get_sort_elements( ).
    DATA(lt_filter_cond)    = io_request->get_filter( )->get_as_ranges( ).

    TRY.


        DATA(lt_prodalloc) = get_prdalc_cvc_data( EXPORTING
                                                    it_filter_cond  = lt_filter_cond
                                                    top             = CONV #( top )
                                                    skip            = CONV #( skip ) ).

        IF NOT lt_prodalloc IS INITIAL.
          DATA(lt_fin_tab) = VALUE t_prdalloc_act_stat( FOR lwa_prodalloc IN lt_prodalloc
                                                          ( CharcValueCombinationUUID         = lwa_prodalloc-CharcValueCombinationUUID
                                                            ProdAllocationActivationStatus    = lwa_prodalloc-ProdAllocationActivationStatus
                                                            ProdAllocCharc01                  = lwa_prodalloc-ProdAllocCharc01
                                                            ProdAllocCharc02                  = lwa_prodalloc-ProdAllocCharc02
                                                            ProdAllocCharc03                  = lwa_prodalloc-ProdAllocCharc03
                                                            ProdAllocCharc04                  = lwa_prodalloc-ProdAllocCharc04
                                                            ProdAllocCharc05                  = lwa_prodalloc-ProdAllocCharc05
                                                            ProdAllocCharc06                  = lwa_prodalloc-ProdAllocCharc06
                                                            ProdAllocCharc07                  = lwa_prodalloc-ProdAllocCharc07
                                                            ProdAllocCharc08                  = lwa_prodalloc-ProdAllocCharc08
                                                            ProdAllocCharc09                  = lwa_prodalloc-ProdAllocCharc09
                                                            ProductAllocationObject           = lwa_prodalloc-ProductAllocationObject
                                                            PlanningScreen                    = ''
                                                            ProdAllocCharcConstraintStatus    = lwa_prodalloc-ProdAllocCharcConstraintStatus ) ).

        ENDIF.

        io_response->set_total_number_of_records( lines( lt_fin_tab ) ).
        io_response->set_data( lt_fin_tab ).
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.

  ENDMETHOD.


  METHOD set_activation_status.
    DATA:
      lv_query_param TYPE if_web_http_request=>name_value_pairs,
      lv_action_name TYPE string.


    TRY.
        lv_query_param = VALUE #( ( name = 'CharcValueCombinationUUID' value = |guid'{ is_activation_det-CharcValueCombinationUUID }'| ) ).

        IF is_activation_det-NewActivationStatus = 'I'.
          lv_action_name = 'SetLifecycleStatusToInactive'.
        ELSEIF is_activation_det-NewActivationStatus = 'A'.
          lv_action_name = 'SetLifecycleStatusToActive'.
        ELSE.
          EXIT.
        ENDIF.

        TRY.
            response = me->execute_action(
              EXPORTING
                i_action_name        = lv_action_name
                i_query_parameters   = lv_query_param
            ).
            response = |SUCESS|.

            DATA(lo_logentry) = NEW zust01_fmc_log(  ).
            lo_logentry->create_log_entry_cvc( is_prodalloccvcstat = is_activation_det
                                               if_event = 'MANUAL CHANGE' ).

          CATCH cx_http_dest_provider_error INTO DATA(http_dest_provider_error).
            response = |ERROR|.
          CATCH cx_web_http_client_error INTO DATA(web_http_client_error).
            response = |ERROR|.
        ENDTRY.




      CATCH cx_root INTO DATA(exception).
*        out->write( cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ) ).
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



    http_response = http_client->execute( if_web_http_client=>post ).
    http_status_code = http_response->get_status( ).
    response =  http_response->get_text( ).
  ENDMETHOD.


  METHOD get_prdalc_cvc_data.


    DATA: lo_http_client      TYPE REF TO if_web_http_client,
          lo_client_proxy     TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request          TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response         TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_resource         TYPE REF TO /iwbep/if_cp_resource_list,
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_filter_def       TYPE if_rap_query_filter=>ty_name_range_pairs.




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

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCCHARCVALCOMBN' )->create_request_for_read( ).
        lo_filter_factory = lo_request->create_filter_factory( ).


        DATA(ls_filter_uuid)  = VALUE #( it_filter_cond[ name = 'CHARCVALUECOMBINATIONUUID' ] DEFAULT ls_filter_def ).

        LOOP AT ls_filter_uuid-range ASSIGNING FIELD-SYMBOL(<fs_uuid_range>).

          REPLACE ALL OCCURRENCES OF REGEX '-' IN <fs_uuid_range>-low  WITH '' .
          <fs_uuid_range>-low  = to_upper( <fs_uuid_range>-low ).

        ENDLOOP.

        lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = ls_filter_uuid-name
                                                             it_range         = ls_filter_uuid-range ).
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
        lo_response->get_business_data( IMPORTING et_business_data =  rt_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception
    ENDTRY.


  ENDMETHOD.


  METHOD set_constraint_status.

    TYPES: BEGIN OF ty_entity_key,
             CharcValueCombinationUUID TYPE ZUST01_CE_PRODALLOCACTSTAT-CharcValueCombinationUUID,
           END OF ty_entity_key.

    DATA:
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_request       TYPE REF TO /iwbep/if_cp_request_update,
      lo_response      TYPE REF TO /iwbep/if_cp_response_update,
      ls_business_data TYPE ZUST01_A_PRODALLOCCHARCVALCOMB,
      ls_entity_key    TYPE ty_entity_key.



    try.



          " Create http client
          DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
                    i_name       = 'S4H'
                    i_authn_mode = if_a4c_cp_service=>service_specific ).


          lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

          lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
            EXPORTING
              iv_service_definition_name = 'ZUST01_FMC_ALLOC_MGMT_SC'
              io_http_client             = lo_http_client
              iv_relative_service_root   = '/sap/opu/odata/sap/API_PRODUCT_ALLOCATION_OBJECT_SRV/' ).

          ls_entity_key = VALUE #(
                    CharcValueCombinationUUID  = is_constraints-CharcValueCombinationUUID ).

          ls_business_data-CharcValueCombinationUUID        = is_constraints-charcvaluecombinationuuid.
          ls_business_data-ProdAllocCharcConstraintStatus   = is_constraints-newconstraintstatus.

          lo_resource = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCCHARCVALCOMBN' )->navigate_with_key( ls_entity_key ).
          lo_request = lo_resource->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-patch ).

          lo_request->set_business_data( is_business_data = ls_business_data it_provided_property = VALUE #(
              ( |CHARCVALUECOMBINATIONUUID| )
              ( |PRODALLOCCHARCCONSTRAINTSTATUS| )  ) ).

          lo_response = lo_request->execute( ).
    CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

    CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception


    ENDTRY.

  ENDMETHOD.
ENDCLASS.
