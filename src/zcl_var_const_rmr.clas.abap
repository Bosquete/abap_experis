CLASS zcl_var_const_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VAR_CONST_RMR IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*DATA: lv_string type string Value 'Pedro',
*      lv_date type d,
*      lv_int type i value 35,
*      lv_int2 type i,
*      lv_time type t,
*      lv_time2 type c length 6,
*      lv_nota_cient type f  value '1.23E6',
*      lv_dec type p length 8 decimals 2 value '444.34'.  "al llevar decimales se pone entre comillas simples
*
*DATA: lv_nombre type string,
*      lv_edad type i,
*      lv_dni type string,
*      lv_nacimeinto type d.
*
*      lv_date = cl_abap_context_info=>get_system_date(  ).
*      lv_time = cl_abap_context_info=>get_system_time( ).
*      lv_time2 = cl_abap_context_info=>get_user_time_zone( ).
*
*
*
*      out->write( lv_nota_cient ).
*      out->write( | Nombre = {  lv_string  } Edad = { lv_int } Fecha de hoy = {  lv_date }  hora actual = {  lv_time } zona horaria { lv_time2 }| ).

       "******************************************************************************************
      "MATHEMATICS OEPRATIONS

*      DATA: lv_num1 type i value 4,
*            lv_num2 type i value 5,
*            lv_res type i.
*
*            out->write( lv_res ).
*
*            lv_res = lv_res + lv_num1.
*            out->write( lv_res ).
*
*            lv_res = lv_num1 + lv_num2.
*            out->write(  lv_res ).
*
*            "out->write( | La suma de { lv_num1 } + { lv_num2 } es   igual a { lv_res }| ).
*
*            lv_num1 = lv_num1 + lv_num2.
*            out->write( lv_num1 ).
*
*            lv_res = lv_num1 + 2.
*            out->write( lv_res ).
*
*            lv_res = 2 + 3.
*            out->write(  lv_res ).


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"resta

*    lv_res = lv_res + lv_num1.
*            out->write( lv_res ).
*
*            lv_res = lv_num1 - lv_num2.
*            out->write(  lv_res ).
*
*            out->write( | La resta de { lv_num1 } - { lv_num2 } es   igual a { lv_res }| ).
*
*            lv_num1 = lv_num1 - lv_num2.
*            out->write( lv_num1 ).
*
*            lv_res = lv_num1 - 2.
*            out->write( lv_res ).
*
*            lv_res = 2 - 3.
*            out->write(  lv_res ).

   "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   " multiplicación


*    lv_res = lv_res * lv_num1.
*            out->write( lv_res ).
*
*            lv_res = lv_num1 * lv_num2.
*            out->write(  lv_res ).
*
*            out->write( | La multiplicación de { lv_num1 } * { lv_num2 } es   igual a { lv_res }| ).
*
*            lv_num1 = lv_num1 * lv_num2.
*            out->write( lv_num1 ).
*
*            lv_res = lv_num1 * 2.
*            out->write( lv_res ).
*
*            lv_res = 2 * 3.
*            out->write(  lv_res ).

  "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  "división
*
*   lv_res = lv_res / lv_num1.
*            out->write( lv_res ).
*
*            lv_res = lv_num1 / lv_num2.
*            out->write(  lv_res ).
*
*
*
*            out->write( | La división de { lv_num1 } / { lv_num2 } es   igual a { lv_res }| ).
*
*            OUT->WRITE( |  | ).
*
*            lv_num1 = lv_num1 / lv_num2.
*            out->write( lv_num1 ).
*
*            OUT->WRITE( |  | ).
*
*            lv_res = lv_num1 / 2.
*            out->write( lv_res ).
*
*            OUT->WRITE( |  | ).
*
*            lv_res = 2 / 3.
*            out->write(  lv_res ).
*
*            OUT->WRITE( |  | ).
*
*            DATA: lv_num3 type p length 8 decimals 3 value 4,
*            lv_num4 type p length 8 decimals 3 value 5,
*            lv_res2 type p.
*
*            lv_res2 = lv_num3 / lv_num4.
*            out->write(  lv_res2 ).

 "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 "años cumplidos extrae
*
* DATA: lv_nac type d,
*       lv_date2 type d,
*       lv_result type i.
*       lv_date2 = cl_abap_context_info=>get_system_date(  ).
*       lv_nac  = '19700424'.
*       out->write( lv_date2 ).
*       OUT->WRITE( |  | ).
*
*      " lv_dias = conv d( 9697 ).
*
*       lv_result =  lv_date2 - lv_nac.
*       out->write(  lv_result ).
*
*
*        OUT->WRITE( |  | ).
*        Data: lv_date3 type d VALUE '20240623',
*              lv_mes type string.
*
*        lv_mes = lv_date3+4(2). " mes
*        out->write( lv_mes ).
*        OUT->WRITE( |  | ).
*        lv_mes = lv_date3+3.
*        out->write( lv_mes ).
*        OUT->WRITE( |  | ).
*       " out->write( lv_mes ).
*        lv_mes = lv_date3(4). " año
*        out->write( lv_mes ).
*        OUT->WRITE( |  | ).
*
*        lv_mes = lv_date3+6(2). " día
*        out->write( lv_mes ).

           " lv_date = cl_abap_context_info=>get_system_date(  ).

OUT->WRITE( |  | ).
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"CANTIDAD DE CARCATEERES EN UNA VARIABLE

*DATA: lv_cadena type string value 'Hola tengo sueño',
*      lv_contador type i.
*
*      lv_contador = numofchar( lv_cadena ).
*
*      out->write(  lv_contador ).

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"devuelve el nº de carcateres encontrado

*DATA: lv_cadena2 type string value 'DANIEL daniel',
*      lv_contador2 type string.
*
*      lv_contador2 = count(  val = lv_cadena2  sub = 'y' ).
*
*
*
*      out->write(  lv_contador2 ).

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"declaración de variables en línea

DATA(lv_variable_linea) = 8 * 16.
out->write( lv_variable_linea ).

OUT->WRITE( |  | ).

DATA(lv_div) = 8 / 16.
out->write( lv_div ).

OUT->WRITE( |  | ).

DATA(lv_text) = 'ABAP I - 2025'.
out->write( lv_text ).

OUT->WRITE( |  | ).

Data(lv_dec) = '10.245'.
out->write( lv_dec ).

OUT->WRITE( |  | ).

lv_dec = 'Pedro'.

lv_dec = 'Fernando'.







ENDMETHOD.
ENDCLASS.
