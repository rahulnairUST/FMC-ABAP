CLASS zust01_cl_prodallocactstat DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.
    INTERFACES if_rap_query_filter.

    TYPES t_prdalloc_act_stat   TYPE TABLE OF ZUST01_CE_PRODALLOCACTSTAT WITH DEFAULT KEY.

    METHODS set_activation_status
      IMPORTING
        if_activate     TYPE abap_bool
        iv_CharcValueCombinationUUID TYPE abap_bool
      RETURNING VALUE(response) TYPE string
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



CLASS ZUST01_CL_PRODALLOCACTSTAT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~select.
     TRY.


        DATA : lv_c TYPE c.

        if  sy-subrc eQ 0.

        ENDIF.

     CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
     ENDTRY.

*    DATA: lv_stat TYPE c.
*    DATA: lt_final_tab TYPE t_prdalloc_act_stat.
*    DATA(top)     = io_request->get_paging( )->get_page_size( ).
*    DATA(skip)    = io_request->get_paging( )->get_offset( ).
*    DATA(requested_fields)  = io_request->get_requested_elements( ).
*    DATA(sort_order)    = io_request->get_sort_elements( ).
*    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
*
*
*    lv_stat = 'C'.
*
*    DATA(lv_response) = set_activation_status(
*                            EXPORTING
*                                if_activate                    = VALUE #( lt_filter_cond[ name = 'ACTIVATESTATUS' ]-range[ 1 ]-low DEFAULT '' )
*                                iv_CharcValueCombinationUUID   = VALUE #( lt_filter_cond[ name = 'CHARCVALUECOMBINATIONUUID' ]-range[ 1 ]-low DEFAULT '' ) ).
*
*    APPEND INITIAL LINE TO lt_final_tab ASSIGNING FIELD-SYMBOL(<fs_final_tab>).
*    <fs_final_tab>-ActivateStatus = lt_filter_cond[ name = 'ACTIVATESTATUS' ]-range[ 1 ]-low DEFAULT '' ).
*    <fs_final_tab>-CharcValueCombinationUUID = lt_filter_cond[ name = 'CHARCVALUECOMBINATIONUUID' ]-range[ 1 ]-low DEFAULT '' ).
*    <fs_final_tab>-Response = lv_response.
*
*    io_response->set_total_number_of_records( lines( lt_final_tab ) ).
*    io_response->set_data( lt_final_data ).
*
*    if lv_response = 'SUCCESS'.
**        DATA(lo_logentry) = NEW zust01_fmc_log(  ).
**              lo_logentry->create_log_entry( if_planning_screen = ''
**                                             if_count   = lv_count
**                                             if_event = 'MANUAL CHANGE'
**                                             is_timeseries = ls_business_data
**                                             is_prodalloc = ls_prodalloc ).
*    ENDIF.


  ENDMETHOD.


  METHOD set_activation_status.
    DATA:
         lv_query_param TYPE if_web_http_request=>name_value_pairs,
         lv_action_name TYPE string.


    TRY.
        lv_query_param = VALUE #( ( name = 'CharcValueCombinationUUID' value = |guid'{ iv_CharcValueCombinationUUID }'| ) ).
        lv_action_name = 'SetLifecycleStatusToInactive'.
        IF if_activate IS INITIAL.
          lv_action_name = 'SetLifecycleStatusToInactive'.
        ELSE.
          lv_action_name = 'SetLifecycleStatusToActive'.
        ENDIF.

        TRY.
            response = me->execute_action(
              EXPORTING
                i_action_name        = lv_action_name
                i_query_parameters   = lv_query_param
            ).
            response = |SUCESS|.
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

*   DATA(http_request_body) = | { add json string } |.
*   http_client->get_http_request( )->set_text( http_request_body ).

    http_response = http_client->execute( if_web_http_client=>post ).
    http_status_code = http_response->get_status( ).
    response =  http_response->get_text( ).
  ENDMETHOD.
ENDCLASS.
