CLASS zcl_constructores_punteros_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.



    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONSTRUCTORES_PUNTEROS_RMR IMPLEMENTATION.


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


**********************************************************************
    "        CONV

    "DATA lv_var1 TYPE string VALUE '111'. con 'aaa' no se podría convertir a numérico

*        DATA(lv_number) = 2025.
*        DATA(lv_text)   = CONV string( lv_number ).
*
*        out->write( |Número original (entero 2025): { lv_number } | ).
*        out->write( |Número convertido a texto: { lv_text } | ).
*
*        DATA(lv_str_number) = '150'.
*        DATA(lv_int_number) = CONV i( lv_str_number ).
*
*        out->write( |Cadena original : { lv_str_number } | ).
*        out->write( |Número convertido a entero: { lv_int_number } | ).

**********************************************************************

    "     EXACT - Es igual que el conv pero con mas poder, si hay pérdida de datos en el proceso de conversión lanza un error en tiempo de ejecución.


*        DATA lv_num TYPE p length 5 decimals 2 VALUE '123.45'.
*
*        "conversión con OCNV (funciona incluso si hubiera redondeo)
*        DATA(lv_conv) = conv i( lv_num ). " resultado 123
*        out->write( |conv a entero: { lv_conv } | ).
*
*        "conversión con EXACT (falla si hay pérdida de datos)
*        TRY.
*
*            DATA(lv_exact) = EXACT i( lv_num ).
*
*           out->write( |Exact a entero: {  lv_exact } | ).
*
*        CATCH cx_sy_conversion_error into data(lx_error).
*            out->write( |Error Exact: {  lx_error->get_text( ) } | ).
*
*        ENDTRY.

**********************************************************************

    "        REF  -- crea una referencia de datos (un puntero)  a un valor o estrucutura existente, sin copiar el contenido.
    " es útil cuando queremos papasar gran cantidad de datos sin copiarlos, modificar el valor original desde otro lugar.
    "trabajar con objetos dinámicos.


*        DATA: lv_int_value TYPE i VALUE 100,
*              lv_ref_int TYPE REF TO i. " declara una referencia a un entero.
*
*              lv_ref_int = REF #( lv_int_value ). "crea una referencia al dato lv_int_value no copia el valor, solo apunta a la misma dirección.
*
*         out->write(  data = lv_int_value name = 'Original value' ).
*
*         out->write( data = lv_ref_int->* name = 'Value desde la referecnia' ).
*
    "accedde al valor apuntando por la referencia lv_ref_intusando ->* esto muestra el mismo valor (100), pero leído a través de la referencia.

    " segundo ejemplo
*
*  DATA lt_flight TYPE TABLE OF /dmo/flight.
*
*  lt_flight =  VALUE #(  (  client = 100
*                            carrier_id = 'CO'
*                            connection_id = 1101
*                            currency_code = 'COP'
*                            flight_date = sy-datum
*                            plane_type_id = 'AF-1234'
*                            price         = 200
*                            seats_max      = 100
*                            seats_occupied   = 20 )
*
*                           ( client = 100
*                            carrier_id = 'XX'
*                            connection_id = 1103
*                            currency_code = 'COP'
*                            flight_date = sy-datum
*                            plane_type_id = 'XX-1234'
*                            price         = 400
*                            seats_max      = 60
*                            seats_occupied   = 50 )
*
*                           ( client = 100
*                            carrier_id = 'PE'
*                            connection_id = 1103
*                            currency_code = 'EUR'
*                            flight_date = sy-datum
*                            plane_type_id = 'PE-1234'
*                            price         = 150
*                            seats_max      = 80
*                            seats_occupied   = 30 )
*                             ).
*
*        DATA(lr_flight) = REF #( lt_flight[ 2 ] ).
*        out->write( data = lr_flight->* name = 'Referencia index 2' ).

**********************************************************************
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "         CAST - se usa para convertir referencias de un tipo a otro. (no convierte valores como el conv o exact)
    "                convierte referencias de objetos o datos de un tipo de referenci a otro tipo de referencia compatible.
*
*    TYPES: BEGIN OF ty_struc,
*             col1 TYPE i,
*             col2 TYPE i,
*           END OF ty_struc.
*
*    "declaramos una referencia genérica a datos
*    DATA lr_data TYPE REF TO data.
*
*    " declaramos una variable de tipo ty_struc (estrcutura tipada)
*    DATA ls_int TYPE ty_struc.
*
*    "creamos en memoria un objeto del tipo ty_struc, guardamos su referencia en lr_data
*    " NEW devuelve uan referencia, no una copia
*    lr_data = NEW ty_struc( ).
*
*      " usamo el CAST para convertir la referencia genérica lr_data en una referencia del tipo ty_struc, y ->* para desreferenciar
*      " y copiar el contenido completo en ls_int
*
*      ls_int = CAST ty_struc( lr_data )->*.
*
*      " accedemos directmanete al campo col1 usando el CAST. Esto no copia toda la estructura, solo lee col1.
*
*      ls_int-col1 = CAST ty_struc( lr_data )->col1.
*
*      ls_int-col2 = CAST ty_struc( lr_data )->col2.
*
*      out->write( data = ls_int name = 'ls_int' ).
*
*      out->write( data = ls_int-col1 name = 'ls_int-col1' ).
*      out->write( data = ls_int-col2 name = 'ls_int-col2' ).

**********************************************************************
"      FILTER - es una expresión de ABAP que crea una nueva tabla interna filtrando los registros de otra tabla según unas condiciones.
"Las condiciones pueden basarse en valores individuales o en uan tabla de RANGOS
"la tabla interna en la que se utiliza el operador filter debe tener al menos una clave ordenada o una clave hash utilizada para le acceso.

        "declaración de tablas

        DATA: lt_flights_all TYPE TABLE OF /dmo/flight,
              lt_flights_final TYPE TABLE of /dmo/flight,
              lt_filter        TYPE SORTED TABLE OF  /dmo/flight-carrier_id "tabla de filtro (solo una columna)
                                WITH UNIQUE KEY table_line. "clave única sobre table_line (el propio valor)

        SELECT FROM /dmo/flight
                FIELDS *
                "INTO TABLE @data(lt_flights_all).
                INTO TABLE @lt_flights_all.

                "construir la lista blanca de aerolíneas permitidas (IDs de comoañía)
                "value #(...) crear la tabla 'lt_filter' con los valores indicados en filas de una sola columna (table_line)
                lt_filter = value #( ( 'LH ' ) ( 'AA ' ) ( 'UA ' ) ).

                "filtrando en memori:
                "- FIlter #(...) toma lt_flights_all como base
                "-IN lt_filter indica que usaremos la tabla de filtro como referencia
                "- Where carrier_id = table_line mantiene solo las filas cuyo carrier_id esta en lt_filter.
                lt_flights_final = FILTER #( lt_flights_all IN lt_filter WHERE carrier_id = table_line ).

                out->write(  name = 'lt_flights_all'  data = lt_flights_all ).
                out->write(  name = 'lt_flights_final' data = lt_flights_final ).


  ENDMETHOD.
ENDCLASS.
