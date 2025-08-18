CLASS zcl_fun_cadenas_carcateres_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FUN_CADENAS_CARCATERES_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  " funciones de búsqueda LONGITUD , CONTEO CARCATERES Y BÚSQUEDA
*
*  "DATA: lv_string TYPE string VALUE '¡EXPERIS! Welcome to Abap Cloud Master',
*  DATA: lv_string TYPE string VALUE 'Daniel Fernando Pedro Ramon',
*        lv_name Type String VALUE 'Fernando',
*        lv_num TYPE string.
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
*  DATA lv_cadenas TYPE string.
*
*  "MAYUS MINUS
*  lv_cadenas = to_upper(  lv_string ).
*   out->write(  |TO_UPPER          = {  to_upper(  lv_string  ) }| ).
*  out->write(  | TO_UPPER = { lv_cadenas } | ).
*  out->write(  lv_cadenas ).
*
*out->write(  | | ).
*
*out->write(  |TO_LOWER   =  { to_lower(  lv_cadenas ) }| ).
*
*
*out->write(  | | ).
*"order
*out->write(  |REVERSE = {  REVERSE(  LV_STRING ) }| ).
*
*
*out->write(  | | ).
*"SHIFT LEFT
*OUT->WRITE(  |SHIFT_LEFT (places) = {  shift_left(  VAL = lv_string places = 5 ) }| ).
*
*OUT->WRITE(  |SHIFT_RIGHT (places) = {  shift_RIGHT(  val = lv_string places = 5 ) }| ).
*
*OUT->WRITE(  |SHIFT_LEFT (CIRC) = {  shift_left( val =  lv_string circular = 5 ) }| ).
*OUT->WRITE(  |SHIFT_RIGHT (CIRC) = {  shift_right( val =  lv_string circular = 5 ) }| ).
*
*
*" substring
*
*OUT->WRITE(  |SUBSTRING = {  substring( val =  lv_string off = 9 len = 6 ) }| ).
*OUT->WRITE(  |SUBSTRING_FROM = {  substring_from( val =  lv_string sub = 'Pedro' ) }| ).
*OUT->WRITE(  |SUBSTRING_AFTER = {  substring_after( val =  lv_string sub = 'Pedro' ) }| ).
*OUT->WRITE(  |SUBSTRING_TO = {  substring_to( val =  lv_string sub = 'ABAP' ) }| ).
*OUT->WRITE(  |SUBSTRING_BEFORE = {  substring_before( val =  lv_string sub = 'ABAP' ) }| ).
*
*"others
*OUT->WRITE(  |CONDENSE = {  condense( val =  lv_string  ) }| ).
*OUT->WRITE(  |REPEAT = {  repeat( val =  lv_string occ = 2 ) }| ).
*"OUT->WRITE(  |SEGMENT1 = {  segment( val =  lv_string sep = '!' index = 1 ) }| ).
*"OUT->WRITE(  |SEGMENT2 = {  segment( val =  lv_string sep = '!' index = 2 ) }| ).
*
*" APUNTES DEL PROFE
*
*DATA: lv_string2 TYPE string VALUE 'daniel Fernando Pedro Ramon',
*      lv_name2   TYPE string VALUE 'Fernando',
*      lv_comodin TYPE string,
*      lv_num2    TYPE i.
*
*" Funciones de búsqueda sobre cadenas de texto
*
** strlen
*lv_num = strlen( lv_string ).                                      " Cuenta el número total de caracteres de la cadena (incluye espacios)
*out->write( lv_num ).
*
*" count
*lv_num = count( val = lv_string sub = lv_name ).                   " Cuenta cuántas veces aparece el valor de lv_name en lv_string
*out->write( lv_num ).
*lv_num = count( val = lv_string sub = 'Fernando' ).                " Hace lo mismo que arriba, pero sin usar la variable lv_name
*out->write( lv_num ).
*
*"count_any_of
*lv_num = count_any_of( val = lv_string sub = lv_name ).            " Cuenta cuántos caracteres de lv_name están presentes en lv_string (aunque no formen la palabra completa)
*out->write( lv_num ).
*
*"count_any_not_of
*lv_num = count_any_not_of( val = lv_string sub = 'Fernando' ).     " Cuenta cuántos caracteres de lv_string **no** están en la palabra 'Fernando'
*out->write( lv_num ).
*
*"find  "Empieza a contar por 0
*lv_num = find( val = lv_string sub = lv_name ).                    " Devuelve la posición donde empieza la palabra 'Fernando' dentro de lv_string (empieza desde 0)
*out->write( lv_num ).
*
*"find_any_of
*lv_num = find_any_of( val = lv_string sub = 'Fernando' ).          " Devuelve la posición del primer carácter que coincida con alguno de los caracteres de 'Fernando'
*out->write( lv_num ).
*
*"find_any_not_of
*lv_num = find_any_not_of( val = lv_string sub = 'Fernando' ).      " Devuelve la posición del primer carácter de lv_string que **no** está contenido en 'Fernando'
*out->write( lv_num ).
*
*
*
*  "funciones de procesamiento
**    DATA: lv_string  TYPE string VALUE 'daniet Fernando Pedro Ramon',
**          lv_comodin TYPE string.
*
*
*" MAYUS minus
*out->write( |TO_UPPER         = { to_upper( lv_string ) } | ).        " Convierte todo el texto a MAYÚSCULAS
*out->write( |TO_LOWER         = { to_lower( lv_string ) } | ).        " Convierte todo el texto a minúsculas
*out->write( |TO_MIXED         = { to_mixed( lv_string ) } | ).        " Primera letra de cada palabra en mayúscula
*out->write( |FROM_MIXED       = { from_mixed( lv_string ) } | ).      " Invierte el efecto de to_mixed (si aplica)
*
*" Order
*out->write( |REVERSE          = { reverse( lv_string ) } | ).         " Invierte el orden de todos los caracteres del texto
*out->write( |SHIFT_LEFT (places)  = { shift_left( val = lv_string places = 5 ) } | ).  " Desplaza 5 caracteres a la izquierda (rellena con espacios)
*out->write( |SHIFT_RIGHT (places) = { shift_right( val = lv_string places = 5 ) } | ). " Desplaza 5 caracteres a la derecha (rellena con espacios)
*out->write( |SHIFT_LEFT (circ)    = { shift_left( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la izquierda de forma circular
*out->write( |SHIFT_RIGHT (circ)   = { shift_right( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la derecha de forma circular
*
*" Substring
*out->write( |SUBSTRING           = { substring( val = lv_string off = 9 len = 6 ) } | ).     " Extrae 6 caracteres desde la posición 9
*out->write( |SUBSTRING_FROM      = { substring_from( val = lv_string sub = 'Pedro' ) } | ).   " Devuelve el texto a partir de 'Pedro' (inclusive)
*out->write( |SUBSTRING_AFTER     = { substring_after( val = lv_string sub = 'Pedro' ) } | ).  " Devuelve el texto después de 'Pedro' (excluyendo 'Pedro')
*out->write( |SUBSTRING_TO        = { substring_to( val = lv_string sub = 'Pedro' ) } | ).     " Devuelve el texto desde el inicio hasta 'Pedro' (inclusive)
*out->write( |SUBSTRING_BEFORE    = { substring_before( val = lv_string sub = 'Pedro' ) } | ). " Devuelve el texto desde el inicio hasta antes de 'Pedro'
*
*" Others
*out->write( |CONDENSE            = { condense( val = lv_string ) } | ).   " Elimina espacios duplicados e innecesarios ( como dobles espacios en blanco)
*out->write( |REPEAT              = { repeat( val = lv_string occ = 2 ) } | ). " Repite el contenido completo 2 veces
*out->write( |SEGMENT1            = { segment( val = lv_string sep = '!' index = 1 ) } | ).    " Extrae el primer segmento antes del primer '!'
*"out->write( |SEGMENT2            = { segment( val = lv_string sep = '!' index = 2 ) } | ).    " Extrae el segundo segmento entre el primer y segundo '!'
*
*
*
*
*
*
*
*
*
*
**EJERCICIO:
**Eliminar los espacios sobrantes de la frase.
**Convertir la frase a minúsculas.
**Comprobar si la palabra "abap" aparece en ella.
**Si aparece, extraer solo esa
** palabra usando substring_from.
**Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
**Mostrar todos los resultados por consola.
*
*
*
*
*DATA lv_texto type string value '¡   Bienvenido a   ABAP Cloud, Daniel!   '.
*
*out->write( |CONDENSE            = { condense( val = lv_texto ) } | ).
*out->write( lv_texto ).
*
*
*"CONDICIONALES:
*
*DATA: lv_numero1 type i VALUE 5,
*      lv_numero2 TYPE i VALUE 3.
*
*      if lv_numero1 = 5.
*      out->write( 'la variable es 5' ).
*      ENDIF.
*
* if lv_numero1 = 3.
*      out->write( 'la variable es 3' ).
*      ENDIF.
*
*      DATA lv_nombre TYPE string VALUE 'Daniel'.
*
*      if lv_nombre = 'Daniel'.
*      out->write(  'hola, Daniel' ).
*
*      elseif lv_nombre = 'Pedro'.
*      out->write(  'Hola, Pedro' ).
*
*      else.
*      out->write(  'no te conozco' ).
*
*      ENDIF.

**********************************************************************
    "FUNCIONES DE CONTENIDO
**********************************************************************

* pcr expresión regular

*DATA: lv_text type string,
*      lv_pattern type string.
*
*      lv_text = 'El teléfono del empleado es 668-345-987'.
*      lv_pattern = `\d{3}-\d{3}-\d{3}`.  "la d detecta si hay números y el e indica la cantidad
*
*      if contains(  val = lv_text pcre = lv_pattern ).
*      out->write( 'el texto contiene un número de teléfono' ).
*      else.
*      out->write( 'el texto no contiene un número de teléfono' ).
*      endif.


**********************************************************************
    " ejercicio
*Ejercicio:
    "1-Extraer de la siguiente variable

    "losdistintos nombres que hay su interior y almacenar cada nombre en variables independientes.
****************************
*2-Crear un sistema que:
*  2.1-Identifique si el numero de caracteres de cada variable creada es  mayor a 7 y que en caso         afirmativo, que aparezca por consola un mensaje diciendo “Hola Fernando”,
*  2.2-En caso de ser menor de 7, el programa tendrá que comprobar si el tamaño del nombre es igual a 6.
*  2.3-En caso negativo se deberá escribir por consola un mensaje diciendo “Hola Pedro”  y cambiar el   tipo de caracares del nombre de minúscula a mayúscula.
*  2.4-En caso afirmativo se deberá identificar si el nombre es Sergio o Daniel, en caso del nombre sea Sergio se   escribirá un mensaje que diga “Hola Sergio”  y en caso de ser Daniel otro mensaje que diga “Hola Daniel”.
*
**Solo se podrán usar el condicional IF y las funciones de caracteres que hemos visto en clase, nada de bucles u otros eleméntenos que no se hayan visto en clase .**  PROHIBIDO usar el SPLIT






*
*DATA: lv_string TYPE string VALUE 'daniel fernando pedro ramon sergio',
*      lt_nombres TYPE TABLE OF string,
*      ls_nombre TYPE string,
*      lv_nombre1 TYPE string,
*      lv_nombre2 TYPE string,
*      lv_nombre3 TYPE string,
*      lv_nombre4 TYPE string,
*      lv_nombre5 TYPE string.
*
*" Dividir la cadena en una tabla de nombres
*SPLIT lv_string AT ' ' INTO TABLE lt_nombres.
*
**" Recorrer la tabla de nombres y asignar cada nombre a una variable individual
**LOOP AT lt_nombres INTO ls_nombre.
**  IF sy-index = 1.
**    lv_nombre1 = ls_nombre.
**  ELSEIF sy-index = 2.
**    lv_nombre2 = ls_nombre.
**  ELSEIF sy-index = 3.
**    lv_nombre3 = ls_nombre.
**  ELSEIF sy-index = 4.
**    lv_nombre4 = ls_nombre.
**  ELSEIF sy-index = 5.
**    lv_nombre5 = ls_nombre.
**  ENDIF.
**ENDLOOP.
*
*IF lines( lt_nombres ) >= 1.
*  lv_nombre1 = lt_nombres[ 1 ].
*ENDIF.
*IF lines( lt_nombres ) >= 2.
*  lv_nombre2 = lt_nombres[ 2 ].
*ENDIF.
*IF lines( lt_nombres ) >= 3.
*  lv_nombre3 = lt_nombres[ 3 ].
*ENDIF.
*IF lines( lt_nombres ) >= 4.
*  lv_nombre4 = lt_nombres[ 4 ].
*ENDIF.
*IF lines( lt_nombres ) >= 5.
*  lv_nombre5 = lt_nombres[ 5 ].
*ENDIF.
*
*out->write( lv_nombre1 ).
*out->write(  lv_nombre2 ).
*out->write(  lv_nombre3 ).
*out->write(  lv_nombre4 ).
*out->write(  lv_nombre5 ).


*
*    " Declaramos la cadena original con los nombres separados por espacios
*    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.
*
*    " Quitamos espacios duplicados y espacios al principio/final si los hubiera
*    CONDENSE lv_string.
*
*    " Declaramos variables para almacenar cada nombre individualmente
*    DATA: lv_nombre1 TYPE string,
*          lv_nombre2 TYPE string,
*          lv_nombre3 TYPE string,
*          lv_nombre4 TYPE string,
*          lv_nombre5 TYPE string.
*
*    " Buscamos la posición del primer espacio
*    DATA(lv_pos1) = find( val = lv_string sub = | | ).
*
*    " Extraemos el primer nombre desde la posición 0 hasta antes del primer espacio
*    lv_nombre1 = substring( val = lv_string off = 0 len = lv_pos1 ).
*
*
*    " Obtenemos el resto de la cadena después del primer espacio
*    DATA(lv_rest1) = substring_after( val = lv_string sub = | | ).
*
*    " Buscamos el siguiente espacio en la nueva subcadena
*    DATA(lv_pos2) = find( val = lv_rest1 sub = | | ).
*
*    " Extraemos el segundo nombre
*    lv_nombre2 = substring( val = lv_rest1 off = 0 len = lv_pos2 ).
*
*    " Repetimos el proceso para extraer el tercer nombre
*    DATA(lv_rest2) = substring_after( val = lv_rest1 sub = | | ).
*    DATA(lv_pos3) = find( val = lv_rest2 sub = | | ).
*    lv_nombre3 = substring( val = lv_rest2 off = 0 len = lv_pos3 ).
*
*    " Repetimos el proceso para extraer el cuarto nombre
*    DATA(lv_rest3) = substring_after( val = lv_rest2 sub = | | ).
*    DATA(lv_pos4) = find( val = lv_rest3 sub = | | ).
*    lv_nombre4 = substring( val = lv_rest3 off = 0 len = lv_pos4 ).
*
*    " El quinto nombre es lo que queda después del último espacio
*    lv_nombre5 = substring_after( val = lv_rest3 sub = | | ).
*
*
*
*
*    Data(lv_numA) = strlen( lv_nombre1 ).
*    out->write( lv_numA ).
*
*    IF lv_numA >= 7.
*      out->write( 'Hola Fernando' ).
*    ELSE.
*      out->write( 'no es mayor que 7' ).
*    ENDIF.
*    out->write( lv_nombre1 ).
*
*    out->write( | | ).
*
*    Data(lv_numB) = strlen( lv_nombre2 ).
*    out->write( lv_numB ).
*    IF lv_numB >= 7.
*      out->write( 'Hola Fernando' ).
*    ELSE.
*      out->write( 'no es mayor que 7' ).
*    ENDIF.
*    out->write( lv_nombre2 ).
*
*    out->write( | | ).



*Data: lv_nombre TYPE string VALUE 'Daniel',
*lv_num1 type i value 5.
*lv_nombre = strlen( lv_nombre ).
*
*If lv_num1 + lv_num1 = 10.
*out->write( 'la suma es 10' ).
*endif.
*data(lv_p) = lv_nombre+0(1).
*"out->write( 'hemos logrado entrar' ).
*if lv_nombre+0(1) >= lv_nombre+0(1) .
*out->write( 'hemos logrado entrar' ).
*endif.

*
    " Declaramos la cadena original con los nombres separados por espacios
*    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.
*
*    " Quitamos espacios duplicados y espacios al principio/final si los hubiera
*    CONDENSE lv_string.
*
*    " Declaramos variables para almacenar cada nombre individualmente
*    DATA: lv_nombre1 TYPE string,
*          lv_nombre2 TYPE string,
*          lv_nombre3 TYPE string,
*          lv_nombre4 TYPE string,
*          lv_nombre5 TYPE string.
*
*    " Buscamos la posición del primer espacio
*    DATA(lv_pos1) = find( val = lv_string sub = | | ).
*
*    " Extraemos el primer nombre desde la posición 0 hasta antes del primer espacio
*    lv_nombre1 = substring( val = lv_string off = 0 len = lv_pos1 ).
*
*    " Obtenemos el resto de la cadena después del primer espacio
*    DATA(lv_rest1) = substring_after( val = lv_string sub = | | ).
*
*    " Buscamos el siguiente espacio en la nueva subcadena
*    DATA(lv_pos2) = find( val = lv_rest1 sub = | | ).
*
*    " Extraemos el segundo nombre
*    lv_nombre2 = substring( val = lv_rest1 off = 0 len = lv_pos2 ).
*
*    " Repetimos el proceso para extraer el tercer nombre
*    DATA(lv_rest2) = substring_after( val = lv_rest1 sub = | | ).
*    DATA(lv_pos3) = find( val = lv_rest2 sub = | | ).
*    lv_nombre3 = substring( val = lv_rest2 off = 0 len = lv_pos3 ).
*
*    " Repetimos el proceso para extraer el cuarto nombre
*    DATA(lv_rest3) = substring_after( val = lv_rest2 sub = | | ).
*    DATA(lv_pos4) = find( val = lv_rest3 sub = | | ).
*    lv_nombre4 = substring( val = lv_rest3 off = 0 len = lv_pos4 ).
*
*    " El quinto nombre es lo que queda después del último espacio
*    lv_nombre5 = substring_after( val = lv_rest3 sub = | | ).


    """""""""""""" SEGUNDA PARTE DEL EJERCICIO """"""""""""""""

*
*
*   " Declaramos la cadena original con los nombres separados por espacios
*    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.
*
*    " Quitamos espacios duplicados y espacios al principio/final si los hubiera
*    CONDENSE lv_string.
*
*    " Declaramos variables para almacenar cada nombre individualmente
*    DATA: lv_nombre1 TYPE string,
*          lv_nombre2 TYPE string,
*          lv_nombre3 TYPE string,
*          lv_nombre4 TYPE string,
*          lv_nombre5 TYPE string.
*
*    " Buscamos la posición del primer espacio
*    DATA(lv_pos1) = find( val = lv_string sub = | | ).
*
*    " Extraemos el primer nombre desde la posición 0 hasta antes del primer espacio
*    lv_nombre1 = substring( val = lv_string off = 0 len = lv_pos1 ).
*
*    " Obtenemos el resto de la cadena después del primer espacio
*    DATA(lv_rest1) = substring_after( val = lv_string sub = | | ).
*
*    " Buscamos el siguiente espacio en la nueva subcadena
*    DATA(lv_pos2) = find( val = lv_rest1 sub = | | ).
*
*    " Extraemos el segundo nombre
*    lv_nombre2 = substring( val = lv_rest1 off = 0 len = lv_pos2 ).
*
*    " Repetimos el proceso para extraer el tercer nombre
*    DATA(lv_rest2) = substring_after( val = lv_rest1 sub = | | ).
*    DATA(lv_pos3) = find( val = lv_rest2 sub = | | ).
*    lv_nombre3 = substring( val = lv_rest2 off = 0 len = lv_pos3 ).
*
*    " Repetimos el proceso para extraer el cuarto nombre
*    DATA(lv_rest3) = substring_after( val = lv_rest2 sub = | | ).
*    DATA(lv_pos4) = find( val = lv_rest3 sub = | | ).
*    lv_nombre4 = substring( val = lv_rest3 off = 0 len = lv_pos4 ).
*
*    " El quinto nombre es lo que queda después del último espacio
*    lv_nombre5 = substring_after( val = lv_rest3 sub = | | ).


    """""""""""""" SEGUNDA PARTE DEL EJERCICIO """"""""""""""""


*
**    " Seleccionamos un nombre a evaluar (en este caso, el primero: daniel)
*    DATA(lv_nombre) = lv_nombre5.
*
**    " Obtenemos su longitud
*    DATA(lv_longitud) = strlen( lv_nombre ).
*
*    " Evaluamos según la longitud del nombre
*    IF LV_LONGITUD >= 7.
*      " Si tiene más de 7 caracteres, asumimos que es Fernando
*        out->write( 'Hola Fernando' ).
*
*        ELSEIF lv_longitud = 6 and lv_nombre EQ 'daniel'.
*             out->write( 'Hola Daniel' ).
*      " Si tiene 6 caracteres puede ser Sergio o Daniel
*            ELSEIF lv_longitud = 6 and lv_nombre EQ 'Sergio'.
*                 out->write( 'Hola Sergio' ).
*                ELSEIF lv_longitud <> 6 and lv_nombre EQ 'Pedro'.
*                    out->write(  to_upper(  'Hola Pedro' ) ).
*                    ELSE. " lv_nombre <> 6 and lv_nombre = 'ramon'.
*                        out->write(  to_upper(  'Hola Ramón' ) ).
*
*        ENDIF.


**********************************************************************
    "SEGMENT ES COMO EL SPLIT PERO PARA UN VALOR EN UN APOSICIÓN DETERMINADA.

*        DATA(lv_string1) = 'El perro corre por el prado'.
*
*        split lv_string1 at | | into data(lv_palabra1) data(lv_palabra2) data(lv_palabra3) data(lv_palabra4)
*        data(lv_palabra5) data(lv_palabra6).
*        out->write(  lv_palabra3 ).
*
*        out->write(  | | ).
*
*        DATA(lv_palabra) = segment( val = lv_string1 index = 3 sep = | | ).
*        out->write(  lv_palabra ).

**********************************************************************
    "    INSERT

*    DATA: lv_var1 TYPE string VALUE '123cliente01',
*          lv_var2 TYPE string VALUE ` HOLA `.
*    DATA(lv_ins_string2) = insert( val = lv_var1 sub = lv_var2 off = 12 ).
*    out->write( lv_ins_string2 ).
*
*    DATA(lv_ins_string) = insert( val = '123cliente01' sub = 'HOLA' off = 3 ). " off dice la posición,  sub es lo que pondrá
*    out->write( lv_ins_string ).
*
*    DATA lv_ins_string3 TYPE string.
*    lv_ins_string3 = insert( val = '123cliente01' sub = 'HOLA' off = 3 ).
*    out->write( lv_ins_string3 ).
*    out->write( insert( val = '123cliente01' sub = 'HOLA' off = 3  ) ).


**********************************************************************
    " OVERLAY ES COMO EL INSERT PERO SUSUTITUYE CADENAS DE CARCATERES.

*       DATA: lv_var1 TYPE string VALUE '123cliente01',
*          lv_var2 TYPE string VALUE ` HOLA `,
*          lv_var3 TYPE string.
*
*
*         overlay lv_var1 with lv_var2 only '123cl'.
*          out->write( lv_var1 ).

**********************************************************************
" FIND ALL OCCURRENCES OF

*        DATA: lv_string_c TYPE string VALUE 'ERP ####### EL perro corre por el campo'.
*
*        find ALL OCCURRENCES OF '#' IN lv_string_c MATCH COUNT DATA(lv_count).
*
*        out->write( lv_count ).

**********************************************************************
"  ESCAPE

*        "url
*        DATA(lv_url) = escape( val = 'El perro correo por el campo.'  format = cl_abap_format=>e_url_full ).
*        out->write( lv_url ).
*
*        "json
*         DATA(lv_json) = escape( val = 'El perro correo por el campo.'  format = cl_abap_format=>e_json_string_nu ).
*        out->write( lv_json ).

**********************************************************************

DATA: lv_string TYPE string VALUE '1234',
      lv_int TYPE i.

      lv_int = lv_string.
      out->write(  lv_int ).


  ENDMETHOD.
ENDCLASS.
