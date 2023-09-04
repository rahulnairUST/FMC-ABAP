@EndUserText.label: 'Custom Entity for KeyFigure F4 Help'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_KEYFIG_F4'
define custom entity ZUST01_CE_KEYFIG_F4
{
    key PlanningScreen : zust01_fmc_amc_planning_screen;
    key line_name      : zust01_fmc_amc_line_name;
        description    : zust01_fmc_amc_row_descr;
 }
