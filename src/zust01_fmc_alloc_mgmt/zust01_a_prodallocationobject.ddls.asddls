/********** GENERATED on 08/07/2023 at 09:13:20 by CB9980000010**************/
 @OData.entitySet.name: 'A_ProdAllocationObject' 
 @OData.entityType.name: 'A_ProdAllocationObjectType' 
 define root abstract entity ZUST01_A_PRODALLOCATIONOBJECT { 
 key ProductAllocationObjectUUID : sysuuid_x16 ; 
 @Odata.property.valueControl: 'ProductAllocationObject_vc' 
 ProductAllocationObject : abap.char( 40 ) ; 
 ProductAllocationObject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationObject_Tex_vc' 
 ProductAllocationObject_Text : abap.char( 255 ) ; 
 ProductAllocationObject_Tex_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationPeriodType_vc' 
 ProductAllocationPeriodType : abap.char( 2 ) ; 
 ProductAllocationPeriodType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocationPeriodTimeZon_vc' 
 ProdAllocationPeriodTimeZone : abap.char( 6 ) ; 
 ProdAllocationPeriodTimeZon_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FactoryCalendar_vc' 
 FactoryCalendar : abap.char( 2 ) ; 
 FactoryCalendar_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdAllocCheckDateTimeType_vc' 
 ProdAllocCheckDateTimeType : abap.char( 2 ) ; 
 ProdAllocCheckDateTimeType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductAllocationQuantityUn_vc' 
 ProductAllocationQuantityUnit : abap.char( 3 ) ; 
 ProductAllocationQuantityUn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CollectiveAllocationType_vc' 
 CollectiveAllocationType : abap.char( 2 ) ; 
 CollectiveAllocationType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDateTime_vc' 
 CreationDateTime : tzntstmpl ; 
 CreationDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangeDateTime_vc' 
 LastChangeDateTime : tzntstmpl ; 
 LastChangeDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedByUser_vc' 
 LastChangedByUser : abap.char( 12 ) ; 
 LastChangedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ZZ1_RESPONSIBLE_PERSON_PAO_vc' 
 ZZ1_RESPONSIBLE_PERSON_PAO : abap.char( 60 ) ; 
 ZZ1_RESPONSIBLE_PERSON_PAO_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_ProdAllocCharcMetaDataTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocCharcMetaDataTP : association [0..*] to ZUST01_A_PRODALLOCCHARCMETADAT on 1 = 1; 
 @OData.property.name: 'to_ProdAllocCharcValCombnTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocCharcValCombnTP : association [0..*] to ZUST01_A_PRODALLOCCHARCVALCOMB on 1 = 1; 
 @OData.property.name: 'to_ProdAllocationObjectTTP' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdAllocationObjectTTP : association [0..*] to ZUST01_A_PRODALLOCATIONOBJECTT on 1 = 1; 
 } 
