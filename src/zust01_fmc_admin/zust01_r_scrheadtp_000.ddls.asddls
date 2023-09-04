@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Flex Header Settings'
define root view entity ZUST01_R_SCRHEADTP_000
  as select from zust01_scrheadv as FLEXIOM
{
  key planning_screen as PlanningScreen,
  planning_screen_descr as PlanningScreenDescr,
  product_allocation_object as ProductAllocationObject,
  buck_disp_format as BuckDispFormat,
  excel_import as ExcelImport,
  button_cvc_collapse as ButtonCvcCollapse,
  button_cvc_paging as ButtonCvcPaging,
  cvc_status_log_write as CvcStatusLogWrite,
  timeseries_log_write as TimeseriesLogWrite,
  cvc_log_display as CvcLogDisplay,
  trace_display as TraceDisplay,
  cvc_status_change_disp_option as CvcStatusChangeDispOption,
  cvc_status_change as CvcStatusChange,
  button_refresh as ButtonRefresh,
  draft_display as DraftDisplay,
  draft_multi_user as DraftMultiUser,
  allow_notes as AllowNotes,
  consumption_view as ConsumptionView,
  cvc_add_remove as CvcAddRemove,
  sales_order_view as SalesOrderView,
  user_settings as UserSettings,
  period_indicator as PeriodIndicator,
  fiscal_year_variant as FiscalYearVariant,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_chagned_at as LocalLastChagnedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
