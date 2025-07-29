CLASS zcl_do_endo_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_endo_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DATA(LV_NUM) = 0.
*  DATA lv_cont type i value 2.

    "Do 3 times.
*  DO .
*
**        out->write(  lv_num  ).
**       "out->write( 'Hola' ).
**
**       lv_num = lv_num + 1.
*
*        "lv_num = lv_num + 1.
*        "lv_num += 1.
*
*        out->write(  lv_num  ).
*        lv_num += 1.
*        if lv_num GT 8.
*
*        exit.
*
*        endif.


    " do 20 times.

    "data(lv_div) = sy-index MOD 2.  " sy-index variable del propio sap que te dice el recorrido del  do. mod calcula el resto de una división

    DO 4 TIMES.

      DATA(lv_div) = sy-index MOD 2.
      "out->write( lv_div ).
      "out->write(  'hola' ).
      "CHECK lv_div = 0.
      " out->write(  sy-index ).
      out->write(  'hola check' ).


    ENDDO.


  ENDMETHOD.
ENDCLASS.
