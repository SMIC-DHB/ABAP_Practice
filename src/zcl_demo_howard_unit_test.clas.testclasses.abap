CLASS ltc_demo_howard_unit_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      verify_add_by_3 FOR TESTING RAISING cx_static_check.

    METHODS:
      verify_if_leap_year FOR TESTING RAISING cx_static_check,
      verify_if_not_leap_year FOR TESTING RAISING cx_static_check.

    METHODS:
      verify_discount_by_10 FOR TESTING RAISING cx_static_check,
      verify_discount_by_20 FOR TESTING RAISING cx_static_check.

    METHODS:
      verify_combined_amount_leap FOR TESTING RAISING cx_static_check,
      verify_combined_amount_notleap FOR TESTING RAISING cx_static_check.

    METHODS:
      setup,
      teardown.

    DATA cut TYPE REF TO zif_demo_howard_unit_test.
ENDCLASS.


CLASS ltc_demo_howard_unit_test IMPLEMENTATION.

  METHOD verify_add_by_3.
    cl_abap_unit_assert=>assert_equals( act = cut->add_by_three( 5 ) exp = 8 ).
    cl_abap_unit_assert=>assert_equals( act = cut->add_by_three( 15 ) exp = 18 ).
    cl_abap_unit_assert=>assert_equals( act = cut->add_by_three( 17 ) exp = 20 ).
    cl_abap_unit_assert=>assert_equals( act = cut->add_by_three( 100 ) exp = 103 ).
    cl_abap_unit_assert=>assert_equals( act = cut->add_by_three( 0 ) exp = 3 ).
  ENDMETHOD.

  METHOD verify_if_leap_year.
    cl_abap_unit_assert=>assert_equals( act = cut->determine_if_leap_year( 2000 ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = cut->determine_if_leap_year( 2004 ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = cut->determine_if_leap_year( 2020 ) exp = abap_true ).
  ENDMETHOD.


  METHOD verify_if_not_leap_year.
    cl_abap_unit_assert=>assert_false( act = cut->determine_if_leap_year( 1997 ) ).
    cl_abap_unit_assert=>assert_false( act = cut->determine_if_leap_year( 1900 ) ).
    cl_abap_unit_assert=>assert_false( act = cut->determine_if_leap_year( 1999 ) ).
  ENDMETHOD.

  METHOD verify_discount_by_10.
    cl_abap_unit_assert=>assert_equals( act = cut->discount_by_10( 100 ) exp = 90 ).
    cl_abap_unit_assert=>assert_equals( act = cut->discount_by_10( 150 ) exp = 135 ).
    cl_abap_unit_assert=>assert_equals( act = cut->discount_by_10( 200 ) exp = 180 ).
  ENDMETHOD.

  METHOD verify_discount_by_20.
    cl_abap_unit_assert=>assert_equals( act = cut->discount_by_20( 100 ) exp = 80 ).
    cl_abap_unit_assert=>assert_equals( act = cut->discount_by_20( 150 ) exp = 120 ).
    cl_abap_unit_assert=>assert_equals( act = cut->discount_by_20( 200 ) exp = 160 ).
  ENDMETHOD.

  METHOD verify_combined_amount_leap.
    cl_abap_unit_assert=>assert_equals( act = cut->get_combined_amount( initial_amount = 100
                                                                                                  date = '20000101' ) exp = 183 ). "103 + 80

    cl_abap_unit_assert=>assert_equals( act = cut->get_combined_amount( initial_amount = 1000
                                                                                                  date = '20000101' ) exp = 1803 ). "1003 + 800
  ENDMETHOD.

  METHOD verify_combined_amount_notleap.
    cl_abap_unit_assert=>assert_equals( act = cut->get_combined_amount( initial_amount = 100
                                                                                                  date = '19970101' ) exp = 193 ). "103 + 90

    cl_abap_unit_assert=>assert_equals( act = cut->get_combined_amount( initial_amount = 2000
                                                                                                  date = '19990101' ) exp = 3803 ). "2003 + 1800
  ENDMETHOD.

  METHOD setup.
    cut = NEW zcl_demo_howard_unit_test( ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR cut.
  ENDMETHOD.

ENDCLASS.
