CLASS zcl_fun_cadenas_carcateres_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fun_cadenas_carcateres_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  " funciones de búsqueda LONGITUD , CONTEO CARCATERES Y BÚSQUEDA
*
  "DATA: lv_string TYPE string VALUE '¡EXPERIS! Welcome to Abap Cloud Master',
  DATA: lv_string TYPE string VALUE 'Daniel Fernando Pedro Ramon',
        lv_name Type String VALUE 'Fernando',
        lv_num TYPE string.
*
*  "strlen
*  lv_num = strlen(  '¡EXPERIS! Welcome to Abap Cloud Master'  ). " cuenta el nº de carcateres.
*  out->write( lv_num ).
*
*  out->write(  | | ).
*
*  " count  devuelve la cantidad de veces que encuetra el texto y diferencia entre minusc y mayusc.
*  "DATA(lv_num) = count(  val = lv_string sub = 'We' ).
*  lv_num = count(  val = lv_string sub = 'We' ). "
*  out->write(  lv_num ).
*
*  out->write(  | | ).
*
*
*  " count_any_of   encuentra la cantidad de veces que aparece el carcater o texto sin diferenciar si es mayusc o minusc.
*  lv_num = count_any_of(  val = lv_string sub = 'We' ). "
*  out->write(  lv_num ).
*
*  out->write(  | | ).
*
*  "count_any_not_of cuenta lso caracteres menso los indicados
*   lv_num = count_any_not_of(  val = lv_string sub = 'We' ). "
*  out->write(  lv_num ).
*
*  out->write(  | | ).
*
*  "find lo que hace es la posición en la s¡que se encuentra loq ue buscamos y busca desde cero
*  lv_num = find( val = lv_string sub = lv_name ).
*  out->write(  lv_num ).
*
*  out->write(  | | ).
*
*  "find_any_of busca la primera letra de forma individual que encuentre de la palabra indicada.
*    lv_num = find_any_of( val = lv_string sub = lv_name ).
*  out->write(  lv_num ).
*
*  " find_any_not_of devuelve la primera posición en al qu eno ocindiden lso caracteres buscados.
*   lv_num = find_any_not_of( val = lv_string sub = 'Fernando' ).
*  out->write(  lv_num ).



  " FUNCIONES DE PROCESAMIENTO -
  DATA lv_cadenas TYPE string.

  "MAYUS MINUS
  lv_cadenas = to_upper(  lv_string ).
   out->write(  |TO_UPPER          = {  to_upper(  lv_string  ) }| ).
  out->write(  | TO_UPPER = { lv_cadenas } | ).
  out->write(  lv_cadenas ).

out->write(  | | ).

out->write(  |TO_LOWER   =  { to_lower(  lv_cadenas ) }| ).


out->write(  | | ).
"order
out->write(  |REVERSE = {  REVERSE(  LV_STRING ) }| ).


out->write(  | | ).
"SHIFT LEFT
OUT->WRITE(  |SHIFT_LEFT (places) = {  shift_left(  VAL = lv_string places = 5 ) }| ).

OUT->WRITE(  |SHIFT_RIGHT (places) = {  shift_RIGHT(  val = lv_string places = 5 ) }| ).

OUT->WRITE(  |SHIFT_LEFT (CIRC) = {  shift_left( val =  lv_string circular = 5 ) }| ).
OUT->WRITE(  |SHIFT_RIGHT (CIRC) = {  shift_right( val =  lv_string circular = 5 ) }| ).


" substring

OUT->WRITE(  |SUBSTRING = {  substring( val =  lv_string off = 9 len = 6 ) }| ).
OUT->WRITE(  |SUBSTRING_FROM = {  substring_from( val =  lv_string sub = 'Pedro' ) }| ).
OUT->WRITE(  |SUBSTRING_AFTER = {  substring_after( val =  lv_string sub = 'Pedro' ) }| ).
OUT->WRITE(  |SUBSTRING_TO = {  substring_to( val =  lv_string sub = 'ABAP' ) }| ).
OUT->WRITE(  |SUBSTRING_BEFORE = {  substring_before( val =  lv_string sub = 'ABAP' ) }| ).

"others
OUT->WRITE(  |CONDENSE = {  condense( val =  lv_string  ) }| ).
OUT->WRITE(  |REPEAT = {  repeat( val =  lv_string occ = 2 ) }| ).
"OUT->WRITE(  |SEGMENT1 = {  segment( val =  lv_string sep = '!' index = 1 ) }| ).
"OUT->WRITE(  |SEGMENT2 = {  segment( val =  lv_string sep = '!' index = 2 ) }| ).

" APUNTES DEL PROFE

DATA: lv_string2 TYPE string VALUE 'daniel Fernando Pedro Ramon',
      lv_name2   TYPE string VALUE 'Fernando',
      lv_comodin TYPE string,
      lv_num2    TYPE i.

" Funciones de búsqueda sobre cadenas de texto

* strlen
lv_num = strlen( lv_string ).                                      " Cuenta el número total de caracteres de la cadena (incluye espacios)
out->write( lv_num ).

" count
lv_num = count( val = lv_string sub = lv_name ).                   " Cuenta cuántas veces aparece el valor de lv_name en lv_string
out->write( lv_num ).
lv_num = count( val = lv_string sub = 'Fernando' ).                " Hace lo mismo que arriba, pero sin usar la variable lv_name
out->write( lv_num ).

"count_any_of
lv_num = count_any_of( val = lv_string sub = lv_name ).            " Cuenta cuántos caracteres de lv_name están presentes en lv_string (aunque no formen la palabra completa)
out->write( lv_num ).

"count_any_not_of
lv_num = count_any_not_of( val = lv_string sub = 'Fernando' ).     " Cuenta cuántos caracteres de lv_string **no** están en la palabra 'Fernando'
out->write( lv_num ).

"find  "Empieza a contar por 0
lv_num = find( val = lv_string sub = lv_name ).                    " Devuelve la posición donde empieza la palabra 'Fernando' dentro de lv_string (empieza desde 0)
out->write( lv_num ).

"find_any_of
lv_num = find_any_of( val = lv_string sub = 'Fernando' ).          " Devuelve la posición del primer carácter que coincida con alguno de los caracteres de 'Fernando'
out->write( lv_num ).

"find_any_not_of
lv_num = find_any_not_of( val = lv_string sub = 'Fernando' ).      " Devuelve la posición del primer carácter de lv_string que **no** está contenido en 'Fernando'
out->write( lv_num ).



  "funciones de procesamiento
*    DATA: lv_string  TYPE string VALUE 'daniet Fernando Pedro Ramon',
*          lv_comodin TYPE string.


" MAYUS minus
out->write( |TO_UPPER         = { to_upper( lv_string ) } | ).        " Convierte todo el texto a MAYÚSCULAS
out->write( |TO_LOWER         = { to_lower( lv_string ) } | ).        " Convierte todo el texto a minúsculas
out->write( |TO_MIXED         = { to_mixed( lv_string ) } | ).        " Primera letra de cada palabra en mayúscula
out->write( |FROM_MIXED       = { from_mixed( lv_string ) } | ).      " Invierte el efecto de to_mixed (si aplica)

" Order
out->write( |REVERSE          = { reverse( lv_string ) } | ).         " Invierte el orden de todos los caracteres del texto
out->write( |SHIFT_LEFT (places)  = { shift_left( val = lv_string places = 5 ) } | ).  " Desplaza 5 caracteres a la izquierda (rellena con espacios)
out->write( |SHIFT_RIGHT (places) = { shift_right( val = lv_string places = 5 ) } | ). " Desplaza 5 caracteres a la derecha (rellena con espacios)
out->write( |SHIFT_LEFT (circ)    = { shift_left( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la izquierda de forma circular
out->write( |SHIFT_RIGHT (circ)   = { shift_right( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la derecha de forma circular

" Substring
out->write( |SUBSTRING           = { substring( val = lv_string off = 9 len = 6 ) } | ).     " Extrae 6 caracteres desde la posición 9
out->write( |SUBSTRING_FROM      = { substring_from( val = lv_string sub = 'Pedro' ) } | ).   " Devuelve el texto a partir de 'Pedro' (inclusive)
out->write( |SUBSTRING_AFTER     = { substring_after( val = lv_string sub = 'Pedro' ) } | ).  " Devuelve el texto después de 'Pedro' (excluyendo 'Pedro')
out->write( |SUBSTRING_TO        = { substring_to( val = lv_string sub = 'Pedro' ) } | ).     " Devuelve el texto desde el inicio hasta 'Pedro' (inclusive)
out->write( |SUBSTRING_BEFORE    = { substring_before( val = lv_string sub = 'Pedro' ) } | ). " Devuelve el texto desde el inicio hasta antes de 'Pedro'

" Others
out->write( |CONDENSE            = { condense( val = lv_string ) } | ).   " Elimina espacios duplicados e innecesarios ( como dobles espacios en blanco)
out->write( |REPEAT              = { repeat( val = lv_string occ = 2 ) } | ). " Repite el contenido completo 2 veces
out->write( |SEGMENT1            = { segment( val = lv_string sep = '!' index = 1 ) } | ).    " Extrae el primer segmento antes del primer '!'
"out->write( |SEGMENT2            = { segment( val = lv_string sep = '!' index = 2 ) } | ).    " Extrae el segundo segmento entre el primer y segundo '!'







  "FUNCIONES DE CONTENIDO


*EJERCICIO:
*Eliminar los espacios sobrantes de la frase.
*Convertir la frase a minúsculas.
*Comprobar si la palabra "abap" aparece en ella.
*Si aparece, extraer solo esa
* palabra usando substring_from.
*Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
*Mostrar todos los resultados por consola.




DATA lv_texto type string value '¡   Bienvenido a   ABAP Cloud, Daniel!   '.

out->write( |CONDENSE            = { condense( val = lv_texto ) } | ).
out->write( lv_texto ).


"CONDICIONALES:

DATA: lv_numero1 type i VALUE 5,
      lv_numero2 TYPE i VALUE 3.

      if lv_numero1 = 5.
      out->write( 'la variable es 5' ).
      ENDIF.

 if lv_numero1 = 3.
      out->write( 'la variable es 3' ).
      ENDIF.

      DATA lv_nombre TYPE string VALUE 'Daniel'.

      if lv_nombre = 'Daniel'.
      out->write(  'hola, Daniel' ).

      elseif lv_nombre = 'Pedro'.
      out->write(  'Hola, Pedro' ).

      else.
      out->write(  'no te conozco' ).

      ENDIF.




  ENDMETHOD.
ENDCLASS.
