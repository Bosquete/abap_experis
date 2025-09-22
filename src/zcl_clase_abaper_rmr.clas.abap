CLASS zcl_clase_abaper_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE_ABAPER_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( 'Hola Mundo en Abap cloud' ).
  out->write( 'Hola Mundo aprendiendo y cogiendo ritmo' ).



  ENDMETHOD.
ENDCLASS.
