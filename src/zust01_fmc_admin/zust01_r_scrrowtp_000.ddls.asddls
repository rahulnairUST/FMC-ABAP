@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Flex Row Table'
define root view entity ZUST01_R_SCRROWTP_000
  as select from zust01_scrrow as FLEXIOMROW
{
  key planning_screen as PlanningScreen,
  key line_name as LineName,
  description as Description,
  sorting as Sorting,
  cvc_group_idx as CvcGroupIdx,
  editable as Editable,
  draft as Draft,
  allow_keyfg_selection as AllowKeyfgSelection,
  timeseries_table as TimeseriesTable,
  read_selectionid as ReadSelectionID,
  save_selectionid as SaveSelectionID,
  line_name_save as LineNameSave,
  line_name_backup as LineNameBackup,
  save_cons_check as SaveConsCheck,
  delta_update as DeltaUpdate,
  calculation_id as CalculationID,
  calculation_sequence as CalculationSequence,
  cvc_format_1st_occurrance as CvcFormat1stOccurrance,
  cvc_display as CvcDisplay,
  cvc_color as CvcColor,
  cvc_color_code as CvcColorCode,
  keyfigure_color_code as KeyfigureColorCode,
  bucket_color_code as BucketColorCode,
  cvc_status_display as CvcStatusDisplay,
  cvc_status_color_code as CvcStatusColorCode,
  add_remove_orders as AddRemoveOrders,
  notes_text_id as NotesTextID,
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
