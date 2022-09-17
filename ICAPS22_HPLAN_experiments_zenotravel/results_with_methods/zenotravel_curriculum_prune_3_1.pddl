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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_527 - PERSON
      ?auto_526 - CITY
    )
    :vars
    (
      ?auto_530 - FLEVEL
      ?auto_529 - FLEVEL
      ?auto_531 - CITY
      ?auto_528 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_530 ?auto_529 ) ( PERSON-AT ?auto_527 ?auto_531 ) ( AIRCRAFT-AT ?auto_528 ?auto_526 ) ( FUEL-LEVEL ?auto_528 ?auto_530 ) ( not ( = ?auto_526 ?auto_531 ) ) ( not ( = ?auto_530 ?auto_529 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_528 ?auto_526 ?auto_530 ?auto_529 )
      ( !FLY ?auto_528 ?auto_526 ?auto_531 ?auto_529 ?auto_530 )
      ( !REFUEL ?auto_528 ?auto_531 ?auto_530 ?auto_529 )
      ( !BOARD ?auto_527 ?auto_528 ?auto_531 )
      ( !FLY ?auto_528 ?auto_531 ?auto_526 ?auto_529 ?auto_530 )
      ( !DEBARK ?auto_527 ?auto_528 ?auto_526 )
      ( FLY-1PPL-VERIFY ?auto_527 ?auto_526 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_550 - PERSON
      ?auto_551 - PERSON
      ?auto_549 - CITY
    )
    :vars
    (
      ?auto_553 - FLEVEL
      ?auto_554 - FLEVEL
      ?auto_555 - CITY
      ?auto_556 - CITY
      ?auto_552 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_553 ?auto_554 ) ( PERSON-AT ?auto_551 ?auto_555 ) ( not ( = ?auto_549 ?auto_555 ) ) ( not ( = ?auto_553 ?auto_554 ) ) ( PERSON-AT ?auto_550 ?auto_556 ) ( AIRCRAFT-AT ?auto_552 ?auto_549 ) ( FUEL-LEVEL ?auto_552 ?auto_553 ) ( not ( = ?auto_549 ?auto_556 ) ) ( not ( = ?auto_550 ?auto_551 ) ) ( not ( = ?auto_555 ?auto_556 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_550 ?auto_549 )
      ( FLY-1PPL ?auto_551 ?auto_549 )
      ( FLY-2PPL-VERIFY ?auto_550 ?auto_551 ?auto_549 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_664 - PERSON
      ?auto_665 - PERSON
      ?auto_666 - PERSON
      ?auto_663 - CITY
    )
    :vars
    (
      ?auto_667 - FLEVEL
      ?auto_670 - FLEVEL
      ?auto_669 - CITY
      ?auto_671 - CITY
      ?auto_668 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_667 ?auto_670 ) ( PERSON-AT ?auto_666 ?auto_669 ) ( not ( = ?auto_663 ?auto_669 ) ) ( not ( = ?auto_667 ?auto_670 ) ) ( PERSON-AT ?auto_665 ?auto_669 ) ( PERSON-AT ?auto_664 ?auto_671 ) ( AIRCRAFT-AT ?auto_668 ?auto_663 ) ( FUEL-LEVEL ?auto_668 ?auto_667 ) ( not ( = ?auto_663 ?auto_671 ) ) ( not ( = ?auto_664 ?auto_665 ) ) ( not ( = ?auto_669 ?auto_671 ) ) ( not ( = ?auto_664 ?auto_666 ) ) ( not ( = ?auto_665 ?auto_666 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_664 ?auto_665 ?auto_663 )
      ( FLY-1PPL ?auto_666 ?auto_663 )
      ( FLY-3PPL-VERIFY ?auto_664 ?auto_665 ?auto_666 ?auto_663 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_697 - PERSON
      ?auto_698 - PERSON
      ?auto_699 - PERSON
      ?auto_696 - CITY
    )
    :vars
    (
      ?auto_703 - FLEVEL
      ?auto_700 - FLEVEL
      ?auto_702 - CITY
      ?auto_704 - CITY
      ?auto_701 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_703 ?auto_700 ) ( PERSON-AT ?auto_699 ?auto_702 ) ( not ( = ?auto_696 ?auto_702 ) ) ( not ( = ?auto_703 ?auto_700 ) ) ( PERSON-AT ?auto_697 ?auto_702 ) ( PERSON-AT ?auto_698 ?auto_704 ) ( AIRCRAFT-AT ?auto_701 ?auto_696 ) ( FUEL-LEVEL ?auto_701 ?auto_703 ) ( not ( = ?auto_696 ?auto_704 ) ) ( not ( = ?auto_698 ?auto_697 ) ) ( not ( = ?auto_702 ?auto_704 ) ) ( not ( = ?auto_698 ?auto_699 ) ) ( not ( = ?auto_697 ?auto_699 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_698 ?auto_697 ?auto_699 ?auto_696 )
      ( FLY-3PPL-VERIFY ?auto_697 ?auto_698 ?auto_699 ?auto_696 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_716 - PERSON
      ?auto_717 - PERSON
      ?auto_718 - PERSON
      ?auto_715 - CITY
    )
    :vars
    (
      ?auto_721 - FLEVEL
      ?auto_719 - FLEVEL
      ?auto_720 - CITY
      ?auto_722 - CITY
      ?auto_723 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_721 ?auto_719 ) ( PERSON-AT ?auto_717 ?auto_720 ) ( not ( = ?auto_715 ?auto_720 ) ) ( not ( = ?auto_721 ?auto_719 ) ) ( PERSON-AT ?auto_716 ?auto_720 ) ( PERSON-AT ?auto_718 ?auto_722 ) ( AIRCRAFT-AT ?auto_723 ?auto_715 ) ( FUEL-LEVEL ?auto_723 ?auto_721 ) ( not ( = ?auto_715 ?auto_722 ) ) ( not ( = ?auto_718 ?auto_716 ) ) ( not ( = ?auto_720 ?auto_722 ) ) ( not ( = ?auto_718 ?auto_717 ) ) ( not ( = ?auto_716 ?auto_717 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_716 ?auto_718 ?auto_717 ?auto_715 )
      ( FLY-3PPL-VERIFY ?auto_716 ?auto_717 ?auto_718 ?auto_715 ) )
  )

)

