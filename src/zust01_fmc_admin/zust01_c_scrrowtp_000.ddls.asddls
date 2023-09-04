@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZUST01_R_SCRROWTP_000'
@ObjectModel.semanticKey: [ 'PlanningScreen', 'LineName' ]
define root view entity ZUST01_C_SCRROWTP_000
  provider contract transactional_query
  as projection on ZUST01_R_SCRROWTP_000
{
  key PlanningScreen,
  key LineName,
  Description,
  Sorting,  
  CvcGroupIdx,
  Editable,
  Draft,
  AllowKeyfgSelection,
  TimeseriesTable,
  ReadSelectionID,
  SaveSelectionID,
  LineNameSave,
  LineNameBackup,
  SaveConsCheck,
  DeltaUpdate,
  CalculationID,
  CalculationSequence,
  CvcFormat1stOccurrance,
  CvcDisplay,
  CvcColor,
  CvcColorCode,
  KeyfigureColorCode,
  BucketColorCode,
  CvcStatusDisplay,
  CvcStatusColorCode,
  AddRemoveOrders,
  NotesTextID,
  LocalLastChagnedAt
  
}
