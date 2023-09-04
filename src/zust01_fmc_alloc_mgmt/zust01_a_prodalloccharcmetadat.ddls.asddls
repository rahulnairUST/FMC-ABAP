/********** GENERATED on 08/07/2023 at 09:13:39 by CB9980000010**************/
 @OData.entitySet.name: 'A_ProdAllocCharcMetaData' 
 @OData.entityType.name: 'A_ProdAllocCharcMetaDataType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_PRODALLOCCHARCMETADAT { 
 key CharacteristicsMetaDataUUID : sysuuid_x16 ; 
 @Odata.property.valueControl: 'CharacteristicsMetaDataUUID_vc' 
 @OData.property.name: 'CharacteristicsMetaDataUUID_Text' 
 CharacteristicsMetaDataUUID_T1 : abap.char( 83 ) ; 
 CharacteristicsMetaDataUUID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationObjectUUID_vc' 
 ProductAllocationObjectUUID : sysuuid_x16 ; 
 ProductAllocationObjectUUID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationObject_vc' 
 ProductAllocationObject : abap.char( 40 ) ; 
 ProductAllocationObject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocOrdinalNumberValue_vc' 
 ProdAllocOrdinalNumberValue : abap.int1 ; 
 ProdAllocOrdinalNumberValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_ProdAllocationObjectTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocationObjectTP1 : association [1] to ZUST01_A_PRODALLOCATIONOBJECT on 1 = 1; 
 } 
