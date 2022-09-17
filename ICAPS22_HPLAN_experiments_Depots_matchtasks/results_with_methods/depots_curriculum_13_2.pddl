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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14604 - SURFACE
      ?auto_14605 - SURFACE
    )
    :vars
    (
      ?auto_14606 - HOIST
      ?auto_14607 - PLACE
      ?auto_14609 - PLACE
      ?auto_14610 - HOIST
      ?auto_14611 - SURFACE
      ?auto_14608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14606 ?auto_14607 ) ( SURFACE-AT ?auto_14604 ?auto_14607 ) ( CLEAR ?auto_14604 ) ( IS-CRATE ?auto_14605 ) ( AVAILABLE ?auto_14606 ) ( not ( = ?auto_14609 ?auto_14607 ) ) ( HOIST-AT ?auto_14610 ?auto_14609 ) ( AVAILABLE ?auto_14610 ) ( SURFACE-AT ?auto_14605 ?auto_14609 ) ( ON ?auto_14605 ?auto_14611 ) ( CLEAR ?auto_14605 ) ( TRUCK-AT ?auto_14608 ?auto_14607 ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14611 ) ) ( not ( = ?auto_14605 ?auto_14611 ) ) ( not ( = ?auto_14606 ?auto_14610 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14608 ?auto_14607 ?auto_14609 )
      ( !LIFT ?auto_14610 ?auto_14605 ?auto_14611 ?auto_14609 )
      ( !LOAD ?auto_14610 ?auto_14605 ?auto_14608 ?auto_14609 )
      ( !DRIVE ?auto_14608 ?auto_14609 ?auto_14607 )
      ( !UNLOAD ?auto_14606 ?auto_14605 ?auto_14608 ?auto_14607 )
      ( !DROP ?auto_14606 ?auto_14605 ?auto_14604 ?auto_14607 )
      ( MAKE-1CRATE-VERIFY ?auto_14604 ?auto_14605 ) )
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
      ?auto_14620 - HOIST
      ?auto_14623 - PLACE
      ?auto_14619 - PLACE
      ?auto_14621 - HOIST
      ?auto_14618 - SURFACE
      ?auto_14625 - PLACE
      ?auto_14624 - HOIST
      ?auto_14626 - SURFACE
      ?auto_14622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14620 ?auto_14623 ) ( IS-CRATE ?auto_14617 ) ( not ( = ?auto_14619 ?auto_14623 ) ) ( HOIST-AT ?auto_14621 ?auto_14619 ) ( AVAILABLE ?auto_14621 ) ( SURFACE-AT ?auto_14617 ?auto_14619 ) ( ON ?auto_14617 ?auto_14618 ) ( CLEAR ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( not ( = ?auto_14616 ?auto_14618 ) ) ( not ( = ?auto_14617 ?auto_14618 ) ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( SURFACE-AT ?auto_14615 ?auto_14623 ) ( CLEAR ?auto_14615 ) ( IS-CRATE ?auto_14616 ) ( AVAILABLE ?auto_14620 ) ( not ( = ?auto_14625 ?auto_14623 ) ) ( HOIST-AT ?auto_14624 ?auto_14625 ) ( AVAILABLE ?auto_14624 ) ( SURFACE-AT ?auto_14616 ?auto_14625 ) ( ON ?auto_14616 ?auto_14626 ) ( CLEAR ?auto_14616 ) ( TRUCK-AT ?auto_14622 ?auto_14623 ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14626 ) ) ( not ( = ?auto_14616 ?auto_14626 ) ) ( not ( = ?auto_14620 ?auto_14624 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14618 ) ) ( not ( = ?auto_14617 ?auto_14626 ) ) ( not ( = ?auto_14619 ?auto_14625 ) ) ( not ( = ?auto_14621 ?auto_14624 ) ) ( not ( = ?auto_14618 ?auto_14626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14615 ?auto_14616 )
      ( MAKE-1CRATE ?auto_14616 ?auto_14617 )
      ( MAKE-2CRATE-VERIFY ?auto_14615 ?auto_14616 ?auto_14617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14629 - SURFACE
      ?auto_14630 - SURFACE
    )
    :vars
    (
      ?auto_14631 - HOIST
      ?auto_14632 - PLACE
      ?auto_14634 - PLACE
      ?auto_14635 - HOIST
      ?auto_14636 - SURFACE
      ?auto_14633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14631 ?auto_14632 ) ( SURFACE-AT ?auto_14629 ?auto_14632 ) ( CLEAR ?auto_14629 ) ( IS-CRATE ?auto_14630 ) ( AVAILABLE ?auto_14631 ) ( not ( = ?auto_14634 ?auto_14632 ) ) ( HOIST-AT ?auto_14635 ?auto_14634 ) ( AVAILABLE ?auto_14635 ) ( SURFACE-AT ?auto_14630 ?auto_14634 ) ( ON ?auto_14630 ?auto_14636 ) ( CLEAR ?auto_14630 ) ( TRUCK-AT ?auto_14633 ?auto_14632 ) ( not ( = ?auto_14629 ?auto_14630 ) ) ( not ( = ?auto_14629 ?auto_14636 ) ) ( not ( = ?auto_14630 ?auto_14636 ) ) ( not ( = ?auto_14631 ?auto_14635 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14633 ?auto_14632 ?auto_14634 )
      ( !LIFT ?auto_14635 ?auto_14630 ?auto_14636 ?auto_14634 )
      ( !LOAD ?auto_14635 ?auto_14630 ?auto_14633 ?auto_14634 )
      ( !DRIVE ?auto_14633 ?auto_14634 ?auto_14632 )
      ( !UNLOAD ?auto_14631 ?auto_14630 ?auto_14633 ?auto_14632 )
      ( !DROP ?auto_14631 ?auto_14630 ?auto_14629 ?auto_14632 )
      ( MAKE-1CRATE-VERIFY ?auto_14629 ?auto_14630 ) )
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
      ?auto_14649 - HOIST
      ?auto_14650 - PLACE
      ?auto_14646 - PLACE
      ?auto_14648 - HOIST
      ?auto_14647 - SURFACE
      ?auto_14656 - PLACE
      ?auto_14654 - HOIST
      ?auto_14655 - SURFACE
      ?auto_14653 - PLACE
      ?auto_14652 - HOIST
      ?auto_14651 - SURFACE
      ?auto_14645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14649 ?auto_14650 ) ( IS-CRATE ?auto_14644 ) ( not ( = ?auto_14646 ?auto_14650 ) ) ( HOIST-AT ?auto_14648 ?auto_14646 ) ( AVAILABLE ?auto_14648 ) ( SURFACE-AT ?auto_14644 ?auto_14646 ) ( ON ?auto_14644 ?auto_14647 ) ( CLEAR ?auto_14644 ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( not ( = ?auto_14643 ?auto_14647 ) ) ( not ( = ?auto_14644 ?auto_14647 ) ) ( not ( = ?auto_14649 ?auto_14648 ) ) ( IS-CRATE ?auto_14643 ) ( not ( = ?auto_14656 ?auto_14650 ) ) ( HOIST-AT ?auto_14654 ?auto_14656 ) ( AVAILABLE ?auto_14654 ) ( SURFACE-AT ?auto_14643 ?auto_14656 ) ( ON ?auto_14643 ?auto_14655 ) ( CLEAR ?auto_14643 ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14655 ) ) ( not ( = ?auto_14643 ?auto_14655 ) ) ( not ( = ?auto_14649 ?auto_14654 ) ) ( SURFACE-AT ?auto_14641 ?auto_14650 ) ( CLEAR ?auto_14641 ) ( IS-CRATE ?auto_14642 ) ( AVAILABLE ?auto_14649 ) ( not ( = ?auto_14653 ?auto_14650 ) ) ( HOIST-AT ?auto_14652 ?auto_14653 ) ( AVAILABLE ?auto_14652 ) ( SURFACE-AT ?auto_14642 ?auto_14653 ) ( ON ?auto_14642 ?auto_14651 ) ( CLEAR ?auto_14642 ) ( TRUCK-AT ?auto_14645 ?auto_14650 ) ( not ( = ?auto_14641 ?auto_14642 ) ) ( not ( = ?auto_14641 ?auto_14651 ) ) ( not ( = ?auto_14642 ?auto_14651 ) ) ( not ( = ?auto_14649 ?auto_14652 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( not ( = ?auto_14641 ?auto_14655 ) ) ( not ( = ?auto_14643 ?auto_14651 ) ) ( not ( = ?auto_14656 ?auto_14653 ) ) ( not ( = ?auto_14654 ?auto_14652 ) ) ( not ( = ?auto_14655 ?auto_14651 ) ) ( not ( = ?auto_14641 ?auto_14644 ) ) ( not ( = ?auto_14641 ?auto_14647 ) ) ( not ( = ?auto_14642 ?auto_14644 ) ) ( not ( = ?auto_14642 ?auto_14647 ) ) ( not ( = ?auto_14644 ?auto_14655 ) ) ( not ( = ?auto_14644 ?auto_14651 ) ) ( not ( = ?auto_14646 ?auto_14656 ) ) ( not ( = ?auto_14646 ?auto_14653 ) ) ( not ( = ?auto_14648 ?auto_14654 ) ) ( not ( = ?auto_14648 ?auto_14652 ) ) ( not ( = ?auto_14647 ?auto_14655 ) ) ( not ( = ?auto_14647 ?auto_14651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14641 ?auto_14642 ?auto_14643 )
      ( MAKE-1CRATE ?auto_14643 ?auto_14644 )
      ( MAKE-3CRATE-VERIFY ?auto_14641 ?auto_14642 ?auto_14643 ?auto_14644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14659 - SURFACE
      ?auto_14660 - SURFACE
    )
    :vars
    (
      ?auto_14661 - HOIST
      ?auto_14662 - PLACE
      ?auto_14664 - PLACE
      ?auto_14665 - HOIST
      ?auto_14666 - SURFACE
      ?auto_14663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14661 ?auto_14662 ) ( SURFACE-AT ?auto_14659 ?auto_14662 ) ( CLEAR ?auto_14659 ) ( IS-CRATE ?auto_14660 ) ( AVAILABLE ?auto_14661 ) ( not ( = ?auto_14664 ?auto_14662 ) ) ( HOIST-AT ?auto_14665 ?auto_14664 ) ( AVAILABLE ?auto_14665 ) ( SURFACE-AT ?auto_14660 ?auto_14664 ) ( ON ?auto_14660 ?auto_14666 ) ( CLEAR ?auto_14660 ) ( TRUCK-AT ?auto_14663 ?auto_14662 ) ( not ( = ?auto_14659 ?auto_14660 ) ) ( not ( = ?auto_14659 ?auto_14666 ) ) ( not ( = ?auto_14660 ?auto_14666 ) ) ( not ( = ?auto_14661 ?auto_14665 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14663 ?auto_14662 ?auto_14664 )
      ( !LIFT ?auto_14665 ?auto_14660 ?auto_14666 ?auto_14664 )
      ( !LOAD ?auto_14665 ?auto_14660 ?auto_14663 ?auto_14664 )
      ( !DRIVE ?auto_14663 ?auto_14664 ?auto_14662 )
      ( !UNLOAD ?auto_14661 ?auto_14660 ?auto_14663 ?auto_14662 )
      ( !DROP ?auto_14661 ?auto_14660 ?auto_14659 ?auto_14662 )
      ( MAKE-1CRATE-VERIFY ?auto_14659 ?auto_14660 ) )
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
      ?auto_14680 - HOIST
      ?auto_14679 - PLACE
      ?auto_14681 - PLACE
      ?auto_14677 - HOIST
      ?auto_14682 - SURFACE
      ?auto_14690 - PLACE
      ?auto_14689 - HOIST
      ?auto_14684 - SURFACE
      ?auto_14686 - PLACE
      ?auto_14688 - HOIST
      ?auto_14683 - SURFACE
      ?auto_14687 - PLACE
      ?auto_14691 - HOIST
      ?auto_14685 - SURFACE
      ?auto_14678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14680 ?auto_14679 ) ( IS-CRATE ?auto_14676 ) ( not ( = ?auto_14681 ?auto_14679 ) ) ( HOIST-AT ?auto_14677 ?auto_14681 ) ( AVAILABLE ?auto_14677 ) ( SURFACE-AT ?auto_14676 ?auto_14681 ) ( ON ?auto_14676 ?auto_14682 ) ( CLEAR ?auto_14676 ) ( not ( = ?auto_14675 ?auto_14676 ) ) ( not ( = ?auto_14675 ?auto_14682 ) ) ( not ( = ?auto_14676 ?auto_14682 ) ) ( not ( = ?auto_14680 ?auto_14677 ) ) ( IS-CRATE ?auto_14675 ) ( not ( = ?auto_14690 ?auto_14679 ) ) ( HOIST-AT ?auto_14689 ?auto_14690 ) ( AVAILABLE ?auto_14689 ) ( SURFACE-AT ?auto_14675 ?auto_14690 ) ( ON ?auto_14675 ?auto_14684 ) ( CLEAR ?auto_14675 ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14674 ?auto_14684 ) ) ( not ( = ?auto_14675 ?auto_14684 ) ) ( not ( = ?auto_14680 ?auto_14689 ) ) ( IS-CRATE ?auto_14674 ) ( not ( = ?auto_14686 ?auto_14679 ) ) ( HOIST-AT ?auto_14688 ?auto_14686 ) ( AVAILABLE ?auto_14688 ) ( SURFACE-AT ?auto_14674 ?auto_14686 ) ( ON ?auto_14674 ?auto_14683 ) ( CLEAR ?auto_14674 ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14683 ) ) ( not ( = ?auto_14674 ?auto_14683 ) ) ( not ( = ?auto_14680 ?auto_14688 ) ) ( SURFACE-AT ?auto_14672 ?auto_14679 ) ( CLEAR ?auto_14672 ) ( IS-CRATE ?auto_14673 ) ( AVAILABLE ?auto_14680 ) ( not ( = ?auto_14687 ?auto_14679 ) ) ( HOIST-AT ?auto_14691 ?auto_14687 ) ( AVAILABLE ?auto_14691 ) ( SURFACE-AT ?auto_14673 ?auto_14687 ) ( ON ?auto_14673 ?auto_14685 ) ( CLEAR ?auto_14673 ) ( TRUCK-AT ?auto_14678 ?auto_14679 ) ( not ( = ?auto_14672 ?auto_14673 ) ) ( not ( = ?auto_14672 ?auto_14685 ) ) ( not ( = ?auto_14673 ?auto_14685 ) ) ( not ( = ?auto_14680 ?auto_14691 ) ) ( not ( = ?auto_14672 ?auto_14674 ) ) ( not ( = ?auto_14672 ?auto_14683 ) ) ( not ( = ?auto_14674 ?auto_14685 ) ) ( not ( = ?auto_14686 ?auto_14687 ) ) ( not ( = ?auto_14688 ?auto_14691 ) ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( not ( = ?auto_14672 ?auto_14675 ) ) ( not ( = ?auto_14672 ?auto_14684 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14684 ) ) ( not ( = ?auto_14675 ?auto_14683 ) ) ( not ( = ?auto_14675 ?auto_14685 ) ) ( not ( = ?auto_14690 ?auto_14686 ) ) ( not ( = ?auto_14690 ?auto_14687 ) ) ( not ( = ?auto_14689 ?auto_14688 ) ) ( not ( = ?auto_14689 ?auto_14691 ) ) ( not ( = ?auto_14684 ?auto_14683 ) ) ( not ( = ?auto_14684 ?auto_14685 ) ) ( not ( = ?auto_14672 ?auto_14676 ) ) ( not ( = ?auto_14672 ?auto_14682 ) ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( not ( = ?auto_14673 ?auto_14682 ) ) ( not ( = ?auto_14674 ?auto_14676 ) ) ( not ( = ?auto_14674 ?auto_14682 ) ) ( not ( = ?auto_14676 ?auto_14684 ) ) ( not ( = ?auto_14676 ?auto_14683 ) ) ( not ( = ?auto_14676 ?auto_14685 ) ) ( not ( = ?auto_14681 ?auto_14690 ) ) ( not ( = ?auto_14681 ?auto_14686 ) ) ( not ( = ?auto_14681 ?auto_14687 ) ) ( not ( = ?auto_14677 ?auto_14689 ) ) ( not ( = ?auto_14677 ?auto_14688 ) ) ( not ( = ?auto_14677 ?auto_14691 ) ) ( not ( = ?auto_14682 ?auto_14684 ) ) ( not ( = ?auto_14682 ?auto_14683 ) ) ( not ( = ?auto_14682 ?auto_14685 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14672 ?auto_14673 ?auto_14674 ?auto_14675 )
      ( MAKE-1CRATE ?auto_14675 ?auto_14676 )
      ( MAKE-4CRATE-VERIFY ?auto_14672 ?auto_14673 ?auto_14674 ?auto_14675 ?auto_14676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14694 - SURFACE
      ?auto_14695 - SURFACE
    )
    :vars
    (
      ?auto_14696 - HOIST
      ?auto_14697 - PLACE
      ?auto_14699 - PLACE
      ?auto_14700 - HOIST
      ?auto_14701 - SURFACE
      ?auto_14698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14696 ?auto_14697 ) ( SURFACE-AT ?auto_14694 ?auto_14697 ) ( CLEAR ?auto_14694 ) ( IS-CRATE ?auto_14695 ) ( AVAILABLE ?auto_14696 ) ( not ( = ?auto_14699 ?auto_14697 ) ) ( HOIST-AT ?auto_14700 ?auto_14699 ) ( AVAILABLE ?auto_14700 ) ( SURFACE-AT ?auto_14695 ?auto_14699 ) ( ON ?auto_14695 ?auto_14701 ) ( CLEAR ?auto_14695 ) ( TRUCK-AT ?auto_14698 ?auto_14697 ) ( not ( = ?auto_14694 ?auto_14695 ) ) ( not ( = ?auto_14694 ?auto_14701 ) ) ( not ( = ?auto_14695 ?auto_14701 ) ) ( not ( = ?auto_14696 ?auto_14700 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14698 ?auto_14697 ?auto_14699 )
      ( !LIFT ?auto_14700 ?auto_14695 ?auto_14701 ?auto_14699 )
      ( !LOAD ?auto_14700 ?auto_14695 ?auto_14698 ?auto_14699 )
      ( !DRIVE ?auto_14698 ?auto_14699 ?auto_14697 )
      ( !UNLOAD ?auto_14696 ?auto_14695 ?auto_14698 ?auto_14697 )
      ( !DROP ?auto_14696 ?auto_14695 ?auto_14694 ?auto_14697 )
      ( MAKE-1CRATE-VERIFY ?auto_14694 ?auto_14695 ) )
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
      ?auto_14716 - HOIST
      ?auto_14714 - PLACE
      ?auto_14715 - PLACE
      ?auto_14717 - HOIST
      ?auto_14718 - SURFACE
      ?auto_14724 - PLACE
      ?auto_14729 - HOIST
      ?auto_14725 - SURFACE
      ?auto_14728 - PLACE
      ?auto_14720 - HOIST
      ?auto_14726 - SURFACE
      ?auto_14727 - PLACE
      ?auto_14723 - HOIST
      ?auto_14722 - SURFACE
      ?auto_14721 - SURFACE
      ?auto_14719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14716 ?auto_14714 ) ( IS-CRATE ?auto_14713 ) ( not ( = ?auto_14715 ?auto_14714 ) ) ( HOIST-AT ?auto_14717 ?auto_14715 ) ( SURFACE-AT ?auto_14713 ?auto_14715 ) ( ON ?auto_14713 ?auto_14718 ) ( CLEAR ?auto_14713 ) ( not ( = ?auto_14712 ?auto_14713 ) ) ( not ( = ?auto_14712 ?auto_14718 ) ) ( not ( = ?auto_14713 ?auto_14718 ) ) ( not ( = ?auto_14716 ?auto_14717 ) ) ( IS-CRATE ?auto_14712 ) ( not ( = ?auto_14724 ?auto_14714 ) ) ( HOIST-AT ?auto_14729 ?auto_14724 ) ( AVAILABLE ?auto_14729 ) ( SURFACE-AT ?auto_14712 ?auto_14724 ) ( ON ?auto_14712 ?auto_14725 ) ( CLEAR ?auto_14712 ) ( not ( = ?auto_14711 ?auto_14712 ) ) ( not ( = ?auto_14711 ?auto_14725 ) ) ( not ( = ?auto_14712 ?auto_14725 ) ) ( not ( = ?auto_14716 ?auto_14729 ) ) ( IS-CRATE ?auto_14711 ) ( not ( = ?auto_14728 ?auto_14714 ) ) ( HOIST-AT ?auto_14720 ?auto_14728 ) ( AVAILABLE ?auto_14720 ) ( SURFACE-AT ?auto_14711 ?auto_14728 ) ( ON ?auto_14711 ?auto_14726 ) ( CLEAR ?auto_14711 ) ( not ( = ?auto_14710 ?auto_14711 ) ) ( not ( = ?auto_14710 ?auto_14726 ) ) ( not ( = ?auto_14711 ?auto_14726 ) ) ( not ( = ?auto_14716 ?auto_14720 ) ) ( IS-CRATE ?auto_14710 ) ( not ( = ?auto_14727 ?auto_14714 ) ) ( HOIST-AT ?auto_14723 ?auto_14727 ) ( AVAILABLE ?auto_14723 ) ( SURFACE-AT ?auto_14710 ?auto_14727 ) ( ON ?auto_14710 ?auto_14722 ) ( CLEAR ?auto_14710 ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( not ( = ?auto_14709 ?auto_14722 ) ) ( not ( = ?auto_14710 ?auto_14722 ) ) ( not ( = ?auto_14716 ?auto_14723 ) ) ( SURFACE-AT ?auto_14708 ?auto_14714 ) ( CLEAR ?auto_14708 ) ( IS-CRATE ?auto_14709 ) ( AVAILABLE ?auto_14716 ) ( AVAILABLE ?auto_14717 ) ( SURFACE-AT ?auto_14709 ?auto_14715 ) ( ON ?auto_14709 ?auto_14721 ) ( CLEAR ?auto_14709 ) ( TRUCK-AT ?auto_14719 ?auto_14714 ) ( not ( = ?auto_14708 ?auto_14709 ) ) ( not ( = ?auto_14708 ?auto_14721 ) ) ( not ( = ?auto_14709 ?auto_14721 ) ) ( not ( = ?auto_14708 ?auto_14710 ) ) ( not ( = ?auto_14708 ?auto_14722 ) ) ( not ( = ?auto_14710 ?auto_14721 ) ) ( not ( = ?auto_14727 ?auto_14715 ) ) ( not ( = ?auto_14723 ?auto_14717 ) ) ( not ( = ?auto_14722 ?auto_14721 ) ) ( not ( = ?auto_14708 ?auto_14711 ) ) ( not ( = ?auto_14708 ?auto_14726 ) ) ( not ( = ?auto_14709 ?auto_14711 ) ) ( not ( = ?auto_14709 ?auto_14726 ) ) ( not ( = ?auto_14711 ?auto_14722 ) ) ( not ( = ?auto_14711 ?auto_14721 ) ) ( not ( = ?auto_14728 ?auto_14727 ) ) ( not ( = ?auto_14728 ?auto_14715 ) ) ( not ( = ?auto_14720 ?auto_14723 ) ) ( not ( = ?auto_14720 ?auto_14717 ) ) ( not ( = ?auto_14726 ?auto_14722 ) ) ( not ( = ?auto_14726 ?auto_14721 ) ) ( not ( = ?auto_14708 ?auto_14712 ) ) ( not ( = ?auto_14708 ?auto_14725 ) ) ( not ( = ?auto_14709 ?auto_14712 ) ) ( not ( = ?auto_14709 ?auto_14725 ) ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14710 ?auto_14725 ) ) ( not ( = ?auto_14712 ?auto_14726 ) ) ( not ( = ?auto_14712 ?auto_14722 ) ) ( not ( = ?auto_14712 ?auto_14721 ) ) ( not ( = ?auto_14724 ?auto_14728 ) ) ( not ( = ?auto_14724 ?auto_14727 ) ) ( not ( = ?auto_14724 ?auto_14715 ) ) ( not ( = ?auto_14729 ?auto_14720 ) ) ( not ( = ?auto_14729 ?auto_14723 ) ) ( not ( = ?auto_14729 ?auto_14717 ) ) ( not ( = ?auto_14725 ?auto_14726 ) ) ( not ( = ?auto_14725 ?auto_14722 ) ) ( not ( = ?auto_14725 ?auto_14721 ) ) ( not ( = ?auto_14708 ?auto_14713 ) ) ( not ( = ?auto_14708 ?auto_14718 ) ) ( not ( = ?auto_14709 ?auto_14713 ) ) ( not ( = ?auto_14709 ?auto_14718 ) ) ( not ( = ?auto_14710 ?auto_14713 ) ) ( not ( = ?auto_14710 ?auto_14718 ) ) ( not ( = ?auto_14711 ?auto_14713 ) ) ( not ( = ?auto_14711 ?auto_14718 ) ) ( not ( = ?auto_14713 ?auto_14725 ) ) ( not ( = ?auto_14713 ?auto_14726 ) ) ( not ( = ?auto_14713 ?auto_14722 ) ) ( not ( = ?auto_14713 ?auto_14721 ) ) ( not ( = ?auto_14718 ?auto_14725 ) ) ( not ( = ?auto_14718 ?auto_14726 ) ) ( not ( = ?auto_14718 ?auto_14722 ) ) ( not ( = ?auto_14718 ?auto_14721 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14708 ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14712 )
      ( MAKE-1CRATE ?auto_14712 ?auto_14713 )
      ( MAKE-5CRATE-VERIFY ?auto_14708 ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14712 ?auto_14713 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14732 - SURFACE
      ?auto_14733 - SURFACE
    )
    :vars
    (
      ?auto_14734 - HOIST
      ?auto_14735 - PLACE
      ?auto_14737 - PLACE
      ?auto_14738 - HOIST
      ?auto_14739 - SURFACE
      ?auto_14736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14734 ?auto_14735 ) ( SURFACE-AT ?auto_14732 ?auto_14735 ) ( CLEAR ?auto_14732 ) ( IS-CRATE ?auto_14733 ) ( AVAILABLE ?auto_14734 ) ( not ( = ?auto_14737 ?auto_14735 ) ) ( HOIST-AT ?auto_14738 ?auto_14737 ) ( AVAILABLE ?auto_14738 ) ( SURFACE-AT ?auto_14733 ?auto_14737 ) ( ON ?auto_14733 ?auto_14739 ) ( CLEAR ?auto_14733 ) ( TRUCK-AT ?auto_14736 ?auto_14735 ) ( not ( = ?auto_14732 ?auto_14733 ) ) ( not ( = ?auto_14732 ?auto_14739 ) ) ( not ( = ?auto_14733 ?auto_14739 ) ) ( not ( = ?auto_14734 ?auto_14738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14736 ?auto_14735 ?auto_14737 )
      ( !LIFT ?auto_14738 ?auto_14733 ?auto_14739 ?auto_14737 )
      ( !LOAD ?auto_14738 ?auto_14733 ?auto_14736 ?auto_14737 )
      ( !DRIVE ?auto_14736 ?auto_14737 ?auto_14735 )
      ( !UNLOAD ?auto_14734 ?auto_14733 ?auto_14736 ?auto_14735 )
      ( !DROP ?auto_14734 ?auto_14733 ?auto_14732 ?auto_14735 )
      ( MAKE-1CRATE-VERIFY ?auto_14732 ?auto_14733 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14747 - SURFACE
      ?auto_14748 - SURFACE
      ?auto_14749 - SURFACE
      ?auto_14750 - SURFACE
      ?auto_14751 - SURFACE
      ?auto_14753 - SURFACE
      ?auto_14752 - SURFACE
    )
    :vars
    (
      ?auto_14759 - HOIST
      ?auto_14754 - PLACE
      ?auto_14757 - PLACE
      ?auto_14758 - HOIST
      ?auto_14755 - SURFACE
      ?auto_14762 - PLACE
      ?auto_14770 - HOIST
      ?auto_14769 - SURFACE
      ?auto_14763 - PLACE
      ?auto_14767 - HOIST
      ?auto_14766 - SURFACE
      ?auto_14760 - PLACE
      ?auto_14771 - HOIST
      ?auto_14765 - SURFACE
      ?auto_14772 - PLACE
      ?auto_14764 - HOIST
      ?auto_14761 - SURFACE
      ?auto_14768 - SURFACE
      ?auto_14756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14759 ?auto_14754 ) ( IS-CRATE ?auto_14752 ) ( not ( = ?auto_14757 ?auto_14754 ) ) ( HOIST-AT ?auto_14758 ?auto_14757 ) ( AVAILABLE ?auto_14758 ) ( SURFACE-AT ?auto_14752 ?auto_14757 ) ( ON ?auto_14752 ?auto_14755 ) ( CLEAR ?auto_14752 ) ( not ( = ?auto_14753 ?auto_14752 ) ) ( not ( = ?auto_14753 ?auto_14755 ) ) ( not ( = ?auto_14752 ?auto_14755 ) ) ( not ( = ?auto_14759 ?auto_14758 ) ) ( IS-CRATE ?auto_14753 ) ( not ( = ?auto_14762 ?auto_14754 ) ) ( HOIST-AT ?auto_14770 ?auto_14762 ) ( SURFACE-AT ?auto_14753 ?auto_14762 ) ( ON ?auto_14753 ?auto_14769 ) ( CLEAR ?auto_14753 ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14751 ?auto_14769 ) ) ( not ( = ?auto_14753 ?auto_14769 ) ) ( not ( = ?auto_14759 ?auto_14770 ) ) ( IS-CRATE ?auto_14751 ) ( not ( = ?auto_14763 ?auto_14754 ) ) ( HOIST-AT ?auto_14767 ?auto_14763 ) ( AVAILABLE ?auto_14767 ) ( SURFACE-AT ?auto_14751 ?auto_14763 ) ( ON ?auto_14751 ?auto_14766 ) ( CLEAR ?auto_14751 ) ( not ( = ?auto_14750 ?auto_14751 ) ) ( not ( = ?auto_14750 ?auto_14766 ) ) ( not ( = ?auto_14751 ?auto_14766 ) ) ( not ( = ?auto_14759 ?auto_14767 ) ) ( IS-CRATE ?auto_14750 ) ( not ( = ?auto_14760 ?auto_14754 ) ) ( HOIST-AT ?auto_14771 ?auto_14760 ) ( AVAILABLE ?auto_14771 ) ( SURFACE-AT ?auto_14750 ?auto_14760 ) ( ON ?auto_14750 ?auto_14765 ) ( CLEAR ?auto_14750 ) ( not ( = ?auto_14749 ?auto_14750 ) ) ( not ( = ?auto_14749 ?auto_14765 ) ) ( not ( = ?auto_14750 ?auto_14765 ) ) ( not ( = ?auto_14759 ?auto_14771 ) ) ( IS-CRATE ?auto_14749 ) ( not ( = ?auto_14772 ?auto_14754 ) ) ( HOIST-AT ?auto_14764 ?auto_14772 ) ( AVAILABLE ?auto_14764 ) ( SURFACE-AT ?auto_14749 ?auto_14772 ) ( ON ?auto_14749 ?auto_14761 ) ( CLEAR ?auto_14749 ) ( not ( = ?auto_14748 ?auto_14749 ) ) ( not ( = ?auto_14748 ?auto_14761 ) ) ( not ( = ?auto_14749 ?auto_14761 ) ) ( not ( = ?auto_14759 ?auto_14764 ) ) ( SURFACE-AT ?auto_14747 ?auto_14754 ) ( CLEAR ?auto_14747 ) ( IS-CRATE ?auto_14748 ) ( AVAILABLE ?auto_14759 ) ( AVAILABLE ?auto_14770 ) ( SURFACE-AT ?auto_14748 ?auto_14762 ) ( ON ?auto_14748 ?auto_14768 ) ( CLEAR ?auto_14748 ) ( TRUCK-AT ?auto_14756 ?auto_14754 ) ( not ( = ?auto_14747 ?auto_14748 ) ) ( not ( = ?auto_14747 ?auto_14768 ) ) ( not ( = ?auto_14748 ?auto_14768 ) ) ( not ( = ?auto_14747 ?auto_14749 ) ) ( not ( = ?auto_14747 ?auto_14761 ) ) ( not ( = ?auto_14749 ?auto_14768 ) ) ( not ( = ?auto_14772 ?auto_14762 ) ) ( not ( = ?auto_14764 ?auto_14770 ) ) ( not ( = ?auto_14761 ?auto_14768 ) ) ( not ( = ?auto_14747 ?auto_14750 ) ) ( not ( = ?auto_14747 ?auto_14765 ) ) ( not ( = ?auto_14748 ?auto_14750 ) ) ( not ( = ?auto_14748 ?auto_14765 ) ) ( not ( = ?auto_14750 ?auto_14761 ) ) ( not ( = ?auto_14750 ?auto_14768 ) ) ( not ( = ?auto_14760 ?auto_14772 ) ) ( not ( = ?auto_14760 ?auto_14762 ) ) ( not ( = ?auto_14771 ?auto_14764 ) ) ( not ( = ?auto_14771 ?auto_14770 ) ) ( not ( = ?auto_14765 ?auto_14761 ) ) ( not ( = ?auto_14765 ?auto_14768 ) ) ( not ( = ?auto_14747 ?auto_14751 ) ) ( not ( = ?auto_14747 ?auto_14766 ) ) ( not ( = ?auto_14748 ?auto_14751 ) ) ( not ( = ?auto_14748 ?auto_14766 ) ) ( not ( = ?auto_14749 ?auto_14751 ) ) ( not ( = ?auto_14749 ?auto_14766 ) ) ( not ( = ?auto_14751 ?auto_14765 ) ) ( not ( = ?auto_14751 ?auto_14761 ) ) ( not ( = ?auto_14751 ?auto_14768 ) ) ( not ( = ?auto_14763 ?auto_14760 ) ) ( not ( = ?auto_14763 ?auto_14772 ) ) ( not ( = ?auto_14763 ?auto_14762 ) ) ( not ( = ?auto_14767 ?auto_14771 ) ) ( not ( = ?auto_14767 ?auto_14764 ) ) ( not ( = ?auto_14767 ?auto_14770 ) ) ( not ( = ?auto_14766 ?auto_14765 ) ) ( not ( = ?auto_14766 ?auto_14761 ) ) ( not ( = ?auto_14766 ?auto_14768 ) ) ( not ( = ?auto_14747 ?auto_14753 ) ) ( not ( = ?auto_14747 ?auto_14769 ) ) ( not ( = ?auto_14748 ?auto_14753 ) ) ( not ( = ?auto_14748 ?auto_14769 ) ) ( not ( = ?auto_14749 ?auto_14753 ) ) ( not ( = ?auto_14749 ?auto_14769 ) ) ( not ( = ?auto_14750 ?auto_14753 ) ) ( not ( = ?auto_14750 ?auto_14769 ) ) ( not ( = ?auto_14753 ?auto_14766 ) ) ( not ( = ?auto_14753 ?auto_14765 ) ) ( not ( = ?auto_14753 ?auto_14761 ) ) ( not ( = ?auto_14753 ?auto_14768 ) ) ( not ( = ?auto_14769 ?auto_14766 ) ) ( not ( = ?auto_14769 ?auto_14765 ) ) ( not ( = ?auto_14769 ?auto_14761 ) ) ( not ( = ?auto_14769 ?auto_14768 ) ) ( not ( = ?auto_14747 ?auto_14752 ) ) ( not ( = ?auto_14747 ?auto_14755 ) ) ( not ( = ?auto_14748 ?auto_14752 ) ) ( not ( = ?auto_14748 ?auto_14755 ) ) ( not ( = ?auto_14749 ?auto_14752 ) ) ( not ( = ?auto_14749 ?auto_14755 ) ) ( not ( = ?auto_14750 ?auto_14752 ) ) ( not ( = ?auto_14750 ?auto_14755 ) ) ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14751 ?auto_14755 ) ) ( not ( = ?auto_14752 ?auto_14769 ) ) ( not ( = ?auto_14752 ?auto_14766 ) ) ( not ( = ?auto_14752 ?auto_14765 ) ) ( not ( = ?auto_14752 ?auto_14761 ) ) ( not ( = ?auto_14752 ?auto_14768 ) ) ( not ( = ?auto_14757 ?auto_14762 ) ) ( not ( = ?auto_14757 ?auto_14763 ) ) ( not ( = ?auto_14757 ?auto_14760 ) ) ( not ( = ?auto_14757 ?auto_14772 ) ) ( not ( = ?auto_14758 ?auto_14770 ) ) ( not ( = ?auto_14758 ?auto_14767 ) ) ( not ( = ?auto_14758 ?auto_14771 ) ) ( not ( = ?auto_14758 ?auto_14764 ) ) ( not ( = ?auto_14755 ?auto_14769 ) ) ( not ( = ?auto_14755 ?auto_14766 ) ) ( not ( = ?auto_14755 ?auto_14765 ) ) ( not ( = ?auto_14755 ?auto_14761 ) ) ( not ( = ?auto_14755 ?auto_14768 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14747 ?auto_14748 ?auto_14749 ?auto_14750 ?auto_14751 ?auto_14753 )
      ( MAKE-1CRATE ?auto_14753 ?auto_14752 )
      ( MAKE-6CRATE-VERIFY ?auto_14747 ?auto_14748 ?auto_14749 ?auto_14750 ?auto_14751 ?auto_14753 ?auto_14752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14775 - SURFACE
      ?auto_14776 - SURFACE
    )
    :vars
    (
      ?auto_14777 - HOIST
      ?auto_14778 - PLACE
      ?auto_14780 - PLACE
      ?auto_14781 - HOIST
      ?auto_14782 - SURFACE
      ?auto_14779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14777 ?auto_14778 ) ( SURFACE-AT ?auto_14775 ?auto_14778 ) ( CLEAR ?auto_14775 ) ( IS-CRATE ?auto_14776 ) ( AVAILABLE ?auto_14777 ) ( not ( = ?auto_14780 ?auto_14778 ) ) ( HOIST-AT ?auto_14781 ?auto_14780 ) ( AVAILABLE ?auto_14781 ) ( SURFACE-AT ?auto_14776 ?auto_14780 ) ( ON ?auto_14776 ?auto_14782 ) ( CLEAR ?auto_14776 ) ( TRUCK-AT ?auto_14779 ?auto_14778 ) ( not ( = ?auto_14775 ?auto_14776 ) ) ( not ( = ?auto_14775 ?auto_14782 ) ) ( not ( = ?auto_14776 ?auto_14782 ) ) ( not ( = ?auto_14777 ?auto_14781 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14779 ?auto_14778 ?auto_14780 )
      ( !LIFT ?auto_14781 ?auto_14776 ?auto_14782 ?auto_14780 )
      ( !LOAD ?auto_14781 ?auto_14776 ?auto_14779 ?auto_14780 )
      ( !DRIVE ?auto_14779 ?auto_14780 ?auto_14778 )
      ( !UNLOAD ?auto_14777 ?auto_14776 ?auto_14779 ?auto_14778 )
      ( !DROP ?auto_14777 ?auto_14776 ?auto_14775 ?auto_14778 )
      ( MAKE-1CRATE-VERIFY ?auto_14775 ?auto_14776 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14791 - SURFACE
      ?auto_14792 - SURFACE
      ?auto_14793 - SURFACE
      ?auto_14794 - SURFACE
      ?auto_14795 - SURFACE
      ?auto_14797 - SURFACE
      ?auto_14796 - SURFACE
      ?auto_14798 - SURFACE
    )
    :vars
    (
      ?auto_14800 - HOIST
      ?auto_14802 - PLACE
      ?auto_14804 - PLACE
      ?auto_14801 - HOIST
      ?auto_14803 - SURFACE
      ?auto_14811 - PLACE
      ?auto_14806 - HOIST
      ?auto_14818 - SURFACE
      ?auto_14809 - PLACE
      ?auto_14816 - HOIST
      ?auto_14817 - SURFACE
      ?auto_14808 - PLACE
      ?auto_14810 - HOIST
      ?auto_14812 - SURFACE
      ?auto_14813 - SURFACE
      ?auto_14805 - PLACE
      ?auto_14815 - HOIST
      ?auto_14807 - SURFACE
      ?auto_14814 - SURFACE
      ?auto_14799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14800 ?auto_14802 ) ( IS-CRATE ?auto_14798 ) ( not ( = ?auto_14804 ?auto_14802 ) ) ( HOIST-AT ?auto_14801 ?auto_14804 ) ( SURFACE-AT ?auto_14798 ?auto_14804 ) ( ON ?auto_14798 ?auto_14803 ) ( CLEAR ?auto_14798 ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14803 ) ) ( not ( = ?auto_14798 ?auto_14803 ) ) ( not ( = ?auto_14800 ?auto_14801 ) ) ( IS-CRATE ?auto_14796 ) ( not ( = ?auto_14811 ?auto_14802 ) ) ( HOIST-AT ?auto_14806 ?auto_14811 ) ( AVAILABLE ?auto_14806 ) ( SURFACE-AT ?auto_14796 ?auto_14811 ) ( ON ?auto_14796 ?auto_14818 ) ( CLEAR ?auto_14796 ) ( not ( = ?auto_14797 ?auto_14796 ) ) ( not ( = ?auto_14797 ?auto_14818 ) ) ( not ( = ?auto_14796 ?auto_14818 ) ) ( not ( = ?auto_14800 ?auto_14806 ) ) ( IS-CRATE ?auto_14797 ) ( not ( = ?auto_14809 ?auto_14802 ) ) ( HOIST-AT ?auto_14816 ?auto_14809 ) ( SURFACE-AT ?auto_14797 ?auto_14809 ) ( ON ?auto_14797 ?auto_14817 ) ( CLEAR ?auto_14797 ) ( not ( = ?auto_14795 ?auto_14797 ) ) ( not ( = ?auto_14795 ?auto_14817 ) ) ( not ( = ?auto_14797 ?auto_14817 ) ) ( not ( = ?auto_14800 ?auto_14816 ) ) ( IS-CRATE ?auto_14795 ) ( not ( = ?auto_14808 ?auto_14802 ) ) ( HOIST-AT ?auto_14810 ?auto_14808 ) ( AVAILABLE ?auto_14810 ) ( SURFACE-AT ?auto_14795 ?auto_14808 ) ( ON ?auto_14795 ?auto_14812 ) ( CLEAR ?auto_14795 ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14812 ) ) ( not ( = ?auto_14800 ?auto_14810 ) ) ( IS-CRATE ?auto_14794 ) ( AVAILABLE ?auto_14801 ) ( SURFACE-AT ?auto_14794 ?auto_14804 ) ( ON ?auto_14794 ?auto_14813 ) ( CLEAR ?auto_14794 ) ( not ( = ?auto_14793 ?auto_14794 ) ) ( not ( = ?auto_14793 ?auto_14813 ) ) ( not ( = ?auto_14794 ?auto_14813 ) ) ( IS-CRATE ?auto_14793 ) ( not ( = ?auto_14805 ?auto_14802 ) ) ( HOIST-AT ?auto_14815 ?auto_14805 ) ( AVAILABLE ?auto_14815 ) ( SURFACE-AT ?auto_14793 ?auto_14805 ) ( ON ?auto_14793 ?auto_14807 ) ( CLEAR ?auto_14793 ) ( not ( = ?auto_14792 ?auto_14793 ) ) ( not ( = ?auto_14792 ?auto_14807 ) ) ( not ( = ?auto_14793 ?auto_14807 ) ) ( not ( = ?auto_14800 ?auto_14815 ) ) ( SURFACE-AT ?auto_14791 ?auto_14802 ) ( CLEAR ?auto_14791 ) ( IS-CRATE ?auto_14792 ) ( AVAILABLE ?auto_14800 ) ( AVAILABLE ?auto_14816 ) ( SURFACE-AT ?auto_14792 ?auto_14809 ) ( ON ?auto_14792 ?auto_14814 ) ( CLEAR ?auto_14792 ) ( TRUCK-AT ?auto_14799 ?auto_14802 ) ( not ( = ?auto_14791 ?auto_14792 ) ) ( not ( = ?auto_14791 ?auto_14814 ) ) ( not ( = ?auto_14792 ?auto_14814 ) ) ( not ( = ?auto_14791 ?auto_14793 ) ) ( not ( = ?auto_14791 ?auto_14807 ) ) ( not ( = ?auto_14793 ?auto_14814 ) ) ( not ( = ?auto_14805 ?auto_14809 ) ) ( not ( = ?auto_14815 ?auto_14816 ) ) ( not ( = ?auto_14807 ?auto_14814 ) ) ( not ( = ?auto_14791 ?auto_14794 ) ) ( not ( = ?auto_14791 ?auto_14813 ) ) ( not ( = ?auto_14792 ?auto_14794 ) ) ( not ( = ?auto_14792 ?auto_14813 ) ) ( not ( = ?auto_14794 ?auto_14807 ) ) ( not ( = ?auto_14794 ?auto_14814 ) ) ( not ( = ?auto_14804 ?auto_14805 ) ) ( not ( = ?auto_14804 ?auto_14809 ) ) ( not ( = ?auto_14801 ?auto_14815 ) ) ( not ( = ?auto_14801 ?auto_14816 ) ) ( not ( = ?auto_14813 ?auto_14807 ) ) ( not ( = ?auto_14813 ?auto_14814 ) ) ( not ( = ?auto_14791 ?auto_14795 ) ) ( not ( = ?auto_14791 ?auto_14812 ) ) ( not ( = ?auto_14792 ?auto_14795 ) ) ( not ( = ?auto_14792 ?auto_14812 ) ) ( not ( = ?auto_14793 ?auto_14795 ) ) ( not ( = ?auto_14793 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14813 ) ) ( not ( = ?auto_14795 ?auto_14807 ) ) ( not ( = ?auto_14795 ?auto_14814 ) ) ( not ( = ?auto_14808 ?auto_14804 ) ) ( not ( = ?auto_14808 ?auto_14805 ) ) ( not ( = ?auto_14808 ?auto_14809 ) ) ( not ( = ?auto_14810 ?auto_14801 ) ) ( not ( = ?auto_14810 ?auto_14815 ) ) ( not ( = ?auto_14810 ?auto_14816 ) ) ( not ( = ?auto_14812 ?auto_14813 ) ) ( not ( = ?auto_14812 ?auto_14807 ) ) ( not ( = ?auto_14812 ?auto_14814 ) ) ( not ( = ?auto_14791 ?auto_14797 ) ) ( not ( = ?auto_14791 ?auto_14817 ) ) ( not ( = ?auto_14792 ?auto_14797 ) ) ( not ( = ?auto_14792 ?auto_14817 ) ) ( not ( = ?auto_14793 ?auto_14797 ) ) ( not ( = ?auto_14793 ?auto_14817 ) ) ( not ( = ?auto_14794 ?auto_14797 ) ) ( not ( = ?auto_14794 ?auto_14817 ) ) ( not ( = ?auto_14797 ?auto_14812 ) ) ( not ( = ?auto_14797 ?auto_14813 ) ) ( not ( = ?auto_14797 ?auto_14807 ) ) ( not ( = ?auto_14797 ?auto_14814 ) ) ( not ( = ?auto_14817 ?auto_14812 ) ) ( not ( = ?auto_14817 ?auto_14813 ) ) ( not ( = ?auto_14817 ?auto_14807 ) ) ( not ( = ?auto_14817 ?auto_14814 ) ) ( not ( = ?auto_14791 ?auto_14796 ) ) ( not ( = ?auto_14791 ?auto_14818 ) ) ( not ( = ?auto_14792 ?auto_14796 ) ) ( not ( = ?auto_14792 ?auto_14818 ) ) ( not ( = ?auto_14793 ?auto_14796 ) ) ( not ( = ?auto_14793 ?auto_14818 ) ) ( not ( = ?auto_14794 ?auto_14796 ) ) ( not ( = ?auto_14794 ?auto_14818 ) ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14818 ) ) ( not ( = ?auto_14796 ?auto_14817 ) ) ( not ( = ?auto_14796 ?auto_14812 ) ) ( not ( = ?auto_14796 ?auto_14813 ) ) ( not ( = ?auto_14796 ?auto_14807 ) ) ( not ( = ?auto_14796 ?auto_14814 ) ) ( not ( = ?auto_14811 ?auto_14809 ) ) ( not ( = ?auto_14811 ?auto_14808 ) ) ( not ( = ?auto_14811 ?auto_14804 ) ) ( not ( = ?auto_14811 ?auto_14805 ) ) ( not ( = ?auto_14806 ?auto_14816 ) ) ( not ( = ?auto_14806 ?auto_14810 ) ) ( not ( = ?auto_14806 ?auto_14801 ) ) ( not ( = ?auto_14806 ?auto_14815 ) ) ( not ( = ?auto_14818 ?auto_14817 ) ) ( not ( = ?auto_14818 ?auto_14812 ) ) ( not ( = ?auto_14818 ?auto_14813 ) ) ( not ( = ?auto_14818 ?auto_14807 ) ) ( not ( = ?auto_14818 ?auto_14814 ) ) ( not ( = ?auto_14791 ?auto_14798 ) ) ( not ( = ?auto_14791 ?auto_14803 ) ) ( not ( = ?auto_14792 ?auto_14798 ) ) ( not ( = ?auto_14792 ?auto_14803 ) ) ( not ( = ?auto_14793 ?auto_14798 ) ) ( not ( = ?auto_14793 ?auto_14803 ) ) ( not ( = ?auto_14794 ?auto_14798 ) ) ( not ( = ?auto_14794 ?auto_14803 ) ) ( not ( = ?auto_14795 ?auto_14798 ) ) ( not ( = ?auto_14795 ?auto_14803 ) ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14803 ) ) ( not ( = ?auto_14798 ?auto_14818 ) ) ( not ( = ?auto_14798 ?auto_14817 ) ) ( not ( = ?auto_14798 ?auto_14812 ) ) ( not ( = ?auto_14798 ?auto_14813 ) ) ( not ( = ?auto_14798 ?auto_14807 ) ) ( not ( = ?auto_14798 ?auto_14814 ) ) ( not ( = ?auto_14803 ?auto_14818 ) ) ( not ( = ?auto_14803 ?auto_14817 ) ) ( not ( = ?auto_14803 ?auto_14812 ) ) ( not ( = ?auto_14803 ?auto_14813 ) ) ( not ( = ?auto_14803 ?auto_14807 ) ) ( not ( = ?auto_14803 ?auto_14814 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14791 ?auto_14792 ?auto_14793 ?auto_14794 ?auto_14795 ?auto_14797 ?auto_14796 )
      ( MAKE-1CRATE ?auto_14796 ?auto_14798 )
      ( MAKE-7CRATE-VERIFY ?auto_14791 ?auto_14792 ?auto_14793 ?auto_14794 ?auto_14795 ?auto_14797 ?auto_14796 ?auto_14798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14821 - SURFACE
      ?auto_14822 - SURFACE
    )
    :vars
    (
      ?auto_14823 - HOIST
      ?auto_14824 - PLACE
      ?auto_14826 - PLACE
      ?auto_14827 - HOIST
      ?auto_14828 - SURFACE
      ?auto_14825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14823 ?auto_14824 ) ( SURFACE-AT ?auto_14821 ?auto_14824 ) ( CLEAR ?auto_14821 ) ( IS-CRATE ?auto_14822 ) ( AVAILABLE ?auto_14823 ) ( not ( = ?auto_14826 ?auto_14824 ) ) ( HOIST-AT ?auto_14827 ?auto_14826 ) ( AVAILABLE ?auto_14827 ) ( SURFACE-AT ?auto_14822 ?auto_14826 ) ( ON ?auto_14822 ?auto_14828 ) ( CLEAR ?auto_14822 ) ( TRUCK-AT ?auto_14825 ?auto_14824 ) ( not ( = ?auto_14821 ?auto_14822 ) ) ( not ( = ?auto_14821 ?auto_14828 ) ) ( not ( = ?auto_14822 ?auto_14828 ) ) ( not ( = ?auto_14823 ?auto_14827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14825 ?auto_14824 ?auto_14826 )
      ( !LIFT ?auto_14827 ?auto_14822 ?auto_14828 ?auto_14826 )
      ( !LOAD ?auto_14827 ?auto_14822 ?auto_14825 ?auto_14826 )
      ( !DRIVE ?auto_14825 ?auto_14826 ?auto_14824 )
      ( !UNLOAD ?auto_14823 ?auto_14822 ?auto_14825 ?auto_14824 )
      ( !DROP ?auto_14823 ?auto_14822 ?auto_14821 ?auto_14824 )
      ( MAKE-1CRATE-VERIFY ?auto_14821 ?auto_14822 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14838 - SURFACE
      ?auto_14839 - SURFACE
      ?auto_14840 - SURFACE
      ?auto_14841 - SURFACE
      ?auto_14842 - SURFACE
      ?auto_14844 - SURFACE
      ?auto_14843 - SURFACE
      ?auto_14846 - SURFACE
      ?auto_14845 - SURFACE
    )
    :vars
    (
      ?auto_14848 - HOIST
      ?auto_14849 - PLACE
      ?auto_14847 - PLACE
      ?auto_14851 - HOIST
      ?auto_14850 - SURFACE
      ?auto_14865 - PLACE
      ?auto_14868 - HOIST
      ?auto_14869 - SURFACE
      ?auto_14858 - PLACE
      ?auto_14861 - HOIST
      ?auto_14856 - SURFACE
      ?auto_14860 - PLACE
      ?auto_14854 - HOIST
      ?auto_14855 - SURFACE
      ?auto_14866 - PLACE
      ?auto_14859 - HOIST
      ?auto_14857 - SURFACE
      ?auto_14863 - SURFACE
      ?auto_14864 - PLACE
      ?auto_14862 - HOIST
      ?auto_14867 - SURFACE
      ?auto_14853 - SURFACE
      ?auto_14852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14848 ?auto_14849 ) ( IS-CRATE ?auto_14845 ) ( not ( = ?auto_14847 ?auto_14849 ) ) ( HOIST-AT ?auto_14851 ?auto_14847 ) ( AVAILABLE ?auto_14851 ) ( SURFACE-AT ?auto_14845 ?auto_14847 ) ( ON ?auto_14845 ?auto_14850 ) ( CLEAR ?auto_14845 ) ( not ( = ?auto_14846 ?auto_14845 ) ) ( not ( = ?auto_14846 ?auto_14850 ) ) ( not ( = ?auto_14845 ?auto_14850 ) ) ( not ( = ?auto_14848 ?auto_14851 ) ) ( IS-CRATE ?auto_14846 ) ( not ( = ?auto_14865 ?auto_14849 ) ) ( HOIST-AT ?auto_14868 ?auto_14865 ) ( SURFACE-AT ?auto_14846 ?auto_14865 ) ( ON ?auto_14846 ?auto_14869 ) ( CLEAR ?auto_14846 ) ( not ( = ?auto_14843 ?auto_14846 ) ) ( not ( = ?auto_14843 ?auto_14869 ) ) ( not ( = ?auto_14846 ?auto_14869 ) ) ( not ( = ?auto_14848 ?auto_14868 ) ) ( IS-CRATE ?auto_14843 ) ( not ( = ?auto_14858 ?auto_14849 ) ) ( HOIST-AT ?auto_14861 ?auto_14858 ) ( AVAILABLE ?auto_14861 ) ( SURFACE-AT ?auto_14843 ?auto_14858 ) ( ON ?auto_14843 ?auto_14856 ) ( CLEAR ?auto_14843 ) ( not ( = ?auto_14844 ?auto_14843 ) ) ( not ( = ?auto_14844 ?auto_14856 ) ) ( not ( = ?auto_14843 ?auto_14856 ) ) ( not ( = ?auto_14848 ?auto_14861 ) ) ( IS-CRATE ?auto_14844 ) ( not ( = ?auto_14860 ?auto_14849 ) ) ( HOIST-AT ?auto_14854 ?auto_14860 ) ( SURFACE-AT ?auto_14844 ?auto_14860 ) ( ON ?auto_14844 ?auto_14855 ) ( CLEAR ?auto_14844 ) ( not ( = ?auto_14842 ?auto_14844 ) ) ( not ( = ?auto_14842 ?auto_14855 ) ) ( not ( = ?auto_14844 ?auto_14855 ) ) ( not ( = ?auto_14848 ?auto_14854 ) ) ( IS-CRATE ?auto_14842 ) ( not ( = ?auto_14866 ?auto_14849 ) ) ( HOIST-AT ?auto_14859 ?auto_14866 ) ( AVAILABLE ?auto_14859 ) ( SURFACE-AT ?auto_14842 ?auto_14866 ) ( ON ?auto_14842 ?auto_14857 ) ( CLEAR ?auto_14842 ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14841 ?auto_14857 ) ) ( not ( = ?auto_14842 ?auto_14857 ) ) ( not ( = ?auto_14848 ?auto_14859 ) ) ( IS-CRATE ?auto_14841 ) ( AVAILABLE ?auto_14868 ) ( SURFACE-AT ?auto_14841 ?auto_14865 ) ( ON ?auto_14841 ?auto_14863 ) ( CLEAR ?auto_14841 ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14863 ) ) ( not ( = ?auto_14841 ?auto_14863 ) ) ( IS-CRATE ?auto_14840 ) ( not ( = ?auto_14864 ?auto_14849 ) ) ( HOIST-AT ?auto_14862 ?auto_14864 ) ( AVAILABLE ?auto_14862 ) ( SURFACE-AT ?auto_14840 ?auto_14864 ) ( ON ?auto_14840 ?auto_14867 ) ( CLEAR ?auto_14840 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14867 ) ) ( not ( = ?auto_14840 ?auto_14867 ) ) ( not ( = ?auto_14848 ?auto_14862 ) ) ( SURFACE-AT ?auto_14838 ?auto_14849 ) ( CLEAR ?auto_14838 ) ( IS-CRATE ?auto_14839 ) ( AVAILABLE ?auto_14848 ) ( AVAILABLE ?auto_14854 ) ( SURFACE-AT ?auto_14839 ?auto_14860 ) ( ON ?auto_14839 ?auto_14853 ) ( CLEAR ?auto_14839 ) ( TRUCK-AT ?auto_14852 ?auto_14849 ) ( not ( = ?auto_14838 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14853 ) ) ( not ( = ?auto_14839 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14840 ) ) ( not ( = ?auto_14838 ?auto_14867 ) ) ( not ( = ?auto_14840 ?auto_14853 ) ) ( not ( = ?auto_14864 ?auto_14860 ) ) ( not ( = ?auto_14862 ?auto_14854 ) ) ( not ( = ?auto_14867 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14841 ) ) ( not ( = ?auto_14838 ?auto_14863 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14839 ?auto_14863 ) ) ( not ( = ?auto_14841 ?auto_14867 ) ) ( not ( = ?auto_14841 ?auto_14853 ) ) ( not ( = ?auto_14865 ?auto_14864 ) ) ( not ( = ?auto_14865 ?auto_14860 ) ) ( not ( = ?auto_14868 ?auto_14862 ) ) ( not ( = ?auto_14868 ?auto_14854 ) ) ( not ( = ?auto_14863 ?auto_14867 ) ) ( not ( = ?auto_14863 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14842 ) ) ( not ( = ?auto_14838 ?auto_14857 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14857 ) ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14857 ) ) ( not ( = ?auto_14842 ?auto_14863 ) ) ( not ( = ?auto_14842 ?auto_14867 ) ) ( not ( = ?auto_14842 ?auto_14853 ) ) ( not ( = ?auto_14866 ?auto_14865 ) ) ( not ( = ?auto_14866 ?auto_14864 ) ) ( not ( = ?auto_14866 ?auto_14860 ) ) ( not ( = ?auto_14859 ?auto_14868 ) ) ( not ( = ?auto_14859 ?auto_14862 ) ) ( not ( = ?auto_14859 ?auto_14854 ) ) ( not ( = ?auto_14857 ?auto_14863 ) ) ( not ( = ?auto_14857 ?auto_14867 ) ) ( not ( = ?auto_14857 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14844 ) ) ( not ( = ?auto_14838 ?auto_14855 ) ) ( not ( = ?auto_14839 ?auto_14844 ) ) ( not ( = ?auto_14839 ?auto_14855 ) ) ( not ( = ?auto_14840 ?auto_14844 ) ) ( not ( = ?auto_14840 ?auto_14855 ) ) ( not ( = ?auto_14841 ?auto_14844 ) ) ( not ( = ?auto_14841 ?auto_14855 ) ) ( not ( = ?auto_14844 ?auto_14857 ) ) ( not ( = ?auto_14844 ?auto_14863 ) ) ( not ( = ?auto_14844 ?auto_14867 ) ) ( not ( = ?auto_14844 ?auto_14853 ) ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14863 ) ) ( not ( = ?auto_14855 ?auto_14867 ) ) ( not ( = ?auto_14855 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14843 ) ) ( not ( = ?auto_14838 ?auto_14856 ) ) ( not ( = ?auto_14839 ?auto_14843 ) ) ( not ( = ?auto_14839 ?auto_14856 ) ) ( not ( = ?auto_14840 ?auto_14843 ) ) ( not ( = ?auto_14840 ?auto_14856 ) ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( not ( = ?auto_14841 ?auto_14856 ) ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14856 ) ) ( not ( = ?auto_14843 ?auto_14855 ) ) ( not ( = ?auto_14843 ?auto_14857 ) ) ( not ( = ?auto_14843 ?auto_14863 ) ) ( not ( = ?auto_14843 ?auto_14867 ) ) ( not ( = ?auto_14843 ?auto_14853 ) ) ( not ( = ?auto_14858 ?auto_14860 ) ) ( not ( = ?auto_14858 ?auto_14866 ) ) ( not ( = ?auto_14858 ?auto_14865 ) ) ( not ( = ?auto_14858 ?auto_14864 ) ) ( not ( = ?auto_14861 ?auto_14854 ) ) ( not ( = ?auto_14861 ?auto_14859 ) ) ( not ( = ?auto_14861 ?auto_14868 ) ) ( not ( = ?auto_14861 ?auto_14862 ) ) ( not ( = ?auto_14856 ?auto_14855 ) ) ( not ( = ?auto_14856 ?auto_14857 ) ) ( not ( = ?auto_14856 ?auto_14863 ) ) ( not ( = ?auto_14856 ?auto_14867 ) ) ( not ( = ?auto_14856 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14846 ) ) ( not ( = ?auto_14838 ?auto_14869 ) ) ( not ( = ?auto_14839 ?auto_14846 ) ) ( not ( = ?auto_14839 ?auto_14869 ) ) ( not ( = ?auto_14840 ?auto_14846 ) ) ( not ( = ?auto_14840 ?auto_14869 ) ) ( not ( = ?auto_14841 ?auto_14846 ) ) ( not ( = ?auto_14841 ?auto_14869 ) ) ( not ( = ?auto_14842 ?auto_14846 ) ) ( not ( = ?auto_14842 ?auto_14869 ) ) ( not ( = ?auto_14844 ?auto_14846 ) ) ( not ( = ?auto_14844 ?auto_14869 ) ) ( not ( = ?auto_14846 ?auto_14856 ) ) ( not ( = ?auto_14846 ?auto_14855 ) ) ( not ( = ?auto_14846 ?auto_14857 ) ) ( not ( = ?auto_14846 ?auto_14863 ) ) ( not ( = ?auto_14846 ?auto_14867 ) ) ( not ( = ?auto_14846 ?auto_14853 ) ) ( not ( = ?auto_14869 ?auto_14856 ) ) ( not ( = ?auto_14869 ?auto_14855 ) ) ( not ( = ?auto_14869 ?auto_14857 ) ) ( not ( = ?auto_14869 ?auto_14863 ) ) ( not ( = ?auto_14869 ?auto_14867 ) ) ( not ( = ?auto_14869 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14845 ) ) ( not ( = ?auto_14838 ?auto_14850 ) ) ( not ( = ?auto_14839 ?auto_14845 ) ) ( not ( = ?auto_14839 ?auto_14850 ) ) ( not ( = ?auto_14840 ?auto_14845 ) ) ( not ( = ?auto_14840 ?auto_14850 ) ) ( not ( = ?auto_14841 ?auto_14845 ) ) ( not ( = ?auto_14841 ?auto_14850 ) ) ( not ( = ?auto_14842 ?auto_14845 ) ) ( not ( = ?auto_14842 ?auto_14850 ) ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14850 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14850 ) ) ( not ( = ?auto_14845 ?auto_14869 ) ) ( not ( = ?auto_14845 ?auto_14856 ) ) ( not ( = ?auto_14845 ?auto_14855 ) ) ( not ( = ?auto_14845 ?auto_14857 ) ) ( not ( = ?auto_14845 ?auto_14863 ) ) ( not ( = ?auto_14845 ?auto_14867 ) ) ( not ( = ?auto_14845 ?auto_14853 ) ) ( not ( = ?auto_14847 ?auto_14865 ) ) ( not ( = ?auto_14847 ?auto_14858 ) ) ( not ( = ?auto_14847 ?auto_14860 ) ) ( not ( = ?auto_14847 ?auto_14866 ) ) ( not ( = ?auto_14847 ?auto_14864 ) ) ( not ( = ?auto_14851 ?auto_14868 ) ) ( not ( = ?auto_14851 ?auto_14861 ) ) ( not ( = ?auto_14851 ?auto_14854 ) ) ( not ( = ?auto_14851 ?auto_14859 ) ) ( not ( = ?auto_14851 ?auto_14862 ) ) ( not ( = ?auto_14850 ?auto_14869 ) ) ( not ( = ?auto_14850 ?auto_14856 ) ) ( not ( = ?auto_14850 ?auto_14855 ) ) ( not ( = ?auto_14850 ?auto_14857 ) ) ( not ( = ?auto_14850 ?auto_14863 ) ) ( not ( = ?auto_14850 ?auto_14867 ) ) ( not ( = ?auto_14850 ?auto_14853 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14842 ?auto_14844 ?auto_14843 ?auto_14846 )
      ( MAKE-1CRATE ?auto_14846 ?auto_14845 )
      ( MAKE-8CRATE-VERIFY ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14842 ?auto_14844 ?auto_14843 ?auto_14846 ?auto_14845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14872 - SURFACE
      ?auto_14873 - SURFACE
    )
    :vars
    (
      ?auto_14874 - HOIST
      ?auto_14875 - PLACE
      ?auto_14877 - PLACE
      ?auto_14878 - HOIST
      ?auto_14879 - SURFACE
      ?auto_14876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14874 ?auto_14875 ) ( SURFACE-AT ?auto_14872 ?auto_14875 ) ( CLEAR ?auto_14872 ) ( IS-CRATE ?auto_14873 ) ( AVAILABLE ?auto_14874 ) ( not ( = ?auto_14877 ?auto_14875 ) ) ( HOIST-AT ?auto_14878 ?auto_14877 ) ( AVAILABLE ?auto_14878 ) ( SURFACE-AT ?auto_14873 ?auto_14877 ) ( ON ?auto_14873 ?auto_14879 ) ( CLEAR ?auto_14873 ) ( TRUCK-AT ?auto_14876 ?auto_14875 ) ( not ( = ?auto_14872 ?auto_14873 ) ) ( not ( = ?auto_14872 ?auto_14879 ) ) ( not ( = ?auto_14873 ?auto_14879 ) ) ( not ( = ?auto_14874 ?auto_14878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14876 ?auto_14875 ?auto_14877 )
      ( !LIFT ?auto_14878 ?auto_14873 ?auto_14879 ?auto_14877 )
      ( !LOAD ?auto_14878 ?auto_14873 ?auto_14876 ?auto_14877 )
      ( !DRIVE ?auto_14876 ?auto_14877 ?auto_14875 )
      ( !UNLOAD ?auto_14874 ?auto_14873 ?auto_14876 ?auto_14875 )
      ( !DROP ?auto_14874 ?auto_14873 ?auto_14872 ?auto_14875 )
      ( MAKE-1CRATE-VERIFY ?auto_14872 ?auto_14873 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14890 - SURFACE
      ?auto_14891 - SURFACE
      ?auto_14892 - SURFACE
      ?auto_14893 - SURFACE
      ?auto_14894 - SURFACE
      ?auto_14897 - SURFACE
      ?auto_14895 - SURFACE
      ?auto_14899 - SURFACE
      ?auto_14898 - SURFACE
      ?auto_14896 - SURFACE
    )
    :vars
    (
      ?auto_14900 - HOIST
      ?auto_14905 - PLACE
      ?auto_14901 - PLACE
      ?auto_14903 - HOIST
      ?auto_14904 - SURFACE
      ?auto_14923 - PLACE
      ?auto_14906 - HOIST
      ?auto_14914 - SURFACE
      ?auto_14918 - PLACE
      ?auto_14912 - HOIST
      ?auto_14911 - SURFACE
      ?auto_14921 - PLACE
      ?auto_14913 - HOIST
      ?auto_14909 - SURFACE
      ?auto_14908 - SURFACE
      ?auto_14919 - PLACE
      ?auto_14920 - HOIST
      ?auto_14922 - SURFACE
      ?auto_14915 - SURFACE
      ?auto_14917 - PLACE
      ?auto_14916 - HOIST
      ?auto_14907 - SURFACE
      ?auto_14910 - SURFACE
      ?auto_14902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14900 ?auto_14905 ) ( IS-CRATE ?auto_14896 ) ( not ( = ?auto_14901 ?auto_14905 ) ) ( HOIST-AT ?auto_14903 ?auto_14901 ) ( SURFACE-AT ?auto_14896 ?auto_14901 ) ( ON ?auto_14896 ?auto_14904 ) ( CLEAR ?auto_14896 ) ( not ( = ?auto_14898 ?auto_14896 ) ) ( not ( = ?auto_14898 ?auto_14904 ) ) ( not ( = ?auto_14896 ?auto_14904 ) ) ( not ( = ?auto_14900 ?auto_14903 ) ) ( IS-CRATE ?auto_14898 ) ( not ( = ?auto_14923 ?auto_14905 ) ) ( HOIST-AT ?auto_14906 ?auto_14923 ) ( AVAILABLE ?auto_14906 ) ( SURFACE-AT ?auto_14898 ?auto_14923 ) ( ON ?auto_14898 ?auto_14914 ) ( CLEAR ?auto_14898 ) ( not ( = ?auto_14899 ?auto_14898 ) ) ( not ( = ?auto_14899 ?auto_14914 ) ) ( not ( = ?auto_14898 ?auto_14914 ) ) ( not ( = ?auto_14900 ?auto_14906 ) ) ( IS-CRATE ?auto_14899 ) ( not ( = ?auto_14918 ?auto_14905 ) ) ( HOIST-AT ?auto_14912 ?auto_14918 ) ( SURFACE-AT ?auto_14899 ?auto_14918 ) ( ON ?auto_14899 ?auto_14911 ) ( CLEAR ?auto_14899 ) ( not ( = ?auto_14895 ?auto_14899 ) ) ( not ( = ?auto_14895 ?auto_14911 ) ) ( not ( = ?auto_14899 ?auto_14911 ) ) ( not ( = ?auto_14900 ?auto_14912 ) ) ( IS-CRATE ?auto_14895 ) ( not ( = ?auto_14921 ?auto_14905 ) ) ( HOIST-AT ?auto_14913 ?auto_14921 ) ( AVAILABLE ?auto_14913 ) ( SURFACE-AT ?auto_14895 ?auto_14921 ) ( ON ?auto_14895 ?auto_14909 ) ( CLEAR ?auto_14895 ) ( not ( = ?auto_14897 ?auto_14895 ) ) ( not ( = ?auto_14897 ?auto_14909 ) ) ( not ( = ?auto_14895 ?auto_14909 ) ) ( not ( = ?auto_14900 ?auto_14913 ) ) ( IS-CRATE ?auto_14897 ) ( SURFACE-AT ?auto_14897 ?auto_14901 ) ( ON ?auto_14897 ?auto_14908 ) ( CLEAR ?auto_14897 ) ( not ( = ?auto_14894 ?auto_14897 ) ) ( not ( = ?auto_14894 ?auto_14908 ) ) ( not ( = ?auto_14897 ?auto_14908 ) ) ( IS-CRATE ?auto_14894 ) ( not ( = ?auto_14919 ?auto_14905 ) ) ( HOIST-AT ?auto_14920 ?auto_14919 ) ( AVAILABLE ?auto_14920 ) ( SURFACE-AT ?auto_14894 ?auto_14919 ) ( ON ?auto_14894 ?auto_14922 ) ( CLEAR ?auto_14894 ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( not ( = ?auto_14893 ?auto_14922 ) ) ( not ( = ?auto_14894 ?auto_14922 ) ) ( not ( = ?auto_14900 ?auto_14920 ) ) ( IS-CRATE ?auto_14893 ) ( AVAILABLE ?auto_14912 ) ( SURFACE-AT ?auto_14893 ?auto_14918 ) ( ON ?auto_14893 ?auto_14915 ) ( CLEAR ?auto_14893 ) ( not ( = ?auto_14892 ?auto_14893 ) ) ( not ( = ?auto_14892 ?auto_14915 ) ) ( not ( = ?auto_14893 ?auto_14915 ) ) ( IS-CRATE ?auto_14892 ) ( not ( = ?auto_14917 ?auto_14905 ) ) ( HOIST-AT ?auto_14916 ?auto_14917 ) ( AVAILABLE ?auto_14916 ) ( SURFACE-AT ?auto_14892 ?auto_14917 ) ( ON ?auto_14892 ?auto_14907 ) ( CLEAR ?auto_14892 ) ( not ( = ?auto_14891 ?auto_14892 ) ) ( not ( = ?auto_14891 ?auto_14907 ) ) ( not ( = ?auto_14892 ?auto_14907 ) ) ( not ( = ?auto_14900 ?auto_14916 ) ) ( SURFACE-AT ?auto_14890 ?auto_14905 ) ( CLEAR ?auto_14890 ) ( IS-CRATE ?auto_14891 ) ( AVAILABLE ?auto_14900 ) ( AVAILABLE ?auto_14903 ) ( SURFACE-AT ?auto_14891 ?auto_14901 ) ( ON ?auto_14891 ?auto_14910 ) ( CLEAR ?auto_14891 ) ( TRUCK-AT ?auto_14902 ?auto_14905 ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14910 ) ) ( not ( = ?auto_14891 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14892 ) ) ( not ( = ?auto_14890 ?auto_14907 ) ) ( not ( = ?auto_14892 ?auto_14910 ) ) ( not ( = ?auto_14917 ?auto_14901 ) ) ( not ( = ?auto_14916 ?auto_14903 ) ) ( not ( = ?auto_14907 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14893 ) ) ( not ( = ?auto_14890 ?auto_14915 ) ) ( not ( = ?auto_14891 ?auto_14893 ) ) ( not ( = ?auto_14891 ?auto_14915 ) ) ( not ( = ?auto_14893 ?auto_14907 ) ) ( not ( = ?auto_14893 ?auto_14910 ) ) ( not ( = ?auto_14918 ?auto_14917 ) ) ( not ( = ?auto_14918 ?auto_14901 ) ) ( not ( = ?auto_14912 ?auto_14916 ) ) ( not ( = ?auto_14912 ?auto_14903 ) ) ( not ( = ?auto_14915 ?auto_14907 ) ) ( not ( = ?auto_14915 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14894 ) ) ( not ( = ?auto_14890 ?auto_14922 ) ) ( not ( = ?auto_14891 ?auto_14894 ) ) ( not ( = ?auto_14891 ?auto_14922 ) ) ( not ( = ?auto_14892 ?auto_14894 ) ) ( not ( = ?auto_14892 ?auto_14922 ) ) ( not ( = ?auto_14894 ?auto_14915 ) ) ( not ( = ?auto_14894 ?auto_14907 ) ) ( not ( = ?auto_14894 ?auto_14910 ) ) ( not ( = ?auto_14919 ?auto_14918 ) ) ( not ( = ?auto_14919 ?auto_14917 ) ) ( not ( = ?auto_14919 ?auto_14901 ) ) ( not ( = ?auto_14920 ?auto_14912 ) ) ( not ( = ?auto_14920 ?auto_14916 ) ) ( not ( = ?auto_14920 ?auto_14903 ) ) ( not ( = ?auto_14922 ?auto_14915 ) ) ( not ( = ?auto_14922 ?auto_14907 ) ) ( not ( = ?auto_14922 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14897 ) ) ( not ( = ?auto_14890 ?auto_14908 ) ) ( not ( = ?auto_14891 ?auto_14897 ) ) ( not ( = ?auto_14891 ?auto_14908 ) ) ( not ( = ?auto_14892 ?auto_14897 ) ) ( not ( = ?auto_14892 ?auto_14908 ) ) ( not ( = ?auto_14893 ?auto_14897 ) ) ( not ( = ?auto_14893 ?auto_14908 ) ) ( not ( = ?auto_14897 ?auto_14922 ) ) ( not ( = ?auto_14897 ?auto_14915 ) ) ( not ( = ?auto_14897 ?auto_14907 ) ) ( not ( = ?auto_14897 ?auto_14910 ) ) ( not ( = ?auto_14908 ?auto_14922 ) ) ( not ( = ?auto_14908 ?auto_14915 ) ) ( not ( = ?auto_14908 ?auto_14907 ) ) ( not ( = ?auto_14908 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14895 ) ) ( not ( = ?auto_14890 ?auto_14909 ) ) ( not ( = ?auto_14891 ?auto_14895 ) ) ( not ( = ?auto_14891 ?auto_14909 ) ) ( not ( = ?auto_14892 ?auto_14895 ) ) ( not ( = ?auto_14892 ?auto_14909 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14909 ) ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( not ( = ?auto_14894 ?auto_14909 ) ) ( not ( = ?auto_14895 ?auto_14908 ) ) ( not ( = ?auto_14895 ?auto_14922 ) ) ( not ( = ?auto_14895 ?auto_14915 ) ) ( not ( = ?auto_14895 ?auto_14907 ) ) ( not ( = ?auto_14895 ?auto_14910 ) ) ( not ( = ?auto_14921 ?auto_14901 ) ) ( not ( = ?auto_14921 ?auto_14919 ) ) ( not ( = ?auto_14921 ?auto_14918 ) ) ( not ( = ?auto_14921 ?auto_14917 ) ) ( not ( = ?auto_14913 ?auto_14903 ) ) ( not ( = ?auto_14913 ?auto_14920 ) ) ( not ( = ?auto_14913 ?auto_14912 ) ) ( not ( = ?auto_14913 ?auto_14916 ) ) ( not ( = ?auto_14909 ?auto_14908 ) ) ( not ( = ?auto_14909 ?auto_14922 ) ) ( not ( = ?auto_14909 ?auto_14915 ) ) ( not ( = ?auto_14909 ?auto_14907 ) ) ( not ( = ?auto_14909 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14899 ) ) ( not ( = ?auto_14890 ?auto_14911 ) ) ( not ( = ?auto_14891 ?auto_14899 ) ) ( not ( = ?auto_14891 ?auto_14911 ) ) ( not ( = ?auto_14892 ?auto_14899 ) ) ( not ( = ?auto_14892 ?auto_14911 ) ) ( not ( = ?auto_14893 ?auto_14899 ) ) ( not ( = ?auto_14893 ?auto_14911 ) ) ( not ( = ?auto_14894 ?auto_14899 ) ) ( not ( = ?auto_14894 ?auto_14911 ) ) ( not ( = ?auto_14897 ?auto_14899 ) ) ( not ( = ?auto_14897 ?auto_14911 ) ) ( not ( = ?auto_14899 ?auto_14909 ) ) ( not ( = ?auto_14899 ?auto_14908 ) ) ( not ( = ?auto_14899 ?auto_14922 ) ) ( not ( = ?auto_14899 ?auto_14915 ) ) ( not ( = ?auto_14899 ?auto_14907 ) ) ( not ( = ?auto_14899 ?auto_14910 ) ) ( not ( = ?auto_14911 ?auto_14909 ) ) ( not ( = ?auto_14911 ?auto_14908 ) ) ( not ( = ?auto_14911 ?auto_14922 ) ) ( not ( = ?auto_14911 ?auto_14915 ) ) ( not ( = ?auto_14911 ?auto_14907 ) ) ( not ( = ?auto_14911 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14898 ) ) ( not ( = ?auto_14890 ?auto_14914 ) ) ( not ( = ?auto_14891 ?auto_14898 ) ) ( not ( = ?auto_14891 ?auto_14914 ) ) ( not ( = ?auto_14892 ?auto_14898 ) ) ( not ( = ?auto_14892 ?auto_14914 ) ) ( not ( = ?auto_14893 ?auto_14898 ) ) ( not ( = ?auto_14893 ?auto_14914 ) ) ( not ( = ?auto_14894 ?auto_14898 ) ) ( not ( = ?auto_14894 ?auto_14914 ) ) ( not ( = ?auto_14897 ?auto_14898 ) ) ( not ( = ?auto_14897 ?auto_14914 ) ) ( not ( = ?auto_14895 ?auto_14898 ) ) ( not ( = ?auto_14895 ?auto_14914 ) ) ( not ( = ?auto_14898 ?auto_14911 ) ) ( not ( = ?auto_14898 ?auto_14909 ) ) ( not ( = ?auto_14898 ?auto_14908 ) ) ( not ( = ?auto_14898 ?auto_14922 ) ) ( not ( = ?auto_14898 ?auto_14915 ) ) ( not ( = ?auto_14898 ?auto_14907 ) ) ( not ( = ?auto_14898 ?auto_14910 ) ) ( not ( = ?auto_14923 ?auto_14918 ) ) ( not ( = ?auto_14923 ?auto_14921 ) ) ( not ( = ?auto_14923 ?auto_14901 ) ) ( not ( = ?auto_14923 ?auto_14919 ) ) ( not ( = ?auto_14923 ?auto_14917 ) ) ( not ( = ?auto_14906 ?auto_14912 ) ) ( not ( = ?auto_14906 ?auto_14913 ) ) ( not ( = ?auto_14906 ?auto_14903 ) ) ( not ( = ?auto_14906 ?auto_14920 ) ) ( not ( = ?auto_14906 ?auto_14916 ) ) ( not ( = ?auto_14914 ?auto_14911 ) ) ( not ( = ?auto_14914 ?auto_14909 ) ) ( not ( = ?auto_14914 ?auto_14908 ) ) ( not ( = ?auto_14914 ?auto_14922 ) ) ( not ( = ?auto_14914 ?auto_14915 ) ) ( not ( = ?auto_14914 ?auto_14907 ) ) ( not ( = ?auto_14914 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14896 ) ) ( not ( = ?auto_14890 ?auto_14904 ) ) ( not ( = ?auto_14891 ?auto_14896 ) ) ( not ( = ?auto_14891 ?auto_14904 ) ) ( not ( = ?auto_14892 ?auto_14896 ) ) ( not ( = ?auto_14892 ?auto_14904 ) ) ( not ( = ?auto_14893 ?auto_14896 ) ) ( not ( = ?auto_14893 ?auto_14904 ) ) ( not ( = ?auto_14894 ?auto_14896 ) ) ( not ( = ?auto_14894 ?auto_14904 ) ) ( not ( = ?auto_14897 ?auto_14896 ) ) ( not ( = ?auto_14897 ?auto_14904 ) ) ( not ( = ?auto_14895 ?auto_14896 ) ) ( not ( = ?auto_14895 ?auto_14904 ) ) ( not ( = ?auto_14899 ?auto_14896 ) ) ( not ( = ?auto_14899 ?auto_14904 ) ) ( not ( = ?auto_14896 ?auto_14914 ) ) ( not ( = ?auto_14896 ?auto_14911 ) ) ( not ( = ?auto_14896 ?auto_14909 ) ) ( not ( = ?auto_14896 ?auto_14908 ) ) ( not ( = ?auto_14896 ?auto_14922 ) ) ( not ( = ?auto_14896 ?auto_14915 ) ) ( not ( = ?auto_14896 ?auto_14907 ) ) ( not ( = ?auto_14896 ?auto_14910 ) ) ( not ( = ?auto_14904 ?auto_14914 ) ) ( not ( = ?auto_14904 ?auto_14911 ) ) ( not ( = ?auto_14904 ?auto_14909 ) ) ( not ( = ?auto_14904 ?auto_14908 ) ) ( not ( = ?auto_14904 ?auto_14922 ) ) ( not ( = ?auto_14904 ?auto_14915 ) ) ( not ( = ?auto_14904 ?auto_14907 ) ) ( not ( = ?auto_14904 ?auto_14910 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14890 ?auto_14891 ?auto_14892 ?auto_14893 ?auto_14894 ?auto_14897 ?auto_14895 ?auto_14899 ?auto_14898 )
      ( MAKE-1CRATE ?auto_14898 ?auto_14896 )
      ( MAKE-9CRATE-VERIFY ?auto_14890 ?auto_14891 ?auto_14892 ?auto_14893 ?auto_14894 ?auto_14897 ?auto_14895 ?auto_14899 ?auto_14898 ?auto_14896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14926 - SURFACE
      ?auto_14927 - SURFACE
    )
    :vars
    (
      ?auto_14928 - HOIST
      ?auto_14929 - PLACE
      ?auto_14931 - PLACE
      ?auto_14932 - HOIST
      ?auto_14933 - SURFACE
      ?auto_14930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14928 ?auto_14929 ) ( SURFACE-AT ?auto_14926 ?auto_14929 ) ( CLEAR ?auto_14926 ) ( IS-CRATE ?auto_14927 ) ( AVAILABLE ?auto_14928 ) ( not ( = ?auto_14931 ?auto_14929 ) ) ( HOIST-AT ?auto_14932 ?auto_14931 ) ( AVAILABLE ?auto_14932 ) ( SURFACE-AT ?auto_14927 ?auto_14931 ) ( ON ?auto_14927 ?auto_14933 ) ( CLEAR ?auto_14927 ) ( TRUCK-AT ?auto_14930 ?auto_14929 ) ( not ( = ?auto_14926 ?auto_14927 ) ) ( not ( = ?auto_14926 ?auto_14933 ) ) ( not ( = ?auto_14927 ?auto_14933 ) ) ( not ( = ?auto_14928 ?auto_14932 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14930 ?auto_14929 ?auto_14931 )
      ( !LIFT ?auto_14932 ?auto_14927 ?auto_14933 ?auto_14931 )
      ( !LOAD ?auto_14932 ?auto_14927 ?auto_14930 ?auto_14931 )
      ( !DRIVE ?auto_14930 ?auto_14931 ?auto_14929 )
      ( !UNLOAD ?auto_14928 ?auto_14927 ?auto_14930 ?auto_14929 )
      ( !DROP ?auto_14928 ?auto_14927 ?auto_14926 ?auto_14929 )
      ( MAKE-1CRATE-VERIFY ?auto_14926 ?auto_14927 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14945 - SURFACE
      ?auto_14946 - SURFACE
      ?auto_14947 - SURFACE
      ?auto_14948 - SURFACE
      ?auto_14949 - SURFACE
      ?auto_14952 - SURFACE
      ?auto_14950 - SURFACE
      ?auto_14954 - SURFACE
      ?auto_14953 - SURFACE
      ?auto_14951 - SURFACE
      ?auto_14955 - SURFACE
    )
    :vars
    (
      ?auto_14956 - HOIST
      ?auto_14960 - PLACE
      ?auto_14957 - PLACE
      ?auto_14961 - HOIST
      ?auto_14959 - SURFACE
      ?auto_14962 - PLACE
      ?auto_14980 - HOIST
      ?auto_14982 - SURFACE
      ?auto_14967 - PLACE
      ?auto_14979 - HOIST
      ?auto_14975 - SURFACE
      ?auto_14972 - PLACE
      ?auto_14963 - HOIST
      ?auto_14964 - SURFACE
      ?auto_14971 - PLACE
      ?auto_14978 - HOIST
      ?auto_14968 - SURFACE
      ?auto_14973 - SURFACE
      ?auto_14977 - PLACE
      ?auto_14969 - HOIST
      ?auto_14981 - SURFACE
      ?auto_14976 - SURFACE
      ?auto_14970 - PLACE
      ?auto_14974 - HOIST
      ?auto_14966 - SURFACE
      ?auto_14965 - SURFACE
      ?auto_14958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14956 ?auto_14960 ) ( IS-CRATE ?auto_14955 ) ( not ( = ?auto_14957 ?auto_14960 ) ) ( HOIST-AT ?auto_14961 ?auto_14957 ) ( AVAILABLE ?auto_14961 ) ( SURFACE-AT ?auto_14955 ?auto_14957 ) ( ON ?auto_14955 ?auto_14959 ) ( CLEAR ?auto_14955 ) ( not ( = ?auto_14951 ?auto_14955 ) ) ( not ( = ?auto_14951 ?auto_14959 ) ) ( not ( = ?auto_14955 ?auto_14959 ) ) ( not ( = ?auto_14956 ?auto_14961 ) ) ( IS-CRATE ?auto_14951 ) ( not ( = ?auto_14962 ?auto_14960 ) ) ( HOIST-AT ?auto_14980 ?auto_14962 ) ( SURFACE-AT ?auto_14951 ?auto_14962 ) ( ON ?auto_14951 ?auto_14982 ) ( CLEAR ?auto_14951 ) ( not ( = ?auto_14953 ?auto_14951 ) ) ( not ( = ?auto_14953 ?auto_14982 ) ) ( not ( = ?auto_14951 ?auto_14982 ) ) ( not ( = ?auto_14956 ?auto_14980 ) ) ( IS-CRATE ?auto_14953 ) ( not ( = ?auto_14967 ?auto_14960 ) ) ( HOIST-AT ?auto_14979 ?auto_14967 ) ( AVAILABLE ?auto_14979 ) ( SURFACE-AT ?auto_14953 ?auto_14967 ) ( ON ?auto_14953 ?auto_14975 ) ( CLEAR ?auto_14953 ) ( not ( = ?auto_14954 ?auto_14953 ) ) ( not ( = ?auto_14954 ?auto_14975 ) ) ( not ( = ?auto_14953 ?auto_14975 ) ) ( not ( = ?auto_14956 ?auto_14979 ) ) ( IS-CRATE ?auto_14954 ) ( not ( = ?auto_14972 ?auto_14960 ) ) ( HOIST-AT ?auto_14963 ?auto_14972 ) ( SURFACE-AT ?auto_14954 ?auto_14972 ) ( ON ?auto_14954 ?auto_14964 ) ( CLEAR ?auto_14954 ) ( not ( = ?auto_14950 ?auto_14954 ) ) ( not ( = ?auto_14950 ?auto_14964 ) ) ( not ( = ?auto_14954 ?auto_14964 ) ) ( not ( = ?auto_14956 ?auto_14963 ) ) ( IS-CRATE ?auto_14950 ) ( not ( = ?auto_14971 ?auto_14960 ) ) ( HOIST-AT ?auto_14978 ?auto_14971 ) ( AVAILABLE ?auto_14978 ) ( SURFACE-AT ?auto_14950 ?auto_14971 ) ( ON ?auto_14950 ?auto_14968 ) ( CLEAR ?auto_14950 ) ( not ( = ?auto_14952 ?auto_14950 ) ) ( not ( = ?auto_14952 ?auto_14968 ) ) ( not ( = ?auto_14950 ?auto_14968 ) ) ( not ( = ?auto_14956 ?auto_14978 ) ) ( IS-CRATE ?auto_14952 ) ( SURFACE-AT ?auto_14952 ?auto_14962 ) ( ON ?auto_14952 ?auto_14973 ) ( CLEAR ?auto_14952 ) ( not ( = ?auto_14949 ?auto_14952 ) ) ( not ( = ?auto_14949 ?auto_14973 ) ) ( not ( = ?auto_14952 ?auto_14973 ) ) ( IS-CRATE ?auto_14949 ) ( not ( = ?auto_14977 ?auto_14960 ) ) ( HOIST-AT ?auto_14969 ?auto_14977 ) ( AVAILABLE ?auto_14969 ) ( SURFACE-AT ?auto_14949 ?auto_14977 ) ( ON ?auto_14949 ?auto_14981 ) ( CLEAR ?auto_14949 ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( not ( = ?auto_14948 ?auto_14981 ) ) ( not ( = ?auto_14949 ?auto_14981 ) ) ( not ( = ?auto_14956 ?auto_14969 ) ) ( IS-CRATE ?auto_14948 ) ( AVAILABLE ?auto_14963 ) ( SURFACE-AT ?auto_14948 ?auto_14972 ) ( ON ?auto_14948 ?auto_14976 ) ( CLEAR ?auto_14948 ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14976 ) ) ( not ( = ?auto_14948 ?auto_14976 ) ) ( IS-CRATE ?auto_14947 ) ( not ( = ?auto_14970 ?auto_14960 ) ) ( HOIST-AT ?auto_14974 ?auto_14970 ) ( AVAILABLE ?auto_14974 ) ( SURFACE-AT ?auto_14947 ?auto_14970 ) ( ON ?auto_14947 ?auto_14966 ) ( CLEAR ?auto_14947 ) ( not ( = ?auto_14946 ?auto_14947 ) ) ( not ( = ?auto_14946 ?auto_14966 ) ) ( not ( = ?auto_14947 ?auto_14966 ) ) ( not ( = ?auto_14956 ?auto_14974 ) ) ( SURFACE-AT ?auto_14945 ?auto_14960 ) ( CLEAR ?auto_14945 ) ( IS-CRATE ?auto_14946 ) ( AVAILABLE ?auto_14956 ) ( AVAILABLE ?auto_14980 ) ( SURFACE-AT ?auto_14946 ?auto_14962 ) ( ON ?auto_14946 ?auto_14965 ) ( CLEAR ?auto_14946 ) ( TRUCK-AT ?auto_14958 ?auto_14960 ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( not ( = ?auto_14945 ?auto_14965 ) ) ( not ( = ?auto_14946 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14947 ) ) ( not ( = ?auto_14945 ?auto_14966 ) ) ( not ( = ?auto_14947 ?auto_14965 ) ) ( not ( = ?auto_14970 ?auto_14962 ) ) ( not ( = ?auto_14974 ?auto_14980 ) ) ( not ( = ?auto_14966 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14948 ) ) ( not ( = ?auto_14945 ?auto_14976 ) ) ( not ( = ?auto_14946 ?auto_14948 ) ) ( not ( = ?auto_14946 ?auto_14976 ) ) ( not ( = ?auto_14948 ?auto_14966 ) ) ( not ( = ?auto_14948 ?auto_14965 ) ) ( not ( = ?auto_14972 ?auto_14970 ) ) ( not ( = ?auto_14972 ?auto_14962 ) ) ( not ( = ?auto_14963 ?auto_14974 ) ) ( not ( = ?auto_14963 ?auto_14980 ) ) ( not ( = ?auto_14976 ?auto_14966 ) ) ( not ( = ?auto_14976 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14949 ) ) ( not ( = ?auto_14945 ?auto_14981 ) ) ( not ( = ?auto_14946 ?auto_14949 ) ) ( not ( = ?auto_14946 ?auto_14981 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14981 ) ) ( not ( = ?auto_14949 ?auto_14976 ) ) ( not ( = ?auto_14949 ?auto_14966 ) ) ( not ( = ?auto_14949 ?auto_14965 ) ) ( not ( = ?auto_14977 ?auto_14972 ) ) ( not ( = ?auto_14977 ?auto_14970 ) ) ( not ( = ?auto_14977 ?auto_14962 ) ) ( not ( = ?auto_14969 ?auto_14963 ) ) ( not ( = ?auto_14969 ?auto_14974 ) ) ( not ( = ?auto_14969 ?auto_14980 ) ) ( not ( = ?auto_14981 ?auto_14976 ) ) ( not ( = ?auto_14981 ?auto_14966 ) ) ( not ( = ?auto_14981 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14952 ) ) ( not ( = ?auto_14945 ?auto_14973 ) ) ( not ( = ?auto_14946 ?auto_14952 ) ) ( not ( = ?auto_14946 ?auto_14973 ) ) ( not ( = ?auto_14947 ?auto_14952 ) ) ( not ( = ?auto_14947 ?auto_14973 ) ) ( not ( = ?auto_14948 ?auto_14952 ) ) ( not ( = ?auto_14948 ?auto_14973 ) ) ( not ( = ?auto_14952 ?auto_14981 ) ) ( not ( = ?auto_14952 ?auto_14976 ) ) ( not ( = ?auto_14952 ?auto_14966 ) ) ( not ( = ?auto_14952 ?auto_14965 ) ) ( not ( = ?auto_14973 ?auto_14981 ) ) ( not ( = ?auto_14973 ?auto_14976 ) ) ( not ( = ?auto_14973 ?auto_14966 ) ) ( not ( = ?auto_14973 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14950 ) ) ( not ( = ?auto_14945 ?auto_14968 ) ) ( not ( = ?auto_14946 ?auto_14950 ) ) ( not ( = ?auto_14946 ?auto_14968 ) ) ( not ( = ?auto_14947 ?auto_14950 ) ) ( not ( = ?auto_14947 ?auto_14968 ) ) ( not ( = ?auto_14948 ?auto_14950 ) ) ( not ( = ?auto_14948 ?auto_14968 ) ) ( not ( = ?auto_14949 ?auto_14950 ) ) ( not ( = ?auto_14949 ?auto_14968 ) ) ( not ( = ?auto_14950 ?auto_14973 ) ) ( not ( = ?auto_14950 ?auto_14981 ) ) ( not ( = ?auto_14950 ?auto_14976 ) ) ( not ( = ?auto_14950 ?auto_14966 ) ) ( not ( = ?auto_14950 ?auto_14965 ) ) ( not ( = ?auto_14971 ?auto_14962 ) ) ( not ( = ?auto_14971 ?auto_14977 ) ) ( not ( = ?auto_14971 ?auto_14972 ) ) ( not ( = ?auto_14971 ?auto_14970 ) ) ( not ( = ?auto_14978 ?auto_14980 ) ) ( not ( = ?auto_14978 ?auto_14969 ) ) ( not ( = ?auto_14978 ?auto_14963 ) ) ( not ( = ?auto_14978 ?auto_14974 ) ) ( not ( = ?auto_14968 ?auto_14973 ) ) ( not ( = ?auto_14968 ?auto_14981 ) ) ( not ( = ?auto_14968 ?auto_14976 ) ) ( not ( = ?auto_14968 ?auto_14966 ) ) ( not ( = ?auto_14968 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14954 ) ) ( not ( = ?auto_14945 ?auto_14964 ) ) ( not ( = ?auto_14946 ?auto_14954 ) ) ( not ( = ?auto_14946 ?auto_14964 ) ) ( not ( = ?auto_14947 ?auto_14954 ) ) ( not ( = ?auto_14947 ?auto_14964 ) ) ( not ( = ?auto_14948 ?auto_14954 ) ) ( not ( = ?auto_14948 ?auto_14964 ) ) ( not ( = ?auto_14949 ?auto_14954 ) ) ( not ( = ?auto_14949 ?auto_14964 ) ) ( not ( = ?auto_14952 ?auto_14954 ) ) ( not ( = ?auto_14952 ?auto_14964 ) ) ( not ( = ?auto_14954 ?auto_14968 ) ) ( not ( = ?auto_14954 ?auto_14973 ) ) ( not ( = ?auto_14954 ?auto_14981 ) ) ( not ( = ?auto_14954 ?auto_14976 ) ) ( not ( = ?auto_14954 ?auto_14966 ) ) ( not ( = ?auto_14954 ?auto_14965 ) ) ( not ( = ?auto_14964 ?auto_14968 ) ) ( not ( = ?auto_14964 ?auto_14973 ) ) ( not ( = ?auto_14964 ?auto_14981 ) ) ( not ( = ?auto_14964 ?auto_14976 ) ) ( not ( = ?auto_14964 ?auto_14966 ) ) ( not ( = ?auto_14964 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14953 ) ) ( not ( = ?auto_14945 ?auto_14975 ) ) ( not ( = ?auto_14946 ?auto_14953 ) ) ( not ( = ?auto_14946 ?auto_14975 ) ) ( not ( = ?auto_14947 ?auto_14953 ) ) ( not ( = ?auto_14947 ?auto_14975 ) ) ( not ( = ?auto_14948 ?auto_14953 ) ) ( not ( = ?auto_14948 ?auto_14975 ) ) ( not ( = ?auto_14949 ?auto_14953 ) ) ( not ( = ?auto_14949 ?auto_14975 ) ) ( not ( = ?auto_14952 ?auto_14953 ) ) ( not ( = ?auto_14952 ?auto_14975 ) ) ( not ( = ?auto_14950 ?auto_14953 ) ) ( not ( = ?auto_14950 ?auto_14975 ) ) ( not ( = ?auto_14953 ?auto_14964 ) ) ( not ( = ?auto_14953 ?auto_14968 ) ) ( not ( = ?auto_14953 ?auto_14973 ) ) ( not ( = ?auto_14953 ?auto_14981 ) ) ( not ( = ?auto_14953 ?auto_14976 ) ) ( not ( = ?auto_14953 ?auto_14966 ) ) ( not ( = ?auto_14953 ?auto_14965 ) ) ( not ( = ?auto_14967 ?auto_14972 ) ) ( not ( = ?auto_14967 ?auto_14971 ) ) ( not ( = ?auto_14967 ?auto_14962 ) ) ( not ( = ?auto_14967 ?auto_14977 ) ) ( not ( = ?auto_14967 ?auto_14970 ) ) ( not ( = ?auto_14979 ?auto_14963 ) ) ( not ( = ?auto_14979 ?auto_14978 ) ) ( not ( = ?auto_14979 ?auto_14980 ) ) ( not ( = ?auto_14979 ?auto_14969 ) ) ( not ( = ?auto_14979 ?auto_14974 ) ) ( not ( = ?auto_14975 ?auto_14964 ) ) ( not ( = ?auto_14975 ?auto_14968 ) ) ( not ( = ?auto_14975 ?auto_14973 ) ) ( not ( = ?auto_14975 ?auto_14981 ) ) ( not ( = ?auto_14975 ?auto_14976 ) ) ( not ( = ?auto_14975 ?auto_14966 ) ) ( not ( = ?auto_14975 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14951 ) ) ( not ( = ?auto_14945 ?auto_14982 ) ) ( not ( = ?auto_14946 ?auto_14951 ) ) ( not ( = ?auto_14946 ?auto_14982 ) ) ( not ( = ?auto_14947 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14982 ) ) ( not ( = ?auto_14948 ?auto_14951 ) ) ( not ( = ?auto_14948 ?auto_14982 ) ) ( not ( = ?auto_14949 ?auto_14951 ) ) ( not ( = ?auto_14949 ?auto_14982 ) ) ( not ( = ?auto_14952 ?auto_14951 ) ) ( not ( = ?auto_14952 ?auto_14982 ) ) ( not ( = ?auto_14950 ?auto_14951 ) ) ( not ( = ?auto_14950 ?auto_14982 ) ) ( not ( = ?auto_14954 ?auto_14951 ) ) ( not ( = ?auto_14954 ?auto_14982 ) ) ( not ( = ?auto_14951 ?auto_14975 ) ) ( not ( = ?auto_14951 ?auto_14964 ) ) ( not ( = ?auto_14951 ?auto_14968 ) ) ( not ( = ?auto_14951 ?auto_14973 ) ) ( not ( = ?auto_14951 ?auto_14981 ) ) ( not ( = ?auto_14951 ?auto_14976 ) ) ( not ( = ?auto_14951 ?auto_14966 ) ) ( not ( = ?auto_14951 ?auto_14965 ) ) ( not ( = ?auto_14982 ?auto_14975 ) ) ( not ( = ?auto_14982 ?auto_14964 ) ) ( not ( = ?auto_14982 ?auto_14968 ) ) ( not ( = ?auto_14982 ?auto_14973 ) ) ( not ( = ?auto_14982 ?auto_14981 ) ) ( not ( = ?auto_14982 ?auto_14976 ) ) ( not ( = ?auto_14982 ?auto_14966 ) ) ( not ( = ?auto_14982 ?auto_14965 ) ) ( not ( = ?auto_14945 ?auto_14955 ) ) ( not ( = ?auto_14945 ?auto_14959 ) ) ( not ( = ?auto_14946 ?auto_14955 ) ) ( not ( = ?auto_14946 ?auto_14959 ) ) ( not ( = ?auto_14947 ?auto_14955 ) ) ( not ( = ?auto_14947 ?auto_14959 ) ) ( not ( = ?auto_14948 ?auto_14955 ) ) ( not ( = ?auto_14948 ?auto_14959 ) ) ( not ( = ?auto_14949 ?auto_14955 ) ) ( not ( = ?auto_14949 ?auto_14959 ) ) ( not ( = ?auto_14952 ?auto_14955 ) ) ( not ( = ?auto_14952 ?auto_14959 ) ) ( not ( = ?auto_14950 ?auto_14955 ) ) ( not ( = ?auto_14950 ?auto_14959 ) ) ( not ( = ?auto_14954 ?auto_14955 ) ) ( not ( = ?auto_14954 ?auto_14959 ) ) ( not ( = ?auto_14953 ?auto_14955 ) ) ( not ( = ?auto_14953 ?auto_14959 ) ) ( not ( = ?auto_14955 ?auto_14982 ) ) ( not ( = ?auto_14955 ?auto_14975 ) ) ( not ( = ?auto_14955 ?auto_14964 ) ) ( not ( = ?auto_14955 ?auto_14968 ) ) ( not ( = ?auto_14955 ?auto_14973 ) ) ( not ( = ?auto_14955 ?auto_14981 ) ) ( not ( = ?auto_14955 ?auto_14976 ) ) ( not ( = ?auto_14955 ?auto_14966 ) ) ( not ( = ?auto_14955 ?auto_14965 ) ) ( not ( = ?auto_14957 ?auto_14962 ) ) ( not ( = ?auto_14957 ?auto_14967 ) ) ( not ( = ?auto_14957 ?auto_14972 ) ) ( not ( = ?auto_14957 ?auto_14971 ) ) ( not ( = ?auto_14957 ?auto_14977 ) ) ( not ( = ?auto_14957 ?auto_14970 ) ) ( not ( = ?auto_14961 ?auto_14980 ) ) ( not ( = ?auto_14961 ?auto_14979 ) ) ( not ( = ?auto_14961 ?auto_14963 ) ) ( not ( = ?auto_14961 ?auto_14978 ) ) ( not ( = ?auto_14961 ?auto_14969 ) ) ( not ( = ?auto_14961 ?auto_14974 ) ) ( not ( = ?auto_14959 ?auto_14982 ) ) ( not ( = ?auto_14959 ?auto_14975 ) ) ( not ( = ?auto_14959 ?auto_14964 ) ) ( not ( = ?auto_14959 ?auto_14968 ) ) ( not ( = ?auto_14959 ?auto_14973 ) ) ( not ( = ?auto_14959 ?auto_14981 ) ) ( not ( = ?auto_14959 ?auto_14976 ) ) ( not ( = ?auto_14959 ?auto_14966 ) ) ( not ( = ?auto_14959 ?auto_14965 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14945 ?auto_14946 ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14952 ?auto_14950 ?auto_14954 ?auto_14953 ?auto_14951 )
      ( MAKE-1CRATE ?auto_14951 ?auto_14955 )
      ( MAKE-10CRATE-VERIFY ?auto_14945 ?auto_14946 ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14952 ?auto_14950 ?auto_14954 ?auto_14953 ?auto_14951 ?auto_14955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14985 - SURFACE
      ?auto_14986 - SURFACE
    )
    :vars
    (
      ?auto_14987 - HOIST
      ?auto_14988 - PLACE
      ?auto_14990 - PLACE
      ?auto_14991 - HOIST
      ?auto_14992 - SURFACE
      ?auto_14989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14987 ?auto_14988 ) ( SURFACE-AT ?auto_14985 ?auto_14988 ) ( CLEAR ?auto_14985 ) ( IS-CRATE ?auto_14986 ) ( AVAILABLE ?auto_14987 ) ( not ( = ?auto_14990 ?auto_14988 ) ) ( HOIST-AT ?auto_14991 ?auto_14990 ) ( AVAILABLE ?auto_14991 ) ( SURFACE-AT ?auto_14986 ?auto_14990 ) ( ON ?auto_14986 ?auto_14992 ) ( CLEAR ?auto_14986 ) ( TRUCK-AT ?auto_14989 ?auto_14988 ) ( not ( = ?auto_14985 ?auto_14986 ) ) ( not ( = ?auto_14985 ?auto_14992 ) ) ( not ( = ?auto_14986 ?auto_14992 ) ) ( not ( = ?auto_14987 ?auto_14991 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14989 ?auto_14988 ?auto_14990 )
      ( !LIFT ?auto_14991 ?auto_14986 ?auto_14992 ?auto_14990 )
      ( !LOAD ?auto_14991 ?auto_14986 ?auto_14989 ?auto_14990 )
      ( !DRIVE ?auto_14989 ?auto_14990 ?auto_14988 )
      ( !UNLOAD ?auto_14987 ?auto_14986 ?auto_14989 ?auto_14988 )
      ( !DROP ?auto_14987 ?auto_14986 ?auto_14985 ?auto_14988 )
      ( MAKE-1CRATE-VERIFY ?auto_14985 ?auto_14986 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15005 - SURFACE
      ?auto_15006 - SURFACE
      ?auto_15007 - SURFACE
      ?auto_15008 - SURFACE
      ?auto_15009 - SURFACE
      ?auto_15012 - SURFACE
      ?auto_15010 - SURFACE
      ?auto_15014 - SURFACE
      ?auto_15013 - SURFACE
      ?auto_15011 - SURFACE
      ?auto_15016 - SURFACE
      ?auto_15015 - SURFACE
    )
    :vars
    (
      ?auto_15022 - HOIST
      ?auto_15017 - PLACE
      ?auto_15020 - PLACE
      ?auto_15019 - HOIST
      ?auto_15021 - SURFACE
      ?auto_15035 - PLACE
      ?auto_15044 - HOIST
      ?auto_15045 - SURFACE
      ?auto_15023 - PLACE
      ?auto_15024 - HOIST
      ?auto_15042 - SURFACE
      ?auto_15025 - PLACE
      ?auto_15031 - HOIST
      ?auto_15037 - SURFACE
      ?auto_15040 - PLACE
      ?auto_15046 - HOIST
      ?auto_15029 - SURFACE
      ?auto_15034 - PLACE
      ?auto_15028 - HOIST
      ?auto_15036 - SURFACE
      ?auto_15030 - SURFACE
      ?auto_15038 - PLACE
      ?auto_15041 - HOIST
      ?auto_15043 - SURFACE
      ?auto_15033 - SURFACE
      ?auto_15026 - PLACE
      ?auto_15039 - HOIST
      ?auto_15032 - SURFACE
      ?auto_15027 - SURFACE
      ?auto_15018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15022 ?auto_15017 ) ( IS-CRATE ?auto_15015 ) ( not ( = ?auto_15020 ?auto_15017 ) ) ( HOIST-AT ?auto_15019 ?auto_15020 ) ( AVAILABLE ?auto_15019 ) ( SURFACE-AT ?auto_15015 ?auto_15020 ) ( ON ?auto_15015 ?auto_15021 ) ( CLEAR ?auto_15015 ) ( not ( = ?auto_15016 ?auto_15015 ) ) ( not ( = ?auto_15016 ?auto_15021 ) ) ( not ( = ?auto_15015 ?auto_15021 ) ) ( not ( = ?auto_15022 ?auto_15019 ) ) ( IS-CRATE ?auto_15016 ) ( not ( = ?auto_15035 ?auto_15017 ) ) ( HOIST-AT ?auto_15044 ?auto_15035 ) ( AVAILABLE ?auto_15044 ) ( SURFACE-AT ?auto_15016 ?auto_15035 ) ( ON ?auto_15016 ?auto_15045 ) ( CLEAR ?auto_15016 ) ( not ( = ?auto_15011 ?auto_15016 ) ) ( not ( = ?auto_15011 ?auto_15045 ) ) ( not ( = ?auto_15016 ?auto_15045 ) ) ( not ( = ?auto_15022 ?auto_15044 ) ) ( IS-CRATE ?auto_15011 ) ( not ( = ?auto_15023 ?auto_15017 ) ) ( HOIST-AT ?auto_15024 ?auto_15023 ) ( SURFACE-AT ?auto_15011 ?auto_15023 ) ( ON ?auto_15011 ?auto_15042 ) ( CLEAR ?auto_15011 ) ( not ( = ?auto_15013 ?auto_15011 ) ) ( not ( = ?auto_15013 ?auto_15042 ) ) ( not ( = ?auto_15011 ?auto_15042 ) ) ( not ( = ?auto_15022 ?auto_15024 ) ) ( IS-CRATE ?auto_15013 ) ( not ( = ?auto_15025 ?auto_15017 ) ) ( HOIST-AT ?auto_15031 ?auto_15025 ) ( AVAILABLE ?auto_15031 ) ( SURFACE-AT ?auto_15013 ?auto_15025 ) ( ON ?auto_15013 ?auto_15037 ) ( CLEAR ?auto_15013 ) ( not ( = ?auto_15014 ?auto_15013 ) ) ( not ( = ?auto_15014 ?auto_15037 ) ) ( not ( = ?auto_15013 ?auto_15037 ) ) ( not ( = ?auto_15022 ?auto_15031 ) ) ( IS-CRATE ?auto_15014 ) ( not ( = ?auto_15040 ?auto_15017 ) ) ( HOIST-AT ?auto_15046 ?auto_15040 ) ( SURFACE-AT ?auto_15014 ?auto_15040 ) ( ON ?auto_15014 ?auto_15029 ) ( CLEAR ?auto_15014 ) ( not ( = ?auto_15010 ?auto_15014 ) ) ( not ( = ?auto_15010 ?auto_15029 ) ) ( not ( = ?auto_15014 ?auto_15029 ) ) ( not ( = ?auto_15022 ?auto_15046 ) ) ( IS-CRATE ?auto_15010 ) ( not ( = ?auto_15034 ?auto_15017 ) ) ( HOIST-AT ?auto_15028 ?auto_15034 ) ( AVAILABLE ?auto_15028 ) ( SURFACE-AT ?auto_15010 ?auto_15034 ) ( ON ?auto_15010 ?auto_15036 ) ( CLEAR ?auto_15010 ) ( not ( = ?auto_15012 ?auto_15010 ) ) ( not ( = ?auto_15012 ?auto_15036 ) ) ( not ( = ?auto_15010 ?auto_15036 ) ) ( not ( = ?auto_15022 ?auto_15028 ) ) ( IS-CRATE ?auto_15012 ) ( SURFACE-AT ?auto_15012 ?auto_15023 ) ( ON ?auto_15012 ?auto_15030 ) ( CLEAR ?auto_15012 ) ( not ( = ?auto_15009 ?auto_15012 ) ) ( not ( = ?auto_15009 ?auto_15030 ) ) ( not ( = ?auto_15012 ?auto_15030 ) ) ( IS-CRATE ?auto_15009 ) ( not ( = ?auto_15038 ?auto_15017 ) ) ( HOIST-AT ?auto_15041 ?auto_15038 ) ( AVAILABLE ?auto_15041 ) ( SURFACE-AT ?auto_15009 ?auto_15038 ) ( ON ?auto_15009 ?auto_15043 ) ( CLEAR ?auto_15009 ) ( not ( = ?auto_15008 ?auto_15009 ) ) ( not ( = ?auto_15008 ?auto_15043 ) ) ( not ( = ?auto_15009 ?auto_15043 ) ) ( not ( = ?auto_15022 ?auto_15041 ) ) ( IS-CRATE ?auto_15008 ) ( AVAILABLE ?auto_15046 ) ( SURFACE-AT ?auto_15008 ?auto_15040 ) ( ON ?auto_15008 ?auto_15033 ) ( CLEAR ?auto_15008 ) ( not ( = ?auto_15007 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15033 ) ) ( not ( = ?auto_15008 ?auto_15033 ) ) ( IS-CRATE ?auto_15007 ) ( not ( = ?auto_15026 ?auto_15017 ) ) ( HOIST-AT ?auto_15039 ?auto_15026 ) ( AVAILABLE ?auto_15039 ) ( SURFACE-AT ?auto_15007 ?auto_15026 ) ( ON ?auto_15007 ?auto_15032 ) ( CLEAR ?auto_15007 ) ( not ( = ?auto_15006 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15032 ) ) ( not ( = ?auto_15007 ?auto_15032 ) ) ( not ( = ?auto_15022 ?auto_15039 ) ) ( SURFACE-AT ?auto_15005 ?auto_15017 ) ( CLEAR ?auto_15005 ) ( IS-CRATE ?auto_15006 ) ( AVAILABLE ?auto_15022 ) ( AVAILABLE ?auto_15024 ) ( SURFACE-AT ?auto_15006 ?auto_15023 ) ( ON ?auto_15006 ?auto_15027 ) ( CLEAR ?auto_15006 ) ( TRUCK-AT ?auto_15018 ?auto_15017 ) ( not ( = ?auto_15005 ?auto_15006 ) ) ( not ( = ?auto_15005 ?auto_15027 ) ) ( not ( = ?auto_15006 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15007 ) ) ( not ( = ?auto_15005 ?auto_15032 ) ) ( not ( = ?auto_15007 ?auto_15027 ) ) ( not ( = ?auto_15026 ?auto_15023 ) ) ( not ( = ?auto_15039 ?auto_15024 ) ) ( not ( = ?auto_15032 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15008 ) ) ( not ( = ?auto_15005 ?auto_15033 ) ) ( not ( = ?auto_15006 ?auto_15008 ) ) ( not ( = ?auto_15006 ?auto_15033 ) ) ( not ( = ?auto_15008 ?auto_15032 ) ) ( not ( = ?auto_15008 ?auto_15027 ) ) ( not ( = ?auto_15040 ?auto_15026 ) ) ( not ( = ?auto_15040 ?auto_15023 ) ) ( not ( = ?auto_15046 ?auto_15039 ) ) ( not ( = ?auto_15046 ?auto_15024 ) ) ( not ( = ?auto_15033 ?auto_15032 ) ) ( not ( = ?auto_15033 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15009 ) ) ( not ( = ?auto_15005 ?auto_15043 ) ) ( not ( = ?auto_15006 ?auto_15009 ) ) ( not ( = ?auto_15006 ?auto_15043 ) ) ( not ( = ?auto_15007 ?auto_15009 ) ) ( not ( = ?auto_15007 ?auto_15043 ) ) ( not ( = ?auto_15009 ?auto_15033 ) ) ( not ( = ?auto_15009 ?auto_15032 ) ) ( not ( = ?auto_15009 ?auto_15027 ) ) ( not ( = ?auto_15038 ?auto_15040 ) ) ( not ( = ?auto_15038 ?auto_15026 ) ) ( not ( = ?auto_15038 ?auto_15023 ) ) ( not ( = ?auto_15041 ?auto_15046 ) ) ( not ( = ?auto_15041 ?auto_15039 ) ) ( not ( = ?auto_15041 ?auto_15024 ) ) ( not ( = ?auto_15043 ?auto_15033 ) ) ( not ( = ?auto_15043 ?auto_15032 ) ) ( not ( = ?auto_15043 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15012 ) ) ( not ( = ?auto_15005 ?auto_15030 ) ) ( not ( = ?auto_15006 ?auto_15012 ) ) ( not ( = ?auto_15006 ?auto_15030 ) ) ( not ( = ?auto_15007 ?auto_15012 ) ) ( not ( = ?auto_15007 ?auto_15030 ) ) ( not ( = ?auto_15008 ?auto_15012 ) ) ( not ( = ?auto_15008 ?auto_15030 ) ) ( not ( = ?auto_15012 ?auto_15043 ) ) ( not ( = ?auto_15012 ?auto_15033 ) ) ( not ( = ?auto_15012 ?auto_15032 ) ) ( not ( = ?auto_15012 ?auto_15027 ) ) ( not ( = ?auto_15030 ?auto_15043 ) ) ( not ( = ?auto_15030 ?auto_15033 ) ) ( not ( = ?auto_15030 ?auto_15032 ) ) ( not ( = ?auto_15030 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15010 ) ) ( not ( = ?auto_15005 ?auto_15036 ) ) ( not ( = ?auto_15006 ?auto_15010 ) ) ( not ( = ?auto_15006 ?auto_15036 ) ) ( not ( = ?auto_15007 ?auto_15010 ) ) ( not ( = ?auto_15007 ?auto_15036 ) ) ( not ( = ?auto_15008 ?auto_15010 ) ) ( not ( = ?auto_15008 ?auto_15036 ) ) ( not ( = ?auto_15009 ?auto_15010 ) ) ( not ( = ?auto_15009 ?auto_15036 ) ) ( not ( = ?auto_15010 ?auto_15030 ) ) ( not ( = ?auto_15010 ?auto_15043 ) ) ( not ( = ?auto_15010 ?auto_15033 ) ) ( not ( = ?auto_15010 ?auto_15032 ) ) ( not ( = ?auto_15010 ?auto_15027 ) ) ( not ( = ?auto_15034 ?auto_15023 ) ) ( not ( = ?auto_15034 ?auto_15038 ) ) ( not ( = ?auto_15034 ?auto_15040 ) ) ( not ( = ?auto_15034 ?auto_15026 ) ) ( not ( = ?auto_15028 ?auto_15024 ) ) ( not ( = ?auto_15028 ?auto_15041 ) ) ( not ( = ?auto_15028 ?auto_15046 ) ) ( not ( = ?auto_15028 ?auto_15039 ) ) ( not ( = ?auto_15036 ?auto_15030 ) ) ( not ( = ?auto_15036 ?auto_15043 ) ) ( not ( = ?auto_15036 ?auto_15033 ) ) ( not ( = ?auto_15036 ?auto_15032 ) ) ( not ( = ?auto_15036 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15014 ) ) ( not ( = ?auto_15005 ?auto_15029 ) ) ( not ( = ?auto_15006 ?auto_15014 ) ) ( not ( = ?auto_15006 ?auto_15029 ) ) ( not ( = ?auto_15007 ?auto_15014 ) ) ( not ( = ?auto_15007 ?auto_15029 ) ) ( not ( = ?auto_15008 ?auto_15014 ) ) ( not ( = ?auto_15008 ?auto_15029 ) ) ( not ( = ?auto_15009 ?auto_15014 ) ) ( not ( = ?auto_15009 ?auto_15029 ) ) ( not ( = ?auto_15012 ?auto_15014 ) ) ( not ( = ?auto_15012 ?auto_15029 ) ) ( not ( = ?auto_15014 ?auto_15036 ) ) ( not ( = ?auto_15014 ?auto_15030 ) ) ( not ( = ?auto_15014 ?auto_15043 ) ) ( not ( = ?auto_15014 ?auto_15033 ) ) ( not ( = ?auto_15014 ?auto_15032 ) ) ( not ( = ?auto_15014 ?auto_15027 ) ) ( not ( = ?auto_15029 ?auto_15036 ) ) ( not ( = ?auto_15029 ?auto_15030 ) ) ( not ( = ?auto_15029 ?auto_15043 ) ) ( not ( = ?auto_15029 ?auto_15033 ) ) ( not ( = ?auto_15029 ?auto_15032 ) ) ( not ( = ?auto_15029 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15013 ) ) ( not ( = ?auto_15005 ?auto_15037 ) ) ( not ( = ?auto_15006 ?auto_15013 ) ) ( not ( = ?auto_15006 ?auto_15037 ) ) ( not ( = ?auto_15007 ?auto_15013 ) ) ( not ( = ?auto_15007 ?auto_15037 ) ) ( not ( = ?auto_15008 ?auto_15013 ) ) ( not ( = ?auto_15008 ?auto_15037 ) ) ( not ( = ?auto_15009 ?auto_15013 ) ) ( not ( = ?auto_15009 ?auto_15037 ) ) ( not ( = ?auto_15012 ?auto_15013 ) ) ( not ( = ?auto_15012 ?auto_15037 ) ) ( not ( = ?auto_15010 ?auto_15013 ) ) ( not ( = ?auto_15010 ?auto_15037 ) ) ( not ( = ?auto_15013 ?auto_15029 ) ) ( not ( = ?auto_15013 ?auto_15036 ) ) ( not ( = ?auto_15013 ?auto_15030 ) ) ( not ( = ?auto_15013 ?auto_15043 ) ) ( not ( = ?auto_15013 ?auto_15033 ) ) ( not ( = ?auto_15013 ?auto_15032 ) ) ( not ( = ?auto_15013 ?auto_15027 ) ) ( not ( = ?auto_15025 ?auto_15040 ) ) ( not ( = ?auto_15025 ?auto_15034 ) ) ( not ( = ?auto_15025 ?auto_15023 ) ) ( not ( = ?auto_15025 ?auto_15038 ) ) ( not ( = ?auto_15025 ?auto_15026 ) ) ( not ( = ?auto_15031 ?auto_15046 ) ) ( not ( = ?auto_15031 ?auto_15028 ) ) ( not ( = ?auto_15031 ?auto_15024 ) ) ( not ( = ?auto_15031 ?auto_15041 ) ) ( not ( = ?auto_15031 ?auto_15039 ) ) ( not ( = ?auto_15037 ?auto_15029 ) ) ( not ( = ?auto_15037 ?auto_15036 ) ) ( not ( = ?auto_15037 ?auto_15030 ) ) ( not ( = ?auto_15037 ?auto_15043 ) ) ( not ( = ?auto_15037 ?auto_15033 ) ) ( not ( = ?auto_15037 ?auto_15032 ) ) ( not ( = ?auto_15037 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15011 ) ) ( not ( = ?auto_15005 ?auto_15042 ) ) ( not ( = ?auto_15006 ?auto_15011 ) ) ( not ( = ?auto_15006 ?auto_15042 ) ) ( not ( = ?auto_15007 ?auto_15011 ) ) ( not ( = ?auto_15007 ?auto_15042 ) ) ( not ( = ?auto_15008 ?auto_15011 ) ) ( not ( = ?auto_15008 ?auto_15042 ) ) ( not ( = ?auto_15009 ?auto_15011 ) ) ( not ( = ?auto_15009 ?auto_15042 ) ) ( not ( = ?auto_15012 ?auto_15011 ) ) ( not ( = ?auto_15012 ?auto_15042 ) ) ( not ( = ?auto_15010 ?auto_15011 ) ) ( not ( = ?auto_15010 ?auto_15042 ) ) ( not ( = ?auto_15014 ?auto_15011 ) ) ( not ( = ?auto_15014 ?auto_15042 ) ) ( not ( = ?auto_15011 ?auto_15037 ) ) ( not ( = ?auto_15011 ?auto_15029 ) ) ( not ( = ?auto_15011 ?auto_15036 ) ) ( not ( = ?auto_15011 ?auto_15030 ) ) ( not ( = ?auto_15011 ?auto_15043 ) ) ( not ( = ?auto_15011 ?auto_15033 ) ) ( not ( = ?auto_15011 ?auto_15032 ) ) ( not ( = ?auto_15011 ?auto_15027 ) ) ( not ( = ?auto_15042 ?auto_15037 ) ) ( not ( = ?auto_15042 ?auto_15029 ) ) ( not ( = ?auto_15042 ?auto_15036 ) ) ( not ( = ?auto_15042 ?auto_15030 ) ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15033 ) ) ( not ( = ?auto_15042 ?auto_15032 ) ) ( not ( = ?auto_15042 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15016 ) ) ( not ( = ?auto_15005 ?auto_15045 ) ) ( not ( = ?auto_15006 ?auto_15016 ) ) ( not ( = ?auto_15006 ?auto_15045 ) ) ( not ( = ?auto_15007 ?auto_15016 ) ) ( not ( = ?auto_15007 ?auto_15045 ) ) ( not ( = ?auto_15008 ?auto_15016 ) ) ( not ( = ?auto_15008 ?auto_15045 ) ) ( not ( = ?auto_15009 ?auto_15016 ) ) ( not ( = ?auto_15009 ?auto_15045 ) ) ( not ( = ?auto_15012 ?auto_15016 ) ) ( not ( = ?auto_15012 ?auto_15045 ) ) ( not ( = ?auto_15010 ?auto_15016 ) ) ( not ( = ?auto_15010 ?auto_15045 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15045 ) ) ( not ( = ?auto_15013 ?auto_15016 ) ) ( not ( = ?auto_15013 ?auto_15045 ) ) ( not ( = ?auto_15016 ?auto_15042 ) ) ( not ( = ?auto_15016 ?auto_15037 ) ) ( not ( = ?auto_15016 ?auto_15029 ) ) ( not ( = ?auto_15016 ?auto_15036 ) ) ( not ( = ?auto_15016 ?auto_15030 ) ) ( not ( = ?auto_15016 ?auto_15043 ) ) ( not ( = ?auto_15016 ?auto_15033 ) ) ( not ( = ?auto_15016 ?auto_15032 ) ) ( not ( = ?auto_15016 ?auto_15027 ) ) ( not ( = ?auto_15035 ?auto_15023 ) ) ( not ( = ?auto_15035 ?auto_15025 ) ) ( not ( = ?auto_15035 ?auto_15040 ) ) ( not ( = ?auto_15035 ?auto_15034 ) ) ( not ( = ?auto_15035 ?auto_15038 ) ) ( not ( = ?auto_15035 ?auto_15026 ) ) ( not ( = ?auto_15044 ?auto_15024 ) ) ( not ( = ?auto_15044 ?auto_15031 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15028 ) ) ( not ( = ?auto_15044 ?auto_15041 ) ) ( not ( = ?auto_15044 ?auto_15039 ) ) ( not ( = ?auto_15045 ?auto_15042 ) ) ( not ( = ?auto_15045 ?auto_15037 ) ) ( not ( = ?auto_15045 ?auto_15029 ) ) ( not ( = ?auto_15045 ?auto_15036 ) ) ( not ( = ?auto_15045 ?auto_15030 ) ) ( not ( = ?auto_15045 ?auto_15043 ) ) ( not ( = ?auto_15045 ?auto_15033 ) ) ( not ( = ?auto_15045 ?auto_15032 ) ) ( not ( = ?auto_15045 ?auto_15027 ) ) ( not ( = ?auto_15005 ?auto_15015 ) ) ( not ( = ?auto_15005 ?auto_15021 ) ) ( not ( = ?auto_15006 ?auto_15015 ) ) ( not ( = ?auto_15006 ?auto_15021 ) ) ( not ( = ?auto_15007 ?auto_15015 ) ) ( not ( = ?auto_15007 ?auto_15021 ) ) ( not ( = ?auto_15008 ?auto_15015 ) ) ( not ( = ?auto_15008 ?auto_15021 ) ) ( not ( = ?auto_15009 ?auto_15015 ) ) ( not ( = ?auto_15009 ?auto_15021 ) ) ( not ( = ?auto_15012 ?auto_15015 ) ) ( not ( = ?auto_15012 ?auto_15021 ) ) ( not ( = ?auto_15010 ?auto_15015 ) ) ( not ( = ?auto_15010 ?auto_15021 ) ) ( not ( = ?auto_15014 ?auto_15015 ) ) ( not ( = ?auto_15014 ?auto_15021 ) ) ( not ( = ?auto_15013 ?auto_15015 ) ) ( not ( = ?auto_15013 ?auto_15021 ) ) ( not ( = ?auto_15011 ?auto_15015 ) ) ( not ( = ?auto_15011 ?auto_15021 ) ) ( not ( = ?auto_15015 ?auto_15045 ) ) ( not ( = ?auto_15015 ?auto_15042 ) ) ( not ( = ?auto_15015 ?auto_15037 ) ) ( not ( = ?auto_15015 ?auto_15029 ) ) ( not ( = ?auto_15015 ?auto_15036 ) ) ( not ( = ?auto_15015 ?auto_15030 ) ) ( not ( = ?auto_15015 ?auto_15043 ) ) ( not ( = ?auto_15015 ?auto_15033 ) ) ( not ( = ?auto_15015 ?auto_15032 ) ) ( not ( = ?auto_15015 ?auto_15027 ) ) ( not ( = ?auto_15020 ?auto_15035 ) ) ( not ( = ?auto_15020 ?auto_15023 ) ) ( not ( = ?auto_15020 ?auto_15025 ) ) ( not ( = ?auto_15020 ?auto_15040 ) ) ( not ( = ?auto_15020 ?auto_15034 ) ) ( not ( = ?auto_15020 ?auto_15038 ) ) ( not ( = ?auto_15020 ?auto_15026 ) ) ( not ( = ?auto_15019 ?auto_15044 ) ) ( not ( = ?auto_15019 ?auto_15024 ) ) ( not ( = ?auto_15019 ?auto_15031 ) ) ( not ( = ?auto_15019 ?auto_15046 ) ) ( not ( = ?auto_15019 ?auto_15028 ) ) ( not ( = ?auto_15019 ?auto_15041 ) ) ( not ( = ?auto_15019 ?auto_15039 ) ) ( not ( = ?auto_15021 ?auto_15045 ) ) ( not ( = ?auto_15021 ?auto_15042 ) ) ( not ( = ?auto_15021 ?auto_15037 ) ) ( not ( = ?auto_15021 ?auto_15029 ) ) ( not ( = ?auto_15021 ?auto_15036 ) ) ( not ( = ?auto_15021 ?auto_15030 ) ) ( not ( = ?auto_15021 ?auto_15043 ) ) ( not ( = ?auto_15021 ?auto_15033 ) ) ( not ( = ?auto_15021 ?auto_15032 ) ) ( not ( = ?auto_15021 ?auto_15027 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15005 ?auto_15006 ?auto_15007 ?auto_15008 ?auto_15009 ?auto_15012 ?auto_15010 ?auto_15014 ?auto_15013 ?auto_15011 ?auto_15016 )
      ( MAKE-1CRATE ?auto_15016 ?auto_15015 )
      ( MAKE-11CRATE-VERIFY ?auto_15005 ?auto_15006 ?auto_15007 ?auto_15008 ?auto_15009 ?auto_15012 ?auto_15010 ?auto_15014 ?auto_15013 ?auto_15011 ?auto_15016 ?auto_15015 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15049 - SURFACE
      ?auto_15050 - SURFACE
    )
    :vars
    (
      ?auto_15051 - HOIST
      ?auto_15052 - PLACE
      ?auto_15054 - PLACE
      ?auto_15055 - HOIST
      ?auto_15056 - SURFACE
      ?auto_15053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15051 ?auto_15052 ) ( SURFACE-AT ?auto_15049 ?auto_15052 ) ( CLEAR ?auto_15049 ) ( IS-CRATE ?auto_15050 ) ( AVAILABLE ?auto_15051 ) ( not ( = ?auto_15054 ?auto_15052 ) ) ( HOIST-AT ?auto_15055 ?auto_15054 ) ( AVAILABLE ?auto_15055 ) ( SURFACE-AT ?auto_15050 ?auto_15054 ) ( ON ?auto_15050 ?auto_15056 ) ( CLEAR ?auto_15050 ) ( TRUCK-AT ?auto_15053 ?auto_15052 ) ( not ( = ?auto_15049 ?auto_15050 ) ) ( not ( = ?auto_15049 ?auto_15056 ) ) ( not ( = ?auto_15050 ?auto_15056 ) ) ( not ( = ?auto_15051 ?auto_15055 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15053 ?auto_15052 ?auto_15054 )
      ( !LIFT ?auto_15055 ?auto_15050 ?auto_15056 ?auto_15054 )
      ( !LOAD ?auto_15055 ?auto_15050 ?auto_15053 ?auto_15054 )
      ( !DRIVE ?auto_15053 ?auto_15054 ?auto_15052 )
      ( !UNLOAD ?auto_15051 ?auto_15050 ?auto_15053 ?auto_15052 )
      ( !DROP ?auto_15051 ?auto_15050 ?auto_15049 ?auto_15052 )
      ( MAKE-1CRATE-VERIFY ?auto_15049 ?auto_15050 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15070 - SURFACE
      ?auto_15071 - SURFACE
      ?auto_15072 - SURFACE
      ?auto_15073 - SURFACE
      ?auto_15074 - SURFACE
      ?auto_15077 - SURFACE
      ?auto_15075 - SURFACE
      ?auto_15079 - SURFACE
      ?auto_15078 - SURFACE
      ?auto_15076 - SURFACE
      ?auto_15081 - SURFACE
      ?auto_15080 - SURFACE
      ?auto_15082 - SURFACE
    )
    :vars
    (
      ?auto_15087 - HOIST
      ?auto_15088 - PLACE
      ?auto_15084 - PLACE
      ?auto_15086 - HOIST
      ?auto_15085 - SURFACE
      ?auto_15107 - PLACE
      ?auto_15091 - HOIST
      ?auto_15103 - SURFACE
      ?auto_15102 - PLACE
      ?auto_15106 - HOIST
      ?auto_15093 - SURFACE
      ?auto_15105 - SURFACE
      ?auto_15097 - PLACE
      ?auto_15109 - HOIST
      ?auto_15095 - SURFACE
      ?auto_15100 - PLACE
      ?auto_15096 - HOIST
      ?auto_15099 - SURFACE
      ?auto_15090 - PLACE
      ?auto_15108 - HOIST
      ?auto_15104 - SURFACE
      ?auto_15101 - SURFACE
      ?auto_15092 - PLACE
      ?auto_15094 - HOIST
      ?auto_15110 - SURFACE
      ?auto_15111 - SURFACE
      ?auto_15089 - PLACE
      ?auto_15098 - HOIST
      ?auto_15112 - SURFACE
      ?auto_15113 - SURFACE
      ?auto_15083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15087 ?auto_15088 ) ( IS-CRATE ?auto_15082 ) ( not ( = ?auto_15084 ?auto_15088 ) ) ( HOIST-AT ?auto_15086 ?auto_15084 ) ( SURFACE-AT ?auto_15082 ?auto_15084 ) ( ON ?auto_15082 ?auto_15085 ) ( CLEAR ?auto_15082 ) ( not ( = ?auto_15080 ?auto_15082 ) ) ( not ( = ?auto_15080 ?auto_15085 ) ) ( not ( = ?auto_15082 ?auto_15085 ) ) ( not ( = ?auto_15087 ?auto_15086 ) ) ( IS-CRATE ?auto_15080 ) ( not ( = ?auto_15107 ?auto_15088 ) ) ( HOIST-AT ?auto_15091 ?auto_15107 ) ( AVAILABLE ?auto_15091 ) ( SURFACE-AT ?auto_15080 ?auto_15107 ) ( ON ?auto_15080 ?auto_15103 ) ( CLEAR ?auto_15080 ) ( not ( = ?auto_15081 ?auto_15080 ) ) ( not ( = ?auto_15081 ?auto_15103 ) ) ( not ( = ?auto_15080 ?auto_15103 ) ) ( not ( = ?auto_15087 ?auto_15091 ) ) ( IS-CRATE ?auto_15081 ) ( not ( = ?auto_15102 ?auto_15088 ) ) ( HOIST-AT ?auto_15106 ?auto_15102 ) ( AVAILABLE ?auto_15106 ) ( SURFACE-AT ?auto_15081 ?auto_15102 ) ( ON ?auto_15081 ?auto_15093 ) ( CLEAR ?auto_15081 ) ( not ( = ?auto_15076 ?auto_15081 ) ) ( not ( = ?auto_15076 ?auto_15093 ) ) ( not ( = ?auto_15081 ?auto_15093 ) ) ( not ( = ?auto_15087 ?auto_15106 ) ) ( IS-CRATE ?auto_15076 ) ( SURFACE-AT ?auto_15076 ?auto_15084 ) ( ON ?auto_15076 ?auto_15105 ) ( CLEAR ?auto_15076 ) ( not ( = ?auto_15078 ?auto_15076 ) ) ( not ( = ?auto_15078 ?auto_15105 ) ) ( not ( = ?auto_15076 ?auto_15105 ) ) ( IS-CRATE ?auto_15078 ) ( not ( = ?auto_15097 ?auto_15088 ) ) ( HOIST-AT ?auto_15109 ?auto_15097 ) ( AVAILABLE ?auto_15109 ) ( SURFACE-AT ?auto_15078 ?auto_15097 ) ( ON ?auto_15078 ?auto_15095 ) ( CLEAR ?auto_15078 ) ( not ( = ?auto_15079 ?auto_15078 ) ) ( not ( = ?auto_15079 ?auto_15095 ) ) ( not ( = ?auto_15078 ?auto_15095 ) ) ( not ( = ?auto_15087 ?auto_15109 ) ) ( IS-CRATE ?auto_15079 ) ( not ( = ?auto_15100 ?auto_15088 ) ) ( HOIST-AT ?auto_15096 ?auto_15100 ) ( SURFACE-AT ?auto_15079 ?auto_15100 ) ( ON ?auto_15079 ?auto_15099 ) ( CLEAR ?auto_15079 ) ( not ( = ?auto_15075 ?auto_15079 ) ) ( not ( = ?auto_15075 ?auto_15099 ) ) ( not ( = ?auto_15079 ?auto_15099 ) ) ( not ( = ?auto_15087 ?auto_15096 ) ) ( IS-CRATE ?auto_15075 ) ( not ( = ?auto_15090 ?auto_15088 ) ) ( HOIST-AT ?auto_15108 ?auto_15090 ) ( AVAILABLE ?auto_15108 ) ( SURFACE-AT ?auto_15075 ?auto_15090 ) ( ON ?auto_15075 ?auto_15104 ) ( CLEAR ?auto_15075 ) ( not ( = ?auto_15077 ?auto_15075 ) ) ( not ( = ?auto_15077 ?auto_15104 ) ) ( not ( = ?auto_15075 ?auto_15104 ) ) ( not ( = ?auto_15087 ?auto_15108 ) ) ( IS-CRATE ?auto_15077 ) ( SURFACE-AT ?auto_15077 ?auto_15084 ) ( ON ?auto_15077 ?auto_15101 ) ( CLEAR ?auto_15077 ) ( not ( = ?auto_15074 ?auto_15077 ) ) ( not ( = ?auto_15074 ?auto_15101 ) ) ( not ( = ?auto_15077 ?auto_15101 ) ) ( IS-CRATE ?auto_15074 ) ( not ( = ?auto_15092 ?auto_15088 ) ) ( HOIST-AT ?auto_15094 ?auto_15092 ) ( AVAILABLE ?auto_15094 ) ( SURFACE-AT ?auto_15074 ?auto_15092 ) ( ON ?auto_15074 ?auto_15110 ) ( CLEAR ?auto_15074 ) ( not ( = ?auto_15073 ?auto_15074 ) ) ( not ( = ?auto_15073 ?auto_15110 ) ) ( not ( = ?auto_15074 ?auto_15110 ) ) ( not ( = ?auto_15087 ?auto_15094 ) ) ( IS-CRATE ?auto_15073 ) ( AVAILABLE ?auto_15096 ) ( SURFACE-AT ?auto_15073 ?auto_15100 ) ( ON ?auto_15073 ?auto_15111 ) ( CLEAR ?auto_15073 ) ( not ( = ?auto_15072 ?auto_15073 ) ) ( not ( = ?auto_15072 ?auto_15111 ) ) ( not ( = ?auto_15073 ?auto_15111 ) ) ( IS-CRATE ?auto_15072 ) ( not ( = ?auto_15089 ?auto_15088 ) ) ( HOIST-AT ?auto_15098 ?auto_15089 ) ( AVAILABLE ?auto_15098 ) ( SURFACE-AT ?auto_15072 ?auto_15089 ) ( ON ?auto_15072 ?auto_15112 ) ( CLEAR ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( not ( = ?auto_15071 ?auto_15112 ) ) ( not ( = ?auto_15072 ?auto_15112 ) ) ( not ( = ?auto_15087 ?auto_15098 ) ) ( SURFACE-AT ?auto_15070 ?auto_15088 ) ( CLEAR ?auto_15070 ) ( IS-CRATE ?auto_15071 ) ( AVAILABLE ?auto_15087 ) ( AVAILABLE ?auto_15086 ) ( SURFACE-AT ?auto_15071 ?auto_15084 ) ( ON ?auto_15071 ?auto_15113 ) ( CLEAR ?auto_15071 ) ( TRUCK-AT ?auto_15083 ?auto_15088 ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15113 ) ) ( not ( = ?auto_15071 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15112 ) ) ( not ( = ?auto_15072 ?auto_15113 ) ) ( not ( = ?auto_15089 ?auto_15084 ) ) ( not ( = ?auto_15098 ?auto_15086 ) ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15073 ) ) ( not ( = ?auto_15070 ?auto_15111 ) ) ( not ( = ?auto_15071 ?auto_15073 ) ) ( not ( = ?auto_15071 ?auto_15111 ) ) ( not ( = ?auto_15073 ?auto_15112 ) ) ( not ( = ?auto_15073 ?auto_15113 ) ) ( not ( = ?auto_15100 ?auto_15089 ) ) ( not ( = ?auto_15100 ?auto_15084 ) ) ( not ( = ?auto_15096 ?auto_15098 ) ) ( not ( = ?auto_15096 ?auto_15086 ) ) ( not ( = ?auto_15111 ?auto_15112 ) ) ( not ( = ?auto_15111 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15074 ) ) ( not ( = ?auto_15070 ?auto_15110 ) ) ( not ( = ?auto_15071 ?auto_15074 ) ) ( not ( = ?auto_15071 ?auto_15110 ) ) ( not ( = ?auto_15072 ?auto_15074 ) ) ( not ( = ?auto_15072 ?auto_15110 ) ) ( not ( = ?auto_15074 ?auto_15111 ) ) ( not ( = ?auto_15074 ?auto_15112 ) ) ( not ( = ?auto_15074 ?auto_15113 ) ) ( not ( = ?auto_15092 ?auto_15100 ) ) ( not ( = ?auto_15092 ?auto_15089 ) ) ( not ( = ?auto_15092 ?auto_15084 ) ) ( not ( = ?auto_15094 ?auto_15096 ) ) ( not ( = ?auto_15094 ?auto_15098 ) ) ( not ( = ?auto_15094 ?auto_15086 ) ) ( not ( = ?auto_15110 ?auto_15111 ) ) ( not ( = ?auto_15110 ?auto_15112 ) ) ( not ( = ?auto_15110 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15077 ) ) ( not ( = ?auto_15070 ?auto_15101 ) ) ( not ( = ?auto_15071 ?auto_15077 ) ) ( not ( = ?auto_15071 ?auto_15101 ) ) ( not ( = ?auto_15072 ?auto_15077 ) ) ( not ( = ?auto_15072 ?auto_15101 ) ) ( not ( = ?auto_15073 ?auto_15077 ) ) ( not ( = ?auto_15073 ?auto_15101 ) ) ( not ( = ?auto_15077 ?auto_15110 ) ) ( not ( = ?auto_15077 ?auto_15111 ) ) ( not ( = ?auto_15077 ?auto_15112 ) ) ( not ( = ?auto_15077 ?auto_15113 ) ) ( not ( = ?auto_15101 ?auto_15110 ) ) ( not ( = ?auto_15101 ?auto_15111 ) ) ( not ( = ?auto_15101 ?auto_15112 ) ) ( not ( = ?auto_15101 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15075 ) ) ( not ( = ?auto_15070 ?auto_15104 ) ) ( not ( = ?auto_15071 ?auto_15075 ) ) ( not ( = ?auto_15071 ?auto_15104 ) ) ( not ( = ?auto_15072 ?auto_15075 ) ) ( not ( = ?auto_15072 ?auto_15104 ) ) ( not ( = ?auto_15073 ?auto_15075 ) ) ( not ( = ?auto_15073 ?auto_15104 ) ) ( not ( = ?auto_15074 ?auto_15075 ) ) ( not ( = ?auto_15074 ?auto_15104 ) ) ( not ( = ?auto_15075 ?auto_15101 ) ) ( not ( = ?auto_15075 ?auto_15110 ) ) ( not ( = ?auto_15075 ?auto_15111 ) ) ( not ( = ?auto_15075 ?auto_15112 ) ) ( not ( = ?auto_15075 ?auto_15113 ) ) ( not ( = ?auto_15090 ?auto_15084 ) ) ( not ( = ?auto_15090 ?auto_15092 ) ) ( not ( = ?auto_15090 ?auto_15100 ) ) ( not ( = ?auto_15090 ?auto_15089 ) ) ( not ( = ?auto_15108 ?auto_15086 ) ) ( not ( = ?auto_15108 ?auto_15094 ) ) ( not ( = ?auto_15108 ?auto_15096 ) ) ( not ( = ?auto_15108 ?auto_15098 ) ) ( not ( = ?auto_15104 ?auto_15101 ) ) ( not ( = ?auto_15104 ?auto_15110 ) ) ( not ( = ?auto_15104 ?auto_15111 ) ) ( not ( = ?auto_15104 ?auto_15112 ) ) ( not ( = ?auto_15104 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15079 ) ) ( not ( = ?auto_15070 ?auto_15099 ) ) ( not ( = ?auto_15071 ?auto_15079 ) ) ( not ( = ?auto_15071 ?auto_15099 ) ) ( not ( = ?auto_15072 ?auto_15079 ) ) ( not ( = ?auto_15072 ?auto_15099 ) ) ( not ( = ?auto_15073 ?auto_15079 ) ) ( not ( = ?auto_15073 ?auto_15099 ) ) ( not ( = ?auto_15074 ?auto_15079 ) ) ( not ( = ?auto_15074 ?auto_15099 ) ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( not ( = ?auto_15077 ?auto_15099 ) ) ( not ( = ?auto_15079 ?auto_15104 ) ) ( not ( = ?auto_15079 ?auto_15101 ) ) ( not ( = ?auto_15079 ?auto_15110 ) ) ( not ( = ?auto_15079 ?auto_15111 ) ) ( not ( = ?auto_15079 ?auto_15112 ) ) ( not ( = ?auto_15079 ?auto_15113 ) ) ( not ( = ?auto_15099 ?auto_15104 ) ) ( not ( = ?auto_15099 ?auto_15101 ) ) ( not ( = ?auto_15099 ?auto_15110 ) ) ( not ( = ?auto_15099 ?auto_15111 ) ) ( not ( = ?auto_15099 ?auto_15112 ) ) ( not ( = ?auto_15099 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15078 ) ) ( not ( = ?auto_15070 ?auto_15095 ) ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( not ( = ?auto_15071 ?auto_15095 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15072 ?auto_15095 ) ) ( not ( = ?auto_15073 ?auto_15078 ) ) ( not ( = ?auto_15073 ?auto_15095 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15074 ?auto_15095 ) ) ( not ( = ?auto_15077 ?auto_15078 ) ) ( not ( = ?auto_15077 ?auto_15095 ) ) ( not ( = ?auto_15075 ?auto_15078 ) ) ( not ( = ?auto_15075 ?auto_15095 ) ) ( not ( = ?auto_15078 ?auto_15099 ) ) ( not ( = ?auto_15078 ?auto_15104 ) ) ( not ( = ?auto_15078 ?auto_15101 ) ) ( not ( = ?auto_15078 ?auto_15110 ) ) ( not ( = ?auto_15078 ?auto_15111 ) ) ( not ( = ?auto_15078 ?auto_15112 ) ) ( not ( = ?auto_15078 ?auto_15113 ) ) ( not ( = ?auto_15097 ?auto_15100 ) ) ( not ( = ?auto_15097 ?auto_15090 ) ) ( not ( = ?auto_15097 ?auto_15084 ) ) ( not ( = ?auto_15097 ?auto_15092 ) ) ( not ( = ?auto_15097 ?auto_15089 ) ) ( not ( = ?auto_15109 ?auto_15096 ) ) ( not ( = ?auto_15109 ?auto_15108 ) ) ( not ( = ?auto_15109 ?auto_15086 ) ) ( not ( = ?auto_15109 ?auto_15094 ) ) ( not ( = ?auto_15109 ?auto_15098 ) ) ( not ( = ?auto_15095 ?auto_15099 ) ) ( not ( = ?auto_15095 ?auto_15104 ) ) ( not ( = ?auto_15095 ?auto_15101 ) ) ( not ( = ?auto_15095 ?auto_15110 ) ) ( not ( = ?auto_15095 ?auto_15111 ) ) ( not ( = ?auto_15095 ?auto_15112 ) ) ( not ( = ?auto_15095 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15076 ) ) ( not ( = ?auto_15070 ?auto_15105 ) ) ( not ( = ?auto_15071 ?auto_15076 ) ) ( not ( = ?auto_15071 ?auto_15105 ) ) ( not ( = ?auto_15072 ?auto_15076 ) ) ( not ( = ?auto_15072 ?auto_15105 ) ) ( not ( = ?auto_15073 ?auto_15076 ) ) ( not ( = ?auto_15073 ?auto_15105 ) ) ( not ( = ?auto_15074 ?auto_15076 ) ) ( not ( = ?auto_15074 ?auto_15105 ) ) ( not ( = ?auto_15077 ?auto_15076 ) ) ( not ( = ?auto_15077 ?auto_15105 ) ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15105 ) ) ( not ( = ?auto_15079 ?auto_15076 ) ) ( not ( = ?auto_15079 ?auto_15105 ) ) ( not ( = ?auto_15076 ?auto_15095 ) ) ( not ( = ?auto_15076 ?auto_15099 ) ) ( not ( = ?auto_15076 ?auto_15104 ) ) ( not ( = ?auto_15076 ?auto_15101 ) ) ( not ( = ?auto_15076 ?auto_15110 ) ) ( not ( = ?auto_15076 ?auto_15111 ) ) ( not ( = ?auto_15076 ?auto_15112 ) ) ( not ( = ?auto_15076 ?auto_15113 ) ) ( not ( = ?auto_15105 ?auto_15095 ) ) ( not ( = ?auto_15105 ?auto_15099 ) ) ( not ( = ?auto_15105 ?auto_15104 ) ) ( not ( = ?auto_15105 ?auto_15101 ) ) ( not ( = ?auto_15105 ?auto_15110 ) ) ( not ( = ?auto_15105 ?auto_15111 ) ) ( not ( = ?auto_15105 ?auto_15112 ) ) ( not ( = ?auto_15105 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15081 ) ) ( not ( = ?auto_15070 ?auto_15093 ) ) ( not ( = ?auto_15071 ?auto_15081 ) ) ( not ( = ?auto_15071 ?auto_15093 ) ) ( not ( = ?auto_15072 ?auto_15081 ) ) ( not ( = ?auto_15072 ?auto_15093 ) ) ( not ( = ?auto_15073 ?auto_15081 ) ) ( not ( = ?auto_15073 ?auto_15093 ) ) ( not ( = ?auto_15074 ?auto_15081 ) ) ( not ( = ?auto_15074 ?auto_15093 ) ) ( not ( = ?auto_15077 ?auto_15081 ) ) ( not ( = ?auto_15077 ?auto_15093 ) ) ( not ( = ?auto_15075 ?auto_15081 ) ) ( not ( = ?auto_15075 ?auto_15093 ) ) ( not ( = ?auto_15079 ?auto_15081 ) ) ( not ( = ?auto_15079 ?auto_15093 ) ) ( not ( = ?auto_15078 ?auto_15081 ) ) ( not ( = ?auto_15078 ?auto_15093 ) ) ( not ( = ?auto_15081 ?auto_15105 ) ) ( not ( = ?auto_15081 ?auto_15095 ) ) ( not ( = ?auto_15081 ?auto_15099 ) ) ( not ( = ?auto_15081 ?auto_15104 ) ) ( not ( = ?auto_15081 ?auto_15101 ) ) ( not ( = ?auto_15081 ?auto_15110 ) ) ( not ( = ?auto_15081 ?auto_15111 ) ) ( not ( = ?auto_15081 ?auto_15112 ) ) ( not ( = ?auto_15081 ?auto_15113 ) ) ( not ( = ?auto_15102 ?auto_15084 ) ) ( not ( = ?auto_15102 ?auto_15097 ) ) ( not ( = ?auto_15102 ?auto_15100 ) ) ( not ( = ?auto_15102 ?auto_15090 ) ) ( not ( = ?auto_15102 ?auto_15092 ) ) ( not ( = ?auto_15102 ?auto_15089 ) ) ( not ( = ?auto_15106 ?auto_15086 ) ) ( not ( = ?auto_15106 ?auto_15109 ) ) ( not ( = ?auto_15106 ?auto_15096 ) ) ( not ( = ?auto_15106 ?auto_15108 ) ) ( not ( = ?auto_15106 ?auto_15094 ) ) ( not ( = ?auto_15106 ?auto_15098 ) ) ( not ( = ?auto_15093 ?auto_15105 ) ) ( not ( = ?auto_15093 ?auto_15095 ) ) ( not ( = ?auto_15093 ?auto_15099 ) ) ( not ( = ?auto_15093 ?auto_15104 ) ) ( not ( = ?auto_15093 ?auto_15101 ) ) ( not ( = ?auto_15093 ?auto_15110 ) ) ( not ( = ?auto_15093 ?auto_15111 ) ) ( not ( = ?auto_15093 ?auto_15112 ) ) ( not ( = ?auto_15093 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15080 ) ) ( not ( = ?auto_15070 ?auto_15103 ) ) ( not ( = ?auto_15071 ?auto_15080 ) ) ( not ( = ?auto_15071 ?auto_15103 ) ) ( not ( = ?auto_15072 ?auto_15080 ) ) ( not ( = ?auto_15072 ?auto_15103 ) ) ( not ( = ?auto_15073 ?auto_15080 ) ) ( not ( = ?auto_15073 ?auto_15103 ) ) ( not ( = ?auto_15074 ?auto_15080 ) ) ( not ( = ?auto_15074 ?auto_15103 ) ) ( not ( = ?auto_15077 ?auto_15080 ) ) ( not ( = ?auto_15077 ?auto_15103 ) ) ( not ( = ?auto_15075 ?auto_15080 ) ) ( not ( = ?auto_15075 ?auto_15103 ) ) ( not ( = ?auto_15079 ?auto_15080 ) ) ( not ( = ?auto_15079 ?auto_15103 ) ) ( not ( = ?auto_15078 ?auto_15080 ) ) ( not ( = ?auto_15078 ?auto_15103 ) ) ( not ( = ?auto_15076 ?auto_15080 ) ) ( not ( = ?auto_15076 ?auto_15103 ) ) ( not ( = ?auto_15080 ?auto_15093 ) ) ( not ( = ?auto_15080 ?auto_15105 ) ) ( not ( = ?auto_15080 ?auto_15095 ) ) ( not ( = ?auto_15080 ?auto_15099 ) ) ( not ( = ?auto_15080 ?auto_15104 ) ) ( not ( = ?auto_15080 ?auto_15101 ) ) ( not ( = ?auto_15080 ?auto_15110 ) ) ( not ( = ?auto_15080 ?auto_15111 ) ) ( not ( = ?auto_15080 ?auto_15112 ) ) ( not ( = ?auto_15080 ?auto_15113 ) ) ( not ( = ?auto_15107 ?auto_15102 ) ) ( not ( = ?auto_15107 ?auto_15084 ) ) ( not ( = ?auto_15107 ?auto_15097 ) ) ( not ( = ?auto_15107 ?auto_15100 ) ) ( not ( = ?auto_15107 ?auto_15090 ) ) ( not ( = ?auto_15107 ?auto_15092 ) ) ( not ( = ?auto_15107 ?auto_15089 ) ) ( not ( = ?auto_15091 ?auto_15106 ) ) ( not ( = ?auto_15091 ?auto_15086 ) ) ( not ( = ?auto_15091 ?auto_15109 ) ) ( not ( = ?auto_15091 ?auto_15096 ) ) ( not ( = ?auto_15091 ?auto_15108 ) ) ( not ( = ?auto_15091 ?auto_15094 ) ) ( not ( = ?auto_15091 ?auto_15098 ) ) ( not ( = ?auto_15103 ?auto_15093 ) ) ( not ( = ?auto_15103 ?auto_15105 ) ) ( not ( = ?auto_15103 ?auto_15095 ) ) ( not ( = ?auto_15103 ?auto_15099 ) ) ( not ( = ?auto_15103 ?auto_15104 ) ) ( not ( = ?auto_15103 ?auto_15101 ) ) ( not ( = ?auto_15103 ?auto_15110 ) ) ( not ( = ?auto_15103 ?auto_15111 ) ) ( not ( = ?auto_15103 ?auto_15112 ) ) ( not ( = ?auto_15103 ?auto_15113 ) ) ( not ( = ?auto_15070 ?auto_15082 ) ) ( not ( = ?auto_15070 ?auto_15085 ) ) ( not ( = ?auto_15071 ?auto_15082 ) ) ( not ( = ?auto_15071 ?auto_15085 ) ) ( not ( = ?auto_15072 ?auto_15082 ) ) ( not ( = ?auto_15072 ?auto_15085 ) ) ( not ( = ?auto_15073 ?auto_15082 ) ) ( not ( = ?auto_15073 ?auto_15085 ) ) ( not ( = ?auto_15074 ?auto_15082 ) ) ( not ( = ?auto_15074 ?auto_15085 ) ) ( not ( = ?auto_15077 ?auto_15082 ) ) ( not ( = ?auto_15077 ?auto_15085 ) ) ( not ( = ?auto_15075 ?auto_15082 ) ) ( not ( = ?auto_15075 ?auto_15085 ) ) ( not ( = ?auto_15079 ?auto_15082 ) ) ( not ( = ?auto_15079 ?auto_15085 ) ) ( not ( = ?auto_15078 ?auto_15082 ) ) ( not ( = ?auto_15078 ?auto_15085 ) ) ( not ( = ?auto_15076 ?auto_15082 ) ) ( not ( = ?auto_15076 ?auto_15085 ) ) ( not ( = ?auto_15081 ?auto_15082 ) ) ( not ( = ?auto_15081 ?auto_15085 ) ) ( not ( = ?auto_15082 ?auto_15103 ) ) ( not ( = ?auto_15082 ?auto_15093 ) ) ( not ( = ?auto_15082 ?auto_15105 ) ) ( not ( = ?auto_15082 ?auto_15095 ) ) ( not ( = ?auto_15082 ?auto_15099 ) ) ( not ( = ?auto_15082 ?auto_15104 ) ) ( not ( = ?auto_15082 ?auto_15101 ) ) ( not ( = ?auto_15082 ?auto_15110 ) ) ( not ( = ?auto_15082 ?auto_15111 ) ) ( not ( = ?auto_15082 ?auto_15112 ) ) ( not ( = ?auto_15082 ?auto_15113 ) ) ( not ( = ?auto_15085 ?auto_15103 ) ) ( not ( = ?auto_15085 ?auto_15093 ) ) ( not ( = ?auto_15085 ?auto_15105 ) ) ( not ( = ?auto_15085 ?auto_15095 ) ) ( not ( = ?auto_15085 ?auto_15099 ) ) ( not ( = ?auto_15085 ?auto_15104 ) ) ( not ( = ?auto_15085 ?auto_15101 ) ) ( not ( = ?auto_15085 ?auto_15110 ) ) ( not ( = ?auto_15085 ?auto_15111 ) ) ( not ( = ?auto_15085 ?auto_15112 ) ) ( not ( = ?auto_15085 ?auto_15113 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15070 ?auto_15071 ?auto_15072 ?auto_15073 ?auto_15074 ?auto_15077 ?auto_15075 ?auto_15079 ?auto_15078 ?auto_15076 ?auto_15081 ?auto_15080 )
      ( MAKE-1CRATE ?auto_15080 ?auto_15082 )
      ( MAKE-12CRATE-VERIFY ?auto_15070 ?auto_15071 ?auto_15072 ?auto_15073 ?auto_15074 ?auto_15077 ?auto_15075 ?auto_15079 ?auto_15078 ?auto_15076 ?auto_15081 ?auto_15080 ?auto_15082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15116 - SURFACE
      ?auto_15117 - SURFACE
    )
    :vars
    (
      ?auto_15118 - HOIST
      ?auto_15119 - PLACE
      ?auto_15121 - PLACE
      ?auto_15122 - HOIST
      ?auto_15123 - SURFACE
      ?auto_15120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15118 ?auto_15119 ) ( SURFACE-AT ?auto_15116 ?auto_15119 ) ( CLEAR ?auto_15116 ) ( IS-CRATE ?auto_15117 ) ( AVAILABLE ?auto_15118 ) ( not ( = ?auto_15121 ?auto_15119 ) ) ( HOIST-AT ?auto_15122 ?auto_15121 ) ( AVAILABLE ?auto_15122 ) ( SURFACE-AT ?auto_15117 ?auto_15121 ) ( ON ?auto_15117 ?auto_15123 ) ( CLEAR ?auto_15117 ) ( TRUCK-AT ?auto_15120 ?auto_15119 ) ( not ( = ?auto_15116 ?auto_15117 ) ) ( not ( = ?auto_15116 ?auto_15123 ) ) ( not ( = ?auto_15117 ?auto_15123 ) ) ( not ( = ?auto_15118 ?auto_15122 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15120 ?auto_15119 ?auto_15121 )
      ( !LIFT ?auto_15122 ?auto_15117 ?auto_15123 ?auto_15121 )
      ( !LOAD ?auto_15122 ?auto_15117 ?auto_15120 ?auto_15121 )
      ( !DRIVE ?auto_15120 ?auto_15121 ?auto_15119 )
      ( !UNLOAD ?auto_15118 ?auto_15117 ?auto_15120 ?auto_15119 )
      ( !DROP ?auto_15118 ?auto_15117 ?auto_15116 ?auto_15119 )
      ( MAKE-1CRATE-VERIFY ?auto_15116 ?auto_15117 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15138 - SURFACE
      ?auto_15139 - SURFACE
      ?auto_15140 - SURFACE
      ?auto_15141 - SURFACE
      ?auto_15142 - SURFACE
      ?auto_15145 - SURFACE
      ?auto_15143 - SURFACE
      ?auto_15147 - SURFACE
      ?auto_15146 - SURFACE
      ?auto_15144 - SURFACE
      ?auto_15149 - SURFACE
      ?auto_15148 - SURFACE
      ?auto_15150 - SURFACE
      ?auto_15151 - SURFACE
    )
    :vars
    (
      ?auto_15152 - HOIST
      ?auto_15157 - PLACE
      ?auto_15156 - PLACE
      ?auto_15153 - HOIST
      ?auto_15155 - SURFACE
      ?auto_15166 - PLACE
      ?auto_15167 - HOIST
      ?auto_15165 - SURFACE
      ?auto_15178 - PLACE
      ?auto_15173 - HOIST
      ?auto_15171 - SURFACE
      ?auto_15162 - PLACE
      ?auto_15168 - HOIST
      ?auto_15182 - SURFACE
      ?auto_15163 - SURFACE
      ?auto_15158 - PLACE
      ?auto_15179 - HOIST
      ?auto_15176 - SURFACE
      ?auto_15181 - PLACE
      ?auto_15177 - HOIST
      ?auto_15161 - SURFACE
      ?auto_15180 - PLACE
      ?auto_15170 - HOIST
      ?auto_15175 - SURFACE
      ?auto_15160 - SURFACE
      ?auto_15172 - PLACE
      ?auto_15174 - HOIST
      ?auto_15183 - SURFACE
      ?auto_15169 - SURFACE
      ?auto_15159 - SURFACE
      ?auto_15164 - SURFACE
      ?auto_15154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15152 ?auto_15157 ) ( IS-CRATE ?auto_15151 ) ( not ( = ?auto_15156 ?auto_15157 ) ) ( HOIST-AT ?auto_15153 ?auto_15156 ) ( SURFACE-AT ?auto_15151 ?auto_15156 ) ( ON ?auto_15151 ?auto_15155 ) ( CLEAR ?auto_15151 ) ( not ( = ?auto_15150 ?auto_15151 ) ) ( not ( = ?auto_15150 ?auto_15155 ) ) ( not ( = ?auto_15151 ?auto_15155 ) ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( IS-CRATE ?auto_15150 ) ( not ( = ?auto_15166 ?auto_15157 ) ) ( HOIST-AT ?auto_15167 ?auto_15166 ) ( SURFACE-AT ?auto_15150 ?auto_15166 ) ( ON ?auto_15150 ?auto_15165 ) ( CLEAR ?auto_15150 ) ( not ( = ?auto_15148 ?auto_15150 ) ) ( not ( = ?auto_15148 ?auto_15165 ) ) ( not ( = ?auto_15150 ?auto_15165 ) ) ( not ( = ?auto_15152 ?auto_15167 ) ) ( IS-CRATE ?auto_15148 ) ( not ( = ?auto_15178 ?auto_15157 ) ) ( HOIST-AT ?auto_15173 ?auto_15178 ) ( AVAILABLE ?auto_15173 ) ( SURFACE-AT ?auto_15148 ?auto_15178 ) ( ON ?auto_15148 ?auto_15171 ) ( CLEAR ?auto_15148 ) ( not ( = ?auto_15149 ?auto_15148 ) ) ( not ( = ?auto_15149 ?auto_15171 ) ) ( not ( = ?auto_15148 ?auto_15171 ) ) ( not ( = ?auto_15152 ?auto_15173 ) ) ( IS-CRATE ?auto_15149 ) ( not ( = ?auto_15162 ?auto_15157 ) ) ( HOIST-AT ?auto_15168 ?auto_15162 ) ( AVAILABLE ?auto_15168 ) ( SURFACE-AT ?auto_15149 ?auto_15162 ) ( ON ?auto_15149 ?auto_15182 ) ( CLEAR ?auto_15149 ) ( not ( = ?auto_15144 ?auto_15149 ) ) ( not ( = ?auto_15144 ?auto_15182 ) ) ( not ( = ?auto_15149 ?auto_15182 ) ) ( not ( = ?auto_15152 ?auto_15168 ) ) ( IS-CRATE ?auto_15144 ) ( SURFACE-AT ?auto_15144 ?auto_15166 ) ( ON ?auto_15144 ?auto_15163 ) ( CLEAR ?auto_15144 ) ( not ( = ?auto_15146 ?auto_15144 ) ) ( not ( = ?auto_15146 ?auto_15163 ) ) ( not ( = ?auto_15144 ?auto_15163 ) ) ( IS-CRATE ?auto_15146 ) ( not ( = ?auto_15158 ?auto_15157 ) ) ( HOIST-AT ?auto_15179 ?auto_15158 ) ( AVAILABLE ?auto_15179 ) ( SURFACE-AT ?auto_15146 ?auto_15158 ) ( ON ?auto_15146 ?auto_15176 ) ( CLEAR ?auto_15146 ) ( not ( = ?auto_15147 ?auto_15146 ) ) ( not ( = ?auto_15147 ?auto_15176 ) ) ( not ( = ?auto_15146 ?auto_15176 ) ) ( not ( = ?auto_15152 ?auto_15179 ) ) ( IS-CRATE ?auto_15147 ) ( not ( = ?auto_15181 ?auto_15157 ) ) ( HOIST-AT ?auto_15177 ?auto_15181 ) ( SURFACE-AT ?auto_15147 ?auto_15181 ) ( ON ?auto_15147 ?auto_15161 ) ( CLEAR ?auto_15147 ) ( not ( = ?auto_15143 ?auto_15147 ) ) ( not ( = ?auto_15143 ?auto_15161 ) ) ( not ( = ?auto_15147 ?auto_15161 ) ) ( not ( = ?auto_15152 ?auto_15177 ) ) ( IS-CRATE ?auto_15143 ) ( not ( = ?auto_15180 ?auto_15157 ) ) ( HOIST-AT ?auto_15170 ?auto_15180 ) ( AVAILABLE ?auto_15170 ) ( SURFACE-AT ?auto_15143 ?auto_15180 ) ( ON ?auto_15143 ?auto_15175 ) ( CLEAR ?auto_15143 ) ( not ( = ?auto_15145 ?auto_15143 ) ) ( not ( = ?auto_15145 ?auto_15175 ) ) ( not ( = ?auto_15143 ?auto_15175 ) ) ( not ( = ?auto_15152 ?auto_15170 ) ) ( IS-CRATE ?auto_15145 ) ( SURFACE-AT ?auto_15145 ?auto_15166 ) ( ON ?auto_15145 ?auto_15160 ) ( CLEAR ?auto_15145 ) ( not ( = ?auto_15142 ?auto_15145 ) ) ( not ( = ?auto_15142 ?auto_15160 ) ) ( not ( = ?auto_15145 ?auto_15160 ) ) ( IS-CRATE ?auto_15142 ) ( not ( = ?auto_15172 ?auto_15157 ) ) ( HOIST-AT ?auto_15174 ?auto_15172 ) ( AVAILABLE ?auto_15174 ) ( SURFACE-AT ?auto_15142 ?auto_15172 ) ( ON ?auto_15142 ?auto_15183 ) ( CLEAR ?auto_15142 ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15141 ?auto_15183 ) ) ( not ( = ?auto_15142 ?auto_15183 ) ) ( not ( = ?auto_15152 ?auto_15174 ) ) ( IS-CRATE ?auto_15141 ) ( AVAILABLE ?auto_15177 ) ( SURFACE-AT ?auto_15141 ?auto_15181 ) ( ON ?auto_15141 ?auto_15169 ) ( CLEAR ?auto_15141 ) ( not ( = ?auto_15140 ?auto_15141 ) ) ( not ( = ?auto_15140 ?auto_15169 ) ) ( not ( = ?auto_15141 ?auto_15169 ) ) ( IS-CRATE ?auto_15140 ) ( AVAILABLE ?auto_15153 ) ( SURFACE-AT ?auto_15140 ?auto_15156 ) ( ON ?auto_15140 ?auto_15159 ) ( CLEAR ?auto_15140 ) ( not ( = ?auto_15139 ?auto_15140 ) ) ( not ( = ?auto_15139 ?auto_15159 ) ) ( not ( = ?auto_15140 ?auto_15159 ) ) ( SURFACE-AT ?auto_15138 ?auto_15157 ) ( CLEAR ?auto_15138 ) ( IS-CRATE ?auto_15139 ) ( AVAILABLE ?auto_15152 ) ( AVAILABLE ?auto_15167 ) ( SURFACE-AT ?auto_15139 ?auto_15166 ) ( ON ?auto_15139 ?auto_15164 ) ( CLEAR ?auto_15139 ) ( TRUCK-AT ?auto_15154 ?auto_15157 ) ( not ( = ?auto_15138 ?auto_15139 ) ) ( not ( = ?auto_15138 ?auto_15164 ) ) ( not ( = ?auto_15139 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15140 ) ) ( not ( = ?auto_15138 ?auto_15159 ) ) ( not ( = ?auto_15140 ?auto_15164 ) ) ( not ( = ?auto_15156 ?auto_15166 ) ) ( not ( = ?auto_15153 ?auto_15167 ) ) ( not ( = ?auto_15159 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15141 ) ) ( not ( = ?auto_15138 ?auto_15169 ) ) ( not ( = ?auto_15139 ?auto_15141 ) ) ( not ( = ?auto_15139 ?auto_15169 ) ) ( not ( = ?auto_15141 ?auto_15159 ) ) ( not ( = ?auto_15141 ?auto_15164 ) ) ( not ( = ?auto_15181 ?auto_15156 ) ) ( not ( = ?auto_15181 ?auto_15166 ) ) ( not ( = ?auto_15177 ?auto_15153 ) ) ( not ( = ?auto_15177 ?auto_15167 ) ) ( not ( = ?auto_15169 ?auto_15159 ) ) ( not ( = ?auto_15169 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15142 ) ) ( not ( = ?auto_15138 ?auto_15183 ) ) ( not ( = ?auto_15139 ?auto_15142 ) ) ( not ( = ?auto_15139 ?auto_15183 ) ) ( not ( = ?auto_15140 ?auto_15142 ) ) ( not ( = ?auto_15140 ?auto_15183 ) ) ( not ( = ?auto_15142 ?auto_15169 ) ) ( not ( = ?auto_15142 ?auto_15159 ) ) ( not ( = ?auto_15142 ?auto_15164 ) ) ( not ( = ?auto_15172 ?auto_15181 ) ) ( not ( = ?auto_15172 ?auto_15156 ) ) ( not ( = ?auto_15172 ?auto_15166 ) ) ( not ( = ?auto_15174 ?auto_15177 ) ) ( not ( = ?auto_15174 ?auto_15153 ) ) ( not ( = ?auto_15174 ?auto_15167 ) ) ( not ( = ?auto_15183 ?auto_15169 ) ) ( not ( = ?auto_15183 ?auto_15159 ) ) ( not ( = ?auto_15183 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15145 ) ) ( not ( = ?auto_15138 ?auto_15160 ) ) ( not ( = ?auto_15139 ?auto_15145 ) ) ( not ( = ?auto_15139 ?auto_15160 ) ) ( not ( = ?auto_15140 ?auto_15145 ) ) ( not ( = ?auto_15140 ?auto_15160 ) ) ( not ( = ?auto_15141 ?auto_15145 ) ) ( not ( = ?auto_15141 ?auto_15160 ) ) ( not ( = ?auto_15145 ?auto_15183 ) ) ( not ( = ?auto_15145 ?auto_15169 ) ) ( not ( = ?auto_15145 ?auto_15159 ) ) ( not ( = ?auto_15145 ?auto_15164 ) ) ( not ( = ?auto_15160 ?auto_15183 ) ) ( not ( = ?auto_15160 ?auto_15169 ) ) ( not ( = ?auto_15160 ?auto_15159 ) ) ( not ( = ?auto_15160 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15143 ) ) ( not ( = ?auto_15138 ?auto_15175 ) ) ( not ( = ?auto_15139 ?auto_15143 ) ) ( not ( = ?auto_15139 ?auto_15175 ) ) ( not ( = ?auto_15140 ?auto_15143 ) ) ( not ( = ?auto_15140 ?auto_15175 ) ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15141 ?auto_15175 ) ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15175 ) ) ( not ( = ?auto_15143 ?auto_15160 ) ) ( not ( = ?auto_15143 ?auto_15183 ) ) ( not ( = ?auto_15143 ?auto_15169 ) ) ( not ( = ?auto_15143 ?auto_15159 ) ) ( not ( = ?auto_15143 ?auto_15164 ) ) ( not ( = ?auto_15180 ?auto_15166 ) ) ( not ( = ?auto_15180 ?auto_15172 ) ) ( not ( = ?auto_15180 ?auto_15181 ) ) ( not ( = ?auto_15180 ?auto_15156 ) ) ( not ( = ?auto_15170 ?auto_15167 ) ) ( not ( = ?auto_15170 ?auto_15174 ) ) ( not ( = ?auto_15170 ?auto_15177 ) ) ( not ( = ?auto_15170 ?auto_15153 ) ) ( not ( = ?auto_15175 ?auto_15160 ) ) ( not ( = ?auto_15175 ?auto_15183 ) ) ( not ( = ?auto_15175 ?auto_15169 ) ) ( not ( = ?auto_15175 ?auto_15159 ) ) ( not ( = ?auto_15175 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15147 ) ) ( not ( = ?auto_15138 ?auto_15161 ) ) ( not ( = ?auto_15139 ?auto_15147 ) ) ( not ( = ?auto_15139 ?auto_15161 ) ) ( not ( = ?auto_15140 ?auto_15147 ) ) ( not ( = ?auto_15140 ?auto_15161 ) ) ( not ( = ?auto_15141 ?auto_15147 ) ) ( not ( = ?auto_15141 ?auto_15161 ) ) ( not ( = ?auto_15142 ?auto_15147 ) ) ( not ( = ?auto_15142 ?auto_15161 ) ) ( not ( = ?auto_15145 ?auto_15147 ) ) ( not ( = ?auto_15145 ?auto_15161 ) ) ( not ( = ?auto_15147 ?auto_15175 ) ) ( not ( = ?auto_15147 ?auto_15160 ) ) ( not ( = ?auto_15147 ?auto_15183 ) ) ( not ( = ?auto_15147 ?auto_15169 ) ) ( not ( = ?auto_15147 ?auto_15159 ) ) ( not ( = ?auto_15147 ?auto_15164 ) ) ( not ( = ?auto_15161 ?auto_15175 ) ) ( not ( = ?auto_15161 ?auto_15160 ) ) ( not ( = ?auto_15161 ?auto_15183 ) ) ( not ( = ?auto_15161 ?auto_15169 ) ) ( not ( = ?auto_15161 ?auto_15159 ) ) ( not ( = ?auto_15161 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15146 ) ) ( not ( = ?auto_15138 ?auto_15176 ) ) ( not ( = ?auto_15139 ?auto_15146 ) ) ( not ( = ?auto_15139 ?auto_15176 ) ) ( not ( = ?auto_15140 ?auto_15146 ) ) ( not ( = ?auto_15140 ?auto_15176 ) ) ( not ( = ?auto_15141 ?auto_15146 ) ) ( not ( = ?auto_15141 ?auto_15176 ) ) ( not ( = ?auto_15142 ?auto_15146 ) ) ( not ( = ?auto_15142 ?auto_15176 ) ) ( not ( = ?auto_15145 ?auto_15146 ) ) ( not ( = ?auto_15145 ?auto_15176 ) ) ( not ( = ?auto_15143 ?auto_15146 ) ) ( not ( = ?auto_15143 ?auto_15176 ) ) ( not ( = ?auto_15146 ?auto_15161 ) ) ( not ( = ?auto_15146 ?auto_15175 ) ) ( not ( = ?auto_15146 ?auto_15160 ) ) ( not ( = ?auto_15146 ?auto_15183 ) ) ( not ( = ?auto_15146 ?auto_15169 ) ) ( not ( = ?auto_15146 ?auto_15159 ) ) ( not ( = ?auto_15146 ?auto_15164 ) ) ( not ( = ?auto_15158 ?auto_15181 ) ) ( not ( = ?auto_15158 ?auto_15180 ) ) ( not ( = ?auto_15158 ?auto_15166 ) ) ( not ( = ?auto_15158 ?auto_15172 ) ) ( not ( = ?auto_15158 ?auto_15156 ) ) ( not ( = ?auto_15179 ?auto_15177 ) ) ( not ( = ?auto_15179 ?auto_15170 ) ) ( not ( = ?auto_15179 ?auto_15167 ) ) ( not ( = ?auto_15179 ?auto_15174 ) ) ( not ( = ?auto_15179 ?auto_15153 ) ) ( not ( = ?auto_15176 ?auto_15161 ) ) ( not ( = ?auto_15176 ?auto_15175 ) ) ( not ( = ?auto_15176 ?auto_15160 ) ) ( not ( = ?auto_15176 ?auto_15183 ) ) ( not ( = ?auto_15176 ?auto_15169 ) ) ( not ( = ?auto_15176 ?auto_15159 ) ) ( not ( = ?auto_15176 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15144 ) ) ( not ( = ?auto_15138 ?auto_15163 ) ) ( not ( = ?auto_15139 ?auto_15144 ) ) ( not ( = ?auto_15139 ?auto_15163 ) ) ( not ( = ?auto_15140 ?auto_15144 ) ) ( not ( = ?auto_15140 ?auto_15163 ) ) ( not ( = ?auto_15141 ?auto_15144 ) ) ( not ( = ?auto_15141 ?auto_15163 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15142 ?auto_15163 ) ) ( not ( = ?auto_15145 ?auto_15144 ) ) ( not ( = ?auto_15145 ?auto_15163 ) ) ( not ( = ?auto_15143 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15163 ) ) ( not ( = ?auto_15147 ?auto_15144 ) ) ( not ( = ?auto_15147 ?auto_15163 ) ) ( not ( = ?auto_15144 ?auto_15176 ) ) ( not ( = ?auto_15144 ?auto_15161 ) ) ( not ( = ?auto_15144 ?auto_15175 ) ) ( not ( = ?auto_15144 ?auto_15160 ) ) ( not ( = ?auto_15144 ?auto_15183 ) ) ( not ( = ?auto_15144 ?auto_15169 ) ) ( not ( = ?auto_15144 ?auto_15159 ) ) ( not ( = ?auto_15144 ?auto_15164 ) ) ( not ( = ?auto_15163 ?auto_15176 ) ) ( not ( = ?auto_15163 ?auto_15161 ) ) ( not ( = ?auto_15163 ?auto_15175 ) ) ( not ( = ?auto_15163 ?auto_15160 ) ) ( not ( = ?auto_15163 ?auto_15183 ) ) ( not ( = ?auto_15163 ?auto_15169 ) ) ( not ( = ?auto_15163 ?auto_15159 ) ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15149 ) ) ( not ( = ?auto_15138 ?auto_15182 ) ) ( not ( = ?auto_15139 ?auto_15149 ) ) ( not ( = ?auto_15139 ?auto_15182 ) ) ( not ( = ?auto_15140 ?auto_15149 ) ) ( not ( = ?auto_15140 ?auto_15182 ) ) ( not ( = ?auto_15141 ?auto_15149 ) ) ( not ( = ?auto_15141 ?auto_15182 ) ) ( not ( = ?auto_15142 ?auto_15149 ) ) ( not ( = ?auto_15142 ?auto_15182 ) ) ( not ( = ?auto_15145 ?auto_15149 ) ) ( not ( = ?auto_15145 ?auto_15182 ) ) ( not ( = ?auto_15143 ?auto_15149 ) ) ( not ( = ?auto_15143 ?auto_15182 ) ) ( not ( = ?auto_15147 ?auto_15149 ) ) ( not ( = ?auto_15147 ?auto_15182 ) ) ( not ( = ?auto_15146 ?auto_15149 ) ) ( not ( = ?auto_15146 ?auto_15182 ) ) ( not ( = ?auto_15149 ?auto_15163 ) ) ( not ( = ?auto_15149 ?auto_15176 ) ) ( not ( = ?auto_15149 ?auto_15161 ) ) ( not ( = ?auto_15149 ?auto_15175 ) ) ( not ( = ?auto_15149 ?auto_15160 ) ) ( not ( = ?auto_15149 ?auto_15183 ) ) ( not ( = ?auto_15149 ?auto_15169 ) ) ( not ( = ?auto_15149 ?auto_15159 ) ) ( not ( = ?auto_15149 ?auto_15164 ) ) ( not ( = ?auto_15162 ?auto_15166 ) ) ( not ( = ?auto_15162 ?auto_15158 ) ) ( not ( = ?auto_15162 ?auto_15181 ) ) ( not ( = ?auto_15162 ?auto_15180 ) ) ( not ( = ?auto_15162 ?auto_15172 ) ) ( not ( = ?auto_15162 ?auto_15156 ) ) ( not ( = ?auto_15168 ?auto_15167 ) ) ( not ( = ?auto_15168 ?auto_15179 ) ) ( not ( = ?auto_15168 ?auto_15177 ) ) ( not ( = ?auto_15168 ?auto_15170 ) ) ( not ( = ?auto_15168 ?auto_15174 ) ) ( not ( = ?auto_15168 ?auto_15153 ) ) ( not ( = ?auto_15182 ?auto_15163 ) ) ( not ( = ?auto_15182 ?auto_15176 ) ) ( not ( = ?auto_15182 ?auto_15161 ) ) ( not ( = ?auto_15182 ?auto_15175 ) ) ( not ( = ?auto_15182 ?auto_15160 ) ) ( not ( = ?auto_15182 ?auto_15183 ) ) ( not ( = ?auto_15182 ?auto_15169 ) ) ( not ( = ?auto_15182 ?auto_15159 ) ) ( not ( = ?auto_15182 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15148 ) ) ( not ( = ?auto_15138 ?auto_15171 ) ) ( not ( = ?auto_15139 ?auto_15148 ) ) ( not ( = ?auto_15139 ?auto_15171 ) ) ( not ( = ?auto_15140 ?auto_15148 ) ) ( not ( = ?auto_15140 ?auto_15171 ) ) ( not ( = ?auto_15141 ?auto_15148 ) ) ( not ( = ?auto_15141 ?auto_15171 ) ) ( not ( = ?auto_15142 ?auto_15148 ) ) ( not ( = ?auto_15142 ?auto_15171 ) ) ( not ( = ?auto_15145 ?auto_15148 ) ) ( not ( = ?auto_15145 ?auto_15171 ) ) ( not ( = ?auto_15143 ?auto_15148 ) ) ( not ( = ?auto_15143 ?auto_15171 ) ) ( not ( = ?auto_15147 ?auto_15148 ) ) ( not ( = ?auto_15147 ?auto_15171 ) ) ( not ( = ?auto_15146 ?auto_15148 ) ) ( not ( = ?auto_15146 ?auto_15171 ) ) ( not ( = ?auto_15144 ?auto_15148 ) ) ( not ( = ?auto_15144 ?auto_15171 ) ) ( not ( = ?auto_15148 ?auto_15182 ) ) ( not ( = ?auto_15148 ?auto_15163 ) ) ( not ( = ?auto_15148 ?auto_15176 ) ) ( not ( = ?auto_15148 ?auto_15161 ) ) ( not ( = ?auto_15148 ?auto_15175 ) ) ( not ( = ?auto_15148 ?auto_15160 ) ) ( not ( = ?auto_15148 ?auto_15183 ) ) ( not ( = ?auto_15148 ?auto_15169 ) ) ( not ( = ?auto_15148 ?auto_15159 ) ) ( not ( = ?auto_15148 ?auto_15164 ) ) ( not ( = ?auto_15178 ?auto_15162 ) ) ( not ( = ?auto_15178 ?auto_15166 ) ) ( not ( = ?auto_15178 ?auto_15158 ) ) ( not ( = ?auto_15178 ?auto_15181 ) ) ( not ( = ?auto_15178 ?auto_15180 ) ) ( not ( = ?auto_15178 ?auto_15172 ) ) ( not ( = ?auto_15178 ?auto_15156 ) ) ( not ( = ?auto_15173 ?auto_15168 ) ) ( not ( = ?auto_15173 ?auto_15167 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15177 ) ) ( not ( = ?auto_15173 ?auto_15170 ) ) ( not ( = ?auto_15173 ?auto_15174 ) ) ( not ( = ?auto_15173 ?auto_15153 ) ) ( not ( = ?auto_15171 ?auto_15182 ) ) ( not ( = ?auto_15171 ?auto_15163 ) ) ( not ( = ?auto_15171 ?auto_15176 ) ) ( not ( = ?auto_15171 ?auto_15161 ) ) ( not ( = ?auto_15171 ?auto_15175 ) ) ( not ( = ?auto_15171 ?auto_15160 ) ) ( not ( = ?auto_15171 ?auto_15183 ) ) ( not ( = ?auto_15171 ?auto_15169 ) ) ( not ( = ?auto_15171 ?auto_15159 ) ) ( not ( = ?auto_15171 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15150 ) ) ( not ( = ?auto_15138 ?auto_15165 ) ) ( not ( = ?auto_15139 ?auto_15150 ) ) ( not ( = ?auto_15139 ?auto_15165 ) ) ( not ( = ?auto_15140 ?auto_15150 ) ) ( not ( = ?auto_15140 ?auto_15165 ) ) ( not ( = ?auto_15141 ?auto_15150 ) ) ( not ( = ?auto_15141 ?auto_15165 ) ) ( not ( = ?auto_15142 ?auto_15150 ) ) ( not ( = ?auto_15142 ?auto_15165 ) ) ( not ( = ?auto_15145 ?auto_15150 ) ) ( not ( = ?auto_15145 ?auto_15165 ) ) ( not ( = ?auto_15143 ?auto_15150 ) ) ( not ( = ?auto_15143 ?auto_15165 ) ) ( not ( = ?auto_15147 ?auto_15150 ) ) ( not ( = ?auto_15147 ?auto_15165 ) ) ( not ( = ?auto_15146 ?auto_15150 ) ) ( not ( = ?auto_15146 ?auto_15165 ) ) ( not ( = ?auto_15144 ?auto_15150 ) ) ( not ( = ?auto_15144 ?auto_15165 ) ) ( not ( = ?auto_15149 ?auto_15150 ) ) ( not ( = ?auto_15149 ?auto_15165 ) ) ( not ( = ?auto_15150 ?auto_15171 ) ) ( not ( = ?auto_15150 ?auto_15182 ) ) ( not ( = ?auto_15150 ?auto_15163 ) ) ( not ( = ?auto_15150 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15161 ) ) ( not ( = ?auto_15150 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15160 ) ) ( not ( = ?auto_15150 ?auto_15183 ) ) ( not ( = ?auto_15150 ?auto_15169 ) ) ( not ( = ?auto_15150 ?auto_15159 ) ) ( not ( = ?auto_15150 ?auto_15164 ) ) ( not ( = ?auto_15165 ?auto_15171 ) ) ( not ( = ?auto_15165 ?auto_15182 ) ) ( not ( = ?auto_15165 ?auto_15163 ) ) ( not ( = ?auto_15165 ?auto_15176 ) ) ( not ( = ?auto_15165 ?auto_15161 ) ) ( not ( = ?auto_15165 ?auto_15175 ) ) ( not ( = ?auto_15165 ?auto_15160 ) ) ( not ( = ?auto_15165 ?auto_15183 ) ) ( not ( = ?auto_15165 ?auto_15169 ) ) ( not ( = ?auto_15165 ?auto_15159 ) ) ( not ( = ?auto_15165 ?auto_15164 ) ) ( not ( = ?auto_15138 ?auto_15151 ) ) ( not ( = ?auto_15138 ?auto_15155 ) ) ( not ( = ?auto_15139 ?auto_15151 ) ) ( not ( = ?auto_15139 ?auto_15155 ) ) ( not ( = ?auto_15140 ?auto_15151 ) ) ( not ( = ?auto_15140 ?auto_15155 ) ) ( not ( = ?auto_15141 ?auto_15151 ) ) ( not ( = ?auto_15141 ?auto_15155 ) ) ( not ( = ?auto_15142 ?auto_15151 ) ) ( not ( = ?auto_15142 ?auto_15155 ) ) ( not ( = ?auto_15145 ?auto_15151 ) ) ( not ( = ?auto_15145 ?auto_15155 ) ) ( not ( = ?auto_15143 ?auto_15151 ) ) ( not ( = ?auto_15143 ?auto_15155 ) ) ( not ( = ?auto_15147 ?auto_15151 ) ) ( not ( = ?auto_15147 ?auto_15155 ) ) ( not ( = ?auto_15146 ?auto_15151 ) ) ( not ( = ?auto_15146 ?auto_15155 ) ) ( not ( = ?auto_15144 ?auto_15151 ) ) ( not ( = ?auto_15144 ?auto_15155 ) ) ( not ( = ?auto_15149 ?auto_15151 ) ) ( not ( = ?auto_15149 ?auto_15155 ) ) ( not ( = ?auto_15148 ?auto_15151 ) ) ( not ( = ?auto_15148 ?auto_15155 ) ) ( not ( = ?auto_15151 ?auto_15165 ) ) ( not ( = ?auto_15151 ?auto_15171 ) ) ( not ( = ?auto_15151 ?auto_15182 ) ) ( not ( = ?auto_15151 ?auto_15163 ) ) ( not ( = ?auto_15151 ?auto_15176 ) ) ( not ( = ?auto_15151 ?auto_15161 ) ) ( not ( = ?auto_15151 ?auto_15175 ) ) ( not ( = ?auto_15151 ?auto_15160 ) ) ( not ( = ?auto_15151 ?auto_15183 ) ) ( not ( = ?auto_15151 ?auto_15169 ) ) ( not ( = ?auto_15151 ?auto_15159 ) ) ( not ( = ?auto_15151 ?auto_15164 ) ) ( not ( = ?auto_15155 ?auto_15165 ) ) ( not ( = ?auto_15155 ?auto_15171 ) ) ( not ( = ?auto_15155 ?auto_15182 ) ) ( not ( = ?auto_15155 ?auto_15163 ) ) ( not ( = ?auto_15155 ?auto_15176 ) ) ( not ( = ?auto_15155 ?auto_15161 ) ) ( not ( = ?auto_15155 ?auto_15175 ) ) ( not ( = ?auto_15155 ?auto_15160 ) ) ( not ( = ?auto_15155 ?auto_15183 ) ) ( not ( = ?auto_15155 ?auto_15169 ) ) ( not ( = ?auto_15155 ?auto_15159 ) ) ( not ( = ?auto_15155 ?auto_15164 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15138 ?auto_15139 ?auto_15140 ?auto_15141 ?auto_15142 ?auto_15145 ?auto_15143 ?auto_15147 ?auto_15146 ?auto_15144 ?auto_15149 ?auto_15148 ?auto_15150 )
      ( MAKE-1CRATE ?auto_15150 ?auto_15151 )
      ( MAKE-13CRATE-VERIFY ?auto_15138 ?auto_15139 ?auto_15140 ?auto_15141 ?auto_15142 ?auto_15145 ?auto_15143 ?auto_15147 ?auto_15146 ?auto_15144 ?auto_15149 ?auto_15148 ?auto_15150 ?auto_15151 ) )
  )

)

