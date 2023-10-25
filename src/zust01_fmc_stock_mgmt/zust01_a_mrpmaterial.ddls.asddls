/********** GENERATED on 10/17/2023 at 13:22:58 by CB9980000021**************/
 @OData.entitySet.name: 'A_MRPMaterial' 
 @OData.entityType.name: 'A_MRPMaterialType' 
 define root abstract entity ZUST01_A_MRPMATERIAL { 
 key Material : abap.char( 40 ) ; 
 key MRPPlant : abap.char( 4 ) ; 
 key MRPArea : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'MaterialName_vc' 
 MaterialName : abap.char( 40 ) ; 
 MaterialName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlantName_vc' 
 PlantName : abap.char( 30 ) ; 
 PlantName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPAreaText_vc' 
 MRPAreaText : abap.char( 40 ) ; 
 MRPAreaText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPAreaCategory_vc' 
 MRPAreaCategory : abap.numc( 2 ) ; 
 MRPAreaCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPAreaCategoryName_vc' 
 MRPAreaCategoryName : abap.char( 60 ) ; 
 MRPAreaCategoryName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialGroup_vc' 
 MaterialGroup : abap.char( 9 ) ; 
 MaterialGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialGroupName_vc' 
 MaterialGroupName : abap.char( 20 ) ; 
 MaterialGroupName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialIsMarkedForDeletion_vc' 
 MaterialIsMarkedForDeletion : abap_boolean ; 
 MaterialIsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlntMatlIsMarkedForDeletion_vc' 
 PlntMatlIsMarkedForDeletion : abap_boolean ; 
 PlntMatlIsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CrossPlantStatus_vc' 
 CrossPlantStatus : abap.char( 2 ) ; 
 CrossPlantStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CrossPlantStatusName_vc' 
 CrossPlantStatusName : abap.char( 25 ) ; 
 CrossPlantStatusName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnitOfMeasureName_vc' 
 UnitOfMeasureName : abap.char( 10 ) ; 
 UnitOfMeasureName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LowLevelCode_vc' 
 LowLevelCode : abap.char( 3 ) ; 
 LowLevelCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialIsConfigurable_vc' 
 MaterialIsConfigurable : abap_boolean ; 
 MaterialIsConfigurable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialUsabilityProfile_vc' 
 MaterialUsabilityProfile : abap.char( 2 ) ; 
 MaterialUsabilityProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialUsabilityProfileNam_vc' 
 MaterialUsabilityProfileName : abap.char( 25 ) ; 
 MaterialUsabilityProfileNam_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialABCClassification_vc' 
 MaterialABCClassification : abap.char( 1 ) ; 
 MaterialABCClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialABCClassificationDe_vc' 
 MaterialABCClassificationDesc : abap.char( 30 ) ; 
 MaterialABCClassificationDe_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingGroup_vc' 
 PurchasingGroup : abap.char( 3 ) ; 
 PurchasingGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingGroupName_vc' 
 PurchasingGroupName : abap.char( 18 ) ; 
 PurchasingGroupName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialProcurementCategory_vc' 
 MaterialProcurementCategory : abap.char( 1 ) ; 
 MaterialProcurementCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialProcurementCatName_vc' 
 MaterialProcurementCatName : abap.char( 60 ) ; 
 MaterialProcurementCatName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DependentRequirementsType_vc' 
 DependentRequirementsType : abap.char( 1 ) ; 
 DependentRequirementsType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DependentRequirementsTypeNa_vc' 
 DependentRequirementsTypeName : abap.char( 60 ) ; 
 DependentRequirementsTypeNa_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MatlCompDiscontinuationType_vc' 
 MatlCompDiscontinuationType : abap.char( 1 ) ; 
 MatlCompDiscontinuationType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MatlCompDscontnTypeName_vc' 
 MatlCompDscontnTypeName : abap.char( 60 ) ; 
 MatlCompDscontnTypeName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EffectiveOutDate_vc' 
 EffectiveOutDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 EffectiveOutDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialType_vc' 
 MaterialType : abap.char( 4 ) ; 
 MaterialType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialTypeName_vc' 
 MaterialTypeName : abap.char( 25 ) ; 
 MaterialTypeName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPGroup_vc' 
 MRPGroup : abap.char( 4 ) ; 
 MRPGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPGroupName_vc' 
 MRPGroupName : abap.char( 40 ) ; 
 MRPGroupName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPController_vc' 
 MRPController : abap.char( 3 ) ; 
 MRPController_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPControllerName_vc' 
 MRPControllerName : abap.char( 18 ) ; 
 MRPControllerName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RangeOfCvrgPrflCode_vc' 
 RangeOfCvrgPrflCode : abap.char( 3 ) ; 
 RangeOfCvrgPrflCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SchedulingFloatProfile_vc' 
 SchedulingFloatProfile : abap.char( 3 ) ; 
 SchedulingFloatProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConfigurableProduct_vc' 
 ConfigurableProduct : abap.char( 40 ) ; 
 ConfigurableProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConfigurableProductName_vc' 
 ConfigurableProductName : abap.char( 40 ) ; 
 ConfigurableProductName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProcessingTime_vc' 
 ProcessingTime : abap.dec( 5, 2 ) ; 
 ProcessingTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SetupAndTeardownTime_vc' 
 SetupAndTeardownTime : abap.dec( 5, 2 ) ; 
 SetupAndTeardownTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransitionTime_vc' 
 TransitionTime : abap.dec( 5, 2 ) ; 
 TransitionTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GoodsReceiptDuration_vc' 
 GoodsReceiptDuration : abap.dec( 3, 0 ) ; 
 GoodsReceiptDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialPlannedDeliveryDurn_vc' 
 MaterialPlannedDeliveryDurn : abap.dec( 3, 0 ) ; 
 MaterialPlannedDeliveryDurn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialPlannedProductionDu_vc' 
 MaterialPlannedProductionDurn : abap.dec( 3, 0 ) ; 
 MaterialPlannedProductionDu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TotalReplenishmentLeadDurat_vc' 
 TotalReplenishmentLeadDuration : abap.dec( 3, 0 ) ; 
 TotalReplenishmentLeadDurat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsSafetyTime_vc' 
 IsSafetyTime : abap.char( 1 ) ; 
 IsSafetyTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPSafetyDuration_vc' 
 MRPSafetyDuration : abap.numc( 2 ) ; 
 MRPSafetyDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PerdPrflForSftyTme_vc' 
 PerdPrflForSftyTme : abap.char( 3 ) ; 
 PerdPrflForSftyTme_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReorderThresholdQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 ReorderThresholdQuantity : abap.dec( 13, 3 ) ; 
 ReorderThresholdQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SafetyStockQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 SafetyStockQuantity : abap.dec( 13, 3 ) ; 
 SafetyStockQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizingProcedure_vc' 
 LotSizingProcedure : abap.char( 2 ) ; 
 LotSizingProcedure_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialLotSizingProcedureN_vc' 
 MaterialLotSizingProcedureName : abap.char( 40 ) ; 
 MaterialLotSizingProcedureN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinimumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MinimumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaximumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MaximumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 FixedLotSizeQuantity : abap.dec( 13, 3 ) ; 
 FixedLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialMaxStockLevelQuanti_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaterialMaxStockLevelQuantity : abap.dec( 13, 3 ) ; 
 MaterialMaxStockLevelQuanti_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizeIndependentCosts_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 LotSizeIndependentCosts : abap.curr( 12, 3 ) ; 
 LotSizeIndependentCosts_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StorageCostsPercentageCode_vc' 
 StorageCostsPercentageCode : abap.char( 1 ) ; 
 StorageCostsPercentageCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AssemblyScrapPercent_vc' 
 AssemblyScrapPercent : abap.dec( 5, 2 ) ; 
 AssemblyScrapPercent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaktTime_vc' 
 TaktTime : abap.dec( 3, 0 ) ; 
 TaktTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurOrderQtyRoundingQty_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 PurOrderQtyRoundingQty : abap.dec( 13, 3 ) ; 
 PurOrderQtyRoundingQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RoundingProfile_vc' 
 RoundingProfile : abap.char( 4 ) ; 
 RoundingProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlanningStrategyGroup_vc' 
 PlanningStrategyGroup : abap.char( 2 ) ; 
 PlanningStrategyGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DfltStorageLocationExtProcm_vc' 
 DfltStorageLocationExtProcmt : abap.char( 4 ) ; 
 DfltStorageLocationExtProcm_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPPlanningCalendar_vc' 
 MRPPlanningCalendar : abap.char( 3 ) ; 
 MRPPlanningCalendar_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RepetitiveManufacturingIsAl_vc' 
 RepetitiveManufacturingIsAllwd : abap_boolean ; 
 RepetitiveManufacturingIsAl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RepetitiveManufacturingProf_vc' 
 RepetitiveManufacturingProfile : abap.char( 4 ) ; 
 RepetitiveManufacturingProf_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlanningTimeFenceInDays_vc' 
 PlanningTimeFenceInDays : abap.numc( 3 ) ; 
 PlanningTimeFenceInDays_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPType_vc' 
 MRPType : abap.char( 2 ) ; 
 MRPType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPTypeName_vc' 
 MRPTypeName : abap.char( 60 ) ; 
 MRPTypeName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialProcurementProfile_vc' 
 MaterialProcurementProfile : abap.char( 2 ) ; 
 MaterialProcurementProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialProcurementProfileN_vc' 
 MaterialProcurementProfileName : abap.char( 40 ) ; 
 MaterialProcurementProfileN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionSupervisor_vc' 
 ProductionSupervisor : abap.char( 3 ) ; 
 ProductionSupervisor_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionSupervisorName_vc' 
 ProductionSupervisorName : abap.char( 30 ) ; 
 ProductionSupervisorName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialBaseQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaterialBaseQuantity : abap.dec( 13, 3 ) ; 
 MaterialBaseQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionInvtryManagedLoc_vc' 
 ProductionInvtryManagedLoc : abap.char( 4 ) ; 
 ProductionInvtryManagedLoc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StorageLocationName_vc' 
 StorageLocationName : abap.char( 16 ) ; 
 StorageLocationName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationGroup_vc' 
 AuthorizationGroup : abap.char( 4 ) ; 
 AuthorizationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
