/********** GENERATED on 10/04/2023 at 14:44:36 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1T' 
 @OData.entityType.name: 'VL_SH_MAT1T' 
 define root abstract entity ZUST01_VL_SH_MAT1T { 
 key MATNR : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'MTART_vc' 
 MTART : abap.char( 4 ) ; 
 MTART_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SPRAS_vc' 
 SPRAS : abap.char( 2 ) ; 
 SPRAS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
