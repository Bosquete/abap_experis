CLASS zcl_switch_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SWITCH_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DO 3 times.
*
*  DATA(lv_value) = SWITCH #( sy-index WHEN 1 THEN |iteracion 1|
*                                      WHEN 2 THEN |iteracion 2|
*                                      WHEN 3 THEN |iteracion 3| ).
*
*  out->write( lv_value ).
*
*  ENDDO.


**********************************************************************
" while"
*
*        DATA lv_num TYPE i VALUE 1.
*
*        WHILE lv_num < 10.
*
*                out->write(  lv_num ).
*                out->write( |iteracion = { sy-index  } | ).
*                lv_num += 1.
*
*                IF lv_num > 3.
*
*                EXIT.
*           ENDIF.
*
*           ENDWHILE.



**********************************************************************

DATA name TYPE c LENGTH 10.
DATA text TYPE string.

CONCATENATE `Hello`
            name
            INTO text.

            out->write(  text ).

text = `Hello`.
text = name.
text = replace(  val = `Hello World`
                sub = `World`
                WITH = name ).

    text = COND #( WHEN text = `` THEN `Hello` && name
                    ELSE text ).

        out->write(  text ).


  ENDMETHOD.
ENDCLASS.
