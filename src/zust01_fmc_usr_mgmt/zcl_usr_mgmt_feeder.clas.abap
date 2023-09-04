CLASS zcl_usr_mgmt_feeder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider.

    TYPES t_usr_mgmt  TYPE TABLE OF ZUST01_CE_USR_MGMT_01 WITH DEFAULT KEY.


      METHODS check_cbuser
      IMPORTING
        it_filter_cond   TYPE if_rap_query_filter=>tt_name_range_pairs   OPTIONAL
        top              TYPE i OPTIONAL
        skip             TYPE i OPTIONAL
      RETURNING VALUE(rt_user_info) TYPE  t_usr_mgmt
      RAISING
        /iwbep/cx_cp_remote
        /iwbep/cx_gateway
        cx_web_http_client_error
        cx_http_dest_provider_error.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_USR_MGMT_FEEDER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

DELETE FROM ZUST01_SCRROW.
*  DATA: lt_usr_mgmt TYPE TABLE OF zust01_usr_mgmt.
*
*  lt_usr_mgmt = VALUE #( ( uname = 'SPALVADI'
*                          company = 'UST Global'
*                          planning_screen = 'ZUST_FMC_ALLOC_DEMO'
*                          acess_type = 'FULL' )
*
*                          ( uname = 'JQUINTERO'
*                          company = 'UST Global'
*                          planning_screen = 'ZUST_FLEX_IOM_DEMO'
*                          acess_type = 'FULL' )
*
*                          ( uname = 'RNAIR'
*                          company = 'UST Global'
*                          planning_screen = 'ZUST_FMC_ALLOC_DEMO'
*                          acess_type = 'FULL' )
*                        ).
*
** Delete older data
*  DELETE FROM zust01_usr_mgmt.
*
** Insert initial data
*  INSERT zust01_usr_mgmt FROM TABLE @lt_usr_mgmt.


  DATA: lt_head_mgmt TYPE TABLE OF zust01_scrheadv.

  lt_head_mgmt = VALUE #( ( PLANNING_SCREEN = 'ZUST_FMC_ALLOC_DEMO'
                          PLANNING_SCREEN_DESCR = 'Allocation for Material CustomerGroup Customer'
                          PRODUCT_ALLOCATION_OBJECT = 'MT_AMC_MAT_CUSTGROUP_CUSTOMER'
                          BUCK_DISP_FORMAT = 'B' )

                          ( PLANNING_SCREEN = 'ZUST_FLEX_IOM_DEMO'
                          PLANNING_SCREEN_DESCR = 'Allocation for Material CustomerGroup Customer'
                          PRODUCT_ALLOCATION_OBJECT = 'MT_AMC_MAT_CUSTGROUP_CUSTOMER'
                          BUCK_DISP_FORMAT = 'B' )

                        ).

* Delete older data
  DELETE FROM zust01_scrheadv.

* Insert initial data
  INSERT zust01_scrheadv FROM TABLE @lt_head_mgmt.

*  UPDATE zust01_usr_mgmt SET CBUSER = 'CB9980000021'
*    WHERE UNAME = 'JQUINTERO'.

  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    try.
        DATA(lt_usr_mgmt) = check_cbuser(  ).
        io_response->set_total_number_of_records( lines( lt_usr_mgmt ) ).
        io_response->set_data( lt_usr_mgmt ).

    CATCH cx_root INTO DATA(lo_err).

    ENDTRY.

  ENDMETHOD.


  METHOD check_cbuser.

    select *
        FROM zust01_usr_mgmt
        WHERE cbuser = @sy-uname
      INTO CORRESPONDING FIELDS OF TABLE @rt_user_info.

   if sy-subrc EQ 0.

   ELSE.
*        APPEND VALUE #(
*          symsg-msgty      = 'E'
*          symsg-msgid      = '/N4C02/CM_HTTP_COMM'
*          symsg-msgno      = '006'
*          severity         = if_abap_behv_message=>severity-error
*          cid              = sales_order_item_out-cid
*        ) TO messages.


        RAISE EXCEPTION TYPE /iwbep/cx_gateway .
   ENDIF.

  ENDMETHOD.
ENDCLASS.
