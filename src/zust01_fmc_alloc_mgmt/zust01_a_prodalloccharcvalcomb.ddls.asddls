/********** GENERATED on 08/07/2023 at 09:13:40 by CB9980000010**************/
 @OData.entitySet.name: 'A_ProdAllocCharcValCombn' 
 @OData.entityType.name: 'A_ProdAllocCharcValCombnType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_PRODALLOCCHARCVALCOMB { 
 key CharcValueCombinationUUID : sysuuid_x16 ; 
 @Odata.property.valueControl: 'ProductAllocationObjectUUID_vc' 
 ProductAllocationObjectUUID : sysuuid_x16 ; 
 ProductAllocationObjectUUID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationObject_vc' 
 ProductAllocationObject : abap.char( 40 ) ; 
 ProductAllocationObject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc01_vc' 
 ProdAllocCharc01 : abap.char( 40 ) ; 
 ProdAllocCharc01_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc02_vc' 
 ProdAllocCharc02 : abap.char( 40 ) ; 
 ProdAllocCharc02_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc03_vc' 
 ProdAllocCharc03 : abap.char( 40 ) ; 
 ProdAllocCharc03_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc04_vc' 
 ProdAllocCharc04 : abap.char( 40 ) ; 
 ProdAllocCharc04_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc05_vc' 
 ProdAllocCharc05 : abap.char( 40 ) ; 
 ProdAllocCharc05_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc06_vc' 
 ProdAllocCharc06 : abap.char( 40 ) ; 
 ProdAllocCharc06_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc07_vc' 
 ProdAllocCharc07 : abap.char( 40 ) ; 
 ProdAllocCharc07_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc08_vc' 
 ProdAllocCharc08 : abap.char( 40 ) ; 
 ProdAllocCharc08_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc09_vc' 
 ProdAllocCharc09 : abap.char( 40 ) ; 
 ProdAllocCharc09_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharc10_vc' 
 ProdAllocCharc10 : abap.char( 40 ) ; 
 ProdAllocCharc10_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharcValueCombnCmn_vc' 
 ProdAllocCharcValueCombnCmnt : abap.char( 80 ) ; 
 ProdAllocCharcValueCombnCmn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCharcConstraintSta_vc' 
 ProdAllocCharcConstraintStatus : abap.char( 2 ) ; 
 ProdAllocCharcConstraintSta_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocationActivationSta_vc' 
 ProdAllocationActivationStatus : abap.char( 2 ) ; 
 ProdAllocationActivationSta_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CharcValAuthznGroup_vc' 
 CharcValAuthznGroup : abap.char( 40 ) ; 
 CharcValAuthznGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_ProdAllocObjTimeSeriesTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocObjTimeSeriesTP : association [0..*] to ZUST01_A_PRODALLOCOBJTIMESERIE on 1 = 1; 
 @OData.property.name: 'to_ProdAllocationObjectTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocationObjectTP12 : association [1] to ZUST01_A_PRODALLOCATIONOBJECT on 1 = 1; 
 } 
