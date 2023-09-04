CLASS lhc_ZUST01_USR_MGMT_DD DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zust01_usr_mgmt_dd RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zust01_usr_mgmt_dd.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zust01_usr_mgmt_dd.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zust01_usr_mgmt_dd.

    METHODS read FOR READ
      IMPORTING keys FOR READ zust01_usr_mgmt_dd RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zust01_usr_mgmt_dd.

ENDCLASS.

CLASS lhc_ZUST01_USR_MGMT_DD IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

  DATA: lt_data type table of ZUST01_USR_MGMT,
        ls_data type ZUST01_USR_MGMT.

  READ TABLE entities INTO DATA(ls_entities) INDEX 1.
  ls_data-uname = ls_entities-Uname.
  ls_data-company = ls_entities-Company.
  ls_data-planning_screen = ls_entities-PlanningScreen.
  ls_data-acess_type = ls_entities-AcessType.
  ls_data-status = ls_entities-Status.
  ls_data-cbuser = ls_entities-CBUser.

  INSERT zust01_usr_mgmt from @ls_data.

  ENDMETHOD.

  METHOD update.

  DATA: lt_data type table of ZUST01_USR_MGMT,
        ls_data type ZUST01_USR_MGMT.

  READ TABLE entities INTO DATA(ls_entities) INDEX 1.
  ls_data-uname = ls_entities-Uname.
  ls_data-company = ls_entities-Company.
  ls_data-planning_screen = ls_entities-PlanningScreen.
  ls_data-acess_type = ls_entities-AcessType.
  ls_data-status = ls_entities-Status.
  ls_data-cbuser = ls_entities-CBUser.

  UPDATE zust01_usr_mgmt from @ls_data.

  ENDMETHOD.

  METHOD delete.

  READ TABLE keys INTO DATA(ls_keys) INDEX 1.
  if sy-subrc is initial.
  select single * from zust01_usr_mgmt where uname eq @ls_keys-Uname and planning_screen eq @ls_keys-PlanningScreen
  into @data(ls_user_data).
  DELETE zust01_usr_mgmt from @ls_user_data.
  endif.
  ENDMETHOD.

  METHOD read.

  DATA ls_data type zust01_usr_mgmt_dd.
  READ TABLE keys INTO DATA(ls_keys) INDEX 1.
  if sy-subrc is initial.
  select single * from zust01_usr_mgmt where uname eq @ls_keys-uname into @DATA(ls_usr_mgmt).
  MOVE-CORRESPONDING ls_usr_mgmt to ls_data.

  endif.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUST01_USR_MGMT_DD DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUST01_USR_MGMT_DD IMPLEMENTATION.

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
