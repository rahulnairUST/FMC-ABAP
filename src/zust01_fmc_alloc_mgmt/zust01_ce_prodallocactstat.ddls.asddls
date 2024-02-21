@EndUserText.label: 'Custom Entity for Product Allocation Activation Status'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_PRODALLOCACTSTAT_01'

define root custom entity ZUST01_CE_PRODALLOCACTSTAT
{
  key CharcValueCombinationUUID : abap.char( 40 );
      NewActivationStatus       : abap.char( 1 );
      ProdAllocCharc01 : abap.char( 40 ) ;
      ProdAllocCharc02 : abap.char( 40 ) ;
      ProdAllocCharc03 : abap.char( 40 ) ;
      ProdAllocCharc04 : abap.char( 40 ) ;
      ProdAllocCharc05 : abap.char( 40 ) ;
      ProdAllocCharc06 : abap.char( 40 ) ;  
      ProdAllocCharc07 : abap.char( 40 ) ; 
      ProdAllocCharc08 : abap.char( 40 ) ; 
      ProdAllocCharc09 : abap.char( 40 ) ;  
      ProdAllocationActivationStatus : abap.char( 2 ) ; 
      ProductAllocationObjectUUID : sysuuid_x16 ;
      ProductAllocationObject : abap.char( 40 ) ; 
      PlanningScreen: zust01_fmc_amc_planning_screen;
      ProdAllocCharcConstraintStatus : abap.char( 2 ) ; 
      ProdAllocPerdStartUTCDateTime : abap.char(8);
      ProdAllocPerdStartEndDateTime : abap.char(8);
      Response                  : zust01_fmc_amc_planning_screen;
      prodalloccvc01            : zust01_fmc_amc_column_descr;
      prodalloccvc02            : zust01_fmc_amc_column_descr;
      prodalloccvc03            : zust01_fmc_amc_column_descr;
      prodalloccvc04            : zust01_fmc_amc_column_descr;
      prodalloccvc05            : zust01_fmc_amc_column_descr;
      prodalloccvc06            : zust01_fmc_amc_column_descr;
      prodalloccvc07            : zust01_fmc_amc_column_descr;

}
