CLASS zcl_ejerciciocadcarac_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJERCICIOCADCARAC_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*EJERCICIO:
* 1.- Eliminar los espacios sobrantes de la frase.
* 2.- Convertir la frase a minúsculas.
* 3.- Comprobar si la palabra "abap" aparece en ella.
* 4.- Si aparece, extraer solo esa palabra usando substring_from.
* 5.- Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
* 6.- Mostrar todos los resultados por consola.
*|-----------------------------------------------------------------------|

  DATA lv_texto type string value '¡   Bienvenido a   ABAP Cloud, Daniel!   '.

" 1.-
    out->write(  `---------------------------------------------------------` ).
    out->write(  `Ejericio 1 : Eliminar los espacios sobrantes de la frase.` ).
    out->write(  `---------------------------------------------------------` ).
    out->write( |CONDENSE            = { condense( val = lv_texto ) } | ).
    out->write(  | | ).

" 2.-
    out->write(  `---------------------------------------------------------` ).
    out->write(  `Ejericio 2 : Convertir la frase a minúsculas.` ).
    out->write(  `---------------------------------------------------------` ).

    Data(lv_lower) = to_lower( lv_texto ).
    "out->write( |TO_LOWER         = { to_lower( lv_texto ) } | ).
    out->write(  lv_lower ).
     out->write(  | | ).
"3.-
    out->write(  `---------------------------------------------------------` ).
    out->write(  `Ejericio 3 : Comprobar si la palabra "abap" aparece en ella.` ).
    out->write(  `---------------------------------------------------------` ).

    DATA(lv_num) = count(  val = lv_lower sub = to_lower(  'Abap') ). "
    "out->write(  lv_num ).
     if lv_num = '1'.
      out->write(  'Si contiene la palabra "Abap"' ).

      else.
      out->write(  'no la contiene' ).

      ENDIF.

      out->write(  | | ).

"4.-
    out->write(  `---------------------------------------------------------` ).
    out->write(  `Ejericio 4 : Si aparece, extraer solo esa palabra usando substring_from..` ).
    out->write(  `---------------------------------------------------------` ).

    out->write( |SUBSTRING_FROM = { substring_from( val = lv_lower sub = 'abap' ) } | ).

    out->write(  | | ).

"5.-
    out->write(  `---------------------------------------------------------` ).
    out->write(  `Ejericio 5 : Contar cuántos caracteres tiene la frase sin espacios iniciales/finales...` ).
    out->write(  `---------------------------------------------------------` ).
    out->write( | Contiene: {  strlen( lv_texto ) } palabras. | ).


  ENDMETHOD.
ENDCLASS.
