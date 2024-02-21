@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Entity for Trace TS'
define root view entity ZUST01_CE_TRC_ts as select from zust01_trc_ts
{
    key transaction_id as TransactionId,
    key transaction_cnt as TransactionCnt,
    planning_screen as PlanningScreen,
    product_allocation_object as ProductAllocationObject,
    event as Event,
    change_timestamp as ChangeTimestamp,
    change_userid as ChangeUserid,
    keyfigure as Keyfigure,
    period_name as PeriodName,
    period_from as PeriodFrom,
    period_to as PeriodTo,
    quantity_old as QuantityOld,
    quantity_new as QuantityNew,
    quantity_uom as QuantityUom,
    prodalloccharc01 as Prodalloccharc01,
    prodalloccharc02 as Prodalloccharc02,
    prodalloccharc03 as Prodalloccharc03,
    prodalloccharc04 as Prodalloccharc04,
    prodalloccharc05 as Prodalloccharc05,
    prodalloccharc06 as Prodalloccharc06,
    prodalloccharc07 as Prodalloccharc07,
    prodalloccvc01 as Prodalloccvc01,
    prodalloccvc02 as Prodalloccvc02,
    prodalloccvc03 as Prodalloccvc03,
    prodalloccvc04 as Prodalloccvc04,
    prodalloccvc05 as Prodalloccvc05,
    prodalloccvc06 as Prodalloccvc06,
    prodalloccvc07 as Prodalloccvc07
}
