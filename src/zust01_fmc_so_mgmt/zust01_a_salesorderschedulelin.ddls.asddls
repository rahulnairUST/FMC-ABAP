/********** GENERATED on 08/17/2023 at 08:59:26 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderScheduleLine' 
 @OData.entityType.name: 'A_SalesOrderScheduleLineType' 
 define root abstract entity ZUST01_A_SALESORDERSCHEDULELIN { 
 key SalesOrder : abap.char( 10 ) ; 
 key SalesOrderItem : abap.numc( 6 ) ; 
 key ScheduleLine : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'RequestedDeliveryDate_vc' 
 RequestedDeliveryDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 RequestedDeliveryDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConfirmedDeliveryDate_vc' 
 ConfirmedDeliveryDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ConfirmedDeliveryDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderQuantityUnit_vc' 
 OrderQuantityUnit : abap.char( 3 ) ; 
 OrderQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderQuantitySAPUnit_vc' 
 @Semantics.unitOfMeasure: true 
 OrderQuantitySAPUnit : abap.unit( 3 ) ; 
 OrderQuantitySAPUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderQuantityISOUnit_vc' 
 OrderQuantityISOUnit : abap.char( 3 ) ; 
 OrderQuantityISOUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ScheduleLineOrderQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 ScheduleLineOrderQuantity : abap.dec( 13, 3 ) ; 
 ScheduleLineOrderQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConfdOrderQtyByMatlAvailChe_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 ConfdOrderQtyByMatlAvailCheck : abap.dec( 13, 3 ) ; 
 ConfdOrderQtyByMatlAvailChe_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveredQtyInOrderQtyUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 DeliveredQtyInOrderQtyUnit : abap.dec( 13, 3 ) ; 
 DeliveredQtyInOrderQtyUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OpenConfdDelivQtyInOrdQtyUn_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 OpenConfdDelivQtyInOrdQtyUnit : abap.dec( 13, 3 ) ; 
 OpenConfdDelivQtyInOrdQtyUn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CorrectedQtyInOrderQtyUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 CorrectedQtyInOrderQtyUnit : abap.dec( 13, 3 ) ; 
 CorrectedQtyInOrderQtyUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DelivBlockReasonForSchedLin_vc' 
 DelivBlockReasonForSchedLine : abap.char( 2 ) ; 
 DelivBlockReasonForSchedLin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
