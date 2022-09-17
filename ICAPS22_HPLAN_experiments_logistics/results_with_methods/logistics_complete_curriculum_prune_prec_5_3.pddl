( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7398 - OBJ
      ?auto_7399 - LOCATION
    )
    :vars
    (
      ?auto_7400 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7400 ?auto_7399 ) ( IN-TRUCK ?auto_7398 ?auto_7400 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7398 ?auto_7400 ?auto_7399 )
      ( DELIVER-1PKG-VERIFY ?auto_7398 ?auto_7399 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7403 - OBJ
      ?auto_7404 - LOCATION
    )
    :vars
    (
      ?auto_7405 - TRUCK
      ?auto_7406 - LOCATION
      ?auto_7407 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7403 ?auto_7405 ) ( TRUCK-AT ?auto_7405 ?auto_7406 ) ( IN-CITY ?auto_7406 ?auto_7407 ) ( IN-CITY ?auto_7404 ?auto_7407 ) ( not ( = ?auto_7404 ?auto_7406 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7405 ?auto_7406 ?auto_7404 ?auto_7407 )
      ( DELIVER-1PKG ?auto_7403 ?auto_7404 )
      ( DELIVER-1PKG-VERIFY ?auto_7403 ?auto_7404 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7410 - OBJ
      ?auto_7411 - LOCATION
    )
    :vars
    (
      ?auto_7414 - TRUCK
      ?auto_7412 - LOCATION
      ?auto_7413 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7414 ?auto_7412 ) ( IN-CITY ?auto_7412 ?auto_7413 ) ( IN-CITY ?auto_7411 ?auto_7413 ) ( not ( = ?auto_7411 ?auto_7412 ) ) ( OBJ-AT ?auto_7410 ?auto_7412 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7410 ?auto_7414 ?auto_7412 )
      ( DELIVER-1PKG ?auto_7410 ?auto_7411 )
      ( DELIVER-1PKG-VERIFY ?auto_7410 ?auto_7411 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7417 - OBJ
      ?auto_7418 - LOCATION
    )
    :vars
    (
      ?auto_7420 - LOCATION
      ?auto_7419 - CITY
      ?auto_7421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7420 ?auto_7419 ) ( IN-CITY ?auto_7418 ?auto_7419 ) ( not ( = ?auto_7418 ?auto_7420 ) ) ( OBJ-AT ?auto_7417 ?auto_7420 ) ( TRUCK-AT ?auto_7421 ?auto_7418 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7421 ?auto_7418 ?auto_7420 ?auto_7419 )
      ( DELIVER-1PKG ?auto_7417 ?auto_7418 )
      ( DELIVER-1PKG-VERIFY ?auto_7417 ?auto_7418 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7451 - OBJ
      ?auto_7453 - OBJ
      ?auto_7452 - LOCATION
    )
    :vars
    (
      ?auto_7454 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7453 ?auto_7451 ) ( TRUCK-AT ?auto_7454 ?auto_7452 ) ( IN-TRUCK ?auto_7453 ?auto_7454 ) ( OBJ-AT ?auto_7451 ?auto_7452 ) ( not ( = ?auto_7451 ?auto_7453 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7453 ?auto_7452 )
      ( DELIVER-2PKG-VERIFY ?auto_7451 ?auto_7453 ?auto_7452 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7458 - OBJ
      ?auto_7460 - OBJ
      ?auto_7459 - LOCATION
    )
    :vars
    (
      ?auto_7463 - TRUCK
      ?auto_7461 - LOCATION
      ?auto_7462 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7460 ?auto_7458 ) ( IN-TRUCK ?auto_7460 ?auto_7463 ) ( TRUCK-AT ?auto_7463 ?auto_7461 ) ( IN-CITY ?auto_7461 ?auto_7462 ) ( IN-CITY ?auto_7459 ?auto_7462 ) ( not ( = ?auto_7459 ?auto_7461 ) ) ( OBJ-AT ?auto_7458 ?auto_7459 ) ( not ( = ?auto_7458 ?auto_7460 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7460 ?auto_7459 )
      ( DELIVER-2PKG-VERIFY ?auto_7458 ?auto_7460 ?auto_7459 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7467 - OBJ
      ?auto_7469 - OBJ
      ?auto_7468 - LOCATION
    )
    :vars
    (
      ?auto_7470 - TRUCK
      ?auto_7472 - LOCATION
      ?auto_7471 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7469 ?auto_7467 ) ( TRUCK-AT ?auto_7470 ?auto_7472 ) ( IN-CITY ?auto_7472 ?auto_7471 ) ( IN-CITY ?auto_7468 ?auto_7471 ) ( not ( = ?auto_7468 ?auto_7472 ) ) ( OBJ-AT ?auto_7469 ?auto_7472 ) ( OBJ-AT ?auto_7467 ?auto_7468 ) ( not ( = ?auto_7467 ?auto_7469 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7469 ?auto_7468 )
      ( DELIVER-2PKG-VERIFY ?auto_7467 ?auto_7469 ?auto_7468 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7476 - OBJ
      ?auto_7478 - OBJ
      ?auto_7477 - LOCATION
    )
    :vars
    (
      ?auto_7480 - LOCATION
      ?auto_7479 - CITY
      ?auto_7481 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7478 ?auto_7476 ) ( IN-CITY ?auto_7480 ?auto_7479 ) ( IN-CITY ?auto_7477 ?auto_7479 ) ( not ( = ?auto_7477 ?auto_7480 ) ) ( OBJ-AT ?auto_7478 ?auto_7480 ) ( TRUCK-AT ?auto_7481 ?auto_7477 ) ( OBJ-AT ?auto_7476 ?auto_7477 ) ( not ( = ?auto_7476 ?auto_7478 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7478 ?auto_7477 )
      ( DELIVER-2PKG-VERIFY ?auto_7476 ?auto_7478 ?auto_7477 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7485 - OBJ
      ?auto_7487 - OBJ
      ?auto_7486 - LOCATION
    )
    :vars
    (
      ?auto_7488 - LOCATION
      ?auto_7490 - CITY
      ?auto_7489 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7487 ?auto_7485 ) ( IN-CITY ?auto_7488 ?auto_7490 ) ( IN-CITY ?auto_7486 ?auto_7490 ) ( not ( = ?auto_7486 ?auto_7488 ) ) ( OBJ-AT ?auto_7487 ?auto_7488 ) ( TRUCK-AT ?auto_7489 ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( IN-TRUCK ?auto_7485 ?auto_7489 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7485 ?auto_7486 )
      ( DELIVER-2PKG ?auto_7485 ?auto_7487 ?auto_7486 )
      ( DELIVER-2PKG-VERIFY ?auto_7485 ?auto_7487 ?auto_7486 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7494 - OBJ
      ?auto_7496 - OBJ
      ?auto_7495 - LOCATION
    )
    :vars
    (
      ?auto_7499 - LOCATION
      ?auto_7497 - CITY
      ?auto_7498 - TRUCK
      ?auto_7500 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7496 ?auto_7494 ) ( IN-CITY ?auto_7499 ?auto_7497 ) ( IN-CITY ?auto_7495 ?auto_7497 ) ( not ( = ?auto_7495 ?auto_7499 ) ) ( OBJ-AT ?auto_7496 ?auto_7499 ) ( not ( = ?auto_7494 ?auto_7496 ) ) ( IN-TRUCK ?auto_7494 ?auto_7498 ) ( TRUCK-AT ?auto_7498 ?auto_7500 ) ( IN-CITY ?auto_7500 ?auto_7497 ) ( not ( = ?auto_7495 ?auto_7500 ) ) ( not ( = ?auto_7499 ?auto_7500 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7498 ?auto_7500 ?auto_7495 ?auto_7497 )
      ( DELIVER-2PKG ?auto_7494 ?auto_7496 ?auto_7495 )
      ( DELIVER-2PKG-VERIFY ?auto_7494 ?auto_7496 ?auto_7495 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7504 - OBJ
      ?auto_7506 - OBJ
      ?auto_7505 - LOCATION
    )
    :vars
    (
      ?auto_7509 - LOCATION
      ?auto_7507 - CITY
      ?auto_7510 - TRUCK
      ?auto_7508 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7506 ?auto_7504 ) ( IN-CITY ?auto_7509 ?auto_7507 ) ( IN-CITY ?auto_7505 ?auto_7507 ) ( not ( = ?auto_7505 ?auto_7509 ) ) ( OBJ-AT ?auto_7506 ?auto_7509 ) ( not ( = ?auto_7504 ?auto_7506 ) ) ( TRUCK-AT ?auto_7510 ?auto_7508 ) ( IN-CITY ?auto_7508 ?auto_7507 ) ( not ( = ?auto_7505 ?auto_7508 ) ) ( not ( = ?auto_7509 ?auto_7508 ) ) ( OBJ-AT ?auto_7504 ?auto_7508 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7504 ?auto_7510 ?auto_7508 )
      ( DELIVER-2PKG ?auto_7504 ?auto_7506 ?auto_7505 )
      ( DELIVER-2PKG-VERIFY ?auto_7504 ?auto_7506 ?auto_7505 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7514 - OBJ
      ?auto_7516 - OBJ
      ?auto_7515 - LOCATION
    )
    :vars
    (
      ?auto_7517 - LOCATION
      ?auto_7520 - CITY
      ?auto_7519 - LOCATION
      ?auto_7518 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7516 ?auto_7514 ) ( IN-CITY ?auto_7517 ?auto_7520 ) ( IN-CITY ?auto_7515 ?auto_7520 ) ( not ( = ?auto_7515 ?auto_7517 ) ) ( OBJ-AT ?auto_7516 ?auto_7517 ) ( not ( = ?auto_7514 ?auto_7516 ) ) ( IN-CITY ?auto_7519 ?auto_7520 ) ( not ( = ?auto_7515 ?auto_7519 ) ) ( not ( = ?auto_7517 ?auto_7519 ) ) ( OBJ-AT ?auto_7514 ?auto_7519 ) ( TRUCK-AT ?auto_7518 ?auto_7515 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7518 ?auto_7515 ?auto_7519 ?auto_7520 )
      ( DELIVER-2PKG ?auto_7514 ?auto_7516 ?auto_7515 )
      ( DELIVER-2PKG-VERIFY ?auto_7514 ?auto_7516 ?auto_7515 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7551 - OBJ
      ?auto_7553 - OBJ
      ?auto_7554 - OBJ
      ?auto_7552 - LOCATION
    )
    :vars
    (
      ?auto_7555 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7553 ?auto_7551 ) ( GREATER-THAN ?auto_7554 ?auto_7551 ) ( GREATER-THAN ?auto_7554 ?auto_7553 ) ( TRUCK-AT ?auto_7555 ?auto_7552 ) ( IN-TRUCK ?auto_7554 ?auto_7555 ) ( OBJ-AT ?auto_7551 ?auto_7552 ) ( OBJ-AT ?auto_7553 ?auto_7552 ) ( not ( = ?auto_7551 ?auto_7553 ) ) ( not ( = ?auto_7551 ?auto_7554 ) ) ( not ( = ?auto_7553 ?auto_7554 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7554 ?auto_7552 )
      ( DELIVER-3PKG-VERIFY ?auto_7551 ?auto_7553 ?auto_7554 ?auto_7552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7560 - OBJ
      ?auto_7562 - OBJ
      ?auto_7563 - OBJ
      ?auto_7561 - LOCATION
    )
    :vars
    (
      ?auto_7565 - TRUCK
      ?auto_7566 - LOCATION
      ?auto_7564 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7562 ?auto_7560 ) ( GREATER-THAN ?auto_7563 ?auto_7560 ) ( GREATER-THAN ?auto_7563 ?auto_7562 ) ( IN-TRUCK ?auto_7563 ?auto_7565 ) ( TRUCK-AT ?auto_7565 ?auto_7566 ) ( IN-CITY ?auto_7566 ?auto_7564 ) ( IN-CITY ?auto_7561 ?auto_7564 ) ( not ( = ?auto_7561 ?auto_7566 ) ) ( OBJ-AT ?auto_7560 ?auto_7561 ) ( OBJ-AT ?auto_7562 ?auto_7561 ) ( not ( = ?auto_7560 ?auto_7562 ) ) ( not ( = ?auto_7560 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7563 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7563 ?auto_7561 )
      ( DELIVER-3PKG-VERIFY ?auto_7560 ?auto_7562 ?auto_7563 ?auto_7561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7571 - OBJ
      ?auto_7573 - OBJ
      ?auto_7574 - OBJ
      ?auto_7572 - LOCATION
    )
    :vars
    (
      ?auto_7575 - TRUCK
      ?auto_7577 - LOCATION
      ?auto_7576 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7573 ?auto_7571 ) ( GREATER-THAN ?auto_7574 ?auto_7571 ) ( GREATER-THAN ?auto_7574 ?auto_7573 ) ( TRUCK-AT ?auto_7575 ?auto_7577 ) ( IN-CITY ?auto_7577 ?auto_7576 ) ( IN-CITY ?auto_7572 ?auto_7576 ) ( not ( = ?auto_7572 ?auto_7577 ) ) ( OBJ-AT ?auto_7574 ?auto_7577 ) ( OBJ-AT ?auto_7571 ?auto_7572 ) ( OBJ-AT ?auto_7573 ?auto_7572 ) ( not ( = ?auto_7571 ?auto_7573 ) ) ( not ( = ?auto_7571 ?auto_7574 ) ) ( not ( = ?auto_7573 ?auto_7574 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7574 ?auto_7572 )
      ( DELIVER-3PKG-VERIFY ?auto_7571 ?auto_7573 ?auto_7574 ?auto_7572 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7582 - OBJ
      ?auto_7584 - OBJ
      ?auto_7585 - OBJ
      ?auto_7583 - LOCATION
    )
    :vars
    (
      ?auto_7588 - LOCATION
      ?auto_7586 - CITY
      ?auto_7587 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7584 ?auto_7582 ) ( GREATER-THAN ?auto_7585 ?auto_7582 ) ( GREATER-THAN ?auto_7585 ?auto_7584 ) ( IN-CITY ?auto_7588 ?auto_7586 ) ( IN-CITY ?auto_7583 ?auto_7586 ) ( not ( = ?auto_7583 ?auto_7588 ) ) ( OBJ-AT ?auto_7585 ?auto_7588 ) ( TRUCK-AT ?auto_7587 ?auto_7583 ) ( OBJ-AT ?auto_7582 ?auto_7583 ) ( OBJ-AT ?auto_7584 ?auto_7583 ) ( not ( = ?auto_7582 ?auto_7584 ) ) ( not ( = ?auto_7582 ?auto_7585 ) ) ( not ( = ?auto_7584 ?auto_7585 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7585 ?auto_7583 )
      ( DELIVER-3PKG-VERIFY ?auto_7582 ?auto_7584 ?auto_7585 ?auto_7583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7593 - OBJ
      ?auto_7595 - OBJ
      ?auto_7596 - OBJ
      ?auto_7594 - LOCATION
    )
    :vars
    (
      ?auto_7598 - LOCATION
      ?auto_7597 - CITY
      ?auto_7599 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7595 ?auto_7593 ) ( GREATER-THAN ?auto_7596 ?auto_7593 ) ( GREATER-THAN ?auto_7596 ?auto_7595 ) ( IN-CITY ?auto_7598 ?auto_7597 ) ( IN-CITY ?auto_7594 ?auto_7597 ) ( not ( = ?auto_7594 ?auto_7598 ) ) ( OBJ-AT ?auto_7596 ?auto_7598 ) ( TRUCK-AT ?auto_7599 ?auto_7594 ) ( OBJ-AT ?auto_7593 ?auto_7594 ) ( not ( = ?auto_7593 ?auto_7595 ) ) ( not ( = ?auto_7593 ?auto_7596 ) ) ( not ( = ?auto_7595 ?auto_7596 ) ) ( IN-TRUCK ?auto_7595 ?auto_7599 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7595 ?auto_7594 )
      ( DELIVER-3PKG ?auto_7593 ?auto_7595 ?auto_7596 ?auto_7594 )
      ( DELIVER-3PKG-VERIFY ?auto_7593 ?auto_7595 ?auto_7596 ?auto_7594 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7604 - OBJ
      ?auto_7606 - OBJ
      ?auto_7607 - OBJ
      ?auto_7605 - LOCATION
    )
    :vars
    (
      ?auto_7609 - LOCATION
      ?auto_7608 - CITY
      ?auto_7610 - TRUCK
      ?auto_7611 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7606 ?auto_7604 ) ( GREATER-THAN ?auto_7607 ?auto_7604 ) ( GREATER-THAN ?auto_7607 ?auto_7606 ) ( IN-CITY ?auto_7609 ?auto_7608 ) ( IN-CITY ?auto_7605 ?auto_7608 ) ( not ( = ?auto_7605 ?auto_7609 ) ) ( OBJ-AT ?auto_7607 ?auto_7609 ) ( OBJ-AT ?auto_7604 ?auto_7605 ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7604 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( IN-TRUCK ?auto_7606 ?auto_7610 ) ( TRUCK-AT ?auto_7610 ?auto_7611 ) ( IN-CITY ?auto_7611 ?auto_7608 ) ( not ( = ?auto_7605 ?auto_7611 ) ) ( not ( = ?auto_7609 ?auto_7611 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7610 ?auto_7611 ?auto_7605 ?auto_7608 )
      ( DELIVER-3PKG ?auto_7604 ?auto_7606 ?auto_7607 ?auto_7605 )
      ( DELIVER-3PKG-VERIFY ?auto_7604 ?auto_7606 ?auto_7607 ?auto_7605 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7616 - OBJ
      ?auto_7618 - OBJ
      ?auto_7619 - OBJ
      ?auto_7617 - LOCATION
    )
    :vars
    (
      ?auto_7621 - LOCATION
      ?auto_7620 - CITY
      ?auto_7623 - TRUCK
      ?auto_7622 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7618 ?auto_7616 ) ( GREATER-THAN ?auto_7619 ?auto_7616 ) ( GREATER-THAN ?auto_7619 ?auto_7618 ) ( IN-CITY ?auto_7621 ?auto_7620 ) ( IN-CITY ?auto_7617 ?auto_7620 ) ( not ( = ?auto_7617 ?auto_7621 ) ) ( OBJ-AT ?auto_7619 ?auto_7621 ) ( OBJ-AT ?auto_7616 ?auto_7617 ) ( not ( = ?auto_7616 ?auto_7618 ) ) ( not ( = ?auto_7616 ?auto_7619 ) ) ( not ( = ?auto_7618 ?auto_7619 ) ) ( TRUCK-AT ?auto_7623 ?auto_7622 ) ( IN-CITY ?auto_7622 ?auto_7620 ) ( not ( = ?auto_7617 ?auto_7622 ) ) ( not ( = ?auto_7621 ?auto_7622 ) ) ( OBJ-AT ?auto_7618 ?auto_7622 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7618 ?auto_7623 ?auto_7622 )
      ( DELIVER-3PKG ?auto_7616 ?auto_7618 ?auto_7619 ?auto_7617 )
      ( DELIVER-3PKG-VERIFY ?auto_7616 ?auto_7618 ?auto_7619 ?auto_7617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7628 - OBJ
      ?auto_7630 - OBJ
      ?auto_7631 - OBJ
      ?auto_7629 - LOCATION
    )
    :vars
    (
      ?auto_7634 - LOCATION
      ?auto_7635 - CITY
      ?auto_7633 - LOCATION
      ?auto_7632 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7630 ?auto_7628 ) ( GREATER-THAN ?auto_7631 ?auto_7628 ) ( GREATER-THAN ?auto_7631 ?auto_7630 ) ( IN-CITY ?auto_7634 ?auto_7635 ) ( IN-CITY ?auto_7629 ?auto_7635 ) ( not ( = ?auto_7629 ?auto_7634 ) ) ( OBJ-AT ?auto_7631 ?auto_7634 ) ( OBJ-AT ?auto_7628 ?auto_7629 ) ( not ( = ?auto_7628 ?auto_7630 ) ) ( not ( = ?auto_7628 ?auto_7631 ) ) ( not ( = ?auto_7630 ?auto_7631 ) ) ( IN-CITY ?auto_7633 ?auto_7635 ) ( not ( = ?auto_7629 ?auto_7633 ) ) ( not ( = ?auto_7634 ?auto_7633 ) ) ( OBJ-AT ?auto_7630 ?auto_7633 ) ( TRUCK-AT ?auto_7632 ?auto_7629 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7632 ?auto_7629 ?auto_7633 ?auto_7635 )
      ( DELIVER-3PKG ?auto_7628 ?auto_7630 ?auto_7631 ?auto_7629 )
      ( DELIVER-3PKG-VERIFY ?auto_7628 ?auto_7630 ?auto_7631 ?auto_7629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7640 - OBJ
      ?auto_7642 - OBJ
      ?auto_7643 - OBJ
      ?auto_7641 - LOCATION
    )
    :vars
    (
      ?auto_7645 - LOCATION
      ?auto_7644 - CITY
      ?auto_7647 - LOCATION
      ?auto_7646 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7642 ?auto_7640 ) ( GREATER-THAN ?auto_7643 ?auto_7640 ) ( GREATER-THAN ?auto_7643 ?auto_7642 ) ( IN-CITY ?auto_7645 ?auto_7644 ) ( IN-CITY ?auto_7641 ?auto_7644 ) ( not ( = ?auto_7641 ?auto_7645 ) ) ( OBJ-AT ?auto_7643 ?auto_7645 ) ( not ( = ?auto_7640 ?auto_7642 ) ) ( not ( = ?auto_7640 ?auto_7643 ) ) ( not ( = ?auto_7642 ?auto_7643 ) ) ( IN-CITY ?auto_7647 ?auto_7644 ) ( not ( = ?auto_7641 ?auto_7647 ) ) ( not ( = ?auto_7645 ?auto_7647 ) ) ( OBJ-AT ?auto_7642 ?auto_7647 ) ( TRUCK-AT ?auto_7646 ?auto_7641 ) ( IN-TRUCK ?auto_7640 ?auto_7646 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7640 ?auto_7641 )
      ( DELIVER-3PKG ?auto_7640 ?auto_7642 ?auto_7643 ?auto_7641 )
      ( DELIVER-3PKG-VERIFY ?auto_7640 ?auto_7642 ?auto_7643 ?auto_7641 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7652 - OBJ
      ?auto_7654 - OBJ
      ?auto_7655 - OBJ
      ?auto_7653 - LOCATION
    )
    :vars
    (
      ?auto_7656 - LOCATION
      ?auto_7659 - CITY
      ?auto_7657 - LOCATION
      ?auto_7658 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7654 ?auto_7652 ) ( GREATER-THAN ?auto_7655 ?auto_7652 ) ( GREATER-THAN ?auto_7655 ?auto_7654 ) ( IN-CITY ?auto_7656 ?auto_7659 ) ( IN-CITY ?auto_7653 ?auto_7659 ) ( not ( = ?auto_7653 ?auto_7656 ) ) ( OBJ-AT ?auto_7655 ?auto_7656 ) ( not ( = ?auto_7652 ?auto_7654 ) ) ( not ( = ?auto_7652 ?auto_7655 ) ) ( not ( = ?auto_7654 ?auto_7655 ) ) ( IN-CITY ?auto_7657 ?auto_7659 ) ( not ( = ?auto_7653 ?auto_7657 ) ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( OBJ-AT ?auto_7654 ?auto_7657 ) ( IN-TRUCK ?auto_7652 ?auto_7658 ) ( TRUCK-AT ?auto_7658 ?auto_7656 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7658 ?auto_7656 ?auto_7653 ?auto_7659 )
      ( DELIVER-3PKG ?auto_7652 ?auto_7654 ?auto_7655 ?auto_7653 )
      ( DELIVER-3PKG-VERIFY ?auto_7652 ?auto_7654 ?auto_7655 ?auto_7653 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7664 - OBJ
      ?auto_7666 - OBJ
      ?auto_7667 - OBJ
      ?auto_7665 - LOCATION
    )
    :vars
    (
      ?auto_7669 - LOCATION
      ?auto_7670 - CITY
      ?auto_7671 - LOCATION
      ?auto_7668 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7666 ?auto_7664 ) ( GREATER-THAN ?auto_7667 ?auto_7664 ) ( GREATER-THAN ?auto_7667 ?auto_7666 ) ( IN-CITY ?auto_7669 ?auto_7670 ) ( IN-CITY ?auto_7665 ?auto_7670 ) ( not ( = ?auto_7665 ?auto_7669 ) ) ( OBJ-AT ?auto_7667 ?auto_7669 ) ( not ( = ?auto_7664 ?auto_7666 ) ) ( not ( = ?auto_7664 ?auto_7667 ) ) ( not ( = ?auto_7666 ?auto_7667 ) ) ( IN-CITY ?auto_7671 ?auto_7670 ) ( not ( = ?auto_7665 ?auto_7671 ) ) ( not ( = ?auto_7669 ?auto_7671 ) ) ( OBJ-AT ?auto_7666 ?auto_7671 ) ( TRUCK-AT ?auto_7668 ?auto_7669 ) ( OBJ-AT ?auto_7664 ?auto_7669 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7664 ?auto_7668 ?auto_7669 )
      ( DELIVER-3PKG ?auto_7664 ?auto_7666 ?auto_7667 ?auto_7665 )
      ( DELIVER-3PKG-VERIFY ?auto_7664 ?auto_7666 ?auto_7667 ?auto_7665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7676 - OBJ
      ?auto_7678 - OBJ
      ?auto_7679 - OBJ
      ?auto_7677 - LOCATION
    )
    :vars
    (
      ?auto_7681 - LOCATION
      ?auto_7682 - CITY
      ?auto_7683 - LOCATION
      ?auto_7680 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7678 ?auto_7676 ) ( GREATER-THAN ?auto_7679 ?auto_7676 ) ( GREATER-THAN ?auto_7679 ?auto_7678 ) ( IN-CITY ?auto_7681 ?auto_7682 ) ( IN-CITY ?auto_7677 ?auto_7682 ) ( not ( = ?auto_7677 ?auto_7681 ) ) ( OBJ-AT ?auto_7679 ?auto_7681 ) ( not ( = ?auto_7676 ?auto_7678 ) ) ( not ( = ?auto_7676 ?auto_7679 ) ) ( not ( = ?auto_7678 ?auto_7679 ) ) ( IN-CITY ?auto_7683 ?auto_7682 ) ( not ( = ?auto_7677 ?auto_7683 ) ) ( not ( = ?auto_7681 ?auto_7683 ) ) ( OBJ-AT ?auto_7678 ?auto_7683 ) ( OBJ-AT ?auto_7676 ?auto_7681 ) ( TRUCK-AT ?auto_7680 ?auto_7677 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7680 ?auto_7677 ?auto_7681 ?auto_7682 )
      ( DELIVER-3PKG ?auto_7676 ?auto_7678 ?auto_7679 ?auto_7677 )
      ( DELIVER-3PKG-VERIFY ?auto_7676 ?auto_7678 ?auto_7679 ?auto_7677 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7715 - OBJ
      ?auto_7717 - OBJ
      ?auto_7718 - OBJ
      ?auto_7719 - OBJ
      ?auto_7716 - LOCATION
    )
    :vars
    (
      ?auto_7720 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7717 ?auto_7715 ) ( GREATER-THAN ?auto_7718 ?auto_7715 ) ( GREATER-THAN ?auto_7718 ?auto_7717 ) ( GREATER-THAN ?auto_7719 ?auto_7715 ) ( GREATER-THAN ?auto_7719 ?auto_7717 ) ( GREATER-THAN ?auto_7719 ?auto_7718 ) ( TRUCK-AT ?auto_7720 ?auto_7716 ) ( IN-TRUCK ?auto_7719 ?auto_7720 ) ( OBJ-AT ?auto_7715 ?auto_7716 ) ( OBJ-AT ?auto_7717 ?auto_7716 ) ( OBJ-AT ?auto_7718 ?auto_7716 ) ( not ( = ?auto_7715 ?auto_7717 ) ) ( not ( = ?auto_7715 ?auto_7718 ) ) ( not ( = ?auto_7715 ?auto_7719 ) ) ( not ( = ?auto_7717 ?auto_7718 ) ) ( not ( = ?auto_7717 ?auto_7719 ) ) ( not ( = ?auto_7718 ?auto_7719 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7719 ?auto_7716 )
      ( DELIVER-4PKG-VERIFY ?auto_7715 ?auto_7717 ?auto_7718 ?auto_7719 ?auto_7716 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7726 - OBJ
      ?auto_7728 - OBJ
      ?auto_7729 - OBJ
      ?auto_7730 - OBJ
      ?auto_7727 - LOCATION
    )
    :vars
    (
      ?auto_7731 - TRUCK
      ?auto_7732 - LOCATION
      ?auto_7733 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7728 ?auto_7726 ) ( GREATER-THAN ?auto_7729 ?auto_7726 ) ( GREATER-THAN ?auto_7729 ?auto_7728 ) ( GREATER-THAN ?auto_7730 ?auto_7726 ) ( GREATER-THAN ?auto_7730 ?auto_7728 ) ( GREATER-THAN ?auto_7730 ?auto_7729 ) ( IN-TRUCK ?auto_7730 ?auto_7731 ) ( TRUCK-AT ?auto_7731 ?auto_7732 ) ( IN-CITY ?auto_7732 ?auto_7733 ) ( IN-CITY ?auto_7727 ?auto_7733 ) ( not ( = ?auto_7727 ?auto_7732 ) ) ( OBJ-AT ?auto_7726 ?auto_7727 ) ( OBJ-AT ?auto_7728 ?auto_7727 ) ( OBJ-AT ?auto_7729 ?auto_7727 ) ( not ( = ?auto_7726 ?auto_7728 ) ) ( not ( = ?auto_7726 ?auto_7729 ) ) ( not ( = ?auto_7726 ?auto_7730 ) ) ( not ( = ?auto_7728 ?auto_7729 ) ) ( not ( = ?auto_7728 ?auto_7730 ) ) ( not ( = ?auto_7729 ?auto_7730 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7730 ?auto_7727 )
      ( DELIVER-4PKG-VERIFY ?auto_7726 ?auto_7728 ?auto_7729 ?auto_7730 ?auto_7727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7739 - OBJ
      ?auto_7741 - OBJ
      ?auto_7742 - OBJ
      ?auto_7743 - OBJ
      ?auto_7740 - LOCATION
    )
    :vars
    (
      ?auto_7744 - TRUCK
      ?auto_7745 - LOCATION
      ?auto_7746 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7741 ?auto_7739 ) ( GREATER-THAN ?auto_7742 ?auto_7739 ) ( GREATER-THAN ?auto_7742 ?auto_7741 ) ( GREATER-THAN ?auto_7743 ?auto_7739 ) ( GREATER-THAN ?auto_7743 ?auto_7741 ) ( GREATER-THAN ?auto_7743 ?auto_7742 ) ( TRUCK-AT ?auto_7744 ?auto_7745 ) ( IN-CITY ?auto_7745 ?auto_7746 ) ( IN-CITY ?auto_7740 ?auto_7746 ) ( not ( = ?auto_7740 ?auto_7745 ) ) ( OBJ-AT ?auto_7743 ?auto_7745 ) ( OBJ-AT ?auto_7739 ?auto_7740 ) ( OBJ-AT ?auto_7741 ?auto_7740 ) ( OBJ-AT ?auto_7742 ?auto_7740 ) ( not ( = ?auto_7739 ?auto_7741 ) ) ( not ( = ?auto_7739 ?auto_7742 ) ) ( not ( = ?auto_7739 ?auto_7743 ) ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( not ( = ?auto_7741 ?auto_7743 ) ) ( not ( = ?auto_7742 ?auto_7743 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7743 ?auto_7740 )
      ( DELIVER-4PKG-VERIFY ?auto_7739 ?auto_7741 ?auto_7742 ?auto_7743 ?auto_7740 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7752 - OBJ
      ?auto_7754 - OBJ
      ?auto_7755 - OBJ
      ?auto_7756 - OBJ
      ?auto_7753 - LOCATION
    )
    :vars
    (
      ?auto_7759 - LOCATION
      ?auto_7758 - CITY
      ?auto_7757 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7754 ?auto_7752 ) ( GREATER-THAN ?auto_7755 ?auto_7752 ) ( GREATER-THAN ?auto_7755 ?auto_7754 ) ( GREATER-THAN ?auto_7756 ?auto_7752 ) ( GREATER-THAN ?auto_7756 ?auto_7754 ) ( GREATER-THAN ?auto_7756 ?auto_7755 ) ( IN-CITY ?auto_7759 ?auto_7758 ) ( IN-CITY ?auto_7753 ?auto_7758 ) ( not ( = ?auto_7753 ?auto_7759 ) ) ( OBJ-AT ?auto_7756 ?auto_7759 ) ( TRUCK-AT ?auto_7757 ?auto_7753 ) ( OBJ-AT ?auto_7752 ?auto_7753 ) ( OBJ-AT ?auto_7754 ?auto_7753 ) ( OBJ-AT ?auto_7755 ?auto_7753 ) ( not ( = ?auto_7752 ?auto_7754 ) ) ( not ( = ?auto_7752 ?auto_7755 ) ) ( not ( = ?auto_7752 ?auto_7756 ) ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( not ( = ?auto_7754 ?auto_7756 ) ) ( not ( = ?auto_7755 ?auto_7756 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7756 ?auto_7753 )
      ( DELIVER-4PKG-VERIFY ?auto_7752 ?auto_7754 ?auto_7755 ?auto_7756 ?auto_7753 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7765 - OBJ
      ?auto_7767 - OBJ
      ?auto_7768 - OBJ
      ?auto_7769 - OBJ
      ?auto_7766 - LOCATION
    )
    :vars
    (
      ?auto_7770 - LOCATION
      ?auto_7772 - CITY
      ?auto_7771 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7767 ?auto_7765 ) ( GREATER-THAN ?auto_7768 ?auto_7765 ) ( GREATER-THAN ?auto_7768 ?auto_7767 ) ( GREATER-THAN ?auto_7769 ?auto_7765 ) ( GREATER-THAN ?auto_7769 ?auto_7767 ) ( GREATER-THAN ?auto_7769 ?auto_7768 ) ( IN-CITY ?auto_7770 ?auto_7772 ) ( IN-CITY ?auto_7766 ?auto_7772 ) ( not ( = ?auto_7766 ?auto_7770 ) ) ( OBJ-AT ?auto_7769 ?auto_7770 ) ( TRUCK-AT ?auto_7771 ?auto_7766 ) ( OBJ-AT ?auto_7765 ?auto_7766 ) ( OBJ-AT ?auto_7767 ?auto_7766 ) ( not ( = ?auto_7765 ?auto_7767 ) ) ( not ( = ?auto_7765 ?auto_7768 ) ) ( not ( = ?auto_7765 ?auto_7769 ) ) ( not ( = ?auto_7767 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( IN-TRUCK ?auto_7768 ?auto_7771 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7768 ?auto_7766 )
      ( DELIVER-4PKG ?auto_7765 ?auto_7767 ?auto_7768 ?auto_7769 ?auto_7766 )
      ( DELIVER-4PKG-VERIFY ?auto_7765 ?auto_7767 ?auto_7768 ?auto_7769 ?auto_7766 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7778 - OBJ
      ?auto_7780 - OBJ
      ?auto_7781 - OBJ
      ?auto_7782 - OBJ
      ?auto_7779 - LOCATION
    )
    :vars
    (
      ?auto_7783 - LOCATION
      ?auto_7784 - CITY
      ?auto_7785 - TRUCK
      ?auto_7786 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7780 ?auto_7778 ) ( GREATER-THAN ?auto_7781 ?auto_7778 ) ( GREATER-THAN ?auto_7781 ?auto_7780 ) ( GREATER-THAN ?auto_7782 ?auto_7778 ) ( GREATER-THAN ?auto_7782 ?auto_7780 ) ( GREATER-THAN ?auto_7782 ?auto_7781 ) ( IN-CITY ?auto_7783 ?auto_7784 ) ( IN-CITY ?auto_7779 ?auto_7784 ) ( not ( = ?auto_7779 ?auto_7783 ) ) ( OBJ-AT ?auto_7782 ?auto_7783 ) ( OBJ-AT ?auto_7778 ?auto_7779 ) ( OBJ-AT ?auto_7780 ?auto_7779 ) ( not ( = ?auto_7778 ?auto_7780 ) ) ( not ( = ?auto_7778 ?auto_7781 ) ) ( not ( = ?auto_7778 ?auto_7782 ) ) ( not ( = ?auto_7780 ?auto_7781 ) ) ( not ( = ?auto_7780 ?auto_7782 ) ) ( not ( = ?auto_7781 ?auto_7782 ) ) ( IN-TRUCK ?auto_7781 ?auto_7785 ) ( TRUCK-AT ?auto_7785 ?auto_7786 ) ( IN-CITY ?auto_7786 ?auto_7784 ) ( not ( = ?auto_7779 ?auto_7786 ) ) ( not ( = ?auto_7783 ?auto_7786 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7785 ?auto_7786 ?auto_7779 ?auto_7784 )
      ( DELIVER-4PKG ?auto_7778 ?auto_7780 ?auto_7781 ?auto_7782 ?auto_7779 )
      ( DELIVER-4PKG-VERIFY ?auto_7778 ?auto_7780 ?auto_7781 ?auto_7782 ?auto_7779 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7792 - OBJ
      ?auto_7794 - OBJ
      ?auto_7795 - OBJ
      ?auto_7796 - OBJ
      ?auto_7793 - LOCATION
    )
    :vars
    (
      ?auto_7798 - LOCATION
      ?auto_7797 - CITY
      ?auto_7800 - TRUCK
      ?auto_7799 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7794 ?auto_7792 ) ( GREATER-THAN ?auto_7795 ?auto_7792 ) ( GREATER-THAN ?auto_7795 ?auto_7794 ) ( GREATER-THAN ?auto_7796 ?auto_7792 ) ( GREATER-THAN ?auto_7796 ?auto_7794 ) ( GREATER-THAN ?auto_7796 ?auto_7795 ) ( IN-CITY ?auto_7798 ?auto_7797 ) ( IN-CITY ?auto_7793 ?auto_7797 ) ( not ( = ?auto_7793 ?auto_7798 ) ) ( OBJ-AT ?auto_7796 ?auto_7798 ) ( OBJ-AT ?auto_7792 ?auto_7793 ) ( OBJ-AT ?auto_7794 ?auto_7793 ) ( not ( = ?auto_7792 ?auto_7794 ) ) ( not ( = ?auto_7792 ?auto_7795 ) ) ( not ( = ?auto_7792 ?auto_7796 ) ) ( not ( = ?auto_7794 ?auto_7795 ) ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( TRUCK-AT ?auto_7800 ?auto_7799 ) ( IN-CITY ?auto_7799 ?auto_7797 ) ( not ( = ?auto_7793 ?auto_7799 ) ) ( not ( = ?auto_7798 ?auto_7799 ) ) ( OBJ-AT ?auto_7795 ?auto_7799 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7795 ?auto_7800 ?auto_7799 )
      ( DELIVER-4PKG ?auto_7792 ?auto_7794 ?auto_7795 ?auto_7796 ?auto_7793 )
      ( DELIVER-4PKG-VERIFY ?auto_7792 ?auto_7794 ?auto_7795 ?auto_7796 ?auto_7793 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7806 - OBJ
      ?auto_7808 - OBJ
      ?auto_7809 - OBJ
      ?auto_7810 - OBJ
      ?auto_7807 - LOCATION
    )
    :vars
    (
      ?auto_7812 - LOCATION
      ?auto_7813 - CITY
      ?auto_7811 - LOCATION
      ?auto_7814 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7808 ?auto_7806 ) ( GREATER-THAN ?auto_7809 ?auto_7806 ) ( GREATER-THAN ?auto_7809 ?auto_7808 ) ( GREATER-THAN ?auto_7810 ?auto_7806 ) ( GREATER-THAN ?auto_7810 ?auto_7808 ) ( GREATER-THAN ?auto_7810 ?auto_7809 ) ( IN-CITY ?auto_7812 ?auto_7813 ) ( IN-CITY ?auto_7807 ?auto_7813 ) ( not ( = ?auto_7807 ?auto_7812 ) ) ( OBJ-AT ?auto_7810 ?auto_7812 ) ( OBJ-AT ?auto_7806 ?auto_7807 ) ( OBJ-AT ?auto_7808 ?auto_7807 ) ( not ( = ?auto_7806 ?auto_7808 ) ) ( not ( = ?auto_7806 ?auto_7809 ) ) ( not ( = ?auto_7806 ?auto_7810 ) ) ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7810 ) ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( IN-CITY ?auto_7811 ?auto_7813 ) ( not ( = ?auto_7807 ?auto_7811 ) ) ( not ( = ?auto_7812 ?auto_7811 ) ) ( OBJ-AT ?auto_7809 ?auto_7811 ) ( TRUCK-AT ?auto_7814 ?auto_7807 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7814 ?auto_7807 ?auto_7811 ?auto_7813 )
      ( DELIVER-4PKG ?auto_7806 ?auto_7808 ?auto_7809 ?auto_7810 ?auto_7807 )
      ( DELIVER-4PKG-VERIFY ?auto_7806 ?auto_7808 ?auto_7809 ?auto_7810 ?auto_7807 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7820 - OBJ
      ?auto_7822 - OBJ
      ?auto_7823 - OBJ
      ?auto_7824 - OBJ
      ?auto_7821 - LOCATION
    )
    :vars
    (
      ?auto_7826 - LOCATION
      ?auto_7825 - CITY
      ?auto_7827 - LOCATION
      ?auto_7828 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7822 ?auto_7820 ) ( GREATER-THAN ?auto_7823 ?auto_7820 ) ( GREATER-THAN ?auto_7823 ?auto_7822 ) ( GREATER-THAN ?auto_7824 ?auto_7820 ) ( GREATER-THAN ?auto_7824 ?auto_7822 ) ( GREATER-THAN ?auto_7824 ?auto_7823 ) ( IN-CITY ?auto_7826 ?auto_7825 ) ( IN-CITY ?auto_7821 ?auto_7825 ) ( not ( = ?auto_7821 ?auto_7826 ) ) ( OBJ-AT ?auto_7824 ?auto_7826 ) ( OBJ-AT ?auto_7820 ?auto_7821 ) ( not ( = ?auto_7820 ?auto_7822 ) ) ( not ( = ?auto_7820 ?auto_7823 ) ) ( not ( = ?auto_7820 ?auto_7824 ) ) ( not ( = ?auto_7822 ?auto_7823 ) ) ( not ( = ?auto_7822 ?auto_7824 ) ) ( not ( = ?auto_7823 ?auto_7824 ) ) ( IN-CITY ?auto_7827 ?auto_7825 ) ( not ( = ?auto_7821 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( OBJ-AT ?auto_7823 ?auto_7827 ) ( TRUCK-AT ?auto_7828 ?auto_7821 ) ( IN-TRUCK ?auto_7822 ?auto_7828 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7822 ?auto_7821 )
      ( DELIVER-4PKG ?auto_7820 ?auto_7822 ?auto_7823 ?auto_7824 ?auto_7821 )
      ( DELIVER-4PKG-VERIFY ?auto_7820 ?auto_7822 ?auto_7823 ?auto_7824 ?auto_7821 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7834 - OBJ
      ?auto_7836 - OBJ
      ?auto_7837 - OBJ
      ?auto_7838 - OBJ
      ?auto_7835 - LOCATION
    )
    :vars
    (
      ?auto_7839 - LOCATION
      ?auto_7842 - CITY
      ?auto_7841 - LOCATION
      ?auto_7840 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7836 ?auto_7834 ) ( GREATER-THAN ?auto_7837 ?auto_7834 ) ( GREATER-THAN ?auto_7837 ?auto_7836 ) ( GREATER-THAN ?auto_7838 ?auto_7834 ) ( GREATER-THAN ?auto_7838 ?auto_7836 ) ( GREATER-THAN ?auto_7838 ?auto_7837 ) ( IN-CITY ?auto_7839 ?auto_7842 ) ( IN-CITY ?auto_7835 ?auto_7842 ) ( not ( = ?auto_7835 ?auto_7839 ) ) ( OBJ-AT ?auto_7838 ?auto_7839 ) ( OBJ-AT ?auto_7834 ?auto_7835 ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7834 ?auto_7837 ) ) ( not ( = ?auto_7834 ?auto_7838 ) ) ( not ( = ?auto_7836 ?auto_7837 ) ) ( not ( = ?auto_7836 ?auto_7838 ) ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( IN-CITY ?auto_7841 ?auto_7842 ) ( not ( = ?auto_7835 ?auto_7841 ) ) ( not ( = ?auto_7839 ?auto_7841 ) ) ( OBJ-AT ?auto_7837 ?auto_7841 ) ( IN-TRUCK ?auto_7836 ?auto_7840 ) ( TRUCK-AT ?auto_7840 ?auto_7839 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7840 ?auto_7839 ?auto_7835 ?auto_7842 )
      ( DELIVER-4PKG ?auto_7834 ?auto_7836 ?auto_7837 ?auto_7838 ?auto_7835 )
      ( DELIVER-4PKG-VERIFY ?auto_7834 ?auto_7836 ?auto_7837 ?auto_7838 ?auto_7835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7848 - OBJ
      ?auto_7850 - OBJ
      ?auto_7851 - OBJ
      ?auto_7852 - OBJ
      ?auto_7849 - LOCATION
    )
    :vars
    (
      ?auto_7854 - LOCATION
      ?auto_7856 - CITY
      ?auto_7853 - LOCATION
      ?auto_7855 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7850 ?auto_7848 ) ( GREATER-THAN ?auto_7851 ?auto_7848 ) ( GREATER-THAN ?auto_7851 ?auto_7850 ) ( GREATER-THAN ?auto_7852 ?auto_7848 ) ( GREATER-THAN ?auto_7852 ?auto_7850 ) ( GREATER-THAN ?auto_7852 ?auto_7851 ) ( IN-CITY ?auto_7854 ?auto_7856 ) ( IN-CITY ?auto_7849 ?auto_7856 ) ( not ( = ?auto_7849 ?auto_7854 ) ) ( OBJ-AT ?auto_7852 ?auto_7854 ) ( OBJ-AT ?auto_7848 ?auto_7849 ) ( not ( = ?auto_7848 ?auto_7850 ) ) ( not ( = ?auto_7848 ?auto_7851 ) ) ( not ( = ?auto_7848 ?auto_7852 ) ) ( not ( = ?auto_7850 ?auto_7851 ) ) ( not ( = ?auto_7850 ?auto_7852 ) ) ( not ( = ?auto_7851 ?auto_7852 ) ) ( IN-CITY ?auto_7853 ?auto_7856 ) ( not ( = ?auto_7849 ?auto_7853 ) ) ( not ( = ?auto_7854 ?auto_7853 ) ) ( OBJ-AT ?auto_7851 ?auto_7853 ) ( TRUCK-AT ?auto_7855 ?auto_7854 ) ( OBJ-AT ?auto_7850 ?auto_7854 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7850 ?auto_7855 ?auto_7854 )
      ( DELIVER-4PKG ?auto_7848 ?auto_7850 ?auto_7851 ?auto_7852 ?auto_7849 )
      ( DELIVER-4PKG-VERIFY ?auto_7848 ?auto_7850 ?auto_7851 ?auto_7852 ?auto_7849 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7862 - OBJ
      ?auto_7864 - OBJ
      ?auto_7865 - OBJ
      ?auto_7866 - OBJ
      ?auto_7863 - LOCATION
    )
    :vars
    (
      ?auto_7868 - LOCATION
      ?auto_7867 - CITY
      ?auto_7870 - LOCATION
      ?auto_7869 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7864 ?auto_7862 ) ( GREATER-THAN ?auto_7865 ?auto_7862 ) ( GREATER-THAN ?auto_7865 ?auto_7864 ) ( GREATER-THAN ?auto_7866 ?auto_7862 ) ( GREATER-THAN ?auto_7866 ?auto_7864 ) ( GREATER-THAN ?auto_7866 ?auto_7865 ) ( IN-CITY ?auto_7868 ?auto_7867 ) ( IN-CITY ?auto_7863 ?auto_7867 ) ( not ( = ?auto_7863 ?auto_7868 ) ) ( OBJ-AT ?auto_7866 ?auto_7868 ) ( OBJ-AT ?auto_7862 ?auto_7863 ) ( not ( = ?auto_7862 ?auto_7864 ) ) ( not ( = ?auto_7862 ?auto_7865 ) ) ( not ( = ?auto_7862 ?auto_7866 ) ) ( not ( = ?auto_7864 ?auto_7865 ) ) ( not ( = ?auto_7864 ?auto_7866 ) ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( IN-CITY ?auto_7870 ?auto_7867 ) ( not ( = ?auto_7863 ?auto_7870 ) ) ( not ( = ?auto_7868 ?auto_7870 ) ) ( OBJ-AT ?auto_7865 ?auto_7870 ) ( OBJ-AT ?auto_7864 ?auto_7868 ) ( TRUCK-AT ?auto_7869 ?auto_7863 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7869 ?auto_7863 ?auto_7868 ?auto_7867 )
      ( DELIVER-4PKG ?auto_7862 ?auto_7864 ?auto_7865 ?auto_7866 ?auto_7863 )
      ( DELIVER-4PKG-VERIFY ?auto_7862 ?auto_7864 ?auto_7865 ?auto_7866 ?auto_7863 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7876 - OBJ
      ?auto_7878 - OBJ
      ?auto_7879 - OBJ
      ?auto_7880 - OBJ
      ?auto_7877 - LOCATION
    )
    :vars
    (
      ?auto_7883 - LOCATION
      ?auto_7884 - CITY
      ?auto_7881 - LOCATION
      ?auto_7882 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7878 ?auto_7876 ) ( GREATER-THAN ?auto_7879 ?auto_7876 ) ( GREATER-THAN ?auto_7879 ?auto_7878 ) ( GREATER-THAN ?auto_7880 ?auto_7876 ) ( GREATER-THAN ?auto_7880 ?auto_7878 ) ( GREATER-THAN ?auto_7880 ?auto_7879 ) ( IN-CITY ?auto_7883 ?auto_7884 ) ( IN-CITY ?auto_7877 ?auto_7884 ) ( not ( = ?auto_7877 ?auto_7883 ) ) ( OBJ-AT ?auto_7880 ?auto_7883 ) ( not ( = ?auto_7876 ?auto_7878 ) ) ( not ( = ?auto_7876 ?auto_7879 ) ) ( not ( = ?auto_7876 ?auto_7880 ) ) ( not ( = ?auto_7878 ?auto_7879 ) ) ( not ( = ?auto_7878 ?auto_7880 ) ) ( not ( = ?auto_7879 ?auto_7880 ) ) ( IN-CITY ?auto_7881 ?auto_7884 ) ( not ( = ?auto_7877 ?auto_7881 ) ) ( not ( = ?auto_7883 ?auto_7881 ) ) ( OBJ-AT ?auto_7879 ?auto_7881 ) ( OBJ-AT ?auto_7878 ?auto_7883 ) ( TRUCK-AT ?auto_7882 ?auto_7877 ) ( IN-TRUCK ?auto_7876 ?auto_7882 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7876 ?auto_7877 )
      ( DELIVER-4PKG ?auto_7876 ?auto_7878 ?auto_7879 ?auto_7880 ?auto_7877 )
      ( DELIVER-4PKG-VERIFY ?auto_7876 ?auto_7878 ?auto_7879 ?auto_7880 ?auto_7877 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7890 - OBJ
      ?auto_7892 - OBJ
      ?auto_7893 - OBJ
      ?auto_7894 - OBJ
      ?auto_7891 - LOCATION
    )
    :vars
    (
      ?auto_7895 - LOCATION
      ?auto_7897 - CITY
      ?auto_7898 - LOCATION
      ?auto_7896 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7892 ?auto_7890 ) ( GREATER-THAN ?auto_7893 ?auto_7890 ) ( GREATER-THAN ?auto_7893 ?auto_7892 ) ( GREATER-THAN ?auto_7894 ?auto_7890 ) ( GREATER-THAN ?auto_7894 ?auto_7892 ) ( GREATER-THAN ?auto_7894 ?auto_7893 ) ( IN-CITY ?auto_7895 ?auto_7897 ) ( IN-CITY ?auto_7891 ?auto_7897 ) ( not ( = ?auto_7891 ?auto_7895 ) ) ( OBJ-AT ?auto_7894 ?auto_7895 ) ( not ( = ?auto_7890 ?auto_7892 ) ) ( not ( = ?auto_7890 ?auto_7893 ) ) ( not ( = ?auto_7890 ?auto_7894 ) ) ( not ( = ?auto_7892 ?auto_7893 ) ) ( not ( = ?auto_7892 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( IN-CITY ?auto_7898 ?auto_7897 ) ( not ( = ?auto_7891 ?auto_7898 ) ) ( not ( = ?auto_7895 ?auto_7898 ) ) ( OBJ-AT ?auto_7893 ?auto_7898 ) ( OBJ-AT ?auto_7892 ?auto_7895 ) ( IN-TRUCK ?auto_7890 ?auto_7896 ) ( TRUCK-AT ?auto_7896 ?auto_7898 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7896 ?auto_7898 ?auto_7891 ?auto_7897 )
      ( DELIVER-4PKG ?auto_7890 ?auto_7892 ?auto_7893 ?auto_7894 ?auto_7891 )
      ( DELIVER-4PKG-VERIFY ?auto_7890 ?auto_7892 ?auto_7893 ?auto_7894 ?auto_7891 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7904 - OBJ
      ?auto_7906 - OBJ
      ?auto_7907 - OBJ
      ?auto_7908 - OBJ
      ?auto_7905 - LOCATION
    )
    :vars
    (
      ?auto_7911 - LOCATION
      ?auto_7910 - CITY
      ?auto_7909 - LOCATION
      ?auto_7912 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7906 ?auto_7904 ) ( GREATER-THAN ?auto_7907 ?auto_7904 ) ( GREATER-THAN ?auto_7907 ?auto_7906 ) ( GREATER-THAN ?auto_7908 ?auto_7904 ) ( GREATER-THAN ?auto_7908 ?auto_7906 ) ( GREATER-THAN ?auto_7908 ?auto_7907 ) ( IN-CITY ?auto_7911 ?auto_7910 ) ( IN-CITY ?auto_7905 ?auto_7910 ) ( not ( = ?auto_7905 ?auto_7911 ) ) ( OBJ-AT ?auto_7908 ?auto_7911 ) ( not ( = ?auto_7904 ?auto_7906 ) ) ( not ( = ?auto_7904 ?auto_7907 ) ) ( not ( = ?auto_7904 ?auto_7908 ) ) ( not ( = ?auto_7906 ?auto_7907 ) ) ( not ( = ?auto_7906 ?auto_7908 ) ) ( not ( = ?auto_7907 ?auto_7908 ) ) ( IN-CITY ?auto_7909 ?auto_7910 ) ( not ( = ?auto_7905 ?auto_7909 ) ) ( not ( = ?auto_7911 ?auto_7909 ) ) ( OBJ-AT ?auto_7907 ?auto_7909 ) ( OBJ-AT ?auto_7906 ?auto_7911 ) ( TRUCK-AT ?auto_7912 ?auto_7909 ) ( OBJ-AT ?auto_7904 ?auto_7909 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7904 ?auto_7912 ?auto_7909 )
      ( DELIVER-4PKG ?auto_7904 ?auto_7906 ?auto_7907 ?auto_7908 ?auto_7905 )
      ( DELIVER-4PKG-VERIFY ?auto_7904 ?auto_7906 ?auto_7907 ?auto_7908 ?auto_7905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7918 - OBJ
      ?auto_7920 - OBJ
      ?auto_7921 - OBJ
      ?auto_7922 - OBJ
      ?auto_7919 - LOCATION
    )
    :vars
    (
      ?auto_7924 - LOCATION
      ?auto_7923 - CITY
      ?auto_7926 - LOCATION
      ?auto_7925 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7920 ?auto_7918 ) ( GREATER-THAN ?auto_7921 ?auto_7918 ) ( GREATER-THAN ?auto_7921 ?auto_7920 ) ( GREATER-THAN ?auto_7922 ?auto_7918 ) ( GREATER-THAN ?auto_7922 ?auto_7920 ) ( GREATER-THAN ?auto_7922 ?auto_7921 ) ( IN-CITY ?auto_7924 ?auto_7923 ) ( IN-CITY ?auto_7919 ?auto_7923 ) ( not ( = ?auto_7919 ?auto_7924 ) ) ( OBJ-AT ?auto_7922 ?auto_7924 ) ( not ( = ?auto_7918 ?auto_7920 ) ) ( not ( = ?auto_7918 ?auto_7921 ) ) ( not ( = ?auto_7918 ?auto_7922 ) ) ( not ( = ?auto_7920 ?auto_7921 ) ) ( not ( = ?auto_7920 ?auto_7922 ) ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( IN-CITY ?auto_7926 ?auto_7923 ) ( not ( = ?auto_7919 ?auto_7926 ) ) ( not ( = ?auto_7924 ?auto_7926 ) ) ( OBJ-AT ?auto_7921 ?auto_7926 ) ( OBJ-AT ?auto_7920 ?auto_7924 ) ( OBJ-AT ?auto_7918 ?auto_7926 ) ( TRUCK-AT ?auto_7925 ?auto_7919 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7925 ?auto_7919 ?auto_7926 ?auto_7923 )
      ( DELIVER-4PKG ?auto_7918 ?auto_7920 ?auto_7921 ?auto_7922 ?auto_7919 )
      ( DELIVER-4PKG-VERIFY ?auto_7918 ?auto_7920 ?auto_7921 ?auto_7922 ?auto_7919 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7959 - OBJ
      ?auto_7961 - OBJ
      ?auto_7962 - OBJ
      ?auto_7963 - OBJ
      ?auto_7964 - OBJ
      ?auto_7960 - LOCATION
    )
    :vars
    (
      ?auto_7965 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7961 ?auto_7959 ) ( GREATER-THAN ?auto_7962 ?auto_7959 ) ( GREATER-THAN ?auto_7962 ?auto_7961 ) ( GREATER-THAN ?auto_7963 ?auto_7959 ) ( GREATER-THAN ?auto_7963 ?auto_7961 ) ( GREATER-THAN ?auto_7963 ?auto_7962 ) ( GREATER-THAN ?auto_7964 ?auto_7959 ) ( GREATER-THAN ?auto_7964 ?auto_7961 ) ( GREATER-THAN ?auto_7964 ?auto_7962 ) ( GREATER-THAN ?auto_7964 ?auto_7963 ) ( TRUCK-AT ?auto_7965 ?auto_7960 ) ( IN-TRUCK ?auto_7964 ?auto_7965 ) ( OBJ-AT ?auto_7959 ?auto_7960 ) ( OBJ-AT ?auto_7961 ?auto_7960 ) ( OBJ-AT ?auto_7962 ?auto_7960 ) ( OBJ-AT ?auto_7963 ?auto_7960 ) ( not ( = ?auto_7959 ?auto_7961 ) ) ( not ( = ?auto_7959 ?auto_7962 ) ) ( not ( = ?auto_7959 ?auto_7963 ) ) ( not ( = ?auto_7959 ?auto_7964 ) ) ( not ( = ?auto_7961 ?auto_7962 ) ) ( not ( = ?auto_7961 ?auto_7963 ) ) ( not ( = ?auto_7961 ?auto_7964 ) ) ( not ( = ?auto_7962 ?auto_7963 ) ) ( not ( = ?auto_7962 ?auto_7964 ) ) ( not ( = ?auto_7963 ?auto_7964 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7964 ?auto_7960 )
      ( DELIVER-5PKG-VERIFY ?auto_7959 ?auto_7961 ?auto_7962 ?auto_7963 ?auto_7964 ?auto_7960 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7972 - OBJ
      ?auto_7974 - OBJ
      ?auto_7975 - OBJ
      ?auto_7976 - OBJ
      ?auto_7977 - OBJ
      ?auto_7973 - LOCATION
    )
    :vars
    (
      ?auto_7979 - TRUCK
      ?auto_7978 - LOCATION
      ?auto_7980 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7974 ?auto_7972 ) ( GREATER-THAN ?auto_7975 ?auto_7972 ) ( GREATER-THAN ?auto_7975 ?auto_7974 ) ( GREATER-THAN ?auto_7976 ?auto_7972 ) ( GREATER-THAN ?auto_7976 ?auto_7974 ) ( GREATER-THAN ?auto_7976 ?auto_7975 ) ( GREATER-THAN ?auto_7977 ?auto_7972 ) ( GREATER-THAN ?auto_7977 ?auto_7974 ) ( GREATER-THAN ?auto_7977 ?auto_7975 ) ( GREATER-THAN ?auto_7977 ?auto_7976 ) ( IN-TRUCK ?auto_7977 ?auto_7979 ) ( TRUCK-AT ?auto_7979 ?auto_7978 ) ( IN-CITY ?auto_7978 ?auto_7980 ) ( IN-CITY ?auto_7973 ?auto_7980 ) ( not ( = ?auto_7973 ?auto_7978 ) ) ( OBJ-AT ?auto_7972 ?auto_7973 ) ( OBJ-AT ?auto_7974 ?auto_7973 ) ( OBJ-AT ?auto_7975 ?auto_7973 ) ( OBJ-AT ?auto_7976 ?auto_7973 ) ( not ( = ?auto_7972 ?auto_7974 ) ) ( not ( = ?auto_7972 ?auto_7975 ) ) ( not ( = ?auto_7972 ?auto_7976 ) ) ( not ( = ?auto_7972 ?auto_7977 ) ) ( not ( = ?auto_7974 ?auto_7975 ) ) ( not ( = ?auto_7974 ?auto_7976 ) ) ( not ( = ?auto_7974 ?auto_7977 ) ) ( not ( = ?auto_7975 ?auto_7976 ) ) ( not ( = ?auto_7975 ?auto_7977 ) ) ( not ( = ?auto_7976 ?auto_7977 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7977 ?auto_7973 )
      ( DELIVER-5PKG-VERIFY ?auto_7972 ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7977 ?auto_7973 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_7987 - OBJ
      ?auto_7989 - OBJ
      ?auto_7990 - OBJ
      ?auto_7991 - OBJ
      ?auto_7992 - OBJ
      ?auto_7988 - LOCATION
    )
    :vars
    (
      ?auto_7995 - TRUCK
      ?auto_7993 - LOCATION
      ?auto_7994 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7989 ?auto_7987 ) ( GREATER-THAN ?auto_7990 ?auto_7987 ) ( GREATER-THAN ?auto_7990 ?auto_7989 ) ( GREATER-THAN ?auto_7991 ?auto_7987 ) ( GREATER-THAN ?auto_7991 ?auto_7989 ) ( GREATER-THAN ?auto_7991 ?auto_7990 ) ( GREATER-THAN ?auto_7992 ?auto_7987 ) ( GREATER-THAN ?auto_7992 ?auto_7989 ) ( GREATER-THAN ?auto_7992 ?auto_7990 ) ( GREATER-THAN ?auto_7992 ?auto_7991 ) ( TRUCK-AT ?auto_7995 ?auto_7993 ) ( IN-CITY ?auto_7993 ?auto_7994 ) ( IN-CITY ?auto_7988 ?auto_7994 ) ( not ( = ?auto_7988 ?auto_7993 ) ) ( OBJ-AT ?auto_7992 ?auto_7993 ) ( OBJ-AT ?auto_7987 ?auto_7988 ) ( OBJ-AT ?auto_7989 ?auto_7988 ) ( OBJ-AT ?auto_7990 ?auto_7988 ) ( OBJ-AT ?auto_7991 ?auto_7988 ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_7990 ) ) ( not ( = ?auto_7987 ?auto_7991 ) ) ( not ( = ?auto_7987 ?auto_7992 ) ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_7991 ) ) ( not ( = ?auto_7989 ?auto_7992 ) ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7990 ?auto_7992 ) ) ( not ( = ?auto_7991 ?auto_7992 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7992 ?auto_7988 )
      ( DELIVER-5PKG-VERIFY ?auto_7987 ?auto_7989 ?auto_7990 ?auto_7991 ?auto_7992 ?auto_7988 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8002 - OBJ
      ?auto_8004 - OBJ
      ?auto_8005 - OBJ
      ?auto_8006 - OBJ
      ?auto_8007 - OBJ
      ?auto_8003 - LOCATION
    )
    :vars
    (
      ?auto_8008 - LOCATION
      ?auto_8009 - CITY
      ?auto_8010 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8004 ?auto_8002 ) ( GREATER-THAN ?auto_8005 ?auto_8002 ) ( GREATER-THAN ?auto_8005 ?auto_8004 ) ( GREATER-THAN ?auto_8006 ?auto_8002 ) ( GREATER-THAN ?auto_8006 ?auto_8004 ) ( GREATER-THAN ?auto_8006 ?auto_8005 ) ( GREATER-THAN ?auto_8007 ?auto_8002 ) ( GREATER-THAN ?auto_8007 ?auto_8004 ) ( GREATER-THAN ?auto_8007 ?auto_8005 ) ( GREATER-THAN ?auto_8007 ?auto_8006 ) ( IN-CITY ?auto_8008 ?auto_8009 ) ( IN-CITY ?auto_8003 ?auto_8009 ) ( not ( = ?auto_8003 ?auto_8008 ) ) ( OBJ-AT ?auto_8007 ?auto_8008 ) ( TRUCK-AT ?auto_8010 ?auto_8003 ) ( OBJ-AT ?auto_8002 ?auto_8003 ) ( OBJ-AT ?auto_8004 ?auto_8003 ) ( OBJ-AT ?auto_8005 ?auto_8003 ) ( OBJ-AT ?auto_8006 ?auto_8003 ) ( not ( = ?auto_8002 ?auto_8004 ) ) ( not ( = ?auto_8002 ?auto_8005 ) ) ( not ( = ?auto_8002 ?auto_8006 ) ) ( not ( = ?auto_8002 ?auto_8007 ) ) ( not ( = ?auto_8004 ?auto_8005 ) ) ( not ( = ?auto_8004 ?auto_8006 ) ) ( not ( = ?auto_8004 ?auto_8007 ) ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8007 ) ) ( not ( = ?auto_8006 ?auto_8007 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8007 ?auto_8003 )
      ( DELIVER-5PKG-VERIFY ?auto_8002 ?auto_8004 ?auto_8005 ?auto_8006 ?auto_8007 ?auto_8003 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8017 - OBJ
      ?auto_8019 - OBJ
      ?auto_8020 - OBJ
      ?auto_8021 - OBJ
      ?auto_8022 - OBJ
      ?auto_8018 - LOCATION
    )
    :vars
    (
      ?auto_8024 - LOCATION
      ?auto_8025 - CITY
      ?auto_8023 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8019 ?auto_8017 ) ( GREATER-THAN ?auto_8020 ?auto_8017 ) ( GREATER-THAN ?auto_8020 ?auto_8019 ) ( GREATER-THAN ?auto_8021 ?auto_8017 ) ( GREATER-THAN ?auto_8021 ?auto_8019 ) ( GREATER-THAN ?auto_8021 ?auto_8020 ) ( GREATER-THAN ?auto_8022 ?auto_8017 ) ( GREATER-THAN ?auto_8022 ?auto_8019 ) ( GREATER-THAN ?auto_8022 ?auto_8020 ) ( GREATER-THAN ?auto_8022 ?auto_8021 ) ( IN-CITY ?auto_8024 ?auto_8025 ) ( IN-CITY ?auto_8018 ?auto_8025 ) ( not ( = ?auto_8018 ?auto_8024 ) ) ( OBJ-AT ?auto_8022 ?auto_8024 ) ( TRUCK-AT ?auto_8023 ?auto_8018 ) ( OBJ-AT ?auto_8017 ?auto_8018 ) ( OBJ-AT ?auto_8019 ?auto_8018 ) ( OBJ-AT ?auto_8020 ?auto_8018 ) ( not ( = ?auto_8017 ?auto_8019 ) ) ( not ( = ?auto_8017 ?auto_8020 ) ) ( not ( = ?auto_8017 ?auto_8021 ) ) ( not ( = ?auto_8017 ?auto_8022 ) ) ( not ( = ?auto_8019 ?auto_8020 ) ) ( not ( = ?auto_8019 ?auto_8021 ) ) ( not ( = ?auto_8019 ?auto_8022 ) ) ( not ( = ?auto_8020 ?auto_8021 ) ) ( not ( = ?auto_8020 ?auto_8022 ) ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( IN-TRUCK ?auto_8021 ?auto_8023 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8021 ?auto_8018 )
      ( DELIVER-5PKG ?auto_8017 ?auto_8019 ?auto_8020 ?auto_8021 ?auto_8022 ?auto_8018 )
      ( DELIVER-5PKG-VERIFY ?auto_8017 ?auto_8019 ?auto_8020 ?auto_8021 ?auto_8022 ?auto_8018 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8032 - OBJ
      ?auto_8034 - OBJ
      ?auto_8035 - OBJ
      ?auto_8036 - OBJ
      ?auto_8037 - OBJ
      ?auto_8033 - LOCATION
    )
    :vars
    (
      ?auto_8038 - LOCATION
      ?auto_8039 - CITY
      ?auto_8040 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8034 ?auto_8032 ) ( GREATER-THAN ?auto_8035 ?auto_8032 ) ( GREATER-THAN ?auto_8035 ?auto_8034 ) ( GREATER-THAN ?auto_8036 ?auto_8032 ) ( GREATER-THAN ?auto_8036 ?auto_8034 ) ( GREATER-THAN ?auto_8036 ?auto_8035 ) ( GREATER-THAN ?auto_8037 ?auto_8032 ) ( GREATER-THAN ?auto_8037 ?auto_8034 ) ( GREATER-THAN ?auto_8037 ?auto_8035 ) ( GREATER-THAN ?auto_8037 ?auto_8036 ) ( IN-CITY ?auto_8038 ?auto_8039 ) ( IN-CITY ?auto_8033 ?auto_8039 ) ( not ( = ?auto_8033 ?auto_8038 ) ) ( OBJ-AT ?auto_8037 ?auto_8038 ) ( OBJ-AT ?auto_8032 ?auto_8033 ) ( OBJ-AT ?auto_8034 ?auto_8033 ) ( OBJ-AT ?auto_8035 ?auto_8033 ) ( not ( = ?auto_8032 ?auto_8034 ) ) ( not ( = ?auto_8032 ?auto_8035 ) ) ( not ( = ?auto_8032 ?auto_8036 ) ) ( not ( = ?auto_8032 ?auto_8037 ) ) ( not ( = ?auto_8034 ?auto_8035 ) ) ( not ( = ?auto_8034 ?auto_8036 ) ) ( not ( = ?auto_8034 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( IN-TRUCK ?auto_8036 ?auto_8040 ) ( TRUCK-AT ?auto_8040 ?auto_8038 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8040 ?auto_8038 ?auto_8033 ?auto_8039 )
      ( DELIVER-5PKG ?auto_8032 ?auto_8034 ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8033 )
      ( DELIVER-5PKG-VERIFY ?auto_8032 ?auto_8034 ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8033 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8047 - OBJ
      ?auto_8049 - OBJ
      ?auto_8050 - OBJ
      ?auto_8051 - OBJ
      ?auto_8052 - OBJ
      ?auto_8048 - LOCATION
    )
    :vars
    (
      ?auto_8054 - LOCATION
      ?auto_8053 - CITY
      ?auto_8055 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8049 ?auto_8047 ) ( GREATER-THAN ?auto_8050 ?auto_8047 ) ( GREATER-THAN ?auto_8050 ?auto_8049 ) ( GREATER-THAN ?auto_8051 ?auto_8047 ) ( GREATER-THAN ?auto_8051 ?auto_8049 ) ( GREATER-THAN ?auto_8051 ?auto_8050 ) ( GREATER-THAN ?auto_8052 ?auto_8047 ) ( GREATER-THAN ?auto_8052 ?auto_8049 ) ( GREATER-THAN ?auto_8052 ?auto_8050 ) ( GREATER-THAN ?auto_8052 ?auto_8051 ) ( IN-CITY ?auto_8054 ?auto_8053 ) ( IN-CITY ?auto_8048 ?auto_8053 ) ( not ( = ?auto_8048 ?auto_8054 ) ) ( OBJ-AT ?auto_8052 ?auto_8054 ) ( OBJ-AT ?auto_8047 ?auto_8048 ) ( OBJ-AT ?auto_8049 ?auto_8048 ) ( OBJ-AT ?auto_8050 ?auto_8048 ) ( not ( = ?auto_8047 ?auto_8049 ) ) ( not ( = ?auto_8047 ?auto_8050 ) ) ( not ( = ?auto_8047 ?auto_8051 ) ) ( not ( = ?auto_8047 ?auto_8052 ) ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( not ( = ?auto_8049 ?auto_8052 ) ) ( not ( = ?auto_8050 ?auto_8051 ) ) ( not ( = ?auto_8050 ?auto_8052 ) ) ( not ( = ?auto_8051 ?auto_8052 ) ) ( TRUCK-AT ?auto_8055 ?auto_8054 ) ( OBJ-AT ?auto_8051 ?auto_8054 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8051 ?auto_8055 ?auto_8054 )
      ( DELIVER-5PKG ?auto_8047 ?auto_8049 ?auto_8050 ?auto_8051 ?auto_8052 ?auto_8048 )
      ( DELIVER-5PKG-VERIFY ?auto_8047 ?auto_8049 ?auto_8050 ?auto_8051 ?auto_8052 ?auto_8048 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8062 - OBJ
      ?auto_8064 - OBJ
      ?auto_8065 - OBJ
      ?auto_8066 - OBJ
      ?auto_8067 - OBJ
      ?auto_8063 - LOCATION
    )
    :vars
    (
      ?auto_8068 - LOCATION
      ?auto_8069 - CITY
      ?auto_8070 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8064 ?auto_8062 ) ( GREATER-THAN ?auto_8065 ?auto_8062 ) ( GREATER-THAN ?auto_8065 ?auto_8064 ) ( GREATER-THAN ?auto_8066 ?auto_8062 ) ( GREATER-THAN ?auto_8066 ?auto_8064 ) ( GREATER-THAN ?auto_8066 ?auto_8065 ) ( GREATER-THAN ?auto_8067 ?auto_8062 ) ( GREATER-THAN ?auto_8067 ?auto_8064 ) ( GREATER-THAN ?auto_8067 ?auto_8065 ) ( GREATER-THAN ?auto_8067 ?auto_8066 ) ( IN-CITY ?auto_8068 ?auto_8069 ) ( IN-CITY ?auto_8063 ?auto_8069 ) ( not ( = ?auto_8063 ?auto_8068 ) ) ( OBJ-AT ?auto_8067 ?auto_8068 ) ( OBJ-AT ?auto_8062 ?auto_8063 ) ( OBJ-AT ?auto_8064 ?auto_8063 ) ( OBJ-AT ?auto_8065 ?auto_8063 ) ( not ( = ?auto_8062 ?auto_8064 ) ) ( not ( = ?auto_8062 ?auto_8065 ) ) ( not ( = ?auto_8062 ?auto_8066 ) ) ( not ( = ?auto_8062 ?auto_8067 ) ) ( not ( = ?auto_8064 ?auto_8065 ) ) ( not ( = ?auto_8064 ?auto_8066 ) ) ( not ( = ?auto_8064 ?auto_8067 ) ) ( not ( = ?auto_8065 ?auto_8066 ) ) ( not ( = ?auto_8065 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( OBJ-AT ?auto_8066 ?auto_8068 ) ( TRUCK-AT ?auto_8070 ?auto_8063 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8070 ?auto_8063 ?auto_8068 ?auto_8069 )
      ( DELIVER-5PKG ?auto_8062 ?auto_8064 ?auto_8065 ?auto_8066 ?auto_8067 ?auto_8063 )
      ( DELIVER-5PKG-VERIFY ?auto_8062 ?auto_8064 ?auto_8065 ?auto_8066 ?auto_8067 ?auto_8063 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8077 - OBJ
      ?auto_8079 - OBJ
      ?auto_8080 - OBJ
      ?auto_8081 - OBJ
      ?auto_8082 - OBJ
      ?auto_8078 - LOCATION
    )
    :vars
    (
      ?auto_8085 - LOCATION
      ?auto_8084 - CITY
      ?auto_8083 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8079 ?auto_8077 ) ( GREATER-THAN ?auto_8080 ?auto_8077 ) ( GREATER-THAN ?auto_8080 ?auto_8079 ) ( GREATER-THAN ?auto_8081 ?auto_8077 ) ( GREATER-THAN ?auto_8081 ?auto_8079 ) ( GREATER-THAN ?auto_8081 ?auto_8080 ) ( GREATER-THAN ?auto_8082 ?auto_8077 ) ( GREATER-THAN ?auto_8082 ?auto_8079 ) ( GREATER-THAN ?auto_8082 ?auto_8080 ) ( GREATER-THAN ?auto_8082 ?auto_8081 ) ( IN-CITY ?auto_8085 ?auto_8084 ) ( IN-CITY ?auto_8078 ?auto_8084 ) ( not ( = ?auto_8078 ?auto_8085 ) ) ( OBJ-AT ?auto_8082 ?auto_8085 ) ( OBJ-AT ?auto_8077 ?auto_8078 ) ( OBJ-AT ?auto_8079 ?auto_8078 ) ( not ( = ?auto_8077 ?auto_8079 ) ) ( not ( = ?auto_8077 ?auto_8080 ) ) ( not ( = ?auto_8077 ?auto_8081 ) ) ( not ( = ?auto_8077 ?auto_8082 ) ) ( not ( = ?auto_8079 ?auto_8080 ) ) ( not ( = ?auto_8079 ?auto_8081 ) ) ( not ( = ?auto_8079 ?auto_8082 ) ) ( not ( = ?auto_8080 ?auto_8081 ) ) ( not ( = ?auto_8080 ?auto_8082 ) ) ( not ( = ?auto_8081 ?auto_8082 ) ) ( OBJ-AT ?auto_8081 ?auto_8085 ) ( TRUCK-AT ?auto_8083 ?auto_8078 ) ( IN-TRUCK ?auto_8080 ?auto_8083 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8080 ?auto_8078 )
      ( DELIVER-5PKG ?auto_8077 ?auto_8079 ?auto_8080 ?auto_8081 ?auto_8082 ?auto_8078 )
      ( DELIVER-5PKG-VERIFY ?auto_8077 ?auto_8079 ?auto_8080 ?auto_8081 ?auto_8082 ?auto_8078 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8092 - OBJ
      ?auto_8094 - OBJ
      ?auto_8095 - OBJ
      ?auto_8096 - OBJ
      ?auto_8097 - OBJ
      ?auto_8093 - LOCATION
    )
    :vars
    (
      ?auto_8100 - LOCATION
      ?auto_8098 - CITY
      ?auto_8099 - TRUCK
      ?auto_8101 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8094 ?auto_8092 ) ( GREATER-THAN ?auto_8095 ?auto_8092 ) ( GREATER-THAN ?auto_8095 ?auto_8094 ) ( GREATER-THAN ?auto_8096 ?auto_8092 ) ( GREATER-THAN ?auto_8096 ?auto_8094 ) ( GREATER-THAN ?auto_8096 ?auto_8095 ) ( GREATER-THAN ?auto_8097 ?auto_8092 ) ( GREATER-THAN ?auto_8097 ?auto_8094 ) ( GREATER-THAN ?auto_8097 ?auto_8095 ) ( GREATER-THAN ?auto_8097 ?auto_8096 ) ( IN-CITY ?auto_8100 ?auto_8098 ) ( IN-CITY ?auto_8093 ?auto_8098 ) ( not ( = ?auto_8093 ?auto_8100 ) ) ( OBJ-AT ?auto_8097 ?auto_8100 ) ( OBJ-AT ?auto_8092 ?auto_8093 ) ( OBJ-AT ?auto_8094 ?auto_8093 ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8092 ?auto_8095 ) ) ( not ( = ?auto_8092 ?auto_8096 ) ) ( not ( = ?auto_8092 ?auto_8097 ) ) ( not ( = ?auto_8094 ?auto_8095 ) ) ( not ( = ?auto_8094 ?auto_8096 ) ) ( not ( = ?auto_8094 ?auto_8097 ) ) ( not ( = ?auto_8095 ?auto_8096 ) ) ( not ( = ?auto_8095 ?auto_8097 ) ) ( not ( = ?auto_8096 ?auto_8097 ) ) ( OBJ-AT ?auto_8096 ?auto_8100 ) ( IN-TRUCK ?auto_8095 ?auto_8099 ) ( TRUCK-AT ?auto_8099 ?auto_8101 ) ( IN-CITY ?auto_8101 ?auto_8098 ) ( not ( = ?auto_8093 ?auto_8101 ) ) ( not ( = ?auto_8100 ?auto_8101 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8099 ?auto_8101 ?auto_8093 ?auto_8098 )
      ( DELIVER-5PKG ?auto_8092 ?auto_8094 ?auto_8095 ?auto_8096 ?auto_8097 ?auto_8093 )
      ( DELIVER-5PKG-VERIFY ?auto_8092 ?auto_8094 ?auto_8095 ?auto_8096 ?auto_8097 ?auto_8093 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8108 - OBJ
      ?auto_8110 - OBJ
      ?auto_8111 - OBJ
      ?auto_8112 - OBJ
      ?auto_8113 - OBJ
      ?auto_8109 - LOCATION
    )
    :vars
    (
      ?auto_8116 - LOCATION
      ?auto_8115 - CITY
      ?auto_8114 - TRUCK
      ?auto_8117 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8110 ?auto_8108 ) ( GREATER-THAN ?auto_8111 ?auto_8108 ) ( GREATER-THAN ?auto_8111 ?auto_8110 ) ( GREATER-THAN ?auto_8112 ?auto_8108 ) ( GREATER-THAN ?auto_8112 ?auto_8110 ) ( GREATER-THAN ?auto_8112 ?auto_8111 ) ( GREATER-THAN ?auto_8113 ?auto_8108 ) ( GREATER-THAN ?auto_8113 ?auto_8110 ) ( GREATER-THAN ?auto_8113 ?auto_8111 ) ( GREATER-THAN ?auto_8113 ?auto_8112 ) ( IN-CITY ?auto_8116 ?auto_8115 ) ( IN-CITY ?auto_8109 ?auto_8115 ) ( not ( = ?auto_8109 ?auto_8116 ) ) ( OBJ-AT ?auto_8113 ?auto_8116 ) ( OBJ-AT ?auto_8108 ?auto_8109 ) ( OBJ-AT ?auto_8110 ?auto_8109 ) ( not ( = ?auto_8108 ?auto_8110 ) ) ( not ( = ?auto_8108 ?auto_8111 ) ) ( not ( = ?auto_8108 ?auto_8112 ) ) ( not ( = ?auto_8108 ?auto_8113 ) ) ( not ( = ?auto_8110 ?auto_8111 ) ) ( not ( = ?auto_8110 ?auto_8112 ) ) ( not ( = ?auto_8110 ?auto_8113 ) ) ( not ( = ?auto_8111 ?auto_8112 ) ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8112 ?auto_8113 ) ) ( OBJ-AT ?auto_8112 ?auto_8116 ) ( TRUCK-AT ?auto_8114 ?auto_8117 ) ( IN-CITY ?auto_8117 ?auto_8115 ) ( not ( = ?auto_8109 ?auto_8117 ) ) ( not ( = ?auto_8116 ?auto_8117 ) ) ( OBJ-AT ?auto_8111 ?auto_8117 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8111 ?auto_8114 ?auto_8117 )
      ( DELIVER-5PKG ?auto_8108 ?auto_8110 ?auto_8111 ?auto_8112 ?auto_8113 ?auto_8109 )
      ( DELIVER-5PKG-VERIFY ?auto_8108 ?auto_8110 ?auto_8111 ?auto_8112 ?auto_8113 ?auto_8109 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8124 - OBJ
      ?auto_8126 - OBJ
      ?auto_8127 - OBJ
      ?auto_8128 - OBJ
      ?auto_8129 - OBJ
      ?auto_8125 - LOCATION
    )
    :vars
    (
      ?auto_8133 - LOCATION
      ?auto_8130 - CITY
      ?auto_8132 - LOCATION
      ?auto_8131 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8126 ?auto_8124 ) ( GREATER-THAN ?auto_8127 ?auto_8124 ) ( GREATER-THAN ?auto_8127 ?auto_8126 ) ( GREATER-THAN ?auto_8128 ?auto_8124 ) ( GREATER-THAN ?auto_8128 ?auto_8126 ) ( GREATER-THAN ?auto_8128 ?auto_8127 ) ( GREATER-THAN ?auto_8129 ?auto_8124 ) ( GREATER-THAN ?auto_8129 ?auto_8126 ) ( GREATER-THAN ?auto_8129 ?auto_8127 ) ( GREATER-THAN ?auto_8129 ?auto_8128 ) ( IN-CITY ?auto_8133 ?auto_8130 ) ( IN-CITY ?auto_8125 ?auto_8130 ) ( not ( = ?auto_8125 ?auto_8133 ) ) ( OBJ-AT ?auto_8129 ?auto_8133 ) ( OBJ-AT ?auto_8124 ?auto_8125 ) ( OBJ-AT ?auto_8126 ?auto_8125 ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8128 ) ) ( not ( = ?auto_8124 ?auto_8129 ) ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8126 ?auto_8128 ) ) ( not ( = ?auto_8126 ?auto_8129 ) ) ( not ( = ?auto_8127 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8129 ) ) ( not ( = ?auto_8128 ?auto_8129 ) ) ( OBJ-AT ?auto_8128 ?auto_8133 ) ( IN-CITY ?auto_8132 ?auto_8130 ) ( not ( = ?auto_8125 ?auto_8132 ) ) ( not ( = ?auto_8133 ?auto_8132 ) ) ( OBJ-AT ?auto_8127 ?auto_8132 ) ( TRUCK-AT ?auto_8131 ?auto_8125 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8131 ?auto_8125 ?auto_8132 ?auto_8130 )
      ( DELIVER-5PKG ?auto_8124 ?auto_8126 ?auto_8127 ?auto_8128 ?auto_8129 ?auto_8125 )
      ( DELIVER-5PKG-VERIFY ?auto_8124 ?auto_8126 ?auto_8127 ?auto_8128 ?auto_8129 ?auto_8125 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8140 - OBJ
      ?auto_8142 - OBJ
      ?auto_8143 - OBJ
      ?auto_8144 - OBJ
      ?auto_8145 - OBJ
      ?auto_8141 - LOCATION
    )
    :vars
    (
      ?auto_8148 - LOCATION
      ?auto_8146 - CITY
      ?auto_8149 - LOCATION
      ?auto_8147 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8142 ?auto_8140 ) ( GREATER-THAN ?auto_8143 ?auto_8140 ) ( GREATER-THAN ?auto_8143 ?auto_8142 ) ( GREATER-THAN ?auto_8144 ?auto_8140 ) ( GREATER-THAN ?auto_8144 ?auto_8142 ) ( GREATER-THAN ?auto_8144 ?auto_8143 ) ( GREATER-THAN ?auto_8145 ?auto_8140 ) ( GREATER-THAN ?auto_8145 ?auto_8142 ) ( GREATER-THAN ?auto_8145 ?auto_8143 ) ( GREATER-THAN ?auto_8145 ?auto_8144 ) ( IN-CITY ?auto_8148 ?auto_8146 ) ( IN-CITY ?auto_8141 ?auto_8146 ) ( not ( = ?auto_8141 ?auto_8148 ) ) ( OBJ-AT ?auto_8145 ?auto_8148 ) ( OBJ-AT ?auto_8140 ?auto_8141 ) ( not ( = ?auto_8140 ?auto_8142 ) ) ( not ( = ?auto_8140 ?auto_8143 ) ) ( not ( = ?auto_8140 ?auto_8144 ) ) ( not ( = ?auto_8140 ?auto_8145 ) ) ( not ( = ?auto_8142 ?auto_8143 ) ) ( not ( = ?auto_8142 ?auto_8144 ) ) ( not ( = ?auto_8142 ?auto_8145 ) ) ( not ( = ?auto_8143 ?auto_8144 ) ) ( not ( = ?auto_8143 ?auto_8145 ) ) ( not ( = ?auto_8144 ?auto_8145 ) ) ( OBJ-AT ?auto_8144 ?auto_8148 ) ( IN-CITY ?auto_8149 ?auto_8146 ) ( not ( = ?auto_8141 ?auto_8149 ) ) ( not ( = ?auto_8148 ?auto_8149 ) ) ( OBJ-AT ?auto_8143 ?auto_8149 ) ( TRUCK-AT ?auto_8147 ?auto_8141 ) ( IN-TRUCK ?auto_8142 ?auto_8147 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8142 ?auto_8141 )
      ( DELIVER-5PKG ?auto_8140 ?auto_8142 ?auto_8143 ?auto_8144 ?auto_8145 ?auto_8141 )
      ( DELIVER-5PKG-VERIFY ?auto_8140 ?auto_8142 ?auto_8143 ?auto_8144 ?auto_8145 ?auto_8141 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8156 - OBJ
      ?auto_8158 - OBJ
      ?auto_8159 - OBJ
      ?auto_8160 - OBJ
      ?auto_8161 - OBJ
      ?auto_8157 - LOCATION
    )
    :vars
    (
      ?auto_8164 - LOCATION
      ?auto_8163 - CITY
      ?auto_8162 - LOCATION
      ?auto_8165 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8158 ?auto_8156 ) ( GREATER-THAN ?auto_8159 ?auto_8156 ) ( GREATER-THAN ?auto_8159 ?auto_8158 ) ( GREATER-THAN ?auto_8160 ?auto_8156 ) ( GREATER-THAN ?auto_8160 ?auto_8158 ) ( GREATER-THAN ?auto_8160 ?auto_8159 ) ( GREATER-THAN ?auto_8161 ?auto_8156 ) ( GREATER-THAN ?auto_8161 ?auto_8158 ) ( GREATER-THAN ?auto_8161 ?auto_8159 ) ( GREATER-THAN ?auto_8161 ?auto_8160 ) ( IN-CITY ?auto_8164 ?auto_8163 ) ( IN-CITY ?auto_8157 ?auto_8163 ) ( not ( = ?auto_8157 ?auto_8164 ) ) ( OBJ-AT ?auto_8161 ?auto_8164 ) ( OBJ-AT ?auto_8156 ?auto_8157 ) ( not ( = ?auto_8156 ?auto_8158 ) ) ( not ( = ?auto_8156 ?auto_8159 ) ) ( not ( = ?auto_8156 ?auto_8160 ) ) ( not ( = ?auto_8156 ?auto_8161 ) ) ( not ( = ?auto_8158 ?auto_8159 ) ) ( not ( = ?auto_8158 ?auto_8160 ) ) ( not ( = ?auto_8158 ?auto_8161 ) ) ( not ( = ?auto_8159 ?auto_8160 ) ) ( not ( = ?auto_8159 ?auto_8161 ) ) ( not ( = ?auto_8160 ?auto_8161 ) ) ( OBJ-AT ?auto_8160 ?auto_8164 ) ( IN-CITY ?auto_8162 ?auto_8163 ) ( not ( = ?auto_8157 ?auto_8162 ) ) ( not ( = ?auto_8164 ?auto_8162 ) ) ( OBJ-AT ?auto_8159 ?auto_8162 ) ( IN-TRUCK ?auto_8158 ?auto_8165 ) ( TRUCK-AT ?auto_8165 ?auto_8164 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8165 ?auto_8164 ?auto_8157 ?auto_8163 )
      ( DELIVER-5PKG ?auto_8156 ?auto_8158 ?auto_8159 ?auto_8160 ?auto_8161 ?auto_8157 )
      ( DELIVER-5PKG-VERIFY ?auto_8156 ?auto_8158 ?auto_8159 ?auto_8160 ?auto_8161 ?auto_8157 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8172 - OBJ
      ?auto_8174 - OBJ
      ?auto_8175 - OBJ
      ?auto_8176 - OBJ
      ?auto_8177 - OBJ
      ?auto_8173 - LOCATION
    )
    :vars
    (
      ?auto_8180 - LOCATION
      ?auto_8179 - CITY
      ?auto_8181 - LOCATION
      ?auto_8178 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8174 ?auto_8172 ) ( GREATER-THAN ?auto_8175 ?auto_8172 ) ( GREATER-THAN ?auto_8175 ?auto_8174 ) ( GREATER-THAN ?auto_8176 ?auto_8172 ) ( GREATER-THAN ?auto_8176 ?auto_8174 ) ( GREATER-THAN ?auto_8176 ?auto_8175 ) ( GREATER-THAN ?auto_8177 ?auto_8172 ) ( GREATER-THAN ?auto_8177 ?auto_8174 ) ( GREATER-THAN ?auto_8177 ?auto_8175 ) ( GREATER-THAN ?auto_8177 ?auto_8176 ) ( IN-CITY ?auto_8180 ?auto_8179 ) ( IN-CITY ?auto_8173 ?auto_8179 ) ( not ( = ?auto_8173 ?auto_8180 ) ) ( OBJ-AT ?auto_8177 ?auto_8180 ) ( OBJ-AT ?auto_8172 ?auto_8173 ) ( not ( = ?auto_8172 ?auto_8174 ) ) ( not ( = ?auto_8172 ?auto_8175 ) ) ( not ( = ?auto_8172 ?auto_8176 ) ) ( not ( = ?auto_8172 ?auto_8177 ) ) ( not ( = ?auto_8174 ?auto_8175 ) ) ( not ( = ?auto_8174 ?auto_8176 ) ) ( not ( = ?auto_8174 ?auto_8177 ) ) ( not ( = ?auto_8175 ?auto_8176 ) ) ( not ( = ?auto_8175 ?auto_8177 ) ) ( not ( = ?auto_8176 ?auto_8177 ) ) ( OBJ-AT ?auto_8176 ?auto_8180 ) ( IN-CITY ?auto_8181 ?auto_8179 ) ( not ( = ?auto_8173 ?auto_8181 ) ) ( not ( = ?auto_8180 ?auto_8181 ) ) ( OBJ-AT ?auto_8175 ?auto_8181 ) ( TRUCK-AT ?auto_8178 ?auto_8180 ) ( OBJ-AT ?auto_8174 ?auto_8180 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8174 ?auto_8178 ?auto_8180 )
      ( DELIVER-5PKG ?auto_8172 ?auto_8174 ?auto_8175 ?auto_8176 ?auto_8177 ?auto_8173 )
      ( DELIVER-5PKG-VERIFY ?auto_8172 ?auto_8174 ?auto_8175 ?auto_8176 ?auto_8177 ?auto_8173 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8188 - OBJ
      ?auto_8190 - OBJ
      ?auto_8191 - OBJ
      ?auto_8192 - OBJ
      ?auto_8193 - OBJ
      ?auto_8189 - LOCATION
    )
    :vars
    (
      ?auto_8195 - LOCATION
      ?auto_8194 - CITY
      ?auto_8197 - LOCATION
      ?auto_8196 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8190 ?auto_8188 ) ( GREATER-THAN ?auto_8191 ?auto_8188 ) ( GREATER-THAN ?auto_8191 ?auto_8190 ) ( GREATER-THAN ?auto_8192 ?auto_8188 ) ( GREATER-THAN ?auto_8192 ?auto_8190 ) ( GREATER-THAN ?auto_8192 ?auto_8191 ) ( GREATER-THAN ?auto_8193 ?auto_8188 ) ( GREATER-THAN ?auto_8193 ?auto_8190 ) ( GREATER-THAN ?auto_8193 ?auto_8191 ) ( GREATER-THAN ?auto_8193 ?auto_8192 ) ( IN-CITY ?auto_8195 ?auto_8194 ) ( IN-CITY ?auto_8189 ?auto_8194 ) ( not ( = ?auto_8189 ?auto_8195 ) ) ( OBJ-AT ?auto_8193 ?auto_8195 ) ( OBJ-AT ?auto_8188 ?auto_8189 ) ( not ( = ?auto_8188 ?auto_8190 ) ) ( not ( = ?auto_8188 ?auto_8191 ) ) ( not ( = ?auto_8188 ?auto_8192 ) ) ( not ( = ?auto_8188 ?auto_8193 ) ) ( not ( = ?auto_8190 ?auto_8191 ) ) ( not ( = ?auto_8190 ?auto_8192 ) ) ( not ( = ?auto_8190 ?auto_8193 ) ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( OBJ-AT ?auto_8192 ?auto_8195 ) ( IN-CITY ?auto_8197 ?auto_8194 ) ( not ( = ?auto_8189 ?auto_8197 ) ) ( not ( = ?auto_8195 ?auto_8197 ) ) ( OBJ-AT ?auto_8191 ?auto_8197 ) ( OBJ-AT ?auto_8190 ?auto_8195 ) ( TRUCK-AT ?auto_8196 ?auto_8189 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8196 ?auto_8189 ?auto_8195 ?auto_8194 )
      ( DELIVER-5PKG ?auto_8188 ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8189 )
      ( DELIVER-5PKG-VERIFY ?auto_8188 ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8204 - OBJ
      ?auto_8206 - OBJ
      ?auto_8207 - OBJ
      ?auto_8208 - OBJ
      ?auto_8209 - OBJ
      ?auto_8205 - LOCATION
    )
    :vars
    (
      ?auto_8212 - LOCATION
      ?auto_8210 - CITY
      ?auto_8211 - LOCATION
      ?auto_8213 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8206 ?auto_8204 ) ( GREATER-THAN ?auto_8207 ?auto_8204 ) ( GREATER-THAN ?auto_8207 ?auto_8206 ) ( GREATER-THAN ?auto_8208 ?auto_8204 ) ( GREATER-THAN ?auto_8208 ?auto_8206 ) ( GREATER-THAN ?auto_8208 ?auto_8207 ) ( GREATER-THAN ?auto_8209 ?auto_8204 ) ( GREATER-THAN ?auto_8209 ?auto_8206 ) ( GREATER-THAN ?auto_8209 ?auto_8207 ) ( GREATER-THAN ?auto_8209 ?auto_8208 ) ( IN-CITY ?auto_8212 ?auto_8210 ) ( IN-CITY ?auto_8205 ?auto_8210 ) ( not ( = ?auto_8205 ?auto_8212 ) ) ( OBJ-AT ?auto_8209 ?auto_8212 ) ( not ( = ?auto_8204 ?auto_8206 ) ) ( not ( = ?auto_8204 ?auto_8207 ) ) ( not ( = ?auto_8204 ?auto_8208 ) ) ( not ( = ?auto_8204 ?auto_8209 ) ) ( not ( = ?auto_8206 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8208 ) ) ( not ( = ?auto_8206 ?auto_8209 ) ) ( not ( = ?auto_8207 ?auto_8208 ) ) ( not ( = ?auto_8207 ?auto_8209 ) ) ( not ( = ?auto_8208 ?auto_8209 ) ) ( OBJ-AT ?auto_8208 ?auto_8212 ) ( IN-CITY ?auto_8211 ?auto_8210 ) ( not ( = ?auto_8205 ?auto_8211 ) ) ( not ( = ?auto_8212 ?auto_8211 ) ) ( OBJ-AT ?auto_8207 ?auto_8211 ) ( OBJ-AT ?auto_8206 ?auto_8212 ) ( TRUCK-AT ?auto_8213 ?auto_8205 ) ( IN-TRUCK ?auto_8204 ?auto_8213 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8204 ?auto_8205 )
      ( DELIVER-5PKG ?auto_8204 ?auto_8206 ?auto_8207 ?auto_8208 ?auto_8209 ?auto_8205 )
      ( DELIVER-5PKG-VERIFY ?auto_8204 ?auto_8206 ?auto_8207 ?auto_8208 ?auto_8209 ?auto_8205 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8220 - OBJ
      ?auto_8222 - OBJ
      ?auto_8223 - OBJ
      ?auto_8224 - OBJ
      ?auto_8225 - OBJ
      ?auto_8221 - LOCATION
    )
    :vars
    (
      ?auto_8229 - LOCATION
      ?auto_8226 - CITY
      ?auto_8227 - LOCATION
      ?auto_8228 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8222 ?auto_8220 ) ( GREATER-THAN ?auto_8223 ?auto_8220 ) ( GREATER-THAN ?auto_8223 ?auto_8222 ) ( GREATER-THAN ?auto_8224 ?auto_8220 ) ( GREATER-THAN ?auto_8224 ?auto_8222 ) ( GREATER-THAN ?auto_8224 ?auto_8223 ) ( GREATER-THAN ?auto_8225 ?auto_8220 ) ( GREATER-THAN ?auto_8225 ?auto_8222 ) ( GREATER-THAN ?auto_8225 ?auto_8223 ) ( GREATER-THAN ?auto_8225 ?auto_8224 ) ( IN-CITY ?auto_8229 ?auto_8226 ) ( IN-CITY ?auto_8221 ?auto_8226 ) ( not ( = ?auto_8221 ?auto_8229 ) ) ( OBJ-AT ?auto_8225 ?auto_8229 ) ( not ( = ?auto_8220 ?auto_8222 ) ) ( not ( = ?auto_8220 ?auto_8223 ) ) ( not ( = ?auto_8220 ?auto_8224 ) ) ( not ( = ?auto_8220 ?auto_8225 ) ) ( not ( = ?auto_8222 ?auto_8223 ) ) ( not ( = ?auto_8222 ?auto_8224 ) ) ( not ( = ?auto_8222 ?auto_8225 ) ) ( not ( = ?auto_8223 ?auto_8224 ) ) ( not ( = ?auto_8223 ?auto_8225 ) ) ( not ( = ?auto_8224 ?auto_8225 ) ) ( OBJ-AT ?auto_8224 ?auto_8229 ) ( IN-CITY ?auto_8227 ?auto_8226 ) ( not ( = ?auto_8221 ?auto_8227 ) ) ( not ( = ?auto_8229 ?auto_8227 ) ) ( OBJ-AT ?auto_8223 ?auto_8227 ) ( OBJ-AT ?auto_8222 ?auto_8229 ) ( IN-TRUCK ?auto_8220 ?auto_8228 ) ( TRUCK-AT ?auto_8228 ?auto_8227 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8228 ?auto_8227 ?auto_8221 ?auto_8226 )
      ( DELIVER-5PKG ?auto_8220 ?auto_8222 ?auto_8223 ?auto_8224 ?auto_8225 ?auto_8221 )
      ( DELIVER-5PKG-VERIFY ?auto_8220 ?auto_8222 ?auto_8223 ?auto_8224 ?auto_8225 ?auto_8221 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8236 - OBJ
      ?auto_8238 - OBJ
      ?auto_8239 - OBJ
      ?auto_8240 - OBJ
      ?auto_8241 - OBJ
      ?auto_8237 - LOCATION
    )
    :vars
    (
      ?auto_8244 - LOCATION
      ?auto_8243 - CITY
      ?auto_8245 - LOCATION
      ?auto_8242 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8238 ?auto_8236 ) ( GREATER-THAN ?auto_8239 ?auto_8236 ) ( GREATER-THAN ?auto_8239 ?auto_8238 ) ( GREATER-THAN ?auto_8240 ?auto_8236 ) ( GREATER-THAN ?auto_8240 ?auto_8238 ) ( GREATER-THAN ?auto_8240 ?auto_8239 ) ( GREATER-THAN ?auto_8241 ?auto_8236 ) ( GREATER-THAN ?auto_8241 ?auto_8238 ) ( GREATER-THAN ?auto_8241 ?auto_8239 ) ( GREATER-THAN ?auto_8241 ?auto_8240 ) ( IN-CITY ?auto_8244 ?auto_8243 ) ( IN-CITY ?auto_8237 ?auto_8243 ) ( not ( = ?auto_8237 ?auto_8244 ) ) ( OBJ-AT ?auto_8241 ?auto_8244 ) ( not ( = ?auto_8236 ?auto_8238 ) ) ( not ( = ?auto_8236 ?auto_8239 ) ) ( not ( = ?auto_8236 ?auto_8240 ) ) ( not ( = ?auto_8236 ?auto_8241 ) ) ( not ( = ?auto_8238 ?auto_8239 ) ) ( not ( = ?auto_8238 ?auto_8240 ) ) ( not ( = ?auto_8238 ?auto_8241 ) ) ( not ( = ?auto_8239 ?auto_8240 ) ) ( not ( = ?auto_8239 ?auto_8241 ) ) ( not ( = ?auto_8240 ?auto_8241 ) ) ( OBJ-AT ?auto_8240 ?auto_8244 ) ( IN-CITY ?auto_8245 ?auto_8243 ) ( not ( = ?auto_8237 ?auto_8245 ) ) ( not ( = ?auto_8244 ?auto_8245 ) ) ( OBJ-AT ?auto_8239 ?auto_8245 ) ( OBJ-AT ?auto_8238 ?auto_8244 ) ( TRUCK-AT ?auto_8242 ?auto_8245 ) ( OBJ-AT ?auto_8236 ?auto_8245 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8236 ?auto_8242 ?auto_8245 )
      ( DELIVER-5PKG ?auto_8236 ?auto_8238 ?auto_8239 ?auto_8240 ?auto_8241 ?auto_8237 )
      ( DELIVER-5PKG-VERIFY ?auto_8236 ?auto_8238 ?auto_8239 ?auto_8240 ?auto_8241 ?auto_8237 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8252 - OBJ
      ?auto_8254 - OBJ
      ?auto_8255 - OBJ
      ?auto_8256 - OBJ
      ?auto_8257 - OBJ
      ?auto_8253 - LOCATION
    )
    :vars
    (
      ?auto_8258 - LOCATION
      ?auto_8260 - CITY
      ?auto_8261 - LOCATION
      ?auto_8259 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8254 ?auto_8252 ) ( GREATER-THAN ?auto_8255 ?auto_8252 ) ( GREATER-THAN ?auto_8255 ?auto_8254 ) ( GREATER-THAN ?auto_8256 ?auto_8252 ) ( GREATER-THAN ?auto_8256 ?auto_8254 ) ( GREATER-THAN ?auto_8256 ?auto_8255 ) ( GREATER-THAN ?auto_8257 ?auto_8252 ) ( GREATER-THAN ?auto_8257 ?auto_8254 ) ( GREATER-THAN ?auto_8257 ?auto_8255 ) ( GREATER-THAN ?auto_8257 ?auto_8256 ) ( IN-CITY ?auto_8258 ?auto_8260 ) ( IN-CITY ?auto_8253 ?auto_8260 ) ( not ( = ?auto_8253 ?auto_8258 ) ) ( OBJ-AT ?auto_8257 ?auto_8258 ) ( not ( = ?auto_8252 ?auto_8254 ) ) ( not ( = ?auto_8252 ?auto_8255 ) ) ( not ( = ?auto_8252 ?auto_8256 ) ) ( not ( = ?auto_8252 ?auto_8257 ) ) ( not ( = ?auto_8254 ?auto_8255 ) ) ( not ( = ?auto_8254 ?auto_8256 ) ) ( not ( = ?auto_8254 ?auto_8257 ) ) ( not ( = ?auto_8255 ?auto_8256 ) ) ( not ( = ?auto_8255 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8257 ) ) ( OBJ-AT ?auto_8256 ?auto_8258 ) ( IN-CITY ?auto_8261 ?auto_8260 ) ( not ( = ?auto_8253 ?auto_8261 ) ) ( not ( = ?auto_8258 ?auto_8261 ) ) ( OBJ-AT ?auto_8255 ?auto_8261 ) ( OBJ-AT ?auto_8254 ?auto_8258 ) ( OBJ-AT ?auto_8252 ?auto_8261 ) ( TRUCK-AT ?auto_8259 ?auto_8253 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8259 ?auto_8253 ?auto_8261 ?auto_8260 )
      ( DELIVER-5PKG ?auto_8252 ?auto_8254 ?auto_8255 ?auto_8256 ?auto_8257 ?auto_8253 )
      ( DELIVER-5PKG-VERIFY ?auto_8252 ?auto_8254 ?auto_8255 ?auto_8256 ?auto_8257 ?auto_8253 ) )
  )

)

