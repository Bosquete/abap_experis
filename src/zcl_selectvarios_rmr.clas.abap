CLASS zcl_selectvarios_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SELECTVARIOS_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

***************************** SELECT *****************************************

    "SELECT NORMAL
*  SELECT FROM /dmo/flight
*        FIELDS *
*        WHERE carrier_id = 'LH'
*        INTO TABLE @DATA(lt_flights).
*
*
* out->write( data = lt_flights name = `lt_flights` ).

    "SELECT A UNA TABLA INTERNA
*  SELECT carrier_id, connection_id, flight_date
*  FROM @lt_flights AS gt
*  INTO TABLE @DATA(lt_flights_copy).
*
*
*  out->write(  data = lt_flights_copy name = `lt_flights_copy` ).

**********************************************************************************
    "" ORDENAR TABLAS (NO TIENE SENTIDO PARA LAS TABLAS DE TIPO SHORTED)
    """SI PARA LAS ESTANDAR Y LAS HASHED""""""""""""""""""""""""""""""""""""""""""""""

    "DATA lt_flights TYPE STANDARD TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
    FIELDS *
    WHERE carrier_id = 'LH'
    INTO TABLE @DATA(lt_flights).

    "SELECT A UNA TABLA INTERNA
    SELECT carrier_id, connection_id, flight_date
    FROM @lt_flights AS lt
    INTO TABLE @DATA(lt_flights_copy).
*
*    out->write( data = lt_flights name = `lt_flights` ).
*          SORT lt_flights_copy BY flight_date DESCENDING connection_id ASCENDING.
*    out->write(  data = lt_flights_copy name = `lt_flights_copy` ).

**********************************************************************
""""" MODIFICAR REGISTROS """""""""""""""""""""""""""""""""""""""""

        " forma clásico
*        out->write( data = lt_flights name = `ANTES / lt_flights` ).
*
*        LOOP AT lt_flights INTO DATA(ls_flight).
*        ls_flight-flight_date = cl_abap_context_info=>get_system_date(  ).
*
*        MODIFY lt_flights FROM ls_flight INDEX 2.
*        ENDLOOP.
*
*        out->write( data = lt_flights name = `DESPUES / lt_flights` ).


        " forma moderna
*
*            out->write( data = lt_flights name = `ANTES / lt_flights` ).
*
*        LOOP AT lt_flights INTO DATA(ls_flight).
*
*        "IF ls_flight-flight_date < '20260101'.
*        IF ls_flight-connection_id > '0401'.
*        "ls_flight-flight_datec = cl_abap_context_info=>get_system_date(  ).
*        ls_flight-connection_id = '4000'.
*        "MODIFY lt_flights FROM ls_flight INDEX 2.
*        MODIFY lt_flights FROM ls_flight TRANSPORTING connection_id.
*        ENDIF.
*        ENDLOOP.
*
*        out->write( data = lt_flights name = `DESPUES / lt_flights` ).

   " forma moderna 2

   "forma moderna






*    out->write( data = lt_flights name = `ANTES / lt_flights` ).
*
*    LOOP AT lt_flights INTO DATA(ls_flight).
*      IF ls_flight-connection_id > '0401'.
*        "ls_flight-connection_id = cl_abap_context_info=>get_system_date(  ).
*
*        MODIFY lt_flights FROM VALUE #(  connection_id = '4000'
*                                           carrier_id = 'XX'
*                                           plane_type_id   = 'YY'  ) TRANSPORTING carrier_id plane_type_id connection_id .
*      ENDIF.
*    ENDLOOP.
*    out->write( data = lt_flights name = `DESPUES / lt_flights` ).


 " eliminar registros

        DATA: lt_flights_struc TYPE STANDARD TABLE OF /dmo/airport,
              ls_flights_struc TYPE /dmo/airport.

        SELECT FROM /dmo/airport
        FIELDS *
        WHERE country EQ 'US'
        INTO TABLE @lt_flights_struc.


        IF sy-subrc EQ 0.
            out->write(  DATA = lt_flights_struc name = `BEFORE lt_flights_struc` ).

            "Recorremos la tabla para borrar ciertos aeropuertos
            LOOP AT lt_flights_struc INTO ls_flights_struc.

            "si el ID del aeropuerto es JFK, BNA o BOS, olo eliminamos cambiar el and por OR
            IF ls_flights_struc-airport_id = 'JFK' OR
               ls_flights_struc-airport_id = 'BNA' OR
               ls_flights_struc-airport_id = 'BOS'.

             "Borramos el registro d ela tabla interna
            DELETE TABLE lt_flights_struc FROM ls_flights_struc.
            ENDIF.
            ENDLOOP.
            ENDIF.

        out->write(  DATA = lt_flights_struc name = `AFTER lt_flights_struc` ).

"""" eliminar registros

*DATA: lt_flights_struc TYPE STANDARD TABLE OF /dmo/airport,
*      ls_flights_struc TYPE /dmo/airport.
*
*
*SELECT FROM /dmo/airport
*  FIELDS *
*  WHERE country EQ 'US'
*  INTO TABLE @lt_flights_struc.
*
*
*IF sy-subrc EQ 0.
*  out->write( data = lt_flights_struc name = `BEFORE lt_flights_struc` ).
*
*  " Recorremos la tabla para borrar ciertos aeropuertos
*  LOOP AT lt_flights_struc INTO ls_flights_struc.
*
*    " Si el ID del aeropuerto es JFK, BNA o BOS, lo eliminamos
*    IF ls_flights_struc-airport_id = 'JFK' or
*       ls_flights_struc-airport_id = 'BNA' OR
*       ls_flights_struc-airport_id = 'BOS'.
*
*      " Borramos el registro de la tabla interna
*      DELETE TABLE lt_flights_struc FROM ls_flights_struc.
*
*    ENDIF.
*
*  ENDLOOP.
*
*ENDIF.
*
*
*out->write( |\n| ).
*
*
*out->write( data = lt_flights_struc name = `AFTER lt_flights_struc` ).
*
*""""""""
*
*DELETE lt_flights_struc index 2.
*out->write( data = lt_flights_struc name = `AFTER lt_flights_struc` ).
*"""
*DELETE lt_flights_struc from 3 to 6.
*out->write( data = lt_flights_struc name = `AFTER lt_flights_struc` ).
" campos nulos
" DELETE lt_flights_struc where city is initial.
"" campos duplicados
"delete ADJACENT DUPLICATES FROM lt_flights_struc COMPARING airport_id.

clear lt_flights_struc.
Free lt_flights_struc.





  ENDMETHOD.
ENDCLASS.
