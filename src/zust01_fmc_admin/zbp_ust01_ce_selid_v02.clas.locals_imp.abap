CLASS lhc_ZUST01_CE_SELID_V02 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zust01_ce_selid_v02 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zust01_ce_selid_v02.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zust01_ce_selid_v02.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zust01_ce_selid_v02.

    METHODS read FOR READ
      IMPORTING keys FOR READ zust01_ce_selid_v02 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zust01_ce_selid_v02.

ENDCLASS.

CLASS lhc_ZUST01_CE_SELID_V02 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

  data ls_selidtable type zust01_selid.
  data lt_selidtable type table of zust01_selid.
  read table entities into data(ls_entities) index 1.

  MOVE-CORRESPONDING ls_entities to ls_selidtable.
  ls_selidtable-mandt = '100'.

  insert zust01_selid from @ls_selidtable.

  ENDMETHOD.

  METHOD update.

  data ls_selidtable type zust01_selid.
  data lt_selidtable type table of zust01_selid.
  read table entities into data(ls_entities) index 1.

  MOVE-CORRESPONDING ls_entities to ls_selidtable.
  ls_selidtable-mandt = '100'.

  update zust01_selid from @ls_selidtable.

  ENDMETHOD.

  METHOD delete.

  read table keys into data(ls_keys) index 1.
  delete from zust01_selid where selection_id eq @ls_keys-selection_id.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUST01_CE_SELID_V02 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUST01_CE_SELID_V02 IMPLEMENTATION.

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
