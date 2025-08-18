CLASS zcl_tablasinsert_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLASINSERT_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "insert value

*    DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.
*
*    INSERT VALUE #(
*        client  = 100
*        airport_id = 'FRA'
*        name = 'Frankfurt Airport'
*        city = 'Frankfurt/Main'
*        country = 'DE'
*      ) INTO TABLE lt_aeropuerto.
*    INSERT VALUE #(
*            client  = 100
*            airport_id = 'FRA'
*            name = 'Frankfurt Airport'
*            city = 'Frankfurt/Main'
*            country = 'PP'
*          ) INTO TABLE lt_aeropuerto.

    """"""""""""""


*    INSERT VALUE #(
*          client  = 100
*          airport_id = 'FRA'
*          name = 'Frankfurt Airport'
*          city = 'Frankfurt/Main'
*          country = 'EE'
*        ) INTO  lt_aeropuerto INDEX 2.  " con esta formula podemos indicar la posicion donde quermos que se introduzca la nueva fila


    "out->write( lt_aeropuerto ).

    " para crear un registro con una linea en blanco
    "insert initial line into table lt_aeropuerto .

    " Para igualar dos tablas internas usamos el like
    "DATA lt_aeropuerto2 like lt_aeropuerto.

    "duplicar el contenido

    "insert lines of lt_aeropuerto into table lt_aeropuerto2.  "Duplica todo el contenido de la tabla original

    "insert lines of lt_aeropuerto to 2 into table lt_aeropuerto2." Copia el contenido de las lineas de la tabla original hasta la linea 2

    "insert lines of lt_aeropuerto from 2 to 3 into table lt_aeropuerto2."Copia el contenido de las lineas de la tabla original desde la linea inicial que se le indica hasta la linea final

**********************************************************************
    " AÑADIR REGISTROS CON EL APPEND -- añade un registro al final de la tabla interna

*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
**
**
*    TYPES: ty_tabla_personas TYPE TABLE OF ty_persona WITH EMPTY KEY.
*
    "DATA: lt_personas TYPE ty_tabla_personas,
    " ls_persona  TYPE ty_persona.
*
*
*    ls_persona-nombre = 'Daniel'.
*    ls_persona-edad = '23'.
*APPEND ls_persona TO lt_personas.
*
*out->write( lt_personas ).


**********************************************************************"   VARIACIONES DEL APPEND"

"   declaración lineal de APPEND:
  TYPES: BEGIN OF ty_persona,
         nombre TYPE string,
         edad TYPE i,
         END OF ty_persona.

   TYPES: ty_tabla_personas TYPE TABLE OF ty_persona WITH EMPTY KEY.
   DATA: lt_personas TYPE ty_tabla_personas.

   out->write( lt_personas ).

            APPEND VALUE #(

                    nombre = 'Daniel'
                    edad = 15

             ) to lt_personas.

             out->write( lt_personas ).

**********************************************************************
    "  COPIAR CONTENIDO DE UNA TABLA A OTRA

"DATA lt_personas2 like lt_personas.



*    APPEND LINES OF lt_personas TO lt_personas2.
*
*    APPEND LINES OF lt_personas TO 2 TO  lt_personas2.
*
*    APPEND LINES OF lt_personas FROM 4 TO 6 TO  lt_personas2.

**********************************************************************
    "    AÑADIR REGISTROS CON VALUE -- PERMITE AÑADIR REGISTROS EN UNA SOLA LÍNEA,
    "ES LA MÁS MODERNA Y LEGIBLE, SE RECOMIENDA USAR EN CLOUD. Y EN CLÁSICO EL INSERT.

*
*        TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    TYPES: ty_tabla_personas TYPE TABLE OF ty_persona WITH EMPTY KEY.
*
*        data(lt_persona) = value ty_tabla_personas(
*        ( nombre = 'Ana'  edad = 25 )
*        ( nombre = 'Javier'  edad = 45 )
*        ( nombre = 'Lucía'  edad = 22 )
*        ).
*
*
*        out->write( lt_persona ).
*
*        data ls_persona type ty_persona. " declaramos una estructura
*
*        loop at lt_persona into ls_persona.
*
*                out->write(  |Nombre: { ls_persona-nombre }, Edad: { ls_persona-edad } | ).
*
*        ENDLOOP.

**********************************************************************
    " extraemos todo de la base de datos / tabla externa

*        data lt_aeropuerto type standard table of /dmo/airport.
*            lt_aeropuerto = value #(
*        ( client  = 100
*        airport_id = 'FRA'
*        name = 'Frankfurt Airport'
*        city = 'Frankfurt/Main'
*        country = 'DE' )
*
*        ( client  = 100
*        airport_id = 'RRA'
*        name = 'Frankfurt Airport'
*        city = 'Frankfurt/Main'
*        country = 'RE' )
*         ).
*
*        out->write(  lt_aeropuerto ).

**********************************************************************

    "    READ TABLE  CON INDICE-- LEER CAMPOS

*    SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights).
*
*    IF sy-subrc = 0.  "para verificar que viene con información.
*
*        READ TABLE lt_flights INTO DATA(ls_flights) INDEX 1.
**        out->write( data = lt_flights name = `tabla de vuelos` ).
**        out->write(  data = ls_flights name =  `Estructura vuelos` ).
*      "out->write( lt_flights ).
*
*       READ TABLE lt_flights INTO DATA(ls_flights2) INDEX 4 TRANSPORTING airport_id.
*        out->write(  data = ls_flights2 name =  `Estructura vuelos` ).
*    ENDIF.


**********************************************************************


*  SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights).

*    IF sy-subrc = 0.  "para verificar que viene con información.
*
*        READ TABLE lt_flights ASSIGNING FIELD-SYMBOL(<lfs_flight>) INDEX 3.
*        out->write( data = <lfs_flight> name = `lfs_flight` ).
**        out->write(  data = ls_flights name =  `Estructura vuelos` ).
*      "out->write( lt_flights ).
*
*
*    ENDIF.


**********************************************************************
" la forma moderna de usar del read table con indice esta es la q hay q usar con cloud

          "DATA(ls_data) = lt_flights[ 2 ].
          "out->write( data = ls_data name = `ls_data` ).


          "DATA(ls_data2) = VALUE #( lt_flights[ 20 ] DEFAULT lt_flights[ 1 ] ).


**********************************************************************
"           READ CON CLAVE

*        SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights).
*
*    if sy-subrc = 0.
*
*    READ TABLE lt_flights INTO DATA(ls_flight) WITH KEY city = 'Berlin'.
*    out->write( data = lt_flights name = `lt_flights` ).
*    out->write( data = ls_flight name = `ls_flight` ).
*
*    ENDIF.

    "  la forma moderna, la que se debe utilizar en abap cloud

     SELECT FROM /dmo/airport
    FIELDS *
    WHERE country = 'DE'
    INTO TABLE @DATA(lt_flights).

*    DATA(ls_flight2) = lt_flights[  airport_id ='MUC' ].
*    out->write(  data = ls_flight2 name = `lt_flights2` ).

    "modificación de este código para coger únicamente un valor
     DATA(ls_flight2) = lt_flights[  airport_id ='MUC' ]-name.
    out->write(  data = ls_flight2 name = `lt_flights2` ).

  ENDMETHOD.
ENDCLASS.
