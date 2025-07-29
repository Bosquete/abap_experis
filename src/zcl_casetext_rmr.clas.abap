CLASS zcl_casetext_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_casetext_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



   DATA(lv_aleatorio) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  )
    min = 1
    max = 4 )->get_next(  ).

    data: lv_nombre1 type string value 'Daniel',
            lv_nombre2 type string value 'Pedro',
            lv_nombre3 type string value 'Diego',
            lv_nombre4 type string value 'Sara',
            lv_nombre type string.

     if lv_aleatorio = 1.
            lv_nombre = lv_nombre1.
            out->write( lv_aleatorio && | | && lv_nombre ).
     elseif lv_aleatorio = 2.
            lv_nombre = lv_nombre2.
            out->write( lv_aleatorio && | | &&  lv_nombre ).
     elseif lv_aleatorio = 3.
            lv_nombre = lv_nombre3.
            out->write( lv_aleatorio && | | &&  lv_nombre ).
      else.
            lv_nombre = lv_nombre4.
            out->write( lv_aleatorio && | | &&  lv_nombre ).
      endif.

       CASE lv_aleatorio.


       WHEN 1.

           OUT->WRITE( lv_nombre ).
            out->write( 'El número aleatorio que ha salido es ' && | | && lv_aleatorio ).

       WHEN 2.

             OUT->WRITE( lv_nombre ).
            out->write( | El número aleatorio que ha salido es { lv_aleatorio } | ).

       WHEN 3.

             OUT->WRITE( lv_nombre ).
            out->write( 'El número aleatorio que ha salido es ' && | | && lv_aleatorio ).


       WHEN OTHERS.

            OUT->WRITE( lv_nombre ).
            out->write( 'El número aleatorio que ha salido es ' && | | && lv_aleatorio ).


    ENDCASE.

  ENDMETHOD.
ENDCLASS.
