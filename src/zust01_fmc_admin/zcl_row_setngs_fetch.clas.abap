CLASS zcl_row_setngs_fetch DEFINITION
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



CLASS ZCL_ROW_SETNGS_FETCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.

    DATA: lr_t_planscr TYPE RANGE OF zust01_scrrow-planning_screen,
          lr_t_linenme TYPE RANGE OF zust01_scrrow-line_name.

    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).

    TRY.
        DATA(filter_condition) = io_request->get_filter( )->get_as_ranges( ).

*       Get LineName filter
        DATA(lr_t_range) = VALUE #( filter_condition[ name = 'LINE_NAME' ]-range DEFAULT gr_t_default ).

        if NOT lr_t_range is initial.

            lr_t_linenme = VALUE #( FOR lwa_range in lr_t_range
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
           NOT lr_t_linenme IS INITIAL.

            SELECT * FROM zust01_scrrow
                WHERE LINE_NAME in @lr_t_linenme
                  AND PLANNING_SCREEN in @lr_t_planscr
                    INTO TABLE @DATA(lt_final_data).

            if sy-subrc EQ 0.
                SORT lt_final_data by planning_screen
                                      line_name.
            ENDIF.

        ELSE.
            SELECT * FROM zust01_scrrow
            INTO TABLE @lt_final_data.

            if sy-subrc EQ 0.
                SORT lt_final_data by planning_screen
                                      line_name.
            ENDIF.

        ENDIF.


        LOOP AT lt_final_data ASSIGNING FIELD-SYMBOL(<fs_final>).
            <fs_final>-description = to_mixed( <fs_final>-description ).
        ENDLOOP.

        io_response->set_total_number_of_records( lines( lt_final_data ) ).
        io_response->set_data( lt_final_data ).

      CATCH cx_root INTO DATA(exception).

        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception(
                              exception )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
