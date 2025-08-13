CLASS zcl_tablas_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  TYPES:BEGIN OF ty_persona,
*        nombre TYPE string,
*        edad TYPE i,
*        END OF TY_PERSONA.
*
*   TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH empty key.
*
*    DATA: lt_personas TYPE ty_tabla_personas,
*          ls_persona TYPE ty_persona.
*
*          ls_persona-nombre = 'Carlos'.
*          ls_persona-edad   = 25.
*
*     " out->write( lt_personas ).
*
*        INSERT ls_persona INTO lt_personas INDEX 1.
*
*        out->write( lt_personas ).
*
*        ls_persona-nombre = 'María'.
*          ls_persona-edad   = 30.
*
*           INSERT ls_persona INTO lt_personas INDEX 2.
*
*          out->write( lt_personas ).
*
*           ls_persona-nombre = 'Pedro'.
*          ls_persona-edad   = 31.
*
*           INSERT ls_persona INTO lt_personas INDEX 3.
*
*
*           LOOP AT lt_personas INTO ls_persona.
*
*                    out->write( |Nombre: { ls_persona-nombre }, edad: { ls_persona-edad } | ).
*
*
*
*               ENDLOOP.


**********************************************************************
"           LET  - EN LA TÍPICA VARIABLE EN LA QUE SOLO TE CABE UN DATO,
"lo que hace LET se te permite guardar los valores de otras variablees en nua, se guardan cómo cadena de caracteres.

    "LET
*
*    SELECT FROM /dmo/flight
*           FIELDS *
*           WHERE currency_code EQ 'USD'
*           INTO TABLE @DATA(lt_flights).
*
*    SELECT FROM /dmo/booking_m
*           FIELDS *
*           INTO TABLE @DATA(lt_airline)
*           UP TO 50 ROWS.
*
*
*
*
*    LOOP AT lt_flights INTO DATA(ls_flight_let).
*
*      DATA(lv_flights) = CONV string(  " Convertimos todo el resultado a tipo string
*         LET
*           " Buscar en lt_airline el travel_id que corresponde al carrier_id del vuelo actual
*           lv_airline      = lt_airline[ carrier_id = ls_flight_let-carrier_id ]-travel_id
*
*           " Buscar en lt_flights el precio del vuelo con el mismo carrier_id y connection_id
*           lv_flight_price = lt_flights[ carrier_id    = ls_flight_let-carrier_id
*                                         connection_id = ls_flight_let-connection_id ]-price
*
*           " Buscar de nuevo el carrier_id en lt_airline (parece redundante, pero se usa aquí)
*           lv_carrid       = lt_airline[ carrier_id = ls_flight_let-carrier_id ]-carrier_id
*
*         IN
*          " Cadena final con formato: <carrier_id> / Airline name: <travel_id> / Flight price: <precio>
*           | { lv_carrid } / Airline name: { lv_airline } / Flight price: { lv_flight_price } |
*       ).
*      out->write( data = lv_flights ).
*    ENDLOOP.


**********************************************************************
"  AGRUPAR REGISTROS

        "agrupar registros
    "En abap cloud( y en abap en general) agrupar registros significa organizar datos con un criterio comun
    "para tratarlos como un conjunto.
    "( se suele hacer cuando se quiere sumar, contar o procesar datos que comparten un mismo valor o varios campos.

    SELECT *
    FROM /dmo/flight
    INTO TABLE @DATA(lt_flights).

    DATA lt_members LIKE lt_flights.

    "bucle externo con agrupacion
    LOOP AT lt_flights INTO DATA(ls_flight) " recorre lt_flights fila a fila en la estructura ls_flgitht
    GROUP BY ls_flight-carrier_id "agrupacion logica por aerolina ( carrier_id)
    ASCENDING "ordena de manera ascendente
    INTO DATA(lv_carrier). "guarda la clave del grupo actual (carrier_id ) en lv_carrier

    clear lt_members. "resetea el acumulador para empezar a llenar el grupo actual

    loop at GROUP lv_carrier into data(ls_member). "itera solo por las filas que pertenecen a este grupo
    append ls_member to lt_members. "añade cada miembro del gurpo a lt_members
    ENDLOOP.



        out->write( |Aerolinea: { lv_carrier } - Vuelos en este grupo: { lines( lt_members ) }  | ).

        clear lt_members.
        out->write( |Aerolinea: { lv_carrier } - Vuelos en este grupo: { lines( lt_members ) }  | ).

    ENDLOOP.






  ENDMETHOD.
ENDCLASS.
