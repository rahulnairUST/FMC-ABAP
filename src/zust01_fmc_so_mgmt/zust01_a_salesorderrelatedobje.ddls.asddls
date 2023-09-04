/********** GENERATED on 08/17/2023 at 09:00:22 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderRelatedObject' 
 @OData.entityType.name: 'A_SalesOrderRelatedObjectType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SALESORDERRELATEDOBJE { 
 key SalesOrder : abap.char( 10 ) ; 
 key SDDocRelatedObjectSequenceNmbr : abap.numc( 4 ) ; 
 @Odata.property.valueControl: 'SDDocumentRelatedObjectType_vc' 
 SDDocumentRelatedObjectType : abap.char( 5 ) ; 
 SDDocumentRelatedObjectType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SDDocRelatedObjectSystem_vc' 
 SDDocRelatedObjectSystem : abap.char( 60 ) ; 
 SDDocRelatedObjectSystem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SDDocRelatedObjectReference_vc' 
 SDDocRelatedObjectReference1 : abap.char( 60 ) ; 
 SDDocRelatedObjectReference_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SDDocRelatedObjectReference_v1' 
 SDDocRelatedObjectReference2 : abap.char( 60 ) ; 
 SDDocRelatedObjectReference_v1 : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder1234567 : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 } 
