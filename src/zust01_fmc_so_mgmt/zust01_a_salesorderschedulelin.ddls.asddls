/********** GENERATED on 08/17/2023 at 08:59:26 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderScheduleLine' 
 @OData.entityType.name: 'A_SalesOrderScheduleLineType' 
 define root abstract entity ZUST01_A_SALESORDERSCHEDULELIN { 
 key SalesOrder : abap.char( 10 ) ; 
 key SalesOrderItem : abap.numc( 6 ) ; 
 key ScheduleLine : abap.numc( 4 ) ; 
 @OData.property.valueControl: 'RequestedDeliveryDate_vc' 
 RequestedDeliveryDate : rap_cp_odata_v2_edm_datetime ; 
 RequestedDeliveryDate_vc : rap_cp_odata_value_control ; 
      ArrivalTime : abap.char( 6 );
      MaterialAvailDate : rap_cp_odata_v2_edm_datetime;
      MaterialStagTime : abap.char( 6 ); 
      GoodsIssueDate : rap_cp_odata_v2_edm_datetime;
      GoodsIssueTime : abap.char( 6 );
 @OData.property.valueControl: 'ConfirmedDeliveryDate_vc' 
 ConfirmedDeliveryDate : rap_cp_odata_v2_edm_datetime ; 
 ConfirmedDeliveryDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrderQuantityUnit_vc' 
 OrderQuantityUnit : abap.char( 3 ) ; 
 OrderQuantityUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrderQuantitySAPUnit_vc' 
 @Semantics.unitOfMeasure: true 
 OrderQuantitySAPUnit : abap.unit( 3 ) ; 
 OrderQuantitySAPUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrderQuantityISOUnit_vc' 
 OrderQuantityISOUnit : abap.char( 3 ) ; 
 OrderQuantityISOUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ScheduleLineOrderQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 ScheduleLineOrderQuantity : abap.dec( 13, 3 ) ; 
 ScheduleLineOrderQuantity_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ConfdOrderQtyByMatlAvailChe_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 ConfdOrderQtyByMatlAvailCheck : abap.dec( 13, 3 ) ; 
 ConfdOrderQtyByMatlAvailChe_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DeliveredQtyInOrderQtyUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 DeliveredQtyInOrderQtyUnit : abap.dec( 13, 3 ) ; 
 DeliveredQtyInOrderQtyUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OpenConfdDelivQtyInOrdQtyUn_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 OpenConfdDelivQtyInOrdQtyUnit : abap.dec( 13, 3 ) ; 
 OpenConfdDelivQtyInOrdQtyUn_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CorrectedQtyInOrderQtyUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 CorrectedQtyInOrderQtyUnit : abap.dec( 13, 3 ) ; 
 CorrectedQtyInOrderQtyUnit_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DelivBlockReasonForSchedLin_vc' 
 DelivBlockReasonForSchedLine : abap.char( 2 ) ; 
 DelivBlockReasonForSchedLin_vc : rap_cp_odata_value_control ; 
 
 } 
