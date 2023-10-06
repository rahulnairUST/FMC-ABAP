/********** GENERATED on 10/04/2023 at 14:44:39 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_KREDK' 
 @OData.entityType.name: 'VL_SH_KREDK' 
 define root abstract entity ZUST01_VL_SH_KREDK { 
 key LIFNR : abap.char( 10 ) ; 
 key BUKRS : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'BEGRU_vc' 
 BEGRU : abap.char( 4 ) ; 
 BEGRU_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'KTOKK_vc' 
 KTOKK : abap.char( 4 ) ; 
 KTOKK_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SORTL_vc' 
 SORTL : abap.char( 10 ) ; 
 SORTL_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LAND1_vc' 
 LAND1 : abap.char( 3 ) ; 
 LAND1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PSTLZ_vc' 
 PSTLZ : abap.char( 10 ) ; 
 PSTLZ_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MCOD3_vc' 
 MCOD3 : abap.char( 25 ) ; 
 MCOD3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MCOD1_vc' 
 MCOD1 : abap.char( 25 ) ; 
 MCOD1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LOEVM_vc' 
 LOEVM : abap_boolean ; 
 LOEVM_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
