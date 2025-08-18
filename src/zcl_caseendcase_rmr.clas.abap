CLASS zcl_caseendcase_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CASEENDCASE_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lv_cliente) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  )
    min = 1
    max = 3 )->get_next(  ).

    out->write( lv_cliente ).





  ENDMETHOD.
ENDCLASS.
