/********** GENERATED on 08/17/2023 at 09:00:20 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderItemText' 
 @OData.entityType.name: 'A_SalesOrderItemTextType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SALESORDERITEMTEXT { 
 key SalesOrder : abap.char( 10 ) ; 
 key SalesOrderItem : abap.numc( 6 ) ; 
 key Language : abap.char( 2 ) ; 
 key LongTextID : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder123456 : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 @OData.property.name: 'to_SalesOrderItem' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrderItem123 : association [1] to ZUST01_A_SALESORDERITEM on 1 = 1; 
 } 
