CLASS zcl_trycatch_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TRYCATCH_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "TRY.

  DATA: lv_num1 TYPE i VALUE 10,
        lv_num2 TYPE i VALUE 0,
        lv_res TYPE f.


        lv_res = lv_num1 / lv_num2.

        out->write( lv_res ).

  "catch CX_SY_ZERODIVIDE INTO DATA(lv_zero_divide).

  "out->write( 'Error: no se puede realizar esta operación' ).

  "ENDTRY.



  ENDMETHOD.
ENDCLASS.
