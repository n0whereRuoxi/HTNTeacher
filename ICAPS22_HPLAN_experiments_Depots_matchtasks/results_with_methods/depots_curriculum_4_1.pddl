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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_582 - SURFACE
      ?auto_583 - SURFACE
    )
    :vars
    (
      ?auto_584 - HOIST
      ?auto_585 - PLACE
      ?auto_587 - PLACE
      ?auto_588 - HOIST
      ?auto_589 - SURFACE
      ?auto_586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_584 ?auto_585 ) ( SURFACE-AT ?auto_582 ?auto_585 ) ( CLEAR ?auto_582 ) ( IS-CRATE ?auto_583 ) ( AVAILABLE ?auto_584 ) ( not ( = ?auto_587 ?auto_585 ) ) ( HOIST-AT ?auto_588 ?auto_587 ) ( AVAILABLE ?auto_588 ) ( SURFACE-AT ?auto_583 ?auto_587 ) ( ON ?auto_583 ?auto_589 ) ( CLEAR ?auto_583 ) ( TRUCK-AT ?auto_586 ?auto_585 ) ( not ( = ?auto_582 ?auto_583 ) ) ( not ( = ?auto_582 ?auto_589 ) ) ( not ( = ?auto_583 ?auto_589 ) ) ( not ( = ?auto_584 ?auto_588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_586 ?auto_585 ?auto_587 )
      ( !LIFT ?auto_588 ?auto_583 ?auto_589 ?auto_587 )
      ( !LOAD ?auto_588 ?auto_583 ?auto_586 ?auto_587 )
      ( !DRIVE ?auto_586 ?auto_587 ?auto_585 )
      ( !UNLOAD ?auto_584 ?auto_583 ?auto_586 ?auto_585 )
      ( !DROP ?auto_584 ?auto_583 ?auto_582 ?auto_585 )
      ( MAKE-1CRATE-VERIFY ?auto_582 ?auto_583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592 - SURFACE
      ?auto_593 - SURFACE
    )
    :vars
    (
      ?auto_594 - HOIST
      ?auto_595 - PLACE
      ?auto_597 - PLACE
      ?auto_598 - HOIST
      ?auto_599 - SURFACE
      ?auto_596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594 ?auto_595 ) ( SURFACE-AT ?auto_592 ?auto_595 ) ( CLEAR ?auto_592 ) ( IS-CRATE ?auto_593 ) ( AVAILABLE ?auto_594 ) ( not ( = ?auto_597 ?auto_595 ) ) ( HOIST-AT ?auto_598 ?auto_597 ) ( AVAILABLE ?auto_598 ) ( SURFACE-AT ?auto_593 ?auto_597 ) ( ON ?auto_593 ?auto_599 ) ( CLEAR ?auto_593 ) ( TRUCK-AT ?auto_596 ?auto_595 ) ( not ( = ?auto_592 ?auto_593 ) ) ( not ( = ?auto_592 ?auto_599 ) ) ( not ( = ?auto_593 ?auto_599 ) ) ( not ( = ?auto_594 ?auto_598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_596 ?auto_595 ?auto_597 )
      ( !LIFT ?auto_598 ?auto_593 ?auto_599 ?auto_597 )
      ( !LOAD ?auto_598 ?auto_593 ?auto_596 ?auto_597 )
      ( !DRIVE ?auto_596 ?auto_597 ?auto_595 )
      ( !UNLOAD ?auto_594 ?auto_593 ?auto_596 ?auto_595 )
      ( !DROP ?auto_594 ?auto_593 ?auto_592 ?auto_595 )
      ( MAKE-1CRATE-VERIFY ?auto_592 ?auto_593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_603 - SURFACE
      ?auto_604 - SURFACE
      ?auto_605 - SURFACE
    )
    :vars
    (
      ?auto_606 - HOIST
      ?auto_608 - PLACE
      ?auto_607 - PLACE
      ?auto_611 - HOIST
      ?auto_609 - SURFACE
      ?auto_612 - PLACE
      ?auto_613 - HOIST
      ?auto_614 - SURFACE
      ?auto_610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606 ?auto_608 ) ( IS-CRATE ?auto_605 ) ( not ( = ?auto_607 ?auto_608 ) ) ( HOIST-AT ?auto_611 ?auto_607 ) ( AVAILABLE ?auto_611 ) ( SURFACE-AT ?auto_605 ?auto_607 ) ( ON ?auto_605 ?auto_609 ) ( CLEAR ?auto_605 ) ( not ( = ?auto_604 ?auto_605 ) ) ( not ( = ?auto_604 ?auto_609 ) ) ( not ( = ?auto_605 ?auto_609 ) ) ( not ( = ?auto_606 ?auto_611 ) ) ( SURFACE-AT ?auto_603 ?auto_608 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_604 ) ( AVAILABLE ?auto_606 ) ( not ( = ?auto_612 ?auto_608 ) ) ( HOIST-AT ?auto_613 ?auto_612 ) ( AVAILABLE ?auto_613 ) ( SURFACE-AT ?auto_604 ?auto_612 ) ( ON ?auto_604 ?auto_614 ) ( CLEAR ?auto_604 ) ( TRUCK-AT ?auto_610 ?auto_608 ) ( not ( = ?auto_603 ?auto_604 ) ) ( not ( = ?auto_603 ?auto_614 ) ) ( not ( = ?auto_604 ?auto_614 ) ) ( not ( = ?auto_606 ?auto_613 ) ) ( not ( = ?auto_603 ?auto_605 ) ) ( not ( = ?auto_603 ?auto_609 ) ) ( not ( = ?auto_605 ?auto_614 ) ) ( not ( = ?auto_607 ?auto_612 ) ) ( not ( = ?auto_611 ?auto_613 ) ) ( not ( = ?auto_609 ?auto_614 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_603 ?auto_604 )
      ( MAKE-1CRATE ?auto_604 ?auto_605 )
      ( MAKE-2CRATE-VERIFY ?auto_603 ?auto_604 ?auto_605 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_617 - SURFACE
      ?auto_618 - SURFACE
    )
    :vars
    (
      ?auto_619 - HOIST
      ?auto_620 - PLACE
      ?auto_622 - PLACE
      ?auto_623 - HOIST
      ?auto_624 - SURFACE
      ?auto_621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_619 ?auto_620 ) ( SURFACE-AT ?auto_617 ?auto_620 ) ( CLEAR ?auto_617 ) ( IS-CRATE ?auto_618 ) ( AVAILABLE ?auto_619 ) ( not ( = ?auto_622 ?auto_620 ) ) ( HOIST-AT ?auto_623 ?auto_622 ) ( AVAILABLE ?auto_623 ) ( SURFACE-AT ?auto_618 ?auto_622 ) ( ON ?auto_618 ?auto_624 ) ( CLEAR ?auto_618 ) ( TRUCK-AT ?auto_621 ?auto_620 ) ( not ( = ?auto_617 ?auto_618 ) ) ( not ( = ?auto_617 ?auto_624 ) ) ( not ( = ?auto_618 ?auto_624 ) ) ( not ( = ?auto_619 ?auto_623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_621 ?auto_620 ?auto_622 )
      ( !LIFT ?auto_623 ?auto_618 ?auto_624 ?auto_622 )
      ( !LOAD ?auto_623 ?auto_618 ?auto_621 ?auto_622 )
      ( !DRIVE ?auto_621 ?auto_622 ?auto_620 )
      ( !UNLOAD ?auto_619 ?auto_618 ?auto_621 ?auto_620 )
      ( !DROP ?auto_619 ?auto_618 ?auto_617 ?auto_620 )
      ( MAKE-1CRATE-VERIFY ?auto_617 ?auto_618 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_629 - SURFACE
      ?auto_630 - SURFACE
      ?auto_631 - SURFACE
      ?auto_632 - SURFACE
    )
    :vars
    (
      ?auto_635 - HOIST
      ?auto_634 - PLACE
      ?auto_636 - PLACE
      ?auto_638 - HOIST
      ?auto_637 - SURFACE
      ?auto_643 - PLACE
      ?auto_640 - HOIST
      ?auto_644 - SURFACE
      ?auto_639 - PLACE
      ?auto_641 - HOIST
      ?auto_642 - SURFACE
      ?auto_633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_635 ?auto_634 ) ( IS-CRATE ?auto_632 ) ( not ( = ?auto_636 ?auto_634 ) ) ( HOIST-AT ?auto_638 ?auto_636 ) ( AVAILABLE ?auto_638 ) ( SURFACE-AT ?auto_632 ?auto_636 ) ( ON ?auto_632 ?auto_637 ) ( CLEAR ?auto_632 ) ( not ( = ?auto_631 ?auto_632 ) ) ( not ( = ?auto_631 ?auto_637 ) ) ( not ( = ?auto_632 ?auto_637 ) ) ( not ( = ?auto_635 ?auto_638 ) ) ( IS-CRATE ?auto_631 ) ( not ( = ?auto_643 ?auto_634 ) ) ( HOIST-AT ?auto_640 ?auto_643 ) ( AVAILABLE ?auto_640 ) ( SURFACE-AT ?auto_631 ?auto_643 ) ( ON ?auto_631 ?auto_644 ) ( CLEAR ?auto_631 ) ( not ( = ?auto_630 ?auto_631 ) ) ( not ( = ?auto_630 ?auto_644 ) ) ( not ( = ?auto_631 ?auto_644 ) ) ( not ( = ?auto_635 ?auto_640 ) ) ( SURFACE-AT ?auto_629 ?auto_634 ) ( CLEAR ?auto_629 ) ( IS-CRATE ?auto_630 ) ( AVAILABLE ?auto_635 ) ( not ( = ?auto_639 ?auto_634 ) ) ( HOIST-AT ?auto_641 ?auto_639 ) ( AVAILABLE ?auto_641 ) ( SURFACE-AT ?auto_630 ?auto_639 ) ( ON ?auto_630 ?auto_642 ) ( CLEAR ?auto_630 ) ( TRUCK-AT ?auto_633 ?auto_634 ) ( not ( = ?auto_629 ?auto_630 ) ) ( not ( = ?auto_629 ?auto_642 ) ) ( not ( = ?auto_630 ?auto_642 ) ) ( not ( = ?auto_635 ?auto_641 ) ) ( not ( = ?auto_629 ?auto_631 ) ) ( not ( = ?auto_629 ?auto_644 ) ) ( not ( = ?auto_631 ?auto_642 ) ) ( not ( = ?auto_643 ?auto_639 ) ) ( not ( = ?auto_640 ?auto_641 ) ) ( not ( = ?auto_644 ?auto_642 ) ) ( not ( = ?auto_629 ?auto_632 ) ) ( not ( = ?auto_629 ?auto_637 ) ) ( not ( = ?auto_630 ?auto_632 ) ) ( not ( = ?auto_630 ?auto_637 ) ) ( not ( = ?auto_632 ?auto_644 ) ) ( not ( = ?auto_632 ?auto_642 ) ) ( not ( = ?auto_636 ?auto_643 ) ) ( not ( = ?auto_636 ?auto_639 ) ) ( not ( = ?auto_638 ?auto_640 ) ) ( not ( = ?auto_638 ?auto_641 ) ) ( not ( = ?auto_637 ?auto_644 ) ) ( not ( = ?auto_637 ?auto_642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_629 ?auto_630 ?auto_631 )
      ( MAKE-1CRATE ?auto_631 ?auto_632 )
      ( MAKE-3CRATE-VERIFY ?auto_629 ?auto_630 ?auto_631 ?auto_632 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_647 - SURFACE
      ?auto_648 - SURFACE
    )
    :vars
    (
      ?auto_649 - HOIST
      ?auto_650 - PLACE
      ?auto_652 - PLACE
      ?auto_653 - HOIST
      ?auto_654 - SURFACE
      ?auto_651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649 ?auto_650 ) ( SURFACE-AT ?auto_647 ?auto_650 ) ( CLEAR ?auto_647 ) ( IS-CRATE ?auto_648 ) ( AVAILABLE ?auto_649 ) ( not ( = ?auto_652 ?auto_650 ) ) ( HOIST-AT ?auto_653 ?auto_652 ) ( AVAILABLE ?auto_653 ) ( SURFACE-AT ?auto_648 ?auto_652 ) ( ON ?auto_648 ?auto_654 ) ( CLEAR ?auto_648 ) ( TRUCK-AT ?auto_651 ?auto_650 ) ( not ( = ?auto_647 ?auto_648 ) ) ( not ( = ?auto_647 ?auto_654 ) ) ( not ( = ?auto_648 ?auto_654 ) ) ( not ( = ?auto_649 ?auto_653 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_651 ?auto_650 ?auto_652 )
      ( !LIFT ?auto_653 ?auto_648 ?auto_654 ?auto_652 )
      ( !LOAD ?auto_653 ?auto_648 ?auto_651 ?auto_652 )
      ( !DRIVE ?auto_651 ?auto_652 ?auto_650 )
      ( !UNLOAD ?auto_649 ?auto_648 ?auto_651 ?auto_650 )
      ( !DROP ?auto_649 ?auto_648 ?auto_647 ?auto_650 )
      ( MAKE-1CRATE-VERIFY ?auto_647 ?auto_648 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_660 - SURFACE
      ?auto_661 - SURFACE
      ?auto_662 - SURFACE
      ?auto_663 - SURFACE
      ?auto_664 - SURFACE
    )
    :vars
    (
      ?auto_666 - HOIST
      ?auto_669 - PLACE
      ?auto_670 - PLACE
      ?auto_668 - HOIST
      ?auto_667 - SURFACE
      ?auto_678 - PLACE
      ?auto_677 - HOIST
      ?auto_679 - SURFACE
      ?auto_671 - PLACE
      ?auto_672 - HOIST
      ?auto_674 - SURFACE
      ?auto_673 - PLACE
      ?auto_675 - HOIST
      ?auto_676 - SURFACE
      ?auto_665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_666 ?auto_669 ) ( IS-CRATE ?auto_664 ) ( not ( = ?auto_670 ?auto_669 ) ) ( HOIST-AT ?auto_668 ?auto_670 ) ( AVAILABLE ?auto_668 ) ( SURFACE-AT ?auto_664 ?auto_670 ) ( ON ?auto_664 ?auto_667 ) ( CLEAR ?auto_664 ) ( not ( = ?auto_663 ?auto_664 ) ) ( not ( = ?auto_663 ?auto_667 ) ) ( not ( = ?auto_664 ?auto_667 ) ) ( not ( = ?auto_666 ?auto_668 ) ) ( IS-CRATE ?auto_663 ) ( not ( = ?auto_678 ?auto_669 ) ) ( HOIST-AT ?auto_677 ?auto_678 ) ( AVAILABLE ?auto_677 ) ( SURFACE-AT ?auto_663 ?auto_678 ) ( ON ?auto_663 ?auto_679 ) ( CLEAR ?auto_663 ) ( not ( = ?auto_662 ?auto_663 ) ) ( not ( = ?auto_662 ?auto_679 ) ) ( not ( = ?auto_663 ?auto_679 ) ) ( not ( = ?auto_666 ?auto_677 ) ) ( IS-CRATE ?auto_662 ) ( not ( = ?auto_671 ?auto_669 ) ) ( HOIST-AT ?auto_672 ?auto_671 ) ( AVAILABLE ?auto_672 ) ( SURFACE-AT ?auto_662 ?auto_671 ) ( ON ?auto_662 ?auto_674 ) ( CLEAR ?auto_662 ) ( not ( = ?auto_661 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_674 ) ) ( not ( = ?auto_662 ?auto_674 ) ) ( not ( = ?auto_666 ?auto_672 ) ) ( SURFACE-AT ?auto_660 ?auto_669 ) ( CLEAR ?auto_660 ) ( IS-CRATE ?auto_661 ) ( AVAILABLE ?auto_666 ) ( not ( = ?auto_673 ?auto_669 ) ) ( HOIST-AT ?auto_675 ?auto_673 ) ( AVAILABLE ?auto_675 ) ( SURFACE-AT ?auto_661 ?auto_673 ) ( ON ?auto_661 ?auto_676 ) ( CLEAR ?auto_661 ) ( TRUCK-AT ?auto_665 ?auto_669 ) ( not ( = ?auto_660 ?auto_661 ) ) ( not ( = ?auto_660 ?auto_676 ) ) ( not ( = ?auto_661 ?auto_676 ) ) ( not ( = ?auto_666 ?auto_675 ) ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_660 ?auto_674 ) ) ( not ( = ?auto_662 ?auto_676 ) ) ( not ( = ?auto_671 ?auto_673 ) ) ( not ( = ?auto_672 ?auto_675 ) ) ( not ( = ?auto_674 ?auto_676 ) ) ( not ( = ?auto_660 ?auto_663 ) ) ( not ( = ?auto_660 ?auto_679 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_661 ?auto_679 ) ) ( not ( = ?auto_663 ?auto_674 ) ) ( not ( = ?auto_663 ?auto_676 ) ) ( not ( = ?auto_678 ?auto_671 ) ) ( not ( = ?auto_678 ?auto_673 ) ) ( not ( = ?auto_677 ?auto_672 ) ) ( not ( = ?auto_677 ?auto_675 ) ) ( not ( = ?auto_679 ?auto_674 ) ) ( not ( = ?auto_679 ?auto_676 ) ) ( not ( = ?auto_660 ?auto_664 ) ) ( not ( = ?auto_660 ?auto_667 ) ) ( not ( = ?auto_661 ?auto_664 ) ) ( not ( = ?auto_661 ?auto_667 ) ) ( not ( = ?auto_662 ?auto_664 ) ) ( not ( = ?auto_662 ?auto_667 ) ) ( not ( = ?auto_664 ?auto_679 ) ) ( not ( = ?auto_664 ?auto_674 ) ) ( not ( = ?auto_664 ?auto_676 ) ) ( not ( = ?auto_670 ?auto_678 ) ) ( not ( = ?auto_670 ?auto_671 ) ) ( not ( = ?auto_670 ?auto_673 ) ) ( not ( = ?auto_668 ?auto_677 ) ) ( not ( = ?auto_668 ?auto_672 ) ) ( not ( = ?auto_668 ?auto_675 ) ) ( not ( = ?auto_667 ?auto_679 ) ) ( not ( = ?auto_667 ?auto_674 ) ) ( not ( = ?auto_667 ?auto_676 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_660 ?auto_661 ?auto_662 ?auto_663 )
      ( MAKE-1CRATE ?auto_663 ?auto_664 )
      ( MAKE-4CRATE-VERIFY ?auto_660 ?auto_661 ?auto_662 ?auto_663 ?auto_664 ) )
  )

)

