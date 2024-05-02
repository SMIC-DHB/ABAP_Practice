CLASS ltc_demo_howard_unit_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      verify_add_by_3 FOR TESTING RAISING cx_static_check.

    METHODS:
      verify_if_leap_year FOR TESTING RAISING cx_static_check.
    METHODS:
      setup,
      teardown.

    DATA cut TYPE REF TO zcl_demo_howard_unit_test.
ENDCLASS.


CLASS ltc_demo_howard_unit_test IMPLEMENTATION.

  METHOD verify_add_by_3.
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~add_by_three( 5 ) exp = 8 ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~add_by_three( 15 ) exp = 18 ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~add_by_three( 17 ) exp = 20 ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~add_by_three( 100 ) exp = 103 ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~add_by_three( 0 ) exp = 3 ).
  ENDMETHOD.

  METHOD verify_if_leap_year.
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~determine_if_leap_year( 1997 ) exp = abap_false ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~determine_if_leap_year( 1900 ) exp = abap_false ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~determine_if_leap_year( 1999 ) exp = abap_false ).

    "is true
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~determine_if_leap_year( 2000 ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~determine_if_leap_year( 2004 ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = cut->zif_demo_howard_unit_test~determine_if_leap_year( 2020 ) exp = abap_true ).
  ENDMETHOD.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR cut.
  ENDMETHOD.



ENDCLASS.
