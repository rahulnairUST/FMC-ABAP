@EndUserText.label: 'Custom Entity For Sales Order'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SALESORDER'
define custom entity ZUST01_CE_SALESORDER_01

{

  key SalesOrder                     : abap.char( 10 );
  key SalesOrderItem                 : abap.numc( 6 );
      ProdAllocPerdStartUTCDateTime  : abap.char(10);
      CVCFilter                      : abap.char( 120 );   
      HigherLevelItem                : abap.numc( 6 );
      HigherLevelItemUsage           : abap.char( 1 );
      SalesOrderItemCategory         : abap.char( 4 );
      SalesOrderItemText             : abap.char( 40 );
      PurchaseOrderByCustomer        : abap.char( 35 );      
      PurchaseOrderByShipToParty     : abap.char( 35 );
      UnderlyingPurchaseOrderItem    : abap.char( 6 );
      ExternalItemID                 : abap.char( 40 );
      Material                       : abap.char( 40 );
      MaterialByCustomer             : abap.char( 35 );
      PricingDate                    : rap_cp_odata_v2_edm_datetime;
      PricingReferenceMaterial       : abap.char( 40 );
      BillingPlan                    : abap.char( 10 );      
      @Semantics.quantity.unitOfMeasure: 'RequestedQuantitySAPUnit'
      RequestedQuantity              : abap.dec( 15, 3 );
      RequestedQuantityUnit          : abap.char( 3 );
      @Semantics.unitOfMeasure       : true
      RequestedQuantitySAPUnit       : abap.unit( 3 );
      RequestedQuantityISOUnit       : abap.char( 3 );
      OrderQuantityUnit              : abap.char( 3 );      
      @Semantics.unitOfMeasure       : true
      OrderQuantitySAPUnit           : abap.unit( 3 );      
      OrderQuantityISOUnit           : abap.char( 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      ConfdDelivQtyInOrderQtyUnit    : abap.dec( 15, 3 );
      @Semantics.quantity.unitOfMeasure: 'ItemWeightSAPUnit'
      ItemGrossWeight                : abap.dec( 15, 3 );
      @Semantics.quantity.unitOfMeasure: 'ItemWeightSAPUnit'
      ItemNetWeight                  : abap.dec( 15, 3 );
      ItemWeightUnit                 : abap.char( 3 );      
      @Semantics.unitOfMeasure       : true
      ItemWeightSAPUnit              : abap.unit( 3 );
      ItemWeightISOUnit              : abap.char( 3 );
      @Semantics.quantity.unitOfMeasure: 'ItemVolumeSAPUnit'
      ItemVolume                     : abap.dec( 15, 3 );
      ItemVolumeUnit                 : abap.char( 3 );
      @Semantics.unitOfMeasure       : true
      ItemVolumeSAPUnit              : abap.unit( 3 );      
      ItemVolumeISOUnit              : abap.char( 3 );
      @Semantics.currencyCode        : true
      TransactionCurrency            : abap.cuky;
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      NetAmount                      : abap.curr( 16, 2 );
      TotalSDDocReferenceStatus      : abap.char( 1 );
      SDDocReferenceStatus           : abap.char( 1 );
      MaterialSubstitutionReason     : abap.char( 4 );
      MaterialGroup                  : abap.char( 9 );
      MaterialPricingGroup           : abap.char( 2 );
      AdditionalMaterialGroup1       : abap.char( 3 );
      AdditionalMaterialGroup2       : abap.char( 3 );
      AdditionalMaterialGroup3       : abap.char( 3 );
      AdditionalMaterialGroup4       : abap.char( 3 );
      AdditionalMaterialGroup5       : abap.char( 3 );
      BillingDocumentDate            : rap_cp_odata_v2_edm_datetime;
      ContractAccount                : abap.char( 12 );
      AdditionalValueDays            : abap.numc( 2 );
      ServicesRenderedDate           : rap_cp_odata_v2_edm_datetime;
      Batch                          : abap.char( 10 );
      ProductionPlant                : abap.char( 4 );      
      OriginalPlant                  : abap.char( 4 );
      AltvBsdConfSubstitutionStatus  : abap.char( 1 );
      StorageLocation                : abap.char( 4 );
      DeliveryGroup                  : abap.numc( 3 );
      ShippingPoint                  : abap.char( 4 );
      ShippingType                   : abap.char( 2 );
      DeliveryPriority               : abap.numc( 2 );
      DeliveryDateTypeRule           : abap.char( 1 );
      IncotermsClassification        : abap.char( 3 );
      IncotermsTransferLocation      : abap.char( 28 );
      IncotermsLocation1             : abap.char( 70 );
      IncotermsLocation2             : abap.char( 70 );
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      TaxAmount                      : abap.curr( 14, 2 );
      ProductTaxClassification1      : abap.char( 1 );
      ProductTaxClassification2      : abap.char( 1 );
      ProductTaxClassification3      : abap.char( 1 );
      ProductTaxClassification4      : abap.char( 1 );
      ProductTaxClassification5      : abap.char( 1 );
      ProductTaxClassification6      : abap.char( 1 );
      ProductTaxClassification7      : abap.char( 1 );
      ProductTaxClassification8      : abap.char( 1 );
      ProductTaxClassification9      : abap.char( 1 );
      MatlAccountAssignmentGroup     : abap.char( 2 );
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      CostAmount                     : abap.curr( 14, 2 );
      CustomerPaymentTerms           : abap.char( 4 );
      FixedValueDate                 : rap_cp_odata_v2_edm_datetime;      
      CustomerGroup                  : abap.char( 2 );      
      SalesDocumentRjcnReason        : abap.char( 2 );
      ItemBillingBlockReason         : abap.char( 2 );
      SlsDocIsRlvtForProofOfDeliv    : abap_boolean;
      WBSElement                     : abap.numc( 24 );
      ProfitCenter                   : abap.char( 10 );
      AccountingExchangeRate         : abap.dec( 9, 5 );
      ReferenceSDDocument            : abap.char( 10 );
      ReferenceSDDocumentItem        : abap.numc( 6 );
      SDProcessStatus                : abap.char( 1 );
      DeliveryStatus                 : abap.char( 1 );
      OrderRelatedBillingStatus      : abap.char( 1 );
      ProductSeasonYear              : abap.char( 4 );
      ProductSeason                  : abap.char( 10 );
      ProductCollection              : abap.char( 10 );
      ProductTheme                   : abap.char( 10 );
      SeasonCompletenessStatus       : abap.char( 1 );
      FashionCancelDate              : rap_cp_odata_v2_edm_datetime;
      ProductCharacteristic1         : abap.char( 18 );
      ProductCharacteristic2         : abap.char( 18 );
      ProductCharacteristic3         : abap.char( 18 );
      ShippingGroupNumber            : abap.char( 10 );
      ShippingGroupRule              : abap.char( 4 );
      CrossPlantConfigurableProduct  : abap.char( 40 );
      ProductCategory                : abap.char( 2 );
      RequirementSegment             : abap.char( 40 );
      Customer                       : abap.char( 10 ) ; 
      ScheduleLine                   : abap.numc( 4 );
       @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      ConfdOrderQtyByMatlAvailCheck : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      OpenConfdDelivQtyInOrdQtyUnit : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      ScheduleLineOrderQuantity     : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      CorrectedQtyInOrderQtyUnit    : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      DeliveredQtyInOrderQtyUnit    : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      OpenQty : abap.dec( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'OrderQuantitySAPUnit'
      Quantity    : abap.dec( 13, 3 );
      SoldToParty : abap.char( 10 ) ; 
      ReferenceSDDocumentCategory : abap.char( 4 ) ; 
      SalesOrderType : abap.char( 4 ) ; 
      CompleteDeliveryIsDefined : abap_boolean ; 
      CreationDate : rap_cp_odata_v2_edm_datetime ; 
      SalesOrganization : abap.char( 4 ) ;
      DistributionChannel : abap.char( 2 ) ; 
      OrganizationDivision : abap.char( 2 ) ;      
      AdditionalCustomerGroup1 : abap.char( 3 ) ;
      AdditionalCustomerGroup2 : abap.char( 3 ) ;
      AdditionalCustomerGroup3 : abap.char( 3 ) ;
      AdditionalCustomerGroup4 : abap.char( 3 ) ;
      AdditionalCustomerGroup5 : abap.char( 3 ) ;
      @Semantics.amount.currencyCode: 'TransactionCurrency' 
      TotalNetAmount : abap.curr( 16, 2 ) ; 
      CreatedByUser : abap.char( 12 ) ; 
      CustomerPriceGroup : abap.char( 2 ) ; 
      ConfirmedDeliveryDate : rap_cp_odata_v2_edm_datetime ; 
      
}
