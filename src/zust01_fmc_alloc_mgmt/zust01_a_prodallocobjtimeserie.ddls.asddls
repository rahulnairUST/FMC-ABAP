/********** GENERATED on 08/07/2023 at 09:13:43 by CB9980000010**************/
 @OData.entitySet.name: 'A_ProdAllocObjTimeSeries' 
 @OData.entityType.name: 'A_ProdAllocObjTimeSeriesType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_PRODALLOCOBJTIMESERIE { 
 key ProdAllocationTimeSeriesUUID : sysuuid_x16 ; 
 @Odata.property.valueControl: 'ProductAllocationObjectUUID_vc' 
 ProductAllocationObjectUUID : sysuuid_x16 ; 
 ProductAllocationObjectUUID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CharcValueCombinationUUID_vc' 
 CharcValueCombinationUUID : sysuuid_x16 ; 
 CharcValueCombinationUUID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocPerdStartUTCDateTi_vc' 
 ProdAllocPerdStartUTCDateTime : tzntstmpl ; 
 ProdAllocPerdStartUTCDateTi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocPeriodStartTimeZon_vc' 
 ProdAllocPeriodStartTimeZone : abap.char( 6 ) ; 
 ProdAllocPeriodStartTimeZon_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocPeriodEndUTCDateTi_vc' 
 ProdAllocPeriodEndUTCDateTime : tzntstmpl ; 
 ProdAllocPeriodEndUTCDateTi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocPeriodEndTimeZone_vc' 
 ProdAllocPeriodEndTimeZone : abap.char( 6 ) ; 
 ProdAllocPeriodEndTimeZone_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'ProductAllocationQuantityUnit' 
 ProductAllocationQuantity : abap.dec( 15, 3 ) ; 
 ProductAllocationQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationQuantityUn_vc' 
 @Semantics.unitOfMeasure: true 
 ProductAllocationQuantityUnit : abap.unit( 3 ) ; 
 ProductAllocationQuantityUn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_ProdAllocCharcValCombnTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocCharcValCombnTP1 : association [1] to ZUST01_A_PRODALLOCCHARCVALCOMB on 1 = 1; 
 @OData.property.name: 'to_ProdAllocationObjectTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocationObjectTP123 : association [1] to ZUST01_A_PRODALLOCATIONOBJECT on 1 = 1; 
 } 
