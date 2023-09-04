/********** GENERATED on 08/17/2023 at 09:00:09 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderItem' 
 @OData.entityType.name: 'A_SalesOrderItemType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SALESORDERITEM { 
 key SalesOrder : abap.char( 10 ) ; 
 key SalesOrderItem : abap.numc( 6 ) ; 
 @Odata.property.valueControl: 'HigherLevelItem_vc' 
 HigherLevelItem : abap.numc( 6 ) ; 
 HigherLevelItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HigherLevelItemUsage_vc' 
 HigherLevelItemUsage : abap.char( 1 ) ; 
 HigherLevelItemUsage_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrderItemCategory_vc' 
 SalesOrderItemCategory : abap.char( 4 ) ; 
 SalesOrderItemCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesOrderItemText_vc' 
 SalesOrderItemText : abap.char( 40 ) ; 
 SalesOrderItemText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderByCustomer_vc' 
 PurchaseOrderByCustomer : abap.char( 35 ) ; 
 PurchaseOrderByCustomer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderByShipToParty_vc' 
 PurchaseOrderByShipToParty : abap.char( 35 ) ; 
 PurchaseOrderByShipToParty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExternalItemID_vc' 
 ExternalItemID : abap.char( 40 ) ; 
 ExternalItemID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Material_vc' 
 Material : abap.char( 40 ) ; 
 Material_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialByCustomer_vc' 
 MaterialByCustomer : abap.char( 35 ) ; 
 MaterialByCustomer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingDate_vc' 
 PricingDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PricingDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingReferenceMaterial_vc' 
 PricingReferenceMaterial : abap.char( 40 ) ; 
 PricingReferenceMaterial_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequestedQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'RequestedQuantitySAPUnit' 
 RequestedQuantity : abap.dec( 15, 3 ) ; 
 RequestedQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequestedQuantityUnit_vc' 
 RequestedQuantityUnit : abap.char( 3 ) ; 
 RequestedQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequestedQuantitySAPUnit_vc' 
 @Semantics.unitOfMeasure: true 
 RequestedQuantitySAPUnit : abap.unit( 3 ) ; 
 RequestedQuantitySAPUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequestedQuantityISOUnit_vc' 
 RequestedQuantityISOUnit : abap.char( 3 ) ; 
 RequestedQuantityISOUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
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
 @Odata.property.valueControl: 'ConfdDelivQtyInOrderQtyUnit_vc' 
 @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit' 
 ConfdDelivQtyInOrderQtyUnit : abap.dec( 15, 3 ) ; 
 ConfdDelivQtyInOrderQtyUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemGrossWeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'ItemWeightSAPUnit' 
 ItemGrossWeight : abap.dec( 15, 3 ) ; 
 ItemGrossWeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemNetWeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'ItemWeightSAPUnit' 
 ItemNetWeight : abap.dec( 15, 3 ) ; 
 ItemNetWeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemWeightUnit_vc' 
 ItemWeightUnit : abap.char( 3 ) ; 
 ItemWeightUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemWeightSAPUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ItemWeightSAPUnit : abap.unit( 3 ) ; 
 ItemWeightSAPUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemWeightISOUnit_vc' 
 ItemWeightISOUnit : abap.char( 3 ) ; 
 ItemWeightISOUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemVolume_vc' 
 @Semantics.quantity.unitOfMeasure: 'ItemVolumeSAPUnit' 
 ItemVolume : abap.dec( 15, 3 ) ; 
 ItemVolume_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemVolumeUnit_vc' 
 ItemVolumeUnit : abap.char( 3 ) ; 
 ItemVolumeUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemVolumeSAPUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ItemVolumeSAPUnit : abap.unit( 3 ) ; 
 ItemVolumeSAPUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemVolumeISOUnit_vc' 
 ItemVolumeISOUnit : abap.char( 3 ) ; 
 ItemVolumeISOUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransactionCurrency_vc' 
 @Semantics.currencyCode: true 
 TransactionCurrency : abap.cuky ; 
 TransactionCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetAmount_vc' 
 @Semantics.amount.currencyCode: 'TransactionCurrency' 
 NetAmount : abap.curr( 16, 3 ) ; 
 NetAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TotalSDDocReferenceStatus_vc' 
 TotalSDDocReferenceStatus : abap.char( 1 ) ; 
 TotalSDDocReferenceStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SDDocReferenceStatus_vc' 
 SDDocReferenceStatus : abap.char( 1 ) ; 
 SDDocReferenceStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialSubstitutionReason_vc' 
 MaterialSubstitutionReason : abap.char( 4 ) ; 
 MaterialSubstitutionReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialGroup_vc' 
 MaterialGroup : abap.char( 9 ) ; 
 MaterialGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialPricingGroup_vc' 
 MaterialPricingGroup : abap.char( 2 ) ; 
 MaterialPricingGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdditionalMaterialGroup1_vc' 
 AdditionalMaterialGroup1 : abap.char( 3 ) ; 
 AdditionalMaterialGroup1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdditionalMaterialGroup2_vc' 
 AdditionalMaterialGroup2 : abap.char( 3 ) ; 
 AdditionalMaterialGroup2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdditionalMaterialGroup3_vc' 
 AdditionalMaterialGroup3 : abap.char( 3 ) ; 
 AdditionalMaterialGroup3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdditionalMaterialGroup4_vc' 
 AdditionalMaterialGroup4 : abap.char( 3 ) ; 
 AdditionalMaterialGroup4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdditionalMaterialGroup5_vc' 
 AdditionalMaterialGroup5 : abap.char( 3 ) ; 
 AdditionalMaterialGroup5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BillingDocumentDate_vc' 
 BillingDocumentDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 BillingDocumentDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ContractAccount_vc' 
 ContractAccount : abap.char( 12 ) ; 
 ContractAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdditionalValueDays_vc' 
 AdditionalValueDays : abap.numc( 2 ) ; 
 AdditionalValueDays_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ServicesRenderedDate_vc' 
 ServicesRenderedDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ServicesRenderedDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Batch_vc' 
 Batch : abap.char( 10 ) ; 
 Batch_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionPlant_vc' 
 ProductionPlant : abap.char( 4 ) ; 
 ProductionPlant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StorageLocation_vc' 
 StorageLocation : abap.char( 4 ) ; 
 StorageLocation_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryGroup_vc' 
 DeliveryGroup : abap.numc( 3 ) ; 
 DeliveryGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ShippingPoint_vc' 
 ShippingPoint : abap.char( 4 ) ; 
 ShippingPoint_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ShippingType_vc' 
 ShippingType : abap.char( 2 ) ; 
 ShippingType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryPriority_vc' 
 DeliveryPriority : abap.numc( 2 ) ; 
 DeliveryPriority_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryDateTypeRule_vc' 
 DeliveryDateTypeRule : abap.char( 1 ) ; 
 DeliveryDateTypeRule_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsClassification_vc' 
 IncotermsClassification : abap.char( 3 ) ; 
 IncotermsClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsTransferLocation_vc' 
 IncotermsTransferLocation : abap.char( 28 ) ; 
 IncotermsTransferLocation_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsLocation1_vc' 
 IncotermsLocation1 : abap.char( 70 ) ; 
 IncotermsLocation1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsLocation2_vc' 
 IncotermsLocation2 : abap.char( 70 ) ; 
 IncotermsLocation2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification1_vc' 
 ProductTaxClassification1 : abap.char( 1 ) ; 
 ProductTaxClassification1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification2_vc' 
 ProductTaxClassification2 : abap.char( 1 ) ; 
 ProductTaxClassification2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification3_vc' 
 ProductTaxClassification3 : abap.char( 1 ) ; 
 ProductTaxClassification3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification4_vc' 
 ProductTaxClassification4 : abap.char( 1 ) ; 
 ProductTaxClassification4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification5_vc' 
 ProductTaxClassification5 : abap.char( 1 ) ; 
 ProductTaxClassification5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification6_vc' 
 ProductTaxClassification6 : abap.char( 1 ) ; 
 ProductTaxClassification6_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification7_vc' 
 ProductTaxClassification7 : abap.char( 1 ) ; 
 ProductTaxClassification7_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification8_vc' 
 ProductTaxClassification8 : abap.char( 1 ) ; 
 ProductTaxClassification8_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTaxClassification9_vc' 
 ProductTaxClassification9 : abap.char( 1 ) ; 
 ProductTaxClassification9_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MatlAccountAssignmentGroup_vc' 
 MatlAccountAssignmentGroup : abap.char( 2 ) ; 
 MatlAccountAssignmentGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerPaymentTerms_vc' 
 CustomerPaymentTerms : abap.char( 4 ) ; 
 CustomerPaymentTerms_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedValueDate_vc' 
 FixedValueDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FixedValueDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerGroup_vc' 
 CustomerGroup : abap.char( 2 ) ; 
 CustomerGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesDocumentRjcnReason_vc' 
 SalesDocumentRjcnReason : abap.char( 2 ) ; 
 SalesDocumentRjcnReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemBillingBlockReason_vc' 
 ItemBillingBlockReason : abap.char( 2 ) ; 
 ItemBillingBlockReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SlsDocIsRlvtForProofOfDeliv_vc' 
 SlsDocIsRlvtForProofOfDeliv : abap_boolean ; 
 SlsDocIsRlvtForProofOfDeliv_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WBSElement_vc' 
 WBSElement : abap.numc( 24 ) ; 
 WBSElement_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfitCenter_vc' 
 ProfitCenter : abap.char( 10 ) ; 
 ProfitCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccountingExchangeRate_vc' 
 AccountingExchangeRate : abap.dec( 9, 5 ) ; 
 AccountingExchangeRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReferenceSDDocument_vc' 
 ReferenceSDDocument : abap.char( 10 ) ; 
 ReferenceSDDocument_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReferenceSDDocumentItem_vc' 
 ReferenceSDDocumentItem : abap.numc( 6 ) ; 
 ReferenceSDDocumentItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SDProcessStatus_vc' 
 SDProcessStatus : abap.char( 1 ) ; 
 SDProcessStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryStatus_vc' 
 DeliveryStatus : abap.char( 1 ) ; 
 DeliveryStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderRelatedBillingStatus_vc' 
 OrderRelatedBillingStatus : abap.char( 1 ) ; 
 OrderRelatedBillingStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductSeasonYear_vc' 
 ProductSeasonYear : abap.char( 4 ) ; 
 ProductSeasonYear_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductSeason_vc' 
 ProductSeason : abap.char( 10 ) ; 
 ProductSeason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCollection_vc' 
 ProductCollection : abap.char( 10 ) ; 
 ProductCollection_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductTheme_vc' 
 ProductTheme : abap.char( 10 ) ; 
 ProductTheme_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SeasonCompletenessStatus_vc' 
 SeasonCompletenessStatus : abap.char( 1 ) ; 
 SeasonCompletenessStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FashionCancelDate_vc' 
 FashionCancelDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FashionCancelDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCharacteristic1_vc' 
 ProductCharacteristic1 : abap.char( 18 ) ; 
 ProductCharacteristic1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCharacteristic2_vc' 
 ProductCharacteristic2 : abap.char( 18 ) ; 
 ProductCharacteristic2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCharacteristic3_vc' 
 ProductCharacteristic3 : abap.char( 18 ) ; 
 ProductCharacteristic3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ShippingGroupNumber_vc' 
 ShippingGroupNumber : abap.char( 10 ) ; 
 ShippingGroupNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ShippingGroupRule_vc' 
 ShippingGroupRule : abap.char( 4 ) ; 
 ShippingGroupRule_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CrossPlantConfigurableProdu_vc' 
 CrossPlantConfigurableProduct : abap.char( 40 ) ; 
 CrossPlantConfigurableProdu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCategory_vc' 
 ProductCategory : abap.char( 2 ) ; 
 ProductCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RequirementSegment_vc' 
 RequirementSegment : abap.char( 40 ) ; 
 RequirementSegment_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ZZ1_Tier1_SDI_vc' 
 ZZ1_Tier1_SDI : abap.char( 2 ) ; 
 ZZ1_Tier1_SDI_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ZZ1_Pc9_SDI_vc' 
 ZZ1_Pc9_SDI : abap.char( 40 ) ; 
 ZZ1_Pc9_SDI_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_Partner' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Partner1 : association [0..*] to ZUST01_A_SALESORDERITEMPARTNER on 1 = 1; 
 @OData.property.name: 'to_PricingElement' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PricingElement1 : association [0..*] to ZUST01_A_SALESORDERITEMPRELEME on 1 = 1; 
 @OData.property.name: 'to_RelatedObject' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _RelatedObject1 : association [0..*] to ZUST01_A_SALESORDERITEMRELATED on 1 = 1; 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder12 : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 @OData.property.name: 'to_ScheduleLine' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ScheduleLine : association [0..*] to ZUST01_A_SALESORDERSCHEDULELIN on 1 = 1; 
 @OData.property.name: 'to_Text' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Text1 : association [0..*] to ZUST01_A_SALESORDERITEMTEXT on 1 = 1; 
 @OData.property.name: 'to_ValueAddedService' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ValueAddedService : association [0..*] to ZUST01_A_SALESORDERVALADDEDSRV on 1 = 1; 
 } 
