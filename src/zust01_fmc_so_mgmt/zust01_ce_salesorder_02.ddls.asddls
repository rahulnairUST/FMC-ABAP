@EndUserText.label: 'AMC: Sales order structure'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SALESORDER'
define custom entity ZUST01_CE_SALESORDER_02
{
  key SalesOrder                    : abap.char( 10 );
  key SalesOrderItem                : abap.numc( 6 );
      ScheduleLine                  : abap.numc( 4 );
      Material                      : abap.char( 40 );
      MaterialGroup                 : abap.char( 9 );
      ProductionPlant               : abap.char( 4 );
      StorageLocation               : abap.char( 4 );
      @Semantics.unitOfMeasure      : true
      OrderQuantitySAPUnit          : abap.unit( 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      ConfdOrderQtyByMatlAvailCheck : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      OpenConfdDelivQtyInOrdQtyUnit : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      ScheduleLineOrderQuantity     : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      CorrectedQtyInOrderQtyUnit    : abap.dec( 13, 3 );
}
