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

  ( :method FLY-5PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-6PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?p6 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) ( PERSON-AT ?p6 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1674336 - PERSON
      ?auto_1674335 - CITY
    )
    :vars
    (
      ?auto_1674339 - FLEVEL
      ?auto_1674338 - FLEVEL
      ?auto_1674340 - CITY
      ?auto_1674337 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1674339 ?auto_1674338 ) ( PERSON-AT ?auto_1674336 ?auto_1674340 ) ( AIRCRAFT-AT ?auto_1674337 ?auto_1674335 ) ( FUEL-LEVEL ?auto_1674337 ?auto_1674339 ) ( not ( = ?auto_1674335 ?auto_1674340 ) ) ( not ( = ?auto_1674339 ?auto_1674338 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1674337 ?auto_1674335 ?auto_1674339 ?auto_1674338 )
      ( !FLY ?auto_1674337 ?auto_1674335 ?auto_1674340 ?auto_1674338 ?auto_1674339 )
      ( !REFUEL ?auto_1674337 ?auto_1674340 ?auto_1674339 ?auto_1674338 )
      ( !BOARD ?auto_1674336 ?auto_1674337 ?auto_1674340 )
      ( !FLY ?auto_1674337 ?auto_1674340 ?auto_1674335 ?auto_1674338 ?auto_1674339 )
      ( !DEBARK ?auto_1674336 ?auto_1674337 ?auto_1674335 )
      ( FLY-1PPL-VERIFY ?auto_1674336 ?auto_1674335 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1674359 - PERSON
      ?auto_1674360 - PERSON
      ?auto_1674358 - CITY
    )
    :vars
    (
      ?auto_1674363 - FLEVEL
      ?auto_1674361 - FLEVEL
      ?auto_1674364 - CITY
      ?auto_1674365 - CITY
      ?auto_1674362 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1674363 ?auto_1674361 ) ( PERSON-AT ?auto_1674360 ?auto_1674364 ) ( not ( = ?auto_1674358 ?auto_1674364 ) ) ( not ( = ?auto_1674363 ?auto_1674361 ) ) ( PERSON-AT ?auto_1674359 ?auto_1674365 ) ( AIRCRAFT-AT ?auto_1674362 ?auto_1674358 ) ( FUEL-LEVEL ?auto_1674362 ?auto_1674363 ) ( not ( = ?auto_1674358 ?auto_1674365 ) ) ( not ( = ?auto_1674359 ?auto_1674360 ) ) ( not ( = ?auto_1674364 ?auto_1674365 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1674359 ?auto_1674358 )
      ( FLY-1PPL ?auto_1674360 ?auto_1674358 )
      ( FLY-2PPL-VERIFY ?auto_1674359 ?auto_1674360 ?auto_1674358 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1674474 - PERSON
      ?auto_1674475 - PERSON
      ?auto_1674476 - PERSON
      ?auto_1674473 - CITY
    )
    :vars
    (
      ?auto_1674477 - FLEVEL
      ?auto_1674480 - FLEVEL
      ?auto_1674478 - CITY
      ?auto_1674482 - CITY
      ?auto_1674481 - CITY
      ?auto_1674479 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1674477 ?auto_1674480 ) ( PERSON-AT ?auto_1674476 ?auto_1674478 ) ( not ( = ?auto_1674473 ?auto_1674478 ) ) ( not ( = ?auto_1674477 ?auto_1674480 ) ) ( PERSON-AT ?auto_1674475 ?auto_1674482 ) ( not ( = ?auto_1674473 ?auto_1674482 ) ) ( PERSON-AT ?auto_1674474 ?auto_1674481 ) ( AIRCRAFT-AT ?auto_1674479 ?auto_1674473 ) ( FUEL-LEVEL ?auto_1674479 ?auto_1674477 ) ( not ( = ?auto_1674473 ?auto_1674481 ) ) ( not ( = ?auto_1674474 ?auto_1674475 ) ) ( not ( = ?auto_1674482 ?auto_1674481 ) ) ( not ( = ?auto_1674474 ?auto_1674476 ) ) ( not ( = ?auto_1674475 ?auto_1674476 ) ) ( not ( = ?auto_1674478 ?auto_1674482 ) ) ( not ( = ?auto_1674478 ?auto_1674481 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1674474 ?auto_1674475 ?auto_1674473 )
      ( FLY-1PPL ?auto_1674476 ?auto_1674473 )
      ( FLY-3PPL-VERIFY ?auto_1674474 ?auto_1674475 ?auto_1674476 ?auto_1674473 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_1675640 - PERSON
      ?auto_1675641 - PERSON
      ?auto_1675642 - PERSON
      ?auto_1675643 - PERSON
      ?auto_1675639 - CITY
    )
    :vars
    (
      ?auto_1675646 - FLEVEL
      ?auto_1675644 - FLEVEL
      ?auto_1675647 - CITY
      ?auto_1675648 - CITY
      ?auto_1675649 - CITY
      ?auto_1675650 - CITY
      ?auto_1675645 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1675646 ?auto_1675644 ) ( PERSON-AT ?auto_1675643 ?auto_1675647 ) ( not ( = ?auto_1675639 ?auto_1675647 ) ) ( not ( = ?auto_1675646 ?auto_1675644 ) ) ( PERSON-AT ?auto_1675642 ?auto_1675648 ) ( not ( = ?auto_1675639 ?auto_1675648 ) ) ( PERSON-AT ?auto_1675641 ?auto_1675649 ) ( not ( = ?auto_1675639 ?auto_1675649 ) ) ( PERSON-AT ?auto_1675640 ?auto_1675650 ) ( AIRCRAFT-AT ?auto_1675645 ?auto_1675639 ) ( FUEL-LEVEL ?auto_1675645 ?auto_1675646 ) ( not ( = ?auto_1675639 ?auto_1675650 ) ) ( not ( = ?auto_1675640 ?auto_1675641 ) ) ( not ( = ?auto_1675649 ?auto_1675650 ) ) ( not ( = ?auto_1675640 ?auto_1675642 ) ) ( not ( = ?auto_1675641 ?auto_1675642 ) ) ( not ( = ?auto_1675648 ?auto_1675649 ) ) ( not ( = ?auto_1675648 ?auto_1675650 ) ) ( not ( = ?auto_1675640 ?auto_1675643 ) ) ( not ( = ?auto_1675641 ?auto_1675643 ) ) ( not ( = ?auto_1675642 ?auto_1675643 ) ) ( not ( = ?auto_1675647 ?auto_1675648 ) ) ( not ( = ?auto_1675647 ?auto_1675649 ) ) ( not ( = ?auto_1675647 ?auto_1675650 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1675640 ?auto_1675641 ?auto_1675642 ?auto_1675639 )
      ( FLY-1PPL ?auto_1675643 ?auto_1675639 )
      ( FLY-4PPL-VERIFY ?auto_1675640 ?auto_1675641 ?auto_1675642 ?auto_1675643 ?auto_1675639 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1691476 - PERSON
      ?auto_1691477 - PERSON
      ?auto_1691478 - PERSON
      ?auto_1691479 - PERSON
      ?auto_1691480 - PERSON
      ?auto_1691475 - CITY
    )
    :vars
    (
      ?auto_1691482 - FLEVEL
      ?auto_1691481 - FLEVEL
      ?auto_1691483 - CITY
      ?auto_1691485 - CITY
      ?auto_1691487 - CITY
      ?auto_1691486 - CITY
      ?auto_1691484 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1691482 ?auto_1691481 ) ( PERSON-AT ?auto_1691480 ?auto_1691483 ) ( not ( = ?auto_1691475 ?auto_1691483 ) ) ( not ( = ?auto_1691482 ?auto_1691481 ) ) ( PERSON-AT ?auto_1691479 ?auto_1691485 ) ( not ( = ?auto_1691475 ?auto_1691485 ) ) ( PERSON-AT ?auto_1691478 ?auto_1691487 ) ( not ( = ?auto_1691475 ?auto_1691487 ) ) ( PERSON-AT ?auto_1691477 ?auto_1691486 ) ( not ( = ?auto_1691475 ?auto_1691486 ) ) ( PERSON-AT ?auto_1691476 ?auto_1691483 ) ( AIRCRAFT-AT ?auto_1691484 ?auto_1691475 ) ( FUEL-LEVEL ?auto_1691484 ?auto_1691482 ) ( not ( = ?auto_1691476 ?auto_1691477 ) ) ( not ( = ?auto_1691486 ?auto_1691483 ) ) ( not ( = ?auto_1691476 ?auto_1691478 ) ) ( not ( = ?auto_1691477 ?auto_1691478 ) ) ( not ( = ?auto_1691487 ?auto_1691486 ) ) ( not ( = ?auto_1691487 ?auto_1691483 ) ) ( not ( = ?auto_1691476 ?auto_1691479 ) ) ( not ( = ?auto_1691477 ?auto_1691479 ) ) ( not ( = ?auto_1691478 ?auto_1691479 ) ) ( not ( = ?auto_1691485 ?auto_1691487 ) ) ( not ( = ?auto_1691485 ?auto_1691486 ) ) ( not ( = ?auto_1691485 ?auto_1691483 ) ) ( not ( = ?auto_1691476 ?auto_1691480 ) ) ( not ( = ?auto_1691477 ?auto_1691480 ) ) ( not ( = ?auto_1691478 ?auto_1691480 ) ) ( not ( = ?auto_1691479 ?auto_1691480 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_1691476 ?auto_1691477 ?auto_1691478 ?auto_1691479 ?auto_1691475 )
      ( FLY-1PPL ?auto_1691480 ?auto_1691475 )
      ( FLY-5PPL-VERIFY ?auto_1691476 ?auto_1691477 ?auto_1691478 ?auto_1691479 ?auto_1691480 ?auto_1691475 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1691531 - PERSON
      ?auto_1691532 - PERSON
      ?auto_1691533 - PERSON
      ?auto_1691534 - PERSON
      ?auto_1691535 - PERSON
      ?auto_1691530 - CITY
    )
    :vars
    (
      ?auto_1691542 - FLEVEL
      ?auto_1691539 - FLEVEL
      ?auto_1691536 - CITY
      ?auto_1691540 - CITY
      ?auto_1691541 - CITY
      ?auto_1691538 - CITY
      ?auto_1691537 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1691542 ?auto_1691539 ) ( PERSON-AT ?auto_1691534 ?auto_1691536 ) ( not ( = ?auto_1691530 ?auto_1691536 ) ) ( not ( = ?auto_1691542 ?auto_1691539 ) ) ( PERSON-AT ?auto_1691535 ?auto_1691540 ) ( not ( = ?auto_1691530 ?auto_1691540 ) ) ( PERSON-AT ?auto_1691533 ?auto_1691541 ) ( not ( = ?auto_1691530 ?auto_1691541 ) ) ( PERSON-AT ?auto_1691532 ?auto_1691538 ) ( not ( = ?auto_1691530 ?auto_1691538 ) ) ( PERSON-AT ?auto_1691531 ?auto_1691536 ) ( AIRCRAFT-AT ?auto_1691537 ?auto_1691530 ) ( FUEL-LEVEL ?auto_1691537 ?auto_1691542 ) ( not ( = ?auto_1691531 ?auto_1691532 ) ) ( not ( = ?auto_1691538 ?auto_1691536 ) ) ( not ( = ?auto_1691531 ?auto_1691533 ) ) ( not ( = ?auto_1691532 ?auto_1691533 ) ) ( not ( = ?auto_1691541 ?auto_1691538 ) ) ( not ( = ?auto_1691541 ?auto_1691536 ) ) ( not ( = ?auto_1691531 ?auto_1691535 ) ) ( not ( = ?auto_1691532 ?auto_1691535 ) ) ( not ( = ?auto_1691533 ?auto_1691535 ) ) ( not ( = ?auto_1691540 ?auto_1691541 ) ) ( not ( = ?auto_1691540 ?auto_1691538 ) ) ( not ( = ?auto_1691540 ?auto_1691536 ) ) ( not ( = ?auto_1691531 ?auto_1691534 ) ) ( not ( = ?auto_1691532 ?auto_1691534 ) ) ( not ( = ?auto_1691533 ?auto_1691534 ) ) ( not ( = ?auto_1691535 ?auto_1691534 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1691531 ?auto_1691532 ?auto_1691533 ?auto_1691535 ?auto_1691534 ?auto_1691530 )
      ( FLY-5PPL-VERIFY ?auto_1691531 ?auto_1691532 ?auto_1691533 ?auto_1691534 ?auto_1691535 ?auto_1691530 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1691856 - PERSON
      ?auto_1691857 - PERSON
      ?auto_1691858 - PERSON
      ?auto_1691859 - PERSON
      ?auto_1691860 - PERSON
      ?auto_1691855 - CITY
    )
    :vars
    (
      ?auto_1691865 - FLEVEL
      ?auto_1691861 - FLEVEL
      ?auto_1691862 - CITY
      ?auto_1691867 - CITY
      ?auto_1691864 - CITY
      ?auto_1691863 - CITY
      ?auto_1691866 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1691865 ?auto_1691861 ) ( PERSON-AT ?auto_1691858 ?auto_1691862 ) ( not ( = ?auto_1691855 ?auto_1691862 ) ) ( not ( = ?auto_1691865 ?auto_1691861 ) ) ( PERSON-AT ?auto_1691860 ?auto_1691867 ) ( not ( = ?auto_1691855 ?auto_1691867 ) ) ( PERSON-AT ?auto_1691859 ?auto_1691864 ) ( not ( = ?auto_1691855 ?auto_1691864 ) ) ( PERSON-AT ?auto_1691857 ?auto_1691863 ) ( not ( = ?auto_1691855 ?auto_1691863 ) ) ( PERSON-AT ?auto_1691856 ?auto_1691862 ) ( AIRCRAFT-AT ?auto_1691866 ?auto_1691855 ) ( FUEL-LEVEL ?auto_1691866 ?auto_1691865 ) ( not ( = ?auto_1691856 ?auto_1691857 ) ) ( not ( = ?auto_1691863 ?auto_1691862 ) ) ( not ( = ?auto_1691856 ?auto_1691859 ) ) ( not ( = ?auto_1691857 ?auto_1691859 ) ) ( not ( = ?auto_1691864 ?auto_1691863 ) ) ( not ( = ?auto_1691864 ?auto_1691862 ) ) ( not ( = ?auto_1691856 ?auto_1691860 ) ) ( not ( = ?auto_1691857 ?auto_1691860 ) ) ( not ( = ?auto_1691859 ?auto_1691860 ) ) ( not ( = ?auto_1691867 ?auto_1691864 ) ) ( not ( = ?auto_1691867 ?auto_1691863 ) ) ( not ( = ?auto_1691867 ?auto_1691862 ) ) ( not ( = ?auto_1691856 ?auto_1691858 ) ) ( not ( = ?auto_1691857 ?auto_1691858 ) ) ( not ( = ?auto_1691859 ?auto_1691858 ) ) ( not ( = ?auto_1691860 ?auto_1691858 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1691856 ?auto_1691857 ?auto_1691859 ?auto_1691858 ?auto_1691860 ?auto_1691855 )
      ( FLY-5PPL-VERIFY ?auto_1691856 ?auto_1691857 ?auto_1691858 ?auto_1691859 ?auto_1691860 ?auto_1691855 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1694229 - PERSON
      ?auto_1694230 - PERSON
      ?auto_1694231 - PERSON
      ?auto_1694232 - PERSON
      ?auto_1694233 - PERSON
      ?auto_1694228 - CITY
    )
    :vars
    (
      ?auto_1694238 - FLEVEL
      ?auto_1694234 - FLEVEL
      ?auto_1694235 - CITY
      ?auto_1694240 - CITY
      ?auto_1694237 - CITY
      ?auto_1694236 - CITY
      ?auto_1694239 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1694238 ?auto_1694234 ) ( PERSON-AT ?auto_1694230 ?auto_1694235 ) ( not ( = ?auto_1694228 ?auto_1694235 ) ) ( not ( = ?auto_1694238 ?auto_1694234 ) ) ( PERSON-AT ?auto_1694233 ?auto_1694240 ) ( not ( = ?auto_1694228 ?auto_1694240 ) ) ( PERSON-AT ?auto_1694232 ?auto_1694237 ) ( not ( = ?auto_1694228 ?auto_1694237 ) ) ( PERSON-AT ?auto_1694231 ?auto_1694236 ) ( not ( = ?auto_1694228 ?auto_1694236 ) ) ( PERSON-AT ?auto_1694229 ?auto_1694235 ) ( AIRCRAFT-AT ?auto_1694239 ?auto_1694228 ) ( FUEL-LEVEL ?auto_1694239 ?auto_1694238 ) ( not ( = ?auto_1694229 ?auto_1694231 ) ) ( not ( = ?auto_1694236 ?auto_1694235 ) ) ( not ( = ?auto_1694229 ?auto_1694232 ) ) ( not ( = ?auto_1694231 ?auto_1694232 ) ) ( not ( = ?auto_1694237 ?auto_1694236 ) ) ( not ( = ?auto_1694237 ?auto_1694235 ) ) ( not ( = ?auto_1694229 ?auto_1694233 ) ) ( not ( = ?auto_1694231 ?auto_1694233 ) ) ( not ( = ?auto_1694232 ?auto_1694233 ) ) ( not ( = ?auto_1694240 ?auto_1694237 ) ) ( not ( = ?auto_1694240 ?auto_1694236 ) ) ( not ( = ?auto_1694240 ?auto_1694235 ) ) ( not ( = ?auto_1694229 ?auto_1694230 ) ) ( not ( = ?auto_1694231 ?auto_1694230 ) ) ( not ( = ?auto_1694232 ?auto_1694230 ) ) ( not ( = ?auto_1694233 ?auto_1694230 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1694229 ?auto_1694231 ?auto_1694232 ?auto_1694230 ?auto_1694233 ?auto_1694228 )
      ( FLY-5PPL-VERIFY ?auto_1694229 ?auto_1694230 ?auto_1694231 ?auto_1694232 ?auto_1694233 ?auto_1694228 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1695754 - PERSON
      ?auto_1695755 - PERSON
      ?auto_1695756 - PERSON
      ?auto_1695757 - PERSON
      ?auto_1695758 - PERSON
      ?auto_1695753 - CITY
    )
    :vars
    (
      ?auto_1695763 - FLEVEL
      ?auto_1695759 - FLEVEL
      ?auto_1695760 - CITY
      ?auto_1695765 - CITY
      ?auto_1695762 - CITY
      ?auto_1695761 - CITY
      ?auto_1695764 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1695763 ?auto_1695759 ) ( PERSON-AT ?auto_1695758 ?auto_1695760 ) ( not ( = ?auto_1695753 ?auto_1695760 ) ) ( not ( = ?auto_1695763 ?auto_1695759 ) ) ( PERSON-AT ?auto_1695757 ?auto_1695765 ) ( not ( = ?auto_1695753 ?auto_1695765 ) ) ( PERSON-AT ?auto_1695756 ?auto_1695762 ) ( not ( = ?auto_1695753 ?auto_1695762 ) ) ( PERSON-AT ?auto_1695754 ?auto_1695761 ) ( not ( = ?auto_1695753 ?auto_1695761 ) ) ( PERSON-AT ?auto_1695755 ?auto_1695760 ) ( AIRCRAFT-AT ?auto_1695764 ?auto_1695753 ) ( FUEL-LEVEL ?auto_1695764 ?auto_1695763 ) ( not ( = ?auto_1695755 ?auto_1695754 ) ) ( not ( = ?auto_1695761 ?auto_1695760 ) ) ( not ( = ?auto_1695755 ?auto_1695756 ) ) ( not ( = ?auto_1695754 ?auto_1695756 ) ) ( not ( = ?auto_1695762 ?auto_1695761 ) ) ( not ( = ?auto_1695762 ?auto_1695760 ) ) ( not ( = ?auto_1695755 ?auto_1695757 ) ) ( not ( = ?auto_1695754 ?auto_1695757 ) ) ( not ( = ?auto_1695756 ?auto_1695757 ) ) ( not ( = ?auto_1695765 ?auto_1695762 ) ) ( not ( = ?auto_1695765 ?auto_1695761 ) ) ( not ( = ?auto_1695765 ?auto_1695760 ) ) ( not ( = ?auto_1695755 ?auto_1695758 ) ) ( not ( = ?auto_1695754 ?auto_1695758 ) ) ( not ( = ?auto_1695756 ?auto_1695758 ) ) ( not ( = ?auto_1695757 ?auto_1695758 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1695755 ?auto_1695754 ?auto_1695756 ?auto_1695758 ?auto_1695757 ?auto_1695753 )
      ( FLY-5PPL-VERIFY ?auto_1695754 ?auto_1695755 ?auto_1695756 ?auto_1695757 ?auto_1695758 ?auto_1695753 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1695809 - PERSON
      ?auto_1695810 - PERSON
      ?auto_1695811 - PERSON
      ?auto_1695812 - PERSON
      ?auto_1695813 - PERSON
      ?auto_1695808 - CITY
    )
    :vars
    (
      ?auto_1695818 - FLEVEL
      ?auto_1695814 - FLEVEL
      ?auto_1695815 - CITY
      ?auto_1695820 - CITY
      ?auto_1695817 - CITY
      ?auto_1695816 - CITY
      ?auto_1695819 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1695818 ?auto_1695814 ) ( PERSON-AT ?auto_1695812 ?auto_1695815 ) ( not ( = ?auto_1695808 ?auto_1695815 ) ) ( not ( = ?auto_1695818 ?auto_1695814 ) ) ( PERSON-AT ?auto_1695813 ?auto_1695820 ) ( not ( = ?auto_1695808 ?auto_1695820 ) ) ( PERSON-AT ?auto_1695811 ?auto_1695817 ) ( not ( = ?auto_1695808 ?auto_1695817 ) ) ( PERSON-AT ?auto_1695809 ?auto_1695816 ) ( not ( = ?auto_1695808 ?auto_1695816 ) ) ( PERSON-AT ?auto_1695810 ?auto_1695815 ) ( AIRCRAFT-AT ?auto_1695819 ?auto_1695808 ) ( FUEL-LEVEL ?auto_1695819 ?auto_1695818 ) ( not ( = ?auto_1695810 ?auto_1695809 ) ) ( not ( = ?auto_1695816 ?auto_1695815 ) ) ( not ( = ?auto_1695810 ?auto_1695811 ) ) ( not ( = ?auto_1695809 ?auto_1695811 ) ) ( not ( = ?auto_1695817 ?auto_1695816 ) ) ( not ( = ?auto_1695817 ?auto_1695815 ) ) ( not ( = ?auto_1695810 ?auto_1695813 ) ) ( not ( = ?auto_1695809 ?auto_1695813 ) ) ( not ( = ?auto_1695811 ?auto_1695813 ) ) ( not ( = ?auto_1695820 ?auto_1695817 ) ) ( not ( = ?auto_1695820 ?auto_1695816 ) ) ( not ( = ?auto_1695820 ?auto_1695815 ) ) ( not ( = ?auto_1695810 ?auto_1695812 ) ) ( not ( = ?auto_1695809 ?auto_1695812 ) ) ( not ( = ?auto_1695811 ?auto_1695812 ) ) ( not ( = ?auto_1695813 ?auto_1695812 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1695810 ?auto_1695809 ?auto_1695811 ?auto_1695812 ?auto_1695813 ?auto_1695808 )
      ( FLY-5PPL-VERIFY ?auto_1695809 ?auto_1695810 ?auto_1695811 ?auto_1695812 ?auto_1695813 ?auto_1695808 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1696134 - PERSON
      ?auto_1696135 - PERSON
      ?auto_1696136 - PERSON
      ?auto_1696137 - PERSON
      ?auto_1696138 - PERSON
      ?auto_1696133 - CITY
    )
    :vars
    (
      ?auto_1696143 - FLEVEL
      ?auto_1696139 - FLEVEL
      ?auto_1696140 - CITY
      ?auto_1696145 - CITY
      ?auto_1696142 - CITY
      ?auto_1696141 - CITY
      ?auto_1696144 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1696143 ?auto_1696139 ) ( PERSON-AT ?auto_1696136 ?auto_1696140 ) ( not ( = ?auto_1696133 ?auto_1696140 ) ) ( not ( = ?auto_1696143 ?auto_1696139 ) ) ( PERSON-AT ?auto_1696138 ?auto_1696145 ) ( not ( = ?auto_1696133 ?auto_1696145 ) ) ( PERSON-AT ?auto_1696137 ?auto_1696142 ) ( not ( = ?auto_1696133 ?auto_1696142 ) ) ( PERSON-AT ?auto_1696134 ?auto_1696141 ) ( not ( = ?auto_1696133 ?auto_1696141 ) ) ( PERSON-AT ?auto_1696135 ?auto_1696140 ) ( AIRCRAFT-AT ?auto_1696144 ?auto_1696133 ) ( FUEL-LEVEL ?auto_1696144 ?auto_1696143 ) ( not ( = ?auto_1696135 ?auto_1696134 ) ) ( not ( = ?auto_1696141 ?auto_1696140 ) ) ( not ( = ?auto_1696135 ?auto_1696137 ) ) ( not ( = ?auto_1696134 ?auto_1696137 ) ) ( not ( = ?auto_1696142 ?auto_1696141 ) ) ( not ( = ?auto_1696142 ?auto_1696140 ) ) ( not ( = ?auto_1696135 ?auto_1696138 ) ) ( not ( = ?auto_1696134 ?auto_1696138 ) ) ( not ( = ?auto_1696137 ?auto_1696138 ) ) ( not ( = ?auto_1696145 ?auto_1696142 ) ) ( not ( = ?auto_1696145 ?auto_1696141 ) ) ( not ( = ?auto_1696145 ?auto_1696140 ) ) ( not ( = ?auto_1696135 ?auto_1696136 ) ) ( not ( = ?auto_1696134 ?auto_1696136 ) ) ( not ( = ?auto_1696137 ?auto_1696136 ) ) ( not ( = ?auto_1696138 ?auto_1696136 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1696135 ?auto_1696134 ?auto_1696137 ?auto_1696136 ?auto_1696138 ?auto_1696133 )
      ( FLY-5PPL-VERIFY ?auto_1696134 ?auto_1696135 ?auto_1696136 ?auto_1696137 ?auto_1696138 ?auto_1696133 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1697242 - PERSON
      ?auto_1697243 - PERSON
      ?auto_1697244 - PERSON
      ?auto_1697245 - PERSON
      ?auto_1697246 - PERSON
      ?auto_1697241 - CITY
    )
    :vars
    (
      ?auto_1697251 - FLEVEL
      ?auto_1697247 - FLEVEL
      ?auto_1697248 - CITY
      ?auto_1697253 - CITY
      ?auto_1697250 - CITY
      ?auto_1697249 - CITY
      ?auto_1697252 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1697251 ?auto_1697247 ) ( PERSON-AT ?auto_1697246 ?auto_1697248 ) ( not ( = ?auto_1697241 ?auto_1697248 ) ) ( not ( = ?auto_1697251 ?auto_1697247 ) ) ( PERSON-AT ?auto_1697245 ?auto_1697253 ) ( not ( = ?auto_1697241 ?auto_1697253 ) ) ( PERSON-AT ?auto_1697243 ?auto_1697250 ) ( not ( = ?auto_1697241 ?auto_1697250 ) ) ( PERSON-AT ?auto_1697242 ?auto_1697249 ) ( not ( = ?auto_1697241 ?auto_1697249 ) ) ( PERSON-AT ?auto_1697244 ?auto_1697248 ) ( AIRCRAFT-AT ?auto_1697252 ?auto_1697241 ) ( FUEL-LEVEL ?auto_1697252 ?auto_1697251 ) ( not ( = ?auto_1697244 ?auto_1697242 ) ) ( not ( = ?auto_1697249 ?auto_1697248 ) ) ( not ( = ?auto_1697244 ?auto_1697243 ) ) ( not ( = ?auto_1697242 ?auto_1697243 ) ) ( not ( = ?auto_1697250 ?auto_1697249 ) ) ( not ( = ?auto_1697250 ?auto_1697248 ) ) ( not ( = ?auto_1697244 ?auto_1697245 ) ) ( not ( = ?auto_1697242 ?auto_1697245 ) ) ( not ( = ?auto_1697243 ?auto_1697245 ) ) ( not ( = ?auto_1697253 ?auto_1697250 ) ) ( not ( = ?auto_1697253 ?auto_1697249 ) ) ( not ( = ?auto_1697253 ?auto_1697248 ) ) ( not ( = ?auto_1697244 ?auto_1697246 ) ) ( not ( = ?auto_1697242 ?auto_1697246 ) ) ( not ( = ?auto_1697243 ?auto_1697246 ) ) ( not ( = ?auto_1697245 ?auto_1697246 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1697244 ?auto_1697242 ?auto_1697243 ?auto_1697246 ?auto_1697245 ?auto_1697241 )
      ( FLY-5PPL-VERIFY ?auto_1697242 ?auto_1697243 ?auto_1697244 ?auto_1697245 ?auto_1697246 ?auto_1697241 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1697297 - PERSON
      ?auto_1697298 - PERSON
      ?auto_1697299 - PERSON
      ?auto_1697300 - PERSON
      ?auto_1697301 - PERSON
      ?auto_1697296 - CITY
    )
    :vars
    (
      ?auto_1697306 - FLEVEL
      ?auto_1697302 - FLEVEL
      ?auto_1697303 - CITY
      ?auto_1697308 - CITY
      ?auto_1697305 - CITY
      ?auto_1697304 - CITY
      ?auto_1697307 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1697306 ?auto_1697302 ) ( PERSON-AT ?auto_1697300 ?auto_1697303 ) ( not ( = ?auto_1697296 ?auto_1697303 ) ) ( not ( = ?auto_1697306 ?auto_1697302 ) ) ( PERSON-AT ?auto_1697301 ?auto_1697308 ) ( not ( = ?auto_1697296 ?auto_1697308 ) ) ( PERSON-AT ?auto_1697298 ?auto_1697305 ) ( not ( = ?auto_1697296 ?auto_1697305 ) ) ( PERSON-AT ?auto_1697297 ?auto_1697304 ) ( not ( = ?auto_1697296 ?auto_1697304 ) ) ( PERSON-AT ?auto_1697299 ?auto_1697303 ) ( AIRCRAFT-AT ?auto_1697307 ?auto_1697296 ) ( FUEL-LEVEL ?auto_1697307 ?auto_1697306 ) ( not ( = ?auto_1697299 ?auto_1697297 ) ) ( not ( = ?auto_1697304 ?auto_1697303 ) ) ( not ( = ?auto_1697299 ?auto_1697298 ) ) ( not ( = ?auto_1697297 ?auto_1697298 ) ) ( not ( = ?auto_1697305 ?auto_1697304 ) ) ( not ( = ?auto_1697305 ?auto_1697303 ) ) ( not ( = ?auto_1697299 ?auto_1697301 ) ) ( not ( = ?auto_1697297 ?auto_1697301 ) ) ( not ( = ?auto_1697298 ?auto_1697301 ) ) ( not ( = ?auto_1697308 ?auto_1697305 ) ) ( not ( = ?auto_1697308 ?auto_1697304 ) ) ( not ( = ?auto_1697308 ?auto_1697303 ) ) ( not ( = ?auto_1697299 ?auto_1697300 ) ) ( not ( = ?auto_1697297 ?auto_1697300 ) ) ( not ( = ?auto_1697298 ?auto_1697300 ) ) ( not ( = ?auto_1697301 ?auto_1697300 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1697299 ?auto_1697297 ?auto_1697298 ?auto_1697300 ?auto_1697301 ?auto_1697296 )
      ( FLY-5PPL-VERIFY ?auto_1697297 ?auto_1697298 ?auto_1697299 ?auto_1697300 ?auto_1697301 ?auto_1697296 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_1697586 - PERSON
      ?auto_1697587 - PERSON
      ?auto_1697588 - PERSON
      ?auto_1697589 - PERSON
      ?auto_1697590 - PERSON
      ?auto_1697585 - CITY
    )
    :vars
    (
      ?auto_1697595 - FLEVEL
      ?auto_1697591 - FLEVEL
      ?auto_1697592 - CITY
      ?auto_1697597 - CITY
      ?auto_1697594 - CITY
      ?auto_1697593 - CITY
      ?auto_1697596 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1697595 ?auto_1697591 ) ( PERSON-AT ?auto_1697590 ?auto_1697592 ) ( not ( = ?auto_1697585 ?auto_1697592 ) ) ( not ( = ?auto_1697595 ?auto_1697591 ) ) ( PERSON-AT ?auto_1697588 ?auto_1697597 ) ( not ( = ?auto_1697585 ?auto_1697597 ) ) ( PERSON-AT ?auto_1697587 ?auto_1697594 ) ( not ( = ?auto_1697585 ?auto_1697594 ) ) ( PERSON-AT ?auto_1697586 ?auto_1697593 ) ( not ( = ?auto_1697585 ?auto_1697593 ) ) ( PERSON-AT ?auto_1697589 ?auto_1697592 ) ( AIRCRAFT-AT ?auto_1697596 ?auto_1697585 ) ( FUEL-LEVEL ?auto_1697596 ?auto_1697595 ) ( not ( = ?auto_1697589 ?auto_1697586 ) ) ( not ( = ?auto_1697593 ?auto_1697592 ) ) ( not ( = ?auto_1697589 ?auto_1697587 ) ) ( not ( = ?auto_1697586 ?auto_1697587 ) ) ( not ( = ?auto_1697594 ?auto_1697593 ) ) ( not ( = ?auto_1697594 ?auto_1697592 ) ) ( not ( = ?auto_1697589 ?auto_1697588 ) ) ( not ( = ?auto_1697586 ?auto_1697588 ) ) ( not ( = ?auto_1697587 ?auto_1697588 ) ) ( not ( = ?auto_1697597 ?auto_1697594 ) ) ( not ( = ?auto_1697597 ?auto_1697593 ) ) ( not ( = ?auto_1697597 ?auto_1697592 ) ) ( not ( = ?auto_1697589 ?auto_1697590 ) ) ( not ( = ?auto_1697586 ?auto_1697590 ) ) ( not ( = ?auto_1697587 ?auto_1697590 ) ) ( not ( = ?auto_1697588 ?auto_1697590 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1697589 ?auto_1697586 ?auto_1697587 ?auto_1697590 ?auto_1697588 ?auto_1697585 )
      ( FLY-5PPL-VERIFY ?auto_1697586 ?auto_1697587 ?auto_1697588 ?auto_1697589 ?auto_1697590 ?auto_1697585 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1951520 - PERSON
      ?auto_1951521 - PERSON
      ?auto_1951522 - PERSON
      ?auto_1951523 - PERSON
      ?auto_1951524 - PERSON
      ?auto_1951525 - PERSON
      ?auto_1951519 - CITY
    )
    :vars
    (
      ?auto_1951528 - FLEVEL
      ?auto_1951526 - FLEVEL
      ?auto_1951527 - CITY
      ?auto_1951530 - CITY
      ?auto_1951532 - CITY
      ?auto_1951531 - CITY
      ?auto_1951529 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1951528 ?auto_1951526 ) ( PERSON-AT ?auto_1951525 ?auto_1951527 ) ( not ( = ?auto_1951519 ?auto_1951527 ) ) ( not ( = ?auto_1951528 ?auto_1951526 ) ) ( PERSON-AT ?auto_1951524 ?auto_1951530 ) ( not ( = ?auto_1951519 ?auto_1951530 ) ) ( PERSON-AT ?auto_1951523 ?auto_1951527 ) ( PERSON-AT ?auto_1951522 ?auto_1951532 ) ( not ( = ?auto_1951519 ?auto_1951532 ) ) ( PERSON-AT ?auto_1951521 ?auto_1951531 ) ( not ( = ?auto_1951519 ?auto_1951531 ) ) ( PERSON-AT ?auto_1951520 ?auto_1951530 ) ( AIRCRAFT-AT ?auto_1951529 ?auto_1951519 ) ( FUEL-LEVEL ?auto_1951529 ?auto_1951528 ) ( not ( = ?auto_1951520 ?auto_1951521 ) ) ( not ( = ?auto_1951531 ?auto_1951530 ) ) ( not ( = ?auto_1951520 ?auto_1951522 ) ) ( not ( = ?auto_1951521 ?auto_1951522 ) ) ( not ( = ?auto_1951532 ?auto_1951531 ) ) ( not ( = ?auto_1951532 ?auto_1951530 ) ) ( not ( = ?auto_1951520 ?auto_1951523 ) ) ( not ( = ?auto_1951521 ?auto_1951523 ) ) ( not ( = ?auto_1951522 ?auto_1951523 ) ) ( not ( = ?auto_1951527 ?auto_1951532 ) ) ( not ( = ?auto_1951527 ?auto_1951531 ) ) ( not ( = ?auto_1951527 ?auto_1951530 ) ) ( not ( = ?auto_1951520 ?auto_1951524 ) ) ( not ( = ?auto_1951521 ?auto_1951524 ) ) ( not ( = ?auto_1951522 ?auto_1951524 ) ) ( not ( = ?auto_1951523 ?auto_1951524 ) ) ( not ( = ?auto_1951520 ?auto_1951525 ) ) ( not ( = ?auto_1951521 ?auto_1951525 ) ) ( not ( = ?auto_1951522 ?auto_1951525 ) ) ( not ( = ?auto_1951523 ?auto_1951525 ) ) ( not ( = ?auto_1951524 ?auto_1951525 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_1951520 ?auto_1951521 ?auto_1951522 ?auto_1951524 ?auto_1951523 ?auto_1951519 )
      ( FLY-1PPL ?auto_1951525 ?auto_1951519 )
      ( FLY-6PPL-VERIFY ?auto_1951520 ?auto_1951521 ?auto_1951522 ?auto_1951523 ?auto_1951524 ?auto_1951525 ?auto_1951519 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1951594 - PERSON
      ?auto_1951595 - PERSON
      ?auto_1951596 - PERSON
      ?auto_1951597 - PERSON
      ?auto_1951598 - PERSON
      ?auto_1951599 - PERSON
      ?auto_1951593 - CITY
    )
    :vars
    (
      ?auto_1951606 - FLEVEL
      ?auto_1951604 - FLEVEL
      ?auto_1951600 - CITY
      ?auto_1951603 - CITY
      ?auto_1951601 - CITY
      ?auto_1951605 - CITY
      ?auto_1951602 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1951606 ?auto_1951604 ) ( PERSON-AT ?auto_1951598 ?auto_1951600 ) ( not ( = ?auto_1951593 ?auto_1951600 ) ) ( not ( = ?auto_1951606 ?auto_1951604 ) ) ( PERSON-AT ?auto_1951599 ?auto_1951603 ) ( not ( = ?auto_1951593 ?auto_1951603 ) ) ( PERSON-AT ?auto_1951597 ?auto_1951600 ) ( PERSON-AT ?auto_1951596 ?auto_1951601 ) ( not ( = ?auto_1951593 ?auto_1951601 ) ) ( PERSON-AT ?auto_1951595 ?auto_1951605 ) ( not ( = ?auto_1951593 ?auto_1951605 ) ) ( PERSON-AT ?auto_1951594 ?auto_1951603 ) ( AIRCRAFT-AT ?auto_1951602 ?auto_1951593 ) ( FUEL-LEVEL ?auto_1951602 ?auto_1951606 ) ( not ( = ?auto_1951594 ?auto_1951595 ) ) ( not ( = ?auto_1951605 ?auto_1951603 ) ) ( not ( = ?auto_1951594 ?auto_1951596 ) ) ( not ( = ?auto_1951595 ?auto_1951596 ) ) ( not ( = ?auto_1951601 ?auto_1951605 ) ) ( not ( = ?auto_1951601 ?auto_1951603 ) ) ( not ( = ?auto_1951594 ?auto_1951597 ) ) ( not ( = ?auto_1951595 ?auto_1951597 ) ) ( not ( = ?auto_1951596 ?auto_1951597 ) ) ( not ( = ?auto_1951600 ?auto_1951601 ) ) ( not ( = ?auto_1951600 ?auto_1951605 ) ) ( not ( = ?auto_1951600 ?auto_1951603 ) ) ( not ( = ?auto_1951594 ?auto_1951599 ) ) ( not ( = ?auto_1951595 ?auto_1951599 ) ) ( not ( = ?auto_1951596 ?auto_1951599 ) ) ( not ( = ?auto_1951597 ?auto_1951599 ) ) ( not ( = ?auto_1951594 ?auto_1951598 ) ) ( not ( = ?auto_1951595 ?auto_1951598 ) ) ( not ( = ?auto_1951596 ?auto_1951598 ) ) ( not ( = ?auto_1951597 ?auto_1951598 ) ) ( not ( = ?auto_1951599 ?auto_1951598 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1951594 ?auto_1951595 ?auto_1951596 ?auto_1951597 ?auto_1951599 ?auto_1951598 ?auto_1951593 )
      ( FLY-6PPL-VERIFY ?auto_1951594 ?auto_1951595 ?auto_1951596 ?auto_1951597 ?auto_1951598 ?auto_1951599 ?auto_1951593 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1951668 - PERSON
      ?auto_1951669 - PERSON
      ?auto_1951670 - PERSON
      ?auto_1951671 - PERSON
      ?auto_1951672 - PERSON
      ?auto_1951673 - PERSON
      ?auto_1951667 - CITY
    )
    :vars
    (
      ?auto_1951674 - FLEVEL
      ?auto_1951679 - FLEVEL
      ?auto_1951678 - CITY
      ?auto_1951675 - CITY
      ?auto_1951676 - CITY
      ?auto_1951680 - CITY
      ?auto_1951677 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1951674 ?auto_1951679 ) ( PERSON-AT ?auto_1951673 ?auto_1951678 ) ( not ( = ?auto_1951667 ?auto_1951678 ) ) ( not ( = ?auto_1951674 ?auto_1951679 ) ) ( PERSON-AT ?auto_1951671 ?auto_1951675 ) ( not ( = ?auto_1951667 ?auto_1951675 ) ) ( PERSON-AT ?auto_1951672 ?auto_1951678 ) ( PERSON-AT ?auto_1951670 ?auto_1951676 ) ( not ( = ?auto_1951667 ?auto_1951676 ) ) ( PERSON-AT ?auto_1951669 ?auto_1951680 ) ( not ( = ?auto_1951667 ?auto_1951680 ) ) ( PERSON-AT ?auto_1951668 ?auto_1951675 ) ( AIRCRAFT-AT ?auto_1951677 ?auto_1951667 ) ( FUEL-LEVEL ?auto_1951677 ?auto_1951674 ) ( not ( = ?auto_1951668 ?auto_1951669 ) ) ( not ( = ?auto_1951680 ?auto_1951675 ) ) ( not ( = ?auto_1951668 ?auto_1951670 ) ) ( not ( = ?auto_1951669 ?auto_1951670 ) ) ( not ( = ?auto_1951676 ?auto_1951680 ) ) ( not ( = ?auto_1951676 ?auto_1951675 ) ) ( not ( = ?auto_1951668 ?auto_1951672 ) ) ( not ( = ?auto_1951669 ?auto_1951672 ) ) ( not ( = ?auto_1951670 ?auto_1951672 ) ) ( not ( = ?auto_1951678 ?auto_1951676 ) ) ( not ( = ?auto_1951678 ?auto_1951680 ) ) ( not ( = ?auto_1951678 ?auto_1951675 ) ) ( not ( = ?auto_1951668 ?auto_1951671 ) ) ( not ( = ?auto_1951669 ?auto_1951671 ) ) ( not ( = ?auto_1951670 ?auto_1951671 ) ) ( not ( = ?auto_1951672 ?auto_1951671 ) ) ( not ( = ?auto_1951668 ?auto_1951673 ) ) ( not ( = ?auto_1951669 ?auto_1951673 ) ) ( not ( = ?auto_1951670 ?auto_1951673 ) ) ( not ( = ?auto_1951672 ?auto_1951673 ) ) ( not ( = ?auto_1951671 ?auto_1951673 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1951668 ?auto_1951669 ?auto_1951670 ?auto_1951672 ?auto_1951673 ?auto_1951671 ?auto_1951667 )
      ( FLY-6PPL-VERIFY ?auto_1951668 ?auto_1951669 ?auto_1951670 ?auto_1951671 ?auto_1951672 ?auto_1951673 ?auto_1951667 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1952723 - PERSON
      ?auto_1952724 - PERSON
      ?auto_1952725 - PERSON
      ?auto_1952726 - PERSON
      ?auto_1952727 - PERSON
      ?auto_1952728 - PERSON
      ?auto_1952722 - CITY
    )
    :vars
    (
      ?auto_1952729 - FLEVEL
      ?auto_1952734 - FLEVEL
      ?auto_1952733 - CITY
      ?auto_1952730 - CITY
      ?auto_1952731 - CITY
      ?auto_1952735 - CITY
      ?auto_1952732 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1952729 ?auto_1952734 ) ( PERSON-AT ?auto_1952728 ?auto_1952733 ) ( not ( = ?auto_1952722 ?auto_1952733 ) ) ( not ( = ?auto_1952729 ?auto_1952734 ) ) ( PERSON-AT ?auto_1952727 ?auto_1952730 ) ( not ( = ?auto_1952722 ?auto_1952730 ) ) ( PERSON-AT ?auto_1952725 ?auto_1952733 ) ( PERSON-AT ?auto_1952726 ?auto_1952731 ) ( not ( = ?auto_1952722 ?auto_1952731 ) ) ( PERSON-AT ?auto_1952724 ?auto_1952735 ) ( not ( = ?auto_1952722 ?auto_1952735 ) ) ( PERSON-AT ?auto_1952723 ?auto_1952730 ) ( AIRCRAFT-AT ?auto_1952732 ?auto_1952722 ) ( FUEL-LEVEL ?auto_1952732 ?auto_1952729 ) ( not ( = ?auto_1952723 ?auto_1952724 ) ) ( not ( = ?auto_1952735 ?auto_1952730 ) ) ( not ( = ?auto_1952723 ?auto_1952726 ) ) ( not ( = ?auto_1952724 ?auto_1952726 ) ) ( not ( = ?auto_1952731 ?auto_1952735 ) ) ( not ( = ?auto_1952731 ?auto_1952730 ) ) ( not ( = ?auto_1952723 ?auto_1952725 ) ) ( not ( = ?auto_1952724 ?auto_1952725 ) ) ( not ( = ?auto_1952726 ?auto_1952725 ) ) ( not ( = ?auto_1952733 ?auto_1952731 ) ) ( not ( = ?auto_1952733 ?auto_1952735 ) ) ( not ( = ?auto_1952733 ?auto_1952730 ) ) ( not ( = ?auto_1952723 ?auto_1952727 ) ) ( not ( = ?auto_1952724 ?auto_1952727 ) ) ( not ( = ?auto_1952726 ?auto_1952727 ) ) ( not ( = ?auto_1952725 ?auto_1952727 ) ) ( not ( = ?auto_1952723 ?auto_1952728 ) ) ( not ( = ?auto_1952724 ?auto_1952728 ) ) ( not ( = ?auto_1952726 ?auto_1952728 ) ) ( not ( = ?auto_1952725 ?auto_1952728 ) ) ( not ( = ?auto_1952727 ?auto_1952728 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1952723 ?auto_1952724 ?auto_1952726 ?auto_1952725 ?auto_1952728 ?auto_1952727 ?auto_1952722 )
      ( FLY-6PPL-VERIFY ?auto_1952723 ?auto_1952724 ?auto_1952725 ?auto_1952726 ?auto_1952727 ?auto_1952728 ?auto_1952722 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1952797 - PERSON
      ?auto_1952798 - PERSON
      ?auto_1952799 - PERSON
      ?auto_1952800 - PERSON
      ?auto_1952801 - PERSON
      ?auto_1952802 - PERSON
      ?auto_1952796 - CITY
    )
    :vars
    (
      ?auto_1952803 - FLEVEL
      ?auto_1952808 - FLEVEL
      ?auto_1952807 - CITY
      ?auto_1952804 - CITY
      ?auto_1952805 - CITY
      ?auto_1952809 - CITY
      ?auto_1952806 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1952803 ?auto_1952808 ) ( PERSON-AT ?auto_1952801 ?auto_1952807 ) ( not ( = ?auto_1952796 ?auto_1952807 ) ) ( not ( = ?auto_1952803 ?auto_1952808 ) ) ( PERSON-AT ?auto_1952802 ?auto_1952804 ) ( not ( = ?auto_1952796 ?auto_1952804 ) ) ( PERSON-AT ?auto_1952799 ?auto_1952807 ) ( PERSON-AT ?auto_1952800 ?auto_1952805 ) ( not ( = ?auto_1952796 ?auto_1952805 ) ) ( PERSON-AT ?auto_1952798 ?auto_1952809 ) ( not ( = ?auto_1952796 ?auto_1952809 ) ) ( PERSON-AT ?auto_1952797 ?auto_1952804 ) ( AIRCRAFT-AT ?auto_1952806 ?auto_1952796 ) ( FUEL-LEVEL ?auto_1952806 ?auto_1952803 ) ( not ( = ?auto_1952797 ?auto_1952798 ) ) ( not ( = ?auto_1952809 ?auto_1952804 ) ) ( not ( = ?auto_1952797 ?auto_1952800 ) ) ( not ( = ?auto_1952798 ?auto_1952800 ) ) ( not ( = ?auto_1952805 ?auto_1952809 ) ) ( not ( = ?auto_1952805 ?auto_1952804 ) ) ( not ( = ?auto_1952797 ?auto_1952799 ) ) ( not ( = ?auto_1952798 ?auto_1952799 ) ) ( not ( = ?auto_1952800 ?auto_1952799 ) ) ( not ( = ?auto_1952807 ?auto_1952805 ) ) ( not ( = ?auto_1952807 ?auto_1952809 ) ) ( not ( = ?auto_1952807 ?auto_1952804 ) ) ( not ( = ?auto_1952797 ?auto_1952802 ) ) ( not ( = ?auto_1952798 ?auto_1952802 ) ) ( not ( = ?auto_1952800 ?auto_1952802 ) ) ( not ( = ?auto_1952799 ?auto_1952802 ) ) ( not ( = ?auto_1952797 ?auto_1952801 ) ) ( not ( = ?auto_1952798 ?auto_1952801 ) ) ( not ( = ?auto_1952800 ?auto_1952801 ) ) ( not ( = ?auto_1952799 ?auto_1952801 ) ) ( not ( = ?auto_1952802 ?auto_1952801 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1952797 ?auto_1952798 ?auto_1952800 ?auto_1952799 ?auto_1952801 ?auto_1952802 ?auto_1952796 )
      ( FLY-6PPL-VERIFY ?auto_1952797 ?auto_1952798 ?auto_1952799 ?auto_1952800 ?auto_1952801 ?auto_1952802 ?auto_1952796 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1953028 - PERSON
      ?auto_1953029 - PERSON
      ?auto_1953030 - PERSON
      ?auto_1953031 - PERSON
      ?auto_1953032 - PERSON
      ?auto_1953033 - PERSON
      ?auto_1953027 - CITY
    )
    :vars
    (
      ?auto_1953034 - FLEVEL
      ?auto_1953039 - FLEVEL
      ?auto_1953038 - CITY
      ?auto_1953035 - CITY
      ?auto_1953036 - CITY
      ?auto_1953040 - CITY
      ?auto_1953037 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1953034 ?auto_1953039 ) ( PERSON-AT ?auto_1953033 ?auto_1953038 ) ( not ( = ?auto_1953027 ?auto_1953038 ) ) ( not ( = ?auto_1953034 ?auto_1953039 ) ) ( PERSON-AT ?auto_1953031 ?auto_1953035 ) ( not ( = ?auto_1953027 ?auto_1953035 ) ) ( PERSON-AT ?auto_1953030 ?auto_1953038 ) ( PERSON-AT ?auto_1953032 ?auto_1953036 ) ( not ( = ?auto_1953027 ?auto_1953036 ) ) ( PERSON-AT ?auto_1953029 ?auto_1953040 ) ( not ( = ?auto_1953027 ?auto_1953040 ) ) ( PERSON-AT ?auto_1953028 ?auto_1953035 ) ( AIRCRAFT-AT ?auto_1953037 ?auto_1953027 ) ( FUEL-LEVEL ?auto_1953037 ?auto_1953034 ) ( not ( = ?auto_1953028 ?auto_1953029 ) ) ( not ( = ?auto_1953040 ?auto_1953035 ) ) ( not ( = ?auto_1953028 ?auto_1953032 ) ) ( not ( = ?auto_1953029 ?auto_1953032 ) ) ( not ( = ?auto_1953036 ?auto_1953040 ) ) ( not ( = ?auto_1953036 ?auto_1953035 ) ) ( not ( = ?auto_1953028 ?auto_1953030 ) ) ( not ( = ?auto_1953029 ?auto_1953030 ) ) ( not ( = ?auto_1953032 ?auto_1953030 ) ) ( not ( = ?auto_1953038 ?auto_1953036 ) ) ( not ( = ?auto_1953038 ?auto_1953040 ) ) ( not ( = ?auto_1953038 ?auto_1953035 ) ) ( not ( = ?auto_1953028 ?auto_1953031 ) ) ( not ( = ?auto_1953029 ?auto_1953031 ) ) ( not ( = ?auto_1953032 ?auto_1953031 ) ) ( not ( = ?auto_1953030 ?auto_1953031 ) ) ( not ( = ?auto_1953028 ?auto_1953033 ) ) ( not ( = ?auto_1953029 ?auto_1953033 ) ) ( not ( = ?auto_1953032 ?auto_1953033 ) ) ( not ( = ?auto_1953030 ?auto_1953033 ) ) ( not ( = ?auto_1953031 ?auto_1953033 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1953028 ?auto_1953029 ?auto_1953032 ?auto_1953030 ?auto_1953033 ?auto_1953031 ?auto_1953027 )
      ( FLY-6PPL-VERIFY ?auto_1953028 ?auto_1953029 ?auto_1953030 ?auto_1953031 ?auto_1953032 ?auto_1953033 ?auto_1953027 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1953102 - PERSON
      ?auto_1953103 - PERSON
      ?auto_1953104 - PERSON
      ?auto_1953105 - PERSON
      ?auto_1953106 - PERSON
      ?auto_1953107 - PERSON
      ?auto_1953101 - CITY
    )
    :vars
    (
      ?auto_1953108 - FLEVEL
      ?auto_1953113 - FLEVEL
      ?auto_1953112 - CITY
      ?auto_1953109 - CITY
      ?auto_1953110 - CITY
      ?auto_1953114 - CITY
      ?auto_1953111 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1953108 ?auto_1953113 ) ( PERSON-AT ?auto_1953106 ?auto_1953112 ) ( not ( = ?auto_1953101 ?auto_1953112 ) ) ( not ( = ?auto_1953108 ?auto_1953113 ) ) ( PERSON-AT ?auto_1953105 ?auto_1953109 ) ( not ( = ?auto_1953101 ?auto_1953109 ) ) ( PERSON-AT ?auto_1953104 ?auto_1953112 ) ( PERSON-AT ?auto_1953107 ?auto_1953110 ) ( not ( = ?auto_1953101 ?auto_1953110 ) ) ( PERSON-AT ?auto_1953103 ?auto_1953114 ) ( not ( = ?auto_1953101 ?auto_1953114 ) ) ( PERSON-AT ?auto_1953102 ?auto_1953109 ) ( AIRCRAFT-AT ?auto_1953111 ?auto_1953101 ) ( FUEL-LEVEL ?auto_1953111 ?auto_1953108 ) ( not ( = ?auto_1953102 ?auto_1953103 ) ) ( not ( = ?auto_1953114 ?auto_1953109 ) ) ( not ( = ?auto_1953102 ?auto_1953107 ) ) ( not ( = ?auto_1953103 ?auto_1953107 ) ) ( not ( = ?auto_1953110 ?auto_1953114 ) ) ( not ( = ?auto_1953110 ?auto_1953109 ) ) ( not ( = ?auto_1953102 ?auto_1953104 ) ) ( not ( = ?auto_1953103 ?auto_1953104 ) ) ( not ( = ?auto_1953107 ?auto_1953104 ) ) ( not ( = ?auto_1953112 ?auto_1953110 ) ) ( not ( = ?auto_1953112 ?auto_1953114 ) ) ( not ( = ?auto_1953112 ?auto_1953109 ) ) ( not ( = ?auto_1953102 ?auto_1953105 ) ) ( not ( = ?auto_1953103 ?auto_1953105 ) ) ( not ( = ?auto_1953107 ?auto_1953105 ) ) ( not ( = ?auto_1953104 ?auto_1953105 ) ) ( not ( = ?auto_1953102 ?auto_1953106 ) ) ( not ( = ?auto_1953103 ?auto_1953106 ) ) ( not ( = ?auto_1953107 ?auto_1953106 ) ) ( not ( = ?auto_1953104 ?auto_1953106 ) ) ( not ( = ?auto_1953105 ?auto_1953106 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1953102 ?auto_1953103 ?auto_1953107 ?auto_1953104 ?auto_1953106 ?auto_1953105 ?auto_1953101 )
      ( FLY-6PPL-VERIFY ?auto_1953102 ?auto_1953103 ?auto_1953104 ?auto_1953105 ?auto_1953106 ?auto_1953107 ?auto_1953101 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1953409 - PERSON
      ?auto_1953410 - PERSON
      ?auto_1953411 - PERSON
      ?auto_1953412 - PERSON
      ?auto_1953413 - PERSON
      ?auto_1953414 - PERSON
      ?auto_1953408 - CITY
    )
    :vars
    (
      ?auto_1953415 - FLEVEL
      ?auto_1953420 - FLEVEL
      ?auto_1953419 - CITY
      ?auto_1953416 - CITY
      ?auto_1953417 - CITY
      ?auto_1953421 - CITY
      ?auto_1953418 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1953415 ?auto_1953420 ) ( PERSON-AT ?auto_1953412 ?auto_1953419 ) ( not ( = ?auto_1953408 ?auto_1953419 ) ) ( not ( = ?auto_1953415 ?auto_1953420 ) ) ( PERSON-AT ?auto_1953414 ?auto_1953416 ) ( not ( = ?auto_1953408 ?auto_1953416 ) ) ( PERSON-AT ?auto_1953411 ?auto_1953419 ) ( PERSON-AT ?auto_1953413 ?auto_1953417 ) ( not ( = ?auto_1953408 ?auto_1953417 ) ) ( PERSON-AT ?auto_1953410 ?auto_1953421 ) ( not ( = ?auto_1953408 ?auto_1953421 ) ) ( PERSON-AT ?auto_1953409 ?auto_1953416 ) ( AIRCRAFT-AT ?auto_1953418 ?auto_1953408 ) ( FUEL-LEVEL ?auto_1953418 ?auto_1953415 ) ( not ( = ?auto_1953409 ?auto_1953410 ) ) ( not ( = ?auto_1953421 ?auto_1953416 ) ) ( not ( = ?auto_1953409 ?auto_1953413 ) ) ( not ( = ?auto_1953410 ?auto_1953413 ) ) ( not ( = ?auto_1953417 ?auto_1953421 ) ) ( not ( = ?auto_1953417 ?auto_1953416 ) ) ( not ( = ?auto_1953409 ?auto_1953411 ) ) ( not ( = ?auto_1953410 ?auto_1953411 ) ) ( not ( = ?auto_1953413 ?auto_1953411 ) ) ( not ( = ?auto_1953419 ?auto_1953417 ) ) ( not ( = ?auto_1953419 ?auto_1953421 ) ) ( not ( = ?auto_1953419 ?auto_1953416 ) ) ( not ( = ?auto_1953409 ?auto_1953414 ) ) ( not ( = ?auto_1953410 ?auto_1953414 ) ) ( not ( = ?auto_1953413 ?auto_1953414 ) ) ( not ( = ?auto_1953411 ?auto_1953414 ) ) ( not ( = ?auto_1953409 ?auto_1953412 ) ) ( not ( = ?auto_1953410 ?auto_1953412 ) ) ( not ( = ?auto_1953413 ?auto_1953412 ) ) ( not ( = ?auto_1953411 ?auto_1953412 ) ) ( not ( = ?auto_1953414 ?auto_1953412 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1953409 ?auto_1953410 ?auto_1953413 ?auto_1953411 ?auto_1953412 ?auto_1953414 ?auto_1953408 )
      ( FLY-6PPL-VERIFY ?auto_1953409 ?auto_1953410 ?auto_1953411 ?auto_1953412 ?auto_1953413 ?auto_1953414 ?auto_1953408 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1953562 - PERSON
      ?auto_1953563 - PERSON
      ?auto_1953564 - PERSON
      ?auto_1953565 - PERSON
      ?auto_1953566 - PERSON
      ?auto_1953567 - PERSON
      ?auto_1953561 - CITY
    )
    :vars
    (
      ?auto_1953568 - FLEVEL
      ?auto_1953573 - FLEVEL
      ?auto_1953572 - CITY
      ?auto_1953569 - CITY
      ?auto_1953570 - CITY
      ?auto_1953574 - CITY
      ?auto_1953571 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1953568 ?auto_1953573 ) ( PERSON-AT ?auto_1953565 ?auto_1953572 ) ( not ( = ?auto_1953561 ?auto_1953572 ) ) ( not ( = ?auto_1953568 ?auto_1953573 ) ) ( PERSON-AT ?auto_1953566 ?auto_1953569 ) ( not ( = ?auto_1953561 ?auto_1953569 ) ) ( PERSON-AT ?auto_1953564 ?auto_1953572 ) ( PERSON-AT ?auto_1953567 ?auto_1953570 ) ( not ( = ?auto_1953561 ?auto_1953570 ) ) ( PERSON-AT ?auto_1953563 ?auto_1953574 ) ( not ( = ?auto_1953561 ?auto_1953574 ) ) ( PERSON-AT ?auto_1953562 ?auto_1953569 ) ( AIRCRAFT-AT ?auto_1953571 ?auto_1953561 ) ( FUEL-LEVEL ?auto_1953571 ?auto_1953568 ) ( not ( = ?auto_1953562 ?auto_1953563 ) ) ( not ( = ?auto_1953574 ?auto_1953569 ) ) ( not ( = ?auto_1953562 ?auto_1953567 ) ) ( not ( = ?auto_1953563 ?auto_1953567 ) ) ( not ( = ?auto_1953570 ?auto_1953574 ) ) ( not ( = ?auto_1953570 ?auto_1953569 ) ) ( not ( = ?auto_1953562 ?auto_1953564 ) ) ( not ( = ?auto_1953563 ?auto_1953564 ) ) ( not ( = ?auto_1953567 ?auto_1953564 ) ) ( not ( = ?auto_1953572 ?auto_1953570 ) ) ( not ( = ?auto_1953572 ?auto_1953574 ) ) ( not ( = ?auto_1953572 ?auto_1953569 ) ) ( not ( = ?auto_1953562 ?auto_1953566 ) ) ( not ( = ?auto_1953563 ?auto_1953566 ) ) ( not ( = ?auto_1953567 ?auto_1953566 ) ) ( not ( = ?auto_1953564 ?auto_1953566 ) ) ( not ( = ?auto_1953562 ?auto_1953565 ) ) ( not ( = ?auto_1953563 ?auto_1953565 ) ) ( not ( = ?auto_1953567 ?auto_1953565 ) ) ( not ( = ?auto_1953564 ?auto_1953565 ) ) ( not ( = ?auto_1953566 ?auto_1953565 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1953562 ?auto_1953563 ?auto_1953567 ?auto_1953564 ?auto_1953565 ?auto_1953566 ?auto_1953561 )
      ( FLY-6PPL-VERIFY ?auto_1953562 ?auto_1953563 ?auto_1953564 ?auto_1953565 ?auto_1953566 ?auto_1953567 ?auto_1953561 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1954104 - PERSON
      ?auto_1954105 - PERSON
      ?auto_1954106 - PERSON
      ?auto_1954107 - PERSON
      ?auto_1954108 - PERSON
      ?auto_1954109 - PERSON
      ?auto_1954103 - CITY
    )
    :vars
    (
      ?auto_1954110 - FLEVEL
      ?auto_1954115 - FLEVEL
      ?auto_1954114 - CITY
      ?auto_1954111 - CITY
      ?auto_1954112 - CITY
      ?auto_1954116 - CITY
      ?auto_1954113 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1954110 ?auto_1954115 ) ( PERSON-AT ?auto_1954109 ?auto_1954114 ) ( not ( = ?auto_1954103 ?auto_1954114 ) ) ( not ( = ?auto_1954110 ?auto_1954115 ) ) ( PERSON-AT ?auto_1954106 ?auto_1954111 ) ( not ( = ?auto_1954103 ?auto_1954111 ) ) ( PERSON-AT ?auto_1954108 ?auto_1954114 ) ( PERSON-AT ?auto_1954107 ?auto_1954112 ) ( not ( = ?auto_1954103 ?auto_1954112 ) ) ( PERSON-AT ?auto_1954105 ?auto_1954116 ) ( not ( = ?auto_1954103 ?auto_1954116 ) ) ( PERSON-AT ?auto_1954104 ?auto_1954111 ) ( AIRCRAFT-AT ?auto_1954113 ?auto_1954103 ) ( FUEL-LEVEL ?auto_1954113 ?auto_1954110 ) ( not ( = ?auto_1954104 ?auto_1954105 ) ) ( not ( = ?auto_1954116 ?auto_1954111 ) ) ( not ( = ?auto_1954104 ?auto_1954107 ) ) ( not ( = ?auto_1954105 ?auto_1954107 ) ) ( not ( = ?auto_1954112 ?auto_1954116 ) ) ( not ( = ?auto_1954112 ?auto_1954111 ) ) ( not ( = ?auto_1954104 ?auto_1954108 ) ) ( not ( = ?auto_1954105 ?auto_1954108 ) ) ( not ( = ?auto_1954107 ?auto_1954108 ) ) ( not ( = ?auto_1954114 ?auto_1954112 ) ) ( not ( = ?auto_1954114 ?auto_1954116 ) ) ( not ( = ?auto_1954114 ?auto_1954111 ) ) ( not ( = ?auto_1954104 ?auto_1954106 ) ) ( not ( = ?auto_1954105 ?auto_1954106 ) ) ( not ( = ?auto_1954107 ?auto_1954106 ) ) ( not ( = ?auto_1954108 ?auto_1954106 ) ) ( not ( = ?auto_1954104 ?auto_1954109 ) ) ( not ( = ?auto_1954105 ?auto_1954109 ) ) ( not ( = ?auto_1954107 ?auto_1954109 ) ) ( not ( = ?auto_1954108 ?auto_1954109 ) ) ( not ( = ?auto_1954106 ?auto_1954109 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1954104 ?auto_1954105 ?auto_1954107 ?auto_1954108 ?auto_1954109 ?auto_1954106 ?auto_1954103 )
      ( FLY-6PPL-VERIFY ?auto_1954104 ?auto_1954105 ?auto_1954106 ?auto_1954107 ?auto_1954108 ?auto_1954109 ?auto_1954103 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1954245 - PERSON
      ?auto_1954246 - PERSON
      ?auto_1954247 - PERSON
      ?auto_1954248 - PERSON
      ?auto_1954249 - PERSON
      ?auto_1954250 - PERSON
      ?auto_1954244 - CITY
    )
    :vars
    (
      ?auto_1954251 - FLEVEL
      ?auto_1954256 - FLEVEL
      ?auto_1954255 - CITY
      ?auto_1954252 - CITY
      ?auto_1954253 - CITY
      ?auto_1954257 - CITY
      ?auto_1954254 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1954251 ?auto_1954256 ) ( PERSON-AT ?auto_1954250 ?auto_1954255 ) ( not ( = ?auto_1954244 ?auto_1954255 ) ) ( not ( = ?auto_1954251 ?auto_1954256 ) ) ( PERSON-AT ?auto_1954247 ?auto_1954252 ) ( not ( = ?auto_1954244 ?auto_1954252 ) ) ( PERSON-AT ?auto_1954248 ?auto_1954255 ) ( PERSON-AT ?auto_1954249 ?auto_1954253 ) ( not ( = ?auto_1954244 ?auto_1954253 ) ) ( PERSON-AT ?auto_1954246 ?auto_1954257 ) ( not ( = ?auto_1954244 ?auto_1954257 ) ) ( PERSON-AT ?auto_1954245 ?auto_1954252 ) ( AIRCRAFT-AT ?auto_1954254 ?auto_1954244 ) ( FUEL-LEVEL ?auto_1954254 ?auto_1954251 ) ( not ( = ?auto_1954245 ?auto_1954246 ) ) ( not ( = ?auto_1954257 ?auto_1954252 ) ) ( not ( = ?auto_1954245 ?auto_1954249 ) ) ( not ( = ?auto_1954246 ?auto_1954249 ) ) ( not ( = ?auto_1954253 ?auto_1954257 ) ) ( not ( = ?auto_1954253 ?auto_1954252 ) ) ( not ( = ?auto_1954245 ?auto_1954248 ) ) ( not ( = ?auto_1954246 ?auto_1954248 ) ) ( not ( = ?auto_1954249 ?auto_1954248 ) ) ( not ( = ?auto_1954255 ?auto_1954253 ) ) ( not ( = ?auto_1954255 ?auto_1954257 ) ) ( not ( = ?auto_1954255 ?auto_1954252 ) ) ( not ( = ?auto_1954245 ?auto_1954247 ) ) ( not ( = ?auto_1954246 ?auto_1954247 ) ) ( not ( = ?auto_1954249 ?auto_1954247 ) ) ( not ( = ?auto_1954248 ?auto_1954247 ) ) ( not ( = ?auto_1954245 ?auto_1954250 ) ) ( not ( = ?auto_1954246 ?auto_1954250 ) ) ( not ( = ?auto_1954249 ?auto_1954250 ) ) ( not ( = ?auto_1954248 ?auto_1954250 ) ) ( not ( = ?auto_1954247 ?auto_1954250 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1954245 ?auto_1954246 ?auto_1954249 ?auto_1954248 ?auto_1954250 ?auto_1954247 ?auto_1954244 )
      ( FLY-6PPL-VERIFY ?auto_1954245 ?auto_1954246 ?auto_1954247 ?auto_1954248 ?auto_1954249 ?auto_1954250 ?auto_1954244 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1954319 - PERSON
      ?auto_1954320 - PERSON
      ?auto_1954321 - PERSON
      ?auto_1954322 - PERSON
      ?auto_1954323 - PERSON
      ?auto_1954324 - PERSON
      ?auto_1954318 - CITY
    )
    :vars
    (
      ?auto_1954325 - FLEVEL
      ?auto_1954330 - FLEVEL
      ?auto_1954329 - CITY
      ?auto_1954326 - CITY
      ?auto_1954327 - CITY
      ?auto_1954331 - CITY
      ?auto_1954328 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1954325 ?auto_1954330 ) ( PERSON-AT ?auto_1954323 ?auto_1954329 ) ( not ( = ?auto_1954318 ?auto_1954329 ) ) ( not ( = ?auto_1954325 ?auto_1954330 ) ) ( PERSON-AT ?auto_1954321 ?auto_1954326 ) ( not ( = ?auto_1954318 ?auto_1954326 ) ) ( PERSON-AT ?auto_1954322 ?auto_1954329 ) ( PERSON-AT ?auto_1954324 ?auto_1954327 ) ( not ( = ?auto_1954318 ?auto_1954327 ) ) ( PERSON-AT ?auto_1954320 ?auto_1954331 ) ( not ( = ?auto_1954318 ?auto_1954331 ) ) ( PERSON-AT ?auto_1954319 ?auto_1954326 ) ( AIRCRAFT-AT ?auto_1954328 ?auto_1954318 ) ( FUEL-LEVEL ?auto_1954328 ?auto_1954325 ) ( not ( = ?auto_1954319 ?auto_1954320 ) ) ( not ( = ?auto_1954331 ?auto_1954326 ) ) ( not ( = ?auto_1954319 ?auto_1954324 ) ) ( not ( = ?auto_1954320 ?auto_1954324 ) ) ( not ( = ?auto_1954327 ?auto_1954331 ) ) ( not ( = ?auto_1954327 ?auto_1954326 ) ) ( not ( = ?auto_1954319 ?auto_1954322 ) ) ( not ( = ?auto_1954320 ?auto_1954322 ) ) ( not ( = ?auto_1954324 ?auto_1954322 ) ) ( not ( = ?auto_1954329 ?auto_1954327 ) ) ( not ( = ?auto_1954329 ?auto_1954331 ) ) ( not ( = ?auto_1954329 ?auto_1954326 ) ) ( not ( = ?auto_1954319 ?auto_1954321 ) ) ( not ( = ?auto_1954320 ?auto_1954321 ) ) ( not ( = ?auto_1954324 ?auto_1954321 ) ) ( not ( = ?auto_1954322 ?auto_1954321 ) ) ( not ( = ?auto_1954319 ?auto_1954323 ) ) ( not ( = ?auto_1954320 ?auto_1954323 ) ) ( not ( = ?auto_1954324 ?auto_1954323 ) ) ( not ( = ?auto_1954322 ?auto_1954323 ) ) ( not ( = ?auto_1954321 ?auto_1954323 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1954319 ?auto_1954320 ?auto_1954324 ?auto_1954322 ?auto_1954323 ?auto_1954321 ?auto_1954318 )
      ( FLY-6PPL-VERIFY ?auto_1954319 ?auto_1954320 ?auto_1954321 ?auto_1954322 ?auto_1954323 ?auto_1954324 ?auto_1954318 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1970641 - PERSON
      ?auto_1970642 - PERSON
      ?auto_1970643 - PERSON
      ?auto_1970644 - PERSON
      ?auto_1970645 - PERSON
      ?auto_1970646 - PERSON
      ?auto_1970640 - CITY
    )
    :vars
    (
      ?auto_1970647 - FLEVEL
      ?auto_1970652 - FLEVEL
      ?auto_1970651 - CITY
      ?auto_1970648 - CITY
      ?auto_1970649 - CITY
      ?auto_1970653 - CITY
      ?auto_1970650 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1970647 ?auto_1970652 ) ( PERSON-AT ?auto_1970646 ?auto_1970651 ) ( not ( = ?auto_1970640 ?auto_1970651 ) ) ( not ( = ?auto_1970647 ?auto_1970652 ) ) ( PERSON-AT ?auto_1970645 ?auto_1970648 ) ( not ( = ?auto_1970640 ?auto_1970648 ) ) ( PERSON-AT ?auto_1970642 ?auto_1970651 ) ( PERSON-AT ?auto_1970644 ?auto_1970649 ) ( not ( = ?auto_1970640 ?auto_1970649 ) ) ( PERSON-AT ?auto_1970643 ?auto_1970653 ) ( not ( = ?auto_1970640 ?auto_1970653 ) ) ( PERSON-AT ?auto_1970641 ?auto_1970648 ) ( AIRCRAFT-AT ?auto_1970650 ?auto_1970640 ) ( FUEL-LEVEL ?auto_1970650 ?auto_1970647 ) ( not ( = ?auto_1970641 ?auto_1970643 ) ) ( not ( = ?auto_1970653 ?auto_1970648 ) ) ( not ( = ?auto_1970641 ?auto_1970644 ) ) ( not ( = ?auto_1970643 ?auto_1970644 ) ) ( not ( = ?auto_1970649 ?auto_1970653 ) ) ( not ( = ?auto_1970649 ?auto_1970648 ) ) ( not ( = ?auto_1970641 ?auto_1970642 ) ) ( not ( = ?auto_1970643 ?auto_1970642 ) ) ( not ( = ?auto_1970644 ?auto_1970642 ) ) ( not ( = ?auto_1970651 ?auto_1970649 ) ) ( not ( = ?auto_1970651 ?auto_1970653 ) ) ( not ( = ?auto_1970651 ?auto_1970648 ) ) ( not ( = ?auto_1970641 ?auto_1970645 ) ) ( not ( = ?auto_1970643 ?auto_1970645 ) ) ( not ( = ?auto_1970644 ?auto_1970645 ) ) ( not ( = ?auto_1970642 ?auto_1970645 ) ) ( not ( = ?auto_1970641 ?auto_1970646 ) ) ( not ( = ?auto_1970643 ?auto_1970646 ) ) ( not ( = ?auto_1970644 ?auto_1970646 ) ) ( not ( = ?auto_1970642 ?auto_1970646 ) ) ( not ( = ?auto_1970645 ?auto_1970646 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1970641 ?auto_1970643 ?auto_1970644 ?auto_1970642 ?auto_1970646 ?auto_1970645 ?auto_1970640 )
      ( FLY-6PPL-VERIFY ?auto_1970641 ?auto_1970642 ?auto_1970643 ?auto_1970644 ?auto_1970645 ?auto_1970646 ?auto_1970640 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1970715 - PERSON
      ?auto_1970716 - PERSON
      ?auto_1970717 - PERSON
      ?auto_1970718 - PERSON
      ?auto_1970719 - PERSON
      ?auto_1970720 - PERSON
      ?auto_1970714 - CITY
    )
    :vars
    (
      ?auto_1970721 - FLEVEL
      ?auto_1970726 - FLEVEL
      ?auto_1970725 - CITY
      ?auto_1970722 - CITY
      ?auto_1970723 - CITY
      ?auto_1970727 - CITY
      ?auto_1970724 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1970721 ?auto_1970726 ) ( PERSON-AT ?auto_1970719 ?auto_1970725 ) ( not ( = ?auto_1970714 ?auto_1970725 ) ) ( not ( = ?auto_1970721 ?auto_1970726 ) ) ( PERSON-AT ?auto_1970720 ?auto_1970722 ) ( not ( = ?auto_1970714 ?auto_1970722 ) ) ( PERSON-AT ?auto_1970716 ?auto_1970725 ) ( PERSON-AT ?auto_1970718 ?auto_1970723 ) ( not ( = ?auto_1970714 ?auto_1970723 ) ) ( PERSON-AT ?auto_1970717 ?auto_1970727 ) ( not ( = ?auto_1970714 ?auto_1970727 ) ) ( PERSON-AT ?auto_1970715 ?auto_1970722 ) ( AIRCRAFT-AT ?auto_1970724 ?auto_1970714 ) ( FUEL-LEVEL ?auto_1970724 ?auto_1970721 ) ( not ( = ?auto_1970715 ?auto_1970717 ) ) ( not ( = ?auto_1970727 ?auto_1970722 ) ) ( not ( = ?auto_1970715 ?auto_1970718 ) ) ( not ( = ?auto_1970717 ?auto_1970718 ) ) ( not ( = ?auto_1970723 ?auto_1970727 ) ) ( not ( = ?auto_1970723 ?auto_1970722 ) ) ( not ( = ?auto_1970715 ?auto_1970716 ) ) ( not ( = ?auto_1970717 ?auto_1970716 ) ) ( not ( = ?auto_1970718 ?auto_1970716 ) ) ( not ( = ?auto_1970725 ?auto_1970723 ) ) ( not ( = ?auto_1970725 ?auto_1970727 ) ) ( not ( = ?auto_1970725 ?auto_1970722 ) ) ( not ( = ?auto_1970715 ?auto_1970720 ) ) ( not ( = ?auto_1970717 ?auto_1970720 ) ) ( not ( = ?auto_1970718 ?auto_1970720 ) ) ( not ( = ?auto_1970716 ?auto_1970720 ) ) ( not ( = ?auto_1970715 ?auto_1970719 ) ) ( not ( = ?auto_1970717 ?auto_1970719 ) ) ( not ( = ?auto_1970718 ?auto_1970719 ) ) ( not ( = ?auto_1970716 ?auto_1970719 ) ) ( not ( = ?auto_1970720 ?auto_1970719 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1970715 ?auto_1970717 ?auto_1970718 ?auto_1970716 ?auto_1970719 ?auto_1970720 ?auto_1970714 )
      ( FLY-6PPL-VERIFY ?auto_1970715 ?auto_1970716 ?auto_1970717 ?auto_1970718 ?auto_1970719 ?auto_1970720 ?auto_1970714 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1970946 - PERSON
      ?auto_1970947 - PERSON
      ?auto_1970948 - PERSON
      ?auto_1970949 - PERSON
      ?auto_1970950 - PERSON
      ?auto_1970951 - PERSON
      ?auto_1970945 - CITY
    )
    :vars
    (
      ?auto_1970952 - FLEVEL
      ?auto_1970957 - FLEVEL
      ?auto_1970956 - CITY
      ?auto_1970953 - CITY
      ?auto_1970954 - CITY
      ?auto_1970958 - CITY
      ?auto_1970955 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1970952 ?auto_1970957 ) ( PERSON-AT ?auto_1970951 ?auto_1970956 ) ( not ( = ?auto_1970945 ?auto_1970956 ) ) ( not ( = ?auto_1970952 ?auto_1970957 ) ) ( PERSON-AT ?auto_1970949 ?auto_1970953 ) ( not ( = ?auto_1970945 ?auto_1970953 ) ) ( PERSON-AT ?auto_1970947 ?auto_1970956 ) ( PERSON-AT ?auto_1970950 ?auto_1970954 ) ( not ( = ?auto_1970945 ?auto_1970954 ) ) ( PERSON-AT ?auto_1970948 ?auto_1970958 ) ( not ( = ?auto_1970945 ?auto_1970958 ) ) ( PERSON-AT ?auto_1970946 ?auto_1970953 ) ( AIRCRAFT-AT ?auto_1970955 ?auto_1970945 ) ( FUEL-LEVEL ?auto_1970955 ?auto_1970952 ) ( not ( = ?auto_1970946 ?auto_1970948 ) ) ( not ( = ?auto_1970958 ?auto_1970953 ) ) ( not ( = ?auto_1970946 ?auto_1970950 ) ) ( not ( = ?auto_1970948 ?auto_1970950 ) ) ( not ( = ?auto_1970954 ?auto_1970958 ) ) ( not ( = ?auto_1970954 ?auto_1970953 ) ) ( not ( = ?auto_1970946 ?auto_1970947 ) ) ( not ( = ?auto_1970948 ?auto_1970947 ) ) ( not ( = ?auto_1970950 ?auto_1970947 ) ) ( not ( = ?auto_1970956 ?auto_1970954 ) ) ( not ( = ?auto_1970956 ?auto_1970958 ) ) ( not ( = ?auto_1970956 ?auto_1970953 ) ) ( not ( = ?auto_1970946 ?auto_1970949 ) ) ( not ( = ?auto_1970948 ?auto_1970949 ) ) ( not ( = ?auto_1970950 ?auto_1970949 ) ) ( not ( = ?auto_1970947 ?auto_1970949 ) ) ( not ( = ?auto_1970946 ?auto_1970951 ) ) ( not ( = ?auto_1970948 ?auto_1970951 ) ) ( not ( = ?auto_1970950 ?auto_1970951 ) ) ( not ( = ?auto_1970947 ?auto_1970951 ) ) ( not ( = ?auto_1970949 ?auto_1970951 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1970946 ?auto_1970948 ?auto_1970950 ?auto_1970947 ?auto_1970951 ?auto_1970949 ?auto_1970945 )
      ( FLY-6PPL-VERIFY ?auto_1970946 ?auto_1970947 ?auto_1970948 ?auto_1970949 ?auto_1970950 ?auto_1970951 ?auto_1970945 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1971020 - PERSON
      ?auto_1971021 - PERSON
      ?auto_1971022 - PERSON
      ?auto_1971023 - PERSON
      ?auto_1971024 - PERSON
      ?auto_1971025 - PERSON
      ?auto_1971019 - CITY
    )
    :vars
    (
      ?auto_1971026 - FLEVEL
      ?auto_1971031 - FLEVEL
      ?auto_1971030 - CITY
      ?auto_1971027 - CITY
      ?auto_1971028 - CITY
      ?auto_1971032 - CITY
      ?auto_1971029 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1971026 ?auto_1971031 ) ( PERSON-AT ?auto_1971024 ?auto_1971030 ) ( not ( = ?auto_1971019 ?auto_1971030 ) ) ( not ( = ?auto_1971026 ?auto_1971031 ) ) ( PERSON-AT ?auto_1971023 ?auto_1971027 ) ( not ( = ?auto_1971019 ?auto_1971027 ) ) ( PERSON-AT ?auto_1971021 ?auto_1971030 ) ( PERSON-AT ?auto_1971025 ?auto_1971028 ) ( not ( = ?auto_1971019 ?auto_1971028 ) ) ( PERSON-AT ?auto_1971022 ?auto_1971032 ) ( not ( = ?auto_1971019 ?auto_1971032 ) ) ( PERSON-AT ?auto_1971020 ?auto_1971027 ) ( AIRCRAFT-AT ?auto_1971029 ?auto_1971019 ) ( FUEL-LEVEL ?auto_1971029 ?auto_1971026 ) ( not ( = ?auto_1971020 ?auto_1971022 ) ) ( not ( = ?auto_1971032 ?auto_1971027 ) ) ( not ( = ?auto_1971020 ?auto_1971025 ) ) ( not ( = ?auto_1971022 ?auto_1971025 ) ) ( not ( = ?auto_1971028 ?auto_1971032 ) ) ( not ( = ?auto_1971028 ?auto_1971027 ) ) ( not ( = ?auto_1971020 ?auto_1971021 ) ) ( not ( = ?auto_1971022 ?auto_1971021 ) ) ( not ( = ?auto_1971025 ?auto_1971021 ) ) ( not ( = ?auto_1971030 ?auto_1971028 ) ) ( not ( = ?auto_1971030 ?auto_1971032 ) ) ( not ( = ?auto_1971030 ?auto_1971027 ) ) ( not ( = ?auto_1971020 ?auto_1971023 ) ) ( not ( = ?auto_1971022 ?auto_1971023 ) ) ( not ( = ?auto_1971025 ?auto_1971023 ) ) ( not ( = ?auto_1971021 ?auto_1971023 ) ) ( not ( = ?auto_1971020 ?auto_1971024 ) ) ( not ( = ?auto_1971022 ?auto_1971024 ) ) ( not ( = ?auto_1971025 ?auto_1971024 ) ) ( not ( = ?auto_1971021 ?auto_1971024 ) ) ( not ( = ?auto_1971023 ?auto_1971024 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1971020 ?auto_1971022 ?auto_1971025 ?auto_1971021 ?auto_1971024 ?auto_1971023 ?auto_1971019 )
      ( FLY-6PPL-VERIFY ?auto_1971020 ?auto_1971021 ?auto_1971022 ?auto_1971023 ?auto_1971024 ?auto_1971025 ?auto_1971019 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1971327 - PERSON
      ?auto_1971328 - PERSON
      ?auto_1971329 - PERSON
      ?auto_1971330 - PERSON
      ?auto_1971331 - PERSON
      ?auto_1971332 - PERSON
      ?auto_1971326 - CITY
    )
    :vars
    (
      ?auto_1971333 - FLEVEL
      ?auto_1971338 - FLEVEL
      ?auto_1971337 - CITY
      ?auto_1971334 - CITY
      ?auto_1971335 - CITY
      ?auto_1971339 - CITY
      ?auto_1971336 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1971333 ?auto_1971338 ) ( PERSON-AT ?auto_1971330 ?auto_1971337 ) ( not ( = ?auto_1971326 ?auto_1971337 ) ) ( not ( = ?auto_1971333 ?auto_1971338 ) ) ( PERSON-AT ?auto_1971332 ?auto_1971334 ) ( not ( = ?auto_1971326 ?auto_1971334 ) ) ( PERSON-AT ?auto_1971328 ?auto_1971337 ) ( PERSON-AT ?auto_1971331 ?auto_1971335 ) ( not ( = ?auto_1971326 ?auto_1971335 ) ) ( PERSON-AT ?auto_1971329 ?auto_1971339 ) ( not ( = ?auto_1971326 ?auto_1971339 ) ) ( PERSON-AT ?auto_1971327 ?auto_1971334 ) ( AIRCRAFT-AT ?auto_1971336 ?auto_1971326 ) ( FUEL-LEVEL ?auto_1971336 ?auto_1971333 ) ( not ( = ?auto_1971327 ?auto_1971329 ) ) ( not ( = ?auto_1971339 ?auto_1971334 ) ) ( not ( = ?auto_1971327 ?auto_1971331 ) ) ( not ( = ?auto_1971329 ?auto_1971331 ) ) ( not ( = ?auto_1971335 ?auto_1971339 ) ) ( not ( = ?auto_1971335 ?auto_1971334 ) ) ( not ( = ?auto_1971327 ?auto_1971328 ) ) ( not ( = ?auto_1971329 ?auto_1971328 ) ) ( not ( = ?auto_1971331 ?auto_1971328 ) ) ( not ( = ?auto_1971337 ?auto_1971335 ) ) ( not ( = ?auto_1971337 ?auto_1971339 ) ) ( not ( = ?auto_1971337 ?auto_1971334 ) ) ( not ( = ?auto_1971327 ?auto_1971332 ) ) ( not ( = ?auto_1971329 ?auto_1971332 ) ) ( not ( = ?auto_1971331 ?auto_1971332 ) ) ( not ( = ?auto_1971328 ?auto_1971332 ) ) ( not ( = ?auto_1971327 ?auto_1971330 ) ) ( not ( = ?auto_1971329 ?auto_1971330 ) ) ( not ( = ?auto_1971331 ?auto_1971330 ) ) ( not ( = ?auto_1971328 ?auto_1971330 ) ) ( not ( = ?auto_1971332 ?auto_1971330 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1971327 ?auto_1971329 ?auto_1971331 ?auto_1971328 ?auto_1971330 ?auto_1971332 ?auto_1971326 )
      ( FLY-6PPL-VERIFY ?auto_1971327 ?auto_1971328 ?auto_1971329 ?auto_1971330 ?auto_1971331 ?auto_1971332 ?auto_1971326 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1971480 - PERSON
      ?auto_1971481 - PERSON
      ?auto_1971482 - PERSON
      ?auto_1971483 - PERSON
      ?auto_1971484 - PERSON
      ?auto_1971485 - PERSON
      ?auto_1971479 - CITY
    )
    :vars
    (
      ?auto_1971486 - FLEVEL
      ?auto_1971491 - FLEVEL
      ?auto_1971490 - CITY
      ?auto_1971487 - CITY
      ?auto_1971488 - CITY
      ?auto_1971492 - CITY
      ?auto_1971489 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1971486 ?auto_1971491 ) ( PERSON-AT ?auto_1971483 ?auto_1971490 ) ( not ( = ?auto_1971479 ?auto_1971490 ) ) ( not ( = ?auto_1971486 ?auto_1971491 ) ) ( PERSON-AT ?auto_1971484 ?auto_1971487 ) ( not ( = ?auto_1971479 ?auto_1971487 ) ) ( PERSON-AT ?auto_1971481 ?auto_1971490 ) ( PERSON-AT ?auto_1971485 ?auto_1971488 ) ( not ( = ?auto_1971479 ?auto_1971488 ) ) ( PERSON-AT ?auto_1971482 ?auto_1971492 ) ( not ( = ?auto_1971479 ?auto_1971492 ) ) ( PERSON-AT ?auto_1971480 ?auto_1971487 ) ( AIRCRAFT-AT ?auto_1971489 ?auto_1971479 ) ( FUEL-LEVEL ?auto_1971489 ?auto_1971486 ) ( not ( = ?auto_1971480 ?auto_1971482 ) ) ( not ( = ?auto_1971492 ?auto_1971487 ) ) ( not ( = ?auto_1971480 ?auto_1971485 ) ) ( not ( = ?auto_1971482 ?auto_1971485 ) ) ( not ( = ?auto_1971488 ?auto_1971492 ) ) ( not ( = ?auto_1971488 ?auto_1971487 ) ) ( not ( = ?auto_1971480 ?auto_1971481 ) ) ( not ( = ?auto_1971482 ?auto_1971481 ) ) ( not ( = ?auto_1971485 ?auto_1971481 ) ) ( not ( = ?auto_1971490 ?auto_1971488 ) ) ( not ( = ?auto_1971490 ?auto_1971492 ) ) ( not ( = ?auto_1971490 ?auto_1971487 ) ) ( not ( = ?auto_1971480 ?auto_1971484 ) ) ( not ( = ?auto_1971482 ?auto_1971484 ) ) ( not ( = ?auto_1971485 ?auto_1971484 ) ) ( not ( = ?auto_1971481 ?auto_1971484 ) ) ( not ( = ?auto_1971480 ?auto_1971483 ) ) ( not ( = ?auto_1971482 ?auto_1971483 ) ) ( not ( = ?auto_1971485 ?auto_1971483 ) ) ( not ( = ?auto_1971481 ?auto_1971483 ) ) ( not ( = ?auto_1971484 ?auto_1971483 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1971480 ?auto_1971482 ?auto_1971485 ?auto_1971481 ?auto_1971483 ?auto_1971484 ?auto_1971479 )
      ( FLY-6PPL-VERIFY ?auto_1971480 ?auto_1971481 ?auto_1971482 ?auto_1971483 ?auto_1971484 ?auto_1971485 ?auto_1971479 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1974646 - PERSON
      ?auto_1974647 - PERSON
      ?auto_1974648 - PERSON
      ?auto_1974649 - PERSON
      ?auto_1974650 - PERSON
      ?auto_1974651 - PERSON
      ?auto_1974645 - CITY
    )
    :vars
    (
      ?auto_1974652 - FLEVEL
      ?auto_1974657 - FLEVEL
      ?auto_1974656 - CITY
      ?auto_1974653 - CITY
      ?auto_1974654 - CITY
      ?auto_1974658 - CITY
      ?auto_1974655 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1974652 ?auto_1974657 ) ( PERSON-AT ?auto_1974651 ?auto_1974656 ) ( not ( = ?auto_1974645 ?auto_1974656 ) ) ( not ( = ?auto_1974652 ?auto_1974657 ) ) ( PERSON-AT ?auto_1974648 ?auto_1974653 ) ( not ( = ?auto_1974645 ?auto_1974653 ) ) ( PERSON-AT ?auto_1974647 ?auto_1974656 ) ( PERSON-AT ?auto_1974650 ?auto_1974654 ) ( not ( = ?auto_1974645 ?auto_1974654 ) ) ( PERSON-AT ?auto_1974649 ?auto_1974658 ) ( not ( = ?auto_1974645 ?auto_1974658 ) ) ( PERSON-AT ?auto_1974646 ?auto_1974653 ) ( AIRCRAFT-AT ?auto_1974655 ?auto_1974645 ) ( FUEL-LEVEL ?auto_1974655 ?auto_1974652 ) ( not ( = ?auto_1974646 ?auto_1974649 ) ) ( not ( = ?auto_1974658 ?auto_1974653 ) ) ( not ( = ?auto_1974646 ?auto_1974650 ) ) ( not ( = ?auto_1974649 ?auto_1974650 ) ) ( not ( = ?auto_1974654 ?auto_1974658 ) ) ( not ( = ?auto_1974654 ?auto_1974653 ) ) ( not ( = ?auto_1974646 ?auto_1974647 ) ) ( not ( = ?auto_1974649 ?auto_1974647 ) ) ( not ( = ?auto_1974650 ?auto_1974647 ) ) ( not ( = ?auto_1974656 ?auto_1974654 ) ) ( not ( = ?auto_1974656 ?auto_1974658 ) ) ( not ( = ?auto_1974656 ?auto_1974653 ) ) ( not ( = ?auto_1974646 ?auto_1974648 ) ) ( not ( = ?auto_1974649 ?auto_1974648 ) ) ( not ( = ?auto_1974650 ?auto_1974648 ) ) ( not ( = ?auto_1974647 ?auto_1974648 ) ) ( not ( = ?auto_1974646 ?auto_1974651 ) ) ( not ( = ?auto_1974649 ?auto_1974651 ) ) ( not ( = ?auto_1974650 ?auto_1974651 ) ) ( not ( = ?auto_1974647 ?auto_1974651 ) ) ( not ( = ?auto_1974648 ?auto_1974651 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1974646 ?auto_1974649 ?auto_1974650 ?auto_1974647 ?auto_1974651 ?auto_1974648 ?auto_1974645 )
      ( FLY-6PPL-VERIFY ?auto_1974646 ?auto_1974647 ?auto_1974648 ?auto_1974649 ?auto_1974650 ?auto_1974651 ?auto_1974645 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1974720 - PERSON
      ?auto_1974721 - PERSON
      ?auto_1974722 - PERSON
      ?auto_1974723 - PERSON
      ?auto_1974724 - PERSON
      ?auto_1974725 - PERSON
      ?auto_1974719 - CITY
    )
    :vars
    (
      ?auto_1974726 - FLEVEL
      ?auto_1974731 - FLEVEL
      ?auto_1974730 - CITY
      ?auto_1974727 - CITY
      ?auto_1974728 - CITY
      ?auto_1974732 - CITY
      ?auto_1974729 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1974726 ?auto_1974731 ) ( PERSON-AT ?auto_1974724 ?auto_1974730 ) ( not ( = ?auto_1974719 ?auto_1974730 ) ) ( not ( = ?auto_1974726 ?auto_1974731 ) ) ( PERSON-AT ?auto_1974722 ?auto_1974727 ) ( not ( = ?auto_1974719 ?auto_1974727 ) ) ( PERSON-AT ?auto_1974721 ?auto_1974730 ) ( PERSON-AT ?auto_1974725 ?auto_1974728 ) ( not ( = ?auto_1974719 ?auto_1974728 ) ) ( PERSON-AT ?auto_1974723 ?auto_1974732 ) ( not ( = ?auto_1974719 ?auto_1974732 ) ) ( PERSON-AT ?auto_1974720 ?auto_1974727 ) ( AIRCRAFT-AT ?auto_1974729 ?auto_1974719 ) ( FUEL-LEVEL ?auto_1974729 ?auto_1974726 ) ( not ( = ?auto_1974720 ?auto_1974723 ) ) ( not ( = ?auto_1974732 ?auto_1974727 ) ) ( not ( = ?auto_1974720 ?auto_1974725 ) ) ( not ( = ?auto_1974723 ?auto_1974725 ) ) ( not ( = ?auto_1974728 ?auto_1974732 ) ) ( not ( = ?auto_1974728 ?auto_1974727 ) ) ( not ( = ?auto_1974720 ?auto_1974721 ) ) ( not ( = ?auto_1974723 ?auto_1974721 ) ) ( not ( = ?auto_1974725 ?auto_1974721 ) ) ( not ( = ?auto_1974730 ?auto_1974728 ) ) ( not ( = ?auto_1974730 ?auto_1974732 ) ) ( not ( = ?auto_1974730 ?auto_1974727 ) ) ( not ( = ?auto_1974720 ?auto_1974722 ) ) ( not ( = ?auto_1974723 ?auto_1974722 ) ) ( not ( = ?auto_1974725 ?auto_1974722 ) ) ( not ( = ?auto_1974721 ?auto_1974722 ) ) ( not ( = ?auto_1974720 ?auto_1974724 ) ) ( not ( = ?auto_1974723 ?auto_1974724 ) ) ( not ( = ?auto_1974725 ?auto_1974724 ) ) ( not ( = ?auto_1974721 ?auto_1974724 ) ) ( not ( = ?auto_1974722 ?auto_1974724 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1974720 ?auto_1974723 ?auto_1974725 ?auto_1974721 ?auto_1974724 ?auto_1974722 ?auto_1974719 )
      ( FLY-6PPL-VERIFY ?auto_1974720 ?auto_1974721 ?auto_1974722 ?auto_1974723 ?auto_1974724 ?auto_1974725 ?auto_1974719 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1975396 - PERSON
      ?auto_1975397 - PERSON
      ?auto_1975398 - PERSON
      ?auto_1975399 - PERSON
      ?auto_1975400 - PERSON
      ?auto_1975401 - PERSON
      ?auto_1975395 - CITY
    )
    :vars
    (
      ?auto_1975402 - FLEVEL
      ?auto_1975407 - FLEVEL
      ?auto_1975406 - CITY
      ?auto_1975403 - CITY
      ?auto_1975404 - CITY
      ?auto_1975408 - CITY
      ?auto_1975405 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1975402 ?auto_1975407 ) ( PERSON-AT ?auto_1975399 ?auto_1975406 ) ( not ( = ?auto_1975395 ?auto_1975406 ) ) ( not ( = ?auto_1975402 ?auto_1975407 ) ) ( PERSON-AT ?auto_1975398 ?auto_1975403 ) ( not ( = ?auto_1975395 ?auto_1975403 ) ) ( PERSON-AT ?auto_1975397 ?auto_1975406 ) ( PERSON-AT ?auto_1975401 ?auto_1975404 ) ( not ( = ?auto_1975395 ?auto_1975404 ) ) ( PERSON-AT ?auto_1975400 ?auto_1975408 ) ( not ( = ?auto_1975395 ?auto_1975408 ) ) ( PERSON-AT ?auto_1975396 ?auto_1975403 ) ( AIRCRAFT-AT ?auto_1975405 ?auto_1975395 ) ( FUEL-LEVEL ?auto_1975405 ?auto_1975402 ) ( not ( = ?auto_1975396 ?auto_1975400 ) ) ( not ( = ?auto_1975408 ?auto_1975403 ) ) ( not ( = ?auto_1975396 ?auto_1975401 ) ) ( not ( = ?auto_1975400 ?auto_1975401 ) ) ( not ( = ?auto_1975404 ?auto_1975408 ) ) ( not ( = ?auto_1975404 ?auto_1975403 ) ) ( not ( = ?auto_1975396 ?auto_1975397 ) ) ( not ( = ?auto_1975400 ?auto_1975397 ) ) ( not ( = ?auto_1975401 ?auto_1975397 ) ) ( not ( = ?auto_1975406 ?auto_1975404 ) ) ( not ( = ?auto_1975406 ?auto_1975408 ) ) ( not ( = ?auto_1975406 ?auto_1975403 ) ) ( not ( = ?auto_1975396 ?auto_1975398 ) ) ( not ( = ?auto_1975400 ?auto_1975398 ) ) ( not ( = ?auto_1975401 ?auto_1975398 ) ) ( not ( = ?auto_1975397 ?auto_1975398 ) ) ( not ( = ?auto_1975396 ?auto_1975399 ) ) ( not ( = ?auto_1975400 ?auto_1975399 ) ) ( not ( = ?auto_1975401 ?auto_1975399 ) ) ( not ( = ?auto_1975397 ?auto_1975399 ) ) ( not ( = ?auto_1975398 ?auto_1975399 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1975396 ?auto_1975400 ?auto_1975401 ?auto_1975397 ?auto_1975399 ?auto_1975398 ?auto_1975395 )
      ( FLY-6PPL-VERIFY ?auto_1975396 ?auto_1975397 ?auto_1975398 ?auto_1975399 ?auto_1975400 ?auto_1975401 ?auto_1975395 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1976646 - PERSON
      ?auto_1976647 - PERSON
      ?auto_1976648 - PERSON
      ?auto_1976649 - PERSON
      ?auto_1976650 - PERSON
      ?auto_1976651 - PERSON
      ?auto_1976645 - CITY
    )
    :vars
    (
      ?auto_1976652 - FLEVEL
      ?auto_1976657 - FLEVEL
      ?auto_1976656 - CITY
      ?auto_1976653 - CITY
      ?auto_1976654 - CITY
      ?auto_1976658 - CITY
      ?auto_1976655 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1976652 ?auto_1976657 ) ( PERSON-AT ?auto_1976648 ?auto_1976656 ) ( not ( = ?auto_1976645 ?auto_1976656 ) ) ( not ( = ?auto_1976652 ?auto_1976657 ) ) ( PERSON-AT ?auto_1976651 ?auto_1976653 ) ( not ( = ?auto_1976645 ?auto_1976653 ) ) ( PERSON-AT ?auto_1976647 ?auto_1976656 ) ( PERSON-AT ?auto_1976650 ?auto_1976654 ) ( not ( = ?auto_1976645 ?auto_1976654 ) ) ( PERSON-AT ?auto_1976649 ?auto_1976658 ) ( not ( = ?auto_1976645 ?auto_1976658 ) ) ( PERSON-AT ?auto_1976646 ?auto_1976653 ) ( AIRCRAFT-AT ?auto_1976655 ?auto_1976645 ) ( FUEL-LEVEL ?auto_1976655 ?auto_1976652 ) ( not ( = ?auto_1976646 ?auto_1976649 ) ) ( not ( = ?auto_1976658 ?auto_1976653 ) ) ( not ( = ?auto_1976646 ?auto_1976650 ) ) ( not ( = ?auto_1976649 ?auto_1976650 ) ) ( not ( = ?auto_1976654 ?auto_1976658 ) ) ( not ( = ?auto_1976654 ?auto_1976653 ) ) ( not ( = ?auto_1976646 ?auto_1976647 ) ) ( not ( = ?auto_1976649 ?auto_1976647 ) ) ( not ( = ?auto_1976650 ?auto_1976647 ) ) ( not ( = ?auto_1976656 ?auto_1976654 ) ) ( not ( = ?auto_1976656 ?auto_1976658 ) ) ( not ( = ?auto_1976656 ?auto_1976653 ) ) ( not ( = ?auto_1976646 ?auto_1976651 ) ) ( not ( = ?auto_1976649 ?auto_1976651 ) ) ( not ( = ?auto_1976650 ?auto_1976651 ) ) ( not ( = ?auto_1976647 ?auto_1976651 ) ) ( not ( = ?auto_1976646 ?auto_1976648 ) ) ( not ( = ?auto_1976649 ?auto_1976648 ) ) ( not ( = ?auto_1976650 ?auto_1976648 ) ) ( not ( = ?auto_1976647 ?auto_1976648 ) ) ( not ( = ?auto_1976651 ?auto_1976648 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1976646 ?auto_1976649 ?auto_1976650 ?auto_1976647 ?auto_1976648 ?auto_1976651 ?auto_1976645 )
      ( FLY-6PPL-VERIFY ?auto_1976646 ?auto_1976647 ?auto_1976648 ?auto_1976649 ?auto_1976650 ?auto_1976651 ?auto_1976645 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1976799 - PERSON
      ?auto_1976800 - PERSON
      ?auto_1976801 - PERSON
      ?auto_1976802 - PERSON
      ?auto_1976803 - PERSON
      ?auto_1976804 - PERSON
      ?auto_1976798 - CITY
    )
    :vars
    (
      ?auto_1976805 - FLEVEL
      ?auto_1976810 - FLEVEL
      ?auto_1976809 - CITY
      ?auto_1976806 - CITY
      ?auto_1976807 - CITY
      ?auto_1976811 - CITY
      ?auto_1976808 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1976805 ?auto_1976810 ) ( PERSON-AT ?auto_1976801 ?auto_1976809 ) ( not ( = ?auto_1976798 ?auto_1976809 ) ) ( not ( = ?auto_1976805 ?auto_1976810 ) ) ( PERSON-AT ?auto_1976803 ?auto_1976806 ) ( not ( = ?auto_1976798 ?auto_1976806 ) ) ( PERSON-AT ?auto_1976800 ?auto_1976809 ) ( PERSON-AT ?auto_1976804 ?auto_1976807 ) ( not ( = ?auto_1976798 ?auto_1976807 ) ) ( PERSON-AT ?auto_1976802 ?auto_1976811 ) ( not ( = ?auto_1976798 ?auto_1976811 ) ) ( PERSON-AT ?auto_1976799 ?auto_1976806 ) ( AIRCRAFT-AT ?auto_1976808 ?auto_1976798 ) ( FUEL-LEVEL ?auto_1976808 ?auto_1976805 ) ( not ( = ?auto_1976799 ?auto_1976802 ) ) ( not ( = ?auto_1976811 ?auto_1976806 ) ) ( not ( = ?auto_1976799 ?auto_1976804 ) ) ( not ( = ?auto_1976802 ?auto_1976804 ) ) ( not ( = ?auto_1976807 ?auto_1976811 ) ) ( not ( = ?auto_1976807 ?auto_1976806 ) ) ( not ( = ?auto_1976799 ?auto_1976800 ) ) ( not ( = ?auto_1976802 ?auto_1976800 ) ) ( not ( = ?auto_1976804 ?auto_1976800 ) ) ( not ( = ?auto_1976809 ?auto_1976807 ) ) ( not ( = ?auto_1976809 ?auto_1976811 ) ) ( not ( = ?auto_1976809 ?auto_1976806 ) ) ( not ( = ?auto_1976799 ?auto_1976803 ) ) ( not ( = ?auto_1976802 ?auto_1976803 ) ) ( not ( = ?auto_1976804 ?auto_1976803 ) ) ( not ( = ?auto_1976800 ?auto_1976803 ) ) ( not ( = ?auto_1976799 ?auto_1976801 ) ) ( not ( = ?auto_1976802 ?auto_1976801 ) ) ( not ( = ?auto_1976804 ?auto_1976801 ) ) ( not ( = ?auto_1976800 ?auto_1976801 ) ) ( not ( = ?auto_1976803 ?auto_1976801 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1976799 ?auto_1976802 ?auto_1976804 ?auto_1976800 ?auto_1976801 ?auto_1976803 ?auto_1976798 )
      ( FLY-6PPL-VERIFY ?auto_1976799 ?auto_1976800 ?auto_1976801 ?auto_1976802 ?auto_1976803 ?auto_1976804 ?auto_1976798 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1978195 - PERSON
      ?auto_1978196 - PERSON
      ?auto_1978197 - PERSON
      ?auto_1978198 - PERSON
      ?auto_1978199 - PERSON
      ?auto_1978200 - PERSON
      ?auto_1978194 - CITY
    )
    :vars
    (
      ?auto_1978201 - FLEVEL
      ?auto_1978206 - FLEVEL
      ?auto_1978205 - CITY
      ?auto_1978202 - CITY
      ?auto_1978203 - CITY
      ?auto_1978207 - CITY
      ?auto_1978204 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1978201 ?auto_1978206 ) ( PERSON-AT ?auto_1978197 ?auto_1978205 ) ( not ( = ?auto_1978194 ?auto_1978205 ) ) ( not ( = ?auto_1978201 ?auto_1978206 ) ) ( PERSON-AT ?auto_1978198 ?auto_1978202 ) ( not ( = ?auto_1978194 ?auto_1978202 ) ) ( PERSON-AT ?auto_1978196 ?auto_1978205 ) ( PERSON-AT ?auto_1978200 ?auto_1978203 ) ( not ( = ?auto_1978194 ?auto_1978203 ) ) ( PERSON-AT ?auto_1978199 ?auto_1978207 ) ( not ( = ?auto_1978194 ?auto_1978207 ) ) ( PERSON-AT ?auto_1978195 ?auto_1978202 ) ( AIRCRAFT-AT ?auto_1978204 ?auto_1978194 ) ( FUEL-LEVEL ?auto_1978204 ?auto_1978201 ) ( not ( = ?auto_1978195 ?auto_1978199 ) ) ( not ( = ?auto_1978207 ?auto_1978202 ) ) ( not ( = ?auto_1978195 ?auto_1978200 ) ) ( not ( = ?auto_1978199 ?auto_1978200 ) ) ( not ( = ?auto_1978203 ?auto_1978207 ) ) ( not ( = ?auto_1978203 ?auto_1978202 ) ) ( not ( = ?auto_1978195 ?auto_1978196 ) ) ( not ( = ?auto_1978199 ?auto_1978196 ) ) ( not ( = ?auto_1978200 ?auto_1978196 ) ) ( not ( = ?auto_1978205 ?auto_1978203 ) ) ( not ( = ?auto_1978205 ?auto_1978207 ) ) ( not ( = ?auto_1978205 ?auto_1978202 ) ) ( not ( = ?auto_1978195 ?auto_1978198 ) ) ( not ( = ?auto_1978199 ?auto_1978198 ) ) ( not ( = ?auto_1978200 ?auto_1978198 ) ) ( not ( = ?auto_1978196 ?auto_1978198 ) ) ( not ( = ?auto_1978195 ?auto_1978197 ) ) ( not ( = ?auto_1978199 ?auto_1978197 ) ) ( not ( = ?auto_1978200 ?auto_1978197 ) ) ( not ( = ?auto_1978196 ?auto_1978197 ) ) ( not ( = ?auto_1978198 ?auto_1978197 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1978195 ?auto_1978199 ?auto_1978200 ?auto_1978196 ?auto_1978197 ?auto_1978198 ?auto_1978194 )
      ( FLY-6PPL-VERIFY ?auto_1978195 ?auto_1978196 ?auto_1978197 ?auto_1978198 ?auto_1978199 ?auto_1978200 ?auto_1978194 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1981043 - PERSON
      ?auto_1981044 - PERSON
      ?auto_1981045 - PERSON
      ?auto_1981046 - PERSON
      ?auto_1981047 - PERSON
      ?auto_1981048 - PERSON
      ?auto_1981042 - CITY
    )
    :vars
    (
      ?auto_1981049 - FLEVEL
      ?auto_1981054 - FLEVEL
      ?auto_1981053 - CITY
      ?auto_1981050 - CITY
      ?auto_1981051 - CITY
      ?auto_1981055 - CITY
      ?auto_1981052 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1981049 ?auto_1981054 ) ( PERSON-AT ?auto_1981048 ?auto_1981053 ) ( not ( = ?auto_1981042 ?auto_1981053 ) ) ( not ( = ?auto_1981049 ?auto_1981054 ) ) ( PERSON-AT ?auto_1981044 ?auto_1981050 ) ( not ( = ?auto_1981042 ?auto_1981050 ) ) ( PERSON-AT ?auto_1981047 ?auto_1981053 ) ( PERSON-AT ?auto_1981046 ?auto_1981051 ) ( not ( = ?auto_1981042 ?auto_1981051 ) ) ( PERSON-AT ?auto_1981045 ?auto_1981055 ) ( not ( = ?auto_1981042 ?auto_1981055 ) ) ( PERSON-AT ?auto_1981043 ?auto_1981050 ) ( AIRCRAFT-AT ?auto_1981052 ?auto_1981042 ) ( FUEL-LEVEL ?auto_1981052 ?auto_1981049 ) ( not ( = ?auto_1981043 ?auto_1981045 ) ) ( not ( = ?auto_1981055 ?auto_1981050 ) ) ( not ( = ?auto_1981043 ?auto_1981046 ) ) ( not ( = ?auto_1981045 ?auto_1981046 ) ) ( not ( = ?auto_1981051 ?auto_1981055 ) ) ( not ( = ?auto_1981051 ?auto_1981050 ) ) ( not ( = ?auto_1981043 ?auto_1981047 ) ) ( not ( = ?auto_1981045 ?auto_1981047 ) ) ( not ( = ?auto_1981046 ?auto_1981047 ) ) ( not ( = ?auto_1981053 ?auto_1981051 ) ) ( not ( = ?auto_1981053 ?auto_1981055 ) ) ( not ( = ?auto_1981053 ?auto_1981050 ) ) ( not ( = ?auto_1981043 ?auto_1981044 ) ) ( not ( = ?auto_1981045 ?auto_1981044 ) ) ( not ( = ?auto_1981046 ?auto_1981044 ) ) ( not ( = ?auto_1981047 ?auto_1981044 ) ) ( not ( = ?auto_1981043 ?auto_1981048 ) ) ( not ( = ?auto_1981045 ?auto_1981048 ) ) ( not ( = ?auto_1981046 ?auto_1981048 ) ) ( not ( = ?auto_1981047 ?auto_1981048 ) ) ( not ( = ?auto_1981044 ?auto_1981048 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1981043 ?auto_1981045 ?auto_1981046 ?auto_1981047 ?auto_1981048 ?auto_1981044 ?auto_1981042 )
      ( FLY-6PPL-VERIFY ?auto_1981043 ?auto_1981044 ?auto_1981045 ?auto_1981046 ?auto_1981047 ?auto_1981048 ?auto_1981042 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1981184 - PERSON
      ?auto_1981185 - PERSON
      ?auto_1981186 - PERSON
      ?auto_1981187 - PERSON
      ?auto_1981188 - PERSON
      ?auto_1981189 - PERSON
      ?auto_1981183 - CITY
    )
    :vars
    (
      ?auto_1981190 - FLEVEL
      ?auto_1981195 - FLEVEL
      ?auto_1981194 - CITY
      ?auto_1981191 - CITY
      ?auto_1981192 - CITY
      ?auto_1981196 - CITY
      ?auto_1981193 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1981190 ?auto_1981195 ) ( PERSON-AT ?auto_1981189 ?auto_1981194 ) ( not ( = ?auto_1981183 ?auto_1981194 ) ) ( not ( = ?auto_1981190 ?auto_1981195 ) ) ( PERSON-AT ?auto_1981185 ?auto_1981191 ) ( not ( = ?auto_1981183 ?auto_1981191 ) ) ( PERSON-AT ?auto_1981187 ?auto_1981194 ) ( PERSON-AT ?auto_1981188 ?auto_1981192 ) ( not ( = ?auto_1981183 ?auto_1981192 ) ) ( PERSON-AT ?auto_1981186 ?auto_1981196 ) ( not ( = ?auto_1981183 ?auto_1981196 ) ) ( PERSON-AT ?auto_1981184 ?auto_1981191 ) ( AIRCRAFT-AT ?auto_1981193 ?auto_1981183 ) ( FUEL-LEVEL ?auto_1981193 ?auto_1981190 ) ( not ( = ?auto_1981184 ?auto_1981186 ) ) ( not ( = ?auto_1981196 ?auto_1981191 ) ) ( not ( = ?auto_1981184 ?auto_1981188 ) ) ( not ( = ?auto_1981186 ?auto_1981188 ) ) ( not ( = ?auto_1981192 ?auto_1981196 ) ) ( not ( = ?auto_1981192 ?auto_1981191 ) ) ( not ( = ?auto_1981184 ?auto_1981187 ) ) ( not ( = ?auto_1981186 ?auto_1981187 ) ) ( not ( = ?auto_1981188 ?auto_1981187 ) ) ( not ( = ?auto_1981194 ?auto_1981192 ) ) ( not ( = ?auto_1981194 ?auto_1981196 ) ) ( not ( = ?auto_1981194 ?auto_1981191 ) ) ( not ( = ?auto_1981184 ?auto_1981185 ) ) ( not ( = ?auto_1981186 ?auto_1981185 ) ) ( not ( = ?auto_1981188 ?auto_1981185 ) ) ( not ( = ?auto_1981187 ?auto_1981185 ) ) ( not ( = ?auto_1981184 ?auto_1981189 ) ) ( not ( = ?auto_1981186 ?auto_1981189 ) ) ( not ( = ?auto_1981188 ?auto_1981189 ) ) ( not ( = ?auto_1981187 ?auto_1981189 ) ) ( not ( = ?auto_1981185 ?auto_1981189 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1981184 ?auto_1981186 ?auto_1981188 ?auto_1981187 ?auto_1981189 ?auto_1981185 ?auto_1981183 )
      ( FLY-6PPL-VERIFY ?auto_1981184 ?auto_1981185 ?auto_1981186 ?auto_1981187 ?auto_1981188 ?auto_1981189 ?auto_1981183 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1981258 - PERSON
      ?auto_1981259 - PERSON
      ?auto_1981260 - PERSON
      ?auto_1981261 - PERSON
      ?auto_1981262 - PERSON
      ?auto_1981263 - PERSON
      ?auto_1981257 - CITY
    )
    :vars
    (
      ?auto_1981264 - FLEVEL
      ?auto_1981269 - FLEVEL
      ?auto_1981268 - CITY
      ?auto_1981265 - CITY
      ?auto_1981266 - CITY
      ?auto_1981270 - CITY
      ?auto_1981267 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1981264 ?auto_1981269 ) ( PERSON-AT ?auto_1981262 ?auto_1981268 ) ( not ( = ?auto_1981257 ?auto_1981268 ) ) ( not ( = ?auto_1981264 ?auto_1981269 ) ) ( PERSON-AT ?auto_1981259 ?auto_1981265 ) ( not ( = ?auto_1981257 ?auto_1981265 ) ) ( PERSON-AT ?auto_1981261 ?auto_1981268 ) ( PERSON-AT ?auto_1981263 ?auto_1981266 ) ( not ( = ?auto_1981257 ?auto_1981266 ) ) ( PERSON-AT ?auto_1981260 ?auto_1981270 ) ( not ( = ?auto_1981257 ?auto_1981270 ) ) ( PERSON-AT ?auto_1981258 ?auto_1981265 ) ( AIRCRAFT-AT ?auto_1981267 ?auto_1981257 ) ( FUEL-LEVEL ?auto_1981267 ?auto_1981264 ) ( not ( = ?auto_1981258 ?auto_1981260 ) ) ( not ( = ?auto_1981270 ?auto_1981265 ) ) ( not ( = ?auto_1981258 ?auto_1981263 ) ) ( not ( = ?auto_1981260 ?auto_1981263 ) ) ( not ( = ?auto_1981266 ?auto_1981270 ) ) ( not ( = ?auto_1981266 ?auto_1981265 ) ) ( not ( = ?auto_1981258 ?auto_1981261 ) ) ( not ( = ?auto_1981260 ?auto_1981261 ) ) ( not ( = ?auto_1981263 ?auto_1981261 ) ) ( not ( = ?auto_1981268 ?auto_1981266 ) ) ( not ( = ?auto_1981268 ?auto_1981270 ) ) ( not ( = ?auto_1981268 ?auto_1981265 ) ) ( not ( = ?auto_1981258 ?auto_1981259 ) ) ( not ( = ?auto_1981260 ?auto_1981259 ) ) ( not ( = ?auto_1981263 ?auto_1981259 ) ) ( not ( = ?auto_1981261 ?auto_1981259 ) ) ( not ( = ?auto_1981258 ?auto_1981262 ) ) ( not ( = ?auto_1981260 ?auto_1981262 ) ) ( not ( = ?auto_1981263 ?auto_1981262 ) ) ( not ( = ?auto_1981261 ?auto_1981262 ) ) ( not ( = ?auto_1981259 ?auto_1981262 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1981258 ?auto_1981260 ?auto_1981263 ?auto_1981261 ?auto_1981262 ?auto_1981259 ?auto_1981257 )
      ( FLY-6PPL-VERIFY ?auto_1981258 ?auto_1981259 ?auto_1981260 ?auto_1981261 ?auto_1981262 ?auto_1981263 ?auto_1981257 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1983585 - PERSON
      ?auto_1983586 - PERSON
      ?auto_1983587 - PERSON
      ?auto_1983588 - PERSON
      ?auto_1983589 - PERSON
      ?auto_1983590 - PERSON
      ?auto_1983584 - CITY
    )
    :vars
    (
      ?auto_1983591 - FLEVEL
      ?auto_1983596 - FLEVEL
      ?auto_1983595 - CITY
      ?auto_1983592 - CITY
      ?auto_1983593 - CITY
      ?auto_1983597 - CITY
      ?auto_1983594 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1983591 ?auto_1983596 ) ( PERSON-AT ?auto_1983590 ?auto_1983595 ) ( not ( = ?auto_1983584 ?auto_1983595 ) ) ( not ( = ?auto_1983591 ?auto_1983596 ) ) ( PERSON-AT ?auto_1983586 ?auto_1983592 ) ( not ( = ?auto_1983584 ?auto_1983592 ) ) ( PERSON-AT ?auto_1983587 ?auto_1983595 ) ( PERSON-AT ?auto_1983589 ?auto_1983593 ) ( not ( = ?auto_1983584 ?auto_1983593 ) ) ( PERSON-AT ?auto_1983588 ?auto_1983597 ) ( not ( = ?auto_1983584 ?auto_1983597 ) ) ( PERSON-AT ?auto_1983585 ?auto_1983592 ) ( AIRCRAFT-AT ?auto_1983594 ?auto_1983584 ) ( FUEL-LEVEL ?auto_1983594 ?auto_1983591 ) ( not ( = ?auto_1983585 ?auto_1983588 ) ) ( not ( = ?auto_1983597 ?auto_1983592 ) ) ( not ( = ?auto_1983585 ?auto_1983589 ) ) ( not ( = ?auto_1983588 ?auto_1983589 ) ) ( not ( = ?auto_1983593 ?auto_1983597 ) ) ( not ( = ?auto_1983593 ?auto_1983592 ) ) ( not ( = ?auto_1983585 ?auto_1983587 ) ) ( not ( = ?auto_1983588 ?auto_1983587 ) ) ( not ( = ?auto_1983589 ?auto_1983587 ) ) ( not ( = ?auto_1983595 ?auto_1983593 ) ) ( not ( = ?auto_1983595 ?auto_1983597 ) ) ( not ( = ?auto_1983595 ?auto_1983592 ) ) ( not ( = ?auto_1983585 ?auto_1983586 ) ) ( not ( = ?auto_1983588 ?auto_1983586 ) ) ( not ( = ?auto_1983589 ?auto_1983586 ) ) ( not ( = ?auto_1983587 ?auto_1983586 ) ) ( not ( = ?auto_1983585 ?auto_1983590 ) ) ( not ( = ?auto_1983588 ?auto_1983590 ) ) ( not ( = ?auto_1983589 ?auto_1983590 ) ) ( not ( = ?auto_1983587 ?auto_1983590 ) ) ( not ( = ?auto_1983586 ?auto_1983590 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1983585 ?auto_1983588 ?auto_1983589 ?auto_1983587 ?auto_1983590 ?auto_1983586 ?auto_1983584 )
      ( FLY-6PPL-VERIFY ?auto_1983585 ?auto_1983586 ?auto_1983587 ?auto_1983588 ?auto_1983589 ?auto_1983590 ?auto_1983584 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1983659 - PERSON
      ?auto_1983660 - PERSON
      ?auto_1983661 - PERSON
      ?auto_1983662 - PERSON
      ?auto_1983663 - PERSON
      ?auto_1983664 - PERSON
      ?auto_1983658 - CITY
    )
    :vars
    (
      ?auto_1983665 - FLEVEL
      ?auto_1983670 - FLEVEL
      ?auto_1983669 - CITY
      ?auto_1983666 - CITY
      ?auto_1983667 - CITY
      ?auto_1983671 - CITY
      ?auto_1983668 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1983665 ?auto_1983670 ) ( PERSON-AT ?auto_1983663 ?auto_1983669 ) ( not ( = ?auto_1983658 ?auto_1983669 ) ) ( not ( = ?auto_1983665 ?auto_1983670 ) ) ( PERSON-AT ?auto_1983660 ?auto_1983666 ) ( not ( = ?auto_1983658 ?auto_1983666 ) ) ( PERSON-AT ?auto_1983661 ?auto_1983669 ) ( PERSON-AT ?auto_1983664 ?auto_1983667 ) ( not ( = ?auto_1983658 ?auto_1983667 ) ) ( PERSON-AT ?auto_1983662 ?auto_1983671 ) ( not ( = ?auto_1983658 ?auto_1983671 ) ) ( PERSON-AT ?auto_1983659 ?auto_1983666 ) ( AIRCRAFT-AT ?auto_1983668 ?auto_1983658 ) ( FUEL-LEVEL ?auto_1983668 ?auto_1983665 ) ( not ( = ?auto_1983659 ?auto_1983662 ) ) ( not ( = ?auto_1983671 ?auto_1983666 ) ) ( not ( = ?auto_1983659 ?auto_1983664 ) ) ( not ( = ?auto_1983662 ?auto_1983664 ) ) ( not ( = ?auto_1983667 ?auto_1983671 ) ) ( not ( = ?auto_1983667 ?auto_1983666 ) ) ( not ( = ?auto_1983659 ?auto_1983661 ) ) ( not ( = ?auto_1983662 ?auto_1983661 ) ) ( not ( = ?auto_1983664 ?auto_1983661 ) ) ( not ( = ?auto_1983669 ?auto_1983667 ) ) ( not ( = ?auto_1983669 ?auto_1983671 ) ) ( not ( = ?auto_1983669 ?auto_1983666 ) ) ( not ( = ?auto_1983659 ?auto_1983660 ) ) ( not ( = ?auto_1983662 ?auto_1983660 ) ) ( not ( = ?auto_1983664 ?auto_1983660 ) ) ( not ( = ?auto_1983661 ?auto_1983660 ) ) ( not ( = ?auto_1983659 ?auto_1983663 ) ) ( not ( = ?auto_1983662 ?auto_1983663 ) ) ( not ( = ?auto_1983664 ?auto_1983663 ) ) ( not ( = ?auto_1983661 ?auto_1983663 ) ) ( not ( = ?auto_1983660 ?auto_1983663 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1983659 ?auto_1983662 ?auto_1983664 ?auto_1983661 ?auto_1983663 ?auto_1983660 ?auto_1983658 )
      ( FLY-6PPL-VERIFY ?auto_1983659 ?auto_1983660 ?auto_1983661 ?auto_1983662 ?auto_1983663 ?auto_1983664 ?auto_1983658 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_1984335 - PERSON
      ?auto_1984336 - PERSON
      ?auto_1984337 - PERSON
      ?auto_1984338 - PERSON
      ?auto_1984339 - PERSON
      ?auto_1984340 - PERSON
      ?auto_1984334 - CITY
    )
    :vars
    (
      ?auto_1984341 - FLEVEL
      ?auto_1984346 - FLEVEL
      ?auto_1984345 - CITY
      ?auto_1984342 - CITY
      ?auto_1984343 - CITY
      ?auto_1984347 - CITY
      ?auto_1984344 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1984341 ?auto_1984346 ) ( PERSON-AT ?auto_1984338 ?auto_1984345 ) ( not ( = ?auto_1984334 ?auto_1984345 ) ) ( not ( = ?auto_1984341 ?auto_1984346 ) ) ( PERSON-AT ?auto_1984336 ?auto_1984342 ) ( not ( = ?auto_1984334 ?auto_1984342 ) ) ( PERSON-AT ?auto_1984337 ?auto_1984345 ) ( PERSON-AT ?auto_1984340 ?auto_1984343 ) ( not ( = ?auto_1984334 ?auto_1984343 ) ) ( PERSON-AT ?auto_1984339 ?auto_1984347 ) ( not ( = ?auto_1984334 ?auto_1984347 ) ) ( PERSON-AT ?auto_1984335 ?auto_1984342 ) ( AIRCRAFT-AT ?auto_1984344 ?auto_1984334 ) ( FUEL-LEVEL ?auto_1984344 ?auto_1984341 ) ( not ( = ?auto_1984335 ?auto_1984339 ) ) ( not ( = ?auto_1984347 ?auto_1984342 ) ) ( not ( = ?auto_1984335 ?auto_1984340 ) ) ( not ( = ?auto_1984339 ?auto_1984340 ) ) ( not ( = ?auto_1984343 ?auto_1984347 ) ) ( not ( = ?auto_1984343 ?auto_1984342 ) ) ( not ( = ?auto_1984335 ?auto_1984337 ) ) ( not ( = ?auto_1984339 ?auto_1984337 ) ) ( not ( = ?auto_1984340 ?auto_1984337 ) ) ( not ( = ?auto_1984345 ?auto_1984343 ) ) ( not ( = ?auto_1984345 ?auto_1984347 ) ) ( not ( = ?auto_1984345 ?auto_1984342 ) ) ( not ( = ?auto_1984335 ?auto_1984336 ) ) ( not ( = ?auto_1984339 ?auto_1984336 ) ) ( not ( = ?auto_1984340 ?auto_1984336 ) ) ( not ( = ?auto_1984337 ?auto_1984336 ) ) ( not ( = ?auto_1984335 ?auto_1984338 ) ) ( not ( = ?auto_1984339 ?auto_1984338 ) ) ( not ( = ?auto_1984340 ?auto_1984338 ) ) ( not ( = ?auto_1984337 ?auto_1984338 ) ) ( not ( = ?auto_1984336 ?auto_1984338 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_1984335 ?auto_1984339 ?auto_1984340 ?auto_1984337 ?auto_1984338 ?auto_1984336 ?auto_1984334 )
      ( FLY-6PPL-VERIFY ?auto_1984335 ?auto_1984336 ?auto_1984337 ?auto_1984338 ?auto_1984339 ?auto_1984340 ?auto_1984334 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2013538 - PERSON
      ?auto_2013539 - PERSON
      ?auto_2013540 - PERSON
      ?auto_2013541 - PERSON
      ?auto_2013542 - PERSON
      ?auto_2013543 - PERSON
      ?auto_2013537 - CITY
    )
    :vars
    (
      ?auto_2013544 - FLEVEL
      ?auto_2013549 - FLEVEL
      ?auto_2013548 - CITY
      ?auto_2013545 - CITY
      ?auto_2013546 - CITY
      ?auto_2013550 - CITY
      ?auto_2013547 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2013544 ?auto_2013549 ) ( PERSON-AT ?auto_2013543 ?auto_2013548 ) ( not ( = ?auto_2013537 ?auto_2013548 ) ) ( not ( = ?auto_2013544 ?auto_2013549 ) ) ( PERSON-AT ?auto_2013542 ?auto_2013545 ) ( not ( = ?auto_2013537 ?auto_2013545 ) ) ( PERSON-AT ?auto_2013541 ?auto_2013548 ) ( PERSON-AT ?auto_2013540 ?auto_2013546 ) ( not ( = ?auto_2013537 ?auto_2013546 ) ) ( PERSON-AT ?auto_2013538 ?auto_2013550 ) ( not ( = ?auto_2013537 ?auto_2013550 ) ) ( PERSON-AT ?auto_2013539 ?auto_2013545 ) ( AIRCRAFT-AT ?auto_2013547 ?auto_2013537 ) ( FUEL-LEVEL ?auto_2013547 ?auto_2013544 ) ( not ( = ?auto_2013539 ?auto_2013538 ) ) ( not ( = ?auto_2013550 ?auto_2013545 ) ) ( not ( = ?auto_2013539 ?auto_2013540 ) ) ( not ( = ?auto_2013538 ?auto_2013540 ) ) ( not ( = ?auto_2013546 ?auto_2013550 ) ) ( not ( = ?auto_2013546 ?auto_2013545 ) ) ( not ( = ?auto_2013539 ?auto_2013541 ) ) ( not ( = ?auto_2013538 ?auto_2013541 ) ) ( not ( = ?auto_2013540 ?auto_2013541 ) ) ( not ( = ?auto_2013548 ?auto_2013546 ) ) ( not ( = ?auto_2013548 ?auto_2013550 ) ) ( not ( = ?auto_2013548 ?auto_2013545 ) ) ( not ( = ?auto_2013539 ?auto_2013542 ) ) ( not ( = ?auto_2013538 ?auto_2013542 ) ) ( not ( = ?auto_2013540 ?auto_2013542 ) ) ( not ( = ?auto_2013541 ?auto_2013542 ) ) ( not ( = ?auto_2013539 ?auto_2013543 ) ) ( not ( = ?auto_2013538 ?auto_2013543 ) ) ( not ( = ?auto_2013540 ?auto_2013543 ) ) ( not ( = ?auto_2013541 ?auto_2013543 ) ) ( not ( = ?auto_2013542 ?auto_2013543 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2013539 ?auto_2013538 ?auto_2013540 ?auto_2013541 ?auto_2013543 ?auto_2013542 ?auto_2013537 )
      ( FLY-6PPL-VERIFY ?auto_2013538 ?auto_2013539 ?auto_2013540 ?auto_2013541 ?auto_2013542 ?auto_2013543 ?auto_2013537 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2013612 - PERSON
      ?auto_2013613 - PERSON
      ?auto_2013614 - PERSON
      ?auto_2013615 - PERSON
      ?auto_2013616 - PERSON
      ?auto_2013617 - PERSON
      ?auto_2013611 - CITY
    )
    :vars
    (
      ?auto_2013618 - FLEVEL
      ?auto_2013623 - FLEVEL
      ?auto_2013622 - CITY
      ?auto_2013619 - CITY
      ?auto_2013620 - CITY
      ?auto_2013624 - CITY
      ?auto_2013621 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2013618 ?auto_2013623 ) ( PERSON-AT ?auto_2013616 ?auto_2013622 ) ( not ( = ?auto_2013611 ?auto_2013622 ) ) ( not ( = ?auto_2013618 ?auto_2013623 ) ) ( PERSON-AT ?auto_2013617 ?auto_2013619 ) ( not ( = ?auto_2013611 ?auto_2013619 ) ) ( PERSON-AT ?auto_2013615 ?auto_2013622 ) ( PERSON-AT ?auto_2013614 ?auto_2013620 ) ( not ( = ?auto_2013611 ?auto_2013620 ) ) ( PERSON-AT ?auto_2013612 ?auto_2013624 ) ( not ( = ?auto_2013611 ?auto_2013624 ) ) ( PERSON-AT ?auto_2013613 ?auto_2013619 ) ( AIRCRAFT-AT ?auto_2013621 ?auto_2013611 ) ( FUEL-LEVEL ?auto_2013621 ?auto_2013618 ) ( not ( = ?auto_2013613 ?auto_2013612 ) ) ( not ( = ?auto_2013624 ?auto_2013619 ) ) ( not ( = ?auto_2013613 ?auto_2013614 ) ) ( not ( = ?auto_2013612 ?auto_2013614 ) ) ( not ( = ?auto_2013620 ?auto_2013624 ) ) ( not ( = ?auto_2013620 ?auto_2013619 ) ) ( not ( = ?auto_2013613 ?auto_2013615 ) ) ( not ( = ?auto_2013612 ?auto_2013615 ) ) ( not ( = ?auto_2013614 ?auto_2013615 ) ) ( not ( = ?auto_2013622 ?auto_2013620 ) ) ( not ( = ?auto_2013622 ?auto_2013624 ) ) ( not ( = ?auto_2013622 ?auto_2013619 ) ) ( not ( = ?auto_2013613 ?auto_2013617 ) ) ( not ( = ?auto_2013612 ?auto_2013617 ) ) ( not ( = ?auto_2013614 ?auto_2013617 ) ) ( not ( = ?auto_2013615 ?auto_2013617 ) ) ( not ( = ?auto_2013613 ?auto_2013616 ) ) ( not ( = ?auto_2013612 ?auto_2013616 ) ) ( not ( = ?auto_2013614 ?auto_2013616 ) ) ( not ( = ?auto_2013615 ?auto_2013616 ) ) ( not ( = ?auto_2013617 ?auto_2013616 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2013613 ?auto_2013612 ?auto_2013614 ?auto_2013615 ?auto_2013616 ?auto_2013617 ?auto_2013611 )
      ( FLY-6PPL-VERIFY ?auto_2013612 ?auto_2013613 ?auto_2013614 ?auto_2013615 ?auto_2013616 ?auto_2013617 ?auto_2013611 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2013686 - PERSON
      ?auto_2013687 - PERSON
      ?auto_2013688 - PERSON
      ?auto_2013689 - PERSON
      ?auto_2013690 - PERSON
      ?auto_2013691 - PERSON
      ?auto_2013685 - CITY
    )
    :vars
    (
      ?auto_2013692 - FLEVEL
      ?auto_2013697 - FLEVEL
      ?auto_2013696 - CITY
      ?auto_2013693 - CITY
      ?auto_2013694 - CITY
      ?auto_2013698 - CITY
      ?auto_2013695 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2013692 ?auto_2013697 ) ( PERSON-AT ?auto_2013691 ?auto_2013696 ) ( not ( = ?auto_2013685 ?auto_2013696 ) ) ( not ( = ?auto_2013692 ?auto_2013697 ) ) ( PERSON-AT ?auto_2013689 ?auto_2013693 ) ( not ( = ?auto_2013685 ?auto_2013693 ) ) ( PERSON-AT ?auto_2013690 ?auto_2013696 ) ( PERSON-AT ?auto_2013688 ?auto_2013694 ) ( not ( = ?auto_2013685 ?auto_2013694 ) ) ( PERSON-AT ?auto_2013686 ?auto_2013698 ) ( not ( = ?auto_2013685 ?auto_2013698 ) ) ( PERSON-AT ?auto_2013687 ?auto_2013693 ) ( AIRCRAFT-AT ?auto_2013695 ?auto_2013685 ) ( FUEL-LEVEL ?auto_2013695 ?auto_2013692 ) ( not ( = ?auto_2013687 ?auto_2013686 ) ) ( not ( = ?auto_2013698 ?auto_2013693 ) ) ( not ( = ?auto_2013687 ?auto_2013688 ) ) ( not ( = ?auto_2013686 ?auto_2013688 ) ) ( not ( = ?auto_2013694 ?auto_2013698 ) ) ( not ( = ?auto_2013694 ?auto_2013693 ) ) ( not ( = ?auto_2013687 ?auto_2013690 ) ) ( not ( = ?auto_2013686 ?auto_2013690 ) ) ( not ( = ?auto_2013688 ?auto_2013690 ) ) ( not ( = ?auto_2013696 ?auto_2013694 ) ) ( not ( = ?auto_2013696 ?auto_2013698 ) ) ( not ( = ?auto_2013696 ?auto_2013693 ) ) ( not ( = ?auto_2013687 ?auto_2013689 ) ) ( not ( = ?auto_2013686 ?auto_2013689 ) ) ( not ( = ?auto_2013688 ?auto_2013689 ) ) ( not ( = ?auto_2013690 ?auto_2013689 ) ) ( not ( = ?auto_2013687 ?auto_2013691 ) ) ( not ( = ?auto_2013686 ?auto_2013691 ) ) ( not ( = ?auto_2013688 ?auto_2013691 ) ) ( not ( = ?auto_2013690 ?auto_2013691 ) ) ( not ( = ?auto_2013689 ?auto_2013691 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2013687 ?auto_2013686 ?auto_2013688 ?auto_2013690 ?auto_2013691 ?auto_2013689 ?auto_2013685 )
      ( FLY-6PPL-VERIFY ?auto_2013686 ?auto_2013687 ?auto_2013688 ?auto_2013689 ?auto_2013690 ?auto_2013691 ?auto_2013685 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2014741 - PERSON
      ?auto_2014742 - PERSON
      ?auto_2014743 - PERSON
      ?auto_2014744 - PERSON
      ?auto_2014745 - PERSON
      ?auto_2014746 - PERSON
      ?auto_2014740 - CITY
    )
    :vars
    (
      ?auto_2014747 - FLEVEL
      ?auto_2014752 - FLEVEL
      ?auto_2014751 - CITY
      ?auto_2014748 - CITY
      ?auto_2014749 - CITY
      ?auto_2014753 - CITY
      ?auto_2014750 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2014747 ?auto_2014752 ) ( PERSON-AT ?auto_2014746 ?auto_2014751 ) ( not ( = ?auto_2014740 ?auto_2014751 ) ) ( not ( = ?auto_2014747 ?auto_2014752 ) ) ( PERSON-AT ?auto_2014745 ?auto_2014748 ) ( not ( = ?auto_2014740 ?auto_2014748 ) ) ( PERSON-AT ?auto_2014743 ?auto_2014751 ) ( PERSON-AT ?auto_2014744 ?auto_2014749 ) ( not ( = ?auto_2014740 ?auto_2014749 ) ) ( PERSON-AT ?auto_2014741 ?auto_2014753 ) ( not ( = ?auto_2014740 ?auto_2014753 ) ) ( PERSON-AT ?auto_2014742 ?auto_2014748 ) ( AIRCRAFT-AT ?auto_2014750 ?auto_2014740 ) ( FUEL-LEVEL ?auto_2014750 ?auto_2014747 ) ( not ( = ?auto_2014742 ?auto_2014741 ) ) ( not ( = ?auto_2014753 ?auto_2014748 ) ) ( not ( = ?auto_2014742 ?auto_2014744 ) ) ( not ( = ?auto_2014741 ?auto_2014744 ) ) ( not ( = ?auto_2014749 ?auto_2014753 ) ) ( not ( = ?auto_2014749 ?auto_2014748 ) ) ( not ( = ?auto_2014742 ?auto_2014743 ) ) ( not ( = ?auto_2014741 ?auto_2014743 ) ) ( not ( = ?auto_2014744 ?auto_2014743 ) ) ( not ( = ?auto_2014751 ?auto_2014749 ) ) ( not ( = ?auto_2014751 ?auto_2014753 ) ) ( not ( = ?auto_2014751 ?auto_2014748 ) ) ( not ( = ?auto_2014742 ?auto_2014745 ) ) ( not ( = ?auto_2014741 ?auto_2014745 ) ) ( not ( = ?auto_2014744 ?auto_2014745 ) ) ( not ( = ?auto_2014743 ?auto_2014745 ) ) ( not ( = ?auto_2014742 ?auto_2014746 ) ) ( not ( = ?auto_2014741 ?auto_2014746 ) ) ( not ( = ?auto_2014744 ?auto_2014746 ) ) ( not ( = ?auto_2014743 ?auto_2014746 ) ) ( not ( = ?auto_2014745 ?auto_2014746 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2014742 ?auto_2014741 ?auto_2014744 ?auto_2014743 ?auto_2014746 ?auto_2014745 ?auto_2014740 )
      ( FLY-6PPL-VERIFY ?auto_2014741 ?auto_2014742 ?auto_2014743 ?auto_2014744 ?auto_2014745 ?auto_2014746 ?auto_2014740 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2014815 - PERSON
      ?auto_2014816 - PERSON
      ?auto_2014817 - PERSON
      ?auto_2014818 - PERSON
      ?auto_2014819 - PERSON
      ?auto_2014820 - PERSON
      ?auto_2014814 - CITY
    )
    :vars
    (
      ?auto_2014821 - FLEVEL
      ?auto_2014826 - FLEVEL
      ?auto_2014825 - CITY
      ?auto_2014822 - CITY
      ?auto_2014823 - CITY
      ?auto_2014827 - CITY
      ?auto_2014824 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2014821 ?auto_2014826 ) ( PERSON-AT ?auto_2014819 ?auto_2014825 ) ( not ( = ?auto_2014814 ?auto_2014825 ) ) ( not ( = ?auto_2014821 ?auto_2014826 ) ) ( PERSON-AT ?auto_2014820 ?auto_2014822 ) ( not ( = ?auto_2014814 ?auto_2014822 ) ) ( PERSON-AT ?auto_2014817 ?auto_2014825 ) ( PERSON-AT ?auto_2014818 ?auto_2014823 ) ( not ( = ?auto_2014814 ?auto_2014823 ) ) ( PERSON-AT ?auto_2014815 ?auto_2014827 ) ( not ( = ?auto_2014814 ?auto_2014827 ) ) ( PERSON-AT ?auto_2014816 ?auto_2014822 ) ( AIRCRAFT-AT ?auto_2014824 ?auto_2014814 ) ( FUEL-LEVEL ?auto_2014824 ?auto_2014821 ) ( not ( = ?auto_2014816 ?auto_2014815 ) ) ( not ( = ?auto_2014827 ?auto_2014822 ) ) ( not ( = ?auto_2014816 ?auto_2014818 ) ) ( not ( = ?auto_2014815 ?auto_2014818 ) ) ( not ( = ?auto_2014823 ?auto_2014827 ) ) ( not ( = ?auto_2014823 ?auto_2014822 ) ) ( not ( = ?auto_2014816 ?auto_2014817 ) ) ( not ( = ?auto_2014815 ?auto_2014817 ) ) ( not ( = ?auto_2014818 ?auto_2014817 ) ) ( not ( = ?auto_2014825 ?auto_2014823 ) ) ( not ( = ?auto_2014825 ?auto_2014827 ) ) ( not ( = ?auto_2014825 ?auto_2014822 ) ) ( not ( = ?auto_2014816 ?auto_2014820 ) ) ( not ( = ?auto_2014815 ?auto_2014820 ) ) ( not ( = ?auto_2014818 ?auto_2014820 ) ) ( not ( = ?auto_2014817 ?auto_2014820 ) ) ( not ( = ?auto_2014816 ?auto_2014819 ) ) ( not ( = ?auto_2014815 ?auto_2014819 ) ) ( not ( = ?auto_2014818 ?auto_2014819 ) ) ( not ( = ?auto_2014817 ?auto_2014819 ) ) ( not ( = ?auto_2014820 ?auto_2014819 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2014816 ?auto_2014815 ?auto_2014818 ?auto_2014817 ?auto_2014819 ?auto_2014820 ?auto_2014814 )
      ( FLY-6PPL-VERIFY ?auto_2014815 ?auto_2014816 ?auto_2014817 ?auto_2014818 ?auto_2014819 ?auto_2014820 ?auto_2014814 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2015046 - PERSON
      ?auto_2015047 - PERSON
      ?auto_2015048 - PERSON
      ?auto_2015049 - PERSON
      ?auto_2015050 - PERSON
      ?auto_2015051 - PERSON
      ?auto_2015045 - CITY
    )
    :vars
    (
      ?auto_2015052 - FLEVEL
      ?auto_2015057 - FLEVEL
      ?auto_2015056 - CITY
      ?auto_2015053 - CITY
      ?auto_2015054 - CITY
      ?auto_2015058 - CITY
      ?auto_2015055 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2015052 ?auto_2015057 ) ( PERSON-AT ?auto_2015051 ?auto_2015056 ) ( not ( = ?auto_2015045 ?auto_2015056 ) ) ( not ( = ?auto_2015052 ?auto_2015057 ) ) ( PERSON-AT ?auto_2015049 ?auto_2015053 ) ( not ( = ?auto_2015045 ?auto_2015053 ) ) ( PERSON-AT ?auto_2015048 ?auto_2015056 ) ( PERSON-AT ?auto_2015050 ?auto_2015054 ) ( not ( = ?auto_2015045 ?auto_2015054 ) ) ( PERSON-AT ?auto_2015046 ?auto_2015058 ) ( not ( = ?auto_2015045 ?auto_2015058 ) ) ( PERSON-AT ?auto_2015047 ?auto_2015053 ) ( AIRCRAFT-AT ?auto_2015055 ?auto_2015045 ) ( FUEL-LEVEL ?auto_2015055 ?auto_2015052 ) ( not ( = ?auto_2015047 ?auto_2015046 ) ) ( not ( = ?auto_2015058 ?auto_2015053 ) ) ( not ( = ?auto_2015047 ?auto_2015050 ) ) ( not ( = ?auto_2015046 ?auto_2015050 ) ) ( not ( = ?auto_2015054 ?auto_2015058 ) ) ( not ( = ?auto_2015054 ?auto_2015053 ) ) ( not ( = ?auto_2015047 ?auto_2015048 ) ) ( not ( = ?auto_2015046 ?auto_2015048 ) ) ( not ( = ?auto_2015050 ?auto_2015048 ) ) ( not ( = ?auto_2015056 ?auto_2015054 ) ) ( not ( = ?auto_2015056 ?auto_2015058 ) ) ( not ( = ?auto_2015056 ?auto_2015053 ) ) ( not ( = ?auto_2015047 ?auto_2015049 ) ) ( not ( = ?auto_2015046 ?auto_2015049 ) ) ( not ( = ?auto_2015050 ?auto_2015049 ) ) ( not ( = ?auto_2015048 ?auto_2015049 ) ) ( not ( = ?auto_2015047 ?auto_2015051 ) ) ( not ( = ?auto_2015046 ?auto_2015051 ) ) ( not ( = ?auto_2015050 ?auto_2015051 ) ) ( not ( = ?auto_2015048 ?auto_2015051 ) ) ( not ( = ?auto_2015049 ?auto_2015051 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2015047 ?auto_2015046 ?auto_2015050 ?auto_2015048 ?auto_2015051 ?auto_2015049 ?auto_2015045 )
      ( FLY-6PPL-VERIFY ?auto_2015046 ?auto_2015047 ?auto_2015048 ?auto_2015049 ?auto_2015050 ?auto_2015051 ?auto_2015045 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2015120 - PERSON
      ?auto_2015121 - PERSON
      ?auto_2015122 - PERSON
      ?auto_2015123 - PERSON
      ?auto_2015124 - PERSON
      ?auto_2015125 - PERSON
      ?auto_2015119 - CITY
    )
    :vars
    (
      ?auto_2015126 - FLEVEL
      ?auto_2015131 - FLEVEL
      ?auto_2015130 - CITY
      ?auto_2015127 - CITY
      ?auto_2015128 - CITY
      ?auto_2015132 - CITY
      ?auto_2015129 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2015126 ?auto_2015131 ) ( PERSON-AT ?auto_2015124 ?auto_2015130 ) ( not ( = ?auto_2015119 ?auto_2015130 ) ) ( not ( = ?auto_2015126 ?auto_2015131 ) ) ( PERSON-AT ?auto_2015123 ?auto_2015127 ) ( not ( = ?auto_2015119 ?auto_2015127 ) ) ( PERSON-AT ?auto_2015122 ?auto_2015130 ) ( PERSON-AT ?auto_2015125 ?auto_2015128 ) ( not ( = ?auto_2015119 ?auto_2015128 ) ) ( PERSON-AT ?auto_2015120 ?auto_2015132 ) ( not ( = ?auto_2015119 ?auto_2015132 ) ) ( PERSON-AT ?auto_2015121 ?auto_2015127 ) ( AIRCRAFT-AT ?auto_2015129 ?auto_2015119 ) ( FUEL-LEVEL ?auto_2015129 ?auto_2015126 ) ( not ( = ?auto_2015121 ?auto_2015120 ) ) ( not ( = ?auto_2015132 ?auto_2015127 ) ) ( not ( = ?auto_2015121 ?auto_2015125 ) ) ( not ( = ?auto_2015120 ?auto_2015125 ) ) ( not ( = ?auto_2015128 ?auto_2015132 ) ) ( not ( = ?auto_2015128 ?auto_2015127 ) ) ( not ( = ?auto_2015121 ?auto_2015122 ) ) ( not ( = ?auto_2015120 ?auto_2015122 ) ) ( not ( = ?auto_2015125 ?auto_2015122 ) ) ( not ( = ?auto_2015130 ?auto_2015128 ) ) ( not ( = ?auto_2015130 ?auto_2015132 ) ) ( not ( = ?auto_2015130 ?auto_2015127 ) ) ( not ( = ?auto_2015121 ?auto_2015123 ) ) ( not ( = ?auto_2015120 ?auto_2015123 ) ) ( not ( = ?auto_2015125 ?auto_2015123 ) ) ( not ( = ?auto_2015122 ?auto_2015123 ) ) ( not ( = ?auto_2015121 ?auto_2015124 ) ) ( not ( = ?auto_2015120 ?auto_2015124 ) ) ( not ( = ?auto_2015125 ?auto_2015124 ) ) ( not ( = ?auto_2015122 ?auto_2015124 ) ) ( not ( = ?auto_2015123 ?auto_2015124 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2015121 ?auto_2015120 ?auto_2015125 ?auto_2015122 ?auto_2015124 ?auto_2015123 ?auto_2015119 )
      ( FLY-6PPL-VERIFY ?auto_2015120 ?auto_2015121 ?auto_2015122 ?auto_2015123 ?auto_2015124 ?auto_2015125 ?auto_2015119 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2015427 - PERSON
      ?auto_2015428 - PERSON
      ?auto_2015429 - PERSON
      ?auto_2015430 - PERSON
      ?auto_2015431 - PERSON
      ?auto_2015432 - PERSON
      ?auto_2015426 - CITY
    )
    :vars
    (
      ?auto_2015433 - FLEVEL
      ?auto_2015438 - FLEVEL
      ?auto_2015437 - CITY
      ?auto_2015434 - CITY
      ?auto_2015435 - CITY
      ?auto_2015439 - CITY
      ?auto_2015436 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2015433 ?auto_2015438 ) ( PERSON-AT ?auto_2015430 ?auto_2015437 ) ( not ( = ?auto_2015426 ?auto_2015437 ) ) ( not ( = ?auto_2015433 ?auto_2015438 ) ) ( PERSON-AT ?auto_2015432 ?auto_2015434 ) ( not ( = ?auto_2015426 ?auto_2015434 ) ) ( PERSON-AT ?auto_2015429 ?auto_2015437 ) ( PERSON-AT ?auto_2015431 ?auto_2015435 ) ( not ( = ?auto_2015426 ?auto_2015435 ) ) ( PERSON-AT ?auto_2015427 ?auto_2015439 ) ( not ( = ?auto_2015426 ?auto_2015439 ) ) ( PERSON-AT ?auto_2015428 ?auto_2015434 ) ( AIRCRAFT-AT ?auto_2015436 ?auto_2015426 ) ( FUEL-LEVEL ?auto_2015436 ?auto_2015433 ) ( not ( = ?auto_2015428 ?auto_2015427 ) ) ( not ( = ?auto_2015439 ?auto_2015434 ) ) ( not ( = ?auto_2015428 ?auto_2015431 ) ) ( not ( = ?auto_2015427 ?auto_2015431 ) ) ( not ( = ?auto_2015435 ?auto_2015439 ) ) ( not ( = ?auto_2015435 ?auto_2015434 ) ) ( not ( = ?auto_2015428 ?auto_2015429 ) ) ( not ( = ?auto_2015427 ?auto_2015429 ) ) ( not ( = ?auto_2015431 ?auto_2015429 ) ) ( not ( = ?auto_2015437 ?auto_2015435 ) ) ( not ( = ?auto_2015437 ?auto_2015439 ) ) ( not ( = ?auto_2015437 ?auto_2015434 ) ) ( not ( = ?auto_2015428 ?auto_2015432 ) ) ( not ( = ?auto_2015427 ?auto_2015432 ) ) ( not ( = ?auto_2015431 ?auto_2015432 ) ) ( not ( = ?auto_2015429 ?auto_2015432 ) ) ( not ( = ?auto_2015428 ?auto_2015430 ) ) ( not ( = ?auto_2015427 ?auto_2015430 ) ) ( not ( = ?auto_2015431 ?auto_2015430 ) ) ( not ( = ?auto_2015429 ?auto_2015430 ) ) ( not ( = ?auto_2015432 ?auto_2015430 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2015428 ?auto_2015427 ?auto_2015431 ?auto_2015429 ?auto_2015430 ?auto_2015432 ?auto_2015426 )
      ( FLY-6PPL-VERIFY ?auto_2015427 ?auto_2015428 ?auto_2015429 ?auto_2015430 ?auto_2015431 ?auto_2015432 ?auto_2015426 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2015580 - PERSON
      ?auto_2015581 - PERSON
      ?auto_2015582 - PERSON
      ?auto_2015583 - PERSON
      ?auto_2015584 - PERSON
      ?auto_2015585 - PERSON
      ?auto_2015579 - CITY
    )
    :vars
    (
      ?auto_2015586 - FLEVEL
      ?auto_2015591 - FLEVEL
      ?auto_2015590 - CITY
      ?auto_2015587 - CITY
      ?auto_2015588 - CITY
      ?auto_2015592 - CITY
      ?auto_2015589 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2015586 ?auto_2015591 ) ( PERSON-AT ?auto_2015583 ?auto_2015590 ) ( not ( = ?auto_2015579 ?auto_2015590 ) ) ( not ( = ?auto_2015586 ?auto_2015591 ) ) ( PERSON-AT ?auto_2015584 ?auto_2015587 ) ( not ( = ?auto_2015579 ?auto_2015587 ) ) ( PERSON-AT ?auto_2015582 ?auto_2015590 ) ( PERSON-AT ?auto_2015585 ?auto_2015588 ) ( not ( = ?auto_2015579 ?auto_2015588 ) ) ( PERSON-AT ?auto_2015580 ?auto_2015592 ) ( not ( = ?auto_2015579 ?auto_2015592 ) ) ( PERSON-AT ?auto_2015581 ?auto_2015587 ) ( AIRCRAFT-AT ?auto_2015589 ?auto_2015579 ) ( FUEL-LEVEL ?auto_2015589 ?auto_2015586 ) ( not ( = ?auto_2015581 ?auto_2015580 ) ) ( not ( = ?auto_2015592 ?auto_2015587 ) ) ( not ( = ?auto_2015581 ?auto_2015585 ) ) ( not ( = ?auto_2015580 ?auto_2015585 ) ) ( not ( = ?auto_2015588 ?auto_2015592 ) ) ( not ( = ?auto_2015588 ?auto_2015587 ) ) ( not ( = ?auto_2015581 ?auto_2015582 ) ) ( not ( = ?auto_2015580 ?auto_2015582 ) ) ( not ( = ?auto_2015585 ?auto_2015582 ) ) ( not ( = ?auto_2015590 ?auto_2015588 ) ) ( not ( = ?auto_2015590 ?auto_2015592 ) ) ( not ( = ?auto_2015590 ?auto_2015587 ) ) ( not ( = ?auto_2015581 ?auto_2015584 ) ) ( not ( = ?auto_2015580 ?auto_2015584 ) ) ( not ( = ?auto_2015585 ?auto_2015584 ) ) ( not ( = ?auto_2015582 ?auto_2015584 ) ) ( not ( = ?auto_2015581 ?auto_2015583 ) ) ( not ( = ?auto_2015580 ?auto_2015583 ) ) ( not ( = ?auto_2015585 ?auto_2015583 ) ) ( not ( = ?auto_2015582 ?auto_2015583 ) ) ( not ( = ?auto_2015584 ?auto_2015583 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2015581 ?auto_2015580 ?auto_2015585 ?auto_2015582 ?auto_2015583 ?auto_2015584 ?auto_2015579 )
      ( FLY-6PPL-VERIFY ?auto_2015580 ?auto_2015581 ?auto_2015582 ?auto_2015583 ?auto_2015584 ?auto_2015585 ?auto_2015579 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2016122 - PERSON
      ?auto_2016123 - PERSON
      ?auto_2016124 - PERSON
      ?auto_2016125 - PERSON
      ?auto_2016126 - PERSON
      ?auto_2016127 - PERSON
      ?auto_2016121 - CITY
    )
    :vars
    (
      ?auto_2016128 - FLEVEL
      ?auto_2016133 - FLEVEL
      ?auto_2016132 - CITY
      ?auto_2016129 - CITY
      ?auto_2016130 - CITY
      ?auto_2016134 - CITY
      ?auto_2016131 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2016128 ?auto_2016133 ) ( PERSON-AT ?auto_2016127 ?auto_2016132 ) ( not ( = ?auto_2016121 ?auto_2016132 ) ) ( not ( = ?auto_2016128 ?auto_2016133 ) ) ( PERSON-AT ?auto_2016124 ?auto_2016129 ) ( not ( = ?auto_2016121 ?auto_2016129 ) ) ( PERSON-AT ?auto_2016126 ?auto_2016132 ) ( PERSON-AT ?auto_2016125 ?auto_2016130 ) ( not ( = ?auto_2016121 ?auto_2016130 ) ) ( PERSON-AT ?auto_2016122 ?auto_2016134 ) ( not ( = ?auto_2016121 ?auto_2016134 ) ) ( PERSON-AT ?auto_2016123 ?auto_2016129 ) ( AIRCRAFT-AT ?auto_2016131 ?auto_2016121 ) ( FUEL-LEVEL ?auto_2016131 ?auto_2016128 ) ( not ( = ?auto_2016123 ?auto_2016122 ) ) ( not ( = ?auto_2016134 ?auto_2016129 ) ) ( not ( = ?auto_2016123 ?auto_2016125 ) ) ( not ( = ?auto_2016122 ?auto_2016125 ) ) ( not ( = ?auto_2016130 ?auto_2016134 ) ) ( not ( = ?auto_2016130 ?auto_2016129 ) ) ( not ( = ?auto_2016123 ?auto_2016126 ) ) ( not ( = ?auto_2016122 ?auto_2016126 ) ) ( not ( = ?auto_2016125 ?auto_2016126 ) ) ( not ( = ?auto_2016132 ?auto_2016130 ) ) ( not ( = ?auto_2016132 ?auto_2016134 ) ) ( not ( = ?auto_2016132 ?auto_2016129 ) ) ( not ( = ?auto_2016123 ?auto_2016124 ) ) ( not ( = ?auto_2016122 ?auto_2016124 ) ) ( not ( = ?auto_2016125 ?auto_2016124 ) ) ( not ( = ?auto_2016126 ?auto_2016124 ) ) ( not ( = ?auto_2016123 ?auto_2016127 ) ) ( not ( = ?auto_2016122 ?auto_2016127 ) ) ( not ( = ?auto_2016125 ?auto_2016127 ) ) ( not ( = ?auto_2016126 ?auto_2016127 ) ) ( not ( = ?auto_2016124 ?auto_2016127 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2016123 ?auto_2016122 ?auto_2016125 ?auto_2016126 ?auto_2016127 ?auto_2016124 ?auto_2016121 )
      ( FLY-6PPL-VERIFY ?auto_2016122 ?auto_2016123 ?auto_2016124 ?auto_2016125 ?auto_2016126 ?auto_2016127 ?auto_2016121 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2016263 - PERSON
      ?auto_2016264 - PERSON
      ?auto_2016265 - PERSON
      ?auto_2016266 - PERSON
      ?auto_2016267 - PERSON
      ?auto_2016268 - PERSON
      ?auto_2016262 - CITY
    )
    :vars
    (
      ?auto_2016269 - FLEVEL
      ?auto_2016274 - FLEVEL
      ?auto_2016273 - CITY
      ?auto_2016270 - CITY
      ?auto_2016271 - CITY
      ?auto_2016275 - CITY
      ?auto_2016272 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2016269 ?auto_2016274 ) ( PERSON-AT ?auto_2016268 ?auto_2016273 ) ( not ( = ?auto_2016262 ?auto_2016273 ) ) ( not ( = ?auto_2016269 ?auto_2016274 ) ) ( PERSON-AT ?auto_2016265 ?auto_2016270 ) ( not ( = ?auto_2016262 ?auto_2016270 ) ) ( PERSON-AT ?auto_2016266 ?auto_2016273 ) ( PERSON-AT ?auto_2016267 ?auto_2016271 ) ( not ( = ?auto_2016262 ?auto_2016271 ) ) ( PERSON-AT ?auto_2016263 ?auto_2016275 ) ( not ( = ?auto_2016262 ?auto_2016275 ) ) ( PERSON-AT ?auto_2016264 ?auto_2016270 ) ( AIRCRAFT-AT ?auto_2016272 ?auto_2016262 ) ( FUEL-LEVEL ?auto_2016272 ?auto_2016269 ) ( not ( = ?auto_2016264 ?auto_2016263 ) ) ( not ( = ?auto_2016275 ?auto_2016270 ) ) ( not ( = ?auto_2016264 ?auto_2016267 ) ) ( not ( = ?auto_2016263 ?auto_2016267 ) ) ( not ( = ?auto_2016271 ?auto_2016275 ) ) ( not ( = ?auto_2016271 ?auto_2016270 ) ) ( not ( = ?auto_2016264 ?auto_2016266 ) ) ( not ( = ?auto_2016263 ?auto_2016266 ) ) ( not ( = ?auto_2016267 ?auto_2016266 ) ) ( not ( = ?auto_2016273 ?auto_2016271 ) ) ( not ( = ?auto_2016273 ?auto_2016275 ) ) ( not ( = ?auto_2016273 ?auto_2016270 ) ) ( not ( = ?auto_2016264 ?auto_2016265 ) ) ( not ( = ?auto_2016263 ?auto_2016265 ) ) ( not ( = ?auto_2016267 ?auto_2016265 ) ) ( not ( = ?auto_2016266 ?auto_2016265 ) ) ( not ( = ?auto_2016264 ?auto_2016268 ) ) ( not ( = ?auto_2016263 ?auto_2016268 ) ) ( not ( = ?auto_2016267 ?auto_2016268 ) ) ( not ( = ?auto_2016266 ?auto_2016268 ) ) ( not ( = ?auto_2016265 ?auto_2016268 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2016264 ?auto_2016263 ?auto_2016267 ?auto_2016266 ?auto_2016268 ?auto_2016265 ?auto_2016262 )
      ( FLY-6PPL-VERIFY ?auto_2016263 ?auto_2016264 ?auto_2016265 ?auto_2016266 ?auto_2016267 ?auto_2016268 ?auto_2016262 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2016337 - PERSON
      ?auto_2016338 - PERSON
      ?auto_2016339 - PERSON
      ?auto_2016340 - PERSON
      ?auto_2016341 - PERSON
      ?auto_2016342 - PERSON
      ?auto_2016336 - CITY
    )
    :vars
    (
      ?auto_2016343 - FLEVEL
      ?auto_2016348 - FLEVEL
      ?auto_2016347 - CITY
      ?auto_2016344 - CITY
      ?auto_2016345 - CITY
      ?auto_2016349 - CITY
      ?auto_2016346 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2016343 ?auto_2016348 ) ( PERSON-AT ?auto_2016341 ?auto_2016347 ) ( not ( = ?auto_2016336 ?auto_2016347 ) ) ( not ( = ?auto_2016343 ?auto_2016348 ) ) ( PERSON-AT ?auto_2016339 ?auto_2016344 ) ( not ( = ?auto_2016336 ?auto_2016344 ) ) ( PERSON-AT ?auto_2016340 ?auto_2016347 ) ( PERSON-AT ?auto_2016342 ?auto_2016345 ) ( not ( = ?auto_2016336 ?auto_2016345 ) ) ( PERSON-AT ?auto_2016337 ?auto_2016349 ) ( not ( = ?auto_2016336 ?auto_2016349 ) ) ( PERSON-AT ?auto_2016338 ?auto_2016344 ) ( AIRCRAFT-AT ?auto_2016346 ?auto_2016336 ) ( FUEL-LEVEL ?auto_2016346 ?auto_2016343 ) ( not ( = ?auto_2016338 ?auto_2016337 ) ) ( not ( = ?auto_2016349 ?auto_2016344 ) ) ( not ( = ?auto_2016338 ?auto_2016342 ) ) ( not ( = ?auto_2016337 ?auto_2016342 ) ) ( not ( = ?auto_2016345 ?auto_2016349 ) ) ( not ( = ?auto_2016345 ?auto_2016344 ) ) ( not ( = ?auto_2016338 ?auto_2016340 ) ) ( not ( = ?auto_2016337 ?auto_2016340 ) ) ( not ( = ?auto_2016342 ?auto_2016340 ) ) ( not ( = ?auto_2016347 ?auto_2016345 ) ) ( not ( = ?auto_2016347 ?auto_2016349 ) ) ( not ( = ?auto_2016347 ?auto_2016344 ) ) ( not ( = ?auto_2016338 ?auto_2016339 ) ) ( not ( = ?auto_2016337 ?auto_2016339 ) ) ( not ( = ?auto_2016342 ?auto_2016339 ) ) ( not ( = ?auto_2016340 ?auto_2016339 ) ) ( not ( = ?auto_2016338 ?auto_2016341 ) ) ( not ( = ?auto_2016337 ?auto_2016341 ) ) ( not ( = ?auto_2016342 ?auto_2016341 ) ) ( not ( = ?auto_2016340 ?auto_2016341 ) ) ( not ( = ?auto_2016339 ?auto_2016341 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2016338 ?auto_2016337 ?auto_2016342 ?auto_2016340 ?auto_2016341 ?auto_2016339 ?auto_2016336 )
      ( FLY-6PPL-VERIFY ?auto_2016337 ?auto_2016338 ?auto_2016339 ?auto_2016340 ?auto_2016341 ?auto_2016342 ?auto_2016336 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2031911 - PERSON
      ?auto_2031912 - PERSON
      ?auto_2031913 - PERSON
      ?auto_2031914 - PERSON
      ?auto_2031915 - PERSON
      ?auto_2031916 - PERSON
      ?auto_2031910 - CITY
    )
    :vars
    (
      ?auto_2031917 - FLEVEL
      ?auto_2031922 - FLEVEL
      ?auto_2031921 - CITY
      ?auto_2031918 - CITY
      ?auto_2031919 - CITY
      ?auto_2031923 - CITY
      ?auto_2031920 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2031917 ?auto_2031922 ) ( PERSON-AT ?auto_2031916 ?auto_2031921 ) ( not ( = ?auto_2031910 ?auto_2031921 ) ) ( not ( = ?auto_2031917 ?auto_2031922 ) ) ( PERSON-AT ?auto_2031915 ?auto_2031918 ) ( not ( = ?auto_2031910 ?auto_2031918 ) ) ( PERSON-AT ?auto_2031914 ?auto_2031921 ) ( PERSON-AT ?auto_2031912 ?auto_2031919 ) ( not ( = ?auto_2031910 ?auto_2031919 ) ) ( PERSON-AT ?auto_2031911 ?auto_2031923 ) ( not ( = ?auto_2031910 ?auto_2031923 ) ) ( PERSON-AT ?auto_2031913 ?auto_2031918 ) ( AIRCRAFT-AT ?auto_2031920 ?auto_2031910 ) ( FUEL-LEVEL ?auto_2031920 ?auto_2031917 ) ( not ( = ?auto_2031913 ?auto_2031911 ) ) ( not ( = ?auto_2031923 ?auto_2031918 ) ) ( not ( = ?auto_2031913 ?auto_2031912 ) ) ( not ( = ?auto_2031911 ?auto_2031912 ) ) ( not ( = ?auto_2031919 ?auto_2031923 ) ) ( not ( = ?auto_2031919 ?auto_2031918 ) ) ( not ( = ?auto_2031913 ?auto_2031914 ) ) ( not ( = ?auto_2031911 ?auto_2031914 ) ) ( not ( = ?auto_2031912 ?auto_2031914 ) ) ( not ( = ?auto_2031921 ?auto_2031919 ) ) ( not ( = ?auto_2031921 ?auto_2031923 ) ) ( not ( = ?auto_2031921 ?auto_2031918 ) ) ( not ( = ?auto_2031913 ?auto_2031915 ) ) ( not ( = ?auto_2031911 ?auto_2031915 ) ) ( not ( = ?auto_2031912 ?auto_2031915 ) ) ( not ( = ?auto_2031914 ?auto_2031915 ) ) ( not ( = ?auto_2031913 ?auto_2031916 ) ) ( not ( = ?auto_2031911 ?auto_2031916 ) ) ( not ( = ?auto_2031912 ?auto_2031916 ) ) ( not ( = ?auto_2031914 ?auto_2031916 ) ) ( not ( = ?auto_2031915 ?auto_2031916 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2031913 ?auto_2031911 ?auto_2031912 ?auto_2031914 ?auto_2031916 ?auto_2031915 ?auto_2031910 )
      ( FLY-6PPL-VERIFY ?auto_2031911 ?auto_2031912 ?auto_2031913 ?auto_2031914 ?auto_2031915 ?auto_2031916 ?auto_2031910 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2031985 - PERSON
      ?auto_2031986 - PERSON
      ?auto_2031987 - PERSON
      ?auto_2031988 - PERSON
      ?auto_2031989 - PERSON
      ?auto_2031990 - PERSON
      ?auto_2031984 - CITY
    )
    :vars
    (
      ?auto_2031991 - FLEVEL
      ?auto_2031996 - FLEVEL
      ?auto_2031995 - CITY
      ?auto_2031992 - CITY
      ?auto_2031993 - CITY
      ?auto_2031997 - CITY
      ?auto_2031994 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2031991 ?auto_2031996 ) ( PERSON-AT ?auto_2031989 ?auto_2031995 ) ( not ( = ?auto_2031984 ?auto_2031995 ) ) ( not ( = ?auto_2031991 ?auto_2031996 ) ) ( PERSON-AT ?auto_2031990 ?auto_2031992 ) ( not ( = ?auto_2031984 ?auto_2031992 ) ) ( PERSON-AT ?auto_2031988 ?auto_2031995 ) ( PERSON-AT ?auto_2031986 ?auto_2031993 ) ( not ( = ?auto_2031984 ?auto_2031993 ) ) ( PERSON-AT ?auto_2031985 ?auto_2031997 ) ( not ( = ?auto_2031984 ?auto_2031997 ) ) ( PERSON-AT ?auto_2031987 ?auto_2031992 ) ( AIRCRAFT-AT ?auto_2031994 ?auto_2031984 ) ( FUEL-LEVEL ?auto_2031994 ?auto_2031991 ) ( not ( = ?auto_2031987 ?auto_2031985 ) ) ( not ( = ?auto_2031997 ?auto_2031992 ) ) ( not ( = ?auto_2031987 ?auto_2031986 ) ) ( not ( = ?auto_2031985 ?auto_2031986 ) ) ( not ( = ?auto_2031993 ?auto_2031997 ) ) ( not ( = ?auto_2031993 ?auto_2031992 ) ) ( not ( = ?auto_2031987 ?auto_2031988 ) ) ( not ( = ?auto_2031985 ?auto_2031988 ) ) ( not ( = ?auto_2031986 ?auto_2031988 ) ) ( not ( = ?auto_2031995 ?auto_2031993 ) ) ( not ( = ?auto_2031995 ?auto_2031997 ) ) ( not ( = ?auto_2031995 ?auto_2031992 ) ) ( not ( = ?auto_2031987 ?auto_2031990 ) ) ( not ( = ?auto_2031985 ?auto_2031990 ) ) ( not ( = ?auto_2031986 ?auto_2031990 ) ) ( not ( = ?auto_2031988 ?auto_2031990 ) ) ( not ( = ?auto_2031987 ?auto_2031989 ) ) ( not ( = ?auto_2031985 ?auto_2031989 ) ) ( not ( = ?auto_2031986 ?auto_2031989 ) ) ( not ( = ?auto_2031988 ?auto_2031989 ) ) ( not ( = ?auto_2031990 ?auto_2031989 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2031987 ?auto_2031985 ?auto_2031986 ?auto_2031988 ?auto_2031989 ?auto_2031990 ?auto_2031984 )
      ( FLY-6PPL-VERIFY ?auto_2031985 ?auto_2031986 ?auto_2031987 ?auto_2031988 ?auto_2031989 ?auto_2031990 ?auto_2031984 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2032059 - PERSON
      ?auto_2032060 - PERSON
      ?auto_2032061 - PERSON
      ?auto_2032062 - PERSON
      ?auto_2032063 - PERSON
      ?auto_2032064 - PERSON
      ?auto_2032058 - CITY
    )
    :vars
    (
      ?auto_2032065 - FLEVEL
      ?auto_2032070 - FLEVEL
      ?auto_2032069 - CITY
      ?auto_2032066 - CITY
      ?auto_2032067 - CITY
      ?auto_2032071 - CITY
      ?auto_2032068 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2032065 ?auto_2032070 ) ( PERSON-AT ?auto_2032064 ?auto_2032069 ) ( not ( = ?auto_2032058 ?auto_2032069 ) ) ( not ( = ?auto_2032065 ?auto_2032070 ) ) ( PERSON-AT ?auto_2032062 ?auto_2032066 ) ( not ( = ?auto_2032058 ?auto_2032066 ) ) ( PERSON-AT ?auto_2032063 ?auto_2032069 ) ( PERSON-AT ?auto_2032060 ?auto_2032067 ) ( not ( = ?auto_2032058 ?auto_2032067 ) ) ( PERSON-AT ?auto_2032059 ?auto_2032071 ) ( not ( = ?auto_2032058 ?auto_2032071 ) ) ( PERSON-AT ?auto_2032061 ?auto_2032066 ) ( AIRCRAFT-AT ?auto_2032068 ?auto_2032058 ) ( FUEL-LEVEL ?auto_2032068 ?auto_2032065 ) ( not ( = ?auto_2032061 ?auto_2032059 ) ) ( not ( = ?auto_2032071 ?auto_2032066 ) ) ( not ( = ?auto_2032061 ?auto_2032060 ) ) ( not ( = ?auto_2032059 ?auto_2032060 ) ) ( not ( = ?auto_2032067 ?auto_2032071 ) ) ( not ( = ?auto_2032067 ?auto_2032066 ) ) ( not ( = ?auto_2032061 ?auto_2032063 ) ) ( not ( = ?auto_2032059 ?auto_2032063 ) ) ( not ( = ?auto_2032060 ?auto_2032063 ) ) ( not ( = ?auto_2032069 ?auto_2032067 ) ) ( not ( = ?auto_2032069 ?auto_2032071 ) ) ( not ( = ?auto_2032069 ?auto_2032066 ) ) ( not ( = ?auto_2032061 ?auto_2032062 ) ) ( not ( = ?auto_2032059 ?auto_2032062 ) ) ( not ( = ?auto_2032060 ?auto_2032062 ) ) ( not ( = ?auto_2032063 ?auto_2032062 ) ) ( not ( = ?auto_2032061 ?auto_2032064 ) ) ( not ( = ?auto_2032059 ?auto_2032064 ) ) ( not ( = ?auto_2032060 ?auto_2032064 ) ) ( not ( = ?auto_2032063 ?auto_2032064 ) ) ( not ( = ?auto_2032062 ?auto_2032064 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2032061 ?auto_2032059 ?auto_2032060 ?auto_2032063 ?auto_2032064 ?auto_2032062 ?auto_2032058 )
      ( FLY-6PPL-VERIFY ?auto_2032059 ?auto_2032060 ?auto_2032061 ?auto_2032062 ?auto_2032063 ?auto_2032064 ?auto_2032058 ) )
  )

)

