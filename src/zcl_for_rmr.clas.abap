CLASS zcl_for_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FOR_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    """"""""""""""""""""""""""""""""""""FOR""""""""""""""""""""""""""""""""""
*
*        TYPES: BEGIN OF ty_flights,
*                idUser TYPE /dmo/customer_id,
*                airCode TYPE /dmo/carrier_id,
*                flightNum TYPE /dmo/connection_id,
*                key TYPE land1,
*                seat TYPE /dmo/plane_seats_occupied,
*                flightDate TYPE /dmo/flight_date,
*                END OF ty_flights.
*
*        DATA: lt_flights_info TYPE TABLE OF ty_flights,
*              lt_my_flights TYPE TABLE OF ty_flights.
*
*
*        lt_my_flights = VALUE #( for i = 0 UNTIl i > 30
*
*        (               idUser = | { 123456 + i }  - USER |
*                        airCode = 'LH'
*                        flightNum = 00001 + i
*                        key = 'US'
*                        seat = 0 + i
*                        flightDate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

    "out->write(  data = lt_my_flights name = `lt_my_flights` ).

**********************************************************************

    "FOR

*types: BEGIN OF ty_flights,
*       iduser type /dmo/customer_id,
*       aircode type /dmo/carrier_id,
*       flightnum type /dmo/connection_id,
*       key type land1,
*       seat type /dmo/plane_seats_occupied,
*       flightdate type /dmo/flight_date,
*       END OF TY_FLIGHTS.
*
*
*
*
*
*
*DATA: lt_flights_info type TABLE of ty_flights,
*      lt_my_flights type table of ty_flights.


    "for con el WHILE
*
*lt_my_flights = VALUE #( for i = 1 WHILE i <= 20
*
*        (     iduser = | { 123456 + i } - USER |
*               aircode = 'LH'
*               flightnum = 00001 + i
*               key = 'US'
*               seat = 0 + i
*               flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).
*
*
*out->write( data = lt_my_flights name = `lt_my_flights` ).

**********************************************************************
    """"""""""""""""""FOR IN""""""""""""""""""""""""""""""""""""""""""""""""""""

* lt_flights_info = VALUE #( for lt_my_flight in lt_my_flights
*
*        (     iduser = ls_my_flight-iduser
*               aircode = ls_my_flight-aircode
*               flightnum = ls_my_flight-flightnum
*               key = ls_my_flight-key
*               seat = ls_my_flight-seat
*               flightdate = ls_my_flight-flightdate ) ).
*
*
*out->write( data = lt_my_flights name = `lt_my_flights` ).

**********************************************************************
    """""""""""""""""""""""""""""FOR WHERE"""""""""""""""""""""""""""""""""""""""""

*         lt_flights_info = VALUE #( for lt_my_flight in lt_my_flights
*         WHERE (  aircode = 'LH' AND flighynum > 0012 )
*
*        (     iduser = ls_my_flight-iduser
*               aircode = ls_my_flight-aircode
*               flightnum = ls_my_flight-flightnum
*               key = ls_my_flight-key
*               seat = ls_my_flight-seat
*               flightdate = ls_my_flight-flightdate ) ).
*
*
*    out->write( data = lt_my_flights name = `lt_my_flights` ).

**********************************************************************
    """""""""""""""""""""""""""""""FOR ANIDADO"""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_flights,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             flightdate  TYPE /dmo/flight_date,
             flightprice TYPE /dmo/flight_price,
             currency    TYPE /dmo/currency_code,
           END OF ty_flights.

    SELECT FROM /dmo/flight
            FIELDS *
            INTO TABLE @DATA(lt_flights_type).

    SELECT FROM /dmo/booking_m
            FIELDS carrier_id, connection_id, flight_price, currency_code
            INTO TABLE @DATA(lt_airline)
            UP TO 20 ROWS.

    DATA lt_final TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY flightprice.


    lt_final = VALUE #( FOR ls_flight_type IN lt_flights_type WHERE ( carrier_id = 'AA' )
                        FOR ls_airline IN lt_airline WHERE ( carrier_id = ls_flight_type-carrier_id )

                        (  aircode     = ls_flight_type-carrier_id
                           flightnum   = ls_flight_type-connection_id
                           flightdate  = ls_flight_type-flight_date
                           flightprice = ls_airline-flight_price
                           currency    = ls_airline-currency_code  ) ).


        out->write( lt_final ).







  ENDMETHOD.
ENDCLASS.
