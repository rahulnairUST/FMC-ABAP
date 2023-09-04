/********** GENERATED on 08/17/2023 at 08:59:27 by CB9980000010**************/
 @OData.entitySet.name: 'A_SalesOrderValAddedSrvc' 
 @OData.entityType.name: 'A_SalesOrderValAddedSrvcType' 
 define root abstract entity ZUST01_A_SALESORDERVALADDEDSRV { 
 key ValueAddedServiceType : abap.numc( 2 ) ; 
 key ValueAddedSubServiceType : abap.char( 5 ) ; 
 key SalesOrder : abap.char( 10 ) ; 
 key SalesOrderItem : abap.numc( 6 ) ; 
 @Odata.property.valueControl: 'ValAddedSrvcTransactionNumb_vc' 
 ValAddedSrvcTransactionNumber : abap.char( 10 ) ; 
 ValAddedSrvcTransactionNumb_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcItemGroup_vc' 
 ValAddedSrvcItemGroup : abap.numc( 5 ) ; 
 ValAddedSrvcItemGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcItemNumber_vc' 
 ValAddedSrvcItemNumber : abap.numc( 5 ) ; 
 ValAddedSrvcItemNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValueAddedServiceProduct_vc' 
 ValueAddedServiceProduct : abap.char( 40 ) ; 
 ValueAddedServiceProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcHasToBeOrdered_vc' 
 ValAddedSrvcHasToBeOrdered : abap_boolean ; 
 ValAddedSrvcHasToBeOrdered_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcIncrement_vc' 
 ValAddedSrvcIncrement : abap.numc( 4 ) ; 
 ValAddedSrvcIncrement_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValueAddedServiceChargeCode_vc' 
 ValueAddedServiceChargeCode : abap.char( 3 ) ; 
 ValueAddedServiceChargeCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcIsCreatedManual_vc' 
 ValAddedSrvcIsCreatedManually : abap.char( 1 ) ; 
 ValAddedSrvcIsCreatedManual_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcItemNumberInSD_vc' 
 ValAddedSrvcItemNumberInSD : abap.numc( 6 ) ; 
 ValAddedSrvcItemNumberInSD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValAddedSrvcIsRlvtForProcmt_vc' 
 ValAddedSrvcIsRlvtForProcmt : abap_boolean ; 
 ValAddedSrvcIsRlvtForProcmt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValueAddedServiceText1_vc' 
 ValueAddedServiceText1 : abap.char( 20 ) ; 
 ValueAddedServiceText1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValueAddedServiceText2_vc' 
 ValueAddedServiceText2 : abap.char( 20 ) ; 
 ValueAddedServiceText2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValueAddedServiceText3_vc' 
 ValueAddedServiceText3 : abap.char( 20 ) ; 
 ValueAddedServiceText3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValueAddedServiceLongText_vc' 
 ValueAddedServiceLongText : abap.char( 132 ) ; 
 ValueAddedServiceLongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
