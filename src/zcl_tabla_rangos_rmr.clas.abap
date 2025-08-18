CLASS zcl_tabla_rangos_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLA_RANGOS_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "tablas de rangos

* sign
*    I  = lo quiero
*    E  = no lo quiero
*
*option dice el tipo de comparacion
*    EQ - =  / igual a
*    NE - diferente de  <>
*    GT - mayor que >
*    LT - Menor que <
*    BT - entre
*    CP - "like"
*
*
*low - El valor minimo o valor exacto
*
*high - el valor maximo

*DATA lr_seats type range of /dmo/plane_seats_occupied.
*
*"quiero vuelos con asiesntos entre 50 y 100
*append value #( sign = 'I' option = 'BT' low = 50 high = 100 ) to lr_seats.
*"tambien quiero vuelos exactamente con 150 asisentos
*append value #( sign = 'I' option = 'EQ' low = 150 ) to lr_seats.
*"pero no quiero vuelos con menos de 10 asientos
*append value #( sign = 'E' option = 'EQ' low = 150 ) to lr_seats.
*
*data: lt_flights type table of /dmo/flight.
*
*select *
*from /dmo/flight
*where seats_occupied in @lr_seats
*into table @lt_flights.
*
*loop at lt_flights into Data(ls_flight).
*
*out->write( |vuelos: { ls_flight-carrier_id } Asientos ocupados: { ls_flight-seats_occupied } | ).
*ENDLOOP.


**********************************************************************
"        ENUM - es una lista de valores con nombre que representa todas asl opciones posibles para algo (todas asl opciones posibles marcadas

        " Definimos el ENUM para los tipos de vuelo
*        TYPES: BEGIN OF ENUM ty_flight_enum,
*
*               nacional, "vuelo dentro del mismo pais
*               internacional, "vuelo entre paises
*               charter, "vuelo especial/privado
*               END OF ENUM ty_flight_enum.
*
*        "Declaramos la variable
*        DATA lv_tipo_vuelo TYPE ty_flight_enum.
*
*        "Asignamos el valor al ENUM !! que no puede ser distinto a los que estén en la declaración del TYPES: BEgin ON ENUM
*         lv_tipo_vuelo = internacional.
*
*
*         CASE lv_tipo_vuelo.
*            WHEN nacional.
*            out->write( 'este es un vuelo nacional' ).
*
*             WHEN internacional.
*            out->write( 'este es un vuelo internacional' ).
*
*             WHEN charter.
*            out->write( 'este es un vuelo charter' ).
*
*         ENDCASE.


**********************************************************************
"           BASE PERMITE REUTILIZAR UNA ESTRUCTURA O TABLA YA EXISTENTE COMO BASE PARA CREAR UNA NUVEA, SIN TENER QUE COPIAR TODO MANUALMENTE.

*
        SELECT FROM /dmo/flight
                FIELDS *
                WHERE currency_code = 'USD'
                INTO TABLE @DATA(lt_flights).


        out->write( data = lt_flights name = `lt_flights` ).

        out->write( |\n| ).

        DATA lt_seats TYPE TABLE OF /dmo/flight.

        lt_seats = value #(
                            base lt_flights
                            (  carrier_id = 'CO'
                               connection_id = '000123'
                               flight_date =  SY-DATUM  " cl_abap_context_info=>get_system_date().
                               price = '2000'
                               currency_code = 'COP'
                               PLANE_TYPE_ID = 'B213-58'
                               SEATS_MAX = 120
                               SEATS_OCcUPIED = 100
                               ) ).

                               out->write(  data = lt_seats name = `lt_seats` ).


        lt_seats = value #(
                            base lt_seats ( lines of lt_flights )
                            (  carrier_id = 'CO'
                               connection_id = '000123'
                               flight_date =  SY-DATUM  " cl_abap_context_info=>get_system_date().
                               price = '2000'
                               currency_code = 'COP'
                               PLANE_TYPE_ID = 'B213-58'
                               SEATS_MAX = 120
                               SEATS_OCcUPIED = 300
                               ) ).

                                out->write(  data = lt_seats name = `lt_seats` ).


**********************************************************************
"      AGRUPAR REGISTROS
" En abap Cloud ( y en abap general) agrupar registros signiica organizar datos con un criterio comun
" para tratarlos como un conjunto
"Se suele hacer cuando se quiere sumar, contar o procesar datos que ecomaprten el mismo valor o los mismos campos.


*        SELECT *
*            FROM /dmo/flight
*            INTO TABLE @DATA(lt_flights).
*
*        DATA lt_members LIKE lt_flights.
*
*        LOOP AT lt_flights INTO DATA(ls_flight)
*                GROUP BY ls_flight-carrier_id
*                ASCENDING
*                INTO DATA(lv_carrier).
*
*                CLEAR lt_members.
*
*          LOOP AT GROUP lv_carrier INTO DATA(ls_member).
*                APPEND ls_member TO lt_members.
*
*          ENDLOOP.
*
*                out->write( |Aerolínea: { lv_carrier } - VUelos en este grupo: { LINES( lt_members ) } | ).
*          ENDLOOP.



       " out->write( lt_flights ).
        "out->write( lt_members ).








  ENDMETHOD.
ENDCLASS.
