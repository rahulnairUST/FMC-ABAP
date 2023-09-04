/********** GENERATED on 08/17/2023 at 09:00:03 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderHeaderPartner' 
 @OData.entityType.name: 'A_SalesOrderHeaderPartnerType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SALESORDERHEADERPARTN { 
 key SalesOrder : abap.char( 10 ) ; 
 key PartnerFunction : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'Customer_vc' 
 Customer : abap.char( 10 ) ; 
 Customer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Supplier_vc' 
 Supplier : abap.char( 10 ) ; 
 Supplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Personnel_vc' 
 Personnel : abap.numc( 8 ) ; 
 Personnel_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ContactPerson_vc' 
 ContactPerson : abap.numc( 10 ) ; 
 ContactPerson_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 } 
