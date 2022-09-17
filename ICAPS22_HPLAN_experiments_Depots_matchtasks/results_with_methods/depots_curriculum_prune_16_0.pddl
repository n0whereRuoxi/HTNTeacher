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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23632 - SURFACE
      ?auto_23633 - SURFACE
    )
    :vars
    (
      ?auto_23634 - HOIST
      ?auto_23635 - PLACE
      ?auto_23637 - PLACE
      ?auto_23638 - HOIST
      ?auto_23639 - SURFACE
      ?auto_23636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23634 ?auto_23635 ) ( SURFACE-AT ?auto_23632 ?auto_23635 ) ( CLEAR ?auto_23632 ) ( IS-CRATE ?auto_23633 ) ( AVAILABLE ?auto_23634 ) ( not ( = ?auto_23637 ?auto_23635 ) ) ( HOIST-AT ?auto_23638 ?auto_23637 ) ( AVAILABLE ?auto_23638 ) ( SURFACE-AT ?auto_23633 ?auto_23637 ) ( ON ?auto_23633 ?auto_23639 ) ( CLEAR ?auto_23633 ) ( TRUCK-AT ?auto_23636 ?auto_23635 ) ( not ( = ?auto_23632 ?auto_23633 ) ) ( not ( = ?auto_23632 ?auto_23639 ) ) ( not ( = ?auto_23633 ?auto_23639 ) ) ( not ( = ?auto_23634 ?auto_23638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23636 ?auto_23635 ?auto_23637 )
      ( !LIFT ?auto_23638 ?auto_23633 ?auto_23639 ?auto_23637 )
      ( !LOAD ?auto_23638 ?auto_23633 ?auto_23636 ?auto_23637 )
      ( !DRIVE ?auto_23636 ?auto_23637 ?auto_23635 )
      ( !UNLOAD ?auto_23634 ?auto_23633 ?auto_23636 ?auto_23635 )
      ( !DROP ?auto_23634 ?auto_23633 ?auto_23632 ?auto_23635 )
      ( MAKE-1CRATE-VERIFY ?auto_23632 ?auto_23633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23653 - SURFACE
      ?auto_23654 - SURFACE
      ?auto_23655 - SURFACE
    )
    :vars
    (
      ?auto_23659 - HOIST
      ?auto_23661 - PLACE
      ?auto_23658 - PLACE
      ?auto_23657 - HOIST
      ?auto_23656 - SURFACE
      ?auto_23662 - PLACE
      ?auto_23663 - HOIST
      ?auto_23664 - SURFACE
      ?auto_23660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23659 ?auto_23661 ) ( IS-CRATE ?auto_23655 ) ( not ( = ?auto_23658 ?auto_23661 ) ) ( HOIST-AT ?auto_23657 ?auto_23658 ) ( AVAILABLE ?auto_23657 ) ( SURFACE-AT ?auto_23655 ?auto_23658 ) ( ON ?auto_23655 ?auto_23656 ) ( CLEAR ?auto_23655 ) ( not ( = ?auto_23654 ?auto_23655 ) ) ( not ( = ?auto_23654 ?auto_23656 ) ) ( not ( = ?auto_23655 ?auto_23656 ) ) ( not ( = ?auto_23659 ?auto_23657 ) ) ( SURFACE-AT ?auto_23653 ?auto_23661 ) ( CLEAR ?auto_23653 ) ( IS-CRATE ?auto_23654 ) ( AVAILABLE ?auto_23659 ) ( not ( = ?auto_23662 ?auto_23661 ) ) ( HOIST-AT ?auto_23663 ?auto_23662 ) ( AVAILABLE ?auto_23663 ) ( SURFACE-AT ?auto_23654 ?auto_23662 ) ( ON ?auto_23654 ?auto_23664 ) ( CLEAR ?auto_23654 ) ( TRUCK-AT ?auto_23660 ?auto_23661 ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23664 ) ) ( not ( = ?auto_23654 ?auto_23664 ) ) ( not ( = ?auto_23659 ?auto_23663 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) ( not ( = ?auto_23653 ?auto_23656 ) ) ( not ( = ?auto_23655 ?auto_23664 ) ) ( not ( = ?auto_23658 ?auto_23662 ) ) ( not ( = ?auto_23657 ?auto_23663 ) ) ( not ( = ?auto_23656 ?auto_23664 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23653 ?auto_23654 )
      ( MAKE-1CRATE ?auto_23654 ?auto_23655 )
      ( MAKE-2CRATE-VERIFY ?auto_23653 ?auto_23654 ?auto_23655 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23679 - SURFACE
      ?auto_23680 - SURFACE
      ?auto_23681 - SURFACE
      ?auto_23682 - SURFACE
    )
    :vars
    (
      ?auto_23688 - HOIST
      ?auto_23684 - PLACE
      ?auto_23686 - PLACE
      ?auto_23683 - HOIST
      ?auto_23685 - SURFACE
      ?auto_23691 - PLACE
      ?auto_23692 - HOIST
      ?auto_23689 - SURFACE
      ?auto_23693 - PLACE
      ?auto_23690 - HOIST
      ?auto_23694 - SURFACE
      ?auto_23687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23688 ?auto_23684 ) ( IS-CRATE ?auto_23682 ) ( not ( = ?auto_23686 ?auto_23684 ) ) ( HOIST-AT ?auto_23683 ?auto_23686 ) ( AVAILABLE ?auto_23683 ) ( SURFACE-AT ?auto_23682 ?auto_23686 ) ( ON ?auto_23682 ?auto_23685 ) ( CLEAR ?auto_23682 ) ( not ( = ?auto_23681 ?auto_23682 ) ) ( not ( = ?auto_23681 ?auto_23685 ) ) ( not ( = ?auto_23682 ?auto_23685 ) ) ( not ( = ?auto_23688 ?auto_23683 ) ) ( IS-CRATE ?auto_23681 ) ( not ( = ?auto_23691 ?auto_23684 ) ) ( HOIST-AT ?auto_23692 ?auto_23691 ) ( AVAILABLE ?auto_23692 ) ( SURFACE-AT ?auto_23681 ?auto_23691 ) ( ON ?auto_23681 ?auto_23689 ) ( CLEAR ?auto_23681 ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23689 ) ) ( not ( = ?auto_23681 ?auto_23689 ) ) ( not ( = ?auto_23688 ?auto_23692 ) ) ( SURFACE-AT ?auto_23679 ?auto_23684 ) ( CLEAR ?auto_23679 ) ( IS-CRATE ?auto_23680 ) ( AVAILABLE ?auto_23688 ) ( not ( = ?auto_23693 ?auto_23684 ) ) ( HOIST-AT ?auto_23690 ?auto_23693 ) ( AVAILABLE ?auto_23690 ) ( SURFACE-AT ?auto_23680 ?auto_23693 ) ( ON ?auto_23680 ?auto_23694 ) ( CLEAR ?auto_23680 ) ( TRUCK-AT ?auto_23687 ?auto_23684 ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23694 ) ) ( not ( = ?auto_23680 ?auto_23694 ) ) ( not ( = ?auto_23688 ?auto_23690 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23689 ) ) ( not ( = ?auto_23681 ?auto_23694 ) ) ( not ( = ?auto_23691 ?auto_23693 ) ) ( not ( = ?auto_23692 ?auto_23690 ) ) ( not ( = ?auto_23689 ?auto_23694 ) ) ( not ( = ?auto_23679 ?auto_23682 ) ) ( not ( = ?auto_23679 ?auto_23685 ) ) ( not ( = ?auto_23680 ?auto_23682 ) ) ( not ( = ?auto_23680 ?auto_23685 ) ) ( not ( = ?auto_23682 ?auto_23689 ) ) ( not ( = ?auto_23682 ?auto_23694 ) ) ( not ( = ?auto_23686 ?auto_23691 ) ) ( not ( = ?auto_23686 ?auto_23693 ) ) ( not ( = ?auto_23683 ?auto_23692 ) ) ( not ( = ?auto_23683 ?auto_23690 ) ) ( not ( = ?auto_23685 ?auto_23689 ) ) ( not ( = ?auto_23685 ?auto_23694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23679 ?auto_23680 ?auto_23681 )
      ( MAKE-1CRATE ?auto_23681 ?auto_23682 )
      ( MAKE-3CRATE-VERIFY ?auto_23679 ?auto_23680 ?auto_23681 ?auto_23682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23710 - SURFACE
      ?auto_23711 - SURFACE
      ?auto_23712 - SURFACE
      ?auto_23713 - SURFACE
      ?auto_23714 - SURFACE
    )
    :vars
    (
      ?auto_23716 - HOIST
      ?auto_23720 - PLACE
      ?auto_23719 - PLACE
      ?auto_23715 - HOIST
      ?auto_23717 - SURFACE
      ?auto_23723 - PLACE
      ?auto_23727 - HOIST
      ?auto_23722 - SURFACE
      ?auto_23729 - PLACE
      ?auto_23726 - HOIST
      ?auto_23725 - SURFACE
      ?auto_23728 - PLACE
      ?auto_23721 - HOIST
      ?auto_23724 - SURFACE
      ?auto_23718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23716 ?auto_23720 ) ( IS-CRATE ?auto_23714 ) ( not ( = ?auto_23719 ?auto_23720 ) ) ( HOIST-AT ?auto_23715 ?auto_23719 ) ( AVAILABLE ?auto_23715 ) ( SURFACE-AT ?auto_23714 ?auto_23719 ) ( ON ?auto_23714 ?auto_23717 ) ( CLEAR ?auto_23714 ) ( not ( = ?auto_23713 ?auto_23714 ) ) ( not ( = ?auto_23713 ?auto_23717 ) ) ( not ( = ?auto_23714 ?auto_23717 ) ) ( not ( = ?auto_23716 ?auto_23715 ) ) ( IS-CRATE ?auto_23713 ) ( not ( = ?auto_23723 ?auto_23720 ) ) ( HOIST-AT ?auto_23727 ?auto_23723 ) ( AVAILABLE ?auto_23727 ) ( SURFACE-AT ?auto_23713 ?auto_23723 ) ( ON ?auto_23713 ?auto_23722 ) ( CLEAR ?auto_23713 ) ( not ( = ?auto_23712 ?auto_23713 ) ) ( not ( = ?auto_23712 ?auto_23722 ) ) ( not ( = ?auto_23713 ?auto_23722 ) ) ( not ( = ?auto_23716 ?auto_23727 ) ) ( IS-CRATE ?auto_23712 ) ( not ( = ?auto_23729 ?auto_23720 ) ) ( HOIST-AT ?auto_23726 ?auto_23729 ) ( AVAILABLE ?auto_23726 ) ( SURFACE-AT ?auto_23712 ?auto_23729 ) ( ON ?auto_23712 ?auto_23725 ) ( CLEAR ?auto_23712 ) ( not ( = ?auto_23711 ?auto_23712 ) ) ( not ( = ?auto_23711 ?auto_23725 ) ) ( not ( = ?auto_23712 ?auto_23725 ) ) ( not ( = ?auto_23716 ?auto_23726 ) ) ( SURFACE-AT ?auto_23710 ?auto_23720 ) ( CLEAR ?auto_23710 ) ( IS-CRATE ?auto_23711 ) ( AVAILABLE ?auto_23716 ) ( not ( = ?auto_23728 ?auto_23720 ) ) ( HOIST-AT ?auto_23721 ?auto_23728 ) ( AVAILABLE ?auto_23721 ) ( SURFACE-AT ?auto_23711 ?auto_23728 ) ( ON ?auto_23711 ?auto_23724 ) ( CLEAR ?auto_23711 ) ( TRUCK-AT ?auto_23718 ?auto_23720 ) ( not ( = ?auto_23710 ?auto_23711 ) ) ( not ( = ?auto_23710 ?auto_23724 ) ) ( not ( = ?auto_23711 ?auto_23724 ) ) ( not ( = ?auto_23716 ?auto_23721 ) ) ( not ( = ?auto_23710 ?auto_23712 ) ) ( not ( = ?auto_23710 ?auto_23725 ) ) ( not ( = ?auto_23712 ?auto_23724 ) ) ( not ( = ?auto_23729 ?auto_23728 ) ) ( not ( = ?auto_23726 ?auto_23721 ) ) ( not ( = ?auto_23725 ?auto_23724 ) ) ( not ( = ?auto_23710 ?auto_23713 ) ) ( not ( = ?auto_23710 ?auto_23722 ) ) ( not ( = ?auto_23711 ?auto_23713 ) ) ( not ( = ?auto_23711 ?auto_23722 ) ) ( not ( = ?auto_23713 ?auto_23725 ) ) ( not ( = ?auto_23713 ?auto_23724 ) ) ( not ( = ?auto_23723 ?auto_23729 ) ) ( not ( = ?auto_23723 ?auto_23728 ) ) ( not ( = ?auto_23727 ?auto_23726 ) ) ( not ( = ?auto_23727 ?auto_23721 ) ) ( not ( = ?auto_23722 ?auto_23725 ) ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( not ( = ?auto_23710 ?auto_23714 ) ) ( not ( = ?auto_23710 ?auto_23717 ) ) ( not ( = ?auto_23711 ?auto_23714 ) ) ( not ( = ?auto_23711 ?auto_23717 ) ) ( not ( = ?auto_23712 ?auto_23714 ) ) ( not ( = ?auto_23712 ?auto_23717 ) ) ( not ( = ?auto_23714 ?auto_23722 ) ) ( not ( = ?auto_23714 ?auto_23725 ) ) ( not ( = ?auto_23714 ?auto_23724 ) ) ( not ( = ?auto_23719 ?auto_23723 ) ) ( not ( = ?auto_23719 ?auto_23729 ) ) ( not ( = ?auto_23719 ?auto_23728 ) ) ( not ( = ?auto_23715 ?auto_23727 ) ) ( not ( = ?auto_23715 ?auto_23726 ) ) ( not ( = ?auto_23715 ?auto_23721 ) ) ( not ( = ?auto_23717 ?auto_23722 ) ) ( not ( = ?auto_23717 ?auto_23725 ) ) ( not ( = ?auto_23717 ?auto_23724 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_23710 ?auto_23711 ?auto_23712 ?auto_23713 )
      ( MAKE-1CRATE ?auto_23713 ?auto_23714 )
      ( MAKE-4CRATE-VERIFY ?auto_23710 ?auto_23711 ?auto_23712 ?auto_23713 ?auto_23714 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23746 - SURFACE
      ?auto_23747 - SURFACE
      ?auto_23748 - SURFACE
      ?auto_23749 - SURFACE
      ?auto_23750 - SURFACE
      ?auto_23751 - SURFACE
    )
    :vars
    (
      ?auto_23753 - HOIST
      ?auto_23757 - PLACE
      ?auto_23756 - PLACE
      ?auto_23755 - HOIST
      ?auto_23754 - SURFACE
      ?auto_23766 - PLACE
      ?auto_23758 - HOIST
      ?auto_23761 - SURFACE
      ?auto_23769 - PLACE
      ?auto_23763 - HOIST
      ?auto_23768 - SURFACE
      ?auto_23759 - PLACE
      ?auto_23764 - HOIST
      ?auto_23765 - SURFACE
      ?auto_23762 - PLACE
      ?auto_23760 - HOIST
      ?auto_23767 - SURFACE
      ?auto_23752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23753 ?auto_23757 ) ( IS-CRATE ?auto_23751 ) ( not ( = ?auto_23756 ?auto_23757 ) ) ( HOIST-AT ?auto_23755 ?auto_23756 ) ( AVAILABLE ?auto_23755 ) ( SURFACE-AT ?auto_23751 ?auto_23756 ) ( ON ?auto_23751 ?auto_23754 ) ( CLEAR ?auto_23751 ) ( not ( = ?auto_23750 ?auto_23751 ) ) ( not ( = ?auto_23750 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23754 ) ) ( not ( = ?auto_23753 ?auto_23755 ) ) ( IS-CRATE ?auto_23750 ) ( not ( = ?auto_23766 ?auto_23757 ) ) ( HOIST-AT ?auto_23758 ?auto_23766 ) ( AVAILABLE ?auto_23758 ) ( SURFACE-AT ?auto_23750 ?auto_23766 ) ( ON ?auto_23750 ?auto_23761 ) ( CLEAR ?auto_23750 ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( not ( = ?auto_23749 ?auto_23761 ) ) ( not ( = ?auto_23750 ?auto_23761 ) ) ( not ( = ?auto_23753 ?auto_23758 ) ) ( IS-CRATE ?auto_23749 ) ( not ( = ?auto_23769 ?auto_23757 ) ) ( HOIST-AT ?auto_23763 ?auto_23769 ) ( AVAILABLE ?auto_23763 ) ( SURFACE-AT ?auto_23749 ?auto_23769 ) ( ON ?auto_23749 ?auto_23768 ) ( CLEAR ?auto_23749 ) ( not ( = ?auto_23748 ?auto_23749 ) ) ( not ( = ?auto_23748 ?auto_23768 ) ) ( not ( = ?auto_23749 ?auto_23768 ) ) ( not ( = ?auto_23753 ?auto_23763 ) ) ( IS-CRATE ?auto_23748 ) ( not ( = ?auto_23759 ?auto_23757 ) ) ( HOIST-AT ?auto_23764 ?auto_23759 ) ( AVAILABLE ?auto_23764 ) ( SURFACE-AT ?auto_23748 ?auto_23759 ) ( ON ?auto_23748 ?auto_23765 ) ( CLEAR ?auto_23748 ) ( not ( = ?auto_23747 ?auto_23748 ) ) ( not ( = ?auto_23747 ?auto_23765 ) ) ( not ( = ?auto_23748 ?auto_23765 ) ) ( not ( = ?auto_23753 ?auto_23764 ) ) ( SURFACE-AT ?auto_23746 ?auto_23757 ) ( CLEAR ?auto_23746 ) ( IS-CRATE ?auto_23747 ) ( AVAILABLE ?auto_23753 ) ( not ( = ?auto_23762 ?auto_23757 ) ) ( HOIST-AT ?auto_23760 ?auto_23762 ) ( AVAILABLE ?auto_23760 ) ( SURFACE-AT ?auto_23747 ?auto_23762 ) ( ON ?auto_23747 ?auto_23767 ) ( CLEAR ?auto_23747 ) ( TRUCK-AT ?auto_23752 ?auto_23757 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23767 ) ) ( not ( = ?auto_23747 ?auto_23767 ) ) ( not ( = ?auto_23753 ?auto_23760 ) ) ( not ( = ?auto_23746 ?auto_23748 ) ) ( not ( = ?auto_23746 ?auto_23765 ) ) ( not ( = ?auto_23748 ?auto_23767 ) ) ( not ( = ?auto_23759 ?auto_23762 ) ) ( not ( = ?auto_23764 ?auto_23760 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23746 ?auto_23749 ) ) ( not ( = ?auto_23746 ?auto_23768 ) ) ( not ( = ?auto_23747 ?auto_23749 ) ) ( not ( = ?auto_23747 ?auto_23768 ) ) ( not ( = ?auto_23749 ?auto_23765 ) ) ( not ( = ?auto_23749 ?auto_23767 ) ) ( not ( = ?auto_23769 ?auto_23759 ) ) ( not ( = ?auto_23769 ?auto_23762 ) ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23763 ?auto_23760 ) ) ( not ( = ?auto_23768 ?auto_23765 ) ) ( not ( = ?auto_23768 ?auto_23767 ) ) ( not ( = ?auto_23746 ?auto_23750 ) ) ( not ( = ?auto_23746 ?auto_23761 ) ) ( not ( = ?auto_23747 ?auto_23750 ) ) ( not ( = ?auto_23747 ?auto_23761 ) ) ( not ( = ?auto_23748 ?auto_23750 ) ) ( not ( = ?auto_23748 ?auto_23761 ) ) ( not ( = ?auto_23750 ?auto_23768 ) ) ( not ( = ?auto_23750 ?auto_23765 ) ) ( not ( = ?auto_23750 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( not ( = ?auto_23766 ?auto_23759 ) ) ( not ( = ?auto_23766 ?auto_23762 ) ) ( not ( = ?auto_23758 ?auto_23763 ) ) ( not ( = ?auto_23758 ?auto_23764 ) ) ( not ( = ?auto_23758 ?auto_23760 ) ) ( not ( = ?auto_23761 ?auto_23768 ) ) ( not ( = ?auto_23761 ?auto_23765 ) ) ( not ( = ?auto_23761 ?auto_23767 ) ) ( not ( = ?auto_23746 ?auto_23751 ) ) ( not ( = ?auto_23746 ?auto_23754 ) ) ( not ( = ?auto_23747 ?auto_23751 ) ) ( not ( = ?auto_23747 ?auto_23754 ) ) ( not ( = ?auto_23748 ?auto_23751 ) ) ( not ( = ?auto_23748 ?auto_23754 ) ) ( not ( = ?auto_23749 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23761 ) ) ( not ( = ?auto_23751 ?auto_23768 ) ) ( not ( = ?auto_23751 ?auto_23765 ) ) ( not ( = ?auto_23751 ?auto_23767 ) ) ( not ( = ?auto_23756 ?auto_23766 ) ) ( not ( = ?auto_23756 ?auto_23769 ) ) ( not ( = ?auto_23756 ?auto_23759 ) ) ( not ( = ?auto_23756 ?auto_23762 ) ) ( not ( = ?auto_23755 ?auto_23758 ) ) ( not ( = ?auto_23755 ?auto_23763 ) ) ( not ( = ?auto_23755 ?auto_23764 ) ) ( not ( = ?auto_23755 ?auto_23760 ) ) ( not ( = ?auto_23754 ?auto_23761 ) ) ( not ( = ?auto_23754 ?auto_23768 ) ) ( not ( = ?auto_23754 ?auto_23765 ) ) ( not ( = ?auto_23754 ?auto_23767 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23746 ?auto_23747 ?auto_23748 ?auto_23749 ?auto_23750 )
      ( MAKE-1CRATE ?auto_23750 ?auto_23751 )
      ( MAKE-5CRATE-VERIFY ?auto_23746 ?auto_23747 ?auto_23748 ?auto_23749 ?auto_23750 ?auto_23751 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_23787 - SURFACE
      ?auto_23788 - SURFACE
      ?auto_23789 - SURFACE
      ?auto_23790 - SURFACE
      ?auto_23791 - SURFACE
      ?auto_23792 - SURFACE
      ?auto_23793 - SURFACE
    )
    :vars
    (
      ?auto_23794 - HOIST
      ?auto_23795 - PLACE
      ?auto_23797 - PLACE
      ?auto_23798 - HOIST
      ?auto_23796 - SURFACE
      ?auto_23809 - PLACE
      ?auto_23800 - HOIST
      ?auto_23808 - SURFACE
      ?auto_23802 - PLACE
      ?auto_23801 - HOIST
      ?auto_23813 - SURFACE
      ?auto_23804 - PLACE
      ?auto_23807 - HOIST
      ?auto_23811 - SURFACE
      ?auto_23805 - PLACE
      ?auto_23806 - HOIST
      ?auto_23810 - SURFACE
      ?auto_23814 - PLACE
      ?auto_23812 - HOIST
      ?auto_23803 - SURFACE
      ?auto_23799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23794 ?auto_23795 ) ( IS-CRATE ?auto_23793 ) ( not ( = ?auto_23797 ?auto_23795 ) ) ( HOIST-AT ?auto_23798 ?auto_23797 ) ( AVAILABLE ?auto_23798 ) ( SURFACE-AT ?auto_23793 ?auto_23797 ) ( ON ?auto_23793 ?auto_23796 ) ( CLEAR ?auto_23793 ) ( not ( = ?auto_23792 ?auto_23793 ) ) ( not ( = ?auto_23792 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23798 ) ) ( IS-CRATE ?auto_23792 ) ( not ( = ?auto_23809 ?auto_23795 ) ) ( HOIST-AT ?auto_23800 ?auto_23809 ) ( AVAILABLE ?auto_23800 ) ( SURFACE-AT ?auto_23792 ?auto_23809 ) ( ON ?auto_23792 ?auto_23808 ) ( CLEAR ?auto_23792 ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( not ( = ?auto_23791 ?auto_23808 ) ) ( not ( = ?auto_23792 ?auto_23808 ) ) ( not ( = ?auto_23794 ?auto_23800 ) ) ( IS-CRATE ?auto_23791 ) ( not ( = ?auto_23802 ?auto_23795 ) ) ( HOIST-AT ?auto_23801 ?auto_23802 ) ( AVAILABLE ?auto_23801 ) ( SURFACE-AT ?auto_23791 ?auto_23802 ) ( ON ?auto_23791 ?auto_23813 ) ( CLEAR ?auto_23791 ) ( not ( = ?auto_23790 ?auto_23791 ) ) ( not ( = ?auto_23790 ?auto_23813 ) ) ( not ( = ?auto_23791 ?auto_23813 ) ) ( not ( = ?auto_23794 ?auto_23801 ) ) ( IS-CRATE ?auto_23790 ) ( not ( = ?auto_23804 ?auto_23795 ) ) ( HOIST-AT ?auto_23807 ?auto_23804 ) ( AVAILABLE ?auto_23807 ) ( SURFACE-AT ?auto_23790 ?auto_23804 ) ( ON ?auto_23790 ?auto_23811 ) ( CLEAR ?auto_23790 ) ( not ( = ?auto_23789 ?auto_23790 ) ) ( not ( = ?auto_23789 ?auto_23811 ) ) ( not ( = ?auto_23790 ?auto_23811 ) ) ( not ( = ?auto_23794 ?auto_23807 ) ) ( IS-CRATE ?auto_23789 ) ( not ( = ?auto_23805 ?auto_23795 ) ) ( HOIST-AT ?auto_23806 ?auto_23805 ) ( AVAILABLE ?auto_23806 ) ( SURFACE-AT ?auto_23789 ?auto_23805 ) ( ON ?auto_23789 ?auto_23810 ) ( CLEAR ?auto_23789 ) ( not ( = ?auto_23788 ?auto_23789 ) ) ( not ( = ?auto_23788 ?auto_23810 ) ) ( not ( = ?auto_23789 ?auto_23810 ) ) ( not ( = ?auto_23794 ?auto_23806 ) ) ( SURFACE-AT ?auto_23787 ?auto_23795 ) ( CLEAR ?auto_23787 ) ( IS-CRATE ?auto_23788 ) ( AVAILABLE ?auto_23794 ) ( not ( = ?auto_23814 ?auto_23795 ) ) ( HOIST-AT ?auto_23812 ?auto_23814 ) ( AVAILABLE ?auto_23812 ) ( SURFACE-AT ?auto_23788 ?auto_23814 ) ( ON ?auto_23788 ?auto_23803 ) ( CLEAR ?auto_23788 ) ( TRUCK-AT ?auto_23799 ?auto_23795 ) ( not ( = ?auto_23787 ?auto_23788 ) ) ( not ( = ?auto_23787 ?auto_23803 ) ) ( not ( = ?auto_23788 ?auto_23803 ) ) ( not ( = ?auto_23794 ?auto_23812 ) ) ( not ( = ?auto_23787 ?auto_23789 ) ) ( not ( = ?auto_23787 ?auto_23810 ) ) ( not ( = ?auto_23789 ?auto_23803 ) ) ( not ( = ?auto_23805 ?auto_23814 ) ) ( not ( = ?auto_23806 ?auto_23812 ) ) ( not ( = ?auto_23810 ?auto_23803 ) ) ( not ( = ?auto_23787 ?auto_23790 ) ) ( not ( = ?auto_23787 ?auto_23811 ) ) ( not ( = ?auto_23788 ?auto_23790 ) ) ( not ( = ?auto_23788 ?auto_23811 ) ) ( not ( = ?auto_23790 ?auto_23810 ) ) ( not ( = ?auto_23790 ?auto_23803 ) ) ( not ( = ?auto_23804 ?auto_23805 ) ) ( not ( = ?auto_23804 ?auto_23814 ) ) ( not ( = ?auto_23807 ?auto_23806 ) ) ( not ( = ?auto_23807 ?auto_23812 ) ) ( not ( = ?auto_23811 ?auto_23810 ) ) ( not ( = ?auto_23811 ?auto_23803 ) ) ( not ( = ?auto_23787 ?auto_23791 ) ) ( not ( = ?auto_23787 ?auto_23813 ) ) ( not ( = ?auto_23788 ?auto_23791 ) ) ( not ( = ?auto_23788 ?auto_23813 ) ) ( not ( = ?auto_23789 ?auto_23791 ) ) ( not ( = ?auto_23789 ?auto_23813 ) ) ( not ( = ?auto_23791 ?auto_23811 ) ) ( not ( = ?auto_23791 ?auto_23810 ) ) ( not ( = ?auto_23791 ?auto_23803 ) ) ( not ( = ?auto_23802 ?auto_23804 ) ) ( not ( = ?auto_23802 ?auto_23805 ) ) ( not ( = ?auto_23802 ?auto_23814 ) ) ( not ( = ?auto_23801 ?auto_23807 ) ) ( not ( = ?auto_23801 ?auto_23806 ) ) ( not ( = ?auto_23801 ?auto_23812 ) ) ( not ( = ?auto_23813 ?auto_23811 ) ) ( not ( = ?auto_23813 ?auto_23810 ) ) ( not ( = ?auto_23813 ?auto_23803 ) ) ( not ( = ?auto_23787 ?auto_23792 ) ) ( not ( = ?auto_23787 ?auto_23808 ) ) ( not ( = ?auto_23788 ?auto_23792 ) ) ( not ( = ?auto_23788 ?auto_23808 ) ) ( not ( = ?auto_23789 ?auto_23792 ) ) ( not ( = ?auto_23789 ?auto_23808 ) ) ( not ( = ?auto_23790 ?auto_23792 ) ) ( not ( = ?auto_23790 ?auto_23808 ) ) ( not ( = ?auto_23792 ?auto_23813 ) ) ( not ( = ?auto_23792 ?auto_23811 ) ) ( not ( = ?auto_23792 ?auto_23810 ) ) ( not ( = ?auto_23792 ?auto_23803 ) ) ( not ( = ?auto_23809 ?auto_23802 ) ) ( not ( = ?auto_23809 ?auto_23804 ) ) ( not ( = ?auto_23809 ?auto_23805 ) ) ( not ( = ?auto_23809 ?auto_23814 ) ) ( not ( = ?auto_23800 ?auto_23801 ) ) ( not ( = ?auto_23800 ?auto_23807 ) ) ( not ( = ?auto_23800 ?auto_23806 ) ) ( not ( = ?auto_23800 ?auto_23812 ) ) ( not ( = ?auto_23808 ?auto_23813 ) ) ( not ( = ?auto_23808 ?auto_23811 ) ) ( not ( = ?auto_23808 ?auto_23810 ) ) ( not ( = ?auto_23808 ?auto_23803 ) ) ( not ( = ?auto_23787 ?auto_23793 ) ) ( not ( = ?auto_23787 ?auto_23796 ) ) ( not ( = ?auto_23788 ?auto_23793 ) ) ( not ( = ?auto_23788 ?auto_23796 ) ) ( not ( = ?auto_23789 ?auto_23793 ) ) ( not ( = ?auto_23789 ?auto_23796 ) ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( not ( = ?auto_23790 ?auto_23796 ) ) ( not ( = ?auto_23791 ?auto_23793 ) ) ( not ( = ?auto_23791 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23808 ) ) ( not ( = ?auto_23793 ?auto_23813 ) ) ( not ( = ?auto_23793 ?auto_23811 ) ) ( not ( = ?auto_23793 ?auto_23810 ) ) ( not ( = ?auto_23793 ?auto_23803 ) ) ( not ( = ?auto_23797 ?auto_23809 ) ) ( not ( = ?auto_23797 ?auto_23802 ) ) ( not ( = ?auto_23797 ?auto_23804 ) ) ( not ( = ?auto_23797 ?auto_23805 ) ) ( not ( = ?auto_23797 ?auto_23814 ) ) ( not ( = ?auto_23798 ?auto_23800 ) ) ( not ( = ?auto_23798 ?auto_23801 ) ) ( not ( = ?auto_23798 ?auto_23807 ) ) ( not ( = ?auto_23798 ?auto_23806 ) ) ( not ( = ?auto_23798 ?auto_23812 ) ) ( not ( = ?auto_23796 ?auto_23808 ) ) ( not ( = ?auto_23796 ?auto_23813 ) ) ( not ( = ?auto_23796 ?auto_23811 ) ) ( not ( = ?auto_23796 ?auto_23810 ) ) ( not ( = ?auto_23796 ?auto_23803 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23787 ?auto_23788 ?auto_23789 ?auto_23790 ?auto_23791 ?auto_23792 )
      ( MAKE-1CRATE ?auto_23792 ?auto_23793 )
      ( MAKE-6CRATE-VERIFY ?auto_23787 ?auto_23788 ?auto_23789 ?auto_23790 ?auto_23791 ?auto_23792 ?auto_23793 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23833 - SURFACE
      ?auto_23834 - SURFACE
      ?auto_23835 - SURFACE
      ?auto_23836 - SURFACE
      ?auto_23837 - SURFACE
      ?auto_23838 - SURFACE
      ?auto_23839 - SURFACE
      ?auto_23840 - SURFACE
    )
    :vars
    (
      ?auto_23841 - HOIST
      ?auto_23845 - PLACE
      ?auto_23846 - PLACE
      ?auto_23843 - HOIST
      ?auto_23844 - SURFACE
      ?auto_23848 - PLACE
      ?auto_23853 - HOIST
      ?auto_23854 - SURFACE
      ?auto_23855 - PLACE
      ?auto_23863 - HOIST
      ?auto_23862 - SURFACE
      ?auto_23851 - PLACE
      ?auto_23850 - HOIST
      ?auto_23858 - SURFACE
      ?auto_23864 - PLACE
      ?auto_23859 - HOIST
      ?auto_23856 - SURFACE
      ?auto_23861 - PLACE
      ?auto_23860 - HOIST
      ?auto_23847 - SURFACE
      ?auto_23852 - PLACE
      ?auto_23857 - HOIST
      ?auto_23849 - SURFACE
      ?auto_23842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23841 ?auto_23845 ) ( IS-CRATE ?auto_23840 ) ( not ( = ?auto_23846 ?auto_23845 ) ) ( HOIST-AT ?auto_23843 ?auto_23846 ) ( AVAILABLE ?auto_23843 ) ( SURFACE-AT ?auto_23840 ?auto_23846 ) ( ON ?auto_23840 ?auto_23844 ) ( CLEAR ?auto_23840 ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23844 ) ) ( not ( = ?auto_23840 ?auto_23844 ) ) ( not ( = ?auto_23841 ?auto_23843 ) ) ( IS-CRATE ?auto_23839 ) ( not ( = ?auto_23848 ?auto_23845 ) ) ( HOIST-AT ?auto_23853 ?auto_23848 ) ( AVAILABLE ?auto_23853 ) ( SURFACE-AT ?auto_23839 ?auto_23848 ) ( ON ?auto_23839 ?auto_23854 ) ( CLEAR ?auto_23839 ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23838 ?auto_23854 ) ) ( not ( = ?auto_23839 ?auto_23854 ) ) ( not ( = ?auto_23841 ?auto_23853 ) ) ( IS-CRATE ?auto_23838 ) ( not ( = ?auto_23855 ?auto_23845 ) ) ( HOIST-AT ?auto_23863 ?auto_23855 ) ( AVAILABLE ?auto_23863 ) ( SURFACE-AT ?auto_23838 ?auto_23855 ) ( ON ?auto_23838 ?auto_23862 ) ( CLEAR ?auto_23838 ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23837 ?auto_23862 ) ) ( not ( = ?auto_23838 ?auto_23862 ) ) ( not ( = ?auto_23841 ?auto_23863 ) ) ( IS-CRATE ?auto_23837 ) ( not ( = ?auto_23851 ?auto_23845 ) ) ( HOIST-AT ?auto_23850 ?auto_23851 ) ( AVAILABLE ?auto_23850 ) ( SURFACE-AT ?auto_23837 ?auto_23851 ) ( ON ?auto_23837 ?auto_23858 ) ( CLEAR ?auto_23837 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23858 ) ) ( not ( = ?auto_23837 ?auto_23858 ) ) ( not ( = ?auto_23841 ?auto_23850 ) ) ( IS-CRATE ?auto_23836 ) ( not ( = ?auto_23864 ?auto_23845 ) ) ( HOIST-AT ?auto_23859 ?auto_23864 ) ( AVAILABLE ?auto_23859 ) ( SURFACE-AT ?auto_23836 ?auto_23864 ) ( ON ?auto_23836 ?auto_23856 ) ( CLEAR ?auto_23836 ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23835 ?auto_23856 ) ) ( not ( = ?auto_23836 ?auto_23856 ) ) ( not ( = ?auto_23841 ?auto_23859 ) ) ( IS-CRATE ?auto_23835 ) ( not ( = ?auto_23861 ?auto_23845 ) ) ( HOIST-AT ?auto_23860 ?auto_23861 ) ( AVAILABLE ?auto_23860 ) ( SURFACE-AT ?auto_23835 ?auto_23861 ) ( ON ?auto_23835 ?auto_23847 ) ( CLEAR ?auto_23835 ) ( not ( = ?auto_23834 ?auto_23835 ) ) ( not ( = ?auto_23834 ?auto_23847 ) ) ( not ( = ?auto_23835 ?auto_23847 ) ) ( not ( = ?auto_23841 ?auto_23860 ) ) ( SURFACE-AT ?auto_23833 ?auto_23845 ) ( CLEAR ?auto_23833 ) ( IS-CRATE ?auto_23834 ) ( AVAILABLE ?auto_23841 ) ( not ( = ?auto_23852 ?auto_23845 ) ) ( HOIST-AT ?auto_23857 ?auto_23852 ) ( AVAILABLE ?auto_23857 ) ( SURFACE-AT ?auto_23834 ?auto_23852 ) ( ON ?auto_23834 ?auto_23849 ) ( CLEAR ?auto_23834 ) ( TRUCK-AT ?auto_23842 ?auto_23845 ) ( not ( = ?auto_23833 ?auto_23834 ) ) ( not ( = ?auto_23833 ?auto_23849 ) ) ( not ( = ?auto_23834 ?auto_23849 ) ) ( not ( = ?auto_23841 ?auto_23857 ) ) ( not ( = ?auto_23833 ?auto_23835 ) ) ( not ( = ?auto_23833 ?auto_23847 ) ) ( not ( = ?auto_23835 ?auto_23849 ) ) ( not ( = ?auto_23861 ?auto_23852 ) ) ( not ( = ?auto_23860 ?auto_23857 ) ) ( not ( = ?auto_23847 ?auto_23849 ) ) ( not ( = ?auto_23833 ?auto_23836 ) ) ( not ( = ?auto_23833 ?auto_23856 ) ) ( not ( = ?auto_23834 ?auto_23836 ) ) ( not ( = ?auto_23834 ?auto_23856 ) ) ( not ( = ?auto_23836 ?auto_23847 ) ) ( not ( = ?auto_23836 ?auto_23849 ) ) ( not ( = ?auto_23864 ?auto_23861 ) ) ( not ( = ?auto_23864 ?auto_23852 ) ) ( not ( = ?auto_23859 ?auto_23860 ) ) ( not ( = ?auto_23859 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23847 ) ) ( not ( = ?auto_23856 ?auto_23849 ) ) ( not ( = ?auto_23833 ?auto_23837 ) ) ( not ( = ?auto_23833 ?auto_23858 ) ) ( not ( = ?auto_23834 ?auto_23837 ) ) ( not ( = ?auto_23834 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23837 ) ) ( not ( = ?auto_23835 ?auto_23858 ) ) ( not ( = ?auto_23837 ?auto_23856 ) ) ( not ( = ?auto_23837 ?auto_23847 ) ) ( not ( = ?auto_23837 ?auto_23849 ) ) ( not ( = ?auto_23851 ?auto_23864 ) ) ( not ( = ?auto_23851 ?auto_23861 ) ) ( not ( = ?auto_23851 ?auto_23852 ) ) ( not ( = ?auto_23850 ?auto_23859 ) ) ( not ( = ?auto_23850 ?auto_23860 ) ) ( not ( = ?auto_23850 ?auto_23857 ) ) ( not ( = ?auto_23858 ?auto_23856 ) ) ( not ( = ?auto_23858 ?auto_23847 ) ) ( not ( = ?auto_23858 ?auto_23849 ) ) ( not ( = ?auto_23833 ?auto_23838 ) ) ( not ( = ?auto_23833 ?auto_23862 ) ) ( not ( = ?auto_23834 ?auto_23838 ) ) ( not ( = ?auto_23834 ?auto_23862 ) ) ( not ( = ?auto_23835 ?auto_23838 ) ) ( not ( = ?auto_23835 ?auto_23862 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23862 ) ) ( not ( = ?auto_23838 ?auto_23858 ) ) ( not ( = ?auto_23838 ?auto_23856 ) ) ( not ( = ?auto_23838 ?auto_23847 ) ) ( not ( = ?auto_23838 ?auto_23849 ) ) ( not ( = ?auto_23855 ?auto_23851 ) ) ( not ( = ?auto_23855 ?auto_23864 ) ) ( not ( = ?auto_23855 ?auto_23861 ) ) ( not ( = ?auto_23855 ?auto_23852 ) ) ( not ( = ?auto_23863 ?auto_23850 ) ) ( not ( = ?auto_23863 ?auto_23859 ) ) ( not ( = ?auto_23863 ?auto_23860 ) ) ( not ( = ?auto_23863 ?auto_23857 ) ) ( not ( = ?auto_23862 ?auto_23858 ) ) ( not ( = ?auto_23862 ?auto_23856 ) ) ( not ( = ?auto_23862 ?auto_23847 ) ) ( not ( = ?auto_23862 ?auto_23849 ) ) ( not ( = ?auto_23833 ?auto_23839 ) ) ( not ( = ?auto_23833 ?auto_23854 ) ) ( not ( = ?auto_23834 ?auto_23839 ) ) ( not ( = ?auto_23834 ?auto_23854 ) ) ( not ( = ?auto_23835 ?auto_23839 ) ) ( not ( = ?auto_23835 ?auto_23854 ) ) ( not ( = ?auto_23836 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23854 ) ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23854 ) ) ( not ( = ?auto_23839 ?auto_23862 ) ) ( not ( = ?auto_23839 ?auto_23858 ) ) ( not ( = ?auto_23839 ?auto_23856 ) ) ( not ( = ?auto_23839 ?auto_23847 ) ) ( not ( = ?auto_23839 ?auto_23849 ) ) ( not ( = ?auto_23848 ?auto_23855 ) ) ( not ( = ?auto_23848 ?auto_23851 ) ) ( not ( = ?auto_23848 ?auto_23864 ) ) ( not ( = ?auto_23848 ?auto_23861 ) ) ( not ( = ?auto_23848 ?auto_23852 ) ) ( not ( = ?auto_23853 ?auto_23863 ) ) ( not ( = ?auto_23853 ?auto_23850 ) ) ( not ( = ?auto_23853 ?auto_23859 ) ) ( not ( = ?auto_23853 ?auto_23860 ) ) ( not ( = ?auto_23853 ?auto_23857 ) ) ( not ( = ?auto_23854 ?auto_23862 ) ) ( not ( = ?auto_23854 ?auto_23858 ) ) ( not ( = ?auto_23854 ?auto_23856 ) ) ( not ( = ?auto_23854 ?auto_23847 ) ) ( not ( = ?auto_23854 ?auto_23849 ) ) ( not ( = ?auto_23833 ?auto_23840 ) ) ( not ( = ?auto_23833 ?auto_23844 ) ) ( not ( = ?auto_23834 ?auto_23840 ) ) ( not ( = ?auto_23834 ?auto_23844 ) ) ( not ( = ?auto_23835 ?auto_23840 ) ) ( not ( = ?auto_23835 ?auto_23844 ) ) ( not ( = ?auto_23836 ?auto_23840 ) ) ( not ( = ?auto_23836 ?auto_23844 ) ) ( not ( = ?auto_23837 ?auto_23840 ) ) ( not ( = ?auto_23837 ?auto_23844 ) ) ( not ( = ?auto_23838 ?auto_23840 ) ) ( not ( = ?auto_23838 ?auto_23844 ) ) ( not ( = ?auto_23840 ?auto_23854 ) ) ( not ( = ?auto_23840 ?auto_23862 ) ) ( not ( = ?auto_23840 ?auto_23858 ) ) ( not ( = ?auto_23840 ?auto_23856 ) ) ( not ( = ?auto_23840 ?auto_23847 ) ) ( not ( = ?auto_23840 ?auto_23849 ) ) ( not ( = ?auto_23846 ?auto_23848 ) ) ( not ( = ?auto_23846 ?auto_23855 ) ) ( not ( = ?auto_23846 ?auto_23851 ) ) ( not ( = ?auto_23846 ?auto_23864 ) ) ( not ( = ?auto_23846 ?auto_23861 ) ) ( not ( = ?auto_23846 ?auto_23852 ) ) ( not ( = ?auto_23843 ?auto_23853 ) ) ( not ( = ?auto_23843 ?auto_23863 ) ) ( not ( = ?auto_23843 ?auto_23850 ) ) ( not ( = ?auto_23843 ?auto_23859 ) ) ( not ( = ?auto_23843 ?auto_23860 ) ) ( not ( = ?auto_23843 ?auto_23857 ) ) ( not ( = ?auto_23844 ?auto_23854 ) ) ( not ( = ?auto_23844 ?auto_23862 ) ) ( not ( = ?auto_23844 ?auto_23858 ) ) ( not ( = ?auto_23844 ?auto_23856 ) ) ( not ( = ?auto_23844 ?auto_23847 ) ) ( not ( = ?auto_23844 ?auto_23849 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23833 ?auto_23834 ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 )
      ( MAKE-1CRATE ?auto_23839 ?auto_23840 )
      ( MAKE-7CRATE-VERIFY ?auto_23833 ?auto_23834 ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23884 - SURFACE
      ?auto_23885 - SURFACE
      ?auto_23886 - SURFACE
      ?auto_23887 - SURFACE
      ?auto_23888 - SURFACE
      ?auto_23889 - SURFACE
      ?auto_23890 - SURFACE
      ?auto_23891 - SURFACE
      ?auto_23892 - SURFACE
    )
    :vars
    (
      ?auto_23896 - HOIST
      ?auto_23895 - PLACE
      ?auto_23897 - PLACE
      ?auto_23898 - HOIST
      ?auto_23894 - SURFACE
      ?auto_23915 - SURFACE
      ?auto_23910 - PLACE
      ?auto_23906 - HOIST
      ?auto_23905 - SURFACE
      ?auto_23916 - PLACE
      ?auto_23912 - HOIST
      ?auto_23914 - SURFACE
      ?auto_23908 - PLACE
      ?auto_23909 - HOIST
      ?auto_23902 - SURFACE
      ?auto_23911 - PLACE
      ?auto_23903 - HOIST
      ?auto_23901 - SURFACE
      ?auto_23899 - PLACE
      ?auto_23904 - HOIST
      ?auto_23913 - SURFACE
      ?auto_23907 - PLACE
      ?auto_23917 - HOIST
      ?auto_23900 - SURFACE
      ?auto_23893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23896 ?auto_23895 ) ( IS-CRATE ?auto_23892 ) ( not ( = ?auto_23897 ?auto_23895 ) ) ( HOIST-AT ?auto_23898 ?auto_23897 ) ( SURFACE-AT ?auto_23892 ?auto_23897 ) ( ON ?auto_23892 ?auto_23894 ) ( CLEAR ?auto_23892 ) ( not ( = ?auto_23891 ?auto_23892 ) ) ( not ( = ?auto_23891 ?auto_23894 ) ) ( not ( = ?auto_23892 ?auto_23894 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( IS-CRATE ?auto_23891 ) ( AVAILABLE ?auto_23898 ) ( SURFACE-AT ?auto_23891 ?auto_23897 ) ( ON ?auto_23891 ?auto_23915 ) ( CLEAR ?auto_23891 ) ( not ( = ?auto_23890 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23915 ) ) ( not ( = ?auto_23891 ?auto_23915 ) ) ( IS-CRATE ?auto_23890 ) ( not ( = ?auto_23910 ?auto_23895 ) ) ( HOIST-AT ?auto_23906 ?auto_23910 ) ( AVAILABLE ?auto_23906 ) ( SURFACE-AT ?auto_23890 ?auto_23910 ) ( ON ?auto_23890 ?auto_23905 ) ( CLEAR ?auto_23890 ) ( not ( = ?auto_23889 ?auto_23890 ) ) ( not ( = ?auto_23889 ?auto_23905 ) ) ( not ( = ?auto_23890 ?auto_23905 ) ) ( not ( = ?auto_23896 ?auto_23906 ) ) ( IS-CRATE ?auto_23889 ) ( not ( = ?auto_23916 ?auto_23895 ) ) ( HOIST-AT ?auto_23912 ?auto_23916 ) ( AVAILABLE ?auto_23912 ) ( SURFACE-AT ?auto_23889 ?auto_23916 ) ( ON ?auto_23889 ?auto_23914 ) ( CLEAR ?auto_23889 ) ( not ( = ?auto_23888 ?auto_23889 ) ) ( not ( = ?auto_23888 ?auto_23914 ) ) ( not ( = ?auto_23889 ?auto_23914 ) ) ( not ( = ?auto_23896 ?auto_23912 ) ) ( IS-CRATE ?auto_23888 ) ( not ( = ?auto_23908 ?auto_23895 ) ) ( HOIST-AT ?auto_23909 ?auto_23908 ) ( AVAILABLE ?auto_23909 ) ( SURFACE-AT ?auto_23888 ?auto_23908 ) ( ON ?auto_23888 ?auto_23902 ) ( CLEAR ?auto_23888 ) ( not ( = ?auto_23887 ?auto_23888 ) ) ( not ( = ?auto_23887 ?auto_23902 ) ) ( not ( = ?auto_23888 ?auto_23902 ) ) ( not ( = ?auto_23896 ?auto_23909 ) ) ( IS-CRATE ?auto_23887 ) ( not ( = ?auto_23911 ?auto_23895 ) ) ( HOIST-AT ?auto_23903 ?auto_23911 ) ( AVAILABLE ?auto_23903 ) ( SURFACE-AT ?auto_23887 ?auto_23911 ) ( ON ?auto_23887 ?auto_23901 ) ( CLEAR ?auto_23887 ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23901 ) ) ( not ( = ?auto_23887 ?auto_23901 ) ) ( not ( = ?auto_23896 ?auto_23903 ) ) ( IS-CRATE ?auto_23886 ) ( not ( = ?auto_23899 ?auto_23895 ) ) ( HOIST-AT ?auto_23904 ?auto_23899 ) ( AVAILABLE ?auto_23904 ) ( SURFACE-AT ?auto_23886 ?auto_23899 ) ( ON ?auto_23886 ?auto_23913 ) ( CLEAR ?auto_23886 ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23913 ) ) ( not ( = ?auto_23886 ?auto_23913 ) ) ( not ( = ?auto_23896 ?auto_23904 ) ) ( SURFACE-AT ?auto_23884 ?auto_23895 ) ( CLEAR ?auto_23884 ) ( IS-CRATE ?auto_23885 ) ( AVAILABLE ?auto_23896 ) ( not ( = ?auto_23907 ?auto_23895 ) ) ( HOIST-AT ?auto_23917 ?auto_23907 ) ( AVAILABLE ?auto_23917 ) ( SURFACE-AT ?auto_23885 ?auto_23907 ) ( ON ?auto_23885 ?auto_23900 ) ( CLEAR ?auto_23885 ) ( TRUCK-AT ?auto_23893 ?auto_23895 ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23900 ) ) ( not ( = ?auto_23885 ?auto_23900 ) ) ( not ( = ?auto_23896 ?auto_23917 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23913 ) ) ( not ( = ?auto_23886 ?auto_23900 ) ) ( not ( = ?auto_23899 ?auto_23907 ) ) ( not ( = ?auto_23904 ?auto_23917 ) ) ( not ( = ?auto_23913 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23901 ) ) ( not ( = ?auto_23885 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23901 ) ) ( not ( = ?auto_23887 ?auto_23913 ) ) ( not ( = ?auto_23887 ?auto_23900 ) ) ( not ( = ?auto_23911 ?auto_23899 ) ) ( not ( = ?auto_23911 ?auto_23907 ) ) ( not ( = ?auto_23903 ?auto_23904 ) ) ( not ( = ?auto_23903 ?auto_23917 ) ) ( not ( = ?auto_23901 ?auto_23913 ) ) ( not ( = ?auto_23901 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23884 ?auto_23902 ) ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( not ( = ?auto_23885 ?auto_23902 ) ) ( not ( = ?auto_23886 ?auto_23888 ) ) ( not ( = ?auto_23886 ?auto_23902 ) ) ( not ( = ?auto_23888 ?auto_23901 ) ) ( not ( = ?auto_23888 ?auto_23913 ) ) ( not ( = ?auto_23888 ?auto_23900 ) ) ( not ( = ?auto_23908 ?auto_23911 ) ) ( not ( = ?auto_23908 ?auto_23899 ) ) ( not ( = ?auto_23908 ?auto_23907 ) ) ( not ( = ?auto_23909 ?auto_23903 ) ) ( not ( = ?auto_23909 ?auto_23904 ) ) ( not ( = ?auto_23909 ?auto_23917 ) ) ( not ( = ?auto_23902 ?auto_23901 ) ) ( not ( = ?auto_23902 ?auto_23913 ) ) ( not ( = ?auto_23902 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23914 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23885 ?auto_23914 ) ) ( not ( = ?auto_23886 ?auto_23889 ) ) ( not ( = ?auto_23886 ?auto_23914 ) ) ( not ( = ?auto_23887 ?auto_23889 ) ) ( not ( = ?auto_23887 ?auto_23914 ) ) ( not ( = ?auto_23889 ?auto_23902 ) ) ( not ( = ?auto_23889 ?auto_23901 ) ) ( not ( = ?auto_23889 ?auto_23913 ) ) ( not ( = ?auto_23889 ?auto_23900 ) ) ( not ( = ?auto_23916 ?auto_23908 ) ) ( not ( = ?auto_23916 ?auto_23911 ) ) ( not ( = ?auto_23916 ?auto_23899 ) ) ( not ( = ?auto_23916 ?auto_23907 ) ) ( not ( = ?auto_23912 ?auto_23909 ) ) ( not ( = ?auto_23912 ?auto_23903 ) ) ( not ( = ?auto_23912 ?auto_23904 ) ) ( not ( = ?auto_23912 ?auto_23917 ) ) ( not ( = ?auto_23914 ?auto_23902 ) ) ( not ( = ?auto_23914 ?auto_23901 ) ) ( not ( = ?auto_23914 ?auto_23913 ) ) ( not ( = ?auto_23914 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23890 ) ) ( not ( = ?auto_23884 ?auto_23905 ) ) ( not ( = ?auto_23885 ?auto_23890 ) ) ( not ( = ?auto_23885 ?auto_23905 ) ) ( not ( = ?auto_23886 ?auto_23890 ) ) ( not ( = ?auto_23886 ?auto_23905 ) ) ( not ( = ?auto_23887 ?auto_23890 ) ) ( not ( = ?auto_23887 ?auto_23905 ) ) ( not ( = ?auto_23888 ?auto_23890 ) ) ( not ( = ?auto_23888 ?auto_23905 ) ) ( not ( = ?auto_23890 ?auto_23914 ) ) ( not ( = ?auto_23890 ?auto_23902 ) ) ( not ( = ?auto_23890 ?auto_23901 ) ) ( not ( = ?auto_23890 ?auto_23913 ) ) ( not ( = ?auto_23890 ?auto_23900 ) ) ( not ( = ?auto_23910 ?auto_23916 ) ) ( not ( = ?auto_23910 ?auto_23908 ) ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23910 ?auto_23899 ) ) ( not ( = ?auto_23910 ?auto_23907 ) ) ( not ( = ?auto_23906 ?auto_23912 ) ) ( not ( = ?auto_23906 ?auto_23909 ) ) ( not ( = ?auto_23906 ?auto_23903 ) ) ( not ( = ?auto_23906 ?auto_23904 ) ) ( not ( = ?auto_23906 ?auto_23917 ) ) ( not ( = ?auto_23905 ?auto_23914 ) ) ( not ( = ?auto_23905 ?auto_23902 ) ) ( not ( = ?auto_23905 ?auto_23901 ) ) ( not ( = ?auto_23905 ?auto_23913 ) ) ( not ( = ?auto_23905 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23891 ) ) ( not ( = ?auto_23884 ?auto_23915 ) ) ( not ( = ?auto_23885 ?auto_23891 ) ) ( not ( = ?auto_23885 ?auto_23915 ) ) ( not ( = ?auto_23886 ?auto_23891 ) ) ( not ( = ?auto_23886 ?auto_23915 ) ) ( not ( = ?auto_23887 ?auto_23891 ) ) ( not ( = ?auto_23887 ?auto_23915 ) ) ( not ( = ?auto_23888 ?auto_23891 ) ) ( not ( = ?auto_23888 ?auto_23915 ) ) ( not ( = ?auto_23889 ?auto_23891 ) ) ( not ( = ?auto_23889 ?auto_23915 ) ) ( not ( = ?auto_23891 ?auto_23905 ) ) ( not ( = ?auto_23891 ?auto_23914 ) ) ( not ( = ?auto_23891 ?auto_23902 ) ) ( not ( = ?auto_23891 ?auto_23901 ) ) ( not ( = ?auto_23891 ?auto_23913 ) ) ( not ( = ?auto_23891 ?auto_23900 ) ) ( not ( = ?auto_23897 ?auto_23910 ) ) ( not ( = ?auto_23897 ?auto_23916 ) ) ( not ( = ?auto_23897 ?auto_23908 ) ) ( not ( = ?auto_23897 ?auto_23911 ) ) ( not ( = ?auto_23897 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23907 ) ) ( not ( = ?auto_23898 ?auto_23906 ) ) ( not ( = ?auto_23898 ?auto_23912 ) ) ( not ( = ?auto_23898 ?auto_23909 ) ) ( not ( = ?auto_23898 ?auto_23903 ) ) ( not ( = ?auto_23898 ?auto_23904 ) ) ( not ( = ?auto_23898 ?auto_23917 ) ) ( not ( = ?auto_23915 ?auto_23905 ) ) ( not ( = ?auto_23915 ?auto_23914 ) ) ( not ( = ?auto_23915 ?auto_23902 ) ) ( not ( = ?auto_23915 ?auto_23901 ) ) ( not ( = ?auto_23915 ?auto_23913 ) ) ( not ( = ?auto_23915 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23892 ) ) ( not ( = ?auto_23884 ?auto_23894 ) ) ( not ( = ?auto_23885 ?auto_23892 ) ) ( not ( = ?auto_23885 ?auto_23894 ) ) ( not ( = ?auto_23886 ?auto_23892 ) ) ( not ( = ?auto_23886 ?auto_23894 ) ) ( not ( = ?auto_23887 ?auto_23892 ) ) ( not ( = ?auto_23887 ?auto_23894 ) ) ( not ( = ?auto_23888 ?auto_23892 ) ) ( not ( = ?auto_23888 ?auto_23894 ) ) ( not ( = ?auto_23889 ?auto_23892 ) ) ( not ( = ?auto_23889 ?auto_23894 ) ) ( not ( = ?auto_23890 ?auto_23892 ) ) ( not ( = ?auto_23890 ?auto_23894 ) ) ( not ( = ?auto_23892 ?auto_23915 ) ) ( not ( = ?auto_23892 ?auto_23905 ) ) ( not ( = ?auto_23892 ?auto_23914 ) ) ( not ( = ?auto_23892 ?auto_23902 ) ) ( not ( = ?auto_23892 ?auto_23901 ) ) ( not ( = ?auto_23892 ?auto_23913 ) ) ( not ( = ?auto_23892 ?auto_23900 ) ) ( not ( = ?auto_23894 ?auto_23915 ) ) ( not ( = ?auto_23894 ?auto_23905 ) ) ( not ( = ?auto_23894 ?auto_23914 ) ) ( not ( = ?auto_23894 ?auto_23902 ) ) ( not ( = ?auto_23894 ?auto_23901 ) ) ( not ( = ?auto_23894 ?auto_23913 ) ) ( not ( = ?auto_23894 ?auto_23900 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23888 ?auto_23889 ?auto_23890 ?auto_23891 )
      ( MAKE-1CRATE ?auto_23891 ?auto_23892 )
      ( MAKE-8CRATE-VERIFY ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23888 ?auto_23889 ?auto_23890 ?auto_23891 ?auto_23892 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23938 - SURFACE
      ?auto_23939 - SURFACE
      ?auto_23940 - SURFACE
      ?auto_23941 - SURFACE
      ?auto_23942 - SURFACE
      ?auto_23943 - SURFACE
      ?auto_23944 - SURFACE
      ?auto_23945 - SURFACE
      ?auto_23946 - SURFACE
      ?auto_23947 - SURFACE
    )
    :vars
    (
      ?auto_23952 - HOIST
      ?auto_23951 - PLACE
      ?auto_23950 - PLACE
      ?auto_23949 - HOIST
      ?auto_23948 - SURFACE
      ?auto_23969 - PLACE
      ?auto_23971 - HOIST
      ?auto_23974 - SURFACE
      ?auto_23955 - SURFACE
      ?auto_23962 - PLACE
      ?auto_23965 - HOIST
      ?auto_23966 - SURFACE
      ?auto_23954 - PLACE
      ?auto_23964 - HOIST
      ?auto_23959 - SURFACE
      ?auto_23961 - PLACE
      ?auto_23960 - HOIST
      ?auto_23970 - SURFACE
      ?auto_23963 - PLACE
      ?auto_23968 - HOIST
      ?auto_23973 - SURFACE
      ?auto_23958 - PLACE
      ?auto_23967 - HOIST
      ?auto_23956 - SURFACE
      ?auto_23975 - PLACE
      ?auto_23957 - HOIST
      ?auto_23972 - SURFACE
      ?auto_23953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23952 ?auto_23951 ) ( IS-CRATE ?auto_23947 ) ( not ( = ?auto_23950 ?auto_23951 ) ) ( HOIST-AT ?auto_23949 ?auto_23950 ) ( AVAILABLE ?auto_23949 ) ( SURFACE-AT ?auto_23947 ?auto_23950 ) ( ON ?auto_23947 ?auto_23948 ) ( CLEAR ?auto_23947 ) ( not ( = ?auto_23946 ?auto_23947 ) ) ( not ( = ?auto_23946 ?auto_23948 ) ) ( not ( = ?auto_23947 ?auto_23948 ) ) ( not ( = ?auto_23952 ?auto_23949 ) ) ( IS-CRATE ?auto_23946 ) ( not ( = ?auto_23969 ?auto_23951 ) ) ( HOIST-AT ?auto_23971 ?auto_23969 ) ( SURFACE-AT ?auto_23946 ?auto_23969 ) ( ON ?auto_23946 ?auto_23974 ) ( CLEAR ?auto_23946 ) ( not ( = ?auto_23945 ?auto_23946 ) ) ( not ( = ?auto_23945 ?auto_23974 ) ) ( not ( = ?auto_23946 ?auto_23974 ) ) ( not ( = ?auto_23952 ?auto_23971 ) ) ( IS-CRATE ?auto_23945 ) ( AVAILABLE ?auto_23971 ) ( SURFACE-AT ?auto_23945 ?auto_23969 ) ( ON ?auto_23945 ?auto_23955 ) ( CLEAR ?auto_23945 ) ( not ( = ?auto_23944 ?auto_23945 ) ) ( not ( = ?auto_23944 ?auto_23955 ) ) ( not ( = ?auto_23945 ?auto_23955 ) ) ( IS-CRATE ?auto_23944 ) ( not ( = ?auto_23962 ?auto_23951 ) ) ( HOIST-AT ?auto_23965 ?auto_23962 ) ( AVAILABLE ?auto_23965 ) ( SURFACE-AT ?auto_23944 ?auto_23962 ) ( ON ?auto_23944 ?auto_23966 ) ( CLEAR ?auto_23944 ) ( not ( = ?auto_23943 ?auto_23944 ) ) ( not ( = ?auto_23943 ?auto_23966 ) ) ( not ( = ?auto_23944 ?auto_23966 ) ) ( not ( = ?auto_23952 ?auto_23965 ) ) ( IS-CRATE ?auto_23943 ) ( not ( = ?auto_23954 ?auto_23951 ) ) ( HOIST-AT ?auto_23964 ?auto_23954 ) ( AVAILABLE ?auto_23964 ) ( SURFACE-AT ?auto_23943 ?auto_23954 ) ( ON ?auto_23943 ?auto_23959 ) ( CLEAR ?auto_23943 ) ( not ( = ?auto_23942 ?auto_23943 ) ) ( not ( = ?auto_23942 ?auto_23959 ) ) ( not ( = ?auto_23943 ?auto_23959 ) ) ( not ( = ?auto_23952 ?auto_23964 ) ) ( IS-CRATE ?auto_23942 ) ( not ( = ?auto_23961 ?auto_23951 ) ) ( HOIST-AT ?auto_23960 ?auto_23961 ) ( AVAILABLE ?auto_23960 ) ( SURFACE-AT ?auto_23942 ?auto_23961 ) ( ON ?auto_23942 ?auto_23970 ) ( CLEAR ?auto_23942 ) ( not ( = ?auto_23941 ?auto_23942 ) ) ( not ( = ?auto_23941 ?auto_23970 ) ) ( not ( = ?auto_23942 ?auto_23970 ) ) ( not ( = ?auto_23952 ?auto_23960 ) ) ( IS-CRATE ?auto_23941 ) ( not ( = ?auto_23963 ?auto_23951 ) ) ( HOIST-AT ?auto_23968 ?auto_23963 ) ( AVAILABLE ?auto_23968 ) ( SURFACE-AT ?auto_23941 ?auto_23963 ) ( ON ?auto_23941 ?auto_23973 ) ( CLEAR ?auto_23941 ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( not ( = ?auto_23940 ?auto_23973 ) ) ( not ( = ?auto_23941 ?auto_23973 ) ) ( not ( = ?auto_23952 ?auto_23968 ) ) ( IS-CRATE ?auto_23940 ) ( not ( = ?auto_23958 ?auto_23951 ) ) ( HOIST-AT ?auto_23967 ?auto_23958 ) ( AVAILABLE ?auto_23967 ) ( SURFACE-AT ?auto_23940 ?auto_23958 ) ( ON ?auto_23940 ?auto_23956 ) ( CLEAR ?auto_23940 ) ( not ( = ?auto_23939 ?auto_23940 ) ) ( not ( = ?auto_23939 ?auto_23956 ) ) ( not ( = ?auto_23940 ?auto_23956 ) ) ( not ( = ?auto_23952 ?auto_23967 ) ) ( SURFACE-AT ?auto_23938 ?auto_23951 ) ( CLEAR ?auto_23938 ) ( IS-CRATE ?auto_23939 ) ( AVAILABLE ?auto_23952 ) ( not ( = ?auto_23975 ?auto_23951 ) ) ( HOIST-AT ?auto_23957 ?auto_23975 ) ( AVAILABLE ?auto_23957 ) ( SURFACE-AT ?auto_23939 ?auto_23975 ) ( ON ?auto_23939 ?auto_23972 ) ( CLEAR ?auto_23939 ) ( TRUCK-AT ?auto_23953 ?auto_23951 ) ( not ( = ?auto_23938 ?auto_23939 ) ) ( not ( = ?auto_23938 ?auto_23972 ) ) ( not ( = ?auto_23939 ?auto_23972 ) ) ( not ( = ?auto_23952 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23940 ) ) ( not ( = ?auto_23938 ?auto_23956 ) ) ( not ( = ?auto_23940 ?auto_23972 ) ) ( not ( = ?auto_23958 ?auto_23975 ) ) ( not ( = ?auto_23967 ?auto_23957 ) ) ( not ( = ?auto_23956 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23941 ) ) ( not ( = ?auto_23938 ?auto_23973 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( not ( = ?auto_23939 ?auto_23973 ) ) ( not ( = ?auto_23941 ?auto_23956 ) ) ( not ( = ?auto_23941 ?auto_23972 ) ) ( not ( = ?auto_23963 ?auto_23958 ) ) ( not ( = ?auto_23963 ?auto_23975 ) ) ( not ( = ?auto_23968 ?auto_23967 ) ) ( not ( = ?auto_23968 ?auto_23957 ) ) ( not ( = ?auto_23973 ?auto_23956 ) ) ( not ( = ?auto_23973 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23942 ) ) ( not ( = ?auto_23938 ?auto_23970 ) ) ( not ( = ?auto_23939 ?auto_23942 ) ) ( not ( = ?auto_23939 ?auto_23970 ) ) ( not ( = ?auto_23940 ?auto_23942 ) ) ( not ( = ?auto_23940 ?auto_23970 ) ) ( not ( = ?auto_23942 ?auto_23973 ) ) ( not ( = ?auto_23942 ?auto_23956 ) ) ( not ( = ?auto_23942 ?auto_23972 ) ) ( not ( = ?auto_23961 ?auto_23963 ) ) ( not ( = ?auto_23961 ?auto_23958 ) ) ( not ( = ?auto_23961 ?auto_23975 ) ) ( not ( = ?auto_23960 ?auto_23968 ) ) ( not ( = ?auto_23960 ?auto_23967 ) ) ( not ( = ?auto_23960 ?auto_23957 ) ) ( not ( = ?auto_23970 ?auto_23973 ) ) ( not ( = ?auto_23970 ?auto_23956 ) ) ( not ( = ?auto_23970 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23943 ) ) ( not ( = ?auto_23938 ?auto_23959 ) ) ( not ( = ?auto_23939 ?auto_23943 ) ) ( not ( = ?auto_23939 ?auto_23959 ) ) ( not ( = ?auto_23940 ?auto_23943 ) ) ( not ( = ?auto_23940 ?auto_23959 ) ) ( not ( = ?auto_23941 ?auto_23943 ) ) ( not ( = ?auto_23941 ?auto_23959 ) ) ( not ( = ?auto_23943 ?auto_23970 ) ) ( not ( = ?auto_23943 ?auto_23973 ) ) ( not ( = ?auto_23943 ?auto_23956 ) ) ( not ( = ?auto_23943 ?auto_23972 ) ) ( not ( = ?auto_23954 ?auto_23961 ) ) ( not ( = ?auto_23954 ?auto_23963 ) ) ( not ( = ?auto_23954 ?auto_23958 ) ) ( not ( = ?auto_23954 ?auto_23975 ) ) ( not ( = ?auto_23964 ?auto_23960 ) ) ( not ( = ?auto_23964 ?auto_23968 ) ) ( not ( = ?auto_23964 ?auto_23967 ) ) ( not ( = ?auto_23964 ?auto_23957 ) ) ( not ( = ?auto_23959 ?auto_23970 ) ) ( not ( = ?auto_23959 ?auto_23973 ) ) ( not ( = ?auto_23959 ?auto_23956 ) ) ( not ( = ?auto_23959 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23944 ) ) ( not ( = ?auto_23938 ?auto_23966 ) ) ( not ( = ?auto_23939 ?auto_23944 ) ) ( not ( = ?auto_23939 ?auto_23966 ) ) ( not ( = ?auto_23940 ?auto_23944 ) ) ( not ( = ?auto_23940 ?auto_23966 ) ) ( not ( = ?auto_23941 ?auto_23944 ) ) ( not ( = ?auto_23941 ?auto_23966 ) ) ( not ( = ?auto_23942 ?auto_23944 ) ) ( not ( = ?auto_23942 ?auto_23966 ) ) ( not ( = ?auto_23944 ?auto_23959 ) ) ( not ( = ?auto_23944 ?auto_23970 ) ) ( not ( = ?auto_23944 ?auto_23973 ) ) ( not ( = ?auto_23944 ?auto_23956 ) ) ( not ( = ?auto_23944 ?auto_23972 ) ) ( not ( = ?auto_23962 ?auto_23954 ) ) ( not ( = ?auto_23962 ?auto_23961 ) ) ( not ( = ?auto_23962 ?auto_23963 ) ) ( not ( = ?auto_23962 ?auto_23958 ) ) ( not ( = ?auto_23962 ?auto_23975 ) ) ( not ( = ?auto_23965 ?auto_23964 ) ) ( not ( = ?auto_23965 ?auto_23960 ) ) ( not ( = ?auto_23965 ?auto_23968 ) ) ( not ( = ?auto_23965 ?auto_23967 ) ) ( not ( = ?auto_23965 ?auto_23957 ) ) ( not ( = ?auto_23966 ?auto_23959 ) ) ( not ( = ?auto_23966 ?auto_23970 ) ) ( not ( = ?auto_23966 ?auto_23973 ) ) ( not ( = ?auto_23966 ?auto_23956 ) ) ( not ( = ?auto_23966 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23945 ) ) ( not ( = ?auto_23938 ?auto_23955 ) ) ( not ( = ?auto_23939 ?auto_23945 ) ) ( not ( = ?auto_23939 ?auto_23955 ) ) ( not ( = ?auto_23940 ?auto_23945 ) ) ( not ( = ?auto_23940 ?auto_23955 ) ) ( not ( = ?auto_23941 ?auto_23945 ) ) ( not ( = ?auto_23941 ?auto_23955 ) ) ( not ( = ?auto_23942 ?auto_23945 ) ) ( not ( = ?auto_23942 ?auto_23955 ) ) ( not ( = ?auto_23943 ?auto_23945 ) ) ( not ( = ?auto_23943 ?auto_23955 ) ) ( not ( = ?auto_23945 ?auto_23966 ) ) ( not ( = ?auto_23945 ?auto_23959 ) ) ( not ( = ?auto_23945 ?auto_23970 ) ) ( not ( = ?auto_23945 ?auto_23973 ) ) ( not ( = ?auto_23945 ?auto_23956 ) ) ( not ( = ?auto_23945 ?auto_23972 ) ) ( not ( = ?auto_23969 ?auto_23962 ) ) ( not ( = ?auto_23969 ?auto_23954 ) ) ( not ( = ?auto_23969 ?auto_23961 ) ) ( not ( = ?auto_23969 ?auto_23963 ) ) ( not ( = ?auto_23969 ?auto_23958 ) ) ( not ( = ?auto_23969 ?auto_23975 ) ) ( not ( = ?auto_23971 ?auto_23965 ) ) ( not ( = ?auto_23971 ?auto_23964 ) ) ( not ( = ?auto_23971 ?auto_23960 ) ) ( not ( = ?auto_23971 ?auto_23968 ) ) ( not ( = ?auto_23971 ?auto_23967 ) ) ( not ( = ?auto_23971 ?auto_23957 ) ) ( not ( = ?auto_23955 ?auto_23966 ) ) ( not ( = ?auto_23955 ?auto_23959 ) ) ( not ( = ?auto_23955 ?auto_23970 ) ) ( not ( = ?auto_23955 ?auto_23973 ) ) ( not ( = ?auto_23955 ?auto_23956 ) ) ( not ( = ?auto_23955 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23946 ) ) ( not ( = ?auto_23938 ?auto_23974 ) ) ( not ( = ?auto_23939 ?auto_23946 ) ) ( not ( = ?auto_23939 ?auto_23974 ) ) ( not ( = ?auto_23940 ?auto_23946 ) ) ( not ( = ?auto_23940 ?auto_23974 ) ) ( not ( = ?auto_23941 ?auto_23946 ) ) ( not ( = ?auto_23941 ?auto_23974 ) ) ( not ( = ?auto_23942 ?auto_23946 ) ) ( not ( = ?auto_23942 ?auto_23974 ) ) ( not ( = ?auto_23943 ?auto_23946 ) ) ( not ( = ?auto_23943 ?auto_23974 ) ) ( not ( = ?auto_23944 ?auto_23946 ) ) ( not ( = ?auto_23944 ?auto_23974 ) ) ( not ( = ?auto_23946 ?auto_23955 ) ) ( not ( = ?auto_23946 ?auto_23966 ) ) ( not ( = ?auto_23946 ?auto_23959 ) ) ( not ( = ?auto_23946 ?auto_23970 ) ) ( not ( = ?auto_23946 ?auto_23973 ) ) ( not ( = ?auto_23946 ?auto_23956 ) ) ( not ( = ?auto_23946 ?auto_23972 ) ) ( not ( = ?auto_23974 ?auto_23955 ) ) ( not ( = ?auto_23974 ?auto_23966 ) ) ( not ( = ?auto_23974 ?auto_23959 ) ) ( not ( = ?auto_23974 ?auto_23970 ) ) ( not ( = ?auto_23974 ?auto_23973 ) ) ( not ( = ?auto_23974 ?auto_23956 ) ) ( not ( = ?auto_23974 ?auto_23972 ) ) ( not ( = ?auto_23938 ?auto_23947 ) ) ( not ( = ?auto_23938 ?auto_23948 ) ) ( not ( = ?auto_23939 ?auto_23947 ) ) ( not ( = ?auto_23939 ?auto_23948 ) ) ( not ( = ?auto_23940 ?auto_23947 ) ) ( not ( = ?auto_23940 ?auto_23948 ) ) ( not ( = ?auto_23941 ?auto_23947 ) ) ( not ( = ?auto_23941 ?auto_23948 ) ) ( not ( = ?auto_23942 ?auto_23947 ) ) ( not ( = ?auto_23942 ?auto_23948 ) ) ( not ( = ?auto_23943 ?auto_23947 ) ) ( not ( = ?auto_23943 ?auto_23948 ) ) ( not ( = ?auto_23944 ?auto_23947 ) ) ( not ( = ?auto_23944 ?auto_23948 ) ) ( not ( = ?auto_23945 ?auto_23947 ) ) ( not ( = ?auto_23945 ?auto_23948 ) ) ( not ( = ?auto_23947 ?auto_23974 ) ) ( not ( = ?auto_23947 ?auto_23955 ) ) ( not ( = ?auto_23947 ?auto_23966 ) ) ( not ( = ?auto_23947 ?auto_23959 ) ) ( not ( = ?auto_23947 ?auto_23970 ) ) ( not ( = ?auto_23947 ?auto_23973 ) ) ( not ( = ?auto_23947 ?auto_23956 ) ) ( not ( = ?auto_23947 ?auto_23972 ) ) ( not ( = ?auto_23950 ?auto_23969 ) ) ( not ( = ?auto_23950 ?auto_23962 ) ) ( not ( = ?auto_23950 ?auto_23954 ) ) ( not ( = ?auto_23950 ?auto_23961 ) ) ( not ( = ?auto_23950 ?auto_23963 ) ) ( not ( = ?auto_23950 ?auto_23958 ) ) ( not ( = ?auto_23950 ?auto_23975 ) ) ( not ( = ?auto_23949 ?auto_23971 ) ) ( not ( = ?auto_23949 ?auto_23965 ) ) ( not ( = ?auto_23949 ?auto_23964 ) ) ( not ( = ?auto_23949 ?auto_23960 ) ) ( not ( = ?auto_23949 ?auto_23968 ) ) ( not ( = ?auto_23949 ?auto_23967 ) ) ( not ( = ?auto_23949 ?auto_23957 ) ) ( not ( = ?auto_23948 ?auto_23974 ) ) ( not ( = ?auto_23948 ?auto_23955 ) ) ( not ( = ?auto_23948 ?auto_23966 ) ) ( not ( = ?auto_23948 ?auto_23959 ) ) ( not ( = ?auto_23948 ?auto_23970 ) ) ( not ( = ?auto_23948 ?auto_23973 ) ) ( not ( = ?auto_23948 ?auto_23956 ) ) ( not ( = ?auto_23948 ?auto_23972 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23938 ?auto_23939 ?auto_23940 ?auto_23941 ?auto_23942 ?auto_23943 ?auto_23944 ?auto_23945 ?auto_23946 )
      ( MAKE-1CRATE ?auto_23946 ?auto_23947 )
      ( MAKE-9CRATE-VERIFY ?auto_23938 ?auto_23939 ?auto_23940 ?auto_23941 ?auto_23942 ?auto_23943 ?auto_23944 ?auto_23945 ?auto_23946 ?auto_23947 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23997 - SURFACE
      ?auto_23998 - SURFACE
      ?auto_23999 - SURFACE
      ?auto_24000 - SURFACE
      ?auto_24001 - SURFACE
      ?auto_24002 - SURFACE
      ?auto_24003 - SURFACE
      ?auto_24004 - SURFACE
      ?auto_24005 - SURFACE
      ?auto_24006 - SURFACE
      ?auto_24007 - SURFACE
    )
    :vars
    (
      ?auto_24012 - HOIST
      ?auto_24009 - PLACE
      ?auto_24010 - PLACE
      ?auto_24008 - HOIST
      ?auto_24013 - SURFACE
      ?auto_24025 - PLACE
      ?auto_24034 - HOIST
      ?auto_24019 - SURFACE
      ?auto_24031 - PLACE
      ?auto_24017 - HOIST
      ?auto_24022 - SURFACE
      ?auto_24015 - SURFACE
      ?auto_24020 - PLACE
      ?auto_24016 - HOIST
      ?auto_24028 - SURFACE
      ?auto_24033 - PLACE
      ?auto_24038 - HOIST
      ?auto_24024 - SURFACE
      ?auto_24027 - PLACE
      ?auto_24023 - HOIST
      ?auto_24018 - SURFACE
      ?auto_24036 - PLACE
      ?auto_24026 - HOIST
      ?auto_24029 - SURFACE
      ?auto_24032 - PLACE
      ?auto_24021 - HOIST
      ?auto_24030 - SURFACE
      ?auto_24037 - PLACE
      ?auto_24035 - HOIST
      ?auto_24014 - SURFACE
      ?auto_24011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24012 ?auto_24009 ) ( IS-CRATE ?auto_24007 ) ( not ( = ?auto_24010 ?auto_24009 ) ) ( HOIST-AT ?auto_24008 ?auto_24010 ) ( AVAILABLE ?auto_24008 ) ( SURFACE-AT ?auto_24007 ?auto_24010 ) ( ON ?auto_24007 ?auto_24013 ) ( CLEAR ?auto_24007 ) ( not ( = ?auto_24006 ?auto_24007 ) ) ( not ( = ?auto_24006 ?auto_24013 ) ) ( not ( = ?auto_24007 ?auto_24013 ) ) ( not ( = ?auto_24012 ?auto_24008 ) ) ( IS-CRATE ?auto_24006 ) ( not ( = ?auto_24025 ?auto_24009 ) ) ( HOIST-AT ?auto_24034 ?auto_24025 ) ( AVAILABLE ?auto_24034 ) ( SURFACE-AT ?auto_24006 ?auto_24025 ) ( ON ?auto_24006 ?auto_24019 ) ( CLEAR ?auto_24006 ) ( not ( = ?auto_24005 ?auto_24006 ) ) ( not ( = ?auto_24005 ?auto_24019 ) ) ( not ( = ?auto_24006 ?auto_24019 ) ) ( not ( = ?auto_24012 ?auto_24034 ) ) ( IS-CRATE ?auto_24005 ) ( not ( = ?auto_24031 ?auto_24009 ) ) ( HOIST-AT ?auto_24017 ?auto_24031 ) ( SURFACE-AT ?auto_24005 ?auto_24031 ) ( ON ?auto_24005 ?auto_24022 ) ( CLEAR ?auto_24005 ) ( not ( = ?auto_24004 ?auto_24005 ) ) ( not ( = ?auto_24004 ?auto_24022 ) ) ( not ( = ?auto_24005 ?auto_24022 ) ) ( not ( = ?auto_24012 ?auto_24017 ) ) ( IS-CRATE ?auto_24004 ) ( AVAILABLE ?auto_24017 ) ( SURFACE-AT ?auto_24004 ?auto_24031 ) ( ON ?auto_24004 ?auto_24015 ) ( CLEAR ?auto_24004 ) ( not ( = ?auto_24003 ?auto_24004 ) ) ( not ( = ?auto_24003 ?auto_24015 ) ) ( not ( = ?auto_24004 ?auto_24015 ) ) ( IS-CRATE ?auto_24003 ) ( not ( = ?auto_24020 ?auto_24009 ) ) ( HOIST-AT ?auto_24016 ?auto_24020 ) ( AVAILABLE ?auto_24016 ) ( SURFACE-AT ?auto_24003 ?auto_24020 ) ( ON ?auto_24003 ?auto_24028 ) ( CLEAR ?auto_24003 ) ( not ( = ?auto_24002 ?auto_24003 ) ) ( not ( = ?auto_24002 ?auto_24028 ) ) ( not ( = ?auto_24003 ?auto_24028 ) ) ( not ( = ?auto_24012 ?auto_24016 ) ) ( IS-CRATE ?auto_24002 ) ( not ( = ?auto_24033 ?auto_24009 ) ) ( HOIST-AT ?auto_24038 ?auto_24033 ) ( AVAILABLE ?auto_24038 ) ( SURFACE-AT ?auto_24002 ?auto_24033 ) ( ON ?auto_24002 ?auto_24024 ) ( CLEAR ?auto_24002 ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( not ( = ?auto_24001 ?auto_24024 ) ) ( not ( = ?auto_24002 ?auto_24024 ) ) ( not ( = ?auto_24012 ?auto_24038 ) ) ( IS-CRATE ?auto_24001 ) ( not ( = ?auto_24027 ?auto_24009 ) ) ( HOIST-AT ?auto_24023 ?auto_24027 ) ( AVAILABLE ?auto_24023 ) ( SURFACE-AT ?auto_24001 ?auto_24027 ) ( ON ?auto_24001 ?auto_24018 ) ( CLEAR ?auto_24001 ) ( not ( = ?auto_24000 ?auto_24001 ) ) ( not ( = ?auto_24000 ?auto_24018 ) ) ( not ( = ?auto_24001 ?auto_24018 ) ) ( not ( = ?auto_24012 ?auto_24023 ) ) ( IS-CRATE ?auto_24000 ) ( not ( = ?auto_24036 ?auto_24009 ) ) ( HOIST-AT ?auto_24026 ?auto_24036 ) ( AVAILABLE ?auto_24026 ) ( SURFACE-AT ?auto_24000 ?auto_24036 ) ( ON ?auto_24000 ?auto_24029 ) ( CLEAR ?auto_24000 ) ( not ( = ?auto_23999 ?auto_24000 ) ) ( not ( = ?auto_23999 ?auto_24029 ) ) ( not ( = ?auto_24000 ?auto_24029 ) ) ( not ( = ?auto_24012 ?auto_24026 ) ) ( IS-CRATE ?auto_23999 ) ( not ( = ?auto_24032 ?auto_24009 ) ) ( HOIST-AT ?auto_24021 ?auto_24032 ) ( AVAILABLE ?auto_24021 ) ( SURFACE-AT ?auto_23999 ?auto_24032 ) ( ON ?auto_23999 ?auto_24030 ) ( CLEAR ?auto_23999 ) ( not ( = ?auto_23998 ?auto_23999 ) ) ( not ( = ?auto_23998 ?auto_24030 ) ) ( not ( = ?auto_23999 ?auto_24030 ) ) ( not ( = ?auto_24012 ?auto_24021 ) ) ( SURFACE-AT ?auto_23997 ?auto_24009 ) ( CLEAR ?auto_23997 ) ( IS-CRATE ?auto_23998 ) ( AVAILABLE ?auto_24012 ) ( not ( = ?auto_24037 ?auto_24009 ) ) ( HOIST-AT ?auto_24035 ?auto_24037 ) ( AVAILABLE ?auto_24035 ) ( SURFACE-AT ?auto_23998 ?auto_24037 ) ( ON ?auto_23998 ?auto_24014 ) ( CLEAR ?auto_23998 ) ( TRUCK-AT ?auto_24011 ?auto_24009 ) ( not ( = ?auto_23997 ?auto_23998 ) ) ( not ( = ?auto_23997 ?auto_24014 ) ) ( not ( = ?auto_23998 ?auto_24014 ) ) ( not ( = ?auto_24012 ?auto_24035 ) ) ( not ( = ?auto_23997 ?auto_23999 ) ) ( not ( = ?auto_23997 ?auto_24030 ) ) ( not ( = ?auto_23999 ?auto_24014 ) ) ( not ( = ?auto_24032 ?auto_24037 ) ) ( not ( = ?auto_24021 ?auto_24035 ) ) ( not ( = ?auto_24030 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24000 ) ) ( not ( = ?auto_23997 ?auto_24029 ) ) ( not ( = ?auto_23998 ?auto_24000 ) ) ( not ( = ?auto_23998 ?auto_24029 ) ) ( not ( = ?auto_24000 ?auto_24030 ) ) ( not ( = ?auto_24000 ?auto_24014 ) ) ( not ( = ?auto_24036 ?auto_24032 ) ) ( not ( = ?auto_24036 ?auto_24037 ) ) ( not ( = ?auto_24026 ?auto_24021 ) ) ( not ( = ?auto_24026 ?auto_24035 ) ) ( not ( = ?auto_24029 ?auto_24030 ) ) ( not ( = ?auto_24029 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24001 ) ) ( not ( = ?auto_23997 ?auto_24018 ) ) ( not ( = ?auto_23998 ?auto_24001 ) ) ( not ( = ?auto_23998 ?auto_24018 ) ) ( not ( = ?auto_23999 ?auto_24001 ) ) ( not ( = ?auto_23999 ?auto_24018 ) ) ( not ( = ?auto_24001 ?auto_24029 ) ) ( not ( = ?auto_24001 ?auto_24030 ) ) ( not ( = ?auto_24001 ?auto_24014 ) ) ( not ( = ?auto_24027 ?auto_24036 ) ) ( not ( = ?auto_24027 ?auto_24032 ) ) ( not ( = ?auto_24027 ?auto_24037 ) ) ( not ( = ?auto_24023 ?auto_24026 ) ) ( not ( = ?auto_24023 ?auto_24021 ) ) ( not ( = ?auto_24023 ?auto_24035 ) ) ( not ( = ?auto_24018 ?auto_24029 ) ) ( not ( = ?auto_24018 ?auto_24030 ) ) ( not ( = ?auto_24018 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24002 ) ) ( not ( = ?auto_23997 ?auto_24024 ) ) ( not ( = ?auto_23998 ?auto_24002 ) ) ( not ( = ?auto_23998 ?auto_24024 ) ) ( not ( = ?auto_23999 ?auto_24002 ) ) ( not ( = ?auto_23999 ?auto_24024 ) ) ( not ( = ?auto_24000 ?auto_24002 ) ) ( not ( = ?auto_24000 ?auto_24024 ) ) ( not ( = ?auto_24002 ?auto_24018 ) ) ( not ( = ?auto_24002 ?auto_24029 ) ) ( not ( = ?auto_24002 ?auto_24030 ) ) ( not ( = ?auto_24002 ?auto_24014 ) ) ( not ( = ?auto_24033 ?auto_24027 ) ) ( not ( = ?auto_24033 ?auto_24036 ) ) ( not ( = ?auto_24033 ?auto_24032 ) ) ( not ( = ?auto_24033 ?auto_24037 ) ) ( not ( = ?auto_24038 ?auto_24023 ) ) ( not ( = ?auto_24038 ?auto_24026 ) ) ( not ( = ?auto_24038 ?auto_24021 ) ) ( not ( = ?auto_24038 ?auto_24035 ) ) ( not ( = ?auto_24024 ?auto_24018 ) ) ( not ( = ?auto_24024 ?auto_24029 ) ) ( not ( = ?auto_24024 ?auto_24030 ) ) ( not ( = ?auto_24024 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24003 ) ) ( not ( = ?auto_23997 ?auto_24028 ) ) ( not ( = ?auto_23998 ?auto_24003 ) ) ( not ( = ?auto_23998 ?auto_24028 ) ) ( not ( = ?auto_23999 ?auto_24003 ) ) ( not ( = ?auto_23999 ?auto_24028 ) ) ( not ( = ?auto_24000 ?auto_24003 ) ) ( not ( = ?auto_24000 ?auto_24028 ) ) ( not ( = ?auto_24001 ?auto_24003 ) ) ( not ( = ?auto_24001 ?auto_24028 ) ) ( not ( = ?auto_24003 ?auto_24024 ) ) ( not ( = ?auto_24003 ?auto_24018 ) ) ( not ( = ?auto_24003 ?auto_24029 ) ) ( not ( = ?auto_24003 ?auto_24030 ) ) ( not ( = ?auto_24003 ?auto_24014 ) ) ( not ( = ?auto_24020 ?auto_24033 ) ) ( not ( = ?auto_24020 ?auto_24027 ) ) ( not ( = ?auto_24020 ?auto_24036 ) ) ( not ( = ?auto_24020 ?auto_24032 ) ) ( not ( = ?auto_24020 ?auto_24037 ) ) ( not ( = ?auto_24016 ?auto_24038 ) ) ( not ( = ?auto_24016 ?auto_24023 ) ) ( not ( = ?auto_24016 ?auto_24026 ) ) ( not ( = ?auto_24016 ?auto_24021 ) ) ( not ( = ?auto_24016 ?auto_24035 ) ) ( not ( = ?auto_24028 ?auto_24024 ) ) ( not ( = ?auto_24028 ?auto_24018 ) ) ( not ( = ?auto_24028 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24030 ) ) ( not ( = ?auto_24028 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24004 ) ) ( not ( = ?auto_23997 ?auto_24015 ) ) ( not ( = ?auto_23998 ?auto_24004 ) ) ( not ( = ?auto_23998 ?auto_24015 ) ) ( not ( = ?auto_23999 ?auto_24004 ) ) ( not ( = ?auto_23999 ?auto_24015 ) ) ( not ( = ?auto_24000 ?auto_24004 ) ) ( not ( = ?auto_24000 ?auto_24015 ) ) ( not ( = ?auto_24001 ?auto_24004 ) ) ( not ( = ?auto_24001 ?auto_24015 ) ) ( not ( = ?auto_24002 ?auto_24004 ) ) ( not ( = ?auto_24002 ?auto_24015 ) ) ( not ( = ?auto_24004 ?auto_24028 ) ) ( not ( = ?auto_24004 ?auto_24024 ) ) ( not ( = ?auto_24004 ?auto_24018 ) ) ( not ( = ?auto_24004 ?auto_24029 ) ) ( not ( = ?auto_24004 ?auto_24030 ) ) ( not ( = ?auto_24004 ?auto_24014 ) ) ( not ( = ?auto_24031 ?auto_24020 ) ) ( not ( = ?auto_24031 ?auto_24033 ) ) ( not ( = ?auto_24031 ?auto_24027 ) ) ( not ( = ?auto_24031 ?auto_24036 ) ) ( not ( = ?auto_24031 ?auto_24032 ) ) ( not ( = ?auto_24031 ?auto_24037 ) ) ( not ( = ?auto_24017 ?auto_24016 ) ) ( not ( = ?auto_24017 ?auto_24038 ) ) ( not ( = ?auto_24017 ?auto_24023 ) ) ( not ( = ?auto_24017 ?auto_24026 ) ) ( not ( = ?auto_24017 ?auto_24021 ) ) ( not ( = ?auto_24017 ?auto_24035 ) ) ( not ( = ?auto_24015 ?auto_24028 ) ) ( not ( = ?auto_24015 ?auto_24024 ) ) ( not ( = ?auto_24015 ?auto_24018 ) ) ( not ( = ?auto_24015 ?auto_24029 ) ) ( not ( = ?auto_24015 ?auto_24030 ) ) ( not ( = ?auto_24015 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24005 ) ) ( not ( = ?auto_23997 ?auto_24022 ) ) ( not ( = ?auto_23998 ?auto_24005 ) ) ( not ( = ?auto_23998 ?auto_24022 ) ) ( not ( = ?auto_23999 ?auto_24005 ) ) ( not ( = ?auto_23999 ?auto_24022 ) ) ( not ( = ?auto_24000 ?auto_24005 ) ) ( not ( = ?auto_24000 ?auto_24022 ) ) ( not ( = ?auto_24001 ?auto_24005 ) ) ( not ( = ?auto_24001 ?auto_24022 ) ) ( not ( = ?auto_24002 ?auto_24005 ) ) ( not ( = ?auto_24002 ?auto_24022 ) ) ( not ( = ?auto_24003 ?auto_24005 ) ) ( not ( = ?auto_24003 ?auto_24022 ) ) ( not ( = ?auto_24005 ?auto_24015 ) ) ( not ( = ?auto_24005 ?auto_24028 ) ) ( not ( = ?auto_24005 ?auto_24024 ) ) ( not ( = ?auto_24005 ?auto_24018 ) ) ( not ( = ?auto_24005 ?auto_24029 ) ) ( not ( = ?auto_24005 ?auto_24030 ) ) ( not ( = ?auto_24005 ?auto_24014 ) ) ( not ( = ?auto_24022 ?auto_24015 ) ) ( not ( = ?auto_24022 ?auto_24028 ) ) ( not ( = ?auto_24022 ?auto_24024 ) ) ( not ( = ?auto_24022 ?auto_24018 ) ) ( not ( = ?auto_24022 ?auto_24029 ) ) ( not ( = ?auto_24022 ?auto_24030 ) ) ( not ( = ?auto_24022 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24006 ) ) ( not ( = ?auto_23997 ?auto_24019 ) ) ( not ( = ?auto_23998 ?auto_24006 ) ) ( not ( = ?auto_23998 ?auto_24019 ) ) ( not ( = ?auto_23999 ?auto_24006 ) ) ( not ( = ?auto_23999 ?auto_24019 ) ) ( not ( = ?auto_24000 ?auto_24006 ) ) ( not ( = ?auto_24000 ?auto_24019 ) ) ( not ( = ?auto_24001 ?auto_24006 ) ) ( not ( = ?auto_24001 ?auto_24019 ) ) ( not ( = ?auto_24002 ?auto_24006 ) ) ( not ( = ?auto_24002 ?auto_24019 ) ) ( not ( = ?auto_24003 ?auto_24006 ) ) ( not ( = ?auto_24003 ?auto_24019 ) ) ( not ( = ?auto_24004 ?auto_24006 ) ) ( not ( = ?auto_24004 ?auto_24019 ) ) ( not ( = ?auto_24006 ?auto_24022 ) ) ( not ( = ?auto_24006 ?auto_24015 ) ) ( not ( = ?auto_24006 ?auto_24028 ) ) ( not ( = ?auto_24006 ?auto_24024 ) ) ( not ( = ?auto_24006 ?auto_24018 ) ) ( not ( = ?auto_24006 ?auto_24029 ) ) ( not ( = ?auto_24006 ?auto_24030 ) ) ( not ( = ?auto_24006 ?auto_24014 ) ) ( not ( = ?auto_24025 ?auto_24031 ) ) ( not ( = ?auto_24025 ?auto_24020 ) ) ( not ( = ?auto_24025 ?auto_24033 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( not ( = ?auto_24025 ?auto_24036 ) ) ( not ( = ?auto_24025 ?auto_24032 ) ) ( not ( = ?auto_24025 ?auto_24037 ) ) ( not ( = ?auto_24034 ?auto_24017 ) ) ( not ( = ?auto_24034 ?auto_24016 ) ) ( not ( = ?auto_24034 ?auto_24038 ) ) ( not ( = ?auto_24034 ?auto_24023 ) ) ( not ( = ?auto_24034 ?auto_24026 ) ) ( not ( = ?auto_24034 ?auto_24021 ) ) ( not ( = ?auto_24034 ?auto_24035 ) ) ( not ( = ?auto_24019 ?auto_24022 ) ) ( not ( = ?auto_24019 ?auto_24015 ) ) ( not ( = ?auto_24019 ?auto_24028 ) ) ( not ( = ?auto_24019 ?auto_24024 ) ) ( not ( = ?auto_24019 ?auto_24018 ) ) ( not ( = ?auto_24019 ?auto_24029 ) ) ( not ( = ?auto_24019 ?auto_24030 ) ) ( not ( = ?auto_24019 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24007 ) ) ( not ( = ?auto_23997 ?auto_24013 ) ) ( not ( = ?auto_23998 ?auto_24007 ) ) ( not ( = ?auto_23998 ?auto_24013 ) ) ( not ( = ?auto_23999 ?auto_24007 ) ) ( not ( = ?auto_23999 ?auto_24013 ) ) ( not ( = ?auto_24000 ?auto_24007 ) ) ( not ( = ?auto_24000 ?auto_24013 ) ) ( not ( = ?auto_24001 ?auto_24007 ) ) ( not ( = ?auto_24001 ?auto_24013 ) ) ( not ( = ?auto_24002 ?auto_24007 ) ) ( not ( = ?auto_24002 ?auto_24013 ) ) ( not ( = ?auto_24003 ?auto_24007 ) ) ( not ( = ?auto_24003 ?auto_24013 ) ) ( not ( = ?auto_24004 ?auto_24007 ) ) ( not ( = ?auto_24004 ?auto_24013 ) ) ( not ( = ?auto_24005 ?auto_24007 ) ) ( not ( = ?auto_24005 ?auto_24013 ) ) ( not ( = ?auto_24007 ?auto_24019 ) ) ( not ( = ?auto_24007 ?auto_24022 ) ) ( not ( = ?auto_24007 ?auto_24015 ) ) ( not ( = ?auto_24007 ?auto_24028 ) ) ( not ( = ?auto_24007 ?auto_24024 ) ) ( not ( = ?auto_24007 ?auto_24018 ) ) ( not ( = ?auto_24007 ?auto_24029 ) ) ( not ( = ?auto_24007 ?auto_24030 ) ) ( not ( = ?auto_24007 ?auto_24014 ) ) ( not ( = ?auto_24010 ?auto_24025 ) ) ( not ( = ?auto_24010 ?auto_24031 ) ) ( not ( = ?auto_24010 ?auto_24020 ) ) ( not ( = ?auto_24010 ?auto_24033 ) ) ( not ( = ?auto_24010 ?auto_24027 ) ) ( not ( = ?auto_24010 ?auto_24036 ) ) ( not ( = ?auto_24010 ?auto_24032 ) ) ( not ( = ?auto_24010 ?auto_24037 ) ) ( not ( = ?auto_24008 ?auto_24034 ) ) ( not ( = ?auto_24008 ?auto_24017 ) ) ( not ( = ?auto_24008 ?auto_24016 ) ) ( not ( = ?auto_24008 ?auto_24038 ) ) ( not ( = ?auto_24008 ?auto_24023 ) ) ( not ( = ?auto_24008 ?auto_24026 ) ) ( not ( = ?auto_24008 ?auto_24021 ) ) ( not ( = ?auto_24008 ?auto_24035 ) ) ( not ( = ?auto_24013 ?auto_24019 ) ) ( not ( = ?auto_24013 ?auto_24022 ) ) ( not ( = ?auto_24013 ?auto_24015 ) ) ( not ( = ?auto_24013 ?auto_24028 ) ) ( not ( = ?auto_24013 ?auto_24024 ) ) ( not ( = ?auto_24013 ?auto_24018 ) ) ( not ( = ?auto_24013 ?auto_24029 ) ) ( not ( = ?auto_24013 ?auto_24030 ) ) ( not ( = ?auto_24013 ?auto_24014 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23997 ?auto_23998 ?auto_23999 ?auto_24000 ?auto_24001 ?auto_24002 ?auto_24003 ?auto_24004 ?auto_24005 ?auto_24006 )
      ( MAKE-1CRATE ?auto_24006 ?auto_24007 )
      ( MAKE-10CRATE-VERIFY ?auto_23997 ?auto_23998 ?auto_23999 ?auto_24000 ?auto_24001 ?auto_24002 ?auto_24003 ?auto_24004 ?auto_24005 ?auto_24006 ?auto_24007 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24061 - SURFACE
      ?auto_24062 - SURFACE
      ?auto_24063 - SURFACE
      ?auto_24064 - SURFACE
      ?auto_24065 - SURFACE
      ?auto_24066 - SURFACE
      ?auto_24067 - SURFACE
      ?auto_24068 - SURFACE
      ?auto_24069 - SURFACE
      ?auto_24070 - SURFACE
      ?auto_24071 - SURFACE
      ?auto_24072 - SURFACE
    )
    :vars
    (
      ?auto_24076 - HOIST
      ?auto_24078 - PLACE
      ?auto_24077 - PLACE
      ?auto_24075 - HOIST
      ?auto_24074 - SURFACE
      ?auto_24100 - PLACE
      ?auto_24090 - HOIST
      ?auto_24101 - SURFACE
      ?auto_24082 - PLACE
      ?auto_24087 - HOIST
      ?auto_24105 - SURFACE
      ?auto_24094 - PLACE
      ?auto_24086 - HOIST
      ?auto_24103 - SURFACE
      ?auto_24097 - SURFACE
      ?auto_24093 - PLACE
      ?auto_24080 - HOIST
      ?auto_24099 - SURFACE
      ?auto_24089 - PLACE
      ?auto_24098 - HOIST
      ?auto_24092 - SURFACE
      ?auto_24079 - PLACE
      ?auto_24083 - HOIST
      ?auto_24095 - SURFACE
      ?auto_24102 - PLACE
      ?auto_24091 - HOIST
      ?auto_24096 - SURFACE
      ?auto_24106 - PLACE
      ?auto_24088 - HOIST
      ?auto_24081 - SURFACE
      ?auto_24084 - PLACE
      ?auto_24104 - HOIST
      ?auto_24085 - SURFACE
      ?auto_24073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24076 ?auto_24078 ) ( IS-CRATE ?auto_24072 ) ( not ( = ?auto_24077 ?auto_24078 ) ) ( HOIST-AT ?auto_24075 ?auto_24077 ) ( AVAILABLE ?auto_24075 ) ( SURFACE-AT ?auto_24072 ?auto_24077 ) ( ON ?auto_24072 ?auto_24074 ) ( CLEAR ?auto_24072 ) ( not ( = ?auto_24071 ?auto_24072 ) ) ( not ( = ?auto_24071 ?auto_24074 ) ) ( not ( = ?auto_24072 ?auto_24074 ) ) ( not ( = ?auto_24076 ?auto_24075 ) ) ( IS-CRATE ?auto_24071 ) ( not ( = ?auto_24100 ?auto_24078 ) ) ( HOIST-AT ?auto_24090 ?auto_24100 ) ( AVAILABLE ?auto_24090 ) ( SURFACE-AT ?auto_24071 ?auto_24100 ) ( ON ?auto_24071 ?auto_24101 ) ( CLEAR ?auto_24071 ) ( not ( = ?auto_24070 ?auto_24071 ) ) ( not ( = ?auto_24070 ?auto_24101 ) ) ( not ( = ?auto_24071 ?auto_24101 ) ) ( not ( = ?auto_24076 ?auto_24090 ) ) ( IS-CRATE ?auto_24070 ) ( not ( = ?auto_24082 ?auto_24078 ) ) ( HOIST-AT ?auto_24087 ?auto_24082 ) ( AVAILABLE ?auto_24087 ) ( SURFACE-AT ?auto_24070 ?auto_24082 ) ( ON ?auto_24070 ?auto_24105 ) ( CLEAR ?auto_24070 ) ( not ( = ?auto_24069 ?auto_24070 ) ) ( not ( = ?auto_24069 ?auto_24105 ) ) ( not ( = ?auto_24070 ?auto_24105 ) ) ( not ( = ?auto_24076 ?auto_24087 ) ) ( IS-CRATE ?auto_24069 ) ( not ( = ?auto_24094 ?auto_24078 ) ) ( HOIST-AT ?auto_24086 ?auto_24094 ) ( SURFACE-AT ?auto_24069 ?auto_24094 ) ( ON ?auto_24069 ?auto_24103 ) ( CLEAR ?auto_24069 ) ( not ( = ?auto_24068 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24103 ) ) ( not ( = ?auto_24069 ?auto_24103 ) ) ( not ( = ?auto_24076 ?auto_24086 ) ) ( IS-CRATE ?auto_24068 ) ( AVAILABLE ?auto_24086 ) ( SURFACE-AT ?auto_24068 ?auto_24094 ) ( ON ?auto_24068 ?auto_24097 ) ( CLEAR ?auto_24068 ) ( not ( = ?auto_24067 ?auto_24068 ) ) ( not ( = ?auto_24067 ?auto_24097 ) ) ( not ( = ?auto_24068 ?auto_24097 ) ) ( IS-CRATE ?auto_24067 ) ( not ( = ?auto_24093 ?auto_24078 ) ) ( HOIST-AT ?auto_24080 ?auto_24093 ) ( AVAILABLE ?auto_24080 ) ( SURFACE-AT ?auto_24067 ?auto_24093 ) ( ON ?auto_24067 ?auto_24099 ) ( CLEAR ?auto_24067 ) ( not ( = ?auto_24066 ?auto_24067 ) ) ( not ( = ?auto_24066 ?auto_24099 ) ) ( not ( = ?auto_24067 ?auto_24099 ) ) ( not ( = ?auto_24076 ?auto_24080 ) ) ( IS-CRATE ?auto_24066 ) ( not ( = ?auto_24089 ?auto_24078 ) ) ( HOIST-AT ?auto_24098 ?auto_24089 ) ( AVAILABLE ?auto_24098 ) ( SURFACE-AT ?auto_24066 ?auto_24089 ) ( ON ?auto_24066 ?auto_24092 ) ( CLEAR ?auto_24066 ) ( not ( = ?auto_24065 ?auto_24066 ) ) ( not ( = ?auto_24065 ?auto_24092 ) ) ( not ( = ?auto_24066 ?auto_24092 ) ) ( not ( = ?auto_24076 ?auto_24098 ) ) ( IS-CRATE ?auto_24065 ) ( not ( = ?auto_24079 ?auto_24078 ) ) ( HOIST-AT ?auto_24083 ?auto_24079 ) ( AVAILABLE ?auto_24083 ) ( SURFACE-AT ?auto_24065 ?auto_24079 ) ( ON ?auto_24065 ?auto_24095 ) ( CLEAR ?auto_24065 ) ( not ( = ?auto_24064 ?auto_24065 ) ) ( not ( = ?auto_24064 ?auto_24095 ) ) ( not ( = ?auto_24065 ?auto_24095 ) ) ( not ( = ?auto_24076 ?auto_24083 ) ) ( IS-CRATE ?auto_24064 ) ( not ( = ?auto_24102 ?auto_24078 ) ) ( HOIST-AT ?auto_24091 ?auto_24102 ) ( AVAILABLE ?auto_24091 ) ( SURFACE-AT ?auto_24064 ?auto_24102 ) ( ON ?auto_24064 ?auto_24096 ) ( CLEAR ?auto_24064 ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24096 ) ) ( not ( = ?auto_24064 ?auto_24096 ) ) ( not ( = ?auto_24076 ?auto_24091 ) ) ( IS-CRATE ?auto_24063 ) ( not ( = ?auto_24106 ?auto_24078 ) ) ( HOIST-AT ?auto_24088 ?auto_24106 ) ( AVAILABLE ?auto_24088 ) ( SURFACE-AT ?auto_24063 ?auto_24106 ) ( ON ?auto_24063 ?auto_24081 ) ( CLEAR ?auto_24063 ) ( not ( = ?auto_24062 ?auto_24063 ) ) ( not ( = ?auto_24062 ?auto_24081 ) ) ( not ( = ?auto_24063 ?auto_24081 ) ) ( not ( = ?auto_24076 ?auto_24088 ) ) ( SURFACE-AT ?auto_24061 ?auto_24078 ) ( CLEAR ?auto_24061 ) ( IS-CRATE ?auto_24062 ) ( AVAILABLE ?auto_24076 ) ( not ( = ?auto_24084 ?auto_24078 ) ) ( HOIST-AT ?auto_24104 ?auto_24084 ) ( AVAILABLE ?auto_24104 ) ( SURFACE-AT ?auto_24062 ?auto_24084 ) ( ON ?auto_24062 ?auto_24085 ) ( CLEAR ?auto_24062 ) ( TRUCK-AT ?auto_24073 ?auto_24078 ) ( not ( = ?auto_24061 ?auto_24062 ) ) ( not ( = ?auto_24061 ?auto_24085 ) ) ( not ( = ?auto_24062 ?auto_24085 ) ) ( not ( = ?auto_24076 ?auto_24104 ) ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( not ( = ?auto_24061 ?auto_24081 ) ) ( not ( = ?auto_24063 ?auto_24085 ) ) ( not ( = ?auto_24106 ?auto_24084 ) ) ( not ( = ?auto_24088 ?auto_24104 ) ) ( not ( = ?auto_24081 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24064 ) ) ( not ( = ?auto_24061 ?auto_24096 ) ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24096 ) ) ( not ( = ?auto_24064 ?auto_24081 ) ) ( not ( = ?auto_24064 ?auto_24085 ) ) ( not ( = ?auto_24102 ?auto_24106 ) ) ( not ( = ?auto_24102 ?auto_24084 ) ) ( not ( = ?auto_24091 ?auto_24088 ) ) ( not ( = ?auto_24091 ?auto_24104 ) ) ( not ( = ?auto_24096 ?auto_24081 ) ) ( not ( = ?auto_24096 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24065 ) ) ( not ( = ?auto_24061 ?auto_24095 ) ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( not ( = ?auto_24062 ?auto_24095 ) ) ( not ( = ?auto_24063 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24095 ) ) ( not ( = ?auto_24065 ?auto_24096 ) ) ( not ( = ?auto_24065 ?auto_24081 ) ) ( not ( = ?auto_24065 ?auto_24085 ) ) ( not ( = ?auto_24079 ?auto_24102 ) ) ( not ( = ?auto_24079 ?auto_24106 ) ) ( not ( = ?auto_24079 ?auto_24084 ) ) ( not ( = ?auto_24083 ?auto_24091 ) ) ( not ( = ?auto_24083 ?auto_24088 ) ) ( not ( = ?auto_24083 ?auto_24104 ) ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24081 ) ) ( not ( = ?auto_24095 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24066 ) ) ( not ( = ?auto_24061 ?auto_24092 ) ) ( not ( = ?auto_24062 ?auto_24066 ) ) ( not ( = ?auto_24062 ?auto_24092 ) ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( not ( = ?auto_24063 ?auto_24092 ) ) ( not ( = ?auto_24064 ?auto_24066 ) ) ( not ( = ?auto_24064 ?auto_24092 ) ) ( not ( = ?auto_24066 ?auto_24095 ) ) ( not ( = ?auto_24066 ?auto_24096 ) ) ( not ( = ?auto_24066 ?auto_24081 ) ) ( not ( = ?auto_24066 ?auto_24085 ) ) ( not ( = ?auto_24089 ?auto_24079 ) ) ( not ( = ?auto_24089 ?auto_24102 ) ) ( not ( = ?auto_24089 ?auto_24106 ) ) ( not ( = ?auto_24089 ?auto_24084 ) ) ( not ( = ?auto_24098 ?auto_24083 ) ) ( not ( = ?auto_24098 ?auto_24091 ) ) ( not ( = ?auto_24098 ?auto_24088 ) ) ( not ( = ?auto_24098 ?auto_24104 ) ) ( not ( = ?auto_24092 ?auto_24095 ) ) ( not ( = ?auto_24092 ?auto_24096 ) ) ( not ( = ?auto_24092 ?auto_24081 ) ) ( not ( = ?auto_24092 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24067 ) ) ( not ( = ?auto_24061 ?auto_24099 ) ) ( not ( = ?auto_24062 ?auto_24067 ) ) ( not ( = ?auto_24062 ?auto_24099 ) ) ( not ( = ?auto_24063 ?auto_24067 ) ) ( not ( = ?auto_24063 ?auto_24099 ) ) ( not ( = ?auto_24064 ?auto_24067 ) ) ( not ( = ?auto_24064 ?auto_24099 ) ) ( not ( = ?auto_24065 ?auto_24067 ) ) ( not ( = ?auto_24065 ?auto_24099 ) ) ( not ( = ?auto_24067 ?auto_24092 ) ) ( not ( = ?auto_24067 ?auto_24095 ) ) ( not ( = ?auto_24067 ?auto_24096 ) ) ( not ( = ?auto_24067 ?auto_24081 ) ) ( not ( = ?auto_24067 ?auto_24085 ) ) ( not ( = ?auto_24093 ?auto_24089 ) ) ( not ( = ?auto_24093 ?auto_24079 ) ) ( not ( = ?auto_24093 ?auto_24102 ) ) ( not ( = ?auto_24093 ?auto_24106 ) ) ( not ( = ?auto_24093 ?auto_24084 ) ) ( not ( = ?auto_24080 ?auto_24098 ) ) ( not ( = ?auto_24080 ?auto_24083 ) ) ( not ( = ?auto_24080 ?auto_24091 ) ) ( not ( = ?auto_24080 ?auto_24088 ) ) ( not ( = ?auto_24080 ?auto_24104 ) ) ( not ( = ?auto_24099 ?auto_24092 ) ) ( not ( = ?auto_24099 ?auto_24095 ) ) ( not ( = ?auto_24099 ?auto_24096 ) ) ( not ( = ?auto_24099 ?auto_24081 ) ) ( not ( = ?auto_24099 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24068 ) ) ( not ( = ?auto_24061 ?auto_24097 ) ) ( not ( = ?auto_24062 ?auto_24068 ) ) ( not ( = ?auto_24062 ?auto_24097 ) ) ( not ( = ?auto_24063 ?auto_24068 ) ) ( not ( = ?auto_24063 ?auto_24097 ) ) ( not ( = ?auto_24064 ?auto_24068 ) ) ( not ( = ?auto_24064 ?auto_24097 ) ) ( not ( = ?auto_24065 ?auto_24068 ) ) ( not ( = ?auto_24065 ?auto_24097 ) ) ( not ( = ?auto_24066 ?auto_24068 ) ) ( not ( = ?auto_24066 ?auto_24097 ) ) ( not ( = ?auto_24068 ?auto_24099 ) ) ( not ( = ?auto_24068 ?auto_24092 ) ) ( not ( = ?auto_24068 ?auto_24095 ) ) ( not ( = ?auto_24068 ?auto_24096 ) ) ( not ( = ?auto_24068 ?auto_24081 ) ) ( not ( = ?auto_24068 ?auto_24085 ) ) ( not ( = ?auto_24094 ?auto_24093 ) ) ( not ( = ?auto_24094 ?auto_24089 ) ) ( not ( = ?auto_24094 ?auto_24079 ) ) ( not ( = ?auto_24094 ?auto_24102 ) ) ( not ( = ?auto_24094 ?auto_24106 ) ) ( not ( = ?auto_24094 ?auto_24084 ) ) ( not ( = ?auto_24086 ?auto_24080 ) ) ( not ( = ?auto_24086 ?auto_24098 ) ) ( not ( = ?auto_24086 ?auto_24083 ) ) ( not ( = ?auto_24086 ?auto_24091 ) ) ( not ( = ?auto_24086 ?auto_24088 ) ) ( not ( = ?auto_24086 ?auto_24104 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( not ( = ?auto_24097 ?auto_24092 ) ) ( not ( = ?auto_24097 ?auto_24095 ) ) ( not ( = ?auto_24097 ?auto_24096 ) ) ( not ( = ?auto_24097 ?auto_24081 ) ) ( not ( = ?auto_24097 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24069 ) ) ( not ( = ?auto_24061 ?auto_24103 ) ) ( not ( = ?auto_24062 ?auto_24069 ) ) ( not ( = ?auto_24062 ?auto_24103 ) ) ( not ( = ?auto_24063 ?auto_24069 ) ) ( not ( = ?auto_24063 ?auto_24103 ) ) ( not ( = ?auto_24064 ?auto_24069 ) ) ( not ( = ?auto_24064 ?auto_24103 ) ) ( not ( = ?auto_24065 ?auto_24069 ) ) ( not ( = ?auto_24065 ?auto_24103 ) ) ( not ( = ?auto_24066 ?auto_24069 ) ) ( not ( = ?auto_24066 ?auto_24103 ) ) ( not ( = ?auto_24067 ?auto_24069 ) ) ( not ( = ?auto_24067 ?auto_24103 ) ) ( not ( = ?auto_24069 ?auto_24097 ) ) ( not ( = ?auto_24069 ?auto_24099 ) ) ( not ( = ?auto_24069 ?auto_24092 ) ) ( not ( = ?auto_24069 ?auto_24095 ) ) ( not ( = ?auto_24069 ?auto_24096 ) ) ( not ( = ?auto_24069 ?auto_24081 ) ) ( not ( = ?auto_24069 ?auto_24085 ) ) ( not ( = ?auto_24103 ?auto_24097 ) ) ( not ( = ?auto_24103 ?auto_24099 ) ) ( not ( = ?auto_24103 ?auto_24092 ) ) ( not ( = ?auto_24103 ?auto_24095 ) ) ( not ( = ?auto_24103 ?auto_24096 ) ) ( not ( = ?auto_24103 ?auto_24081 ) ) ( not ( = ?auto_24103 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24070 ) ) ( not ( = ?auto_24061 ?auto_24105 ) ) ( not ( = ?auto_24062 ?auto_24070 ) ) ( not ( = ?auto_24062 ?auto_24105 ) ) ( not ( = ?auto_24063 ?auto_24070 ) ) ( not ( = ?auto_24063 ?auto_24105 ) ) ( not ( = ?auto_24064 ?auto_24070 ) ) ( not ( = ?auto_24064 ?auto_24105 ) ) ( not ( = ?auto_24065 ?auto_24070 ) ) ( not ( = ?auto_24065 ?auto_24105 ) ) ( not ( = ?auto_24066 ?auto_24070 ) ) ( not ( = ?auto_24066 ?auto_24105 ) ) ( not ( = ?auto_24067 ?auto_24070 ) ) ( not ( = ?auto_24067 ?auto_24105 ) ) ( not ( = ?auto_24068 ?auto_24070 ) ) ( not ( = ?auto_24068 ?auto_24105 ) ) ( not ( = ?auto_24070 ?auto_24103 ) ) ( not ( = ?auto_24070 ?auto_24097 ) ) ( not ( = ?auto_24070 ?auto_24099 ) ) ( not ( = ?auto_24070 ?auto_24092 ) ) ( not ( = ?auto_24070 ?auto_24095 ) ) ( not ( = ?auto_24070 ?auto_24096 ) ) ( not ( = ?auto_24070 ?auto_24081 ) ) ( not ( = ?auto_24070 ?auto_24085 ) ) ( not ( = ?auto_24082 ?auto_24094 ) ) ( not ( = ?auto_24082 ?auto_24093 ) ) ( not ( = ?auto_24082 ?auto_24089 ) ) ( not ( = ?auto_24082 ?auto_24079 ) ) ( not ( = ?auto_24082 ?auto_24102 ) ) ( not ( = ?auto_24082 ?auto_24106 ) ) ( not ( = ?auto_24082 ?auto_24084 ) ) ( not ( = ?auto_24087 ?auto_24086 ) ) ( not ( = ?auto_24087 ?auto_24080 ) ) ( not ( = ?auto_24087 ?auto_24098 ) ) ( not ( = ?auto_24087 ?auto_24083 ) ) ( not ( = ?auto_24087 ?auto_24091 ) ) ( not ( = ?auto_24087 ?auto_24088 ) ) ( not ( = ?auto_24087 ?auto_24104 ) ) ( not ( = ?auto_24105 ?auto_24103 ) ) ( not ( = ?auto_24105 ?auto_24097 ) ) ( not ( = ?auto_24105 ?auto_24099 ) ) ( not ( = ?auto_24105 ?auto_24092 ) ) ( not ( = ?auto_24105 ?auto_24095 ) ) ( not ( = ?auto_24105 ?auto_24096 ) ) ( not ( = ?auto_24105 ?auto_24081 ) ) ( not ( = ?auto_24105 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24071 ) ) ( not ( = ?auto_24061 ?auto_24101 ) ) ( not ( = ?auto_24062 ?auto_24071 ) ) ( not ( = ?auto_24062 ?auto_24101 ) ) ( not ( = ?auto_24063 ?auto_24071 ) ) ( not ( = ?auto_24063 ?auto_24101 ) ) ( not ( = ?auto_24064 ?auto_24071 ) ) ( not ( = ?auto_24064 ?auto_24101 ) ) ( not ( = ?auto_24065 ?auto_24071 ) ) ( not ( = ?auto_24065 ?auto_24101 ) ) ( not ( = ?auto_24066 ?auto_24071 ) ) ( not ( = ?auto_24066 ?auto_24101 ) ) ( not ( = ?auto_24067 ?auto_24071 ) ) ( not ( = ?auto_24067 ?auto_24101 ) ) ( not ( = ?auto_24068 ?auto_24071 ) ) ( not ( = ?auto_24068 ?auto_24101 ) ) ( not ( = ?auto_24069 ?auto_24071 ) ) ( not ( = ?auto_24069 ?auto_24101 ) ) ( not ( = ?auto_24071 ?auto_24105 ) ) ( not ( = ?auto_24071 ?auto_24103 ) ) ( not ( = ?auto_24071 ?auto_24097 ) ) ( not ( = ?auto_24071 ?auto_24099 ) ) ( not ( = ?auto_24071 ?auto_24092 ) ) ( not ( = ?auto_24071 ?auto_24095 ) ) ( not ( = ?auto_24071 ?auto_24096 ) ) ( not ( = ?auto_24071 ?auto_24081 ) ) ( not ( = ?auto_24071 ?auto_24085 ) ) ( not ( = ?auto_24100 ?auto_24082 ) ) ( not ( = ?auto_24100 ?auto_24094 ) ) ( not ( = ?auto_24100 ?auto_24093 ) ) ( not ( = ?auto_24100 ?auto_24089 ) ) ( not ( = ?auto_24100 ?auto_24079 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) ( not ( = ?auto_24100 ?auto_24106 ) ) ( not ( = ?auto_24100 ?auto_24084 ) ) ( not ( = ?auto_24090 ?auto_24087 ) ) ( not ( = ?auto_24090 ?auto_24086 ) ) ( not ( = ?auto_24090 ?auto_24080 ) ) ( not ( = ?auto_24090 ?auto_24098 ) ) ( not ( = ?auto_24090 ?auto_24083 ) ) ( not ( = ?auto_24090 ?auto_24091 ) ) ( not ( = ?auto_24090 ?auto_24088 ) ) ( not ( = ?auto_24090 ?auto_24104 ) ) ( not ( = ?auto_24101 ?auto_24105 ) ) ( not ( = ?auto_24101 ?auto_24103 ) ) ( not ( = ?auto_24101 ?auto_24097 ) ) ( not ( = ?auto_24101 ?auto_24099 ) ) ( not ( = ?auto_24101 ?auto_24092 ) ) ( not ( = ?auto_24101 ?auto_24095 ) ) ( not ( = ?auto_24101 ?auto_24096 ) ) ( not ( = ?auto_24101 ?auto_24081 ) ) ( not ( = ?auto_24101 ?auto_24085 ) ) ( not ( = ?auto_24061 ?auto_24072 ) ) ( not ( = ?auto_24061 ?auto_24074 ) ) ( not ( = ?auto_24062 ?auto_24072 ) ) ( not ( = ?auto_24062 ?auto_24074 ) ) ( not ( = ?auto_24063 ?auto_24072 ) ) ( not ( = ?auto_24063 ?auto_24074 ) ) ( not ( = ?auto_24064 ?auto_24072 ) ) ( not ( = ?auto_24064 ?auto_24074 ) ) ( not ( = ?auto_24065 ?auto_24072 ) ) ( not ( = ?auto_24065 ?auto_24074 ) ) ( not ( = ?auto_24066 ?auto_24072 ) ) ( not ( = ?auto_24066 ?auto_24074 ) ) ( not ( = ?auto_24067 ?auto_24072 ) ) ( not ( = ?auto_24067 ?auto_24074 ) ) ( not ( = ?auto_24068 ?auto_24072 ) ) ( not ( = ?auto_24068 ?auto_24074 ) ) ( not ( = ?auto_24069 ?auto_24072 ) ) ( not ( = ?auto_24069 ?auto_24074 ) ) ( not ( = ?auto_24070 ?auto_24072 ) ) ( not ( = ?auto_24070 ?auto_24074 ) ) ( not ( = ?auto_24072 ?auto_24101 ) ) ( not ( = ?auto_24072 ?auto_24105 ) ) ( not ( = ?auto_24072 ?auto_24103 ) ) ( not ( = ?auto_24072 ?auto_24097 ) ) ( not ( = ?auto_24072 ?auto_24099 ) ) ( not ( = ?auto_24072 ?auto_24092 ) ) ( not ( = ?auto_24072 ?auto_24095 ) ) ( not ( = ?auto_24072 ?auto_24096 ) ) ( not ( = ?auto_24072 ?auto_24081 ) ) ( not ( = ?auto_24072 ?auto_24085 ) ) ( not ( = ?auto_24077 ?auto_24100 ) ) ( not ( = ?auto_24077 ?auto_24082 ) ) ( not ( = ?auto_24077 ?auto_24094 ) ) ( not ( = ?auto_24077 ?auto_24093 ) ) ( not ( = ?auto_24077 ?auto_24089 ) ) ( not ( = ?auto_24077 ?auto_24079 ) ) ( not ( = ?auto_24077 ?auto_24102 ) ) ( not ( = ?auto_24077 ?auto_24106 ) ) ( not ( = ?auto_24077 ?auto_24084 ) ) ( not ( = ?auto_24075 ?auto_24090 ) ) ( not ( = ?auto_24075 ?auto_24087 ) ) ( not ( = ?auto_24075 ?auto_24086 ) ) ( not ( = ?auto_24075 ?auto_24080 ) ) ( not ( = ?auto_24075 ?auto_24098 ) ) ( not ( = ?auto_24075 ?auto_24083 ) ) ( not ( = ?auto_24075 ?auto_24091 ) ) ( not ( = ?auto_24075 ?auto_24088 ) ) ( not ( = ?auto_24075 ?auto_24104 ) ) ( not ( = ?auto_24074 ?auto_24101 ) ) ( not ( = ?auto_24074 ?auto_24105 ) ) ( not ( = ?auto_24074 ?auto_24103 ) ) ( not ( = ?auto_24074 ?auto_24097 ) ) ( not ( = ?auto_24074 ?auto_24099 ) ) ( not ( = ?auto_24074 ?auto_24092 ) ) ( not ( = ?auto_24074 ?auto_24095 ) ) ( not ( = ?auto_24074 ?auto_24096 ) ) ( not ( = ?auto_24074 ?auto_24081 ) ) ( not ( = ?auto_24074 ?auto_24085 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24061 ?auto_24062 ?auto_24063 ?auto_24064 ?auto_24065 ?auto_24066 ?auto_24067 ?auto_24068 ?auto_24069 ?auto_24070 ?auto_24071 )
      ( MAKE-1CRATE ?auto_24071 ?auto_24072 )
      ( MAKE-11CRATE-VERIFY ?auto_24061 ?auto_24062 ?auto_24063 ?auto_24064 ?auto_24065 ?auto_24066 ?auto_24067 ?auto_24068 ?auto_24069 ?auto_24070 ?auto_24071 ?auto_24072 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_24130 - SURFACE
      ?auto_24131 - SURFACE
      ?auto_24132 - SURFACE
      ?auto_24133 - SURFACE
      ?auto_24134 - SURFACE
      ?auto_24135 - SURFACE
      ?auto_24136 - SURFACE
      ?auto_24137 - SURFACE
      ?auto_24138 - SURFACE
      ?auto_24139 - SURFACE
      ?auto_24140 - SURFACE
      ?auto_24141 - SURFACE
      ?auto_24142 - SURFACE
    )
    :vars
    (
      ?auto_24145 - HOIST
      ?auto_24147 - PLACE
      ?auto_24148 - PLACE
      ?auto_24146 - HOIST
      ?auto_24143 - SURFACE
      ?auto_24156 - PLACE
      ?auto_24172 - HOIST
      ?auto_24179 - SURFACE
      ?auto_24151 - PLACE
      ?auto_24150 - HOIST
      ?auto_24169 - SURFACE
      ?auto_24177 - PLACE
      ?auto_24149 - HOIST
      ?auto_24166 - SURFACE
      ?auto_24161 - PLACE
      ?auto_24163 - HOIST
      ?auto_24152 - SURFACE
      ?auto_24162 - SURFACE
      ?auto_24168 - PLACE
      ?auto_24157 - HOIST
      ?auto_24167 - SURFACE
      ?auto_24159 - PLACE
      ?auto_24175 - HOIST
      ?auto_24173 - SURFACE
      ?auto_24178 - PLACE
      ?auto_24158 - HOIST
      ?auto_24154 - SURFACE
      ?auto_24176 - PLACE
      ?auto_24165 - HOIST
      ?auto_24155 - SURFACE
      ?auto_24170 - PLACE
      ?auto_24160 - HOIST
      ?auto_24153 - SURFACE
      ?auto_24171 - PLACE
      ?auto_24164 - HOIST
      ?auto_24174 - SURFACE
      ?auto_24144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24145 ?auto_24147 ) ( IS-CRATE ?auto_24142 ) ( not ( = ?auto_24148 ?auto_24147 ) ) ( HOIST-AT ?auto_24146 ?auto_24148 ) ( AVAILABLE ?auto_24146 ) ( SURFACE-AT ?auto_24142 ?auto_24148 ) ( ON ?auto_24142 ?auto_24143 ) ( CLEAR ?auto_24142 ) ( not ( = ?auto_24141 ?auto_24142 ) ) ( not ( = ?auto_24141 ?auto_24143 ) ) ( not ( = ?auto_24142 ?auto_24143 ) ) ( not ( = ?auto_24145 ?auto_24146 ) ) ( IS-CRATE ?auto_24141 ) ( not ( = ?auto_24156 ?auto_24147 ) ) ( HOIST-AT ?auto_24172 ?auto_24156 ) ( AVAILABLE ?auto_24172 ) ( SURFACE-AT ?auto_24141 ?auto_24156 ) ( ON ?auto_24141 ?auto_24179 ) ( CLEAR ?auto_24141 ) ( not ( = ?auto_24140 ?auto_24141 ) ) ( not ( = ?auto_24140 ?auto_24179 ) ) ( not ( = ?auto_24141 ?auto_24179 ) ) ( not ( = ?auto_24145 ?auto_24172 ) ) ( IS-CRATE ?auto_24140 ) ( not ( = ?auto_24151 ?auto_24147 ) ) ( HOIST-AT ?auto_24150 ?auto_24151 ) ( AVAILABLE ?auto_24150 ) ( SURFACE-AT ?auto_24140 ?auto_24151 ) ( ON ?auto_24140 ?auto_24169 ) ( CLEAR ?auto_24140 ) ( not ( = ?auto_24139 ?auto_24140 ) ) ( not ( = ?auto_24139 ?auto_24169 ) ) ( not ( = ?auto_24140 ?auto_24169 ) ) ( not ( = ?auto_24145 ?auto_24150 ) ) ( IS-CRATE ?auto_24139 ) ( not ( = ?auto_24177 ?auto_24147 ) ) ( HOIST-AT ?auto_24149 ?auto_24177 ) ( AVAILABLE ?auto_24149 ) ( SURFACE-AT ?auto_24139 ?auto_24177 ) ( ON ?auto_24139 ?auto_24166 ) ( CLEAR ?auto_24139 ) ( not ( = ?auto_24138 ?auto_24139 ) ) ( not ( = ?auto_24138 ?auto_24166 ) ) ( not ( = ?auto_24139 ?auto_24166 ) ) ( not ( = ?auto_24145 ?auto_24149 ) ) ( IS-CRATE ?auto_24138 ) ( not ( = ?auto_24161 ?auto_24147 ) ) ( HOIST-AT ?auto_24163 ?auto_24161 ) ( SURFACE-AT ?auto_24138 ?auto_24161 ) ( ON ?auto_24138 ?auto_24152 ) ( CLEAR ?auto_24138 ) ( not ( = ?auto_24137 ?auto_24138 ) ) ( not ( = ?auto_24137 ?auto_24152 ) ) ( not ( = ?auto_24138 ?auto_24152 ) ) ( not ( = ?auto_24145 ?auto_24163 ) ) ( IS-CRATE ?auto_24137 ) ( AVAILABLE ?auto_24163 ) ( SURFACE-AT ?auto_24137 ?auto_24161 ) ( ON ?auto_24137 ?auto_24162 ) ( CLEAR ?auto_24137 ) ( not ( = ?auto_24136 ?auto_24137 ) ) ( not ( = ?auto_24136 ?auto_24162 ) ) ( not ( = ?auto_24137 ?auto_24162 ) ) ( IS-CRATE ?auto_24136 ) ( not ( = ?auto_24168 ?auto_24147 ) ) ( HOIST-AT ?auto_24157 ?auto_24168 ) ( AVAILABLE ?auto_24157 ) ( SURFACE-AT ?auto_24136 ?auto_24168 ) ( ON ?auto_24136 ?auto_24167 ) ( CLEAR ?auto_24136 ) ( not ( = ?auto_24135 ?auto_24136 ) ) ( not ( = ?auto_24135 ?auto_24167 ) ) ( not ( = ?auto_24136 ?auto_24167 ) ) ( not ( = ?auto_24145 ?auto_24157 ) ) ( IS-CRATE ?auto_24135 ) ( not ( = ?auto_24159 ?auto_24147 ) ) ( HOIST-AT ?auto_24175 ?auto_24159 ) ( AVAILABLE ?auto_24175 ) ( SURFACE-AT ?auto_24135 ?auto_24159 ) ( ON ?auto_24135 ?auto_24173 ) ( CLEAR ?auto_24135 ) ( not ( = ?auto_24134 ?auto_24135 ) ) ( not ( = ?auto_24134 ?auto_24173 ) ) ( not ( = ?auto_24135 ?auto_24173 ) ) ( not ( = ?auto_24145 ?auto_24175 ) ) ( IS-CRATE ?auto_24134 ) ( not ( = ?auto_24178 ?auto_24147 ) ) ( HOIST-AT ?auto_24158 ?auto_24178 ) ( AVAILABLE ?auto_24158 ) ( SURFACE-AT ?auto_24134 ?auto_24178 ) ( ON ?auto_24134 ?auto_24154 ) ( CLEAR ?auto_24134 ) ( not ( = ?auto_24133 ?auto_24134 ) ) ( not ( = ?auto_24133 ?auto_24154 ) ) ( not ( = ?auto_24134 ?auto_24154 ) ) ( not ( = ?auto_24145 ?auto_24158 ) ) ( IS-CRATE ?auto_24133 ) ( not ( = ?auto_24176 ?auto_24147 ) ) ( HOIST-AT ?auto_24165 ?auto_24176 ) ( AVAILABLE ?auto_24165 ) ( SURFACE-AT ?auto_24133 ?auto_24176 ) ( ON ?auto_24133 ?auto_24155 ) ( CLEAR ?auto_24133 ) ( not ( = ?auto_24132 ?auto_24133 ) ) ( not ( = ?auto_24132 ?auto_24155 ) ) ( not ( = ?auto_24133 ?auto_24155 ) ) ( not ( = ?auto_24145 ?auto_24165 ) ) ( IS-CRATE ?auto_24132 ) ( not ( = ?auto_24170 ?auto_24147 ) ) ( HOIST-AT ?auto_24160 ?auto_24170 ) ( AVAILABLE ?auto_24160 ) ( SURFACE-AT ?auto_24132 ?auto_24170 ) ( ON ?auto_24132 ?auto_24153 ) ( CLEAR ?auto_24132 ) ( not ( = ?auto_24131 ?auto_24132 ) ) ( not ( = ?auto_24131 ?auto_24153 ) ) ( not ( = ?auto_24132 ?auto_24153 ) ) ( not ( = ?auto_24145 ?auto_24160 ) ) ( SURFACE-AT ?auto_24130 ?auto_24147 ) ( CLEAR ?auto_24130 ) ( IS-CRATE ?auto_24131 ) ( AVAILABLE ?auto_24145 ) ( not ( = ?auto_24171 ?auto_24147 ) ) ( HOIST-AT ?auto_24164 ?auto_24171 ) ( AVAILABLE ?auto_24164 ) ( SURFACE-AT ?auto_24131 ?auto_24171 ) ( ON ?auto_24131 ?auto_24174 ) ( CLEAR ?auto_24131 ) ( TRUCK-AT ?auto_24144 ?auto_24147 ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24130 ?auto_24174 ) ) ( not ( = ?auto_24131 ?auto_24174 ) ) ( not ( = ?auto_24145 ?auto_24164 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24153 ) ) ( not ( = ?auto_24132 ?auto_24174 ) ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24160 ?auto_24164 ) ) ( not ( = ?auto_24153 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24133 ) ) ( not ( = ?auto_24130 ?auto_24155 ) ) ( not ( = ?auto_24131 ?auto_24133 ) ) ( not ( = ?auto_24131 ?auto_24155 ) ) ( not ( = ?auto_24133 ?auto_24153 ) ) ( not ( = ?auto_24133 ?auto_24174 ) ) ( not ( = ?auto_24176 ?auto_24170 ) ) ( not ( = ?auto_24176 ?auto_24171 ) ) ( not ( = ?auto_24165 ?auto_24160 ) ) ( not ( = ?auto_24165 ?auto_24164 ) ) ( not ( = ?auto_24155 ?auto_24153 ) ) ( not ( = ?auto_24155 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24134 ) ) ( not ( = ?auto_24130 ?auto_24154 ) ) ( not ( = ?auto_24131 ?auto_24134 ) ) ( not ( = ?auto_24131 ?auto_24154 ) ) ( not ( = ?auto_24132 ?auto_24134 ) ) ( not ( = ?auto_24132 ?auto_24154 ) ) ( not ( = ?auto_24134 ?auto_24155 ) ) ( not ( = ?auto_24134 ?auto_24153 ) ) ( not ( = ?auto_24134 ?auto_24174 ) ) ( not ( = ?auto_24178 ?auto_24176 ) ) ( not ( = ?auto_24178 ?auto_24170 ) ) ( not ( = ?auto_24178 ?auto_24171 ) ) ( not ( = ?auto_24158 ?auto_24165 ) ) ( not ( = ?auto_24158 ?auto_24160 ) ) ( not ( = ?auto_24158 ?auto_24164 ) ) ( not ( = ?auto_24154 ?auto_24155 ) ) ( not ( = ?auto_24154 ?auto_24153 ) ) ( not ( = ?auto_24154 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24135 ) ) ( not ( = ?auto_24130 ?auto_24173 ) ) ( not ( = ?auto_24131 ?auto_24135 ) ) ( not ( = ?auto_24131 ?auto_24173 ) ) ( not ( = ?auto_24132 ?auto_24135 ) ) ( not ( = ?auto_24132 ?auto_24173 ) ) ( not ( = ?auto_24133 ?auto_24135 ) ) ( not ( = ?auto_24133 ?auto_24173 ) ) ( not ( = ?auto_24135 ?auto_24154 ) ) ( not ( = ?auto_24135 ?auto_24155 ) ) ( not ( = ?auto_24135 ?auto_24153 ) ) ( not ( = ?auto_24135 ?auto_24174 ) ) ( not ( = ?auto_24159 ?auto_24178 ) ) ( not ( = ?auto_24159 ?auto_24176 ) ) ( not ( = ?auto_24159 ?auto_24170 ) ) ( not ( = ?auto_24159 ?auto_24171 ) ) ( not ( = ?auto_24175 ?auto_24158 ) ) ( not ( = ?auto_24175 ?auto_24165 ) ) ( not ( = ?auto_24175 ?auto_24160 ) ) ( not ( = ?auto_24175 ?auto_24164 ) ) ( not ( = ?auto_24173 ?auto_24154 ) ) ( not ( = ?auto_24173 ?auto_24155 ) ) ( not ( = ?auto_24173 ?auto_24153 ) ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24136 ) ) ( not ( = ?auto_24130 ?auto_24167 ) ) ( not ( = ?auto_24131 ?auto_24136 ) ) ( not ( = ?auto_24131 ?auto_24167 ) ) ( not ( = ?auto_24132 ?auto_24136 ) ) ( not ( = ?auto_24132 ?auto_24167 ) ) ( not ( = ?auto_24133 ?auto_24136 ) ) ( not ( = ?auto_24133 ?auto_24167 ) ) ( not ( = ?auto_24134 ?auto_24136 ) ) ( not ( = ?auto_24134 ?auto_24167 ) ) ( not ( = ?auto_24136 ?auto_24173 ) ) ( not ( = ?auto_24136 ?auto_24154 ) ) ( not ( = ?auto_24136 ?auto_24155 ) ) ( not ( = ?auto_24136 ?auto_24153 ) ) ( not ( = ?auto_24136 ?auto_24174 ) ) ( not ( = ?auto_24168 ?auto_24159 ) ) ( not ( = ?auto_24168 ?auto_24178 ) ) ( not ( = ?auto_24168 ?auto_24176 ) ) ( not ( = ?auto_24168 ?auto_24170 ) ) ( not ( = ?auto_24168 ?auto_24171 ) ) ( not ( = ?auto_24157 ?auto_24175 ) ) ( not ( = ?auto_24157 ?auto_24158 ) ) ( not ( = ?auto_24157 ?auto_24165 ) ) ( not ( = ?auto_24157 ?auto_24160 ) ) ( not ( = ?auto_24157 ?auto_24164 ) ) ( not ( = ?auto_24167 ?auto_24173 ) ) ( not ( = ?auto_24167 ?auto_24154 ) ) ( not ( = ?auto_24167 ?auto_24155 ) ) ( not ( = ?auto_24167 ?auto_24153 ) ) ( not ( = ?auto_24167 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24137 ) ) ( not ( = ?auto_24130 ?auto_24162 ) ) ( not ( = ?auto_24131 ?auto_24137 ) ) ( not ( = ?auto_24131 ?auto_24162 ) ) ( not ( = ?auto_24132 ?auto_24137 ) ) ( not ( = ?auto_24132 ?auto_24162 ) ) ( not ( = ?auto_24133 ?auto_24137 ) ) ( not ( = ?auto_24133 ?auto_24162 ) ) ( not ( = ?auto_24134 ?auto_24137 ) ) ( not ( = ?auto_24134 ?auto_24162 ) ) ( not ( = ?auto_24135 ?auto_24137 ) ) ( not ( = ?auto_24135 ?auto_24162 ) ) ( not ( = ?auto_24137 ?auto_24167 ) ) ( not ( = ?auto_24137 ?auto_24173 ) ) ( not ( = ?auto_24137 ?auto_24154 ) ) ( not ( = ?auto_24137 ?auto_24155 ) ) ( not ( = ?auto_24137 ?auto_24153 ) ) ( not ( = ?auto_24137 ?auto_24174 ) ) ( not ( = ?auto_24161 ?auto_24168 ) ) ( not ( = ?auto_24161 ?auto_24159 ) ) ( not ( = ?auto_24161 ?auto_24178 ) ) ( not ( = ?auto_24161 ?auto_24176 ) ) ( not ( = ?auto_24161 ?auto_24170 ) ) ( not ( = ?auto_24161 ?auto_24171 ) ) ( not ( = ?auto_24163 ?auto_24157 ) ) ( not ( = ?auto_24163 ?auto_24175 ) ) ( not ( = ?auto_24163 ?auto_24158 ) ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( not ( = ?auto_24163 ?auto_24160 ) ) ( not ( = ?auto_24163 ?auto_24164 ) ) ( not ( = ?auto_24162 ?auto_24167 ) ) ( not ( = ?auto_24162 ?auto_24173 ) ) ( not ( = ?auto_24162 ?auto_24154 ) ) ( not ( = ?auto_24162 ?auto_24155 ) ) ( not ( = ?auto_24162 ?auto_24153 ) ) ( not ( = ?auto_24162 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24138 ) ) ( not ( = ?auto_24130 ?auto_24152 ) ) ( not ( = ?auto_24131 ?auto_24138 ) ) ( not ( = ?auto_24131 ?auto_24152 ) ) ( not ( = ?auto_24132 ?auto_24138 ) ) ( not ( = ?auto_24132 ?auto_24152 ) ) ( not ( = ?auto_24133 ?auto_24138 ) ) ( not ( = ?auto_24133 ?auto_24152 ) ) ( not ( = ?auto_24134 ?auto_24138 ) ) ( not ( = ?auto_24134 ?auto_24152 ) ) ( not ( = ?auto_24135 ?auto_24138 ) ) ( not ( = ?auto_24135 ?auto_24152 ) ) ( not ( = ?auto_24136 ?auto_24138 ) ) ( not ( = ?auto_24136 ?auto_24152 ) ) ( not ( = ?auto_24138 ?auto_24162 ) ) ( not ( = ?auto_24138 ?auto_24167 ) ) ( not ( = ?auto_24138 ?auto_24173 ) ) ( not ( = ?auto_24138 ?auto_24154 ) ) ( not ( = ?auto_24138 ?auto_24155 ) ) ( not ( = ?auto_24138 ?auto_24153 ) ) ( not ( = ?auto_24138 ?auto_24174 ) ) ( not ( = ?auto_24152 ?auto_24162 ) ) ( not ( = ?auto_24152 ?auto_24167 ) ) ( not ( = ?auto_24152 ?auto_24173 ) ) ( not ( = ?auto_24152 ?auto_24154 ) ) ( not ( = ?auto_24152 ?auto_24155 ) ) ( not ( = ?auto_24152 ?auto_24153 ) ) ( not ( = ?auto_24152 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24139 ) ) ( not ( = ?auto_24130 ?auto_24166 ) ) ( not ( = ?auto_24131 ?auto_24139 ) ) ( not ( = ?auto_24131 ?auto_24166 ) ) ( not ( = ?auto_24132 ?auto_24139 ) ) ( not ( = ?auto_24132 ?auto_24166 ) ) ( not ( = ?auto_24133 ?auto_24139 ) ) ( not ( = ?auto_24133 ?auto_24166 ) ) ( not ( = ?auto_24134 ?auto_24139 ) ) ( not ( = ?auto_24134 ?auto_24166 ) ) ( not ( = ?auto_24135 ?auto_24139 ) ) ( not ( = ?auto_24135 ?auto_24166 ) ) ( not ( = ?auto_24136 ?auto_24139 ) ) ( not ( = ?auto_24136 ?auto_24166 ) ) ( not ( = ?auto_24137 ?auto_24139 ) ) ( not ( = ?auto_24137 ?auto_24166 ) ) ( not ( = ?auto_24139 ?auto_24152 ) ) ( not ( = ?auto_24139 ?auto_24162 ) ) ( not ( = ?auto_24139 ?auto_24167 ) ) ( not ( = ?auto_24139 ?auto_24173 ) ) ( not ( = ?auto_24139 ?auto_24154 ) ) ( not ( = ?auto_24139 ?auto_24155 ) ) ( not ( = ?auto_24139 ?auto_24153 ) ) ( not ( = ?auto_24139 ?auto_24174 ) ) ( not ( = ?auto_24177 ?auto_24161 ) ) ( not ( = ?auto_24177 ?auto_24168 ) ) ( not ( = ?auto_24177 ?auto_24159 ) ) ( not ( = ?auto_24177 ?auto_24178 ) ) ( not ( = ?auto_24177 ?auto_24176 ) ) ( not ( = ?auto_24177 ?auto_24170 ) ) ( not ( = ?auto_24177 ?auto_24171 ) ) ( not ( = ?auto_24149 ?auto_24163 ) ) ( not ( = ?auto_24149 ?auto_24157 ) ) ( not ( = ?auto_24149 ?auto_24175 ) ) ( not ( = ?auto_24149 ?auto_24158 ) ) ( not ( = ?auto_24149 ?auto_24165 ) ) ( not ( = ?auto_24149 ?auto_24160 ) ) ( not ( = ?auto_24149 ?auto_24164 ) ) ( not ( = ?auto_24166 ?auto_24152 ) ) ( not ( = ?auto_24166 ?auto_24162 ) ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( not ( = ?auto_24166 ?auto_24173 ) ) ( not ( = ?auto_24166 ?auto_24154 ) ) ( not ( = ?auto_24166 ?auto_24155 ) ) ( not ( = ?auto_24166 ?auto_24153 ) ) ( not ( = ?auto_24166 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24140 ) ) ( not ( = ?auto_24130 ?auto_24169 ) ) ( not ( = ?auto_24131 ?auto_24140 ) ) ( not ( = ?auto_24131 ?auto_24169 ) ) ( not ( = ?auto_24132 ?auto_24140 ) ) ( not ( = ?auto_24132 ?auto_24169 ) ) ( not ( = ?auto_24133 ?auto_24140 ) ) ( not ( = ?auto_24133 ?auto_24169 ) ) ( not ( = ?auto_24134 ?auto_24140 ) ) ( not ( = ?auto_24134 ?auto_24169 ) ) ( not ( = ?auto_24135 ?auto_24140 ) ) ( not ( = ?auto_24135 ?auto_24169 ) ) ( not ( = ?auto_24136 ?auto_24140 ) ) ( not ( = ?auto_24136 ?auto_24169 ) ) ( not ( = ?auto_24137 ?auto_24140 ) ) ( not ( = ?auto_24137 ?auto_24169 ) ) ( not ( = ?auto_24138 ?auto_24140 ) ) ( not ( = ?auto_24138 ?auto_24169 ) ) ( not ( = ?auto_24140 ?auto_24166 ) ) ( not ( = ?auto_24140 ?auto_24152 ) ) ( not ( = ?auto_24140 ?auto_24162 ) ) ( not ( = ?auto_24140 ?auto_24167 ) ) ( not ( = ?auto_24140 ?auto_24173 ) ) ( not ( = ?auto_24140 ?auto_24154 ) ) ( not ( = ?auto_24140 ?auto_24155 ) ) ( not ( = ?auto_24140 ?auto_24153 ) ) ( not ( = ?auto_24140 ?auto_24174 ) ) ( not ( = ?auto_24151 ?auto_24177 ) ) ( not ( = ?auto_24151 ?auto_24161 ) ) ( not ( = ?auto_24151 ?auto_24168 ) ) ( not ( = ?auto_24151 ?auto_24159 ) ) ( not ( = ?auto_24151 ?auto_24178 ) ) ( not ( = ?auto_24151 ?auto_24176 ) ) ( not ( = ?auto_24151 ?auto_24170 ) ) ( not ( = ?auto_24151 ?auto_24171 ) ) ( not ( = ?auto_24150 ?auto_24149 ) ) ( not ( = ?auto_24150 ?auto_24163 ) ) ( not ( = ?auto_24150 ?auto_24157 ) ) ( not ( = ?auto_24150 ?auto_24175 ) ) ( not ( = ?auto_24150 ?auto_24158 ) ) ( not ( = ?auto_24150 ?auto_24165 ) ) ( not ( = ?auto_24150 ?auto_24160 ) ) ( not ( = ?auto_24150 ?auto_24164 ) ) ( not ( = ?auto_24169 ?auto_24166 ) ) ( not ( = ?auto_24169 ?auto_24152 ) ) ( not ( = ?auto_24169 ?auto_24162 ) ) ( not ( = ?auto_24169 ?auto_24167 ) ) ( not ( = ?auto_24169 ?auto_24173 ) ) ( not ( = ?auto_24169 ?auto_24154 ) ) ( not ( = ?auto_24169 ?auto_24155 ) ) ( not ( = ?auto_24169 ?auto_24153 ) ) ( not ( = ?auto_24169 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24141 ) ) ( not ( = ?auto_24130 ?auto_24179 ) ) ( not ( = ?auto_24131 ?auto_24141 ) ) ( not ( = ?auto_24131 ?auto_24179 ) ) ( not ( = ?auto_24132 ?auto_24141 ) ) ( not ( = ?auto_24132 ?auto_24179 ) ) ( not ( = ?auto_24133 ?auto_24141 ) ) ( not ( = ?auto_24133 ?auto_24179 ) ) ( not ( = ?auto_24134 ?auto_24141 ) ) ( not ( = ?auto_24134 ?auto_24179 ) ) ( not ( = ?auto_24135 ?auto_24141 ) ) ( not ( = ?auto_24135 ?auto_24179 ) ) ( not ( = ?auto_24136 ?auto_24141 ) ) ( not ( = ?auto_24136 ?auto_24179 ) ) ( not ( = ?auto_24137 ?auto_24141 ) ) ( not ( = ?auto_24137 ?auto_24179 ) ) ( not ( = ?auto_24138 ?auto_24141 ) ) ( not ( = ?auto_24138 ?auto_24179 ) ) ( not ( = ?auto_24139 ?auto_24141 ) ) ( not ( = ?auto_24139 ?auto_24179 ) ) ( not ( = ?auto_24141 ?auto_24169 ) ) ( not ( = ?auto_24141 ?auto_24166 ) ) ( not ( = ?auto_24141 ?auto_24152 ) ) ( not ( = ?auto_24141 ?auto_24162 ) ) ( not ( = ?auto_24141 ?auto_24167 ) ) ( not ( = ?auto_24141 ?auto_24173 ) ) ( not ( = ?auto_24141 ?auto_24154 ) ) ( not ( = ?auto_24141 ?auto_24155 ) ) ( not ( = ?auto_24141 ?auto_24153 ) ) ( not ( = ?auto_24141 ?auto_24174 ) ) ( not ( = ?auto_24156 ?auto_24151 ) ) ( not ( = ?auto_24156 ?auto_24177 ) ) ( not ( = ?auto_24156 ?auto_24161 ) ) ( not ( = ?auto_24156 ?auto_24168 ) ) ( not ( = ?auto_24156 ?auto_24159 ) ) ( not ( = ?auto_24156 ?auto_24178 ) ) ( not ( = ?auto_24156 ?auto_24176 ) ) ( not ( = ?auto_24156 ?auto_24170 ) ) ( not ( = ?auto_24156 ?auto_24171 ) ) ( not ( = ?auto_24172 ?auto_24150 ) ) ( not ( = ?auto_24172 ?auto_24149 ) ) ( not ( = ?auto_24172 ?auto_24163 ) ) ( not ( = ?auto_24172 ?auto_24157 ) ) ( not ( = ?auto_24172 ?auto_24175 ) ) ( not ( = ?auto_24172 ?auto_24158 ) ) ( not ( = ?auto_24172 ?auto_24165 ) ) ( not ( = ?auto_24172 ?auto_24160 ) ) ( not ( = ?auto_24172 ?auto_24164 ) ) ( not ( = ?auto_24179 ?auto_24169 ) ) ( not ( = ?auto_24179 ?auto_24166 ) ) ( not ( = ?auto_24179 ?auto_24152 ) ) ( not ( = ?auto_24179 ?auto_24162 ) ) ( not ( = ?auto_24179 ?auto_24167 ) ) ( not ( = ?auto_24179 ?auto_24173 ) ) ( not ( = ?auto_24179 ?auto_24154 ) ) ( not ( = ?auto_24179 ?auto_24155 ) ) ( not ( = ?auto_24179 ?auto_24153 ) ) ( not ( = ?auto_24179 ?auto_24174 ) ) ( not ( = ?auto_24130 ?auto_24142 ) ) ( not ( = ?auto_24130 ?auto_24143 ) ) ( not ( = ?auto_24131 ?auto_24142 ) ) ( not ( = ?auto_24131 ?auto_24143 ) ) ( not ( = ?auto_24132 ?auto_24142 ) ) ( not ( = ?auto_24132 ?auto_24143 ) ) ( not ( = ?auto_24133 ?auto_24142 ) ) ( not ( = ?auto_24133 ?auto_24143 ) ) ( not ( = ?auto_24134 ?auto_24142 ) ) ( not ( = ?auto_24134 ?auto_24143 ) ) ( not ( = ?auto_24135 ?auto_24142 ) ) ( not ( = ?auto_24135 ?auto_24143 ) ) ( not ( = ?auto_24136 ?auto_24142 ) ) ( not ( = ?auto_24136 ?auto_24143 ) ) ( not ( = ?auto_24137 ?auto_24142 ) ) ( not ( = ?auto_24137 ?auto_24143 ) ) ( not ( = ?auto_24138 ?auto_24142 ) ) ( not ( = ?auto_24138 ?auto_24143 ) ) ( not ( = ?auto_24139 ?auto_24142 ) ) ( not ( = ?auto_24139 ?auto_24143 ) ) ( not ( = ?auto_24140 ?auto_24142 ) ) ( not ( = ?auto_24140 ?auto_24143 ) ) ( not ( = ?auto_24142 ?auto_24179 ) ) ( not ( = ?auto_24142 ?auto_24169 ) ) ( not ( = ?auto_24142 ?auto_24166 ) ) ( not ( = ?auto_24142 ?auto_24152 ) ) ( not ( = ?auto_24142 ?auto_24162 ) ) ( not ( = ?auto_24142 ?auto_24167 ) ) ( not ( = ?auto_24142 ?auto_24173 ) ) ( not ( = ?auto_24142 ?auto_24154 ) ) ( not ( = ?auto_24142 ?auto_24155 ) ) ( not ( = ?auto_24142 ?auto_24153 ) ) ( not ( = ?auto_24142 ?auto_24174 ) ) ( not ( = ?auto_24148 ?auto_24156 ) ) ( not ( = ?auto_24148 ?auto_24151 ) ) ( not ( = ?auto_24148 ?auto_24177 ) ) ( not ( = ?auto_24148 ?auto_24161 ) ) ( not ( = ?auto_24148 ?auto_24168 ) ) ( not ( = ?auto_24148 ?auto_24159 ) ) ( not ( = ?auto_24148 ?auto_24178 ) ) ( not ( = ?auto_24148 ?auto_24176 ) ) ( not ( = ?auto_24148 ?auto_24170 ) ) ( not ( = ?auto_24148 ?auto_24171 ) ) ( not ( = ?auto_24146 ?auto_24172 ) ) ( not ( = ?auto_24146 ?auto_24150 ) ) ( not ( = ?auto_24146 ?auto_24149 ) ) ( not ( = ?auto_24146 ?auto_24163 ) ) ( not ( = ?auto_24146 ?auto_24157 ) ) ( not ( = ?auto_24146 ?auto_24175 ) ) ( not ( = ?auto_24146 ?auto_24158 ) ) ( not ( = ?auto_24146 ?auto_24165 ) ) ( not ( = ?auto_24146 ?auto_24160 ) ) ( not ( = ?auto_24146 ?auto_24164 ) ) ( not ( = ?auto_24143 ?auto_24179 ) ) ( not ( = ?auto_24143 ?auto_24169 ) ) ( not ( = ?auto_24143 ?auto_24166 ) ) ( not ( = ?auto_24143 ?auto_24152 ) ) ( not ( = ?auto_24143 ?auto_24162 ) ) ( not ( = ?auto_24143 ?auto_24167 ) ) ( not ( = ?auto_24143 ?auto_24173 ) ) ( not ( = ?auto_24143 ?auto_24154 ) ) ( not ( = ?auto_24143 ?auto_24155 ) ) ( not ( = ?auto_24143 ?auto_24153 ) ) ( not ( = ?auto_24143 ?auto_24174 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24130 ?auto_24131 ?auto_24132 ?auto_24133 ?auto_24134 ?auto_24135 ?auto_24136 ?auto_24137 ?auto_24138 ?auto_24139 ?auto_24140 ?auto_24141 )
      ( MAKE-1CRATE ?auto_24141 ?auto_24142 )
      ( MAKE-12CRATE-VERIFY ?auto_24130 ?auto_24131 ?auto_24132 ?auto_24133 ?auto_24134 ?auto_24135 ?auto_24136 ?auto_24137 ?auto_24138 ?auto_24139 ?auto_24140 ?auto_24141 ?auto_24142 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_24204 - SURFACE
      ?auto_24205 - SURFACE
      ?auto_24206 - SURFACE
      ?auto_24207 - SURFACE
      ?auto_24208 - SURFACE
      ?auto_24209 - SURFACE
      ?auto_24210 - SURFACE
      ?auto_24211 - SURFACE
      ?auto_24212 - SURFACE
      ?auto_24213 - SURFACE
      ?auto_24214 - SURFACE
      ?auto_24215 - SURFACE
      ?auto_24216 - SURFACE
      ?auto_24217 - SURFACE
    )
    :vars
    (
      ?auto_24218 - HOIST
      ?auto_24222 - PLACE
      ?auto_24219 - PLACE
      ?auto_24223 - HOIST
      ?auto_24221 - SURFACE
      ?auto_24242 - PLACE
      ?auto_24255 - HOIST
      ?auto_24241 - SURFACE
      ?auto_24240 - PLACE
      ?auto_24254 - HOIST
      ?auto_24228 - SURFACE
      ?auto_24236 - PLACE
      ?auto_24250 - HOIST
      ?auto_24247 - SURFACE
      ?auto_24229 - PLACE
      ?auto_24246 - HOIST
      ?auto_24231 - SURFACE
      ?auto_24226 - PLACE
      ?auto_24233 - HOIST
      ?auto_24235 - SURFACE
      ?auto_24234 - SURFACE
      ?auto_24230 - PLACE
      ?auto_24248 - HOIST
      ?auto_24251 - SURFACE
      ?auto_24243 - PLACE
      ?auto_24227 - HOIST
      ?auto_24245 - SURFACE
      ?auto_24257 - PLACE
      ?auto_24224 - HOIST
      ?auto_24237 - SURFACE
      ?auto_24253 - PLACE
      ?auto_24239 - HOIST
      ?auto_24252 - SURFACE
      ?auto_24225 - PLACE
      ?auto_24256 - HOIST
      ?auto_24238 - SURFACE
      ?auto_24232 - PLACE
      ?auto_24249 - HOIST
      ?auto_24244 - SURFACE
      ?auto_24220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24218 ?auto_24222 ) ( IS-CRATE ?auto_24217 ) ( not ( = ?auto_24219 ?auto_24222 ) ) ( HOIST-AT ?auto_24223 ?auto_24219 ) ( AVAILABLE ?auto_24223 ) ( SURFACE-AT ?auto_24217 ?auto_24219 ) ( ON ?auto_24217 ?auto_24221 ) ( CLEAR ?auto_24217 ) ( not ( = ?auto_24216 ?auto_24217 ) ) ( not ( = ?auto_24216 ?auto_24221 ) ) ( not ( = ?auto_24217 ?auto_24221 ) ) ( not ( = ?auto_24218 ?auto_24223 ) ) ( IS-CRATE ?auto_24216 ) ( not ( = ?auto_24242 ?auto_24222 ) ) ( HOIST-AT ?auto_24255 ?auto_24242 ) ( AVAILABLE ?auto_24255 ) ( SURFACE-AT ?auto_24216 ?auto_24242 ) ( ON ?auto_24216 ?auto_24241 ) ( CLEAR ?auto_24216 ) ( not ( = ?auto_24215 ?auto_24216 ) ) ( not ( = ?auto_24215 ?auto_24241 ) ) ( not ( = ?auto_24216 ?auto_24241 ) ) ( not ( = ?auto_24218 ?auto_24255 ) ) ( IS-CRATE ?auto_24215 ) ( not ( = ?auto_24240 ?auto_24222 ) ) ( HOIST-AT ?auto_24254 ?auto_24240 ) ( AVAILABLE ?auto_24254 ) ( SURFACE-AT ?auto_24215 ?auto_24240 ) ( ON ?auto_24215 ?auto_24228 ) ( CLEAR ?auto_24215 ) ( not ( = ?auto_24214 ?auto_24215 ) ) ( not ( = ?auto_24214 ?auto_24228 ) ) ( not ( = ?auto_24215 ?auto_24228 ) ) ( not ( = ?auto_24218 ?auto_24254 ) ) ( IS-CRATE ?auto_24214 ) ( not ( = ?auto_24236 ?auto_24222 ) ) ( HOIST-AT ?auto_24250 ?auto_24236 ) ( AVAILABLE ?auto_24250 ) ( SURFACE-AT ?auto_24214 ?auto_24236 ) ( ON ?auto_24214 ?auto_24247 ) ( CLEAR ?auto_24214 ) ( not ( = ?auto_24213 ?auto_24214 ) ) ( not ( = ?auto_24213 ?auto_24247 ) ) ( not ( = ?auto_24214 ?auto_24247 ) ) ( not ( = ?auto_24218 ?auto_24250 ) ) ( IS-CRATE ?auto_24213 ) ( not ( = ?auto_24229 ?auto_24222 ) ) ( HOIST-AT ?auto_24246 ?auto_24229 ) ( AVAILABLE ?auto_24246 ) ( SURFACE-AT ?auto_24213 ?auto_24229 ) ( ON ?auto_24213 ?auto_24231 ) ( CLEAR ?auto_24213 ) ( not ( = ?auto_24212 ?auto_24213 ) ) ( not ( = ?auto_24212 ?auto_24231 ) ) ( not ( = ?auto_24213 ?auto_24231 ) ) ( not ( = ?auto_24218 ?auto_24246 ) ) ( IS-CRATE ?auto_24212 ) ( not ( = ?auto_24226 ?auto_24222 ) ) ( HOIST-AT ?auto_24233 ?auto_24226 ) ( SURFACE-AT ?auto_24212 ?auto_24226 ) ( ON ?auto_24212 ?auto_24235 ) ( CLEAR ?auto_24212 ) ( not ( = ?auto_24211 ?auto_24212 ) ) ( not ( = ?auto_24211 ?auto_24235 ) ) ( not ( = ?auto_24212 ?auto_24235 ) ) ( not ( = ?auto_24218 ?auto_24233 ) ) ( IS-CRATE ?auto_24211 ) ( AVAILABLE ?auto_24233 ) ( SURFACE-AT ?auto_24211 ?auto_24226 ) ( ON ?auto_24211 ?auto_24234 ) ( CLEAR ?auto_24211 ) ( not ( = ?auto_24210 ?auto_24211 ) ) ( not ( = ?auto_24210 ?auto_24234 ) ) ( not ( = ?auto_24211 ?auto_24234 ) ) ( IS-CRATE ?auto_24210 ) ( not ( = ?auto_24230 ?auto_24222 ) ) ( HOIST-AT ?auto_24248 ?auto_24230 ) ( AVAILABLE ?auto_24248 ) ( SURFACE-AT ?auto_24210 ?auto_24230 ) ( ON ?auto_24210 ?auto_24251 ) ( CLEAR ?auto_24210 ) ( not ( = ?auto_24209 ?auto_24210 ) ) ( not ( = ?auto_24209 ?auto_24251 ) ) ( not ( = ?auto_24210 ?auto_24251 ) ) ( not ( = ?auto_24218 ?auto_24248 ) ) ( IS-CRATE ?auto_24209 ) ( not ( = ?auto_24243 ?auto_24222 ) ) ( HOIST-AT ?auto_24227 ?auto_24243 ) ( AVAILABLE ?auto_24227 ) ( SURFACE-AT ?auto_24209 ?auto_24243 ) ( ON ?auto_24209 ?auto_24245 ) ( CLEAR ?auto_24209 ) ( not ( = ?auto_24208 ?auto_24209 ) ) ( not ( = ?auto_24208 ?auto_24245 ) ) ( not ( = ?auto_24209 ?auto_24245 ) ) ( not ( = ?auto_24218 ?auto_24227 ) ) ( IS-CRATE ?auto_24208 ) ( not ( = ?auto_24257 ?auto_24222 ) ) ( HOIST-AT ?auto_24224 ?auto_24257 ) ( AVAILABLE ?auto_24224 ) ( SURFACE-AT ?auto_24208 ?auto_24257 ) ( ON ?auto_24208 ?auto_24237 ) ( CLEAR ?auto_24208 ) ( not ( = ?auto_24207 ?auto_24208 ) ) ( not ( = ?auto_24207 ?auto_24237 ) ) ( not ( = ?auto_24208 ?auto_24237 ) ) ( not ( = ?auto_24218 ?auto_24224 ) ) ( IS-CRATE ?auto_24207 ) ( not ( = ?auto_24253 ?auto_24222 ) ) ( HOIST-AT ?auto_24239 ?auto_24253 ) ( AVAILABLE ?auto_24239 ) ( SURFACE-AT ?auto_24207 ?auto_24253 ) ( ON ?auto_24207 ?auto_24252 ) ( CLEAR ?auto_24207 ) ( not ( = ?auto_24206 ?auto_24207 ) ) ( not ( = ?auto_24206 ?auto_24252 ) ) ( not ( = ?auto_24207 ?auto_24252 ) ) ( not ( = ?auto_24218 ?auto_24239 ) ) ( IS-CRATE ?auto_24206 ) ( not ( = ?auto_24225 ?auto_24222 ) ) ( HOIST-AT ?auto_24256 ?auto_24225 ) ( AVAILABLE ?auto_24256 ) ( SURFACE-AT ?auto_24206 ?auto_24225 ) ( ON ?auto_24206 ?auto_24238 ) ( CLEAR ?auto_24206 ) ( not ( = ?auto_24205 ?auto_24206 ) ) ( not ( = ?auto_24205 ?auto_24238 ) ) ( not ( = ?auto_24206 ?auto_24238 ) ) ( not ( = ?auto_24218 ?auto_24256 ) ) ( SURFACE-AT ?auto_24204 ?auto_24222 ) ( CLEAR ?auto_24204 ) ( IS-CRATE ?auto_24205 ) ( AVAILABLE ?auto_24218 ) ( not ( = ?auto_24232 ?auto_24222 ) ) ( HOIST-AT ?auto_24249 ?auto_24232 ) ( AVAILABLE ?auto_24249 ) ( SURFACE-AT ?auto_24205 ?auto_24232 ) ( ON ?auto_24205 ?auto_24244 ) ( CLEAR ?auto_24205 ) ( TRUCK-AT ?auto_24220 ?auto_24222 ) ( not ( = ?auto_24204 ?auto_24205 ) ) ( not ( = ?auto_24204 ?auto_24244 ) ) ( not ( = ?auto_24205 ?auto_24244 ) ) ( not ( = ?auto_24218 ?auto_24249 ) ) ( not ( = ?auto_24204 ?auto_24206 ) ) ( not ( = ?auto_24204 ?auto_24238 ) ) ( not ( = ?auto_24206 ?auto_24244 ) ) ( not ( = ?auto_24225 ?auto_24232 ) ) ( not ( = ?auto_24256 ?auto_24249 ) ) ( not ( = ?auto_24238 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24207 ) ) ( not ( = ?auto_24204 ?auto_24252 ) ) ( not ( = ?auto_24205 ?auto_24207 ) ) ( not ( = ?auto_24205 ?auto_24252 ) ) ( not ( = ?auto_24207 ?auto_24238 ) ) ( not ( = ?auto_24207 ?auto_24244 ) ) ( not ( = ?auto_24253 ?auto_24225 ) ) ( not ( = ?auto_24253 ?auto_24232 ) ) ( not ( = ?auto_24239 ?auto_24256 ) ) ( not ( = ?auto_24239 ?auto_24249 ) ) ( not ( = ?auto_24252 ?auto_24238 ) ) ( not ( = ?auto_24252 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24208 ) ) ( not ( = ?auto_24204 ?auto_24237 ) ) ( not ( = ?auto_24205 ?auto_24208 ) ) ( not ( = ?auto_24205 ?auto_24237 ) ) ( not ( = ?auto_24206 ?auto_24208 ) ) ( not ( = ?auto_24206 ?auto_24237 ) ) ( not ( = ?auto_24208 ?auto_24252 ) ) ( not ( = ?auto_24208 ?auto_24238 ) ) ( not ( = ?auto_24208 ?auto_24244 ) ) ( not ( = ?auto_24257 ?auto_24253 ) ) ( not ( = ?auto_24257 ?auto_24225 ) ) ( not ( = ?auto_24257 ?auto_24232 ) ) ( not ( = ?auto_24224 ?auto_24239 ) ) ( not ( = ?auto_24224 ?auto_24256 ) ) ( not ( = ?auto_24224 ?auto_24249 ) ) ( not ( = ?auto_24237 ?auto_24252 ) ) ( not ( = ?auto_24237 ?auto_24238 ) ) ( not ( = ?auto_24237 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24209 ) ) ( not ( = ?auto_24204 ?auto_24245 ) ) ( not ( = ?auto_24205 ?auto_24209 ) ) ( not ( = ?auto_24205 ?auto_24245 ) ) ( not ( = ?auto_24206 ?auto_24209 ) ) ( not ( = ?auto_24206 ?auto_24245 ) ) ( not ( = ?auto_24207 ?auto_24209 ) ) ( not ( = ?auto_24207 ?auto_24245 ) ) ( not ( = ?auto_24209 ?auto_24237 ) ) ( not ( = ?auto_24209 ?auto_24252 ) ) ( not ( = ?auto_24209 ?auto_24238 ) ) ( not ( = ?auto_24209 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24257 ) ) ( not ( = ?auto_24243 ?auto_24253 ) ) ( not ( = ?auto_24243 ?auto_24225 ) ) ( not ( = ?auto_24243 ?auto_24232 ) ) ( not ( = ?auto_24227 ?auto_24224 ) ) ( not ( = ?auto_24227 ?auto_24239 ) ) ( not ( = ?auto_24227 ?auto_24256 ) ) ( not ( = ?auto_24227 ?auto_24249 ) ) ( not ( = ?auto_24245 ?auto_24237 ) ) ( not ( = ?auto_24245 ?auto_24252 ) ) ( not ( = ?auto_24245 ?auto_24238 ) ) ( not ( = ?auto_24245 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24210 ) ) ( not ( = ?auto_24204 ?auto_24251 ) ) ( not ( = ?auto_24205 ?auto_24210 ) ) ( not ( = ?auto_24205 ?auto_24251 ) ) ( not ( = ?auto_24206 ?auto_24210 ) ) ( not ( = ?auto_24206 ?auto_24251 ) ) ( not ( = ?auto_24207 ?auto_24210 ) ) ( not ( = ?auto_24207 ?auto_24251 ) ) ( not ( = ?auto_24208 ?auto_24210 ) ) ( not ( = ?auto_24208 ?auto_24251 ) ) ( not ( = ?auto_24210 ?auto_24245 ) ) ( not ( = ?auto_24210 ?auto_24237 ) ) ( not ( = ?auto_24210 ?auto_24252 ) ) ( not ( = ?auto_24210 ?auto_24238 ) ) ( not ( = ?auto_24210 ?auto_24244 ) ) ( not ( = ?auto_24230 ?auto_24243 ) ) ( not ( = ?auto_24230 ?auto_24257 ) ) ( not ( = ?auto_24230 ?auto_24253 ) ) ( not ( = ?auto_24230 ?auto_24225 ) ) ( not ( = ?auto_24230 ?auto_24232 ) ) ( not ( = ?auto_24248 ?auto_24227 ) ) ( not ( = ?auto_24248 ?auto_24224 ) ) ( not ( = ?auto_24248 ?auto_24239 ) ) ( not ( = ?auto_24248 ?auto_24256 ) ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( not ( = ?auto_24251 ?auto_24245 ) ) ( not ( = ?auto_24251 ?auto_24237 ) ) ( not ( = ?auto_24251 ?auto_24252 ) ) ( not ( = ?auto_24251 ?auto_24238 ) ) ( not ( = ?auto_24251 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24211 ) ) ( not ( = ?auto_24204 ?auto_24234 ) ) ( not ( = ?auto_24205 ?auto_24211 ) ) ( not ( = ?auto_24205 ?auto_24234 ) ) ( not ( = ?auto_24206 ?auto_24211 ) ) ( not ( = ?auto_24206 ?auto_24234 ) ) ( not ( = ?auto_24207 ?auto_24211 ) ) ( not ( = ?auto_24207 ?auto_24234 ) ) ( not ( = ?auto_24208 ?auto_24211 ) ) ( not ( = ?auto_24208 ?auto_24234 ) ) ( not ( = ?auto_24209 ?auto_24211 ) ) ( not ( = ?auto_24209 ?auto_24234 ) ) ( not ( = ?auto_24211 ?auto_24251 ) ) ( not ( = ?auto_24211 ?auto_24245 ) ) ( not ( = ?auto_24211 ?auto_24237 ) ) ( not ( = ?auto_24211 ?auto_24252 ) ) ( not ( = ?auto_24211 ?auto_24238 ) ) ( not ( = ?auto_24211 ?auto_24244 ) ) ( not ( = ?auto_24226 ?auto_24230 ) ) ( not ( = ?auto_24226 ?auto_24243 ) ) ( not ( = ?auto_24226 ?auto_24257 ) ) ( not ( = ?auto_24226 ?auto_24253 ) ) ( not ( = ?auto_24226 ?auto_24225 ) ) ( not ( = ?auto_24226 ?auto_24232 ) ) ( not ( = ?auto_24233 ?auto_24248 ) ) ( not ( = ?auto_24233 ?auto_24227 ) ) ( not ( = ?auto_24233 ?auto_24224 ) ) ( not ( = ?auto_24233 ?auto_24239 ) ) ( not ( = ?auto_24233 ?auto_24256 ) ) ( not ( = ?auto_24233 ?auto_24249 ) ) ( not ( = ?auto_24234 ?auto_24251 ) ) ( not ( = ?auto_24234 ?auto_24245 ) ) ( not ( = ?auto_24234 ?auto_24237 ) ) ( not ( = ?auto_24234 ?auto_24252 ) ) ( not ( = ?auto_24234 ?auto_24238 ) ) ( not ( = ?auto_24234 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24212 ) ) ( not ( = ?auto_24204 ?auto_24235 ) ) ( not ( = ?auto_24205 ?auto_24212 ) ) ( not ( = ?auto_24205 ?auto_24235 ) ) ( not ( = ?auto_24206 ?auto_24212 ) ) ( not ( = ?auto_24206 ?auto_24235 ) ) ( not ( = ?auto_24207 ?auto_24212 ) ) ( not ( = ?auto_24207 ?auto_24235 ) ) ( not ( = ?auto_24208 ?auto_24212 ) ) ( not ( = ?auto_24208 ?auto_24235 ) ) ( not ( = ?auto_24209 ?auto_24212 ) ) ( not ( = ?auto_24209 ?auto_24235 ) ) ( not ( = ?auto_24210 ?auto_24212 ) ) ( not ( = ?auto_24210 ?auto_24235 ) ) ( not ( = ?auto_24212 ?auto_24234 ) ) ( not ( = ?auto_24212 ?auto_24251 ) ) ( not ( = ?auto_24212 ?auto_24245 ) ) ( not ( = ?auto_24212 ?auto_24237 ) ) ( not ( = ?auto_24212 ?auto_24252 ) ) ( not ( = ?auto_24212 ?auto_24238 ) ) ( not ( = ?auto_24212 ?auto_24244 ) ) ( not ( = ?auto_24235 ?auto_24234 ) ) ( not ( = ?auto_24235 ?auto_24251 ) ) ( not ( = ?auto_24235 ?auto_24245 ) ) ( not ( = ?auto_24235 ?auto_24237 ) ) ( not ( = ?auto_24235 ?auto_24252 ) ) ( not ( = ?auto_24235 ?auto_24238 ) ) ( not ( = ?auto_24235 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24213 ) ) ( not ( = ?auto_24204 ?auto_24231 ) ) ( not ( = ?auto_24205 ?auto_24213 ) ) ( not ( = ?auto_24205 ?auto_24231 ) ) ( not ( = ?auto_24206 ?auto_24213 ) ) ( not ( = ?auto_24206 ?auto_24231 ) ) ( not ( = ?auto_24207 ?auto_24213 ) ) ( not ( = ?auto_24207 ?auto_24231 ) ) ( not ( = ?auto_24208 ?auto_24213 ) ) ( not ( = ?auto_24208 ?auto_24231 ) ) ( not ( = ?auto_24209 ?auto_24213 ) ) ( not ( = ?auto_24209 ?auto_24231 ) ) ( not ( = ?auto_24210 ?auto_24213 ) ) ( not ( = ?auto_24210 ?auto_24231 ) ) ( not ( = ?auto_24211 ?auto_24213 ) ) ( not ( = ?auto_24211 ?auto_24231 ) ) ( not ( = ?auto_24213 ?auto_24235 ) ) ( not ( = ?auto_24213 ?auto_24234 ) ) ( not ( = ?auto_24213 ?auto_24251 ) ) ( not ( = ?auto_24213 ?auto_24245 ) ) ( not ( = ?auto_24213 ?auto_24237 ) ) ( not ( = ?auto_24213 ?auto_24252 ) ) ( not ( = ?auto_24213 ?auto_24238 ) ) ( not ( = ?auto_24213 ?auto_24244 ) ) ( not ( = ?auto_24229 ?auto_24226 ) ) ( not ( = ?auto_24229 ?auto_24230 ) ) ( not ( = ?auto_24229 ?auto_24243 ) ) ( not ( = ?auto_24229 ?auto_24257 ) ) ( not ( = ?auto_24229 ?auto_24253 ) ) ( not ( = ?auto_24229 ?auto_24225 ) ) ( not ( = ?auto_24229 ?auto_24232 ) ) ( not ( = ?auto_24246 ?auto_24233 ) ) ( not ( = ?auto_24246 ?auto_24248 ) ) ( not ( = ?auto_24246 ?auto_24227 ) ) ( not ( = ?auto_24246 ?auto_24224 ) ) ( not ( = ?auto_24246 ?auto_24239 ) ) ( not ( = ?auto_24246 ?auto_24256 ) ) ( not ( = ?auto_24246 ?auto_24249 ) ) ( not ( = ?auto_24231 ?auto_24235 ) ) ( not ( = ?auto_24231 ?auto_24234 ) ) ( not ( = ?auto_24231 ?auto_24251 ) ) ( not ( = ?auto_24231 ?auto_24245 ) ) ( not ( = ?auto_24231 ?auto_24237 ) ) ( not ( = ?auto_24231 ?auto_24252 ) ) ( not ( = ?auto_24231 ?auto_24238 ) ) ( not ( = ?auto_24231 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24214 ) ) ( not ( = ?auto_24204 ?auto_24247 ) ) ( not ( = ?auto_24205 ?auto_24214 ) ) ( not ( = ?auto_24205 ?auto_24247 ) ) ( not ( = ?auto_24206 ?auto_24214 ) ) ( not ( = ?auto_24206 ?auto_24247 ) ) ( not ( = ?auto_24207 ?auto_24214 ) ) ( not ( = ?auto_24207 ?auto_24247 ) ) ( not ( = ?auto_24208 ?auto_24214 ) ) ( not ( = ?auto_24208 ?auto_24247 ) ) ( not ( = ?auto_24209 ?auto_24214 ) ) ( not ( = ?auto_24209 ?auto_24247 ) ) ( not ( = ?auto_24210 ?auto_24214 ) ) ( not ( = ?auto_24210 ?auto_24247 ) ) ( not ( = ?auto_24211 ?auto_24214 ) ) ( not ( = ?auto_24211 ?auto_24247 ) ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( not ( = ?auto_24212 ?auto_24247 ) ) ( not ( = ?auto_24214 ?auto_24231 ) ) ( not ( = ?auto_24214 ?auto_24235 ) ) ( not ( = ?auto_24214 ?auto_24234 ) ) ( not ( = ?auto_24214 ?auto_24251 ) ) ( not ( = ?auto_24214 ?auto_24245 ) ) ( not ( = ?auto_24214 ?auto_24237 ) ) ( not ( = ?auto_24214 ?auto_24252 ) ) ( not ( = ?auto_24214 ?auto_24238 ) ) ( not ( = ?auto_24214 ?auto_24244 ) ) ( not ( = ?auto_24236 ?auto_24229 ) ) ( not ( = ?auto_24236 ?auto_24226 ) ) ( not ( = ?auto_24236 ?auto_24230 ) ) ( not ( = ?auto_24236 ?auto_24243 ) ) ( not ( = ?auto_24236 ?auto_24257 ) ) ( not ( = ?auto_24236 ?auto_24253 ) ) ( not ( = ?auto_24236 ?auto_24225 ) ) ( not ( = ?auto_24236 ?auto_24232 ) ) ( not ( = ?auto_24250 ?auto_24246 ) ) ( not ( = ?auto_24250 ?auto_24233 ) ) ( not ( = ?auto_24250 ?auto_24248 ) ) ( not ( = ?auto_24250 ?auto_24227 ) ) ( not ( = ?auto_24250 ?auto_24224 ) ) ( not ( = ?auto_24250 ?auto_24239 ) ) ( not ( = ?auto_24250 ?auto_24256 ) ) ( not ( = ?auto_24250 ?auto_24249 ) ) ( not ( = ?auto_24247 ?auto_24231 ) ) ( not ( = ?auto_24247 ?auto_24235 ) ) ( not ( = ?auto_24247 ?auto_24234 ) ) ( not ( = ?auto_24247 ?auto_24251 ) ) ( not ( = ?auto_24247 ?auto_24245 ) ) ( not ( = ?auto_24247 ?auto_24237 ) ) ( not ( = ?auto_24247 ?auto_24252 ) ) ( not ( = ?auto_24247 ?auto_24238 ) ) ( not ( = ?auto_24247 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24215 ) ) ( not ( = ?auto_24204 ?auto_24228 ) ) ( not ( = ?auto_24205 ?auto_24215 ) ) ( not ( = ?auto_24205 ?auto_24228 ) ) ( not ( = ?auto_24206 ?auto_24215 ) ) ( not ( = ?auto_24206 ?auto_24228 ) ) ( not ( = ?auto_24207 ?auto_24215 ) ) ( not ( = ?auto_24207 ?auto_24228 ) ) ( not ( = ?auto_24208 ?auto_24215 ) ) ( not ( = ?auto_24208 ?auto_24228 ) ) ( not ( = ?auto_24209 ?auto_24215 ) ) ( not ( = ?auto_24209 ?auto_24228 ) ) ( not ( = ?auto_24210 ?auto_24215 ) ) ( not ( = ?auto_24210 ?auto_24228 ) ) ( not ( = ?auto_24211 ?auto_24215 ) ) ( not ( = ?auto_24211 ?auto_24228 ) ) ( not ( = ?auto_24212 ?auto_24215 ) ) ( not ( = ?auto_24212 ?auto_24228 ) ) ( not ( = ?auto_24213 ?auto_24215 ) ) ( not ( = ?auto_24213 ?auto_24228 ) ) ( not ( = ?auto_24215 ?auto_24247 ) ) ( not ( = ?auto_24215 ?auto_24231 ) ) ( not ( = ?auto_24215 ?auto_24235 ) ) ( not ( = ?auto_24215 ?auto_24234 ) ) ( not ( = ?auto_24215 ?auto_24251 ) ) ( not ( = ?auto_24215 ?auto_24245 ) ) ( not ( = ?auto_24215 ?auto_24237 ) ) ( not ( = ?auto_24215 ?auto_24252 ) ) ( not ( = ?auto_24215 ?auto_24238 ) ) ( not ( = ?auto_24215 ?auto_24244 ) ) ( not ( = ?auto_24240 ?auto_24236 ) ) ( not ( = ?auto_24240 ?auto_24229 ) ) ( not ( = ?auto_24240 ?auto_24226 ) ) ( not ( = ?auto_24240 ?auto_24230 ) ) ( not ( = ?auto_24240 ?auto_24243 ) ) ( not ( = ?auto_24240 ?auto_24257 ) ) ( not ( = ?auto_24240 ?auto_24253 ) ) ( not ( = ?auto_24240 ?auto_24225 ) ) ( not ( = ?auto_24240 ?auto_24232 ) ) ( not ( = ?auto_24254 ?auto_24250 ) ) ( not ( = ?auto_24254 ?auto_24246 ) ) ( not ( = ?auto_24254 ?auto_24233 ) ) ( not ( = ?auto_24254 ?auto_24248 ) ) ( not ( = ?auto_24254 ?auto_24227 ) ) ( not ( = ?auto_24254 ?auto_24224 ) ) ( not ( = ?auto_24254 ?auto_24239 ) ) ( not ( = ?auto_24254 ?auto_24256 ) ) ( not ( = ?auto_24254 ?auto_24249 ) ) ( not ( = ?auto_24228 ?auto_24247 ) ) ( not ( = ?auto_24228 ?auto_24231 ) ) ( not ( = ?auto_24228 ?auto_24235 ) ) ( not ( = ?auto_24228 ?auto_24234 ) ) ( not ( = ?auto_24228 ?auto_24251 ) ) ( not ( = ?auto_24228 ?auto_24245 ) ) ( not ( = ?auto_24228 ?auto_24237 ) ) ( not ( = ?auto_24228 ?auto_24252 ) ) ( not ( = ?auto_24228 ?auto_24238 ) ) ( not ( = ?auto_24228 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24216 ) ) ( not ( = ?auto_24204 ?auto_24241 ) ) ( not ( = ?auto_24205 ?auto_24216 ) ) ( not ( = ?auto_24205 ?auto_24241 ) ) ( not ( = ?auto_24206 ?auto_24216 ) ) ( not ( = ?auto_24206 ?auto_24241 ) ) ( not ( = ?auto_24207 ?auto_24216 ) ) ( not ( = ?auto_24207 ?auto_24241 ) ) ( not ( = ?auto_24208 ?auto_24216 ) ) ( not ( = ?auto_24208 ?auto_24241 ) ) ( not ( = ?auto_24209 ?auto_24216 ) ) ( not ( = ?auto_24209 ?auto_24241 ) ) ( not ( = ?auto_24210 ?auto_24216 ) ) ( not ( = ?auto_24210 ?auto_24241 ) ) ( not ( = ?auto_24211 ?auto_24216 ) ) ( not ( = ?auto_24211 ?auto_24241 ) ) ( not ( = ?auto_24212 ?auto_24216 ) ) ( not ( = ?auto_24212 ?auto_24241 ) ) ( not ( = ?auto_24213 ?auto_24216 ) ) ( not ( = ?auto_24213 ?auto_24241 ) ) ( not ( = ?auto_24214 ?auto_24216 ) ) ( not ( = ?auto_24214 ?auto_24241 ) ) ( not ( = ?auto_24216 ?auto_24228 ) ) ( not ( = ?auto_24216 ?auto_24247 ) ) ( not ( = ?auto_24216 ?auto_24231 ) ) ( not ( = ?auto_24216 ?auto_24235 ) ) ( not ( = ?auto_24216 ?auto_24234 ) ) ( not ( = ?auto_24216 ?auto_24251 ) ) ( not ( = ?auto_24216 ?auto_24245 ) ) ( not ( = ?auto_24216 ?auto_24237 ) ) ( not ( = ?auto_24216 ?auto_24252 ) ) ( not ( = ?auto_24216 ?auto_24238 ) ) ( not ( = ?auto_24216 ?auto_24244 ) ) ( not ( = ?auto_24242 ?auto_24240 ) ) ( not ( = ?auto_24242 ?auto_24236 ) ) ( not ( = ?auto_24242 ?auto_24229 ) ) ( not ( = ?auto_24242 ?auto_24226 ) ) ( not ( = ?auto_24242 ?auto_24230 ) ) ( not ( = ?auto_24242 ?auto_24243 ) ) ( not ( = ?auto_24242 ?auto_24257 ) ) ( not ( = ?auto_24242 ?auto_24253 ) ) ( not ( = ?auto_24242 ?auto_24225 ) ) ( not ( = ?auto_24242 ?auto_24232 ) ) ( not ( = ?auto_24255 ?auto_24254 ) ) ( not ( = ?auto_24255 ?auto_24250 ) ) ( not ( = ?auto_24255 ?auto_24246 ) ) ( not ( = ?auto_24255 ?auto_24233 ) ) ( not ( = ?auto_24255 ?auto_24248 ) ) ( not ( = ?auto_24255 ?auto_24227 ) ) ( not ( = ?auto_24255 ?auto_24224 ) ) ( not ( = ?auto_24255 ?auto_24239 ) ) ( not ( = ?auto_24255 ?auto_24256 ) ) ( not ( = ?auto_24255 ?auto_24249 ) ) ( not ( = ?auto_24241 ?auto_24228 ) ) ( not ( = ?auto_24241 ?auto_24247 ) ) ( not ( = ?auto_24241 ?auto_24231 ) ) ( not ( = ?auto_24241 ?auto_24235 ) ) ( not ( = ?auto_24241 ?auto_24234 ) ) ( not ( = ?auto_24241 ?auto_24251 ) ) ( not ( = ?auto_24241 ?auto_24245 ) ) ( not ( = ?auto_24241 ?auto_24237 ) ) ( not ( = ?auto_24241 ?auto_24252 ) ) ( not ( = ?auto_24241 ?auto_24238 ) ) ( not ( = ?auto_24241 ?auto_24244 ) ) ( not ( = ?auto_24204 ?auto_24217 ) ) ( not ( = ?auto_24204 ?auto_24221 ) ) ( not ( = ?auto_24205 ?auto_24217 ) ) ( not ( = ?auto_24205 ?auto_24221 ) ) ( not ( = ?auto_24206 ?auto_24217 ) ) ( not ( = ?auto_24206 ?auto_24221 ) ) ( not ( = ?auto_24207 ?auto_24217 ) ) ( not ( = ?auto_24207 ?auto_24221 ) ) ( not ( = ?auto_24208 ?auto_24217 ) ) ( not ( = ?auto_24208 ?auto_24221 ) ) ( not ( = ?auto_24209 ?auto_24217 ) ) ( not ( = ?auto_24209 ?auto_24221 ) ) ( not ( = ?auto_24210 ?auto_24217 ) ) ( not ( = ?auto_24210 ?auto_24221 ) ) ( not ( = ?auto_24211 ?auto_24217 ) ) ( not ( = ?auto_24211 ?auto_24221 ) ) ( not ( = ?auto_24212 ?auto_24217 ) ) ( not ( = ?auto_24212 ?auto_24221 ) ) ( not ( = ?auto_24213 ?auto_24217 ) ) ( not ( = ?auto_24213 ?auto_24221 ) ) ( not ( = ?auto_24214 ?auto_24217 ) ) ( not ( = ?auto_24214 ?auto_24221 ) ) ( not ( = ?auto_24215 ?auto_24217 ) ) ( not ( = ?auto_24215 ?auto_24221 ) ) ( not ( = ?auto_24217 ?auto_24241 ) ) ( not ( = ?auto_24217 ?auto_24228 ) ) ( not ( = ?auto_24217 ?auto_24247 ) ) ( not ( = ?auto_24217 ?auto_24231 ) ) ( not ( = ?auto_24217 ?auto_24235 ) ) ( not ( = ?auto_24217 ?auto_24234 ) ) ( not ( = ?auto_24217 ?auto_24251 ) ) ( not ( = ?auto_24217 ?auto_24245 ) ) ( not ( = ?auto_24217 ?auto_24237 ) ) ( not ( = ?auto_24217 ?auto_24252 ) ) ( not ( = ?auto_24217 ?auto_24238 ) ) ( not ( = ?auto_24217 ?auto_24244 ) ) ( not ( = ?auto_24219 ?auto_24242 ) ) ( not ( = ?auto_24219 ?auto_24240 ) ) ( not ( = ?auto_24219 ?auto_24236 ) ) ( not ( = ?auto_24219 ?auto_24229 ) ) ( not ( = ?auto_24219 ?auto_24226 ) ) ( not ( = ?auto_24219 ?auto_24230 ) ) ( not ( = ?auto_24219 ?auto_24243 ) ) ( not ( = ?auto_24219 ?auto_24257 ) ) ( not ( = ?auto_24219 ?auto_24253 ) ) ( not ( = ?auto_24219 ?auto_24225 ) ) ( not ( = ?auto_24219 ?auto_24232 ) ) ( not ( = ?auto_24223 ?auto_24255 ) ) ( not ( = ?auto_24223 ?auto_24254 ) ) ( not ( = ?auto_24223 ?auto_24250 ) ) ( not ( = ?auto_24223 ?auto_24246 ) ) ( not ( = ?auto_24223 ?auto_24233 ) ) ( not ( = ?auto_24223 ?auto_24248 ) ) ( not ( = ?auto_24223 ?auto_24227 ) ) ( not ( = ?auto_24223 ?auto_24224 ) ) ( not ( = ?auto_24223 ?auto_24239 ) ) ( not ( = ?auto_24223 ?auto_24256 ) ) ( not ( = ?auto_24223 ?auto_24249 ) ) ( not ( = ?auto_24221 ?auto_24241 ) ) ( not ( = ?auto_24221 ?auto_24228 ) ) ( not ( = ?auto_24221 ?auto_24247 ) ) ( not ( = ?auto_24221 ?auto_24231 ) ) ( not ( = ?auto_24221 ?auto_24235 ) ) ( not ( = ?auto_24221 ?auto_24234 ) ) ( not ( = ?auto_24221 ?auto_24251 ) ) ( not ( = ?auto_24221 ?auto_24245 ) ) ( not ( = ?auto_24221 ?auto_24237 ) ) ( not ( = ?auto_24221 ?auto_24252 ) ) ( not ( = ?auto_24221 ?auto_24238 ) ) ( not ( = ?auto_24221 ?auto_24244 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24204 ?auto_24205 ?auto_24206 ?auto_24207 ?auto_24208 ?auto_24209 ?auto_24210 ?auto_24211 ?auto_24212 ?auto_24213 ?auto_24214 ?auto_24215 ?auto_24216 )
      ( MAKE-1CRATE ?auto_24216 ?auto_24217 )
      ( MAKE-13CRATE-VERIFY ?auto_24204 ?auto_24205 ?auto_24206 ?auto_24207 ?auto_24208 ?auto_24209 ?auto_24210 ?auto_24211 ?auto_24212 ?auto_24213 ?auto_24214 ?auto_24215 ?auto_24216 ?auto_24217 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_24283 - SURFACE
      ?auto_24284 - SURFACE
      ?auto_24285 - SURFACE
      ?auto_24286 - SURFACE
      ?auto_24287 - SURFACE
      ?auto_24288 - SURFACE
      ?auto_24289 - SURFACE
      ?auto_24290 - SURFACE
      ?auto_24291 - SURFACE
      ?auto_24292 - SURFACE
      ?auto_24293 - SURFACE
      ?auto_24294 - SURFACE
      ?auto_24295 - SURFACE
      ?auto_24296 - SURFACE
      ?auto_24297 - SURFACE
    )
    :vars
    (
      ?auto_24302 - HOIST
      ?auto_24303 - PLACE
      ?auto_24299 - PLACE
      ?auto_24300 - HOIST
      ?auto_24301 - SURFACE
      ?auto_24330 - PLACE
      ?auto_24306 - HOIST
      ?auto_24325 - SURFACE
      ?auto_24315 - PLACE
      ?auto_24337 - HOIST
      ?auto_24322 - SURFACE
      ?auto_24316 - PLACE
      ?auto_24333 - HOIST
      ?auto_24338 - SURFACE
      ?auto_24318 - PLACE
      ?auto_24332 - HOIST
      ?auto_24323 - SURFACE
      ?auto_24309 - PLACE
      ?auto_24314 - HOIST
      ?auto_24320 - SURFACE
      ?auto_24305 - PLACE
      ?auto_24308 - HOIST
      ?auto_24339 - SURFACE
      ?auto_24321 - SURFACE
      ?auto_24312 - PLACE
      ?auto_24327 - HOIST
      ?auto_24304 - SURFACE
      ?auto_24324 - PLACE
      ?auto_24335 - HOIST
      ?auto_24313 - SURFACE
      ?auto_24319 - PLACE
      ?auto_24307 - HOIST
      ?auto_24340 - SURFACE
      ?auto_24326 - PLACE
      ?auto_24317 - HOIST
      ?auto_24334 - SURFACE
      ?auto_24336 - PLACE
      ?auto_24310 - HOIST
      ?auto_24329 - SURFACE
      ?auto_24311 - PLACE
      ?auto_24328 - HOIST
      ?auto_24331 - SURFACE
      ?auto_24298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24302 ?auto_24303 ) ( IS-CRATE ?auto_24297 ) ( not ( = ?auto_24299 ?auto_24303 ) ) ( HOIST-AT ?auto_24300 ?auto_24299 ) ( AVAILABLE ?auto_24300 ) ( SURFACE-AT ?auto_24297 ?auto_24299 ) ( ON ?auto_24297 ?auto_24301 ) ( CLEAR ?auto_24297 ) ( not ( = ?auto_24296 ?auto_24297 ) ) ( not ( = ?auto_24296 ?auto_24301 ) ) ( not ( = ?auto_24297 ?auto_24301 ) ) ( not ( = ?auto_24302 ?auto_24300 ) ) ( IS-CRATE ?auto_24296 ) ( not ( = ?auto_24330 ?auto_24303 ) ) ( HOIST-AT ?auto_24306 ?auto_24330 ) ( AVAILABLE ?auto_24306 ) ( SURFACE-AT ?auto_24296 ?auto_24330 ) ( ON ?auto_24296 ?auto_24325 ) ( CLEAR ?auto_24296 ) ( not ( = ?auto_24295 ?auto_24296 ) ) ( not ( = ?auto_24295 ?auto_24325 ) ) ( not ( = ?auto_24296 ?auto_24325 ) ) ( not ( = ?auto_24302 ?auto_24306 ) ) ( IS-CRATE ?auto_24295 ) ( not ( = ?auto_24315 ?auto_24303 ) ) ( HOIST-AT ?auto_24337 ?auto_24315 ) ( AVAILABLE ?auto_24337 ) ( SURFACE-AT ?auto_24295 ?auto_24315 ) ( ON ?auto_24295 ?auto_24322 ) ( CLEAR ?auto_24295 ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24322 ) ) ( not ( = ?auto_24295 ?auto_24322 ) ) ( not ( = ?auto_24302 ?auto_24337 ) ) ( IS-CRATE ?auto_24294 ) ( not ( = ?auto_24316 ?auto_24303 ) ) ( HOIST-AT ?auto_24333 ?auto_24316 ) ( AVAILABLE ?auto_24333 ) ( SURFACE-AT ?auto_24294 ?auto_24316 ) ( ON ?auto_24294 ?auto_24338 ) ( CLEAR ?auto_24294 ) ( not ( = ?auto_24293 ?auto_24294 ) ) ( not ( = ?auto_24293 ?auto_24338 ) ) ( not ( = ?auto_24294 ?auto_24338 ) ) ( not ( = ?auto_24302 ?auto_24333 ) ) ( IS-CRATE ?auto_24293 ) ( not ( = ?auto_24318 ?auto_24303 ) ) ( HOIST-AT ?auto_24332 ?auto_24318 ) ( AVAILABLE ?auto_24332 ) ( SURFACE-AT ?auto_24293 ?auto_24318 ) ( ON ?auto_24293 ?auto_24323 ) ( CLEAR ?auto_24293 ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( not ( = ?auto_24292 ?auto_24323 ) ) ( not ( = ?auto_24293 ?auto_24323 ) ) ( not ( = ?auto_24302 ?auto_24332 ) ) ( IS-CRATE ?auto_24292 ) ( not ( = ?auto_24309 ?auto_24303 ) ) ( HOIST-AT ?auto_24314 ?auto_24309 ) ( AVAILABLE ?auto_24314 ) ( SURFACE-AT ?auto_24292 ?auto_24309 ) ( ON ?auto_24292 ?auto_24320 ) ( CLEAR ?auto_24292 ) ( not ( = ?auto_24291 ?auto_24292 ) ) ( not ( = ?auto_24291 ?auto_24320 ) ) ( not ( = ?auto_24292 ?auto_24320 ) ) ( not ( = ?auto_24302 ?auto_24314 ) ) ( IS-CRATE ?auto_24291 ) ( not ( = ?auto_24305 ?auto_24303 ) ) ( HOIST-AT ?auto_24308 ?auto_24305 ) ( SURFACE-AT ?auto_24291 ?auto_24305 ) ( ON ?auto_24291 ?auto_24339 ) ( CLEAR ?auto_24291 ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24339 ) ) ( not ( = ?auto_24291 ?auto_24339 ) ) ( not ( = ?auto_24302 ?auto_24308 ) ) ( IS-CRATE ?auto_24290 ) ( AVAILABLE ?auto_24308 ) ( SURFACE-AT ?auto_24290 ?auto_24305 ) ( ON ?auto_24290 ?auto_24321 ) ( CLEAR ?auto_24290 ) ( not ( = ?auto_24289 ?auto_24290 ) ) ( not ( = ?auto_24289 ?auto_24321 ) ) ( not ( = ?auto_24290 ?auto_24321 ) ) ( IS-CRATE ?auto_24289 ) ( not ( = ?auto_24312 ?auto_24303 ) ) ( HOIST-AT ?auto_24327 ?auto_24312 ) ( AVAILABLE ?auto_24327 ) ( SURFACE-AT ?auto_24289 ?auto_24312 ) ( ON ?auto_24289 ?auto_24304 ) ( CLEAR ?auto_24289 ) ( not ( = ?auto_24288 ?auto_24289 ) ) ( not ( = ?auto_24288 ?auto_24304 ) ) ( not ( = ?auto_24289 ?auto_24304 ) ) ( not ( = ?auto_24302 ?auto_24327 ) ) ( IS-CRATE ?auto_24288 ) ( not ( = ?auto_24324 ?auto_24303 ) ) ( HOIST-AT ?auto_24335 ?auto_24324 ) ( AVAILABLE ?auto_24335 ) ( SURFACE-AT ?auto_24288 ?auto_24324 ) ( ON ?auto_24288 ?auto_24313 ) ( CLEAR ?auto_24288 ) ( not ( = ?auto_24287 ?auto_24288 ) ) ( not ( = ?auto_24287 ?auto_24313 ) ) ( not ( = ?auto_24288 ?auto_24313 ) ) ( not ( = ?auto_24302 ?auto_24335 ) ) ( IS-CRATE ?auto_24287 ) ( not ( = ?auto_24319 ?auto_24303 ) ) ( HOIST-AT ?auto_24307 ?auto_24319 ) ( AVAILABLE ?auto_24307 ) ( SURFACE-AT ?auto_24287 ?auto_24319 ) ( ON ?auto_24287 ?auto_24340 ) ( CLEAR ?auto_24287 ) ( not ( = ?auto_24286 ?auto_24287 ) ) ( not ( = ?auto_24286 ?auto_24340 ) ) ( not ( = ?auto_24287 ?auto_24340 ) ) ( not ( = ?auto_24302 ?auto_24307 ) ) ( IS-CRATE ?auto_24286 ) ( not ( = ?auto_24326 ?auto_24303 ) ) ( HOIST-AT ?auto_24317 ?auto_24326 ) ( AVAILABLE ?auto_24317 ) ( SURFACE-AT ?auto_24286 ?auto_24326 ) ( ON ?auto_24286 ?auto_24334 ) ( CLEAR ?auto_24286 ) ( not ( = ?auto_24285 ?auto_24286 ) ) ( not ( = ?auto_24285 ?auto_24334 ) ) ( not ( = ?auto_24286 ?auto_24334 ) ) ( not ( = ?auto_24302 ?auto_24317 ) ) ( IS-CRATE ?auto_24285 ) ( not ( = ?auto_24336 ?auto_24303 ) ) ( HOIST-AT ?auto_24310 ?auto_24336 ) ( AVAILABLE ?auto_24310 ) ( SURFACE-AT ?auto_24285 ?auto_24336 ) ( ON ?auto_24285 ?auto_24329 ) ( CLEAR ?auto_24285 ) ( not ( = ?auto_24284 ?auto_24285 ) ) ( not ( = ?auto_24284 ?auto_24329 ) ) ( not ( = ?auto_24285 ?auto_24329 ) ) ( not ( = ?auto_24302 ?auto_24310 ) ) ( SURFACE-AT ?auto_24283 ?auto_24303 ) ( CLEAR ?auto_24283 ) ( IS-CRATE ?auto_24284 ) ( AVAILABLE ?auto_24302 ) ( not ( = ?auto_24311 ?auto_24303 ) ) ( HOIST-AT ?auto_24328 ?auto_24311 ) ( AVAILABLE ?auto_24328 ) ( SURFACE-AT ?auto_24284 ?auto_24311 ) ( ON ?auto_24284 ?auto_24331 ) ( CLEAR ?auto_24284 ) ( TRUCK-AT ?auto_24298 ?auto_24303 ) ( not ( = ?auto_24283 ?auto_24284 ) ) ( not ( = ?auto_24283 ?auto_24331 ) ) ( not ( = ?auto_24284 ?auto_24331 ) ) ( not ( = ?auto_24302 ?auto_24328 ) ) ( not ( = ?auto_24283 ?auto_24285 ) ) ( not ( = ?auto_24283 ?auto_24329 ) ) ( not ( = ?auto_24285 ?auto_24331 ) ) ( not ( = ?auto_24336 ?auto_24311 ) ) ( not ( = ?auto_24310 ?auto_24328 ) ) ( not ( = ?auto_24329 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24286 ) ) ( not ( = ?auto_24283 ?auto_24334 ) ) ( not ( = ?auto_24284 ?auto_24286 ) ) ( not ( = ?auto_24284 ?auto_24334 ) ) ( not ( = ?auto_24286 ?auto_24329 ) ) ( not ( = ?auto_24286 ?auto_24331 ) ) ( not ( = ?auto_24326 ?auto_24336 ) ) ( not ( = ?auto_24326 ?auto_24311 ) ) ( not ( = ?auto_24317 ?auto_24310 ) ) ( not ( = ?auto_24317 ?auto_24328 ) ) ( not ( = ?auto_24334 ?auto_24329 ) ) ( not ( = ?auto_24334 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24287 ) ) ( not ( = ?auto_24283 ?auto_24340 ) ) ( not ( = ?auto_24284 ?auto_24287 ) ) ( not ( = ?auto_24284 ?auto_24340 ) ) ( not ( = ?auto_24285 ?auto_24287 ) ) ( not ( = ?auto_24285 ?auto_24340 ) ) ( not ( = ?auto_24287 ?auto_24334 ) ) ( not ( = ?auto_24287 ?auto_24329 ) ) ( not ( = ?auto_24287 ?auto_24331 ) ) ( not ( = ?auto_24319 ?auto_24326 ) ) ( not ( = ?auto_24319 ?auto_24336 ) ) ( not ( = ?auto_24319 ?auto_24311 ) ) ( not ( = ?auto_24307 ?auto_24317 ) ) ( not ( = ?auto_24307 ?auto_24310 ) ) ( not ( = ?auto_24307 ?auto_24328 ) ) ( not ( = ?auto_24340 ?auto_24334 ) ) ( not ( = ?auto_24340 ?auto_24329 ) ) ( not ( = ?auto_24340 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24288 ) ) ( not ( = ?auto_24283 ?auto_24313 ) ) ( not ( = ?auto_24284 ?auto_24288 ) ) ( not ( = ?auto_24284 ?auto_24313 ) ) ( not ( = ?auto_24285 ?auto_24288 ) ) ( not ( = ?auto_24285 ?auto_24313 ) ) ( not ( = ?auto_24286 ?auto_24288 ) ) ( not ( = ?auto_24286 ?auto_24313 ) ) ( not ( = ?auto_24288 ?auto_24340 ) ) ( not ( = ?auto_24288 ?auto_24334 ) ) ( not ( = ?auto_24288 ?auto_24329 ) ) ( not ( = ?auto_24288 ?auto_24331 ) ) ( not ( = ?auto_24324 ?auto_24319 ) ) ( not ( = ?auto_24324 ?auto_24326 ) ) ( not ( = ?auto_24324 ?auto_24336 ) ) ( not ( = ?auto_24324 ?auto_24311 ) ) ( not ( = ?auto_24335 ?auto_24307 ) ) ( not ( = ?auto_24335 ?auto_24317 ) ) ( not ( = ?auto_24335 ?auto_24310 ) ) ( not ( = ?auto_24335 ?auto_24328 ) ) ( not ( = ?auto_24313 ?auto_24340 ) ) ( not ( = ?auto_24313 ?auto_24334 ) ) ( not ( = ?auto_24313 ?auto_24329 ) ) ( not ( = ?auto_24313 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24289 ) ) ( not ( = ?auto_24283 ?auto_24304 ) ) ( not ( = ?auto_24284 ?auto_24289 ) ) ( not ( = ?auto_24284 ?auto_24304 ) ) ( not ( = ?auto_24285 ?auto_24289 ) ) ( not ( = ?auto_24285 ?auto_24304 ) ) ( not ( = ?auto_24286 ?auto_24289 ) ) ( not ( = ?auto_24286 ?auto_24304 ) ) ( not ( = ?auto_24287 ?auto_24289 ) ) ( not ( = ?auto_24287 ?auto_24304 ) ) ( not ( = ?auto_24289 ?auto_24313 ) ) ( not ( = ?auto_24289 ?auto_24340 ) ) ( not ( = ?auto_24289 ?auto_24334 ) ) ( not ( = ?auto_24289 ?auto_24329 ) ) ( not ( = ?auto_24289 ?auto_24331 ) ) ( not ( = ?auto_24312 ?auto_24324 ) ) ( not ( = ?auto_24312 ?auto_24319 ) ) ( not ( = ?auto_24312 ?auto_24326 ) ) ( not ( = ?auto_24312 ?auto_24336 ) ) ( not ( = ?auto_24312 ?auto_24311 ) ) ( not ( = ?auto_24327 ?auto_24335 ) ) ( not ( = ?auto_24327 ?auto_24307 ) ) ( not ( = ?auto_24327 ?auto_24317 ) ) ( not ( = ?auto_24327 ?auto_24310 ) ) ( not ( = ?auto_24327 ?auto_24328 ) ) ( not ( = ?auto_24304 ?auto_24313 ) ) ( not ( = ?auto_24304 ?auto_24340 ) ) ( not ( = ?auto_24304 ?auto_24334 ) ) ( not ( = ?auto_24304 ?auto_24329 ) ) ( not ( = ?auto_24304 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24290 ) ) ( not ( = ?auto_24283 ?auto_24321 ) ) ( not ( = ?auto_24284 ?auto_24290 ) ) ( not ( = ?auto_24284 ?auto_24321 ) ) ( not ( = ?auto_24285 ?auto_24290 ) ) ( not ( = ?auto_24285 ?auto_24321 ) ) ( not ( = ?auto_24286 ?auto_24290 ) ) ( not ( = ?auto_24286 ?auto_24321 ) ) ( not ( = ?auto_24287 ?auto_24290 ) ) ( not ( = ?auto_24287 ?auto_24321 ) ) ( not ( = ?auto_24288 ?auto_24290 ) ) ( not ( = ?auto_24288 ?auto_24321 ) ) ( not ( = ?auto_24290 ?auto_24304 ) ) ( not ( = ?auto_24290 ?auto_24313 ) ) ( not ( = ?auto_24290 ?auto_24340 ) ) ( not ( = ?auto_24290 ?auto_24334 ) ) ( not ( = ?auto_24290 ?auto_24329 ) ) ( not ( = ?auto_24290 ?auto_24331 ) ) ( not ( = ?auto_24305 ?auto_24312 ) ) ( not ( = ?auto_24305 ?auto_24324 ) ) ( not ( = ?auto_24305 ?auto_24319 ) ) ( not ( = ?auto_24305 ?auto_24326 ) ) ( not ( = ?auto_24305 ?auto_24336 ) ) ( not ( = ?auto_24305 ?auto_24311 ) ) ( not ( = ?auto_24308 ?auto_24327 ) ) ( not ( = ?auto_24308 ?auto_24335 ) ) ( not ( = ?auto_24308 ?auto_24307 ) ) ( not ( = ?auto_24308 ?auto_24317 ) ) ( not ( = ?auto_24308 ?auto_24310 ) ) ( not ( = ?auto_24308 ?auto_24328 ) ) ( not ( = ?auto_24321 ?auto_24304 ) ) ( not ( = ?auto_24321 ?auto_24313 ) ) ( not ( = ?auto_24321 ?auto_24340 ) ) ( not ( = ?auto_24321 ?auto_24334 ) ) ( not ( = ?auto_24321 ?auto_24329 ) ) ( not ( = ?auto_24321 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24291 ) ) ( not ( = ?auto_24283 ?auto_24339 ) ) ( not ( = ?auto_24284 ?auto_24291 ) ) ( not ( = ?auto_24284 ?auto_24339 ) ) ( not ( = ?auto_24285 ?auto_24291 ) ) ( not ( = ?auto_24285 ?auto_24339 ) ) ( not ( = ?auto_24286 ?auto_24291 ) ) ( not ( = ?auto_24286 ?auto_24339 ) ) ( not ( = ?auto_24287 ?auto_24291 ) ) ( not ( = ?auto_24287 ?auto_24339 ) ) ( not ( = ?auto_24288 ?auto_24291 ) ) ( not ( = ?auto_24288 ?auto_24339 ) ) ( not ( = ?auto_24289 ?auto_24291 ) ) ( not ( = ?auto_24289 ?auto_24339 ) ) ( not ( = ?auto_24291 ?auto_24321 ) ) ( not ( = ?auto_24291 ?auto_24304 ) ) ( not ( = ?auto_24291 ?auto_24313 ) ) ( not ( = ?auto_24291 ?auto_24340 ) ) ( not ( = ?auto_24291 ?auto_24334 ) ) ( not ( = ?auto_24291 ?auto_24329 ) ) ( not ( = ?auto_24291 ?auto_24331 ) ) ( not ( = ?auto_24339 ?auto_24321 ) ) ( not ( = ?auto_24339 ?auto_24304 ) ) ( not ( = ?auto_24339 ?auto_24313 ) ) ( not ( = ?auto_24339 ?auto_24340 ) ) ( not ( = ?auto_24339 ?auto_24334 ) ) ( not ( = ?auto_24339 ?auto_24329 ) ) ( not ( = ?auto_24339 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24292 ) ) ( not ( = ?auto_24283 ?auto_24320 ) ) ( not ( = ?auto_24284 ?auto_24292 ) ) ( not ( = ?auto_24284 ?auto_24320 ) ) ( not ( = ?auto_24285 ?auto_24292 ) ) ( not ( = ?auto_24285 ?auto_24320 ) ) ( not ( = ?auto_24286 ?auto_24292 ) ) ( not ( = ?auto_24286 ?auto_24320 ) ) ( not ( = ?auto_24287 ?auto_24292 ) ) ( not ( = ?auto_24287 ?auto_24320 ) ) ( not ( = ?auto_24288 ?auto_24292 ) ) ( not ( = ?auto_24288 ?auto_24320 ) ) ( not ( = ?auto_24289 ?auto_24292 ) ) ( not ( = ?auto_24289 ?auto_24320 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24290 ?auto_24320 ) ) ( not ( = ?auto_24292 ?auto_24339 ) ) ( not ( = ?auto_24292 ?auto_24321 ) ) ( not ( = ?auto_24292 ?auto_24304 ) ) ( not ( = ?auto_24292 ?auto_24313 ) ) ( not ( = ?auto_24292 ?auto_24340 ) ) ( not ( = ?auto_24292 ?auto_24334 ) ) ( not ( = ?auto_24292 ?auto_24329 ) ) ( not ( = ?auto_24292 ?auto_24331 ) ) ( not ( = ?auto_24309 ?auto_24305 ) ) ( not ( = ?auto_24309 ?auto_24312 ) ) ( not ( = ?auto_24309 ?auto_24324 ) ) ( not ( = ?auto_24309 ?auto_24319 ) ) ( not ( = ?auto_24309 ?auto_24326 ) ) ( not ( = ?auto_24309 ?auto_24336 ) ) ( not ( = ?auto_24309 ?auto_24311 ) ) ( not ( = ?auto_24314 ?auto_24308 ) ) ( not ( = ?auto_24314 ?auto_24327 ) ) ( not ( = ?auto_24314 ?auto_24335 ) ) ( not ( = ?auto_24314 ?auto_24307 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24310 ) ) ( not ( = ?auto_24314 ?auto_24328 ) ) ( not ( = ?auto_24320 ?auto_24339 ) ) ( not ( = ?auto_24320 ?auto_24321 ) ) ( not ( = ?auto_24320 ?auto_24304 ) ) ( not ( = ?auto_24320 ?auto_24313 ) ) ( not ( = ?auto_24320 ?auto_24340 ) ) ( not ( = ?auto_24320 ?auto_24334 ) ) ( not ( = ?auto_24320 ?auto_24329 ) ) ( not ( = ?auto_24320 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24293 ) ) ( not ( = ?auto_24283 ?auto_24323 ) ) ( not ( = ?auto_24284 ?auto_24293 ) ) ( not ( = ?auto_24284 ?auto_24323 ) ) ( not ( = ?auto_24285 ?auto_24293 ) ) ( not ( = ?auto_24285 ?auto_24323 ) ) ( not ( = ?auto_24286 ?auto_24293 ) ) ( not ( = ?auto_24286 ?auto_24323 ) ) ( not ( = ?auto_24287 ?auto_24293 ) ) ( not ( = ?auto_24287 ?auto_24323 ) ) ( not ( = ?auto_24288 ?auto_24293 ) ) ( not ( = ?auto_24288 ?auto_24323 ) ) ( not ( = ?auto_24289 ?auto_24293 ) ) ( not ( = ?auto_24289 ?auto_24323 ) ) ( not ( = ?auto_24290 ?auto_24293 ) ) ( not ( = ?auto_24290 ?auto_24323 ) ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( not ( = ?auto_24291 ?auto_24323 ) ) ( not ( = ?auto_24293 ?auto_24320 ) ) ( not ( = ?auto_24293 ?auto_24339 ) ) ( not ( = ?auto_24293 ?auto_24321 ) ) ( not ( = ?auto_24293 ?auto_24304 ) ) ( not ( = ?auto_24293 ?auto_24313 ) ) ( not ( = ?auto_24293 ?auto_24340 ) ) ( not ( = ?auto_24293 ?auto_24334 ) ) ( not ( = ?auto_24293 ?auto_24329 ) ) ( not ( = ?auto_24293 ?auto_24331 ) ) ( not ( = ?auto_24318 ?auto_24309 ) ) ( not ( = ?auto_24318 ?auto_24305 ) ) ( not ( = ?auto_24318 ?auto_24312 ) ) ( not ( = ?auto_24318 ?auto_24324 ) ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24326 ) ) ( not ( = ?auto_24318 ?auto_24336 ) ) ( not ( = ?auto_24318 ?auto_24311 ) ) ( not ( = ?auto_24332 ?auto_24314 ) ) ( not ( = ?auto_24332 ?auto_24308 ) ) ( not ( = ?auto_24332 ?auto_24327 ) ) ( not ( = ?auto_24332 ?auto_24335 ) ) ( not ( = ?auto_24332 ?auto_24307 ) ) ( not ( = ?auto_24332 ?auto_24317 ) ) ( not ( = ?auto_24332 ?auto_24310 ) ) ( not ( = ?auto_24332 ?auto_24328 ) ) ( not ( = ?auto_24323 ?auto_24320 ) ) ( not ( = ?auto_24323 ?auto_24339 ) ) ( not ( = ?auto_24323 ?auto_24321 ) ) ( not ( = ?auto_24323 ?auto_24304 ) ) ( not ( = ?auto_24323 ?auto_24313 ) ) ( not ( = ?auto_24323 ?auto_24340 ) ) ( not ( = ?auto_24323 ?auto_24334 ) ) ( not ( = ?auto_24323 ?auto_24329 ) ) ( not ( = ?auto_24323 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24294 ) ) ( not ( = ?auto_24283 ?auto_24338 ) ) ( not ( = ?auto_24284 ?auto_24294 ) ) ( not ( = ?auto_24284 ?auto_24338 ) ) ( not ( = ?auto_24285 ?auto_24294 ) ) ( not ( = ?auto_24285 ?auto_24338 ) ) ( not ( = ?auto_24286 ?auto_24294 ) ) ( not ( = ?auto_24286 ?auto_24338 ) ) ( not ( = ?auto_24287 ?auto_24294 ) ) ( not ( = ?auto_24287 ?auto_24338 ) ) ( not ( = ?auto_24288 ?auto_24294 ) ) ( not ( = ?auto_24288 ?auto_24338 ) ) ( not ( = ?auto_24289 ?auto_24294 ) ) ( not ( = ?auto_24289 ?auto_24338 ) ) ( not ( = ?auto_24290 ?auto_24294 ) ) ( not ( = ?auto_24290 ?auto_24338 ) ) ( not ( = ?auto_24291 ?auto_24294 ) ) ( not ( = ?auto_24291 ?auto_24338 ) ) ( not ( = ?auto_24292 ?auto_24294 ) ) ( not ( = ?auto_24292 ?auto_24338 ) ) ( not ( = ?auto_24294 ?auto_24323 ) ) ( not ( = ?auto_24294 ?auto_24320 ) ) ( not ( = ?auto_24294 ?auto_24339 ) ) ( not ( = ?auto_24294 ?auto_24321 ) ) ( not ( = ?auto_24294 ?auto_24304 ) ) ( not ( = ?auto_24294 ?auto_24313 ) ) ( not ( = ?auto_24294 ?auto_24340 ) ) ( not ( = ?auto_24294 ?auto_24334 ) ) ( not ( = ?auto_24294 ?auto_24329 ) ) ( not ( = ?auto_24294 ?auto_24331 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24309 ) ) ( not ( = ?auto_24316 ?auto_24305 ) ) ( not ( = ?auto_24316 ?auto_24312 ) ) ( not ( = ?auto_24316 ?auto_24324 ) ) ( not ( = ?auto_24316 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24326 ) ) ( not ( = ?auto_24316 ?auto_24336 ) ) ( not ( = ?auto_24316 ?auto_24311 ) ) ( not ( = ?auto_24333 ?auto_24332 ) ) ( not ( = ?auto_24333 ?auto_24314 ) ) ( not ( = ?auto_24333 ?auto_24308 ) ) ( not ( = ?auto_24333 ?auto_24327 ) ) ( not ( = ?auto_24333 ?auto_24335 ) ) ( not ( = ?auto_24333 ?auto_24307 ) ) ( not ( = ?auto_24333 ?auto_24317 ) ) ( not ( = ?auto_24333 ?auto_24310 ) ) ( not ( = ?auto_24333 ?auto_24328 ) ) ( not ( = ?auto_24338 ?auto_24323 ) ) ( not ( = ?auto_24338 ?auto_24320 ) ) ( not ( = ?auto_24338 ?auto_24339 ) ) ( not ( = ?auto_24338 ?auto_24321 ) ) ( not ( = ?auto_24338 ?auto_24304 ) ) ( not ( = ?auto_24338 ?auto_24313 ) ) ( not ( = ?auto_24338 ?auto_24340 ) ) ( not ( = ?auto_24338 ?auto_24334 ) ) ( not ( = ?auto_24338 ?auto_24329 ) ) ( not ( = ?auto_24338 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24295 ) ) ( not ( = ?auto_24283 ?auto_24322 ) ) ( not ( = ?auto_24284 ?auto_24295 ) ) ( not ( = ?auto_24284 ?auto_24322 ) ) ( not ( = ?auto_24285 ?auto_24295 ) ) ( not ( = ?auto_24285 ?auto_24322 ) ) ( not ( = ?auto_24286 ?auto_24295 ) ) ( not ( = ?auto_24286 ?auto_24322 ) ) ( not ( = ?auto_24287 ?auto_24295 ) ) ( not ( = ?auto_24287 ?auto_24322 ) ) ( not ( = ?auto_24288 ?auto_24295 ) ) ( not ( = ?auto_24288 ?auto_24322 ) ) ( not ( = ?auto_24289 ?auto_24295 ) ) ( not ( = ?auto_24289 ?auto_24322 ) ) ( not ( = ?auto_24290 ?auto_24295 ) ) ( not ( = ?auto_24290 ?auto_24322 ) ) ( not ( = ?auto_24291 ?auto_24295 ) ) ( not ( = ?auto_24291 ?auto_24322 ) ) ( not ( = ?auto_24292 ?auto_24295 ) ) ( not ( = ?auto_24292 ?auto_24322 ) ) ( not ( = ?auto_24293 ?auto_24295 ) ) ( not ( = ?auto_24293 ?auto_24322 ) ) ( not ( = ?auto_24295 ?auto_24338 ) ) ( not ( = ?auto_24295 ?auto_24323 ) ) ( not ( = ?auto_24295 ?auto_24320 ) ) ( not ( = ?auto_24295 ?auto_24339 ) ) ( not ( = ?auto_24295 ?auto_24321 ) ) ( not ( = ?auto_24295 ?auto_24304 ) ) ( not ( = ?auto_24295 ?auto_24313 ) ) ( not ( = ?auto_24295 ?auto_24340 ) ) ( not ( = ?auto_24295 ?auto_24334 ) ) ( not ( = ?auto_24295 ?auto_24329 ) ) ( not ( = ?auto_24295 ?auto_24331 ) ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24318 ) ) ( not ( = ?auto_24315 ?auto_24309 ) ) ( not ( = ?auto_24315 ?auto_24305 ) ) ( not ( = ?auto_24315 ?auto_24312 ) ) ( not ( = ?auto_24315 ?auto_24324 ) ) ( not ( = ?auto_24315 ?auto_24319 ) ) ( not ( = ?auto_24315 ?auto_24326 ) ) ( not ( = ?auto_24315 ?auto_24336 ) ) ( not ( = ?auto_24315 ?auto_24311 ) ) ( not ( = ?auto_24337 ?auto_24333 ) ) ( not ( = ?auto_24337 ?auto_24332 ) ) ( not ( = ?auto_24337 ?auto_24314 ) ) ( not ( = ?auto_24337 ?auto_24308 ) ) ( not ( = ?auto_24337 ?auto_24327 ) ) ( not ( = ?auto_24337 ?auto_24335 ) ) ( not ( = ?auto_24337 ?auto_24307 ) ) ( not ( = ?auto_24337 ?auto_24317 ) ) ( not ( = ?auto_24337 ?auto_24310 ) ) ( not ( = ?auto_24337 ?auto_24328 ) ) ( not ( = ?auto_24322 ?auto_24338 ) ) ( not ( = ?auto_24322 ?auto_24323 ) ) ( not ( = ?auto_24322 ?auto_24320 ) ) ( not ( = ?auto_24322 ?auto_24339 ) ) ( not ( = ?auto_24322 ?auto_24321 ) ) ( not ( = ?auto_24322 ?auto_24304 ) ) ( not ( = ?auto_24322 ?auto_24313 ) ) ( not ( = ?auto_24322 ?auto_24340 ) ) ( not ( = ?auto_24322 ?auto_24334 ) ) ( not ( = ?auto_24322 ?auto_24329 ) ) ( not ( = ?auto_24322 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24296 ) ) ( not ( = ?auto_24283 ?auto_24325 ) ) ( not ( = ?auto_24284 ?auto_24296 ) ) ( not ( = ?auto_24284 ?auto_24325 ) ) ( not ( = ?auto_24285 ?auto_24296 ) ) ( not ( = ?auto_24285 ?auto_24325 ) ) ( not ( = ?auto_24286 ?auto_24296 ) ) ( not ( = ?auto_24286 ?auto_24325 ) ) ( not ( = ?auto_24287 ?auto_24296 ) ) ( not ( = ?auto_24287 ?auto_24325 ) ) ( not ( = ?auto_24288 ?auto_24296 ) ) ( not ( = ?auto_24288 ?auto_24325 ) ) ( not ( = ?auto_24289 ?auto_24296 ) ) ( not ( = ?auto_24289 ?auto_24325 ) ) ( not ( = ?auto_24290 ?auto_24296 ) ) ( not ( = ?auto_24290 ?auto_24325 ) ) ( not ( = ?auto_24291 ?auto_24296 ) ) ( not ( = ?auto_24291 ?auto_24325 ) ) ( not ( = ?auto_24292 ?auto_24296 ) ) ( not ( = ?auto_24292 ?auto_24325 ) ) ( not ( = ?auto_24293 ?auto_24296 ) ) ( not ( = ?auto_24293 ?auto_24325 ) ) ( not ( = ?auto_24294 ?auto_24296 ) ) ( not ( = ?auto_24294 ?auto_24325 ) ) ( not ( = ?auto_24296 ?auto_24322 ) ) ( not ( = ?auto_24296 ?auto_24338 ) ) ( not ( = ?auto_24296 ?auto_24323 ) ) ( not ( = ?auto_24296 ?auto_24320 ) ) ( not ( = ?auto_24296 ?auto_24339 ) ) ( not ( = ?auto_24296 ?auto_24321 ) ) ( not ( = ?auto_24296 ?auto_24304 ) ) ( not ( = ?auto_24296 ?auto_24313 ) ) ( not ( = ?auto_24296 ?auto_24340 ) ) ( not ( = ?auto_24296 ?auto_24334 ) ) ( not ( = ?auto_24296 ?auto_24329 ) ) ( not ( = ?auto_24296 ?auto_24331 ) ) ( not ( = ?auto_24330 ?auto_24315 ) ) ( not ( = ?auto_24330 ?auto_24316 ) ) ( not ( = ?auto_24330 ?auto_24318 ) ) ( not ( = ?auto_24330 ?auto_24309 ) ) ( not ( = ?auto_24330 ?auto_24305 ) ) ( not ( = ?auto_24330 ?auto_24312 ) ) ( not ( = ?auto_24330 ?auto_24324 ) ) ( not ( = ?auto_24330 ?auto_24319 ) ) ( not ( = ?auto_24330 ?auto_24326 ) ) ( not ( = ?auto_24330 ?auto_24336 ) ) ( not ( = ?auto_24330 ?auto_24311 ) ) ( not ( = ?auto_24306 ?auto_24337 ) ) ( not ( = ?auto_24306 ?auto_24333 ) ) ( not ( = ?auto_24306 ?auto_24332 ) ) ( not ( = ?auto_24306 ?auto_24314 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( not ( = ?auto_24306 ?auto_24327 ) ) ( not ( = ?auto_24306 ?auto_24335 ) ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24317 ) ) ( not ( = ?auto_24306 ?auto_24310 ) ) ( not ( = ?auto_24306 ?auto_24328 ) ) ( not ( = ?auto_24325 ?auto_24322 ) ) ( not ( = ?auto_24325 ?auto_24338 ) ) ( not ( = ?auto_24325 ?auto_24323 ) ) ( not ( = ?auto_24325 ?auto_24320 ) ) ( not ( = ?auto_24325 ?auto_24339 ) ) ( not ( = ?auto_24325 ?auto_24321 ) ) ( not ( = ?auto_24325 ?auto_24304 ) ) ( not ( = ?auto_24325 ?auto_24313 ) ) ( not ( = ?auto_24325 ?auto_24340 ) ) ( not ( = ?auto_24325 ?auto_24334 ) ) ( not ( = ?auto_24325 ?auto_24329 ) ) ( not ( = ?auto_24325 ?auto_24331 ) ) ( not ( = ?auto_24283 ?auto_24297 ) ) ( not ( = ?auto_24283 ?auto_24301 ) ) ( not ( = ?auto_24284 ?auto_24297 ) ) ( not ( = ?auto_24284 ?auto_24301 ) ) ( not ( = ?auto_24285 ?auto_24297 ) ) ( not ( = ?auto_24285 ?auto_24301 ) ) ( not ( = ?auto_24286 ?auto_24297 ) ) ( not ( = ?auto_24286 ?auto_24301 ) ) ( not ( = ?auto_24287 ?auto_24297 ) ) ( not ( = ?auto_24287 ?auto_24301 ) ) ( not ( = ?auto_24288 ?auto_24297 ) ) ( not ( = ?auto_24288 ?auto_24301 ) ) ( not ( = ?auto_24289 ?auto_24297 ) ) ( not ( = ?auto_24289 ?auto_24301 ) ) ( not ( = ?auto_24290 ?auto_24297 ) ) ( not ( = ?auto_24290 ?auto_24301 ) ) ( not ( = ?auto_24291 ?auto_24297 ) ) ( not ( = ?auto_24291 ?auto_24301 ) ) ( not ( = ?auto_24292 ?auto_24297 ) ) ( not ( = ?auto_24292 ?auto_24301 ) ) ( not ( = ?auto_24293 ?auto_24297 ) ) ( not ( = ?auto_24293 ?auto_24301 ) ) ( not ( = ?auto_24294 ?auto_24297 ) ) ( not ( = ?auto_24294 ?auto_24301 ) ) ( not ( = ?auto_24295 ?auto_24297 ) ) ( not ( = ?auto_24295 ?auto_24301 ) ) ( not ( = ?auto_24297 ?auto_24325 ) ) ( not ( = ?auto_24297 ?auto_24322 ) ) ( not ( = ?auto_24297 ?auto_24338 ) ) ( not ( = ?auto_24297 ?auto_24323 ) ) ( not ( = ?auto_24297 ?auto_24320 ) ) ( not ( = ?auto_24297 ?auto_24339 ) ) ( not ( = ?auto_24297 ?auto_24321 ) ) ( not ( = ?auto_24297 ?auto_24304 ) ) ( not ( = ?auto_24297 ?auto_24313 ) ) ( not ( = ?auto_24297 ?auto_24340 ) ) ( not ( = ?auto_24297 ?auto_24334 ) ) ( not ( = ?auto_24297 ?auto_24329 ) ) ( not ( = ?auto_24297 ?auto_24331 ) ) ( not ( = ?auto_24299 ?auto_24330 ) ) ( not ( = ?auto_24299 ?auto_24315 ) ) ( not ( = ?auto_24299 ?auto_24316 ) ) ( not ( = ?auto_24299 ?auto_24318 ) ) ( not ( = ?auto_24299 ?auto_24309 ) ) ( not ( = ?auto_24299 ?auto_24305 ) ) ( not ( = ?auto_24299 ?auto_24312 ) ) ( not ( = ?auto_24299 ?auto_24324 ) ) ( not ( = ?auto_24299 ?auto_24319 ) ) ( not ( = ?auto_24299 ?auto_24326 ) ) ( not ( = ?auto_24299 ?auto_24336 ) ) ( not ( = ?auto_24299 ?auto_24311 ) ) ( not ( = ?auto_24300 ?auto_24306 ) ) ( not ( = ?auto_24300 ?auto_24337 ) ) ( not ( = ?auto_24300 ?auto_24333 ) ) ( not ( = ?auto_24300 ?auto_24332 ) ) ( not ( = ?auto_24300 ?auto_24314 ) ) ( not ( = ?auto_24300 ?auto_24308 ) ) ( not ( = ?auto_24300 ?auto_24327 ) ) ( not ( = ?auto_24300 ?auto_24335 ) ) ( not ( = ?auto_24300 ?auto_24307 ) ) ( not ( = ?auto_24300 ?auto_24317 ) ) ( not ( = ?auto_24300 ?auto_24310 ) ) ( not ( = ?auto_24300 ?auto_24328 ) ) ( not ( = ?auto_24301 ?auto_24325 ) ) ( not ( = ?auto_24301 ?auto_24322 ) ) ( not ( = ?auto_24301 ?auto_24338 ) ) ( not ( = ?auto_24301 ?auto_24323 ) ) ( not ( = ?auto_24301 ?auto_24320 ) ) ( not ( = ?auto_24301 ?auto_24339 ) ) ( not ( = ?auto_24301 ?auto_24321 ) ) ( not ( = ?auto_24301 ?auto_24304 ) ) ( not ( = ?auto_24301 ?auto_24313 ) ) ( not ( = ?auto_24301 ?auto_24340 ) ) ( not ( = ?auto_24301 ?auto_24334 ) ) ( not ( = ?auto_24301 ?auto_24329 ) ) ( not ( = ?auto_24301 ?auto_24331 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_24283 ?auto_24284 ?auto_24285 ?auto_24286 ?auto_24287 ?auto_24288 ?auto_24289 ?auto_24290 ?auto_24291 ?auto_24292 ?auto_24293 ?auto_24294 ?auto_24295 ?auto_24296 )
      ( MAKE-1CRATE ?auto_24296 ?auto_24297 )
      ( MAKE-14CRATE-VERIFY ?auto_24283 ?auto_24284 ?auto_24285 ?auto_24286 ?auto_24287 ?auto_24288 ?auto_24289 ?auto_24290 ?auto_24291 ?auto_24292 ?auto_24293 ?auto_24294 ?auto_24295 ?auto_24296 ?auto_24297 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_24367 - SURFACE
      ?auto_24368 - SURFACE
      ?auto_24369 - SURFACE
      ?auto_24370 - SURFACE
      ?auto_24371 - SURFACE
      ?auto_24372 - SURFACE
      ?auto_24373 - SURFACE
      ?auto_24374 - SURFACE
      ?auto_24375 - SURFACE
      ?auto_24376 - SURFACE
      ?auto_24377 - SURFACE
      ?auto_24378 - SURFACE
      ?auto_24379 - SURFACE
      ?auto_24380 - SURFACE
      ?auto_24381 - SURFACE
      ?auto_24382 - SURFACE
    )
    :vars
    (
      ?auto_24386 - HOIST
      ?auto_24383 - PLACE
      ?auto_24384 - PLACE
      ?auto_24387 - HOIST
      ?auto_24385 - SURFACE
      ?auto_24398 - PLACE
      ?auto_24408 - HOIST
      ?auto_24420 - SURFACE
      ?auto_24407 - PLACE
      ?auto_24410 - HOIST
      ?auto_24416 - SURFACE
      ?auto_24400 - PLACE
      ?auto_24426 - HOIST
      ?auto_24424 - SURFACE
      ?auto_24393 - PLACE
      ?auto_24397 - HOIST
      ?auto_24404 - SURFACE
      ?auto_24415 - PLACE
      ?auto_24406 - HOIST
      ?auto_24423 - SURFACE
      ?auto_24389 - PLACE
      ?auto_24391 - HOIST
      ?auto_24411 - SURFACE
      ?auto_24421 - PLACE
      ?auto_24417 - HOIST
      ?auto_24409 - SURFACE
      ?auto_24419 - SURFACE
      ?auto_24412 - PLACE
      ?auto_24399 - HOIST
      ?auto_24394 - SURFACE
      ?auto_24392 - PLACE
      ?auto_24395 - HOIST
      ?auto_24414 - SURFACE
      ?auto_24401 - PLACE
      ?auto_24402 - HOIST
      ?auto_24403 - SURFACE
      ?auto_24390 - SURFACE
      ?auto_24396 - PLACE
      ?auto_24413 - HOIST
      ?auto_24405 - SURFACE
      ?auto_24422 - PLACE
      ?auto_24425 - HOIST
      ?auto_24418 - SURFACE
      ?auto_24388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24386 ?auto_24383 ) ( IS-CRATE ?auto_24382 ) ( not ( = ?auto_24384 ?auto_24383 ) ) ( HOIST-AT ?auto_24387 ?auto_24384 ) ( SURFACE-AT ?auto_24382 ?auto_24384 ) ( ON ?auto_24382 ?auto_24385 ) ( CLEAR ?auto_24382 ) ( not ( = ?auto_24381 ?auto_24382 ) ) ( not ( = ?auto_24381 ?auto_24385 ) ) ( not ( = ?auto_24382 ?auto_24385 ) ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( IS-CRATE ?auto_24381 ) ( not ( = ?auto_24398 ?auto_24383 ) ) ( HOIST-AT ?auto_24408 ?auto_24398 ) ( AVAILABLE ?auto_24408 ) ( SURFACE-AT ?auto_24381 ?auto_24398 ) ( ON ?auto_24381 ?auto_24420 ) ( CLEAR ?auto_24381 ) ( not ( = ?auto_24380 ?auto_24381 ) ) ( not ( = ?auto_24380 ?auto_24420 ) ) ( not ( = ?auto_24381 ?auto_24420 ) ) ( not ( = ?auto_24386 ?auto_24408 ) ) ( IS-CRATE ?auto_24380 ) ( not ( = ?auto_24407 ?auto_24383 ) ) ( HOIST-AT ?auto_24410 ?auto_24407 ) ( AVAILABLE ?auto_24410 ) ( SURFACE-AT ?auto_24380 ?auto_24407 ) ( ON ?auto_24380 ?auto_24416 ) ( CLEAR ?auto_24380 ) ( not ( = ?auto_24379 ?auto_24380 ) ) ( not ( = ?auto_24379 ?auto_24416 ) ) ( not ( = ?auto_24380 ?auto_24416 ) ) ( not ( = ?auto_24386 ?auto_24410 ) ) ( IS-CRATE ?auto_24379 ) ( not ( = ?auto_24400 ?auto_24383 ) ) ( HOIST-AT ?auto_24426 ?auto_24400 ) ( AVAILABLE ?auto_24426 ) ( SURFACE-AT ?auto_24379 ?auto_24400 ) ( ON ?auto_24379 ?auto_24424 ) ( CLEAR ?auto_24379 ) ( not ( = ?auto_24378 ?auto_24379 ) ) ( not ( = ?auto_24378 ?auto_24424 ) ) ( not ( = ?auto_24379 ?auto_24424 ) ) ( not ( = ?auto_24386 ?auto_24426 ) ) ( IS-CRATE ?auto_24378 ) ( not ( = ?auto_24393 ?auto_24383 ) ) ( HOIST-AT ?auto_24397 ?auto_24393 ) ( AVAILABLE ?auto_24397 ) ( SURFACE-AT ?auto_24378 ?auto_24393 ) ( ON ?auto_24378 ?auto_24404 ) ( CLEAR ?auto_24378 ) ( not ( = ?auto_24377 ?auto_24378 ) ) ( not ( = ?auto_24377 ?auto_24404 ) ) ( not ( = ?auto_24378 ?auto_24404 ) ) ( not ( = ?auto_24386 ?auto_24397 ) ) ( IS-CRATE ?auto_24377 ) ( not ( = ?auto_24415 ?auto_24383 ) ) ( HOIST-AT ?auto_24406 ?auto_24415 ) ( AVAILABLE ?auto_24406 ) ( SURFACE-AT ?auto_24377 ?auto_24415 ) ( ON ?auto_24377 ?auto_24423 ) ( CLEAR ?auto_24377 ) ( not ( = ?auto_24376 ?auto_24377 ) ) ( not ( = ?auto_24376 ?auto_24423 ) ) ( not ( = ?auto_24377 ?auto_24423 ) ) ( not ( = ?auto_24386 ?auto_24406 ) ) ( IS-CRATE ?auto_24376 ) ( not ( = ?auto_24389 ?auto_24383 ) ) ( HOIST-AT ?auto_24391 ?auto_24389 ) ( AVAILABLE ?auto_24391 ) ( SURFACE-AT ?auto_24376 ?auto_24389 ) ( ON ?auto_24376 ?auto_24411 ) ( CLEAR ?auto_24376 ) ( not ( = ?auto_24375 ?auto_24376 ) ) ( not ( = ?auto_24375 ?auto_24411 ) ) ( not ( = ?auto_24376 ?auto_24411 ) ) ( not ( = ?auto_24386 ?auto_24391 ) ) ( IS-CRATE ?auto_24375 ) ( not ( = ?auto_24421 ?auto_24383 ) ) ( HOIST-AT ?auto_24417 ?auto_24421 ) ( SURFACE-AT ?auto_24375 ?auto_24421 ) ( ON ?auto_24375 ?auto_24409 ) ( CLEAR ?auto_24375 ) ( not ( = ?auto_24374 ?auto_24375 ) ) ( not ( = ?auto_24374 ?auto_24409 ) ) ( not ( = ?auto_24375 ?auto_24409 ) ) ( not ( = ?auto_24386 ?auto_24417 ) ) ( IS-CRATE ?auto_24374 ) ( AVAILABLE ?auto_24417 ) ( SURFACE-AT ?auto_24374 ?auto_24421 ) ( ON ?auto_24374 ?auto_24419 ) ( CLEAR ?auto_24374 ) ( not ( = ?auto_24373 ?auto_24374 ) ) ( not ( = ?auto_24373 ?auto_24419 ) ) ( not ( = ?auto_24374 ?auto_24419 ) ) ( IS-CRATE ?auto_24373 ) ( not ( = ?auto_24412 ?auto_24383 ) ) ( HOIST-AT ?auto_24399 ?auto_24412 ) ( AVAILABLE ?auto_24399 ) ( SURFACE-AT ?auto_24373 ?auto_24412 ) ( ON ?auto_24373 ?auto_24394 ) ( CLEAR ?auto_24373 ) ( not ( = ?auto_24372 ?auto_24373 ) ) ( not ( = ?auto_24372 ?auto_24394 ) ) ( not ( = ?auto_24373 ?auto_24394 ) ) ( not ( = ?auto_24386 ?auto_24399 ) ) ( IS-CRATE ?auto_24372 ) ( not ( = ?auto_24392 ?auto_24383 ) ) ( HOIST-AT ?auto_24395 ?auto_24392 ) ( AVAILABLE ?auto_24395 ) ( SURFACE-AT ?auto_24372 ?auto_24392 ) ( ON ?auto_24372 ?auto_24414 ) ( CLEAR ?auto_24372 ) ( not ( = ?auto_24371 ?auto_24372 ) ) ( not ( = ?auto_24371 ?auto_24414 ) ) ( not ( = ?auto_24372 ?auto_24414 ) ) ( not ( = ?auto_24386 ?auto_24395 ) ) ( IS-CRATE ?auto_24371 ) ( not ( = ?auto_24401 ?auto_24383 ) ) ( HOIST-AT ?auto_24402 ?auto_24401 ) ( AVAILABLE ?auto_24402 ) ( SURFACE-AT ?auto_24371 ?auto_24401 ) ( ON ?auto_24371 ?auto_24403 ) ( CLEAR ?auto_24371 ) ( not ( = ?auto_24370 ?auto_24371 ) ) ( not ( = ?auto_24370 ?auto_24403 ) ) ( not ( = ?auto_24371 ?auto_24403 ) ) ( not ( = ?auto_24386 ?auto_24402 ) ) ( IS-CRATE ?auto_24370 ) ( AVAILABLE ?auto_24387 ) ( SURFACE-AT ?auto_24370 ?auto_24384 ) ( ON ?auto_24370 ?auto_24390 ) ( CLEAR ?auto_24370 ) ( not ( = ?auto_24369 ?auto_24370 ) ) ( not ( = ?auto_24369 ?auto_24390 ) ) ( not ( = ?auto_24370 ?auto_24390 ) ) ( IS-CRATE ?auto_24369 ) ( not ( = ?auto_24396 ?auto_24383 ) ) ( HOIST-AT ?auto_24413 ?auto_24396 ) ( AVAILABLE ?auto_24413 ) ( SURFACE-AT ?auto_24369 ?auto_24396 ) ( ON ?auto_24369 ?auto_24405 ) ( CLEAR ?auto_24369 ) ( not ( = ?auto_24368 ?auto_24369 ) ) ( not ( = ?auto_24368 ?auto_24405 ) ) ( not ( = ?auto_24369 ?auto_24405 ) ) ( not ( = ?auto_24386 ?auto_24413 ) ) ( SURFACE-AT ?auto_24367 ?auto_24383 ) ( CLEAR ?auto_24367 ) ( IS-CRATE ?auto_24368 ) ( AVAILABLE ?auto_24386 ) ( not ( = ?auto_24422 ?auto_24383 ) ) ( HOIST-AT ?auto_24425 ?auto_24422 ) ( AVAILABLE ?auto_24425 ) ( SURFACE-AT ?auto_24368 ?auto_24422 ) ( ON ?auto_24368 ?auto_24418 ) ( CLEAR ?auto_24368 ) ( TRUCK-AT ?auto_24388 ?auto_24383 ) ( not ( = ?auto_24367 ?auto_24368 ) ) ( not ( = ?auto_24367 ?auto_24418 ) ) ( not ( = ?auto_24368 ?auto_24418 ) ) ( not ( = ?auto_24386 ?auto_24425 ) ) ( not ( = ?auto_24367 ?auto_24369 ) ) ( not ( = ?auto_24367 ?auto_24405 ) ) ( not ( = ?auto_24369 ?auto_24418 ) ) ( not ( = ?auto_24396 ?auto_24422 ) ) ( not ( = ?auto_24413 ?auto_24425 ) ) ( not ( = ?auto_24405 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24370 ) ) ( not ( = ?auto_24367 ?auto_24390 ) ) ( not ( = ?auto_24368 ?auto_24370 ) ) ( not ( = ?auto_24368 ?auto_24390 ) ) ( not ( = ?auto_24370 ?auto_24405 ) ) ( not ( = ?auto_24370 ?auto_24418 ) ) ( not ( = ?auto_24384 ?auto_24396 ) ) ( not ( = ?auto_24384 ?auto_24422 ) ) ( not ( = ?auto_24387 ?auto_24413 ) ) ( not ( = ?auto_24387 ?auto_24425 ) ) ( not ( = ?auto_24390 ?auto_24405 ) ) ( not ( = ?auto_24390 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24371 ) ) ( not ( = ?auto_24367 ?auto_24403 ) ) ( not ( = ?auto_24368 ?auto_24371 ) ) ( not ( = ?auto_24368 ?auto_24403 ) ) ( not ( = ?auto_24369 ?auto_24371 ) ) ( not ( = ?auto_24369 ?auto_24403 ) ) ( not ( = ?auto_24371 ?auto_24390 ) ) ( not ( = ?auto_24371 ?auto_24405 ) ) ( not ( = ?auto_24371 ?auto_24418 ) ) ( not ( = ?auto_24401 ?auto_24384 ) ) ( not ( = ?auto_24401 ?auto_24396 ) ) ( not ( = ?auto_24401 ?auto_24422 ) ) ( not ( = ?auto_24402 ?auto_24387 ) ) ( not ( = ?auto_24402 ?auto_24413 ) ) ( not ( = ?auto_24402 ?auto_24425 ) ) ( not ( = ?auto_24403 ?auto_24390 ) ) ( not ( = ?auto_24403 ?auto_24405 ) ) ( not ( = ?auto_24403 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24372 ) ) ( not ( = ?auto_24367 ?auto_24414 ) ) ( not ( = ?auto_24368 ?auto_24372 ) ) ( not ( = ?auto_24368 ?auto_24414 ) ) ( not ( = ?auto_24369 ?auto_24372 ) ) ( not ( = ?auto_24369 ?auto_24414 ) ) ( not ( = ?auto_24370 ?auto_24372 ) ) ( not ( = ?auto_24370 ?auto_24414 ) ) ( not ( = ?auto_24372 ?auto_24403 ) ) ( not ( = ?auto_24372 ?auto_24390 ) ) ( not ( = ?auto_24372 ?auto_24405 ) ) ( not ( = ?auto_24372 ?auto_24418 ) ) ( not ( = ?auto_24392 ?auto_24401 ) ) ( not ( = ?auto_24392 ?auto_24384 ) ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( not ( = ?auto_24392 ?auto_24422 ) ) ( not ( = ?auto_24395 ?auto_24402 ) ) ( not ( = ?auto_24395 ?auto_24387 ) ) ( not ( = ?auto_24395 ?auto_24413 ) ) ( not ( = ?auto_24395 ?auto_24425 ) ) ( not ( = ?auto_24414 ?auto_24403 ) ) ( not ( = ?auto_24414 ?auto_24390 ) ) ( not ( = ?auto_24414 ?auto_24405 ) ) ( not ( = ?auto_24414 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24373 ) ) ( not ( = ?auto_24367 ?auto_24394 ) ) ( not ( = ?auto_24368 ?auto_24373 ) ) ( not ( = ?auto_24368 ?auto_24394 ) ) ( not ( = ?auto_24369 ?auto_24373 ) ) ( not ( = ?auto_24369 ?auto_24394 ) ) ( not ( = ?auto_24370 ?auto_24373 ) ) ( not ( = ?auto_24370 ?auto_24394 ) ) ( not ( = ?auto_24371 ?auto_24373 ) ) ( not ( = ?auto_24371 ?auto_24394 ) ) ( not ( = ?auto_24373 ?auto_24414 ) ) ( not ( = ?auto_24373 ?auto_24403 ) ) ( not ( = ?auto_24373 ?auto_24390 ) ) ( not ( = ?auto_24373 ?auto_24405 ) ) ( not ( = ?auto_24373 ?auto_24418 ) ) ( not ( = ?auto_24412 ?auto_24392 ) ) ( not ( = ?auto_24412 ?auto_24401 ) ) ( not ( = ?auto_24412 ?auto_24384 ) ) ( not ( = ?auto_24412 ?auto_24396 ) ) ( not ( = ?auto_24412 ?auto_24422 ) ) ( not ( = ?auto_24399 ?auto_24395 ) ) ( not ( = ?auto_24399 ?auto_24402 ) ) ( not ( = ?auto_24399 ?auto_24387 ) ) ( not ( = ?auto_24399 ?auto_24413 ) ) ( not ( = ?auto_24399 ?auto_24425 ) ) ( not ( = ?auto_24394 ?auto_24414 ) ) ( not ( = ?auto_24394 ?auto_24403 ) ) ( not ( = ?auto_24394 ?auto_24390 ) ) ( not ( = ?auto_24394 ?auto_24405 ) ) ( not ( = ?auto_24394 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24374 ) ) ( not ( = ?auto_24367 ?auto_24419 ) ) ( not ( = ?auto_24368 ?auto_24374 ) ) ( not ( = ?auto_24368 ?auto_24419 ) ) ( not ( = ?auto_24369 ?auto_24374 ) ) ( not ( = ?auto_24369 ?auto_24419 ) ) ( not ( = ?auto_24370 ?auto_24374 ) ) ( not ( = ?auto_24370 ?auto_24419 ) ) ( not ( = ?auto_24371 ?auto_24374 ) ) ( not ( = ?auto_24371 ?auto_24419 ) ) ( not ( = ?auto_24372 ?auto_24374 ) ) ( not ( = ?auto_24372 ?auto_24419 ) ) ( not ( = ?auto_24374 ?auto_24394 ) ) ( not ( = ?auto_24374 ?auto_24414 ) ) ( not ( = ?auto_24374 ?auto_24403 ) ) ( not ( = ?auto_24374 ?auto_24390 ) ) ( not ( = ?auto_24374 ?auto_24405 ) ) ( not ( = ?auto_24374 ?auto_24418 ) ) ( not ( = ?auto_24421 ?auto_24412 ) ) ( not ( = ?auto_24421 ?auto_24392 ) ) ( not ( = ?auto_24421 ?auto_24401 ) ) ( not ( = ?auto_24421 ?auto_24384 ) ) ( not ( = ?auto_24421 ?auto_24396 ) ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( not ( = ?auto_24417 ?auto_24399 ) ) ( not ( = ?auto_24417 ?auto_24395 ) ) ( not ( = ?auto_24417 ?auto_24402 ) ) ( not ( = ?auto_24417 ?auto_24387 ) ) ( not ( = ?auto_24417 ?auto_24413 ) ) ( not ( = ?auto_24417 ?auto_24425 ) ) ( not ( = ?auto_24419 ?auto_24394 ) ) ( not ( = ?auto_24419 ?auto_24414 ) ) ( not ( = ?auto_24419 ?auto_24403 ) ) ( not ( = ?auto_24419 ?auto_24390 ) ) ( not ( = ?auto_24419 ?auto_24405 ) ) ( not ( = ?auto_24419 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24375 ) ) ( not ( = ?auto_24367 ?auto_24409 ) ) ( not ( = ?auto_24368 ?auto_24375 ) ) ( not ( = ?auto_24368 ?auto_24409 ) ) ( not ( = ?auto_24369 ?auto_24375 ) ) ( not ( = ?auto_24369 ?auto_24409 ) ) ( not ( = ?auto_24370 ?auto_24375 ) ) ( not ( = ?auto_24370 ?auto_24409 ) ) ( not ( = ?auto_24371 ?auto_24375 ) ) ( not ( = ?auto_24371 ?auto_24409 ) ) ( not ( = ?auto_24372 ?auto_24375 ) ) ( not ( = ?auto_24372 ?auto_24409 ) ) ( not ( = ?auto_24373 ?auto_24375 ) ) ( not ( = ?auto_24373 ?auto_24409 ) ) ( not ( = ?auto_24375 ?auto_24419 ) ) ( not ( = ?auto_24375 ?auto_24394 ) ) ( not ( = ?auto_24375 ?auto_24414 ) ) ( not ( = ?auto_24375 ?auto_24403 ) ) ( not ( = ?auto_24375 ?auto_24390 ) ) ( not ( = ?auto_24375 ?auto_24405 ) ) ( not ( = ?auto_24375 ?auto_24418 ) ) ( not ( = ?auto_24409 ?auto_24419 ) ) ( not ( = ?auto_24409 ?auto_24394 ) ) ( not ( = ?auto_24409 ?auto_24414 ) ) ( not ( = ?auto_24409 ?auto_24403 ) ) ( not ( = ?auto_24409 ?auto_24390 ) ) ( not ( = ?auto_24409 ?auto_24405 ) ) ( not ( = ?auto_24409 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24376 ) ) ( not ( = ?auto_24367 ?auto_24411 ) ) ( not ( = ?auto_24368 ?auto_24376 ) ) ( not ( = ?auto_24368 ?auto_24411 ) ) ( not ( = ?auto_24369 ?auto_24376 ) ) ( not ( = ?auto_24369 ?auto_24411 ) ) ( not ( = ?auto_24370 ?auto_24376 ) ) ( not ( = ?auto_24370 ?auto_24411 ) ) ( not ( = ?auto_24371 ?auto_24376 ) ) ( not ( = ?auto_24371 ?auto_24411 ) ) ( not ( = ?auto_24372 ?auto_24376 ) ) ( not ( = ?auto_24372 ?auto_24411 ) ) ( not ( = ?auto_24373 ?auto_24376 ) ) ( not ( = ?auto_24373 ?auto_24411 ) ) ( not ( = ?auto_24374 ?auto_24376 ) ) ( not ( = ?auto_24374 ?auto_24411 ) ) ( not ( = ?auto_24376 ?auto_24409 ) ) ( not ( = ?auto_24376 ?auto_24419 ) ) ( not ( = ?auto_24376 ?auto_24394 ) ) ( not ( = ?auto_24376 ?auto_24414 ) ) ( not ( = ?auto_24376 ?auto_24403 ) ) ( not ( = ?auto_24376 ?auto_24390 ) ) ( not ( = ?auto_24376 ?auto_24405 ) ) ( not ( = ?auto_24376 ?auto_24418 ) ) ( not ( = ?auto_24389 ?auto_24421 ) ) ( not ( = ?auto_24389 ?auto_24412 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24389 ?auto_24401 ) ) ( not ( = ?auto_24389 ?auto_24384 ) ) ( not ( = ?auto_24389 ?auto_24396 ) ) ( not ( = ?auto_24389 ?auto_24422 ) ) ( not ( = ?auto_24391 ?auto_24417 ) ) ( not ( = ?auto_24391 ?auto_24399 ) ) ( not ( = ?auto_24391 ?auto_24395 ) ) ( not ( = ?auto_24391 ?auto_24402 ) ) ( not ( = ?auto_24391 ?auto_24387 ) ) ( not ( = ?auto_24391 ?auto_24413 ) ) ( not ( = ?auto_24391 ?auto_24425 ) ) ( not ( = ?auto_24411 ?auto_24409 ) ) ( not ( = ?auto_24411 ?auto_24419 ) ) ( not ( = ?auto_24411 ?auto_24394 ) ) ( not ( = ?auto_24411 ?auto_24414 ) ) ( not ( = ?auto_24411 ?auto_24403 ) ) ( not ( = ?auto_24411 ?auto_24390 ) ) ( not ( = ?auto_24411 ?auto_24405 ) ) ( not ( = ?auto_24411 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24377 ) ) ( not ( = ?auto_24367 ?auto_24423 ) ) ( not ( = ?auto_24368 ?auto_24377 ) ) ( not ( = ?auto_24368 ?auto_24423 ) ) ( not ( = ?auto_24369 ?auto_24377 ) ) ( not ( = ?auto_24369 ?auto_24423 ) ) ( not ( = ?auto_24370 ?auto_24377 ) ) ( not ( = ?auto_24370 ?auto_24423 ) ) ( not ( = ?auto_24371 ?auto_24377 ) ) ( not ( = ?auto_24371 ?auto_24423 ) ) ( not ( = ?auto_24372 ?auto_24377 ) ) ( not ( = ?auto_24372 ?auto_24423 ) ) ( not ( = ?auto_24373 ?auto_24377 ) ) ( not ( = ?auto_24373 ?auto_24423 ) ) ( not ( = ?auto_24374 ?auto_24377 ) ) ( not ( = ?auto_24374 ?auto_24423 ) ) ( not ( = ?auto_24375 ?auto_24377 ) ) ( not ( = ?auto_24375 ?auto_24423 ) ) ( not ( = ?auto_24377 ?auto_24411 ) ) ( not ( = ?auto_24377 ?auto_24409 ) ) ( not ( = ?auto_24377 ?auto_24419 ) ) ( not ( = ?auto_24377 ?auto_24394 ) ) ( not ( = ?auto_24377 ?auto_24414 ) ) ( not ( = ?auto_24377 ?auto_24403 ) ) ( not ( = ?auto_24377 ?auto_24390 ) ) ( not ( = ?auto_24377 ?auto_24405 ) ) ( not ( = ?auto_24377 ?auto_24418 ) ) ( not ( = ?auto_24415 ?auto_24389 ) ) ( not ( = ?auto_24415 ?auto_24421 ) ) ( not ( = ?auto_24415 ?auto_24412 ) ) ( not ( = ?auto_24415 ?auto_24392 ) ) ( not ( = ?auto_24415 ?auto_24401 ) ) ( not ( = ?auto_24415 ?auto_24384 ) ) ( not ( = ?auto_24415 ?auto_24396 ) ) ( not ( = ?auto_24415 ?auto_24422 ) ) ( not ( = ?auto_24406 ?auto_24391 ) ) ( not ( = ?auto_24406 ?auto_24417 ) ) ( not ( = ?auto_24406 ?auto_24399 ) ) ( not ( = ?auto_24406 ?auto_24395 ) ) ( not ( = ?auto_24406 ?auto_24402 ) ) ( not ( = ?auto_24406 ?auto_24387 ) ) ( not ( = ?auto_24406 ?auto_24413 ) ) ( not ( = ?auto_24406 ?auto_24425 ) ) ( not ( = ?auto_24423 ?auto_24411 ) ) ( not ( = ?auto_24423 ?auto_24409 ) ) ( not ( = ?auto_24423 ?auto_24419 ) ) ( not ( = ?auto_24423 ?auto_24394 ) ) ( not ( = ?auto_24423 ?auto_24414 ) ) ( not ( = ?auto_24423 ?auto_24403 ) ) ( not ( = ?auto_24423 ?auto_24390 ) ) ( not ( = ?auto_24423 ?auto_24405 ) ) ( not ( = ?auto_24423 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24378 ) ) ( not ( = ?auto_24367 ?auto_24404 ) ) ( not ( = ?auto_24368 ?auto_24378 ) ) ( not ( = ?auto_24368 ?auto_24404 ) ) ( not ( = ?auto_24369 ?auto_24378 ) ) ( not ( = ?auto_24369 ?auto_24404 ) ) ( not ( = ?auto_24370 ?auto_24378 ) ) ( not ( = ?auto_24370 ?auto_24404 ) ) ( not ( = ?auto_24371 ?auto_24378 ) ) ( not ( = ?auto_24371 ?auto_24404 ) ) ( not ( = ?auto_24372 ?auto_24378 ) ) ( not ( = ?auto_24372 ?auto_24404 ) ) ( not ( = ?auto_24373 ?auto_24378 ) ) ( not ( = ?auto_24373 ?auto_24404 ) ) ( not ( = ?auto_24374 ?auto_24378 ) ) ( not ( = ?auto_24374 ?auto_24404 ) ) ( not ( = ?auto_24375 ?auto_24378 ) ) ( not ( = ?auto_24375 ?auto_24404 ) ) ( not ( = ?auto_24376 ?auto_24378 ) ) ( not ( = ?auto_24376 ?auto_24404 ) ) ( not ( = ?auto_24378 ?auto_24423 ) ) ( not ( = ?auto_24378 ?auto_24411 ) ) ( not ( = ?auto_24378 ?auto_24409 ) ) ( not ( = ?auto_24378 ?auto_24419 ) ) ( not ( = ?auto_24378 ?auto_24394 ) ) ( not ( = ?auto_24378 ?auto_24414 ) ) ( not ( = ?auto_24378 ?auto_24403 ) ) ( not ( = ?auto_24378 ?auto_24390 ) ) ( not ( = ?auto_24378 ?auto_24405 ) ) ( not ( = ?auto_24378 ?auto_24418 ) ) ( not ( = ?auto_24393 ?auto_24415 ) ) ( not ( = ?auto_24393 ?auto_24389 ) ) ( not ( = ?auto_24393 ?auto_24421 ) ) ( not ( = ?auto_24393 ?auto_24412 ) ) ( not ( = ?auto_24393 ?auto_24392 ) ) ( not ( = ?auto_24393 ?auto_24401 ) ) ( not ( = ?auto_24393 ?auto_24384 ) ) ( not ( = ?auto_24393 ?auto_24396 ) ) ( not ( = ?auto_24393 ?auto_24422 ) ) ( not ( = ?auto_24397 ?auto_24406 ) ) ( not ( = ?auto_24397 ?auto_24391 ) ) ( not ( = ?auto_24397 ?auto_24417 ) ) ( not ( = ?auto_24397 ?auto_24399 ) ) ( not ( = ?auto_24397 ?auto_24395 ) ) ( not ( = ?auto_24397 ?auto_24402 ) ) ( not ( = ?auto_24397 ?auto_24387 ) ) ( not ( = ?auto_24397 ?auto_24413 ) ) ( not ( = ?auto_24397 ?auto_24425 ) ) ( not ( = ?auto_24404 ?auto_24423 ) ) ( not ( = ?auto_24404 ?auto_24411 ) ) ( not ( = ?auto_24404 ?auto_24409 ) ) ( not ( = ?auto_24404 ?auto_24419 ) ) ( not ( = ?auto_24404 ?auto_24394 ) ) ( not ( = ?auto_24404 ?auto_24414 ) ) ( not ( = ?auto_24404 ?auto_24403 ) ) ( not ( = ?auto_24404 ?auto_24390 ) ) ( not ( = ?auto_24404 ?auto_24405 ) ) ( not ( = ?auto_24404 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24379 ) ) ( not ( = ?auto_24367 ?auto_24424 ) ) ( not ( = ?auto_24368 ?auto_24379 ) ) ( not ( = ?auto_24368 ?auto_24424 ) ) ( not ( = ?auto_24369 ?auto_24379 ) ) ( not ( = ?auto_24369 ?auto_24424 ) ) ( not ( = ?auto_24370 ?auto_24379 ) ) ( not ( = ?auto_24370 ?auto_24424 ) ) ( not ( = ?auto_24371 ?auto_24379 ) ) ( not ( = ?auto_24371 ?auto_24424 ) ) ( not ( = ?auto_24372 ?auto_24379 ) ) ( not ( = ?auto_24372 ?auto_24424 ) ) ( not ( = ?auto_24373 ?auto_24379 ) ) ( not ( = ?auto_24373 ?auto_24424 ) ) ( not ( = ?auto_24374 ?auto_24379 ) ) ( not ( = ?auto_24374 ?auto_24424 ) ) ( not ( = ?auto_24375 ?auto_24379 ) ) ( not ( = ?auto_24375 ?auto_24424 ) ) ( not ( = ?auto_24376 ?auto_24379 ) ) ( not ( = ?auto_24376 ?auto_24424 ) ) ( not ( = ?auto_24377 ?auto_24379 ) ) ( not ( = ?auto_24377 ?auto_24424 ) ) ( not ( = ?auto_24379 ?auto_24404 ) ) ( not ( = ?auto_24379 ?auto_24423 ) ) ( not ( = ?auto_24379 ?auto_24411 ) ) ( not ( = ?auto_24379 ?auto_24409 ) ) ( not ( = ?auto_24379 ?auto_24419 ) ) ( not ( = ?auto_24379 ?auto_24394 ) ) ( not ( = ?auto_24379 ?auto_24414 ) ) ( not ( = ?auto_24379 ?auto_24403 ) ) ( not ( = ?auto_24379 ?auto_24390 ) ) ( not ( = ?auto_24379 ?auto_24405 ) ) ( not ( = ?auto_24379 ?auto_24418 ) ) ( not ( = ?auto_24400 ?auto_24393 ) ) ( not ( = ?auto_24400 ?auto_24415 ) ) ( not ( = ?auto_24400 ?auto_24389 ) ) ( not ( = ?auto_24400 ?auto_24421 ) ) ( not ( = ?auto_24400 ?auto_24412 ) ) ( not ( = ?auto_24400 ?auto_24392 ) ) ( not ( = ?auto_24400 ?auto_24401 ) ) ( not ( = ?auto_24400 ?auto_24384 ) ) ( not ( = ?auto_24400 ?auto_24396 ) ) ( not ( = ?auto_24400 ?auto_24422 ) ) ( not ( = ?auto_24426 ?auto_24397 ) ) ( not ( = ?auto_24426 ?auto_24406 ) ) ( not ( = ?auto_24426 ?auto_24391 ) ) ( not ( = ?auto_24426 ?auto_24417 ) ) ( not ( = ?auto_24426 ?auto_24399 ) ) ( not ( = ?auto_24426 ?auto_24395 ) ) ( not ( = ?auto_24426 ?auto_24402 ) ) ( not ( = ?auto_24426 ?auto_24387 ) ) ( not ( = ?auto_24426 ?auto_24413 ) ) ( not ( = ?auto_24426 ?auto_24425 ) ) ( not ( = ?auto_24424 ?auto_24404 ) ) ( not ( = ?auto_24424 ?auto_24423 ) ) ( not ( = ?auto_24424 ?auto_24411 ) ) ( not ( = ?auto_24424 ?auto_24409 ) ) ( not ( = ?auto_24424 ?auto_24419 ) ) ( not ( = ?auto_24424 ?auto_24394 ) ) ( not ( = ?auto_24424 ?auto_24414 ) ) ( not ( = ?auto_24424 ?auto_24403 ) ) ( not ( = ?auto_24424 ?auto_24390 ) ) ( not ( = ?auto_24424 ?auto_24405 ) ) ( not ( = ?auto_24424 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24380 ) ) ( not ( = ?auto_24367 ?auto_24416 ) ) ( not ( = ?auto_24368 ?auto_24380 ) ) ( not ( = ?auto_24368 ?auto_24416 ) ) ( not ( = ?auto_24369 ?auto_24380 ) ) ( not ( = ?auto_24369 ?auto_24416 ) ) ( not ( = ?auto_24370 ?auto_24380 ) ) ( not ( = ?auto_24370 ?auto_24416 ) ) ( not ( = ?auto_24371 ?auto_24380 ) ) ( not ( = ?auto_24371 ?auto_24416 ) ) ( not ( = ?auto_24372 ?auto_24380 ) ) ( not ( = ?auto_24372 ?auto_24416 ) ) ( not ( = ?auto_24373 ?auto_24380 ) ) ( not ( = ?auto_24373 ?auto_24416 ) ) ( not ( = ?auto_24374 ?auto_24380 ) ) ( not ( = ?auto_24374 ?auto_24416 ) ) ( not ( = ?auto_24375 ?auto_24380 ) ) ( not ( = ?auto_24375 ?auto_24416 ) ) ( not ( = ?auto_24376 ?auto_24380 ) ) ( not ( = ?auto_24376 ?auto_24416 ) ) ( not ( = ?auto_24377 ?auto_24380 ) ) ( not ( = ?auto_24377 ?auto_24416 ) ) ( not ( = ?auto_24378 ?auto_24380 ) ) ( not ( = ?auto_24378 ?auto_24416 ) ) ( not ( = ?auto_24380 ?auto_24424 ) ) ( not ( = ?auto_24380 ?auto_24404 ) ) ( not ( = ?auto_24380 ?auto_24423 ) ) ( not ( = ?auto_24380 ?auto_24411 ) ) ( not ( = ?auto_24380 ?auto_24409 ) ) ( not ( = ?auto_24380 ?auto_24419 ) ) ( not ( = ?auto_24380 ?auto_24394 ) ) ( not ( = ?auto_24380 ?auto_24414 ) ) ( not ( = ?auto_24380 ?auto_24403 ) ) ( not ( = ?auto_24380 ?auto_24390 ) ) ( not ( = ?auto_24380 ?auto_24405 ) ) ( not ( = ?auto_24380 ?auto_24418 ) ) ( not ( = ?auto_24407 ?auto_24400 ) ) ( not ( = ?auto_24407 ?auto_24393 ) ) ( not ( = ?auto_24407 ?auto_24415 ) ) ( not ( = ?auto_24407 ?auto_24389 ) ) ( not ( = ?auto_24407 ?auto_24421 ) ) ( not ( = ?auto_24407 ?auto_24412 ) ) ( not ( = ?auto_24407 ?auto_24392 ) ) ( not ( = ?auto_24407 ?auto_24401 ) ) ( not ( = ?auto_24407 ?auto_24384 ) ) ( not ( = ?auto_24407 ?auto_24396 ) ) ( not ( = ?auto_24407 ?auto_24422 ) ) ( not ( = ?auto_24410 ?auto_24426 ) ) ( not ( = ?auto_24410 ?auto_24397 ) ) ( not ( = ?auto_24410 ?auto_24406 ) ) ( not ( = ?auto_24410 ?auto_24391 ) ) ( not ( = ?auto_24410 ?auto_24417 ) ) ( not ( = ?auto_24410 ?auto_24399 ) ) ( not ( = ?auto_24410 ?auto_24395 ) ) ( not ( = ?auto_24410 ?auto_24402 ) ) ( not ( = ?auto_24410 ?auto_24387 ) ) ( not ( = ?auto_24410 ?auto_24413 ) ) ( not ( = ?auto_24410 ?auto_24425 ) ) ( not ( = ?auto_24416 ?auto_24424 ) ) ( not ( = ?auto_24416 ?auto_24404 ) ) ( not ( = ?auto_24416 ?auto_24423 ) ) ( not ( = ?auto_24416 ?auto_24411 ) ) ( not ( = ?auto_24416 ?auto_24409 ) ) ( not ( = ?auto_24416 ?auto_24419 ) ) ( not ( = ?auto_24416 ?auto_24394 ) ) ( not ( = ?auto_24416 ?auto_24414 ) ) ( not ( = ?auto_24416 ?auto_24403 ) ) ( not ( = ?auto_24416 ?auto_24390 ) ) ( not ( = ?auto_24416 ?auto_24405 ) ) ( not ( = ?auto_24416 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24381 ) ) ( not ( = ?auto_24367 ?auto_24420 ) ) ( not ( = ?auto_24368 ?auto_24381 ) ) ( not ( = ?auto_24368 ?auto_24420 ) ) ( not ( = ?auto_24369 ?auto_24381 ) ) ( not ( = ?auto_24369 ?auto_24420 ) ) ( not ( = ?auto_24370 ?auto_24381 ) ) ( not ( = ?auto_24370 ?auto_24420 ) ) ( not ( = ?auto_24371 ?auto_24381 ) ) ( not ( = ?auto_24371 ?auto_24420 ) ) ( not ( = ?auto_24372 ?auto_24381 ) ) ( not ( = ?auto_24372 ?auto_24420 ) ) ( not ( = ?auto_24373 ?auto_24381 ) ) ( not ( = ?auto_24373 ?auto_24420 ) ) ( not ( = ?auto_24374 ?auto_24381 ) ) ( not ( = ?auto_24374 ?auto_24420 ) ) ( not ( = ?auto_24375 ?auto_24381 ) ) ( not ( = ?auto_24375 ?auto_24420 ) ) ( not ( = ?auto_24376 ?auto_24381 ) ) ( not ( = ?auto_24376 ?auto_24420 ) ) ( not ( = ?auto_24377 ?auto_24381 ) ) ( not ( = ?auto_24377 ?auto_24420 ) ) ( not ( = ?auto_24378 ?auto_24381 ) ) ( not ( = ?auto_24378 ?auto_24420 ) ) ( not ( = ?auto_24379 ?auto_24381 ) ) ( not ( = ?auto_24379 ?auto_24420 ) ) ( not ( = ?auto_24381 ?auto_24416 ) ) ( not ( = ?auto_24381 ?auto_24424 ) ) ( not ( = ?auto_24381 ?auto_24404 ) ) ( not ( = ?auto_24381 ?auto_24423 ) ) ( not ( = ?auto_24381 ?auto_24411 ) ) ( not ( = ?auto_24381 ?auto_24409 ) ) ( not ( = ?auto_24381 ?auto_24419 ) ) ( not ( = ?auto_24381 ?auto_24394 ) ) ( not ( = ?auto_24381 ?auto_24414 ) ) ( not ( = ?auto_24381 ?auto_24403 ) ) ( not ( = ?auto_24381 ?auto_24390 ) ) ( not ( = ?auto_24381 ?auto_24405 ) ) ( not ( = ?auto_24381 ?auto_24418 ) ) ( not ( = ?auto_24398 ?auto_24407 ) ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24398 ?auto_24393 ) ) ( not ( = ?auto_24398 ?auto_24415 ) ) ( not ( = ?auto_24398 ?auto_24389 ) ) ( not ( = ?auto_24398 ?auto_24421 ) ) ( not ( = ?auto_24398 ?auto_24412 ) ) ( not ( = ?auto_24398 ?auto_24392 ) ) ( not ( = ?auto_24398 ?auto_24401 ) ) ( not ( = ?auto_24398 ?auto_24384 ) ) ( not ( = ?auto_24398 ?auto_24396 ) ) ( not ( = ?auto_24398 ?auto_24422 ) ) ( not ( = ?auto_24408 ?auto_24410 ) ) ( not ( = ?auto_24408 ?auto_24426 ) ) ( not ( = ?auto_24408 ?auto_24397 ) ) ( not ( = ?auto_24408 ?auto_24406 ) ) ( not ( = ?auto_24408 ?auto_24391 ) ) ( not ( = ?auto_24408 ?auto_24417 ) ) ( not ( = ?auto_24408 ?auto_24399 ) ) ( not ( = ?auto_24408 ?auto_24395 ) ) ( not ( = ?auto_24408 ?auto_24402 ) ) ( not ( = ?auto_24408 ?auto_24387 ) ) ( not ( = ?auto_24408 ?auto_24413 ) ) ( not ( = ?auto_24408 ?auto_24425 ) ) ( not ( = ?auto_24420 ?auto_24416 ) ) ( not ( = ?auto_24420 ?auto_24424 ) ) ( not ( = ?auto_24420 ?auto_24404 ) ) ( not ( = ?auto_24420 ?auto_24423 ) ) ( not ( = ?auto_24420 ?auto_24411 ) ) ( not ( = ?auto_24420 ?auto_24409 ) ) ( not ( = ?auto_24420 ?auto_24419 ) ) ( not ( = ?auto_24420 ?auto_24394 ) ) ( not ( = ?auto_24420 ?auto_24414 ) ) ( not ( = ?auto_24420 ?auto_24403 ) ) ( not ( = ?auto_24420 ?auto_24390 ) ) ( not ( = ?auto_24420 ?auto_24405 ) ) ( not ( = ?auto_24420 ?auto_24418 ) ) ( not ( = ?auto_24367 ?auto_24382 ) ) ( not ( = ?auto_24367 ?auto_24385 ) ) ( not ( = ?auto_24368 ?auto_24382 ) ) ( not ( = ?auto_24368 ?auto_24385 ) ) ( not ( = ?auto_24369 ?auto_24382 ) ) ( not ( = ?auto_24369 ?auto_24385 ) ) ( not ( = ?auto_24370 ?auto_24382 ) ) ( not ( = ?auto_24370 ?auto_24385 ) ) ( not ( = ?auto_24371 ?auto_24382 ) ) ( not ( = ?auto_24371 ?auto_24385 ) ) ( not ( = ?auto_24372 ?auto_24382 ) ) ( not ( = ?auto_24372 ?auto_24385 ) ) ( not ( = ?auto_24373 ?auto_24382 ) ) ( not ( = ?auto_24373 ?auto_24385 ) ) ( not ( = ?auto_24374 ?auto_24382 ) ) ( not ( = ?auto_24374 ?auto_24385 ) ) ( not ( = ?auto_24375 ?auto_24382 ) ) ( not ( = ?auto_24375 ?auto_24385 ) ) ( not ( = ?auto_24376 ?auto_24382 ) ) ( not ( = ?auto_24376 ?auto_24385 ) ) ( not ( = ?auto_24377 ?auto_24382 ) ) ( not ( = ?auto_24377 ?auto_24385 ) ) ( not ( = ?auto_24378 ?auto_24382 ) ) ( not ( = ?auto_24378 ?auto_24385 ) ) ( not ( = ?auto_24379 ?auto_24382 ) ) ( not ( = ?auto_24379 ?auto_24385 ) ) ( not ( = ?auto_24380 ?auto_24382 ) ) ( not ( = ?auto_24380 ?auto_24385 ) ) ( not ( = ?auto_24382 ?auto_24420 ) ) ( not ( = ?auto_24382 ?auto_24416 ) ) ( not ( = ?auto_24382 ?auto_24424 ) ) ( not ( = ?auto_24382 ?auto_24404 ) ) ( not ( = ?auto_24382 ?auto_24423 ) ) ( not ( = ?auto_24382 ?auto_24411 ) ) ( not ( = ?auto_24382 ?auto_24409 ) ) ( not ( = ?auto_24382 ?auto_24419 ) ) ( not ( = ?auto_24382 ?auto_24394 ) ) ( not ( = ?auto_24382 ?auto_24414 ) ) ( not ( = ?auto_24382 ?auto_24403 ) ) ( not ( = ?auto_24382 ?auto_24390 ) ) ( not ( = ?auto_24382 ?auto_24405 ) ) ( not ( = ?auto_24382 ?auto_24418 ) ) ( not ( = ?auto_24385 ?auto_24420 ) ) ( not ( = ?auto_24385 ?auto_24416 ) ) ( not ( = ?auto_24385 ?auto_24424 ) ) ( not ( = ?auto_24385 ?auto_24404 ) ) ( not ( = ?auto_24385 ?auto_24423 ) ) ( not ( = ?auto_24385 ?auto_24411 ) ) ( not ( = ?auto_24385 ?auto_24409 ) ) ( not ( = ?auto_24385 ?auto_24419 ) ) ( not ( = ?auto_24385 ?auto_24394 ) ) ( not ( = ?auto_24385 ?auto_24414 ) ) ( not ( = ?auto_24385 ?auto_24403 ) ) ( not ( = ?auto_24385 ?auto_24390 ) ) ( not ( = ?auto_24385 ?auto_24405 ) ) ( not ( = ?auto_24385 ?auto_24418 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_24367 ?auto_24368 ?auto_24369 ?auto_24370 ?auto_24371 ?auto_24372 ?auto_24373 ?auto_24374 ?auto_24375 ?auto_24376 ?auto_24377 ?auto_24378 ?auto_24379 ?auto_24380 ?auto_24381 )
      ( MAKE-1CRATE ?auto_24381 ?auto_24382 )
      ( MAKE-15CRATE-VERIFY ?auto_24367 ?auto_24368 ?auto_24369 ?auto_24370 ?auto_24371 ?auto_24372 ?auto_24373 ?auto_24374 ?auto_24375 ?auto_24376 ?auto_24377 ?auto_24378 ?auto_24379 ?auto_24380 ?auto_24381 ?auto_24382 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_24454 - SURFACE
      ?auto_24455 - SURFACE
      ?auto_24456 - SURFACE
      ?auto_24457 - SURFACE
      ?auto_24458 - SURFACE
      ?auto_24459 - SURFACE
      ?auto_24460 - SURFACE
      ?auto_24461 - SURFACE
      ?auto_24462 - SURFACE
      ?auto_24463 - SURFACE
      ?auto_24464 - SURFACE
      ?auto_24465 - SURFACE
      ?auto_24466 - SURFACE
      ?auto_24467 - SURFACE
      ?auto_24468 - SURFACE
      ?auto_24469 - SURFACE
      ?auto_24470 - SURFACE
    )
    :vars
    (
      ?auto_24474 - HOIST
      ?auto_24476 - PLACE
      ?auto_24473 - PLACE
      ?auto_24472 - HOIST
      ?auto_24475 - SURFACE
      ?auto_24493 - PLACE
      ?auto_24499 - HOIST
      ?auto_24498 - SURFACE
      ?auto_24513 - PLACE
      ?auto_24489 - HOIST
      ?auto_24478 - SURFACE
      ?auto_24514 - PLACE
      ?auto_24496 - HOIST
      ?auto_24501 - SURFACE
      ?auto_24507 - PLACE
      ?auto_24508 - HOIST
      ?auto_24500 - SURFACE
      ?auto_24494 - PLACE
      ?auto_24488 - HOIST
      ?auto_24512 - SURFACE
      ?auto_24509 - PLACE
      ?auto_24485 - HOIST
      ?auto_24481 - SURFACE
      ?auto_24517 - PLACE
      ?auto_24506 - HOIST
      ?auto_24515 - SURFACE
      ?auto_24477 - PLACE
      ?auto_24486 - HOIST
      ?auto_24511 - SURFACE
      ?auto_24497 - SURFACE
      ?auto_24480 - PLACE
      ?auto_24492 - HOIST
      ?auto_24491 - SURFACE
      ?auto_24495 - PLACE
      ?auto_24504 - HOIST
      ?auto_24482 - SURFACE
      ?auto_24503 - PLACE
      ?auto_24479 - HOIST
      ?auto_24484 - SURFACE
      ?auto_24487 - SURFACE
      ?auto_24490 - PLACE
      ?auto_24483 - HOIST
      ?auto_24502 - SURFACE
      ?auto_24516 - PLACE
      ?auto_24505 - HOIST
      ?auto_24510 - SURFACE
      ?auto_24471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24474 ?auto_24476 ) ( IS-CRATE ?auto_24470 ) ( not ( = ?auto_24473 ?auto_24476 ) ) ( HOIST-AT ?auto_24472 ?auto_24473 ) ( AVAILABLE ?auto_24472 ) ( SURFACE-AT ?auto_24470 ?auto_24473 ) ( ON ?auto_24470 ?auto_24475 ) ( CLEAR ?auto_24470 ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24469 ?auto_24475 ) ) ( not ( = ?auto_24470 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24472 ) ) ( IS-CRATE ?auto_24469 ) ( not ( = ?auto_24493 ?auto_24476 ) ) ( HOIST-AT ?auto_24499 ?auto_24493 ) ( SURFACE-AT ?auto_24469 ?auto_24493 ) ( ON ?auto_24469 ?auto_24498 ) ( CLEAR ?auto_24469 ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24498 ) ) ( not ( = ?auto_24469 ?auto_24498 ) ) ( not ( = ?auto_24474 ?auto_24499 ) ) ( IS-CRATE ?auto_24468 ) ( not ( = ?auto_24513 ?auto_24476 ) ) ( HOIST-AT ?auto_24489 ?auto_24513 ) ( AVAILABLE ?auto_24489 ) ( SURFACE-AT ?auto_24468 ?auto_24513 ) ( ON ?auto_24468 ?auto_24478 ) ( CLEAR ?auto_24468 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24467 ?auto_24478 ) ) ( not ( = ?auto_24468 ?auto_24478 ) ) ( not ( = ?auto_24474 ?auto_24489 ) ) ( IS-CRATE ?auto_24467 ) ( not ( = ?auto_24514 ?auto_24476 ) ) ( HOIST-AT ?auto_24496 ?auto_24514 ) ( AVAILABLE ?auto_24496 ) ( SURFACE-AT ?auto_24467 ?auto_24514 ) ( ON ?auto_24467 ?auto_24501 ) ( CLEAR ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24467 ) ) ( not ( = ?auto_24466 ?auto_24501 ) ) ( not ( = ?auto_24467 ?auto_24501 ) ) ( not ( = ?auto_24474 ?auto_24496 ) ) ( IS-CRATE ?auto_24466 ) ( not ( = ?auto_24507 ?auto_24476 ) ) ( HOIST-AT ?auto_24508 ?auto_24507 ) ( AVAILABLE ?auto_24508 ) ( SURFACE-AT ?auto_24466 ?auto_24507 ) ( ON ?auto_24466 ?auto_24500 ) ( CLEAR ?auto_24466 ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24500 ) ) ( not ( = ?auto_24466 ?auto_24500 ) ) ( not ( = ?auto_24474 ?auto_24508 ) ) ( IS-CRATE ?auto_24465 ) ( not ( = ?auto_24494 ?auto_24476 ) ) ( HOIST-AT ?auto_24488 ?auto_24494 ) ( AVAILABLE ?auto_24488 ) ( SURFACE-AT ?auto_24465 ?auto_24494 ) ( ON ?auto_24465 ?auto_24512 ) ( CLEAR ?auto_24465 ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24512 ) ) ( not ( = ?auto_24465 ?auto_24512 ) ) ( not ( = ?auto_24474 ?auto_24488 ) ) ( IS-CRATE ?auto_24464 ) ( not ( = ?auto_24509 ?auto_24476 ) ) ( HOIST-AT ?auto_24485 ?auto_24509 ) ( AVAILABLE ?auto_24485 ) ( SURFACE-AT ?auto_24464 ?auto_24509 ) ( ON ?auto_24464 ?auto_24481 ) ( CLEAR ?auto_24464 ) ( not ( = ?auto_24463 ?auto_24464 ) ) ( not ( = ?auto_24463 ?auto_24481 ) ) ( not ( = ?auto_24464 ?auto_24481 ) ) ( not ( = ?auto_24474 ?auto_24485 ) ) ( IS-CRATE ?auto_24463 ) ( not ( = ?auto_24517 ?auto_24476 ) ) ( HOIST-AT ?auto_24506 ?auto_24517 ) ( AVAILABLE ?auto_24506 ) ( SURFACE-AT ?auto_24463 ?auto_24517 ) ( ON ?auto_24463 ?auto_24515 ) ( CLEAR ?auto_24463 ) ( not ( = ?auto_24462 ?auto_24463 ) ) ( not ( = ?auto_24462 ?auto_24515 ) ) ( not ( = ?auto_24463 ?auto_24515 ) ) ( not ( = ?auto_24474 ?auto_24506 ) ) ( IS-CRATE ?auto_24462 ) ( not ( = ?auto_24477 ?auto_24476 ) ) ( HOIST-AT ?auto_24486 ?auto_24477 ) ( SURFACE-AT ?auto_24462 ?auto_24477 ) ( ON ?auto_24462 ?auto_24511 ) ( CLEAR ?auto_24462 ) ( not ( = ?auto_24461 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24511 ) ) ( not ( = ?auto_24462 ?auto_24511 ) ) ( not ( = ?auto_24474 ?auto_24486 ) ) ( IS-CRATE ?auto_24461 ) ( AVAILABLE ?auto_24486 ) ( SURFACE-AT ?auto_24461 ?auto_24477 ) ( ON ?auto_24461 ?auto_24497 ) ( CLEAR ?auto_24461 ) ( not ( = ?auto_24460 ?auto_24461 ) ) ( not ( = ?auto_24460 ?auto_24497 ) ) ( not ( = ?auto_24461 ?auto_24497 ) ) ( IS-CRATE ?auto_24460 ) ( not ( = ?auto_24480 ?auto_24476 ) ) ( HOIST-AT ?auto_24492 ?auto_24480 ) ( AVAILABLE ?auto_24492 ) ( SURFACE-AT ?auto_24460 ?auto_24480 ) ( ON ?auto_24460 ?auto_24491 ) ( CLEAR ?auto_24460 ) ( not ( = ?auto_24459 ?auto_24460 ) ) ( not ( = ?auto_24459 ?auto_24491 ) ) ( not ( = ?auto_24460 ?auto_24491 ) ) ( not ( = ?auto_24474 ?auto_24492 ) ) ( IS-CRATE ?auto_24459 ) ( not ( = ?auto_24495 ?auto_24476 ) ) ( HOIST-AT ?auto_24504 ?auto_24495 ) ( AVAILABLE ?auto_24504 ) ( SURFACE-AT ?auto_24459 ?auto_24495 ) ( ON ?auto_24459 ?auto_24482 ) ( CLEAR ?auto_24459 ) ( not ( = ?auto_24458 ?auto_24459 ) ) ( not ( = ?auto_24458 ?auto_24482 ) ) ( not ( = ?auto_24459 ?auto_24482 ) ) ( not ( = ?auto_24474 ?auto_24504 ) ) ( IS-CRATE ?auto_24458 ) ( not ( = ?auto_24503 ?auto_24476 ) ) ( HOIST-AT ?auto_24479 ?auto_24503 ) ( AVAILABLE ?auto_24479 ) ( SURFACE-AT ?auto_24458 ?auto_24503 ) ( ON ?auto_24458 ?auto_24484 ) ( CLEAR ?auto_24458 ) ( not ( = ?auto_24457 ?auto_24458 ) ) ( not ( = ?auto_24457 ?auto_24484 ) ) ( not ( = ?auto_24458 ?auto_24484 ) ) ( not ( = ?auto_24474 ?auto_24479 ) ) ( IS-CRATE ?auto_24457 ) ( AVAILABLE ?auto_24499 ) ( SURFACE-AT ?auto_24457 ?auto_24493 ) ( ON ?auto_24457 ?auto_24487 ) ( CLEAR ?auto_24457 ) ( not ( = ?auto_24456 ?auto_24457 ) ) ( not ( = ?auto_24456 ?auto_24487 ) ) ( not ( = ?auto_24457 ?auto_24487 ) ) ( IS-CRATE ?auto_24456 ) ( not ( = ?auto_24490 ?auto_24476 ) ) ( HOIST-AT ?auto_24483 ?auto_24490 ) ( AVAILABLE ?auto_24483 ) ( SURFACE-AT ?auto_24456 ?auto_24490 ) ( ON ?auto_24456 ?auto_24502 ) ( CLEAR ?auto_24456 ) ( not ( = ?auto_24455 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24502 ) ) ( not ( = ?auto_24456 ?auto_24502 ) ) ( not ( = ?auto_24474 ?auto_24483 ) ) ( SURFACE-AT ?auto_24454 ?auto_24476 ) ( CLEAR ?auto_24454 ) ( IS-CRATE ?auto_24455 ) ( AVAILABLE ?auto_24474 ) ( not ( = ?auto_24516 ?auto_24476 ) ) ( HOIST-AT ?auto_24505 ?auto_24516 ) ( AVAILABLE ?auto_24505 ) ( SURFACE-AT ?auto_24455 ?auto_24516 ) ( ON ?auto_24455 ?auto_24510 ) ( CLEAR ?auto_24455 ) ( TRUCK-AT ?auto_24471 ?auto_24476 ) ( not ( = ?auto_24454 ?auto_24455 ) ) ( not ( = ?auto_24454 ?auto_24510 ) ) ( not ( = ?auto_24455 ?auto_24510 ) ) ( not ( = ?auto_24474 ?auto_24505 ) ) ( not ( = ?auto_24454 ?auto_24456 ) ) ( not ( = ?auto_24454 ?auto_24502 ) ) ( not ( = ?auto_24456 ?auto_24510 ) ) ( not ( = ?auto_24490 ?auto_24516 ) ) ( not ( = ?auto_24483 ?auto_24505 ) ) ( not ( = ?auto_24502 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24457 ) ) ( not ( = ?auto_24454 ?auto_24487 ) ) ( not ( = ?auto_24455 ?auto_24457 ) ) ( not ( = ?auto_24455 ?auto_24487 ) ) ( not ( = ?auto_24457 ?auto_24502 ) ) ( not ( = ?auto_24457 ?auto_24510 ) ) ( not ( = ?auto_24493 ?auto_24490 ) ) ( not ( = ?auto_24493 ?auto_24516 ) ) ( not ( = ?auto_24499 ?auto_24483 ) ) ( not ( = ?auto_24499 ?auto_24505 ) ) ( not ( = ?auto_24487 ?auto_24502 ) ) ( not ( = ?auto_24487 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24458 ) ) ( not ( = ?auto_24454 ?auto_24484 ) ) ( not ( = ?auto_24455 ?auto_24458 ) ) ( not ( = ?auto_24455 ?auto_24484 ) ) ( not ( = ?auto_24456 ?auto_24458 ) ) ( not ( = ?auto_24456 ?auto_24484 ) ) ( not ( = ?auto_24458 ?auto_24487 ) ) ( not ( = ?auto_24458 ?auto_24502 ) ) ( not ( = ?auto_24458 ?auto_24510 ) ) ( not ( = ?auto_24503 ?auto_24493 ) ) ( not ( = ?auto_24503 ?auto_24490 ) ) ( not ( = ?auto_24503 ?auto_24516 ) ) ( not ( = ?auto_24479 ?auto_24499 ) ) ( not ( = ?auto_24479 ?auto_24483 ) ) ( not ( = ?auto_24479 ?auto_24505 ) ) ( not ( = ?auto_24484 ?auto_24487 ) ) ( not ( = ?auto_24484 ?auto_24502 ) ) ( not ( = ?auto_24484 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24459 ) ) ( not ( = ?auto_24454 ?auto_24482 ) ) ( not ( = ?auto_24455 ?auto_24459 ) ) ( not ( = ?auto_24455 ?auto_24482 ) ) ( not ( = ?auto_24456 ?auto_24459 ) ) ( not ( = ?auto_24456 ?auto_24482 ) ) ( not ( = ?auto_24457 ?auto_24459 ) ) ( not ( = ?auto_24457 ?auto_24482 ) ) ( not ( = ?auto_24459 ?auto_24484 ) ) ( not ( = ?auto_24459 ?auto_24487 ) ) ( not ( = ?auto_24459 ?auto_24502 ) ) ( not ( = ?auto_24459 ?auto_24510 ) ) ( not ( = ?auto_24495 ?auto_24503 ) ) ( not ( = ?auto_24495 ?auto_24493 ) ) ( not ( = ?auto_24495 ?auto_24490 ) ) ( not ( = ?auto_24495 ?auto_24516 ) ) ( not ( = ?auto_24504 ?auto_24479 ) ) ( not ( = ?auto_24504 ?auto_24499 ) ) ( not ( = ?auto_24504 ?auto_24483 ) ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( not ( = ?auto_24482 ?auto_24484 ) ) ( not ( = ?auto_24482 ?auto_24487 ) ) ( not ( = ?auto_24482 ?auto_24502 ) ) ( not ( = ?auto_24482 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24460 ) ) ( not ( = ?auto_24454 ?auto_24491 ) ) ( not ( = ?auto_24455 ?auto_24460 ) ) ( not ( = ?auto_24455 ?auto_24491 ) ) ( not ( = ?auto_24456 ?auto_24460 ) ) ( not ( = ?auto_24456 ?auto_24491 ) ) ( not ( = ?auto_24457 ?auto_24460 ) ) ( not ( = ?auto_24457 ?auto_24491 ) ) ( not ( = ?auto_24458 ?auto_24460 ) ) ( not ( = ?auto_24458 ?auto_24491 ) ) ( not ( = ?auto_24460 ?auto_24482 ) ) ( not ( = ?auto_24460 ?auto_24484 ) ) ( not ( = ?auto_24460 ?auto_24487 ) ) ( not ( = ?auto_24460 ?auto_24502 ) ) ( not ( = ?auto_24460 ?auto_24510 ) ) ( not ( = ?auto_24480 ?auto_24495 ) ) ( not ( = ?auto_24480 ?auto_24503 ) ) ( not ( = ?auto_24480 ?auto_24493 ) ) ( not ( = ?auto_24480 ?auto_24490 ) ) ( not ( = ?auto_24480 ?auto_24516 ) ) ( not ( = ?auto_24492 ?auto_24504 ) ) ( not ( = ?auto_24492 ?auto_24479 ) ) ( not ( = ?auto_24492 ?auto_24499 ) ) ( not ( = ?auto_24492 ?auto_24483 ) ) ( not ( = ?auto_24492 ?auto_24505 ) ) ( not ( = ?auto_24491 ?auto_24482 ) ) ( not ( = ?auto_24491 ?auto_24484 ) ) ( not ( = ?auto_24491 ?auto_24487 ) ) ( not ( = ?auto_24491 ?auto_24502 ) ) ( not ( = ?auto_24491 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24461 ) ) ( not ( = ?auto_24454 ?auto_24497 ) ) ( not ( = ?auto_24455 ?auto_24461 ) ) ( not ( = ?auto_24455 ?auto_24497 ) ) ( not ( = ?auto_24456 ?auto_24461 ) ) ( not ( = ?auto_24456 ?auto_24497 ) ) ( not ( = ?auto_24457 ?auto_24461 ) ) ( not ( = ?auto_24457 ?auto_24497 ) ) ( not ( = ?auto_24458 ?auto_24461 ) ) ( not ( = ?auto_24458 ?auto_24497 ) ) ( not ( = ?auto_24459 ?auto_24461 ) ) ( not ( = ?auto_24459 ?auto_24497 ) ) ( not ( = ?auto_24461 ?auto_24491 ) ) ( not ( = ?auto_24461 ?auto_24482 ) ) ( not ( = ?auto_24461 ?auto_24484 ) ) ( not ( = ?auto_24461 ?auto_24487 ) ) ( not ( = ?auto_24461 ?auto_24502 ) ) ( not ( = ?auto_24461 ?auto_24510 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24477 ?auto_24495 ) ) ( not ( = ?auto_24477 ?auto_24503 ) ) ( not ( = ?auto_24477 ?auto_24493 ) ) ( not ( = ?auto_24477 ?auto_24490 ) ) ( not ( = ?auto_24477 ?auto_24516 ) ) ( not ( = ?auto_24486 ?auto_24492 ) ) ( not ( = ?auto_24486 ?auto_24504 ) ) ( not ( = ?auto_24486 ?auto_24479 ) ) ( not ( = ?auto_24486 ?auto_24499 ) ) ( not ( = ?auto_24486 ?auto_24483 ) ) ( not ( = ?auto_24486 ?auto_24505 ) ) ( not ( = ?auto_24497 ?auto_24491 ) ) ( not ( = ?auto_24497 ?auto_24482 ) ) ( not ( = ?auto_24497 ?auto_24484 ) ) ( not ( = ?auto_24497 ?auto_24487 ) ) ( not ( = ?auto_24497 ?auto_24502 ) ) ( not ( = ?auto_24497 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24462 ) ) ( not ( = ?auto_24454 ?auto_24511 ) ) ( not ( = ?auto_24455 ?auto_24462 ) ) ( not ( = ?auto_24455 ?auto_24511 ) ) ( not ( = ?auto_24456 ?auto_24462 ) ) ( not ( = ?auto_24456 ?auto_24511 ) ) ( not ( = ?auto_24457 ?auto_24462 ) ) ( not ( = ?auto_24457 ?auto_24511 ) ) ( not ( = ?auto_24458 ?auto_24462 ) ) ( not ( = ?auto_24458 ?auto_24511 ) ) ( not ( = ?auto_24459 ?auto_24462 ) ) ( not ( = ?auto_24459 ?auto_24511 ) ) ( not ( = ?auto_24460 ?auto_24462 ) ) ( not ( = ?auto_24460 ?auto_24511 ) ) ( not ( = ?auto_24462 ?auto_24497 ) ) ( not ( = ?auto_24462 ?auto_24491 ) ) ( not ( = ?auto_24462 ?auto_24482 ) ) ( not ( = ?auto_24462 ?auto_24484 ) ) ( not ( = ?auto_24462 ?auto_24487 ) ) ( not ( = ?auto_24462 ?auto_24502 ) ) ( not ( = ?auto_24462 ?auto_24510 ) ) ( not ( = ?auto_24511 ?auto_24497 ) ) ( not ( = ?auto_24511 ?auto_24491 ) ) ( not ( = ?auto_24511 ?auto_24482 ) ) ( not ( = ?auto_24511 ?auto_24484 ) ) ( not ( = ?auto_24511 ?auto_24487 ) ) ( not ( = ?auto_24511 ?auto_24502 ) ) ( not ( = ?auto_24511 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24463 ) ) ( not ( = ?auto_24454 ?auto_24515 ) ) ( not ( = ?auto_24455 ?auto_24463 ) ) ( not ( = ?auto_24455 ?auto_24515 ) ) ( not ( = ?auto_24456 ?auto_24463 ) ) ( not ( = ?auto_24456 ?auto_24515 ) ) ( not ( = ?auto_24457 ?auto_24463 ) ) ( not ( = ?auto_24457 ?auto_24515 ) ) ( not ( = ?auto_24458 ?auto_24463 ) ) ( not ( = ?auto_24458 ?auto_24515 ) ) ( not ( = ?auto_24459 ?auto_24463 ) ) ( not ( = ?auto_24459 ?auto_24515 ) ) ( not ( = ?auto_24460 ?auto_24463 ) ) ( not ( = ?auto_24460 ?auto_24515 ) ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( not ( = ?auto_24461 ?auto_24515 ) ) ( not ( = ?auto_24463 ?auto_24511 ) ) ( not ( = ?auto_24463 ?auto_24497 ) ) ( not ( = ?auto_24463 ?auto_24491 ) ) ( not ( = ?auto_24463 ?auto_24482 ) ) ( not ( = ?auto_24463 ?auto_24484 ) ) ( not ( = ?auto_24463 ?auto_24487 ) ) ( not ( = ?auto_24463 ?auto_24502 ) ) ( not ( = ?auto_24463 ?auto_24510 ) ) ( not ( = ?auto_24517 ?auto_24477 ) ) ( not ( = ?auto_24517 ?auto_24480 ) ) ( not ( = ?auto_24517 ?auto_24495 ) ) ( not ( = ?auto_24517 ?auto_24503 ) ) ( not ( = ?auto_24517 ?auto_24493 ) ) ( not ( = ?auto_24517 ?auto_24490 ) ) ( not ( = ?auto_24517 ?auto_24516 ) ) ( not ( = ?auto_24506 ?auto_24486 ) ) ( not ( = ?auto_24506 ?auto_24492 ) ) ( not ( = ?auto_24506 ?auto_24504 ) ) ( not ( = ?auto_24506 ?auto_24479 ) ) ( not ( = ?auto_24506 ?auto_24499 ) ) ( not ( = ?auto_24506 ?auto_24483 ) ) ( not ( = ?auto_24506 ?auto_24505 ) ) ( not ( = ?auto_24515 ?auto_24511 ) ) ( not ( = ?auto_24515 ?auto_24497 ) ) ( not ( = ?auto_24515 ?auto_24491 ) ) ( not ( = ?auto_24515 ?auto_24482 ) ) ( not ( = ?auto_24515 ?auto_24484 ) ) ( not ( = ?auto_24515 ?auto_24487 ) ) ( not ( = ?auto_24515 ?auto_24502 ) ) ( not ( = ?auto_24515 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24464 ) ) ( not ( = ?auto_24454 ?auto_24481 ) ) ( not ( = ?auto_24455 ?auto_24464 ) ) ( not ( = ?auto_24455 ?auto_24481 ) ) ( not ( = ?auto_24456 ?auto_24464 ) ) ( not ( = ?auto_24456 ?auto_24481 ) ) ( not ( = ?auto_24457 ?auto_24464 ) ) ( not ( = ?auto_24457 ?auto_24481 ) ) ( not ( = ?auto_24458 ?auto_24464 ) ) ( not ( = ?auto_24458 ?auto_24481 ) ) ( not ( = ?auto_24459 ?auto_24464 ) ) ( not ( = ?auto_24459 ?auto_24481 ) ) ( not ( = ?auto_24460 ?auto_24464 ) ) ( not ( = ?auto_24460 ?auto_24481 ) ) ( not ( = ?auto_24461 ?auto_24464 ) ) ( not ( = ?auto_24461 ?auto_24481 ) ) ( not ( = ?auto_24462 ?auto_24464 ) ) ( not ( = ?auto_24462 ?auto_24481 ) ) ( not ( = ?auto_24464 ?auto_24515 ) ) ( not ( = ?auto_24464 ?auto_24511 ) ) ( not ( = ?auto_24464 ?auto_24497 ) ) ( not ( = ?auto_24464 ?auto_24491 ) ) ( not ( = ?auto_24464 ?auto_24482 ) ) ( not ( = ?auto_24464 ?auto_24484 ) ) ( not ( = ?auto_24464 ?auto_24487 ) ) ( not ( = ?auto_24464 ?auto_24502 ) ) ( not ( = ?auto_24464 ?auto_24510 ) ) ( not ( = ?auto_24509 ?auto_24517 ) ) ( not ( = ?auto_24509 ?auto_24477 ) ) ( not ( = ?auto_24509 ?auto_24480 ) ) ( not ( = ?auto_24509 ?auto_24495 ) ) ( not ( = ?auto_24509 ?auto_24503 ) ) ( not ( = ?auto_24509 ?auto_24493 ) ) ( not ( = ?auto_24509 ?auto_24490 ) ) ( not ( = ?auto_24509 ?auto_24516 ) ) ( not ( = ?auto_24485 ?auto_24506 ) ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( not ( = ?auto_24485 ?auto_24492 ) ) ( not ( = ?auto_24485 ?auto_24504 ) ) ( not ( = ?auto_24485 ?auto_24479 ) ) ( not ( = ?auto_24485 ?auto_24499 ) ) ( not ( = ?auto_24485 ?auto_24483 ) ) ( not ( = ?auto_24485 ?auto_24505 ) ) ( not ( = ?auto_24481 ?auto_24515 ) ) ( not ( = ?auto_24481 ?auto_24511 ) ) ( not ( = ?auto_24481 ?auto_24497 ) ) ( not ( = ?auto_24481 ?auto_24491 ) ) ( not ( = ?auto_24481 ?auto_24482 ) ) ( not ( = ?auto_24481 ?auto_24484 ) ) ( not ( = ?auto_24481 ?auto_24487 ) ) ( not ( = ?auto_24481 ?auto_24502 ) ) ( not ( = ?auto_24481 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24465 ) ) ( not ( = ?auto_24454 ?auto_24512 ) ) ( not ( = ?auto_24455 ?auto_24465 ) ) ( not ( = ?auto_24455 ?auto_24512 ) ) ( not ( = ?auto_24456 ?auto_24465 ) ) ( not ( = ?auto_24456 ?auto_24512 ) ) ( not ( = ?auto_24457 ?auto_24465 ) ) ( not ( = ?auto_24457 ?auto_24512 ) ) ( not ( = ?auto_24458 ?auto_24465 ) ) ( not ( = ?auto_24458 ?auto_24512 ) ) ( not ( = ?auto_24459 ?auto_24465 ) ) ( not ( = ?auto_24459 ?auto_24512 ) ) ( not ( = ?auto_24460 ?auto_24465 ) ) ( not ( = ?auto_24460 ?auto_24512 ) ) ( not ( = ?auto_24461 ?auto_24465 ) ) ( not ( = ?auto_24461 ?auto_24512 ) ) ( not ( = ?auto_24462 ?auto_24465 ) ) ( not ( = ?auto_24462 ?auto_24512 ) ) ( not ( = ?auto_24463 ?auto_24465 ) ) ( not ( = ?auto_24463 ?auto_24512 ) ) ( not ( = ?auto_24465 ?auto_24481 ) ) ( not ( = ?auto_24465 ?auto_24515 ) ) ( not ( = ?auto_24465 ?auto_24511 ) ) ( not ( = ?auto_24465 ?auto_24497 ) ) ( not ( = ?auto_24465 ?auto_24491 ) ) ( not ( = ?auto_24465 ?auto_24482 ) ) ( not ( = ?auto_24465 ?auto_24484 ) ) ( not ( = ?auto_24465 ?auto_24487 ) ) ( not ( = ?auto_24465 ?auto_24502 ) ) ( not ( = ?auto_24465 ?auto_24510 ) ) ( not ( = ?auto_24494 ?auto_24509 ) ) ( not ( = ?auto_24494 ?auto_24517 ) ) ( not ( = ?auto_24494 ?auto_24477 ) ) ( not ( = ?auto_24494 ?auto_24480 ) ) ( not ( = ?auto_24494 ?auto_24495 ) ) ( not ( = ?auto_24494 ?auto_24503 ) ) ( not ( = ?auto_24494 ?auto_24493 ) ) ( not ( = ?auto_24494 ?auto_24490 ) ) ( not ( = ?auto_24494 ?auto_24516 ) ) ( not ( = ?auto_24488 ?auto_24485 ) ) ( not ( = ?auto_24488 ?auto_24506 ) ) ( not ( = ?auto_24488 ?auto_24486 ) ) ( not ( = ?auto_24488 ?auto_24492 ) ) ( not ( = ?auto_24488 ?auto_24504 ) ) ( not ( = ?auto_24488 ?auto_24479 ) ) ( not ( = ?auto_24488 ?auto_24499 ) ) ( not ( = ?auto_24488 ?auto_24483 ) ) ( not ( = ?auto_24488 ?auto_24505 ) ) ( not ( = ?auto_24512 ?auto_24481 ) ) ( not ( = ?auto_24512 ?auto_24515 ) ) ( not ( = ?auto_24512 ?auto_24511 ) ) ( not ( = ?auto_24512 ?auto_24497 ) ) ( not ( = ?auto_24512 ?auto_24491 ) ) ( not ( = ?auto_24512 ?auto_24482 ) ) ( not ( = ?auto_24512 ?auto_24484 ) ) ( not ( = ?auto_24512 ?auto_24487 ) ) ( not ( = ?auto_24512 ?auto_24502 ) ) ( not ( = ?auto_24512 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24466 ) ) ( not ( = ?auto_24454 ?auto_24500 ) ) ( not ( = ?auto_24455 ?auto_24466 ) ) ( not ( = ?auto_24455 ?auto_24500 ) ) ( not ( = ?auto_24456 ?auto_24466 ) ) ( not ( = ?auto_24456 ?auto_24500 ) ) ( not ( = ?auto_24457 ?auto_24466 ) ) ( not ( = ?auto_24457 ?auto_24500 ) ) ( not ( = ?auto_24458 ?auto_24466 ) ) ( not ( = ?auto_24458 ?auto_24500 ) ) ( not ( = ?auto_24459 ?auto_24466 ) ) ( not ( = ?auto_24459 ?auto_24500 ) ) ( not ( = ?auto_24460 ?auto_24466 ) ) ( not ( = ?auto_24460 ?auto_24500 ) ) ( not ( = ?auto_24461 ?auto_24466 ) ) ( not ( = ?auto_24461 ?auto_24500 ) ) ( not ( = ?auto_24462 ?auto_24466 ) ) ( not ( = ?auto_24462 ?auto_24500 ) ) ( not ( = ?auto_24463 ?auto_24466 ) ) ( not ( = ?auto_24463 ?auto_24500 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24500 ) ) ( not ( = ?auto_24466 ?auto_24512 ) ) ( not ( = ?auto_24466 ?auto_24481 ) ) ( not ( = ?auto_24466 ?auto_24515 ) ) ( not ( = ?auto_24466 ?auto_24511 ) ) ( not ( = ?auto_24466 ?auto_24497 ) ) ( not ( = ?auto_24466 ?auto_24491 ) ) ( not ( = ?auto_24466 ?auto_24482 ) ) ( not ( = ?auto_24466 ?auto_24484 ) ) ( not ( = ?auto_24466 ?auto_24487 ) ) ( not ( = ?auto_24466 ?auto_24502 ) ) ( not ( = ?auto_24466 ?auto_24510 ) ) ( not ( = ?auto_24507 ?auto_24494 ) ) ( not ( = ?auto_24507 ?auto_24509 ) ) ( not ( = ?auto_24507 ?auto_24517 ) ) ( not ( = ?auto_24507 ?auto_24477 ) ) ( not ( = ?auto_24507 ?auto_24480 ) ) ( not ( = ?auto_24507 ?auto_24495 ) ) ( not ( = ?auto_24507 ?auto_24503 ) ) ( not ( = ?auto_24507 ?auto_24493 ) ) ( not ( = ?auto_24507 ?auto_24490 ) ) ( not ( = ?auto_24507 ?auto_24516 ) ) ( not ( = ?auto_24508 ?auto_24488 ) ) ( not ( = ?auto_24508 ?auto_24485 ) ) ( not ( = ?auto_24508 ?auto_24506 ) ) ( not ( = ?auto_24508 ?auto_24486 ) ) ( not ( = ?auto_24508 ?auto_24492 ) ) ( not ( = ?auto_24508 ?auto_24504 ) ) ( not ( = ?auto_24508 ?auto_24479 ) ) ( not ( = ?auto_24508 ?auto_24499 ) ) ( not ( = ?auto_24508 ?auto_24483 ) ) ( not ( = ?auto_24508 ?auto_24505 ) ) ( not ( = ?auto_24500 ?auto_24512 ) ) ( not ( = ?auto_24500 ?auto_24481 ) ) ( not ( = ?auto_24500 ?auto_24515 ) ) ( not ( = ?auto_24500 ?auto_24511 ) ) ( not ( = ?auto_24500 ?auto_24497 ) ) ( not ( = ?auto_24500 ?auto_24491 ) ) ( not ( = ?auto_24500 ?auto_24482 ) ) ( not ( = ?auto_24500 ?auto_24484 ) ) ( not ( = ?auto_24500 ?auto_24487 ) ) ( not ( = ?auto_24500 ?auto_24502 ) ) ( not ( = ?auto_24500 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24467 ) ) ( not ( = ?auto_24454 ?auto_24501 ) ) ( not ( = ?auto_24455 ?auto_24467 ) ) ( not ( = ?auto_24455 ?auto_24501 ) ) ( not ( = ?auto_24456 ?auto_24467 ) ) ( not ( = ?auto_24456 ?auto_24501 ) ) ( not ( = ?auto_24457 ?auto_24467 ) ) ( not ( = ?auto_24457 ?auto_24501 ) ) ( not ( = ?auto_24458 ?auto_24467 ) ) ( not ( = ?auto_24458 ?auto_24501 ) ) ( not ( = ?auto_24459 ?auto_24467 ) ) ( not ( = ?auto_24459 ?auto_24501 ) ) ( not ( = ?auto_24460 ?auto_24467 ) ) ( not ( = ?auto_24460 ?auto_24501 ) ) ( not ( = ?auto_24461 ?auto_24467 ) ) ( not ( = ?auto_24461 ?auto_24501 ) ) ( not ( = ?auto_24462 ?auto_24467 ) ) ( not ( = ?auto_24462 ?auto_24501 ) ) ( not ( = ?auto_24463 ?auto_24467 ) ) ( not ( = ?auto_24463 ?auto_24501 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24501 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( not ( = ?auto_24465 ?auto_24501 ) ) ( not ( = ?auto_24467 ?auto_24500 ) ) ( not ( = ?auto_24467 ?auto_24512 ) ) ( not ( = ?auto_24467 ?auto_24481 ) ) ( not ( = ?auto_24467 ?auto_24515 ) ) ( not ( = ?auto_24467 ?auto_24511 ) ) ( not ( = ?auto_24467 ?auto_24497 ) ) ( not ( = ?auto_24467 ?auto_24491 ) ) ( not ( = ?auto_24467 ?auto_24482 ) ) ( not ( = ?auto_24467 ?auto_24484 ) ) ( not ( = ?auto_24467 ?auto_24487 ) ) ( not ( = ?auto_24467 ?auto_24502 ) ) ( not ( = ?auto_24467 ?auto_24510 ) ) ( not ( = ?auto_24514 ?auto_24507 ) ) ( not ( = ?auto_24514 ?auto_24494 ) ) ( not ( = ?auto_24514 ?auto_24509 ) ) ( not ( = ?auto_24514 ?auto_24517 ) ) ( not ( = ?auto_24514 ?auto_24477 ) ) ( not ( = ?auto_24514 ?auto_24480 ) ) ( not ( = ?auto_24514 ?auto_24495 ) ) ( not ( = ?auto_24514 ?auto_24503 ) ) ( not ( = ?auto_24514 ?auto_24493 ) ) ( not ( = ?auto_24514 ?auto_24490 ) ) ( not ( = ?auto_24514 ?auto_24516 ) ) ( not ( = ?auto_24496 ?auto_24508 ) ) ( not ( = ?auto_24496 ?auto_24488 ) ) ( not ( = ?auto_24496 ?auto_24485 ) ) ( not ( = ?auto_24496 ?auto_24506 ) ) ( not ( = ?auto_24496 ?auto_24486 ) ) ( not ( = ?auto_24496 ?auto_24492 ) ) ( not ( = ?auto_24496 ?auto_24504 ) ) ( not ( = ?auto_24496 ?auto_24479 ) ) ( not ( = ?auto_24496 ?auto_24499 ) ) ( not ( = ?auto_24496 ?auto_24483 ) ) ( not ( = ?auto_24496 ?auto_24505 ) ) ( not ( = ?auto_24501 ?auto_24500 ) ) ( not ( = ?auto_24501 ?auto_24512 ) ) ( not ( = ?auto_24501 ?auto_24481 ) ) ( not ( = ?auto_24501 ?auto_24515 ) ) ( not ( = ?auto_24501 ?auto_24511 ) ) ( not ( = ?auto_24501 ?auto_24497 ) ) ( not ( = ?auto_24501 ?auto_24491 ) ) ( not ( = ?auto_24501 ?auto_24482 ) ) ( not ( = ?auto_24501 ?auto_24484 ) ) ( not ( = ?auto_24501 ?auto_24487 ) ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( not ( = ?auto_24501 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24468 ) ) ( not ( = ?auto_24454 ?auto_24478 ) ) ( not ( = ?auto_24455 ?auto_24468 ) ) ( not ( = ?auto_24455 ?auto_24478 ) ) ( not ( = ?auto_24456 ?auto_24468 ) ) ( not ( = ?auto_24456 ?auto_24478 ) ) ( not ( = ?auto_24457 ?auto_24468 ) ) ( not ( = ?auto_24457 ?auto_24478 ) ) ( not ( = ?auto_24458 ?auto_24468 ) ) ( not ( = ?auto_24458 ?auto_24478 ) ) ( not ( = ?auto_24459 ?auto_24468 ) ) ( not ( = ?auto_24459 ?auto_24478 ) ) ( not ( = ?auto_24460 ?auto_24468 ) ) ( not ( = ?auto_24460 ?auto_24478 ) ) ( not ( = ?auto_24461 ?auto_24468 ) ) ( not ( = ?auto_24461 ?auto_24478 ) ) ( not ( = ?auto_24462 ?auto_24468 ) ) ( not ( = ?auto_24462 ?auto_24478 ) ) ( not ( = ?auto_24463 ?auto_24468 ) ) ( not ( = ?auto_24463 ?auto_24478 ) ) ( not ( = ?auto_24464 ?auto_24468 ) ) ( not ( = ?auto_24464 ?auto_24478 ) ) ( not ( = ?auto_24465 ?auto_24468 ) ) ( not ( = ?auto_24465 ?auto_24478 ) ) ( not ( = ?auto_24466 ?auto_24468 ) ) ( not ( = ?auto_24466 ?auto_24478 ) ) ( not ( = ?auto_24468 ?auto_24501 ) ) ( not ( = ?auto_24468 ?auto_24500 ) ) ( not ( = ?auto_24468 ?auto_24512 ) ) ( not ( = ?auto_24468 ?auto_24481 ) ) ( not ( = ?auto_24468 ?auto_24515 ) ) ( not ( = ?auto_24468 ?auto_24511 ) ) ( not ( = ?auto_24468 ?auto_24497 ) ) ( not ( = ?auto_24468 ?auto_24491 ) ) ( not ( = ?auto_24468 ?auto_24482 ) ) ( not ( = ?auto_24468 ?auto_24484 ) ) ( not ( = ?auto_24468 ?auto_24487 ) ) ( not ( = ?auto_24468 ?auto_24502 ) ) ( not ( = ?auto_24468 ?auto_24510 ) ) ( not ( = ?auto_24513 ?auto_24514 ) ) ( not ( = ?auto_24513 ?auto_24507 ) ) ( not ( = ?auto_24513 ?auto_24494 ) ) ( not ( = ?auto_24513 ?auto_24509 ) ) ( not ( = ?auto_24513 ?auto_24517 ) ) ( not ( = ?auto_24513 ?auto_24477 ) ) ( not ( = ?auto_24513 ?auto_24480 ) ) ( not ( = ?auto_24513 ?auto_24495 ) ) ( not ( = ?auto_24513 ?auto_24503 ) ) ( not ( = ?auto_24513 ?auto_24493 ) ) ( not ( = ?auto_24513 ?auto_24490 ) ) ( not ( = ?auto_24513 ?auto_24516 ) ) ( not ( = ?auto_24489 ?auto_24496 ) ) ( not ( = ?auto_24489 ?auto_24508 ) ) ( not ( = ?auto_24489 ?auto_24488 ) ) ( not ( = ?auto_24489 ?auto_24485 ) ) ( not ( = ?auto_24489 ?auto_24506 ) ) ( not ( = ?auto_24489 ?auto_24486 ) ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24489 ?auto_24504 ) ) ( not ( = ?auto_24489 ?auto_24479 ) ) ( not ( = ?auto_24489 ?auto_24499 ) ) ( not ( = ?auto_24489 ?auto_24483 ) ) ( not ( = ?auto_24489 ?auto_24505 ) ) ( not ( = ?auto_24478 ?auto_24501 ) ) ( not ( = ?auto_24478 ?auto_24500 ) ) ( not ( = ?auto_24478 ?auto_24512 ) ) ( not ( = ?auto_24478 ?auto_24481 ) ) ( not ( = ?auto_24478 ?auto_24515 ) ) ( not ( = ?auto_24478 ?auto_24511 ) ) ( not ( = ?auto_24478 ?auto_24497 ) ) ( not ( = ?auto_24478 ?auto_24491 ) ) ( not ( = ?auto_24478 ?auto_24482 ) ) ( not ( = ?auto_24478 ?auto_24484 ) ) ( not ( = ?auto_24478 ?auto_24487 ) ) ( not ( = ?auto_24478 ?auto_24502 ) ) ( not ( = ?auto_24478 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24469 ) ) ( not ( = ?auto_24454 ?auto_24498 ) ) ( not ( = ?auto_24455 ?auto_24469 ) ) ( not ( = ?auto_24455 ?auto_24498 ) ) ( not ( = ?auto_24456 ?auto_24469 ) ) ( not ( = ?auto_24456 ?auto_24498 ) ) ( not ( = ?auto_24457 ?auto_24469 ) ) ( not ( = ?auto_24457 ?auto_24498 ) ) ( not ( = ?auto_24458 ?auto_24469 ) ) ( not ( = ?auto_24458 ?auto_24498 ) ) ( not ( = ?auto_24459 ?auto_24469 ) ) ( not ( = ?auto_24459 ?auto_24498 ) ) ( not ( = ?auto_24460 ?auto_24469 ) ) ( not ( = ?auto_24460 ?auto_24498 ) ) ( not ( = ?auto_24461 ?auto_24469 ) ) ( not ( = ?auto_24461 ?auto_24498 ) ) ( not ( = ?auto_24462 ?auto_24469 ) ) ( not ( = ?auto_24462 ?auto_24498 ) ) ( not ( = ?auto_24463 ?auto_24469 ) ) ( not ( = ?auto_24463 ?auto_24498 ) ) ( not ( = ?auto_24464 ?auto_24469 ) ) ( not ( = ?auto_24464 ?auto_24498 ) ) ( not ( = ?auto_24465 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24498 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24466 ?auto_24498 ) ) ( not ( = ?auto_24467 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24498 ) ) ( not ( = ?auto_24469 ?auto_24478 ) ) ( not ( = ?auto_24469 ?auto_24501 ) ) ( not ( = ?auto_24469 ?auto_24500 ) ) ( not ( = ?auto_24469 ?auto_24512 ) ) ( not ( = ?auto_24469 ?auto_24481 ) ) ( not ( = ?auto_24469 ?auto_24515 ) ) ( not ( = ?auto_24469 ?auto_24511 ) ) ( not ( = ?auto_24469 ?auto_24497 ) ) ( not ( = ?auto_24469 ?auto_24491 ) ) ( not ( = ?auto_24469 ?auto_24482 ) ) ( not ( = ?auto_24469 ?auto_24484 ) ) ( not ( = ?auto_24469 ?auto_24487 ) ) ( not ( = ?auto_24469 ?auto_24502 ) ) ( not ( = ?auto_24469 ?auto_24510 ) ) ( not ( = ?auto_24498 ?auto_24478 ) ) ( not ( = ?auto_24498 ?auto_24501 ) ) ( not ( = ?auto_24498 ?auto_24500 ) ) ( not ( = ?auto_24498 ?auto_24512 ) ) ( not ( = ?auto_24498 ?auto_24481 ) ) ( not ( = ?auto_24498 ?auto_24515 ) ) ( not ( = ?auto_24498 ?auto_24511 ) ) ( not ( = ?auto_24498 ?auto_24497 ) ) ( not ( = ?auto_24498 ?auto_24491 ) ) ( not ( = ?auto_24498 ?auto_24482 ) ) ( not ( = ?auto_24498 ?auto_24484 ) ) ( not ( = ?auto_24498 ?auto_24487 ) ) ( not ( = ?auto_24498 ?auto_24502 ) ) ( not ( = ?auto_24498 ?auto_24510 ) ) ( not ( = ?auto_24454 ?auto_24470 ) ) ( not ( = ?auto_24454 ?auto_24475 ) ) ( not ( = ?auto_24455 ?auto_24470 ) ) ( not ( = ?auto_24455 ?auto_24475 ) ) ( not ( = ?auto_24456 ?auto_24470 ) ) ( not ( = ?auto_24456 ?auto_24475 ) ) ( not ( = ?auto_24457 ?auto_24470 ) ) ( not ( = ?auto_24457 ?auto_24475 ) ) ( not ( = ?auto_24458 ?auto_24470 ) ) ( not ( = ?auto_24458 ?auto_24475 ) ) ( not ( = ?auto_24459 ?auto_24470 ) ) ( not ( = ?auto_24459 ?auto_24475 ) ) ( not ( = ?auto_24460 ?auto_24470 ) ) ( not ( = ?auto_24460 ?auto_24475 ) ) ( not ( = ?auto_24461 ?auto_24470 ) ) ( not ( = ?auto_24461 ?auto_24475 ) ) ( not ( = ?auto_24462 ?auto_24470 ) ) ( not ( = ?auto_24462 ?auto_24475 ) ) ( not ( = ?auto_24463 ?auto_24470 ) ) ( not ( = ?auto_24463 ?auto_24475 ) ) ( not ( = ?auto_24464 ?auto_24470 ) ) ( not ( = ?auto_24464 ?auto_24475 ) ) ( not ( = ?auto_24465 ?auto_24470 ) ) ( not ( = ?auto_24465 ?auto_24475 ) ) ( not ( = ?auto_24466 ?auto_24470 ) ) ( not ( = ?auto_24466 ?auto_24475 ) ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( not ( = ?auto_24467 ?auto_24475 ) ) ( not ( = ?auto_24468 ?auto_24470 ) ) ( not ( = ?auto_24468 ?auto_24475 ) ) ( not ( = ?auto_24470 ?auto_24498 ) ) ( not ( = ?auto_24470 ?auto_24478 ) ) ( not ( = ?auto_24470 ?auto_24501 ) ) ( not ( = ?auto_24470 ?auto_24500 ) ) ( not ( = ?auto_24470 ?auto_24512 ) ) ( not ( = ?auto_24470 ?auto_24481 ) ) ( not ( = ?auto_24470 ?auto_24515 ) ) ( not ( = ?auto_24470 ?auto_24511 ) ) ( not ( = ?auto_24470 ?auto_24497 ) ) ( not ( = ?auto_24470 ?auto_24491 ) ) ( not ( = ?auto_24470 ?auto_24482 ) ) ( not ( = ?auto_24470 ?auto_24484 ) ) ( not ( = ?auto_24470 ?auto_24487 ) ) ( not ( = ?auto_24470 ?auto_24502 ) ) ( not ( = ?auto_24470 ?auto_24510 ) ) ( not ( = ?auto_24473 ?auto_24493 ) ) ( not ( = ?auto_24473 ?auto_24513 ) ) ( not ( = ?auto_24473 ?auto_24514 ) ) ( not ( = ?auto_24473 ?auto_24507 ) ) ( not ( = ?auto_24473 ?auto_24494 ) ) ( not ( = ?auto_24473 ?auto_24509 ) ) ( not ( = ?auto_24473 ?auto_24517 ) ) ( not ( = ?auto_24473 ?auto_24477 ) ) ( not ( = ?auto_24473 ?auto_24480 ) ) ( not ( = ?auto_24473 ?auto_24495 ) ) ( not ( = ?auto_24473 ?auto_24503 ) ) ( not ( = ?auto_24473 ?auto_24490 ) ) ( not ( = ?auto_24473 ?auto_24516 ) ) ( not ( = ?auto_24472 ?auto_24499 ) ) ( not ( = ?auto_24472 ?auto_24489 ) ) ( not ( = ?auto_24472 ?auto_24496 ) ) ( not ( = ?auto_24472 ?auto_24508 ) ) ( not ( = ?auto_24472 ?auto_24488 ) ) ( not ( = ?auto_24472 ?auto_24485 ) ) ( not ( = ?auto_24472 ?auto_24506 ) ) ( not ( = ?auto_24472 ?auto_24486 ) ) ( not ( = ?auto_24472 ?auto_24492 ) ) ( not ( = ?auto_24472 ?auto_24504 ) ) ( not ( = ?auto_24472 ?auto_24479 ) ) ( not ( = ?auto_24472 ?auto_24483 ) ) ( not ( = ?auto_24472 ?auto_24505 ) ) ( not ( = ?auto_24475 ?auto_24498 ) ) ( not ( = ?auto_24475 ?auto_24478 ) ) ( not ( = ?auto_24475 ?auto_24501 ) ) ( not ( = ?auto_24475 ?auto_24500 ) ) ( not ( = ?auto_24475 ?auto_24512 ) ) ( not ( = ?auto_24475 ?auto_24481 ) ) ( not ( = ?auto_24475 ?auto_24515 ) ) ( not ( = ?auto_24475 ?auto_24511 ) ) ( not ( = ?auto_24475 ?auto_24497 ) ) ( not ( = ?auto_24475 ?auto_24491 ) ) ( not ( = ?auto_24475 ?auto_24482 ) ) ( not ( = ?auto_24475 ?auto_24484 ) ) ( not ( = ?auto_24475 ?auto_24487 ) ) ( not ( = ?auto_24475 ?auto_24502 ) ) ( not ( = ?auto_24475 ?auto_24510 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_24454 ?auto_24455 ?auto_24456 ?auto_24457 ?auto_24458 ?auto_24459 ?auto_24460 ?auto_24461 ?auto_24462 ?auto_24463 ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24469 )
      ( MAKE-1CRATE ?auto_24469 ?auto_24470 )
      ( MAKE-16CRATE-VERIFY ?auto_24454 ?auto_24455 ?auto_24456 ?auto_24457 ?auto_24458 ?auto_24459 ?auto_24460 ?auto_24461 ?auto_24462 ?auto_24463 ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24469 ?auto_24470 ) )
  )

)

