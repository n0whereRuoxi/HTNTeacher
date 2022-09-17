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
      ?auto_476 - OBJ
      ?auto_475 - LOCATION
    )
    :vars
    (
      ?auto_477 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_477 ?auto_475 ) ( IN-TRUCK ?auto_476 ?auto_477 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_476 ?auto_477 ?auto_475 )
      ( DELIVER-1PKG-VERIFY ?auto_476 ?auto_475 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_483 - OBJ
      ?auto_482 - LOCATION
    )
    :vars
    (
      ?auto_484 - TRUCK
      ?auto_485 - LOCATION
      ?auto_486 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_483 ?auto_484 ) ( TRUCK-AT ?auto_484 ?auto_485 ) ( IN-CITY ?auto_485 ?auto_486 ) ( IN-CITY ?auto_482 ?auto_486 ) ( not ( = ?auto_482 ?auto_485 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_484 ?auto_485 ?auto_482 ?auto_486 )
      ( DELIVER-1PKG ?auto_483 ?auto_482 )
      ( DELIVER-1PKG-VERIFY ?auto_483 ?auto_482 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_494 - OBJ
      ?auto_493 - LOCATION
    )
    :vars
    (
      ?auto_495 - TRUCK
      ?auto_497 - LOCATION
      ?auto_496 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_495 ?auto_497 ) ( IN-CITY ?auto_497 ?auto_496 ) ( IN-CITY ?auto_493 ?auto_496 ) ( not ( = ?auto_493 ?auto_497 ) ) ( OBJ-AT ?auto_494 ?auto_497 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_494 ?auto_495 ?auto_497 )
      ( DELIVER-1PKG ?auto_494 ?auto_493 )
      ( DELIVER-1PKG-VERIFY ?auto_494 ?auto_493 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_505 - OBJ
      ?auto_504 - LOCATION
    )
    :vars
    (
      ?auto_508 - LOCATION
      ?auto_507 - CITY
      ?auto_506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_508 ?auto_507 ) ( IN-CITY ?auto_504 ?auto_507 ) ( not ( = ?auto_504 ?auto_508 ) ) ( OBJ-AT ?auto_505 ?auto_508 ) ( TRUCK-AT ?auto_506 ?auto_504 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_506 ?auto_504 ?auto_508 ?auto_507 )
      ( DELIVER-1PKG ?auto_505 ?auto_504 )
      ( DELIVER-1PKG-VERIFY ?auto_505 ?auto_504 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_530 - OBJ
      ?auto_531 - OBJ
      ?auto_529 - LOCATION
    )
    :vars
    (
      ?auto_532 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_532 ?auto_529 ) ( IN-TRUCK ?auto_531 ?auto_532 ) ( OBJ-AT ?auto_530 ?auto_529 ) ( not ( = ?auto_530 ?auto_531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_531 ?auto_529 )
      ( DELIVER-2PKG-VERIFY ?auto_530 ?auto_531 ?auto_529 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_534 - OBJ
      ?auto_535 - OBJ
      ?auto_533 - LOCATION
    )
    :vars
    (
      ?auto_536 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_536 ?auto_533 ) ( IN-TRUCK ?auto_534 ?auto_536 ) ( OBJ-AT ?auto_535 ?auto_533 ) ( not ( = ?auto_534 ?auto_535 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_534 ?auto_533 )
      ( DELIVER-2PKG-VERIFY ?auto_534 ?auto_535 ?auto_533 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_547 - OBJ
      ?auto_548 - OBJ
      ?auto_546 - LOCATION
    )
    :vars
    (
      ?auto_551 - TRUCK
      ?auto_550 - LOCATION
      ?auto_549 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_548 ?auto_551 ) ( TRUCK-AT ?auto_551 ?auto_550 ) ( IN-CITY ?auto_550 ?auto_549 ) ( IN-CITY ?auto_546 ?auto_549 ) ( not ( = ?auto_546 ?auto_550 ) ) ( OBJ-AT ?auto_547 ?auto_546 ) ( not ( = ?auto_547 ?auto_548 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_548 ?auto_546 )
      ( DELIVER-2PKG-VERIFY ?auto_547 ?auto_548 ?auto_546 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_553 - OBJ
      ?auto_554 - OBJ
      ?auto_552 - LOCATION
    )
    :vars
    (
      ?auto_555 - TRUCK
      ?auto_557 - LOCATION
      ?auto_556 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_553 ?auto_555 ) ( TRUCK-AT ?auto_555 ?auto_557 ) ( IN-CITY ?auto_557 ?auto_556 ) ( IN-CITY ?auto_552 ?auto_556 ) ( not ( = ?auto_552 ?auto_557 ) ) ( OBJ-AT ?auto_554 ?auto_552 ) ( not ( = ?auto_554 ?auto_553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_554 ?auto_553 ?auto_552 )
      ( DELIVER-2PKG-VERIFY ?auto_553 ?auto_554 ?auto_552 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_566 - OBJ
      ?auto_565 - LOCATION
    )
    :vars
    (
      ?auto_567 - TRUCK
      ?auto_569 - LOCATION
      ?auto_568 - CITY
      ?auto_570 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_567 ?auto_569 ) ( IN-CITY ?auto_569 ?auto_568 ) ( IN-CITY ?auto_565 ?auto_568 ) ( not ( = ?auto_565 ?auto_569 ) ) ( OBJ-AT ?auto_570 ?auto_565 ) ( not ( = ?auto_570 ?auto_566 ) ) ( OBJ-AT ?auto_566 ?auto_569 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_566 ?auto_567 ?auto_569 )
      ( DELIVER-2PKG ?auto_570 ?auto_566 ?auto_565 )
      ( DELIVER-1PKG-VERIFY ?auto_566 ?auto_565 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_572 - OBJ
      ?auto_573 - OBJ
      ?auto_571 - LOCATION
    )
    :vars
    (
      ?auto_574 - TRUCK
      ?auto_575 - LOCATION
      ?auto_576 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_574 ?auto_575 ) ( IN-CITY ?auto_575 ?auto_576 ) ( IN-CITY ?auto_571 ?auto_576 ) ( not ( = ?auto_571 ?auto_575 ) ) ( OBJ-AT ?auto_572 ?auto_571 ) ( not ( = ?auto_572 ?auto_573 ) ) ( OBJ-AT ?auto_573 ?auto_575 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_573 ?auto_571 )
      ( DELIVER-2PKG-VERIFY ?auto_572 ?auto_573 ?auto_571 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_578 - OBJ
      ?auto_579 - OBJ
      ?auto_577 - LOCATION
    )
    :vars
    (
      ?auto_581 - TRUCK
      ?auto_582 - LOCATION
      ?auto_580 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_581 ?auto_582 ) ( IN-CITY ?auto_582 ?auto_580 ) ( IN-CITY ?auto_577 ?auto_580 ) ( not ( = ?auto_577 ?auto_582 ) ) ( OBJ-AT ?auto_579 ?auto_577 ) ( not ( = ?auto_579 ?auto_578 ) ) ( OBJ-AT ?auto_578 ?auto_582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_579 ?auto_578 ?auto_577 )
      ( DELIVER-2PKG-VERIFY ?auto_578 ?auto_579 ?auto_577 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_591 - OBJ
      ?auto_590 - LOCATION
    )
    :vars
    (
      ?auto_595 - LOCATION
      ?auto_592 - CITY
      ?auto_593 - OBJ
      ?auto_594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_595 ?auto_592 ) ( IN-CITY ?auto_590 ?auto_592 ) ( not ( = ?auto_590 ?auto_595 ) ) ( OBJ-AT ?auto_593 ?auto_590 ) ( not ( = ?auto_593 ?auto_591 ) ) ( OBJ-AT ?auto_591 ?auto_595 ) ( TRUCK-AT ?auto_594 ?auto_590 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_594 ?auto_590 ?auto_595 ?auto_592 )
      ( DELIVER-2PKG ?auto_593 ?auto_591 ?auto_590 )
      ( DELIVER-1PKG-VERIFY ?auto_591 ?auto_590 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_597 - OBJ
      ?auto_598 - OBJ
      ?auto_596 - LOCATION
    )
    :vars
    (
      ?auto_601 - LOCATION
      ?auto_600 - CITY
      ?auto_599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_601 ?auto_600 ) ( IN-CITY ?auto_596 ?auto_600 ) ( not ( = ?auto_596 ?auto_601 ) ) ( OBJ-AT ?auto_597 ?auto_596 ) ( not ( = ?auto_597 ?auto_598 ) ) ( OBJ-AT ?auto_598 ?auto_601 ) ( TRUCK-AT ?auto_599 ?auto_596 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_598 ?auto_596 )
      ( DELIVER-2PKG-VERIFY ?auto_597 ?auto_598 ?auto_596 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_603 - OBJ
      ?auto_604 - OBJ
      ?auto_602 - LOCATION
    )
    :vars
    (
      ?auto_605 - LOCATION
      ?auto_606 - CITY
      ?auto_607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_605 ?auto_606 ) ( IN-CITY ?auto_602 ?auto_606 ) ( not ( = ?auto_602 ?auto_605 ) ) ( OBJ-AT ?auto_604 ?auto_602 ) ( not ( = ?auto_604 ?auto_603 ) ) ( OBJ-AT ?auto_603 ?auto_605 ) ( TRUCK-AT ?auto_607 ?auto_602 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_604 ?auto_603 ?auto_602 )
      ( DELIVER-2PKG-VERIFY ?auto_603 ?auto_604 ?auto_602 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_616 - OBJ
      ?auto_615 - LOCATION
    )
    :vars
    (
      ?auto_617 - LOCATION
      ?auto_618 - CITY
      ?auto_620 - OBJ
      ?auto_619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_617 ?auto_618 ) ( IN-CITY ?auto_615 ?auto_618 ) ( not ( = ?auto_615 ?auto_617 ) ) ( not ( = ?auto_620 ?auto_616 ) ) ( OBJ-AT ?auto_616 ?auto_617 ) ( TRUCK-AT ?auto_619 ?auto_615 ) ( IN-TRUCK ?auto_620 ?auto_619 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_620 ?auto_615 )
      ( DELIVER-2PKG ?auto_620 ?auto_616 ?auto_615 )
      ( DELIVER-1PKG-VERIFY ?auto_616 ?auto_615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_622 - OBJ
      ?auto_623 - OBJ
      ?auto_621 - LOCATION
    )
    :vars
    (
      ?auto_625 - LOCATION
      ?auto_624 - CITY
      ?auto_626 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_625 ?auto_624 ) ( IN-CITY ?auto_621 ?auto_624 ) ( not ( = ?auto_621 ?auto_625 ) ) ( not ( = ?auto_622 ?auto_623 ) ) ( OBJ-AT ?auto_623 ?auto_625 ) ( TRUCK-AT ?auto_626 ?auto_621 ) ( IN-TRUCK ?auto_622 ?auto_626 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_623 ?auto_621 )
      ( DELIVER-2PKG-VERIFY ?auto_622 ?auto_623 ?auto_621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_628 - OBJ
      ?auto_629 - OBJ
      ?auto_627 - LOCATION
    )
    :vars
    (
      ?auto_632 - LOCATION
      ?auto_630 - CITY
      ?auto_631 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632 ?auto_630 ) ( IN-CITY ?auto_627 ?auto_630 ) ( not ( = ?auto_627 ?auto_632 ) ) ( not ( = ?auto_629 ?auto_628 ) ) ( OBJ-AT ?auto_628 ?auto_632 ) ( TRUCK-AT ?auto_631 ?auto_627 ) ( IN-TRUCK ?auto_629 ?auto_631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_629 ?auto_628 ?auto_627 )
      ( DELIVER-2PKG-VERIFY ?auto_628 ?auto_629 ?auto_627 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_641 - OBJ
      ?auto_640 - LOCATION
    )
    :vars
    (
      ?auto_644 - LOCATION
      ?auto_642 - CITY
      ?auto_645 - OBJ
      ?auto_643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_644 ?auto_642 ) ( IN-CITY ?auto_640 ?auto_642 ) ( not ( = ?auto_640 ?auto_644 ) ) ( not ( = ?auto_645 ?auto_641 ) ) ( OBJ-AT ?auto_641 ?auto_644 ) ( IN-TRUCK ?auto_645 ?auto_643 ) ( TRUCK-AT ?auto_643 ?auto_644 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_643 ?auto_644 ?auto_640 ?auto_642 )
      ( DELIVER-2PKG ?auto_645 ?auto_641 ?auto_640 )
      ( DELIVER-1PKG-VERIFY ?auto_641 ?auto_640 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_647 - OBJ
      ?auto_648 - OBJ
      ?auto_646 - LOCATION
    )
    :vars
    (
      ?auto_650 - LOCATION
      ?auto_651 - CITY
      ?auto_649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_650 ?auto_651 ) ( IN-CITY ?auto_646 ?auto_651 ) ( not ( = ?auto_646 ?auto_650 ) ) ( not ( = ?auto_647 ?auto_648 ) ) ( OBJ-AT ?auto_648 ?auto_650 ) ( IN-TRUCK ?auto_647 ?auto_649 ) ( TRUCK-AT ?auto_649 ?auto_650 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_648 ?auto_646 )
      ( DELIVER-2PKG-VERIFY ?auto_647 ?auto_648 ?auto_646 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_653 - OBJ
      ?auto_654 - OBJ
      ?auto_652 - LOCATION
    )
    :vars
    (
      ?auto_656 - LOCATION
      ?auto_655 - CITY
      ?auto_657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_656 ?auto_655 ) ( IN-CITY ?auto_652 ?auto_655 ) ( not ( = ?auto_652 ?auto_656 ) ) ( not ( = ?auto_654 ?auto_653 ) ) ( OBJ-AT ?auto_653 ?auto_656 ) ( IN-TRUCK ?auto_654 ?auto_657 ) ( TRUCK-AT ?auto_657 ?auto_656 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_654 ?auto_653 ?auto_652 )
      ( DELIVER-2PKG-VERIFY ?auto_653 ?auto_654 ?auto_652 ) )
  )

)

