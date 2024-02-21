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

    TYPES t_schedln_itm TYPE TABLE OF zust01_a_salesorderschedulelin WITH DEFAULT KEY.
    TYPES t_partner_hdr TYPE TABLE OF zust01_a_salesorderheaderpartn WITH DEFAULT KEY.
    TYPES t_kna1        TYPE TABLE OF zust01_kna1 WITH DEFAULT KEY.
    TYPES : t_rt_rangeopt TYPE if_rap_query_filter=>tt_range_option.

    TYPES: BEGIN OF ty_tab512,
             wa TYPE zdel_512,
           END OF ty_tab512.
    DATA: lt_data TYPE STANDARD TABLE OF ty_tab512.

    TYPES: BEGIN OF ty_soext,
             vbeln TYPE c LENGTH 10,
             posnr TYPE n LENGTH 6,
             etenr TYPE n LENGTH 4,
             ezeit TYPE t,
             mbdat TYPE c LENGTH 28,
             mbuhr TYPE t,
             wadat TYPE c LENGTH 28,
             wauhr TYPE t,
             lifsp TYPE c LENGTH 2,
             route TYPE c LENGTH 6,
             antlf TYPE p DECIMALS 1 LENGTH 1,
             vsbed TYPE c LENGTH 2,
             cmgst TYPE c LENGTH 1,
             lifsk TYPE c LENGTH 2,
             name1 TYPE c LENGTH 35,
             ort01 TYPE c LENGTH 35,
             parvw TYPE c LENGTH 2,
           END OF ty_soext.
    DATA:lt_soext TYPE STANDARD TABLE OF ty_soext WITH NON-UNIQUE KEY vbeln.



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
                it_salesord    TYPE t_rt_rangeopt
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

*  Get Schedule lines
    METHODS get_sched_lines_itm
      IMPORTING
                it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top              TYPE i OPTIONAL
                skip             TYPE i OPTIONAL
                it_salesorder    TYPE t_rt_rangeopt
                it_salesorderitm TYPE t_rt_rangeopt
      RETURNING VALUE(rt_data)   TYPE  t_schedln_itm
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.


* Get Sales Order Fields EXT
    METHODS get_sales_order_ext
      IMPORTING
                it_salesorder     TYPE t_rt_rangeopt
                it_salesorderitm  TYPE t_rt_rangeopt
                it_salesorderptnr TYPE t_partner_hdr
      EXPORTING
                et_kna1           TYPE t_kna1
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.


*  Get Header Partners
    METHODS get_hdr_partner
      IMPORTING
                it_filter_cond        TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
                top                   TYPE i OPTIONAL
                skip                  TYPE i OPTIONAL
                it_salesorder         TYPE t_rt_rangeopt
      RETURNING VALUE(rt_hdr_partner) TYPE  t_partner_hdr
      RAISING
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway
                cx_web_http_client_error
                cx_http_dest_provider_error.

ENDCLASS.



CLASS ZUST01_CL_SALESORDER IMPLEMENTATION.


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
        DATA(lt_salesord_itm) = get_sales_order( EXPORTING
                                                   TOP              = CONV #( top )
                                                   it_filter_cond   = lt_filter_cond ).
*       OData result/push back to web service


        io_response->set_total_number_of_records( lines( lt_salesord_itm ) ).
        io_response->set_data( lt_salesord_itm ).


      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.


  ENDMETHOD.


  METHOD get_sales_order.

    DATA: ls_so_itm_def TYPE zust01_a_salesorderitem.

    CONSTANTS: lc_def_partner TYPE zust01_a_salesorderheaderpartn-Customer VALUE '0000000000'.


*       Get Sales Order Header Data
    DATA(lt_saleord_hdr) = get_salesorder_hdr( it_filter_cond = it_filter_cond ).
    SORT lt_saleord_hdr BY salesorder.



*   range table for SO number
    DATA(lr_t_salesorder) = VALUE t_rt_rangeopt( FOR lwa_ord IN lt_saleord_hdr
                                                    sign = 'I'
                                                    option = 'EQ'
                                                    ( low = lwa_ord-SalesOrder  ) ).

    DATA(lt_partner_hdr) = get_hdr_partner( EXPORTING
                                                  top           = CONV #( top )
                                                  it_salesorder = lr_t_salesorder ).


*       Get Sales Order Item Data
    DATA(lt_salesord_itm) = get_salesord_itm( top            = CONV #( top )
                                              it_filter_cond = it_filter_cond
                                              it_salesord    = lr_t_salesorder ).
    SORT lt_salesord_itm BY salesorder SalesOrderItem.


*   range table for SO line item
    DATA(lr_t_salesorderitm) = VALUE t_rt_rangeopt( FOR lwa_ord_itm IN lt_salesord_itm
                                                    sign = 'I'
                                                    option = 'EQ'
                                                    ( low = lwa_ord_itm-SalesOrderItem  ) ).



* Get Schedule lines Data
    IF NOT lt_salesord_itm IS INITIAL.

*   range table for SO number
      lr_t_salesorder = VALUE t_rt_rangeopt( FOR lwa_so_itm IN lt_salesord_itm
                                                      sign = 'I'
                                                      option = 'EQ'
                                                      ( low = lwa_so_itm-SalesOrder  ) ).

      DELETE ADJACENT DUPLICATES FROM lr_t_salesorder COMPARING low.

      DATA(lt_sched_item) = get_sched_lines_itm( EXPORTING
                                                  top           = CONV #( top )
                                                  it_salesorder = lr_t_salesorder
                                                  it_salesorderitm = lr_t_salesorderitm ).

      SORT lt_sched_item BY SalesOrder
                            SalesOrderItem
                            ScheduleLine.

    ENDIF.

* Get missing SO extension fields
    me->get_sales_order_ext(  EXPORTING
                                  it_salesorder     = lr_t_salesorder
                                  it_salesorderitm  = lr_t_salesorderitm
                                  it_salesorderptnr = lt_partner_hdr
                              IMPORTING
                                  et_kna1 = DATA(lt_kna1) ).

** Prepare and add data to the final table
*   LOOP AT lt_sched_item ASSIGNING FIELD-SYMBOL(<ls_sched_item>).
*
*
*        READ TABLE lt_soext ASSIGNING FIELD-SYMBOL(<ls_soext>)
*            WITH KEY vbeln = <ls_sched_item>-salesorder
*                     posnr = <ls_sched_item>-salesorderitem
*                     etenr = <ls_sched_item>-scheduleline.
*        IF SY-SUBRC = 0.
*               <ls_sched_item>-ArrivalTime = <ls_soext>-ezeit.
*               CONCATENATE <ls_soext>-mbdat '000000' INTO <ls_soext>-mbdat.
*               <ls_sched_item>-MaterialAvailDate = <ls_soext>-mbdat.
*               CONCATENATE <ls_soext>-wadat '000000' INTO <ls_soext>-wadat.
*               <ls_sched_item>-GoodsIssueDate = <ls_soext>-wadat.
**               <ls_sched_item>-DeliveryBlock = <ls_soext>-lifsp.
*               <ls_sched_item>-MaterialStagTime = <ls_soext>-mbuhr.
*               <ls_sched_item>-GoodsIssueTime = <ls_soext>-wauhr.
*        ENDIF.
*
*
**       Create new entry in the final table
*        APPEND INITIAL LINE TO rt_sales_order ASSIGNING FIELD-SYMBOL(<fs_fin_out>).
*        <fs_fin_out> = CORRESPONDING #( <ls_sched_item> ).
*
**       Add Sales Order Item info to the final table
*       DATA(ls_order_itm) = VALUE ZUST01_A_SALESORDERITEM( lt_salesord_itm[ SalesOrder     = <ls_sched_item>-SalesOrder
*                                                                            SalesOrderItem = <ls_sched_item>-SalesOrderItem  ] DEFAULT ls_so_itm_def ).
*
*        if NOT ls_order_itm is INITIAL.
*            <fs_fin_out> = CORRESPONDING #( ls_order_itm ).
*        ENDIF.
*
*
**       Sold-to Party
*       <fs_fin_out>-SoldToParty = VALUE #( lt_partner_hdr[ SalesOrder = <ls_sched_item>-SalesOrder
*                                                           PartnerFunction = 'SP' ]-Customer DEFAULT lc_def_partner ).
*
**       Sold-to Party
*       <fs_fin_out>-ShipToParty = VALUE #( lt_partner_hdr[ SalesOrder = <ls_sched_item>-SalesOrder
*                                                           PartnerFunction = 'SH' ]-Customer DEFAULT lc_def_partner ).
*
*
*   ENDLOOP.

*    LOOP AT lt_saleord_hdr ASSIGNING FIELD-SYMBOL(<fs_so_hdr>).
*      LOOP AT lt_salesord_itm
*          ASSIGNING FIELD-SYMBOL(<fs_so_itm>)
*              WHERE salesorder = <fs_so_hdr>-SalesOrder.
*
*        APPEND INITIAL LINE TO rt_sales_order ASSIGNING FIELD-SYMBOL(<fs_fin_out>).
*        <fs_fin_out> = CORRESPONDING #( <fs_so_itm> ).
*
*        IF NOT lt_sched_item IS INITIAL.
*
*          DATA(ls_sched_itm) = VALUE zust01_a_salesorderschedulelin( lt_sched_item[ SalesOrder = <fs_so_itm>-SalesOrder
*                                                                                    SalesOrderItem = <fs_so_itm>-SalesOrderItem  ] DEFAULT ls_sched_itm_def ).
**            <fs_fin_out> = CORRESPONDING #( ls_sched_itm ).
*          <fs_fin_out>-ScheduleLine = ls_sched_itm-ScheduleLine.
*
**           OrderQty
*          <fs_fin_out>-ScheduleLineOrderQuantity      = ls_sched_itm-ScheduleLineOrderQuantity.
*
**           ConfirmQty
*          <fs_fin_out>-ConfdOrderQtyByMatlAvailCheck  = ls_sched_itm-ConfdOrderQtyByMatlAvailCheck.
*
**           DeliveryQty
*          <fs_fin_out>-DeliveredQtyInOrderQtyUnit     = ls_sched_itm-DeliveredQtyInOrderQtyUnit.
*
*          IF <fs_fin_out>-ScheduleLineOrderQuantity > <fs_fin_out>-ConfdOrderQtyByMatlAvailCheck .
*            <fs_fin_out>-OpenConfdDelivQtyInOrdQtyUnit = <fs_fin_out>-ScheduleLineOrderQuantity - <fs_fin_out>-ConfdOrderQtyByMatlAvailCheck .
*          ENDIF.
*
**           Quantity
*          IF <fs_fin_out>-ConfdOrderQtyByMatlAvailCheck > <fs_fin_out>-DeliveredQtyInOrderQtyUnit.
*            <fs_fin_out>-Quantity = <fs_fin_out>-ConfdOrderQtyByMatlAvailCheck - <fs_fin_out>-DeliveredQtyInOrderQtyUnit.
*          ENDIF.
*
**          OpenQty
*        <fs_fin_out>-OpenQty = <fs_fin_out>-ScheduleLineOrderQuantity - <fs_fin_out>-DeliveredQtyInOrderQtyUnit.
*        <fs_fin_out>-Quantity = <fs_fin_out>-ConfdOrderQtyByMatlAvailCheck - <fs_fin_out>-DeliveredQtyInOrderQtyUnit .
*
** Arrival Time
*          <fs_fin_out>-ArrivalTime     = ls_sched_itm-ArrivalTime.
*
** Material Availability Date
*          <fs_fin_out>-MaterialAvailDate     = ls_sched_itm-MaterialAvailDate.
*
** Material Staging Time
*          <fs_fin_out>-MaterialStagTime     = ls_sched_itm-MaterialStagTime.
*
** Goods Issue Date
*          <fs_fin_out>-GoodsIssueDate     = ls_sched_itm-GoodsIssueDate.
*
** Goods Issue Time
*          <fs_fin_out>-GoodsIssueTime     = ls_sched_itm-GoodsIssueTime.
*
*        ENDIF.
*
*      ENDLOOP.
*    ENDLOOP.

******************************************************************************************
*    LOOP AT lt_sched_item INTO DATA(ls_sched_item).
*      READ TABLE lt_soext ASSIGNING FIELD-SYMBOL(<ls_soext>)
*          WITH KEY vbeln = ls_sched_item-salesorder
*                   posnr = ls_sched_item-salesorderitem
*                   etenr = ls_sched_item-scheduleline.
*      IF sy-subrc = 0.
*        ls_sched_item-ArrivalTime = <ls_soext>-ezeit.
*
*        CONCATENATE <ls_soext>-mbdat '000000' INTO <ls_soext>-mbdat.
*        ls_sched_item-MaterialAvailDate = <ls_soext>-mbdat.
*
*        CONCATENATE <ls_soext>-wadat '000000' INTO <ls_soext>-wadat.
*        ls_sched_item-GoodsIssueDate = <ls_soext>-wadat.
**               ls_sched_item-DeliveryBlock = <ls_soext>-lifsp.
*        ls_sched_item-MaterialStagTime = <ls_soext>-mbuhr.
*        ls_sched_item-GoodsIssueTime = <ls_soext>-wauhr.
*        MODIFY lt_sched_item FROM ls_sched_item.
*      ENDIF.
*    ENDLOOP.

    MOVE-CORRESPONDING lt_sched_item TO rt_sales_order.

    LOOP AT rt_sales_order ASSIGNING FIELD-SYMBOL(<fs_salesorder>). "INTO DATA(ls_sales_order).



        if NOT lt_soext is initial.
            DATA(ls_soext) = VALUE #( lt_soext[ vbeln = <fs_salesorder>-salesorder
                                                posnr = <fs_salesorder>-salesorderitem
                                                etenr = <fs_salesorder>-scheduleline ] DEFAULT '' ).
        endif.

        <fs_salesorder>-ArrivalTime         = |{ ls_soext-ezeit }|.
        <fs_salesorder>-MaterialAvailDate   = |{ ls_soext-mbdat }000000|.
        <fs_salesorder>-GoodsIssueDate      = |{ ls_soext-wadat }000000|.
        <fs_salesorder>-MaterialStagTime    = |{ ls_soext-mbuhr } |.
        <fs_salesorder>-GoodsIssueTime      = |{ ls_soext-wauhr } |.

* Sold-to Party #
        <fs_salesorder>-SoldToParty      = VALUE #( lt_partner_hdr[ SalesOrder = <fs_salesorder>-SalesOrder
                                                    PartnerFunction = 'SP' ]-Customer DEFAULT lc_def_partner ).
        <fs_salesorder>-SoldToPartyName  = VALUE #( lt_kna1[ kunnr = <fs_salesorder>-SoldToParty ]-Name1 DEFAULT '' ).

* Ship-to Party
        <fs_salesorder>-ShipToParty      = VALUE #( lt_partner_hdr[ SalesOrder       = <fs_salesorder>-SalesOrder
                                                                   PartnerFunction  = 'SP' ]-Customer DEFAULT lc_def_partner ).
        <fs_salesorder>-SoldToPartyName  = VALUE #( lt_kna1[ kunnr = <fs_salesorder>-ShipToParty ]-Name1 DEFAULT '' ).

        <fs_salesorder>-customername     = VALUE #( lt_kna1[ kunnr = <fs_salesorder>-SoldToParty ]-Name1 DEFAULT lc_def_partner ).
        <fs_salesorder>-customercity     = VALUE #( lt_kna1[ kunnr = <fs_salesorder>-SoldToParty ]-ort01 DEFAULT '' ).


*      READ TABLE lt_soext INTO <ls_soext>
*          WITH KEY vbeln = <fs_salesorder>-salesorder
*                   posnr = <fs_salesorder>-salesorderitem
*                   etenr = <fs_salesorder>-scheduleline.
*      IF sy-subrc = 0.
*
*
*
**        MODIFY rt_sales_order FROM ls_sales_order.
*      ENDIF.

      DATA(ls_order_itm) = VALUE zust01_a_salesorderitem( lt_salesord_itm[ SalesOrder     = <fs_salesorder>-SalesOrder
                                                                           SalesOrderItem = <fs_salesorder>-SalesOrderItem  ] DEFAULT ls_so_itm_def ).
      IF ls_order_itm IS NOT INITIAL.
        <fs_salesorder>-material                    = ls_order_itm-material.
        <fs_salesorder>-materialgroup               = ls_order_itm-materialgroup.
        <fs_salesorder>-productionplant             = ls_order_itm-productionplant.
        <fs_salesorder>-customergroup               = ls_order_itm-customergroup.
        <fs_salesorder>-deliverystatus              = ls_order_itm-deliverystatus.
        <fs_salesorder>-shippingpoint               = ls_order_itm-shippingpoint.
        <fs_salesorder>-deliverypriority            = ls_order_itm-deliverypriority.
        <fs_salesorder>-incotermstransferlocation   = ls_order_itm-incotermstransferlocation.
        <fs_salesorder>-netamount = ls_order_itm-netamount.
*        MODIFY rt_sales_order FROM ls_sales_order.
      ENDIF.

      READ TABLE lt_saleord_hdr INTO DATA(ls_so_hdr)
                  WITH KEY salesorder = <fs_salesorder>-salesorder.


      IF ls_so_hdr IS NOT INITIAL.
        <fs_salesorder>-salesorganization       = ls_so_hdr-salesorganization.
        <fs_salesorder>-distributionchannel     = ls_so_hdr-distributionchannel.
        <fs_salesorder>-organizationdivision    = ls_so_hdr-organizationdivision.
        <fs_salesorder>-salesordertype          = ls_so_hdr-salesordertype.
        <fs_salesorder>-createdbyuser           = ls_so_hdr-createdbyuser.
        <fs_salesorder>-creationdate            = ls_so_hdr-creationdate.
*             ls_sales_order-totalnetamount = ls_so_hdr-totalnetamount.
        <fs_salesorder>-customer                = ls_so_hdr-soldtoparty.
        <fs_salesorder>-additionalcustomergroup1 = ls_so_hdr-additionalcustomergroup1.
*        MODIFY rt_sales_order FROM ls_sales_order.
      ENDIF.

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
        DATA(ls_cvcfilter) = VALUE #( it_filter_cond[ name = 'CVCFILTER' ] DEFAULT ls_filter_def ).
        LOOP AT ls_cvcfilter-range INTO DATA(ls_range).

          IF NOT ls_range-low IS INITIAL.
            SPLIT ls_range-low AT ',' INTO TABLE lt_split.

            LOOP AT lt_split ASSIGNING FIELD-SYMBOL(<fs_split>).
              DATA(lv_idx) = sy-tabix.
              SPLIT <fs_split> AT '=' INTO: DATA(lv_fldname) DATA(lv_fldval).
              APPEND INITIAL LINE TO lt_filter_cond ASSIGNING FIELD-SYMBOL(<fs_filter_cond>).
              <fs_filter_cond>-cond_nam = lv_fldname.
              <fs_filter_cond>-cond_val = lv_fldval.
            ENDLOOP.


          ENDIF.
        ENDLOOP.


        IF NOT lt_filter_cond IS INITIAL.
          SORT lt_filter_cond BY cond_val.
          DELETE ADJACENT DUPLICATES FROM lt_filter_cond COMPARING cond_val.
          SORT lt_filter_cond BY cond_nam.

        ENDIF.



*     Get data from SCRCOL
        SELECT *
            FROM zust01_scrcol
              FOR ALL ENTRIES IN @lt_filter_cond
                WHERE description  = @lt_filter_cond-cond_nam
                  AND zapi_service = 'A_SALESORDERITEM'
                  INTO TABLE @DATA(lt_scrcol).

        IF sy-subrc EQ 0.


          IF NOT it_salesord IS INITIAL.
            lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'SALESORDER'
                                                              it_range            = it_salesord ).

            IF lo_filter_node_root IS INITIAL.
              lo_filter_node_root = lo_filter_node.
            ELSE.
              lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
            ENDIF.
          ENDIF.


          LOOP AT lt_scrcol ASSIGNING FIELD-SYMBOL(<fs_scrcol>).

            DATA(lr_t_cond) = VALUE if_rap_query_filter=>tt_range_option(
                                            FOR ls IN lt_filter_cond
                                                WHERE ( cond_nam = <fs_scrcol>-description )
                                                LET s = 'I'
                                                    o = 'EQ'
                                                IN sign   = s
                                                   option = o
                                                   ( low = ls-cond_val ) ).
            IF NOT lr_t_cond IS INITIAL.
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

        DATA(lt_datefilter) = VALUE #( it_filter_cond[ name = 'PRODALLOCPERDSTARTUTCDATETIME' ] DEFAULT ls_filter_def ).

        IF NOT lt_datefilter IS INITIAL.
          DATA(lr_t_date) = VALUE rt_dats( LET s = 'I'
                                             o = 'BT'
                                         IN sign   = s
                                            option = o
                                       ( low  = |{ lt_datefilter-range[ 1 ]-low }000000|
                                         high = |{ lt_datefilter-range[ 1 ]-high }000000| ) ).



          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'BILLINGDOCUMENTDATE'
                                                               it_range         = lr_t_date ).
          IF lo_filter_node_root IS INITIAL.
            lo_filter_node_root = lo_filter_node.
          ELSE.
            lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
          ENDIF.

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
             cond_idx TYPE i,
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
        DATA(ls_cvcfilter) = VALUE #( it_filter_cond[ name = 'CVCFILTER' ] DEFAULT ls_filter_def ).
        LOOP AT ls_cvcfilter-range INTO DATA(ls_range).

          IF NOT ls_range-low IS INITIAL.
            SPLIT ls_range-low AT ',' INTO TABLE lt_split.

            LOOP AT lt_split ASSIGNING FIELD-SYMBOL(<fs_split>).
              DATA(lv_idx) = sy-tabix.
              SPLIT <fs_split> AT '=' INTO: DATA(lv_fldname) DATA(lv_fldval).
              APPEND INITIAL LINE TO lt_filter_cond ASSIGNING FIELD-SYMBOL(<fs_filter_cond>).
              <fs_filter_cond>-cond_idx = lv_idx.
              <fs_filter_cond>-cond_nam = lv_fldname.
              <fs_filter_cond>-cond_val = lv_fldval.
            ENDLOOP.


          ENDIF.
        ENDLOOP.


        IF NOT lt_filter_cond IS INITIAL.
          SORT lt_filter_cond BY cond_val.
          DELETE ADJACENT DUPLICATES FROM lt_filter_cond COMPARING cond_val.
          SORT lt_filter_cond BY cond_nam.

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


            DATA(lr_t_cond) = VALUE if_rap_query_filter=>tt_range_option(
                                            FOR ls IN lt_filter_cond
                                                WHERE ( cond_nam = <fs_scrcol>-description )
                                                LET s = 'I'
                                                    o = 'EQ'
                                                IN sign   = s
                                                   option = o
                                                   ( low = ls-cond_val ) ).

            IF NOT lr_t_cond IS INITIAL.
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


        DATA(lt_datefilter) = VALUE #( it_filter_cond[ name = 'PRODALLOCPERDSTARTUTCDATETIME' ] DEFAULT ls_filter_def ).

        IF NOT lt_datefilter IS INITIAL.
          DATA(lr_t_date) = VALUE rt_dats( LET s = 'I'
                                               o = 'BT'
                                         IN sign   = s
                                            option = o
                                       ( low  = |{ lt_datefilter-range[ 1 ]-low }000000|
                                         high = |{ lt_datefilter-range[ 1 ]-high }000000| ) ).



          lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'BILLINGDOCUMENTDATE'
                                                               it_range         = lr_t_date ).
          IF lo_filter_node_root IS INITIAL.
            lo_filter_node_root = lo_filter_node.
          ELSE.
            lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
          ENDIF.

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


  METHOD get_sched_lines_itm.

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

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SALESORDERSCHEDULELINE' )->create_request_for_read( ).
        lo_filter_factory = lo_request->create_filter_factory( ).



* Set SO filter related to SO item

        lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'SALESORDER'
                                                             it_range         = it_salesorder ).
        IF lo_filter_node_root IS INITIAL.
          lo_filter_node_root = lo_filter_node.
        ELSE.
          lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
        ENDIF.


        lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'SALESORDERITEM'
                                                             it_range         = it_salesorderitm ).
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


  METHOD get_sales_order_ext.

* Get missing fields here
    DATA lv_result TYPE c LENGTH 200.

    DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(

                        comm_scenario          = 'ZUST_OUTBOUND_RFC_000_CSCEN'   " Communication scenario
                        service_id             = 'ZUST_OUTBOUND_RFC_000_SRFC'         " Outbound service
                        comm_system_id         = 'ZUST_OUTBOUND_RFC_CSYS_000'    " Communication system

                     ).
    DATA(lv_destination) = lo_destination->get_destination_name( ).

    TYPES: BEGIN OF ty_TABOPT,
             text TYPE c LENGTH 72,
           END OF ty_TABOPT.
    DATA: lt_options TYPE STANDARD TABLE OF ty_tabopt,
          ls_options LIKE LINE OF lt_options,
          ls_option  LIKE LINE OF lt_options,
          lt_option  TYPE STANDARD TABLE OF ty_tabopt,
          ls_soext   TYPE ty_soext.

    TYPES: BEGIN OF ty_TABFLD,
             fieldname TYPE c LENGTH 30,
           END OF ty_TABFLD.
    DATA: lt_fields TYPE STANDARD TABLE OF ty_tabfld,
          ls_fields LIKE LINE OF lt_fields.

    FIELD-SYMBOLS: <ls_data> TYPE any,
                   <value>   TYPE any,
                   <option>  TYPE any.

    DATA: lt_tables TYPE STANDARD TABLE OF ty_tab512,
          ls_tables TYPE ty_tab512.

* Add tables to retrieve data.
    ls_tables-wa = 'VBEP'.
    APPEND ls_tables TO lt_tables.
    ls_tables-wa = 'KNA1'.            "<----------------------
    APPEND ls_tables TO lt_tables. "<---------------
*      ls_tables-wa = 'VBAP'.
*      APPEND ls_tables TO lt_tables.
*      ls_tables-wa = 'VBAK'.
*      APPEND ls_tables TO lt_tables.

* Collect the SO data from each table.
    LOOP AT lt_tables INTO ls_tables. "<------------------------------
      ASSIGN COMPONENT 'wa' OF STRUCTURE ls_tables TO FIELD-SYMBOL(<table>).

* Set fields parameter for each table read
      IF <table> = 'VBEP'.
        CLEAR: ls_fields, lt_fields.
        ls_fields-fieldname = 'VBELN'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'POSNR'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'ETENR'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'EZEIT'.
        APPEND ls_fields TO lt_fields.
*            ls_fields-fieldname = 'EDATU'.
*            APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'MBDAT'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'MBUHR'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'WADAT'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'WAUHR'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'LIFSP'.
        APPEND ls_fields TO lt_fields.
      ELSEIF <table> = 'KNA1'.
        CLEAR: ls_fields, lt_fields.
        ls_fields-fieldname = 'KUNNR'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'NAME1'.
        APPEND ls_fields TO lt_fields.
        ls_fields-fieldname = 'ORT01'.
        APPEND ls_fields TO lt_fields.
*        ELSEIF <table> = 'VBAP'.
*            CLEAR: ls_fields, lt_fields.
*            ls_fields-fieldname = 'ROUTE'.
*            APPEND ls_fields TO lt_fields.
*            ls_fields-fieldname = 'ANTLF'.
*            APPEND ls_fields TO lt_fields.
*        Else.
*            CLEAR: ls_fields, lt_fields.
*            ls_fields-fieldname = 'VSBED'.
*            APPEND ls_fields TO lt_fields.
*            ls_fields-fieldname = 'CMGST'.
*            APPEND ls_fields TO lt_fields.
*            ls_fields-fieldname = 'LIFSk'.
*            APPEND ls_fields TO lt_fields.
      ENDIF.

* Set options parameter for table read




      IF <table> = 'VBEP'.          "<------------------------put inside loop if no KNA1
        CLEAR: ls_options." lt_options."<------------------------clear lt_options if no KNA1
        LOOP AT it_salesorder ASSIGNING FIELD-SYMBOL(<fs_salesorder>).

*         READ TABLE it_salesorder ASSIGNING FIELD-SYMBOL(<fs_salesorder>) INDEX +1.
          ASSIGN COMPONENT 'low' OF STRUCTURE <fs_salesorder>  TO <value>.
          CHECK <value> IS ASSIGNED.
          CONCATENATE `VBELN EQ '00000` <value> `'` INTO ls_options.
          APPEND ls_options TO lt_options.
        ENDLOOP.
      ELSEIF <table> = 'KNA1'.
        CLEAR: ls_options, lt_options.
*        DATA(lt_partner_hdr) = get_hdr_partner( EXPORTING
*                                                    it_salesorder = it_salesorder ).


        LOOP AT it_salesorderptnr ASSIGNING FIELD-SYMBOL(<fs_salespartner>) WHERE ( partnerfunction EQ 'SP' OR partnerfunction EQ 'SH' )  .
**
          UNASSIGN <value>.
*         READ TABLE lt_partner_hdr ASSIGNING FIELD-SYMBOL(<fs_salespartner>) INDEX +1.
          ASSIGN COMPONENT 'customer' OF STRUCTURE <fs_salespartner>  TO <value>.
          CHECK <value> IS ASSIGNED.
          CONCATENATE `KUNNR EQ '000` <value> `'` INTO ls_options.
          APPEND ls_options TO lt_options.
        ENDLOOP.
      ENDIF.

      CLEAR: ls_option, lt_option.

      LOOP AT lt_options INTO ls_option. "INDEX +1.
        CLEAR lt_option.
        APPEND ls_option TO lt_option.
* Call read table function
        CALL FUNCTION 'RFC_READ_TABLE'
          DESTINATION lv_destination
          EXPORTING
            query_table = <table>
          TABLES
            fields      = lt_fields
            options     = lt_option
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

*DATA: lf_tabix TYPE sy-tabix.
*      FIELD-SYMBOLS: <key> TYPE any,
*                     <ls_soext> TYPE any.
* Fill SO extension fields table

        IF <table> = 'VBEP'.

          LOOP AT lt_data ASSIGNING <ls_data>.
            ls_soext-vbeln = <ls_data>+5(5).
            ls_soext-posnr = <ls_data>+10(6).
            ls_soext-etenr = <ls_data>+16(4).
            ls_soext-ezeit = <ls_data>+20(6).
            ls_soext-mbdat = <ls_data>+26(8).
            ls_soext-wadat = <ls_data>+34(8).
            ls_soext-lifsp = <ls_data>+42(2).
            ls_soext-mbuhr = <ls_data>+44(6).
            ls_soext-wauhr = <ls_data>+50(6).
            APPEND ls_soext TO lt_soext.
          ENDLOOP.

        ELSEIF <table> = 'KNA1'.
            LOOP AT lt_data ASSIGNING <ls_data>.
                APPEND INITIAL LINE TO et_kna1 ASSIGNING FIELD-SYMBOL(<fs_kna1>).
                <fs_kna1> = <ls_data>.

            ENDLOOP.
            SORT et_kna1 by kunnr.
            DELETE ADJACENT DUPLICATES FROM et_kna1 COMPARING ALL FIELDS.

*          LOOP AT it_salesorderptnr INTO <fs_salespartner> WHERE ( partnerfunction EQ 'SP' OR partnerfunction EQ 'SH' ).
*
*
*
*
**            READ TABLE lt_soext INTO ls_soext
**                WITH KEY vbeln = <fs_salespartner>-salesorder.
**            IF sy-subrc = 0.
**              LOOP AT lt_data ASSIGNING <ls_data>.
**                ls_soext-name1 = <ls_data>+10(35).
**                ls_soext-ort01 = <ls_data>+45(35).
**                ls_soext-parvw = <fs_salespartner>-partnerfunction.
**                MODIFY lt_soext FROM ls_soext TRANSPORTING name1 ort01
**                    WHERE vbeln = <fs_salespartner>-salesorder.
**              ENDLOOP.
**            ENDIF.
*          ENDLOOP.
*        ELSEIF <table> = 'VBAP'.
*            LOOP AT lt_data ASSIGNING <ls_data>.
*                ls_soext-route = <ls_data>+1(6).
*                ls_soext-antlf = <ls_data>(1).
**                READ TABLE lt_soext ASSIGNING <ls_soext>
**                    WITH TABLE KEY primary_key
**                    COMPONENTS EZEIT = <key>.
*                READ TABLE lt_soext INDEX 1 INTO ls_soext.
*                IF sy-subrc = 0.
*                    APPEND ls_soext TO lt_soext.
*                ENDIF.
*            ENDLOOP.
*        ELSE.
*            LOOP AT lt_data ASSIGNING <ls_data>.
*                ls_soext-vsbed = <ls_data>(2).
*                ls_soext-cmgst = <ls_data>+2(1).
*                ls_soext-lifsk = <ls_data>+3(2).
*                MODIFY lt_soext FROM ls_soext.
*            ENDLOOP.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.


  METHOD get_hdr_partner.
    DATA: lo_http_client      TYPE REF TO if_web_http_client,
          lo_client_proxy     TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request          TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response         TYPE REF TO /iwbep/if_cp_response_read_lst,
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
            iv_service_definition_name = 'ZUST01_FMC_SALES_ORDER'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_SALES_ORDER_SRV/' ).

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SALESORDERHEADERPARTNER' )->create_request_for_read( ).
        lo_filter_factory = lo_request->create_filter_factory( ).


* Set SO numbers

        lo_filter_node = lo_filter_factory->create_by_range( iv_property_path = 'SALESORDER'
                                                             it_range         = it_salesorder ).
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


        lo_response->get_business_data( IMPORTING et_business_data = rt_hdr_partner ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
