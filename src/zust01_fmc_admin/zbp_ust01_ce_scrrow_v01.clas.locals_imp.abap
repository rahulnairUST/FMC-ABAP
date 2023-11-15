CLASS lhc_ZUST01_CE_SCRROW_V01 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zust01_ce_scrrow_v01 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zust01_ce_scrrow_v01.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zust01_ce_scrrow_v01.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zust01_ce_scrrow_v01.

    METHODS read FOR READ
      IMPORTING keys FOR READ zust01_ce_scrrow_v01 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zust01_ce_scrrow_v01.

ENDCLASS.

CLASS lhc_ZUST01_CE_SCRROW_V01 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

  data ls_rowtable type zust01_scrrow_01.
  data lt_rowtable type table of zust01_scrrow_01.
  read table entities into data(ls_entities) index 1.

  MOVE-CORRESPONDING ls_entities to ls_rowtable.
  ls_rowtable-mandt = '100'.

  modify zust01_scrrow_01 from @ls_rowtable.

*  ls_rowtable-mandt = '100'.
*  ls_rowtable-planning_screen = ls_entities-PlanningScreen.
*  ls_rowtable-line_name = ls_entities-LineName.
*  ls_rowtable-description = ls_entities-Description.
*  ls_rowtable-sorting = ls_entities-Sorting.
*  ls_rowtable-cvc_group_idx = ls_entities-CvcGroupIdx.
*  ls_rowtable-editable = ls_entities-Editable.
*  ls_rowtable-draft = ls_entities-Draft.
*  ls_rowtable-allow_keyfg_selection = ls_entities-AllowKeyfgSelection.
*  ls_rowtable-timeseries_table = ls_entities-TimeseriesTable.
*  ls_rowtable-read_selectionid = ls_entities-ReadSelectionid.
*  ls_rowtable-save_selectionid = ls_entities-SaveSelectionid.
*  ls_rowtable-line_name_save = ls_entities-LineNameSave.
*  ls_rowtable-line_name_backup = ls_entities-LineNameBackup.
*  ls_rowtable-save_cons_check = ls_entities-SaveConsCheck.
*  ls_rowtable-delta_update = ls_entities-DeltaUpdate.
*  ls_rowtable-calculation_id = ls_entities-CalculationId.
*  ls_rowtable-calculation_sequence = ls_entities-CalculationSequence.
*  ls_rowtable-cvc_format_1st_occurrance = ls_entities-CvcFormat1stOccurrance.
*  ls_rowtable-cvc_display = ls_entities-CvcDisplay.
*  ls_rowtable-cvc_color = ls_entities-CvcColor.
*  ls_rowtable-cvc_color_code = ls_entities-CvcColorCode.
*  ls_rowtable-keyfigure_color_code = ls_entities-KeyfigureColorCode.
*  ls_rowtable-bucket_color_code = ls_entities-BucketColorCode.
*  ls_rowtable-cvc_status_display = ls_entities-CvcStatusDisplay.
*  ls_rowtable-cvc_status_color_code = ls_entities-CvcStatusColorCode.
*  ls_rowtable-add_remove_orders = ls_entities-AddRemoveOrders.
*  ls_rowtable-notes_text_id = ls_entities-NotesTextId.
*  ls_rowtable-created_by = ls_entities-CreatedBy.
*  ls_rowtable-created_at = ls_entities-CreatedAt.
*  ls_rowtable-local_last_changed_by = ls_entities-LocalLastChangedBy.
*  ls_rowtable-local_last_changed_at = ls_entities-LocalLastChangedAt.
*  ls_rowtable-last_changed_at = ls_entities-LastChangedAt.
*
*  append ls_rowtable to lt_rowtable.
*
*  insert zust01_scrrow_01 from table @lt_rowtable.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUST01_CE_SCRROW_V01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUST01_CE_SCRROW_V01 IMPLEMENTATION.

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
