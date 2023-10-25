/********** GENERATED on 10/17/2023 at 13:22:58 by CB9980000021**************/
 @OData.entitySet.name: 'SupplyDemandItems' 
 @OData.entityType.name: 'SupplyDemandItem' 
 define root abstract entity ZUST01_SUPPLYDEMANDITEMS { 
 key Material : abap.char( 40 ) ; 
 key MRPArea : abap.char( 10 ) ; 
 key MRPPlant : abap.char( 4 ) ; 
 key MRPPlanningSegment : abap.char( 20 ) ; 
 key MRPPlanningSegmentType : abap.char( 2 ) ; 
 key MaterialShortageProfile : abap.char( 12 ) ; 
 DemandCategoryGroup : abap.char( 1 ) ; 
 DemandCategoryGroupName : abap.char( 60 ) ; 
 ReceiptCategoryGroup : abap.char( 1 ) ; 
 ReceiptCategoryGroupName : abap.char( 60 ) ; 
 UnitOfMeasureName : abap.char( 6 ) ; 
 UnitOfMeasureText : abap.char( 30 ) ; 
 MaterialExternalID : abap.char( 40 ) ; 
 MRPAvailability : abap.char( 1 ) ; 
 MaterialSafetyStockQty : abap.dec( 13, 3 ) ; 
 MRPElementOpenQuantity : abap.dec( 13, 3 ) ; 
 MRPAvailableQuantity : abap.dec( 13, 3 ) ; 
 MRPElement : abap.char( 12 ) ; 
 MRPElementAvailyOrRqmtDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 MRPElementBusinessPartner : abap.char( 10 ) ; 
 MRPElementBusinessPartnerName : abap.char( 35 ) ; 
 MRPElementBusinessPartnerType : abap.char( 1 ) ; 
 MRPElementCategory : abap.char( 2 ) ; 
 MRPElementCategoryShortName : abap.char( 10 ) ; 
 MRPElementCategoryName : abap.char( 60 ) ; 
 MRPElementDocumentType : abap.char( 4 ) ; 
 MRPElementDocumentTypeName : abap.char( 60 ) ; 
 MRPElementIsPartiallyDelivered : abap_boolean ; 
 MRPElementIsReleased : abap_boolean ; 
 MRPElementItem : abap.char( 6 ) ; 
 MRPElementQuantityIsFirm : abap_boolean ; 
 MRPElementScheduleLine : abap.char( 4 ) ; 
 ProductionVersion : abap.char( 4 ) ; 
 SourceMRPElement : abap.char( 12 ) ; 
 SourceMRPElementCategory : abap.char( 2 ) ; 
 SourceMRPElementItem : abap.char( 6 ) ; 
 SourceMRPElementScheduleLine : abap.char( 4 ) ; 
 StorageLocation : abap.char( 4 ) ; 
 TimeHorizonCode : abap.char( 1 ) ; 
 ExceptionMessageNumber : abap.char( 2 ) ; 
 ExceptionMessageText : abap.char( 60 ) ; 
 ExceptionMessageNumber2 : abap.char( 2 ) ; 
 ExceptionMessageText2 : abap.char( 60 ) ; 
 PeriodType : abap.char( 1 ) ; 
 PeriodOrSegment : abap.char( 22 ) ; 
 NumberOfWorkdaysPerPeriod : abap.int2 ; 
 NumberOfAggregatedItems : abap.int2 ; 
 MRPController : abap.char( 3 ) ; 
 
 } 
