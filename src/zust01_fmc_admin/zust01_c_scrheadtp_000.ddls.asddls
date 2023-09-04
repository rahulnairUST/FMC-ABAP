@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZUST01_R_SCRHEADTP_000'
@ObjectModel.semanticKey: [ 'PlanningScreen' ]
define root view entity ZUST01_C_SCRHEADTP_000
  provider contract transactional_query
  as projection on ZUST01_R_SCRHEADTP_000
{
  key PlanningScreen,
  PlanningScreenDescr,
  ProductAllocationObject,
  BuckDispFormat,
  ExcelImport,
  ButtonCvcCollapse,
  ButtonCvcPaging,
  CvcStatusLogWrite,
  TimeseriesLogWrite,
  CvcLogDisplay,
  TraceDisplay,
  CvcStatusChangeDispOption,
  CvcStatusChange,
  ButtonRefresh,
  DraftDisplay,
  DraftMultiUser,
  AllowNotes,
  ConsumptionView,
  CvcAddRemove,
  SalesOrderView,
  UserSettings,
  PeriodIndicator,
  FiscalYearVariant,
  LocalLastChagnedAt
  
}
