@EndUserText.label: 'Custom Entity for Column Settings V2'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_COL_SETNGS_FETCH'
define root custom entity ZUST01_CE_SCRCOL_V02
{
  key planning_screen : zust01_fmc_amc_planning_screen;
  key column_name     : zust01_fmc_amc_column_name;
  characteristic      : zust01_fmc_amc_characteristic;
  description         : zust01_fmc_amc_column_descr;
  ddic_ref            : abap.char(30);
  column_type         : zust01_fmc_amc_column_type;
  material_display    : abap.char(1);
  customer_display    : abap.char(1);
  sorting             : zust01_fmc_amc_sorting;
  collapsible         : zust01_fmc_amc_bool;
  column_fixed        : zust01_fmc_amc_bool;
  cvc_display         : abap.char(1);
  cvc_color_code      : zust01_fmc_row_cvc_color_code;
  zapi_field          : zust01_fmc_amc_column_name;
  zapi_service        : abap.char(40);
  
}
