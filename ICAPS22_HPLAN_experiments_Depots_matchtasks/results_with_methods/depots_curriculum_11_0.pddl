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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8545 - SURFACE
      ?auto_8546 - SURFACE
    )
    :vars
    (
      ?auto_8547 - HOIST
      ?auto_8548 - PLACE
      ?auto_8550 - PLACE
      ?auto_8551 - HOIST
      ?auto_8552 - SURFACE
      ?auto_8549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8547 ?auto_8548 ) ( SURFACE-AT ?auto_8545 ?auto_8548 ) ( CLEAR ?auto_8545 ) ( IS-CRATE ?auto_8546 ) ( AVAILABLE ?auto_8547 ) ( not ( = ?auto_8550 ?auto_8548 ) ) ( HOIST-AT ?auto_8551 ?auto_8550 ) ( AVAILABLE ?auto_8551 ) ( SURFACE-AT ?auto_8546 ?auto_8550 ) ( ON ?auto_8546 ?auto_8552 ) ( CLEAR ?auto_8546 ) ( TRUCK-AT ?auto_8549 ?auto_8548 ) ( not ( = ?auto_8545 ?auto_8546 ) ) ( not ( = ?auto_8545 ?auto_8552 ) ) ( not ( = ?auto_8546 ?auto_8552 ) ) ( not ( = ?auto_8547 ?auto_8551 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8549 ?auto_8548 ?auto_8550 )
      ( !LIFT ?auto_8551 ?auto_8546 ?auto_8552 ?auto_8550 )
      ( !LOAD ?auto_8551 ?auto_8546 ?auto_8549 ?auto_8550 )
      ( !DRIVE ?auto_8549 ?auto_8550 ?auto_8548 )
      ( !UNLOAD ?auto_8547 ?auto_8546 ?auto_8549 ?auto_8548 )
      ( !DROP ?auto_8547 ?auto_8546 ?auto_8545 ?auto_8548 )
      ( MAKE-1CRATE-VERIFY ?auto_8545 ?auto_8546 ) )
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
      ?auto_8559 - PLACE
      ?auto_8564 - PLACE
      ?auto_8563 - HOIST
      ?auto_8560 - SURFACE
      ?auto_8565 - SURFACE
      ?auto_8562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8561 ?auto_8559 ) ( IS-CRATE ?auto_8558 ) ( not ( = ?auto_8564 ?auto_8559 ) ) ( HOIST-AT ?auto_8563 ?auto_8564 ) ( SURFACE-AT ?auto_8558 ?auto_8564 ) ( ON ?auto_8558 ?auto_8560 ) ( CLEAR ?auto_8558 ) ( not ( = ?auto_8557 ?auto_8558 ) ) ( not ( = ?auto_8557 ?auto_8560 ) ) ( not ( = ?auto_8558 ?auto_8560 ) ) ( not ( = ?auto_8561 ?auto_8563 ) ) ( SURFACE-AT ?auto_8556 ?auto_8559 ) ( CLEAR ?auto_8556 ) ( IS-CRATE ?auto_8557 ) ( AVAILABLE ?auto_8561 ) ( AVAILABLE ?auto_8563 ) ( SURFACE-AT ?auto_8557 ?auto_8564 ) ( ON ?auto_8557 ?auto_8565 ) ( CLEAR ?auto_8557 ) ( TRUCK-AT ?auto_8562 ?auto_8559 ) ( not ( = ?auto_8556 ?auto_8557 ) ) ( not ( = ?auto_8556 ?auto_8565 ) ) ( not ( = ?auto_8557 ?auto_8565 ) ) ( not ( = ?auto_8556 ?auto_8558 ) ) ( not ( = ?auto_8556 ?auto_8560 ) ) ( not ( = ?auto_8558 ?auto_8565 ) ) ( not ( = ?auto_8560 ?auto_8565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8556 ?auto_8557 )
      ( MAKE-1CRATE ?auto_8557 ?auto_8558 )
      ( MAKE-2CRATE-VERIFY ?auto_8556 ?auto_8557 ?auto_8558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8568 - SURFACE
      ?auto_8569 - SURFACE
    )
    :vars
    (
      ?auto_8570 - HOIST
      ?auto_8571 - PLACE
      ?auto_8573 - PLACE
      ?auto_8574 - HOIST
      ?auto_8575 - SURFACE
      ?auto_8572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8570 ?auto_8571 ) ( SURFACE-AT ?auto_8568 ?auto_8571 ) ( CLEAR ?auto_8568 ) ( IS-CRATE ?auto_8569 ) ( AVAILABLE ?auto_8570 ) ( not ( = ?auto_8573 ?auto_8571 ) ) ( HOIST-AT ?auto_8574 ?auto_8573 ) ( AVAILABLE ?auto_8574 ) ( SURFACE-AT ?auto_8569 ?auto_8573 ) ( ON ?auto_8569 ?auto_8575 ) ( CLEAR ?auto_8569 ) ( TRUCK-AT ?auto_8572 ?auto_8571 ) ( not ( = ?auto_8568 ?auto_8569 ) ) ( not ( = ?auto_8568 ?auto_8575 ) ) ( not ( = ?auto_8569 ?auto_8575 ) ) ( not ( = ?auto_8570 ?auto_8574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8572 ?auto_8571 ?auto_8573 )
      ( !LIFT ?auto_8574 ?auto_8569 ?auto_8575 ?auto_8573 )
      ( !LOAD ?auto_8574 ?auto_8569 ?auto_8572 ?auto_8573 )
      ( !DRIVE ?auto_8572 ?auto_8573 ?auto_8571 )
      ( !UNLOAD ?auto_8570 ?auto_8569 ?auto_8572 ?auto_8571 )
      ( !DROP ?auto_8570 ?auto_8569 ?auto_8568 ?auto_8571 )
      ( MAKE-1CRATE-VERIFY ?auto_8568 ?auto_8569 ) )
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
      ?auto_8587 - HOIST
      ?auto_8588 - PLACE
      ?auto_8589 - PLACE
      ?auto_8585 - HOIST
      ?auto_8584 - SURFACE
      ?auto_8593 - PLACE
      ?auto_8592 - HOIST
      ?auto_8591 - SURFACE
      ?auto_8590 - SURFACE
      ?auto_8586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8587 ?auto_8588 ) ( IS-CRATE ?auto_8583 ) ( not ( = ?auto_8589 ?auto_8588 ) ) ( HOIST-AT ?auto_8585 ?auto_8589 ) ( AVAILABLE ?auto_8585 ) ( SURFACE-AT ?auto_8583 ?auto_8589 ) ( ON ?auto_8583 ?auto_8584 ) ( CLEAR ?auto_8583 ) ( not ( = ?auto_8582 ?auto_8583 ) ) ( not ( = ?auto_8582 ?auto_8584 ) ) ( not ( = ?auto_8583 ?auto_8584 ) ) ( not ( = ?auto_8587 ?auto_8585 ) ) ( IS-CRATE ?auto_8582 ) ( not ( = ?auto_8593 ?auto_8588 ) ) ( HOIST-AT ?auto_8592 ?auto_8593 ) ( SURFACE-AT ?auto_8582 ?auto_8593 ) ( ON ?auto_8582 ?auto_8591 ) ( CLEAR ?auto_8582 ) ( not ( = ?auto_8581 ?auto_8582 ) ) ( not ( = ?auto_8581 ?auto_8591 ) ) ( not ( = ?auto_8582 ?auto_8591 ) ) ( not ( = ?auto_8587 ?auto_8592 ) ) ( SURFACE-AT ?auto_8580 ?auto_8588 ) ( CLEAR ?auto_8580 ) ( IS-CRATE ?auto_8581 ) ( AVAILABLE ?auto_8587 ) ( AVAILABLE ?auto_8592 ) ( SURFACE-AT ?auto_8581 ?auto_8593 ) ( ON ?auto_8581 ?auto_8590 ) ( CLEAR ?auto_8581 ) ( TRUCK-AT ?auto_8586 ?auto_8588 ) ( not ( = ?auto_8580 ?auto_8581 ) ) ( not ( = ?auto_8580 ?auto_8590 ) ) ( not ( = ?auto_8581 ?auto_8590 ) ) ( not ( = ?auto_8580 ?auto_8582 ) ) ( not ( = ?auto_8580 ?auto_8591 ) ) ( not ( = ?auto_8582 ?auto_8590 ) ) ( not ( = ?auto_8591 ?auto_8590 ) ) ( not ( = ?auto_8580 ?auto_8583 ) ) ( not ( = ?auto_8580 ?auto_8584 ) ) ( not ( = ?auto_8581 ?auto_8583 ) ) ( not ( = ?auto_8581 ?auto_8584 ) ) ( not ( = ?auto_8583 ?auto_8591 ) ) ( not ( = ?auto_8583 ?auto_8590 ) ) ( not ( = ?auto_8589 ?auto_8593 ) ) ( not ( = ?auto_8585 ?auto_8592 ) ) ( not ( = ?auto_8584 ?auto_8591 ) ) ( not ( = ?auto_8584 ?auto_8590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8580 ?auto_8581 ?auto_8582 )
      ( MAKE-1CRATE ?auto_8582 ?auto_8583 )
      ( MAKE-3CRATE-VERIFY ?auto_8580 ?auto_8581 ?auto_8582 ?auto_8583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8596 - SURFACE
      ?auto_8597 - SURFACE
    )
    :vars
    (
      ?auto_8598 - HOIST
      ?auto_8599 - PLACE
      ?auto_8601 - PLACE
      ?auto_8602 - HOIST
      ?auto_8603 - SURFACE
      ?auto_8600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8598 ?auto_8599 ) ( SURFACE-AT ?auto_8596 ?auto_8599 ) ( CLEAR ?auto_8596 ) ( IS-CRATE ?auto_8597 ) ( AVAILABLE ?auto_8598 ) ( not ( = ?auto_8601 ?auto_8599 ) ) ( HOIST-AT ?auto_8602 ?auto_8601 ) ( AVAILABLE ?auto_8602 ) ( SURFACE-AT ?auto_8597 ?auto_8601 ) ( ON ?auto_8597 ?auto_8603 ) ( CLEAR ?auto_8597 ) ( TRUCK-AT ?auto_8600 ?auto_8599 ) ( not ( = ?auto_8596 ?auto_8597 ) ) ( not ( = ?auto_8596 ?auto_8603 ) ) ( not ( = ?auto_8597 ?auto_8603 ) ) ( not ( = ?auto_8598 ?auto_8602 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8600 ?auto_8599 ?auto_8601 )
      ( !LIFT ?auto_8602 ?auto_8597 ?auto_8603 ?auto_8601 )
      ( !LOAD ?auto_8602 ?auto_8597 ?auto_8600 ?auto_8601 )
      ( !DRIVE ?auto_8600 ?auto_8601 ?auto_8599 )
      ( !UNLOAD ?auto_8598 ?auto_8597 ?auto_8600 ?auto_8599 )
      ( !DROP ?auto_8598 ?auto_8597 ?auto_8596 ?auto_8599 )
      ( MAKE-1CRATE-VERIFY ?auto_8596 ?auto_8597 ) )
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
      ?auto_8618 - HOIST
      ?auto_8619 - PLACE
      ?auto_8617 - PLACE
      ?auto_8616 - HOIST
      ?auto_8614 - SURFACE
      ?auto_8625 - PLACE
      ?auto_8620 - HOIST
      ?auto_8626 - SURFACE
      ?auto_8623 - PLACE
      ?auto_8621 - HOIST
      ?auto_8622 - SURFACE
      ?auto_8624 - SURFACE
      ?auto_8615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8618 ?auto_8619 ) ( IS-CRATE ?auto_8613 ) ( not ( = ?auto_8617 ?auto_8619 ) ) ( HOIST-AT ?auto_8616 ?auto_8617 ) ( AVAILABLE ?auto_8616 ) ( SURFACE-AT ?auto_8613 ?auto_8617 ) ( ON ?auto_8613 ?auto_8614 ) ( CLEAR ?auto_8613 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( not ( = ?auto_8618 ?auto_8616 ) ) ( IS-CRATE ?auto_8612 ) ( not ( = ?auto_8625 ?auto_8619 ) ) ( HOIST-AT ?auto_8620 ?auto_8625 ) ( AVAILABLE ?auto_8620 ) ( SURFACE-AT ?auto_8612 ?auto_8625 ) ( ON ?auto_8612 ?auto_8626 ) ( CLEAR ?auto_8612 ) ( not ( = ?auto_8611 ?auto_8612 ) ) ( not ( = ?auto_8611 ?auto_8626 ) ) ( not ( = ?auto_8612 ?auto_8626 ) ) ( not ( = ?auto_8618 ?auto_8620 ) ) ( IS-CRATE ?auto_8611 ) ( not ( = ?auto_8623 ?auto_8619 ) ) ( HOIST-AT ?auto_8621 ?auto_8623 ) ( SURFACE-AT ?auto_8611 ?auto_8623 ) ( ON ?auto_8611 ?auto_8622 ) ( CLEAR ?auto_8611 ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8622 ) ) ( not ( = ?auto_8611 ?auto_8622 ) ) ( not ( = ?auto_8618 ?auto_8621 ) ) ( SURFACE-AT ?auto_8609 ?auto_8619 ) ( CLEAR ?auto_8609 ) ( IS-CRATE ?auto_8610 ) ( AVAILABLE ?auto_8618 ) ( AVAILABLE ?auto_8621 ) ( SURFACE-AT ?auto_8610 ?auto_8623 ) ( ON ?auto_8610 ?auto_8624 ) ( CLEAR ?auto_8610 ) ( TRUCK-AT ?auto_8615 ?auto_8619 ) ( not ( = ?auto_8609 ?auto_8610 ) ) ( not ( = ?auto_8609 ?auto_8624 ) ) ( not ( = ?auto_8610 ?auto_8624 ) ) ( not ( = ?auto_8609 ?auto_8611 ) ) ( not ( = ?auto_8609 ?auto_8622 ) ) ( not ( = ?auto_8611 ?auto_8624 ) ) ( not ( = ?auto_8622 ?auto_8624 ) ) ( not ( = ?auto_8609 ?auto_8612 ) ) ( not ( = ?auto_8609 ?auto_8626 ) ) ( not ( = ?auto_8610 ?auto_8612 ) ) ( not ( = ?auto_8610 ?auto_8626 ) ) ( not ( = ?auto_8612 ?auto_8622 ) ) ( not ( = ?auto_8612 ?auto_8624 ) ) ( not ( = ?auto_8625 ?auto_8623 ) ) ( not ( = ?auto_8620 ?auto_8621 ) ) ( not ( = ?auto_8626 ?auto_8622 ) ) ( not ( = ?auto_8626 ?auto_8624 ) ) ( not ( = ?auto_8609 ?auto_8613 ) ) ( not ( = ?auto_8609 ?auto_8614 ) ) ( not ( = ?auto_8610 ?auto_8613 ) ) ( not ( = ?auto_8610 ?auto_8614 ) ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8611 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8626 ) ) ( not ( = ?auto_8613 ?auto_8622 ) ) ( not ( = ?auto_8613 ?auto_8624 ) ) ( not ( = ?auto_8617 ?auto_8625 ) ) ( not ( = ?auto_8617 ?auto_8623 ) ) ( not ( = ?auto_8616 ?auto_8620 ) ) ( not ( = ?auto_8616 ?auto_8621 ) ) ( not ( = ?auto_8614 ?auto_8626 ) ) ( not ( = ?auto_8614 ?auto_8622 ) ) ( not ( = ?auto_8614 ?auto_8624 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8609 ?auto_8610 ?auto_8611 ?auto_8612 )
      ( MAKE-1CRATE ?auto_8612 ?auto_8613 )
      ( MAKE-4CRATE-VERIFY ?auto_8609 ?auto_8610 ?auto_8611 ?auto_8612 ?auto_8613 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8629 - SURFACE
      ?auto_8630 - SURFACE
    )
    :vars
    (
      ?auto_8631 - HOIST
      ?auto_8632 - PLACE
      ?auto_8634 - PLACE
      ?auto_8635 - HOIST
      ?auto_8636 - SURFACE
      ?auto_8633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8631 ?auto_8632 ) ( SURFACE-AT ?auto_8629 ?auto_8632 ) ( CLEAR ?auto_8629 ) ( IS-CRATE ?auto_8630 ) ( AVAILABLE ?auto_8631 ) ( not ( = ?auto_8634 ?auto_8632 ) ) ( HOIST-AT ?auto_8635 ?auto_8634 ) ( AVAILABLE ?auto_8635 ) ( SURFACE-AT ?auto_8630 ?auto_8634 ) ( ON ?auto_8630 ?auto_8636 ) ( CLEAR ?auto_8630 ) ( TRUCK-AT ?auto_8633 ?auto_8632 ) ( not ( = ?auto_8629 ?auto_8630 ) ) ( not ( = ?auto_8629 ?auto_8636 ) ) ( not ( = ?auto_8630 ?auto_8636 ) ) ( not ( = ?auto_8631 ?auto_8635 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8633 ?auto_8632 ?auto_8634 )
      ( !LIFT ?auto_8635 ?auto_8630 ?auto_8636 ?auto_8634 )
      ( !LOAD ?auto_8635 ?auto_8630 ?auto_8633 ?auto_8634 )
      ( !DRIVE ?auto_8633 ?auto_8634 ?auto_8632 )
      ( !UNLOAD ?auto_8631 ?auto_8630 ?auto_8633 ?auto_8632 )
      ( !DROP ?auto_8631 ?auto_8630 ?auto_8629 ?auto_8632 )
      ( MAKE-1CRATE-VERIFY ?auto_8629 ?auto_8630 ) )
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
      ?auto_8653 - HOIST
      ?auto_8649 - PLACE
      ?auto_8652 - PLACE
      ?auto_8651 - HOIST
      ?auto_8650 - SURFACE
      ?auto_8661 - SURFACE
      ?auto_8657 - PLACE
      ?auto_8656 - HOIST
      ?auto_8658 - SURFACE
      ?auto_8659 - PLACE
      ?auto_8662 - HOIST
      ?auto_8655 - SURFACE
      ?auto_8660 - SURFACE
      ?auto_8654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8653 ?auto_8649 ) ( IS-CRATE ?auto_8648 ) ( not ( = ?auto_8652 ?auto_8649 ) ) ( HOIST-AT ?auto_8651 ?auto_8652 ) ( SURFACE-AT ?auto_8648 ?auto_8652 ) ( ON ?auto_8648 ?auto_8650 ) ( CLEAR ?auto_8648 ) ( not ( = ?auto_8647 ?auto_8648 ) ) ( not ( = ?auto_8647 ?auto_8650 ) ) ( not ( = ?auto_8648 ?auto_8650 ) ) ( not ( = ?auto_8653 ?auto_8651 ) ) ( IS-CRATE ?auto_8647 ) ( AVAILABLE ?auto_8651 ) ( SURFACE-AT ?auto_8647 ?auto_8652 ) ( ON ?auto_8647 ?auto_8661 ) ( CLEAR ?auto_8647 ) ( not ( = ?auto_8646 ?auto_8647 ) ) ( not ( = ?auto_8646 ?auto_8661 ) ) ( not ( = ?auto_8647 ?auto_8661 ) ) ( IS-CRATE ?auto_8646 ) ( not ( = ?auto_8657 ?auto_8649 ) ) ( HOIST-AT ?auto_8656 ?auto_8657 ) ( AVAILABLE ?auto_8656 ) ( SURFACE-AT ?auto_8646 ?auto_8657 ) ( ON ?auto_8646 ?auto_8658 ) ( CLEAR ?auto_8646 ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8645 ?auto_8658 ) ) ( not ( = ?auto_8646 ?auto_8658 ) ) ( not ( = ?auto_8653 ?auto_8656 ) ) ( IS-CRATE ?auto_8645 ) ( not ( = ?auto_8659 ?auto_8649 ) ) ( HOIST-AT ?auto_8662 ?auto_8659 ) ( SURFACE-AT ?auto_8645 ?auto_8659 ) ( ON ?auto_8645 ?auto_8655 ) ( CLEAR ?auto_8645 ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8655 ) ) ( not ( = ?auto_8645 ?auto_8655 ) ) ( not ( = ?auto_8653 ?auto_8662 ) ) ( SURFACE-AT ?auto_8643 ?auto_8649 ) ( CLEAR ?auto_8643 ) ( IS-CRATE ?auto_8644 ) ( AVAILABLE ?auto_8653 ) ( AVAILABLE ?auto_8662 ) ( SURFACE-AT ?auto_8644 ?auto_8659 ) ( ON ?auto_8644 ?auto_8660 ) ( CLEAR ?auto_8644 ) ( TRUCK-AT ?auto_8654 ?auto_8649 ) ( not ( = ?auto_8643 ?auto_8644 ) ) ( not ( = ?auto_8643 ?auto_8660 ) ) ( not ( = ?auto_8644 ?auto_8660 ) ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8643 ?auto_8655 ) ) ( not ( = ?auto_8645 ?auto_8660 ) ) ( not ( = ?auto_8655 ?auto_8660 ) ) ( not ( = ?auto_8643 ?auto_8646 ) ) ( not ( = ?auto_8643 ?auto_8658 ) ) ( not ( = ?auto_8644 ?auto_8646 ) ) ( not ( = ?auto_8644 ?auto_8658 ) ) ( not ( = ?auto_8646 ?auto_8655 ) ) ( not ( = ?auto_8646 ?auto_8660 ) ) ( not ( = ?auto_8657 ?auto_8659 ) ) ( not ( = ?auto_8656 ?auto_8662 ) ) ( not ( = ?auto_8658 ?auto_8655 ) ) ( not ( = ?auto_8658 ?auto_8660 ) ) ( not ( = ?auto_8643 ?auto_8647 ) ) ( not ( = ?auto_8643 ?auto_8661 ) ) ( not ( = ?auto_8644 ?auto_8647 ) ) ( not ( = ?auto_8644 ?auto_8661 ) ) ( not ( = ?auto_8645 ?auto_8647 ) ) ( not ( = ?auto_8645 ?auto_8661 ) ) ( not ( = ?auto_8647 ?auto_8658 ) ) ( not ( = ?auto_8647 ?auto_8655 ) ) ( not ( = ?auto_8647 ?auto_8660 ) ) ( not ( = ?auto_8652 ?auto_8657 ) ) ( not ( = ?auto_8652 ?auto_8659 ) ) ( not ( = ?auto_8651 ?auto_8656 ) ) ( not ( = ?auto_8651 ?auto_8662 ) ) ( not ( = ?auto_8661 ?auto_8658 ) ) ( not ( = ?auto_8661 ?auto_8655 ) ) ( not ( = ?auto_8661 ?auto_8660 ) ) ( not ( = ?auto_8643 ?auto_8648 ) ) ( not ( = ?auto_8643 ?auto_8650 ) ) ( not ( = ?auto_8644 ?auto_8648 ) ) ( not ( = ?auto_8644 ?auto_8650 ) ) ( not ( = ?auto_8645 ?auto_8648 ) ) ( not ( = ?auto_8645 ?auto_8650 ) ) ( not ( = ?auto_8646 ?auto_8648 ) ) ( not ( = ?auto_8646 ?auto_8650 ) ) ( not ( = ?auto_8648 ?auto_8661 ) ) ( not ( = ?auto_8648 ?auto_8658 ) ) ( not ( = ?auto_8648 ?auto_8655 ) ) ( not ( = ?auto_8648 ?auto_8660 ) ) ( not ( = ?auto_8650 ?auto_8661 ) ) ( not ( = ?auto_8650 ?auto_8658 ) ) ( not ( = ?auto_8650 ?auto_8655 ) ) ( not ( = ?auto_8650 ?auto_8660 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8643 ?auto_8644 ?auto_8645 ?auto_8646 ?auto_8647 )
      ( MAKE-1CRATE ?auto_8647 ?auto_8648 )
      ( MAKE-5CRATE-VERIFY ?auto_8643 ?auto_8644 ?auto_8645 ?auto_8646 ?auto_8647 ?auto_8648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8665 - SURFACE
      ?auto_8666 - SURFACE
    )
    :vars
    (
      ?auto_8667 - HOIST
      ?auto_8668 - PLACE
      ?auto_8670 - PLACE
      ?auto_8671 - HOIST
      ?auto_8672 - SURFACE
      ?auto_8669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8667 ?auto_8668 ) ( SURFACE-AT ?auto_8665 ?auto_8668 ) ( CLEAR ?auto_8665 ) ( IS-CRATE ?auto_8666 ) ( AVAILABLE ?auto_8667 ) ( not ( = ?auto_8670 ?auto_8668 ) ) ( HOIST-AT ?auto_8671 ?auto_8670 ) ( AVAILABLE ?auto_8671 ) ( SURFACE-AT ?auto_8666 ?auto_8670 ) ( ON ?auto_8666 ?auto_8672 ) ( CLEAR ?auto_8666 ) ( TRUCK-AT ?auto_8669 ?auto_8668 ) ( not ( = ?auto_8665 ?auto_8666 ) ) ( not ( = ?auto_8665 ?auto_8672 ) ) ( not ( = ?auto_8666 ?auto_8672 ) ) ( not ( = ?auto_8667 ?auto_8671 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8669 ?auto_8668 ?auto_8670 )
      ( !LIFT ?auto_8671 ?auto_8666 ?auto_8672 ?auto_8670 )
      ( !LOAD ?auto_8671 ?auto_8666 ?auto_8669 ?auto_8670 )
      ( !DRIVE ?auto_8669 ?auto_8670 ?auto_8668 )
      ( !UNLOAD ?auto_8667 ?auto_8666 ?auto_8669 ?auto_8668 )
      ( !DROP ?auto_8667 ?auto_8666 ?auto_8665 ?auto_8668 )
      ( MAKE-1CRATE-VERIFY ?auto_8665 ?auto_8666 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8680 - SURFACE
      ?auto_8681 - SURFACE
      ?auto_8682 - SURFACE
      ?auto_8683 - SURFACE
      ?auto_8684 - SURFACE
      ?auto_8686 - SURFACE
      ?auto_8685 - SURFACE
    )
    :vars
    (
      ?auto_8692 - HOIST
      ?auto_8691 - PLACE
      ?auto_8690 - PLACE
      ?auto_8687 - HOIST
      ?auto_8689 - SURFACE
      ?auto_8703 - PLACE
      ?auto_8698 - HOIST
      ?auto_8695 - SURFACE
      ?auto_8702 - SURFACE
      ?auto_8693 - PLACE
      ?auto_8697 - HOIST
      ?auto_8694 - SURFACE
      ?auto_8700 - PLACE
      ?auto_8699 - HOIST
      ?auto_8696 - SURFACE
      ?auto_8701 - SURFACE
      ?auto_8688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8692 ?auto_8691 ) ( IS-CRATE ?auto_8685 ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( HOIST-AT ?auto_8687 ?auto_8690 ) ( AVAILABLE ?auto_8687 ) ( SURFACE-AT ?auto_8685 ?auto_8690 ) ( ON ?auto_8685 ?auto_8689 ) ( CLEAR ?auto_8685 ) ( not ( = ?auto_8686 ?auto_8685 ) ) ( not ( = ?auto_8686 ?auto_8689 ) ) ( not ( = ?auto_8685 ?auto_8689 ) ) ( not ( = ?auto_8692 ?auto_8687 ) ) ( IS-CRATE ?auto_8686 ) ( not ( = ?auto_8703 ?auto_8691 ) ) ( HOIST-AT ?auto_8698 ?auto_8703 ) ( SURFACE-AT ?auto_8686 ?auto_8703 ) ( ON ?auto_8686 ?auto_8695 ) ( CLEAR ?auto_8686 ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8684 ?auto_8695 ) ) ( not ( = ?auto_8686 ?auto_8695 ) ) ( not ( = ?auto_8692 ?auto_8698 ) ) ( IS-CRATE ?auto_8684 ) ( AVAILABLE ?auto_8698 ) ( SURFACE-AT ?auto_8684 ?auto_8703 ) ( ON ?auto_8684 ?auto_8702 ) ( CLEAR ?auto_8684 ) ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8702 ) ) ( not ( = ?auto_8684 ?auto_8702 ) ) ( IS-CRATE ?auto_8683 ) ( not ( = ?auto_8693 ?auto_8691 ) ) ( HOIST-AT ?auto_8697 ?auto_8693 ) ( AVAILABLE ?auto_8697 ) ( SURFACE-AT ?auto_8683 ?auto_8693 ) ( ON ?auto_8683 ?auto_8694 ) ( CLEAR ?auto_8683 ) ( not ( = ?auto_8682 ?auto_8683 ) ) ( not ( = ?auto_8682 ?auto_8694 ) ) ( not ( = ?auto_8683 ?auto_8694 ) ) ( not ( = ?auto_8692 ?auto_8697 ) ) ( IS-CRATE ?auto_8682 ) ( not ( = ?auto_8700 ?auto_8691 ) ) ( HOIST-AT ?auto_8699 ?auto_8700 ) ( SURFACE-AT ?auto_8682 ?auto_8700 ) ( ON ?auto_8682 ?auto_8696 ) ( CLEAR ?auto_8682 ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8696 ) ) ( not ( = ?auto_8682 ?auto_8696 ) ) ( not ( = ?auto_8692 ?auto_8699 ) ) ( SURFACE-AT ?auto_8680 ?auto_8691 ) ( CLEAR ?auto_8680 ) ( IS-CRATE ?auto_8681 ) ( AVAILABLE ?auto_8692 ) ( AVAILABLE ?auto_8699 ) ( SURFACE-AT ?auto_8681 ?auto_8700 ) ( ON ?auto_8681 ?auto_8701 ) ( CLEAR ?auto_8681 ) ( TRUCK-AT ?auto_8688 ?auto_8691 ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8701 ) ) ( not ( = ?auto_8681 ?auto_8701 ) ) ( not ( = ?auto_8680 ?auto_8682 ) ) ( not ( = ?auto_8680 ?auto_8696 ) ) ( not ( = ?auto_8682 ?auto_8701 ) ) ( not ( = ?auto_8696 ?auto_8701 ) ) ( not ( = ?auto_8680 ?auto_8683 ) ) ( not ( = ?auto_8680 ?auto_8694 ) ) ( not ( = ?auto_8681 ?auto_8683 ) ) ( not ( = ?auto_8681 ?auto_8694 ) ) ( not ( = ?auto_8683 ?auto_8696 ) ) ( not ( = ?auto_8683 ?auto_8701 ) ) ( not ( = ?auto_8693 ?auto_8700 ) ) ( not ( = ?auto_8697 ?auto_8699 ) ) ( not ( = ?auto_8694 ?auto_8696 ) ) ( not ( = ?auto_8694 ?auto_8701 ) ) ( not ( = ?auto_8680 ?auto_8684 ) ) ( not ( = ?auto_8680 ?auto_8702 ) ) ( not ( = ?auto_8681 ?auto_8684 ) ) ( not ( = ?auto_8681 ?auto_8702 ) ) ( not ( = ?auto_8682 ?auto_8684 ) ) ( not ( = ?auto_8682 ?auto_8702 ) ) ( not ( = ?auto_8684 ?auto_8694 ) ) ( not ( = ?auto_8684 ?auto_8696 ) ) ( not ( = ?auto_8684 ?auto_8701 ) ) ( not ( = ?auto_8703 ?auto_8693 ) ) ( not ( = ?auto_8703 ?auto_8700 ) ) ( not ( = ?auto_8698 ?auto_8697 ) ) ( not ( = ?auto_8698 ?auto_8699 ) ) ( not ( = ?auto_8702 ?auto_8694 ) ) ( not ( = ?auto_8702 ?auto_8696 ) ) ( not ( = ?auto_8702 ?auto_8701 ) ) ( not ( = ?auto_8680 ?auto_8686 ) ) ( not ( = ?auto_8680 ?auto_8695 ) ) ( not ( = ?auto_8681 ?auto_8686 ) ) ( not ( = ?auto_8681 ?auto_8695 ) ) ( not ( = ?auto_8682 ?auto_8686 ) ) ( not ( = ?auto_8682 ?auto_8695 ) ) ( not ( = ?auto_8683 ?auto_8686 ) ) ( not ( = ?auto_8683 ?auto_8695 ) ) ( not ( = ?auto_8686 ?auto_8702 ) ) ( not ( = ?auto_8686 ?auto_8694 ) ) ( not ( = ?auto_8686 ?auto_8696 ) ) ( not ( = ?auto_8686 ?auto_8701 ) ) ( not ( = ?auto_8695 ?auto_8702 ) ) ( not ( = ?auto_8695 ?auto_8694 ) ) ( not ( = ?auto_8695 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8701 ) ) ( not ( = ?auto_8680 ?auto_8685 ) ) ( not ( = ?auto_8680 ?auto_8689 ) ) ( not ( = ?auto_8681 ?auto_8685 ) ) ( not ( = ?auto_8681 ?auto_8689 ) ) ( not ( = ?auto_8682 ?auto_8685 ) ) ( not ( = ?auto_8682 ?auto_8689 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8689 ) ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8689 ) ) ( not ( = ?auto_8685 ?auto_8695 ) ) ( not ( = ?auto_8685 ?auto_8702 ) ) ( not ( = ?auto_8685 ?auto_8694 ) ) ( not ( = ?auto_8685 ?auto_8696 ) ) ( not ( = ?auto_8685 ?auto_8701 ) ) ( not ( = ?auto_8690 ?auto_8703 ) ) ( not ( = ?auto_8690 ?auto_8693 ) ) ( not ( = ?auto_8690 ?auto_8700 ) ) ( not ( = ?auto_8687 ?auto_8698 ) ) ( not ( = ?auto_8687 ?auto_8697 ) ) ( not ( = ?auto_8687 ?auto_8699 ) ) ( not ( = ?auto_8689 ?auto_8695 ) ) ( not ( = ?auto_8689 ?auto_8702 ) ) ( not ( = ?auto_8689 ?auto_8694 ) ) ( not ( = ?auto_8689 ?auto_8696 ) ) ( not ( = ?auto_8689 ?auto_8701 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8680 ?auto_8681 ?auto_8682 ?auto_8683 ?auto_8684 ?auto_8686 )
      ( MAKE-1CRATE ?auto_8686 ?auto_8685 )
      ( MAKE-6CRATE-VERIFY ?auto_8680 ?auto_8681 ?auto_8682 ?auto_8683 ?auto_8684 ?auto_8686 ?auto_8685 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8706 - SURFACE
      ?auto_8707 - SURFACE
    )
    :vars
    (
      ?auto_8708 - HOIST
      ?auto_8709 - PLACE
      ?auto_8711 - PLACE
      ?auto_8712 - HOIST
      ?auto_8713 - SURFACE
      ?auto_8710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8708 ?auto_8709 ) ( SURFACE-AT ?auto_8706 ?auto_8709 ) ( CLEAR ?auto_8706 ) ( IS-CRATE ?auto_8707 ) ( AVAILABLE ?auto_8708 ) ( not ( = ?auto_8711 ?auto_8709 ) ) ( HOIST-AT ?auto_8712 ?auto_8711 ) ( AVAILABLE ?auto_8712 ) ( SURFACE-AT ?auto_8707 ?auto_8711 ) ( ON ?auto_8707 ?auto_8713 ) ( CLEAR ?auto_8707 ) ( TRUCK-AT ?auto_8710 ?auto_8709 ) ( not ( = ?auto_8706 ?auto_8707 ) ) ( not ( = ?auto_8706 ?auto_8713 ) ) ( not ( = ?auto_8707 ?auto_8713 ) ) ( not ( = ?auto_8708 ?auto_8712 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8710 ?auto_8709 ?auto_8711 )
      ( !LIFT ?auto_8712 ?auto_8707 ?auto_8713 ?auto_8711 )
      ( !LOAD ?auto_8712 ?auto_8707 ?auto_8710 ?auto_8711 )
      ( !DRIVE ?auto_8710 ?auto_8711 ?auto_8709 )
      ( !UNLOAD ?auto_8708 ?auto_8707 ?auto_8710 ?auto_8709 )
      ( !DROP ?auto_8708 ?auto_8707 ?auto_8706 ?auto_8709 )
      ( MAKE-1CRATE-VERIFY ?auto_8706 ?auto_8707 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8722 - SURFACE
      ?auto_8723 - SURFACE
      ?auto_8724 - SURFACE
      ?auto_8725 - SURFACE
      ?auto_8726 - SURFACE
      ?auto_8728 - SURFACE
      ?auto_8727 - SURFACE
      ?auto_8729 - SURFACE
    )
    :vars
    (
      ?auto_8730 - HOIST
      ?auto_8734 - PLACE
      ?auto_8735 - PLACE
      ?auto_8733 - HOIST
      ?auto_8731 - SURFACE
      ?auto_8736 - PLACE
      ?auto_8746 - HOIST
      ?auto_8745 - SURFACE
      ?auto_8738 - PLACE
      ?auto_8742 - HOIST
      ?auto_8749 - SURFACE
      ?auto_8739 - SURFACE
      ?auto_8747 - PLACE
      ?auto_8743 - HOIST
      ?auto_8744 - SURFACE
      ?auto_8740 - PLACE
      ?auto_8741 - HOIST
      ?auto_8748 - SURFACE
      ?auto_8737 - SURFACE
      ?auto_8732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8730 ?auto_8734 ) ( IS-CRATE ?auto_8729 ) ( not ( = ?auto_8735 ?auto_8734 ) ) ( HOIST-AT ?auto_8733 ?auto_8735 ) ( AVAILABLE ?auto_8733 ) ( SURFACE-AT ?auto_8729 ?auto_8735 ) ( ON ?auto_8729 ?auto_8731 ) ( CLEAR ?auto_8729 ) ( not ( = ?auto_8727 ?auto_8729 ) ) ( not ( = ?auto_8727 ?auto_8731 ) ) ( not ( = ?auto_8729 ?auto_8731 ) ) ( not ( = ?auto_8730 ?auto_8733 ) ) ( IS-CRATE ?auto_8727 ) ( not ( = ?auto_8736 ?auto_8734 ) ) ( HOIST-AT ?auto_8746 ?auto_8736 ) ( AVAILABLE ?auto_8746 ) ( SURFACE-AT ?auto_8727 ?auto_8736 ) ( ON ?auto_8727 ?auto_8745 ) ( CLEAR ?auto_8727 ) ( not ( = ?auto_8728 ?auto_8727 ) ) ( not ( = ?auto_8728 ?auto_8745 ) ) ( not ( = ?auto_8727 ?auto_8745 ) ) ( not ( = ?auto_8730 ?auto_8746 ) ) ( IS-CRATE ?auto_8728 ) ( not ( = ?auto_8738 ?auto_8734 ) ) ( HOIST-AT ?auto_8742 ?auto_8738 ) ( SURFACE-AT ?auto_8728 ?auto_8738 ) ( ON ?auto_8728 ?auto_8749 ) ( CLEAR ?auto_8728 ) ( not ( = ?auto_8726 ?auto_8728 ) ) ( not ( = ?auto_8726 ?auto_8749 ) ) ( not ( = ?auto_8728 ?auto_8749 ) ) ( not ( = ?auto_8730 ?auto_8742 ) ) ( IS-CRATE ?auto_8726 ) ( AVAILABLE ?auto_8742 ) ( SURFACE-AT ?auto_8726 ?auto_8738 ) ( ON ?auto_8726 ?auto_8739 ) ( CLEAR ?auto_8726 ) ( not ( = ?auto_8725 ?auto_8726 ) ) ( not ( = ?auto_8725 ?auto_8739 ) ) ( not ( = ?auto_8726 ?auto_8739 ) ) ( IS-CRATE ?auto_8725 ) ( not ( = ?auto_8747 ?auto_8734 ) ) ( HOIST-AT ?auto_8743 ?auto_8747 ) ( AVAILABLE ?auto_8743 ) ( SURFACE-AT ?auto_8725 ?auto_8747 ) ( ON ?auto_8725 ?auto_8744 ) ( CLEAR ?auto_8725 ) ( not ( = ?auto_8724 ?auto_8725 ) ) ( not ( = ?auto_8724 ?auto_8744 ) ) ( not ( = ?auto_8725 ?auto_8744 ) ) ( not ( = ?auto_8730 ?auto_8743 ) ) ( IS-CRATE ?auto_8724 ) ( not ( = ?auto_8740 ?auto_8734 ) ) ( HOIST-AT ?auto_8741 ?auto_8740 ) ( SURFACE-AT ?auto_8724 ?auto_8740 ) ( ON ?auto_8724 ?auto_8748 ) ( CLEAR ?auto_8724 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8748 ) ) ( not ( = ?auto_8724 ?auto_8748 ) ) ( not ( = ?auto_8730 ?auto_8741 ) ) ( SURFACE-AT ?auto_8722 ?auto_8734 ) ( CLEAR ?auto_8722 ) ( IS-CRATE ?auto_8723 ) ( AVAILABLE ?auto_8730 ) ( AVAILABLE ?auto_8741 ) ( SURFACE-AT ?auto_8723 ?auto_8740 ) ( ON ?auto_8723 ?auto_8737 ) ( CLEAR ?auto_8723 ) ( TRUCK-AT ?auto_8732 ?auto_8734 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8737 ) ) ( not ( = ?auto_8723 ?auto_8737 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8748 ) ) ( not ( = ?auto_8724 ?auto_8737 ) ) ( not ( = ?auto_8748 ?auto_8737 ) ) ( not ( = ?auto_8722 ?auto_8725 ) ) ( not ( = ?auto_8722 ?auto_8744 ) ) ( not ( = ?auto_8723 ?auto_8725 ) ) ( not ( = ?auto_8723 ?auto_8744 ) ) ( not ( = ?auto_8725 ?auto_8748 ) ) ( not ( = ?auto_8725 ?auto_8737 ) ) ( not ( = ?auto_8747 ?auto_8740 ) ) ( not ( = ?auto_8743 ?auto_8741 ) ) ( not ( = ?auto_8744 ?auto_8748 ) ) ( not ( = ?auto_8744 ?auto_8737 ) ) ( not ( = ?auto_8722 ?auto_8726 ) ) ( not ( = ?auto_8722 ?auto_8739 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) ( not ( = ?auto_8723 ?auto_8739 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8739 ) ) ( not ( = ?auto_8726 ?auto_8744 ) ) ( not ( = ?auto_8726 ?auto_8748 ) ) ( not ( = ?auto_8726 ?auto_8737 ) ) ( not ( = ?auto_8738 ?auto_8747 ) ) ( not ( = ?auto_8738 ?auto_8740 ) ) ( not ( = ?auto_8742 ?auto_8743 ) ) ( not ( = ?auto_8742 ?auto_8741 ) ) ( not ( = ?auto_8739 ?auto_8744 ) ) ( not ( = ?auto_8739 ?auto_8748 ) ) ( not ( = ?auto_8739 ?auto_8737 ) ) ( not ( = ?auto_8722 ?auto_8728 ) ) ( not ( = ?auto_8722 ?auto_8749 ) ) ( not ( = ?auto_8723 ?auto_8728 ) ) ( not ( = ?auto_8723 ?auto_8749 ) ) ( not ( = ?auto_8724 ?auto_8728 ) ) ( not ( = ?auto_8724 ?auto_8749 ) ) ( not ( = ?auto_8725 ?auto_8728 ) ) ( not ( = ?auto_8725 ?auto_8749 ) ) ( not ( = ?auto_8728 ?auto_8739 ) ) ( not ( = ?auto_8728 ?auto_8744 ) ) ( not ( = ?auto_8728 ?auto_8748 ) ) ( not ( = ?auto_8728 ?auto_8737 ) ) ( not ( = ?auto_8749 ?auto_8739 ) ) ( not ( = ?auto_8749 ?auto_8744 ) ) ( not ( = ?auto_8749 ?auto_8748 ) ) ( not ( = ?auto_8749 ?auto_8737 ) ) ( not ( = ?auto_8722 ?auto_8727 ) ) ( not ( = ?auto_8722 ?auto_8745 ) ) ( not ( = ?auto_8723 ?auto_8727 ) ) ( not ( = ?auto_8723 ?auto_8745 ) ) ( not ( = ?auto_8724 ?auto_8727 ) ) ( not ( = ?auto_8724 ?auto_8745 ) ) ( not ( = ?auto_8725 ?auto_8727 ) ) ( not ( = ?auto_8725 ?auto_8745 ) ) ( not ( = ?auto_8726 ?auto_8727 ) ) ( not ( = ?auto_8726 ?auto_8745 ) ) ( not ( = ?auto_8727 ?auto_8749 ) ) ( not ( = ?auto_8727 ?auto_8739 ) ) ( not ( = ?auto_8727 ?auto_8744 ) ) ( not ( = ?auto_8727 ?auto_8748 ) ) ( not ( = ?auto_8727 ?auto_8737 ) ) ( not ( = ?auto_8736 ?auto_8738 ) ) ( not ( = ?auto_8736 ?auto_8747 ) ) ( not ( = ?auto_8736 ?auto_8740 ) ) ( not ( = ?auto_8746 ?auto_8742 ) ) ( not ( = ?auto_8746 ?auto_8743 ) ) ( not ( = ?auto_8746 ?auto_8741 ) ) ( not ( = ?auto_8745 ?auto_8749 ) ) ( not ( = ?auto_8745 ?auto_8739 ) ) ( not ( = ?auto_8745 ?auto_8744 ) ) ( not ( = ?auto_8745 ?auto_8748 ) ) ( not ( = ?auto_8745 ?auto_8737 ) ) ( not ( = ?auto_8722 ?auto_8729 ) ) ( not ( = ?auto_8722 ?auto_8731 ) ) ( not ( = ?auto_8723 ?auto_8729 ) ) ( not ( = ?auto_8723 ?auto_8731 ) ) ( not ( = ?auto_8724 ?auto_8729 ) ) ( not ( = ?auto_8724 ?auto_8731 ) ) ( not ( = ?auto_8725 ?auto_8729 ) ) ( not ( = ?auto_8725 ?auto_8731 ) ) ( not ( = ?auto_8726 ?auto_8729 ) ) ( not ( = ?auto_8726 ?auto_8731 ) ) ( not ( = ?auto_8728 ?auto_8729 ) ) ( not ( = ?auto_8728 ?auto_8731 ) ) ( not ( = ?auto_8729 ?auto_8745 ) ) ( not ( = ?auto_8729 ?auto_8749 ) ) ( not ( = ?auto_8729 ?auto_8739 ) ) ( not ( = ?auto_8729 ?auto_8744 ) ) ( not ( = ?auto_8729 ?auto_8748 ) ) ( not ( = ?auto_8729 ?auto_8737 ) ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8735 ?auto_8738 ) ) ( not ( = ?auto_8735 ?auto_8747 ) ) ( not ( = ?auto_8735 ?auto_8740 ) ) ( not ( = ?auto_8733 ?auto_8746 ) ) ( not ( = ?auto_8733 ?auto_8742 ) ) ( not ( = ?auto_8733 ?auto_8743 ) ) ( not ( = ?auto_8733 ?auto_8741 ) ) ( not ( = ?auto_8731 ?auto_8745 ) ) ( not ( = ?auto_8731 ?auto_8749 ) ) ( not ( = ?auto_8731 ?auto_8739 ) ) ( not ( = ?auto_8731 ?auto_8744 ) ) ( not ( = ?auto_8731 ?auto_8748 ) ) ( not ( = ?auto_8731 ?auto_8737 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8722 ?auto_8723 ?auto_8724 ?auto_8725 ?auto_8726 ?auto_8728 ?auto_8727 )
      ( MAKE-1CRATE ?auto_8727 ?auto_8729 )
      ( MAKE-7CRATE-VERIFY ?auto_8722 ?auto_8723 ?auto_8724 ?auto_8725 ?auto_8726 ?auto_8728 ?auto_8727 ?auto_8729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8752 - SURFACE
      ?auto_8753 - SURFACE
    )
    :vars
    (
      ?auto_8754 - HOIST
      ?auto_8755 - PLACE
      ?auto_8757 - PLACE
      ?auto_8758 - HOIST
      ?auto_8759 - SURFACE
      ?auto_8756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8754 ?auto_8755 ) ( SURFACE-AT ?auto_8752 ?auto_8755 ) ( CLEAR ?auto_8752 ) ( IS-CRATE ?auto_8753 ) ( AVAILABLE ?auto_8754 ) ( not ( = ?auto_8757 ?auto_8755 ) ) ( HOIST-AT ?auto_8758 ?auto_8757 ) ( AVAILABLE ?auto_8758 ) ( SURFACE-AT ?auto_8753 ?auto_8757 ) ( ON ?auto_8753 ?auto_8759 ) ( CLEAR ?auto_8753 ) ( TRUCK-AT ?auto_8756 ?auto_8755 ) ( not ( = ?auto_8752 ?auto_8753 ) ) ( not ( = ?auto_8752 ?auto_8759 ) ) ( not ( = ?auto_8753 ?auto_8759 ) ) ( not ( = ?auto_8754 ?auto_8758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8756 ?auto_8755 ?auto_8757 )
      ( !LIFT ?auto_8758 ?auto_8753 ?auto_8759 ?auto_8757 )
      ( !LOAD ?auto_8758 ?auto_8753 ?auto_8756 ?auto_8757 )
      ( !DRIVE ?auto_8756 ?auto_8757 ?auto_8755 )
      ( !UNLOAD ?auto_8754 ?auto_8753 ?auto_8756 ?auto_8755 )
      ( !DROP ?auto_8754 ?auto_8753 ?auto_8752 ?auto_8755 )
      ( MAKE-1CRATE-VERIFY ?auto_8752 ?auto_8753 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8769 - SURFACE
      ?auto_8770 - SURFACE
      ?auto_8771 - SURFACE
      ?auto_8772 - SURFACE
      ?auto_8773 - SURFACE
      ?auto_8775 - SURFACE
      ?auto_8774 - SURFACE
      ?auto_8777 - SURFACE
      ?auto_8776 - SURFACE
    )
    :vars
    (
      ?auto_8782 - HOIST
      ?auto_8779 - PLACE
      ?auto_8778 - PLACE
      ?auto_8780 - HOIST
      ?auto_8781 - SURFACE
      ?auto_8786 - PLACE
      ?auto_8785 - HOIST
      ?auto_8798 - SURFACE
      ?auto_8789 - SURFACE
      ?auto_8787 - PLACE
      ?auto_8794 - HOIST
      ?auto_8792 - SURFACE
      ?auto_8784 - SURFACE
      ?auto_8790 - PLACE
      ?auto_8793 - HOIST
      ?auto_8788 - SURFACE
      ?auto_8796 - PLACE
      ?auto_8795 - HOIST
      ?auto_8791 - SURFACE
      ?auto_8797 - SURFACE
      ?auto_8783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8782 ?auto_8779 ) ( IS-CRATE ?auto_8776 ) ( not ( = ?auto_8778 ?auto_8779 ) ) ( HOIST-AT ?auto_8780 ?auto_8778 ) ( SURFACE-AT ?auto_8776 ?auto_8778 ) ( ON ?auto_8776 ?auto_8781 ) ( CLEAR ?auto_8776 ) ( not ( = ?auto_8777 ?auto_8776 ) ) ( not ( = ?auto_8777 ?auto_8781 ) ) ( not ( = ?auto_8776 ?auto_8781 ) ) ( not ( = ?auto_8782 ?auto_8780 ) ) ( IS-CRATE ?auto_8777 ) ( not ( = ?auto_8786 ?auto_8779 ) ) ( HOIST-AT ?auto_8785 ?auto_8786 ) ( AVAILABLE ?auto_8785 ) ( SURFACE-AT ?auto_8777 ?auto_8786 ) ( ON ?auto_8777 ?auto_8798 ) ( CLEAR ?auto_8777 ) ( not ( = ?auto_8774 ?auto_8777 ) ) ( not ( = ?auto_8774 ?auto_8798 ) ) ( not ( = ?auto_8777 ?auto_8798 ) ) ( not ( = ?auto_8782 ?auto_8785 ) ) ( IS-CRATE ?auto_8774 ) ( AVAILABLE ?auto_8780 ) ( SURFACE-AT ?auto_8774 ?auto_8778 ) ( ON ?auto_8774 ?auto_8789 ) ( CLEAR ?auto_8774 ) ( not ( = ?auto_8775 ?auto_8774 ) ) ( not ( = ?auto_8775 ?auto_8789 ) ) ( not ( = ?auto_8774 ?auto_8789 ) ) ( IS-CRATE ?auto_8775 ) ( not ( = ?auto_8787 ?auto_8779 ) ) ( HOIST-AT ?auto_8794 ?auto_8787 ) ( SURFACE-AT ?auto_8775 ?auto_8787 ) ( ON ?auto_8775 ?auto_8792 ) ( CLEAR ?auto_8775 ) ( not ( = ?auto_8773 ?auto_8775 ) ) ( not ( = ?auto_8773 ?auto_8792 ) ) ( not ( = ?auto_8775 ?auto_8792 ) ) ( not ( = ?auto_8782 ?auto_8794 ) ) ( IS-CRATE ?auto_8773 ) ( AVAILABLE ?auto_8794 ) ( SURFACE-AT ?auto_8773 ?auto_8787 ) ( ON ?auto_8773 ?auto_8784 ) ( CLEAR ?auto_8773 ) ( not ( = ?auto_8772 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8784 ) ) ( not ( = ?auto_8773 ?auto_8784 ) ) ( IS-CRATE ?auto_8772 ) ( not ( = ?auto_8790 ?auto_8779 ) ) ( HOIST-AT ?auto_8793 ?auto_8790 ) ( AVAILABLE ?auto_8793 ) ( SURFACE-AT ?auto_8772 ?auto_8790 ) ( ON ?auto_8772 ?auto_8788 ) ( CLEAR ?auto_8772 ) ( not ( = ?auto_8771 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8788 ) ) ( not ( = ?auto_8772 ?auto_8788 ) ) ( not ( = ?auto_8782 ?auto_8793 ) ) ( IS-CRATE ?auto_8771 ) ( not ( = ?auto_8796 ?auto_8779 ) ) ( HOIST-AT ?auto_8795 ?auto_8796 ) ( SURFACE-AT ?auto_8771 ?auto_8796 ) ( ON ?auto_8771 ?auto_8791 ) ( CLEAR ?auto_8771 ) ( not ( = ?auto_8770 ?auto_8771 ) ) ( not ( = ?auto_8770 ?auto_8791 ) ) ( not ( = ?auto_8771 ?auto_8791 ) ) ( not ( = ?auto_8782 ?auto_8795 ) ) ( SURFACE-AT ?auto_8769 ?auto_8779 ) ( CLEAR ?auto_8769 ) ( IS-CRATE ?auto_8770 ) ( AVAILABLE ?auto_8782 ) ( AVAILABLE ?auto_8795 ) ( SURFACE-AT ?auto_8770 ?auto_8796 ) ( ON ?auto_8770 ?auto_8797 ) ( CLEAR ?auto_8770 ) ( TRUCK-AT ?auto_8783 ?auto_8779 ) ( not ( = ?auto_8769 ?auto_8770 ) ) ( not ( = ?auto_8769 ?auto_8797 ) ) ( not ( = ?auto_8770 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8771 ) ) ( not ( = ?auto_8769 ?auto_8791 ) ) ( not ( = ?auto_8771 ?auto_8797 ) ) ( not ( = ?auto_8791 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8772 ) ) ( not ( = ?auto_8769 ?auto_8788 ) ) ( not ( = ?auto_8770 ?auto_8772 ) ) ( not ( = ?auto_8770 ?auto_8788 ) ) ( not ( = ?auto_8772 ?auto_8791 ) ) ( not ( = ?auto_8772 ?auto_8797 ) ) ( not ( = ?auto_8790 ?auto_8796 ) ) ( not ( = ?auto_8793 ?auto_8795 ) ) ( not ( = ?auto_8788 ?auto_8791 ) ) ( not ( = ?auto_8788 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8773 ) ) ( not ( = ?auto_8769 ?auto_8784 ) ) ( not ( = ?auto_8770 ?auto_8773 ) ) ( not ( = ?auto_8770 ?auto_8784 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( not ( = ?auto_8771 ?auto_8784 ) ) ( not ( = ?auto_8773 ?auto_8788 ) ) ( not ( = ?auto_8773 ?auto_8791 ) ) ( not ( = ?auto_8773 ?auto_8797 ) ) ( not ( = ?auto_8787 ?auto_8790 ) ) ( not ( = ?auto_8787 ?auto_8796 ) ) ( not ( = ?auto_8794 ?auto_8793 ) ) ( not ( = ?auto_8794 ?auto_8795 ) ) ( not ( = ?auto_8784 ?auto_8788 ) ) ( not ( = ?auto_8784 ?auto_8791 ) ) ( not ( = ?auto_8784 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8775 ) ) ( not ( = ?auto_8769 ?auto_8792 ) ) ( not ( = ?auto_8770 ?auto_8775 ) ) ( not ( = ?auto_8770 ?auto_8792 ) ) ( not ( = ?auto_8771 ?auto_8775 ) ) ( not ( = ?auto_8771 ?auto_8792 ) ) ( not ( = ?auto_8772 ?auto_8775 ) ) ( not ( = ?auto_8772 ?auto_8792 ) ) ( not ( = ?auto_8775 ?auto_8784 ) ) ( not ( = ?auto_8775 ?auto_8788 ) ) ( not ( = ?auto_8775 ?auto_8791 ) ) ( not ( = ?auto_8775 ?auto_8797 ) ) ( not ( = ?auto_8792 ?auto_8784 ) ) ( not ( = ?auto_8792 ?auto_8788 ) ) ( not ( = ?auto_8792 ?auto_8791 ) ) ( not ( = ?auto_8792 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8774 ) ) ( not ( = ?auto_8769 ?auto_8789 ) ) ( not ( = ?auto_8770 ?auto_8774 ) ) ( not ( = ?auto_8770 ?auto_8789 ) ) ( not ( = ?auto_8771 ?auto_8774 ) ) ( not ( = ?auto_8771 ?auto_8789 ) ) ( not ( = ?auto_8772 ?auto_8774 ) ) ( not ( = ?auto_8772 ?auto_8789 ) ) ( not ( = ?auto_8773 ?auto_8774 ) ) ( not ( = ?auto_8773 ?auto_8789 ) ) ( not ( = ?auto_8774 ?auto_8792 ) ) ( not ( = ?auto_8774 ?auto_8784 ) ) ( not ( = ?auto_8774 ?auto_8788 ) ) ( not ( = ?auto_8774 ?auto_8791 ) ) ( not ( = ?auto_8774 ?auto_8797 ) ) ( not ( = ?auto_8778 ?auto_8787 ) ) ( not ( = ?auto_8778 ?auto_8790 ) ) ( not ( = ?auto_8778 ?auto_8796 ) ) ( not ( = ?auto_8780 ?auto_8794 ) ) ( not ( = ?auto_8780 ?auto_8793 ) ) ( not ( = ?auto_8780 ?auto_8795 ) ) ( not ( = ?auto_8789 ?auto_8792 ) ) ( not ( = ?auto_8789 ?auto_8784 ) ) ( not ( = ?auto_8789 ?auto_8788 ) ) ( not ( = ?auto_8789 ?auto_8791 ) ) ( not ( = ?auto_8789 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8777 ) ) ( not ( = ?auto_8769 ?auto_8798 ) ) ( not ( = ?auto_8770 ?auto_8777 ) ) ( not ( = ?auto_8770 ?auto_8798 ) ) ( not ( = ?auto_8771 ?auto_8777 ) ) ( not ( = ?auto_8771 ?auto_8798 ) ) ( not ( = ?auto_8772 ?auto_8777 ) ) ( not ( = ?auto_8772 ?auto_8798 ) ) ( not ( = ?auto_8773 ?auto_8777 ) ) ( not ( = ?auto_8773 ?auto_8798 ) ) ( not ( = ?auto_8775 ?auto_8777 ) ) ( not ( = ?auto_8775 ?auto_8798 ) ) ( not ( = ?auto_8777 ?auto_8789 ) ) ( not ( = ?auto_8777 ?auto_8792 ) ) ( not ( = ?auto_8777 ?auto_8784 ) ) ( not ( = ?auto_8777 ?auto_8788 ) ) ( not ( = ?auto_8777 ?auto_8791 ) ) ( not ( = ?auto_8777 ?auto_8797 ) ) ( not ( = ?auto_8786 ?auto_8778 ) ) ( not ( = ?auto_8786 ?auto_8787 ) ) ( not ( = ?auto_8786 ?auto_8790 ) ) ( not ( = ?auto_8786 ?auto_8796 ) ) ( not ( = ?auto_8785 ?auto_8780 ) ) ( not ( = ?auto_8785 ?auto_8794 ) ) ( not ( = ?auto_8785 ?auto_8793 ) ) ( not ( = ?auto_8785 ?auto_8795 ) ) ( not ( = ?auto_8798 ?auto_8789 ) ) ( not ( = ?auto_8798 ?auto_8792 ) ) ( not ( = ?auto_8798 ?auto_8784 ) ) ( not ( = ?auto_8798 ?auto_8788 ) ) ( not ( = ?auto_8798 ?auto_8791 ) ) ( not ( = ?auto_8798 ?auto_8797 ) ) ( not ( = ?auto_8769 ?auto_8776 ) ) ( not ( = ?auto_8769 ?auto_8781 ) ) ( not ( = ?auto_8770 ?auto_8776 ) ) ( not ( = ?auto_8770 ?auto_8781 ) ) ( not ( = ?auto_8771 ?auto_8776 ) ) ( not ( = ?auto_8771 ?auto_8781 ) ) ( not ( = ?auto_8772 ?auto_8776 ) ) ( not ( = ?auto_8772 ?auto_8781 ) ) ( not ( = ?auto_8773 ?auto_8776 ) ) ( not ( = ?auto_8773 ?auto_8781 ) ) ( not ( = ?auto_8775 ?auto_8776 ) ) ( not ( = ?auto_8775 ?auto_8781 ) ) ( not ( = ?auto_8774 ?auto_8776 ) ) ( not ( = ?auto_8774 ?auto_8781 ) ) ( not ( = ?auto_8776 ?auto_8798 ) ) ( not ( = ?auto_8776 ?auto_8789 ) ) ( not ( = ?auto_8776 ?auto_8792 ) ) ( not ( = ?auto_8776 ?auto_8784 ) ) ( not ( = ?auto_8776 ?auto_8788 ) ) ( not ( = ?auto_8776 ?auto_8791 ) ) ( not ( = ?auto_8776 ?auto_8797 ) ) ( not ( = ?auto_8781 ?auto_8798 ) ) ( not ( = ?auto_8781 ?auto_8789 ) ) ( not ( = ?auto_8781 ?auto_8792 ) ) ( not ( = ?auto_8781 ?auto_8784 ) ) ( not ( = ?auto_8781 ?auto_8788 ) ) ( not ( = ?auto_8781 ?auto_8791 ) ) ( not ( = ?auto_8781 ?auto_8797 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8769 ?auto_8770 ?auto_8771 ?auto_8772 ?auto_8773 ?auto_8775 ?auto_8774 ?auto_8777 )
      ( MAKE-1CRATE ?auto_8777 ?auto_8776 )
      ( MAKE-8CRATE-VERIFY ?auto_8769 ?auto_8770 ?auto_8771 ?auto_8772 ?auto_8773 ?auto_8775 ?auto_8774 ?auto_8777 ?auto_8776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8801 - SURFACE
      ?auto_8802 - SURFACE
    )
    :vars
    (
      ?auto_8803 - HOIST
      ?auto_8804 - PLACE
      ?auto_8806 - PLACE
      ?auto_8807 - HOIST
      ?auto_8808 - SURFACE
      ?auto_8805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8803 ?auto_8804 ) ( SURFACE-AT ?auto_8801 ?auto_8804 ) ( CLEAR ?auto_8801 ) ( IS-CRATE ?auto_8802 ) ( AVAILABLE ?auto_8803 ) ( not ( = ?auto_8806 ?auto_8804 ) ) ( HOIST-AT ?auto_8807 ?auto_8806 ) ( AVAILABLE ?auto_8807 ) ( SURFACE-AT ?auto_8802 ?auto_8806 ) ( ON ?auto_8802 ?auto_8808 ) ( CLEAR ?auto_8802 ) ( TRUCK-AT ?auto_8805 ?auto_8804 ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8801 ?auto_8808 ) ) ( not ( = ?auto_8802 ?auto_8808 ) ) ( not ( = ?auto_8803 ?auto_8807 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8805 ?auto_8804 ?auto_8806 )
      ( !LIFT ?auto_8807 ?auto_8802 ?auto_8808 ?auto_8806 )
      ( !LOAD ?auto_8807 ?auto_8802 ?auto_8805 ?auto_8806 )
      ( !DRIVE ?auto_8805 ?auto_8806 ?auto_8804 )
      ( !UNLOAD ?auto_8803 ?auto_8802 ?auto_8805 ?auto_8804 )
      ( !DROP ?auto_8803 ?auto_8802 ?auto_8801 ?auto_8804 )
      ( MAKE-1CRATE-VERIFY ?auto_8801 ?auto_8802 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8819 - SURFACE
      ?auto_8820 - SURFACE
      ?auto_8821 - SURFACE
      ?auto_8822 - SURFACE
      ?auto_8823 - SURFACE
      ?auto_8826 - SURFACE
      ?auto_8824 - SURFACE
      ?auto_8828 - SURFACE
      ?auto_8827 - SURFACE
      ?auto_8825 - SURFACE
    )
    :vars
    (
      ?auto_8833 - HOIST
      ?auto_8830 - PLACE
      ?auto_8832 - PLACE
      ?auto_8829 - HOIST
      ?auto_8831 - SURFACE
      ?auto_8836 - PLACE
      ?auto_8835 - HOIST
      ?auto_8849 - SURFACE
      ?auto_8852 - PLACE
      ?auto_8850 - HOIST
      ?auto_8851 - SURFACE
      ?auto_8847 - SURFACE
      ?auto_8837 - PLACE
      ?auto_8841 - HOIST
      ?auto_8842 - SURFACE
      ?auto_8843 - SURFACE
      ?auto_8846 - PLACE
      ?auto_8840 - HOIST
      ?auto_8848 - SURFACE
      ?auto_8839 - PLACE
      ?auto_8838 - HOIST
      ?auto_8845 - SURFACE
      ?auto_8844 - SURFACE
      ?auto_8834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8833 ?auto_8830 ) ( IS-CRATE ?auto_8825 ) ( not ( = ?auto_8832 ?auto_8830 ) ) ( HOIST-AT ?auto_8829 ?auto_8832 ) ( AVAILABLE ?auto_8829 ) ( SURFACE-AT ?auto_8825 ?auto_8832 ) ( ON ?auto_8825 ?auto_8831 ) ( CLEAR ?auto_8825 ) ( not ( = ?auto_8827 ?auto_8825 ) ) ( not ( = ?auto_8827 ?auto_8831 ) ) ( not ( = ?auto_8825 ?auto_8831 ) ) ( not ( = ?auto_8833 ?auto_8829 ) ) ( IS-CRATE ?auto_8827 ) ( not ( = ?auto_8836 ?auto_8830 ) ) ( HOIST-AT ?auto_8835 ?auto_8836 ) ( SURFACE-AT ?auto_8827 ?auto_8836 ) ( ON ?auto_8827 ?auto_8849 ) ( CLEAR ?auto_8827 ) ( not ( = ?auto_8828 ?auto_8827 ) ) ( not ( = ?auto_8828 ?auto_8849 ) ) ( not ( = ?auto_8827 ?auto_8849 ) ) ( not ( = ?auto_8833 ?auto_8835 ) ) ( IS-CRATE ?auto_8828 ) ( not ( = ?auto_8852 ?auto_8830 ) ) ( HOIST-AT ?auto_8850 ?auto_8852 ) ( AVAILABLE ?auto_8850 ) ( SURFACE-AT ?auto_8828 ?auto_8852 ) ( ON ?auto_8828 ?auto_8851 ) ( CLEAR ?auto_8828 ) ( not ( = ?auto_8824 ?auto_8828 ) ) ( not ( = ?auto_8824 ?auto_8851 ) ) ( not ( = ?auto_8828 ?auto_8851 ) ) ( not ( = ?auto_8833 ?auto_8850 ) ) ( IS-CRATE ?auto_8824 ) ( AVAILABLE ?auto_8835 ) ( SURFACE-AT ?auto_8824 ?auto_8836 ) ( ON ?auto_8824 ?auto_8847 ) ( CLEAR ?auto_8824 ) ( not ( = ?auto_8826 ?auto_8824 ) ) ( not ( = ?auto_8826 ?auto_8847 ) ) ( not ( = ?auto_8824 ?auto_8847 ) ) ( IS-CRATE ?auto_8826 ) ( not ( = ?auto_8837 ?auto_8830 ) ) ( HOIST-AT ?auto_8841 ?auto_8837 ) ( SURFACE-AT ?auto_8826 ?auto_8837 ) ( ON ?auto_8826 ?auto_8842 ) ( CLEAR ?auto_8826 ) ( not ( = ?auto_8823 ?auto_8826 ) ) ( not ( = ?auto_8823 ?auto_8842 ) ) ( not ( = ?auto_8826 ?auto_8842 ) ) ( not ( = ?auto_8833 ?auto_8841 ) ) ( IS-CRATE ?auto_8823 ) ( AVAILABLE ?auto_8841 ) ( SURFACE-AT ?auto_8823 ?auto_8837 ) ( ON ?auto_8823 ?auto_8843 ) ( CLEAR ?auto_8823 ) ( not ( = ?auto_8822 ?auto_8823 ) ) ( not ( = ?auto_8822 ?auto_8843 ) ) ( not ( = ?auto_8823 ?auto_8843 ) ) ( IS-CRATE ?auto_8822 ) ( not ( = ?auto_8846 ?auto_8830 ) ) ( HOIST-AT ?auto_8840 ?auto_8846 ) ( AVAILABLE ?auto_8840 ) ( SURFACE-AT ?auto_8822 ?auto_8846 ) ( ON ?auto_8822 ?auto_8848 ) ( CLEAR ?auto_8822 ) ( not ( = ?auto_8821 ?auto_8822 ) ) ( not ( = ?auto_8821 ?auto_8848 ) ) ( not ( = ?auto_8822 ?auto_8848 ) ) ( not ( = ?auto_8833 ?auto_8840 ) ) ( IS-CRATE ?auto_8821 ) ( not ( = ?auto_8839 ?auto_8830 ) ) ( HOIST-AT ?auto_8838 ?auto_8839 ) ( SURFACE-AT ?auto_8821 ?auto_8839 ) ( ON ?auto_8821 ?auto_8845 ) ( CLEAR ?auto_8821 ) ( not ( = ?auto_8820 ?auto_8821 ) ) ( not ( = ?auto_8820 ?auto_8845 ) ) ( not ( = ?auto_8821 ?auto_8845 ) ) ( not ( = ?auto_8833 ?auto_8838 ) ) ( SURFACE-AT ?auto_8819 ?auto_8830 ) ( CLEAR ?auto_8819 ) ( IS-CRATE ?auto_8820 ) ( AVAILABLE ?auto_8833 ) ( AVAILABLE ?auto_8838 ) ( SURFACE-AT ?auto_8820 ?auto_8839 ) ( ON ?auto_8820 ?auto_8844 ) ( CLEAR ?auto_8820 ) ( TRUCK-AT ?auto_8834 ?auto_8830 ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8844 ) ) ( not ( = ?auto_8820 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8821 ) ) ( not ( = ?auto_8819 ?auto_8845 ) ) ( not ( = ?auto_8821 ?auto_8844 ) ) ( not ( = ?auto_8845 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8822 ) ) ( not ( = ?auto_8819 ?auto_8848 ) ) ( not ( = ?auto_8820 ?auto_8822 ) ) ( not ( = ?auto_8820 ?auto_8848 ) ) ( not ( = ?auto_8822 ?auto_8845 ) ) ( not ( = ?auto_8822 ?auto_8844 ) ) ( not ( = ?auto_8846 ?auto_8839 ) ) ( not ( = ?auto_8840 ?auto_8838 ) ) ( not ( = ?auto_8848 ?auto_8845 ) ) ( not ( = ?auto_8848 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8823 ) ) ( not ( = ?auto_8819 ?auto_8843 ) ) ( not ( = ?auto_8820 ?auto_8823 ) ) ( not ( = ?auto_8820 ?auto_8843 ) ) ( not ( = ?auto_8821 ?auto_8823 ) ) ( not ( = ?auto_8821 ?auto_8843 ) ) ( not ( = ?auto_8823 ?auto_8848 ) ) ( not ( = ?auto_8823 ?auto_8845 ) ) ( not ( = ?auto_8823 ?auto_8844 ) ) ( not ( = ?auto_8837 ?auto_8846 ) ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( not ( = ?auto_8841 ?auto_8840 ) ) ( not ( = ?auto_8841 ?auto_8838 ) ) ( not ( = ?auto_8843 ?auto_8848 ) ) ( not ( = ?auto_8843 ?auto_8845 ) ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8826 ) ) ( not ( = ?auto_8819 ?auto_8842 ) ) ( not ( = ?auto_8820 ?auto_8826 ) ) ( not ( = ?auto_8820 ?auto_8842 ) ) ( not ( = ?auto_8821 ?auto_8826 ) ) ( not ( = ?auto_8821 ?auto_8842 ) ) ( not ( = ?auto_8822 ?auto_8826 ) ) ( not ( = ?auto_8822 ?auto_8842 ) ) ( not ( = ?auto_8826 ?auto_8843 ) ) ( not ( = ?auto_8826 ?auto_8848 ) ) ( not ( = ?auto_8826 ?auto_8845 ) ) ( not ( = ?auto_8826 ?auto_8844 ) ) ( not ( = ?auto_8842 ?auto_8843 ) ) ( not ( = ?auto_8842 ?auto_8848 ) ) ( not ( = ?auto_8842 ?auto_8845 ) ) ( not ( = ?auto_8842 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8824 ) ) ( not ( = ?auto_8819 ?auto_8847 ) ) ( not ( = ?auto_8820 ?auto_8824 ) ) ( not ( = ?auto_8820 ?auto_8847 ) ) ( not ( = ?auto_8821 ?auto_8824 ) ) ( not ( = ?auto_8821 ?auto_8847 ) ) ( not ( = ?auto_8822 ?auto_8824 ) ) ( not ( = ?auto_8822 ?auto_8847 ) ) ( not ( = ?auto_8823 ?auto_8824 ) ) ( not ( = ?auto_8823 ?auto_8847 ) ) ( not ( = ?auto_8824 ?auto_8842 ) ) ( not ( = ?auto_8824 ?auto_8843 ) ) ( not ( = ?auto_8824 ?auto_8848 ) ) ( not ( = ?auto_8824 ?auto_8845 ) ) ( not ( = ?auto_8824 ?auto_8844 ) ) ( not ( = ?auto_8836 ?auto_8837 ) ) ( not ( = ?auto_8836 ?auto_8846 ) ) ( not ( = ?auto_8836 ?auto_8839 ) ) ( not ( = ?auto_8835 ?auto_8841 ) ) ( not ( = ?auto_8835 ?auto_8840 ) ) ( not ( = ?auto_8835 ?auto_8838 ) ) ( not ( = ?auto_8847 ?auto_8842 ) ) ( not ( = ?auto_8847 ?auto_8843 ) ) ( not ( = ?auto_8847 ?auto_8848 ) ) ( not ( = ?auto_8847 ?auto_8845 ) ) ( not ( = ?auto_8847 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8828 ) ) ( not ( = ?auto_8819 ?auto_8851 ) ) ( not ( = ?auto_8820 ?auto_8828 ) ) ( not ( = ?auto_8820 ?auto_8851 ) ) ( not ( = ?auto_8821 ?auto_8828 ) ) ( not ( = ?auto_8821 ?auto_8851 ) ) ( not ( = ?auto_8822 ?auto_8828 ) ) ( not ( = ?auto_8822 ?auto_8851 ) ) ( not ( = ?auto_8823 ?auto_8828 ) ) ( not ( = ?auto_8823 ?auto_8851 ) ) ( not ( = ?auto_8826 ?auto_8828 ) ) ( not ( = ?auto_8826 ?auto_8851 ) ) ( not ( = ?auto_8828 ?auto_8847 ) ) ( not ( = ?auto_8828 ?auto_8842 ) ) ( not ( = ?auto_8828 ?auto_8843 ) ) ( not ( = ?auto_8828 ?auto_8848 ) ) ( not ( = ?auto_8828 ?auto_8845 ) ) ( not ( = ?auto_8828 ?auto_8844 ) ) ( not ( = ?auto_8852 ?auto_8836 ) ) ( not ( = ?auto_8852 ?auto_8837 ) ) ( not ( = ?auto_8852 ?auto_8846 ) ) ( not ( = ?auto_8852 ?auto_8839 ) ) ( not ( = ?auto_8850 ?auto_8835 ) ) ( not ( = ?auto_8850 ?auto_8841 ) ) ( not ( = ?auto_8850 ?auto_8840 ) ) ( not ( = ?auto_8850 ?auto_8838 ) ) ( not ( = ?auto_8851 ?auto_8847 ) ) ( not ( = ?auto_8851 ?auto_8842 ) ) ( not ( = ?auto_8851 ?auto_8843 ) ) ( not ( = ?auto_8851 ?auto_8848 ) ) ( not ( = ?auto_8851 ?auto_8845 ) ) ( not ( = ?auto_8851 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8827 ) ) ( not ( = ?auto_8819 ?auto_8849 ) ) ( not ( = ?auto_8820 ?auto_8827 ) ) ( not ( = ?auto_8820 ?auto_8849 ) ) ( not ( = ?auto_8821 ?auto_8827 ) ) ( not ( = ?auto_8821 ?auto_8849 ) ) ( not ( = ?auto_8822 ?auto_8827 ) ) ( not ( = ?auto_8822 ?auto_8849 ) ) ( not ( = ?auto_8823 ?auto_8827 ) ) ( not ( = ?auto_8823 ?auto_8849 ) ) ( not ( = ?auto_8826 ?auto_8827 ) ) ( not ( = ?auto_8826 ?auto_8849 ) ) ( not ( = ?auto_8824 ?auto_8827 ) ) ( not ( = ?auto_8824 ?auto_8849 ) ) ( not ( = ?auto_8827 ?auto_8851 ) ) ( not ( = ?auto_8827 ?auto_8847 ) ) ( not ( = ?auto_8827 ?auto_8842 ) ) ( not ( = ?auto_8827 ?auto_8843 ) ) ( not ( = ?auto_8827 ?auto_8848 ) ) ( not ( = ?auto_8827 ?auto_8845 ) ) ( not ( = ?auto_8827 ?auto_8844 ) ) ( not ( = ?auto_8849 ?auto_8851 ) ) ( not ( = ?auto_8849 ?auto_8847 ) ) ( not ( = ?auto_8849 ?auto_8842 ) ) ( not ( = ?auto_8849 ?auto_8843 ) ) ( not ( = ?auto_8849 ?auto_8848 ) ) ( not ( = ?auto_8849 ?auto_8845 ) ) ( not ( = ?auto_8849 ?auto_8844 ) ) ( not ( = ?auto_8819 ?auto_8825 ) ) ( not ( = ?auto_8819 ?auto_8831 ) ) ( not ( = ?auto_8820 ?auto_8825 ) ) ( not ( = ?auto_8820 ?auto_8831 ) ) ( not ( = ?auto_8821 ?auto_8825 ) ) ( not ( = ?auto_8821 ?auto_8831 ) ) ( not ( = ?auto_8822 ?auto_8825 ) ) ( not ( = ?auto_8822 ?auto_8831 ) ) ( not ( = ?auto_8823 ?auto_8825 ) ) ( not ( = ?auto_8823 ?auto_8831 ) ) ( not ( = ?auto_8826 ?auto_8825 ) ) ( not ( = ?auto_8826 ?auto_8831 ) ) ( not ( = ?auto_8824 ?auto_8825 ) ) ( not ( = ?auto_8824 ?auto_8831 ) ) ( not ( = ?auto_8828 ?auto_8825 ) ) ( not ( = ?auto_8828 ?auto_8831 ) ) ( not ( = ?auto_8825 ?auto_8849 ) ) ( not ( = ?auto_8825 ?auto_8851 ) ) ( not ( = ?auto_8825 ?auto_8847 ) ) ( not ( = ?auto_8825 ?auto_8842 ) ) ( not ( = ?auto_8825 ?auto_8843 ) ) ( not ( = ?auto_8825 ?auto_8848 ) ) ( not ( = ?auto_8825 ?auto_8845 ) ) ( not ( = ?auto_8825 ?auto_8844 ) ) ( not ( = ?auto_8832 ?auto_8836 ) ) ( not ( = ?auto_8832 ?auto_8852 ) ) ( not ( = ?auto_8832 ?auto_8837 ) ) ( not ( = ?auto_8832 ?auto_8846 ) ) ( not ( = ?auto_8832 ?auto_8839 ) ) ( not ( = ?auto_8829 ?auto_8835 ) ) ( not ( = ?auto_8829 ?auto_8850 ) ) ( not ( = ?auto_8829 ?auto_8841 ) ) ( not ( = ?auto_8829 ?auto_8840 ) ) ( not ( = ?auto_8829 ?auto_8838 ) ) ( not ( = ?auto_8831 ?auto_8849 ) ) ( not ( = ?auto_8831 ?auto_8851 ) ) ( not ( = ?auto_8831 ?auto_8847 ) ) ( not ( = ?auto_8831 ?auto_8842 ) ) ( not ( = ?auto_8831 ?auto_8843 ) ) ( not ( = ?auto_8831 ?auto_8848 ) ) ( not ( = ?auto_8831 ?auto_8845 ) ) ( not ( = ?auto_8831 ?auto_8844 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8819 ?auto_8820 ?auto_8821 ?auto_8822 ?auto_8823 ?auto_8826 ?auto_8824 ?auto_8828 ?auto_8827 )
      ( MAKE-1CRATE ?auto_8827 ?auto_8825 )
      ( MAKE-9CRATE-VERIFY ?auto_8819 ?auto_8820 ?auto_8821 ?auto_8822 ?auto_8823 ?auto_8826 ?auto_8824 ?auto_8828 ?auto_8827 ?auto_8825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8855 - SURFACE
      ?auto_8856 - SURFACE
    )
    :vars
    (
      ?auto_8857 - HOIST
      ?auto_8858 - PLACE
      ?auto_8860 - PLACE
      ?auto_8861 - HOIST
      ?auto_8862 - SURFACE
      ?auto_8859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8857 ?auto_8858 ) ( SURFACE-AT ?auto_8855 ?auto_8858 ) ( CLEAR ?auto_8855 ) ( IS-CRATE ?auto_8856 ) ( AVAILABLE ?auto_8857 ) ( not ( = ?auto_8860 ?auto_8858 ) ) ( HOIST-AT ?auto_8861 ?auto_8860 ) ( AVAILABLE ?auto_8861 ) ( SURFACE-AT ?auto_8856 ?auto_8860 ) ( ON ?auto_8856 ?auto_8862 ) ( CLEAR ?auto_8856 ) ( TRUCK-AT ?auto_8859 ?auto_8858 ) ( not ( = ?auto_8855 ?auto_8856 ) ) ( not ( = ?auto_8855 ?auto_8862 ) ) ( not ( = ?auto_8856 ?auto_8862 ) ) ( not ( = ?auto_8857 ?auto_8861 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8859 ?auto_8858 ?auto_8860 )
      ( !LIFT ?auto_8861 ?auto_8856 ?auto_8862 ?auto_8860 )
      ( !LOAD ?auto_8861 ?auto_8856 ?auto_8859 ?auto_8860 )
      ( !DRIVE ?auto_8859 ?auto_8860 ?auto_8858 )
      ( !UNLOAD ?auto_8857 ?auto_8856 ?auto_8859 ?auto_8858 )
      ( !DROP ?auto_8857 ?auto_8856 ?auto_8855 ?auto_8858 )
      ( MAKE-1CRATE-VERIFY ?auto_8855 ?auto_8856 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8874 - SURFACE
      ?auto_8875 - SURFACE
      ?auto_8876 - SURFACE
      ?auto_8877 - SURFACE
      ?auto_8878 - SURFACE
      ?auto_8881 - SURFACE
      ?auto_8879 - SURFACE
      ?auto_8883 - SURFACE
      ?auto_8882 - SURFACE
      ?auto_8880 - SURFACE
      ?auto_8884 - SURFACE
    )
    :vars
    (
      ?auto_8890 - HOIST
      ?auto_8888 - PLACE
      ?auto_8887 - PLACE
      ?auto_8886 - HOIST
      ?auto_8885 - SURFACE
      ?auto_8898 - PLACE
      ?auto_8911 - HOIST
      ?auto_8906 - SURFACE
      ?auto_8903 - PLACE
      ?auto_8902 - HOIST
      ?auto_8897 - SURFACE
      ?auto_8904 - PLACE
      ?auto_8892 - HOIST
      ?auto_8894 - SURFACE
      ?auto_8907 - SURFACE
      ?auto_8895 - PLACE
      ?auto_8899 - HOIST
      ?auto_8891 - SURFACE
      ?auto_8910 - SURFACE
      ?auto_8893 - PLACE
      ?auto_8900 - HOIST
      ?auto_8908 - SURFACE
      ?auto_8901 - PLACE
      ?auto_8905 - HOIST
      ?auto_8896 - SURFACE
      ?auto_8909 - SURFACE
      ?auto_8889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8890 ?auto_8888 ) ( IS-CRATE ?auto_8884 ) ( not ( = ?auto_8887 ?auto_8888 ) ) ( HOIST-AT ?auto_8886 ?auto_8887 ) ( AVAILABLE ?auto_8886 ) ( SURFACE-AT ?auto_8884 ?auto_8887 ) ( ON ?auto_8884 ?auto_8885 ) ( CLEAR ?auto_8884 ) ( not ( = ?auto_8880 ?auto_8884 ) ) ( not ( = ?auto_8880 ?auto_8885 ) ) ( not ( = ?auto_8884 ?auto_8885 ) ) ( not ( = ?auto_8890 ?auto_8886 ) ) ( IS-CRATE ?auto_8880 ) ( not ( = ?auto_8898 ?auto_8888 ) ) ( HOIST-AT ?auto_8911 ?auto_8898 ) ( AVAILABLE ?auto_8911 ) ( SURFACE-AT ?auto_8880 ?auto_8898 ) ( ON ?auto_8880 ?auto_8906 ) ( CLEAR ?auto_8880 ) ( not ( = ?auto_8882 ?auto_8880 ) ) ( not ( = ?auto_8882 ?auto_8906 ) ) ( not ( = ?auto_8880 ?auto_8906 ) ) ( not ( = ?auto_8890 ?auto_8911 ) ) ( IS-CRATE ?auto_8882 ) ( not ( = ?auto_8903 ?auto_8888 ) ) ( HOIST-AT ?auto_8902 ?auto_8903 ) ( SURFACE-AT ?auto_8882 ?auto_8903 ) ( ON ?auto_8882 ?auto_8897 ) ( CLEAR ?auto_8882 ) ( not ( = ?auto_8883 ?auto_8882 ) ) ( not ( = ?auto_8883 ?auto_8897 ) ) ( not ( = ?auto_8882 ?auto_8897 ) ) ( not ( = ?auto_8890 ?auto_8902 ) ) ( IS-CRATE ?auto_8883 ) ( not ( = ?auto_8904 ?auto_8888 ) ) ( HOIST-AT ?auto_8892 ?auto_8904 ) ( AVAILABLE ?auto_8892 ) ( SURFACE-AT ?auto_8883 ?auto_8904 ) ( ON ?auto_8883 ?auto_8894 ) ( CLEAR ?auto_8883 ) ( not ( = ?auto_8879 ?auto_8883 ) ) ( not ( = ?auto_8879 ?auto_8894 ) ) ( not ( = ?auto_8883 ?auto_8894 ) ) ( not ( = ?auto_8890 ?auto_8892 ) ) ( IS-CRATE ?auto_8879 ) ( AVAILABLE ?auto_8902 ) ( SURFACE-AT ?auto_8879 ?auto_8903 ) ( ON ?auto_8879 ?auto_8907 ) ( CLEAR ?auto_8879 ) ( not ( = ?auto_8881 ?auto_8879 ) ) ( not ( = ?auto_8881 ?auto_8907 ) ) ( not ( = ?auto_8879 ?auto_8907 ) ) ( IS-CRATE ?auto_8881 ) ( not ( = ?auto_8895 ?auto_8888 ) ) ( HOIST-AT ?auto_8899 ?auto_8895 ) ( SURFACE-AT ?auto_8881 ?auto_8895 ) ( ON ?auto_8881 ?auto_8891 ) ( CLEAR ?auto_8881 ) ( not ( = ?auto_8878 ?auto_8881 ) ) ( not ( = ?auto_8878 ?auto_8891 ) ) ( not ( = ?auto_8881 ?auto_8891 ) ) ( not ( = ?auto_8890 ?auto_8899 ) ) ( IS-CRATE ?auto_8878 ) ( AVAILABLE ?auto_8899 ) ( SURFACE-AT ?auto_8878 ?auto_8895 ) ( ON ?auto_8878 ?auto_8910 ) ( CLEAR ?auto_8878 ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( not ( = ?auto_8877 ?auto_8910 ) ) ( not ( = ?auto_8878 ?auto_8910 ) ) ( IS-CRATE ?auto_8877 ) ( not ( = ?auto_8893 ?auto_8888 ) ) ( HOIST-AT ?auto_8900 ?auto_8893 ) ( AVAILABLE ?auto_8900 ) ( SURFACE-AT ?auto_8877 ?auto_8893 ) ( ON ?auto_8877 ?auto_8908 ) ( CLEAR ?auto_8877 ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8908 ) ) ( not ( = ?auto_8877 ?auto_8908 ) ) ( not ( = ?auto_8890 ?auto_8900 ) ) ( IS-CRATE ?auto_8876 ) ( not ( = ?auto_8901 ?auto_8888 ) ) ( HOIST-AT ?auto_8905 ?auto_8901 ) ( SURFACE-AT ?auto_8876 ?auto_8901 ) ( ON ?auto_8876 ?auto_8896 ) ( CLEAR ?auto_8876 ) ( not ( = ?auto_8875 ?auto_8876 ) ) ( not ( = ?auto_8875 ?auto_8896 ) ) ( not ( = ?auto_8876 ?auto_8896 ) ) ( not ( = ?auto_8890 ?auto_8905 ) ) ( SURFACE-AT ?auto_8874 ?auto_8888 ) ( CLEAR ?auto_8874 ) ( IS-CRATE ?auto_8875 ) ( AVAILABLE ?auto_8890 ) ( AVAILABLE ?auto_8905 ) ( SURFACE-AT ?auto_8875 ?auto_8901 ) ( ON ?auto_8875 ?auto_8909 ) ( CLEAR ?auto_8875 ) ( TRUCK-AT ?auto_8889 ?auto_8888 ) ( not ( = ?auto_8874 ?auto_8875 ) ) ( not ( = ?auto_8874 ?auto_8909 ) ) ( not ( = ?auto_8875 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8876 ) ) ( not ( = ?auto_8874 ?auto_8896 ) ) ( not ( = ?auto_8876 ?auto_8909 ) ) ( not ( = ?auto_8896 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8877 ) ) ( not ( = ?auto_8874 ?auto_8908 ) ) ( not ( = ?auto_8875 ?auto_8877 ) ) ( not ( = ?auto_8875 ?auto_8908 ) ) ( not ( = ?auto_8877 ?auto_8896 ) ) ( not ( = ?auto_8877 ?auto_8909 ) ) ( not ( = ?auto_8893 ?auto_8901 ) ) ( not ( = ?auto_8900 ?auto_8905 ) ) ( not ( = ?auto_8908 ?auto_8896 ) ) ( not ( = ?auto_8908 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8878 ) ) ( not ( = ?auto_8874 ?auto_8910 ) ) ( not ( = ?auto_8875 ?auto_8878 ) ) ( not ( = ?auto_8875 ?auto_8910 ) ) ( not ( = ?auto_8876 ?auto_8878 ) ) ( not ( = ?auto_8876 ?auto_8910 ) ) ( not ( = ?auto_8878 ?auto_8908 ) ) ( not ( = ?auto_8878 ?auto_8896 ) ) ( not ( = ?auto_8878 ?auto_8909 ) ) ( not ( = ?auto_8895 ?auto_8893 ) ) ( not ( = ?auto_8895 ?auto_8901 ) ) ( not ( = ?auto_8899 ?auto_8900 ) ) ( not ( = ?auto_8899 ?auto_8905 ) ) ( not ( = ?auto_8910 ?auto_8908 ) ) ( not ( = ?auto_8910 ?auto_8896 ) ) ( not ( = ?auto_8910 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8881 ) ) ( not ( = ?auto_8874 ?auto_8891 ) ) ( not ( = ?auto_8875 ?auto_8881 ) ) ( not ( = ?auto_8875 ?auto_8891 ) ) ( not ( = ?auto_8876 ?auto_8881 ) ) ( not ( = ?auto_8876 ?auto_8891 ) ) ( not ( = ?auto_8877 ?auto_8881 ) ) ( not ( = ?auto_8877 ?auto_8891 ) ) ( not ( = ?auto_8881 ?auto_8910 ) ) ( not ( = ?auto_8881 ?auto_8908 ) ) ( not ( = ?auto_8881 ?auto_8896 ) ) ( not ( = ?auto_8881 ?auto_8909 ) ) ( not ( = ?auto_8891 ?auto_8910 ) ) ( not ( = ?auto_8891 ?auto_8908 ) ) ( not ( = ?auto_8891 ?auto_8896 ) ) ( not ( = ?auto_8891 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8879 ) ) ( not ( = ?auto_8874 ?auto_8907 ) ) ( not ( = ?auto_8875 ?auto_8879 ) ) ( not ( = ?auto_8875 ?auto_8907 ) ) ( not ( = ?auto_8876 ?auto_8879 ) ) ( not ( = ?auto_8876 ?auto_8907 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8907 ) ) ( not ( = ?auto_8878 ?auto_8879 ) ) ( not ( = ?auto_8878 ?auto_8907 ) ) ( not ( = ?auto_8879 ?auto_8891 ) ) ( not ( = ?auto_8879 ?auto_8910 ) ) ( not ( = ?auto_8879 ?auto_8908 ) ) ( not ( = ?auto_8879 ?auto_8896 ) ) ( not ( = ?auto_8879 ?auto_8909 ) ) ( not ( = ?auto_8903 ?auto_8895 ) ) ( not ( = ?auto_8903 ?auto_8893 ) ) ( not ( = ?auto_8903 ?auto_8901 ) ) ( not ( = ?auto_8902 ?auto_8899 ) ) ( not ( = ?auto_8902 ?auto_8900 ) ) ( not ( = ?auto_8902 ?auto_8905 ) ) ( not ( = ?auto_8907 ?auto_8891 ) ) ( not ( = ?auto_8907 ?auto_8910 ) ) ( not ( = ?auto_8907 ?auto_8908 ) ) ( not ( = ?auto_8907 ?auto_8896 ) ) ( not ( = ?auto_8907 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8883 ) ) ( not ( = ?auto_8874 ?auto_8894 ) ) ( not ( = ?auto_8875 ?auto_8883 ) ) ( not ( = ?auto_8875 ?auto_8894 ) ) ( not ( = ?auto_8876 ?auto_8883 ) ) ( not ( = ?auto_8876 ?auto_8894 ) ) ( not ( = ?auto_8877 ?auto_8883 ) ) ( not ( = ?auto_8877 ?auto_8894 ) ) ( not ( = ?auto_8878 ?auto_8883 ) ) ( not ( = ?auto_8878 ?auto_8894 ) ) ( not ( = ?auto_8881 ?auto_8883 ) ) ( not ( = ?auto_8881 ?auto_8894 ) ) ( not ( = ?auto_8883 ?auto_8907 ) ) ( not ( = ?auto_8883 ?auto_8891 ) ) ( not ( = ?auto_8883 ?auto_8910 ) ) ( not ( = ?auto_8883 ?auto_8908 ) ) ( not ( = ?auto_8883 ?auto_8896 ) ) ( not ( = ?auto_8883 ?auto_8909 ) ) ( not ( = ?auto_8904 ?auto_8903 ) ) ( not ( = ?auto_8904 ?auto_8895 ) ) ( not ( = ?auto_8904 ?auto_8893 ) ) ( not ( = ?auto_8904 ?auto_8901 ) ) ( not ( = ?auto_8892 ?auto_8902 ) ) ( not ( = ?auto_8892 ?auto_8899 ) ) ( not ( = ?auto_8892 ?auto_8900 ) ) ( not ( = ?auto_8892 ?auto_8905 ) ) ( not ( = ?auto_8894 ?auto_8907 ) ) ( not ( = ?auto_8894 ?auto_8891 ) ) ( not ( = ?auto_8894 ?auto_8910 ) ) ( not ( = ?auto_8894 ?auto_8908 ) ) ( not ( = ?auto_8894 ?auto_8896 ) ) ( not ( = ?auto_8894 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8882 ) ) ( not ( = ?auto_8874 ?auto_8897 ) ) ( not ( = ?auto_8875 ?auto_8882 ) ) ( not ( = ?auto_8875 ?auto_8897 ) ) ( not ( = ?auto_8876 ?auto_8882 ) ) ( not ( = ?auto_8876 ?auto_8897 ) ) ( not ( = ?auto_8877 ?auto_8882 ) ) ( not ( = ?auto_8877 ?auto_8897 ) ) ( not ( = ?auto_8878 ?auto_8882 ) ) ( not ( = ?auto_8878 ?auto_8897 ) ) ( not ( = ?auto_8881 ?auto_8882 ) ) ( not ( = ?auto_8881 ?auto_8897 ) ) ( not ( = ?auto_8879 ?auto_8882 ) ) ( not ( = ?auto_8879 ?auto_8897 ) ) ( not ( = ?auto_8882 ?auto_8894 ) ) ( not ( = ?auto_8882 ?auto_8907 ) ) ( not ( = ?auto_8882 ?auto_8891 ) ) ( not ( = ?auto_8882 ?auto_8910 ) ) ( not ( = ?auto_8882 ?auto_8908 ) ) ( not ( = ?auto_8882 ?auto_8896 ) ) ( not ( = ?auto_8882 ?auto_8909 ) ) ( not ( = ?auto_8897 ?auto_8894 ) ) ( not ( = ?auto_8897 ?auto_8907 ) ) ( not ( = ?auto_8897 ?auto_8891 ) ) ( not ( = ?auto_8897 ?auto_8910 ) ) ( not ( = ?auto_8897 ?auto_8908 ) ) ( not ( = ?auto_8897 ?auto_8896 ) ) ( not ( = ?auto_8897 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8880 ) ) ( not ( = ?auto_8874 ?auto_8906 ) ) ( not ( = ?auto_8875 ?auto_8880 ) ) ( not ( = ?auto_8875 ?auto_8906 ) ) ( not ( = ?auto_8876 ?auto_8880 ) ) ( not ( = ?auto_8876 ?auto_8906 ) ) ( not ( = ?auto_8877 ?auto_8880 ) ) ( not ( = ?auto_8877 ?auto_8906 ) ) ( not ( = ?auto_8878 ?auto_8880 ) ) ( not ( = ?auto_8878 ?auto_8906 ) ) ( not ( = ?auto_8881 ?auto_8880 ) ) ( not ( = ?auto_8881 ?auto_8906 ) ) ( not ( = ?auto_8879 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8906 ) ) ( not ( = ?auto_8883 ?auto_8880 ) ) ( not ( = ?auto_8883 ?auto_8906 ) ) ( not ( = ?auto_8880 ?auto_8897 ) ) ( not ( = ?auto_8880 ?auto_8894 ) ) ( not ( = ?auto_8880 ?auto_8907 ) ) ( not ( = ?auto_8880 ?auto_8891 ) ) ( not ( = ?auto_8880 ?auto_8910 ) ) ( not ( = ?auto_8880 ?auto_8908 ) ) ( not ( = ?auto_8880 ?auto_8896 ) ) ( not ( = ?auto_8880 ?auto_8909 ) ) ( not ( = ?auto_8898 ?auto_8903 ) ) ( not ( = ?auto_8898 ?auto_8904 ) ) ( not ( = ?auto_8898 ?auto_8895 ) ) ( not ( = ?auto_8898 ?auto_8893 ) ) ( not ( = ?auto_8898 ?auto_8901 ) ) ( not ( = ?auto_8911 ?auto_8902 ) ) ( not ( = ?auto_8911 ?auto_8892 ) ) ( not ( = ?auto_8911 ?auto_8899 ) ) ( not ( = ?auto_8911 ?auto_8900 ) ) ( not ( = ?auto_8911 ?auto_8905 ) ) ( not ( = ?auto_8906 ?auto_8897 ) ) ( not ( = ?auto_8906 ?auto_8894 ) ) ( not ( = ?auto_8906 ?auto_8907 ) ) ( not ( = ?auto_8906 ?auto_8891 ) ) ( not ( = ?auto_8906 ?auto_8910 ) ) ( not ( = ?auto_8906 ?auto_8908 ) ) ( not ( = ?auto_8906 ?auto_8896 ) ) ( not ( = ?auto_8906 ?auto_8909 ) ) ( not ( = ?auto_8874 ?auto_8884 ) ) ( not ( = ?auto_8874 ?auto_8885 ) ) ( not ( = ?auto_8875 ?auto_8884 ) ) ( not ( = ?auto_8875 ?auto_8885 ) ) ( not ( = ?auto_8876 ?auto_8884 ) ) ( not ( = ?auto_8876 ?auto_8885 ) ) ( not ( = ?auto_8877 ?auto_8884 ) ) ( not ( = ?auto_8877 ?auto_8885 ) ) ( not ( = ?auto_8878 ?auto_8884 ) ) ( not ( = ?auto_8878 ?auto_8885 ) ) ( not ( = ?auto_8881 ?auto_8884 ) ) ( not ( = ?auto_8881 ?auto_8885 ) ) ( not ( = ?auto_8879 ?auto_8884 ) ) ( not ( = ?auto_8879 ?auto_8885 ) ) ( not ( = ?auto_8883 ?auto_8884 ) ) ( not ( = ?auto_8883 ?auto_8885 ) ) ( not ( = ?auto_8882 ?auto_8884 ) ) ( not ( = ?auto_8882 ?auto_8885 ) ) ( not ( = ?auto_8884 ?auto_8906 ) ) ( not ( = ?auto_8884 ?auto_8897 ) ) ( not ( = ?auto_8884 ?auto_8894 ) ) ( not ( = ?auto_8884 ?auto_8907 ) ) ( not ( = ?auto_8884 ?auto_8891 ) ) ( not ( = ?auto_8884 ?auto_8910 ) ) ( not ( = ?auto_8884 ?auto_8908 ) ) ( not ( = ?auto_8884 ?auto_8896 ) ) ( not ( = ?auto_8884 ?auto_8909 ) ) ( not ( = ?auto_8887 ?auto_8898 ) ) ( not ( = ?auto_8887 ?auto_8903 ) ) ( not ( = ?auto_8887 ?auto_8904 ) ) ( not ( = ?auto_8887 ?auto_8895 ) ) ( not ( = ?auto_8887 ?auto_8893 ) ) ( not ( = ?auto_8887 ?auto_8901 ) ) ( not ( = ?auto_8886 ?auto_8911 ) ) ( not ( = ?auto_8886 ?auto_8902 ) ) ( not ( = ?auto_8886 ?auto_8892 ) ) ( not ( = ?auto_8886 ?auto_8899 ) ) ( not ( = ?auto_8886 ?auto_8900 ) ) ( not ( = ?auto_8886 ?auto_8905 ) ) ( not ( = ?auto_8885 ?auto_8906 ) ) ( not ( = ?auto_8885 ?auto_8897 ) ) ( not ( = ?auto_8885 ?auto_8894 ) ) ( not ( = ?auto_8885 ?auto_8907 ) ) ( not ( = ?auto_8885 ?auto_8891 ) ) ( not ( = ?auto_8885 ?auto_8910 ) ) ( not ( = ?auto_8885 ?auto_8908 ) ) ( not ( = ?auto_8885 ?auto_8896 ) ) ( not ( = ?auto_8885 ?auto_8909 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8874 ?auto_8875 ?auto_8876 ?auto_8877 ?auto_8878 ?auto_8881 ?auto_8879 ?auto_8883 ?auto_8882 ?auto_8880 )
      ( MAKE-1CRATE ?auto_8880 ?auto_8884 )
      ( MAKE-10CRATE-VERIFY ?auto_8874 ?auto_8875 ?auto_8876 ?auto_8877 ?auto_8878 ?auto_8881 ?auto_8879 ?auto_8883 ?auto_8882 ?auto_8880 ?auto_8884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8914 - SURFACE
      ?auto_8915 - SURFACE
    )
    :vars
    (
      ?auto_8916 - HOIST
      ?auto_8917 - PLACE
      ?auto_8919 - PLACE
      ?auto_8920 - HOIST
      ?auto_8921 - SURFACE
      ?auto_8918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8916 ?auto_8917 ) ( SURFACE-AT ?auto_8914 ?auto_8917 ) ( CLEAR ?auto_8914 ) ( IS-CRATE ?auto_8915 ) ( AVAILABLE ?auto_8916 ) ( not ( = ?auto_8919 ?auto_8917 ) ) ( HOIST-AT ?auto_8920 ?auto_8919 ) ( AVAILABLE ?auto_8920 ) ( SURFACE-AT ?auto_8915 ?auto_8919 ) ( ON ?auto_8915 ?auto_8921 ) ( CLEAR ?auto_8915 ) ( TRUCK-AT ?auto_8918 ?auto_8917 ) ( not ( = ?auto_8914 ?auto_8915 ) ) ( not ( = ?auto_8914 ?auto_8921 ) ) ( not ( = ?auto_8915 ?auto_8921 ) ) ( not ( = ?auto_8916 ?auto_8920 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8918 ?auto_8917 ?auto_8919 )
      ( !LIFT ?auto_8920 ?auto_8915 ?auto_8921 ?auto_8919 )
      ( !LOAD ?auto_8920 ?auto_8915 ?auto_8918 ?auto_8919 )
      ( !DRIVE ?auto_8918 ?auto_8919 ?auto_8917 )
      ( !UNLOAD ?auto_8916 ?auto_8915 ?auto_8918 ?auto_8917 )
      ( !DROP ?auto_8916 ?auto_8915 ?auto_8914 ?auto_8917 )
      ( MAKE-1CRATE-VERIFY ?auto_8914 ?auto_8915 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_8934 - SURFACE
      ?auto_8935 - SURFACE
      ?auto_8936 - SURFACE
      ?auto_8937 - SURFACE
      ?auto_8938 - SURFACE
      ?auto_8941 - SURFACE
      ?auto_8939 - SURFACE
      ?auto_8943 - SURFACE
      ?auto_8942 - SURFACE
      ?auto_8940 - SURFACE
      ?auto_8945 - SURFACE
      ?auto_8944 - SURFACE
    )
    :vars
    (
      ?auto_8949 - HOIST
      ?auto_8947 - PLACE
      ?auto_8950 - PLACE
      ?auto_8948 - HOIST
      ?auto_8946 - SURFACE
      ?auto_8964 - PLACE
      ?auto_8962 - HOIST
      ?auto_8953 - SURFACE
      ?auto_8959 - PLACE
      ?auto_8960 - HOIST
      ?auto_8966 - SURFACE
      ?auto_8969 - PLACE
      ?auto_8956 - HOIST
      ?auto_8965 - SURFACE
      ?auto_8967 - PLACE
      ?auto_8963 - HOIST
      ?auto_8954 - SURFACE
      ?auto_8955 - SURFACE
      ?auto_8958 - PLACE
      ?auto_8970 - HOIST
      ?auto_8972 - SURFACE
      ?auto_8961 - SURFACE
      ?auto_8957 - SURFACE
      ?auto_8968 - PLACE
      ?auto_8952 - HOIST
      ?auto_8971 - SURFACE
      ?auto_8973 - SURFACE
      ?auto_8951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8949 ?auto_8947 ) ( IS-CRATE ?auto_8944 ) ( not ( = ?auto_8950 ?auto_8947 ) ) ( HOIST-AT ?auto_8948 ?auto_8950 ) ( SURFACE-AT ?auto_8944 ?auto_8950 ) ( ON ?auto_8944 ?auto_8946 ) ( CLEAR ?auto_8944 ) ( not ( = ?auto_8945 ?auto_8944 ) ) ( not ( = ?auto_8945 ?auto_8946 ) ) ( not ( = ?auto_8944 ?auto_8946 ) ) ( not ( = ?auto_8949 ?auto_8948 ) ) ( IS-CRATE ?auto_8945 ) ( not ( = ?auto_8964 ?auto_8947 ) ) ( HOIST-AT ?auto_8962 ?auto_8964 ) ( AVAILABLE ?auto_8962 ) ( SURFACE-AT ?auto_8945 ?auto_8964 ) ( ON ?auto_8945 ?auto_8953 ) ( CLEAR ?auto_8945 ) ( not ( = ?auto_8940 ?auto_8945 ) ) ( not ( = ?auto_8940 ?auto_8953 ) ) ( not ( = ?auto_8945 ?auto_8953 ) ) ( not ( = ?auto_8949 ?auto_8962 ) ) ( IS-CRATE ?auto_8940 ) ( not ( = ?auto_8959 ?auto_8947 ) ) ( HOIST-AT ?auto_8960 ?auto_8959 ) ( AVAILABLE ?auto_8960 ) ( SURFACE-AT ?auto_8940 ?auto_8959 ) ( ON ?auto_8940 ?auto_8966 ) ( CLEAR ?auto_8940 ) ( not ( = ?auto_8942 ?auto_8940 ) ) ( not ( = ?auto_8942 ?auto_8966 ) ) ( not ( = ?auto_8940 ?auto_8966 ) ) ( not ( = ?auto_8949 ?auto_8960 ) ) ( IS-CRATE ?auto_8942 ) ( not ( = ?auto_8969 ?auto_8947 ) ) ( HOIST-AT ?auto_8956 ?auto_8969 ) ( SURFACE-AT ?auto_8942 ?auto_8969 ) ( ON ?auto_8942 ?auto_8965 ) ( CLEAR ?auto_8942 ) ( not ( = ?auto_8943 ?auto_8942 ) ) ( not ( = ?auto_8943 ?auto_8965 ) ) ( not ( = ?auto_8942 ?auto_8965 ) ) ( not ( = ?auto_8949 ?auto_8956 ) ) ( IS-CRATE ?auto_8943 ) ( not ( = ?auto_8967 ?auto_8947 ) ) ( HOIST-AT ?auto_8963 ?auto_8967 ) ( AVAILABLE ?auto_8963 ) ( SURFACE-AT ?auto_8943 ?auto_8967 ) ( ON ?auto_8943 ?auto_8954 ) ( CLEAR ?auto_8943 ) ( not ( = ?auto_8939 ?auto_8943 ) ) ( not ( = ?auto_8939 ?auto_8954 ) ) ( not ( = ?auto_8943 ?auto_8954 ) ) ( not ( = ?auto_8949 ?auto_8963 ) ) ( IS-CRATE ?auto_8939 ) ( AVAILABLE ?auto_8956 ) ( SURFACE-AT ?auto_8939 ?auto_8969 ) ( ON ?auto_8939 ?auto_8955 ) ( CLEAR ?auto_8939 ) ( not ( = ?auto_8941 ?auto_8939 ) ) ( not ( = ?auto_8941 ?auto_8955 ) ) ( not ( = ?auto_8939 ?auto_8955 ) ) ( IS-CRATE ?auto_8941 ) ( not ( = ?auto_8958 ?auto_8947 ) ) ( HOIST-AT ?auto_8970 ?auto_8958 ) ( SURFACE-AT ?auto_8941 ?auto_8958 ) ( ON ?auto_8941 ?auto_8972 ) ( CLEAR ?auto_8941 ) ( not ( = ?auto_8938 ?auto_8941 ) ) ( not ( = ?auto_8938 ?auto_8972 ) ) ( not ( = ?auto_8941 ?auto_8972 ) ) ( not ( = ?auto_8949 ?auto_8970 ) ) ( IS-CRATE ?auto_8938 ) ( AVAILABLE ?auto_8970 ) ( SURFACE-AT ?auto_8938 ?auto_8958 ) ( ON ?auto_8938 ?auto_8961 ) ( CLEAR ?auto_8938 ) ( not ( = ?auto_8937 ?auto_8938 ) ) ( not ( = ?auto_8937 ?auto_8961 ) ) ( not ( = ?auto_8938 ?auto_8961 ) ) ( IS-CRATE ?auto_8937 ) ( AVAILABLE ?auto_8948 ) ( SURFACE-AT ?auto_8937 ?auto_8950 ) ( ON ?auto_8937 ?auto_8957 ) ( CLEAR ?auto_8937 ) ( not ( = ?auto_8936 ?auto_8937 ) ) ( not ( = ?auto_8936 ?auto_8957 ) ) ( not ( = ?auto_8937 ?auto_8957 ) ) ( IS-CRATE ?auto_8936 ) ( not ( = ?auto_8968 ?auto_8947 ) ) ( HOIST-AT ?auto_8952 ?auto_8968 ) ( SURFACE-AT ?auto_8936 ?auto_8968 ) ( ON ?auto_8936 ?auto_8971 ) ( CLEAR ?auto_8936 ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8935 ?auto_8971 ) ) ( not ( = ?auto_8936 ?auto_8971 ) ) ( not ( = ?auto_8949 ?auto_8952 ) ) ( SURFACE-AT ?auto_8934 ?auto_8947 ) ( CLEAR ?auto_8934 ) ( IS-CRATE ?auto_8935 ) ( AVAILABLE ?auto_8949 ) ( AVAILABLE ?auto_8952 ) ( SURFACE-AT ?auto_8935 ?auto_8968 ) ( ON ?auto_8935 ?auto_8973 ) ( CLEAR ?auto_8935 ) ( TRUCK-AT ?auto_8951 ?auto_8947 ) ( not ( = ?auto_8934 ?auto_8935 ) ) ( not ( = ?auto_8934 ?auto_8973 ) ) ( not ( = ?auto_8935 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8936 ) ) ( not ( = ?auto_8934 ?auto_8971 ) ) ( not ( = ?auto_8936 ?auto_8973 ) ) ( not ( = ?auto_8971 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8937 ) ) ( not ( = ?auto_8934 ?auto_8957 ) ) ( not ( = ?auto_8935 ?auto_8937 ) ) ( not ( = ?auto_8935 ?auto_8957 ) ) ( not ( = ?auto_8937 ?auto_8971 ) ) ( not ( = ?auto_8937 ?auto_8973 ) ) ( not ( = ?auto_8950 ?auto_8968 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8957 ?auto_8971 ) ) ( not ( = ?auto_8957 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8938 ) ) ( not ( = ?auto_8934 ?auto_8961 ) ) ( not ( = ?auto_8935 ?auto_8938 ) ) ( not ( = ?auto_8935 ?auto_8961 ) ) ( not ( = ?auto_8936 ?auto_8938 ) ) ( not ( = ?auto_8936 ?auto_8961 ) ) ( not ( = ?auto_8938 ?auto_8957 ) ) ( not ( = ?auto_8938 ?auto_8971 ) ) ( not ( = ?auto_8938 ?auto_8973 ) ) ( not ( = ?auto_8958 ?auto_8950 ) ) ( not ( = ?auto_8958 ?auto_8968 ) ) ( not ( = ?auto_8970 ?auto_8948 ) ) ( not ( = ?auto_8970 ?auto_8952 ) ) ( not ( = ?auto_8961 ?auto_8957 ) ) ( not ( = ?auto_8961 ?auto_8971 ) ) ( not ( = ?auto_8961 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8941 ) ) ( not ( = ?auto_8934 ?auto_8972 ) ) ( not ( = ?auto_8935 ?auto_8941 ) ) ( not ( = ?auto_8935 ?auto_8972 ) ) ( not ( = ?auto_8936 ?auto_8941 ) ) ( not ( = ?auto_8936 ?auto_8972 ) ) ( not ( = ?auto_8937 ?auto_8941 ) ) ( not ( = ?auto_8937 ?auto_8972 ) ) ( not ( = ?auto_8941 ?auto_8961 ) ) ( not ( = ?auto_8941 ?auto_8957 ) ) ( not ( = ?auto_8941 ?auto_8971 ) ) ( not ( = ?auto_8941 ?auto_8973 ) ) ( not ( = ?auto_8972 ?auto_8961 ) ) ( not ( = ?auto_8972 ?auto_8957 ) ) ( not ( = ?auto_8972 ?auto_8971 ) ) ( not ( = ?auto_8972 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8939 ) ) ( not ( = ?auto_8934 ?auto_8955 ) ) ( not ( = ?auto_8935 ?auto_8939 ) ) ( not ( = ?auto_8935 ?auto_8955 ) ) ( not ( = ?auto_8936 ?auto_8939 ) ) ( not ( = ?auto_8936 ?auto_8955 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8937 ?auto_8955 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8955 ) ) ( not ( = ?auto_8939 ?auto_8972 ) ) ( not ( = ?auto_8939 ?auto_8961 ) ) ( not ( = ?auto_8939 ?auto_8957 ) ) ( not ( = ?auto_8939 ?auto_8971 ) ) ( not ( = ?auto_8939 ?auto_8973 ) ) ( not ( = ?auto_8969 ?auto_8958 ) ) ( not ( = ?auto_8969 ?auto_8950 ) ) ( not ( = ?auto_8969 ?auto_8968 ) ) ( not ( = ?auto_8956 ?auto_8970 ) ) ( not ( = ?auto_8956 ?auto_8948 ) ) ( not ( = ?auto_8956 ?auto_8952 ) ) ( not ( = ?auto_8955 ?auto_8972 ) ) ( not ( = ?auto_8955 ?auto_8961 ) ) ( not ( = ?auto_8955 ?auto_8957 ) ) ( not ( = ?auto_8955 ?auto_8971 ) ) ( not ( = ?auto_8955 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8943 ) ) ( not ( = ?auto_8934 ?auto_8954 ) ) ( not ( = ?auto_8935 ?auto_8943 ) ) ( not ( = ?auto_8935 ?auto_8954 ) ) ( not ( = ?auto_8936 ?auto_8943 ) ) ( not ( = ?auto_8936 ?auto_8954 ) ) ( not ( = ?auto_8937 ?auto_8943 ) ) ( not ( = ?auto_8937 ?auto_8954 ) ) ( not ( = ?auto_8938 ?auto_8943 ) ) ( not ( = ?auto_8938 ?auto_8954 ) ) ( not ( = ?auto_8941 ?auto_8943 ) ) ( not ( = ?auto_8941 ?auto_8954 ) ) ( not ( = ?auto_8943 ?auto_8955 ) ) ( not ( = ?auto_8943 ?auto_8972 ) ) ( not ( = ?auto_8943 ?auto_8961 ) ) ( not ( = ?auto_8943 ?auto_8957 ) ) ( not ( = ?auto_8943 ?auto_8971 ) ) ( not ( = ?auto_8943 ?auto_8973 ) ) ( not ( = ?auto_8967 ?auto_8969 ) ) ( not ( = ?auto_8967 ?auto_8958 ) ) ( not ( = ?auto_8967 ?auto_8950 ) ) ( not ( = ?auto_8967 ?auto_8968 ) ) ( not ( = ?auto_8963 ?auto_8956 ) ) ( not ( = ?auto_8963 ?auto_8970 ) ) ( not ( = ?auto_8963 ?auto_8948 ) ) ( not ( = ?auto_8963 ?auto_8952 ) ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8972 ) ) ( not ( = ?auto_8954 ?auto_8961 ) ) ( not ( = ?auto_8954 ?auto_8957 ) ) ( not ( = ?auto_8954 ?auto_8971 ) ) ( not ( = ?auto_8954 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8942 ) ) ( not ( = ?auto_8934 ?auto_8965 ) ) ( not ( = ?auto_8935 ?auto_8942 ) ) ( not ( = ?auto_8935 ?auto_8965 ) ) ( not ( = ?auto_8936 ?auto_8942 ) ) ( not ( = ?auto_8936 ?auto_8965 ) ) ( not ( = ?auto_8937 ?auto_8942 ) ) ( not ( = ?auto_8937 ?auto_8965 ) ) ( not ( = ?auto_8938 ?auto_8942 ) ) ( not ( = ?auto_8938 ?auto_8965 ) ) ( not ( = ?auto_8941 ?auto_8942 ) ) ( not ( = ?auto_8941 ?auto_8965 ) ) ( not ( = ?auto_8939 ?auto_8942 ) ) ( not ( = ?auto_8939 ?auto_8965 ) ) ( not ( = ?auto_8942 ?auto_8954 ) ) ( not ( = ?auto_8942 ?auto_8955 ) ) ( not ( = ?auto_8942 ?auto_8972 ) ) ( not ( = ?auto_8942 ?auto_8961 ) ) ( not ( = ?auto_8942 ?auto_8957 ) ) ( not ( = ?auto_8942 ?auto_8971 ) ) ( not ( = ?auto_8942 ?auto_8973 ) ) ( not ( = ?auto_8965 ?auto_8954 ) ) ( not ( = ?auto_8965 ?auto_8955 ) ) ( not ( = ?auto_8965 ?auto_8972 ) ) ( not ( = ?auto_8965 ?auto_8961 ) ) ( not ( = ?auto_8965 ?auto_8957 ) ) ( not ( = ?auto_8965 ?auto_8971 ) ) ( not ( = ?auto_8965 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8940 ) ) ( not ( = ?auto_8934 ?auto_8966 ) ) ( not ( = ?auto_8935 ?auto_8940 ) ) ( not ( = ?auto_8935 ?auto_8966 ) ) ( not ( = ?auto_8936 ?auto_8940 ) ) ( not ( = ?auto_8936 ?auto_8966 ) ) ( not ( = ?auto_8937 ?auto_8940 ) ) ( not ( = ?auto_8937 ?auto_8966 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8966 ) ) ( not ( = ?auto_8941 ?auto_8940 ) ) ( not ( = ?auto_8941 ?auto_8966 ) ) ( not ( = ?auto_8939 ?auto_8940 ) ) ( not ( = ?auto_8939 ?auto_8966 ) ) ( not ( = ?auto_8943 ?auto_8940 ) ) ( not ( = ?auto_8943 ?auto_8966 ) ) ( not ( = ?auto_8940 ?auto_8965 ) ) ( not ( = ?auto_8940 ?auto_8954 ) ) ( not ( = ?auto_8940 ?auto_8955 ) ) ( not ( = ?auto_8940 ?auto_8972 ) ) ( not ( = ?auto_8940 ?auto_8961 ) ) ( not ( = ?auto_8940 ?auto_8957 ) ) ( not ( = ?auto_8940 ?auto_8971 ) ) ( not ( = ?auto_8940 ?auto_8973 ) ) ( not ( = ?auto_8959 ?auto_8969 ) ) ( not ( = ?auto_8959 ?auto_8967 ) ) ( not ( = ?auto_8959 ?auto_8958 ) ) ( not ( = ?auto_8959 ?auto_8950 ) ) ( not ( = ?auto_8959 ?auto_8968 ) ) ( not ( = ?auto_8960 ?auto_8956 ) ) ( not ( = ?auto_8960 ?auto_8963 ) ) ( not ( = ?auto_8960 ?auto_8970 ) ) ( not ( = ?auto_8960 ?auto_8948 ) ) ( not ( = ?auto_8960 ?auto_8952 ) ) ( not ( = ?auto_8966 ?auto_8965 ) ) ( not ( = ?auto_8966 ?auto_8954 ) ) ( not ( = ?auto_8966 ?auto_8955 ) ) ( not ( = ?auto_8966 ?auto_8972 ) ) ( not ( = ?auto_8966 ?auto_8961 ) ) ( not ( = ?auto_8966 ?auto_8957 ) ) ( not ( = ?auto_8966 ?auto_8971 ) ) ( not ( = ?auto_8966 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8945 ) ) ( not ( = ?auto_8934 ?auto_8953 ) ) ( not ( = ?auto_8935 ?auto_8945 ) ) ( not ( = ?auto_8935 ?auto_8953 ) ) ( not ( = ?auto_8936 ?auto_8945 ) ) ( not ( = ?auto_8936 ?auto_8953 ) ) ( not ( = ?auto_8937 ?auto_8945 ) ) ( not ( = ?auto_8937 ?auto_8953 ) ) ( not ( = ?auto_8938 ?auto_8945 ) ) ( not ( = ?auto_8938 ?auto_8953 ) ) ( not ( = ?auto_8941 ?auto_8945 ) ) ( not ( = ?auto_8941 ?auto_8953 ) ) ( not ( = ?auto_8939 ?auto_8945 ) ) ( not ( = ?auto_8939 ?auto_8953 ) ) ( not ( = ?auto_8943 ?auto_8945 ) ) ( not ( = ?auto_8943 ?auto_8953 ) ) ( not ( = ?auto_8942 ?auto_8945 ) ) ( not ( = ?auto_8942 ?auto_8953 ) ) ( not ( = ?auto_8945 ?auto_8966 ) ) ( not ( = ?auto_8945 ?auto_8965 ) ) ( not ( = ?auto_8945 ?auto_8954 ) ) ( not ( = ?auto_8945 ?auto_8955 ) ) ( not ( = ?auto_8945 ?auto_8972 ) ) ( not ( = ?auto_8945 ?auto_8961 ) ) ( not ( = ?auto_8945 ?auto_8957 ) ) ( not ( = ?auto_8945 ?auto_8971 ) ) ( not ( = ?auto_8945 ?auto_8973 ) ) ( not ( = ?auto_8964 ?auto_8959 ) ) ( not ( = ?auto_8964 ?auto_8969 ) ) ( not ( = ?auto_8964 ?auto_8967 ) ) ( not ( = ?auto_8964 ?auto_8958 ) ) ( not ( = ?auto_8964 ?auto_8950 ) ) ( not ( = ?auto_8964 ?auto_8968 ) ) ( not ( = ?auto_8962 ?auto_8960 ) ) ( not ( = ?auto_8962 ?auto_8956 ) ) ( not ( = ?auto_8962 ?auto_8963 ) ) ( not ( = ?auto_8962 ?auto_8970 ) ) ( not ( = ?auto_8962 ?auto_8948 ) ) ( not ( = ?auto_8962 ?auto_8952 ) ) ( not ( = ?auto_8953 ?auto_8966 ) ) ( not ( = ?auto_8953 ?auto_8965 ) ) ( not ( = ?auto_8953 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8955 ) ) ( not ( = ?auto_8953 ?auto_8972 ) ) ( not ( = ?auto_8953 ?auto_8961 ) ) ( not ( = ?auto_8953 ?auto_8957 ) ) ( not ( = ?auto_8953 ?auto_8971 ) ) ( not ( = ?auto_8953 ?auto_8973 ) ) ( not ( = ?auto_8934 ?auto_8944 ) ) ( not ( = ?auto_8934 ?auto_8946 ) ) ( not ( = ?auto_8935 ?auto_8944 ) ) ( not ( = ?auto_8935 ?auto_8946 ) ) ( not ( = ?auto_8936 ?auto_8944 ) ) ( not ( = ?auto_8936 ?auto_8946 ) ) ( not ( = ?auto_8937 ?auto_8944 ) ) ( not ( = ?auto_8937 ?auto_8946 ) ) ( not ( = ?auto_8938 ?auto_8944 ) ) ( not ( = ?auto_8938 ?auto_8946 ) ) ( not ( = ?auto_8941 ?auto_8944 ) ) ( not ( = ?auto_8941 ?auto_8946 ) ) ( not ( = ?auto_8939 ?auto_8944 ) ) ( not ( = ?auto_8939 ?auto_8946 ) ) ( not ( = ?auto_8943 ?auto_8944 ) ) ( not ( = ?auto_8943 ?auto_8946 ) ) ( not ( = ?auto_8942 ?auto_8944 ) ) ( not ( = ?auto_8942 ?auto_8946 ) ) ( not ( = ?auto_8940 ?auto_8944 ) ) ( not ( = ?auto_8940 ?auto_8946 ) ) ( not ( = ?auto_8944 ?auto_8953 ) ) ( not ( = ?auto_8944 ?auto_8966 ) ) ( not ( = ?auto_8944 ?auto_8965 ) ) ( not ( = ?auto_8944 ?auto_8954 ) ) ( not ( = ?auto_8944 ?auto_8955 ) ) ( not ( = ?auto_8944 ?auto_8972 ) ) ( not ( = ?auto_8944 ?auto_8961 ) ) ( not ( = ?auto_8944 ?auto_8957 ) ) ( not ( = ?auto_8944 ?auto_8971 ) ) ( not ( = ?auto_8944 ?auto_8973 ) ) ( not ( = ?auto_8946 ?auto_8953 ) ) ( not ( = ?auto_8946 ?auto_8966 ) ) ( not ( = ?auto_8946 ?auto_8965 ) ) ( not ( = ?auto_8946 ?auto_8954 ) ) ( not ( = ?auto_8946 ?auto_8955 ) ) ( not ( = ?auto_8946 ?auto_8972 ) ) ( not ( = ?auto_8946 ?auto_8961 ) ) ( not ( = ?auto_8946 ?auto_8957 ) ) ( not ( = ?auto_8946 ?auto_8971 ) ) ( not ( = ?auto_8946 ?auto_8973 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_8934 ?auto_8935 ?auto_8936 ?auto_8937 ?auto_8938 ?auto_8941 ?auto_8939 ?auto_8943 ?auto_8942 ?auto_8940 ?auto_8945 )
      ( MAKE-1CRATE ?auto_8945 ?auto_8944 )
      ( MAKE-11CRATE-VERIFY ?auto_8934 ?auto_8935 ?auto_8936 ?auto_8937 ?auto_8938 ?auto_8941 ?auto_8939 ?auto_8943 ?auto_8942 ?auto_8940 ?auto_8945 ?auto_8944 ) )
  )

)

