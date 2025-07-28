CLASS zcl_ejercsplit_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercsplit_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lv_string TYPE string VALUE 'daniel Fernando Pedro ramon Sergio',
      lt_nombres TYPE TABLE OF string,
      ls_nombre TYPE string,
      lv_nombre1 TYPE string,
      lv_nombre2 TYPE string,
      lv_nombre3 TYPE string,
      lv_nombre4 TYPE string,
      lv_nombre5 TYPE string.

" Dividir la cadena en una tabla de nombres
SPLIT lv_string AT ' ' INTO TABLE lt_nombres.

*" Recorrer la tabla de nombres y asignar cada nombre a una variable individual
*LOOP AT lt_nombres INTO ls_nombre.
*  IF sy-index = 1.
*    lv_nombre1 = ls_nombre.
*  ELSEIF sy-index = 2.
*    lv_nombre2 = ls_nombre.
*  ELSEIF sy-index = 3.
*    lv_nombre3 = ls_nombre.
*  ELSEIF sy-index = 4.
*    lv_nombre4 = ls_nombre.
*  ELSEIF sy-index = 5.
*    lv_nombre5 = ls_nombre.
*  ENDIF.
*ENDLOOP.

IF lines( lt_nombres ) >= 1.
  lv_nombre1 = lt_nombres[ 1 ].
ENDIF.
IF lines( lt_nombres ) >= 2.
  lv_nombre2 = lt_nombres[ 2 ].
ENDIF.
IF lines( lt_nombres ) >= 3.
  lv_nombre3 = lt_nombres[ 3 ].
ENDIF.
IF lines( lt_nombres ) >= 4.
  lv_nombre4 = lt_nombres[ 4 ].
ENDIF.
IF lines( lt_nombres ) >= 5.
  lv_nombre5 = lt_nombres[ 5 ].
ENDIF.

out->write( lv_nombre1 ).
out->write(  lv_nombre2 ).
out->write(  lv_nombre3 ).
out->write(  lv_nombre4 ).
out->write(  lv_nombre5 ).

  ENDMETHOD.
ENDCLASS.
