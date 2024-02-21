@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Entity for Trace CVC'
define root view entity ZUST01_CE_TRC_cvc as select from zust01_trc_cvc
{
    key transaction_id as TransactionId,
    key transaction_cnt as TransactionCnt,
    planning_screen as PlanningScreen,
    product_allocation_object as ProductAllocationObject,
    event as Event,
    change_timestamp as ChangeTimestamp,
    change_userid as ChangeUserid,
    cvc_activation_status_old as CvcActivationStatusOld,
    cvc_activation_status_new as CvcActivationStatusNew,
    cvc_constraint_status_old as CvcConstraintStatusOld,
    cvc_constraint_status_new as CvcConstraintStatusNew,
    transfer_to_collective as TransferToCollective,
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
