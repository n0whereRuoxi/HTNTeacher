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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23642 - SURFACE
      ?auto_23643 - SURFACE
    )
    :vars
    (
      ?auto_23644 - HOIST
      ?auto_23645 - PLACE
      ?auto_23647 - PLACE
      ?auto_23648 - HOIST
      ?auto_23649 - SURFACE
      ?auto_23646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23644 ?auto_23645 ) ( SURFACE-AT ?auto_23642 ?auto_23645 ) ( CLEAR ?auto_23642 ) ( IS-CRATE ?auto_23643 ) ( AVAILABLE ?auto_23644 ) ( not ( = ?auto_23647 ?auto_23645 ) ) ( HOIST-AT ?auto_23648 ?auto_23647 ) ( AVAILABLE ?auto_23648 ) ( SURFACE-AT ?auto_23643 ?auto_23647 ) ( ON ?auto_23643 ?auto_23649 ) ( CLEAR ?auto_23643 ) ( TRUCK-AT ?auto_23646 ?auto_23645 ) ( not ( = ?auto_23642 ?auto_23643 ) ) ( not ( = ?auto_23642 ?auto_23649 ) ) ( not ( = ?auto_23643 ?auto_23649 ) ) ( not ( = ?auto_23644 ?auto_23648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23646 ?auto_23645 ?auto_23647 )
      ( !LIFT ?auto_23648 ?auto_23643 ?auto_23649 ?auto_23647 )
      ( !LOAD ?auto_23648 ?auto_23643 ?auto_23646 ?auto_23647 )
      ( !DRIVE ?auto_23646 ?auto_23647 ?auto_23645 )
      ( !UNLOAD ?auto_23644 ?auto_23643 ?auto_23646 ?auto_23645 )
      ( !DROP ?auto_23644 ?auto_23643 ?auto_23642 ?auto_23645 )
      ( MAKE-1CRATE-VERIFY ?auto_23642 ?auto_23643 ) )
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
      ?auto_23658 - PLACE
      ?auto_23657 - PLACE
      ?auto_23660 - HOIST
      ?auto_23661 - SURFACE
      ?auto_23662 - PLACE
      ?auto_23663 - HOIST
      ?auto_23664 - SURFACE
      ?auto_23656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23659 ?auto_23658 ) ( IS-CRATE ?auto_23655 ) ( not ( = ?auto_23657 ?auto_23658 ) ) ( HOIST-AT ?auto_23660 ?auto_23657 ) ( AVAILABLE ?auto_23660 ) ( SURFACE-AT ?auto_23655 ?auto_23657 ) ( ON ?auto_23655 ?auto_23661 ) ( CLEAR ?auto_23655 ) ( not ( = ?auto_23654 ?auto_23655 ) ) ( not ( = ?auto_23654 ?auto_23661 ) ) ( not ( = ?auto_23655 ?auto_23661 ) ) ( not ( = ?auto_23659 ?auto_23660 ) ) ( SURFACE-AT ?auto_23653 ?auto_23658 ) ( CLEAR ?auto_23653 ) ( IS-CRATE ?auto_23654 ) ( AVAILABLE ?auto_23659 ) ( not ( = ?auto_23662 ?auto_23658 ) ) ( HOIST-AT ?auto_23663 ?auto_23662 ) ( AVAILABLE ?auto_23663 ) ( SURFACE-AT ?auto_23654 ?auto_23662 ) ( ON ?auto_23654 ?auto_23664 ) ( CLEAR ?auto_23654 ) ( TRUCK-AT ?auto_23656 ?auto_23658 ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23664 ) ) ( not ( = ?auto_23654 ?auto_23664 ) ) ( not ( = ?auto_23659 ?auto_23663 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) ( not ( = ?auto_23653 ?auto_23661 ) ) ( not ( = ?auto_23655 ?auto_23664 ) ) ( not ( = ?auto_23657 ?auto_23662 ) ) ( not ( = ?auto_23660 ?auto_23663 ) ) ( not ( = ?auto_23661 ?auto_23664 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23653 ?auto_23654 )
      ( MAKE-1CRATE ?auto_23654 ?auto_23655 )
      ( MAKE-2CRATE-VERIFY ?auto_23653 ?auto_23654 ?auto_23655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23667 - SURFACE
      ?auto_23668 - SURFACE
    )
    :vars
    (
      ?auto_23669 - HOIST
      ?auto_23670 - PLACE
      ?auto_23672 - PLACE
      ?auto_23673 - HOIST
      ?auto_23674 - SURFACE
      ?auto_23671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23669 ?auto_23670 ) ( SURFACE-AT ?auto_23667 ?auto_23670 ) ( CLEAR ?auto_23667 ) ( IS-CRATE ?auto_23668 ) ( AVAILABLE ?auto_23669 ) ( not ( = ?auto_23672 ?auto_23670 ) ) ( HOIST-AT ?auto_23673 ?auto_23672 ) ( AVAILABLE ?auto_23673 ) ( SURFACE-AT ?auto_23668 ?auto_23672 ) ( ON ?auto_23668 ?auto_23674 ) ( CLEAR ?auto_23668 ) ( TRUCK-AT ?auto_23671 ?auto_23670 ) ( not ( = ?auto_23667 ?auto_23668 ) ) ( not ( = ?auto_23667 ?auto_23674 ) ) ( not ( = ?auto_23668 ?auto_23674 ) ) ( not ( = ?auto_23669 ?auto_23673 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23671 ?auto_23670 ?auto_23672 )
      ( !LIFT ?auto_23673 ?auto_23668 ?auto_23674 ?auto_23672 )
      ( !LOAD ?auto_23673 ?auto_23668 ?auto_23671 ?auto_23672 )
      ( !DRIVE ?auto_23671 ?auto_23672 ?auto_23670 )
      ( !UNLOAD ?auto_23669 ?auto_23668 ?auto_23671 ?auto_23670 )
      ( !DROP ?auto_23669 ?auto_23668 ?auto_23667 ?auto_23670 )
      ( MAKE-1CRATE-VERIFY ?auto_23667 ?auto_23668 ) )
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
      ?auto_23684 - HOIST
      ?auto_23683 - PLACE
      ?auto_23686 - PLACE
      ?auto_23687 - HOIST
      ?auto_23688 - SURFACE
      ?auto_23693 - PLACE
      ?auto_23692 - HOIST
      ?auto_23694 - SURFACE
      ?auto_23691 - PLACE
      ?auto_23689 - HOIST
      ?auto_23690 - SURFACE
      ?auto_23685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23684 ?auto_23683 ) ( IS-CRATE ?auto_23682 ) ( not ( = ?auto_23686 ?auto_23683 ) ) ( HOIST-AT ?auto_23687 ?auto_23686 ) ( AVAILABLE ?auto_23687 ) ( SURFACE-AT ?auto_23682 ?auto_23686 ) ( ON ?auto_23682 ?auto_23688 ) ( CLEAR ?auto_23682 ) ( not ( = ?auto_23681 ?auto_23682 ) ) ( not ( = ?auto_23681 ?auto_23688 ) ) ( not ( = ?auto_23682 ?auto_23688 ) ) ( not ( = ?auto_23684 ?auto_23687 ) ) ( IS-CRATE ?auto_23681 ) ( not ( = ?auto_23693 ?auto_23683 ) ) ( HOIST-AT ?auto_23692 ?auto_23693 ) ( AVAILABLE ?auto_23692 ) ( SURFACE-AT ?auto_23681 ?auto_23693 ) ( ON ?auto_23681 ?auto_23694 ) ( CLEAR ?auto_23681 ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23694 ) ) ( not ( = ?auto_23681 ?auto_23694 ) ) ( not ( = ?auto_23684 ?auto_23692 ) ) ( SURFACE-AT ?auto_23679 ?auto_23683 ) ( CLEAR ?auto_23679 ) ( IS-CRATE ?auto_23680 ) ( AVAILABLE ?auto_23684 ) ( not ( = ?auto_23691 ?auto_23683 ) ) ( HOIST-AT ?auto_23689 ?auto_23691 ) ( AVAILABLE ?auto_23689 ) ( SURFACE-AT ?auto_23680 ?auto_23691 ) ( ON ?auto_23680 ?auto_23690 ) ( CLEAR ?auto_23680 ) ( TRUCK-AT ?auto_23685 ?auto_23683 ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23690 ) ) ( not ( = ?auto_23680 ?auto_23690 ) ) ( not ( = ?auto_23684 ?auto_23689 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23694 ) ) ( not ( = ?auto_23681 ?auto_23690 ) ) ( not ( = ?auto_23693 ?auto_23691 ) ) ( not ( = ?auto_23692 ?auto_23689 ) ) ( not ( = ?auto_23694 ?auto_23690 ) ) ( not ( = ?auto_23679 ?auto_23682 ) ) ( not ( = ?auto_23679 ?auto_23688 ) ) ( not ( = ?auto_23680 ?auto_23682 ) ) ( not ( = ?auto_23680 ?auto_23688 ) ) ( not ( = ?auto_23682 ?auto_23694 ) ) ( not ( = ?auto_23682 ?auto_23690 ) ) ( not ( = ?auto_23686 ?auto_23693 ) ) ( not ( = ?auto_23686 ?auto_23691 ) ) ( not ( = ?auto_23687 ?auto_23692 ) ) ( not ( = ?auto_23687 ?auto_23689 ) ) ( not ( = ?auto_23688 ?auto_23694 ) ) ( not ( = ?auto_23688 ?auto_23690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23679 ?auto_23680 ?auto_23681 )
      ( MAKE-1CRATE ?auto_23681 ?auto_23682 )
      ( MAKE-3CRATE-VERIFY ?auto_23679 ?auto_23680 ?auto_23681 ?auto_23682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23697 - SURFACE
      ?auto_23698 - SURFACE
    )
    :vars
    (
      ?auto_23699 - HOIST
      ?auto_23700 - PLACE
      ?auto_23702 - PLACE
      ?auto_23703 - HOIST
      ?auto_23704 - SURFACE
      ?auto_23701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23699 ?auto_23700 ) ( SURFACE-AT ?auto_23697 ?auto_23700 ) ( CLEAR ?auto_23697 ) ( IS-CRATE ?auto_23698 ) ( AVAILABLE ?auto_23699 ) ( not ( = ?auto_23702 ?auto_23700 ) ) ( HOIST-AT ?auto_23703 ?auto_23702 ) ( AVAILABLE ?auto_23703 ) ( SURFACE-AT ?auto_23698 ?auto_23702 ) ( ON ?auto_23698 ?auto_23704 ) ( CLEAR ?auto_23698 ) ( TRUCK-AT ?auto_23701 ?auto_23700 ) ( not ( = ?auto_23697 ?auto_23698 ) ) ( not ( = ?auto_23697 ?auto_23704 ) ) ( not ( = ?auto_23698 ?auto_23704 ) ) ( not ( = ?auto_23699 ?auto_23703 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23701 ?auto_23700 ?auto_23702 )
      ( !LIFT ?auto_23703 ?auto_23698 ?auto_23704 ?auto_23702 )
      ( !LOAD ?auto_23703 ?auto_23698 ?auto_23701 ?auto_23702 )
      ( !DRIVE ?auto_23701 ?auto_23702 ?auto_23700 )
      ( !UNLOAD ?auto_23699 ?auto_23698 ?auto_23701 ?auto_23700 )
      ( !DROP ?auto_23699 ?auto_23698 ?auto_23697 ?auto_23700 )
      ( MAKE-1CRATE-VERIFY ?auto_23697 ?auto_23698 ) )
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
      ?auto_23715 - HOIST
      ?auto_23720 - PLACE
      ?auto_23719 - PLACE
      ?auto_23716 - HOIST
      ?auto_23718 - SURFACE
      ?auto_23728 - PLACE
      ?auto_23729 - HOIST
      ?auto_23722 - SURFACE
      ?auto_23727 - PLACE
      ?auto_23723 - HOIST
      ?auto_23724 - SURFACE
      ?auto_23721 - PLACE
      ?auto_23726 - HOIST
      ?auto_23725 - SURFACE
      ?auto_23717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23715 ?auto_23720 ) ( IS-CRATE ?auto_23714 ) ( not ( = ?auto_23719 ?auto_23720 ) ) ( HOIST-AT ?auto_23716 ?auto_23719 ) ( AVAILABLE ?auto_23716 ) ( SURFACE-AT ?auto_23714 ?auto_23719 ) ( ON ?auto_23714 ?auto_23718 ) ( CLEAR ?auto_23714 ) ( not ( = ?auto_23713 ?auto_23714 ) ) ( not ( = ?auto_23713 ?auto_23718 ) ) ( not ( = ?auto_23714 ?auto_23718 ) ) ( not ( = ?auto_23715 ?auto_23716 ) ) ( IS-CRATE ?auto_23713 ) ( not ( = ?auto_23728 ?auto_23720 ) ) ( HOIST-AT ?auto_23729 ?auto_23728 ) ( AVAILABLE ?auto_23729 ) ( SURFACE-AT ?auto_23713 ?auto_23728 ) ( ON ?auto_23713 ?auto_23722 ) ( CLEAR ?auto_23713 ) ( not ( = ?auto_23712 ?auto_23713 ) ) ( not ( = ?auto_23712 ?auto_23722 ) ) ( not ( = ?auto_23713 ?auto_23722 ) ) ( not ( = ?auto_23715 ?auto_23729 ) ) ( IS-CRATE ?auto_23712 ) ( not ( = ?auto_23727 ?auto_23720 ) ) ( HOIST-AT ?auto_23723 ?auto_23727 ) ( AVAILABLE ?auto_23723 ) ( SURFACE-AT ?auto_23712 ?auto_23727 ) ( ON ?auto_23712 ?auto_23724 ) ( CLEAR ?auto_23712 ) ( not ( = ?auto_23711 ?auto_23712 ) ) ( not ( = ?auto_23711 ?auto_23724 ) ) ( not ( = ?auto_23712 ?auto_23724 ) ) ( not ( = ?auto_23715 ?auto_23723 ) ) ( SURFACE-AT ?auto_23710 ?auto_23720 ) ( CLEAR ?auto_23710 ) ( IS-CRATE ?auto_23711 ) ( AVAILABLE ?auto_23715 ) ( not ( = ?auto_23721 ?auto_23720 ) ) ( HOIST-AT ?auto_23726 ?auto_23721 ) ( AVAILABLE ?auto_23726 ) ( SURFACE-AT ?auto_23711 ?auto_23721 ) ( ON ?auto_23711 ?auto_23725 ) ( CLEAR ?auto_23711 ) ( TRUCK-AT ?auto_23717 ?auto_23720 ) ( not ( = ?auto_23710 ?auto_23711 ) ) ( not ( = ?auto_23710 ?auto_23725 ) ) ( not ( = ?auto_23711 ?auto_23725 ) ) ( not ( = ?auto_23715 ?auto_23726 ) ) ( not ( = ?auto_23710 ?auto_23712 ) ) ( not ( = ?auto_23710 ?auto_23724 ) ) ( not ( = ?auto_23712 ?auto_23725 ) ) ( not ( = ?auto_23727 ?auto_23721 ) ) ( not ( = ?auto_23723 ?auto_23726 ) ) ( not ( = ?auto_23724 ?auto_23725 ) ) ( not ( = ?auto_23710 ?auto_23713 ) ) ( not ( = ?auto_23710 ?auto_23722 ) ) ( not ( = ?auto_23711 ?auto_23713 ) ) ( not ( = ?auto_23711 ?auto_23722 ) ) ( not ( = ?auto_23713 ?auto_23724 ) ) ( not ( = ?auto_23713 ?auto_23725 ) ) ( not ( = ?auto_23728 ?auto_23727 ) ) ( not ( = ?auto_23728 ?auto_23721 ) ) ( not ( = ?auto_23729 ?auto_23723 ) ) ( not ( = ?auto_23729 ?auto_23726 ) ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( not ( = ?auto_23722 ?auto_23725 ) ) ( not ( = ?auto_23710 ?auto_23714 ) ) ( not ( = ?auto_23710 ?auto_23718 ) ) ( not ( = ?auto_23711 ?auto_23714 ) ) ( not ( = ?auto_23711 ?auto_23718 ) ) ( not ( = ?auto_23712 ?auto_23714 ) ) ( not ( = ?auto_23712 ?auto_23718 ) ) ( not ( = ?auto_23714 ?auto_23722 ) ) ( not ( = ?auto_23714 ?auto_23724 ) ) ( not ( = ?auto_23714 ?auto_23725 ) ) ( not ( = ?auto_23719 ?auto_23728 ) ) ( not ( = ?auto_23719 ?auto_23727 ) ) ( not ( = ?auto_23719 ?auto_23721 ) ) ( not ( = ?auto_23716 ?auto_23729 ) ) ( not ( = ?auto_23716 ?auto_23723 ) ) ( not ( = ?auto_23716 ?auto_23726 ) ) ( not ( = ?auto_23718 ?auto_23722 ) ) ( not ( = ?auto_23718 ?auto_23724 ) ) ( not ( = ?auto_23718 ?auto_23725 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_23710 ?auto_23711 ?auto_23712 ?auto_23713 )
      ( MAKE-1CRATE ?auto_23713 ?auto_23714 )
      ( MAKE-4CRATE-VERIFY ?auto_23710 ?auto_23711 ?auto_23712 ?auto_23713 ?auto_23714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23732 - SURFACE
      ?auto_23733 - SURFACE
    )
    :vars
    (
      ?auto_23734 - HOIST
      ?auto_23735 - PLACE
      ?auto_23737 - PLACE
      ?auto_23738 - HOIST
      ?auto_23739 - SURFACE
      ?auto_23736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23734 ?auto_23735 ) ( SURFACE-AT ?auto_23732 ?auto_23735 ) ( CLEAR ?auto_23732 ) ( IS-CRATE ?auto_23733 ) ( AVAILABLE ?auto_23734 ) ( not ( = ?auto_23737 ?auto_23735 ) ) ( HOIST-AT ?auto_23738 ?auto_23737 ) ( AVAILABLE ?auto_23738 ) ( SURFACE-AT ?auto_23733 ?auto_23737 ) ( ON ?auto_23733 ?auto_23739 ) ( CLEAR ?auto_23733 ) ( TRUCK-AT ?auto_23736 ?auto_23735 ) ( not ( = ?auto_23732 ?auto_23733 ) ) ( not ( = ?auto_23732 ?auto_23739 ) ) ( not ( = ?auto_23733 ?auto_23739 ) ) ( not ( = ?auto_23734 ?auto_23738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23736 ?auto_23735 ?auto_23737 )
      ( !LIFT ?auto_23738 ?auto_23733 ?auto_23739 ?auto_23737 )
      ( !LOAD ?auto_23738 ?auto_23733 ?auto_23736 ?auto_23737 )
      ( !DRIVE ?auto_23736 ?auto_23737 ?auto_23735 )
      ( !UNLOAD ?auto_23734 ?auto_23733 ?auto_23736 ?auto_23735 )
      ( !DROP ?auto_23734 ?auto_23733 ?auto_23732 ?auto_23735 )
      ( MAKE-1CRATE-VERIFY ?auto_23732 ?auto_23733 ) )
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
      ?auto_23755 - HOIST
      ?auto_23754 - PLACE
      ?auto_23752 - PLACE
      ?auto_23757 - HOIST
      ?auto_23756 - SURFACE
      ?auto_23759 - PLACE
      ?auto_23769 - HOIST
      ?auto_23762 - SURFACE
      ?auto_23765 - PLACE
      ?auto_23764 - HOIST
      ?auto_23767 - SURFACE
      ?auto_23763 - PLACE
      ?auto_23766 - HOIST
      ?auto_23768 - SURFACE
      ?auto_23758 - PLACE
      ?auto_23760 - HOIST
      ?auto_23761 - SURFACE
      ?auto_23753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23755 ?auto_23754 ) ( IS-CRATE ?auto_23751 ) ( not ( = ?auto_23752 ?auto_23754 ) ) ( HOIST-AT ?auto_23757 ?auto_23752 ) ( AVAILABLE ?auto_23757 ) ( SURFACE-AT ?auto_23751 ?auto_23752 ) ( ON ?auto_23751 ?auto_23756 ) ( CLEAR ?auto_23751 ) ( not ( = ?auto_23750 ?auto_23751 ) ) ( not ( = ?auto_23750 ?auto_23756 ) ) ( not ( = ?auto_23751 ?auto_23756 ) ) ( not ( = ?auto_23755 ?auto_23757 ) ) ( IS-CRATE ?auto_23750 ) ( not ( = ?auto_23759 ?auto_23754 ) ) ( HOIST-AT ?auto_23769 ?auto_23759 ) ( AVAILABLE ?auto_23769 ) ( SURFACE-AT ?auto_23750 ?auto_23759 ) ( ON ?auto_23750 ?auto_23762 ) ( CLEAR ?auto_23750 ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( not ( = ?auto_23749 ?auto_23762 ) ) ( not ( = ?auto_23750 ?auto_23762 ) ) ( not ( = ?auto_23755 ?auto_23769 ) ) ( IS-CRATE ?auto_23749 ) ( not ( = ?auto_23765 ?auto_23754 ) ) ( HOIST-AT ?auto_23764 ?auto_23765 ) ( AVAILABLE ?auto_23764 ) ( SURFACE-AT ?auto_23749 ?auto_23765 ) ( ON ?auto_23749 ?auto_23767 ) ( CLEAR ?auto_23749 ) ( not ( = ?auto_23748 ?auto_23749 ) ) ( not ( = ?auto_23748 ?auto_23767 ) ) ( not ( = ?auto_23749 ?auto_23767 ) ) ( not ( = ?auto_23755 ?auto_23764 ) ) ( IS-CRATE ?auto_23748 ) ( not ( = ?auto_23763 ?auto_23754 ) ) ( HOIST-AT ?auto_23766 ?auto_23763 ) ( AVAILABLE ?auto_23766 ) ( SURFACE-AT ?auto_23748 ?auto_23763 ) ( ON ?auto_23748 ?auto_23768 ) ( CLEAR ?auto_23748 ) ( not ( = ?auto_23747 ?auto_23748 ) ) ( not ( = ?auto_23747 ?auto_23768 ) ) ( not ( = ?auto_23748 ?auto_23768 ) ) ( not ( = ?auto_23755 ?auto_23766 ) ) ( SURFACE-AT ?auto_23746 ?auto_23754 ) ( CLEAR ?auto_23746 ) ( IS-CRATE ?auto_23747 ) ( AVAILABLE ?auto_23755 ) ( not ( = ?auto_23758 ?auto_23754 ) ) ( HOIST-AT ?auto_23760 ?auto_23758 ) ( AVAILABLE ?auto_23760 ) ( SURFACE-AT ?auto_23747 ?auto_23758 ) ( ON ?auto_23747 ?auto_23761 ) ( CLEAR ?auto_23747 ) ( TRUCK-AT ?auto_23753 ?auto_23754 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23761 ) ) ( not ( = ?auto_23747 ?auto_23761 ) ) ( not ( = ?auto_23755 ?auto_23760 ) ) ( not ( = ?auto_23746 ?auto_23748 ) ) ( not ( = ?auto_23746 ?auto_23768 ) ) ( not ( = ?auto_23748 ?auto_23761 ) ) ( not ( = ?auto_23763 ?auto_23758 ) ) ( not ( = ?auto_23766 ?auto_23760 ) ) ( not ( = ?auto_23768 ?auto_23761 ) ) ( not ( = ?auto_23746 ?auto_23749 ) ) ( not ( = ?auto_23746 ?auto_23767 ) ) ( not ( = ?auto_23747 ?auto_23749 ) ) ( not ( = ?auto_23747 ?auto_23767 ) ) ( not ( = ?auto_23749 ?auto_23768 ) ) ( not ( = ?auto_23749 ?auto_23761 ) ) ( not ( = ?auto_23765 ?auto_23763 ) ) ( not ( = ?auto_23765 ?auto_23758 ) ) ( not ( = ?auto_23764 ?auto_23766 ) ) ( not ( = ?auto_23764 ?auto_23760 ) ) ( not ( = ?auto_23767 ?auto_23768 ) ) ( not ( = ?auto_23767 ?auto_23761 ) ) ( not ( = ?auto_23746 ?auto_23750 ) ) ( not ( = ?auto_23746 ?auto_23762 ) ) ( not ( = ?auto_23747 ?auto_23750 ) ) ( not ( = ?auto_23747 ?auto_23762 ) ) ( not ( = ?auto_23748 ?auto_23750 ) ) ( not ( = ?auto_23748 ?auto_23762 ) ) ( not ( = ?auto_23750 ?auto_23767 ) ) ( not ( = ?auto_23750 ?auto_23768 ) ) ( not ( = ?auto_23750 ?auto_23761 ) ) ( not ( = ?auto_23759 ?auto_23765 ) ) ( not ( = ?auto_23759 ?auto_23763 ) ) ( not ( = ?auto_23759 ?auto_23758 ) ) ( not ( = ?auto_23769 ?auto_23764 ) ) ( not ( = ?auto_23769 ?auto_23766 ) ) ( not ( = ?auto_23769 ?auto_23760 ) ) ( not ( = ?auto_23762 ?auto_23767 ) ) ( not ( = ?auto_23762 ?auto_23768 ) ) ( not ( = ?auto_23762 ?auto_23761 ) ) ( not ( = ?auto_23746 ?auto_23751 ) ) ( not ( = ?auto_23746 ?auto_23756 ) ) ( not ( = ?auto_23747 ?auto_23751 ) ) ( not ( = ?auto_23747 ?auto_23756 ) ) ( not ( = ?auto_23748 ?auto_23751 ) ) ( not ( = ?auto_23748 ?auto_23756 ) ) ( not ( = ?auto_23749 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23756 ) ) ( not ( = ?auto_23751 ?auto_23762 ) ) ( not ( = ?auto_23751 ?auto_23767 ) ) ( not ( = ?auto_23751 ?auto_23768 ) ) ( not ( = ?auto_23751 ?auto_23761 ) ) ( not ( = ?auto_23752 ?auto_23759 ) ) ( not ( = ?auto_23752 ?auto_23765 ) ) ( not ( = ?auto_23752 ?auto_23763 ) ) ( not ( = ?auto_23752 ?auto_23758 ) ) ( not ( = ?auto_23757 ?auto_23769 ) ) ( not ( = ?auto_23757 ?auto_23764 ) ) ( not ( = ?auto_23757 ?auto_23766 ) ) ( not ( = ?auto_23757 ?auto_23760 ) ) ( not ( = ?auto_23756 ?auto_23762 ) ) ( not ( = ?auto_23756 ?auto_23767 ) ) ( not ( = ?auto_23756 ?auto_23768 ) ) ( not ( = ?auto_23756 ?auto_23761 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23746 ?auto_23747 ?auto_23748 ?auto_23749 ?auto_23750 )
      ( MAKE-1CRATE ?auto_23750 ?auto_23751 )
      ( MAKE-5CRATE-VERIFY ?auto_23746 ?auto_23747 ?auto_23748 ?auto_23749 ?auto_23750 ?auto_23751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23772 - SURFACE
      ?auto_23773 - SURFACE
    )
    :vars
    (
      ?auto_23774 - HOIST
      ?auto_23775 - PLACE
      ?auto_23777 - PLACE
      ?auto_23778 - HOIST
      ?auto_23779 - SURFACE
      ?auto_23776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23774 ?auto_23775 ) ( SURFACE-AT ?auto_23772 ?auto_23775 ) ( CLEAR ?auto_23772 ) ( IS-CRATE ?auto_23773 ) ( AVAILABLE ?auto_23774 ) ( not ( = ?auto_23777 ?auto_23775 ) ) ( HOIST-AT ?auto_23778 ?auto_23777 ) ( AVAILABLE ?auto_23778 ) ( SURFACE-AT ?auto_23773 ?auto_23777 ) ( ON ?auto_23773 ?auto_23779 ) ( CLEAR ?auto_23773 ) ( TRUCK-AT ?auto_23776 ?auto_23775 ) ( not ( = ?auto_23772 ?auto_23773 ) ) ( not ( = ?auto_23772 ?auto_23779 ) ) ( not ( = ?auto_23773 ?auto_23779 ) ) ( not ( = ?auto_23774 ?auto_23778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23776 ?auto_23775 ?auto_23777 )
      ( !LIFT ?auto_23778 ?auto_23773 ?auto_23779 ?auto_23777 )
      ( !LOAD ?auto_23778 ?auto_23773 ?auto_23776 ?auto_23777 )
      ( !DRIVE ?auto_23776 ?auto_23777 ?auto_23775 )
      ( !UNLOAD ?auto_23774 ?auto_23773 ?auto_23776 ?auto_23775 )
      ( !DROP ?auto_23774 ?auto_23773 ?auto_23772 ?auto_23775 )
      ( MAKE-1CRATE-VERIFY ?auto_23772 ?auto_23773 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_23787 - SURFACE
      ?auto_23788 - SURFACE
      ?auto_23789 - SURFACE
      ?auto_23790 - SURFACE
      ?auto_23791 - SURFACE
      ?auto_23793 - SURFACE
      ?auto_23792 - SURFACE
    )
    :vars
    (
      ?auto_23795 - HOIST
      ?auto_23799 - PLACE
      ?auto_23796 - PLACE
      ?auto_23794 - HOIST
      ?auto_23797 - SURFACE
      ?auto_23802 - PLACE
      ?auto_23803 - HOIST
      ?auto_23810 - SURFACE
      ?auto_23806 - PLACE
      ?auto_23812 - HOIST
      ?auto_23804 - SURFACE
      ?auto_23800 - PLACE
      ?auto_23807 - HOIST
      ?auto_23811 - SURFACE
      ?auto_23801 - PLACE
      ?auto_23809 - HOIST
      ?auto_23814 - SURFACE
      ?auto_23813 - PLACE
      ?auto_23808 - HOIST
      ?auto_23805 - SURFACE
      ?auto_23798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23795 ?auto_23799 ) ( IS-CRATE ?auto_23792 ) ( not ( = ?auto_23796 ?auto_23799 ) ) ( HOIST-AT ?auto_23794 ?auto_23796 ) ( AVAILABLE ?auto_23794 ) ( SURFACE-AT ?auto_23792 ?auto_23796 ) ( ON ?auto_23792 ?auto_23797 ) ( CLEAR ?auto_23792 ) ( not ( = ?auto_23793 ?auto_23792 ) ) ( not ( = ?auto_23793 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23794 ) ) ( IS-CRATE ?auto_23793 ) ( not ( = ?auto_23802 ?auto_23799 ) ) ( HOIST-AT ?auto_23803 ?auto_23802 ) ( AVAILABLE ?auto_23803 ) ( SURFACE-AT ?auto_23793 ?auto_23802 ) ( ON ?auto_23793 ?auto_23810 ) ( CLEAR ?auto_23793 ) ( not ( = ?auto_23791 ?auto_23793 ) ) ( not ( = ?auto_23791 ?auto_23810 ) ) ( not ( = ?auto_23793 ?auto_23810 ) ) ( not ( = ?auto_23795 ?auto_23803 ) ) ( IS-CRATE ?auto_23791 ) ( not ( = ?auto_23806 ?auto_23799 ) ) ( HOIST-AT ?auto_23812 ?auto_23806 ) ( AVAILABLE ?auto_23812 ) ( SURFACE-AT ?auto_23791 ?auto_23806 ) ( ON ?auto_23791 ?auto_23804 ) ( CLEAR ?auto_23791 ) ( not ( = ?auto_23790 ?auto_23791 ) ) ( not ( = ?auto_23790 ?auto_23804 ) ) ( not ( = ?auto_23791 ?auto_23804 ) ) ( not ( = ?auto_23795 ?auto_23812 ) ) ( IS-CRATE ?auto_23790 ) ( not ( = ?auto_23800 ?auto_23799 ) ) ( HOIST-AT ?auto_23807 ?auto_23800 ) ( AVAILABLE ?auto_23807 ) ( SURFACE-AT ?auto_23790 ?auto_23800 ) ( ON ?auto_23790 ?auto_23811 ) ( CLEAR ?auto_23790 ) ( not ( = ?auto_23789 ?auto_23790 ) ) ( not ( = ?auto_23789 ?auto_23811 ) ) ( not ( = ?auto_23790 ?auto_23811 ) ) ( not ( = ?auto_23795 ?auto_23807 ) ) ( IS-CRATE ?auto_23789 ) ( not ( = ?auto_23801 ?auto_23799 ) ) ( HOIST-AT ?auto_23809 ?auto_23801 ) ( AVAILABLE ?auto_23809 ) ( SURFACE-AT ?auto_23789 ?auto_23801 ) ( ON ?auto_23789 ?auto_23814 ) ( CLEAR ?auto_23789 ) ( not ( = ?auto_23788 ?auto_23789 ) ) ( not ( = ?auto_23788 ?auto_23814 ) ) ( not ( = ?auto_23789 ?auto_23814 ) ) ( not ( = ?auto_23795 ?auto_23809 ) ) ( SURFACE-AT ?auto_23787 ?auto_23799 ) ( CLEAR ?auto_23787 ) ( IS-CRATE ?auto_23788 ) ( AVAILABLE ?auto_23795 ) ( not ( = ?auto_23813 ?auto_23799 ) ) ( HOIST-AT ?auto_23808 ?auto_23813 ) ( AVAILABLE ?auto_23808 ) ( SURFACE-AT ?auto_23788 ?auto_23813 ) ( ON ?auto_23788 ?auto_23805 ) ( CLEAR ?auto_23788 ) ( TRUCK-AT ?auto_23798 ?auto_23799 ) ( not ( = ?auto_23787 ?auto_23788 ) ) ( not ( = ?auto_23787 ?auto_23805 ) ) ( not ( = ?auto_23788 ?auto_23805 ) ) ( not ( = ?auto_23795 ?auto_23808 ) ) ( not ( = ?auto_23787 ?auto_23789 ) ) ( not ( = ?auto_23787 ?auto_23814 ) ) ( not ( = ?auto_23789 ?auto_23805 ) ) ( not ( = ?auto_23801 ?auto_23813 ) ) ( not ( = ?auto_23809 ?auto_23808 ) ) ( not ( = ?auto_23814 ?auto_23805 ) ) ( not ( = ?auto_23787 ?auto_23790 ) ) ( not ( = ?auto_23787 ?auto_23811 ) ) ( not ( = ?auto_23788 ?auto_23790 ) ) ( not ( = ?auto_23788 ?auto_23811 ) ) ( not ( = ?auto_23790 ?auto_23814 ) ) ( not ( = ?auto_23790 ?auto_23805 ) ) ( not ( = ?auto_23800 ?auto_23801 ) ) ( not ( = ?auto_23800 ?auto_23813 ) ) ( not ( = ?auto_23807 ?auto_23809 ) ) ( not ( = ?auto_23807 ?auto_23808 ) ) ( not ( = ?auto_23811 ?auto_23814 ) ) ( not ( = ?auto_23811 ?auto_23805 ) ) ( not ( = ?auto_23787 ?auto_23791 ) ) ( not ( = ?auto_23787 ?auto_23804 ) ) ( not ( = ?auto_23788 ?auto_23791 ) ) ( not ( = ?auto_23788 ?auto_23804 ) ) ( not ( = ?auto_23789 ?auto_23791 ) ) ( not ( = ?auto_23789 ?auto_23804 ) ) ( not ( = ?auto_23791 ?auto_23811 ) ) ( not ( = ?auto_23791 ?auto_23814 ) ) ( not ( = ?auto_23791 ?auto_23805 ) ) ( not ( = ?auto_23806 ?auto_23800 ) ) ( not ( = ?auto_23806 ?auto_23801 ) ) ( not ( = ?auto_23806 ?auto_23813 ) ) ( not ( = ?auto_23812 ?auto_23807 ) ) ( not ( = ?auto_23812 ?auto_23809 ) ) ( not ( = ?auto_23812 ?auto_23808 ) ) ( not ( = ?auto_23804 ?auto_23811 ) ) ( not ( = ?auto_23804 ?auto_23814 ) ) ( not ( = ?auto_23804 ?auto_23805 ) ) ( not ( = ?auto_23787 ?auto_23793 ) ) ( not ( = ?auto_23787 ?auto_23810 ) ) ( not ( = ?auto_23788 ?auto_23793 ) ) ( not ( = ?auto_23788 ?auto_23810 ) ) ( not ( = ?auto_23789 ?auto_23793 ) ) ( not ( = ?auto_23789 ?auto_23810 ) ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( not ( = ?auto_23790 ?auto_23810 ) ) ( not ( = ?auto_23793 ?auto_23804 ) ) ( not ( = ?auto_23793 ?auto_23811 ) ) ( not ( = ?auto_23793 ?auto_23814 ) ) ( not ( = ?auto_23793 ?auto_23805 ) ) ( not ( = ?auto_23802 ?auto_23806 ) ) ( not ( = ?auto_23802 ?auto_23800 ) ) ( not ( = ?auto_23802 ?auto_23801 ) ) ( not ( = ?auto_23802 ?auto_23813 ) ) ( not ( = ?auto_23803 ?auto_23812 ) ) ( not ( = ?auto_23803 ?auto_23807 ) ) ( not ( = ?auto_23803 ?auto_23809 ) ) ( not ( = ?auto_23803 ?auto_23808 ) ) ( not ( = ?auto_23810 ?auto_23804 ) ) ( not ( = ?auto_23810 ?auto_23811 ) ) ( not ( = ?auto_23810 ?auto_23814 ) ) ( not ( = ?auto_23810 ?auto_23805 ) ) ( not ( = ?auto_23787 ?auto_23792 ) ) ( not ( = ?auto_23787 ?auto_23797 ) ) ( not ( = ?auto_23788 ?auto_23792 ) ) ( not ( = ?auto_23788 ?auto_23797 ) ) ( not ( = ?auto_23789 ?auto_23792 ) ) ( not ( = ?auto_23789 ?auto_23797 ) ) ( not ( = ?auto_23790 ?auto_23792 ) ) ( not ( = ?auto_23790 ?auto_23797 ) ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( not ( = ?auto_23791 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23810 ) ) ( not ( = ?auto_23792 ?auto_23804 ) ) ( not ( = ?auto_23792 ?auto_23811 ) ) ( not ( = ?auto_23792 ?auto_23814 ) ) ( not ( = ?auto_23792 ?auto_23805 ) ) ( not ( = ?auto_23796 ?auto_23802 ) ) ( not ( = ?auto_23796 ?auto_23806 ) ) ( not ( = ?auto_23796 ?auto_23800 ) ) ( not ( = ?auto_23796 ?auto_23801 ) ) ( not ( = ?auto_23796 ?auto_23813 ) ) ( not ( = ?auto_23794 ?auto_23803 ) ) ( not ( = ?auto_23794 ?auto_23812 ) ) ( not ( = ?auto_23794 ?auto_23807 ) ) ( not ( = ?auto_23794 ?auto_23809 ) ) ( not ( = ?auto_23794 ?auto_23808 ) ) ( not ( = ?auto_23797 ?auto_23810 ) ) ( not ( = ?auto_23797 ?auto_23804 ) ) ( not ( = ?auto_23797 ?auto_23811 ) ) ( not ( = ?auto_23797 ?auto_23814 ) ) ( not ( = ?auto_23797 ?auto_23805 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23787 ?auto_23788 ?auto_23789 ?auto_23790 ?auto_23791 ?auto_23793 )
      ( MAKE-1CRATE ?auto_23793 ?auto_23792 )
      ( MAKE-6CRATE-VERIFY ?auto_23787 ?auto_23788 ?auto_23789 ?auto_23790 ?auto_23791 ?auto_23793 ?auto_23792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23817 - SURFACE
      ?auto_23818 - SURFACE
    )
    :vars
    (
      ?auto_23819 - HOIST
      ?auto_23820 - PLACE
      ?auto_23822 - PLACE
      ?auto_23823 - HOIST
      ?auto_23824 - SURFACE
      ?auto_23821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23819 ?auto_23820 ) ( SURFACE-AT ?auto_23817 ?auto_23820 ) ( CLEAR ?auto_23817 ) ( IS-CRATE ?auto_23818 ) ( AVAILABLE ?auto_23819 ) ( not ( = ?auto_23822 ?auto_23820 ) ) ( HOIST-AT ?auto_23823 ?auto_23822 ) ( AVAILABLE ?auto_23823 ) ( SURFACE-AT ?auto_23818 ?auto_23822 ) ( ON ?auto_23818 ?auto_23824 ) ( CLEAR ?auto_23818 ) ( TRUCK-AT ?auto_23821 ?auto_23820 ) ( not ( = ?auto_23817 ?auto_23818 ) ) ( not ( = ?auto_23817 ?auto_23824 ) ) ( not ( = ?auto_23818 ?auto_23824 ) ) ( not ( = ?auto_23819 ?auto_23823 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23821 ?auto_23820 ?auto_23822 )
      ( !LIFT ?auto_23823 ?auto_23818 ?auto_23824 ?auto_23822 )
      ( !LOAD ?auto_23823 ?auto_23818 ?auto_23821 ?auto_23822 )
      ( !DRIVE ?auto_23821 ?auto_23822 ?auto_23820 )
      ( !UNLOAD ?auto_23819 ?auto_23818 ?auto_23821 ?auto_23820 )
      ( !DROP ?auto_23819 ?auto_23818 ?auto_23817 ?auto_23820 )
      ( MAKE-1CRATE-VERIFY ?auto_23817 ?auto_23818 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23833 - SURFACE
      ?auto_23834 - SURFACE
      ?auto_23835 - SURFACE
      ?auto_23836 - SURFACE
      ?auto_23837 - SURFACE
      ?auto_23839 - SURFACE
      ?auto_23838 - SURFACE
      ?auto_23840 - SURFACE
    )
    :vars
    (
      ?auto_23844 - HOIST
      ?auto_23846 - PLACE
      ?auto_23842 - PLACE
      ?auto_23845 - HOIST
      ?auto_23841 - SURFACE
      ?auto_23851 - PLACE
      ?auto_23864 - HOIST
      ?auto_23858 - SURFACE
      ?auto_23848 - PLACE
      ?auto_23859 - HOIST
      ?auto_23853 - SURFACE
      ?auto_23861 - PLACE
      ?auto_23856 - HOIST
      ?auto_23863 - SURFACE
      ?auto_23850 - PLACE
      ?auto_23860 - HOIST
      ?auto_23855 - SURFACE
      ?auto_23847 - PLACE
      ?auto_23854 - HOIST
      ?auto_23849 - SURFACE
      ?auto_23857 - PLACE
      ?auto_23852 - HOIST
      ?auto_23862 - SURFACE
      ?auto_23843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23844 ?auto_23846 ) ( IS-CRATE ?auto_23840 ) ( not ( = ?auto_23842 ?auto_23846 ) ) ( HOIST-AT ?auto_23845 ?auto_23842 ) ( AVAILABLE ?auto_23845 ) ( SURFACE-AT ?auto_23840 ?auto_23842 ) ( ON ?auto_23840 ?auto_23841 ) ( CLEAR ?auto_23840 ) ( not ( = ?auto_23838 ?auto_23840 ) ) ( not ( = ?auto_23838 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23844 ?auto_23845 ) ) ( IS-CRATE ?auto_23838 ) ( not ( = ?auto_23851 ?auto_23846 ) ) ( HOIST-AT ?auto_23864 ?auto_23851 ) ( AVAILABLE ?auto_23864 ) ( SURFACE-AT ?auto_23838 ?auto_23851 ) ( ON ?auto_23838 ?auto_23858 ) ( CLEAR ?auto_23838 ) ( not ( = ?auto_23839 ?auto_23838 ) ) ( not ( = ?auto_23839 ?auto_23858 ) ) ( not ( = ?auto_23838 ?auto_23858 ) ) ( not ( = ?auto_23844 ?auto_23864 ) ) ( IS-CRATE ?auto_23839 ) ( not ( = ?auto_23848 ?auto_23846 ) ) ( HOIST-AT ?auto_23859 ?auto_23848 ) ( AVAILABLE ?auto_23859 ) ( SURFACE-AT ?auto_23839 ?auto_23848 ) ( ON ?auto_23839 ?auto_23853 ) ( CLEAR ?auto_23839 ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23853 ) ) ( not ( = ?auto_23839 ?auto_23853 ) ) ( not ( = ?auto_23844 ?auto_23859 ) ) ( IS-CRATE ?auto_23837 ) ( not ( = ?auto_23861 ?auto_23846 ) ) ( HOIST-AT ?auto_23856 ?auto_23861 ) ( AVAILABLE ?auto_23856 ) ( SURFACE-AT ?auto_23837 ?auto_23861 ) ( ON ?auto_23837 ?auto_23863 ) ( CLEAR ?auto_23837 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23863 ) ) ( not ( = ?auto_23837 ?auto_23863 ) ) ( not ( = ?auto_23844 ?auto_23856 ) ) ( IS-CRATE ?auto_23836 ) ( not ( = ?auto_23850 ?auto_23846 ) ) ( HOIST-AT ?auto_23860 ?auto_23850 ) ( AVAILABLE ?auto_23860 ) ( SURFACE-AT ?auto_23836 ?auto_23850 ) ( ON ?auto_23836 ?auto_23855 ) ( CLEAR ?auto_23836 ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23835 ?auto_23855 ) ) ( not ( = ?auto_23836 ?auto_23855 ) ) ( not ( = ?auto_23844 ?auto_23860 ) ) ( IS-CRATE ?auto_23835 ) ( not ( = ?auto_23847 ?auto_23846 ) ) ( HOIST-AT ?auto_23854 ?auto_23847 ) ( AVAILABLE ?auto_23854 ) ( SURFACE-AT ?auto_23835 ?auto_23847 ) ( ON ?auto_23835 ?auto_23849 ) ( CLEAR ?auto_23835 ) ( not ( = ?auto_23834 ?auto_23835 ) ) ( not ( = ?auto_23834 ?auto_23849 ) ) ( not ( = ?auto_23835 ?auto_23849 ) ) ( not ( = ?auto_23844 ?auto_23854 ) ) ( SURFACE-AT ?auto_23833 ?auto_23846 ) ( CLEAR ?auto_23833 ) ( IS-CRATE ?auto_23834 ) ( AVAILABLE ?auto_23844 ) ( not ( = ?auto_23857 ?auto_23846 ) ) ( HOIST-AT ?auto_23852 ?auto_23857 ) ( AVAILABLE ?auto_23852 ) ( SURFACE-AT ?auto_23834 ?auto_23857 ) ( ON ?auto_23834 ?auto_23862 ) ( CLEAR ?auto_23834 ) ( TRUCK-AT ?auto_23843 ?auto_23846 ) ( not ( = ?auto_23833 ?auto_23834 ) ) ( not ( = ?auto_23833 ?auto_23862 ) ) ( not ( = ?auto_23834 ?auto_23862 ) ) ( not ( = ?auto_23844 ?auto_23852 ) ) ( not ( = ?auto_23833 ?auto_23835 ) ) ( not ( = ?auto_23833 ?auto_23849 ) ) ( not ( = ?auto_23835 ?auto_23862 ) ) ( not ( = ?auto_23847 ?auto_23857 ) ) ( not ( = ?auto_23854 ?auto_23852 ) ) ( not ( = ?auto_23849 ?auto_23862 ) ) ( not ( = ?auto_23833 ?auto_23836 ) ) ( not ( = ?auto_23833 ?auto_23855 ) ) ( not ( = ?auto_23834 ?auto_23836 ) ) ( not ( = ?auto_23834 ?auto_23855 ) ) ( not ( = ?auto_23836 ?auto_23849 ) ) ( not ( = ?auto_23836 ?auto_23862 ) ) ( not ( = ?auto_23850 ?auto_23847 ) ) ( not ( = ?auto_23850 ?auto_23857 ) ) ( not ( = ?auto_23860 ?auto_23854 ) ) ( not ( = ?auto_23860 ?auto_23852 ) ) ( not ( = ?auto_23855 ?auto_23849 ) ) ( not ( = ?auto_23855 ?auto_23862 ) ) ( not ( = ?auto_23833 ?auto_23837 ) ) ( not ( = ?auto_23833 ?auto_23863 ) ) ( not ( = ?auto_23834 ?auto_23837 ) ) ( not ( = ?auto_23834 ?auto_23863 ) ) ( not ( = ?auto_23835 ?auto_23837 ) ) ( not ( = ?auto_23835 ?auto_23863 ) ) ( not ( = ?auto_23837 ?auto_23855 ) ) ( not ( = ?auto_23837 ?auto_23849 ) ) ( not ( = ?auto_23837 ?auto_23862 ) ) ( not ( = ?auto_23861 ?auto_23850 ) ) ( not ( = ?auto_23861 ?auto_23847 ) ) ( not ( = ?auto_23861 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23860 ) ) ( not ( = ?auto_23856 ?auto_23854 ) ) ( not ( = ?auto_23856 ?auto_23852 ) ) ( not ( = ?auto_23863 ?auto_23855 ) ) ( not ( = ?auto_23863 ?auto_23849 ) ) ( not ( = ?auto_23863 ?auto_23862 ) ) ( not ( = ?auto_23833 ?auto_23839 ) ) ( not ( = ?auto_23833 ?auto_23853 ) ) ( not ( = ?auto_23834 ?auto_23839 ) ) ( not ( = ?auto_23834 ?auto_23853 ) ) ( not ( = ?auto_23835 ?auto_23839 ) ) ( not ( = ?auto_23835 ?auto_23853 ) ) ( not ( = ?auto_23836 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23853 ) ) ( not ( = ?auto_23839 ?auto_23863 ) ) ( not ( = ?auto_23839 ?auto_23855 ) ) ( not ( = ?auto_23839 ?auto_23849 ) ) ( not ( = ?auto_23839 ?auto_23862 ) ) ( not ( = ?auto_23848 ?auto_23861 ) ) ( not ( = ?auto_23848 ?auto_23850 ) ) ( not ( = ?auto_23848 ?auto_23847 ) ) ( not ( = ?auto_23848 ?auto_23857 ) ) ( not ( = ?auto_23859 ?auto_23856 ) ) ( not ( = ?auto_23859 ?auto_23860 ) ) ( not ( = ?auto_23859 ?auto_23854 ) ) ( not ( = ?auto_23859 ?auto_23852 ) ) ( not ( = ?auto_23853 ?auto_23863 ) ) ( not ( = ?auto_23853 ?auto_23855 ) ) ( not ( = ?auto_23853 ?auto_23849 ) ) ( not ( = ?auto_23853 ?auto_23862 ) ) ( not ( = ?auto_23833 ?auto_23838 ) ) ( not ( = ?auto_23833 ?auto_23858 ) ) ( not ( = ?auto_23834 ?auto_23838 ) ) ( not ( = ?auto_23834 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23838 ) ) ( not ( = ?auto_23835 ?auto_23858 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23858 ) ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23837 ?auto_23858 ) ) ( not ( = ?auto_23838 ?auto_23853 ) ) ( not ( = ?auto_23838 ?auto_23863 ) ) ( not ( = ?auto_23838 ?auto_23855 ) ) ( not ( = ?auto_23838 ?auto_23849 ) ) ( not ( = ?auto_23838 ?auto_23862 ) ) ( not ( = ?auto_23851 ?auto_23848 ) ) ( not ( = ?auto_23851 ?auto_23861 ) ) ( not ( = ?auto_23851 ?auto_23850 ) ) ( not ( = ?auto_23851 ?auto_23847 ) ) ( not ( = ?auto_23851 ?auto_23857 ) ) ( not ( = ?auto_23864 ?auto_23859 ) ) ( not ( = ?auto_23864 ?auto_23856 ) ) ( not ( = ?auto_23864 ?auto_23860 ) ) ( not ( = ?auto_23864 ?auto_23854 ) ) ( not ( = ?auto_23864 ?auto_23852 ) ) ( not ( = ?auto_23858 ?auto_23853 ) ) ( not ( = ?auto_23858 ?auto_23863 ) ) ( not ( = ?auto_23858 ?auto_23855 ) ) ( not ( = ?auto_23858 ?auto_23849 ) ) ( not ( = ?auto_23858 ?auto_23862 ) ) ( not ( = ?auto_23833 ?auto_23840 ) ) ( not ( = ?auto_23833 ?auto_23841 ) ) ( not ( = ?auto_23834 ?auto_23840 ) ) ( not ( = ?auto_23834 ?auto_23841 ) ) ( not ( = ?auto_23835 ?auto_23840 ) ) ( not ( = ?auto_23835 ?auto_23841 ) ) ( not ( = ?auto_23836 ?auto_23840 ) ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23837 ?auto_23840 ) ) ( not ( = ?auto_23837 ?auto_23841 ) ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23858 ) ) ( not ( = ?auto_23840 ?auto_23853 ) ) ( not ( = ?auto_23840 ?auto_23863 ) ) ( not ( = ?auto_23840 ?auto_23855 ) ) ( not ( = ?auto_23840 ?auto_23849 ) ) ( not ( = ?auto_23840 ?auto_23862 ) ) ( not ( = ?auto_23842 ?auto_23851 ) ) ( not ( = ?auto_23842 ?auto_23848 ) ) ( not ( = ?auto_23842 ?auto_23861 ) ) ( not ( = ?auto_23842 ?auto_23850 ) ) ( not ( = ?auto_23842 ?auto_23847 ) ) ( not ( = ?auto_23842 ?auto_23857 ) ) ( not ( = ?auto_23845 ?auto_23864 ) ) ( not ( = ?auto_23845 ?auto_23859 ) ) ( not ( = ?auto_23845 ?auto_23856 ) ) ( not ( = ?auto_23845 ?auto_23860 ) ) ( not ( = ?auto_23845 ?auto_23854 ) ) ( not ( = ?auto_23845 ?auto_23852 ) ) ( not ( = ?auto_23841 ?auto_23858 ) ) ( not ( = ?auto_23841 ?auto_23853 ) ) ( not ( = ?auto_23841 ?auto_23863 ) ) ( not ( = ?auto_23841 ?auto_23855 ) ) ( not ( = ?auto_23841 ?auto_23849 ) ) ( not ( = ?auto_23841 ?auto_23862 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23833 ?auto_23834 ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23839 ?auto_23838 )
      ( MAKE-1CRATE ?auto_23838 ?auto_23840 )
      ( MAKE-7CRATE-VERIFY ?auto_23833 ?auto_23834 ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23839 ?auto_23838 ?auto_23840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23867 - SURFACE
      ?auto_23868 - SURFACE
    )
    :vars
    (
      ?auto_23869 - HOIST
      ?auto_23870 - PLACE
      ?auto_23872 - PLACE
      ?auto_23873 - HOIST
      ?auto_23874 - SURFACE
      ?auto_23871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23869 ?auto_23870 ) ( SURFACE-AT ?auto_23867 ?auto_23870 ) ( CLEAR ?auto_23867 ) ( IS-CRATE ?auto_23868 ) ( AVAILABLE ?auto_23869 ) ( not ( = ?auto_23872 ?auto_23870 ) ) ( HOIST-AT ?auto_23873 ?auto_23872 ) ( AVAILABLE ?auto_23873 ) ( SURFACE-AT ?auto_23868 ?auto_23872 ) ( ON ?auto_23868 ?auto_23874 ) ( CLEAR ?auto_23868 ) ( TRUCK-AT ?auto_23871 ?auto_23870 ) ( not ( = ?auto_23867 ?auto_23868 ) ) ( not ( = ?auto_23867 ?auto_23874 ) ) ( not ( = ?auto_23868 ?auto_23874 ) ) ( not ( = ?auto_23869 ?auto_23873 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23871 ?auto_23870 ?auto_23872 )
      ( !LIFT ?auto_23873 ?auto_23868 ?auto_23874 ?auto_23872 )
      ( !LOAD ?auto_23873 ?auto_23868 ?auto_23871 ?auto_23872 )
      ( !DRIVE ?auto_23871 ?auto_23872 ?auto_23870 )
      ( !UNLOAD ?auto_23869 ?auto_23868 ?auto_23871 ?auto_23870 )
      ( !DROP ?auto_23869 ?auto_23868 ?auto_23867 ?auto_23870 )
      ( MAKE-1CRATE-VERIFY ?auto_23867 ?auto_23868 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23884 - SURFACE
      ?auto_23885 - SURFACE
      ?auto_23886 - SURFACE
      ?auto_23887 - SURFACE
      ?auto_23888 - SURFACE
      ?auto_23890 - SURFACE
      ?auto_23889 - SURFACE
      ?auto_23892 - SURFACE
      ?auto_23891 - SURFACE
    )
    :vars
    (
      ?auto_23893 - HOIST
      ?auto_23897 - PLACE
      ?auto_23895 - PLACE
      ?auto_23894 - HOIST
      ?auto_23896 - SURFACE
      ?auto_23917 - SURFACE
      ?auto_23916 - PLACE
      ?auto_23899 - HOIST
      ?auto_23905 - SURFACE
      ?auto_23911 - PLACE
      ?auto_23906 - HOIST
      ?auto_23914 - SURFACE
      ?auto_23909 - PLACE
      ?auto_23904 - HOIST
      ?auto_23908 - SURFACE
      ?auto_23912 - PLACE
      ?auto_23907 - HOIST
      ?auto_23902 - SURFACE
      ?auto_23900 - PLACE
      ?auto_23913 - HOIST
      ?auto_23910 - SURFACE
      ?auto_23903 - PLACE
      ?auto_23915 - HOIST
      ?auto_23901 - SURFACE
      ?auto_23898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23893 ?auto_23897 ) ( IS-CRATE ?auto_23891 ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( HOIST-AT ?auto_23894 ?auto_23895 ) ( SURFACE-AT ?auto_23891 ?auto_23895 ) ( ON ?auto_23891 ?auto_23896 ) ( CLEAR ?auto_23891 ) ( not ( = ?auto_23892 ?auto_23891 ) ) ( not ( = ?auto_23892 ?auto_23896 ) ) ( not ( = ?auto_23891 ?auto_23896 ) ) ( not ( = ?auto_23893 ?auto_23894 ) ) ( IS-CRATE ?auto_23892 ) ( AVAILABLE ?auto_23894 ) ( SURFACE-AT ?auto_23892 ?auto_23895 ) ( ON ?auto_23892 ?auto_23917 ) ( CLEAR ?auto_23892 ) ( not ( = ?auto_23889 ?auto_23892 ) ) ( not ( = ?auto_23889 ?auto_23917 ) ) ( not ( = ?auto_23892 ?auto_23917 ) ) ( IS-CRATE ?auto_23889 ) ( not ( = ?auto_23916 ?auto_23897 ) ) ( HOIST-AT ?auto_23899 ?auto_23916 ) ( AVAILABLE ?auto_23899 ) ( SURFACE-AT ?auto_23889 ?auto_23916 ) ( ON ?auto_23889 ?auto_23905 ) ( CLEAR ?auto_23889 ) ( not ( = ?auto_23890 ?auto_23889 ) ) ( not ( = ?auto_23890 ?auto_23905 ) ) ( not ( = ?auto_23889 ?auto_23905 ) ) ( not ( = ?auto_23893 ?auto_23899 ) ) ( IS-CRATE ?auto_23890 ) ( not ( = ?auto_23911 ?auto_23897 ) ) ( HOIST-AT ?auto_23906 ?auto_23911 ) ( AVAILABLE ?auto_23906 ) ( SURFACE-AT ?auto_23890 ?auto_23911 ) ( ON ?auto_23890 ?auto_23914 ) ( CLEAR ?auto_23890 ) ( not ( = ?auto_23888 ?auto_23890 ) ) ( not ( = ?auto_23888 ?auto_23914 ) ) ( not ( = ?auto_23890 ?auto_23914 ) ) ( not ( = ?auto_23893 ?auto_23906 ) ) ( IS-CRATE ?auto_23888 ) ( not ( = ?auto_23909 ?auto_23897 ) ) ( HOIST-AT ?auto_23904 ?auto_23909 ) ( AVAILABLE ?auto_23904 ) ( SURFACE-AT ?auto_23888 ?auto_23909 ) ( ON ?auto_23888 ?auto_23908 ) ( CLEAR ?auto_23888 ) ( not ( = ?auto_23887 ?auto_23888 ) ) ( not ( = ?auto_23887 ?auto_23908 ) ) ( not ( = ?auto_23888 ?auto_23908 ) ) ( not ( = ?auto_23893 ?auto_23904 ) ) ( IS-CRATE ?auto_23887 ) ( not ( = ?auto_23912 ?auto_23897 ) ) ( HOIST-AT ?auto_23907 ?auto_23912 ) ( AVAILABLE ?auto_23907 ) ( SURFACE-AT ?auto_23887 ?auto_23912 ) ( ON ?auto_23887 ?auto_23902 ) ( CLEAR ?auto_23887 ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23902 ) ) ( not ( = ?auto_23887 ?auto_23902 ) ) ( not ( = ?auto_23893 ?auto_23907 ) ) ( IS-CRATE ?auto_23886 ) ( not ( = ?auto_23900 ?auto_23897 ) ) ( HOIST-AT ?auto_23913 ?auto_23900 ) ( AVAILABLE ?auto_23913 ) ( SURFACE-AT ?auto_23886 ?auto_23900 ) ( ON ?auto_23886 ?auto_23910 ) ( CLEAR ?auto_23886 ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23910 ) ) ( not ( = ?auto_23886 ?auto_23910 ) ) ( not ( = ?auto_23893 ?auto_23913 ) ) ( SURFACE-AT ?auto_23884 ?auto_23897 ) ( CLEAR ?auto_23884 ) ( IS-CRATE ?auto_23885 ) ( AVAILABLE ?auto_23893 ) ( not ( = ?auto_23903 ?auto_23897 ) ) ( HOIST-AT ?auto_23915 ?auto_23903 ) ( AVAILABLE ?auto_23915 ) ( SURFACE-AT ?auto_23885 ?auto_23903 ) ( ON ?auto_23885 ?auto_23901 ) ( CLEAR ?auto_23885 ) ( TRUCK-AT ?auto_23898 ?auto_23897 ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23901 ) ) ( not ( = ?auto_23885 ?auto_23901 ) ) ( not ( = ?auto_23893 ?auto_23915 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23910 ) ) ( not ( = ?auto_23886 ?auto_23901 ) ) ( not ( = ?auto_23900 ?auto_23903 ) ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( not ( = ?auto_23910 ?auto_23901 ) ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23902 ) ) ( not ( = ?auto_23885 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23902 ) ) ( not ( = ?auto_23887 ?auto_23910 ) ) ( not ( = ?auto_23887 ?auto_23901 ) ) ( not ( = ?auto_23912 ?auto_23900 ) ) ( not ( = ?auto_23912 ?auto_23903 ) ) ( not ( = ?auto_23907 ?auto_23913 ) ) ( not ( = ?auto_23907 ?auto_23915 ) ) ( not ( = ?auto_23902 ?auto_23910 ) ) ( not ( = ?auto_23902 ?auto_23901 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23884 ?auto_23908 ) ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( not ( = ?auto_23885 ?auto_23908 ) ) ( not ( = ?auto_23886 ?auto_23888 ) ) ( not ( = ?auto_23886 ?auto_23908 ) ) ( not ( = ?auto_23888 ?auto_23902 ) ) ( not ( = ?auto_23888 ?auto_23910 ) ) ( not ( = ?auto_23888 ?auto_23901 ) ) ( not ( = ?auto_23909 ?auto_23912 ) ) ( not ( = ?auto_23909 ?auto_23900 ) ) ( not ( = ?auto_23909 ?auto_23903 ) ) ( not ( = ?auto_23904 ?auto_23907 ) ) ( not ( = ?auto_23904 ?auto_23913 ) ) ( not ( = ?auto_23904 ?auto_23915 ) ) ( not ( = ?auto_23908 ?auto_23902 ) ) ( not ( = ?auto_23908 ?auto_23910 ) ) ( not ( = ?auto_23908 ?auto_23901 ) ) ( not ( = ?auto_23884 ?auto_23890 ) ) ( not ( = ?auto_23884 ?auto_23914 ) ) ( not ( = ?auto_23885 ?auto_23890 ) ) ( not ( = ?auto_23885 ?auto_23914 ) ) ( not ( = ?auto_23886 ?auto_23890 ) ) ( not ( = ?auto_23886 ?auto_23914 ) ) ( not ( = ?auto_23887 ?auto_23890 ) ) ( not ( = ?auto_23887 ?auto_23914 ) ) ( not ( = ?auto_23890 ?auto_23908 ) ) ( not ( = ?auto_23890 ?auto_23902 ) ) ( not ( = ?auto_23890 ?auto_23910 ) ) ( not ( = ?auto_23890 ?auto_23901 ) ) ( not ( = ?auto_23911 ?auto_23909 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23900 ) ) ( not ( = ?auto_23911 ?auto_23903 ) ) ( not ( = ?auto_23906 ?auto_23904 ) ) ( not ( = ?auto_23906 ?auto_23907 ) ) ( not ( = ?auto_23906 ?auto_23913 ) ) ( not ( = ?auto_23906 ?auto_23915 ) ) ( not ( = ?auto_23914 ?auto_23908 ) ) ( not ( = ?auto_23914 ?auto_23902 ) ) ( not ( = ?auto_23914 ?auto_23910 ) ) ( not ( = ?auto_23914 ?auto_23901 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23905 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23885 ?auto_23905 ) ) ( not ( = ?auto_23886 ?auto_23889 ) ) ( not ( = ?auto_23886 ?auto_23905 ) ) ( not ( = ?auto_23887 ?auto_23889 ) ) ( not ( = ?auto_23887 ?auto_23905 ) ) ( not ( = ?auto_23888 ?auto_23889 ) ) ( not ( = ?auto_23888 ?auto_23905 ) ) ( not ( = ?auto_23889 ?auto_23914 ) ) ( not ( = ?auto_23889 ?auto_23908 ) ) ( not ( = ?auto_23889 ?auto_23902 ) ) ( not ( = ?auto_23889 ?auto_23910 ) ) ( not ( = ?auto_23889 ?auto_23901 ) ) ( not ( = ?auto_23916 ?auto_23911 ) ) ( not ( = ?auto_23916 ?auto_23909 ) ) ( not ( = ?auto_23916 ?auto_23912 ) ) ( not ( = ?auto_23916 ?auto_23900 ) ) ( not ( = ?auto_23916 ?auto_23903 ) ) ( not ( = ?auto_23899 ?auto_23906 ) ) ( not ( = ?auto_23899 ?auto_23904 ) ) ( not ( = ?auto_23899 ?auto_23907 ) ) ( not ( = ?auto_23899 ?auto_23913 ) ) ( not ( = ?auto_23899 ?auto_23915 ) ) ( not ( = ?auto_23905 ?auto_23914 ) ) ( not ( = ?auto_23905 ?auto_23908 ) ) ( not ( = ?auto_23905 ?auto_23902 ) ) ( not ( = ?auto_23905 ?auto_23910 ) ) ( not ( = ?auto_23905 ?auto_23901 ) ) ( not ( = ?auto_23884 ?auto_23892 ) ) ( not ( = ?auto_23884 ?auto_23917 ) ) ( not ( = ?auto_23885 ?auto_23892 ) ) ( not ( = ?auto_23885 ?auto_23917 ) ) ( not ( = ?auto_23886 ?auto_23892 ) ) ( not ( = ?auto_23886 ?auto_23917 ) ) ( not ( = ?auto_23887 ?auto_23892 ) ) ( not ( = ?auto_23887 ?auto_23917 ) ) ( not ( = ?auto_23888 ?auto_23892 ) ) ( not ( = ?auto_23888 ?auto_23917 ) ) ( not ( = ?auto_23890 ?auto_23892 ) ) ( not ( = ?auto_23890 ?auto_23917 ) ) ( not ( = ?auto_23892 ?auto_23905 ) ) ( not ( = ?auto_23892 ?auto_23914 ) ) ( not ( = ?auto_23892 ?auto_23908 ) ) ( not ( = ?auto_23892 ?auto_23902 ) ) ( not ( = ?auto_23892 ?auto_23910 ) ) ( not ( = ?auto_23892 ?auto_23901 ) ) ( not ( = ?auto_23895 ?auto_23916 ) ) ( not ( = ?auto_23895 ?auto_23911 ) ) ( not ( = ?auto_23895 ?auto_23909 ) ) ( not ( = ?auto_23895 ?auto_23912 ) ) ( not ( = ?auto_23895 ?auto_23900 ) ) ( not ( = ?auto_23895 ?auto_23903 ) ) ( not ( = ?auto_23894 ?auto_23899 ) ) ( not ( = ?auto_23894 ?auto_23906 ) ) ( not ( = ?auto_23894 ?auto_23904 ) ) ( not ( = ?auto_23894 ?auto_23907 ) ) ( not ( = ?auto_23894 ?auto_23913 ) ) ( not ( = ?auto_23894 ?auto_23915 ) ) ( not ( = ?auto_23917 ?auto_23905 ) ) ( not ( = ?auto_23917 ?auto_23914 ) ) ( not ( = ?auto_23917 ?auto_23908 ) ) ( not ( = ?auto_23917 ?auto_23902 ) ) ( not ( = ?auto_23917 ?auto_23910 ) ) ( not ( = ?auto_23917 ?auto_23901 ) ) ( not ( = ?auto_23884 ?auto_23891 ) ) ( not ( = ?auto_23884 ?auto_23896 ) ) ( not ( = ?auto_23885 ?auto_23891 ) ) ( not ( = ?auto_23885 ?auto_23896 ) ) ( not ( = ?auto_23886 ?auto_23891 ) ) ( not ( = ?auto_23886 ?auto_23896 ) ) ( not ( = ?auto_23887 ?auto_23891 ) ) ( not ( = ?auto_23887 ?auto_23896 ) ) ( not ( = ?auto_23888 ?auto_23891 ) ) ( not ( = ?auto_23888 ?auto_23896 ) ) ( not ( = ?auto_23890 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23896 ) ) ( not ( = ?auto_23889 ?auto_23891 ) ) ( not ( = ?auto_23889 ?auto_23896 ) ) ( not ( = ?auto_23891 ?auto_23917 ) ) ( not ( = ?auto_23891 ?auto_23905 ) ) ( not ( = ?auto_23891 ?auto_23914 ) ) ( not ( = ?auto_23891 ?auto_23908 ) ) ( not ( = ?auto_23891 ?auto_23902 ) ) ( not ( = ?auto_23891 ?auto_23910 ) ) ( not ( = ?auto_23891 ?auto_23901 ) ) ( not ( = ?auto_23896 ?auto_23917 ) ) ( not ( = ?auto_23896 ?auto_23905 ) ) ( not ( = ?auto_23896 ?auto_23914 ) ) ( not ( = ?auto_23896 ?auto_23908 ) ) ( not ( = ?auto_23896 ?auto_23902 ) ) ( not ( = ?auto_23896 ?auto_23910 ) ) ( not ( = ?auto_23896 ?auto_23901 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23888 ?auto_23890 ?auto_23889 ?auto_23892 )
      ( MAKE-1CRATE ?auto_23892 ?auto_23891 )
      ( MAKE-8CRATE-VERIFY ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23888 ?auto_23890 ?auto_23889 ?auto_23892 ?auto_23891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23920 - SURFACE
      ?auto_23921 - SURFACE
    )
    :vars
    (
      ?auto_23922 - HOIST
      ?auto_23923 - PLACE
      ?auto_23925 - PLACE
      ?auto_23926 - HOIST
      ?auto_23927 - SURFACE
      ?auto_23924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23922 ?auto_23923 ) ( SURFACE-AT ?auto_23920 ?auto_23923 ) ( CLEAR ?auto_23920 ) ( IS-CRATE ?auto_23921 ) ( AVAILABLE ?auto_23922 ) ( not ( = ?auto_23925 ?auto_23923 ) ) ( HOIST-AT ?auto_23926 ?auto_23925 ) ( AVAILABLE ?auto_23926 ) ( SURFACE-AT ?auto_23921 ?auto_23925 ) ( ON ?auto_23921 ?auto_23927 ) ( CLEAR ?auto_23921 ) ( TRUCK-AT ?auto_23924 ?auto_23923 ) ( not ( = ?auto_23920 ?auto_23921 ) ) ( not ( = ?auto_23920 ?auto_23927 ) ) ( not ( = ?auto_23921 ?auto_23927 ) ) ( not ( = ?auto_23922 ?auto_23926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23924 ?auto_23923 ?auto_23925 )
      ( !LIFT ?auto_23926 ?auto_23921 ?auto_23927 ?auto_23925 )
      ( !LOAD ?auto_23926 ?auto_23921 ?auto_23924 ?auto_23925 )
      ( !DRIVE ?auto_23924 ?auto_23925 ?auto_23923 )
      ( !UNLOAD ?auto_23922 ?auto_23921 ?auto_23924 ?auto_23923 )
      ( !DROP ?auto_23922 ?auto_23921 ?auto_23920 ?auto_23923 )
      ( MAKE-1CRATE-VERIFY ?auto_23920 ?auto_23921 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23938 - SURFACE
      ?auto_23939 - SURFACE
      ?auto_23940 - SURFACE
      ?auto_23941 - SURFACE
      ?auto_23942 - SURFACE
      ?auto_23945 - SURFACE
      ?auto_23943 - SURFACE
      ?auto_23947 - SURFACE
      ?auto_23946 - SURFACE
      ?auto_23944 - SURFACE
    )
    :vars
    (
      ?auto_23952 - HOIST
      ?auto_23948 - PLACE
      ?auto_23949 - PLACE
      ?auto_23950 - HOIST
      ?auto_23951 - SURFACE
      ?auto_23956 - PLACE
      ?auto_23958 - HOIST
      ?auto_23955 - SURFACE
      ?auto_23962 - SURFACE
      ?auto_23974 - PLACE
      ?auto_23960 - HOIST
      ?auto_23971 - SURFACE
      ?auto_23968 - PLACE
      ?auto_23970 - HOIST
      ?auto_23963 - SURFACE
      ?auto_23965 - PLACE
      ?auto_23972 - HOIST
      ?auto_23966 - SURFACE
      ?auto_23969 - PLACE
      ?auto_23964 - HOIST
      ?auto_23959 - SURFACE
      ?auto_23975 - PLACE
      ?auto_23954 - HOIST
      ?auto_23967 - SURFACE
      ?auto_23973 - PLACE
      ?auto_23961 - HOIST
      ?auto_23957 - SURFACE
      ?auto_23953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23952 ?auto_23948 ) ( IS-CRATE ?auto_23944 ) ( not ( = ?auto_23949 ?auto_23948 ) ) ( HOIST-AT ?auto_23950 ?auto_23949 ) ( AVAILABLE ?auto_23950 ) ( SURFACE-AT ?auto_23944 ?auto_23949 ) ( ON ?auto_23944 ?auto_23951 ) ( CLEAR ?auto_23944 ) ( not ( = ?auto_23946 ?auto_23944 ) ) ( not ( = ?auto_23946 ?auto_23951 ) ) ( not ( = ?auto_23944 ?auto_23951 ) ) ( not ( = ?auto_23952 ?auto_23950 ) ) ( IS-CRATE ?auto_23946 ) ( not ( = ?auto_23956 ?auto_23948 ) ) ( HOIST-AT ?auto_23958 ?auto_23956 ) ( SURFACE-AT ?auto_23946 ?auto_23956 ) ( ON ?auto_23946 ?auto_23955 ) ( CLEAR ?auto_23946 ) ( not ( = ?auto_23947 ?auto_23946 ) ) ( not ( = ?auto_23947 ?auto_23955 ) ) ( not ( = ?auto_23946 ?auto_23955 ) ) ( not ( = ?auto_23952 ?auto_23958 ) ) ( IS-CRATE ?auto_23947 ) ( AVAILABLE ?auto_23958 ) ( SURFACE-AT ?auto_23947 ?auto_23956 ) ( ON ?auto_23947 ?auto_23962 ) ( CLEAR ?auto_23947 ) ( not ( = ?auto_23943 ?auto_23947 ) ) ( not ( = ?auto_23943 ?auto_23962 ) ) ( not ( = ?auto_23947 ?auto_23962 ) ) ( IS-CRATE ?auto_23943 ) ( not ( = ?auto_23974 ?auto_23948 ) ) ( HOIST-AT ?auto_23960 ?auto_23974 ) ( AVAILABLE ?auto_23960 ) ( SURFACE-AT ?auto_23943 ?auto_23974 ) ( ON ?auto_23943 ?auto_23971 ) ( CLEAR ?auto_23943 ) ( not ( = ?auto_23945 ?auto_23943 ) ) ( not ( = ?auto_23945 ?auto_23971 ) ) ( not ( = ?auto_23943 ?auto_23971 ) ) ( not ( = ?auto_23952 ?auto_23960 ) ) ( IS-CRATE ?auto_23945 ) ( not ( = ?auto_23968 ?auto_23948 ) ) ( HOIST-AT ?auto_23970 ?auto_23968 ) ( AVAILABLE ?auto_23970 ) ( SURFACE-AT ?auto_23945 ?auto_23968 ) ( ON ?auto_23945 ?auto_23963 ) ( CLEAR ?auto_23945 ) ( not ( = ?auto_23942 ?auto_23945 ) ) ( not ( = ?auto_23942 ?auto_23963 ) ) ( not ( = ?auto_23945 ?auto_23963 ) ) ( not ( = ?auto_23952 ?auto_23970 ) ) ( IS-CRATE ?auto_23942 ) ( not ( = ?auto_23965 ?auto_23948 ) ) ( HOIST-AT ?auto_23972 ?auto_23965 ) ( AVAILABLE ?auto_23972 ) ( SURFACE-AT ?auto_23942 ?auto_23965 ) ( ON ?auto_23942 ?auto_23966 ) ( CLEAR ?auto_23942 ) ( not ( = ?auto_23941 ?auto_23942 ) ) ( not ( = ?auto_23941 ?auto_23966 ) ) ( not ( = ?auto_23942 ?auto_23966 ) ) ( not ( = ?auto_23952 ?auto_23972 ) ) ( IS-CRATE ?auto_23941 ) ( not ( = ?auto_23969 ?auto_23948 ) ) ( HOIST-AT ?auto_23964 ?auto_23969 ) ( AVAILABLE ?auto_23964 ) ( SURFACE-AT ?auto_23941 ?auto_23969 ) ( ON ?auto_23941 ?auto_23959 ) ( CLEAR ?auto_23941 ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( not ( = ?auto_23940 ?auto_23959 ) ) ( not ( = ?auto_23941 ?auto_23959 ) ) ( not ( = ?auto_23952 ?auto_23964 ) ) ( IS-CRATE ?auto_23940 ) ( not ( = ?auto_23975 ?auto_23948 ) ) ( HOIST-AT ?auto_23954 ?auto_23975 ) ( AVAILABLE ?auto_23954 ) ( SURFACE-AT ?auto_23940 ?auto_23975 ) ( ON ?auto_23940 ?auto_23967 ) ( CLEAR ?auto_23940 ) ( not ( = ?auto_23939 ?auto_23940 ) ) ( not ( = ?auto_23939 ?auto_23967 ) ) ( not ( = ?auto_23940 ?auto_23967 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( SURFACE-AT ?auto_23938 ?auto_23948 ) ( CLEAR ?auto_23938 ) ( IS-CRATE ?auto_23939 ) ( AVAILABLE ?auto_23952 ) ( not ( = ?auto_23973 ?auto_23948 ) ) ( HOIST-AT ?auto_23961 ?auto_23973 ) ( AVAILABLE ?auto_23961 ) ( SURFACE-AT ?auto_23939 ?auto_23973 ) ( ON ?auto_23939 ?auto_23957 ) ( CLEAR ?auto_23939 ) ( TRUCK-AT ?auto_23953 ?auto_23948 ) ( not ( = ?auto_23938 ?auto_23939 ) ) ( not ( = ?auto_23938 ?auto_23957 ) ) ( not ( = ?auto_23939 ?auto_23957 ) ) ( not ( = ?auto_23952 ?auto_23961 ) ) ( not ( = ?auto_23938 ?auto_23940 ) ) ( not ( = ?auto_23938 ?auto_23967 ) ) ( not ( = ?auto_23940 ?auto_23957 ) ) ( not ( = ?auto_23975 ?auto_23973 ) ) ( not ( = ?auto_23954 ?auto_23961 ) ) ( not ( = ?auto_23967 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23941 ) ) ( not ( = ?auto_23938 ?auto_23959 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( not ( = ?auto_23939 ?auto_23959 ) ) ( not ( = ?auto_23941 ?auto_23967 ) ) ( not ( = ?auto_23941 ?auto_23957 ) ) ( not ( = ?auto_23969 ?auto_23975 ) ) ( not ( = ?auto_23969 ?auto_23973 ) ) ( not ( = ?auto_23964 ?auto_23954 ) ) ( not ( = ?auto_23964 ?auto_23961 ) ) ( not ( = ?auto_23959 ?auto_23967 ) ) ( not ( = ?auto_23959 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23942 ) ) ( not ( = ?auto_23938 ?auto_23966 ) ) ( not ( = ?auto_23939 ?auto_23942 ) ) ( not ( = ?auto_23939 ?auto_23966 ) ) ( not ( = ?auto_23940 ?auto_23942 ) ) ( not ( = ?auto_23940 ?auto_23966 ) ) ( not ( = ?auto_23942 ?auto_23959 ) ) ( not ( = ?auto_23942 ?auto_23967 ) ) ( not ( = ?auto_23942 ?auto_23957 ) ) ( not ( = ?auto_23965 ?auto_23969 ) ) ( not ( = ?auto_23965 ?auto_23975 ) ) ( not ( = ?auto_23965 ?auto_23973 ) ) ( not ( = ?auto_23972 ?auto_23964 ) ) ( not ( = ?auto_23972 ?auto_23954 ) ) ( not ( = ?auto_23972 ?auto_23961 ) ) ( not ( = ?auto_23966 ?auto_23959 ) ) ( not ( = ?auto_23966 ?auto_23967 ) ) ( not ( = ?auto_23966 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23945 ) ) ( not ( = ?auto_23938 ?auto_23963 ) ) ( not ( = ?auto_23939 ?auto_23945 ) ) ( not ( = ?auto_23939 ?auto_23963 ) ) ( not ( = ?auto_23940 ?auto_23945 ) ) ( not ( = ?auto_23940 ?auto_23963 ) ) ( not ( = ?auto_23941 ?auto_23945 ) ) ( not ( = ?auto_23941 ?auto_23963 ) ) ( not ( = ?auto_23945 ?auto_23966 ) ) ( not ( = ?auto_23945 ?auto_23959 ) ) ( not ( = ?auto_23945 ?auto_23967 ) ) ( not ( = ?auto_23945 ?auto_23957 ) ) ( not ( = ?auto_23968 ?auto_23965 ) ) ( not ( = ?auto_23968 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23975 ) ) ( not ( = ?auto_23968 ?auto_23973 ) ) ( not ( = ?auto_23970 ?auto_23972 ) ) ( not ( = ?auto_23970 ?auto_23964 ) ) ( not ( = ?auto_23970 ?auto_23954 ) ) ( not ( = ?auto_23970 ?auto_23961 ) ) ( not ( = ?auto_23963 ?auto_23966 ) ) ( not ( = ?auto_23963 ?auto_23959 ) ) ( not ( = ?auto_23963 ?auto_23967 ) ) ( not ( = ?auto_23963 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23943 ) ) ( not ( = ?auto_23938 ?auto_23971 ) ) ( not ( = ?auto_23939 ?auto_23943 ) ) ( not ( = ?auto_23939 ?auto_23971 ) ) ( not ( = ?auto_23940 ?auto_23943 ) ) ( not ( = ?auto_23940 ?auto_23971 ) ) ( not ( = ?auto_23941 ?auto_23943 ) ) ( not ( = ?auto_23941 ?auto_23971 ) ) ( not ( = ?auto_23942 ?auto_23943 ) ) ( not ( = ?auto_23942 ?auto_23971 ) ) ( not ( = ?auto_23943 ?auto_23963 ) ) ( not ( = ?auto_23943 ?auto_23966 ) ) ( not ( = ?auto_23943 ?auto_23959 ) ) ( not ( = ?auto_23943 ?auto_23967 ) ) ( not ( = ?auto_23943 ?auto_23957 ) ) ( not ( = ?auto_23974 ?auto_23968 ) ) ( not ( = ?auto_23974 ?auto_23965 ) ) ( not ( = ?auto_23974 ?auto_23969 ) ) ( not ( = ?auto_23974 ?auto_23975 ) ) ( not ( = ?auto_23974 ?auto_23973 ) ) ( not ( = ?auto_23960 ?auto_23970 ) ) ( not ( = ?auto_23960 ?auto_23972 ) ) ( not ( = ?auto_23960 ?auto_23964 ) ) ( not ( = ?auto_23960 ?auto_23954 ) ) ( not ( = ?auto_23960 ?auto_23961 ) ) ( not ( = ?auto_23971 ?auto_23963 ) ) ( not ( = ?auto_23971 ?auto_23966 ) ) ( not ( = ?auto_23971 ?auto_23959 ) ) ( not ( = ?auto_23971 ?auto_23967 ) ) ( not ( = ?auto_23971 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23947 ) ) ( not ( = ?auto_23938 ?auto_23962 ) ) ( not ( = ?auto_23939 ?auto_23947 ) ) ( not ( = ?auto_23939 ?auto_23962 ) ) ( not ( = ?auto_23940 ?auto_23947 ) ) ( not ( = ?auto_23940 ?auto_23962 ) ) ( not ( = ?auto_23941 ?auto_23947 ) ) ( not ( = ?auto_23941 ?auto_23962 ) ) ( not ( = ?auto_23942 ?auto_23947 ) ) ( not ( = ?auto_23942 ?auto_23962 ) ) ( not ( = ?auto_23945 ?auto_23947 ) ) ( not ( = ?auto_23945 ?auto_23962 ) ) ( not ( = ?auto_23947 ?auto_23971 ) ) ( not ( = ?auto_23947 ?auto_23963 ) ) ( not ( = ?auto_23947 ?auto_23966 ) ) ( not ( = ?auto_23947 ?auto_23959 ) ) ( not ( = ?auto_23947 ?auto_23967 ) ) ( not ( = ?auto_23947 ?auto_23957 ) ) ( not ( = ?auto_23956 ?auto_23974 ) ) ( not ( = ?auto_23956 ?auto_23968 ) ) ( not ( = ?auto_23956 ?auto_23965 ) ) ( not ( = ?auto_23956 ?auto_23969 ) ) ( not ( = ?auto_23956 ?auto_23975 ) ) ( not ( = ?auto_23956 ?auto_23973 ) ) ( not ( = ?auto_23958 ?auto_23960 ) ) ( not ( = ?auto_23958 ?auto_23970 ) ) ( not ( = ?auto_23958 ?auto_23972 ) ) ( not ( = ?auto_23958 ?auto_23964 ) ) ( not ( = ?auto_23958 ?auto_23954 ) ) ( not ( = ?auto_23958 ?auto_23961 ) ) ( not ( = ?auto_23962 ?auto_23971 ) ) ( not ( = ?auto_23962 ?auto_23963 ) ) ( not ( = ?auto_23962 ?auto_23966 ) ) ( not ( = ?auto_23962 ?auto_23959 ) ) ( not ( = ?auto_23962 ?auto_23967 ) ) ( not ( = ?auto_23962 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23946 ) ) ( not ( = ?auto_23938 ?auto_23955 ) ) ( not ( = ?auto_23939 ?auto_23946 ) ) ( not ( = ?auto_23939 ?auto_23955 ) ) ( not ( = ?auto_23940 ?auto_23946 ) ) ( not ( = ?auto_23940 ?auto_23955 ) ) ( not ( = ?auto_23941 ?auto_23946 ) ) ( not ( = ?auto_23941 ?auto_23955 ) ) ( not ( = ?auto_23942 ?auto_23946 ) ) ( not ( = ?auto_23942 ?auto_23955 ) ) ( not ( = ?auto_23945 ?auto_23946 ) ) ( not ( = ?auto_23945 ?auto_23955 ) ) ( not ( = ?auto_23943 ?auto_23946 ) ) ( not ( = ?auto_23943 ?auto_23955 ) ) ( not ( = ?auto_23946 ?auto_23962 ) ) ( not ( = ?auto_23946 ?auto_23971 ) ) ( not ( = ?auto_23946 ?auto_23963 ) ) ( not ( = ?auto_23946 ?auto_23966 ) ) ( not ( = ?auto_23946 ?auto_23959 ) ) ( not ( = ?auto_23946 ?auto_23967 ) ) ( not ( = ?auto_23946 ?auto_23957 ) ) ( not ( = ?auto_23955 ?auto_23962 ) ) ( not ( = ?auto_23955 ?auto_23971 ) ) ( not ( = ?auto_23955 ?auto_23963 ) ) ( not ( = ?auto_23955 ?auto_23966 ) ) ( not ( = ?auto_23955 ?auto_23959 ) ) ( not ( = ?auto_23955 ?auto_23967 ) ) ( not ( = ?auto_23955 ?auto_23957 ) ) ( not ( = ?auto_23938 ?auto_23944 ) ) ( not ( = ?auto_23938 ?auto_23951 ) ) ( not ( = ?auto_23939 ?auto_23944 ) ) ( not ( = ?auto_23939 ?auto_23951 ) ) ( not ( = ?auto_23940 ?auto_23944 ) ) ( not ( = ?auto_23940 ?auto_23951 ) ) ( not ( = ?auto_23941 ?auto_23944 ) ) ( not ( = ?auto_23941 ?auto_23951 ) ) ( not ( = ?auto_23942 ?auto_23944 ) ) ( not ( = ?auto_23942 ?auto_23951 ) ) ( not ( = ?auto_23945 ?auto_23944 ) ) ( not ( = ?auto_23945 ?auto_23951 ) ) ( not ( = ?auto_23943 ?auto_23944 ) ) ( not ( = ?auto_23943 ?auto_23951 ) ) ( not ( = ?auto_23947 ?auto_23944 ) ) ( not ( = ?auto_23947 ?auto_23951 ) ) ( not ( = ?auto_23944 ?auto_23955 ) ) ( not ( = ?auto_23944 ?auto_23962 ) ) ( not ( = ?auto_23944 ?auto_23971 ) ) ( not ( = ?auto_23944 ?auto_23963 ) ) ( not ( = ?auto_23944 ?auto_23966 ) ) ( not ( = ?auto_23944 ?auto_23959 ) ) ( not ( = ?auto_23944 ?auto_23967 ) ) ( not ( = ?auto_23944 ?auto_23957 ) ) ( not ( = ?auto_23949 ?auto_23956 ) ) ( not ( = ?auto_23949 ?auto_23974 ) ) ( not ( = ?auto_23949 ?auto_23968 ) ) ( not ( = ?auto_23949 ?auto_23965 ) ) ( not ( = ?auto_23949 ?auto_23969 ) ) ( not ( = ?auto_23949 ?auto_23975 ) ) ( not ( = ?auto_23949 ?auto_23973 ) ) ( not ( = ?auto_23950 ?auto_23958 ) ) ( not ( = ?auto_23950 ?auto_23960 ) ) ( not ( = ?auto_23950 ?auto_23970 ) ) ( not ( = ?auto_23950 ?auto_23972 ) ) ( not ( = ?auto_23950 ?auto_23964 ) ) ( not ( = ?auto_23950 ?auto_23954 ) ) ( not ( = ?auto_23950 ?auto_23961 ) ) ( not ( = ?auto_23951 ?auto_23955 ) ) ( not ( = ?auto_23951 ?auto_23962 ) ) ( not ( = ?auto_23951 ?auto_23971 ) ) ( not ( = ?auto_23951 ?auto_23963 ) ) ( not ( = ?auto_23951 ?auto_23966 ) ) ( not ( = ?auto_23951 ?auto_23959 ) ) ( not ( = ?auto_23951 ?auto_23967 ) ) ( not ( = ?auto_23951 ?auto_23957 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23938 ?auto_23939 ?auto_23940 ?auto_23941 ?auto_23942 ?auto_23945 ?auto_23943 ?auto_23947 ?auto_23946 )
      ( MAKE-1CRATE ?auto_23946 ?auto_23944 )
      ( MAKE-9CRATE-VERIFY ?auto_23938 ?auto_23939 ?auto_23940 ?auto_23941 ?auto_23942 ?auto_23945 ?auto_23943 ?auto_23947 ?auto_23946 ?auto_23944 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23978 - SURFACE
      ?auto_23979 - SURFACE
    )
    :vars
    (
      ?auto_23980 - HOIST
      ?auto_23981 - PLACE
      ?auto_23983 - PLACE
      ?auto_23984 - HOIST
      ?auto_23985 - SURFACE
      ?auto_23982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23980 ?auto_23981 ) ( SURFACE-AT ?auto_23978 ?auto_23981 ) ( CLEAR ?auto_23978 ) ( IS-CRATE ?auto_23979 ) ( AVAILABLE ?auto_23980 ) ( not ( = ?auto_23983 ?auto_23981 ) ) ( HOIST-AT ?auto_23984 ?auto_23983 ) ( AVAILABLE ?auto_23984 ) ( SURFACE-AT ?auto_23979 ?auto_23983 ) ( ON ?auto_23979 ?auto_23985 ) ( CLEAR ?auto_23979 ) ( TRUCK-AT ?auto_23982 ?auto_23981 ) ( not ( = ?auto_23978 ?auto_23979 ) ) ( not ( = ?auto_23978 ?auto_23985 ) ) ( not ( = ?auto_23979 ?auto_23985 ) ) ( not ( = ?auto_23980 ?auto_23984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23982 ?auto_23981 ?auto_23983 )
      ( !LIFT ?auto_23984 ?auto_23979 ?auto_23985 ?auto_23983 )
      ( !LOAD ?auto_23984 ?auto_23979 ?auto_23982 ?auto_23983 )
      ( !DRIVE ?auto_23982 ?auto_23983 ?auto_23981 )
      ( !UNLOAD ?auto_23980 ?auto_23979 ?auto_23982 ?auto_23981 )
      ( !DROP ?auto_23980 ?auto_23979 ?auto_23978 ?auto_23981 )
      ( MAKE-1CRATE-VERIFY ?auto_23978 ?auto_23979 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23997 - SURFACE
      ?auto_23998 - SURFACE
      ?auto_23999 - SURFACE
      ?auto_24000 - SURFACE
      ?auto_24001 - SURFACE
      ?auto_24004 - SURFACE
      ?auto_24002 - SURFACE
      ?auto_24006 - SURFACE
      ?auto_24005 - SURFACE
      ?auto_24003 - SURFACE
      ?auto_24007 - SURFACE
    )
    :vars
    (
      ?auto_24009 - HOIST
      ?auto_24013 - PLACE
      ?auto_24010 - PLACE
      ?auto_24008 - HOIST
      ?auto_24012 - SURFACE
      ?auto_24022 - PLACE
      ?auto_24036 - HOIST
      ?auto_24026 - SURFACE
      ?auto_24019 - PLACE
      ?auto_24029 - HOIST
      ?auto_24034 - SURFACE
      ?auto_24016 - SURFACE
      ?auto_24038 - PLACE
      ?auto_24027 - HOIST
      ?auto_24025 - SURFACE
      ?auto_24020 - PLACE
      ?auto_24032 - HOIST
      ?auto_24017 - SURFACE
      ?auto_24015 - PLACE
      ?auto_24033 - HOIST
      ?auto_24037 - SURFACE
      ?auto_24035 - PLACE
      ?auto_24031 - HOIST
      ?auto_24028 - SURFACE
      ?auto_24030 - PLACE
      ?auto_24021 - HOIST
      ?auto_24014 - SURFACE
      ?auto_24018 - PLACE
      ?auto_24023 - HOIST
      ?auto_24024 - SURFACE
      ?auto_24011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24009 ?auto_24013 ) ( IS-CRATE ?auto_24007 ) ( not ( = ?auto_24010 ?auto_24013 ) ) ( HOIST-AT ?auto_24008 ?auto_24010 ) ( AVAILABLE ?auto_24008 ) ( SURFACE-AT ?auto_24007 ?auto_24010 ) ( ON ?auto_24007 ?auto_24012 ) ( CLEAR ?auto_24007 ) ( not ( = ?auto_24003 ?auto_24007 ) ) ( not ( = ?auto_24003 ?auto_24012 ) ) ( not ( = ?auto_24007 ?auto_24012 ) ) ( not ( = ?auto_24009 ?auto_24008 ) ) ( IS-CRATE ?auto_24003 ) ( not ( = ?auto_24022 ?auto_24013 ) ) ( HOIST-AT ?auto_24036 ?auto_24022 ) ( AVAILABLE ?auto_24036 ) ( SURFACE-AT ?auto_24003 ?auto_24022 ) ( ON ?auto_24003 ?auto_24026 ) ( CLEAR ?auto_24003 ) ( not ( = ?auto_24005 ?auto_24003 ) ) ( not ( = ?auto_24005 ?auto_24026 ) ) ( not ( = ?auto_24003 ?auto_24026 ) ) ( not ( = ?auto_24009 ?auto_24036 ) ) ( IS-CRATE ?auto_24005 ) ( not ( = ?auto_24019 ?auto_24013 ) ) ( HOIST-AT ?auto_24029 ?auto_24019 ) ( SURFACE-AT ?auto_24005 ?auto_24019 ) ( ON ?auto_24005 ?auto_24034 ) ( CLEAR ?auto_24005 ) ( not ( = ?auto_24006 ?auto_24005 ) ) ( not ( = ?auto_24006 ?auto_24034 ) ) ( not ( = ?auto_24005 ?auto_24034 ) ) ( not ( = ?auto_24009 ?auto_24029 ) ) ( IS-CRATE ?auto_24006 ) ( AVAILABLE ?auto_24029 ) ( SURFACE-AT ?auto_24006 ?auto_24019 ) ( ON ?auto_24006 ?auto_24016 ) ( CLEAR ?auto_24006 ) ( not ( = ?auto_24002 ?auto_24006 ) ) ( not ( = ?auto_24002 ?auto_24016 ) ) ( not ( = ?auto_24006 ?auto_24016 ) ) ( IS-CRATE ?auto_24002 ) ( not ( = ?auto_24038 ?auto_24013 ) ) ( HOIST-AT ?auto_24027 ?auto_24038 ) ( AVAILABLE ?auto_24027 ) ( SURFACE-AT ?auto_24002 ?auto_24038 ) ( ON ?auto_24002 ?auto_24025 ) ( CLEAR ?auto_24002 ) ( not ( = ?auto_24004 ?auto_24002 ) ) ( not ( = ?auto_24004 ?auto_24025 ) ) ( not ( = ?auto_24002 ?auto_24025 ) ) ( not ( = ?auto_24009 ?auto_24027 ) ) ( IS-CRATE ?auto_24004 ) ( not ( = ?auto_24020 ?auto_24013 ) ) ( HOIST-AT ?auto_24032 ?auto_24020 ) ( AVAILABLE ?auto_24032 ) ( SURFACE-AT ?auto_24004 ?auto_24020 ) ( ON ?auto_24004 ?auto_24017 ) ( CLEAR ?auto_24004 ) ( not ( = ?auto_24001 ?auto_24004 ) ) ( not ( = ?auto_24001 ?auto_24017 ) ) ( not ( = ?auto_24004 ?auto_24017 ) ) ( not ( = ?auto_24009 ?auto_24032 ) ) ( IS-CRATE ?auto_24001 ) ( not ( = ?auto_24015 ?auto_24013 ) ) ( HOIST-AT ?auto_24033 ?auto_24015 ) ( AVAILABLE ?auto_24033 ) ( SURFACE-AT ?auto_24001 ?auto_24015 ) ( ON ?auto_24001 ?auto_24037 ) ( CLEAR ?auto_24001 ) ( not ( = ?auto_24000 ?auto_24001 ) ) ( not ( = ?auto_24000 ?auto_24037 ) ) ( not ( = ?auto_24001 ?auto_24037 ) ) ( not ( = ?auto_24009 ?auto_24033 ) ) ( IS-CRATE ?auto_24000 ) ( not ( = ?auto_24035 ?auto_24013 ) ) ( HOIST-AT ?auto_24031 ?auto_24035 ) ( AVAILABLE ?auto_24031 ) ( SURFACE-AT ?auto_24000 ?auto_24035 ) ( ON ?auto_24000 ?auto_24028 ) ( CLEAR ?auto_24000 ) ( not ( = ?auto_23999 ?auto_24000 ) ) ( not ( = ?auto_23999 ?auto_24028 ) ) ( not ( = ?auto_24000 ?auto_24028 ) ) ( not ( = ?auto_24009 ?auto_24031 ) ) ( IS-CRATE ?auto_23999 ) ( not ( = ?auto_24030 ?auto_24013 ) ) ( HOIST-AT ?auto_24021 ?auto_24030 ) ( AVAILABLE ?auto_24021 ) ( SURFACE-AT ?auto_23999 ?auto_24030 ) ( ON ?auto_23999 ?auto_24014 ) ( CLEAR ?auto_23999 ) ( not ( = ?auto_23998 ?auto_23999 ) ) ( not ( = ?auto_23998 ?auto_24014 ) ) ( not ( = ?auto_23999 ?auto_24014 ) ) ( not ( = ?auto_24009 ?auto_24021 ) ) ( SURFACE-AT ?auto_23997 ?auto_24013 ) ( CLEAR ?auto_23997 ) ( IS-CRATE ?auto_23998 ) ( AVAILABLE ?auto_24009 ) ( not ( = ?auto_24018 ?auto_24013 ) ) ( HOIST-AT ?auto_24023 ?auto_24018 ) ( AVAILABLE ?auto_24023 ) ( SURFACE-AT ?auto_23998 ?auto_24018 ) ( ON ?auto_23998 ?auto_24024 ) ( CLEAR ?auto_23998 ) ( TRUCK-AT ?auto_24011 ?auto_24013 ) ( not ( = ?auto_23997 ?auto_23998 ) ) ( not ( = ?auto_23997 ?auto_24024 ) ) ( not ( = ?auto_23998 ?auto_24024 ) ) ( not ( = ?auto_24009 ?auto_24023 ) ) ( not ( = ?auto_23997 ?auto_23999 ) ) ( not ( = ?auto_23997 ?auto_24014 ) ) ( not ( = ?auto_23999 ?auto_24024 ) ) ( not ( = ?auto_24030 ?auto_24018 ) ) ( not ( = ?auto_24021 ?auto_24023 ) ) ( not ( = ?auto_24014 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24000 ) ) ( not ( = ?auto_23997 ?auto_24028 ) ) ( not ( = ?auto_23998 ?auto_24000 ) ) ( not ( = ?auto_23998 ?auto_24028 ) ) ( not ( = ?auto_24000 ?auto_24014 ) ) ( not ( = ?auto_24000 ?auto_24024 ) ) ( not ( = ?auto_24035 ?auto_24030 ) ) ( not ( = ?auto_24035 ?auto_24018 ) ) ( not ( = ?auto_24031 ?auto_24021 ) ) ( not ( = ?auto_24031 ?auto_24023 ) ) ( not ( = ?auto_24028 ?auto_24014 ) ) ( not ( = ?auto_24028 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24001 ) ) ( not ( = ?auto_23997 ?auto_24037 ) ) ( not ( = ?auto_23998 ?auto_24001 ) ) ( not ( = ?auto_23998 ?auto_24037 ) ) ( not ( = ?auto_23999 ?auto_24001 ) ) ( not ( = ?auto_23999 ?auto_24037 ) ) ( not ( = ?auto_24001 ?auto_24028 ) ) ( not ( = ?auto_24001 ?auto_24014 ) ) ( not ( = ?auto_24001 ?auto_24024 ) ) ( not ( = ?auto_24015 ?auto_24035 ) ) ( not ( = ?auto_24015 ?auto_24030 ) ) ( not ( = ?auto_24015 ?auto_24018 ) ) ( not ( = ?auto_24033 ?auto_24031 ) ) ( not ( = ?auto_24033 ?auto_24021 ) ) ( not ( = ?auto_24033 ?auto_24023 ) ) ( not ( = ?auto_24037 ?auto_24028 ) ) ( not ( = ?auto_24037 ?auto_24014 ) ) ( not ( = ?auto_24037 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24004 ) ) ( not ( = ?auto_23997 ?auto_24017 ) ) ( not ( = ?auto_23998 ?auto_24004 ) ) ( not ( = ?auto_23998 ?auto_24017 ) ) ( not ( = ?auto_23999 ?auto_24004 ) ) ( not ( = ?auto_23999 ?auto_24017 ) ) ( not ( = ?auto_24000 ?auto_24004 ) ) ( not ( = ?auto_24000 ?auto_24017 ) ) ( not ( = ?auto_24004 ?auto_24037 ) ) ( not ( = ?auto_24004 ?auto_24028 ) ) ( not ( = ?auto_24004 ?auto_24014 ) ) ( not ( = ?auto_24004 ?auto_24024 ) ) ( not ( = ?auto_24020 ?auto_24015 ) ) ( not ( = ?auto_24020 ?auto_24035 ) ) ( not ( = ?auto_24020 ?auto_24030 ) ) ( not ( = ?auto_24020 ?auto_24018 ) ) ( not ( = ?auto_24032 ?auto_24033 ) ) ( not ( = ?auto_24032 ?auto_24031 ) ) ( not ( = ?auto_24032 ?auto_24021 ) ) ( not ( = ?auto_24032 ?auto_24023 ) ) ( not ( = ?auto_24017 ?auto_24037 ) ) ( not ( = ?auto_24017 ?auto_24028 ) ) ( not ( = ?auto_24017 ?auto_24014 ) ) ( not ( = ?auto_24017 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24002 ) ) ( not ( = ?auto_23997 ?auto_24025 ) ) ( not ( = ?auto_23998 ?auto_24002 ) ) ( not ( = ?auto_23998 ?auto_24025 ) ) ( not ( = ?auto_23999 ?auto_24002 ) ) ( not ( = ?auto_23999 ?auto_24025 ) ) ( not ( = ?auto_24000 ?auto_24002 ) ) ( not ( = ?auto_24000 ?auto_24025 ) ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( not ( = ?auto_24001 ?auto_24025 ) ) ( not ( = ?auto_24002 ?auto_24017 ) ) ( not ( = ?auto_24002 ?auto_24037 ) ) ( not ( = ?auto_24002 ?auto_24028 ) ) ( not ( = ?auto_24002 ?auto_24014 ) ) ( not ( = ?auto_24002 ?auto_24024 ) ) ( not ( = ?auto_24038 ?auto_24020 ) ) ( not ( = ?auto_24038 ?auto_24015 ) ) ( not ( = ?auto_24038 ?auto_24035 ) ) ( not ( = ?auto_24038 ?auto_24030 ) ) ( not ( = ?auto_24038 ?auto_24018 ) ) ( not ( = ?auto_24027 ?auto_24032 ) ) ( not ( = ?auto_24027 ?auto_24033 ) ) ( not ( = ?auto_24027 ?auto_24031 ) ) ( not ( = ?auto_24027 ?auto_24021 ) ) ( not ( = ?auto_24027 ?auto_24023 ) ) ( not ( = ?auto_24025 ?auto_24017 ) ) ( not ( = ?auto_24025 ?auto_24037 ) ) ( not ( = ?auto_24025 ?auto_24028 ) ) ( not ( = ?auto_24025 ?auto_24014 ) ) ( not ( = ?auto_24025 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24006 ) ) ( not ( = ?auto_23997 ?auto_24016 ) ) ( not ( = ?auto_23998 ?auto_24006 ) ) ( not ( = ?auto_23998 ?auto_24016 ) ) ( not ( = ?auto_23999 ?auto_24006 ) ) ( not ( = ?auto_23999 ?auto_24016 ) ) ( not ( = ?auto_24000 ?auto_24006 ) ) ( not ( = ?auto_24000 ?auto_24016 ) ) ( not ( = ?auto_24001 ?auto_24006 ) ) ( not ( = ?auto_24001 ?auto_24016 ) ) ( not ( = ?auto_24004 ?auto_24006 ) ) ( not ( = ?auto_24004 ?auto_24016 ) ) ( not ( = ?auto_24006 ?auto_24025 ) ) ( not ( = ?auto_24006 ?auto_24017 ) ) ( not ( = ?auto_24006 ?auto_24037 ) ) ( not ( = ?auto_24006 ?auto_24028 ) ) ( not ( = ?auto_24006 ?auto_24014 ) ) ( not ( = ?auto_24006 ?auto_24024 ) ) ( not ( = ?auto_24019 ?auto_24038 ) ) ( not ( = ?auto_24019 ?auto_24020 ) ) ( not ( = ?auto_24019 ?auto_24015 ) ) ( not ( = ?auto_24019 ?auto_24035 ) ) ( not ( = ?auto_24019 ?auto_24030 ) ) ( not ( = ?auto_24019 ?auto_24018 ) ) ( not ( = ?auto_24029 ?auto_24027 ) ) ( not ( = ?auto_24029 ?auto_24032 ) ) ( not ( = ?auto_24029 ?auto_24033 ) ) ( not ( = ?auto_24029 ?auto_24031 ) ) ( not ( = ?auto_24029 ?auto_24021 ) ) ( not ( = ?auto_24029 ?auto_24023 ) ) ( not ( = ?auto_24016 ?auto_24025 ) ) ( not ( = ?auto_24016 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24037 ) ) ( not ( = ?auto_24016 ?auto_24028 ) ) ( not ( = ?auto_24016 ?auto_24014 ) ) ( not ( = ?auto_24016 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24005 ) ) ( not ( = ?auto_23997 ?auto_24034 ) ) ( not ( = ?auto_23998 ?auto_24005 ) ) ( not ( = ?auto_23998 ?auto_24034 ) ) ( not ( = ?auto_23999 ?auto_24005 ) ) ( not ( = ?auto_23999 ?auto_24034 ) ) ( not ( = ?auto_24000 ?auto_24005 ) ) ( not ( = ?auto_24000 ?auto_24034 ) ) ( not ( = ?auto_24001 ?auto_24005 ) ) ( not ( = ?auto_24001 ?auto_24034 ) ) ( not ( = ?auto_24004 ?auto_24005 ) ) ( not ( = ?auto_24004 ?auto_24034 ) ) ( not ( = ?auto_24002 ?auto_24005 ) ) ( not ( = ?auto_24002 ?auto_24034 ) ) ( not ( = ?auto_24005 ?auto_24016 ) ) ( not ( = ?auto_24005 ?auto_24025 ) ) ( not ( = ?auto_24005 ?auto_24017 ) ) ( not ( = ?auto_24005 ?auto_24037 ) ) ( not ( = ?auto_24005 ?auto_24028 ) ) ( not ( = ?auto_24005 ?auto_24014 ) ) ( not ( = ?auto_24005 ?auto_24024 ) ) ( not ( = ?auto_24034 ?auto_24016 ) ) ( not ( = ?auto_24034 ?auto_24025 ) ) ( not ( = ?auto_24034 ?auto_24017 ) ) ( not ( = ?auto_24034 ?auto_24037 ) ) ( not ( = ?auto_24034 ?auto_24028 ) ) ( not ( = ?auto_24034 ?auto_24014 ) ) ( not ( = ?auto_24034 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24003 ) ) ( not ( = ?auto_23997 ?auto_24026 ) ) ( not ( = ?auto_23998 ?auto_24003 ) ) ( not ( = ?auto_23998 ?auto_24026 ) ) ( not ( = ?auto_23999 ?auto_24003 ) ) ( not ( = ?auto_23999 ?auto_24026 ) ) ( not ( = ?auto_24000 ?auto_24003 ) ) ( not ( = ?auto_24000 ?auto_24026 ) ) ( not ( = ?auto_24001 ?auto_24003 ) ) ( not ( = ?auto_24001 ?auto_24026 ) ) ( not ( = ?auto_24004 ?auto_24003 ) ) ( not ( = ?auto_24004 ?auto_24026 ) ) ( not ( = ?auto_24002 ?auto_24003 ) ) ( not ( = ?auto_24002 ?auto_24026 ) ) ( not ( = ?auto_24006 ?auto_24003 ) ) ( not ( = ?auto_24006 ?auto_24026 ) ) ( not ( = ?auto_24003 ?auto_24034 ) ) ( not ( = ?auto_24003 ?auto_24016 ) ) ( not ( = ?auto_24003 ?auto_24025 ) ) ( not ( = ?auto_24003 ?auto_24017 ) ) ( not ( = ?auto_24003 ?auto_24037 ) ) ( not ( = ?auto_24003 ?auto_24028 ) ) ( not ( = ?auto_24003 ?auto_24014 ) ) ( not ( = ?auto_24003 ?auto_24024 ) ) ( not ( = ?auto_24022 ?auto_24019 ) ) ( not ( = ?auto_24022 ?auto_24038 ) ) ( not ( = ?auto_24022 ?auto_24020 ) ) ( not ( = ?auto_24022 ?auto_24015 ) ) ( not ( = ?auto_24022 ?auto_24035 ) ) ( not ( = ?auto_24022 ?auto_24030 ) ) ( not ( = ?auto_24022 ?auto_24018 ) ) ( not ( = ?auto_24036 ?auto_24029 ) ) ( not ( = ?auto_24036 ?auto_24027 ) ) ( not ( = ?auto_24036 ?auto_24032 ) ) ( not ( = ?auto_24036 ?auto_24033 ) ) ( not ( = ?auto_24036 ?auto_24031 ) ) ( not ( = ?auto_24036 ?auto_24021 ) ) ( not ( = ?auto_24036 ?auto_24023 ) ) ( not ( = ?auto_24026 ?auto_24034 ) ) ( not ( = ?auto_24026 ?auto_24016 ) ) ( not ( = ?auto_24026 ?auto_24025 ) ) ( not ( = ?auto_24026 ?auto_24017 ) ) ( not ( = ?auto_24026 ?auto_24037 ) ) ( not ( = ?auto_24026 ?auto_24028 ) ) ( not ( = ?auto_24026 ?auto_24014 ) ) ( not ( = ?auto_24026 ?auto_24024 ) ) ( not ( = ?auto_23997 ?auto_24007 ) ) ( not ( = ?auto_23997 ?auto_24012 ) ) ( not ( = ?auto_23998 ?auto_24007 ) ) ( not ( = ?auto_23998 ?auto_24012 ) ) ( not ( = ?auto_23999 ?auto_24007 ) ) ( not ( = ?auto_23999 ?auto_24012 ) ) ( not ( = ?auto_24000 ?auto_24007 ) ) ( not ( = ?auto_24000 ?auto_24012 ) ) ( not ( = ?auto_24001 ?auto_24007 ) ) ( not ( = ?auto_24001 ?auto_24012 ) ) ( not ( = ?auto_24004 ?auto_24007 ) ) ( not ( = ?auto_24004 ?auto_24012 ) ) ( not ( = ?auto_24002 ?auto_24007 ) ) ( not ( = ?auto_24002 ?auto_24012 ) ) ( not ( = ?auto_24006 ?auto_24007 ) ) ( not ( = ?auto_24006 ?auto_24012 ) ) ( not ( = ?auto_24005 ?auto_24007 ) ) ( not ( = ?auto_24005 ?auto_24012 ) ) ( not ( = ?auto_24007 ?auto_24026 ) ) ( not ( = ?auto_24007 ?auto_24034 ) ) ( not ( = ?auto_24007 ?auto_24016 ) ) ( not ( = ?auto_24007 ?auto_24025 ) ) ( not ( = ?auto_24007 ?auto_24017 ) ) ( not ( = ?auto_24007 ?auto_24037 ) ) ( not ( = ?auto_24007 ?auto_24028 ) ) ( not ( = ?auto_24007 ?auto_24014 ) ) ( not ( = ?auto_24007 ?auto_24024 ) ) ( not ( = ?auto_24010 ?auto_24022 ) ) ( not ( = ?auto_24010 ?auto_24019 ) ) ( not ( = ?auto_24010 ?auto_24038 ) ) ( not ( = ?auto_24010 ?auto_24020 ) ) ( not ( = ?auto_24010 ?auto_24015 ) ) ( not ( = ?auto_24010 ?auto_24035 ) ) ( not ( = ?auto_24010 ?auto_24030 ) ) ( not ( = ?auto_24010 ?auto_24018 ) ) ( not ( = ?auto_24008 ?auto_24036 ) ) ( not ( = ?auto_24008 ?auto_24029 ) ) ( not ( = ?auto_24008 ?auto_24027 ) ) ( not ( = ?auto_24008 ?auto_24032 ) ) ( not ( = ?auto_24008 ?auto_24033 ) ) ( not ( = ?auto_24008 ?auto_24031 ) ) ( not ( = ?auto_24008 ?auto_24021 ) ) ( not ( = ?auto_24008 ?auto_24023 ) ) ( not ( = ?auto_24012 ?auto_24026 ) ) ( not ( = ?auto_24012 ?auto_24034 ) ) ( not ( = ?auto_24012 ?auto_24016 ) ) ( not ( = ?auto_24012 ?auto_24025 ) ) ( not ( = ?auto_24012 ?auto_24017 ) ) ( not ( = ?auto_24012 ?auto_24037 ) ) ( not ( = ?auto_24012 ?auto_24028 ) ) ( not ( = ?auto_24012 ?auto_24014 ) ) ( not ( = ?auto_24012 ?auto_24024 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23997 ?auto_23998 ?auto_23999 ?auto_24000 ?auto_24001 ?auto_24004 ?auto_24002 ?auto_24006 ?auto_24005 ?auto_24003 )
      ( MAKE-1CRATE ?auto_24003 ?auto_24007 )
      ( MAKE-10CRATE-VERIFY ?auto_23997 ?auto_23998 ?auto_23999 ?auto_24000 ?auto_24001 ?auto_24004 ?auto_24002 ?auto_24006 ?auto_24005 ?auto_24003 ?auto_24007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24041 - SURFACE
      ?auto_24042 - SURFACE
    )
    :vars
    (
      ?auto_24043 - HOIST
      ?auto_24044 - PLACE
      ?auto_24046 - PLACE
      ?auto_24047 - HOIST
      ?auto_24048 - SURFACE
      ?auto_24045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24043 ?auto_24044 ) ( SURFACE-AT ?auto_24041 ?auto_24044 ) ( CLEAR ?auto_24041 ) ( IS-CRATE ?auto_24042 ) ( AVAILABLE ?auto_24043 ) ( not ( = ?auto_24046 ?auto_24044 ) ) ( HOIST-AT ?auto_24047 ?auto_24046 ) ( AVAILABLE ?auto_24047 ) ( SURFACE-AT ?auto_24042 ?auto_24046 ) ( ON ?auto_24042 ?auto_24048 ) ( CLEAR ?auto_24042 ) ( TRUCK-AT ?auto_24045 ?auto_24044 ) ( not ( = ?auto_24041 ?auto_24042 ) ) ( not ( = ?auto_24041 ?auto_24048 ) ) ( not ( = ?auto_24042 ?auto_24048 ) ) ( not ( = ?auto_24043 ?auto_24047 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24045 ?auto_24044 ?auto_24046 )
      ( !LIFT ?auto_24047 ?auto_24042 ?auto_24048 ?auto_24046 )
      ( !LOAD ?auto_24047 ?auto_24042 ?auto_24045 ?auto_24046 )
      ( !DRIVE ?auto_24045 ?auto_24046 ?auto_24044 )
      ( !UNLOAD ?auto_24043 ?auto_24042 ?auto_24045 ?auto_24044 )
      ( !DROP ?auto_24043 ?auto_24042 ?auto_24041 ?auto_24044 )
      ( MAKE-1CRATE-VERIFY ?auto_24041 ?auto_24042 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24061 - SURFACE
      ?auto_24062 - SURFACE
      ?auto_24063 - SURFACE
      ?auto_24064 - SURFACE
      ?auto_24065 - SURFACE
      ?auto_24068 - SURFACE
      ?auto_24066 - SURFACE
      ?auto_24070 - SURFACE
      ?auto_24069 - SURFACE
      ?auto_24067 - SURFACE
      ?auto_24072 - SURFACE
      ?auto_24071 - SURFACE
    )
    :vars
    (
      ?auto_24075 - HOIST
      ?auto_24077 - PLACE
      ?auto_24078 - PLACE
      ?auto_24076 - HOIST
      ?auto_24073 - SURFACE
      ?auto_24093 - PLACE
      ?auto_24102 - HOIST
      ?auto_24081 - SURFACE
      ?auto_24103 - PLACE
      ?auto_24088 - HOIST
      ?auto_24100 - SURFACE
      ?auto_24083 - PLACE
      ?auto_24082 - HOIST
      ?auto_24087 - SURFACE
      ?auto_24095 - SURFACE
      ?auto_24092 - PLACE
      ?auto_24101 - HOIST
      ?auto_24096 - SURFACE
      ?auto_24105 - PLACE
      ?auto_24085 - HOIST
      ?auto_24086 - SURFACE
      ?auto_24104 - PLACE
      ?auto_24090 - HOIST
      ?auto_24106 - SURFACE
      ?auto_24091 - PLACE
      ?auto_24097 - HOIST
      ?auto_24079 - SURFACE
      ?auto_24094 - PLACE
      ?auto_24089 - HOIST
      ?auto_24084 - SURFACE
      ?auto_24098 - PLACE
      ?auto_24099 - HOIST
      ?auto_24080 - SURFACE
      ?auto_24074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24075 ?auto_24077 ) ( IS-CRATE ?auto_24071 ) ( not ( = ?auto_24078 ?auto_24077 ) ) ( HOIST-AT ?auto_24076 ?auto_24078 ) ( AVAILABLE ?auto_24076 ) ( SURFACE-AT ?auto_24071 ?auto_24078 ) ( ON ?auto_24071 ?auto_24073 ) ( CLEAR ?auto_24071 ) ( not ( = ?auto_24072 ?auto_24071 ) ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( not ( = ?auto_24071 ?auto_24073 ) ) ( not ( = ?auto_24075 ?auto_24076 ) ) ( IS-CRATE ?auto_24072 ) ( not ( = ?auto_24093 ?auto_24077 ) ) ( HOIST-AT ?auto_24102 ?auto_24093 ) ( AVAILABLE ?auto_24102 ) ( SURFACE-AT ?auto_24072 ?auto_24093 ) ( ON ?auto_24072 ?auto_24081 ) ( CLEAR ?auto_24072 ) ( not ( = ?auto_24067 ?auto_24072 ) ) ( not ( = ?auto_24067 ?auto_24081 ) ) ( not ( = ?auto_24072 ?auto_24081 ) ) ( not ( = ?auto_24075 ?auto_24102 ) ) ( IS-CRATE ?auto_24067 ) ( not ( = ?auto_24103 ?auto_24077 ) ) ( HOIST-AT ?auto_24088 ?auto_24103 ) ( AVAILABLE ?auto_24088 ) ( SURFACE-AT ?auto_24067 ?auto_24103 ) ( ON ?auto_24067 ?auto_24100 ) ( CLEAR ?auto_24067 ) ( not ( = ?auto_24069 ?auto_24067 ) ) ( not ( = ?auto_24069 ?auto_24100 ) ) ( not ( = ?auto_24067 ?auto_24100 ) ) ( not ( = ?auto_24075 ?auto_24088 ) ) ( IS-CRATE ?auto_24069 ) ( not ( = ?auto_24083 ?auto_24077 ) ) ( HOIST-AT ?auto_24082 ?auto_24083 ) ( SURFACE-AT ?auto_24069 ?auto_24083 ) ( ON ?auto_24069 ?auto_24087 ) ( CLEAR ?auto_24069 ) ( not ( = ?auto_24070 ?auto_24069 ) ) ( not ( = ?auto_24070 ?auto_24087 ) ) ( not ( = ?auto_24069 ?auto_24087 ) ) ( not ( = ?auto_24075 ?auto_24082 ) ) ( IS-CRATE ?auto_24070 ) ( AVAILABLE ?auto_24082 ) ( SURFACE-AT ?auto_24070 ?auto_24083 ) ( ON ?auto_24070 ?auto_24095 ) ( CLEAR ?auto_24070 ) ( not ( = ?auto_24066 ?auto_24070 ) ) ( not ( = ?auto_24066 ?auto_24095 ) ) ( not ( = ?auto_24070 ?auto_24095 ) ) ( IS-CRATE ?auto_24066 ) ( not ( = ?auto_24092 ?auto_24077 ) ) ( HOIST-AT ?auto_24101 ?auto_24092 ) ( AVAILABLE ?auto_24101 ) ( SURFACE-AT ?auto_24066 ?auto_24092 ) ( ON ?auto_24066 ?auto_24096 ) ( CLEAR ?auto_24066 ) ( not ( = ?auto_24068 ?auto_24066 ) ) ( not ( = ?auto_24068 ?auto_24096 ) ) ( not ( = ?auto_24066 ?auto_24096 ) ) ( not ( = ?auto_24075 ?auto_24101 ) ) ( IS-CRATE ?auto_24068 ) ( not ( = ?auto_24105 ?auto_24077 ) ) ( HOIST-AT ?auto_24085 ?auto_24105 ) ( AVAILABLE ?auto_24085 ) ( SURFACE-AT ?auto_24068 ?auto_24105 ) ( ON ?auto_24068 ?auto_24086 ) ( CLEAR ?auto_24068 ) ( not ( = ?auto_24065 ?auto_24068 ) ) ( not ( = ?auto_24065 ?auto_24086 ) ) ( not ( = ?auto_24068 ?auto_24086 ) ) ( not ( = ?auto_24075 ?auto_24085 ) ) ( IS-CRATE ?auto_24065 ) ( not ( = ?auto_24104 ?auto_24077 ) ) ( HOIST-AT ?auto_24090 ?auto_24104 ) ( AVAILABLE ?auto_24090 ) ( SURFACE-AT ?auto_24065 ?auto_24104 ) ( ON ?auto_24065 ?auto_24106 ) ( CLEAR ?auto_24065 ) ( not ( = ?auto_24064 ?auto_24065 ) ) ( not ( = ?auto_24064 ?auto_24106 ) ) ( not ( = ?auto_24065 ?auto_24106 ) ) ( not ( = ?auto_24075 ?auto_24090 ) ) ( IS-CRATE ?auto_24064 ) ( not ( = ?auto_24091 ?auto_24077 ) ) ( HOIST-AT ?auto_24097 ?auto_24091 ) ( AVAILABLE ?auto_24097 ) ( SURFACE-AT ?auto_24064 ?auto_24091 ) ( ON ?auto_24064 ?auto_24079 ) ( CLEAR ?auto_24064 ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24079 ) ) ( not ( = ?auto_24064 ?auto_24079 ) ) ( not ( = ?auto_24075 ?auto_24097 ) ) ( IS-CRATE ?auto_24063 ) ( not ( = ?auto_24094 ?auto_24077 ) ) ( HOIST-AT ?auto_24089 ?auto_24094 ) ( AVAILABLE ?auto_24089 ) ( SURFACE-AT ?auto_24063 ?auto_24094 ) ( ON ?auto_24063 ?auto_24084 ) ( CLEAR ?auto_24063 ) ( not ( = ?auto_24062 ?auto_24063 ) ) ( not ( = ?auto_24062 ?auto_24084 ) ) ( not ( = ?auto_24063 ?auto_24084 ) ) ( not ( = ?auto_24075 ?auto_24089 ) ) ( SURFACE-AT ?auto_24061 ?auto_24077 ) ( CLEAR ?auto_24061 ) ( IS-CRATE ?auto_24062 ) ( AVAILABLE ?auto_24075 ) ( not ( = ?auto_24098 ?auto_24077 ) ) ( HOIST-AT ?auto_24099 ?auto_24098 ) ( AVAILABLE ?auto_24099 ) ( SURFACE-AT ?auto_24062 ?auto_24098 ) ( ON ?auto_24062 ?auto_24080 ) ( CLEAR ?auto_24062 ) ( TRUCK-AT ?auto_24074 ?auto_24077 ) ( not ( = ?auto_24061 ?auto_24062 ) ) ( not ( = ?auto_24061 ?auto_24080 ) ) ( not ( = ?auto_24062 ?auto_24080 ) ) ( not ( = ?auto_24075 ?auto_24099 ) ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( not ( = ?auto_24061 ?auto_24084 ) ) ( not ( = ?auto_24063 ?auto_24080 ) ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24089 ?auto_24099 ) ) ( not ( = ?auto_24084 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24064 ) ) ( not ( = ?auto_24061 ?auto_24079 ) ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24079 ) ) ( not ( = ?auto_24064 ?auto_24084 ) ) ( not ( = ?auto_24064 ?auto_24080 ) ) ( not ( = ?auto_24091 ?auto_24094 ) ) ( not ( = ?auto_24091 ?auto_24098 ) ) ( not ( = ?auto_24097 ?auto_24089 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( not ( = ?auto_24079 ?auto_24084 ) ) ( not ( = ?auto_24079 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24065 ) ) ( not ( = ?auto_24061 ?auto_24106 ) ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( not ( = ?auto_24062 ?auto_24106 ) ) ( not ( = ?auto_24063 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24106 ) ) ( not ( = ?auto_24065 ?auto_24079 ) ) ( not ( = ?auto_24065 ?auto_24084 ) ) ( not ( = ?auto_24065 ?auto_24080 ) ) ( not ( = ?auto_24104 ?auto_24091 ) ) ( not ( = ?auto_24104 ?auto_24094 ) ) ( not ( = ?auto_24104 ?auto_24098 ) ) ( not ( = ?auto_24090 ?auto_24097 ) ) ( not ( = ?auto_24090 ?auto_24089 ) ) ( not ( = ?auto_24090 ?auto_24099 ) ) ( not ( = ?auto_24106 ?auto_24079 ) ) ( not ( = ?auto_24106 ?auto_24084 ) ) ( not ( = ?auto_24106 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24068 ) ) ( not ( = ?auto_24061 ?auto_24086 ) ) ( not ( = ?auto_24062 ?auto_24068 ) ) ( not ( = ?auto_24062 ?auto_24086 ) ) ( not ( = ?auto_24063 ?auto_24068 ) ) ( not ( = ?auto_24063 ?auto_24086 ) ) ( not ( = ?auto_24064 ?auto_24068 ) ) ( not ( = ?auto_24064 ?auto_24086 ) ) ( not ( = ?auto_24068 ?auto_24106 ) ) ( not ( = ?auto_24068 ?auto_24079 ) ) ( not ( = ?auto_24068 ?auto_24084 ) ) ( not ( = ?auto_24068 ?auto_24080 ) ) ( not ( = ?auto_24105 ?auto_24104 ) ) ( not ( = ?auto_24105 ?auto_24091 ) ) ( not ( = ?auto_24105 ?auto_24094 ) ) ( not ( = ?auto_24105 ?auto_24098 ) ) ( not ( = ?auto_24085 ?auto_24090 ) ) ( not ( = ?auto_24085 ?auto_24097 ) ) ( not ( = ?auto_24085 ?auto_24089 ) ) ( not ( = ?auto_24085 ?auto_24099 ) ) ( not ( = ?auto_24086 ?auto_24106 ) ) ( not ( = ?auto_24086 ?auto_24079 ) ) ( not ( = ?auto_24086 ?auto_24084 ) ) ( not ( = ?auto_24086 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24066 ) ) ( not ( = ?auto_24061 ?auto_24096 ) ) ( not ( = ?auto_24062 ?auto_24066 ) ) ( not ( = ?auto_24062 ?auto_24096 ) ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( not ( = ?auto_24063 ?auto_24096 ) ) ( not ( = ?auto_24064 ?auto_24066 ) ) ( not ( = ?auto_24064 ?auto_24096 ) ) ( not ( = ?auto_24065 ?auto_24066 ) ) ( not ( = ?auto_24065 ?auto_24096 ) ) ( not ( = ?auto_24066 ?auto_24086 ) ) ( not ( = ?auto_24066 ?auto_24106 ) ) ( not ( = ?auto_24066 ?auto_24079 ) ) ( not ( = ?auto_24066 ?auto_24084 ) ) ( not ( = ?auto_24066 ?auto_24080 ) ) ( not ( = ?auto_24092 ?auto_24105 ) ) ( not ( = ?auto_24092 ?auto_24104 ) ) ( not ( = ?auto_24092 ?auto_24091 ) ) ( not ( = ?auto_24092 ?auto_24094 ) ) ( not ( = ?auto_24092 ?auto_24098 ) ) ( not ( = ?auto_24101 ?auto_24085 ) ) ( not ( = ?auto_24101 ?auto_24090 ) ) ( not ( = ?auto_24101 ?auto_24097 ) ) ( not ( = ?auto_24101 ?auto_24089 ) ) ( not ( = ?auto_24101 ?auto_24099 ) ) ( not ( = ?auto_24096 ?auto_24086 ) ) ( not ( = ?auto_24096 ?auto_24106 ) ) ( not ( = ?auto_24096 ?auto_24079 ) ) ( not ( = ?auto_24096 ?auto_24084 ) ) ( not ( = ?auto_24096 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24070 ) ) ( not ( = ?auto_24061 ?auto_24095 ) ) ( not ( = ?auto_24062 ?auto_24070 ) ) ( not ( = ?auto_24062 ?auto_24095 ) ) ( not ( = ?auto_24063 ?auto_24070 ) ) ( not ( = ?auto_24063 ?auto_24095 ) ) ( not ( = ?auto_24064 ?auto_24070 ) ) ( not ( = ?auto_24064 ?auto_24095 ) ) ( not ( = ?auto_24065 ?auto_24070 ) ) ( not ( = ?auto_24065 ?auto_24095 ) ) ( not ( = ?auto_24068 ?auto_24070 ) ) ( not ( = ?auto_24068 ?auto_24095 ) ) ( not ( = ?auto_24070 ?auto_24096 ) ) ( not ( = ?auto_24070 ?auto_24086 ) ) ( not ( = ?auto_24070 ?auto_24106 ) ) ( not ( = ?auto_24070 ?auto_24079 ) ) ( not ( = ?auto_24070 ?auto_24084 ) ) ( not ( = ?auto_24070 ?auto_24080 ) ) ( not ( = ?auto_24083 ?auto_24092 ) ) ( not ( = ?auto_24083 ?auto_24105 ) ) ( not ( = ?auto_24083 ?auto_24104 ) ) ( not ( = ?auto_24083 ?auto_24091 ) ) ( not ( = ?auto_24083 ?auto_24094 ) ) ( not ( = ?auto_24083 ?auto_24098 ) ) ( not ( = ?auto_24082 ?auto_24101 ) ) ( not ( = ?auto_24082 ?auto_24085 ) ) ( not ( = ?auto_24082 ?auto_24090 ) ) ( not ( = ?auto_24082 ?auto_24097 ) ) ( not ( = ?auto_24082 ?auto_24089 ) ) ( not ( = ?auto_24082 ?auto_24099 ) ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24086 ) ) ( not ( = ?auto_24095 ?auto_24106 ) ) ( not ( = ?auto_24095 ?auto_24079 ) ) ( not ( = ?auto_24095 ?auto_24084 ) ) ( not ( = ?auto_24095 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24069 ) ) ( not ( = ?auto_24061 ?auto_24087 ) ) ( not ( = ?auto_24062 ?auto_24069 ) ) ( not ( = ?auto_24062 ?auto_24087 ) ) ( not ( = ?auto_24063 ?auto_24069 ) ) ( not ( = ?auto_24063 ?auto_24087 ) ) ( not ( = ?auto_24064 ?auto_24069 ) ) ( not ( = ?auto_24064 ?auto_24087 ) ) ( not ( = ?auto_24065 ?auto_24069 ) ) ( not ( = ?auto_24065 ?auto_24087 ) ) ( not ( = ?auto_24068 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24087 ) ) ( not ( = ?auto_24066 ?auto_24069 ) ) ( not ( = ?auto_24066 ?auto_24087 ) ) ( not ( = ?auto_24069 ?auto_24095 ) ) ( not ( = ?auto_24069 ?auto_24096 ) ) ( not ( = ?auto_24069 ?auto_24086 ) ) ( not ( = ?auto_24069 ?auto_24106 ) ) ( not ( = ?auto_24069 ?auto_24079 ) ) ( not ( = ?auto_24069 ?auto_24084 ) ) ( not ( = ?auto_24069 ?auto_24080 ) ) ( not ( = ?auto_24087 ?auto_24095 ) ) ( not ( = ?auto_24087 ?auto_24096 ) ) ( not ( = ?auto_24087 ?auto_24086 ) ) ( not ( = ?auto_24087 ?auto_24106 ) ) ( not ( = ?auto_24087 ?auto_24079 ) ) ( not ( = ?auto_24087 ?auto_24084 ) ) ( not ( = ?auto_24087 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24067 ) ) ( not ( = ?auto_24061 ?auto_24100 ) ) ( not ( = ?auto_24062 ?auto_24067 ) ) ( not ( = ?auto_24062 ?auto_24100 ) ) ( not ( = ?auto_24063 ?auto_24067 ) ) ( not ( = ?auto_24063 ?auto_24100 ) ) ( not ( = ?auto_24064 ?auto_24067 ) ) ( not ( = ?auto_24064 ?auto_24100 ) ) ( not ( = ?auto_24065 ?auto_24067 ) ) ( not ( = ?auto_24065 ?auto_24100 ) ) ( not ( = ?auto_24068 ?auto_24067 ) ) ( not ( = ?auto_24068 ?auto_24100 ) ) ( not ( = ?auto_24066 ?auto_24067 ) ) ( not ( = ?auto_24066 ?auto_24100 ) ) ( not ( = ?auto_24070 ?auto_24067 ) ) ( not ( = ?auto_24070 ?auto_24100 ) ) ( not ( = ?auto_24067 ?auto_24087 ) ) ( not ( = ?auto_24067 ?auto_24095 ) ) ( not ( = ?auto_24067 ?auto_24096 ) ) ( not ( = ?auto_24067 ?auto_24086 ) ) ( not ( = ?auto_24067 ?auto_24106 ) ) ( not ( = ?auto_24067 ?auto_24079 ) ) ( not ( = ?auto_24067 ?auto_24084 ) ) ( not ( = ?auto_24067 ?auto_24080 ) ) ( not ( = ?auto_24103 ?auto_24083 ) ) ( not ( = ?auto_24103 ?auto_24092 ) ) ( not ( = ?auto_24103 ?auto_24105 ) ) ( not ( = ?auto_24103 ?auto_24104 ) ) ( not ( = ?auto_24103 ?auto_24091 ) ) ( not ( = ?auto_24103 ?auto_24094 ) ) ( not ( = ?auto_24103 ?auto_24098 ) ) ( not ( = ?auto_24088 ?auto_24082 ) ) ( not ( = ?auto_24088 ?auto_24101 ) ) ( not ( = ?auto_24088 ?auto_24085 ) ) ( not ( = ?auto_24088 ?auto_24090 ) ) ( not ( = ?auto_24088 ?auto_24097 ) ) ( not ( = ?auto_24088 ?auto_24089 ) ) ( not ( = ?auto_24088 ?auto_24099 ) ) ( not ( = ?auto_24100 ?auto_24087 ) ) ( not ( = ?auto_24100 ?auto_24095 ) ) ( not ( = ?auto_24100 ?auto_24096 ) ) ( not ( = ?auto_24100 ?auto_24086 ) ) ( not ( = ?auto_24100 ?auto_24106 ) ) ( not ( = ?auto_24100 ?auto_24079 ) ) ( not ( = ?auto_24100 ?auto_24084 ) ) ( not ( = ?auto_24100 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24072 ) ) ( not ( = ?auto_24061 ?auto_24081 ) ) ( not ( = ?auto_24062 ?auto_24072 ) ) ( not ( = ?auto_24062 ?auto_24081 ) ) ( not ( = ?auto_24063 ?auto_24072 ) ) ( not ( = ?auto_24063 ?auto_24081 ) ) ( not ( = ?auto_24064 ?auto_24072 ) ) ( not ( = ?auto_24064 ?auto_24081 ) ) ( not ( = ?auto_24065 ?auto_24072 ) ) ( not ( = ?auto_24065 ?auto_24081 ) ) ( not ( = ?auto_24068 ?auto_24072 ) ) ( not ( = ?auto_24068 ?auto_24081 ) ) ( not ( = ?auto_24066 ?auto_24072 ) ) ( not ( = ?auto_24066 ?auto_24081 ) ) ( not ( = ?auto_24070 ?auto_24072 ) ) ( not ( = ?auto_24070 ?auto_24081 ) ) ( not ( = ?auto_24069 ?auto_24072 ) ) ( not ( = ?auto_24069 ?auto_24081 ) ) ( not ( = ?auto_24072 ?auto_24100 ) ) ( not ( = ?auto_24072 ?auto_24087 ) ) ( not ( = ?auto_24072 ?auto_24095 ) ) ( not ( = ?auto_24072 ?auto_24096 ) ) ( not ( = ?auto_24072 ?auto_24086 ) ) ( not ( = ?auto_24072 ?auto_24106 ) ) ( not ( = ?auto_24072 ?auto_24079 ) ) ( not ( = ?auto_24072 ?auto_24084 ) ) ( not ( = ?auto_24072 ?auto_24080 ) ) ( not ( = ?auto_24093 ?auto_24103 ) ) ( not ( = ?auto_24093 ?auto_24083 ) ) ( not ( = ?auto_24093 ?auto_24092 ) ) ( not ( = ?auto_24093 ?auto_24105 ) ) ( not ( = ?auto_24093 ?auto_24104 ) ) ( not ( = ?auto_24093 ?auto_24091 ) ) ( not ( = ?auto_24093 ?auto_24094 ) ) ( not ( = ?auto_24093 ?auto_24098 ) ) ( not ( = ?auto_24102 ?auto_24088 ) ) ( not ( = ?auto_24102 ?auto_24082 ) ) ( not ( = ?auto_24102 ?auto_24101 ) ) ( not ( = ?auto_24102 ?auto_24085 ) ) ( not ( = ?auto_24102 ?auto_24090 ) ) ( not ( = ?auto_24102 ?auto_24097 ) ) ( not ( = ?auto_24102 ?auto_24089 ) ) ( not ( = ?auto_24102 ?auto_24099 ) ) ( not ( = ?auto_24081 ?auto_24100 ) ) ( not ( = ?auto_24081 ?auto_24087 ) ) ( not ( = ?auto_24081 ?auto_24095 ) ) ( not ( = ?auto_24081 ?auto_24096 ) ) ( not ( = ?auto_24081 ?auto_24086 ) ) ( not ( = ?auto_24081 ?auto_24106 ) ) ( not ( = ?auto_24081 ?auto_24079 ) ) ( not ( = ?auto_24081 ?auto_24084 ) ) ( not ( = ?auto_24081 ?auto_24080 ) ) ( not ( = ?auto_24061 ?auto_24071 ) ) ( not ( = ?auto_24061 ?auto_24073 ) ) ( not ( = ?auto_24062 ?auto_24071 ) ) ( not ( = ?auto_24062 ?auto_24073 ) ) ( not ( = ?auto_24063 ?auto_24071 ) ) ( not ( = ?auto_24063 ?auto_24073 ) ) ( not ( = ?auto_24064 ?auto_24071 ) ) ( not ( = ?auto_24064 ?auto_24073 ) ) ( not ( = ?auto_24065 ?auto_24071 ) ) ( not ( = ?auto_24065 ?auto_24073 ) ) ( not ( = ?auto_24068 ?auto_24071 ) ) ( not ( = ?auto_24068 ?auto_24073 ) ) ( not ( = ?auto_24066 ?auto_24071 ) ) ( not ( = ?auto_24066 ?auto_24073 ) ) ( not ( = ?auto_24070 ?auto_24071 ) ) ( not ( = ?auto_24070 ?auto_24073 ) ) ( not ( = ?auto_24069 ?auto_24071 ) ) ( not ( = ?auto_24069 ?auto_24073 ) ) ( not ( = ?auto_24067 ?auto_24071 ) ) ( not ( = ?auto_24067 ?auto_24073 ) ) ( not ( = ?auto_24071 ?auto_24081 ) ) ( not ( = ?auto_24071 ?auto_24100 ) ) ( not ( = ?auto_24071 ?auto_24087 ) ) ( not ( = ?auto_24071 ?auto_24095 ) ) ( not ( = ?auto_24071 ?auto_24096 ) ) ( not ( = ?auto_24071 ?auto_24086 ) ) ( not ( = ?auto_24071 ?auto_24106 ) ) ( not ( = ?auto_24071 ?auto_24079 ) ) ( not ( = ?auto_24071 ?auto_24084 ) ) ( not ( = ?auto_24071 ?auto_24080 ) ) ( not ( = ?auto_24078 ?auto_24093 ) ) ( not ( = ?auto_24078 ?auto_24103 ) ) ( not ( = ?auto_24078 ?auto_24083 ) ) ( not ( = ?auto_24078 ?auto_24092 ) ) ( not ( = ?auto_24078 ?auto_24105 ) ) ( not ( = ?auto_24078 ?auto_24104 ) ) ( not ( = ?auto_24078 ?auto_24091 ) ) ( not ( = ?auto_24078 ?auto_24094 ) ) ( not ( = ?auto_24078 ?auto_24098 ) ) ( not ( = ?auto_24076 ?auto_24102 ) ) ( not ( = ?auto_24076 ?auto_24088 ) ) ( not ( = ?auto_24076 ?auto_24082 ) ) ( not ( = ?auto_24076 ?auto_24101 ) ) ( not ( = ?auto_24076 ?auto_24085 ) ) ( not ( = ?auto_24076 ?auto_24090 ) ) ( not ( = ?auto_24076 ?auto_24097 ) ) ( not ( = ?auto_24076 ?auto_24089 ) ) ( not ( = ?auto_24076 ?auto_24099 ) ) ( not ( = ?auto_24073 ?auto_24081 ) ) ( not ( = ?auto_24073 ?auto_24100 ) ) ( not ( = ?auto_24073 ?auto_24087 ) ) ( not ( = ?auto_24073 ?auto_24095 ) ) ( not ( = ?auto_24073 ?auto_24096 ) ) ( not ( = ?auto_24073 ?auto_24086 ) ) ( not ( = ?auto_24073 ?auto_24106 ) ) ( not ( = ?auto_24073 ?auto_24079 ) ) ( not ( = ?auto_24073 ?auto_24084 ) ) ( not ( = ?auto_24073 ?auto_24080 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24061 ?auto_24062 ?auto_24063 ?auto_24064 ?auto_24065 ?auto_24068 ?auto_24066 ?auto_24070 ?auto_24069 ?auto_24067 ?auto_24072 )
      ( MAKE-1CRATE ?auto_24072 ?auto_24071 )
      ( MAKE-11CRATE-VERIFY ?auto_24061 ?auto_24062 ?auto_24063 ?auto_24064 ?auto_24065 ?auto_24068 ?auto_24066 ?auto_24070 ?auto_24069 ?auto_24067 ?auto_24072 ?auto_24071 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24109 - SURFACE
      ?auto_24110 - SURFACE
    )
    :vars
    (
      ?auto_24111 - HOIST
      ?auto_24112 - PLACE
      ?auto_24114 - PLACE
      ?auto_24115 - HOIST
      ?auto_24116 - SURFACE
      ?auto_24113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24111 ?auto_24112 ) ( SURFACE-AT ?auto_24109 ?auto_24112 ) ( CLEAR ?auto_24109 ) ( IS-CRATE ?auto_24110 ) ( AVAILABLE ?auto_24111 ) ( not ( = ?auto_24114 ?auto_24112 ) ) ( HOIST-AT ?auto_24115 ?auto_24114 ) ( AVAILABLE ?auto_24115 ) ( SURFACE-AT ?auto_24110 ?auto_24114 ) ( ON ?auto_24110 ?auto_24116 ) ( CLEAR ?auto_24110 ) ( TRUCK-AT ?auto_24113 ?auto_24112 ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24116 ) ) ( not ( = ?auto_24110 ?auto_24116 ) ) ( not ( = ?auto_24111 ?auto_24115 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24113 ?auto_24112 ?auto_24114 )
      ( !LIFT ?auto_24115 ?auto_24110 ?auto_24116 ?auto_24114 )
      ( !LOAD ?auto_24115 ?auto_24110 ?auto_24113 ?auto_24114 )
      ( !DRIVE ?auto_24113 ?auto_24114 ?auto_24112 )
      ( !UNLOAD ?auto_24111 ?auto_24110 ?auto_24113 ?auto_24112 )
      ( !DROP ?auto_24111 ?auto_24110 ?auto_24109 ?auto_24112 )
      ( MAKE-1CRATE-VERIFY ?auto_24109 ?auto_24110 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_24130 - SURFACE
      ?auto_24131 - SURFACE
      ?auto_24132 - SURFACE
      ?auto_24133 - SURFACE
      ?auto_24134 - SURFACE
      ?auto_24137 - SURFACE
      ?auto_24135 - SURFACE
      ?auto_24139 - SURFACE
      ?auto_24138 - SURFACE
      ?auto_24136 - SURFACE
      ?auto_24141 - SURFACE
      ?auto_24140 - SURFACE
      ?auto_24142 - SURFACE
    )
    :vars
    (
      ?auto_24144 - HOIST
      ?auto_24148 - PLACE
      ?auto_24145 - PLACE
      ?auto_24146 - HOIST
      ?auto_24147 - SURFACE
      ?auto_24166 - PLACE
      ?auto_24152 - HOIST
      ?auto_24150 - SURFACE
      ?auto_24162 - PLACE
      ?auto_24177 - HOIST
      ?auto_24172 - SURFACE
      ?auto_24178 - PLACE
      ?auto_24151 - HOIST
      ?auto_24175 - SURFACE
      ?auto_24164 - PLACE
      ?auto_24154 - HOIST
      ?auto_24156 - SURFACE
      ?auto_24173 - SURFACE
      ?auto_24168 - PLACE
      ?auto_24170 - HOIST
      ?auto_24158 - SURFACE
      ?auto_24155 - PLACE
      ?auto_24157 - HOIST
      ?auto_24161 - SURFACE
      ?auto_24159 - PLACE
      ?auto_24169 - HOIST
      ?auto_24176 - SURFACE
      ?auto_24160 - PLACE
      ?auto_24171 - HOIST
      ?auto_24153 - SURFACE
      ?auto_24179 - PLACE
      ?auto_24149 - HOIST
      ?auto_24174 - SURFACE
      ?auto_24167 - PLACE
      ?auto_24163 - HOIST
      ?auto_24165 - SURFACE
      ?auto_24143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24144 ?auto_24148 ) ( IS-CRATE ?auto_24142 ) ( not ( = ?auto_24145 ?auto_24148 ) ) ( HOIST-AT ?auto_24146 ?auto_24145 ) ( AVAILABLE ?auto_24146 ) ( SURFACE-AT ?auto_24142 ?auto_24145 ) ( ON ?auto_24142 ?auto_24147 ) ( CLEAR ?auto_24142 ) ( not ( = ?auto_24140 ?auto_24142 ) ) ( not ( = ?auto_24140 ?auto_24147 ) ) ( not ( = ?auto_24142 ?auto_24147 ) ) ( not ( = ?auto_24144 ?auto_24146 ) ) ( IS-CRATE ?auto_24140 ) ( not ( = ?auto_24166 ?auto_24148 ) ) ( HOIST-AT ?auto_24152 ?auto_24166 ) ( AVAILABLE ?auto_24152 ) ( SURFACE-AT ?auto_24140 ?auto_24166 ) ( ON ?auto_24140 ?auto_24150 ) ( CLEAR ?auto_24140 ) ( not ( = ?auto_24141 ?auto_24140 ) ) ( not ( = ?auto_24141 ?auto_24150 ) ) ( not ( = ?auto_24140 ?auto_24150 ) ) ( not ( = ?auto_24144 ?auto_24152 ) ) ( IS-CRATE ?auto_24141 ) ( not ( = ?auto_24162 ?auto_24148 ) ) ( HOIST-AT ?auto_24177 ?auto_24162 ) ( AVAILABLE ?auto_24177 ) ( SURFACE-AT ?auto_24141 ?auto_24162 ) ( ON ?auto_24141 ?auto_24172 ) ( CLEAR ?auto_24141 ) ( not ( = ?auto_24136 ?auto_24141 ) ) ( not ( = ?auto_24136 ?auto_24172 ) ) ( not ( = ?auto_24141 ?auto_24172 ) ) ( not ( = ?auto_24144 ?auto_24177 ) ) ( IS-CRATE ?auto_24136 ) ( not ( = ?auto_24178 ?auto_24148 ) ) ( HOIST-AT ?auto_24151 ?auto_24178 ) ( AVAILABLE ?auto_24151 ) ( SURFACE-AT ?auto_24136 ?auto_24178 ) ( ON ?auto_24136 ?auto_24175 ) ( CLEAR ?auto_24136 ) ( not ( = ?auto_24138 ?auto_24136 ) ) ( not ( = ?auto_24138 ?auto_24175 ) ) ( not ( = ?auto_24136 ?auto_24175 ) ) ( not ( = ?auto_24144 ?auto_24151 ) ) ( IS-CRATE ?auto_24138 ) ( not ( = ?auto_24164 ?auto_24148 ) ) ( HOIST-AT ?auto_24154 ?auto_24164 ) ( SURFACE-AT ?auto_24138 ?auto_24164 ) ( ON ?auto_24138 ?auto_24156 ) ( CLEAR ?auto_24138 ) ( not ( = ?auto_24139 ?auto_24138 ) ) ( not ( = ?auto_24139 ?auto_24156 ) ) ( not ( = ?auto_24138 ?auto_24156 ) ) ( not ( = ?auto_24144 ?auto_24154 ) ) ( IS-CRATE ?auto_24139 ) ( AVAILABLE ?auto_24154 ) ( SURFACE-AT ?auto_24139 ?auto_24164 ) ( ON ?auto_24139 ?auto_24173 ) ( CLEAR ?auto_24139 ) ( not ( = ?auto_24135 ?auto_24139 ) ) ( not ( = ?auto_24135 ?auto_24173 ) ) ( not ( = ?auto_24139 ?auto_24173 ) ) ( IS-CRATE ?auto_24135 ) ( not ( = ?auto_24168 ?auto_24148 ) ) ( HOIST-AT ?auto_24170 ?auto_24168 ) ( AVAILABLE ?auto_24170 ) ( SURFACE-AT ?auto_24135 ?auto_24168 ) ( ON ?auto_24135 ?auto_24158 ) ( CLEAR ?auto_24135 ) ( not ( = ?auto_24137 ?auto_24135 ) ) ( not ( = ?auto_24137 ?auto_24158 ) ) ( not ( = ?auto_24135 ?auto_24158 ) ) ( not ( = ?auto_24144 ?auto_24170 ) ) ( IS-CRATE ?auto_24137 ) ( not ( = ?auto_24155 ?auto_24148 ) ) ( HOIST-AT ?auto_24157 ?auto_24155 ) ( AVAILABLE ?auto_24157 ) ( SURFACE-AT ?auto_24137 ?auto_24155 ) ( ON ?auto_24137 ?auto_24161 ) ( CLEAR ?auto_24137 ) ( not ( = ?auto_24134 ?auto_24137 ) ) ( not ( = ?auto_24134 ?auto_24161 ) ) ( not ( = ?auto_24137 ?auto_24161 ) ) ( not ( = ?auto_24144 ?auto_24157 ) ) ( IS-CRATE ?auto_24134 ) ( not ( = ?auto_24159 ?auto_24148 ) ) ( HOIST-AT ?auto_24169 ?auto_24159 ) ( AVAILABLE ?auto_24169 ) ( SURFACE-AT ?auto_24134 ?auto_24159 ) ( ON ?auto_24134 ?auto_24176 ) ( CLEAR ?auto_24134 ) ( not ( = ?auto_24133 ?auto_24134 ) ) ( not ( = ?auto_24133 ?auto_24176 ) ) ( not ( = ?auto_24134 ?auto_24176 ) ) ( not ( = ?auto_24144 ?auto_24169 ) ) ( IS-CRATE ?auto_24133 ) ( not ( = ?auto_24160 ?auto_24148 ) ) ( HOIST-AT ?auto_24171 ?auto_24160 ) ( AVAILABLE ?auto_24171 ) ( SURFACE-AT ?auto_24133 ?auto_24160 ) ( ON ?auto_24133 ?auto_24153 ) ( CLEAR ?auto_24133 ) ( not ( = ?auto_24132 ?auto_24133 ) ) ( not ( = ?auto_24132 ?auto_24153 ) ) ( not ( = ?auto_24133 ?auto_24153 ) ) ( not ( = ?auto_24144 ?auto_24171 ) ) ( IS-CRATE ?auto_24132 ) ( not ( = ?auto_24179 ?auto_24148 ) ) ( HOIST-AT ?auto_24149 ?auto_24179 ) ( AVAILABLE ?auto_24149 ) ( SURFACE-AT ?auto_24132 ?auto_24179 ) ( ON ?auto_24132 ?auto_24174 ) ( CLEAR ?auto_24132 ) ( not ( = ?auto_24131 ?auto_24132 ) ) ( not ( = ?auto_24131 ?auto_24174 ) ) ( not ( = ?auto_24132 ?auto_24174 ) ) ( not ( = ?auto_24144 ?auto_24149 ) ) ( SURFACE-AT ?auto_24130 ?auto_24148 ) ( CLEAR ?auto_24130 ) ( IS-CRATE ?auto_24131 ) ( AVAILABLE ?auto_24144 ) ( not ( = ?auto_24167 ?auto_24148 ) ) ( HOIST-AT ?auto_24163 ?auto_24167 ) ( AVAILABLE ?auto_24163 ) ( SURFACE-AT ?auto_24131 ?auto_24167 ) ( ON ?auto_24131 ?auto_24165 ) ( CLEAR ?auto_24131 ) ( TRUCK-AT ?auto_24143 ?auto_24148 ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24130 ?auto_24165 ) ) ( not ( = ?auto_24131 ?auto_24165 ) ) ( not ( = ?auto_24144 ?auto_24163 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24174 ) ) ( not ( = ?auto_24132 ?auto_24165 ) ) ( not ( = ?auto_24179 ?auto_24167 ) ) ( not ( = ?auto_24149 ?auto_24163 ) ) ( not ( = ?auto_24174 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24133 ) ) ( not ( = ?auto_24130 ?auto_24153 ) ) ( not ( = ?auto_24131 ?auto_24133 ) ) ( not ( = ?auto_24131 ?auto_24153 ) ) ( not ( = ?auto_24133 ?auto_24174 ) ) ( not ( = ?auto_24133 ?auto_24165 ) ) ( not ( = ?auto_24160 ?auto_24179 ) ) ( not ( = ?auto_24160 ?auto_24167 ) ) ( not ( = ?auto_24171 ?auto_24149 ) ) ( not ( = ?auto_24171 ?auto_24163 ) ) ( not ( = ?auto_24153 ?auto_24174 ) ) ( not ( = ?auto_24153 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24134 ) ) ( not ( = ?auto_24130 ?auto_24176 ) ) ( not ( = ?auto_24131 ?auto_24134 ) ) ( not ( = ?auto_24131 ?auto_24176 ) ) ( not ( = ?auto_24132 ?auto_24134 ) ) ( not ( = ?auto_24132 ?auto_24176 ) ) ( not ( = ?auto_24134 ?auto_24153 ) ) ( not ( = ?auto_24134 ?auto_24174 ) ) ( not ( = ?auto_24134 ?auto_24165 ) ) ( not ( = ?auto_24159 ?auto_24160 ) ) ( not ( = ?auto_24159 ?auto_24179 ) ) ( not ( = ?auto_24159 ?auto_24167 ) ) ( not ( = ?auto_24169 ?auto_24171 ) ) ( not ( = ?auto_24169 ?auto_24149 ) ) ( not ( = ?auto_24169 ?auto_24163 ) ) ( not ( = ?auto_24176 ?auto_24153 ) ) ( not ( = ?auto_24176 ?auto_24174 ) ) ( not ( = ?auto_24176 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24137 ) ) ( not ( = ?auto_24130 ?auto_24161 ) ) ( not ( = ?auto_24131 ?auto_24137 ) ) ( not ( = ?auto_24131 ?auto_24161 ) ) ( not ( = ?auto_24132 ?auto_24137 ) ) ( not ( = ?auto_24132 ?auto_24161 ) ) ( not ( = ?auto_24133 ?auto_24137 ) ) ( not ( = ?auto_24133 ?auto_24161 ) ) ( not ( = ?auto_24137 ?auto_24176 ) ) ( not ( = ?auto_24137 ?auto_24153 ) ) ( not ( = ?auto_24137 ?auto_24174 ) ) ( not ( = ?auto_24137 ?auto_24165 ) ) ( not ( = ?auto_24155 ?auto_24159 ) ) ( not ( = ?auto_24155 ?auto_24160 ) ) ( not ( = ?auto_24155 ?auto_24179 ) ) ( not ( = ?auto_24155 ?auto_24167 ) ) ( not ( = ?auto_24157 ?auto_24169 ) ) ( not ( = ?auto_24157 ?auto_24171 ) ) ( not ( = ?auto_24157 ?auto_24149 ) ) ( not ( = ?auto_24157 ?auto_24163 ) ) ( not ( = ?auto_24161 ?auto_24176 ) ) ( not ( = ?auto_24161 ?auto_24153 ) ) ( not ( = ?auto_24161 ?auto_24174 ) ) ( not ( = ?auto_24161 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24135 ) ) ( not ( = ?auto_24130 ?auto_24158 ) ) ( not ( = ?auto_24131 ?auto_24135 ) ) ( not ( = ?auto_24131 ?auto_24158 ) ) ( not ( = ?auto_24132 ?auto_24135 ) ) ( not ( = ?auto_24132 ?auto_24158 ) ) ( not ( = ?auto_24133 ?auto_24135 ) ) ( not ( = ?auto_24133 ?auto_24158 ) ) ( not ( = ?auto_24134 ?auto_24135 ) ) ( not ( = ?auto_24134 ?auto_24158 ) ) ( not ( = ?auto_24135 ?auto_24161 ) ) ( not ( = ?auto_24135 ?auto_24176 ) ) ( not ( = ?auto_24135 ?auto_24153 ) ) ( not ( = ?auto_24135 ?auto_24174 ) ) ( not ( = ?auto_24135 ?auto_24165 ) ) ( not ( = ?auto_24168 ?auto_24155 ) ) ( not ( = ?auto_24168 ?auto_24159 ) ) ( not ( = ?auto_24168 ?auto_24160 ) ) ( not ( = ?auto_24168 ?auto_24179 ) ) ( not ( = ?auto_24168 ?auto_24167 ) ) ( not ( = ?auto_24170 ?auto_24157 ) ) ( not ( = ?auto_24170 ?auto_24169 ) ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24149 ) ) ( not ( = ?auto_24170 ?auto_24163 ) ) ( not ( = ?auto_24158 ?auto_24161 ) ) ( not ( = ?auto_24158 ?auto_24176 ) ) ( not ( = ?auto_24158 ?auto_24153 ) ) ( not ( = ?auto_24158 ?auto_24174 ) ) ( not ( = ?auto_24158 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24139 ) ) ( not ( = ?auto_24130 ?auto_24173 ) ) ( not ( = ?auto_24131 ?auto_24139 ) ) ( not ( = ?auto_24131 ?auto_24173 ) ) ( not ( = ?auto_24132 ?auto_24139 ) ) ( not ( = ?auto_24132 ?auto_24173 ) ) ( not ( = ?auto_24133 ?auto_24139 ) ) ( not ( = ?auto_24133 ?auto_24173 ) ) ( not ( = ?auto_24134 ?auto_24139 ) ) ( not ( = ?auto_24134 ?auto_24173 ) ) ( not ( = ?auto_24137 ?auto_24139 ) ) ( not ( = ?auto_24137 ?auto_24173 ) ) ( not ( = ?auto_24139 ?auto_24158 ) ) ( not ( = ?auto_24139 ?auto_24161 ) ) ( not ( = ?auto_24139 ?auto_24176 ) ) ( not ( = ?auto_24139 ?auto_24153 ) ) ( not ( = ?auto_24139 ?auto_24174 ) ) ( not ( = ?auto_24139 ?auto_24165 ) ) ( not ( = ?auto_24164 ?auto_24168 ) ) ( not ( = ?auto_24164 ?auto_24155 ) ) ( not ( = ?auto_24164 ?auto_24159 ) ) ( not ( = ?auto_24164 ?auto_24160 ) ) ( not ( = ?auto_24164 ?auto_24179 ) ) ( not ( = ?auto_24164 ?auto_24167 ) ) ( not ( = ?auto_24154 ?auto_24170 ) ) ( not ( = ?auto_24154 ?auto_24157 ) ) ( not ( = ?auto_24154 ?auto_24169 ) ) ( not ( = ?auto_24154 ?auto_24171 ) ) ( not ( = ?auto_24154 ?auto_24149 ) ) ( not ( = ?auto_24154 ?auto_24163 ) ) ( not ( = ?auto_24173 ?auto_24158 ) ) ( not ( = ?auto_24173 ?auto_24161 ) ) ( not ( = ?auto_24173 ?auto_24176 ) ) ( not ( = ?auto_24173 ?auto_24153 ) ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( not ( = ?auto_24173 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24138 ) ) ( not ( = ?auto_24130 ?auto_24156 ) ) ( not ( = ?auto_24131 ?auto_24138 ) ) ( not ( = ?auto_24131 ?auto_24156 ) ) ( not ( = ?auto_24132 ?auto_24138 ) ) ( not ( = ?auto_24132 ?auto_24156 ) ) ( not ( = ?auto_24133 ?auto_24138 ) ) ( not ( = ?auto_24133 ?auto_24156 ) ) ( not ( = ?auto_24134 ?auto_24138 ) ) ( not ( = ?auto_24134 ?auto_24156 ) ) ( not ( = ?auto_24137 ?auto_24138 ) ) ( not ( = ?auto_24137 ?auto_24156 ) ) ( not ( = ?auto_24135 ?auto_24138 ) ) ( not ( = ?auto_24135 ?auto_24156 ) ) ( not ( = ?auto_24138 ?auto_24173 ) ) ( not ( = ?auto_24138 ?auto_24158 ) ) ( not ( = ?auto_24138 ?auto_24161 ) ) ( not ( = ?auto_24138 ?auto_24176 ) ) ( not ( = ?auto_24138 ?auto_24153 ) ) ( not ( = ?auto_24138 ?auto_24174 ) ) ( not ( = ?auto_24138 ?auto_24165 ) ) ( not ( = ?auto_24156 ?auto_24173 ) ) ( not ( = ?auto_24156 ?auto_24158 ) ) ( not ( = ?auto_24156 ?auto_24161 ) ) ( not ( = ?auto_24156 ?auto_24176 ) ) ( not ( = ?auto_24156 ?auto_24153 ) ) ( not ( = ?auto_24156 ?auto_24174 ) ) ( not ( = ?auto_24156 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24136 ) ) ( not ( = ?auto_24130 ?auto_24175 ) ) ( not ( = ?auto_24131 ?auto_24136 ) ) ( not ( = ?auto_24131 ?auto_24175 ) ) ( not ( = ?auto_24132 ?auto_24136 ) ) ( not ( = ?auto_24132 ?auto_24175 ) ) ( not ( = ?auto_24133 ?auto_24136 ) ) ( not ( = ?auto_24133 ?auto_24175 ) ) ( not ( = ?auto_24134 ?auto_24136 ) ) ( not ( = ?auto_24134 ?auto_24175 ) ) ( not ( = ?auto_24137 ?auto_24136 ) ) ( not ( = ?auto_24137 ?auto_24175 ) ) ( not ( = ?auto_24135 ?auto_24136 ) ) ( not ( = ?auto_24135 ?auto_24175 ) ) ( not ( = ?auto_24139 ?auto_24136 ) ) ( not ( = ?auto_24139 ?auto_24175 ) ) ( not ( = ?auto_24136 ?auto_24156 ) ) ( not ( = ?auto_24136 ?auto_24173 ) ) ( not ( = ?auto_24136 ?auto_24158 ) ) ( not ( = ?auto_24136 ?auto_24161 ) ) ( not ( = ?auto_24136 ?auto_24176 ) ) ( not ( = ?auto_24136 ?auto_24153 ) ) ( not ( = ?auto_24136 ?auto_24174 ) ) ( not ( = ?auto_24136 ?auto_24165 ) ) ( not ( = ?auto_24178 ?auto_24164 ) ) ( not ( = ?auto_24178 ?auto_24168 ) ) ( not ( = ?auto_24178 ?auto_24155 ) ) ( not ( = ?auto_24178 ?auto_24159 ) ) ( not ( = ?auto_24178 ?auto_24160 ) ) ( not ( = ?auto_24178 ?auto_24179 ) ) ( not ( = ?auto_24178 ?auto_24167 ) ) ( not ( = ?auto_24151 ?auto_24154 ) ) ( not ( = ?auto_24151 ?auto_24170 ) ) ( not ( = ?auto_24151 ?auto_24157 ) ) ( not ( = ?auto_24151 ?auto_24169 ) ) ( not ( = ?auto_24151 ?auto_24171 ) ) ( not ( = ?auto_24151 ?auto_24149 ) ) ( not ( = ?auto_24151 ?auto_24163 ) ) ( not ( = ?auto_24175 ?auto_24156 ) ) ( not ( = ?auto_24175 ?auto_24173 ) ) ( not ( = ?auto_24175 ?auto_24158 ) ) ( not ( = ?auto_24175 ?auto_24161 ) ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24175 ?auto_24153 ) ) ( not ( = ?auto_24175 ?auto_24174 ) ) ( not ( = ?auto_24175 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24141 ) ) ( not ( = ?auto_24130 ?auto_24172 ) ) ( not ( = ?auto_24131 ?auto_24141 ) ) ( not ( = ?auto_24131 ?auto_24172 ) ) ( not ( = ?auto_24132 ?auto_24141 ) ) ( not ( = ?auto_24132 ?auto_24172 ) ) ( not ( = ?auto_24133 ?auto_24141 ) ) ( not ( = ?auto_24133 ?auto_24172 ) ) ( not ( = ?auto_24134 ?auto_24141 ) ) ( not ( = ?auto_24134 ?auto_24172 ) ) ( not ( = ?auto_24137 ?auto_24141 ) ) ( not ( = ?auto_24137 ?auto_24172 ) ) ( not ( = ?auto_24135 ?auto_24141 ) ) ( not ( = ?auto_24135 ?auto_24172 ) ) ( not ( = ?auto_24139 ?auto_24141 ) ) ( not ( = ?auto_24139 ?auto_24172 ) ) ( not ( = ?auto_24138 ?auto_24141 ) ) ( not ( = ?auto_24138 ?auto_24172 ) ) ( not ( = ?auto_24141 ?auto_24175 ) ) ( not ( = ?auto_24141 ?auto_24156 ) ) ( not ( = ?auto_24141 ?auto_24173 ) ) ( not ( = ?auto_24141 ?auto_24158 ) ) ( not ( = ?auto_24141 ?auto_24161 ) ) ( not ( = ?auto_24141 ?auto_24176 ) ) ( not ( = ?auto_24141 ?auto_24153 ) ) ( not ( = ?auto_24141 ?auto_24174 ) ) ( not ( = ?auto_24141 ?auto_24165 ) ) ( not ( = ?auto_24162 ?auto_24178 ) ) ( not ( = ?auto_24162 ?auto_24164 ) ) ( not ( = ?auto_24162 ?auto_24168 ) ) ( not ( = ?auto_24162 ?auto_24155 ) ) ( not ( = ?auto_24162 ?auto_24159 ) ) ( not ( = ?auto_24162 ?auto_24160 ) ) ( not ( = ?auto_24162 ?auto_24179 ) ) ( not ( = ?auto_24162 ?auto_24167 ) ) ( not ( = ?auto_24177 ?auto_24151 ) ) ( not ( = ?auto_24177 ?auto_24154 ) ) ( not ( = ?auto_24177 ?auto_24170 ) ) ( not ( = ?auto_24177 ?auto_24157 ) ) ( not ( = ?auto_24177 ?auto_24169 ) ) ( not ( = ?auto_24177 ?auto_24171 ) ) ( not ( = ?auto_24177 ?auto_24149 ) ) ( not ( = ?auto_24177 ?auto_24163 ) ) ( not ( = ?auto_24172 ?auto_24175 ) ) ( not ( = ?auto_24172 ?auto_24156 ) ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24158 ) ) ( not ( = ?auto_24172 ?auto_24161 ) ) ( not ( = ?auto_24172 ?auto_24176 ) ) ( not ( = ?auto_24172 ?auto_24153 ) ) ( not ( = ?auto_24172 ?auto_24174 ) ) ( not ( = ?auto_24172 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24140 ) ) ( not ( = ?auto_24130 ?auto_24150 ) ) ( not ( = ?auto_24131 ?auto_24140 ) ) ( not ( = ?auto_24131 ?auto_24150 ) ) ( not ( = ?auto_24132 ?auto_24140 ) ) ( not ( = ?auto_24132 ?auto_24150 ) ) ( not ( = ?auto_24133 ?auto_24140 ) ) ( not ( = ?auto_24133 ?auto_24150 ) ) ( not ( = ?auto_24134 ?auto_24140 ) ) ( not ( = ?auto_24134 ?auto_24150 ) ) ( not ( = ?auto_24137 ?auto_24140 ) ) ( not ( = ?auto_24137 ?auto_24150 ) ) ( not ( = ?auto_24135 ?auto_24140 ) ) ( not ( = ?auto_24135 ?auto_24150 ) ) ( not ( = ?auto_24139 ?auto_24140 ) ) ( not ( = ?auto_24139 ?auto_24150 ) ) ( not ( = ?auto_24138 ?auto_24140 ) ) ( not ( = ?auto_24138 ?auto_24150 ) ) ( not ( = ?auto_24136 ?auto_24140 ) ) ( not ( = ?auto_24136 ?auto_24150 ) ) ( not ( = ?auto_24140 ?auto_24172 ) ) ( not ( = ?auto_24140 ?auto_24175 ) ) ( not ( = ?auto_24140 ?auto_24156 ) ) ( not ( = ?auto_24140 ?auto_24173 ) ) ( not ( = ?auto_24140 ?auto_24158 ) ) ( not ( = ?auto_24140 ?auto_24161 ) ) ( not ( = ?auto_24140 ?auto_24176 ) ) ( not ( = ?auto_24140 ?auto_24153 ) ) ( not ( = ?auto_24140 ?auto_24174 ) ) ( not ( = ?auto_24140 ?auto_24165 ) ) ( not ( = ?auto_24166 ?auto_24162 ) ) ( not ( = ?auto_24166 ?auto_24178 ) ) ( not ( = ?auto_24166 ?auto_24164 ) ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24166 ?auto_24155 ) ) ( not ( = ?auto_24166 ?auto_24159 ) ) ( not ( = ?auto_24166 ?auto_24160 ) ) ( not ( = ?auto_24166 ?auto_24179 ) ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( not ( = ?auto_24152 ?auto_24177 ) ) ( not ( = ?auto_24152 ?auto_24151 ) ) ( not ( = ?auto_24152 ?auto_24154 ) ) ( not ( = ?auto_24152 ?auto_24170 ) ) ( not ( = ?auto_24152 ?auto_24157 ) ) ( not ( = ?auto_24152 ?auto_24169 ) ) ( not ( = ?auto_24152 ?auto_24171 ) ) ( not ( = ?auto_24152 ?auto_24149 ) ) ( not ( = ?auto_24152 ?auto_24163 ) ) ( not ( = ?auto_24150 ?auto_24172 ) ) ( not ( = ?auto_24150 ?auto_24175 ) ) ( not ( = ?auto_24150 ?auto_24156 ) ) ( not ( = ?auto_24150 ?auto_24173 ) ) ( not ( = ?auto_24150 ?auto_24158 ) ) ( not ( = ?auto_24150 ?auto_24161 ) ) ( not ( = ?auto_24150 ?auto_24176 ) ) ( not ( = ?auto_24150 ?auto_24153 ) ) ( not ( = ?auto_24150 ?auto_24174 ) ) ( not ( = ?auto_24150 ?auto_24165 ) ) ( not ( = ?auto_24130 ?auto_24142 ) ) ( not ( = ?auto_24130 ?auto_24147 ) ) ( not ( = ?auto_24131 ?auto_24142 ) ) ( not ( = ?auto_24131 ?auto_24147 ) ) ( not ( = ?auto_24132 ?auto_24142 ) ) ( not ( = ?auto_24132 ?auto_24147 ) ) ( not ( = ?auto_24133 ?auto_24142 ) ) ( not ( = ?auto_24133 ?auto_24147 ) ) ( not ( = ?auto_24134 ?auto_24142 ) ) ( not ( = ?auto_24134 ?auto_24147 ) ) ( not ( = ?auto_24137 ?auto_24142 ) ) ( not ( = ?auto_24137 ?auto_24147 ) ) ( not ( = ?auto_24135 ?auto_24142 ) ) ( not ( = ?auto_24135 ?auto_24147 ) ) ( not ( = ?auto_24139 ?auto_24142 ) ) ( not ( = ?auto_24139 ?auto_24147 ) ) ( not ( = ?auto_24138 ?auto_24142 ) ) ( not ( = ?auto_24138 ?auto_24147 ) ) ( not ( = ?auto_24136 ?auto_24142 ) ) ( not ( = ?auto_24136 ?auto_24147 ) ) ( not ( = ?auto_24141 ?auto_24142 ) ) ( not ( = ?auto_24141 ?auto_24147 ) ) ( not ( = ?auto_24142 ?auto_24150 ) ) ( not ( = ?auto_24142 ?auto_24172 ) ) ( not ( = ?auto_24142 ?auto_24175 ) ) ( not ( = ?auto_24142 ?auto_24156 ) ) ( not ( = ?auto_24142 ?auto_24173 ) ) ( not ( = ?auto_24142 ?auto_24158 ) ) ( not ( = ?auto_24142 ?auto_24161 ) ) ( not ( = ?auto_24142 ?auto_24176 ) ) ( not ( = ?auto_24142 ?auto_24153 ) ) ( not ( = ?auto_24142 ?auto_24174 ) ) ( not ( = ?auto_24142 ?auto_24165 ) ) ( not ( = ?auto_24145 ?auto_24166 ) ) ( not ( = ?auto_24145 ?auto_24162 ) ) ( not ( = ?auto_24145 ?auto_24178 ) ) ( not ( = ?auto_24145 ?auto_24164 ) ) ( not ( = ?auto_24145 ?auto_24168 ) ) ( not ( = ?auto_24145 ?auto_24155 ) ) ( not ( = ?auto_24145 ?auto_24159 ) ) ( not ( = ?auto_24145 ?auto_24160 ) ) ( not ( = ?auto_24145 ?auto_24179 ) ) ( not ( = ?auto_24145 ?auto_24167 ) ) ( not ( = ?auto_24146 ?auto_24152 ) ) ( not ( = ?auto_24146 ?auto_24177 ) ) ( not ( = ?auto_24146 ?auto_24151 ) ) ( not ( = ?auto_24146 ?auto_24154 ) ) ( not ( = ?auto_24146 ?auto_24170 ) ) ( not ( = ?auto_24146 ?auto_24157 ) ) ( not ( = ?auto_24146 ?auto_24169 ) ) ( not ( = ?auto_24146 ?auto_24171 ) ) ( not ( = ?auto_24146 ?auto_24149 ) ) ( not ( = ?auto_24146 ?auto_24163 ) ) ( not ( = ?auto_24147 ?auto_24150 ) ) ( not ( = ?auto_24147 ?auto_24172 ) ) ( not ( = ?auto_24147 ?auto_24175 ) ) ( not ( = ?auto_24147 ?auto_24156 ) ) ( not ( = ?auto_24147 ?auto_24173 ) ) ( not ( = ?auto_24147 ?auto_24158 ) ) ( not ( = ?auto_24147 ?auto_24161 ) ) ( not ( = ?auto_24147 ?auto_24176 ) ) ( not ( = ?auto_24147 ?auto_24153 ) ) ( not ( = ?auto_24147 ?auto_24174 ) ) ( not ( = ?auto_24147 ?auto_24165 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24130 ?auto_24131 ?auto_24132 ?auto_24133 ?auto_24134 ?auto_24137 ?auto_24135 ?auto_24139 ?auto_24138 ?auto_24136 ?auto_24141 ?auto_24140 )
      ( MAKE-1CRATE ?auto_24140 ?auto_24142 )
      ( MAKE-12CRATE-VERIFY ?auto_24130 ?auto_24131 ?auto_24132 ?auto_24133 ?auto_24134 ?auto_24137 ?auto_24135 ?auto_24139 ?auto_24138 ?auto_24136 ?auto_24141 ?auto_24140 ?auto_24142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24182 - SURFACE
      ?auto_24183 - SURFACE
    )
    :vars
    (
      ?auto_24184 - HOIST
      ?auto_24185 - PLACE
      ?auto_24187 - PLACE
      ?auto_24188 - HOIST
      ?auto_24189 - SURFACE
      ?auto_24186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24184 ?auto_24185 ) ( SURFACE-AT ?auto_24182 ?auto_24185 ) ( CLEAR ?auto_24182 ) ( IS-CRATE ?auto_24183 ) ( AVAILABLE ?auto_24184 ) ( not ( = ?auto_24187 ?auto_24185 ) ) ( HOIST-AT ?auto_24188 ?auto_24187 ) ( AVAILABLE ?auto_24188 ) ( SURFACE-AT ?auto_24183 ?auto_24187 ) ( ON ?auto_24183 ?auto_24189 ) ( CLEAR ?auto_24183 ) ( TRUCK-AT ?auto_24186 ?auto_24185 ) ( not ( = ?auto_24182 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24189 ) ) ( not ( = ?auto_24183 ?auto_24189 ) ) ( not ( = ?auto_24184 ?auto_24188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24186 ?auto_24185 ?auto_24187 )
      ( !LIFT ?auto_24188 ?auto_24183 ?auto_24189 ?auto_24187 )
      ( !LOAD ?auto_24188 ?auto_24183 ?auto_24186 ?auto_24187 )
      ( !DRIVE ?auto_24186 ?auto_24187 ?auto_24185 )
      ( !UNLOAD ?auto_24184 ?auto_24183 ?auto_24186 ?auto_24185 )
      ( !DROP ?auto_24184 ?auto_24183 ?auto_24182 ?auto_24185 )
      ( MAKE-1CRATE-VERIFY ?auto_24182 ?auto_24183 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_24204 - SURFACE
      ?auto_24205 - SURFACE
      ?auto_24206 - SURFACE
      ?auto_24207 - SURFACE
      ?auto_24208 - SURFACE
      ?auto_24211 - SURFACE
      ?auto_24209 - SURFACE
      ?auto_24213 - SURFACE
      ?auto_24212 - SURFACE
      ?auto_24210 - SURFACE
      ?auto_24215 - SURFACE
      ?auto_24214 - SURFACE
      ?auto_24216 - SURFACE
      ?auto_24217 - SURFACE
    )
    :vars
    (
      ?auto_24219 - HOIST
      ?auto_24220 - PLACE
      ?auto_24218 - PLACE
      ?auto_24222 - HOIST
      ?auto_24223 - SURFACE
      ?auto_24239 - PLACE
      ?auto_24252 - HOIST
      ?auto_24232 - SURFACE
      ?auto_24227 - PLACE
      ?auto_24253 - HOIST
      ?auto_24249 - SURFACE
      ?auto_24231 - PLACE
      ?auto_24245 - HOIST
      ?auto_24233 - SURFACE
      ?auto_24243 - PLACE
      ?auto_24254 - HOIST
      ?auto_24236 - SURFACE
      ?auto_24248 - PLACE
      ?auto_24255 - HOIST
      ?auto_24238 - SURFACE
      ?auto_24250 - SURFACE
      ?auto_24235 - PLACE
      ?auto_24257 - HOIST
      ?auto_24256 - SURFACE
      ?auto_24225 - PLACE
      ?auto_24247 - HOIST
      ?auto_24234 - SURFACE
      ?auto_24251 - PLACE
      ?auto_24246 - HOIST
      ?auto_24224 - SURFACE
      ?auto_24242 - PLACE
      ?auto_24228 - HOIST
      ?auto_24241 - SURFACE
      ?auto_24244 - PLACE
      ?auto_24226 - HOIST
      ?auto_24237 - SURFACE
      ?auto_24230 - PLACE
      ?auto_24229 - HOIST
      ?auto_24240 - SURFACE
      ?auto_24221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24219 ?auto_24220 ) ( IS-CRATE ?auto_24217 ) ( not ( = ?auto_24218 ?auto_24220 ) ) ( HOIST-AT ?auto_24222 ?auto_24218 ) ( AVAILABLE ?auto_24222 ) ( SURFACE-AT ?auto_24217 ?auto_24218 ) ( ON ?auto_24217 ?auto_24223 ) ( CLEAR ?auto_24217 ) ( not ( = ?auto_24216 ?auto_24217 ) ) ( not ( = ?auto_24216 ?auto_24223 ) ) ( not ( = ?auto_24217 ?auto_24223 ) ) ( not ( = ?auto_24219 ?auto_24222 ) ) ( IS-CRATE ?auto_24216 ) ( not ( = ?auto_24239 ?auto_24220 ) ) ( HOIST-AT ?auto_24252 ?auto_24239 ) ( AVAILABLE ?auto_24252 ) ( SURFACE-AT ?auto_24216 ?auto_24239 ) ( ON ?auto_24216 ?auto_24232 ) ( CLEAR ?auto_24216 ) ( not ( = ?auto_24214 ?auto_24216 ) ) ( not ( = ?auto_24214 ?auto_24232 ) ) ( not ( = ?auto_24216 ?auto_24232 ) ) ( not ( = ?auto_24219 ?auto_24252 ) ) ( IS-CRATE ?auto_24214 ) ( not ( = ?auto_24227 ?auto_24220 ) ) ( HOIST-AT ?auto_24253 ?auto_24227 ) ( AVAILABLE ?auto_24253 ) ( SURFACE-AT ?auto_24214 ?auto_24227 ) ( ON ?auto_24214 ?auto_24249 ) ( CLEAR ?auto_24214 ) ( not ( = ?auto_24215 ?auto_24214 ) ) ( not ( = ?auto_24215 ?auto_24249 ) ) ( not ( = ?auto_24214 ?auto_24249 ) ) ( not ( = ?auto_24219 ?auto_24253 ) ) ( IS-CRATE ?auto_24215 ) ( not ( = ?auto_24231 ?auto_24220 ) ) ( HOIST-AT ?auto_24245 ?auto_24231 ) ( AVAILABLE ?auto_24245 ) ( SURFACE-AT ?auto_24215 ?auto_24231 ) ( ON ?auto_24215 ?auto_24233 ) ( CLEAR ?auto_24215 ) ( not ( = ?auto_24210 ?auto_24215 ) ) ( not ( = ?auto_24210 ?auto_24233 ) ) ( not ( = ?auto_24215 ?auto_24233 ) ) ( not ( = ?auto_24219 ?auto_24245 ) ) ( IS-CRATE ?auto_24210 ) ( not ( = ?auto_24243 ?auto_24220 ) ) ( HOIST-AT ?auto_24254 ?auto_24243 ) ( AVAILABLE ?auto_24254 ) ( SURFACE-AT ?auto_24210 ?auto_24243 ) ( ON ?auto_24210 ?auto_24236 ) ( CLEAR ?auto_24210 ) ( not ( = ?auto_24212 ?auto_24210 ) ) ( not ( = ?auto_24212 ?auto_24236 ) ) ( not ( = ?auto_24210 ?auto_24236 ) ) ( not ( = ?auto_24219 ?auto_24254 ) ) ( IS-CRATE ?auto_24212 ) ( not ( = ?auto_24248 ?auto_24220 ) ) ( HOIST-AT ?auto_24255 ?auto_24248 ) ( SURFACE-AT ?auto_24212 ?auto_24248 ) ( ON ?auto_24212 ?auto_24238 ) ( CLEAR ?auto_24212 ) ( not ( = ?auto_24213 ?auto_24212 ) ) ( not ( = ?auto_24213 ?auto_24238 ) ) ( not ( = ?auto_24212 ?auto_24238 ) ) ( not ( = ?auto_24219 ?auto_24255 ) ) ( IS-CRATE ?auto_24213 ) ( AVAILABLE ?auto_24255 ) ( SURFACE-AT ?auto_24213 ?auto_24248 ) ( ON ?auto_24213 ?auto_24250 ) ( CLEAR ?auto_24213 ) ( not ( = ?auto_24209 ?auto_24213 ) ) ( not ( = ?auto_24209 ?auto_24250 ) ) ( not ( = ?auto_24213 ?auto_24250 ) ) ( IS-CRATE ?auto_24209 ) ( not ( = ?auto_24235 ?auto_24220 ) ) ( HOIST-AT ?auto_24257 ?auto_24235 ) ( AVAILABLE ?auto_24257 ) ( SURFACE-AT ?auto_24209 ?auto_24235 ) ( ON ?auto_24209 ?auto_24256 ) ( CLEAR ?auto_24209 ) ( not ( = ?auto_24211 ?auto_24209 ) ) ( not ( = ?auto_24211 ?auto_24256 ) ) ( not ( = ?auto_24209 ?auto_24256 ) ) ( not ( = ?auto_24219 ?auto_24257 ) ) ( IS-CRATE ?auto_24211 ) ( not ( = ?auto_24225 ?auto_24220 ) ) ( HOIST-AT ?auto_24247 ?auto_24225 ) ( AVAILABLE ?auto_24247 ) ( SURFACE-AT ?auto_24211 ?auto_24225 ) ( ON ?auto_24211 ?auto_24234 ) ( CLEAR ?auto_24211 ) ( not ( = ?auto_24208 ?auto_24211 ) ) ( not ( = ?auto_24208 ?auto_24234 ) ) ( not ( = ?auto_24211 ?auto_24234 ) ) ( not ( = ?auto_24219 ?auto_24247 ) ) ( IS-CRATE ?auto_24208 ) ( not ( = ?auto_24251 ?auto_24220 ) ) ( HOIST-AT ?auto_24246 ?auto_24251 ) ( AVAILABLE ?auto_24246 ) ( SURFACE-AT ?auto_24208 ?auto_24251 ) ( ON ?auto_24208 ?auto_24224 ) ( CLEAR ?auto_24208 ) ( not ( = ?auto_24207 ?auto_24208 ) ) ( not ( = ?auto_24207 ?auto_24224 ) ) ( not ( = ?auto_24208 ?auto_24224 ) ) ( not ( = ?auto_24219 ?auto_24246 ) ) ( IS-CRATE ?auto_24207 ) ( not ( = ?auto_24242 ?auto_24220 ) ) ( HOIST-AT ?auto_24228 ?auto_24242 ) ( AVAILABLE ?auto_24228 ) ( SURFACE-AT ?auto_24207 ?auto_24242 ) ( ON ?auto_24207 ?auto_24241 ) ( CLEAR ?auto_24207 ) ( not ( = ?auto_24206 ?auto_24207 ) ) ( not ( = ?auto_24206 ?auto_24241 ) ) ( not ( = ?auto_24207 ?auto_24241 ) ) ( not ( = ?auto_24219 ?auto_24228 ) ) ( IS-CRATE ?auto_24206 ) ( not ( = ?auto_24244 ?auto_24220 ) ) ( HOIST-AT ?auto_24226 ?auto_24244 ) ( AVAILABLE ?auto_24226 ) ( SURFACE-AT ?auto_24206 ?auto_24244 ) ( ON ?auto_24206 ?auto_24237 ) ( CLEAR ?auto_24206 ) ( not ( = ?auto_24205 ?auto_24206 ) ) ( not ( = ?auto_24205 ?auto_24237 ) ) ( not ( = ?auto_24206 ?auto_24237 ) ) ( not ( = ?auto_24219 ?auto_24226 ) ) ( SURFACE-AT ?auto_24204 ?auto_24220 ) ( CLEAR ?auto_24204 ) ( IS-CRATE ?auto_24205 ) ( AVAILABLE ?auto_24219 ) ( not ( = ?auto_24230 ?auto_24220 ) ) ( HOIST-AT ?auto_24229 ?auto_24230 ) ( AVAILABLE ?auto_24229 ) ( SURFACE-AT ?auto_24205 ?auto_24230 ) ( ON ?auto_24205 ?auto_24240 ) ( CLEAR ?auto_24205 ) ( TRUCK-AT ?auto_24221 ?auto_24220 ) ( not ( = ?auto_24204 ?auto_24205 ) ) ( not ( = ?auto_24204 ?auto_24240 ) ) ( not ( = ?auto_24205 ?auto_24240 ) ) ( not ( = ?auto_24219 ?auto_24229 ) ) ( not ( = ?auto_24204 ?auto_24206 ) ) ( not ( = ?auto_24204 ?auto_24237 ) ) ( not ( = ?auto_24206 ?auto_24240 ) ) ( not ( = ?auto_24244 ?auto_24230 ) ) ( not ( = ?auto_24226 ?auto_24229 ) ) ( not ( = ?auto_24237 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24207 ) ) ( not ( = ?auto_24204 ?auto_24241 ) ) ( not ( = ?auto_24205 ?auto_24207 ) ) ( not ( = ?auto_24205 ?auto_24241 ) ) ( not ( = ?auto_24207 ?auto_24237 ) ) ( not ( = ?auto_24207 ?auto_24240 ) ) ( not ( = ?auto_24242 ?auto_24244 ) ) ( not ( = ?auto_24242 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24226 ) ) ( not ( = ?auto_24228 ?auto_24229 ) ) ( not ( = ?auto_24241 ?auto_24237 ) ) ( not ( = ?auto_24241 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24208 ) ) ( not ( = ?auto_24204 ?auto_24224 ) ) ( not ( = ?auto_24205 ?auto_24208 ) ) ( not ( = ?auto_24205 ?auto_24224 ) ) ( not ( = ?auto_24206 ?auto_24208 ) ) ( not ( = ?auto_24206 ?auto_24224 ) ) ( not ( = ?auto_24208 ?auto_24241 ) ) ( not ( = ?auto_24208 ?auto_24237 ) ) ( not ( = ?auto_24208 ?auto_24240 ) ) ( not ( = ?auto_24251 ?auto_24242 ) ) ( not ( = ?auto_24251 ?auto_24244 ) ) ( not ( = ?auto_24251 ?auto_24230 ) ) ( not ( = ?auto_24246 ?auto_24228 ) ) ( not ( = ?auto_24246 ?auto_24226 ) ) ( not ( = ?auto_24246 ?auto_24229 ) ) ( not ( = ?auto_24224 ?auto_24241 ) ) ( not ( = ?auto_24224 ?auto_24237 ) ) ( not ( = ?auto_24224 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24211 ) ) ( not ( = ?auto_24204 ?auto_24234 ) ) ( not ( = ?auto_24205 ?auto_24211 ) ) ( not ( = ?auto_24205 ?auto_24234 ) ) ( not ( = ?auto_24206 ?auto_24211 ) ) ( not ( = ?auto_24206 ?auto_24234 ) ) ( not ( = ?auto_24207 ?auto_24211 ) ) ( not ( = ?auto_24207 ?auto_24234 ) ) ( not ( = ?auto_24211 ?auto_24224 ) ) ( not ( = ?auto_24211 ?auto_24241 ) ) ( not ( = ?auto_24211 ?auto_24237 ) ) ( not ( = ?auto_24211 ?auto_24240 ) ) ( not ( = ?auto_24225 ?auto_24251 ) ) ( not ( = ?auto_24225 ?auto_24242 ) ) ( not ( = ?auto_24225 ?auto_24244 ) ) ( not ( = ?auto_24225 ?auto_24230 ) ) ( not ( = ?auto_24247 ?auto_24246 ) ) ( not ( = ?auto_24247 ?auto_24228 ) ) ( not ( = ?auto_24247 ?auto_24226 ) ) ( not ( = ?auto_24247 ?auto_24229 ) ) ( not ( = ?auto_24234 ?auto_24224 ) ) ( not ( = ?auto_24234 ?auto_24241 ) ) ( not ( = ?auto_24234 ?auto_24237 ) ) ( not ( = ?auto_24234 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24209 ) ) ( not ( = ?auto_24204 ?auto_24256 ) ) ( not ( = ?auto_24205 ?auto_24209 ) ) ( not ( = ?auto_24205 ?auto_24256 ) ) ( not ( = ?auto_24206 ?auto_24209 ) ) ( not ( = ?auto_24206 ?auto_24256 ) ) ( not ( = ?auto_24207 ?auto_24209 ) ) ( not ( = ?auto_24207 ?auto_24256 ) ) ( not ( = ?auto_24208 ?auto_24209 ) ) ( not ( = ?auto_24208 ?auto_24256 ) ) ( not ( = ?auto_24209 ?auto_24234 ) ) ( not ( = ?auto_24209 ?auto_24224 ) ) ( not ( = ?auto_24209 ?auto_24241 ) ) ( not ( = ?auto_24209 ?auto_24237 ) ) ( not ( = ?auto_24209 ?auto_24240 ) ) ( not ( = ?auto_24235 ?auto_24225 ) ) ( not ( = ?auto_24235 ?auto_24251 ) ) ( not ( = ?auto_24235 ?auto_24242 ) ) ( not ( = ?auto_24235 ?auto_24244 ) ) ( not ( = ?auto_24235 ?auto_24230 ) ) ( not ( = ?auto_24257 ?auto_24247 ) ) ( not ( = ?auto_24257 ?auto_24246 ) ) ( not ( = ?auto_24257 ?auto_24228 ) ) ( not ( = ?auto_24257 ?auto_24226 ) ) ( not ( = ?auto_24257 ?auto_24229 ) ) ( not ( = ?auto_24256 ?auto_24234 ) ) ( not ( = ?auto_24256 ?auto_24224 ) ) ( not ( = ?auto_24256 ?auto_24241 ) ) ( not ( = ?auto_24256 ?auto_24237 ) ) ( not ( = ?auto_24256 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24213 ) ) ( not ( = ?auto_24204 ?auto_24250 ) ) ( not ( = ?auto_24205 ?auto_24213 ) ) ( not ( = ?auto_24205 ?auto_24250 ) ) ( not ( = ?auto_24206 ?auto_24213 ) ) ( not ( = ?auto_24206 ?auto_24250 ) ) ( not ( = ?auto_24207 ?auto_24213 ) ) ( not ( = ?auto_24207 ?auto_24250 ) ) ( not ( = ?auto_24208 ?auto_24213 ) ) ( not ( = ?auto_24208 ?auto_24250 ) ) ( not ( = ?auto_24211 ?auto_24213 ) ) ( not ( = ?auto_24211 ?auto_24250 ) ) ( not ( = ?auto_24213 ?auto_24256 ) ) ( not ( = ?auto_24213 ?auto_24234 ) ) ( not ( = ?auto_24213 ?auto_24224 ) ) ( not ( = ?auto_24213 ?auto_24241 ) ) ( not ( = ?auto_24213 ?auto_24237 ) ) ( not ( = ?auto_24213 ?auto_24240 ) ) ( not ( = ?auto_24248 ?auto_24235 ) ) ( not ( = ?auto_24248 ?auto_24225 ) ) ( not ( = ?auto_24248 ?auto_24251 ) ) ( not ( = ?auto_24248 ?auto_24242 ) ) ( not ( = ?auto_24248 ?auto_24244 ) ) ( not ( = ?auto_24248 ?auto_24230 ) ) ( not ( = ?auto_24255 ?auto_24257 ) ) ( not ( = ?auto_24255 ?auto_24247 ) ) ( not ( = ?auto_24255 ?auto_24246 ) ) ( not ( = ?auto_24255 ?auto_24228 ) ) ( not ( = ?auto_24255 ?auto_24226 ) ) ( not ( = ?auto_24255 ?auto_24229 ) ) ( not ( = ?auto_24250 ?auto_24256 ) ) ( not ( = ?auto_24250 ?auto_24234 ) ) ( not ( = ?auto_24250 ?auto_24224 ) ) ( not ( = ?auto_24250 ?auto_24241 ) ) ( not ( = ?auto_24250 ?auto_24237 ) ) ( not ( = ?auto_24250 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24212 ) ) ( not ( = ?auto_24204 ?auto_24238 ) ) ( not ( = ?auto_24205 ?auto_24212 ) ) ( not ( = ?auto_24205 ?auto_24238 ) ) ( not ( = ?auto_24206 ?auto_24212 ) ) ( not ( = ?auto_24206 ?auto_24238 ) ) ( not ( = ?auto_24207 ?auto_24212 ) ) ( not ( = ?auto_24207 ?auto_24238 ) ) ( not ( = ?auto_24208 ?auto_24212 ) ) ( not ( = ?auto_24208 ?auto_24238 ) ) ( not ( = ?auto_24211 ?auto_24212 ) ) ( not ( = ?auto_24211 ?auto_24238 ) ) ( not ( = ?auto_24209 ?auto_24212 ) ) ( not ( = ?auto_24209 ?auto_24238 ) ) ( not ( = ?auto_24212 ?auto_24250 ) ) ( not ( = ?auto_24212 ?auto_24256 ) ) ( not ( = ?auto_24212 ?auto_24234 ) ) ( not ( = ?auto_24212 ?auto_24224 ) ) ( not ( = ?auto_24212 ?auto_24241 ) ) ( not ( = ?auto_24212 ?auto_24237 ) ) ( not ( = ?auto_24212 ?auto_24240 ) ) ( not ( = ?auto_24238 ?auto_24250 ) ) ( not ( = ?auto_24238 ?auto_24256 ) ) ( not ( = ?auto_24238 ?auto_24234 ) ) ( not ( = ?auto_24238 ?auto_24224 ) ) ( not ( = ?auto_24238 ?auto_24241 ) ) ( not ( = ?auto_24238 ?auto_24237 ) ) ( not ( = ?auto_24238 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24210 ) ) ( not ( = ?auto_24204 ?auto_24236 ) ) ( not ( = ?auto_24205 ?auto_24210 ) ) ( not ( = ?auto_24205 ?auto_24236 ) ) ( not ( = ?auto_24206 ?auto_24210 ) ) ( not ( = ?auto_24206 ?auto_24236 ) ) ( not ( = ?auto_24207 ?auto_24210 ) ) ( not ( = ?auto_24207 ?auto_24236 ) ) ( not ( = ?auto_24208 ?auto_24210 ) ) ( not ( = ?auto_24208 ?auto_24236 ) ) ( not ( = ?auto_24211 ?auto_24210 ) ) ( not ( = ?auto_24211 ?auto_24236 ) ) ( not ( = ?auto_24209 ?auto_24210 ) ) ( not ( = ?auto_24209 ?auto_24236 ) ) ( not ( = ?auto_24213 ?auto_24210 ) ) ( not ( = ?auto_24213 ?auto_24236 ) ) ( not ( = ?auto_24210 ?auto_24238 ) ) ( not ( = ?auto_24210 ?auto_24250 ) ) ( not ( = ?auto_24210 ?auto_24256 ) ) ( not ( = ?auto_24210 ?auto_24234 ) ) ( not ( = ?auto_24210 ?auto_24224 ) ) ( not ( = ?auto_24210 ?auto_24241 ) ) ( not ( = ?auto_24210 ?auto_24237 ) ) ( not ( = ?auto_24210 ?auto_24240 ) ) ( not ( = ?auto_24243 ?auto_24248 ) ) ( not ( = ?auto_24243 ?auto_24235 ) ) ( not ( = ?auto_24243 ?auto_24225 ) ) ( not ( = ?auto_24243 ?auto_24251 ) ) ( not ( = ?auto_24243 ?auto_24242 ) ) ( not ( = ?auto_24243 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24230 ) ) ( not ( = ?auto_24254 ?auto_24255 ) ) ( not ( = ?auto_24254 ?auto_24257 ) ) ( not ( = ?auto_24254 ?auto_24247 ) ) ( not ( = ?auto_24254 ?auto_24246 ) ) ( not ( = ?auto_24254 ?auto_24228 ) ) ( not ( = ?auto_24254 ?auto_24226 ) ) ( not ( = ?auto_24254 ?auto_24229 ) ) ( not ( = ?auto_24236 ?auto_24238 ) ) ( not ( = ?auto_24236 ?auto_24250 ) ) ( not ( = ?auto_24236 ?auto_24256 ) ) ( not ( = ?auto_24236 ?auto_24234 ) ) ( not ( = ?auto_24236 ?auto_24224 ) ) ( not ( = ?auto_24236 ?auto_24241 ) ) ( not ( = ?auto_24236 ?auto_24237 ) ) ( not ( = ?auto_24236 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24215 ) ) ( not ( = ?auto_24204 ?auto_24233 ) ) ( not ( = ?auto_24205 ?auto_24215 ) ) ( not ( = ?auto_24205 ?auto_24233 ) ) ( not ( = ?auto_24206 ?auto_24215 ) ) ( not ( = ?auto_24206 ?auto_24233 ) ) ( not ( = ?auto_24207 ?auto_24215 ) ) ( not ( = ?auto_24207 ?auto_24233 ) ) ( not ( = ?auto_24208 ?auto_24215 ) ) ( not ( = ?auto_24208 ?auto_24233 ) ) ( not ( = ?auto_24211 ?auto_24215 ) ) ( not ( = ?auto_24211 ?auto_24233 ) ) ( not ( = ?auto_24209 ?auto_24215 ) ) ( not ( = ?auto_24209 ?auto_24233 ) ) ( not ( = ?auto_24213 ?auto_24215 ) ) ( not ( = ?auto_24213 ?auto_24233 ) ) ( not ( = ?auto_24212 ?auto_24215 ) ) ( not ( = ?auto_24212 ?auto_24233 ) ) ( not ( = ?auto_24215 ?auto_24236 ) ) ( not ( = ?auto_24215 ?auto_24238 ) ) ( not ( = ?auto_24215 ?auto_24250 ) ) ( not ( = ?auto_24215 ?auto_24256 ) ) ( not ( = ?auto_24215 ?auto_24234 ) ) ( not ( = ?auto_24215 ?auto_24224 ) ) ( not ( = ?auto_24215 ?auto_24241 ) ) ( not ( = ?auto_24215 ?auto_24237 ) ) ( not ( = ?auto_24215 ?auto_24240 ) ) ( not ( = ?auto_24231 ?auto_24243 ) ) ( not ( = ?auto_24231 ?auto_24248 ) ) ( not ( = ?auto_24231 ?auto_24235 ) ) ( not ( = ?auto_24231 ?auto_24225 ) ) ( not ( = ?auto_24231 ?auto_24251 ) ) ( not ( = ?auto_24231 ?auto_24242 ) ) ( not ( = ?auto_24231 ?auto_24244 ) ) ( not ( = ?auto_24231 ?auto_24230 ) ) ( not ( = ?auto_24245 ?auto_24254 ) ) ( not ( = ?auto_24245 ?auto_24255 ) ) ( not ( = ?auto_24245 ?auto_24257 ) ) ( not ( = ?auto_24245 ?auto_24247 ) ) ( not ( = ?auto_24245 ?auto_24246 ) ) ( not ( = ?auto_24245 ?auto_24228 ) ) ( not ( = ?auto_24245 ?auto_24226 ) ) ( not ( = ?auto_24245 ?auto_24229 ) ) ( not ( = ?auto_24233 ?auto_24236 ) ) ( not ( = ?auto_24233 ?auto_24238 ) ) ( not ( = ?auto_24233 ?auto_24250 ) ) ( not ( = ?auto_24233 ?auto_24256 ) ) ( not ( = ?auto_24233 ?auto_24234 ) ) ( not ( = ?auto_24233 ?auto_24224 ) ) ( not ( = ?auto_24233 ?auto_24241 ) ) ( not ( = ?auto_24233 ?auto_24237 ) ) ( not ( = ?auto_24233 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24214 ) ) ( not ( = ?auto_24204 ?auto_24249 ) ) ( not ( = ?auto_24205 ?auto_24214 ) ) ( not ( = ?auto_24205 ?auto_24249 ) ) ( not ( = ?auto_24206 ?auto_24214 ) ) ( not ( = ?auto_24206 ?auto_24249 ) ) ( not ( = ?auto_24207 ?auto_24214 ) ) ( not ( = ?auto_24207 ?auto_24249 ) ) ( not ( = ?auto_24208 ?auto_24214 ) ) ( not ( = ?auto_24208 ?auto_24249 ) ) ( not ( = ?auto_24211 ?auto_24214 ) ) ( not ( = ?auto_24211 ?auto_24249 ) ) ( not ( = ?auto_24209 ?auto_24214 ) ) ( not ( = ?auto_24209 ?auto_24249 ) ) ( not ( = ?auto_24213 ?auto_24214 ) ) ( not ( = ?auto_24213 ?auto_24249 ) ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( not ( = ?auto_24212 ?auto_24249 ) ) ( not ( = ?auto_24210 ?auto_24214 ) ) ( not ( = ?auto_24210 ?auto_24249 ) ) ( not ( = ?auto_24214 ?auto_24233 ) ) ( not ( = ?auto_24214 ?auto_24236 ) ) ( not ( = ?auto_24214 ?auto_24238 ) ) ( not ( = ?auto_24214 ?auto_24250 ) ) ( not ( = ?auto_24214 ?auto_24256 ) ) ( not ( = ?auto_24214 ?auto_24234 ) ) ( not ( = ?auto_24214 ?auto_24224 ) ) ( not ( = ?auto_24214 ?auto_24241 ) ) ( not ( = ?auto_24214 ?auto_24237 ) ) ( not ( = ?auto_24214 ?auto_24240 ) ) ( not ( = ?auto_24227 ?auto_24231 ) ) ( not ( = ?auto_24227 ?auto_24243 ) ) ( not ( = ?auto_24227 ?auto_24248 ) ) ( not ( = ?auto_24227 ?auto_24235 ) ) ( not ( = ?auto_24227 ?auto_24225 ) ) ( not ( = ?auto_24227 ?auto_24251 ) ) ( not ( = ?auto_24227 ?auto_24242 ) ) ( not ( = ?auto_24227 ?auto_24244 ) ) ( not ( = ?auto_24227 ?auto_24230 ) ) ( not ( = ?auto_24253 ?auto_24245 ) ) ( not ( = ?auto_24253 ?auto_24254 ) ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( not ( = ?auto_24253 ?auto_24257 ) ) ( not ( = ?auto_24253 ?auto_24247 ) ) ( not ( = ?auto_24253 ?auto_24246 ) ) ( not ( = ?auto_24253 ?auto_24228 ) ) ( not ( = ?auto_24253 ?auto_24226 ) ) ( not ( = ?auto_24253 ?auto_24229 ) ) ( not ( = ?auto_24249 ?auto_24233 ) ) ( not ( = ?auto_24249 ?auto_24236 ) ) ( not ( = ?auto_24249 ?auto_24238 ) ) ( not ( = ?auto_24249 ?auto_24250 ) ) ( not ( = ?auto_24249 ?auto_24256 ) ) ( not ( = ?auto_24249 ?auto_24234 ) ) ( not ( = ?auto_24249 ?auto_24224 ) ) ( not ( = ?auto_24249 ?auto_24241 ) ) ( not ( = ?auto_24249 ?auto_24237 ) ) ( not ( = ?auto_24249 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24216 ) ) ( not ( = ?auto_24204 ?auto_24232 ) ) ( not ( = ?auto_24205 ?auto_24216 ) ) ( not ( = ?auto_24205 ?auto_24232 ) ) ( not ( = ?auto_24206 ?auto_24216 ) ) ( not ( = ?auto_24206 ?auto_24232 ) ) ( not ( = ?auto_24207 ?auto_24216 ) ) ( not ( = ?auto_24207 ?auto_24232 ) ) ( not ( = ?auto_24208 ?auto_24216 ) ) ( not ( = ?auto_24208 ?auto_24232 ) ) ( not ( = ?auto_24211 ?auto_24216 ) ) ( not ( = ?auto_24211 ?auto_24232 ) ) ( not ( = ?auto_24209 ?auto_24216 ) ) ( not ( = ?auto_24209 ?auto_24232 ) ) ( not ( = ?auto_24213 ?auto_24216 ) ) ( not ( = ?auto_24213 ?auto_24232 ) ) ( not ( = ?auto_24212 ?auto_24216 ) ) ( not ( = ?auto_24212 ?auto_24232 ) ) ( not ( = ?auto_24210 ?auto_24216 ) ) ( not ( = ?auto_24210 ?auto_24232 ) ) ( not ( = ?auto_24215 ?auto_24216 ) ) ( not ( = ?auto_24215 ?auto_24232 ) ) ( not ( = ?auto_24216 ?auto_24249 ) ) ( not ( = ?auto_24216 ?auto_24233 ) ) ( not ( = ?auto_24216 ?auto_24236 ) ) ( not ( = ?auto_24216 ?auto_24238 ) ) ( not ( = ?auto_24216 ?auto_24250 ) ) ( not ( = ?auto_24216 ?auto_24256 ) ) ( not ( = ?auto_24216 ?auto_24234 ) ) ( not ( = ?auto_24216 ?auto_24224 ) ) ( not ( = ?auto_24216 ?auto_24241 ) ) ( not ( = ?auto_24216 ?auto_24237 ) ) ( not ( = ?auto_24216 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24227 ) ) ( not ( = ?auto_24239 ?auto_24231 ) ) ( not ( = ?auto_24239 ?auto_24243 ) ) ( not ( = ?auto_24239 ?auto_24248 ) ) ( not ( = ?auto_24239 ?auto_24235 ) ) ( not ( = ?auto_24239 ?auto_24225 ) ) ( not ( = ?auto_24239 ?auto_24251 ) ) ( not ( = ?auto_24239 ?auto_24242 ) ) ( not ( = ?auto_24239 ?auto_24244 ) ) ( not ( = ?auto_24239 ?auto_24230 ) ) ( not ( = ?auto_24252 ?auto_24253 ) ) ( not ( = ?auto_24252 ?auto_24245 ) ) ( not ( = ?auto_24252 ?auto_24254 ) ) ( not ( = ?auto_24252 ?auto_24255 ) ) ( not ( = ?auto_24252 ?auto_24257 ) ) ( not ( = ?auto_24252 ?auto_24247 ) ) ( not ( = ?auto_24252 ?auto_24246 ) ) ( not ( = ?auto_24252 ?auto_24228 ) ) ( not ( = ?auto_24252 ?auto_24226 ) ) ( not ( = ?auto_24252 ?auto_24229 ) ) ( not ( = ?auto_24232 ?auto_24249 ) ) ( not ( = ?auto_24232 ?auto_24233 ) ) ( not ( = ?auto_24232 ?auto_24236 ) ) ( not ( = ?auto_24232 ?auto_24238 ) ) ( not ( = ?auto_24232 ?auto_24250 ) ) ( not ( = ?auto_24232 ?auto_24256 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( not ( = ?auto_24232 ?auto_24224 ) ) ( not ( = ?auto_24232 ?auto_24241 ) ) ( not ( = ?auto_24232 ?auto_24237 ) ) ( not ( = ?auto_24232 ?auto_24240 ) ) ( not ( = ?auto_24204 ?auto_24217 ) ) ( not ( = ?auto_24204 ?auto_24223 ) ) ( not ( = ?auto_24205 ?auto_24217 ) ) ( not ( = ?auto_24205 ?auto_24223 ) ) ( not ( = ?auto_24206 ?auto_24217 ) ) ( not ( = ?auto_24206 ?auto_24223 ) ) ( not ( = ?auto_24207 ?auto_24217 ) ) ( not ( = ?auto_24207 ?auto_24223 ) ) ( not ( = ?auto_24208 ?auto_24217 ) ) ( not ( = ?auto_24208 ?auto_24223 ) ) ( not ( = ?auto_24211 ?auto_24217 ) ) ( not ( = ?auto_24211 ?auto_24223 ) ) ( not ( = ?auto_24209 ?auto_24217 ) ) ( not ( = ?auto_24209 ?auto_24223 ) ) ( not ( = ?auto_24213 ?auto_24217 ) ) ( not ( = ?auto_24213 ?auto_24223 ) ) ( not ( = ?auto_24212 ?auto_24217 ) ) ( not ( = ?auto_24212 ?auto_24223 ) ) ( not ( = ?auto_24210 ?auto_24217 ) ) ( not ( = ?auto_24210 ?auto_24223 ) ) ( not ( = ?auto_24215 ?auto_24217 ) ) ( not ( = ?auto_24215 ?auto_24223 ) ) ( not ( = ?auto_24214 ?auto_24217 ) ) ( not ( = ?auto_24214 ?auto_24223 ) ) ( not ( = ?auto_24217 ?auto_24232 ) ) ( not ( = ?auto_24217 ?auto_24249 ) ) ( not ( = ?auto_24217 ?auto_24233 ) ) ( not ( = ?auto_24217 ?auto_24236 ) ) ( not ( = ?auto_24217 ?auto_24238 ) ) ( not ( = ?auto_24217 ?auto_24250 ) ) ( not ( = ?auto_24217 ?auto_24256 ) ) ( not ( = ?auto_24217 ?auto_24234 ) ) ( not ( = ?auto_24217 ?auto_24224 ) ) ( not ( = ?auto_24217 ?auto_24241 ) ) ( not ( = ?auto_24217 ?auto_24237 ) ) ( not ( = ?auto_24217 ?auto_24240 ) ) ( not ( = ?auto_24218 ?auto_24239 ) ) ( not ( = ?auto_24218 ?auto_24227 ) ) ( not ( = ?auto_24218 ?auto_24231 ) ) ( not ( = ?auto_24218 ?auto_24243 ) ) ( not ( = ?auto_24218 ?auto_24248 ) ) ( not ( = ?auto_24218 ?auto_24235 ) ) ( not ( = ?auto_24218 ?auto_24225 ) ) ( not ( = ?auto_24218 ?auto_24251 ) ) ( not ( = ?auto_24218 ?auto_24242 ) ) ( not ( = ?auto_24218 ?auto_24244 ) ) ( not ( = ?auto_24218 ?auto_24230 ) ) ( not ( = ?auto_24222 ?auto_24252 ) ) ( not ( = ?auto_24222 ?auto_24253 ) ) ( not ( = ?auto_24222 ?auto_24245 ) ) ( not ( = ?auto_24222 ?auto_24254 ) ) ( not ( = ?auto_24222 ?auto_24255 ) ) ( not ( = ?auto_24222 ?auto_24257 ) ) ( not ( = ?auto_24222 ?auto_24247 ) ) ( not ( = ?auto_24222 ?auto_24246 ) ) ( not ( = ?auto_24222 ?auto_24228 ) ) ( not ( = ?auto_24222 ?auto_24226 ) ) ( not ( = ?auto_24222 ?auto_24229 ) ) ( not ( = ?auto_24223 ?auto_24232 ) ) ( not ( = ?auto_24223 ?auto_24249 ) ) ( not ( = ?auto_24223 ?auto_24233 ) ) ( not ( = ?auto_24223 ?auto_24236 ) ) ( not ( = ?auto_24223 ?auto_24238 ) ) ( not ( = ?auto_24223 ?auto_24250 ) ) ( not ( = ?auto_24223 ?auto_24256 ) ) ( not ( = ?auto_24223 ?auto_24234 ) ) ( not ( = ?auto_24223 ?auto_24224 ) ) ( not ( = ?auto_24223 ?auto_24241 ) ) ( not ( = ?auto_24223 ?auto_24237 ) ) ( not ( = ?auto_24223 ?auto_24240 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24204 ?auto_24205 ?auto_24206 ?auto_24207 ?auto_24208 ?auto_24211 ?auto_24209 ?auto_24213 ?auto_24212 ?auto_24210 ?auto_24215 ?auto_24214 ?auto_24216 )
      ( MAKE-1CRATE ?auto_24216 ?auto_24217 )
      ( MAKE-13CRATE-VERIFY ?auto_24204 ?auto_24205 ?auto_24206 ?auto_24207 ?auto_24208 ?auto_24211 ?auto_24209 ?auto_24213 ?auto_24212 ?auto_24210 ?auto_24215 ?auto_24214 ?auto_24216 ?auto_24217 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24260 - SURFACE
      ?auto_24261 - SURFACE
    )
    :vars
    (
      ?auto_24262 - HOIST
      ?auto_24263 - PLACE
      ?auto_24265 - PLACE
      ?auto_24266 - HOIST
      ?auto_24267 - SURFACE
      ?auto_24264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24262 ?auto_24263 ) ( SURFACE-AT ?auto_24260 ?auto_24263 ) ( CLEAR ?auto_24260 ) ( IS-CRATE ?auto_24261 ) ( AVAILABLE ?auto_24262 ) ( not ( = ?auto_24265 ?auto_24263 ) ) ( HOIST-AT ?auto_24266 ?auto_24265 ) ( AVAILABLE ?auto_24266 ) ( SURFACE-AT ?auto_24261 ?auto_24265 ) ( ON ?auto_24261 ?auto_24267 ) ( CLEAR ?auto_24261 ) ( TRUCK-AT ?auto_24264 ?auto_24263 ) ( not ( = ?auto_24260 ?auto_24261 ) ) ( not ( = ?auto_24260 ?auto_24267 ) ) ( not ( = ?auto_24261 ?auto_24267 ) ) ( not ( = ?auto_24262 ?auto_24266 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24264 ?auto_24263 ?auto_24265 )
      ( !LIFT ?auto_24266 ?auto_24261 ?auto_24267 ?auto_24265 )
      ( !LOAD ?auto_24266 ?auto_24261 ?auto_24264 ?auto_24265 )
      ( !DRIVE ?auto_24264 ?auto_24265 ?auto_24263 )
      ( !UNLOAD ?auto_24262 ?auto_24261 ?auto_24264 ?auto_24263 )
      ( !DROP ?auto_24262 ?auto_24261 ?auto_24260 ?auto_24263 )
      ( MAKE-1CRATE-VERIFY ?auto_24260 ?auto_24261 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_24283 - SURFACE
      ?auto_24284 - SURFACE
      ?auto_24285 - SURFACE
      ?auto_24286 - SURFACE
      ?auto_24287 - SURFACE
      ?auto_24290 - SURFACE
      ?auto_24288 - SURFACE
      ?auto_24292 - SURFACE
      ?auto_24291 - SURFACE
      ?auto_24289 - SURFACE
      ?auto_24294 - SURFACE
      ?auto_24293 - SURFACE
      ?auto_24295 - SURFACE
      ?auto_24296 - SURFACE
      ?auto_24297 - SURFACE
    )
    :vars
    (
      ?auto_24299 - HOIST
      ?auto_24302 - PLACE
      ?auto_24301 - PLACE
      ?auto_24303 - HOIST
      ?auto_24300 - SURFACE
      ?auto_24306 - PLACE
      ?auto_24333 - HOIST
      ?auto_24312 - SURFACE
      ?auto_24316 - PLACE
      ?auto_24324 - HOIST
      ?auto_24330 - SURFACE
      ?auto_24318 - PLACE
      ?auto_24328 - HOIST
      ?auto_24326 - SURFACE
      ?auto_24307 - PLACE
      ?auto_24314 - HOIST
      ?auto_24331 - SURFACE
      ?auto_24338 - PLACE
      ?auto_24323 - HOIST
      ?auto_24336 - SURFACE
      ?auto_24334 - PLACE
      ?auto_24317 - HOIST
      ?auto_24320 - SURFACE
      ?auto_24322 - SURFACE
      ?auto_24309 - PLACE
      ?auto_24321 - HOIST
      ?auto_24329 - SURFACE
      ?auto_24308 - PLACE
      ?auto_24340 - HOIST
      ?auto_24337 - SURFACE
      ?auto_24311 - PLACE
      ?auto_24332 - HOIST
      ?auto_24305 - SURFACE
      ?auto_24325 - PLACE
      ?auto_24319 - HOIST
      ?auto_24339 - SURFACE
      ?auto_24327 - PLACE
      ?auto_24313 - HOIST
      ?auto_24310 - SURFACE
      ?auto_24335 - PLACE
      ?auto_24304 - HOIST
      ?auto_24315 - SURFACE
      ?auto_24298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24299 ?auto_24302 ) ( IS-CRATE ?auto_24297 ) ( not ( = ?auto_24301 ?auto_24302 ) ) ( HOIST-AT ?auto_24303 ?auto_24301 ) ( AVAILABLE ?auto_24303 ) ( SURFACE-AT ?auto_24297 ?auto_24301 ) ( ON ?auto_24297 ?auto_24300 ) ( CLEAR ?auto_24297 ) ( not ( = ?auto_24296 ?auto_24297 ) ) ( not ( = ?auto_24296 ?auto_24300 ) ) ( not ( = ?auto_24297 ?auto_24300 ) ) ( not ( = ?auto_24299 ?auto_24303 ) ) ( IS-CRATE ?auto_24296 ) ( not ( = ?auto_24306 ?auto_24302 ) ) ( HOIST-AT ?auto_24333 ?auto_24306 ) ( AVAILABLE ?auto_24333 ) ( SURFACE-AT ?auto_24296 ?auto_24306 ) ( ON ?auto_24296 ?auto_24312 ) ( CLEAR ?auto_24296 ) ( not ( = ?auto_24295 ?auto_24296 ) ) ( not ( = ?auto_24295 ?auto_24312 ) ) ( not ( = ?auto_24296 ?auto_24312 ) ) ( not ( = ?auto_24299 ?auto_24333 ) ) ( IS-CRATE ?auto_24295 ) ( not ( = ?auto_24316 ?auto_24302 ) ) ( HOIST-AT ?auto_24324 ?auto_24316 ) ( AVAILABLE ?auto_24324 ) ( SURFACE-AT ?auto_24295 ?auto_24316 ) ( ON ?auto_24295 ?auto_24330 ) ( CLEAR ?auto_24295 ) ( not ( = ?auto_24293 ?auto_24295 ) ) ( not ( = ?auto_24293 ?auto_24330 ) ) ( not ( = ?auto_24295 ?auto_24330 ) ) ( not ( = ?auto_24299 ?auto_24324 ) ) ( IS-CRATE ?auto_24293 ) ( not ( = ?auto_24318 ?auto_24302 ) ) ( HOIST-AT ?auto_24328 ?auto_24318 ) ( AVAILABLE ?auto_24328 ) ( SURFACE-AT ?auto_24293 ?auto_24318 ) ( ON ?auto_24293 ?auto_24326 ) ( CLEAR ?auto_24293 ) ( not ( = ?auto_24294 ?auto_24293 ) ) ( not ( = ?auto_24294 ?auto_24326 ) ) ( not ( = ?auto_24293 ?auto_24326 ) ) ( not ( = ?auto_24299 ?auto_24328 ) ) ( IS-CRATE ?auto_24294 ) ( not ( = ?auto_24307 ?auto_24302 ) ) ( HOIST-AT ?auto_24314 ?auto_24307 ) ( AVAILABLE ?auto_24314 ) ( SURFACE-AT ?auto_24294 ?auto_24307 ) ( ON ?auto_24294 ?auto_24331 ) ( CLEAR ?auto_24294 ) ( not ( = ?auto_24289 ?auto_24294 ) ) ( not ( = ?auto_24289 ?auto_24331 ) ) ( not ( = ?auto_24294 ?auto_24331 ) ) ( not ( = ?auto_24299 ?auto_24314 ) ) ( IS-CRATE ?auto_24289 ) ( not ( = ?auto_24338 ?auto_24302 ) ) ( HOIST-AT ?auto_24323 ?auto_24338 ) ( AVAILABLE ?auto_24323 ) ( SURFACE-AT ?auto_24289 ?auto_24338 ) ( ON ?auto_24289 ?auto_24336 ) ( CLEAR ?auto_24289 ) ( not ( = ?auto_24291 ?auto_24289 ) ) ( not ( = ?auto_24291 ?auto_24336 ) ) ( not ( = ?auto_24289 ?auto_24336 ) ) ( not ( = ?auto_24299 ?auto_24323 ) ) ( IS-CRATE ?auto_24291 ) ( not ( = ?auto_24334 ?auto_24302 ) ) ( HOIST-AT ?auto_24317 ?auto_24334 ) ( SURFACE-AT ?auto_24291 ?auto_24334 ) ( ON ?auto_24291 ?auto_24320 ) ( CLEAR ?auto_24291 ) ( not ( = ?auto_24292 ?auto_24291 ) ) ( not ( = ?auto_24292 ?auto_24320 ) ) ( not ( = ?auto_24291 ?auto_24320 ) ) ( not ( = ?auto_24299 ?auto_24317 ) ) ( IS-CRATE ?auto_24292 ) ( AVAILABLE ?auto_24317 ) ( SURFACE-AT ?auto_24292 ?auto_24334 ) ( ON ?auto_24292 ?auto_24322 ) ( CLEAR ?auto_24292 ) ( not ( = ?auto_24288 ?auto_24292 ) ) ( not ( = ?auto_24288 ?auto_24322 ) ) ( not ( = ?auto_24292 ?auto_24322 ) ) ( IS-CRATE ?auto_24288 ) ( not ( = ?auto_24309 ?auto_24302 ) ) ( HOIST-AT ?auto_24321 ?auto_24309 ) ( AVAILABLE ?auto_24321 ) ( SURFACE-AT ?auto_24288 ?auto_24309 ) ( ON ?auto_24288 ?auto_24329 ) ( CLEAR ?auto_24288 ) ( not ( = ?auto_24290 ?auto_24288 ) ) ( not ( = ?auto_24290 ?auto_24329 ) ) ( not ( = ?auto_24288 ?auto_24329 ) ) ( not ( = ?auto_24299 ?auto_24321 ) ) ( IS-CRATE ?auto_24290 ) ( not ( = ?auto_24308 ?auto_24302 ) ) ( HOIST-AT ?auto_24340 ?auto_24308 ) ( AVAILABLE ?auto_24340 ) ( SURFACE-AT ?auto_24290 ?auto_24308 ) ( ON ?auto_24290 ?auto_24337 ) ( CLEAR ?auto_24290 ) ( not ( = ?auto_24287 ?auto_24290 ) ) ( not ( = ?auto_24287 ?auto_24337 ) ) ( not ( = ?auto_24290 ?auto_24337 ) ) ( not ( = ?auto_24299 ?auto_24340 ) ) ( IS-CRATE ?auto_24287 ) ( not ( = ?auto_24311 ?auto_24302 ) ) ( HOIST-AT ?auto_24332 ?auto_24311 ) ( AVAILABLE ?auto_24332 ) ( SURFACE-AT ?auto_24287 ?auto_24311 ) ( ON ?auto_24287 ?auto_24305 ) ( CLEAR ?auto_24287 ) ( not ( = ?auto_24286 ?auto_24287 ) ) ( not ( = ?auto_24286 ?auto_24305 ) ) ( not ( = ?auto_24287 ?auto_24305 ) ) ( not ( = ?auto_24299 ?auto_24332 ) ) ( IS-CRATE ?auto_24286 ) ( not ( = ?auto_24325 ?auto_24302 ) ) ( HOIST-AT ?auto_24319 ?auto_24325 ) ( AVAILABLE ?auto_24319 ) ( SURFACE-AT ?auto_24286 ?auto_24325 ) ( ON ?auto_24286 ?auto_24339 ) ( CLEAR ?auto_24286 ) ( not ( = ?auto_24285 ?auto_24286 ) ) ( not ( = ?auto_24285 ?auto_24339 ) ) ( not ( = ?auto_24286 ?auto_24339 ) ) ( not ( = ?auto_24299 ?auto_24319 ) ) ( IS-CRATE ?auto_24285 ) ( not ( = ?auto_24327 ?auto_24302 ) ) ( HOIST-AT ?auto_24313 ?auto_24327 ) ( AVAILABLE ?auto_24313 ) ( SURFACE-AT ?auto_24285 ?auto_24327 ) ( ON ?auto_24285 ?auto_24310 ) ( CLEAR ?auto_24285 ) ( not ( = ?auto_24284 ?auto_24285 ) ) ( not ( = ?auto_24284 ?auto_24310 ) ) ( not ( = ?auto_24285 ?auto_24310 ) ) ( not ( = ?auto_24299 ?auto_24313 ) ) ( SURFACE-AT ?auto_24283 ?auto_24302 ) ( CLEAR ?auto_24283 ) ( IS-CRATE ?auto_24284 ) ( AVAILABLE ?auto_24299 ) ( not ( = ?auto_24335 ?auto_24302 ) ) ( HOIST-AT ?auto_24304 ?auto_24335 ) ( AVAILABLE ?auto_24304 ) ( SURFACE-AT ?auto_24284 ?auto_24335 ) ( ON ?auto_24284 ?auto_24315 ) ( CLEAR ?auto_24284 ) ( TRUCK-AT ?auto_24298 ?auto_24302 ) ( not ( = ?auto_24283 ?auto_24284 ) ) ( not ( = ?auto_24283 ?auto_24315 ) ) ( not ( = ?auto_24284 ?auto_24315 ) ) ( not ( = ?auto_24299 ?auto_24304 ) ) ( not ( = ?auto_24283 ?auto_24285 ) ) ( not ( = ?auto_24283 ?auto_24310 ) ) ( not ( = ?auto_24285 ?auto_24315 ) ) ( not ( = ?auto_24327 ?auto_24335 ) ) ( not ( = ?auto_24313 ?auto_24304 ) ) ( not ( = ?auto_24310 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24286 ) ) ( not ( = ?auto_24283 ?auto_24339 ) ) ( not ( = ?auto_24284 ?auto_24286 ) ) ( not ( = ?auto_24284 ?auto_24339 ) ) ( not ( = ?auto_24286 ?auto_24310 ) ) ( not ( = ?auto_24286 ?auto_24315 ) ) ( not ( = ?auto_24325 ?auto_24327 ) ) ( not ( = ?auto_24325 ?auto_24335 ) ) ( not ( = ?auto_24319 ?auto_24313 ) ) ( not ( = ?auto_24319 ?auto_24304 ) ) ( not ( = ?auto_24339 ?auto_24310 ) ) ( not ( = ?auto_24339 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24287 ) ) ( not ( = ?auto_24283 ?auto_24305 ) ) ( not ( = ?auto_24284 ?auto_24287 ) ) ( not ( = ?auto_24284 ?auto_24305 ) ) ( not ( = ?auto_24285 ?auto_24287 ) ) ( not ( = ?auto_24285 ?auto_24305 ) ) ( not ( = ?auto_24287 ?auto_24339 ) ) ( not ( = ?auto_24287 ?auto_24310 ) ) ( not ( = ?auto_24287 ?auto_24315 ) ) ( not ( = ?auto_24311 ?auto_24325 ) ) ( not ( = ?auto_24311 ?auto_24327 ) ) ( not ( = ?auto_24311 ?auto_24335 ) ) ( not ( = ?auto_24332 ?auto_24319 ) ) ( not ( = ?auto_24332 ?auto_24313 ) ) ( not ( = ?auto_24332 ?auto_24304 ) ) ( not ( = ?auto_24305 ?auto_24339 ) ) ( not ( = ?auto_24305 ?auto_24310 ) ) ( not ( = ?auto_24305 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24290 ) ) ( not ( = ?auto_24283 ?auto_24337 ) ) ( not ( = ?auto_24284 ?auto_24290 ) ) ( not ( = ?auto_24284 ?auto_24337 ) ) ( not ( = ?auto_24285 ?auto_24290 ) ) ( not ( = ?auto_24285 ?auto_24337 ) ) ( not ( = ?auto_24286 ?auto_24290 ) ) ( not ( = ?auto_24286 ?auto_24337 ) ) ( not ( = ?auto_24290 ?auto_24305 ) ) ( not ( = ?auto_24290 ?auto_24339 ) ) ( not ( = ?auto_24290 ?auto_24310 ) ) ( not ( = ?auto_24290 ?auto_24315 ) ) ( not ( = ?auto_24308 ?auto_24311 ) ) ( not ( = ?auto_24308 ?auto_24325 ) ) ( not ( = ?auto_24308 ?auto_24327 ) ) ( not ( = ?auto_24308 ?auto_24335 ) ) ( not ( = ?auto_24340 ?auto_24332 ) ) ( not ( = ?auto_24340 ?auto_24319 ) ) ( not ( = ?auto_24340 ?auto_24313 ) ) ( not ( = ?auto_24340 ?auto_24304 ) ) ( not ( = ?auto_24337 ?auto_24305 ) ) ( not ( = ?auto_24337 ?auto_24339 ) ) ( not ( = ?auto_24337 ?auto_24310 ) ) ( not ( = ?auto_24337 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24288 ) ) ( not ( = ?auto_24283 ?auto_24329 ) ) ( not ( = ?auto_24284 ?auto_24288 ) ) ( not ( = ?auto_24284 ?auto_24329 ) ) ( not ( = ?auto_24285 ?auto_24288 ) ) ( not ( = ?auto_24285 ?auto_24329 ) ) ( not ( = ?auto_24286 ?auto_24288 ) ) ( not ( = ?auto_24286 ?auto_24329 ) ) ( not ( = ?auto_24287 ?auto_24288 ) ) ( not ( = ?auto_24287 ?auto_24329 ) ) ( not ( = ?auto_24288 ?auto_24337 ) ) ( not ( = ?auto_24288 ?auto_24305 ) ) ( not ( = ?auto_24288 ?auto_24339 ) ) ( not ( = ?auto_24288 ?auto_24310 ) ) ( not ( = ?auto_24288 ?auto_24315 ) ) ( not ( = ?auto_24309 ?auto_24308 ) ) ( not ( = ?auto_24309 ?auto_24311 ) ) ( not ( = ?auto_24309 ?auto_24325 ) ) ( not ( = ?auto_24309 ?auto_24327 ) ) ( not ( = ?auto_24309 ?auto_24335 ) ) ( not ( = ?auto_24321 ?auto_24340 ) ) ( not ( = ?auto_24321 ?auto_24332 ) ) ( not ( = ?auto_24321 ?auto_24319 ) ) ( not ( = ?auto_24321 ?auto_24313 ) ) ( not ( = ?auto_24321 ?auto_24304 ) ) ( not ( = ?auto_24329 ?auto_24337 ) ) ( not ( = ?auto_24329 ?auto_24305 ) ) ( not ( = ?auto_24329 ?auto_24339 ) ) ( not ( = ?auto_24329 ?auto_24310 ) ) ( not ( = ?auto_24329 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24292 ) ) ( not ( = ?auto_24283 ?auto_24322 ) ) ( not ( = ?auto_24284 ?auto_24292 ) ) ( not ( = ?auto_24284 ?auto_24322 ) ) ( not ( = ?auto_24285 ?auto_24292 ) ) ( not ( = ?auto_24285 ?auto_24322 ) ) ( not ( = ?auto_24286 ?auto_24292 ) ) ( not ( = ?auto_24286 ?auto_24322 ) ) ( not ( = ?auto_24287 ?auto_24292 ) ) ( not ( = ?auto_24287 ?auto_24322 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24290 ?auto_24322 ) ) ( not ( = ?auto_24292 ?auto_24329 ) ) ( not ( = ?auto_24292 ?auto_24337 ) ) ( not ( = ?auto_24292 ?auto_24305 ) ) ( not ( = ?auto_24292 ?auto_24339 ) ) ( not ( = ?auto_24292 ?auto_24310 ) ) ( not ( = ?auto_24292 ?auto_24315 ) ) ( not ( = ?auto_24334 ?auto_24309 ) ) ( not ( = ?auto_24334 ?auto_24308 ) ) ( not ( = ?auto_24334 ?auto_24311 ) ) ( not ( = ?auto_24334 ?auto_24325 ) ) ( not ( = ?auto_24334 ?auto_24327 ) ) ( not ( = ?auto_24334 ?auto_24335 ) ) ( not ( = ?auto_24317 ?auto_24321 ) ) ( not ( = ?auto_24317 ?auto_24340 ) ) ( not ( = ?auto_24317 ?auto_24332 ) ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24317 ?auto_24313 ) ) ( not ( = ?auto_24317 ?auto_24304 ) ) ( not ( = ?auto_24322 ?auto_24329 ) ) ( not ( = ?auto_24322 ?auto_24337 ) ) ( not ( = ?auto_24322 ?auto_24305 ) ) ( not ( = ?auto_24322 ?auto_24339 ) ) ( not ( = ?auto_24322 ?auto_24310 ) ) ( not ( = ?auto_24322 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24291 ) ) ( not ( = ?auto_24283 ?auto_24320 ) ) ( not ( = ?auto_24284 ?auto_24291 ) ) ( not ( = ?auto_24284 ?auto_24320 ) ) ( not ( = ?auto_24285 ?auto_24291 ) ) ( not ( = ?auto_24285 ?auto_24320 ) ) ( not ( = ?auto_24286 ?auto_24291 ) ) ( not ( = ?auto_24286 ?auto_24320 ) ) ( not ( = ?auto_24287 ?auto_24291 ) ) ( not ( = ?auto_24287 ?auto_24320 ) ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24320 ) ) ( not ( = ?auto_24288 ?auto_24291 ) ) ( not ( = ?auto_24288 ?auto_24320 ) ) ( not ( = ?auto_24291 ?auto_24322 ) ) ( not ( = ?auto_24291 ?auto_24329 ) ) ( not ( = ?auto_24291 ?auto_24337 ) ) ( not ( = ?auto_24291 ?auto_24305 ) ) ( not ( = ?auto_24291 ?auto_24339 ) ) ( not ( = ?auto_24291 ?auto_24310 ) ) ( not ( = ?auto_24291 ?auto_24315 ) ) ( not ( = ?auto_24320 ?auto_24322 ) ) ( not ( = ?auto_24320 ?auto_24329 ) ) ( not ( = ?auto_24320 ?auto_24337 ) ) ( not ( = ?auto_24320 ?auto_24305 ) ) ( not ( = ?auto_24320 ?auto_24339 ) ) ( not ( = ?auto_24320 ?auto_24310 ) ) ( not ( = ?auto_24320 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24289 ) ) ( not ( = ?auto_24283 ?auto_24336 ) ) ( not ( = ?auto_24284 ?auto_24289 ) ) ( not ( = ?auto_24284 ?auto_24336 ) ) ( not ( = ?auto_24285 ?auto_24289 ) ) ( not ( = ?auto_24285 ?auto_24336 ) ) ( not ( = ?auto_24286 ?auto_24289 ) ) ( not ( = ?auto_24286 ?auto_24336 ) ) ( not ( = ?auto_24287 ?auto_24289 ) ) ( not ( = ?auto_24287 ?auto_24336 ) ) ( not ( = ?auto_24290 ?auto_24289 ) ) ( not ( = ?auto_24290 ?auto_24336 ) ) ( not ( = ?auto_24288 ?auto_24289 ) ) ( not ( = ?auto_24288 ?auto_24336 ) ) ( not ( = ?auto_24292 ?auto_24289 ) ) ( not ( = ?auto_24292 ?auto_24336 ) ) ( not ( = ?auto_24289 ?auto_24320 ) ) ( not ( = ?auto_24289 ?auto_24322 ) ) ( not ( = ?auto_24289 ?auto_24329 ) ) ( not ( = ?auto_24289 ?auto_24337 ) ) ( not ( = ?auto_24289 ?auto_24305 ) ) ( not ( = ?auto_24289 ?auto_24339 ) ) ( not ( = ?auto_24289 ?auto_24310 ) ) ( not ( = ?auto_24289 ?auto_24315 ) ) ( not ( = ?auto_24338 ?auto_24334 ) ) ( not ( = ?auto_24338 ?auto_24309 ) ) ( not ( = ?auto_24338 ?auto_24308 ) ) ( not ( = ?auto_24338 ?auto_24311 ) ) ( not ( = ?auto_24338 ?auto_24325 ) ) ( not ( = ?auto_24338 ?auto_24327 ) ) ( not ( = ?auto_24338 ?auto_24335 ) ) ( not ( = ?auto_24323 ?auto_24317 ) ) ( not ( = ?auto_24323 ?auto_24321 ) ) ( not ( = ?auto_24323 ?auto_24340 ) ) ( not ( = ?auto_24323 ?auto_24332 ) ) ( not ( = ?auto_24323 ?auto_24319 ) ) ( not ( = ?auto_24323 ?auto_24313 ) ) ( not ( = ?auto_24323 ?auto_24304 ) ) ( not ( = ?auto_24336 ?auto_24320 ) ) ( not ( = ?auto_24336 ?auto_24322 ) ) ( not ( = ?auto_24336 ?auto_24329 ) ) ( not ( = ?auto_24336 ?auto_24337 ) ) ( not ( = ?auto_24336 ?auto_24305 ) ) ( not ( = ?auto_24336 ?auto_24339 ) ) ( not ( = ?auto_24336 ?auto_24310 ) ) ( not ( = ?auto_24336 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24294 ) ) ( not ( = ?auto_24283 ?auto_24331 ) ) ( not ( = ?auto_24284 ?auto_24294 ) ) ( not ( = ?auto_24284 ?auto_24331 ) ) ( not ( = ?auto_24285 ?auto_24294 ) ) ( not ( = ?auto_24285 ?auto_24331 ) ) ( not ( = ?auto_24286 ?auto_24294 ) ) ( not ( = ?auto_24286 ?auto_24331 ) ) ( not ( = ?auto_24287 ?auto_24294 ) ) ( not ( = ?auto_24287 ?auto_24331 ) ) ( not ( = ?auto_24290 ?auto_24294 ) ) ( not ( = ?auto_24290 ?auto_24331 ) ) ( not ( = ?auto_24288 ?auto_24294 ) ) ( not ( = ?auto_24288 ?auto_24331 ) ) ( not ( = ?auto_24292 ?auto_24294 ) ) ( not ( = ?auto_24292 ?auto_24331 ) ) ( not ( = ?auto_24291 ?auto_24294 ) ) ( not ( = ?auto_24291 ?auto_24331 ) ) ( not ( = ?auto_24294 ?auto_24336 ) ) ( not ( = ?auto_24294 ?auto_24320 ) ) ( not ( = ?auto_24294 ?auto_24322 ) ) ( not ( = ?auto_24294 ?auto_24329 ) ) ( not ( = ?auto_24294 ?auto_24337 ) ) ( not ( = ?auto_24294 ?auto_24305 ) ) ( not ( = ?auto_24294 ?auto_24339 ) ) ( not ( = ?auto_24294 ?auto_24310 ) ) ( not ( = ?auto_24294 ?auto_24315 ) ) ( not ( = ?auto_24307 ?auto_24338 ) ) ( not ( = ?auto_24307 ?auto_24334 ) ) ( not ( = ?auto_24307 ?auto_24309 ) ) ( not ( = ?auto_24307 ?auto_24308 ) ) ( not ( = ?auto_24307 ?auto_24311 ) ) ( not ( = ?auto_24307 ?auto_24325 ) ) ( not ( = ?auto_24307 ?auto_24327 ) ) ( not ( = ?auto_24307 ?auto_24335 ) ) ( not ( = ?auto_24314 ?auto_24323 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24321 ) ) ( not ( = ?auto_24314 ?auto_24340 ) ) ( not ( = ?auto_24314 ?auto_24332 ) ) ( not ( = ?auto_24314 ?auto_24319 ) ) ( not ( = ?auto_24314 ?auto_24313 ) ) ( not ( = ?auto_24314 ?auto_24304 ) ) ( not ( = ?auto_24331 ?auto_24336 ) ) ( not ( = ?auto_24331 ?auto_24320 ) ) ( not ( = ?auto_24331 ?auto_24322 ) ) ( not ( = ?auto_24331 ?auto_24329 ) ) ( not ( = ?auto_24331 ?auto_24337 ) ) ( not ( = ?auto_24331 ?auto_24305 ) ) ( not ( = ?auto_24331 ?auto_24339 ) ) ( not ( = ?auto_24331 ?auto_24310 ) ) ( not ( = ?auto_24331 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24293 ) ) ( not ( = ?auto_24283 ?auto_24326 ) ) ( not ( = ?auto_24284 ?auto_24293 ) ) ( not ( = ?auto_24284 ?auto_24326 ) ) ( not ( = ?auto_24285 ?auto_24293 ) ) ( not ( = ?auto_24285 ?auto_24326 ) ) ( not ( = ?auto_24286 ?auto_24293 ) ) ( not ( = ?auto_24286 ?auto_24326 ) ) ( not ( = ?auto_24287 ?auto_24293 ) ) ( not ( = ?auto_24287 ?auto_24326 ) ) ( not ( = ?auto_24290 ?auto_24293 ) ) ( not ( = ?auto_24290 ?auto_24326 ) ) ( not ( = ?auto_24288 ?auto_24293 ) ) ( not ( = ?auto_24288 ?auto_24326 ) ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( not ( = ?auto_24292 ?auto_24326 ) ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( not ( = ?auto_24291 ?auto_24326 ) ) ( not ( = ?auto_24289 ?auto_24293 ) ) ( not ( = ?auto_24289 ?auto_24326 ) ) ( not ( = ?auto_24293 ?auto_24331 ) ) ( not ( = ?auto_24293 ?auto_24336 ) ) ( not ( = ?auto_24293 ?auto_24320 ) ) ( not ( = ?auto_24293 ?auto_24322 ) ) ( not ( = ?auto_24293 ?auto_24329 ) ) ( not ( = ?auto_24293 ?auto_24337 ) ) ( not ( = ?auto_24293 ?auto_24305 ) ) ( not ( = ?auto_24293 ?auto_24339 ) ) ( not ( = ?auto_24293 ?auto_24310 ) ) ( not ( = ?auto_24293 ?auto_24315 ) ) ( not ( = ?auto_24318 ?auto_24307 ) ) ( not ( = ?auto_24318 ?auto_24338 ) ) ( not ( = ?auto_24318 ?auto_24334 ) ) ( not ( = ?auto_24318 ?auto_24309 ) ) ( not ( = ?auto_24318 ?auto_24308 ) ) ( not ( = ?auto_24318 ?auto_24311 ) ) ( not ( = ?auto_24318 ?auto_24325 ) ) ( not ( = ?auto_24318 ?auto_24327 ) ) ( not ( = ?auto_24318 ?auto_24335 ) ) ( not ( = ?auto_24328 ?auto_24314 ) ) ( not ( = ?auto_24328 ?auto_24323 ) ) ( not ( = ?auto_24328 ?auto_24317 ) ) ( not ( = ?auto_24328 ?auto_24321 ) ) ( not ( = ?auto_24328 ?auto_24340 ) ) ( not ( = ?auto_24328 ?auto_24332 ) ) ( not ( = ?auto_24328 ?auto_24319 ) ) ( not ( = ?auto_24328 ?auto_24313 ) ) ( not ( = ?auto_24328 ?auto_24304 ) ) ( not ( = ?auto_24326 ?auto_24331 ) ) ( not ( = ?auto_24326 ?auto_24336 ) ) ( not ( = ?auto_24326 ?auto_24320 ) ) ( not ( = ?auto_24326 ?auto_24322 ) ) ( not ( = ?auto_24326 ?auto_24329 ) ) ( not ( = ?auto_24326 ?auto_24337 ) ) ( not ( = ?auto_24326 ?auto_24305 ) ) ( not ( = ?auto_24326 ?auto_24339 ) ) ( not ( = ?auto_24326 ?auto_24310 ) ) ( not ( = ?auto_24326 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24295 ) ) ( not ( = ?auto_24283 ?auto_24330 ) ) ( not ( = ?auto_24284 ?auto_24295 ) ) ( not ( = ?auto_24284 ?auto_24330 ) ) ( not ( = ?auto_24285 ?auto_24295 ) ) ( not ( = ?auto_24285 ?auto_24330 ) ) ( not ( = ?auto_24286 ?auto_24295 ) ) ( not ( = ?auto_24286 ?auto_24330 ) ) ( not ( = ?auto_24287 ?auto_24295 ) ) ( not ( = ?auto_24287 ?auto_24330 ) ) ( not ( = ?auto_24290 ?auto_24295 ) ) ( not ( = ?auto_24290 ?auto_24330 ) ) ( not ( = ?auto_24288 ?auto_24295 ) ) ( not ( = ?auto_24288 ?auto_24330 ) ) ( not ( = ?auto_24292 ?auto_24295 ) ) ( not ( = ?auto_24292 ?auto_24330 ) ) ( not ( = ?auto_24291 ?auto_24295 ) ) ( not ( = ?auto_24291 ?auto_24330 ) ) ( not ( = ?auto_24289 ?auto_24295 ) ) ( not ( = ?auto_24289 ?auto_24330 ) ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24330 ) ) ( not ( = ?auto_24295 ?auto_24326 ) ) ( not ( = ?auto_24295 ?auto_24331 ) ) ( not ( = ?auto_24295 ?auto_24336 ) ) ( not ( = ?auto_24295 ?auto_24320 ) ) ( not ( = ?auto_24295 ?auto_24322 ) ) ( not ( = ?auto_24295 ?auto_24329 ) ) ( not ( = ?auto_24295 ?auto_24337 ) ) ( not ( = ?auto_24295 ?auto_24305 ) ) ( not ( = ?auto_24295 ?auto_24339 ) ) ( not ( = ?auto_24295 ?auto_24310 ) ) ( not ( = ?auto_24295 ?auto_24315 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24307 ) ) ( not ( = ?auto_24316 ?auto_24338 ) ) ( not ( = ?auto_24316 ?auto_24334 ) ) ( not ( = ?auto_24316 ?auto_24309 ) ) ( not ( = ?auto_24316 ?auto_24308 ) ) ( not ( = ?auto_24316 ?auto_24311 ) ) ( not ( = ?auto_24316 ?auto_24325 ) ) ( not ( = ?auto_24316 ?auto_24327 ) ) ( not ( = ?auto_24316 ?auto_24335 ) ) ( not ( = ?auto_24324 ?auto_24328 ) ) ( not ( = ?auto_24324 ?auto_24314 ) ) ( not ( = ?auto_24324 ?auto_24323 ) ) ( not ( = ?auto_24324 ?auto_24317 ) ) ( not ( = ?auto_24324 ?auto_24321 ) ) ( not ( = ?auto_24324 ?auto_24340 ) ) ( not ( = ?auto_24324 ?auto_24332 ) ) ( not ( = ?auto_24324 ?auto_24319 ) ) ( not ( = ?auto_24324 ?auto_24313 ) ) ( not ( = ?auto_24324 ?auto_24304 ) ) ( not ( = ?auto_24330 ?auto_24326 ) ) ( not ( = ?auto_24330 ?auto_24331 ) ) ( not ( = ?auto_24330 ?auto_24336 ) ) ( not ( = ?auto_24330 ?auto_24320 ) ) ( not ( = ?auto_24330 ?auto_24322 ) ) ( not ( = ?auto_24330 ?auto_24329 ) ) ( not ( = ?auto_24330 ?auto_24337 ) ) ( not ( = ?auto_24330 ?auto_24305 ) ) ( not ( = ?auto_24330 ?auto_24339 ) ) ( not ( = ?auto_24330 ?auto_24310 ) ) ( not ( = ?auto_24330 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24296 ) ) ( not ( = ?auto_24283 ?auto_24312 ) ) ( not ( = ?auto_24284 ?auto_24296 ) ) ( not ( = ?auto_24284 ?auto_24312 ) ) ( not ( = ?auto_24285 ?auto_24296 ) ) ( not ( = ?auto_24285 ?auto_24312 ) ) ( not ( = ?auto_24286 ?auto_24296 ) ) ( not ( = ?auto_24286 ?auto_24312 ) ) ( not ( = ?auto_24287 ?auto_24296 ) ) ( not ( = ?auto_24287 ?auto_24312 ) ) ( not ( = ?auto_24290 ?auto_24296 ) ) ( not ( = ?auto_24290 ?auto_24312 ) ) ( not ( = ?auto_24288 ?auto_24296 ) ) ( not ( = ?auto_24288 ?auto_24312 ) ) ( not ( = ?auto_24292 ?auto_24296 ) ) ( not ( = ?auto_24292 ?auto_24312 ) ) ( not ( = ?auto_24291 ?auto_24296 ) ) ( not ( = ?auto_24291 ?auto_24312 ) ) ( not ( = ?auto_24289 ?auto_24296 ) ) ( not ( = ?auto_24289 ?auto_24312 ) ) ( not ( = ?auto_24294 ?auto_24296 ) ) ( not ( = ?auto_24294 ?auto_24312 ) ) ( not ( = ?auto_24293 ?auto_24296 ) ) ( not ( = ?auto_24293 ?auto_24312 ) ) ( not ( = ?auto_24296 ?auto_24330 ) ) ( not ( = ?auto_24296 ?auto_24326 ) ) ( not ( = ?auto_24296 ?auto_24331 ) ) ( not ( = ?auto_24296 ?auto_24336 ) ) ( not ( = ?auto_24296 ?auto_24320 ) ) ( not ( = ?auto_24296 ?auto_24322 ) ) ( not ( = ?auto_24296 ?auto_24329 ) ) ( not ( = ?auto_24296 ?auto_24337 ) ) ( not ( = ?auto_24296 ?auto_24305 ) ) ( not ( = ?auto_24296 ?auto_24339 ) ) ( not ( = ?auto_24296 ?auto_24310 ) ) ( not ( = ?auto_24296 ?auto_24315 ) ) ( not ( = ?auto_24306 ?auto_24316 ) ) ( not ( = ?auto_24306 ?auto_24318 ) ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24338 ) ) ( not ( = ?auto_24306 ?auto_24334 ) ) ( not ( = ?auto_24306 ?auto_24309 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( not ( = ?auto_24306 ?auto_24311 ) ) ( not ( = ?auto_24306 ?auto_24325 ) ) ( not ( = ?auto_24306 ?auto_24327 ) ) ( not ( = ?auto_24306 ?auto_24335 ) ) ( not ( = ?auto_24333 ?auto_24324 ) ) ( not ( = ?auto_24333 ?auto_24328 ) ) ( not ( = ?auto_24333 ?auto_24314 ) ) ( not ( = ?auto_24333 ?auto_24323 ) ) ( not ( = ?auto_24333 ?auto_24317 ) ) ( not ( = ?auto_24333 ?auto_24321 ) ) ( not ( = ?auto_24333 ?auto_24340 ) ) ( not ( = ?auto_24333 ?auto_24332 ) ) ( not ( = ?auto_24333 ?auto_24319 ) ) ( not ( = ?auto_24333 ?auto_24313 ) ) ( not ( = ?auto_24333 ?auto_24304 ) ) ( not ( = ?auto_24312 ?auto_24330 ) ) ( not ( = ?auto_24312 ?auto_24326 ) ) ( not ( = ?auto_24312 ?auto_24331 ) ) ( not ( = ?auto_24312 ?auto_24336 ) ) ( not ( = ?auto_24312 ?auto_24320 ) ) ( not ( = ?auto_24312 ?auto_24322 ) ) ( not ( = ?auto_24312 ?auto_24329 ) ) ( not ( = ?auto_24312 ?auto_24337 ) ) ( not ( = ?auto_24312 ?auto_24305 ) ) ( not ( = ?auto_24312 ?auto_24339 ) ) ( not ( = ?auto_24312 ?auto_24310 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24283 ?auto_24297 ) ) ( not ( = ?auto_24283 ?auto_24300 ) ) ( not ( = ?auto_24284 ?auto_24297 ) ) ( not ( = ?auto_24284 ?auto_24300 ) ) ( not ( = ?auto_24285 ?auto_24297 ) ) ( not ( = ?auto_24285 ?auto_24300 ) ) ( not ( = ?auto_24286 ?auto_24297 ) ) ( not ( = ?auto_24286 ?auto_24300 ) ) ( not ( = ?auto_24287 ?auto_24297 ) ) ( not ( = ?auto_24287 ?auto_24300 ) ) ( not ( = ?auto_24290 ?auto_24297 ) ) ( not ( = ?auto_24290 ?auto_24300 ) ) ( not ( = ?auto_24288 ?auto_24297 ) ) ( not ( = ?auto_24288 ?auto_24300 ) ) ( not ( = ?auto_24292 ?auto_24297 ) ) ( not ( = ?auto_24292 ?auto_24300 ) ) ( not ( = ?auto_24291 ?auto_24297 ) ) ( not ( = ?auto_24291 ?auto_24300 ) ) ( not ( = ?auto_24289 ?auto_24297 ) ) ( not ( = ?auto_24289 ?auto_24300 ) ) ( not ( = ?auto_24294 ?auto_24297 ) ) ( not ( = ?auto_24294 ?auto_24300 ) ) ( not ( = ?auto_24293 ?auto_24297 ) ) ( not ( = ?auto_24293 ?auto_24300 ) ) ( not ( = ?auto_24295 ?auto_24297 ) ) ( not ( = ?auto_24295 ?auto_24300 ) ) ( not ( = ?auto_24297 ?auto_24312 ) ) ( not ( = ?auto_24297 ?auto_24330 ) ) ( not ( = ?auto_24297 ?auto_24326 ) ) ( not ( = ?auto_24297 ?auto_24331 ) ) ( not ( = ?auto_24297 ?auto_24336 ) ) ( not ( = ?auto_24297 ?auto_24320 ) ) ( not ( = ?auto_24297 ?auto_24322 ) ) ( not ( = ?auto_24297 ?auto_24329 ) ) ( not ( = ?auto_24297 ?auto_24337 ) ) ( not ( = ?auto_24297 ?auto_24305 ) ) ( not ( = ?auto_24297 ?auto_24339 ) ) ( not ( = ?auto_24297 ?auto_24310 ) ) ( not ( = ?auto_24297 ?auto_24315 ) ) ( not ( = ?auto_24301 ?auto_24306 ) ) ( not ( = ?auto_24301 ?auto_24316 ) ) ( not ( = ?auto_24301 ?auto_24318 ) ) ( not ( = ?auto_24301 ?auto_24307 ) ) ( not ( = ?auto_24301 ?auto_24338 ) ) ( not ( = ?auto_24301 ?auto_24334 ) ) ( not ( = ?auto_24301 ?auto_24309 ) ) ( not ( = ?auto_24301 ?auto_24308 ) ) ( not ( = ?auto_24301 ?auto_24311 ) ) ( not ( = ?auto_24301 ?auto_24325 ) ) ( not ( = ?auto_24301 ?auto_24327 ) ) ( not ( = ?auto_24301 ?auto_24335 ) ) ( not ( = ?auto_24303 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24324 ) ) ( not ( = ?auto_24303 ?auto_24328 ) ) ( not ( = ?auto_24303 ?auto_24314 ) ) ( not ( = ?auto_24303 ?auto_24323 ) ) ( not ( = ?auto_24303 ?auto_24317 ) ) ( not ( = ?auto_24303 ?auto_24321 ) ) ( not ( = ?auto_24303 ?auto_24340 ) ) ( not ( = ?auto_24303 ?auto_24332 ) ) ( not ( = ?auto_24303 ?auto_24319 ) ) ( not ( = ?auto_24303 ?auto_24313 ) ) ( not ( = ?auto_24303 ?auto_24304 ) ) ( not ( = ?auto_24300 ?auto_24312 ) ) ( not ( = ?auto_24300 ?auto_24330 ) ) ( not ( = ?auto_24300 ?auto_24326 ) ) ( not ( = ?auto_24300 ?auto_24331 ) ) ( not ( = ?auto_24300 ?auto_24336 ) ) ( not ( = ?auto_24300 ?auto_24320 ) ) ( not ( = ?auto_24300 ?auto_24322 ) ) ( not ( = ?auto_24300 ?auto_24329 ) ) ( not ( = ?auto_24300 ?auto_24337 ) ) ( not ( = ?auto_24300 ?auto_24305 ) ) ( not ( = ?auto_24300 ?auto_24339 ) ) ( not ( = ?auto_24300 ?auto_24310 ) ) ( not ( = ?auto_24300 ?auto_24315 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_24283 ?auto_24284 ?auto_24285 ?auto_24286 ?auto_24287 ?auto_24290 ?auto_24288 ?auto_24292 ?auto_24291 ?auto_24289 ?auto_24294 ?auto_24293 ?auto_24295 ?auto_24296 )
      ( MAKE-1CRATE ?auto_24296 ?auto_24297 )
      ( MAKE-14CRATE-VERIFY ?auto_24283 ?auto_24284 ?auto_24285 ?auto_24286 ?auto_24287 ?auto_24290 ?auto_24288 ?auto_24292 ?auto_24291 ?auto_24289 ?auto_24294 ?auto_24293 ?auto_24295 ?auto_24296 ?auto_24297 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24343 - SURFACE
      ?auto_24344 - SURFACE
    )
    :vars
    (
      ?auto_24345 - HOIST
      ?auto_24346 - PLACE
      ?auto_24348 - PLACE
      ?auto_24349 - HOIST
      ?auto_24350 - SURFACE
      ?auto_24347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24345 ?auto_24346 ) ( SURFACE-AT ?auto_24343 ?auto_24346 ) ( CLEAR ?auto_24343 ) ( IS-CRATE ?auto_24344 ) ( AVAILABLE ?auto_24345 ) ( not ( = ?auto_24348 ?auto_24346 ) ) ( HOIST-AT ?auto_24349 ?auto_24348 ) ( AVAILABLE ?auto_24349 ) ( SURFACE-AT ?auto_24344 ?auto_24348 ) ( ON ?auto_24344 ?auto_24350 ) ( CLEAR ?auto_24344 ) ( TRUCK-AT ?auto_24347 ?auto_24346 ) ( not ( = ?auto_24343 ?auto_24344 ) ) ( not ( = ?auto_24343 ?auto_24350 ) ) ( not ( = ?auto_24344 ?auto_24350 ) ) ( not ( = ?auto_24345 ?auto_24349 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24347 ?auto_24346 ?auto_24348 )
      ( !LIFT ?auto_24349 ?auto_24344 ?auto_24350 ?auto_24348 )
      ( !LOAD ?auto_24349 ?auto_24344 ?auto_24347 ?auto_24348 )
      ( !DRIVE ?auto_24347 ?auto_24348 ?auto_24346 )
      ( !UNLOAD ?auto_24345 ?auto_24344 ?auto_24347 ?auto_24346 )
      ( !DROP ?auto_24345 ?auto_24344 ?auto_24343 ?auto_24346 )
      ( MAKE-1CRATE-VERIFY ?auto_24343 ?auto_24344 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_24367 - SURFACE
      ?auto_24368 - SURFACE
      ?auto_24369 - SURFACE
      ?auto_24370 - SURFACE
      ?auto_24371 - SURFACE
      ?auto_24374 - SURFACE
      ?auto_24372 - SURFACE
      ?auto_24376 - SURFACE
      ?auto_24375 - SURFACE
      ?auto_24373 - SURFACE
      ?auto_24378 - SURFACE
      ?auto_24377 - SURFACE
      ?auto_24379 - SURFACE
      ?auto_24381 - SURFACE
      ?auto_24382 - SURFACE
      ?auto_24380 - SURFACE
    )
    :vars
    (
      ?auto_24383 - HOIST
      ?auto_24387 - PLACE
      ?auto_24388 - PLACE
      ?auto_24385 - HOIST
      ?auto_24384 - SURFACE
      ?auto_24423 - PLACE
      ?auto_24408 - HOIST
      ?auto_24390 - SURFACE
      ?auto_24421 - PLACE
      ?auto_24405 - HOIST
      ?auto_24424 - SURFACE
      ?auto_24411 - PLACE
      ?auto_24393 - HOIST
      ?auto_24403 - SURFACE
      ?auto_24399 - PLACE
      ?auto_24394 - HOIST
      ?auto_24406 - SURFACE
      ?auto_24398 - PLACE
      ?auto_24426 - HOIST
      ?auto_24415 - SURFACE
      ?auto_24407 - PLACE
      ?auto_24420 - HOIST
      ?auto_24392 - SURFACE
      ?auto_24404 - PLACE
      ?auto_24410 - HOIST
      ?auto_24418 - SURFACE
      ?auto_24416 - SURFACE
      ?auto_24414 - PLACE
      ?auto_24422 - HOIST
      ?auto_24409 - SURFACE
      ?auto_24413 - PLACE
      ?auto_24397 - HOIST
      ?auto_24396 - SURFACE
      ?auto_24419 - PLACE
      ?auto_24417 - HOIST
      ?auto_24395 - SURFACE
      ?auto_24391 - SURFACE
      ?auto_24412 - PLACE
      ?auto_24401 - HOIST
      ?auto_24425 - SURFACE
      ?auto_24400 - PLACE
      ?auto_24389 - HOIST
      ?auto_24402 - SURFACE
      ?auto_24386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24383 ?auto_24387 ) ( IS-CRATE ?auto_24380 ) ( not ( = ?auto_24388 ?auto_24387 ) ) ( HOIST-AT ?auto_24385 ?auto_24388 ) ( SURFACE-AT ?auto_24380 ?auto_24388 ) ( ON ?auto_24380 ?auto_24384 ) ( CLEAR ?auto_24380 ) ( not ( = ?auto_24382 ?auto_24380 ) ) ( not ( = ?auto_24382 ?auto_24384 ) ) ( not ( = ?auto_24380 ?auto_24384 ) ) ( not ( = ?auto_24383 ?auto_24385 ) ) ( IS-CRATE ?auto_24382 ) ( not ( = ?auto_24423 ?auto_24387 ) ) ( HOIST-AT ?auto_24408 ?auto_24423 ) ( AVAILABLE ?auto_24408 ) ( SURFACE-AT ?auto_24382 ?auto_24423 ) ( ON ?auto_24382 ?auto_24390 ) ( CLEAR ?auto_24382 ) ( not ( = ?auto_24381 ?auto_24382 ) ) ( not ( = ?auto_24381 ?auto_24390 ) ) ( not ( = ?auto_24382 ?auto_24390 ) ) ( not ( = ?auto_24383 ?auto_24408 ) ) ( IS-CRATE ?auto_24381 ) ( not ( = ?auto_24421 ?auto_24387 ) ) ( HOIST-AT ?auto_24405 ?auto_24421 ) ( AVAILABLE ?auto_24405 ) ( SURFACE-AT ?auto_24381 ?auto_24421 ) ( ON ?auto_24381 ?auto_24424 ) ( CLEAR ?auto_24381 ) ( not ( = ?auto_24379 ?auto_24381 ) ) ( not ( = ?auto_24379 ?auto_24424 ) ) ( not ( = ?auto_24381 ?auto_24424 ) ) ( not ( = ?auto_24383 ?auto_24405 ) ) ( IS-CRATE ?auto_24379 ) ( not ( = ?auto_24411 ?auto_24387 ) ) ( HOIST-AT ?auto_24393 ?auto_24411 ) ( AVAILABLE ?auto_24393 ) ( SURFACE-AT ?auto_24379 ?auto_24411 ) ( ON ?auto_24379 ?auto_24403 ) ( CLEAR ?auto_24379 ) ( not ( = ?auto_24377 ?auto_24379 ) ) ( not ( = ?auto_24377 ?auto_24403 ) ) ( not ( = ?auto_24379 ?auto_24403 ) ) ( not ( = ?auto_24383 ?auto_24393 ) ) ( IS-CRATE ?auto_24377 ) ( not ( = ?auto_24399 ?auto_24387 ) ) ( HOIST-AT ?auto_24394 ?auto_24399 ) ( AVAILABLE ?auto_24394 ) ( SURFACE-AT ?auto_24377 ?auto_24399 ) ( ON ?auto_24377 ?auto_24406 ) ( CLEAR ?auto_24377 ) ( not ( = ?auto_24378 ?auto_24377 ) ) ( not ( = ?auto_24378 ?auto_24406 ) ) ( not ( = ?auto_24377 ?auto_24406 ) ) ( not ( = ?auto_24383 ?auto_24394 ) ) ( IS-CRATE ?auto_24378 ) ( not ( = ?auto_24398 ?auto_24387 ) ) ( HOIST-AT ?auto_24426 ?auto_24398 ) ( AVAILABLE ?auto_24426 ) ( SURFACE-AT ?auto_24378 ?auto_24398 ) ( ON ?auto_24378 ?auto_24415 ) ( CLEAR ?auto_24378 ) ( not ( = ?auto_24373 ?auto_24378 ) ) ( not ( = ?auto_24373 ?auto_24415 ) ) ( not ( = ?auto_24378 ?auto_24415 ) ) ( not ( = ?auto_24383 ?auto_24426 ) ) ( IS-CRATE ?auto_24373 ) ( not ( = ?auto_24407 ?auto_24387 ) ) ( HOIST-AT ?auto_24420 ?auto_24407 ) ( AVAILABLE ?auto_24420 ) ( SURFACE-AT ?auto_24373 ?auto_24407 ) ( ON ?auto_24373 ?auto_24392 ) ( CLEAR ?auto_24373 ) ( not ( = ?auto_24375 ?auto_24373 ) ) ( not ( = ?auto_24375 ?auto_24392 ) ) ( not ( = ?auto_24373 ?auto_24392 ) ) ( not ( = ?auto_24383 ?auto_24420 ) ) ( IS-CRATE ?auto_24375 ) ( not ( = ?auto_24404 ?auto_24387 ) ) ( HOIST-AT ?auto_24410 ?auto_24404 ) ( SURFACE-AT ?auto_24375 ?auto_24404 ) ( ON ?auto_24375 ?auto_24418 ) ( CLEAR ?auto_24375 ) ( not ( = ?auto_24376 ?auto_24375 ) ) ( not ( = ?auto_24376 ?auto_24418 ) ) ( not ( = ?auto_24375 ?auto_24418 ) ) ( not ( = ?auto_24383 ?auto_24410 ) ) ( IS-CRATE ?auto_24376 ) ( AVAILABLE ?auto_24410 ) ( SURFACE-AT ?auto_24376 ?auto_24404 ) ( ON ?auto_24376 ?auto_24416 ) ( CLEAR ?auto_24376 ) ( not ( = ?auto_24372 ?auto_24376 ) ) ( not ( = ?auto_24372 ?auto_24416 ) ) ( not ( = ?auto_24376 ?auto_24416 ) ) ( IS-CRATE ?auto_24372 ) ( not ( = ?auto_24414 ?auto_24387 ) ) ( HOIST-AT ?auto_24422 ?auto_24414 ) ( AVAILABLE ?auto_24422 ) ( SURFACE-AT ?auto_24372 ?auto_24414 ) ( ON ?auto_24372 ?auto_24409 ) ( CLEAR ?auto_24372 ) ( not ( = ?auto_24374 ?auto_24372 ) ) ( not ( = ?auto_24374 ?auto_24409 ) ) ( not ( = ?auto_24372 ?auto_24409 ) ) ( not ( = ?auto_24383 ?auto_24422 ) ) ( IS-CRATE ?auto_24374 ) ( not ( = ?auto_24413 ?auto_24387 ) ) ( HOIST-AT ?auto_24397 ?auto_24413 ) ( AVAILABLE ?auto_24397 ) ( SURFACE-AT ?auto_24374 ?auto_24413 ) ( ON ?auto_24374 ?auto_24396 ) ( CLEAR ?auto_24374 ) ( not ( = ?auto_24371 ?auto_24374 ) ) ( not ( = ?auto_24371 ?auto_24396 ) ) ( not ( = ?auto_24374 ?auto_24396 ) ) ( not ( = ?auto_24383 ?auto_24397 ) ) ( IS-CRATE ?auto_24371 ) ( not ( = ?auto_24419 ?auto_24387 ) ) ( HOIST-AT ?auto_24417 ?auto_24419 ) ( AVAILABLE ?auto_24417 ) ( SURFACE-AT ?auto_24371 ?auto_24419 ) ( ON ?auto_24371 ?auto_24395 ) ( CLEAR ?auto_24371 ) ( not ( = ?auto_24370 ?auto_24371 ) ) ( not ( = ?auto_24370 ?auto_24395 ) ) ( not ( = ?auto_24371 ?auto_24395 ) ) ( not ( = ?auto_24383 ?auto_24417 ) ) ( IS-CRATE ?auto_24370 ) ( AVAILABLE ?auto_24385 ) ( SURFACE-AT ?auto_24370 ?auto_24388 ) ( ON ?auto_24370 ?auto_24391 ) ( CLEAR ?auto_24370 ) ( not ( = ?auto_24369 ?auto_24370 ) ) ( not ( = ?auto_24369 ?auto_24391 ) ) ( not ( = ?auto_24370 ?auto_24391 ) ) ( IS-CRATE ?auto_24369 ) ( not ( = ?auto_24412 ?auto_24387 ) ) ( HOIST-AT ?auto_24401 ?auto_24412 ) ( AVAILABLE ?auto_24401 ) ( SURFACE-AT ?auto_24369 ?auto_24412 ) ( ON ?auto_24369 ?auto_24425 ) ( CLEAR ?auto_24369 ) ( not ( = ?auto_24368 ?auto_24369 ) ) ( not ( = ?auto_24368 ?auto_24425 ) ) ( not ( = ?auto_24369 ?auto_24425 ) ) ( not ( = ?auto_24383 ?auto_24401 ) ) ( SURFACE-AT ?auto_24367 ?auto_24387 ) ( CLEAR ?auto_24367 ) ( IS-CRATE ?auto_24368 ) ( AVAILABLE ?auto_24383 ) ( not ( = ?auto_24400 ?auto_24387 ) ) ( HOIST-AT ?auto_24389 ?auto_24400 ) ( AVAILABLE ?auto_24389 ) ( SURFACE-AT ?auto_24368 ?auto_24400 ) ( ON ?auto_24368 ?auto_24402 ) ( CLEAR ?auto_24368 ) ( TRUCK-AT ?auto_24386 ?auto_24387 ) ( not ( = ?auto_24367 ?auto_24368 ) ) ( not ( = ?auto_24367 ?auto_24402 ) ) ( not ( = ?auto_24368 ?auto_24402 ) ) ( not ( = ?auto_24383 ?auto_24389 ) ) ( not ( = ?auto_24367 ?auto_24369 ) ) ( not ( = ?auto_24367 ?auto_24425 ) ) ( not ( = ?auto_24369 ?auto_24402 ) ) ( not ( = ?auto_24412 ?auto_24400 ) ) ( not ( = ?auto_24401 ?auto_24389 ) ) ( not ( = ?auto_24425 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24370 ) ) ( not ( = ?auto_24367 ?auto_24391 ) ) ( not ( = ?auto_24368 ?auto_24370 ) ) ( not ( = ?auto_24368 ?auto_24391 ) ) ( not ( = ?auto_24370 ?auto_24425 ) ) ( not ( = ?auto_24370 ?auto_24402 ) ) ( not ( = ?auto_24388 ?auto_24412 ) ) ( not ( = ?auto_24388 ?auto_24400 ) ) ( not ( = ?auto_24385 ?auto_24401 ) ) ( not ( = ?auto_24385 ?auto_24389 ) ) ( not ( = ?auto_24391 ?auto_24425 ) ) ( not ( = ?auto_24391 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24371 ) ) ( not ( = ?auto_24367 ?auto_24395 ) ) ( not ( = ?auto_24368 ?auto_24371 ) ) ( not ( = ?auto_24368 ?auto_24395 ) ) ( not ( = ?auto_24369 ?auto_24371 ) ) ( not ( = ?auto_24369 ?auto_24395 ) ) ( not ( = ?auto_24371 ?auto_24391 ) ) ( not ( = ?auto_24371 ?auto_24425 ) ) ( not ( = ?auto_24371 ?auto_24402 ) ) ( not ( = ?auto_24419 ?auto_24388 ) ) ( not ( = ?auto_24419 ?auto_24412 ) ) ( not ( = ?auto_24419 ?auto_24400 ) ) ( not ( = ?auto_24417 ?auto_24385 ) ) ( not ( = ?auto_24417 ?auto_24401 ) ) ( not ( = ?auto_24417 ?auto_24389 ) ) ( not ( = ?auto_24395 ?auto_24391 ) ) ( not ( = ?auto_24395 ?auto_24425 ) ) ( not ( = ?auto_24395 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24374 ) ) ( not ( = ?auto_24367 ?auto_24396 ) ) ( not ( = ?auto_24368 ?auto_24374 ) ) ( not ( = ?auto_24368 ?auto_24396 ) ) ( not ( = ?auto_24369 ?auto_24374 ) ) ( not ( = ?auto_24369 ?auto_24396 ) ) ( not ( = ?auto_24370 ?auto_24374 ) ) ( not ( = ?auto_24370 ?auto_24396 ) ) ( not ( = ?auto_24374 ?auto_24395 ) ) ( not ( = ?auto_24374 ?auto_24391 ) ) ( not ( = ?auto_24374 ?auto_24425 ) ) ( not ( = ?auto_24374 ?auto_24402 ) ) ( not ( = ?auto_24413 ?auto_24419 ) ) ( not ( = ?auto_24413 ?auto_24388 ) ) ( not ( = ?auto_24413 ?auto_24412 ) ) ( not ( = ?auto_24413 ?auto_24400 ) ) ( not ( = ?auto_24397 ?auto_24417 ) ) ( not ( = ?auto_24397 ?auto_24385 ) ) ( not ( = ?auto_24397 ?auto_24401 ) ) ( not ( = ?auto_24397 ?auto_24389 ) ) ( not ( = ?auto_24396 ?auto_24395 ) ) ( not ( = ?auto_24396 ?auto_24391 ) ) ( not ( = ?auto_24396 ?auto_24425 ) ) ( not ( = ?auto_24396 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24372 ) ) ( not ( = ?auto_24367 ?auto_24409 ) ) ( not ( = ?auto_24368 ?auto_24372 ) ) ( not ( = ?auto_24368 ?auto_24409 ) ) ( not ( = ?auto_24369 ?auto_24372 ) ) ( not ( = ?auto_24369 ?auto_24409 ) ) ( not ( = ?auto_24370 ?auto_24372 ) ) ( not ( = ?auto_24370 ?auto_24409 ) ) ( not ( = ?auto_24371 ?auto_24372 ) ) ( not ( = ?auto_24371 ?auto_24409 ) ) ( not ( = ?auto_24372 ?auto_24396 ) ) ( not ( = ?auto_24372 ?auto_24395 ) ) ( not ( = ?auto_24372 ?auto_24391 ) ) ( not ( = ?auto_24372 ?auto_24425 ) ) ( not ( = ?auto_24372 ?auto_24402 ) ) ( not ( = ?auto_24414 ?auto_24413 ) ) ( not ( = ?auto_24414 ?auto_24419 ) ) ( not ( = ?auto_24414 ?auto_24388 ) ) ( not ( = ?auto_24414 ?auto_24412 ) ) ( not ( = ?auto_24414 ?auto_24400 ) ) ( not ( = ?auto_24422 ?auto_24397 ) ) ( not ( = ?auto_24422 ?auto_24417 ) ) ( not ( = ?auto_24422 ?auto_24385 ) ) ( not ( = ?auto_24422 ?auto_24401 ) ) ( not ( = ?auto_24422 ?auto_24389 ) ) ( not ( = ?auto_24409 ?auto_24396 ) ) ( not ( = ?auto_24409 ?auto_24395 ) ) ( not ( = ?auto_24409 ?auto_24391 ) ) ( not ( = ?auto_24409 ?auto_24425 ) ) ( not ( = ?auto_24409 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24376 ) ) ( not ( = ?auto_24367 ?auto_24416 ) ) ( not ( = ?auto_24368 ?auto_24376 ) ) ( not ( = ?auto_24368 ?auto_24416 ) ) ( not ( = ?auto_24369 ?auto_24376 ) ) ( not ( = ?auto_24369 ?auto_24416 ) ) ( not ( = ?auto_24370 ?auto_24376 ) ) ( not ( = ?auto_24370 ?auto_24416 ) ) ( not ( = ?auto_24371 ?auto_24376 ) ) ( not ( = ?auto_24371 ?auto_24416 ) ) ( not ( = ?auto_24374 ?auto_24376 ) ) ( not ( = ?auto_24374 ?auto_24416 ) ) ( not ( = ?auto_24376 ?auto_24409 ) ) ( not ( = ?auto_24376 ?auto_24396 ) ) ( not ( = ?auto_24376 ?auto_24395 ) ) ( not ( = ?auto_24376 ?auto_24391 ) ) ( not ( = ?auto_24376 ?auto_24425 ) ) ( not ( = ?auto_24376 ?auto_24402 ) ) ( not ( = ?auto_24404 ?auto_24414 ) ) ( not ( = ?auto_24404 ?auto_24413 ) ) ( not ( = ?auto_24404 ?auto_24419 ) ) ( not ( = ?auto_24404 ?auto_24388 ) ) ( not ( = ?auto_24404 ?auto_24412 ) ) ( not ( = ?auto_24404 ?auto_24400 ) ) ( not ( = ?auto_24410 ?auto_24422 ) ) ( not ( = ?auto_24410 ?auto_24397 ) ) ( not ( = ?auto_24410 ?auto_24417 ) ) ( not ( = ?auto_24410 ?auto_24385 ) ) ( not ( = ?auto_24410 ?auto_24401 ) ) ( not ( = ?auto_24410 ?auto_24389 ) ) ( not ( = ?auto_24416 ?auto_24409 ) ) ( not ( = ?auto_24416 ?auto_24396 ) ) ( not ( = ?auto_24416 ?auto_24395 ) ) ( not ( = ?auto_24416 ?auto_24391 ) ) ( not ( = ?auto_24416 ?auto_24425 ) ) ( not ( = ?auto_24416 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24375 ) ) ( not ( = ?auto_24367 ?auto_24418 ) ) ( not ( = ?auto_24368 ?auto_24375 ) ) ( not ( = ?auto_24368 ?auto_24418 ) ) ( not ( = ?auto_24369 ?auto_24375 ) ) ( not ( = ?auto_24369 ?auto_24418 ) ) ( not ( = ?auto_24370 ?auto_24375 ) ) ( not ( = ?auto_24370 ?auto_24418 ) ) ( not ( = ?auto_24371 ?auto_24375 ) ) ( not ( = ?auto_24371 ?auto_24418 ) ) ( not ( = ?auto_24374 ?auto_24375 ) ) ( not ( = ?auto_24374 ?auto_24418 ) ) ( not ( = ?auto_24372 ?auto_24375 ) ) ( not ( = ?auto_24372 ?auto_24418 ) ) ( not ( = ?auto_24375 ?auto_24416 ) ) ( not ( = ?auto_24375 ?auto_24409 ) ) ( not ( = ?auto_24375 ?auto_24396 ) ) ( not ( = ?auto_24375 ?auto_24395 ) ) ( not ( = ?auto_24375 ?auto_24391 ) ) ( not ( = ?auto_24375 ?auto_24425 ) ) ( not ( = ?auto_24375 ?auto_24402 ) ) ( not ( = ?auto_24418 ?auto_24416 ) ) ( not ( = ?auto_24418 ?auto_24409 ) ) ( not ( = ?auto_24418 ?auto_24396 ) ) ( not ( = ?auto_24418 ?auto_24395 ) ) ( not ( = ?auto_24418 ?auto_24391 ) ) ( not ( = ?auto_24418 ?auto_24425 ) ) ( not ( = ?auto_24418 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24373 ) ) ( not ( = ?auto_24367 ?auto_24392 ) ) ( not ( = ?auto_24368 ?auto_24373 ) ) ( not ( = ?auto_24368 ?auto_24392 ) ) ( not ( = ?auto_24369 ?auto_24373 ) ) ( not ( = ?auto_24369 ?auto_24392 ) ) ( not ( = ?auto_24370 ?auto_24373 ) ) ( not ( = ?auto_24370 ?auto_24392 ) ) ( not ( = ?auto_24371 ?auto_24373 ) ) ( not ( = ?auto_24371 ?auto_24392 ) ) ( not ( = ?auto_24374 ?auto_24373 ) ) ( not ( = ?auto_24374 ?auto_24392 ) ) ( not ( = ?auto_24372 ?auto_24373 ) ) ( not ( = ?auto_24372 ?auto_24392 ) ) ( not ( = ?auto_24376 ?auto_24373 ) ) ( not ( = ?auto_24376 ?auto_24392 ) ) ( not ( = ?auto_24373 ?auto_24418 ) ) ( not ( = ?auto_24373 ?auto_24416 ) ) ( not ( = ?auto_24373 ?auto_24409 ) ) ( not ( = ?auto_24373 ?auto_24396 ) ) ( not ( = ?auto_24373 ?auto_24395 ) ) ( not ( = ?auto_24373 ?auto_24391 ) ) ( not ( = ?auto_24373 ?auto_24425 ) ) ( not ( = ?auto_24373 ?auto_24402 ) ) ( not ( = ?auto_24407 ?auto_24404 ) ) ( not ( = ?auto_24407 ?auto_24414 ) ) ( not ( = ?auto_24407 ?auto_24413 ) ) ( not ( = ?auto_24407 ?auto_24419 ) ) ( not ( = ?auto_24407 ?auto_24388 ) ) ( not ( = ?auto_24407 ?auto_24412 ) ) ( not ( = ?auto_24407 ?auto_24400 ) ) ( not ( = ?auto_24420 ?auto_24410 ) ) ( not ( = ?auto_24420 ?auto_24422 ) ) ( not ( = ?auto_24420 ?auto_24397 ) ) ( not ( = ?auto_24420 ?auto_24417 ) ) ( not ( = ?auto_24420 ?auto_24385 ) ) ( not ( = ?auto_24420 ?auto_24401 ) ) ( not ( = ?auto_24420 ?auto_24389 ) ) ( not ( = ?auto_24392 ?auto_24418 ) ) ( not ( = ?auto_24392 ?auto_24416 ) ) ( not ( = ?auto_24392 ?auto_24409 ) ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( not ( = ?auto_24392 ?auto_24395 ) ) ( not ( = ?auto_24392 ?auto_24391 ) ) ( not ( = ?auto_24392 ?auto_24425 ) ) ( not ( = ?auto_24392 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24378 ) ) ( not ( = ?auto_24367 ?auto_24415 ) ) ( not ( = ?auto_24368 ?auto_24378 ) ) ( not ( = ?auto_24368 ?auto_24415 ) ) ( not ( = ?auto_24369 ?auto_24378 ) ) ( not ( = ?auto_24369 ?auto_24415 ) ) ( not ( = ?auto_24370 ?auto_24378 ) ) ( not ( = ?auto_24370 ?auto_24415 ) ) ( not ( = ?auto_24371 ?auto_24378 ) ) ( not ( = ?auto_24371 ?auto_24415 ) ) ( not ( = ?auto_24374 ?auto_24378 ) ) ( not ( = ?auto_24374 ?auto_24415 ) ) ( not ( = ?auto_24372 ?auto_24378 ) ) ( not ( = ?auto_24372 ?auto_24415 ) ) ( not ( = ?auto_24376 ?auto_24378 ) ) ( not ( = ?auto_24376 ?auto_24415 ) ) ( not ( = ?auto_24375 ?auto_24378 ) ) ( not ( = ?auto_24375 ?auto_24415 ) ) ( not ( = ?auto_24378 ?auto_24392 ) ) ( not ( = ?auto_24378 ?auto_24418 ) ) ( not ( = ?auto_24378 ?auto_24416 ) ) ( not ( = ?auto_24378 ?auto_24409 ) ) ( not ( = ?auto_24378 ?auto_24396 ) ) ( not ( = ?auto_24378 ?auto_24395 ) ) ( not ( = ?auto_24378 ?auto_24391 ) ) ( not ( = ?auto_24378 ?auto_24425 ) ) ( not ( = ?auto_24378 ?auto_24402 ) ) ( not ( = ?auto_24398 ?auto_24407 ) ) ( not ( = ?auto_24398 ?auto_24404 ) ) ( not ( = ?auto_24398 ?auto_24414 ) ) ( not ( = ?auto_24398 ?auto_24413 ) ) ( not ( = ?auto_24398 ?auto_24419 ) ) ( not ( = ?auto_24398 ?auto_24388 ) ) ( not ( = ?auto_24398 ?auto_24412 ) ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24426 ?auto_24420 ) ) ( not ( = ?auto_24426 ?auto_24410 ) ) ( not ( = ?auto_24426 ?auto_24422 ) ) ( not ( = ?auto_24426 ?auto_24397 ) ) ( not ( = ?auto_24426 ?auto_24417 ) ) ( not ( = ?auto_24426 ?auto_24385 ) ) ( not ( = ?auto_24426 ?auto_24401 ) ) ( not ( = ?auto_24426 ?auto_24389 ) ) ( not ( = ?auto_24415 ?auto_24392 ) ) ( not ( = ?auto_24415 ?auto_24418 ) ) ( not ( = ?auto_24415 ?auto_24416 ) ) ( not ( = ?auto_24415 ?auto_24409 ) ) ( not ( = ?auto_24415 ?auto_24396 ) ) ( not ( = ?auto_24415 ?auto_24395 ) ) ( not ( = ?auto_24415 ?auto_24391 ) ) ( not ( = ?auto_24415 ?auto_24425 ) ) ( not ( = ?auto_24415 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24377 ) ) ( not ( = ?auto_24367 ?auto_24406 ) ) ( not ( = ?auto_24368 ?auto_24377 ) ) ( not ( = ?auto_24368 ?auto_24406 ) ) ( not ( = ?auto_24369 ?auto_24377 ) ) ( not ( = ?auto_24369 ?auto_24406 ) ) ( not ( = ?auto_24370 ?auto_24377 ) ) ( not ( = ?auto_24370 ?auto_24406 ) ) ( not ( = ?auto_24371 ?auto_24377 ) ) ( not ( = ?auto_24371 ?auto_24406 ) ) ( not ( = ?auto_24374 ?auto_24377 ) ) ( not ( = ?auto_24374 ?auto_24406 ) ) ( not ( = ?auto_24372 ?auto_24377 ) ) ( not ( = ?auto_24372 ?auto_24406 ) ) ( not ( = ?auto_24376 ?auto_24377 ) ) ( not ( = ?auto_24376 ?auto_24406 ) ) ( not ( = ?auto_24375 ?auto_24377 ) ) ( not ( = ?auto_24375 ?auto_24406 ) ) ( not ( = ?auto_24373 ?auto_24377 ) ) ( not ( = ?auto_24373 ?auto_24406 ) ) ( not ( = ?auto_24377 ?auto_24415 ) ) ( not ( = ?auto_24377 ?auto_24392 ) ) ( not ( = ?auto_24377 ?auto_24418 ) ) ( not ( = ?auto_24377 ?auto_24416 ) ) ( not ( = ?auto_24377 ?auto_24409 ) ) ( not ( = ?auto_24377 ?auto_24396 ) ) ( not ( = ?auto_24377 ?auto_24395 ) ) ( not ( = ?auto_24377 ?auto_24391 ) ) ( not ( = ?auto_24377 ?auto_24425 ) ) ( not ( = ?auto_24377 ?auto_24402 ) ) ( not ( = ?auto_24399 ?auto_24398 ) ) ( not ( = ?auto_24399 ?auto_24407 ) ) ( not ( = ?auto_24399 ?auto_24404 ) ) ( not ( = ?auto_24399 ?auto_24414 ) ) ( not ( = ?auto_24399 ?auto_24413 ) ) ( not ( = ?auto_24399 ?auto_24419 ) ) ( not ( = ?auto_24399 ?auto_24388 ) ) ( not ( = ?auto_24399 ?auto_24412 ) ) ( not ( = ?auto_24399 ?auto_24400 ) ) ( not ( = ?auto_24394 ?auto_24426 ) ) ( not ( = ?auto_24394 ?auto_24420 ) ) ( not ( = ?auto_24394 ?auto_24410 ) ) ( not ( = ?auto_24394 ?auto_24422 ) ) ( not ( = ?auto_24394 ?auto_24397 ) ) ( not ( = ?auto_24394 ?auto_24417 ) ) ( not ( = ?auto_24394 ?auto_24385 ) ) ( not ( = ?auto_24394 ?auto_24401 ) ) ( not ( = ?auto_24394 ?auto_24389 ) ) ( not ( = ?auto_24406 ?auto_24415 ) ) ( not ( = ?auto_24406 ?auto_24392 ) ) ( not ( = ?auto_24406 ?auto_24418 ) ) ( not ( = ?auto_24406 ?auto_24416 ) ) ( not ( = ?auto_24406 ?auto_24409 ) ) ( not ( = ?auto_24406 ?auto_24396 ) ) ( not ( = ?auto_24406 ?auto_24395 ) ) ( not ( = ?auto_24406 ?auto_24391 ) ) ( not ( = ?auto_24406 ?auto_24425 ) ) ( not ( = ?auto_24406 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24379 ) ) ( not ( = ?auto_24367 ?auto_24403 ) ) ( not ( = ?auto_24368 ?auto_24379 ) ) ( not ( = ?auto_24368 ?auto_24403 ) ) ( not ( = ?auto_24369 ?auto_24379 ) ) ( not ( = ?auto_24369 ?auto_24403 ) ) ( not ( = ?auto_24370 ?auto_24379 ) ) ( not ( = ?auto_24370 ?auto_24403 ) ) ( not ( = ?auto_24371 ?auto_24379 ) ) ( not ( = ?auto_24371 ?auto_24403 ) ) ( not ( = ?auto_24374 ?auto_24379 ) ) ( not ( = ?auto_24374 ?auto_24403 ) ) ( not ( = ?auto_24372 ?auto_24379 ) ) ( not ( = ?auto_24372 ?auto_24403 ) ) ( not ( = ?auto_24376 ?auto_24379 ) ) ( not ( = ?auto_24376 ?auto_24403 ) ) ( not ( = ?auto_24375 ?auto_24379 ) ) ( not ( = ?auto_24375 ?auto_24403 ) ) ( not ( = ?auto_24373 ?auto_24379 ) ) ( not ( = ?auto_24373 ?auto_24403 ) ) ( not ( = ?auto_24378 ?auto_24379 ) ) ( not ( = ?auto_24378 ?auto_24403 ) ) ( not ( = ?auto_24379 ?auto_24406 ) ) ( not ( = ?auto_24379 ?auto_24415 ) ) ( not ( = ?auto_24379 ?auto_24392 ) ) ( not ( = ?auto_24379 ?auto_24418 ) ) ( not ( = ?auto_24379 ?auto_24416 ) ) ( not ( = ?auto_24379 ?auto_24409 ) ) ( not ( = ?auto_24379 ?auto_24396 ) ) ( not ( = ?auto_24379 ?auto_24395 ) ) ( not ( = ?auto_24379 ?auto_24391 ) ) ( not ( = ?auto_24379 ?auto_24425 ) ) ( not ( = ?auto_24379 ?auto_24402 ) ) ( not ( = ?auto_24411 ?auto_24399 ) ) ( not ( = ?auto_24411 ?auto_24398 ) ) ( not ( = ?auto_24411 ?auto_24407 ) ) ( not ( = ?auto_24411 ?auto_24404 ) ) ( not ( = ?auto_24411 ?auto_24414 ) ) ( not ( = ?auto_24411 ?auto_24413 ) ) ( not ( = ?auto_24411 ?auto_24419 ) ) ( not ( = ?auto_24411 ?auto_24388 ) ) ( not ( = ?auto_24411 ?auto_24412 ) ) ( not ( = ?auto_24411 ?auto_24400 ) ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24426 ) ) ( not ( = ?auto_24393 ?auto_24420 ) ) ( not ( = ?auto_24393 ?auto_24410 ) ) ( not ( = ?auto_24393 ?auto_24422 ) ) ( not ( = ?auto_24393 ?auto_24397 ) ) ( not ( = ?auto_24393 ?auto_24417 ) ) ( not ( = ?auto_24393 ?auto_24385 ) ) ( not ( = ?auto_24393 ?auto_24401 ) ) ( not ( = ?auto_24393 ?auto_24389 ) ) ( not ( = ?auto_24403 ?auto_24406 ) ) ( not ( = ?auto_24403 ?auto_24415 ) ) ( not ( = ?auto_24403 ?auto_24392 ) ) ( not ( = ?auto_24403 ?auto_24418 ) ) ( not ( = ?auto_24403 ?auto_24416 ) ) ( not ( = ?auto_24403 ?auto_24409 ) ) ( not ( = ?auto_24403 ?auto_24396 ) ) ( not ( = ?auto_24403 ?auto_24395 ) ) ( not ( = ?auto_24403 ?auto_24391 ) ) ( not ( = ?auto_24403 ?auto_24425 ) ) ( not ( = ?auto_24403 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24381 ) ) ( not ( = ?auto_24367 ?auto_24424 ) ) ( not ( = ?auto_24368 ?auto_24381 ) ) ( not ( = ?auto_24368 ?auto_24424 ) ) ( not ( = ?auto_24369 ?auto_24381 ) ) ( not ( = ?auto_24369 ?auto_24424 ) ) ( not ( = ?auto_24370 ?auto_24381 ) ) ( not ( = ?auto_24370 ?auto_24424 ) ) ( not ( = ?auto_24371 ?auto_24381 ) ) ( not ( = ?auto_24371 ?auto_24424 ) ) ( not ( = ?auto_24374 ?auto_24381 ) ) ( not ( = ?auto_24374 ?auto_24424 ) ) ( not ( = ?auto_24372 ?auto_24381 ) ) ( not ( = ?auto_24372 ?auto_24424 ) ) ( not ( = ?auto_24376 ?auto_24381 ) ) ( not ( = ?auto_24376 ?auto_24424 ) ) ( not ( = ?auto_24375 ?auto_24381 ) ) ( not ( = ?auto_24375 ?auto_24424 ) ) ( not ( = ?auto_24373 ?auto_24381 ) ) ( not ( = ?auto_24373 ?auto_24424 ) ) ( not ( = ?auto_24378 ?auto_24381 ) ) ( not ( = ?auto_24378 ?auto_24424 ) ) ( not ( = ?auto_24377 ?auto_24381 ) ) ( not ( = ?auto_24377 ?auto_24424 ) ) ( not ( = ?auto_24381 ?auto_24403 ) ) ( not ( = ?auto_24381 ?auto_24406 ) ) ( not ( = ?auto_24381 ?auto_24415 ) ) ( not ( = ?auto_24381 ?auto_24392 ) ) ( not ( = ?auto_24381 ?auto_24418 ) ) ( not ( = ?auto_24381 ?auto_24416 ) ) ( not ( = ?auto_24381 ?auto_24409 ) ) ( not ( = ?auto_24381 ?auto_24396 ) ) ( not ( = ?auto_24381 ?auto_24395 ) ) ( not ( = ?auto_24381 ?auto_24391 ) ) ( not ( = ?auto_24381 ?auto_24425 ) ) ( not ( = ?auto_24381 ?auto_24402 ) ) ( not ( = ?auto_24421 ?auto_24411 ) ) ( not ( = ?auto_24421 ?auto_24399 ) ) ( not ( = ?auto_24421 ?auto_24398 ) ) ( not ( = ?auto_24421 ?auto_24407 ) ) ( not ( = ?auto_24421 ?auto_24404 ) ) ( not ( = ?auto_24421 ?auto_24414 ) ) ( not ( = ?auto_24421 ?auto_24413 ) ) ( not ( = ?auto_24421 ?auto_24419 ) ) ( not ( = ?auto_24421 ?auto_24388 ) ) ( not ( = ?auto_24421 ?auto_24412 ) ) ( not ( = ?auto_24421 ?auto_24400 ) ) ( not ( = ?auto_24405 ?auto_24393 ) ) ( not ( = ?auto_24405 ?auto_24394 ) ) ( not ( = ?auto_24405 ?auto_24426 ) ) ( not ( = ?auto_24405 ?auto_24420 ) ) ( not ( = ?auto_24405 ?auto_24410 ) ) ( not ( = ?auto_24405 ?auto_24422 ) ) ( not ( = ?auto_24405 ?auto_24397 ) ) ( not ( = ?auto_24405 ?auto_24417 ) ) ( not ( = ?auto_24405 ?auto_24385 ) ) ( not ( = ?auto_24405 ?auto_24401 ) ) ( not ( = ?auto_24405 ?auto_24389 ) ) ( not ( = ?auto_24424 ?auto_24403 ) ) ( not ( = ?auto_24424 ?auto_24406 ) ) ( not ( = ?auto_24424 ?auto_24415 ) ) ( not ( = ?auto_24424 ?auto_24392 ) ) ( not ( = ?auto_24424 ?auto_24418 ) ) ( not ( = ?auto_24424 ?auto_24416 ) ) ( not ( = ?auto_24424 ?auto_24409 ) ) ( not ( = ?auto_24424 ?auto_24396 ) ) ( not ( = ?auto_24424 ?auto_24395 ) ) ( not ( = ?auto_24424 ?auto_24391 ) ) ( not ( = ?auto_24424 ?auto_24425 ) ) ( not ( = ?auto_24424 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24382 ) ) ( not ( = ?auto_24367 ?auto_24390 ) ) ( not ( = ?auto_24368 ?auto_24382 ) ) ( not ( = ?auto_24368 ?auto_24390 ) ) ( not ( = ?auto_24369 ?auto_24382 ) ) ( not ( = ?auto_24369 ?auto_24390 ) ) ( not ( = ?auto_24370 ?auto_24382 ) ) ( not ( = ?auto_24370 ?auto_24390 ) ) ( not ( = ?auto_24371 ?auto_24382 ) ) ( not ( = ?auto_24371 ?auto_24390 ) ) ( not ( = ?auto_24374 ?auto_24382 ) ) ( not ( = ?auto_24374 ?auto_24390 ) ) ( not ( = ?auto_24372 ?auto_24382 ) ) ( not ( = ?auto_24372 ?auto_24390 ) ) ( not ( = ?auto_24376 ?auto_24382 ) ) ( not ( = ?auto_24376 ?auto_24390 ) ) ( not ( = ?auto_24375 ?auto_24382 ) ) ( not ( = ?auto_24375 ?auto_24390 ) ) ( not ( = ?auto_24373 ?auto_24382 ) ) ( not ( = ?auto_24373 ?auto_24390 ) ) ( not ( = ?auto_24378 ?auto_24382 ) ) ( not ( = ?auto_24378 ?auto_24390 ) ) ( not ( = ?auto_24377 ?auto_24382 ) ) ( not ( = ?auto_24377 ?auto_24390 ) ) ( not ( = ?auto_24379 ?auto_24382 ) ) ( not ( = ?auto_24379 ?auto_24390 ) ) ( not ( = ?auto_24382 ?auto_24424 ) ) ( not ( = ?auto_24382 ?auto_24403 ) ) ( not ( = ?auto_24382 ?auto_24406 ) ) ( not ( = ?auto_24382 ?auto_24415 ) ) ( not ( = ?auto_24382 ?auto_24392 ) ) ( not ( = ?auto_24382 ?auto_24418 ) ) ( not ( = ?auto_24382 ?auto_24416 ) ) ( not ( = ?auto_24382 ?auto_24409 ) ) ( not ( = ?auto_24382 ?auto_24396 ) ) ( not ( = ?auto_24382 ?auto_24395 ) ) ( not ( = ?auto_24382 ?auto_24391 ) ) ( not ( = ?auto_24382 ?auto_24425 ) ) ( not ( = ?auto_24382 ?auto_24402 ) ) ( not ( = ?auto_24423 ?auto_24421 ) ) ( not ( = ?auto_24423 ?auto_24411 ) ) ( not ( = ?auto_24423 ?auto_24399 ) ) ( not ( = ?auto_24423 ?auto_24398 ) ) ( not ( = ?auto_24423 ?auto_24407 ) ) ( not ( = ?auto_24423 ?auto_24404 ) ) ( not ( = ?auto_24423 ?auto_24414 ) ) ( not ( = ?auto_24423 ?auto_24413 ) ) ( not ( = ?auto_24423 ?auto_24419 ) ) ( not ( = ?auto_24423 ?auto_24388 ) ) ( not ( = ?auto_24423 ?auto_24412 ) ) ( not ( = ?auto_24423 ?auto_24400 ) ) ( not ( = ?auto_24408 ?auto_24405 ) ) ( not ( = ?auto_24408 ?auto_24393 ) ) ( not ( = ?auto_24408 ?auto_24394 ) ) ( not ( = ?auto_24408 ?auto_24426 ) ) ( not ( = ?auto_24408 ?auto_24420 ) ) ( not ( = ?auto_24408 ?auto_24410 ) ) ( not ( = ?auto_24408 ?auto_24422 ) ) ( not ( = ?auto_24408 ?auto_24397 ) ) ( not ( = ?auto_24408 ?auto_24417 ) ) ( not ( = ?auto_24408 ?auto_24385 ) ) ( not ( = ?auto_24408 ?auto_24401 ) ) ( not ( = ?auto_24408 ?auto_24389 ) ) ( not ( = ?auto_24390 ?auto_24424 ) ) ( not ( = ?auto_24390 ?auto_24403 ) ) ( not ( = ?auto_24390 ?auto_24406 ) ) ( not ( = ?auto_24390 ?auto_24415 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24418 ) ) ( not ( = ?auto_24390 ?auto_24416 ) ) ( not ( = ?auto_24390 ?auto_24409 ) ) ( not ( = ?auto_24390 ?auto_24396 ) ) ( not ( = ?auto_24390 ?auto_24395 ) ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24425 ) ) ( not ( = ?auto_24390 ?auto_24402 ) ) ( not ( = ?auto_24367 ?auto_24380 ) ) ( not ( = ?auto_24367 ?auto_24384 ) ) ( not ( = ?auto_24368 ?auto_24380 ) ) ( not ( = ?auto_24368 ?auto_24384 ) ) ( not ( = ?auto_24369 ?auto_24380 ) ) ( not ( = ?auto_24369 ?auto_24384 ) ) ( not ( = ?auto_24370 ?auto_24380 ) ) ( not ( = ?auto_24370 ?auto_24384 ) ) ( not ( = ?auto_24371 ?auto_24380 ) ) ( not ( = ?auto_24371 ?auto_24384 ) ) ( not ( = ?auto_24374 ?auto_24380 ) ) ( not ( = ?auto_24374 ?auto_24384 ) ) ( not ( = ?auto_24372 ?auto_24380 ) ) ( not ( = ?auto_24372 ?auto_24384 ) ) ( not ( = ?auto_24376 ?auto_24380 ) ) ( not ( = ?auto_24376 ?auto_24384 ) ) ( not ( = ?auto_24375 ?auto_24380 ) ) ( not ( = ?auto_24375 ?auto_24384 ) ) ( not ( = ?auto_24373 ?auto_24380 ) ) ( not ( = ?auto_24373 ?auto_24384 ) ) ( not ( = ?auto_24378 ?auto_24380 ) ) ( not ( = ?auto_24378 ?auto_24384 ) ) ( not ( = ?auto_24377 ?auto_24380 ) ) ( not ( = ?auto_24377 ?auto_24384 ) ) ( not ( = ?auto_24379 ?auto_24380 ) ) ( not ( = ?auto_24379 ?auto_24384 ) ) ( not ( = ?auto_24381 ?auto_24380 ) ) ( not ( = ?auto_24381 ?auto_24384 ) ) ( not ( = ?auto_24380 ?auto_24390 ) ) ( not ( = ?auto_24380 ?auto_24424 ) ) ( not ( = ?auto_24380 ?auto_24403 ) ) ( not ( = ?auto_24380 ?auto_24406 ) ) ( not ( = ?auto_24380 ?auto_24415 ) ) ( not ( = ?auto_24380 ?auto_24392 ) ) ( not ( = ?auto_24380 ?auto_24418 ) ) ( not ( = ?auto_24380 ?auto_24416 ) ) ( not ( = ?auto_24380 ?auto_24409 ) ) ( not ( = ?auto_24380 ?auto_24396 ) ) ( not ( = ?auto_24380 ?auto_24395 ) ) ( not ( = ?auto_24380 ?auto_24391 ) ) ( not ( = ?auto_24380 ?auto_24425 ) ) ( not ( = ?auto_24380 ?auto_24402 ) ) ( not ( = ?auto_24384 ?auto_24390 ) ) ( not ( = ?auto_24384 ?auto_24424 ) ) ( not ( = ?auto_24384 ?auto_24403 ) ) ( not ( = ?auto_24384 ?auto_24406 ) ) ( not ( = ?auto_24384 ?auto_24415 ) ) ( not ( = ?auto_24384 ?auto_24392 ) ) ( not ( = ?auto_24384 ?auto_24418 ) ) ( not ( = ?auto_24384 ?auto_24416 ) ) ( not ( = ?auto_24384 ?auto_24409 ) ) ( not ( = ?auto_24384 ?auto_24396 ) ) ( not ( = ?auto_24384 ?auto_24395 ) ) ( not ( = ?auto_24384 ?auto_24391 ) ) ( not ( = ?auto_24384 ?auto_24425 ) ) ( not ( = ?auto_24384 ?auto_24402 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_24367 ?auto_24368 ?auto_24369 ?auto_24370 ?auto_24371 ?auto_24374 ?auto_24372 ?auto_24376 ?auto_24375 ?auto_24373 ?auto_24378 ?auto_24377 ?auto_24379 ?auto_24381 ?auto_24382 )
      ( MAKE-1CRATE ?auto_24382 ?auto_24380 )
      ( MAKE-15CRATE-VERIFY ?auto_24367 ?auto_24368 ?auto_24369 ?auto_24370 ?auto_24371 ?auto_24374 ?auto_24372 ?auto_24376 ?auto_24375 ?auto_24373 ?auto_24378 ?auto_24377 ?auto_24379 ?auto_24381 ?auto_24382 ?auto_24380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24429 - SURFACE
      ?auto_24430 - SURFACE
    )
    :vars
    (
      ?auto_24431 - HOIST
      ?auto_24432 - PLACE
      ?auto_24434 - PLACE
      ?auto_24435 - HOIST
      ?auto_24436 - SURFACE
      ?auto_24433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24431 ?auto_24432 ) ( SURFACE-AT ?auto_24429 ?auto_24432 ) ( CLEAR ?auto_24429 ) ( IS-CRATE ?auto_24430 ) ( AVAILABLE ?auto_24431 ) ( not ( = ?auto_24434 ?auto_24432 ) ) ( HOIST-AT ?auto_24435 ?auto_24434 ) ( AVAILABLE ?auto_24435 ) ( SURFACE-AT ?auto_24430 ?auto_24434 ) ( ON ?auto_24430 ?auto_24436 ) ( CLEAR ?auto_24430 ) ( TRUCK-AT ?auto_24433 ?auto_24432 ) ( not ( = ?auto_24429 ?auto_24430 ) ) ( not ( = ?auto_24429 ?auto_24436 ) ) ( not ( = ?auto_24430 ?auto_24436 ) ) ( not ( = ?auto_24431 ?auto_24435 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24433 ?auto_24432 ?auto_24434 )
      ( !LIFT ?auto_24435 ?auto_24430 ?auto_24436 ?auto_24434 )
      ( !LOAD ?auto_24435 ?auto_24430 ?auto_24433 ?auto_24434 )
      ( !DRIVE ?auto_24433 ?auto_24434 ?auto_24432 )
      ( !UNLOAD ?auto_24431 ?auto_24430 ?auto_24433 ?auto_24432 )
      ( !DROP ?auto_24431 ?auto_24430 ?auto_24429 ?auto_24432 )
      ( MAKE-1CRATE-VERIFY ?auto_24429 ?auto_24430 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_24454 - SURFACE
      ?auto_24455 - SURFACE
      ?auto_24456 - SURFACE
      ?auto_24457 - SURFACE
      ?auto_24458 - SURFACE
      ?auto_24461 - SURFACE
      ?auto_24459 - SURFACE
      ?auto_24463 - SURFACE
      ?auto_24462 - SURFACE
      ?auto_24460 - SURFACE
      ?auto_24465 - SURFACE
      ?auto_24464 - SURFACE
      ?auto_24466 - SURFACE
      ?auto_24468 - SURFACE
      ?auto_24469 - SURFACE
      ?auto_24467 - SURFACE
      ?auto_24470 - SURFACE
    )
    :vars
    (
      ?auto_24474 - HOIST
      ?auto_24475 - PLACE
      ?auto_24473 - PLACE
      ?auto_24476 - HOIST
      ?auto_24471 - SURFACE
      ?auto_24485 - PLACE
      ?auto_24492 - HOIST
      ?auto_24488 - SURFACE
      ?auto_24515 - PLACE
      ?auto_24507 - HOIST
      ?auto_24501 - SURFACE
      ?auto_24511 - PLACE
      ?auto_24500 - HOIST
      ?auto_24496 - SURFACE
      ?auto_24510 - PLACE
      ?auto_24489 - HOIST
      ?auto_24483 - SURFACE
      ?auto_24509 - PLACE
      ?auto_24508 - HOIST
      ?auto_24516 - SURFACE
      ?auto_24477 - PLACE
      ?auto_24490 - HOIST
      ?auto_24505 - SURFACE
      ?auto_24504 - PLACE
      ?auto_24481 - HOIST
      ?auto_24506 - SURFACE
      ?auto_24512 - PLACE
      ?auto_24479 - HOIST
      ?auto_24487 - SURFACE
      ?auto_24497 - SURFACE
      ?auto_24513 - PLACE
      ?auto_24478 - HOIST
      ?auto_24484 - SURFACE
      ?auto_24514 - PLACE
      ?auto_24503 - HOIST
      ?auto_24502 - SURFACE
      ?auto_24480 - PLACE
      ?auto_24482 - HOIST
      ?auto_24499 - SURFACE
      ?auto_24495 - SURFACE
      ?auto_24517 - PLACE
      ?auto_24498 - HOIST
      ?auto_24486 - SURFACE
      ?auto_24494 - PLACE
      ?auto_24491 - HOIST
      ?auto_24493 - SURFACE
      ?auto_24472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24474 ?auto_24475 ) ( IS-CRATE ?auto_24470 ) ( not ( = ?auto_24473 ?auto_24475 ) ) ( HOIST-AT ?auto_24476 ?auto_24473 ) ( AVAILABLE ?auto_24476 ) ( SURFACE-AT ?auto_24470 ?auto_24473 ) ( ON ?auto_24470 ?auto_24471 ) ( CLEAR ?auto_24470 ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( not ( = ?auto_24467 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24471 ) ) ( not ( = ?auto_24474 ?auto_24476 ) ) ( IS-CRATE ?auto_24467 ) ( not ( = ?auto_24485 ?auto_24475 ) ) ( HOIST-AT ?auto_24492 ?auto_24485 ) ( SURFACE-AT ?auto_24467 ?auto_24485 ) ( ON ?auto_24467 ?auto_24488 ) ( CLEAR ?auto_24467 ) ( not ( = ?auto_24469 ?auto_24467 ) ) ( not ( = ?auto_24469 ?auto_24488 ) ) ( not ( = ?auto_24467 ?auto_24488 ) ) ( not ( = ?auto_24474 ?auto_24492 ) ) ( IS-CRATE ?auto_24469 ) ( not ( = ?auto_24515 ?auto_24475 ) ) ( HOIST-AT ?auto_24507 ?auto_24515 ) ( AVAILABLE ?auto_24507 ) ( SURFACE-AT ?auto_24469 ?auto_24515 ) ( ON ?auto_24469 ?auto_24501 ) ( CLEAR ?auto_24469 ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24501 ) ) ( not ( = ?auto_24469 ?auto_24501 ) ) ( not ( = ?auto_24474 ?auto_24507 ) ) ( IS-CRATE ?auto_24468 ) ( not ( = ?auto_24511 ?auto_24475 ) ) ( HOIST-AT ?auto_24500 ?auto_24511 ) ( AVAILABLE ?auto_24500 ) ( SURFACE-AT ?auto_24468 ?auto_24511 ) ( ON ?auto_24468 ?auto_24496 ) ( CLEAR ?auto_24468 ) ( not ( = ?auto_24466 ?auto_24468 ) ) ( not ( = ?auto_24466 ?auto_24496 ) ) ( not ( = ?auto_24468 ?auto_24496 ) ) ( not ( = ?auto_24474 ?auto_24500 ) ) ( IS-CRATE ?auto_24466 ) ( not ( = ?auto_24510 ?auto_24475 ) ) ( HOIST-AT ?auto_24489 ?auto_24510 ) ( AVAILABLE ?auto_24489 ) ( SURFACE-AT ?auto_24466 ?auto_24510 ) ( ON ?auto_24466 ?auto_24483 ) ( CLEAR ?auto_24466 ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24483 ) ) ( not ( = ?auto_24466 ?auto_24483 ) ) ( not ( = ?auto_24474 ?auto_24489 ) ) ( IS-CRATE ?auto_24464 ) ( not ( = ?auto_24509 ?auto_24475 ) ) ( HOIST-AT ?auto_24508 ?auto_24509 ) ( AVAILABLE ?auto_24508 ) ( SURFACE-AT ?auto_24464 ?auto_24509 ) ( ON ?auto_24464 ?auto_24516 ) ( CLEAR ?auto_24464 ) ( not ( = ?auto_24465 ?auto_24464 ) ) ( not ( = ?auto_24465 ?auto_24516 ) ) ( not ( = ?auto_24464 ?auto_24516 ) ) ( not ( = ?auto_24474 ?auto_24508 ) ) ( IS-CRATE ?auto_24465 ) ( not ( = ?auto_24477 ?auto_24475 ) ) ( HOIST-AT ?auto_24490 ?auto_24477 ) ( AVAILABLE ?auto_24490 ) ( SURFACE-AT ?auto_24465 ?auto_24477 ) ( ON ?auto_24465 ?auto_24505 ) ( CLEAR ?auto_24465 ) ( not ( = ?auto_24460 ?auto_24465 ) ) ( not ( = ?auto_24460 ?auto_24505 ) ) ( not ( = ?auto_24465 ?auto_24505 ) ) ( not ( = ?auto_24474 ?auto_24490 ) ) ( IS-CRATE ?auto_24460 ) ( not ( = ?auto_24504 ?auto_24475 ) ) ( HOIST-AT ?auto_24481 ?auto_24504 ) ( AVAILABLE ?auto_24481 ) ( SURFACE-AT ?auto_24460 ?auto_24504 ) ( ON ?auto_24460 ?auto_24506 ) ( CLEAR ?auto_24460 ) ( not ( = ?auto_24462 ?auto_24460 ) ) ( not ( = ?auto_24462 ?auto_24506 ) ) ( not ( = ?auto_24460 ?auto_24506 ) ) ( not ( = ?auto_24474 ?auto_24481 ) ) ( IS-CRATE ?auto_24462 ) ( not ( = ?auto_24512 ?auto_24475 ) ) ( HOIST-AT ?auto_24479 ?auto_24512 ) ( SURFACE-AT ?auto_24462 ?auto_24512 ) ( ON ?auto_24462 ?auto_24487 ) ( CLEAR ?auto_24462 ) ( not ( = ?auto_24463 ?auto_24462 ) ) ( not ( = ?auto_24463 ?auto_24487 ) ) ( not ( = ?auto_24462 ?auto_24487 ) ) ( not ( = ?auto_24474 ?auto_24479 ) ) ( IS-CRATE ?auto_24463 ) ( AVAILABLE ?auto_24479 ) ( SURFACE-AT ?auto_24463 ?auto_24512 ) ( ON ?auto_24463 ?auto_24497 ) ( CLEAR ?auto_24463 ) ( not ( = ?auto_24459 ?auto_24463 ) ) ( not ( = ?auto_24459 ?auto_24497 ) ) ( not ( = ?auto_24463 ?auto_24497 ) ) ( IS-CRATE ?auto_24459 ) ( not ( = ?auto_24513 ?auto_24475 ) ) ( HOIST-AT ?auto_24478 ?auto_24513 ) ( AVAILABLE ?auto_24478 ) ( SURFACE-AT ?auto_24459 ?auto_24513 ) ( ON ?auto_24459 ?auto_24484 ) ( CLEAR ?auto_24459 ) ( not ( = ?auto_24461 ?auto_24459 ) ) ( not ( = ?auto_24461 ?auto_24484 ) ) ( not ( = ?auto_24459 ?auto_24484 ) ) ( not ( = ?auto_24474 ?auto_24478 ) ) ( IS-CRATE ?auto_24461 ) ( not ( = ?auto_24514 ?auto_24475 ) ) ( HOIST-AT ?auto_24503 ?auto_24514 ) ( AVAILABLE ?auto_24503 ) ( SURFACE-AT ?auto_24461 ?auto_24514 ) ( ON ?auto_24461 ?auto_24502 ) ( CLEAR ?auto_24461 ) ( not ( = ?auto_24458 ?auto_24461 ) ) ( not ( = ?auto_24458 ?auto_24502 ) ) ( not ( = ?auto_24461 ?auto_24502 ) ) ( not ( = ?auto_24474 ?auto_24503 ) ) ( IS-CRATE ?auto_24458 ) ( not ( = ?auto_24480 ?auto_24475 ) ) ( HOIST-AT ?auto_24482 ?auto_24480 ) ( AVAILABLE ?auto_24482 ) ( SURFACE-AT ?auto_24458 ?auto_24480 ) ( ON ?auto_24458 ?auto_24499 ) ( CLEAR ?auto_24458 ) ( not ( = ?auto_24457 ?auto_24458 ) ) ( not ( = ?auto_24457 ?auto_24499 ) ) ( not ( = ?auto_24458 ?auto_24499 ) ) ( not ( = ?auto_24474 ?auto_24482 ) ) ( IS-CRATE ?auto_24457 ) ( AVAILABLE ?auto_24492 ) ( SURFACE-AT ?auto_24457 ?auto_24485 ) ( ON ?auto_24457 ?auto_24495 ) ( CLEAR ?auto_24457 ) ( not ( = ?auto_24456 ?auto_24457 ) ) ( not ( = ?auto_24456 ?auto_24495 ) ) ( not ( = ?auto_24457 ?auto_24495 ) ) ( IS-CRATE ?auto_24456 ) ( not ( = ?auto_24517 ?auto_24475 ) ) ( HOIST-AT ?auto_24498 ?auto_24517 ) ( AVAILABLE ?auto_24498 ) ( SURFACE-AT ?auto_24456 ?auto_24517 ) ( ON ?auto_24456 ?auto_24486 ) ( CLEAR ?auto_24456 ) ( not ( = ?auto_24455 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24486 ) ) ( not ( = ?auto_24456 ?auto_24486 ) ) ( not ( = ?auto_24474 ?auto_24498 ) ) ( SURFACE-AT ?auto_24454 ?auto_24475 ) ( CLEAR ?auto_24454 ) ( IS-CRATE ?auto_24455 ) ( AVAILABLE ?auto_24474 ) ( not ( = ?auto_24494 ?auto_24475 ) ) ( HOIST-AT ?auto_24491 ?auto_24494 ) ( AVAILABLE ?auto_24491 ) ( SURFACE-AT ?auto_24455 ?auto_24494 ) ( ON ?auto_24455 ?auto_24493 ) ( CLEAR ?auto_24455 ) ( TRUCK-AT ?auto_24472 ?auto_24475 ) ( not ( = ?auto_24454 ?auto_24455 ) ) ( not ( = ?auto_24454 ?auto_24493 ) ) ( not ( = ?auto_24455 ?auto_24493 ) ) ( not ( = ?auto_24474 ?auto_24491 ) ) ( not ( = ?auto_24454 ?auto_24456 ) ) ( not ( = ?auto_24454 ?auto_24486 ) ) ( not ( = ?auto_24456 ?auto_24493 ) ) ( not ( = ?auto_24517 ?auto_24494 ) ) ( not ( = ?auto_24498 ?auto_24491 ) ) ( not ( = ?auto_24486 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24457 ) ) ( not ( = ?auto_24454 ?auto_24495 ) ) ( not ( = ?auto_24455 ?auto_24457 ) ) ( not ( = ?auto_24455 ?auto_24495 ) ) ( not ( = ?auto_24457 ?auto_24486 ) ) ( not ( = ?auto_24457 ?auto_24493 ) ) ( not ( = ?auto_24485 ?auto_24517 ) ) ( not ( = ?auto_24485 ?auto_24494 ) ) ( not ( = ?auto_24492 ?auto_24498 ) ) ( not ( = ?auto_24492 ?auto_24491 ) ) ( not ( = ?auto_24495 ?auto_24486 ) ) ( not ( = ?auto_24495 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24458 ) ) ( not ( = ?auto_24454 ?auto_24499 ) ) ( not ( = ?auto_24455 ?auto_24458 ) ) ( not ( = ?auto_24455 ?auto_24499 ) ) ( not ( = ?auto_24456 ?auto_24458 ) ) ( not ( = ?auto_24456 ?auto_24499 ) ) ( not ( = ?auto_24458 ?auto_24495 ) ) ( not ( = ?auto_24458 ?auto_24486 ) ) ( not ( = ?auto_24458 ?auto_24493 ) ) ( not ( = ?auto_24480 ?auto_24485 ) ) ( not ( = ?auto_24480 ?auto_24517 ) ) ( not ( = ?auto_24480 ?auto_24494 ) ) ( not ( = ?auto_24482 ?auto_24492 ) ) ( not ( = ?auto_24482 ?auto_24498 ) ) ( not ( = ?auto_24482 ?auto_24491 ) ) ( not ( = ?auto_24499 ?auto_24495 ) ) ( not ( = ?auto_24499 ?auto_24486 ) ) ( not ( = ?auto_24499 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24461 ) ) ( not ( = ?auto_24454 ?auto_24502 ) ) ( not ( = ?auto_24455 ?auto_24461 ) ) ( not ( = ?auto_24455 ?auto_24502 ) ) ( not ( = ?auto_24456 ?auto_24461 ) ) ( not ( = ?auto_24456 ?auto_24502 ) ) ( not ( = ?auto_24457 ?auto_24461 ) ) ( not ( = ?auto_24457 ?auto_24502 ) ) ( not ( = ?auto_24461 ?auto_24499 ) ) ( not ( = ?auto_24461 ?auto_24495 ) ) ( not ( = ?auto_24461 ?auto_24486 ) ) ( not ( = ?auto_24461 ?auto_24493 ) ) ( not ( = ?auto_24514 ?auto_24480 ) ) ( not ( = ?auto_24514 ?auto_24485 ) ) ( not ( = ?auto_24514 ?auto_24517 ) ) ( not ( = ?auto_24514 ?auto_24494 ) ) ( not ( = ?auto_24503 ?auto_24482 ) ) ( not ( = ?auto_24503 ?auto_24492 ) ) ( not ( = ?auto_24503 ?auto_24498 ) ) ( not ( = ?auto_24503 ?auto_24491 ) ) ( not ( = ?auto_24502 ?auto_24499 ) ) ( not ( = ?auto_24502 ?auto_24495 ) ) ( not ( = ?auto_24502 ?auto_24486 ) ) ( not ( = ?auto_24502 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24459 ) ) ( not ( = ?auto_24454 ?auto_24484 ) ) ( not ( = ?auto_24455 ?auto_24459 ) ) ( not ( = ?auto_24455 ?auto_24484 ) ) ( not ( = ?auto_24456 ?auto_24459 ) ) ( not ( = ?auto_24456 ?auto_24484 ) ) ( not ( = ?auto_24457 ?auto_24459 ) ) ( not ( = ?auto_24457 ?auto_24484 ) ) ( not ( = ?auto_24458 ?auto_24459 ) ) ( not ( = ?auto_24458 ?auto_24484 ) ) ( not ( = ?auto_24459 ?auto_24502 ) ) ( not ( = ?auto_24459 ?auto_24499 ) ) ( not ( = ?auto_24459 ?auto_24495 ) ) ( not ( = ?auto_24459 ?auto_24486 ) ) ( not ( = ?auto_24459 ?auto_24493 ) ) ( not ( = ?auto_24513 ?auto_24514 ) ) ( not ( = ?auto_24513 ?auto_24480 ) ) ( not ( = ?auto_24513 ?auto_24485 ) ) ( not ( = ?auto_24513 ?auto_24517 ) ) ( not ( = ?auto_24513 ?auto_24494 ) ) ( not ( = ?auto_24478 ?auto_24503 ) ) ( not ( = ?auto_24478 ?auto_24482 ) ) ( not ( = ?auto_24478 ?auto_24492 ) ) ( not ( = ?auto_24478 ?auto_24498 ) ) ( not ( = ?auto_24478 ?auto_24491 ) ) ( not ( = ?auto_24484 ?auto_24502 ) ) ( not ( = ?auto_24484 ?auto_24499 ) ) ( not ( = ?auto_24484 ?auto_24495 ) ) ( not ( = ?auto_24484 ?auto_24486 ) ) ( not ( = ?auto_24484 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24463 ) ) ( not ( = ?auto_24454 ?auto_24497 ) ) ( not ( = ?auto_24455 ?auto_24463 ) ) ( not ( = ?auto_24455 ?auto_24497 ) ) ( not ( = ?auto_24456 ?auto_24463 ) ) ( not ( = ?auto_24456 ?auto_24497 ) ) ( not ( = ?auto_24457 ?auto_24463 ) ) ( not ( = ?auto_24457 ?auto_24497 ) ) ( not ( = ?auto_24458 ?auto_24463 ) ) ( not ( = ?auto_24458 ?auto_24497 ) ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( not ( = ?auto_24461 ?auto_24497 ) ) ( not ( = ?auto_24463 ?auto_24484 ) ) ( not ( = ?auto_24463 ?auto_24502 ) ) ( not ( = ?auto_24463 ?auto_24499 ) ) ( not ( = ?auto_24463 ?auto_24495 ) ) ( not ( = ?auto_24463 ?auto_24486 ) ) ( not ( = ?auto_24463 ?auto_24493 ) ) ( not ( = ?auto_24512 ?auto_24513 ) ) ( not ( = ?auto_24512 ?auto_24514 ) ) ( not ( = ?auto_24512 ?auto_24480 ) ) ( not ( = ?auto_24512 ?auto_24485 ) ) ( not ( = ?auto_24512 ?auto_24517 ) ) ( not ( = ?auto_24512 ?auto_24494 ) ) ( not ( = ?auto_24479 ?auto_24478 ) ) ( not ( = ?auto_24479 ?auto_24503 ) ) ( not ( = ?auto_24479 ?auto_24482 ) ) ( not ( = ?auto_24479 ?auto_24492 ) ) ( not ( = ?auto_24479 ?auto_24498 ) ) ( not ( = ?auto_24479 ?auto_24491 ) ) ( not ( = ?auto_24497 ?auto_24484 ) ) ( not ( = ?auto_24497 ?auto_24502 ) ) ( not ( = ?auto_24497 ?auto_24499 ) ) ( not ( = ?auto_24497 ?auto_24495 ) ) ( not ( = ?auto_24497 ?auto_24486 ) ) ( not ( = ?auto_24497 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24462 ) ) ( not ( = ?auto_24454 ?auto_24487 ) ) ( not ( = ?auto_24455 ?auto_24462 ) ) ( not ( = ?auto_24455 ?auto_24487 ) ) ( not ( = ?auto_24456 ?auto_24462 ) ) ( not ( = ?auto_24456 ?auto_24487 ) ) ( not ( = ?auto_24457 ?auto_24462 ) ) ( not ( = ?auto_24457 ?auto_24487 ) ) ( not ( = ?auto_24458 ?auto_24462 ) ) ( not ( = ?auto_24458 ?auto_24487 ) ) ( not ( = ?auto_24461 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24487 ) ) ( not ( = ?auto_24459 ?auto_24462 ) ) ( not ( = ?auto_24459 ?auto_24487 ) ) ( not ( = ?auto_24462 ?auto_24497 ) ) ( not ( = ?auto_24462 ?auto_24484 ) ) ( not ( = ?auto_24462 ?auto_24502 ) ) ( not ( = ?auto_24462 ?auto_24499 ) ) ( not ( = ?auto_24462 ?auto_24495 ) ) ( not ( = ?auto_24462 ?auto_24486 ) ) ( not ( = ?auto_24462 ?auto_24493 ) ) ( not ( = ?auto_24487 ?auto_24497 ) ) ( not ( = ?auto_24487 ?auto_24484 ) ) ( not ( = ?auto_24487 ?auto_24502 ) ) ( not ( = ?auto_24487 ?auto_24499 ) ) ( not ( = ?auto_24487 ?auto_24495 ) ) ( not ( = ?auto_24487 ?auto_24486 ) ) ( not ( = ?auto_24487 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24460 ) ) ( not ( = ?auto_24454 ?auto_24506 ) ) ( not ( = ?auto_24455 ?auto_24460 ) ) ( not ( = ?auto_24455 ?auto_24506 ) ) ( not ( = ?auto_24456 ?auto_24460 ) ) ( not ( = ?auto_24456 ?auto_24506 ) ) ( not ( = ?auto_24457 ?auto_24460 ) ) ( not ( = ?auto_24457 ?auto_24506 ) ) ( not ( = ?auto_24458 ?auto_24460 ) ) ( not ( = ?auto_24458 ?auto_24506 ) ) ( not ( = ?auto_24461 ?auto_24460 ) ) ( not ( = ?auto_24461 ?auto_24506 ) ) ( not ( = ?auto_24459 ?auto_24460 ) ) ( not ( = ?auto_24459 ?auto_24506 ) ) ( not ( = ?auto_24463 ?auto_24460 ) ) ( not ( = ?auto_24463 ?auto_24506 ) ) ( not ( = ?auto_24460 ?auto_24487 ) ) ( not ( = ?auto_24460 ?auto_24497 ) ) ( not ( = ?auto_24460 ?auto_24484 ) ) ( not ( = ?auto_24460 ?auto_24502 ) ) ( not ( = ?auto_24460 ?auto_24499 ) ) ( not ( = ?auto_24460 ?auto_24495 ) ) ( not ( = ?auto_24460 ?auto_24486 ) ) ( not ( = ?auto_24460 ?auto_24493 ) ) ( not ( = ?auto_24504 ?auto_24512 ) ) ( not ( = ?auto_24504 ?auto_24513 ) ) ( not ( = ?auto_24504 ?auto_24514 ) ) ( not ( = ?auto_24504 ?auto_24480 ) ) ( not ( = ?auto_24504 ?auto_24485 ) ) ( not ( = ?auto_24504 ?auto_24517 ) ) ( not ( = ?auto_24504 ?auto_24494 ) ) ( not ( = ?auto_24481 ?auto_24479 ) ) ( not ( = ?auto_24481 ?auto_24478 ) ) ( not ( = ?auto_24481 ?auto_24503 ) ) ( not ( = ?auto_24481 ?auto_24482 ) ) ( not ( = ?auto_24481 ?auto_24492 ) ) ( not ( = ?auto_24481 ?auto_24498 ) ) ( not ( = ?auto_24481 ?auto_24491 ) ) ( not ( = ?auto_24506 ?auto_24487 ) ) ( not ( = ?auto_24506 ?auto_24497 ) ) ( not ( = ?auto_24506 ?auto_24484 ) ) ( not ( = ?auto_24506 ?auto_24502 ) ) ( not ( = ?auto_24506 ?auto_24499 ) ) ( not ( = ?auto_24506 ?auto_24495 ) ) ( not ( = ?auto_24506 ?auto_24486 ) ) ( not ( = ?auto_24506 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24465 ) ) ( not ( = ?auto_24454 ?auto_24505 ) ) ( not ( = ?auto_24455 ?auto_24465 ) ) ( not ( = ?auto_24455 ?auto_24505 ) ) ( not ( = ?auto_24456 ?auto_24465 ) ) ( not ( = ?auto_24456 ?auto_24505 ) ) ( not ( = ?auto_24457 ?auto_24465 ) ) ( not ( = ?auto_24457 ?auto_24505 ) ) ( not ( = ?auto_24458 ?auto_24465 ) ) ( not ( = ?auto_24458 ?auto_24505 ) ) ( not ( = ?auto_24461 ?auto_24465 ) ) ( not ( = ?auto_24461 ?auto_24505 ) ) ( not ( = ?auto_24459 ?auto_24465 ) ) ( not ( = ?auto_24459 ?auto_24505 ) ) ( not ( = ?auto_24463 ?auto_24465 ) ) ( not ( = ?auto_24463 ?auto_24505 ) ) ( not ( = ?auto_24462 ?auto_24465 ) ) ( not ( = ?auto_24462 ?auto_24505 ) ) ( not ( = ?auto_24465 ?auto_24506 ) ) ( not ( = ?auto_24465 ?auto_24487 ) ) ( not ( = ?auto_24465 ?auto_24497 ) ) ( not ( = ?auto_24465 ?auto_24484 ) ) ( not ( = ?auto_24465 ?auto_24502 ) ) ( not ( = ?auto_24465 ?auto_24499 ) ) ( not ( = ?auto_24465 ?auto_24495 ) ) ( not ( = ?auto_24465 ?auto_24486 ) ) ( not ( = ?auto_24465 ?auto_24493 ) ) ( not ( = ?auto_24477 ?auto_24504 ) ) ( not ( = ?auto_24477 ?auto_24512 ) ) ( not ( = ?auto_24477 ?auto_24513 ) ) ( not ( = ?auto_24477 ?auto_24514 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24477 ?auto_24485 ) ) ( not ( = ?auto_24477 ?auto_24517 ) ) ( not ( = ?auto_24477 ?auto_24494 ) ) ( not ( = ?auto_24490 ?auto_24481 ) ) ( not ( = ?auto_24490 ?auto_24479 ) ) ( not ( = ?auto_24490 ?auto_24478 ) ) ( not ( = ?auto_24490 ?auto_24503 ) ) ( not ( = ?auto_24490 ?auto_24482 ) ) ( not ( = ?auto_24490 ?auto_24492 ) ) ( not ( = ?auto_24490 ?auto_24498 ) ) ( not ( = ?auto_24490 ?auto_24491 ) ) ( not ( = ?auto_24505 ?auto_24506 ) ) ( not ( = ?auto_24505 ?auto_24487 ) ) ( not ( = ?auto_24505 ?auto_24497 ) ) ( not ( = ?auto_24505 ?auto_24484 ) ) ( not ( = ?auto_24505 ?auto_24502 ) ) ( not ( = ?auto_24505 ?auto_24499 ) ) ( not ( = ?auto_24505 ?auto_24495 ) ) ( not ( = ?auto_24505 ?auto_24486 ) ) ( not ( = ?auto_24505 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24464 ) ) ( not ( = ?auto_24454 ?auto_24516 ) ) ( not ( = ?auto_24455 ?auto_24464 ) ) ( not ( = ?auto_24455 ?auto_24516 ) ) ( not ( = ?auto_24456 ?auto_24464 ) ) ( not ( = ?auto_24456 ?auto_24516 ) ) ( not ( = ?auto_24457 ?auto_24464 ) ) ( not ( = ?auto_24457 ?auto_24516 ) ) ( not ( = ?auto_24458 ?auto_24464 ) ) ( not ( = ?auto_24458 ?auto_24516 ) ) ( not ( = ?auto_24461 ?auto_24464 ) ) ( not ( = ?auto_24461 ?auto_24516 ) ) ( not ( = ?auto_24459 ?auto_24464 ) ) ( not ( = ?auto_24459 ?auto_24516 ) ) ( not ( = ?auto_24463 ?auto_24464 ) ) ( not ( = ?auto_24463 ?auto_24516 ) ) ( not ( = ?auto_24462 ?auto_24464 ) ) ( not ( = ?auto_24462 ?auto_24516 ) ) ( not ( = ?auto_24460 ?auto_24464 ) ) ( not ( = ?auto_24460 ?auto_24516 ) ) ( not ( = ?auto_24464 ?auto_24505 ) ) ( not ( = ?auto_24464 ?auto_24506 ) ) ( not ( = ?auto_24464 ?auto_24487 ) ) ( not ( = ?auto_24464 ?auto_24497 ) ) ( not ( = ?auto_24464 ?auto_24484 ) ) ( not ( = ?auto_24464 ?auto_24502 ) ) ( not ( = ?auto_24464 ?auto_24499 ) ) ( not ( = ?auto_24464 ?auto_24495 ) ) ( not ( = ?auto_24464 ?auto_24486 ) ) ( not ( = ?auto_24464 ?auto_24493 ) ) ( not ( = ?auto_24509 ?auto_24477 ) ) ( not ( = ?auto_24509 ?auto_24504 ) ) ( not ( = ?auto_24509 ?auto_24512 ) ) ( not ( = ?auto_24509 ?auto_24513 ) ) ( not ( = ?auto_24509 ?auto_24514 ) ) ( not ( = ?auto_24509 ?auto_24480 ) ) ( not ( = ?auto_24509 ?auto_24485 ) ) ( not ( = ?auto_24509 ?auto_24517 ) ) ( not ( = ?auto_24509 ?auto_24494 ) ) ( not ( = ?auto_24508 ?auto_24490 ) ) ( not ( = ?auto_24508 ?auto_24481 ) ) ( not ( = ?auto_24508 ?auto_24479 ) ) ( not ( = ?auto_24508 ?auto_24478 ) ) ( not ( = ?auto_24508 ?auto_24503 ) ) ( not ( = ?auto_24508 ?auto_24482 ) ) ( not ( = ?auto_24508 ?auto_24492 ) ) ( not ( = ?auto_24508 ?auto_24498 ) ) ( not ( = ?auto_24508 ?auto_24491 ) ) ( not ( = ?auto_24516 ?auto_24505 ) ) ( not ( = ?auto_24516 ?auto_24506 ) ) ( not ( = ?auto_24516 ?auto_24487 ) ) ( not ( = ?auto_24516 ?auto_24497 ) ) ( not ( = ?auto_24516 ?auto_24484 ) ) ( not ( = ?auto_24516 ?auto_24502 ) ) ( not ( = ?auto_24516 ?auto_24499 ) ) ( not ( = ?auto_24516 ?auto_24495 ) ) ( not ( = ?auto_24516 ?auto_24486 ) ) ( not ( = ?auto_24516 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24466 ) ) ( not ( = ?auto_24454 ?auto_24483 ) ) ( not ( = ?auto_24455 ?auto_24466 ) ) ( not ( = ?auto_24455 ?auto_24483 ) ) ( not ( = ?auto_24456 ?auto_24466 ) ) ( not ( = ?auto_24456 ?auto_24483 ) ) ( not ( = ?auto_24457 ?auto_24466 ) ) ( not ( = ?auto_24457 ?auto_24483 ) ) ( not ( = ?auto_24458 ?auto_24466 ) ) ( not ( = ?auto_24458 ?auto_24483 ) ) ( not ( = ?auto_24461 ?auto_24466 ) ) ( not ( = ?auto_24461 ?auto_24483 ) ) ( not ( = ?auto_24459 ?auto_24466 ) ) ( not ( = ?auto_24459 ?auto_24483 ) ) ( not ( = ?auto_24463 ?auto_24466 ) ) ( not ( = ?auto_24463 ?auto_24483 ) ) ( not ( = ?auto_24462 ?auto_24466 ) ) ( not ( = ?auto_24462 ?auto_24483 ) ) ( not ( = ?auto_24460 ?auto_24466 ) ) ( not ( = ?auto_24460 ?auto_24483 ) ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24483 ) ) ( not ( = ?auto_24466 ?auto_24516 ) ) ( not ( = ?auto_24466 ?auto_24505 ) ) ( not ( = ?auto_24466 ?auto_24506 ) ) ( not ( = ?auto_24466 ?auto_24487 ) ) ( not ( = ?auto_24466 ?auto_24497 ) ) ( not ( = ?auto_24466 ?auto_24484 ) ) ( not ( = ?auto_24466 ?auto_24502 ) ) ( not ( = ?auto_24466 ?auto_24499 ) ) ( not ( = ?auto_24466 ?auto_24495 ) ) ( not ( = ?auto_24466 ?auto_24486 ) ) ( not ( = ?auto_24466 ?auto_24493 ) ) ( not ( = ?auto_24510 ?auto_24509 ) ) ( not ( = ?auto_24510 ?auto_24477 ) ) ( not ( = ?auto_24510 ?auto_24504 ) ) ( not ( = ?auto_24510 ?auto_24512 ) ) ( not ( = ?auto_24510 ?auto_24513 ) ) ( not ( = ?auto_24510 ?auto_24514 ) ) ( not ( = ?auto_24510 ?auto_24480 ) ) ( not ( = ?auto_24510 ?auto_24485 ) ) ( not ( = ?auto_24510 ?auto_24517 ) ) ( not ( = ?auto_24510 ?auto_24494 ) ) ( not ( = ?auto_24489 ?auto_24508 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( not ( = ?auto_24489 ?auto_24481 ) ) ( not ( = ?auto_24489 ?auto_24479 ) ) ( not ( = ?auto_24489 ?auto_24478 ) ) ( not ( = ?auto_24489 ?auto_24503 ) ) ( not ( = ?auto_24489 ?auto_24482 ) ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24489 ?auto_24498 ) ) ( not ( = ?auto_24489 ?auto_24491 ) ) ( not ( = ?auto_24483 ?auto_24516 ) ) ( not ( = ?auto_24483 ?auto_24505 ) ) ( not ( = ?auto_24483 ?auto_24506 ) ) ( not ( = ?auto_24483 ?auto_24487 ) ) ( not ( = ?auto_24483 ?auto_24497 ) ) ( not ( = ?auto_24483 ?auto_24484 ) ) ( not ( = ?auto_24483 ?auto_24502 ) ) ( not ( = ?auto_24483 ?auto_24499 ) ) ( not ( = ?auto_24483 ?auto_24495 ) ) ( not ( = ?auto_24483 ?auto_24486 ) ) ( not ( = ?auto_24483 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24468 ) ) ( not ( = ?auto_24454 ?auto_24496 ) ) ( not ( = ?auto_24455 ?auto_24468 ) ) ( not ( = ?auto_24455 ?auto_24496 ) ) ( not ( = ?auto_24456 ?auto_24468 ) ) ( not ( = ?auto_24456 ?auto_24496 ) ) ( not ( = ?auto_24457 ?auto_24468 ) ) ( not ( = ?auto_24457 ?auto_24496 ) ) ( not ( = ?auto_24458 ?auto_24468 ) ) ( not ( = ?auto_24458 ?auto_24496 ) ) ( not ( = ?auto_24461 ?auto_24468 ) ) ( not ( = ?auto_24461 ?auto_24496 ) ) ( not ( = ?auto_24459 ?auto_24468 ) ) ( not ( = ?auto_24459 ?auto_24496 ) ) ( not ( = ?auto_24463 ?auto_24468 ) ) ( not ( = ?auto_24463 ?auto_24496 ) ) ( not ( = ?auto_24462 ?auto_24468 ) ) ( not ( = ?auto_24462 ?auto_24496 ) ) ( not ( = ?auto_24460 ?auto_24468 ) ) ( not ( = ?auto_24460 ?auto_24496 ) ) ( not ( = ?auto_24465 ?auto_24468 ) ) ( not ( = ?auto_24465 ?auto_24496 ) ) ( not ( = ?auto_24464 ?auto_24468 ) ) ( not ( = ?auto_24464 ?auto_24496 ) ) ( not ( = ?auto_24468 ?auto_24483 ) ) ( not ( = ?auto_24468 ?auto_24516 ) ) ( not ( = ?auto_24468 ?auto_24505 ) ) ( not ( = ?auto_24468 ?auto_24506 ) ) ( not ( = ?auto_24468 ?auto_24487 ) ) ( not ( = ?auto_24468 ?auto_24497 ) ) ( not ( = ?auto_24468 ?auto_24484 ) ) ( not ( = ?auto_24468 ?auto_24502 ) ) ( not ( = ?auto_24468 ?auto_24499 ) ) ( not ( = ?auto_24468 ?auto_24495 ) ) ( not ( = ?auto_24468 ?auto_24486 ) ) ( not ( = ?auto_24468 ?auto_24493 ) ) ( not ( = ?auto_24511 ?auto_24510 ) ) ( not ( = ?auto_24511 ?auto_24509 ) ) ( not ( = ?auto_24511 ?auto_24477 ) ) ( not ( = ?auto_24511 ?auto_24504 ) ) ( not ( = ?auto_24511 ?auto_24512 ) ) ( not ( = ?auto_24511 ?auto_24513 ) ) ( not ( = ?auto_24511 ?auto_24514 ) ) ( not ( = ?auto_24511 ?auto_24480 ) ) ( not ( = ?auto_24511 ?auto_24485 ) ) ( not ( = ?auto_24511 ?auto_24517 ) ) ( not ( = ?auto_24511 ?auto_24494 ) ) ( not ( = ?auto_24500 ?auto_24489 ) ) ( not ( = ?auto_24500 ?auto_24508 ) ) ( not ( = ?auto_24500 ?auto_24490 ) ) ( not ( = ?auto_24500 ?auto_24481 ) ) ( not ( = ?auto_24500 ?auto_24479 ) ) ( not ( = ?auto_24500 ?auto_24478 ) ) ( not ( = ?auto_24500 ?auto_24503 ) ) ( not ( = ?auto_24500 ?auto_24482 ) ) ( not ( = ?auto_24500 ?auto_24492 ) ) ( not ( = ?auto_24500 ?auto_24498 ) ) ( not ( = ?auto_24500 ?auto_24491 ) ) ( not ( = ?auto_24496 ?auto_24483 ) ) ( not ( = ?auto_24496 ?auto_24516 ) ) ( not ( = ?auto_24496 ?auto_24505 ) ) ( not ( = ?auto_24496 ?auto_24506 ) ) ( not ( = ?auto_24496 ?auto_24487 ) ) ( not ( = ?auto_24496 ?auto_24497 ) ) ( not ( = ?auto_24496 ?auto_24484 ) ) ( not ( = ?auto_24496 ?auto_24502 ) ) ( not ( = ?auto_24496 ?auto_24499 ) ) ( not ( = ?auto_24496 ?auto_24495 ) ) ( not ( = ?auto_24496 ?auto_24486 ) ) ( not ( = ?auto_24496 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24469 ) ) ( not ( = ?auto_24454 ?auto_24501 ) ) ( not ( = ?auto_24455 ?auto_24469 ) ) ( not ( = ?auto_24455 ?auto_24501 ) ) ( not ( = ?auto_24456 ?auto_24469 ) ) ( not ( = ?auto_24456 ?auto_24501 ) ) ( not ( = ?auto_24457 ?auto_24469 ) ) ( not ( = ?auto_24457 ?auto_24501 ) ) ( not ( = ?auto_24458 ?auto_24469 ) ) ( not ( = ?auto_24458 ?auto_24501 ) ) ( not ( = ?auto_24461 ?auto_24469 ) ) ( not ( = ?auto_24461 ?auto_24501 ) ) ( not ( = ?auto_24459 ?auto_24469 ) ) ( not ( = ?auto_24459 ?auto_24501 ) ) ( not ( = ?auto_24463 ?auto_24469 ) ) ( not ( = ?auto_24463 ?auto_24501 ) ) ( not ( = ?auto_24462 ?auto_24469 ) ) ( not ( = ?auto_24462 ?auto_24501 ) ) ( not ( = ?auto_24460 ?auto_24469 ) ) ( not ( = ?auto_24460 ?auto_24501 ) ) ( not ( = ?auto_24465 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24501 ) ) ( not ( = ?auto_24464 ?auto_24469 ) ) ( not ( = ?auto_24464 ?auto_24501 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24466 ?auto_24501 ) ) ( not ( = ?auto_24469 ?auto_24496 ) ) ( not ( = ?auto_24469 ?auto_24483 ) ) ( not ( = ?auto_24469 ?auto_24516 ) ) ( not ( = ?auto_24469 ?auto_24505 ) ) ( not ( = ?auto_24469 ?auto_24506 ) ) ( not ( = ?auto_24469 ?auto_24487 ) ) ( not ( = ?auto_24469 ?auto_24497 ) ) ( not ( = ?auto_24469 ?auto_24484 ) ) ( not ( = ?auto_24469 ?auto_24502 ) ) ( not ( = ?auto_24469 ?auto_24499 ) ) ( not ( = ?auto_24469 ?auto_24495 ) ) ( not ( = ?auto_24469 ?auto_24486 ) ) ( not ( = ?auto_24469 ?auto_24493 ) ) ( not ( = ?auto_24515 ?auto_24511 ) ) ( not ( = ?auto_24515 ?auto_24510 ) ) ( not ( = ?auto_24515 ?auto_24509 ) ) ( not ( = ?auto_24515 ?auto_24477 ) ) ( not ( = ?auto_24515 ?auto_24504 ) ) ( not ( = ?auto_24515 ?auto_24512 ) ) ( not ( = ?auto_24515 ?auto_24513 ) ) ( not ( = ?auto_24515 ?auto_24514 ) ) ( not ( = ?auto_24515 ?auto_24480 ) ) ( not ( = ?auto_24515 ?auto_24485 ) ) ( not ( = ?auto_24515 ?auto_24517 ) ) ( not ( = ?auto_24515 ?auto_24494 ) ) ( not ( = ?auto_24507 ?auto_24500 ) ) ( not ( = ?auto_24507 ?auto_24489 ) ) ( not ( = ?auto_24507 ?auto_24508 ) ) ( not ( = ?auto_24507 ?auto_24490 ) ) ( not ( = ?auto_24507 ?auto_24481 ) ) ( not ( = ?auto_24507 ?auto_24479 ) ) ( not ( = ?auto_24507 ?auto_24478 ) ) ( not ( = ?auto_24507 ?auto_24503 ) ) ( not ( = ?auto_24507 ?auto_24482 ) ) ( not ( = ?auto_24507 ?auto_24492 ) ) ( not ( = ?auto_24507 ?auto_24498 ) ) ( not ( = ?auto_24507 ?auto_24491 ) ) ( not ( = ?auto_24501 ?auto_24496 ) ) ( not ( = ?auto_24501 ?auto_24483 ) ) ( not ( = ?auto_24501 ?auto_24516 ) ) ( not ( = ?auto_24501 ?auto_24505 ) ) ( not ( = ?auto_24501 ?auto_24506 ) ) ( not ( = ?auto_24501 ?auto_24487 ) ) ( not ( = ?auto_24501 ?auto_24497 ) ) ( not ( = ?auto_24501 ?auto_24484 ) ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( not ( = ?auto_24501 ?auto_24499 ) ) ( not ( = ?auto_24501 ?auto_24495 ) ) ( not ( = ?auto_24501 ?auto_24486 ) ) ( not ( = ?auto_24501 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24467 ) ) ( not ( = ?auto_24454 ?auto_24488 ) ) ( not ( = ?auto_24455 ?auto_24467 ) ) ( not ( = ?auto_24455 ?auto_24488 ) ) ( not ( = ?auto_24456 ?auto_24467 ) ) ( not ( = ?auto_24456 ?auto_24488 ) ) ( not ( = ?auto_24457 ?auto_24467 ) ) ( not ( = ?auto_24457 ?auto_24488 ) ) ( not ( = ?auto_24458 ?auto_24467 ) ) ( not ( = ?auto_24458 ?auto_24488 ) ) ( not ( = ?auto_24461 ?auto_24467 ) ) ( not ( = ?auto_24461 ?auto_24488 ) ) ( not ( = ?auto_24459 ?auto_24467 ) ) ( not ( = ?auto_24459 ?auto_24488 ) ) ( not ( = ?auto_24463 ?auto_24467 ) ) ( not ( = ?auto_24463 ?auto_24488 ) ) ( not ( = ?auto_24462 ?auto_24467 ) ) ( not ( = ?auto_24462 ?auto_24488 ) ) ( not ( = ?auto_24460 ?auto_24467 ) ) ( not ( = ?auto_24460 ?auto_24488 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( not ( = ?auto_24465 ?auto_24488 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24488 ) ) ( not ( = ?auto_24466 ?auto_24467 ) ) ( not ( = ?auto_24466 ?auto_24488 ) ) ( not ( = ?auto_24468 ?auto_24467 ) ) ( not ( = ?auto_24468 ?auto_24488 ) ) ( not ( = ?auto_24467 ?auto_24501 ) ) ( not ( = ?auto_24467 ?auto_24496 ) ) ( not ( = ?auto_24467 ?auto_24483 ) ) ( not ( = ?auto_24467 ?auto_24516 ) ) ( not ( = ?auto_24467 ?auto_24505 ) ) ( not ( = ?auto_24467 ?auto_24506 ) ) ( not ( = ?auto_24467 ?auto_24487 ) ) ( not ( = ?auto_24467 ?auto_24497 ) ) ( not ( = ?auto_24467 ?auto_24484 ) ) ( not ( = ?auto_24467 ?auto_24502 ) ) ( not ( = ?auto_24467 ?auto_24499 ) ) ( not ( = ?auto_24467 ?auto_24495 ) ) ( not ( = ?auto_24467 ?auto_24486 ) ) ( not ( = ?auto_24467 ?auto_24493 ) ) ( not ( = ?auto_24488 ?auto_24501 ) ) ( not ( = ?auto_24488 ?auto_24496 ) ) ( not ( = ?auto_24488 ?auto_24483 ) ) ( not ( = ?auto_24488 ?auto_24516 ) ) ( not ( = ?auto_24488 ?auto_24505 ) ) ( not ( = ?auto_24488 ?auto_24506 ) ) ( not ( = ?auto_24488 ?auto_24487 ) ) ( not ( = ?auto_24488 ?auto_24497 ) ) ( not ( = ?auto_24488 ?auto_24484 ) ) ( not ( = ?auto_24488 ?auto_24502 ) ) ( not ( = ?auto_24488 ?auto_24499 ) ) ( not ( = ?auto_24488 ?auto_24495 ) ) ( not ( = ?auto_24488 ?auto_24486 ) ) ( not ( = ?auto_24488 ?auto_24493 ) ) ( not ( = ?auto_24454 ?auto_24470 ) ) ( not ( = ?auto_24454 ?auto_24471 ) ) ( not ( = ?auto_24455 ?auto_24470 ) ) ( not ( = ?auto_24455 ?auto_24471 ) ) ( not ( = ?auto_24456 ?auto_24470 ) ) ( not ( = ?auto_24456 ?auto_24471 ) ) ( not ( = ?auto_24457 ?auto_24470 ) ) ( not ( = ?auto_24457 ?auto_24471 ) ) ( not ( = ?auto_24458 ?auto_24470 ) ) ( not ( = ?auto_24458 ?auto_24471 ) ) ( not ( = ?auto_24461 ?auto_24470 ) ) ( not ( = ?auto_24461 ?auto_24471 ) ) ( not ( = ?auto_24459 ?auto_24470 ) ) ( not ( = ?auto_24459 ?auto_24471 ) ) ( not ( = ?auto_24463 ?auto_24470 ) ) ( not ( = ?auto_24463 ?auto_24471 ) ) ( not ( = ?auto_24462 ?auto_24470 ) ) ( not ( = ?auto_24462 ?auto_24471 ) ) ( not ( = ?auto_24460 ?auto_24470 ) ) ( not ( = ?auto_24460 ?auto_24471 ) ) ( not ( = ?auto_24465 ?auto_24470 ) ) ( not ( = ?auto_24465 ?auto_24471 ) ) ( not ( = ?auto_24464 ?auto_24470 ) ) ( not ( = ?auto_24464 ?auto_24471 ) ) ( not ( = ?auto_24466 ?auto_24470 ) ) ( not ( = ?auto_24466 ?auto_24471 ) ) ( not ( = ?auto_24468 ?auto_24470 ) ) ( not ( = ?auto_24468 ?auto_24471 ) ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24469 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24488 ) ) ( not ( = ?auto_24470 ?auto_24501 ) ) ( not ( = ?auto_24470 ?auto_24496 ) ) ( not ( = ?auto_24470 ?auto_24483 ) ) ( not ( = ?auto_24470 ?auto_24516 ) ) ( not ( = ?auto_24470 ?auto_24505 ) ) ( not ( = ?auto_24470 ?auto_24506 ) ) ( not ( = ?auto_24470 ?auto_24487 ) ) ( not ( = ?auto_24470 ?auto_24497 ) ) ( not ( = ?auto_24470 ?auto_24484 ) ) ( not ( = ?auto_24470 ?auto_24502 ) ) ( not ( = ?auto_24470 ?auto_24499 ) ) ( not ( = ?auto_24470 ?auto_24495 ) ) ( not ( = ?auto_24470 ?auto_24486 ) ) ( not ( = ?auto_24470 ?auto_24493 ) ) ( not ( = ?auto_24473 ?auto_24485 ) ) ( not ( = ?auto_24473 ?auto_24515 ) ) ( not ( = ?auto_24473 ?auto_24511 ) ) ( not ( = ?auto_24473 ?auto_24510 ) ) ( not ( = ?auto_24473 ?auto_24509 ) ) ( not ( = ?auto_24473 ?auto_24477 ) ) ( not ( = ?auto_24473 ?auto_24504 ) ) ( not ( = ?auto_24473 ?auto_24512 ) ) ( not ( = ?auto_24473 ?auto_24513 ) ) ( not ( = ?auto_24473 ?auto_24514 ) ) ( not ( = ?auto_24473 ?auto_24480 ) ) ( not ( = ?auto_24473 ?auto_24517 ) ) ( not ( = ?auto_24473 ?auto_24494 ) ) ( not ( = ?auto_24476 ?auto_24492 ) ) ( not ( = ?auto_24476 ?auto_24507 ) ) ( not ( = ?auto_24476 ?auto_24500 ) ) ( not ( = ?auto_24476 ?auto_24489 ) ) ( not ( = ?auto_24476 ?auto_24508 ) ) ( not ( = ?auto_24476 ?auto_24490 ) ) ( not ( = ?auto_24476 ?auto_24481 ) ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24476 ?auto_24503 ) ) ( not ( = ?auto_24476 ?auto_24482 ) ) ( not ( = ?auto_24476 ?auto_24498 ) ) ( not ( = ?auto_24476 ?auto_24491 ) ) ( not ( = ?auto_24471 ?auto_24488 ) ) ( not ( = ?auto_24471 ?auto_24501 ) ) ( not ( = ?auto_24471 ?auto_24496 ) ) ( not ( = ?auto_24471 ?auto_24483 ) ) ( not ( = ?auto_24471 ?auto_24516 ) ) ( not ( = ?auto_24471 ?auto_24505 ) ) ( not ( = ?auto_24471 ?auto_24506 ) ) ( not ( = ?auto_24471 ?auto_24487 ) ) ( not ( = ?auto_24471 ?auto_24497 ) ) ( not ( = ?auto_24471 ?auto_24484 ) ) ( not ( = ?auto_24471 ?auto_24502 ) ) ( not ( = ?auto_24471 ?auto_24499 ) ) ( not ( = ?auto_24471 ?auto_24495 ) ) ( not ( = ?auto_24471 ?auto_24486 ) ) ( not ( = ?auto_24471 ?auto_24493 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_24454 ?auto_24455 ?auto_24456 ?auto_24457 ?auto_24458 ?auto_24461 ?auto_24459 ?auto_24463 ?auto_24462 ?auto_24460 ?auto_24465 ?auto_24464 ?auto_24466 ?auto_24468 ?auto_24469 ?auto_24467 )
      ( MAKE-1CRATE ?auto_24467 ?auto_24470 )
      ( MAKE-16CRATE-VERIFY ?auto_24454 ?auto_24455 ?auto_24456 ?auto_24457 ?auto_24458 ?auto_24461 ?auto_24459 ?auto_24463 ?auto_24462 ?auto_24460 ?auto_24465 ?auto_24464 ?auto_24466 ?auto_24468 ?auto_24469 ?auto_24467 ?auto_24470 ) )
  )

)

