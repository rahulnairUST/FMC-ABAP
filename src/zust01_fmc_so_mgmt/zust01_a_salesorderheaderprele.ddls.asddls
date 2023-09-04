/********** GENERATED on 08/17/2023 at 09:00:06 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderHeaderPrElement' 
 @OData.entityType.name: 'A_SalesOrderHeaderPrElementType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SALESORDERHEADERPRELE { 
 key SalesOrder : abap.char( 10 ) ; 
 key PricingProcedureStep : abap.numc( 3 ) ; 
 key PricingProcedureCounter : abap.numc( 3 ) ; 
 @Odata.property.valueControl: 'ConditionType_vc' 
 ConditionType : abap.char( 4 ) ; 
 ConditionType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingDateTime_vc' 
 PricingDateTime : abap.char( 14 ) ; 
 PricingDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceConditionDetermination_vc' 
 PriceConditionDeterminationDte : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PriceConditionDetermination_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionCalculationType_vc' 
 ConditionCalculationType : abap.char( 3 ) ; 
 ConditionCalculationType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionBaseValue_vc' 
 ConditionBaseValue : abap.fltp ; 
 ConditionBaseValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionRateValue_vc' 
 ConditionRateValue : abap.fltp ; 
 ConditionRateValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionCurrency_vc' 
 ConditionCurrency : abap.char( 5 ) ; 
 ConditionCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'ConditionQuantitySAPUnit' 
 ConditionQuantity : abap.dec( 5, 0 ) ; 
 ConditionQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionQuantityUnit_vc' 
 ConditionQuantityUnit : abap.char( 3 ) ; 
 ConditionQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionQuantitySAPUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ConditionQuantitySAPUnit : abap.unit( 3 ) ; 
 ConditionQuantitySAPUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionQuantityISOUnit_vc' 
 ConditionQuantityISOUnit : abap.char( 3 ) ; 
 ConditionQuantityISOUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionCategory_vc' 
 ConditionCategory : abap.char( 1 ) ; 
 ConditionCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionIsForStatistics_vc' 
 ConditionIsForStatistics : abap_boolean ; 
 ConditionIsForStatistics_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingScaleType_vc' 
 PricingScaleType : abap.char( 1 ) ; 
 PricingScaleType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionOrigin_vc' 
 ConditionOrigin : abap.char( 1 ) ; 
 ConditionOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsGroupCondition_vc' 
 IsGroupCondition : abap.char( 1 ) ; 
 IsGroupCondition_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionRecord_vc' 
 ConditionRecord : abap.char( 10 ) ; 
 ConditionRecord_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionSequentialNumber_vc' 
 ConditionSequentialNumber : abap.numc( 3 ) ; 
 ConditionSequentialNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxCode_vc' 
 TaxCode : abap.char( 2 ) ; 
 TaxCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WithholdingTaxCode_vc' 
 WithholdingTaxCode : abap.char( 2 ) ; 
 WithholdingTaxCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CndnRoundingOffDiffAmount_vc' 
 @Semantics.amount.currencyCode: 'TransactionCurrency' 
 CndnRoundingOffDiffAmount : abap.curr( 6, 3 ) ; 
 CndnRoundingOffDiffAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionAmount_vc' 
 @Semantics.amount.currencyCode: 'TransactionCurrency' 
 ConditionAmount : abap.curr( 16, 3 ) ; 
 ConditionAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransactionCurrency_vc' 
 @Semantics.currencyCode: true 
 TransactionCurrency : abap.cuky ; 
 TransactionCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionControl_vc' 
 ConditionControl : abap.char( 1 ) ; 
 ConditionControl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionInactiveReason_vc' 
 ConditionInactiveReason : abap.char( 1 ) ; 
 ConditionInactiveReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionClass_vc' 
 ConditionClass : abap.char( 1 ) ; 
 ConditionClass_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PrcgProcedureCounterForHead_vc' 
 PrcgProcedureCounterForHeader : abap.numc( 3 ) ; 
 PrcgProcedureCounterForHead_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FactorForConditionBasisValu_vc' 
 FactorForConditionBasisValue : abap.fltp ; 
 FactorForConditionBasisValu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StructureCondition_vc' 
 StructureCondition : abap.char( 1 ) ; 
 StructureCondition_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PeriodFactorForCndnBasisVal_vc' 
 PeriodFactorForCndnBasisValue : abap.fltp ; 
 PeriodFactorForCndnBasisVal_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingScaleBasis_vc' 
 PricingScaleBasis : abap.char( 3 ) ; 
 PricingScaleBasis_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionScaleBasisValue_vc' 
 ConditionScaleBasisValue : abap.fltp ; 
 ConditionScaleBasisValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionScaleBasisUnit_vc' 
 ConditionScaleBasisUnit : abap.char( 3 ) ; 
 ConditionScaleBasisUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionScaleBasisCurrency_vc' 
 ConditionScaleBasisCurrency : abap.char( 5 ) ; 
 ConditionScaleBasisCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CndnIsRelevantForIntcoBilli_vc' 
 CndnIsRelevantForIntcoBilling : abap_boolean ; 
 CndnIsRelevantForIntcoBilli_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionIsManuallyChanged_vc' 
 ConditionIsManuallyChanged : abap_boolean ; 
 ConditionIsManuallyChanged_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConditionIsForConfiguration_vc' 
 ConditionIsForConfiguration : abap_boolean ; 
 ConditionIsForConfiguration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VariantCondition_vc' 
 VariantCondition : abap.char( 26 ) ; 
 VariantCondition_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder1 : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 } 
