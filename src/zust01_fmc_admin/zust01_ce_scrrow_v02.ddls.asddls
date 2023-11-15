@EndUserText.label: 'Custom Entity for Row Settings V2'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_ROW_SETNGS_FETCH'
define root custom entity ZUST01_CE_SCRROW_V02
{
  key planning_screen       : zust01_fmc_amc_planning_screen;
  key line_name             : zust01_fmc_amc_line_name;
  description               : zust01_fmc_amc_row_descr;
  sorting                   : zust01_fmc_amc_sorting;
  cvc_group_idx             : zust01_fmc_amc_group_level;
  editable                  : zust01_fmc_amc_editable;
  draft                     : zust01_fmc_amc_draft_mode;
  allow_keyfg_selection     : zust01_fmc_amc_allow_keyfg_sel;
  timeseries_table          : zust01_fmc_timeseries_table;
  read_selectionid          : zust01_fmc_ts_select_id_read;
  save_selectionid          : zust01_fmc_ts_select_id_write;
  line_name_save            : zust01_fmc_amc_line_name_save;
  line_name_backup          : zust01_fmc_line_name_backup;
  save_cons_check           : zust01_fmc_amc_save_cons_check;
  delta_update              : zust01_fmc_amc_delta_update;
  calculation_id            : zust01_fmc_amc_calculation_id;
  calculation_sequence      : zust01_fmc_amc_calc_sequence;
  cvc_format_1st_occurrance : zust01_fmc_cvc_format_1st_occ;
  cvc_display               : zust01_fmc_amc_row_cvc_display;
  cvc_color                 : zust01_fmc_amc_row_cvc_color;
  cvc_color_code            : zust01_fmc_row_cvc_color_code;
  keyfigure_color_code      : zust01_fmc_keyfig_color_code;
  bucket_color_code         : zust01_fmc_bucket_color_code;
  cvc_status_display        : zust01_fmc_cvc_status_display;
  cvc_status_color_code     : zust01_fmc_cvcstat_color_code;
  add_remove_orders         : zust01_fmc_add_remove_orders;
  notes_text_id             : zust01_fmc_amc_notes_text_id;
  created_by                : abp_creation_user;
  created_at                : abp_creation_tstmpl;
  local_last_changed_by     : abp_locinst_lastchange_user;
  local_last_changed_at     : abp_locinst_lastchange_tstmpl;
  last_changed_at           : abp_lastchange_tstmpl;
  
}
