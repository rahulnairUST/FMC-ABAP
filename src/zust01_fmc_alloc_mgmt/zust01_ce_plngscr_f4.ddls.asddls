@EndUserText.label: 'Custom Entity for Planning Screen F4 Help'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_PLNSCR_F4'
define custom entity ZUST01_CE_PLNGSCR_F4
{
    key Uname       : abap.char(12);
    Company         : abap.char(30);
    PlanningScreen : zust01_fmc_amc_planning_screen;
    PlanningScreenDescr: zust01_fmc_amc_planning_scrn_t; 
    AccessType      : abap.char(4);
    Status          : zust01_fmc_amc_bool;
    CBUser          : abap.char(12);
}
