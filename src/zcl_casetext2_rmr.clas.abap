CLASS zcl_casetext2_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CASETEXT2_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA(lv_aleatorio) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
  min = 1
  max = 4 )->get_next( ).


   DATA: lv_string TYPE string VALUE 'daniel Pedro Diego Sara',
      lt_nombres TYPE TABLE OF string,
      ls_nombre TYPE string,
      lv_nombre1 TYPE string,
      lv_nombre2 TYPE string,
      lv_nombre3 TYPE string,
      lv_nombre4 TYPE string.

*
*" Dividir la cadena en una tabla de nombres
SPLIT lv_string AT ' ' INTO TABLE lt_nombres.


*
*
*DO 4 times.
*
*      "DATA(lv_div) = sy-index MOD 2.
*      "out->write( lv_div ).
*      "out->write(  'hola' ).
*      "CHECK lv_div = 0.
*      " out->write(  sy-index ).
*     DATA BEGIN OF lt_nombres  INTO ls_nombre.
*      out->write(  'hola check' ).
*
*
*    ENDDO.


    DATA: lv_nombre TYPE string,
      lv_contador TYPE i VALUE 1.

"DO 4 TIMES. " Repetir 5 veces

LOOP AT lt_nombres INTO ls_nombre.

  CLEAR lv_nombre.
  lv_nombre = 'Nombre ' && lv_contador. " Asignar un nombre único

  out->WRITE( | Nombre guardado: { lv_nombre } | ). " Mostrar el nombre guardado
  lv_contador = lv_contador + 1.
endloop.
"ENDDO.


lv_aleatorio = sy-index.

*  CASE lv_aleatorio.
*
*
*    WHEN 1.
*
*        OUT->WRITE( lv_nombres ).
*            out->write( 'El número aleatorio que ha salido es ' && | | && lv_aleatorio ).
*
*       WHEN 2.
*
*             OUT->WRITE( lv_nombres ).
*            out->write( | El número aleatorio que ha salido es { lv_aleatorio } | ).
*
*       WHEN 3.
*
*             OUT->WRITE( lv_nombres ).
*            out->write( 'El número aleatorio que ha salido es ' && | | && lv_aleatorio ).
*
*
*       WHEN OTHERS.
*
*            OUT->WRITE( lv_nombres ).
*            out->write( 'El número aleatorio que ha salido es ' && | | && lv_aleatorio ).
*
*
*    ENDCASE.
*



  ENDMETHOD.
ENDCLASS.
