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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14594 - SURFACE
      ?auto_14595 - SURFACE
    )
    :vars
    (
      ?auto_14596 - HOIST
      ?auto_14597 - PLACE
      ?auto_14599 - PLACE
      ?auto_14600 - HOIST
      ?auto_14601 - SURFACE
      ?auto_14598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14596 ?auto_14597 ) ( SURFACE-AT ?auto_14594 ?auto_14597 ) ( CLEAR ?auto_14594 ) ( IS-CRATE ?auto_14595 ) ( AVAILABLE ?auto_14596 ) ( not ( = ?auto_14599 ?auto_14597 ) ) ( HOIST-AT ?auto_14600 ?auto_14599 ) ( AVAILABLE ?auto_14600 ) ( SURFACE-AT ?auto_14595 ?auto_14599 ) ( ON ?auto_14595 ?auto_14601 ) ( CLEAR ?auto_14595 ) ( TRUCK-AT ?auto_14598 ?auto_14597 ) ( not ( = ?auto_14594 ?auto_14595 ) ) ( not ( = ?auto_14594 ?auto_14601 ) ) ( not ( = ?auto_14595 ?auto_14601 ) ) ( not ( = ?auto_14596 ?auto_14600 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14598 ?auto_14597 ?auto_14599 )
      ( !LIFT ?auto_14600 ?auto_14595 ?auto_14601 ?auto_14599 )
      ( !LOAD ?auto_14600 ?auto_14595 ?auto_14598 ?auto_14599 )
      ( !DRIVE ?auto_14598 ?auto_14599 ?auto_14597 )
      ( !UNLOAD ?auto_14596 ?auto_14595 ?auto_14598 ?auto_14597 )
      ( !DROP ?auto_14596 ?auto_14595 ?auto_14594 ?auto_14597 )
      ( MAKE-1CRATE-VERIFY ?auto_14594 ?auto_14595 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14615 - SURFACE
      ?auto_14616 - SURFACE
      ?auto_14617 - SURFACE
    )
    :vars
    (
      ?auto_14622 - HOIST
      ?auto_14623 - PLACE
      ?auto_14621 - PLACE
      ?auto_14620 - HOIST
      ?auto_14619 - SURFACE
      ?auto_14625 - PLACE
      ?auto_14624 - HOIST
      ?auto_14626 - SURFACE
      ?auto_14618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14622 ?auto_14623 ) ( IS-CRATE ?auto_14617 ) ( not ( = ?auto_14621 ?auto_14623 ) ) ( HOIST-AT ?auto_14620 ?auto_14621 ) ( AVAILABLE ?auto_14620 ) ( SURFACE-AT ?auto_14617 ?auto_14621 ) ( ON ?auto_14617 ?auto_14619 ) ( CLEAR ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( not ( = ?auto_14616 ?auto_14619 ) ) ( not ( = ?auto_14617 ?auto_14619 ) ) ( not ( = ?auto_14622 ?auto_14620 ) ) ( SURFACE-AT ?auto_14615 ?auto_14623 ) ( CLEAR ?auto_14615 ) ( IS-CRATE ?auto_14616 ) ( AVAILABLE ?auto_14622 ) ( not ( = ?auto_14625 ?auto_14623 ) ) ( HOIST-AT ?auto_14624 ?auto_14625 ) ( AVAILABLE ?auto_14624 ) ( SURFACE-AT ?auto_14616 ?auto_14625 ) ( ON ?auto_14616 ?auto_14626 ) ( CLEAR ?auto_14616 ) ( TRUCK-AT ?auto_14618 ?auto_14623 ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14626 ) ) ( not ( = ?auto_14616 ?auto_14626 ) ) ( not ( = ?auto_14622 ?auto_14624 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14619 ) ) ( not ( = ?auto_14617 ?auto_14626 ) ) ( not ( = ?auto_14621 ?auto_14625 ) ) ( not ( = ?auto_14620 ?auto_14624 ) ) ( not ( = ?auto_14619 ?auto_14626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14615 ?auto_14616 )
      ( MAKE-1CRATE ?auto_14616 ?auto_14617 )
      ( MAKE-2CRATE-VERIFY ?auto_14615 ?auto_14616 ?auto_14617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14641 - SURFACE
      ?auto_14642 - SURFACE
      ?auto_14643 - SURFACE
      ?auto_14644 - SURFACE
    )
    :vars
    (
      ?auto_14650 - HOIST
      ?auto_14649 - PLACE
      ?auto_14647 - PLACE
      ?auto_14646 - HOIST
      ?auto_14645 - SURFACE
      ?auto_14653 - PLACE
      ?auto_14651 - HOIST
      ?auto_14656 - SURFACE
      ?auto_14654 - PLACE
      ?auto_14652 - HOIST
      ?auto_14655 - SURFACE
      ?auto_14648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14650 ?auto_14649 ) ( IS-CRATE ?auto_14644 ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( HOIST-AT ?auto_14646 ?auto_14647 ) ( AVAILABLE ?auto_14646 ) ( SURFACE-AT ?auto_14644 ?auto_14647 ) ( ON ?auto_14644 ?auto_14645 ) ( CLEAR ?auto_14644 ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14645 ) ) ( not ( = ?auto_14650 ?auto_14646 ) ) ( IS-CRATE ?auto_14643 ) ( not ( = ?auto_14653 ?auto_14649 ) ) ( HOIST-AT ?auto_14651 ?auto_14653 ) ( AVAILABLE ?auto_14651 ) ( SURFACE-AT ?auto_14643 ?auto_14653 ) ( ON ?auto_14643 ?auto_14656 ) ( CLEAR ?auto_14643 ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14656 ) ) ( not ( = ?auto_14643 ?auto_14656 ) ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( SURFACE-AT ?auto_14641 ?auto_14649 ) ( CLEAR ?auto_14641 ) ( IS-CRATE ?auto_14642 ) ( AVAILABLE ?auto_14650 ) ( not ( = ?auto_14654 ?auto_14649 ) ) ( HOIST-AT ?auto_14652 ?auto_14654 ) ( AVAILABLE ?auto_14652 ) ( SURFACE-AT ?auto_14642 ?auto_14654 ) ( ON ?auto_14642 ?auto_14655 ) ( CLEAR ?auto_14642 ) ( TRUCK-AT ?auto_14648 ?auto_14649 ) ( not ( = ?auto_14641 ?auto_14642 ) ) ( not ( = ?auto_14641 ?auto_14655 ) ) ( not ( = ?auto_14642 ?auto_14655 ) ) ( not ( = ?auto_14650 ?auto_14652 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( not ( = ?auto_14641 ?auto_14656 ) ) ( not ( = ?auto_14643 ?auto_14655 ) ) ( not ( = ?auto_14653 ?auto_14654 ) ) ( not ( = ?auto_14651 ?auto_14652 ) ) ( not ( = ?auto_14656 ?auto_14655 ) ) ( not ( = ?auto_14641 ?auto_14644 ) ) ( not ( = ?auto_14641 ?auto_14645 ) ) ( not ( = ?auto_14642 ?auto_14644 ) ) ( not ( = ?auto_14642 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14656 ) ) ( not ( = ?auto_14644 ?auto_14655 ) ) ( not ( = ?auto_14647 ?auto_14653 ) ) ( not ( = ?auto_14647 ?auto_14654 ) ) ( not ( = ?auto_14646 ?auto_14651 ) ) ( not ( = ?auto_14646 ?auto_14652 ) ) ( not ( = ?auto_14645 ?auto_14656 ) ) ( not ( = ?auto_14645 ?auto_14655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14641 ?auto_14642 ?auto_14643 )
      ( MAKE-1CRATE ?auto_14643 ?auto_14644 )
      ( MAKE-3CRATE-VERIFY ?auto_14641 ?auto_14642 ?auto_14643 ?auto_14644 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14672 - SURFACE
      ?auto_14673 - SURFACE
      ?auto_14674 - SURFACE
      ?auto_14675 - SURFACE
      ?auto_14676 - SURFACE
    )
    :vars
    (
      ?auto_14682 - HOIST
      ?auto_14681 - PLACE
      ?auto_14680 - PLACE
      ?auto_14678 - HOIST
      ?auto_14679 - SURFACE
      ?auto_14691 - PLACE
      ?auto_14685 - HOIST
      ?auto_14689 - SURFACE
      ?auto_14683 - PLACE
      ?auto_14687 - HOIST
      ?auto_14688 - SURFACE
      ?auto_14684 - PLACE
      ?auto_14690 - HOIST
      ?auto_14686 - SURFACE
      ?auto_14677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14682 ?auto_14681 ) ( IS-CRATE ?auto_14676 ) ( not ( = ?auto_14680 ?auto_14681 ) ) ( HOIST-AT ?auto_14678 ?auto_14680 ) ( AVAILABLE ?auto_14678 ) ( SURFACE-AT ?auto_14676 ?auto_14680 ) ( ON ?auto_14676 ?auto_14679 ) ( CLEAR ?auto_14676 ) ( not ( = ?auto_14675 ?auto_14676 ) ) ( not ( = ?auto_14675 ?auto_14679 ) ) ( not ( = ?auto_14676 ?auto_14679 ) ) ( not ( = ?auto_14682 ?auto_14678 ) ) ( IS-CRATE ?auto_14675 ) ( not ( = ?auto_14691 ?auto_14681 ) ) ( HOIST-AT ?auto_14685 ?auto_14691 ) ( AVAILABLE ?auto_14685 ) ( SURFACE-AT ?auto_14675 ?auto_14691 ) ( ON ?auto_14675 ?auto_14689 ) ( CLEAR ?auto_14675 ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14674 ?auto_14689 ) ) ( not ( = ?auto_14675 ?auto_14689 ) ) ( not ( = ?auto_14682 ?auto_14685 ) ) ( IS-CRATE ?auto_14674 ) ( not ( = ?auto_14683 ?auto_14681 ) ) ( HOIST-AT ?auto_14687 ?auto_14683 ) ( AVAILABLE ?auto_14687 ) ( SURFACE-AT ?auto_14674 ?auto_14683 ) ( ON ?auto_14674 ?auto_14688 ) ( CLEAR ?auto_14674 ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14688 ) ) ( not ( = ?auto_14674 ?auto_14688 ) ) ( not ( = ?auto_14682 ?auto_14687 ) ) ( SURFACE-AT ?auto_14672 ?auto_14681 ) ( CLEAR ?auto_14672 ) ( IS-CRATE ?auto_14673 ) ( AVAILABLE ?auto_14682 ) ( not ( = ?auto_14684 ?auto_14681 ) ) ( HOIST-AT ?auto_14690 ?auto_14684 ) ( AVAILABLE ?auto_14690 ) ( SURFACE-AT ?auto_14673 ?auto_14684 ) ( ON ?auto_14673 ?auto_14686 ) ( CLEAR ?auto_14673 ) ( TRUCK-AT ?auto_14677 ?auto_14681 ) ( not ( = ?auto_14672 ?auto_14673 ) ) ( not ( = ?auto_14672 ?auto_14686 ) ) ( not ( = ?auto_14673 ?auto_14686 ) ) ( not ( = ?auto_14682 ?auto_14690 ) ) ( not ( = ?auto_14672 ?auto_14674 ) ) ( not ( = ?auto_14672 ?auto_14688 ) ) ( not ( = ?auto_14674 ?auto_14686 ) ) ( not ( = ?auto_14683 ?auto_14684 ) ) ( not ( = ?auto_14687 ?auto_14690 ) ) ( not ( = ?auto_14688 ?auto_14686 ) ) ( not ( = ?auto_14672 ?auto_14675 ) ) ( not ( = ?auto_14672 ?auto_14689 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14689 ) ) ( not ( = ?auto_14675 ?auto_14688 ) ) ( not ( = ?auto_14675 ?auto_14686 ) ) ( not ( = ?auto_14691 ?auto_14683 ) ) ( not ( = ?auto_14691 ?auto_14684 ) ) ( not ( = ?auto_14685 ?auto_14687 ) ) ( not ( = ?auto_14685 ?auto_14690 ) ) ( not ( = ?auto_14689 ?auto_14688 ) ) ( not ( = ?auto_14689 ?auto_14686 ) ) ( not ( = ?auto_14672 ?auto_14676 ) ) ( not ( = ?auto_14672 ?auto_14679 ) ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( not ( = ?auto_14673 ?auto_14679 ) ) ( not ( = ?auto_14674 ?auto_14676 ) ) ( not ( = ?auto_14674 ?auto_14679 ) ) ( not ( = ?auto_14676 ?auto_14689 ) ) ( not ( = ?auto_14676 ?auto_14688 ) ) ( not ( = ?auto_14676 ?auto_14686 ) ) ( not ( = ?auto_14680 ?auto_14691 ) ) ( not ( = ?auto_14680 ?auto_14683 ) ) ( not ( = ?auto_14680 ?auto_14684 ) ) ( not ( = ?auto_14678 ?auto_14685 ) ) ( not ( = ?auto_14678 ?auto_14687 ) ) ( not ( = ?auto_14678 ?auto_14690 ) ) ( not ( = ?auto_14679 ?auto_14689 ) ) ( not ( = ?auto_14679 ?auto_14688 ) ) ( not ( = ?auto_14679 ?auto_14686 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14672 ?auto_14673 ?auto_14674 ?auto_14675 )
      ( MAKE-1CRATE ?auto_14675 ?auto_14676 )
      ( MAKE-4CRATE-VERIFY ?auto_14672 ?auto_14673 ?auto_14674 ?auto_14675 ?auto_14676 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14708 - SURFACE
      ?auto_14709 - SURFACE
      ?auto_14710 - SURFACE
      ?auto_14711 - SURFACE
      ?auto_14712 - SURFACE
      ?auto_14713 - SURFACE
    )
    :vars
    (
      ?auto_14714 - HOIST
      ?auto_14716 - PLACE
      ?auto_14715 - PLACE
      ?auto_14718 - HOIST
      ?auto_14719 - SURFACE
      ?auto_14726 - PLACE
      ?auto_14722 - HOIST
      ?auto_14725 - SURFACE
      ?auto_14724 - PLACE
      ?auto_14723 - HOIST
      ?auto_14727 - SURFACE
      ?auto_14728 - PLACE
      ?auto_14729 - HOIST
      ?auto_14721 - SURFACE
      ?auto_14720 - SURFACE
      ?auto_14717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14714 ?auto_14716 ) ( IS-CRATE ?auto_14713 ) ( not ( = ?auto_14715 ?auto_14716 ) ) ( HOIST-AT ?auto_14718 ?auto_14715 ) ( SURFACE-AT ?auto_14713 ?auto_14715 ) ( ON ?auto_14713 ?auto_14719 ) ( CLEAR ?auto_14713 ) ( not ( = ?auto_14712 ?auto_14713 ) ) ( not ( = ?auto_14712 ?auto_14719 ) ) ( not ( = ?auto_14713 ?auto_14719 ) ) ( not ( = ?auto_14714 ?auto_14718 ) ) ( IS-CRATE ?auto_14712 ) ( not ( = ?auto_14726 ?auto_14716 ) ) ( HOIST-AT ?auto_14722 ?auto_14726 ) ( AVAILABLE ?auto_14722 ) ( SURFACE-AT ?auto_14712 ?auto_14726 ) ( ON ?auto_14712 ?auto_14725 ) ( CLEAR ?auto_14712 ) ( not ( = ?auto_14711 ?auto_14712 ) ) ( not ( = ?auto_14711 ?auto_14725 ) ) ( not ( = ?auto_14712 ?auto_14725 ) ) ( not ( = ?auto_14714 ?auto_14722 ) ) ( IS-CRATE ?auto_14711 ) ( not ( = ?auto_14724 ?auto_14716 ) ) ( HOIST-AT ?auto_14723 ?auto_14724 ) ( AVAILABLE ?auto_14723 ) ( SURFACE-AT ?auto_14711 ?auto_14724 ) ( ON ?auto_14711 ?auto_14727 ) ( CLEAR ?auto_14711 ) ( not ( = ?auto_14710 ?auto_14711 ) ) ( not ( = ?auto_14710 ?auto_14727 ) ) ( not ( = ?auto_14711 ?auto_14727 ) ) ( not ( = ?auto_14714 ?auto_14723 ) ) ( IS-CRATE ?auto_14710 ) ( not ( = ?auto_14728 ?auto_14716 ) ) ( HOIST-AT ?auto_14729 ?auto_14728 ) ( AVAILABLE ?auto_14729 ) ( SURFACE-AT ?auto_14710 ?auto_14728 ) ( ON ?auto_14710 ?auto_14721 ) ( CLEAR ?auto_14710 ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( not ( = ?auto_14709 ?auto_14721 ) ) ( not ( = ?auto_14710 ?auto_14721 ) ) ( not ( = ?auto_14714 ?auto_14729 ) ) ( SURFACE-AT ?auto_14708 ?auto_14716 ) ( CLEAR ?auto_14708 ) ( IS-CRATE ?auto_14709 ) ( AVAILABLE ?auto_14714 ) ( AVAILABLE ?auto_14718 ) ( SURFACE-AT ?auto_14709 ?auto_14715 ) ( ON ?auto_14709 ?auto_14720 ) ( CLEAR ?auto_14709 ) ( TRUCK-AT ?auto_14717 ?auto_14716 ) ( not ( = ?auto_14708 ?auto_14709 ) ) ( not ( = ?auto_14708 ?auto_14720 ) ) ( not ( = ?auto_14709 ?auto_14720 ) ) ( not ( = ?auto_14708 ?auto_14710 ) ) ( not ( = ?auto_14708 ?auto_14721 ) ) ( not ( = ?auto_14710 ?auto_14720 ) ) ( not ( = ?auto_14728 ?auto_14715 ) ) ( not ( = ?auto_14729 ?auto_14718 ) ) ( not ( = ?auto_14721 ?auto_14720 ) ) ( not ( = ?auto_14708 ?auto_14711 ) ) ( not ( = ?auto_14708 ?auto_14727 ) ) ( not ( = ?auto_14709 ?auto_14711 ) ) ( not ( = ?auto_14709 ?auto_14727 ) ) ( not ( = ?auto_14711 ?auto_14721 ) ) ( not ( = ?auto_14711 ?auto_14720 ) ) ( not ( = ?auto_14724 ?auto_14728 ) ) ( not ( = ?auto_14724 ?auto_14715 ) ) ( not ( = ?auto_14723 ?auto_14729 ) ) ( not ( = ?auto_14723 ?auto_14718 ) ) ( not ( = ?auto_14727 ?auto_14721 ) ) ( not ( = ?auto_14727 ?auto_14720 ) ) ( not ( = ?auto_14708 ?auto_14712 ) ) ( not ( = ?auto_14708 ?auto_14725 ) ) ( not ( = ?auto_14709 ?auto_14712 ) ) ( not ( = ?auto_14709 ?auto_14725 ) ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14710 ?auto_14725 ) ) ( not ( = ?auto_14712 ?auto_14727 ) ) ( not ( = ?auto_14712 ?auto_14721 ) ) ( not ( = ?auto_14712 ?auto_14720 ) ) ( not ( = ?auto_14726 ?auto_14724 ) ) ( not ( = ?auto_14726 ?auto_14728 ) ) ( not ( = ?auto_14726 ?auto_14715 ) ) ( not ( = ?auto_14722 ?auto_14723 ) ) ( not ( = ?auto_14722 ?auto_14729 ) ) ( not ( = ?auto_14722 ?auto_14718 ) ) ( not ( = ?auto_14725 ?auto_14727 ) ) ( not ( = ?auto_14725 ?auto_14721 ) ) ( not ( = ?auto_14725 ?auto_14720 ) ) ( not ( = ?auto_14708 ?auto_14713 ) ) ( not ( = ?auto_14708 ?auto_14719 ) ) ( not ( = ?auto_14709 ?auto_14713 ) ) ( not ( = ?auto_14709 ?auto_14719 ) ) ( not ( = ?auto_14710 ?auto_14713 ) ) ( not ( = ?auto_14710 ?auto_14719 ) ) ( not ( = ?auto_14711 ?auto_14713 ) ) ( not ( = ?auto_14711 ?auto_14719 ) ) ( not ( = ?auto_14713 ?auto_14725 ) ) ( not ( = ?auto_14713 ?auto_14727 ) ) ( not ( = ?auto_14713 ?auto_14721 ) ) ( not ( = ?auto_14713 ?auto_14720 ) ) ( not ( = ?auto_14719 ?auto_14725 ) ) ( not ( = ?auto_14719 ?auto_14727 ) ) ( not ( = ?auto_14719 ?auto_14721 ) ) ( not ( = ?auto_14719 ?auto_14720 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14708 ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14712 )
      ( MAKE-1CRATE ?auto_14712 ?auto_14713 )
      ( MAKE-5CRATE-VERIFY ?auto_14708 ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14712 ?auto_14713 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14747 - SURFACE
      ?auto_14748 - SURFACE
      ?auto_14749 - SURFACE
      ?auto_14750 - SURFACE
      ?auto_14751 - SURFACE
      ?auto_14752 - SURFACE
      ?auto_14753 - SURFACE
    )
    :vars
    (
      ?auto_14759 - HOIST
      ?auto_14755 - PLACE
      ?auto_14756 - PLACE
      ?auto_14754 - HOIST
      ?auto_14757 - SURFACE
      ?auto_14768 - PLACE
      ?auto_14770 - HOIST
      ?auto_14760 - SURFACE
      ?auto_14766 - PLACE
      ?auto_14761 - HOIST
      ?auto_14764 - SURFACE
      ?auto_14765 - PLACE
      ?auto_14763 - HOIST
      ?auto_14767 - SURFACE
      ?auto_14769 - PLACE
      ?auto_14762 - HOIST
      ?auto_14771 - SURFACE
      ?auto_14772 - SURFACE
      ?auto_14758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14759 ?auto_14755 ) ( IS-CRATE ?auto_14753 ) ( not ( = ?auto_14756 ?auto_14755 ) ) ( HOIST-AT ?auto_14754 ?auto_14756 ) ( AVAILABLE ?auto_14754 ) ( SURFACE-AT ?auto_14753 ?auto_14756 ) ( ON ?auto_14753 ?auto_14757 ) ( CLEAR ?auto_14753 ) ( not ( = ?auto_14752 ?auto_14753 ) ) ( not ( = ?auto_14752 ?auto_14757 ) ) ( not ( = ?auto_14753 ?auto_14757 ) ) ( not ( = ?auto_14759 ?auto_14754 ) ) ( IS-CRATE ?auto_14752 ) ( not ( = ?auto_14768 ?auto_14755 ) ) ( HOIST-AT ?auto_14770 ?auto_14768 ) ( SURFACE-AT ?auto_14752 ?auto_14768 ) ( ON ?auto_14752 ?auto_14760 ) ( CLEAR ?auto_14752 ) ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14751 ?auto_14760 ) ) ( not ( = ?auto_14752 ?auto_14760 ) ) ( not ( = ?auto_14759 ?auto_14770 ) ) ( IS-CRATE ?auto_14751 ) ( not ( = ?auto_14766 ?auto_14755 ) ) ( HOIST-AT ?auto_14761 ?auto_14766 ) ( AVAILABLE ?auto_14761 ) ( SURFACE-AT ?auto_14751 ?auto_14766 ) ( ON ?auto_14751 ?auto_14764 ) ( CLEAR ?auto_14751 ) ( not ( = ?auto_14750 ?auto_14751 ) ) ( not ( = ?auto_14750 ?auto_14764 ) ) ( not ( = ?auto_14751 ?auto_14764 ) ) ( not ( = ?auto_14759 ?auto_14761 ) ) ( IS-CRATE ?auto_14750 ) ( not ( = ?auto_14765 ?auto_14755 ) ) ( HOIST-AT ?auto_14763 ?auto_14765 ) ( AVAILABLE ?auto_14763 ) ( SURFACE-AT ?auto_14750 ?auto_14765 ) ( ON ?auto_14750 ?auto_14767 ) ( CLEAR ?auto_14750 ) ( not ( = ?auto_14749 ?auto_14750 ) ) ( not ( = ?auto_14749 ?auto_14767 ) ) ( not ( = ?auto_14750 ?auto_14767 ) ) ( not ( = ?auto_14759 ?auto_14763 ) ) ( IS-CRATE ?auto_14749 ) ( not ( = ?auto_14769 ?auto_14755 ) ) ( HOIST-AT ?auto_14762 ?auto_14769 ) ( AVAILABLE ?auto_14762 ) ( SURFACE-AT ?auto_14749 ?auto_14769 ) ( ON ?auto_14749 ?auto_14771 ) ( CLEAR ?auto_14749 ) ( not ( = ?auto_14748 ?auto_14749 ) ) ( not ( = ?auto_14748 ?auto_14771 ) ) ( not ( = ?auto_14749 ?auto_14771 ) ) ( not ( = ?auto_14759 ?auto_14762 ) ) ( SURFACE-AT ?auto_14747 ?auto_14755 ) ( CLEAR ?auto_14747 ) ( IS-CRATE ?auto_14748 ) ( AVAILABLE ?auto_14759 ) ( AVAILABLE ?auto_14770 ) ( SURFACE-AT ?auto_14748 ?auto_14768 ) ( ON ?auto_14748 ?auto_14772 ) ( CLEAR ?auto_14748 ) ( TRUCK-AT ?auto_14758 ?auto_14755 ) ( not ( = ?auto_14747 ?auto_14748 ) ) ( not ( = ?auto_14747 ?auto_14772 ) ) ( not ( = ?auto_14748 ?auto_14772 ) ) ( not ( = ?auto_14747 ?auto_14749 ) ) ( not ( = ?auto_14747 ?auto_14771 ) ) ( not ( = ?auto_14749 ?auto_14772 ) ) ( not ( = ?auto_14769 ?auto_14768 ) ) ( not ( = ?auto_14762 ?auto_14770 ) ) ( not ( = ?auto_14771 ?auto_14772 ) ) ( not ( = ?auto_14747 ?auto_14750 ) ) ( not ( = ?auto_14747 ?auto_14767 ) ) ( not ( = ?auto_14748 ?auto_14750 ) ) ( not ( = ?auto_14748 ?auto_14767 ) ) ( not ( = ?auto_14750 ?auto_14771 ) ) ( not ( = ?auto_14750 ?auto_14772 ) ) ( not ( = ?auto_14765 ?auto_14769 ) ) ( not ( = ?auto_14765 ?auto_14768 ) ) ( not ( = ?auto_14763 ?auto_14762 ) ) ( not ( = ?auto_14763 ?auto_14770 ) ) ( not ( = ?auto_14767 ?auto_14771 ) ) ( not ( = ?auto_14767 ?auto_14772 ) ) ( not ( = ?auto_14747 ?auto_14751 ) ) ( not ( = ?auto_14747 ?auto_14764 ) ) ( not ( = ?auto_14748 ?auto_14751 ) ) ( not ( = ?auto_14748 ?auto_14764 ) ) ( not ( = ?auto_14749 ?auto_14751 ) ) ( not ( = ?auto_14749 ?auto_14764 ) ) ( not ( = ?auto_14751 ?auto_14767 ) ) ( not ( = ?auto_14751 ?auto_14771 ) ) ( not ( = ?auto_14751 ?auto_14772 ) ) ( not ( = ?auto_14766 ?auto_14765 ) ) ( not ( = ?auto_14766 ?auto_14769 ) ) ( not ( = ?auto_14766 ?auto_14768 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14770 ) ) ( not ( = ?auto_14764 ?auto_14767 ) ) ( not ( = ?auto_14764 ?auto_14771 ) ) ( not ( = ?auto_14764 ?auto_14772 ) ) ( not ( = ?auto_14747 ?auto_14752 ) ) ( not ( = ?auto_14747 ?auto_14760 ) ) ( not ( = ?auto_14748 ?auto_14752 ) ) ( not ( = ?auto_14748 ?auto_14760 ) ) ( not ( = ?auto_14749 ?auto_14752 ) ) ( not ( = ?auto_14749 ?auto_14760 ) ) ( not ( = ?auto_14750 ?auto_14752 ) ) ( not ( = ?auto_14750 ?auto_14760 ) ) ( not ( = ?auto_14752 ?auto_14764 ) ) ( not ( = ?auto_14752 ?auto_14767 ) ) ( not ( = ?auto_14752 ?auto_14771 ) ) ( not ( = ?auto_14752 ?auto_14772 ) ) ( not ( = ?auto_14760 ?auto_14764 ) ) ( not ( = ?auto_14760 ?auto_14767 ) ) ( not ( = ?auto_14760 ?auto_14771 ) ) ( not ( = ?auto_14760 ?auto_14772 ) ) ( not ( = ?auto_14747 ?auto_14753 ) ) ( not ( = ?auto_14747 ?auto_14757 ) ) ( not ( = ?auto_14748 ?auto_14753 ) ) ( not ( = ?auto_14748 ?auto_14757 ) ) ( not ( = ?auto_14749 ?auto_14753 ) ) ( not ( = ?auto_14749 ?auto_14757 ) ) ( not ( = ?auto_14750 ?auto_14753 ) ) ( not ( = ?auto_14750 ?auto_14757 ) ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14751 ?auto_14757 ) ) ( not ( = ?auto_14753 ?auto_14760 ) ) ( not ( = ?auto_14753 ?auto_14764 ) ) ( not ( = ?auto_14753 ?auto_14767 ) ) ( not ( = ?auto_14753 ?auto_14771 ) ) ( not ( = ?auto_14753 ?auto_14772 ) ) ( not ( = ?auto_14756 ?auto_14768 ) ) ( not ( = ?auto_14756 ?auto_14766 ) ) ( not ( = ?auto_14756 ?auto_14765 ) ) ( not ( = ?auto_14756 ?auto_14769 ) ) ( not ( = ?auto_14754 ?auto_14770 ) ) ( not ( = ?auto_14754 ?auto_14761 ) ) ( not ( = ?auto_14754 ?auto_14763 ) ) ( not ( = ?auto_14754 ?auto_14762 ) ) ( not ( = ?auto_14757 ?auto_14760 ) ) ( not ( = ?auto_14757 ?auto_14764 ) ) ( not ( = ?auto_14757 ?auto_14767 ) ) ( not ( = ?auto_14757 ?auto_14771 ) ) ( not ( = ?auto_14757 ?auto_14772 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14747 ?auto_14748 ?auto_14749 ?auto_14750 ?auto_14751 ?auto_14752 )
      ( MAKE-1CRATE ?auto_14752 ?auto_14753 )
      ( MAKE-6CRATE-VERIFY ?auto_14747 ?auto_14748 ?auto_14749 ?auto_14750 ?auto_14751 ?auto_14752 ?auto_14753 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14791 - SURFACE
      ?auto_14792 - SURFACE
      ?auto_14793 - SURFACE
      ?auto_14794 - SURFACE
      ?auto_14795 - SURFACE
      ?auto_14796 - SURFACE
      ?auto_14797 - SURFACE
      ?auto_14798 - SURFACE
    )
    :vars
    (
      ?auto_14802 - HOIST
      ?auto_14804 - PLACE
      ?auto_14800 - PLACE
      ?auto_14801 - HOIST
      ?auto_14799 - SURFACE
      ?auto_14808 - PLACE
      ?auto_14816 - HOIST
      ?auto_14809 - SURFACE
      ?auto_14805 - PLACE
      ?auto_14806 - HOIST
      ?auto_14818 - SURFACE
      ?auto_14813 - PLACE
      ?auto_14810 - HOIST
      ?auto_14807 - SURFACE
      ?auto_14817 - SURFACE
      ?auto_14811 - PLACE
      ?auto_14812 - HOIST
      ?auto_14814 - SURFACE
      ?auto_14815 - SURFACE
      ?auto_14803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14802 ?auto_14804 ) ( IS-CRATE ?auto_14798 ) ( not ( = ?auto_14800 ?auto_14804 ) ) ( HOIST-AT ?auto_14801 ?auto_14800 ) ( SURFACE-AT ?auto_14798 ?auto_14800 ) ( ON ?auto_14798 ?auto_14799 ) ( CLEAR ?auto_14798 ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( not ( = ?auto_14802 ?auto_14801 ) ) ( IS-CRATE ?auto_14797 ) ( not ( = ?auto_14808 ?auto_14804 ) ) ( HOIST-AT ?auto_14816 ?auto_14808 ) ( AVAILABLE ?auto_14816 ) ( SURFACE-AT ?auto_14797 ?auto_14808 ) ( ON ?auto_14797 ?auto_14809 ) ( CLEAR ?auto_14797 ) ( not ( = ?auto_14796 ?auto_14797 ) ) ( not ( = ?auto_14796 ?auto_14809 ) ) ( not ( = ?auto_14797 ?auto_14809 ) ) ( not ( = ?auto_14802 ?auto_14816 ) ) ( IS-CRATE ?auto_14796 ) ( not ( = ?auto_14805 ?auto_14804 ) ) ( HOIST-AT ?auto_14806 ?auto_14805 ) ( SURFACE-AT ?auto_14796 ?auto_14805 ) ( ON ?auto_14796 ?auto_14818 ) ( CLEAR ?auto_14796 ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14818 ) ) ( not ( = ?auto_14796 ?auto_14818 ) ) ( not ( = ?auto_14802 ?auto_14806 ) ) ( IS-CRATE ?auto_14795 ) ( not ( = ?auto_14813 ?auto_14804 ) ) ( HOIST-AT ?auto_14810 ?auto_14813 ) ( AVAILABLE ?auto_14810 ) ( SURFACE-AT ?auto_14795 ?auto_14813 ) ( ON ?auto_14795 ?auto_14807 ) ( CLEAR ?auto_14795 ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14807 ) ) ( not ( = ?auto_14795 ?auto_14807 ) ) ( not ( = ?auto_14802 ?auto_14810 ) ) ( IS-CRATE ?auto_14794 ) ( AVAILABLE ?auto_14801 ) ( SURFACE-AT ?auto_14794 ?auto_14800 ) ( ON ?auto_14794 ?auto_14817 ) ( CLEAR ?auto_14794 ) ( not ( = ?auto_14793 ?auto_14794 ) ) ( not ( = ?auto_14793 ?auto_14817 ) ) ( not ( = ?auto_14794 ?auto_14817 ) ) ( IS-CRATE ?auto_14793 ) ( not ( = ?auto_14811 ?auto_14804 ) ) ( HOIST-AT ?auto_14812 ?auto_14811 ) ( AVAILABLE ?auto_14812 ) ( SURFACE-AT ?auto_14793 ?auto_14811 ) ( ON ?auto_14793 ?auto_14814 ) ( CLEAR ?auto_14793 ) ( not ( = ?auto_14792 ?auto_14793 ) ) ( not ( = ?auto_14792 ?auto_14814 ) ) ( not ( = ?auto_14793 ?auto_14814 ) ) ( not ( = ?auto_14802 ?auto_14812 ) ) ( SURFACE-AT ?auto_14791 ?auto_14804 ) ( CLEAR ?auto_14791 ) ( IS-CRATE ?auto_14792 ) ( AVAILABLE ?auto_14802 ) ( AVAILABLE ?auto_14806 ) ( SURFACE-AT ?auto_14792 ?auto_14805 ) ( ON ?auto_14792 ?auto_14815 ) ( CLEAR ?auto_14792 ) ( TRUCK-AT ?auto_14803 ?auto_14804 ) ( not ( = ?auto_14791 ?auto_14792 ) ) ( not ( = ?auto_14791 ?auto_14815 ) ) ( not ( = ?auto_14792 ?auto_14815 ) ) ( not ( = ?auto_14791 ?auto_14793 ) ) ( not ( = ?auto_14791 ?auto_14814 ) ) ( not ( = ?auto_14793 ?auto_14815 ) ) ( not ( = ?auto_14811 ?auto_14805 ) ) ( not ( = ?auto_14812 ?auto_14806 ) ) ( not ( = ?auto_14814 ?auto_14815 ) ) ( not ( = ?auto_14791 ?auto_14794 ) ) ( not ( = ?auto_14791 ?auto_14817 ) ) ( not ( = ?auto_14792 ?auto_14794 ) ) ( not ( = ?auto_14792 ?auto_14817 ) ) ( not ( = ?auto_14794 ?auto_14814 ) ) ( not ( = ?auto_14794 ?auto_14815 ) ) ( not ( = ?auto_14800 ?auto_14811 ) ) ( not ( = ?auto_14800 ?auto_14805 ) ) ( not ( = ?auto_14801 ?auto_14812 ) ) ( not ( = ?auto_14801 ?auto_14806 ) ) ( not ( = ?auto_14817 ?auto_14814 ) ) ( not ( = ?auto_14817 ?auto_14815 ) ) ( not ( = ?auto_14791 ?auto_14795 ) ) ( not ( = ?auto_14791 ?auto_14807 ) ) ( not ( = ?auto_14792 ?auto_14795 ) ) ( not ( = ?auto_14792 ?auto_14807 ) ) ( not ( = ?auto_14793 ?auto_14795 ) ) ( not ( = ?auto_14793 ?auto_14807 ) ) ( not ( = ?auto_14795 ?auto_14817 ) ) ( not ( = ?auto_14795 ?auto_14814 ) ) ( not ( = ?auto_14795 ?auto_14815 ) ) ( not ( = ?auto_14813 ?auto_14800 ) ) ( not ( = ?auto_14813 ?auto_14811 ) ) ( not ( = ?auto_14813 ?auto_14805 ) ) ( not ( = ?auto_14810 ?auto_14801 ) ) ( not ( = ?auto_14810 ?auto_14812 ) ) ( not ( = ?auto_14810 ?auto_14806 ) ) ( not ( = ?auto_14807 ?auto_14817 ) ) ( not ( = ?auto_14807 ?auto_14814 ) ) ( not ( = ?auto_14807 ?auto_14815 ) ) ( not ( = ?auto_14791 ?auto_14796 ) ) ( not ( = ?auto_14791 ?auto_14818 ) ) ( not ( = ?auto_14792 ?auto_14796 ) ) ( not ( = ?auto_14792 ?auto_14818 ) ) ( not ( = ?auto_14793 ?auto_14796 ) ) ( not ( = ?auto_14793 ?auto_14818 ) ) ( not ( = ?auto_14794 ?auto_14796 ) ) ( not ( = ?auto_14794 ?auto_14818 ) ) ( not ( = ?auto_14796 ?auto_14807 ) ) ( not ( = ?auto_14796 ?auto_14817 ) ) ( not ( = ?auto_14796 ?auto_14814 ) ) ( not ( = ?auto_14796 ?auto_14815 ) ) ( not ( = ?auto_14818 ?auto_14807 ) ) ( not ( = ?auto_14818 ?auto_14817 ) ) ( not ( = ?auto_14818 ?auto_14814 ) ) ( not ( = ?auto_14818 ?auto_14815 ) ) ( not ( = ?auto_14791 ?auto_14797 ) ) ( not ( = ?auto_14791 ?auto_14809 ) ) ( not ( = ?auto_14792 ?auto_14797 ) ) ( not ( = ?auto_14792 ?auto_14809 ) ) ( not ( = ?auto_14793 ?auto_14797 ) ) ( not ( = ?auto_14793 ?auto_14809 ) ) ( not ( = ?auto_14794 ?auto_14797 ) ) ( not ( = ?auto_14794 ?auto_14809 ) ) ( not ( = ?auto_14795 ?auto_14797 ) ) ( not ( = ?auto_14795 ?auto_14809 ) ) ( not ( = ?auto_14797 ?auto_14818 ) ) ( not ( = ?auto_14797 ?auto_14807 ) ) ( not ( = ?auto_14797 ?auto_14817 ) ) ( not ( = ?auto_14797 ?auto_14814 ) ) ( not ( = ?auto_14797 ?auto_14815 ) ) ( not ( = ?auto_14808 ?auto_14805 ) ) ( not ( = ?auto_14808 ?auto_14813 ) ) ( not ( = ?auto_14808 ?auto_14800 ) ) ( not ( = ?auto_14808 ?auto_14811 ) ) ( not ( = ?auto_14816 ?auto_14806 ) ) ( not ( = ?auto_14816 ?auto_14810 ) ) ( not ( = ?auto_14816 ?auto_14801 ) ) ( not ( = ?auto_14816 ?auto_14812 ) ) ( not ( = ?auto_14809 ?auto_14818 ) ) ( not ( = ?auto_14809 ?auto_14807 ) ) ( not ( = ?auto_14809 ?auto_14817 ) ) ( not ( = ?auto_14809 ?auto_14814 ) ) ( not ( = ?auto_14809 ?auto_14815 ) ) ( not ( = ?auto_14791 ?auto_14798 ) ) ( not ( = ?auto_14791 ?auto_14799 ) ) ( not ( = ?auto_14792 ?auto_14798 ) ) ( not ( = ?auto_14792 ?auto_14799 ) ) ( not ( = ?auto_14793 ?auto_14798 ) ) ( not ( = ?auto_14793 ?auto_14799 ) ) ( not ( = ?auto_14794 ?auto_14798 ) ) ( not ( = ?auto_14794 ?auto_14799 ) ) ( not ( = ?auto_14795 ?auto_14798 ) ) ( not ( = ?auto_14795 ?auto_14799 ) ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14809 ) ) ( not ( = ?auto_14798 ?auto_14818 ) ) ( not ( = ?auto_14798 ?auto_14807 ) ) ( not ( = ?auto_14798 ?auto_14817 ) ) ( not ( = ?auto_14798 ?auto_14814 ) ) ( not ( = ?auto_14798 ?auto_14815 ) ) ( not ( = ?auto_14799 ?auto_14809 ) ) ( not ( = ?auto_14799 ?auto_14818 ) ) ( not ( = ?auto_14799 ?auto_14807 ) ) ( not ( = ?auto_14799 ?auto_14817 ) ) ( not ( = ?auto_14799 ?auto_14814 ) ) ( not ( = ?auto_14799 ?auto_14815 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14791 ?auto_14792 ?auto_14793 ?auto_14794 ?auto_14795 ?auto_14796 ?auto_14797 )
      ( MAKE-1CRATE ?auto_14797 ?auto_14798 )
      ( MAKE-7CRATE-VERIFY ?auto_14791 ?auto_14792 ?auto_14793 ?auto_14794 ?auto_14795 ?auto_14796 ?auto_14797 ?auto_14798 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14838 - SURFACE
      ?auto_14839 - SURFACE
      ?auto_14840 - SURFACE
      ?auto_14841 - SURFACE
      ?auto_14842 - SURFACE
      ?auto_14843 - SURFACE
      ?auto_14844 - SURFACE
      ?auto_14845 - SURFACE
      ?auto_14846 - SURFACE
    )
    :vars
    (
      ?auto_14852 - HOIST
      ?auto_14849 - PLACE
      ?auto_14851 - PLACE
      ?auto_14848 - HOIST
      ?auto_14847 - SURFACE
      ?auto_14855 - PLACE
      ?auto_14856 - HOIST
      ?auto_14865 - SURFACE
      ?auto_14866 - PLACE
      ?auto_14864 - HOIST
      ?auto_14862 - SURFACE
      ?auto_14858 - PLACE
      ?auto_14860 - HOIST
      ?auto_14868 - SURFACE
      ?auto_14854 - PLACE
      ?auto_14859 - HOIST
      ?auto_14869 - SURFACE
      ?auto_14863 - SURFACE
      ?auto_14861 - PLACE
      ?auto_14857 - HOIST
      ?auto_14867 - SURFACE
      ?auto_14853 - SURFACE
      ?auto_14850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14852 ?auto_14849 ) ( IS-CRATE ?auto_14846 ) ( not ( = ?auto_14851 ?auto_14849 ) ) ( HOIST-AT ?auto_14848 ?auto_14851 ) ( AVAILABLE ?auto_14848 ) ( SURFACE-AT ?auto_14846 ?auto_14851 ) ( ON ?auto_14846 ?auto_14847 ) ( CLEAR ?auto_14846 ) ( not ( = ?auto_14845 ?auto_14846 ) ) ( not ( = ?auto_14845 ?auto_14847 ) ) ( not ( = ?auto_14846 ?auto_14847 ) ) ( not ( = ?auto_14852 ?auto_14848 ) ) ( IS-CRATE ?auto_14845 ) ( not ( = ?auto_14855 ?auto_14849 ) ) ( HOIST-AT ?auto_14856 ?auto_14855 ) ( SURFACE-AT ?auto_14845 ?auto_14855 ) ( ON ?auto_14845 ?auto_14865 ) ( CLEAR ?auto_14845 ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14865 ) ) ( not ( = ?auto_14845 ?auto_14865 ) ) ( not ( = ?auto_14852 ?auto_14856 ) ) ( IS-CRATE ?auto_14844 ) ( not ( = ?auto_14866 ?auto_14849 ) ) ( HOIST-AT ?auto_14864 ?auto_14866 ) ( AVAILABLE ?auto_14864 ) ( SURFACE-AT ?auto_14844 ?auto_14866 ) ( ON ?auto_14844 ?auto_14862 ) ( CLEAR ?auto_14844 ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14862 ) ) ( not ( = ?auto_14844 ?auto_14862 ) ) ( not ( = ?auto_14852 ?auto_14864 ) ) ( IS-CRATE ?auto_14843 ) ( not ( = ?auto_14858 ?auto_14849 ) ) ( HOIST-AT ?auto_14860 ?auto_14858 ) ( SURFACE-AT ?auto_14843 ?auto_14858 ) ( ON ?auto_14843 ?auto_14868 ) ( CLEAR ?auto_14843 ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14868 ) ) ( not ( = ?auto_14843 ?auto_14868 ) ) ( not ( = ?auto_14852 ?auto_14860 ) ) ( IS-CRATE ?auto_14842 ) ( not ( = ?auto_14854 ?auto_14849 ) ) ( HOIST-AT ?auto_14859 ?auto_14854 ) ( AVAILABLE ?auto_14859 ) ( SURFACE-AT ?auto_14842 ?auto_14854 ) ( ON ?auto_14842 ?auto_14869 ) ( CLEAR ?auto_14842 ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14841 ?auto_14869 ) ) ( not ( = ?auto_14842 ?auto_14869 ) ) ( not ( = ?auto_14852 ?auto_14859 ) ) ( IS-CRATE ?auto_14841 ) ( AVAILABLE ?auto_14856 ) ( SURFACE-AT ?auto_14841 ?auto_14855 ) ( ON ?auto_14841 ?auto_14863 ) ( CLEAR ?auto_14841 ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14863 ) ) ( not ( = ?auto_14841 ?auto_14863 ) ) ( IS-CRATE ?auto_14840 ) ( not ( = ?auto_14861 ?auto_14849 ) ) ( HOIST-AT ?auto_14857 ?auto_14861 ) ( AVAILABLE ?auto_14857 ) ( SURFACE-AT ?auto_14840 ?auto_14861 ) ( ON ?auto_14840 ?auto_14867 ) ( CLEAR ?auto_14840 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14867 ) ) ( not ( = ?auto_14840 ?auto_14867 ) ) ( not ( = ?auto_14852 ?auto_14857 ) ) ( SURFACE-AT ?auto_14838 ?auto_14849 ) ( CLEAR ?auto_14838 ) ( IS-CRATE ?auto_14839 ) ( AVAILABLE ?auto_14852 ) ( AVAILABLE ?auto_14860 ) ( SURFACE-AT ?auto_14839 ?auto_14858 ) ( ON ?auto_14839 ?auto_14853 ) ( CLEAR ?auto_14839 ) ( TRUCK-AT ?auto_14850 ?auto_14849 ) ( not ( = ?auto_14838 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14853 ) ) ( not ( = ?auto_14839 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14840 ) ) ( not ( = ?auto_14838 ?auto_14867 ) ) ( not ( = ?auto_14840 ?auto_14853 ) ) ( not ( = ?auto_14861 ?auto_14858 ) ) ( not ( = ?auto_14857 ?auto_14860 ) ) ( not ( = ?auto_14867 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14841 ) ) ( not ( = ?auto_14838 ?auto_14863 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14839 ?auto_14863 ) ) ( not ( = ?auto_14841 ?auto_14867 ) ) ( not ( = ?auto_14841 ?auto_14853 ) ) ( not ( = ?auto_14855 ?auto_14861 ) ) ( not ( = ?auto_14855 ?auto_14858 ) ) ( not ( = ?auto_14856 ?auto_14857 ) ) ( not ( = ?auto_14856 ?auto_14860 ) ) ( not ( = ?auto_14863 ?auto_14867 ) ) ( not ( = ?auto_14863 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14842 ) ) ( not ( = ?auto_14838 ?auto_14869 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14869 ) ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14869 ) ) ( not ( = ?auto_14842 ?auto_14863 ) ) ( not ( = ?auto_14842 ?auto_14867 ) ) ( not ( = ?auto_14842 ?auto_14853 ) ) ( not ( = ?auto_14854 ?auto_14855 ) ) ( not ( = ?auto_14854 ?auto_14861 ) ) ( not ( = ?auto_14854 ?auto_14858 ) ) ( not ( = ?auto_14859 ?auto_14856 ) ) ( not ( = ?auto_14859 ?auto_14857 ) ) ( not ( = ?auto_14859 ?auto_14860 ) ) ( not ( = ?auto_14869 ?auto_14863 ) ) ( not ( = ?auto_14869 ?auto_14867 ) ) ( not ( = ?auto_14869 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14843 ) ) ( not ( = ?auto_14838 ?auto_14868 ) ) ( not ( = ?auto_14839 ?auto_14843 ) ) ( not ( = ?auto_14839 ?auto_14868 ) ) ( not ( = ?auto_14840 ?auto_14843 ) ) ( not ( = ?auto_14840 ?auto_14868 ) ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( not ( = ?auto_14841 ?auto_14868 ) ) ( not ( = ?auto_14843 ?auto_14869 ) ) ( not ( = ?auto_14843 ?auto_14863 ) ) ( not ( = ?auto_14843 ?auto_14867 ) ) ( not ( = ?auto_14843 ?auto_14853 ) ) ( not ( = ?auto_14868 ?auto_14869 ) ) ( not ( = ?auto_14868 ?auto_14863 ) ) ( not ( = ?auto_14868 ?auto_14867 ) ) ( not ( = ?auto_14868 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14844 ) ) ( not ( = ?auto_14838 ?auto_14862 ) ) ( not ( = ?auto_14839 ?auto_14844 ) ) ( not ( = ?auto_14839 ?auto_14862 ) ) ( not ( = ?auto_14840 ?auto_14844 ) ) ( not ( = ?auto_14840 ?auto_14862 ) ) ( not ( = ?auto_14841 ?auto_14844 ) ) ( not ( = ?auto_14841 ?auto_14862 ) ) ( not ( = ?auto_14842 ?auto_14844 ) ) ( not ( = ?auto_14842 ?auto_14862 ) ) ( not ( = ?auto_14844 ?auto_14868 ) ) ( not ( = ?auto_14844 ?auto_14869 ) ) ( not ( = ?auto_14844 ?auto_14863 ) ) ( not ( = ?auto_14844 ?auto_14867 ) ) ( not ( = ?auto_14844 ?auto_14853 ) ) ( not ( = ?auto_14866 ?auto_14858 ) ) ( not ( = ?auto_14866 ?auto_14854 ) ) ( not ( = ?auto_14866 ?auto_14855 ) ) ( not ( = ?auto_14866 ?auto_14861 ) ) ( not ( = ?auto_14864 ?auto_14860 ) ) ( not ( = ?auto_14864 ?auto_14859 ) ) ( not ( = ?auto_14864 ?auto_14856 ) ) ( not ( = ?auto_14864 ?auto_14857 ) ) ( not ( = ?auto_14862 ?auto_14868 ) ) ( not ( = ?auto_14862 ?auto_14869 ) ) ( not ( = ?auto_14862 ?auto_14863 ) ) ( not ( = ?auto_14862 ?auto_14867 ) ) ( not ( = ?auto_14862 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14845 ) ) ( not ( = ?auto_14838 ?auto_14865 ) ) ( not ( = ?auto_14839 ?auto_14845 ) ) ( not ( = ?auto_14839 ?auto_14865 ) ) ( not ( = ?auto_14840 ?auto_14845 ) ) ( not ( = ?auto_14840 ?auto_14865 ) ) ( not ( = ?auto_14841 ?auto_14845 ) ) ( not ( = ?auto_14841 ?auto_14865 ) ) ( not ( = ?auto_14842 ?auto_14845 ) ) ( not ( = ?auto_14842 ?auto_14865 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14865 ) ) ( not ( = ?auto_14845 ?auto_14862 ) ) ( not ( = ?auto_14845 ?auto_14868 ) ) ( not ( = ?auto_14845 ?auto_14869 ) ) ( not ( = ?auto_14845 ?auto_14863 ) ) ( not ( = ?auto_14845 ?auto_14867 ) ) ( not ( = ?auto_14845 ?auto_14853 ) ) ( not ( = ?auto_14865 ?auto_14862 ) ) ( not ( = ?auto_14865 ?auto_14868 ) ) ( not ( = ?auto_14865 ?auto_14869 ) ) ( not ( = ?auto_14865 ?auto_14863 ) ) ( not ( = ?auto_14865 ?auto_14867 ) ) ( not ( = ?auto_14865 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14846 ) ) ( not ( = ?auto_14838 ?auto_14847 ) ) ( not ( = ?auto_14839 ?auto_14846 ) ) ( not ( = ?auto_14839 ?auto_14847 ) ) ( not ( = ?auto_14840 ?auto_14846 ) ) ( not ( = ?auto_14840 ?auto_14847 ) ) ( not ( = ?auto_14841 ?auto_14846 ) ) ( not ( = ?auto_14841 ?auto_14847 ) ) ( not ( = ?auto_14842 ?auto_14846 ) ) ( not ( = ?auto_14842 ?auto_14847 ) ) ( not ( = ?auto_14843 ?auto_14846 ) ) ( not ( = ?auto_14843 ?auto_14847 ) ) ( not ( = ?auto_14844 ?auto_14846 ) ) ( not ( = ?auto_14844 ?auto_14847 ) ) ( not ( = ?auto_14846 ?auto_14865 ) ) ( not ( = ?auto_14846 ?auto_14862 ) ) ( not ( = ?auto_14846 ?auto_14868 ) ) ( not ( = ?auto_14846 ?auto_14869 ) ) ( not ( = ?auto_14846 ?auto_14863 ) ) ( not ( = ?auto_14846 ?auto_14867 ) ) ( not ( = ?auto_14846 ?auto_14853 ) ) ( not ( = ?auto_14851 ?auto_14855 ) ) ( not ( = ?auto_14851 ?auto_14866 ) ) ( not ( = ?auto_14851 ?auto_14858 ) ) ( not ( = ?auto_14851 ?auto_14854 ) ) ( not ( = ?auto_14851 ?auto_14861 ) ) ( not ( = ?auto_14848 ?auto_14856 ) ) ( not ( = ?auto_14848 ?auto_14864 ) ) ( not ( = ?auto_14848 ?auto_14860 ) ) ( not ( = ?auto_14848 ?auto_14859 ) ) ( not ( = ?auto_14848 ?auto_14857 ) ) ( not ( = ?auto_14847 ?auto_14865 ) ) ( not ( = ?auto_14847 ?auto_14862 ) ) ( not ( = ?auto_14847 ?auto_14868 ) ) ( not ( = ?auto_14847 ?auto_14869 ) ) ( not ( = ?auto_14847 ?auto_14863 ) ) ( not ( = ?auto_14847 ?auto_14867 ) ) ( not ( = ?auto_14847 ?auto_14853 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14842 ?auto_14843 ?auto_14844 ?auto_14845 )
      ( MAKE-1CRATE ?auto_14845 ?auto_14846 )
      ( MAKE-8CRATE-VERIFY ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14842 ?auto_14843 ?auto_14844 ?auto_14845 ?auto_14846 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14890 - SURFACE
      ?auto_14891 - SURFACE
      ?auto_14892 - SURFACE
      ?auto_14893 - SURFACE
      ?auto_14894 - SURFACE
      ?auto_14895 - SURFACE
      ?auto_14896 - SURFACE
      ?auto_14897 - SURFACE
      ?auto_14898 - SURFACE
      ?auto_14899 - SURFACE
    )
    :vars
    (
      ?auto_14903 - HOIST
      ?auto_14902 - PLACE
      ?auto_14901 - PLACE
      ?auto_14905 - HOIST
      ?auto_14900 - SURFACE
      ?auto_14914 - PLACE
      ?auto_14916 - HOIST
      ?auto_14923 - SURFACE
      ?auto_14913 - PLACE
      ?auto_14921 - HOIST
      ?auto_14919 - SURFACE
      ?auto_14906 - PLACE
      ?auto_14917 - HOIST
      ?auto_14910 - SURFACE
      ?auto_14918 - SURFACE
      ?auto_14908 - PLACE
      ?auto_14912 - HOIST
      ?auto_14911 - SURFACE
      ?auto_14907 - SURFACE
      ?auto_14920 - PLACE
      ?auto_14915 - HOIST
      ?auto_14922 - SURFACE
      ?auto_14909 - SURFACE
      ?auto_14904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14903 ?auto_14902 ) ( IS-CRATE ?auto_14899 ) ( not ( = ?auto_14901 ?auto_14902 ) ) ( HOIST-AT ?auto_14905 ?auto_14901 ) ( SURFACE-AT ?auto_14899 ?auto_14901 ) ( ON ?auto_14899 ?auto_14900 ) ( CLEAR ?auto_14899 ) ( not ( = ?auto_14898 ?auto_14899 ) ) ( not ( = ?auto_14898 ?auto_14900 ) ) ( not ( = ?auto_14899 ?auto_14900 ) ) ( not ( = ?auto_14903 ?auto_14905 ) ) ( IS-CRATE ?auto_14898 ) ( not ( = ?auto_14914 ?auto_14902 ) ) ( HOIST-AT ?auto_14916 ?auto_14914 ) ( AVAILABLE ?auto_14916 ) ( SURFACE-AT ?auto_14898 ?auto_14914 ) ( ON ?auto_14898 ?auto_14923 ) ( CLEAR ?auto_14898 ) ( not ( = ?auto_14897 ?auto_14898 ) ) ( not ( = ?auto_14897 ?auto_14923 ) ) ( not ( = ?auto_14898 ?auto_14923 ) ) ( not ( = ?auto_14903 ?auto_14916 ) ) ( IS-CRATE ?auto_14897 ) ( not ( = ?auto_14913 ?auto_14902 ) ) ( HOIST-AT ?auto_14921 ?auto_14913 ) ( SURFACE-AT ?auto_14897 ?auto_14913 ) ( ON ?auto_14897 ?auto_14919 ) ( CLEAR ?auto_14897 ) ( not ( = ?auto_14896 ?auto_14897 ) ) ( not ( = ?auto_14896 ?auto_14919 ) ) ( not ( = ?auto_14897 ?auto_14919 ) ) ( not ( = ?auto_14903 ?auto_14921 ) ) ( IS-CRATE ?auto_14896 ) ( not ( = ?auto_14906 ?auto_14902 ) ) ( HOIST-AT ?auto_14917 ?auto_14906 ) ( AVAILABLE ?auto_14917 ) ( SURFACE-AT ?auto_14896 ?auto_14906 ) ( ON ?auto_14896 ?auto_14910 ) ( CLEAR ?auto_14896 ) ( not ( = ?auto_14895 ?auto_14896 ) ) ( not ( = ?auto_14895 ?auto_14910 ) ) ( not ( = ?auto_14896 ?auto_14910 ) ) ( not ( = ?auto_14903 ?auto_14917 ) ) ( IS-CRATE ?auto_14895 ) ( SURFACE-AT ?auto_14895 ?auto_14901 ) ( ON ?auto_14895 ?auto_14918 ) ( CLEAR ?auto_14895 ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( not ( = ?auto_14894 ?auto_14918 ) ) ( not ( = ?auto_14895 ?auto_14918 ) ) ( IS-CRATE ?auto_14894 ) ( not ( = ?auto_14908 ?auto_14902 ) ) ( HOIST-AT ?auto_14912 ?auto_14908 ) ( AVAILABLE ?auto_14912 ) ( SURFACE-AT ?auto_14894 ?auto_14908 ) ( ON ?auto_14894 ?auto_14911 ) ( CLEAR ?auto_14894 ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( not ( = ?auto_14893 ?auto_14911 ) ) ( not ( = ?auto_14894 ?auto_14911 ) ) ( not ( = ?auto_14903 ?auto_14912 ) ) ( IS-CRATE ?auto_14893 ) ( AVAILABLE ?auto_14921 ) ( SURFACE-AT ?auto_14893 ?auto_14913 ) ( ON ?auto_14893 ?auto_14907 ) ( CLEAR ?auto_14893 ) ( not ( = ?auto_14892 ?auto_14893 ) ) ( not ( = ?auto_14892 ?auto_14907 ) ) ( not ( = ?auto_14893 ?auto_14907 ) ) ( IS-CRATE ?auto_14892 ) ( not ( = ?auto_14920 ?auto_14902 ) ) ( HOIST-AT ?auto_14915 ?auto_14920 ) ( AVAILABLE ?auto_14915 ) ( SURFACE-AT ?auto_14892 ?auto_14920 ) ( ON ?auto_14892 ?auto_14922 ) ( CLEAR ?auto_14892 ) ( not ( = ?auto_14891 ?auto_14892 ) ) ( not ( = ?auto_14891 ?auto_14922 ) ) ( not ( = ?auto_14892 ?auto_14922 ) ) ( not ( = ?auto_14903 ?auto_14915 ) ) ( SURFACE-AT ?auto_14890 ?auto_14902 ) ( CLEAR ?auto_14890 ) ( IS-CRATE ?auto_14891 ) ( AVAILABLE ?auto_14903 ) ( AVAILABLE ?auto_14905 ) ( SURFACE-AT ?auto_14891 ?auto_14901 ) ( ON ?auto_14891 ?auto_14909 ) ( CLEAR ?auto_14891 ) ( TRUCK-AT ?auto_14904 ?auto_14902 ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14909 ) ) ( not ( = ?auto_14891 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14892 ) ) ( not ( = ?auto_14890 ?auto_14922 ) ) ( not ( = ?auto_14892 ?auto_14909 ) ) ( not ( = ?auto_14920 ?auto_14901 ) ) ( not ( = ?auto_14915 ?auto_14905 ) ) ( not ( = ?auto_14922 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14893 ) ) ( not ( = ?auto_14890 ?auto_14907 ) ) ( not ( = ?auto_14891 ?auto_14893 ) ) ( not ( = ?auto_14891 ?auto_14907 ) ) ( not ( = ?auto_14893 ?auto_14922 ) ) ( not ( = ?auto_14893 ?auto_14909 ) ) ( not ( = ?auto_14913 ?auto_14920 ) ) ( not ( = ?auto_14913 ?auto_14901 ) ) ( not ( = ?auto_14921 ?auto_14915 ) ) ( not ( = ?auto_14921 ?auto_14905 ) ) ( not ( = ?auto_14907 ?auto_14922 ) ) ( not ( = ?auto_14907 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14894 ) ) ( not ( = ?auto_14890 ?auto_14911 ) ) ( not ( = ?auto_14891 ?auto_14894 ) ) ( not ( = ?auto_14891 ?auto_14911 ) ) ( not ( = ?auto_14892 ?auto_14894 ) ) ( not ( = ?auto_14892 ?auto_14911 ) ) ( not ( = ?auto_14894 ?auto_14907 ) ) ( not ( = ?auto_14894 ?auto_14922 ) ) ( not ( = ?auto_14894 ?auto_14909 ) ) ( not ( = ?auto_14908 ?auto_14913 ) ) ( not ( = ?auto_14908 ?auto_14920 ) ) ( not ( = ?auto_14908 ?auto_14901 ) ) ( not ( = ?auto_14912 ?auto_14921 ) ) ( not ( = ?auto_14912 ?auto_14915 ) ) ( not ( = ?auto_14912 ?auto_14905 ) ) ( not ( = ?auto_14911 ?auto_14907 ) ) ( not ( = ?auto_14911 ?auto_14922 ) ) ( not ( = ?auto_14911 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14895 ) ) ( not ( = ?auto_14890 ?auto_14918 ) ) ( not ( = ?auto_14891 ?auto_14895 ) ) ( not ( = ?auto_14891 ?auto_14918 ) ) ( not ( = ?auto_14892 ?auto_14895 ) ) ( not ( = ?auto_14892 ?auto_14918 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14918 ) ) ( not ( = ?auto_14895 ?auto_14911 ) ) ( not ( = ?auto_14895 ?auto_14907 ) ) ( not ( = ?auto_14895 ?auto_14922 ) ) ( not ( = ?auto_14895 ?auto_14909 ) ) ( not ( = ?auto_14918 ?auto_14911 ) ) ( not ( = ?auto_14918 ?auto_14907 ) ) ( not ( = ?auto_14918 ?auto_14922 ) ) ( not ( = ?auto_14918 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14896 ) ) ( not ( = ?auto_14890 ?auto_14910 ) ) ( not ( = ?auto_14891 ?auto_14896 ) ) ( not ( = ?auto_14891 ?auto_14910 ) ) ( not ( = ?auto_14892 ?auto_14896 ) ) ( not ( = ?auto_14892 ?auto_14910 ) ) ( not ( = ?auto_14893 ?auto_14896 ) ) ( not ( = ?auto_14893 ?auto_14910 ) ) ( not ( = ?auto_14894 ?auto_14896 ) ) ( not ( = ?auto_14894 ?auto_14910 ) ) ( not ( = ?auto_14896 ?auto_14918 ) ) ( not ( = ?auto_14896 ?auto_14911 ) ) ( not ( = ?auto_14896 ?auto_14907 ) ) ( not ( = ?auto_14896 ?auto_14922 ) ) ( not ( = ?auto_14896 ?auto_14909 ) ) ( not ( = ?auto_14906 ?auto_14901 ) ) ( not ( = ?auto_14906 ?auto_14908 ) ) ( not ( = ?auto_14906 ?auto_14913 ) ) ( not ( = ?auto_14906 ?auto_14920 ) ) ( not ( = ?auto_14917 ?auto_14905 ) ) ( not ( = ?auto_14917 ?auto_14912 ) ) ( not ( = ?auto_14917 ?auto_14921 ) ) ( not ( = ?auto_14917 ?auto_14915 ) ) ( not ( = ?auto_14910 ?auto_14918 ) ) ( not ( = ?auto_14910 ?auto_14911 ) ) ( not ( = ?auto_14910 ?auto_14907 ) ) ( not ( = ?auto_14910 ?auto_14922 ) ) ( not ( = ?auto_14910 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14897 ) ) ( not ( = ?auto_14890 ?auto_14919 ) ) ( not ( = ?auto_14891 ?auto_14897 ) ) ( not ( = ?auto_14891 ?auto_14919 ) ) ( not ( = ?auto_14892 ?auto_14897 ) ) ( not ( = ?auto_14892 ?auto_14919 ) ) ( not ( = ?auto_14893 ?auto_14897 ) ) ( not ( = ?auto_14893 ?auto_14919 ) ) ( not ( = ?auto_14894 ?auto_14897 ) ) ( not ( = ?auto_14894 ?auto_14919 ) ) ( not ( = ?auto_14895 ?auto_14897 ) ) ( not ( = ?auto_14895 ?auto_14919 ) ) ( not ( = ?auto_14897 ?auto_14910 ) ) ( not ( = ?auto_14897 ?auto_14918 ) ) ( not ( = ?auto_14897 ?auto_14911 ) ) ( not ( = ?auto_14897 ?auto_14907 ) ) ( not ( = ?auto_14897 ?auto_14922 ) ) ( not ( = ?auto_14897 ?auto_14909 ) ) ( not ( = ?auto_14919 ?auto_14910 ) ) ( not ( = ?auto_14919 ?auto_14918 ) ) ( not ( = ?auto_14919 ?auto_14911 ) ) ( not ( = ?auto_14919 ?auto_14907 ) ) ( not ( = ?auto_14919 ?auto_14922 ) ) ( not ( = ?auto_14919 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14898 ) ) ( not ( = ?auto_14890 ?auto_14923 ) ) ( not ( = ?auto_14891 ?auto_14898 ) ) ( not ( = ?auto_14891 ?auto_14923 ) ) ( not ( = ?auto_14892 ?auto_14898 ) ) ( not ( = ?auto_14892 ?auto_14923 ) ) ( not ( = ?auto_14893 ?auto_14898 ) ) ( not ( = ?auto_14893 ?auto_14923 ) ) ( not ( = ?auto_14894 ?auto_14898 ) ) ( not ( = ?auto_14894 ?auto_14923 ) ) ( not ( = ?auto_14895 ?auto_14898 ) ) ( not ( = ?auto_14895 ?auto_14923 ) ) ( not ( = ?auto_14896 ?auto_14898 ) ) ( not ( = ?auto_14896 ?auto_14923 ) ) ( not ( = ?auto_14898 ?auto_14919 ) ) ( not ( = ?auto_14898 ?auto_14910 ) ) ( not ( = ?auto_14898 ?auto_14918 ) ) ( not ( = ?auto_14898 ?auto_14911 ) ) ( not ( = ?auto_14898 ?auto_14907 ) ) ( not ( = ?auto_14898 ?auto_14922 ) ) ( not ( = ?auto_14898 ?auto_14909 ) ) ( not ( = ?auto_14914 ?auto_14913 ) ) ( not ( = ?auto_14914 ?auto_14906 ) ) ( not ( = ?auto_14914 ?auto_14901 ) ) ( not ( = ?auto_14914 ?auto_14908 ) ) ( not ( = ?auto_14914 ?auto_14920 ) ) ( not ( = ?auto_14916 ?auto_14921 ) ) ( not ( = ?auto_14916 ?auto_14917 ) ) ( not ( = ?auto_14916 ?auto_14905 ) ) ( not ( = ?auto_14916 ?auto_14912 ) ) ( not ( = ?auto_14916 ?auto_14915 ) ) ( not ( = ?auto_14923 ?auto_14919 ) ) ( not ( = ?auto_14923 ?auto_14910 ) ) ( not ( = ?auto_14923 ?auto_14918 ) ) ( not ( = ?auto_14923 ?auto_14911 ) ) ( not ( = ?auto_14923 ?auto_14907 ) ) ( not ( = ?auto_14923 ?auto_14922 ) ) ( not ( = ?auto_14923 ?auto_14909 ) ) ( not ( = ?auto_14890 ?auto_14899 ) ) ( not ( = ?auto_14890 ?auto_14900 ) ) ( not ( = ?auto_14891 ?auto_14899 ) ) ( not ( = ?auto_14891 ?auto_14900 ) ) ( not ( = ?auto_14892 ?auto_14899 ) ) ( not ( = ?auto_14892 ?auto_14900 ) ) ( not ( = ?auto_14893 ?auto_14899 ) ) ( not ( = ?auto_14893 ?auto_14900 ) ) ( not ( = ?auto_14894 ?auto_14899 ) ) ( not ( = ?auto_14894 ?auto_14900 ) ) ( not ( = ?auto_14895 ?auto_14899 ) ) ( not ( = ?auto_14895 ?auto_14900 ) ) ( not ( = ?auto_14896 ?auto_14899 ) ) ( not ( = ?auto_14896 ?auto_14900 ) ) ( not ( = ?auto_14897 ?auto_14899 ) ) ( not ( = ?auto_14897 ?auto_14900 ) ) ( not ( = ?auto_14899 ?auto_14923 ) ) ( not ( = ?auto_14899 ?auto_14919 ) ) ( not ( = ?auto_14899 ?auto_14910 ) ) ( not ( = ?auto_14899 ?auto_14918 ) ) ( not ( = ?auto_14899 ?auto_14911 ) ) ( not ( = ?auto_14899 ?auto_14907 ) ) ( not ( = ?auto_14899 ?auto_14922 ) ) ( not ( = ?auto_14899 ?auto_14909 ) ) ( not ( = ?auto_14900 ?auto_14923 ) ) ( not ( = ?auto_14900 ?auto_14919 ) ) ( not ( = ?auto_14900 ?auto_14910 ) ) ( not ( = ?auto_14900 ?auto_14918 ) ) ( not ( = ?auto_14900 ?auto_14911 ) ) ( not ( = ?auto_14900 ?auto_14907 ) ) ( not ( = ?auto_14900 ?auto_14922 ) ) ( not ( = ?auto_14900 ?auto_14909 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14890 ?auto_14891 ?auto_14892 ?auto_14893 ?auto_14894 ?auto_14895 ?auto_14896 ?auto_14897 ?auto_14898 )
      ( MAKE-1CRATE ?auto_14898 ?auto_14899 )
      ( MAKE-9CRATE-VERIFY ?auto_14890 ?auto_14891 ?auto_14892 ?auto_14893 ?auto_14894 ?auto_14895 ?auto_14896 ?auto_14897 ?auto_14898 ?auto_14899 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14945 - SURFACE
      ?auto_14946 - SURFACE
      ?auto_14947 - SURFACE
      ?auto_14948 - SURFACE
      ?auto_14949 - SURFACE
      ?auto_14950 - SURFACE
      ?auto_14951 - SURFACE
      ?auto_14952 - SURFACE
      ?auto_14953 - SURFACE
      ?auto_14954 - SURFACE
      ?auto_14955 - SURFACE
    )
    :vars
    (
      ?auto_14960 - HOIST
      ?auto_14961 - PLACE
      ?auto_14958 - PLACE
      ?auto_14959 - HOIST
      ?auto_14956 - SURFACE
      ?auto_14964 - PLACE
      ?auto_14978 - HOIST
      ?auto_14973 - SURFACE
      ?auto_14980 - PLACE
      ?auto_14968 - HOIST
      ?auto_14974 - SURFACE
      ?auto_14970 - PLACE
      ?auto_14982 - HOIST
      ?auto_14969 - SURFACE
      ?auto_14976 - PLACE
      ?auto_14979 - HOIST
      ?auto_14962 - SURFACE
      ?auto_14966 - SURFACE
      ?auto_14967 - PLACE
      ?auto_14972 - HOIST
      ?auto_14971 - SURFACE
      ?auto_14963 - SURFACE
      ?auto_14981 - PLACE
      ?auto_14965 - HOIST
      ?auto_14977 - SURFACE
      ?auto_14975 - SURFACE
      ?auto_14957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14960 ?auto_14961 ) ( IS-CRATE ?auto_14955 ) ( not ( = ?auto_14958 ?auto_14961 ) ) ( HOIST-AT ?auto_14959 ?auto_14958 ) ( AVAILABLE ?auto_14959 ) ( SURFACE-AT ?auto_14955 ?auto_14958 ) ( ON ?auto_14955 ?auto_14956 ) ( CLEAR ?auto_14955 ) ( not ( = ?auto_14954 ?auto_14955 ) ) ( not ( = ?auto_14954 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14956 ) ) ( not ( = ?auto_14960 ?auto_14959 ) ) ( IS-CRATE ?auto_14954 ) ( not ( = ?auto_14964 ?auto_14961 ) ) ( HOIST-AT ?auto_14978 ?auto_14964 ) ( SURFACE-AT ?auto_14954 ?auto_14964 ) ( ON ?auto_14954 ?auto_14973 ) ( CLEAR ?auto_14954 ) ( not ( = ?auto_14953 ?auto_14954 ) ) ( not ( = ?auto_14953 ?auto_14973 ) ) ( not ( = ?auto_14954 ?auto_14973 ) ) ( not ( = ?auto_14960 ?auto_14978 ) ) ( IS-CRATE ?auto_14953 ) ( not ( = ?auto_14980 ?auto_14961 ) ) ( HOIST-AT ?auto_14968 ?auto_14980 ) ( AVAILABLE ?auto_14968 ) ( SURFACE-AT ?auto_14953 ?auto_14980 ) ( ON ?auto_14953 ?auto_14974 ) ( CLEAR ?auto_14953 ) ( not ( = ?auto_14952 ?auto_14953 ) ) ( not ( = ?auto_14952 ?auto_14974 ) ) ( not ( = ?auto_14953 ?auto_14974 ) ) ( not ( = ?auto_14960 ?auto_14968 ) ) ( IS-CRATE ?auto_14952 ) ( not ( = ?auto_14970 ?auto_14961 ) ) ( HOIST-AT ?auto_14982 ?auto_14970 ) ( SURFACE-AT ?auto_14952 ?auto_14970 ) ( ON ?auto_14952 ?auto_14969 ) ( CLEAR ?auto_14952 ) ( not ( = ?auto_14951 ?auto_14952 ) ) ( not ( = ?auto_14951 ?auto_14969 ) ) ( not ( = ?auto_14952 ?auto_14969 ) ) ( not ( = ?auto_14960 ?auto_14982 ) ) ( IS-CRATE ?auto_14951 ) ( not ( = ?auto_14976 ?auto_14961 ) ) ( HOIST-AT ?auto_14979 ?auto_14976 ) ( AVAILABLE ?auto_14979 ) ( SURFACE-AT ?auto_14951 ?auto_14976 ) ( ON ?auto_14951 ?auto_14962 ) ( CLEAR ?auto_14951 ) ( not ( = ?auto_14950 ?auto_14951 ) ) ( not ( = ?auto_14950 ?auto_14962 ) ) ( not ( = ?auto_14951 ?auto_14962 ) ) ( not ( = ?auto_14960 ?auto_14979 ) ) ( IS-CRATE ?auto_14950 ) ( SURFACE-AT ?auto_14950 ?auto_14964 ) ( ON ?auto_14950 ?auto_14966 ) ( CLEAR ?auto_14950 ) ( not ( = ?auto_14949 ?auto_14950 ) ) ( not ( = ?auto_14949 ?auto_14966 ) ) ( not ( = ?auto_14950 ?auto_14966 ) ) ( IS-CRATE ?auto_14949 ) ( not ( = ?auto_14967 ?auto_14961 ) ) ( HOIST-AT ?auto_14972 ?auto_14967 ) ( AVAILABLE ?auto_14972 ) ( SURFACE-AT ?auto_14949 ?auto_14967 ) ( ON ?auto_14949 ?auto_14971 ) ( CLEAR ?auto_14949 ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( not ( = ?auto_14948 ?auto_14971 ) ) ( not ( = ?auto_14949 ?auto_14971 ) ) ( not ( = ?auto_14960 ?auto_14972 ) ) ( IS-CRATE ?auto_14948 ) ( AVAILABLE ?auto_14982 ) ( SURFACE-AT ?auto_14948 ?auto_14970 ) ( ON ?auto_14948 ?auto_14963 ) ( CLEAR ?auto_14948 ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14963 ) ) ( not ( = ?auto_14948 ?auto_14963 ) ) ( IS-CRATE ?auto_14947 ) ( not ( = ?auto_14981 ?auto_14961 ) ) ( HOIST-AT ?auto_14965 ?auto_14981 ) ( AVAILABLE ?auto_14965 ) ( SURFACE-AT ?auto_14947 ?auto_14981 ) ( ON ?auto_14947 ?auto_14977 ) ( CLEAR ?auto_14947 ) ( not ( = ?auto_14946 ?auto_14947 ) ) ( not ( = ?auto_14946 ?auto_14977 ) ) ( not ( = ?auto_14947 ?auto_14977 ) ) ( not ( = ?auto_14960 ?auto_14965 ) ) ( SURFACE-AT ?auto_14945 ?auto_14961 ) ( CLEAR ?auto_14945 ) ( IS-CRATE ?auto_14946 ) ( AVAILABLE ?auto_14960 ) ( AVAILABLE ?auto_14978 ) ( SURFACE-AT ?auto_14946 ?auto_14964 ) ( ON ?auto_14946 ?auto_14975 ) ( CLEAR ?auto_14946 ) ( TRUCK-AT ?auto_14957 ?auto_14961 ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( not ( = ?auto_14945 ?auto_14975 ) ) ( not ( = ?auto_14946 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14947 ) ) ( not ( = ?auto_14945 ?auto_14977 ) ) ( not ( = ?auto_14947 ?auto_14975 ) ) ( not ( = ?auto_14981 ?auto_14964 ) ) ( not ( = ?auto_14965 ?auto_14978 ) ) ( not ( = ?auto_14977 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14948 ) ) ( not ( = ?auto_14945 ?auto_14963 ) ) ( not ( = ?auto_14946 ?auto_14948 ) ) ( not ( = ?auto_14946 ?auto_14963 ) ) ( not ( = ?auto_14948 ?auto_14977 ) ) ( not ( = ?auto_14948 ?auto_14975 ) ) ( not ( = ?auto_14970 ?auto_14981 ) ) ( not ( = ?auto_14970 ?auto_14964 ) ) ( not ( = ?auto_14982 ?auto_14965 ) ) ( not ( = ?auto_14982 ?auto_14978 ) ) ( not ( = ?auto_14963 ?auto_14977 ) ) ( not ( = ?auto_14963 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14949 ) ) ( not ( = ?auto_14945 ?auto_14971 ) ) ( not ( = ?auto_14946 ?auto_14949 ) ) ( not ( = ?auto_14946 ?auto_14971 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14971 ) ) ( not ( = ?auto_14949 ?auto_14963 ) ) ( not ( = ?auto_14949 ?auto_14977 ) ) ( not ( = ?auto_14949 ?auto_14975 ) ) ( not ( = ?auto_14967 ?auto_14970 ) ) ( not ( = ?auto_14967 ?auto_14981 ) ) ( not ( = ?auto_14967 ?auto_14964 ) ) ( not ( = ?auto_14972 ?auto_14982 ) ) ( not ( = ?auto_14972 ?auto_14965 ) ) ( not ( = ?auto_14972 ?auto_14978 ) ) ( not ( = ?auto_14971 ?auto_14963 ) ) ( not ( = ?auto_14971 ?auto_14977 ) ) ( not ( = ?auto_14971 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14950 ) ) ( not ( = ?auto_14945 ?auto_14966 ) ) ( not ( = ?auto_14946 ?auto_14950 ) ) ( not ( = ?auto_14946 ?auto_14966 ) ) ( not ( = ?auto_14947 ?auto_14950 ) ) ( not ( = ?auto_14947 ?auto_14966 ) ) ( not ( = ?auto_14948 ?auto_14950 ) ) ( not ( = ?auto_14948 ?auto_14966 ) ) ( not ( = ?auto_14950 ?auto_14971 ) ) ( not ( = ?auto_14950 ?auto_14963 ) ) ( not ( = ?auto_14950 ?auto_14977 ) ) ( not ( = ?auto_14950 ?auto_14975 ) ) ( not ( = ?auto_14966 ?auto_14971 ) ) ( not ( = ?auto_14966 ?auto_14963 ) ) ( not ( = ?auto_14966 ?auto_14977 ) ) ( not ( = ?auto_14966 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14951 ) ) ( not ( = ?auto_14945 ?auto_14962 ) ) ( not ( = ?auto_14946 ?auto_14951 ) ) ( not ( = ?auto_14946 ?auto_14962 ) ) ( not ( = ?auto_14947 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14962 ) ) ( not ( = ?auto_14948 ?auto_14951 ) ) ( not ( = ?auto_14948 ?auto_14962 ) ) ( not ( = ?auto_14949 ?auto_14951 ) ) ( not ( = ?auto_14949 ?auto_14962 ) ) ( not ( = ?auto_14951 ?auto_14966 ) ) ( not ( = ?auto_14951 ?auto_14971 ) ) ( not ( = ?auto_14951 ?auto_14963 ) ) ( not ( = ?auto_14951 ?auto_14977 ) ) ( not ( = ?auto_14951 ?auto_14975 ) ) ( not ( = ?auto_14976 ?auto_14964 ) ) ( not ( = ?auto_14976 ?auto_14967 ) ) ( not ( = ?auto_14976 ?auto_14970 ) ) ( not ( = ?auto_14976 ?auto_14981 ) ) ( not ( = ?auto_14979 ?auto_14978 ) ) ( not ( = ?auto_14979 ?auto_14972 ) ) ( not ( = ?auto_14979 ?auto_14982 ) ) ( not ( = ?auto_14979 ?auto_14965 ) ) ( not ( = ?auto_14962 ?auto_14966 ) ) ( not ( = ?auto_14962 ?auto_14971 ) ) ( not ( = ?auto_14962 ?auto_14963 ) ) ( not ( = ?auto_14962 ?auto_14977 ) ) ( not ( = ?auto_14962 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14952 ) ) ( not ( = ?auto_14945 ?auto_14969 ) ) ( not ( = ?auto_14946 ?auto_14952 ) ) ( not ( = ?auto_14946 ?auto_14969 ) ) ( not ( = ?auto_14947 ?auto_14952 ) ) ( not ( = ?auto_14947 ?auto_14969 ) ) ( not ( = ?auto_14948 ?auto_14952 ) ) ( not ( = ?auto_14948 ?auto_14969 ) ) ( not ( = ?auto_14949 ?auto_14952 ) ) ( not ( = ?auto_14949 ?auto_14969 ) ) ( not ( = ?auto_14950 ?auto_14952 ) ) ( not ( = ?auto_14950 ?auto_14969 ) ) ( not ( = ?auto_14952 ?auto_14962 ) ) ( not ( = ?auto_14952 ?auto_14966 ) ) ( not ( = ?auto_14952 ?auto_14971 ) ) ( not ( = ?auto_14952 ?auto_14963 ) ) ( not ( = ?auto_14952 ?auto_14977 ) ) ( not ( = ?auto_14952 ?auto_14975 ) ) ( not ( = ?auto_14969 ?auto_14962 ) ) ( not ( = ?auto_14969 ?auto_14966 ) ) ( not ( = ?auto_14969 ?auto_14971 ) ) ( not ( = ?auto_14969 ?auto_14963 ) ) ( not ( = ?auto_14969 ?auto_14977 ) ) ( not ( = ?auto_14969 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14953 ) ) ( not ( = ?auto_14945 ?auto_14974 ) ) ( not ( = ?auto_14946 ?auto_14953 ) ) ( not ( = ?auto_14946 ?auto_14974 ) ) ( not ( = ?auto_14947 ?auto_14953 ) ) ( not ( = ?auto_14947 ?auto_14974 ) ) ( not ( = ?auto_14948 ?auto_14953 ) ) ( not ( = ?auto_14948 ?auto_14974 ) ) ( not ( = ?auto_14949 ?auto_14953 ) ) ( not ( = ?auto_14949 ?auto_14974 ) ) ( not ( = ?auto_14950 ?auto_14953 ) ) ( not ( = ?auto_14950 ?auto_14974 ) ) ( not ( = ?auto_14951 ?auto_14953 ) ) ( not ( = ?auto_14951 ?auto_14974 ) ) ( not ( = ?auto_14953 ?auto_14969 ) ) ( not ( = ?auto_14953 ?auto_14962 ) ) ( not ( = ?auto_14953 ?auto_14966 ) ) ( not ( = ?auto_14953 ?auto_14971 ) ) ( not ( = ?auto_14953 ?auto_14963 ) ) ( not ( = ?auto_14953 ?auto_14977 ) ) ( not ( = ?auto_14953 ?auto_14975 ) ) ( not ( = ?auto_14980 ?auto_14970 ) ) ( not ( = ?auto_14980 ?auto_14976 ) ) ( not ( = ?auto_14980 ?auto_14964 ) ) ( not ( = ?auto_14980 ?auto_14967 ) ) ( not ( = ?auto_14980 ?auto_14981 ) ) ( not ( = ?auto_14968 ?auto_14982 ) ) ( not ( = ?auto_14968 ?auto_14979 ) ) ( not ( = ?auto_14968 ?auto_14978 ) ) ( not ( = ?auto_14968 ?auto_14972 ) ) ( not ( = ?auto_14968 ?auto_14965 ) ) ( not ( = ?auto_14974 ?auto_14969 ) ) ( not ( = ?auto_14974 ?auto_14962 ) ) ( not ( = ?auto_14974 ?auto_14966 ) ) ( not ( = ?auto_14974 ?auto_14971 ) ) ( not ( = ?auto_14974 ?auto_14963 ) ) ( not ( = ?auto_14974 ?auto_14977 ) ) ( not ( = ?auto_14974 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14954 ) ) ( not ( = ?auto_14945 ?auto_14973 ) ) ( not ( = ?auto_14946 ?auto_14954 ) ) ( not ( = ?auto_14946 ?auto_14973 ) ) ( not ( = ?auto_14947 ?auto_14954 ) ) ( not ( = ?auto_14947 ?auto_14973 ) ) ( not ( = ?auto_14948 ?auto_14954 ) ) ( not ( = ?auto_14948 ?auto_14973 ) ) ( not ( = ?auto_14949 ?auto_14954 ) ) ( not ( = ?auto_14949 ?auto_14973 ) ) ( not ( = ?auto_14950 ?auto_14954 ) ) ( not ( = ?auto_14950 ?auto_14973 ) ) ( not ( = ?auto_14951 ?auto_14954 ) ) ( not ( = ?auto_14951 ?auto_14973 ) ) ( not ( = ?auto_14952 ?auto_14954 ) ) ( not ( = ?auto_14952 ?auto_14973 ) ) ( not ( = ?auto_14954 ?auto_14974 ) ) ( not ( = ?auto_14954 ?auto_14969 ) ) ( not ( = ?auto_14954 ?auto_14962 ) ) ( not ( = ?auto_14954 ?auto_14966 ) ) ( not ( = ?auto_14954 ?auto_14971 ) ) ( not ( = ?auto_14954 ?auto_14963 ) ) ( not ( = ?auto_14954 ?auto_14977 ) ) ( not ( = ?auto_14954 ?auto_14975 ) ) ( not ( = ?auto_14973 ?auto_14974 ) ) ( not ( = ?auto_14973 ?auto_14969 ) ) ( not ( = ?auto_14973 ?auto_14962 ) ) ( not ( = ?auto_14973 ?auto_14966 ) ) ( not ( = ?auto_14973 ?auto_14971 ) ) ( not ( = ?auto_14973 ?auto_14963 ) ) ( not ( = ?auto_14973 ?auto_14977 ) ) ( not ( = ?auto_14973 ?auto_14975 ) ) ( not ( = ?auto_14945 ?auto_14955 ) ) ( not ( = ?auto_14945 ?auto_14956 ) ) ( not ( = ?auto_14946 ?auto_14955 ) ) ( not ( = ?auto_14946 ?auto_14956 ) ) ( not ( = ?auto_14947 ?auto_14955 ) ) ( not ( = ?auto_14947 ?auto_14956 ) ) ( not ( = ?auto_14948 ?auto_14955 ) ) ( not ( = ?auto_14948 ?auto_14956 ) ) ( not ( = ?auto_14949 ?auto_14955 ) ) ( not ( = ?auto_14949 ?auto_14956 ) ) ( not ( = ?auto_14950 ?auto_14955 ) ) ( not ( = ?auto_14950 ?auto_14956 ) ) ( not ( = ?auto_14951 ?auto_14955 ) ) ( not ( = ?auto_14951 ?auto_14956 ) ) ( not ( = ?auto_14952 ?auto_14955 ) ) ( not ( = ?auto_14952 ?auto_14956 ) ) ( not ( = ?auto_14953 ?auto_14955 ) ) ( not ( = ?auto_14953 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14973 ) ) ( not ( = ?auto_14955 ?auto_14974 ) ) ( not ( = ?auto_14955 ?auto_14969 ) ) ( not ( = ?auto_14955 ?auto_14962 ) ) ( not ( = ?auto_14955 ?auto_14966 ) ) ( not ( = ?auto_14955 ?auto_14971 ) ) ( not ( = ?auto_14955 ?auto_14963 ) ) ( not ( = ?auto_14955 ?auto_14977 ) ) ( not ( = ?auto_14955 ?auto_14975 ) ) ( not ( = ?auto_14958 ?auto_14964 ) ) ( not ( = ?auto_14958 ?auto_14980 ) ) ( not ( = ?auto_14958 ?auto_14970 ) ) ( not ( = ?auto_14958 ?auto_14976 ) ) ( not ( = ?auto_14958 ?auto_14967 ) ) ( not ( = ?auto_14958 ?auto_14981 ) ) ( not ( = ?auto_14959 ?auto_14978 ) ) ( not ( = ?auto_14959 ?auto_14968 ) ) ( not ( = ?auto_14959 ?auto_14982 ) ) ( not ( = ?auto_14959 ?auto_14979 ) ) ( not ( = ?auto_14959 ?auto_14972 ) ) ( not ( = ?auto_14959 ?auto_14965 ) ) ( not ( = ?auto_14956 ?auto_14973 ) ) ( not ( = ?auto_14956 ?auto_14974 ) ) ( not ( = ?auto_14956 ?auto_14969 ) ) ( not ( = ?auto_14956 ?auto_14962 ) ) ( not ( = ?auto_14956 ?auto_14966 ) ) ( not ( = ?auto_14956 ?auto_14971 ) ) ( not ( = ?auto_14956 ?auto_14963 ) ) ( not ( = ?auto_14956 ?auto_14977 ) ) ( not ( = ?auto_14956 ?auto_14975 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14945 ?auto_14946 ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14950 ?auto_14951 ?auto_14952 ?auto_14953 ?auto_14954 )
      ( MAKE-1CRATE ?auto_14954 ?auto_14955 )
      ( MAKE-10CRATE-VERIFY ?auto_14945 ?auto_14946 ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14950 ?auto_14951 ?auto_14952 ?auto_14953 ?auto_14954 ?auto_14955 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15005 - SURFACE
      ?auto_15006 - SURFACE
      ?auto_15007 - SURFACE
      ?auto_15008 - SURFACE
      ?auto_15009 - SURFACE
      ?auto_15010 - SURFACE
      ?auto_15011 - SURFACE
      ?auto_15012 - SURFACE
      ?auto_15013 - SURFACE
      ?auto_15014 - SURFACE
      ?auto_15015 - SURFACE
      ?auto_15016 - SURFACE
    )
    :vars
    (
      ?auto_15019 - HOIST
      ?auto_15020 - PLACE
      ?auto_15017 - PLACE
      ?auto_15018 - HOIST
      ?auto_15021 - SURFACE
      ?auto_15030 - PLACE
      ?auto_15029 - HOIST
      ?auto_15023 - SURFACE
      ?auto_15043 - PLACE
      ?auto_15024 - HOIST
      ?auto_15037 - SURFACE
      ?auto_15034 - PLACE
      ?auto_15041 - HOIST
      ?auto_15040 - SURFACE
      ?auto_15027 - PLACE
      ?auto_15042 - HOIST
      ?auto_15046 - SURFACE
      ?auto_15045 - PLACE
      ?auto_15025 - HOIST
      ?auto_15044 - SURFACE
      ?auto_15031 - SURFACE
      ?auto_15032 - PLACE
      ?auto_15035 - HOIST
      ?auto_15033 - SURFACE
      ?auto_15036 - SURFACE
      ?auto_15028 - PLACE
      ?auto_15038 - HOIST
      ?auto_15039 - SURFACE
      ?auto_15026 - SURFACE
      ?auto_15022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15019 ?auto_15020 ) ( IS-CRATE ?auto_15016 ) ( not ( = ?auto_15017 ?auto_15020 ) ) ( HOIST-AT ?auto_15018 ?auto_15017 ) ( AVAILABLE ?auto_15018 ) ( SURFACE-AT ?auto_15016 ?auto_15017 ) ( ON ?auto_15016 ?auto_15021 ) ( CLEAR ?auto_15016 ) ( not ( = ?auto_15015 ?auto_15016 ) ) ( not ( = ?auto_15015 ?auto_15021 ) ) ( not ( = ?auto_15016 ?auto_15021 ) ) ( not ( = ?auto_15019 ?auto_15018 ) ) ( IS-CRATE ?auto_15015 ) ( not ( = ?auto_15030 ?auto_15020 ) ) ( HOIST-AT ?auto_15029 ?auto_15030 ) ( AVAILABLE ?auto_15029 ) ( SURFACE-AT ?auto_15015 ?auto_15030 ) ( ON ?auto_15015 ?auto_15023 ) ( CLEAR ?auto_15015 ) ( not ( = ?auto_15014 ?auto_15015 ) ) ( not ( = ?auto_15014 ?auto_15023 ) ) ( not ( = ?auto_15015 ?auto_15023 ) ) ( not ( = ?auto_15019 ?auto_15029 ) ) ( IS-CRATE ?auto_15014 ) ( not ( = ?auto_15043 ?auto_15020 ) ) ( HOIST-AT ?auto_15024 ?auto_15043 ) ( SURFACE-AT ?auto_15014 ?auto_15043 ) ( ON ?auto_15014 ?auto_15037 ) ( CLEAR ?auto_15014 ) ( not ( = ?auto_15013 ?auto_15014 ) ) ( not ( = ?auto_15013 ?auto_15037 ) ) ( not ( = ?auto_15014 ?auto_15037 ) ) ( not ( = ?auto_15019 ?auto_15024 ) ) ( IS-CRATE ?auto_15013 ) ( not ( = ?auto_15034 ?auto_15020 ) ) ( HOIST-AT ?auto_15041 ?auto_15034 ) ( AVAILABLE ?auto_15041 ) ( SURFACE-AT ?auto_15013 ?auto_15034 ) ( ON ?auto_15013 ?auto_15040 ) ( CLEAR ?auto_15013 ) ( not ( = ?auto_15012 ?auto_15013 ) ) ( not ( = ?auto_15012 ?auto_15040 ) ) ( not ( = ?auto_15013 ?auto_15040 ) ) ( not ( = ?auto_15019 ?auto_15041 ) ) ( IS-CRATE ?auto_15012 ) ( not ( = ?auto_15027 ?auto_15020 ) ) ( HOIST-AT ?auto_15042 ?auto_15027 ) ( SURFACE-AT ?auto_15012 ?auto_15027 ) ( ON ?auto_15012 ?auto_15046 ) ( CLEAR ?auto_15012 ) ( not ( = ?auto_15011 ?auto_15012 ) ) ( not ( = ?auto_15011 ?auto_15046 ) ) ( not ( = ?auto_15012 ?auto_15046 ) ) ( not ( = ?auto_15019 ?auto_15042 ) ) ( IS-CRATE ?auto_15011 ) ( not ( = ?auto_15045 ?auto_15020 ) ) ( HOIST-AT ?auto_15025 ?auto_15045 ) ( AVAILABLE ?auto_15025 ) ( SURFACE-AT ?auto_15011 ?auto_15045 ) ( ON ?auto_15011 ?auto_15044 ) ( CLEAR ?auto_15011 ) ( not ( = ?auto_15010 ?auto_15011 ) ) ( not ( = ?auto_15010 ?auto_15044 ) ) ( not ( = ?auto_15011 ?auto_15044 ) ) ( not ( = ?auto_15019 ?auto_15025 ) ) ( IS-CRATE ?auto_15010 ) ( SURFACE-AT ?auto_15010 ?auto_15043 ) ( ON ?auto_15010 ?auto_15031 ) ( CLEAR ?auto_15010 ) ( not ( = ?auto_15009 ?auto_15010 ) ) ( not ( = ?auto_15009 ?auto_15031 ) ) ( not ( = ?auto_15010 ?auto_15031 ) ) ( IS-CRATE ?auto_15009 ) ( not ( = ?auto_15032 ?auto_15020 ) ) ( HOIST-AT ?auto_15035 ?auto_15032 ) ( AVAILABLE ?auto_15035 ) ( SURFACE-AT ?auto_15009 ?auto_15032 ) ( ON ?auto_15009 ?auto_15033 ) ( CLEAR ?auto_15009 ) ( not ( = ?auto_15008 ?auto_15009 ) ) ( not ( = ?auto_15008 ?auto_15033 ) ) ( not ( = ?auto_15009 ?auto_15033 ) ) ( not ( = ?auto_15019 ?auto_15035 ) ) ( IS-CRATE ?auto_15008 ) ( AVAILABLE ?auto_15042 ) ( SURFACE-AT ?auto_15008 ?auto_15027 ) ( ON ?auto_15008 ?auto_15036 ) ( CLEAR ?auto_15008 ) ( not ( = ?auto_15007 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15036 ) ) ( not ( = ?auto_15008 ?auto_15036 ) ) ( IS-CRATE ?auto_15007 ) ( not ( = ?auto_15028 ?auto_15020 ) ) ( HOIST-AT ?auto_15038 ?auto_15028 ) ( AVAILABLE ?auto_15038 ) ( SURFACE-AT ?auto_15007 ?auto_15028 ) ( ON ?auto_15007 ?auto_15039 ) ( CLEAR ?auto_15007 ) ( not ( = ?auto_15006 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15039 ) ) ( not ( = ?auto_15007 ?auto_15039 ) ) ( not ( = ?auto_15019 ?auto_15038 ) ) ( SURFACE-AT ?auto_15005 ?auto_15020 ) ( CLEAR ?auto_15005 ) ( IS-CRATE ?auto_15006 ) ( AVAILABLE ?auto_15019 ) ( AVAILABLE ?auto_15024 ) ( SURFACE-AT ?auto_15006 ?auto_15043 ) ( ON ?auto_15006 ?auto_15026 ) ( CLEAR ?auto_15006 ) ( TRUCK-AT ?auto_15022 ?auto_15020 ) ( not ( = ?auto_15005 ?auto_15006 ) ) ( not ( = ?auto_15005 ?auto_15026 ) ) ( not ( = ?auto_15006 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15007 ) ) ( not ( = ?auto_15005 ?auto_15039 ) ) ( not ( = ?auto_15007 ?auto_15026 ) ) ( not ( = ?auto_15028 ?auto_15043 ) ) ( not ( = ?auto_15038 ?auto_15024 ) ) ( not ( = ?auto_15039 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15008 ) ) ( not ( = ?auto_15005 ?auto_15036 ) ) ( not ( = ?auto_15006 ?auto_15008 ) ) ( not ( = ?auto_15006 ?auto_15036 ) ) ( not ( = ?auto_15008 ?auto_15039 ) ) ( not ( = ?auto_15008 ?auto_15026 ) ) ( not ( = ?auto_15027 ?auto_15028 ) ) ( not ( = ?auto_15027 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15038 ) ) ( not ( = ?auto_15042 ?auto_15024 ) ) ( not ( = ?auto_15036 ?auto_15039 ) ) ( not ( = ?auto_15036 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15009 ) ) ( not ( = ?auto_15005 ?auto_15033 ) ) ( not ( = ?auto_15006 ?auto_15009 ) ) ( not ( = ?auto_15006 ?auto_15033 ) ) ( not ( = ?auto_15007 ?auto_15009 ) ) ( not ( = ?auto_15007 ?auto_15033 ) ) ( not ( = ?auto_15009 ?auto_15036 ) ) ( not ( = ?auto_15009 ?auto_15039 ) ) ( not ( = ?auto_15009 ?auto_15026 ) ) ( not ( = ?auto_15032 ?auto_15027 ) ) ( not ( = ?auto_15032 ?auto_15028 ) ) ( not ( = ?auto_15032 ?auto_15043 ) ) ( not ( = ?auto_15035 ?auto_15042 ) ) ( not ( = ?auto_15035 ?auto_15038 ) ) ( not ( = ?auto_15035 ?auto_15024 ) ) ( not ( = ?auto_15033 ?auto_15036 ) ) ( not ( = ?auto_15033 ?auto_15039 ) ) ( not ( = ?auto_15033 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15010 ) ) ( not ( = ?auto_15005 ?auto_15031 ) ) ( not ( = ?auto_15006 ?auto_15010 ) ) ( not ( = ?auto_15006 ?auto_15031 ) ) ( not ( = ?auto_15007 ?auto_15010 ) ) ( not ( = ?auto_15007 ?auto_15031 ) ) ( not ( = ?auto_15008 ?auto_15010 ) ) ( not ( = ?auto_15008 ?auto_15031 ) ) ( not ( = ?auto_15010 ?auto_15033 ) ) ( not ( = ?auto_15010 ?auto_15036 ) ) ( not ( = ?auto_15010 ?auto_15039 ) ) ( not ( = ?auto_15010 ?auto_15026 ) ) ( not ( = ?auto_15031 ?auto_15033 ) ) ( not ( = ?auto_15031 ?auto_15036 ) ) ( not ( = ?auto_15031 ?auto_15039 ) ) ( not ( = ?auto_15031 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15011 ) ) ( not ( = ?auto_15005 ?auto_15044 ) ) ( not ( = ?auto_15006 ?auto_15011 ) ) ( not ( = ?auto_15006 ?auto_15044 ) ) ( not ( = ?auto_15007 ?auto_15011 ) ) ( not ( = ?auto_15007 ?auto_15044 ) ) ( not ( = ?auto_15008 ?auto_15011 ) ) ( not ( = ?auto_15008 ?auto_15044 ) ) ( not ( = ?auto_15009 ?auto_15011 ) ) ( not ( = ?auto_15009 ?auto_15044 ) ) ( not ( = ?auto_15011 ?auto_15031 ) ) ( not ( = ?auto_15011 ?auto_15033 ) ) ( not ( = ?auto_15011 ?auto_15036 ) ) ( not ( = ?auto_15011 ?auto_15039 ) ) ( not ( = ?auto_15011 ?auto_15026 ) ) ( not ( = ?auto_15045 ?auto_15043 ) ) ( not ( = ?auto_15045 ?auto_15032 ) ) ( not ( = ?auto_15045 ?auto_15027 ) ) ( not ( = ?auto_15045 ?auto_15028 ) ) ( not ( = ?auto_15025 ?auto_15024 ) ) ( not ( = ?auto_15025 ?auto_15035 ) ) ( not ( = ?auto_15025 ?auto_15042 ) ) ( not ( = ?auto_15025 ?auto_15038 ) ) ( not ( = ?auto_15044 ?auto_15031 ) ) ( not ( = ?auto_15044 ?auto_15033 ) ) ( not ( = ?auto_15044 ?auto_15036 ) ) ( not ( = ?auto_15044 ?auto_15039 ) ) ( not ( = ?auto_15044 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15012 ) ) ( not ( = ?auto_15005 ?auto_15046 ) ) ( not ( = ?auto_15006 ?auto_15012 ) ) ( not ( = ?auto_15006 ?auto_15046 ) ) ( not ( = ?auto_15007 ?auto_15012 ) ) ( not ( = ?auto_15007 ?auto_15046 ) ) ( not ( = ?auto_15008 ?auto_15012 ) ) ( not ( = ?auto_15008 ?auto_15046 ) ) ( not ( = ?auto_15009 ?auto_15012 ) ) ( not ( = ?auto_15009 ?auto_15046 ) ) ( not ( = ?auto_15010 ?auto_15012 ) ) ( not ( = ?auto_15010 ?auto_15046 ) ) ( not ( = ?auto_15012 ?auto_15044 ) ) ( not ( = ?auto_15012 ?auto_15031 ) ) ( not ( = ?auto_15012 ?auto_15033 ) ) ( not ( = ?auto_15012 ?auto_15036 ) ) ( not ( = ?auto_15012 ?auto_15039 ) ) ( not ( = ?auto_15012 ?auto_15026 ) ) ( not ( = ?auto_15046 ?auto_15044 ) ) ( not ( = ?auto_15046 ?auto_15031 ) ) ( not ( = ?auto_15046 ?auto_15033 ) ) ( not ( = ?auto_15046 ?auto_15036 ) ) ( not ( = ?auto_15046 ?auto_15039 ) ) ( not ( = ?auto_15046 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15013 ) ) ( not ( = ?auto_15005 ?auto_15040 ) ) ( not ( = ?auto_15006 ?auto_15013 ) ) ( not ( = ?auto_15006 ?auto_15040 ) ) ( not ( = ?auto_15007 ?auto_15013 ) ) ( not ( = ?auto_15007 ?auto_15040 ) ) ( not ( = ?auto_15008 ?auto_15013 ) ) ( not ( = ?auto_15008 ?auto_15040 ) ) ( not ( = ?auto_15009 ?auto_15013 ) ) ( not ( = ?auto_15009 ?auto_15040 ) ) ( not ( = ?auto_15010 ?auto_15013 ) ) ( not ( = ?auto_15010 ?auto_15040 ) ) ( not ( = ?auto_15011 ?auto_15013 ) ) ( not ( = ?auto_15011 ?auto_15040 ) ) ( not ( = ?auto_15013 ?auto_15046 ) ) ( not ( = ?auto_15013 ?auto_15044 ) ) ( not ( = ?auto_15013 ?auto_15031 ) ) ( not ( = ?auto_15013 ?auto_15033 ) ) ( not ( = ?auto_15013 ?auto_15036 ) ) ( not ( = ?auto_15013 ?auto_15039 ) ) ( not ( = ?auto_15013 ?auto_15026 ) ) ( not ( = ?auto_15034 ?auto_15027 ) ) ( not ( = ?auto_15034 ?auto_15045 ) ) ( not ( = ?auto_15034 ?auto_15043 ) ) ( not ( = ?auto_15034 ?auto_15032 ) ) ( not ( = ?auto_15034 ?auto_15028 ) ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15025 ) ) ( not ( = ?auto_15041 ?auto_15024 ) ) ( not ( = ?auto_15041 ?auto_15035 ) ) ( not ( = ?auto_15041 ?auto_15038 ) ) ( not ( = ?auto_15040 ?auto_15046 ) ) ( not ( = ?auto_15040 ?auto_15044 ) ) ( not ( = ?auto_15040 ?auto_15031 ) ) ( not ( = ?auto_15040 ?auto_15033 ) ) ( not ( = ?auto_15040 ?auto_15036 ) ) ( not ( = ?auto_15040 ?auto_15039 ) ) ( not ( = ?auto_15040 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15014 ) ) ( not ( = ?auto_15005 ?auto_15037 ) ) ( not ( = ?auto_15006 ?auto_15014 ) ) ( not ( = ?auto_15006 ?auto_15037 ) ) ( not ( = ?auto_15007 ?auto_15014 ) ) ( not ( = ?auto_15007 ?auto_15037 ) ) ( not ( = ?auto_15008 ?auto_15014 ) ) ( not ( = ?auto_15008 ?auto_15037 ) ) ( not ( = ?auto_15009 ?auto_15014 ) ) ( not ( = ?auto_15009 ?auto_15037 ) ) ( not ( = ?auto_15010 ?auto_15014 ) ) ( not ( = ?auto_15010 ?auto_15037 ) ) ( not ( = ?auto_15011 ?auto_15014 ) ) ( not ( = ?auto_15011 ?auto_15037 ) ) ( not ( = ?auto_15012 ?auto_15014 ) ) ( not ( = ?auto_15012 ?auto_15037 ) ) ( not ( = ?auto_15014 ?auto_15040 ) ) ( not ( = ?auto_15014 ?auto_15046 ) ) ( not ( = ?auto_15014 ?auto_15044 ) ) ( not ( = ?auto_15014 ?auto_15031 ) ) ( not ( = ?auto_15014 ?auto_15033 ) ) ( not ( = ?auto_15014 ?auto_15036 ) ) ( not ( = ?auto_15014 ?auto_15039 ) ) ( not ( = ?auto_15014 ?auto_15026 ) ) ( not ( = ?auto_15037 ?auto_15040 ) ) ( not ( = ?auto_15037 ?auto_15046 ) ) ( not ( = ?auto_15037 ?auto_15044 ) ) ( not ( = ?auto_15037 ?auto_15031 ) ) ( not ( = ?auto_15037 ?auto_15033 ) ) ( not ( = ?auto_15037 ?auto_15036 ) ) ( not ( = ?auto_15037 ?auto_15039 ) ) ( not ( = ?auto_15037 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15015 ) ) ( not ( = ?auto_15005 ?auto_15023 ) ) ( not ( = ?auto_15006 ?auto_15015 ) ) ( not ( = ?auto_15006 ?auto_15023 ) ) ( not ( = ?auto_15007 ?auto_15015 ) ) ( not ( = ?auto_15007 ?auto_15023 ) ) ( not ( = ?auto_15008 ?auto_15015 ) ) ( not ( = ?auto_15008 ?auto_15023 ) ) ( not ( = ?auto_15009 ?auto_15015 ) ) ( not ( = ?auto_15009 ?auto_15023 ) ) ( not ( = ?auto_15010 ?auto_15015 ) ) ( not ( = ?auto_15010 ?auto_15023 ) ) ( not ( = ?auto_15011 ?auto_15015 ) ) ( not ( = ?auto_15011 ?auto_15023 ) ) ( not ( = ?auto_15012 ?auto_15015 ) ) ( not ( = ?auto_15012 ?auto_15023 ) ) ( not ( = ?auto_15013 ?auto_15015 ) ) ( not ( = ?auto_15013 ?auto_15023 ) ) ( not ( = ?auto_15015 ?auto_15037 ) ) ( not ( = ?auto_15015 ?auto_15040 ) ) ( not ( = ?auto_15015 ?auto_15046 ) ) ( not ( = ?auto_15015 ?auto_15044 ) ) ( not ( = ?auto_15015 ?auto_15031 ) ) ( not ( = ?auto_15015 ?auto_15033 ) ) ( not ( = ?auto_15015 ?auto_15036 ) ) ( not ( = ?auto_15015 ?auto_15039 ) ) ( not ( = ?auto_15015 ?auto_15026 ) ) ( not ( = ?auto_15030 ?auto_15043 ) ) ( not ( = ?auto_15030 ?auto_15034 ) ) ( not ( = ?auto_15030 ?auto_15027 ) ) ( not ( = ?auto_15030 ?auto_15045 ) ) ( not ( = ?auto_15030 ?auto_15032 ) ) ( not ( = ?auto_15030 ?auto_15028 ) ) ( not ( = ?auto_15029 ?auto_15024 ) ) ( not ( = ?auto_15029 ?auto_15041 ) ) ( not ( = ?auto_15029 ?auto_15042 ) ) ( not ( = ?auto_15029 ?auto_15025 ) ) ( not ( = ?auto_15029 ?auto_15035 ) ) ( not ( = ?auto_15029 ?auto_15038 ) ) ( not ( = ?auto_15023 ?auto_15037 ) ) ( not ( = ?auto_15023 ?auto_15040 ) ) ( not ( = ?auto_15023 ?auto_15046 ) ) ( not ( = ?auto_15023 ?auto_15044 ) ) ( not ( = ?auto_15023 ?auto_15031 ) ) ( not ( = ?auto_15023 ?auto_15033 ) ) ( not ( = ?auto_15023 ?auto_15036 ) ) ( not ( = ?auto_15023 ?auto_15039 ) ) ( not ( = ?auto_15023 ?auto_15026 ) ) ( not ( = ?auto_15005 ?auto_15016 ) ) ( not ( = ?auto_15005 ?auto_15021 ) ) ( not ( = ?auto_15006 ?auto_15016 ) ) ( not ( = ?auto_15006 ?auto_15021 ) ) ( not ( = ?auto_15007 ?auto_15016 ) ) ( not ( = ?auto_15007 ?auto_15021 ) ) ( not ( = ?auto_15008 ?auto_15016 ) ) ( not ( = ?auto_15008 ?auto_15021 ) ) ( not ( = ?auto_15009 ?auto_15016 ) ) ( not ( = ?auto_15009 ?auto_15021 ) ) ( not ( = ?auto_15010 ?auto_15016 ) ) ( not ( = ?auto_15010 ?auto_15021 ) ) ( not ( = ?auto_15011 ?auto_15016 ) ) ( not ( = ?auto_15011 ?auto_15021 ) ) ( not ( = ?auto_15012 ?auto_15016 ) ) ( not ( = ?auto_15012 ?auto_15021 ) ) ( not ( = ?auto_15013 ?auto_15016 ) ) ( not ( = ?auto_15013 ?auto_15021 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15021 ) ) ( not ( = ?auto_15016 ?auto_15023 ) ) ( not ( = ?auto_15016 ?auto_15037 ) ) ( not ( = ?auto_15016 ?auto_15040 ) ) ( not ( = ?auto_15016 ?auto_15046 ) ) ( not ( = ?auto_15016 ?auto_15044 ) ) ( not ( = ?auto_15016 ?auto_15031 ) ) ( not ( = ?auto_15016 ?auto_15033 ) ) ( not ( = ?auto_15016 ?auto_15036 ) ) ( not ( = ?auto_15016 ?auto_15039 ) ) ( not ( = ?auto_15016 ?auto_15026 ) ) ( not ( = ?auto_15017 ?auto_15030 ) ) ( not ( = ?auto_15017 ?auto_15043 ) ) ( not ( = ?auto_15017 ?auto_15034 ) ) ( not ( = ?auto_15017 ?auto_15027 ) ) ( not ( = ?auto_15017 ?auto_15045 ) ) ( not ( = ?auto_15017 ?auto_15032 ) ) ( not ( = ?auto_15017 ?auto_15028 ) ) ( not ( = ?auto_15018 ?auto_15029 ) ) ( not ( = ?auto_15018 ?auto_15024 ) ) ( not ( = ?auto_15018 ?auto_15041 ) ) ( not ( = ?auto_15018 ?auto_15042 ) ) ( not ( = ?auto_15018 ?auto_15025 ) ) ( not ( = ?auto_15018 ?auto_15035 ) ) ( not ( = ?auto_15018 ?auto_15038 ) ) ( not ( = ?auto_15021 ?auto_15023 ) ) ( not ( = ?auto_15021 ?auto_15037 ) ) ( not ( = ?auto_15021 ?auto_15040 ) ) ( not ( = ?auto_15021 ?auto_15046 ) ) ( not ( = ?auto_15021 ?auto_15044 ) ) ( not ( = ?auto_15021 ?auto_15031 ) ) ( not ( = ?auto_15021 ?auto_15033 ) ) ( not ( = ?auto_15021 ?auto_15036 ) ) ( not ( = ?auto_15021 ?auto_15039 ) ) ( not ( = ?auto_15021 ?auto_15026 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15005 ?auto_15006 ?auto_15007 ?auto_15008 ?auto_15009 ?auto_15010 ?auto_15011 ?auto_15012 ?auto_15013 ?auto_15014 ?auto_15015 )
      ( MAKE-1CRATE ?auto_15015 ?auto_15016 )
      ( MAKE-11CRATE-VERIFY ?auto_15005 ?auto_15006 ?auto_15007 ?auto_15008 ?auto_15009 ?auto_15010 ?auto_15011 ?auto_15012 ?auto_15013 ?auto_15014 ?auto_15015 ?auto_15016 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15070 - SURFACE
      ?auto_15071 - SURFACE
      ?auto_15072 - SURFACE
      ?auto_15073 - SURFACE
      ?auto_15074 - SURFACE
      ?auto_15075 - SURFACE
      ?auto_15076 - SURFACE
      ?auto_15077 - SURFACE
      ?auto_15078 - SURFACE
      ?auto_15079 - SURFACE
      ?auto_15080 - SURFACE
      ?auto_15081 - SURFACE
      ?auto_15082 - SURFACE
    )
    :vars
    (
      ?auto_15084 - HOIST
      ?auto_15083 - PLACE
      ?auto_15087 - PLACE
      ?auto_15088 - HOIST
      ?auto_15086 - SURFACE
      ?auto_15098 - PLACE
      ?auto_15096 - HOIST
      ?auto_15113 - SURFACE
      ?auto_15099 - PLACE
      ?auto_15108 - HOIST
      ?auto_15093 - SURFACE
      ?auto_15109 - SURFACE
      ?auto_15097 - PLACE
      ?auto_15105 - HOIST
      ?auto_15094 - SURFACE
      ?auto_15095 - PLACE
      ?auto_15104 - HOIST
      ?auto_15091 - SURFACE
      ?auto_15110 - PLACE
      ?auto_15112 - HOIST
      ?auto_15107 - SURFACE
      ?auto_15106 - SURFACE
      ?auto_15111 - PLACE
      ?auto_15100 - HOIST
      ?auto_15089 - SURFACE
      ?auto_15090 - SURFACE
      ?auto_15102 - PLACE
      ?auto_15092 - HOIST
      ?auto_15103 - SURFACE
      ?auto_15101 - SURFACE
      ?auto_15085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15084 ?auto_15083 ) ( IS-CRATE ?auto_15082 ) ( not ( = ?auto_15087 ?auto_15083 ) ) ( HOIST-AT ?auto_15088 ?auto_15087 ) ( SURFACE-AT ?auto_15082 ?auto_15087 ) ( ON ?auto_15082 ?auto_15086 ) ( CLEAR ?auto_15082 ) ( not ( = ?auto_15081 ?auto_15082 ) ) ( not ( = ?auto_15081 ?auto_15086 ) ) ( not ( = ?auto_15082 ?auto_15086 ) ) ( not ( = ?auto_15084 ?auto_15088 ) ) ( IS-CRATE ?auto_15081 ) ( not ( = ?auto_15098 ?auto_15083 ) ) ( HOIST-AT ?auto_15096 ?auto_15098 ) ( AVAILABLE ?auto_15096 ) ( SURFACE-AT ?auto_15081 ?auto_15098 ) ( ON ?auto_15081 ?auto_15113 ) ( CLEAR ?auto_15081 ) ( not ( = ?auto_15080 ?auto_15081 ) ) ( not ( = ?auto_15080 ?auto_15113 ) ) ( not ( = ?auto_15081 ?auto_15113 ) ) ( not ( = ?auto_15084 ?auto_15096 ) ) ( IS-CRATE ?auto_15080 ) ( not ( = ?auto_15099 ?auto_15083 ) ) ( HOIST-AT ?auto_15108 ?auto_15099 ) ( AVAILABLE ?auto_15108 ) ( SURFACE-AT ?auto_15080 ?auto_15099 ) ( ON ?auto_15080 ?auto_15093 ) ( CLEAR ?auto_15080 ) ( not ( = ?auto_15079 ?auto_15080 ) ) ( not ( = ?auto_15079 ?auto_15093 ) ) ( not ( = ?auto_15080 ?auto_15093 ) ) ( not ( = ?auto_15084 ?auto_15108 ) ) ( IS-CRATE ?auto_15079 ) ( SURFACE-AT ?auto_15079 ?auto_15087 ) ( ON ?auto_15079 ?auto_15109 ) ( CLEAR ?auto_15079 ) ( not ( = ?auto_15078 ?auto_15079 ) ) ( not ( = ?auto_15078 ?auto_15109 ) ) ( not ( = ?auto_15079 ?auto_15109 ) ) ( IS-CRATE ?auto_15078 ) ( not ( = ?auto_15097 ?auto_15083 ) ) ( HOIST-AT ?auto_15105 ?auto_15097 ) ( AVAILABLE ?auto_15105 ) ( SURFACE-AT ?auto_15078 ?auto_15097 ) ( ON ?auto_15078 ?auto_15094 ) ( CLEAR ?auto_15078 ) ( not ( = ?auto_15077 ?auto_15078 ) ) ( not ( = ?auto_15077 ?auto_15094 ) ) ( not ( = ?auto_15078 ?auto_15094 ) ) ( not ( = ?auto_15084 ?auto_15105 ) ) ( IS-CRATE ?auto_15077 ) ( not ( = ?auto_15095 ?auto_15083 ) ) ( HOIST-AT ?auto_15104 ?auto_15095 ) ( SURFACE-AT ?auto_15077 ?auto_15095 ) ( ON ?auto_15077 ?auto_15091 ) ( CLEAR ?auto_15077 ) ( not ( = ?auto_15076 ?auto_15077 ) ) ( not ( = ?auto_15076 ?auto_15091 ) ) ( not ( = ?auto_15077 ?auto_15091 ) ) ( not ( = ?auto_15084 ?auto_15104 ) ) ( IS-CRATE ?auto_15076 ) ( not ( = ?auto_15110 ?auto_15083 ) ) ( HOIST-AT ?auto_15112 ?auto_15110 ) ( AVAILABLE ?auto_15112 ) ( SURFACE-AT ?auto_15076 ?auto_15110 ) ( ON ?auto_15076 ?auto_15107 ) ( CLEAR ?auto_15076 ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15107 ) ) ( not ( = ?auto_15076 ?auto_15107 ) ) ( not ( = ?auto_15084 ?auto_15112 ) ) ( IS-CRATE ?auto_15075 ) ( SURFACE-AT ?auto_15075 ?auto_15087 ) ( ON ?auto_15075 ?auto_15106 ) ( CLEAR ?auto_15075 ) ( not ( = ?auto_15074 ?auto_15075 ) ) ( not ( = ?auto_15074 ?auto_15106 ) ) ( not ( = ?auto_15075 ?auto_15106 ) ) ( IS-CRATE ?auto_15074 ) ( not ( = ?auto_15111 ?auto_15083 ) ) ( HOIST-AT ?auto_15100 ?auto_15111 ) ( AVAILABLE ?auto_15100 ) ( SURFACE-AT ?auto_15074 ?auto_15111 ) ( ON ?auto_15074 ?auto_15089 ) ( CLEAR ?auto_15074 ) ( not ( = ?auto_15073 ?auto_15074 ) ) ( not ( = ?auto_15073 ?auto_15089 ) ) ( not ( = ?auto_15074 ?auto_15089 ) ) ( not ( = ?auto_15084 ?auto_15100 ) ) ( IS-CRATE ?auto_15073 ) ( AVAILABLE ?auto_15104 ) ( SURFACE-AT ?auto_15073 ?auto_15095 ) ( ON ?auto_15073 ?auto_15090 ) ( CLEAR ?auto_15073 ) ( not ( = ?auto_15072 ?auto_15073 ) ) ( not ( = ?auto_15072 ?auto_15090 ) ) ( not ( = ?auto_15073 ?auto_15090 ) ) ( IS-CRATE ?auto_15072 ) ( not ( = ?auto_15102 ?auto_15083 ) ) ( HOIST-AT ?auto_15092 ?auto_15102 ) ( AVAILABLE ?auto_15092 ) ( SURFACE-AT ?auto_15072 ?auto_15102 ) ( ON ?auto_15072 ?auto_15103 ) ( CLEAR ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( not ( = ?auto_15071 ?auto_15103 ) ) ( not ( = ?auto_15072 ?auto_15103 ) ) ( not ( = ?auto_15084 ?auto_15092 ) ) ( SURFACE-AT ?auto_15070 ?auto_15083 ) ( CLEAR ?auto_15070 ) ( IS-CRATE ?auto_15071 ) ( AVAILABLE ?auto_15084 ) ( AVAILABLE ?auto_15088 ) ( SURFACE-AT ?auto_15071 ?auto_15087 ) ( ON ?auto_15071 ?auto_15101 ) ( CLEAR ?auto_15071 ) ( TRUCK-AT ?auto_15085 ?auto_15083 ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15101 ) ) ( not ( = ?auto_15071 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15103 ) ) ( not ( = ?auto_15072 ?auto_15101 ) ) ( not ( = ?auto_15102 ?auto_15087 ) ) ( not ( = ?auto_15092 ?auto_15088 ) ) ( not ( = ?auto_15103 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15073 ) ) ( not ( = ?auto_15070 ?auto_15090 ) ) ( not ( = ?auto_15071 ?auto_15073 ) ) ( not ( = ?auto_15071 ?auto_15090 ) ) ( not ( = ?auto_15073 ?auto_15103 ) ) ( not ( = ?auto_15073 ?auto_15101 ) ) ( not ( = ?auto_15095 ?auto_15102 ) ) ( not ( = ?auto_15095 ?auto_15087 ) ) ( not ( = ?auto_15104 ?auto_15092 ) ) ( not ( = ?auto_15104 ?auto_15088 ) ) ( not ( = ?auto_15090 ?auto_15103 ) ) ( not ( = ?auto_15090 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15074 ) ) ( not ( = ?auto_15070 ?auto_15089 ) ) ( not ( = ?auto_15071 ?auto_15074 ) ) ( not ( = ?auto_15071 ?auto_15089 ) ) ( not ( = ?auto_15072 ?auto_15074 ) ) ( not ( = ?auto_15072 ?auto_15089 ) ) ( not ( = ?auto_15074 ?auto_15090 ) ) ( not ( = ?auto_15074 ?auto_15103 ) ) ( not ( = ?auto_15074 ?auto_15101 ) ) ( not ( = ?auto_15111 ?auto_15095 ) ) ( not ( = ?auto_15111 ?auto_15102 ) ) ( not ( = ?auto_15111 ?auto_15087 ) ) ( not ( = ?auto_15100 ?auto_15104 ) ) ( not ( = ?auto_15100 ?auto_15092 ) ) ( not ( = ?auto_15100 ?auto_15088 ) ) ( not ( = ?auto_15089 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15103 ) ) ( not ( = ?auto_15089 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15075 ) ) ( not ( = ?auto_15070 ?auto_15106 ) ) ( not ( = ?auto_15071 ?auto_15075 ) ) ( not ( = ?auto_15071 ?auto_15106 ) ) ( not ( = ?auto_15072 ?auto_15075 ) ) ( not ( = ?auto_15072 ?auto_15106 ) ) ( not ( = ?auto_15073 ?auto_15075 ) ) ( not ( = ?auto_15073 ?auto_15106 ) ) ( not ( = ?auto_15075 ?auto_15089 ) ) ( not ( = ?auto_15075 ?auto_15090 ) ) ( not ( = ?auto_15075 ?auto_15103 ) ) ( not ( = ?auto_15075 ?auto_15101 ) ) ( not ( = ?auto_15106 ?auto_15089 ) ) ( not ( = ?auto_15106 ?auto_15090 ) ) ( not ( = ?auto_15106 ?auto_15103 ) ) ( not ( = ?auto_15106 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15076 ) ) ( not ( = ?auto_15070 ?auto_15107 ) ) ( not ( = ?auto_15071 ?auto_15076 ) ) ( not ( = ?auto_15071 ?auto_15107 ) ) ( not ( = ?auto_15072 ?auto_15076 ) ) ( not ( = ?auto_15072 ?auto_15107 ) ) ( not ( = ?auto_15073 ?auto_15076 ) ) ( not ( = ?auto_15073 ?auto_15107 ) ) ( not ( = ?auto_15074 ?auto_15076 ) ) ( not ( = ?auto_15074 ?auto_15107 ) ) ( not ( = ?auto_15076 ?auto_15106 ) ) ( not ( = ?auto_15076 ?auto_15089 ) ) ( not ( = ?auto_15076 ?auto_15090 ) ) ( not ( = ?auto_15076 ?auto_15103 ) ) ( not ( = ?auto_15076 ?auto_15101 ) ) ( not ( = ?auto_15110 ?auto_15087 ) ) ( not ( = ?auto_15110 ?auto_15111 ) ) ( not ( = ?auto_15110 ?auto_15095 ) ) ( not ( = ?auto_15110 ?auto_15102 ) ) ( not ( = ?auto_15112 ?auto_15088 ) ) ( not ( = ?auto_15112 ?auto_15100 ) ) ( not ( = ?auto_15112 ?auto_15104 ) ) ( not ( = ?auto_15112 ?auto_15092 ) ) ( not ( = ?auto_15107 ?auto_15106 ) ) ( not ( = ?auto_15107 ?auto_15089 ) ) ( not ( = ?auto_15107 ?auto_15090 ) ) ( not ( = ?auto_15107 ?auto_15103 ) ) ( not ( = ?auto_15107 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15077 ) ) ( not ( = ?auto_15070 ?auto_15091 ) ) ( not ( = ?auto_15071 ?auto_15077 ) ) ( not ( = ?auto_15071 ?auto_15091 ) ) ( not ( = ?auto_15072 ?auto_15077 ) ) ( not ( = ?auto_15072 ?auto_15091 ) ) ( not ( = ?auto_15073 ?auto_15077 ) ) ( not ( = ?auto_15073 ?auto_15091 ) ) ( not ( = ?auto_15074 ?auto_15077 ) ) ( not ( = ?auto_15074 ?auto_15091 ) ) ( not ( = ?auto_15075 ?auto_15077 ) ) ( not ( = ?auto_15075 ?auto_15091 ) ) ( not ( = ?auto_15077 ?auto_15107 ) ) ( not ( = ?auto_15077 ?auto_15106 ) ) ( not ( = ?auto_15077 ?auto_15089 ) ) ( not ( = ?auto_15077 ?auto_15090 ) ) ( not ( = ?auto_15077 ?auto_15103 ) ) ( not ( = ?auto_15077 ?auto_15101 ) ) ( not ( = ?auto_15091 ?auto_15107 ) ) ( not ( = ?auto_15091 ?auto_15106 ) ) ( not ( = ?auto_15091 ?auto_15089 ) ) ( not ( = ?auto_15091 ?auto_15090 ) ) ( not ( = ?auto_15091 ?auto_15103 ) ) ( not ( = ?auto_15091 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15078 ) ) ( not ( = ?auto_15070 ?auto_15094 ) ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( not ( = ?auto_15071 ?auto_15094 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15072 ?auto_15094 ) ) ( not ( = ?auto_15073 ?auto_15078 ) ) ( not ( = ?auto_15073 ?auto_15094 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15074 ?auto_15094 ) ) ( not ( = ?auto_15075 ?auto_15078 ) ) ( not ( = ?auto_15075 ?auto_15094 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) ( not ( = ?auto_15076 ?auto_15094 ) ) ( not ( = ?auto_15078 ?auto_15091 ) ) ( not ( = ?auto_15078 ?auto_15107 ) ) ( not ( = ?auto_15078 ?auto_15106 ) ) ( not ( = ?auto_15078 ?auto_15089 ) ) ( not ( = ?auto_15078 ?auto_15090 ) ) ( not ( = ?auto_15078 ?auto_15103 ) ) ( not ( = ?auto_15078 ?auto_15101 ) ) ( not ( = ?auto_15097 ?auto_15095 ) ) ( not ( = ?auto_15097 ?auto_15110 ) ) ( not ( = ?auto_15097 ?auto_15087 ) ) ( not ( = ?auto_15097 ?auto_15111 ) ) ( not ( = ?auto_15097 ?auto_15102 ) ) ( not ( = ?auto_15105 ?auto_15104 ) ) ( not ( = ?auto_15105 ?auto_15112 ) ) ( not ( = ?auto_15105 ?auto_15088 ) ) ( not ( = ?auto_15105 ?auto_15100 ) ) ( not ( = ?auto_15105 ?auto_15092 ) ) ( not ( = ?auto_15094 ?auto_15091 ) ) ( not ( = ?auto_15094 ?auto_15107 ) ) ( not ( = ?auto_15094 ?auto_15106 ) ) ( not ( = ?auto_15094 ?auto_15089 ) ) ( not ( = ?auto_15094 ?auto_15090 ) ) ( not ( = ?auto_15094 ?auto_15103 ) ) ( not ( = ?auto_15094 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15079 ) ) ( not ( = ?auto_15070 ?auto_15109 ) ) ( not ( = ?auto_15071 ?auto_15079 ) ) ( not ( = ?auto_15071 ?auto_15109 ) ) ( not ( = ?auto_15072 ?auto_15079 ) ) ( not ( = ?auto_15072 ?auto_15109 ) ) ( not ( = ?auto_15073 ?auto_15079 ) ) ( not ( = ?auto_15073 ?auto_15109 ) ) ( not ( = ?auto_15074 ?auto_15079 ) ) ( not ( = ?auto_15074 ?auto_15109 ) ) ( not ( = ?auto_15075 ?auto_15079 ) ) ( not ( = ?auto_15075 ?auto_15109 ) ) ( not ( = ?auto_15076 ?auto_15079 ) ) ( not ( = ?auto_15076 ?auto_15109 ) ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( not ( = ?auto_15077 ?auto_15109 ) ) ( not ( = ?auto_15079 ?auto_15094 ) ) ( not ( = ?auto_15079 ?auto_15091 ) ) ( not ( = ?auto_15079 ?auto_15107 ) ) ( not ( = ?auto_15079 ?auto_15106 ) ) ( not ( = ?auto_15079 ?auto_15089 ) ) ( not ( = ?auto_15079 ?auto_15090 ) ) ( not ( = ?auto_15079 ?auto_15103 ) ) ( not ( = ?auto_15079 ?auto_15101 ) ) ( not ( = ?auto_15109 ?auto_15094 ) ) ( not ( = ?auto_15109 ?auto_15091 ) ) ( not ( = ?auto_15109 ?auto_15107 ) ) ( not ( = ?auto_15109 ?auto_15106 ) ) ( not ( = ?auto_15109 ?auto_15089 ) ) ( not ( = ?auto_15109 ?auto_15090 ) ) ( not ( = ?auto_15109 ?auto_15103 ) ) ( not ( = ?auto_15109 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15080 ) ) ( not ( = ?auto_15070 ?auto_15093 ) ) ( not ( = ?auto_15071 ?auto_15080 ) ) ( not ( = ?auto_15071 ?auto_15093 ) ) ( not ( = ?auto_15072 ?auto_15080 ) ) ( not ( = ?auto_15072 ?auto_15093 ) ) ( not ( = ?auto_15073 ?auto_15080 ) ) ( not ( = ?auto_15073 ?auto_15093 ) ) ( not ( = ?auto_15074 ?auto_15080 ) ) ( not ( = ?auto_15074 ?auto_15093 ) ) ( not ( = ?auto_15075 ?auto_15080 ) ) ( not ( = ?auto_15075 ?auto_15093 ) ) ( not ( = ?auto_15076 ?auto_15080 ) ) ( not ( = ?auto_15076 ?auto_15093 ) ) ( not ( = ?auto_15077 ?auto_15080 ) ) ( not ( = ?auto_15077 ?auto_15093 ) ) ( not ( = ?auto_15078 ?auto_15080 ) ) ( not ( = ?auto_15078 ?auto_15093 ) ) ( not ( = ?auto_15080 ?auto_15109 ) ) ( not ( = ?auto_15080 ?auto_15094 ) ) ( not ( = ?auto_15080 ?auto_15091 ) ) ( not ( = ?auto_15080 ?auto_15107 ) ) ( not ( = ?auto_15080 ?auto_15106 ) ) ( not ( = ?auto_15080 ?auto_15089 ) ) ( not ( = ?auto_15080 ?auto_15090 ) ) ( not ( = ?auto_15080 ?auto_15103 ) ) ( not ( = ?auto_15080 ?auto_15101 ) ) ( not ( = ?auto_15099 ?auto_15087 ) ) ( not ( = ?auto_15099 ?auto_15097 ) ) ( not ( = ?auto_15099 ?auto_15095 ) ) ( not ( = ?auto_15099 ?auto_15110 ) ) ( not ( = ?auto_15099 ?auto_15111 ) ) ( not ( = ?auto_15099 ?auto_15102 ) ) ( not ( = ?auto_15108 ?auto_15088 ) ) ( not ( = ?auto_15108 ?auto_15105 ) ) ( not ( = ?auto_15108 ?auto_15104 ) ) ( not ( = ?auto_15108 ?auto_15112 ) ) ( not ( = ?auto_15108 ?auto_15100 ) ) ( not ( = ?auto_15108 ?auto_15092 ) ) ( not ( = ?auto_15093 ?auto_15109 ) ) ( not ( = ?auto_15093 ?auto_15094 ) ) ( not ( = ?auto_15093 ?auto_15091 ) ) ( not ( = ?auto_15093 ?auto_15107 ) ) ( not ( = ?auto_15093 ?auto_15106 ) ) ( not ( = ?auto_15093 ?auto_15089 ) ) ( not ( = ?auto_15093 ?auto_15090 ) ) ( not ( = ?auto_15093 ?auto_15103 ) ) ( not ( = ?auto_15093 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15081 ) ) ( not ( = ?auto_15070 ?auto_15113 ) ) ( not ( = ?auto_15071 ?auto_15081 ) ) ( not ( = ?auto_15071 ?auto_15113 ) ) ( not ( = ?auto_15072 ?auto_15081 ) ) ( not ( = ?auto_15072 ?auto_15113 ) ) ( not ( = ?auto_15073 ?auto_15081 ) ) ( not ( = ?auto_15073 ?auto_15113 ) ) ( not ( = ?auto_15074 ?auto_15081 ) ) ( not ( = ?auto_15074 ?auto_15113 ) ) ( not ( = ?auto_15075 ?auto_15081 ) ) ( not ( = ?auto_15075 ?auto_15113 ) ) ( not ( = ?auto_15076 ?auto_15081 ) ) ( not ( = ?auto_15076 ?auto_15113 ) ) ( not ( = ?auto_15077 ?auto_15081 ) ) ( not ( = ?auto_15077 ?auto_15113 ) ) ( not ( = ?auto_15078 ?auto_15081 ) ) ( not ( = ?auto_15078 ?auto_15113 ) ) ( not ( = ?auto_15079 ?auto_15081 ) ) ( not ( = ?auto_15079 ?auto_15113 ) ) ( not ( = ?auto_15081 ?auto_15093 ) ) ( not ( = ?auto_15081 ?auto_15109 ) ) ( not ( = ?auto_15081 ?auto_15094 ) ) ( not ( = ?auto_15081 ?auto_15091 ) ) ( not ( = ?auto_15081 ?auto_15107 ) ) ( not ( = ?auto_15081 ?auto_15106 ) ) ( not ( = ?auto_15081 ?auto_15089 ) ) ( not ( = ?auto_15081 ?auto_15090 ) ) ( not ( = ?auto_15081 ?auto_15103 ) ) ( not ( = ?auto_15081 ?auto_15101 ) ) ( not ( = ?auto_15098 ?auto_15099 ) ) ( not ( = ?auto_15098 ?auto_15087 ) ) ( not ( = ?auto_15098 ?auto_15097 ) ) ( not ( = ?auto_15098 ?auto_15095 ) ) ( not ( = ?auto_15098 ?auto_15110 ) ) ( not ( = ?auto_15098 ?auto_15111 ) ) ( not ( = ?auto_15098 ?auto_15102 ) ) ( not ( = ?auto_15096 ?auto_15108 ) ) ( not ( = ?auto_15096 ?auto_15088 ) ) ( not ( = ?auto_15096 ?auto_15105 ) ) ( not ( = ?auto_15096 ?auto_15104 ) ) ( not ( = ?auto_15096 ?auto_15112 ) ) ( not ( = ?auto_15096 ?auto_15100 ) ) ( not ( = ?auto_15096 ?auto_15092 ) ) ( not ( = ?auto_15113 ?auto_15093 ) ) ( not ( = ?auto_15113 ?auto_15109 ) ) ( not ( = ?auto_15113 ?auto_15094 ) ) ( not ( = ?auto_15113 ?auto_15091 ) ) ( not ( = ?auto_15113 ?auto_15107 ) ) ( not ( = ?auto_15113 ?auto_15106 ) ) ( not ( = ?auto_15113 ?auto_15089 ) ) ( not ( = ?auto_15113 ?auto_15090 ) ) ( not ( = ?auto_15113 ?auto_15103 ) ) ( not ( = ?auto_15113 ?auto_15101 ) ) ( not ( = ?auto_15070 ?auto_15082 ) ) ( not ( = ?auto_15070 ?auto_15086 ) ) ( not ( = ?auto_15071 ?auto_15082 ) ) ( not ( = ?auto_15071 ?auto_15086 ) ) ( not ( = ?auto_15072 ?auto_15082 ) ) ( not ( = ?auto_15072 ?auto_15086 ) ) ( not ( = ?auto_15073 ?auto_15082 ) ) ( not ( = ?auto_15073 ?auto_15086 ) ) ( not ( = ?auto_15074 ?auto_15082 ) ) ( not ( = ?auto_15074 ?auto_15086 ) ) ( not ( = ?auto_15075 ?auto_15082 ) ) ( not ( = ?auto_15075 ?auto_15086 ) ) ( not ( = ?auto_15076 ?auto_15082 ) ) ( not ( = ?auto_15076 ?auto_15086 ) ) ( not ( = ?auto_15077 ?auto_15082 ) ) ( not ( = ?auto_15077 ?auto_15086 ) ) ( not ( = ?auto_15078 ?auto_15082 ) ) ( not ( = ?auto_15078 ?auto_15086 ) ) ( not ( = ?auto_15079 ?auto_15082 ) ) ( not ( = ?auto_15079 ?auto_15086 ) ) ( not ( = ?auto_15080 ?auto_15082 ) ) ( not ( = ?auto_15080 ?auto_15086 ) ) ( not ( = ?auto_15082 ?auto_15113 ) ) ( not ( = ?auto_15082 ?auto_15093 ) ) ( not ( = ?auto_15082 ?auto_15109 ) ) ( not ( = ?auto_15082 ?auto_15094 ) ) ( not ( = ?auto_15082 ?auto_15091 ) ) ( not ( = ?auto_15082 ?auto_15107 ) ) ( not ( = ?auto_15082 ?auto_15106 ) ) ( not ( = ?auto_15082 ?auto_15089 ) ) ( not ( = ?auto_15082 ?auto_15090 ) ) ( not ( = ?auto_15082 ?auto_15103 ) ) ( not ( = ?auto_15082 ?auto_15101 ) ) ( not ( = ?auto_15086 ?auto_15113 ) ) ( not ( = ?auto_15086 ?auto_15093 ) ) ( not ( = ?auto_15086 ?auto_15109 ) ) ( not ( = ?auto_15086 ?auto_15094 ) ) ( not ( = ?auto_15086 ?auto_15091 ) ) ( not ( = ?auto_15086 ?auto_15107 ) ) ( not ( = ?auto_15086 ?auto_15106 ) ) ( not ( = ?auto_15086 ?auto_15089 ) ) ( not ( = ?auto_15086 ?auto_15090 ) ) ( not ( = ?auto_15086 ?auto_15103 ) ) ( not ( = ?auto_15086 ?auto_15101 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15070 ?auto_15071 ?auto_15072 ?auto_15073 ?auto_15074 ?auto_15075 ?auto_15076 ?auto_15077 ?auto_15078 ?auto_15079 ?auto_15080 ?auto_15081 )
      ( MAKE-1CRATE ?auto_15081 ?auto_15082 )
      ( MAKE-12CRATE-VERIFY ?auto_15070 ?auto_15071 ?auto_15072 ?auto_15073 ?auto_15074 ?auto_15075 ?auto_15076 ?auto_15077 ?auto_15078 ?auto_15079 ?auto_15080 ?auto_15081 ?auto_15082 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15138 - SURFACE
      ?auto_15139 - SURFACE
      ?auto_15140 - SURFACE
      ?auto_15141 - SURFACE
      ?auto_15142 - SURFACE
      ?auto_15143 - SURFACE
      ?auto_15144 - SURFACE
      ?auto_15145 - SURFACE
      ?auto_15146 - SURFACE
      ?auto_15147 - SURFACE
      ?auto_15148 - SURFACE
      ?auto_15149 - SURFACE
      ?auto_15150 - SURFACE
      ?auto_15151 - SURFACE
    )
    :vars
    (
      ?auto_15156 - HOIST
      ?auto_15152 - PLACE
      ?auto_15157 - PLACE
      ?auto_15154 - HOIST
      ?auto_15155 - SURFACE
      ?auto_15158 - PLACE
      ?auto_15172 - HOIST
      ?auto_15167 - SURFACE
      ?auto_15183 - PLACE
      ?auto_15165 - HOIST
      ?auto_15180 - SURFACE
      ?auto_15171 - PLACE
      ?auto_15176 - HOIST
      ?auto_15173 - SURFACE
      ?auto_15169 - SURFACE
      ?auto_15162 - PLACE
      ?auto_15168 - HOIST
      ?auto_15181 - SURFACE
      ?auto_15170 - PLACE
      ?auto_15175 - HOIST
      ?auto_15182 - SURFACE
      ?auto_15177 - PLACE
      ?auto_15161 - HOIST
      ?auto_15179 - SURFACE
      ?auto_15160 - SURFACE
      ?auto_15164 - PLACE
      ?auto_15163 - HOIST
      ?auto_15178 - SURFACE
      ?auto_15174 - SURFACE
      ?auto_15166 - SURFACE
      ?auto_15159 - SURFACE
      ?auto_15153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15156 ?auto_15152 ) ( IS-CRATE ?auto_15151 ) ( not ( = ?auto_15157 ?auto_15152 ) ) ( HOIST-AT ?auto_15154 ?auto_15157 ) ( SURFACE-AT ?auto_15151 ?auto_15157 ) ( ON ?auto_15151 ?auto_15155 ) ( CLEAR ?auto_15151 ) ( not ( = ?auto_15150 ?auto_15151 ) ) ( not ( = ?auto_15150 ?auto_15155 ) ) ( not ( = ?auto_15151 ?auto_15155 ) ) ( not ( = ?auto_15156 ?auto_15154 ) ) ( IS-CRATE ?auto_15150 ) ( not ( = ?auto_15158 ?auto_15152 ) ) ( HOIST-AT ?auto_15172 ?auto_15158 ) ( SURFACE-AT ?auto_15150 ?auto_15158 ) ( ON ?auto_15150 ?auto_15167 ) ( CLEAR ?auto_15150 ) ( not ( = ?auto_15149 ?auto_15150 ) ) ( not ( = ?auto_15149 ?auto_15167 ) ) ( not ( = ?auto_15150 ?auto_15167 ) ) ( not ( = ?auto_15156 ?auto_15172 ) ) ( IS-CRATE ?auto_15149 ) ( not ( = ?auto_15183 ?auto_15152 ) ) ( HOIST-AT ?auto_15165 ?auto_15183 ) ( AVAILABLE ?auto_15165 ) ( SURFACE-AT ?auto_15149 ?auto_15183 ) ( ON ?auto_15149 ?auto_15180 ) ( CLEAR ?auto_15149 ) ( not ( = ?auto_15148 ?auto_15149 ) ) ( not ( = ?auto_15148 ?auto_15180 ) ) ( not ( = ?auto_15149 ?auto_15180 ) ) ( not ( = ?auto_15156 ?auto_15165 ) ) ( IS-CRATE ?auto_15148 ) ( not ( = ?auto_15171 ?auto_15152 ) ) ( HOIST-AT ?auto_15176 ?auto_15171 ) ( AVAILABLE ?auto_15176 ) ( SURFACE-AT ?auto_15148 ?auto_15171 ) ( ON ?auto_15148 ?auto_15173 ) ( CLEAR ?auto_15148 ) ( not ( = ?auto_15147 ?auto_15148 ) ) ( not ( = ?auto_15147 ?auto_15173 ) ) ( not ( = ?auto_15148 ?auto_15173 ) ) ( not ( = ?auto_15156 ?auto_15176 ) ) ( IS-CRATE ?auto_15147 ) ( SURFACE-AT ?auto_15147 ?auto_15158 ) ( ON ?auto_15147 ?auto_15169 ) ( CLEAR ?auto_15147 ) ( not ( = ?auto_15146 ?auto_15147 ) ) ( not ( = ?auto_15146 ?auto_15169 ) ) ( not ( = ?auto_15147 ?auto_15169 ) ) ( IS-CRATE ?auto_15146 ) ( not ( = ?auto_15162 ?auto_15152 ) ) ( HOIST-AT ?auto_15168 ?auto_15162 ) ( AVAILABLE ?auto_15168 ) ( SURFACE-AT ?auto_15146 ?auto_15162 ) ( ON ?auto_15146 ?auto_15181 ) ( CLEAR ?auto_15146 ) ( not ( = ?auto_15145 ?auto_15146 ) ) ( not ( = ?auto_15145 ?auto_15181 ) ) ( not ( = ?auto_15146 ?auto_15181 ) ) ( not ( = ?auto_15156 ?auto_15168 ) ) ( IS-CRATE ?auto_15145 ) ( not ( = ?auto_15170 ?auto_15152 ) ) ( HOIST-AT ?auto_15175 ?auto_15170 ) ( SURFACE-AT ?auto_15145 ?auto_15170 ) ( ON ?auto_15145 ?auto_15182 ) ( CLEAR ?auto_15145 ) ( not ( = ?auto_15144 ?auto_15145 ) ) ( not ( = ?auto_15144 ?auto_15182 ) ) ( not ( = ?auto_15145 ?auto_15182 ) ) ( not ( = ?auto_15156 ?auto_15175 ) ) ( IS-CRATE ?auto_15144 ) ( not ( = ?auto_15177 ?auto_15152 ) ) ( HOIST-AT ?auto_15161 ?auto_15177 ) ( AVAILABLE ?auto_15161 ) ( SURFACE-AT ?auto_15144 ?auto_15177 ) ( ON ?auto_15144 ?auto_15179 ) ( CLEAR ?auto_15144 ) ( not ( = ?auto_15143 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15179 ) ) ( not ( = ?auto_15144 ?auto_15179 ) ) ( not ( = ?auto_15156 ?auto_15161 ) ) ( IS-CRATE ?auto_15143 ) ( SURFACE-AT ?auto_15143 ?auto_15158 ) ( ON ?auto_15143 ?auto_15160 ) ( CLEAR ?auto_15143 ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15160 ) ) ( not ( = ?auto_15143 ?auto_15160 ) ) ( IS-CRATE ?auto_15142 ) ( not ( = ?auto_15164 ?auto_15152 ) ) ( HOIST-AT ?auto_15163 ?auto_15164 ) ( AVAILABLE ?auto_15163 ) ( SURFACE-AT ?auto_15142 ?auto_15164 ) ( ON ?auto_15142 ?auto_15178 ) ( CLEAR ?auto_15142 ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15141 ?auto_15178 ) ) ( not ( = ?auto_15142 ?auto_15178 ) ) ( not ( = ?auto_15156 ?auto_15163 ) ) ( IS-CRATE ?auto_15141 ) ( AVAILABLE ?auto_15175 ) ( SURFACE-AT ?auto_15141 ?auto_15170 ) ( ON ?auto_15141 ?auto_15174 ) ( CLEAR ?auto_15141 ) ( not ( = ?auto_15140 ?auto_15141 ) ) ( not ( = ?auto_15140 ?auto_15174 ) ) ( not ( = ?auto_15141 ?auto_15174 ) ) ( IS-CRATE ?auto_15140 ) ( AVAILABLE ?auto_15154 ) ( SURFACE-AT ?auto_15140 ?auto_15157 ) ( ON ?auto_15140 ?auto_15166 ) ( CLEAR ?auto_15140 ) ( not ( = ?auto_15139 ?auto_15140 ) ) ( not ( = ?auto_15139 ?auto_15166 ) ) ( not ( = ?auto_15140 ?auto_15166 ) ) ( SURFACE-AT ?auto_15138 ?auto_15152 ) ( CLEAR ?auto_15138 ) ( IS-CRATE ?auto_15139 ) ( AVAILABLE ?auto_15156 ) ( AVAILABLE ?auto_15172 ) ( SURFACE-AT ?auto_15139 ?auto_15158 ) ( ON ?auto_15139 ?auto_15159 ) ( CLEAR ?auto_15139 ) ( TRUCK-AT ?auto_15153 ?auto_15152 ) ( not ( = ?auto_15138 ?auto_15139 ) ) ( not ( = ?auto_15138 ?auto_15159 ) ) ( not ( = ?auto_15139 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15140 ) ) ( not ( = ?auto_15138 ?auto_15166 ) ) ( not ( = ?auto_15140 ?auto_15159 ) ) ( not ( = ?auto_15157 ?auto_15158 ) ) ( not ( = ?auto_15154 ?auto_15172 ) ) ( not ( = ?auto_15166 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15141 ) ) ( not ( = ?auto_15138 ?auto_15174 ) ) ( not ( = ?auto_15139 ?auto_15141 ) ) ( not ( = ?auto_15139 ?auto_15174 ) ) ( not ( = ?auto_15141 ?auto_15166 ) ) ( not ( = ?auto_15141 ?auto_15159 ) ) ( not ( = ?auto_15170 ?auto_15157 ) ) ( not ( = ?auto_15170 ?auto_15158 ) ) ( not ( = ?auto_15175 ?auto_15154 ) ) ( not ( = ?auto_15175 ?auto_15172 ) ) ( not ( = ?auto_15174 ?auto_15166 ) ) ( not ( = ?auto_15174 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15142 ) ) ( not ( = ?auto_15138 ?auto_15178 ) ) ( not ( = ?auto_15139 ?auto_15142 ) ) ( not ( = ?auto_15139 ?auto_15178 ) ) ( not ( = ?auto_15140 ?auto_15142 ) ) ( not ( = ?auto_15140 ?auto_15178 ) ) ( not ( = ?auto_15142 ?auto_15174 ) ) ( not ( = ?auto_15142 ?auto_15166 ) ) ( not ( = ?auto_15142 ?auto_15159 ) ) ( not ( = ?auto_15164 ?auto_15170 ) ) ( not ( = ?auto_15164 ?auto_15157 ) ) ( not ( = ?auto_15164 ?auto_15158 ) ) ( not ( = ?auto_15163 ?auto_15175 ) ) ( not ( = ?auto_15163 ?auto_15154 ) ) ( not ( = ?auto_15163 ?auto_15172 ) ) ( not ( = ?auto_15178 ?auto_15174 ) ) ( not ( = ?auto_15178 ?auto_15166 ) ) ( not ( = ?auto_15178 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15143 ) ) ( not ( = ?auto_15138 ?auto_15160 ) ) ( not ( = ?auto_15139 ?auto_15143 ) ) ( not ( = ?auto_15139 ?auto_15160 ) ) ( not ( = ?auto_15140 ?auto_15143 ) ) ( not ( = ?auto_15140 ?auto_15160 ) ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15141 ?auto_15160 ) ) ( not ( = ?auto_15143 ?auto_15178 ) ) ( not ( = ?auto_15143 ?auto_15174 ) ) ( not ( = ?auto_15143 ?auto_15166 ) ) ( not ( = ?auto_15143 ?auto_15159 ) ) ( not ( = ?auto_15160 ?auto_15178 ) ) ( not ( = ?auto_15160 ?auto_15174 ) ) ( not ( = ?auto_15160 ?auto_15166 ) ) ( not ( = ?auto_15160 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15144 ) ) ( not ( = ?auto_15138 ?auto_15179 ) ) ( not ( = ?auto_15139 ?auto_15144 ) ) ( not ( = ?auto_15139 ?auto_15179 ) ) ( not ( = ?auto_15140 ?auto_15144 ) ) ( not ( = ?auto_15140 ?auto_15179 ) ) ( not ( = ?auto_15141 ?auto_15144 ) ) ( not ( = ?auto_15141 ?auto_15179 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15142 ?auto_15179 ) ) ( not ( = ?auto_15144 ?auto_15160 ) ) ( not ( = ?auto_15144 ?auto_15178 ) ) ( not ( = ?auto_15144 ?auto_15174 ) ) ( not ( = ?auto_15144 ?auto_15166 ) ) ( not ( = ?auto_15144 ?auto_15159 ) ) ( not ( = ?auto_15177 ?auto_15158 ) ) ( not ( = ?auto_15177 ?auto_15164 ) ) ( not ( = ?auto_15177 ?auto_15170 ) ) ( not ( = ?auto_15177 ?auto_15157 ) ) ( not ( = ?auto_15161 ?auto_15172 ) ) ( not ( = ?auto_15161 ?auto_15163 ) ) ( not ( = ?auto_15161 ?auto_15175 ) ) ( not ( = ?auto_15161 ?auto_15154 ) ) ( not ( = ?auto_15179 ?auto_15160 ) ) ( not ( = ?auto_15179 ?auto_15178 ) ) ( not ( = ?auto_15179 ?auto_15174 ) ) ( not ( = ?auto_15179 ?auto_15166 ) ) ( not ( = ?auto_15179 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15145 ) ) ( not ( = ?auto_15138 ?auto_15182 ) ) ( not ( = ?auto_15139 ?auto_15145 ) ) ( not ( = ?auto_15139 ?auto_15182 ) ) ( not ( = ?auto_15140 ?auto_15145 ) ) ( not ( = ?auto_15140 ?auto_15182 ) ) ( not ( = ?auto_15141 ?auto_15145 ) ) ( not ( = ?auto_15141 ?auto_15182 ) ) ( not ( = ?auto_15142 ?auto_15145 ) ) ( not ( = ?auto_15142 ?auto_15182 ) ) ( not ( = ?auto_15143 ?auto_15145 ) ) ( not ( = ?auto_15143 ?auto_15182 ) ) ( not ( = ?auto_15145 ?auto_15179 ) ) ( not ( = ?auto_15145 ?auto_15160 ) ) ( not ( = ?auto_15145 ?auto_15178 ) ) ( not ( = ?auto_15145 ?auto_15174 ) ) ( not ( = ?auto_15145 ?auto_15166 ) ) ( not ( = ?auto_15145 ?auto_15159 ) ) ( not ( = ?auto_15182 ?auto_15179 ) ) ( not ( = ?auto_15182 ?auto_15160 ) ) ( not ( = ?auto_15182 ?auto_15178 ) ) ( not ( = ?auto_15182 ?auto_15174 ) ) ( not ( = ?auto_15182 ?auto_15166 ) ) ( not ( = ?auto_15182 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15146 ) ) ( not ( = ?auto_15138 ?auto_15181 ) ) ( not ( = ?auto_15139 ?auto_15146 ) ) ( not ( = ?auto_15139 ?auto_15181 ) ) ( not ( = ?auto_15140 ?auto_15146 ) ) ( not ( = ?auto_15140 ?auto_15181 ) ) ( not ( = ?auto_15141 ?auto_15146 ) ) ( not ( = ?auto_15141 ?auto_15181 ) ) ( not ( = ?auto_15142 ?auto_15146 ) ) ( not ( = ?auto_15142 ?auto_15181 ) ) ( not ( = ?auto_15143 ?auto_15146 ) ) ( not ( = ?auto_15143 ?auto_15181 ) ) ( not ( = ?auto_15144 ?auto_15146 ) ) ( not ( = ?auto_15144 ?auto_15181 ) ) ( not ( = ?auto_15146 ?auto_15182 ) ) ( not ( = ?auto_15146 ?auto_15179 ) ) ( not ( = ?auto_15146 ?auto_15160 ) ) ( not ( = ?auto_15146 ?auto_15178 ) ) ( not ( = ?auto_15146 ?auto_15174 ) ) ( not ( = ?auto_15146 ?auto_15166 ) ) ( not ( = ?auto_15146 ?auto_15159 ) ) ( not ( = ?auto_15162 ?auto_15170 ) ) ( not ( = ?auto_15162 ?auto_15177 ) ) ( not ( = ?auto_15162 ?auto_15158 ) ) ( not ( = ?auto_15162 ?auto_15164 ) ) ( not ( = ?auto_15162 ?auto_15157 ) ) ( not ( = ?auto_15168 ?auto_15175 ) ) ( not ( = ?auto_15168 ?auto_15161 ) ) ( not ( = ?auto_15168 ?auto_15172 ) ) ( not ( = ?auto_15168 ?auto_15163 ) ) ( not ( = ?auto_15168 ?auto_15154 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15179 ) ) ( not ( = ?auto_15181 ?auto_15160 ) ) ( not ( = ?auto_15181 ?auto_15178 ) ) ( not ( = ?auto_15181 ?auto_15174 ) ) ( not ( = ?auto_15181 ?auto_15166 ) ) ( not ( = ?auto_15181 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15147 ) ) ( not ( = ?auto_15138 ?auto_15169 ) ) ( not ( = ?auto_15139 ?auto_15147 ) ) ( not ( = ?auto_15139 ?auto_15169 ) ) ( not ( = ?auto_15140 ?auto_15147 ) ) ( not ( = ?auto_15140 ?auto_15169 ) ) ( not ( = ?auto_15141 ?auto_15147 ) ) ( not ( = ?auto_15141 ?auto_15169 ) ) ( not ( = ?auto_15142 ?auto_15147 ) ) ( not ( = ?auto_15142 ?auto_15169 ) ) ( not ( = ?auto_15143 ?auto_15147 ) ) ( not ( = ?auto_15143 ?auto_15169 ) ) ( not ( = ?auto_15144 ?auto_15147 ) ) ( not ( = ?auto_15144 ?auto_15169 ) ) ( not ( = ?auto_15145 ?auto_15147 ) ) ( not ( = ?auto_15145 ?auto_15169 ) ) ( not ( = ?auto_15147 ?auto_15181 ) ) ( not ( = ?auto_15147 ?auto_15182 ) ) ( not ( = ?auto_15147 ?auto_15179 ) ) ( not ( = ?auto_15147 ?auto_15160 ) ) ( not ( = ?auto_15147 ?auto_15178 ) ) ( not ( = ?auto_15147 ?auto_15174 ) ) ( not ( = ?auto_15147 ?auto_15166 ) ) ( not ( = ?auto_15147 ?auto_15159 ) ) ( not ( = ?auto_15169 ?auto_15181 ) ) ( not ( = ?auto_15169 ?auto_15182 ) ) ( not ( = ?auto_15169 ?auto_15179 ) ) ( not ( = ?auto_15169 ?auto_15160 ) ) ( not ( = ?auto_15169 ?auto_15178 ) ) ( not ( = ?auto_15169 ?auto_15174 ) ) ( not ( = ?auto_15169 ?auto_15166 ) ) ( not ( = ?auto_15169 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15148 ) ) ( not ( = ?auto_15138 ?auto_15173 ) ) ( not ( = ?auto_15139 ?auto_15148 ) ) ( not ( = ?auto_15139 ?auto_15173 ) ) ( not ( = ?auto_15140 ?auto_15148 ) ) ( not ( = ?auto_15140 ?auto_15173 ) ) ( not ( = ?auto_15141 ?auto_15148 ) ) ( not ( = ?auto_15141 ?auto_15173 ) ) ( not ( = ?auto_15142 ?auto_15148 ) ) ( not ( = ?auto_15142 ?auto_15173 ) ) ( not ( = ?auto_15143 ?auto_15148 ) ) ( not ( = ?auto_15143 ?auto_15173 ) ) ( not ( = ?auto_15144 ?auto_15148 ) ) ( not ( = ?auto_15144 ?auto_15173 ) ) ( not ( = ?auto_15145 ?auto_15148 ) ) ( not ( = ?auto_15145 ?auto_15173 ) ) ( not ( = ?auto_15146 ?auto_15148 ) ) ( not ( = ?auto_15146 ?auto_15173 ) ) ( not ( = ?auto_15148 ?auto_15169 ) ) ( not ( = ?auto_15148 ?auto_15181 ) ) ( not ( = ?auto_15148 ?auto_15182 ) ) ( not ( = ?auto_15148 ?auto_15179 ) ) ( not ( = ?auto_15148 ?auto_15160 ) ) ( not ( = ?auto_15148 ?auto_15178 ) ) ( not ( = ?auto_15148 ?auto_15174 ) ) ( not ( = ?auto_15148 ?auto_15166 ) ) ( not ( = ?auto_15148 ?auto_15159 ) ) ( not ( = ?auto_15171 ?auto_15158 ) ) ( not ( = ?auto_15171 ?auto_15162 ) ) ( not ( = ?auto_15171 ?auto_15170 ) ) ( not ( = ?auto_15171 ?auto_15177 ) ) ( not ( = ?auto_15171 ?auto_15164 ) ) ( not ( = ?auto_15171 ?auto_15157 ) ) ( not ( = ?auto_15176 ?auto_15172 ) ) ( not ( = ?auto_15176 ?auto_15168 ) ) ( not ( = ?auto_15176 ?auto_15175 ) ) ( not ( = ?auto_15176 ?auto_15161 ) ) ( not ( = ?auto_15176 ?auto_15163 ) ) ( not ( = ?auto_15176 ?auto_15154 ) ) ( not ( = ?auto_15173 ?auto_15169 ) ) ( not ( = ?auto_15173 ?auto_15181 ) ) ( not ( = ?auto_15173 ?auto_15182 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15160 ) ) ( not ( = ?auto_15173 ?auto_15178 ) ) ( not ( = ?auto_15173 ?auto_15174 ) ) ( not ( = ?auto_15173 ?auto_15166 ) ) ( not ( = ?auto_15173 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15149 ) ) ( not ( = ?auto_15138 ?auto_15180 ) ) ( not ( = ?auto_15139 ?auto_15149 ) ) ( not ( = ?auto_15139 ?auto_15180 ) ) ( not ( = ?auto_15140 ?auto_15149 ) ) ( not ( = ?auto_15140 ?auto_15180 ) ) ( not ( = ?auto_15141 ?auto_15149 ) ) ( not ( = ?auto_15141 ?auto_15180 ) ) ( not ( = ?auto_15142 ?auto_15149 ) ) ( not ( = ?auto_15142 ?auto_15180 ) ) ( not ( = ?auto_15143 ?auto_15149 ) ) ( not ( = ?auto_15143 ?auto_15180 ) ) ( not ( = ?auto_15144 ?auto_15149 ) ) ( not ( = ?auto_15144 ?auto_15180 ) ) ( not ( = ?auto_15145 ?auto_15149 ) ) ( not ( = ?auto_15145 ?auto_15180 ) ) ( not ( = ?auto_15146 ?auto_15149 ) ) ( not ( = ?auto_15146 ?auto_15180 ) ) ( not ( = ?auto_15147 ?auto_15149 ) ) ( not ( = ?auto_15147 ?auto_15180 ) ) ( not ( = ?auto_15149 ?auto_15173 ) ) ( not ( = ?auto_15149 ?auto_15169 ) ) ( not ( = ?auto_15149 ?auto_15181 ) ) ( not ( = ?auto_15149 ?auto_15182 ) ) ( not ( = ?auto_15149 ?auto_15179 ) ) ( not ( = ?auto_15149 ?auto_15160 ) ) ( not ( = ?auto_15149 ?auto_15178 ) ) ( not ( = ?auto_15149 ?auto_15174 ) ) ( not ( = ?auto_15149 ?auto_15166 ) ) ( not ( = ?auto_15149 ?auto_15159 ) ) ( not ( = ?auto_15183 ?auto_15171 ) ) ( not ( = ?auto_15183 ?auto_15158 ) ) ( not ( = ?auto_15183 ?auto_15162 ) ) ( not ( = ?auto_15183 ?auto_15170 ) ) ( not ( = ?auto_15183 ?auto_15177 ) ) ( not ( = ?auto_15183 ?auto_15164 ) ) ( not ( = ?auto_15183 ?auto_15157 ) ) ( not ( = ?auto_15165 ?auto_15176 ) ) ( not ( = ?auto_15165 ?auto_15172 ) ) ( not ( = ?auto_15165 ?auto_15168 ) ) ( not ( = ?auto_15165 ?auto_15175 ) ) ( not ( = ?auto_15165 ?auto_15161 ) ) ( not ( = ?auto_15165 ?auto_15163 ) ) ( not ( = ?auto_15165 ?auto_15154 ) ) ( not ( = ?auto_15180 ?auto_15173 ) ) ( not ( = ?auto_15180 ?auto_15169 ) ) ( not ( = ?auto_15180 ?auto_15181 ) ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15180 ?auto_15179 ) ) ( not ( = ?auto_15180 ?auto_15160 ) ) ( not ( = ?auto_15180 ?auto_15178 ) ) ( not ( = ?auto_15180 ?auto_15174 ) ) ( not ( = ?auto_15180 ?auto_15166 ) ) ( not ( = ?auto_15180 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15150 ) ) ( not ( = ?auto_15138 ?auto_15167 ) ) ( not ( = ?auto_15139 ?auto_15150 ) ) ( not ( = ?auto_15139 ?auto_15167 ) ) ( not ( = ?auto_15140 ?auto_15150 ) ) ( not ( = ?auto_15140 ?auto_15167 ) ) ( not ( = ?auto_15141 ?auto_15150 ) ) ( not ( = ?auto_15141 ?auto_15167 ) ) ( not ( = ?auto_15142 ?auto_15150 ) ) ( not ( = ?auto_15142 ?auto_15167 ) ) ( not ( = ?auto_15143 ?auto_15150 ) ) ( not ( = ?auto_15143 ?auto_15167 ) ) ( not ( = ?auto_15144 ?auto_15150 ) ) ( not ( = ?auto_15144 ?auto_15167 ) ) ( not ( = ?auto_15145 ?auto_15150 ) ) ( not ( = ?auto_15145 ?auto_15167 ) ) ( not ( = ?auto_15146 ?auto_15150 ) ) ( not ( = ?auto_15146 ?auto_15167 ) ) ( not ( = ?auto_15147 ?auto_15150 ) ) ( not ( = ?auto_15147 ?auto_15167 ) ) ( not ( = ?auto_15148 ?auto_15150 ) ) ( not ( = ?auto_15148 ?auto_15167 ) ) ( not ( = ?auto_15150 ?auto_15180 ) ) ( not ( = ?auto_15150 ?auto_15173 ) ) ( not ( = ?auto_15150 ?auto_15169 ) ) ( not ( = ?auto_15150 ?auto_15181 ) ) ( not ( = ?auto_15150 ?auto_15182 ) ) ( not ( = ?auto_15150 ?auto_15179 ) ) ( not ( = ?auto_15150 ?auto_15160 ) ) ( not ( = ?auto_15150 ?auto_15178 ) ) ( not ( = ?auto_15150 ?auto_15174 ) ) ( not ( = ?auto_15150 ?auto_15166 ) ) ( not ( = ?auto_15150 ?auto_15159 ) ) ( not ( = ?auto_15167 ?auto_15180 ) ) ( not ( = ?auto_15167 ?auto_15173 ) ) ( not ( = ?auto_15167 ?auto_15169 ) ) ( not ( = ?auto_15167 ?auto_15181 ) ) ( not ( = ?auto_15167 ?auto_15182 ) ) ( not ( = ?auto_15167 ?auto_15179 ) ) ( not ( = ?auto_15167 ?auto_15160 ) ) ( not ( = ?auto_15167 ?auto_15178 ) ) ( not ( = ?auto_15167 ?auto_15174 ) ) ( not ( = ?auto_15167 ?auto_15166 ) ) ( not ( = ?auto_15167 ?auto_15159 ) ) ( not ( = ?auto_15138 ?auto_15151 ) ) ( not ( = ?auto_15138 ?auto_15155 ) ) ( not ( = ?auto_15139 ?auto_15151 ) ) ( not ( = ?auto_15139 ?auto_15155 ) ) ( not ( = ?auto_15140 ?auto_15151 ) ) ( not ( = ?auto_15140 ?auto_15155 ) ) ( not ( = ?auto_15141 ?auto_15151 ) ) ( not ( = ?auto_15141 ?auto_15155 ) ) ( not ( = ?auto_15142 ?auto_15151 ) ) ( not ( = ?auto_15142 ?auto_15155 ) ) ( not ( = ?auto_15143 ?auto_15151 ) ) ( not ( = ?auto_15143 ?auto_15155 ) ) ( not ( = ?auto_15144 ?auto_15151 ) ) ( not ( = ?auto_15144 ?auto_15155 ) ) ( not ( = ?auto_15145 ?auto_15151 ) ) ( not ( = ?auto_15145 ?auto_15155 ) ) ( not ( = ?auto_15146 ?auto_15151 ) ) ( not ( = ?auto_15146 ?auto_15155 ) ) ( not ( = ?auto_15147 ?auto_15151 ) ) ( not ( = ?auto_15147 ?auto_15155 ) ) ( not ( = ?auto_15148 ?auto_15151 ) ) ( not ( = ?auto_15148 ?auto_15155 ) ) ( not ( = ?auto_15149 ?auto_15151 ) ) ( not ( = ?auto_15149 ?auto_15155 ) ) ( not ( = ?auto_15151 ?auto_15167 ) ) ( not ( = ?auto_15151 ?auto_15180 ) ) ( not ( = ?auto_15151 ?auto_15173 ) ) ( not ( = ?auto_15151 ?auto_15169 ) ) ( not ( = ?auto_15151 ?auto_15181 ) ) ( not ( = ?auto_15151 ?auto_15182 ) ) ( not ( = ?auto_15151 ?auto_15179 ) ) ( not ( = ?auto_15151 ?auto_15160 ) ) ( not ( = ?auto_15151 ?auto_15178 ) ) ( not ( = ?auto_15151 ?auto_15174 ) ) ( not ( = ?auto_15151 ?auto_15166 ) ) ( not ( = ?auto_15151 ?auto_15159 ) ) ( not ( = ?auto_15155 ?auto_15167 ) ) ( not ( = ?auto_15155 ?auto_15180 ) ) ( not ( = ?auto_15155 ?auto_15173 ) ) ( not ( = ?auto_15155 ?auto_15169 ) ) ( not ( = ?auto_15155 ?auto_15181 ) ) ( not ( = ?auto_15155 ?auto_15182 ) ) ( not ( = ?auto_15155 ?auto_15179 ) ) ( not ( = ?auto_15155 ?auto_15160 ) ) ( not ( = ?auto_15155 ?auto_15178 ) ) ( not ( = ?auto_15155 ?auto_15174 ) ) ( not ( = ?auto_15155 ?auto_15166 ) ) ( not ( = ?auto_15155 ?auto_15159 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15138 ?auto_15139 ?auto_15140 ?auto_15141 ?auto_15142 ?auto_15143 ?auto_15144 ?auto_15145 ?auto_15146 ?auto_15147 ?auto_15148 ?auto_15149 ?auto_15150 )
      ( MAKE-1CRATE ?auto_15150 ?auto_15151 )
      ( MAKE-13CRATE-VERIFY ?auto_15138 ?auto_15139 ?auto_15140 ?auto_15141 ?auto_15142 ?auto_15143 ?auto_15144 ?auto_15145 ?auto_15146 ?auto_15147 ?auto_15148 ?auto_15149 ?auto_15150 ?auto_15151 ) )
  )

)

