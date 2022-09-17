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
      ?auto_508 - OBJ
      ?auto_507 - LOCATION
    )
    :vars
    (
      ?auto_509 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_509 ?auto_507 ) ( IN-TRUCK ?auto_508 ?auto_509 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_508 ?auto_509 ?auto_507 )
      ( DELIVER-1PKG-VERIFY ?auto_508 ?auto_507 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_515 - OBJ
      ?auto_514 - LOCATION
    )
    :vars
    (
      ?auto_516 - TRUCK
      ?auto_517 - LOCATION
      ?auto_518 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_515 ?auto_516 ) ( TRUCK-AT ?auto_516 ?auto_517 ) ( IN-CITY ?auto_517 ?auto_518 ) ( IN-CITY ?auto_514 ?auto_518 ) ( not ( = ?auto_514 ?auto_517 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_516 ?auto_517 ?auto_514 ?auto_518 )
      ( DELIVER-1PKG ?auto_515 ?auto_514 )
      ( DELIVER-1PKG-VERIFY ?auto_515 ?auto_514 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_526 - OBJ
      ?auto_525 - LOCATION
    )
    :vars
    (
      ?auto_527 - TRUCK
      ?auto_528 - LOCATION
      ?auto_529 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_527 ?auto_528 ) ( IN-CITY ?auto_528 ?auto_529 ) ( IN-CITY ?auto_525 ?auto_529 ) ( not ( = ?auto_525 ?auto_528 ) ) ( OBJ-AT ?auto_526 ?auto_528 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_526 ?auto_527 ?auto_528 )
      ( DELIVER-1PKG ?auto_526 ?auto_525 )
      ( DELIVER-1PKG-VERIFY ?auto_526 ?auto_525 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_537 - OBJ
      ?auto_536 - LOCATION
    )
    :vars
    (
      ?auto_540 - LOCATION
      ?auto_539 - CITY
      ?auto_538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_540 ?auto_539 ) ( IN-CITY ?auto_536 ?auto_539 ) ( not ( = ?auto_536 ?auto_540 ) ) ( OBJ-AT ?auto_537 ?auto_540 ) ( TRUCK-AT ?auto_538 ?auto_536 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_538 ?auto_536 ?auto_540 ?auto_539 )
      ( DELIVER-1PKG ?auto_537 ?auto_536 )
      ( DELIVER-1PKG-VERIFY ?auto_537 ?auto_536 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_559 - OBJ
      ?auto_558 - LOCATION
    )
    :vars
    (
      ?auto_560 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_560 ?auto_558 ) ( IN-TRUCK ?auto_559 ?auto_560 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_559 ?auto_560 ?auto_558 )
      ( DELIVER-1PKG-VERIFY ?auto_559 ?auto_558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_562 - OBJ
      ?auto_563 - OBJ
      ?auto_561 - LOCATION
    )
    :vars
    (
      ?auto_564 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_563 ?auto_562 ) ) ( TRUCK-AT ?auto_564 ?auto_561 ) ( IN-TRUCK ?auto_563 ?auto_564 ) ( OBJ-AT ?auto_562 ?auto_561 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_563 ?auto_561 )
      ( DELIVER-2PKG-VERIFY ?auto_562 ?auto_563 ?auto_561 ) )
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
    )
    :precondition
    ( and ( not ( = ?auto_567 ?auto_566 ) ) ( TRUCK-AT ?auto_568 ?auto_565 ) ( IN-TRUCK ?auto_566 ?auto_568 ) ( OBJ-AT ?auto_567 ?auto_565 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_566 ?auto_565 )
      ( DELIVER-2PKG-VERIFY ?auto_566 ?auto_567 ?auto_565 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_574 - OBJ
      ?auto_573 - LOCATION
    )
    :vars
    (
      ?auto_575 - TRUCK
      ?auto_576 - LOCATION
      ?auto_577 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_574 ?auto_575 ) ( TRUCK-AT ?auto_575 ?auto_576 ) ( IN-CITY ?auto_576 ?auto_577 ) ( IN-CITY ?auto_573 ?auto_577 ) ( not ( = ?auto_573 ?auto_576 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_575 ?auto_576 ?auto_573 ?auto_577 )
      ( DELIVER-1PKG ?auto_574 ?auto_573 )
      ( DELIVER-1PKG-VERIFY ?auto_574 ?auto_573 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_579 - OBJ
      ?auto_580 - OBJ
      ?auto_578 - LOCATION
    )
    :vars
    (
      ?auto_582 - TRUCK
      ?auto_583 - LOCATION
      ?auto_581 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_580 ?auto_579 ) ) ( IN-TRUCK ?auto_580 ?auto_582 ) ( TRUCK-AT ?auto_582 ?auto_583 ) ( IN-CITY ?auto_583 ?auto_581 ) ( IN-CITY ?auto_578 ?auto_581 ) ( not ( = ?auto_578 ?auto_583 ) ) ( OBJ-AT ?auto_579 ?auto_578 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_580 ?auto_578 )
      ( DELIVER-2PKG-VERIFY ?auto_579 ?auto_580 ?auto_578 ) )
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
      ?auto_588 - TRUCK
      ?auto_589 - LOCATION
      ?auto_587 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_586 ?auto_585 ) ) ( IN-TRUCK ?auto_585 ?auto_588 ) ( TRUCK-AT ?auto_588 ?auto_589 ) ( IN-CITY ?auto_589 ?auto_587 ) ( IN-CITY ?auto_584 ?auto_587 ) ( not ( = ?auto_584 ?auto_589 ) ) ( OBJ-AT ?auto_586 ?auto_584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_586 ?auto_585 ?auto_584 )
      ( DELIVER-2PKG-VERIFY ?auto_585 ?auto_586 ?auto_584 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_598 - OBJ
      ?auto_597 - LOCATION
    )
    :vars
    (
      ?auto_602 - OBJ
      ?auto_600 - TRUCK
      ?auto_601 - LOCATION
      ?auto_599 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_598 ?auto_602 ) ) ( TRUCK-AT ?auto_600 ?auto_601 ) ( IN-CITY ?auto_601 ?auto_599 ) ( IN-CITY ?auto_597 ?auto_599 ) ( not ( = ?auto_597 ?auto_601 ) ) ( OBJ-AT ?auto_602 ?auto_597 ) ( OBJ-AT ?auto_598 ?auto_601 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_598 ?auto_600 ?auto_601 )
      ( DELIVER-2PKG ?auto_602 ?auto_598 ?auto_597 )
      ( DELIVER-1PKG-VERIFY ?auto_598 ?auto_597 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_604 - OBJ
      ?auto_605 - OBJ
      ?auto_603 - LOCATION
    )
    :vars
    (
      ?auto_607 - TRUCK
      ?auto_606 - LOCATION
      ?auto_608 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_605 ?auto_604 ) ) ( TRUCK-AT ?auto_607 ?auto_606 ) ( IN-CITY ?auto_606 ?auto_608 ) ( IN-CITY ?auto_603 ?auto_608 ) ( not ( = ?auto_603 ?auto_606 ) ) ( OBJ-AT ?auto_604 ?auto_603 ) ( OBJ-AT ?auto_605 ?auto_606 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_605 ?auto_603 )
      ( DELIVER-2PKG-VERIFY ?auto_604 ?auto_605 ?auto_603 ) )
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
      ?auto_614 - TRUCK
      ?auto_612 - LOCATION
      ?auto_613 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_611 ?auto_610 ) ) ( TRUCK-AT ?auto_614 ?auto_612 ) ( IN-CITY ?auto_612 ?auto_613 ) ( IN-CITY ?auto_609 ?auto_613 ) ( not ( = ?auto_609 ?auto_612 ) ) ( OBJ-AT ?auto_611 ?auto_609 ) ( OBJ-AT ?auto_610 ?auto_612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_611 ?auto_610 ?auto_609 )
      ( DELIVER-2PKG-VERIFY ?auto_610 ?auto_611 ?auto_609 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_623 - OBJ
      ?auto_622 - LOCATION
    )
    :vars
    (
      ?auto_626 - OBJ
      ?auto_624 - LOCATION
      ?auto_625 - CITY
      ?auto_627 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_623 ?auto_626 ) ) ( IN-CITY ?auto_624 ?auto_625 ) ( IN-CITY ?auto_622 ?auto_625 ) ( not ( = ?auto_622 ?auto_624 ) ) ( OBJ-AT ?auto_626 ?auto_622 ) ( OBJ-AT ?auto_623 ?auto_624 ) ( TRUCK-AT ?auto_627 ?auto_622 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_627 ?auto_622 ?auto_624 ?auto_625 )
      ( DELIVER-2PKG ?auto_626 ?auto_623 ?auto_622 )
      ( DELIVER-1PKG-VERIFY ?auto_623 ?auto_622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_629 - OBJ
      ?auto_630 - OBJ
      ?auto_628 - LOCATION
    )
    :vars
    (
      ?auto_632 - LOCATION
      ?auto_631 - CITY
      ?auto_633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_630 ?auto_629 ) ) ( IN-CITY ?auto_632 ?auto_631 ) ( IN-CITY ?auto_628 ?auto_631 ) ( not ( = ?auto_628 ?auto_632 ) ) ( OBJ-AT ?auto_629 ?auto_628 ) ( OBJ-AT ?auto_630 ?auto_632 ) ( TRUCK-AT ?auto_633 ?auto_628 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_630 ?auto_628 )
      ( DELIVER-2PKG-VERIFY ?auto_629 ?auto_630 ?auto_628 ) )
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
      ?auto_638 - CITY
      ?auto_639 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_636 ?auto_635 ) ) ( IN-CITY ?auto_637 ?auto_638 ) ( IN-CITY ?auto_634 ?auto_638 ) ( not ( = ?auto_634 ?auto_637 ) ) ( OBJ-AT ?auto_636 ?auto_634 ) ( OBJ-AT ?auto_635 ?auto_637 ) ( TRUCK-AT ?auto_639 ?auto_634 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_636 ?auto_635 ?auto_634 )
      ( DELIVER-2PKG-VERIFY ?auto_635 ?auto_636 ?auto_634 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_648 - OBJ
      ?auto_647 - LOCATION
    )
    :vars
    (
      ?auto_652 - OBJ
      ?auto_649 - LOCATION
      ?auto_650 - CITY
      ?auto_651 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_648 ?auto_652 ) ) ( IN-CITY ?auto_649 ?auto_650 ) ( IN-CITY ?auto_647 ?auto_650 ) ( not ( = ?auto_647 ?auto_649 ) ) ( OBJ-AT ?auto_648 ?auto_649 ) ( TRUCK-AT ?auto_651 ?auto_647 ) ( IN-TRUCK ?auto_652 ?auto_651 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_652 ?auto_647 )
      ( DELIVER-2PKG ?auto_652 ?auto_648 ?auto_647 )
      ( DELIVER-1PKG-VERIFY ?auto_648 ?auto_647 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_654 - OBJ
      ?auto_655 - OBJ
      ?auto_653 - LOCATION
    )
    :vars
    (
      ?auto_657 - LOCATION
      ?auto_656 - CITY
      ?auto_658 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_655 ?auto_654 ) ) ( IN-CITY ?auto_657 ?auto_656 ) ( IN-CITY ?auto_653 ?auto_656 ) ( not ( = ?auto_653 ?auto_657 ) ) ( OBJ-AT ?auto_655 ?auto_657 ) ( TRUCK-AT ?auto_658 ?auto_653 ) ( IN-TRUCK ?auto_654 ?auto_658 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_655 ?auto_653 )
      ( DELIVER-2PKG-VERIFY ?auto_654 ?auto_655 ?auto_653 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_660 - OBJ
      ?auto_661 - OBJ
      ?auto_659 - LOCATION
    )
    :vars
    (
      ?auto_664 - LOCATION
      ?auto_662 - CITY
      ?auto_663 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_661 ?auto_660 ) ) ( IN-CITY ?auto_664 ?auto_662 ) ( IN-CITY ?auto_659 ?auto_662 ) ( not ( = ?auto_659 ?auto_664 ) ) ( OBJ-AT ?auto_660 ?auto_664 ) ( TRUCK-AT ?auto_663 ?auto_659 ) ( IN-TRUCK ?auto_661 ?auto_663 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_661 ?auto_660 ?auto_659 )
      ( DELIVER-2PKG-VERIFY ?auto_660 ?auto_661 ?auto_659 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_673 - OBJ
      ?auto_672 - LOCATION
    )
    :vars
    (
      ?auto_677 - OBJ
      ?auto_676 - LOCATION
      ?auto_674 - CITY
      ?auto_675 - TRUCK
      ?auto_678 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_673 ?auto_677 ) ) ( IN-CITY ?auto_676 ?auto_674 ) ( IN-CITY ?auto_672 ?auto_674 ) ( not ( = ?auto_672 ?auto_676 ) ) ( OBJ-AT ?auto_673 ?auto_676 ) ( IN-TRUCK ?auto_677 ?auto_675 ) ( TRUCK-AT ?auto_675 ?auto_678 ) ( IN-CITY ?auto_678 ?auto_674 ) ( not ( = ?auto_672 ?auto_678 ) ) ( not ( = ?auto_676 ?auto_678 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_675 ?auto_678 ?auto_672 ?auto_674 )
      ( DELIVER-2PKG ?auto_677 ?auto_673 ?auto_672 )
      ( DELIVER-1PKG-VERIFY ?auto_673 ?auto_672 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_680 - OBJ
      ?auto_681 - OBJ
      ?auto_679 - LOCATION
    )
    :vars
    (
      ?auto_682 - LOCATION
      ?auto_684 - CITY
      ?auto_683 - TRUCK
      ?auto_685 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_681 ?auto_680 ) ) ( IN-CITY ?auto_682 ?auto_684 ) ( IN-CITY ?auto_679 ?auto_684 ) ( not ( = ?auto_679 ?auto_682 ) ) ( OBJ-AT ?auto_681 ?auto_682 ) ( IN-TRUCK ?auto_680 ?auto_683 ) ( TRUCK-AT ?auto_683 ?auto_685 ) ( IN-CITY ?auto_685 ?auto_684 ) ( not ( = ?auto_679 ?auto_685 ) ) ( not ( = ?auto_682 ?auto_685 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_681 ?auto_679 )
      ( DELIVER-2PKG-VERIFY ?auto_680 ?auto_681 ?auto_679 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_687 - OBJ
      ?auto_688 - OBJ
      ?auto_686 - LOCATION
    )
    :vars
    (
      ?auto_691 - LOCATION
      ?auto_690 - CITY
      ?auto_692 - TRUCK
      ?auto_689 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_688 ?auto_687 ) ) ( IN-CITY ?auto_691 ?auto_690 ) ( IN-CITY ?auto_686 ?auto_690 ) ( not ( = ?auto_686 ?auto_691 ) ) ( OBJ-AT ?auto_687 ?auto_691 ) ( IN-TRUCK ?auto_688 ?auto_692 ) ( TRUCK-AT ?auto_692 ?auto_689 ) ( IN-CITY ?auto_689 ?auto_690 ) ( not ( = ?auto_686 ?auto_689 ) ) ( not ( = ?auto_691 ?auto_689 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_688 ?auto_687 ?auto_686 )
      ( DELIVER-2PKG-VERIFY ?auto_687 ?auto_688 ?auto_686 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_702 - OBJ
      ?auto_701 - LOCATION
    )
    :vars
    (
      ?auto_707 - OBJ
      ?auto_705 - LOCATION
      ?auto_704 - CITY
      ?auto_706 - TRUCK
      ?auto_703 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_702 ?auto_707 ) ) ( IN-CITY ?auto_705 ?auto_704 ) ( IN-CITY ?auto_701 ?auto_704 ) ( not ( = ?auto_701 ?auto_705 ) ) ( OBJ-AT ?auto_702 ?auto_705 ) ( TRUCK-AT ?auto_706 ?auto_703 ) ( IN-CITY ?auto_703 ?auto_704 ) ( not ( = ?auto_701 ?auto_703 ) ) ( not ( = ?auto_705 ?auto_703 ) ) ( OBJ-AT ?auto_707 ?auto_703 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_707 ?auto_706 ?auto_703 )
      ( DELIVER-2PKG ?auto_707 ?auto_702 ?auto_701 )
      ( DELIVER-1PKG-VERIFY ?auto_702 ?auto_701 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_709 - OBJ
      ?auto_710 - OBJ
      ?auto_708 - LOCATION
    )
    :vars
    (
      ?auto_714 - LOCATION
      ?auto_712 - CITY
      ?auto_713 - TRUCK
      ?auto_711 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_710 ?auto_709 ) ) ( IN-CITY ?auto_714 ?auto_712 ) ( IN-CITY ?auto_708 ?auto_712 ) ( not ( = ?auto_708 ?auto_714 ) ) ( OBJ-AT ?auto_710 ?auto_714 ) ( TRUCK-AT ?auto_713 ?auto_711 ) ( IN-CITY ?auto_711 ?auto_712 ) ( not ( = ?auto_708 ?auto_711 ) ) ( not ( = ?auto_714 ?auto_711 ) ) ( OBJ-AT ?auto_709 ?auto_711 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_710 ?auto_708 )
      ( DELIVER-2PKG-VERIFY ?auto_709 ?auto_710 ?auto_708 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_716 - OBJ
      ?auto_717 - OBJ
      ?auto_715 - LOCATION
    )
    :vars
    (
      ?auto_721 - LOCATION
      ?auto_720 - CITY
      ?auto_718 - TRUCK
      ?auto_719 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_717 ?auto_716 ) ) ( IN-CITY ?auto_721 ?auto_720 ) ( IN-CITY ?auto_715 ?auto_720 ) ( not ( = ?auto_715 ?auto_721 ) ) ( OBJ-AT ?auto_716 ?auto_721 ) ( TRUCK-AT ?auto_718 ?auto_719 ) ( IN-CITY ?auto_719 ?auto_720 ) ( not ( = ?auto_715 ?auto_719 ) ) ( not ( = ?auto_721 ?auto_719 ) ) ( OBJ-AT ?auto_717 ?auto_719 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_717 ?auto_716 ?auto_715 )
      ( DELIVER-2PKG-VERIFY ?auto_716 ?auto_717 ?auto_715 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_731 - OBJ
      ?auto_730 - LOCATION
    )
    :vars
    (
      ?auto_736 - OBJ
      ?auto_735 - LOCATION
      ?auto_734 - CITY
      ?auto_733 - LOCATION
      ?auto_732 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_731 ?auto_736 ) ) ( IN-CITY ?auto_735 ?auto_734 ) ( IN-CITY ?auto_730 ?auto_734 ) ( not ( = ?auto_730 ?auto_735 ) ) ( OBJ-AT ?auto_731 ?auto_735 ) ( IN-CITY ?auto_733 ?auto_734 ) ( not ( = ?auto_730 ?auto_733 ) ) ( not ( = ?auto_735 ?auto_733 ) ) ( OBJ-AT ?auto_736 ?auto_733 ) ( TRUCK-AT ?auto_732 ?auto_730 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_732 ?auto_730 ?auto_733 ?auto_734 )
      ( DELIVER-2PKG ?auto_736 ?auto_731 ?auto_730 )
      ( DELIVER-1PKG-VERIFY ?auto_731 ?auto_730 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_738 - OBJ
      ?auto_739 - OBJ
      ?auto_737 - LOCATION
    )
    :vars
    (
      ?auto_742 - LOCATION
      ?auto_741 - CITY
      ?auto_743 - LOCATION
      ?auto_740 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_739 ?auto_738 ) ) ( IN-CITY ?auto_742 ?auto_741 ) ( IN-CITY ?auto_737 ?auto_741 ) ( not ( = ?auto_737 ?auto_742 ) ) ( OBJ-AT ?auto_739 ?auto_742 ) ( IN-CITY ?auto_743 ?auto_741 ) ( not ( = ?auto_737 ?auto_743 ) ) ( not ( = ?auto_742 ?auto_743 ) ) ( OBJ-AT ?auto_738 ?auto_743 ) ( TRUCK-AT ?auto_740 ?auto_737 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_739 ?auto_737 )
      ( DELIVER-2PKG-VERIFY ?auto_738 ?auto_739 ?auto_737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_745 - OBJ
      ?auto_746 - OBJ
      ?auto_744 - LOCATION
    )
    :vars
    (
      ?auto_750 - LOCATION
      ?auto_747 - CITY
      ?auto_748 - LOCATION
      ?auto_749 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_746 ?auto_745 ) ) ( IN-CITY ?auto_750 ?auto_747 ) ( IN-CITY ?auto_744 ?auto_747 ) ( not ( = ?auto_744 ?auto_750 ) ) ( OBJ-AT ?auto_745 ?auto_750 ) ( IN-CITY ?auto_748 ?auto_747 ) ( not ( = ?auto_744 ?auto_748 ) ) ( not ( = ?auto_750 ?auto_748 ) ) ( OBJ-AT ?auto_746 ?auto_748 ) ( TRUCK-AT ?auto_749 ?auto_744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_746 ?auto_745 ?auto_744 )
      ( DELIVER-2PKG-VERIFY ?auto_745 ?auto_746 ?auto_744 ) )
  )

)

