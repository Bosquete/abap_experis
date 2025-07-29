CLASS zcl_calculadoracase_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadoracase_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Cargamos variables random dos variables para cómputo y otra para 4 operaciones
    DATA(lv_var) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
    min = 1
    max = 9 )->get_next( ).

    Data(lv_var1) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed( )
    min = 1
    max = 9 )->get_next( ).

    DATA(lv_opera) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  )
    min = 1
    max = 4 )->get_next(  ).


    data: lv_suma type string value '+',
          lv_resta type string value '-',
          lv_dividir type string value '/',
          lv_multi type string value '*',
          lv_resultado type p DECIMALS 2.

     if lv_opera = 1.

            out->write( lv_var + lv_var1 ).

     elseif lv_opera = 2.

           out->write( lv_var - lv_var1 ).
     elseif lv_opera = 3.

           out->write( lv_var / lv_var1 ).
      else.

           out->write( lv_var * lv_var1 ).
      endif.

       CASE lv_opera.


       WHEN 1.

            lv_resultado = lv_var + lv_var1 .
            out->write( |El resultado de { lv_var } + {  lv_var1 } es: { lv_resultado  } | ).

       WHEN 2.

            lv_resultado = lv_var - lv_var1 .
            out->write( |El resultado de { lv_var } { lv_opera } {  lv_var1 } es: { lv_resultado  } | ).

       WHEN 3.

            lv_resultado = lv_var / lv_var1 .
            out->write( |El resultado de { lv_var } / {  lv_var1 } es: { lv_resultado  } | ).


       WHEN OTHERS.

            lv_resultado = lv_var * lv_var1 .
            out->write( |El resultado de { lv_var } * {  lv_var1 } es: { lv_resultado  } | ).


    ENDCASE.



  ENDMETHOD.
ENDCLASS.
