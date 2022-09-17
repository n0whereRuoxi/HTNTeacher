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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8535 - SURFACE
      ?auto_8536 - SURFACE
    )
    :vars
    (
      ?auto_8537 - HOIST
      ?auto_8538 - PLACE
      ?auto_8540 - PLACE
      ?auto_8541 - HOIST
      ?auto_8542 - SURFACE
      ?auto_8539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8537 ?auto_8538 ) ( SURFACE-AT ?auto_8535 ?auto_8538 ) ( CLEAR ?auto_8535 ) ( IS-CRATE ?auto_8536 ) ( AVAILABLE ?auto_8537 ) ( not ( = ?auto_8540 ?auto_8538 ) ) ( HOIST-AT ?auto_8541 ?auto_8540 ) ( AVAILABLE ?auto_8541 ) ( SURFACE-AT ?auto_8536 ?auto_8540 ) ( ON ?auto_8536 ?auto_8542 ) ( CLEAR ?auto_8536 ) ( TRUCK-AT ?auto_8539 ?auto_8538 ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( not ( = ?auto_8535 ?auto_8542 ) ) ( not ( = ?auto_8536 ?auto_8542 ) ) ( not ( = ?auto_8537 ?auto_8541 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8539 ?auto_8538 ?auto_8540 )
      ( !LIFT ?auto_8541 ?auto_8536 ?auto_8542 ?auto_8540 )
      ( !LOAD ?auto_8541 ?auto_8536 ?auto_8539 ?auto_8540 )
      ( !DRIVE ?auto_8539 ?auto_8540 ?auto_8538 )
      ( !UNLOAD ?auto_8537 ?auto_8536 ?auto_8539 ?auto_8538 )
      ( !DROP ?auto_8537 ?auto_8536 ?auto_8535 ?auto_8538 )
      ( MAKE-1CRATE-VERIFY ?auto_8535 ?auto_8536 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8556 - SURFACE
      ?auto_8557 - SURFACE
      ?auto_8558 - SURFACE
    )
    :vars
    (
      ?auto_8561 - HOIST
      ?auto_8562 - PLACE
      ?auto_8560 - PLACE
      ?auto_8563 - HOIST
      ?auto_8559 - SURFACE
      ?auto_8565 - SURFACE
      ?auto_8564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8561 ?auto_8562 ) ( IS-CRATE ?auto_8558 ) ( not ( = ?auto_8560 ?auto_8562 ) ) ( HOIST-AT ?auto_8563 ?auto_8560 ) ( SURFACE-AT ?auto_8558 ?auto_8560 ) ( ON ?auto_8558 ?auto_8559 ) ( CLEAR ?auto_8558 ) ( not ( = ?auto_8557 ?auto_8558 ) ) ( not ( = ?auto_8557 ?auto_8559 ) ) ( not ( = ?auto_8558 ?auto_8559 ) ) ( not ( = ?auto_8561 ?auto_8563 ) ) ( SURFACE-AT ?auto_8556 ?auto_8562 ) ( CLEAR ?auto_8556 ) ( IS-CRATE ?auto_8557 ) ( AVAILABLE ?auto_8561 ) ( AVAILABLE ?auto_8563 ) ( SURFACE-AT ?auto_8557 ?auto_8560 ) ( ON ?auto_8557 ?auto_8565 ) ( CLEAR ?auto_8557 ) ( TRUCK-AT ?auto_8564 ?auto_8562 ) ( not ( = ?auto_8556 ?auto_8557 ) ) ( not ( = ?auto_8556 ?auto_8565 ) ) ( not ( = ?auto_8557 ?auto_8565 ) ) ( not ( = ?auto_8556 ?auto_8558 ) ) ( not ( = ?auto_8556 ?auto_8559 ) ) ( not ( = ?auto_8558 ?auto_8565 ) ) ( not ( = ?auto_8559 ?auto_8565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8556 ?auto_8557 )
      ( MAKE-1CRATE ?auto_8557 ?auto_8558 )
      ( MAKE-2CRATE-VERIFY ?auto_8556 ?auto_8557 ?auto_8558 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8580 - SURFACE
      ?auto_8581 - SURFACE
      ?auto_8582 - SURFACE
      ?auto_8583 - SURFACE
    )
    :vars
    (
      ?auto_8586 - HOIST
      ?auto_8584 - PLACE
      ?auto_8588 - PLACE
      ?auto_8587 - HOIST
      ?auto_8589 - SURFACE
      ?auto_8591 - PLACE
      ?auto_8593 - HOIST
      ?auto_8590 - SURFACE
      ?auto_8592 - SURFACE
      ?auto_8585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8586 ?auto_8584 ) ( IS-CRATE ?auto_8583 ) ( not ( = ?auto_8588 ?auto_8584 ) ) ( HOIST-AT ?auto_8587 ?auto_8588 ) ( AVAILABLE ?auto_8587 ) ( SURFACE-AT ?auto_8583 ?auto_8588 ) ( ON ?auto_8583 ?auto_8589 ) ( CLEAR ?auto_8583 ) ( not ( = ?auto_8582 ?auto_8583 ) ) ( not ( = ?auto_8582 ?auto_8589 ) ) ( not ( = ?auto_8583 ?auto_8589 ) ) ( not ( = ?auto_8586 ?auto_8587 ) ) ( IS-CRATE ?auto_8582 ) ( not ( = ?auto_8591 ?auto_8584 ) ) ( HOIST-AT ?auto_8593 ?auto_8591 ) ( SURFACE-AT ?auto_8582 ?auto_8591 ) ( ON ?auto_8582 ?auto_8590 ) ( CLEAR ?auto_8582 ) ( not ( = ?auto_8581 ?auto_8582 ) ) ( not ( = ?auto_8581 ?auto_8590 ) ) ( not ( = ?auto_8582 ?auto_8590 ) ) ( not ( = ?auto_8586 ?auto_8593 ) ) ( SURFACE-AT ?auto_8580 ?auto_8584 ) ( CLEAR ?auto_8580 ) ( IS-CRATE ?auto_8581 ) ( AVAILABLE ?auto_8586 ) ( AVAILABLE ?auto_8593 ) ( SURFACE-AT ?auto_8581 ?auto_8591 ) ( ON ?auto_8581 ?auto_8592 ) ( CLEAR ?auto_8581 ) ( TRUCK-AT ?auto_8585 ?auto_8584 ) ( not ( = ?auto_8580 ?auto_8581 ) ) ( not ( = ?auto_8580 ?auto_8592 ) ) ( not ( = ?auto_8581 ?auto_8592 ) ) ( not ( = ?auto_8580 ?auto_8582 ) ) ( not ( = ?auto_8580 ?auto_8590 ) ) ( not ( = ?auto_8582 ?auto_8592 ) ) ( not ( = ?auto_8590 ?auto_8592 ) ) ( not ( = ?auto_8580 ?auto_8583 ) ) ( not ( = ?auto_8580 ?auto_8589 ) ) ( not ( = ?auto_8581 ?auto_8583 ) ) ( not ( = ?auto_8581 ?auto_8589 ) ) ( not ( = ?auto_8583 ?auto_8590 ) ) ( not ( = ?auto_8583 ?auto_8592 ) ) ( not ( = ?auto_8588 ?auto_8591 ) ) ( not ( = ?auto_8587 ?auto_8593 ) ) ( not ( = ?auto_8589 ?auto_8590 ) ) ( not ( = ?auto_8589 ?auto_8592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8580 ?auto_8581 ?auto_8582 )
      ( MAKE-1CRATE ?auto_8582 ?auto_8583 )
      ( MAKE-3CRATE-VERIFY ?auto_8580 ?auto_8581 ?auto_8582 ?auto_8583 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8609 - SURFACE
      ?auto_8610 - SURFACE
      ?auto_8611 - SURFACE
      ?auto_8612 - SURFACE
      ?auto_8613 - SURFACE
    )
    :vars
    (
      ?auto_8616 - HOIST
      ?auto_8619 - PLACE
      ?auto_8614 - PLACE
      ?auto_8618 - HOIST
      ?auto_8617 - SURFACE
      ?auto_8621 - PLACE
      ?auto_8623 - HOIST
      ?auto_8626 - SURFACE
      ?auto_8622 - PLACE
      ?auto_8620 - HOIST
      ?auto_8624 - SURFACE
      ?auto_8625 - SURFACE
      ?auto_8615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8616 ?auto_8619 ) ( IS-CRATE ?auto_8613 ) ( not ( = ?auto_8614 ?auto_8619 ) ) ( HOIST-AT ?auto_8618 ?auto_8614 ) ( AVAILABLE ?auto_8618 ) ( SURFACE-AT ?auto_8613 ?auto_8614 ) ( ON ?auto_8613 ?auto_8617 ) ( CLEAR ?auto_8613 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8617 ) ) ( not ( = ?auto_8613 ?auto_8617 ) ) ( not ( = ?auto_8616 ?auto_8618 ) ) ( IS-CRATE ?auto_8612 ) ( not ( = ?auto_8621 ?auto_8619 ) ) ( HOIST-AT ?auto_8623 ?auto_8621 ) ( AVAILABLE ?auto_8623 ) ( SURFACE-AT ?auto_8612 ?auto_8621 ) ( ON ?auto_8612 ?auto_8626 ) ( CLEAR ?auto_8612 ) ( not ( = ?auto_8611 ?auto_8612 ) ) ( not ( = ?auto_8611 ?auto_8626 ) ) ( not ( = ?auto_8612 ?auto_8626 ) ) ( not ( = ?auto_8616 ?auto_8623 ) ) ( IS-CRATE ?auto_8611 ) ( not ( = ?auto_8622 ?auto_8619 ) ) ( HOIST-AT ?auto_8620 ?auto_8622 ) ( SURFACE-AT ?auto_8611 ?auto_8622 ) ( ON ?auto_8611 ?auto_8624 ) ( CLEAR ?auto_8611 ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8624 ) ) ( not ( = ?auto_8611 ?auto_8624 ) ) ( not ( = ?auto_8616 ?auto_8620 ) ) ( SURFACE-AT ?auto_8609 ?auto_8619 ) ( CLEAR ?auto_8609 ) ( IS-CRATE ?auto_8610 ) ( AVAILABLE ?auto_8616 ) ( AVAILABLE ?auto_8620 ) ( SURFACE-AT ?auto_8610 ?auto_8622 ) ( ON ?auto_8610 ?auto_8625 ) ( CLEAR ?auto_8610 ) ( TRUCK-AT ?auto_8615 ?auto_8619 ) ( not ( = ?auto_8609 ?auto_8610 ) ) ( not ( = ?auto_8609 ?auto_8625 ) ) ( not ( = ?auto_8610 ?auto_8625 ) ) ( not ( = ?auto_8609 ?auto_8611 ) ) ( not ( = ?auto_8609 ?auto_8624 ) ) ( not ( = ?auto_8611 ?auto_8625 ) ) ( not ( = ?auto_8624 ?auto_8625 ) ) ( not ( = ?auto_8609 ?auto_8612 ) ) ( not ( = ?auto_8609 ?auto_8626 ) ) ( not ( = ?auto_8610 ?auto_8612 ) ) ( not ( = ?auto_8610 ?auto_8626 ) ) ( not ( = ?auto_8612 ?auto_8624 ) ) ( not ( = ?auto_8612 ?auto_8625 ) ) ( not ( = ?auto_8621 ?auto_8622 ) ) ( not ( = ?auto_8623 ?auto_8620 ) ) ( not ( = ?auto_8626 ?auto_8624 ) ) ( not ( = ?auto_8626 ?auto_8625 ) ) ( not ( = ?auto_8609 ?auto_8613 ) ) ( not ( = ?auto_8609 ?auto_8617 ) ) ( not ( = ?auto_8610 ?auto_8613 ) ) ( not ( = ?auto_8610 ?auto_8617 ) ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8611 ?auto_8617 ) ) ( not ( = ?auto_8613 ?auto_8626 ) ) ( not ( = ?auto_8613 ?auto_8624 ) ) ( not ( = ?auto_8613 ?auto_8625 ) ) ( not ( = ?auto_8614 ?auto_8621 ) ) ( not ( = ?auto_8614 ?auto_8622 ) ) ( not ( = ?auto_8618 ?auto_8623 ) ) ( not ( = ?auto_8618 ?auto_8620 ) ) ( not ( = ?auto_8617 ?auto_8626 ) ) ( not ( = ?auto_8617 ?auto_8624 ) ) ( not ( = ?auto_8617 ?auto_8625 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8609 ?auto_8610 ?auto_8611 ?auto_8612 )
      ( MAKE-1CRATE ?auto_8612 ?auto_8613 )
      ( MAKE-4CRATE-VERIFY ?auto_8609 ?auto_8610 ?auto_8611 ?auto_8612 ?auto_8613 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8643 - SURFACE
      ?auto_8644 - SURFACE
      ?auto_8645 - SURFACE
      ?auto_8646 - SURFACE
      ?auto_8647 - SURFACE
      ?auto_8648 - SURFACE
    )
    :vars
    (
      ?auto_8650 - HOIST
      ?auto_8654 - PLACE
      ?auto_8653 - PLACE
      ?auto_8652 - HOIST
      ?auto_8651 - SURFACE
      ?auto_8655 - SURFACE
      ?auto_8662 - PLACE
      ?auto_8661 - HOIST
      ?auto_8660 - SURFACE
      ?auto_8659 - PLACE
      ?auto_8658 - HOIST
      ?auto_8656 - SURFACE
      ?auto_8657 - SURFACE
      ?auto_8649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8650 ?auto_8654 ) ( IS-CRATE ?auto_8648 ) ( not ( = ?auto_8653 ?auto_8654 ) ) ( HOIST-AT ?auto_8652 ?auto_8653 ) ( SURFACE-AT ?auto_8648 ?auto_8653 ) ( ON ?auto_8648 ?auto_8651 ) ( CLEAR ?auto_8648 ) ( not ( = ?auto_8647 ?auto_8648 ) ) ( not ( = ?auto_8647 ?auto_8651 ) ) ( not ( = ?auto_8648 ?auto_8651 ) ) ( not ( = ?auto_8650 ?auto_8652 ) ) ( IS-CRATE ?auto_8647 ) ( AVAILABLE ?auto_8652 ) ( SURFACE-AT ?auto_8647 ?auto_8653 ) ( ON ?auto_8647 ?auto_8655 ) ( CLEAR ?auto_8647 ) ( not ( = ?auto_8646 ?auto_8647 ) ) ( not ( = ?auto_8646 ?auto_8655 ) ) ( not ( = ?auto_8647 ?auto_8655 ) ) ( IS-CRATE ?auto_8646 ) ( not ( = ?auto_8662 ?auto_8654 ) ) ( HOIST-AT ?auto_8661 ?auto_8662 ) ( AVAILABLE ?auto_8661 ) ( SURFACE-AT ?auto_8646 ?auto_8662 ) ( ON ?auto_8646 ?auto_8660 ) ( CLEAR ?auto_8646 ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8645 ?auto_8660 ) ) ( not ( = ?auto_8646 ?auto_8660 ) ) ( not ( = ?auto_8650 ?auto_8661 ) ) ( IS-CRATE ?auto_8645 ) ( not ( = ?auto_8659 ?auto_8654 ) ) ( HOIST-AT ?auto_8658 ?auto_8659 ) ( SURFACE-AT ?auto_8645 ?auto_8659 ) ( ON ?auto_8645 ?auto_8656 ) ( CLEAR ?auto_8645 ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8656 ) ) ( not ( = ?auto_8645 ?auto_8656 ) ) ( not ( = ?auto_8650 ?auto_8658 ) ) ( SURFACE-AT ?auto_8643 ?auto_8654 ) ( CLEAR ?auto_8643 ) ( IS-CRATE ?auto_8644 ) ( AVAILABLE ?auto_8650 ) ( AVAILABLE ?auto_8658 ) ( SURFACE-AT ?auto_8644 ?auto_8659 ) ( ON ?auto_8644 ?auto_8657 ) ( CLEAR ?auto_8644 ) ( TRUCK-AT ?auto_8649 ?auto_8654 ) ( not ( = ?auto_8643 ?auto_8644 ) ) ( not ( = ?auto_8643 ?auto_8657 ) ) ( not ( = ?auto_8644 ?auto_8657 ) ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8643 ?auto_8656 ) ) ( not ( = ?auto_8645 ?auto_8657 ) ) ( not ( = ?auto_8656 ?auto_8657 ) ) ( not ( = ?auto_8643 ?auto_8646 ) ) ( not ( = ?auto_8643 ?auto_8660 ) ) ( not ( = ?auto_8644 ?auto_8646 ) ) ( not ( = ?auto_8644 ?auto_8660 ) ) ( not ( = ?auto_8646 ?auto_8656 ) ) ( not ( = ?auto_8646 ?auto_8657 ) ) ( not ( = ?auto_8662 ?auto_8659 ) ) ( not ( = ?auto_8661 ?auto_8658 ) ) ( not ( = ?auto_8660 ?auto_8656 ) ) ( not ( = ?auto_8660 ?auto_8657 ) ) ( not ( = ?auto_8643 ?auto_8647 ) ) ( not ( = ?auto_8643 ?auto_8655 ) ) ( not ( = ?auto_8644 ?auto_8647 ) ) ( not ( = ?auto_8644 ?auto_8655 ) ) ( not ( = ?auto_8645 ?auto_8647 ) ) ( not ( = ?auto_8645 ?auto_8655 ) ) ( not ( = ?auto_8647 ?auto_8660 ) ) ( not ( = ?auto_8647 ?auto_8656 ) ) ( not ( = ?auto_8647 ?auto_8657 ) ) ( not ( = ?auto_8653 ?auto_8662 ) ) ( not ( = ?auto_8653 ?auto_8659 ) ) ( not ( = ?auto_8652 ?auto_8661 ) ) ( not ( = ?auto_8652 ?auto_8658 ) ) ( not ( = ?auto_8655 ?auto_8660 ) ) ( not ( = ?auto_8655 ?auto_8656 ) ) ( not ( = ?auto_8655 ?auto_8657 ) ) ( not ( = ?auto_8643 ?auto_8648 ) ) ( not ( = ?auto_8643 ?auto_8651 ) ) ( not ( = ?auto_8644 ?auto_8648 ) ) ( not ( = ?auto_8644 ?auto_8651 ) ) ( not ( = ?auto_8645 ?auto_8648 ) ) ( not ( = ?auto_8645 ?auto_8651 ) ) ( not ( = ?auto_8646 ?auto_8648 ) ) ( not ( = ?auto_8646 ?auto_8651 ) ) ( not ( = ?auto_8648 ?auto_8655 ) ) ( not ( = ?auto_8648 ?auto_8660 ) ) ( not ( = ?auto_8648 ?auto_8656 ) ) ( not ( = ?auto_8648 ?auto_8657 ) ) ( not ( = ?auto_8651 ?auto_8655 ) ) ( not ( = ?auto_8651 ?auto_8660 ) ) ( not ( = ?auto_8651 ?auto_8656 ) ) ( not ( = ?auto_8651 ?auto_8657 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8643 ?auto_8644 ?auto_8645 ?auto_8646 ?auto_8647 )
      ( MAKE-1CRATE ?auto_8647 ?auto_8648 )
      ( MAKE-5CRATE-VERIFY ?auto_8643 ?auto_8644 ?auto_8645 ?auto_8646 ?auto_8647 ?auto_8648 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8680 - SURFACE
      ?auto_8681 - SURFACE
      ?auto_8682 - SURFACE
      ?auto_8683 - SURFACE
      ?auto_8684 - SURFACE
      ?auto_8685 - SURFACE
      ?auto_8686 - SURFACE
    )
    :vars
    (
      ?auto_8689 - HOIST
      ?auto_8687 - PLACE
      ?auto_8688 - PLACE
      ?auto_8691 - HOIST
      ?auto_8692 - SURFACE
      ?auto_8698 - PLACE
      ?auto_8700 - HOIST
      ?auto_8701 - SURFACE
      ?auto_8697 - SURFACE
      ?auto_8702 - PLACE
      ?auto_8695 - HOIST
      ?auto_8703 - SURFACE
      ?auto_8694 - PLACE
      ?auto_8693 - HOIST
      ?auto_8696 - SURFACE
      ?auto_8699 - SURFACE
      ?auto_8690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8689 ?auto_8687 ) ( IS-CRATE ?auto_8686 ) ( not ( = ?auto_8688 ?auto_8687 ) ) ( HOIST-AT ?auto_8691 ?auto_8688 ) ( AVAILABLE ?auto_8691 ) ( SURFACE-AT ?auto_8686 ?auto_8688 ) ( ON ?auto_8686 ?auto_8692 ) ( CLEAR ?auto_8686 ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( not ( = ?auto_8685 ?auto_8692 ) ) ( not ( = ?auto_8686 ?auto_8692 ) ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( IS-CRATE ?auto_8685 ) ( not ( = ?auto_8698 ?auto_8687 ) ) ( HOIST-AT ?auto_8700 ?auto_8698 ) ( SURFACE-AT ?auto_8685 ?auto_8698 ) ( ON ?auto_8685 ?auto_8701 ) ( CLEAR ?auto_8685 ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8701 ) ) ( not ( = ?auto_8685 ?auto_8701 ) ) ( not ( = ?auto_8689 ?auto_8700 ) ) ( IS-CRATE ?auto_8684 ) ( AVAILABLE ?auto_8700 ) ( SURFACE-AT ?auto_8684 ?auto_8698 ) ( ON ?auto_8684 ?auto_8697 ) ( CLEAR ?auto_8684 ) ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8697 ) ) ( not ( = ?auto_8684 ?auto_8697 ) ) ( IS-CRATE ?auto_8683 ) ( not ( = ?auto_8702 ?auto_8687 ) ) ( HOIST-AT ?auto_8695 ?auto_8702 ) ( AVAILABLE ?auto_8695 ) ( SURFACE-AT ?auto_8683 ?auto_8702 ) ( ON ?auto_8683 ?auto_8703 ) ( CLEAR ?auto_8683 ) ( not ( = ?auto_8682 ?auto_8683 ) ) ( not ( = ?auto_8682 ?auto_8703 ) ) ( not ( = ?auto_8683 ?auto_8703 ) ) ( not ( = ?auto_8689 ?auto_8695 ) ) ( IS-CRATE ?auto_8682 ) ( not ( = ?auto_8694 ?auto_8687 ) ) ( HOIST-AT ?auto_8693 ?auto_8694 ) ( SURFACE-AT ?auto_8682 ?auto_8694 ) ( ON ?auto_8682 ?auto_8696 ) ( CLEAR ?auto_8682 ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8696 ) ) ( not ( = ?auto_8682 ?auto_8696 ) ) ( not ( = ?auto_8689 ?auto_8693 ) ) ( SURFACE-AT ?auto_8680 ?auto_8687 ) ( CLEAR ?auto_8680 ) ( IS-CRATE ?auto_8681 ) ( AVAILABLE ?auto_8689 ) ( AVAILABLE ?auto_8693 ) ( SURFACE-AT ?auto_8681 ?auto_8694 ) ( ON ?auto_8681 ?auto_8699 ) ( CLEAR ?auto_8681 ) ( TRUCK-AT ?auto_8690 ?auto_8687 ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8699 ) ) ( not ( = ?auto_8681 ?auto_8699 ) ) ( not ( = ?auto_8680 ?auto_8682 ) ) ( not ( = ?auto_8680 ?auto_8696 ) ) ( not ( = ?auto_8682 ?auto_8699 ) ) ( not ( = ?auto_8696 ?auto_8699 ) ) ( not ( = ?auto_8680 ?auto_8683 ) ) ( not ( = ?auto_8680 ?auto_8703 ) ) ( not ( = ?auto_8681 ?auto_8683 ) ) ( not ( = ?auto_8681 ?auto_8703 ) ) ( not ( = ?auto_8683 ?auto_8696 ) ) ( not ( = ?auto_8683 ?auto_8699 ) ) ( not ( = ?auto_8702 ?auto_8694 ) ) ( not ( = ?auto_8695 ?auto_8693 ) ) ( not ( = ?auto_8703 ?auto_8696 ) ) ( not ( = ?auto_8703 ?auto_8699 ) ) ( not ( = ?auto_8680 ?auto_8684 ) ) ( not ( = ?auto_8680 ?auto_8697 ) ) ( not ( = ?auto_8681 ?auto_8684 ) ) ( not ( = ?auto_8681 ?auto_8697 ) ) ( not ( = ?auto_8682 ?auto_8684 ) ) ( not ( = ?auto_8682 ?auto_8697 ) ) ( not ( = ?auto_8684 ?auto_8703 ) ) ( not ( = ?auto_8684 ?auto_8696 ) ) ( not ( = ?auto_8684 ?auto_8699 ) ) ( not ( = ?auto_8698 ?auto_8702 ) ) ( not ( = ?auto_8698 ?auto_8694 ) ) ( not ( = ?auto_8700 ?auto_8695 ) ) ( not ( = ?auto_8700 ?auto_8693 ) ) ( not ( = ?auto_8697 ?auto_8703 ) ) ( not ( = ?auto_8697 ?auto_8696 ) ) ( not ( = ?auto_8697 ?auto_8699 ) ) ( not ( = ?auto_8680 ?auto_8685 ) ) ( not ( = ?auto_8680 ?auto_8701 ) ) ( not ( = ?auto_8681 ?auto_8685 ) ) ( not ( = ?auto_8681 ?auto_8701 ) ) ( not ( = ?auto_8682 ?auto_8685 ) ) ( not ( = ?auto_8682 ?auto_8701 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8701 ) ) ( not ( = ?auto_8685 ?auto_8697 ) ) ( not ( = ?auto_8685 ?auto_8703 ) ) ( not ( = ?auto_8685 ?auto_8696 ) ) ( not ( = ?auto_8685 ?auto_8699 ) ) ( not ( = ?auto_8701 ?auto_8697 ) ) ( not ( = ?auto_8701 ?auto_8703 ) ) ( not ( = ?auto_8701 ?auto_8696 ) ) ( not ( = ?auto_8701 ?auto_8699 ) ) ( not ( = ?auto_8680 ?auto_8686 ) ) ( not ( = ?auto_8680 ?auto_8692 ) ) ( not ( = ?auto_8681 ?auto_8686 ) ) ( not ( = ?auto_8681 ?auto_8692 ) ) ( not ( = ?auto_8682 ?auto_8686 ) ) ( not ( = ?auto_8682 ?auto_8692 ) ) ( not ( = ?auto_8683 ?auto_8686 ) ) ( not ( = ?auto_8683 ?auto_8692 ) ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8684 ?auto_8692 ) ) ( not ( = ?auto_8686 ?auto_8701 ) ) ( not ( = ?auto_8686 ?auto_8697 ) ) ( not ( = ?auto_8686 ?auto_8703 ) ) ( not ( = ?auto_8686 ?auto_8696 ) ) ( not ( = ?auto_8686 ?auto_8699 ) ) ( not ( = ?auto_8688 ?auto_8698 ) ) ( not ( = ?auto_8688 ?auto_8702 ) ) ( not ( = ?auto_8688 ?auto_8694 ) ) ( not ( = ?auto_8691 ?auto_8700 ) ) ( not ( = ?auto_8691 ?auto_8695 ) ) ( not ( = ?auto_8691 ?auto_8693 ) ) ( not ( = ?auto_8692 ?auto_8701 ) ) ( not ( = ?auto_8692 ?auto_8697 ) ) ( not ( = ?auto_8692 ?auto_8703 ) ) ( not ( = ?auto_8692 ?auto_8696 ) ) ( not ( = ?auto_8692 ?auto_8699 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8680 ?auto_8681 ?auto_8682 ?auto_8683 ?auto_8684 ?auto_8685 )
      ( MAKE-1CRATE ?auto_8685 ?auto_8686 )
      ( MAKE-6CRATE-VERIFY ?auto_8680 ?auto_8681 ?auto_8682 ?auto_8683 ?auto_8684 ?auto_8685 ?auto_8686 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8722 - SURFACE
      ?auto_8723 - SURFACE
      ?auto_8724 - SURFACE
      ?auto_8725 - SURFACE
      ?auto_8726 - SURFACE
      ?auto_8727 - SURFACE
      ?auto_8728 - SURFACE
      ?auto_8729 - SURFACE
    )
    :vars
    (
      ?auto_8734 - HOIST
      ?auto_8733 - PLACE
      ?auto_8735 - PLACE
      ?auto_8731 - HOIST
      ?auto_8730 - SURFACE
      ?auto_8745 - PLACE
      ?auto_8744 - HOIST
      ?auto_8748 - SURFACE
      ?auto_8746 - PLACE
      ?auto_8742 - HOIST
      ?auto_8741 - SURFACE
      ?auto_8737 - SURFACE
      ?auto_8740 - PLACE
      ?auto_8736 - HOIST
      ?auto_8747 - SURFACE
      ?auto_8749 - PLACE
      ?auto_8743 - HOIST
      ?auto_8738 - SURFACE
      ?auto_8739 - SURFACE
      ?auto_8732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8734 ?auto_8733 ) ( IS-CRATE ?auto_8729 ) ( not ( = ?auto_8735 ?auto_8733 ) ) ( HOIST-AT ?auto_8731 ?auto_8735 ) ( AVAILABLE ?auto_8731 ) ( SURFACE-AT ?auto_8729 ?auto_8735 ) ( ON ?auto_8729 ?auto_8730 ) ( CLEAR ?auto_8729 ) ( not ( = ?auto_8728 ?auto_8729 ) ) ( not ( = ?auto_8728 ?auto_8730 ) ) ( not ( = ?auto_8729 ?auto_8730 ) ) ( not ( = ?auto_8734 ?auto_8731 ) ) ( IS-CRATE ?auto_8728 ) ( not ( = ?auto_8745 ?auto_8733 ) ) ( HOIST-AT ?auto_8744 ?auto_8745 ) ( AVAILABLE ?auto_8744 ) ( SURFACE-AT ?auto_8728 ?auto_8745 ) ( ON ?auto_8728 ?auto_8748 ) ( CLEAR ?auto_8728 ) ( not ( = ?auto_8727 ?auto_8728 ) ) ( not ( = ?auto_8727 ?auto_8748 ) ) ( not ( = ?auto_8728 ?auto_8748 ) ) ( not ( = ?auto_8734 ?auto_8744 ) ) ( IS-CRATE ?auto_8727 ) ( not ( = ?auto_8746 ?auto_8733 ) ) ( HOIST-AT ?auto_8742 ?auto_8746 ) ( SURFACE-AT ?auto_8727 ?auto_8746 ) ( ON ?auto_8727 ?auto_8741 ) ( CLEAR ?auto_8727 ) ( not ( = ?auto_8726 ?auto_8727 ) ) ( not ( = ?auto_8726 ?auto_8741 ) ) ( not ( = ?auto_8727 ?auto_8741 ) ) ( not ( = ?auto_8734 ?auto_8742 ) ) ( IS-CRATE ?auto_8726 ) ( AVAILABLE ?auto_8742 ) ( SURFACE-AT ?auto_8726 ?auto_8746 ) ( ON ?auto_8726 ?auto_8737 ) ( CLEAR ?auto_8726 ) ( not ( = ?auto_8725 ?auto_8726 ) ) ( not ( = ?auto_8725 ?auto_8737 ) ) ( not ( = ?auto_8726 ?auto_8737 ) ) ( IS-CRATE ?auto_8725 ) ( not ( = ?auto_8740 ?auto_8733 ) ) ( HOIST-AT ?auto_8736 ?auto_8740 ) ( AVAILABLE ?auto_8736 ) ( SURFACE-AT ?auto_8725 ?auto_8740 ) ( ON ?auto_8725 ?auto_8747 ) ( CLEAR ?auto_8725 ) ( not ( = ?auto_8724 ?auto_8725 ) ) ( not ( = ?auto_8724 ?auto_8747 ) ) ( not ( = ?auto_8725 ?auto_8747 ) ) ( not ( = ?auto_8734 ?auto_8736 ) ) ( IS-CRATE ?auto_8724 ) ( not ( = ?auto_8749 ?auto_8733 ) ) ( HOIST-AT ?auto_8743 ?auto_8749 ) ( SURFACE-AT ?auto_8724 ?auto_8749 ) ( ON ?auto_8724 ?auto_8738 ) ( CLEAR ?auto_8724 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8738 ) ) ( not ( = ?auto_8724 ?auto_8738 ) ) ( not ( = ?auto_8734 ?auto_8743 ) ) ( SURFACE-AT ?auto_8722 ?auto_8733 ) ( CLEAR ?auto_8722 ) ( IS-CRATE ?auto_8723 ) ( AVAILABLE ?auto_8734 ) ( AVAILABLE ?auto_8743 ) ( SURFACE-AT ?auto_8723 ?auto_8749 ) ( ON ?auto_8723 ?auto_8739 ) ( CLEAR ?auto_8723 ) ( TRUCK-AT ?auto_8732 ?auto_8733 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8739 ) ) ( not ( = ?auto_8723 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8738 ) ) ( not ( = ?auto_8724 ?auto_8739 ) ) ( not ( = ?auto_8738 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8725 ) ) ( not ( = ?auto_8722 ?auto_8747 ) ) ( not ( = ?auto_8723 ?auto_8725 ) ) ( not ( = ?auto_8723 ?auto_8747 ) ) ( not ( = ?auto_8725 ?auto_8738 ) ) ( not ( = ?auto_8725 ?auto_8739 ) ) ( not ( = ?auto_8740 ?auto_8749 ) ) ( not ( = ?auto_8736 ?auto_8743 ) ) ( not ( = ?auto_8747 ?auto_8738 ) ) ( not ( = ?auto_8747 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8726 ) ) ( not ( = ?auto_8722 ?auto_8737 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) ( not ( = ?auto_8723 ?auto_8737 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8737 ) ) ( not ( = ?auto_8726 ?auto_8747 ) ) ( not ( = ?auto_8726 ?auto_8738 ) ) ( not ( = ?auto_8726 ?auto_8739 ) ) ( not ( = ?auto_8746 ?auto_8740 ) ) ( not ( = ?auto_8746 ?auto_8749 ) ) ( not ( = ?auto_8742 ?auto_8736 ) ) ( not ( = ?auto_8742 ?auto_8743 ) ) ( not ( = ?auto_8737 ?auto_8747 ) ) ( not ( = ?auto_8737 ?auto_8738 ) ) ( not ( = ?auto_8737 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8727 ) ) ( not ( = ?auto_8722 ?auto_8741 ) ) ( not ( = ?auto_8723 ?auto_8727 ) ) ( not ( = ?auto_8723 ?auto_8741 ) ) ( not ( = ?auto_8724 ?auto_8727 ) ) ( not ( = ?auto_8724 ?auto_8741 ) ) ( not ( = ?auto_8725 ?auto_8727 ) ) ( not ( = ?auto_8725 ?auto_8741 ) ) ( not ( = ?auto_8727 ?auto_8737 ) ) ( not ( = ?auto_8727 ?auto_8747 ) ) ( not ( = ?auto_8727 ?auto_8738 ) ) ( not ( = ?auto_8727 ?auto_8739 ) ) ( not ( = ?auto_8741 ?auto_8737 ) ) ( not ( = ?auto_8741 ?auto_8747 ) ) ( not ( = ?auto_8741 ?auto_8738 ) ) ( not ( = ?auto_8741 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8728 ) ) ( not ( = ?auto_8722 ?auto_8748 ) ) ( not ( = ?auto_8723 ?auto_8728 ) ) ( not ( = ?auto_8723 ?auto_8748 ) ) ( not ( = ?auto_8724 ?auto_8728 ) ) ( not ( = ?auto_8724 ?auto_8748 ) ) ( not ( = ?auto_8725 ?auto_8728 ) ) ( not ( = ?auto_8725 ?auto_8748 ) ) ( not ( = ?auto_8726 ?auto_8728 ) ) ( not ( = ?auto_8726 ?auto_8748 ) ) ( not ( = ?auto_8728 ?auto_8741 ) ) ( not ( = ?auto_8728 ?auto_8737 ) ) ( not ( = ?auto_8728 ?auto_8747 ) ) ( not ( = ?auto_8728 ?auto_8738 ) ) ( not ( = ?auto_8728 ?auto_8739 ) ) ( not ( = ?auto_8745 ?auto_8746 ) ) ( not ( = ?auto_8745 ?auto_8740 ) ) ( not ( = ?auto_8745 ?auto_8749 ) ) ( not ( = ?auto_8744 ?auto_8742 ) ) ( not ( = ?auto_8744 ?auto_8736 ) ) ( not ( = ?auto_8744 ?auto_8743 ) ) ( not ( = ?auto_8748 ?auto_8741 ) ) ( not ( = ?auto_8748 ?auto_8737 ) ) ( not ( = ?auto_8748 ?auto_8747 ) ) ( not ( = ?auto_8748 ?auto_8738 ) ) ( not ( = ?auto_8748 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8729 ) ) ( not ( = ?auto_8722 ?auto_8730 ) ) ( not ( = ?auto_8723 ?auto_8729 ) ) ( not ( = ?auto_8723 ?auto_8730 ) ) ( not ( = ?auto_8724 ?auto_8729 ) ) ( not ( = ?auto_8724 ?auto_8730 ) ) ( not ( = ?auto_8725 ?auto_8729 ) ) ( not ( = ?auto_8725 ?auto_8730 ) ) ( not ( = ?auto_8726 ?auto_8729 ) ) ( not ( = ?auto_8726 ?auto_8730 ) ) ( not ( = ?auto_8727 ?auto_8729 ) ) ( not ( = ?auto_8727 ?auto_8730 ) ) ( not ( = ?auto_8729 ?auto_8748 ) ) ( not ( = ?auto_8729 ?auto_8741 ) ) ( not ( = ?auto_8729 ?auto_8737 ) ) ( not ( = ?auto_8729 ?auto_8747 ) ) ( not ( = ?auto_8729 ?auto_8738 ) ) ( not ( = ?auto_8729 ?auto_8739 ) ) ( not ( = ?auto_8735 ?auto_8745 ) ) ( not ( = ?auto_8735 ?auto_8746 ) ) ( not ( = ?auto_8735 ?auto_8740 ) ) ( not ( = ?auto_8735 ?auto_8749 ) ) ( not ( = ?auto_8731 ?auto_8744 ) ) ( not ( = ?auto_8731 ?auto_8742 ) ) ( not ( = ?auto_8731 ?auto_8736 ) ) ( not ( = ?auto_8731 ?auto_8743 ) ) ( not ( = ?auto_8730 ?auto_8748 ) ) ( not ( = ?auto_8730 ?auto_8741 ) ) ( not ( = ?auto_8730 ?auto_8737 ) ) ( not ( = ?auto_8730 ?auto_8747 ) ) ( not ( = ?auto_8730 ?auto_8738 ) ) ( not ( = ?auto_8730 ?auto_8739 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8722 ?auto_8723 ?auto_8724 ?auto_8725 ?auto_8726 ?auto_8727 ?auto_8728 )
      ( MAKE-1CRATE ?auto_8728 ?auto_8729 )
      ( MAKE-7CRATE-VERIFY ?auto_8722 ?auto_8723 ?auto_8724 ?auto_8725 ?auto_8726 ?auto_8727 ?auto_8728 ?auto_8729 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8769 - SURFACE
      ?auto_8770 - SURFACE
      ?auto_8771 - SURFACE
      ?auto_8772 - SURFACE
      ?auto_8773 - SURFACE
      ?auto_8774 - SURFACE
      ?auto_8775 - SURFACE
      ?auto_8776 - SURFACE
      ?auto_8777 - SURFACE
    )
    :vars
    (
      ?auto_8782 - HOIST
      ?auto_8779 - PLACE
      ?auto_8778 - PLACE
      ?auto_8780 - HOIST
      ?auto_8781 - SURFACE
      ?auto_8789 - PLACE
      ?auto_8796 - HOIST
      ?auto_8786 - SURFACE
      ?auto_8784 - SURFACE
      ?auto_8788 - PLACE
      ?auto_8785 - HOIST
      ?auto_8797 - SURFACE
      ?auto_8793 - SURFACE
      ?auto_8787 - PLACE
      ?auto_8790 - HOIST
      ?auto_8795 - SURFACE
      ?auto_8798 - PLACE
      ?auto_8794 - HOIST
      ?auto_8791 - SURFACE
      ?auto_8792 - SURFACE
      ?auto_8783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8782 ?auto_8779 ) ( IS-CRATE ?auto_8777 ) ( not ( = ?auto_8778 ?auto_8779 ) ) ( HOIST-AT ?auto_8780 ?auto_8778 ) ( SURFACE-AT ?auto_8777 ?auto_8778 ) ( ON ?auto_8777 ?auto_8781 ) ( CLEAR ?auto_8777 ) ( not ( = ?auto_8776 ?auto_8777 ) ) ( not ( = ?auto_8776 ?auto_8781 ) ) ( not ( = ?auto_8777 ?auto_8781 ) ) ( not ( = ?auto_8782 ?auto_8780 ) ) ( IS-CRATE ?auto_8776 ) ( not ( = ?auto_8789 ?auto_8779 ) ) ( HOIST-AT ?auto_8796 ?auto_8789 ) ( AVAILABLE ?auto_8796 ) ( SURFACE-AT ?auto_8776 ?auto_8789 ) ( ON ?auto_8776 ?auto_8786 ) ( CLEAR ?auto_8776 ) ( not ( = ?auto_8775 ?auto_8776 ) ) ( not ( = ?auto_8775 ?auto_8786 ) ) ( not ( = ?auto_8776 ?auto_8786 ) ) ( not ( = ?auto_8782 ?auto_8796 ) ) ( IS-CRATE ?auto_8775 ) ( AVAILABLE ?auto_8780 ) ( SURFACE-AT ?auto_8775 ?auto_8778 ) ( ON ?auto_8775 ?auto_8784 ) ( CLEAR ?auto_8775 ) ( not ( = ?auto_8774 ?auto_8775 ) ) ( not ( = ?auto_8774 ?auto_8784 ) ) ( not ( = ?auto_8775 ?auto_8784 ) ) ( IS-CRATE ?auto_8774 ) ( not ( = ?auto_8788 ?auto_8779 ) ) ( HOIST-AT ?auto_8785 ?auto_8788 ) ( SURFACE-AT ?auto_8774 ?auto_8788 ) ( ON ?auto_8774 ?auto_8797 ) ( CLEAR ?auto_8774 ) ( not ( = ?auto_8773 ?auto_8774 ) ) ( not ( = ?auto_8773 ?auto_8797 ) ) ( not ( = ?auto_8774 ?auto_8797 ) ) ( not ( = ?auto_8782 ?auto_8785 ) ) ( IS-CRATE ?auto_8773 ) ( AVAILABLE ?auto_8785 ) ( SURFACE-AT ?auto_8773 ?auto_8788 ) ( ON ?auto_8773 ?auto_8793 ) ( CLEAR ?auto_8773 ) ( not ( = ?auto_8772 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8793 ) ) ( not ( = ?auto_8773 ?auto_8793 ) ) ( IS-CRATE ?auto_8772 ) ( not ( = ?auto_8787 ?auto_8779 ) ) ( HOIST-AT ?auto_8790 ?auto_8787 ) ( AVAILABLE ?auto_8790 ) ( SURFACE-AT ?auto_8772 ?auto_8787 ) ( ON ?auto_8772 ?auto_8795 ) ( CLEAR ?auto_8772 ) ( not ( = ?auto_8771 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8795 ) ) ( not ( = ?auto_8772 ?auto_8795 ) ) ( not ( = ?auto_8782 ?auto_8790 ) ) ( IS-CRATE ?auto_8771 ) ( not ( = ?auto_8798 ?auto_8779 ) ) ( HOIST-AT ?auto_8794 ?auto_8798 ) ( SURFACE-AT ?auto_8771 ?auto_8798 ) ( ON ?auto_8771 ?auto_8791 ) ( CLEAR ?auto_8771 ) ( not ( = ?auto_8770 ?auto_8771 ) ) ( not ( = ?auto_8770 ?auto_8791 ) ) ( not ( = ?auto_8771 ?auto_8791 ) ) ( not ( = ?auto_8782 ?auto_8794 ) ) ( SURFACE-AT ?auto_8769 ?auto_8779 ) ( CLEAR ?auto_8769 ) ( IS-CRATE ?auto_8770 ) ( AVAILABLE ?auto_8782 ) ( AVAILABLE ?auto_8794 ) ( SURFACE-AT ?auto_8770 ?auto_8798 ) ( ON ?auto_8770 ?auto_8792 ) ( CLEAR ?auto_8770 ) ( TRUCK-AT ?auto_8783 ?auto_8779 ) ( not ( = ?auto_8769 ?auto_8770 ) ) ( not ( = ?auto_8769 ?auto_8792 ) ) ( not ( = ?auto_8770 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8771 ) ) ( not ( = ?auto_8769 ?auto_8791 ) ) ( not ( = ?auto_8771 ?auto_8792 ) ) ( not ( = ?auto_8791 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8772 ) ) ( not ( = ?auto_8769 ?auto_8795 ) ) ( not ( = ?auto_8770 ?auto_8772 ) ) ( not ( = ?auto_8770 ?auto_8795 ) ) ( not ( = ?auto_8772 ?auto_8791 ) ) ( not ( = ?auto_8772 ?auto_8792 ) ) ( not ( = ?auto_8787 ?auto_8798 ) ) ( not ( = ?auto_8790 ?auto_8794 ) ) ( not ( = ?auto_8795 ?auto_8791 ) ) ( not ( = ?auto_8795 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8773 ) ) ( not ( = ?auto_8769 ?auto_8793 ) ) ( not ( = ?auto_8770 ?auto_8773 ) ) ( not ( = ?auto_8770 ?auto_8793 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( not ( = ?auto_8771 ?auto_8793 ) ) ( not ( = ?auto_8773 ?auto_8795 ) ) ( not ( = ?auto_8773 ?auto_8791 ) ) ( not ( = ?auto_8773 ?auto_8792 ) ) ( not ( = ?auto_8788 ?auto_8787 ) ) ( not ( = ?auto_8788 ?auto_8798 ) ) ( not ( = ?auto_8785 ?auto_8790 ) ) ( not ( = ?auto_8785 ?auto_8794 ) ) ( not ( = ?auto_8793 ?auto_8795 ) ) ( not ( = ?auto_8793 ?auto_8791 ) ) ( not ( = ?auto_8793 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8774 ) ) ( not ( = ?auto_8769 ?auto_8797 ) ) ( not ( = ?auto_8770 ?auto_8774 ) ) ( not ( = ?auto_8770 ?auto_8797 ) ) ( not ( = ?auto_8771 ?auto_8774 ) ) ( not ( = ?auto_8771 ?auto_8797 ) ) ( not ( = ?auto_8772 ?auto_8774 ) ) ( not ( = ?auto_8772 ?auto_8797 ) ) ( not ( = ?auto_8774 ?auto_8793 ) ) ( not ( = ?auto_8774 ?auto_8795 ) ) ( not ( = ?auto_8774 ?auto_8791 ) ) ( not ( = ?auto_8774 ?auto_8792 ) ) ( not ( = ?auto_8797 ?auto_8793 ) ) ( not ( = ?auto_8797 ?auto_8795 ) ) ( not ( = ?auto_8797 ?auto_8791 ) ) ( not ( = ?auto_8797 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8775 ) ) ( not ( = ?auto_8769 ?auto_8784 ) ) ( not ( = ?auto_8770 ?auto_8775 ) ) ( not ( = ?auto_8770 ?auto_8784 ) ) ( not ( = ?auto_8771 ?auto_8775 ) ) ( not ( = ?auto_8771 ?auto_8784 ) ) ( not ( = ?auto_8772 ?auto_8775 ) ) ( not ( = ?auto_8772 ?auto_8784 ) ) ( not ( = ?auto_8773 ?auto_8775 ) ) ( not ( = ?auto_8773 ?auto_8784 ) ) ( not ( = ?auto_8775 ?auto_8797 ) ) ( not ( = ?auto_8775 ?auto_8793 ) ) ( not ( = ?auto_8775 ?auto_8795 ) ) ( not ( = ?auto_8775 ?auto_8791 ) ) ( not ( = ?auto_8775 ?auto_8792 ) ) ( not ( = ?auto_8778 ?auto_8788 ) ) ( not ( = ?auto_8778 ?auto_8787 ) ) ( not ( = ?auto_8778 ?auto_8798 ) ) ( not ( = ?auto_8780 ?auto_8785 ) ) ( not ( = ?auto_8780 ?auto_8790 ) ) ( not ( = ?auto_8780 ?auto_8794 ) ) ( not ( = ?auto_8784 ?auto_8797 ) ) ( not ( = ?auto_8784 ?auto_8793 ) ) ( not ( = ?auto_8784 ?auto_8795 ) ) ( not ( = ?auto_8784 ?auto_8791 ) ) ( not ( = ?auto_8784 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8776 ) ) ( not ( = ?auto_8769 ?auto_8786 ) ) ( not ( = ?auto_8770 ?auto_8776 ) ) ( not ( = ?auto_8770 ?auto_8786 ) ) ( not ( = ?auto_8771 ?auto_8776 ) ) ( not ( = ?auto_8771 ?auto_8786 ) ) ( not ( = ?auto_8772 ?auto_8776 ) ) ( not ( = ?auto_8772 ?auto_8786 ) ) ( not ( = ?auto_8773 ?auto_8776 ) ) ( not ( = ?auto_8773 ?auto_8786 ) ) ( not ( = ?auto_8774 ?auto_8776 ) ) ( not ( = ?auto_8774 ?auto_8786 ) ) ( not ( = ?auto_8776 ?auto_8784 ) ) ( not ( = ?auto_8776 ?auto_8797 ) ) ( not ( = ?auto_8776 ?auto_8793 ) ) ( not ( = ?auto_8776 ?auto_8795 ) ) ( not ( = ?auto_8776 ?auto_8791 ) ) ( not ( = ?auto_8776 ?auto_8792 ) ) ( not ( = ?auto_8789 ?auto_8778 ) ) ( not ( = ?auto_8789 ?auto_8788 ) ) ( not ( = ?auto_8789 ?auto_8787 ) ) ( not ( = ?auto_8789 ?auto_8798 ) ) ( not ( = ?auto_8796 ?auto_8780 ) ) ( not ( = ?auto_8796 ?auto_8785 ) ) ( not ( = ?auto_8796 ?auto_8790 ) ) ( not ( = ?auto_8796 ?auto_8794 ) ) ( not ( = ?auto_8786 ?auto_8784 ) ) ( not ( = ?auto_8786 ?auto_8797 ) ) ( not ( = ?auto_8786 ?auto_8793 ) ) ( not ( = ?auto_8786 ?auto_8795 ) ) ( not ( = ?auto_8786 ?auto_8791 ) ) ( not ( = ?auto_8786 ?auto_8792 ) ) ( not ( = ?auto_8769 ?auto_8777 ) ) ( not ( = ?auto_8769 ?auto_8781 ) ) ( not ( = ?auto_8770 ?auto_8777 ) ) ( not ( = ?auto_8770 ?auto_8781 ) ) ( not ( = ?auto_8771 ?auto_8777 ) ) ( not ( = ?auto_8771 ?auto_8781 ) ) ( not ( = ?auto_8772 ?auto_8777 ) ) ( not ( = ?auto_8772 ?auto_8781 ) ) ( not ( = ?auto_8773 ?auto_8777 ) ) ( not ( = ?auto_8773 ?auto_8781 ) ) ( not ( = ?auto_8774 ?auto_8777 ) ) ( not ( = ?auto_8774 ?auto_8781 ) ) ( not ( = ?auto_8775 ?auto_8777 ) ) ( not ( = ?auto_8775 ?auto_8781 ) ) ( not ( = ?auto_8777 ?auto_8786 ) ) ( not ( = ?auto_8777 ?auto_8784 ) ) ( not ( = ?auto_8777 ?auto_8797 ) ) ( not ( = ?auto_8777 ?auto_8793 ) ) ( not ( = ?auto_8777 ?auto_8795 ) ) ( not ( = ?auto_8777 ?auto_8791 ) ) ( not ( = ?auto_8777 ?auto_8792 ) ) ( not ( = ?auto_8781 ?auto_8786 ) ) ( not ( = ?auto_8781 ?auto_8784 ) ) ( not ( = ?auto_8781 ?auto_8797 ) ) ( not ( = ?auto_8781 ?auto_8793 ) ) ( not ( = ?auto_8781 ?auto_8795 ) ) ( not ( = ?auto_8781 ?auto_8791 ) ) ( not ( = ?auto_8781 ?auto_8792 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8769 ?auto_8770 ?auto_8771 ?auto_8772 ?auto_8773 ?auto_8774 ?auto_8775 ?auto_8776 )
      ( MAKE-1CRATE ?auto_8776 ?auto_8777 )
      ( MAKE-8CRATE-VERIFY ?auto_8769 ?auto_8770 ?auto_8771 ?auto_8772 ?auto_8773 ?auto_8774 ?auto_8775 ?auto_8776 ?auto_8777 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8819 - SURFACE
      ?auto_8820 - SURFACE
      ?auto_8821 - SURFACE
      ?auto_8822 - SURFACE
      ?auto_8823 - SURFACE
      ?auto_8824 - SURFACE
      ?auto_8825 - SURFACE
      ?auto_8826 - SURFACE
      ?auto_8827 - SURFACE
      ?auto_8828 - SURFACE
    )
    :vars
    (
      ?auto_8831 - HOIST
      ?auto_8830 - PLACE
      ?auto_8834 - PLACE
      ?auto_8832 - HOIST
      ?auto_8833 - SURFACE
      ?auto_8838 - PLACE
      ?auto_8844 - HOIST
      ?auto_8847 - SURFACE
      ?auto_8837 - PLACE
      ?auto_8843 - HOIST
      ?auto_8835 - SURFACE
      ?auto_8846 - SURFACE
      ?auto_8841 - PLACE
      ?auto_8852 - HOIST
      ?auto_8839 - SURFACE
      ?auto_8845 - SURFACE
      ?auto_8836 - PLACE
      ?auto_8840 - HOIST
      ?auto_8851 - SURFACE
      ?auto_8842 - PLACE
      ?auto_8848 - HOIST
      ?auto_8850 - SURFACE
      ?auto_8849 - SURFACE
      ?auto_8829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8831 ?auto_8830 ) ( IS-CRATE ?auto_8828 ) ( not ( = ?auto_8834 ?auto_8830 ) ) ( HOIST-AT ?auto_8832 ?auto_8834 ) ( AVAILABLE ?auto_8832 ) ( SURFACE-AT ?auto_8828 ?auto_8834 ) ( ON ?auto_8828 ?auto_8833 ) ( CLEAR ?auto_8828 ) ( not ( = ?auto_8827 ?auto_8828 ) ) ( not ( = ?auto_8827 ?auto_8833 ) ) ( not ( = ?auto_8828 ?auto_8833 ) ) ( not ( = ?auto_8831 ?auto_8832 ) ) ( IS-CRATE ?auto_8827 ) ( not ( = ?auto_8838 ?auto_8830 ) ) ( HOIST-AT ?auto_8844 ?auto_8838 ) ( SURFACE-AT ?auto_8827 ?auto_8838 ) ( ON ?auto_8827 ?auto_8847 ) ( CLEAR ?auto_8827 ) ( not ( = ?auto_8826 ?auto_8827 ) ) ( not ( = ?auto_8826 ?auto_8847 ) ) ( not ( = ?auto_8827 ?auto_8847 ) ) ( not ( = ?auto_8831 ?auto_8844 ) ) ( IS-CRATE ?auto_8826 ) ( not ( = ?auto_8837 ?auto_8830 ) ) ( HOIST-AT ?auto_8843 ?auto_8837 ) ( AVAILABLE ?auto_8843 ) ( SURFACE-AT ?auto_8826 ?auto_8837 ) ( ON ?auto_8826 ?auto_8835 ) ( CLEAR ?auto_8826 ) ( not ( = ?auto_8825 ?auto_8826 ) ) ( not ( = ?auto_8825 ?auto_8835 ) ) ( not ( = ?auto_8826 ?auto_8835 ) ) ( not ( = ?auto_8831 ?auto_8843 ) ) ( IS-CRATE ?auto_8825 ) ( AVAILABLE ?auto_8844 ) ( SURFACE-AT ?auto_8825 ?auto_8838 ) ( ON ?auto_8825 ?auto_8846 ) ( CLEAR ?auto_8825 ) ( not ( = ?auto_8824 ?auto_8825 ) ) ( not ( = ?auto_8824 ?auto_8846 ) ) ( not ( = ?auto_8825 ?auto_8846 ) ) ( IS-CRATE ?auto_8824 ) ( not ( = ?auto_8841 ?auto_8830 ) ) ( HOIST-AT ?auto_8852 ?auto_8841 ) ( SURFACE-AT ?auto_8824 ?auto_8841 ) ( ON ?auto_8824 ?auto_8839 ) ( CLEAR ?auto_8824 ) ( not ( = ?auto_8823 ?auto_8824 ) ) ( not ( = ?auto_8823 ?auto_8839 ) ) ( not ( = ?auto_8824 ?auto_8839 ) ) ( not ( = ?auto_8831 ?auto_8852 ) ) ( IS-CRATE ?auto_8823 ) ( AVAILABLE ?auto_8852 ) ( SURFACE-AT ?auto_8823 ?auto_8841 ) ( ON ?auto_8823 ?auto_8845 ) ( CLEAR ?auto_8823 ) ( not ( = ?auto_8822 ?auto_8823 ) ) ( not ( = ?auto_8822 ?auto_8845 ) ) ( not ( = ?auto_8823 ?auto_8845 ) ) ( IS-CRATE ?auto_8822 ) ( not ( = ?auto_8836 ?auto_8830 ) ) ( HOIST-AT ?auto_8840 ?auto_8836 ) ( AVAILABLE ?auto_8840 ) ( SURFACE-AT ?auto_8822 ?auto_8836 ) ( ON ?auto_8822 ?auto_8851 ) ( CLEAR ?auto_8822 ) ( not ( = ?auto_8821 ?auto_8822 ) ) ( not ( = ?auto_8821 ?auto_8851 ) ) ( not ( = ?auto_8822 ?auto_8851 ) ) ( not ( = ?auto_8831 ?auto_8840 ) ) ( IS-CRATE ?auto_8821 ) ( not ( = ?auto_8842 ?auto_8830 ) ) ( HOIST-AT ?auto_8848 ?auto_8842 ) ( SURFACE-AT ?auto_8821 ?auto_8842 ) ( ON ?auto_8821 ?auto_8850 ) ( CLEAR ?auto_8821 ) ( not ( = ?auto_8820 ?auto_8821 ) ) ( not ( = ?auto_8820 ?auto_8850 ) ) ( not ( = ?auto_8821 ?auto_8850 ) ) ( not ( = ?auto_8831 ?auto_8848 ) ) ( SURFACE-AT ?auto_8819 ?auto_8830 ) ( CLEAR ?auto_8819 ) ( IS-CRATE ?auto_8820 ) ( AVAILABLE ?auto_8831 ) ( AVAILABLE ?auto_8848 ) ( SURFACE-AT ?auto_8820 ?auto_8842 ) ( ON ?auto_8820 ?auto_8849 ) ( CLEAR ?auto_8820 ) ( TRUCK-AT ?auto_8829 ?auto_8830 ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8849 ) ) ( not ( = ?auto_8820 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8821 ) ) ( not ( = ?auto_8819 ?auto_8850 ) ) ( not ( = ?auto_8821 ?auto_8849 ) ) ( not ( = ?auto_8850 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8822 ) ) ( not ( = ?auto_8819 ?auto_8851 ) ) ( not ( = ?auto_8820 ?auto_8822 ) ) ( not ( = ?auto_8820 ?auto_8851 ) ) ( not ( = ?auto_8822 ?auto_8850 ) ) ( not ( = ?auto_8822 ?auto_8849 ) ) ( not ( = ?auto_8836 ?auto_8842 ) ) ( not ( = ?auto_8840 ?auto_8848 ) ) ( not ( = ?auto_8851 ?auto_8850 ) ) ( not ( = ?auto_8851 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8823 ) ) ( not ( = ?auto_8819 ?auto_8845 ) ) ( not ( = ?auto_8820 ?auto_8823 ) ) ( not ( = ?auto_8820 ?auto_8845 ) ) ( not ( = ?auto_8821 ?auto_8823 ) ) ( not ( = ?auto_8821 ?auto_8845 ) ) ( not ( = ?auto_8823 ?auto_8851 ) ) ( not ( = ?auto_8823 ?auto_8850 ) ) ( not ( = ?auto_8823 ?auto_8849 ) ) ( not ( = ?auto_8841 ?auto_8836 ) ) ( not ( = ?auto_8841 ?auto_8842 ) ) ( not ( = ?auto_8852 ?auto_8840 ) ) ( not ( = ?auto_8852 ?auto_8848 ) ) ( not ( = ?auto_8845 ?auto_8851 ) ) ( not ( = ?auto_8845 ?auto_8850 ) ) ( not ( = ?auto_8845 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8824 ) ) ( not ( = ?auto_8819 ?auto_8839 ) ) ( not ( = ?auto_8820 ?auto_8824 ) ) ( not ( = ?auto_8820 ?auto_8839 ) ) ( not ( = ?auto_8821 ?auto_8824 ) ) ( not ( = ?auto_8821 ?auto_8839 ) ) ( not ( = ?auto_8822 ?auto_8824 ) ) ( not ( = ?auto_8822 ?auto_8839 ) ) ( not ( = ?auto_8824 ?auto_8845 ) ) ( not ( = ?auto_8824 ?auto_8851 ) ) ( not ( = ?auto_8824 ?auto_8850 ) ) ( not ( = ?auto_8824 ?auto_8849 ) ) ( not ( = ?auto_8839 ?auto_8845 ) ) ( not ( = ?auto_8839 ?auto_8851 ) ) ( not ( = ?auto_8839 ?auto_8850 ) ) ( not ( = ?auto_8839 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8825 ) ) ( not ( = ?auto_8819 ?auto_8846 ) ) ( not ( = ?auto_8820 ?auto_8825 ) ) ( not ( = ?auto_8820 ?auto_8846 ) ) ( not ( = ?auto_8821 ?auto_8825 ) ) ( not ( = ?auto_8821 ?auto_8846 ) ) ( not ( = ?auto_8822 ?auto_8825 ) ) ( not ( = ?auto_8822 ?auto_8846 ) ) ( not ( = ?auto_8823 ?auto_8825 ) ) ( not ( = ?auto_8823 ?auto_8846 ) ) ( not ( = ?auto_8825 ?auto_8839 ) ) ( not ( = ?auto_8825 ?auto_8845 ) ) ( not ( = ?auto_8825 ?auto_8851 ) ) ( not ( = ?auto_8825 ?auto_8850 ) ) ( not ( = ?auto_8825 ?auto_8849 ) ) ( not ( = ?auto_8838 ?auto_8841 ) ) ( not ( = ?auto_8838 ?auto_8836 ) ) ( not ( = ?auto_8838 ?auto_8842 ) ) ( not ( = ?auto_8844 ?auto_8852 ) ) ( not ( = ?auto_8844 ?auto_8840 ) ) ( not ( = ?auto_8844 ?auto_8848 ) ) ( not ( = ?auto_8846 ?auto_8839 ) ) ( not ( = ?auto_8846 ?auto_8845 ) ) ( not ( = ?auto_8846 ?auto_8851 ) ) ( not ( = ?auto_8846 ?auto_8850 ) ) ( not ( = ?auto_8846 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8826 ) ) ( not ( = ?auto_8819 ?auto_8835 ) ) ( not ( = ?auto_8820 ?auto_8826 ) ) ( not ( = ?auto_8820 ?auto_8835 ) ) ( not ( = ?auto_8821 ?auto_8826 ) ) ( not ( = ?auto_8821 ?auto_8835 ) ) ( not ( = ?auto_8822 ?auto_8826 ) ) ( not ( = ?auto_8822 ?auto_8835 ) ) ( not ( = ?auto_8823 ?auto_8826 ) ) ( not ( = ?auto_8823 ?auto_8835 ) ) ( not ( = ?auto_8824 ?auto_8826 ) ) ( not ( = ?auto_8824 ?auto_8835 ) ) ( not ( = ?auto_8826 ?auto_8846 ) ) ( not ( = ?auto_8826 ?auto_8839 ) ) ( not ( = ?auto_8826 ?auto_8845 ) ) ( not ( = ?auto_8826 ?auto_8851 ) ) ( not ( = ?auto_8826 ?auto_8850 ) ) ( not ( = ?auto_8826 ?auto_8849 ) ) ( not ( = ?auto_8837 ?auto_8838 ) ) ( not ( = ?auto_8837 ?auto_8841 ) ) ( not ( = ?auto_8837 ?auto_8836 ) ) ( not ( = ?auto_8837 ?auto_8842 ) ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8843 ?auto_8852 ) ) ( not ( = ?auto_8843 ?auto_8840 ) ) ( not ( = ?auto_8843 ?auto_8848 ) ) ( not ( = ?auto_8835 ?auto_8846 ) ) ( not ( = ?auto_8835 ?auto_8839 ) ) ( not ( = ?auto_8835 ?auto_8845 ) ) ( not ( = ?auto_8835 ?auto_8851 ) ) ( not ( = ?auto_8835 ?auto_8850 ) ) ( not ( = ?auto_8835 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8827 ) ) ( not ( = ?auto_8819 ?auto_8847 ) ) ( not ( = ?auto_8820 ?auto_8827 ) ) ( not ( = ?auto_8820 ?auto_8847 ) ) ( not ( = ?auto_8821 ?auto_8827 ) ) ( not ( = ?auto_8821 ?auto_8847 ) ) ( not ( = ?auto_8822 ?auto_8827 ) ) ( not ( = ?auto_8822 ?auto_8847 ) ) ( not ( = ?auto_8823 ?auto_8827 ) ) ( not ( = ?auto_8823 ?auto_8847 ) ) ( not ( = ?auto_8824 ?auto_8827 ) ) ( not ( = ?auto_8824 ?auto_8847 ) ) ( not ( = ?auto_8825 ?auto_8827 ) ) ( not ( = ?auto_8825 ?auto_8847 ) ) ( not ( = ?auto_8827 ?auto_8835 ) ) ( not ( = ?auto_8827 ?auto_8846 ) ) ( not ( = ?auto_8827 ?auto_8839 ) ) ( not ( = ?auto_8827 ?auto_8845 ) ) ( not ( = ?auto_8827 ?auto_8851 ) ) ( not ( = ?auto_8827 ?auto_8850 ) ) ( not ( = ?auto_8827 ?auto_8849 ) ) ( not ( = ?auto_8847 ?auto_8835 ) ) ( not ( = ?auto_8847 ?auto_8846 ) ) ( not ( = ?auto_8847 ?auto_8839 ) ) ( not ( = ?auto_8847 ?auto_8845 ) ) ( not ( = ?auto_8847 ?auto_8851 ) ) ( not ( = ?auto_8847 ?auto_8850 ) ) ( not ( = ?auto_8847 ?auto_8849 ) ) ( not ( = ?auto_8819 ?auto_8828 ) ) ( not ( = ?auto_8819 ?auto_8833 ) ) ( not ( = ?auto_8820 ?auto_8828 ) ) ( not ( = ?auto_8820 ?auto_8833 ) ) ( not ( = ?auto_8821 ?auto_8828 ) ) ( not ( = ?auto_8821 ?auto_8833 ) ) ( not ( = ?auto_8822 ?auto_8828 ) ) ( not ( = ?auto_8822 ?auto_8833 ) ) ( not ( = ?auto_8823 ?auto_8828 ) ) ( not ( = ?auto_8823 ?auto_8833 ) ) ( not ( = ?auto_8824 ?auto_8828 ) ) ( not ( = ?auto_8824 ?auto_8833 ) ) ( not ( = ?auto_8825 ?auto_8828 ) ) ( not ( = ?auto_8825 ?auto_8833 ) ) ( not ( = ?auto_8826 ?auto_8828 ) ) ( not ( = ?auto_8826 ?auto_8833 ) ) ( not ( = ?auto_8828 ?auto_8847 ) ) ( not ( = ?auto_8828 ?auto_8835 ) ) ( not ( = ?auto_8828 ?auto_8846 ) ) ( not ( = ?auto_8828 ?auto_8839 ) ) ( not ( = ?auto_8828 ?auto_8845 ) ) ( not ( = ?auto_8828 ?auto_8851 ) ) ( not ( = ?auto_8828 ?auto_8850 ) ) ( not ( = ?auto_8828 ?auto_8849 ) ) ( not ( = ?auto_8834 ?auto_8838 ) ) ( not ( = ?auto_8834 ?auto_8837 ) ) ( not ( = ?auto_8834 ?auto_8841 ) ) ( not ( = ?auto_8834 ?auto_8836 ) ) ( not ( = ?auto_8834 ?auto_8842 ) ) ( not ( = ?auto_8832 ?auto_8844 ) ) ( not ( = ?auto_8832 ?auto_8843 ) ) ( not ( = ?auto_8832 ?auto_8852 ) ) ( not ( = ?auto_8832 ?auto_8840 ) ) ( not ( = ?auto_8832 ?auto_8848 ) ) ( not ( = ?auto_8833 ?auto_8847 ) ) ( not ( = ?auto_8833 ?auto_8835 ) ) ( not ( = ?auto_8833 ?auto_8846 ) ) ( not ( = ?auto_8833 ?auto_8839 ) ) ( not ( = ?auto_8833 ?auto_8845 ) ) ( not ( = ?auto_8833 ?auto_8851 ) ) ( not ( = ?auto_8833 ?auto_8850 ) ) ( not ( = ?auto_8833 ?auto_8849 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8819 ?auto_8820 ?auto_8821 ?auto_8822 ?auto_8823 ?auto_8824 ?auto_8825 ?auto_8826 ?auto_8827 )
      ( MAKE-1CRATE ?auto_8827 ?auto_8828 )
      ( MAKE-9CRATE-VERIFY ?auto_8819 ?auto_8820 ?auto_8821 ?auto_8822 ?auto_8823 ?auto_8824 ?auto_8825 ?auto_8826 ?auto_8827 ?auto_8828 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8874 - SURFACE
      ?auto_8875 - SURFACE
      ?auto_8876 - SURFACE
      ?auto_8877 - SURFACE
      ?auto_8878 - SURFACE
      ?auto_8879 - SURFACE
      ?auto_8880 - SURFACE
      ?auto_8881 - SURFACE
      ?auto_8882 - SURFACE
      ?auto_8883 - SURFACE
      ?auto_8884 - SURFACE
    )
    :vars
    (
      ?auto_8885 - HOIST
      ?auto_8886 - PLACE
      ?auto_8888 - PLACE
      ?auto_8890 - HOIST
      ?auto_8889 - SURFACE
      ?auto_8908 - PLACE
      ?auto_8898 - HOIST
      ?auto_8907 - SURFACE
      ?auto_8899 - PLACE
      ?auto_8904 - HOIST
      ?auto_8896 - SURFACE
      ?auto_8891 - PLACE
      ?auto_8905 - HOIST
      ?auto_8909 - SURFACE
      ?auto_8903 - SURFACE
      ?auto_8906 - PLACE
      ?auto_8900 - HOIST
      ?auto_8911 - SURFACE
      ?auto_8895 - SURFACE
      ?auto_8910 - PLACE
      ?auto_8893 - HOIST
      ?auto_8902 - SURFACE
      ?auto_8901 - PLACE
      ?auto_8894 - HOIST
      ?auto_8897 - SURFACE
      ?auto_8892 - SURFACE
      ?auto_8887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8885 ?auto_8886 ) ( IS-CRATE ?auto_8884 ) ( not ( = ?auto_8888 ?auto_8886 ) ) ( HOIST-AT ?auto_8890 ?auto_8888 ) ( AVAILABLE ?auto_8890 ) ( SURFACE-AT ?auto_8884 ?auto_8888 ) ( ON ?auto_8884 ?auto_8889 ) ( CLEAR ?auto_8884 ) ( not ( = ?auto_8883 ?auto_8884 ) ) ( not ( = ?auto_8883 ?auto_8889 ) ) ( not ( = ?auto_8884 ?auto_8889 ) ) ( not ( = ?auto_8885 ?auto_8890 ) ) ( IS-CRATE ?auto_8883 ) ( not ( = ?auto_8908 ?auto_8886 ) ) ( HOIST-AT ?auto_8898 ?auto_8908 ) ( AVAILABLE ?auto_8898 ) ( SURFACE-AT ?auto_8883 ?auto_8908 ) ( ON ?auto_8883 ?auto_8907 ) ( CLEAR ?auto_8883 ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( not ( = ?auto_8882 ?auto_8907 ) ) ( not ( = ?auto_8883 ?auto_8907 ) ) ( not ( = ?auto_8885 ?auto_8898 ) ) ( IS-CRATE ?auto_8882 ) ( not ( = ?auto_8899 ?auto_8886 ) ) ( HOIST-AT ?auto_8904 ?auto_8899 ) ( SURFACE-AT ?auto_8882 ?auto_8899 ) ( ON ?auto_8882 ?auto_8896 ) ( CLEAR ?auto_8882 ) ( not ( = ?auto_8881 ?auto_8882 ) ) ( not ( = ?auto_8881 ?auto_8896 ) ) ( not ( = ?auto_8882 ?auto_8896 ) ) ( not ( = ?auto_8885 ?auto_8904 ) ) ( IS-CRATE ?auto_8881 ) ( not ( = ?auto_8891 ?auto_8886 ) ) ( HOIST-AT ?auto_8905 ?auto_8891 ) ( AVAILABLE ?auto_8905 ) ( SURFACE-AT ?auto_8881 ?auto_8891 ) ( ON ?auto_8881 ?auto_8909 ) ( CLEAR ?auto_8881 ) ( not ( = ?auto_8880 ?auto_8881 ) ) ( not ( = ?auto_8880 ?auto_8909 ) ) ( not ( = ?auto_8881 ?auto_8909 ) ) ( not ( = ?auto_8885 ?auto_8905 ) ) ( IS-CRATE ?auto_8880 ) ( AVAILABLE ?auto_8904 ) ( SURFACE-AT ?auto_8880 ?auto_8899 ) ( ON ?auto_8880 ?auto_8903 ) ( CLEAR ?auto_8880 ) ( not ( = ?auto_8879 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8903 ) ) ( not ( = ?auto_8880 ?auto_8903 ) ) ( IS-CRATE ?auto_8879 ) ( not ( = ?auto_8906 ?auto_8886 ) ) ( HOIST-AT ?auto_8900 ?auto_8906 ) ( SURFACE-AT ?auto_8879 ?auto_8906 ) ( ON ?auto_8879 ?auto_8911 ) ( CLEAR ?auto_8879 ) ( not ( = ?auto_8878 ?auto_8879 ) ) ( not ( = ?auto_8878 ?auto_8911 ) ) ( not ( = ?auto_8879 ?auto_8911 ) ) ( not ( = ?auto_8885 ?auto_8900 ) ) ( IS-CRATE ?auto_8878 ) ( AVAILABLE ?auto_8900 ) ( SURFACE-AT ?auto_8878 ?auto_8906 ) ( ON ?auto_8878 ?auto_8895 ) ( CLEAR ?auto_8878 ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( not ( = ?auto_8877 ?auto_8895 ) ) ( not ( = ?auto_8878 ?auto_8895 ) ) ( IS-CRATE ?auto_8877 ) ( not ( = ?auto_8910 ?auto_8886 ) ) ( HOIST-AT ?auto_8893 ?auto_8910 ) ( AVAILABLE ?auto_8893 ) ( SURFACE-AT ?auto_8877 ?auto_8910 ) ( ON ?auto_8877 ?auto_8902 ) ( CLEAR ?auto_8877 ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8902 ) ) ( not ( = ?auto_8877 ?auto_8902 ) ) ( not ( = ?auto_8885 ?auto_8893 ) ) ( IS-CRATE ?auto_8876 ) ( not ( = ?auto_8901 ?auto_8886 ) ) ( HOIST-AT ?auto_8894 ?auto_8901 ) ( SURFACE-AT ?auto_8876 ?auto_8901 ) ( ON ?auto_8876 ?auto_8897 ) ( CLEAR ?auto_8876 ) ( not ( = ?auto_8875 ?auto_8876 ) ) ( not ( = ?auto_8875 ?auto_8897 ) ) ( not ( = ?auto_8876 ?auto_8897 ) ) ( not ( = ?auto_8885 ?auto_8894 ) ) ( SURFACE-AT ?auto_8874 ?auto_8886 ) ( CLEAR ?auto_8874 ) ( IS-CRATE ?auto_8875 ) ( AVAILABLE ?auto_8885 ) ( AVAILABLE ?auto_8894 ) ( SURFACE-AT ?auto_8875 ?auto_8901 ) ( ON ?auto_8875 ?auto_8892 ) ( CLEAR ?auto_8875 ) ( TRUCK-AT ?auto_8887 ?auto_8886 ) ( not ( = ?auto_8874 ?auto_8875 ) ) ( not ( = ?auto_8874 ?auto_8892 ) ) ( not ( = ?auto_8875 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8876 ) ) ( not ( = ?auto_8874 ?auto_8897 ) ) ( not ( = ?auto_8876 ?auto_8892 ) ) ( not ( = ?auto_8897 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8877 ) ) ( not ( = ?auto_8874 ?auto_8902 ) ) ( not ( = ?auto_8875 ?auto_8877 ) ) ( not ( = ?auto_8875 ?auto_8902 ) ) ( not ( = ?auto_8877 ?auto_8897 ) ) ( not ( = ?auto_8877 ?auto_8892 ) ) ( not ( = ?auto_8910 ?auto_8901 ) ) ( not ( = ?auto_8893 ?auto_8894 ) ) ( not ( = ?auto_8902 ?auto_8897 ) ) ( not ( = ?auto_8902 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8878 ) ) ( not ( = ?auto_8874 ?auto_8895 ) ) ( not ( = ?auto_8875 ?auto_8878 ) ) ( not ( = ?auto_8875 ?auto_8895 ) ) ( not ( = ?auto_8876 ?auto_8878 ) ) ( not ( = ?auto_8876 ?auto_8895 ) ) ( not ( = ?auto_8878 ?auto_8902 ) ) ( not ( = ?auto_8878 ?auto_8897 ) ) ( not ( = ?auto_8878 ?auto_8892 ) ) ( not ( = ?auto_8906 ?auto_8910 ) ) ( not ( = ?auto_8906 ?auto_8901 ) ) ( not ( = ?auto_8900 ?auto_8893 ) ) ( not ( = ?auto_8900 ?auto_8894 ) ) ( not ( = ?auto_8895 ?auto_8902 ) ) ( not ( = ?auto_8895 ?auto_8897 ) ) ( not ( = ?auto_8895 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8879 ) ) ( not ( = ?auto_8874 ?auto_8911 ) ) ( not ( = ?auto_8875 ?auto_8879 ) ) ( not ( = ?auto_8875 ?auto_8911 ) ) ( not ( = ?auto_8876 ?auto_8879 ) ) ( not ( = ?auto_8876 ?auto_8911 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8911 ) ) ( not ( = ?auto_8879 ?auto_8895 ) ) ( not ( = ?auto_8879 ?auto_8902 ) ) ( not ( = ?auto_8879 ?auto_8897 ) ) ( not ( = ?auto_8879 ?auto_8892 ) ) ( not ( = ?auto_8911 ?auto_8895 ) ) ( not ( = ?auto_8911 ?auto_8902 ) ) ( not ( = ?auto_8911 ?auto_8897 ) ) ( not ( = ?auto_8911 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8880 ) ) ( not ( = ?auto_8874 ?auto_8903 ) ) ( not ( = ?auto_8875 ?auto_8880 ) ) ( not ( = ?auto_8875 ?auto_8903 ) ) ( not ( = ?auto_8876 ?auto_8880 ) ) ( not ( = ?auto_8876 ?auto_8903 ) ) ( not ( = ?auto_8877 ?auto_8880 ) ) ( not ( = ?auto_8877 ?auto_8903 ) ) ( not ( = ?auto_8878 ?auto_8880 ) ) ( not ( = ?auto_8878 ?auto_8903 ) ) ( not ( = ?auto_8880 ?auto_8911 ) ) ( not ( = ?auto_8880 ?auto_8895 ) ) ( not ( = ?auto_8880 ?auto_8902 ) ) ( not ( = ?auto_8880 ?auto_8897 ) ) ( not ( = ?auto_8880 ?auto_8892 ) ) ( not ( = ?auto_8899 ?auto_8906 ) ) ( not ( = ?auto_8899 ?auto_8910 ) ) ( not ( = ?auto_8899 ?auto_8901 ) ) ( not ( = ?auto_8904 ?auto_8900 ) ) ( not ( = ?auto_8904 ?auto_8893 ) ) ( not ( = ?auto_8904 ?auto_8894 ) ) ( not ( = ?auto_8903 ?auto_8911 ) ) ( not ( = ?auto_8903 ?auto_8895 ) ) ( not ( = ?auto_8903 ?auto_8902 ) ) ( not ( = ?auto_8903 ?auto_8897 ) ) ( not ( = ?auto_8903 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8881 ) ) ( not ( = ?auto_8874 ?auto_8909 ) ) ( not ( = ?auto_8875 ?auto_8881 ) ) ( not ( = ?auto_8875 ?auto_8909 ) ) ( not ( = ?auto_8876 ?auto_8881 ) ) ( not ( = ?auto_8876 ?auto_8909 ) ) ( not ( = ?auto_8877 ?auto_8881 ) ) ( not ( = ?auto_8877 ?auto_8909 ) ) ( not ( = ?auto_8878 ?auto_8881 ) ) ( not ( = ?auto_8878 ?auto_8909 ) ) ( not ( = ?auto_8879 ?auto_8881 ) ) ( not ( = ?auto_8879 ?auto_8909 ) ) ( not ( = ?auto_8881 ?auto_8903 ) ) ( not ( = ?auto_8881 ?auto_8911 ) ) ( not ( = ?auto_8881 ?auto_8895 ) ) ( not ( = ?auto_8881 ?auto_8902 ) ) ( not ( = ?auto_8881 ?auto_8897 ) ) ( not ( = ?auto_8881 ?auto_8892 ) ) ( not ( = ?auto_8891 ?auto_8899 ) ) ( not ( = ?auto_8891 ?auto_8906 ) ) ( not ( = ?auto_8891 ?auto_8910 ) ) ( not ( = ?auto_8891 ?auto_8901 ) ) ( not ( = ?auto_8905 ?auto_8904 ) ) ( not ( = ?auto_8905 ?auto_8900 ) ) ( not ( = ?auto_8905 ?auto_8893 ) ) ( not ( = ?auto_8905 ?auto_8894 ) ) ( not ( = ?auto_8909 ?auto_8903 ) ) ( not ( = ?auto_8909 ?auto_8911 ) ) ( not ( = ?auto_8909 ?auto_8895 ) ) ( not ( = ?auto_8909 ?auto_8902 ) ) ( not ( = ?auto_8909 ?auto_8897 ) ) ( not ( = ?auto_8909 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8882 ) ) ( not ( = ?auto_8874 ?auto_8896 ) ) ( not ( = ?auto_8875 ?auto_8882 ) ) ( not ( = ?auto_8875 ?auto_8896 ) ) ( not ( = ?auto_8876 ?auto_8882 ) ) ( not ( = ?auto_8876 ?auto_8896 ) ) ( not ( = ?auto_8877 ?auto_8882 ) ) ( not ( = ?auto_8877 ?auto_8896 ) ) ( not ( = ?auto_8878 ?auto_8882 ) ) ( not ( = ?auto_8878 ?auto_8896 ) ) ( not ( = ?auto_8879 ?auto_8882 ) ) ( not ( = ?auto_8879 ?auto_8896 ) ) ( not ( = ?auto_8880 ?auto_8882 ) ) ( not ( = ?auto_8880 ?auto_8896 ) ) ( not ( = ?auto_8882 ?auto_8909 ) ) ( not ( = ?auto_8882 ?auto_8903 ) ) ( not ( = ?auto_8882 ?auto_8911 ) ) ( not ( = ?auto_8882 ?auto_8895 ) ) ( not ( = ?auto_8882 ?auto_8902 ) ) ( not ( = ?auto_8882 ?auto_8897 ) ) ( not ( = ?auto_8882 ?auto_8892 ) ) ( not ( = ?auto_8896 ?auto_8909 ) ) ( not ( = ?auto_8896 ?auto_8903 ) ) ( not ( = ?auto_8896 ?auto_8911 ) ) ( not ( = ?auto_8896 ?auto_8895 ) ) ( not ( = ?auto_8896 ?auto_8902 ) ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8896 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8883 ) ) ( not ( = ?auto_8874 ?auto_8907 ) ) ( not ( = ?auto_8875 ?auto_8883 ) ) ( not ( = ?auto_8875 ?auto_8907 ) ) ( not ( = ?auto_8876 ?auto_8883 ) ) ( not ( = ?auto_8876 ?auto_8907 ) ) ( not ( = ?auto_8877 ?auto_8883 ) ) ( not ( = ?auto_8877 ?auto_8907 ) ) ( not ( = ?auto_8878 ?auto_8883 ) ) ( not ( = ?auto_8878 ?auto_8907 ) ) ( not ( = ?auto_8879 ?auto_8883 ) ) ( not ( = ?auto_8879 ?auto_8907 ) ) ( not ( = ?auto_8880 ?auto_8883 ) ) ( not ( = ?auto_8880 ?auto_8907 ) ) ( not ( = ?auto_8881 ?auto_8883 ) ) ( not ( = ?auto_8881 ?auto_8907 ) ) ( not ( = ?auto_8883 ?auto_8896 ) ) ( not ( = ?auto_8883 ?auto_8909 ) ) ( not ( = ?auto_8883 ?auto_8903 ) ) ( not ( = ?auto_8883 ?auto_8911 ) ) ( not ( = ?auto_8883 ?auto_8895 ) ) ( not ( = ?auto_8883 ?auto_8902 ) ) ( not ( = ?auto_8883 ?auto_8897 ) ) ( not ( = ?auto_8883 ?auto_8892 ) ) ( not ( = ?auto_8908 ?auto_8899 ) ) ( not ( = ?auto_8908 ?auto_8891 ) ) ( not ( = ?auto_8908 ?auto_8906 ) ) ( not ( = ?auto_8908 ?auto_8910 ) ) ( not ( = ?auto_8908 ?auto_8901 ) ) ( not ( = ?auto_8898 ?auto_8904 ) ) ( not ( = ?auto_8898 ?auto_8905 ) ) ( not ( = ?auto_8898 ?auto_8900 ) ) ( not ( = ?auto_8898 ?auto_8893 ) ) ( not ( = ?auto_8898 ?auto_8894 ) ) ( not ( = ?auto_8907 ?auto_8896 ) ) ( not ( = ?auto_8907 ?auto_8909 ) ) ( not ( = ?auto_8907 ?auto_8903 ) ) ( not ( = ?auto_8907 ?auto_8911 ) ) ( not ( = ?auto_8907 ?auto_8895 ) ) ( not ( = ?auto_8907 ?auto_8902 ) ) ( not ( = ?auto_8907 ?auto_8897 ) ) ( not ( = ?auto_8907 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8884 ) ) ( not ( = ?auto_8874 ?auto_8889 ) ) ( not ( = ?auto_8875 ?auto_8884 ) ) ( not ( = ?auto_8875 ?auto_8889 ) ) ( not ( = ?auto_8876 ?auto_8884 ) ) ( not ( = ?auto_8876 ?auto_8889 ) ) ( not ( = ?auto_8877 ?auto_8884 ) ) ( not ( = ?auto_8877 ?auto_8889 ) ) ( not ( = ?auto_8878 ?auto_8884 ) ) ( not ( = ?auto_8878 ?auto_8889 ) ) ( not ( = ?auto_8879 ?auto_8884 ) ) ( not ( = ?auto_8879 ?auto_8889 ) ) ( not ( = ?auto_8880 ?auto_8884 ) ) ( not ( = ?auto_8880 ?auto_8889 ) ) ( not ( = ?auto_8881 ?auto_8884 ) ) ( not ( = ?auto_8881 ?auto_8889 ) ) ( not ( = ?auto_8882 ?auto_8884 ) ) ( not ( = ?auto_8882 ?auto_8889 ) ) ( not ( = ?auto_8884 ?auto_8907 ) ) ( not ( = ?auto_8884 ?auto_8896 ) ) ( not ( = ?auto_8884 ?auto_8909 ) ) ( not ( = ?auto_8884 ?auto_8903 ) ) ( not ( = ?auto_8884 ?auto_8911 ) ) ( not ( = ?auto_8884 ?auto_8895 ) ) ( not ( = ?auto_8884 ?auto_8902 ) ) ( not ( = ?auto_8884 ?auto_8897 ) ) ( not ( = ?auto_8884 ?auto_8892 ) ) ( not ( = ?auto_8888 ?auto_8908 ) ) ( not ( = ?auto_8888 ?auto_8899 ) ) ( not ( = ?auto_8888 ?auto_8891 ) ) ( not ( = ?auto_8888 ?auto_8906 ) ) ( not ( = ?auto_8888 ?auto_8910 ) ) ( not ( = ?auto_8888 ?auto_8901 ) ) ( not ( = ?auto_8890 ?auto_8898 ) ) ( not ( = ?auto_8890 ?auto_8904 ) ) ( not ( = ?auto_8890 ?auto_8905 ) ) ( not ( = ?auto_8890 ?auto_8900 ) ) ( not ( = ?auto_8890 ?auto_8893 ) ) ( not ( = ?auto_8890 ?auto_8894 ) ) ( not ( = ?auto_8889 ?auto_8907 ) ) ( not ( = ?auto_8889 ?auto_8896 ) ) ( not ( = ?auto_8889 ?auto_8909 ) ) ( not ( = ?auto_8889 ?auto_8903 ) ) ( not ( = ?auto_8889 ?auto_8911 ) ) ( not ( = ?auto_8889 ?auto_8895 ) ) ( not ( = ?auto_8889 ?auto_8902 ) ) ( not ( = ?auto_8889 ?auto_8897 ) ) ( not ( = ?auto_8889 ?auto_8892 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8874 ?auto_8875 ?auto_8876 ?auto_8877 ?auto_8878 ?auto_8879 ?auto_8880 ?auto_8881 ?auto_8882 ?auto_8883 )
      ( MAKE-1CRATE ?auto_8883 ?auto_8884 )
      ( MAKE-10CRATE-VERIFY ?auto_8874 ?auto_8875 ?auto_8876 ?auto_8877 ?auto_8878 ?auto_8879 ?auto_8880 ?auto_8881 ?auto_8882 ?auto_8883 ?auto_8884 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_8934 - SURFACE
      ?auto_8935 - SURFACE
      ?auto_8936 - SURFACE
      ?auto_8937 - SURFACE
      ?auto_8938 - SURFACE
      ?auto_8939 - SURFACE
      ?auto_8940 - SURFACE
      ?auto_8941 - SURFACE
      ?auto_8942 - SURFACE
      ?auto_8943 - SURFACE
      ?auto_8944 - SURFACE
      ?auto_8945 - SURFACE
    )
    :vars
    (
      ?auto_8951 - HOIST
      ?auto_8946 - PLACE
      ?auto_8949 - PLACE
      ?auto_8950 - HOIST
      ?auto_8948 - SURFACE
      ?auto_8955 - PLACE
      ?auto_8961 - HOIST
      ?auto_8973 - SURFACE
      ?auto_8967 - PLACE
      ?auto_8957 - HOIST
      ?auto_8953 - SURFACE
      ?auto_8966 - PLACE
      ?auto_8962 - HOIST
      ?auto_8956 - SURFACE
      ?auto_8960 - PLACE
      ?auto_8971 - HOIST
      ?auto_8954 - SURFACE
      ?auto_8964 - SURFACE
      ?auto_8963 - PLACE
      ?auto_8972 - HOIST
      ?auto_8968 - SURFACE
      ?auto_8952 - SURFACE
      ?auto_8970 - SURFACE
      ?auto_8965 - PLACE
      ?auto_8959 - HOIST
      ?auto_8969 - SURFACE
      ?auto_8958 - SURFACE
      ?auto_8947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8951 ?auto_8946 ) ( IS-CRATE ?auto_8945 ) ( not ( = ?auto_8949 ?auto_8946 ) ) ( HOIST-AT ?auto_8950 ?auto_8949 ) ( SURFACE-AT ?auto_8945 ?auto_8949 ) ( ON ?auto_8945 ?auto_8948 ) ( CLEAR ?auto_8945 ) ( not ( = ?auto_8944 ?auto_8945 ) ) ( not ( = ?auto_8944 ?auto_8948 ) ) ( not ( = ?auto_8945 ?auto_8948 ) ) ( not ( = ?auto_8951 ?auto_8950 ) ) ( IS-CRATE ?auto_8944 ) ( not ( = ?auto_8955 ?auto_8946 ) ) ( HOIST-AT ?auto_8961 ?auto_8955 ) ( AVAILABLE ?auto_8961 ) ( SURFACE-AT ?auto_8944 ?auto_8955 ) ( ON ?auto_8944 ?auto_8973 ) ( CLEAR ?auto_8944 ) ( not ( = ?auto_8943 ?auto_8944 ) ) ( not ( = ?auto_8943 ?auto_8973 ) ) ( not ( = ?auto_8944 ?auto_8973 ) ) ( not ( = ?auto_8951 ?auto_8961 ) ) ( IS-CRATE ?auto_8943 ) ( not ( = ?auto_8967 ?auto_8946 ) ) ( HOIST-AT ?auto_8957 ?auto_8967 ) ( AVAILABLE ?auto_8957 ) ( SURFACE-AT ?auto_8943 ?auto_8967 ) ( ON ?auto_8943 ?auto_8953 ) ( CLEAR ?auto_8943 ) ( not ( = ?auto_8942 ?auto_8943 ) ) ( not ( = ?auto_8942 ?auto_8953 ) ) ( not ( = ?auto_8943 ?auto_8953 ) ) ( not ( = ?auto_8951 ?auto_8957 ) ) ( IS-CRATE ?auto_8942 ) ( not ( = ?auto_8966 ?auto_8946 ) ) ( HOIST-AT ?auto_8962 ?auto_8966 ) ( SURFACE-AT ?auto_8942 ?auto_8966 ) ( ON ?auto_8942 ?auto_8956 ) ( CLEAR ?auto_8942 ) ( not ( = ?auto_8941 ?auto_8942 ) ) ( not ( = ?auto_8941 ?auto_8956 ) ) ( not ( = ?auto_8942 ?auto_8956 ) ) ( not ( = ?auto_8951 ?auto_8962 ) ) ( IS-CRATE ?auto_8941 ) ( not ( = ?auto_8960 ?auto_8946 ) ) ( HOIST-AT ?auto_8971 ?auto_8960 ) ( AVAILABLE ?auto_8971 ) ( SURFACE-AT ?auto_8941 ?auto_8960 ) ( ON ?auto_8941 ?auto_8954 ) ( CLEAR ?auto_8941 ) ( not ( = ?auto_8940 ?auto_8941 ) ) ( not ( = ?auto_8940 ?auto_8954 ) ) ( not ( = ?auto_8941 ?auto_8954 ) ) ( not ( = ?auto_8951 ?auto_8971 ) ) ( IS-CRATE ?auto_8940 ) ( AVAILABLE ?auto_8962 ) ( SURFACE-AT ?auto_8940 ?auto_8966 ) ( ON ?auto_8940 ?auto_8964 ) ( CLEAR ?auto_8940 ) ( not ( = ?auto_8939 ?auto_8940 ) ) ( not ( = ?auto_8939 ?auto_8964 ) ) ( not ( = ?auto_8940 ?auto_8964 ) ) ( IS-CRATE ?auto_8939 ) ( not ( = ?auto_8963 ?auto_8946 ) ) ( HOIST-AT ?auto_8972 ?auto_8963 ) ( SURFACE-AT ?auto_8939 ?auto_8963 ) ( ON ?auto_8939 ?auto_8968 ) ( CLEAR ?auto_8939 ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8968 ) ) ( not ( = ?auto_8939 ?auto_8968 ) ) ( not ( = ?auto_8951 ?auto_8972 ) ) ( IS-CRATE ?auto_8938 ) ( AVAILABLE ?auto_8972 ) ( SURFACE-AT ?auto_8938 ?auto_8963 ) ( ON ?auto_8938 ?auto_8952 ) ( CLEAR ?auto_8938 ) ( not ( = ?auto_8937 ?auto_8938 ) ) ( not ( = ?auto_8937 ?auto_8952 ) ) ( not ( = ?auto_8938 ?auto_8952 ) ) ( IS-CRATE ?auto_8937 ) ( AVAILABLE ?auto_8950 ) ( SURFACE-AT ?auto_8937 ?auto_8949 ) ( ON ?auto_8937 ?auto_8970 ) ( CLEAR ?auto_8937 ) ( not ( = ?auto_8936 ?auto_8937 ) ) ( not ( = ?auto_8936 ?auto_8970 ) ) ( not ( = ?auto_8937 ?auto_8970 ) ) ( IS-CRATE ?auto_8936 ) ( not ( = ?auto_8965 ?auto_8946 ) ) ( HOIST-AT ?auto_8959 ?auto_8965 ) ( SURFACE-AT ?auto_8936 ?auto_8965 ) ( ON ?auto_8936 ?auto_8969 ) ( CLEAR ?auto_8936 ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8935 ?auto_8969 ) ) ( not ( = ?auto_8936 ?auto_8969 ) ) ( not ( = ?auto_8951 ?auto_8959 ) ) ( SURFACE-AT ?auto_8934 ?auto_8946 ) ( CLEAR ?auto_8934 ) ( IS-CRATE ?auto_8935 ) ( AVAILABLE ?auto_8951 ) ( AVAILABLE ?auto_8959 ) ( SURFACE-AT ?auto_8935 ?auto_8965 ) ( ON ?auto_8935 ?auto_8958 ) ( CLEAR ?auto_8935 ) ( TRUCK-AT ?auto_8947 ?auto_8946 ) ( not ( = ?auto_8934 ?auto_8935 ) ) ( not ( = ?auto_8934 ?auto_8958 ) ) ( not ( = ?auto_8935 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8936 ) ) ( not ( = ?auto_8934 ?auto_8969 ) ) ( not ( = ?auto_8936 ?auto_8958 ) ) ( not ( = ?auto_8969 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8937 ) ) ( not ( = ?auto_8934 ?auto_8970 ) ) ( not ( = ?auto_8935 ?auto_8937 ) ) ( not ( = ?auto_8935 ?auto_8970 ) ) ( not ( = ?auto_8937 ?auto_8969 ) ) ( not ( = ?auto_8937 ?auto_8958 ) ) ( not ( = ?auto_8949 ?auto_8965 ) ) ( not ( = ?auto_8950 ?auto_8959 ) ) ( not ( = ?auto_8970 ?auto_8969 ) ) ( not ( = ?auto_8970 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8938 ) ) ( not ( = ?auto_8934 ?auto_8952 ) ) ( not ( = ?auto_8935 ?auto_8938 ) ) ( not ( = ?auto_8935 ?auto_8952 ) ) ( not ( = ?auto_8936 ?auto_8938 ) ) ( not ( = ?auto_8936 ?auto_8952 ) ) ( not ( = ?auto_8938 ?auto_8970 ) ) ( not ( = ?auto_8938 ?auto_8969 ) ) ( not ( = ?auto_8938 ?auto_8958 ) ) ( not ( = ?auto_8963 ?auto_8949 ) ) ( not ( = ?auto_8963 ?auto_8965 ) ) ( not ( = ?auto_8972 ?auto_8950 ) ) ( not ( = ?auto_8972 ?auto_8959 ) ) ( not ( = ?auto_8952 ?auto_8970 ) ) ( not ( = ?auto_8952 ?auto_8969 ) ) ( not ( = ?auto_8952 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8939 ) ) ( not ( = ?auto_8934 ?auto_8968 ) ) ( not ( = ?auto_8935 ?auto_8939 ) ) ( not ( = ?auto_8935 ?auto_8968 ) ) ( not ( = ?auto_8936 ?auto_8939 ) ) ( not ( = ?auto_8936 ?auto_8968 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8937 ?auto_8968 ) ) ( not ( = ?auto_8939 ?auto_8952 ) ) ( not ( = ?auto_8939 ?auto_8970 ) ) ( not ( = ?auto_8939 ?auto_8969 ) ) ( not ( = ?auto_8939 ?auto_8958 ) ) ( not ( = ?auto_8968 ?auto_8952 ) ) ( not ( = ?auto_8968 ?auto_8970 ) ) ( not ( = ?auto_8968 ?auto_8969 ) ) ( not ( = ?auto_8968 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8940 ) ) ( not ( = ?auto_8934 ?auto_8964 ) ) ( not ( = ?auto_8935 ?auto_8940 ) ) ( not ( = ?auto_8935 ?auto_8964 ) ) ( not ( = ?auto_8936 ?auto_8940 ) ) ( not ( = ?auto_8936 ?auto_8964 ) ) ( not ( = ?auto_8937 ?auto_8940 ) ) ( not ( = ?auto_8937 ?auto_8964 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8964 ) ) ( not ( = ?auto_8940 ?auto_8968 ) ) ( not ( = ?auto_8940 ?auto_8952 ) ) ( not ( = ?auto_8940 ?auto_8970 ) ) ( not ( = ?auto_8940 ?auto_8969 ) ) ( not ( = ?auto_8940 ?auto_8958 ) ) ( not ( = ?auto_8966 ?auto_8963 ) ) ( not ( = ?auto_8966 ?auto_8949 ) ) ( not ( = ?auto_8966 ?auto_8965 ) ) ( not ( = ?auto_8962 ?auto_8972 ) ) ( not ( = ?auto_8962 ?auto_8950 ) ) ( not ( = ?auto_8962 ?auto_8959 ) ) ( not ( = ?auto_8964 ?auto_8968 ) ) ( not ( = ?auto_8964 ?auto_8952 ) ) ( not ( = ?auto_8964 ?auto_8970 ) ) ( not ( = ?auto_8964 ?auto_8969 ) ) ( not ( = ?auto_8964 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8941 ) ) ( not ( = ?auto_8934 ?auto_8954 ) ) ( not ( = ?auto_8935 ?auto_8941 ) ) ( not ( = ?auto_8935 ?auto_8954 ) ) ( not ( = ?auto_8936 ?auto_8941 ) ) ( not ( = ?auto_8936 ?auto_8954 ) ) ( not ( = ?auto_8937 ?auto_8941 ) ) ( not ( = ?auto_8937 ?auto_8954 ) ) ( not ( = ?auto_8938 ?auto_8941 ) ) ( not ( = ?auto_8938 ?auto_8954 ) ) ( not ( = ?auto_8939 ?auto_8941 ) ) ( not ( = ?auto_8939 ?auto_8954 ) ) ( not ( = ?auto_8941 ?auto_8964 ) ) ( not ( = ?auto_8941 ?auto_8968 ) ) ( not ( = ?auto_8941 ?auto_8952 ) ) ( not ( = ?auto_8941 ?auto_8970 ) ) ( not ( = ?auto_8941 ?auto_8969 ) ) ( not ( = ?auto_8941 ?auto_8958 ) ) ( not ( = ?auto_8960 ?auto_8966 ) ) ( not ( = ?auto_8960 ?auto_8963 ) ) ( not ( = ?auto_8960 ?auto_8949 ) ) ( not ( = ?auto_8960 ?auto_8965 ) ) ( not ( = ?auto_8971 ?auto_8962 ) ) ( not ( = ?auto_8971 ?auto_8972 ) ) ( not ( = ?auto_8971 ?auto_8950 ) ) ( not ( = ?auto_8971 ?auto_8959 ) ) ( not ( = ?auto_8954 ?auto_8964 ) ) ( not ( = ?auto_8954 ?auto_8968 ) ) ( not ( = ?auto_8954 ?auto_8952 ) ) ( not ( = ?auto_8954 ?auto_8970 ) ) ( not ( = ?auto_8954 ?auto_8969 ) ) ( not ( = ?auto_8954 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8942 ) ) ( not ( = ?auto_8934 ?auto_8956 ) ) ( not ( = ?auto_8935 ?auto_8942 ) ) ( not ( = ?auto_8935 ?auto_8956 ) ) ( not ( = ?auto_8936 ?auto_8942 ) ) ( not ( = ?auto_8936 ?auto_8956 ) ) ( not ( = ?auto_8937 ?auto_8942 ) ) ( not ( = ?auto_8937 ?auto_8956 ) ) ( not ( = ?auto_8938 ?auto_8942 ) ) ( not ( = ?auto_8938 ?auto_8956 ) ) ( not ( = ?auto_8939 ?auto_8942 ) ) ( not ( = ?auto_8939 ?auto_8956 ) ) ( not ( = ?auto_8940 ?auto_8942 ) ) ( not ( = ?auto_8940 ?auto_8956 ) ) ( not ( = ?auto_8942 ?auto_8954 ) ) ( not ( = ?auto_8942 ?auto_8964 ) ) ( not ( = ?auto_8942 ?auto_8968 ) ) ( not ( = ?auto_8942 ?auto_8952 ) ) ( not ( = ?auto_8942 ?auto_8970 ) ) ( not ( = ?auto_8942 ?auto_8969 ) ) ( not ( = ?auto_8942 ?auto_8958 ) ) ( not ( = ?auto_8956 ?auto_8954 ) ) ( not ( = ?auto_8956 ?auto_8964 ) ) ( not ( = ?auto_8956 ?auto_8968 ) ) ( not ( = ?auto_8956 ?auto_8952 ) ) ( not ( = ?auto_8956 ?auto_8970 ) ) ( not ( = ?auto_8956 ?auto_8969 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8943 ) ) ( not ( = ?auto_8934 ?auto_8953 ) ) ( not ( = ?auto_8935 ?auto_8943 ) ) ( not ( = ?auto_8935 ?auto_8953 ) ) ( not ( = ?auto_8936 ?auto_8943 ) ) ( not ( = ?auto_8936 ?auto_8953 ) ) ( not ( = ?auto_8937 ?auto_8943 ) ) ( not ( = ?auto_8937 ?auto_8953 ) ) ( not ( = ?auto_8938 ?auto_8943 ) ) ( not ( = ?auto_8938 ?auto_8953 ) ) ( not ( = ?auto_8939 ?auto_8943 ) ) ( not ( = ?auto_8939 ?auto_8953 ) ) ( not ( = ?auto_8940 ?auto_8943 ) ) ( not ( = ?auto_8940 ?auto_8953 ) ) ( not ( = ?auto_8941 ?auto_8943 ) ) ( not ( = ?auto_8941 ?auto_8953 ) ) ( not ( = ?auto_8943 ?auto_8956 ) ) ( not ( = ?auto_8943 ?auto_8954 ) ) ( not ( = ?auto_8943 ?auto_8964 ) ) ( not ( = ?auto_8943 ?auto_8968 ) ) ( not ( = ?auto_8943 ?auto_8952 ) ) ( not ( = ?auto_8943 ?auto_8970 ) ) ( not ( = ?auto_8943 ?auto_8969 ) ) ( not ( = ?auto_8943 ?auto_8958 ) ) ( not ( = ?auto_8967 ?auto_8966 ) ) ( not ( = ?auto_8967 ?auto_8960 ) ) ( not ( = ?auto_8967 ?auto_8963 ) ) ( not ( = ?auto_8967 ?auto_8949 ) ) ( not ( = ?auto_8967 ?auto_8965 ) ) ( not ( = ?auto_8957 ?auto_8962 ) ) ( not ( = ?auto_8957 ?auto_8971 ) ) ( not ( = ?auto_8957 ?auto_8972 ) ) ( not ( = ?auto_8957 ?auto_8950 ) ) ( not ( = ?auto_8957 ?auto_8959 ) ) ( not ( = ?auto_8953 ?auto_8956 ) ) ( not ( = ?auto_8953 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8964 ) ) ( not ( = ?auto_8953 ?auto_8968 ) ) ( not ( = ?auto_8953 ?auto_8952 ) ) ( not ( = ?auto_8953 ?auto_8970 ) ) ( not ( = ?auto_8953 ?auto_8969 ) ) ( not ( = ?auto_8953 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8944 ) ) ( not ( = ?auto_8934 ?auto_8973 ) ) ( not ( = ?auto_8935 ?auto_8944 ) ) ( not ( = ?auto_8935 ?auto_8973 ) ) ( not ( = ?auto_8936 ?auto_8944 ) ) ( not ( = ?auto_8936 ?auto_8973 ) ) ( not ( = ?auto_8937 ?auto_8944 ) ) ( not ( = ?auto_8937 ?auto_8973 ) ) ( not ( = ?auto_8938 ?auto_8944 ) ) ( not ( = ?auto_8938 ?auto_8973 ) ) ( not ( = ?auto_8939 ?auto_8944 ) ) ( not ( = ?auto_8939 ?auto_8973 ) ) ( not ( = ?auto_8940 ?auto_8944 ) ) ( not ( = ?auto_8940 ?auto_8973 ) ) ( not ( = ?auto_8941 ?auto_8944 ) ) ( not ( = ?auto_8941 ?auto_8973 ) ) ( not ( = ?auto_8942 ?auto_8944 ) ) ( not ( = ?auto_8942 ?auto_8973 ) ) ( not ( = ?auto_8944 ?auto_8953 ) ) ( not ( = ?auto_8944 ?auto_8956 ) ) ( not ( = ?auto_8944 ?auto_8954 ) ) ( not ( = ?auto_8944 ?auto_8964 ) ) ( not ( = ?auto_8944 ?auto_8968 ) ) ( not ( = ?auto_8944 ?auto_8952 ) ) ( not ( = ?auto_8944 ?auto_8970 ) ) ( not ( = ?auto_8944 ?auto_8969 ) ) ( not ( = ?auto_8944 ?auto_8958 ) ) ( not ( = ?auto_8955 ?auto_8967 ) ) ( not ( = ?auto_8955 ?auto_8966 ) ) ( not ( = ?auto_8955 ?auto_8960 ) ) ( not ( = ?auto_8955 ?auto_8963 ) ) ( not ( = ?auto_8955 ?auto_8949 ) ) ( not ( = ?auto_8955 ?auto_8965 ) ) ( not ( = ?auto_8961 ?auto_8957 ) ) ( not ( = ?auto_8961 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8971 ) ) ( not ( = ?auto_8961 ?auto_8972 ) ) ( not ( = ?auto_8961 ?auto_8950 ) ) ( not ( = ?auto_8961 ?auto_8959 ) ) ( not ( = ?auto_8973 ?auto_8953 ) ) ( not ( = ?auto_8973 ?auto_8956 ) ) ( not ( = ?auto_8973 ?auto_8954 ) ) ( not ( = ?auto_8973 ?auto_8964 ) ) ( not ( = ?auto_8973 ?auto_8968 ) ) ( not ( = ?auto_8973 ?auto_8952 ) ) ( not ( = ?auto_8973 ?auto_8970 ) ) ( not ( = ?auto_8973 ?auto_8969 ) ) ( not ( = ?auto_8973 ?auto_8958 ) ) ( not ( = ?auto_8934 ?auto_8945 ) ) ( not ( = ?auto_8934 ?auto_8948 ) ) ( not ( = ?auto_8935 ?auto_8945 ) ) ( not ( = ?auto_8935 ?auto_8948 ) ) ( not ( = ?auto_8936 ?auto_8945 ) ) ( not ( = ?auto_8936 ?auto_8948 ) ) ( not ( = ?auto_8937 ?auto_8945 ) ) ( not ( = ?auto_8937 ?auto_8948 ) ) ( not ( = ?auto_8938 ?auto_8945 ) ) ( not ( = ?auto_8938 ?auto_8948 ) ) ( not ( = ?auto_8939 ?auto_8945 ) ) ( not ( = ?auto_8939 ?auto_8948 ) ) ( not ( = ?auto_8940 ?auto_8945 ) ) ( not ( = ?auto_8940 ?auto_8948 ) ) ( not ( = ?auto_8941 ?auto_8945 ) ) ( not ( = ?auto_8941 ?auto_8948 ) ) ( not ( = ?auto_8942 ?auto_8945 ) ) ( not ( = ?auto_8942 ?auto_8948 ) ) ( not ( = ?auto_8943 ?auto_8945 ) ) ( not ( = ?auto_8943 ?auto_8948 ) ) ( not ( = ?auto_8945 ?auto_8973 ) ) ( not ( = ?auto_8945 ?auto_8953 ) ) ( not ( = ?auto_8945 ?auto_8956 ) ) ( not ( = ?auto_8945 ?auto_8954 ) ) ( not ( = ?auto_8945 ?auto_8964 ) ) ( not ( = ?auto_8945 ?auto_8968 ) ) ( not ( = ?auto_8945 ?auto_8952 ) ) ( not ( = ?auto_8945 ?auto_8970 ) ) ( not ( = ?auto_8945 ?auto_8969 ) ) ( not ( = ?auto_8945 ?auto_8958 ) ) ( not ( = ?auto_8948 ?auto_8973 ) ) ( not ( = ?auto_8948 ?auto_8953 ) ) ( not ( = ?auto_8948 ?auto_8956 ) ) ( not ( = ?auto_8948 ?auto_8954 ) ) ( not ( = ?auto_8948 ?auto_8964 ) ) ( not ( = ?auto_8948 ?auto_8968 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8948 ?auto_8970 ) ) ( not ( = ?auto_8948 ?auto_8969 ) ) ( not ( = ?auto_8948 ?auto_8958 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_8934 ?auto_8935 ?auto_8936 ?auto_8937 ?auto_8938 ?auto_8939 ?auto_8940 ?auto_8941 ?auto_8942 ?auto_8943 ?auto_8944 )
      ( MAKE-1CRATE ?auto_8944 ?auto_8945 )
      ( MAKE-11CRATE-VERIFY ?auto_8934 ?auto_8935 ?auto_8936 ?auto_8937 ?auto_8938 ?auto_8939 ?auto_8940 ?auto_8941 ?auto_8942 ?auto_8943 ?auto_8944 ?auto_8945 ) )
  )

)

