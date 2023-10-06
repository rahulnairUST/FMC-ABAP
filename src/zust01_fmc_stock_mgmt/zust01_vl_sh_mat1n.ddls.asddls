/********** GENERATED on 10/04/2023 at 14:44:35 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1N' 
 @OData.entityType.name: 'VL_SH_MAT1N' 
 define root abstract entity ZUST01_VL_SH_MAT1N { 
 key MATNR : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'EAN11_vc' 
 EAN11 : abap.char( 18 ) ; 
 EAN11_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SPRAS_vc' 
 SPRAS : abap.char( 2 ) ; 
 SPRAS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MEINH_vc' 
 MEINH : abap.char( 3 ) ; 
 MEINH_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HPEAN_vc' 
 HPEAN : abap_boolean ; 
 HPEAN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
