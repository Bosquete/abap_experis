CLASS zcl_conversion_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONVERSION_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA: lv_variable type string value '25',
        lv_integer type i,
        lv_suma type i.
        out->write( | | ).


        out->write( lv_variable ).

        out->write( | | ).

        lv_integer = lv_variable.
        out->write( lv_integer ).

        out->write( | | ).

        lv_suma = lv_integer + 5.
        out->write( lv_suma ).

        out->write( | | ).

        lv_variable = lv_suma.
        out->write( lv_variable ).



  ENDMETHOD.
ENDCLASS.
