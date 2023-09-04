@EndUserText.label: 'Custom Entity For Sales Order'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SALESORDER'
define custom entity ZUST01_CE_SALESORDER_01

{

  key SalesOrder                     : abap.char( 10 );
  key SalesOrderItem                 : abap.numc( 6 );
      ProdAllocPerdStartUTCDateTime  : abap.char(10);
      CVCFilter                      : abap.char( 120 );   
      @OData.property.valueControl   : 'HigherLevelItem_vc'
      HigherLevelItem                : abap.numc( 6 );
      HigherLevelItem_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'HigherLevelItemUsage_vc'
      HigherLevelItemUsage           : abap.char( 1 );
      HigherLevelItemUsage_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SalesOrderItemCategory_vc'
      SalesOrderItemCategory         : abap.char( 4 );
      SalesOrderItemCategory_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SalesOrderItemText_vc'
      SalesOrderItemText             : abap.char( 40 );
      SalesOrderItemText_vc          : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'PurchaseOrderByCustomer_vc'
      PurchaseOrderByCustomer        : abap.char( 35 );
      PurchaseOrderByCustomer_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'PurchaseOrderByShipToParty_vc'
      PurchaseOrderByShipToParty     : abap.char( 35 );
      PurchaseOrderByShipToParty_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'UnderlyingPurchaseOrderItem_vc'
      UnderlyingPurchaseOrderItem    : abap.char( 6 );
      UnderlyingPurchaseOrderItem_vc : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ExternalItemID_vc'
      ExternalItemID                 : abap.char( 40 );
      ExternalItemID_vc              : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'Material_vc'
      Material                       : abap.char( 40 );
      Material_vc                    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'MaterialByCustomer_vc'
      MaterialByCustomer             : abap.char( 35 );
      MaterialByCustomer_vc          : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'PricingDate_vc'
      PricingDate                    : rap_cp_odata_v2_edm_datetime;
      PricingDate_vc                 : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'PricingReferenceMaterial_vc'
      PricingReferenceMaterial       : abap.char( 40 );
      PricingReferenceMaterial_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'BillingPlan_vc'
      BillingPlan                    : abap.char( 10 );
      BillingPlan_vc                 : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'RequestedQuantity_vc'
      @Semantics.quantity.unitOfMeasure: 'RequestedQuantitySAPUnit'
      RequestedQuantity              : abap.dec( 15, 3 );
      RequestedQuantity_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'RequestedQuantityUnit_vc'
      RequestedQuantityUnit          : abap.char( 3 );
      RequestedQuantityUnit_vc       : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'RequestedQuantitySAPUnit_vc'
      @Semantics.unitOfMeasure       : true
      RequestedQuantitySAPUnit       : abap.unit( 3 );
      RequestedQuantitySAPUnit_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'RequestedQuantityISOUnit_vc'
      RequestedQuantityISOUnit       : abap.char( 3 );
      RequestedQuantityISOUnit_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'OrderQuantityUnit_vc'
      OrderQuantityUnit              : abap.char( 3 );
      OrderQuantityUnit_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'OrderQuantitySAPUnit_vc'
      @Semantics.unitOfMeasure       : true
      OrderQuantitySAPUnit           : abap.unit( 3 );
      OrderQuantitySAPUnit_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'OrderQuantityISOUnit_vc'
      OrderQuantityISOUnit           : abap.char( 3 );
      OrderQuantityISOUnit_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ConfdDelivQtyInOrderQtyUnit_vc'
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      ConfdDelivQtyInOrderQtyUnit    : abap.dec( 15, 3 );
      ConfdDelivQtyInOrderQtyUnit_vc : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemGrossWeight_vc'
      @Semantics.quantity.unitOfMeasure: 'ItemWeightSAPUnit'
      ItemGrossWeight                : abap.dec( 15, 3 );
      ItemGrossWeight_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemNetWeight_vc'
      @Semantics.quantity.unitOfMeasure: 'ItemWeightSAPUnit'
      ItemNetWeight                  : abap.dec( 15, 3 );
      ItemNetWeight_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemWeightUnit_vc'
      ItemWeightUnit                 : abap.char( 3 );
      ItemWeightUnit_vc              : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemWeightSAPUnit_vc'
      @Semantics.unitOfMeasure       : true
      ItemWeightSAPUnit              : abap.unit( 3 );
      ItemWeightSAPUnit_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemWeightISOUnit_vc'
      ItemWeightISOUnit              : abap.char( 3 );
      ItemWeightISOUnit_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemVolume_vc'
      @Semantics.quantity.unitOfMeasure: 'ItemVolumeSAPUnit'
      ItemVolume                     : abap.dec( 15, 3 );
      ItemVolume_vc                  : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemVolumeUnit_vc'
      ItemVolumeUnit                 : abap.char( 3 );
      ItemVolumeUnit_vc              : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemVolumeSAPUnit_vc'
      @Semantics.unitOfMeasure       : true
      ItemVolumeSAPUnit              : abap.unit( 3 );
      ItemVolumeSAPUnit_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemVolumeISOUnit_vc'
      ItemVolumeISOUnit              : abap.char( 3 );
      ItemVolumeISOUnit_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'TransactionCurrency_vc'
      @Semantics.currencyCode        : true
      TransactionCurrency            : abap.cuky;
      TransactionCurrency_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'NetAmount_vc'
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      NetAmount                      : abap.curr( 16, 2 );
      NetAmount_vc                   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'TotalSDDocReferenceStatus_vc'
      TotalSDDocReferenceStatus      : abap.char( 1 );
      TotalSDDocReferenceStatus_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SDDocReferenceStatus_vc'
      SDDocReferenceStatus           : abap.char( 1 );
      SDDocReferenceStatus_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'MaterialSubstitutionReason_vc'
      MaterialSubstitutionReason     : abap.char( 4 );
      MaterialSubstitutionReason_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'MaterialGroup_vc'
      MaterialGroup                  : abap.char( 9 );
      MaterialGroup_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'MaterialPricingGroup_vc'
      MaterialPricingGroup           : abap.char( 2 );
      MaterialPricingGroup_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AdditionalMaterialGroup1_vc'
      AdditionalMaterialGroup1       : abap.char( 3 );
      AdditionalMaterialGroup1_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AdditionalMaterialGroup2_vc'
      AdditionalMaterialGroup2       : abap.char( 3 );
      AdditionalMaterialGroup2_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AdditionalMaterialGroup3_vc'
      AdditionalMaterialGroup3       : abap.char( 3 );
      AdditionalMaterialGroup3_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AdditionalMaterialGroup4_vc'
      AdditionalMaterialGroup4       : abap.char( 3 );
      AdditionalMaterialGroup4_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AdditionalMaterialGroup5_vc'
      AdditionalMaterialGroup5       : abap.char( 3 );
      AdditionalMaterialGroup5_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'BillingDocumentDate_vc'
      BillingDocumentDate            : rap_cp_odata_v2_edm_datetime;
      BillingDocumentDate_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ContractAccount_vc'
      ContractAccount                : abap.char( 12 );
      ContractAccount_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AdditionalValueDays_vc'
      AdditionalValueDays            : abap.numc( 2 );
      AdditionalValueDays_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ServicesRenderedDate_vc'
      ServicesRenderedDate           : rap_cp_odata_v2_edm_datetime;
      ServicesRenderedDate_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'Batch_vc'
      Batch                          : abap.char( 10 );
      Batch_vc                       : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductionPlant_vc'
      ProductionPlant                : abap.char( 4 );
      ProductionPlant_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'OriginalPlant_vc'
      OriginalPlant                  : abap.char( 4 );
      OriginalPlant_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AltvBsdConfSubstitutionStat_vc'
      AltvBsdConfSubstitutionStatus  : abap.char( 1 );
      AltvBsdConfSubstitutionStat_vc : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'StorageLocation_vc'
      StorageLocation                : abap.char( 4 );
      StorageLocation_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'DeliveryGroup_vc'
      DeliveryGroup                  : abap.numc( 3 );
      DeliveryGroup_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ShippingPoint_vc'
      ShippingPoint                  : abap.char( 4 );
      ShippingPoint_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ShippingType_vc'
      ShippingType                   : abap.char( 2 );
      ShippingType_vc                : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'DeliveryPriority_vc'
      DeliveryPriority               : abap.numc( 2 );
      DeliveryPriority_vc            : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'DeliveryDateTypeRule_vc'
      DeliveryDateTypeRule           : abap.char( 1 );
      DeliveryDateTypeRule_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'IncotermsClassification_vc'
      IncotermsClassification        : abap.char( 3 );
      IncotermsClassification_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'IncotermsTransferLocation_vc'
      IncotermsTransferLocation      : abap.char( 28 );
      IncotermsTransferLocation_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'IncotermsLocation1_vc'
      IncotermsLocation1             : abap.char( 70 );
      IncotermsLocation1_vc          : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'IncotermsLocation2_vc'
      IncotermsLocation2             : abap.char( 70 );
      IncotermsLocation2_vc          : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'TaxAmount_vc'
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      TaxAmount                      : abap.curr( 14, 2 );
      TaxAmount_vc                   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification1_vc'
      ProductTaxClassification1      : abap.char( 1 );
      ProductTaxClassification1_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification2_vc'
      ProductTaxClassification2      : abap.char( 1 );
      ProductTaxClassification2_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification3_vc'
      ProductTaxClassification3      : abap.char( 1 );
      ProductTaxClassification3_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification4_vc'
      ProductTaxClassification4      : abap.char( 1 );
      ProductTaxClassification4_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification5_vc'
      ProductTaxClassification5      : abap.char( 1 );
      ProductTaxClassification5_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification6_vc'
      ProductTaxClassification6      : abap.char( 1 );
      ProductTaxClassification6_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification7_vc'
      ProductTaxClassification7      : abap.char( 1 );
      ProductTaxClassification7_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification8_vc'
      ProductTaxClassification8      : abap.char( 1 );
      ProductTaxClassification8_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTaxClassification9_vc'
      ProductTaxClassification9      : abap.char( 1 );
      ProductTaxClassification9_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'MatlAccountAssignmentGroup_vc'
      MatlAccountAssignmentGroup     : abap.char( 2 );
      MatlAccountAssignmentGroup_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'CostAmount_vc'
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      CostAmount                     : abap.curr( 14, 2 );
      CostAmount_vc                  : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'CustomerPaymentTerms_vc'
      CustomerPaymentTerms           : abap.char( 4 );
      CustomerPaymentTerms_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'FixedValueDate_vc'
      FixedValueDate                 : rap_cp_odata_v2_edm_datetime;
      FixedValueDate_vc              : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'CustomerGroup_vc'
      CustomerGroup                  : abap.char( 2 );
      CustomerGroup_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SalesDocumentRjcnReason_vc'
      SalesDocumentRjcnReason        : abap.char( 2 );
      SalesDocumentRjcnReason_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ItemBillingBlockReason_vc'
      ItemBillingBlockReason         : abap.char( 2 );
      ItemBillingBlockReason_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SlsDocIsRlvtForProofOfDeliv_vc'
      SlsDocIsRlvtForProofOfDeliv    : abap_boolean;
      SlsDocIsRlvtForProofOfDeliv_vc : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'WBSElement_vc'
      WBSElement                     : abap.numc( 24 );
      WBSElement_vc                  : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProfitCenter_vc'
      ProfitCenter                   : abap.char( 10 );
      ProfitCenter_vc                : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'AccountingExchangeRate_vc'
      AccountingExchangeRate         : abap.dec( 9, 5 );
      AccountingExchangeRate_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ReferenceSDDocument_vc'
      ReferenceSDDocument            : abap.char( 10 );
      ReferenceSDDocument_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ReferenceSDDocumentItem_vc'
      ReferenceSDDocumentItem        : abap.numc( 6 );
      ReferenceSDDocumentItem_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SDProcessStatus_vc'
      SDProcessStatus                : abap.char( 1 );
      SDProcessStatus_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'DeliveryStatus_vc'
      DeliveryStatus                 : abap.char( 1 );
      DeliveryStatus_vc              : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'OrderRelatedBillingStatus_vc'
      OrderRelatedBillingStatus      : abap.char( 1 );
      OrderRelatedBillingStatus_vc   : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductSeasonYear_vc'
      ProductSeasonYear              : abap.char( 4 );
      ProductSeasonYear_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductSeason_vc'
      ProductSeason                  : abap.char( 10 );
      ProductSeason_vc               : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductCollection_vc'
      ProductCollection              : abap.char( 10 );
      ProductCollection_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductTheme_vc'
      ProductTheme                   : abap.char( 10 );
      ProductTheme_vc                : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'SeasonCompletenessStatus_vc'
      SeasonCompletenessStatus       : abap.char( 1 );
      SeasonCompletenessStatus_vc    : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'FashionCancelDate_vc'
      FashionCancelDate              : rap_cp_odata_v2_edm_datetime;
      FashionCancelDate_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductCharacteristic1_vc'
      ProductCharacteristic1         : abap.char( 18 );
      ProductCharacteristic1_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductCharacteristic2_vc'
      ProductCharacteristic2         : abap.char( 18 );
      ProductCharacteristic2_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductCharacteristic3_vc'
      ProductCharacteristic3         : abap.char( 18 );
      ProductCharacteristic3_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ShippingGroupNumber_vc'
      ShippingGroupNumber            : abap.char( 10 );
      ShippingGroupNumber_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ShippingGroupRule_vc'
      ShippingGroupRule              : abap.char( 4 );
      ShippingGroupRule_vc           : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'CrossPlantConfigurableProdu_vc'
      CrossPlantConfigurableProduct  : abap.char( 40 );
      CrossPlantConfigurableProdu_vc : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'ProductCategory_vc'
      ProductCategory                : abap.char( 2 );
      ProductCategory_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl   : 'RequirementSegment_vc'
      RequirementSegment             : abap.char( 40 );
      RequirementSegment_vc          : rap_cp_odata_value_control;
      Customer                       : abap.char( 10 ) ; 
      

}
