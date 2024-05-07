CLASS ltd_combined_data DEFINITION FOR TESTING.
  PUBLIC SECTION.
    INTERFACES: zif_demo_howard_unit_test PARTIALLY IMPLEMENTED.
ENDCLASS.

CLASS ltd_combined_data IMPLEMENTATION.
  METHOD zif_demo_howard_unit_test~get_combined_amount.
    result = 999.
  ENDMETHOD.
ENDCLASS.

CLASS ltc_demo_howard_unit_test_td1 DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA: cut TYPE REF TO zif_demo_howard_unit_test_td1.

    METHODS:
      invoice_amount FOR TESTING RAISING cx_static_check.

    METHODS:
      setup,
      teardown.
ENDCLASS.


CLASS ltc_demo_howard_unit_test_td1 IMPLEMENTATION.

  METHOD setup.
    DATA(combined_provider) = NEW ltd_combined_data( ).
    cut = NEW zcl_demo_howard_unit_test_td1( combined_provider ).
    cut->set_data( VALUE #( ( customer_number = '00001' full_name = |Last Name#1 First Name#1| amount = 1000 date = '20000101' )
                            ( customer_number = '00002' full_name = |Last Name#2 First Name#2| amount = 2000 date = '19990101' ) ) ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR cut.
  ENDMETHOD.

  METHOD invoice_amount.
    cl_abap_unit_assert=>assert_equals( act = cut->get_invoice_amount( '00001' ) exp = 1999 ).  "From set Data 1000 + combined_amount(999) => 1999
    cl_abap_unit_assert=>assert_equals( act = cut->get_invoice_amount( '00002' ) exp = 2999 ).  "From set Data 1000 + combined_amount(999) => 2999
  ENDMETHOD.



ENDCLASS.
