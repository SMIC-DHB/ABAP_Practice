INTERFACE zif_demo_howard_unit_test
  PUBLIC .
  TYPES
    ty_year TYPE n LENGTH 4.

  METHODS:
    add_by_three
      IMPORTING
        VALUE(number) TYPE i
      RETURNING
        VALUE(result) TYPE i.

  METHODS
    determine_if_leap_year
      IMPORTING
        VALUE(year)        TYPE ty_year
      RETURNING
        VALUE(is_leapyear) TYPE abap_bool.

ENDINTERFACE.
