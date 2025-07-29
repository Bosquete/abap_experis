CLASS zcl_calculadoracase2_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadoracase2_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lv_var) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
  min = 1
  max = 9 )->get_next( ).
  DATA(lv_var1) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
  min = 1
  max = 9 )->get_next( ).
  Data(lv_opera) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
  min = 1
  max = 4 )->get_next( ).
  Data lv_resultado type p DECIMALS 2.

  CASE lv_opera.

  WHEN 1.
        lv_resultado = lv_var + lv_var1 .
        out->write(  | Ek resultado de sumar {  lv_var } + { lv_var1 } es igual a = {  lv_resultado } | ).

  WHEN 2.
        lv_resultado = lv_var - lv_var1 .
        out->write(  | Ek resultado de restar {  lv_var } - { lv_var1 } es igual a = { lv_resultado } | ).

  WHEN 3.
        lv_resultado = lv_var / lv_var1 .
        out->write(  | Ek resultado de dividir {  lv_var } / { lv_var1 } es igual a = { lv_resultado } | ).

  WHEN 4.
        lv_resultado = lv_var * lv_var1 .
        out->write(  | Ek resultado de multiplicar {  lv_var } * { lv_var1 } es igual a = { lv_resultado } | ).


   endcase.




  ENDMETHOD.
ENDCLASS.
