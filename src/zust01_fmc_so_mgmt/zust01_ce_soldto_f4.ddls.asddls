@EndUserText.label: 'Custom Entity for Sold-To F4 Help'
@ObjectModel.query.implementedBy: 'ABAP:ZUST01_CL_SOLDTO_F4'
define custom entity ZUST01_CE_SOLDTO_F4
{
  key Customer            : abap.char( 10 );
      CustomerDescription : abap.char( 35 );
}
