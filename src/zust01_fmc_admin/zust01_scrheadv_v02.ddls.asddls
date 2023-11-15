@EndUserText.label: 'Custom Entity for Header Settings V2'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_HDR_SETNGS_FETCH'
define root custom entity zust01_scrheadv_v02
{
  key planning_screen           : zust01_fmc_amc_planning_screen;
  planning_screen_descr         : zust01_fmc_amc_planning_scrn_t;
  product_allocation_object     : zust01_fmc_amc_prodallocobject;
  buck_disp_format              : zust01_fmc_amc_buckt_disp_form;
  excel_import                  : zust01_fmc_amc_bool;
  button_cvc_collapse           : zust01_fmc_amc_bool;
  button_cvc_paging             : zust01_fmc_amc_bool;
  cvc_status_log_write          : zust01_fmc_amc_bool;
  timeseries_log_write          : zust01_fmc_amc_bool;
  cvc_log_display               : zust01_fmc_amc_cvc_log_display;
  trace_display                 : zust01_fmc_amc_trace_display;
  cvc_status_change_disp_option : zust01_fmc_amc_stat_chg_disp;
  cvc_status_change             : zust01_fmc_amc_status_change;
  button_refresh                : zust01_fmc_amc_bool;
  draft_display                 : zust01_fmc_amc_draft_display;
  draft_multi_user              : zust01_fmc_amc_bool;
  allow_notes                   : zust01_fmc_amc_allow_notes;
  consumption_view              : zust01_fmc_amc_consumption_vw;
  cvc_add_remove                : zust01_fmc_amc_bool;
  sales_order_view              : zust01_fmc_amc_bool;
  user_settings                 : zust01_fmc_amc_bool;
  period_indicator              : zust01_fmc_amc_perkz;
  fiscal_year_variant           : zust01_fmc_amc_periv;
  created_by                    : abp_creation_user;
  created_at                    : abp_creation_tstmpl;
  local_last_changed_by         : abp_locinst_lastchange_user;
  local_last_chagned_at         : abp_locinst_lastchange_tstmpl;
  last_changed_at               : abp_lastchange_tstmpl;
  
}
