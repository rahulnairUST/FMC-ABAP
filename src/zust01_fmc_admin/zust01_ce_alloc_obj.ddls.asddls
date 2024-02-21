@EndUserText.label: 'Custom Entity for Allocation Object F4'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_ALLOC_OBJ_F4'
define root custom entity ZUST01_CE_ALLOC_OBJ
{
    key ProductAllocationObjectUUID : sysuuid_x16 ;
    ProductAllocationObject : abap.char( 40 ) ;
    ProductAllocationObject_Text : abap.char( 255 ) ;
}
