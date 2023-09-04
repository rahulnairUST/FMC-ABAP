@AbapCatalog.sqlViewName: 'ZUST01VUSRMGMT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'User Managment View Entity'
define root view ZUST01_USR_MGMT_DD as select from zust01_usr_mgmt
{
    key uname as Uname,
    key planning_screen as PlanningScreen,
    company as Company,
    acess_type as AcessType,
    status as Status,
    cbuser as CBUser
    
}
