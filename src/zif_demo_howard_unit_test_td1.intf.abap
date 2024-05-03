INTERFACE zif_demo_howard_unit_test_td1
  PUBLIC .

  TYPES:
    BEGIN OF ty_data,
      full_name       TYPE string,
      customer_number TYPE n LENGTH 5,
      amount          TYPE i,
      date            TYPE d,
    END OF ty_data.

  TYPES: tt_data TYPE SORTED TABLE OF zif_demo_howard_unit_test_td1=>ty_data WITH UNIQUE KEY customer_number.

  METHODS:
    set_data
      IMPORTING
        VALUE(t_data) TYPE zif_demo_howard_unit_test_td1=>tt_data OPTIONAL,
    get_data
      RETURNING VALUE(rt_data) TYPE zif_demo_howard_unit_test_td1=>tt_data.

  METHODS:
    get_invoice_amount
      IMPORTING
        VALUE(customer_number) TYPE i
      RETURNING
        VALUE(result)          TYPE i.
ENDINTERFACE.
