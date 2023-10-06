/********** GENERATED on 10/04/2023 at 14:44:30 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_DEBIA' 
 @OData.entityType.name: 'VL_SH_DEBIA' 
 define root abstract entity ZUST01_VL_SH_DEBIA { 
 key SORTL : abap.char( 10 ) ; 
 key LAND1 : abap.char( 3 ) ; 
 key PSTLZ : abap.char( 10 ) ; 
 key MCOD3 : abap.char( 25 ) ; 
 key MCOD1 : abap.char( 25 ) ; 
 key KUNNR : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'BEGRU_vc' 
 BEGRU : abap.char( 4 ) ; 
 BEGRU_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'KTOKD_vc' 
 KTOKD : abap.char( 4 ) ; 
 KTOKD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LOEVM_vc' 
 LOEVM : abap_boolean ; 
 LOEVM_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
