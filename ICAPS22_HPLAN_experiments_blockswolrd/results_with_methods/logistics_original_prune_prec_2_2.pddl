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
      ?auto_489 - OBJ
      ?auto_488 - LOCATION
    )
    :vars
    (
      ?auto_490 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_490 ?auto_488 ) ( IN-TRUCK ?auto_489 ?auto_490 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_489 ?auto_490 ?auto_488 )
      ( DELIVER-1PKG-VERIFY ?auto_489 ?auto_488 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_496 - OBJ
      ?auto_495 - LOCATION
    )
    :vars
    (
      ?auto_497 - TRUCK
      ?auto_498 - LOCATION
      ?auto_499 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_496 ?auto_497 ) ( TRUCK-AT ?auto_497 ?auto_498 ) ( IN-CITY ?auto_498 ?auto_499 ) ( IN-CITY ?auto_495 ?auto_499 ) ( not ( = ?auto_495 ?auto_498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_497 ?auto_498 ?auto_495 ?auto_499 )
      ( DELIVER-1PKG ?auto_496 ?auto_495 )
      ( DELIVER-1PKG-VERIFY ?auto_496 ?auto_495 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_507 - OBJ
      ?auto_506 - LOCATION
    )
    :vars
    (
      ?auto_509 - TRUCK
      ?auto_510 - LOCATION
      ?auto_508 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_509 ?auto_510 ) ( IN-CITY ?auto_510 ?auto_508 ) ( IN-CITY ?auto_506 ?auto_508 ) ( not ( = ?auto_506 ?auto_510 ) ) ( OBJ-AT ?auto_507 ?auto_510 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_507 ?auto_509 ?auto_510 )
      ( DELIVER-1PKG ?auto_507 ?auto_506 )
      ( DELIVER-1PKG-VERIFY ?auto_507 ?auto_506 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_518 - OBJ
      ?auto_517 - LOCATION
    )
    :vars
    (
      ?auto_521 - LOCATION
      ?auto_520 - CITY
      ?auto_519 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_521 ?auto_520 ) ( IN-CITY ?auto_517 ?auto_520 ) ( not ( = ?auto_517 ?auto_521 ) ) ( OBJ-AT ?auto_518 ?auto_521 ) ( TRUCK-AT ?auto_519 ?auto_517 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_519 ?auto_517 ?auto_521 ?auto_520 )
      ( DELIVER-1PKG ?auto_518 ?auto_517 )
      ( DELIVER-1PKG-VERIFY ?auto_518 ?auto_517 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_543 - OBJ
      ?auto_544 - OBJ
      ?auto_542 - LOCATION
    )
    :vars
    (
      ?auto_545 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_544 ?auto_543 ) ) ( TRUCK-AT ?auto_545 ?auto_542 ) ( IN-TRUCK ?auto_544 ?auto_545 ) ( OBJ-AT ?auto_543 ?auto_542 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_544 ?auto_542 )
      ( DELIVER-2PKG-VERIFY ?auto_543 ?auto_544 ?auto_542 ) )
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
      ?auto_549 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_548 ?auto_547 ) ) ( TRUCK-AT ?auto_549 ?auto_546 ) ( IN-TRUCK ?auto_547 ?auto_549 ) ( OBJ-AT ?auto_548 ?auto_546 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_547 ?auto_546 )
      ( DELIVER-2PKG-VERIFY ?auto_547 ?auto_548 ?auto_546 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_560 - OBJ
      ?auto_561 - OBJ
      ?auto_559 - LOCATION
    )
    :vars
    (
      ?auto_564 - TRUCK
      ?auto_562 - LOCATION
      ?auto_563 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_561 ?auto_560 ) ) ( IN-TRUCK ?auto_561 ?auto_564 ) ( TRUCK-AT ?auto_564 ?auto_562 ) ( IN-CITY ?auto_562 ?auto_563 ) ( IN-CITY ?auto_559 ?auto_563 ) ( not ( = ?auto_559 ?auto_562 ) ) ( OBJ-AT ?auto_560 ?auto_559 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_561 ?auto_559 )
      ( DELIVER-2PKG-VERIFY ?auto_560 ?auto_561 ?auto_559 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_566 - OBJ
      ?auto_567 - OBJ
      ?auto_565 - LOCATION
    )
    :vars
    (
      ?auto_568 - TRUCK
      ?auto_570 - LOCATION
      ?auto_569 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_567 ?auto_566 ) ) ( IN-TRUCK ?auto_566 ?auto_568 ) ( TRUCK-AT ?auto_568 ?auto_570 ) ( IN-CITY ?auto_570 ?auto_569 ) ( IN-CITY ?auto_565 ?auto_569 ) ( not ( = ?auto_565 ?auto_570 ) ) ( OBJ-AT ?auto_567 ?auto_565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_567 ?auto_566 ?auto_565 )
      ( DELIVER-2PKG-VERIFY ?auto_566 ?auto_567 ?auto_565 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_579 - OBJ
      ?auto_578 - LOCATION
    )
    :vars
    (
      ?auto_580 - OBJ
      ?auto_581 - TRUCK
      ?auto_583 - LOCATION
      ?auto_582 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_579 ?auto_580 ) ) ( TRUCK-AT ?auto_581 ?auto_583 ) ( IN-CITY ?auto_583 ?auto_582 ) ( IN-CITY ?auto_578 ?auto_582 ) ( not ( = ?auto_578 ?auto_583 ) ) ( OBJ-AT ?auto_580 ?auto_578 ) ( OBJ-AT ?auto_579 ?auto_583 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_579 ?auto_581 ?auto_583 )
      ( DELIVER-2PKG ?auto_580 ?auto_579 ?auto_578 )
      ( DELIVER-1PKG-VERIFY ?auto_579 ?auto_578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_585 - OBJ
      ?auto_586 - OBJ
      ?auto_584 - LOCATION
    )
    :vars
    (
      ?auto_589 - TRUCK
      ?auto_588 - LOCATION
      ?auto_587 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_586 ?auto_585 ) ) ( TRUCK-AT ?auto_589 ?auto_588 ) ( IN-CITY ?auto_588 ?auto_587 ) ( IN-CITY ?auto_584 ?auto_587 ) ( not ( = ?auto_584 ?auto_588 ) ) ( OBJ-AT ?auto_585 ?auto_584 ) ( OBJ-AT ?auto_586 ?auto_588 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_586 ?auto_584 )
      ( DELIVER-2PKG-VERIFY ?auto_585 ?auto_586 ?auto_584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_591 - OBJ
      ?auto_592 - OBJ
      ?auto_590 - LOCATION
    )
    :vars
    (
      ?auto_595 - TRUCK
      ?auto_593 - LOCATION
      ?auto_594 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_592 ?auto_591 ) ) ( TRUCK-AT ?auto_595 ?auto_593 ) ( IN-CITY ?auto_593 ?auto_594 ) ( IN-CITY ?auto_590 ?auto_594 ) ( not ( = ?auto_590 ?auto_593 ) ) ( OBJ-AT ?auto_592 ?auto_590 ) ( OBJ-AT ?auto_591 ?auto_593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_592 ?auto_591 ?auto_590 )
      ( DELIVER-2PKG-VERIFY ?auto_591 ?auto_592 ?auto_590 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_604 - OBJ
      ?auto_603 - LOCATION
    )
    :vars
    (
      ?auto_607 - OBJ
      ?auto_605 - LOCATION
      ?auto_606 - CITY
      ?auto_608 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_604 ?auto_607 ) ) ( IN-CITY ?auto_605 ?auto_606 ) ( IN-CITY ?auto_603 ?auto_606 ) ( not ( = ?auto_603 ?auto_605 ) ) ( OBJ-AT ?auto_607 ?auto_603 ) ( OBJ-AT ?auto_604 ?auto_605 ) ( TRUCK-AT ?auto_608 ?auto_603 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_608 ?auto_603 ?auto_605 ?auto_606 )
      ( DELIVER-2PKG ?auto_607 ?auto_604 ?auto_603 )
      ( DELIVER-1PKG-VERIFY ?auto_604 ?auto_603 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_610 - OBJ
      ?auto_611 - OBJ
      ?auto_609 - LOCATION
    )
    :vars
    (
      ?auto_612 - LOCATION
      ?auto_614 - CITY
      ?auto_613 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_611 ?auto_610 ) ) ( IN-CITY ?auto_612 ?auto_614 ) ( IN-CITY ?auto_609 ?auto_614 ) ( not ( = ?auto_609 ?auto_612 ) ) ( OBJ-AT ?auto_610 ?auto_609 ) ( OBJ-AT ?auto_611 ?auto_612 ) ( TRUCK-AT ?auto_613 ?auto_609 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_611 ?auto_609 )
      ( DELIVER-2PKG-VERIFY ?auto_610 ?auto_611 ?auto_609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_616 - OBJ
      ?auto_617 - OBJ
      ?auto_615 - LOCATION
    )
    :vars
    (
      ?auto_619 - LOCATION
      ?auto_618 - CITY
      ?auto_620 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_617 ?auto_616 ) ) ( IN-CITY ?auto_619 ?auto_618 ) ( IN-CITY ?auto_615 ?auto_618 ) ( not ( = ?auto_615 ?auto_619 ) ) ( OBJ-AT ?auto_617 ?auto_615 ) ( OBJ-AT ?auto_616 ?auto_619 ) ( TRUCK-AT ?auto_620 ?auto_615 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_617 ?auto_616 ?auto_615 )
      ( DELIVER-2PKG-VERIFY ?auto_616 ?auto_617 ?auto_615 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_629 - OBJ
      ?auto_628 - LOCATION
    )
    :vars
    (
      ?auto_633 - OBJ
      ?auto_631 - LOCATION
      ?auto_630 - CITY
      ?auto_632 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_629 ?auto_633 ) ) ( IN-CITY ?auto_631 ?auto_630 ) ( IN-CITY ?auto_628 ?auto_630 ) ( not ( = ?auto_628 ?auto_631 ) ) ( OBJ-AT ?auto_629 ?auto_631 ) ( TRUCK-AT ?auto_632 ?auto_628 ) ( IN-TRUCK ?auto_633 ?auto_632 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_633 ?auto_628 )
      ( DELIVER-2PKG ?auto_633 ?auto_629 ?auto_628 )
      ( DELIVER-1PKG-VERIFY ?auto_629 ?auto_628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_635 - OBJ
      ?auto_636 - OBJ
      ?auto_634 - LOCATION
    )
    :vars
    (
      ?auto_637 - LOCATION
      ?auto_639 - CITY
      ?auto_638 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_636 ?auto_635 ) ) ( IN-CITY ?auto_637 ?auto_639 ) ( IN-CITY ?auto_634 ?auto_639 ) ( not ( = ?auto_634 ?auto_637 ) ) ( OBJ-AT ?auto_636 ?auto_637 ) ( TRUCK-AT ?auto_638 ?auto_634 ) ( IN-TRUCK ?auto_635 ?auto_638 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_636 ?auto_634 )
      ( DELIVER-2PKG-VERIFY ?auto_635 ?auto_636 ?auto_634 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_641 - OBJ
      ?auto_642 - OBJ
      ?auto_640 - LOCATION
    )
    :vars
    (
      ?auto_643 - LOCATION
      ?auto_645 - CITY
      ?auto_644 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_642 ?auto_641 ) ) ( IN-CITY ?auto_643 ?auto_645 ) ( IN-CITY ?auto_640 ?auto_645 ) ( not ( = ?auto_640 ?auto_643 ) ) ( OBJ-AT ?auto_641 ?auto_643 ) ( TRUCK-AT ?auto_644 ?auto_640 ) ( IN-TRUCK ?auto_642 ?auto_644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_642 ?auto_641 ?auto_640 )
      ( DELIVER-2PKG-VERIFY ?auto_641 ?auto_642 ?auto_640 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_654 - OBJ
      ?auto_653 - LOCATION
    )
    :vars
    (
      ?auto_657 - OBJ
      ?auto_655 - LOCATION
      ?auto_658 - CITY
      ?auto_656 - TRUCK
      ?auto_659 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_654 ?auto_657 ) ) ( IN-CITY ?auto_655 ?auto_658 ) ( IN-CITY ?auto_653 ?auto_658 ) ( not ( = ?auto_653 ?auto_655 ) ) ( OBJ-AT ?auto_654 ?auto_655 ) ( IN-TRUCK ?auto_657 ?auto_656 ) ( TRUCK-AT ?auto_656 ?auto_659 ) ( IN-CITY ?auto_659 ?auto_658 ) ( not ( = ?auto_653 ?auto_659 ) ) ( not ( = ?auto_655 ?auto_659 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_656 ?auto_659 ?auto_653 ?auto_658 )
      ( DELIVER-2PKG ?auto_657 ?auto_654 ?auto_653 )
      ( DELIVER-1PKG-VERIFY ?auto_654 ?auto_653 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_661 - OBJ
      ?auto_662 - OBJ
      ?auto_660 - LOCATION
    )
    :vars
    (
      ?auto_663 - LOCATION
      ?auto_666 - CITY
      ?auto_664 - TRUCK
      ?auto_665 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_662 ?auto_661 ) ) ( IN-CITY ?auto_663 ?auto_666 ) ( IN-CITY ?auto_660 ?auto_666 ) ( not ( = ?auto_660 ?auto_663 ) ) ( OBJ-AT ?auto_662 ?auto_663 ) ( IN-TRUCK ?auto_661 ?auto_664 ) ( TRUCK-AT ?auto_664 ?auto_665 ) ( IN-CITY ?auto_665 ?auto_666 ) ( not ( = ?auto_660 ?auto_665 ) ) ( not ( = ?auto_663 ?auto_665 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_662 ?auto_660 )
      ( DELIVER-2PKG-VERIFY ?auto_661 ?auto_662 ?auto_660 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_668 - OBJ
      ?auto_669 - OBJ
      ?auto_667 - LOCATION
    )
    :vars
    (
      ?auto_672 - LOCATION
      ?auto_670 - CITY
      ?auto_671 - TRUCK
      ?auto_673 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_669 ?auto_668 ) ) ( IN-CITY ?auto_672 ?auto_670 ) ( IN-CITY ?auto_667 ?auto_670 ) ( not ( = ?auto_667 ?auto_672 ) ) ( OBJ-AT ?auto_668 ?auto_672 ) ( IN-TRUCK ?auto_669 ?auto_671 ) ( TRUCK-AT ?auto_671 ?auto_673 ) ( IN-CITY ?auto_673 ?auto_670 ) ( not ( = ?auto_667 ?auto_673 ) ) ( not ( = ?auto_672 ?auto_673 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_669 ?auto_668 ?auto_667 )
      ( DELIVER-2PKG-VERIFY ?auto_668 ?auto_669 ?auto_667 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_683 - OBJ
      ?auto_682 - LOCATION
    )
    :vars
    (
      ?auto_688 - OBJ
      ?auto_686 - LOCATION
      ?auto_684 - CITY
      ?auto_685 - TRUCK
      ?auto_687 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_683 ?auto_688 ) ) ( IN-CITY ?auto_686 ?auto_684 ) ( IN-CITY ?auto_682 ?auto_684 ) ( not ( = ?auto_682 ?auto_686 ) ) ( OBJ-AT ?auto_683 ?auto_686 ) ( TRUCK-AT ?auto_685 ?auto_687 ) ( IN-CITY ?auto_687 ?auto_684 ) ( not ( = ?auto_682 ?auto_687 ) ) ( not ( = ?auto_686 ?auto_687 ) ) ( OBJ-AT ?auto_688 ?auto_687 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_688 ?auto_685 ?auto_687 )
      ( DELIVER-2PKG ?auto_688 ?auto_683 ?auto_682 )
      ( DELIVER-1PKG-VERIFY ?auto_683 ?auto_682 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_690 - OBJ
      ?auto_691 - OBJ
      ?auto_689 - LOCATION
    )
    :vars
    (
      ?auto_694 - LOCATION
      ?auto_692 - CITY
      ?auto_693 - TRUCK
      ?auto_695 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_691 ?auto_690 ) ) ( IN-CITY ?auto_694 ?auto_692 ) ( IN-CITY ?auto_689 ?auto_692 ) ( not ( = ?auto_689 ?auto_694 ) ) ( OBJ-AT ?auto_691 ?auto_694 ) ( TRUCK-AT ?auto_693 ?auto_695 ) ( IN-CITY ?auto_695 ?auto_692 ) ( not ( = ?auto_689 ?auto_695 ) ) ( not ( = ?auto_694 ?auto_695 ) ) ( OBJ-AT ?auto_690 ?auto_695 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_691 ?auto_689 )
      ( DELIVER-2PKG-VERIFY ?auto_690 ?auto_691 ?auto_689 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_697 - OBJ
      ?auto_698 - OBJ
      ?auto_696 - LOCATION
    )
    :vars
    (
      ?auto_701 - LOCATION
      ?auto_699 - CITY
      ?auto_700 - TRUCK
      ?auto_702 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_698 ?auto_697 ) ) ( IN-CITY ?auto_701 ?auto_699 ) ( IN-CITY ?auto_696 ?auto_699 ) ( not ( = ?auto_696 ?auto_701 ) ) ( OBJ-AT ?auto_697 ?auto_701 ) ( TRUCK-AT ?auto_700 ?auto_702 ) ( IN-CITY ?auto_702 ?auto_699 ) ( not ( = ?auto_696 ?auto_702 ) ) ( not ( = ?auto_701 ?auto_702 ) ) ( OBJ-AT ?auto_698 ?auto_702 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_698 ?auto_697 ?auto_696 )
      ( DELIVER-2PKG-VERIFY ?auto_697 ?auto_698 ?auto_696 ) )
  )

)

