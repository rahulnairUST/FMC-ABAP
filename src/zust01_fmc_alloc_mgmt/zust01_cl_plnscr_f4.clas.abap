CLASS zust01_cl_plnscr_f4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUST01_CL_PLNSCR_F4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).


  DATA: lt_final_data type table of zust01_ce_plngscr_f4,
        ls_final_data type zust01_ce_plngscr_f4.

  select * from zust01_usr_mgmt where cbuser eq @sy-uname into table @data(lt_user).
 if sy-subrc eq 0.
    select * from zust01_scrheadv for all entries in @lt_user where
    planning_screen eq @lt_user-planning_screen into table @data(lt_pln_data).
    if sy-subrc eq 0.
    loop at lt_user into data(ls_user).
          ls_final_data-uname = ls_user-Uname.
          ls_final_data-company = ls_user-Company.
          ls_final_data-PlanningScreen = ls_user-planning_screen.
          ls_final_data-AccessType = ls_user-acess_type.
          ls_final_data-Status = ls_user-status.
          ls_final_data-CBUser = ls_user-cbuser.
        read table lt_pln_data into data(ls_pln_data) with key PLANNING_SCREEN = ls_user-planning_screen.
        ls_final_data-PlanningScreenDescr = ls_pln_data-planning_screen_descr.
        APPEND ls_final_data to lt_final_data.
    endloop.
    TRY.
        io_response->set_total_number_of_records( lines( lt_final_data ) ).
        io_response->set_data( lt_final_data ).

      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.
    endif.
 endif.

  ENDMETHOD.
ENDCLASS.
