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
      ?auto_529 - TRUCK
      ?auto_528 - LOCATION
      ?auto_527 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_529 ?auto_528 ) ( IN-CITY ?auto_528 ?auto_527 ) ( IN-CITY ?auto_525 ?auto_527 ) ( not ( = ?auto_525 ?auto_528 ) ) ( OBJ-AT ?auto_526 ?auto_528 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_526 ?auto_529 ?auto_528 )
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
      ?auto_538 - CITY
      ?auto_539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_540 ?auto_538 ) ( IN-CITY ?auto_536 ?auto_538 ) ( not ( = ?auto_536 ?auto_540 ) ) ( OBJ-AT ?auto_537 ?auto_540 ) ( TRUCK-AT ?auto_539 ?auto_536 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_539 ?auto_536 ?auto_540 ?auto_538 )
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
    ( and ( TRUCK-AT ?auto_564 ?auto_561 ) ( IN-TRUCK ?auto_563 ?auto_564 ) ( OBJ-AT ?auto_562 ?auto_561 ) ( not ( = ?auto_562 ?auto_563 ) ) )
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
    ( and ( TRUCK-AT ?auto_568 ?auto_565 ) ( IN-TRUCK ?auto_566 ?auto_568 ) ( OBJ-AT ?auto_567 ?auto_565 ) ( not ( = ?auto_566 ?auto_567 ) ) )
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
      ?auto_581 - TRUCK
      ?auto_583 - LOCATION
      ?auto_582 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_580 ?auto_581 ) ( TRUCK-AT ?auto_581 ?auto_583 ) ( IN-CITY ?auto_583 ?auto_582 ) ( IN-CITY ?auto_578 ?auto_582 ) ( not ( = ?auto_578 ?auto_583 ) ) ( OBJ-AT ?auto_579 ?auto_578 ) ( not ( = ?auto_579 ?auto_580 ) ) )
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
      ?auto_587 - LOCATION
      ?auto_589 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_585 ?auto_588 ) ( TRUCK-AT ?auto_588 ?auto_587 ) ( IN-CITY ?auto_587 ?auto_589 ) ( IN-CITY ?auto_584 ?auto_589 ) ( not ( = ?auto_584 ?auto_587 ) ) ( OBJ-AT ?auto_586 ?auto_584 ) ( not ( = ?auto_586 ?auto_585 ) ) )
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
      ?auto_600 - TRUCK
      ?auto_599 - LOCATION
      ?auto_601 - CITY
      ?auto_602 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_600 ?auto_599 ) ( IN-CITY ?auto_599 ?auto_601 ) ( IN-CITY ?auto_597 ?auto_601 ) ( not ( = ?auto_597 ?auto_599 ) ) ( OBJ-AT ?auto_602 ?auto_597 ) ( not ( = ?auto_602 ?auto_598 ) ) ( OBJ-AT ?auto_598 ?auto_599 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_598 ?auto_600 ?auto_599 )
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
      ?auto_608 - TRUCK
      ?auto_607 - LOCATION
      ?auto_606 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_608 ?auto_607 ) ( IN-CITY ?auto_607 ?auto_606 ) ( IN-CITY ?auto_603 ?auto_606 ) ( not ( = ?auto_603 ?auto_607 ) ) ( OBJ-AT ?auto_604 ?auto_603 ) ( not ( = ?auto_604 ?auto_605 ) ) ( OBJ-AT ?auto_605 ?auto_607 ) )
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
      ?auto_612 - TRUCK
      ?auto_614 - LOCATION
      ?auto_613 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_612 ?auto_614 ) ( IN-CITY ?auto_614 ?auto_613 ) ( IN-CITY ?auto_609 ?auto_613 ) ( not ( = ?auto_609 ?auto_614 ) ) ( OBJ-AT ?auto_611 ?auto_609 ) ( not ( = ?auto_611 ?auto_610 ) ) ( OBJ-AT ?auto_610 ?auto_614 ) )
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
      ?auto_626 - LOCATION
      ?auto_625 - CITY
      ?auto_627 - OBJ
      ?auto_624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_626 ?auto_625 ) ( IN-CITY ?auto_622 ?auto_625 ) ( not ( = ?auto_622 ?auto_626 ) ) ( OBJ-AT ?auto_627 ?auto_622 ) ( not ( = ?auto_627 ?auto_623 ) ) ( OBJ-AT ?auto_623 ?auto_626 ) ( TRUCK-AT ?auto_624 ?auto_622 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_624 ?auto_622 ?auto_626 ?auto_625 )
      ( DELIVER-2PKG ?auto_627 ?auto_623 ?auto_622 )
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
      ?auto_631 - LOCATION
      ?auto_632 - CITY
      ?auto_633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_631 ?auto_632 ) ( IN-CITY ?auto_628 ?auto_632 ) ( not ( = ?auto_628 ?auto_631 ) ) ( OBJ-AT ?auto_629 ?auto_628 ) ( not ( = ?auto_629 ?auto_630 ) ) ( OBJ-AT ?auto_630 ?auto_631 ) ( TRUCK-AT ?auto_633 ?auto_628 ) )
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
    ( and ( IN-CITY ?auto_637 ?auto_638 ) ( IN-CITY ?auto_634 ?auto_638 ) ( not ( = ?auto_634 ?auto_637 ) ) ( OBJ-AT ?auto_636 ?auto_634 ) ( not ( = ?auto_636 ?auto_635 ) ) ( OBJ-AT ?auto_635 ?auto_637 ) ( TRUCK-AT ?auto_639 ?auto_634 ) )
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
      ?auto_649 - LOCATION
      ?auto_651 - CITY
      ?auto_650 - OBJ
      ?auto_652 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_649 ?auto_651 ) ( IN-CITY ?auto_647 ?auto_651 ) ( not ( = ?auto_647 ?auto_649 ) ) ( not ( = ?auto_650 ?auto_648 ) ) ( OBJ-AT ?auto_648 ?auto_649 ) ( TRUCK-AT ?auto_652 ?auto_647 ) ( IN-TRUCK ?auto_650 ?auto_652 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_650 ?auto_647 )
      ( DELIVER-2PKG ?auto_650 ?auto_648 ?auto_647 )
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
      ?auto_658 - CITY
      ?auto_656 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_657 ?auto_658 ) ( IN-CITY ?auto_653 ?auto_658 ) ( not ( = ?auto_653 ?auto_657 ) ) ( not ( = ?auto_654 ?auto_655 ) ) ( OBJ-AT ?auto_655 ?auto_657 ) ( TRUCK-AT ?auto_656 ?auto_653 ) ( IN-TRUCK ?auto_654 ?auto_656 ) )
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
    ( and ( IN-CITY ?auto_664 ?auto_662 ) ( IN-CITY ?auto_659 ?auto_662 ) ( not ( = ?auto_659 ?auto_664 ) ) ( not ( = ?auto_661 ?auto_660 ) ) ( OBJ-AT ?auto_660 ?auto_664 ) ( TRUCK-AT ?auto_663 ?auto_659 ) ( IN-TRUCK ?auto_661 ?auto_663 ) )
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
      ?auto_677 - LOCATION
      ?auto_674 - CITY
      ?auto_675 - OBJ
      ?auto_676 - TRUCK
      ?auto_678 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_677 ?auto_674 ) ( IN-CITY ?auto_672 ?auto_674 ) ( not ( = ?auto_672 ?auto_677 ) ) ( not ( = ?auto_675 ?auto_673 ) ) ( OBJ-AT ?auto_673 ?auto_677 ) ( IN-TRUCK ?auto_675 ?auto_676 ) ( TRUCK-AT ?auto_676 ?auto_678 ) ( IN-CITY ?auto_678 ?auto_674 ) ( not ( = ?auto_672 ?auto_678 ) ) ( not ( = ?auto_677 ?auto_678 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_676 ?auto_678 ?auto_672 ?auto_674 )
      ( DELIVER-2PKG ?auto_675 ?auto_673 ?auto_672 )
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
      ?auto_685 - LOCATION
      ?auto_684 - CITY
      ?auto_683 - TRUCK
      ?auto_682 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_685 ?auto_684 ) ( IN-CITY ?auto_679 ?auto_684 ) ( not ( = ?auto_679 ?auto_685 ) ) ( not ( = ?auto_680 ?auto_681 ) ) ( OBJ-AT ?auto_681 ?auto_685 ) ( IN-TRUCK ?auto_680 ?auto_683 ) ( TRUCK-AT ?auto_683 ?auto_682 ) ( IN-CITY ?auto_682 ?auto_684 ) ( not ( = ?auto_679 ?auto_682 ) ) ( not ( = ?auto_685 ?auto_682 ) ) )
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
      ?auto_689 - CITY
      ?auto_692 - TRUCK
      ?auto_690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_691 ?auto_689 ) ( IN-CITY ?auto_686 ?auto_689 ) ( not ( = ?auto_686 ?auto_691 ) ) ( not ( = ?auto_688 ?auto_687 ) ) ( OBJ-AT ?auto_687 ?auto_691 ) ( IN-TRUCK ?auto_688 ?auto_692 ) ( TRUCK-AT ?auto_692 ?auto_690 ) ( IN-CITY ?auto_690 ?auto_689 ) ( not ( = ?auto_686 ?auto_690 ) ) ( not ( = ?auto_691 ?auto_690 ) ) )
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
      ?auto_705 - LOCATION
      ?auto_703 - CITY
      ?auto_707 - OBJ
      ?auto_706 - TRUCK
      ?auto_704 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_705 ?auto_703 ) ( IN-CITY ?auto_701 ?auto_703 ) ( not ( = ?auto_701 ?auto_705 ) ) ( not ( = ?auto_707 ?auto_702 ) ) ( OBJ-AT ?auto_702 ?auto_705 ) ( TRUCK-AT ?auto_706 ?auto_704 ) ( IN-CITY ?auto_704 ?auto_703 ) ( not ( = ?auto_701 ?auto_704 ) ) ( not ( = ?auto_705 ?auto_704 ) ) ( OBJ-AT ?auto_707 ?auto_704 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_707 ?auto_706 ?auto_704 )
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
      ?auto_711 - LOCATION
      ?auto_713 - CITY
      ?auto_714 - TRUCK
      ?auto_712 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_711 ?auto_713 ) ( IN-CITY ?auto_708 ?auto_713 ) ( not ( = ?auto_708 ?auto_711 ) ) ( not ( = ?auto_709 ?auto_710 ) ) ( OBJ-AT ?auto_710 ?auto_711 ) ( TRUCK-AT ?auto_714 ?auto_712 ) ( IN-CITY ?auto_712 ?auto_713 ) ( not ( = ?auto_708 ?auto_712 ) ) ( not ( = ?auto_711 ?auto_712 ) ) ( OBJ-AT ?auto_709 ?auto_712 ) )
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
      ?auto_718 - LOCATION
      ?auto_719 - CITY
      ?auto_721 - TRUCK
      ?auto_720 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_718 ?auto_719 ) ( IN-CITY ?auto_715 ?auto_719 ) ( not ( = ?auto_715 ?auto_718 ) ) ( not ( = ?auto_717 ?auto_716 ) ) ( OBJ-AT ?auto_716 ?auto_718 ) ( TRUCK-AT ?auto_721 ?auto_720 ) ( IN-CITY ?auto_720 ?auto_719 ) ( not ( = ?auto_715 ?auto_720 ) ) ( not ( = ?auto_718 ?auto_720 ) ) ( OBJ-AT ?auto_717 ?auto_720 ) )
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
      ?auto_732 - LOCATION
      ?auto_733 - CITY
      ?auto_736 - OBJ
      ?auto_734 - LOCATION
      ?auto_735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_732 ?auto_733 ) ( IN-CITY ?auto_730 ?auto_733 ) ( not ( = ?auto_730 ?auto_732 ) ) ( not ( = ?auto_736 ?auto_731 ) ) ( OBJ-AT ?auto_731 ?auto_732 ) ( IN-CITY ?auto_734 ?auto_733 ) ( not ( = ?auto_730 ?auto_734 ) ) ( not ( = ?auto_732 ?auto_734 ) ) ( OBJ-AT ?auto_736 ?auto_734 ) ( TRUCK-AT ?auto_735 ?auto_730 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_735 ?auto_730 ?auto_734 ?auto_733 )
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
      ?auto_740 - LOCATION
      ?auto_743 - CITY
      ?auto_741 - LOCATION
      ?auto_742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_740 ?auto_743 ) ( IN-CITY ?auto_737 ?auto_743 ) ( not ( = ?auto_737 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_739 ) ) ( OBJ-AT ?auto_739 ?auto_740 ) ( IN-CITY ?auto_741 ?auto_743 ) ( not ( = ?auto_737 ?auto_741 ) ) ( not ( = ?auto_740 ?auto_741 ) ) ( OBJ-AT ?auto_738 ?auto_741 ) ( TRUCK-AT ?auto_742 ?auto_737 ) )
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
      ?auto_747 - LOCATION
      ?auto_748 - CITY
      ?auto_749 - LOCATION
      ?auto_750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_747 ?auto_748 ) ( IN-CITY ?auto_744 ?auto_748 ) ( not ( = ?auto_744 ?auto_747 ) ) ( not ( = ?auto_746 ?auto_745 ) ) ( OBJ-AT ?auto_745 ?auto_747 ) ( IN-CITY ?auto_749 ?auto_748 ) ( not ( = ?auto_744 ?auto_749 ) ) ( not ( = ?auto_747 ?auto_749 ) ) ( OBJ-AT ?auto_746 ?auto_749 ) ( TRUCK-AT ?auto_750 ?auto_744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_746 ?auto_745 ?auto_744 )
      ( DELIVER-2PKG-VERIFY ?auto_745 ?auto_746 ?auto_744 ) )
  )

)

