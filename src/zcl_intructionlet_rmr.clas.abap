CLASS zcl_intructionlet_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_intructionlet_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
"---------------LET -> podemos calcular valores intermedios evitar se repita lógico y hacer código limpio y legible.


            DATA: lt_flights TYPE STANDARD TABLE OF /dmo/flight,
                  lt_airline TYPE STANDARD TABLE OF /dmo/booking_m.

            SELECT FROM /dmo/flight
                FIELDS *
                WHERE currency_code = 'USD'
                INTO TABLE @lt_flights.

            SELECT FROM /dmo/booking_m
                FIELDS *
                INTO TABLE @lt_airline
                UP TO 50 ROWS.

            LOOP AT lt_flights INTO DATA(ls_flights_let).
                "creamos una variable en al que asignamos un resultado que ha transformado con el CONV a tipo String
                DATA(lv_flights) = conv string(
                LET  "buscamos el nombre de la aerolínea (travel_id)
                    lv_airline = lt_airline[ carrier_id = ls_flights_let-carrier_id ]-travel_id
                    "buscar el precio del vuelo, según carrier y número de vuelo
                    lv_flight_price = lt_airline[
                            carrier_id = ls_flights_let-carrier_id
                            connection_id = ls_flights_let-connection_id
                            ]-flight_price
                    " recuperar el carrier_id y explicitamente para mostrarloo
                    lv_carrid = lt_airline[  carrier_id = ls_flights_let-carrier_id ]-carrier_id

                    in"construimos la salida como string interpolado
                    |{ lv_carrid } / Airline Name: { lv_airline }/ flight price: { lv_flight_price }|

                     ).

                    out->write( data = lv_flights ).

            ENDLOOP.









  ENDMETHOD.
ENDCLASS.
