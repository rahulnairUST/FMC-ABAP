@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom Entity for SELID'
define root view entity ZUST01_CE_SELID_01 as select from zust01_selid
{
    key selection_id as SelectionId,
    source as Source
}
