CLASS zust01_fmc_selid DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.
    INTERFACES if_rap_query_filter.

    TYPES: t_selid TYPE TABLE OF zust01_ce_selid_01 WITH DEFAULT KEY.
    TYPES: t_selid_d TYPE TABLE OF zust01_ce_selid_d_01 WITH DEFAULT KEY.

**  Get Sales Order Data (Header and Item) and populate bucket index for column mapping
*    METHODS get_atp_timeseries
*      IMPORTING
*                it_filter_cond     TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
*                top                TYPE i OPTIONAL
*                skip               TYPE i OPTIONAL
*      RETURNING VALUE(rt_selid_d) TYPE  t_selid
*      RAISING
*                /iwbep/cx_cp_remote
*                /iwbep/cx_gateway
*                cx_web_http_client_error
*                cx_http_dest_provider_error.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZUST01_FMC_SELID IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.
                DATA: lt_selid TYPE TABLE OF zust01_selid,
*                      lt_selid_a TYPE TABLE OF zust01_selid,
*                      lt_selid_b TYPE TABLE OF zust01_selid,
*                      lt_selid_c TYPE TABLE OF zust01_selid,
                      lt_selid_d TYPE TABLE OF zust01_selid_d.

    lt_selid = VALUE #( (  mandt = '100'
                           selection_id = 'ZFMC_ALLOC_QTY'
                           source = 'A' ) "aATP Product Allocation

                            (  mandt = '100'
                           selection_id = 'ZFMC_STOCK_AND_RECEIPTS'
                           source = 'D' ) "TIMESERIES data - stock, receipts, issues

                          (  mandt = '100'
                           selection_id = 'ZFMC_SALES_ORDERS'
                           source = 'B' ) "Sales orders and deliveries - CVC based

                            (  mandt = '100'
                           selection_id = 'ZFMC_STOCK_AND_RECEIPTS_CUM'
                           source = 'D' ) "TIMESERIES data - stock, receipts, issues

                          ( mandt = '100'
                           selection_id = 'DA_ALLOC_QTY'
                           source = 'A' ) "aATP Product Allocation

                            (  mandt = '100'
                           selection_id = 'DA_STOCK_AND_RECEIPTS'
                           source = 'D' ) "TIMESERIES data - stock, receipts, issues

                          (  mandt = '100'
                           selection_id = 'DA_CONSUMPTION_QTY'
                           source = 'A' ) "aATP Product Allocation
                           ).
*
** Delete older data
    DELETE FROM zust01_selid.
*
* Insert initial data
    INSERT zust01_selid FROM TABLE @lt_selid.

    lt_selid_d = VALUE #( (  mandt = '100'
                             selection_id = 'ZFMC_STOCK_AND_RECEIPTS_CUM'
                              stock_unrestricted = 'X'
                              stock_safety = 'X'
                              stock_in_transfer = 'X'
                              stock_quality = 'X'
                              stock_blocked = 'X'
                              stock_restricted = 'X'
                              purchase_requisitions = 'X'
                              purchase_orders = 'A'
                              shipping_notifications = 'X'
                              planned_orders = 'X'
                              production_orders = 'X'
                              no_receipts_in_past = 'X'
                              sales_orders = 'A'
                              deliveries = 'X'
                              sto_requirements = 'X'
                              reservations = 'X'
                              dependent_requirements = 'X'
                              dependent_reservations = 'X' )

                            (  mandt = '100'
                             selection_id = 'ZFMC_STOCK_AND_RECEIPTS'
                              stock_unrestricted = 'X'
                              stock_safety = 'X'
                              stock_in_transfer = 'X'
                              stock_quality = 'X'
                              stock_blocked = 'X'
                              stock_restricted = 'X'
                              purchase_requisitions = 'X'
                              purchase_orders = ' '
                              shipping_notifications = 'X'
                              planned_orders = ' '
                              production_orders = ' '
                              no_receipts_in_past = 'X'
                              sales_orders = ' '
                              deliveries = 'X'
                              sto_requirements = ' '
                              reservations = 'X'
                              dependent_requirements = 'X'
                              dependent_reservations = ' ' )

                              (  mandt = '100'
                             selection_id = 'DA_STOCK_AND_RECEIPTS'
                              stock_unrestricted = 'X'
                              stock_safety = 'X'
                              stock_in_transfer = 'X'
                              stock_quality = 'X'
                              stock_blocked = 'X'
                              stock_restricted = 'X'
                              purchase_requisitions = 'X'
                              purchase_orders = ' '
                              shipping_notifications = 'X'
                              planned_orders = ' '
                              production_orders = ' '
                              no_receipts_in_past = 'X'
                              sales_orders = ' '
                              deliveries = 'X'
                              sto_requirements = ' '
                              reservations = 'X'
                              dependent_requirements = 'X'
                              dependent_reservations = ' ' )
                               ).
** Delete older data
    DELETE FROM zust01_selid_d.
*
* Insert initial data
    INSERT zust01_selid_d FROM TABLE @lt_selid_d.


  ENDMETHOD.


METHOD if_rap_query_provider~select.


TRY.

        DATA: lt_selid TYPE t_selid.

        DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lv_selection_id) = VALUE #( filter_condition[ 1 ]-range[ 1 ]-low DEFAULT '').

        SELECT selection_id,
               source
          FROM zust01_selid
          WHERE selection_id = @lv_selection_id
            INTO TABLE @lt_selid.

        IF sy-subrc EQ 0.
*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_selid ) ).
          io_response->set_data( lt_selid ).


        ENDIF.

      CATCH /iwbep/cx_cp_remote.
      CATCH     /iwbep/cx_gateway.
      CATCH     cx_web_http_client_error.
      CATCH     cx_http_dest_provider_error.

    ENDTRY.

* Sort
    SORT lt_selid BY selectionid.

     TRY.

        DATA: lt_selid_d TYPE t_selid_d.
*              DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).
*                DATA(lv_data_source) = VALUE #( filter_condition[ 1 ]-range[ 1 ]-low DEFAULT '').

        SELECT selection_id,
               stock_unrestricted,
               stock_safety,
               stock_in_transfer,
               stock_quality,
               stock_blocked,
               stock_restricted,
               purchase_requisitions,
            purchase_orders,
            shipping_notifications,
              planned_orders,
            production_orders,
             no_receipts_in_past,
             sales_orders,
            deliveries,
             sto_requirements,
             reservations,
              dependent_requirements,
            dependent_reservations
          FROM zust01_selid_d
*          FOR ALL ENTRIES IN @lt_selid
*          WHERE selection_id = @lv_selection_id
*          AND   source       = 'D'
            INTO TABLE @lt_selid_d.

        IF sy-subrc EQ 0.
*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_selid_d ) ).
          io_response->set_data( lt_selid_d ).


        ENDIF.

      CATCH /iwbep/cx_cp_remote.
      CATCH     /iwbep/cx_gateway.
      CATCH     cx_web_http_client_error.
      CATCH     cx_http_dest_provider_error.

    ENDTRY.



  ENDMETHOD.
ENDCLASS.
