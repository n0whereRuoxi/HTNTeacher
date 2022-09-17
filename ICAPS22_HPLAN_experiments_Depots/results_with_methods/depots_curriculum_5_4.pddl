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
      ?auto_652 - SURFACE
      ?auto_653 - SURFACE
    )
    :vars
    (
      ?auto_654 - HOIST
      ?auto_655 - PLACE
      ?auto_657 - PLACE
      ?auto_658 - HOIST
      ?auto_659 - SURFACE
      ?auto_656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_654 ?auto_655 ) ( SURFACE-AT ?auto_653 ?auto_655 ) ( CLEAR ?auto_653 ) ( IS-CRATE ?auto_652 ) ( AVAILABLE ?auto_654 ) ( not ( = ?auto_657 ?auto_655 ) ) ( HOIST-AT ?auto_658 ?auto_657 ) ( AVAILABLE ?auto_658 ) ( SURFACE-AT ?auto_652 ?auto_657 ) ( ON ?auto_652 ?auto_659 ) ( CLEAR ?auto_652 ) ( TRUCK-AT ?auto_656 ?auto_655 ) ( not ( = ?auto_652 ?auto_653 ) ) ( not ( = ?auto_652 ?auto_659 ) ) ( not ( = ?auto_653 ?auto_659 ) ) ( not ( = ?auto_654 ?auto_658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_656 ?auto_655 ?auto_657 )
      ( !LIFT ?auto_658 ?auto_652 ?auto_659 ?auto_657 )
      ( !LOAD ?auto_658 ?auto_652 ?auto_656 ?auto_657 )
      ( !DRIVE ?auto_656 ?auto_657 ?auto_655 )
      ( !UNLOAD ?auto_654 ?auto_652 ?auto_656 ?auto_655 )
      ( !DROP ?auto_654 ?auto_652 ?auto_653 ?auto_655 )
      ( MAKE-ON-VERIFY ?auto_652 ?auto_653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_662 - SURFACE
      ?auto_663 - SURFACE
    )
    :vars
    (
      ?auto_664 - HOIST
      ?auto_665 - PLACE
      ?auto_667 - PLACE
      ?auto_668 - HOIST
      ?auto_669 - SURFACE
      ?auto_666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664 ?auto_665 ) ( SURFACE-AT ?auto_663 ?auto_665 ) ( CLEAR ?auto_663 ) ( IS-CRATE ?auto_662 ) ( AVAILABLE ?auto_664 ) ( not ( = ?auto_667 ?auto_665 ) ) ( HOIST-AT ?auto_668 ?auto_667 ) ( AVAILABLE ?auto_668 ) ( SURFACE-AT ?auto_662 ?auto_667 ) ( ON ?auto_662 ?auto_669 ) ( CLEAR ?auto_662 ) ( TRUCK-AT ?auto_666 ?auto_665 ) ( not ( = ?auto_662 ?auto_663 ) ) ( not ( = ?auto_662 ?auto_669 ) ) ( not ( = ?auto_663 ?auto_669 ) ) ( not ( = ?auto_664 ?auto_668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_666 ?auto_665 ?auto_667 )
      ( !LIFT ?auto_668 ?auto_662 ?auto_669 ?auto_667 )
      ( !LOAD ?auto_668 ?auto_662 ?auto_666 ?auto_667 )
      ( !DRIVE ?auto_666 ?auto_667 ?auto_665 )
      ( !UNLOAD ?auto_664 ?auto_662 ?auto_666 ?auto_665 )
      ( !DROP ?auto_664 ?auto_662 ?auto_663 ?auto_665 )
      ( MAKE-ON-VERIFY ?auto_662 ?auto_663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_672 - SURFACE
      ?auto_673 - SURFACE
    )
    :vars
    (
      ?auto_674 - HOIST
      ?auto_675 - PLACE
      ?auto_677 - PLACE
      ?auto_678 - HOIST
      ?auto_679 - SURFACE
      ?auto_676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_674 ?auto_675 ) ( SURFACE-AT ?auto_673 ?auto_675 ) ( CLEAR ?auto_673 ) ( IS-CRATE ?auto_672 ) ( AVAILABLE ?auto_674 ) ( not ( = ?auto_677 ?auto_675 ) ) ( HOIST-AT ?auto_678 ?auto_677 ) ( AVAILABLE ?auto_678 ) ( SURFACE-AT ?auto_672 ?auto_677 ) ( ON ?auto_672 ?auto_679 ) ( CLEAR ?auto_672 ) ( TRUCK-AT ?auto_676 ?auto_675 ) ( not ( = ?auto_672 ?auto_673 ) ) ( not ( = ?auto_672 ?auto_679 ) ) ( not ( = ?auto_673 ?auto_679 ) ) ( not ( = ?auto_674 ?auto_678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_676 ?auto_675 ?auto_677 )
      ( !LIFT ?auto_678 ?auto_672 ?auto_679 ?auto_677 )
      ( !LOAD ?auto_678 ?auto_672 ?auto_676 ?auto_677 )
      ( !DRIVE ?auto_676 ?auto_677 ?auto_675 )
      ( !UNLOAD ?auto_674 ?auto_672 ?auto_676 ?auto_675 )
      ( !DROP ?auto_674 ?auto_672 ?auto_673 ?auto_675 )
      ( MAKE-ON-VERIFY ?auto_672 ?auto_673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_682 - SURFACE
      ?auto_683 - SURFACE
    )
    :vars
    (
      ?auto_684 - HOIST
      ?auto_685 - PLACE
      ?auto_687 - PLACE
      ?auto_688 - HOIST
      ?auto_689 - SURFACE
      ?auto_686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_684 ?auto_685 ) ( SURFACE-AT ?auto_683 ?auto_685 ) ( CLEAR ?auto_683 ) ( IS-CRATE ?auto_682 ) ( AVAILABLE ?auto_684 ) ( not ( = ?auto_687 ?auto_685 ) ) ( HOIST-AT ?auto_688 ?auto_687 ) ( AVAILABLE ?auto_688 ) ( SURFACE-AT ?auto_682 ?auto_687 ) ( ON ?auto_682 ?auto_689 ) ( CLEAR ?auto_682 ) ( TRUCK-AT ?auto_686 ?auto_685 ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_682 ?auto_689 ) ) ( not ( = ?auto_683 ?auto_689 ) ) ( not ( = ?auto_684 ?auto_688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_686 ?auto_685 ?auto_687 )
      ( !LIFT ?auto_688 ?auto_682 ?auto_689 ?auto_687 )
      ( !LOAD ?auto_688 ?auto_682 ?auto_686 ?auto_687 )
      ( !DRIVE ?auto_686 ?auto_687 ?auto_685 )
      ( !UNLOAD ?auto_684 ?auto_682 ?auto_686 ?auto_685 )
      ( !DROP ?auto_684 ?auto_682 ?auto_683 ?auto_685 )
      ( MAKE-ON-VERIFY ?auto_682 ?auto_683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_692 - SURFACE
      ?auto_693 - SURFACE
    )
    :vars
    (
      ?auto_694 - HOIST
      ?auto_695 - PLACE
      ?auto_697 - PLACE
      ?auto_698 - HOIST
      ?auto_699 - SURFACE
      ?auto_696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694 ?auto_695 ) ( SURFACE-AT ?auto_693 ?auto_695 ) ( CLEAR ?auto_693 ) ( IS-CRATE ?auto_692 ) ( AVAILABLE ?auto_694 ) ( not ( = ?auto_697 ?auto_695 ) ) ( HOIST-AT ?auto_698 ?auto_697 ) ( AVAILABLE ?auto_698 ) ( SURFACE-AT ?auto_692 ?auto_697 ) ( ON ?auto_692 ?auto_699 ) ( CLEAR ?auto_692 ) ( TRUCK-AT ?auto_696 ?auto_695 ) ( not ( = ?auto_692 ?auto_693 ) ) ( not ( = ?auto_692 ?auto_699 ) ) ( not ( = ?auto_693 ?auto_699 ) ) ( not ( = ?auto_694 ?auto_698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_696 ?auto_695 ?auto_697 )
      ( !LIFT ?auto_698 ?auto_692 ?auto_699 ?auto_697 )
      ( !LOAD ?auto_698 ?auto_692 ?auto_696 ?auto_697 )
      ( !DRIVE ?auto_696 ?auto_697 ?auto_695 )
      ( !UNLOAD ?auto_694 ?auto_692 ?auto_696 ?auto_695 )
      ( !DROP ?auto_694 ?auto_692 ?auto_693 ?auto_695 )
      ( MAKE-ON-VERIFY ?auto_692 ?auto_693 ) )
  )

)

