CLASS zcl_constructores_punteros_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_name TYPE string,
          lv_age TYPE i.

    METHODS: CONSTRUCTOR IMPORTING iv_name TYPE string
                                    iv_age TYPE i.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_constructores_punteros_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  "VALUE
  "CORRESPONDING
        "MAPPING

*        TYPES: BEGIN OF ty_employee,
*               emp_name TYPE string,
*               emp_age TYPE i,
*               END OF ty_employee.
*
*        TYPES: BEGIN OF ty_person,
*               name TYPE string,
*               age TYPE i,
*               END OF ty_person.
*
*         DATA: lt_employee TYPE TABLE OF ty_employee,
*               lt_person TYPE TABLE OF ty_person,
*               lt_client TYPE TABLE OF ty_person.
*
*               lt_employee = VALUE #( (
*                                        emp_name = 'Peter'
*                                        emp_age  =  30
*                                        ) ).
*
*
*    out->write( data = lt_employee name = 'lt_employee' ).
*
*
*    lt_person = CORRESPONDING #( lt_employee MAPPING name = emp_name
*                                                     age  = emp_age   ).

*    out->write( |\n| ).
*
*    out->write( data = lt_person name = 'lt_person' ).

    " CORRESPONDING CON BASE

*    lt_client = VALUE #( ( name = 'María'
*                           age  =  50
*                                        )  ).
*
*    lt_client = CORRESPONDING #( BASE ( lt_client ) lt_person ).
*
*    out->write( |\n| ).
*    out->write( data = lt_client name = 'lt_client' ).

    "  EXCEPT

*    lt_person = CORRESPONDING #( lt_client EXCEPT age ).
*
*    out->write( |\n| ).
*    out->write( data = lt_person name = 'lt_person' ).

"DISCARTING DUPLICATES

*DATA: lt_itab1 TYPE TABLE OF ty_person WITH EMPTY KEY,
*      lt_itab2 TYPE SORTED TABLE OF ty_person WITH UNIQUE KEY name.
*
*      lt_itab1 = VALUE #( ( name = 'María' age = 22 )
*                          ( name = 'María' age = 25 )
*                          ( name = 'María' age = 22 )
*                          ( name = 'Pedro' age = 24 )
*                          ).

*      lt_itab2 = CORRESPONDING #( lt_itab1 DISCARDING DUPLICATES ).
*
*      out->write( |\n| ).
*    out->write( data = lt_ITAB2 name = 'lt_ITAB2' ).
*

    "  NEW - SE UTILIZA PARA CREAR INSTANCIASDE CLASE Y ESTRUCTURA


*        DATA lo_data TYPE REF TO i.
*
*        " creamos un nuevo objeto de tipo entero (inferido por #) con valor inicial 12345
*
*        lo_data = NEW #( 12345 ).
*
*        "mostramos le valor de la referencia lo_data.
*        out->write( lo_data ).
*
*        " declaramos y creamos una referencia a un objeto string con el valor de 'Experis'
*
*        DATA(lo_data2) = NEW string( 'Experis' ).
*
*        out->write( lo_data2 ).





  ENDMETHOD.
  METHOD constructor.

    lv_age = iv_age.
    lv_name = iv_name.


  ENDMETHOD.

ENDCLASS.
