CLASS ltc_demo_howard_unit_test_td1 DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA: cut TYPE REF TO zif_demo_howard_unit_test_td1.
    DATA: double_unit TYPE REF TO zif_demo_howard_unit_test.

    METHODS:
      invoice_amount FOR TESTING RAISING cx_static_check.

    METHODS:
      setup,
      teardown.
ENDCLASS.


CLASS ltc_demo_howard_unit_test_td1 IMPLEMENTATION.

  METHOD setup.

    "Create instance of double
    double_unit ?= cl_abap_testdouble=>create( 'zif_demo_howard_unit_test' ).

    "Setup return and other settings
    cl_abap_testdouble=>configure_call( double_unit
                          )->returning( 500
                          )->ignore_all_parameters( ).

    "Call method to be stub
    double_unit->get_combined_amount( initial_amount = 9999 date = '99990101' ).

    "Pass double unit thru injections
    cut = NEW zcl_demo_howard_unit_test_tddf( double_unit ).

    cut->set_data( VALUE #( ( customer_number = '00001' full_name = |Last Name#1 First Name#1| amount = 1000 date = '20000101' )
                            ( customer_number = '00002' full_name = |Last Name#2 First Name#2| amount = 2000 date = '19990101' ) ) ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR cut.
  ENDMETHOD.

  METHOD invoice_amount.
    cl_abap_unit_assert=>assert_equals( act = cut->get_invoice_amount( '00001' ) exp = 1500 ).  "From set Data 1000 + combined_amount(500) => 1500 "From TDD in setup
    cl_abap_unit_assert=>assert_equals( act = cut->get_invoice_amount( '00002' ) exp = 2500 ).  "From set Data 1000 + combined_amount(500) => 2500 "From TDD in setup
  ENDMETHOD.

ENDCLASS.
