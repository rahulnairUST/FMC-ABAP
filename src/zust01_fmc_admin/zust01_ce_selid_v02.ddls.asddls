@EndUserText.label: 'Custom Entity for Selection IDs V2'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_SELIDS_FETCH'
define root custom entity ZUST01_CE_SELID_V02
{
  key selection_id : zust01_fmc_amc_ts_selection_id;
  source           : zust01_fmc_amc_data_source;
  
}
