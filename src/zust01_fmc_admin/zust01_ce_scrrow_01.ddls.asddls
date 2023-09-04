@EndUserText.label: 'key figure selection'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_FMC_SCRROW_01'
define custom entity ZUST01_CE_SCRROW_01
{
  key planningscreen     : zust01_fmc_amc_planning_screen ;
  key linename           : zust01_fmc_amc_line_name ;
      selected           : zust01_fmc_amc_selected; 
  
}

