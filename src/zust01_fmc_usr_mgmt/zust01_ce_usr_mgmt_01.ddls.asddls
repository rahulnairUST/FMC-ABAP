@EndUserText.label: 'Custom Entity for User Management'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_FMC_ADMIN'
define custom entity ZUST01_CE_USR_MGMT_01
{
  key uname : abap.char(12);
  key planning_screen : zust01_fmc_amc_planning_screen;
  company         : abap.char(30);
  acess_type      : abap.char(4);
  status          : zust01_fmc_amc_bool; 
}
