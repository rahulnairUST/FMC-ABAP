@EndUserText.label: 'Custom Entity for Ship-To F4 Help'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SHIPTO_F4'
define custom entity ZUST01_CE_SHIPTO_F4
{
  key Customer            : abap.char( 10 );
      CustomerDescription : abap.char( 35 );
}
