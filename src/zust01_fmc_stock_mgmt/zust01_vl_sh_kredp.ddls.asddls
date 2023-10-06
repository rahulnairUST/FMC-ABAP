/********** GENERATED on 10/04/2023 at 14:44:40 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_KREDP' 
 @OData.entityType.name: 'VL_SH_KREDP' 
 define root abstract entity ZUST01_VL_SH_KREDP { 
 key LIFNR : abap.char( 10 ) ; 
 key PERNR : abap.numc( 8 ) ; 
 key MCOD1 : abap.char( 25 ) ; 
 key BUKRS : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'BEGRU_vc' 
 BEGRU : abap.char( 4 ) ; 
 BEGRU_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'KTOKK_vc' 
 KTOKK : abap.char( 4 ) ; 
 KTOKK_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
