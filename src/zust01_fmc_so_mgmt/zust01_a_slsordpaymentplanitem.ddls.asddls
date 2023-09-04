/********** GENERATED on 08/17/2023 at 09:00:26 by CB9980000010**************/
 @OData.entitySet.name: 'A_SlsOrdPaymentPlanItemDetails' 
 @OData.entityType.name: 'A_SlsOrdPaymentPlanItemDetailsType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZUST01_A_SLSORDPAYMENTPLANITEM { 
 key SalesOrder : abap.char( 10 ) ; 
 key PaymentPlanItem : abap.numc( 6 ) ; 
 @Odata.property.valueControl: 'PaymentPlan_vc' 
 PaymentPlan : abap.char( 10 ) ; 
 PaymentPlan_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ElectronicPaymentType_vc' 
 ElectronicPaymentType : abap.char( 4 ) ; 
 ElectronicPaymentType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ElectronicPayment_vc' 
 ElectronicPayment : abap.char( 25 ) ; 
 ElectronicPayment_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytValidityStartDate_vc' 
 EPaytValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 EPaytValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytValidityEndDate_vc' 
 EPaytValidityEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 EPaytValidityEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ElectronicPaymentHolderName_vc' 
 ElectronicPaymentHolderName : abap.char( 40 ) ; 
 ElectronicPaymentHolderName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizedAmountInAuthznCrc_vc' 
 @Semantics.amount.currencyCode: 'AuthorizationCurrency' 
 AuthorizedAmountInAuthznCrcy : abap.curr( 16, 3 ) ; 
 AuthorizedAmountInAuthznCrc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationCurrency_vc' 
 @Semantics.currencyCode: true 
 AuthorizationCurrency : abap.cuky ; 
 AuthorizationCurrency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationByDigitalPaytS_vc' 
 AuthorizationByDigitalPaytSrvc : abap.char( 10 ) ; 
 AuthorizationByDigitalPaytS_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationByAcquirer_vc' 
 AuthorizationByAcquirer : abap.char( 15 ) ; 
 AuthorizationByAcquirer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationDate_vc' 
 AuthorizationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 AuthorizationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationTime_vc' 
 AuthorizationTime : RAP_CP_ODATA_V2_EDM_TIME ; 
 AuthorizationTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationStatusName_vc' 
 AuthorizationStatusName : abap.char( 40 ) ; 
 AuthorizationStatusName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytByDigitalPaymentSrvc_vc' 
 EPaytByDigitalPaymentSrvc : abap.char( 25 ) ; 
 EPaytByDigitalPaymentSrvc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ElectronicPaymentCallStatus_vc' 
 ElectronicPaymentCallStatus : abap.char( 1 ) ; 
 ElectronicPaymentCallStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytAuthorizationResult_vc' 
 EPaytAuthorizationResult : abap.char( 1 ) ; 
 EPaytAuthorizationResult_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytToBeAuthorizedAmount_vc' 
 @Semantics.amount.currencyCode: 'AuthorizationCurrency' 
 EPaytToBeAuthorizedAmount : abap.curr( 16, 3 ) ; 
 EPaytToBeAuthorizedAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytAuthorizationIsExpired_vc' 
 EPaytAuthorizationIsExpired : abap_boolean ; 
 EPaytAuthorizationIsExpired_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EPaytAmountIsChanged_vc' 
 EPaytAmountIsChanged : abap_boolean ; 
 EPaytAmountIsChanged_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PreauthorizationIsRequested_vc' 
 PreauthorizationIsRequested : abap_boolean ; 
 PreauthorizationIsRequested_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentServiceProvider_vc' 
 PaymentServiceProvider : abap.char( 4 ) ; 
 PaymentServiceProvider_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentByPaymentServicePrvd_vc' 
 PaymentByPaymentServicePrvdr : abap.char( 40 ) ; 
 PaymentByPaymentServicePrvd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransactionByPaytSrvcPrvdr_vc' 
 TransactionByPaytSrvcPrvdr : abap.char( 40 ) ; 
 TransactionByPaytSrvcPrvdr_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MerchantByClearingHouse_vc' 
 MerchantByClearingHouse : abap.char( 15 ) ; 
 MerchantByClearingHouse_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentCardAuthznRelationID_vc' 
 PaymentCardAuthznRelationID : abap.char( 44 ) ; 
 PaymentCardAuthznRelationID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumToBeAuthorizedAmount_vc' 
 @Semantics.amount.currencyCode: 'AuthorizationCurrency' 
 MaximumToBeAuthorizedAmount : abap.curr( 16, 3 ) ; 
 MaximumToBeAuthorizedAmount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaytPlnForAuthorizationItem_vc' 
 PaytPlnForAuthorizationItem : abap.char( 10 ) ; 
 PaytPlnForAuthorizationItem_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaytPlnItmForAuthorizationI_vc' 
 PaytPlnItmForAuthorizationItem : abap.numc( 6 ) ; 
 PaytPlnItmForAuthorizationI_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesOrder' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesOrder123456789 : association [1] to ZUST01_A_SALESORDER on 1 = 1; 
 } 
