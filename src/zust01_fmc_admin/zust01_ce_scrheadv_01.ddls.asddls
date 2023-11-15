@EndUserText.label: 'Custom Entity for SCRHEADV'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_FMC_ADMIN'
define custom entity ZUST01_CE_SCRHEADV_01

{
  key planning_screen               : zust01_fmc_amc_planning_screen;
      planning_screen_descr         : zust01_fmc_amc_planning_scrn_t;
      product_allocation_object     : zust01_fmc_amc_prodallocobject;
      buck_disp_format              : zust01_fmc_amc_buckt_disp_form;
      excel_import                  : zust01_fmc_amc_xls_import;
      button_cvc_collapse           : zust01_fmc_amc_toolbr_collapse;
      button_cvc_paging             : zust01_fmc_amc_toolbar_paging;
      cvc_status_log_write          : zust01_fmc_amc_stat_log_write;
      timeseries_log_write          : zust01_fmc_amc_ts_log_write;
      cvc_log_display               : zust01_fmc_amc_cvc_log_display;
      trace_display                 : zust01_fmc_amc_trace_display;
      cvc_status_change_disp_option : zust01_fmc_amc_stat_chg_disp;
      cvc_status_change             : zust01_fmc_amc_status_change;
      button_refresh                : zust01_fmc_amc_toolbar_refresh;
      draft_display                 : zust01_fmc_amc_draft_display;
      draft_multi_user              : zust01_fmc_amc_draft_multi_usr;
      allow_notes                   : zust01_fmc_amc_allow_notes;
      cvc_add_remove                : zust01_fmc_amc_add_remove_cvcs;
      sales_order_view              : zust01_fmc_amc_toolbar_ord_vw;
      user_settings                 : zust01_fmc_amc_user_settings;
      period_indicator              : zust01_fmc_amc_perkz;
      fiscal_year_variant           : zust01_fmc_amc_periv;
      created_by                    : abp_creation_user;
      created_at                    : abp_creation_tstmpl;
      local_last_changed_by         : abp_locinst_lastchange_user;
      local_last_chagned_at         : abp_locinst_lastchange_tstmpl;
      last_changed_at               : abp_lastchange_tstmpl;

}
