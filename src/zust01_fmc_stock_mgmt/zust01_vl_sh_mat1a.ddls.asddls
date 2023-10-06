/********** GENERATED on 10/04/2023 at 14:44:33 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1A' 
 @OData.entityType.name: 'VL_SH_MAT1A' 
 define root abstract entity ZUST01_VL_SH_MAT1A { 
 key MATNR : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'BISMT_vc' 
 BISMT : abap.char( 40 ) ; 
 BISMT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SPRAS_vc' 
 SPRAS : abap.char( 2 ) ; 
 SPRAS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
