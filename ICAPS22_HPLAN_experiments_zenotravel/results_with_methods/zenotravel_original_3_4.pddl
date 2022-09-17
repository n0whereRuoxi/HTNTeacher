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
      ?auto_23325 - PERSON
      ?auto_23324 - CITY
    )
    :vars
    (
      ?auto_23326 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23325 ?auto_23326 ) ( AIRCRAFT-AT ?auto_23326 ?auto_23324 ) )
    :subtasks
    ( ( !DEBARK ?auto_23325 ?auto_23326 ?auto_23324 )
      ( FLY-1PPL-VERIFY ?auto_23325 ?auto_23324 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23337 - PERSON
      ?auto_23336 - CITY
    )
    :vars
    (
      ?auto_23338 - AIRCRAFT
      ?auto_23341 - CITY
      ?auto_23339 - FLEVEL
      ?auto_23340 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23337 ?auto_23338 ) ( AIRCRAFT-AT ?auto_23338 ?auto_23341 ) ( FUEL-LEVEL ?auto_23338 ?auto_23339 ) ( NEXT ?auto_23340 ?auto_23339 ) ( not ( = ?auto_23336 ?auto_23341 ) ) ( not ( = ?auto_23339 ?auto_23340 ) ) )
    :subtasks
    ( ( !FLY ?auto_23338 ?auto_23341 ?auto_23336 ?auto_23339 ?auto_23340 )
      ( FLY-1PPL ?auto_23337 ?auto_23336 )
      ( FLY-1PPL-VERIFY ?auto_23337 ?auto_23336 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23358 - PERSON
      ?auto_23357 - CITY
    )
    :vars
    (
      ?auto_23362 - AIRCRAFT
      ?auto_23359 - CITY
      ?auto_23360 - FLEVEL
      ?auto_23361 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23362 ?auto_23359 ) ( FUEL-LEVEL ?auto_23362 ?auto_23360 ) ( NEXT ?auto_23361 ?auto_23360 ) ( not ( = ?auto_23357 ?auto_23359 ) ) ( not ( = ?auto_23360 ?auto_23361 ) ) ( PERSON-AT ?auto_23358 ?auto_23359 ) )
    :subtasks
    ( ( !BOARD ?auto_23358 ?auto_23362 ?auto_23359 )
      ( FLY-1PPL ?auto_23358 ?auto_23357 )
      ( FLY-1PPL-VERIFY ?auto_23358 ?auto_23357 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23379 - PERSON
      ?auto_23378 - CITY
    )
    :vars
    (
      ?auto_23381 - AIRCRAFT
      ?auto_23380 - CITY
      ?auto_23382 - FLEVEL
      ?auto_23383 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23381 ?auto_23380 ) ( NEXT ?auto_23382 ?auto_23383 ) ( not ( = ?auto_23378 ?auto_23380 ) ) ( not ( = ?auto_23383 ?auto_23382 ) ) ( PERSON-AT ?auto_23379 ?auto_23380 ) ( FUEL-LEVEL ?auto_23381 ?auto_23382 ) )
    :subtasks
    ( ( !REFUEL ?auto_23381 ?auto_23380 ?auto_23382 ?auto_23383 )
      ( FLY-1PPL ?auto_23379 ?auto_23378 )
      ( FLY-1PPL-VERIFY ?auto_23379 ?auto_23378 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23400 - PERSON
      ?auto_23399 - CITY
    )
    :vars
    (
      ?auto_23403 - FLEVEL
      ?auto_23404 - FLEVEL
      ?auto_23402 - CITY
      ?auto_23401 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23403 ?auto_23404 ) ( not ( = ?auto_23399 ?auto_23402 ) ) ( not ( = ?auto_23404 ?auto_23403 ) ) ( PERSON-AT ?auto_23400 ?auto_23402 ) ( AIRCRAFT-AT ?auto_23401 ?auto_23399 ) ( FUEL-LEVEL ?auto_23401 ?auto_23404 ) )
    :subtasks
    ( ( !FLY ?auto_23401 ?auto_23399 ?auto_23402 ?auto_23404 ?auto_23403 )
      ( FLY-1PPL ?auto_23400 ?auto_23399 )
      ( FLY-1PPL-VERIFY ?auto_23400 ?auto_23399 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23421 - PERSON
      ?auto_23420 - CITY
    )
    :vars
    (
      ?auto_23422 - FLEVEL
      ?auto_23425 - FLEVEL
      ?auto_23424 - CITY
      ?auto_23423 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23422 ?auto_23425 ) ( not ( = ?auto_23420 ?auto_23424 ) ) ( not ( = ?auto_23425 ?auto_23422 ) ) ( PERSON-AT ?auto_23421 ?auto_23424 ) ( AIRCRAFT-AT ?auto_23423 ?auto_23420 ) ( FUEL-LEVEL ?auto_23423 ?auto_23422 ) )
    :subtasks
    ( ( !REFUEL ?auto_23423 ?auto_23420 ?auto_23422 ?auto_23425 )
      ( FLY-1PPL ?auto_23421 ?auto_23420 )
      ( FLY-1PPL-VERIFY ?auto_23421 ?auto_23420 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23481 - PERSON
      ?auto_23480 - CITY
    )
    :vars
    (
      ?auto_23482 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23481 ?auto_23482 ) ( AIRCRAFT-AT ?auto_23482 ?auto_23480 ) )
    :subtasks
    ( ( !DEBARK ?auto_23481 ?auto_23482 ?auto_23480 )
      ( FLY-1PPL-VERIFY ?auto_23481 ?auto_23480 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23484 - PERSON
      ?auto_23485 - PERSON
      ?auto_23483 - CITY
    )
    :vars
    (
      ?auto_23486 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23485 ?auto_23486 ) ( AIRCRAFT-AT ?auto_23486 ?auto_23483 ) ( PERSON-AT ?auto_23484 ?auto_23483 ) ( not ( = ?auto_23484 ?auto_23485 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23485 ?auto_23483 )
      ( FLY-2PPL-VERIFY ?auto_23484 ?auto_23485 ?auto_23483 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23488 - PERSON
      ?auto_23489 - PERSON
      ?auto_23487 - CITY
    )
    :vars
    (
      ?auto_23490 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23488 ?auto_23490 ) ( AIRCRAFT-AT ?auto_23490 ?auto_23487 ) ( PERSON-AT ?auto_23489 ?auto_23487 ) ( not ( = ?auto_23488 ?auto_23489 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23488 ?auto_23487 )
      ( FLY-2PPL-VERIFY ?auto_23488 ?auto_23489 ?auto_23487 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23496 - PERSON
      ?auto_23497 - PERSON
      ?auto_23498 - PERSON
      ?auto_23495 - CITY
    )
    :vars
    (
      ?auto_23499 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23498 ?auto_23499 ) ( AIRCRAFT-AT ?auto_23499 ?auto_23495 ) ( PERSON-AT ?auto_23496 ?auto_23495 ) ( PERSON-AT ?auto_23497 ?auto_23495 ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23498 ) ) ( not ( = ?auto_23497 ?auto_23498 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23498 ?auto_23495 )
      ( FLY-3PPL-VERIFY ?auto_23496 ?auto_23497 ?auto_23498 ?auto_23495 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23501 - PERSON
      ?auto_23502 - PERSON
      ?auto_23503 - PERSON
      ?auto_23500 - CITY
    )
    :vars
    (
      ?auto_23504 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23502 ?auto_23504 ) ( AIRCRAFT-AT ?auto_23504 ?auto_23500 ) ( PERSON-AT ?auto_23501 ?auto_23500 ) ( PERSON-AT ?auto_23503 ?auto_23500 ) ( not ( = ?auto_23501 ?auto_23502 ) ) ( not ( = ?auto_23501 ?auto_23503 ) ) ( not ( = ?auto_23502 ?auto_23503 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23502 ?auto_23500 )
      ( FLY-3PPL-VERIFY ?auto_23501 ?auto_23502 ?auto_23503 ?auto_23500 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23511 - PERSON
      ?auto_23512 - PERSON
      ?auto_23513 - PERSON
      ?auto_23510 - CITY
    )
    :vars
    (
      ?auto_23514 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_23511 ?auto_23514 ) ( AIRCRAFT-AT ?auto_23514 ?auto_23510 ) ( PERSON-AT ?auto_23512 ?auto_23510 ) ( PERSON-AT ?auto_23513 ?auto_23510 ) ( not ( = ?auto_23511 ?auto_23512 ) ) ( not ( = ?auto_23511 ?auto_23513 ) ) ( not ( = ?auto_23512 ?auto_23513 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23511 ?auto_23510 )
      ( FLY-3PPL-VERIFY ?auto_23511 ?auto_23512 ?auto_23513 ?auto_23510 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23531 - PERSON
      ?auto_23530 - CITY
    )
    :vars
    (
      ?auto_23532 - AIRCRAFT
      ?auto_23535 - CITY
      ?auto_23533 - FLEVEL
      ?auto_23534 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23531 ?auto_23532 ) ( AIRCRAFT-AT ?auto_23532 ?auto_23535 ) ( FUEL-LEVEL ?auto_23532 ?auto_23533 ) ( NEXT ?auto_23534 ?auto_23533 ) ( not ( = ?auto_23530 ?auto_23535 ) ) ( not ( = ?auto_23533 ?auto_23534 ) ) )
    :subtasks
    ( ( !FLY ?auto_23532 ?auto_23535 ?auto_23530 ?auto_23533 ?auto_23534 )
      ( FLY-1PPL ?auto_23531 ?auto_23530 )
      ( FLY-1PPL-VERIFY ?auto_23531 ?auto_23530 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23537 - PERSON
      ?auto_23538 - PERSON
      ?auto_23536 - CITY
    )
    :vars
    (
      ?auto_23541 - AIRCRAFT
      ?auto_23539 - CITY
      ?auto_23542 - FLEVEL
      ?auto_23540 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23538 ?auto_23541 ) ( AIRCRAFT-AT ?auto_23541 ?auto_23539 ) ( FUEL-LEVEL ?auto_23541 ?auto_23542 ) ( NEXT ?auto_23540 ?auto_23542 ) ( not ( = ?auto_23536 ?auto_23539 ) ) ( not ( = ?auto_23542 ?auto_23540 ) ) ( PERSON-AT ?auto_23537 ?auto_23536 ) ( not ( = ?auto_23537 ?auto_23538 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23538 ?auto_23536 )
      ( FLY-2PPL-VERIFY ?auto_23537 ?auto_23538 ?auto_23536 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23544 - PERSON
      ?auto_23545 - PERSON
      ?auto_23543 - CITY
    )
    :vars
    (
      ?auto_23549 - AIRCRAFT
      ?auto_23548 - CITY
      ?auto_23547 - FLEVEL
      ?auto_23546 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23544 ?auto_23549 ) ( AIRCRAFT-AT ?auto_23549 ?auto_23548 ) ( FUEL-LEVEL ?auto_23549 ?auto_23547 ) ( NEXT ?auto_23546 ?auto_23547 ) ( not ( = ?auto_23543 ?auto_23548 ) ) ( not ( = ?auto_23547 ?auto_23546 ) ) ( PERSON-AT ?auto_23545 ?auto_23543 ) ( not ( = ?auto_23545 ?auto_23544 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23545 ?auto_23544 ?auto_23543 )
      ( FLY-2PPL-VERIFY ?auto_23544 ?auto_23545 ?auto_23543 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23559 - PERSON
      ?auto_23560 - PERSON
      ?auto_23561 - PERSON
      ?auto_23558 - CITY
    )
    :vars
    (
      ?auto_23565 - AIRCRAFT
      ?auto_23564 - CITY
      ?auto_23563 - FLEVEL
      ?auto_23562 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23561 ?auto_23565 ) ( AIRCRAFT-AT ?auto_23565 ?auto_23564 ) ( FUEL-LEVEL ?auto_23565 ?auto_23563 ) ( NEXT ?auto_23562 ?auto_23563 ) ( not ( = ?auto_23558 ?auto_23564 ) ) ( not ( = ?auto_23563 ?auto_23562 ) ) ( PERSON-AT ?auto_23560 ?auto_23558 ) ( not ( = ?auto_23560 ?auto_23561 ) ) ( PERSON-AT ?auto_23559 ?auto_23558 ) ( not ( = ?auto_23559 ?auto_23560 ) ) ( not ( = ?auto_23559 ?auto_23561 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23560 ?auto_23561 ?auto_23558 )
      ( FLY-3PPL-VERIFY ?auto_23559 ?auto_23560 ?auto_23561 ?auto_23558 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23567 - PERSON
      ?auto_23568 - PERSON
      ?auto_23569 - PERSON
      ?auto_23566 - CITY
    )
    :vars
    (
      ?auto_23573 - AIRCRAFT
      ?auto_23572 - CITY
      ?auto_23571 - FLEVEL
      ?auto_23570 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23568 ?auto_23573 ) ( AIRCRAFT-AT ?auto_23573 ?auto_23572 ) ( FUEL-LEVEL ?auto_23573 ?auto_23571 ) ( NEXT ?auto_23570 ?auto_23571 ) ( not ( = ?auto_23566 ?auto_23572 ) ) ( not ( = ?auto_23571 ?auto_23570 ) ) ( PERSON-AT ?auto_23569 ?auto_23566 ) ( not ( = ?auto_23569 ?auto_23568 ) ) ( PERSON-AT ?auto_23567 ?auto_23566 ) ( not ( = ?auto_23567 ?auto_23568 ) ) ( not ( = ?auto_23567 ?auto_23569 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23569 ?auto_23568 ?auto_23566 )
      ( FLY-3PPL-VERIFY ?auto_23567 ?auto_23568 ?auto_23569 ?auto_23566 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23583 - PERSON
      ?auto_23584 - PERSON
      ?auto_23585 - PERSON
      ?auto_23582 - CITY
    )
    :vars
    (
      ?auto_23589 - AIRCRAFT
      ?auto_23588 - CITY
      ?auto_23587 - FLEVEL
      ?auto_23586 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_23583 ?auto_23589 ) ( AIRCRAFT-AT ?auto_23589 ?auto_23588 ) ( FUEL-LEVEL ?auto_23589 ?auto_23587 ) ( NEXT ?auto_23586 ?auto_23587 ) ( not ( = ?auto_23582 ?auto_23588 ) ) ( not ( = ?auto_23587 ?auto_23586 ) ) ( PERSON-AT ?auto_23585 ?auto_23582 ) ( not ( = ?auto_23585 ?auto_23583 ) ) ( PERSON-AT ?auto_23584 ?auto_23582 ) ( not ( = ?auto_23583 ?auto_23584 ) ) ( not ( = ?auto_23584 ?auto_23585 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23585 ?auto_23583 ?auto_23582 )
      ( FLY-3PPL-VERIFY ?auto_23583 ?auto_23584 ?auto_23585 ?auto_23582 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23616 - PERSON
      ?auto_23615 - CITY
    )
    :vars
    (
      ?auto_23621 - AIRCRAFT
      ?auto_23620 - CITY
      ?auto_23618 - FLEVEL
      ?auto_23617 - FLEVEL
      ?auto_23619 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23621 ?auto_23620 ) ( FUEL-LEVEL ?auto_23621 ?auto_23618 ) ( NEXT ?auto_23617 ?auto_23618 ) ( not ( = ?auto_23615 ?auto_23620 ) ) ( not ( = ?auto_23618 ?auto_23617 ) ) ( PERSON-AT ?auto_23619 ?auto_23615 ) ( not ( = ?auto_23619 ?auto_23616 ) ) ( PERSON-AT ?auto_23616 ?auto_23620 ) )
    :subtasks
    ( ( !BOARD ?auto_23616 ?auto_23621 ?auto_23620 )
      ( FLY-2PPL ?auto_23619 ?auto_23616 ?auto_23615 )
      ( FLY-1PPL-VERIFY ?auto_23616 ?auto_23615 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23623 - PERSON
      ?auto_23624 - PERSON
      ?auto_23622 - CITY
    )
    :vars
    (
      ?auto_23627 - AIRCRAFT
      ?auto_23625 - CITY
      ?auto_23628 - FLEVEL
      ?auto_23626 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23627 ?auto_23625 ) ( FUEL-LEVEL ?auto_23627 ?auto_23628 ) ( NEXT ?auto_23626 ?auto_23628 ) ( not ( = ?auto_23622 ?auto_23625 ) ) ( not ( = ?auto_23628 ?auto_23626 ) ) ( PERSON-AT ?auto_23623 ?auto_23622 ) ( not ( = ?auto_23623 ?auto_23624 ) ) ( PERSON-AT ?auto_23624 ?auto_23625 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23624 ?auto_23622 )
      ( FLY-2PPL-VERIFY ?auto_23623 ?auto_23624 ?auto_23622 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23630 - PERSON
      ?auto_23631 - PERSON
      ?auto_23629 - CITY
    )
    :vars
    (
      ?auto_23632 - AIRCRAFT
      ?auto_23633 - CITY
      ?auto_23634 - FLEVEL
      ?auto_23635 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23632 ?auto_23633 ) ( FUEL-LEVEL ?auto_23632 ?auto_23634 ) ( NEXT ?auto_23635 ?auto_23634 ) ( not ( = ?auto_23629 ?auto_23633 ) ) ( not ( = ?auto_23634 ?auto_23635 ) ) ( PERSON-AT ?auto_23631 ?auto_23629 ) ( not ( = ?auto_23631 ?auto_23630 ) ) ( PERSON-AT ?auto_23630 ?auto_23633 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23631 ?auto_23630 ?auto_23629 )
      ( FLY-2PPL-VERIFY ?auto_23630 ?auto_23631 ?auto_23629 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23645 - PERSON
      ?auto_23646 - PERSON
      ?auto_23647 - PERSON
      ?auto_23644 - CITY
    )
    :vars
    (
      ?auto_23648 - AIRCRAFT
      ?auto_23649 - CITY
      ?auto_23650 - FLEVEL
      ?auto_23651 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23648 ?auto_23649 ) ( FUEL-LEVEL ?auto_23648 ?auto_23650 ) ( NEXT ?auto_23651 ?auto_23650 ) ( not ( = ?auto_23644 ?auto_23649 ) ) ( not ( = ?auto_23650 ?auto_23651 ) ) ( PERSON-AT ?auto_23645 ?auto_23644 ) ( not ( = ?auto_23645 ?auto_23647 ) ) ( PERSON-AT ?auto_23647 ?auto_23649 ) ( PERSON-AT ?auto_23646 ?auto_23644 ) ( not ( = ?auto_23645 ?auto_23646 ) ) ( not ( = ?auto_23646 ?auto_23647 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23645 ?auto_23647 ?auto_23644 )
      ( FLY-3PPL-VERIFY ?auto_23645 ?auto_23646 ?auto_23647 ?auto_23644 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23653 - PERSON
      ?auto_23654 - PERSON
      ?auto_23655 - PERSON
      ?auto_23652 - CITY
    )
    :vars
    (
      ?auto_23656 - AIRCRAFT
      ?auto_23657 - CITY
      ?auto_23658 - FLEVEL
      ?auto_23659 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23656 ?auto_23657 ) ( FUEL-LEVEL ?auto_23656 ?auto_23658 ) ( NEXT ?auto_23659 ?auto_23658 ) ( not ( = ?auto_23652 ?auto_23657 ) ) ( not ( = ?auto_23658 ?auto_23659 ) ) ( PERSON-AT ?auto_23655 ?auto_23652 ) ( not ( = ?auto_23655 ?auto_23654 ) ) ( PERSON-AT ?auto_23654 ?auto_23657 ) ( PERSON-AT ?auto_23653 ?auto_23652 ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23655 ?auto_23654 ?auto_23652 )
      ( FLY-3PPL-VERIFY ?auto_23653 ?auto_23654 ?auto_23655 ?auto_23652 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23669 - PERSON
      ?auto_23670 - PERSON
      ?auto_23671 - PERSON
      ?auto_23668 - CITY
    )
    :vars
    (
      ?auto_23672 - AIRCRAFT
      ?auto_23673 - CITY
      ?auto_23674 - FLEVEL
      ?auto_23675 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23672 ?auto_23673 ) ( FUEL-LEVEL ?auto_23672 ?auto_23674 ) ( NEXT ?auto_23675 ?auto_23674 ) ( not ( = ?auto_23668 ?auto_23673 ) ) ( not ( = ?auto_23674 ?auto_23675 ) ) ( PERSON-AT ?auto_23671 ?auto_23668 ) ( not ( = ?auto_23671 ?auto_23669 ) ) ( PERSON-AT ?auto_23669 ?auto_23673 ) ( PERSON-AT ?auto_23670 ?auto_23668 ) ( not ( = ?auto_23669 ?auto_23670 ) ) ( not ( = ?auto_23670 ?auto_23671 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23671 ?auto_23669 ?auto_23668 )
      ( FLY-3PPL-VERIFY ?auto_23669 ?auto_23670 ?auto_23671 ?auto_23668 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23702 - PERSON
      ?auto_23701 - CITY
    )
    :vars
    (
      ?auto_23703 - AIRCRAFT
      ?auto_23704 - CITY
      ?auto_23706 - FLEVEL
      ?auto_23705 - FLEVEL
      ?auto_23707 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23703 ?auto_23704 ) ( NEXT ?auto_23706 ?auto_23705 ) ( not ( = ?auto_23701 ?auto_23704 ) ) ( not ( = ?auto_23705 ?auto_23706 ) ) ( PERSON-AT ?auto_23707 ?auto_23701 ) ( not ( = ?auto_23707 ?auto_23702 ) ) ( PERSON-AT ?auto_23702 ?auto_23704 ) ( FUEL-LEVEL ?auto_23703 ?auto_23706 ) )
    :subtasks
    ( ( !REFUEL ?auto_23703 ?auto_23704 ?auto_23706 ?auto_23705 )
      ( FLY-2PPL ?auto_23707 ?auto_23702 ?auto_23701 )
      ( FLY-1PPL-VERIFY ?auto_23702 ?auto_23701 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23709 - PERSON
      ?auto_23710 - PERSON
      ?auto_23708 - CITY
    )
    :vars
    (
      ?auto_23711 - AIRCRAFT
      ?auto_23714 - CITY
      ?auto_23712 - FLEVEL
      ?auto_23713 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23711 ?auto_23714 ) ( NEXT ?auto_23712 ?auto_23713 ) ( not ( = ?auto_23708 ?auto_23714 ) ) ( not ( = ?auto_23713 ?auto_23712 ) ) ( PERSON-AT ?auto_23709 ?auto_23708 ) ( not ( = ?auto_23709 ?auto_23710 ) ) ( PERSON-AT ?auto_23710 ?auto_23714 ) ( FUEL-LEVEL ?auto_23711 ?auto_23712 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23710 ?auto_23708 )
      ( FLY-2PPL-VERIFY ?auto_23709 ?auto_23710 ?auto_23708 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23716 - PERSON
      ?auto_23717 - PERSON
      ?auto_23715 - CITY
    )
    :vars
    (
      ?auto_23721 - AIRCRAFT
      ?auto_23720 - CITY
      ?auto_23718 - FLEVEL
      ?auto_23719 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23721 ?auto_23720 ) ( NEXT ?auto_23718 ?auto_23719 ) ( not ( = ?auto_23715 ?auto_23720 ) ) ( not ( = ?auto_23719 ?auto_23718 ) ) ( PERSON-AT ?auto_23717 ?auto_23715 ) ( not ( = ?auto_23717 ?auto_23716 ) ) ( PERSON-AT ?auto_23716 ?auto_23720 ) ( FUEL-LEVEL ?auto_23721 ?auto_23718 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23717 ?auto_23716 ?auto_23715 )
      ( FLY-2PPL-VERIFY ?auto_23716 ?auto_23717 ?auto_23715 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23731 - PERSON
      ?auto_23732 - PERSON
      ?auto_23733 - PERSON
      ?auto_23730 - CITY
    )
    :vars
    (
      ?auto_23737 - AIRCRAFT
      ?auto_23736 - CITY
      ?auto_23734 - FLEVEL
      ?auto_23735 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23737 ?auto_23736 ) ( NEXT ?auto_23734 ?auto_23735 ) ( not ( = ?auto_23730 ?auto_23736 ) ) ( not ( = ?auto_23735 ?auto_23734 ) ) ( PERSON-AT ?auto_23732 ?auto_23730 ) ( not ( = ?auto_23732 ?auto_23733 ) ) ( PERSON-AT ?auto_23733 ?auto_23736 ) ( FUEL-LEVEL ?auto_23737 ?auto_23734 ) ( PERSON-AT ?auto_23731 ?auto_23730 ) ( not ( = ?auto_23731 ?auto_23732 ) ) ( not ( = ?auto_23731 ?auto_23733 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23732 ?auto_23733 ?auto_23730 )
      ( FLY-3PPL-VERIFY ?auto_23731 ?auto_23732 ?auto_23733 ?auto_23730 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23739 - PERSON
      ?auto_23740 - PERSON
      ?auto_23741 - PERSON
      ?auto_23738 - CITY
    )
    :vars
    (
      ?auto_23745 - AIRCRAFT
      ?auto_23744 - CITY
      ?auto_23742 - FLEVEL
      ?auto_23743 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23745 ?auto_23744 ) ( NEXT ?auto_23742 ?auto_23743 ) ( not ( = ?auto_23738 ?auto_23744 ) ) ( not ( = ?auto_23743 ?auto_23742 ) ) ( PERSON-AT ?auto_23739 ?auto_23738 ) ( not ( = ?auto_23739 ?auto_23740 ) ) ( PERSON-AT ?auto_23740 ?auto_23744 ) ( FUEL-LEVEL ?auto_23745 ?auto_23742 ) ( PERSON-AT ?auto_23741 ?auto_23738 ) ( not ( = ?auto_23739 ?auto_23741 ) ) ( not ( = ?auto_23740 ?auto_23741 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23739 ?auto_23740 ?auto_23738 )
      ( FLY-3PPL-VERIFY ?auto_23739 ?auto_23740 ?auto_23741 ?auto_23738 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23755 - PERSON
      ?auto_23756 - PERSON
      ?auto_23757 - PERSON
      ?auto_23754 - CITY
    )
    :vars
    (
      ?auto_23761 - AIRCRAFT
      ?auto_23760 - CITY
      ?auto_23758 - FLEVEL
      ?auto_23759 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23761 ?auto_23760 ) ( NEXT ?auto_23758 ?auto_23759 ) ( not ( = ?auto_23754 ?auto_23760 ) ) ( not ( = ?auto_23759 ?auto_23758 ) ) ( PERSON-AT ?auto_23756 ?auto_23754 ) ( not ( = ?auto_23756 ?auto_23755 ) ) ( PERSON-AT ?auto_23755 ?auto_23760 ) ( FUEL-LEVEL ?auto_23761 ?auto_23758 ) ( PERSON-AT ?auto_23757 ?auto_23754 ) ( not ( = ?auto_23755 ?auto_23757 ) ) ( not ( = ?auto_23756 ?auto_23757 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23756 ?auto_23755 ?auto_23754 )
      ( FLY-3PPL-VERIFY ?auto_23755 ?auto_23756 ?auto_23757 ?auto_23754 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23788 - PERSON
      ?auto_23787 - CITY
    )
    :vars
    (
      ?auto_23789 - FLEVEL
      ?auto_23790 - FLEVEL
      ?auto_23792 - CITY
      ?auto_23791 - PERSON
      ?auto_23793 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23789 ?auto_23790 ) ( not ( = ?auto_23787 ?auto_23792 ) ) ( not ( = ?auto_23790 ?auto_23789 ) ) ( PERSON-AT ?auto_23791 ?auto_23787 ) ( not ( = ?auto_23791 ?auto_23788 ) ) ( PERSON-AT ?auto_23788 ?auto_23792 ) ( AIRCRAFT-AT ?auto_23793 ?auto_23787 ) ( FUEL-LEVEL ?auto_23793 ?auto_23790 ) )
    :subtasks
    ( ( !FLY ?auto_23793 ?auto_23787 ?auto_23792 ?auto_23790 ?auto_23789 )
      ( FLY-2PPL ?auto_23791 ?auto_23788 ?auto_23787 )
      ( FLY-1PPL-VERIFY ?auto_23788 ?auto_23787 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23795 - PERSON
      ?auto_23796 - PERSON
      ?auto_23794 - CITY
    )
    :vars
    (
      ?auto_23799 - FLEVEL
      ?auto_23798 - FLEVEL
      ?auto_23800 - CITY
      ?auto_23797 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23799 ?auto_23798 ) ( not ( = ?auto_23794 ?auto_23800 ) ) ( not ( = ?auto_23798 ?auto_23799 ) ) ( PERSON-AT ?auto_23795 ?auto_23794 ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( PERSON-AT ?auto_23796 ?auto_23800 ) ( AIRCRAFT-AT ?auto_23797 ?auto_23794 ) ( FUEL-LEVEL ?auto_23797 ?auto_23798 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23796 ?auto_23794 )
      ( FLY-2PPL-VERIFY ?auto_23795 ?auto_23796 ?auto_23794 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23802 - PERSON
      ?auto_23803 - PERSON
      ?auto_23801 - CITY
    )
    :vars
    (
      ?auto_23807 - FLEVEL
      ?auto_23804 - FLEVEL
      ?auto_23805 - CITY
      ?auto_23806 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23807 ?auto_23804 ) ( not ( = ?auto_23801 ?auto_23805 ) ) ( not ( = ?auto_23804 ?auto_23807 ) ) ( PERSON-AT ?auto_23803 ?auto_23801 ) ( not ( = ?auto_23803 ?auto_23802 ) ) ( PERSON-AT ?auto_23802 ?auto_23805 ) ( AIRCRAFT-AT ?auto_23806 ?auto_23801 ) ( FUEL-LEVEL ?auto_23806 ?auto_23804 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23803 ?auto_23802 ?auto_23801 )
      ( FLY-2PPL-VERIFY ?auto_23802 ?auto_23803 ?auto_23801 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23817 - PERSON
      ?auto_23818 - PERSON
      ?auto_23819 - PERSON
      ?auto_23816 - CITY
    )
    :vars
    (
      ?auto_23823 - FLEVEL
      ?auto_23820 - FLEVEL
      ?auto_23821 - CITY
      ?auto_23822 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23823 ?auto_23820 ) ( not ( = ?auto_23816 ?auto_23821 ) ) ( not ( = ?auto_23820 ?auto_23823 ) ) ( PERSON-AT ?auto_23818 ?auto_23816 ) ( not ( = ?auto_23818 ?auto_23819 ) ) ( PERSON-AT ?auto_23819 ?auto_23821 ) ( AIRCRAFT-AT ?auto_23822 ?auto_23816 ) ( FUEL-LEVEL ?auto_23822 ?auto_23820 ) ( PERSON-AT ?auto_23817 ?auto_23816 ) ( not ( = ?auto_23817 ?auto_23818 ) ) ( not ( = ?auto_23817 ?auto_23819 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23818 ?auto_23819 ?auto_23816 )
      ( FLY-3PPL-VERIFY ?auto_23817 ?auto_23818 ?auto_23819 ?auto_23816 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23825 - PERSON
      ?auto_23826 - PERSON
      ?auto_23827 - PERSON
      ?auto_23824 - CITY
    )
    :vars
    (
      ?auto_23831 - FLEVEL
      ?auto_23828 - FLEVEL
      ?auto_23829 - CITY
      ?auto_23830 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23831 ?auto_23828 ) ( not ( = ?auto_23824 ?auto_23829 ) ) ( not ( = ?auto_23828 ?auto_23831 ) ) ( PERSON-AT ?auto_23827 ?auto_23824 ) ( not ( = ?auto_23827 ?auto_23826 ) ) ( PERSON-AT ?auto_23826 ?auto_23829 ) ( AIRCRAFT-AT ?auto_23830 ?auto_23824 ) ( FUEL-LEVEL ?auto_23830 ?auto_23828 ) ( PERSON-AT ?auto_23825 ?auto_23824 ) ( not ( = ?auto_23825 ?auto_23826 ) ) ( not ( = ?auto_23825 ?auto_23827 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23827 ?auto_23826 ?auto_23824 )
      ( FLY-3PPL-VERIFY ?auto_23825 ?auto_23826 ?auto_23827 ?auto_23824 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23841 - PERSON
      ?auto_23842 - PERSON
      ?auto_23843 - PERSON
      ?auto_23840 - CITY
    )
    :vars
    (
      ?auto_23847 - FLEVEL
      ?auto_23844 - FLEVEL
      ?auto_23845 - CITY
      ?auto_23846 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23847 ?auto_23844 ) ( not ( = ?auto_23840 ?auto_23845 ) ) ( not ( = ?auto_23844 ?auto_23847 ) ) ( PERSON-AT ?auto_23842 ?auto_23840 ) ( not ( = ?auto_23842 ?auto_23841 ) ) ( PERSON-AT ?auto_23841 ?auto_23845 ) ( AIRCRAFT-AT ?auto_23846 ?auto_23840 ) ( FUEL-LEVEL ?auto_23846 ?auto_23844 ) ( PERSON-AT ?auto_23843 ?auto_23840 ) ( not ( = ?auto_23841 ?auto_23843 ) ) ( not ( = ?auto_23842 ?auto_23843 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23842 ?auto_23841 ?auto_23840 )
      ( FLY-3PPL-VERIFY ?auto_23841 ?auto_23842 ?auto_23843 ?auto_23840 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23874 - PERSON
      ?auto_23873 - CITY
    )
    :vars
    (
      ?auto_23878 - FLEVEL
      ?auto_23875 - FLEVEL
      ?auto_23876 - CITY
      ?auto_23879 - PERSON
      ?auto_23877 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23878 ?auto_23875 ) ( not ( = ?auto_23873 ?auto_23876 ) ) ( not ( = ?auto_23875 ?auto_23878 ) ) ( PERSON-AT ?auto_23879 ?auto_23873 ) ( not ( = ?auto_23879 ?auto_23874 ) ) ( PERSON-AT ?auto_23874 ?auto_23876 ) ( AIRCRAFT-AT ?auto_23877 ?auto_23873 ) ( FUEL-LEVEL ?auto_23877 ?auto_23878 ) )
    :subtasks
    ( ( !REFUEL ?auto_23877 ?auto_23873 ?auto_23878 ?auto_23875 )
      ( FLY-2PPL ?auto_23879 ?auto_23874 ?auto_23873 )
      ( FLY-1PPL-VERIFY ?auto_23874 ?auto_23873 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23881 - PERSON
      ?auto_23882 - PERSON
      ?auto_23880 - CITY
    )
    :vars
    (
      ?auto_23883 - FLEVEL
      ?auto_23884 - FLEVEL
      ?auto_23885 - CITY
      ?auto_23886 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23883 ?auto_23884 ) ( not ( = ?auto_23880 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23883 ) ) ( PERSON-AT ?auto_23881 ?auto_23880 ) ( not ( = ?auto_23881 ?auto_23882 ) ) ( PERSON-AT ?auto_23882 ?auto_23885 ) ( AIRCRAFT-AT ?auto_23886 ?auto_23880 ) ( FUEL-LEVEL ?auto_23886 ?auto_23883 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23882 ?auto_23880 )
      ( FLY-2PPL-VERIFY ?auto_23881 ?auto_23882 ?auto_23880 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23888 - PERSON
      ?auto_23889 - PERSON
      ?auto_23887 - CITY
    )
    :vars
    (
      ?auto_23892 - FLEVEL
      ?auto_23891 - FLEVEL
      ?auto_23893 - CITY
      ?auto_23890 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23892 ?auto_23891 ) ( not ( = ?auto_23887 ?auto_23893 ) ) ( not ( = ?auto_23891 ?auto_23892 ) ) ( PERSON-AT ?auto_23889 ?auto_23887 ) ( not ( = ?auto_23889 ?auto_23888 ) ) ( PERSON-AT ?auto_23888 ?auto_23893 ) ( AIRCRAFT-AT ?auto_23890 ?auto_23887 ) ( FUEL-LEVEL ?auto_23890 ?auto_23892 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23889 ?auto_23888 ?auto_23887 )
      ( FLY-2PPL-VERIFY ?auto_23888 ?auto_23889 ?auto_23887 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23903 - PERSON
      ?auto_23904 - PERSON
      ?auto_23905 - PERSON
      ?auto_23902 - CITY
    )
    :vars
    (
      ?auto_23908 - FLEVEL
      ?auto_23907 - FLEVEL
      ?auto_23909 - CITY
      ?auto_23906 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23908 ?auto_23907 ) ( not ( = ?auto_23902 ?auto_23909 ) ) ( not ( = ?auto_23907 ?auto_23908 ) ) ( PERSON-AT ?auto_23904 ?auto_23902 ) ( not ( = ?auto_23904 ?auto_23905 ) ) ( PERSON-AT ?auto_23905 ?auto_23909 ) ( AIRCRAFT-AT ?auto_23906 ?auto_23902 ) ( FUEL-LEVEL ?auto_23906 ?auto_23908 ) ( PERSON-AT ?auto_23903 ?auto_23902 ) ( not ( = ?auto_23903 ?auto_23904 ) ) ( not ( = ?auto_23903 ?auto_23905 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23904 ?auto_23905 ?auto_23902 )
      ( FLY-3PPL-VERIFY ?auto_23903 ?auto_23904 ?auto_23905 ?auto_23902 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23911 - PERSON
      ?auto_23912 - PERSON
      ?auto_23913 - PERSON
      ?auto_23910 - CITY
    )
    :vars
    (
      ?auto_23916 - FLEVEL
      ?auto_23915 - FLEVEL
      ?auto_23917 - CITY
      ?auto_23914 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23916 ?auto_23915 ) ( not ( = ?auto_23910 ?auto_23917 ) ) ( not ( = ?auto_23915 ?auto_23916 ) ) ( PERSON-AT ?auto_23913 ?auto_23910 ) ( not ( = ?auto_23913 ?auto_23912 ) ) ( PERSON-AT ?auto_23912 ?auto_23917 ) ( AIRCRAFT-AT ?auto_23914 ?auto_23910 ) ( FUEL-LEVEL ?auto_23914 ?auto_23916 ) ( PERSON-AT ?auto_23911 ?auto_23910 ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23913 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23913 ?auto_23912 ?auto_23910 )
      ( FLY-3PPL-VERIFY ?auto_23911 ?auto_23912 ?auto_23913 ?auto_23910 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23927 - PERSON
      ?auto_23928 - PERSON
      ?auto_23929 - PERSON
      ?auto_23926 - CITY
    )
    :vars
    (
      ?auto_23932 - FLEVEL
      ?auto_23931 - FLEVEL
      ?auto_23933 - CITY
      ?auto_23930 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23932 ?auto_23931 ) ( not ( = ?auto_23926 ?auto_23933 ) ) ( not ( = ?auto_23931 ?auto_23932 ) ) ( PERSON-AT ?auto_23929 ?auto_23926 ) ( not ( = ?auto_23929 ?auto_23927 ) ) ( PERSON-AT ?auto_23927 ?auto_23933 ) ( AIRCRAFT-AT ?auto_23930 ?auto_23926 ) ( FUEL-LEVEL ?auto_23930 ?auto_23932 ) ( PERSON-AT ?auto_23928 ?auto_23926 ) ( not ( = ?auto_23927 ?auto_23928 ) ) ( not ( = ?auto_23928 ?auto_23929 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23929 ?auto_23927 ?auto_23926 )
      ( FLY-3PPL-VERIFY ?auto_23927 ?auto_23928 ?auto_23929 ?auto_23926 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23960 - PERSON
      ?auto_23959 - CITY
    )
    :vars
    (
      ?auto_23963 - FLEVEL
      ?auto_23962 - FLEVEL
      ?auto_23964 - CITY
      ?auto_23965 - PERSON
      ?auto_23961 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23963 ?auto_23962 ) ( not ( = ?auto_23959 ?auto_23964 ) ) ( not ( = ?auto_23962 ?auto_23963 ) ) ( not ( = ?auto_23965 ?auto_23960 ) ) ( PERSON-AT ?auto_23960 ?auto_23964 ) ( AIRCRAFT-AT ?auto_23961 ?auto_23959 ) ( FUEL-LEVEL ?auto_23961 ?auto_23963 ) ( IN ?auto_23965 ?auto_23961 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23965 ?auto_23959 )
      ( FLY-2PPL ?auto_23965 ?auto_23960 ?auto_23959 )
      ( FLY-1PPL-VERIFY ?auto_23960 ?auto_23959 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23967 - PERSON
      ?auto_23968 - PERSON
      ?auto_23966 - CITY
    )
    :vars
    (
      ?auto_23972 - FLEVEL
      ?auto_23969 - FLEVEL
      ?auto_23971 - CITY
      ?auto_23970 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23972 ?auto_23969 ) ( not ( = ?auto_23966 ?auto_23971 ) ) ( not ( = ?auto_23969 ?auto_23972 ) ) ( not ( = ?auto_23967 ?auto_23968 ) ) ( PERSON-AT ?auto_23968 ?auto_23971 ) ( AIRCRAFT-AT ?auto_23970 ?auto_23966 ) ( FUEL-LEVEL ?auto_23970 ?auto_23972 ) ( IN ?auto_23967 ?auto_23970 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23968 ?auto_23966 )
      ( FLY-2PPL-VERIFY ?auto_23967 ?auto_23968 ?auto_23966 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23974 - PERSON
      ?auto_23975 - PERSON
      ?auto_23973 - CITY
    )
    :vars
    (
      ?auto_23977 - FLEVEL
      ?auto_23979 - FLEVEL
      ?auto_23976 - CITY
      ?auto_23978 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23977 ?auto_23979 ) ( not ( = ?auto_23973 ?auto_23976 ) ) ( not ( = ?auto_23979 ?auto_23977 ) ) ( not ( = ?auto_23975 ?auto_23974 ) ) ( PERSON-AT ?auto_23974 ?auto_23976 ) ( AIRCRAFT-AT ?auto_23978 ?auto_23973 ) ( FUEL-LEVEL ?auto_23978 ?auto_23977 ) ( IN ?auto_23975 ?auto_23978 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23975 ?auto_23974 ?auto_23973 )
      ( FLY-2PPL-VERIFY ?auto_23974 ?auto_23975 ?auto_23973 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24046 - PERSON
      ?auto_24045 - CITY
    )
    :vars
    (
      ?auto_24049 - FLEVEL
      ?auto_24051 - FLEVEL
      ?auto_24047 - CITY
      ?auto_24048 - PERSON
      ?auto_24050 - AIRCRAFT
      ?auto_24052 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24049 ?auto_24051 ) ( not ( = ?auto_24045 ?auto_24047 ) ) ( not ( = ?auto_24051 ?auto_24049 ) ) ( not ( = ?auto_24048 ?auto_24046 ) ) ( PERSON-AT ?auto_24046 ?auto_24047 ) ( IN ?auto_24048 ?auto_24050 ) ( AIRCRAFT-AT ?auto_24050 ?auto_24052 ) ( FUEL-LEVEL ?auto_24050 ?auto_24051 ) ( not ( = ?auto_24045 ?auto_24052 ) ) ( not ( = ?auto_24047 ?auto_24052 ) ) )
    :subtasks
    ( ( !FLY ?auto_24050 ?auto_24052 ?auto_24045 ?auto_24051 ?auto_24049 )
      ( FLY-2PPL ?auto_24048 ?auto_24046 ?auto_24045 )
      ( FLY-1PPL-VERIFY ?auto_24046 ?auto_24045 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24054 - PERSON
      ?auto_24055 - PERSON
      ?auto_24053 - CITY
    )
    :vars
    (
      ?auto_24058 - FLEVEL
      ?auto_24060 - FLEVEL
      ?auto_24056 - CITY
      ?auto_24057 - AIRCRAFT
      ?auto_24059 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24058 ?auto_24060 ) ( not ( = ?auto_24053 ?auto_24056 ) ) ( not ( = ?auto_24060 ?auto_24058 ) ) ( not ( = ?auto_24054 ?auto_24055 ) ) ( PERSON-AT ?auto_24055 ?auto_24056 ) ( IN ?auto_24054 ?auto_24057 ) ( AIRCRAFT-AT ?auto_24057 ?auto_24059 ) ( FUEL-LEVEL ?auto_24057 ?auto_24060 ) ( not ( = ?auto_24053 ?auto_24059 ) ) ( not ( = ?auto_24056 ?auto_24059 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24055 ?auto_24053 )
      ( FLY-2PPL-VERIFY ?auto_24054 ?auto_24055 ?auto_24053 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24062 - PERSON
      ?auto_24063 - PERSON
      ?auto_24061 - CITY
    )
    :vars
    (
      ?auto_24064 - FLEVEL
      ?auto_24068 - FLEVEL
      ?auto_24066 - CITY
      ?auto_24067 - AIRCRAFT
      ?auto_24065 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24064 ?auto_24068 ) ( not ( = ?auto_24061 ?auto_24066 ) ) ( not ( = ?auto_24068 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24062 ) ) ( PERSON-AT ?auto_24062 ?auto_24066 ) ( IN ?auto_24063 ?auto_24067 ) ( AIRCRAFT-AT ?auto_24067 ?auto_24065 ) ( FUEL-LEVEL ?auto_24067 ?auto_24068 ) ( not ( = ?auto_24061 ?auto_24065 ) ) ( not ( = ?auto_24066 ?auto_24065 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24063 ?auto_24062 ?auto_24061 )
      ( FLY-2PPL-VERIFY ?auto_24062 ?auto_24063 ?auto_24061 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24143 - PERSON
      ?auto_24142 - CITY
    )
    :vars
    (
      ?auto_24144 - FLEVEL
      ?auto_24148 - FLEVEL
      ?auto_24146 - CITY
      ?auto_24149 - PERSON
      ?auto_24147 - AIRCRAFT
      ?auto_24145 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24144 ?auto_24148 ) ( not ( = ?auto_24142 ?auto_24146 ) ) ( not ( = ?auto_24148 ?auto_24144 ) ) ( not ( = ?auto_24149 ?auto_24143 ) ) ( PERSON-AT ?auto_24143 ?auto_24146 ) ( AIRCRAFT-AT ?auto_24147 ?auto_24145 ) ( FUEL-LEVEL ?auto_24147 ?auto_24148 ) ( not ( = ?auto_24142 ?auto_24145 ) ) ( not ( = ?auto_24146 ?auto_24145 ) ) ( PERSON-AT ?auto_24149 ?auto_24145 ) )
    :subtasks
    ( ( !BOARD ?auto_24149 ?auto_24147 ?auto_24145 )
      ( FLY-2PPL ?auto_24149 ?auto_24143 ?auto_24142 )
      ( FLY-1PPL-VERIFY ?auto_24143 ?auto_24142 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24151 - PERSON
      ?auto_24152 - PERSON
      ?auto_24150 - CITY
    )
    :vars
    (
      ?auto_24153 - FLEVEL
      ?auto_24157 - FLEVEL
      ?auto_24156 - CITY
      ?auto_24154 - AIRCRAFT
      ?auto_24155 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24153 ?auto_24157 ) ( not ( = ?auto_24150 ?auto_24156 ) ) ( not ( = ?auto_24157 ?auto_24153 ) ) ( not ( = ?auto_24151 ?auto_24152 ) ) ( PERSON-AT ?auto_24152 ?auto_24156 ) ( AIRCRAFT-AT ?auto_24154 ?auto_24155 ) ( FUEL-LEVEL ?auto_24154 ?auto_24157 ) ( not ( = ?auto_24150 ?auto_24155 ) ) ( not ( = ?auto_24156 ?auto_24155 ) ) ( PERSON-AT ?auto_24151 ?auto_24155 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24152 ?auto_24150 )
      ( FLY-2PPL-VERIFY ?auto_24151 ?auto_24152 ?auto_24150 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24159 - PERSON
      ?auto_24160 - PERSON
      ?auto_24158 - CITY
    )
    :vars
    (
      ?auto_24162 - FLEVEL
      ?auto_24163 - FLEVEL
      ?auto_24165 - CITY
      ?auto_24161 - AIRCRAFT
      ?auto_24164 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24162 ?auto_24163 ) ( not ( = ?auto_24158 ?auto_24165 ) ) ( not ( = ?auto_24163 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24159 ) ) ( PERSON-AT ?auto_24159 ?auto_24165 ) ( AIRCRAFT-AT ?auto_24161 ?auto_24164 ) ( FUEL-LEVEL ?auto_24161 ?auto_24163 ) ( not ( = ?auto_24158 ?auto_24164 ) ) ( not ( = ?auto_24165 ?auto_24164 ) ) ( PERSON-AT ?auto_24160 ?auto_24164 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24160 ?auto_24159 ?auto_24158 )
      ( FLY-2PPL-VERIFY ?auto_24159 ?auto_24160 ?auto_24158 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24240 - PERSON
      ?auto_24239 - CITY
    )
    :vars
    (
      ?auto_24242 - FLEVEL
      ?auto_24243 - FLEVEL
      ?auto_24245 - CITY
      ?auto_24246 - PERSON
      ?auto_24241 - AIRCRAFT
      ?auto_24244 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24242 ?auto_24243 ) ( not ( = ?auto_24239 ?auto_24245 ) ) ( not ( = ?auto_24243 ?auto_24242 ) ) ( not ( = ?auto_24246 ?auto_24240 ) ) ( PERSON-AT ?auto_24240 ?auto_24245 ) ( AIRCRAFT-AT ?auto_24241 ?auto_24244 ) ( not ( = ?auto_24239 ?auto_24244 ) ) ( not ( = ?auto_24245 ?auto_24244 ) ) ( PERSON-AT ?auto_24246 ?auto_24244 ) ( FUEL-LEVEL ?auto_24241 ?auto_24242 ) )
    :subtasks
    ( ( !REFUEL ?auto_24241 ?auto_24244 ?auto_24242 ?auto_24243 )
      ( FLY-2PPL ?auto_24246 ?auto_24240 ?auto_24239 )
      ( FLY-1PPL-VERIFY ?auto_24240 ?auto_24239 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24248 - PERSON
      ?auto_24249 - PERSON
      ?auto_24247 - CITY
    )
    :vars
    (
      ?auto_24252 - FLEVEL
      ?auto_24254 - FLEVEL
      ?auto_24253 - CITY
      ?auto_24250 - AIRCRAFT
      ?auto_24251 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24252 ?auto_24254 ) ( not ( = ?auto_24247 ?auto_24253 ) ) ( not ( = ?auto_24254 ?auto_24252 ) ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( PERSON-AT ?auto_24249 ?auto_24253 ) ( AIRCRAFT-AT ?auto_24250 ?auto_24251 ) ( not ( = ?auto_24247 ?auto_24251 ) ) ( not ( = ?auto_24253 ?auto_24251 ) ) ( PERSON-AT ?auto_24248 ?auto_24251 ) ( FUEL-LEVEL ?auto_24250 ?auto_24252 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24249 ?auto_24247 )
      ( FLY-2PPL-VERIFY ?auto_24248 ?auto_24249 ?auto_24247 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24256 - PERSON
      ?auto_24257 - PERSON
      ?auto_24255 - CITY
    )
    :vars
    (
      ?auto_24262 - FLEVEL
      ?auto_24260 - FLEVEL
      ?auto_24261 - CITY
      ?auto_24259 - AIRCRAFT
      ?auto_24258 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_24262 ?auto_24260 ) ( not ( = ?auto_24255 ?auto_24261 ) ) ( not ( = ?auto_24260 ?auto_24262 ) ) ( not ( = ?auto_24257 ?auto_24256 ) ) ( PERSON-AT ?auto_24256 ?auto_24261 ) ( AIRCRAFT-AT ?auto_24259 ?auto_24258 ) ( not ( = ?auto_24255 ?auto_24258 ) ) ( not ( = ?auto_24261 ?auto_24258 ) ) ( PERSON-AT ?auto_24257 ?auto_24258 ) ( FUEL-LEVEL ?auto_24259 ?auto_24262 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24257 ?auto_24256 ?auto_24255 )
      ( FLY-2PPL-VERIFY ?auto_24256 ?auto_24257 ?auto_24255 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24337 - PERSON
      ?auto_24336 - CITY
    )
    :vars
    (
      ?auto_24343 - FLEVEL
      ?auto_24341 - FLEVEL
      ?auto_24342 - CITY
      ?auto_24339 - PERSON
      ?auto_24338 - CITY
      ?auto_24340 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_24343 ?auto_24341 ) ( not ( = ?auto_24336 ?auto_24342 ) ) ( not ( = ?auto_24341 ?auto_24343 ) ) ( not ( = ?auto_24339 ?auto_24337 ) ) ( PERSON-AT ?auto_24337 ?auto_24342 ) ( not ( = ?auto_24336 ?auto_24338 ) ) ( not ( = ?auto_24342 ?auto_24338 ) ) ( PERSON-AT ?auto_24339 ?auto_24338 ) ( AIRCRAFT-AT ?auto_24340 ?auto_24336 ) ( FUEL-LEVEL ?auto_24340 ?auto_24341 ) )
    :subtasks
    ( ( !FLY ?auto_24340 ?auto_24336 ?auto_24338 ?auto_24341 ?auto_24343 )
      ( FLY-2PPL ?auto_24339 ?auto_24337 ?auto_24336 )
      ( FLY-1PPL-VERIFY ?auto_24337 ?auto_24336 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24345 - PERSON
      ?auto_24346 - PERSON
      ?auto_24344 - CITY
    )
    :vars
    (
      ?auto_24348 - FLEVEL
      ?auto_24351 - FLEVEL
      ?auto_24350 - CITY
      ?auto_24349 - CITY
      ?auto_24347 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_24348 ?auto_24351 ) ( not ( = ?auto_24344 ?auto_24350 ) ) ( not ( = ?auto_24351 ?auto_24348 ) ) ( not ( = ?auto_24345 ?auto_24346 ) ) ( PERSON-AT ?auto_24346 ?auto_24350 ) ( not ( = ?auto_24344 ?auto_24349 ) ) ( not ( = ?auto_24350 ?auto_24349 ) ) ( PERSON-AT ?auto_24345 ?auto_24349 ) ( AIRCRAFT-AT ?auto_24347 ?auto_24344 ) ( FUEL-LEVEL ?auto_24347 ?auto_24351 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24346 ?auto_24344 )
      ( FLY-2PPL-VERIFY ?auto_24345 ?auto_24346 ?auto_24344 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24353 - PERSON
      ?auto_24354 - PERSON
      ?auto_24352 - CITY
    )
    :vars
    (
      ?auto_24356 - FLEVEL
      ?auto_24359 - FLEVEL
      ?auto_24358 - CITY
      ?auto_24355 - CITY
      ?auto_24357 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_24356 ?auto_24359 ) ( not ( = ?auto_24352 ?auto_24358 ) ) ( not ( = ?auto_24359 ?auto_24356 ) ) ( not ( = ?auto_24354 ?auto_24353 ) ) ( PERSON-AT ?auto_24353 ?auto_24358 ) ( not ( = ?auto_24352 ?auto_24355 ) ) ( not ( = ?auto_24358 ?auto_24355 ) ) ( PERSON-AT ?auto_24354 ?auto_24355 ) ( AIRCRAFT-AT ?auto_24357 ?auto_24352 ) ( FUEL-LEVEL ?auto_24357 ?auto_24359 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24354 ?auto_24353 ?auto_24352 )
      ( FLY-2PPL-VERIFY ?auto_24353 ?auto_24354 ?auto_24352 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24434 - PERSON
      ?auto_24433 - CITY
    )
    :vars
    (
      ?auto_24436 - FLEVEL
      ?auto_24439 - FLEVEL
      ?auto_24438 - CITY
      ?auto_24440 - PERSON
      ?auto_24435 - CITY
      ?auto_24437 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_24436 ?auto_24439 ) ( not ( = ?auto_24433 ?auto_24438 ) ) ( not ( = ?auto_24439 ?auto_24436 ) ) ( not ( = ?auto_24440 ?auto_24434 ) ) ( PERSON-AT ?auto_24434 ?auto_24438 ) ( not ( = ?auto_24433 ?auto_24435 ) ) ( not ( = ?auto_24438 ?auto_24435 ) ) ( PERSON-AT ?auto_24440 ?auto_24435 ) ( AIRCRAFT-AT ?auto_24437 ?auto_24433 ) ( FUEL-LEVEL ?auto_24437 ?auto_24436 ) )
    :subtasks
    ( ( !REFUEL ?auto_24437 ?auto_24433 ?auto_24436 ?auto_24439 )
      ( FLY-2PPL ?auto_24440 ?auto_24434 ?auto_24433 )
      ( FLY-1PPL-VERIFY ?auto_24434 ?auto_24433 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24442 - PERSON
      ?auto_24443 - PERSON
      ?auto_24441 - CITY
    )
    :vars
    (
      ?auto_24447 - FLEVEL
      ?auto_24446 - FLEVEL
      ?auto_24445 - CITY
      ?auto_24444 - CITY
      ?auto_24448 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_24447 ?auto_24446 ) ( not ( = ?auto_24441 ?auto_24445 ) ) ( not ( = ?auto_24446 ?auto_24447 ) ) ( not ( = ?auto_24442 ?auto_24443 ) ) ( PERSON-AT ?auto_24443 ?auto_24445 ) ( not ( = ?auto_24441 ?auto_24444 ) ) ( not ( = ?auto_24445 ?auto_24444 ) ) ( PERSON-AT ?auto_24442 ?auto_24444 ) ( AIRCRAFT-AT ?auto_24448 ?auto_24441 ) ( FUEL-LEVEL ?auto_24448 ?auto_24447 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24443 ?auto_24441 )
      ( FLY-2PPL-VERIFY ?auto_24442 ?auto_24443 ?auto_24441 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24450 - PERSON
      ?auto_24451 - PERSON
      ?auto_24449 - CITY
    )
    :vars
    (
      ?auto_24454 - FLEVEL
      ?auto_24456 - FLEVEL
      ?auto_24455 - CITY
      ?auto_24452 - CITY
      ?auto_24453 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_24454 ?auto_24456 ) ( not ( = ?auto_24449 ?auto_24455 ) ) ( not ( = ?auto_24456 ?auto_24454 ) ) ( not ( = ?auto_24451 ?auto_24450 ) ) ( PERSON-AT ?auto_24450 ?auto_24455 ) ( not ( = ?auto_24449 ?auto_24452 ) ) ( not ( = ?auto_24455 ?auto_24452 ) ) ( PERSON-AT ?auto_24451 ?auto_24452 ) ( AIRCRAFT-AT ?auto_24453 ?auto_24449 ) ( FUEL-LEVEL ?auto_24453 ?auto_24454 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24451 ?auto_24450 ?auto_24449 )
      ( FLY-2PPL-VERIFY ?auto_24450 ?auto_24451 ?auto_24449 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24624 - PERSON
      ?auto_24623 - CITY
    )
    :vars
    (
      ?auto_24625 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24624 ?auto_24625 ) ( AIRCRAFT-AT ?auto_24625 ?auto_24623 ) )
    :subtasks
    ( ( !DEBARK ?auto_24624 ?auto_24625 ?auto_24623 )
      ( FLY-1PPL-VERIFY ?auto_24624 ?auto_24623 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24627 - PERSON
      ?auto_24628 - PERSON
      ?auto_24626 - CITY
    )
    :vars
    (
      ?auto_24629 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24628 ?auto_24629 ) ( AIRCRAFT-AT ?auto_24629 ?auto_24626 ) ( PERSON-AT ?auto_24627 ?auto_24626 ) ( not ( = ?auto_24627 ?auto_24628 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24628 ?auto_24626 )
      ( FLY-2PPL-VERIFY ?auto_24627 ?auto_24628 ?auto_24626 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24631 - PERSON
      ?auto_24632 - PERSON
      ?auto_24630 - CITY
    )
    :vars
    (
      ?auto_24633 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24632 ?auto_24633 ) ( AIRCRAFT-AT ?auto_24633 ?auto_24630 ) ( PERSON-AT ?auto_24631 ?auto_24630 ) ( not ( = ?auto_24631 ?auto_24632 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24632 ?auto_24630 )
      ( FLY-2PPL-VERIFY ?auto_24631 ?auto_24632 ?auto_24630 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24635 - PERSON
      ?auto_24636 - PERSON
      ?auto_24634 - CITY
    )
    :vars
    (
      ?auto_24637 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24635 ?auto_24637 ) ( AIRCRAFT-AT ?auto_24637 ?auto_24634 ) ( PERSON-AT ?auto_24636 ?auto_24634 ) ( not ( = ?auto_24635 ?auto_24636 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24635 ?auto_24634 )
      ( FLY-2PPL-VERIFY ?auto_24635 ?auto_24636 ?auto_24634 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24639 - PERSON
      ?auto_24640 - PERSON
      ?auto_24638 - CITY
    )
    :vars
    (
      ?auto_24641 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24639 ?auto_24641 ) ( AIRCRAFT-AT ?auto_24641 ?auto_24638 ) ( PERSON-AT ?auto_24640 ?auto_24638 ) ( not ( = ?auto_24639 ?auto_24640 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24639 ?auto_24638 )
      ( FLY-2PPL-VERIFY ?auto_24639 ?auto_24640 ?auto_24638 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24647 - PERSON
      ?auto_24648 - PERSON
      ?auto_24649 - PERSON
      ?auto_24646 - CITY
    )
    :vars
    (
      ?auto_24650 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24649 ?auto_24650 ) ( AIRCRAFT-AT ?auto_24650 ?auto_24646 ) ( PERSON-AT ?auto_24647 ?auto_24646 ) ( PERSON-AT ?auto_24648 ?auto_24646 ) ( not ( = ?auto_24647 ?auto_24648 ) ) ( not ( = ?auto_24647 ?auto_24649 ) ) ( not ( = ?auto_24648 ?auto_24649 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24649 ?auto_24646 )
      ( FLY-3PPL-VERIFY ?auto_24647 ?auto_24648 ?auto_24649 ?auto_24646 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24652 - PERSON
      ?auto_24653 - PERSON
      ?auto_24654 - PERSON
      ?auto_24651 - CITY
    )
    :vars
    (
      ?auto_24655 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24654 ?auto_24655 ) ( AIRCRAFT-AT ?auto_24655 ?auto_24651 ) ( PERSON-AT ?auto_24652 ?auto_24651 ) ( PERSON-AT ?auto_24653 ?auto_24651 ) ( not ( = ?auto_24652 ?auto_24653 ) ) ( not ( = ?auto_24652 ?auto_24654 ) ) ( not ( = ?auto_24653 ?auto_24654 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24654 ?auto_24651 )
      ( FLY-3PPL-VERIFY ?auto_24652 ?auto_24653 ?auto_24654 ?auto_24651 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24657 - PERSON
      ?auto_24658 - PERSON
      ?auto_24659 - PERSON
      ?auto_24656 - CITY
    )
    :vars
    (
      ?auto_24660 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24658 ?auto_24660 ) ( AIRCRAFT-AT ?auto_24660 ?auto_24656 ) ( PERSON-AT ?auto_24657 ?auto_24656 ) ( PERSON-AT ?auto_24659 ?auto_24656 ) ( not ( = ?auto_24657 ?auto_24658 ) ) ( not ( = ?auto_24657 ?auto_24659 ) ) ( not ( = ?auto_24658 ?auto_24659 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24658 ?auto_24656 )
      ( FLY-3PPL-VERIFY ?auto_24657 ?auto_24658 ?auto_24659 ?auto_24656 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24662 - PERSON
      ?auto_24663 - PERSON
      ?auto_24664 - PERSON
      ?auto_24661 - CITY
    )
    :vars
    (
      ?auto_24665 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24663 ?auto_24665 ) ( AIRCRAFT-AT ?auto_24665 ?auto_24661 ) ( PERSON-AT ?auto_24662 ?auto_24661 ) ( PERSON-AT ?auto_24664 ?auto_24661 ) ( not ( = ?auto_24662 ?auto_24663 ) ) ( not ( = ?auto_24662 ?auto_24664 ) ) ( not ( = ?auto_24663 ?auto_24664 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24663 ?auto_24661 )
      ( FLY-3PPL-VERIFY ?auto_24662 ?auto_24663 ?auto_24664 ?auto_24661 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24672 - PERSON
      ?auto_24673 - PERSON
      ?auto_24674 - PERSON
      ?auto_24671 - CITY
    )
    :vars
    (
      ?auto_24675 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24674 ?auto_24675 ) ( AIRCRAFT-AT ?auto_24675 ?auto_24671 ) ( PERSON-AT ?auto_24672 ?auto_24671 ) ( PERSON-AT ?auto_24673 ?auto_24671 ) ( not ( = ?auto_24672 ?auto_24673 ) ) ( not ( = ?auto_24672 ?auto_24674 ) ) ( not ( = ?auto_24673 ?auto_24674 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24674 ?auto_24671 )
      ( FLY-3PPL-VERIFY ?auto_24672 ?auto_24673 ?auto_24674 ?auto_24671 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24677 - PERSON
      ?auto_24678 - PERSON
      ?auto_24679 - PERSON
      ?auto_24676 - CITY
    )
    :vars
    (
      ?auto_24680 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24679 ?auto_24680 ) ( AIRCRAFT-AT ?auto_24680 ?auto_24676 ) ( PERSON-AT ?auto_24677 ?auto_24676 ) ( PERSON-AT ?auto_24678 ?auto_24676 ) ( not ( = ?auto_24677 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24679 ) ) ( not ( = ?auto_24678 ?auto_24679 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24679 ?auto_24676 )
      ( FLY-3PPL-VERIFY ?auto_24677 ?auto_24678 ?auto_24679 ?auto_24676 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24682 - PERSON
      ?auto_24683 - PERSON
      ?auto_24684 - PERSON
      ?auto_24681 - CITY
    )
    :vars
    (
      ?auto_24685 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24683 ?auto_24685 ) ( AIRCRAFT-AT ?auto_24685 ?auto_24681 ) ( PERSON-AT ?auto_24682 ?auto_24681 ) ( PERSON-AT ?auto_24684 ?auto_24681 ) ( not ( = ?auto_24682 ?auto_24683 ) ) ( not ( = ?auto_24682 ?auto_24684 ) ) ( not ( = ?auto_24683 ?auto_24684 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24683 ?auto_24681 )
      ( FLY-3PPL-VERIFY ?auto_24682 ?auto_24683 ?auto_24684 ?auto_24681 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24687 - PERSON
      ?auto_24688 - PERSON
      ?auto_24689 - PERSON
      ?auto_24686 - CITY
    )
    :vars
    (
      ?auto_24690 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24688 ?auto_24690 ) ( AIRCRAFT-AT ?auto_24690 ?auto_24686 ) ( PERSON-AT ?auto_24687 ?auto_24686 ) ( PERSON-AT ?auto_24689 ?auto_24686 ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24688 ?auto_24689 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24688 ?auto_24686 )
      ( FLY-3PPL-VERIFY ?auto_24687 ?auto_24688 ?auto_24689 ?auto_24686 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24697 - PERSON
      ?auto_24698 - PERSON
      ?auto_24699 - PERSON
      ?auto_24696 - CITY
    )
    :vars
    (
      ?auto_24700 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24697 ?auto_24700 ) ( AIRCRAFT-AT ?auto_24700 ?auto_24696 ) ( PERSON-AT ?auto_24698 ?auto_24696 ) ( PERSON-AT ?auto_24699 ?auto_24696 ) ( not ( = ?auto_24697 ?auto_24698 ) ) ( not ( = ?auto_24697 ?auto_24699 ) ) ( not ( = ?auto_24698 ?auto_24699 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24697 ?auto_24696 )
      ( FLY-3PPL-VERIFY ?auto_24697 ?auto_24698 ?auto_24699 ?auto_24696 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24702 - PERSON
      ?auto_24703 - PERSON
      ?auto_24704 - PERSON
      ?auto_24701 - CITY
    )
    :vars
    (
      ?auto_24705 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24702 ?auto_24705 ) ( AIRCRAFT-AT ?auto_24705 ?auto_24701 ) ( PERSON-AT ?auto_24703 ?auto_24701 ) ( PERSON-AT ?auto_24704 ?auto_24701 ) ( not ( = ?auto_24702 ?auto_24703 ) ) ( not ( = ?auto_24702 ?auto_24704 ) ) ( not ( = ?auto_24703 ?auto_24704 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24702 ?auto_24701 )
      ( FLY-3PPL-VERIFY ?auto_24702 ?auto_24703 ?auto_24704 ?auto_24701 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24712 - PERSON
      ?auto_24713 - PERSON
      ?auto_24714 - PERSON
      ?auto_24711 - CITY
    )
    :vars
    (
      ?auto_24715 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24712 ?auto_24715 ) ( AIRCRAFT-AT ?auto_24715 ?auto_24711 ) ( PERSON-AT ?auto_24713 ?auto_24711 ) ( PERSON-AT ?auto_24714 ?auto_24711 ) ( not ( = ?auto_24712 ?auto_24713 ) ) ( not ( = ?auto_24712 ?auto_24714 ) ) ( not ( = ?auto_24713 ?auto_24714 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24712 ?auto_24711 )
      ( FLY-3PPL-VERIFY ?auto_24712 ?auto_24713 ?auto_24714 ?auto_24711 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24717 - PERSON
      ?auto_24718 - PERSON
      ?auto_24719 - PERSON
      ?auto_24716 - CITY
    )
    :vars
    (
      ?auto_24720 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_24717 ?auto_24720 ) ( AIRCRAFT-AT ?auto_24720 ?auto_24716 ) ( PERSON-AT ?auto_24718 ?auto_24716 ) ( PERSON-AT ?auto_24719 ?auto_24716 ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24719 ) ) ( not ( = ?auto_24718 ?auto_24719 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24717 ?auto_24716 )
      ( FLY-3PPL-VERIFY ?auto_24717 ?auto_24718 ?auto_24719 ?auto_24716 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24742 - PERSON
      ?auto_24741 - CITY
    )
    :vars
    (
      ?auto_24743 - AIRCRAFT
      ?auto_24746 - CITY
      ?auto_24744 - FLEVEL
      ?auto_24745 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24742 ?auto_24743 ) ( AIRCRAFT-AT ?auto_24743 ?auto_24746 ) ( FUEL-LEVEL ?auto_24743 ?auto_24744 ) ( NEXT ?auto_24745 ?auto_24744 ) ( not ( = ?auto_24741 ?auto_24746 ) ) ( not ( = ?auto_24744 ?auto_24745 ) ) )
    :subtasks
    ( ( !FLY ?auto_24743 ?auto_24746 ?auto_24741 ?auto_24744 ?auto_24745 )
      ( FLY-1PPL ?auto_24742 ?auto_24741 )
      ( FLY-1PPL-VERIFY ?auto_24742 ?auto_24741 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24748 - PERSON
      ?auto_24749 - PERSON
      ?auto_24747 - CITY
    )
    :vars
    (
      ?auto_24751 - AIRCRAFT
      ?auto_24752 - CITY
      ?auto_24753 - FLEVEL
      ?auto_24750 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24749 ?auto_24751 ) ( AIRCRAFT-AT ?auto_24751 ?auto_24752 ) ( FUEL-LEVEL ?auto_24751 ?auto_24753 ) ( NEXT ?auto_24750 ?auto_24753 ) ( not ( = ?auto_24747 ?auto_24752 ) ) ( not ( = ?auto_24753 ?auto_24750 ) ) ( PERSON-AT ?auto_24748 ?auto_24747 ) ( not ( = ?auto_24748 ?auto_24749 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24749 ?auto_24747 )
      ( FLY-2PPL-VERIFY ?auto_24748 ?auto_24749 ?auto_24747 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24755 - PERSON
      ?auto_24756 - PERSON
      ?auto_24754 - CITY
    )
    :vars
    (
      ?auto_24758 - AIRCRAFT
      ?auto_24760 - CITY
      ?auto_24757 - FLEVEL
      ?auto_24759 - FLEVEL
      ?auto_24761 - PERSON
    )
    :precondition
    ( and ( IN ?auto_24756 ?auto_24758 ) ( AIRCRAFT-AT ?auto_24758 ?auto_24760 ) ( FUEL-LEVEL ?auto_24758 ?auto_24757 ) ( NEXT ?auto_24759 ?auto_24757 ) ( not ( = ?auto_24754 ?auto_24760 ) ) ( not ( = ?auto_24757 ?auto_24759 ) ) ( PERSON-AT ?auto_24761 ?auto_24754 ) ( not ( = ?auto_24761 ?auto_24756 ) ) ( PERSON-AT ?auto_24755 ?auto_24754 ) ( not ( = ?auto_24755 ?auto_24756 ) ) ( not ( = ?auto_24755 ?auto_24761 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24761 ?auto_24756 ?auto_24754 )
      ( FLY-2PPL-VERIFY ?auto_24755 ?auto_24756 ?auto_24754 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24763 - PERSON
      ?auto_24764 - PERSON
      ?auto_24762 - CITY
    )
    :vars
    (
      ?auto_24766 - AIRCRAFT
      ?auto_24768 - CITY
      ?auto_24765 - FLEVEL
      ?auto_24767 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24763 ?auto_24766 ) ( AIRCRAFT-AT ?auto_24766 ?auto_24768 ) ( FUEL-LEVEL ?auto_24766 ?auto_24765 ) ( NEXT ?auto_24767 ?auto_24765 ) ( not ( = ?auto_24762 ?auto_24768 ) ) ( not ( = ?auto_24765 ?auto_24767 ) ) ( PERSON-AT ?auto_24764 ?auto_24762 ) ( not ( = ?auto_24764 ?auto_24763 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24764 ?auto_24763 ?auto_24762 )
      ( FLY-2PPL-VERIFY ?auto_24763 ?auto_24764 ?auto_24762 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24770 - PERSON
      ?auto_24771 - PERSON
      ?auto_24769 - CITY
    )
    :vars
    (
      ?auto_24773 - AIRCRAFT
      ?auto_24775 - CITY
      ?auto_24772 - FLEVEL
      ?auto_24774 - FLEVEL
      ?auto_24776 - PERSON
    )
    :precondition
    ( and ( IN ?auto_24770 ?auto_24773 ) ( AIRCRAFT-AT ?auto_24773 ?auto_24775 ) ( FUEL-LEVEL ?auto_24773 ?auto_24772 ) ( NEXT ?auto_24774 ?auto_24772 ) ( not ( = ?auto_24769 ?auto_24775 ) ) ( not ( = ?auto_24772 ?auto_24774 ) ) ( PERSON-AT ?auto_24776 ?auto_24769 ) ( not ( = ?auto_24776 ?auto_24770 ) ) ( PERSON-AT ?auto_24771 ?auto_24769 ) ( not ( = ?auto_24770 ?auto_24771 ) ) ( not ( = ?auto_24771 ?auto_24776 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24776 ?auto_24770 ?auto_24769 )
      ( FLY-2PPL-VERIFY ?auto_24770 ?auto_24771 ?auto_24769 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24786 - PERSON
      ?auto_24787 - PERSON
      ?auto_24788 - PERSON
      ?auto_24785 - CITY
    )
    :vars
    (
      ?auto_24790 - AIRCRAFT
      ?auto_24792 - CITY
      ?auto_24789 - FLEVEL
      ?auto_24791 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24788 ?auto_24790 ) ( AIRCRAFT-AT ?auto_24790 ?auto_24792 ) ( FUEL-LEVEL ?auto_24790 ?auto_24789 ) ( NEXT ?auto_24791 ?auto_24789 ) ( not ( = ?auto_24785 ?auto_24792 ) ) ( not ( = ?auto_24789 ?auto_24791 ) ) ( PERSON-AT ?auto_24787 ?auto_24785 ) ( not ( = ?auto_24787 ?auto_24788 ) ) ( PERSON-AT ?auto_24786 ?auto_24785 ) ( not ( = ?auto_24786 ?auto_24787 ) ) ( not ( = ?auto_24786 ?auto_24788 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24787 ?auto_24788 ?auto_24785 )
      ( FLY-3PPL-VERIFY ?auto_24786 ?auto_24787 ?auto_24788 ?auto_24785 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24794 - PERSON
      ?auto_24795 - PERSON
      ?auto_24796 - PERSON
      ?auto_24793 - CITY
    )
    :vars
    (
      ?auto_24798 - AIRCRAFT
      ?auto_24800 - CITY
      ?auto_24797 - FLEVEL
      ?auto_24799 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24796 ?auto_24798 ) ( AIRCRAFT-AT ?auto_24798 ?auto_24800 ) ( FUEL-LEVEL ?auto_24798 ?auto_24797 ) ( NEXT ?auto_24799 ?auto_24797 ) ( not ( = ?auto_24793 ?auto_24800 ) ) ( not ( = ?auto_24797 ?auto_24799 ) ) ( PERSON-AT ?auto_24794 ?auto_24793 ) ( not ( = ?auto_24794 ?auto_24796 ) ) ( PERSON-AT ?auto_24795 ?auto_24793 ) ( not ( = ?auto_24794 ?auto_24795 ) ) ( not ( = ?auto_24795 ?auto_24796 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24794 ?auto_24796 ?auto_24793 )
      ( FLY-3PPL-VERIFY ?auto_24794 ?auto_24795 ?auto_24796 ?auto_24793 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24802 - PERSON
      ?auto_24803 - PERSON
      ?auto_24804 - PERSON
      ?auto_24801 - CITY
    )
    :vars
    (
      ?auto_24806 - AIRCRAFT
      ?auto_24808 - CITY
      ?auto_24805 - FLEVEL
      ?auto_24807 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24803 ?auto_24806 ) ( AIRCRAFT-AT ?auto_24806 ?auto_24808 ) ( FUEL-LEVEL ?auto_24806 ?auto_24805 ) ( NEXT ?auto_24807 ?auto_24805 ) ( not ( = ?auto_24801 ?auto_24808 ) ) ( not ( = ?auto_24805 ?auto_24807 ) ) ( PERSON-AT ?auto_24804 ?auto_24801 ) ( not ( = ?auto_24804 ?auto_24803 ) ) ( PERSON-AT ?auto_24802 ?auto_24801 ) ( not ( = ?auto_24802 ?auto_24803 ) ) ( not ( = ?auto_24802 ?auto_24804 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24804 ?auto_24803 ?auto_24801 )
      ( FLY-3PPL-VERIFY ?auto_24802 ?auto_24803 ?auto_24804 ?auto_24801 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24810 - PERSON
      ?auto_24811 - PERSON
      ?auto_24812 - PERSON
      ?auto_24809 - CITY
    )
    :vars
    (
      ?auto_24814 - AIRCRAFT
      ?auto_24816 - CITY
      ?auto_24813 - FLEVEL
      ?auto_24815 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24811 ?auto_24814 ) ( AIRCRAFT-AT ?auto_24814 ?auto_24816 ) ( FUEL-LEVEL ?auto_24814 ?auto_24813 ) ( NEXT ?auto_24815 ?auto_24813 ) ( not ( = ?auto_24809 ?auto_24816 ) ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( PERSON-AT ?auto_24810 ?auto_24809 ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( PERSON-AT ?auto_24812 ?auto_24809 ) ( not ( = ?auto_24810 ?auto_24812 ) ) ( not ( = ?auto_24811 ?auto_24812 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24810 ?auto_24811 ?auto_24809 )
      ( FLY-3PPL-VERIFY ?auto_24810 ?auto_24811 ?auto_24812 ?auto_24809 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24826 - PERSON
      ?auto_24827 - PERSON
      ?auto_24828 - PERSON
      ?auto_24825 - CITY
    )
    :vars
    (
      ?auto_24830 - AIRCRAFT
      ?auto_24832 - CITY
      ?auto_24829 - FLEVEL
      ?auto_24831 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24828 ?auto_24830 ) ( AIRCRAFT-AT ?auto_24830 ?auto_24832 ) ( FUEL-LEVEL ?auto_24830 ?auto_24829 ) ( NEXT ?auto_24831 ?auto_24829 ) ( not ( = ?auto_24825 ?auto_24832 ) ) ( not ( = ?auto_24829 ?auto_24831 ) ) ( PERSON-AT ?auto_24827 ?auto_24825 ) ( not ( = ?auto_24827 ?auto_24828 ) ) ( PERSON-AT ?auto_24826 ?auto_24825 ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24828 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24827 ?auto_24828 ?auto_24825 )
      ( FLY-3PPL-VERIFY ?auto_24826 ?auto_24827 ?auto_24828 ?auto_24825 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24834 - PERSON
      ?auto_24835 - PERSON
      ?auto_24836 - PERSON
      ?auto_24833 - CITY
    )
    :vars
    (
      ?auto_24838 - AIRCRAFT
      ?auto_24840 - CITY
      ?auto_24837 - FLEVEL
      ?auto_24839 - FLEVEL
      ?auto_24841 - PERSON
    )
    :precondition
    ( and ( IN ?auto_24836 ?auto_24838 ) ( AIRCRAFT-AT ?auto_24838 ?auto_24840 ) ( FUEL-LEVEL ?auto_24838 ?auto_24837 ) ( NEXT ?auto_24839 ?auto_24837 ) ( not ( = ?auto_24833 ?auto_24840 ) ) ( not ( = ?auto_24837 ?auto_24839 ) ) ( PERSON-AT ?auto_24841 ?auto_24833 ) ( not ( = ?auto_24841 ?auto_24836 ) ) ( PERSON-AT ?auto_24834 ?auto_24833 ) ( PERSON-AT ?auto_24835 ?auto_24833 ) ( not ( = ?auto_24834 ?auto_24835 ) ) ( not ( = ?auto_24834 ?auto_24836 ) ) ( not ( = ?auto_24834 ?auto_24841 ) ) ( not ( = ?auto_24835 ?auto_24836 ) ) ( not ( = ?auto_24835 ?auto_24841 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24841 ?auto_24836 ?auto_24833 )
      ( FLY-3PPL-VERIFY ?auto_24834 ?auto_24835 ?auto_24836 ?auto_24833 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24843 - PERSON
      ?auto_24844 - PERSON
      ?auto_24845 - PERSON
      ?auto_24842 - CITY
    )
    :vars
    (
      ?auto_24847 - AIRCRAFT
      ?auto_24849 - CITY
      ?auto_24846 - FLEVEL
      ?auto_24848 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24844 ?auto_24847 ) ( AIRCRAFT-AT ?auto_24847 ?auto_24849 ) ( FUEL-LEVEL ?auto_24847 ?auto_24846 ) ( NEXT ?auto_24848 ?auto_24846 ) ( not ( = ?auto_24842 ?auto_24849 ) ) ( not ( = ?auto_24846 ?auto_24848 ) ) ( PERSON-AT ?auto_24845 ?auto_24842 ) ( not ( = ?auto_24845 ?auto_24844 ) ) ( PERSON-AT ?auto_24843 ?auto_24842 ) ( not ( = ?auto_24843 ?auto_24844 ) ) ( not ( = ?auto_24843 ?auto_24845 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24845 ?auto_24844 ?auto_24842 )
      ( FLY-3PPL-VERIFY ?auto_24843 ?auto_24844 ?auto_24845 ?auto_24842 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24851 - PERSON
      ?auto_24852 - PERSON
      ?auto_24853 - PERSON
      ?auto_24850 - CITY
    )
    :vars
    (
      ?auto_24855 - AIRCRAFT
      ?auto_24857 - CITY
      ?auto_24854 - FLEVEL
      ?auto_24856 - FLEVEL
      ?auto_24858 - PERSON
    )
    :precondition
    ( and ( IN ?auto_24852 ?auto_24855 ) ( AIRCRAFT-AT ?auto_24855 ?auto_24857 ) ( FUEL-LEVEL ?auto_24855 ?auto_24854 ) ( NEXT ?auto_24856 ?auto_24854 ) ( not ( = ?auto_24850 ?auto_24857 ) ) ( not ( = ?auto_24854 ?auto_24856 ) ) ( PERSON-AT ?auto_24858 ?auto_24850 ) ( not ( = ?auto_24858 ?auto_24852 ) ) ( PERSON-AT ?auto_24851 ?auto_24850 ) ( PERSON-AT ?auto_24853 ?auto_24850 ) ( not ( = ?auto_24851 ?auto_24852 ) ) ( not ( = ?auto_24851 ?auto_24853 ) ) ( not ( = ?auto_24851 ?auto_24858 ) ) ( not ( = ?auto_24852 ?auto_24853 ) ) ( not ( = ?auto_24853 ?auto_24858 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24858 ?auto_24852 ?auto_24850 )
      ( FLY-3PPL-VERIFY ?auto_24851 ?auto_24852 ?auto_24853 ?auto_24850 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24869 - PERSON
      ?auto_24870 - PERSON
      ?auto_24871 - PERSON
      ?auto_24868 - CITY
    )
    :vars
    (
      ?auto_24873 - AIRCRAFT
      ?auto_24875 - CITY
      ?auto_24872 - FLEVEL
      ?auto_24874 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24869 ?auto_24873 ) ( AIRCRAFT-AT ?auto_24873 ?auto_24875 ) ( FUEL-LEVEL ?auto_24873 ?auto_24872 ) ( NEXT ?auto_24874 ?auto_24872 ) ( not ( = ?auto_24868 ?auto_24875 ) ) ( not ( = ?auto_24872 ?auto_24874 ) ) ( PERSON-AT ?auto_24870 ?auto_24868 ) ( not ( = ?auto_24870 ?auto_24869 ) ) ( PERSON-AT ?auto_24871 ?auto_24868 ) ( not ( = ?auto_24869 ?auto_24871 ) ) ( not ( = ?auto_24870 ?auto_24871 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24870 ?auto_24869 ?auto_24868 )
      ( FLY-3PPL-VERIFY ?auto_24869 ?auto_24870 ?auto_24871 ?auto_24868 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24877 - PERSON
      ?auto_24878 - PERSON
      ?auto_24879 - PERSON
      ?auto_24876 - CITY
    )
    :vars
    (
      ?auto_24881 - AIRCRAFT
      ?auto_24883 - CITY
      ?auto_24880 - FLEVEL
      ?auto_24882 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24877 ?auto_24881 ) ( AIRCRAFT-AT ?auto_24881 ?auto_24883 ) ( FUEL-LEVEL ?auto_24881 ?auto_24880 ) ( NEXT ?auto_24882 ?auto_24880 ) ( not ( = ?auto_24876 ?auto_24883 ) ) ( not ( = ?auto_24880 ?auto_24882 ) ) ( PERSON-AT ?auto_24878 ?auto_24876 ) ( not ( = ?auto_24878 ?auto_24877 ) ) ( PERSON-AT ?auto_24879 ?auto_24876 ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( not ( = ?auto_24878 ?auto_24879 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24878 ?auto_24877 ?auto_24876 )
      ( FLY-3PPL-VERIFY ?auto_24877 ?auto_24878 ?auto_24879 ?auto_24876 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24893 - PERSON
      ?auto_24894 - PERSON
      ?auto_24895 - PERSON
      ?auto_24892 - CITY
    )
    :vars
    (
      ?auto_24897 - AIRCRAFT
      ?auto_24899 - CITY
      ?auto_24896 - FLEVEL
      ?auto_24898 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_24893 ?auto_24897 ) ( AIRCRAFT-AT ?auto_24897 ?auto_24899 ) ( FUEL-LEVEL ?auto_24897 ?auto_24896 ) ( NEXT ?auto_24898 ?auto_24896 ) ( not ( = ?auto_24892 ?auto_24899 ) ) ( not ( = ?auto_24896 ?auto_24898 ) ) ( PERSON-AT ?auto_24895 ?auto_24892 ) ( not ( = ?auto_24895 ?auto_24893 ) ) ( PERSON-AT ?auto_24894 ?auto_24892 ) ( not ( = ?auto_24893 ?auto_24894 ) ) ( not ( = ?auto_24894 ?auto_24895 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24895 ?auto_24893 ?auto_24892 )
      ( FLY-3PPL-VERIFY ?auto_24893 ?auto_24894 ?auto_24895 ?auto_24892 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24901 - PERSON
      ?auto_24902 - PERSON
      ?auto_24903 - PERSON
      ?auto_24900 - CITY
    )
    :vars
    (
      ?auto_24905 - AIRCRAFT
      ?auto_24907 - CITY
      ?auto_24904 - FLEVEL
      ?auto_24906 - FLEVEL
      ?auto_24908 - PERSON
    )
    :precondition
    ( and ( IN ?auto_24901 ?auto_24905 ) ( AIRCRAFT-AT ?auto_24905 ?auto_24907 ) ( FUEL-LEVEL ?auto_24905 ?auto_24904 ) ( NEXT ?auto_24906 ?auto_24904 ) ( not ( = ?auto_24900 ?auto_24907 ) ) ( not ( = ?auto_24904 ?auto_24906 ) ) ( PERSON-AT ?auto_24908 ?auto_24900 ) ( not ( = ?auto_24908 ?auto_24901 ) ) ( PERSON-AT ?auto_24902 ?auto_24900 ) ( PERSON-AT ?auto_24903 ?auto_24900 ) ( not ( = ?auto_24901 ?auto_24902 ) ) ( not ( = ?auto_24901 ?auto_24903 ) ) ( not ( = ?auto_24902 ?auto_24903 ) ) ( not ( = ?auto_24902 ?auto_24908 ) ) ( not ( = ?auto_24903 ?auto_24908 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24908 ?auto_24901 ?auto_24900 )
      ( FLY-3PPL-VERIFY ?auto_24901 ?auto_24902 ?auto_24903 ?auto_24900 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_24945 - PERSON
      ?auto_24944 - CITY
    )
    :vars
    (
      ?auto_24947 - AIRCRAFT
      ?auto_24949 - CITY
      ?auto_24946 - FLEVEL
      ?auto_24948 - FLEVEL
      ?auto_24950 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_24947 ?auto_24949 ) ( FUEL-LEVEL ?auto_24947 ?auto_24946 ) ( NEXT ?auto_24948 ?auto_24946 ) ( not ( = ?auto_24944 ?auto_24949 ) ) ( not ( = ?auto_24946 ?auto_24948 ) ) ( PERSON-AT ?auto_24950 ?auto_24944 ) ( not ( = ?auto_24950 ?auto_24945 ) ) ( PERSON-AT ?auto_24945 ?auto_24949 ) )
    :subtasks
    ( ( !BOARD ?auto_24945 ?auto_24947 ?auto_24949 )
      ( FLY-2PPL ?auto_24950 ?auto_24945 ?auto_24944 )
      ( FLY-1PPL-VERIFY ?auto_24945 ?auto_24944 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24952 - PERSON
      ?auto_24953 - PERSON
      ?auto_24951 - CITY
    )
    :vars
    (
      ?auto_24954 - AIRCRAFT
      ?auto_24955 - CITY
      ?auto_24956 - FLEVEL
      ?auto_24957 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_24954 ?auto_24955 ) ( FUEL-LEVEL ?auto_24954 ?auto_24956 ) ( NEXT ?auto_24957 ?auto_24956 ) ( not ( = ?auto_24951 ?auto_24955 ) ) ( not ( = ?auto_24956 ?auto_24957 ) ) ( PERSON-AT ?auto_24952 ?auto_24951 ) ( not ( = ?auto_24952 ?auto_24953 ) ) ( PERSON-AT ?auto_24953 ?auto_24955 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_24953 ?auto_24951 )
      ( FLY-2PPL-VERIFY ?auto_24952 ?auto_24953 ?auto_24951 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24959 - PERSON
      ?auto_24960 - PERSON
      ?auto_24958 - CITY
    )
    :vars
    (
      ?auto_24964 - AIRCRAFT
      ?auto_24962 - CITY
      ?auto_24961 - FLEVEL
      ?auto_24963 - FLEVEL
      ?auto_24965 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_24964 ?auto_24962 ) ( FUEL-LEVEL ?auto_24964 ?auto_24961 ) ( NEXT ?auto_24963 ?auto_24961 ) ( not ( = ?auto_24958 ?auto_24962 ) ) ( not ( = ?auto_24961 ?auto_24963 ) ) ( PERSON-AT ?auto_24965 ?auto_24958 ) ( not ( = ?auto_24965 ?auto_24960 ) ) ( PERSON-AT ?auto_24960 ?auto_24962 ) ( PERSON-AT ?auto_24959 ?auto_24958 ) ( not ( = ?auto_24959 ?auto_24960 ) ) ( not ( = ?auto_24959 ?auto_24965 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24965 ?auto_24960 ?auto_24958 )
      ( FLY-2PPL-VERIFY ?auto_24959 ?auto_24960 ?auto_24958 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24967 - PERSON
      ?auto_24968 - PERSON
      ?auto_24966 - CITY
    )
    :vars
    (
      ?auto_24972 - AIRCRAFT
      ?auto_24970 - CITY
      ?auto_24969 - FLEVEL
      ?auto_24971 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_24972 ?auto_24970 ) ( FUEL-LEVEL ?auto_24972 ?auto_24969 ) ( NEXT ?auto_24971 ?auto_24969 ) ( not ( = ?auto_24966 ?auto_24970 ) ) ( not ( = ?auto_24969 ?auto_24971 ) ) ( PERSON-AT ?auto_24968 ?auto_24966 ) ( not ( = ?auto_24968 ?auto_24967 ) ) ( PERSON-AT ?auto_24967 ?auto_24970 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24968 ?auto_24967 ?auto_24966 )
      ( FLY-2PPL-VERIFY ?auto_24967 ?auto_24968 ?auto_24966 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_24974 - PERSON
      ?auto_24975 - PERSON
      ?auto_24973 - CITY
    )
    :vars
    (
      ?auto_24979 - AIRCRAFT
      ?auto_24977 - CITY
      ?auto_24976 - FLEVEL
      ?auto_24978 - FLEVEL
      ?auto_24980 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_24979 ?auto_24977 ) ( FUEL-LEVEL ?auto_24979 ?auto_24976 ) ( NEXT ?auto_24978 ?auto_24976 ) ( not ( = ?auto_24973 ?auto_24977 ) ) ( not ( = ?auto_24976 ?auto_24978 ) ) ( PERSON-AT ?auto_24980 ?auto_24973 ) ( not ( = ?auto_24980 ?auto_24974 ) ) ( PERSON-AT ?auto_24974 ?auto_24977 ) ( PERSON-AT ?auto_24975 ?auto_24973 ) ( not ( = ?auto_24974 ?auto_24975 ) ) ( not ( = ?auto_24975 ?auto_24980 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24980 ?auto_24974 ?auto_24973 )
      ( FLY-2PPL-VERIFY ?auto_24974 ?auto_24975 ?auto_24973 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24990 - PERSON
      ?auto_24991 - PERSON
      ?auto_24992 - PERSON
      ?auto_24989 - CITY
    )
    :vars
    (
      ?auto_24996 - AIRCRAFT
      ?auto_24994 - CITY
      ?auto_24993 - FLEVEL
      ?auto_24995 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_24996 ?auto_24994 ) ( FUEL-LEVEL ?auto_24996 ?auto_24993 ) ( NEXT ?auto_24995 ?auto_24993 ) ( not ( = ?auto_24989 ?auto_24994 ) ) ( not ( = ?auto_24993 ?auto_24995 ) ) ( PERSON-AT ?auto_24991 ?auto_24989 ) ( not ( = ?auto_24991 ?auto_24992 ) ) ( PERSON-AT ?auto_24992 ?auto_24994 ) ( PERSON-AT ?auto_24990 ?auto_24989 ) ( not ( = ?auto_24990 ?auto_24991 ) ) ( not ( = ?auto_24990 ?auto_24992 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24991 ?auto_24992 ?auto_24989 )
      ( FLY-3PPL-VERIFY ?auto_24990 ?auto_24991 ?auto_24992 ?auto_24989 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_24998 - PERSON
      ?auto_24999 - PERSON
      ?auto_25000 - PERSON
      ?auto_24997 - CITY
    )
    :vars
    (
      ?auto_25004 - AIRCRAFT
      ?auto_25002 - CITY
      ?auto_25001 - FLEVEL
      ?auto_25003 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25004 ?auto_25002 ) ( FUEL-LEVEL ?auto_25004 ?auto_25001 ) ( NEXT ?auto_25003 ?auto_25001 ) ( not ( = ?auto_24997 ?auto_25002 ) ) ( not ( = ?auto_25001 ?auto_25003 ) ) ( PERSON-AT ?auto_24998 ?auto_24997 ) ( not ( = ?auto_24998 ?auto_25000 ) ) ( PERSON-AT ?auto_25000 ?auto_25002 ) ( PERSON-AT ?auto_24999 ?auto_24997 ) ( not ( = ?auto_24998 ?auto_24999 ) ) ( not ( = ?auto_24999 ?auto_25000 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_24998 ?auto_25000 ?auto_24997 )
      ( FLY-3PPL-VERIFY ?auto_24998 ?auto_24999 ?auto_25000 ?auto_24997 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25006 - PERSON
      ?auto_25007 - PERSON
      ?auto_25008 - PERSON
      ?auto_25005 - CITY
    )
    :vars
    (
      ?auto_25012 - AIRCRAFT
      ?auto_25010 - CITY
      ?auto_25009 - FLEVEL
      ?auto_25011 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25012 ?auto_25010 ) ( FUEL-LEVEL ?auto_25012 ?auto_25009 ) ( NEXT ?auto_25011 ?auto_25009 ) ( not ( = ?auto_25005 ?auto_25010 ) ) ( not ( = ?auto_25009 ?auto_25011 ) ) ( PERSON-AT ?auto_25006 ?auto_25005 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( PERSON-AT ?auto_25007 ?auto_25010 ) ( PERSON-AT ?auto_25008 ?auto_25005 ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25008 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25006 ?auto_25007 ?auto_25005 )
      ( FLY-3PPL-VERIFY ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25005 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25014 - PERSON
      ?auto_25015 - PERSON
      ?auto_25016 - PERSON
      ?auto_25013 - CITY
    )
    :vars
    (
      ?auto_25020 - AIRCRAFT
      ?auto_25018 - CITY
      ?auto_25017 - FLEVEL
      ?auto_25019 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25020 ?auto_25018 ) ( FUEL-LEVEL ?auto_25020 ?auto_25017 ) ( NEXT ?auto_25019 ?auto_25017 ) ( not ( = ?auto_25013 ?auto_25018 ) ) ( not ( = ?auto_25017 ?auto_25019 ) ) ( PERSON-AT ?auto_25014 ?auto_25013 ) ( not ( = ?auto_25014 ?auto_25015 ) ) ( PERSON-AT ?auto_25015 ?auto_25018 ) ( PERSON-AT ?auto_25016 ?auto_25013 ) ( not ( = ?auto_25014 ?auto_25016 ) ) ( not ( = ?auto_25015 ?auto_25016 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25014 ?auto_25015 ?auto_25013 )
      ( FLY-3PPL-VERIFY ?auto_25014 ?auto_25015 ?auto_25016 ?auto_25013 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25030 - PERSON
      ?auto_25031 - PERSON
      ?auto_25032 - PERSON
      ?auto_25029 - CITY
    )
    :vars
    (
      ?auto_25036 - AIRCRAFT
      ?auto_25034 - CITY
      ?auto_25033 - FLEVEL
      ?auto_25035 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25036 ?auto_25034 ) ( FUEL-LEVEL ?auto_25036 ?auto_25033 ) ( NEXT ?auto_25035 ?auto_25033 ) ( not ( = ?auto_25029 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( PERSON-AT ?auto_25031 ?auto_25029 ) ( not ( = ?auto_25031 ?auto_25032 ) ) ( PERSON-AT ?auto_25032 ?auto_25034 ) ( PERSON-AT ?auto_25030 ?auto_25029 ) ( not ( = ?auto_25030 ?auto_25031 ) ) ( not ( = ?auto_25030 ?auto_25032 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25031 ?auto_25032 ?auto_25029 )
      ( FLY-3PPL-VERIFY ?auto_25030 ?auto_25031 ?auto_25032 ?auto_25029 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25038 - PERSON
      ?auto_25039 - PERSON
      ?auto_25040 - PERSON
      ?auto_25037 - CITY
    )
    :vars
    (
      ?auto_25044 - AIRCRAFT
      ?auto_25042 - CITY
      ?auto_25041 - FLEVEL
      ?auto_25043 - FLEVEL
      ?auto_25045 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25044 ?auto_25042 ) ( FUEL-LEVEL ?auto_25044 ?auto_25041 ) ( NEXT ?auto_25043 ?auto_25041 ) ( not ( = ?auto_25037 ?auto_25042 ) ) ( not ( = ?auto_25041 ?auto_25043 ) ) ( PERSON-AT ?auto_25045 ?auto_25037 ) ( not ( = ?auto_25045 ?auto_25040 ) ) ( PERSON-AT ?auto_25040 ?auto_25042 ) ( PERSON-AT ?auto_25038 ?auto_25037 ) ( PERSON-AT ?auto_25039 ?auto_25037 ) ( not ( = ?auto_25038 ?auto_25039 ) ) ( not ( = ?auto_25038 ?auto_25040 ) ) ( not ( = ?auto_25038 ?auto_25045 ) ) ( not ( = ?auto_25039 ?auto_25040 ) ) ( not ( = ?auto_25039 ?auto_25045 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25045 ?auto_25040 ?auto_25037 )
      ( FLY-3PPL-VERIFY ?auto_25038 ?auto_25039 ?auto_25040 ?auto_25037 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25047 - PERSON
      ?auto_25048 - PERSON
      ?auto_25049 - PERSON
      ?auto_25046 - CITY
    )
    :vars
    (
      ?auto_25053 - AIRCRAFT
      ?auto_25051 - CITY
      ?auto_25050 - FLEVEL
      ?auto_25052 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25053 ?auto_25051 ) ( FUEL-LEVEL ?auto_25053 ?auto_25050 ) ( NEXT ?auto_25052 ?auto_25050 ) ( not ( = ?auto_25046 ?auto_25051 ) ) ( not ( = ?auto_25050 ?auto_25052 ) ) ( PERSON-AT ?auto_25049 ?auto_25046 ) ( not ( = ?auto_25049 ?auto_25048 ) ) ( PERSON-AT ?auto_25048 ?auto_25051 ) ( PERSON-AT ?auto_25047 ?auto_25046 ) ( not ( = ?auto_25047 ?auto_25048 ) ) ( not ( = ?auto_25047 ?auto_25049 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25049 ?auto_25048 ?auto_25046 )
      ( FLY-3PPL-VERIFY ?auto_25047 ?auto_25048 ?auto_25049 ?auto_25046 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25055 - PERSON
      ?auto_25056 - PERSON
      ?auto_25057 - PERSON
      ?auto_25054 - CITY
    )
    :vars
    (
      ?auto_25061 - AIRCRAFT
      ?auto_25059 - CITY
      ?auto_25058 - FLEVEL
      ?auto_25060 - FLEVEL
      ?auto_25062 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25061 ?auto_25059 ) ( FUEL-LEVEL ?auto_25061 ?auto_25058 ) ( NEXT ?auto_25060 ?auto_25058 ) ( not ( = ?auto_25054 ?auto_25059 ) ) ( not ( = ?auto_25058 ?auto_25060 ) ) ( PERSON-AT ?auto_25062 ?auto_25054 ) ( not ( = ?auto_25062 ?auto_25056 ) ) ( PERSON-AT ?auto_25056 ?auto_25059 ) ( PERSON-AT ?auto_25055 ?auto_25054 ) ( PERSON-AT ?auto_25057 ?auto_25054 ) ( not ( = ?auto_25055 ?auto_25056 ) ) ( not ( = ?auto_25055 ?auto_25057 ) ) ( not ( = ?auto_25055 ?auto_25062 ) ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( not ( = ?auto_25057 ?auto_25062 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25062 ?auto_25056 ?auto_25054 )
      ( FLY-3PPL-VERIFY ?auto_25055 ?auto_25056 ?auto_25057 ?auto_25054 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25073 - PERSON
      ?auto_25074 - PERSON
      ?auto_25075 - PERSON
      ?auto_25072 - CITY
    )
    :vars
    (
      ?auto_25079 - AIRCRAFT
      ?auto_25077 - CITY
      ?auto_25076 - FLEVEL
      ?auto_25078 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25079 ?auto_25077 ) ( FUEL-LEVEL ?auto_25079 ?auto_25076 ) ( NEXT ?auto_25078 ?auto_25076 ) ( not ( = ?auto_25072 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( PERSON-AT ?auto_25074 ?auto_25072 ) ( not ( = ?auto_25074 ?auto_25073 ) ) ( PERSON-AT ?auto_25073 ?auto_25077 ) ( PERSON-AT ?auto_25075 ?auto_25072 ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25075 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25074 ?auto_25073 ?auto_25072 )
      ( FLY-3PPL-VERIFY ?auto_25073 ?auto_25074 ?auto_25075 ?auto_25072 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25081 - PERSON
      ?auto_25082 - PERSON
      ?auto_25083 - PERSON
      ?auto_25080 - CITY
    )
    :vars
    (
      ?auto_25087 - AIRCRAFT
      ?auto_25085 - CITY
      ?auto_25084 - FLEVEL
      ?auto_25086 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25087 ?auto_25085 ) ( FUEL-LEVEL ?auto_25087 ?auto_25084 ) ( NEXT ?auto_25086 ?auto_25084 ) ( not ( = ?auto_25080 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( PERSON-AT ?auto_25082 ?auto_25080 ) ( not ( = ?auto_25082 ?auto_25081 ) ) ( PERSON-AT ?auto_25081 ?auto_25085 ) ( PERSON-AT ?auto_25083 ?auto_25080 ) ( not ( = ?auto_25081 ?auto_25083 ) ) ( not ( = ?auto_25082 ?auto_25083 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25082 ?auto_25081 ?auto_25080 )
      ( FLY-3PPL-VERIFY ?auto_25081 ?auto_25082 ?auto_25083 ?auto_25080 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25097 - PERSON
      ?auto_25098 - PERSON
      ?auto_25099 - PERSON
      ?auto_25096 - CITY
    )
    :vars
    (
      ?auto_25103 - AIRCRAFT
      ?auto_25101 - CITY
      ?auto_25100 - FLEVEL
      ?auto_25102 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25103 ?auto_25101 ) ( FUEL-LEVEL ?auto_25103 ?auto_25100 ) ( NEXT ?auto_25102 ?auto_25100 ) ( not ( = ?auto_25096 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25102 ) ) ( PERSON-AT ?auto_25099 ?auto_25096 ) ( not ( = ?auto_25099 ?auto_25097 ) ) ( PERSON-AT ?auto_25097 ?auto_25101 ) ( PERSON-AT ?auto_25098 ?auto_25096 ) ( not ( = ?auto_25097 ?auto_25098 ) ) ( not ( = ?auto_25098 ?auto_25099 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25099 ?auto_25097 ?auto_25096 )
      ( FLY-3PPL-VERIFY ?auto_25097 ?auto_25098 ?auto_25099 ?auto_25096 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25105 - PERSON
      ?auto_25106 - PERSON
      ?auto_25107 - PERSON
      ?auto_25104 - CITY
    )
    :vars
    (
      ?auto_25111 - AIRCRAFT
      ?auto_25109 - CITY
      ?auto_25108 - FLEVEL
      ?auto_25110 - FLEVEL
      ?auto_25112 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25111 ?auto_25109 ) ( FUEL-LEVEL ?auto_25111 ?auto_25108 ) ( NEXT ?auto_25110 ?auto_25108 ) ( not ( = ?auto_25104 ?auto_25109 ) ) ( not ( = ?auto_25108 ?auto_25110 ) ) ( PERSON-AT ?auto_25112 ?auto_25104 ) ( not ( = ?auto_25112 ?auto_25105 ) ) ( PERSON-AT ?auto_25105 ?auto_25109 ) ( PERSON-AT ?auto_25106 ?auto_25104 ) ( PERSON-AT ?auto_25107 ?auto_25104 ) ( not ( = ?auto_25105 ?auto_25106 ) ) ( not ( = ?auto_25105 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25112 ) ) ( not ( = ?auto_25107 ?auto_25112 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25112 ?auto_25105 ?auto_25104 )
      ( FLY-3PPL-VERIFY ?auto_25105 ?auto_25106 ?auto_25107 ?auto_25104 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_25149 - PERSON
      ?auto_25148 - CITY
    )
    :vars
    (
      ?auto_25153 - AIRCRAFT
      ?auto_25151 - CITY
      ?auto_25152 - FLEVEL
      ?auto_25150 - FLEVEL
      ?auto_25154 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25153 ?auto_25151 ) ( NEXT ?auto_25152 ?auto_25150 ) ( not ( = ?auto_25148 ?auto_25151 ) ) ( not ( = ?auto_25150 ?auto_25152 ) ) ( PERSON-AT ?auto_25154 ?auto_25148 ) ( not ( = ?auto_25154 ?auto_25149 ) ) ( PERSON-AT ?auto_25149 ?auto_25151 ) ( FUEL-LEVEL ?auto_25153 ?auto_25152 ) )
    :subtasks
    ( ( !REFUEL ?auto_25153 ?auto_25151 ?auto_25152 ?auto_25150 )
      ( FLY-2PPL ?auto_25154 ?auto_25149 ?auto_25148 )
      ( FLY-1PPL-VERIFY ?auto_25149 ?auto_25148 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25156 - PERSON
      ?auto_25157 - PERSON
      ?auto_25155 - CITY
    )
    :vars
    (
      ?auto_25161 - AIRCRAFT
      ?auto_25158 - CITY
      ?auto_25160 - FLEVEL
      ?auto_25159 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25161 ?auto_25158 ) ( NEXT ?auto_25160 ?auto_25159 ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25159 ?auto_25160 ) ) ( PERSON-AT ?auto_25156 ?auto_25155 ) ( not ( = ?auto_25156 ?auto_25157 ) ) ( PERSON-AT ?auto_25157 ?auto_25158 ) ( FUEL-LEVEL ?auto_25161 ?auto_25160 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_25157 ?auto_25155 )
      ( FLY-2PPL-VERIFY ?auto_25156 ?auto_25157 ?auto_25155 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25163 - PERSON
      ?auto_25164 - PERSON
      ?auto_25162 - CITY
    )
    :vars
    (
      ?auto_25168 - AIRCRAFT
      ?auto_25166 - CITY
      ?auto_25169 - FLEVEL
      ?auto_25165 - FLEVEL
      ?auto_25167 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25168 ?auto_25166 ) ( NEXT ?auto_25169 ?auto_25165 ) ( not ( = ?auto_25162 ?auto_25166 ) ) ( not ( = ?auto_25165 ?auto_25169 ) ) ( PERSON-AT ?auto_25167 ?auto_25162 ) ( not ( = ?auto_25167 ?auto_25164 ) ) ( PERSON-AT ?auto_25164 ?auto_25166 ) ( FUEL-LEVEL ?auto_25168 ?auto_25169 ) ( PERSON-AT ?auto_25163 ?auto_25162 ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25163 ?auto_25167 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25167 ?auto_25164 ?auto_25162 )
      ( FLY-2PPL-VERIFY ?auto_25163 ?auto_25164 ?auto_25162 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25171 - PERSON
      ?auto_25172 - PERSON
      ?auto_25170 - CITY
    )
    :vars
    (
      ?auto_25175 - AIRCRAFT
      ?auto_25174 - CITY
      ?auto_25176 - FLEVEL
      ?auto_25173 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25175 ?auto_25174 ) ( NEXT ?auto_25176 ?auto_25173 ) ( not ( = ?auto_25170 ?auto_25174 ) ) ( not ( = ?auto_25173 ?auto_25176 ) ) ( PERSON-AT ?auto_25172 ?auto_25170 ) ( not ( = ?auto_25172 ?auto_25171 ) ) ( PERSON-AT ?auto_25171 ?auto_25174 ) ( FUEL-LEVEL ?auto_25175 ?auto_25176 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25172 ?auto_25171 ?auto_25170 )
      ( FLY-2PPL-VERIFY ?auto_25171 ?auto_25172 ?auto_25170 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25178 - PERSON
      ?auto_25179 - PERSON
      ?auto_25177 - CITY
    )
    :vars
    (
      ?auto_25183 - AIRCRAFT
      ?auto_25181 - CITY
      ?auto_25184 - FLEVEL
      ?auto_25180 - FLEVEL
      ?auto_25182 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25183 ?auto_25181 ) ( NEXT ?auto_25184 ?auto_25180 ) ( not ( = ?auto_25177 ?auto_25181 ) ) ( not ( = ?auto_25180 ?auto_25184 ) ) ( PERSON-AT ?auto_25182 ?auto_25177 ) ( not ( = ?auto_25182 ?auto_25178 ) ) ( PERSON-AT ?auto_25178 ?auto_25181 ) ( FUEL-LEVEL ?auto_25183 ?auto_25184 ) ( PERSON-AT ?auto_25179 ?auto_25177 ) ( not ( = ?auto_25178 ?auto_25179 ) ) ( not ( = ?auto_25179 ?auto_25182 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25182 ?auto_25178 ?auto_25177 )
      ( FLY-2PPL-VERIFY ?auto_25178 ?auto_25179 ?auto_25177 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25194 - PERSON
      ?auto_25195 - PERSON
      ?auto_25196 - PERSON
      ?auto_25193 - CITY
    )
    :vars
    (
      ?auto_25199 - AIRCRAFT
      ?auto_25198 - CITY
      ?auto_25200 - FLEVEL
      ?auto_25197 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25199 ?auto_25198 ) ( NEXT ?auto_25200 ?auto_25197 ) ( not ( = ?auto_25193 ?auto_25198 ) ) ( not ( = ?auto_25197 ?auto_25200 ) ) ( PERSON-AT ?auto_25195 ?auto_25193 ) ( not ( = ?auto_25195 ?auto_25196 ) ) ( PERSON-AT ?auto_25196 ?auto_25198 ) ( FUEL-LEVEL ?auto_25199 ?auto_25200 ) ( PERSON-AT ?auto_25194 ?auto_25193 ) ( not ( = ?auto_25194 ?auto_25195 ) ) ( not ( = ?auto_25194 ?auto_25196 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25195 ?auto_25196 ?auto_25193 )
      ( FLY-3PPL-VERIFY ?auto_25194 ?auto_25195 ?auto_25196 ?auto_25193 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25202 - PERSON
      ?auto_25203 - PERSON
      ?auto_25204 - PERSON
      ?auto_25201 - CITY
    )
    :vars
    (
      ?auto_25207 - AIRCRAFT
      ?auto_25206 - CITY
      ?auto_25208 - FLEVEL
      ?auto_25205 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25207 ?auto_25206 ) ( NEXT ?auto_25208 ?auto_25205 ) ( not ( = ?auto_25201 ?auto_25206 ) ) ( not ( = ?auto_25205 ?auto_25208 ) ) ( PERSON-AT ?auto_25202 ?auto_25201 ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( PERSON-AT ?auto_25204 ?auto_25206 ) ( FUEL-LEVEL ?auto_25207 ?auto_25208 ) ( PERSON-AT ?auto_25203 ?auto_25201 ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25203 ?auto_25204 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25202 ?auto_25204 ?auto_25201 )
      ( FLY-3PPL-VERIFY ?auto_25202 ?auto_25203 ?auto_25204 ?auto_25201 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25210 - PERSON
      ?auto_25211 - PERSON
      ?auto_25212 - PERSON
      ?auto_25209 - CITY
    )
    :vars
    (
      ?auto_25215 - AIRCRAFT
      ?auto_25214 - CITY
      ?auto_25216 - FLEVEL
      ?auto_25213 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25215 ?auto_25214 ) ( NEXT ?auto_25216 ?auto_25213 ) ( not ( = ?auto_25209 ?auto_25214 ) ) ( not ( = ?auto_25213 ?auto_25216 ) ) ( PERSON-AT ?auto_25212 ?auto_25209 ) ( not ( = ?auto_25212 ?auto_25211 ) ) ( PERSON-AT ?auto_25211 ?auto_25214 ) ( FUEL-LEVEL ?auto_25215 ?auto_25216 ) ( PERSON-AT ?auto_25210 ?auto_25209 ) ( not ( = ?auto_25210 ?auto_25211 ) ) ( not ( = ?auto_25210 ?auto_25212 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25212 ?auto_25211 ?auto_25209 )
      ( FLY-3PPL-VERIFY ?auto_25210 ?auto_25211 ?auto_25212 ?auto_25209 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25218 - PERSON
      ?auto_25219 - PERSON
      ?auto_25220 - PERSON
      ?auto_25217 - CITY
    )
    :vars
    (
      ?auto_25223 - AIRCRAFT
      ?auto_25222 - CITY
      ?auto_25224 - FLEVEL
      ?auto_25221 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25223 ?auto_25222 ) ( NEXT ?auto_25224 ?auto_25221 ) ( not ( = ?auto_25217 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25224 ) ) ( PERSON-AT ?auto_25218 ?auto_25217 ) ( not ( = ?auto_25218 ?auto_25219 ) ) ( PERSON-AT ?auto_25219 ?auto_25222 ) ( FUEL-LEVEL ?auto_25223 ?auto_25224 ) ( PERSON-AT ?auto_25220 ?auto_25217 ) ( not ( = ?auto_25218 ?auto_25220 ) ) ( not ( = ?auto_25219 ?auto_25220 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25218 ?auto_25219 ?auto_25217 )
      ( FLY-3PPL-VERIFY ?auto_25218 ?auto_25219 ?auto_25220 ?auto_25217 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25234 - PERSON
      ?auto_25235 - PERSON
      ?auto_25236 - PERSON
      ?auto_25233 - CITY
    )
    :vars
    (
      ?auto_25239 - AIRCRAFT
      ?auto_25238 - CITY
      ?auto_25240 - FLEVEL
      ?auto_25237 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25239 ?auto_25238 ) ( NEXT ?auto_25240 ?auto_25237 ) ( not ( = ?auto_25233 ?auto_25238 ) ) ( not ( = ?auto_25237 ?auto_25240 ) ) ( PERSON-AT ?auto_25235 ?auto_25233 ) ( not ( = ?auto_25235 ?auto_25236 ) ) ( PERSON-AT ?auto_25236 ?auto_25238 ) ( FUEL-LEVEL ?auto_25239 ?auto_25240 ) ( PERSON-AT ?auto_25234 ?auto_25233 ) ( not ( = ?auto_25234 ?auto_25235 ) ) ( not ( = ?auto_25234 ?auto_25236 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25235 ?auto_25236 ?auto_25233 )
      ( FLY-3PPL-VERIFY ?auto_25234 ?auto_25235 ?auto_25236 ?auto_25233 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25242 - PERSON
      ?auto_25243 - PERSON
      ?auto_25244 - PERSON
      ?auto_25241 - CITY
    )
    :vars
    (
      ?auto_25248 - AIRCRAFT
      ?auto_25246 - CITY
      ?auto_25249 - FLEVEL
      ?auto_25245 - FLEVEL
      ?auto_25247 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25248 ?auto_25246 ) ( NEXT ?auto_25249 ?auto_25245 ) ( not ( = ?auto_25241 ?auto_25246 ) ) ( not ( = ?auto_25245 ?auto_25249 ) ) ( PERSON-AT ?auto_25247 ?auto_25241 ) ( not ( = ?auto_25247 ?auto_25244 ) ) ( PERSON-AT ?auto_25244 ?auto_25246 ) ( FUEL-LEVEL ?auto_25248 ?auto_25249 ) ( PERSON-AT ?auto_25242 ?auto_25241 ) ( PERSON-AT ?auto_25243 ?auto_25241 ) ( not ( = ?auto_25242 ?auto_25243 ) ) ( not ( = ?auto_25242 ?auto_25244 ) ) ( not ( = ?auto_25242 ?auto_25247 ) ) ( not ( = ?auto_25243 ?auto_25244 ) ) ( not ( = ?auto_25243 ?auto_25247 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25247 ?auto_25244 ?auto_25241 )
      ( FLY-3PPL-VERIFY ?auto_25242 ?auto_25243 ?auto_25244 ?auto_25241 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25251 - PERSON
      ?auto_25252 - PERSON
      ?auto_25253 - PERSON
      ?auto_25250 - CITY
    )
    :vars
    (
      ?auto_25256 - AIRCRAFT
      ?auto_25255 - CITY
      ?auto_25257 - FLEVEL
      ?auto_25254 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25256 ?auto_25255 ) ( NEXT ?auto_25257 ?auto_25254 ) ( not ( = ?auto_25250 ?auto_25255 ) ) ( not ( = ?auto_25254 ?auto_25257 ) ) ( PERSON-AT ?auto_25253 ?auto_25250 ) ( not ( = ?auto_25253 ?auto_25252 ) ) ( PERSON-AT ?auto_25252 ?auto_25255 ) ( FUEL-LEVEL ?auto_25256 ?auto_25257 ) ( PERSON-AT ?auto_25251 ?auto_25250 ) ( not ( = ?auto_25251 ?auto_25252 ) ) ( not ( = ?auto_25251 ?auto_25253 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25253 ?auto_25252 ?auto_25250 )
      ( FLY-3PPL-VERIFY ?auto_25251 ?auto_25252 ?auto_25253 ?auto_25250 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25259 - PERSON
      ?auto_25260 - PERSON
      ?auto_25261 - PERSON
      ?auto_25258 - CITY
    )
    :vars
    (
      ?auto_25265 - AIRCRAFT
      ?auto_25263 - CITY
      ?auto_25266 - FLEVEL
      ?auto_25262 - FLEVEL
      ?auto_25264 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25265 ?auto_25263 ) ( NEXT ?auto_25266 ?auto_25262 ) ( not ( = ?auto_25258 ?auto_25263 ) ) ( not ( = ?auto_25262 ?auto_25266 ) ) ( PERSON-AT ?auto_25264 ?auto_25258 ) ( not ( = ?auto_25264 ?auto_25260 ) ) ( PERSON-AT ?auto_25260 ?auto_25263 ) ( FUEL-LEVEL ?auto_25265 ?auto_25266 ) ( PERSON-AT ?auto_25259 ?auto_25258 ) ( PERSON-AT ?auto_25261 ?auto_25258 ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( not ( = ?auto_25259 ?auto_25261 ) ) ( not ( = ?auto_25259 ?auto_25264 ) ) ( not ( = ?auto_25260 ?auto_25261 ) ) ( not ( = ?auto_25261 ?auto_25264 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25264 ?auto_25260 ?auto_25258 )
      ( FLY-3PPL-VERIFY ?auto_25259 ?auto_25260 ?auto_25261 ?auto_25258 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25277 - PERSON
      ?auto_25278 - PERSON
      ?auto_25279 - PERSON
      ?auto_25276 - CITY
    )
    :vars
    (
      ?auto_25282 - AIRCRAFT
      ?auto_25281 - CITY
      ?auto_25283 - FLEVEL
      ?auto_25280 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25282 ?auto_25281 ) ( NEXT ?auto_25283 ?auto_25280 ) ( not ( = ?auto_25276 ?auto_25281 ) ) ( not ( = ?auto_25280 ?auto_25283 ) ) ( PERSON-AT ?auto_25278 ?auto_25276 ) ( not ( = ?auto_25278 ?auto_25277 ) ) ( PERSON-AT ?auto_25277 ?auto_25281 ) ( FUEL-LEVEL ?auto_25282 ?auto_25283 ) ( PERSON-AT ?auto_25279 ?auto_25276 ) ( not ( = ?auto_25277 ?auto_25279 ) ) ( not ( = ?auto_25278 ?auto_25279 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25278 ?auto_25277 ?auto_25276 )
      ( FLY-3PPL-VERIFY ?auto_25277 ?auto_25278 ?auto_25279 ?auto_25276 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25285 - PERSON
      ?auto_25286 - PERSON
      ?auto_25287 - PERSON
      ?auto_25284 - CITY
    )
    :vars
    (
      ?auto_25290 - AIRCRAFT
      ?auto_25289 - CITY
      ?auto_25291 - FLEVEL
      ?auto_25288 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25290 ?auto_25289 ) ( NEXT ?auto_25291 ?auto_25288 ) ( not ( = ?auto_25284 ?auto_25289 ) ) ( not ( = ?auto_25288 ?auto_25291 ) ) ( PERSON-AT ?auto_25286 ?auto_25284 ) ( not ( = ?auto_25286 ?auto_25285 ) ) ( PERSON-AT ?auto_25285 ?auto_25289 ) ( FUEL-LEVEL ?auto_25290 ?auto_25291 ) ( PERSON-AT ?auto_25287 ?auto_25284 ) ( not ( = ?auto_25285 ?auto_25287 ) ) ( not ( = ?auto_25286 ?auto_25287 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25286 ?auto_25285 ?auto_25284 )
      ( FLY-3PPL-VERIFY ?auto_25285 ?auto_25286 ?auto_25287 ?auto_25284 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25301 - PERSON
      ?auto_25302 - PERSON
      ?auto_25303 - PERSON
      ?auto_25300 - CITY
    )
    :vars
    (
      ?auto_25306 - AIRCRAFT
      ?auto_25305 - CITY
      ?auto_25307 - FLEVEL
      ?auto_25304 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25306 ?auto_25305 ) ( NEXT ?auto_25307 ?auto_25304 ) ( not ( = ?auto_25300 ?auto_25305 ) ) ( not ( = ?auto_25304 ?auto_25307 ) ) ( PERSON-AT ?auto_25303 ?auto_25300 ) ( not ( = ?auto_25303 ?auto_25301 ) ) ( PERSON-AT ?auto_25301 ?auto_25305 ) ( FUEL-LEVEL ?auto_25306 ?auto_25307 ) ( PERSON-AT ?auto_25302 ?auto_25300 ) ( not ( = ?auto_25301 ?auto_25302 ) ) ( not ( = ?auto_25302 ?auto_25303 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25303 ?auto_25301 ?auto_25300 )
      ( FLY-3PPL-VERIFY ?auto_25301 ?auto_25302 ?auto_25303 ?auto_25300 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25309 - PERSON
      ?auto_25310 - PERSON
      ?auto_25311 - PERSON
      ?auto_25308 - CITY
    )
    :vars
    (
      ?auto_25315 - AIRCRAFT
      ?auto_25313 - CITY
      ?auto_25316 - FLEVEL
      ?auto_25312 - FLEVEL
      ?auto_25314 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25315 ?auto_25313 ) ( NEXT ?auto_25316 ?auto_25312 ) ( not ( = ?auto_25308 ?auto_25313 ) ) ( not ( = ?auto_25312 ?auto_25316 ) ) ( PERSON-AT ?auto_25314 ?auto_25308 ) ( not ( = ?auto_25314 ?auto_25309 ) ) ( PERSON-AT ?auto_25309 ?auto_25313 ) ( FUEL-LEVEL ?auto_25315 ?auto_25316 ) ( PERSON-AT ?auto_25310 ?auto_25308 ) ( PERSON-AT ?auto_25311 ?auto_25308 ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( not ( = ?auto_25309 ?auto_25311 ) ) ( not ( = ?auto_25310 ?auto_25311 ) ) ( not ( = ?auto_25310 ?auto_25314 ) ) ( not ( = ?auto_25311 ?auto_25314 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25314 ?auto_25309 ?auto_25308 )
      ( FLY-3PPL-VERIFY ?auto_25309 ?auto_25310 ?auto_25311 ?auto_25308 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_25353 - PERSON
      ?auto_25352 - CITY
    )
    :vars
    (
      ?auto_25358 - FLEVEL
      ?auto_25354 - FLEVEL
      ?auto_25355 - CITY
      ?auto_25356 - PERSON
      ?auto_25357 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25358 ?auto_25354 ) ( not ( = ?auto_25352 ?auto_25355 ) ) ( not ( = ?auto_25354 ?auto_25358 ) ) ( PERSON-AT ?auto_25356 ?auto_25352 ) ( not ( = ?auto_25356 ?auto_25353 ) ) ( PERSON-AT ?auto_25353 ?auto_25355 ) ( AIRCRAFT-AT ?auto_25357 ?auto_25352 ) ( FUEL-LEVEL ?auto_25357 ?auto_25354 ) )
    :subtasks
    ( ( !FLY ?auto_25357 ?auto_25352 ?auto_25355 ?auto_25354 ?auto_25358 )
      ( FLY-2PPL ?auto_25356 ?auto_25353 ?auto_25352 )
      ( FLY-1PPL-VERIFY ?auto_25353 ?auto_25352 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25360 - PERSON
      ?auto_25361 - PERSON
      ?auto_25359 - CITY
    )
    :vars
    (
      ?auto_25362 - FLEVEL
      ?auto_25363 - FLEVEL
      ?auto_25364 - CITY
      ?auto_25365 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25362 ?auto_25363 ) ( not ( = ?auto_25359 ?auto_25364 ) ) ( not ( = ?auto_25363 ?auto_25362 ) ) ( PERSON-AT ?auto_25360 ?auto_25359 ) ( not ( = ?auto_25360 ?auto_25361 ) ) ( PERSON-AT ?auto_25361 ?auto_25364 ) ( AIRCRAFT-AT ?auto_25365 ?auto_25359 ) ( FUEL-LEVEL ?auto_25365 ?auto_25363 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_25361 ?auto_25359 )
      ( FLY-2PPL-VERIFY ?auto_25360 ?auto_25361 ?auto_25359 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25367 - PERSON
      ?auto_25368 - PERSON
      ?auto_25366 - CITY
    )
    :vars
    (
      ?auto_25371 - FLEVEL
      ?auto_25369 - FLEVEL
      ?auto_25372 - CITY
      ?auto_25373 - PERSON
      ?auto_25370 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25371 ?auto_25369 ) ( not ( = ?auto_25366 ?auto_25372 ) ) ( not ( = ?auto_25369 ?auto_25371 ) ) ( PERSON-AT ?auto_25373 ?auto_25366 ) ( not ( = ?auto_25373 ?auto_25368 ) ) ( PERSON-AT ?auto_25368 ?auto_25372 ) ( AIRCRAFT-AT ?auto_25370 ?auto_25366 ) ( FUEL-LEVEL ?auto_25370 ?auto_25369 ) ( PERSON-AT ?auto_25367 ?auto_25366 ) ( not ( = ?auto_25367 ?auto_25368 ) ) ( not ( = ?auto_25367 ?auto_25373 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25373 ?auto_25368 ?auto_25366 )
      ( FLY-2PPL-VERIFY ?auto_25367 ?auto_25368 ?auto_25366 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25375 - PERSON
      ?auto_25376 - PERSON
      ?auto_25374 - CITY
    )
    :vars
    (
      ?auto_25379 - FLEVEL
      ?auto_25377 - FLEVEL
      ?auto_25380 - CITY
      ?auto_25378 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25379 ?auto_25377 ) ( not ( = ?auto_25374 ?auto_25380 ) ) ( not ( = ?auto_25377 ?auto_25379 ) ) ( PERSON-AT ?auto_25376 ?auto_25374 ) ( not ( = ?auto_25376 ?auto_25375 ) ) ( PERSON-AT ?auto_25375 ?auto_25380 ) ( AIRCRAFT-AT ?auto_25378 ?auto_25374 ) ( FUEL-LEVEL ?auto_25378 ?auto_25377 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25376 ?auto_25375 ?auto_25374 )
      ( FLY-2PPL-VERIFY ?auto_25375 ?auto_25376 ?auto_25374 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25382 - PERSON
      ?auto_25383 - PERSON
      ?auto_25381 - CITY
    )
    :vars
    (
      ?auto_25386 - FLEVEL
      ?auto_25384 - FLEVEL
      ?auto_25387 - CITY
      ?auto_25388 - PERSON
      ?auto_25385 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25386 ?auto_25384 ) ( not ( = ?auto_25381 ?auto_25387 ) ) ( not ( = ?auto_25384 ?auto_25386 ) ) ( PERSON-AT ?auto_25388 ?auto_25381 ) ( not ( = ?auto_25388 ?auto_25382 ) ) ( PERSON-AT ?auto_25382 ?auto_25387 ) ( AIRCRAFT-AT ?auto_25385 ?auto_25381 ) ( FUEL-LEVEL ?auto_25385 ?auto_25384 ) ( PERSON-AT ?auto_25383 ?auto_25381 ) ( not ( = ?auto_25382 ?auto_25383 ) ) ( not ( = ?auto_25383 ?auto_25388 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25388 ?auto_25382 ?auto_25381 )
      ( FLY-2PPL-VERIFY ?auto_25382 ?auto_25383 ?auto_25381 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25398 - PERSON
      ?auto_25399 - PERSON
      ?auto_25400 - PERSON
      ?auto_25397 - CITY
    )
    :vars
    (
      ?auto_25403 - FLEVEL
      ?auto_25401 - FLEVEL
      ?auto_25404 - CITY
      ?auto_25402 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25403 ?auto_25401 ) ( not ( = ?auto_25397 ?auto_25404 ) ) ( not ( = ?auto_25401 ?auto_25403 ) ) ( PERSON-AT ?auto_25399 ?auto_25397 ) ( not ( = ?auto_25399 ?auto_25400 ) ) ( PERSON-AT ?auto_25400 ?auto_25404 ) ( AIRCRAFT-AT ?auto_25402 ?auto_25397 ) ( FUEL-LEVEL ?auto_25402 ?auto_25401 ) ( PERSON-AT ?auto_25398 ?auto_25397 ) ( not ( = ?auto_25398 ?auto_25399 ) ) ( not ( = ?auto_25398 ?auto_25400 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25399 ?auto_25400 ?auto_25397 )
      ( FLY-3PPL-VERIFY ?auto_25398 ?auto_25399 ?auto_25400 ?auto_25397 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25406 - PERSON
      ?auto_25407 - PERSON
      ?auto_25408 - PERSON
      ?auto_25405 - CITY
    )
    :vars
    (
      ?auto_25411 - FLEVEL
      ?auto_25409 - FLEVEL
      ?auto_25412 - CITY
      ?auto_25410 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25411 ?auto_25409 ) ( not ( = ?auto_25405 ?auto_25412 ) ) ( not ( = ?auto_25409 ?auto_25411 ) ) ( PERSON-AT ?auto_25406 ?auto_25405 ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( PERSON-AT ?auto_25408 ?auto_25412 ) ( AIRCRAFT-AT ?auto_25410 ?auto_25405 ) ( FUEL-LEVEL ?auto_25410 ?auto_25409 ) ( PERSON-AT ?auto_25407 ?auto_25405 ) ( not ( = ?auto_25406 ?auto_25407 ) ) ( not ( = ?auto_25407 ?auto_25408 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25406 ?auto_25408 ?auto_25405 )
      ( FLY-3PPL-VERIFY ?auto_25406 ?auto_25407 ?auto_25408 ?auto_25405 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25414 - PERSON
      ?auto_25415 - PERSON
      ?auto_25416 - PERSON
      ?auto_25413 - CITY
    )
    :vars
    (
      ?auto_25419 - FLEVEL
      ?auto_25417 - FLEVEL
      ?auto_25420 - CITY
      ?auto_25418 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25419 ?auto_25417 ) ( not ( = ?auto_25413 ?auto_25420 ) ) ( not ( = ?auto_25417 ?auto_25419 ) ) ( PERSON-AT ?auto_25416 ?auto_25413 ) ( not ( = ?auto_25416 ?auto_25415 ) ) ( PERSON-AT ?auto_25415 ?auto_25420 ) ( AIRCRAFT-AT ?auto_25418 ?auto_25413 ) ( FUEL-LEVEL ?auto_25418 ?auto_25417 ) ( PERSON-AT ?auto_25414 ?auto_25413 ) ( not ( = ?auto_25414 ?auto_25415 ) ) ( not ( = ?auto_25414 ?auto_25416 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25416 ?auto_25415 ?auto_25413 )
      ( FLY-3PPL-VERIFY ?auto_25414 ?auto_25415 ?auto_25416 ?auto_25413 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25422 - PERSON
      ?auto_25423 - PERSON
      ?auto_25424 - PERSON
      ?auto_25421 - CITY
    )
    :vars
    (
      ?auto_25427 - FLEVEL
      ?auto_25425 - FLEVEL
      ?auto_25428 - CITY
      ?auto_25426 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25427 ?auto_25425 ) ( not ( = ?auto_25421 ?auto_25428 ) ) ( not ( = ?auto_25425 ?auto_25427 ) ) ( PERSON-AT ?auto_25422 ?auto_25421 ) ( not ( = ?auto_25422 ?auto_25423 ) ) ( PERSON-AT ?auto_25423 ?auto_25428 ) ( AIRCRAFT-AT ?auto_25426 ?auto_25421 ) ( FUEL-LEVEL ?auto_25426 ?auto_25425 ) ( PERSON-AT ?auto_25424 ?auto_25421 ) ( not ( = ?auto_25422 ?auto_25424 ) ) ( not ( = ?auto_25423 ?auto_25424 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25422 ?auto_25423 ?auto_25421 )
      ( FLY-3PPL-VERIFY ?auto_25422 ?auto_25423 ?auto_25424 ?auto_25421 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25438 - PERSON
      ?auto_25439 - PERSON
      ?auto_25440 - PERSON
      ?auto_25437 - CITY
    )
    :vars
    (
      ?auto_25443 - FLEVEL
      ?auto_25441 - FLEVEL
      ?auto_25444 - CITY
      ?auto_25442 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25443 ?auto_25441 ) ( not ( = ?auto_25437 ?auto_25444 ) ) ( not ( = ?auto_25441 ?auto_25443 ) ) ( PERSON-AT ?auto_25439 ?auto_25437 ) ( not ( = ?auto_25439 ?auto_25440 ) ) ( PERSON-AT ?auto_25440 ?auto_25444 ) ( AIRCRAFT-AT ?auto_25442 ?auto_25437 ) ( FUEL-LEVEL ?auto_25442 ?auto_25441 ) ( PERSON-AT ?auto_25438 ?auto_25437 ) ( not ( = ?auto_25438 ?auto_25439 ) ) ( not ( = ?auto_25438 ?auto_25440 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25439 ?auto_25440 ?auto_25437 )
      ( FLY-3PPL-VERIFY ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25437 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25446 - PERSON
      ?auto_25447 - PERSON
      ?auto_25448 - PERSON
      ?auto_25445 - CITY
    )
    :vars
    (
      ?auto_25451 - FLEVEL
      ?auto_25449 - FLEVEL
      ?auto_25452 - CITY
      ?auto_25453 - PERSON
      ?auto_25450 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25451 ?auto_25449 ) ( not ( = ?auto_25445 ?auto_25452 ) ) ( not ( = ?auto_25449 ?auto_25451 ) ) ( PERSON-AT ?auto_25453 ?auto_25445 ) ( not ( = ?auto_25453 ?auto_25448 ) ) ( PERSON-AT ?auto_25448 ?auto_25452 ) ( AIRCRAFT-AT ?auto_25450 ?auto_25445 ) ( FUEL-LEVEL ?auto_25450 ?auto_25449 ) ( PERSON-AT ?auto_25446 ?auto_25445 ) ( PERSON-AT ?auto_25447 ?auto_25445 ) ( not ( = ?auto_25446 ?auto_25447 ) ) ( not ( = ?auto_25446 ?auto_25448 ) ) ( not ( = ?auto_25446 ?auto_25453 ) ) ( not ( = ?auto_25447 ?auto_25448 ) ) ( not ( = ?auto_25447 ?auto_25453 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25453 ?auto_25448 ?auto_25445 )
      ( FLY-3PPL-VERIFY ?auto_25446 ?auto_25447 ?auto_25448 ?auto_25445 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25455 - PERSON
      ?auto_25456 - PERSON
      ?auto_25457 - PERSON
      ?auto_25454 - CITY
    )
    :vars
    (
      ?auto_25460 - FLEVEL
      ?auto_25458 - FLEVEL
      ?auto_25461 - CITY
      ?auto_25459 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25460 ?auto_25458 ) ( not ( = ?auto_25454 ?auto_25461 ) ) ( not ( = ?auto_25458 ?auto_25460 ) ) ( PERSON-AT ?auto_25457 ?auto_25454 ) ( not ( = ?auto_25457 ?auto_25456 ) ) ( PERSON-AT ?auto_25456 ?auto_25461 ) ( AIRCRAFT-AT ?auto_25459 ?auto_25454 ) ( FUEL-LEVEL ?auto_25459 ?auto_25458 ) ( PERSON-AT ?auto_25455 ?auto_25454 ) ( not ( = ?auto_25455 ?auto_25456 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25457 ?auto_25456 ?auto_25454 )
      ( FLY-3PPL-VERIFY ?auto_25455 ?auto_25456 ?auto_25457 ?auto_25454 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25463 - PERSON
      ?auto_25464 - PERSON
      ?auto_25465 - PERSON
      ?auto_25462 - CITY
    )
    :vars
    (
      ?auto_25468 - FLEVEL
      ?auto_25466 - FLEVEL
      ?auto_25469 - CITY
      ?auto_25470 - PERSON
      ?auto_25467 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25468 ?auto_25466 ) ( not ( = ?auto_25462 ?auto_25469 ) ) ( not ( = ?auto_25466 ?auto_25468 ) ) ( PERSON-AT ?auto_25470 ?auto_25462 ) ( not ( = ?auto_25470 ?auto_25464 ) ) ( PERSON-AT ?auto_25464 ?auto_25469 ) ( AIRCRAFT-AT ?auto_25467 ?auto_25462 ) ( FUEL-LEVEL ?auto_25467 ?auto_25466 ) ( PERSON-AT ?auto_25463 ?auto_25462 ) ( PERSON-AT ?auto_25465 ?auto_25462 ) ( not ( = ?auto_25463 ?auto_25464 ) ) ( not ( = ?auto_25463 ?auto_25465 ) ) ( not ( = ?auto_25463 ?auto_25470 ) ) ( not ( = ?auto_25464 ?auto_25465 ) ) ( not ( = ?auto_25465 ?auto_25470 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25470 ?auto_25464 ?auto_25462 )
      ( FLY-3PPL-VERIFY ?auto_25463 ?auto_25464 ?auto_25465 ?auto_25462 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25481 - PERSON
      ?auto_25482 - PERSON
      ?auto_25483 - PERSON
      ?auto_25480 - CITY
    )
    :vars
    (
      ?auto_25486 - FLEVEL
      ?auto_25484 - FLEVEL
      ?auto_25487 - CITY
      ?auto_25485 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25486 ?auto_25484 ) ( not ( = ?auto_25480 ?auto_25487 ) ) ( not ( = ?auto_25484 ?auto_25486 ) ) ( PERSON-AT ?auto_25482 ?auto_25480 ) ( not ( = ?auto_25482 ?auto_25481 ) ) ( PERSON-AT ?auto_25481 ?auto_25487 ) ( AIRCRAFT-AT ?auto_25485 ?auto_25480 ) ( FUEL-LEVEL ?auto_25485 ?auto_25484 ) ( PERSON-AT ?auto_25483 ?auto_25480 ) ( not ( = ?auto_25481 ?auto_25483 ) ) ( not ( = ?auto_25482 ?auto_25483 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25482 ?auto_25481 ?auto_25480 )
      ( FLY-3PPL-VERIFY ?auto_25481 ?auto_25482 ?auto_25483 ?auto_25480 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25489 - PERSON
      ?auto_25490 - PERSON
      ?auto_25491 - PERSON
      ?auto_25488 - CITY
    )
    :vars
    (
      ?auto_25494 - FLEVEL
      ?auto_25492 - FLEVEL
      ?auto_25495 - CITY
      ?auto_25493 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25494 ?auto_25492 ) ( not ( = ?auto_25488 ?auto_25495 ) ) ( not ( = ?auto_25492 ?auto_25494 ) ) ( PERSON-AT ?auto_25490 ?auto_25488 ) ( not ( = ?auto_25490 ?auto_25489 ) ) ( PERSON-AT ?auto_25489 ?auto_25495 ) ( AIRCRAFT-AT ?auto_25493 ?auto_25488 ) ( FUEL-LEVEL ?auto_25493 ?auto_25492 ) ( PERSON-AT ?auto_25491 ?auto_25488 ) ( not ( = ?auto_25489 ?auto_25491 ) ) ( not ( = ?auto_25490 ?auto_25491 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25490 ?auto_25489 ?auto_25488 )
      ( FLY-3PPL-VERIFY ?auto_25489 ?auto_25490 ?auto_25491 ?auto_25488 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25505 - PERSON
      ?auto_25506 - PERSON
      ?auto_25507 - PERSON
      ?auto_25504 - CITY
    )
    :vars
    (
      ?auto_25510 - FLEVEL
      ?auto_25508 - FLEVEL
      ?auto_25511 - CITY
      ?auto_25509 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25510 ?auto_25508 ) ( not ( = ?auto_25504 ?auto_25511 ) ) ( not ( = ?auto_25508 ?auto_25510 ) ) ( PERSON-AT ?auto_25507 ?auto_25504 ) ( not ( = ?auto_25507 ?auto_25505 ) ) ( PERSON-AT ?auto_25505 ?auto_25511 ) ( AIRCRAFT-AT ?auto_25509 ?auto_25504 ) ( FUEL-LEVEL ?auto_25509 ?auto_25508 ) ( PERSON-AT ?auto_25506 ?auto_25504 ) ( not ( = ?auto_25505 ?auto_25506 ) ) ( not ( = ?auto_25506 ?auto_25507 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25507 ?auto_25505 ?auto_25504 )
      ( FLY-3PPL-VERIFY ?auto_25505 ?auto_25506 ?auto_25507 ?auto_25504 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25513 - PERSON
      ?auto_25514 - PERSON
      ?auto_25515 - PERSON
      ?auto_25512 - CITY
    )
    :vars
    (
      ?auto_25518 - FLEVEL
      ?auto_25516 - FLEVEL
      ?auto_25519 - CITY
      ?auto_25520 - PERSON
      ?auto_25517 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25518 ?auto_25516 ) ( not ( = ?auto_25512 ?auto_25519 ) ) ( not ( = ?auto_25516 ?auto_25518 ) ) ( PERSON-AT ?auto_25520 ?auto_25512 ) ( not ( = ?auto_25520 ?auto_25513 ) ) ( PERSON-AT ?auto_25513 ?auto_25519 ) ( AIRCRAFT-AT ?auto_25517 ?auto_25512 ) ( FUEL-LEVEL ?auto_25517 ?auto_25516 ) ( PERSON-AT ?auto_25514 ?auto_25512 ) ( PERSON-AT ?auto_25515 ?auto_25512 ) ( not ( = ?auto_25513 ?auto_25514 ) ) ( not ( = ?auto_25513 ?auto_25515 ) ) ( not ( = ?auto_25514 ?auto_25515 ) ) ( not ( = ?auto_25514 ?auto_25520 ) ) ( not ( = ?auto_25515 ?auto_25520 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25520 ?auto_25513 ?auto_25512 )
      ( FLY-3PPL-VERIFY ?auto_25513 ?auto_25514 ?auto_25515 ?auto_25512 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_25557 - PERSON
      ?auto_25556 - CITY
    )
    :vars
    (
      ?auto_25560 - FLEVEL
      ?auto_25558 - FLEVEL
      ?auto_25561 - CITY
      ?auto_25562 - PERSON
      ?auto_25559 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25560 ?auto_25558 ) ( not ( = ?auto_25556 ?auto_25561 ) ) ( not ( = ?auto_25558 ?auto_25560 ) ) ( PERSON-AT ?auto_25562 ?auto_25556 ) ( not ( = ?auto_25562 ?auto_25557 ) ) ( PERSON-AT ?auto_25557 ?auto_25561 ) ( AIRCRAFT-AT ?auto_25559 ?auto_25556 ) ( FUEL-LEVEL ?auto_25559 ?auto_25560 ) )
    :subtasks
    ( ( !REFUEL ?auto_25559 ?auto_25556 ?auto_25560 ?auto_25558 )
      ( FLY-2PPL ?auto_25562 ?auto_25557 ?auto_25556 )
      ( FLY-1PPL-VERIFY ?auto_25557 ?auto_25556 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25564 - PERSON
      ?auto_25565 - PERSON
      ?auto_25563 - CITY
    )
    :vars
    (
      ?auto_25567 - FLEVEL
      ?auto_25566 - FLEVEL
      ?auto_25568 - CITY
      ?auto_25569 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25567 ?auto_25566 ) ( not ( = ?auto_25563 ?auto_25568 ) ) ( not ( = ?auto_25566 ?auto_25567 ) ) ( PERSON-AT ?auto_25564 ?auto_25563 ) ( not ( = ?auto_25564 ?auto_25565 ) ) ( PERSON-AT ?auto_25565 ?auto_25568 ) ( AIRCRAFT-AT ?auto_25569 ?auto_25563 ) ( FUEL-LEVEL ?auto_25569 ?auto_25567 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_25565 ?auto_25563 )
      ( FLY-2PPL-VERIFY ?auto_25564 ?auto_25565 ?auto_25563 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25571 - PERSON
      ?auto_25572 - PERSON
      ?auto_25570 - CITY
    )
    :vars
    (
      ?auto_25575 - FLEVEL
      ?auto_25577 - FLEVEL
      ?auto_25573 - CITY
      ?auto_25576 - PERSON
      ?auto_25574 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25575 ?auto_25577 ) ( not ( = ?auto_25570 ?auto_25573 ) ) ( not ( = ?auto_25577 ?auto_25575 ) ) ( PERSON-AT ?auto_25576 ?auto_25570 ) ( not ( = ?auto_25576 ?auto_25572 ) ) ( PERSON-AT ?auto_25572 ?auto_25573 ) ( AIRCRAFT-AT ?auto_25574 ?auto_25570 ) ( FUEL-LEVEL ?auto_25574 ?auto_25575 ) ( PERSON-AT ?auto_25571 ?auto_25570 ) ( not ( = ?auto_25571 ?auto_25572 ) ) ( not ( = ?auto_25571 ?auto_25576 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25576 ?auto_25572 ?auto_25570 )
      ( FLY-2PPL-VERIFY ?auto_25571 ?auto_25572 ?auto_25570 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25579 - PERSON
      ?auto_25580 - PERSON
      ?auto_25578 - CITY
    )
    :vars
    (
      ?auto_25583 - FLEVEL
      ?auto_25584 - FLEVEL
      ?auto_25581 - CITY
      ?auto_25582 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25583 ?auto_25584 ) ( not ( = ?auto_25578 ?auto_25581 ) ) ( not ( = ?auto_25584 ?auto_25583 ) ) ( PERSON-AT ?auto_25580 ?auto_25578 ) ( not ( = ?auto_25580 ?auto_25579 ) ) ( PERSON-AT ?auto_25579 ?auto_25581 ) ( AIRCRAFT-AT ?auto_25582 ?auto_25578 ) ( FUEL-LEVEL ?auto_25582 ?auto_25583 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25580 ?auto_25579 ?auto_25578 )
      ( FLY-2PPL-VERIFY ?auto_25579 ?auto_25580 ?auto_25578 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25586 - PERSON
      ?auto_25587 - PERSON
      ?auto_25585 - CITY
    )
    :vars
    (
      ?auto_25590 - FLEVEL
      ?auto_25592 - FLEVEL
      ?auto_25588 - CITY
      ?auto_25591 - PERSON
      ?auto_25589 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25590 ?auto_25592 ) ( not ( = ?auto_25585 ?auto_25588 ) ) ( not ( = ?auto_25592 ?auto_25590 ) ) ( PERSON-AT ?auto_25591 ?auto_25585 ) ( not ( = ?auto_25591 ?auto_25586 ) ) ( PERSON-AT ?auto_25586 ?auto_25588 ) ( AIRCRAFT-AT ?auto_25589 ?auto_25585 ) ( FUEL-LEVEL ?auto_25589 ?auto_25590 ) ( PERSON-AT ?auto_25587 ?auto_25585 ) ( not ( = ?auto_25586 ?auto_25587 ) ) ( not ( = ?auto_25587 ?auto_25591 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25591 ?auto_25586 ?auto_25585 )
      ( FLY-2PPL-VERIFY ?auto_25586 ?auto_25587 ?auto_25585 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25602 - PERSON
      ?auto_25603 - PERSON
      ?auto_25604 - PERSON
      ?auto_25601 - CITY
    )
    :vars
    (
      ?auto_25607 - FLEVEL
      ?auto_25608 - FLEVEL
      ?auto_25605 - CITY
      ?auto_25606 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25607 ?auto_25608 ) ( not ( = ?auto_25601 ?auto_25605 ) ) ( not ( = ?auto_25608 ?auto_25607 ) ) ( PERSON-AT ?auto_25603 ?auto_25601 ) ( not ( = ?auto_25603 ?auto_25604 ) ) ( PERSON-AT ?auto_25604 ?auto_25605 ) ( AIRCRAFT-AT ?auto_25606 ?auto_25601 ) ( FUEL-LEVEL ?auto_25606 ?auto_25607 ) ( PERSON-AT ?auto_25602 ?auto_25601 ) ( not ( = ?auto_25602 ?auto_25603 ) ) ( not ( = ?auto_25602 ?auto_25604 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25603 ?auto_25604 ?auto_25601 )
      ( FLY-3PPL-VERIFY ?auto_25602 ?auto_25603 ?auto_25604 ?auto_25601 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25610 - PERSON
      ?auto_25611 - PERSON
      ?auto_25612 - PERSON
      ?auto_25609 - CITY
    )
    :vars
    (
      ?auto_25615 - FLEVEL
      ?auto_25616 - FLEVEL
      ?auto_25613 - CITY
      ?auto_25614 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25615 ?auto_25616 ) ( not ( = ?auto_25609 ?auto_25613 ) ) ( not ( = ?auto_25616 ?auto_25615 ) ) ( PERSON-AT ?auto_25610 ?auto_25609 ) ( not ( = ?auto_25610 ?auto_25612 ) ) ( PERSON-AT ?auto_25612 ?auto_25613 ) ( AIRCRAFT-AT ?auto_25614 ?auto_25609 ) ( FUEL-LEVEL ?auto_25614 ?auto_25615 ) ( PERSON-AT ?auto_25611 ?auto_25609 ) ( not ( = ?auto_25610 ?auto_25611 ) ) ( not ( = ?auto_25611 ?auto_25612 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25610 ?auto_25612 ?auto_25609 )
      ( FLY-3PPL-VERIFY ?auto_25610 ?auto_25611 ?auto_25612 ?auto_25609 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25618 - PERSON
      ?auto_25619 - PERSON
      ?auto_25620 - PERSON
      ?auto_25617 - CITY
    )
    :vars
    (
      ?auto_25623 - FLEVEL
      ?auto_25624 - FLEVEL
      ?auto_25621 - CITY
      ?auto_25622 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25623 ?auto_25624 ) ( not ( = ?auto_25617 ?auto_25621 ) ) ( not ( = ?auto_25624 ?auto_25623 ) ) ( PERSON-AT ?auto_25620 ?auto_25617 ) ( not ( = ?auto_25620 ?auto_25619 ) ) ( PERSON-AT ?auto_25619 ?auto_25621 ) ( AIRCRAFT-AT ?auto_25622 ?auto_25617 ) ( FUEL-LEVEL ?auto_25622 ?auto_25623 ) ( PERSON-AT ?auto_25618 ?auto_25617 ) ( not ( = ?auto_25618 ?auto_25619 ) ) ( not ( = ?auto_25618 ?auto_25620 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25620 ?auto_25619 ?auto_25617 )
      ( FLY-3PPL-VERIFY ?auto_25618 ?auto_25619 ?auto_25620 ?auto_25617 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25626 - PERSON
      ?auto_25627 - PERSON
      ?auto_25628 - PERSON
      ?auto_25625 - CITY
    )
    :vars
    (
      ?auto_25631 - FLEVEL
      ?auto_25632 - FLEVEL
      ?auto_25629 - CITY
      ?auto_25630 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25631 ?auto_25632 ) ( not ( = ?auto_25625 ?auto_25629 ) ) ( not ( = ?auto_25632 ?auto_25631 ) ) ( PERSON-AT ?auto_25626 ?auto_25625 ) ( not ( = ?auto_25626 ?auto_25627 ) ) ( PERSON-AT ?auto_25627 ?auto_25629 ) ( AIRCRAFT-AT ?auto_25630 ?auto_25625 ) ( FUEL-LEVEL ?auto_25630 ?auto_25631 ) ( PERSON-AT ?auto_25628 ?auto_25625 ) ( not ( = ?auto_25626 ?auto_25628 ) ) ( not ( = ?auto_25627 ?auto_25628 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25626 ?auto_25627 ?auto_25625 )
      ( FLY-3PPL-VERIFY ?auto_25626 ?auto_25627 ?auto_25628 ?auto_25625 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25642 - PERSON
      ?auto_25643 - PERSON
      ?auto_25644 - PERSON
      ?auto_25641 - CITY
    )
    :vars
    (
      ?auto_25647 - FLEVEL
      ?auto_25648 - FLEVEL
      ?auto_25645 - CITY
      ?auto_25646 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25647 ?auto_25648 ) ( not ( = ?auto_25641 ?auto_25645 ) ) ( not ( = ?auto_25648 ?auto_25647 ) ) ( PERSON-AT ?auto_25643 ?auto_25641 ) ( not ( = ?auto_25643 ?auto_25644 ) ) ( PERSON-AT ?auto_25644 ?auto_25645 ) ( AIRCRAFT-AT ?auto_25646 ?auto_25641 ) ( FUEL-LEVEL ?auto_25646 ?auto_25647 ) ( PERSON-AT ?auto_25642 ?auto_25641 ) ( not ( = ?auto_25642 ?auto_25643 ) ) ( not ( = ?auto_25642 ?auto_25644 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25643 ?auto_25644 ?auto_25641 )
      ( FLY-3PPL-VERIFY ?auto_25642 ?auto_25643 ?auto_25644 ?auto_25641 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25650 - PERSON
      ?auto_25651 - PERSON
      ?auto_25652 - PERSON
      ?auto_25649 - CITY
    )
    :vars
    (
      ?auto_25655 - FLEVEL
      ?auto_25657 - FLEVEL
      ?auto_25653 - CITY
      ?auto_25656 - PERSON
      ?auto_25654 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25655 ?auto_25657 ) ( not ( = ?auto_25649 ?auto_25653 ) ) ( not ( = ?auto_25657 ?auto_25655 ) ) ( PERSON-AT ?auto_25656 ?auto_25649 ) ( not ( = ?auto_25656 ?auto_25652 ) ) ( PERSON-AT ?auto_25652 ?auto_25653 ) ( AIRCRAFT-AT ?auto_25654 ?auto_25649 ) ( FUEL-LEVEL ?auto_25654 ?auto_25655 ) ( PERSON-AT ?auto_25650 ?auto_25649 ) ( PERSON-AT ?auto_25651 ?auto_25649 ) ( not ( = ?auto_25650 ?auto_25651 ) ) ( not ( = ?auto_25650 ?auto_25652 ) ) ( not ( = ?auto_25650 ?auto_25656 ) ) ( not ( = ?auto_25651 ?auto_25652 ) ) ( not ( = ?auto_25651 ?auto_25656 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25656 ?auto_25652 ?auto_25649 )
      ( FLY-3PPL-VERIFY ?auto_25650 ?auto_25651 ?auto_25652 ?auto_25649 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25659 - PERSON
      ?auto_25660 - PERSON
      ?auto_25661 - PERSON
      ?auto_25658 - CITY
    )
    :vars
    (
      ?auto_25664 - FLEVEL
      ?auto_25665 - FLEVEL
      ?auto_25662 - CITY
      ?auto_25663 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25664 ?auto_25665 ) ( not ( = ?auto_25658 ?auto_25662 ) ) ( not ( = ?auto_25665 ?auto_25664 ) ) ( PERSON-AT ?auto_25661 ?auto_25658 ) ( not ( = ?auto_25661 ?auto_25660 ) ) ( PERSON-AT ?auto_25660 ?auto_25662 ) ( AIRCRAFT-AT ?auto_25663 ?auto_25658 ) ( FUEL-LEVEL ?auto_25663 ?auto_25664 ) ( PERSON-AT ?auto_25659 ?auto_25658 ) ( not ( = ?auto_25659 ?auto_25660 ) ) ( not ( = ?auto_25659 ?auto_25661 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25661 ?auto_25660 ?auto_25658 )
      ( FLY-3PPL-VERIFY ?auto_25659 ?auto_25660 ?auto_25661 ?auto_25658 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25667 - PERSON
      ?auto_25668 - PERSON
      ?auto_25669 - PERSON
      ?auto_25666 - CITY
    )
    :vars
    (
      ?auto_25672 - FLEVEL
      ?auto_25674 - FLEVEL
      ?auto_25670 - CITY
      ?auto_25673 - PERSON
      ?auto_25671 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25672 ?auto_25674 ) ( not ( = ?auto_25666 ?auto_25670 ) ) ( not ( = ?auto_25674 ?auto_25672 ) ) ( PERSON-AT ?auto_25673 ?auto_25666 ) ( not ( = ?auto_25673 ?auto_25668 ) ) ( PERSON-AT ?auto_25668 ?auto_25670 ) ( AIRCRAFT-AT ?auto_25671 ?auto_25666 ) ( FUEL-LEVEL ?auto_25671 ?auto_25672 ) ( PERSON-AT ?auto_25667 ?auto_25666 ) ( PERSON-AT ?auto_25669 ?auto_25666 ) ( not ( = ?auto_25667 ?auto_25668 ) ) ( not ( = ?auto_25667 ?auto_25669 ) ) ( not ( = ?auto_25667 ?auto_25673 ) ) ( not ( = ?auto_25668 ?auto_25669 ) ) ( not ( = ?auto_25669 ?auto_25673 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25673 ?auto_25668 ?auto_25666 )
      ( FLY-3PPL-VERIFY ?auto_25667 ?auto_25668 ?auto_25669 ?auto_25666 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25685 - PERSON
      ?auto_25686 - PERSON
      ?auto_25687 - PERSON
      ?auto_25684 - CITY
    )
    :vars
    (
      ?auto_25690 - FLEVEL
      ?auto_25691 - FLEVEL
      ?auto_25688 - CITY
      ?auto_25689 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25690 ?auto_25691 ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25691 ?auto_25690 ) ) ( PERSON-AT ?auto_25687 ?auto_25684 ) ( not ( = ?auto_25687 ?auto_25685 ) ) ( PERSON-AT ?auto_25685 ?auto_25688 ) ( AIRCRAFT-AT ?auto_25689 ?auto_25684 ) ( FUEL-LEVEL ?auto_25689 ?auto_25690 ) ( PERSON-AT ?auto_25686 ?auto_25684 ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( not ( = ?auto_25686 ?auto_25687 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25687 ?auto_25685 ?auto_25684 )
      ( FLY-3PPL-VERIFY ?auto_25685 ?auto_25686 ?auto_25687 ?auto_25684 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25693 - PERSON
      ?auto_25694 - PERSON
      ?auto_25695 - PERSON
      ?auto_25692 - CITY
    )
    :vars
    (
      ?auto_25698 - FLEVEL
      ?auto_25699 - FLEVEL
      ?auto_25696 - CITY
      ?auto_25697 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25698 ?auto_25699 ) ( not ( = ?auto_25692 ?auto_25696 ) ) ( not ( = ?auto_25699 ?auto_25698 ) ) ( PERSON-AT ?auto_25694 ?auto_25692 ) ( not ( = ?auto_25694 ?auto_25693 ) ) ( PERSON-AT ?auto_25693 ?auto_25696 ) ( AIRCRAFT-AT ?auto_25697 ?auto_25692 ) ( FUEL-LEVEL ?auto_25697 ?auto_25698 ) ( PERSON-AT ?auto_25695 ?auto_25692 ) ( not ( = ?auto_25693 ?auto_25695 ) ) ( not ( = ?auto_25694 ?auto_25695 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25694 ?auto_25693 ?auto_25692 )
      ( FLY-3PPL-VERIFY ?auto_25693 ?auto_25694 ?auto_25695 ?auto_25692 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25709 - PERSON
      ?auto_25710 - PERSON
      ?auto_25711 - PERSON
      ?auto_25708 - CITY
    )
    :vars
    (
      ?auto_25714 - FLEVEL
      ?auto_25715 - FLEVEL
      ?auto_25712 - CITY
      ?auto_25713 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25714 ?auto_25715 ) ( not ( = ?auto_25708 ?auto_25712 ) ) ( not ( = ?auto_25715 ?auto_25714 ) ) ( PERSON-AT ?auto_25711 ?auto_25708 ) ( not ( = ?auto_25711 ?auto_25709 ) ) ( PERSON-AT ?auto_25709 ?auto_25712 ) ( AIRCRAFT-AT ?auto_25713 ?auto_25708 ) ( FUEL-LEVEL ?auto_25713 ?auto_25714 ) ( PERSON-AT ?auto_25710 ?auto_25708 ) ( not ( = ?auto_25709 ?auto_25710 ) ) ( not ( = ?auto_25710 ?auto_25711 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25711 ?auto_25709 ?auto_25708 )
      ( FLY-3PPL-VERIFY ?auto_25709 ?auto_25710 ?auto_25711 ?auto_25708 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25717 - PERSON
      ?auto_25718 - PERSON
      ?auto_25719 - PERSON
      ?auto_25716 - CITY
    )
    :vars
    (
      ?auto_25722 - FLEVEL
      ?auto_25724 - FLEVEL
      ?auto_25720 - CITY
      ?auto_25723 - PERSON
      ?auto_25721 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25722 ?auto_25724 ) ( not ( = ?auto_25716 ?auto_25720 ) ) ( not ( = ?auto_25724 ?auto_25722 ) ) ( PERSON-AT ?auto_25723 ?auto_25716 ) ( not ( = ?auto_25723 ?auto_25717 ) ) ( PERSON-AT ?auto_25717 ?auto_25720 ) ( AIRCRAFT-AT ?auto_25721 ?auto_25716 ) ( FUEL-LEVEL ?auto_25721 ?auto_25722 ) ( PERSON-AT ?auto_25718 ?auto_25716 ) ( PERSON-AT ?auto_25719 ?auto_25716 ) ( not ( = ?auto_25717 ?auto_25718 ) ) ( not ( = ?auto_25717 ?auto_25719 ) ) ( not ( = ?auto_25718 ?auto_25719 ) ) ( not ( = ?auto_25718 ?auto_25723 ) ) ( not ( = ?auto_25719 ?auto_25723 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25723 ?auto_25717 ?auto_25716 )
      ( FLY-3PPL-VERIFY ?auto_25717 ?auto_25718 ?auto_25719 ?auto_25716 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_25761 - PERSON
      ?auto_25760 - CITY
    )
    :vars
    (
      ?auto_25764 - FLEVEL
      ?auto_25766 - FLEVEL
      ?auto_25762 - CITY
      ?auto_25765 - PERSON
      ?auto_25763 - AIRCRAFT
      ?auto_25767 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_25764 ?auto_25766 ) ( not ( = ?auto_25760 ?auto_25762 ) ) ( not ( = ?auto_25766 ?auto_25764 ) ) ( PERSON-AT ?auto_25765 ?auto_25760 ) ( not ( = ?auto_25765 ?auto_25761 ) ) ( PERSON-AT ?auto_25761 ?auto_25762 ) ( AIRCRAFT-AT ?auto_25763 ?auto_25760 ) ( FUEL-LEVEL ?auto_25763 ?auto_25764 ) ( IN ?auto_25767 ?auto_25763 ) ( not ( = ?auto_25765 ?auto_25767 ) ) ( not ( = ?auto_25761 ?auto_25767 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25765 ?auto_25767 ?auto_25760 )
      ( FLY-2PPL ?auto_25765 ?auto_25761 ?auto_25760 )
      ( FLY-1PPL-VERIFY ?auto_25761 ?auto_25760 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25769 - PERSON
      ?auto_25770 - PERSON
      ?auto_25768 - CITY
    )
    :vars
    (
      ?auto_25771 - FLEVEL
      ?auto_25774 - FLEVEL
      ?auto_25772 - CITY
      ?auto_25773 - AIRCRAFT
      ?auto_25775 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_25771 ?auto_25774 ) ( not ( = ?auto_25768 ?auto_25772 ) ) ( not ( = ?auto_25774 ?auto_25771 ) ) ( PERSON-AT ?auto_25769 ?auto_25768 ) ( not ( = ?auto_25769 ?auto_25770 ) ) ( PERSON-AT ?auto_25770 ?auto_25772 ) ( AIRCRAFT-AT ?auto_25773 ?auto_25768 ) ( FUEL-LEVEL ?auto_25773 ?auto_25771 ) ( IN ?auto_25775 ?auto_25773 ) ( not ( = ?auto_25769 ?auto_25775 ) ) ( not ( = ?auto_25770 ?auto_25775 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_25770 ?auto_25768 )
      ( FLY-2PPL-VERIFY ?auto_25769 ?auto_25770 ?auto_25768 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25777 - PERSON
      ?auto_25778 - PERSON
      ?auto_25776 - CITY
    )
    :vars
    (
      ?auto_25779 - FLEVEL
      ?auto_25781 - FLEVEL
      ?auto_25783 - CITY
      ?auto_25782 - PERSON
      ?auto_25780 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25779 ?auto_25781 ) ( not ( = ?auto_25776 ?auto_25783 ) ) ( not ( = ?auto_25781 ?auto_25779 ) ) ( PERSON-AT ?auto_25782 ?auto_25776 ) ( not ( = ?auto_25782 ?auto_25778 ) ) ( PERSON-AT ?auto_25778 ?auto_25783 ) ( AIRCRAFT-AT ?auto_25780 ?auto_25776 ) ( FUEL-LEVEL ?auto_25780 ?auto_25779 ) ( IN ?auto_25777 ?auto_25780 ) ( not ( = ?auto_25782 ?auto_25777 ) ) ( not ( = ?auto_25778 ?auto_25777 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25782 ?auto_25778 ?auto_25776 )
      ( FLY-2PPL-VERIFY ?auto_25777 ?auto_25778 ?auto_25776 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25785 - PERSON
      ?auto_25786 - PERSON
      ?auto_25784 - CITY
    )
    :vars
    (
      ?auto_25787 - FLEVEL
      ?auto_25789 - FLEVEL
      ?auto_25790 - CITY
      ?auto_25788 - AIRCRAFT
      ?auto_25791 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_25787 ?auto_25789 ) ( not ( = ?auto_25784 ?auto_25790 ) ) ( not ( = ?auto_25789 ?auto_25787 ) ) ( PERSON-AT ?auto_25786 ?auto_25784 ) ( not ( = ?auto_25786 ?auto_25785 ) ) ( PERSON-AT ?auto_25785 ?auto_25790 ) ( AIRCRAFT-AT ?auto_25788 ?auto_25784 ) ( FUEL-LEVEL ?auto_25788 ?auto_25787 ) ( IN ?auto_25791 ?auto_25788 ) ( not ( = ?auto_25786 ?auto_25791 ) ) ( not ( = ?auto_25785 ?auto_25791 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25786 ?auto_25785 ?auto_25784 )
      ( FLY-2PPL-VERIFY ?auto_25785 ?auto_25786 ?auto_25784 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25793 - PERSON
      ?auto_25794 - PERSON
      ?auto_25792 - CITY
    )
    :vars
    (
      ?auto_25795 - FLEVEL
      ?auto_25797 - FLEVEL
      ?auto_25799 - CITY
      ?auto_25798 - PERSON
      ?auto_25796 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25795 ?auto_25797 ) ( not ( = ?auto_25792 ?auto_25799 ) ) ( not ( = ?auto_25797 ?auto_25795 ) ) ( PERSON-AT ?auto_25798 ?auto_25792 ) ( not ( = ?auto_25798 ?auto_25793 ) ) ( PERSON-AT ?auto_25793 ?auto_25799 ) ( AIRCRAFT-AT ?auto_25796 ?auto_25792 ) ( FUEL-LEVEL ?auto_25796 ?auto_25795 ) ( IN ?auto_25794 ?auto_25796 ) ( not ( = ?auto_25798 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25794 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25798 ?auto_25793 ?auto_25792 )
      ( FLY-2PPL-VERIFY ?auto_25793 ?auto_25794 ?auto_25792 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25810 - PERSON
      ?auto_25811 - PERSON
      ?auto_25812 - PERSON
      ?auto_25809 - CITY
    )
    :vars
    (
      ?auto_25813 - FLEVEL
      ?auto_25815 - FLEVEL
      ?auto_25816 - CITY
      ?auto_25814 - AIRCRAFT
      ?auto_25817 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_25813 ?auto_25815 ) ( not ( = ?auto_25809 ?auto_25816 ) ) ( not ( = ?auto_25815 ?auto_25813 ) ) ( PERSON-AT ?auto_25811 ?auto_25809 ) ( not ( = ?auto_25811 ?auto_25812 ) ) ( PERSON-AT ?auto_25812 ?auto_25816 ) ( AIRCRAFT-AT ?auto_25814 ?auto_25809 ) ( FUEL-LEVEL ?auto_25814 ?auto_25813 ) ( IN ?auto_25817 ?auto_25814 ) ( not ( = ?auto_25811 ?auto_25817 ) ) ( not ( = ?auto_25812 ?auto_25817 ) ) ( PERSON-AT ?auto_25810 ?auto_25809 ) ( not ( = ?auto_25810 ?auto_25811 ) ) ( not ( = ?auto_25810 ?auto_25812 ) ) ( not ( = ?auto_25810 ?auto_25817 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25811 ?auto_25812 ?auto_25809 )
      ( FLY-3PPL-VERIFY ?auto_25810 ?auto_25811 ?auto_25812 ?auto_25809 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25819 - PERSON
      ?auto_25820 - PERSON
      ?auto_25821 - PERSON
      ?auto_25818 - CITY
    )
    :vars
    (
      ?auto_25822 - FLEVEL
      ?auto_25824 - FLEVEL
      ?auto_25825 - CITY
      ?auto_25823 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25822 ?auto_25824 ) ( not ( = ?auto_25818 ?auto_25825 ) ) ( not ( = ?auto_25824 ?auto_25822 ) ) ( PERSON-AT ?auto_25819 ?auto_25818 ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( PERSON-AT ?auto_25821 ?auto_25825 ) ( AIRCRAFT-AT ?auto_25823 ?auto_25818 ) ( FUEL-LEVEL ?auto_25823 ?auto_25822 ) ( IN ?auto_25820 ?auto_25823 ) ( not ( = ?auto_25819 ?auto_25820 ) ) ( not ( = ?auto_25821 ?auto_25820 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25819 ?auto_25821 ?auto_25818 )
      ( FLY-3PPL-VERIFY ?auto_25819 ?auto_25820 ?auto_25821 ?auto_25818 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25827 - PERSON
      ?auto_25828 - PERSON
      ?auto_25829 - PERSON
      ?auto_25826 - CITY
    )
    :vars
    (
      ?auto_25830 - FLEVEL
      ?auto_25832 - FLEVEL
      ?auto_25833 - CITY
      ?auto_25831 - AIRCRAFT
      ?auto_25834 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_25830 ?auto_25832 ) ( not ( = ?auto_25826 ?auto_25833 ) ) ( not ( = ?auto_25832 ?auto_25830 ) ) ( PERSON-AT ?auto_25829 ?auto_25826 ) ( not ( = ?auto_25829 ?auto_25828 ) ) ( PERSON-AT ?auto_25828 ?auto_25833 ) ( AIRCRAFT-AT ?auto_25831 ?auto_25826 ) ( FUEL-LEVEL ?auto_25831 ?auto_25830 ) ( IN ?auto_25834 ?auto_25831 ) ( not ( = ?auto_25829 ?auto_25834 ) ) ( not ( = ?auto_25828 ?auto_25834 ) ) ( PERSON-AT ?auto_25827 ?auto_25826 ) ( not ( = ?auto_25827 ?auto_25828 ) ) ( not ( = ?auto_25827 ?auto_25829 ) ) ( not ( = ?auto_25827 ?auto_25834 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25829 ?auto_25828 ?auto_25826 )
      ( FLY-3PPL-VERIFY ?auto_25827 ?auto_25828 ?auto_25829 ?auto_25826 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25836 - PERSON
      ?auto_25837 - PERSON
      ?auto_25838 - PERSON
      ?auto_25835 - CITY
    )
    :vars
    (
      ?auto_25839 - FLEVEL
      ?auto_25841 - FLEVEL
      ?auto_25842 - CITY
      ?auto_25840 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25839 ?auto_25841 ) ( not ( = ?auto_25835 ?auto_25842 ) ) ( not ( = ?auto_25841 ?auto_25839 ) ) ( PERSON-AT ?auto_25836 ?auto_25835 ) ( not ( = ?auto_25836 ?auto_25837 ) ) ( PERSON-AT ?auto_25837 ?auto_25842 ) ( AIRCRAFT-AT ?auto_25840 ?auto_25835 ) ( FUEL-LEVEL ?auto_25840 ?auto_25839 ) ( IN ?auto_25838 ?auto_25840 ) ( not ( = ?auto_25836 ?auto_25838 ) ) ( not ( = ?auto_25837 ?auto_25838 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25836 ?auto_25837 ?auto_25835 )
      ( FLY-3PPL-VERIFY ?auto_25836 ?auto_25837 ?auto_25838 ?auto_25835 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25853 - PERSON
      ?auto_25854 - PERSON
      ?auto_25855 - PERSON
      ?auto_25852 - CITY
    )
    :vars
    (
      ?auto_25856 - FLEVEL
      ?auto_25858 - FLEVEL
      ?auto_25859 - CITY
      ?auto_25857 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25856 ?auto_25858 ) ( not ( = ?auto_25852 ?auto_25859 ) ) ( not ( = ?auto_25858 ?auto_25856 ) ) ( PERSON-AT ?auto_25854 ?auto_25852 ) ( not ( = ?auto_25854 ?auto_25855 ) ) ( PERSON-AT ?auto_25855 ?auto_25859 ) ( AIRCRAFT-AT ?auto_25857 ?auto_25852 ) ( FUEL-LEVEL ?auto_25857 ?auto_25856 ) ( IN ?auto_25853 ?auto_25857 ) ( not ( = ?auto_25854 ?auto_25853 ) ) ( not ( = ?auto_25855 ?auto_25853 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25854 ?auto_25855 ?auto_25852 )
      ( FLY-3PPL-VERIFY ?auto_25853 ?auto_25854 ?auto_25855 ?auto_25852 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25870 - PERSON
      ?auto_25871 - PERSON
      ?auto_25872 - PERSON
      ?auto_25869 - CITY
    )
    :vars
    (
      ?auto_25873 - FLEVEL
      ?auto_25875 - FLEVEL
      ?auto_25876 - CITY
      ?auto_25874 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25873 ?auto_25875 ) ( not ( = ?auto_25869 ?auto_25876 ) ) ( not ( = ?auto_25875 ?auto_25873 ) ) ( PERSON-AT ?auto_25872 ?auto_25869 ) ( not ( = ?auto_25872 ?auto_25871 ) ) ( PERSON-AT ?auto_25871 ?auto_25876 ) ( AIRCRAFT-AT ?auto_25874 ?auto_25869 ) ( FUEL-LEVEL ?auto_25874 ?auto_25873 ) ( IN ?auto_25870 ?auto_25874 ) ( not ( = ?auto_25872 ?auto_25870 ) ) ( not ( = ?auto_25871 ?auto_25870 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25872 ?auto_25871 ?auto_25869 )
      ( FLY-3PPL-VERIFY ?auto_25870 ?auto_25871 ?auto_25872 ?auto_25869 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25896 - PERSON
      ?auto_25897 - PERSON
      ?auto_25898 - PERSON
      ?auto_25895 - CITY
    )
    :vars
    (
      ?auto_25899 - FLEVEL
      ?auto_25901 - FLEVEL
      ?auto_25902 - CITY
      ?auto_25900 - AIRCRAFT
      ?auto_25903 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_25899 ?auto_25901 ) ( not ( = ?auto_25895 ?auto_25902 ) ) ( not ( = ?auto_25901 ?auto_25899 ) ) ( PERSON-AT ?auto_25898 ?auto_25895 ) ( not ( = ?auto_25898 ?auto_25896 ) ) ( PERSON-AT ?auto_25896 ?auto_25902 ) ( AIRCRAFT-AT ?auto_25900 ?auto_25895 ) ( FUEL-LEVEL ?auto_25900 ?auto_25899 ) ( IN ?auto_25903 ?auto_25900 ) ( not ( = ?auto_25898 ?auto_25903 ) ) ( not ( = ?auto_25896 ?auto_25903 ) ) ( PERSON-AT ?auto_25897 ?auto_25895 ) ( not ( = ?auto_25896 ?auto_25897 ) ) ( not ( = ?auto_25897 ?auto_25898 ) ) ( not ( = ?auto_25897 ?auto_25903 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25898 ?auto_25896 ?auto_25895 )
      ( FLY-3PPL-VERIFY ?auto_25896 ?auto_25897 ?auto_25898 ?auto_25895 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25905 - PERSON
      ?auto_25906 - PERSON
      ?auto_25907 - PERSON
      ?auto_25904 - CITY
    )
    :vars
    (
      ?auto_25908 - FLEVEL
      ?auto_25910 - FLEVEL
      ?auto_25911 - CITY
      ?auto_25909 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25908 ?auto_25910 ) ( not ( = ?auto_25904 ?auto_25911 ) ) ( not ( = ?auto_25910 ?auto_25908 ) ) ( PERSON-AT ?auto_25906 ?auto_25904 ) ( not ( = ?auto_25906 ?auto_25905 ) ) ( PERSON-AT ?auto_25905 ?auto_25911 ) ( AIRCRAFT-AT ?auto_25909 ?auto_25904 ) ( FUEL-LEVEL ?auto_25909 ?auto_25908 ) ( IN ?auto_25907 ?auto_25909 ) ( not ( = ?auto_25906 ?auto_25907 ) ) ( not ( = ?auto_25905 ?auto_25907 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25906 ?auto_25905 ?auto_25904 )
      ( FLY-3PPL-VERIFY ?auto_25905 ?auto_25906 ?auto_25907 ?auto_25904 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_25922 - PERSON
      ?auto_25923 - PERSON
      ?auto_25924 - PERSON
      ?auto_25921 - CITY
    )
    :vars
    (
      ?auto_25925 - FLEVEL
      ?auto_25927 - FLEVEL
      ?auto_25928 - CITY
      ?auto_25926 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_25925 ?auto_25927 ) ( not ( = ?auto_25921 ?auto_25928 ) ) ( not ( = ?auto_25927 ?auto_25925 ) ) ( PERSON-AT ?auto_25924 ?auto_25921 ) ( not ( = ?auto_25924 ?auto_25922 ) ) ( PERSON-AT ?auto_25922 ?auto_25928 ) ( AIRCRAFT-AT ?auto_25926 ?auto_25921 ) ( FUEL-LEVEL ?auto_25926 ?auto_25925 ) ( IN ?auto_25923 ?auto_25926 ) ( not ( = ?auto_25924 ?auto_25923 ) ) ( not ( = ?auto_25922 ?auto_25923 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_25924 ?auto_25922 ?auto_25921 )
      ( FLY-3PPL-VERIFY ?auto_25922 ?auto_25923 ?auto_25924 ?auto_25921 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_25976 - PERSON
      ?auto_25975 - CITY
    )
    :vars
    (
      ?auto_25977 - FLEVEL
      ?auto_25979 - FLEVEL
      ?auto_25981 - CITY
      ?auto_25980 - PERSON
      ?auto_25982 - PERSON
      ?auto_25978 - AIRCRAFT
      ?auto_25983 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_25977 ?auto_25979 ) ( not ( = ?auto_25975 ?auto_25981 ) ) ( not ( = ?auto_25979 ?auto_25977 ) ) ( PERSON-AT ?auto_25980 ?auto_25975 ) ( not ( = ?auto_25980 ?auto_25976 ) ) ( PERSON-AT ?auto_25976 ?auto_25981 ) ( IN ?auto_25982 ?auto_25978 ) ( not ( = ?auto_25980 ?auto_25982 ) ) ( not ( = ?auto_25976 ?auto_25982 ) ) ( AIRCRAFT-AT ?auto_25978 ?auto_25983 ) ( FUEL-LEVEL ?auto_25978 ?auto_25979 ) ( not ( = ?auto_25975 ?auto_25983 ) ) ( not ( = ?auto_25981 ?auto_25983 ) ) )
    :subtasks
    ( ( !FLY ?auto_25978 ?auto_25983 ?auto_25975 ?auto_25979 ?auto_25977 )
      ( FLY-2PPL ?auto_25980 ?auto_25976 ?auto_25975 )
      ( FLY-1PPL-VERIFY ?auto_25976 ?auto_25975 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25985 - PERSON
      ?auto_25986 - PERSON
      ?auto_25984 - CITY
    )
    :vars
    (
      ?auto_25991 - FLEVEL
      ?auto_25987 - FLEVEL
      ?auto_25988 - CITY
      ?auto_25990 - PERSON
      ?auto_25992 - AIRCRAFT
      ?auto_25989 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_25991 ?auto_25987 ) ( not ( = ?auto_25984 ?auto_25988 ) ) ( not ( = ?auto_25987 ?auto_25991 ) ) ( PERSON-AT ?auto_25985 ?auto_25984 ) ( not ( = ?auto_25985 ?auto_25986 ) ) ( PERSON-AT ?auto_25986 ?auto_25988 ) ( IN ?auto_25990 ?auto_25992 ) ( not ( = ?auto_25985 ?auto_25990 ) ) ( not ( = ?auto_25986 ?auto_25990 ) ) ( AIRCRAFT-AT ?auto_25992 ?auto_25989 ) ( FUEL-LEVEL ?auto_25992 ?auto_25987 ) ( not ( = ?auto_25984 ?auto_25989 ) ) ( not ( = ?auto_25988 ?auto_25989 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_25986 ?auto_25984 )
      ( FLY-2PPL-VERIFY ?auto_25985 ?auto_25986 ?auto_25984 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_25994 - PERSON
      ?auto_25995 - PERSON
      ?auto_25993 - CITY
    )
    :vars
    (
      ?auto_25999 - FLEVEL
      ?auto_25998 - FLEVEL
      ?auto_26000 - CITY
      ?auto_26001 - PERSON
      ?auto_25996 - AIRCRAFT
      ?auto_25997 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_25999 ?auto_25998 ) ( not ( = ?auto_25993 ?auto_26000 ) ) ( not ( = ?auto_25998 ?auto_25999 ) ) ( PERSON-AT ?auto_26001 ?auto_25993 ) ( not ( = ?auto_26001 ?auto_25995 ) ) ( PERSON-AT ?auto_25995 ?auto_26000 ) ( IN ?auto_25994 ?auto_25996 ) ( not ( = ?auto_26001 ?auto_25994 ) ) ( not ( = ?auto_25995 ?auto_25994 ) ) ( AIRCRAFT-AT ?auto_25996 ?auto_25997 ) ( FUEL-LEVEL ?auto_25996 ?auto_25998 ) ( not ( = ?auto_25993 ?auto_25997 ) ) ( not ( = ?auto_26000 ?auto_25997 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26001 ?auto_25995 ?auto_25993 )
      ( FLY-2PPL-VERIFY ?auto_25994 ?auto_25995 ?auto_25993 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26003 - PERSON
      ?auto_26004 - PERSON
      ?auto_26002 - CITY
    )
    :vars
    (
      ?auto_26009 - FLEVEL
      ?auto_26008 - FLEVEL
      ?auto_26010 - CITY
      ?auto_26007 - PERSON
      ?auto_26005 - AIRCRAFT
      ?auto_26006 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26009 ?auto_26008 ) ( not ( = ?auto_26002 ?auto_26010 ) ) ( not ( = ?auto_26008 ?auto_26009 ) ) ( PERSON-AT ?auto_26004 ?auto_26002 ) ( not ( = ?auto_26004 ?auto_26003 ) ) ( PERSON-AT ?auto_26003 ?auto_26010 ) ( IN ?auto_26007 ?auto_26005 ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26003 ?auto_26007 ) ) ( AIRCRAFT-AT ?auto_26005 ?auto_26006 ) ( FUEL-LEVEL ?auto_26005 ?auto_26008 ) ( not ( = ?auto_26002 ?auto_26006 ) ) ( not ( = ?auto_26010 ?auto_26006 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26004 ?auto_26003 ?auto_26002 )
      ( FLY-2PPL-VERIFY ?auto_26003 ?auto_26004 ?auto_26002 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26012 - PERSON
      ?auto_26013 - PERSON
      ?auto_26011 - CITY
    )
    :vars
    (
      ?auto_26017 - FLEVEL
      ?auto_26016 - FLEVEL
      ?auto_26018 - CITY
      ?auto_26019 - PERSON
      ?auto_26014 - AIRCRAFT
      ?auto_26015 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26017 ?auto_26016 ) ( not ( = ?auto_26011 ?auto_26018 ) ) ( not ( = ?auto_26016 ?auto_26017 ) ) ( PERSON-AT ?auto_26019 ?auto_26011 ) ( not ( = ?auto_26019 ?auto_26012 ) ) ( PERSON-AT ?auto_26012 ?auto_26018 ) ( IN ?auto_26013 ?auto_26014 ) ( not ( = ?auto_26019 ?auto_26013 ) ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( AIRCRAFT-AT ?auto_26014 ?auto_26015 ) ( FUEL-LEVEL ?auto_26014 ?auto_26016 ) ( not ( = ?auto_26011 ?auto_26015 ) ) ( not ( = ?auto_26018 ?auto_26015 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26019 ?auto_26012 ?auto_26011 )
      ( FLY-2PPL-VERIFY ?auto_26012 ?auto_26013 ?auto_26011 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26031 - PERSON
      ?auto_26032 - PERSON
      ?auto_26033 - PERSON
      ?auto_26030 - CITY
    )
    :vars
    (
      ?auto_26038 - FLEVEL
      ?auto_26037 - FLEVEL
      ?auto_26039 - CITY
      ?auto_26036 - PERSON
      ?auto_26034 - AIRCRAFT
      ?auto_26035 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26038 ?auto_26037 ) ( not ( = ?auto_26030 ?auto_26039 ) ) ( not ( = ?auto_26037 ?auto_26038 ) ) ( PERSON-AT ?auto_26032 ?auto_26030 ) ( not ( = ?auto_26032 ?auto_26033 ) ) ( PERSON-AT ?auto_26033 ?auto_26039 ) ( IN ?auto_26036 ?auto_26034 ) ( not ( = ?auto_26032 ?auto_26036 ) ) ( not ( = ?auto_26033 ?auto_26036 ) ) ( AIRCRAFT-AT ?auto_26034 ?auto_26035 ) ( FUEL-LEVEL ?auto_26034 ?auto_26037 ) ( not ( = ?auto_26030 ?auto_26035 ) ) ( not ( = ?auto_26039 ?auto_26035 ) ) ( PERSON-AT ?auto_26031 ?auto_26030 ) ( not ( = ?auto_26031 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26033 ) ) ( not ( = ?auto_26031 ?auto_26036 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26032 ?auto_26033 ?auto_26030 )
      ( FLY-3PPL-VERIFY ?auto_26031 ?auto_26032 ?auto_26033 ?auto_26030 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26041 - PERSON
      ?auto_26042 - PERSON
      ?auto_26043 - PERSON
      ?auto_26040 - CITY
    )
    :vars
    (
      ?auto_26047 - FLEVEL
      ?auto_26046 - FLEVEL
      ?auto_26048 - CITY
      ?auto_26044 - AIRCRAFT
      ?auto_26045 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26047 ?auto_26046 ) ( not ( = ?auto_26040 ?auto_26048 ) ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( PERSON-AT ?auto_26041 ?auto_26040 ) ( not ( = ?auto_26041 ?auto_26043 ) ) ( PERSON-AT ?auto_26043 ?auto_26048 ) ( IN ?auto_26042 ?auto_26044 ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( not ( = ?auto_26043 ?auto_26042 ) ) ( AIRCRAFT-AT ?auto_26044 ?auto_26045 ) ( FUEL-LEVEL ?auto_26044 ?auto_26046 ) ( not ( = ?auto_26040 ?auto_26045 ) ) ( not ( = ?auto_26048 ?auto_26045 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26041 ?auto_26043 ?auto_26040 )
      ( FLY-3PPL-VERIFY ?auto_26041 ?auto_26042 ?auto_26043 ?auto_26040 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26050 - PERSON
      ?auto_26051 - PERSON
      ?auto_26052 - PERSON
      ?auto_26049 - CITY
    )
    :vars
    (
      ?auto_26057 - FLEVEL
      ?auto_26056 - FLEVEL
      ?auto_26058 - CITY
      ?auto_26055 - PERSON
      ?auto_26053 - AIRCRAFT
      ?auto_26054 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26057 ?auto_26056 ) ( not ( = ?auto_26049 ?auto_26058 ) ) ( not ( = ?auto_26056 ?auto_26057 ) ) ( PERSON-AT ?auto_26052 ?auto_26049 ) ( not ( = ?auto_26052 ?auto_26051 ) ) ( PERSON-AT ?auto_26051 ?auto_26058 ) ( IN ?auto_26055 ?auto_26053 ) ( not ( = ?auto_26052 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( AIRCRAFT-AT ?auto_26053 ?auto_26054 ) ( FUEL-LEVEL ?auto_26053 ?auto_26056 ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26058 ?auto_26054 ) ) ( PERSON-AT ?auto_26050 ?auto_26049 ) ( not ( = ?auto_26050 ?auto_26051 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26055 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26052 ?auto_26051 ?auto_26049 )
      ( FLY-3PPL-VERIFY ?auto_26050 ?auto_26051 ?auto_26052 ?auto_26049 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26060 - PERSON
      ?auto_26061 - PERSON
      ?auto_26062 - PERSON
      ?auto_26059 - CITY
    )
    :vars
    (
      ?auto_26066 - FLEVEL
      ?auto_26065 - FLEVEL
      ?auto_26067 - CITY
      ?auto_26063 - AIRCRAFT
      ?auto_26064 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26066 ?auto_26065 ) ( not ( = ?auto_26059 ?auto_26067 ) ) ( not ( = ?auto_26065 ?auto_26066 ) ) ( PERSON-AT ?auto_26060 ?auto_26059 ) ( not ( = ?auto_26060 ?auto_26061 ) ) ( PERSON-AT ?auto_26061 ?auto_26067 ) ( IN ?auto_26062 ?auto_26063 ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( AIRCRAFT-AT ?auto_26063 ?auto_26064 ) ( FUEL-LEVEL ?auto_26063 ?auto_26065 ) ( not ( = ?auto_26059 ?auto_26064 ) ) ( not ( = ?auto_26067 ?auto_26064 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26060 ?auto_26061 ?auto_26059 )
      ( FLY-3PPL-VERIFY ?auto_26060 ?auto_26061 ?auto_26062 ?auto_26059 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26079 - PERSON
      ?auto_26080 - PERSON
      ?auto_26081 - PERSON
      ?auto_26078 - CITY
    )
    :vars
    (
      ?auto_26085 - FLEVEL
      ?auto_26084 - FLEVEL
      ?auto_26086 - CITY
      ?auto_26082 - AIRCRAFT
      ?auto_26083 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26085 ?auto_26084 ) ( not ( = ?auto_26078 ?auto_26086 ) ) ( not ( = ?auto_26084 ?auto_26085 ) ) ( PERSON-AT ?auto_26080 ?auto_26078 ) ( not ( = ?auto_26080 ?auto_26081 ) ) ( PERSON-AT ?auto_26081 ?auto_26086 ) ( IN ?auto_26079 ?auto_26082 ) ( not ( = ?auto_26080 ?auto_26079 ) ) ( not ( = ?auto_26081 ?auto_26079 ) ) ( AIRCRAFT-AT ?auto_26082 ?auto_26083 ) ( FUEL-LEVEL ?auto_26082 ?auto_26084 ) ( not ( = ?auto_26078 ?auto_26083 ) ) ( not ( = ?auto_26086 ?auto_26083 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26080 ?auto_26081 ?auto_26078 )
      ( FLY-3PPL-VERIFY ?auto_26079 ?auto_26080 ?auto_26081 ?auto_26078 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26098 - PERSON
      ?auto_26099 - PERSON
      ?auto_26100 - PERSON
      ?auto_26097 - CITY
    )
    :vars
    (
      ?auto_26104 - FLEVEL
      ?auto_26103 - FLEVEL
      ?auto_26105 - CITY
      ?auto_26101 - AIRCRAFT
      ?auto_26102 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26104 ?auto_26103 ) ( not ( = ?auto_26097 ?auto_26105 ) ) ( not ( = ?auto_26103 ?auto_26104 ) ) ( PERSON-AT ?auto_26100 ?auto_26097 ) ( not ( = ?auto_26100 ?auto_26099 ) ) ( PERSON-AT ?auto_26099 ?auto_26105 ) ( IN ?auto_26098 ?auto_26101 ) ( not ( = ?auto_26100 ?auto_26098 ) ) ( not ( = ?auto_26099 ?auto_26098 ) ) ( AIRCRAFT-AT ?auto_26101 ?auto_26102 ) ( FUEL-LEVEL ?auto_26101 ?auto_26103 ) ( not ( = ?auto_26097 ?auto_26102 ) ) ( not ( = ?auto_26105 ?auto_26102 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26100 ?auto_26099 ?auto_26097 )
      ( FLY-3PPL-VERIFY ?auto_26098 ?auto_26099 ?auto_26100 ?auto_26097 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26127 - PERSON
      ?auto_26128 - PERSON
      ?auto_26129 - PERSON
      ?auto_26126 - CITY
    )
    :vars
    (
      ?auto_26134 - FLEVEL
      ?auto_26133 - FLEVEL
      ?auto_26135 - CITY
      ?auto_26132 - PERSON
      ?auto_26130 - AIRCRAFT
      ?auto_26131 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26134 ?auto_26133 ) ( not ( = ?auto_26126 ?auto_26135 ) ) ( not ( = ?auto_26133 ?auto_26134 ) ) ( PERSON-AT ?auto_26128 ?auto_26126 ) ( not ( = ?auto_26128 ?auto_26127 ) ) ( PERSON-AT ?auto_26127 ?auto_26135 ) ( IN ?auto_26132 ?auto_26130 ) ( not ( = ?auto_26128 ?auto_26132 ) ) ( not ( = ?auto_26127 ?auto_26132 ) ) ( AIRCRAFT-AT ?auto_26130 ?auto_26131 ) ( FUEL-LEVEL ?auto_26130 ?auto_26133 ) ( not ( = ?auto_26126 ?auto_26131 ) ) ( not ( = ?auto_26135 ?auto_26131 ) ) ( PERSON-AT ?auto_26129 ?auto_26126 ) ( not ( = ?auto_26127 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( not ( = ?auto_26129 ?auto_26132 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26128 ?auto_26127 ?auto_26126 )
      ( FLY-3PPL-VERIFY ?auto_26127 ?auto_26128 ?auto_26129 ?auto_26126 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26137 - PERSON
      ?auto_26138 - PERSON
      ?auto_26139 - PERSON
      ?auto_26136 - CITY
    )
    :vars
    (
      ?auto_26143 - FLEVEL
      ?auto_26142 - FLEVEL
      ?auto_26144 - CITY
      ?auto_26140 - AIRCRAFT
      ?auto_26141 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26143 ?auto_26142 ) ( not ( = ?auto_26136 ?auto_26144 ) ) ( not ( = ?auto_26142 ?auto_26143 ) ) ( PERSON-AT ?auto_26138 ?auto_26136 ) ( not ( = ?auto_26138 ?auto_26137 ) ) ( PERSON-AT ?auto_26137 ?auto_26144 ) ( IN ?auto_26139 ?auto_26140 ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26139 ) ) ( AIRCRAFT-AT ?auto_26140 ?auto_26141 ) ( FUEL-LEVEL ?auto_26140 ?auto_26142 ) ( not ( = ?auto_26136 ?auto_26141 ) ) ( not ( = ?auto_26144 ?auto_26141 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26138 ?auto_26137 ?auto_26136 )
      ( FLY-3PPL-VERIFY ?auto_26137 ?auto_26138 ?auto_26139 ?auto_26136 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26156 - PERSON
      ?auto_26157 - PERSON
      ?auto_26158 - PERSON
      ?auto_26155 - CITY
    )
    :vars
    (
      ?auto_26162 - FLEVEL
      ?auto_26161 - FLEVEL
      ?auto_26163 - CITY
      ?auto_26159 - AIRCRAFT
      ?auto_26160 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26162 ?auto_26161 ) ( not ( = ?auto_26155 ?auto_26163 ) ) ( not ( = ?auto_26161 ?auto_26162 ) ) ( PERSON-AT ?auto_26158 ?auto_26155 ) ( not ( = ?auto_26158 ?auto_26156 ) ) ( PERSON-AT ?auto_26156 ?auto_26163 ) ( IN ?auto_26157 ?auto_26159 ) ( not ( = ?auto_26158 ?auto_26157 ) ) ( not ( = ?auto_26156 ?auto_26157 ) ) ( AIRCRAFT-AT ?auto_26159 ?auto_26160 ) ( FUEL-LEVEL ?auto_26159 ?auto_26161 ) ( not ( = ?auto_26155 ?auto_26160 ) ) ( not ( = ?auto_26163 ?auto_26160 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26158 ?auto_26156 ?auto_26155 )
      ( FLY-3PPL-VERIFY ?auto_26156 ?auto_26157 ?auto_26158 ?auto_26155 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_26216 - PERSON
      ?auto_26215 - CITY
    )
    :vars
    (
      ?auto_26221 - FLEVEL
      ?auto_26220 - FLEVEL
      ?auto_26222 - CITY
      ?auto_26223 - PERSON
      ?auto_26219 - PERSON
      ?auto_26217 - AIRCRAFT
      ?auto_26218 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26221 ?auto_26220 ) ( not ( = ?auto_26215 ?auto_26222 ) ) ( not ( = ?auto_26220 ?auto_26221 ) ) ( PERSON-AT ?auto_26223 ?auto_26215 ) ( not ( = ?auto_26223 ?auto_26216 ) ) ( PERSON-AT ?auto_26216 ?auto_26222 ) ( not ( = ?auto_26223 ?auto_26219 ) ) ( not ( = ?auto_26216 ?auto_26219 ) ) ( AIRCRAFT-AT ?auto_26217 ?auto_26218 ) ( FUEL-LEVEL ?auto_26217 ?auto_26220 ) ( not ( = ?auto_26215 ?auto_26218 ) ) ( not ( = ?auto_26222 ?auto_26218 ) ) ( PERSON-AT ?auto_26219 ?auto_26218 ) )
    :subtasks
    ( ( !BOARD ?auto_26219 ?auto_26217 ?auto_26218 )
      ( FLY-2PPL ?auto_26223 ?auto_26216 ?auto_26215 )
      ( FLY-1PPL-VERIFY ?auto_26216 ?auto_26215 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26225 - PERSON
      ?auto_26226 - PERSON
      ?auto_26224 - CITY
    )
    :vars
    (
      ?auto_26229 - FLEVEL
      ?auto_26227 - FLEVEL
      ?auto_26228 - CITY
      ?auto_26230 - PERSON
      ?auto_26231 - AIRCRAFT
      ?auto_26232 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26229 ?auto_26227 ) ( not ( = ?auto_26224 ?auto_26228 ) ) ( not ( = ?auto_26227 ?auto_26229 ) ) ( PERSON-AT ?auto_26225 ?auto_26224 ) ( not ( = ?auto_26225 ?auto_26226 ) ) ( PERSON-AT ?auto_26226 ?auto_26228 ) ( not ( = ?auto_26225 ?auto_26230 ) ) ( not ( = ?auto_26226 ?auto_26230 ) ) ( AIRCRAFT-AT ?auto_26231 ?auto_26232 ) ( FUEL-LEVEL ?auto_26231 ?auto_26227 ) ( not ( = ?auto_26224 ?auto_26232 ) ) ( not ( = ?auto_26228 ?auto_26232 ) ) ( PERSON-AT ?auto_26230 ?auto_26232 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_26226 ?auto_26224 )
      ( FLY-2PPL-VERIFY ?auto_26225 ?auto_26226 ?auto_26224 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26234 - PERSON
      ?auto_26235 - PERSON
      ?auto_26233 - CITY
    )
    :vars
    (
      ?auto_26237 - FLEVEL
      ?auto_26239 - FLEVEL
      ?auto_26238 - CITY
      ?auto_26240 - PERSON
      ?auto_26236 - AIRCRAFT
      ?auto_26241 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26237 ?auto_26239 ) ( not ( = ?auto_26233 ?auto_26238 ) ) ( not ( = ?auto_26239 ?auto_26237 ) ) ( PERSON-AT ?auto_26240 ?auto_26233 ) ( not ( = ?auto_26240 ?auto_26235 ) ) ( PERSON-AT ?auto_26235 ?auto_26238 ) ( not ( = ?auto_26240 ?auto_26234 ) ) ( not ( = ?auto_26235 ?auto_26234 ) ) ( AIRCRAFT-AT ?auto_26236 ?auto_26241 ) ( FUEL-LEVEL ?auto_26236 ?auto_26239 ) ( not ( = ?auto_26233 ?auto_26241 ) ) ( not ( = ?auto_26238 ?auto_26241 ) ) ( PERSON-AT ?auto_26234 ?auto_26241 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26240 ?auto_26235 ?auto_26233 )
      ( FLY-2PPL-VERIFY ?auto_26234 ?auto_26235 ?auto_26233 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26243 - PERSON
      ?auto_26244 - PERSON
      ?auto_26242 - CITY
    )
    :vars
    (
      ?auto_26246 - FLEVEL
      ?auto_26248 - FLEVEL
      ?auto_26247 - CITY
      ?auto_26249 - PERSON
      ?auto_26245 - AIRCRAFT
      ?auto_26250 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26246 ?auto_26248 ) ( not ( = ?auto_26242 ?auto_26247 ) ) ( not ( = ?auto_26248 ?auto_26246 ) ) ( PERSON-AT ?auto_26244 ?auto_26242 ) ( not ( = ?auto_26244 ?auto_26243 ) ) ( PERSON-AT ?auto_26243 ?auto_26247 ) ( not ( = ?auto_26244 ?auto_26249 ) ) ( not ( = ?auto_26243 ?auto_26249 ) ) ( AIRCRAFT-AT ?auto_26245 ?auto_26250 ) ( FUEL-LEVEL ?auto_26245 ?auto_26248 ) ( not ( = ?auto_26242 ?auto_26250 ) ) ( not ( = ?auto_26247 ?auto_26250 ) ) ( PERSON-AT ?auto_26249 ?auto_26250 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26244 ?auto_26243 ?auto_26242 )
      ( FLY-2PPL-VERIFY ?auto_26243 ?auto_26244 ?auto_26242 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26252 - PERSON
      ?auto_26253 - PERSON
      ?auto_26251 - CITY
    )
    :vars
    (
      ?auto_26255 - FLEVEL
      ?auto_26257 - FLEVEL
      ?auto_26256 - CITY
      ?auto_26258 - PERSON
      ?auto_26254 - AIRCRAFT
      ?auto_26259 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26255 ?auto_26257 ) ( not ( = ?auto_26251 ?auto_26256 ) ) ( not ( = ?auto_26257 ?auto_26255 ) ) ( PERSON-AT ?auto_26258 ?auto_26251 ) ( not ( = ?auto_26258 ?auto_26252 ) ) ( PERSON-AT ?auto_26252 ?auto_26256 ) ( not ( = ?auto_26258 ?auto_26253 ) ) ( not ( = ?auto_26252 ?auto_26253 ) ) ( AIRCRAFT-AT ?auto_26254 ?auto_26259 ) ( FUEL-LEVEL ?auto_26254 ?auto_26257 ) ( not ( = ?auto_26251 ?auto_26259 ) ) ( not ( = ?auto_26256 ?auto_26259 ) ) ( PERSON-AT ?auto_26253 ?auto_26259 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26258 ?auto_26252 ?auto_26251 )
      ( FLY-2PPL-VERIFY ?auto_26252 ?auto_26253 ?auto_26251 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26271 - PERSON
      ?auto_26272 - PERSON
      ?auto_26273 - PERSON
      ?auto_26270 - CITY
    )
    :vars
    (
      ?auto_26275 - FLEVEL
      ?auto_26277 - FLEVEL
      ?auto_26276 - CITY
      ?auto_26278 - PERSON
      ?auto_26274 - AIRCRAFT
      ?auto_26279 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26275 ?auto_26277 ) ( not ( = ?auto_26270 ?auto_26276 ) ) ( not ( = ?auto_26277 ?auto_26275 ) ) ( PERSON-AT ?auto_26272 ?auto_26270 ) ( not ( = ?auto_26272 ?auto_26273 ) ) ( PERSON-AT ?auto_26273 ?auto_26276 ) ( not ( = ?auto_26272 ?auto_26278 ) ) ( not ( = ?auto_26273 ?auto_26278 ) ) ( AIRCRAFT-AT ?auto_26274 ?auto_26279 ) ( FUEL-LEVEL ?auto_26274 ?auto_26277 ) ( not ( = ?auto_26270 ?auto_26279 ) ) ( not ( = ?auto_26276 ?auto_26279 ) ) ( PERSON-AT ?auto_26278 ?auto_26279 ) ( PERSON-AT ?auto_26271 ?auto_26270 ) ( not ( = ?auto_26271 ?auto_26272 ) ) ( not ( = ?auto_26271 ?auto_26273 ) ) ( not ( = ?auto_26271 ?auto_26278 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26272 ?auto_26273 ?auto_26270 )
      ( FLY-3PPL-VERIFY ?auto_26271 ?auto_26272 ?auto_26273 ?auto_26270 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26281 - PERSON
      ?auto_26282 - PERSON
      ?auto_26283 - PERSON
      ?auto_26280 - CITY
    )
    :vars
    (
      ?auto_26285 - FLEVEL
      ?auto_26287 - FLEVEL
      ?auto_26286 - CITY
      ?auto_26284 - AIRCRAFT
      ?auto_26288 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26285 ?auto_26287 ) ( not ( = ?auto_26280 ?auto_26286 ) ) ( not ( = ?auto_26287 ?auto_26285 ) ) ( PERSON-AT ?auto_26281 ?auto_26280 ) ( not ( = ?auto_26281 ?auto_26283 ) ) ( PERSON-AT ?auto_26283 ?auto_26286 ) ( not ( = ?auto_26281 ?auto_26282 ) ) ( not ( = ?auto_26283 ?auto_26282 ) ) ( AIRCRAFT-AT ?auto_26284 ?auto_26288 ) ( FUEL-LEVEL ?auto_26284 ?auto_26287 ) ( not ( = ?auto_26280 ?auto_26288 ) ) ( not ( = ?auto_26286 ?auto_26288 ) ) ( PERSON-AT ?auto_26282 ?auto_26288 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26281 ?auto_26283 ?auto_26280 )
      ( FLY-3PPL-VERIFY ?auto_26281 ?auto_26282 ?auto_26283 ?auto_26280 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26290 - PERSON
      ?auto_26291 - PERSON
      ?auto_26292 - PERSON
      ?auto_26289 - CITY
    )
    :vars
    (
      ?auto_26294 - FLEVEL
      ?auto_26296 - FLEVEL
      ?auto_26295 - CITY
      ?auto_26297 - PERSON
      ?auto_26293 - AIRCRAFT
      ?auto_26298 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26294 ?auto_26296 ) ( not ( = ?auto_26289 ?auto_26295 ) ) ( not ( = ?auto_26296 ?auto_26294 ) ) ( PERSON-AT ?auto_26292 ?auto_26289 ) ( not ( = ?auto_26292 ?auto_26291 ) ) ( PERSON-AT ?auto_26291 ?auto_26295 ) ( not ( = ?auto_26292 ?auto_26297 ) ) ( not ( = ?auto_26291 ?auto_26297 ) ) ( AIRCRAFT-AT ?auto_26293 ?auto_26298 ) ( FUEL-LEVEL ?auto_26293 ?auto_26296 ) ( not ( = ?auto_26289 ?auto_26298 ) ) ( not ( = ?auto_26295 ?auto_26298 ) ) ( PERSON-AT ?auto_26297 ?auto_26298 ) ( PERSON-AT ?auto_26290 ?auto_26289 ) ( not ( = ?auto_26290 ?auto_26291 ) ) ( not ( = ?auto_26290 ?auto_26292 ) ) ( not ( = ?auto_26290 ?auto_26297 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26292 ?auto_26291 ?auto_26289 )
      ( FLY-3PPL-VERIFY ?auto_26290 ?auto_26291 ?auto_26292 ?auto_26289 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26300 - PERSON
      ?auto_26301 - PERSON
      ?auto_26302 - PERSON
      ?auto_26299 - CITY
    )
    :vars
    (
      ?auto_26304 - FLEVEL
      ?auto_26306 - FLEVEL
      ?auto_26305 - CITY
      ?auto_26303 - AIRCRAFT
      ?auto_26307 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26304 ?auto_26306 ) ( not ( = ?auto_26299 ?auto_26305 ) ) ( not ( = ?auto_26306 ?auto_26304 ) ) ( PERSON-AT ?auto_26300 ?auto_26299 ) ( not ( = ?auto_26300 ?auto_26301 ) ) ( PERSON-AT ?auto_26301 ?auto_26305 ) ( not ( = ?auto_26300 ?auto_26302 ) ) ( not ( = ?auto_26301 ?auto_26302 ) ) ( AIRCRAFT-AT ?auto_26303 ?auto_26307 ) ( FUEL-LEVEL ?auto_26303 ?auto_26306 ) ( not ( = ?auto_26299 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( PERSON-AT ?auto_26302 ?auto_26307 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26300 ?auto_26301 ?auto_26299 )
      ( FLY-3PPL-VERIFY ?auto_26300 ?auto_26301 ?auto_26302 ?auto_26299 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26319 - PERSON
      ?auto_26320 - PERSON
      ?auto_26321 - PERSON
      ?auto_26318 - CITY
    )
    :vars
    (
      ?auto_26323 - FLEVEL
      ?auto_26325 - FLEVEL
      ?auto_26324 - CITY
      ?auto_26322 - AIRCRAFT
      ?auto_26326 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26323 ?auto_26325 ) ( not ( = ?auto_26318 ?auto_26324 ) ) ( not ( = ?auto_26325 ?auto_26323 ) ) ( PERSON-AT ?auto_26320 ?auto_26318 ) ( not ( = ?auto_26320 ?auto_26321 ) ) ( PERSON-AT ?auto_26321 ?auto_26324 ) ( not ( = ?auto_26320 ?auto_26319 ) ) ( not ( = ?auto_26321 ?auto_26319 ) ) ( AIRCRAFT-AT ?auto_26322 ?auto_26326 ) ( FUEL-LEVEL ?auto_26322 ?auto_26325 ) ( not ( = ?auto_26318 ?auto_26326 ) ) ( not ( = ?auto_26324 ?auto_26326 ) ) ( PERSON-AT ?auto_26319 ?auto_26326 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26320 ?auto_26321 ?auto_26318 )
      ( FLY-3PPL-VERIFY ?auto_26319 ?auto_26320 ?auto_26321 ?auto_26318 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26338 - PERSON
      ?auto_26339 - PERSON
      ?auto_26340 - PERSON
      ?auto_26337 - CITY
    )
    :vars
    (
      ?auto_26342 - FLEVEL
      ?auto_26344 - FLEVEL
      ?auto_26343 - CITY
      ?auto_26341 - AIRCRAFT
      ?auto_26345 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26342 ?auto_26344 ) ( not ( = ?auto_26337 ?auto_26343 ) ) ( not ( = ?auto_26344 ?auto_26342 ) ) ( PERSON-AT ?auto_26340 ?auto_26337 ) ( not ( = ?auto_26340 ?auto_26339 ) ) ( PERSON-AT ?auto_26339 ?auto_26343 ) ( not ( = ?auto_26340 ?auto_26338 ) ) ( not ( = ?auto_26339 ?auto_26338 ) ) ( AIRCRAFT-AT ?auto_26341 ?auto_26345 ) ( FUEL-LEVEL ?auto_26341 ?auto_26344 ) ( not ( = ?auto_26337 ?auto_26345 ) ) ( not ( = ?auto_26343 ?auto_26345 ) ) ( PERSON-AT ?auto_26338 ?auto_26345 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26340 ?auto_26339 ?auto_26337 )
      ( FLY-3PPL-VERIFY ?auto_26338 ?auto_26339 ?auto_26340 ?auto_26337 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26367 - PERSON
      ?auto_26368 - PERSON
      ?auto_26369 - PERSON
      ?auto_26366 - CITY
    )
    :vars
    (
      ?auto_26371 - FLEVEL
      ?auto_26373 - FLEVEL
      ?auto_26372 - CITY
      ?auto_26374 - PERSON
      ?auto_26370 - AIRCRAFT
      ?auto_26375 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26371 ?auto_26373 ) ( not ( = ?auto_26366 ?auto_26372 ) ) ( not ( = ?auto_26373 ?auto_26371 ) ) ( PERSON-AT ?auto_26369 ?auto_26366 ) ( not ( = ?auto_26369 ?auto_26367 ) ) ( PERSON-AT ?auto_26367 ?auto_26372 ) ( not ( = ?auto_26369 ?auto_26374 ) ) ( not ( = ?auto_26367 ?auto_26374 ) ) ( AIRCRAFT-AT ?auto_26370 ?auto_26375 ) ( FUEL-LEVEL ?auto_26370 ?auto_26373 ) ( not ( = ?auto_26366 ?auto_26375 ) ) ( not ( = ?auto_26372 ?auto_26375 ) ) ( PERSON-AT ?auto_26374 ?auto_26375 ) ( PERSON-AT ?auto_26368 ?auto_26366 ) ( not ( = ?auto_26367 ?auto_26368 ) ) ( not ( = ?auto_26368 ?auto_26369 ) ) ( not ( = ?auto_26368 ?auto_26374 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26369 ?auto_26367 ?auto_26366 )
      ( FLY-3PPL-VERIFY ?auto_26367 ?auto_26368 ?auto_26369 ?auto_26366 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26377 - PERSON
      ?auto_26378 - PERSON
      ?auto_26379 - PERSON
      ?auto_26376 - CITY
    )
    :vars
    (
      ?auto_26381 - FLEVEL
      ?auto_26383 - FLEVEL
      ?auto_26382 - CITY
      ?auto_26380 - AIRCRAFT
      ?auto_26384 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26381 ?auto_26383 ) ( not ( = ?auto_26376 ?auto_26382 ) ) ( not ( = ?auto_26383 ?auto_26381 ) ) ( PERSON-AT ?auto_26378 ?auto_26376 ) ( not ( = ?auto_26378 ?auto_26377 ) ) ( PERSON-AT ?auto_26377 ?auto_26382 ) ( not ( = ?auto_26378 ?auto_26379 ) ) ( not ( = ?auto_26377 ?auto_26379 ) ) ( AIRCRAFT-AT ?auto_26380 ?auto_26384 ) ( FUEL-LEVEL ?auto_26380 ?auto_26383 ) ( not ( = ?auto_26376 ?auto_26384 ) ) ( not ( = ?auto_26382 ?auto_26384 ) ) ( PERSON-AT ?auto_26379 ?auto_26384 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26378 ?auto_26377 ?auto_26376 )
      ( FLY-3PPL-VERIFY ?auto_26377 ?auto_26378 ?auto_26379 ?auto_26376 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26396 - PERSON
      ?auto_26397 - PERSON
      ?auto_26398 - PERSON
      ?auto_26395 - CITY
    )
    :vars
    (
      ?auto_26400 - FLEVEL
      ?auto_26402 - FLEVEL
      ?auto_26401 - CITY
      ?auto_26399 - AIRCRAFT
      ?auto_26403 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26400 ?auto_26402 ) ( not ( = ?auto_26395 ?auto_26401 ) ) ( not ( = ?auto_26402 ?auto_26400 ) ) ( PERSON-AT ?auto_26398 ?auto_26395 ) ( not ( = ?auto_26398 ?auto_26396 ) ) ( PERSON-AT ?auto_26396 ?auto_26401 ) ( not ( = ?auto_26398 ?auto_26397 ) ) ( not ( = ?auto_26396 ?auto_26397 ) ) ( AIRCRAFT-AT ?auto_26399 ?auto_26403 ) ( FUEL-LEVEL ?auto_26399 ?auto_26402 ) ( not ( = ?auto_26395 ?auto_26403 ) ) ( not ( = ?auto_26401 ?auto_26403 ) ) ( PERSON-AT ?auto_26397 ?auto_26403 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26398 ?auto_26396 ?auto_26395 )
      ( FLY-3PPL-VERIFY ?auto_26396 ?auto_26397 ?auto_26398 ?auto_26395 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_26456 - PERSON
      ?auto_26455 - CITY
    )
    :vars
    (
      ?auto_26458 - FLEVEL
      ?auto_26460 - FLEVEL
      ?auto_26459 - CITY
      ?auto_26461 - PERSON
      ?auto_26462 - PERSON
      ?auto_26457 - AIRCRAFT
      ?auto_26463 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26458 ?auto_26460 ) ( not ( = ?auto_26455 ?auto_26459 ) ) ( not ( = ?auto_26460 ?auto_26458 ) ) ( PERSON-AT ?auto_26461 ?auto_26455 ) ( not ( = ?auto_26461 ?auto_26456 ) ) ( PERSON-AT ?auto_26456 ?auto_26459 ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26456 ?auto_26462 ) ) ( AIRCRAFT-AT ?auto_26457 ?auto_26463 ) ( not ( = ?auto_26455 ?auto_26463 ) ) ( not ( = ?auto_26459 ?auto_26463 ) ) ( PERSON-AT ?auto_26462 ?auto_26463 ) ( FUEL-LEVEL ?auto_26457 ?auto_26458 ) )
    :subtasks
    ( ( !REFUEL ?auto_26457 ?auto_26463 ?auto_26458 ?auto_26460 )
      ( FLY-2PPL ?auto_26461 ?auto_26456 ?auto_26455 )
      ( FLY-1PPL-VERIFY ?auto_26456 ?auto_26455 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26465 - PERSON
      ?auto_26466 - PERSON
      ?auto_26464 - CITY
    )
    :vars
    (
      ?auto_26469 - FLEVEL
      ?auto_26471 - FLEVEL
      ?auto_26467 - CITY
      ?auto_26470 - PERSON
      ?auto_26468 - AIRCRAFT
      ?auto_26472 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26469 ?auto_26471 ) ( not ( = ?auto_26464 ?auto_26467 ) ) ( not ( = ?auto_26471 ?auto_26469 ) ) ( PERSON-AT ?auto_26465 ?auto_26464 ) ( not ( = ?auto_26465 ?auto_26466 ) ) ( PERSON-AT ?auto_26466 ?auto_26467 ) ( not ( = ?auto_26465 ?auto_26470 ) ) ( not ( = ?auto_26466 ?auto_26470 ) ) ( AIRCRAFT-AT ?auto_26468 ?auto_26472 ) ( not ( = ?auto_26464 ?auto_26472 ) ) ( not ( = ?auto_26467 ?auto_26472 ) ) ( PERSON-AT ?auto_26470 ?auto_26472 ) ( FUEL-LEVEL ?auto_26468 ?auto_26469 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_26466 ?auto_26464 )
      ( FLY-2PPL-VERIFY ?auto_26465 ?auto_26466 ?auto_26464 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26474 - PERSON
      ?auto_26475 - PERSON
      ?auto_26473 - CITY
    )
    :vars
    (
      ?auto_26479 - FLEVEL
      ?auto_26480 - FLEVEL
      ?auto_26476 - CITY
      ?auto_26477 - PERSON
      ?auto_26481 - AIRCRAFT
      ?auto_26478 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26479 ?auto_26480 ) ( not ( = ?auto_26473 ?auto_26476 ) ) ( not ( = ?auto_26480 ?auto_26479 ) ) ( PERSON-AT ?auto_26477 ?auto_26473 ) ( not ( = ?auto_26477 ?auto_26475 ) ) ( PERSON-AT ?auto_26475 ?auto_26476 ) ( not ( = ?auto_26477 ?auto_26474 ) ) ( not ( = ?auto_26475 ?auto_26474 ) ) ( AIRCRAFT-AT ?auto_26481 ?auto_26478 ) ( not ( = ?auto_26473 ?auto_26478 ) ) ( not ( = ?auto_26476 ?auto_26478 ) ) ( PERSON-AT ?auto_26474 ?auto_26478 ) ( FUEL-LEVEL ?auto_26481 ?auto_26479 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26477 ?auto_26475 ?auto_26473 )
      ( FLY-2PPL-VERIFY ?auto_26474 ?auto_26475 ?auto_26473 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26483 - PERSON
      ?auto_26484 - PERSON
      ?auto_26482 - CITY
    )
    :vars
    (
      ?auto_26487 - FLEVEL
      ?auto_26488 - FLEVEL
      ?auto_26485 - CITY
      ?auto_26489 - PERSON
      ?auto_26490 - AIRCRAFT
      ?auto_26486 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26487 ?auto_26488 ) ( not ( = ?auto_26482 ?auto_26485 ) ) ( not ( = ?auto_26488 ?auto_26487 ) ) ( PERSON-AT ?auto_26484 ?auto_26482 ) ( not ( = ?auto_26484 ?auto_26483 ) ) ( PERSON-AT ?auto_26483 ?auto_26485 ) ( not ( = ?auto_26484 ?auto_26489 ) ) ( not ( = ?auto_26483 ?auto_26489 ) ) ( AIRCRAFT-AT ?auto_26490 ?auto_26486 ) ( not ( = ?auto_26482 ?auto_26486 ) ) ( not ( = ?auto_26485 ?auto_26486 ) ) ( PERSON-AT ?auto_26489 ?auto_26486 ) ( FUEL-LEVEL ?auto_26490 ?auto_26487 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26484 ?auto_26483 ?auto_26482 )
      ( FLY-2PPL-VERIFY ?auto_26483 ?auto_26484 ?auto_26482 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26492 - PERSON
      ?auto_26493 - PERSON
      ?auto_26491 - CITY
    )
    :vars
    (
      ?auto_26497 - FLEVEL
      ?auto_26498 - FLEVEL
      ?auto_26494 - CITY
      ?auto_26495 - PERSON
      ?auto_26499 - AIRCRAFT
      ?auto_26496 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26497 ?auto_26498 ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26498 ?auto_26497 ) ) ( PERSON-AT ?auto_26495 ?auto_26491 ) ( not ( = ?auto_26495 ?auto_26492 ) ) ( PERSON-AT ?auto_26492 ?auto_26494 ) ( not ( = ?auto_26495 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( AIRCRAFT-AT ?auto_26499 ?auto_26496 ) ( not ( = ?auto_26491 ?auto_26496 ) ) ( not ( = ?auto_26494 ?auto_26496 ) ) ( PERSON-AT ?auto_26493 ?auto_26496 ) ( FUEL-LEVEL ?auto_26499 ?auto_26497 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26495 ?auto_26492 ?auto_26491 )
      ( FLY-2PPL-VERIFY ?auto_26492 ?auto_26493 ?auto_26491 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26511 - PERSON
      ?auto_26512 - PERSON
      ?auto_26513 - PERSON
      ?auto_26510 - CITY
    )
    :vars
    (
      ?auto_26516 - FLEVEL
      ?auto_26517 - FLEVEL
      ?auto_26514 - CITY
      ?auto_26518 - PERSON
      ?auto_26519 - AIRCRAFT
      ?auto_26515 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26516 ?auto_26517 ) ( not ( = ?auto_26510 ?auto_26514 ) ) ( not ( = ?auto_26517 ?auto_26516 ) ) ( PERSON-AT ?auto_26512 ?auto_26510 ) ( not ( = ?auto_26512 ?auto_26513 ) ) ( PERSON-AT ?auto_26513 ?auto_26514 ) ( not ( = ?auto_26512 ?auto_26518 ) ) ( not ( = ?auto_26513 ?auto_26518 ) ) ( AIRCRAFT-AT ?auto_26519 ?auto_26515 ) ( not ( = ?auto_26510 ?auto_26515 ) ) ( not ( = ?auto_26514 ?auto_26515 ) ) ( PERSON-AT ?auto_26518 ?auto_26515 ) ( FUEL-LEVEL ?auto_26519 ?auto_26516 ) ( PERSON-AT ?auto_26511 ?auto_26510 ) ( not ( = ?auto_26511 ?auto_26512 ) ) ( not ( = ?auto_26511 ?auto_26513 ) ) ( not ( = ?auto_26511 ?auto_26518 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26512 ?auto_26513 ?auto_26510 )
      ( FLY-3PPL-VERIFY ?auto_26511 ?auto_26512 ?auto_26513 ?auto_26510 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26521 - PERSON
      ?auto_26522 - PERSON
      ?auto_26523 - PERSON
      ?auto_26520 - CITY
    )
    :vars
    (
      ?auto_26526 - FLEVEL
      ?auto_26527 - FLEVEL
      ?auto_26524 - CITY
      ?auto_26528 - AIRCRAFT
      ?auto_26525 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26526 ?auto_26527 ) ( not ( = ?auto_26520 ?auto_26524 ) ) ( not ( = ?auto_26527 ?auto_26526 ) ) ( PERSON-AT ?auto_26521 ?auto_26520 ) ( not ( = ?auto_26521 ?auto_26523 ) ) ( PERSON-AT ?auto_26523 ?auto_26524 ) ( not ( = ?auto_26521 ?auto_26522 ) ) ( not ( = ?auto_26523 ?auto_26522 ) ) ( AIRCRAFT-AT ?auto_26528 ?auto_26525 ) ( not ( = ?auto_26520 ?auto_26525 ) ) ( not ( = ?auto_26524 ?auto_26525 ) ) ( PERSON-AT ?auto_26522 ?auto_26525 ) ( FUEL-LEVEL ?auto_26528 ?auto_26526 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26521 ?auto_26523 ?auto_26520 )
      ( FLY-3PPL-VERIFY ?auto_26521 ?auto_26522 ?auto_26523 ?auto_26520 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26530 - PERSON
      ?auto_26531 - PERSON
      ?auto_26532 - PERSON
      ?auto_26529 - CITY
    )
    :vars
    (
      ?auto_26535 - FLEVEL
      ?auto_26536 - FLEVEL
      ?auto_26533 - CITY
      ?auto_26537 - PERSON
      ?auto_26538 - AIRCRAFT
      ?auto_26534 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26535 ?auto_26536 ) ( not ( = ?auto_26529 ?auto_26533 ) ) ( not ( = ?auto_26536 ?auto_26535 ) ) ( PERSON-AT ?auto_26532 ?auto_26529 ) ( not ( = ?auto_26532 ?auto_26531 ) ) ( PERSON-AT ?auto_26531 ?auto_26533 ) ( not ( = ?auto_26532 ?auto_26537 ) ) ( not ( = ?auto_26531 ?auto_26537 ) ) ( AIRCRAFT-AT ?auto_26538 ?auto_26534 ) ( not ( = ?auto_26529 ?auto_26534 ) ) ( not ( = ?auto_26533 ?auto_26534 ) ) ( PERSON-AT ?auto_26537 ?auto_26534 ) ( FUEL-LEVEL ?auto_26538 ?auto_26535 ) ( PERSON-AT ?auto_26530 ?auto_26529 ) ( not ( = ?auto_26530 ?auto_26531 ) ) ( not ( = ?auto_26530 ?auto_26532 ) ) ( not ( = ?auto_26530 ?auto_26537 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26532 ?auto_26531 ?auto_26529 )
      ( FLY-3PPL-VERIFY ?auto_26530 ?auto_26531 ?auto_26532 ?auto_26529 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26540 - PERSON
      ?auto_26541 - PERSON
      ?auto_26542 - PERSON
      ?auto_26539 - CITY
    )
    :vars
    (
      ?auto_26545 - FLEVEL
      ?auto_26546 - FLEVEL
      ?auto_26543 - CITY
      ?auto_26547 - AIRCRAFT
      ?auto_26544 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26545 ?auto_26546 ) ( not ( = ?auto_26539 ?auto_26543 ) ) ( not ( = ?auto_26546 ?auto_26545 ) ) ( PERSON-AT ?auto_26540 ?auto_26539 ) ( not ( = ?auto_26540 ?auto_26541 ) ) ( PERSON-AT ?auto_26541 ?auto_26543 ) ( not ( = ?auto_26540 ?auto_26542 ) ) ( not ( = ?auto_26541 ?auto_26542 ) ) ( AIRCRAFT-AT ?auto_26547 ?auto_26544 ) ( not ( = ?auto_26539 ?auto_26544 ) ) ( not ( = ?auto_26543 ?auto_26544 ) ) ( PERSON-AT ?auto_26542 ?auto_26544 ) ( FUEL-LEVEL ?auto_26547 ?auto_26545 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26540 ?auto_26541 ?auto_26539 )
      ( FLY-3PPL-VERIFY ?auto_26540 ?auto_26541 ?auto_26542 ?auto_26539 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26559 - PERSON
      ?auto_26560 - PERSON
      ?auto_26561 - PERSON
      ?auto_26558 - CITY
    )
    :vars
    (
      ?auto_26564 - FLEVEL
      ?auto_26565 - FLEVEL
      ?auto_26562 - CITY
      ?auto_26566 - AIRCRAFT
      ?auto_26563 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26564 ?auto_26565 ) ( not ( = ?auto_26558 ?auto_26562 ) ) ( not ( = ?auto_26565 ?auto_26564 ) ) ( PERSON-AT ?auto_26560 ?auto_26558 ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( PERSON-AT ?auto_26561 ?auto_26562 ) ( not ( = ?auto_26560 ?auto_26559 ) ) ( not ( = ?auto_26561 ?auto_26559 ) ) ( AIRCRAFT-AT ?auto_26566 ?auto_26563 ) ( not ( = ?auto_26558 ?auto_26563 ) ) ( not ( = ?auto_26562 ?auto_26563 ) ) ( PERSON-AT ?auto_26559 ?auto_26563 ) ( FUEL-LEVEL ?auto_26566 ?auto_26564 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26560 ?auto_26561 ?auto_26558 )
      ( FLY-3PPL-VERIFY ?auto_26559 ?auto_26560 ?auto_26561 ?auto_26558 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26578 - PERSON
      ?auto_26579 - PERSON
      ?auto_26580 - PERSON
      ?auto_26577 - CITY
    )
    :vars
    (
      ?auto_26583 - FLEVEL
      ?auto_26584 - FLEVEL
      ?auto_26581 - CITY
      ?auto_26585 - AIRCRAFT
      ?auto_26582 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26583 ?auto_26584 ) ( not ( = ?auto_26577 ?auto_26581 ) ) ( not ( = ?auto_26584 ?auto_26583 ) ) ( PERSON-AT ?auto_26580 ?auto_26577 ) ( not ( = ?auto_26580 ?auto_26579 ) ) ( PERSON-AT ?auto_26579 ?auto_26581 ) ( not ( = ?auto_26580 ?auto_26578 ) ) ( not ( = ?auto_26579 ?auto_26578 ) ) ( AIRCRAFT-AT ?auto_26585 ?auto_26582 ) ( not ( = ?auto_26577 ?auto_26582 ) ) ( not ( = ?auto_26581 ?auto_26582 ) ) ( PERSON-AT ?auto_26578 ?auto_26582 ) ( FUEL-LEVEL ?auto_26585 ?auto_26583 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26580 ?auto_26579 ?auto_26577 )
      ( FLY-3PPL-VERIFY ?auto_26578 ?auto_26579 ?auto_26580 ?auto_26577 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26607 - PERSON
      ?auto_26608 - PERSON
      ?auto_26609 - PERSON
      ?auto_26606 - CITY
    )
    :vars
    (
      ?auto_26612 - FLEVEL
      ?auto_26613 - FLEVEL
      ?auto_26610 - CITY
      ?auto_26614 - PERSON
      ?auto_26615 - AIRCRAFT
      ?auto_26611 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26612 ?auto_26613 ) ( not ( = ?auto_26606 ?auto_26610 ) ) ( not ( = ?auto_26613 ?auto_26612 ) ) ( PERSON-AT ?auto_26608 ?auto_26606 ) ( not ( = ?auto_26608 ?auto_26607 ) ) ( PERSON-AT ?auto_26607 ?auto_26610 ) ( not ( = ?auto_26608 ?auto_26614 ) ) ( not ( = ?auto_26607 ?auto_26614 ) ) ( AIRCRAFT-AT ?auto_26615 ?auto_26611 ) ( not ( = ?auto_26606 ?auto_26611 ) ) ( not ( = ?auto_26610 ?auto_26611 ) ) ( PERSON-AT ?auto_26614 ?auto_26611 ) ( FUEL-LEVEL ?auto_26615 ?auto_26612 ) ( PERSON-AT ?auto_26609 ?auto_26606 ) ( not ( = ?auto_26607 ?auto_26609 ) ) ( not ( = ?auto_26608 ?auto_26609 ) ) ( not ( = ?auto_26609 ?auto_26614 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26608 ?auto_26607 ?auto_26606 )
      ( FLY-3PPL-VERIFY ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26606 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26617 - PERSON
      ?auto_26618 - PERSON
      ?auto_26619 - PERSON
      ?auto_26616 - CITY
    )
    :vars
    (
      ?auto_26622 - FLEVEL
      ?auto_26623 - FLEVEL
      ?auto_26620 - CITY
      ?auto_26624 - AIRCRAFT
      ?auto_26621 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26622 ?auto_26623 ) ( not ( = ?auto_26616 ?auto_26620 ) ) ( not ( = ?auto_26623 ?auto_26622 ) ) ( PERSON-AT ?auto_26618 ?auto_26616 ) ( not ( = ?auto_26618 ?auto_26617 ) ) ( PERSON-AT ?auto_26617 ?auto_26620 ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26619 ) ) ( AIRCRAFT-AT ?auto_26624 ?auto_26621 ) ( not ( = ?auto_26616 ?auto_26621 ) ) ( not ( = ?auto_26620 ?auto_26621 ) ) ( PERSON-AT ?auto_26619 ?auto_26621 ) ( FUEL-LEVEL ?auto_26624 ?auto_26622 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26618 ?auto_26617 ?auto_26616 )
      ( FLY-3PPL-VERIFY ?auto_26617 ?auto_26618 ?auto_26619 ?auto_26616 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26636 - PERSON
      ?auto_26637 - PERSON
      ?auto_26638 - PERSON
      ?auto_26635 - CITY
    )
    :vars
    (
      ?auto_26641 - FLEVEL
      ?auto_26642 - FLEVEL
      ?auto_26639 - CITY
      ?auto_26643 - AIRCRAFT
      ?auto_26640 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_26641 ?auto_26642 ) ( not ( = ?auto_26635 ?auto_26639 ) ) ( not ( = ?auto_26642 ?auto_26641 ) ) ( PERSON-AT ?auto_26638 ?auto_26635 ) ( not ( = ?auto_26638 ?auto_26636 ) ) ( PERSON-AT ?auto_26636 ?auto_26639 ) ( not ( = ?auto_26638 ?auto_26637 ) ) ( not ( = ?auto_26636 ?auto_26637 ) ) ( AIRCRAFT-AT ?auto_26643 ?auto_26640 ) ( not ( = ?auto_26635 ?auto_26640 ) ) ( not ( = ?auto_26639 ?auto_26640 ) ) ( PERSON-AT ?auto_26637 ?auto_26640 ) ( FUEL-LEVEL ?auto_26643 ?auto_26641 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26638 ?auto_26636 ?auto_26635 )
      ( FLY-3PPL-VERIFY ?auto_26636 ?auto_26637 ?auto_26638 ?auto_26635 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_26696 - PERSON
      ?auto_26695 - CITY
    )
    :vars
    (
      ?auto_26700 - FLEVEL
      ?auto_26701 - FLEVEL
      ?auto_26697 - CITY
      ?auto_26698 - PERSON
      ?auto_26702 - PERSON
      ?auto_26699 - CITY
      ?auto_26703 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26700 ?auto_26701 ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( not ( = ?auto_26701 ?auto_26700 ) ) ( PERSON-AT ?auto_26698 ?auto_26695 ) ( not ( = ?auto_26698 ?auto_26696 ) ) ( PERSON-AT ?auto_26696 ?auto_26697 ) ( not ( = ?auto_26698 ?auto_26702 ) ) ( not ( = ?auto_26696 ?auto_26702 ) ) ( not ( = ?auto_26695 ?auto_26699 ) ) ( not ( = ?auto_26697 ?auto_26699 ) ) ( PERSON-AT ?auto_26702 ?auto_26699 ) ( AIRCRAFT-AT ?auto_26703 ?auto_26695 ) ( FUEL-LEVEL ?auto_26703 ?auto_26701 ) )
    :subtasks
    ( ( !FLY ?auto_26703 ?auto_26695 ?auto_26699 ?auto_26701 ?auto_26700 )
      ( FLY-2PPL ?auto_26698 ?auto_26696 ?auto_26695 )
      ( FLY-1PPL-VERIFY ?auto_26696 ?auto_26695 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26705 - PERSON
      ?auto_26706 - PERSON
      ?auto_26704 - CITY
    )
    :vars
    (
      ?auto_26711 - FLEVEL
      ?auto_26707 - FLEVEL
      ?auto_26712 - CITY
      ?auto_26710 - PERSON
      ?auto_26708 - CITY
      ?auto_26709 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26711 ?auto_26707 ) ( not ( = ?auto_26704 ?auto_26712 ) ) ( not ( = ?auto_26707 ?auto_26711 ) ) ( PERSON-AT ?auto_26705 ?auto_26704 ) ( not ( = ?auto_26705 ?auto_26706 ) ) ( PERSON-AT ?auto_26706 ?auto_26712 ) ( not ( = ?auto_26705 ?auto_26710 ) ) ( not ( = ?auto_26706 ?auto_26710 ) ) ( not ( = ?auto_26704 ?auto_26708 ) ) ( not ( = ?auto_26712 ?auto_26708 ) ) ( PERSON-AT ?auto_26710 ?auto_26708 ) ( AIRCRAFT-AT ?auto_26709 ?auto_26704 ) ( FUEL-LEVEL ?auto_26709 ?auto_26707 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_26706 ?auto_26704 )
      ( FLY-2PPL-VERIFY ?auto_26705 ?auto_26706 ?auto_26704 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26714 - PERSON
      ?auto_26715 - PERSON
      ?auto_26713 - CITY
    )
    :vars
    (
      ?auto_26719 - FLEVEL
      ?auto_26718 - FLEVEL
      ?auto_26717 - CITY
      ?auto_26721 - PERSON
      ?auto_26716 - CITY
      ?auto_26720 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26719 ?auto_26718 ) ( not ( = ?auto_26713 ?auto_26717 ) ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( PERSON-AT ?auto_26721 ?auto_26713 ) ( not ( = ?auto_26721 ?auto_26715 ) ) ( PERSON-AT ?auto_26715 ?auto_26717 ) ( not ( = ?auto_26721 ?auto_26714 ) ) ( not ( = ?auto_26715 ?auto_26714 ) ) ( not ( = ?auto_26713 ?auto_26716 ) ) ( not ( = ?auto_26717 ?auto_26716 ) ) ( PERSON-AT ?auto_26714 ?auto_26716 ) ( AIRCRAFT-AT ?auto_26720 ?auto_26713 ) ( FUEL-LEVEL ?auto_26720 ?auto_26718 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26721 ?auto_26715 ?auto_26713 )
      ( FLY-2PPL-VERIFY ?auto_26714 ?auto_26715 ?auto_26713 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26723 - PERSON
      ?auto_26724 - PERSON
      ?auto_26722 - CITY
    )
    :vars
    (
      ?auto_26728 - FLEVEL
      ?auto_26727 - FLEVEL
      ?auto_26726 - CITY
      ?auto_26729 - PERSON
      ?auto_26725 - CITY
      ?auto_26730 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26728 ?auto_26727 ) ( not ( = ?auto_26722 ?auto_26726 ) ) ( not ( = ?auto_26727 ?auto_26728 ) ) ( PERSON-AT ?auto_26724 ?auto_26722 ) ( not ( = ?auto_26724 ?auto_26723 ) ) ( PERSON-AT ?auto_26723 ?auto_26726 ) ( not ( = ?auto_26724 ?auto_26729 ) ) ( not ( = ?auto_26723 ?auto_26729 ) ) ( not ( = ?auto_26722 ?auto_26725 ) ) ( not ( = ?auto_26726 ?auto_26725 ) ) ( PERSON-AT ?auto_26729 ?auto_26725 ) ( AIRCRAFT-AT ?auto_26730 ?auto_26722 ) ( FUEL-LEVEL ?auto_26730 ?auto_26727 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26724 ?auto_26723 ?auto_26722 )
      ( FLY-2PPL-VERIFY ?auto_26723 ?auto_26724 ?auto_26722 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26732 - PERSON
      ?auto_26733 - PERSON
      ?auto_26731 - CITY
    )
    :vars
    (
      ?auto_26737 - FLEVEL
      ?auto_26736 - FLEVEL
      ?auto_26735 - CITY
      ?auto_26739 - PERSON
      ?auto_26734 - CITY
      ?auto_26738 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26737 ?auto_26736 ) ( not ( = ?auto_26731 ?auto_26735 ) ) ( not ( = ?auto_26736 ?auto_26737 ) ) ( PERSON-AT ?auto_26739 ?auto_26731 ) ( not ( = ?auto_26739 ?auto_26732 ) ) ( PERSON-AT ?auto_26732 ?auto_26735 ) ( not ( = ?auto_26739 ?auto_26733 ) ) ( not ( = ?auto_26732 ?auto_26733 ) ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( not ( = ?auto_26735 ?auto_26734 ) ) ( PERSON-AT ?auto_26733 ?auto_26734 ) ( AIRCRAFT-AT ?auto_26738 ?auto_26731 ) ( FUEL-LEVEL ?auto_26738 ?auto_26736 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26739 ?auto_26732 ?auto_26731 )
      ( FLY-2PPL-VERIFY ?auto_26732 ?auto_26733 ?auto_26731 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26751 - PERSON
      ?auto_26752 - PERSON
      ?auto_26753 - PERSON
      ?auto_26750 - CITY
    )
    :vars
    (
      ?auto_26757 - FLEVEL
      ?auto_26756 - FLEVEL
      ?auto_26755 - CITY
      ?auto_26758 - PERSON
      ?auto_26754 - CITY
      ?auto_26759 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26757 ?auto_26756 ) ( not ( = ?auto_26750 ?auto_26755 ) ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( PERSON-AT ?auto_26752 ?auto_26750 ) ( not ( = ?auto_26752 ?auto_26753 ) ) ( PERSON-AT ?auto_26753 ?auto_26755 ) ( not ( = ?auto_26752 ?auto_26758 ) ) ( not ( = ?auto_26753 ?auto_26758 ) ) ( not ( = ?auto_26750 ?auto_26754 ) ) ( not ( = ?auto_26755 ?auto_26754 ) ) ( PERSON-AT ?auto_26758 ?auto_26754 ) ( AIRCRAFT-AT ?auto_26759 ?auto_26750 ) ( FUEL-LEVEL ?auto_26759 ?auto_26756 ) ( PERSON-AT ?auto_26751 ?auto_26750 ) ( not ( = ?auto_26751 ?auto_26752 ) ) ( not ( = ?auto_26751 ?auto_26753 ) ) ( not ( = ?auto_26751 ?auto_26758 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26752 ?auto_26753 ?auto_26750 )
      ( FLY-3PPL-VERIFY ?auto_26751 ?auto_26752 ?auto_26753 ?auto_26750 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26761 - PERSON
      ?auto_26762 - PERSON
      ?auto_26763 - PERSON
      ?auto_26760 - CITY
    )
    :vars
    (
      ?auto_26767 - FLEVEL
      ?auto_26766 - FLEVEL
      ?auto_26765 - CITY
      ?auto_26764 - CITY
      ?auto_26768 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26767 ?auto_26766 ) ( not ( = ?auto_26760 ?auto_26765 ) ) ( not ( = ?auto_26766 ?auto_26767 ) ) ( PERSON-AT ?auto_26761 ?auto_26760 ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( PERSON-AT ?auto_26763 ?auto_26765 ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26763 ?auto_26762 ) ) ( not ( = ?auto_26760 ?auto_26764 ) ) ( not ( = ?auto_26765 ?auto_26764 ) ) ( PERSON-AT ?auto_26762 ?auto_26764 ) ( AIRCRAFT-AT ?auto_26768 ?auto_26760 ) ( FUEL-LEVEL ?auto_26768 ?auto_26766 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26761 ?auto_26763 ?auto_26760 )
      ( FLY-3PPL-VERIFY ?auto_26761 ?auto_26762 ?auto_26763 ?auto_26760 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26770 - PERSON
      ?auto_26771 - PERSON
      ?auto_26772 - PERSON
      ?auto_26769 - CITY
    )
    :vars
    (
      ?auto_26776 - FLEVEL
      ?auto_26775 - FLEVEL
      ?auto_26774 - CITY
      ?auto_26777 - PERSON
      ?auto_26773 - CITY
      ?auto_26778 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26776 ?auto_26775 ) ( not ( = ?auto_26769 ?auto_26774 ) ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( PERSON-AT ?auto_26772 ?auto_26769 ) ( not ( = ?auto_26772 ?auto_26771 ) ) ( PERSON-AT ?auto_26771 ?auto_26774 ) ( not ( = ?auto_26772 ?auto_26777 ) ) ( not ( = ?auto_26771 ?auto_26777 ) ) ( not ( = ?auto_26769 ?auto_26773 ) ) ( not ( = ?auto_26774 ?auto_26773 ) ) ( PERSON-AT ?auto_26777 ?auto_26773 ) ( AIRCRAFT-AT ?auto_26778 ?auto_26769 ) ( FUEL-LEVEL ?auto_26778 ?auto_26775 ) ( PERSON-AT ?auto_26770 ?auto_26769 ) ( not ( = ?auto_26770 ?auto_26771 ) ) ( not ( = ?auto_26770 ?auto_26772 ) ) ( not ( = ?auto_26770 ?auto_26777 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26772 ?auto_26771 ?auto_26769 )
      ( FLY-3PPL-VERIFY ?auto_26770 ?auto_26771 ?auto_26772 ?auto_26769 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26780 - PERSON
      ?auto_26781 - PERSON
      ?auto_26782 - PERSON
      ?auto_26779 - CITY
    )
    :vars
    (
      ?auto_26786 - FLEVEL
      ?auto_26785 - FLEVEL
      ?auto_26784 - CITY
      ?auto_26783 - CITY
      ?auto_26787 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26786 ?auto_26785 ) ( not ( = ?auto_26779 ?auto_26784 ) ) ( not ( = ?auto_26785 ?auto_26786 ) ) ( PERSON-AT ?auto_26780 ?auto_26779 ) ( not ( = ?auto_26780 ?auto_26781 ) ) ( PERSON-AT ?auto_26781 ?auto_26784 ) ( not ( = ?auto_26780 ?auto_26782 ) ) ( not ( = ?auto_26781 ?auto_26782 ) ) ( not ( = ?auto_26779 ?auto_26783 ) ) ( not ( = ?auto_26784 ?auto_26783 ) ) ( PERSON-AT ?auto_26782 ?auto_26783 ) ( AIRCRAFT-AT ?auto_26787 ?auto_26779 ) ( FUEL-LEVEL ?auto_26787 ?auto_26785 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26780 ?auto_26781 ?auto_26779 )
      ( FLY-3PPL-VERIFY ?auto_26780 ?auto_26781 ?auto_26782 ?auto_26779 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26799 - PERSON
      ?auto_26800 - PERSON
      ?auto_26801 - PERSON
      ?auto_26798 - CITY
    )
    :vars
    (
      ?auto_26805 - FLEVEL
      ?auto_26804 - FLEVEL
      ?auto_26803 - CITY
      ?auto_26802 - CITY
      ?auto_26806 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26805 ?auto_26804 ) ( not ( = ?auto_26798 ?auto_26803 ) ) ( not ( = ?auto_26804 ?auto_26805 ) ) ( PERSON-AT ?auto_26800 ?auto_26798 ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( PERSON-AT ?auto_26801 ?auto_26803 ) ( not ( = ?auto_26800 ?auto_26799 ) ) ( not ( = ?auto_26801 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26803 ?auto_26802 ) ) ( PERSON-AT ?auto_26799 ?auto_26802 ) ( AIRCRAFT-AT ?auto_26806 ?auto_26798 ) ( FUEL-LEVEL ?auto_26806 ?auto_26804 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26800 ?auto_26801 ?auto_26798 )
      ( FLY-3PPL-VERIFY ?auto_26799 ?auto_26800 ?auto_26801 ?auto_26798 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26818 - PERSON
      ?auto_26819 - PERSON
      ?auto_26820 - PERSON
      ?auto_26817 - CITY
    )
    :vars
    (
      ?auto_26824 - FLEVEL
      ?auto_26823 - FLEVEL
      ?auto_26822 - CITY
      ?auto_26821 - CITY
      ?auto_26825 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26824 ?auto_26823 ) ( not ( = ?auto_26817 ?auto_26822 ) ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( PERSON-AT ?auto_26820 ?auto_26817 ) ( not ( = ?auto_26820 ?auto_26819 ) ) ( PERSON-AT ?auto_26819 ?auto_26822 ) ( not ( = ?auto_26820 ?auto_26818 ) ) ( not ( = ?auto_26819 ?auto_26818 ) ) ( not ( = ?auto_26817 ?auto_26821 ) ) ( not ( = ?auto_26822 ?auto_26821 ) ) ( PERSON-AT ?auto_26818 ?auto_26821 ) ( AIRCRAFT-AT ?auto_26825 ?auto_26817 ) ( FUEL-LEVEL ?auto_26825 ?auto_26823 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26820 ?auto_26819 ?auto_26817 )
      ( FLY-3PPL-VERIFY ?auto_26818 ?auto_26819 ?auto_26820 ?auto_26817 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26847 - PERSON
      ?auto_26848 - PERSON
      ?auto_26849 - PERSON
      ?auto_26846 - CITY
    )
    :vars
    (
      ?auto_26853 - FLEVEL
      ?auto_26852 - FLEVEL
      ?auto_26851 - CITY
      ?auto_26854 - PERSON
      ?auto_26850 - CITY
      ?auto_26855 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26853 ?auto_26852 ) ( not ( = ?auto_26846 ?auto_26851 ) ) ( not ( = ?auto_26852 ?auto_26853 ) ) ( PERSON-AT ?auto_26849 ?auto_26846 ) ( not ( = ?auto_26849 ?auto_26847 ) ) ( PERSON-AT ?auto_26847 ?auto_26851 ) ( not ( = ?auto_26849 ?auto_26854 ) ) ( not ( = ?auto_26847 ?auto_26854 ) ) ( not ( = ?auto_26846 ?auto_26850 ) ) ( not ( = ?auto_26851 ?auto_26850 ) ) ( PERSON-AT ?auto_26854 ?auto_26850 ) ( AIRCRAFT-AT ?auto_26855 ?auto_26846 ) ( FUEL-LEVEL ?auto_26855 ?auto_26852 ) ( PERSON-AT ?auto_26848 ?auto_26846 ) ( not ( = ?auto_26847 ?auto_26848 ) ) ( not ( = ?auto_26848 ?auto_26849 ) ) ( not ( = ?auto_26848 ?auto_26854 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26849 ?auto_26847 ?auto_26846 )
      ( FLY-3PPL-VERIFY ?auto_26847 ?auto_26848 ?auto_26849 ?auto_26846 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26857 - PERSON
      ?auto_26858 - PERSON
      ?auto_26859 - PERSON
      ?auto_26856 - CITY
    )
    :vars
    (
      ?auto_26863 - FLEVEL
      ?auto_26862 - FLEVEL
      ?auto_26861 - CITY
      ?auto_26860 - CITY
      ?auto_26864 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26863 ?auto_26862 ) ( not ( = ?auto_26856 ?auto_26861 ) ) ( not ( = ?auto_26862 ?auto_26863 ) ) ( PERSON-AT ?auto_26858 ?auto_26856 ) ( not ( = ?auto_26858 ?auto_26857 ) ) ( PERSON-AT ?auto_26857 ?auto_26861 ) ( not ( = ?auto_26858 ?auto_26859 ) ) ( not ( = ?auto_26857 ?auto_26859 ) ) ( not ( = ?auto_26856 ?auto_26860 ) ) ( not ( = ?auto_26861 ?auto_26860 ) ) ( PERSON-AT ?auto_26859 ?auto_26860 ) ( AIRCRAFT-AT ?auto_26864 ?auto_26856 ) ( FUEL-LEVEL ?auto_26864 ?auto_26862 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26858 ?auto_26857 ?auto_26856 )
      ( FLY-3PPL-VERIFY ?auto_26857 ?auto_26858 ?auto_26859 ?auto_26856 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26876 - PERSON
      ?auto_26877 - PERSON
      ?auto_26878 - PERSON
      ?auto_26875 - CITY
    )
    :vars
    (
      ?auto_26882 - FLEVEL
      ?auto_26881 - FLEVEL
      ?auto_26880 - CITY
      ?auto_26879 - CITY
      ?auto_26883 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26882 ?auto_26881 ) ( not ( = ?auto_26875 ?auto_26880 ) ) ( not ( = ?auto_26881 ?auto_26882 ) ) ( PERSON-AT ?auto_26878 ?auto_26875 ) ( not ( = ?auto_26878 ?auto_26876 ) ) ( PERSON-AT ?auto_26876 ?auto_26880 ) ( not ( = ?auto_26878 ?auto_26877 ) ) ( not ( = ?auto_26876 ?auto_26877 ) ) ( not ( = ?auto_26875 ?auto_26879 ) ) ( not ( = ?auto_26880 ?auto_26879 ) ) ( PERSON-AT ?auto_26877 ?auto_26879 ) ( AIRCRAFT-AT ?auto_26883 ?auto_26875 ) ( FUEL-LEVEL ?auto_26883 ?auto_26881 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26878 ?auto_26876 ?auto_26875 )
      ( FLY-3PPL-VERIFY ?auto_26876 ?auto_26877 ?auto_26878 ?auto_26875 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_26936 - PERSON
      ?auto_26935 - CITY
    )
    :vars
    (
      ?auto_26940 - FLEVEL
      ?auto_26939 - FLEVEL
      ?auto_26938 - CITY
      ?auto_26943 - PERSON
      ?auto_26941 - PERSON
      ?auto_26937 - CITY
      ?auto_26942 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26940 ?auto_26939 ) ( not ( = ?auto_26935 ?auto_26938 ) ) ( not ( = ?auto_26939 ?auto_26940 ) ) ( PERSON-AT ?auto_26943 ?auto_26935 ) ( not ( = ?auto_26943 ?auto_26936 ) ) ( PERSON-AT ?auto_26936 ?auto_26938 ) ( not ( = ?auto_26943 ?auto_26941 ) ) ( not ( = ?auto_26936 ?auto_26941 ) ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26938 ?auto_26937 ) ) ( PERSON-AT ?auto_26941 ?auto_26937 ) ( AIRCRAFT-AT ?auto_26942 ?auto_26935 ) ( FUEL-LEVEL ?auto_26942 ?auto_26940 ) )
    :subtasks
    ( ( !REFUEL ?auto_26942 ?auto_26935 ?auto_26940 ?auto_26939 )
      ( FLY-2PPL ?auto_26943 ?auto_26936 ?auto_26935 )
      ( FLY-1PPL-VERIFY ?auto_26936 ?auto_26935 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26945 - PERSON
      ?auto_26946 - PERSON
      ?auto_26944 - CITY
    )
    :vars
    (
      ?auto_26950 - FLEVEL
      ?auto_26951 - FLEVEL
      ?auto_26949 - CITY
      ?auto_26948 - PERSON
      ?auto_26947 - CITY
      ?auto_26952 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26950 ?auto_26951 ) ( not ( = ?auto_26944 ?auto_26949 ) ) ( not ( = ?auto_26951 ?auto_26950 ) ) ( PERSON-AT ?auto_26945 ?auto_26944 ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( PERSON-AT ?auto_26946 ?auto_26949 ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26946 ?auto_26948 ) ) ( not ( = ?auto_26944 ?auto_26947 ) ) ( not ( = ?auto_26949 ?auto_26947 ) ) ( PERSON-AT ?auto_26948 ?auto_26947 ) ( AIRCRAFT-AT ?auto_26952 ?auto_26944 ) ( FUEL-LEVEL ?auto_26952 ?auto_26950 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_26946 ?auto_26944 )
      ( FLY-2PPL-VERIFY ?auto_26945 ?auto_26946 ?auto_26944 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26954 - PERSON
      ?auto_26955 - PERSON
      ?auto_26953 - CITY
    )
    :vars
    (
      ?auto_26957 - FLEVEL
      ?auto_26960 - FLEVEL
      ?auto_26958 - CITY
      ?auto_26961 - PERSON
      ?auto_26956 - CITY
      ?auto_26959 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26957 ?auto_26960 ) ( not ( = ?auto_26953 ?auto_26958 ) ) ( not ( = ?auto_26960 ?auto_26957 ) ) ( PERSON-AT ?auto_26961 ?auto_26953 ) ( not ( = ?auto_26961 ?auto_26955 ) ) ( PERSON-AT ?auto_26955 ?auto_26958 ) ( not ( = ?auto_26961 ?auto_26954 ) ) ( not ( = ?auto_26955 ?auto_26954 ) ) ( not ( = ?auto_26953 ?auto_26956 ) ) ( not ( = ?auto_26958 ?auto_26956 ) ) ( PERSON-AT ?auto_26954 ?auto_26956 ) ( AIRCRAFT-AT ?auto_26959 ?auto_26953 ) ( FUEL-LEVEL ?auto_26959 ?auto_26957 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26961 ?auto_26955 ?auto_26953 )
      ( FLY-2PPL-VERIFY ?auto_26954 ?auto_26955 ?auto_26953 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26963 - PERSON
      ?auto_26964 - PERSON
      ?auto_26962 - CITY
    )
    :vars
    (
      ?auto_26966 - FLEVEL
      ?auto_26970 - FLEVEL
      ?auto_26967 - CITY
      ?auto_26968 - PERSON
      ?auto_26965 - CITY
      ?auto_26969 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26966 ?auto_26970 ) ( not ( = ?auto_26962 ?auto_26967 ) ) ( not ( = ?auto_26970 ?auto_26966 ) ) ( PERSON-AT ?auto_26964 ?auto_26962 ) ( not ( = ?auto_26964 ?auto_26963 ) ) ( PERSON-AT ?auto_26963 ?auto_26967 ) ( not ( = ?auto_26964 ?auto_26968 ) ) ( not ( = ?auto_26963 ?auto_26968 ) ) ( not ( = ?auto_26962 ?auto_26965 ) ) ( not ( = ?auto_26967 ?auto_26965 ) ) ( PERSON-AT ?auto_26968 ?auto_26965 ) ( AIRCRAFT-AT ?auto_26969 ?auto_26962 ) ( FUEL-LEVEL ?auto_26969 ?auto_26966 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26964 ?auto_26963 ?auto_26962 )
      ( FLY-2PPL-VERIFY ?auto_26963 ?auto_26964 ?auto_26962 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26972 - PERSON
      ?auto_26973 - PERSON
      ?auto_26971 - CITY
    )
    :vars
    (
      ?auto_26975 - FLEVEL
      ?auto_26978 - FLEVEL
      ?auto_26976 - CITY
      ?auto_26979 - PERSON
      ?auto_26974 - CITY
      ?auto_26977 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26975 ?auto_26978 ) ( not ( = ?auto_26971 ?auto_26976 ) ) ( not ( = ?auto_26978 ?auto_26975 ) ) ( PERSON-AT ?auto_26979 ?auto_26971 ) ( not ( = ?auto_26979 ?auto_26972 ) ) ( PERSON-AT ?auto_26972 ?auto_26976 ) ( not ( = ?auto_26979 ?auto_26973 ) ) ( not ( = ?auto_26972 ?auto_26973 ) ) ( not ( = ?auto_26971 ?auto_26974 ) ) ( not ( = ?auto_26976 ?auto_26974 ) ) ( PERSON-AT ?auto_26973 ?auto_26974 ) ( AIRCRAFT-AT ?auto_26977 ?auto_26971 ) ( FUEL-LEVEL ?auto_26977 ?auto_26975 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26979 ?auto_26972 ?auto_26971 )
      ( FLY-2PPL-VERIFY ?auto_26972 ?auto_26973 ?auto_26971 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_26991 - PERSON
      ?auto_26992 - PERSON
      ?auto_26993 - PERSON
      ?auto_26990 - CITY
    )
    :vars
    (
      ?auto_26995 - FLEVEL
      ?auto_26999 - FLEVEL
      ?auto_26996 - CITY
      ?auto_26997 - PERSON
      ?auto_26994 - CITY
      ?auto_26998 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_26995 ?auto_26999 ) ( not ( = ?auto_26990 ?auto_26996 ) ) ( not ( = ?auto_26999 ?auto_26995 ) ) ( PERSON-AT ?auto_26992 ?auto_26990 ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( PERSON-AT ?auto_26993 ?auto_26996 ) ( not ( = ?auto_26992 ?auto_26997 ) ) ( not ( = ?auto_26993 ?auto_26997 ) ) ( not ( = ?auto_26990 ?auto_26994 ) ) ( not ( = ?auto_26996 ?auto_26994 ) ) ( PERSON-AT ?auto_26997 ?auto_26994 ) ( AIRCRAFT-AT ?auto_26998 ?auto_26990 ) ( FUEL-LEVEL ?auto_26998 ?auto_26995 ) ( PERSON-AT ?auto_26991 ?auto_26990 ) ( not ( = ?auto_26991 ?auto_26992 ) ) ( not ( = ?auto_26991 ?auto_26993 ) ) ( not ( = ?auto_26991 ?auto_26997 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_26992 ?auto_26993 ?auto_26990 )
      ( FLY-3PPL-VERIFY ?auto_26991 ?auto_26992 ?auto_26993 ?auto_26990 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27001 - PERSON
      ?auto_27002 - PERSON
      ?auto_27003 - PERSON
      ?auto_27000 - CITY
    )
    :vars
    (
      ?auto_27005 - FLEVEL
      ?auto_27008 - FLEVEL
      ?auto_27006 - CITY
      ?auto_27004 - CITY
      ?auto_27007 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27005 ?auto_27008 ) ( not ( = ?auto_27000 ?auto_27006 ) ) ( not ( = ?auto_27008 ?auto_27005 ) ) ( PERSON-AT ?auto_27001 ?auto_27000 ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( PERSON-AT ?auto_27003 ?auto_27006 ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( not ( = ?auto_27003 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27006 ?auto_27004 ) ) ( PERSON-AT ?auto_27002 ?auto_27004 ) ( AIRCRAFT-AT ?auto_27007 ?auto_27000 ) ( FUEL-LEVEL ?auto_27007 ?auto_27005 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27001 ?auto_27003 ?auto_27000 )
      ( FLY-3PPL-VERIFY ?auto_27001 ?auto_27002 ?auto_27003 ?auto_27000 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27010 - PERSON
      ?auto_27011 - PERSON
      ?auto_27012 - PERSON
      ?auto_27009 - CITY
    )
    :vars
    (
      ?auto_27014 - FLEVEL
      ?auto_27018 - FLEVEL
      ?auto_27015 - CITY
      ?auto_27016 - PERSON
      ?auto_27013 - CITY
      ?auto_27017 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27014 ?auto_27018 ) ( not ( = ?auto_27009 ?auto_27015 ) ) ( not ( = ?auto_27018 ?auto_27014 ) ) ( PERSON-AT ?auto_27012 ?auto_27009 ) ( not ( = ?auto_27012 ?auto_27011 ) ) ( PERSON-AT ?auto_27011 ?auto_27015 ) ( not ( = ?auto_27012 ?auto_27016 ) ) ( not ( = ?auto_27011 ?auto_27016 ) ) ( not ( = ?auto_27009 ?auto_27013 ) ) ( not ( = ?auto_27015 ?auto_27013 ) ) ( PERSON-AT ?auto_27016 ?auto_27013 ) ( AIRCRAFT-AT ?auto_27017 ?auto_27009 ) ( FUEL-LEVEL ?auto_27017 ?auto_27014 ) ( PERSON-AT ?auto_27010 ?auto_27009 ) ( not ( = ?auto_27010 ?auto_27011 ) ) ( not ( = ?auto_27010 ?auto_27012 ) ) ( not ( = ?auto_27010 ?auto_27016 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27012 ?auto_27011 ?auto_27009 )
      ( FLY-3PPL-VERIFY ?auto_27010 ?auto_27011 ?auto_27012 ?auto_27009 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27020 - PERSON
      ?auto_27021 - PERSON
      ?auto_27022 - PERSON
      ?auto_27019 - CITY
    )
    :vars
    (
      ?auto_27024 - FLEVEL
      ?auto_27027 - FLEVEL
      ?auto_27025 - CITY
      ?auto_27023 - CITY
      ?auto_27026 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27024 ?auto_27027 ) ( not ( = ?auto_27019 ?auto_27025 ) ) ( not ( = ?auto_27027 ?auto_27024 ) ) ( PERSON-AT ?auto_27020 ?auto_27019 ) ( not ( = ?auto_27020 ?auto_27021 ) ) ( PERSON-AT ?auto_27021 ?auto_27025 ) ( not ( = ?auto_27020 ?auto_27022 ) ) ( not ( = ?auto_27021 ?auto_27022 ) ) ( not ( = ?auto_27019 ?auto_27023 ) ) ( not ( = ?auto_27025 ?auto_27023 ) ) ( PERSON-AT ?auto_27022 ?auto_27023 ) ( AIRCRAFT-AT ?auto_27026 ?auto_27019 ) ( FUEL-LEVEL ?auto_27026 ?auto_27024 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27020 ?auto_27021 ?auto_27019 )
      ( FLY-3PPL-VERIFY ?auto_27020 ?auto_27021 ?auto_27022 ?auto_27019 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27039 - PERSON
      ?auto_27040 - PERSON
      ?auto_27041 - PERSON
      ?auto_27038 - CITY
    )
    :vars
    (
      ?auto_27043 - FLEVEL
      ?auto_27046 - FLEVEL
      ?auto_27044 - CITY
      ?auto_27042 - CITY
      ?auto_27045 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27043 ?auto_27046 ) ( not ( = ?auto_27038 ?auto_27044 ) ) ( not ( = ?auto_27046 ?auto_27043 ) ) ( PERSON-AT ?auto_27040 ?auto_27038 ) ( not ( = ?auto_27040 ?auto_27041 ) ) ( PERSON-AT ?auto_27041 ?auto_27044 ) ( not ( = ?auto_27040 ?auto_27039 ) ) ( not ( = ?auto_27041 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27042 ) ) ( not ( = ?auto_27044 ?auto_27042 ) ) ( PERSON-AT ?auto_27039 ?auto_27042 ) ( AIRCRAFT-AT ?auto_27045 ?auto_27038 ) ( FUEL-LEVEL ?auto_27045 ?auto_27043 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27040 ?auto_27041 ?auto_27038 )
      ( FLY-3PPL-VERIFY ?auto_27039 ?auto_27040 ?auto_27041 ?auto_27038 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27058 - PERSON
      ?auto_27059 - PERSON
      ?auto_27060 - PERSON
      ?auto_27057 - CITY
    )
    :vars
    (
      ?auto_27062 - FLEVEL
      ?auto_27065 - FLEVEL
      ?auto_27063 - CITY
      ?auto_27061 - CITY
      ?auto_27064 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27062 ?auto_27065 ) ( not ( = ?auto_27057 ?auto_27063 ) ) ( not ( = ?auto_27065 ?auto_27062 ) ) ( PERSON-AT ?auto_27060 ?auto_27057 ) ( not ( = ?auto_27060 ?auto_27059 ) ) ( PERSON-AT ?auto_27059 ?auto_27063 ) ( not ( = ?auto_27060 ?auto_27058 ) ) ( not ( = ?auto_27059 ?auto_27058 ) ) ( not ( = ?auto_27057 ?auto_27061 ) ) ( not ( = ?auto_27063 ?auto_27061 ) ) ( PERSON-AT ?auto_27058 ?auto_27061 ) ( AIRCRAFT-AT ?auto_27064 ?auto_27057 ) ( FUEL-LEVEL ?auto_27064 ?auto_27062 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27060 ?auto_27059 ?auto_27057 )
      ( FLY-3PPL-VERIFY ?auto_27058 ?auto_27059 ?auto_27060 ?auto_27057 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27087 - PERSON
      ?auto_27088 - PERSON
      ?auto_27089 - PERSON
      ?auto_27086 - CITY
    )
    :vars
    (
      ?auto_27091 - FLEVEL
      ?auto_27095 - FLEVEL
      ?auto_27092 - CITY
      ?auto_27093 - PERSON
      ?auto_27090 - CITY
      ?auto_27094 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27091 ?auto_27095 ) ( not ( = ?auto_27086 ?auto_27092 ) ) ( not ( = ?auto_27095 ?auto_27091 ) ) ( PERSON-AT ?auto_27089 ?auto_27086 ) ( not ( = ?auto_27089 ?auto_27087 ) ) ( PERSON-AT ?auto_27087 ?auto_27092 ) ( not ( = ?auto_27089 ?auto_27093 ) ) ( not ( = ?auto_27087 ?auto_27093 ) ) ( not ( = ?auto_27086 ?auto_27090 ) ) ( not ( = ?auto_27092 ?auto_27090 ) ) ( PERSON-AT ?auto_27093 ?auto_27090 ) ( AIRCRAFT-AT ?auto_27094 ?auto_27086 ) ( FUEL-LEVEL ?auto_27094 ?auto_27091 ) ( PERSON-AT ?auto_27088 ?auto_27086 ) ( not ( = ?auto_27087 ?auto_27088 ) ) ( not ( = ?auto_27088 ?auto_27089 ) ) ( not ( = ?auto_27088 ?auto_27093 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27089 ?auto_27087 ?auto_27086 )
      ( FLY-3PPL-VERIFY ?auto_27087 ?auto_27088 ?auto_27089 ?auto_27086 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27097 - PERSON
      ?auto_27098 - PERSON
      ?auto_27099 - PERSON
      ?auto_27096 - CITY
    )
    :vars
    (
      ?auto_27101 - FLEVEL
      ?auto_27104 - FLEVEL
      ?auto_27102 - CITY
      ?auto_27100 - CITY
      ?auto_27103 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27101 ?auto_27104 ) ( not ( = ?auto_27096 ?auto_27102 ) ) ( not ( = ?auto_27104 ?auto_27101 ) ) ( PERSON-AT ?auto_27098 ?auto_27096 ) ( not ( = ?auto_27098 ?auto_27097 ) ) ( PERSON-AT ?auto_27097 ?auto_27102 ) ( not ( = ?auto_27098 ?auto_27099 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27096 ?auto_27100 ) ) ( not ( = ?auto_27102 ?auto_27100 ) ) ( PERSON-AT ?auto_27099 ?auto_27100 ) ( AIRCRAFT-AT ?auto_27103 ?auto_27096 ) ( FUEL-LEVEL ?auto_27103 ?auto_27101 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27098 ?auto_27097 ?auto_27096 )
      ( FLY-3PPL-VERIFY ?auto_27097 ?auto_27098 ?auto_27099 ?auto_27096 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27116 - PERSON
      ?auto_27117 - PERSON
      ?auto_27118 - PERSON
      ?auto_27115 - CITY
    )
    :vars
    (
      ?auto_27120 - FLEVEL
      ?auto_27123 - FLEVEL
      ?auto_27121 - CITY
      ?auto_27119 - CITY
      ?auto_27122 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27120 ?auto_27123 ) ( not ( = ?auto_27115 ?auto_27121 ) ) ( not ( = ?auto_27123 ?auto_27120 ) ) ( PERSON-AT ?auto_27118 ?auto_27115 ) ( not ( = ?auto_27118 ?auto_27116 ) ) ( PERSON-AT ?auto_27116 ?auto_27121 ) ( not ( = ?auto_27118 ?auto_27117 ) ) ( not ( = ?auto_27116 ?auto_27117 ) ) ( not ( = ?auto_27115 ?auto_27119 ) ) ( not ( = ?auto_27121 ?auto_27119 ) ) ( PERSON-AT ?auto_27117 ?auto_27119 ) ( AIRCRAFT-AT ?auto_27122 ?auto_27115 ) ( FUEL-LEVEL ?auto_27122 ?auto_27120 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27118 ?auto_27116 ?auto_27115 )
      ( FLY-3PPL-VERIFY ?auto_27116 ?auto_27117 ?auto_27118 ?auto_27115 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_27176 - PERSON
      ?auto_27175 - CITY
    )
    :vars
    (
      ?auto_27178 - FLEVEL
      ?auto_27182 - FLEVEL
      ?auto_27179 - CITY
      ?auto_27183 - PERSON
      ?auto_27180 - PERSON
      ?auto_27177 - CITY
      ?auto_27181 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27178 ?auto_27182 ) ( not ( = ?auto_27175 ?auto_27179 ) ) ( not ( = ?auto_27182 ?auto_27178 ) ) ( not ( = ?auto_27183 ?auto_27176 ) ) ( PERSON-AT ?auto_27176 ?auto_27179 ) ( not ( = ?auto_27183 ?auto_27180 ) ) ( not ( = ?auto_27176 ?auto_27180 ) ) ( not ( = ?auto_27175 ?auto_27177 ) ) ( not ( = ?auto_27179 ?auto_27177 ) ) ( PERSON-AT ?auto_27180 ?auto_27177 ) ( AIRCRAFT-AT ?auto_27181 ?auto_27175 ) ( FUEL-LEVEL ?auto_27181 ?auto_27178 ) ( IN ?auto_27183 ?auto_27181 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_27183 ?auto_27175 )
      ( FLY-2PPL ?auto_27183 ?auto_27176 ?auto_27175 )
      ( FLY-1PPL-VERIFY ?auto_27176 ?auto_27175 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27185 - PERSON
      ?auto_27186 - PERSON
      ?auto_27184 - CITY
    )
    :vars
    (
      ?auto_27192 - FLEVEL
      ?auto_27187 - FLEVEL
      ?auto_27188 - CITY
      ?auto_27189 - PERSON
      ?auto_27191 - CITY
      ?auto_27190 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27192 ?auto_27187 ) ( not ( = ?auto_27184 ?auto_27188 ) ) ( not ( = ?auto_27187 ?auto_27192 ) ) ( not ( = ?auto_27185 ?auto_27186 ) ) ( PERSON-AT ?auto_27186 ?auto_27188 ) ( not ( = ?auto_27185 ?auto_27189 ) ) ( not ( = ?auto_27186 ?auto_27189 ) ) ( not ( = ?auto_27184 ?auto_27191 ) ) ( not ( = ?auto_27188 ?auto_27191 ) ) ( PERSON-AT ?auto_27189 ?auto_27191 ) ( AIRCRAFT-AT ?auto_27190 ?auto_27184 ) ( FUEL-LEVEL ?auto_27190 ?auto_27192 ) ( IN ?auto_27185 ?auto_27190 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_27186 ?auto_27184 )
      ( FLY-2PPL-VERIFY ?auto_27185 ?auto_27186 ?auto_27184 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27194 - PERSON
      ?auto_27195 - PERSON
      ?auto_27193 - CITY
    )
    :vars
    (
      ?auto_27198 - FLEVEL
      ?auto_27196 - FLEVEL
      ?auto_27200 - CITY
      ?auto_27201 - PERSON
      ?auto_27199 - CITY
      ?auto_27197 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27198 ?auto_27196 ) ( not ( = ?auto_27193 ?auto_27200 ) ) ( not ( = ?auto_27196 ?auto_27198 ) ) ( not ( = ?auto_27201 ?auto_27195 ) ) ( PERSON-AT ?auto_27195 ?auto_27200 ) ( not ( = ?auto_27201 ?auto_27194 ) ) ( not ( = ?auto_27195 ?auto_27194 ) ) ( not ( = ?auto_27193 ?auto_27199 ) ) ( not ( = ?auto_27200 ?auto_27199 ) ) ( PERSON-AT ?auto_27194 ?auto_27199 ) ( AIRCRAFT-AT ?auto_27197 ?auto_27193 ) ( FUEL-LEVEL ?auto_27197 ?auto_27198 ) ( IN ?auto_27201 ?auto_27197 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27201 ?auto_27195 ?auto_27193 )
      ( FLY-2PPL-VERIFY ?auto_27194 ?auto_27195 ?auto_27193 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27203 - PERSON
      ?auto_27204 - PERSON
      ?auto_27202 - CITY
    )
    :vars
    (
      ?auto_27208 - FLEVEL
      ?auto_27206 - FLEVEL
      ?auto_27210 - CITY
      ?auto_27205 - PERSON
      ?auto_27209 - CITY
      ?auto_27207 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27208 ?auto_27206 ) ( not ( = ?auto_27202 ?auto_27210 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27204 ?auto_27203 ) ) ( PERSON-AT ?auto_27203 ?auto_27210 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( not ( = ?auto_27202 ?auto_27209 ) ) ( not ( = ?auto_27210 ?auto_27209 ) ) ( PERSON-AT ?auto_27205 ?auto_27209 ) ( AIRCRAFT-AT ?auto_27207 ?auto_27202 ) ( FUEL-LEVEL ?auto_27207 ?auto_27208 ) ( IN ?auto_27204 ?auto_27207 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27204 ?auto_27203 ?auto_27202 )
      ( FLY-2PPL-VERIFY ?auto_27203 ?auto_27204 ?auto_27202 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27212 - PERSON
      ?auto_27213 - PERSON
      ?auto_27211 - CITY
    )
    :vars
    (
      ?auto_27216 - FLEVEL
      ?auto_27214 - FLEVEL
      ?auto_27218 - CITY
      ?auto_27219 - PERSON
      ?auto_27217 - CITY
      ?auto_27215 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27216 ?auto_27214 ) ( not ( = ?auto_27211 ?auto_27218 ) ) ( not ( = ?auto_27214 ?auto_27216 ) ) ( not ( = ?auto_27219 ?auto_27212 ) ) ( PERSON-AT ?auto_27212 ?auto_27218 ) ( not ( = ?auto_27219 ?auto_27213 ) ) ( not ( = ?auto_27212 ?auto_27213 ) ) ( not ( = ?auto_27211 ?auto_27217 ) ) ( not ( = ?auto_27218 ?auto_27217 ) ) ( PERSON-AT ?auto_27213 ?auto_27217 ) ( AIRCRAFT-AT ?auto_27215 ?auto_27211 ) ( FUEL-LEVEL ?auto_27215 ?auto_27216 ) ( IN ?auto_27219 ?auto_27215 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27219 ?auto_27212 ?auto_27211 )
      ( FLY-2PPL-VERIFY ?auto_27212 ?auto_27213 ?auto_27211 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27241 - PERSON
      ?auto_27242 - PERSON
      ?auto_27243 - PERSON
      ?auto_27240 - CITY
    )
    :vars
    (
      ?auto_27246 - FLEVEL
      ?auto_27244 - FLEVEL
      ?auto_27248 - CITY
      ?auto_27247 - CITY
      ?auto_27245 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27246 ?auto_27244 ) ( not ( = ?auto_27240 ?auto_27248 ) ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27241 ?auto_27243 ) ) ( PERSON-AT ?auto_27243 ?auto_27248 ) ( not ( = ?auto_27241 ?auto_27242 ) ) ( not ( = ?auto_27243 ?auto_27242 ) ) ( not ( = ?auto_27240 ?auto_27247 ) ) ( not ( = ?auto_27248 ?auto_27247 ) ) ( PERSON-AT ?auto_27242 ?auto_27247 ) ( AIRCRAFT-AT ?auto_27245 ?auto_27240 ) ( FUEL-LEVEL ?auto_27245 ?auto_27246 ) ( IN ?auto_27241 ?auto_27245 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27241 ?auto_27243 ?auto_27240 )
      ( FLY-3PPL-VERIFY ?auto_27241 ?auto_27242 ?auto_27243 ?auto_27240 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27260 - PERSON
      ?auto_27261 - PERSON
      ?auto_27262 - PERSON
      ?auto_27259 - CITY
    )
    :vars
    (
      ?auto_27265 - FLEVEL
      ?auto_27263 - FLEVEL
      ?auto_27267 - CITY
      ?auto_27266 - CITY
      ?auto_27264 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27265 ?auto_27263 ) ( not ( = ?auto_27259 ?auto_27267 ) ) ( not ( = ?auto_27263 ?auto_27265 ) ) ( not ( = ?auto_27260 ?auto_27261 ) ) ( PERSON-AT ?auto_27261 ?auto_27267 ) ( not ( = ?auto_27260 ?auto_27262 ) ) ( not ( = ?auto_27261 ?auto_27262 ) ) ( not ( = ?auto_27259 ?auto_27266 ) ) ( not ( = ?auto_27267 ?auto_27266 ) ) ( PERSON-AT ?auto_27262 ?auto_27266 ) ( AIRCRAFT-AT ?auto_27264 ?auto_27259 ) ( FUEL-LEVEL ?auto_27264 ?auto_27265 ) ( IN ?auto_27260 ?auto_27264 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27260 ?auto_27261 ?auto_27259 )
      ( FLY-3PPL-VERIFY ?auto_27260 ?auto_27261 ?auto_27262 ?auto_27259 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27279 - PERSON
      ?auto_27280 - PERSON
      ?auto_27281 - PERSON
      ?auto_27278 - CITY
    )
    :vars
    (
      ?auto_27284 - FLEVEL
      ?auto_27282 - FLEVEL
      ?auto_27286 - CITY
      ?auto_27285 - CITY
      ?auto_27283 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27284 ?auto_27282 ) ( not ( = ?auto_27278 ?auto_27286 ) ) ( not ( = ?auto_27282 ?auto_27284 ) ) ( not ( = ?auto_27280 ?auto_27281 ) ) ( PERSON-AT ?auto_27281 ?auto_27286 ) ( not ( = ?auto_27280 ?auto_27279 ) ) ( not ( = ?auto_27281 ?auto_27279 ) ) ( not ( = ?auto_27278 ?auto_27285 ) ) ( not ( = ?auto_27286 ?auto_27285 ) ) ( PERSON-AT ?auto_27279 ?auto_27285 ) ( AIRCRAFT-AT ?auto_27283 ?auto_27278 ) ( FUEL-LEVEL ?auto_27283 ?auto_27284 ) ( IN ?auto_27280 ?auto_27283 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27280 ?auto_27281 ?auto_27278 )
      ( FLY-3PPL-VERIFY ?auto_27279 ?auto_27280 ?auto_27281 ?auto_27278 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27298 - PERSON
      ?auto_27299 - PERSON
      ?auto_27300 - PERSON
      ?auto_27297 - CITY
    )
    :vars
    (
      ?auto_27303 - FLEVEL
      ?auto_27301 - FLEVEL
      ?auto_27305 - CITY
      ?auto_27304 - CITY
      ?auto_27302 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27303 ?auto_27301 ) ( not ( = ?auto_27297 ?auto_27305 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27299 ) ) ( PERSON-AT ?auto_27299 ?auto_27305 ) ( not ( = ?auto_27300 ?auto_27298 ) ) ( not ( = ?auto_27299 ?auto_27298 ) ) ( not ( = ?auto_27297 ?auto_27304 ) ) ( not ( = ?auto_27305 ?auto_27304 ) ) ( PERSON-AT ?auto_27298 ?auto_27304 ) ( AIRCRAFT-AT ?auto_27302 ?auto_27297 ) ( FUEL-LEVEL ?auto_27302 ?auto_27303 ) ( IN ?auto_27300 ?auto_27302 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27300 ?auto_27299 ?auto_27297 )
      ( FLY-3PPL-VERIFY ?auto_27298 ?auto_27299 ?auto_27300 ?auto_27297 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27337 - PERSON
      ?auto_27338 - PERSON
      ?auto_27339 - PERSON
      ?auto_27336 - CITY
    )
    :vars
    (
      ?auto_27342 - FLEVEL
      ?auto_27340 - FLEVEL
      ?auto_27344 - CITY
      ?auto_27343 - CITY
      ?auto_27341 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27342 ?auto_27340 ) ( not ( = ?auto_27336 ?auto_27344 ) ) ( not ( = ?auto_27340 ?auto_27342 ) ) ( not ( = ?auto_27338 ?auto_27337 ) ) ( PERSON-AT ?auto_27337 ?auto_27344 ) ( not ( = ?auto_27338 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27339 ) ) ( not ( = ?auto_27336 ?auto_27343 ) ) ( not ( = ?auto_27344 ?auto_27343 ) ) ( PERSON-AT ?auto_27339 ?auto_27343 ) ( AIRCRAFT-AT ?auto_27341 ?auto_27336 ) ( FUEL-LEVEL ?auto_27341 ?auto_27342 ) ( IN ?auto_27338 ?auto_27341 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27338 ?auto_27337 ?auto_27336 )
      ( FLY-3PPL-VERIFY ?auto_27337 ?auto_27338 ?auto_27339 ?auto_27336 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27356 - PERSON
      ?auto_27357 - PERSON
      ?auto_27358 - PERSON
      ?auto_27355 - CITY
    )
    :vars
    (
      ?auto_27361 - FLEVEL
      ?auto_27359 - FLEVEL
      ?auto_27363 - CITY
      ?auto_27362 - CITY
      ?auto_27360 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_27361 ?auto_27359 ) ( not ( = ?auto_27355 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27361 ) ) ( not ( = ?auto_27358 ?auto_27356 ) ) ( PERSON-AT ?auto_27356 ?auto_27363 ) ( not ( = ?auto_27358 ?auto_27357 ) ) ( not ( = ?auto_27356 ?auto_27357 ) ) ( not ( = ?auto_27355 ?auto_27362 ) ) ( not ( = ?auto_27363 ?auto_27362 ) ) ( PERSON-AT ?auto_27357 ?auto_27362 ) ( AIRCRAFT-AT ?auto_27360 ?auto_27355 ) ( FUEL-LEVEL ?auto_27360 ?auto_27361 ) ( IN ?auto_27358 ?auto_27360 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27358 ?auto_27356 ?auto_27355 )
      ( FLY-3PPL-VERIFY ?auto_27356 ?auto_27357 ?auto_27358 ?auto_27355 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_27416 - PERSON
      ?auto_27415 - CITY
    )
    :vars
    (
      ?auto_27420 - FLEVEL
      ?auto_27418 - FLEVEL
      ?auto_27422 - CITY
      ?auto_27423 - PERSON
      ?auto_27417 - PERSON
      ?auto_27421 - CITY
      ?auto_27419 - AIRCRAFT
      ?auto_27424 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27420 ?auto_27418 ) ( not ( = ?auto_27415 ?auto_27422 ) ) ( not ( = ?auto_27418 ?auto_27420 ) ) ( not ( = ?auto_27423 ?auto_27416 ) ) ( PERSON-AT ?auto_27416 ?auto_27422 ) ( not ( = ?auto_27423 ?auto_27417 ) ) ( not ( = ?auto_27416 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27421 ) ) ( not ( = ?auto_27422 ?auto_27421 ) ) ( PERSON-AT ?auto_27417 ?auto_27421 ) ( IN ?auto_27423 ?auto_27419 ) ( AIRCRAFT-AT ?auto_27419 ?auto_27424 ) ( FUEL-LEVEL ?auto_27419 ?auto_27418 ) ( not ( = ?auto_27415 ?auto_27424 ) ) ( not ( = ?auto_27422 ?auto_27424 ) ) ( not ( = ?auto_27421 ?auto_27424 ) ) )
    :subtasks
    ( ( !FLY ?auto_27419 ?auto_27424 ?auto_27415 ?auto_27418 ?auto_27420 )
      ( FLY-2PPL ?auto_27423 ?auto_27416 ?auto_27415 )
      ( FLY-1PPL-VERIFY ?auto_27416 ?auto_27415 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27426 - PERSON
      ?auto_27427 - PERSON
      ?auto_27425 - CITY
    )
    :vars
    (
      ?auto_27432 - FLEVEL
      ?auto_27434 - FLEVEL
      ?auto_27433 - CITY
      ?auto_27430 - PERSON
      ?auto_27429 - CITY
      ?auto_27431 - AIRCRAFT
      ?auto_27428 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27432 ?auto_27434 ) ( not ( = ?auto_27425 ?auto_27433 ) ) ( not ( = ?auto_27434 ?auto_27432 ) ) ( not ( = ?auto_27426 ?auto_27427 ) ) ( PERSON-AT ?auto_27427 ?auto_27433 ) ( not ( = ?auto_27426 ?auto_27430 ) ) ( not ( = ?auto_27427 ?auto_27430 ) ) ( not ( = ?auto_27425 ?auto_27429 ) ) ( not ( = ?auto_27433 ?auto_27429 ) ) ( PERSON-AT ?auto_27430 ?auto_27429 ) ( IN ?auto_27426 ?auto_27431 ) ( AIRCRAFT-AT ?auto_27431 ?auto_27428 ) ( FUEL-LEVEL ?auto_27431 ?auto_27434 ) ( not ( = ?auto_27425 ?auto_27428 ) ) ( not ( = ?auto_27433 ?auto_27428 ) ) ( not ( = ?auto_27429 ?auto_27428 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_27427 ?auto_27425 )
      ( FLY-2PPL-VERIFY ?auto_27426 ?auto_27427 ?auto_27425 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27436 - PERSON
      ?auto_27437 - PERSON
      ?auto_27435 - CITY
    )
    :vars
    (
      ?auto_27443 - FLEVEL
      ?auto_27439 - FLEVEL
      ?auto_27440 - CITY
      ?auto_27444 - PERSON
      ?auto_27442 - CITY
      ?auto_27441 - AIRCRAFT
      ?auto_27438 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27443 ?auto_27439 ) ( not ( = ?auto_27435 ?auto_27440 ) ) ( not ( = ?auto_27439 ?auto_27443 ) ) ( not ( = ?auto_27444 ?auto_27437 ) ) ( PERSON-AT ?auto_27437 ?auto_27440 ) ( not ( = ?auto_27444 ?auto_27436 ) ) ( not ( = ?auto_27437 ?auto_27436 ) ) ( not ( = ?auto_27435 ?auto_27442 ) ) ( not ( = ?auto_27440 ?auto_27442 ) ) ( PERSON-AT ?auto_27436 ?auto_27442 ) ( IN ?auto_27444 ?auto_27441 ) ( AIRCRAFT-AT ?auto_27441 ?auto_27438 ) ( FUEL-LEVEL ?auto_27441 ?auto_27439 ) ( not ( = ?auto_27435 ?auto_27438 ) ) ( not ( = ?auto_27440 ?auto_27438 ) ) ( not ( = ?auto_27442 ?auto_27438 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27444 ?auto_27437 ?auto_27435 )
      ( FLY-2PPL-VERIFY ?auto_27436 ?auto_27437 ?auto_27435 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27446 - PERSON
      ?auto_27447 - PERSON
      ?auto_27445 - CITY
    )
    :vars
    (
      ?auto_27454 - FLEVEL
      ?auto_27450 - FLEVEL
      ?auto_27451 - CITY
      ?auto_27448 - PERSON
      ?auto_27453 - CITY
      ?auto_27452 - AIRCRAFT
      ?auto_27449 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27454 ?auto_27450 ) ( not ( = ?auto_27445 ?auto_27451 ) ) ( not ( = ?auto_27450 ?auto_27454 ) ) ( not ( = ?auto_27447 ?auto_27446 ) ) ( PERSON-AT ?auto_27446 ?auto_27451 ) ( not ( = ?auto_27447 ?auto_27448 ) ) ( not ( = ?auto_27446 ?auto_27448 ) ) ( not ( = ?auto_27445 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( PERSON-AT ?auto_27448 ?auto_27453 ) ( IN ?auto_27447 ?auto_27452 ) ( AIRCRAFT-AT ?auto_27452 ?auto_27449 ) ( FUEL-LEVEL ?auto_27452 ?auto_27450 ) ( not ( = ?auto_27445 ?auto_27449 ) ) ( not ( = ?auto_27451 ?auto_27449 ) ) ( not ( = ?auto_27453 ?auto_27449 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27447 ?auto_27446 ?auto_27445 )
      ( FLY-2PPL-VERIFY ?auto_27446 ?auto_27447 ?auto_27445 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27456 - PERSON
      ?auto_27457 - PERSON
      ?auto_27455 - CITY
    )
    :vars
    (
      ?auto_27463 - FLEVEL
      ?auto_27459 - FLEVEL
      ?auto_27460 - CITY
      ?auto_27464 - PERSON
      ?auto_27462 - CITY
      ?auto_27461 - AIRCRAFT
      ?auto_27458 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27463 ?auto_27459 ) ( not ( = ?auto_27455 ?auto_27460 ) ) ( not ( = ?auto_27459 ?auto_27463 ) ) ( not ( = ?auto_27464 ?auto_27456 ) ) ( PERSON-AT ?auto_27456 ?auto_27460 ) ( not ( = ?auto_27464 ?auto_27457 ) ) ( not ( = ?auto_27456 ?auto_27457 ) ) ( not ( = ?auto_27455 ?auto_27462 ) ) ( not ( = ?auto_27460 ?auto_27462 ) ) ( PERSON-AT ?auto_27457 ?auto_27462 ) ( IN ?auto_27464 ?auto_27461 ) ( AIRCRAFT-AT ?auto_27461 ?auto_27458 ) ( FUEL-LEVEL ?auto_27461 ?auto_27459 ) ( not ( = ?auto_27455 ?auto_27458 ) ) ( not ( = ?auto_27460 ?auto_27458 ) ) ( not ( = ?auto_27462 ?auto_27458 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27464 ?auto_27456 ?auto_27455 )
      ( FLY-2PPL-VERIFY ?auto_27456 ?auto_27457 ?auto_27455 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27488 - PERSON
      ?auto_27489 - PERSON
      ?auto_27490 - PERSON
      ?auto_27487 - CITY
    )
    :vars
    (
      ?auto_27496 - FLEVEL
      ?auto_27492 - FLEVEL
      ?auto_27493 - CITY
      ?auto_27495 - CITY
      ?auto_27494 - AIRCRAFT
      ?auto_27491 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27496 ?auto_27492 ) ( not ( = ?auto_27487 ?auto_27493 ) ) ( not ( = ?auto_27492 ?auto_27496 ) ) ( not ( = ?auto_27488 ?auto_27490 ) ) ( PERSON-AT ?auto_27490 ?auto_27493 ) ( not ( = ?auto_27488 ?auto_27489 ) ) ( not ( = ?auto_27490 ?auto_27489 ) ) ( not ( = ?auto_27487 ?auto_27495 ) ) ( not ( = ?auto_27493 ?auto_27495 ) ) ( PERSON-AT ?auto_27489 ?auto_27495 ) ( IN ?auto_27488 ?auto_27494 ) ( AIRCRAFT-AT ?auto_27494 ?auto_27491 ) ( FUEL-LEVEL ?auto_27494 ?auto_27492 ) ( not ( = ?auto_27487 ?auto_27491 ) ) ( not ( = ?auto_27493 ?auto_27491 ) ) ( not ( = ?auto_27495 ?auto_27491 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27488 ?auto_27490 ?auto_27487 )
      ( FLY-3PPL-VERIFY ?auto_27488 ?auto_27489 ?auto_27490 ?auto_27487 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27509 - PERSON
      ?auto_27510 - PERSON
      ?auto_27511 - PERSON
      ?auto_27508 - CITY
    )
    :vars
    (
      ?auto_27517 - FLEVEL
      ?auto_27513 - FLEVEL
      ?auto_27514 - CITY
      ?auto_27516 - CITY
      ?auto_27515 - AIRCRAFT
      ?auto_27512 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27517 ?auto_27513 ) ( not ( = ?auto_27508 ?auto_27514 ) ) ( not ( = ?auto_27513 ?auto_27517 ) ) ( not ( = ?auto_27509 ?auto_27510 ) ) ( PERSON-AT ?auto_27510 ?auto_27514 ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27508 ?auto_27516 ) ) ( not ( = ?auto_27514 ?auto_27516 ) ) ( PERSON-AT ?auto_27511 ?auto_27516 ) ( IN ?auto_27509 ?auto_27515 ) ( AIRCRAFT-AT ?auto_27515 ?auto_27512 ) ( FUEL-LEVEL ?auto_27515 ?auto_27513 ) ( not ( = ?auto_27508 ?auto_27512 ) ) ( not ( = ?auto_27514 ?auto_27512 ) ) ( not ( = ?auto_27516 ?auto_27512 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27509 ?auto_27510 ?auto_27508 )
      ( FLY-3PPL-VERIFY ?auto_27509 ?auto_27510 ?auto_27511 ?auto_27508 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27530 - PERSON
      ?auto_27531 - PERSON
      ?auto_27532 - PERSON
      ?auto_27529 - CITY
    )
    :vars
    (
      ?auto_27538 - FLEVEL
      ?auto_27534 - FLEVEL
      ?auto_27535 - CITY
      ?auto_27537 - CITY
      ?auto_27536 - AIRCRAFT
      ?auto_27533 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27538 ?auto_27534 ) ( not ( = ?auto_27529 ?auto_27535 ) ) ( not ( = ?auto_27534 ?auto_27538 ) ) ( not ( = ?auto_27531 ?auto_27532 ) ) ( PERSON-AT ?auto_27532 ?auto_27535 ) ( not ( = ?auto_27531 ?auto_27530 ) ) ( not ( = ?auto_27532 ?auto_27530 ) ) ( not ( = ?auto_27529 ?auto_27537 ) ) ( not ( = ?auto_27535 ?auto_27537 ) ) ( PERSON-AT ?auto_27530 ?auto_27537 ) ( IN ?auto_27531 ?auto_27536 ) ( AIRCRAFT-AT ?auto_27536 ?auto_27533 ) ( FUEL-LEVEL ?auto_27536 ?auto_27534 ) ( not ( = ?auto_27529 ?auto_27533 ) ) ( not ( = ?auto_27535 ?auto_27533 ) ) ( not ( = ?auto_27537 ?auto_27533 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27531 ?auto_27532 ?auto_27529 )
      ( FLY-3PPL-VERIFY ?auto_27530 ?auto_27531 ?auto_27532 ?auto_27529 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27551 - PERSON
      ?auto_27552 - PERSON
      ?auto_27553 - PERSON
      ?auto_27550 - CITY
    )
    :vars
    (
      ?auto_27559 - FLEVEL
      ?auto_27555 - FLEVEL
      ?auto_27556 - CITY
      ?auto_27558 - CITY
      ?auto_27557 - AIRCRAFT
      ?auto_27554 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27559 ?auto_27555 ) ( not ( = ?auto_27550 ?auto_27556 ) ) ( not ( = ?auto_27555 ?auto_27559 ) ) ( not ( = ?auto_27553 ?auto_27552 ) ) ( PERSON-AT ?auto_27552 ?auto_27556 ) ( not ( = ?auto_27553 ?auto_27551 ) ) ( not ( = ?auto_27552 ?auto_27551 ) ) ( not ( = ?auto_27550 ?auto_27558 ) ) ( not ( = ?auto_27556 ?auto_27558 ) ) ( PERSON-AT ?auto_27551 ?auto_27558 ) ( IN ?auto_27553 ?auto_27557 ) ( AIRCRAFT-AT ?auto_27557 ?auto_27554 ) ( FUEL-LEVEL ?auto_27557 ?auto_27555 ) ( not ( = ?auto_27550 ?auto_27554 ) ) ( not ( = ?auto_27556 ?auto_27554 ) ) ( not ( = ?auto_27558 ?auto_27554 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27553 ?auto_27552 ?auto_27550 )
      ( FLY-3PPL-VERIFY ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27550 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27594 - PERSON
      ?auto_27595 - PERSON
      ?auto_27596 - PERSON
      ?auto_27593 - CITY
    )
    :vars
    (
      ?auto_27602 - FLEVEL
      ?auto_27598 - FLEVEL
      ?auto_27599 - CITY
      ?auto_27601 - CITY
      ?auto_27600 - AIRCRAFT
      ?auto_27597 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27602 ?auto_27598 ) ( not ( = ?auto_27593 ?auto_27599 ) ) ( not ( = ?auto_27598 ?auto_27602 ) ) ( not ( = ?auto_27595 ?auto_27594 ) ) ( PERSON-AT ?auto_27594 ?auto_27599 ) ( not ( = ?auto_27595 ?auto_27596 ) ) ( not ( = ?auto_27594 ?auto_27596 ) ) ( not ( = ?auto_27593 ?auto_27601 ) ) ( not ( = ?auto_27599 ?auto_27601 ) ) ( PERSON-AT ?auto_27596 ?auto_27601 ) ( IN ?auto_27595 ?auto_27600 ) ( AIRCRAFT-AT ?auto_27600 ?auto_27597 ) ( FUEL-LEVEL ?auto_27600 ?auto_27598 ) ( not ( = ?auto_27593 ?auto_27597 ) ) ( not ( = ?auto_27599 ?auto_27597 ) ) ( not ( = ?auto_27601 ?auto_27597 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27595 ?auto_27594 ?auto_27593 )
      ( FLY-3PPL-VERIFY ?auto_27594 ?auto_27595 ?auto_27596 ?auto_27593 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27615 - PERSON
      ?auto_27616 - PERSON
      ?auto_27617 - PERSON
      ?auto_27614 - CITY
    )
    :vars
    (
      ?auto_27623 - FLEVEL
      ?auto_27619 - FLEVEL
      ?auto_27620 - CITY
      ?auto_27622 - CITY
      ?auto_27621 - AIRCRAFT
      ?auto_27618 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27623 ?auto_27619 ) ( not ( = ?auto_27614 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( not ( = ?auto_27617 ?auto_27615 ) ) ( PERSON-AT ?auto_27615 ?auto_27620 ) ( not ( = ?auto_27617 ?auto_27616 ) ) ( not ( = ?auto_27615 ?auto_27616 ) ) ( not ( = ?auto_27614 ?auto_27622 ) ) ( not ( = ?auto_27620 ?auto_27622 ) ) ( PERSON-AT ?auto_27616 ?auto_27622 ) ( IN ?auto_27617 ?auto_27621 ) ( AIRCRAFT-AT ?auto_27621 ?auto_27618 ) ( FUEL-LEVEL ?auto_27621 ?auto_27619 ) ( not ( = ?auto_27614 ?auto_27618 ) ) ( not ( = ?auto_27620 ?auto_27618 ) ) ( not ( = ?auto_27622 ?auto_27618 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27617 ?auto_27615 ?auto_27614 )
      ( FLY-3PPL-VERIFY ?auto_27615 ?auto_27616 ?auto_27617 ?auto_27614 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_27681 - PERSON
      ?auto_27680 - CITY
    )
    :vars
    (
      ?auto_27688 - FLEVEL
      ?auto_27684 - FLEVEL
      ?auto_27685 - CITY
      ?auto_27689 - PERSON
      ?auto_27682 - PERSON
      ?auto_27687 - CITY
      ?auto_27686 - AIRCRAFT
      ?auto_27683 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27688 ?auto_27684 ) ( not ( = ?auto_27680 ?auto_27685 ) ) ( not ( = ?auto_27684 ?auto_27688 ) ) ( not ( = ?auto_27689 ?auto_27681 ) ) ( PERSON-AT ?auto_27681 ?auto_27685 ) ( not ( = ?auto_27689 ?auto_27682 ) ) ( not ( = ?auto_27681 ?auto_27682 ) ) ( not ( = ?auto_27680 ?auto_27687 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( PERSON-AT ?auto_27682 ?auto_27687 ) ( AIRCRAFT-AT ?auto_27686 ?auto_27683 ) ( FUEL-LEVEL ?auto_27686 ?auto_27684 ) ( not ( = ?auto_27680 ?auto_27683 ) ) ( not ( = ?auto_27685 ?auto_27683 ) ) ( not ( = ?auto_27687 ?auto_27683 ) ) ( PERSON-AT ?auto_27689 ?auto_27683 ) )
    :subtasks
    ( ( !BOARD ?auto_27689 ?auto_27686 ?auto_27683 )
      ( FLY-2PPL ?auto_27689 ?auto_27681 ?auto_27680 )
      ( FLY-1PPL-VERIFY ?auto_27681 ?auto_27680 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27691 - PERSON
      ?auto_27692 - PERSON
      ?auto_27690 - CITY
    )
    :vars
    (
      ?auto_27697 - FLEVEL
      ?auto_27698 - FLEVEL
      ?auto_27699 - CITY
      ?auto_27694 - PERSON
      ?auto_27693 - CITY
      ?auto_27696 - AIRCRAFT
      ?auto_27695 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27697 ?auto_27698 ) ( not ( = ?auto_27690 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27697 ) ) ( not ( = ?auto_27691 ?auto_27692 ) ) ( PERSON-AT ?auto_27692 ?auto_27699 ) ( not ( = ?auto_27691 ?auto_27694 ) ) ( not ( = ?auto_27692 ?auto_27694 ) ) ( not ( = ?auto_27690 ?auto_27693 ) ) ( not ( = ?auto_27699 ?auto_27693 ) ) ( PERSON-AT ?auto_27694 ?auto_27693 ) ( AIRCRAFT-AT ?auto_27696 ?auto_27695 ) ( FUEL-LEVEL ?auto_27696 ?auto_27698 ) ( not ( = ?auto_27690 ?auto_27695 ) ) ( not ( = ?auto_27699 ?auto_27695 ) ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( PERSON-AT ?auto_27691 ?auto_27695 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_27692 ?auto_27690 )
      ( FLY-2PPL-VERIFY ?auto_27691 ?auto_27692 ?auto_27690 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27701 - PERSON
      ?auto_27702 - PERSON
      ?auto_27700 - CITY
    )
    :vars
    (
      ?auto_27703 - FLEVEL
      ?auto_27708 - FLEVEL
      ?auto_27704 - CITY
      ?auto_27709 - PERSON
      ?auto_27705 - CITY
      ?auto_27707 - AIRCRAFT
      ?auto_27706 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27703 ?auto_27708 ) ( not ( = ?auto_27700 ?auto_27704 ) ) ( not ( = ?auto_27708 ?auto_27703 ) ) ( not ( = ?auto_27709 ?auto_27702 ) ) ( PERSON-AT ?auto_27702 ?auto_27704 ) ( not ( = ?auto_27709 ?auto_27701 ) ) ( not ( = ?auto_27702 ?auto_27701 ) ) ( not ( = ?auto_27700 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( PERSON-AT ?auto_27701 ?auto_27705 ) ( AIRCRAFT-AT ?auto_27707 ?auto_27706 ) ( FUEL-LEVEL ?auto_27707 ?auto_27708 ) ( not ( = ?auto_27700 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( PERSON-AT ?auto_27709 ?auto_27706 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27709 ?auto_27702 ?auto_27700 )
      ( FLY-2PPL-VERIFY ?auto_27701 ?auto_27702 ?auto_27700 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27711 - PERSON
      ?auto_27712 - PERSON
      ?auto_27710 - CITY
    )
    :vars
    (
      ?auto_27713 - FLEVEL
      ?auto_27719 - FLEVEL
      ?auto_27714 - CITY
      ?auto_27715 - PERSON
      ?auto_27716 - CITY
      ?auto_27718 - AIRCRAFT
      ?auto_27717 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27713 ?auto_27719 ) ( not ( = ?auto_27710 ?auto_27714 ) ) ( not ( = ?auto_27719 ?auto_27713 ) ) ( not ( = ?auto_27712 ?auto_27711 ) ) ( PERSON-AT ?auto_27711 ?auto_27714 ) ( not ( = ?auto_27712 ?auto_27715 ) ) ( not ( = ?auto_27711 ?auto_27715 ) ) ( not ( = ?auto_27710 ?auto_27716 ) ) ( not ( = ?auto_27714 ?auto_27716 ) ) ( PERSON-AT ?auto_27715 ?auto_27716 ) ( AIRCRAFT-AT ?auto_27718 ?auto_27717 ) ( FUEL-LEVEL ?auto_27718 ?auto_27719 ) ( not ( = ?auto_27710 ?auto_27717 ) ) ( not ( = ?auto_27714 ?auto_27717 ) ) ( not ( = ?auto_27716 ?auto_27717 ) ) ( PERSON-AT ?auto_27712 ?auto_27717 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27712 ?auto_27711 ?auto_27710 )
      ( FLY-2PPL-VERIFY ?auto_27711 ?auto_27712 ?auto_27710 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27721 - PERSON
      ?auto_27722 - PERSON
      ?auto_27720 - CITY
    )
    :vars
    (
      ?auto_27723 - FLEVEL
      ?auto_27728 - FLEVEL
      ?auto_27724 - CITY
      ?auto_27729 - PERSON
      ?auto_27725 - CITY
      ?auto_27727 - AIRCRAFT
      ?auto_27726 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27723 ?auto_27728 ) ( not ( = ?auto_27720 ?auto_27724 ) ) ( not ( = ?auto_27728 ?auto_27723 ) ) ( not ( = ?auto_27729 ?auto_27721 ) ) ( PERSON-AT ?auto_27721 ?auto_27724 ) ( not ( = ?auto_27729 ?auto_27722 ) ) ( not ( = ?auto_27721 ?auto_27722 ) ) ( not ( = ?auto_27720 ?auto_27725 ) ) ( not ( = ?auto_27724 ?auto_27725 ) ) ( PERSON-AT ?auto_27722 ?auto_27725 ) ( AIRCRAFT-AT ?auto_27727 ?auto_27726 ) ( FUEL-LEVEL ?auto_27727 ?auto_27728 ) ( not ( = ?auto_27720 ?auto_27726 ) ) ( not ( = ?auto_27724 ?auto_27726 ) ) ( not ( = ?auto_27725 ?auto_27726 ) ) ( PERSON-AT ?auto_27729 ?auto_27726 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27729 ?auto_27721 ?auto_27720 )
      ( FLY-2PPL-VERIFY ?auto_27721 ?auto_27722 ?auto_27720 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27753 - PERSON
      ?auto_27754 - PERSON
      ?auto_27755 - PERSON
      ?auto_27752 - CITY
    )
    :vars
    (
      ?auto_27756 - FLEVEL
      ?auto_27761 - FLEVEL
      ?auto_27757 - CITY
      ?auto_27758 - CITY
      ?auto_27760 - AIRCRAFT
      ?auto_27759 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27756 ?auto_27761 ) ( not ( = ?auto_27752 ?auto_27757 ) ) ( not ( = ?auto_27761 ?auto_27756 ) ) ( not ( = ?auto_27753 ?auto_27755 ) ) ( PERSON-AT ?auto_27755 ?auto_27757 ) ( not ( = ?auto_27753 ?auto_27754 ) ) ( not ( = ?auto_27755 ?auto_27754 ) ) ( not ( = ?auto_27752 ?auto_27758 ) ) ( not ( = ?auto_27757 ?auto_27758 ) ) ( PERSON-AT ?auto_27754 ?auto_27758 ) ( AIRCRAFT-AT ?auto_27760 ?auto_27759 ) ( FUEL-LEVEL ?auto_27760 ?auto_27761 ) ( not ( = ?auto_27752 ?auto_27759 ) ) ( not ( = ?auto_27757 ?auto_27759 ) ) ( not ( = ?auto_27758 ?auto_27759 ) ) ( PERSON-AT ?auto_27753 ?auto_27759 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27753 ?auto_27755 ?auto_27752 )
      ( FLY-3PPL-VERIFY ?auto_27753 ?auto_27754 ?auto_27755 ?auto_27752 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27774 - PERSON
      ?auto_27775 - PERSON
      ?auto_27776 - PERSON
      ?auto_27773 - CITY
    )
    :vars
    (
      ?auto_27777 - FLEVEL
      ?auto_27782 - FLEVEL
      ?auto_27778 - CITY
      ?auto_27779 - CITY
      ?auto_27781 - AIRCRAFT
      ?auto_27780 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27777 ?auto_27782 ) ( not ( = ?auto_27773 ?auto_27778 ) ) ( not ( = ?auto_27782 ?auto_27777 ) ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( PERSON-AT ?auto_27775 ?auto_27778 ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27773 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( PERSON-AT ?auto_27776 ?auto_27779 ) ( AIRCRAFT-AT ?auto_27781 ?auto_27780 ) ( FUEL-LEVEL ?auto_27781 ?auto_27782 ) ( not ( = ?auto_27773 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( PERSON-AT ?auto_27774 ?auto_27780 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27774 ?auto_27775 ?auto_27773 )
      ( FLY-3PPL-VERIFY ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27773 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27795 - PERSON
      ?auto_27796 - PERSON
      ?auto_27797 - PERSON
      ?auto_27794 - CITY
    )
    :vars
    (
      ?auto_27798 - FLEVEL
      ?auto_27803 - FLEVEL
      ?auto_27799 - CITY
      ?auto_27800 - CITY
      ?auto_27802 - AIRCRAFT
      ?auto_27801 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27798 ?auto_27803 ) ( not ( = ?auto_27794 ?auto_27799 ) ) ( not ( = ?auto_27803 ?auto_27798 ) ) ( not ( = ?auto_27796 ?auto_27797 ) ) ( PERSON-AT ?auto_27797 ?auto_27799 ) ( not ( = ?auto_27796 ?auto_27795 ) ) ( not ( = ?auto_27797 ?auto_27795 ) ) ( not ( = ?auto_27794 ?auto_27800 ) ) ( not ( = ?auto_27799 ?auto_27800 ) ) ( PERSON-AT ?auto_27795 ?auto_27800 ) ( AIRCRAFT-AT ?auto_27802 ?auto_27801 ) ( FUEL-LEVEL ?auto_27802 ?auto_27803 ) ( not ( = ?auto_27794 ?auto_27801 ) ) ( not ( = ?auto_27799 ?auto_27801 ) ) ( not ( = ?auto_27800 ?auto_27801 ) ) ( PERSON-AT ?auto_27796 ?auto_27801 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27796 ?auto_27797 ?auto_27794 )
      ( FLY-3PPL-VERIFY ?auto_27795 ?auto_27796 ?auto_27797 ?auto_27794 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27816 - PERSON
      ?auto_27817 - PERSON
      ?auto_27818 - PERSON
      ?auto_27815 - CITY
    )
    :vars
    (
      ?auto_27819 - FLEVEL
      ?auto_27824 - FLEVEL
      ?auto_27820 - CITY
      ?auto_27821 - CITY
      ?auto_27823 - AIRCRAFT
      ?auto_27822 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27819 ?auto_27824 ) ( not ( = ?auto_27815 ?auto_27820 ) ) ( not ( = ?auto_27824 ?auto_27819 ) ) ( not ( = ?auto_27818 ?auto_27817 ) ) ( PERSON-AT ?auto_27817 ?auto_27820 ) ( not ( = ?auto_27818 ?auto_27816 ) ) ( not ( = ?auto_27817 ?auto_27816 ) ) ( not ( = ?auto_27815 ?auto_27821 ) ) ( not ( = ?auto_27820 ?auto_27821 ) ) ( PERSON-AT ?auto_27816 ?auto_27821 ) ( AIRCRAFT-AT ?auto_27823 ?auto_27822 ) ( FUEL-LEVEL ?auto_27823 ?auto_27824 ) ( not ( = ?auto_27815 ?auto_27822 ) ) ( not ( = ?auto_27820 ?auto_27822 ) ) ( not ( = ?auto_27821 ?auto_27822 ) ) ( PERSON-AT ?auto_27818 ?auto_27822 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27818 ?auto_27817 ?auto_27815 )
      ( FLY-3PPL-VERIFY ?auto_27816 ?auto_27817 ?auto_27818 ?auto_27815 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27859 - PERSON
      ?auto_27860 - PERSON
      ?auto_27861 - PERSON
      ?auto_27858 - CITY
    )
    :vars
    (
      ?auto_27862 - FLEVEL
      ?auto_27867 - FLEVEL
      ?auto_27863 - CITY
      ?auto_27864 - CITY
      ?auto_27866 - AIRCRAFT
      ?auto_27865 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27862 ?auto_27867 ) ( not ( = ?auto_27858 ?auto_27863 ) ) ( not ( = ?auto_27867 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27859 ) ) ( PERSON-AT ?auto_27859 ?auto_27863 ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( PERSON-AT ?auto_27861 ?auto_27864 ) ( AIRCRAFT-AT ?auto_27866 ?auto_27865 ) ( FUEL-LEVEL ?auto_27866 ?auto_27867 ) ( not ( = ?auto_27858 ?auto_27865 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( PERSON-AT ?auto_27860 ?auto_27865 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27860 ?auto_27859 ?auto_27858 )
      ( FLY-3PPL-VERIFY ?auto_27859 ?auto_27860 ?auto_27861 ?auto_27858 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_27880 - PERSON
      ?auto_27881 - PERSON
      ?auto_27882 - PERSON
      ?auto_27879 - CITY
    )
    :vars
    (
      ?auto_27883 - FLEVEL
      ?auto_27888 - FLEVEL
      ?auto_27884 - CITY
      ?auto_27885 - CITY
      ?auto_27887 - AIRCRAFT
      ?auto_27886 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27883 ?auto_27888 ) ( not ( = ?auto_27879 ?auto_27884 ) ) ( not ( = ?auto_27888 ?auto_27883 ) ) ( not ( = ?auto_27882 ?auto_27880 ) ) ( PERSON-AT ?auto_27880 ?auto_27884 ) ( not ( = ?auto_27882 ?auto_27881 ) ) ( not ( = ?auto_27880 ?auto_27881 ) ) ( not ( = ?auto_27879 ?auto_27885 ) ) ( not ( = ?auto_27884 ?auto_27885 ) ) ( PERSON-AT ?auto_27881 ?auto_27885 ) ( AIRCRAFT-AT ?auto_27887 ?auto_27886 ) ( FUEL-LEVEL ?auto_27887 ?auto_27888 ) ( not ( = ?auto_27879 ?auto_27886 ) ) ( not ( = ?auto_27884 ?auto_27886 ) ) ( not ( = ?auto_27885 ?auto_27886 ) ) ( PERSON-AT ?auto_27882 ?auto_27886 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27882 ?auto_27880 ?auto_27879 )
      ( FLY-3PPL-VERIFY ?auto_27880 ?auto_27881 ?auto_27882 ?auto_27879 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_27946 - PERSON
      ?auto_27945 - CITY
    )
    :vars
    (
      ?auto_27947 - FLEVEL
      ?auto_27953 - FLEVEL
      ?auto_27948 - CITY
      ?auto_27954 - PERSON
      ?auto_27949 - PERSON
      ?auto_27950 - CITY
      ?auto_27952 - AIRCRAFT
      ?auto_27951 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27947 ?auto_27953 ) ( not ( = ?auto_27945 ?auto_27948 ) ) ( not ( = ?auto_27953 ?auto_27947 ) ) ( not ( = ?auto_27954 ?auto_27946 ) ) ( PERSON-AT ?auto_27946 ?auto_27948 ) ( not ( = ?auto_27954 ?auto_27949 ) ) ( not ( = ?auto_27946 ?auto_27949 ) ) ( not ( = ?auto_27945 ?auto_27950 ) ) ( not ( = ?auto_27948 ?auto_27950 ) ) ( PERSON-AT ?auto_27949 ?auto_27950 ) ( AIRCRAFT-AT ?auto_27952 ?auto_27951 ) ( not ( = ?auto_27945 ?auto_27951 ) ) ( not ( = ?auto_27948 ?auto_27951 ) ) ( not ( = ?auto_27950 ?auto_27951 ) ) ( PERSON-AT ?auto_27954 ?auto_27951 ) ( FUEL-LEVEL ?auto_27952 ?auto_27947 ) )
    :subtasks
    ( ( !REFUEL ?auto_27952 ?auto_27951 ?auto_27947 ?auto_27953 )
      ( FLY-2PPL ?auto_27954 ?auto_27946 ?auto_27945 )
      ( FLY-1PPL-VERIFY ?auto_27946 ?auto_27945 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27956 - PERSON
      ?auto_27957 - PERSON
      ?auto_27955 - CITY
    )
    :vars
    (
      ?auto_27964 - FLEVEL
      ?auto_27961 - FLEVEL
      ?auto_27963 - CITY
      ?auto_27960 - PERSON
      ?auto_27962 - CITY
      ?auto_27958 - AIRCRAFT
      ?auto_27959 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27964 ?auto_27961 ) ( not ( = ?auto_27955 ?auto_27963 ) ) ( not ( = ?auto_27961 ?auto_27964 ) ) ( not ( = ?auto_27956 ?auto_27957 ) ) ( PERSON-AT ?auto_27957 ?auto_27963 ) ( not ( = ?auto_27956 ?auto_27960 ) ) ( not ( = ?auto_27957 ?auto_27960 ) ) ( not ( = ?auto_27955 ?auto_27962 ) ) ( not ( = ?auto_27963 ?auto_27962 ) ) ( PERSON-AT ?auto_27960 ?auto_27962 ) ( AIRCRAFT-AT ?auto_27958 ?auto_27959 ) ( not ( = ?auto_27955 ?auto_27959 ) ) ( not ( = ?auto_27963 ?auto_27959 ) ) ( not ( = ?auto_27962 ?auto_27959 ) ) ( PERSON-AT ?auto_27956 ?auto_27959 ) ( FUEL-LEVEL ?auto_27958 ?auto_27964 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_27957 ?auto_27955 )
      ( FLY-2PPL-VERIFY ?auto_27956 ?auto_27957 ?auto_27955 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27966 - PERSON
      ?auto_27967 - PERSON
      ?auto_27965 - CITY
    )
    :vars
    (
      ?auto_27968 - FLEVEL
      ?auto_27973 - FLEVEL
      ?auto_27969 - CITY
      ?auto_27974 - PERSON
      ?auto_27970 - CITY
      ?auto_27972 - AIRCRAFT
      ?auto_27971 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27968 ?auto_27973 ) ( not ( = ?auto_27965 ?auto_27969 ) ) ( not ( = ?auto_27973 ?auto_27968 ) ) ( not ( = ?auto_27974 ?auto_27967 ) ) ( PERSON-AT ?auto_27967 ?auto_27969 ) ( not ( = ?auto_27974 ?auto_27966 ) ) ( not ( = ?auto_27967 ?auto_27966 ) ) ( not ( = ?auto_27965 ?auto_27970 ) ) ( not ( = ?auto_27969 ?auto_27970 ) ) ( PERSON-AT ?auto_27966 ?auto_27970 ) ( AIRCRAFT-AT ?auto_27972 ?auto_27971 ) ( not ( = ?auto_27965 ?auto_27971 ) ) ( not ( = ?auto_27969 ?auto_27971 ) ) ( not ( = ?auto_27970 ?auto_27971 ) ) ( PERSON-AT ?auto_27974 ?auto_27971 ) ( FUEL-LEVEL ?auto_27972 ?auto_27968 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27974 ?auto_27967 ?auto_27965 )
      ( FLY-2PPL-VERIFY ?auto_27966 ?auto_27967 ?auto_27965 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27976 - PERSON
      ?auto_27977 - PERSON
      ?auto_27975 - CITY
    )
    :vars
    (
      ?auto_27978 - FLEVEL
      ?auto_27984 - FLEVEL
      ?auto_27979 - CITY
      ?auto_27981 - PERSON
      ?auto_27980 - CITY
      ?auto_27983 - AIRCRAFT
      ?auto_27982 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27978 ?auto_27984 ) ( not ( = ?auto_27975 ?auto_27979 ) ) ( not ( = ?auto_27984 ?auto_27978 ) ) ( not ( = ?auto_27977 ?auto_27976 ) ) ( PERSON-AT ?auto_27976 ?auto_27979 ) ( not ( = ?auto_27977 ?auto_27981 ) ) ( not ( = ?auto_27976 ?auto_27981 ) ) ( not ( = ?auto_27975 ?auto_27980 ) ) ( not ( = ?auto_27979 ?auto_27980 ) ) ( PERSON-AT ?auto_27981 ?auto_27980 ) ( AIRCRAFT-AT ?auto_27983 ?auto_27982 ) ( not ( = ?auto_27975 ?auto_27982 ) ) ( not ( = ?auto_27979 ?auto_27982 ) ) ( not ( = ?auto_27980 ?auto_27982 ) ) ( PERSON-AT ?auto_27977 ?auto_27982 ) ( FUEL-LEVEL ?auto_27983 ?auto_27978 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27977 ?auto_27976 ?auto_27975 )
      ( FLY-2PPL-VERIFY ?auto_27976 ?auto_27977 ?auto_27975 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_27986 - PERSON
      ?auto_27987 - PERSON
      ?auto_27985 - CITY
    )
    :vars
    (
      ?auto_27988 - FLEVEL
      ?auto_27993 - FLEVEL
      ?auto_27989 - CITY
      ?auto_27994 - PERSON
      ?auto_27990 - CITY
      ?auto_27992 - AIRCRAFT
      ?auto_27991 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_27988 ?auto_27993 ) ( not ( = ?auto_27985 ?auto_27989 ) ) ( not ( = ?auto_27993 ?auto_27988 ) ) ( not ( = ?auto_27994 ?auto_27986 ) ) ( PERSON-AT ?auto_27986 ?auto_27989 ) ( not ( = ?auto_27994 ?auto_27987 ) ) ( not ( = ?auto_27986 ?auto_27987 ) ) ( not ( = ?auto_27985 ?auto_27990 ) ) ( not ( = ?auto_27989 ?auto_27990 ) ) ( PERSON-AT ?auto_27987 ?auto_27990 ) ( AIRCRAFT-AT ?auto_27992 ?auto_27991 ) ( not ( = ?auto_27985 ?auto_27991 ) ) ( not ( = ?auto_27989 ?auto_27991 ) ) ( not ( = ?auto_27990 ?auto_27991 ) ) ( PERSON-AT ?auto_27994 ?auto_27991 ) ( FUEL-LEVEL ?auto_27992 ?auto_27988 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_27994 ?auto_27986 ?auto_27985 )
      ( FLY-2PPL-VERIFY ?auto_27986 ?auto_27987 ?auto_27985 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28018 - PERSON
      ?auto_28019 - PERSON
      ?auto_28020 - PERSON
      ?auto_28017 - CITY
    )
    :vars
    (
      ?auto_28021 - FLEVEL
      ?auto_28026 - FLEVEL
      ?auto_28022 - CITY
      ?auto_28023 - CITY
      ?auto_28025 - AIRCRAFT
      ?auto_28024 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_28021 ?auto_28026 ) ( not ( = ?auto_28017 ?auto_28022 ) ) ( not ( = ?auto_28026 ?auto_28021 ) ) ( not ( = ?auto_28018 ?auto_28020 ) ) ( PERSON-AT ?auto_28020 ?auto_28022 ) ( not ( = ?auto_28018 ?auto_28019 ) ) ( not ( = ?auto_28020 ?auto_28019 ) ) ( not ( = ?auto_28017 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) ( PERSON-AT ?auto_28019 ?auto_28023 ) ( AIRCRAFT-AT ?auto_28025 ?auto_28024 ) ( not ( = ?auto_28017 ?auto_28024 ) ) ( not ( = ?auto_28022 ?auto_28024 ) ) ( not ( = ?auto_28023 ?auto_28024 ) ) ( PERSON-AT ?auto_28018 ?auto_28024 ) ( FUEL-LEVEL ?auto_28025 ?auto_28021 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28018 ?auto_28020 ?auto_28017 )
      ( FLY-3PPL-VERIFY ?auto_28018 ?auto_28019 ?auto_28020 ?auto_28017 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28039 - PERSON
      ?auto_28040 - PERSON
      ?auto_28041 - PERSON
      ?auto_28038 - CITY
    )
    :vars
    (
      ?auto_28042 - FLEVEL
      ?auto_28047 - FLEVEL
      ?auto_28043 - CITY
      ?auto_28044 - CITY
      ?auto_28046 - AIRCRAFT
      ?auto_28045 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_28042 ?auto_28047 ) ( not ( = ?auto_28038 ?auto_28043 ) ) ( not ( = ?auto_28047 ?auto_28042 ) ) ( not ( = ?auto_28039 ?auto_28040 ) ) ( PERSON-AT ?auto_28040 ?auto_28043 ) ( not ( = ?auto_28039 ?auto_28041 ) ) ( not ( = ?auto_28040 ?auto_28041 ) ) ( not ( = ?auto_28038 ?auto_28044 ) ) ( not ( = ?auto_28043 ?auto_28044 ) ) ( PERSON-AT ?auto_28041 ?auto_28044 ) ( AIRCRAFT-AT ?auto_28046 ?auto_28045 ) ( not ( = ?auto_28038 ?auto_28045 ) ) ( not ( = ?auto_28043 ?auto_28045 ) ) ( not ( = ?auto_28044 ?auto_28045 ) ) ( PERSON-AT ?auto_28039 ?auto_28045 ) ( FUEL-LEVEL ?auto_28046 ?auto_28042 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28039 ?auto_28040 ?auto_28038 )
      ( FLY-3PPL-VERIFY ?auto_28039 ?auto_28040 ?auto_28041 ?auto_28038 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28060 - PERSON
      ?auto_28061 - PERSON
      ?auto_28062 - PERSON
      ?auto_28059 - CITY
    )
    :vars
    (
      ?auto_28063 - FLEVEL
      ?auto_28068 - FLEVEL
      ?auto_28064 - CITY
      ?auto_28065 - CITY
      ?auto_28067 - AIRCRAFT
      ?auto_28066 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_28063 ?auto_28068 ) ( not ( = ?auto_28059 ?auto_28064 ) ) ( not ( = ?auto_28068 ?auto_28063 ) ) ( not ( = ?auto_28061 ?auto_28062 ) ) ( PERSON-AT ?auto_28062 ?auto_28064 ) ( not ( = ?auto_28061 ?auto_28060 ) ) ( not ( = ?auto_28062 ?auto_28060 ) ) ( not ( = ?auto_28059 ?auto_28065 ) ) ( not ( = ?auto_28064 ?auto_28065 ) ) ( PERSON-AT ?auto_28060 ?auto_28065 ) ( AIRCRAFT-AT ?auto_28067 ?auto_28066 ) ( not ( = ?auto_28059 ?auto_28066 ) ) ( not ( = ?auto_28064 ?auto_28066 ) ) ( not ( = ?auto_28065 ?auto_28066 ) ) ( PERSON-AT ?auto_28061 ?auto_28066 ) ( FUEL-LEVEL ?auto_28067 ?auto_28063 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28061 ?auto_28062 ?auto_28059 )
      ( FLY-3PPL-VERIFY ?auto_28060 ?auto_28061 ?auto_28062 ?auto_28059 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28081 - PERSON
      ?auto_28082 - PERSON
      ?auto_28083 - PERSON
      ?auto_28080 - CITY
    )
    :vars
    (
      ?auto_28084 - FLEVEL
      ?auto_28089 - FLEVEL
      ?auto_28085 - CITY
      ?auto_28086 - CITY
      ?auto_28088 - AIRCRAFT
      ?auto_28087 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_28084 ?auto_28089 ) ( not ( = ?auto_28080 ?auto_28085 ) ) ( not ( = ?auto_28089 ?auto_28084 ) ) ( not ( = ?auto_28083 ?auto_28082 ) ) ( PERSON-AT ?auto_28082 ?auto_28085 ) ( not ( = ?auto_28083 ?auto_28081 ) ) ( not ( = ?auto_28082 ?auto_28081 ) ) ( not ( = ?auto_28080 ?auto_28086 ) ) ( not ( = ?auto_28085 ?auto_28086 ) ) ( PERSON-AT ?auto_28081 ?auto_28086 ) ( AIRCRAFT-AT ?auto_28088 ?auto_28087 ) ( not ( = ?auto_28080 ?auto_28087 ) ) ( not ( = ?auto_28085 ?auto_28087 ) ) ( not ( = ?auto_28086 ?auto_28087 ) ) ( PERSON-AT ?auto_28083 ?auto_28087 ) ( FUEL-LEVEL ?auto_28088 ?auto_28084 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28083 ?auto_28082 ?auto_28080 )
      ( FLY-3PPL-VERIFY ?auto_28081 ?auto_28082 ?auto_28083 ?auto_28080 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28124 - PERSON
      ?auto_28125 - PERSON
      ?auto_28126 - PERSON
      ?auto_28123 - CITY
    )
    :vars
    (
      ?auto_28127 - FLEVEL
      ?auto_28132 - FLEVEL
      ?auto_28128 - CITY
      ?auto_28129 - CITY
      ?auto_28131 - AIRCRAFT
      ?auto_28130 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_28127 ?auto_28132 ) ( not ( = ?auto_28123 ?auto_28128 ) ) ( not ( = ?auto_28132 ?auto_28127 ) ) ( not ( = ?auto_28125 ?auto_28124 ) ) ( PERSON-AT ?auto_28124 ?auto_28128 ) ( not ( = ?auto_28125 ?auto_28126 ) ) ( not ( = ?auto_28124 ?auto_28126 ) ) ( not ( = ?auto_28123 ?auto_28129 ) ) ( not ( = ?auto_28128 ?auto_28129 ) ) ( PERSON-AT ?auto_28126 ?auto_28129 ) ( AIRCRAFT-AT ?auto_28131 ?auto_28130 ) ( not ( = ?auto_28123 ?auto_28130 ) ) ( not ( = ?auto_28128 ?auto_28130 ) ) ( not ( = ?auto_28129 ?auto_28130 ) ) ( PERSON-AT ?auto_28125 ?auto_28130 ) ( FUEL-LEVEL ?auto_28131 ?auto_28127 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28125 ?auto_28124 ?auto_28123 )
      ( FLY-3PPL-VERIFY ?auto_28124 ?auto_28125 ?auto_28126 ?auto_28123 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28145 - PERSON
      ?auto_28146 - PERSON
      ?auto_28147 - PERSON
      ?auto_28144 - CITY
    )
    :vars
    (
      ?auto_28148 - FLEVEL
      ?auto_28153 - FLEVEL
      ?auto_28149 - CITY
      ?auto_28150 - CITY
      ?auto_28152 - AIRCRAFT
      ?auto_28151 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_28148 ?auto_28153 ) ( not ( = ?auto_28144 ?auto_28149 ) ) ( not ( = ?auto_28153 ?auto_28148 ) ) ( not ( = ?auto_28147 ?auto_28145 ) ) ( PERSON-AT ?auto_28145 ?auto_28149 ) ( not ( = ?auto_28147 ?auto_28146 ) ) ( not ( = ?auto_28145 ?auto_28146 ) ) ( not ( = ?auto_28144 ?auto_28150 ) ) ( not ( = ?auto_28149 ?auto_28150 ) ) ( PERSON-AT ?auto_28146 ?auto_28150 ) ( AIRCRAFT-AT ?auto_28152 ?auto_28151 ) ( not ( = ?auto_28144 ?auto_28151 ) ) ( not ( = ?auto_28149 ?auto_28151 ) ) ( not ( = ?auto_28150 ?auto_28151 ) ) ( PERSON-AT ?auto_28147 ?auto_28151 ) ( FUEL-LEVEL ?auto_28152 ?auto_28148 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28147 ?auto_28145 ?auto_28144 )
      ( FLY-3PPL-VERIFY ?auto_28145 ?auto_28146 ?auto_28147 ?auto_28144 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_28211 - PERSON
      ?auto_28210 - CITY
    )
    :vars
    (
      ?auto_28212 - FLEVEL
      ?auto_28218 - FLEVEL
      ?auto_28213 - CITY
      ?auto_28219 - PERSON
      ?auto_28215 - PERSON
      ?auto_28214 - CITY
      ?auto_28216 - CITY
      ?auto_28217 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28212 ?auto_28218 ) ( not ( = ?auto_28210 ?auto_28213 ) ) ( not ( = ?auto_28218 ?auto_28212 ) ) ( not ( = ?auto_28219 ?auto_28211 ) ) ( PERSON-AT ?auto_28211 ?auto_28213 ) ( not ( = ?auto_28219 ?auto_28215 ) ) ( not ( = ?auto_28211 ?auto_28215 ) ) ( not ( = ?auto_28210 ?auto_28214 ) ) ( not ( = ?auto_28213 ?auto_28214 ) ) ( PERSON-AT ?auto_28215 ?auto_28214 ) ( not ( = ?auto_28210 ?auto_28216 ) ) ( not ( = ?auto_28213 ?auto_28216 ) ) ( not ( = ?auto_28214 ?auto_28216 ) ) ( PERSON-AT ?auto_28219 ?auto_28216 ) ( AIRCRAFT-AT ?auto_28217 ?auto_28210 ) ( FUEL-LEVEL ?auto_28217 ?auto_28218 ) )
    :subtasks
    ( ( !FLY ?auto_28217 ?auto_28210 ?auto_28216 ?auto_28218 ?auto_28212 )
      ( FLY-2PPL ?auto_28219 ?auto_28211 ?auto_28210 )
      ( FLY-1PPL-VERIFY ?auto_28211 ?auto_28210 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28221 - PERSON
      ?auto_28222 - PERSON
      ?auto_28220 - CITY
    )
    :vars
    (
      ?auto_28224 - FLEVEL
      ?auto_28225 - FLEVEL
      ?auto_28226 - CITY
      ?auto_28229 - PERSON
      ?auto_28227 - CITY
      ?auto_28223 - CITY
      ?auto_28228 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28224 ?auto_28225 ) ( not ( = ?auto_28220 ?auto_28226 ) ) ( not ( = ?auto_28225 ?auto_28224 ) ) ( not ( = ?auto_28221 ?auto_28222 ) ) ( PERSON-AT ?auto_28222 ?auto_28226 ) ( not ( = ?auto_28221 ?auto_28229 ) ) ( not ( = ?auto_28222 ?auto_28229 ) ) ( not ( = ?auto_28220 ?auto_28227 ) ) ( not ( = ?auto_28226 ?auto_28227 ) ) ( PERSON-AT ?auto_28229 ?auto_28227 ) ( not ( = ?auto_28220 ?auto_28223 ) ) ( not ( = ?auto_28226 ?auto_28223 ) ) ( not ( = ?auto_28227 ?auto_28223 ) ) ( PERSON-AT ?auto_28221 ?auto_28223 ) ( AIRCRAFT-AT ?auto_28228 ?auto_28220 ) ( FUEL-LEVEL ?auto_28228 ?auto_28225 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_28222 ?auto_28220 )
      ( FLY-2PPL-VERIFY ?auto_28221 ?auto_28222 ?auto_28220 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28231 - PERSON
      ?auto_28232 - PERSON
      ?auto_28230 - CITY
    )
    :vars
    (
      ?auto_28233 - FLEVEL
      ?auto_28234 - FLEVEL
      ?auto_28235 - CITY
      ?auto_28239 - PERSON
      ?auto_28236 - CITY
      ?auto_28237 - CITY
      ?auto_28238 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28233 ?auto_28234 ) ( not ( = ?auto_28230 ?auto_28235 ) ) ( not ( = ?auto_28234 ?auto_28233 ) ) ( not ( = ?auto_28239 ?auto_28232 ) ) ( PERSON-AT ?auto_28232 ?auto_28235 ) ( not ( = ?auto_28239 ?auto_28231 ) ) ( not ( = ?auto_28232 ?auto_28231 ) ) ( not ( = ?auto_28230 ?auto_28236 ) ) ( not ( = ?auto_28235 ?auto_28236 ) ) ( PERSON-AT ?auto_28231 ?auto_28236 ) ( not ( = ?auto_28230 ?auto_28237 ) ) ( not ( = ?auto_28235 ?auto_28237 ) ) ( not ( = ?auto_28236 ?auto_28237 ) ) ( PERSON-AT ?auto_28239 ?auto_28237 ) ( AIRCRAFT-AT ?auto_28238 ?auto_28230 ) ( FUEL-LEVEL ?auto_28238 ?auto_28234 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28239 ?auto_28232 ?auto_28230 )
      ( FLY-2PPL-VERIFY ?auto_28231 ?auto_28232 ?auto_28230 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28241 - PERSON
      ?auto_28242 - PERSON
      ?auto_28240 - CITY
    )
    :vars
    (
      ?auto_28243 - FLEVEL
      ?auto_28244 - FLEVEL
      ?auto_28245 - CITY
      ?auto_28247 - PERSON
      ?auto_28246 - CITY
      ?auto_28248 - CITY
      ?auto_28249 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28243 ?auto_28244 ) ( not ( = ?auto_28240 ?auto_28245 ) ) ( not ( = ?auto_28244 ?auto_28243 ) ) ( not ( = ?auto_28242 ?auto_28241 ) ) ( PERSON-AT ?auto_28241 ?auto_28245 ) ( not ( = ?auto_28242 ?auto_28247 ) ) ( not ( = ?auto_28241 ?auto_28247 ) ) ( not ( = ?auto_28240 ?auto_28246 ) ) ( not ( = ?auto_28245 ?auto_28246 ) ) ( PERSON-AT ?auto_28247 ?auto_28246 ) ( not ( = ?auto_28240 ?auto_28248 ) ) ( not ( = ?auto_28245 ?auto_28248 ) ) ( not ( = ?auto_28246 ?auto_28248 ) ) ( PERSON-AT ?auto_28242 ?auto_28248 ) ( AIRCRAFT-AT ?auto_28249 ?auto_28240 ) ( FUEL-LEVEL ?auto_28249 ?auto_28244 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28242 ?auto_28241 ?auto_28240 )
      ( FLY-2PPL-VERIFY ?auto_28241 ?auto_28242 ?auto_28240 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28251 - PERSON
      ?auto_28252 - PERSON
      ?auto_28250 - CITY
    )
    :vars
    (
      ?auto_28253 - FLEVEL
      ?auto_28254 - FLEVEL
      ?auto_28255 - CITY
      ?auto_28259 - PERSON
      ?auto_28256 - CITY
      ?auto_28257 - CITY
      ?auto_28258 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28253 ?auto_28254 ) ( not ( = ?auto_28250 ?auto_28255 ) ) ( not ( = ?auto_28254 ?auto_28253 ) ) ( not ( = ?auto_28259 ?auto_28251 ) ) ( PERSON-AT ?auto_28251 ?auto_28255 ) ( not ( = ?auto_28259 ?auto_28252 ) ) ( not ( = ?auto_28251 ?auto_28252 ) ) ( not ( = ?auto_28250 ?auto_28256 ) ) ( not ( = ?auto_28255 ?auto_28256 ) ) ( PERSON-AT ?auto_28252 ?auto_28256 ) ( not ( = ?auto_28250 ?auto_28257 ) ) ( not ( = ?auto_28255 ?auto_28257 ) ) ( not ( = ?auto_28256 ?auto_28257 ) ) ( PERSON-AT ?auto_28259 ?auto_28257 ) ( AIRCRAFT-AT ?auto_28258 ?auto_28250 ) ( FUEL-LEVEL ?auto_28258 ?auto_28254 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28259 ?auto_28251 ?auto_28250 )
      ( FLY-2PPL-VERIFY ?auto_28251 ?auto_28252 ?auto_28250 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28283 - PERSON
      ?auto_28284 - PERSON
      ?auto_28285 - PERSON
      ?auto_28282 - CITY
    )
    :vars
    (
      ?auto_28286 - FLEVEL
      ?auto_28287 - FLEVEL
      ?auto_28288 - CITY
      ?auto_28289 - CITY
      ?auto_28290 - CITY
      ?auto_28291 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28286 ?auto_28287 ) ( not ( = ?auto_28282 ?auto_28288 ) ) ( not ( = ?auto_28287 ?auto_28286 ) ) ( not ( = ?auto_28283 ?auto_28285 ) ) ( PERSON-AT ?auto_28285 ?auto_28288 ) ( not ( = ?auto_28283 ?auto_28284 ) ) ( not ( = ?auto_28285 ?auto_28284 ) ) ( not ( = ?auto_28282 ?auto_28289 ) ) ( not ( = ?auto_28288 ?auto_28289 ) ) ( PERSON-AT ?auto_28284 ?auto_28289 ) ( not ( = ?auto_28282 ?auto_28290 ) ) ( not ( = ?auto_28288 ?auto_28290 ) ) ( not ( = ?auto_28289 ?auto_28290 ) ) ( PERSON-AT ?auto_28283 ?auto_28290 ) ( AIRCRAFT-AT ?auto_28291 ?auto_28282 ) ( FUEL-LEVEL ?auto_28291 ?auto_28287 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28283 ?auto_28285 ?auto_28282 )
      ( FLY-3PPL-VERIFY ?auto_28283 ?auto_28284 ?auto_28285 ?auto_28282 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28304 - PERSON
      ?auto_28305 - PERSON
      ?auto_28306 - PERSON
      ?auto_28303 - CITY
    )
    :vars
    (
      ?auto_28307 - FLEVEL
      ?auto_28308 - FLEVEL
      ?auto_28309 - CITY
      ?auto_28310 - CITY
      ?auto_28311 - CITY
      ?auto_28312 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28307 ?auto_28308 ) ( not ( = ?auto_28303 ?auto_28309 ) ) ( not ( = ?auto_28308 ?auto_28307 ) ) ( not ( = ?auto_28304 ?auto_28305 ) ) ( PERSON-AT ?auto_28305 ?auto_28309 ) ( not ( = ?auto_28304 ?auto_28306 ) ) ( not ( = ?auto_28305 ?auto_28306 ) ) ( not ( = ?auto_28303 ?auto_28310 ) ) ( not ( = ?auto_28309 ?auto_28310 ) ) ( PERSON-AT ?auto_28306 ?auto_28310 ) ( not ( = ?auto_28303 ?auto_28311 ) ) ( not ( = ?auto_28309 ?auto_28311 ) ) ( not ( = ?auto_28310 ?auto_28311 ) ) ( PERSON-AT ?auto_28304 ?auto_28311 ) ( AIRCRAFT-AT ?auto_28312 ?auto_28303 ) ( FUEL-LEVEL ?auto_28312 ?auto_28308 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28304 ?auto_28305 ?auto_28303 )
      ( FLY-3PPL-VERIFY ?auto_28304 ?auto_28305 ?auto_28306 ?auto_28303 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28325 - PERSON
      ?auto_28326 - PERSON
      ?auto_28327 - PERSON
      ?auto_28324 - CITY
    )
    :vars
    (
      ?auto_28328 - FLEVEL
      ?auto_28329 - FLEVEL
      ?auto_28330 - CITY
      ?auto_28331 - CITY
      ?auto_28332 - CITY
      ?auto_28333 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28328 ?auto_28329 ) ( not ( = ?auto_28324 ?auto_28330 ) ) ( not ( = ?auto_28329 ?auto_28328 ) ) ( not ( = ?auto_28326 ?auto_28327 ) ) ( PERSON-AT ?auto_28327 ?auto_28330 ) ( not ( = ?auto_28326 ?auto_28325 ) ) ( not ( = ?auto_28327 ?auto_28325 ) ) ( not ( = ?auto_28324 ?auto_28331 ) ) ( not ( = ?auto_28330 ?auto_28331 ) ) ( PERSON-AT ?auto_28325 ?auto_28331 ) ( not ( = ?auto_28324 ?auto_28332 ) ) ( not ( = ?auto_28330 ?auto_28332 ) ) ( not ( = ?auto_28331 ?auto_28332 ) ) ( PERSON-AT ?auto_28326 ?auto_28332 ) ( AIRCRAFT-AT ?auto_28333 ?auto_28324 ) ( FUEL-LEVEL ?auto_28333 ?auto_28329 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28326 ?auto_28327 ?auto_28324 )
      ( FLY-3PPL-VERIFY ?auto_28325 ?auto_28326 ?auto_28327 ?auto_28324 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28346 - PERSON
      ?auto_28347 - PERSON
      ?auto_28348 - PERSON
      ?auto_28345 - CITY
    )
    :vars
    (
      ?auto_28349 - FLEVEL
      ?auto_28350 - FLEVEL
      ?auto_28351 - CITY
      ?auto_28352 - CITY
      ?auto_28353 - CITY
      ?auto_28354 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28349 ?auto_28350 ) ( not ( = ?auto_28345 ?auto_28351 ) ) ( not ( = ?auto_28350 ?auto_28349 ) ) ( not ( = ?auto_28348 ?auto_28347 ) ) ( PERSON-AT ?auto_28347 ?auto_28351 ) ( not ( = ?auto_28348 ?auto_28346 ) ) ( not ( = ?auto_28347 ?auto_28346 ) ) ( not ( = ?auto_28345 ?auto_28352 ) ) ( not ( = ?auto_28351 ?auto_28352 ) ) ( PERSON-AT ?auto_28346 ?auto_28352 ) ( not ( = ?auto_28345 ?auto_28353 ) ) ( not ( = ?auto_28351 ?auto_28353 ) ) ( not ( = ?auto_28352 ?auto_28353 ) ) ( PERSON-AT ?auto_28348 ?auto_28353 ) ( AIRCRAFT-AT ?auto_28354 ?auto_28345 ) ( FUEL-LEVEL ?auto_28354 ?auto_28350 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28348 ?auto_28347 ?auto_28345 )
      ( FLY-3PPL-VERIFY ?auto_28346 ?auto_28347 ?auto_28348 ?auto_28345 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28389 - PERSON
      ?auto_28390 - PERSON
      ?auto_28391 - PERSON
      ?auto_28388 - CITY
    )
    :vars
    (
      ?auto_28392 - FLEVEL
      ?auto_28393 - FLEVEL
      ?auto_28394 - CITY
      ?auto_28395 - CITY
      ?auto_28396 - CITY
      ?auto_28397 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28392 ?auto_28393 ) ( not ( = ?auto_28388 ?auto_28394 ) ) ( not ( = ?auto_28393 ?auto_28392 ) ) ( not ( = ?auto_28390 ?auto_28389 ) ) ( PERSON-AT ?auto_28389 ?auto_28394 ) ( not ( = ?auto_28390 ?auto_28391 ) ) ( not ( = ?auto_28389 ?auto_28391 ) ) ( not ( = ?auto_28388 ?auto_28395 ) ) ( not ( = ?auto_28394 ?auto_28395 ) ) ( PERSON-AT ?auto_28391 ?auto_28395 ) ( not ( = ?auto_28388 ?auto_28396 ) ) ( not ( = ?auto_28394 ?auto_28396 ) ) ( not ( = ?auto_28395 ?auto_28396 ) ) ( PERSON-AT ?auto_28390 ?auto_28396 ) ( AIRCRAFT-AT ?auto_28397 ?auto_28388 ) ( FUEL-LEVEL ?auto_28397 ?auto_28393 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28390 ?auto_28389 ?auto_28388 )
      ( FLY-3PPL-VERIFY ?auto_28389 ?auto_28390 ?auto_28391 ?auto_28388 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28410 - PERSON
      ?auto_28411 - PERSON
      ?auto_28412 - PERSON
      ?auto_28409 - CITY
    )
    :vars
    (
      ?auto_28413 - FLEVEL
      ?auto_28414 - FLEVEL
      ?auto_28415 - CITY
      ?auto_28416 - CITY
      ?auto_28417 - CITY
      ?auto_28418 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28413 ?auto_28414 ) ( not ( = ?auto_28409 ?auto_28415 ) ) ( not ( = ?auto_28414 ?auto_28413 ) ) ( not ( = ?auto_28412 ?auto_28410 ) ) ( PERSON-AT ?auto_28410 ?auto_28415 ) ( not ( = ?auto_28412 ?auto_28411 ) ) ( not ( = ?auto_28410 ?auto_28411 ) ) ( not ( = ?auto_28409 ?auto_28416 ) ) ( not ( = ?auto_28415 ?auto_28416 ) ) ( PERSON-AT ?auto_28411 ?auto_28416 ) ( not ( = ?auto_28409 ?auto_28417 ) ) ( not ( = ?auto_28415 ?auto_28417 ) ) ( not ( = ?auto_28416 ?auto_28417 ) ) ( PERSON-AT ?auto_28412 ?auto_28417 ) ( AIRCRAFT-AT ?auto_28418 ?auto_28409 ) ( FUEL-LEVEL ?auto_28418 ?auto_28414 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28412 ?auto_28410 ?auto_28409 )
      ( FLY-3PPL-VERIFY ?auto_28410 ?auto_28411 ?auto_28412 ?auto_28409 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_28476 - PERSON
      ?auto_28475 - CITY
    )
    :vars
    (
      ?auto_28477 - FLEVEL
      ?auto_28478 - FLEVEL
      ?auto_28479 - CITY
      ?auto_28484 - PERSON
      ?auto_28481 - PERSON
      ?auto_28480 - CITY
      ?auto_28482 - CITY
      ?auto_28483 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28477 ?auto_28478 ) ( not ( = ?auto_28475 ?auto_28479 ) ) ( not ( = ?auto_28478 ?auto_28477 ) ) ( not ( = ?auto_28484 ?auto_28476 ) ) ( PERSON-AT ?auto_28476 ?auto_28479 ) ( not ( = ?auto_28484 ?auto_28481 ) ) ( not ( = ?auto_28476 ?auto_28481 ) ) ( not ( = ?auto_28475 ?auto_28480 ) ) ( not ( = ?auto_28479 ?auto_28480 ) ) ( PERSON-AT ?auto_28481 ?auto_28480 ) ( not ( = ?auto_28475 ?auto_28482 ) ) ( not ( = ?auto_28479 ?auto_28482 ) ) ( not ( = ?auto_28480 ?auto_28482 ) ) ( PERSON-AT ?auto_28484 ?auto_28482 ) ( AIRCRAFT-AT ?auto_28483 ?auto_28475 ) ( FUEL-LEVEL ?auto_28483 ?auto_28477 ) )
    :subtasks
    ( ( !REFUEL ?auto_28483 ?auto_28475 ?auto_28477 ?auto_28478 )
      ( FLY-2PPL ?auto_28484 ?auto_28476 ?auto_28475 )
      ( FLY-1PPL-VERIFY ?auto_28476 ?auto_28475 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28486 - PERSON
      ?auto_28487 - PERSON
      ?auto_28485 - CITY
    )
    :vars
    (
      ?auto_28490 - FLEVEL
      ?auto_28488 - FLEVEL
      ?auto_28493 - CITY
      ?auto_28492 - PERSON
      ?auto_28489 - CITY
      ?auto_28491 - CITY
      ?auto_28494 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28490 ?auto_28488 ) ( not ( = ?auto_28485 ?auto_28493 ) ) ( not ( = ?auto_28488 ?auto_28490 ) ) ( not ( = ?auto_28486 ?auto_28487 ) ) ( PERSON-AT ?auto_28487 ?auto_28493 ) ( not ( = ?auto_28486 ?auto_28492 ) ) ( not ( = ?auto_28487 ?auto_28492 ) ) ( not ( = ?auto_28485 ?auto_28489 ) ) ( not ( = ?auto_28493 ?auto_28489 ) ) ( PERSON-AT ?auto_28492 ?auto_28489 ) ( not ( = ?auto_28485 ?auto_28491 ) ) ( not ( = ?auto_28493 ?auto_28491 ) ) ( not ( = ?auto_28489 ?auto_28491 ) ) ( PERSON-AT ?auto_28486 ?auto_28491 ) ( AIRCRAFT-AT ?auto_28494 ?auto_28485 ) ( FUEL-LEVEL ?auto_28494 ?auto_28490 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_28487 ?auto_28485 )
      ( FLY-2PPL-VERIFY ?auto_28486 ?auto_28487 ?auto_28485 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28496 - PERSON
      ?auto_28497 - PERSON
      ?auto_28495 - CITY
    )
    :vars
    (
      ?auto_28502 - FLEVEL
      ?auto_28501 - FLEVEL
      ?auto_28499 - CITY
      ?auto_28504 - PERSON
      ?auto_28500 - CITY
      ?auto_28503 - CITY
      ?auto_28498 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28502 ?auto_28501 ) ( not ( = ?auto_28495 ?auto_28499 ) ) ( not ( = ?auto_28501 ?auto_28502 ) ) ( not ( = ?auto_28504 ?auto_28497 ) ) ( PERSON-AT ?auto_28497 ?auto_28499 ) ( not ( = ?auto_28504 ?auto_28496 ) ) ( not ( = ?auto_28497 ?auto_28496 ) ) ( not ( = ?auto_28495 ?auto_28500 ) ) ( not ( = ?auto_28499 ?auto_28500 ) ) ( PERSON-AT ?auto_28496 ?auto_28500 ) ( not ( = ?auto_28495 ?auto_28503 ) ) ( not ( = ?auto_28499 ?auto_28503 ) ) ( not ( = ?auto_28500 ?auto_28503 ) ) ( PERSON-AT ?auto_28504 ?auto_28503 ) ( AIRCRAFT-AT ?auto_28498 ?auto_28495 ) ( FUEL-LEVEL ?auto_28498 ?auto_28502 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28504 ?auto_28497 ?auto_28495 )
      ( FLY-2PPL-VERIFY ?auto_28496 ?auto_28497 ?auto_28495 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28506 - PERSON
      ?auto_28507 - PERSON
      ?auto_28505 - CITY
    )
    :vars
    (
      ?auto_28513 - FLEVEL
      ?auto_28511 - FLEVEL
      ?auto_28509 - CITY
      ?auto_28512 - PERSON
      ?auto_28510 - CITY
      ?auto_28514 - CITY
      ?auto_28508 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28513 ?auto_28511 ) ( not ( = ?auto_28505 ?auto_28509 ) ) ( not ( = ?auto_28511 ?auto_28513 ) ) ( not ( = ?auto_28507 ?auto_28506 ) ) ( PERSON-AT ?auto_28506 ?auto_28509 ) ( not ( = ?auto_28507 ?auto_28512 ) ) ( not ( = ?auto_28506 ?auto_28512 ) ) ( not ( = ?auto_28505 ?auto_28510 ) ) ( not ( = ?auto_28509 ?auto_28510 ) ) ( PERSON-AT ?auto_28512 ?auto_28510 ) ( not ( = ?auto_28505 ?auto_28514 ) ) ( not ( = ?auto_28509 ?auto_28514 ) ) ( not ( = ?auto_28510 ?auto_28514 ) ) ( PERSON-AT ?auto_28507 ?auto_28514 ) ( AIRCRAFT-AT ?auto_28508 ?auto_28505 ) ( FUEL-LEVEL ?auto_28508 ?auto_28513 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28507 ?auto_28506 ?auto_28505 )
      ( FLY-2PPL-VERIFY ?auto_28506 ?auto_28507 ?auto_28505 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_28516 - PERSON
      ?auto_28517 - PERSON
      ?auto_28515 - CITY
    )
    :vars
    (
      ?auto_28522 - FLEVEL
      ?auto_28521 - FLEVEL
      ?auto_28519 - CITY
      ?auto_28524 - PERSON
      ?auto_28520 - CITY
      ?auto_28523 - CITY
      ?auto_28518 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28522 ?auto_28521 ) ( not ( = ?auto_28515 ?auto_28519 ) ) ( not ( = ?auto_28521 ?auto_28522 ) ) ( not ( = ?auto_28524 ?auto_28516 ) ) ( PERSON-AT ?auto_28516 ?auto_28519 ) ( not ( = ?auto_28524 ?auto_28517 ) ) ( not ( = ?auto_28516 ?auto_28517 ) ) ( not ( = ?auto_28515 ?auto_28520 ) ) ( not ( = ?auto_28519 ?auto_28520 ) ) ( PERSON-AT ?auto_28517 ?auto_28520 ) ( not ( = ?auto_28515 ?auto_28523 ) ) ( not ( = ?auto_28519 ?auto_28523 ) ) ( not ( = ?auto_28520 ?auto_28523 ) ) ( PERSON-AT ?auto_28524 ?auto_28523 ) ( AIRCRAFT-AT ?auto_28518 ?auto_28515 ) ( FUEL-LEVEL ?auto_28518 ?auto_28522 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28524 ?auto_28516 ?auto_28515 )
      ( FLY-2PPL-VERIFY ?auto_28516 ?auto_28517 ?auto_28515 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28548 - PERSON
      ?auto_28549 - PERSON
      ?auto_28550 - PERSON
      ?auto_28547 - CITY
    )
    :vars
    (
      ?auto_28555 - FLEVEL
      ?auto_28554 - FLEVEL
      ?auto_28552 - CITY
      ?auto_28553 - CITY
      ?auto_28556 - CITY
      ?auto_28551 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28555 ?auto_28554 ) ( not ( = ?auto_28547 ?auto_28552 ) ) ( not ( = ?auto_28554 ?auto_28555 ) ) ( not ( = ?auto_28548 ?auto_28550 ) ) ( PERSON-AT ?auto_28550 ?auto_28552 ) ( not ( = ?auto_28548 ?auto_28549 ) ) ( not ( = ?auto_28550 ?auto_28549 ) ) ( not ( = ?auto_28547 ?auto_28553 ) ) ( not ( = ?auto_28552 ?auto_28553 ) ) ( PERSON-AT ?auto_28549 ?auto_28553 ) ( not ( = ?auto_28547 ?auto_28556 ) ) ( not ( = ?auto_28552 ?auto_28556 ) ) ( not ( = ?auto_28553 ?auto_28556 ) ) ( PERSON-AT ?auto_28548 ?auto_28556 ) ( AIRCRAFT-AT ?auto_28551 ?auto_28547 ) ( FUEL-LEVEL ?auto_28551 ?auto_28555 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28548 ?auto_28550 ?auto_28547 )
      ( FLY-3PPL-VERIFY ?auto_28548 ?auto_28549 ?auto_28550 ?auto_28547 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28569 - PERSON
      ?auto_28570 - PERSON
      ?auto_28571 - PERSON
      ?auto_28568 - CITY
    )
    :vars
    (
      ?auto_28576 - FLEVEL
      ?auto_28575 - FLEVEL
      ?auto_28573 - CITY
      ?auto_28574 - CITY
      ?auto_28577 - CITY
      ?auto_28572 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28576 ?auto_28575 ) ( not ( = ?auto_28568 ?auto_28573 ) ) ( not ( = ?auto_28575 ?auto_28576 ) ) ( not ( = ?auto_28569 ?auto_28570 ) ) ( PERSON-AT ?auto_28570 ?auto_28573 ) ( not ( = ?auto_28569 ?auto_28571 ) ) ( not ( = ?auto_28570 ?auto_28571 ) ) ( not ( = ?auto_28568 ?auto_28574 ) ) ( not ( = ?auto_28573 ?auto_28574 ) ) ( PERSON-AT ?auto_28571 ?auto_28574 ) ( not ( = ?auto_28568 ?auto_28577 ) ) ( not ( = ?auto_28573 ?auto_28577 ) ) ( not ( = ?auto_28574 ?auto_28577 ) ) ( PERSON-AT ?auto_28569 ?auto_28577 ) ( AIRCRAFT-AT ?auto_28572 ?auto_28568 ) ( FUEL-LEVEL ?auto_28572 ?auto_28576 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28569 ?auto_28570 ?auto_28568 )
      ( FLY-3PPL-VERIFY ?auto_28569 ?auto_28570 ?auto_28571 ?auto_28568 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28590 - PERSON
      ?auto_28591 - PERSON
      ?auto_28592 - PERSON
      ?auto_28589 - CITY
    )
    :vars
    (
      ?auto_28597 - FLEVEL
      ?auto_28596 - FLEVEL
      ?auto_28594 - CITY
      ?auto_28595 - CITY
      ?auto_28598 - CITY
      ?auto_28593 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28597 ?auto_28596 ) ( not ( = ?auto_28589 ?auto_28594 ) ) ( not ( = ?auto_28596 ?auto_28597 ) ) ( not ( = ?auto_28591 ?auto_28592 ) ) ( PERSON-AT ?auto_28592 ?auto_28594 ) ( not ( = ?auto_28591 ?auto_28590 ) ) ( not ( = ?auto_28592 ?auto_28590 ) ) ( not ( = ?auto_28589 ?auto_28595 ) ) ( not ( = ?auto_28594 ?auto_28595 ) ) ( PERSON-AT ?auto_28590 ?auto_28595 ) ( not ( = ?auto_28589 ?auto_28598 ) ) ( not ( = ?auto_28594 ?auto_28598 ) ) ( not ( = ?auto_28595 ?auto_28598 ) ) ( PERSON-AT ?auto_28591 ?auto_28598 ) ( AIRCRAFT-AT ?auto_28593 ?auto_28589 ) ( FUEL-LEVEL ?auto_28593 ?auto_28597 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28591 ?auto_28592 ?auto_28589 )
      ( FLY-3PPL-VERIFY ?auto_28590 ?auto_28591 ?auto_28592 ?auto_28589 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28611 - PERSON
      ?auto_28612 - PERSON
      ?auto_28613 - PERSON
      ?auto_28610 - CITY
    )
    :vars
    (
      ?auto_28618 - FLEVEL
      ?auto_28617 - FLEVEL
      ?auto_28615 - CITY
      ?auto_28616 - CITY
      ?auto_28619 - CITY
      ?auto_28614 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28618 ?auto_28617 ) ( not ( = ?auto_28610 ?auto_28615 ) ) ( not ( = ?auto_28617 ?auto_28618 ) ) ( not ( = ?auto_28613 ?auto_28612 ) ) ( PERSON-AT ?auto_28612 ?auto_28615 ) ( not ( = ?auto_28613 ?auto_28611 ) ) ( not ( = ?auto_28612 ?auto_28611 ) ) ( not ( = ?auto_28610 ?auto_28616 ) ) ( not ( = ?auto_28615 ?auto_28616 ) ) ( PERSON-AT ?auto_28611 ?auto_28616 ) ( not ( = ?auto_28610 ?auto_28619 ) ) ( not ( = ?auto_28615 ?auto_28619 ) ) ( not ( = ?auto_28616 ?auto_28619 ) ) ( PERSON-AT ?auto_28613 ?auto_28619 ) ( AIRCRAFT-AT ?auto_28614 ?auto_28610 ) ( FUEL-LEVEL ?auto_28614 ?auto_28618 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28613 ?auto_28612 ?auto_28610 )
      ( FLY-3PPL-VERIFY ?auto_28611 ?auto_28612 ?auto_28613 ?auto_28610 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28654 - PERSON
      ?auto_28655 - PERSON
      ?auto_28656 - PERSON
      ?auto_28653 - CITY
    )
    :vars
    (
      ?auto_28661 - FLEVEL
      ?auto_28660 - FLEVEL
      ?auto_28658 - CITY
      ?auto_28659 - CITY
      ?auto_28662 - CITY
      ?auto_28657 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28661 ?auto_28660 ) ( not ( = ?auto_28653 ?auto_28658 ) ) ( not ( = ?auto_28660 ?auto_28661 ) ) ( not ( = ?auto_28655 ?auto_28654 ) ) ( PERSON-AT ?auto_28654 ?auto_28658 ) ( not ( = ?auto_28655 ?auto_28656 ) ) ( not ( = ?auto_28654 ?auto_28656 ) ) ( not ( = ?auto_28653 ?auto_28659 ) ) ( not ( = ?auto_28658 ?auto_28659 ) ) ( PERSON-AT ?auto_28656 ?auto_28659 ) ( not ( = ?auto_28653 ?auto_28662 ) ) ( not ( = ?auto_28658 ?auto_28662 ) ) ( not ( = ?auto_28659 ?auto_28662 ) ) ( PERSON-AT ?auto_28655 ?auto_28662 ) ( AIRCRAFT-AT ?auto_28657 ?auto_28653 ) ( FUEL-LEVEL ?auto_28657 ?auto_28661 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28655 ?auto_28654 ?auto_28653 )
      ( FLY-3PPL-VERIFY ?auto_28654 ?auto_28655 ?auto_28656 ?auto_28653 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_28675 - PERSON
      ?auto_28676 - PERSON
      ?auto_28677 - PERSON
      ?auto_28674 - CITY
    )
    :vars
    (
      ?auto_28682 - FLEVEL
      ?auto_28681 - FLEVEL
      ?auto_28679 - CITY
      ?auto_28680 - CITY
      ?auto_28683 - CITY
      ?auto_28678 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_28682 ?auto_28681 ) ( not ( = ?auto_28674 ?auto_28679 ) ) ( not ( = ?auto_28681 ?auto_28682 ) ) ( not ( = ?auto_28677 ?auto_28675 ) ) ( PERSON-AT ?auto_28675 ?auto_28679 ) ( not ( = ?auto_28677 ?auto_28676 ) ) ( not ( = ?auto_28675 ?auto_28676 ) ) ( not ( = ?auto_28674 ?auto_28680 ) ) ( not ( = ?auto_28679 ?auto_28680 ) ) ( PERSON-AT ?auto_28676 ?auto_28680 ) ( not ( = ?auto_28674 ?auto_28683 ) ) ( not ( = ?auto_28679 ?auto_28683 ) ) ( not ( = ?auto_28680 ?auto_28683 ) ) ( PERSON-AT ?auto_28677 ?auto_28683 ) ( AIRCRAFT-AT ?auto_28678 ?auto_28674 ) ( FUEL-LEVEL ?auto_28678 ?auto_28682 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_28677 ?auto_28675 ?auto_28674 )
      ( FLY-3PPL-VERIFY ?auto_28675 ?auto_28676 ?auto_28677 ?auto_28674 ) )
  )

)

