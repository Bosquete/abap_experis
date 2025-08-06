CLASS zcl_ejer_bibliolib_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejer_bibliolib_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES:BEGIN OF ty_libro,
        titulo TYPE string,
        autor  TYPE string,
        pags   TYPE i,
        END OF ty_libro.

    "DATA: ls_libro TYPE ty_libro.

    TYPES: ty_tabla_libros TYPE STANDARD TABLE OF ty_libro WITH EMPTY KEY.

    DATA: lt_libros type ty_tabla_libros,
          ls_libro type ty_libro.

    ls_libro = value #(  titulo = 'EL Quijote' autor = 'Cervantes' pags = 2000 ).
    INSERT ls_libro INTO lt_libros INDEX 1.


    LOOP AT lt_libros INTO ls_libro.
    if ls_libro-pags < 150.
    out->write(  |libro corto: { ls_libro-titulo } | ).
    elseif ls_libro-pags > 500.
    out->write(  |libro largo: { ls_libro-titulo } | ).
    else.
    out->write(  |libro estándar: { ls_libro-titulo } | ).

    endif.

    endloop.

    out->write(  |\n| ).

    out->write(  lt_libros ).

    out->write(  |\n| ).

    out->write( data = lt_libros name = 'CAtálogo completo de libros' ).



  ENDMETHOD.
ENDCLASS.
