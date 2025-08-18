CLASS zcl_opcion_date_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_OPCION_DATE_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
DATA: lv_string type string Value 'Pedro',
      lv_date type d,
      lv_int type i value 35,
      lv_int2 type i,
      lv_time type t,
      lv_time2 type c length 6,
      "lv_nota_cient type f  value '1.23E6',
      lv_dec type p length 8 decimals 2 value '444.34'.  "al llevar decimales se pone entre comillas simples

DATA: lv_nombre type string,
      lv_edad type i,
      lv_dni type string,
      lv_nacimeinto type d.

      lv_date = cl_abap_context_info=>get_system_date(  ).
      lv_time = cl_abap_context_info=>get_system_time( ).
      lv_time2 = cl_abap_context_info=>get_user_time_zone( ).

OUT->WRITE( | FECHA DE HOY? {  lv_date DATE = ISO }| ) .
OUT->WRITE(  | | ).

     " out->write( lv_nota_cient ).
      out->write( | Nombre = {  lv_string  } Edad = { lv_int } Fecha de hoy = {  lv_date }  hora actual = {  lv_time } zona horaria { lv_time2 }| ).

out->write(  | | ).

      DATA: part1 TYPE STRING VALUE 'HELLO',
            part2 TYPE STRING VALUE 'WORLD',
            resultado TYPE string.

           resultado = part1  && part2.
           out->write( resultado ).

           out->write(  | | ).

           resultado = part1 && | | && part2.
           out->write(  resultado ).


  ENDMETHOD.
ENDCLASS.
