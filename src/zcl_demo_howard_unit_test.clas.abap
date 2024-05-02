CLASS zcl_demo_howard_unit_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES zif_demo_howard_unit_test.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_howard_unit_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(cut) = CAST zif_demo_howard_unit_test( NEW zcl_demo_howard_unit_test( ) ).

    DATA(result_8) = cut->add_by_three( 5 ).
    out->write( |Result is { result_8 }| ).

    DATA(not_leap_1997) = cut->determine_if_leap_year( 1997 ).
    out->write( |1997 is { COND string( WHEN not_leap_1997 = abap_true THEN |a| ELSE |not a| ) } leap year | ).

    DATA(not_leap_1990) = cut->determine_if_leap_year( 1990 ).
    out->write( |1990 is { COND string( WHEN not_leap_1990 = abap_true THEN |a| ELSE |not a| ) } leap year | ).

    DATA(leap_2000) = cut->determine_if_leap_year( 2000 ).
    out->write( |2000 is { COND string( WHEN leap_2000 = abap_true THEN |a| ELSE |not a| ) } leap year | ).

  ENDMETHOD.

  METHOD zif_demo_howard_unit_test~add_by_three.
    result = number + 3.
*    RETURN number + 3.
  ENDMETHOD.

  METHOD zif_demo_howard_unit_test~determine_if_leap_year.
*    is_leapyear = COND #( WHEN ( year MOD 4 = 0 AND year MOD 100 <> 0 ) OR year MOD 400 = 0 THEN abap_true
*                          ELSE abap_false ).

    is_leapyear = COND #( WHEN year MOD 4 = 0 AND year MOD 100 <> 0 THEN abap_true
                          WHEN year MOD 100 = 0 AND year MOD 400 = 0 THEN abap_true
                          ELSE abap_false ).
  ENDMETHOD.

ENDCLASS.
