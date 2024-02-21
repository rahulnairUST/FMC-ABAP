CLASS lhc_ZUST01_CE_PRODALLOCACTSTAT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zust01_ce_prodallocactstat RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zust01_ce_prodallocactstat.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zust01_ce_prodallocactstat.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zust01_ce_prodallocactstat.

    METHODS read FOR READ
      IMPORTING keys FOR READ zust01_ce_prodallocactstat RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zust01_ce_prodallocactstat.

ENDCLASS.

CLASS lhc_ZUST01_CE_PRODALLOCACTSTAT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.



    TRY.
        DATA: ls_entity_def LIKE LINE OF entities,
              ls_cvcallocdet TYPE ZUST01_CE_PRODALLOCACTSTAT.


        DATA(ls_entities) = VALUE #( entities[ 1 ]  DEFAULT ls_entity_def ).

        if NOT ls_entities is INITIAL.
            ls_cvcallocdet = CORRESPONDING #( ls_entities ).
            DATA(lo_cvcactcls) = NEW zust01_cl_prodallocactstat_01( ).
            TRY.
                data(lv_response) = lo_cvcactcls->set_activation_status( ls_cvcallocdet ).
              catch cx_http_dest_provider_error cx_web_http_client_error.
                "handle exception
            endtry.
        ENDIF.
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

CLASS lsc_ZUST01_CE_PRODALLOCACTSTAT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUST01_CE_PRODALLOCACTSTAT IMPLEMENTATION.

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
