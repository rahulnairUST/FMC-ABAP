CLASS zust01_cl_shipto_f4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider .

*    TYPES: tt_shipto TYPE TABLE OF zust01_a_shipto WITH DEFAULT KEY.
    TYPES: tt_shipto TYPE TABLE OF zust01_ce_shipto_F4 WITH DEFAULT KEY.
    TYPES : t_rt_rangeopt TYPE if_rap_query_filter=>tt_range_option.

    TYPES: BEGIN OF ty_tab512,
             wa TYPE zdel_512,
           END OF ty_tab512.
    DATA: lt_data TYPE STANDARD TABLE OF ty_tab512.

    METHODS get_shipto_f4
      IMPORTING
                it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top              TYPE int8 OPTIONAL
                skip             TYPE int8 OPTIONAL
*                it_material           TYPE t_rt_rangeopt
      RETURNING VALUE(rt_shipto) TYPE  tt_shipto
*      RETURNING VALUE(rt_shipto) TYPE REF TO ty_tab512
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUST01_CL_SHIPTO_F4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    TRY.
        DATA(top)     = io_request->get_paging( )->get_page_size( ).
        DATA(skip)    = io_request->get_paging( )->get_offset( ).
        DATA(requested_fields)  = io_request->get_requested_elements( ).
        DATA(sort_order)    = io_request->get_sort_elements( ).
        DATA et_shiptos TYPE TABLE OF zust01_ce_shipto_f4.


        DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lt_shiptos) = get_shipto_f4( EXPORTING it_filter_cond = lt_filter_cond top = top skip = skip ).
*       OData result/push back to web service

        MOVE-CORRESPONDING lt_shiptos TO et_shiptos.

        io_response->set_total_number_of_records( lines( et_shiptos ) ).
        io_response->set_data( et_shiptos ).


      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.


  METHOD get_shipto_f4.

* Get materials F4
    DATA lv_result TYPE c LENGTH 200.

    DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(

                        comm_scenario          = 'ZUST_OUTBOUND_RFC_000_CSCEN'   " Communication scenario
                        service_id             = 'ZUST_OUTBOUND_RFC_000_SRFC'         " Outbound service
                        comm_system_id         = 'ZUST_OUTBOUND_RFC_CSYS_000'    " Communication system

                     ).
    DATA(lv_destination) = lo_destination->get_destination_name( ).

    TYPES: BEGIN OF ty_shipto,
             kunnr TYPE c LENGTH 10,
             name1 TYPE c LENGTH 35,
*               posnr TYPE n LENGTH 6,
*               ezeit TYPE t,
*               mbdat TYPE d,
*               antlf TYPE p DECIMALS 1 LENGTH 1,
           END OF ty_shipto.


    TYPES: BEGIN OF ty_tabopt,
             text TYPE c LENGTH 72,
           END OF ty_tabopt.

    TYPES: BEGIN OF ty_tabfld,
             fieldname TYPE c LENGTH 30,
           END OF ty_tabfld.

    DATA: lt_kunnr   TYPE STANDARD TABLE OF ty_shipto WITH NON-UNIQUE KEY kunnr,
          ls_kunnr   LIKE LINE OF lt_kunnr,
          lt_options TYPE STANDARD TABLE OF ty_tabopt,
          ls_options LIKE LINE OF lt_options,
          lt_fields  TYPE STANDARD TABLE OF ty_tabfld,
          ls_fields  LIKE LINE OF lt_fields,
          lt_tables  TYPE STANDARD TABLE OF ty_tab512,
          ls_tables  TYPE ty_tab512.

    DATA lv_top TYPE i.
    DATA lv_skip TYPE i.

    lv_top = top.
    lv_skip = skip.

    FIELD-SYMBOLS: <ls_data> TYPE any,
                   <value>   TYPE any,
                   <option>  TYPE any.

* Set fields parameter for table read
    CLEAR: ls_fields, lt_fields.
    ls_fields-fieldname = 'KUNNR'.
    APPEND ls_fields TO lt_fields.

    ls_fields-fieldname = 'NAME1'.
    APPEND ls_fields TO lt_fields.

** Set options parameter for table read (VBPA-VBELN + VBPA-KUNNR = KNA1-KUNNR)
*        LOOP AT it_salesorder ASSIGNING FIELD-SYMBOL(<fs_salesorder>).
*          CLEAR: ls_options, lt_options.
**         READ TABLE it_salesorder ASSIGNING FIELD-SYMBOL(<fs_salesorder>) INDEX +1.
*            ASSIGN COMPONENT 'low' of STRUCTURE <fs_salesorder>  TO <value>.
*            CHECK <value> IS ASSIGNED.
*            CONCATENATE `VBELN EQ '00000` <value> `'` INTO ls_options.
**            ls_options-text = <option>. "0000015628
*            APPEND ls_options TO lt_options.
**        ENDLOOP.

* Call read table function
    CALL FUNCTION 'RFC_READ_TABLE'
      DESTINATION lv_destination
      EXPORTING
        query_table = 'KNA1' "<table>
        delimiter   = 'X'
        rowcount    = lv_top
      TABLES
        fields      = lt_fields
        options     = lt_options
        data        = lt_data.
** EXCEPTIONS
**   TABLE_NOT_AVAILABLE        = 1
**   TABLE_WITHOUT_DATA         = 2
**   OPTION_NOT_VALID           = 3
**   FIELD_NOT_VALID            = 4
**   NOT_AUTHORIZED             = 5
**   DATA_BUFFER_EXCEEDED       = 6
**   OTHERS                     = 7
*          .
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    CHECK lt_data IS NOT INITIAL.
    SORT lt_data.

* Fill material
    LOOP AT lt_data ASSIGNING <ls_data>.
      ls_kunnr-kunnr = <ls_data>(10).
      ls_kunnr-name1 = <ls_data>+10(35).
      APPEND ls_kunnr TO lt_kunnr.
    ENDLOOP.

    rt_shipto = lt_kunnr.

    DATA: lo_http_client      TYPE REF TO if_web_http_client,
          lo_client_proxy     TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request          TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response         TYPE REF TO /iwbep/if_cp_response_read_lst,
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node      TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_filter_def       TYPE if_rap_query_filter=>ty_name_range_pairs.
*    DATA lv_top TYPE i.
*    DATA lv_skip TYPE i.
*
*    lv_top = top.
*    lv_skip = skip.
*
*
*    TRY.
*       DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
*          i_name       = 'S4H'
*          i_authn_mode = if_a4c_cp_service=>service_specific ).
*
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination
*          ).

*        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*          EXPORTING
*            iv_service_definition_name = 'ZUST01_FMC_SALES_ORDER'"<----------
*            io_http_client             = lo_http_client
*            iv_relative_service_root   = '/sap/opu/odata/sap/API_MRP_MATERIALS_SRV_01/' )."<-------
*
*        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_MRPMaterial' )->create_request_for_read( )."<-----------
*        lo_filter_factory = lo_request->create_filter_factory( ).
*
*        LOOP AT it_filter_cond ASSIGNING FIELD-SYMBOL(<lfs_cond>).
*          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = <lfs_cond>-name
*                                                               it_range         = <lfs_cond>-range ).
*          IF lo_filter_node_root IS INITIAL.
*            lo_filter_node_root = lo_filter_node.
*          ELSE.
*            lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
*          ENDIF.
*        ENDLOOP.
*
*
*        IF lo_filter_node_root IS NOT INITIAL.
*          lo_request->set_filter( lo_filter_node_root ).
*        ENDIF.
*
*
*        IF lv_top > 0.
*          lo_request->set_top( lv_top ).
*        ENDIF.
*
*        lo_request->set_skip( lv_skip ).
*
*        " Execute the request and retrieve the business data
*        lo_response = lo_request->execute( ).
**        lo_response->get_business_data( IMPORTING et_business_data = rt_materials ).
*
*      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
*        " Handle remote Exception
*        " It contains details about the problems of your http(s) connection
*
*      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
*        " Handle Exception
*    ENDTRY.

  ENDMETHOD.
ENDCLASS.
