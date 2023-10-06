/********** GENERATED on 10/04/2023 at 14:44:26 by CB9980000020**************/
 @OData.entitySet.name: 'MaterialMultiStockByDates' 
 @OData.entityType.name: 'MaterialMultiStockByDate' 
 define root abstract entity ZUST01_MATERIALMULTISTOCKBYDAT { 
 key GeneratedId : abap.string( 0 ) ; 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 Batch : abap.char( 10 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 BlockedStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 BlockedStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 BlockedStockQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 BlockedStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 BlockedStockValueInDC : abap.curr( 23, 2 ) ; 
 @Odata.property.valueControl: 'CalendarDate_vc' 
 CalendarDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CalendarDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 CurrentStock : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 CurrentStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 CurrentStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 CurrentStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 CurrentStockValueInDC : abap.curr( 23, 2 ) ; 
 Customer : abap.char( 10 ) ; 
 CustomerName : abap.char( 30 ) ; 
 @Semantics.currencyCode: true 
 DisplayCurrency : abap.cuky ; 
 @Semantics.amount.currencyCode: 'Currency' 
 GoodsReceiptBlockedStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 GoodsReceiptBlockedStockQty : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 GoodsReceiptBlockedStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 GRBlockedStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 GRBlockedStockValueInDC : abap.curr( 23, 2 ) ; 
 InventorySpecialStockType : abap.char( 1 ) ; 
 InventorySpecialStockTypeName : abap.char( 20 ) ; 
 InventoryValuationType : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'ManufactureDate_vc' 
 ManufactureDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ManufactureDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 Material : abap.char( 40 ) ; 
 MaterialGroup : abap.char( 9 ) ; 
 MaterialGroupName : abap.char( 20 ) ; 
 MaterialName : abap.char( 40 ) ; 
 MaterialIsMarkedForDeletion : abap.char( 1 ) ; 
 Plant : abap.char( 4 ) ; 
 PlantName : abap.char( 30 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 QualityInspectionStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 QualityInspectionStockQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 QualityInspectionStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 QualityInspStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 QualityInspStockValueInDC : abap.curr( 23, 2 ) ; 
 ResourceName : abap.char( 40 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 RestrictedStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 RestrictedStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 RestrictedStockQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 RestrictedStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 RestrictedStockValueInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 ReturnsBlockedStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 ReturnsBlockedStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 ReturnsBlockedStockQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 ReturnsBlockedStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 ReturnsBlockedStockValueInDC : abap.curr( 23, 2 ) ; 
 SalesOrder : abap.char( 10 ) ; 
 SalesOrderItem : abap.char( 6 ) ; 
 SegmentIsEmpty : abap_boolean ; 
 @Odata.property.valueControl: 'ShelfLifeExpirationDate_vc' 
 ShelfLifeExpirationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ShelfLifeExpirationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 SourceConstantId : abap.char( 2 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 StockInTransitCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 StockInTransitCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 StockInTransitQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 StockInTransitValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 StockInTransitValueInDC : abap.curr( 23, 2 ) ; 
 StorageLocation : abap.char( 4 ) ; 
 StorageLocationName : abap.char( 16 ) ; 
 Supplier : abap.char( 10 ) ; 
 SupplierName : abap.char( 30 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 TiedEmptiesStockCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 TiedEmptiesStockCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 TiedEmptiesStockQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 TiedEmptiesStockValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 TiedEmptiesStockValueInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 TransferStockPlantCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 TransferStockPlantCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 TransferStockPlantQuantity : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 TransferStockPlantValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 TransferStockPlantValueInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 TransferStockStorageLocCurVal : abap.curr( 23, 2 ) ; 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 TransferStockStorageLocQty : abap.dec( 21, 3 ) ; 
 @Semantics.amount.currencyCode: 'Currency' 
 TransferStockStorageLocValue : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 TransferStockStorLocCurValInDC : abap.curr( 23, 2 ) ; 
 @Semantics.amount.currencyCode: 'DisplayCurrency' 
 TransferStockStorLocValueInDC : abap.curr( 23, 2 ) ; 
 WarehouseStorageBin : abap.char( 10 ) ; 
 WBSElement : abap.char( 24 ) ; 
 WBSDescription : abap.char( 40 ) ; 
 WBSElementInternalID : abap.char( 8 ) ; 
 ValuationAreaType : abap.char( 1 ) ; 
 CrossPlantConfigurableProduct : abap.char( 40 ) ; 
 ProductCharacteristic1 : abap.char( 18 ) ; 
 ProductCharacteristic2 : abap.char( 18 ) ; 
 ProductCharacteristic3 : abap.char( 18 ) ; 
 StockSegment : abap.char( 40 ) ; 
 
 } 
