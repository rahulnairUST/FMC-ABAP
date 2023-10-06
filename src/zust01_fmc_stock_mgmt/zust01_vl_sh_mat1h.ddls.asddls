/********** GENERATED on 10/04/2023 at 14:44:34 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1H' 
 @OData.entityType.name: 'VL_SH_MAT1H' 
 define root abstract entity ZUST01_VL_SH_MAT1H { 
 key MATNR : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'PRDHA_vc' 
 PRDHA : abap.char( 18 ) ; 
 PRDHA_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VKORG_vc' 
 VKORG : abap.char( 4 ) ; 
 VKORG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VTWEG_vc' 
 VTWEG : abap.char( 2 ) ; 
 VTWEG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SPRAS_vc' 
 SPRAS : abap.char( 2 ) ; 
 SPRAS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
