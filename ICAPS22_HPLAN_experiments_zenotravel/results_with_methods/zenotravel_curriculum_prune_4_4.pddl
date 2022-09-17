( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14457 - PERSON
      ?auto_14456 - CITY
    )
    :vars
    (
      ?auto_14460 - FLEVEL
      ?auto_14459 - FLEVEL
      ?auto_14461 - CITY
      ?auto_14458 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14460 ?auto_14459 ) ( PERSON-AT ?auto_14457 ?auto_14461 ) ( AIRCRAFT-AT ?auto_14458 ?auto_14456 ) ( FUEL-LEVEL ?auto_14458 ?auto_14460 ) ( not ( = ?auto_14456 ?auto_14461 ) ) ( not ( = ?auto_14460 ?auto_14459 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_14458 ?auto_14456 ?auto_14460 ?auto_14459 )
      ( !FLY ?auto_14458 ?auto_14456 ?auto_14461 ?auto_14459 ?auto_14460 )
      ( !REFUEL ?auto_14458 ?auto_14461 ?auto_14460 ?auto_14459 )
      ( !BOARD ?auto_14457 ?auto_14458 ?auto_14461 )
      ( !FLY ?auto_14458 ?auto_14461 ?auto_14456 ?auto_14459 ?auto_14460 )
      ( !DEBARK ?auto_14457 ?auto_14458 ?auto_14456 )
      ( FLY-1PPL-VERIFY ?auto_14457 ?auto_14456 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14480 - PERSON
      ?auto_14481 - PERSON
      ?auto_14479 - CITY
    )
    :vars
    (
      ?auto_14483 - FLEVEL
      ?auto_14485 - FLEVEL
      ?auto_14482 - CITY
      ?auto_14484 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14483 ?auto_14485 ) ( PERSON-AT ?auto_14481 ?auto_14482 ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14483 ?auto_14485 ) ) ( PERSON-AT ?auto_14480 ?auto_14482 ) ( AIRCRAFT-AT ?auto_14484 ?auto_14479 ) ( FUEL-LEVEL ?auto_14484 ?auto_14483 ) ( not ( = ?auto_14480 ?auto_14481 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14480 ?auto_14479 )
      ( FLY-1PPL ?auto_14481 ?auto_14479 )
      ( FLY-2PPL-VERIFY ?auto_14480 ?auto_14481 ?auto_14479 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14592 - PERSON
      ?auto_14593 - PERSON
      ?auto_14594 - PERSON
      ?auto_14591 - CITY
    )
    :vars
    (
      ?auto_14596 - FLEVEL
      ?auto_14598 - FLEVEL
      ?auto_14597 - CITY
      ?auto_14599 - CITY
      ?auto_14595 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14596 ?auto_14598 ) ( PERSON-AT ?auto_14594 ?auto_14597 ) ( not ( = ?auto_14591 ?auto_14597 ) ) ( not ( = ?auto_14596 ?auto_14598 ) ) ( PERSON-AT ?auto_14593 ?auto_14599 ) ( not ( = ?auto_14591 ?auto_14599 ) ) ( PERSON-AT ?auto_14592 ?auto_14599 ) ( AIRCRAFT-AT ?auto_14595 ?auto_14591 ) ( FUEL-LEVEL ?auto_14595 ?auto_14596 ) ( not ( = ?auto_14592 ?auto_14593 ) ) ( not ( = ?auto_14592 ?auto_14594 ) ) ( not ( = ?auto_14593 ?auto_14594 ) ) ( not ( = ?auto_14597 ?auto_14599 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14592 ?auto_14593 ?auto_14591 )
      ( FLY-1PPL ?auto_14594 ?auto_14591 )
      ( FLY-3PPL-VERIFY ?auto_14592 ?auto_14593 ?auto_14594 ?auto_14591 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14611 - PERSON
      ?auto_14612 - PERSON
      ?auto_14613 - PERSON
      ?auto_14610 - CITY
    )
    :vars
    (
      ?auto_14617 - FLEVEL
      ?auto_14614 - FLEVEL
      ?auto_14616 - CITY
      ?auto_14615 - CITY
      ?auto_14618 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14617 ?auto_14614 ) ( PERSON-AT ?auto_14612 ?auto_14616 ) ( not ( = ?auto_14610 ?auto_14616 ) ) ( not ( = ?auto_14617 ?auto_14614 ) ) ( PERSON-AT ?auto_14613 ?auto_14615 ) ( not ( = ?auto_14610 ?auto_14615 ) ) ( PERSON-AT ?auto_14611 ?auto_14615 ) ( AIRCRAFT-AT ?auto_14618 ?auto_14610 ) ( FUEL-LEVEL ?auto_14618 ?auto_14617 ) ( not ( = ?auto_14611 ?auto_14613 ) ) ( not ( = ?auto_14611 ?auto_14612 ) ) ( not ( = ?auto_14613 ?auto_14612 ) ) ( not ( = ?auto_14616 ?auto_14615 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_14611 ?auto_14613 ?auto_14612 ?auto_14610 )
      ( FLY-3PPL-VERIFY ?auto_14611 ?auto_14612 ?auto_14613 ?auto_14610 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14678 - PERSON
      ?auto_14679 - PERSON
      ?auto_14680 - PERSON
      ?auto_14677 - CITY
    )
    :vars
    (
      ?auto_14683 - FLEVEL
      ?auto_14685 - FLEVEL
      ?auto_14682 - CITY
      ?auto_14684 - CITY
      ?auto_14681 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14683 ?auto_14685 ) ( PERSON-AT ?auto_14678 ?auto_14682 ) ( not ( = ?auto_14677 ?auto_14682 ) ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( PERSON-AT ?auto_14680 ?auto_14684 ) ( not ( = ?auto_14677 ?auto_14684 ) ) ( PERSON-AT ?auto_14679 ?auto_14684 ) ( AIRCRAFT-AT ?auto_14681 ?auto_14677 ) ( FUEL-LEVEL ?auto_14681 ?auto_14683 ) ( not ( = ?auto_14679 ?auto_14680 ) ) ( not ( = ?auto_14679 ?auto_14678 ) ) ( not ( = ?auto_14680 ?auto_14678 ) ) ( not ( = ?auto_14682 ?auto_14684 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_14679 ?auto_14678 ?auto_14680 ?auto_14677 )
      ( FLY-3PPL-VERIFY ?auto_14678 ?auto_14679 ?auto_14680 ?auto_14677 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_15737 - PERSON
      ?auto_15738 - PERSON
      ?auto_15739 - PERSON
      ?auto_15740 - PERSON
      ?auto_15736 - CITY
    )
    :vars
    (
      ?auto_15744 - FLEVEL
      ?auto_15742 - FLEVEL
      ?auto_15741 - CITY
      ?auto_15745 - CITY
      ?auto_15743 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15744 ?auto_15742 ) ( PERSON-AT ?auto_15740 ?auto_15741 ) ( not ( = ?auto_15736 ?auto_15741 ) ) ( not ( = ?auto_15744 ?auto_15742 ) ) ( PERSON-AT ?auto_15739 ?auto_15745 ) ( not ( = ?auto_15736 ?auto_15745 ) ) ( PERSON-AT ?auto_15738 ?auto_15741 ) ( PERSON-AT ?auto_15737 ?auto_15741 ) ( AIRCRAFT-AT ?auto_15743 ?auto_15736 ) ( FUEL-LEVEL ?auto_15743 ?auto_15744 ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15739 ) ) ( not ( = ?auto_15738 ?auto_15739 ) ) ( not ( = ?auto_15745 ?auto_15741 ) ) ( not ( = ?auto_15737 ?auto_15740 ) ) ( not ( = ?auto_15738 ?auto_15740 ) ) ( not ( = ?auto_15739 ?auto_15740 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_15737 ?auto_15739 ?auto_15738 ?auto_15736 )
      ( FLY-1PPL ?auto_15740 ?auto_15736 )
      ( FLY-4PPL-VERIFY ?auto_15737 ?auto_15738 ?auto_15739 ?auto_15740 ?auto_15736 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_15769 - PERSON
      ?auto_15770 - PERSON
      ?auto_15771 - PERSON
      ?auto_15772 - PERSON
      ?auto_15768 - CITY
    )
    :vars
    (
      ?auto_15777 - FLEVEL
      ?auto_15775 - FLEVEL
      ?auto_15774 - CITY
      ?auto_15773 - CITY
      ?auto_15776 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15777 ?auto_15775 ) ( PERSON-AT ?auto_15771 ?auto_15774 ) ( not ( = ?auto_15768 ?auto_15774 ) ) ( not ( = ?auto_15777 ?auto_15775 ) ) ( PERSON-AT ?auto_15772 ?auto_15773 ) ( not ( = ?auto_15768 ?auto_15773 ) ) ( PERSON-AT ?auto_15770 ?auto_15774 ) ( PERSON-AT ?auto_15769 ?auto_15774 ) ( AIRCRAFT-AT ?auto_15776 ?auto_15768 ) ( FUEL-LEVEL ?auto_15776 ?auto_15777 ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15772 ) ) ( not ( = ?auto_15770 ?auto_15772 ) ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15771 ) ) ( not ( = ?auto_15772 ?auto_15771 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_15769 ?auto_15770 ?auto_15772 ?auto_15771 ?auto_15768 )
      ( FLY-4PPL-VERIFY ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15768 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_15801 - PERSON
      ?auto_15802 - PERSON
      ?auto_15803 - PERSON
      ?auto_15804 - PERSON
      ?auto_15800 - CITY
    )
    :vars
    (
      ?auto_15807 - FLEVEL
      ?auto_15806 - FLEVEL
      ?auto_15805 - CITY
      ?auto_15809 - CITY
      ?auto_15808 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15807 ?auto_15806 ) ( PERSON-AT ?auto_15804 ?auto_15805 ) ( not ( = ?auto_15800 ?auto_15805 ) ) ( not ( = ?auto_15807 ?auto_15806 ) ) ( PERSON-AT ?auto_15802 ?auto_15809 ) ( not ( = ?auto_15800 ?auto_15809 ) ) ( PERSON-AT ?auto_15803 ?auto_15805 ) ( PERSON-AT ?auto_15801 ?auto_15805 ) ( AIRCRAFT-AT ?auto_15808 ?auto_15800 ) ( FUEL-LEVEL ?auto_15808 ?auto_15807 ) ( not ( = ?auto_15801 ?auto_15803 ) ) ( not ( = ?auto_15801 ?auto_15802 ) ) ( not ( = ?auto_15803 ?auto_15802 ) ) ( not ( = ?auto_15809 ?auto_15805 ) ) ( not ( = ?auto_15801 ?auto_15804 ) ) ( not ( = ?auto_15803 ?auto_15804 ) ) ( not ( = ?auto_15802 ?auto_15804 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_15801 ?auto_15803 ?auto_15804 ?auto_15802 ?auto_15800 )
      ( FLY-4PPL-VERIFY ?auto_15801 ?auto_15802 ?auto_15803 ?auto_15804 ?auto_15800 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16417 - PERSON
      ?auto_16418 - PERSON
      ?auto_16419 - PERSON
      ?auto_16420 - PERSON
      ?auto_16416 - CITY
    )
    :vars
    (
      ?auto_16423 - FLEVEL
      ?auto_16422 - FLEVEL
      ?auto_16421 - CITY
      ?auto_16425 - CITY
      ?auto_16424 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16423 ?auto_16422 ) ( PERSON-AT ?auto_16420 ?auto_16421 ) ( not ( = ?auto_16416 ?auto_16421 ) ) ( not ( = ?auto_16423 ?auto_16422 ) ) ( PERSON-AT ?auto_16417 ?auto_16425 ) ( not ( = ?auto_16416 ?auto_16425 ) ) ( PERSON-AT ?auto_16419 ?auto_16421 ) ( PERSON-AT ?auto_16418 ?auto_16421 ) ( AIRCRAFT-AT ?auto_16424 ?auto_16416 ) ( FUEL-LEVEL ?auto_16424 ?auto_16423 ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( not ( = ?auto_16418 ?auto_16417 ) ) ( not ( = ?auto_16419 ?auto_16417 ) ) ( not ( = ?auto_16425 ?auto_16421 ) ) ( not ( = ?auto_16418 ?auto_16420 ) ) ( not ( = ?auto_16419 ?auto_16420 ) ) ( not ( = ?auto_16417 ?auto_16420 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16418 ?auto_16419 ?auto_16420 ?auto_16417 ?auto_16416 )
      ( FLY-4PPL-VERIFY ?auto_16417 ?auto_16418 ?auto_16419 ?auto_16420 ?auto_16416 ) )
  )

)

