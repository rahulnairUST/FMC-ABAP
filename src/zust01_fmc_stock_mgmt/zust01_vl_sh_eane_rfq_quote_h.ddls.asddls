/********** GENERATED on 10/04/2023 at 14:44:38 by CB9980000020**************/
 @OData.entitySet.name: 'VL_SH_EANE_RFQ_QUOTE_H' 
 @OData.entityType.name: 'VL_SH_EANE_RFQ_QUOTE_H' 
 define root abstract entity ZUST01_VL_SH_EANE_RFQ_QUOTE_H { 
 key MATNR : abap.char( 40 ) ; 
 key MEINH : abap.char( 3 ) ; 
 key LIFNR : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'LFEAN_vc' 
 LFEAN : abap_boolean ; 
 LFEAN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EAN11_vc' 
 EAN11 : abap.char( 18 ) ; 
 EAN11_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MAKTG_vc' 
 MAKTG : abap.char( 40 ) ; 
 MAKTG_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LARTN_vc' 
 LARTN : abap.char( 35 ) ; 
 LARTN_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
