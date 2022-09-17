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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_603 - SURFACE
      ?auto_604 - SURFACE
      ?auto_605 - SURFACE
    )
    :vars
    (
      ?auto_609 - HOIST
      ?auto_606 - PLACE
      ?auto_611 - PLACE
      ?auto_610 - HOIST
      ?auto_607 - SURFACE
      ?auto_612 - PLACE
      ?auto_614 - HOIST
      ?auto_613 - SURFACE
      ?auto_608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_609 ?auto_606 ) ( IS-CRATE ?auto_605 ) ( not ( = ?auto_611 ?auto_606 ) ) ( HOIST-AT ?auto_610 ?auto_611 ) ( AVAILABLE ?auto_610 ) ( SURFACE-AT ?auto_605 ?auto_611 ) ( ON ?auto_605 ?auto_607 ) ( CLEAR ?auto_605 ) ( not ( = ?auto_604 ?auto_605 ) ) ( not ( = ?auto_604 ?auto_607 ) ) ( not ( = ?auto_605 ?auto_607 ) ) ( not ( = ?auto_609 ?auto_610 ) ) ( SURFACE-AT ?auto_603 ?auto_606 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_604 ) ( AVAILABLE ?auto_609 ) ( not ( = ?auto_612 ?auto_606 ) ) ( HOIST-AT ?auto_614 ?auto_612 ) ( AVAILABLE ?auto_614 ) ( SURFACE-AT ?auto_604 ?auto_612 ) ( ON ?auto_604 ?auto_613 ) ( CLEAR ?auto_604 ) ( TRUCK-AT ?auto_608 ?auto_606 ) ( not ( = ?auto_603 ?auto_604 ) ) ( not ( = ?auto_603 ?auto_613 ) ) ( not ( = ?auto_604 ?auto_613 ) ) ( not ( = ?auto_609 ?auto_614 ) ) ( not ( = ?auto_603 ?auto_605 ) ) ( not ( = ?auto_603 ?auto_607 ) ) ( not ( = ?auto_605 ?auto_613 ) ) ( not ( = ?auto_611 ?auto_612 ) ) ( not ( = ?auto_610 ?auto_614 ) ) ( not ( = ?auto_607 ?auto_613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_603 ?auto_604 )
      ( MAKE-1CRATE ?auto_604 ?auto_605 )
      ( MAKE-2CRATE-VERIFY ?auto_603 ?auto_604 ?auto_605 ) )
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
      ?auto_634 - HOIST
      ?auto_633 - PLACE
      ?auto_638 - PLACE
      ?auto_635 - HOIST
      ?auto_636 - SURFACE
      ?auto_639 - PLACE
      ?auto_642 - HOIST
      ?auto_641 - SURFACE
      ?auto_640 - PLACE
      ?auto_644 - HOIST
      ?auto_643 - SURFACE
      ?auto_637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_634 ?auto_633 ) ( IS-CRATE ?auto_632 ) ( not ( = ?auto_638 ?auto_633 ) ) ( HOIST-AT ?auto_635 ?auto_638 ) ( AVAILABLE ?auto_635 ) ( SURFACE-AT ?auto_632 ?auto_638 ) ( ON ?auto_632 ?auto_636 ) ( CLEAR ?auto_632 ) ( not ( = ?auto_631 ?auto_632 ) ) ( not ( = ?auto_631 ?auto_636 ) ) ( not ( = ?auto_632 ?auto_636 ) ) ( not ( = ?auto_634 ?auto_635 ) ) ( IS-CRATE ?auto_631 ) ( not ( = ?auto_639 ?auto_633 ) ) ( HOIST-AT ?auto_642 ?auto_639 ) ( AVAILABLE ?auto_642 ) ( SURFACE-AT ?auto_631 ?auto_639 ) ( ON ?auto_631 ?auto_641 ) ( CLEAR ?auto_631 ) ( not ( = ?auto_630 ?auto_631 ) ) ( not ( = ?auto_630 ?auto_641 ) ) ( not ( = ?auto_631 ?auto_641 ) ) ( not ( = ?auto_634 ?auto_642 ) ) ( SURFACE-AT ?auto_629 ?auto_633 ) ( CLEAR ?auto_629 ) ( IS-CRATE ?auto_630 ) ( AVAILABLE ?auto_634 ) ( not ( = ?auto_640 ?auto_633 ) ) ( HOIST-AT ?auto_644 ?auto_640 ) ( AVAILABLE ?auto_644 ) ( SURFACE-AT ?auto_630 ?auto_640 ) ( ON ?auto_630 ?auto_643 ) ( CLEAR ?auto_630 ) ( TRUCK-AT ?auto_637 ?auto_633 ) ( not ( = ?auto_629 ?auto_630 ) ) ( not ( = ?auto_629 ?auto_643 ) ) ( not ( = ?auto_630 ?auto_643 ) ) ( not ( = ?auto_634 ?auto_644 ) ) ( not ( = ?auto_629 ?auto_631 ) ) ( not ( = ?auto_629 ?auto_641 ) ) ( not ( = ?auto_631 ?auto_643 ) ) ( not ( = ?auto_639 ?auto_640 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_641 ?auto_643 ) ) ( not ( = ?auto_629 ?auto_632 ) ) ( not ( = ?auto_629 ?auto_636 ) ) ( not ( = ?auto_630 ?auto_632 ) ) ( not ( = ?auto_630 ?auto_636 ) ) ( not ( = ?auto_632 ?auto_641 ) ) ( not ( = ?auto_632 ?auto_643 ) ) ( not ( = ?auto_638 ?auto_639 ) ) ( not ( = ?auto_638 ?auto_640 ) ) ( not ( = ?auto_635 ?auto_642 ) ) ( not ( = ?auto_635 ?auto_644 ) ) ( not ( = ?auto_636 ?auto_641 ) ) ( not ( = ?auto_636 ?auto_643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_629 ?auto_630 ?auto_631 )
      ( MAKE-1CRATE ?auto_631 ?auto_632 )
      ( MAKE-3CRATE-VERIFY ?auto_629 ?auto_630 ?auto_631 ?auto_632 ) )
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
      ?auto_670 - HOIST
      ?auto_667 - PLACE
      ?auto_666 - PLACE
      ?auto_665 - HOIST
      ?auto_669 - SURFACE
      ?auto_679 - PLACE
      ?auto_674 - HOIST
      ?auto_676 - SURFACE
      ?auto_677 - PLACE
      ?auto_675 - HOIST
      ?auto_672 - SURFACE
      ?auto_678 - PLACE
      ?auto_673 - HOIST
      ?auto_671 - SURFACE
      ?auto_668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_670 ?auto_667 ) ( IS-CRATE ?auto_664 ) ( not ( = ?auto_666 ?auto_667 ) ) ( HOIST-AT ?auto_665 ?auto_666 ) ( AVAILABLE ?auto_665 ) ( SURFACE-AT ?auto_664 ?auto_666 ) ( ON ?auto_664 ?auto_669 ) ( CLEAR ?auto_664 ) ( not ( = ?auto_663 ?auto_664 ) ) ( not ( = ?auto_663 ?auto_669 ) ) ( not ( = ?auto_664 ?auto_669 ) ) ( not ( = ?auto_670 ?auto_665 ) ) ( IS-CRATE ?auto_663 ) ( not ( = ?auto_679 ?auto_667 ) ) ( HOIST-AT ?auto_674 ?auto_679 ) ( AVAILABLE ?auto_674 ) ( SURFACE-AT ?auto_663 ?auto_679 ) ( ON ?auto_663 ?auto_676 ) ( CLEAR ?auto_663 ) ( not ( = ?auto_662 ?auto_663 ) ) ( not ( = ?auto_662 ?auto_676 ) ) ( not ( = ?auto_663 ?auto_676 ) ) ( not ( = ?auto_670 ?auto_674 ) ) ( IS-CRATE ?auto_662 ) ( not ( = ?auto_677 ?auto_667 ) ) ( HOIST-AT ?auto_675 ?auto_677 ) ( AVAILABLE ?auto_675 ) ( SURFACE-AT ?auto_662 ?auto_677 ) ( ON ?auto_662 ?auto_672 ) ( CLEAR ?auto_662 ) ( not ( = ?auto_661 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_672 ) ) ( not ( = ?auto_662 ?auto_672 ) ) ( not ( = ?auto_670 ?auto_675 ) ) ( SURFACE-AT ?auto_660 ?auto_667 ) ( CLEAR ?auto_660 ) ( IS-CRATE ?auto_661 ) ( AVAILABLE ?auto_670 ) ( not ( = ?auto_678 ?auto_667 ) ) ( HOIST-AT ?auto_673 ?auto_678 ) ( AVAILABLE ?auto_673 ) ( SURFACE-AT ?auto_661 ?auto_678 ) ( ON ?auto_661 ?auto_671 ) ( CLEAR ?auto_661 ) ( TRUCK-AT ?auto_668 ?auto_667 ) ( not ( = ?auto_660 ?auto_661 ) ) ( not ( = ?auto_660 ?auto_671 ) ) ( not ( = ?auto_661 ?auto_671 ) ) ( not ( = ?auto_670 ?auto_673 ) ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_660 ?auto_672 ) ) ( not ( = ?auto_662 ?auto_671 ) ) ( not ( = ?auto_677 ?auto_678 ) ) ( not ( = ?auto_675 ?auto_673 ) ) ( not ( = ?auto_672 ?auto_671 ) ) ( not ( = ?auto_660 ?auto_663 ) ) ( not ( = ?auto_660 ?auto_676 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_661 ?auto_676 ) ) ( not ( = ?auto_663 ?auto_672 ) ) ( not ( = ?auto_663 ?auto_671 ) ) ( not ( = ?auto_679 ?auto_677 ) ) ( not ( = ?auto_679 ?auto_678 ) ) ( not ( = ?auto_674 ?auto_675 ) ) ( not ( = ?auto_674 ?auto_673 ) ) ( not ( = ?auto_676 ?auto_672 ) ) ( not ( = ?auto_676 ?auto_671 ) ) ( not ( = ?auto_660 ?auto_664 ) ) ( not ( = ?auto_660 ?auto_669 ) ) ( not ( = ?auto_661 ?auto_664 ) ) ( not ( = ?auto_661 ?auto_669 ) ) ( not ( = ?auto_662 ?auto_664 ) ) ( not ( = ?auto_662 ?auto_669 ) ) ( not ( = ?auto_664 ?auto_676 ) ) ( not ( = ?auto_664 ?auto_672 ) ) ( not ( = ?auto_664 ?auto_671 ) ) ( not ( = ?auto_666 ?auto_679 ) ) ( not ( = ?auto_666 ?auto_677 ) ) ( not ( = ?auto_666 ?auto_678 ) ) ( not ( = ?auto_665 ?auto_674 ) ) ( not ( = ?auto_665 ?auto_675 ) ) ( not ( = ?auto_665 ?auto_673 ) ) ( not ( = ?auto_669 ?auto_676 ) ) ( not ( = ?auto_669 ?auto_672 ) ) ( not ( = ?auto_669 ?auto_671 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_660 ?auto_661 ?auto_662 ?auto_663 )
      ( MAKE-1CRATE ?auto_663 ?auto_664 )
      ( MAKE-4CRATE-VERIFY ?auto_660 ?auto_661 ?auto_662 ?auto_663 ?auto_664 ) )
  )

)

