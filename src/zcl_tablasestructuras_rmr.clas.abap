CLASS zcl_tablasestructuras_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLASESTRUCTURAS_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* ESTRUCTURA
**********************************************************************

    "Para declarar un tipo personalizado se empieza con TYPES

    TYPES: BEGIN OF ty_persona,
             nombre TYPE char40,
             edad   TYPE numc3,
             email  TYPE /dmo/email_address,

           END OF ty_persona.

    TYPES: BEGIN OF ty_persona2, " se reutiliza sin tener que declarar.
             nombre TYPE ty_persona-nombre,
             edad   TYPE numc3,
             email  TYPE /dmo/email_address,

           END OF ty_persona2.

* FORMA 1 DECLARACIÓN DE ESTRUCTURA.  ls local esrtucture
**********************************************************************

    DATA ls_persona TYPE ty_persona.  "estructura

    "cómo se rellennan las estrcutures, de forma manual es una

    ls_persona-nombre = 'Pedro'.
    ls_persona-edad   =      20.
    ls_persona-email  = 'daniel.elviraruiz@experis.es'.

    out->write( ls_persona ).


    out->write( | | ).
    out->write( |\n| ).
**********************************************************************
    " forma 2 declaración de estructura.
**********************************************************************

    DATA(ls_persona2) = VALUE ty_persona( nombre ='Alberto' edad = 30 email = 'albert.ruiz@gmail.es' ).

    out->write( ls_persona2 ).

    out->write( |\n| ).
**********************************************************************
    " forma 3 declaración de estructura y tipo de golpe. no es reutilizable?
**********************************************************************

    DATA: BEGIN OF ls_empleado,
            nombre TYPE string VALUE 'Laura',
            id     TYPE i,
            email  TYPE /dmo/email_address VALUE 'albert.ruiz@gmail.es',
          END OF ls_empleado.

    ls_empleado-id = 007.

    out->write( ls_empleado ).
    out->write( |\n| ).
**********************************************************************
    "    TIPOS DE ESTRUCUTURAS"
**********************************************************************

    " ESTRUCTURA SIMPLE
    DATA: BEGIN OF ls_empleado2,
            nombre TYPE string VALUE 'Laura',
            id     TYPE i,
            email  TYPE /dmo/email_address VALUE 'albert.ruiz@gmail.es',
          END OF ls_empleado2.

    ls_empleado-id = 007.

    out->write( ls_empleado ).

    out->write( |\n| ).

    " ESTRUCTURA ANIDADA

    DATA:BEGIN OF ls_empl_info,

           BEGIN OF info,
             id       TYPE i VALUE 1234,
             nombre   TYPE string VALUE 'Pedro',
             apellido TYPE string VALUE 'Elvira',
           END OF info,

           BEGIN OF direccion,
             ciudad TYPE string VALUE 'Madrid',
             calle  TYPE string VALUE 'c. morfeo',
             pais   TYPE string VALUE 'España',
           END OF direccion,

           BEGIN OF puesto,
             departamento TYPE string VALUE 'IT',
             sueldo       TYPE p DECIMALS 2 VALUE '2000',
           END OF puesto,

         END OF ls_empl_info.


    out->write( ls_empl_info ).
    out->write( |\n| ).
    out->write( ls_empl_info-direccion-calle  ).
    out->write( data = ls_empl_info name = 'información de empleado' ).

    out->write( |\n| ).

**********************************************************************"
    "  ESTRUCTURA PROFUNDA

    " HACEN REFERENCIA A LAS ESTRUCTURAS QU ETIENEN UNO DE SUS TIPOS QUE TEIENEN REFERENCIA A LA TABLA DE DICCIONARIO.
    " el nombre puede llevar un l como qu ees de local ejemplo lty_flights
    TYPES:BEGIN OF ty_flights,
            flight_date  TYPE /dmo/flight-flight_date,
            price        TYPE /dmo/flight-price,
            current_code TYPE /dmo/flight-currency_code,
          END OF ty_flights.


    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
            lt_flights TYPE TABLE OF ty_flights WITH EMPTY KEY, " hace referencia tanto al tipo creado en el types  "ty_flights como a la tabla de base de datos
          END OF ls_flight_info.


    SELECT *
    FROM /dmo/flight
    WHERE carrier_id = 'AA'
    INTO CORRESPONDING FIELDS OF TABLE @ls_flight_info-lt_flights.

    out->write(  data = ls_flight_info name = 'ls_flight_info' ).

    out->write( |\n| ).

**********************************************************************
    " AÑADIR DATOS A LAS ESTRUCTURAS

    TYPES:BEGIN OF ty_flights2,
            flight_date  TYPE /dmo/flight-flight_date,
            price        TYPE /dmo/flight-price,
            current_code TYPE /dmo/flight-currency_code,
          END OF ty_flights2.


    DATA: BEGIN OF ls_flight_info2,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
            ls_flights2 TYPE ty_flights2, " ahora no es tabla es estructura
          END OF ls_flight_info2.

          ls_flight_info2-carrier = 'XX'.
          ls_flight_info2-connid = '0022'.
          ls_flight_info2-ls_flights2-flight_date = cl_abap_context_info=>get_system_date(  ).
          ls_flight_info2-ls_flights2-current_code = 'USD'.
          ls_flight_info2-ls_flights2-price = '200'.

          out->write( DATA = ls_flight_info2 NAME = 'ls_flight_info2' ).

           out->write( |\n| ).


**********************************************************************
"


        ls_empl_info = VALUE #(
                                info = VALUE #( id = 1234 nombre = 'Juan' apellido = 'Martinez' )
                               direccion = VALUE #( ciudad = 'Madrid' calle = 'Gran Via' pais = 'España' )
                               puesto = VALUE #(  departamento = 'Finanzas' sueldo = '2000.00' )
                               ).
             out->write(  DATA = ls_empl_info name = 'ls_empl_info' ).

              out->write( |\n| ).

**********************************************************************
" otra forma de meter datos en las estructuras profundas

            TYPES:BEGIN OF ty_flights3,
            flight_date  TYPE /dmo/flight-flight_date,
            price        TYPE /dmo/flight-price,
            current_code TYPE /dmo/flight-currency_code,
          END OF ty_flights3.


    DATA: BEGIN OF ls_flight_info3,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
            ls_flights3 TYPE ty_flights3, " ahora no es tabla es estructura
          END OF ls_flight_info3.

        ls_flight_info3 = VALUE #(
                                    carrier = 'SP'
                                    connid = '0035'
                                    ls_flights3 = VALUE #(  flight_date = '20250731'
                                                            current_code = 'EUR'
                                                            price = '200' ) ).

                                   out->write(  DATA = ls_flight_info3 NAME = 'ls_flight_info3' ).

                            out->write( |\n| ).

**********************************************************************
" estructura en forma lineal

        DATA(ls_flight2) = VALUE ty_flights(  current_code = 'USE' ).
        out->write(  DATA = ls_flight2 NAME =  'ls_flight2' ).

         out->write( |\n| ).

**********************************************************************
"CLEAR se usan para eliminar lso datos de una estructura en tiempo de ejecución, ya sea para aplicarlo dentro de " un componente de forma individual o para la estructura completa.


        SELECT SINGLE FROM /dmo/flight
        FIELDS *
        WHERE carrier_id = 'LH'
        INTO @data(ls_flight4).

        out->write(  DATA = ls_flight4 NAME = 'ls_flight4' ).
        CLear ls_flight4-connection_id.
        out->write(  data = ls_flight4 name = 'ls_flight4' ).
         out->write( |\n| ).
        clear ls_flight4.
        out->write( data = ls_flight4 name = 'ls_flight4' ).







  ENDMETHOD.
ENDCLASS.
