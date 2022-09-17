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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_406 - OBJ
      ?auto_407 - LOCATION
    )
    :vars
    (
      ?auto_408 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_408 ?auto_407 ) ( IN-TRUCK ?auto_406 ?auto_408 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_406 ?auto_408 ?auto_407 )
      ( DELIVER-1PKG-VERIFY ?auto_406 ?auto_407 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_417 - OBJ
      ?auto_418 - LOCATION
    )
    :vars
    (
      ?auto_419 - TRUCK
      ?auto_423 - LOCATION
      ?auto_424 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_417 ?auto_419 ) ( TRUCK-AT ?auto_419 ?auto_423 ) ( IN-CITY ?auto_423 ?auto_424 ) ( IN-CITY ?auto_418 ?auto_424 ) ( not ( = ?auto_418 ?auto_423 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_419 ?auto_423 ?auto_418 ?auto_424 )
      ( DELIVER-1PKG ?auto_417 ?auto_418 )
      ( DELIVER-1PKG-VERIFY ?auto_417 ?auto_418 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_434 - OBJ
      ?auto_435 - LOCATION
    )
    :vars
    (
      ?auto_437 - TRUCK
      ?auto_440 - LOCATION
      ?auto_439 - CITY
      ?auto_442 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_437 ?auto_440 ) ( IN-CITY ?auto_440 ?auto_439 ) ( IN-CITY ?auto_435 ?auto_439 ) ( not ( = ?auto_435 ?auto_440 ) ) ( TRUCK-AT ?auto_437 ?auto_442 ) ( OBJ-AT ?auto_434 ?auto_442 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_434 ?auto_437 ?auto_442 )
      ( DELIVER-1PKG ?auto_434 ?auto_435 )
      ( DELIVER-1PKG-VERIFY ?auto_434 ?auto_435 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_453 - OBJ
      ?auto_454 - LOCATION
    )
    :vars
    (
      ?auto_458 - LOCATION
      ?auto_460 - CITY
      ?auto_459 - TRUCK
      ?auto_462 - LOCATION
      ?auto_463 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_458 ?auto_460 ) ( IN-CITY ?auto_454 ?auto_460 ) ( not ( = ?auto_454 ?auto_458 ) ) ( OBJ-AT ?auto_453 ?auto_458 ) ( TRUCK-AT ?auto_459 ?auto_462 ) ( IN-CITY ?auto_462 ?auto_463 ) ( IN-CITY ?auto_458 ?auto_463 ) ( not ( = ?auto_458 ?auto_462 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_459 ?auto_462 ?auto_458 ?auto_463 )
      ( DELIVER-1PKG ?auto_453 ?auto_454 )
      ( DELIVER-1PKG-VERIFY ?auto_453 ?auto_454 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_491 - OBJ
      ?auto_493 - OBJ
      ?auto_492 - LOCATION
    )
    :vars
    (
      ?auto_494 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_493 ?auto_491 ) ( TRUCK-AT ?auto_494 ?auto_492 ) ( IN-TRUCK ?auto_493 ?auto_494 ) ( OBJ-AT ?auto_491 ?auto_492 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_493 ?auto_492 )
      ( DELIVER-2PKG-VERIFY ?auto_491 ?auto_493 ?auto_492 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_518 - OBJ
      ?auto_520 - OBJ
      ?auto_519 - LOCATION
    )
    :vars
    (
      ?auto_522 - TRUCK
      ?auto_521 - LOCATION
      ?auto_524 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_520 ?auto_518 ) ( IN-TRUCK ?auto_520 ?auto_522 ) ( TRUCK-AT ?auto_522 ?auto_521 ) ( IN-CITY ?auto_521 ?auto_524 ) ( IN-CITY ?auto_519 ?auto_524 ) ( not ( = ?auto_519 ?auto_521 ) ) ( OBJ-AT ?auto_518 ?auto_519 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_520 ?auto_519 )
      ( DELIVER-2PKG-VERIFY ?auto_518 ?auto_520 ?auto_519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_544 - OBJ
      ?auto_545 - LOCATION
    )
    :vars
    (
      ?auto_551 - OBJ
      ?auto_547 - TRUCK
      ?auto_549 - LOCATION
      ?auto_546 - CITY
      ?auto_553 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_544 ?auto_551 ) ( TRUCK-AT ?auto_547 ?auto_549 ) ( IN-CITY ?auto_549 ?auto_546 ) ( IN-CITY ?auto_545 ?auto_546 ) ( not ( = ?auto_545 ?auto_549 ) ) ( OBJ-AT ?auto_551 ?auto_545 ) ( TRUCK-AT ?auto_547 ?auto_553 ) ( OBJ-AT ?auto_544 ?auto_553 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_544 ?auto_547 ?auto_553 )
      ( DELIVER-2PKG ?auto_551 ?auto_544 ?auto_545 )
      ( DELIVER-1PKG-VERIFY ?auto_544 ?auto_545 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_555 - OBJ
      ?auto_557 - OBJ
      ?auto_556 - LOCATION
    )
    :vars
    (
      ?auto_559 - OBJ
      ?auto_564 - TRUCK
      ?auto_558 - LOCATION
      ?auto_560 - CITY
      ?auto_562 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_557 ?auto_555 ) ( GREATER-THAN ?auto_557 ?auto_559 ) ( TRUCK-AT ?auto_564 ?auto_558 ) ( IN-CITY ?auto_558 ?auto_560 ) ( IN-CITY ?auto_556 ?auto_560 ) ( not ( = ?auto_556 ?auto_558 ) ) ( OBJ-AT ?auto_559 ?auto_556 ) ( TRUCK-AT ?auto_564 ?auto_562 ) ( OBJ-AT ?auto_557 ?auto_562 ) ( OBJ-AT ?auto_555 ?auto_556 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_557 ?auto_556 )
      ( DELIVER-2PKG-VERIFY ?auto_555 ?auto_557 ?auto_556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_587 - OBJ
      ?auto_588 - LOCATION
    )
    :vars
    (
      ?auto_593 - OBJ
      ?auto_590 - OBJ
      ?auto_594 - LOCATION
      ?auto_595 - CITY
      ?auto_596 - TRUCK
      ?auto_598 - LOCATION
      ?auto_599 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_587 ?auto_593 ) ( GREATER-THAN ?auto_587 ?auto_590 ) ( IN-CITY ?auto_594 ?auto_595 ) ( IN-CITY ?auto_588 ?auto_595 ) ( not ( = ?auto_588 ?auto_594 ) ) ( OBJ-AT ?auto_590 ?auto_588 ) ( OBJ-AT ?auto_587 ?auto_594 ) ( OBJ-AT ?auto_593 ?auto_588 ) ( TRUCK-AT ?auto_596 ?auto_598 ) ( IN-CITY ?auto_598 ?auto_599 ) ( IN-CITY ?auto_594 ?auto_599 ) ( not ( = ?auto_594 ?auto_598 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_596 ?auto_598 ?auto_594 ?auto_599 )
      ( DELIVER-2PKG ?auto_593 ?auto_587 ?auto_588 )
      ( DELIVER-1PKG-VERIFY ?auto_587 ?auto_588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_601 - OBJ
      ?auto_603 - OBJ
      ?auto_602 - LOCATION
    )
    :vars
    (
      ?auto_611 - OBJ
      ?auto_612 - OBJ
      ?auto_604 - LOCATION
      ?auto_605 - CITY
      ?auto_606 - TRUCK
      ?auto_609 - LOCATION
      ?auto_610 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_603 ?auto_601 ) ( GREATER-THAN ?auto_603 ?auto_611 ) ( GREATER-THAN ?auto_603 ?auto_612 ) ( IN-CITY ?auto_604 ?auto_605 ) ( IN-CITY ?auto_602 ?auto_605 ) ( not ( = ?auto_602 ?auto_604 ) ) ( OBJ-AT ?auto_612 ?auto_602 ) ( OBJ-AT ?auto_603 ?auto_604 ) ( OBJ-AT ?auto_611 ?auto_602 ) ( TRUCK-AT ?auto_606 ?auto_609 ) ( IN-CITY ?auto_609 ?auto_610 ) ( IN-CITY ?auto_604 ?auto_610 ) ( not ( = ?auto_604 ?auto_609 ) ) ( OBJ-AT ?auto_601 ?auto_602 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_603 ?auto_602 )
      ( DELIVER-2PKG-VERIFY ?auto_601 ?auto_603 ?auto_602 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_639 - OBJ
      ?auto_640 - LOCATION
    )
    :vars
    (
      ?auto_649 - OBJ
      ?auto_650 - LOCATION
      ?auto_644 - CITY
      ?auto_642 - TRUCK
      ?auto_643 - LOCATION
      ?auto_647 - CITY
      ?auto_651 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_639 ?auto_649 ) ( IN-CITY ?auto_650 ?auto_644 ) ( IN-CITY ?auto_640 ?auto_644 ) ( not ( = ?auto_640 ?auto_650 ) ) ( OBJ-AT ?auto_639 ?auto_650 ) ( TRUCK-AT ?auto_642 ?auto_643 ) ( IN-CITY ?auto_643 ?auto_647 ) ( IN-CITY ?auto_650 ?auto_647 ) ( not ( = ?auto_650 ?auto_643 ) ) ( TRUCK-AT ?auto_651 ?auto_640 ) ( IN-TRUCK ?auto_649 ?auto_651 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_649 ?auto_640 )
      ( DELIVER-2PKG ?auto_649 ?auto_639 ?auto_640 )
      ( DELIVER-1PKG-VERIFY ?auto_639 ?auto_640 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_654 - OBJ
      ?auto_656 - OBJ
      ?auto_655 - LOCATION
    )
    :vars
    (
      ?auto_657 - LOCATION
      ?auto_661 - CITY
      ?auto_662 - TRUCK
      ?auto_658 - LOCATION
      ?auto_660 - CITY
      ?auto_665 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_656 ?auto_654 ) ( IN-CITY ?auto_657 ?auto_661 ) ( IN-CITY ?auto_655 ?auto_661 ) ( not ( = ?auto_655 ?auto_657 ) ) ( OBJ-AT ?auto_656 ?auto_657 ) ( TRUCK-AT ?auto_662 ?auto_658 ) ( IN-CITY ?auto_658 ?auto_660 ) ( IN-CITY ?auto_657 ?auto_660 ) ( not ( = ?auto_657 ?auto_658 ) ) ( TRUCK-AT ?auto_665 ?auto_655 ) ( IN-TRUCK ?auto_654 ?auto_665 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_656 ?auto_655 )
      ( DELIVER-2PKG-VERIFY ?auto_654 ?auto_656 ?auto_655 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_690 - OBJ
      ?auto_691 - LOCATION
    )
    :vars
    (
      ?auto_697 - OBJ
      ?auto_693 - LOCATION
      ?auto_695 - CITY
      ?auto_696 - CITY
      ?auto_692 - TRUCK
      ?auto_702 - LOCATION
      ?auto_703 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_690 ?auto_697 ) ( IN-CITY ?auto_693 ?auto_695 ) ( IN-CITY ?auto_691 ?auto_695 ) ( not ( = ?auto_691 ?auto_693 ) ) ( OBJ-AT ?auto_690 ?auto_693 ) ( IN-CITY ?auto_691 ?auto_696 ) ( IN-CITY ?auto_693 ?auto_696 ) ( IN-TRUCK ?auto_697 ?auto_692 ) ( TRUCK-AT ?auto_692 ?auto_702 ) ( IN-CITY ?auto_702 ?auto_703 ) ( IN-CITY ?auto_691 ?auto_703 ) ( not ( = ?auto_691 ?auto_702 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_692 ?auto_702 ?auto_691 ?auto_703 )
      ( DELIVER-2PKG ?auto_697 ?auto_690 ?auto_691 )
      ( DELIVER-1PKG-VERIFY ?auto_690 ?auto_691 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_705 - OBJ
      ?auto_707 - OBJ
      ?auto_706 - LOCATION
    )
    :vars
    (
      ?auto_711 - LOCATION
      ?auto_710 - CITY
      ?auto_712 - CITY
      ?auto_708 - TRUCK
      ?auto_715 - LOCATION
      ?auto_716 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_707 ?auto_705 ) ( IN-CITY ?auto_711 ?auto_710 ) ( IN-CITY ?auto_706 ?auto_710 ) ( not ( = ?auto_706 ?auto_711 ) ) ( OBJ-AT ?auto_707 ?auto_711 ) ( IN-CITY ?auto_706 ?auto_712 ) ( IN-CITY ?auto_711 ?auto_712 ) ( IN-TRUCK ?auto_705 ?auto_708 ) ( TRUCK-AT ?auto_708 ?auto_715 ) ( IN-CITY ?auto_715 ?auto_716 ) ( IN-CITY ?auto_706 ?auto_716 ) ( not ( = ?auto_706 ?auto_715 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_707 ?auto_706 )
      ( DELIVER-2PKG-VERIFY ?auto_705 ?auto_707 ?auto_706 ) )
  )

)

