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
      ?auto_1428 - PERSON
      ?auto_1427 - CITY
    )
    :vars
    (
      ?auto_1431 - FLEVEL
      ?auto_1430 - FLEVEL
      ?auto_1432 - CITY
      ?auto_1429 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1431 ?auto_1430 ) ( PERSON-AT ?auto_1428 ?auto_1432 ) ( AIRCRAFT-AT ?auto_1429 ?auto_1427 ) ( FUEL-LEVEL ?auto_1429 ?auto_1431 ) ( not ( = ?auto_1427 ?auto_1432 ) ) ( not ( = ?auto_1431 ?auto_1430 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1429 ?auto_1427 ?auto_1431 ?auto_1430 )
      ( !FLY ?auto_1429 ?auto_1427 ?auto_1432 ?auto_1430 ?auto_1431 )
      ( !REFUEL ?auto_1429 ?auto_1432 ?auto_1431 ?auto_1430 )
      ( !BOARD ?auto_1428 ?auto_1429 ?auto_1432 )
      ( !FLY ?auto_1429 ?auto_1432 ?auto_1427 ?auto_1430 ?auto_1431 )
      ( !DEBARK ?auto_1428 ?auto_1429 ?auto_1427 )
      ( FLY-1PPL-VERIFY ?auto_1428 ?auto_1427 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1451 - PERSON
      ?auto_1452 - PERSON
      ?auto_1450 - CITY
    )
    :vars
    (
      ?auto_1456 - FLEVEL
      ?auto_1454 - FLEVEL
      ?auto_1453 - CITY
      ?auto_1457 - CITY
      ?auto_1455 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1456 ?auto_1454 ) ( PERSON-AT ?auto_1452 ?auto_1453 ) ( not ( = ?auto_1450 ?auto_1453 ) ) ( not ( = ?auto_1456 ?auto_1454 ) ) ( PERSON-AT ?auto_1451 ?auto_1457 ) ( AIRCRAFT-AT ?auto_1455 ?auto_1450 ) ( FUEL-LEVEL ?auto_1455 ?auto_1456 ) ( not ( = ?auto_1450 ?auto_1457 ) ) ( not ( = ?auto_1451 ?auto_1452 ) ) ( not ( = ?auto_1453 ?auto_1457 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1451 ?auto_1450 )
      ( FLY-1PPL ?auto_1452 ?auto_1450 )
      ( FLY-2PPL-VERIFY ?auto_1451 ?auto_1452 ?auto_1450 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1566 - PERSON
      ?auto_1567 - PERSON
      ?auto_1568 - PERSON
      ?auto_1565 - CITY
    )
    :vars
    (
      ?auto_1569 - FLEVEL
      ?auto_1572 - FLEVEL
      ?auto_1570 - CITY
      ?auto_1574 - CITY
      ?auto_1573 - CITY
      ?auto_1571 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1569 ?auto_1572 ) ( PERSON-AT ?auto_1568 ?auto_1570 ) ( not ( = ?auto_1565 ?auto_1570 ) ) ( not ( = ?auto_1569 ?auto_1572 ) ) ( PERSON-AT ?auto_1567 ?auto_1574 ) ( not ( = ?auto_1565 ?auto_1574 ) ) ( PERSON-AT ?auto_1566 ?auto_1573 ) ( AIRCRAFT-AT ?auto_1571 ?auto_1565 ) ( FUEL-LEVEL ?auto_1571 ?auto_1569 ) ( not ( = ?auto_1565 ?auto_1573 ) ) ( not ( = ?auto_1566 ?auto_1567 ) ) ( not ( = ?auto_1574 ?auto_1573 ) ) ( not ( = ?auto_1566 ?auto_1568 ) ) ( not ( = ?auto_1567 ?auto_1568 ) ) ( not ( = ?auto_1570 ?auto_1574 ) ) ( not ( = ?auto_1570 ?auto_1573 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1566 ?auto_1567 ?auto_1565 )
      ( FLY-1PPL ?auto_1568 ?auto_1565 )
      ( FLY-3PPL-VERIFY ?auto_1566 ?auto_1567 ?auto_1568 ?auto_1565 ) )
  )

)

