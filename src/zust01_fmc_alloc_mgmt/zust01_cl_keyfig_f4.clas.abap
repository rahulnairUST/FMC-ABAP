CLASS zust01_cl_keyfig_f4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUST01_CL_KEYFIG_F4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.

    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).

    DATA: lt_final_data TYPE TABLE OF zust01_ce_keyfig_f4,
          ls_final_data TYPE zust01_ce_keyfig_f4,
          ls_filter_def TYPE if_rap_query_filter=>ty_name_range_pairs.


    DATA(lt_filter_cond)    = io_request->get_filter( )->get_as_ranges( ).
    DATA(ls_filter_cond)    = VALUE #( lt_filter_cond[ name = 'PLANNINGSCREEN' ] DEFAULT ls_filter_def ).
    DATA(lv_planning_scr)   = VALUE #( ls_filter_cond-range[ 1 ]-low DEFAULT '' ).

    SELECT *
      FROM zust01_scrrow
        WHERE Planning_Screen       = @lv_planning_scr
          AND allow_keyfg_selection = @abap_true
            INTO TABLE @DATA(lt_keyfig).

    IF sy-subrc EQ 0.

      loop at lt_keyfig into data(ls_keyfig).

        ls_final_data-PlanningScreen = ls_keyfig-planning_screen.
        ls_final_data-line_name = ls_keyfig-line_name.
        ls_final_data-description = ls_keyfig-description.
        append ls_final_data to lt_final_data.

      endloop.

      TRY.
          io_response->set_total_number_of_records( lines( lt_final_data ) ).
          io_response->set_data( lt_final_data ).

        CATCH cx_root INTO DATA(exception).
          DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                              exception )->if_message~get_longtext( ).
      ENDTRY.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
