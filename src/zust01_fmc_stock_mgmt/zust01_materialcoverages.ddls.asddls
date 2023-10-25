/********** GENERATED on 10/17/2023 at 13:22:57 by CB9980000021**************/
 @OData.entitySet.name: 'MaterialCoverages' 
 @OData.entityType.name: 'MaterialCoverage' 
 define root abstract entity ZUST01_MATERIALCOVERAGES { 
 key Material : abap.char( 40 ) ; 
 key MaterialShortageProfile : abap.char( 12 ) ; 
 key MaterialShortageProfileCount : abap.char( 3 ) ; 
 key MRPArea : abap.char( 10 ) ; 
 key MRPPlanningSegmentNumber : abap.char( 20 ) ; 
 key MRPPlanningSegmentType : abap.char( 2 ) ; 
 key MRPPlant : abap.char( 4 ) ; 
 HasAcceptedShortage : abap.char( 1 ) ; 
 @Odata.property.valueControl: 'TimeHorizonInDays_vc' 
 TimeHorizonInDays : abap.int2 ; 
 TimeHorizonInDays_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 MaterialShortageDuration : abap.int4 ; 
 MaterialShortageDurnInWorkdays : abap.int4 ; 
 MRPController : abap.char( 3 ) ; 
 MRPSafetyDuration : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'DaysOfSupplyDuration_vc' 
 DaysOfSupplyDuration : abap.int4 ; 
 DaysOfSupplyDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 MaterialExternalID : abap.char( 40 ) ; 
 MaterialName : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'MaterialReplnmtLeadDurnEndD_vc' 
 MaterialReplnmtLeadDurnEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 MaterialReplnmtLeadDurnEndD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 MaterialShortageDefinitionName : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'MaterialShortageEndDate_vc' 
 MaterialShortageEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 MaterialShortageEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialShortageQuantity_vc' 
 MaterialShortageQuantity : abap.dec( 21, 3 ) ; 
 MaterialShortageQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialShortageStartDate_vc' 
 MaterialShortageStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 MaterialShortageStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 MRPAreaText : abap.char( 40 ) ; 
 MRPControllerName : abap.char( 18 ) ; 
 MRPPlanningSegmentTypeDesc : abap.char( 6 ) ; 
 MRPPlantName : abap.char( 30 ) ; 
 @Odata.property.valueControl: 'MRPSafetyDurationEndDate_vc' 
 MRPSafetyDurationEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 MRPSafetyDurationEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
