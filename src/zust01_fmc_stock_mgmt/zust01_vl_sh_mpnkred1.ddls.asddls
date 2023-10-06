/********** GENERATED on 10/04/2023 at 14:44:40 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MPNKRED1' 
 @OData.entityType.name: 'VL_SH_MPNKRED1' 
 define root abstract entity ZUST01_VL_SH_MPNKRED1 { 
 key EMNFR : abap.char( 10 ) ; 
 key LIFNR : abap.char( 10 ) ; 
 key NAME1 : abap.char( 35 ) ; 
 @Odata.property.valueControl: 'BEGRU_vc' 
 BEGRU : abap.char( 4 ) ; 
 BEGRU_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'KTOKK_vc' 
 KTOKK : abap.char( 4 ) ; 
 KTOKK_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
