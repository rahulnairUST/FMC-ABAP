/********** GENERATED on 08/07/2023 at 09:13:36 by CB9980000010**************/
 @OData.entitySet.name: 'A_ProdAllocationObjectT' 
 @OData.entityType.name: 'A_ProdAllocationObjectTType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_PRODALLOCATIONOBJECTT { 
 key ProductAllocationObjectUUID : sysuuid_x16 ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'ProdAllocObjectDescription_vc' 
 ProdAllocObjectDescription : abap.char( 255 ) ; 
 ProdAllocObjectDescription_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_ProdAllocationObjectTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocationObjectTP : association [1] to ZUST01_A_PRODALLOCATIONOBJECT on 1 = 1; 
 } 
