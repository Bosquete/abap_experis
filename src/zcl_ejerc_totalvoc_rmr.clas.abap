CLASS zcl_ejerc_totalvoc_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJERC_TOTALVOC_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
      lv_string      TYPE string VALUE 'El perro corre por el prado.',
      lv_count TYPE i VALUE 0,
      lv_char        TYPE c LENGTH 1,
      lv_index       TYPE i.

    DO strlen( lv_string ) TIMES.
      "gv_char = gv_string+gv_index(1).
      lv_index = sy-index - 1.
      lv_char = lv_string+lv_index(1).

      CASE lv_char.
        WHEN 'a' OR 'A' OR
             'e' OR 'E' OR
             'i' OR 'I' OR
             'o' OR 'O' OR
             'u' OR 'U'.
          lv_count += 1.
      ENDCASE.
    ENDDO.



    out->write( | Número total de vocales:  { lv_count } | ).

  ENDMETHOD.
ENDCLASS.
