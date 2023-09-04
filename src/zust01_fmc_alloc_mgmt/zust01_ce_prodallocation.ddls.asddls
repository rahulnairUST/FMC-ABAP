@EndUserText.label: 'Custom Entity for Product Allocation CVC Demo'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_PRODALLOCATION'
define custom entity ZUST01_CE_PRODALLOCATION
{
key CharcValueCombinationUUID : sysuuid_x16 ;  
 ProductAllocationObjectUUID : sysuuid_x16 ;
 ProductAllocationObject : abap.char( 40 ) ; 
 PlanningScreen: zust01_fmc_amc_planning_screen;
 line_name : abap.char( 40 ) ;        
 ProdAllocCharc10 : abap.char( 40 ) ; 
 ProdAllocCharc01 : abap.char( 40 ) ;
 ProdAllocCharc02 : abap.char( 40 ) ;
 ProdAllocCharc03 : abap.char( 40 ) ;
 ProdAllocCharc04 : abap.char( 40 ) ;
 ProdAllocCharc05 : abap.char( 40 ) ;
 ProdAllocCharc06 : abap.char( 40 ) ;  
 ProdAllocCharc07 : abap.char( 40 ) ; 
 ProdAllocCharc08 : abap.char( 40 ) ; 
 ProdAllocCharc09 : abap.char( 40 ) ;  
 KeyFigure : abap.char( 40 ) ; 
 KeyFigureID : abap.int8 ; 
 ProdAllocCharcValueCombnCmnt : abap.char( 80 ) ; 
 ProdAllocCharcConstraintStatus : abap.char( 2 ) ; 
 ProdAllocationActivationStatus : abap.char( 2 ) ; 
 CharcValAuthznGroup : abap.char( 40 ) ; 
 ProductAllocationQty1 : abap.dec( 15, 0 ) ;  
 ProductAllocationQty2 : abap.dec( 15, 0 ) ;
 ProductAllocationQty3 : abap.dec( 15, 0 ) ;
 ProductAllocationQty4 : abap.dec( 15, 0 ) ;
 ProductAllocationQty5 : abap.dec( 15, 0 ) ;
 ProductAllocationQty6 : abap.dec( 15, 0 ) ;
 ProductAllocationQty7 : abap.dec( 15, 0 ) ;
 ProductAllocationQty8 : abap.dec( 15, 0 ) ;
 ProductAllocationQty9 : abap.dec( 15, 0 ) ;
 ProductAllocationQty10 : abap.dec( 15, 0 ) ;
 ProductAllocationQty11 : abap.dec( 15, 0 ) ;
 ProductAllocationQty12 : abap.dec( 15, 0 ) ;
 ProdAllocDate1 : abap.char( 10 ) ;
 ProdAllocDate2 : abap.char( 10 ) ;
 ProdAllocDate3 : abap.char( 10 ) ;
 ProdAllocDate4 : abap.char( 10 ) ;
 ProdAllocDate5 : abap.char( 10 ) ;
 ProdAllocDate6 : abap.char( 10 ) ;
 ProdAllocDate7 : abap.char( 10 ) ;
 ProdAllocDate8 : abap.char( 10 ) ;
 ProdAllocDate9 : abap.char( 10 ) ;
 ProdAllocDate10 : abap.char( 10 ) ;
 ProdAllocDate11 : abap.char( 10 ) ;
 ProdAllocDate12 : abap.char( 10 ) ;
 ProdAllocCVC01 : zust01_fmc_amc_column_descr ;
 ProdAllocCVC02 : zust01_fmc_amc_column_descr ;
 ProdAllocCVC03 : zust01_fmc_amc_column_descr ;
 ProdAllocCVC04 : zust01_fmc_amc_column_descr ;
 ProdAllocCVC05 : zust01_fmc_amc_column_descr ;
 ProdAllocCVC06 : zust01_fmc_amc_column_descr ;
 ProdAllocCVC07 : zust01_fmc_amc_column_descr ;
 ProdAllocPerdStartUTCDateTime : abap.char(8);
}
