/********** GENERATED on 10/04/2023 at 14:44:37 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1V' 
 @OData.entityType.name: 'VL_SH_MAT1V' 
 define root abstract entity ZUST01_VL_SH_MAT1V { 
 key MATNR : abap.char( 40 ) ; 
 key WERKS : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'PRVBE_vc' 
 PRVBE : abap.char( 10 ) ; 
 PRVBE_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SPRAS_vc' 
 SPRAS : abap.char( 2 ) ; 
 SPRAS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
