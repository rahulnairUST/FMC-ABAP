@EndUserText.label: 'Custom Entity for Sales Order Item'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SALESORDITM_F4'
define custom entity ZUST01_CE_SALESORDITM_F4
{
   key SalesOrder : abap.char( 10 ) ; 
   key SalesOrderItem : abap.numc( 6 ) ;
   SalesOrderItemText : abap.char( 40 ) ;  
  
}
