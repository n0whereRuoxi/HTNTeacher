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
      ?auto_11335 - PERSON
      ?auto_11334 - CITY
    )
    :vars
    (
      ?auto_11336 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_11335 ?auto_11336 ) ( AIRCRAFT-AT ?auto_11336 ?auto_11334 ) )
    :subtasks
    ( ( !DEBARK ?auto_11335 ?auto_11336 ?auto_11334 )
      ( FLY-1PPL-VERIFY ?auto_11335 ?auto_11334 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11347 - PERSON
      ?auto_11346 - CITY
    )
    :vars
    (
      ?auto_11348 - AIRCRAFT
      ?auto_11351 - CITY
      ?auto_11349 - FLEVEL
      ?auto_11350 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11347 ?auto_11348 ) ( AIRCRAFT-AT ?auto_11348 ?auto_11351 ) ( FUEL-LEVEL ?auto_11348 ?auto_11349 ) ( NEXT ?auto_11350 ?auto_11349 ) ( not ( = ?auto_11346 ?auto_11351 ) ) ( not ( = ?auto_11349 ?auto_11350 ) ) )
    :subtasks
    ( ( !FLY ?auto_11348 ?auto_11351 ?auto_11346 ?auto_11349 ?auto_11350 )
      ( FLY-1PPL ?auto_11347 ?auto_11346 )
      ( FLY-1PPL-VERIFY ?auto_11347 ?auto_11346 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11368 - PERSON
      ?auto_11367 - CITY
    )
    :vars
    (
      ?auto_11371 - AIRCRAFT
      ?auto_11370 - CITY
      ?auto_11372 - FLEVEL
      ?auto_11369 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11371 ?auto_11370 ) ( FUEL-LEVEL ?auto_11371 ?auto_11372 ) ( NEXT ?auto_11369 ?auto_11372 ) ( not ( = ?auto_11367 ?auto_11370 ) ) ( not ( = ?auto_11372 ?auto_11369 ) ) ( PERSON-AT ?auto_11368 ?auto_11370 ) )
    :subtasks
    ( ( !BOARD ?auto_11368 ?auto_11371 ?auto_11370 )
      ( FLY-1PPL ?auto_11368 ?auto_11367 )
      ( FLY-1PPL-VERIFY ?auto_11368 ?auto_11367 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11389 - PERSON
      ?auto_11388 - CITY
    )
    :vars
    (
      ?auto_11390 - AIRCRAFT
      ?auto_11392 - CITY
      ?auto_11391 - FLEVEL
      ?auto_11393 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11390 ?auto_11392 ) ( NEXT ?auto_11391 ?auto_11393 ) ( not ( = ?auto_11388 ?auto_11392 ) ) ( not ( = ?auto_11393 ?auto_11391 ) ) ( PERSON-AT ?auto_11389 ?auto_11392 ) ( FUEL-LEVEL ?auto_11390 ?auto_11391 ) )
    :subtasks
    ( ( !REFUEL ?auto_11390 ?auto_11392 ?auto_11391 ?auto_11393 )
      ( FLY-1PPL ?auto_11389 ?auto_11388 )
      ( FLY-1PPL-VERIFY ?auto_11389 ?auto_11388 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11410 - PERSON
      ?auto_11409 - CITY
    )
    :vars
    (
      ?auto_11414 - FLEVEL
      ?auto_11412 - FLEVEL
      ?auto_11413 - CITY
      ?auto_11411 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11414 ?auto_11412 ) ( not ( = ?auto_11409 ?auto_11413 ) ) ( not ( = ?auto_11412 ?auto_11414 ) ) ( PERSON-AT ?auto_11410 ?auto_11413 ) ( AIRCRAFT-AT ?auto_11411 ?auto_11409 ) ( FUEL-LEVEL ?auto_11411 ?auto_11412 ) )
    :subtasks
    ( ( !FLY ?auto_11411 ?auto_11409 ?auto_11413 ?auto_11412 ?auto_11414 )
      ( FLY-1PPL ?auto_11410 ?auto_11409 )
      ( FLY-1PPL-VERIFY ?auto_11410 ?auto_11409 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11431 - PERSON
      ?auto_11430 - CITY
    )
    :vars
    (
      ?auto_11435 - FLEVEL
      ?auto_11434 - FLEVEL
      ?auto_11433 - CITY
      ?auto_11432 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11435 ?auto_11434 ) ( not ( = ?auto_11430 ?auto_11433 ) ) ( not ( = ?auto_11434 ?auto_11435 ) ) ( PERSON-AT ?auto_11431 ?auto_11433 ) ( AIRCRAFT-AT ?auto_11432 ?auto_11430 ) ( FUEL-LEVEL ?auto_11432 ?auto_11435 ) )
    :subtasks
    ( ( !REFUEL ?auto_11432 ?auto_11430 ?auto_11435 ?auto_11434 )
      ( FLY-1PPL ?auto_11431 ?auto_11430 )
      ( FLY-1PPL-VERIFY ?auto_11431 ?auto_11430 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11494 - PERSON
      ?auto_11495 - PERSON
      ?auto_11493 - CITY
    )
    :vars
    (
      ?auto_11496 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_11495 ?auto_11496 ) ( AIRCRAFT-AT ?auto_11496 ?auto_11493 ) ( PERSON-AT ?auto_11494 ?auto_11493 ) ( not ( = ?auto_11494 ?auto_11495 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11495 ?auto_11493 )
      ( FLY-2PPL-VERIFY ?auto_11494 ?auto_11495 ?auto_11493 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11498 - PERSON
      ?auto_11499 - PERSON
      ?auto_11497 - CITY
    )
    :vars
    (
      ?auto_11500 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_11498 ?auto_11500 ) ( AIRCRAFT-AT ?auto_11500 ?auto_11497 ) ( PERSON-AT ?auto_11499 ?auto_11497 ) ( not ( = ?auto_11498 ?auto_11499 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11498 ?auto_11497 )
      ( FLY-2PPL-VERIFY ?auto_11498 ?auto_11499 ?auto_11497 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11506 - PERSON
      ?auto_11507 - PERSON
      ?auto_11508 - PERSON
      ?auto_11505 - CITY
    )
    :vars
    (
      ?auto_11509 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_11508 ?auto_11509 ) ( AIRCRAFT-AT ?auto_11509 ?auto_11505 ) ( PERSON-AT ?auto_11506 ?auto_11505 ) ( PERSON-AT ?auto_11507 ?auto_11505 ) ( not ( = ?auto_11506 ?auto_11507 ) ) ( not ( = ?auto_11506 ?auto_11508 ) ) ( not ( = ?auto_11507 ?auto_11508 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11508 ?auto_11505 )
      ( FLY-3PPL-VERIFY ?auto_11506 ?auto_11507 ?auto_11508 ?auto_11505 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11511 - PERSON
      ?auto_11512 - PERSON
      ?auto_11513 - PERSON
      ?auto_11510 - CITY
    )
    :vars
    (
      ?auto_11514 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_11512 ?auto_11514 ) ( AIRCRAFT-AT ?auto_11514 ?auto_11510 ) ( PERSON-AT ?auto_11511 ?auto_11510 ) ( PERSON-AT ?auto_11513 ?auto_11510 ) ( not ( = ?auto_11511 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11513 ) ) ( not ( = ?auto_11512 ?auto_11513 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11512 ?auto_11510 )
      ( FLY-3PPL-VERIFY ?auto_11511 ?auto_11512 ?auto_11513 ?auto_11510 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11521 - PERSON
      ?auto_11522 - PERSON
      ?auto_11523 - PERSON
      ?auto_11520 - CITY
    )
    :vars
    (
      ?auto_11524 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_11521 ?auto_11524 ) ( AIRCRAFT-AT ?auto_11524 ?auto_11520 ) ( PERSON-AT ?auto_11522 ?auto_11520 ) ( PERSON-AT ?auto_11523 ?auto_11520 ) ( not ( = ?auto_11521 ?auto_11522 ) ) ( not ( = ?auto_11521 ?auto_11523 ) ) ( not ( = ?auto_11522 ?auto_11523 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11521 ?auto_11520 )
      ( FLY-3PPL-VERIFY ?auto_11521 ?auto_11522 ?auto_11523 ?auto_11520 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11547 - PERSON
      ?auto_11548 - PERSON
      ?auto_11546 - CITY
    )
    :vars
    (
      ?auto_11549 - AIRCRAFT
      ?auto_11550 - CITY
      ?auto_11552 - FLEVEL
      ?auto_11551 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11548 ?auto_11549 ) ( AIRCRAFT-AT ?auto_11549 ?auto_11550 ) ( FUEL-LEVEL ?auto_11549 ?auto_11552 ) ( NEXT ?auto_11551 ?auto_11552 ) ( not ( = ?auto_11546 ?auto_11550 ) ) ( not ( = ?auto_11552 ?auto_11551 ) ) ( PERSON-AT ?auto_11547 ?auto_11546 ) ( not ( = ?auto_11547 ?auto_11548 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11548 ?auto_11546 )
      ( FLY-2PPL-VERIFY ?auto_11547 ?auto_11548 ?auto_11546 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11554 - PERSON
      ?auto_11555 - PERSON
      ?auto_11553 - CITY
    )
    :vars
    (
      ?auto_11559 - AIRCRAFT
      ?auto_11557 - CITY
      ?auto_11558 - FLEVEL
      ?auto_11556 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11554 ?auto_11559 ) ( AIRCRAFT-AT ?auto_11559 ?auto_11557 ) ( FUEL-LEVEL ?auto_11559 ?auto_11558 ) ( NEXT ?auto_11556 ?auto_11558 ) ( not ( = ?auto_11553 ?auto_11557 ) ) ( not ( = ?auto_11558 ?auto_11556 ) ) ( PERSON-AT ?auto_11555 ?auto_11553 ) ( not ( = ?auto_11555 ?auto_11554 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11555 ?auto_11554 ?auto_11553 )
      ( FLY-2PPL-VERIFY ?auto_11554 ?auto_11555 ?auto_11553 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11569 - PERSON
      ?auto_11570 - PERSON
      ?auto_11571 - PERSON
      ?auto_11568 - CITY
    )
    :vars
    (
      ?auto_11575 - AIRCRAFT
      ?auto_11573 - CITY
      ?auto_11574 - FLEVEL
      ?auto_11572 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11571 ?auto_11575 ) ( AIRCRAFT-AT ?auto_11575 ?auto_11573 ) ( FUEL-LEVEL ?auto_11575 ?auto_11574 ) ( NEXT ?auto_11572 ?auto_11574 ) ( not ( = ?auto_11568 ?auto_11573 ) ) ( not ( = ?auto_11574 ?auto_11572 ) ) ( PERSON-AT ?auto_11570 ?auto_11568 ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( PERSON-AT ?auto_11569 ?auto_11568 ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11571 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11570 ?auto_11571 ?auto_11568 )
      ( FLY-3PPL-VERIFY ?auto_11569 ?auto_11570 ?auto_11571 ?auto_11568 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11577 - PERSON
      ?auto_11578 - PERSON
      ?auto_11579 - PERSON
      ?auto_11576 - CITY
    )
    :vars
    (
      ?auto_11583 - AIRCRAFT
      ?auto_11581 - CITY
      ?auto_11582 - FLEVEL
      ?auto_11580 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11578 ?auto_11583 ) ( AIRCRAFT-AT ?auto_11583 ?auto_11581 ) ( FUEL-LEVEL ?auto_11583 ?auto_11582 ) ( NEXT ?auto_11580 ?auto_11582 ) ( not ( = ?auto_11576 ?auto_11581 ) ) ( not ( = ?auto_11582 ?auto_11580 ) ) ( PERSON-AT ?auto_11579 ?auto_11576 ) ( not ( = ?auto_11579 ?auto_11578 ) ) ( PERSON-AT ?auto_11577 ?auto_11576 ) ( not ( = ?auto_11577 ?auto_11578 ) ) ( not ( = ?auto_11577 ?auto_11579 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11579 ?auto_11578 ?auto_11576 )
      ( FLY-3PPL-VERIFY ?auto_11577 ?auto_11578 ?auto_11579 ?auto_11576 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11593 - PERSON
      ?auto_11594 - PERSON
      ?auto_11595 - PERSON
      ?auto_11592 - CITY
    )
    :vars
    (
      ?auto_11599 - AIRCRAFT
      ?auto_11597 - CITY
      ?auto_11598 - FLEVEL
      ?auto_11596 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11593 ?auto_11599 ) ( AIRCRAFT-AT ?auto_11599 ?auto_11597 ) ( FUEL-LEVEL ?auto_11599 ?auto_11598 ) ( NEXT ?auto_11596 ?auto_11598 ) ( not ( = ?auto_11592 ?auto_11597 ) ) ( not ( = ?auto_11598 ?auto_11596 ) ) ( PERSON-AT ?auto_11594 ?auto_11592 ) ( not ( = ?auto_11594 ?auto_11593 ) ) ( PERSON-AT ?auto_11595 ?auto_11592 ) ( not ( = ?auto_11593 ?auto_11595 ) ) ( not ( = ?auto_11594 ?auto_11595 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11594 ?auto_11593 ?auto_11592 )
      ( FLY-3PPL-VERIFY ?auto_11593 ?auto_11594 ?auto_11595 ?auto_11592 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11626 - PERSON
      ?auto_11625 - CITY
    )
    :vars
    (
      ?auto_11631 - AIRCRAFT
      ?auto_11628 - CITY
      ?auto_11629 - FLEVEL
      ?auto_11627 - FLEVEL
      ?auto_11630 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11631 ?auto_11628 ) ( FUEL-LEVEL ?auto_11631 ?auto_11629 ) ( NEXT ?auto_11627 ?auto_11629 ) ( not ( = ?auto_11625 ?auto_11628 ) ) ( not ( = ?auto_11629 ?auto_11627 ) ) ( PERSON-AT ?auto_11630 ?auto_11625 ) ( not ( = ?auto_11630 ?auto_11626 ) ) ( PERSON-AT ?auto_11626 ?auto_11628 ) )
    :subtasks
    ( ( !BOARD ?auto_11626 ?auto_11631 ?auto_11628 )
      ( FLY-2PPL ?auto_11630 ?auto_11626 ?auto_11625 )
      ( FLY-1PPL-VERIFY ?auto_11626 ?auto_11625 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11633 - PERSON
      ?auto_11634 - PERSON
      ?auto_11632 - CITY
    )
    :vars
    (
      ?auto_11635 - AIRCRAFT
      ?auto_11638 - CITY
      ?auto_11637 - FLEVEL
      ?auto_11636 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11635 ?auto_11638 ) ( FUEL-LEVEL ?auto_11635 ?auto_11637 ) ( NEXT ?auto_11636 ?auto_11637 ) ( not ( = ?auto_11632 ?auto_11638 ) ) ( not ( = ?auto_11637 ?auto_11636 ) ) ( PERSON-AT ?auto_11633 ?auto_11632 ) ( not ( = ?auto_11633 ?auto_11634 ) ) ( PERSON-AT ?auto_11634 ?auto_11638 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11634 ?auto_11632 )
      ( FLY-2PPL-VERIFY ?auto_11633 ?auto_11634 ?auto_11632 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11640 - PERSON
      ?auto_11641 - PERSON
      ?auto_11639 - CITY
    )
    :vars
    (
      ?auto_11645 - AIRCRAFT
      ?auto_11643 - CITY
      ?auto_11644 - FLEVEL
      ?auto_11642 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11645 ?auto_11643 ) ( FUEL-LEVEL ?auto_11645 ?auto_11644 ) ( NEXT ?auto_11642 ?auto_11644 ) ( not ( = ?auto_11639 ?auto_11643 ) ) ( not ( = ?auto_11644 ?auto_11642 ) ) ( PERSON-AT ?auto_11641 ?auto_11639 ) ( not ( = ?auto_11641 ?auto_11640 ) ) ( PERSON-AT ?auto_11640 ?auto_11643 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11641 ?auto_11640 ?auto_11639 )
      ( FLY-2PPL-VERIFY ?auto_11640 ?auto_11641 ?auto_11639 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11655 - PERSON
      ?auto_11656 - PERSON
      ?auto_11657 - PERSON
      ?auto_11654 - CITY
    )
    :vars
    (
      ?auto_11661 - AIRCRAFT
      ?auto_11659 - CITY
      ?auto_11660 - FLEVEL
      ?auto_11658 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11661 ?auto_11659 ) ( FUEL-LEVEL ?auto_11661 ?auto_11660 ) ( NEXT ?auto_11658 ?auto_11660 ) ( not ( = ?auto_11654 ?auto_11659 ) ) ( not ( = ?auto_11660 ?auto_11658 ) ) ( PERSON-AT ?auto_11656 ?auto_11654 ) ( not ( = ?auto_11656 ?auto_11657 ) ) ( PERSON-AT ?auto_11657 ?auto_11659 ) ( PERSON-AT ?auto_11655 ?auto_11654 ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11656 ?auto_11657 ?auto_11654 )
      ( FLY-3PPL-VERIFY ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11654 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11663 - PERSON
      ?auto_11664 - PERSON
      ?auto_11665 - PERSON
      ?auto_11662 - CITY
    )
    :vars
    (
      ?auto_11669 - AIRCRAFT
      ?auto_11667 - CITY
      ?auto_11668 - FLEVEL
      ?auto_11666 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11669 ?auto_11667 ) ( FUEL-LEVEL ?auto_11669 ?auto_11668 ) ( NEXT ?auto_11666 ?auto_11668 ) ( not ( = ?auto_11662 ?auto_11667 ) ) ( not ( = ?auto_11668 ?auto_11666 ) ) ( PERSON-AT ?auto_11663 ?auto_11662 ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( PERSON-AT ?auto_11664 ?auto_11667 ) ( PERSON-AT ?auto_11665 ?auto_11662 ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11664 ?auto_11665 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11663 ?auto_11664 ?auto_11662 )
      ( FLY-3PPL-VERIFY ?auto_11663 ?auto_11664 ?auto_11665 ?auto_11662 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11679 - PERSON
      ?auto_11680 - PERSON
      ?auto_11681 - PERSON
      ?auto_11678 - CITY
    )
    :vars
    (
      ?auto_11685 - AIRCRAFT
      ?auto_11683 - CITY
      ?auto_11684 - FLEVEL
      ?auto_11682 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11685 ?auto_11683 ) ( FUEL-LEVEL ?auto_11685 ?auto_11684 ) ( NEXT ?auto_11682 ?auto_11684 ) ( not ( = ?auto_11678 ?auto_11683 ) ) ( not ( = ?auto_11684 ?auto_11682 ) ) ( PERSON-AT ?auto_11680 ?auto_11678 ) ( not ( = ?auto_11680 ?auto_11679 ) ) ( PERSON-AT ?auto_11679 ?auto_11683 ) ( PERSON-AT ?auto_11681 ?auto_11678 ) ( not ( = ?auto_11679 ?auto_11681 ) ) ( not ( = ?auto_11680 ?auto_11681 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11680 ?auto_11679 ?auto_11678 )
      ( FLY-3PPL-VERIFY ?auto_11679 ?auto_11680 ?auto_11681 ?auto_11678 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11712 - PERSON
      ?auto_11711 - CITY
    )
    :vars
    (
      ?auto_11716 - AIRCRAFT
      ?auto_11714 - CITY
      ?auto_11713 - FLEVEL
      ?auto_11715 - FLEVEL
      ?auto_11717 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11716 ?auto_11714 ) ( NEXT ?auto_11713 ?auto_11715 ) ( not ( = ?auto_11711 ?auto_11714 ) ) ( not ( = ?auto_11715 ?auto_11713 ) ) ( PERSON-AT ?auto_11717 ?auto_11711 ) ( not ( = ?auto_11717 ?auto_11712 ) ) ( PERSON-AT ?auto_11712 ?auto_11714 ) ( FUEL-LEVEL ?auto_11716 ?auto_11713 ) )
    :subtasks
    ( ( !REFUEL ?auto_11716 ?auto_11714 ?auto_11713 ?auto_11715 )
      ( FLY-2PPL ?auto_11717 ?auto_11712 ?auto_11711 )
      ( FLY-1PPL-VERIFY ?auto_11712 ?auto_11711 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11719 - PERSON
      ?auto_11720 - PERSON
      ?auto_11718 - CITY
    )
    :vars
    (
      ?auto_11722 - AIRCRAFT
      ?auto_11724 - CITY
      ?auto_11721 - FLEVEL
      ?auto_11723 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11722 ?auto_11724 ) ( NEXT ?auto_11721 ?auto_11723 ) ( not ( = ?auto_11718 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11721 ) ) ( PERSON-AT ?auto_11719 ?auto_11718 ) ( not ( = ?auto_11719 ?auto_11720 ) ) ( PERSON-AT ?auto_11720 ?auto_11724 ) ( FUEL-LEVEL ?auto_11722 ?auto_11721 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11720 ?auto_11718 )
      ( FLY-2PPL-VERIFY ?auto_11719 ?auto_11720 ?auto_11718 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11726 - PERSON
      ?auto_11727 - PERSON
      ?auto_11725 - CITY
    )
    :vars
    (
      ?auto_11728 - AIRCRAFT
      ?auto_11730 - CITY
      ?auto_11729 - FLEVEL
      ?auto_11731 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11728 ?auto_11730 ) ( NEXT ?auto_11729 ?auto_11731 ) ( not ( = ?auto_11725 ?auto_11730 ) ) ( not ( = ?auto_11731 ?auto_11729 ) ) ( PERSON-AT ?auto_11727 ?auto_11725 ) ( not ( = ?auto_11727 ?auto_11726 ) ) ( PERSON-AT ?auto_11726 ?auto_11730 ) ( FUEL-LEVEL ?auto_11728 ?auto_11729 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11727 ?auto_11726 ?auto_11725 )
      ( FLY-2PPL-VERIFY ?auto_11726 ?auto_11727 ?auto_11725 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11741 - PERSON
      ?auto_11742 - PERSON
      ?auto_11743 - PERSON
      ?auto_11740 - CITY
    )
    :vars
    (
      ?auto_11744 - AIRCRAFT
      ?auto_11746 - CITY
      ?auto_11745 - FLEVEL
      ?auto_11747 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11744 ?auto_11746 ) ( NEXT ?auto_11745 ?auto_11747 ) ( not ( = ?auto_11740 ?auto_11746 ) ) ( not ( = ?auto_11747 ?auto_11745 ) ) ( PERSON-AT ?auto_11742 ?auto_11740 ) ( not ( = ?auto_11742 ?auto_11743 ) ) ( PERSON-AT ?auto_11743 ?auto_11746 ) ( FUEL-LEVEL ?auto_11744 ?auto_11745 ) ( PERSON-AT ?auto_11741 ?auto_11740 ) ( not ( = ?auto_11741 ?auto_11742 ) ) ( not ( = ?auto_11741 ?auto_11743 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11742 ?auto_11743 ?auto_11740 )
      ( FLY-3PPL-VERIFY ?auto_11741 ?auto_11742 ?auto_11743 ?auto_11740 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11749 - PERSON
      ?auto_11750 - PERSON
      ?auto_11751 - PERSON
      ?auto_11748 - CITY
    )
    :vars
    (
      ?auto_11752 - AIRCRAFT
      ?auto_11754 - CITY
      ?auto_11753 - FLEVEL
      ?auto_11755 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11752 ?auto_11754 ) ( NEXT ?auto_11753 ?auto_11755 ) ( not ( = ?auto_11748 ?auto_11754 ) ) ( not ( = ?auto_11755 ?auto_11753 ) ) ( PERSON-AT ?auto_11751 ?auto_11748 ) ( not ( = ?auto_11751 ?auto_11750 ) ) ( PERSON-AT ?auto_11750 ?auto_11754 ) ( FUEL-LEVEL ?auto_11752 ?auto_11753 ) ( PERSON-AT ?auto_11749 ?auto_11748 ) ( not ( = ?auto_11749 ?auto_11750 ) ) ( not ( = ?auto_11749 ?auto_11751 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11751 ?auto_11750 ?auto_11748 )
      ( FLY-3PPL-VERIFY ?auto_11749 ?auto_11750 ?auto_11751 ?auto_11748 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11765 - PERSON
      ?auto_11766 - PERSON
      ?auto_11767 - PERSON
      ?auto_11764 - CITY
    )
    :vars
    (
      ?auto_11768 - AIRCRAFT
      ?auto_11770 - CITY
      ?auto_11769 - FLEVEL
      ?auto_11771 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_11768 ?auto_11770 ) ( NEXT ?auto_11769 ?auto_11771 ) ( not ( = ?auto_11764 ?auto_11770 ) ) ( not ( = ?auto_11771 ?auto_11769 ) ) ( PERSON-AT ?auto_11767 ?auto_11764 ) ( not ( = ?auto_11767 ?auto_11765 ) ) ( PERSON-AT ?auto_11765 ?auto_11770 ) ( FUEL-LEVEL ?auto_11768 ?auto_11769 ) ( PERSON-AT ?auto_11766 ?auto_11764 ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11766 ?auto_11767 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11767 ?auto_11765 ?auto_11764 )
      ( FLY-3PPL-VERIFY ?auto_11765 ?auto_11766 ?auto_11767 ?auto_11764 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11798 - PERSON
      ?auto_11797 - CITY
    )
    :vars
    (
      ?auto_11800 - FLEVEL
      ?auto_11803 - FLEVEL
      ?auto_11802 - CITY
      ?auto_11801 - PERSON
      ?auto_11799 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11800 ?auto_11803 ) ( not ( = ?auto_11797 ?auto_11802 ) ) ( not ( = ?auto_11803 ?auto_11800 ) ) ( PERSON-AT ?auto_11801 ?auto_11797 ) ( not ( = ?auto_11801 ?auto_11798 ) ) ( PERSON-AT ?auto_11798 ?auto_11802 ) ( AIRCRAFT-AT ?auto_11799 ?auto_11797 ) ( FUEL-LEVEL ?auto_11799 ?auto_11803 ) )
    :subtasks
    ( ( !FLY ?auto_11799 ?auto_11797 ?auto_11802 ?auto_11803 ?auto_11800 )
      ( FLY-2PPL ?auto_11801 ?auto_11798 ?auto_11797 )
      ( FLY-1PPL-VERIFY ?auto_11798 ?auto_11797 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11805 - PERSON
      ?auto_11806 - PERSON
      ?auto_11804 - CITY
    )
    :vars
    (
      ?auto_11809 - FLEVEL
      ?auto_11808 - FLEVEL
      ?auto_11807 - CITY
      ?auto_11810 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11809 ?auto_11808 ) ( not ( = ?auto_11804 ?auto_11807 ) ) ( not ( = ?auto_11808 ?auto_11809 ) ) ( PERSON-AT ?auto_11805 ?auto_11804 ) ( not ( = ?auto_11805 ?auto_11806 ) ) ( PERSON-AT ?auto_11806 ?auto_11807 ) ( AIRCRAFT-AT ?auto_11810 ?auto_11804 ) ( FUEL-LEVEL ?auto_11810 ?auto_11808 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11806 ?auto_11804 )
      ( FLY-2PPL-VERIFY ?auto_11805 ?auto_11806 ?auto_11804 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11812 - PERSON
      ?auto_11813 - PERSON
      ?auto_11811 - CITY
    )
    :vars
    (
      ?auto_11816 - FLEVEL
      ?auto_11814 - FLEVEL
      ?auto_11815 - CITY
      ?auto_11817 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11816 ?auto_11814 ) ( not ( = ?auto_11811 ?auto_11815 ) ) ( not ( = ?auto_11814 ?auto_11816 ) ) ( PERSON-AT ?auto_11813 ?auto_11811 ) ( not ( = ?auto_11813 ?auto_11812 ) ) ( PERSON-AT ?auto_11812 ?auto_11815 ) ( AIRCRAFT-AT ?auto_11817 ?auto_11811 ) ( FUEL-LEVEL ?auto_11817 ?auto_11814 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11813 ?auto_11812 ?auto_11811 )
      ( FLY-2PPL-VERIFY ?auto_11812 ?auto_11813 ?auto_11811 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11827 - PERSON
      ?auto_11828 - PERSON
      ?auto_11829 - PERSON
      ?auto_11826 - CITY
    )
    :vars
    (
      ?auto_11832 - FLEVEL
      ?auto_11830 - FLEVEL
      ?auto_11831 - CITY
      ?auto_11833 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11832 ?auto_11830 ) ( not ( = ?auto_11826 ?auto_11831 ) ) ( not ( = ?auto_11830 ?auto_11832 ) ) ( PERSON-AT ?auto_11828 ?auto_11826 ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( PERSON-AT ?auto_11829 ?auto_11831 ) ( AIRCRAFT-AT ?auto_11833 ?auto_11826 ) ( FUEL-LEVEL ?auto_11833 ?auto_11830 ) ( PERSON-AT ?auto_11827 ?auto_11826 ) ( not ( = ?auto_11827 ?auto_11828 ) ) ( not ( = ?auto_11827 ?auto_11829 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11828 ?auto_11829 ?auto_11826 )
      ( FLY-3PPL-VERIFY ?auto_11827 ?auto_11828 ?auto_11829 ?auto_11826 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11835 - PERSON
      ?auto_11836 - PERSON
      ?auto_11837 - PERSON
      ?auto_11834 - CITY
    )
    :vars
    (
      ?auto_11840 - FLEVEL
      ?auto_11838 - FLEVEL
      ?auto_11839 - CITY
      ?auto_11841 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11840 ?auto_11838 ) ( not ( = ?auto_11834 ?auto_11839 ) ) ( not ( = ?auto_11838 ?auto_11840 ) ) ( PERSON-AT ?auto_11837 ?auto_11834 ) ( not ( = ?auto_11837 ?auto_11836 ) ) ( PERSON-AT ?auto_11836 ?auto_11839 ) ( AIRCRAFT-AT ?auto_11841 ?auto_11834 ) ( FUEL-LEVEL ?auto_11841 ?auto_11838 ) ( PERSON-AT ?auto_11835 ?auto_11834 ) ( not ( = ?auto_11835 ?auto_11836 ) ) ( not ( = ?auto_11835 ?auto_11837 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11837 ?auto_11836 ?auto_11834 )
      ( FLY-3PPL-VERIFY ?auto_11835 ?auto_11836 ?auto_11837 ?auto_11834 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11851 - PERSON
      ?auto_11852 - PERSON
      ?auto_11853 - PERSON
      ?auto_11850 - CITY
    )
    :vars
    (
      ?auto_11856 - FLEVEL
      ?auto_11854 - FLEVEL
      ?auto_11855 - CITY
      ?auto_11857 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11856 ?auto_11854 ) ( not ( = ?auto_11850 ?auto_11855 ) ) ( not ( = ?auto_11854 ?auto_11856 ) ) ( PERSON-AT ?auto_11852 ?auto_11850 ) ( not ( = ?auto_11852 ?auto_11851 ) ) ( PERSON-AT ?auto_11851 ?auto_11855 ) ( AIRCRAFT-AT ?auto_11857 ?auto_11850 ) ( FUEL-LEVEL ?auto_11857 ?auto_11854 ) ( PERSON-AT ?auto_11853 ?auto_11850 ) ( not ( = ?auto_11851 ?auto_11853 ) ) ( not ( = ?auto_11852 ?auto_11853 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11852 ?auto_11851 ?auto_11850 )
      ( FLY-3PPL-VERIFY ?auto_11851 ?auto_11852 ?auto_11853 ?auto_11850 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11884 - PERSON
      ?auto_11883 - CITY
    )
    :vars
    (
      ?auto_11888 - FLEVEL
      ?auto_11885 - FLEVEL
      ?auto_11886 - CITY
      ?auto_11887 - PERSON
      ?auto_11889 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11888 ?auto_11885 ) ( not ( = ?auto_11883 ?auto_11886 ) ) ( not ( = ?auto_11885 ?auto_11888 ) ) ( PERSON-AT ?auto_11887 ?auto_11883 ) ( not ( = ?auto_11887 ?auto_11884 ) ) ( PERSON-AT ?auto_11884 ?auto_11886 ) ( AIRCRAFT-AT ?auto_11889 ?auto_11883 ) ( FUEL-LEVEL ?auto_11889 ?auto_11888 ) )
    :subtasks
    ( ( !REFUEL ?auto_11889 ?auto_11883 ?auto_11888 ?auto_11885 )
      ( FLY-2PPL ?auto_11887 ?auto_11884 ?auto_11883 )
      ( FLY-1PPL-VERIFY ?auto_11884 ?auto_11883 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11891 - PERSON
      ?auto_11892 - PERSON
      ?auto_11890 - CITY
    )
    :vars
    (
      ?auto_11893 - FLEVEL
      ?auto_11895 - FLEVEL
      ?auto_11894 - CITY
      ?auto_11896 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11893 ?auto_11895 ) ( not ( = ?auto_11890 ?auto_11894 ) ) ( not ( = ?auto_11895 ?auto_11893 ) ) ( PERSON-AT ?auto_11891 ?auto_11890 ) ( not ( = ?auto_11891 ?auto_11892 ) ) ( PERSON-AT ?auto_11892 ?auto_11894 ) ( AIRCRAFT-AT ?auto_11896 ?auto_11890 ) ( FUEL-LEVEL ?auto_11896 ?auto_11893 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11892 ?auto_11890 )
      ( FLY-2PPL-VERIFY ?auto_11891 ?auto_11892 ?auto_11890 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11898 - PERSON
      ?auto_11899 - PERSON
      ?auto_11897 - CITY
    )
    :vars
    (
      ?auto_11903 - FLEVEL
      ?auto_11902 - FLEVEL
      ?auto_11901 - CITY
      ?auto_11900 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11903 ?auto_11902 ) ( not ( = ?auto_11897 ?auto_11901 ) ) ( not ( = ?auto_11902 ?auto_11903 ) ) ( PERSON-AT ?auto_11899 ?auto_11897 ) ( not ( = ?auto_11899 ?auto_11898 ) ) ( PERSON-AT ?auto_11898 ?auto_11901 ) ( AIRCRAFT-AT ?auto_11900 ?auto_11897 ) ( FUEL-LEVEL ?auto_11900 ?auto_11903 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11899 ?auto_11898 ?auto_11897 )
      ( FLY-2PPL-VERIFY ?auto_11898 ?auto_11899 ?auto_11897 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11913 - PERSON
      ?auto_11914 - PERSON
      ?auto_11915 - PERSON
      ?auto_11912 - CITY
    )
    :vars
    (
      ?auto_11919 - FLEVEL
      ?auto_11918 - FLEVEL
      ?auto_11917 - CITY
      ?auto_11916 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11919 ?auto_11918 ) ( not ( = ?auto_11912 ?auto_11917 ) ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( PERSON-AT ?auto_11914 ?auto_11912 ) ( not ( = ?auto_11914 ?auto_11915 ) ) ( PERSON-AT ?auto_11915 ?auto_11917 ) ( AIRCRAFT-AT ?auto_11916 ?auto_11912 ) ( FUEL-LEVEL ?auto_11916 ?auto_11919 ) ( PERSON-AT ?auto_11913 ?auto_11912 ) ( not ( = ?auto_11913 ?auto_11914 ) ) ( not ( = ?auto_11913 ?auto_11915 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11914 ?auto_11915 ?auto_11912 )
      ( FLY-3PPL-VERIFY ?auto_11913 ?auto_11914 ?auto_11915 ?auto_11912 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11921 - PERSON
      ?auto_11922 - PERSON
      ?auto_11923 - PERSON
      ?auto_11920 - CITY
    )
    :vars
    (
      ?auto_11927 - FLEVEL
      ?auto_11926 - FLEVEL
      ?auto_11925 - CITY
      ?auto_11924 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11927 ?auto_11926 ) ( not ( = ?auto_11920 ?auto_11925 ) ) ( not ( = ?auto_11926 ?auto_11927 ) ) ( PERSON-AT ?auto_11923 ?auto_11920 ) ( not ( = ?auto_11923 ?auto_11922 ) ) ( PERSON-AT ?auto_11922 ?auto_11925 ) ( AIRCRAFT-AT ?auto_11924 ?auto_11920 ) ( FUEL-LEVEL ?auto_11924 ?auto_11927 ) ( PERSON-AT ?auto_11921 ?auto_11920 ) ( not ( = ?auto_11921 ?auto_11922 ) ) ( not ( = ?auto_11921 ?auto_11923 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11923 ?auto_11922 ?auto_11920 )
      ( FLY-3PPL-VERIFY ?auto_11921 ?auto_11922 ?auto_11923 ?auto_11920 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11937 - PERSON
      ?auto_11938 - PERSON
      ?auto_11939 - PERSON
      ?auto_11936 - CITY
    )
    :vars
    (
      ?auto_11943 - FLEVEL
      ?auto_11942 - FLEVEL
      ?auto_11941 - CITY
      ?auto_11940 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11943 ?auto_11942 ) ( not ( = ?auto_11936 ?auto_11941 ) ) ( not ( = ?auto_11942 ?auto_11943 ) ) ( PERSON-AT ?auto_11938 ?auto_11936 ) ( not ( = ?auto_11938 ?auto_11937 ) ) ( PERSON-AT ?auto_11937 ?auto_11941 ) ( AIRCRAFT-AT ?auto_11940 ?auto_11936 ) ( FUEL-LEVEL ?auto_11940 ?auto_11943 ) ( PERSON-AT ?auto_11939 ?auto_11936 ) ( not ( = ?auto_11937 ?auto_11939 ) ) ( not ( = ?auto_11938 ?auto_11939 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11938 ?auto_11937 ?auto_11936 )
      ( FLY-3PPL-VERIFY ?auto_11937 ?auto_11938 ?auto_11939 ?auto_11936 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11970 - PERSON
      ?auto_11969 - CITY
    )
    :vars
    (
      ?auto_11975 - FLEVEL
      ?auto_11974 - FLEVEL
      ?auto_11972 - CITY
      ?auto_11973 - PERSON
      ?auto_11971 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11975 ?auto_11974 ) ( not ( = ?auto_11969 ?auto_11972 ) ) ( not ( = ?auto_11974 ?auto_11975 ) ) ( not ( = ?auto_11973 ?auto_11970 ) ) ( PERSON-AT ?auto_11970 ?auto_11972 ) ( AIRCRAFT-AT ?auto_11971 ?auto_11969 ) ( FUEL-LEVEL ?auto_11971 ?auto_11975 ) ( IN ?auto_11973 ?auto_11971 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11973 ?auto_11969 )
      ( FLY-2PPL ?auto_11973 ?auto_11970 ?auto_11969 )
      ( FLY-1PPL-VERIFY ?auto_11970 ?auto_11969 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11977 - PERSON
      ?auto_11978 - PERSON
      ?auto_11976 - CITY
    )
    :vars
    (
      ?auto_11979 - FLEVEL
      ?auto_11981 - FLEVEL
      ?auto_11980 - CITY
      ?auto_11982 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11979 ?auto_11981 ) ( not ( = ?auto_11976 ?auto_11980 ) ) ( not ( = ?auto_11981 ?auto_11979 ) ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( PERSON-AT ?auto_11978 ?auto_11980 ) ( AIRCRAFT-AT ?auto_11982 ?auto_11976 ) ( FUEL-LEVEL ?auto_11982 ?auto_11979 ) ( IN ?auto_11977 ?auto_11982 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11978 ?auto_11976 )
      ( FLY-2PPL-VERIFY ?auto_11977 ?auto_11978 ?auto_11976 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11984 - PERSON
      ?auto_11985 - PERSON
      ?auto_11983 - CITY
    )
    :vars
    (
      ?auto_11988 - FLEVEL
      ?auto_11989 - FLEVEL
      ?auto_11987 - CITY
      ?auto_11986 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11988 ?auto_11989 ) ( not ( = ?auto_11983 ?auto_11987 ) ) ( not ( = ?auto_11989 ?auto_11988 ) ) ( not ( = ?auto_11985 ?auto_11984 ) ) ( PERSON-AT ?auto_11984 ?auto_11987 ) ( AIRCRAFT-AT ?auto_11986 ?auto_11983 ) ( FUEL-LEVEL ?auto_11986 ?auto_11988 ) ( IN ?auto_11985 ?auto_11986 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11985 ?auto_11984 ?auto_11983 )
      ( FLY-2PPL-VERIFY ?auto_11984 ?auto_11985 ?auto_11983 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12056 - PERSON
      ?auto_12055 - CITY
    )
    :vars
    (
      ?auto_12060 - FLEVEL
      ?auto_12061 - FLEVEL
      ?auto_12059 - CITY
      ?auto_12057 - PERSON
      ?auto_12058 - AIRCRAFT
      ?auto_12062 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12060 ?auto_12061 ) ( not ( = ?auto_12055 ?auto_12059 ) ) ( not ( = ?auto_12061 ?auto_12060 ) ) ( not ( = ?auto_12057 ?auto_12056 ) ) ( PERSON-AT ?auto_12056 ?auto_12059 ) ( IN ?auto_12057 ?auto_12058 ) ( AIRCRAFT-AT ?auto_12058 ?auto_12062 ) ( FUEL-LEVEL ?auto_12058 ?auto_12061 ) ( not ( = ?auto_12055 ?auto_12062 ) ) ( not ( = ?auto_12059 ?auto_12062 ) ) )
    :subtasks
    ( ( !FLY ?auto_12058 ?auto_12062 ?auto_12055 ?auto_12061 ?auto_12060 )
      ( FLY-2PPL ?auto_12057 ?auto_12056 ?auto_12055 )
      ( FLY-1PPL-VERIFY ?auto_12056 ?auto_12055 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12064 - PERSON
      ?auto_12065 - PERSON
      ?auto_12063 - CITY
    )
    :vars
    (
      ?auto_12070 - FLEVEL
      ?auto_12066 - FLEVEL
      ?auto_12068 - CITY
      ?auto_12067 - AIRCRAFT
      ?auto_12069 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12070 ?auto_12066 ) ( not ( = ?auto_12063 ?auto_12068 ) ) ( not ( = ?auto_12066 ?auto_12070 ) ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( PERSON-AT ?auto_12065 ?auto_12068 ) ( IN ?auto_12064 ?auto_12067 ) ( AIRCRAFT-AT ?auto_12067 ?auto_12069 ) ( FUEL-LEVEL ?auto_12067 ?auto_12066 ) ( not ( = ?auto_12063 ?auto_12069 ) ) ( not ( = ?auto_12068 ?auto_12069 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12065 ?auto_12063 )
      ( FLY-2PPL-VERIFY ?auto_12064 ?auto_12065 ?auto_12063 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12072 - PERSON
      ?auto_12073 - PERSON
      ?auto_12071 - CITY
    )
    :vars
    (
      ?auto_12075 - FLEVEL
      ?auto_12078 - FLEVEL
      ?auto_12077 - CITY
      ?auto_12074 - AIRCRAFT
      ?auto_12076 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12075 ?auto_12078 ) ( not ( = ?auto_12071 ?auto_12077 ) ) ( not ( = ?auto_12078 ?auto_12075 ) ) ( not ( = ?auto_12073 ?auto_12072 ) ) ( PERSON-AT ?auto_12072 ?auto_12077 ) ( IN ?auto_12073 ?auto_12074 ) ( AIRCRAFT-AT ?auto_12074 ?auto_12076 ) ( FUEL-LEVEL ?auto_12074 ?auto_12078 ) ( not ( = ?auto_12071 ?auto_12076 ) ) ( not ( = ?auto_12077 ?auto_12076 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12073 ?auto_12072 ?auto_12071 )
      ( FLY-2PPL-VERIFY ?auto_12072 ?auto_12073 ?auto_12071 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12153 - PERSON
      ?auto_12152 - CITY
    )
    :vars
    (
      ?auto_12155 - FLEVEL
      ?auto_12159 - FLEVEL
      ?auto_12157 - CITY
      ?auto_12158 - PERSON
      ?auto_12154 - AIRCRAFT
      ?auto_12156 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12155 ?auto_12159 ) ( not ( = ?auto_12152 ?auto_12157 ) ) ( not ( = ?auto_12159 ?auto_12155 ) ) ( not ( = ?auto_12158 ?auto_12153 ) ) ( PERSON-AT ?auto_12153 ?auto_12157 ) ( AIRCRAFT-AT ?auto_12154 ?auto_12156 ) ( FUEL-LEVEL ?auto_12154 ?auto_12159 ) ( not ( = ?auto_12152 ?auto_12156 ) ) ( not ( = ?auto_12157 ?auto_12156 ) ) ( PERSON-AT ?auto_12158 ?auto_12156 ) )
    :subtasks
    ( ( !BOARD ?auto_12158 ?auto_12154 ?auto_12156 )
      ( FLY-2PPL ?auto_12158 ?auto_12153 ?auto_12152 )
      ( FLY-1PPL-VERIFY ?auto_12153 ?auto_12152 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12161 - PERSON
      ?auto_12162 - PERSON
      ?auto_12160 - CITY
    )
    :vars
    (
      ?auto_12167 - FLEVEL
      ?auto_12165 - FLEVEL
      ?auto_12166 - CITY
      ?auto_12164 - AIRCRAFT
      ?auto_12163 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12167 ?auto_12165 ) ( not ( = ?auto_12160 ?auto_12166 ) ) ( not ( = ?auto_12165 ?auto_12167 ) ) ( not ( = ?auto_12161 ?auto_12162 ) ) ( PERSON-AT ?auto_12162 ?auto_12166 ) ( AIRCRAFT-AT ?auto_12164 ?auto_12163 ) ( FUEL-LEVEL ?auto_12164 ?auto_12165 ) ( not ( = ?auto_12160 ?auto_12163 ) ) ( not ( = ?auto_12166 ?auto_12163 ) ) ( PERSON-AT ?auto_12161 ?auto_12163 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12162 ?auto_12160 )
      ( FLY-2PPL-VERIFY ?auto_12161 ?auto_12162 ?auto_12160 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12169 - PERSON
      ?auto_12170 - PERSON
      ?auto_12168 - CITY
    )
    :vars
    (
      ?auto_12174 - FLEVEL
      ?auto_12175 - FLEVEL
      ?auto_12173 - CITY
      ?auto_12172 - AIRCRAFT
      ?auto_12171 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12174 ?auto_12175 ) ( not ( = ?auto_12168 ?auto_12173 ) ) ( not ( = ?auto_12175 ?auto_12174 ) ) ( not ( = ?auto_12170 ?auto_12169 ) ) ( PERSON-AT ?auto_12169 ?auto_12173 ) ( AIRCRAFT-AT ?auto_12172 ?auto_12171 ) ( FUEL-LEVEL ?auto_12172 ?auto_12175 ) ( not ( = ?auto_12168 ?auto_12171 ) ) ( not ( = ?auto_12173 ?auto_12171 ) ) ( PERSON-AT ?auto_12170 ?auto_12171 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12170 ?auto_12169 ?auto_12168 )
      ( FLY-2PPL-VERIFY ?auto_12169 ?auto_12170 ?auto_12168 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12250 - PERSON
      ?auto_12249 - CITY
    )
    :vars
    (
      ?auto_12254 - FLEVEL
      ?auto_12255 - FLEVEL
      ?auto_12253 - CITY
      ?auto_12256 - PERSON
      ?auto_12252 - AIRCRAFT
      ?auto_12251 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12254 ?auto_12255 ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( not ( = ?auto_12255 ?auto_12254 ) ) ( not ( = ?auto_12256 ?auto_12250 ) ) ( PERSON-AT ?auto_12250 ?auto_12253 ) ( AIRCRAFT-AT ?auto_12252 ?auto_12251 ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12253 ?auto_12251 ) ) ( PERSON-AT ?auto_12256 ?auto_12251 ) ( FUEL-LEVEL ?auto_12252 ?auto_12254 ) )
    :subtasks
    ( ( !REFUEL ?auto_12252 ?auto_12251 ?auto_12254 ?auto_12255 )
      ( FLY-2PPL ?auto_12256 ?auto_12250 ?auto_12249 )
      ( FLY-1PPL-VERIFY ?auto_12250 ?auto_12249 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12258 - PERSON
      ?auto_12259 - PERSON
      ?auto_12257 - CITY
    )
    :vars
    (
      ?auto_12264 - FLEVEL
      ?auto_12261 - FLEVEL
      ?auto_12260 - CITY
      ?auto_12262 - AIRCRAFT
      ?auto_12263 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12264 ?auto_12261 ) ( not ( = ?auto_12257 ?auto_12260 ) ) ( not ( = ?auto_12261 ?auto_12264 ) ) ( not ( = ?auto_12258 ?auto_12259 ) ) ( PERSON-AT ?auto_12259 ?auto_12260 ) ( AIRCRAFT-AT ?auto_12262 ?auto_12263 ) ( not ( = ?auto_12257 ?auto_12263 ) ) ( not ( = ?auto_12260 ?auto_12263 ) ) ( PERSON-AT ?auto_12258 ?auto_12263 ) ( FUEL-LEVEL ?auto_12262 ?auto_12264 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12259 ?auto_12257 )
      ( FLY-2PPL-VERIFY ?auto_12258 ?auto_12259 ?auto_12257 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12266 - PERSON
      ?auto_12267 - PERSON
      ?auto_12265 - CITY
    )
    :vars
    (
      ?auto_12272 - FLEVEL
      ?auto_12268 - FLEVEL
      ?auto_12269 - CITY
      ?auto_12270 - AIRCRAFT
      ?auto_12271 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12272 ?auto_12268 ) ( not ( = ?auto_12265 ?auto_12269 ) ) ( not ( = ?auto_12268 ?auto_12272 ) ) ( not ( = ?auto_12267 ?auto_12266 ) ) ( PERSON-AT ?auto_12266 ?auto_12269 ) ( AIRCRAFT-AT ?auto_12270 ?auto_12271 ) ( not ( = ?auto_12265 ?auto_12271 ) ) ( not ( = ?auto_12269 ?auto_12271 ) ) ( PERSON-AT ?auto_12267 ?auto_12271 ) ( FUEL-LEVEL ?auto_12270 ?auto_12272 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12267 ?auto_12266 ?auto_12265 )
      ( FLY-2PPL-VERIFY ?auto_12266 ?auto_12267 ?auto_12265 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12778 - PERSON
      ?auto_12779 - PERSON
      ?auto_12780 - PERSON
      ?auto_12777 - CITY
    )
    :vars
    (
      ?auto_12781 - AIRCRAFT
      ?auto_12785 - CITY
      ?auto_12784 - FLEVEL
      ?auto_12782 - FLEVEL
      ?auto_12783 - PERSON
    )
    :precondition
    ( and ( IN ?auto_12780 ?auto_12781 ) ( AIRCRAFT-AT ?auto_12781 ?auto_12785 ) ( FUEL-LEVEL ?auto_12781 ?auto_12784 ) ( NEXT ?auto_12782 ?auto_12784 ) ( not ( = ?auto_12777 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12782 ) ) ( PERSON-AT ?auto_12783 ?auto_12777 ) ( not ( = ?auto_12783 ?auto_12780 ) ) ( PERSON-AT ?auto_12778 ?auto_12777 ) ( PERSON-AT ?auto_12779 ?auto_12777 ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12780 ) ) ( not ( = ?auto_12778 ?auto_12783 ) ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12783 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12783 ?auto_12780 ?auto_12777 )
      ( FLY-3PPL-VERIFY ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12777 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12791 - PERSON
      ?auto_12792 - PERSON
      ?auto_12793 - PERSON
      ?auto_12790 - CITY
    )
    :vars
    (
      ?auto_12794 - AIRCRAFT
      ?auto_12798 - CITY
      ?auto_12797 - FLEVEL
      ?auto_12795 - FLEVEL
      ?auto_12796 - PERSON
    )
    :precondition
    ( and ( IN ?auto_12792 ?auto_12794 ) ( AIRCRAFT-AT ?auto_12794 ?auto_12798 ) ( FUEL-LEVEL ?auto_12794 ?auto_12797 ) ( NEXT ?auto_12795 ?auto_12797 ) ( not ( = ?auto_12790 ?auto_12798 ) ) ( not ( = ?auto_12797 ?auto_12795 ) ) ( PERSON-AT ?auto_12796 ?auto_12790 ) ( not ( = ?auto_12796 ?auto_12792 ) ) ( PERSON-AT ?auto_12791 ?auto_12790 ) ( PERSON-AT ?auto_12793 ?auto_12790 ) ( not ( = ?auto_12791 ?auto_12792 ) ) ( not ( = ?auto_12791 ?auto_12793 ) ) ( not ( = ?auto_12791 ?auto_12796 ) ) ( not ( = ?auto_12792 ?auto_12793 ) ) ( not ( = ?auto_12793 ?auto_12796 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12796 ?auto_12792 ?auto_12790 )
      ( FLY-3PPL-VERIFY ?auto_12791 ?auto_12792 ?auto_12793 ?auto_12790 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12809 - PERSON
      ?auto_12810 - PERSON
      ?auto_12811 - PERSON
      ?auto_12808 - CITY
    )
    :vars
    (
      ?auto_12812 - AIRCRAFT
      ?auto_12815 - CITY
      ?auto_12814 - FLEVEL
      ?auto_12813 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12809 ?auto_12812 ) ( AIRCRAFT-AT ?auto_12812 ?auto_12815 ) ( FUEL-LEVEL ?auto_12812 ?auto_12814 ) ( NEXT ?auto_12813 ?auto_12814 ) ( not ( = ?auto_12808 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12813 ) ) ( PERSON-AT ?auto_12811 ?auto_12808 ) ( not ( = ?auto_12811 ?auto_12809 ) ) ( PERSON-AT ?auto_12810 ?auto_12808 ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( not ( = ?auto_12810 ?auto_12811 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12811 ?auto_12809 ?auto_12808 )
      ( FLY-3PPL-VERIFY ?auto_12809 ?auto_12810 ?auto_12811 ?auto_12808 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12833 - PERSON
      ?auto_12834 - PERSON
      ?auto_12835 - PERSON
      ?auto_12832 - CITY
    )
    :vars
    (
      ?auto_12836 - AIRCRAFT
      ?auto_12840 - CITY
      ?auto_12839 - FLEVEL
      ?auto_12837 - FLEVEL
      ?auto_12838 - PERSON
    )
    :precondition
    ( and ( IN ?auto_12833 ?auto_12836 ) ( AIRCRAFT-AT ?auto_12836 ?auto_12840 ) ( FUEL-LEVEL ?auto_12836 ?auto_12839 ) ( NEXT ?auto_12837 ?auto_12839 ) ( not ( = ?auto_12832 ?auto_12840 ) ) ( not ( = ?auto_12839 ?auto_12837 ) ) ( PERSON-AT ?auto_12838 ?auto_12832 ) ( not ( = ?auto_12838 ?auto_12833 ) ) ( PERSON-AT ?auto_12834 ?auto_12832 ) ( PERSON-AT ?auto_12835 ?auto_12832 ) ( not ( = ?auto_12833 ?auto_12834 ) ) ( not ( = ?auto_12833 ?auto_12835 ) ) ( not ( = ?auto_12834 ?auto_12835 ) ) ( not ( = ?auto_12834 ?auto_12838 ) ) ( not ( = ?auto_12835 ?auto_12838 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12838 ?auto_12833 ?auto_12832 )
      ( FLY-3PPL-VERIFY ?auto_12833 ?auto_12834 ?auto_12835 ?auto_12832 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12948 - PERSON
      ?auto_12949 - PERSON
      ?auto_12950 - PERSON
      ?auto_12947 - CITY
    )
    :vars
    (
      ?auto_12955 - AIRCRAFT
      ?auto_12954 - CITY
      ?auto_12953 - FLEVEL
      ?auto_12952 - FLEVEL
      ?auto_12951 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_12955 ?auto_12954 ) ( FUEL-LEVEL ?auto_12955 ?auto_12953 ) ( NEXT ?auto_12952 ?auto_12953 ) ( not ( = ?auto_12947 ?auto_12954 ) ) ( not ( = ?auto_12953 ?auto_12952 ) ) ( PERSON-AT ?auto_12951 ?auto_12947 ) ( not ( = ?auto_12951 ?auto_12950 ) ) ( PERSON-AT ?auto_12950 ?auto_12954 ) ( PERSON-AT ?auto_12948 ?auto_12947 ) ( PERSON-AT ?auto_12949 ?auto_12947 ) ( not ( = ?auto_12948 ?auto_12949 ) ) ( not ( = ?auto_12948 ?auto_12950 ) ) ( not ( = ?auto_12948 ?auto_12951 ) ) ( not ( = ?auto_12949 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12951 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12951 ?auto_12950 ?auto_12947 )
      ( FLY-3PPL-VERIFY ?auto_12948 ?auto_12949 ?auto_12950 ?auto_12947 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12961 - PERSON
      ?auto_12962 - PERSON
      ?auto_12963 - PERSON
      ?auto_12960 - CITY
    )
    :vars
    (
      ?auto_12968 - AIRCRAFT
      ?auto_12967 - CITY
      ?auto_12966 - FLEVEL
      ?auto_12965 - FLEVEL
      ?auto_12964 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_12968 ?auto_12967 ) ( FUEL-LEVEL ?auto_12968 ?auto_12966 ) ( NEXT ?auto_12965 ?auto_12966 ) ( not ( = ?auto_12960 ?auto_12967 ) ) ( not ( = ?auto_12966 ?auto_12965 ) ) ( PERSON-AT ?auto_12964 ?auto_12960 ) ( not ( = ?auto_12964 ?auto_12962 ) ) ( PERSON-AT ?auto_12962 ?auto_12967 ) ( PERSON-AT ?auto_12961 ?auto_12960 ) ( PERSON-AT ?auto_12963 ?auto_12960 ) ( not ( = ?auto_12961 ?auto_12962 ) ) ( not ( = ?auto_12961 ?auto_12963 ) ) ( not ( = ?auto_12961 ?auto_12964 ) ) ( not ( = ?auto_12962 ?auto_12963 ) ) ( not ( = ?auto_12963 ?auto_12964 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12964 ?auto_12962 ?auto_12960 )
      ( FLY-3PPL-VERIFY ?auto_12961 ?auto_12962 ?auto_12963 ?auto_12960 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13003 - PERSON
      ?auto_13004 - PERSON
      ?auto_13005 - PERSON
      ?auto_13002 - CITY
    )
    :vars
    (
      ?auto_13010 - AIRCRAFT
      ?auto_13009 - CITY
      ?auto_13008 - FLEVEL
      ?auto_13007 - FLEVEL
      ?auto_13006 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13010 ?auto_13009 ) ( FUEL-LEVEL ?auto_13010 ?auto_13008 ) ( NEXT ?auto_13007 ?auto_13008 ) ( not ( = ?auto_13002 ?auto_13009 ) ) ( not ( = ?auto_13008 ?auto_13007 ) ) ( PERSON-AT ?auto_13006 ?auto_13002 ) ( not ( = ?auto_13006 ?auto_13003 ) ) ( PERSON-AT ?auto_13003 ?auto_13009 ) ( PERSON-AT ?auto_13004 ?auto_13002 ) ( PERSON-AT ?auto_13005 ?auto_13002 ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13005 ?auto_13006 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13006 ?auto_13003 ?auto_13002 )
      ( FLY-3PPL-VERIFY ?auto_13003 ?auto_13004 ?auto_13005 ?auto_13002 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13094 - PERSON
      ?auto_13095 - PERSON
      ?auto_13096 - PERSON
      ?auto_13093 - CITY
    )
    :vars
    (
      ?auto_13098 - AIRCRAFT
      ?auto_13099 - CITY
      ?auto_13097 - FLEVEL
      ?auto_13100 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13098 ?auto_13099 ) ( NEXT ?auto_13097 ?auto_13100 ) ( not ( = ?auto_13093 ?auto_13099 ) ) ( not ( = ?auto_13100 ?auto_13097 ) ) ( PERSON-AT ?auto_13094 ?auto_13093 ) ( not ( = ?auto_13094 ?auto_13095 ) ) ( PERSON-AT ?auto_13095 ?auto_13099 ) ( FUEL-LEVEL ?auto_13098 ?auto_13097 ) ( PERSON-AT ?auto_13096 ?auto_13093 ) ( not ( = ?auto_13094 ?auto_13096 ) ) ( not ( = ?auto_13095 ?auto_13096 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13094 ?auto_13095 ?auto_13093 )
      ( FLY-3PPL-VERIFY ?auto_13094 ?auto_13095 ?auto_13096 ?auto_13093 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13118 - PERSON
      ?auto_13119 - PERSON
      ?auto_13120 - PERSON
      ?auto_13117 - CITY
    )
    :vars
    (
      ?auto_13122 - AIRCRAFT
      ?auto_13123 - CITY
      ?auto_13121 - FLEVEL
      ?auto_13125 - FLEVEL
      ?auto_13124 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13122 ?auto_13123 ) ( NEXT ?auto_13121 ?auto_13125 ) ( not ( = ?auto_13117 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13121 ) ) ( PERSON-AT ?auto_13124 ?auto_13117 ) ( not ( = ?auto_13124 ?auto_13120 ) ) ( PERSON-AT ?auto_13120 ?auto_13123 ) ( FUEL-LEVEL ?auto_13122 ?auto_13121 ) ( PERSON-AT ?auto_13118 ?auto_13117 ) ( PERSON-AT ?auto_13119 ?auto_13117 ) ( not ( = ?auto_13118 ?auto_13119 ) ) ( not ( = ?auto_13118 ?auto_13120 ) ) ( not ( = ?auto_13118 ?auto_13124 ) ) ( not ( = ?auto_13119 ?auto_13120 ) ) ( not ( = ?auto_13119 ?auto_13124 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13124 ?auto_13120 ?auto_13117 )
      ( FLY-3PPL-VERIFY ?auto_13118 ?auto_13119 ?auto_13120 ?auto_13117 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13131 - PERSON
      ?auto_13132 - PERSON
      ?auto_13133 - PERSON
      ?auto_13130 - CITY
    )
    :vars
    (
      ?auto_13135 - AIRCRAFT
      ?auto_13136 - CITY
      ?auto_13134 - FLEVEL
      ?auto_13138 - FLEVEL
      ?auto_13137 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13135 ?auto_13136 ) ( NEXT ?auto_13134 ?auto_13138 ) ( not ( = ?auto_13130 ?auto_13136 ) ) ( not ( = ?auto_13138 ?auto_13134 ) ) ( PERSON-AT ?auto_13137 ?auto_13130 ) ( not ( = ?auto_13137 ?auto_13132 ) ) ( PERSON-AT ?auto_13132 ?auto_13136 ) ( FUEL-LEVEL ?auto_13135 ?auto_13134 ) ( PERSON-AT ?auto_13131 ?auto_13130 ) ( PERSON-AT ?auto_13133 ?auto_13130 ) ( not ( = ?auto_13131 ?auto_13132 ) ) ( not ( = ?auto_13131 ?auto_13133 ) ) ( not ( = ?auto_13131 ?auto_13137 ) ) ( not ( = ?auto_13132 ?auto_13133 ) ) ( not ( = ?auto_13133 ?auto_13137 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13137 ?auto_13132 ?auto_13130 )
      ( FLY-3PPL-VERIFY ?auto_13131 ?auto_13132 ?auto_13133 ?auto_13130 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13149 - PERSON
      ?auto_13150 - PERSON
      ?auto_13151 - PERSON
      ?auto_13148 - CITY
    )
    :vars
    (
      ?auto_13153 - AIRCRAFT
      ?auto_13154 - CITY
      ?auto_13152 - FLEVEL
      ?auto_13155 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13153 ?auto_13154 ) ( NEXT ?auto_13152 ?auto_13155 ) ( not ( = ?auto_13148 ?auto_13154 ) ) ( not ( = ?auto_13155 ?auto_13152 ) ) ( PERSON-AT ?auto_13150 ?auto_13148 ) ( not ( = ?auto_13150 ?auto_13149 ) ) ( PERSON-AT ?auto_13149 ?auto_13154 ) ( FUEL-LEVEL ?auto_13153 ?auto_13152 ) ( PERSON-AT ?auto_13151 ?auto_13148 ) ( not ( = ?auto_13149 ?auto_13151 ) ) ( not ( = ?auto_13150 ?auto_13151 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13150 ?auto_13149 ?auto_13148 )
      ( FLY-3PPL-VERIFY ?auto_13149 ?auto_13150 ?auto_13151 ?auto_13148 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13173 - PERSON
      ?auto_13174 - PERSON
      ?auto_13175 - PERSON
      ?auto_13172 - CITY
    )
    :vars
    (
      ?auto_13177 - AIRCRAFT
      ?auto_13178 - CITY
      ?auto_13176 - FLEVEL
      ?auto_13180 - FLEVEL
      ?auto_13179 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13177 ?auto_13178 ) ( NEXT ?auto_13176 ?auto_13180 ) ( not ( = ?auto_13172 ?auto_13178 ) ) ( not ( = ?auto_13180 ?auto_13176 ) ) ( PERSON-AT ?auto_13179 ?auto_13172 ) ( not ( = ?auto_13179 ?auto_13173 ) ) ( PERSON-AT ?auto_13173 ?auto_13178 ) ( FUEL-LEVEL ?auto_13177 ?auto_13176 ) ( PERSON-AT ?auto_13174 ?auto_13172 ) ( PERSON-AT ?auto_13175 ?auto_13172 ) ( not ( = ?auto_13173 ?auto_13174 ) ) ( not ( = ?auto_13173 ?auto_13175 ) ) ( not ( = ?auto_13174 ?auto_13175 ) ) ( not ( = ?auto_13174 ?auto_13179 ) ) ( not ( = ?auto_13175 ?auto_13179 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13179 ?auto_13173 ?auto_13172 )
      ( FLY-3PPL-VERIFY ?auto_13173 ?auto_13174 ?auto_13175 ?auto_13172 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13264 - PERSON
      ?auto_13265 - PERSON
      ?auto_13266 - PERSON
      ?auto_13263 - CITY
    )
    :vars
    (
      ?auto_13267 - FLEVEL
      ?auto_13268 - FLEVEL
      ?auto_13269 - CITY
      ?auto_13270 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13267 ?auto_13268 ) ( not ( = ?auto_13263 ?auto_13269 ) ) ( not ( = ?auto_13268 ?auto_13267 ) ) ( PERSON-AT ?auto_13264 ?auto_13263 ) ( not ( = ?auto_13264 ?auto_13265 ) ) ( PERSON-AT ?auto_13265 ?auto_13269 ) ( AIRCRAFT-AT ?auto_13270 ?auto_13263 ) ( FUEL-LEVEL ?auto_13270 ?auto_13268 ) ( PERSON-AT ?auto_13266 ?auto_13263 ) ( not ( = ?auto_13264 ?auto_13266 ) ) ( not ( = ?auto_13265 ?auto_13266 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13264 ?auto_13265 ?auto_13263 )
      ( FLY-3PPL-VERIFY ?auto_13264 ?auto_13265 ?auto_13266 ?auto_13263 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13288 - PERSON
      ?auto_13289 - PERSON
      ?auto_13290 - PERSON
      ?auto_13287 - CITY
    )
    :vars
    (
      ?auto_13291 - FLEVEL
      ?auto_13292 - FLEVEL
      ?auto_13293 - CITY
      ?auto_13294 - PERSON
      ?auto_13295 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13291 ?auto_13292 ) ( not ( = ?auto_13287 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13291 ) ) ( PERSON-AT ?auto_13294 ?auto_13287 ) ( not ( = ?auto_13294 ?auto_13290 ) ) ( PERSON-AT ?auto_13290 ?auto_13293 ) ( AIRCRAFT-AT ?auto_13295 ?auto_13287 ) ( FUEL-LEVEL ?auto_13295 ?auto_13292 ) ( PERSON-AT ?auto_13288 ?auto_13287 ) ( PERSON-AT ?auto_13289 ?auto_13287 ) ( not ( = ?auto_13288 ?auto_13289 ) ) ( not ( = ?auto_13288 ?auto_13290 ) ) ( not ( = ?auto_13288 ?auto_13294 ) ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13289 ?auto_13294 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13294 ?auto_13290 ?auto_13287 )
      ( FLY-3PPL-VERIFY ?auto_13288 ?auto_13289 ?auto_13290 ?auto_13287 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13301 - PERSON
      ?auto_13302 - PERSON
      ?auto_13303 - PERSON
      ?auto_13300 - CITY
    )
    :vars
    (
      ?auto_13304 - FLEVEL
      ?auto_13305 - FLEVEL
      ?auto_13306 - CITY
      ?auto_13307 - PERSON
      ?auto_13308 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13304 ?auto_13305 ) ( not ( = ?auto_13300 ?auto_13306 ) ) ( not ( = ?auto_13305 ?auto_13304 ) ) ( PERSON-AT ?auto_13307 ?auto_13300 ) ( not ( = ?auto_13307 ?auto_13302 ) ) ( PERSON-AT ?auto_13302 ?auto_13306 ) ( AIRCRAFT-AT ?auto_13308 ?auto_13300 ) ( FUEL-LEVEL ?auto_13308 ?auto_13305 ) ( PERSON-AT ?auto_13301 ?auto_13300 ) ( PERSON-AT ?auto_13303 ?auto_13300 ) ( not ( = ?auto_13301 ?auto_13302 ) ) ( not ( = ?auto_13301 ?auto_13303 ) ) ( not ( = ?auto_13301 ?auto_13307 ) ) ( not ( = ?auto_13302 ?auto_13303 ) ) ( not ( = ?auto_13303 ?auto_13307 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13307 ?auto_13302 ?auto_13300 )
      ( FLY-3PPL-VERIFY ?auto_13301 ?auto_13302 ?auto_13303 ?auto_13300 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13343 - PERSON
      ?auto_13344 - PERSON
      ?auto_13345 - PERSON
      ?auto_13342 - CITY
    )
    :vars
    (
      ?auto_13346 - FLEVEL
      ?auto_13347 - FLEVEL
      ?auto_13348 - CITY
      ?auto_13349 - PERSON
      ?auto_13350 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13346 ?auto_13347 ) ( not ( = ?auto_13342 ?auto_13348 ) ) ( not ( = ?auto_13347 ?auto_13346 ) ) ( PERSON-AT ?auto_13349 ?auto_13342 ) ( not ( = ?auto_13349 ?auto_13343 ) ) ( PERSON-AT ?auto_13343 ?auto_13348 ) ( AIRCRAFT-AT ?auto_13350 ?auto_13342 ) ( FUEL-LEVEL ?auto_13350 ?auto_13347 ) ( PERSON-AT ?auto_13344 ?auto_13342 ) ( PERSON-AT ?auto_13345 ?auto_13342 ) ( not ( = ?auto_13343 ?auto_13344 ) ) ( not ( = ?auto_13343 ?auto_13345 ) ) ( not ( = ?auto_13344 ?auto_13345 ) ) ( not ( = ?auto_13344 ?auto_13349 ) ) ( not ( = ?auto_13345 ?auto_13349 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13349 ?auto_13343 ?auto_13342 )
      ( FLY-3PPL-VERIFY ?auto_13343 ?auto_13344 ?auto_13345 ?auto_13342 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13422 - PERSON
      ?auto_13423 - PERSON
      ?auto_13424 - PERSON
      ?auto_13421 - CITY
    )
    :vars
    (
      ?auto_13427 - FLEVEL
      ?auto_13426 - FLEVEL
      ?auto_13425 - CITY
      ?auto_13428 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13427 ?auto_13426 ) ( not ( = ?auto_13421 ?auto_13425 ) ) ( not ( = ?auto_13426 ?auto_13427 ) ) ( PERSON-AT ?auto_13422 ?auto_13421 ) ( not ( = ?auto_13422 ?auto_13424 ) ) ( PERSON-AT ?auto_13424 ?auto_13425 ) ( AIRCRAFT-AT ?auto_13428 ?auto_13421 ) ( FUEL-LEVEL ?auto_13428 ?auto_13427 ) ( PERSON-AT ?auto_13423 ?auto_13421 ) ( not ( = ?auto_13422 ?auto_13423 ) ) ( not ( = ?auto_13423 ?auto_13424 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13422 ?auto_13424 ?auto_13421 )
      ( FLY-3PPL-VERIFY ?auto_13422 ?auto_13423 ?auto_13424 ?auto_13421 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13434 - PERSON
      ?auto_13435 - PERSON
      ?auto_13436 - PERSON
      ?auto_13433 - CITY
    )
    :vars
    (
      ?auto_13439 - FLEVEL
      ?auto_13438 - FLEVEL
      ?auto_13437 - CITY
      ?auto_13440 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13439 ?auto_13438 ) ( not ( = ?auto_13433 ?auto_13437 ) ) ( not ( = ?auto_13438 ?auto_13439 ) ) ( PERSON-AT ?auto_13434 ?auto_13433 ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( PERSON-AT ?auto_13435 ?auto_13437 ) ( AIRCRAFT-AT ?auto_13440 ?auto_13433 ) ( FUEL-LEVEL ?auto_13440 ?auto_13439 ) ( PERSON-AT ?auto_13436 ?auto_13433 ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13436 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13434 ?auto_13435 ?auto_13433 )
      ( FLY-3PPL-VERIFY ?auto_13434 ?auto_13435 ?auto_13436 ?auto_13433 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13458 - PERSON
      ?auto_13459 - PERSON
      ?auto_13460 - PERSON
      ?auto_13457 - CITY
    )
    :vars
    (
      ?auto_13464 - FLEVEL
      ?auto_13463 - FLEVEL
      ?auto_13461 - CITY
      ?auto_13462 - PERSON
      ?auto_13465 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13464 ?auto_13463 ) ( not ( = ?auto_13457 ?auto_13461 ) ) ( not ( = ?auto_13463 ?auto_13464 ) ) ( PERSON-AT ?auto_13462 ?auto_13457 ) ( not ( = ?auto_13462 ?auto_13460 ) ) ( PERSON-AT ?auto_13460 ?auto_13461 ) ( AIRCRAFT-AT ?auto_13465 ?auto_13457 ) ( FUEL-LEVEL ?auto_13465 ?auto_13464 ) ( PERSON-AT ?auto_13458 ?auto_13457 ) ( PERSON-AT ?auto_13459 ?auto_13457 ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( not ( = ?auto_13458 ?auto_13460 ) ) ( not ( = ?auto_13458 ?auto_13462 ) ) ( not ( = ?auto_13459 ?auto_13460 ) ) ( not ( = ?auto_13459 ?auto_13462 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13462 ?auto_13460 ?auto_13457 )
      ( FLY-3PPL-VERIFY ?auto_13458 ?auto_13459 ?auto_13460 ?auto_13457 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13471 - PERSON
      ?auto_13472 - PERSON
      ?auto_13473 - PERSON
      ?auto_13470 - CITY
    )
    :vars
    (
      ?auto_13477 - FLEVEL
      ?auto_13476 - FLEVEL
      ?auto_13474 - CITY
      ?auto_13475 - PERSON
      ?auto_13478 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13477 ?auto_13476 ) ( not ( = ?auto_13470 ?auto_13474 ) ) ( not ( = ?auto_13476 ?auto_13477 ) ) ( PERSON-AT ?auto_13475 ?auto_13470 ) ( not ( = ?auto_13475 ?auto_13472 ) ) ( PERSON-AT ?auto_13472 ?auto_13474 ) ( AIRCRAFT-AT ?auto_13478 ?auto_13470 ) ( FUEL-LEVEL ?auto_13478 ?auto_13477 ) ( PERSON-AT ?auto_13471 ?auto_13470 ) ( PERSON-AT ?auto_13473 ?auto_13470 ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13473 ) ) ( not ( = ?auto_13471 ?auto_13475 ) ) ( not ( = ?auto_13472 ?auto_13473 ) ) ( not ( = ?auto_13473 ?auto_13475 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13475 ?auto_13472 ?auto_13470 )
      ( FLY-3PPL-VERIFY ?auto_13471 ?auto_13472 ?auto_13473 ?auto_13470 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13489 - PERSON
      ?auto_13490 - PERSON
      ?auto_13491 - PERSON
      ?auto_13488 - CITY
    )
    :vars
    (
      ?auto_13494 - FLEVEL
      ?auto_13493 - FLEVEL
      ?auto_13492 - CITY
      ?auto_13495 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13494 ?auto_13493 ) ( not ( = ?auto_13488 ?auto_13492 ) ) ( not ( = ?auto_13493 ?auto_13494 ) ) ( PERSON-AT ?auto_13491 ?auto_13488 ) ( not ( = ?auto_13491 ?auto_13489 ) ) ( PERSON-AT ?auto_13489 ?auto_13492 ) ( AIRCRAFT-AT ?auto_13495 ?auto_13488 ) ( FUEL-LEVEL ?auto_13495 ?auto_13494 ) ( PERSON-AT ?auto_13490 ?auto_13488 ) ( not ( = ?auto_13489 ?auto_13490 ) ) ( not ( = ?auto_13490 ?auto_13491 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13491 ?auto_13489 ?auto_13488 )
      ( FLY-3PPL-VERIFY ?auto_13489 ?auto_13490 ?auto_13491 ?auto_13488 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13513 - PERSON
      ?auto_13514 - PERSON
      ?auto_13515 - PERSON
      ?auto_13512 - CITY
    )
    :vars
    (
      ?auto_13519 - FLEVEL
      ?auto_13518 - FLEVEL
      ?auto_13516 - CITY
      ?auto_13517 - PERSON
      ?auto_13520 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13519 ?auto_13518 ) ( not ( = ?auto_13512 ?auto_13516 ) ) ( not ( = ?auto_13518 ?auto_13519 ) ) ( PERSON-AT ?auto_13517 ?auto_13512 ) ( not ( = ?auto_13517 ?auto_13513 ) ) ( PERSON-AT ?auto_13513 ?auto_13516 ) ( AIRCRAFT-AT ?auto_13520 ?auto_13512 ) ( FUEL-LEVEL ?auto_13520 ?auto_13519 ) ( PERSON-AT ?auto_13514 ?auto_13512 ) ( PERSON-AT ?auto_13515 ?auto_13512 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13517 ) ) ( not ( = ?auto_13515 ?auto_13517 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13517 ?auto_13513 ?auto_13512 )
      ( FLY-3PPL-VERIFY ?auto_13513 ?auto_13514 ?auto_13515 ?auto_13512 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13780 - PERSON
      ?auto_13781 - PERSON
      ?auto_13782 - PERSON
      ?auto_13779 - CITY
    )
    :vars
    (
      ?auto_13784 - AIRCRAFT
      ?auto_13786 - CITY
      ?auto_13783 - FLEVEL
      ?auto_13785 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13784 ?auto_13786 ) ( FUEL-LEVEL ?auto_13784 ?auto_13783 ) ( NEXT ?auto_13785 ?auto_13783 ) ( not ( = ?auto_13779 ?auto_13786 ) ) ( not ( = ?auto_13783 ?auto_13785 ) ) ( PERSON-AT ?auto_13780 ?auto_13779 ) ( not ( = ?auto_13780 ?auto_13782 ) ) ( PERSON-AT ?auto_13782 ?auto_13786 ) ( PERSON-AT ?auto_13781 ?auto_13779 ) ( not ( = ?auto_13780 ?auto_13781 ) ) ( not ( = ?auto_13781 ?auto_13782 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13780 ?auto_13782 ?auto_13779 )
      ( FLY-3PPL-VERIFY ?auto_13780 ?auto_13781 ?auto_13782 ?auto_13779 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13796 - PERSON
      ?auto_13797 - PERSON
      ?auto_13798 - PERSON
      ?auto_13795 - CITY
    )
    :vars
    (
      ?auto_13800 - AIRCRAFT
      ?auto_13802 - CITY
      ?auto_13799 - FLEVEL
      ?auto_13801 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13800 ?auto_13802 ) ( FUEL-LEVEL ?auto_13800 ?auto_13799 ) ( NEXT ?auto_13801 ?auto_13799 ) ( not ( = ?auto_13795 ?auto_13802 ) ) ( not ( = ?auto_13799 ?auto_13801 ) ) ( PERSON-AT ?auto_13798 ?auto_13795 ) ( not ( = ?auto_13798 ?auto_13797 ) ) ( PERSON-AT ?auto_13797 ?auto_13802 ) ( PERSON-AT ?auto_13796 ?auto_13795 ) ( not ( = ?auto_13796 ?auto_13797 ) ) ( not ( = ?auto_13796 ?auto_13798 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13798 ?auto_13797 ?auto_13795 )
      ( FLY-3PPL-VERIFY ?auto_13796 ?auto_13797 ?auto_13798 ?auto_13795 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13863 - PERSON
      ?auto_13864 - PERSON
      ?auto_13865 - PERSON
      ?auto_13862 - CITY
    )
    :vars
    (
      ?auto_13867 - AIRCRAFT
      ?auto_13869 - CITY
      ?auto_13866 - FLEVEL
      ?auto_13868 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13867 ?auto_13869 ) ( FUEL-LEVEL ?auto_13867 ?auto_13866 ) ( NEXT ?auto_13868 ?auto_13866 ) ( not ( = ?auto_13862 ?auto_13869 ) ) ( not ( = ?auto_13866 ?auto_13868 ) ) ( PERSON-AT ?auto_13865 ?auto_13862 ) ( not ( = ?auto_13865 ?auto_13863 ) ) ( PERSON-AT ?auto_13863 ?auto_13869 ) ( PERSON-AT ?auto_13864 ?auto_13862 ) ( not ( = ?auto_13863 ?auto_13864 ) ) ( not ( = ?auto_13864 ?auto_13865 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13865 ?auto_13863 ?auto_13862 )
      ( FLY-3PPL-VERIFY ?auto_13863 ?auto_13864 ?auto_13865 ?auto_13862 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14162 - PERSON
      ?auto_14163 - PERSON
      ?auto_14164 - PERSON
      ?auto_14161 - CITY
    )
    :vars
    (
      ?auto_14167 - AIRCRAFT
      ?auto_14166 - CITY
      ?auto_14168 - FLEVEL
      ?auto_14165 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14167 ?auto_14166 ) ( NEXT ?auto_14168 ?auto_14165 ) ( not ( = ?auto_14161 ?auto_14166 ) ) ( not ( = ?auto_14165 ?auto_14168 ) ) ( PERSON-AT ?auto_14162 ?auto_14161 ) ( not ( = ?auto_14162 ?auto_14164 ) ) ( PERSON-AT ?auto_14164 ?auto_14166 ) ( FUEL-LEVEL ?auto_14167 ?auto_14168 ) ( PERSON-AT ?auto_14163 ?auto_14161 ) ( not ( = ?auto_14162 ?auto_14163 ) ) ( not ( = ?auto_14163 ?auto_14164 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14162 ?auto_14164 ?auto_14161 )
      ( FLY-3PPL-VERIFY ?auto_14162 ?auto_14163 ?auto_14164 ?auto_14161 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14353 - PERSON
      ?auto_14354 - PERSON
      ?auto_14355 - PERSON
      ?auto_14352 - CITY
    )
    :vars
    (
      ?auto_14357 - FLEVEL
      ?auto_14356 - FLEVEL
      ?auto_14358 - CITY
      ?auto_14359 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14357 ?auto_14356 ) ( not ( = ?auto_14352 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( PERSON-AT ?auto_14353 ?auto_14352 ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( PERSON-AT ?auto_14355 ?auto_14358 ) ( AIRCRAFT-AT ?auto_14359 ?auto_14352 ) ( FUEL-LEVEL ?auto_14359 ?auto_14356 ) ( PERSON-AT ?auto_14354 ?auto_14352 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14354 ?auto_14355 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14353 ?auto_14355 ?auto_14352 )
      ( FLY-3PPL-VERIFY ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14352 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14436 - PERSON
      ?auto_14437 - PERSON
      ?auto_14438 - PERSON
      ?auto_14435 - CITY
    )
    :vars
    (
      ?auto_14440 - FLEVEL
      ?auto_14439 - FLEVEL
      ?auto_14441 - CITY
      ?auto_14442 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14440 ?auto_14439 ) ( not ( = ?auto_14435 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( PERSON-AT ?auto_14438 ?auto_14435 ) ( not ( = ?auto_14438 ?auto_14436 ) ) ( PERSON-AT ?auto_14436 ?auto_14441 ) ( AIRCRAFT-AT ?auto_14442 ?auto_14435 ) ( FUEL-LEVEL ?auto_14442 ?auto_14439 ) ( PERSON-AT ?auto_14437 ?auto_14435 ) ( not ( = ?auto_14436 ?auto_14437 ) ) ( not ( = ?auto_14437 ?auto_14438 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14438 ?auto_14436 ?auto_14435 )
      ( FLY-3PPL-VERIFY ?auto_14436 ?auto_14437 ?auto_14438 ?auto_14435 ) )
  )

)

