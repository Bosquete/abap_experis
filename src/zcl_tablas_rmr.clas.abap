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

  TYPES:BEGIN OF ty_persona,
        nombre TYPE string,
        edad TYPE i,
        END OF TY_PERSONA.

   TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH empty key.

    DATA: lt_personas TYPE ty_tabla_personas,
          ls_persona TYPE ty_persona.

          ls_persona-nombre = 'Carlos'.
          ls_persona-edad   = 25.

     " out->write( lt_personas ).

        INSERT ls_persona INTO lt_personas INDEX 1.

        out->write( lt_personas ).

        ls_persona-nombre = 'María'.
          ls_persona-edad   = 30.

           INSERT ls_persona INTO lt_personas INDEX 2.

          out->write( lt_personas ).

           ls_persona-nombre = 'Pedro'.
          ls_persona-edad   = 31.

           INSERT ls_persona INTO lt_personas INDEX 3.


           LOOP AT lt_personas INTO ls_persona.

                    out->write( |Nombre: { ls_persona-nombre }, edad: { ls_persona-edad } | ).



               ENDLOOP.




  ENDMETHOD.
ENDCLASS.
