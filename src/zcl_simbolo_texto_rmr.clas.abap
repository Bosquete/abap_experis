CLASS zcl_simbolo_texto_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SIMBOLO_TEXTO_RMR IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

out->write(  TEXT-001 ).
OUT->WRITE( 'MI PRIMER SÍMBOLO DE TEXTO'(001) ).

DATA lv_texto TYPE string.

lv_texto = ZCL_TEXTOS_RMR=>gc_label_usuario.
out->write( lv_texto ).



ENDMETHOD.
ENDCLASS.
