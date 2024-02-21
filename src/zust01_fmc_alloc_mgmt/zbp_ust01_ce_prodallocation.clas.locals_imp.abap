CLASS lhc_ZUST01_CE_PRODALLOCATION DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zust01_ce_prodallocation RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zust01_ce_prodallocation.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zust01_ce_prodallocation.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zust01_ce_prodallocation.

    METHODS read FOR READ
      IMPORTING keys FOR READ zust01_ce_prodallocation RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zust01_ce_prodallocation.

ENDCLASS.

CLASS lhc_ZUST01_CE_PRODALLOCATION IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.

    TYPES: BEGIN OF ty_business_data,
             ProdAllocationTimeSeriesUUID TYPE zust01_a_prodallocobjtimeserie-ProdAllocationTimeSeriesUUID,
           END OF ty_business_data.

    TYPES: BEGIN OF ty_entity_key,
             ProdAllocationTimeSeriesUUID TYPE zust01_a_prodallocobjtimeserie-ProdAllocationTimeSeriesUUID,
           END OF ty_entity_key.

    DATA:
      ls_business_data TYPE zust01_a_prodallocobjtimeserie,
      ls_bus_data_resp TYPE zust01_a_prodallocobjtimeserie,
      ls_entity_key    TYPE ty_entity_key,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_request       TYPE REF TO /iwbep/if_cp_request_update,
      lo_response      TYPE REF TO /iwbep/if_cp_response_update.

    DATA: lo_struct_type TYPE REF TO cl_abap_structdescr,
          lt_comp_tab    TYPE cl_abap_structdescr=>component_table.

    DATA: ls_prodalloc TYPE zust01_ce_prodallocation,
          lv_count TYPE i,
          lv_old_qty TYPE zust01_trc_ts-quantity_old.


    FIELD-SYMBOLS: <fs_tab> TYPE ANY TABLE,
                   <fs_fld> TYPE any.

    TRY.


        LOOP AT entities INTO DATA(ls_entities).

          ls_prodalloc = CORRESPONDING #( ls_entities ).

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



          DATA: lt_prodalloc TYPE TABLE OF zust01_ce_prodallocation.
          lo_struct_type ?= cl_abap_typedescr=>describe_by_data( ls_entities-%data ).
          lt_comp_tab  = lo_struct_type->get_components( ).

          CLEAR ls_business_data.
          LOOP AT lt_comp_tab ASSIGNING FIELD-SYMBOL(<fs_comp>).



            CASE <fs_comp>-name.
              WHEN 'TIMESERIESUUID1'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO FIELD-SYMBOL(<fs_timeser_val>).
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty1.
                lv_old_qty = ls_entities-ProdAllocOldQty1.


              WHEN 'TIMESERIESUUID2'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty2.
                lv_old_qty = ls_entities-ProdAllocOldQty2.

              WHEN 'TIMESERIESUUID3'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty3.
                lv_old_qty = ls_entities-ProdAllocOldQty3.

              WHEN 'TIMESERIESUUID4'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty4.
                lv_old_qty = ls_entities-ProdAllocOldQty4.

              WHEN 'TIMESERIESUUID5'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty5.
                lv_old_qty = ls_entities-ProdAllocOldQty5.


              WHEN 'TIMESERIESUUID6'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty6.
                lv_old_qty = ls_entities-ProdAllocOldQty6.


              WHEN 'TIMESERIESUUID7'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty7.
                lv_old_qty = ls_entities-ProdAllocOldQty7.


              WHEN 'TIMESERIESUUID8'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty8.
                lv_old_qty = ls_entities-ProdAllocOldQty8.

              WHEN 'TIMESERIESUUID9'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty9.
                lv_old_qty = ls_entities-ProdAllocOldQty9.

              WHEN 'TIMESERIESUUID10'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty10.
                lv_old_qty = ls_entities-ProdAllocOldQty10.

              WHEN 'TIMESERIESUUID11'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty11.
                lv_old_qty = ls_entities-ProdAllocOldQty11.

              WHEN 'TIMESERIESUUID12'.
                ASSIGN COMPONENT <fs_comp>-name OF STRUCTURE ls_entities TO <fs_timeser_val>.
                ls_business_data-ProdAllocationTimeSeriesUUID = <fs_timeser_val>.
                ls_business_data-ProductAllocationQuantity = ls_entities-productallocationqty12.
                lv_old_qty = ls_entities-ProdAllocOldQty12.

            ENDCASE.

            IF NOT ls_business_data-ProductAllocationQuantity IS INITIAL
                AND NOT ls_business_data-ProdAllocationTimeSeriesUUID IS INITIAL.

              lv_count = lv_count + 1.
              ls_entity_key = VALUE #(
                    ProdAllocationTimeSeriesUUID  = ls_business_data-ProdAllocationTimeSeriesUUID ).

              lo_resource = lo_client_proxy->create_resource_for_entity_set( 'A_PRODALLOCOBJTIMESERIES' )->navigate_with_key( ls_entity_key ).
              lo_request = lo_resource->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-patch ).


              lo_request->set_business_data( is_business_data = ls_business_data it_provided_property = VALUE #(
              ( |PRODALLOCATIONTIMESERIESUUID| )
              ( |CHARCVALUECOMBINATIONUUID| )
              ( |PRODUCTALLOCATIONOBJECTUUID| )
              ( |PRODUCTALLOCATIONQUANTITY| )  ) ).


              " Execute the request and retrieve the business data
              lo_response = lo_request->execute( ).
*            lo_response->get_business_data( importing es_business_data = ls_bus_data_resp ).


              DATA(lo_logentry) = NEW zust01_fmc_log(  ).
              lo_logentry->create_log_entry( iv_old_qty = lv_old_qty
                                             if_planning_screen = ls_entities-PlanningScreen
                                             if_count   = lv_count
                                             if_event = 'MANUAL CHANGE'
                                             if_keyfigure = 'ALLOC_QTY'
                                             is_timeseries = ls_business_data
                                             is_prodalloc = ls_prodalloc ).
              CLEAR ls_business_data.
            ENDIF.


          ENDLOOP.



        ENDLOOP.


      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.

  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUST01_CE_PRODALLOCATION DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUST01_CE_PRODALLOCATION IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
