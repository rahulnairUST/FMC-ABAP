CLASS zcl_col_setngs_fetch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider .

    TYPES: gty_r_default TYPE if_rap_query_filter=>tt_range_option.
    DATA : gr_t_default TYPE gty_r_default.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_COL_SETNGS_FETCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.

  DATA: lr_t_planscr TYPE RANGE OF zust01_scrcol-planning_screen,
          lr_t_colnme TYPE RANGE OF zust01_scrcol-column_name.

   DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).

    DATA: lt_final_data type table of zust01_ce_scrcol_v02,
        ls_final_data type zust01_ce_scrcol_v02.

    TRY.
    DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).

*       Get Column Name filter
        DATA(lr_t_range) = VALUE #( filter_condition[ name = 'COLUMN_NAME' ]-range DEFAULT gr_t_default ).

        if NOT lr_t_range is initial.

            lr_t_colnme = VALUE #( FOR lwa_range in lr_t_range
                                        ( sign = 'I'
                                          option = 'EQ'
                                          low = lwa_range-low ) ).

        ENDIF.

*       Get PLANNINGSCREEN filter
        lr_t_range = VALUE #( filter_condition[ name = 'PLANNING_SCREEN' ]-range DEFAULT gr_t_default ).

        if NOT lr_t_range is initial.

            lr_t_planscr = VALUE #( FOR lwa_range in lr_t_range
                                        ( sign = 'I'
                                          option = 'EQ'
                                          low = lwa_range-low ) ).

        ENDIF.

        IF NOT lr_t_planscr IS INITIAL OR
           NOT lr_t_colnme IS INITIAL.

           select * from zust01_scrcol
           where planning_screen in @lr_t_planscr and
           column_name in @lr_t_colnme into CORRESPONDING FIELDS OF table @lt_final_data.

            if sy-subrc EQ 0.
                SORT lt_final_data by planning_screen
                                      column_name.
            ENDIF.

        ELSE.
            select * from zust01_scrcol into
            CORRESPONDING FIELDS OF table @lt_final_data.

            if sy-subrc EQ 0.
                SORT lt_final_data by planning_screen
                                      column_name.
            ENDIF.

        ENDIF.

        io_response->set_total_number_of_records( lines( lt_final_data ) ).
        io_response->set_data( lt_final_data ).

      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                            exception )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
