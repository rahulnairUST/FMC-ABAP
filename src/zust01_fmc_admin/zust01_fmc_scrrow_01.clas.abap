CLASS zust01_fmc_scrrow_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.

    TYPES: t_scrrow TYPE TABLE OF zust01_ce_scrrow_01 WITH DEFAULT KEY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zust01_fmc_scrrow_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_scrcol TYPE TABLE OF zust01_scrcol,
          lt_scrrow TYPE TABLE OF zust01_scrrow.
*    DELETE FROM zust01_scrcol.
*
*
*    lt_scrcol = VALUE #( (  mandt = '100'
*                            planning_screen = 'ZUST_FMC_ALLOC_DEMO'
*                            column_name = 'KDGRP'
*                            CHARACTERISTIC = 'ProdAllocCharc02'
*                            description = 'Customer group'
*                            DDIC_REF    = 'KDGRP'
*                            SORTING     = 2
*                            CVC_DISPLAY = 'X'
*                            zapi_field = 'CustomerGroup'
*                            zapi_service = 'A_SALESORDER'
*                             )
*
*                            ( mandt = '100'
*                            planning_screen = 'ZUST_FMC_ALLOC_DEMO'
*                            column_name = 'KUNNR'
*                            CHARACTERISTIC = 'ProdAllocCharc03'
*                            description = 'Customer'
*                            DDIC_REF    = 'KUNNR'
*                            SORTING     = 3
*                            CVC_DISPLAY = 'X'
*                            zapi_field  = 'SoldToParty'
*                            zapi_service = 'A_SALESORDER' )
*
*                            ( mandt = '100'
*                            planning_screen = 'ZUST_FMC_ALLOC_DEMO'
*                            column_name = 'MATNR'
*                            CHARACTERISTIC = 'ProdAllocCharc01'
*                            description = 'Material'
*                            DDIC_REF    = 'MATNR'
*                            SORTING     = 1
*                            CVC_DISPLAY = 'X'
*                            zapi_field  = 'Material'
*                            zapi_service = 'A_SALESORDERITEM' )
*
*                           ).
*
*** Insert initial data

*    INSERT zust01_scrcol FROM TABLE @lt_scrcol.



*    lt_scrrow = VALUE #( (  mandt = '100'
*                            planning_screen = 'ZUST_FMC_ALLOC_DEMO'
*                            line_name = 'ALLOCATION_QTY'
*                            description = 'Allocation Qty'
*                            allow_keyfg_selection = 'X' )





    lt_scrrow = VALUE #( (  mandt = '100'
                            planning_screen = 'ZUST_FMC_ALLOC_DEMO'
                            line_name = 'ALLOCATION_QTY'
                            description = 'Allocation Qty'
                            allow_keyfg_selection = 'X'
                            sorting = 1 )

                            ( mandt = '100'
                              planning_screen = 'ZUST_FMC_ALLOC_DEMO'
                              line_name = 'ORDER_INCOMING_QTY'
                              description = 'Order Incoming Qty'
                              allow_keyfg_selection = 'X'
                              sorting = 2 )

                            ( mandt = '100'
                              planning_screen = 'ZUST_FMC_ALLOC_DEMO'
                              line_name = 'REMAINING_QTY'
                              description = 'Remaining Qty'
                              allow_keyfg_selection = 'X'
                              sorting = 3 )

                          ( mandt = '100'
                            planning_screen = 'ZUST_FMC_ALLOC_DEMO'
                            line_name = 'REMAINING_QTY_PERCENT'
                            description = 'Remaining Qty [%]'
                            allow_keyfg_selection = 'X'
                            sorting = 4 )

                            ( mandt = '100'
                              planning_screen = 'ZUST_FMC_ALLOC_DEMO'
                              line_name = 'MT_STOCK_AND_RECEIPTS'
                              description = 'Stock and receipts'
                              allow_keyfg_selection = 'X'
                              sorting = 5 )

                            ( mandt = '100'
                              planning_screen = 'ZUST_FMC_ALLOC_DEMO'
                              line_name = 'MT_STOCK_AND_RECEIPTS_CUM'
                              description = 'Stock and receipts, cumulated'
                              allow_keyfg_selection = 'X'
                              sorting = 5 )

                          ).
*
** Delete older data
    DELETE FROM zust01_scrrow.
*
* Insert initial data
    INSERT zust01_scrrow FROM TABLE @lt_scrrow.

  ENDMETHOD.


  METHOD if_rap_query_provider~select.

    TRY.

        DATA: lt_scrrow TYPE t_scrrow.

        DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).

*        LOOP AT filter_condition ASSIGNING FIELD-SYMBOL(<fs_filter>).
*
*            con
*
*        ENDLOOP.

        DATA(lv_planning_screen) = VALUE #( filter_condition[ 1 ]-range[ 1 ]-low DEFAULT '').

        SELECT planningscreen,
               linename,
               'X' AS selected
          FROM zust01_dscrow000
          WHERE planningscreen = @lv_planning_screen
            AND allowkeyfgselection = @abap_true
            INTO TABLE @lt_scrrow.

        IF sy-subrc EQ 0.
*       OData result/push back to web service
          io_response->set_total_number_of_records( lines( lt_scrrow ) ).
          io_response->set_data( lt_scrrow ).


        ENDIF.

      CATCH /iwbep/cx_cp_remote.
      CATCH     /iwbep/cx_gateway.
      CATCH     cx_web_http_client_error.
      CATCH     cx_http_dest_provider_error.

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
