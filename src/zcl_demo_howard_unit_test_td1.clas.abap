CLASS zcl_demo_howard_unit_test_td1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES zif_demo_howard_unit_test_td1.

    METHODS
      constructor
        IMPORTING
          VALUE(io_combined_data) TYPE REF TO zif_demo_howard_unit_test OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA t_data TYPE zif_demo_howard_unit_test_td1=>tt_data.

    "Test Double via Constructor Injection
    DATA m_combined_data TYPE REF TO zif_demo_howard_unit_test.
ENDCLASS.

CLASS zcl_demo_howard_unit_test_td1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(cut) = NEW zcl_demo_howard_unit_test_td1( ).
    cut->zif_demo_howard_unit_test_td1~set_data( ).
    DATA(invoice_amount) = cut->zif_demo_howard_unit_test_td1~get_invoice_amount( '00001' ).
    out->write( |Invoice amount for customer { '00001' } is equal to { cut->zif_demo_howard_unit_test_td1~get_invoice_amount( '00001' ) }| ).
    out->write( |Invoice amount for customer { '00002' } is equal to { cut->zif_demo_howard_unit_test_td1~get_invoice_amount( '00002' ) }| ).
  ENDMETHOD.

  METHOD constructor.
    m_combined_data = COND #( WHEN io_combined_data IS BOUND THEN io_combined_data
                              ELSE NEW zcl_demo_howard_unit_test( ) ).
  ENDMETHOD.

  METHOD zif_demo_howard_unit_test_td1~set_data.
    me->t_data = VALUE #( ( customer_number = '00001' full_name = |Last Name#1 First Name#1| amount = 1000 date = '20000101' )
                          ( customer_number = '00002' full_name = |Last Name#2 First Name#2| amount = 2000 date = '19990101' ) ).
  ENDMETHOD.

  METHOD zif_demo_howard_unit_test_td1~get_data.
    "In on premise used standard tables
    rt_data = CORRESPONDING #( me->t_data ).
  ENDMETHOD.

  METHOD zif_demo_howard_unit_test_td1~get_invoice_amount.
    FINAL(customer_datas) = me->zif_demo_howard_unit_test_td1~get_data( ).

    TRY.
        FINAL(customer_data) = customer_datas[ customer_number = customer_number ].
      CATCH cx_sy_itab_line_not_found.
        "Customer not found
    ENDTRY.

    result = m_combined_data->get_combined_amount( date = customer_data-date initial_amount = customer_data-amount )
             + customer_data-amount.
  ENDMETHOD.
ENDCLASS.
