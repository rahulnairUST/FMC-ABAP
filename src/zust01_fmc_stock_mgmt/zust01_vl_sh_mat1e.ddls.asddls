/********** GENERATED on 10/04/2023 at 14:44:34 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1E' 
 @OData.entityType.name: 'VL_SH_MAT1E' 
 define root abstract entity ZUST01_VL_SH_MAT1E { 
 key MATNR : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'KUNNR_vc' 
 KUNNR : abap.char( 10 ) ; 
 KUNNR_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SPRAS_vc' 
 SPRAS : abap.char( 2 ) ; 
 SPRAS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
