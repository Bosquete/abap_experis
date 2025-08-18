CLASS zcl_calculo_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CALCULO_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA: lv_price TYPE DECFLOAT16 VALUE '99.99',
        lv_tax TYPE DECFLOAT16 Value '0.21',
        lv_precioF TYPE DECFLOAT16.

        out->write(  | | ).

        lv_precioF = lv_price * lv_tax.

        out->write( lv_price ).
        out->write(  lv_tax ).
        out->write(  lv_precioF ).

        out->write( | El precio total con iva es de { lv_precioF } y el precio base es de  { lv_price } y tiene un iva de { lv_tax }.| ).



  ENDMETHOD.
ENDCLASS.
