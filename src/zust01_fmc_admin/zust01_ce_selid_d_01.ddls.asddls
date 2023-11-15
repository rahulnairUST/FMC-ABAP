@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Entity for SELID_D'
define root view entity ZUST01_CE_SELID_D_01 as select from zust01_selid_d
{
    key selection_id as SelectionId,
    stock_unrestricted as StockUnrestricted,
    stock_safety as StockSafety,
    stock_in_transfer as StockInTransfer,
    stock_quality as StockQuality,
    stock_blocked as StockBlocked,
    stock_restricted as StockRestricted,
    purchase_requisitions as PurchaseRequisitions,
    purchase_orders as PurchaseOrders,
    shipping_notifications as ShippingNotifications,
    planned_orders as PlannedOrders,
    production_orders as ProductionOrders,
    no_receipts_in_past as NoReceiptsInPast,
    sales_orders as SalesOrders,
    deliveries as Deliveries,
    sto_requirements as StoRequirements,
    reservations as Reservations,
    dependent_requirements as DependentRequirements,
    dependent_reservations as DependentReservations
}
