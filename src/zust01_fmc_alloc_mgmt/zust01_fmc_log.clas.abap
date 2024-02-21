CLASS zust01_fmc_log DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.
    INTERFACES if_rap_query_filter.

    TYPES: t_cvc_log TYPE TABLE OF ZUST01_CE_TRC_cvc WITH DEFAULT KEY.
    TYPES: t_ts_log TYPE TABLE OF ZUST01_CE_TRC_ts WITH DEFAULT KEY.
    TYPES: t_v_keyfigure TYPE c LENGTH 40,
           t_v_event     TYPE c LENGTH 40,
           t_v_count     TYPE i.


    METHODS: create_log_entry
      IMPORTING
        iv_old_qty         TYPE ZUST01_CE_TRC_ts-QuantityOld
        if_count           TYPE t_v_count OPTIONAL
        if_planning_screen TYPE zust01_fmc_amc_planning_screen OPTIONAL
        if_event           TYPE t_v_event DEFAULT 'MANUAL CHANGE'
        if_keyfigure       TYPE t_v_keyfigure DEFAULT 'ALLOC_QTY'
        it_ts_db_old       TYPE zust01_fmc_amc_bool OPTIONAL
        it_buckets         TYPE zust01_fmc_amc_bool OPTIONAL
        it_paobj_cvc       TYPE zust01_fmc_amc_bool OPTIONAL
        it_cvc_status      TYPE zust01_fmc_amc_bool OPTIONAL
        is_timeseries      TYPE zust01_a_prodallocobjtimeserie
        is_prodalloc       TYPE zust01_ce_prodallocation OPTIONAL
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.
    .

    METHODS: create_log_entry_cvc
      IMPORTING
        is_prodalloccvcstat TYPE ZUST01_CE_PRODALLOCACTSTAT
        if_event            TYPE t_v_event DEFAULT 'MANUAL CHANGE'
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUST01_FMC_LOG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA: lt_cvc_log TYPE TABLE OF zust01_trc_cvc.
*    DATA: lt_ts_log TYPE TABLE OF zust01_trc_ts.
*
*    lt_cvc_log = VALUE #( (  mandt = '100'
*                           transaction_id = '0000000XXXXX00000XXXXX00000XXXXX'
*  transaction_cnt    = '1'
*  planning_screen    = 'ZUST_FMC_ALLOC_DEMO'
*  product_allocation_object = 'MT_AMC_MAT_CUSTGROUP_CUSTOMER'
*  event                     = 'MANUAL_CHANGE'
*  change_timestamp         = '20230608103637'
*  change_userid             = 'AWARD'
*  cvc_activation_status_old  = '02'
*  cvc_activation_status_new  = '01'
*  cvc_constraint_status_old = '05'
*  cvc_constraint_status_new = '05'
*  transfer_to_collective    = ''
*  prodalloccharc01     = 'MTAMC4'
*  prodalloccharc02   = 'ZA'
*  prodalloccharc03   = '0001000271'
*  prodalloccharc04  = ''
*  prodalloccharc05 = ''
*  prodalloccharc06 = ''
*  prodalloccharc07  = ''
*  prodalloccharc08  = ''
*  prodalloccharc09      = ''
*  prodalloccharc10 = '' ) ). "MTAMC4
*
*** Delete older data
    DELETE FROM zust01_trc_cvc.
*
** Insert initial data
*    INSERT zust01_trc_cvc FROM TABLE @lt_cvc_log.
*
*    lt_ts_log = VALUE #( (  mandt = '100'
*                           transaction_id = '0000000XXXXX00000XXXXX00000XXXXX'
*  transaction_cnt    = '1'
*  planning_screen    = 'ZUST_FMC_ALLOC_DEMO'
*  product_allocation_object = 'MT_AMC_MAT_CUSTGROUP_CUSTOMER'
*  event                     = 'MANUAL_CHANGE'
*  change_timestamp         = '20230228195823'
*  change_userid             = 'AWARD'
*  keyfigure        = 'ALLOC_QTY'
*  period_name      = '202305'
*  period_from        = '20230130080000'
*  period_to       = '20230206080000'
*  quantity_old    = '0.000'
*  quantity_new    = '999.000'
*  quantity_uom    = 'EA'
*  prodalloccharc01     = 'MTAMC4'
*  prodalloccharc02   = 'ZA'
*  prodalloccharc03   = '0001000271'
*  prodalloccharc04  = '0001000271'
*  prodalloccharc05 = '0001000271'
*  prodalloccharc06 = '0001000271'
*  prodalloccharc07  = '0001000271'
*  prodalloccharc08  = '0001000271'
*  prodalloccharc09      = '0001000271'
*  prodalloccharc10 = '0001000271' ) ). "MTAMC4
**
* Delete older data
    DELETE FROM zust01_trc_ts.
**
** Insert initial data
*    INSERT zust01_trc_ts FROM TABLE @lt_ts_log.

*    DATA: ls_timeseries TYPE zust01_a_prodallocobjtimeserie.
*
*    ls_timeseries-ProdAllocationTimeSeriesUUID = '0EF85C6AA2E81EE9BEEB0AAA92DD73B8'.
*    ls_timeseries-ProductAllocationQuantity    = '2'.
*    me->create_log_entry( ls_timeseries ).
  ENDMETHOD.


  METHOD if_rap_query_provider~select.


    TRY.

        DATA: lt_cvc_log TYPE t_cvc_log.

        DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lv_cvc_transid) = VALUE #( filter_condition[ 1 ]-range[ 1 ]-low DEFAULT '' ).

        SELECT transaction_id
          FROM zust01_trc_cvc
          WHERE transaction_id = @lv_cvc_transid
            INTO TABLE @lt_cvc_log.

        IF sy-subrc EQ 0.
*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_cvc_log ) ).
          io_response->set_data( lt_cvc_log ).


        ENDIF.

      CATCH /iwbep/cx_cp_remote.
      CATCH     /iwbep/cx_gateway.
      CATCH     cx_web_http_client_error.
      CATCH     cx_http_dest_provider_error.

    ENDTRY.

* Sort
    SORT lt_cvc_log BY transactionid.

    TRY.

        DATA: lt_ts_log TYPE t_ts_log.

        DATA(filter_condition2) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lv_ts_transid) = VALUE #( filter_condition2[ 1 ]-range[ 1 ]-low DEFAULT '').

        SELECT transaction_id
          FROM zust01_trc_ts
          WHERE transaction_id = @lv_ts_transid
            INTO TABLE @lt_ts_log.

        IF sy-subrc EQ 0.
*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_ts_log ) ).
          io_response->set_data( lt_ts_log ).


        ENDIF.

      CATCH /iwbep/cx_cp_remote.
      CATCH     /iwbep/cx_gateway.
      CATCH     cx_web_http_client_error.
      CATCH     cx_http_dest_provider_error.

    ENDTRY.

* Sort
    SORT lt_ts_log BY transactionid.

  ENDMETHOD.


  METHOD create_log_entry.
    DATA: lv_date_char TYPE d.
    DATA: lt_ts_log TYPE TABLE OF zust01_trc_ts.

    TRY.
        CALL METHOD cl_system_uuid=>if_system_uuid_static~create_uuid_x16
          RECEIVING
            uuid = DATA(if_trguid_new).
      CATCH cx_uuid_error.
*          RAISE EXCEPTION TYPE /ust01/cx_fmc_amc_exception
*            EXPORTING
*              exception = /ust01/cx_fmc_amc_exception=>ts_error_updating_timeseries.
    ENDTRY.

    GET TIME STAMP FIELD DATA(lv_timestamp).
    DATA: lv_char TYPE t_v_keyfigure.




    CONVERT TIME STAMP is_timeseries-ProdAllocPerdStartUTCDateTime TIME ZONE 'PST'
          INTO DATE DATA(lv_date) TIME DATA(lv_time)
          DAYLIGHT SAVING TIME DATA(lv_dst).


    lv_date_char = is_prodalloc-ProdAllocPerdStartUTCDateTime.
    CONVERT DATE lv_date_char
        INTO TIME STAMP DATA(lv_StartUTCDateTime) TIME ZONE 'UTC'.

    lv_date_char = is_prodalloc-ProdAllocPerdEndUTCDateTime.
    CONVERT DATE lv_date_char
        INTO TIME STAMP DATA(lv_EndUTCDateTime) TIME ZONE 'UTC'.

    lt_ts_log = VALUE #( (  mandt = '100'
                            transaction_id     = if_trguid_new
                            transaction_cnt    = if_count
                            planning_screen    = is_prodalloc-PlanningScreen
                            product_allocation_object = is_prodalloc-ProductAllocationObject
                            event            = if_event
                            change_timestamp = sy-datum
                            change_userid   = sy-uname
                            keyfigure       = if_keyfigure
                            period_name     = is_prodalloc-ProdAllocPerdStartUTCDateTime
                            period_from     = is_prodalloc-ProdAllocPerdStartUTCDateTime
                            period_to       = is_prodalloc-ProdAllocPerdEndUTCDateTime
                            quantity_old    = iv_old_qty
                            quantity_new    = is_timeseries-ProductAllocationQuantity
                            quantity_uom    = 'EA'
                            prodalloccharc01 = is_prodalloc-ProdAllocCharc01
                            prodalloccharc02 = is_prodalloc-ProdAllocCharc02
                            prodalloccharc03 = is_prodalloc-ProdAllocCharc03
                            prodalloccharc04 = is_prodalloc-ProdAllocCharc04
                            prodalloccharc05 = is_prodalloc-ProdAllocCharc05
                            prodalloccharc06 = is_prodalloc-ProdAllocCharc06
                            prodalloccharc07 = is_prodalloc-ProdAllocCharc07
                            prodalloccvc01   = is_prodalloc-prodalloccvc01
                            prodalloccvc02   = is_prodalloc-prodalloccvc02
                            prodalloccvc03   = is_prodalloc-prodalloccvc03
                            prodalloccvc04   = is_prodalloc-prodalloccvc04
                            prodalloccvc05   = is_prodalloc-prodalloccvc05
                            prodalloccvc06   = is_prodalloc-prodalloccvc06
                            prodalloccvc07   = is_prodalloc-prodalloccvc07 ) ).

* Insert initial data
    INSERT zust01_trc_ts FROM TABLE @lt_ts_log.

  ENDMETHOD.


  METHOD create_log_entry_cvc.
    DATA: lt_cvc_log TYPE TABLE OF zust01_trc_cvc.

    CONSTANTS: lc_mandt TYPE sy-mandt VALUE '100'.

    TRY.
        CALL METHOD cl_system_uuid=>if_system_uuid_static~create_uuid_x16
          RECEIVING
            uuid = DATA(if_trguid_new).
      CATCH cx_uuid_error.
*          RAISE EXCEPTION TYPE /ust01/cx_fmc_amc_exception
*            EXPORTING
*              exception = /ust01/cx_fmc_amc_exception=>ts_error_updating_timeseries.
    ENDTRY.

    GET TIME STAMP FIELD DATA(lv_timestamp).
    DATA: lv_char TYPE t_v_keyfigure.

    if is_prodalloccvcstat-NewActivationStatus = 'I'.
        DATA(lv_newstat) = '01'.
    ELSEif is_prodalloccvcstat-NewActivationStatus = 'A'.
        lv_newstat = '02'.
    ELSE.
        lv_newstat = ''.
    ENDIF.


    CONVERT TIME STAMP lv_timestamp TIME ZONE 'UTC'
          INTO DATE DATA(lv_date) TIME DATA(lv_time)
          DAYLIGHT SAVING TIME DATA(lv_dst).


    lt_cvc_log = VALUE #( (   mandt = lc_mandt
                              transaction_id = if_trguid_new
                              transaction_cnt    = 1
                              planning_screen    = is_prodalloccvcstat-PlanningScreen
                              product_allocation_object = is_prodalloccvcstat-ProductAllocationObject
                              event                     = if_event
                              change_timestamp          = lv_date
                              change_userid             = sy-uname
                              cvc_activation_status_old = is_prodalloccvcstat-ProdAllocationActivationStatus
                              cvc_activation_status_new = lv_newstat
*                              cvc_constraint_status_old = '05'
*                              cvc_constraint_status_new = '05'
                              transfer_to_collective    = ''
                              prodalloccharc01 = is_prodalloccvcstat-ProdAllocCharc01
                              prodalloccharc02 = is_prodalloccvcstat-ProdAllocCharc02
                              prodalloccharc03 = is_prodalloccvcstat-ProdAllocCharc03
                              prodalloccharc04 = is_prodalloccvcstat-ProdAllocCharc04
                              prodalloccharc05 = is_prodalloccvcstat-ProdAllocCharc05
                              prodalloccharc06 = is_prodalloccvcstat-ProdAllocCharc06
                              prodalloccharc07 = is_prodalloccvcstat-ProdAllocCharc07
                              prodalloccvc01   = is_prodalloccvcstat-prodalloccvc01
                              prodalloccvc02   = is_prodalloccvcstat-prodalloccvc02
                              prodalloccvc03   = is_prodalloccvcstat-prodalloccvc03
                              prodalloccvc04   = is_prodalloccvcstat-prodalloccvc04
                              prodalloccvc05   = is_prodalloccvcstat-prodalloccvc05
                              prodalloccvc06   = is_prodalloccvcstat-prodalloccvc06
                              prodalloccvc07   = is_prodalloccvcstat-prodalloccvc07 ) ).

* Insert initial data
    INSERT zust01_trc_cvc FROM TABLE @lt_cvc_log.

  ENDMETHOD.
ENDCLASS.
