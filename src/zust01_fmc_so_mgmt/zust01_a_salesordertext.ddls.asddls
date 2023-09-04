/********** GENERATED on 08/17/2023 at 09:00:24 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderText' 
 @OData.entityType.name: 'A_SalesOrderTextType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SALESORDERTEXT { 
 key SalesOrder : abap.char( 10 ) ; 
 key Language : abap.char( 2 ) ; 
 key LongTextID : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder12345678 : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 } 
