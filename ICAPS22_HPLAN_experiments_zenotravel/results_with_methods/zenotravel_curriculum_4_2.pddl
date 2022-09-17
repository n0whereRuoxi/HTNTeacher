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
      ?auto_8362 - PERSON
      ?auto_8361 - CITY
    )
    :vars
    (
      ?auto_8365 - FLEVEL
      ?auto_8364 - FLEVEL
      ?auto_8366 - CITY
      ?auto_8363 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8365 ?auto_8364 ) ( PERSON-AT ?auto_8362 ?auto_8366 ) ( AIRCRAFT-AT ?auto_8363 ?auto_8361 ) ( FUEL-LEVEL ?auto_8363 ?auto_8365 ) ( not ( = ?auto_8361 ?auto_8366 ) ) ( not ( = ?auto_8365 ?auto_8364 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_8363 ?auto_8361 ?auto_8365 ?auto_8364 )
      ( !FLY ?auto_8363 ?auto_8361 ?auto_8366 ?auto_8364 ?auto_8365 )
      ( !REFUEL ?auto_8363 ?auto_8366 ?auto_8365 ?auto_8364 )
      ( !BOARD ?auto_8362 ?auto_8363 ?auto_8366 )
      ( !FLY ?auto_8363 ?auto_8366 ?auto_8361 ?auto_8364 ?auto_8365 )
      ( !DEBARK ?auto_8362 ?auto_8363 ?auto_8361 )
      ( FLY-1PPL-VERIFY ?auto_8362 ?auto_8361 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8370 - PERSON
      ?auto_8369 - CITY
    )
    :vars
    (
      ?auto_8373 - FLEVEL
      ?auto_8372 - FLEVEL
      ?auto_8374 - CITY
      ?auto_8371 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8373 ?auto_8372 ) ( PERSON-AT ?auto_8370 ?auto_8374 ) ( AIRCRAFT-AT ?auto_8371 ?auto_8369 ) ( FUEL-LEVEL ?auto_8371 ?auto_8373 ) ( not ( = ?auto_8369 ?auto_8374 ) ) ( not ( = ?auto_8373 ?auto_8372 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_8371 ?auto_8369 ?auto_8373 ?auto_8372 )
      ( !FLY ?auto_8371 ?auto_8369 ?auto_8374 ?auto_8372 ?auto_8373 )
      ( !REFUEL ?auto_8371 ?auto_8374 ?auto_8373 ?auto_8372 )
      ( !BOARD ?auto_8370 ?auto_8371 ?auto_8374 )
      ( !FLY ?auto_8371 ?auto_8374 ?auto_8369 ?auto_8372 ?auto_8373 )
      ( !DEBARK ?auto_8370 ?auto_8371 ?auto_8369 )
      ( FLY-1PPL-VERIFY ?auto_8370 ?auto_8369 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8385 - PERSON
      ?auto_8386 - PERSON
      ?auto_8384 - CITY
    )
    :vars
    (
      ?auto_8388 - FLEVEL
      ?auto_8387 - FLEVEL
      ?auto_8390 - CITY
      ?auto_8391 - CITY
      ?auto_8389 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8388 ?auto_8387 ) ( PERSON-AT ?auto_8386 ?auto_8390 ) ( not ( = ?auto_8384 ?auto_8390 ) ) ( not ( = ?auto_8388 ?auto_8387 ) ) ( PERSON-AT ?auto_8385 ?auto_8391 ) ( AIRCRAFT-AT ?auto_8389 ?auto_8384 ) ( FUEL-LEVEL ?auto_8389 ?auto_8388 ) ( not ( = ?auto_8384 ?auto_8391 ) ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( not ( = ?auto_8390 ?auto_8391 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8385 ?auto_8384 )
      ( FLY-1PPL ?auto_8386 ?auto_8384 )
      ( FLY-2PPL-VERIFY ?auto_8385 ?auto_8386 ?auto_8384 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8393 - PERSON
      ?auto_8394 - PERSON
      ?auto_8392 - CITY
    )
    :vars
    (
      ?auto_8397 - FLEVEL
      ?auto_8398 - FLEVEL
      ?auto_8396 - CITY
      ?auto_8395 - CITY
      ?auto_8399 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8397 ?auto_8398 ) ( PERSON-AT ?auto_8393 ?auto_8396 ) ( not ( = ?auto_8392 ?auto_8396 ) ) ( not ( = ?auto_8397 ?auto_8398 ) ) ( PERSON-AT ?auto_8394 ?auto_8395 ) ( AIRCRAFT-AT ?auto_8399 ?auto_8392 ) ( FUEL-LEVEL ?auto_8399 ?auto_8397 ) ( not ( = ?auto_8392 ?auto_8395 ) ) ( not ( = ?auto_8394 ?auto_8393 ) ) ( not ( = ?auto_8396 ?auto_8395 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8394 ?auto_8393 ?auto_8392 )
      ( FLY-2PPL-VERIFY ?auto_8393 ?auto_8394 ?auto_8392 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8412 - PERSON
      ?auto_8411 - CITY
    )
    :vars
    (
      ?auto_8415 - FLEVEL
      ?auto_8414 - FLEVEL
      ?auto_8416 - CITY
      ?auto_8413 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8415 ?auto_8414 ) ( PERSON-AT ?auto_8412 ?auto_8416 ) ( AIRCRAFT-AT ?auto_8413 ?auto_8411 ) ( FUEL-LEVEL ?auto_8413 ?auto_8415 ) ( not ( = ?auto_8411 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8414 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_8413 ?auto_8411 ?auto_8415 ?auto_8414 )
      ( !FLY ?auto_8413 ?auto_8411 ?auto_8416 ?auto_8414 ?auto_8415 )
      ( !REFUEL ?auto_8413 ?auto_8416 ?auto_8415 ?auto_8414 )
      ( !BOARD ?auto_8412 ?auto_8413 ?auto_8416 )
      ( !FLY ?auto_8413 ?auto_8416 ?auto_8411 ?auto_8414 ?auto_8415 )
      ( !DEBARK ?auto_8412 ?auto_8413 ?auto_8411 )
      ( FLY-1PPL-VERIFY ?auto_8412 ?auto_8411 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8504 - PERSON
      ?auto_8505 - PERSON
      ?auto_8506 - PERSON
      ?auto_8503 - CITY
    )
    :vars
    (
      ?auto_8507 - FLEVEL
      ?auto_8508 - FLEVEL
      ?auto_8509 - CITY
      ?auto_8511 - CITY
      ?auto_8510 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8507 ?auto_8508 ) ( PERSON-AT ?auto_8506 ?auto_8509 ) ( not ( = ?auto_8503 ?auto_8509 ) ) ( not ( = ?auto_8507 ?auto_8508 ) ) ( PERSON-AT ?auto_8505 ?auto_8509 ) ( PERSON-AT ?auto_8504 ?auto_8511 ) ( AIRCRAFT-AT ?auto_8510 ?auto_8503 ) ( FUEL-LEVEL ?auto_8510 ?auto_8507 ) ( not ( = ?auto_8503 ?auto_8511 ) ) ( not ( = ?auto_8504 ?auto_8505 ) ) ( not ( = ?auto_8509 ?auto_8511 ) ) ( not ( = ?auto_8504 ?auto_8506 ) ) ( not ( = ?auto_8505 ?auto_8506 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8505 ?auto_8504 ?auto_8503 )
      ( FLY-1PPL ?auto_8506 ?auto_8503 )
      ( FLY-3PPL-VERIFY ?auto_8504 ?auto_8505 ?auto_8506 ?auto_8503 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8523 - PERSON
      ?auto_8524 - PERSON
      ?auto_8525 - PERSON
      ?auto_8522 - CITY
    )
    :vars
    (
      ?auto_8529 - FLEVEL
      ?auto_8527 - FLEVEL
      ?auto_8526 - CITY
      ?auto_8528 - CITY
      ?auto_8530 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8529 ?auto_8527 ) ( PERSON-AT ?auto_8524 ?auto_8526 ) ( not ( = ?auto_8522 ?auto_8526 ) ) ( not ( = ?auto_8529 ?auto_8527 ) ) ( PERSON-AT ?auto_8525 ?auto_8526 ) ( PERSON-AT ?auto_8523 ?auto_8528 ) ( AIRCRAFT-AT ?auto_8530 ?auto_8522 ) ( FUEL-LEVEL ?auto_8530 ?auto_8529 ) ( not ( = ?auto_8522 ?auto_8528 ) ) ( not ( = ?auto_8523 ?auto_8525 ) ) ( not ( = ?auto_8526 ?auto_8528 ) ) ( not ( = ?auto_8523 ?auto_8524 ) ) ( not ( = ?auto_8525 ?auto_8524 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8523 ?auto_8525 ?auto_8524 ?auto_8522 )
      ( FLY-3PPL-VERIFY ?auto_8523 ?auto_8524 ?auto_8525 ?auto_8522 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8542 - PERSON
      ?auto_8543 - PERSON
      ?auto_8544 - PERSON
      ?auto_8541 - CITY
    )
    :vars
    (
      ?auto_8546 - FLEVEL
      ?auto_8549 - FLEVEL
      ?auto_8548 - CITY
      ?auto_8545 - CITY
      ?auto_8547 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8546 ?auto_8549 ) ( PERSON-AT ?auto_8544 ?auto_8548 ) ( not ( = ?auto_8541 ?auto_8548 ) ) ( not ( = ?auto_8546 ?auto_8549 ) ) ( PERSON-AT ?auto_8542 ?auto_8548 ) ( PERSON-AT ?auto_8543 ?auto_8545 ) ( AIRCRAFT-AT ?auto_8547 ?auto_8541 ) ( FUEL-LEVEL ?auto_8547 ?auto_8546 ) ( not ( = ?auto_8541 ?auto_8545 ) ) ( not ( = ?auto_8543 ?auto_8542 ) ) ( not ( = ?auto_8548 ?auto_8545 ) ) ( not ( = ?auto_8543 ?auto_8544 ) ) ( not ( = ?auto_8542 ?auto_8544 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8543 ?auto_8544 ?auto_8542 ?auto_8541 )
      ( FLY-3PPL-VERIFY ?auto_8542 ?auto_8543 ?auto_8544 ?auto_8541 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8561 - PERSON
      ?auto_8562 - PERSON
      ?auto_8563 - PERSON
      ?auto_8560 - CITY
    )
    :vars
    (
      ?auto_8565 - FLEVEL
      ?auto_8568 - FLEVEL
      ?auto_8567 - CITY
      ?auto_8564 - CITY
      ?auto_8566 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8565 ?auto_8568 ) ( PERSON-AT ?auto_8562 ?auto_8567 ) ( not ( = ?auto_8560 ?auto_8567 ) ) ( not ( = ?auto_8565 ?auto_8568 ) ) ( PERSON-AT ?auto_8561 ?auto_8567 ) ( PERSON-AT ?auto_8563 ?auto_8564 ) ( AIRCRAFT-AT ?auto_8566 ?auto_8560 ) ( FUEL-LEVEL ?auto_8566 ?auto_8565 ) ( not ( = ?auto_8560 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8561 ) ) ( not ( = ?auto_8567 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8562 ) ) ( not ( = ?auto_8561 ?auto_8562 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8563 ?auto_8562 ?auto_8561 ?auto_8560 )
      ( FLY-3PPL-VERIFY ?auto_8561 ?auto_8562 ?auto_8563 ?auto_8560 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8600 - PERSON
      ?auto_8601 - PERSON
      ?auto_8602 - PERSON
      ?auto_8599 - CITY
    )
    :vars
    (
      ?auto_8604 - FLEVEL
      ?auto_8607 - FLEVEL
      ?auto_8606 - CITY
      ?auto_8603 - CITY
      ?auto_8605 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8604 ?auto_8607 ) ( PERSON-AT ?auto_8600 ?auto_8606 ) ( not ( = ?auto_8599 ?auto_8606 ) ) ( not ( = ?auto_8604 ?auto_8607 ) ) ( PERSON-AT ?auto_8602 ?auto_8606 ) ( PERSON-AT ?auto_8601 ?auto_8603 ) ( AIRCRAFT-AT ?auto_8605 ?auto_8599 ) ( FUEL-LEVEL ?auto_8605 ?auto_8604 ) ( not ( = ?auto_8599 ?auto_8603 ) ) ( not ( = ?auto_8601 ?auto_8602 ) ) ( not ( = ?auto_8606 ?auto_8603 ) ) ( not ( = ?auto_8601 ?auto_8600 ) ) ( not ( = ?auto_8602 ?auto_8600 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8601 ?auto_8600 ?auto_8602 ?auto_8599 )
      ( FLY-3PPL-VERIFY ?auto_8600 ?auto_8601 ?auto_8602 ?auto_8599 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8619 - PERSON
      ?auto_8620 - PERSON
      ?auto_8621 - PERSON
      ?auto_8618 - CITY
    )
    :vars
    (
      ?auto_8623 - FLEVEL
      ?auto_8626 - FLEVEL
      ?auto_8625 - CITY
      ?auto_8622 - CITY
      ?auto_8624 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8623 ?auto_8626 ) ( PERSON-AT ?auto_8619 ?auto_8625 ) ( not ( = ?auto_8618 ?auto_8625 ) ) ( not ( = ?auto_8623 ?auto_8626 ) ) ( PERSON-AT ?auto_8620 ?auto_8625 ) ( PERSON-AT ?auto_8621 ?auto_8622 ) ( AIRCRAFT-AT ?auto_8624 ?auto_8618 ) ( FUEL-LEVEL ?auto_8624 ?auto_8623 ) ( not ( = ?auto_8618 ?auto_8622 ) ) ( not ( = ?auto_8621 ?auto_8620 ) ) ( not ( = ?auto_8625 ?auto_8622 ) ) ( not ( = ?auto_8621 ?auto_8619 ) ) ( not ( = ?auto_8620 ?auto_8619 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8621 ?auto_8619 ?auto_8620 ?auto_8618 )
      ( FLY-3PPL-VERIFY ?auto_8619 ?auto_8620 ?auto_8621 ?auto_8618 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8681 - PERSON
      ?auto_8680 - CITY
    )
    :vars
    (
      ?auto_8684 - FLEVEL
      ?auto_8683 - FLEVEL
      ?auto_8685 - CITY
      ?auto_8682 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8684 ?auto_8683 ) ( PERSON-AT ?auto_8681 ?auto_8685 ) ( AIRCRAFT-AT ?auto_8682 ?auto_8680 ) ( FUEL-LEVEL ?auto_8682 ?auto_8684 ) ( not ( = ?auto_8680 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8683 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_8682 ?auto_8680 ?auto_8684 ?auto_8683 )
      ( !FLY ?auto_8682 ?auto_8680 ?auto_8685 ?auto_8683 ?auto_8684 )
      ( !REFUEL ?auto_8682 ?auto_8685 ?auto_8684 ?auto_8683 )
      ( !BOARD ?auto_8681 ?auto_8682 ?auto_8685 )
      ( !FLY ?auto_8682 ?auto_8685 ?auto_8680 ?auto_8683 ?auto_8684 )
      ( !DEBARK ?auto_8681 ?auto_8682 ?auto_8680 )
      ( FLY-1PPL-VERIFY ?auto_8681 ?auto_8680 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9673 - PERSON
      ?auto_9674 - PERSON
      ?auto_9675 - PERSON
      ?auto_9676 - PERSON
      ?auto_9672 - CITY
    )
    :vars
    (
      ?auto_9679 - FLEVEL
      ?auto_9678 - FLEVEL
      ?auto_9680 - CITY
      ?auto_9682 - CITY
      ?auto_9681 - CITY
      ?auto_9677 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9679 ?auto_9678 ) ( PERSON-AT ?auto_9676 ?auto_9680 ) ( not ( = ?auto_9672 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9678 ) ) ( PERSON-AT ?auto_9675 ?auto_9682 ) ( not ( = ?auto_9672 ?auto_9682 ) ) ( PERSON-AT ?auto_9674 ?auto_9682 ) ( PERSON-AT ?auto_9673 ?auto_9681 ) ( AIRCRAFT-AT ?auto_9677 ?auto_9672 ) ( FUEL-LEVEL ?auto_9677 ?auto_9679 ) ( not ( = ?auto_9672 ?auto_9681 ) ) ( not ( = ?auto_9673 ?auto_9674 ) ) ( not ( = ?auto_9682 ?auto_9681 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( not ( = ?auto_9673 ?auto_9676 ) ) ( not ( = ?auto_9674 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9676 ) ) ( not ( = ?auto_9680 ?auto_9682 ) ) ( not ( = ?auto_9680 ?auto_9681 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_9673 ?auto_9675 ?auto_9674 ?auto_9672 )
      ( FLY-1PPL ?auto_9676 ?auto_9672 )
      ( FLY-4PPL-VERIFY ?auto_9673 ?auto_9674 ?auto_9675 ?auto_9676 ?auto_9672 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9708 - PERSON
      ?auto_9709 - PERSON
      ?auto_9710 - PERSON
      ?auto_9711 - PERSON
      ?auto_9707 - CITY
    )
    :vars
    (
      ?auto_9713 - FLEVEL
      ?auto_9712 - FLEVEL
      ?auto_9716 - CITY
      ?auto_9715 - CITY
      ?auto_9717 - CITY
      ?auto_9714 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9713 ?auto_9712 ) ( PERSON-AT ?auto_9710 ?auto_9716 ) ( not ( = ?auto_9707 ?auto_9716 ) ) ( not ( = ?auto_9713 ?auto_9712 ) ) ( PERSON-AT ?auto_9711 ?auto_9715 ) ( not ( = ?auto_9707 ?auto_9715 ) ) ( PERSON-AT ?auto_9709 ?auto_9715 ) ( PERSON-AT ?auto_9708 ?auto_9717 ) ( AIRCRAFT-AT ?auto_9714 ?auto_9707 ) ( FUEL-LEVEL ?auto_9714 ?auto_9713 ) ( not ( = ?auto_9707 ?auto_9717 ) ) ( not ( = ?auto_9708 ?auto_9709 ) ) ( not ( = ?auto_9715 ?auto_9717 ) ) ( not ( = ?auto_9708 ?auto_9711 ) ) ( not ( = ?auto_9709 ?auto_9711 ) ) ( not ( = ?auto_9708 ?auto_9710 ) ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( not ( = ?auto_9711 ?auto_9710 ) ) ( not ( = ?auto_9716 ?auto_9715 ) ) ( not ( = ?auto_9716 ?auto_9717 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9708 ?auto_9709 ?auto_9711 ?auto_9710 ?auto_9707 )
      ( FLY-4PPL-VERIFY ?auto_9708 ?auto_9709 ?auto_9710 ?auto_9711 ?auto_9707 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9743 - PERSON
      ?auto_9744 - PERSON
      ?auto_9745 - PERSON
      ?auto_9746 - PERSON
      ?auto_9742 - CITY
    )
    :vars
    (
      ?auto_9749 - FLEVEL
      ?auto_9747 - FLEVEL
      ?auto_9752 - CITY
      ?auto_9751 - CITY
      ?auto_9748 - CITY
      ?auto_9750 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9749 ?auto_9747 ) ( PERSON-AT ?auto_9746 ?auto_9752 ) ( not ( = ?auto_9742 ?auto_9752 ) ) ( not ( = ?auto_9749 ?auto_9747 ) ) ( PERSON-AT ?auto_9744 ?auto_9751 ) ( not ( = ?auto_9742 ?auto_9751 ) ) ( PERSON-AT ?auto_9745 ?auto_9751 ) ( PERSON-AT ?auto_9743 ?auto_9748 ) ( AIRCRAFT-AT ?auto_9750 ?auto_9742 ) ( FUEL-LEVEL ?auto_9750 ?auto_9749 ) ( not ( = ?auto_9742 ?auto_9748 ) ) ( not ( = ?auto_9743 ?auto_9745 ) ) ( not ( = ?auto_9751 ?auto_9748 ) ) ( not ( = ?auto_9743 ?auto_9744 ) ) ( not ( = ?auto_9745 ?auto_9744 ) ) ( not ( = ?auto_9743 ?auto_9746 ) ) ( not ( = ?auto_9745 ?auto_9746 ) ) ( not ( = ?auto_9744 ?auto_9746 ) ) ( not ( = ?auto_9752 ?auto_9751 ) ) ( not ( = ?auto_9752 ?auto_9748 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9743 ?auto_9745 ?auto_9746 ?auto_9744 ?auto_9742 )
      ( FLY-4PPL-VERIFY ?auto_9743 ?auto_9744 ?auto_9745 ?auto_9746 ?auto_9742 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9778 - PERSON
      ?auto_9779 - PERSON
      ?auto_9780 - PERSON
      ?auto_9781 - PERSON
      ?auto_9777 - CITY
    )
    :vars
    (
      ?auto_9784 - FLEVEL
      ?auto_9782 - FLEVEL
      ?auto_9787 - CITY
      ?auto_9786 - CITY
      ?auto_9783 - CITY
      ?auto_9785 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9784 ?auto_9782 ) ( PERSON-AT ?auto_9780 ?auto_9787 ) ( not ( = ?auto_9777 ?auto_9787 ) ) ( not ( = ?auto_9784 ?auto_9782 ) ) ( PERSON-AT ?auto_9779 ?auto_9786 ) ( not ( = ?auto_9777 ?auto_9786 ) ) ( PERSON-AT ?auto_9781 ?auto_9786 ) ( PERSON-AT ?auto_9778 ?auto_9783 ) ( AIRCRAFT-AT ?auto_9785 ?auto_9777 ) ( FUEL-LEVEL ?auto_9785 ?auto_9784 ) ( not ( = ?auto_9777 ?auto_9783 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) ( not ( = ?auto_9786 ?auto_9783 ) ) ( not ( = ?auto_9778 ?auto_9779 ) ) ( not ( = ?auto_9781 ?auto_9779 ) ) ( not ( = ?auto_9778 ?auto_9780 ) ) ( not ( = ?auto_9781 ?auto_9780 ) ) ( not ( = ?auto_9779 ?auto_9780 ) ) ( not ( = ?auto_9787 ?auto_9786 ) ) ( not ( = ?auto_9787 ?auto_9783 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9778 ?auto_9781 ?auto_9780 ?auto_9779 ?auto_9777 )
      ( FLY-4PPL-VERIFY ?auto_9778 ?auto_9779 ?auto_9780 ?auto_9781 ?auto_9777 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9887 - PERSON
      ?auto_9888 - PERSON
      ?auto_9889 - PERSON
      ?auto_9890 - PERSON
      ?auto_9886 - CITY
    )
    :vars
    (
      ?auto_9893 - FLEVEL
      ?auto_9891 - FLEVEL
      ?auto_9896 - CITY
      ?auto_9895 - CITY
      ?auto_9892 - CITY
      ?auto_9894 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9893 ?auto_9891 ) ( PERSON-AT ?auto_9888 ?auto_9896 ) ( not ( = ?auto_9886 ?auto_9896 ) ) ( not ( = ?auto_9893 ?auto_9891 ) ) ( PERSON-AT ?auto_9890 ?auto_9895 ) ( not ( = ?auto_9886 ?auto_9895 ) ) ( PERSON-AT ?auto_9889 ?auto_9895 ) ( PERSON-AT ?auto_9887 ?auto_9892 ) ( AIRCRAFT-AT ?auto_9894 ?auto_9886 ) ( FUEL-LEVEL ?auto_9894 ?auto_9893 ) ( not ( = ?auto_9886 ?auto_9892 ) ) ( not ( = ?auto_9887 ?auto_9889 ) ) ( not ( = ?auto_9895 ?auto_9892 ) ) ( not ( = ?auto_9887 ?auto_9890 ) ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( not ( = ?auto_9887 ?auto_9888 ) ) ( not ( = ?auto_9889 ?auto_9888 ) ) ( not ( = ?auto_9890 ?auto_9888 ) ) ( not ( = ?auto_9896 ?auto_9895 ) ) ( not ( = ?auto_9896 ?auto_9892 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9887 ?auto_9889 ?auto_9888 ?auto_9890 ?auto_9886 )
      ( FLY-4PPL-VERIFY ?auto_9887 ?auto_9888 ?auto_9889 ?auto_9890 ?auto_9886 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9922 - PERSON
      ?auto_9923 - PERSON
      ?auto_9924 - PERSON
      ?auto_9925 - PERSON
      ?auto_9921 - CITY
    )
    :vars
    (
      ?auto_9928 - FLEVEL
      ?auto_9926 - FLEVEL
      ?auto_9931 - CITY
      ?auto_9930 - CITY
      ?auto_9927 - CITY
      ?auto_9929 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9928 ?auto_9926 ) ( PERSON-AT ?auto_9923 ?auto_9931 ) ( not ( = ?auto_9921 ?auto_9931 ) ) ( not ( = ?auto_9928 ?auto_9926 ) ) ( PERSON-AT ?auto_9924 ?auto_9930 ) ( not ( = ?auto_9921 ?auto_9930 ) ) ( PERSON-AT ?auto_9925 ?auto_9930 ) ( PERSON-AT ?auto_9922 ?auto_9927 ) ( AIRCRAFT-AT ?auto_9929 ?auto_9921 ) ( FUEL-LEVEL ?auto_9929 ?auto_9928 ) ( not ( = ?auto_9921 ?auto_9927 ) ) ( not ( = ?auto_9922 ?auto_9925 ) ) ( not ( = ?auto_9930 ?auto_9927 ) ) ( not ( = ?auto_9922 ?auto_9924 ) ) ( not ( = ?auto_9925 ?auto_9924 ) ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( not ( = ?auto_9925 ?auto_9923 ) ) ( not ( = ?auto_9924 ?auto_9923 ) ) ( not ( = ?auto_9931 ?auto_9930 ) ) ( not ( = ?auto_9931 ?auto_9927 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9922 ?auto_9925 ?auto_9923 ?auto_9924 ?auto_9921 )
      ( FLY-4PPL-VERIFY ?auto_9922 ?auto_9923 ?auto_9924 ?auto_9925 ?auto_9921 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10031 - PERSON
      ?auto_10032 - PERSON
      ?auto_10033 - PERSON
      ?auto_10034 - PERSON
      ?auto_10030 - CITY
    )
    :vars
    (
      ?auto_10037 - FLEVEL
      ?auto_10035 - FLEVEL
      ?auto_10040 - CITY
      ?auto_10039 - CITY
      ?auto_10036 - CITY
      ?auto_10038 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10037 ?auto_10035 ) ( PERSON-AT ?auto_10034 ?auto_10040 ) ( not ( = ?auto_10030 ?auto_10040 ) ) ( not ( = ?auto_10037 ?auto_10035 ) ) ( PERSON-AT ?auto_10033 ?auto_10039 ) ( not ( = ?auto_10030 ?auto_10039 ) ) ( PERSON-AT ?auto_10031 ?auto_10039 ) ( PERSON-AT ?auto_10032 ?auto_10036 ) ( AIRCRAFT-AT ?auto_10038 ?auto_10030 ) ( FUEL-LEVEL ?auto_10038 ?auto_10037 ) ( not ( = ?auto_10030 ?auto_10036 ) ) ( not ( = ?auto_10032 ?auto_10031 ) ) ( not ( = ?auto_10039 ?auto_10036 ) ) ( not ( = ?auto_10032 ?auto_10033 ) ) ( not ( = ?auto_10031 ?auto_10033 ) ) ( not ( = ?auto_10032 ?auto_10034 ) ) ( not ( = ?auto_10031 ?auto_10034 ) ) ( not ( = ?auto_10033 ?auto_10034 ) ) ( not ( = ?auto_10040 ?auto_10039 ) ) ( not ( = ?auto_10040 ?auto_10036 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10032 ?auto_10031 ?auto_10034 ?auto_10033 ?auto_10030 )
      ( FLY-4PPL-VERIFY ?auto_10031 ?auto_10032 ?auto_10033 ?auto_10034 ?auto_10030 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10066 - PERSON
      ?auto_10067 - PERSON
      ?auto_10068 - PERSON
      ?auto_10069 - PERSON
      ?auto_10065 - CITY
    )
    :vars
    (
      ?auto_10072 - FLEVEL
      ?auto_10070 - FLEVEL
      ?auto_10075 - CITY
      ?auto_10074 - CITY
      ?auto_10071 - CITY
      ?auto_10073 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10072 ?auto_10070 ) ( PERSON-AT ?auto_10068 ?auto_10075 ) ( not ( = ?auto_10065 ?auto_10075 ) ) ( not ( = ?auto_10072 ?auto_10070 ) ) ( PERSON-AT ?auto_10069 ?auto_10074 ) ( not ( = ?auto_10065 ?auto_10074 ) ) ( PERSON-AT ?auto_10066 ?auto_10074 ) ( PERSON-AT ?auto_10067 ?auto_10071 ) ( AIRCRAFT-AT ?auto_10073 ?auto_10065 ) ( FUEL-LEVEL ?auto_10073 ?auto_10072 ) ( not ( = ?auto_10065 ?auto_10071 ) ) ( not ( = ?auto_10067 ?auto_10066 ) ) ( not ( = ?auto_10074 ?auto_10071 ) ) ( not ( = ?auto_10067 ?auto_10069 ) ) ( not ( = ?auto_10066 ?auto_10069 ) ) ( not ( = ?auto_10067 ?auto_10068 ) ) ( not ( = ?auto_10066 ?auto_10068 ) ) ( not ( = ?auto_10069 ?auto_10068 ) ) ( not ( = ?auto_10075 ?auto_10074 ) ) ( not ( = ?auto_10075 ?auto_10071 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10067 ?auto_10066 ?auto_10068 ?auto_10069 ?auto_10065 )
      ( FLY-4PPL-VERIFY ?auto_10066 ?auto_10067 ?auto_10068 ?auto_10069 ?auto_10065 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10176 - PERSON
      ?auto_10177 - PERSON
      ?auto_10178 - PERSON
      ?auto_10179 - PERSON
      ?auto_10175 - CITY
    )
    :vars
    (
      ?auto_10182 - FLEVEL
      ?auto_10180 - FLEVEL
      ?auto_10185 - CITY
      ?auto_10184 - CITY
      ?auto_10181 - CITY
      ?auto_10183 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10182 ?auto_10180 ) ( PERSON-AT ?auto_10179 ?auto_10185 ) ( not ( = ?auto_10175 ?auto_10185 ) ) ( not ( = ?auto_10182 ?auto_10180 ) ) ( PERSON-AT ?auto_10177 ?auto_10184 ) ( not ( = ?auto_10175 ?auto_10184 ) ) ( PERSON-AT ?auto_10176 ?auto_10184 ) ( PERSON-AT ?auto_10178 ?auto_10181 ) ( AIRCRAFT-AT ?auto_10183 ?auto_10175 ) ( FUEL-LEVEL ?auto_10183 ?auto_10182 ) ( not ( = ?auto_10175 ?auto_10181 ) ) ( not ( = ?auto_10178 ?auto_10176 ) ) ( not ( = ?auto_10184 ?auto_10181 ) ) ( not ( = ?auto_10178 ?auto_10177 ) ) ( not ( = ?auto_10176 ?auto_10177 ) ) ( not ( = ?auto_10178 ?auto_10179 ) ) ( not ( = ?auto_10176 ?auto_10179 ) ) ( not ( = ?auto_10177 ?auto_10179 ) ) ( not ( = ?auto_10185 ?auto_10184 ) ) ( not ( = ?auto_10185 ?auto_10181 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10178 ?auto_10176 ?auto_10179 ?auto_10177 ?auto_10175 )
      ( FLY-4PPL-VERIFY ?auto_10176 ?auto_10177 ?auto_10178 ?auto_10179 ?auto_10175 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10211 - PERSON
      ?auto_10212 - PERSON
      ?auto_10213 - PERSON
      ?auto_10214 - PERSON
      ?auto_10210 - CITY
    )
    :vars
    (
      ?auto_10217 - FLEVEL
      ?auto_10215 - FLEVEL
      ?auto_10220 - CITY
      ?auto_10219 - CITY
      ?auto_10216 - CITY
      ?auto_10218 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10217 ?auto_10215 ) ( PERSON-AT ?auto_10213 ?auto_10220 ) ( not ( = ?auto_10210 ?auto_10220 ) ) ( not ( = ?auto_10217 ?auto_10215 ) ) ( PERSON-AT ?auto_10212 ?auto_10219 ) ( not ( = ?auto_10210 ?auto_10219 ) ) ( PERSON-AT ?auto_10211 ?auto_10219 ) ( PERSON-AT ?auto_10214 ?auto_10216 ) ( AIRCRAFT-AT ?auto_10218 ?auto_10210 ) ( FUEL-LEVEL ?auto_10218 ?auto_10217 ) ( not ( = ?auto_10210 ?auto_10216 ) ) ( not ( = ?auto_10214 ?auto_10211 ) ) ( not ( = ?auto_10219 ?auto_10216 ) ) ( not ( = ?auto_10214 ?auto_10212 ) ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( not ( = ?auto_10214 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10213 ) ) ( not ( = ?auto_10212 ?auto_10213 ) ) ( not ( = ?auto_10220 ?auto_10219 ) ) ( not ( = ?auto_10220 ?auto_10216 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10214 ?auto_10211 ?auto_10213 ?auto_10212 ?auto_10210 )
      ( FLY-4PPL-VERIFY ?auto_10211 ?auto_10212 ?auto_10213 ?auto_10214 ?auto_10210 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10282 - PERSON
      ?auto_10283 - PERSON
      ?auto_10284 - PERSON
      ?auto_10285 - PERSON
      ?auto_10281 - CITY
    )
    :vars
    (
      ?auto_10288 - FLEVEL
      ?auto_10286 - FLEVEL
      ?auto_10291 - CITY
      ?auto_10290 - CITY
      ?auto_10287 - CITY
      ?auto_10289 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10288 ?auto_10286 ) ( PERSON-AT ?auto_10283 ?auto_10291 ) ( not ( = ?auto_10281 ?auto_10291 ) ) ( not ( = ?auto_10288 ?auto_10286 ) ) ( PERSON-AT ?auto_10285 ?auto_10290 ) ( not ( = ?auto_10281 ?auto_10290 ) ) ( PERSON-AT ?auto_10282 ?auto_10290 ) ( PERSON-AT ?auto_10284 ?auto_10287 ) ( AIRCRAFT-AT ?auto_10289 ?auto_10281 ) ( FUEL-LEVEL ?auto_10289 ?auto_10288 ) ( not ( = ?auto_10281 ?auto_10287 ) ) ( not ( = ?auto_10284 ?auto_10282 ) ) ( not ( = ?auto_10290 ?auto_10287 ) ) ( not ( = ?auto_10284 ?auto_10285 ) ) ( not ( = ?auto_10282 ?auto_10285 ) ) ( not ( = ?auto_10284 ?auto_10283 ) ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( not ( = ?auto_10291 ?auto_10290 ) ) ( not ( = ?auto_10291 ?auto_10287 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10284 ?auto_10282 ?auto_10283 ?auto_10285 ?auto_10281 )
      ( FLY-4PPL-VERIFY ?auto_10282 ?auto_10283 ?auto_10284 ?auto_10285 ?auto_10281 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10355 - PERSON
      ?auto_10356 - PERSON
      ?auto_10357 - PERSON
      ?auto_10358 - PERSON
      ?auto_10354 - CITY
    )
    :vars
    (
      ?auto_10361 - FLEVEL
      ?auto_10359 - FLEVEL
      ?auto_10364 - CITY
      ?auto_10363 - CITY
      ?auto_10360 - CITY
      ?auto_10362 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10361 ?auto_10359 ) ( PERSON-AT ?auto_10356 ?auto_10364 ) ( not ( = ?auto_10354 ?auto_10364 ) ) ( not ( = ?auto_10361 ?auto_10359 ) ) ( PERSON-AT ?auto_10357 ?auto_10363 ) ( not ( = ?auto_10354 ?auto_10363 ) ) ( PERSON-AT ?auto_10355 ?auto_10363 ) ( PERSON-AT ?auto_10358 ?auto_10360 ) ( AIRCRAFT-AT ?auto_10362 ?auto_10354 ) ( FUEL-LEVEL ?auto_10362 ?auto_10361 ) ( not ( = ?auto_10354 ?auto_10360 ) ) ( not ( = ?auto_10358 ?auto_10355 ) ) ( not ( = ?auto_10363 ?auto_10360 ) ) ( not ( = ?auto_10358 ?auto_10357 ) ) ( not ( = ?auto_10355 ?auto_10357 ) ) ( not ( = ?auto_10358 ?auto_10356 ) ) ( not ( = ?auto_10355 ?auto_10356 ) ) ( not ( = ?auto_10357 ?auto_10356 ) ) ( not ( = ?auto_10364 ?auto_10363 ) ) ( not ( = ?auto_10364 ?auto_10360 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10358 ?auto_10355 ?auto_10356 ?auto_10357 ?auto_10354 )
      ( FLY-4PPL-VERIFY ?auto_10355 ?auto_10356 ?auto_10357 ?auto_10358 ?auto_10354 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10464 - PERSON
      ?auto_10465 - PERSON
      ?auto_10466 - PERSON
      ?auto_10467 - PERSON
      ?auto_10463 - CITY
    )
    :vars
    (
      ?auto_10470 - FLEVEL
      ?auto_10468 - FLEVEL
      ?auto_10473 - CITY
      ?auto_10472 - CITY
      ?auto_10469 - CITY
      ?auto_10471 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10470 ?auto_10468 ) ( PERSON-AT ?auto_10467 ?auto_10473 ) ( not ( = ?auto_10463 ?auto_10473 ) ) ( not ( = ?auto_10470 ?auto_10468 ) ) ( PERSON-AT ?auto_10464 ?auto_10472 ) ( not ( = ?auto_10463 ?auto_10472 ) ) ( PERSON-AT ?auto_10466 ?auto_10472 ) ( PERSON-AT ?auto_10465 ?auto_10469 ) ( AIRCRAFT-AT ?auto_10471 ?auto_10463 ) ( FUEL-LEVEL ?auto_10471 ?auto_10470 ) ( not ( = ?auto_10463 ?auto_10469 ) ) ( not ( = ?auto_10465 ?auto_10466 ) ) ( not ( = ?auto_10472 ?auto_10469 ) ) ( not ( = ?auto_10465 ?auto_10464 ) ) ( not ( = ?auto_10466 ?auto_10464 ) ) ( not ( = ?auto_10465 ?auto_10467 ) ) ( not ( = ?auto_10466 ?auto_10467 ) ) ( not ( = ?auto_10464 ?auto_10467 ) ) ( not ( = ?auto_10473 ?auto_10472 ) ) ( not ( = ?auto_10473 ?auto_10469 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10465 ?auto_10466 ?auto_10467 ?auto_10464 ?auto_10463 )
      ( FLY-4PPL-VERIFY ?auto_10464 ?auto_10465 ?auto_10466 ?auto_10467 ?auto_10463 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10499 - PERSON
      ?auto_10500 - PERSON
      ?auto_10501 - PERSON
      ?auto_10502 - PERSON
      ?auto_10498 - CITY
    )
    :vars
    (
      ?auto_10505 - FLEVEL
      ?auto_10503 - FLEVEL
      ?auto_10508 - CITY
      ?auto_10507 - CITY
      ?auto_10504 - CITY
      ?auto_10506 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10505 ?auto_10503 ) ( PERSON-AT ?auto_10501 ?auto_10508 ) ( not ( = ?auto_10498 ?auto_10508 ) ) ( not ( = ?auto_10505 ?auto_10503 ) ) ( PERSON-AT ?auto_10499 ?auto_10507 ) ( not ( = ?auto_10498 ?auto_10507 ) ) ( PERSON-AT ?auto_10502 ?auto_10507 ) ( PERSON-AT ?auto_10500 ?auto_10504 ) ( AIRCRAFT-AT ?auto_10506 ?auto_10498 ) ( FUEL-LEVEL ?auto_10506 ?auto_10505 ) ( not ( = ?auto_10498 ?auto_10504 ) ) ( not ( = ?auto_10500 ?auto_10502 ) ) ( not ( = ?auto_10507 ?auto_10504 ) ) ( not ( = ?auto_10500 ?auto_10499 ) ) ( not ( = ?auto_10502 ?auto_10499 ) ) ( not ( = ?auto_10500 ?auto_10501 ) ) ( not ( = ?auto_10502 ?auto_10501 ) ) ( not ( = ?auto_10499 ?auto_10501 ) ) ( not ( = ?auto_10508 ?auto_10507 ) ) ( not ( = ?auto_10508 ?auto_10504 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10500 ?auto_10502 ?auto_10501 ?auto_10499 ?auto_10498 )
      ( FLY-4PPL-VERIFY ?auto_10499 ?auto_10500 ?auto_10501 ?auto_10502 ?auto_10498 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10534 - PERSON
      ?auto_10535 - PERSON
      ?auto_10536 - PERSON
      ?auto_10537 - PERSON
      ?auto_10533 - CITY
    )
    :vars
    (
      ?auto_10540 - FLEVEL
      ?auto_10538 - FLEVEL
      ?auto_10543 - CITY
      ?auto_10542 - CITY
      ?auto_10539 - CITY
      ?auto_10541 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10540 ?auto_10538 ) ( PERSON-AT ?auto_10537 ?auto_10543 ) ( not ( = ?auto_10533 ?auto_10543 ) ) ( not ( = ?auto_10540 ?auto_10538 ) ) ( PERSON-AT ?auto_10534 ?auto_10542 ) ( not ( = ?auto_10533 ?auto_10542 ) ) ( PERSON-AT ?auto_10535 ?auto_10542 ) ( PERSON-AT ?auto_10536 ?auto_10539 ) ( AIRCRAFT-AT ?auto_10541 ?auto_10533 ) ( FUEL-LEVEL ?auto_10541 ?auto_10540 ) ( not ( = ?auto_10533 ?auto_10539 ) ) ( not ( = ?auto_10536 ?auto_10535 ) ) ( not ( = ?auto_10542 ?auto_10539 ) ) ( not ( = ?auto_10536 ?auto_10534 ) ) ( not ( = ?auto_10535 ?auto_10534 ) ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10535 ?auto_10537 ) ) ( not ( = ?auto_10534 ?auto_10537 ) ) ( not ( = ?auto_10543 ?auto_10542 ) ) ( not ( = ?auto_10543 ?auto_10539 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10536 ?auto_10535 ?auto_10537 ?auto_10534 ?auto_10533 )
      ( FLY-4PPL-VERIFY ?auto_10534 ?auto_10535 ?auto_10536 ?auto_10537 ?auto_10533 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10569 - PERSON
      ?auto_10570 - PERSON
      ?auto_10571 - PERSON
      ?auto_10572 - PERSON
      ?auto_10568 - CITY
    )
    :vars
    (
      ?auto_10575 - FLEVEL
      ?auto_10573 - FLEVEL
      ?auto_10578 - CITY
      ?auto_10577 - CITY
      ?auto_10574 - CITY
      ?auto_10576 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10575 ?auto_10573 ) ( PERSON-AT ?auto_10571 ?auto_10578 ) ( not ( = ?auto_10568 ?auto_10578 ) ) ( not ( = ?auto_10575 ?auto_10573 ) ) ( PERSON-AT ?auto_10569 ?auto_10577 ) ( not ( = ?auto_10568 ?auto_10577 ) ) ( PERSON-AT ?auto_10570 ?auto_10577 ) ( PERSON-AT ?auto_10572 ?auto_10574 ) ( AIRCRAFT-AT ?auto_10576 ?auto_10568 ) ( FUEL-LEVEL ?auto_10576 ?auto_10575 ) ( not ( = ?auto_10568 ?auto_10574 ) ) ( not ( = ?auto_10572 ?auto_10570 ) ) ( not ( = ?auto_10577 ?auto_10574 ) ) ( not ( = ?auto_10572 ?auto_10569 ) ) ( not ( = ?auto_10570 ?auto_10569 ) ) ( not ( = ?auto_10572 ?auto_10571 ) ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10569 ?auto_10571 ) ) ( not ( = ?auto_10578 ?auto_10577 ) ) ( not ( = ?auto_10578 ?auto_10574 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10572 ?auto_10570 ?auto_10571 ?auto_10569 ?auto_10568 )
      ( FLY-4PPL-VERIFY ?auto_10569 ?auto_10570 ?auto_10571 ?auto_10572 ?auto_10568 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10715 - PERSON
      ?auto_10716 - PERSON
      ?auto_10717 - PERSON
      ?auto_10718 - PERSON
      ?auto_10714 - CITY
    )
    :vars
    (
      ?auto_10721 - FLEVEL
      ?auto_10719 - FLEVEL
      ?auto_10724 - CITY
      ?auto_10723 - CITY
      ?auto_10720 - CITY
      ?auto_10722 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10721 ?auto_10719 ) ( PERSON-AT ?auto_10716 ?auto_10724 ) ( not ( = ?auto_10714 ?auto_10724 ) ) ( not ( = ?auto_10721 ?auto_10719 ) ) ( PERSON-AT ?auto_10715 ?auto_10723 ) ( not ( = ?auto_10714 ?auto_10723 ) ) ( PERSON-AT ?auto_10718 ?auto_10723 ) ( PERSON-AT ?auto_10717 ?auto_10720 ) ( AIRCRAFT-AT ?auto_10722 ?auto_10714 ) ( FUEL-LEVEL ?auto_10722 ?auto_10721 ) ( not ( = ?auto_10714 ?auto_10720 ) ) ( not ( = ?auto_10717 ?auto_10718 ) ) ( not ( = ?auto_10723 ?auto_10720 ) ) ( not ( = ?auto_10717 ?auto_10715 ) ) ( not ( = ?auto_10718 ?auto_10715 ) ) ( not ( = ?auto_10717 ?auto_10716 ) ) ( not ( = ?auto_10718 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10724 ?auto_10723 ) ) ( not ( = ?auto_10724 ?auto_10720 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10717 ?auto_10718 ?auto_10716 ?auto_10715 ?auto_10714 )
      ( FLY-4PPL-VERIFY ?auto_10715 ?auto_10716 ?auto_10717 ?auto_10718 ?auto_10714 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10750 - PERSON
      ?auto_10751 - PERSON
      ?auto_10752 - PERSON
      ?auto_10753 - PERSON
      ?auto_10749 - CITY
    )
    :vars
    (
      ?auto_10756 - FLEVEL
      ?auto_10754 - FLEVEL
      ?auto_10759 - CITY
      ?auto_10758 - CITY
      ?auto_10755 - CITY
      ?auto_10757 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10756 ?auto_10754 ) ( PERSON-AT ?auto_10751 ?auto_10759 ) ( not ( = ?auto_10749 ?auto_10759 ) ) ( not ( = ?auto_10756 ?auto_10754 ) ) ( PERSON-AT ?auto_10750 ?auto_10758 ) ( not ( = ?auto_10749 ?auto_10758 ) ) ( PERSON-AT ?auto_10752 ?auto_10758 ) ( PERSON-AT ?auto_10753 ?auto_10755 ) ( AIRCRAFT-AT ?auto_10757 ?auto_10749 ) ( FUEL-LEVEL ?auto_10757 ?auto_10756 ) ( not ( = ?auto_10749 ?auto_10755 ) ) ( not ( = ?auto_10753 ?auto_10752 ) ) ( not ( = ?auto_10758 ?auto_10755 ) ) ( not ( = ?auto_10753 ?auto_10750 ) ) ( not ( = ?auto_10752 ?auto_10750 ) ) ( not ( = ?auto_10753 ?auto_10751 ) ) ( not ( = ?auto_10752 ?auto_10751 ) ) ( not ( = ?auto_10750 ?auto_10751 ) ) ( not ( = ?auto_10759 ?auto_10758 ) ) ( not ( = ?auto_10759 ?auto_10755 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10753 ?auto_10752 ?auto_10751 ?auto_10750 ?auto_10749 )
      ( FLY-4PPL-VERIFY ?auto_10750 ?auto_10751 ?auto_10752 ?auto_10753 ?auto_10749 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_10971 - PERSON
      ?auto_10972 - PERSON
      ?auto_10973 - PERSON
      ?auto_10974 - PERSON
      ?auto_10970 - CITY
    )
    :vars
    (
      ?auto_10977 - FLEVEL
      ?auto_10975 - FLEVEL
      ?auto_10980 - CITY
      ?auto_10979 - CITY
      ?auto_10976 - CITY
      ?auto_10978 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10977 ?auto_10975 ) ( PERSON-AT ?auto_10971 ?auto_10980 ) ( not ( = ?auto_10970 ?auto_10980 ) ) ( not ( = ?auto_10977 ?auto_10975 ) ) ( PERSON-AT ?auto_10974 ?auto_10979 ) ( not ( = ?auto_10970 ?auto_10979 ) ) ( PERSON-AT ?auto_10973 ?auto_10979 ) ( PERSON-AT ?auto_10972 ?auto_10976 ) ( AIRCRAFT-AT ?auto_10978 ?auto_10970 ) ( FUEL-LEVEL ?auto_10978 ?auto_10977 ) ( not ( = ?auto_10970 ?auto_10976 ) ) ( not ( = ?auto_10972 ?auto_10973 ) ) ( not ( = ?auto_10979 ?auto_10976 ) ) ( not ( = ?auto_10972 ?auto_10974 ) ) ( not ( = ?auto_10973 ?auto_10974 ) ) ( not ( = ?auto_10972 ?auto_10971 ) ) ( not ( = ?auto_10973 ?auto_10971 ) ) ( not ( = ?auto_10974 ?auto_10971 ) ) ( not ( = ?auto_10980 ?auto_10979 ) ) ( not ( = ?auto_10980 ?auto_10976 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_10972 ?auto_10973 ?auto_10971 ?auto_10974 ?auto_10970 )
      ( FLY-4PPL-VERIFY ?auto_10971 ?auto_10972 ?auto_10973 ?auto_10974 ?auto_10970 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_11006 - PERSON
      ?auto_11007 - PERSON
      ?auto_11008 - PERSON
      ?auto_11009 - PERSON
      ?auto_11005 - CITY
    )
    :vars
    (
      ?auto_11012 - FLEVEL
      ?auto_11010 - FLEVEL
      ?auto_11015 - CITY
      ?auto_11014 - CITY
      ?auto_11011 - CITY
      ?auto_11013 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11012 ?auto_11010 ) ( PERSON-AT ?auto_11006 ?auto_11015 ) ( not ( = ?auto_11005 ?auto_11015 ) ) ( not ( = ?auto_11012 ?auto_11010 ) ) ( PERSON-AT ?auto_11008 ?auto_11014 ) ( not ( = ?auto_11005 ?auto_11014 ) ) ( PERSON-AT ?auto_11009 ?auto_11014 ) ( PERSON-AT ?auto_11007 ?auto_11011 ) ( AIRCRAFT-AT ?auto_11013 ?auto_11005 ) ( FUEL-LEVEL ?auto_11013 ?auto_11012 ) ( not ( = ?auto_11005 ?auto_11011 ) ) ( not ( = ?auto_11007 ?auto_11009 ) ) ( not ( = ?auto_11014 ?auto_11011 ) ) ( not ( = ?auto_11007 ?auto_11008 ) ) ( not ( = ?auto_11009 ?auto_11008 ) ) ( not ( = ?auto_11007 ?auto_11006 ) ) ( not ( = ?auto_11009 ?auto_11006 ) ) ( not ( = ?auto_11008 ?auto_11006 ) ) ( not ( = ?auto_11015 ?auto_11014 ) ) ( not ( = ?auto_11015 ?auto_11011 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_11007 ?auto_11009 ?auto_11006 ?auto_11008 ?auto_11005 )
      ( FLY-4PPL-VERIFY ?auto_11006 ?auto_11007 ?auto_11008 ?auto_11009 ?auto_11005 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_11115 - PERSON
      ?auto_11116 - PERSON
      ?auto_11117 - PERSON
      ?auto_11118 - PERSON
      ?auto_11114 - CITY
    )
    :vars
    (
      ?auto_11121 - FLEVEL
      ?auto_11119 - FLEVEL
      ?auto_11124 - CITY
      ?auto_11123 - CITY
      ?auto_11120 - CITY
      ?auto_11122 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11121 ?auto_11119 ) ( PERSON-AT ?auto_11115 ?auto_11124 ) ( not ( = ?auto_11114 ?auto_11124 ) ) ( not ( = ?auto_11121 ?auto_11119 ) ) ( PERSON-AT ?auto_11118 ?auto_11123 ) ( not ( = ?auto_11114 ?auto_11123 ) ) ( PERSON-AT ?auto_11116 ?auto_11123 ) ( PERSON-AT ?auto_11117 ?auto_11120 ) ( AIRCRAFT-AT ?auto_11122 ?auto_11114 ) ( FUEL-LEVEL ?auto_11122 ?auto_11121 ) ( not ( = ?auto_11114 ?auto_11120 ) ) ( not ( = ?auto_11117 ?auto_11116 ) ) ( not ( = ?auto_11123 ?auto_11120 ) ) ( not ( = ?auto_11117 ?auto_11118 ) ) ( not ( = ?auto_11116 ?auto_11118 ) ) ( not ( = ?auto_11117 ?auto_11115 ) ) ( not ( = ?auto_11116 ?auto_11115 ) ) ( not ( = ?auto_11118 ?auto_11115 ) ) ( not ( = ?auto_11124 ?auto_11123 ) ) ( not ( = ?auto_11124 ?auto_11120 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_11117 ?auto_11116 ?auto_11115 ?auto_11118 ?auto_11114 )
      ( FLY-4PPL-VERIFY ?auto_11115 ?auto_11116 ?auto_11117 ?auto_11118 ?auto_11114 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_11188 - PERSON
      ?auto_11189 - PERSON
      ?auto_11190 - PERSON
      ?auto_11191 - PERSON
      ?auto_11187 - CITY
    )
    :vars
    (
      ?auto_11194 - FLEVEL
      ?auto_11192 - FLEVEL
      ?auto_11197 - CITY
      ?auto_11196 - CITY
      ?auto_11193 - CITY
      ?auto_11195 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11194 ?auto_11192 ) ( PERSON-AT ?auto_11188 ?auto_11197 ) ( not ( = ?auto_11187 ?auto_11197 ) ) ( not ( = ?auto_11194 ?auto_11192 ) ) ( PERSON-AT ?auto_11190 ?auto_11196 ) ( not ( = ?auto_11187 ?auto_11196 ) ) ( PERSON-AT ?auto_11189 ?auto_11196 ) ( PERSON-AT ?auto_11191 ?auto_11193 ) ( AIRCRAFT-AT ?auto_11195 ?auto_11187 ) ( FUEL-LEVEL ?auto_11195 ?auto_11194 ) ( not ( = ?auto_11187 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11189 ) ) ( not ( = ?auto_11196 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( not ( = ?auto_11191 ?auto_11188 ) ) ( not ( = ?auto_11189 ?auto_11188 ) ) ( not ( = ?auto_11190 ?auto_11188 ) ) ( not ( = ?auto_11197 ?auto_11196 ) ) ( not ( = ?auto_11197 ?auto_11193 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_11191 ?auto_11189 ?auto_11188 ?auto_11190 ?auto_11187 )
      ( FLY-4PPL-VERIFY ?auto_11188 ?auto_11189 ?auto_11190 ?auto_11191 ?auto_11187 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_11297 - PERSON
      ?auto_11298 - PERSON
      ?auto_11299 - PERSON
      ?auto_11300 - PERSON
      ?auto_11296 - CITY
    )
    :vars
    (
      ?auto_11303 - FLEVEL
      ?auto_11301 - FLEVEL
      ?auto_11306 - CITY
      ?auto_11305 - CITY
      ?auto_11302 - CITY
      ?auto_11304 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11303 ?auto_11301 ) ( PERSON-AT ?auto_11297 ?auto_11306 ) ( not ( = ?auto_11296 ?auto_11306 ) ) ( not ( = ?auto_11303 ?auto_11301 ) ) ( PERSON-AT ?auto_11298 ?auto_11305 ) ( not ( = ?auto_11296 ?auto_11305 ) ) ( PERSON-AT ?auto_11300 ?auto_11305 ) ( PERSON-AT ?auto_11299 ?auto_11302 ) ( AIRCRAFT-AT ?auto_11304 ?auto_11296 ) ( FUEL-LEVEL ?auto_11304 ?auto_11303 ) ( not ( = ?auto_11296 ?auto_11302 ) ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( not ( = ?auto_11305 ?auto_11302 ) ) ( not ( = ?auto_11299 ?auto_11298 ) ) ( not ( = ?auto_11300 ?auto_11298 ) ) ( not ( = ?auto_11299 ?auto_11297 ) ) ( not ( = ?auto_11300 ?auto_11297 ) ) ( not ( = ?auto_11298 ?auto_11297 ) ) ( not ( = ?auto_11306 ?auto_11305 ) ) ( not ( = ?auto_11306 ?auto_11302 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_11299 ?auto_11300 ?auto_11297 ?auto_11298 ?auto_11296 )
      ( FLY-4PPL-VERIFY ?auto_11297 ?auto_11298 ?auto_11299 ?auto_11300 ?auto_11296 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_11332 - PERSON
      ?auto_11333 - PERSON
      ?auto_11334 - PERSON
      ?auto_11335 - PERSON
      ?auto_11331 - CITY
    )
    :vars
    (
      ?auto_11338 - FLEVEL
      ?auto_11336 - FLEVEL
      ?auto_11341 - CITY
      ?auto_11340 - CITY
      ?auto_11337 - CITY
      ?auto_11339 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11338 ?auto_11336 ) ( PERSON-AT ?auto_11332 ?auto_11341 ) ( not ( = ?auto_11331 ?auto_11341 ) ) ( not ( = ?auto_11338 ?auto_11336 ) ) ( PERSON-AT ?auto_11333 ?auto_11340 ) ( not ( = ?auto_11331 ?auto_11340 ) ) ( PERSON-AT ?auto_11334 ?auto_11340 ) ( PERSON-AT ?auto_11335 ?auto_11337 ) ( AIRCRAFT-AT ?auto_11339 ?auto_11331 ) ( FUEL-LEVEL ?auto_11339 ?auto_11338 ) ( not ( = ?auto_11331 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11334 ) ) ( not ( = ?auto_11340 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11333 ) ) ( not ( = ?auto_11334 ?auto_11333 ) ) ( not ( = ?auto_11335 ?auto_11332 ) ) ( not ( = ?auto_11334 ?auto_11332 ) ) ( not ( = ?auto_11333 ?auto_11332 ) ) ( not ( = ?auto_11341 ?auto_11340 ) ) ( not ( = ?auto_11341 ?auto_11337 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_11335 ?auto_11334 ?auto_11332 ?auto_11333 ?auto_11331 )
      ( FLY-4PPL-VERIFY ?auto_11332 ?auto_11333 ?auto_11334 ?auto_11335 ?auto_11331 ) )
  )

)

