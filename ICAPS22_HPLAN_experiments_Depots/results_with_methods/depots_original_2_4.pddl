( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_553 - SURFACE
      ?auto_554 - SURFACE
    )
    :vars
    (
      ?auto_555 - HOIST
      ?auto_556 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555 ?auto_556 ) ( SURFACE-AT ?auto_554 ?auto_556 ) ( CLEAR ?auto_554 ) ( LIFTING ?auto_555 ?auto_553 ) ( IS-CRATE ?auto_553 ) ( not ( = ?auto_553 ?auto_554 ) ) )
    :subtasks
    ( ( !DROP ?auto_555 ?auto_553 ?auto_554 ?auto_556 )
      ( MAKE-ON-VERIFY ?auto_553 ?auto_554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_557 - SURFACE
      ?auto_558 - SURFACE
    )
    :vars
    (
      ?auto_560 - HOIST
      ?auto_559 - PLACE
      ?auto_561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560 ?auto_559 ) ( SURFACE-AT ?auto_558 ?auto_559 ) ( CLEAR ?auto_558 ) ( IS-CRATE ?auto_557 ) ( not ( = ?auto_557 ?auto_558 ) ) ( TRUCK-AT ?auto_561 ?auto_559 ) ( AVAILABLE ?auto_560 ) ( IN ?auto_557 ?auto_561 ) )
    :subtasks
    ( ( !UNLOAD ?auto_560 ?auto_557 ?auto_561 ?auto_559 )
      ( MAKE-ON ?auto_557 ?auto_558 )
      ( MAKE-ON-VERIFY ?auto_557 ?auto_558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_562 - SURFACE
      ?auto_563 - SURFACE
    )
    :vars
    (
      ?auto_564 - HOIST
      ?auto_566 - PLACE
      ?auto_565 - TRUCK
      ?auto_567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_564 ?auto_566 ) ( SURFACE-AT ?auto_563 ?auto_566 ) ( CLEAR ?auto_563 ) ( IS-CRATE ?auto_562 ) ( not ( = ?auto_562 ?auto_563 ) ) ( AVAILABLE ?auto_564 ) ( IN ?auto_562 ?auto_565 ) ( TRUCK-AT ?auto_565 ?auto_567 ) ( not ( = ?auto_567 ?auto_566 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_565 ?auto_567 ?auto_566 )
      ( MAKE-ON ?auto_562 ?auto_563 )
      ( MAKE-ON-VERIFY ?auto_562 ?auto_563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_568 - SURFACE
      ?auto_569 - SURFACE
    )
    :vars
    (
      ?auto_571 - HOIST
      ?auto_572 - PLACE
      ?auto_573 - TRUCK
      ?auto_570 - PLACE
      ?auto_574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_571 ?auto_572 ) ( SURFACE-AT ?auto_569 ?auto_572 ) ( CLEAR ?auto_569 ) ( IS-CRATE ?auto_568 ) ( not ( = ?auto_568 ?auto_569 ) ) ( AVAILABLE ?auto_571 ) ( TRUCK-AT ?auto_573 ?auto_570 ) ( not ( = ?auto_570 ?auto_572 ) ) ( HOIST-AT ?auto_574 ?auto_570 ) ( LIFTING ?auto_574 ?auto_568 ) ( not ( = ?auto_571 ?auto_574 ) ) )
    :subtasks
    ( ( !LOAD ?auto_574 ?auto_568 ?auto_573 ?auto_570 )
      ( MAKE-ON ?auto_568 ?auto_569 )
      ( MAKE-ON-VERIFY ?auto_568 ?auto_569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_575 - SURFACE
      ?auto_576 - SURFACE
    )
    :vars
    (
      ?auto_579 - HOIST
      ?auto_577 - PLACE
      ?auto_580 - TRUCK
      ?auto_578 - PLACE
      ?auto_581 - HOIST
      ?auto_582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_579 ?auto_577 ) ( SURFACE-AT ?auto_576 ?auto_577 ) ( CLEAR ?auto_576 ) ( IS-CRATE ?auto_575 ) ( not ( = ?auto_575 ?auto_576 ) ) ( AVAILABLE ?auto_579 ) ( TRUCK-AT ?auto_580 ?auto_578 ) ( not ( = ?auto_578 ?auto_577 ) ) ( HOIST-AT ?auto_581 ?auto_578 ) ( not ( = ?auto_579 ?auto_581 ) ) ( AVAILABLE ?auto_581 ) ( SURFACE-AT ?auto_575 ?auto_578 ) ( ON ?auto_575 ?auto_582 ) ( CLEAR ?auto_575 ) ( not ( = ?auto_575 ?auto_582 ) ) ( not ( = ?auto_576 ?auto_582 ) ) )
    :subtasks
    ( ( !LIFT ?auto_581 ?auto_575 ?auto_582 ?auto_578 )
      ( MAKE-ON ?auto_575 ?auto_576 )
      ( MAKE-ON-VERIFY ?auto_575 ?auto_576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_583 - SURFACE
      ?auto_584 - SURFACE
    )
    :vars
    (
      ?auto_587 - HOIST
      ?auto_588 - PLACE
      ?auto_589 - PLACE
      ?auto_586 - HOIST
      ?auto_585 - SURFACE
      ?auto_590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_587 ?auto_588 ) ( SURFACE-AT ?auto_584 ?auto_588 ) ( CLEAR ?auto_584 ) ( IS-CRATE ?auto_583 ) ( not ( = ?auto_583 ?auto_584 ) ) ( AVAILABLE ?auto_587 ) ( not ( = ?auto_589 ?auto_588 ) ) ( HOIST-AT ?auto_586 ?auto_589 ) ( not ( = ?auto_587 ?auto_586 ) ) ( AVAILABLE ?auto_586 ) ( SURFACE-AT ?auto_583 ?auto_589 ) ( ON ?auto_583 ?auto_585 ) ( CLEAR ?auto_583 ) ( not ( = ?auto_583 ?auto_585 ) ) ( not ( = ?auto_584 ?auto_585 ) ) ( TRUCK-AT ?auto_590 ?auto_588 ) )
    :subtasks
    ( ( !DRIVE ?auto_590 ?auto_588 ?auto_589 )
      ( MAKE-ON ?auto_583 ?auto_584 )
      ( MAKE-ON-VERIFY ?auto_583 ?auto_584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_593 - SURFACE
      ?auto_594 - SURFACE
    )
    :vars
    (
      ?auto_595 - HOIST
      ?auto_596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_595 ?auto_596 ) ( SURFACE-AT ?auto_594 ?auto_596 ) ( CLEAR ?auto_594 ) ( LIFTING ?auto_595 ?auto_593 ) ( IS-CRATE ?auto_593 ) ( not ( = ?auto_593 ?auto_594 ) ) )
    :subtasks
    ( ( !DROP ?auto_595 ?auto_593 ?auto_594 ?auto_596 )
      ( MAKE-ON-VERIFY ?auto_593 ?auto_594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_597 - SURFACE
      ?auto_598 - SURFACE
    )
    :vars
    (
      ?auto_600 - HOIST
      ?auto_599 - PLACE
      ?auto_601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_600 ?auto_599 ) ( SURFACE-AT ?auto_598 ?auto_599 ) ( CLEAR ?auto_598 ) ( IS-CRATE ?auto_597 ) ( not ( = ?auto_597 ?auto_598 ) ) ( TRUCK-AT ?auto_601 ?auto_599 ) ( AVAILABLE ?auto_600 ) ( IN ?auto_597 ?auto_601 ) )
    :subtasks
    ( ( !UNLOAD ?auto_600 ?auto_597 ?auto_601 ?auto_599 )
      ( MAKE-ON ?auto_597 ?auto_598 )
      ( MAKE-ON-VERIFY ?auto_597 ?auto_598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_606 - HOIST
      ?auto_605 - PLACE
      ?auto_604 - TRUCK
      ?auto_607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606 ?auto_605 ) ( SURFACE-AT ?auto_603 ?auto_605 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_602 ) ( not ( = ?auto_602 ?auto_603 ) ) ( AVAILABLE ?auto_606 ) ( IN ?auto_602 ?auto_604 ) ( TRUCK-AT ?auto_604 ?auto_607 ) ( not ( = ?auto_607 ?auto_605 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_604 ?auto_607 ?auto_605 )
      ( MAKE-ON ?auto_602 ?auto_603 )
      ( MAKE-ON-VERIFY ?auto_602 ?auto_603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_608 - SURFACE
      ?auto_609 - SURFACE
    )
    :vars
    (
      ?auto_611 - HOIST
      ?auto_613 - PLACE
      ?auto_612 - TRUCK
      ?auto_610 - PLACE
      ?auto_614 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_611 ?auto_613 ) ( SURFACE-AT ?auto_609 ?auto_613 ) ( CLEAR ?auto_609 ) ( IS-CRATE ?auto_608 ) ( not ( = ?auto_608 ?auto_609 ) ) ( AVAILABLE ?auto_611 ) ( TRUCK-AT ?auto_612 ?auto_610 ) ( not ( = ?auto_610 ?auto_613 ) ) ( HOIST-AT ?auto_614 ?auto_610 ) ( LIFTING ?auto_614 ?auto_608 ) ( not ( = ?auto_611 ?auto_614 ) ) )
    :subtasks
    ( ( !LOAD ?auto_614 ?auto_608 ?auto_612 ?auto_610 )
      ( MAKE-ON ?auto_608 ?auto_609 )
      ( MAKE-ON-VERIFY ?auto_608 ?auto_609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_615 - SURFACE
      ?auto_616 - SURFACE
    )
    :vars
    (
      ?auto_618 - HOIST
      ?auto_621 - PLACE
      ?auto_619 - TRUCK
      ?auto_617 - PLACE
      ?auto_620 - HOIST
      ?auto_622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_618 ?auto_621 ) ( SURFACE-AT ?auto_616 ?auto_621 ) ( CLEAR ?auto_616 ) ( IS-CRATE ?auto_615 ) ( not ( = ?auto_615 ?auto_616 ) ) ( AVAILABLE ?auto_618 ) ( TRUCK-AT ?auto_619 ?auto_617 ) ( not ( = ?auto_617 ?auto_621 ) ) ( HOIST-AT ?auto_620 ?auto_617 ) ( not ( = ?auto_618 ?auto_620 ) ) ( AVAILABLE ?auto_620 ) ( SURFACE-AT ?auto_615 ?auto_617 ) ( ON ?auto_615 ?auto_622 ) ( CLEAR ?auto_615 ) ( not ( = ?auto_615 ?auto_622 ) ) ( not ( = ?auto_616 ?auto_622 ) ) )
    :subtasks
    ( ( !LIFT ?auto_620 ?auto_615 ?auto_622 ?auto_617 )
      ( MAKE-ON ?auto_615 ?auto_616 )
      ( MAKE-ON-VERIFY ?auto_615 ?auto_616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_623 - SURFACE
      ?auto_624 - SURFACE
    )
    :vars
    (
      ?auto_628 - HOIST
      ?auto_627 - PLACE
      ?auto_630 - PLACE
      ?auto_629 - HOIST
      ?auto_625 - SURFACE
      ?auto_626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_628 ?auto_627 ) ( SURFACE-AT ?auto_624 ?auto_627 ) ( CLEAR ?auto_624 ) ( IS-CRATE ?auto_623 ) ( not ( = ?auto_623 ?auto_624 ) ) ( AVAILABLE ?auto_628 ) ( not ( = ?auto_630 ?auto_627 ) ) ( HOIST-AT ?auto_629 ?auto_630 ) ( not ( = ?auto_628 ?auto_629 ) ) ( AVAILABLE ?auto_629 ) ( SURFACE-AT ?auto_623 ?auto_630 ) ( ON ?auto_623 ?auto_625 ) ( CLEAR ?auto_623 ) ( not ( = ?auto_623 ?auto_625 ) ) ( not ( = ?auto_624 ?auto_625 ) ) ( TRUCK-AT ?auto_626 ?auto_627 ) )
    :subtasks
    ( ( !DRIVE ?auto_626 ?auto_627 ?auto_630 )
      ( MAKE-ON ?auto_623 ?auto_624 )
      ( MAKE-ON-VERIFY ?auto_623 ?auto_624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_631 - SURFACE
      ?auto_632 - SURFACE
    )
    :vars
    (
      ?auto_633 - HOIST
      ?auto_634 - PLACE
      ?auto_636 - PLACE
      ?auto_635 - HOIST
      ?auto_638 - SURFACE
      ?auto_637 - TRUCK
      ?auto_639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_633 ?auto_634 ) ( IS-CRATE ?auto_631 ) ( not ( = ?auto_631 ?auto_632 ) ) ( not ( = ?auto_636 ?auto_634 ) ) ( HOIST-AT ?auto_635 ?auto_636 ) ( not ( = ?auto_633 ?auto_635 ) ) ( AVAILABLE ?auto_635 ) ( SURFACE-AT ?auto_631 ?auto_636 ) ( ON ?auto_631 ?auto_638 ) ( CLEAR ?auto_631 ) ( not ( = ?auto_631 ?auto_638 ) ) ( not ( = ?auto_632 ?auto_638 ) ) ( TRUCK-AT ?auto_637 ?auto_634 ) ( SURFACE-AT ?auto_639 ?auto_634 ) ( CLEAR ?auto_639 ) ( LIFTING ?auto_633 ?auto_632 ) ( IS-CRATE ?auto_632 ) ( not ( = ?auto_631 ?auto_639 ) ) ( not ( = ?auto_632 ?auto_639 ) ) ( not ( = ?auto_638 ?auto_639 ) ) )
    :subtasks
    ( ( !DROP ?auto_633 ?auto_632 ?auto_639 ?auto_634 )
      ( MAKE-ON ?auto_631 ?auto_632 )
      ( MAKE-ON-VERIFY ?auto_631 ?auto_632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_640 - SURFACE
      ?auto_641 - SURFACE
    )
    :vars
    (
      ?auto_647 - HOIST
      ?auto_645 - PLACE
      ?auto_648 - PLACE
      ?auto_644 - HOIST
      ?auto_646 - SURFACE
      ?auto_642 - TRUCK
      ?auto_643 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_647 ?auto_645 ) ( IS-CRATE ?auto_640 ) ( not ( = ?auto_640 ?auto_641 ) ) ( not ( = ?auto_648 ?auto_645 ) ) ( HOIST-AT ?auto_644 ?auto_648 ) ( not ( = ?auto_647 ?auto_644 ) ) ( AVAILABLE ?auto_644 ) ( SURFACE-AT ?auto_640 ?auto_648 ) ( ON ?auto_640 ?auto_646 ) ( CLEAR ?auto_640 ) ( not ( = ?auto_640 ?auto_646 ) ) ( not ( = ?auto_641 ?auto_646 ) ) ( TRUCK-AT ?auto_642 ?auto_645 ) ( SURFACE-AT ?auto_643 ?auto_645 ) ( CLEAR ?auto_643 ) ( IS-CRATE ?auto_641 ) ( not ( = ?auto_640 ?auto_643 ) ) ( not ( = ?auto_641 ?auto_643 ) ) ( not ( = ?auto_646 ?auto_643 ) ) ( AVAILABLE ?auto_647 ) ( IN ?auto_641 ?auto_642 ) )
    :subtasks
    ( ( !UNLOAD ?auto_647 ?auto_641 ?auto_642 ?auto_645 )
      ( MAKE-ON ?auto_640 ?auto_641 )
      ( MAKE-ON-VERIFY ?auto_640 ?auto_641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_649 - SURFACE
      ?auto_650 - SURFACE
    )
    :vars
    (
      ?auto_655 - HOIST
      ?auto_657 - PLACE
      ?auto_654 - PLACE
      ?auto_652 - HOIST
      ?auto_656 - SURFACE
      ?auto_651 - SURFACE
      ?auto_653 - TRUCK
      ?auto_658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_655 ?auto_657 ) ( IS-CRATE ?auto_649 ) ( not ( = ?auto_649 ?auto_650 ) ) ( not ( = ?auto_654 ?auto_657 ) ) ( HOIST-AT ?auto_652 ?auto_654 ) ( not ( = ?auto_655 ?auto_652 ) ) ( AVAILABLE ?auto_652 ) ( SURFACE-AT ?auto_649 ?auto_654 ) ( ON ?auto_649 ?auto_656 ) ( CLEAR ?auto_649 ) ( not ( = ?auto_649 ?auto_656 ) ) ( not ( = ?auto_650 ?auto_656 ) ) ( SURFACE-AT ?auto_651 ?auto_657 ) ( CLEAR ?auto_651 ) ( IS-CRATE ?auto_650 ) ( not ( = ?auto_649 ?auto_651 ) ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_656 ?auto_651 ) ) ( AVAILABLE ?auto_655 ) ( IN ?auto_650 ?auto_653 ) ( TRUCK-AT ?auto_653 ?auto_658 ) ( not ( = ?auto_658 ?auto_657 ) ) ( not ( = ?auto_654 ?auto_658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_653 ?auto_658 ?auto_657 )
      ( MAKE-ON ?auto_649 ?auto_650 )
      ( MAKE-ON-VERIFY ?auto_649 ?auto_650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_659 - SURFACE
      ?auto_660 - SURFACE
    )
    :vars
    (
      ?auto_662 - HOIST
      ?auto_665 - PLACE
      ?auto_664 - PLACE
      ?auto_661 - HOIST
      ?auto_666 - SURFACE
      ?auto_668 - SURFACE
      ?auto_663 - TRUCK
      ?auto_667 - PLACE
      ?auto_669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_662 ?auto_665 ) ( IS-CRATE ?auto_659 ) ( not ( = ?auto_659 ?auto_660 ) ) ( not ( = ?auto_664 ?auto_665 ) ) ( HOIST-AT ?auto_661 ?auto_664 ) ( not ( = ?auto_662 ?auto_661 ) ) ( AVAILABLE ?auto_661 ) ( SURFACE-AT ?auto_659 ?auto_664 ) ( ON ?auto_659 ?auto_666 ) ( CLEAR ?auto_659 ) ( not ( = ?auto_659 ?auto_666 ) ) ( not ( = ?auto_660 ?auto_666 ) ) ( SURFACE-AT ?auto_668 ?auto_665 ) ( CLEAR ?auto_668 ) ( IS-CRATE ?auto_660 ) ( not ( = ?auto_659 ?auto_668 ) ) ( not ( = ?auto_660 ?auto_668 ) ) ( not ( = ?auto_666 ?auto_668 ) ) ( AVAILABLE ?auto_662 ) ( TRUCK-AT ?auto_663 ?auto_667 ) ( not ( = ?auto_667 ?auto_665 ) ) ( not ( = ?auto_664 ?auto_667 ) ) ( HOIST-AT ?auto_669 ?auto_667 ) ( LIFTING ?auto_669 ?auto_660 ) ( not ( = ?auto_662 ?auto_669 ) ) ( not ( = ?auto_661 ?auto_669 ) ) )
    :subtasks
    ( ( !LOAD ?auto_669 ?auto_660 ?auto_663 ?auto_667 )
      ( MAKE-ON ?auto_659 ?auto_660 )
      ( MAKE-ON-VERIFY ?auto_659 ?auto_660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_670 - SURFACE
      ?auto_671 - SURFACE
    )
    :vars
    (
      ?auto_678 - HOIST
      ?auto_677 - PLACE
      ?auto_673 - PLACE
      ?auto_680 - HOIST
      ?auto_676 - SURFACE
      ?auto_675 - SURFACE
      ?auto_674 - TRUCK
      ?auto_672 - PLACE
      ?auto_679 - HOIST
      ?auto_681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_678 ?auto_677 ) ( IS-CRATE ?auto_670 ) ( not ( = ?auto_670 ?auto_671 ) ) ( not ( = ?auto_673 ?auto_677 ) ) ( HOIST-AT ?auto_680 ?auto_673 ) ( not ( = ?auto_678 ?auto_680 ) ) ( AVAILABLE ?auto_680 ) ( SURFACE-AT ?auto_670 ?auto_673 ) ( ON ?auto_670 ?auto_676 ) ( CLEAR ?auto_670 ) ( not ( = ?auto_670 ?auto_676 ) ) ( not ( = ?auto_671 ?auto_676 ) ) ( SURFACE-AT ?auto_675 ?auto_677 ) ( CLEAR ?auto_675 ) ( IS-CRATE ?auto_671 ) ( not ( = ?auto_670 ?auto_675 ) ) ( not ( = ?auto_671 ?auto_675 ) ) ( not ( = ?auto_676 ?auto_675 ) ) ( AVAILABLE ?auto_678 ) ( TRUCK-AT ?auto_674 ?auto_672 ) ( not ( = ?auto_672 ?auto_677 ) ) ( not ( = ?auto_673 ?auto_672 ) ) ( HOIST-AT ?auto_679 ?auto_672 ) ( not ( = ?auto_678 ?auto_679 ) ) ( not ( = ?auto_680 ?auto_679 ) ) ( AVAILABLE ?auto_679 ) ( SURFACE-AT ?auto_671 ?auto_672 ) ( ON ?auto_671 ?auto_681 ) ( CLEAR ?auto_671 ) ( not ( = ?auto_670 ?auto_681 ) ) ( not ( = ?auto_671 ?auto_681 ) ) ( not ( = ?auto_676 ?auto_681 ) ) ( not ( = ?auto_675 ?auto_681 ) ) )
    :subtasks
    ( ( !LIFT ?auto_679 ?auto_671 ?auto_681 ?auto_672 )
      ( MAKE-ON ?auto_670 ?auto_671 )
      ( MAKE-ON-VERIFY ?auto_670 ?auto_671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_682 - SURFACE
      ?auto_683 - SURFACE
    )
    :vars
    (
      ?auto_690 - HOIST
      ?auto_686 - PLACE
      ?auto_691 - PLACE
      ?auto_689 - HOIST
      ?auto_685 - SURFACE
      ?auto_688 - SURFACE
      ?auto_687 - PLACE
      ?auto_692 - HOIST
      ?auto_693 - SURFACE
      ?auto_684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_690 ?auto_686 ) ( IS-CRATE ?auto_682 ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_691 ?auto_686 ) ) ( HOIST-AT ?auto_689 ?auto_691 ) ( not ( = ?auto_690 ?auto_689 ) ) ( AVAILABLE ?auto_689 ) ( SURFACE-AT ?auto_682 ?auto_691 ) ( ON ?auto_682 ?auto_685 ) ( CLEAR ?auto_682 ) ( not ( = ?auto_682 ?auto_685 ) ) ( not ( = ?auto_683 ?auto_685 ) ) ( SURFACE-AT ?auto_688 ?auto_686 ) ( CLEAR ?auto_688 ) ( IS-CRATE ?auto_683 ) ( not ( = ?auto_682 ?auto_688 ) ) ( not ( = ?auto_683 ?auto_688 ) ) ( not ( = ?auto_685 ?auto_688 ) ) ( AVAILABLE ?auto_690 ) ( not ( = ?auto_687 ?auto_686 ) ) ( not ( = ?auto_691 ?auto_687 ) ) ( HOIST-AT ?auto_692 ?auto_687 ) ( not ( = ?auto_690 ?auto_692 ) ) ( not ( = ?auto_689 ?auto_692 ) ) ( AVAILABLE ?auto_692 ) ( SURFACE-AT ?auto_683 ?auto_687 ) ( ON ?auto_683 ?auto_693 ) ( CLEAR ?auto_683 ) ( not ( = ?auto_682 ?auto_693 ) ) ( not ( = ?auto_683 ?auto_693 ) ) ( not ( = ?auto_685 ?auto_693 ) ) ( not ( = ?auto_688 ?auto_693 ) ) ( TRUCK-AT ?auto_684 ?auto_686 ) )
    :subtasks
    ( ( !DRIVE ?auto_684 ?auto_686 ?auto_687 )
      ( MAKE-ON ?auto_682 ?auto_683 )
      ( MAKE-ON-VERIFY ?auto_682 ?auto_683 ) )
  )

)

