CLASS zcl_variables_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_variables_rmr IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA lv_alumno type String. "value 'Pedro'.

lv_alumno = 'Pepe'.

out->write(  lv_alumno ).

lv_alumno = 'Sara'.

out->write(  lv_alumno ).


DATA LV_RESULTADO TYPE I.

DATA LV_EDAD TYPE I.

DATA LV_RESULTADO1 TYPE I.
LV_EDAD = 3.



LV_RESULTADO = 5 + 5.
LV_RESULTADO1 = LV_EDAD + LV_RESULTADO.

OUT->WRITE(  LV_RESULTADO ).

OUT->WRITE(  LV_RESULTADO1 ).
OUT->WRITE( LV_RESULTADO  && LV_EDAD ).

" TIPOS DE VARIABLES
DATA: LV_STRING TYPE STRING VALUE 'Pedro',
      LV_DATE TYPE D,
      LV_INT TYPE I VALUE 35,
      LV_INT2 TYPE I,
      LV_DEC TYPE P LENGTH 8 DECIMALS 2.
      LV_INT2 = 232344.
  OUT->write(  LV_STRING ).
  OUT->WRITE(  'HOLA' ).

OUT->write( | VARIABLE 1 = { LV_STRING } VARIABLE 2 = { LV_INT }| ).
out->write( | Nombre = {  lv_string  } Edad = { lv_int }| ).
out->write( | Mi nombre es { lv_string } y tengo { lv_int } años.| ).

out->write(  TEXT-002 ).

ENDMETHOD.

ENDCLASS.
