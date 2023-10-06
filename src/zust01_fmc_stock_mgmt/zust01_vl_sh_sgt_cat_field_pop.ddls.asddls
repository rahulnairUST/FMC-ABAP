/********** GENERATED on 10/04/2023 at 14:44:42 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_SGT_CAT_FIELD_POPUP_E' 
 @OData.entityType.name: 'VL_SH_SGT_CAT_FIELD_POPUP_E' 
 define root abstract entity ZUST01_VL_SH_SGT_CAT_FIELD_POP { 
 key WERKS : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'CSGR_vc' 
 CSGR : abap.char( 4 ) ; 
 CSGR_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OTHER_COVS_vc' 
 OTHER_COVS : abap.char( 8 ) ; 
 OTHER_COVS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OTHER_WERKS_vc' 
 OTHER_WERKS : abap.char( 4 ) ; 
 OTHER_WERKS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RESWK_vc' 
 RESWK : abap.char( 4 ) ; 
 RESWK_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VALUE_vc' 
 VALUE : abap.char( 40 ) ; 
 VALUE_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WITH_RULE_INPUT_vc' 
 WITH_RULE_INPUT : abap_boolean ; 
 WITH_RULE_INPUT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MATNR_vc' 
 MATNR : abap.char( 40 ) ; 
 MATNR_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'COVS_vc' 
 COVS : abap.char( 8 ) ; 
 COVS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'APPL_vc' 
 APPL : abap.char( 1 ) ; 
 APPL_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CFUN_vc' 
 CFUN : abap.char( 3 ) ; 
 CFUN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
