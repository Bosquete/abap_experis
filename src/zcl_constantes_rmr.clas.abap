CLASS zcl_constantes_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_constantes_rmr IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

 CONSTANTS: lc_pais TYPE STRING VALUE 'España',
            lc_moneda TYPE string VALUE 'EUR',
            lc_ahorros type i value 10,
            lc_iva TYPE P DECIMALS 4 VALUE '21.00'.


      data: LV_TOTAL_AHORROS type i,
            lv_ahorros2 type i value 9.


      lv_total_ahorros = lc_ahorros + lv_ahorros2.



      out->write( lv_total_ahorros ).

      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      "EJERCICIO 1 - ÁREA DE UN CÍRCULO: DECLARA UNA CONSTANTE QUE REPRESNTE EL NÚMERO PI (3.14) Y UNA VARIABLE ENTERA QUE ALAMAENE EL RADIO DE UN CÍRCULO

      CONSTANTS: LC_PI TYPE P DECIMALS 2 VALUE '3.14'.
      DATA: LV_AREA TYPE P DECIMALS 2,
            LV_RADIO TYPE P DECIMALS 2 value 5.



           LV_AREA = LC_PI * LV_RADIO ** 2.
           "lv_area = lc_pi ** lv_radio.
           out->write( lv_area ).


           OUT->WRITE(  LV_AREA ).
           out->write( | el valor de radio es { lv_radio } y el área es  { lv_area }.| ).





endmethod.

ENDCLASS.
