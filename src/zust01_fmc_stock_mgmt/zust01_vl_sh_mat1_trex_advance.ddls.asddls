/********** GENERATED on 10/04/2023 at 14:44:37 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_MAT1_TREX_ADVANCED' 
 @OData.entityType.name: 'VL_SH_MAT1_TREX_ADVANCED' 
 define root abstract entity ZUST01_VL_SH_MAT1_TREX_ADVANCE { 
 key OBJECT_ID : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'BUSINESS_OBJECT_vc' 
 BUSINESS_OBJECT : abap.char( 10 ) ; 
 BUSINESS_OBJECT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DESCRIPTION_vc' 
 DESCRIPTION : abap.char( 40 ) ; 
 DESCRIPTION_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OBJECT_TYPE_vc' 
 OBJECT_TYPE : abap.char( 10 ) ; 
 OBJECT_TYPE_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'STD_DESCR_vc' 
 STD_DESCR : abap.char( 18 ) ; 
 STD_DESCR_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SxRPxSEARCH_TERM_vc' 
 SxRPxSEARCH_TERM : abap.char( 45 ) ; 
 SxRPxSEARCH_TERM_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SxRPxMODE_FUZZY_vc' 
 SxRPxMODE_FUZZY : abap.char( 1 ) ; 
 SxRPxMODE_FUZZY_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EXTERNAL_KEY_vc' 
 EXTERNAL_KEY : abap.char( 40 ) ; 
 EXTERNAL_KEY_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OLD_MAT_NO_vc' 
 OLD_MAT_NO : abap.char( 40 ) ; 
 OLD_MAT_NO_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EAN_UPC_vc' 
 EAN_UPC : abap.char( 18 ) ; 
 EAN_UPC_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MATL_TYPE_vc' 
 MATL_TYPE : abap.char( 4 ) ; 
 MATL_TYPE_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MATL_CAT_vc' 
 MATL_CAT : abap.char( 2 ) ; 
 MATL_CAT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PROD_HIER_vc' 
 PROD_HIER : abap.char( 18 ) ; 
 PROD_HIER_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MATL_GROUP_vc' 
 MATL_GROUP : abap.char( 9 ) ; 
 MATL_GROUP_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PLANT_vc' 
 PLANT : abap.char( 4 ) ; 
 PLANT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SALESORG_vc' 
 SALESORG : abap.char( 4 ) ; 
 SALESORG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DISTR_CHAN_vc' 
 DISTR_CHAN : abap.char( 2 ) ; 
 DISTR_CHAN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DIVISION_vc' 
 DIVISION : abap.char( 2 ) ; 
 DIVISION_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DEL_FLAG_vc' 
 DEL_FLAG : abap_boolean ; 
 DEL_FLAG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
