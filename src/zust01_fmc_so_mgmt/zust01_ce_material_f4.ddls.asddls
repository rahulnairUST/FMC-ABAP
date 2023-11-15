@EndUserText.label: 'Custom Entity for Material F4 Help'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_MATERIAL_F4'
define custom entity ZUST01_CE_MATERIAL_F4
{
    key Material : abap.char( 40 ) ;
    MaterialDescription : abap.char( 40 ) ;
    Language : abap.char( 1 ) ;
 }
