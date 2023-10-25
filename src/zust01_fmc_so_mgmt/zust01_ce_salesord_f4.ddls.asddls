@EndUserText.label: 'Custom Entity for Sales Order F4 Help'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SALESORD_F4'
define custom entity ZUST01_CE_SALESORD_F4
{
    key SalesOrder : abap.char( 10 ) ;
    SalesOrderType : abap.char( 4 ) ;
    SalesOrganization : abap.char( 4 ) ;
 }
