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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20594 - SURFACE
      ?auto_20595 - SURFACE
    )
    :vars
    (
      ?auto_20596 - HOIST
      ?auto_20597 - PLACE
      ?auto_20599 - PLACE
      ?auto_20600 - HOIST
      ?auto_20601 - SURFACE
      ?auto_20598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20596 ?auto_20597 ) ( SURFACE-AT ?auto_20594 ?auto_20597 ) ( CLEAR ?auto_20594 ) ( IS-CRATE ?auto_20595 ) ( AVAILABLE ?auto_20596 ) ( not ( = ?auto_20599 ?auto_20597 ) ) ( HOIST-AT ?auto_20600 ?auto_20599 ) ( AVAILABLE ?auto_20600 ) ( SURFACE-AT ?auto_20595 ?auto_20599 ) ( ON ?auto_20595 ?auto_20601 ) ( CLEAR ?auto_20595 ) ( TRUCK-AT ?auto_20598 ?auto_20597 ) ( not ( = ?auto_20594 ?auto_20595 ) ) ( not ( = ?auto_20594 ?auto_20601 ) ) ( not ( = ?auto_20595 ?auto_20601 ) ) ( not ( = ?auto_20596 ?auto_20600 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20598 ?auto_20597 ?auto_20599 )
      ( !LIFT ?auto_20600 ?auto_20595 ?auto_20601 ?auto_20599 )
      ( !LOAD ?auto_20600 ?auto_20595 ?auto_20598 ?auto_20599 )
      ( !DRIVE ?auto_20598 ?auto_20599 ?auto_20597 )
      ( !UNLOAD ?auto_20596 ?auto_20595 ?auto_20598 ?auto_20597 )
      ( !DROP ?auto_20596 ?auto_20595 ?auto_20594 ?auto_20597 )
      ( MAKE-1CRATE-VERIFY ?auto_20594 ?auto_20595 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20615 - SURFACE
      ?auto_20616 - SURFACE
      ?auto_20617 - SURFACE
    )
    :vars
    (
      ?auto_20620 - HOIST
      ?auto_20621 - PLACE
      ?auto_20619 - PLACE
      ?auto_20618 - HOIST
      ?auto_20622 - SURFACE
      ?auto_20624 - PLACE
      ?auto_20626 - HOIST
      ?auto_20625 - SURFACE
      ?auto_20623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20620 ?auto_20621 ) ( IS-CRATE ?auto_20617 ) ( not ( = ?auto_20619 ?auto_20621 ) ) ( HOIST-AT ?auto_20618 ?auto_20619 ) ( AVAILABLE ?auto_20618 ) ( SURFACE-AT ?auto_20617 ?auto_20619 ) ( ON ?auto_20617 ?auto_20622 ) ( CLEAR ?auto_20617 ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20616 ?auto_20622 ) ) ( not ( = ?auto_20617 ?auto_20622 ) ) ( not ( = ?auto_20620 ?auto_20618 ) ) ( SURFACE-AT ?auto_20615 ?auto_20621 ) ( CLEAR ?auto_20615 ) ( IS-CRATE ?auto_20616 ) ( AVAILABLE ?auto_20620 ) ( not ( = ?auto_20624 ?auto_20621 ) ) ( HOIST-AT ?auto_20626 ?auto_20624 ) ( AVAILABLE ?auto_20626 ) ( SURFACE-AT ?auto_20616 ?auto_20624 ) ( ON ?auto_20616 ?auto_20625 ) ( CLEAR ?auto_20616 ) ( TRUCK-AT ?auto_20623 ?auto_20621 ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( not ( = ?auto_20615 ?auto_20625 ) ) ( not ( = ?auto_20616 ?auto_20625 ) ) ( not ( = ?auto_20620 ?auto_20626 ) ) ( not ( = ?auto_20615 ?auto_20617 ) ) ( not ( = ?auto_20615 ?auto_20622 ) ) ( not ( = ?auto_20617 ?auto_20625 ) ) ( not ( = ?auto_20619 ?auto_20624 ) ) ( not ( = ?auto_20618 ?auto_20626 ) ) ( not ( = ?auto_20622 ?auto_20625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20615 ?auto_20616 )
      ( MAKE-1CRATE ?auto_20616 ?auto_20617 )
      ( MAKE-2CRATE-VERIFY ?auto_20615 ?auto_20616 ?auto_20617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20641 - SURFACE
      ?auto_20642 - SURFACE
      ?auto_20643 - SURFACE
      ?auto_20644 - SURFACE
    )
    :vars
    (
      ?auto_20650 - HOIST
      ?auto_20646 - PLACE
      ?auto_20649 - PLACE
      ?auto_20648 - HOIST
      ?auto_20645 - SURFACE
      ?auto_20656 - PLACE
      ?auto_20652 - HOIST
      ?auto_20653 - SURFACE
      ?auto_20651 - PLACE
      ?auto_20655 - HOIST
      ?auto_20654 - SURFACE
      ?auto_20647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20650 ?auto_20646 ) ( IS-CRATE ?auto_20644 ) ( not ( = ?auto_20649 ?auto_20646 ) ) ( HOIST-AT ?auto_20648 ?auto_20649 ) ( AVAILABLE ?auto_20648 ) ( SURFACE-AT ?auto_20644 ?auto_20649 ) ( ON ?auto_20644 ?auto_20645 ) ( CLEAR ?auto_20644 ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20645 ) ) ( not ( = ?auto_20644 ?auto_20645 ) ) ( not ( = ?auto_20650 ?auto_20648 ) ) ( IS-CRATE ?auto_20643 ) ( not ( = ?auto_20656 ?auto_20646 ) ) ( HOIST-AT ?auto_20652 ?auto_20656 ) ( AVAILABLE ?auto_20652 ) ( SURFACE-AT ?auto_20643 ?auto_20656 ) ( ON ?auto_20643 ?auto_20653 ) ( CLEAR ?auto_20643 ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( not ( = ?auto_20642 ?auto_20653 ) ) ( not ( = ?auto_20643 ?auto_20653 ) ) ( not ( = ?auto_20650 ?auto_20652 ) ) ( SURFACE-AT ?auto_20641 ?auto_20646 ) ( CLEAR ?auto_20641 ) ( IS-CRATE ?auto_20642 ) ( AVAILABLE ?auto_20650 ) ( not ( = ?auto_20651 ?auto_20646 ) ) ( HOIST-AT ?auto_20655 ?auto_20651 ) ( AVAILABLE ?auto_20655 ) ( SURFACE-AT ?auto_20642 ?auto_20651 ) ( ON ?auto_20642 ?auto_20654 ) ( CLEAR ?auto_20642 ) ( TRUCK-AT ?auto_20647 ?auto_20646 ) ( not ( = ?auto_20641 ?auto_20642 ) ) ( not ( = ?auto_20641 ?auto_20654 ) ) ( not ( = ?auto_20642 ?auto_20654 ) ) ( not ( = ?auto_20650 ?auto_20655 ) ) ( not ( = ?auto_20641 ?auto_20643 ) ) ( not ( = ?auto_20641 ?auto_20653 ) ) ( not ( = ?auto_20643 ?auto_20654 ) ) ( not ( = ?auto_20656 ?auto_20651 ) ) ( not ( = ?auto_20652 ?auto_20655 ) ) ( not ( = ?auto_20653 ?auto_20654 ) ) ( not ( = ?auto_20641 ?auto_20644 ) ) ( not ( = ?auto_20641 ?auto_20645 ) ) ( not ( = ?auto_20642 ?auto_20644 ) ) ( not ( = ?auto_20642 ?auto_20645 ) ) ( not ( = ?auto_20644 ?auto_20653 ) ) ( not ( = ?auto_20644 ?auto_20654 ) ) ( not ( = ?auto_20649 ?auto_20656 ) ) ( not ( = ?auto_20649 ?auto_20651 ) ) ( not ( = ?auto_20648 ?auto_20652 ) ) ( not ( = ?auto_20648 ?auto_20655 ) ) ( not ( = ?auto_20645 ?auto_20653 ) ) ( not ( = ?auto_20645 ?auto_20654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20641 ?auto_20642 ?auto_20643 )
      ( MAKE-1CRATE ?auto_20643 ?auto_20644 )
      ( MAKE-3CRATE-VERIFY ?auto_20641 ?auto_20642 ?auto_20643 ?auto_20644 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20672 - SURFACE
      ?auto_20673 - SURFACE
      ?auto_20674 - SURFACE
      ?auto_20675 - SURFACE
      ?auto_20676 - SURFACE
    )
    :vars
    (
      ?auto_20680 - HOIST
      ?auto_20682 - PLACE
      ?auto_20681 - PLACE
      ?auto_20679 - HOIST
      ?auto_20677 - SURFACE
      ?auto_20687 - PLACE
      ?auto_20686 - HOIST
      ?auto_20689 - SURFACE
      ?auto_20688 - PLACE
      ?auto_20691 - HOIST
      ?auto_20690 - SURFACE
      ?auto_20683 - PLACE
      ?auto_20685 - HOIST
      ?auto_20684 - SURFACE
      ?auto_20678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20680 ?auto_20682 ) ( IS-CRATE ?auto_20676 ) ( not ( = ?auto_20681 ?auto_20682 ) ) ( HOIST-AT ?auto_20679 ?auto_20681 ) ( AVAILABLE ?auto_20679 ) ( SURFACE-AT ?auto_20676 ?auto_20681 ) ( ON ?auto_20676 ?auto_20677 ) ( CLEAR ?auto_20676 ) ( not ( = ?auto_20675 ?auto_20676 ) ) ( not ( = ?auto_20675 ?auto_20677 ) ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( not ( = ?auto_20680 ?auto_20679 ) ) ( IS-CRATE ?auto_20675 ) ( not ( = ?auto_20687 ?auto_20682 ) ) ( HOIST-AT ?auto_20686 ?auto_20687 ) ( AVAILABLE ?auto_20686 ) ( SURFACE-AT ?auto_20675 ?auto_20687 ) ( ON ?auto_20675 ?auto_20689 ) ( CLEAR ?auto_20675 ) ( not ( = ?auto_20674 ?auto_20675 ) ) ( not ( = ?auto_20674 ?auto_20689 ) ) ( not ( = ?auto_20675 ?auto_20689 ) ) ( not ( = ?auto_20680 ?auto_20686 ) ) ( IS-CRATE ?auto_20674 ) ( not ( = ?auto_20688 ?auto_20682 ) ) ( HOIST-AT ?auto_20691 ?auto_20688 ) ( AVAILABLE ?auto_20691 ) ( SURFACE-AT ?auto_20674 ?auto_20688 ) ( ON ?auto_20674 ?auto_20690 ) ( CLEAR ?auto_20674 ) ( not ( = ?auto_20673 ?auto_20674 ) ) ( not ( = ?auto_20673 ?auto_20690 ) ) ( not ( = ?auto_20674 ?auto_20690 ) ) ( not ( = ?auto_20680 ?auto_20691 ) ) ( SURFACE-AT ?auto_20672 ?auto_20682 ) ( CLEAR ?auto_20672 ) ( IS-CRATE ?auto_20673 ) ( AVAILABLE ?auto_20680 ) ( not ( = ?auto_20683 ?auto_20682 ) ) ( HOIST-AT ?auto_20685 ?auto_20683 ) ( AVAILABLE ?auto_20685 ) ( SURFACE-AT ?auto_20673 ?auto_20683 ) ( ON ?auto_20673 ?auto_20684 ) ( CLEAR ?auto_20673 ) ( TRUCK-AT ?auto_20678 ?auto_20682 ) ( not ( = ?auto_20672 ?auto_20673 ) ) ( not ( = ?auto_20672 ?auto_20684 ) ) ( not ( = ?auto_20673 ?auto_20684 ) ) ( not ( = ?auto_20680 ?auto_20685 ) ) ( not ( = ?auto_20672 ?auto_20674 ) ) ( not ( = ?auto_20672 ?auto_20690 ) ) ( not ( = ?auto_20674 ?auto_20684 ) ) ( not ( = ?auto_20688 ?auto_20683 ) ) ( not ( = ?auto_20691 ?auto_20685 ) ) ( not ( = ?auto_20690 ?auto_20684 ) ) ( not ( = ?auto_20672 ?auto_20675 ) ) ( not ( = ?auto_20672 ?auto_20689 ) ) ( not ( = ?auto_20673 ?auto_20675 ) ) ( not ( = ?auto_20673 ?auto_20689 ) ) ( not ( = ?auto_20675 ?auto_20690 ) ) ( not ( = ?auto_20675 ?auto_20684 ) ) ( not ( = ?auto_20687 ?auto_20688 ) ) ( not ( = ?auto_20687 ?auto_20683 ) ) ( not ( = ?auto_20686 ?auto_20691 ) ) ( not ( = ?auto_20686 ?auto_20685 ) ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( not ( = ?auto_20689 ?auto_20684 ) ) ( not ( = ?auto_20672 ?auto_20676 ) ) ( not ( = ?auto_20672 ?auto_20677 ) ) ( not ( = ?auto_20673 ?auto_20676 ) ) ( not ( = ?auto_20673 ?auto_20677 ) ) ( not ( = ?auto_20674 ?auto_20676 ) ) ( not ( = ?auto_20674 ?auto_20677 ) ) ( not ( = ?auto_20676 ?auto_20689 ) ) ( not ( = ?auto_20676 ?auto_20690 ) ) ( not ( = ?auto_20676 ?auto_20684 ) ) ( not ( = ?auto_20681 ?auto_20687 ) ) ( not ( = ?auto_20681 ?auto_20688 ) ) ( not ( = ?auto_20681 ?auto_20683 ) ) ( not ( = ?auto_20679 ?auto_20686 ) ) ( not ( = ?auto_20679 ?auto_20691 ) ) ( not ( = ?auto_20679 ?auto_20685 ) ) ( not ( = ?auto_20677 ?auto_20689 ) ) ( not ( = ?auto_20677 ?auto_20690 ) ) ( not ( = ?auto_20677 ?auto_20684 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20672 ?auto_20673 ?auto_20674 ?auto_20675 )
      ( MAKE-1CRATE ?auto_20675 ?auto_20676 )
      ( MAKE-4CRATE-VERIFY ?auto_20672 ?auto_20673 ?auto_20674 ?auto_20675 ?auto_20676 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20708 - SURFACE
      ?auto_20709 - SURFACE
      ?auto_20710 - SURFACE
      ?auto_20711 - SURFACE
      ?auto_20712 - SURFACE
      ?auto_20713 - SURFACE
    )
    :vars
    (
      ?auto_20717 - HOIST
      ?auto_20715 - PLACE
      ?auto_20719 - PLACE
      ?auto_20718 - HOIST
      ?auto_20716 - SURFACE
      ?auto_20723 - PLACE
      ?auto_20724 - HOIST
      ?auto_20727 - SURFACE
      ?auto_20721 - SURFACE
      ?auto_20722 - PLACE
      ?auto_20726 - HOIST
      ?auto_20720 - SURFACE
      ?auto_20725 - PLACE
      ?auto_20728 - HOIST
      ?auto_20729 - SURFACE
      ?auto_20714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20717 ?auto_20715 ) ( IS-CRATE ?auto_20713 ) ( not ( = ?auto_20719 ?auto_20715 ) ) ( HOIST-AT ?auto_20718 ?auto_20719 ) ( SURFACE-AT ?auto_20713 ?auto_20719 ) ( ON ?auto_20713 ?auto_20716 ) ( CLEAR ?auto_20713 ) ( not ( = ?auto_20712 ?auto_20713 ) ) ( not ( = ?auto_20712 ?auto_20716 ) ) ( not ( = ?auto_20713 ?auto_20716 ) ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( IS-CRATE ?auto_20712 ) ( not ( = ?auto_20723 ?auto_20715 ) ) ( HOIST-AT ?auto_20724 ?auto_20723 ) ( AVAILABLE ?auto_20724 ) ( SURFACE-AT ?auto_20712 ?auto_20723 ) ( ON ?auto_20712 ?auto_20727 ) ( CLEAR ?auto_20712 ) ( not ( = ?auto_20711 ?auto_20712 ) ) ( not ( = ?auto_20711 ?auto_20727 ) ) ( not ( = ?auto_20712 ?auto_20727 ) ) ( not ( = ?auto_20717 ?auto_20724 ) ) ( IS-CRATE ?auto_20711 ) ( AVAILABLE ?auto_20718 ) ( SURFACE-AT ?auto_20711 ?auto_20719 ) ( ON ?auto_20711 ?auto_20721 ) ( CLEAR ?auto_20711 ) ( not ( = ?auto_20710 ?auto_20711 ) ) ( not ( = ?auto_20710 ?auto_20721 ) ) ( not ( = ?auto_20711 ?auto_20721 ) ) ( IS-CRATE ?auto_20710 ) ( not ( = ?auto_20722 ?auto_20715 ) ) ( HOIST-AT ?auto_20726 ?auto_20722 ) ( AVAILABLE ?auto_20726 ) ( SURFACE-AT ?auto_20710 ?auto_20722 ) ( ON ?auto_20710 ?auto_20720 ) ( CLEAR ?auto_20710 ) ( not ( = ?auto_20709 ?auto_20710 ) ) ( not ( = ?auto_20709 ?auto_20720 ) ) ( not ( = ?auto_20710 ?auto_20720 ) ) ( not ( = ?auto_20717 ?auto_20726 ) ) ( SURFACE-AT ?auto_20708 ?auto_20715 ) ( CLEAR ?auto_20708 ) ( IS-CRATE ?auto_20709 ) ( AVAILABLE ?auto_20717 ) ( not ( = ?auto_20725 ?auto_20715 ) ) ( HOIST-AT ?auto_20728 ?auto_20725 ) ( AVAILABLE ?auto_20728 ) ( SURFACE-AT ?auto_20709 ?auto_20725 ) ( ON ?auto_20709 ?auto_20729 ) ( CLEAR ?auto_20709 ) ( TRUCK-AT ?auto_20714 ?auto_20715 ) ( not ( = ?auto_20708 ?auto_20709 ) ) ( not ( = ?auto_20708 ?auto_20729 ) ) ( not ( = ?auto_20709 ?auto_20729 ) ) ( not ( = ?auto_20717 ?auto_20728 ) ) ( not ( = ?auto_20708 ?auto_20710 ) ) ( not ( = ?auto_20708 ?auto_20720 ) ) ( not ( = ?auto_20710 ?auto_20729 ) ) ( not ( = ?auto_20722 ?auto_20725 ) ) ( not ( = ?auto_20726 ?auto_20728 ) ) ( not ( = ?auto_20720 ?auto_20729 ) ) ( not ( = ?auto_20708 ?auto_20711 ) ) ( not ( = ?auto_20708 ?auto_20721 ) ) ( not ( = ?auto_20709 ?auto_20711 ) ) ( not ( = ?auto_20709 ?auto_20721 ) ) ( not ( = ?auto_20711 ?auto_20720 ) ) ( not ( = ?auto_20711 ?auto_20729 ) ) ( not ( = ?auto_20719 ?auto_20722 ) ) ( not ( = ?auto_20719 ?auto_20725 ) ) ( not ( = ?auto_20718 ?auto_20726 ) ) ( not ( = ?auto_20718 ?auto_20728 ) ) ( not ( = ?auto_20721 ?auto_20720 ) ) ( not ( = ?auto_20721 ?auto_20729 ) ) ( not ( = ?auto_20708 ?auto_20712 ) ) ( not ( = ?auto_20708 ?auto_20727 ) ) ( not ( = ?auto_20709 ?auto_20712 ) ) ( not ( = ?auto_20709 ?auto_20727 ) ) ( not ( = ?auto_20710 ?auto_20712 ) ) ( not ( = ?auto_20710 ?auto_20727 ) ) ( not ( = ?auto_20712 ?auto_20721 ) ) ( not ( = ?auto_20712 ?auto_20720 ) ) ( not ( = ?auto_20712 ?auto_20729 ) ) ( not ( = ?auto_20723 ?auto_20719 ) ) ( not ( = ?auto_20723 ?auto_20722 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( not ( = ?auto_20724 ?auto_20718 ) ) ( not ( = ?auto_20724 ?auto_20726 ) ) ( not ( = ?auto_20724 ?auto_20728 ) ) ( not ( = ?auto_20727 ?auto_20721 ) ) ( not ( = ?auto_20727 ?auto_20720 ) ) ( not ( = ?auto_20727 ?auto_20729 ) ) ( not ( = ?auto_20708 ?auto_20713 ) ) ( not ( = ?auto_20708 ?auto_20716 ) ) ( not ( = ?auto_20709 ?auto_20713 ) ) ( not ( = ?auto_20709 ?auto_20716 ) ) ( not ( = ?auto_20710 ?auto_20713 ) ) ( not ( = ?auto_20710 ?auto_20716 ) ) ( not ( = ?auto_20711 ?auto_20713 ) ) ( not ( = ?auto_20711 ?auto_20716 ) ) ( not ( = ?auto_20713 ?auto_20727 ) ) ( not ( = ?auto_20713 ?auto_20721 ) ) ( not ( = ?auto_20713 ?auto_20720 ) ) ( not ( = ?auto_20713 ?auto_20729 ) ) ( not ( = ?auto_20716 ?auto_20727 ) ) ( not ( = ?auto_20716 ?auto_20721 ) ) ( not ( = ?auto_20716 ?auto_20720 ) ) ( not ( = ?auto_20716 ?auto_20729 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20708 ?auto_20709 ?auto_20710 ?auto_20711 ?auto_20712 )
      ( MAKE-1CRATE ?auto_20712 ?auto_20713 )
      ( MAKE-5CRATE-VERIFY ?auto_20708 ?auto_20709 ?auto_20710 ?auto_20711 ?auto_20712 ?auto_20713 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_20747 - SURFACE
      ?auto_20748 - SURFACE
      ?auto_20749 - SURFACE
      ?auto_20750 - SURFACE
      ?auto_20751 - SURFACE
      ?auto_20752 - SURFACE
      ?auto_20753 - SURFACE
    )
    :vars
    (
      ?auto_20759 - HOIST
      ?auto_20755 - PLACE
      ?auto_20758 - PLACE
      ?auto_20754 - HOIST
      ?auto_20756 - SURFACE
      ?auto_20764 - PLACE
      ?auto_20771 - HOIST
      ?auto_20765 - SURFACE
      ?auto_20766 - PLACE
      ?auto_20763 - HOIST
      ?auto_20760 - SURFACE
      ?auto_20772 - SURFACE
      ?auto_20769 - PLACE
      ?auto_20761 - HOIST
      ?auto_20768 - SURFACE
      ?auto_20762 - PLACE
      ?auto_20770 - HOIST
      ?auto_20767 - SURFACE
      ?auto_20757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20759 ?auto_20755 ) ( IS-CRATE ?auto_20753 ) ( not ( = ?auto_20758 ?auto_20755 ) ) ( HOIST-AT ?auto_20754 ?auto_20758 ) ( AVAILABLE ?auto_20754 ) ( SURFACE-AT ?auto_20753 ?auto_20758 ) ( ON ?auto_20753 ?auto_20756 ) ( CLEAR ?auto_20753 ) ( not ( = ?auto_20752 ?auto_20753 ) ) ( not ( = ?auto_20752 ?auto_20756 ) ) ( not ( = ?auto_20753 ?auto_20756 ) ) ( not ( = ?auto_20759 ?auto_20754 ) ) ( IS-CRATE ?auto_20752 ) ( not ( = ?auto_20764 ?auto_20755 ) ) ( HOIST-AT ?auto_20771 ?auto_20764 ) ( SURFACE-AT ?auto_20752 ?auto_20764 ) ( ON ?auto_20752 ?auto_20765 ) ( CLEAR ?auto_20752 ) ( not ( = ?auto_20751 ?auto_20752 ) ) ( not ( = ?auto_20751 ?auto_20765 ) ) ( not ( = ?auto_20752 ?auto_20765 ) ) ( not ( = ?auto_20759 ?auto_20771 ) ) ( IS-CRATE ?auto_20751 ) ( not ( = ?auto_20766 ?auto_20755 ) ) ( HOIST-AT ?auto_20763 ?auto_20766 ) ( AVAILABLE ?auto_20763 ) ( SURFACE-AT ?auto_20751 ?auto_20766 ) ( ON ?auto_20751 ?auto_20760 ) ( CLEAR ?auto_20751 ) ( not ( = ?auto_20750 ?auto_20751 ) ) ( not ( = ?auto_20750 ?auto_20760 ) ) ( not ( = ?auto_20751 ?auto_20760 ) ) ( not ( = ?auto_20759 ?auto_20763 ) ) ( IS-CRATE ?auto_20750 ) ( AVAILABLE ?auto_20771 ) ( SURFACE-AT ?auto_20750 ?auto_20764 ) ( ON ?auto_20750 ?auto_20772 ) ( CLEAR ?auto_20750 ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20772 ) ) ( not ( = ?auto_20750 ?auto_20772 ) ) ( IS-CRATE ?auto_20749 ) ( not ( = ?auto_20769 ?auto_20755 ) ) ( HOIST-AT ?auto_20761 ?auto_20769 ) ( AVAILABLE ?auto_20761 ) ( SURFACE-AT ?auto_20749 ?auto_20769 ) ( ON ?auto_20749 ?auto_20768 ) ( CLEAR ?auto_20749 ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( not ( = ?auto_20748 ?auto_20768 ) ) ( not ( = ?auto_20749 ?auto_20768 ) ) ( not ( = ?auto_20759 ?auto_20761 ) ) ( SURFACE-AT ?auto_20747 ?auto_20755 ) ( CLEAR ?auto_20747 ) ( IS-CRATE ?auto_20748 ) ( AVAILABLE ?auto_20759 ) ( not ( = ?auto_20762 ?auto_20755 ) ) ( HOIST-AT ?auto_20770 ?auto_20762 ) ( AVAILABLE ?auto_20770 ) ( SURFACE-AT ?auto_20748 ?auto_20762 ) ( ON ?auto_20748 ?auto_20767 ) ( CLEAR ?auto_20748 ) ( TRUCK-AT ?auto_20757 ?auto_20755 ) ( not ( = ?auto_20747 ?auto_20748 ) ) ( not ( = ?auto_20747 ?auto_20767 ) ) ( not ( = ?auto_20748 ?auto_20767 ) ) ( not ( = ?auto_20759 ?auto_20770 ) ) ( not ( = ?auto_20747 ?auto_20749 ) ) ( not ( = ?auto_20747 ?auto_20768 ) ) ( not ( = ?auto_20749 ?auto_20767 ) ) ( not ( = ?auto_20769 ?auto_20762 ) ) ( not ( = ?auto_20761 ?auto_20770 ) ) ( not ( = ?auto_20768 ?auto_20767 ) ) ( not ( = ?auto_20747 ?auto_20750 ) ) ( not ( = ?auto_20747 ?auto_20772 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( not ( = ?auto_20748 ?auto_20772 ) ) ( not ( = ?auto_20750 ?auto_20768 ) ) ( not ( = ?auto_20750 ?auto_20767 ) ) ( not ( = ?auto_20764 ?auto_20769 ) ) ( not ( = ?auto_20764 ?auto_20762 ) ) ( not ( = ?auto_20771 ?auto_20761 ) ) ( not ( = ?auto_20771 ?auto_20770 ) ) ( not ( = ?auto_20772 ?auto_20768 ) ) ( not ( = ?auto_20772 ?auto_20767 ) ) ( not ( = ?auto_20747 ?auto_20751 ) ) ( not ( = ?auto_20747 ?auto_20760 ) ) ( not ( = ?auto_20748 ?auto_20751 ) ) ( not ( = ?auto_20748 ?auto_20760 ) ) ( not ( = ?auto_20749 ?auto_20751 ) ) ( not ( = ?auto_20749 ?auto_20760 ) ) ( not ( = ?auto_20751 ?auto_20772 ) ) ( not ( = ?auto_20751 ?auto_20768 ) ) ( not ( = ?auto_20751 ?auto_20767 ) ) ( not ( = ?auto_20766 ?auto_20764 ) ) ( not ( = ?auto_20766 ?auto_20769 ) ) ( not ( = ?auto_20766 ?auto_20762 ) ) ( not ( = ?auto_20763 ?auto_20771 ) ) ( not ( = ?auto_20763 ?auto_20761 ) ) ( not ( = ?auto_20763 ?auto_20770 ) ) ( not ( = ?auto_20760 ?auto_20772 ) ) ( not ( = ?auto_20760 ?auto_20768 ) ) ( not ( = ?auto_20760 ?auto_20767 ) ) ( not ( = ?auto_20747 ?auto_20752 ) ) ( not ( = ?auto_20747 ?auto_20765 ) ) ( not ( = ?auto_20748 ?auto_20752 ) ) ( not ( = ?auto_20748 ?auto_20765 ) ) ( not ( = ?auto_20749 ?auto_20752 ) ) ( not ( = ?auto_20749 ?auto_20765 ) ) ( not ( = ?auto_20750 ?auto_20752 ) ) ( not ( = ?auto_20750 ?auto_20765 ) ) ( not ( = ?auto_20752 ?auto_20760 ) ) ( not ( = ?auto_20752 ?auto_20772 ) ) ( not ( = ?auto_20752 ?auto_20768 ) ) ( not ( = ?auto_20752 ?auto_20767 ) ) ( not ( = ?auto_20765 ?auto_20760 ) ) ( not ( = ?auto_20765 ?auto_20772 ) ) ( not ( = ?auto_20765 ?auto_20768 ) ) ( not ( = ?auto_20765 ?auto_20767 ) ) ( not ( = ?auto_20747 ?auto_20753 ) ) ( not ( = ?auto_20747 ?auto_20756 ) ) ( not ( = ?auto_20748 ?auto_20753 ) ) ( not ( = ?auto_20748 ?auto_20756 ) ) ( not ( = ?auto_20749 ?auto_20753 ) ) ( not ( = ?auto_20749 ?auto_20756 ) ) ( not ( = ?auto_20750 ?auto_20753 ) ) ( not ( = ?auto_20750 ?auto_20756 ) ) ( not ( = ?auto_20751 ?auto_20753 ) ) ( not ( = ?auto_20751 ?auto_20756 ) ) ( not ( = ?auto_20753 ?auto_20765 ) ) ( not ( = ?auto_20753 ?auto_20760 ) ) ( not ( = ?auto_20753 ?auto_20772 ) ) ( not ( = ?auto_20753 ?auto_20768 ) ) ( not ( = ?auto_20753 ?auto_20767 ) ) ( not ( = ?auto_20758 ?auto_20764 ) ) ( not ( = ?auto_20758 ?auto_20766 ) ) ( not ( = ?auto_20758 ?auto_20769 ) ) ( not ( = ?auto_20758 ?auto_20762 ) ) ( not ( = ?auto_20754 ?auto_20771 ) ) ( not ( = ?auto_20754 ?auto_20763 ) ) ( not ( = ?auto_20754 ?auto_20761 ) ) ( not ( = ?auto_20754 ?auto_20770 ) ) ( not ( = ?auto_20756 ?auto_20765 ) ) ( not ( = ?auto_20756 ?auto_20760 ) ) ( not ( = ?auto_20756 ?auto_20772 ) ) ( not ( = ?auto_20756 ?auto_20768 ) ) ( not ( = ?auto_20756 ?auto_20767 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20750 ?auto_20751 ?auto_20752 )
      ( MAKE-1CRATE ?auto_20752 ?auto_20753 )
      ( MAKE-6CRATE-VERIFY ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20750 ?auto_20751 ?auto_20752 ?auto_20753 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20791 - SURFACE
      ?auto_20792 - SURFACE
      ?auto_20793 - SURFACE
      ?auto_20794 - SURFACE
      ?auto_20795 - SURFACE
      ?auto_20796 - SURFACE
      ?auto_20797 - SURFACE
      ?auto_20798 - SURFACE
    )
    :vars
    (
      ?auto_20802 - HOIST
      ?auto_20799 - PLACE
      ?auto_20804 - PLACE
      ?auto_20801 - HOIST
      ?auto_20800 - SURFACE
      ?auto_20810 - PLACE
      ?auto_20809 - HOIST
      ?auto_20806 - SURFACE
      ?auto_20820 - PLACE
      ?auto_20815 - HOIST
      ?auto_20819 - SURFACE
      ?auto_20818 - PLACE
      ?auto_20811 - HOIST
      ?auto_20808 - SURFACE
      ?auto_20816 - SURFACE
      ?auto_20805 - PLACE
      ?auto_20812 - HOIST
      ?auto_20807 - SURFACE
      ?auto_20813 - PLACE
      ?auto_20814 - HOIST
      ?auto_20817 - SURFACE
      ?auto_20803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20802 ?auto_20799 ) ( IS-CRATE ?auto_20798 ) ( not ( = ?auto_20804 ?auto_20799 ) ) ( HOIST-AT ?auto_20801 ?auto_20804 ) ( AVAILABLE ?auto_20801 ) ( SURFACE-AT ?auto_20798 ?auto_20804 ) ( ON ?auto_20798 ?auto_20800 ) ( CLEAR ?auto_20798 ) ( not ( = ?auto_20797 ?auto_20798 ) ) ( not ( = ?auto_20797 ?auto_20800 ) ) ( not ( = ?auto_20798 ?auto_20800 ) ) ( not ( = ?auto_20802 ?auto_20801 ) ) ( IS-CRATE ?auto_20797 ) ( not ( = ?auto_20810 ?auto_20799 ) ) ( HOIST-AT ?auto_20809 ?auto_20810 ) ( AVAILABLE ?auto_20809 ) ( SURFACE-AT ?auto_20797 ?auto_20810 ) ( ON ?auto_20797 ?auto_20806 ) ( CLEAR ?auto_20797 ) ( not ( = ?auto_20796 ?auto_20797 ) ) ( not ( = ?auto_20796 ?auto_20806 ) ) ( not ( = ?auto_20797 ?auto_20806 ) ) ( not ( = ?auto_20802 ?auto_20809 ) ) ( IS-CRATE ?auto_20796 ) ( not ( = ?auto_20820 ?auto_20799 ) ) ( HOIST-AT ?auto_20815 ?auto_20820 ) ( SURFACE-AT ?auto_20796 ?auto_20820 ) ( ON ?auto_20796 ?auto_20819 ) ( CLEAR ?auto_20796 ) ( not ( = ?auto_20795 ?auto_20796 ) ) ( not ( = ?auto_20795 ?auto_20819 ) ) ( not ( = ?auto_20796 ?auto_20819 ) ) ( not ( = ?auto_20802 ?auto_20815 ) ) ( IS-CRATE ?auto_20795 ) ( not ( = ?auto_20818 ?auto_20799 ) ) ( HOIST-AT ?auto_20811 ?auto_20818 ) ( AVAILABLE ?auto_20811 ) ( SURFACE-AT ?auto_20795 ?auto_20818 ) ( ON ?auto_20795 ?auto_20808 ) ( CLEAR ?auto_20795 ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( not ( = ?auto_20794 ?auto_20808 ) ) ( not ( = ?auto_20795 ?auto_20808 ) ) ( not ( = ?auto_20802 ?auto_20811 ) ) ( IS-CRATE ?auto_20794 ) ( AVAILABLE ?auto_20815 ) ( SURFACE-AT ?auto_20794 ?auto_20820 ) ( ON ?auto_20794 ?auto_20816 ) ( CLEAR ?auto_20794 ) ( not ( = ?auto_20793 ?auto_20794 ) ) ( not ( = ?auto_20793 ?auto_20816 ) ) ( not ( = ?auto_20794 ?auto_20816 ) ) ( IS-CRATE ?auto_20793 ) ( not ( = ?auto_20805 ?auto_20799 ) ) ( HOIST-AT ?auto_20812 ?auto_20805 ) ( AVAILABLE ?auto_20812 ) ( SURFACE-AT ?auto_20793 ?auto_20805 ) ( ON ?auto_20793 ?auto_20807 ) ( CLEAR ?auto_20793 ) ( not ( = ?auto_20792 ?auto_20793 ) ) ( not ( = ?auto_20792 ?auto_20807 ) ) ( not ( = ?auto_20793 ?auto_20807 ) ) ( not ( = ?auto_20802 ?auto_20812 ) ) ( SURFACE-AT ?auto_20791 ?auto_20799 ) ( CLEAR ?auto_20791 ) ( IS-CRATE ?auto_20792 ) ( AVAILABLE ?auto_20802 ) ( not ( = ?auto_20813 ?auto_20799 ) ) ( HOIST-AT ?auto_20814 ?auto_20813 ) ( AVAILABLE ?auto_20814 ) ( SURFACE-AT ?auto_20792 ?auto_20813 ) ( ON ?auto_20792 ?auto_20817 ) ( CLEAR ?auto_20792 ) ( TRUCK-AT ?auto_20803 ?auto_20799 ) ( not ( = ?auto_20791 ?auto_20792 ) ) ( not ( = ?auto_20791 ?auto_20817 ) ) ( not ( = ?auto_20792 ?auto_20817 ) ) ( not ( = ?auto_20802 ?auto_20814 ) ) ( not ( = ?auto_20791 ?auto_20793 ) ) ( not ( = ?auto_20791 ?auto_20807 ) ) ( not ( = ?auto_20793 ?auto_20817 ) ) ( not ( = ?auto_20805 ?auto_20813 ) ) ( not ( = ?auto_20812 ?auto_20814 ) ) ( not ( = ?auto_20807 ?auto_20817 ) ) ( not ( = ?auto_20791 ?auto_20794 ) ) ( not ( = ?auto_20791 ?auto_20816 ) ) ( not ( = ?auto_20792 ?auto_20794 ) ) ( not ( = ?auto_20792 ?auto_20816 ) ) ( not ( = ?auto_20794 ?auto_20807 ) ) ( not ( = ?auto_20794 ?auto_20817 ) ) ( not ( = ?auto_20820 ?auto_20805 ) ) ( not ( = ?auto_20820 ?auto_20813 ) ) ( not ( = ?auto_20815 ?auto_20812 ) ) ( not ( = ?auto_20815 ?auto_20814 ) ) ( not ( = ?auto_20816 ?auto_20807 ) ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( not ( = ?auto_20791 ?auto_20795 ) ) ( not ( = ?auto_20791 ?auto_20808 ) ) ( not ( = ?auto_20792 ?auto_20795 ) ) ( not ( = ?auto_20792 ?auto_20808 ) ) ( not ( = ?auto_20793 ?auto_20795 ) ) ( not ( = ?auto_20793 ?auto_20808 ) ) ( not ( = ?auto_20795 ?auto_20816 ) ) ( not ( = ?auto_20795 ?auto_20807 ) ) ( not ( = ?auto_20795 ?auto_20817 ) ) ( not ( = ?auto_20818 ?auto_20820 ) ) ( not ( = ?auto_20818 ?auto_20805 ) ) ( not ( = ?auto_20818 ?auto_20813 ) ) ( not ( = ?auto_20811 ?auto_20815 ) ) ( not ( = ?auto_20811 ?auto_20812 ) ) ( not ( = ?auto_20811 ?auto_20814 ) ) ( not ( = ?auto_20808 ?auto_20816 ) ) ( not ( = ?auto_20808 ?auto_20807 ) ) ( not ( = ?auto_20808 ?auto_20817 ) ) ( not ( = ?auto_20791 ?auto_20796 ) ) ( not ( = ?auto_20791 ?auto_20819 ) ) ( not ( = ?auto_20792 ?auto_20796 ) ) ( not ( = ?auto_20792 ?auto_20819 ) ) ( not ( = ?auto_20793 ?auto_20796 ) ) ( not ( = ?auto_20793 ?auto_20819 ) ) ( not ( = ?auto_20794 ?auto_20796 ) ) ( not ( = ?auto_20794 ?auto_20819 ) ) ( not ( = ?auto_20796 ?auto_20808 ) ) ( not ( = ?auto_20796 ?auto_20816 ) ) ( not ( = ?auto_20796 ?auto_20807 ) ) ( not ( = ?auto_20796 ?auto_20817 ) ) ( not ( = ?auto_20819 ?auto_20808 ) ) ( not ( = ?auto_20819 ?auto_20816 ) ) ( not ( = ?auto_20819 ?auto_20807 ) ) ( not ( = ?auto_20819 ?auto_20817 ) ) ( not ( = ?auto_20791 ?auto_20797 ) ) ( not ( = ?auto_20791 ?auto_20806 ) ) ( not ( = ?auto_20792 ?auto_20797 ) ) ( not ( = ?auto_20792 ?auto_20806 ) ) ( not ( = ?auto_20793 ?auto_20797 ) ) ( not ( = ?auto_20793 ?auto_20806 ) ) ( not ( = ?auto_20794 ?auto_20797 ) ) ( not ( = ?auto_20794 ?auto_20806 ) ) ( not ( = ?auto_20795 ?auto_20797 ) ) ( not ( = ?auto_20795 ?auto_20806 ) ) ( not ( = ?auto_20797 ?auto_20819 ) ) ( not ( = ?auto_20797 ?auto_20808 ) ) ( not ( = ?auto_20797 ?auto_20816 ) ) ( not ( = ?auto_20797 ?auto_20807 ) ) ( not ( = ?auto_20797 ?auto_20817 ) ) ( not ( = ?auto_20810 ?auto_20820 ) ) ( not ( = ?auto_20810 ?auto_20818 ) ) ( not ( = ?auto_20810 ?auto_20805 ) ) ( not ( = ?auto_20810 ?auto_20813 ) ) ( not ( = ?auto_20809 ?auto_20815 ) ) ( not ( = ?auto_20809 ?auto_20811 ) ) ( not ( = ?auto_20809 ?auto_20812 ) ) ( not ( = ?auto_20809 ?auto_20814 ) ) ( not ( = ?auto_20806 ?auto_20819 ) ) ( not ( = ?auto_20806 ?auto_20808 ) ) ( not ( = ?auto_20806 ?auto_20816 ) ) ( not ( = ?auto_20806 ?auto_20807 ) ) ( not ( = ?auto_20806 ?auto_20817 ) ) ( not ( = ?auto_20791 ?auto_20798 ) ) ( not ( = ?auto_20791 ?auto_20800 ) ) ( not ( = ?auto_20792 ?auto_20798 ) ) ( not ( = ?auto_20792 ?auto_20800 ) ) ( not ( = ?auto_20793 ?auto_20798 ) ) ( not ( = ?auto_20793 ?auto_20800 ) ) ( not ( = ?auto_20794 ?auto_20798 ) ) ( not ( = ?auto_20794 ?auto_20800 ) ) ( not ( = ?auto_20795 ?auto_20798 ) ) ( not ( = ?auto_20795 ?auto_20800 ) ) ( not ( = ?auto_20796 ?auto_20798 ) ) ( not ( = ?auto_20796 ?auto_20800 ) ) ( not ( = ?auto_20798 ?auto_20806 ) ) ( not ( = ?auto_20798 ?auto_20819 ) ) ( not ( = ?auto_20798 ?auto_20808 ) ) ( not ( = ?auto_20798 ?auto_20816 ) ) ( not ( = ?auto_20798 ?auto_20807 ) ) ( not ( = ?auto_20798 ?auto_20817 ) ) ( not ( = ?auto_20804 ?auto_20810 ) ) ( not ( = ?auto_20804 ?auto_20820 ) ) ( not ( = ?auto_20804 ?auto_20818 ) ) ( not ( = ?auto_20804 ?auto_20805 ) ) ( not ( = ?auto_20804 ?auto_20813 ) ) ( not ( = ?auto_20801 ?auto_20809 ) ) ( not ( = ?auto_20801 ?auto_20815 ) ) ( not ( = ?auto_20801 ?auto_20811 ) ) ( not ( = ?auto_20801 ?auto_20812 ) ) ( not ( = ?auto_20801 ?auto_20814 ) ) ( not ( = ?auto_20800 ?auto_20806 ) ) ( not ( = ?auto_20800 ?auto_20819 ) ) ( not ( = ?auto_20800 ?auto_20808 ) ) ( not ( = ?auto_20800 ?auto_20816 ) ) ( not ( = ?auto_20800 ?auto_20807 ) ) ( not ( = ?auto_20800 ?auto_20817 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20791 ?auto_20792 ?auto_20793 ?auto_20794 ?auto_20795 ?auto_20796 ?auto_20797 )
      ( MAKE-1CRATE ?auto_20797 ?auto_20798 )
      ( MAKE-7CRATE-VERIFY ?auto_20791 ?auto_20792 ?auto_20793 ?auto_20794 ?auto_20795 ?auto_20796 ?auto_20797 ?auto_20798 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20840 - SURFACE
      ?auto_20841 - SURFACE
      ?auto_20842 - SURFACE
      ?auto_20843 - SURFACE
      ?auto_20844 - SURFACE
      ?auto_20845 - SURFACE
      ?auto_20846 - SURFACE
      ?auto_20847 - SURFACE
      ?auto_20848 - SURFACE
    )
    :vars
    (
      ?auto_20854 - HOIST
      ?auto_20853 - PLACE
      ?auto_20852 - PLACE
      ?auto_20849 - HOIST
      ?auto_20851 - SURFACE
      ?auto_20871 - PLACE
      ?auto_20870 - HOIST
      ?auto_20868 - SURFACE
      ?auto_20865 - SURFACE
      ?auto_20856 - PLACE
      ?auto_20858 - HOIST
      ?auto_20867 - SURFACE
      ?auto_20862 - PLACE
      ?auto_20869 - HOIST
      ?auto_20864 - SURFACE
      ?auto_20860 - SURFACE
      ?auto_20855 - PLACE
      ?auto_20863 - HOIST
      ?auto_20866 - SURFACE
      ?auto_20857 - PLACE
      ?auto_20859 - HOIST
      ?auto_20861 - SURFACE
      ?auto_20850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20854 ?auto_20853 ) ( IS-CRATE ?auto_20848 ) ( not ( = ?auto_20852 ?auto_20853 ) ) ( HOIST-AT ?auto_20849 ?auto_20852 ) ( SURFACE-AT ?auto_20848 ?auto_20852 ) ( ON ?auto_20848 ?auto_20851 ) ( CLEAR ?auto_20848 ) ( not ( = ?auto_20847 ?auto_20848 ) ) ( not ( = ?auto_20847 ?auto_20851 ) ) ( not ( = ?auto_20848 ?auto_20851 ) ) ( not ( = ?auto_20854 ?auto_20849 ) ) ( IS-CRATE ?auto_20847 ) ( not ( = ?auto_20871 ?auto_20853 ) ) ( HOIST-AT ?auto_20870 ?auto_20871 ) ( AVAILABLE ?auto_20870 ) ( SURFACE-AT ?auto_20847 ?auto_20871 ) ( ON ?auto_20847 ?auto_20868 ) ( CLEAR ?auto_20847 ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20868 ) ) ( not ( = ?auto_20847 ?auto_20868 ) ) ( not ( = ?auto_20854 ?auto_20870 ) ) ( IS-CRATE ?auto_20846 ) ( AVAILABLE ?auto_20849 ) ( SURFACE-AT ?auto_20846 ?auto_20852 ) ( ON ?auto_20846 ?auto_20865 ) ( CLEAR ?auto_20846 ) ( not ( = ?auto_20845 ?auto_20846 ) ) ( not ( = ?auto_20845 ?auto_20865 ) ) ( not ( = ?auto_20846 ?auto_20865 ) ) ( IS-CRATE ?auto_20845 ) ( not ( = ?auto_20856 ?auto_20853 ) ) ( HOIST-AT ?auto_20858 ?auto_20856 ) ( SURFACE-AT ?auto_20845 ?auto_20856 ) ( ON ?auto_20845 ?auto_20867 ) ( CLEAR ?auto_20845 ) ( not ( = ?auto_20844 ?auto_20845 ) ) ( not ( = ?auto_20844 ?auto_20867 ) ) ( not ( = ?auto_20845 ?auto_20867 ) ) ( not ( = ?auto_20854 ?auto_20858 ) ) ( IS-CRATE ?auto_20844 ) ( not ( = ?auto_20862 ?auto_20853 ) ) ( HOIST-AT ?auto_20869 ?auto_20862 ) ( AVAILABLE ?auto_20869 ) ( SURFACE-AT ?auto_20844 ?auto_20862 ) ( ON ?auto_20844 ?auto_20864 ) ( CLEAR ?auto_20844 ) ( not ( = ?auto_20843 ?auto_20844 ) ) ( not ( = ?auto_20843 ?auto_20864 ) ) ( not ( = ?auto_20844 ?auto_20864 ) ) ( not ( = ?auto_20854 ?auto_20869 ) ) ( IS-CRATE ?auto_20843 ) ( AVAILABLE ?auto_20858 ) ( SURFACE-AT ?auto_20843 ?auto_20856 ) ( ON ?auto_20843 ?auto_20860 ) ( CLEAR ?auto_20843 ) ( not ( = ?auto_20842 ?auto_20843 ) ) ( not ( = ?auto_20842 ?auto_20860 ) ) ( not ( = ?auto_20843 ?auto_20860 ) ) ( IS-CRATE ?auto_20842 ) ( not ( = ?auto_20855 ?auto_20853 ) ) ( HOIST-AT ?auto_20863 ?auto_20855 ) ( AVAILABLE ?auto_20863 ) ( SURFACE-AT ?auto_20842 ?auto_20855 ) ( ON ?auto_20842 ?auto_20866 ) ( CLEAR ?auto_20842 ) ( not ( = ?auto_20841 ?auto_20842 ) ) ( not ( = ?auto_20841 ?auto_20866 ) ) ( not ( = ?auto_20842 ?auto_20866 ) ) ( not ( = ?auto_20854 ?auto_20863 ) ) ( SURFACE-AT ?auto_20840 ?auto_20853 ) ( CLEAR ?auto_20840 ) ( IS-CRATE ?auto_20841 ) ( AVAILABLE ?auto_20854 ) ( not ( = ?auto_20857 ?auto_20853 ) ) ( HOIST-AT ?auto_20859 ?auto_20857 ) ( AVAILABLE ?auto_20859 ) ( SURFACE-AT ?auto_20841 ?auto_20857 ) ( ON ?auto_20841 ?auto_20861 ) ( CLEAR ?auto_20841 ) ( TRUCK-AT ?auto_20850 ?auto_20853 ) ( not ( = ?auto_20840 ?auto_20841 ) ) ( not ( = ?auto_20840 ?auto_20861 ) ) ( not ( = ?auto_20841 ?auto_20861 ) ) ( not ( = ?auto_20854 ?auto_20859 ) ) ( not ( = ?auto_20840 ?auto_20842 ) ) ( not ( = ?auto_20840 ?auto_20866 ) ) ( not ( = ?auto_20842 ?auto_20861 ) ) ( not ( = ?auto_20855 ?auto_20857 ) ) ( not ( = ?auto_20863 ?auto_20859 ) ) ( not ( = ?auto_20866 ?auto_20861 ) ) ( not ( = ?auto_20840 ?auto_20843 ) ) ( not ( = ?auto_20840 ?auto_20860 ) ) ( not ( = ?auto_20841 ?auto_20843 ) ) ( not ( = ?auto_20841 ?auto_20860 ) ) ( not ( = ?auto_20843 ?auto_20866 ) ) ( not ( = ?auto_20843 ?auto_20861 ) ) ( not ( = ?auto_20856 ?auto_20855 ) ) ( not ( = ?auto_20856 ?auto_20857 ) ) ( not ( = ?auto_20858 ?auto_20863 ) ) ( not ( = ?auto_20858 ?auto_20859 ) ) ( not ( = ?auto_20860 ?auto_20866 ) ) ( not ( = ?auto_20860 ?auto_20861 ) ) ( not ( = ?auto_20840 ?auto_20844 ) ) ( not ( = ?auto_20840 ?auto_20864 ) ) ( not ( = ?auto_20841 ?auto_20844 ) ) ( not ( = ?auto_20841 ?auto_20864 ) ) ( not ( = ?auto_20842 ?auto_20844 ) ) ( not ( = ?auto_20842 ?auto_20864 ) ) ( not ( = ?auto_20844 ?auto_20860 ) ) ( not ( = ?auto_20844 ?auto_20866 ) ) ( not ( = ?auto_20844 ?auto_20861 ) ) ( not ( = ?auto_20862 ?auto_20856 ) ) ( not ( = ?auto_20862 ?auto_20855 ) ) ( not ( = ?auto_20862 ?auto_20857 ) ) ( not ( = ?auto_20869 ?auto_20858 ) ) ( not ( = ?auto_20869 ?auto_20863 ) ) ( not ( = ?auto_20869 ?auto_20859 ) ) ( not ( = ?auto_20864 ?auto_20860 ) ) ( not ( = ?auto_20864 ?auto_20866 ) ) ( not ( = ?auto_20864 ?auto_20861 ) ) ( not ( = ?auto_20840 ?auto_20845 ) ) ( not ( = ?auto_20840 ?auto_20867 ) ) ( not ( = ?auto_20841 ?auto_20845 ) ) ( not ( = ?auto_20841 ?auto_20867 ) ) ( not ( = ?auto_20842 ?auto_20845 ) ) ( not ( = ?auto_20842 ?auto_20867 ) ) ( not ( = ?auto_20843 ?auto_20845 ) ) ( not ( = ?auto_20843 ?auto_20867 ) ) ( not ( = ?auto_20845 ?auto_20864 ) ) ( not ( = ?auto_20845 ?auto_20860 ) ) ( not ( = ?auto_20845 ?auto_20866 ) ) ( not ( = ?auto_20845 ?auto_20861 ) ) ( not ( = ?auto_20867 ?auto_20864 ) ) ( not ( = ?auto_20867 ?auto_20860 ) ) ( not ( = ?auto_20867 ?auto_20866 ) ) ( not ( = ?auto_20867 ?auto_20861 ) ) ( not ( = ?auto_20840 ?auto_20846 ) ) ( not ( = ?auto_20840 ?auto_20865 ) ) ( not ( = ?auto_20841 ?auto_20846 ) ) ( not ( = ?auto_20841 ?auto_20865 ) ) ( not ( = ?auto_20842 ?auto_20846 ) ) ( not ( = ?auto_20842 ?auto_20865 ) ) ( not ( = ?auto_20843 ?auto_20846 ) ) ( not ( = ?auto_20843 ?auto_20865 ) ) ( not ( = ?auto_20844 ?auto_20846 ) ) ( not ( = ?auto_20844 ?auto_20865 ) ) ( not ( = ?auto_20846 ?auto_20867 ) ) ( not ( = ?auto_20846 ?auto_20864 ) ) ( not ( = ?auto_20846 ?auto_20860 ) ) ( not ( = ?auto_20846 ?auto_20866 ) ) ( not ( = ?auto_20846 ?auto_20861 ) ) ( not ( = ?auto_20852 ?auto_20856 ) ) ( not ( = ?auto_20852 ?auto_20862 ) ) ( not ( = ?auto_20852 ?auto_20855 ) ) ( not ( = ?auto_20852 ?auto_20857 ) ) ( not ( = ?auto_20849 ?auto_20858 ) ) ( not ( = ?auto_20849 ?auto_20869 ) ) ( not ( = ?auto_20849 ?auto_20863 ) ) ( not ( = ?auto_20849 ?auto_20859 ) ) ( not ( = ?auto_20865 ?auto_20867 ) ) ( not ( = ?auto_20865 ?auto_20864 ) ) ( not ( = ?auto_20865 ?auto_20860 ) ) ( not ( = ?auto_20865 ?auto_20866 ) ) ( not ( = ?auto_20865 ?auto_20861 ) ) ( not ( = ?auto_20840 ?auto_20847 ) ) ( not ( = ?auto_20840 ?auto_20868 ) ) ( not ( = ?auto_20841 ?auto_20847 ) ) ( not ( = ?auto_20841 ?auto_20868 ) ) ( not ( = ?auto_20842 ?auto_20847 ) ) ( not ( = ?auto_20842 ?auto_20868 ) ) ( not ( = ?auto_20843 ?auto_20847 ) ) ( not ( = ?auto_20843 ?auto_20868 ) ) ( not ( = ?auto_20844 ?auto_20847 ) ) ( not ( = ?auto_20844 ?auto_20868 ) ) ( not ( = ?auto_20845 ?auto_20847 ) ) ( not ( = ?auto_20845 ?auto_20868 ) ) ( not ( = ?auto_20847 ?auto_20865 ) ) ( not ( = ?auto_20847 ?auto_20867 ) ) ( not ( = ?auto_20847 ?auto_20864 ) ) ( not ( = ?auto_20847 ?auto_20860 ) ) ( not ( = ?auto_20847 ?auto_20866 ) ) ( not ( = ?auto_20847 ?auto_20861 ) ) ( not ( = ?auto_20871 ?auto_20852 ) ) ( not ( = ?auto_20871 ?auto_20856 ) ) ( not ( = ?auto_20871 ?auto_20862 ) ) ( not ( = ?auto_20871 ?auto_20855 ) ) ( not ( = ?auto_20871 ?auto_20857 ) ) ( not ( = ?auto_20870 ?auto_20849 ) ) ( not ( = ?auto_20870 ?auto_20858 ) ) ( not ( = ?auto_20870 ?auto_20869 ) ) ( not ( = ?auto_20870 ?auto_20863 ) ) ( not ( = ?auto_20870 ?auto_20859 ) ) ( not ( = ?auto_20868 ?auto_20865 ) ) ( not ( = ?auto_20868 ?auto_20867 ) ) ( not ( = ?auto_20868 ?auto_20864 ) ) ( not ( = ?auto_20868 ?auto_20860 ) ) ( not ( = ?auto_20868 ?auto_20866 ) ) ( not ( = ?auto_20868 ?auto_20861 ) ) ( not ( = ?auto_20840 ?auto_20848 ) ) ( not ( = ?auto_20840 ?auto_20851 ) ) ( not ( = ?auto_20841 ?auto_20848 ) ) ( not ( = ?auto_20841 ?auto_20851 ) ) ( not ( = ?auto_20842 ?auto_20848 ) ) ( not ( = ?auto_20842 ?auto_20851 ) ) ( not ( = ?auto_20843 ?auto_20848 ) ) ( not ( = ?auto_20843 ?auto_20851 ) ) ( not ( = ?auto_20844 ?auto_20848 ) ) ( not ( = ?auto_20844 ?auto_20851 ) ) ( not ( = ?auto_20845 ?auto_20848 ) ) ( not ( = ?auto_20845 ?auto_20851 ) ) ( not ( = ?auto_20846 ?auto_20848 ) ) ( not ( = ?auto_20846 ?auto_20851 ) ) ( not ( = ?auto_20848 ?auto_20868 ) ) ( not ( = ?auto_20848 ?auto_20865 ) ) ( not ( = ?auto_20848 ?auto_20867 ) ) ( not ( = ?auto_20848 ?auto_20864 ) ) ( not ( = ?auto_20848 ?auto_20860 ) ) ( not ( = ?auto_20848 ?auto_20866 ) ) ( not ( = ?auto_20848 ?auto_20861 ) ) ( not ( = ?auto_20851 ?auto_20868 ) ) ( not ( = ?auto_20851 ?auto_20865 ) ) ( not ( = ?auto_20851 ?auto_20867 ) ) ( not ( = ?auto_20851 ?auto_20864 ) ) ( not ( = ?auto_20851 ?auto_20860 ) ) ( not ( = ?auto_20851 ?auto_20866 ) ) ( not ( = ?auto_20851 ?auto_20861 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20840 ?auto_20841 ?auto_20842 ?auto_20843 ?auto_20844 ?auto_20845 ?auto_20846 ?auto_20847 )
      ( MAKE-1CRATE ?auto_20847 ?auto_20848 )
      ( MAKE-8CRATE-VERIFY ?auto_20840 ?auto_20841 ?auto_20842 ?auto_20843 ?auto_20844 ?auto_20845 ?auto_20846 ?auto_20847 ?auto_20848 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20892 - SURFACE
      ?auto_20893 - SURFACE
      ?auto_20894 - SURFACE
      ?auto_20895 - SURFACE
      ?auto_20896 - SURFACE
      ?auto_20897 - SURFACE
      ?auto_20898 - SURFACE
      ?auto_20899 - SURFACE
      ?auto_20900 - SURFACE
      ?auto_20901 - SURFACE
    )
    :vars
    (
      ?auto_20906 - HOIST
      ?auto_20903 - PLACE
      ?auto_20904 - PLACE
      ?auto_20902 - HOIST
      ?auto_20905 - SURFACE
      ?auto_20916 - PLACE
      ?auto_20910 - HOIST
      ?auto_20909 - SURFACE
      ?auto_20915 - PLACE
      ?auto_20917 - HOIST
      ?auto_20923 - SURFACE
      ?auto_20919 - SURFACE
      ?auto_20922 - SURFACE
      ?auto_20908 - PLACE
      ?auto_20911 - HOIST
      ?auto_20920 - SURFACE
      ?auto_20913 - SURFACE
      ?auto_20925 - PLACE
      ?auto_20918 - HOIST
      ?auto_20921 - SURFACE
      ?auto_20924 - PLACE
      ?auto_20914 - HOIST
      ?auto_20912 - SURFACE
      ?auto_20907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20906 ?auto_20903 ) ( IS-CRATE ?auto_20901 ) ( not ( = ?auto_20904 ?auto_20903 ) ) ( HOIST-AT ?auto_20902 ?auto_20904 ) ( SURFACE-AT ?auto_20901 ?auto_20904 ) ( ON ?auto_20901 ?auto_20905 ) ( CLEAR ?auto_20901 ) ( not ( = ?auto_20900 ?auto_20901 ) ) ( not ( = ?auto_20900 ?auto_20905 ) ) ( not ( = ?auto_20901 ?auto_20905 ) ) ( not ( = ?auto_20906 ?auto_20902 ) ) ( IS-CRATE ?auto_20900 ) ( not ( = ?auto_20916 ?auto_20903 ) ) ( HOIST-AT ?auto_20910 ?auto_20916 ) ( SURFACE-AT ?auto_20900 ?auto_20916 ) ( ON ?auto_20900 ?auto_20909 ) ( CLEAR ?auto_20900 ) ( not ( = ?auto_20899 ?auto_20900 ) ) ( not ( = ?auto_20899 ?auto_20909 ) ) ( not ( = ?auto_20900 ?auto_20909 ) ) ( not ( = ?auto_20906 ?auto_20910 ) ) ( IS-CRATE ?auto_20899 ) ( not ( = ?auto_20915 ?auto_20903 ) ) ( HOIST-AT ?auto_20917 ?auto_20915 ) ( AVAILABLE ?auto_20917 ) ( SURFACE-AT ?auto_20899 ?auto_20915 ) ( ON ?auto_20899 ?auto_20923 ) ( CLEAR ?auto_20899 ) ( not ( = ?auto_20898 ?auto_20899 ) ) ( not ( = ?auto_20898 ?auto_20923 ) ) ( not ( = ?auto_20899 ?auto_20923 ) ) ( not ( = ?auto_20906 ?auto_20917 ) ) ( IS-CRATE ?auto_20898 ) ( AVAILABLE ?auto_20910 ) ( SURFACE-AT ?auto_20898 ?auto_20916 ) ( ON ?auto_20898 ?auto_20919 ) ( CLEAR ?auto_20898 ) ( not ( = ?auto_20897 ?auto_20898 ) ) ( not ( = ?auto_20897 ?auto_20919 ) ) ( not ( = ?auto_20898 ?auto_20919 ) ) ( IS-CRATE ?auto_20897 ) ( SURFACE-AT ?auto_20897 ?auto_20904 ) ( ON ?auto_20897 ?auto_20922 ) ( CLEAR ?auto_20897 ) ( not ( = ?auto_20896 ?auto_20897 ) ) ( not ( = ?auto_20896 ?auto_20922 ) ) ( not ( = ?auto_20897 ?auto_20922 ) ) ( IS-CRATE ?auto_20896 ) ( not ( = ?auto_20908 ?auto_20903 ) ) ( HOIST-AT ?auto_20911 ?auto_20908 ) ( AVAILABLE ?auto_20911 ) ( SURFACE-AT ?auto_20896 ?auto_20908 ) ( ON ?auto_20896 ?auto_20920 ) ( CLEAR ?auto_20896 ) ( not ( = ?auto_20895 ?auto_20896 ) ) ( not ( = ?auto_20895 ?auto_20920 ) ) ( not ( = ?auto_20896 ?auto_20920 ) ) ( not ( = ?auto_20906 ?auto_20911 ) ) ( IS-CRATE ?auto_20895 ) ( AVAILABLE ?auto_20902 ) ( SURFACE-AT ?auto_20895 ?auto_20904 ) ( ON ?auto_20895 ?auto_20913 ) ( CLEAR ?auto_20895 ) ( not ( = ?auto_20894 ?auto_20895 ) ) ( not ( = ?auto_20894 ?auto_20913 ) ) ( not ( = ?auto_20895 ?auto_20913 ) ) ( IS-CRATE ?auto_20894 ) ( not ( = ?auto_20925 ?auto_20903 ) ) ( HOIST-AT ?auto_20918 ?auto_20925 ) ( AVAILABLE ?auto_20918 ) ( SURFACE-AT ?auto_20894 ?auto_20925 ) ( ON ?auto_20894 ?auto_20921 ) ( CLEAR ?auto_20894 ) ( not ( = ?auto_20893 ?auto_20894 ) ) ( not ( = ?auto_20893 ?auto_20921 ) ) ( not ( = ?auto_20894 ?auto_20921 ) ) ( not ( = ?auto_20906 ?auto_20918 ) ) ( SURFACE-AT ?auto_20892 ?auto_20903 ) ( CLEAR ?auto_20892 ) ( IS-CRATE ?auto_20893 ) ( AVAILABLE ?auto_20906 ) ( not ( = ?auto_20924 ?auto_20903 ) ) ( HOIST-AT ?auto_20914 ?auto_20924 ) ( AVAILABLE ?auto_20914 ) ( SURFACE-AT ?auto_20893 ?auto_20924 ) ( ON ?auto_20893 ?auto_20912 ) ( CLEAR ?auto_20893 ) ( TRUCK-AT ?auto_20907 ?auto_20903 ) ( not ( = ?auto_20892 ?auto_20893 ) ) ( not ( = ?auto_20892 ?auto_20912 ) ) ( not ( = ?auto_20893 ?auto_20912 ) ) ( not ( = ?auto_20906 ?auto_20914 ) ) ( not ( = ?auto_20892 ?auto_20894 ) ) ( not ( = ?auto_20892 ?auto_20921 ) ) ( not ( = ?auto_20894 ?auto_20912 ) ) ( not ( = ?auto_20925 ?auto_20924 ) ) ( not ( = ?auto_20918 ?auto_20914 ) ) ( not ( = ?auto_20921 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20895 ) ) ( not ( = ?auto_20892 ?auto_20913 ) ) ( not ( = ?auto_20893 ?auto_20895 ) ) ( not ( = ?auto_20893 ?auto_20913 ) ) ( not ( = ?auto_20895 ?auto_20921 ) ) ( not ( = ?auto_20895 ?auto_20912 ) ) ( not ( = ?auto_20904 ?auto_20925 ) ) ( not ( = ?auto_20904 ?auto_20924 ) ) ( not ( = ?auto_20902 ?auto_20918 ) ) ( not ( = ?auto_20902 ?auto_20914 ) ) ( not ( = ?auto_20913 ?auto_20921 ) ) ( not ( = ?auto_20913 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20896 ) ) ( not ( = ?auto_20892 ?auto_20920 ) ) ( not ( = ?auto_20893 ?auto_20896 ) ) ( not ( = ?auto_20893 ?auto_20920 ) ) ( not ( = ?auto_20894 ?auto_20896 ) ) ( not ( = ?auto_20894 ?auto_20920 ) ) ( not ( = ?auto_20896 ?auto_20913 ) ) ( not ( = ?auto_20896 ?auto_20921 ) ) ( not ( = ?auto_20896 ?auto_20912 ) ) ( not ( = ?auto_20908 ?auto_20904 ) ) ( not ( = ?auto_20908 ?auto_20925 ) ) ( not ( = ?auto_20908 ?auto_20924 ) ) ( not ( = ?auto_20911 ?auto_20902 ) ) ( not ( = ?auto_20911 ?auto_20918 ) ) ( not ( = ?auto_20911 ?auto_20914 ) ) ( not ( = ?auto_20920 ?auto_20913 ) ) ( not ( = ?auto_20920 ?auto_20921 ) ) ( not ( = ?auto_20920 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20897 ) ) ( not ( = ?auto_20892 ?auto_20922 ) ) ( not ( = ?auto_20893 ?auto_20897 ) ) ( not ( = ?auto_20893 ?auto_20922 ) ) ( not ( = ?auto_20894 ?auto_20897 ) ) ( not ( = ?auto_20894 ?auto_20922 ) ) ( not ( = ?auto_20895 ?auto_20897 ) ) ( not ( = ?auto_20895 ?auto_20922 ) ) ( not ( = ?auto_20897 ?auto_20920 ) ) ( not ( = ?auto_20897 ?auto_20913 ) ) ( not ( = ?auto_20897 ?auto_20921 ) ) ( not ( = ?auto_20897 ?auto_20912 ) ) ( not ( = ?auto_20922 ?auto_20920 ) ) ( not ( = ?auto_20922 ?auto_20913 ) ) ( not ( = ?auto_20922 ?auto_20921 ) ) ( not ( = ?auto_20922 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20898 ) ) ( not ( = ?auto_20892 ?auto_20919 ) ) ( not ( = ?auto_20893 ?auto_20898 ) ) ( not ( = ?auto_20893 ?auto_20919 ) ) ( not ( = ?auto_20894 ?auto_20898 ) ) ( not ( = ?auto_20894 ?auto_20919 ) ) ( not ( = ?auto_20895 ?auto_20898 ) ) ( not ( = ?auto_20895 ?auto_20919 ) ) ( not ( = ?auto_20896 ?auto_20898 ) ) ( not ( = ?auto_20896 ?auto_20919 ) ) ( not ( = ?auto_20898 ?auto_20922 ) ) ( not ( = ?auto_20898 ?auto_20920 ) ) ( not ( = ?auto_20898 ?auto_20913 ) ) ( not ( = ?auto_20898 ?auto_20921 ) ) ( not ( = ?auto_20898 ?auto_20912 ) ) ( not ( = ?auto_20916 ?auto_20904 ) ) ( not ( = ?auto_20916 ?auto_20908 ) ) ( not ( = ?auto_20916 ?auto_20925 ) ) ( not ( = ?auto_20916 ?auto_20924 ) ) ( not ( = ?auto_20910 ?auto_20902 ) ) ( not ( = ?auto_20910 ?auto_20911 ) ) ( not ( = ?auto_20910 ?auto_20918 ) ) ( not ( = ?auto_20910 ?auto_20914 ) ) ( not ( = ?auto_20919 ?auto_20922 ) ) ( not ( = ?auto_20919 ?auto_20920 ) ) ( not ( = ?auto_20919 ?auto_20913 ) ) ( not ( = ?auto_20919 ?auto_20921 ) ) ( not ( = ?auto_20919 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20899 ) ) ( not ( = ?auto_20892 ?auto_20923 ) ) ( not ( = ?auto_20893 ?auto_20899 ) ) ( not ( = ?auto_20893 ?auto_20923 ) ) ( not ( = ?auto_20894 ?auto_20899 ) ) ( not ( = ?auto_20894 ?auto_20923 ) ) ( not ( = ?auto_20895 ?auto_20899 ) ) ( not ( = ?auto_20895 ?auto_20923 ) ) ( not ( = ?auto_20896 ?auto_20899 ) ) ( not ( = ?auto_20896 ?auto_20923 ) ) ( not ( = ?auto_20897 ?auto_20899 ) ) ( not ( = ?auto_20897 ?auto_20923 ) ) ( not ( = ?auto_20899 ?auto_20919 ) ) ( not ( = ?auto_20899 ?auto_20922 ) ) ( not ( = ?auto_20899 ?auto_20920 ) ) ( not ( = ?auto_20899 ?auto_20913 ) ) ( not ( = ?auto_20899 ?auto_20921 ) ) ( not ( = ?auto_20899 ?auto_20912 ) ) ( not ( = ?auto_20915 ?auto_20916 ) ) ( not ( = ?auto_20915 ?auto_20904 ) ) ( not ( = ?auto_20915 ?auto_20908 ) ) ( not ( = ?auto_20915 ?auto_20925 ) ) ( not ( = ?auto_20915 ?auto_20924 ) ) ( not ( = ?auto_20917 ?auto_20910 ) ) ( not ( = ?auto_20917 ?auto_20902 ) ) ( not ( = ?auto_20917 ?auto_20911 ) ) ( not ( = ?auto_20917 ?auto_20918 ) ) ( not ( = ?auto_20917 ?auto_20914 ) ) ( not ( = ?auto_20923 ?auto_20919 ) ) ( not ( = ?auto_20923 ?auto_20922 ) ) ( not ( = ?auto_20923 ?auto_20920 ) ) ( not ( = ?auto_20923 ?auto_20913 ) ) ( not ( = ?auto_20923 ?auto_20921 ) ) ( not ( = ?auto_20923 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20900 ) ) ( not ( = ?auto_20892 ?auto_20909 ) ) ( not ( = ?auto_20893 ?auto_20900 ) ) ( not ( = ?auto_20893 ?auto_20909 ) ) ( not ( = ?auto_20894 ?auto_20900 ) ) ( not ( = ?auto_20894 ?auto_20909 ) ) ( not ( = ?auto_20895 ?auto_20900 ) ) ( not ( = ?auto_20895 ?auto_20909 ) ) ( not ( = ?auto_20896 ?auto_20900 ) ) ( not ( = ?auto_20896 ?auto_20909 ) ) ( not ( = ?auto_20897 ?auto_20900 ) ) ( not ( = ?auto_20897 ?auto_20909 ) ) ( not ( = ?auto_20898 ?auto_20900 ) ) ( not ( = ?auto_20898 ?auto_20909 ) ) ( not ( = ?auto_20900 ?auto_20923 ) ) ( not ( = ?auto_20900 ?auto_20919 ) ) ( not ( = ?auto_20900 ?auto_20922 ) ) ( not ( = ?auto_20900 ?auto_20920 ) ) ( not ( = ?auto_20900 ?auto_20913 ) ) ( not ( = ?auto_20900 ?auto_20921 ) ) ( not ( = ?auto_20900 ?auto_20912 ) ) ( not ( = ?auto_20909 ?auto_20923 ) ) ( not ( = ?auto_20909 ?auto_20919 ) ) ( not ( = ?auto_20909 ?auto_20922 ) ) ( not ( = ?auto_20909 ?auto_20920 ) ) ( not ( = ?auto_20909 ?auto_20913 ) ) ( not ( = ?auto_20909 ?auto_20921 ) ) ( not ( = ?auto_20909 ?auto_20912 ) ) ( not ( = ?auto_20892 ?auto_20901 ) ) ( not ( = ?auto_20892 ?auto_20905 ) ) ( not ( = ?auto_20893 ?auto_20901 ) ) ( not ( = ?auto_20893 ?auto_20905 ) ) ( not ( = ?auto_20894 ?auto_20901 ) ) ( not ( = ?auto_20894 ?auto_20905 ) ) ( not ( = ?auto_20895 ?auto_20901 ) ) ( not ( = ?auto_20895 ?auto_20905 ) ) ( not ( = ?auto_20896 ?auto_20901 ) ) ( not ( = ?auto_20896 ?auto_20905 ) ) ( not ( = ?auto_20897 ?auto_20901 ) ) ( not ( = ?auto_20897 ?auto_20905 ) ) ( not ( = ?auto_20898 ?auto_20901 ) ) ( not ( = ?auto_20898 ?auto_20905 ) ) ( not ( = ?auto_20899 ?auto_20901 ) ) ( not ( = ?auto_20899 ?auto_20905 ) ) ( not ( = ?auto_20901 ?auto_20909 ) ) ( not ( = ?auto_20901 ?auto_20923 ) ) ( not ( = ?auto_20901 ?auto_20919 ) ) ( not ( = ?auto_20901 ?auto_20922 ) ) ( not ( = ?auto_20901 ?auto_20920 ) ) ( not ( = ?auto_20901 ?auto_20913 ) ) ( not ( = ?auto_20901 ?auto_20921 ) ) ( not ( = ?auto_20901 ?auto_20912 ) ) ( not ( = ?auto_20905 ?auto_20909 ) ) ( not ( = ?auto_20905 ?auto_20923 ) ) ( not ( = ?auto_20905 ?auto_20919 ) ) ( not ( = ?auto_20905 ?auto_20922 ) ) ( not ( = ?auto_20905 ?auto_20920 ) ) ( not ( = ?auto_20905 ?auto_20913 ) ) ( not ( = ?auto_20905 ?auto_20921 ) ) ( not ( = ?auto_20905 ?auto_20912 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20892 ?auto_20893 ?auto_20894 ?auto_20895 ?auto_20896 ?auto_20897 ?auto_20898 ?auto_20899 ?auto_20900 )
      ( MAKE-1CRATE ?auto_20900 ?auto_20901 )
      ( MAKE-9CRATE-VERIFY ?auto_20892 ?auto_20893 ?auto_20894 ?auto_20895 ?auto_20896 ?auto_20897 ?auto_20898 ?auto_20899 ?auto_20900 ?auto_20901 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_20947 - SURFACE
      ?auto_20948 - SURFACE
      ?auto_20949 - SURFACE
      ?auto_20950 - SURFACE
      ?auto_20951 - SURFACE
      ?auto_20952 - SURFACE
      ?auto_20953 - SURFACE
      ?auto_20954 - SURFACE
      ?auto_20955 - SURFACE
      ?auto_20956 - SURFACE
      ?auto_20957 - SURFACE
    )
    :vars
    (
      ?auto_20958 - HOIST
      ?auto_20960 - PLACE
      ?auto_20959 - PLACE
      ?auto_20963 - HOIST
      ?auto_20962 - SURFACE
      ?auto_20979 - PLACE
      ?auto_20980 - HOIST
      ?auto_20978 - SURFACE
      ?auto_20981 - PLACE
      ?auto_20964 - HOIST
      ?auto_20974 - SURFACE
      ?auto_20969 - PLACE
      ?auto_20966 - HOIST
      ?auto_20977 - SURFACE
      ?auto_20965 - SURFACE
      ?auto_20975 - SURFACE
      ?auto_20973 - PLACE
      ?auto_20968 - HOIST
      ?auto_20976 - SURFACE
      ?auto_20971 - SURFACE
      ?auto_20967 - PLACE
      ?auto_20982 - HOIST
      ?auto_20984 - SURFACE
      ?auto_20983 - PLACE
      ?auto_20970 - HOIST
      ?auto_20972 - SURFACE
      ?auto_20961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20958 ?auto_20960 ) ( IS-CRATE ?auto_20957 ) ( not ( = ?auto_20959 ?auto_20960 ) ) ( HOIST-AT ?auto_20963 ?auto_20959 ) ( AVAILABLE ?auto_20963 ) ( SURFACE-AT ?auto_20957 ?auto_20959 ) ( ON ?auto_20957 ?auto_20962 ) ( CLEAR ?auto_20957 ) ( not ( = ?auto_20956 ?auto_20957 ) ) ( not ( = ?auto_20956 ?auto_20962 ) ) ( not ( = ?auto_20957 ?auto_20962 ) ) ( not ( = ?auto_20958 ?auto_20963 ) ) ( IS-CRATE ?auto_20956 ) ( not ( = ?auto_20979 ?auto_20960 ) ) ( HOIST-AT ?auto_20980 ?auto_20979 ) ( SURFACE-AT ?auto_20956 ?auto_20979 ) ( ON ?auto_20956 ?auto_20978 ) ( CLEAR ?auto_20956 ) ( not ( = ?auto_20955 ?auto_20956 ) ) ( not ( = ?auto_20955 ?auto_20978 ) ) ( not ( = ?auto_20956 ?auto_20978 ) ) ( not ( = ?auto_20958 ?auto_20980 ) ) ( IS-CRATE ?auto_20955 ) ( not ( = ?auto_20981 ?auto_20960 ) ) ( HOIST-AT ?auto_20964 ?auto_20981 ) ( SURFACE-AT ?auto_20955 ?auto_20981 ) ( ON ?auto_20955 ?auto_20974 ) ( CLEAR ?auto_20955 ) ( not ( = ?auto_20954 ?auto_20955 ) ) ( not ( = ?auto_20954 ?auto_20974 ) ) ( not ( = ?auto_20955 ?auto_20974 ) ) ( not ( = ?auto_20958 ?auto_20964 ) ) ( IS-CRATE ?auto_20954 ) ( not ( = ?auto_20969 ?auto_20960 ) ) ( HOIST-AT ?auto_20966 ?auto_20969 ) ( AVAILABLE ?auto_20966 ) ( SURFACE-AT ?auto_20954 ?auto_20969 ) ( ON ?auto_20954 ?auto_20977 ) ( CLEAR ?auto_20954 ) ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20953 ?auto_20977 ) ) ( not ( = ?auto_20954 ?auto_20977 ) ) ( not ( = ?auto_20958 ?auto_20966 ) ) ( IS-CRATE ?auto_20953 ) ( AVAILABLE ?auto_20964 ) ( SURFACE-AT ?auto_20953 ?auto_20981 ) ( ON ?auto_20953 ?auto_20965 ) ( CLEAR ?auto_20953 ) ( not ( = ?auto_20952 ?auto_20953 ) ) ( not ( = ?auto_20952 ?auto_20965 ) ) ( not ( = ?auto_20953 ?auto_20965 ) ) ( IS-CRATE ?auto_20952 ) ( SURFACE-AT ?auto_20952 ?auto_20979 ) ( ON ?auto_20952 ?auto_20975 ) ( CLEAR ?auto_20952 ) ( not ( = ?auto_20951 ?auto_20952 ) ) ( not ( = ?auto_20951 ?auto_20975 ) ) ( not ( = ?auto_20952 ?auto_20975 ) ) ( IS-CRATE ?auto_20951 ) ( not ( = ?auto_20973 ?auto_20960 ) ) ( HOIST-AT ?auto_20968 ?auto_20973 ) ( AVAILABLE ?auto_20968 ) ( SURFACE-AT ?auto_20951 ?auto_20973 ) ( ON ?auto_20951 ?auto_20976 ) ( CLEAR ?auto_20951 ) ( not ( = ?auto_20950 ?auto_20951 ) ) ( not ( = ?auto_20950 ?auto_20976 ) ) ( not ( = ?auto_20951 ?auto_20976 ) ) ( not ( = ?auto_20958 ?auto_20968 ) ) ( IS-CRATE ?auto_20950 ) ( AVAILABLE ?auto_20980 ) ( SURFACE-AT ?auto_20950 ?auto_20979 ) ( ON ?auto_20950 ?auto_20971 ) ( CLEAR ?auto_20950 ) ( not ( = ?auto_20949 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20971 ) ) ( not ( = ?auto_20950 ?auto_20971 ) ) ( IS-CRATE ?auto_20949 ) ( not ( = ?auto_20967 ?auto_20960 ) ) ( HOIST-AT ?auto_20982 ?auto_20967 ) ( AVAILABLE ?auto_20982 ) ( SURFACE-AT ?auto_20949 ?auto_20967 ) ( ON ?auto_20949 ?auto_20984 ) ( CLEAR ?auto_20949 ) ( not ( = ?auto_20948 ?auto_20949 ) ) ( not ( = ?auto_20948 ?auto_20984 ) ) ( not ( = ?auto_20949 ?auto_20984 ) ) ( not ( = ?auto_20958 ?auto_20982 ) ) ( SURFACE-AT ?auto_20947 ?auto_20960 ) ( CLEAR ?auto_20947 ) ( IS-CRATE ?auto_20948 ) ( AVAILABLE ?auto_20958 ) ( not ( = ?auto_20983 ?auto_20960 ) ) ( HOIST-AT ?auto_20970 ?auto_20983 ) ( AVAILABLE ?auto_20970 ) ( SURFACE-AT ?auto_20948 ?auto_20983 ) ( ON ?auto_20948 ?auto_20972 ) ( CLEAR ?auto_20948 ) ( TRUCK-AT ?auto_20961 ?auto_20960 ) ( not ( = ?auto_20947 ?auto_20948 ) ) ( not ( = ?auto_20947 ?auto_20972 ) ) ( not ( = ?auto_20948 ?auto_20972 ) ) ( not ( = ?auto_20958 ?auto_20970 ) ) ( not ( = ?auto_20947 ?auto_20949 ) ) ( not ( = ?auto_20947 ?auto_20984 ) ) ( not ( = ?auto_20949 ?auto_20972 ) ) ( not ( = ?auto_20967 ?auto_20983 ) ) ( not ( = ?auto_20982 ?auto_20970 ) ) ( not ( = ?auto_20984 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20950 ) ) ( not ( = ?auto_20947 ?auto_20971 ) ) ( not ( = ?auto_20948 ?auto_20950 ) ) ( not ( = ?auto_20948 ?auto_20971 ) ) ( not ( = ?auto_20950 ?auto_20984 ) ) ( not ( = ?auto_20950 ?auto_20972 ) ) ( not ( = ?auto_20979 ?auto_20967 ) ) ( not ( = ?auto_20979 ?auto_20983 ) ) ( not ( = ?auto_20980 ?auto_20982 ) ) ( not ( = ?auto_20980 ?auto_20970 ) ) ( not ( = ?auto_20971 ?auto_20984 ) ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20951 ) ) ( not ( = ?auto_20947 ?auto_20976 ) ) ( not ( = ?auto_20948 ?auto_20951 ) ) ( not ( = ?auto_20948 ?auto_20976 ) ) ( not ( = ?auto_20949 ?auto_20951 ) ) ( not ( = ?auto_20949 ?auto_20976 ) ) ( not ( = ?auto_20951 ?auto_20971 ) ) ( not ( = ?auto_20951 ?auto_20984 ) ) ( not ( = ?auto_20951 ?auto_20972 ) ) ( not ( = ?auto_20973 ?auto_20979 ) ) ( not ( = ?auto_20973 ?auto_20967 ) ) ( not ( = ?auto_20973 ?auto_20983 ) ) ( not ( = ?auto_20968 ?auto_20980 ) ) ( not ( = ?auto_20968 ?auto_20982 ) ) ( not ( = ?auto_20968 ?auto_20970 ) ) ( not ( = ?auto_20976 ?auto_20971 ) ) ( not ( = ?auto_20976 ?auto_20984 ) ) ( not ( = ?auto_20976 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20952 ) ) ( not ( = ?auto_20947 ?auto_20975 ) ) ( not ( = ?auto_20948 ?auto_20952 ) ) ( not ( = ?auto_20948 ?auto_20975 ) ) ( not ( = ?auto_20949 ?auto_20952 ) ) ( not ( = ?auto_20949 ?auto_20975 ) ) ( not ( = ?auto_20950 ?auto_20952 ) ) ( not ( = ?auto_20950 ?auto_20975 ) ) ( not ( = ?auto_20952 ?auto_20976 ) ) ( not ( = ?auto_20952 ?auto_20971 ) ) ( not ( = ?auto_20952 ?auto_20984 ) ) ( not ( = ?auto_20952 ?auto_20972 ) ) ( not ( = ?auto_20975 ?auto_20976 ) ) ( not ( = ?auto_20975 ?auto_20971 ) ) ( not ( = ?auto_20975 ?auto_20984 ) ) ( not ( = ?auto_20975 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20953 ) ) ( not ( = ?auto_20947 ?auto_20965 ) ) ( not ( = ?auto_20948 ?auto_20953 ) ) ( not ( = ?auto_20948 ?auto_20965 ) ) ( not ( = ?auto_20949 ?auto_20953 ) ) ( not ( = ?auto_20949 ?auto_20965 ) ) ( not ( = ?auto_20950 ?auto_20953 ) ) ( not ( = ?auto_20950 ?auto_20965 ) ) ( not ( = ?auto_20951 ?auto_20953 ) ) ( not ( = ?auto_20951 ?auto_20965 ) ) ( not ( = ?auto_20953 ?auto_20975 ) ) ( not ( = ?auto_20953 ?auto_20976 ) ) ( not ( = ?auto_20953 ?auto_20971 ) ) ( not ( = ?auto_20953 ?auto_20984 ) ) ( not ( = ?auto_20953 ?auto_20972 ) ) ( not ( = ?auto_20981 ?auto_20979 ) ) ( not ( = ?auto_20981 ?auto_20973 ) ) ( not ( = ?auto_20981 ?auto_20967 ) ) ( not ( = ?auto_20981 ?auto_20983 ) ) ( not ( = ?auto_20964 ?auto_20980 ) ) ( not ( = ?auto_20964 ?auto_20968 ) ) ( not ( = ?auto_20964 ?auto_20982 ) ) ( not ( = ?auto_20964 ?auto_20970 ) ) ( not ( = ?auto_20965 ?auto_20975 ) ) ( not ( = ?auto_20965 ?auto_20976 ) ) ( not ( = ?auto_20965 ?auto_20971 ) ) ( not ( = ?auto_20965 ?auto_20984 ) ) ( not ( = ?auto_20965 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20954 ) ) ( not ( = ?auto_20947 ?auto_20977 ) ) ( not ( = ?auto_20948 ?auto_20954 ) ) ( not ( = ?auto_20948 ?auto_20977 ) ) ( not ( = ?auto_20949 ?auto_20954 ) ) ( not ( = ?auto_20949 ?auto_20977 ) ) ( not ( = ?auto_20950 ?auto_20954 ) ) ( not ( = ?auto_20950 ?auto_20977 ) ) ( not ( = ?auto_20951 ?auto_20954 ) ) ( not ( = ?auto_20951 ?auto_20977 ) ) ( not ( = ?auto_20952 ?auto_20954 ) ) ( not ( = ?auto_20952 ?auto_20977 ) ) ( not ( = ?auto_20954 ?auto_20965 ) ) ( not ( = ?auto_20954 ?auto_20975 ) ) ( not ( = ?auto_20954 ?auto_20976 ) ) ( not ( = ?auto_20954 ?auto_20971 ) ) ( not ( = ?auto_20954 ?auto_20984 ) ) ( not ( = ?auto_20954 ?auto_20972 ) ) ( not ( = ?auto_20969 ?auto_20981 ) ) ( not ( = ?auto_20969 ?auto_20979 ) ) ( not ( = ?auto_20969 ?auto_20973 ) ) ( not ( = ?auto_20969 ?auto_20967 ) ) ( not ( = ?auto_20969 ?auto_20983 ) ) ( not ( = ?auto_20966 ?auto_20964 ) ) ( not ( = ?auto_20966 ?auto_20980 ) ) ( not ( = ?auto_20966 ?auto_20968 ) ) ( not ( = ?auto_20966 ?auto_20982 ) ) ( not ( = ?auto_20966 ?auto_20970 ) ) ( not ( = ?auto_20977 ?auto_20965 ) ) ( not ( = ?auto_20977 ?auto_20975 ) ) ( not ( = ?auto_20977 ?auto_20976 ) ) ( not ( = ?auto_20977 ?auto_20971 ) ) ( not ( = ?auto_20977 ?auto_20984 ) ) ( not ( = ?auto_20977 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20955 ) ) ( not ( = ?auto_20947 ?auto_20974 ) ) ( not ( = ?auto_20948 ?auto_20955 ) ) ( not ( = ?auto_20948 ?auto_20974 ) ) ( not ( = ?auto_20949 ?auto_20955 ) ) ( not ( = ?auto_20949 ?auto_20974 ) ) ( not ( = ?auto_20950 ?auto_20955 ) ) ( not ( = ?auto_20950 ?auto_20974 ) ) ( not ( = ?auto_20951 ?auto_20955 ) ) ( not ( = ?auto_20951 ?auto_20974 ) ) ( not ( = ?auto_20952 ?auto_20955 ) ) ( not ( = ?auto_20952 ?auto_20974 ) ) ( not ( = ?auto_20953 ?auto_20955 ) ) ( not ( = ?auto_20953 ?auto_20974 ) ) ( not ( = ?auto_20955 ?auto_20977 ) ) ( not ( = ?auto_20955 ?auto_20965 ) ) ( not ( = ?auto_20955 ?auto_20975 ) ) ( not ( = ?auto_20955 ?auto_20976 ) ) ( not ( = ?auto_20955 ?auto_20971 ) ) ( not ( = ?auto_20955 ?auto_20984 ) ) ( not ( = ?auto_20955 ?auto_20972 ) ) ( not ( = ?auto_20974 ?auto_20977 ) ) ( not ( = ?auto_20974 ?auto_20965 ) ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20976 ) ) ( not ( = ?auto_20974 ?auto_20971 ) ) ( not ( = ?auto_20974 ?auto_20984 ) ) ( not ( = ?auto_20974 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20956 ) ) ( not ( = ?auto_20947 ?auto_20978 ) ) ( not ( = ?auto_20948 ?auto_20956 ) ) ( not ( = ?auto_20948 ?auto_20978 ) ) ( not ( = ?auto_20949 ?auto_20956 ) ) ( not ( = ?auto_20949 ?auto_20978 ) ) ( not ( = ?auto_20950 ?auto_20956 ) ) ( not ( = ?auto_20950 ?auto_20978 ) ) ( not ( = ?auto_20951 ?auto_20956 ) ) ( not ( = ?auto_20951 ?auto_20978 ) ) ( not ( = ?auto_20952 ?auto_20956 ) ) ( not ( = ?auto_20952 ?auto_20978 ) ) ( not ( = ?auto_20953 ?auto_20956 ) ) ( not ( = ?auto_20953 ?auto_20978 ) ) ( not ( = ?auto_20954 ?auto_20956 ) ) ( not ( = ?auto_20954 ?auto_20978 ) ) ( not ( = ?auto_20956 ?auto_20974 ) ) ( not ( = ?auto_20956 ?auto_20977 ) ) ( not ( = ?auto_20956 ?auto_20965 ) ) ( not ( = ?auto_20956 ?auto_20975 ) ) ( not ( = ?auto_20956 ?auto_20976 ) ) ( not ( = ?auto_20956 ?auto_20971 ) ) ( not ( = ?auto_20956 ?auto_20984 ) ) ( not ( = ?auto_20956 ?auto_20972 ) ) ( not ( = ?auto_20978 ?auto_20974 ) ) ( not ( = ?auto_20978 ?auto_20977 ) ) ( not ( = ?auto_20978 ?auto_20965 ) ) ( not ( = ?auto_20978 ?auto_20975 ) ) ( not ( = ?auto_20978 ?auto_20976 ) ) ( not ( = ?auto_20978 ?auto_20971 ) ) ( not ( = ?auto_20978 ?auto_20984 ) ) ( not ( = ?auto_20978 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20957 ) ) ( not ( = ?auto_20947 ?auto_20962 ) ) ( not ( = ?auto_20948 ?auto_20957 ) ) ( not ( = ?auto_20948 ?auto_20962 ) ) ( not ( = ?auto_20949 ?auto_20957 ) ) ( not ( = ?auto_20949 ?auto_20962 ) ) ( not ( = ?auto_20950 ?auto_20957 ) ) ( not ( = ?auto_20950 ?auto_20962 ) ) ( not ( = ?auto_20951 ?auto_20957 ) ) ( not ( = ?auto_20951 ?auto_20962 ) ) ( not ( = ?auto_20952 ?auto_20957 ) ) ( not ( = ?auto_20952 ?auto_20962 ) ) ( not ( = ?auto_20953 ?auto_20957 ) ) ( not ( = ?auto_20953 ?auto_20962 ) ) ( not ( = ?auto_20954 ?auto_20957 ) ) ( not ( = ?auto_20954 ?auto_20962 ) ) ( not ( = ?auto_20955 ?auto_20957 ) ) ( not ( = ?auto_20955 ?auto_20962 ) ) ( not ( = ?auto_20957 ?auto_20978 ) ) ( not ( = ?auto_20957 ?auto_20974 ) ) ( not ( = ?auto_20957 ?auto_20977 ) ) ( not ( = ?auto_20957 ?auto_20965 ) ) ( not ( = ?auto_20957 ?auto_20975 ) ) ( not ( = ?auto_20957 ?auto_20976 ) ) ( not ( = ?auto_20957 ?auto_20971 ) ) ( not ( = ?auto_20957 ?auto_20984 ) ) ( not ( = ?auto_20957 ?auto_20972 ) ) ( not ( = ?auto_20959 ?auto_20979 ) ) ( not ( = ?auto_20959 ?auto_20981 ) ) ( not ( = ?auto_20959 ?auto_20969 ) ) ( not ( = ?auto_20959 ?auto_20973 ) ) ( not ( = ?auto_20959 ?auto_20967 ) ) ( not ( = ?auto_20959 ?auto_20983 ) ) ( not ( = ?auto_20963 ?auto_20980 ) ) ( not ( = ?auto_20963 ?auto_20964 ) ) ( not ( = ?auto_20963 ?auto_20966 ) ) ( not ( = ?auto_20963 ?auto_20968 ) ) ( not ( = ?auto_20963 ?auto_20982 ) ) ( not ( = ?auto_20963 ?auto_20970 ) ) ( not ( = ?auto_20962 ?auto_20978 ) ) ( not ( = ?auto_20962 ?auto_20974 ) ) ( not ( = ?auto_20962 ?auto_20977 ) ) ( not ( = ?auto_20962 ?auto_20965 ) ) ( not ( = ?auto_20962 ?auto_20975 ) ) ( not ( = ?auto_20962 ?auto_20976 ) ) ( not ( = ?auto_20962 ?auto_20971 ) ) ( not ( = ?auto_20962 ?auto_20984 ) ) ( not ( = ?auto_20962 ?auto_20972 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20947 ?auto_20948 ?auto_20949 ?auto_20950 ?auto_20951 ?auto_20952 ?auto_20953 ?auto_20954 ?auto_20955 ?auto_20956 )
      ( MAKE-1CRATE ?auto_20956 ?auto_20957 )
      ( MAKE-10CRATE-VERIFY ?auto_20947 ?auto_20948 ?auto_20949 ?auto_20950 ?auto_20951 ?auto_20952 ?auto_20953 ?auto_20954 ?auto_20955 ?auto_20956 ?auto_20957 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_21007 - SURFACE
      ?auto_21008 - SURFACE
      ?auto_21009 - SURFACE
      ?auto_21010 - SURFACE
      ?auto_21011 - SURFACE
      ?auto_21012 - SURFACE
      ?auto_21013 - SURFACE
      ?auto_21014 - SURFACE
      ?auto_21015 - SURFACE
      ?auto_21016 - SURFACE
      ?auto_21017 - SURFACE
      ?auto_21018 - SURFACE
    )
    :vars
    (
      ?auto_21022 - HOIST
      ?auto_21021 - PLACE
      ?auto_21020 - PLACE
      ?auto_21023 - HOIST
      ?auto_21024 - SURFACE
      ?auto_21044 - PLACE
      ?auto_21027 - HOIST
      ?auto_21037 - SURFACE
      ?auto_21041 - PLACE
      ?auto_21033 - HOIST
      ?auto_21031 - SURFACE
      ?auto_21043 - PLACE
      ?auto_21032 - HOIST
      ?auto_21038 - SURFACE
      ?auto_21046 - PLACE
      ?auto_21034 - HOIST
      ?auto_21025 - SURFACE
      ?auto_21040 - SURFACE
      ?auto_21035 - SURFACE
      ?auto_21026 - PLACE
      ?auto_21042 - HOIST
      ?auto_21039 - SURFACE
      ?auto_21029 - SURFACE
      ?auto_21028 - SURFACE
      ?auto_21030 - PLACE
      ?auto_21036 - HOIST
      ?auto_21045 - SURFACE
      ?auto_21019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21022 ?auto_21021 ) ( IS-CRATE ?auto_21018 ) ( not ( = ?auto_21020 ?auto_21021 ) ) ( HOIST-AT ?auto_21023 ?auto_21020 ) ( SURFACE-AT ?auto_21018 ?auto_21020 ) ( ON ?auto_21018 ?auto_21024 ) ( CLEAR ?auto_21018 ) ( not ( = ?auto_21017 ?auto_21018 ) ) ( not ( = ?auto_21017 ?auto_21024 ) ) ( not ( = ?auto_21018 ?auto_21024 ) ) ( not ( = ?auto_21022 ?auto_21023 ) ) ( IS-CRATE ?auto_21017 ) ( not ( = ?auto_21044 ?auto_21021 ) ) ( HOIST-AT ?auto_21027 ?auto_21044 ) ( AVAILABLE ?auto_21027 ) ( SURFACE-AT ?auto_21017 ?auto_21044 ) ( ON ?auto_21017 ?auto_21037 ) ( CLEAR ?auto_21017 ) ( not ( = ?auto_21016 ?auto_21017 ) ) ( not ( = ?auto_21016 ?auto_21037 ) ) ( not ( = ?auto_21017 ?auto_21037 ) ) ( not ( = ?auto_21022 ?auto_21027 ) ) ( IS-CRATE ?auto_21016 ) ( not ( = ?auto_21041 ?auto_21021 ) ) ( HOIST-AT ?auto_21033 ?auto_21041 ) ( SURFACE-AT ?auto_21016 ?auto_21041 ) ( ON ?auto_21016 ?auto_21031 ) ( CLEAR ?auto_21016 ) ( not ( = ?auto_21015 ?auto_21016 ) ) ( not ( = ?auto_21015 ?auto_21031 ) ) ( not ( = ?auto_21016 ?auto_21031 ) ) ( not ( = ?auto_21022 ?auto_21033 ) ) ( IS-CRATE ?auto_21015 ) ( not ( = ?auto_21043 ?auto_21021 ) ) ( HOIST-AT ?auto_21032 ?auto_21043 ) ( SURFACE-AT ?auto_21015 ?auto_21043 ) ( ON ?auto_21015 ?auto_21038 ) ( CLEAR ?auto_21015 ) ( not ( = ?auto_21014 ?auto_21015 ) ) ( not ( = ?auto_21014 ?auto_21038 ) ) ( not ( = ?auto_21015 ?auto_21038 ) ) ( not ( = ?auto_21022 ?auto_21032 ) ) ( IS-CRATE ?auto_21014 ) ( not ( = ?auto_21046 ?auto_21021 ) ) ( HOIST-AT ?auto_21034 ?auto_21046 ) ( AVAILABLE ?auto_21034 ) ( SURFACE-AT ?auto_21014 ?auto_21046 ) ( ON ?auto_21014 ?auto_21025 ) ( CLEAR ?auto_21014 ) ( not ( = ?auto_21013 ?auto_21014 ) ) ( not ( = ?auto_21013 ?auto_21025 ) ) ( not ( = ?auto_21014 ?auto_21025 ) ) ( not ( = ?auto_21022 ?auto_21034 ) ) ( IS-CRATE ?auto_21013 ) ( AVAILABLE ?auto_21032 ) ( SURFACE-AT ?auto_21013 ?auto_21043 ) ( ON ?auto_21013 ?auto_21040 ) ( CLEAR ?auto_21013 ) ( not ( = ?auto_21012 ?auto_21013 ) ) ( not ( = ?auto_21012 ?auto_21040 ) ) ( not ( = ?auto_21013 ?auto_21040 ) ) ( IS-CRATE ?auto_21012 ) ( SURFACE-AT ?auto_21012 ?auto_21041 ) ( ON ?auto_21012 ?auto_21035 ) ( CLEAR ?auto_21012 ) ( not ( = ?auto_21011 ?auto_21012 ) ) ( not ( = ?auto_21011 ?auto_21035 ) ) ( not ( = ?auto_21012 ?auto_21035 ) ) ( IS-CRATE ?auto_21011 ) ( not ( = ?auto_21026 ?auto_21021 ) ) ( HOIST-AT ?auto_21042 ?auto_21026 ) ( AVAILABLE ?auto_21042 ) ( SURFACE-AT ?auto_21011 ?auto_21026 ) ( ON ?auto_21011 ?auto_21039 ) ( CLEAR ?auto_21011 ) ( not ( = ?auto_21010 ?auto_21011 ) ) ( not ( = ?auto_21010 ?auto_21039 ) ) ( not ( = ?auto_21011 ?auto_21039 ) ) ( not ( = ?auto_21022 ?auto_21042 ) ) ( IS-CRATE ?auto_21010 ) ( AVAILABLE ?auto_21033 ) ( SURFACE-AT ?auto_21010 ?auto_21041 ) ( ON ?auto_21010 ?auto_21029 ) ( CLEAR ?auto_21010 ) ( not ( = ?auto_21009 ?auto_21010 ) ) ( not ( = ?auto_21009 ?auto_21029 ) ) ( not ( = ?auto_21010 ?auto_21029 ) ) ( IS-CRATE ?auto_21009 ) ( AVAILABLE ?auto_21023 ) ( SURFACE-AT ?auto_21009 ?auto_21020 ) ( ON ?auto_21009 ?auto_21028 ) ( CLEAR ?auto_21009 ) ( not ( = ?auto_21008 ?auto_21009 ) ) ( not ( = ?auto_21008 ?auto_21028 ) ) ( not ( = ?auto_21009 ?auto_21028 ) ) ( SURFACE-AT ?auto_21007 ?auto_21021 ) ( CLEAR ?auto_21007 ) ( IS-CRATE ?auto_21008 ) ( AVAILABLE ?auto_21022 ) ( not ( = ?auto_21030 ?auto_21021 ) ) ( HOIST-AT ?auto_21036 ?auto_21030 ) ( AVAILABLE ?auto_21036 ) ( SURFACE-AT ?auto_21008 ?auto_21030 ) ( ON ?auto_21008 ?auto_21045 ) ( CLEAR ?auto_21008 ) ( TRUCK-AT ?auto_21019 ?auto_21021 ) ( not ( = ?auto_21007 ?auto_21008 ) ) ( not ( = ?auto_21007 ?auto_21045 ) ) ( not ( = ?auto_21008 ?auto_21045 ) ) ( not ( = ?auto_21022 ?auto_21036 ) ) ( not ( = ?auto_21007 ?auto_21009 ) ) ( not ( = ?auto_21007 ?auto_21028 ) ) ( not ( = ?auto_21009 ?auto_21045 ) ) ( not ( = ?auto_21020 ?auto_21030 ) ) ( not ( = ?auto_21023 ?auto_21036 ) ) ( not ( = ?auto_21028 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21010 ) ) ( not ( = ?auto_21007 ?auto_21029 ) ) ( not ( = ?auto_21008 ?auto_21010 ) ) ( not ( = ?auto_21008 ?auto_21029 ) ) ( not ( = ?auto_21010 ?auto_21028 ) ) ( not ( = ?auto_21010 ?auto_21045 ) ) ( not ( = ?auto_21041 ?auto_21020 ) ) ( not ( = ?auto_21041 ?auto_21030 ) ) ( not ( = ?auto_21033 ?auto_21023 ) ) ( not ( = ?auto_21033 ?auto_21036 ) ) ( not ( = ?auto_21029 ?auto_21028 ) ) ( not ( = ?auto_21029 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21011 ) ) ( not ( = ?auto_21007 ?auto_21039 ) ) ( not ( = ?auto_21008 ?auto_21011 ) ) ( not ( = ?auto_21008 ?auto_21039 ) ) ( not ( = ?auto_21009 ?auto_21011 ) ) ( not ( = ?auto_21009 ?auto_21039 ) ) ( not ( = ?auto_21011 ?auto_21029 ) ) ( not ( = ?auto_21011 ?auto_21028 ) ) ( not ( = ?auto_21011 ?auto_21045 ) ) ( not ( = ?auto_21026 ?auto_21041 ) ) ( not ( = ?auto_21026 ?auto_21020 ) ) ( not ( = ?auto_21026 ?auto_21030 ) ) ( not ( = ?auto_21042 ?auto_21033 ) ) ( not ( = ?auto_21042 ?auto_21023 ) ) ( not ( = ?auto_21042 ?auto_21036 ) ) ( not ( = ?auto_21039 ?auto_21029 ) ) ( not ( = ?auto_21039 ?auto_21028 ) ) ( not ( = ?auto_21039 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21012 ) ) ( not ( = ?auto_21007 ?auto_21035 ) ) ( not ( = ?auto_21008 ?auto_21012 ) ) ( not ( = ?auto_21008 ?auto_21035 ) ) ( not ( = ?auto_21009 ?auto_21012 ) ) ( not ( = ?auto_21009 ?auto_21035 ) ) ( not ( = ?auto_21010 ?auto_21012 ) ) ( not ( = ?auto_21010 ?auto_21035 ) ) ( not ( = ?auto_21012 ?auto_21039 ) ) ( not ( = ?auto_21012 ?auto_21029 ) ) ( not ( = ?auto_21012 ?auto_21028 ) ) ( not ( = ?auto_21012 ?auto_21045 ) ) ( not ( = ?auto_21035 ?auto_21039 ) ) ( not ( = ?auto_21035 ?auto_21029 ) ) ( not ( = ?auto_21035 ?auto_21028 ) ) ( not ( = ?auto_21035 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21013 ) ) ( not ( = ?auto_21007 ?auto_21040 ) ) ( not ( = ?auto_21008 ?auto_21013 ) ) ( not ( = ?auto_21008 ?auto_21040 ) ) ( not ( = ?auto_21009 ?auto_21013 ) ) ( not ( = ?auto_21009 ?auto_21040 ) ) ( not ( = ?auto_21010 ?auto_21013 ) ) ( not ( = ?auto_21010 ?auto_21040 ) ) ( not ( = ?auto_21011 ?auto_21013 ) ) ( not ( = ?auto_21011 ?auto_21040 ) ) ( not ( = ?auto_21013 ?auto_21035 ) ) ( not ( = ?auto_21013 ?auto_21039 ) ) ( not ( = ?auto_21013 ?auto_21029 ) ) ( not ( = ?auto_21013 ?auto_21028 ) ) ( not ( = ?auto_21013 ?auto_21045 ) ) ( not ( = ?auto_21043 ?auto_21041 ) ) ( not ( = ?auto_21043 ?auto_21026 ) ) ( not ( = ?auto_21043 ?auto_21020 ) ) ( not ( = ?auto_21043 ?auto_21030 ) ) ( not ( = ?auto_21032 ?auto_21033 ) ) ( not ( = ?auto_21032 ?auto_21042 ) ) ( not ( = ?auto_21032 ?auto_21023 ) ) ( not ( = ?auto_21032 ?auto_21036 ) ) ( not ( = ?auto_21040 ?auto_21035 ) ) ( not ( = ?auto_21040 ?auto_21039 ) ) ( not ( = ?auto_21040 ?auto_21029 ) ) ( not ( = ?auto_21040 ?auto_21028 ) ) ( not ( = ?auto_21040 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21014 ) ) ( not ( = ?auto_21007 ?auto_21025 ) ) ( not ( = ?auto_21008 ?auto_21014 ) ) ( not ( = ?auto_21008 ?auto_21025 ) ) ( not ( = ?auto_21009 ?auto_21014 ) ) ( not ( = ?auto_21009 ?auto_21025 ) ) ( not ( = ?auto_21010 ?auto_21014 ) ) ( not ( = ?auto_21010 ?auto_21025 ) ) ( not ( = ?auto_21011 ?auto_21014 ) ) ( not ( = ?auto_21011 ?auto_21025 ) ) ( not ( = ?auto_21012 ?auto_21014 ) ) ( not ( = ?auto_21012 ?auto_21025 ) ) ( not ( = ?auto_21014 ?auto_21040 ) ) ( not ( = ?auto_21014 ?auto_21035 ) ) ( not ( = ?auto_21014 ?auto_21039 ) ) ( not ( = ?auto_21014 ?auto_21029 ) ) ( not ( = ?auto_21014 ?auto_21028 ) ) ( not ( = ?auto_21014 ?auto_21045 ) ) ( not ( = ?auto_21046 ?auto_21043 ) ) ( not ( = ?auto_21046 ?auto_21041 ) ) ( not ( = ?auto_21046 ?auto_21026 ) ) ( not ( = ?auto_21046 ?auto_21020 ) ) ( not ( = ?auto_21046 ?auto_21030 ) ) ( not ( = ?auto_21034 ?auto_21032 ) ) ( not ( = ?auto_21034 ?auto_21033 ) ) ( not ( = ?auto_21034 ?auto_21042 ) ) ( not ( = ?auto_21034 ?auto_21023 ) ) ( not ( = ?auto_21034 ?auto_21036 ) ) ( not ( = ?auto_21025 ?auto_21040 ) ) ( not ( = ?auto_21025 ?auto_21035 ) ) ( not ( = ?auto_21025 ?auto_21039 ) ) ( not ( = ?auto_21025 ?auto_21029 ) ) ( not ( = ?auto_21025 ?auto_21028 ) ) ( not ( = ?auto_21025 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21015 ) ) ( not ( = ?auto_21007 ?auto_21038 ) ) ( not ( = ?auto_21008 ?auto_21015 ) ) ( not ( = ?auto_21008 ?auto_21038 ) ) ( not ( = ?auto_21009 ?auto_21015 ) ) ( not ( = ?auto_21009 ?auto_21038 ) ) ( not ( = ?auto_21010 ?auto_21015 ) ) ( not ( = ?auto_21010 ?auto_21038 ) ) ( not ( = ?auto_21011 ?auto_21015 ) ) ( not ( = ?auto_21011 ?auto_21038 ) ) ( not ( = ?auto_21012 ?auto_21015 ) ) ( not ( = ?auto_21012 ?auto_21038 ) ) ( not ( = ?auto_21013 ?auto_21015 ) ) ( not ( = ?auto_21013 ?auto_21038 ) ) ( not ( = ?auto_21015 ?auto_21025 ) ) ( not ( = ?auto_21015 ?auto_21040 ) ) ( not ( = ?auto_21015 ?auto_21035 ) ) ( not ( = ?auto_21015 ?auto_21039 ) ) ( not ( = ?auto_21015 ?auto_21029 ) ) ( not ( = ?auto_21015 ?auto_21028 ) ) ( not ( = ?auto_21015 ?auto_21045 ) ) ( not ( = ?auto_21038 ?auto_21025 ) ) ( not ( = ?auto_21038 ?auto_21040 ) ) ( not ( = ?auto_21038 ?auto_21035 ) ) ( not ( = ?auto_21038 ?auto_21039 ) ) ( not ( = ?auto_21038 ?auto_21029 ) ) ( not ( = ?auto_21038 ?auto_21028 ) ) ( not ( = ?auto_21038 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21016 ) ) ( not ( = ?auto_21007 ?auto_21031 ) ) ( not ( = ?auto_21008 ?auto_21016 ) ) ( not ( = ?auto_21008 ?auto_21031 ) ) ( not ( = ?auto_21009 ?auto_21016 ) ) ( not ( = ?auto_21009 ?auto_21031 ) ) ( not ( = ?auto_21010 ?auto_21016 ) ) ( not ( = ?auto_21010 ?auto_21031 ) ) ( not ( = ?auto_21011 ?auto_21016 ) ) ( not ( = ?auto_21011 ?auto_21031 ) ) ( not ( = ?auto_21012 ?auto_21016 ) ) ( not ( = ?auto_21012 ?auto_21031 ) ) ( not ( = ?auto_21013 ?auto_21016 ) ) ( not ( = ?auto_21013 ?auto_21031 ) ) ( not ( = ?auto_21014 ?auto_21016 ) ) ( not ( = ?auto_21014 ?auto_21031 ) ) ( not ( = ?auto_21016 ?auto_21038 ) ) ( not ( = ?auto_21016 ?auto_21025 ) ) ( not ( = ?auto_21016 ?auto_21040 ) ) ( not ( = ?auto_21016 ?auto_21035 ) ) ( not ( = ?auto_21016 ?auto_21039 ) ) ( not ( = ?auto_21016 ?auto_21029 ) ) ( not ( = ?auto_21016 ?auto_21028 ) ) ( not ( = ?auto_21016 ?auto_21045 ) ) ( not ( = ?auto_21031 ?auto_21038 ) ) ( not ( = ?auto_21031 ?auto_21025 ) ) ( not ( = ?auto_21031 ?auto_21040 ) ) ( not ( = ?auto_21031 ?auto_21035 ) ) ( not ( = ?auto_21031 ?auto_21039 ) ) ( not ( = ?auto_21031 ?auto_21029 ) ) ( not ( = ?auto_21031 ?auto_21028 ) ) ( not ( = ?auto_21031 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21017 ) ) ( not ( = ?auto_21007 ?auto_21037 ) ) ( not ( = ?auto_21008 ?auto_21017 ) ) ( not ( = ?auto_21008 ?auto_21037 ) ) ( not ( = ?auto_21009 ?auto_21017 ) ) ( not ( = ?auto_21009 ?auto_21037 ) ) ( not ( = ?auto_21010 ?auto_21017 ) ) ( not ( = ?auto_21010 ?auto_21037 ) ) ( not ( = ?auto_21011 ?auto_21017 ) ) ( not ( = ?auto_21011 ?auto_21037 ) ) ( not ( = ?auto_21012 ?auto_21017 ) ) ( not ( = ?auto_21012 ?auto_21037 ) ) ( not ( = ?auto_21013 ?auto_21017 ) ) ( not ( = ?auto_21013 ?auto_21037 ) ) ( not ( = ?auto_21014 ?auto_21017 ) ) ( not ( = ?auto_21014 ?auto_21037 ) ) ( not ( = ?auto_21015 ?auto_21017 ) ) ( not ( = ?auto_21015 ?auto_21037 ) ) ( not ( = ?auto_21017 ?auto_21031 ) ) ( not ( = ?auto_21017 ?auto_21038 ) ) ( not ( = ?auto_21017 ?auto_21025 ) ) ( not ( = ?auto_21017 ?auto_21040 ) ) ( not ( = ?auto_21017 ?auto_21035 ) ) ( not ( = ?auto_21017 ?auto_21039 ) ) ( not ( = ?auto_21017 ?auto_21029 ) ) ( not ( = ?auto_21017 ?auto_21028 ) ) ( not ( = ?auto_21017 ?auto_21045 ) ) ( not ( = ?auto_21044 ?auto_21041 ) ) ( not ( = ?auto_21044 ?auto_21043 ) ) ( not ( = ?auto_21044 ?auto_21046 ) ) ( not ( = ?auto_21044 ?auto_21026 ) ) ( not ( = ?auto_21044 ?auto_21020 ) ) ( not ( = ?auto_21044 ?auto_21030 ) ) ( not ( = ?auto_21027 ?auto_21033 ) ) ( not ( = ?auto_21027 ?auto_21032 ) ) ( not ( = ?auto_21027 ?auto_21034 ) ) ( not ( = ?auto_21027 ?auto_21042 ) ) ( not ( = ?auto_21027 ?auto_21023 ) ) ( not ( = ?auto_21027 ?auto_21036 ) ) ( not ( = ?auto_21037 ?auto_21031 ) ) ( not ( = ?auto_21037 ?auto_21038 ) ) ( not ( = ?auto_21037 ?auto_21025 ) ) ( not ( = ?auto_21037 ?auto_21040 ) ) ( not ( = ?auto_21037 ?auto_21035 ) ) ( not ( = ?auto_21037 ?auto_21039 ) ) ( not ( = ?auto_21037 ?auto_21029 ) ) ( not ( = ?auto_21037 ?auto_21028 ) ) ( not ( = ?auto_21037 ?auto_21045 ) ) ( not ( = ?auto_21007 ?auto_21018 ) ) ( not ( = ?auto_21007 ?auto_21024 ) ) ( not ( = ?auto_21008 ?auto_21018 ) ) ( not ( = ?auto_21008 ?auto_21024 ) ) ( not ( = ?auto_21009 ?auto_21018 ) ) ( not ( = ?auto_21009 ?auto_21024 ) ) ( not ( = ?auto_21010 ?auto_21018 ) ) ( not ( = ?auto_21010 ?auto_21024 ) ) ( not ( = ?auto_21011 ?auto_21018 ) ) ( not ( = ?auto_21011 ?auto_21024 ) ) ( not ( = ?auto_21012 ?auto_21018 ) ) ( not ( = ?auto_21012 ?auto_21024 ) ) ( not ( = ?auto_21013 ?auto_21018 ) ) ( not ( = ?auto_21013 ?auto_21024 ) ) ( not ( = ?auto_21014 ?auto_21018 ) ) ( not ( = ?auto_21014 ?auto_21024 ) ) ( not ( = ?auto_21015 ?auto_21018 ) ) ( not ( = ?auto_21015 ?auto_21024 ) ) ( not ( = ?auto_21016 ?auto_21018 ) ) ( not ( = ?auto_21016 ?auto_21024 ) ) ( not ( = ?auto_21018 ?auto_21037 ) ) ( not ( = ?auto_21018 ?auto_21031 ) ) ( not ( = ?auto_21018 ?auto_21038 ) ) ( not ( = ?auto_21018 ?auto_21025 ) ) ( not ( = ?auto_21018 ?auto_21040 ) ) ( not ( = ?auto_21018 ?auto_21035 ) ) ( not ( = ?auto_21018 ?auto_21039 ) ) ( not ( = ?auto_21018 ?auto_21029 ) ) ( not ( = ?auto_21018 ?auto_21028 ) ) ( not ( = ?auto_21018 ?auto_21045 ) ) ( not ( = ?auto_21024 ?auto_21037 ) ) ( not ( = ?auto_21024 ?auto_21031 ) ) ( not ( = ?auto_21024 ?auto_21038 ) ) ( not ( = ?auto_21024 ?auto_21025 ) ) ( not ( = ?auto_21024 ?auto_21040 ) ) ( not ( = ?auto_21024 ?auto_21035 ) ) ( not ( = ?auto_21024 ?auto_21039 ) ) ( not ( = ?auto_21024 ?auto_21029 ) ) ( not ( = ?auto_21024 ?auto_21028 ) ) ( not ( = ?auto_21024 ?auto_21045 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21007 ?auto_21008 ?auto_21009 ?auto_21010 ?auto_21011 ?auto_21012 ?auto_21013 ?auto_21014 ?auto_21015 ?auto_21016 ?auto_21017 )
      ( MAKE-1CRATE ?auto_21017 ?auto_21018 )
      ( MAKE-11CRATE-VERIFY ?auto_21007 ?auto_21008 ?auto_21009 ?auto_21010 ?auto_21011 ?auto_21012 ?auto_21013 ?auto_21014 ?auto_21015 ?auto_21016 ?auto_21017 ?auto_21018 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21070 - SURFACE
      ?auto_21071 - SURFACE
      ?auto_21072 - SURFACE
      ?auto_21073 - SURFACE
      ?auto_21074 - SURFACE
      ?auto_21075 - SURFACE
      ?auto_21076 - SURFACE
      ?auto_21077 - SURFACE
      ?auto_21078 - SURFACE
      ?auto_21079 - SURFACE
      ?auto_21080 - SURFACE
      ?auto_21081 - SURFACE
      ?auto_21082 - SURFACE
    )
    :vars
    (
      ?auto_21088 - HOIST
      ?auto_21085 - PLACE
      ?auto_21084 - PLACE
      ?auto_21083 - HOIST
      ?auto_21086 - SURFACE
      ?auto_21109 - PLACE
      ?auto_21089 - HOIST
      ?auto_21090 - SURFACE
      ?auto_21091 - PLACE
      ?auto_21095 - HOIST
      ?auto_21101 - SURFACE
      ?auto_21096 - PLACE
      ?auto_21113 - HOIST
      ?auto_21092 - SURFACE
      ?auto_21106 - PLACE
      ?auto_21102 - HOIST
      ?auto_21104 - SURFACE
      ?auto_21112 - PLACE
      ?auto_21098 - HOIST
      ?auto_21111 - SURFACE
      ?auto_21108 - SURFACE
      ?auto_21097 - SURFACE
      ?auto_21103 - PLACE
      ?auto_21099 - HOIST
      ?auto_21100 - SURFACE
      ?auto_21105 - SURFACE
      ?auto_21094 - SURFACE
      ?auto_21107 - PLACE
      ?auto_21110 - HOIST
      ?auto_21093 - SURFACE
      ?auto_21087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21088 ?auto_21085 ) ( IS-CRATE ?auto_21082 ) ( not ( = ?auto_21084 ?auto_21085 ) ) ( HOIST-AT ?auto_21083 ?auto_21084 ) ( AVAILABLE ?auto_21083 ) ( SURFACE-AT ?auto_21082 ?auto_21084 ) ( ON ?auto_21082 ?auto_21086 ) ( CLEAR ?auto_21082 ) ( not ( = ?auto_21081 ?auto_21082 ) ) ( not ( = ?auto_21081 ?auto_21086 ) ) ( not ( = ?auto_21082 ?auto_21086 ) ) ( not ( = ?auto_21088 ?auto_21083 ) ) ( IS-CRATE ?auto_21081 ) ( not ( = ?auto_21109 ?auto_21085 ) ) ( HOIST-AT ?auto_21089 ?auto_21109 ) ( SURFACE-AT ?auto_21081 ?auto_21109 ) ( ON ?auto_21081 ?auto_21090 ) ( CLEAR ?auto_21081 ) ( not ( = ?auto_21080 ?auto_21081 ) ) ( not ( = ?auto_21080 ?auto_21090 ) ) ( not ( = ?auto_21081 ?auto_21090 ) ) ( not ( = ?auto_21088 ?auto_21089 ) ) ( IS-CRATE ?auto_21080 ) ( not ( = ?auto_21091 ?auto_21085 ) ) ( HOIST-AT ?auto_21095 ?auto_21091 ) ( AVAILABLE ?auto_21095 ) ( SURFACE-AT ?auto_21080 ?auto_21091 ) ( ON ?auto_21080 ?auto_21101 ) ( CLEAR ?auto_21080 ) ( not ( = ?auto_21079 ?auto_21080 ) ) ( not ( = ?auto_21079 ?auto_21101 ) ) ( not ( = ?auto_21080 ?auto_21101 ) ) ( not ( = ?auto_21088 ?auto_21095 ) ) ( IS-CRATE ?auto_21079 ) ( not ( = ?auto_21096 ?auto_21085 ) ) ( HOIST-AT ?auto_21113 ?auto_21096 ) ( SURFACE-AT ?auto_21079 ?auto_21096 ) ( ON ?auto_21079 ?auto_21092 ) ( CLEAR ?auto_21079 ) ( not ( = ?auto_21078 ?auto_21079 ) ) ( not ( = ?auto_21078 ?auto_21092 ) ) ( not ( = ?auto_21079 ?auto_21092 ) ) ( not ( = ?auto_21088 ?auto_21113 ) ) ( IS-CRATE ?auto_21078 ) ( not ( = ?auto_21106 ?auto_21085 ) ) ( HOIST-AT ?auto_21102 ?auto_21106 ) ( SURFACE-AT ?auto_21078 ?auto_21106 ) ( ON ?auto_21078 ?auto_21104 ) ( CLEAR ?auto_21078 ) ( not ( = ?auto_21077 ?auto_21078 ) ) ( not ( = ?auto_21077 ?auto_21104 ) ) ( not ( = ?auto_21078 ?auto_21104 ) ) ( not ( = ?auto_21088 ?auto_21102 ) ) ( IS-CRATE ?auto_21077 ) ( not ( = ?auto_21112 ?auto_21085 ) ) ( HOIST-AT ?auto_21098 ?auto_21112 ) ( AVAILABLE ?auto_21098 ) ( SURFACE-AT ?auto_21077 ?auto_21112 ) ( ON ?auto_21077 ?auto_21111 ) ( CLEAR ?auto_21077 ) ( not ( = ?auto_21076 ?auto_21077 ) ) ( not ( = ?auto_21076 ?auto_21111 ) ) ( not ( = ?auto_21077 ?auto_21111 ) ) ( not ( = ?auto_21088 ?auto_21098 ) ) ( IS-CRATE ?auto_21076 ) ( AVAILABLE ?auto_21102 ) ( SURFACE-AT ?auto_21076 ?auto_21106 ) ( ON ?auto_21076 ?auto_21108 ) ( CLEAR ?auto_21076 ) ( not ( = ?auto_21075 ?auto_21076 ) ) ( not ( = ?auto_21075 ?auto_21108 ) ) ( not ( = ?auto_21076 ?auto_21108 ) ) ( IS-CRATE ?auto_21075 ) ( SURFACE-AT ?auto_21075 ?auto_21096 ) ( ON ?auto_21075 ?auto_21097 ) ( CLEAR ?auto_21075 ) ( not ( = ?auto_21074 ?auto_21075 ) ) ( not ( = ?auto_21074 ?auto_21097 ) ) ( not ( = ?auto_21075 ?auto_21097 ) ) ( IS-CRATE ?auto_21074 ) ( not ( = ?auto_21103 ?auto_21085 ) ) ( HOIST-AT ?auto_21099 ?auto_21103 ) ( AVAILABLE ?auto_21099 ) ( SURFACE-AT ?auto_21074 ?auto_21103 ) ( ON ?auto_21074 ?auto_21100 ) ( CLEAR ?auto_21074 ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( not ( = ?auto_21073 ?auto_21100 ) ) ( not ( = ?auto_21074 ?auto_21100 ) ) ( not ( = ?auto_21088 ?auto_21099 ) ) ( IS-CRATE ?auto_21073 ) ( AVAILABLE ?auto_21113 ) ( SURFACE-AT ?auto_21073 ?auto_21096 ) ( ON ?auto_21073 ?auto_21105 ) ( CLEAR ?auto_21073 ) ( not ( = ?auto_21072 ?auto_21073 ) ) ( not ( = ?auto_21072 ?auto_21105 ) ) ( not ( = ?auto_21073 ?auto_21105 ) ) ( IS-CRATE ?auto_21072 ) ( AVAILABLE ?auto_21089 ) ( SURFACE-AT ?auto_21072 ?auto_21109 ) ( ON ?auto_21072 ?auto_21094 ) ( CLEAR ?auto_21072 ) ( not ( = ?auto_21071 ?auto_21072 ) ) ( not ( = ?auto_21071 ?auto_21094 ) ) ( not ( = ?auto_21072 ?auto_21094 ) ) ( SURFACE-AT ?auto_21070 ?auto_21085 ) ( CLEAR ?auto_21070 ) ( IS-CRATE ?auto_21071 ) ( AVAILABLE ?auto_21088 ) ( not ( = ?auto_21107 ?auto_21085 ) ) ( HOIST-AT ?auto_21110 ?auto_21107 ) ( AVAILABLE ?auto_21110 ) ( SURFACE-AT ?auto_21071 ?auto_21107 ) ( ON ?auto_21071 ?auto_21093 ) ( CLEAR ?auto_21071 ) ( TRUCK-AT ?auto_21087 ?auto_21085 ) ( not ( = ?auto_21070 ?auto_21071 ) ) ( not ( = ?auto_21070 ?auto_21093 ) ) ( not ( = ?auto_21071 ?auto_21093 ) ) ( not ( = ?auto_21088 ?auto_21110 ) ) ( not ( = ?auto_21070 ?auto_21072 ) ) ( not ( = ?auto_21070 ?auto_21094 ) ) ( not ( = ?auto_21072 ?auto_21093 ) ) ( not ( = ?auto_21109 ?auto_21107 ) ) ( not ( = ?auto_21089 ?auto_21110 ) ) ( not ( = ?auto_21094 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21073 ) ) ( not ( = ?auto_21070 ?auto_21105 ) ) ( not ( = ?auto_21071 ?auto_21073 ) ) ( not ( = ?auto_21071 ?auto_21105 ) ) ( not ( = ?auto_21073 ?auto_21094 ) ) ( not ( = ?auto_21073 ?auto_21093 ) ) ( not ( = ?auto_21096 ?auto_21109 ) ) ( not ( = ?auto_21096 ?auto_21107 ) ) ( not ( = ?auto_21113 ?auto_21089 ) ) ( not ( = ?auto_21113 ?auto_21110 ) ) ( not ( = ?auto_21105 ?auto_21094 ) ) ( not ( = ?auto_21105 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21074 ) ) ( not ( = ?auto_21070 ?auto_21100 ) ) ( not ( = ?auto_21071 ?auto_21074 ) ) ( not ( = ?auto_21071 ?auto_21100 ) ) ( not ( = ?auto_21072 ?auto_21074 ) ) ( not ( = ?auto_21072 ?auto_21100 ) ) ( not ( = ?auto_21074 ?auto_21105 ) ) ( not ( = ?auto_21074 ?auto_21094 ) ) ( not ( = ?auto_21074 ?auto_21093 ) ) ( not ( = ?auto_21103 ?auto_21096 ) ) ( not ( = ?auto_21103 ?auto_21109 ) ) ( not ( = ?auto_21103 ?auto_21107 ) ) ( not ( = ?auto_21099 ?auto_21113 ) ) ( not ( = ?auto_21099 ?auto_21089 ) ) ( not ( = ?auto_21099 ?auto_21110 ) ) ( not ( = ?auto_21100 ?auto_21105 ) ) ( not ( = ?auto_21100 ?auto_21094 ) ) ( not ( = ?auto_21100 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21075 ) ) ( not ( = ?auto_21070 ?auto_21097 ) ) ( not ( = ?auto_21071 ?auto_21075 ) ) ( not ( = ?auto_21071 ?auto_21097 ) ) ( not ( = ?auto_21072 ?auto_21075 ) ) ( not ( = ?auto_21072 ?auto_21097 ) ) ( not ( = ?auto_21073 ?auto_21075 ) ) ( not ( = ?auto_21073 ?auto_21097 ) ) ( not ( = ?auto_21075 ?auto_21100 ) ) ( not ( = ?auto_21075 ?auto_21105 ) ) ( not ( = ?auto_21075 ?auto_21094 ) ) ( not ( = ?auto_21075 ?auto_21093 ) ) ( not ( = ?auto_21097 ?auto_21100 ) ) ( not ( = ?auto_21097 ?auto_21105 ) ) ( not ( = ?auto_21097 ?auto_21094 ) ) ( not ( = ?auto_21097 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21076 ) ) ( not ( = ?auto_21070 ?auto_21108 ) ) ( not ( = ?auto_21071 ?auto_21076 ) ) ( not ( = ?auto_21071 ?auto_21108 ) ) ( not ( = ?auto_21072 ?auto_21076 ) ) ( not ( = ?auto_21072 ?auto_21108 ) ) ( not ( = ?auto_21073 ?auto_21076 ) ) ( not ( = ?auto_21073 ?auto_21108 ) ) ( not ( = ?auto_21074 ?auto_21076 ) ) ( not ( = ?auto_21074 ?auto_21108 ) ) ( not ( = ?auto_21076 ?auto_21097 ) ) ( not ( = ?auto_21076 ?auto_21100 ) ) ( not ( = ?auto_21076 ?auto_21105 ) ) ( not ( = ?auto_21076 ?auto_21094 ) ) ( not ( = ?auto_21076 ?auto_21093 ) ) ( not ( = ?auto_21106 ?auto_21096 ) ) ( not ( = ?auto_21106 ?auto_21103 ) ) ( not ( = ?auto_21106 ?auto_21109 ) ) ( not ( = ?auto_21106 ?auto_21107 ) ) ( not ( = ?auto_21102 ?auto_21113 ) ) ( not ( = ?auto_21102 ?auto_21099 ) ) ( not ( = ?auto_21102 ?auto_21089 ) ) ( not ( = ?auto_21102 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21097 ) ) ( not ( = ?auto_21108 ?auto_21100 ) ) ( not ( = ?auto_21108 ?auto_21105 ) ) ( not ( = ?auto_21108 ?auto_21094 ) ) ( not ( = ?auto_21108 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21077 ) ) ( not ( = ?auto_21070 ?auto_21111 ) ) ( not ( = ?auto_21071 ?auto_21077 ) ) ( not ( = ?auto_21071 ?auto_21111 ) ) ( not ( = ?auto_21072 ?auto_21077 ) ) ( not ( = ?auto_21072 ?auto_21111 ) ) ( not ( = ?auto_21073 ?auto_21077 ) ) ( not ( = ?auto_21073 ?auto_21111 ) ) ( not ( = ?auto_21074 ?auto_21077 ) ) ( not ( = ?auto_21074 ?auto_21111 ) ) ( not ( = ?auto_21075 ?auto_21077 ) ) ( not ( = ?auto_21075 ?auto_21111 ) ) ( not ( = ?auto_21077 ?auto_21108 ) ) ( not ( = ?auto_21077 ?auto_21097 ) ) ( not ( = ?auto_21077 ?auto_21100 ) ) ( not ( = ?auto_21077 ?auto_21105 ) ) ( not ( = ?auto_21077 ?auto_21094 ) ) ( not ( = ?auto_21077 ?auto_21093 ) ) ( not ( = ?auto_21112 ?auto_21106 ) ) ( not ( = ?auto_21112 ?auto_21096 ) ) ( not ( = ?auto_21112 ?auto_21103 ) ) ( not ( = ?auto_21112 ?auto_21109 ) ) ( not ( = ?auto_21112 ?auto_21107 ) ) ( not ( = ?auto_21098 ?auto_21102 ) ) ( not ( = ?auto_21098 ?auto_21113 ) ) ( not ( = ?auto_21098 ?auto_21099 ) ) ( not ( = ?auto_21098 ?auto_21089 ) ) ( not ( = ?auto_21098 ?auto_21110 ) ) ( not ( = ?auto_21111 ?auto_21108 ) ) ( not ( = ?auto_21111 ?auto_21097 ) ) ( not ( = ?auto_21111 ?auto_21100 ) ) ( not ( = ?auto_21111 ?auto_21105 ) ) ( not ( = ?auto_21111 ?auto_21094 ) ) ( not ( = ?auto_21111 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21078 ) ) ( not ( = ?auto_21070 ?auto_21104 ) ) ( not ( = ?auto_21071 ?auto_21078 ) ) ( not ( = ?auto_21071 ?auto_21104 ) ) ( not ( = ?auto_21072 ?auto_21078 ) ) ( not ( = ?auto_21072 ?auto_21104 ) ) ( not ( = ?auto_21073 ?auto_21078 ) ) ( not ( = ?auto_21073 ?auto_21104 ) ) ( not ( = ?auto_21074 ?auto_21078 ) ) ( not ( = ?auto_21074 ?auto_21104 ) ) ( not ( = ?auto_21075 ?auto_21078 ) ) ( not ( = ?auto_21075 ?auto_21104 ) ) ( not ( = ?auto_21076 ?auto_21078 ) ) ( not ( = ?auto_21076 ?auto_21104 ) ) ( not ( = ?auto_21078 ?auto_21111 ) ) ( not ( = ?auto_21078 ?auto_21108 ) ) ( not ( = ?auto_21078 ?auto_21097 ) ) ( not ( = ?auto_21078 ?auto_21100 ) ) ( not ( = ?auto_21078 ?auto_21105 ) ) ( not ( = ?auto_21078 ?auto_21094 ) ) ( not ( = ?auto_21078 ?auto_21093 ) ) ( not ( = ?auto_21104 ?auto_21111 ) ) ( not ( = ?auto_21104 ?auto_21108 ) ) ( not ( = ?auto_21104 ?auto_21097 ) ) ( not ( = ?auto_21104 ?auto_21100 ) ) ( not ( = ?auto_21104 ?auto_21105 ) ) ( not ( = ?auto_21104 ?auto_21094 ) ) ( not ( = ?auto_21104 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21079 ) ) ( not ( = ?auto_21070 ?auto_21092 ) ) ( not ( = ?auto_21071 ?auto_21079 ) ) ( not ( = ?auto_21071 ?auto_21092 ) ) ( not ( = ?auto_21072 ?auto_21079 ) ) ( not ( = ?auto_21072 ?auto_21092 ) ) ( not ( = ?auto_21073 ?auto_21079 ) ) ( not ( = ?auto_21073 ?auto_21092 ) ) ( not ( = ?auto_21074 ?auto_21079 ) ) ( not ( = ?auto_21074 ?auto_21092 ) ) ( not ( = ?auto_21075 ?auto_21079 ) ) ( not ( = ?auto_21075 ?auto_21092 ) ) ( not ( = ?auto_21076 ?auto_21079 ) ) ( not ( = ?auto_21076 ?auto_21092 ) ) ( not ( = ?auto_21077 ?auto_21079 ) ) ( not ( = ?auto_21077 ?auto_21092 ) ) ( not ( = ?auto_21079 ?auto_21104 ) ) ( not ( = ?auto_21079 ?auto_21111 ) ) ( not ( = ?auto_21079 ?auto_21108 ) ) ( not ( = ?auto_21079 ?auto_21097 ) ) ( not ( = ?auto_21079 ?auto_21100 ) ) ( not ( = ?auto_21079 ?auto_21105 ) ) ( not ( = ?auto_21079 ?auto_21094 ) ) ( not ( = ?auto_21079 ?auto_21093 ) ) ( not ( = ?auto_21092 ?auto_21104 ) ) ( not ( = ?auto_21092 ?auto_21111 ) ) ( not ( = ?auto_21092 ?auto_21108 ) ) ( not ( = ?auto_21092 ?auto_21097 ) ) ( not ( = ?auto_21092 ?auto_21100 ) ) ( not ( = ?auto_21092 ?auto_21105 ) ) ( not ( = ?auto_21092 ?auto_21094 ) ) ( not ( = ?auto_21092 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21080 ) ) ( not ( = ?auto_21070 ?auto_21101 ) ) ( not ( = ?auto_21071 ?auto_21080 ) ) ( not ( = ?auto_21071 ?auto_21101 ) ) ( not ( = ?auto_21072 ?auto_21080 ) ) ( not ( = ?auto_21072 ?auto_21101 ) ) ( not ( = ?auto_21073 ?auto_21080 ) ) ( not ( = ?auto_21073 ?auto_21101 ) ) ( not ( = ?auto_21074 ?auto_21080 ) ) ( not ( = ?auto_21074 ?auto_21101 ) ) ( not ( = ?auto_21075 ?auto_21080 ) ) ( not ( = ?auto_21075 ?auto_21101 ) ) ( not ( = ?auto_21076 ?auto_21080 ) ) ( not ( = ?auto_21076 ?auto_21101 ) ) ( not ( = ?auto_21077 ?auto_21080 ) ) ( not ( = ?auto_21077 ?auto_21101 ) ) ( not ( = ?auto_21078 ?auto_21080 ) ) ( not ( = ?auto_21078 ?auto_21101 ) ) ( not ( = ?auto_21080 ?auto_21092 ) ) ( not ( = ?auto_21080 ?auto_21104 ) ) ( not ( = ?auto_21080 ?auto_21111 ) ) ( not ( = ?auto_21080 ?auto_21108 ) ) ( not ( = ?auto_21080 ?auto_21097 ) ) ( not ( = ?auto_21080 ?auto_21100 ) ) ( not ( = ?auto_21080 ?auto_21105 ) ) ( not ( = ?auto_21080 ?auto_21094 ) ) ( not ( = ?auto_21080 ?auto_21093 ) ) ( not ( = ?auto_21091 ?auto_21096 ) ) ( not ( = ?auto_21091 ?auto_21106 ) ) ( not ( = ?auto_21091 ?auto_21112 ) ) ( not ( = ?auto_21091 ?auto_21103 ) ) ( not ( = ?auto_21091 ?auto_21109 ) ) ( not ( = ?auto_21091 ?auto_21107 ) ) ( not ( = ?auto_21095 ?auto_21113 ) ) ( not ( = ?auto_21095 ?auto_21102 ) ) ( not ( = ?auto_21095 ?auto_21098 ) ) ( not ( = ?auto_21095 ?auto_21099 ) ) ( not ( = ?auto_21095 ?auto_21089 ) ) ( not ( = ?auto_21095 ?auto_21110 ) ) ( not ( = ?auto_21101 ?auto_21092 ) ) ( not ( = ?auto_21101 ?auto_21104 ) ) ( not ( = ?auto_21101 ?auto_21111 ) ) ( not ( = ?auto_21101 ?auto_21108 ) ) ( not ( = ?auto_21101 ?auto_21097 ) ) ( not ( = ?auto_21101 ?auto_21100 ) ) ( not ( = ?auto_21101 ?auto_21105 ) ) ( not ( = ?auto_21101 ?auto_21094 ) ) ( not ( = ?auto_21101 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21081 ) ) ( not ( = ?auto_21070 ?auto_21090 ) ) ( not ( = ?auto_21071 ?auto_21081 ) ) ( not ( = ?auto_21071 ?auto_21090 ) ) ( not ( = ?auto_21072 ?auto_21081 ) ) ( not ( = ?auto_21072 ?auto_21090 ) ) ( not ( = ?auto_21073 ?auto_21081 ) ) ( not ( = ?auto_21073 ?auto_21090 ) ) ( not ( = ?auto_21074 ?auto_21081 ) ) ( not ( = ?auto_21074 ?auto_21090 ) ) ( not ( = ?auto_21075 ?auto_21081 ) ) ( not ( = ?auto_21075 ?auto_21090 ) ) ( not ( = ?auto_21076 ?auto_21081 ) ) ( not ( = ?auto_21076 ?auto_21090 ) ) ( not ( = ?auto_21077 ?auto_21081 ) ) ( not ( = ?auto_21077 ?auto_21090 ) ) ( not ( = ?auto_21078 ?auto_21081 ) ) ( not ( = ?auto_21078 ?auto_21090 ) ) ( not ( = ?auto_21079 ?auto_21081 ) ) ( not ( = ?auto_21079 ?auto_21090 ) ) ( not ( = ?auto_21081 ?auto_21101 ) ) ( not ( = ?auto_21081 ?auto_21092 ) ) ( not ( = ?auto_21081 ?auto_21104 ) ) ( not ( = ?auto_21081 ?auto_21111 ) ) ( not ( = ?auto_21081 ?auto_21108 ) ) ( not ( = ?auto_21081 ?auto_21097 ) ) ( not ( = ?auto_21081 ?auto_21100 ) ) ( not ( = ?auto_21081 ?auto_21105 ) ) ( not ( = ?auto_21081 ?auto_21094 ) ) ( not ( = ?auto_21081 ?auto_21093 ) ) ( not ( = ?auto_21090 ?auto_21101 ) ) ( not ( = ?auto_21090 ?auto_21092 ) ) ( not ( = ?auto_21090 ?auto_21104 ) ) ( not ( = ?auto_21090 ?auto_21111 ) ) ( not ( = ?auto_21090 ?auto_21108 ) ) ( not ( = ?auto_21090 ?auto_21097 ) ) ( not ( = ?auto_21090 ?auto_21100 ) ) ( not ( = ?auto_21090 ?auto_21105 ) ) ( not ( = ?auto_21090 ?auto_21094 ) ) ( not ( = ?auto_21090 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21082 ) ) ( not ( = ?auto_21070 ?auto_21086 ) ) ( not ( = ?auto_21071 ?auto_21082 ) ) ( not ( = ?auto_21071 ?auto_21086 ) ) ( not ( = ?auto_21072 ?auto_21082 ) ) ( not ( = ?auto_21072 ?auto_21086 ) ) ( not ( = ?auto_21073 ?auto_21082 ) ) ( not ( = ?auto_21073 ?auto_21086 ) ) ( not ( = ?auto_21074 ?auto_21082 ) ) ( not ( = ?auto_21074 ?auto_21086 ) ) ( not ( = ?auto_21075 ?auto_21082 ) ) ( not ( = ?auto_21075 ?auto_21086 ) ) ( not ( = ?auto_21076 ?auto_21082 ) ) ( not ( = ?auto_21076 ?auto_21086 ) ) ( not ( = ?auto_21077 ?auto_21082 ) ) ( not ( = ?auto_21077 ?auto_21086 ) ) ( not ( = ?auto_21078 ?auto_21082 ) ) ( not ( = ?auto_21078 ?auto_21086 ) ) ( not ( = ?auto_21079 ?auto_21082 ) ) ( not ( = ?auto_21079 ?auto_21086 ) ) ( not ( = ?auto_21080 ?auto_21082 ) ) ( not ( = ?auto_21080 ?auto_21086 ) ) ( not ( = ?auto_21082 ?auto_21090 ) ) ( not ( = ?auto_21082 ?auto_21101 ) ) ( not ( = ?auto_21082 ?auto_21092 ) ) ( not ( = ?auto_21082 ?auto_21104 ) ) ( not ( = ?auto_21082 ?auto_21111 ) ) ( not ( = ?auto_21082 ?auto_21108 ) ) ( not ( = ?auto_21082 ?auto_21097 ) ) ( not ( = ?auto_21082 ?auto_21100 ) ) ( not ( = ?auto_21082 ?auto_21105 ) ) ( not ( = ?auto_21082 ?auto_21094 ) ) ( not ( = ?auto_21082 ?auto_21093 ) ) ( not ( = ?auto_21084 ?auto_21109 ) ) ( not ( = ?auto_21084 ?auto_21091 ) ) ( not ( = ?auto_21084 ?auto_21096 ) ) ( not ( = ?auto_21084 ?auto_21106 ) ) ( not ( = ?auto_21084 ?auto_21112 ) ) ( not ( = ?auto_21084 ?auto_21103 ) ) ( not ( = ?auto_21084 ?auto_21107 ) ) ( not ( = ?auto_21083 ?auto_21089 ) ) ( not ( = ?auto_21083 ?auto_21095 ) ) ( not ( = ?auto_21083 ?auto_21113 ) ) ( not ( = ?auto_21083 ?auto_21102 ) ) ( not ( = ?auto_21083 ?auto_21098 ) ) ( not ( = ?auto_21083 ?auto_21099 ) ) ( not ( = ?auto_21083 ?auto_21110 ) ) ( not ( = ?auto_21086 ?auto_21090 ) ) ( not ( = ?auto_21086 ?auto_21101 ) ) ( not ( = ?auto_21086 ?auto_21092 ) ) ( not ( = ?auto_21086 ?auto_21104 ) ) ( not ( = ?auto_21086 ?auto_21111 ) ) ( not ( = ?auto_21086 ?auto_21108 ) ) ( not ( = ?auto_21086 ?auto_21097 ) ) ( not ( = ?auto_21086 ?auto_21100 ) ) ( not ( = ?auto_21086 ?auto_21105 ) ) ( not ( = ?auto_21086 ?auto_21094 ) ) ( not ( = ?auto_21086 ?auto_21093 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21070 ?auto_21071 ?auto_21072 ?auto_21073 ?auto_21074 ?auto_21075 ?auto_21076 ?auto_21077 ?auto_21078 ?auto_21079 ?auto_21080 ?auto_21081 )
      ( MAKE-1CRATE ?auto_21081 ?auto_21082 )
      ( MAKE-12CRATE-VERIFY ?auto_21070 ?auto_21071 ?auto_21072 ?auto_21073 ?auto_21074 ?auto_21075 ?auto_21076 ?auto_21077 ?auto_21078 ?auto_21079 ?auto_21080 ?auto_21081 ?auto_21082 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21138 - SURFACE
      ?auto_21139 - SURFACE
      ?auto_21140 - SURFACE
      ?auto_21141 - SURFACE
      ?auto_21142 - SURFACE
      ?auto_21143 - SURFACE
      ?auto_21144 - SURFACE
      ?auto_21145 - SURFACE
      ?auto_21146 - SURFACE
      ?auto_21147 - SURFACE
      ?auto_21148 - SURFACE
      ?auto_21149 - SURFACE
      ?auto_21150 - SURFACE
      ?auto_21151 - SURFACE
    )
    :vars
    (
      ?auto_21155 - HOIST
      ?auto_21156 - PLACE
      ?auto_21157 - PLACE
      ?auto_21154 - HOIST
      ?auto_21153 - SURFACE
      ?auto_21160 - PLACE
      ?auto_21165 - HOIST
      ?auto_21161 - SURFACE
      ?auto_21172 - PLACE
      ?auto_21170 - HOIST
      ?auto_21171 - SURFACE
      ?auto_21163 - SURFACE
      ?auto_21166 - PLACE
      ?auto_21164 - HOIST
      ?auto_21167 - SURFACE
      ?auto_21183 - PLACE
      ?auto_21176 - HOIST
      ?auto_21174 - SURFACE
      ?auto_21158 - PLACE
      ?auto_21168 - HOIST
      ?auto_21177 - SURFACE
      ?auto_21178 - SURFACE
      ?auto_21175 - SURFACE
      ?auto_21182 - PLACE
      ?auto_21180 - HOIST
      ?auto_21173 - SURFACE
      ?auto_21181 - SURFACE
      ?auto_21169 - SURFACE
      ?auto_21162 - PLACE
      ?auto_21179 - HOIST
      ?auto_21159 - SURFACE
      ?auto_21152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21155 ?auto_21156 ) ( IS-CRATE ?auto_21151 ) ( not ( = ?auto_21157 ?auto_21156 ) ) ( HOIST-AT ?auto_21154 ?auto_21157 ) ( SURFACE-AT ?auto_21151 ?auto_21157 ) ( ON ?auto_21151 ?auto_21153 ) ( CLEAR ?auto_21151 ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21150 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21155 ?auto_21154 ) ) ( IS-CRATE ?auto_21150 ) ( not ( = ?auto_21160 ?auto_21156 ) ) ( HOIST-AT ?auto_21165 ?auto_21160 ) ( AVAILABLE ?auto_21165 ) ( SURFACE-AT ?auto_21150 ?auto_21160 ) ( ON ?auto_21150 ?auto_21161 ) ( CLEAR ?auto_21150 ) ( not ( = ?auto_21149 ?auto_21150 ) ) ( not ( = ?auto_21149 ?auto_21161 ) ) ( not ( = ?auto_21150 ?auto_21161 ) ) ( not ( = ?auto_21155 ?auto_21165 ) ) ( IS-CRATE ?auto_21149 ) ( not ( = ?auto_21172 ?auto_21156 ) ) ( HOIST-AT ?auto_21170 ?auto_21172 ) ( SURFACE-AT ?auto_21149 ?auto_21172 ) ( ON ?auto_21149 ?auto_21171 ) ( CLEAR ?auto_21149 ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( not ( = ?auto_21148 ?auto_21171 ) ) ( not ( = ?auto_21149 ?auto_21171 ) ) ( not ( = ?auto_21155 ?auto_21170 ) ) ( IS-CRATE ?auto_21148 ) ( AVAILABLE ?auto_21154 ) ( SURFACE-AT ?auto_21148 ?auto_21157 ) ( ON ?auto_21148 ?auto_21163 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21163 ) ) ( not ( = ?auto_21148 ?auto_21163 ) ) ( IS-CRATE ?auto_21147 ) ( not ( = ?auto_21166 ?auto_21156 ) ) ( HOIST-AT ?auto_21164 ?auto_21166 ) ( SURFACE-AT ?auto_21147 ?auto_21166 ) ( ON ?auto_21147 ?auto_21167 ) ( CLEAR ?auto_21147 ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21167 ) ) ( not ( = ?auto_21147 ?auto_21167 ) ) ( not ( = ?auto_21155 ?auto_21164 ) ) ( IS-CRATE ?auto_21146 ) ( not ( = ?auto_21183 ?auto_21156 ) ) ( HOIST-AT ?auto_21176 ?auto_21183 ) ( SURFACE-AT ?auto_21146 ?auto_21183 ) ( ON ?auto_21146 ?auto_21174 ) ( CLEAR ?auto_21146 ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21174 ) ) ( not ( = ?auto_21146 ?auto_21174 ) ) ( not ( = ?auto_21155 ?auto_21176 ) ) ( IS-CRATE ?auto_21145 ) ( not ( = ?auto_21158 ?auto_21156 ) ) ( HOIST-AT ?auto_21168 ?auto_21158 ) ( AVAILABLE ?auto_21168 ) ( SURFACE-AT ?auto_21145 ?auto_21158 ) ( ON ?auto_21145 ?auto_21177 ) ( CLEAR ?auto_21145 ) ( not ( = ?auto_21144 ?auto_21145 ) ) ( not ( = ?auto_21144 ?auto_21177 ) ) ( not ( = ?auto_21145 ?auto_21177 ) ) ( not ( = ?auto_21155 ?auto_21168 ) ) ( IS-CRATE ?auto_21144 ) ( AVAILABLE ?auto_21176 ) ( SURFACE-AT ?auto_21144 ?auto_21183 ) ( ON ?auto_21144 ?auto_21178 ) ( CLEAR ?auto_21144 ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21178 ) ) ( not ( = ?auto_21144 ?auto_21178 ) ) ( IS-CRATE ?auto_21143 ) ( SURFACE-AT ?auto_21143 ?auto_21166 ) ( ON ?auto_21143 ?auto_21175 ) ( CLEAR ?auto_21143 ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21142 ?auto_21175 ) ) ( not ( = ?auto_21143 ?auto_21175 ) ) ( IS-CRATE ?auto_21142 ) ( not ( = ?auto_21182 ?auto_21156 ) ) ( HOIST-AT ?auto_21180 ?auto_21182 ) ( AVAILABLE ?auto_21180 ) ( SURFACE-AT ?auto_21142 ?auto_21182 ) ( ON ?auto_21142 ?auto_21173 ) ( CLEAR ?auto_21142 ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21173 ) ) ( not ( = ?auto_21142 ?auto_21173 ) ) ( not ( = ?auto_21155 ?auto_21180 ) ) ( IS-CRATE ?auto_21141 ) ( AVAILABLE ?auto_21164 ) ( SURFACE-AT ?auto_21141 ?auto_21166 ) ( ON ?auto_21141 ?auto_21181 ) ( CLEAR ?auto_21141 ) ( not ( = ?auto_21140 ?auto_21141 ) ) ( not ( = ?auto_21140 ?auto_21181 ) ) ( not ( = ?auto_21141 ?auto_21181 ) ) ( IS-CRATE ?auto_21140 ) ( AVAILABLE ?auto_21170 ) ( SURFACE-AT ?auto_21140 ?auto_21172 ) ( ON ?auto_21140 ?auto_21169 ) ( CLEAR ?auto_21140 ) ( not ( = ?auto_21139 ?auto_21140 ) ) ( not ( = ?auto_21139 ?auto_21169 ) ) ( not ( = ?auto_21140 ?auto_21169 ) ) ( SURFACE-AT ?auto_21138 ?auto_21156 ) ( CLEAR ?auto_21138 ) ( IS-CRATE ?auto_21139 ) ( AVAILABLE ?auto_21155 ) ( not ( = ?auto_21162 ?auto_21156 ) ) ( HOIST-AT ?auto_21179 ?auto_21162 ) ( AVAILABLE ?auto_21179 ) ( SURFACE-AT ?auto_21139 ?auto_21162 ) ( ON ?auto_21139 ?auto_21159 ) ( CLEAR ?auto_21139 ) ( TRUCK-AT ?auto_21152 ?auto_21156 ) ( not ( = ?auto_21138 ?auto_21139 ) ) ( not ( = ?auto_21138 ?auto_21159 ) ) ( not ( = ?auto_21139 ?auto_21159 ) ) ( not ( = ?auto_21155 ?auto_21179 ) ) ( not ( = ?auto_21138 ?auto_21140 ) ) ( not ( = ?auto_21138 ?auto_21169 ) ) ( not ( = ?auto_21140 ?auto_21159 ) ) ( not ( = ?auto_21172 ?auto_21162 ) ) ( not ( = ?auto_21170 ?auto_21179 ) ) ( not ( = ?auto_21169 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21141 ) ) ( not ( = ?auto_21138 ?auto_21181 ) ) ( not ( = ?auto_21139 ?auto_21141 ) ) ( not ( = ?auto_21139 ?auto_21181 ) ) ( not ( = ?auto_21141 ?auto_21169 ) ) ( not ( = ?auto_21141 ?auto_21159 ) ) ( not ( = ?auto_21166 ?auto_21172 ) ) ( not ( = ?auto_21166 ?auto_21162 ) ) ( not ( = ?auto_21164 ?auto_21170 ) ) ( not ( = ?auto_21164 ?auto_21179 ) ) ( not ( = ?auto_21181 ?auto_21169 ) ) ( not ( = ?auto_21181 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21142 ) ) ( not ( = ?auto_21138 ?auto_21173 ) ) ( not ( = ?auto_21139 ?auto_21142 ) ) ( not ( = ?auto_21139 ?auto_21173 ) ) ( not ( = ?auto_21140 ?auto_21142 ) ) ( not ( = ?auto_21140 ?auto_21173 ) ) ( not ( = ?auto_21142 ?auto_21181 ) ) ( not ( = ?auto_21142 ?auto_21169 ) ) ( not ( = ?auto_21142 ?auto_21159 ) ) ( not ( = ?auto_21182 ?auto_21166 ) ) ( not ( = ?auto_21182 ?auto_21172 ) ) ( not ( = ?auto_21182 ?auto_21162 ) ) ( not ( = ?auto_21180 ?auto_21164 ) ) ( not ( = ?auto_21180 ?auto_21170 ) ) ( not ( = ?auto_21180 ?auto_21179 ) ) ( not ( = ?auto_21173 ?auto_21181 ) ) ( not ( = ?auto_21173 ?auto_21169 ) ) ( not ( = ?auto_21173 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21143 ) ) ( not ( = ?auto_21138 ?auto_21175 ) ) ( not ( = ?auto_21139 ?auto_21143 ) ) ( not ( = ?auto_21139 ?auto_21175 ) ) ( not ( = ?auto_21140 ?auto_21143 ) ) ( not ( = ?auto_21140 ?auto_21175 ) ) ( not ( = ?auto_21141 ?auto_21143 ) ) ( not ( = ?auto_21141 ?auto_21175 ) ) ( not ( = ?auto_21143 ?auto_21173 ) ) ( not ( = ?auto_21143 ?auto_21181 ) ) ( not ( = ?auto_21143 ?auto_21169 ) ) ( not ( = ?auto_21143 ?auto_21159 ) ) ( not ( = ?auto_21175 ?auto_21173 ) ) ( not ( = ?auto_21175 ?auto_21181 ) ) ( not ( = ?auto_21175 ?auto_21169 ) ) ( not ( = ?auto_21175 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21144 ) ) ( not ( = ?auto_21138 ?auto_21178 ) ) ( not ( = ?auto_21139 ?auto_21144 ) ) ( not ( = ?auto_21139 ?auto_21178 ) ) ( not ( = ?auto_21140 ?auto_21144 ) ) ( not ( = ?auto_21140 ?auto_21178 ) ) ( not ( = ?auto_21141 ?auto_21144 ) ) ( not ( = ?auto_21141 ?auto_21178 ) ) ( not ( = ?auto_21142 ?auto_21144 ) ) ( not ( = ?auto_21142 ?auto_21178 ) ) ( not ( = ?auto_21144 ?auto_21175 ) ) ( not ( = ?auto_21144 ?auto_21173 ) ) ( not ( = ?auto_21144 ?auto_21181 ) ) ( not ( = ?auto_21144 ?auto_21169 ) ) ( not ( = ?auto_21144 ?auto_21159 ) ) ( not ( = ?auto_21183 ?auto_21166 ) ) ( not ( = ?auto_21183 ?auto_21182 ) ) ( not ( = ?auto_21183 ?auto_21172 ) ) ( not ( = ?auto_21183 ?auto_21162 ) ) ( not ( = ?auto_21176 ?auto_21164 ) ) ( not ( = ?auto_21176 ?auto_21180 ) ) ( not ( = ?auto_21176 ?auto_21170 ) ) ( not ( = ?auto_21176 ?auto_21179 ) ) ( not ( = ?auto_21178 ?auto_21175 ) ) ( not ( = ?auto_21178 ?auto_21173 ) ) ( not ( = ?auto_21178 ?auto_21181 ) ) ( not ( = ?auto_21178 ?auto_21169 ) ) ( not ( = ?auto_21178 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21145 ) ) ( not ( = ?auto_21138 ?auto_21177 ) ) ( not ( = ?auto_21139 ?auto_21145 ) ) ( not ( = ?auto_21139 ?auto_21177 ) ) ( not ( = ?auto_21140 ?auto_21145 ) ) ( not ( = ?auto_21140 ?auto_21177 ) ) ( not ( = ?auto_21141 ?auto_21145 ) ) ( not ( = ?auto_21141 ?auto_21177 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21142 ?auto_21177 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21177 ) ) ( not ( = ?auto_21145 ?auto_21178 ) ) ( not ( = ?auto_21145 ?auto_21175 ) ) ( not ( = ?auto_21145 ?auto_21173 ) ) ( not ( = ?auto_21145 ?auto_21181 ) ) ( not ( = ?auto_21145 ?auto_21169 ) ) ( not ( = ?auto_21145 ?auto_21159 ) ) ( not ( = ?auto_21158 ?auto_21183 ) ) ( not ( = ?auto_21158 ?auto_21166 ) ) ( not ( = ?auto_21158 ?auto_21182 ) ) ( not ( = ?auto_21158 ?auto_21172 ) ) ( not ( = ?auto_21158 ?auto_21162 ) ) ( not ( = ?auto_21168 ?auto_21176 ) ) ( not ( = ?auto_21168 ?auto_21164 ) ) ( not ( = ?auto_21168 ?auto_21180 ) ) ( not ( = ?auto_21168 ?auto_21170 ) ) ( not ( = ?auto_21168 ?auto_21179 ) ) ( not ( = ?auto_21177 ?auto_21178 ) ) ( not ( = ?auto_21177 ?auto_21175 ) ) ( not ( = ?auto_21177 ?auto_21173 ) ) ( not ( = ?auto_21177 ?auto_21181 ) ) ( not ( = ?auto_21177 ?auto_21169 ) ) ( not ( = ?auto_21177 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21146 ) ) ( not ( = ?auto_21138 ?auto_21174 ) ) ( not ( = ?auto_21139 ?auto_21146 ) ) ( not ( = ?auto_21139 ?auto_21174 ) ) ( not ( = ?auto_21140 ?auto_21146 ) ) ( not ( = ?auto_21140 ?auto_21174 ) ) ( not ( = ?auto_21141 ?auto_21146 ) ) ( not ( = ?auto_21141 ?auto_21174 ) ) ( not ( = ?auto_21142 ?auto_21146 ) ) ( not ( = ?auto_21142 ?auto_21174 ) ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21174 ) ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( not ( = ?auto_21144 ?auto_21174 ) ) ( not ( = ?auto_21146 ?auto_21177 ) ) ( not ( = ?auto_21146 ?auto_21178 ) ) ( not ( = ?auto_21146 ?auto_21175 ) ) ( not ( = ?auto_21146 ?auto_21173 ) ) ( not ( = ?auto_21146 ?auto_21181 ) ) ( not ( = ?auto_21146 ?auto_21169 ) ) ( not ( = ?auto_21146 ?auto_21159 ) ) ( not ( = ?auto_21174 ?auto_21177 ) ) ( not ( = ?auto_21174 ?auto_21178 ) ) ( not ( = ?auto_21174 ?auto_21175 ) ) ( not ( = ?auto_21174 ?auto_21173 ) ) ( not ( = ?auto_21174 ?auto_21181 ) ) ( not ( = ?auto_21174 ?auto_21169 ) ) ( not ( = ?auto_21174 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21147 ) ) ( not ( = ?auto_21138 ?auto_21167 ) ) ( not ( = ?auto_21139 ?auto_21147 ) ) ( not ( = ?auto_21139 ?auto_21167 ) ) ( not ( = ?auto_21140 ?auto_21147 ) ) ( not ( = ?auto_21140 ?auto_21167 ) ) ( not ( = ?auto_21141 ?auto_21147 ) ) ( not ( = ?auto_21141 ?auto_21167 ) ) ( not ( = ?auto_21142 ?auto_21147 ) ) ( not ( = ?auto_21142 ?auto_21167 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21167 ) ) ( not ( = ?auto_21144 ?auto_21147 ) ) ( not ( = ?auto_21144 ?auto_21167 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21167 ) ) ( not ( = ?auto_21147 ?auto_21174 ) ) ( not ( = ?auto_21147 ?auto_21177 ) ) ( not ( = ?auto_21147 ?auto_21178 ) ) ( not ( = ?auto_21147 ?auto_21175 ) ) ( not ( = ?auto_21147 ?auto_21173 ) ) ( not ( = ?auto_21147 ?auto_21181 ) ) ( not ( = ?auto_21147 ?auto_21169 ) ) ( not ( = ?auto_21147 ?auto_21159 ) ) ( not ( = ?auto_21167 ?auto_21174 ) ) ( not ( = ?auto_21167 ?auto_21177 ) ) ( not ( = ?auto_21167 ?auto_21178 ) ) ( not ( = ?auto_21167 ?auto_21175 ) ) ( not ( = ?auto_21167 ?auto_21173 ) ) ( not ( = ?auto_21167 ?auto_21181 ) ) ( not ( = ?auto_21167 ?auto_21169 ) ) ( not ( = ?auto_21167 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21148 ) ) ( not ( = ?auto_21138 ?auto_21163 ) ) ( not ( = ?auto_21139 ?auto_21148 ) ) ( not ( = ?auto_21139 ?auto_21163 ) ) ( not ( = ?auto_21140 ?auto_21148 ) ) ( not ( = ?auto_21140 ?auto_21163 ) ) ( not ( = ?auto_21141 ?auto_21148 ) ) ( not ( = ?auto_21141 ?auto_21163 ) ) ( not ( = ?auto_21142 ?auto_21148 ) ) ( not ( = ?auto_21142 ?auto_21163 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21163 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21144 ?auto_21163 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21145 ?auto_21163 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21163 ) ) ( not ( = ?auto_21148 ?auto_21167 ) ) ( not ( = ?auto_21148 ?auto_21174 ) ) ( not ( = ?auto_21148 ?auto_21177 ) ) ( not ( = ?auto_21148 ?auto_21178 ) ) ( not ( = ?auto_21148 ?auto_21175 ) ) ( not ( = ?auto_21148 ?auto_21173 ) ) ( not ( = ?auto_21148 ?auto_21181 ) ) ( not ( = ?auto_21148 ?auto_21169 ) ) ( not ( = ?auto_21148 ?auto_21159 ) ) ( not ( = ?auto_21157 ?auto_21166 ) ) ( not ( = ?auto_21157 ?auto_21183 ) ) ( not ( = ?auto_21157 ?auto_21158 ) ) ( not ( = ?auto_21157 ?auto_21182 ) ) ( not ( = ?auto_21157 ?auto_21172 ) ) ( not ( = ?auto_21157 ?auto_21162 ) ) ( not ( = ?auto_21154 ?auto_21164 ) ) ( not ( = ?auto_21154 ?auto_21176 ) ) ( not ( = ?auto_21154 ?auto_21168 ) ) ( not ( = ?auto_21154 ?auto_21180 ) ) ( not ( = ?auto_21154 ?auto_21170 ) ) ( not ( = ?auto_21154 ?auto_21179 ) ) ( not ( = ?auto_21163 ?auto_21167 ) ) ( not ( = ?auto_21163 ?auto_21174 ) ) ( not ( = ?auto_21163 ?auto_21177 ) ) ( not ( = ?auto_21163 ?auto_21178 ) ) ( not ( = ?auto_21163 ?auto_21175 ) ) ( not ( = ?auto_21163 ?auto_21173 ) ) ( not ( = ?auto_21163 ?auto_21181 ) ) ( not ( = ?auto_21163 ?auto_21169 ) ) ( not ( = ?auto_21163 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21149 ) ) ( not ( = ?auto_21138 ?auto_21171 ) ) ( not ( = ?auto_21139 ?auto_21149 ) ) ( not ( = ?auto_21139 ?auto_21171 ) ) ( not ( = ?auto_21140 ?auto_21149 ) ) ( not ( = ?auto_21140 ?auto_21171 ) ) ( not ( = ?auto_21141 ?auto_21149 ) ) ( not ( = ?auto_21141 ?auto_21171 ) ) ( not ( = ?auto_21142 ?auto_21149 ) ) ( not ( = ?auto_21142 ?auto_21171 ) ) ( not ( = ?auto_21143 ?auto_21149 ) ) ( not ( = ?auto_21143 ?auto_21171 ) ) ( not ( = ?auto_21144 ?auto_21149 ) ) ( not ( = ?auto_21144 ?auto_21171 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21171 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21171 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21171 ) ) ( not ( = ?auto_21149 ?auto_21163 ) ) ( not ( = ?auto_21149 ?auto_21167 ) ) ( not ( = ?auto_21149 ?auto_21174 ) ) ( not ( = ?auto_21149 ?auto_21177 ) ) ( not ( = ?auto_21149 ?auto_21178 ) ) ( not ( = ?auto_21149 ?auto_21175 ) ) ( not ( = ?auto_21149 ?auto_21173 ) ) ( not ( = ?auto_21149 ?auto_21181 ) ) ( not ( = ?auto_21149 ?auto_21169 ) ) ( not ( = ?auto_21149 ?auto_21159 ) ) ( not ( = ?auto_21171 ?auto_21163 ) ) ( not ( = ?auto_21171 ?auto_21167 ) ) ( not ( = ?auto_21171 ?auto_21174 ) ) ( not ( = ?auto_21171 ?auto_21177 ) ) ( not ( = ?auto_21171 ?auto_21178 ) ) ( not ( = ?auto_21171 ?auto_21175 ) ) ( not ( = ?auto_21171 ?auto_21173 ) ) ( not ( = ?auto_21171 ?auto_21181 ) ) ( not ( = ?auto_21171 ?auto_21169 ) ) ( not ( = ?auto_21171 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21150 ) ) ( not ( = ?auto_21138 ?auto_21161 ) ) ( not ( = ?auto_21139 ?auto_21150 ) ) ( not ( = ?auto_21139 ?auto_21161 ) ) ( not ( = ?auto_21140 ?auto_21150 ) ) ( not ( = ?auto_21140 ?auto_21161 ) ) ( not ( = ?auto_21141 ?auto_21150 ) ) ( not ( = ?auto_21141 ?auto_21161 ) ) ( not ( = ?auto_21142 ?auto_21150 ) ) ( not ( = ?auto_21142 ?auto_21161 ) ) ( not ( = ?auto_21143 ?auto_21150 ) ) ( not ( = ?auto_21143 ?auto_21161 ) ) ( not ( = ?auto_21144 ?auto_21150 ) ) ( not ( = ?auto_21144 ?auto_21161 ) ) ( not ( = ?auto_21145 ?auto_21150 ) ) ( not ( = ?auto_21145 ?auto_21161 ) ) ( not ( = ?auto_21146 ?auto_21150 ) ) ( not ( = ?auto_21146 ?auto_21161 ) ) ( not ( = ?auto_21147 ?auto_21150 ) ) ( not ( = ?auto_21147 ?auto_21161 ) ) ( not ( = ?auto_21148 ?auto_21150 ) ) ( not ( = ?auto_21148 ?auto_21161 ) ) ( not ( = ?auto_21150 ?auto_21171 ) ) ( not ( = ?auto_21150 ?auto_21163 ) ) ( not ( = ?auto_21150 ?auto_21167 ) ) ( not ( = ?auto_21150 ?auto_21174 ) ) ( not ( = ?auto_21150 ?auto_21177 ) ) ( not ( = ?auto_21150 ?auto_21178 ) ) ( not ( = ?auto_21150 ?auto_21175 ) ) ( not ( = ?auto_21150 ?auto_21173 ) ) ( not ( = ?auto_21150 ?auto_21181 ) ) ( not ( = ?auto_21150 ?auto_21169 ) ) ( not ( = ?auto_21150 ?auto_21159 ) ) ( not ( = ?auto_21160 ?auto_21172 ) ) ( not ( = ?auto_21160 ?auto_21157 ) ) ( not ( = ?auto_21160 ?auto_21166 ) ) ( not ( = ?auto_21160 ?auto_21183 ) ) ( not ( = ?auto_21160 ?auto_21158 ) ) ( not ( = ?auto_21160 ?auto_21182 ) ) ( not ( = ?auto_21160 ?auto_21162 ) ) ( not ( = ?auto_21165 ?auto_21170 ) ) ( not ( = ?auto_21165 ?auto_21154 ) ) ( not ( = ?auto_21165 ?auto_21164 ) ) ( not ( = ?auto_21165 ?auto_21176 ) ) ( not ( = ?auto_21165 ?auto_21168 ) ) ( not ( = ?auto_21165 ?auto_21180 ) ) ( not ( = ?auto_21165 ?auto_21179 ) ) ( not ( = ?auto_21161 ?auto_21171 ) ) ( not ( = ?auto_21161 ?auto_21163 ) ) ( not ( = ?auto_21161 ?auto_21167 ) ) ( not ( = ?auto_21161 ?auto_21174 ) ) ( not ( = ?auto_21161 ?auto_21177 ) ) ( not ( = ?auto_21161 ?auto_21178 ) ) ( not ( = ?auto_21161 ?auto_21175 ) ) ( not ( = ?auto_21161 ?auto_21173 ) ) ( not ( = ?auto_21161 ?auto_21181 ) ) ( not ( = ?auto_21161 ?auto_21169 ) ) ( not ( = ?auto_21161 ?auto_21159 ) ) ( not ( = ?auto_21138 ?auto_21151 ) ) ( not ( = ?auto_21138 ?auto_21153 ) ) ( not ( = ?auto_21139 ?auto_21151 ) ) ( not ( = ?auto_21139 ?auto_21153 ) ) ( not ( = ?auto_21140 ?auto_21151 ) ) ( not ( = ?auto_21140 ?auto_21153 ) ) ( not ( = ?auto_21141 ?auto_21151 ) ) ( not ( = ?auto_21141 ?auto_21153 ) ) ( not ( = ?auto_21142 ?auto_21151 ) ) ( not ( = ?auto_21142 ?auto_21153 ) ) ( not ( = ?auto_21143 ?auto_21151 ) ) ( not ( = ?auto_21143 ?auto_21153 ) ) ( not ( = ?auto_21144 ?auto_21151 ) ) ( not ( = ?auto_21144 ?auto_21153 ) ) ( not ( = ?auto_21145 ?auto_21151 ) ) ( not ( = ?auto_21145 ?auto_21153 ) ) ( not ( = ?auto_21146 ?auto_21151 ) ) ( not ( = ?auto_21146 ?auto_21153 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21153 ) ) ( not ( = ?auto_21148 ?auto_21151 ) ) ( not ( = ?auto_21148 ?auto_21153 ) ) ( not ( = ?auto_21149 ?auto_21151 ) ) ( not ( = ?auto_21149 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21161 ) ) ( not ( = ?auto_21151 ?auto_21171 ) ) ( not ( = ?auto_21151 ?auto_21163 ) ) ( not ( = ?auto_21151 ?auto_21167 ) ) ( not ( = ?auto_21151 ?auto_21174 ) ) ( not ( = ?auto_21151 ?auto_21177 ) ) ( not ( = ?auto_21151 ?auto_21178 ) ) ( not ( = ?auto_21151 ?auto_21175 ) ) ( not ( = ?auto_21151 ?auto_21173 ) ) ( not ( = ?auto_21151 ?auto_21181 ) ) ( not ( = ?auto_21151 ?auto_21169 ) ) ( not ( = ?auto_21151 ?auto_21159 ) ) ( not ( = ?auto_21153 ?auto_21161 ) ) ( not ( = ?auto_21153 ?auto_21171 ) ) ( not ( = ?auto_21153 ?auto_21163 ) ) ( not ( = ?auto_21153 ?auto_21167 ) ) ( not ( = ?auto_21153 ?auto_21174 ) ) ( not ( = ?auto_21153 ?auto_21177 ) ) ( not ( = ?auto_21153 ?auto_21178 ) ) ( not ( = ?auto_21153 ?auto_21175 ) ) ( not ( = ?auto_21153 ?auto_21173 ) ) ( not ( = ?auto_21153 ?auto_21181 ) ) ( not ( = ?auto_21153 ?auto_21169 ) ) ( not ( = ?auto_21153 ?auto_21159 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ?auto_21150 )
      ( MAKE-1CRATE ?auto_21150 ?auto_21151 )
      ( MAKE-13CRATE-VERIFY ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ?auto_21150 ?auto_21151 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_21209 - SURFACE
      ?auto_21210 - SURFACE
      ?auto_21211 - SURFACE
      ?auto_21212 - SURFACE
      ?auto_21213 - SURFACE
      ?auto_21214 - SURFACE
      ?auto_21215 - SURFACE
      ?auto_21216 - SURFACE
      ?auto_21217 - SURFACE
      ?auto_21218 - SURFACE
      ?auto_21219 - SURFACE
      ?auto_21220 - SURFACE
      ?auto_21221 - SURFACE
      ?auto_21222 - SURFACE
      ?auto_21223 - SURFACE
    )
    :vars
    (
      ?auto_21228 - HOIST
      ?auto_21224 - PLACE
      ?auto_21225 - PLACE
      ?auto_21227 - HOIST
      ?auto_21229 - SURFACE
      ?auto_21246 - PLACE
      ?auto_21256 - HOIST
      ?auto_21234 - SURFACE
      ?auto_21241 - SURFACE
      ?auto_21248 - PLACE
      ?auto_21251 - HOIST
      ?auto_21247 - SURFACE
      ?auto_21253 - SURFACE
      ?auto_21238 - PLACE
      ?auto_21230 - HOIST
      ?auto_21250 - SURFACE
      ?auto_21255 - PLACE
      ?auto_21239 - HOIST
      ?auto_21232 - SURFACE
      ?auto_21236 - PLACE
      ?auto_21252 - HOIST
      ?auto_21245 - SURFACE
      ?auto_21235 - SURFACE
      ?auto_21244 - SURFACE
      ?auto_21237 - PLACE
      ?auto_21243 - HOIST
      ?auto_21233 - SURFACE
      ?auto_21249 - SURFACE
      ?auto_21254 - SURFACE
      ?auto_21242 - PLACE
      ?auto_21231 - HOIST
      ?auto_21240 - SURFACE
      ?auto_21226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21228 ?auto_21224 ) ( IS-CRATE ?auto_21223 ) ( not ( = ?auto_21225 ?auto_21224 ) ) ( HOIST-AT ?auto_21227 ?auto_21225 ) ( SURFACE-AT ?auto_21223 ?auto_21225 ) ( ON ?auto_21223 ?auto_21229 ) ( CLEAR ?auto_21223 ) ( not ( = ?auto_21222 ?auto_21223 ) ) ( not ( = ?auto_21222 ?auto_21229 ) ) ( not ( = ?auto_21223 ?auto_21229 ) ) ( not ( = ?auto_21228 ?auto_21227 ) ) ( IS-CRATE ?auto_21222 ) ( not ( = ?auto_21246 ?auto_21224 ) ) ( HOIST-AT ?auto_21256 ?auto_21246 ) ( SURFACE-AT ?auto_21222 ?auto_21246 ) ( ON ?auto_21222 ?auto_21234 ) ( CLEAR ?auto_21222 ) ( not ( = ?auto_21221 ?auto_21222 ) ) ( not ( = ?auto_21221 ?auto_21234 ) ) ( not ( = ?auto_21222 ?auto_21234 ) ) ( not ( = ?auto_21228 ?auto_21256 ) ) ( IS-CRATE ?auto_21221 ) ( AVAILABLE ?auto_21227 ) ( SURFACE-AT ?auto_21221 ?auto_21225 ) ( ON ?auto_21221 ?auto_21241 ) ( CLEAR ?auto_21221 ) ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21220 ?auto_21241 ) ) ( not ( = ?auto_21221 ?auto_21241 ) ) ( IS-CRATE ?auto_21220 ) ( not ( = ?auto_21248 ?auto_21224 ) ) ( HOIST-AT ?auto_21251 ?auto_21248 ) ( SURFACE-AT ?auto_21220 ?auto_21248 ) ( ON ?auto_21220 ?auto_21247 ) ( CLEAR ?auto_21220 ) ( not ( = ?auto_21219 ?auto_21220 ) ) ( not ( = ?auto_21219 ?auto_21247 ) ) ( not ( = ?auto_21220 ?auto_21247 ) ) ( not ( = ?auto_21228 ?auto_21251 ) ) ( IS-CRATE ?auto_21219 ) ( AVAILABLE ?auto_21256 ) ( SURFACE-AT ?auto_21219 ?auto_21246 ) ( ON ?auto_21219 ?auto_21253 ) ( CLEAR ?auto_21219 ) ( not ( = ?auto_21218 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21253 ) ) ( not ( = ?auto_21219 ?auto_21253 ) ) ( IS-CRATE ?auto_21218 ) ( not ( = ?auto_21238 ?auto_21224 ) ) ( HOIST-AT ?auto_21230 ?auto_21238 ) ( SURFACE-AT ?auto_21218 ?auto_21238 ) ( ON ?auto_21218 ?auto_21250 ) ( CLEAR ?auto_21218 ) ( not ( = ?auto_21217 ?auto_21218 ) ) ( not ( = ?auto_21217 ?auto_21250 ) ) ( not ( = ?auto_21218 ?auto_21250 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( IS-CRATE ?auto_21217 ) ( not ( = ?auto_21255 ?auto_21224 ) ) ( HOIST-AT ?auto_21239 ?auto_21255 ) ( SURFACE-AT ?auto_21217 ?auto_21255 ) ( ON ?auto_21217 ?auto_21232 ) ( CLEAR ?auto_21217 ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21232 ) ) ( not ( = ?auto_21217 ?auto_21232 ) ) ( not ( = ?auto_21228 ?auto_21239 ) ) ( IS-CRATE ?auto_21216 ) ( not ( = ?auto_21236 ?auto_21224 ) ) ( HOIST-AT ?auto_21252 ?auto_21236 ) ( AVAILABLE ?auto_21252 ) ( SURFACE-AT ?auto_21216 ?auto_21236 ) ( ON ?auto_21216 ?auto_21245 ) ( CLEAR ?auto_21216 ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21245 ) ) ( not ( = ?auto_21216 ?auto_21245 ) ) ( not ( = ?auto_21228 ?auto_21252 ) ) ( IS-CRATE ?auto_21215 ) ( AVAILABLE ?auto_21239 ) ( SURFACE-AT ?auto_21215 ?auto_21255 ) ( ON ?auto_21215 ?auto_21235 ) ( CLEAR ?auto_21215 ) ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21214 ?auto_21235 ) ) ( not ( = ?auto_21215 ?auto_21235 ) ) ( IS-CRATE ?auto_21214 ) ( SURFACE-AT ?auto_21214 ?auto_21238 ) ( ON ?auto_21214 ?auto_21244 ) ( CLEAR ?auto_21214 ) ( not ( = ?auto_21213 ?auto_21214 ) ) ( not ( = ?auto_21213 ?auto_21244 ) ) ( not ( = ?auto_21214 ?auto_21244 ) ) ( IS-CRATE ?auto_21213 ) ( not ( = ?auto_21237 ?auto_21224 ) ) ( HOIST-AT ?auto_21243 ?auto_21237 ) ( AVAILABLE ?auto_21243 ) ( SURFACE-AT ?auto_21213 ?auto_21237 ) ( ON ?auto_21213 ?auto_21233 ) ( CLEAR ?auto_21213 ) ( not ( = ?auto_21212 ?auto_21213 ) ) ( not ( = ?auto_21212 ?auto_21233 ) ) ( not ( = ?auto_21213 ?auto_21233 ) ) ( not ( = ?auto_21228 ?auto_21243 ) ) ( IS-CRATE ?auto_21212 ) ( AVAILABLE ?auto_21230 ) ( SURFACE-AT ?auto_21212 ?auto_21238 ) ( ON ?auto_21212 ?auto_21249 ) ( CLEAR ?auto_21212 ) ( not ( = ?auto_21211 ?auto_21212 ) ) ( not ( = ?auto_21211 ?auto_21249 ) ) ( not ( = ?auto_21212 ?auto_21249 ) ) ( IS-CRATE ?auto_21211 ) ( AVAILABLE ?auto_21251 ) ( SURFACE-AT ?auto_21211 ?auto_21248 ) ( ON ?auto_21211 ?auto_21254 ) ( CLEAR ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21210 ?auto_21254 ) ) ( not ( = ?auto_21211 ?auto_21254 ) ) ( SURFACE-AT ?auto_21209 ?auto_21224 ) ( CLEAR ?auto_21209 ) ( IS-CRATE ?auto_21210 ) ( AVAILABLE ?auto_21228 ) ( not ( = ?auto_21242 ?auto_21224 ) ) ( HOIST-AT ?auto_21231 ?auto_21242 ) ( AVAILABLE ?auto_21231 ) ( SURFACE-AT ?auto_21210 ?auto_21242 ) ( ON ?auto_21210 ?auto_21240 ) ( CLEAR ?auto_21210 ) ( TRUCK-AT ?auto_21226 ?auto_21224 ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21240 ) ) ( not ( = ?auto_21210 ?auto_21240 ) ) ( not ( = ?auto_21228 ?auto_21231 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21254 ) ) ( not ( = ?auto_21211 ?auto_21240 ) ) ( not ( = ?auto_21248 ?auto_21242 ) ) ( not ( = ?auto_21251 ?auto_21231 ) ) ( not ( = ?auto_21254 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21212 ) ) ( not ( = ?auto_21209 ?auto_21249 ) ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21210 ?auto_21249 ) ) ( not ( = ?auto_21212 ?auto_21254 ) ) ( not ( = ?auto_21212 ?auto_21240 ) ) ( not ( = ?auto_21238 ?auto_21248 ) ) ( not ( = ?auto_21238 ?auto_21242 ) ) ( not ( = ?auto_21230 ?auto_21251 ) ) ( not ( = ?auto_21230 ?auto_21231 ) ) ( not ( = ?auto_21249 ?auto_21254 ) ) ( not ( = ?auto_21249 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21213 ) ) ( not ( = ?auto_21209 ?auto_21233 ) ) ( not ( = ?auto_21210 ?auto_21213 ) ) ( not ( = ?auto_21210 ?auto_21233 ) ) ( not ( = ?auto_21211 ?auto_21213 ) ) ( not ( = ?auto_21211 ?auto_21233 ) ) ( not ( = ?auto_21213 ?auto_21249 ) ) ( not ( = ?auto_21213 ?auto_21254 ) ) ( not ( = ?auto_21213 ?auto_21240 ) ) ( not ( = ?auto_21237 ?auto_21238 ) ) ( not ( = ?auto_21237 ?auto_21248 ) ) ( not ( = ?auto_21237 ?auto_21242 ) ) ( not ( = ?auto_21243 ?auto_21230 ) ) ( not ( = ?auto_21243 ?auto_21251 ) ) ( not ( = ?auto_21243 ?auto_21231 ) ) ( not ( = ?auto_21233 ?auto_21249 ) ) ( not ( = ?auto_21233 ?auto_21254 ) ) ( not ( = ?auto_21233 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21214 ) ) ( not ( = ?auto_21209 ?auto_21244 ) ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( not ( = ?auto_21210 ?auto_21244 ) ) ( not ( = ?auto_21211 ?auto_21214 ) ) ( not ( = ?auto_21211 ?auto_21244 ) ) ( not ( = ?auto_21212 ?auto_21214 ) ) ( not ( = ?auto_21212 ?auto_21244 ) ) ( not ( = ?auto_21214 ?auto_21233 ) ) ( not ( = ?auto_21214 ?auto_21249 ) ) ( not ( = ?auto_21214 ?auto_21254 ) ) ( not ( = ?auto_21214 ?auto_21240 ) ) ( not ( = ?auto_21244 ?auto_21233 ) ) ( not ( = ?auto_21244 ?auto_21249 ) ) ( not ( = ?auto_21244 ?auto_21254 ) ) ( not ( = ?auto_21244 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21215 ) ) ( not ( = ?auto_21209 ?auto_21235 ) ) ( not ( = ?auto_21210 ?auto_21215 ) ) ( not ( = ?auto_21210 ?auto_21235 ) ) ( not ( = ?auto_21211 ?auto_21215 ) ) ( not ( = ?auto_21211 ?auto_21235 ) ) ( not ( = ?auto_21212 ?auto_21215 ) ) ( not ( = ?auto_21212 ?auto_21235 ) ) ( not ( = ?auto_21213 ?auto_21215 ) ) ( not ( = ?auto_21213 ?auto_21235 ) ) ( not ( = ?auto_21215 ?auto_21244 ) ) ( not ( = ?auto_21215 ?auto_21233 ) ) ( not ( = ?auto_21215 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21254 ) ) ( not ( = ?auto_21215 ?auto_21240 ) ) ( not ( = ?auto_21255 ?auto_21238 ) ) ( not ( = ?auto_21255 ?auto_21237 ) ) ( not ( = ?auto_21255 ?auto_21248 ) ) ( not ( = ?auto_21255 ?auto_21242 ) ) ( not ( = ?auto_21239 ?auto_21230 ) ) ( not ( = ?auto_21239 ?auto_21243 ) ) ( not ( = ?auto_21239 ?auto_21251 ) ) ( not ( = ?auto_21239 ?auto_21231 ) ) ( not ( = ?auto_21235 ?auto_21244 ) ) ( not ( = ?auto_21235 ?auto_21233 ) ) ( not ( = ?auto_21235 ?auto_21249 ) ) ( not ( = ?auto_21235 ?auto_21254 ) ) ( not ( = ?auto_21235 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21216 ) ) ( not ( = ?auto_21209 ?auto_21245 ) ) ( not ( = ?auto_21210 ?auto_21216 ) ) ( not ( = ?auto_21210 ?auto_21245 ) ) ( not ( = ?auto_21211 ?auto_21216 ) ) ( not ( = ?auto_21211 ?auto_21245 ) ) ( not ( = ?auto_21212 ?auto_21216 ) ) ( not ( = ?auto_21212 ?auto_21245 ) ) ( not ( = ?auto_21213 ?auto_21216 ) ) ( not ( = ?auto_21213 ?auto_21245 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21245 ) ) ( not ( = ?auto_21216 ?auto_21235 ) ) ( not ( = ?auto_21216 ?auto_21244 ) ) ( not ( = ?auto_21216 ?auto_21233 ) ) ( not ( = ?auto_21216 ?auto_21249 ) ) ( not ( = ?auto_21216 ?auto_21254 ) ) ( not ( = ?auto_21216 ?auto_21240 ) ) ( not ( = ?auto_21236 ?auto_21255 ) ) ( not ( = ?auto_21236 ?auto_21238 ) ) ( not ( = ?auto_21236 ?auto_21237 ) ) ( not ( = ?auto_21236 ?auto_21248 ) ) ( not ( = ?auto_21236 ?auto_21242 ) ) ( not ( = ?auto_21252 ?auto_21239 ) ) ( not ( = ?auto_21252 ?auto_21230 ) ) ( not ( = ?auto_21252 ?auto_21243 ) ) ( not ( = ?auto_21252 ?auto_21251 ) ) ( not ( = ?auto_21252 ?auto_21231 ) ) ( not ( = ?auto_21245 ?auto_21235 ) ) ( not ( = ?auto_21245 ?auto_21244 ) ) ( not ( = ?auto_21245 ?auto_21233 ) ) ( not ( = ?auto_21245 ?auto_21249 ) ) ( not ( = ?auto_21245 ?auto_21254 ) ) ( not ( = ?auto_21245 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21217 ) ) ( not ( = ?auto_21209 ?auto_21232 ) ) ( not ( = ?auto_21210 ?auto_21217 ) ) ( not ( = ?auto_21210 ?auto_21232 ) ) ( not ( = ?auto_21211 ?auto_21217 ) ) ( not ( = ?auto_21211 ?auto_21232 ) ) ( not ( = ?auto_21212 ?auto_21217 ) ) ( not ( = ?auto_21212 ?auto_21232 ) ) ( not ( = ?auto_21213 ?auto_21217 ) ) ( not ( = ?auto_21213 ?auto_21232 ) ) ( not ( = ?auto_21214 ?auto_21217 ) ) ( not ( = ?auto_21214 ?auto_21232 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21232 ) ) ( not ( = ?auto_21217 ?auto_21245 ) ) ( not ( = ?auto_21217 ?auto_21235 ) ) ( not ( = ?auto_21217 ?auto_21244 ) ) ( not ( = ?auto_21217 ?auto_21233 ) ) ( not ( = ?auto_21217 ?auto_21249 ) ) ( not ( = ?auto_21217 ?auto_21254 ) ) ( not ( = ?auto_21217 ?auto_21240 ) ) ( not ( = ?auto_21232 ?auto_21245 ) ) ( not ( = ?auto_21232 ?auto_21235 ) ) ( not ( = ?auto_21232 ?auto_21244 ) ) ( not ( = ?auto_21232 ?auto_21233 ) ) ( not ( = ?auto_21232 ?auto_21249 ) ) ( not ( = ?auto_21232 ?auto_21254 ) ) ( not ( = ?auto_21232 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21218 ) ) ( not ( = ?auto_21209 ?auto_21250 ) ) ( not ( = ?auto_21210 ?auto_21218 ) ) ( not ( = ?auto_21210 ?auto_21250 ) ) ( not ( = ?auto_21211 ?auto_21218 ) ) ( not ( = ?auto_21211 ?auto_21250 ) ) ( not ( = ?auto_21212 ?auto_21218 ) ) ( not ( = ?auto_21212 ?auto_21250 ) ) ( not ( = ?auto_21213 ?auto_21218 ) ) ( not ( = ?auto_21213 ?auto_21250 ) ) ( not ( = ?auto_21214 ?auto_21218 ) ) ( not ( = ?auto_21214 ?auto_21250 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21250 ) ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21216 ?auto_21250 ) ) ( not ( = ?auto_21218 ?auto_21232 ) ) ( not ( = ?auto_21218 ?auto_21245 ) ) ( not ( = ?auto_21218 ?auto_21235 ) ) ( not ( = ?auto_21218 ?auto_21244 ) ) ( not ( = ?auto_21218 ?auto_21233 ) ) ( not ( = ?auto_21218 ?auto_21249 ) ) ( not ( = ?auto_21218 ?auto_21254 ) ) ( not ( = ?auto_21218 ?auto_21240 ) ) ( not ( = ?auto_21250 ?auto_21232 ) ) ( not ( = ?auto_21250 ?auto_21245 ) ) ( not ( = ?auto_21250 ?auto_21235 ) ) ( not ( = ?auto_21250 ?auto_21244 ) ) ( not ( = ?auto_21250 ?auto_21233 ) ) ( not ( = ?auto_21250 ?auto_21249 ) ) ( not ( = ?auto_21250 ?auto_21254 ) ) ( not ( = ?auto_21250 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21219 ) ) ( not ( = ?auto_21209 ?auto_21253 ) ) ( not ( = ?auto_21210 ?auto_21219 ) ) ( not ( = ?auto_21210 ?auto_21253 ) ) ( not ( = ?auto_21211 ?auto_21219 ) ) ( not ( = ?auto_21211 ?auto_21253 ) ) ( not ( = ?auto_21212 ?auto_21219 ) ) ( not ( = ?auto_21212 ?auto_21253 ) ) ( not ( = ?auto_21213 ?auto_21219 ) ) ( not ( = ?auto_21213 ?auto_21253 ) ) ( not ( = ?auto_21214 ?auto_21219 ) ) ( not ( = ?auto_21214 ?auto_21253 ) ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21215 ?auto_21253 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21253 ) ) ( not ( = ?auto_21217 ?auto_21219 ) ) ( not ( = ?auto_21217 ?auto_21253 ) ) ( not ( = ?auto_21219 ?auto_21250 ) ) ( not ( = ?auto_21219 ?auto_21232 ) ) ( not ( = ?auto_21219 ?auto_21245 ) ) ( not ( = ?auto_21219 ?auto_21235 ) ) ( not ( = ?auto_21219 ?auto_21244 ) ) ( not ( = ?auto_21219 ?auto_21233 ) ) ( not ( = ?auto_21219 ?auto_21249 ) ) ( not ( = ?auto_21219 ?auto_21254 ) ) ( not ( = ?auto_21219 ?auto_21240 ) ) ( not ( = ?auto_21246 ?auto_21238 ) ) ( not ( = ?auto_21246 ?auto_21255 ) ) ( not ( = ?auto_21246 ?auto_21236 ) ) ( not ( = ?auto_21246 ?auto_21237 ) ) ( not ( = ?auto_21246 ?auto_21248 ) ) ( not ( = ?auto_21246 ?auto_21242 ) ) ( not ( = ?auto_21256 ?auto_21230 ) ) ( not ( = ?auto_21256 ?auto_21239 ) ) ( not ( = ?auto_21256 ?auto_21252 ) ) ( not ( = ?auto_21256 ?auto_21243 ) ) ( not ( = ?auto_21256 ?auto_21251 ) ) ( not ( = ?auto_21256 ?auto_21231 ) ) ( not ( = ?auto_21253 ?auto_21250 ) ) ( not ( = ?auto_21253 ?auto_21232 ) ) ( not ( = ?auto_21253 ?auto_21245 ) ) ( not ( = ?auto_21253 ?auto_21235 ) ) ( not ( = ?auto_21253 ?auto_21244 ) ) ( not ( = ?auto_21253 ?auto_21233 ) ) ( not ( = ?auto_21253 ?auto_21249 ) ) ( not ( = ?auto_21253 ?auto_21254 ) ) ( not ( = ?auto_21253 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21220 ) ) ( not ( = ?auto_21209 ?auto_21247 ) ) ( not ( = ?auto_21210 ?auto_21220 ) ) ( not ( = ?auto_21210 ?auto_21247 ) ) ( not ( = ?auto_21211 ?auto_21220 ) ) ( not ( = ?auto_21211 ?auto_21247 ) ) ( not ( = ?auto_21212 ?auto_21220 ) ) ( not ( = ?auto_21212 ?auto_21247 ) ) ( not ( = ?auto_21213 ?auto_21220 ) ) ( not ( = ?auto_21213 ?auto_21247 ) ) ( not ( = ?auto_21214 ?auto_21220 ) ) ( not ( = ?auto_21214 ?auto_21247 ) ) ( not ( = ?auto_21215 ?auto_21220 ) ) ( not ( = ?auto_21215 ?auto_21247 ) ) ( not ( = ?auto_21216 ?auto_21220 ) ) ( not ( = ?auto_21216 ?auto_21247 ) ) ( not ( = ?auto_21217 ?auto_21220 ) ) ( not ( = ?auto_21217 ?auto_21247 ) ) ( not ( = ?auto_21218 ?auto_21220 ) ) ( not ( = ?auto_21218 ?auto_21247 ) ) ( not ( = ?auto_21220 ?auto_21253 ) ) ( not ( = ?auto_21220 ?auto_21250 ) ) ( not ( = ?auto_21220 ?auto_21232 ) ) ( not ( = ?auto_21220 ?auto_21245 ) ) ( not ( = ?auto_21220 ?auto_21235 ) ) ( not ( = ?auto_21220 ?auto_21244 ) ) ( not ( = ?auto_21220 ?auto_21233 ) ) ( not ( = ?auto_21220 ?auto_21249 ) ) ( not ( = ?auto_21220 ?auto_21254 ) ) ( not ( = ?auto_21220 ?auto_21240 ) ) ( not ( = ?auto_21247 ?auto_21253 ) ) ( not ( = ?auto_21247 ?auto_21250 ) ) ( not ( = ?auto_21247 ?auto_21232 ) ) ( not ( = ?auto_21247 ?auto_21245 ) ) ( not ( = ?auto_21247 ?auto_21235 ) ) ( not ( = ?auto_21247 ?auto_21244 ) ) ( not ( = ?auto_21247 ?auto_21233 ) ) ( not ( = ?auto_21247 ?auto_21249 ) ) ( not ( = ?auto_21247 ?auto_21254 ) ) ( not ( = ?auto_21247 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21221 ) ) ( not ( = ?auto_21209 ?auto_21241 ) ) ( not ( = ?auto_21210 ?auto_21221 ) ) ( not ( = ?auto_21210 ?auto_21241 ) ) ( not ( = ?auto_21211 ?auto_21221 ) ) ( not ( = ?auto_21211 ?auto_21241 ) ) ( not ( = ?auto_21212 ?auto_21221 ) ) ( not ( = ?auto_21212 ?auto_21241 ) ) ( not ( = ?auto_21213 ?auto_21221 ) ) ( not ( = ?auto_21213 ?auto_21241 ) ) ( not ( = ?auto_21214 ?auto_21221 ) ) ( not ( = ?auto_21214 ?auto_21241 ) ) ( not ( = ?auto_21215 ?auto_21221 ) ) ( not ( = ?auto_21215 ?auto_21241 ) ) ( not ( = ?auto_21216 ?auto_21221 ) ) ( not ( = ?auto_21216 ?auto_21241 ) ) ( not ( = ?auto_21217 ?auto_21221 ) ) ( not ( = ?auto_21217 ?auto_21241 ) ) ( not ( = ?auto_21218 ?auto_21221 ) ) ( not ( = ?auto_21218 ?auto_21241 ) ) ( not ( = ?auto_21219 ?auto_21221 ) ) ( not ( = ?auto_21219 ?auto_21241 ) ) ( not ( = ?auto_21221 ?auto_21247 ) ) ( not ( = ?auto_21221 ?auto_21253 ) ) ( not ( = ?auto_21221 ?auto_21250 ) ) ( not ( = ?auto_21221 ?auto_21232 ) ) ( not ( = ?auto_21221 ?auto_21245 ) ) ( not ( = ?auto_21221 ?auto_21235 ) ) ( not ( = ?auto_21221 ?auto_21244 ) ) ( not ( = ?auto_21221 ?auto_21233 ) ) ( not ( = ?auto_21221 ?auto_21249 ) ) ( not ( = ?auto_21221 ?auto_21254 ) ) ( not ( = ?auto_21221 ?auto_21240 ) ) ( not ( = ?auto_21225 ?auto_21248 ) ) ( not ( = ?auto_21225 ?auto_21246 ) ) ( not ( = ?auto_21225 ?auto_21238 ) ) ( not ( = ?auto_21225 ?auto_21255 ) ) ( not ( = ?auto_21225 ?auto_21236 ) ) ( not ( = ?auto_21225 ?auto_21237 ) ) ( not ( = ?auto_21225 ?auto_21242 ) ) ( not ( = ?auto_21227 ?auto_21251 ) ) ( not ( = ?auto_21227 ?auto_21256 ) ) ( not ( = ?auto_21227 ?auto_21230 ) ) ( not ( = ?auto_21227 ?auto_21239 ) ) ( not ( = ?auto_21227 ?auto_21252 ) ) ( not ( = ?auto_21227 ?auto_21243 ) ) ( not ( = ?auto_21227 ?auto_21231 ) ) ( not ( = ?auto_21241 ?auto_21247 ) ) ( not ( = ?auto_21241 ?auto_21253 ) ) ( not ( = ?auto_21241 ?auto_21250 ) ) ( not ( = ?auto_21241 ?auto_21232 ) ) ( not ( = ?auto_21241 ?auto_21245 ) ) ( not ( = ?auto_21241 ?auto_21235 ) ) ( not ( = ?auto_21241 ?auto_21244 ) ) ( not ( = ?auto_21241 ?auto_21233 ) ) ( not ( = ?auto_21241 ?auto_21249 ) ) ( not ( = ?auto_21241 ?auto_21254 ) ) ( not ( = ?auto_21241 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21222 ) ) ( not ( = ?auto_21209 ?auto_21234 ) ) ( not ( = ?auto_21210 ?auto_21222 ) ) ( not ( = ?auto_21210 ?auto_21234 ) ) ( not ( = ?auto_21211 ?auto_21222 ) ) ( not ( = ?auto_21211 ?auto_21234 ) ) ( not ( = ?auto_21212 ?auto_21222 ) ) ( not ( = ?auto_21212 ?auto_21234 ) ) ( not ( = ?auto_21213 ?auto_21222 ) ) ( not ( = ?auto_21213 ?auto_21234 ) ) ( not ( = ?auto_21214 ?auto_21222 ) ) ( not ( = ?auto_21214 ?auto_21234 ) ) ( not ( = ?auto_21215 ?auto_21222 ) ) ( not ( = ?auto_21215 ?auto_21234 ) ) ( not ( = ?auto_21216 ?auto_21222 ) ) ( not ( = ?auto_21216 ?auto_21234 ) ) ( not ( = ?auto_21217 ?auto_21222 ) ) ( not ( = ?auto_21217 ?auto_21234 ) ) ( not ( = ?auto_21218 ?auto_21222 ) ) ( not ( = ?auto_21218 ?auto_21234 ) ) ( not ( = ?auto_21219 ?auto_21222 ) ) ( not ( = ?auto_21219 ?auto_21234 ) ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( not ( = ?auto_21220 ?auto_21234 ) ) ( not ( = ?auto_21222 ?auto_21241 ) ) ( not ( = ?auto_21222 ?auto_21247 ) ) ( not ( = ?auto_21222 ?auto_21253 ) ) ( not ( = ?auto_21222 ?auto_21250 ) ) ( not ( = ?auto_21222 ?auto_21232 ) ) ( not ( = ?auto_21222 ?auto_21245 ) ) ( not ( = ?auto_21222 ?auto_21235 ) ) ( not ( = ?auto_21222 ?auto_21244 ) ) ( not ( = ?auto_21222 ?auto_21233 ) ) ( not ( = ?auto_21222 ?auto_21249 ) ) ( not ( = ?auto_21222 ?auto_21254 ) ) ( not ( = ?auto_21222 ?auto_21240 ) ) ( not ( = ?auto_21234 ?auto_21241 ) ) ( not ( = ?auto_21234 ?auto_21247 ) ) ( not ( = ?auto_21234 ?auto_21253 ) ) ( not ( = ?auto_21234 ?auto_21250 ) ) ( not ( = ?auto_21234 ?auto_21232 ) ) ( not ( = ?auto_21234 ?auto_21245 ) ) ( not ( = ?auto_21234 ?auto_21235 ) ) ( not ( = ?auto_21234 ?auto_21244 ) ) ( not ( = ?auto_21234 ?auto_21233 ) ) ( not ( = ?auto_21234 ?auto_21249 ) ) ( not ( = ?auto_21234 ?auto_21254 ) ) ( not ( = ?auto_21234 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21223 ) ) ( not ( = ?auto_21209 ?auto_21229 ) ) ( not ( = ?auto_21210 ?auto_21223 ) ) ( not ( = ?auto_21210 ?auto_21229 ) ) ( not ( = ?auto_21211 ?auto_21223 ) ) ( not ( = ?auto_21211 ?auto_21229 ) ) ( not ( = ?auto_21212 ?auto_21223 ) ) ( not ( = ?auto_21212 ?auto_21229 ) ) ( not ( = ?auto_21213 ?auto_21223 ) ) ( not ( = ?auto_21213 ?auto_21229 ) ) ( not ( = ?auto_21214 ?auto_21223 ) ) ( not ( = ?auto_21214 ?auto_21229 ) ) ( not ( = ?auto_21215 ?auto_21223 ) ) ( not ( = ?auto_21215 ?auto_21229 ) ) ( not ( = ?auto_21216 ?auto_21223 ) ) ( not ( = ?auto_21216 ?auto_21229 ) ) ( not ( = ?auto_21217 ?auto_21223 ) ) ( not ( = ?auto_21217 ?auto_21229 ) ) ( not ( = ?auto_21218 ?auto_21223 ) ) ( not ( = ?auto_21218 ?auto_21229 ) ) ( not ( = ?auto_21219 ?auto_21223 ) ) ( not ( = ?auto_21219 ?auto_21229 ) ) ( not ( = ?auto_21220 ?auto_21223 ) ) ( not ( = ?auto_21220 ?auto_21229 ) ) ( not ( = ?auto_21221 ?auto_21223 ) ) ( not ( = ?auto_21221 ?auto_21229 ) ) ( not ( = ?auto_21223 ?auto_21234 ) ) ( not ( = ?auto_21223 ?auto_21241 ) ) ( not ( = ?auto_21223 ?auto_21247 ) ) ( not ( = ?auto_21223 ?auto_21253 ) ) ( not ( = ?auto_21223 ?auto_21250 ) ) ( not ( = ?auto_21223 ?auto_21232 ) ) ( not ( = ?auto_21223 ?auto_21245 ) ) ( not ( = ?auto_21223 ?auto_21235 ) ) ( not ( = ?auto_21223 ?auto_21244 ) ) ( not ( = ?auto_21223 ?auto_21233 ) ) ( not ( = ?auto_21223 ?auto_21249 ) ) ( not ( = ?auto_21223 ?auto_21254 ) ) ( not ( = ?auto_21223 ?auto_21240 ) ) ( not ( = ?auto_21229 ?auto_21234 ) ) ( not ( = ?auto_21229 ?auto_21241 ) ) ( not ( = ?auto_21229 ?auto_21247 ) ) ( not ( = ?auto_21229 ?auto_21253 ) ) ( not ( = ?auto_21229 ?auto_21250 ) ) ( not ( = ?auto_21229 ?auto_21232 ) ) ( not ( = ?auto_21229 ?auto_21245 ) ) ( not ( = ?auto_21229 ?auto_21235 ) ) ( not ( = ?auto_21229 ?auto_21244 ) ) ( not ( = ?auto_21229 ?auto_21233 ) ) ( not ( = ?auto_21229 ?auto_21249 ) ) ( not ( = ?auto_21229 ?auto_21254 ) ) ( not ( = ?auto_21229 ?auto_21240 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21209 ?auto_21210 ?auto_21211 ?auto_21212 ?auto_21213 ?auto_21214 ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21221 ?auto_21222 )
      ( MAKE-1CRATE ?auto_21222 ?auto_21223 )
      ( MAKE-14CRATE-VERIFY ?auto_21209 ?auto_21210 ?auto_21211 ?auto_21212 ?auto_21213 ?auto_21214 ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21221 ?auto_21222 ?auto_21223 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_21283 - SURFACE
      ?auto_21284 - SURFACE
      ?auto_21285 - SURFACE
      ?auto_21286 - SURFACE
      ?auto_21287 - SURFACE
      ?auto_21288 - SURFACE
      ?auto_21289 - SURFACE
      ?auto_21290 - SURFACE
      ?auto_21291 - SURFACE
      ?auto_21292 - SURFACE
      ?auto_21293 - SURFACE
      ?auto_21294 - SURFACE
      ?auto_21295 - SURFACE
      ?auto_21296 - SURFACE
      ?auto_21297 - SURFACE
      ?auto_21298 - SURFACE
    )
    :vars
    (
      ?auto_21302 - HOIST
      ?auto_21301 - PLACE
      ?auto_21299 - PLACE
      ?auto_21303 - HOIST
      ?auto_21300 - SURFACE
      ?auto_21314 - PLACE
      ?auto_21316 - HOIST
      ?auto_21308 - SURFACE
      ?auto_21306 - SURFACE
      ?auto_21305 - SURFACE
      ?auto_21318 - PLACE
      ?auto_21323 - HOIST
      ?auto_21315 - SURFACE
      ?auto_21332 - SURFACE
      ?auto_21310 - PLACE
      ?auto_21313 - HOIST
      ?auto_21324 - SURFACE
      ?auto_21325 - PLACE
      ?auto_21311 - HOIST
      ?auto_21322 - SURFACE
      ?auto_21309 - PLACE
      ?auto_21331 - HOIST
      ?auto_21327 - SURFACE
      ?auto_21307 - SURFACE
      ?auto_21329 - SURFACE
      ?auto_21320 - PLACE
      ?auto_21317 - HOIST
      ?auto_21328 - SURFACE
      ?auto_21321 - SURFACE
      ?auto_21319 - SURFACE
      ?auto_21326 - PLACE
      ?auto_21330 - HOIST
      ?auto_21312 - SURFACE
      ?auto_21304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21302 ?auto_21301 ) ( IS-CRATE ?auto_21298 ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( HOIST-AT ?auto_21303 ?auto_21299 ) ( SURFACE-AT ?auto_21298 ?auto_21299 ) ( ON ?auto_21298 ?auto_21300 ) ( CLEAR ?auto_21298 ) ( not ( = ?auto_21297 ?auto_21298 ) ) ( not ( = ?auto_21297 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21302 ?auto_21303 ) ) ( IS-CRATE ?auto_21297 ) ( not ( = ?auto_21314 ?auto_21301 ) ) ( HOIST-AT ?auto_21316 ?auto_21314 ) ( SURFACE-AT ?auto_21297 ?auto_21314 ) ( ON ?auto_21297 ?auto_21308 ) ( CLEAR ?auto_21297 ) ( not ( = ?auto_21296 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21308 ) ) ( not ( = ?auto_21297 ?auto_21308 ) ) ( not ( = ?auto_21302 ?auto_21316 ) ) ( IS-CRATE ?auto_21296 ) ( SURFACE-AT ?auto_21296 ?auto_21299 ) ( ON ?auto_21296 ?auto_21306 ) ( CLEAR ?auto_21296 ) ( not ( = ?auto_21295 ?auto_21296 ) ) ( not ( = ?auto_21295 ?auto_21306 ) ) ( not ( = ?auto_21296 ?auto_21306 ) ) ( IS-CRATE ?auto_21295 ) ( AVAILABLE ?auto_21316 ) ( SURFACE-AT ?auto_21295 ?auto_21314 ) ( ON ?auto_21295 ?auto_21305 ) ( CLEAR ?auto_21295 ) ( not ( = ?auto_21294 ?auto_21295 ) ) ( not ( = ?auto_21294 ?auto_21305 ) ) ( not ( = ?auto_21295 ?auto_21305 ) ) ( IS-CRATE ?auto_21294 ) ( not ( = ?auto_21318 ?auto_21301 ) ) ( HOIST-AT ?auto_21323 ?auto_21318 ) ( SURFACE-AT ?auto_21294 ?auto_21318 ) ( ON ?auto_21294 ?auto_21315 ) ( CLEAR ?auto_21294 ) ( not ( = ?auto_21293 ?auto_21294 ) ) ( not ( = ?auto_21293 ?auto_21315 ) ) ( not ( = ?auto_21294 ?auto_21315 ) ) ( not ( = ?auto_21302 ?auto_21323 ) ) ( IS-CRATE ?auto_21293 ) ( AVAILABLE ?auto_21303 ) ( SURFACE-AT ?auto_21293 ?auto_21299 ) ( ON ?auto_21293 ?auto_21332 ) ( CLEAR ?auto_21293 ) ( not ( = ?auto_21292 ?auto_21293 ) ) ( not ( = ?auto_21292 ?auto_21332 ) ) ( not ( = ?auto_21293 ?auto_21332 ) ) ( IS-CRATE ?auto_21292 ) ( not ( = ?auto_21310 ?auto_21301 ) ) ( HOIST-AT ?auto_21313 ?auto_21310 ) ( SURFACE-AT ?auto_21292 ?auto_21310 ) ( ON ?auto_21292 ?auto_21324 ) ( CLEAR ?auto_21292 ) ( not ( = ?auto_21291 ?auto_21292 ) ) ( not ( = ?auto_21291 ?auto_21324 ) ) ( not ( = ?auto_21292 ?auto_21324 ) ) ( not ( = ?auto_21302 ?auto_21313 ) ) ( IS-CRATE ?auto_21291 ) ( not ( = ?auto_21325 ?auto_21301 ) ) ( HOIST-AT ?auto_21311 ?auto_21325 ) ( SURFACE-AT ?auto_21291 ?auto_21325 ) ( ON ?auto_21291 ?auto_21322 ) ( CLEAR ?auto_21291 ) ( not ( = ?auto_21290 ?auto_21291 ) ) ( not ( = ?auto_21290 ?auto_21322 ) ) ( not ( = ?auto_21291 ?auto_21322 ) ) ( not ( = ?auto_21302 ?auto_21311 ) ) ( IS-CRATE ?auto_21290 ) ( not ( = ?auto_21309 ?auto_21301 ) ) ( HOIST-AT ?auto_21331 ?auto_21309 ) ( AVAILABLE ?auto_21331 ) ( SURFACE-AT ?auto_21290 ?auto_21309 ) ( ON ?auto_21290 ?auto_21327 ) ( CLEAR ?auto_21290 ) ( not ( = ?auto_21289 ?auto_21290 ) ) ( not ( = ?auto_21289 ?auto_21327 ) ) ( not ( = ?auto_21290 ?auto_21327 ) ) ( not ( = ?auto_21302 ?auto_21331 ) ) ( IS-CRATE ?auto_21289 ) ( AVAILABLE ?auto_21311 ) ( SURFACE-AT ?auto_21289 ?auto_21325 ) ( ON ?auto_21289 ?auto_21307 ) ( CLEAR ?auto_21289 ) ( not ( = ?auto_21288 ?auto_21289 ) ) ( not ( = ?auto_21288 ?auto_21307 ) ) ( not ( = ?auto_21289 ?auto_21307 ) ) ( IS-CRATE ?auto_21288 ) ( SURFACE-AT ?auto_21288 ?auto_21310 ) ( ON ?auto_21288 ?auto_21329 ) ( CLEAR ?auto_21288 ) ( not ( = ?auto_21287 ?auto_21288 ) ) ( not ( = ?auto_21287 ?auto_21329 ) ) ( not ( = ?auto_21288 ?auto_21329 ) ) ( IS-CRATE ?auto_21287 ) ( not ( = ?auto_21320 ?auto_21301 ) ) ( HOIST-AT ?auto_21317 ?auto_21320 ) ( AVAILABLE ?auto_21317 ) ( SURFACE-AT ?auto_21287 ?auto_21320 ) ( ON ?auto_21287 ?auto_21328 ) ( CLEAR ?auto_21287 ) ( not ( = ?auto_21286 ?auto_21287 ) ) ( not ( = ?auto_21286 ?auto_21328 ) ) ( not ( = ?auto_21287 ?auto_21328 ) ) ( not ( = ?auto_21302 ?auto_21317 ) ) ( IS-CRATE ?auto_21286 ) ( AVAILABLE ?auto_21313 ) ( SURFACE-AT ?auto_21286 ?auto_21310 ) ( ON ?auto_21286 ?auto_21321 ) ( CLEAR ?auto_21286 ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21285 ?auto_21321 ) ) ( not ( = ?auto_21286 ?auto_21321 ) ) ( IS-CRATE ?auto_21285 ) ( AVAILABLE ?auto_21323 ) ( SURFACE-AT ?auto_21285 ?auto_21318 ) ( ON ?auto_21285 ?auto_21319 ) ( CLEAR ?auto_21285 ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21319 ) ) ( not ( = ?auto_21285 ?auto_21319 ) ) ( SURFACE-AT ?auto_21283 ?auto_21301 ) ( CLEAR ?auto_21283 ) ( IS-CRATE ?auto_21284 ) ( AVAILABLE ?auto_21302 ) ( not ( = ?auto_21326 ?auto_21301 ) ) ( HOIST-AT ?auto_21330 ?auto_21326 ) ( AVAILABLE ?auto_21330 ) ( SURFACE-AT ?auto_21284 ?auto_21326 ) ( ON ?auto_21284 ?auto_21312 ) ( CLEAR ?auto_21284 ) ( TRUCK-AT ?auto_21304 ?auto_21301 ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21283 ?auto_21312 ) ) ( not ( = ?auto_21284 ?auto_21312 ) ) ( not ( = ?auto_21302 ?auto_21330 ) ) ( not ( = ?auto_21283 ?auto_21285 ) ) ( not ( = ?auto_21283 ?auto_21319 ) ) ( not ( = ?auto_21285 ?auto_21312 ) ) ( not ( = ?auto_21318 ?auto_21326 ) ) ( not ( = ?auto_21323 ?auto_21330 ) ) ( not ( = ?auto_21319 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21286 ) ) ( not ( = ?auto_21283 ?auto_21321 ) ) ( not ( = ?auto_21284 ?auto_21286 ) ) ( not ( = ?auto_21284 ?auto_21321 ) ) ( not ( = ?auto_21286 ?auto_21319 ) ) ( not ( = ?auto_21286 ?auto_21312 ) ) ( not ( = ?auto_21310 ?auto_21318 ) ) ( not ( = ?auto_21310 ?auto_21326 ) ) ( not ( = ?auto_21313 ?auto_21323 ) ) ( not ( = ?auto_21313 ?auto_21330 ) ) ( not ( = ?auto_21321 ?auto_21319 ) ) ( not ( = ?auto_21321 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21287 ) ) ( not ( = ?auto_21283 ?auto_21328 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21328 ) ) ( not ( = ?auto_21285 ?auto_21287 ) ) ( not ( = ?auto_21285 ?auto_21328 ) ) ( not ( = ?auto_21287 ?auto_21321 ) ) ( not ( = ?auto_21287 ?auto_21319 ) ) ( not ( = ?auto_21287 ?auto_21312 ) ) ( not ( = ?auto_21320 ?auto_21310 ) ) ( not ( = ?auto_21320 ?auto_21318 ) ) ( not ( = ?auto_21320 ?auto_21326 ) ) ( not ( = ?auto_21317 ?auto_21313 ) ) ( not ( = ?auto_21317 ?auto_21323 ) ) ( not ( = ?auto_21317 ?auto_21330 ) ) ( not ( = ?auto_21328 ?auto_21321 ) ) ( not ( = ?auto_21328 ?auto_21319 ) ) ( not ( = ?auto_21328 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21288 ) ) ( not ( = ?auto_21283 ?auto_21329 ) ) ( not ( = ?auto_21284 ?auto_21288 ) ) ( not ( = ?auto_21284 ?auto_21329 ) ) ( not ( = ?auto_21285 ?auto_21288 ) ) ( not ( = ?auto_21285 ?auto_21329 ) ) ( not ( = ?auto_21286 ?auto_21288 ) ) ( not ( = ?auto_21286 ?auto_21329 ) ) ( not ( = ?auto_21288 ?auto_21328 ) ) ( not ( = ?auto_21288 ?auto_21321 ) ) ( not ( = ?auto_21288 ?auto_21319 ) ) ( not ( = ?auto_21288 ?auto_21312 ) ) ( not ( = ?auto_21329 ?auto_21328 ) ) ( not ( = ?auto_21329 ?auto_21321 ) ) ( not ( = ?auto_21329 ?auto_21319 ) ) ( not ( = ?auto_21329 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21289 ) ) ( not ( = ?auto_21283 ?auto_21307 ) ) ( not ( = ?auto_21284 ?auto_21289 ) ) ( not ( = ?auto_21284 ?auto_21307 ) ) ( not ( = ?auto_21285 ?auto_21289 ) ) ( not ( = ?auto_21285 ?auto_21307 ) ) ( not ( = ?auto_21286 ?auto_21289 ) ) ( not ( = ?auto_21286 ?auto_21307 ) ) ( not ( = ?auto_21287 ?auto_21289 ) ) ( not ( = ?auto_21287 ?auto_21307 ) ) ( not ( = ?auto_21289 ?auto_21329 ) ) ( not ( = ?auto_21289 ?auto_21328 ) ) ( not ( = ?auto_21289 ?auto_21321 ) ) ( not ( = ?auto_21289 ?auto_21319 ) ) ( not ( = ?auto_21289 ?auto_21312 ) ) ( not ( = ?auto_21325 ?auto_21310 ) ) ( not ( = ?auto_21325 ?auto_21320 ) ) ( not ( = ?auto_21325 ?auto_21318 ) ) ( not ( = ?auto_21325 ?auto_21326 ) ) ( not ( = ?auto_21311 ?auto_21313 ) ) ( not ( = ?auto_21311 ?auto_21317 ) ) ( not ( = ?auto_21311 ?auto_21323 ) ) ( not ( = ?auto_21311 ?auto_21330 ) ) ( not ( = ?auto_21307 ?auto_21329 ) ) ( not ( = ?auto_21307 ?auto_21328 ) ) ( not ( = ?auto_21307 ?auto_21321 ) ) ( not ( = ?auto_21307 ?auto_21319 ) ) ( not ( = ?auto_21307 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21290 ) ) ( not ( = ?auto_21283 ?auto_21327 ) ) ( not ( = ?auto_21284 ?auto_21290 ) ) ( not ( = ?auto_21284 ?auto_21327 ) ) ( not ( = ?auto_21285 ?auto_21290 ) ) ( not ( = ?auto_21285 ?auto_21327 ) ) ( not ( = ?auto_21286 ?auto_21290 ) ) ( not ( = ?auto_21286 ?auto_21327 ) ) ( not ( = ?auto_21287 ?auto_21290 ) ) ( not ( = ?auto_21287 ?auto_21327 ) ) ( not ( = ?auto_21288 ?auto_21290 ) ) ( not ( = ?auto_21288 ?auto_21327 ) ) ( not ( = ?auto_21290 ?auto_21307 ) ) ( not ( = ?auto_21290 ?auto_21329 ) ) ( not ( = ?auto_21290 ?auto_21328 ) ) ( not ( = ?auto_21290 ?auto_21321 ) ) ( not ( = ?auto_21290 ?auto_21319 ) ) ( not ( = ?auto_21290 ?auto_21312 ) ) ( not ( = ?auto_21309 ?auto_21325 ) ) ( not ( = ?auto_21309 ?auto_21310 ) ) ( not ( = ?auto_21309 ?auto_21320 ) ) ( not ( = ?auto_21309 ?auto_21318 ) ) ( not ( = ?auto_21309 ?auto_21326 ) ) ( not ( = ?auto_21331 ?auto_21311 ) ) ( not ( = ?auto_21331 ?auto_21313 ) ) ( not ( = ?auto_21331 ?auto_21317 ) ) ( not ( = ?auto_21331 ?auto_21323 ) ) ( not ( = ?auto_21331 ?auto_21330 ) ) ( not ( = ?auto_21327 ?auto_21307 ) ) ( not ( = ?auto_21327 ?auto_21329 ) ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( not ( = ?auto_21327 ?auto_21321 ) ) ( not ( = ?auto_21327 ?auto_21319 ) ) ( not ( = ?auto_21327 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21291 ) ) ( not ( = ?auto_21283 ?auto_21322 ) ) ( not ( = ?auto_21284 ?auto_21291 ) ) ( not ( = ?auto_21284 ?auto_21322 ) ) ( not ( = ?auto_21285 ?auto_21291 ) ) ( not ( = ?auto_21285 ?auto_21322 ) ) ( not ( = ?auto_21286 ?auto_21291 ) ) ( not ( = ?auto_21286 ?auto_21322 ) ) ( not ( = ?auto_21287 ?auto_21291 ) ) ( not ( = ?auto_21287 ?auto_21322 ) ) ( not ( = ?auto_21288 ?auto_21291 ) ) ( not ( = ?auto_21288 ?auto_21322 ) ) ( not ( = ?auto_21289 ?auto_21291 ) ) ( not ( = ?auto_21289 ?auto_21322 ) ) ( not ( = ?auto_21291 ?auto_21327 ) ) ( not ( = ?auto_21291 ?auto_21307 ) ) ( not ( = ?auto_21291 ?auto_21329 ) ) ( not ( = ?auto_21291 ?auto_21328 ) ) ( not ( = ?auto_21291 ?auto_21321 ) ) ( not ( = ?auto_21291 ?auto_21319 ) ) ( not ( = ?auto_21291 ?auto_21312 ) ) ( not ( = ?auto_21322 ?auto_21327 ) ) ( not ( = ?auto_21322 ?auto_21307 ) ) ( not ( = ?auto_21322 ?auto_21329 ) ) ( not ( = ?auto_21322 ?auto_21328 ) ) ( not ( = ?auto_21322 ?auto_21321 ) ) ( not ( = ?auto_21322 ?auto_21319 ) ) ( not ( = ?auto_21322 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21292 ) ) ( not ( = ?auto_21283 ?auto_21324 ) ) ( not ( = ?auto_21284 ?auto_21292 ) ) ( not ( = ?auto_21284 ?auto_21324 ) ) ( not ( = ?auto_21285 ?auto_21292 ) ) ( not ( = ?auto_21285 ?auto_21324 ) ) ( not ( = ?auto_21286 ?auto_21292 ) ) ( not ( = ?auto_21286 ?auto_21324 ) ) ( not ( = ?auto_21287 ?auto_21292 ) ) ( not ( = ?auto_21287 ?auto_21324 ) ) ( not ( = ?auto_21288 ?auto_21292 ) ) ( not ( = ?auto_21288 ?auto_21324 ) ) ( not ( = ?auto_21289 ?auto_21292 ) ) ( not ( = ?auto_21289 ?auto_21324 ) ) ( not ( = ?auto_21290 ?auto_21292 ) ) ( not ( = ?auto_21290 ?auto_21324 ) ) ( not ( = ?auto_21292 ?auto_21322 ) ) ( not ( = ?auto_21292 ?auto_21327 ) ) ( not ( = ?auto_21292 ?auto_21307 ) ) ( not ( = ?auto_21292 ?auto_21329 ) ) ( not ( = ?auto_21292 ?auto_21328 ) ) ( not ( = ?auto_21292 ?auto_21321 ) ) ( not ( = ?auto_21292 ?auto_21319 ) ) ( not ( = ?auto_21292 ?auto_21312 ) ) ( not ( = ?auto_21324 ?auto_21322 ) ) ( not ( = ?auto_21324 ?auto_21327 ) ) ( not ( = ?auto_21324 ?auto_21307 ) ) ( not ( = ?auto_21324 ?auto_21329 ) ) ( not ( = ?auto_21324 ?auto_21328 ) ) ( not ( = ?auto_21324 ?auto_21321 ) ) ( not ( = ?auto_21324 ?auto_21319 ) ) ( not ( = ?auto_21324 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21293 ) ) ( not ( = ?auto_21283 ?auto_21332 ) ) ( not ( = ?auto_21284 ?auto_21293 ) ) ( not ( = ?auto_21284 ?auto_21332 ) ) ( not ( = ?auto_21285 ?auto_21293 ) ) ( not ( = ?auto_21285 ?auto_21332 ) ) ( not ( = ?auto_21286 ?auto_21293 ) ) ( not ( = ?auto_21286 ?auto_21332 ) ) ( not ( = ?auto_21287 ?auto_21293 ) ) ( not ( = ?auto_21287 ?auto_21332 ) ) ( not ( = ?auto_21288 ?auto_21293 ) ) ( not ( = ?auto_21288 ?auto_21332 ) ) ( not ( = ?auto_21289 ?auto_21293 ) ) ( not ( = ?auto_21289 ?auto_21332 ) ) ( not ( = ?auto_21290 ?auto_21293 ) ) ( not ( = ?auto_21290 ?auto_21332 ) ) ( not ( = ?auto_21291 ?auto_21293 ) ) ( not ( = ?auto_21291 ?auto_21332 ) ) ( not ( = ?auto_21293 ?auto_21324 ) ) ( not ( = ?auto_21293 ?auto_21322 ) ) ( not ( = ?auto_21293 ?auto_21327 ) ) ( not ( = ?auto_21293 ?auto_21307 ) ) ( not ( = ?auto_21293 ?auto_21329 ) ) ( not ( = ?auto_21293 ?auto_21328 ) ) ( not ( = ?auto_21293 ?auto_21321 ) ) ( not ( = ?auto_21293 ?auto_21319 ) ) ( not ( = ?auto_21293 ?auto_21312 ) ) ( not ( = ?auto_21299 ?auto_21310 ) ) ( not ( = ?auto_21299 ?auto_21325 ) ) ( not ( = ?auto_21299 ?auto_21309 ) ) ( not ( = ?auto_21299 ?auto_21320 ) ) ( not ( = ?auto_21299 ?auto_21318 ) ) ( not ( = ?auto_21299 ?auto_21326 ) ) ( not ( = ?auto_21303 ?auto_21313 ) ) ( not ( = ?auto_21303 ?auto_21311 ) ) ( not ( = ?auto_21303 ?auto_21331 ) ) ( not ( = ?auto_21303 ?auto_21317 ) ) ( not ( = ?auto_21303 ?auto_21323 ) ) ( not ( = ?auto_21303 ?auto_21330 ) ) ( not ( = ?auto_21332 ?auto_21324 ) ) ( not ( = ?auto_21332 ?auto_21322 ) ) ( not ( = ?auto_21332 ?auto_21327 ) ) ( not ( = ?auto_21332 ?auto_21307 ) ) ( not ( = ?auto_21332 ?auto_21329 ) ) ( not ( = ?auto_21332 ?auto_21328 ) ) ( not ( = ?auto_21332 ?auto_21321 ) ) ( not ( = ?auto_21332 ?auto_21319 ) ) ( not ( = ?auto_21332 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21294 ) ) ( not ( = ?auto_21283 ?auto_21315 ) ) ( not ( = ?auto_21284 ?auto_21294 ) ) ( not ( = ?auto_21284 ?auto_21315 ) ) ( not ( = ?auto_21285 ?auto_21294 ) ) ( not ( = ?auto_21285 ?auto_21315 ) ) ( not ( = ?auto_21286 ?auto_21294 ) ) ( not ( = ?auto_21286 ?auto_21315 ) ) ( not ( = ?auto_21287 ?auto_21294 ) ) ( not ( = ?auto_21287 ?auto_21315 ) ) ( not ( = ?auto_21288 ?auto_21294 ) ) ( not ( = ?auto_21288 ?auto_21315 ) ) ( not ( = ?auto_21289 ?auto_21294 ) ) ( not ( = ?auto_21289 ?auto_21315 ) ) ( not ( = ?auto_21290 ?auto_21294 ) ) ( not ( = ?auto_21290 ?auto_21315 ) ) ( not ( = ?auto_21291 ?auto_21294 ) ) ( not ( = ?auto_21291 ?auto_21315 ) ) ( not ( = ?auto_21292 ?auto_21294 ) ) ( not ( = ?auto_21292 ?auto_21315 ) ) ( not ( = ?auto_21294 ?auto_21332 ) ) ( not ( = ?auto_21294 ?auto_21324 ) ) ( not ( = ?auto_21294 ?auto_21322 ) ) ( not ( = ?auto_21294 ?auto_21327 ) ) ( not ( = ?auto_21294 ?auto_21307 ) ) ( not ( = ?auto_21294 ?auto_21329 ) ) ( not ( = ?auto_21294 ?auto_21328 ) ) ( not ( = ?auto_21294 ?auto_21321 ) ) ( not ( = ?auto_21294 ?auto_21319 ) ) ( not ( = ?auto_21294 ?auto_21312 ) ) ( not ( = ?auto_21315 ?auto_21332 ) ) ( not ( = ?auto_21315 ?auto_21324 ) ) ( not ( = ?auto_21315 ?auto_21322 ) ) ( not ( = ?auto_21315 ?auto_21327 ) ) ( not ( = ?auto_21315 ?auto_21307 ) ) ( not ( = ?auto_21315 ?auto_21329 ) ) ( not ( = ?auto_21315 ?auto_21328 ) ) ( not ( = ?auto_21315 ?auto_21321 ) ) ( not ( = ?auto_21315 ?auto_21319 ) ) ( not ( = ?auto_21315 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21295 ) ) ( not ( = ?auto_21283 ?auto_21305 ) ) ( not ( = ?auto_21284 ?auto_21295 ) ) ( not ( = ?auto_21284 ?auto_21305 ) ) ( not ( = ?auto_21285 ?auto_21295 ) ) ( not ( = ?auto_21285 ?auto_21305 ) ) ( not ( = ?auto_21286 ?auto_21295 ) ) ( not ( = ?auto_21286 ?auto_21305 ) ) ( not ( = ?auto_21287 ?auto_21295 ) ) ( not ( = ?auto_21287 ?auto_21305 ) ) ( not ( = ?auto_21288 ?auto_21295 ) ) ( not ( = ?auto_21288 ?auto_21305 ) ) ( not ( = ?auto_21289 ?auto_21295 ) ) ( not ( = ?auto_21289 ?auto_21305 ) ) ( not ( = ?auto_21290 ?auto_21295 ) ) ( not ( = ?auto_21290 ?auto_21305 ) ) ( not ( = ?auto_21291 ?auto_21295 ) ) ( not ( = ?auto_21291 ?auto_21305 ) ) ( not ( = ?auto_21292 ?auto_21295 ) ) ( not ( = ?auto_21292 ?auto_21305 ) ) ( not ( = ?auto_21293 ?auto_21295 ) ) ( not ( = ?auto_21293 ?auto_21305 ) ) ( not ( = ?auto_21295 ?auto_21315 ) ) ( not ( = ?auto_21295 ?auto_21332 ) ) ( not ( = ?auto_21295 ?auto_21324 ) ) ( not ( = ?auto_21295 ?auto_21322 ) ) ( not ( = ?auto_21295 ?auto_21327 ) ) ( not ( = ?auto_21295 ?auto_21307 ) ) ( not ( = ?auto_21295 ?auto_21329 ) ) ( not ( = ?auto_21295 ?auto_21328 ) ) ( not ( = ?auto_21295 ?auto_21321 ) ) ( not ( = ?auto_21295 ?auto_21319 ) ) ( not ( = ?auto_21295 ?auto_21312 ) ) ( not ( = ?auto_21314 ?auto_21318 ) ) ( not ( = ?auto_21314 ?auto_21299 ) ) ( not ( = ?auto_21314 ?auto_21310 ) ) ( not ( = ?auto_21314 ?auto_21325 ) ) ( not ( = ?auto_21314 ?auto_21309 ) ) ( not ( = ?auto_21314 ?auto_21320 ) ) ( not ( = ?auto_21314 ?auto_21326 ) ) ( not ( = ?auto_21316 ?auto_21323 ) ) ( not ( = ?auto_21316 ?auto_21303 ) ) ( not ( = ?auto_21316 ?auto_21313 ) ) ( not ( = ?auto_21316 ?auto_21311 ) ) ( not ( = ?auto_21316 ?auto_21331 ) ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( not ( = ?auto_21316 ?auto_21330 ) ) ( not ( = ?auto_21305 ?auto_21315 ) ) ( not ( = ?auto_21305 ?auto_21332 ) ) ( not ( = ?auto_21305 ?auto_21324 ) ) ( not ( = ?auto_21305 ?auto_21322 ) ) ( not ( = ?auto_21305 ?auto_21327 ) ) ( not ( = ?auto_21305 ?auto_21307 ) ) ( not ( = ?auto_21305 ?auto_21329 ) ) ( not ( = ?auto_21305 ?auto_21328 ) ) ( not ( = ?auto_21305 ?auto_21321 ) ) ( not ( = ?auto_21305 ?auto_21319 ) ) ( not ( = ?auto_21305 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21296 ) ) ( not ( = ?auto_21283 ?auto_21306 ) ) ( not ( = ?auto_21284 ?auto_21296 ) ) ( not ( = ?auto_21284 ?auto_21306 ) ) ( not ( = ?auto_21285 ?auto_21296 ) ) ( not ( = ?auto_21285 ?auto_21306 ) ) ( not ( = ?auto_21286 ?auto_21296 ) ) ( not ( = ?auto_21286 ?auto_21306 ) ) ( not ( = ?auto_21287 ?auto_21296 ) ) ( not ( = ?auto_21287 ?auto_21306 ) ) ( not ( = ?auto_21288 ?auto_21296 ) ) ( not ( = ?auto_21288 ?auto_21306 ) ) ( not ( = ?auto_21289 ?auto_21296 ) ) ( not ( = ?auto_21289 ?auto_21306 ) ) ( not ( = ?auto_21290 ?auto_21296 ) ) ( not ( = ?auto_21290 ?auto_21306 ) ) ( not ( = ?auto_21291 ?auto_21296 ) ) ( not ( = ?auto_21291 ?auto_21306 ) ) ( not ( = ?auto_21292 ?auto_21296 ) ) ( not ( = ?auto_21292 ?auto_21306 ) ) ( not ( = ?auto_21293 ?auto_21296 ) ) ( not ( = ?auto_21293 ?auto_21306 ) ) ( not ( = ?auto_21294 ?auto_21296 ) ) ( not ( = ?auto_21294 ?auto_21306 ) ) ( not ( = ?auto_21296 ?auto_21305 ) ) ( not ( = ?auto_21296 ?auto_21315 ) ) ( not ( = ?auto_21296 ?auto_21332 ) ) ( not ( = ?auto_21296 ?auto_21324 ) ) ( not ( = ?auto_21296 ?auto_21322 ) ) ( not ( = ?auto_21296 ?auto_21327 ) ) ( not ( = ?auto_21296 ?auto_21307 ) ) ( not ( = ?auto_21296 ?auto_21329 ) ) ( not ( = ?auto_21296 ?auto_21328 ) ) ( not ( = ?auto_21296 ?auto_21321 ) ) ( not ( = ?auto_21296 ?auto_21319 ) ) ( not ( = ?auto_21296 ?auto_21312 ) ) ( not ( = ?auto_21306 ?auto_21305 ) ) ( not ( = ?auto_21306 ?auto_21315 ) ) ( not ( = ?auto_21306 ?auto_21332 ) ) ( not ( = ?auto_21306 ?auto_21324 ) ) ( not ( = ?auto_21306 ?auto_21322 ) ) ( not ( = ?auto_21306 ?auto_21327 ) ) ( not ( = ?auto_21306 ?auto_21307 ) ) ( not ( = ?auto_21306 ?auto_21329 ) ) ( not ( = ?auto_21306 ?auto_21328 ) ) ( not ( = ?auto_21306 ?auto_21321 ) ) ( not ( = ?auto_21306 ?auto_21319 ) ) ( not ( = ?auto_21306 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21297 ) ) ( not ( = ?auto_21283 ?auto_21308 ) ) ( not ( = ?auto_21284 ?auto_21297 ) ) ( not ( = ?auto_21284 ?auto_21308 ) ) ( not ( = ?auto_21285 ?auto_21297 ) ) ( not ( = ?auto_21285 ?auto_21308 ) ) ( not ( = ?auto_21286 ?auto_21297 ) ) ( not ( = ?auto_21286 ?auto_21308 ) ) ( not ( = ?auto_21287 ?auto_21297 ) ) ( not ( = ?auto_21287 ?auto_21308 ) ) ( not ( = ?auto_21288 ?auto_21297 ) ) ( not ( = ?auto_21288 ?auto_21308 ) ) ( not ( = ?auto_21289 ?auto_21297 ) ) ( not ( = ?auto_21289 ?auto_21308 ) ) ( not ( = ?auto_21290 ?auto_21297 ) ) ( not ( = ?auto_21290 ?auto_21308 ) ) ( not ( = ?auto_21291 ?auto_21297 ) ) ( not ( = ?auto_21291 ?auto_21308 ) ) ( not ( = ?auto_21292 ?auto_21297 ) ) ( not ( = ?auto_21292 ?auto_21308 ) ) ( not ( = ?auto_21293 ?auto_21297 ) ) ( not ( = ?auto_21293 ?auto_21308 ) ) ( not ( = ?auto_21294 ?auto_21297 ) ) ( not ( = ?auto_21294 ?auto_21308 ) ) ( not ( = ?auto_21295 ?auto_21297 ) ) ( not ( = ?auto_21295 ?auto_21308 ) ) ( not ( = ?auto_21297 ?auto_21306 ) ) ( not ( = ?auto_21297 ?auto_21305 ) ) ( not ( = ?auto_21297 ?auto_21315 ) ) ( not ( = ?auto_21297 ?auto_21332 ) ) ( not ( = ?auto_21297 ?auto_21324 ) ) ( not ( = ?auto_21297 ?auto_21322 ) ) ( not ( = ?auto_21297 ?auto_21327 ) ) ( not ( = ?auto_21297 ?auto_21307 ) ) ( not ( = ?auto_21297 ?auto_21329 ) ) ( not ( = ?auto_21297 ?auto_21328 ) ) ( not ( = ?auto_21297 ?auto_21321 ) ) ( not ( = ?auto_21297 ?auto_21319 ) ) ( not ( = ?auto_21297 ?auto_21312 ) ) ( not ( = ?auto_21308 ?auto_21306 ) ) ( not ( = ?auto_21308 ?auto_21305 ) ) ( not ( = ?auto_21308 ?auto_21315 ) ) ( not ( = ?auto_21308 ?auto_21332 ) ) ( not ( = ?auto_21308 ?auto_21324 ) ) ( not ( = ?auto_21308 ?auto_21322 ) ) ( not ( = ?auto_21308 ?auto_21327 ) ) ( not ( = ?auto_21308 ?auto_21307 ) ) ( not ( = ?auto_21308 ?auto_21329 ) ) ( not ( = ?auto_21308 ?auto_21328 ) ) ( not ( = ?auto_21308 ?auto_21321 ) ) ( not ( = ?auto_21308 ?auto_21319 ) ) ( not ( = ?auto_21308 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21298 ) ) ( not ( = ?auto_21283 ?auto_21300 ) ) ( not ( = ?auto_21284 ?auto_21298 ) ) ( not ( = ?auto_21284 ?auto_21300 ) ) ( not ( = ?auto_21285 ?auto_21298 ) ) ( not ( = ?auto_21285 ?auto_21300 ) ) ( not ( = ?auto_21286 ?auto_21298 ) ) ( not ( = ?auto_21286 ?auto_21300 ) ) ( not ( = ?auto_21287 ?auto_21298 ) ) ( not ( = ?auto_21287 ?auto_21300 ) ) ( not ( = ?auto_21288 ?auto_21298 ) ) ( not ( = ?auto_21288 ?auto_21300 ) ) ( not ( = ?auto_21289 ?auto_21298 ) ) ( not ( = ?auto_21289 ?auto_21300 ) ) ( not ( = ?auto_21290 ?auto_21298 ) ) ( not ( = ?auto_21290 ?auto_21300 ) ) ( not ( = ?auto_21291 ?auto_21298 ) ) ( not ( = ?auto_21291 ?auto_21300 ) ) ( not ( = ?auto_21292 ?auto_21298 ) ) ( not ( = ?auto_21292 ?auto_21300 ) ) ( not ( = ?auto_21293 ?auto_21298 ) ) ( not ( = ?auto_21293 ?auto_21300 ) ) ( not ( = ?auto_21294 ?auto_21298 ) ) ( not ( = ?auto_21294 ?auto_21300 ) ) ( not ( = ?auto_21295 ?auto_21298 ) ) ( not ( = ?auto_21295 ?auto_21300 ) ) ( not ( = ?auto_21296 ?auto_21298 ) ) ( not ( = ?auto_21296 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21308 ) ) ( not ( = ?auto_21298 ?auto_21306 ) ) ( not ( = ?auto_21298 ?auto_21305 ) ) ( not ( = ?auto_21298 ?auto_21315 ) ) ( not ( = ?auto_21298 ?auto_21332 ) ) ( not ( = ?auto_21298 ?auto_21324 ) ) ( not ( = ?auto_21298 ?auto_21322 ) ) ( not ( = ?auto_21298 ?auto_21327 ) ) ( not ( = ?auto_21298 ?auto_21307 ) ) ( not ( = ?auto_21298 ?auto_21329 ) ) ( not ( = ?auto_21298 ?auto_21328 ) ) ( not ( = ?auto_21298 ?auto_21321 ) ) ( not ( = ?auto_21298 ?auto_21319 ) ) ( not ( = ?auto_21298 ?auto_21312 ) ) ( not ( = ?auto_21300 ?auto_21308 ) ) ( not ( = ?auto_21300 ?auto_21306 ) ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( not ( = ?auto_21300 ?auto_21315 ) ) ( not ( = ?auto_21300 ?auto_21332 ) ) ( not ( = ?auto_21300 ?auto_21324 ) ) ( not ( = ?auto_21300 ?auto_21322 ) ) ( not ( = ?auto_21300 ?auto_21327 ) ) ( not ( = ?auto_21300 ?auto_21307 ) ) ( not ( = ?auto_21300 ?auto_21329 ) ) ( not ( = ?auto_21300 ?auto_21328 ) ) ( not ( = ?auto_21300 ?auto_21321 ) ) ( not ( = ?auto_21300 ?auto_21319 ) ) ( not ( = ?auto_21300 ?auto_21312 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21288 ?auto_21289 ?auto_21290 ?auto_21291 ?auto_21292 ?auto_21293 ?auto_21294 ?auto_21295 ?auto_21296 ?auto_21297 )
      ( MAKE-1CRATE ?auto_21297 ?auto_21298 )
      ( MAKE-15CRATE-VERIFY ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21288 ?auto_21289 ?auto_21290 ?auto_21291 ?auto_21292 ?auto_21293 ?auto_21294 ?auto_21295 ?auto_21296 ?auto_21297 ?auto_21298 ) )
  )

)

