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
      ?auto_845517 - SURFACE
      ?auto_845518 - SURFACE
    )
    :vars
    (
      ?auto_845519 - HOIST
      ?auto_845520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845519 ?auto_845520 ) ( SURFACE-AT ?auto_845517 ?auto_845520 ) ( CLEAR ?auto_845517 ) ( LIFTING ?auto_845519 ?auto_845518 ) ( IS-CRATE ?auto_845518 ) ( not ( = ?auto_845517 ?auto_845518 ) ) )
    :subtasks
    ( ( !DROP ?auto_845519 ?auto_845518 ?auto_845517 ?auto_845520 )
      ( MAKE-1CRATE-VERIFY ?auto_845517 ?auto_845518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845521 - SURFACE
      ?auto_845522 - SURFACE
    )
    :vars
    (
      ?auto_845523 - HOIST
      ?auto_845524 - PLACE
      ?auto_845525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845523 ?auto_845524 ) ( SURFACE-AT ?auto_845521 ?auto_845524 ) ( CLEAR ?auto_845521 ) ( IS-CRATE ?auto_845522 ) ( not ( = ?auto_845521 ?auto_845522 ) ) ( TRUCK-AT ?auto_845525 ?auto_845524 ) ( AVAILABLE ?auto_845523 ) ( IN ?auto_845522 ?auto_845525 ) )
    :subtasks
    ( ( !UNLOAD ?auto_845523 ?auto_845522 ?auto_845525 ?auto_845524 )
      ( MAKE-1CRATE ?auto_845521 ?auto_845522 )
      ( MAKE-1CRATE-VERIFY ?auto_845521 ?auto_845522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845526 - SURFACE
      ?auto_845527 - SURFACE
    )
    :vars
    (
      ?auto_845528 - HOIST
      ?auto_845529 - PLACE
      ?auto_845530 - TRUCK
      ?auto_845531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845528 ?auto_845529 ) ( SURFACE-AT ?auto_845526 ?auto_845529 ) ( CLEAR ?auto_845526 ) ( IS-CRATE ?auto_845527 ) ( not ( = ?auto_845526 ?auto_845527 ) ) ( AVAILABLE ?auto_845528 ) ( IN ?auto_845527 ?auto_845530 ) ( TRUCK-AT ?auto_845530 ?auto_845531 ) ( not ( = ?auto_845531 ?auto_845529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_845530 ?auto_845531 ?auto_845529 )
      ( MAKE-1CRATE ?auto_845526 ?auto_845527 )
      ( MAKE-1CRATE-VERIFY ?auto_845526 ?auto_845527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845532 - SURFACE
      ?auto_845533 - SURFACE
    )
    :vars
    (
      ?auto_845534 - HOIST
      ?auto_845535 - PLACE
      ?auto_845537 - TRUCK
      ?auto_845536 - PLACE
      ?auto_845538 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845534 ?auto_845535 ) ( SURFACE-AT ?auto_845532 ?auto_845535 ) ( CLEAR ?auto_845532 ) ( IS-CRATE ?auto_845533 ) ( not ( = ?auto_845532 ?auto_845533 ) ) ( AVAILABLE ?auto_845534 ) ( TRUCK-AT ?auto_845537 ?auto_845536 ) ( not ( = ?auto_845536 ?auto_845535 ) ) ( HOIST-AT ?auto_845538 ?auto_845536 ) ( LIFTING ?auto_845538 ?auto_845533 ) ( not ( = ?auto_845534 ?auto_845538 ) ) )
    :subtasks
    ( ( !LOAD ?auto_845538 ?auto_845533 ?auto_845537 ?auto_845536 )
      ( MAKE-1CRATE ?auto_845532 ?auto_845533 )
      ( MAKE-1CRATE-VERIFY ?auto_845532 ?auto_845533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845539 - SURFACE
      ?auto_845540 - SURFACE
    )
    :vars
    (
      ?auto_845543 - HOIST
      ?auto_845545 - PLACE
      ?auto_845544 - TRUCK
      ?auto_845542 - PLACE
      ?auto_845541 - HOIST
      ?auto_845546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845543 ?auto_845545 ) ( SURFACE-AT ?auto_845539 ?auto_845545 ) ( CLEAR ?auto_845539 ) ( IS-CRATE ?auto_845540 ) ( not ( = ?auto_845539 ?auto_845540 ) ) ( AVAILABLE ?auto_845543 ) ( TRUCK-AT ?auto_845544 ?auto_845542 ) ( not ( = ?auto_845542 ?auto_845545 ) ) ( HOIST-AT ?auto_845541 ?auto_845542 ) ( not ( = ?auto_845543 ?auto_845541 ) ) ( AVAILABLE ?auto_845541 ) ( SURFACE-AT ?auto_845540 ?auto_845542 ) ( ON ?auto_845540 ?auto_845546 ) ( CLEAR ?auto_845540 ) ( not ( = ?auto_845539 ?auto_845546 ) ) ( not ( = ?auto_845540 ?auto_845546 ) ) )
    :subtasks
    ( ( !LIFT ?auto_845541 ?auto_845540 ?auto_845546 ?auto_845542 )
      ( MAKE-1CRATE ?auto_845539 ?auto_845540 )
      ( MAKE-1CRATE-VERIFY ?auto_845539 ?auto_845540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845547 - SURFACE
      ?auto_845548 - SURFACE
    )
    :vars
    (
      ?auto_845554 - HOIST
      ?auto_845551 - PLACE
      ?auto_845553 - PLACE
      ?auto_845552 - HOIST
      ?auto_845549 - SURFACE
      ?auto_845550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845554 ?auto_845551 ) ( SURFACE-AT ?auto_845547 ?auto_845551 ) ( CLEAR ?auto_845547 ) ( IS-CRATE ?auto_845548 ) ( not ( = ?auto_845547 ?auto_845548 ) ) ( AVAILABLE ?auto_845554 ) ( not ( = ?auto_845553 ?auto_845551 ) ) ( HOIST-AT ?auto_845552 ?auto_845553 ) ( not ( = ?auto_845554 ?auto_845552 ) ) ( AVAILABLE ?auto_845552 ) ( SURFACE-AT ?auto_845548 ?auto_845553 ) ( ON ?auto_845548 ?auto_845549 ) ( CLEAR ?auto_845548 ) ( not ( = ?auto_845547 ?auto_845549 ) ) ( not ( = ?auto_845548 ?auto_845549 ) ) ( TRUCK-AT ?auto_845550 ?auto_845551 ) )
    :subtasks
    ( ( !DRIVE ?auto_845550 ?auto_845551 ?auto_845553 )
      ( MAKE-1CRATE ?auto_845547 ?auto_845548 )
      ( MAKE-1CRATE-VERIFY ?auto_845547 ?auto_845548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845564 - SURFACE
      ?auto_845565 - SURFACE
      ?auto_845566 - SURFACE
    )
    :vars
    (
      ?auto_845567 - HOIST
      ?auto_845568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845567 ?auto_845568 ) ( SURFACE-AT ?auto_845565 ?auto_845568 ) ( CLEAR ?auto_845565 ) ( LIFTING ?auto_845567 ?auto_845566 ) ( IS-CRATE ?auto_845566 ) ( not ( = ?auto_845565 ?auto_845566 ) ) ( ON ?auto_845565 ?auto_845564 ) ( not ( = ?auto_845564 ?auto_845565 ) ) ( not ( = ?auto_845564 ?auto_845566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845565 ?auto_845566 )
      ( MAKE-2CRATE-VERIFY ?auto_845564 ?auto_845565 ?auto_845566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845574 - SURFACE
      ?auto_845575 - SURFACE
      ?auto_845576 - SURFACE
    )
    :vars
    (
      ?auto_845577 - HOIST
      ?auto_845578 - PLACE
      ?auto_845579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845577 ?auto_845578 ) ( SURFACE-AT ?auto_845575 ?auto_845578 ) ( CLEAR ?auto_845575 ) ( IS-CRATE ?auto_845576 ) ( not ( = ?auto_845575 ?auto_845576 ) ) ( TRUCK-AT ?auto_845579 ?auto_845578 ) ( AVAILABLE ?auto_845577 ) ( IN ?auto_845576 ?auto_845579 ) ( ON ?auto_845575 ?auto_845574 ) ( not ( = ?auto_845574 ?auto_845575 ) ) ( not ( = ?auto_845574 ?auto_845576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845575 ?auto_845576 )
      ( MAKE-2CRATE-VERIFY ?auto_845574 ?auto_845575 ?auto_845576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845580 - SURFACE
      ?auto_845581 - SURFACE
    )
    :vars
    (
      ?auto_845582 - HOIST
      ?auto_845584 - PLACE
      ?auto_845583 - TRUCK
      ?auto_845585 - SURFACE
      ?auto_845586 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845582 ?auto_845584 ) ( SURFACE-AT ?auto_845580 ?auto_845584 ) ( CLEAR ?auto_845580 ) ( IS-CRATE ?auto_845581 ) ( not ( = ?auto_845580 ?auto_845581 ) ) ( AVAILABLE ?auto_845582 ) ( IN ?auto_845581 ?auto_845583 ) ( ON ?auto_845580 ?auto_845585 ) ( not ( = ?auto_845585 ?auto_845580 ) ) ( not ( = ?auto_845585 ?auto_845581 ) ) ( TRUCK-AT ?auto_845583 ?auto_845586 ) ( not ( = ?auto_845586 ?auto_845584 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_845583 ?auto_845586 ?auto_845584 )
      ( MAKE-2CRATE ?auto_845585 ?auto_845580 ?auto_845581 )
      ( MAKE-1CRATE-VERIFY ?auto_845580 ?auto_845581 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845587 - SURFACE
      ?auto_845588 - SURFACE
      ?auto_845589 - SURFACE
    )
    :vars
    (
      ?auto_845593 - HOIST
      ?auto_845590 - PLACE
      ?auto_845592 - TRUCK
      ?auto_845591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845593 ?auto_845590 ) ( SURFACE-AT ?auto_845588 ?auto_845590 ) ( CLEAR ?auto_845588 ) ( IS-CRATE ?auto_845589 ) ( not ( = ?auto_845588 ?auto_845589 ) ) ( AVAILABLE ?auto_845593 ) ( IN ?auto_845589 ?auto_845592 ) ( ON ?auto_845588 ?auto_845587 ) ( not ( = ?auto_845587 ?auto_845588 ) ) ( not ( = ?auto_845587 ?auto_845589 ) ) ( TRUCK-AT ?auto_845592 ?auto_845591 ) ( not ( = ?auto_845591 ?auto_845590 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845588 ?auto_845589 )
      ( MAKE-2CRATE-VERIFY ?auto_845587 ?auto_845588 ?auto_845589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845594 - SURFACE
      ?auto_845595 - SURFACE
    )
    :vars
    (
      ?auto_845599 - HOIST
      ?auto_845597 - PLACE
      ?auto_845596 - SURFACE
      ?auto_845600 - TRUCK
      ?auto_845598 - PLACE
      ?auto_845601 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845599 ?auto_845597 ) ( SURFACE-AT ?auto_845594 ?auto_845597 ) ( CLEAR ?auto_845594 ) ( IS-CRATE ?auto_845595 ) ( not ( = ?auto_845594 ?auto_845595 ) ) ( AVAILABLE ?auto_845599 ) ( ON ?auto_845594 ?auto_845596 ) ( not ( = ?auto_845596 ?auto_845594 ) ) ( not ( = ?auto_845596 ?auto_845595 ) ) ( TRUCK-AT ?auto_845600 ?auto_845598 ) ( not ( = ?auto_845598 ?auto_845597 ) ) ( HOIST-AT ?auto_845601 ?auto_845598 ) ( LIFTING ?auto_845601 ?auto_845595 ) ( not ( = ?auto_845599 ?auto_845601 ) ) )
    :subtasks
    ( ( !LOAD ?auto_845601 ?auto_845595 ?auto_845600 ?auto_845598 )
      ( MAKE-2CRATE ?auto_845596 ?auto_845594 ?auto_845595 )
      ( MAKE-1CRATE-VERIFY ?auto_845594 ?auto_845595 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845602 - SURFACE
      ?auto_845603 - SURFACE
      ?auto_845604 - SURFACE
    )
    :vars
    (
      ?auto_845607 - HOIST
      ?auto_845609 - PLACE
      ?auto_845608 - TRUCK
      ?auto_845605 - PLACE
      ?auto_845606 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845607 ?auto_845609 ) ( SURFACE-AT ?auto_845603 ?auto_845609 ) ( CLEAR ?auto_845603 ) ( IS-CRATE ?auto_845604 ) ( not ( = ?auto_845603 ?auto_845604 ) ) ( AVAILABLE ?auto_845607 ) ( ON ?auto_845603 ?auto_845602 ) ( not ( = ?auto_845602 ?auto_845603 ) ) ( not ( = ?auto_845602 ?auto_845604 ) ) ( TRUCK-AT ?auto_845608 ?auto_845605 ) ( not ( = ?auto_845605 ?auto_845609 ) ) ( HOIST-AT ?auto_845606 ?auto_845605 ) ( LIFTING ?auto_845606 ?auto_845604 ) ( not ( = ?auto_845607 ?auto_845606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845603 ?auto_845604 )
      ( MAKE-2CRATE-VERIFY ?auto_845602 ?auto_845603 ?auto_845604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845610 - SURFACE
      ?auto_845611 - SURFACE
    )
    :vars
    (
      ?auto_845613 - HOIST
      ?auto_845614 - PLACE
      ?auto_845612 - SURFACE
      ?auto_845617 - TRUCK
      ?auto_845615 - PLACE
      ?auto_845616 - HOIST
      ?auto_845618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845613 ?auto_845614 ) ( SURFACE-AT ?auto_845610 ?auto_845614 ) ( CLEAR ?auto_845610 ) ( IS-CRATE ?auto_845611 ) ( not ( = ?auto_845610 ?auto_845611 ) ) ( AVAILABLE ?auto_845613 ) ( ON ?auto_845610 ?auto_845612 ) ( not ( = ?auto_845612 ?auto_845610 ) ) ( not ( = ?auto_845612 ?auto_845611 ) ) ( TRUCK-AT ?auto_845617 ?auto_845615 ) ( not ( = ?auto_845615 ?auto_845614 ) ) ( HOIST-AT ?auto_845616 ?auto_845615 ) ( not ( = ?auto_845613 ?auto_845616 ) ) ( AVAILABLE ?auto_845616 ) ( SURFACE-AT ?auto_845611 ?auto_845615 ) ( ON ?auto_845611 ?auto_845618 ) ( CLEAR ?auto_845611 ) ( not ( = ?auto_845610 ?auto_845618 ) ) ( not ( = ?auto_845611 ?auto_845618 ) ) ( not ( = ?auto_845612 ?auto_845618 ) ) )
    :subtasks
    ( ( !LIFT ?auto_845616 ?auto_845611 ?auto_845618 ?auto_845615 )
      ( MAKE-2CRATE ?auto_845612 ?auto_845610 ?auto_845611 )
      ( MAKE-1CRATE-VERIFY ?auto_845610 ?auto_845611 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845619 - SURFACE
      ?auto_845620 - SURFACE
      ?auto_845621 - SURFACE
    )
    :vars
    (
      ?auto_845622 - HOIST
      ?auto_845624 - PLACE
      ?auto_845623 - TRUCK
      ?auto_845627 - PLACE
      ?auto_845626 - HOIST
      ?auto_845625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845622 ?auto_845624 ) ( SURFACE-AT ?auto_845620 ?auto_845624 ) ( CLEAR ?auto_845620 ) ( IS-CRATE ?auto_845621 ) ( not ( = ?auto_845620 ?auto_845621 ) ) ( AVAILABLE ?auto_845622 ) ( ON ?auto_845620 ?auto_845619 ) ( not ( = ?auto_845619 ?auto_845620 ) ) ( not ( = ?auto_845619 ?auto_845621 ) ) ( TRUCK-AT ?auto_845623 ?auto_845627 ) ( not ( = ?auto_845627 ?auto_845624 ) ) ( HOIST-AT ?auto_845626 ?auto_845627 ) ( not ( = ?auto_845622 ?auto_845626 ) ) ( AVAILABLE ?auto_845626 ) ( SURFACE-AT ?auto_845621 ?auto_845627 ) ( ON ?auto_845621 ?auto_845625 ) ( CLEAR ?auto_845621 ) ( not ( = ?auto_845620 ?auto_845625 ) ) ( not ( = ?auto_845621 ?auto_845625 ) ) ( not ( = ?auto_845619 ?auto_845625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845620 ?auto_845621 )
      ( MAKE-2CRATE-VERIFY ?auto_845619 ?auto_845620 ?auto_845621 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845628 - SURFACE
      ?auto_845629 - SURFACE
    )
    :vars
    (
      ?auto_845635 - HOIST
      ?auto_845630 - PLACE
      ?auto_845633 - SURFACE
      ?auto_845631 - PLACE
      ?auto_845632 - HOIST
      ?auto_845636 - SURFACE
      ?auto_845634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845635 ?auto_845630 ) ( SURFACE-AT ?auto_845628 ?auto_845630 ) ( CLEAR ?auto_845628 ) ( IS-CRATE ?auto_845629 ) ( not ( = ?auto_845628 ?auto_845629 ) ) ( AVAILABLE ?auto_845635 ) ( ON ?auto_845628 ?auto_845633 ) ( not ( = ?auto_845633 ?auto_845628 ) ) ( not ( = ?auto_845633 ?auto_845629 ) ) ( not ( = ?auto_845631 ?auto_845630 ) ) ( HOIST-AT ?auto_845632 ?auto_845631 ) ( not ( = ?auto_845635 ?auto_845632 ) ) ( AVAILABLE ?auto_845632 ) ( SURFACE-AT ?auto_845629 ?auto_845631 ) ( ON ?auto_845629 ?auto_845636 ) ( CLEAR ?auto_845629 ) ( not ( = ?auto_845628 ?auto_845636 ) ) ( not ( = ?auto_845629 ?auto_845636 ) ) ( not ( = ?auto_845633 ?auto_845636 ) ) ( TRUCK-AT ?auto_845634 ?auto_845630 ) )
    :subtasks
    ( ( !DRIVE ?auto_845634 ?auto_845630 ?auto_845631 )
      ( MAKE-2CRATE ?auto_845633 ?auto_845628 ?auto_845629 )
      ( MAKE-1CRATE-VERIFY ?auto_845628 ?auto_845629 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845637 - SURFACE
      ?auto_845638 - SURFACE
      ?auto_845639 - SURFACE
    )
    :vars
    (
      ?auto_845640 - HOIST
      ?auto_845644 - PLACE
      ?auto_845643 - PLACE
      ?auto_845641 - HOIST
      ?auto_845645 - SURFACE
      ?auto_845642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845640 ?auto_845644 ) ( SURFACE-AT ?auto_845638 ?auto_845644 ) ( CLEAR ?auto_845638 ) ( IS-CRATE ?auto_845639 ) ( not ( = ?auto_845638 ?auto_845639 ) ) ( AVAILABLE ?auto_845640 ) ( ON ?auto_845638 ?auto_845637 ) ( not ( = ?auto_845637 ?auto_845638 ) ) ( not ( = ?auto_845637 ?auto_845639 ) ) ( not ( = ?auto_845643 ?auto_845644 ) ) ( HOIST-AT ?auto_845641 ?auto_845643 ) ( not ( = ?auto_845640 ?auto_845641 ) ) ( AVAILABLE ?auto_845641 ) ( SURFACE-AT ?auto_845639 ?auto_845643 ) ( ON ?auto_845639 ?auto_845645 ) ( CLEAR ?auto_845639 ) ( not ( = ?auto_845638 ?auto_845645 ) ) ( not ( = ?auto_845639 ?auto_845645 ) ) ( not ( = ?auto_845637 ?auto_845645 ) ) ( TRUCK-AT ?auto_845642 ?auto_845644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845638 ?auto_845639 )
      ( MAKE-2CRATE-VERIFY ?auto_845637 ?auto_845638 ?auto_845639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845646 - SURFACE
      ?auto_845647 - SURFACE
    )
    :vars
    (
      ?auto_845650 - HOIST
      ?auto_845651 - PLACE
      ?auto_845653 - SURFACE
      ?auto_845652 - PLACE
      ?auto_845648 - HOIST
      ?auto_845649 - SURFACE
      ?auto_845654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845650 ?auto_845651 ) ( IS-CRATE ?auto_845647 ) ( not ( = ?auto_845646 ?auto_845647 ) ) ( not ( = ?auto_845653 ?auto_845646 ) ) ( not ( = ?auto_845653 ?auto_845647 ) ) ( not ( = ?auto_845652 ?auto_845651 ) ) ( HOIST-AT ?auto_845648 ?auto_845652 ) ( not ( = ?auto_845650 ?auto_845648 ) ) ( AVAILABLE ?auto_845648 ) ( SURFACE-AT ?auto_845647 ?auto_845652 ) ( ON ?auto_845647 ?auto_845649 ) ( CLEAR ?auto_845647 ) ( not ( = ?auto_845646 ?auto_845649 ) ) ( not ( = ?auto_845647 ?auto_845649 ) ) ( not ( = ?auto_845653 ?auto_845649 ) ) ( TRUCK-AT ?auto_845654 ?auto_845651 ) ( SURFACE-AT ?auto_845653 ?auto_845651 ) ( CLEAR ?auto_845653 ) ( LIFTING ?auto_845650 ?auto_845646 ) ( IS-CRATE ?auto_845646 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845653 ?auto_845646 )
      ( MAKE-2CRATE ?auto_845653 ?auto_845646 ?auto_845647 )
      ( MAKE-1CRATE-VERIFY ?auto_845646 ?auto_845647 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845655 - SURFACE
      ?auto_845656 - SURFACE
      ?auto_845657 - SURFACE
    )
    :vars
    (
      ?auto_845663 - HOIST
      ?auto_845659 - PLACE
      ?auto_845661 - PLACE
      ?auto_845660 - HOIST
      ?auto_845658 - SURFACE
      ?auto_845662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845663 ?auto_845659 ) ( IS-CRATE ?auto_845657 ) ( not ( = ?auto_845656 ?auto_845657 ) ) ( not ( = ?auto_845655 ?auto_845656 ) ) ( not ( = ?auto_845655 ?auto_845657 ) ) ( not ( = ?auto_845661 ?auto_845659 ) ) ( HOIST-AT ?auto_845660 ?auto_845661 ) ( not ( = ?auto_845663 ?auto_845660 ) ) ( AVAILABLE ?auto_845660 ) ( SURFACE-AT ?auto_845657 ?auto_845661 ) ( ON ?auto_845657 ?auto_845658 ) ( CLEAR ?auto_845657 ) ( not ( = ?auto_845656 ?auto_845658 ) ) ( not ( = ?auto_845657 ?auto_845658 ) ) ( not ( = ?auto_845655 ?auto_845658 ) ) ( TRUCK-AT ?auto_845662 ?auto_845659 ) ( SURFACE-AT ?auto_845655 ?auto_845659 ) ( CLEAR ?auto_845655 ) ( LIFTING ?auto_845663 ?auto_845656 ) ( IS-CRATE ?auto_845656 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845656 ?auto_845657 )
      ( MAKE-2CRATE-VERIFY ?auto_845655 ?auto_845656 ?auto_845657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845664 - SURFACE
      ?auto_845665 - SURFACE
    )
    :vars
    (
      ?auto_845667 - HOIST
      ?auto_845671 - PLACE
      ?auto_845668 - SURFACE
      ?auto_845669 - PLACE
      ?auto_845670 - HOIST
      ?auto_845666 - SURFACE
      ?auto_845672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845667 ?auto_845671 ) ( IS-CRATE ?auto_845665 ) ( not ( = ?auto_845664 ?auto_845665 ) ) ( not ( = ?auto_845668 ?auto_845664 ) ) ( not ( = ?auto_845668 ?auto_845665 ) ) ( not ( = ?auto_845669 ?auto_845671 ) ) ( HOIST-AT ?auto_845670 ?auto_845669 ) ( not ( = ?auto_845667 ?auto_845670 ) ) ( AVAILABLE ?auto_845670 ) ( SURFACE-AT ?auto_845665 ?auto_845669 ) ( ON ?auto_845665 ?auto_845666 ) ( CLEAR ?auto_845665 ) ( not ( = ?auto_845664 ?auto_845666 ) ) ( not ( = ?auto_845665 ?auto_845666 ) ) ( not ( = ?auto_845668 ?auto_845666 ) ) ( TRUCK-AT ?auto_845672 ?auto_845671 ) ( SURFACE-AT ?auto_845668 ?auto_845671 ) ( CLEAR ?auto_845668 ) ( IS-CRATE ?auto_845664 ) ( AVAILABLE ?auto_845667 ) ( IN ?auto_845664 ?auto_845672 ) )
    :subtasks
    ( ( !UNLOAD ?auto_845667 ?auto_845664 ?auto_845672 ?auto_845671 )
      ( MAKE-2CRATE ?auto_845668 ?auto_845664 ?auto_845665 )
      ( MAKE-1CRATE-VERIFY ?auto_845664 ?auto_845665 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845673 - SURFACE
      ?auto_845674 - SURFACE
      ?auto_845675 - SURFACE
    )
    :vars
    (
      ?auto_845679 - HOIST
      ?auto_845681 - PLACE
      ?auto_845676 - PLACE
      ?auto_845677 - HOIST
      ?auto_845680 - SURFACE
      ?auto_845678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845679 ?auto_845681 ) ( IS-CRATE ?auto_845675 ) ( not ( = ?auto_845674 ?auto_845675 ) ) ( not ( = ?auto_845673 ?auto_845674 ) ) ( not ( = ?auto_845673 ?auto_845675 ) ) ( not ( = ?auto_845676 ?auto_845681 ) ) ( HOIST-AT ?auto_845677 ?auto_845676 ) ( not ( = ?auto_845679 ?auto_845677 ) ) ( AVAILABLE ?auto_845677 ) ( SURFACE-AT ?auto_845675 ?auto_845676 ) ( ON ?auto_845675 ?auto_845680 ) ( CLEAR ?auto_845675 ) ( not ( = ?auto_845674 ?auto_845680 ) ) ( not ( = ?auto_845675 ?auto_845680 ) ) ( not ( = ?auto_845673 ?auto_845680 ) ) ( TRUCK-AT ?auto_845678 ?auto_845681 ) ( SURFACE-AT ?auto_845673 ?auto_845681 ) ( CLEAR ?auto_845673 ) ( IS-CRATE ?auto_845674 ) ( AVAILABLE ?auto_845679 ) ( IN ?auto_845674 ?auto_845678 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845674 ?auto_845675 )
      ( MAKE-2CRATE-VERIFY ?auto_845673 ?auto_845674 ?auto_845675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845718 - SURFACE
      ?auto_845719 - SURFACE
    )
    :vars
    (
      ?auto_845726 - HOIST
      ?auto_845723 - PLACE
      ?auto_845725 - SURFACE
      ?auto_845722 - PLACE
      ?auto_845724 - HOIST
      ?auto_845721 - SURFACE
      ?auto_845720 - TRUCK
      ?auto_845727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845726 ?auto_845723 ) ( SURFACE-AT ?auto_845718 ?auto_845723 ) ( CLEAR ?auto_845718 ) ( IS-CRATE ?auto_845719 ) ( not ( = ?auto_845718 ?auto_845719 ) ) ( AVAILABLE ?auto_845726 ) ( ON ?auto_845718 ?auto_845725 ) ( not ( = ?auto_845725 ?auto_845718 ) ) ( not ( = ?auto_845725 ?auto_845719 ) ) ( not ( = ?auto_845722 ?auto_845723 ) ) ( HOIST-AT ?auto_845724 ?auto_845722 ) ( not ( = ?auto_845726 ?auto_845724 ) ) ( AVAILABLE ?auto_845724 ) ( SURFACE-AT ?auto_845719 ?auto_845722 ) ( ON ?auto_845719 ?auto_845721 ) ( CLEAR ?auto_845719 ) ( not ( = ?auto_845718 ?auto_845721 ) ) ( not ( = ?auto_845719 ?auto_845721 ) ) ( not ( = ?auto_845725 ?auto_845721 ) ) ( TRUCK-AT ?auto_845720 ?auto_845727 ) ( not ( = ?auto_845727 ?auto_845723 ) ) ( not ( = ?auto_845722 ?auto_845727 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_845720 ?auto_845727 ?auto_845723 )
      ( MAKE-1CRATE ?auto_845718 ?auto_845719 )
      ( MAKE-1CRATE-VERIFY ?auto_845718 ?auto_845719 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845758 - SURFACE
      ?auto_845759 - SURFACE
      ?auto_845760 - SURFACE
      ?auto_845757 - SURFACE
    )
    :vars
    (
      ?auto_845761 - HOIST
      ?auto_845762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845761 ?auto_845762 ) ( SURFACE-AT ?auto_845760 ?auto_845762 ) ( CLEAR ?auto_845760 ) ( LIFTING ?auto_845761 ?auto_845757 ) ( IS-CRATE ?auto_845757 ) ( not ( = ?auto_845760 ?auto_845757 ) ) ( ON ?auto_845759 ?auto_845758 ) ( ON ?auto_845760 ?auto_845759 ) ( not ( = ?auto_845758 ?auto_845759 ) ) ( not ( = ?auto_845758 ?auto_845760 ) ) ( not ( = ?auto_845758 ?auto_845757 ) ) ( not ( = ?auto_845759 ?auto_845760 ) ) ( not ( = ?auto_845759 ?auto_845757 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845760 ?auto_845757 )
      ( MAKE-3CRATE-VERIFY ?auto_845758 ?auto_845759 ?auto_845760 ?auto_845757 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845775 - SURFACE
      ?auto_845776 - SURFACE
      ?auto_845777 - SURFACE
      ?auto_845774 - SURFACE
    )
    :vars
    (
      ?auto_845780 - HOIST
      ?auto_845779 - PLACE
      ?auto_845778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845780 ?auto_845779 ) ( SURFACE-AT ?auto_845777 ?auto_845779 ) ( CLEAR ?auto_845777 ) ( IS-CRATE ?auto_845774 ) ( not ( = ?auto_845777 ?auto_845774 ) ) ( TRUCK-AT ?auto_845778 ?auto_845779 ) ( AVAILABLE ?auto_845780 ) ( IN ?auto_845774 ?auto_845778 ) ( ON ?auto_845777 ?auto_845776 ) ( not ( = ?auto_845776 ?auto_845777 ) ) ( not ( = ?auto_845776 ?auto_845774 ) ) ( ON ?auto_845776 ?auto_845775 ) ( not ( = ?auto_845775 ?auto_845776 ) ) ( not ( = ?auto_845775 ?auto_845777 ) ) ( not ( = ?auto_845775 ?auto_845774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845776 ?auto_845777 ?auto_845774 )
      ( MAKE-3CRATE-VERIFY ?auto_845775 ?auto_845776 ?auto_845777 ?auto_845774 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845796 - SURFACE
      ?auto_845797 - SURFACE
      ?auto_845798 - SURFACE
      ?auto_845795 - SURFACE
    )
    :vars
    (
      ?auto_845799 - HOIST
      ?auto_845802 - PLACE
      ?auto_845800 - TRUCK
      ?auto_845801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845799 ?auto_845802 ) ( SURFACE-AT ?auto_845798 ?auto_845802 ) ( CLEAR ?auto_845798 ) ( IS-CRATE ?auto_845795 ) ( not ( = ?auto_845798 ?auto_845795 ) ) ( AVAILABLE ?auto_845799 ) ( IN ?auto_845795 ?auto_845800 ) ( ON ?auto_845798 ?auto_845797 ) ( not ( = ?auto_845797 ?auto_845798 ) ) ( not ( = ?auto_845797 ?auto_845795 ) ) ( TRUCK-AT ?auto_845800 ?auto_845801 ) ( not ( = ?auto_845801 ?auto_845802 ) ) ( ON ?auto_845797 ?auto_845796 ) ( not ( = ?auto_845796 ?auto_845797 ) ) ( not ( = ?auto_845796 ?auto_845798 ) ) ( not ( = ?auto_845796 ?auto_845795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845797 ?auto_845798 ?auto_845795 )
      ( MAKE-3CRATE-VERIFY ?auto_845796 ?auto_845797 ?auto_845798 ?auto_845795 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845820 - SURFACE
      ?auto_845821 - SURFACE
      ?auto_845822 - SURFACE
      ?auto_845819 - SURFACE
    )
    :vars
    (
      ?auto_845826 - HOIST
      ?auto_845823 - PLACE
      ?auto_845827 - TRUCK
      ?auto_845825 - PLACE
      ?auto_845824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845826 ?auto_845823 ) ( SURFACE-AT ?auto_845822 ?auto_845823 ) ( CLEAR ?auto_845822 ) ( IS-CRATE ?auto_845819 ) ( not ( = ?auto_845822 ?auto_845819 ) ) ( AVAILABLE ?auto_845826 ) ( ON ?auto_845822 ?auto_845821 ) ( not ( = ?auto_845821 ?auto_845822 ) ) ( not ( = ?auto_845821 ?auto_845819 ) ) ( TRUCK-AT ?auto_845827 ?auto_845825 ) ( not ( = ?auto_845825 ?auto_845823 ) ) ( HOIST-AT ?auto_845824 ?auto_845825 ) ( LIFTING ?auto_845824 ?auto_845819 ) ( not ( = ?auto_845826 ?auto_845824 ) ) ( ON ?auto_845821 ?auto_845820 ) ( not ( = ?auto_845820 ?auto_845821 ) ) ( not ( = ?auto_845820 ?auto_845822 ) ) ( not ( = ?auto_845820 ?auto_845819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845821 ?auto_845822 ?auto_845819 )
      ( MAKE-3CRATE-VERIFY ?auto_845820 ?auto_845821 ?auto_845822 ?auto_845819 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845847 - SURFACE
      ?auto_845848 - SURFACE
      ?auto_845849 - SURFACE
      ?auto_845846 - SURFACE
    )
    :vars
    (
      ?auto_845850 - HOIST
      ?auto_845851 - PLACE
      ?auto_845854 - TRUCK
      ?auto_845855 - PLACE
      ?auto_845853 - HOIST
      ?auto_845852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845850 ?auto_845851 ) ( SURFACE-AT ?auto_845849 ?auto_845851 ) ( CLEAR ?auto_845849 ) ( IS-CRATE ?auto_845846 ) ( not ( = ?auto_845849 ?auto_845846 ) ) ( AVAILABLE ?auto_845850 ) ( ON ?auto_845849 ?auto_845848 ) ( not ( = ?auto_845848 ?auto_845849 ) ) ( not ( = ?auto_845848 ?auto_845846 ) ) ( TRUCK-AT ?auto_845854 ?auto_845855 ) ( not ( = ?auto_845855 ?auto_845851 ) ) ( HOIST-AT ?auto_845853 ?auto_845855 ) ( not ( = ?auto_845850 ?auto_845853 ) ) ( AVAILABLE ?auto_845853 ) ( SURFACE-AT ?auto_845846 ?auto_845855 ) ( ON ?auto_845846 ?auto_845852 ) ( CLEAR ?auto_845846 ) ( not ( = ?auto_845849 ?auto_845852 ) ) ( not ( = ?auto_845846 ?auto_845852 ) ) ( not ( = ?auto_845848 ?auto_845852 ) ) ( ON ?auto_845848 ?auto_845847 ) ( not ( = ?auto_845847 ?auto_845848 ) ) ( not ( = ?auto_845847 ?auto_845849 ) ) ( not ( = ?auto_845847 ?auto_845846 ) ) ( not ( = ?auto_845847 ?auto_845852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845848 ?auto_845849 ?auto_845846 )
      ( MAKE-3CRATE-VERIFY ?auto_845847 ?auto_845848 ?auto_845849 ?auto_845846 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845875 - SURFACE
      ?auto_845876 - SURFACE
      ?auto_845877 - SURFACE
      ?auto_845874 - SURFACE
    )
    :vars
    (
      ?auto_845881 - HOIST
      ?auto_845879 - PLACE
      ?auto_845883 - PLACE
      ?auto_845878 - HOIST
      ?auto_845882 - SURFACE
      ?auto_845880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845881 ?auto_845879 ) ( SURFACE-AT ?auto_845877 ?auto_845879 ) ( CLEAR ?auto_845877 ) ( IS-CRATE ?auto_845874 ) ( not ( = ?auto_845877 ?auto_845874 ) ) ( AVAILABLE ?auto_845881 ) ( ON ?auto_845877 ?auto_845876 ) ( not ( = ?auto_845876 ?auto_845877 ) ) ( not ( = ?auto_845876 ?auto_845874 ) ) ( not ( = ?auto_845883 ?auto_845879 ) ) ( HOIST-AT ?auto_845878 ?auto_845883 ) ( not ( = ?auto_845881 ?auto_845878 ) ) ( AVAILABLE ?auto_845878 ) ( SURFACE-AT ?auto_845874 ?auto_845883 ) ( ON ?auto_845874 ?auto_845882 ) ( CLEAR ?auto_845874 ) ( not ( = ?auto_845877 ?auto_845882 ) ) ( not ( = ?auto_845874 ?auto_845882 ) ) ( not ( = ?auto_845876 ?auto_845882 ) ) ( TRUCK-AT ?auto_845880 ?auto_845879 ) ( ON ?auto_845876 ?auto_845875 ) ( not ( = ?auto_845875 ?auto_845876 ) ) ( not ( = ?auto_845875 ?auto_845877 ) ) ( not ( = ?auto_845875 ?auto_845874 ) ) ( not ( = ?auto_845875 ?auto_845882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845876 ?auto_845877 ?auto_845874 )
      ( MAKE-3CRATE-VERIFY ?auto_845875 ?auto_845876 ?auto_845877 ?auto_845874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845903 - SURFACE
      ?auto_845904 - SURFACE
      ?auto_845905 - SURFACE
      ?auto_845902 - SURFACE
    )
    :vars
    (
      ?auto_845910 - HOIST
      ?auto_845907 - PLACE
      ?auto_845906 - PLACE
      ?auto_845911 - HOIST
      ?auto_845909 - SURFACE
      ?auto_845908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845910 ?auto_845907 ) ( IS-CRATE ?auto_845902 ) ( not ( = ?auto_845905 ?auto_845902 ) ) ( not ( = ?auto_845904 ?auto_845905 ) ) ( not ( = ?auto_845904 ?auto_845902 ) ) ( not ( = ?auto_845906 ?auto_845907 ) ) ( HOIST-AT ?auto_845911 ?auto_845906 ) ( not ( = ?auto_845910 ?auto_845911 ) ) ( AVAILABLE ?auto_845911 ) ( SURFACE-AT ?auto_845902 ?auto_845906 ) ( ON ?auto_845902 ?auto_845909 ) ( CLEAR ?auto_845902 ) ( not ( = ?auto_845905 ?auto_845909 ) ) ( not ( = ?auto_845902 ?auto_845909 ) ) ( not ( = ?auto_845904 ?auto_845909 ) ) ( TRUCK-AT ?auto_845908 ?auto_845907 ) ( SURFACE-AT ?auto_845904 ?auto_845907 ) ( CLEAR ?auto_845904 ) ( LIFTING ?auto_845910 ?auto_845905 ) ( IS-CRATE ?auto_845905 ) ( ON ?auto_845904 ?auto_845903 ) ( not ( = ?auto_845903 ?auto_845904 ) ) ( not ( = ?auto_845903 ?auto_845905 ) ) ( not ( = ?auto_845903 ?auto_845902 ) ) ( not ( = ?auto_845903 ?auto_845909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845904 ?auto_845905 ?auto_845902 )
      ( MAKE-3CRATE-VERIFY ?auto_845903 ?auto_845904 ?auto_845905 ?auto_845902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845931 - SURFACE
      ?auto_845932 - SURFACE
      ?auto_845933 - SURFACE
      ?auto_845930 - SURFACE
    )
    :vars
    (
      ?auto_845934 - HOIST
      ?auto_845936 - PLACE
      ?auto_845935 - PLACE
      ?auto_845938 - HOIST
      ?auto_845939 - SURFACE
      ?auto_845937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845934 ?auto_845936 ) ( IS-CRATE ?auto_845930 ) ( not ( = ?auto_845933 ?auto_845930 ) ) ( not ( = ?auto_845932 ?auto_845933 ) ) ( not ( = ?auto_845932 ?auto_845930 ) ) ( not ( = ?auto_845935 ?auto_845936 ) ) ( HOIST-AT ?auto_845938 ?auto_845935 ) ( not ( = ?auto_845934 ?auto_845938 ) ) ( AVAILABLE ?auto_845938 ) ( SURFACE-AT ?auto_845930 ?auto_845935 ) ( ON ?auto_845930 ?auto_845939 ) ( CLEAR ?auto_845930 ) ( not ( = ?auto_845933 ?auto_845939 ) ) ( not ( = ?auto_845930 ?auto_845939 ) ) ( not ( = ?auto_845932 ?auto_845939 ) ) ( TRUCK-AT ?auto_845937 ?auto_845936 ) ( SURFACE-AT ?auto_845932 ?auto_845936 ) ( CLEAR ?auto_845932 ) ( IS-CRATE ?auto_845933 ) ( AVAILABLE ?auto_845934 ) ( IN ?auto_845933 ?auto_845937 ) ( ON ?auto_845932 ?auto_845931 ) ( not ( = ?auto_845931 ?auto_845932 ) ) ( not ( = ?auto_845931 ?auto_845933 ) ) ( not ( = ?auto_845931 ?auto_845930 ) ) ( not ( = ?auto_845931 ?auto_845939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845932 ?auto_845933 ?auto_845930 )
      ( MAKE-3CRATE-VERIFY ?auto_845931 ?auto_845932 ?auto_845933 ?auto_845930 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846222 - SURFACE
      ?auto_846223 - SURFACE
      ?auto_846224 - SURFACE
      ?auto_846221 - SURFACE
      ?auto_846225 - SURFACE
    )
    :vars
    (
      ?auto_846227 - HOIST
      ?auto_846226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846227 ?auto_846226 ) ( SURFACE-AT ?auto_846221 ?auto_846226 ) ( CLEAR ?auto_846221 ) ( LIFTING ?auto_846227 ?auto_846225 ) ( IS-CRATE ?auto_846225 ) ( not ( = ?auto_846221 ?auto_846225 ) ) ( ON ?auto_846223 ?auto_846222 ) ( ON ?auto_846224 ?auto_846223 ) ( ON ?auto_846221 ?auto_846224 ) ( not ( = ?auto_846222 ?auto_846223 ) ) ( not ( = ?auto_846222 ?auto_846224 ) ) ( not ( = ?auto_846222 ?auto_846221 ) ) ( not ( = ?auto_846222 ?auto_846225 ) ) ( not ( = ?auto_846223 ?auto_846224 ) ) ( not ( = ?auto_846223 ?auto_846221 ) ) ( not ( = ?auto_846223 ?auto_846225 ) ) ( not ( = ?auto_846224 ?auto_846221 ) ) ( not ( = ?auto_846224 ?auto_846225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_846221 ?auto_846225 )
      ( MAKE-4CRATE-VERIFY ?auto_846222 ?auto_846223 ?auto_846224 ?auto_846221 ?auto_846225 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846247 - SURFACE
      ?auto_846248 - SURFACE
      ?auto_846249 - SURFACE
      ?auto_846246 - SURFACE
      ?auto_846250 - SURFACE
    )
    :vars
    (
      ?auto_846251 - HOIST
      ?auto_846253 - PLACE
      ?auto_846252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846251 ?auto_846253 ) ( SURFACE-AT ?auto_846246 ?auto_846253 ) ( CLEAR ?auto_846246 ) ( IS-CRATE ?auto_846250 ) ( not ( = ?auto_846246 ?auto_846250 ) ) ( TRUCK-AT ?auto_846252 ?auto_846253 ) ( AVAILABLE ?auto_846251 ) ( IN ?auto_846250 ?auto_846252 ) ( ON ?auto_846246 ?auto_846249 ) ( not ( = ?auto_846249 ?auto_846246 ) ) ( not ( = ?auto_846249 ?auto_846250 ) ) ( ON ?auto_846248 ?auto_846247 ) ( ON ?auto_846249 ?auto_846248 ) ( not ( = ?auto_846247 ?auto_846248 ) ) ( not ( = ?auto_846247 ?auto_846249 ) ) ( not ( = ?auto_846247 ?auto_846246 ) ) ( not ( = ?auto_846247 ?auto_846250 ) ) ( not ( = ?auto_846248 ?auto_846249 ) ) ( not ( = ?auto_846248 ?auto_846246 ) ) ( not ( = ?auto_846248 ?auto_846250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846249 ?auto_846246 ?auto_846250 )
      ( MAKE-4CRATE-VERIFY ?auto_846247 ?auto_846248 ?auto_846249 ?auto_846246 ?auto_846250 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846277 - SURFACE
      ?auto_846278 - SURFACE
      ?auto_846279 - SURFACE
      ?auto_846276 - SURFACE
      ?auto_846280 - SURFACE
    )
    :vars
    (
      ?auto_846282 - HOIST
      ?auto_846284 - PLACE
      ?auto_846281 - TRUCK
      ?auto_846283 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846282 ?auto_846284 ) ( SURFACE-AT ?auto_846276 ?auto_846284 ) ( CLEAR ?auto_846276 ) ( IS-CRATE ?auto_846280 ) ( not ( = ?auto_846276 ?auto_846280 ) ) ( AVAILABLE ?auto_846282 ) ( IN ?auto_846280 ?auto_846281 ) ( ON ?auto_846276 ?auto_846279 ) ( not ( = ?auto_846279 ?auto_846276 ) ) ( not ( = ?auto_846279 ?auto_846280 ) ) ( TRUCK-AT ?auto_846281 ?auto_846283 ) ( not ( = ?auto_846283 ?auto_846284 ) ) ( ON ?auto_846278 ?auto_846277 ) ( ON ?auto_846279 ?auto_846278 ) ( not ( = ?auto_846277 ?auto_846278 ) ) ( not ( = ?auto_846277 ?auto_846279 ) ) ( not ( = ?auto_846277 ?auto_846276 ) ) ( not ( = ?auto_846277 ?auto_846280 ) ) ( not ( = ?auto_846278 ?auto_846279 ) ) ( not ( = ?auto_846278 ?auto_846276 ) ) ( not ( = ?auto_846278 ?auto_846280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846279 ?auto_846276 ?auto_846280 )
      ( MAKE-4CRATE-VERIFY ?auto_846277 ?auto_846278 ?auto_846279 ?auto_846276 ?auto_846280 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846311 - SURFACE
      ?auto_846312 - SURFACE
      ?auto_846313 - SURFACE
      ?auto_846310 - SURFACE
      ?auto_846314 - SURFACE
    )
    :vars
    (
      ?auto_846315 - HOIST
      ?auto_846316 - PLACE
      ?auto_846319 - TRUCK
      ?auto_846318 - PLACE
      ?auto_846317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_846315 ?auto_846316 ) ( SURFACE-AT ?auto_846310 ?auto_846316 ) ( CLEAR ?auto_846310 ) ( IS-CRATE ?auto_846314 ) ( not ( = ?auto_846310 ?auto_846314 ) ) ( AVAILABLE ?auto_846315 ) ( ON ?auto_846310 ?auto_846313 ) ( not ( = ?auto_846313 ?auto_846310 ) ) ( not ( = ?auto_846313 ?auto_846314 ) ) ( TRUCK-AT ?auto_846319 ?auto_846318 ) ( not ( = ?auto_846318 ?auto_846316 ) ) ( HOIST-AT ?auto_846317 ?auto_846318 ) ( LIFTING ?auto_846317 ?auto_846314 ) ( not ( = ?auto_846315 ?auto_846317 ) ) ( ON ?auto_846312 ?auto_846311 ) ( ON ?auto_846313 ?auto_846312 ) ( not ( = ?auto_846311 ?auto_846312 ) ) ( not ( = ?auto_846311 ?auto_846313 ) ) ( not ( = ?auto_846311 ?auto_846310 ) ) ( not ( = ?auto_846311 ?auto_846314 ) ) ( not ( = ?auto_846312 ?auto_846313 ) ) ( not ( = ?auto_846312 ?auto_846310 ) ) ( not ( = ?auto_846312 ?auto_846314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846313 ?auto_846310 ?auto_846314 )
      ( MAKE-4CRATE-VERIFY ?auto_846311 ?auto_846312 ?auto_846313 ?auto_846310 ?auto_846314 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846349 - SURFACE
      ?auto_846350 - SURFACE
      ?auto_846351 - SURFACE
      ?auto_846348 - SURFACE
      ?auto_846352 - SURFACE
    )
    :vars
    (
      ?auto_846353 - HOIST
      ?auto_846357 - PLACE
      ?auto_846354 - TRUCK
      ?auto_846355 - PLACE
      ?auto_846358 - HOIST
      ?auto_846356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846353 ?auto_846357 ) ( SURFACE-AT ?auto_846348 ?auto_846357 ) ( CLEAR ?auto_846348 ) ( IS-CRATE ?auto_846352 ) ( not ( = ?auto_846348 ?auto_846352 ) ) ( AVAILABLE ?auto_846353 ) ( ON ?auto_846348 ?auto_846351 ) ( not ( = ?auto_846351 ?auto_846348 ) ) ( not ( = ?auto_846351 ?auto_846352 ) ) ( TRUCK-AT ?auto_846354 ?auto_846355 ) ( not ( = ?auto_846355 ?auto_846357 ) ) ( HOIST-AT ?auto_846358 ?auto_846355 ) ( not ( = ?auto_846353 ?auto_846358 ) ) ( AVAILABLE ?auto_846358 ) ( SURFACE-AT ?auto_846352 ?auto_846355 ) ( ON ?auto_846352 ?auto_846356 ) ( CLEAR ?auto_846352 ) ( not ( = ?auto_846348 ?auto_846356 ) ) ( not ( = ?auto_846352 ?auto_846356 ) ) ( not ( = ?auto_846351 ?auto_846356 ) ) ( ON ?auto_846350 ?auto_846349 ) ( ON ?auto_846351 ?auto_846350 ) ( not ( = ?auto_846349 ?auto_846350 ) ) ( not ( = ?auto_846349 ?auto_846351 ) ) ( not ( = ?auto_846349 ?auto_846348 ) ) ( not ( = ?auto_846349 ?auto_846352 ) ) ( not ( = ?auto_846349 ?auto_846356 ) ) ( not ( = ?auto_846350 ?auto_846351 ) ) ( not ( = ?auto_846350 ?auto_846348 ) ) ( not ( = ?auto_846350 ?auto_846352 ) ) ( not ( = ?auto_846350 ?auto_846356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846351 ?auto_846348 ?auto_846352 )
      ( MAKE-4CRATE-VERIFY ?auto_846349 ?auto_846350 ?auto_846351 ?auto_846348 ?auto_846352 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846388 - SURFACE
      ?auto_846389 - SURFACE
      ?auto_846390 - SURFACE
      ?auto_846387 - SURFACE
      ?auto_846391 - SURFACE
    )
    :vars
    (
      ?auto_846395 - HOIST
      ?auto_846393 - PLACE
      ?auto_846394 - PLACE
      ?auto_846397 - HOIST
      ?auto_846396 - SURFACE
      ?auto_846392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846395 ?auto_846393 ) ( SURFACE-AT ?auto_846387 ?auto_846393 ) ( CLEAR ?auto_846387 ) ( IS-CRATE ?auto_846391 ) ( not ( = ?auto_846387 ?auto_846391 ) ) ( AVAILABLE ?auto_846395 ) ( ON ?auto_846387 ?auto_846390 ) ( not ( = ?auto_846390 ?auto_846387 ) ) ( not ( = ?auto_846390 ?auto_846391 ) ) ( not ( = ?auto_846394 ?auto_846393 ) ) ( HOIST-AT ?auto_846397 ?auto_846394 ) ( not ( = ?auto_846395 ?auto_846397 ) ) ( AVAILABLE ?auto_846397 ) ( SURFACE-AT ?auto_846391 ?auto_846394 ) ( ON ?auto_846391 ?auto_846396 ) ( CLEAR ?auto_846391 ) ( not ( = ?auto_846387 ?auto_846396 ) ) ( not ( = ?auto_846391 ?auto_846396 ) ) ( not ( = ?auto_846390 ?auto_846396 ) ) ( TRUCK-AT ?auto_846392 ?auto_846393 ) ( ON ?auto_846389 ?auto_846388 ) ( ON ?auto_846390 ?auto_846389 ) ( not ( = ?auto_846388 ?auto_846389 ) ) ( not ( = ?auto_846388 ?auto_846390 ) ) ( not ( = ?auto_846388 ?auto_846387 ) ) ( not ( = ?auto_846388 ?auto_846391 ) ) ( not ( = ?auto_846388 ?auto_846396 ) ) ( not ( = ?auto_846389 ?auto_846390 ) ) ( not ( = ?auto_846389 ?auto_846387 ) ) ( not ( = ?auto_846389 ?auto_846391 ) ) ( not ( = ?auto_846389 ?auto_846396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846390 ?auto_846387 ?auto_846391 )
      ( MAKE-4CRATE-VERIFY ?auto_846388 ?auto_846389 ?auto_846390 ?auto_846387 ?auto_846391 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846427 - SURFACE
      ?auto_846428 - SURFACE
      ?auto_846429 - SURFACE
      ?auto_846426 - SURFACE
      ?auto_846430 - SURFACE
    )
    :vars
    (
      ?auto_846435 - HOIST
      ?auto_846433 - PLACE
      ?auto_846431 - PLACE
      ?auto_846436 - HOIST
      ?auto_846432 - SURFACE
      ?auto_846434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846435 ?auto_846433 ) ( IS-CRATE ?auto_846430 ) ( not ( = ?auto_846426 ?auto_846430 ) ) ( not ( = ?auto_846429 ?auto_846426 ) ) ( not ( = ?auto_846429 ?auto_846430 ) ) ( not ( = ?auto_846431 ?auto_846433 ) ) ( HOIST-AT ?auto_846436 ?auto_846431 ) ( not ( = ?auto_846435 ?auto_846436 ) ) ( AVAILABLE ?auto_846436 ) ( SURFACE-AT ?auto_846430 ?auto_846431 ) ( ON ?auto_846430 ?auto_846432 ) ( CLEAR ?auto_846430 ) ( not ( = ?auto_846426 ?auto_846432 ) ) ( not ( = ?auto_846430 ?auto_846432 ) ) ( not ( = ?auto_846429 ?auto_846432 ) ) ( TRUCK-AT ?auto_846434 ?auto_846433 ) ( SURFACE-AT ?auto_846429 ?auto_846433 ) ( CLEAR ?auto_846429 ) ( LIFTING ?auto_846435 ?auto_846426 ) ( IS-CRATE ?auto_846426 ) ( ON ?auto_846428 ?auto_846427 ) ( ON ?auto_846429 ?auto_846428 ) ( not ( = ?auto_846427 ?auto_846428 ) ) ( not ( = ?auto_846427 ?auto_846429 ) ) ( not ( = ?auto_846427 ?auto_846426 ) ) ( not ( = ?auto_846427 ?auto_846430 ) ) ( not ( = ?auto_846427 ?auto_846432 ) ) ( not ( = ?auto_846428 ?auto_846429 ) ) ( not ( = ?auto_846428 ?auto_846426 ) ) ( not ( = ?auto_846428 ?auto_846430 ) ) ( not ( = ?auto_846428 ?auto_846432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846429 ?auto_846426 ?auto_846430 )
      ( MAKE-4CRATE-VERIFY ?auto_846427 ?auto_846428 ?auto_846429 ?auto_846426 ?auto_846430 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846466 - SURFACE
      ?auto_846467 - SURFACE
      ?auto_846468 - SURFACE
      ?auto_846465 - SURFACE
      ?auto_846469 - SURFACE
    )
    :vars
    (
      ?auto_846474 - HOIST
      ?auto_846472 - PLACE
      ?auto_846473 - PLACE
      ?auto_846470 - HOIST
      ?auto_846471 - SURFACE
      ?auto_846475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846474 ?auto_846472 ) ( IS-CRATE ?auto_846469 ) ( not ( = ?auto_846465 ?auto_846469 ) ) ( not ( = ?auto_846468 ?auto_846465 ) ) ( not ( = ?auto_846468 ?auto_846469 ) ) ( not ( = ?auto_846473 ?auto_846472 ) ) ( HOIST-AT ?auto_846470 ?auto_846473 ) ( not ( = ?auto_846474 ?auto_846470 ) ) ( AVAILABLE ?auto_846470 ) ( SURFACE-AT ?auto_846469 ?auto_846473 ) ( ON ?auto_846469 ?auto_846471 ) ( CLEAR ?auto_846469 ) ( not ( = ?auto_846465 ?auto_846471 ) ) ( not ( = ?auto_846469 ?auto_846471 ) ) ( not ( = ?auto_846468 ?auto_846471 ) ) ( TRUCK-AT ?auto_846475 ?auto_846472 ) ( SURFACE-AT ?auto_846468 ?auto_846472 ) ( CLEAR ?auto_846468 ) ( IS-CRATE ?auto_846465 ) ( AVAILABLE ?auto_846474 ) ( IN ?auto_846465 ?auto_846475 ) ( ON ?auto_846467 ?auto_846466 ) ( ON ?auto_846468 ?auto_846467 ) ( not ( = ?auto_846466 ?auto_846467 ) ) ( not ( = ?auto_846466 ?auto_846468 ) ) ( not ( = ?auto_846466 ?auto_846465 ) ) ( not ( = ?auto_846466 ?auto_846469 ) ) ( not ( = ?auto_846466 ?auto_846471 ) ) ( not ( = ?auto_846467 ?auto_846468 ) ) ( not ( = ?auto_846467 ?auto_846465 ) ) ( not ( = ?auto_846467 ?auto_846469 ) ) ( not ( = ?auto_846467 ?auto_846471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846468 ?auto_846465 ?auto_846469 )
      ( MAKE-4CRATE-VERIFY ?auto_846466 ?auto_846467 ?auto_846468 ?auto_846465 ?auto_846469 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847126 - SURFACE
      ?auto_847127 - SURFACE
      ?auto_847128 - SURFACE
      ?auto_847125 - SURFACE
      ?auto_847129 - SURFACE
      ?auto_847130 - SURFACE
    )
    :vars
    (
      ?auto_847131 - HOIST
      ?auto_847132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847131 ?auto_847132 ) ( SURFACE-AT ?auto_847129 ?auto_847132 ) ( CLEAR ?auto_847129 ) ( LIFTING ?auto_847131 ?auto_847130 ) ( IS-CRATE ?auto_847130 ) ( not ( = ?auto_847129 ?auto_847130 ) ) ( ON ?auto_847127 ?auto_847126 ) ( ON ?auto_847128 ?auto_847127 ) ( ON ?auto_847125 ?auto_847128 ) ( ON ?auto_847129 ?auto_847125 ) ( not ( = ?auto_847126 ?auto_847127 ) ) ( not ( = ?auto_847126 ?auto_847128 ) ) ( not ( = ?auto_847126 ?auto_847125 ) ) ( not ( = ?auto_847126 ?auto_847129 ) ) ( not ( = ?auto_847126 ?auto_847130 ) ) ( not ( = ?auto_847127 ?auto_847128 ) ) ( not ( = ?auto_847127 ?auto_847125 ) ) ( not ( = ?auto_847127 ?auto_847129 ) ) ( not ( = ?auto_847127 ?auto_847130 ) ) ( not ( = ?auto_847128 ?auto_847125 ) ) ( not ( = ?auto_847128 ?auto_847129 ) ) ( not ( = ?auto_847128 ?auto_847130 ) ) ( not ( = ?auto_847125 ?auto_847129 ) ) ( not ( = ?auto_847125 ?auto_847130 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847129 ?auto_847130 )
      ( MAKE-5CRATE-VERIFY ?auto_847126 ?auto_847127 ?auto_847128 ?auto_847125 ?auto_847129 ?auto_847130 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847160 - SURFACE
      ?auto_847161 - SURFACE
      ?auto_847162 - SURFACE
      ?auto_847159 - SURFACE
      ?auto_847163 - SURFACE
      ?auto_847164 - SURFACE
    )
    :vars
    (
      ?auto_847167 - HOIST
      ?auto_847166 - PLACE
      ?auto_847165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847167 ?auto_847166 ) ( SURFACE-AT ?auto_847163 ?auto_847166 ) ( CLEAR ?auto_847163 ) ( IS-CRATE ?auto_847164 ) ( not ( = ?auto_847163 ?auto_847164 ) ) ( TRUCK-AT ?auto_847165 ?auto_847166 ) ( AVAILABLE ?auto_847167 ) ( IN ?auto_847164 ?auto_847165 ) ( ON ?auto_847163 ?auto_847159 ) ( not ( = ?auto_847159 ?auto_847163 ) ) ( not ( = ?auto_847159 ?auto_847164 ) ) ( ON ?auto_847161 ?auto_847160 ) ( ON ?auto_847162 ?auto_847161 ) ( ON ?auto_847159 ?auto_847162 ) ( not ( = ?auto_847160 ?auto_847161 ) ) ( not ( = ?auto_847160 ?auto_847162 ) ) ( not ( = ?auto_847160 ?auto_847159 ) ) ( not ( = ?auto_847160 ?auto_847163 ) ) ( not ( = ?auto_847160 ?auto_847164 ) ) ( not ( = ?auto_847161 ?auto_847162 ) ) ( not ( = ?auto_847161 ?auto_847159 ) ) ( not ( = ?auto_847161 ?auto_847163 ) ) ( not ( = ?auto_847161 ?auto_847164 ) ) ( not ( = ?auto_847162 ?auto_847159 ) ) ( not ( = ?auto_847162 ?auto_847163 ) ) ( not ( = ?auto_847162 ?auto_847164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847159 ?auto_847163 ?auto_847164 )
      ( MAKE-5CRATE-VERIFY ?auto_847160 ?auto_847161 ?auto_847162 ?auto_847159 ?auto_847163 ?auto_847164 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847200 - SURFACE
      ?auto_847201 - SURFACE
      ?auto_847202 - SURFACE
      ?auto_847199 - SURFACE
      ?auto_847203 - SURFACE
      ?auto_847204 - SURFACE
    )
    :vars
    (
      ?auto_847206 - HOIST
      ?auto_847208 - PLACE
      ?auto_847205 - TRUCK
      ?auto_847207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847206 ?auto_847208 ) ( SURFACE-AT ?auto_847203 ?auto_847208 ) ( CLEAR ?auto_847203 ) ( IS-CRATE ?auto_847204 ) ( not ( = ?auto_847203 ?auto_847204 ) ) ( AVAILABLE ?auto_847206 ) ( IN ?auto_847204 ?auto_847205 ) ( ON ?auto_847203 ?auto_847199 ) ( not ( = ?auto_847199 ?auto_847203 ) ) ( not ( = ?auto_847199 ?auto_847204 ) ) ( TRUCK-AT ?auto_847205 ?auto_847207 ) ( not ( = ?auto_847207 ?auto_847208 ) ) ( ON ?auto_847201 ?auto_847200 ) ( ON ?auto_847202 ?auto_847201 ) ( ON ?auto_847199 ?auto_847202 ) ( not ( = ?auto_847200 ?auto_847201 ) ) ( not ( = ?auto_847200 ?auto_847202 ) ) ( not ( = ?auto_847200 ?auto_847199 ) ) ( not ( = ?auto_847200 ?auto_847203 ) ) ( not ( = ?auto_847200 ?auto_847204 ) ) ( not ( = ?auto_847201 ?auto_847202 ) ) ( not ( = ?auto_847201 ?auto_847199 ) ) ( not ( = ?auto_847201 ?auto_847203 ) ) ( not ( = ?auto_847201 ?auto_847204 ) ) ( not ( = ?auto_847202 ?auto_847199 ) ) ( not ( = ?auto_847202 ?auto_847203 ) ) ( not ( = ?auto_847202 ?auto_847204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847199 ?auto_847203 ?auto_847204 )
      ( MAKE-5CRATE-VERIFY ?auto_847200 ?auto_847201 ?auto_847202 ?auto_847199 ?auto_847203 ?auto_847204 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847245 - SURFACE
      ?auto_847246 - SURFACE
      ?auto_847247 - SURFACE
      ?auto_847244 - SURFACE
      ?auto_847248 - SURFACE
      ?auto_847249 - SURFACE
    )
    :vars
    (
      ?auto_847251 - HOIST
      ?auto_847252 - PLACE
      ?auto_847253 - TRUCK
      ?auto_847254 - PLACE
      ?auto_847250 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_847251 ?auto_847252 ) ( SURFACE-AT ?auto_847248 ?auto_847252 ) ( CLEAR ?auto_847248 ) ( IS-CRATE ?auto_847249 ) ( not ( = ?auto_847248 ?auto_847249 ) ) ( AVAILABLE ?auto_847251 ) ( ON ?auto_847248 ?auto_847244 ) ( not ( = ?auto_847244 ?auto_847248 ) ) ( not ( = ?auto_847244 ?auto_847249 ) ) ( TRUCK-AT ?auto_847253 ?auto_847254 ) ( not ( = ?auto_847254 ?auto_847252 ) ) ( HOIST-AT ?auto_847250 ?auto_847254 ) ( LIFTING ?auto_847250 ?auto_847249 ) ( not ( = ?auto_847251 ?auto_847250 ) ) ( ON ?auto_847246 ?auto_847245 ) ( ON ?auto_847247 ?auto_847246 ) ( ON ?auto_847244 ?auto_847247 ) ( not ( = ?auto_847245 ?auto_847246 ) ) ( not ( = ?auto_847245 ?auto_847247 ) ) ( not ( = ?auto_847245 ?auto_847244 ) ) ( not ( = ?auto_847245 ?auto_847248 ) ) ( not ( = ?auto_847245 ?auto_847249 ) ) ( not ( = ?auto_847246 ?auto_847247 ) ) ( not ( = ?auto_847246 ?auto_847244 ) ) ( not ( = ?auto_847246 ?auto_847248 ) ) ( not ( = ?auto_847246 ?auto_847249 ) ) ( not ( = ?auto_847247 ?auto_847244 ) ) ( not ( = ?auto_847247 ?auto_847248 ) ) ( not ( = ?auto_847247 ?auto_847249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847244 ?auto_847248 ?auto_847249 )
      ( MAKE-5CRATE-VERIFY ?auto_847245 ?auto_847246 ?auto_847247 ?auto_847244 ?auto_847248 ?auto_847249 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847295 - SURFACE
      ?auto_847296 - SURFACE
      ?auto_847297 - SURFACE
      ?auto_847294 - SURFACE
      ?auto_847298 - SURFACE
      ?auto_847299 - SURFACE
    )
    :vars
    (
      ?auto_847303 - HOIST
      ?auto_847302 - PLACE
      ?auto_847305 - TRUCK
      ?auto_847304 - PLACE
      ?auto_847300 - HOIST
      ?auto_847301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847303 ?auto_847302 ) ( SURFACE-AT ?auto_847298 ?auto_847302 ) ( CLEAR ?auto_847298 ) ( IS-CRATE ?auto_847299 ) ( not ( = ?auto_847298 ?auto_847299 ) ) ( AVAILABLE ?auto_847303 ) ( ON ?auto_847298 ?auto_847294 ) ( not ( = ?auto_847294 ?auto_847298 ) ) ( not ( = ?auto_847294 ?auto_847299 ) ) ( TRUCK-AT ?auto_847305 ?auto_847304 ) ( not ( = ?auto_847304 ?auto_847302 ) ) ( HOIST-AT ?auto_847300 ?auto_847304 ) ( not ( = ?auto_847303 ?auto_847300 ) ) ( AVAILABLE ?auto_847300 ) ( SURFACE-AT ?auto_847299 ?auto_847304 ) ( ON ?auto_847299 ?auto_847301 ) ( CLEAR ?auto_847299 ) ( not ( = ?auto_847298 ?auto_847301 ) ) ( not ( = ?auto_847299 ?auto_847301 ) ) ( not ( = ?auto_847294 ?auto_847301 ) ) ( ON ?auto_847296 ?auto_847295 ) ( ON ?auto_847297 ?auto_847296 ) ( ON ?auto_847294 ?auto_847297 ) ( not ( = ?auto_847295 ?auto_847296 ) ) ( not ( = ?auto_847295 ?auto_847297 ) ) ( not ( = ?auto_847295 ?auto_847294 ) ) ( not ( = ?auto_847295 ?auto_847298 ) ) ( not ( = ?auto_847295 ?auto_847299 ) ) ( not ( = ?auto_847295 ?auto_847301 ) ) ( not ( = ?auto_847296 ?auto_847297 ) ) ( not ( = ?auto_847296 ?auto_847294 ) ) ( not ( = ?auto_847296 ?auto_847298 ) ) ( not ( = ?auto_847296 ?auto_847299 ) ) ( not ( = ?auto_847296 ?auto_847301 ) ) ( not ( = ?auto_847297 ?auto_847294 ) ) ( not ( = ?auto_847297 ?auto_847298 ) ) ( not ( = ?auto_847297 ?auto_847299 ) ) ( not ( = ?auto_847297 ?auto_847301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847294 ?auto_847298 ?auto_847299 )
      ( MAKE-5CRATE-VERIFY ?auto_847295 ?auto_847296 ?auto_847297 ?auto_847294 ?auto_847298 ?auto_847299 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847346 - SURFACE
      ?auto_847347 - SURFACE
      ?auto_847348 - SURFACE
      ?auto_847345 - SURFACE
      ?auto_847349 - SURFACE
      ?auto_847350 - SURFACE
    )
    :vars
    (
      ?auto_847353 - HOIST
      ?auto_847354 - PLACE
      ?auto_847356 - PLACE
      ?auto_847355 - HOIST
      ?auto_847351 - SURFACE
      ?auto_847352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847353 ?auto_847354 ) ( SURFACE-AT ?auto_847349 ?auto_847354 ) ( CLEAR ?auto_847349 ) ( IS-CRATE ?auto_847350 ) ( not ( = ?auto_847349 ?auto_847350 ) ) ( AVAILABLE ?auto_847353 ) ( ON ?auto_847349 ?auto_847345 ) ( not ( = ?auto_847345 ?auto_847349 ) ) ( not ( = ?auto_847345 ?auto_847350 ) ) ( not ( = ?auto_847356 ?auto_847354 ) ) ( HOIST-AT ?auto_847355 ?auto_847356 ) ( not ( = ?auto_847353 ?auto_847355 ) ) ( AVAILABLE ?auto_847355 ) ( SURFACE-AT ?auto_847350 ?auto_847356 ) ( ON ?auto_847350 ?auto_847351 ) ( CLEAR ?auto_847350 ) ( not ( = ?auto_847349 ?auto_847351 ) ) ( not ( = ?auto_847350 ?auto_847351 ) ) ( not ( = ?auto_847345 ?auto_847351 ) ) ( TRUCK-AT ?auto_847352 ?auto_847354 ) ( ON ?auto_847347 ?auto_847346 ) ( ON ?auto_847348 ?auto_847347 ) ( ON ?auto_847345 ?auto_847348 ) ( not ( = ?auto_847346 ?auto_847347 ) ) ( not ( = ?auto_847346 ?auto_847348 ) ) ( not ( = ?auto_847346 ?auto_847345 ) ) ( not ( = ?auto_847346 ?auto_847349 ) ) ( not ( = ?auto_847346 ?auto_847350 ) ) ( not ( = ?auto_847346 ?auto_847351 ) ) ( not ( = ?auto_847347 ?auto_847348 ) ) ( not ( = ?auto_847347 ?auto_847345 ) ) ( not ( = ?auto_847347 ?auto_847349 ) ) ( not ( = ?auto_847347 ?auto_847350 ) ) ( not ( = ?auto_847347 ?auto_847351 ) ) ( not ( = ?auto_847348 ?auto_847345 ) ) ( not ( = ?auto_847348 ?auto_847349 ) ) ( not ( = ?auto_847348 ?auto_847350 ) ) ( not ( = ?auto_847348 ?auto_847351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847345 ?auto_847349 ?auto_847350 )
      ( MAKE-5CRATE-VERIFY ?auto_847346 ?auto_847347 ?auto_847348 ?auto_847345 ?auto_847349 ?auto_847350 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847397 - SURFACE
      ?auto_847398 - SURFACE
      ?auto_847399 - SURFACE
      ?auto_847396 - SURFACE
      ?auto_847400 - SURFACE
      ?auto_847401 - SURFACE
    )
    :vars
    (
      ?auto_847402 - HOIST
      ?auto_847403 - PLACE
      ?auto_847406 - PLACE
      ?auto_847407 - HOIST
      ?auto_847404 - SURFACE
      ?auto_847405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847402 ?auto_847403 ) ( IS-CRATE ?auto_847401 ) ( not ( = ?auto_847400 ?auto_847401 ) ) ( not ( = ?auto_847396 ?auto_847400 ) ) ( not ( = ?auto_847396 ?auto_847401 ) ) ( not ( = ?auto_847406 ?auto_847403 ) ) ( HOIST-AT ?auto_847407 ?auto_847406 ) ( not ( = ?auto_847402 ?auto_847407 ) ) ( AVAILABLE ?auto_847407 ) ( SURFACE-AT ?auto_847401 ?auto_847406 ) ( ON ?auto_847401 ?auto_847404 ) ( CLEAR ?auto_847401 ) ( not ( = ?auto_847400 ?auto_847404 ) ) ( not ( = ?auto_847401 ?auto_847404 ) ) ( not ( = ?auto_847396 ?auto_847404 ) ) ( TRUCK-AT ?auto_847405 ?auto_847403 ) ( SURFACE-AT ?auto_847396 ?auto_847403 ) ( CLEAR ?auto_847396 ) ( LIFTING ?auto_847402 ?auto_847400 ) ( IS-CRATE ?auto_847400 ) ( ON ?auto_847398 ?auto_847397 ) ( ON ?auto_847399 ?auto_847398 ) ( ON ?auto_847396 ?auto_847399 ) ( not ( = ?auto_847397 ?auto_847398 ) ) ( not ( = ?auto_847397 ?auto_847399 ) ) ( not ( = ?auto_847397 ?auto_847396 ) ) ( not ( = ?auto_847397 ?auto_847400 ) ) ( not ( = ?auto_847397 ?auto_847401 ) ) ( not ( = ?auto_847397 ?auto_847404 ) ) ( not ( = ?auto_847398 ?auto_847399 ) ) ( not ( = ?auto_847398 ?auto_847396 ) ) ( not ( = ?auto_847398 ?auto_847400 ) ) ( not ( = ?auto_847398 ?auto_847401 ) ) ( not ( = ?auto_847398 ?auto_847404 ) ) ( not ( = ?auto_847399 ?auto_847396 ) ) ( not ( = ?auto_847399 ?auto_847400 ) ) ( not ( = ?auto_847399 ?auto_847401 ) ) ( not ( = ?auto_847399 ?auto_847404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847396 ?auto_847400 ?auto_847401 )
      ( MAKE-5CRATE-VERIFY ?auto_847397 ?auto_847398 ?auto_847399 ?auto_847396 ?auto_847400 ?auto_847401 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847448 - SURFACE
      ?auto_847449 - SURFACE
      ?auto_847450 - SURFACE
      ?auto_847447 - SURFACE
      ?auto_847451 - SURFACE
      ?auto_847452 - SURFACE
    )
    :vars
    (
      ?auto_847455 - HOIST
      ?auto_847456 - PLACE
      ?auto_847458 - PLACE
      ?auto_847454 - HOIST
      ?auto_847453 - SURFACE
      ?auto_847457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847455 ?auto_847456 ) ( IS-CRATE ?auto_847452 ) ( not ( = ?auto_847451 ?auto_847452 ) ) ( not ( = ?auto_847447 ?auto_847451 ) ) ( not ( = ?auto_847447 ?auto_847452 ) ) ( not ( = ?auto_847458 ?auto_847456 ) ) ( HOIST-AT ?auto_847454 ?auto_847458 ) ( not ( = ?auto_847455 ?auto_847454 ) ) ( AVAILABLE ?auto_847454 ) ( SURFACE-AT ?auto_847452 ?auto_847458 ) ( ON ?auto_847452 ?auto_847453 ) ( CLEAR ?auto_847452 ) ( not ( = ?auto_847451 ?auto_847453 ) ) ( not ( = ?auto_847452 ?auto_847453 ) ) ( not ( = ?auto_847447 ?auto_847453 ) ) ( TRUCK-AT ?auto_847457 ?auto_847456 ) ( SURFACE-AT ?auto_847447 ?auto_847456 ) ( CLEAR ?auto_847447 ) ( IS-CRATE ?auto_847451 ) ( AVAILABLE ?auto_847455 ) ( IN ?auto_847451 ?auto_847457 ) ( ON ?auto_847449 ?auto_847448 ) ( ON ?auto_847450 ?auto_847449 ) ( ON ?auto_847447 ?auto_847450 ) ( not ( = ?auto_847448 ?auto_847449 ) ) ( not ( = ?auto_847448 ?auto_847450 ) ) ( not ( = ?auto_847448 ?auto_847447 ) ) ( not ( = ?auto_847448 ?auto_847451 ) ) ( not ( = ?auto_847448 ?auto_847452 ) ) ( not ( = ?auto_847448 ?auto_847453 ) ) ( not ( = ?auto_847449 ?auto_847450 ) ) ( not ( = ?auto_847449 ?auto_847447 ) ) ( not ( = ?auto_847449 ?auto_847451 ) ) ( not ( = ?auto_847449 ?auto_847452 ) ) ( not ( = ?auto_847449 ?auto_847453 ) ) ( not ( = ?auto_847450 ?auto_847447 ) ) ( not ( = ?auto_847450 ?auto_847451 ) ) ( not ( = ?auto_847450 ?auto_847452 ) ) ( not ( = ?auto_847450 ?auto_847453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847447 ?auto_847451 ?auto_847452 )
      ( MAKE-5CRATE-VERIFY ?auto_847448 ?auto_847449 ?auto_847450 ?auto_847447 ?auto_847451 ?auto_847452 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848657 - SURFACE
      ?auto_848658 - SURFACE
      ?auto_848659 - SURFACE
      ?auto_848656 - SURFACE
      ?auto_848660 - SURFACE
      ?auto_848662 - SURFACE
      ?auto_848661 - SURFACE
    )
    :vars
    (
      ?auto_848664 - HOIST
      ?auto_848663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848664 ?auto_848663 ) ( SURFACE-AT ?auto_848662 ?auto_848663 ) ( CLEAR ?auto_848662 ) ( LIFTING ?auto_848664 ?auto_848661 ) ( IS-CRATE ?auto_848661 ) ( not ( = ?auto_848662 ?auto_848661 ) ) ( ON ?auto_848658 ?auto_848657 ) ( ON ?auto_848659 ?auto_848658 ) ( ON ?auto_848656 ?auto_848659 ) ( ON ?auto_848660 ?auto_848656 ) ( ON ?auto_848662 ?auto_848660 ) ( not ( = ?auto_848657 ?auto_848658 ) ) ( not ( = ?auto_848657 ?auto_848659 ) ) ( not ( = ?auto_848657 ?auto_848656 ) ) ( not ( = ?auto_848657 ?auto_848660 ) ) ( not ( = ?auto_848657 ?auto_848662 ) ) ( not ( = ?auto_848657 ?auto_848661 ) ) ( not ( = ?auto_848658 ?auto_848659 ) ) ( not ( = ?auto_848658 ?auto_848656 ) ) ( not ( = ?auto_848658 ?auto_848660 ) ) ( not ( = ?auto_848658 ?auto_848662 ) ) ( not ( = ?auto_848658 ?auto_848661 ) ) ( not ( = ?auto_848659 ?auto_848656 ) ) ( not ( = ?auto_848659 ?auto_848660 ) ) ( not ( = ?auto_848659 ?auto_848662 ) ) ( not ( = ?auto_848659 ?auto_848661 ) ) ( not ( = ?auto_848656 ?auto_848660 ) ) ( not ( = ?auto_848656 ?auto_848662 ) ) ( not ( = ?auto_848656 ?auto_848661 ) ) ( not ( = ?auto_848660 ?auto_848662 ) ) ( not ( = ?auto_848660 ?auto_848661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_848662 ?auto_848661 )
      ( MAKE-6CRATE-VERIFY ?auto_848657 ?auto_848658 ?auto_848659 ?auto_848656 ?auto_848660 ?auto_848662 ?auto_848661 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848701 - SURFACE
      ?auto_848702 - SURFACE
      ?auto_848703 - SURFACE
      ?auto_848700 - SURFACE
      ?auto_848704 - SURFACE
      ?auto_848706 - SURFACE
      ?auto_848705 - SURFACE
    )
    :vars
    (
      ?auto_848709 - HOIST
      ?auto_848707 - PLACE
      ?auto_848708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848709 ?auto_848707 ) ( SURFACE-AT ?auto_848706 ?auto_848707 ) ( CLEAR ?auto_848706 ) ( IS-CRATE ?auto_848705 ) ( not ( = ?auto_848706 ?auto_848705 ) ) ( TRUCK-AT ?auto_848708 ?auto_848707 ) ( AVAILABLE ?auto_848709 ) ( IN ?auto_848705 ?auto_848708 ) ( ON ?auto_848706 ?auto_848704 ) ( not ( = ?auto_848704 ?auto_848706 ) ) ( not ( = ?auto_848704 ?auto_848705 ) ) ( ON ?auto_848702 ?auto_848701 ) ( ON ?auto_848703 ?auto_848702 ) ( ON ?auto_848700 ?auto_848703 ) ( ON ?auto_848704 ?auto_848700 ) ( not ( = ?auto_848701 ?auto_848702 ) ) ( not ( = ?auto_848701 ?auto_848703 ) ) ( not ( = ?auto_848701 ?auto_848700 ) ) ( not ( = ?auto_848701 ?auto_848704 ) ) ( not ( = ?auto_848701 ?auto_848706 ) ) ( not ( = ?auto_848701 ?auto_848705 ) ) ( not ( = ?auto_848702 ?auto_848703 ) ) ( not ( = ?auto_848702 ?auto_848700 ) ) ( not ( = ?auto_848702 ?auto_848704 ) ) ( not ( = ?auto_848702 ?auto_848706 ) ) ( not ( = ?auto_848702 ?auto_848705 ) ) ( not ( = ?auto_848703 ?auto_848700 ) ) ( not ( = ?auto_848703 ?auto_848704 ) ) ( not ( = ?auto_848703 ?auto_848706 ) ) ( not ( = ?auto_848703 ?auto_848705 ) ) ( not ( = ?auto_848700 ?auto_848704 ) ) ( not ( = ?auto_848700 ?auto_848706 ) ) ( not ( = ?auto_848700 ?auto_848705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848704 ?auto_848706 ?auto_848705 )
      ( MAKE-6CRATE-VERIFY ?auto_848701 ?auto_848702 ?auto_848703 ?auto_848700 ?auto_848704 ?auto_848706 ?auto_848705 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848752 - SURFACE
      ?auto_848753 - SURFACE
      ?auto_848754 - SURFACE
      ?auto_848751 - SURFACE
      ?auto_848755 - SURFACE
      ?auto_848757 - SURFACE
      ?auto_848756 - SURFACE
    )
    :vars
    (
      ?auto_848758 - HOIST
      ?auto_848759 - PLACE
      ?auto_848761 - TRUCK
      ?auto_848760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848758 ?auto_848759 ) ( SURFACE-AT ?auto_848757 ?auto_848759 ) ( CLEAR ?auto_848757 ) ( IS-CRATE ?auto_848756 ) ( not ( = ?auto_848757 ?auto_848756 ) ) ( AVAILABLE ?auto_848758 ) ( IN ?auto_848756 ?auto_848761 ) ( ON ?auto_848757 ?auto_848755 ) ( not ( = ?auto_848755 ?auto_848757 ) ) ( not ( = ?auto_848755 ?auto_848756 ) ) ( TRUCK-AT ?auto_848761 ?auto_848760 ) ( not ( = ?auto_848760 ?auto_848759 ) ) ( ON ?auto_848753 ?auto_848752 ) ( ON ?auto_848754 ?auto_848753 ) ( ON ?auto_848751 ?auto_848754 ) ( ON ?auto_848755 ?auto_848751 ) ( not ( = ?auto_848752 ?auto_848753 ) ) ( not ( = ?auto_848752 ?auto_848754 ) ) ( not ( = ?auto_848752 ?auto_848751 ) ) ( not ( = ?auto_848752 ?auto_848755 ) ) ( not ( = ?auto_848752 ?auto_848757 ) ) ( not ( = ?auto_848752 ?auto_848756 ) ) ( not ( = ?auto_848753 ?auto_848754 ) ) ( not ( = ?auto_848753 ?auto_848751 ) ) ( not ( = ?auto_848753 ?auto_848755 ) ) ( not ( = ?auto_848753 ?auto_848757 ) ) ( not ( = ?auto_848753 ?auto_848756 ) ) ( not ( = ?auto_848754 ?auto_848751 ) ) ( not ( = ?auto_848754 ?auto_848755 ) ) ( not ( = ?auto_848754 ?auto_848757 ) ) ( not ( = ?auto_848754 ?auto_848756 ) ) ( not ( = ?auto_848751 ?auto_848755 ) ) ( not ( = ?auto_848751 ?auto_848757 ) ) ( not ( = ?auto_848751 ?auto_848756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848755 ?auto_848757 ?auto_848756 )
      ( MAKE-6CRATE-VERIFY ?auto_848752 ?auto_848753 ?auto_848754 ?auto_848751 ?auto_848755 ?auto_848757 ?auto_848756 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848809 - SURFACE
      ?auto_848810 - SURFACE
      ?auto_848811 - SURFACE
      ?auto_848808 - SURFACE
      ?auto_848812 - SURFACE
      ?auto_848814 - SURFACE
      ?auto_848813 - SURFACE
    )
    :vars
    (
      ?auto_848818 - HOIST
      ?auto_848816 - PLACE
      ?auto_848817 - TRUCK
      ?auto_848815 - PLACE
      ?auto_848819 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_848818 ?auto_848816 ) ( SURFACE-AT ?auto_848814 ?auto_848816 ) ( CLEAR ?auto_848814 ) ( IS-CRATE ?auto_848813 ) ( not ( = ?auto_848814 ?auto_848813 ) ) ( AVAILABLE ?auto_848818 ) ( ON ?auto_848814 ?auto_848812 ) ( not ( = ?auto_848812 ?auto_848814 ) ) ( not ( = ?auto_848812 ?auto_848813 ) ) ( TRUCK-AT ?auto_848817 ?auto_848815 ) ( not ( = ?auto_848815 ?auto_848816 ) ) ( HOIST-AT ?auto_848819 ?auto_848815 ) ( LIFTING ?auto_848819 ?auto_848813 ) ( not ( = ?auto_848818 ?auto_848819 ) ) ( ON ?auto_848810 ?auto_848809 ) ( ON ?auto_848811 ?auto_848810 ) ( ON ?auto_848808 ?auto_848811 ) ( ON ?auto_848812 ?auto_848808 ) ( not ( = ?auto_848809 ?auto_848810 ) ) ( not ( = ?auto_848809 ?auto_848811 ) ) ( not ( = ?auto_848809 ?auto_848808 ) ) ( not ( = ?auto_848809 ?auto_848812 ) ) ( not ( = ?auto_848809 ?auto_848814 ) ) ( not ( = ?auto_848809 ?auto_848813 ) ) ( not ( = ?auto_848810 ?auto_848811 ) ) ( not ( = ?auto_848810 ?auto_848808 ) ) ( not ( = ?auto_848810 ?auto_848812 ) ) ( not ( = ?auto_848810 ?auto_848814 ) ) ( not ( = ?auto_848810 ?auto_848813 ) ) ( not ( = ?auto_848811 ?auto_848808 ) ) ( not ( = ?auto_848811 ?auto_848812 ) ) ( not ( = ?auto_848811 ?auto_848814 ) ) ( not ( = ?auto_848811 ?auto_848813 ) ) ( not ( = ?auto_848808 ?auto_848812 ) ) ( not ( = ?auto_848808 ?auto_848814 ) ) ( not ( = ?auto_848808 ?auto_848813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848812 ?auto_848814 ?auto_848813 )
      ( MAKE-6CRATE-VERIFY ?auto_848809 ?auto_848810 ?auto_848811 ?auto_848808 ?auto_848812 ?auto_848814 ?auto_848813 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848872 - SURFACE
      ?auto_848873 - SURFACE
      ?auto_848874 - SURFACE
      ?auto_848871 - SURFACE
      ?auto_848875 - SURFACE
      ?auto_848877 - SURFACE
      ?auto_848876 - SURFACE
    )
    :vars
    (
      ?auto_848883 - HOIST
      ?auto_848881 - PLACE
      ?auto_848880 - TRUCK
      ?auto_848879 - PLACE
      ?auto_848882 - HOIST
      ?auto_848878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848883 ?auto_848881 ) ( SURFACE-AT ?auto_848877 ?auto_848881 ) ( CLEAR ?auto_848877 ) ( IS-CRATE ?auto_848876 ) ( not ( = ?auto_848877 ?auto_848876 ) ) ( AVAILABLE ?auto_848883 ) ( ON ?auto_848877 ?auto_848875 ) ( not ( = ?auto_848875 ?auto_848877 ) ) ( not ( = ?auto_848875 ?auto_848876 ) ) ( TRUCK-AT ?auto_848880 ?auto_848879 ) ( not ( = ?auto_848879 ?auto_848881 ) ) ( HOIST-AT ?auto_848882 ?auto_848879 ) ( not ( = ?auto_848883 ?auto_848882 ) ) ( AVAILABLE ?auto_848882 ) ( SURFACE-AT ?auto_848876 ?auto_848879 ) ( ON ?auto_848876 ?auto_848878 ) ( CLEAR ?auto_848876 ) ( not ( = ?auto_848877 ?auto_848878 ) ) ( not ( = ?auto_848876 ?auto_848878 ) ) ( not ( = ?auto_848875 ?auto_848878 ) ) ( ON ?auto_848873 ?auto_848872 ) ( ON ?auto_848874 ?auto_848873 ) ( ON ?auto_848871 ?auto_848874 ) ( ON ?auto_848875 ?auto_848871 ) ( not ( = ?auto_848872 ?auto_848873 ) ) ( not ( = ?auto_848872 ?auto_848874 ) ) ( not ( = ?auto_848872 ?auto_848871 ) ) ( not ( = ?auto_848872 ?auto_848875 ) ) ( not ( = ?auto_848872 ?auto_848877 ) ) ( not ( = ?auto_848872 ?auto_848876 ) ) ( not ( = ?auto_848872 ?auto_848878 ) ) ( not ( = ?auto_848873 ?auto_848874 ) ) ( not ( = ?auto_848873 ?auto_848871 ) ) ( not ( = ?auto_848873 ?auto_848875 ) ) ( not ( = ?auto_848873 ?auto_848877 ) ) ( not ( = ?auto_848873 ?auto_848876 ) ) ( not ( = ?auto_848873 ?auto_848878 ) ) ( not ( = ?auto_848874 ?auto_848871 ) ) ( not ( = ?auto_848874 ?auto_848875 ) ) ( not ( = ?auto_848874 ?auto_848877 ) ) ( not ( = ?auto_848874 ?auto_848876 ) ) ( not ( = ?auto_848874 ?auto_848878 ) ) ( not ( = ?auto_848871 ?auto_848875 ) ) ( not ( = ?auto_848871 ?auto_848877 ) ) ( not ( = ?auto_848871 ?auto_848876 ) ) ( not ( = ?auto_848871 ?auto_848878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848875 ?auto_848877 ?auto_848876 )
      ( MAKE-6CRATE-VERIFY ?auto_848872 ?auto_848873 ?auto_848874 ?auto_848871 ?auto_848875 ?auto_848877 ?auto_848876 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848936 - SURFACE
      ?auto_848937 - SURFACE
      ?auto_848938 - SURFACE
      ?auto_848935 - SURFACE
      ?auto_848939 - SURFACE
      ?auto_848941 - SURFACE
      ?auto_848940 - SURFACE
    )
    :vars
    (
      ?auto_848946 - HOIST
      ?auto_848945 - PLACE
      ?auto_848943 - PLACE
      ?auto_848947 - HOIST
      ?auto_848942 - SURFACE
      ?auto_848944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848946 ?auto_848945 ) ( SURFACE-AT ?auto_848941 ?auto_848945 ) ( CLEAR ?auto_848941 ) ( IS-CRATE ?auto_848940 ) ( not ( = ?auto_848941 ?auto_848940 ) ) ( AVAILABLE ?auto_848946 ) ( ON ?auto_848941 ?auto_848939 ) ( not ( = ?auto_848939 ?auto_848941 ) ) ( not ( = ?auto_848939 ?auto_848940 ) ) ( not ( = ?auto_848943 ?auto_848945 ) ) ( HOIST-AT ?auto_848947 ?auto_848943 ) ( not ( = ?auto_848946 ?auto_848947 ) ) ( AVAILABLE ?auto_848947 ) ( SURFACE-AT ?auto_848940 ?auto_848943 ) ( ON ?auto_848940 ?auto_848942 ) ( CLEAR ?auto_848940 ) ( not ( = ?auto_848941 ?auto_848942 ) ) ( not ( = ?auto_848940 ?auto_848942 ) ) ( not ( = ?auto_848939 ?auto_848942 ) ) ( TRUCK-AT ?auto_848944 ?auto_848945 ) ( ON ?auto_848937 ?auto_848936 ) ( ON ?auto_848938 ?auto_848937 ) ( ON ?auto_848935 ?auto_848938 ) ( ON ?auto_848939 ?auto_848935 ) ( not ( = ?auto_848936 ?auto_848937 ) ) ( not ( = ?auto_848936 ?auto_848938 ) ) ( not ( = ?auto_848936 ?auto_848935 ) ) ( not ( = ?auto_848936 ?auto_848939 ) ) ( not ( = ?auto_848936 ?auto_848941 ) ) ( not ( = ?auto_848936 ?auto_848940 ) ) ( not ( = ?auto_848936 ?auto_848942 ) ) ( not ( = ?auto_848937 ?auto_848938 ) ) ( not ( = ?auto_848937 ?auto_848935 ) ) ( not ( = ?auto_848937 ?auto_848939 ) ) ( not ( = ?auto_848937 ?auto_848941 ) ) ( not ( = ?auto_848937 ?auto_848940 ) ) ( not ( = ?auto_848937 ?auto_848942 ) ) ( not ( = ?auto_848938 ?auto_848935 ) ) ( not ( = ?auto_848938 ?auto_848939 ) ) ( not ( = ?auto_848938 ?auto_848941 ) ) ( not ( = ?auto_848938 ?auto_848940 ) ) ( not ( = ?auto_848938 ?auto_848942 ) ) ( not ( = ?auto_848935 ?auto_848939 ) ) ( not ( = ?auto_848935 ?auto_848941 ) ) ( not ( = ?auto_848935 ?auto_848940 ) ) ( not ( = ?auto_848935 ?auto_848942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848939 ?auto_848941 ?auto_848940 )
      ( MAKE-6CRATE-VERIFY ?auto_848936 ?auto_848937 ?auto_848938 ?auto_848935 ?auto_848939 ?auto_848941 ?auto_848940 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_849000 - SURFACE
      ?auto_849001 - SURFACE
      ?auto_849002 - SURFACE
      ?auto_848999 - SURFACE
      ?auto_849003 - SURFACE
      ?auto_849005 - SURFACE
      ?auto_849004 - SURFACE
    )
    :vars
    (
      ?auto_849006 - HOIST
      ?auto_849010 - PLACE
      ?auto_849007 - PLACE
      ?auto_849009 - HOIST
      ?auto_849008 - SURFACE
      ?auto_849011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_849006 ?auto_849010 ) ( IS-CRATE ?auto_849004 ) ( not ( = ?auto_849005 ?auto_849004 ) ) ( not ( = ?auto_849003 ?auto_849005 ) ) ( not ( = ?auto_849003 ?auto_849004 ) ) ( not ( = ?auto_849007 ?auto_849010 ) ) ( HOIST-AT ?auto_849009 ?auto_849007 ) ( not ( = ?auto_849006 ?auto_849009 ) ) ( AVAILABLE ?auto_849009 ) ( SURFACE-AT ?auto_849004 ?auto_849007 ) ( ON ?auto_849004 ?auto_849008 ) ( CLEAR ?auto_849004 ) ( not ( = ?auto_849005 ?auto_849008 ) ) ( not ( = ?auto_849004 ?auto_849008 ) ) ( not ( = ?auto_849003 ?auto_849008 ) ) ( TRUCK-AT ?auto_849011 ?auto_849010 ) ( SURFACE-AT ?auto_849003 ?auto_849010 ) ( CLEAR ?auto_849003 ) ( LIFTING ?auto_849006 ?auto_849005 ) ( IS-CRATE ?auto_849005 ) ( ON ?auto_849001 ?auto_849000 ) ( ON ?auto_849002 ?auto_849001 ) ( ON ?auto_848999 ?auto_849002 ) ( ON ?auto_849003 ?auto_848999 ) ( not ( = ?auto_849000 ?auto_849001 ) ) ( not ( = ?auto_849000 ?auto_849002 ) ) ( not ( = ?auto_849000 ?auto_848999 ) ) ( not ( = ?auto_849000 ?auto_849003 ) ) ( not ( = ?auto_849000 ?auto_849005 ) ) ( not ( = ?auto_849000 ?auto_849004 ) ) ( not ( = ?auto_849000 ?auto_849008 ) ) ( not ( = ?auto_849001 ?auto_849002 ) ) ( not ( = ?auto_849001 ?auto_848999 ) ) ( not ( = ?auto_849001 ?auto_849003 ) ) ( not ( = ?auto_849001 ?auto_849005 ) ) ( not ( = ?auto_849001 ?auto_849004 ) ) ( not ( = ?auto_849001 ?auto_849008 ) ) ( not ( = ?auto_849002 ?auto_848999 ) ) ( not ( = ?auto_849002 ?auto_849003 ) ) ( not ( = ?auto_849002 ?auto_849005 ) ) ( not ( = ?auto_849002 ?auto_849004 ) ) ( not ( = ?auto_849002 ?auto_849008 ) ) ( not ( = ?auto_848999 ?auto_849003 ) ) ( not ( = ?auto_848999 ?auto_849005 ) ) ( not ( = ?auto_848999 ?auto_849004 ) ) ( not ( = ?auto_848999 ?auto_849008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_849003 ?auto_849005 ?auto_849004 )
      ( MAKE-6CRATE-VERIFY ?auto_849000 ?auto_849001 ?auto_849002 ?auto_848999 ?auto_849003 ?auto_849005 ?auto_849004 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_849064 - SURFACE
      ?auto_849065 - SURFACE
      ?auto_849066 - SURFACE
      ?auto_849063 - SURFACE
      ?auto_849067 - SURFACE
      ?auto_849069 - SURFACE
      ?auto_849068 - SURFACE
    )
    :vars
    (
      ?auto_849074 - HOIST
      ?auto_849073 - PLACE
      ?auto_849075 - PLACE
      ?auto_849071 - HOIST
      ?auto_849072 - SURFACE
      ?auto_849070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_849074 ?auto_849073 ) ( IS-CRATE ?auto_849068 ) ( not ( = ?auto_849069 ?auto_849068 ) ) ( not ( = ?auto_849067 ?auto_849069 ) ) ( not ( = ?auto_849067 ?auto_849068 ) ) ( not ( = ?auto_849075 ?auto_849073 ) ) ( HOIST-AT ?auto_849071 ?auto_849075 ) ( not ( = ?auto_849074 ?auto_849071 ) ) ( AVAILABLE ?auto_849071 ) ( SURFACE-AT ?auto_849068 ?auto_849075 ) ( ON ?auto_849068 ?auto_849072 ) ( CLEAR ?auto_849068 ) ( not ( = ?auto_849069 ?auto_849072 ) ) ( not ( = ?auto_849068 ?auto_849072 ) ) ( not ( = ?auto_849067 ?auto_849072 ) ) ( TRUCK-AT ?auto_849070 ?auto_849073 ) ( SURFACE-AT ?auto_849067 ?auto_849073 ) ( CLEAR ?auto_849067 ) ( IS-CRATE ?auto_849069 ) ( AVAILABLE ?auto_849074 ) ( IN ?auto_849069 ?auto_849070 ) ( ON ?auto_849065 ?auto_849064 ) ( ON ?auto_849066 ?auto_849065 ) ( ON ?auto_849063 ?auto_849066 ) ( ON ?auto_849067 ?auto_849063 ) ( not ( = ?auto_849064 ?auto_849065 ) ) ( not ( = ?auto_849064 ?auto_849066 ) ) ( not ( = ?auto_849064 ?auto_849063 ) ) ( not ( = ?auto_849064 ?auto_849067 ) ) ( not ( = ?auto_849064 ?auto_849069 ) ) ( not ( = ?auto_849064 ?auto_849068 ) ) ( not ( = ?auto_849064 ?auto_849072 ) ) ( not ( = ?auto_849065 ?auto_849066 ) ) ( not ( = ?auto_849065 ?auto_849063 ) ) ( not ( = ?auto_849065 ?auto_849067 ) ) ( not ( = ?auto_849065 ?auto_849069 ) ) ( not ( = ?auto_849065 ?auto_849068 ) ) ( not ( = ?auto_849065 ?auto_849072 ) ) ( not ( = ?auto_849066 ?auto_849063 ) ) ( not ( = ?auto_849066 ?auto_849067 ) ) ( not ( = ?auto_849066 ?auto_849069 ) ) ( not ( = ?auto_849066 ?auto_849068 ) ) ( not ( = ?auto_849066 ?auto_849072 ) ) ( not ( = ?auto_849063 ?auto_849067 ) ) ( not ( = ?auto_849063 ?auto_849069 ) ) ( not ( = ?auto_849063 ?auto_849068 ) ) ( not ( = ?auto_849063 ?auto_849072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_849067 ?auto_849069 ?auto_849068 )
      ( MAKE-6CRATE-VERIFY ?auto_849064 ?auto_849065 ?auto_849066 ?auto_849063 ?auto_849067 ?auto_849069 ?auto_849068 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851020 - SURFACE
      ?auto_851021 - SURFACE
      ?auto_851022 - SURFACE
      ?auto_851019 - SURFACE
      ?auto_851023 - SURFACE
      ?auto_851025 - SURFACE
      ?auto_851024 - SURFACE
      ?auto_851026 - SURFACE
    )
    :vars
    (
      ?auto_851027 - HOIST
      ?auto_851028 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_851027 ?auto_851028 ) ( SURFACE-AT ?auto_851024 ?auto_851028 ) ( CLEAR ?auto_851024 ) ( LIFTING ?auto_851027 ?auto_851026 ) ( IS-CRATE ?auto_851026 ) ( not ( = ?auto_851024 ?auto_851026 ) ) ( ON ?auto_851021 ?auto_851020 ) ( ON ?auto_851022 ?auto_851021 ) ( ON ?auto_851019 ?auto_851022 ) ( ON ?auto_851023 ?auto_851019 ) ( ON ?auto_851025 ?auto_851023 ) ( ON ?auto_851024 ?auto_851025 ) ( not ( = ?auto_851020 ?auto_851021 ) ) ( not ( = ?auto_851020 ?auto_851022 ) ) ( not ( = ?auto_851020 ?auto_851019 ) ) ( not ( = ?auto_851020 ?auto_851023 ) ) ( not ( = ?auto_851020 ?auto_851025 ) ) ( not ( = ?auto_851020 ?auto_851024 ) ) ( not ( = ?auto_851020 ?auto_851026 ) ) ( not ( = ?auto_851021 ?auto_851022 ) ) ( not ( = ?auto_851021 ?auto_851019 ) ) ( not ( = ?auto_851021 ?auto_851023 ) ) ( not ( = ?auto_851021 ?auto_851025 ) ) ( not ( = ?auto_851021 ?auto_851024 ) ) ( not ( = ?auto_851021 ?auto_851026 ) ) ( not ( = ?auto_851022 ?auto_851019 ) ) ( not ( = ?auto_851022 ?auto_851023 ) ) ( not ( = ?auto_851022 ?auto_851025 ) ) ( not ( = ?auto_851022 ?auto_851024 ) ) ( not ( = ?auto_851022 ?auto_851026 ) ) ( not ( = ?auto_851019 ?auto_851023 ) ) ( not ( = ?auto_851019 ?auto_851025 ) ) ( not ( = ?auto_851019 ?auto_851024 ) ) ( not ( = ?auto_851019 ?auto_851026 ) ) ( not ( = ?auto_851023 ?auto_851025 ) ) ( not ( = ?auto_851023 ?auto_851024 ) ) ( not ( = ?auto_851023 ?auto_851026 ) ) ( not ( = ?auto_851025 ?auto_851024 ) ) ( not ( = ?auto_851025 ?auto_851026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_851024 ?auto_851026 )
      ( MAKE-7CRATE-VERIFY ?auto_851020 ?auto_851021 ?auto_851022 ?auto_851019 ?auto_851023 ?auto_851025 ?auto_851024 ?auto_851026 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851075 - SURFACE
      ?auto_851076 - SURFACE
      ?auto_851077 - SURFACE
      ?auto_851074 - SURFACE
      ?auto_851078 - SURFACE
      ?auto_851080 - SURFACE
      ?auto_851079 - SURFACE
      ?auto_851081 - SURFACE
    )
    :vars
    (
      ?auto_851083 - HOIST
      ?auto_851084 - PLACE
      ?auto_851082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851083 ?auto_851084 ) ( SURFACE-AT ?auto_851079 ?auto_851084 ) ( CLEAR ?auto_851079 ) ( IS-CRATE ?auto_851081 ) ( not ( = ?auto_851079 ?auto_851081 ) ) ( TRUCK-AT ?auto_851082 ?auto_851084 ) ( AVAILABLE ?auto_851083 ) ( IN ?auto_851081 ?auto_851082 ) ( ON ?auto_851079 ?auto_851080 ) ( not ( = ?auto_851080 ?auto_851079 ) ) ( not ( = ?auto_851080 ?auto_851081 ) ) ( ON ?auto_851076 ?auto_851075 ) ( ON ?auto_851077 ?auto_851076 ) ( ON ?auto_851074 ?auto_851077 ) ( ON ?auto_851078 ?auto_851074 ) ( ON ?auto_851080 ?auto_851078 ) ( not ( = ?auto_851075 ?auto_851076 ) ) ( not ( = ?auto_851075 ?auto_851077 ) ) ( not ( = ?auto_851075 ?auto_851074 ) ) ( not ( = ?auto_851075 ?auto_851078 ) ) ( not ( = ?auto_851075 ?auto_851080 ) ) ( not ( = ?auto_851075 ?auto_851079 ) ) ( not ( = ?auto_851075 ?auto_851081 ) ) ( not ( = ?auto_851076 ?auto_851077 ) ) ( not ( = ?auto_851076 ?auto_851074 ) ) ( not ( = ?auto_851076 ?auto_851078 ) ) ( not ( = ?auto_851076 ?auto_851080 ) ) ( not ( = ?auto_851076 ?auto_851079 ) ) ( not ( = ?auto_851076 ?auto_851081 ) ) ( not ( = ?auto_851077 ?auto_851074 ) ) ( not ( = ?auto_851077 ?auto_851078 ) ) ( not ( = ?auto_851077 ?auto_851080 ) ) ( not ( = ?auto_851077 ?auto_851079 ) ) ( not ( = ?auto_851077 ?auto_851081 ) ) ( not ( = ?auto_851074 ?auto_851078 ) ) ( not ( = ?auto_851074 ?auto_851080 ) ) ( not ( = ?auto_851074 ?auto_851079 ) ) ( not ( = ?auto_851074 ?auto_851081 ) ) ( not ( = ?auto_851078 ?auto_851080 ) ) ( not ( = ?auto_851078 ?auto_851079 ) ) ( not ( = ?auto_851078 ?auto_851081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851080 ?auto_851079 ?auto_851081 )
      ( MAKE-7CRATE-VERIFY ?auto_851075 ?auto_851076 ?auto_851077 ?auto_851074 ?auto_851078 ?auto_851080 ?auto_851079 ?auto_851081 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851138 - SURFACE
      ?auto_851139 - SURFACE
      ?auto_851140 - SURFACE
      ?auto_851137 - SURFACE
      ?auto_851141 - SURFACE
      ?auto_851143 - SURFACE
      ?auto_851142 - SURFACE
      ?auto_851144 - SURFACE
    )
    :vars
    (
      ?auto_851146 - HOIST
      ?auto_851145 - PLACE
      ?auto_851148 - TRUCK
      ?auto_851147 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_851146 ?auto_851145 ) ( SURFACE-AT ?auto_851142 ?auto_851145 ) ( CLEAR ?auto_851142 ) ( IS-CRATE ?auto_851144 ) ( not ( = ?auto_851142 ?auto_851144 ) ) ( AVAILABLE ?auto_851146 ) ( IN ?auto_851144 ?auto_851148 ) ( ON ?auto_851142 ?auto_851143 ) ( not ( = ?auto_851143 ?auto_851142 ) ) ( not ( = ?auto_851143 ?auto_851144 ) ) ( TRUCK-AT ?auto_851148 ?auto_851147 ) ( not ( = ?auto_851147 ?auto_851145 ) ) ( ON ?auto_851139 ?auto_851138 ) ( ON ?auto_851140 ?auto_851139 ) ( ON ?auto_851137 ?auto_851140 ) ( ON ?auto_851141 ?auto_851137 ) ( ON ?auto_851143 ?auto_851141 ) ( not ( = ?auto_851138 ?auto_851139 ) ) ( not ( = ?auto_851138 ?auto_851140 ) ) ( not ( = ?auto_851138 ?auto_851137 ) ) ( not ( = ?auto_851138 ?auto_851141 ) ) ( not ( = ?auto_851138 ?auto_851143 ) ) ( not ( = ?auto_851138 ?auto_851142 ) ) ( not ( = ?auto_851138 ?auto_851144 ) ) ( not ( = ?auto_851139 ?auto_851140 ) ) ( not ( = ?auto_851139 ?auto_851137 ) ) ( not ( = ?auto_851139 ?auto_851141 ) ) ( not ( = ?auto_851139 ?auto_851143 ) ) ( not ( = ?auto_851139 ?auto_851142 ) ) ( not ( = ?auto_851139 ?auto_851144 ) ) ( not ( = ?auto_851140 ?auto_851137 ) ) ( not ( = ?auto_851140 ?auto_851141 ) ) ( not ( = ?auto_851140 ?auto_851143 ) ) ( not ( = ?auto_851140 ?auto_851142 ) ) ( not ( = ?auto_851140 ?auto_851144 ) ) ( not ( = ?auto_851137 ?auto_851141 ) ) ( not ( = ?auto_851137 ?auto_851143 ) ) ( not ( = ?auto_851137 ?auto_851142 ) ) ( not ( = ?auto_851137 ?auto_851144 ) ) ( not ( = ?auto_851141 ?auto_851143 ) ) ( not ( = ?auto_851141 ?auto_851142 ) ) ( not ( = ?auto_851141 ?auto_851144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851143 ?auto_851142 ?auto_851144 )
      ( MAKE-7CRATE-VERIFY ?auto_851138 ?auto_851139 ?auto_851140 ?auto_851137 ?auto_851141 ?auto_851143 ?auto_851142 ?auto_851144 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851208 - SURFACE
      ?auto_851209 - SURFACE
      ?auto_851210 - SURFACE
      ?auto_851207 - SURFACE
      ?auto_851211 - SURFACE
      ?auto_851213 - SURFACE
      ?auto_851212 - SURFACE
      ?auto_851214 - SURFACE
    )
    :vars
    (
      ?auto_851216 - HOIST
      ?auto_851217 - PLACE
      ?auto_851219 - TRUCK
      ?auto_851218 - PLACE
      ?auto_851215 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_851216 ?auto_851217 ) ( SURFACE-AT ?auto_851212 ?auto_851217 ) ( CLEAR ?auto_851212 ) ( IS-CRATE ?auto_851214 ) ( not ( = ?auto_851212 ?auto_851214 ) ) ( AVAILABLE ?auto_851216 ) ( ON ?auto_851212 ?auto_851213 ) ( not ( = ?auto_851213 ?auto_851212 ) ) ( not ( = ?auto_851213 ?auto_851214 ) ) ( TRUCK-AT ?auto_851219 ?auto_851218 ) ( not ( = ?auto_851218 ?auto_851217 ) ) ( HOIST-AT ?auto_851215 ?auto_851218 ) ( LIFTING ?auto_851215 ?auto_851214 ) ( not ( = ?auto_851216 ?auto_851215 ) ) ( ON ?auto_851209 ?auto_851208 ) ( ON ?auto_851210 ?auto_851209 ) ( ON ?auto_851207 ?auto_851210 ) ( ON ?auto_851211 ?auto_851207 ) ( ON ?auto_851213 ?auto_851211 ) ( not ( = ?auto_851208 ?auto_851209 ) ) ( not ( = ?auto_851208 ?auto_851210 ) ) ( not ( = ?auto_851208 ?auto_851207 ) ) ( not ( = ?auto_851208 ?auto_851211 ) ) ( not ( = ?auto_851208 ?auto_851213 ) ) ( not ( = ?auto_851208 ?auto_851212 ) ) ( not ( = ?auto_851208 ?auto_851214 ) ) ( not ( = ?auto_851209 ?auto_851210 ) ) ( not ( = ?auto_851209 ?auto_851207 ) ) ( not ( = ?auto_851209 ?auto_851211 ) ) ( not ( = ?auto_851209 ?auto_851213 ) ) ( not ( = ?auto_851209 ?auto_851212 ) ) ( not ( = ?auto_851209 ?auto_851214 ) ) ( not ( = ?auto_851210 ?auto_851207 ) ) ( not ( = ?auto_851210 ?auto_851211 ) ) ( not ( = ?auto_851210 ?auto_851213 ) ) ( not ( = ?auto_851210 ?auto_851212 ) ) ( not ( = ?auto_851210 ?auto_851214 ) ) ( not ( = ?auto_851207 ?auto_851211 ) ) ( not ( = ?auto_851207 ?auto_851213 ) ) ( not ( = ?auto_851207 ?auto_851212 ) ) ( not ( = ?auto_851207 ?auto_851214 ) ) ( not ( = ?auto_851211 ?auto_851213 ) ) ( not ( = ?auto_851211 ?auto_851212 ) ) ( not ( = ?auto_851211 ?auto_851214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851213 ?auto_851212 ?auto_851214 )
      ( MAKE-7CRATE-VERIFY ?auto_851208 ?auto_851209 ?auto_851210 ?auto_851207 ?auto_851211 ?auto_851213 ?auto_851212 ?auto_851214 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851285 - SURFACE
      ?auto_851286 - SURFACE
      ?auto_851287 - SURFACE
      ?auto_851284 - SURFACE
      ?auto_851288 - SURFACE
      ?auto_851290 - SURFACE
      ?auto_851289 - SURFACE
      ?auto_851291 - SURFACE
    )
    :vars
    (
      ?auto_851294 - HOIST
      ?auto_851296 - PLACE
      ?auto_851297 - TRUCK
      ?auto_851293 - PLACE
      ?auto_851295 - HOIST
      ?auto_851292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_851294 ?auto_851296 ) ( SURFACE-AT ?auto_851289 ?auto_851296 ) ( CLEAR ?auto_851289 ) ( IS-CRATE ?auto_851291 ) ( not ( = ?auto_851289 ?auto_851291 ) ) ( AVAILABLE ?auto_851294 ) ( ON ?auto_851289 ?auto_851290 ) ( not ( = ?auto_851290 ?auto_851289 ) ) ( not ( = ?auto_851290 ?auto_851291 ) ) ( TRUCK-AT ?auto_851297 ?auto_851293 ) ( not ( = ?auto_851293 ?auto_851296 ) ) ( HOIST-AT ?auto_851295 ?auto_851293 ) ( not ( = ?auto_851294 ?auto_851295 ) ) ( AVAILABLE ?auto_851295 ) ( SURFACE-AT ?auto_851291 ?auto_851293 ) ( ON ?auto_851291 ?auto_851292 ) ( CLEAR ?auto_851291 ) ( not ( = ?auto_851289 ?auto_851292 ) ) ( not ( = ?auto_851291 ?auto_851292 ) ) ( not ( = ?auto_851290 ?auto_851292 ) ) ( ON ?auto_851286 ?auto_851285 ) ( ON ?auto_851287 ?auto_851286 ) ( ON ?auto_851284 ?auto_851287 ) ( ON ?auto_851288 ?auto_851284 ) ( ON ?auto_851290 ?auto_851288 ) ( not ( = ?auto_851285 ?auto_851286 ) ) ( not ( = ?auto_851285 ?auto_851287 ) ) ( not ( = ?auto_851285 ?auto_851284 ) ) ( not ( = ?auto_851285 ?auto_851288 ) ) ( not ( = ?auto_851285 ?auto_851290 ) ) ( not ( = ?auto_851285 ?auto_851289 ) ) ( not ( = ?auto_851285 ?auto_851291 ) ) ( not ( = ?auto_851285 ?auto_851292 ) ) ( not ( = ?auto_851286 ?auto_851287 ) ) ( not ( = ?auto_851286 ?auto_851284 ) ) ( not ( = ?auto_851286 ?auto_851288 ) ) ( not ( = ?auto_851286 ?auto_851290 ) ) ( not ( = ?auto_851286 ?auto_851289 ) ) ( not ( = ?auto_851286 ?auto_851291 ) ) ( not ( = ?auto_851286 ?auto_851292 ) ) ( not ( = ?auto_851287 ?auto_851284 ) ) ( not ( = ?auto_851287 ?auto_851288 ) ) ( not ( = ?auto_851287 ?auto_851290 ) ) ( not ( = ?auto_851287 ?auto_851289 ) ) ( not ( = ?auto_851287 ?auto_851291 ) ) ( not ( = ?auto_851287 ?auto_851292 ) ) ( not ( = ?auto_851284 ?auto_851288 ) ) ( not ( = ?auto_851284 ?auto_851290 ) ) ( not ( = ?auto_851284 ?auto_851289 ) ) ( not ( = ?auto_851284 ?auto_851291 ) ) ( not ( = ?auto_851284 ?auto_851292 ) ) ( not ( = ?auto_851288 ?auto_851290 ) ) ( not ( = ?auto_851288 ?auto_851289 ) ) ( not ( = ?auto_851288 ?auto_851291 ) ) ( not ( = ?auto_851288 ?auto_851292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851290 ?auto_851289 ?auto_851291 )
      ( MAKE-7CRATE-VERIFY ?auto_851285 ?auto_851286 ?auto_851287 ?auto_851284 ?auto_851288 ?auto_851290 ?auto_851289 ?auto_851291 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851363 - SURFACE
      ?auto_851364 - SURFACE
      ?auto_851365 - SURFACE
      ?auto_851362 - SURFACE
      ?auto_851366 - SURFACE
      ?auto_851368 - SURFACE
      ?auto_851367 - SURFACE
      ?auto_851369 - SURFACE
    )
    :vars
    (
      ?auto_851373 - HOIST
      ?auto_851370 - PLACE
      ?auto_851372 - PLACE
      ?auto_851374 - HOIST
      ?auto_851371 - SURFACE
      ?auto_851375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851373 ?auto_851370 ) ( SURFACE-AT ?auto_851367 ?auto_851370 ) ( CLEAR ?auto_851367 ) ( IS-CRATE ?auto_851369 ) ( not ( = ?auto_851367 ?auto_851369 ) ) ( AVAILABLE ?auto_851373 ) ( ON ?auto_851367 ?auto_851368 ) ( not ( = ?auto_851368 ?auto_851367 ) ) ( not ( = ?auto_851368 ?auto_851369 ) ) ( not ( = ?auto_851372 ?auto_851370 ) ) ( HOIST-AT ?auto_851374 ?auto_851372 ) ( not ( = ?auto_851373 ?auto_851374 ) ) ( AVAILABLE ?auto_851374 ) ( SURFACE-AT ?auto_851369 ?auto_851372 ) ( ON ?auto_851369 ?auto_851371 ) ( CLEAR ?auto_851369 ) ( not ( = ?auto_851367 ?auto_851371 ) ) ( not ( = ?auto_851369 ?auto_851371 ) ) ( not ( = ?auto_851368 ?auto_851371 ) ) ( TRUCK-AT ?auto_851375 ?auto_851370 ) ( ON ?auto_851364 ?auto_851363 ) ( ON ?auto_851365 ?auto_851364 ) ( ON ?auto_851362 ?auto_851365 ) ( ON ?auto_851366 ?auto_851362 ) ( ON ?auto_851368 ?auto_851366 ) ( not ( = ?auto_851363 ?auto_851364 ) ) ( not ( = ?auto_851363 ?auto_851365 ) ) ( not ( = ?auto_851363 ?auto_851362 ) ) ( not ( = ?auto_851363 ?auto_851366 ) ) ( not ( = ?auto_851363 ?auto_851368 ) ) ( not ( = ?auto_851363 ?auto_851367 ) ) ( not ( = ?auto_851363 ?auto_851369 ) ) ( not ( = ?auto_851363 ?auto_851371 ) ) ( not ( = ?auto_851364 ?auto_851365 ) ) ( not ( = ?auto_851364 ?auto_851362 ) ) ( not ( = ?auto_851364 ?auto_851366 ) ) ( not ( = ?auto_851364 ?auto_851368 ) ) ( not ( = ?auto_851364 ?auto_851367 ) ) ( not ( = ?auto_851364 ?auto_851369 ) ) ( not ( = ?auto_851364 ?auto_851371 ) ) ( not ( = ?auto_851365 ?auto_851362 ) ) ( not ( = ?auto_851365 ?auto_851366 ) ) ( not ( = ?auto_851365 ?auto_851368 ) ) ( not ( = ?auto_851365 ?auto_851367 ) ) ( not ( = ?auto_851365 ?auto_851369 ) ) ( not ( = ?auto_851365 ?auto_851371 ) ) ( not ( = ?auto_851362 ?auto_851366 ) ) ( not ( = ?auto_851362 ?auto_851368 ) ) ( not ( = ?auto_851362 ?auto_851367 ) ) ( not ( = ?auto_851362 ?auto_851369 ) ) ( not ( = ?auto_851362 ?auto_851371 ) ) ( not ( = ?auto_851366 ?auto_851368 ) ) ( not ( = ?auto_851366 ?auto_851367 ) ) ( not ( = ?auto_851366 ?auto_851369 ) ) ( not ( = ?auto_851366 ?auto_851371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851368 ?auto_851367 ?auto_851369 )
      ( MAKE-7CRATE-VERIFY ?auto_851363 ?auto_851364 ?auto_851365 ?auto_851362 ?auto_851366 ?auto_851368 ?auto_851367 ?auto_851369 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851441 - SURFACE
      ?auto_851442 - SURFACE
      ?auto_851443 - SURFACE
      ?auto_851440 - SURFACE
      ?auto_851444 - SURFACE
      ?auto_851446 - SURFACE
      ?auto_851445 - SURFACE
      ?auto_851447 - SURFACE
    )
    :vars
    (
      ?auto_851448 - HOIST
      ?auto_851450 - PLACE
      ?auto_851451 - PLACE
      ?auto_851453 - HOIST
      ?auto_851449 - SURFACE
      ?auto_851452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851448 ?auto_851450 ) ( IS-CRATE ?auto_851447 ) ( not ( = ?auto_851445 ?auto_851447 ) ) ( not ( = ?auto_851446 ?auto_851445 ) ) ( not ( = ?auto_851446 ?auto_851447 ) ) ( not ( = ?auto_851451 ?auto_851450 ) ) ( HOIST-AT ?auto_851453 ?auto_851451 ) ( not ( = ?auto_851448 ?auto_851453 ) ) ( AVAILABLE ?auto_851453 ) ( SURFACE-AT ?auto_851447 ?auto_851451 ) ( ON ?auto_851447 ?auto_851449 ) ( CLEAR ?auto_851447 ) ( not ( = ?auto_851445 ?auto_851449 ) ) ( not ( = ?auto_851447 ?auto_851449 ) ) ( not ( = ?auto_851446 ?auto_851449 ) ) ( TRUCK-AT ?auto_851452 ?auto_851450 ) ( SURFACE-AT ?auto_851446 ?auto_851450 ) ( CLEAR ?auto_851446 ) ( LIFTING ?auto_851448 ?auto_851445 ) ( IS-CRATE ?auto_851445 ) ( ON ?auto_851442 ?auto_851441 ) ( ON ?auto_851443 ?auto_851442 ) ( ON ?auto_851440 ?auto_851443 ) ( ON ?auto_851444 ?auto_851440 ) ( ON ?auto_851446 ?auto_851444 ) ( not ( = ?auto_851441 ?auto_851442 ) ) ( not ( = ?auto_851441 ?auto_851443 ) ) ( not ( = ?auto_851441 ?auto_851440 ) ) ( not ( = ?auto_851441 ?auto_851444 ) ) ( not ( = ?auto_851441 ?auto_851446 ) ) ( not ( = ?auto_851441 ?auto_851445 ) ) ( not ( = ?auto_851441 ?auto_851447 ) ) ( not ( = ?auto_851441 ?auto_851449 ) ) ( not ( = ?auto_851442 ?auto_851443 ) ) ( not ( = ?auto_851442 ?auto_851440 ) ) ( not ( = ?auto_851442 ?auto_851444 ) ) ( not ( = ?auto_851442 ?auto_851446 ) ) ( not ( = ?auto_851442 ?auto_851445 ) ) ( not ( = ?auto_851442 ?auto_851447 ) ) ( not ( = ?auto_851442 ?auto_851449 ) ) ( not ( = ?auto_851443 ?auto_851440 ) ) ( not ( = ?auto_851443 ?auto_851444 ) ) ( not ( = ?auto_851443 ?auto_851446 ) ) ( not ( = ?auto_851443 ?auto_851445 ) ) ( not ( = ?auto_851443 ?auto_851447 ) ) ( not ( = ?auto_851443 ?auto_851449 ) ) ( not ( = ?auto_851440 ?auto_851444 ) ) ( not ( = ?auto_851440 ?auto_851446 ) ) ( not ( = ?auto_851440 ?auto_851445 ) ) ( not ( = ?auto_851440 ?auto_851447 ) ) ( not ( = ?auto_851440 ?auto_851449 ) ) ( not ( = ?auto_851444 ?auto_851446 ) ) ( not ( = ?auto_851444 ?auto_851445 ) ) ( not ( = ?auto_851444 ?auto_851447 ) ) ( not ( = ?auto_851444 ?auto_851449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851446 ?auto_851445 ?auto_851447 )
      ( MAKE-7CRATE-VERIFY ?auto_851441 ?auto_851442 ?auto_851443 ?auto_851440 ?auto_851444 ?auto_851446 ?auto_851445 ?auto_851447 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851519 - SURFACE
      ?auto_851520 - SURFACE
      ?auto_851521 - SURFACE
      ?auto_851518 - SURFACE
      ?auto_851522 - SURFACE
      ?auto_851524 - SURFACE
      ?auto_851523 - SURFACE
      ?auto_851525 - SURFACE
    )
    :vars
    (
      ?auto_851531 - HOIST
      ?auto_851528 - PLACE
      ?auto_851527 - PLACE
      ?auto_851529 - HOIST
      ?auto_851530 - SURFACE
      ?auto_851526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851531 ?auto_851528 ) ( IS-CRATE ?auto_851525 ) ( not ( = ?auto_851523 ?auto_851525 ) ) ( not ( = ?auto_851524 ?auto_851523 ) ) ( not ( = ?auto_851524 ?auto_851525 ) ) ( not ( = ?auto_851527 ?auto_851528 ) ) ( HOIST-AT ?auto_851529 ?auto_851527 ) ( not ( = ?auto_851531 ?auto_851529 ) ) ( AVAILABLE ?auto_851529 ) ( SURFACE-AT ?auto_851525 ?auto_851527 ) ( ON ?auto_851525 ?auto_851530 ) ( CLEAR ?auto_851525 ) ( not ( = ?auto_851523 ?auto_851530 ) ) ( not ( = ?auto_851525 ?auto_851530 ) ) ( not ( = ?auto_851524 ?auto_851530 ) ) ( TRUCK-AT ?auto_851526 ?auto_851528 ) ( SURFACE-AT ?auto_851524 ?auto_851528 ) ( CLEAR ?auto_851524 ) ( IS-CRATE ?auto_851523 ) ( AVAILABLE ?auto_851531 ) ( IN ?auto_851523 ?auto_851526 ) ( ON ?auto_851520 ?auto_851519 ) ( ON ?auto_851521 ?auto_851520 ) ( ON ?auto_851518 ?auto_851521 ) ( ON ?auto_851522 ?auto_851518 ) ( ON ?auto_851524 ?auto_851522 ) ( not ( = ?auto_851519 ?auto_851520 ) ) ( not ( = ?auto_851519 ?auto_851521 ) ) ( not ( = ?auto_851519 ?auto_851518 ) ) ( not ( = ?auto_851519 ?auto_851522 ) ) ( not ( = ?auto_851519 ?auto_851524 ) ) ( not ( = ?auto_851519 ?auto_851523 ) ) ( not ( = ?auto_851519 ?auto_851525 ) ) ( not ( = ?auto_851519 ?auto_851530 ) ) ( not ( = ?auto_851520 ?auto_851521 ) ) ( not ( = ?auto_851520 ?auto_851518 ) ) ( not ( = ?auto_851520 ?auto_851522 ) ) ( not ( = ?auto_851520 ?auto_851524 ) ) ( not ( = ?auto_851520 ?auto_851523 ) ) ( not ( = ?auto_851520 ?auto_851525 ) ) ( not ( = ?auto_851520 ?auto_851530 ) ) ( not ( = ?auto_851521 ?auto_851518 ) ) ( not ( = ?auto_851521 ?auto_851522 ) ) ( not ( = ?auto_851521 ?auto_851524 ) ) ( not ( = ?auto_851521 ?auto_851523 ) ) ( not ( = ?auto_851521 ?auto_851525 ) ) ( not ( = ?auto_851521 ?auto_851530 ) ) ( not ( = ?auto_851518 ?auto_851522 ) ) ( not ( = ?auto_851518 ?auto_851524 ) ) ( not ( = ?auto_851518 ?auto_851523 ) ) ( not ( = ?auto_851518 ?auto_851525 ) ) ( not ( = ?auto_851518 ?auto_851530 ) ) ( not ( = ?auto_851522 ?auto_851524 ) ) ( not ( = ?auto_851522 ?auto_851523 ) ) ( not ( = ?auto_851522 ?auto_851525 ) ) ( not ( = ?auto_851522 ?auto_851530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851524 ?auto_851523 ?auto_851525 )
      ( MAKE-7CRATE-VERIFY ?auto_851519 ?auto_851520 ?auto_851521 ?auto_851518 ?auto_851522 ?auto_851524 ?auto_851523 ?auto_851525 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854438 - SURFACE
      ?auto_854439 - SURFACE
      ?auto_854440 - SURFACE
      ?auto_854437 - SURFACE
      ?auto_854441 - SURFACE
      ?auto_854443 - SURFACE
      ?auto_854442 - SURFACE
      ?auto_854444 - SURFACE
      ?auto_854445 - SURFACE
    )
    :vars
    (
      ?auto_854446 - HOIST
      ?auto_854447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854446 ?auto_854447 ) ( SURFACE-AT ?auto_854444 ?auto_854447 ) ( CLEAR ?auto_854444 ) ( LIFTING ?auto_854446 ?auto_854445 ) ( IS-CRATE ?auto_854445 ) ( not ( = ?auto_854444 ?auto_854445 ) ) ( ON ?auto_854439 ?auto_854438 ) ( ON ?auto_854440 ?auto_854439 ) ( ON ?auto_854437 ?auto_854440 ) ( ON ?auto_854441 ?auto_854437 ) ( ON ?auto_854443 ?auto_854441 ) ( ON ?auto_854442 ?auto_854443 ) ( ON ?auto_854444 ?auto_854442 ) ( not ( = ?auto_854438 ?auto_854439 ) ) ( not ( = ?auto_854438 ?auto_854440 ) ) ( not ( = ?auto_854438 ?auto_854437 ) ) ( not ( = ?auto_854438 ?auto_854441 ) ) ( not ( = ?auto_854438 ?auto_854443 ) ) ( not ( = ?auto_854438 ?auto_854442 ) ) ( not ( = ?auto_854438 ?auto_854444 ) ) ( not ( = ?auto_854438 ?auto_854445 ) ) ( not ( = ?auto_854439 ?auto_854440 ) ) ( not ( = ?auto_854439 ?auto_854437 ) ) ( not ( = ?auto_854439 ?auto_854441 ) ) ( not ( = ?auto_854439 ?auto_854443 ) ) ( not ( = ?auto_854439 ?auto_854442 ) ) ( not ( = ?auto_854439 ?auto_854444 ) ) ( not ( = ?auto_854439 ?auto_854445 ) ) ( not ( = ?auto_854440 ?auto_854437 ) ) ( not ( = ?auto_854440 ?auto_854441 ) ) ( not ( = ?auto_854440 ?auto_854443 ) ) ( not ( = ?auto_854440 ?auto_854442 ) ) ( not ( = ?auto_854440 ?auto_854444 ) ) ( not ( = ?auto_854440 ?auto_854445 ) ) ( not ( = ?auto_854437 ?auto_854441 ) ) ( not ( = ?auto_854437 ?auto_854443 ) ) ( not ( = ?auto_854437 ?auto_854442 ) ) ( not ( = ?auto_854437 ?auto_854444 ) ) ( not ( = ?auto_854437 ?auto_854445 ) ) ( not ( = ?auto_854441 ?auto_854443 ) ) ( not ( = ?auto_854441 ?auto_854442 ) ) ( not ( = ?auto_854441 ?auto_854444 ) ) ( not ( = ?auto_854441 ?auto_854445 ) ) ( not ( = ?auto_854443 ?auto_854442 ) ) ( not ( = ?auto_854443 ?auto_854444 ) ) ( not ( = ?auto_854443 ?auto_854445 ) ) ( not ( = ?auto_854442 ?auto_854444 ) ) ( not ( = ?auto_854442 ?auto_854445 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_854444 ?auto_854445 )
      ( MAKE-8CRATE-VERIFY ?auto_854438 ?auto_854439 ?auto_854440 ?auto_854437 ?auto_854441 ?auto_854443 ?auto_854442 ?auto_854444 ?auto_854445 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854505 - SURFACE
      ?auto_854506 - SURFACE
      ?auto_854507 - SURFACE
      ?auto_854504 - SURFACE
      ?auto_854508 - SURFACE
      ?auto_854510 - SURFACE
      ?auto_854509 - SURFACE
      ?auto_854511 - SURFACE
      ?auto_854512 - SURFACE
    )
    :vars
    (
      ?auto_854515 - HOIST
      ?auto_854513 - PLACE
      ?auto_854514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854515 ?auto_854513 ) ( SURFACE-AT ?auto_854511 ?auto_854513 ) ( CLEAR ?auto_854511 ) ( IS-CRATE ?auto_854512 ) ( not ( = ?auto_854511 ?auto_854512 ) ) ( TRUCK-AT ?auto_854514 ?auto_854513 ) ( AVAILABLE ?auto_854515 ) ( IN ?auto_854512 ?auto_854514 ) ( ON ?auto_854511 ?auto_854509 ) ( not ( = ?auto_854509 ?auto_854511 ) ) ( not ( = ?auto_854509 ?auto_854512 ) ) ( ON ?auto_854506 ?auto_854505 ) ( ON ?auto_854507 ?auto_854506 ) ( ON ?auto_854504 ?auto_854507 ) ( ON ?auto_854508 ?auto_854504 ) ( ON ?auto_854510 ?auto_854508 ) ( ON ?auto_854509 ?auto_854510 ) ( not ( = ?auto_854505 ?auto_854506 ) ) ( not ( = ?auto_854505 ?auto_854507 ) ) ( not ( = ?auto_854505 ?auto_854504 ) ) ( not ( = ?auto_854505 ?auto_854508 ) ) ( not ( = ?auto_854505 ?auto_854510 ) ) ( not ( = ?auto_854505 ?auto_854509 ) ) ( not ( = ?auto_854505 ?auto_854511 ) ) ( not ( = ?auto_854505 ?auto_854512 ) ) ( not ( = ?auto_854506 ?auto_854507 ) ) ( not ( = ?auto_854506 ?auto_854504 ) ) ( not ( = ?auto_854506 ?auto_854508 ) ) ( not ( = ?auto_854506 ?auto_854510 ) ) ( not ( = ?auto_854506 ?auto_854509 ) ) ( not ( = ?auto_854506 ?auto_854511 ) ) ( not ( = ?auto_854506 ?auto_854512 ) ) ( not ( = ?auto_854507 ?auto_854504 ) ) ( not ( = ?auto_854507 ?auto_854508 ) ) ( not ( = ?auto_854507 ?auto_854510 ) ) ( not ( = ?auto_854507 ?auto_854509 ) ) ( not ( = ?auto_854507 ?auto_854511 ) ) ( not ( = ?auto_854507 ?auto_854512 ) ) ( not ( = ?auto_854504 ?auto_854508 ) ) ( not ( = ?auto_854504 ?auto_854510 ) ) ( not ( = ?auto_854504 ?auto_854509 ) ) ( not ( = ?auto_854504 ?auto_854511 ) ) ( not ( = ?auto_854504 ?auto_854512 ) ) ( not ( = ?auto_854508 ?auto_854510 ) ) ( not ( = ?auto_854508 ?auto_854509 ) ) ( not ( = ?auto_854508 ?auto_854511 ) ) ( not ( = ?auto_854508 ?auto_854512 ) ) ( not ( = ?auto_854510 ?auto_854509 ) ) ( not ( = ?auto_854510 ?auto_854511 ) ) ( not ( = ?auto_854510 ?auto_854512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854509 ?auto_854511 ?auto_854512 )
      ( MAKE-8CRATE-VERIFY ?auto_854505 ?auto_854506 ?auto_854507 ?auto_854504 ?auto_854508 ?auto_854510 ?auto_854509 ?auto_854511 ?auto_854512 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854581 - SURFACE
      ?auto_854582 - SURFACE
      ?auto_854583 - SURFACE
      ?auto_854580 - SURFACE
      ?auto_854584 - SURFACE
      ?auto_854586 - SURFACE
      ?auto_854585 - SURFACE
      ?auto_854587 - SURFACE
      ?auto_854588 - SURFACE
    )
    :vars
    (
      ?auto_854592 - HOIST
      ?auto_854589 - PLACE
      ?auto_854591 - TRUCK
      ?auto_854590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854592 ?auto_854589 ) ( SURFACE-AT ?auto_854587 ?auto_854589 ) ( CLEAR ?auto_854587 ) ( IS-CRATE ?auto_854588 ) ( not ( = ?auto_854587 ?auto_854588 ) ) ( AVAILABLE ?auto_854592 ) ( IN ?auto_854588 ?auto_854591 ) ( ON ?auto_854587 ?auto_854585 ) ( not ( = ?auto_854585 ?auto_854587 ) ) ( not ( = ?auto_854585 ?auto_854588 ) ) ( TRUCK-AT ?auto_854591 ?auto_854590 ) ( not ( = ?auto_854590 ?auto_854589 ) ) ( ON ?auto_854582 ?auto_854581 ) ( ON ?auto_854583 ?auto_854582 ) ( ON ?auto_854580 ?auto_854583 ) ( ON ?auto_854584 ?auto_854580 ) ( ON ?auto_854586 ?auto_854584 ) ( ON ?auto_854585 ?auto_854586 ) ( not ( = ?auto_854581 ?auto_854582 ) ) ( not ( = ?auto_854581 ?auto_854583 ) ) ( not ( = ?auto_854581 ?auto_854580 ) ) ( not ( = ?auto_854581 ?auto_854584 ) ) ( not ( = ?auto_854581 ?auto_854586 ) ) ( not ( = ?auto_854581 ?auto_854585 ) ) ( not ( = ?auto_854581 ?auto_854587 ) ) ( not ( = ?auto_854581 ?auto_854588 ) ) ( not ( = ?auto_854582 ?auto_854583 ) ) ( not ( = ?auto_854582 ?auto_854580 ) ) ( not ( = ?auto_854582 ?auto_854584 ) ) ( not ( = ?auto_854582 ?auto_854586 ) ) ( not ( = ?auto_854582 ?auto_854585 ) ) ( not ( = ?auto_854582 ?auto_854587 ) ) ( not ( = ?auto_854582 ?auto_854588 ) ) ( not ( = ?auto_854583 ?auto_854580 ) ) ( not ( = ?auto_854583 ?auto_854584 ) ) ( not ( = ?auto_854583 ?auto_854586 ) ) ( not ( = ?auto_854583 ?auto_854585 ) ) ( not ( = ?auto_854583 ?auto_854587 ) ) ( not ( = ?auto_854583 ?auto_854588 ) ) ( not ( = ?auto_854580 ?auto_854584 ) ) ( not ( = ?auto_854580 ?auto_854586 ) ) ( not ( = ?auto_854580 ?auto_854585 ) ) ( not ( = ?auto_854580 ?auto_854587 ) ) ( not ( = ?auto_854580 ?auto_854588 ) ) ( not ( = ?auto_854584 ?auto_854586 ) ) ( not ( = ?auto_854584 ?auto_854585 ) ) ( not ( = ?auto_854584 ?auto_854587 ) ) ( not ( = ?auto_854584 ?auto_854588 ) ) ( not ( = ?auto_854586 ?auto_854585 ) ) ( not ( = ?auto_854586 ?auto_854587 ) ) ( not ( = ?auto_854586 ?auto_854588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854585 ?auto_854587 ?auto_854588 )
      ( MAKE-8CRATE-VERIFY ?auto_854581 ?auto_854582 ?auto_854583 ?auto_854580 ?auto_854584 ?auto_854586 ?auto_854585 ?auto_854587 ?auto_854588 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854665 - SURFACE
      ?auto_854666 - SURFACE
      ?auto_854667 - SURFACE
      ?auto_854664 - SURFACE
      ?auto_854668 - SURFACE
      ?auto_854670 - SURFACE
      ?auto_854669 - SURFACE
      ?auto_854671 - SURFACE
      ?auto_854672 - SURFACE
    )
    :vars
    (
      ?auto_854675 - HOIST
      ?auto_854676 - PLACE
      ?auto_854673 - TRUCK
      ?auto_854674 - PLACE
      ?auto_854677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_854675 ?auto_854676 ) ( SURFACE-AT ?auto_854671 ?auto_854676 ) ( CLEAR ?auto_854671 ) ( IS-CRATE ?auto_854672 ) ( not ( = ?auto_854671 ?auto_854672 ) ) ( AVAILABLE ?auto_854675 ) ( ON ?auto_854671 ?auto_854669 ) ( not ( = ?auto_854669 ?auto_854671 ) ) ( not ( = ?auto_854669 ?auto_854672 ) ) ( TRUCK-AT ?auto_854673 ?auto_854674 ) ( not ( = ?auto_854674 ?auto_854676 ) ) ( HOIST-AT ?auto_854677 ?auto_854674 ) ( LIFTING ?auto_854677 ?auto_854672 ) ( not ( = ?auto_854675 ?auto_854677 ) ) ( ON ?auto_854666 ?auto_854665 ) ( ON ?auto_854667 ?auto_854666 ) ( ON ?auto_854664 ?auto_854667 ) ( ON ?auto_854668 ?auto_854664 ) ( ON ?auto_854670 ?auto_854668 ) ( ON ?auto_854669 ?auto_854670 ) ( not ( = ?auto_854665 ?auto_854666 ) ) ( not ( = ?auto_854665 ?auto_854667 ) ) ( not ( = ?auto_854665 ?auto_854664 ) ) ( not ( = ?auto_854665 ?auto_854668 ) ) ( not ( = ?auto_854665 ?auto_854670 ) ) ( not ( = ?auto_854665 ?auto_854669 ) ) ( not ( = ?auto_854665 ?auto_854671 ) ) ( not ( = ?auto_854665 ?auto_854672 ) ) ( not ( = ?auto_854666 ?auto_854667 ) ) ( not ( = ?auto_854666 ?auto_854664 ) ) ( not ( = ?auto_854666 ?auto_854668 ) ) ( not ( = ?auto_854666 ?auto_854670 ) ) ( not ( = ?auto_854666 ?auto_854669 ) ) ( not ( = ?auto_854666 ?auto_854671 ) ) ( not ( = ?auto_854666 ?auto_854672 ) ) ( not ( = ?auto_854667 ?auto_854664 ) ) ( not ( = ?auto_854667 ?auto_854668 ) ) ( not ( = ?auto_854667 ?auto_854670 ) ) ( not ( = ?auto_854667 ?auto_854669 ) ) ( not ( = ?auto_854667 ?auto_854671 ) ) ( not ( = ?auto_854667 ?auto_854672 ) ) ( not ( = ?auto_854664 ?auto_854668 ) ) ( not ( = ?auto_854664 ?auto_854670 ) ) ( not ( = ?auto_854664 ?auto_854669 ) ) ( not ( = ?auto_854664 ?auto_854671 ) ) ( not ( = ?auto_854664 ?auto_854672 ) ) ( not ( = ?auto_854668 ?auto_854670 ) ) ( not ( = ?auto_854668 ?auto_854669 ) ) ( not ( = ?auto_854668 ?auto_854671 ) ) ( not ( = ?auto_854668 ?auto_854672 ) ) ( not ( = ?auto_854670 ?auto_854669 ) ) ( not ( = ?auto_854670 ?auto_854671 ) ) ( not ( = ?auto_854670 ?auto_854672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854669 ?auto_854671 ?auto_854672 )
      ( MAKE-8CRATE-VERIFY ?auto_854665 ?auto_854666 ?auto_854667 ?auto_854664 ?auto_854668 ?auto_854670 ?auto_854669 ?auto_854671 ?auto_854672 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854757 - SURFACE
      ?auto_854758 - SURFACE
      ?auto_854759 - SURFACE
      ?auto_854756 - SURFACE
      ?auto_854760 - SURFACE
      ?auto_854762 - SURFACE
      ?auto_854761 - SURFACE
      ?auto_854763 - SURFACE
      ?auto_854764 - SURFACE
    )
    :vars
    (
      ?auto_854770 - HOIST
      ?auto_854765 - PLACE
      ?auto_854768 - TRUCK
      ?auto_854767 - PLACE
      ?auto_854769 - HOIST
      ?auto_854766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854770 ?auto_854765 ) ( SURFACE-AT ?auto_854763 ?auto_854765 ) ( CLEAR ?auto_854763 ) ( IS-CRATE ?auto_854764 ) ( not ( = ?auto_854763 ?auto_854764 ) ) ( AVAILABLE ?auto_854770 ) ( ON ?auto_854763 ?auto_854761 ) ( not ( = ?auto_854761 ?auto_854763 ) ) ( not ( = ?auto_854761 ?auto_854764 ) ) ( TRUCK-AT ?auto_854768 ?auto_854767 ) ( not ( = ?auto_854767 ?auto_854765 ) ) ( HOIST-AT ?auto_854769 ?auto_854767 ) ( not ( = ?auto_854770 ?auto_854769 ) ) ( AVAILABLE ?auto_854769 ) ( SURFACE-AT ?auto_854764 ?auto_854767 ) ( ON ?auto_854764 ?auto_854766 ) ( CLEAR ?auto_854764 ) ( not ( = ?auto_854763 ?auto_854766 ) ) ( not ( = ?auto_854764 ?auto_854766 ) ) ( not ( = ?auto_854761 ?auto_854766 ) ) ( ON ?auto_854758 ?auto_854757 ) ( ON ?auto_854759 ?auto_854758 ) ( ON ?auto_854756 ?auto_854759 ) ( ON ?auto_854760 ?auto_854756 ) ( ON ?auto_854762 ?auto_854760 ) ( ON ?auto_854761 ?auto_854762 ) ( not ( = ?auto_854757 ?auto_854758 ) ) ( not ( = ?auto_854757 ?auto_854759 ) ) ( not ( = ?auto_854757 ?auto_854756 ) ) ( not ( = ?auto_854757 ?auto_854760 ) ) ( not ( = ?auto_854757 ?auto_854762 ) ) ( not ( = ?auto_854757 ?auto_854761 ) ) ( not ( = ?auto_854757 ?auto_854763 ) ) ( not ( = ?auto_854757 ?auto_854764 ) ) ( not ( = ?auto_854757 ?auto_854766 ) ) ( not ( = ?auto_854758 ?auto_854759 ) ) ( not ( = ?auto_854758 ?auto_854756 ) ) ( not ( = ?auto_854758 ?auto_854760 ) ) ( not ( = ?auto_854758 ?auto_854762 ) ) ( not ( = ?auto_854758 ?auto_854761 ) ) ( not ( = ?auto_854758 ?auto_854763 ) ) ( not ( = ?auto_854758 ?auto_854764 ) ) ( not ( = ?auto_854758 ?auto_854766 ) ) ( not ( = ?auto_854759 ?auto_854756 ) ) ( not ( = ?auto_854759 ?auto_854760 ) ) ( not ( = ?auto_854759 ?auto_854762 ) ) ( not ( = ?auto_854759 ?auto_854761 ) ) ( not ( = ?auto_854759 ?auto_854763 ) ) ( not ( = ?auto_854759 ?auto_854764 ) ) ( not ( = ?auto_854759 ?auto_854766 ) ) ( not ( = ?auto_854756 ?auto_854760 ) ) ( not ( = ?auto_854756 ?auto_854762 ) ) ( not ( = ?auto_854756 ?auto_854761 ) ) ( not ( = ?auto_854756 ?auto_854763 ) ) ( not ( = ?auto_854756 ?auto_854764 ) ) ( not ( = ?auto_854756 ?auto_854766 ) ) ( not ( = ?auto_854760 ?auto_854762 ) ) ( not ( = ?auto_854760 ?auto_854761 ) ) ( not ( = ?auto_854760 ?auto_854763 ) ) ( not ( = ?auto_854760 ?auto_854764 ) ) ( not ( = ?auto_854760 ?auto_854766 ) ) ( not ( = ?auto_854762 ?auto_854761 ) ) ( not ( = ?auto_854762 ?auto_854763 ) ) ( not ( = ?auto_854762 ?auto_854764 ) ) ( not ( = ?auto_854762 ?auto_854766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854761 ?auto_854763 ?auto_854764 )
      ( MAKE-8CRATE-VERIFY ?auto_854757 ?auto_854758 ?auto_854759 ?auto_854756 ?auto_854760 ?auto_854762 ?auto_854761 ?auto_854763 ?auto_854764 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854850 - SURFACE
      ?auto_854851 - SURFACE
      ?auto_854852 - SURFACE
      ?auto_854849 - SURFACE
      ?auto_854853 - SURFACE
      ?auto_854855 - SURFACE
      ?auto_854854 - SURFACE
      ?auto_854856 - SURFACE
      ?auto_854857 - SURFACE
    )
    :vars
    (
      ?auto_854858 - HOIST
      ?auto_854860 - PLACE
      ?auto_854863 - PLACE
      ?auto_854861 - HOIST
      ?auto_854859 - SURFACE
      ?auto_854862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854858 ?auto_854860 ) ( SURFACE-AT ?auto_854856 ?auto_854860 ) ( CLEAR ?auto_854856 ) ( IS-CRATE ?auto_854857 ) ( not ( = ?auto_854856 ?auto_854857 ) ) ( AVAILABLE ?auto_854858 ) ( ON ?auto_854856 ?auto_854854 ) ( not ( = ?auto_854854 ?auto_854856 ) ) ( not ( = ?auto_854854 ?auto_854857 ) ) ( not ( = ?auto_854863 ?auto_854860 ) ) ( HOIST-AT ?auto_854861 ?auto_854863 ) ( not ( = ?auto_854858 ?auto_854861 ) ) ( AVAILABLE ?auto_854861 ) ( SURFACE-AT ?auto_854857 ?auto_854863 ) ( ON ?auto_854857 ?auto_854859 ) ( CLEAR ?auto_854857 ) ( not ( = ?auto_854856 ?auto_854859 ) ) ( not ( = ?auto_854857 ?auto_854859 ) ) ( not ( = ?auto_854854 ?auto_854859 ) ) ( TRUCK-AT ?auto_854862 ?auto_854860 ) ( ON ?auto_854851 ?auto_854850 ) ( ON ?auto_854852 ?auto_854851 ) ( ON ?auto_854849 ?auto_854852 ) ( ON ?auto_854853 ?auto_854849 ) ( ON ?auto_854855 ?auto_854853 ) ( ON ?auto_854854 ?auto_854855 ) ( not ( = ?auto_854850 ?auto_854851 ) ) ( not ( = ?auto_854850 ?auto_854852 ) ) ( not ( = ?auto_854850 ?auto_854849 ) ) ( not ( = ?auto_854850 ?auto_854853 ) ) ( not ( = ?auto_854850 ?auto_854855 ) ) ( not ( = ?auto_854850 ?auto_854854 ) ) ( not ( = ?auto_854850 ?auto_854856 ) ) ( not ( = ?auto_854850 ?auto_854857 ) ) ( not ( = ?auto_854850 ?auto_854859 ) ) ( not ( = ?auto_854851 ?auto_854852 ) ) ( not ( = ?auto_854851 ?auto_854849 ) ) ( not ( = ?auto_854851 ?auto_854853 ) ) ( not ( = ?auto_854851 ?auto_854855 ) ) ( not ( = ?auto_854851 ?auto_854854 ) ) ( not ( = ?auto_854851 ?auto_854856 ) ) ( not ( = ?auto_854851 ?auto_854857 ) ) ( not ( = ?auto_854851 ?auto_854859 ) ) ( not ( = ?auto_854852 ?auto_854849 ) ) ( not ( = ?auto_854852 ?auto_854853 ) ) ( not ( = ?auto_854852 ?auto_854855 ) ) ( not ( = ?auto_854852 ?auto_854854 ) ) ( not ( = ?auto_854852 ?auto_854856 ) ) ( not ( = ?auto_854852 ?auto_854857 ) ) ( not ( = ?auto_854852 ?auto_854859 ) ) ( not ( = ?auto_854849 ?auto_854853 ) ) ( not ( = ?auto_854849 ?auto_854855 ) ) ( not ( = ?auto_854849 ?auto_854854 ) ) ( not ( = ?auto_854849 ?auto_854856 ) ) ( not ( = ?auto_854849 ?auto_854857 ) ) ( not ( = ?auto_854849 ?auto_854859 ) ) ( not ( = ?auto_854853 ?auto_854855 ) ) ( not ( = ?auto_854853 ?auto_854854 ) ) ( not ( = ?auto_854853 ?auto_854856 ) ) ( not ( = ?auto_854853 ?auto_854857 ) ) ( not ( = ?auto_854853 ?auto_854859 ) ) ( not ( = ?auto_854855 ?auto_854854 ) ) ( not ( = ?auto_854855 ?auto_854856 ) ) ( not ( = ?auto_854855 ?auto_854857 ) ) ( not ( = ?auto_854855 ?auto_854859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854854 ?auto_854856 ?auto_854857 )
      ( MAKE-8CRATE-VERIFY ?auto_854850 ?auto_854851 ?auto_854852 ?auto_854849 ?auto_854853 ?auto_854855 ?auto_854854 ?auto_854856 ?auto_854857 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854943 - SURFACE
      ?auto_854944 - SURFACE
      ?auto_854945 - SURFACE
      ?auto_854942 - SURFACE
      ?auto_854946 - SURFACE
      ?auto_854948 - SURFACE
      ?auto_854947 - SURFACE
      ?auto_854949 - SURFACE
      ?auto_854950 - SURFACE
    )
    :vars
    (
      ?auto_854951 - HOIST
      ?auto_854954 - PLACE
      ?auto_854955 - PLACE
      ?auto_854953 - HOIST
      ?auto_854956 - SURFACE
      ?auto_854952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854951 ?auto_854954 ) ( IS-CRATE ?auto_854950 ) ( not ( = ?auto_854949 ?auto_854950 ) ) ( not ( = ?auto_854947 ?auto_854949 ) ) ( not ( = ?auto_854947 ?auto_854950 ) ) ( not ( = ?auto_854955 ?auto_854954 ) ) ( HOIST-AT ?auto_854953 ?auto_854955 ) ( not ( = ?auto_854951 ?auto_854953 ) ) ( AVAILABLE ?auto_854953 ) ( SURFACE-AT ?auto_854950 ?auto_854955 ) ( ON ?auto_854950 ?auto_854956 ) ( CLEAR ?auto_854950 ) ( not ( = ?auto_854949 ?auto_854956 ) ) ( not ( = ?auto_854950 ?auto_854956 ) ) ( not ( = ?auto_854947 ?auto_854956 ) ) ( TRUCK-AT ?auto_854952 ?auto_854954 ) ( SURFACE-AT ?auto_854947 ?auto_854954 ) ( CLEAR ?auto_854947 ) ( LIFTING ?auto_854951 ?auto_854949 ) ( IS-CRATE ?auto_854949 ) ( ON ?auto_854944 ?auto_854943 ) ( ON ?auto_854945 ?auto_854944 ) ( ON ?auto_854942 ?auto_854945 ) ( ON ?auto_854946 ?auto_854942 ) ( ON ?auto_854948 ?auto_854946 ) ( ON ?auto_854947 ?auto_854948 ) ( not ( = ?auto_854943 ?auto_854944 ) ) ( not ( = ?auto_854943 ?auto_854945 ) ) ( not ( = ?auto_854943 ?auto_854942 ) ) ( not ( = ?auto_854943 ?auto_854946 ) ) ( not ( = ?auto_854943 ?auto_854948 ) ) ( not ( = ?auto_854943 ?auto_854947 ) ) ( not ( = ?auto_854943 ?auto_854949 ) ) ( not ( = ?auto_854943 ?auto_854950 ) ) ( not ( = ?auto_854943 ?auto_854956 ) ) ( not ( = ?auto_854944 ?auto_854945 ) ) ( not ( = ?auto_854944 ?auto_854942 ) ) ( not ( = ?auto_854944 ?auto_854946 ) ) ( not ( = ?auto_854944 ?auto_854948 ) ) ( not ( = ?auto_854944 ?auto_854947 ) ) ( not ( = ?auto_854944 ?auto_854949 ) ) ( not ( = ?auto_854944 ?auto_854950 ) ) ( not ( = ?auto_854944 ?auto_854956 ) ) ( not ( = ?auto_854945 ?auto_854942 ) ) ( not ( = ?auto_854945 ?auto_854946 ) ) ( not ( = ?auto_854945 ?auto_854948 ) ) ( not ( = ?auto_854945 ?auto_854947 ) ) ( not ( = ?auto_854945 ?auto_854949 ) ) ( not ( = ?auto_854945 ?auto_854950 ) ) ( not ( = ?auto_854945 ?auto_854956 ) ) ( not ( = ?auto_854942 ?auto_854946 ) ) ( not ( = ?auto_854942 ?auto_854948 ) ) ( not ( = ?auto_854942 ?auto_854947 ) ) ( not ( = ?auto_854942 ?auto_854949 ) ) ( not ( = ?auto_854942 ?auto_854950 ) ) ( not ( = ?auto_854942 ?auto_854956 ) ) ( not ( = ?auto_854946 ?auto_854948 ) ) ( not ( = ?auto_854946 ?auto_854947 ) ) ( not ( = ?auto_854946 ?auto_854949 ) ) ( not ( = ?auto_854946 ?auto_854950 ) ) ( not ( = ?auto_854946 ?auto_854956 ) ) ( not ( = ?auto_854948 ?auto_854947 ) ) ( not ( = ?auto_854948 ?auto_854949 ) ) ( not ( = ?auto_854948 ?auto_854950 ) ) ( not ( = ?auto_854948 ?auto_854956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854947 ?auto_854949 ?auto_854950 )
      ( MAKE-8CRATE-VERIFY ?auto_854943 ?auto_854944 ?auto_854945 ?auto_854942 ?auto_854946 ?auto_854948 ?auto_854947 ?auto_854949 ?auto_854950 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_855036 - SURFACE
      ?auto_855037 - SURFACE
      ?auto_855038 - SURFACE
      ?auto_855035 - SURFACE
      ?auto_855039 - SURFACE
      ?auto_855041 - SURFACE
      ?auto_855040 - SURFACE
      ?auto_855042 - SURFACE
      ?auto_855043 - SURFACE
    )
    :vars
    (
      ?auto_855047 - HOIST
      ?auto_855045 - PLACE
      ?auto_855049 - PLACE
      ?auto_855046 - HOIST
      ?auto_855044 - SURFACE
      ?auto_855048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_855047 ?auto_855045 ) ( IS-CRATE ?auto_855043 ) ( not ( = ?auto_855042 ?auto_855043 ) ) ( not ( = ?auto_855040 ?auto_855042 ) ) ( not ( = ?auto_855040 ?auto_855043 ) ) ( not ( = ?auto_855049 ?auto_855045 ) ) ( HOIST-AT ?auto_855046 ?auto_855049 ) ( not ( = ?auto_855047 ?auto_855046 ) ) ( AVAILABLE ?auto_855046 ) ( SURFACE-AT ?auto_855043 ?auto_855049 ) ( ON ?auto_855043 ?auto_855044 ) ( CLEAR ?auto_855043 ) ( not ( = ?auto_855042 ?auto_855044 ) ) ( not ( = ?auto_855043 ?auto_855044 ) ) ( not ( = ?auto_855040 ?auto_855044 ) ) ( TRUCK-AT ?auto_855048 ?auto_855045 ) ( SURFACE-AT ?auto_855040 ?auto_855045 ) ( CLEAR ?auto_855040 ) ( IS-CRATE ?auto_855042 ) ( AVAILABLE ?auto_855047 ) ( IN ?auto_855042 ?auto_855048 ) ( ON ?auto_855037 ?auto_855036 ) ( ON ?auto_855038 ?auto_855037 ) ( ON ?auto_855035 ?auto_855038 ) ( ON ?auto_855039 ?auto_855035 ) ( ON ?auto_855041 ?auto_855039 ) ( ON ?auto_855040 ?auto_855041 ) ( not ( = ?auto_855036 ?auto_855037 ) ) ( not ( = ?auto_855036 ?auto_855038 ) ) ( not ( = ?auto_855036 ?auto_855035 ) ) ( not ( = ?auto_855036 ?auto_855039 ) ) ( not ( = ?auto_855036 ?auto_855041 ) ) ( not ( = ?auto_855036 ?auto_855040 ) ) ( not ( = ?auto_855036 ?auto_855042 ) ) ( not ( = ?auto_855036 ?auto_855043 ) ) ( not ( = ?auto_855036 ?auto_855044 ) ) ( not ( = ?auto_855037 ?auto_855038 ) ) ( not ( = ?auto_855037 ?auto_855035 ) ) ( not ( = ?auto_855037 ?auto_855039 ) ) ( not ( = ?auto_855037 ?auto_855041 ) ) ( not ( = ?auto_855037 ?auto_855040 ) ) ( not ( = ?auto_855037 ?auto_855042 ) ) ( not ( = ?auto_855037 ?auto_855043 ) ) ( not ( = ?auto_855037 ?auto_855044 ) ) ( not ( = ?auto_855038 ?auto_855035 ) ) ( not ( = ?auto_855038 ?auto_855039 ) ) ( not ( = ?auto_855038 ?auto_855041 ) ) ( not ( = ?auto_855038 ?auto_855040 ) ) ( not ( = ?auto_855038 ?auto_855042 ) ) ( not ( = ?auto_855038 ?auto_855043 ) ) ( not ( = ?auto_855038 ?auto_855044 ) ) ( not ( = ?auto_855035 ?auto_855039 ) ) ( not ( = ?auto_855035 ?auto_855041 ) ) ( not ( = ?auto_855035 ?auto_855040 ) ) ( not ( = ?auto_855035 ?auto_855042 ) ) ( not ( = ?auto_855035 ?auto_855043 ) ) ( not ( = ?auto_855035 ?auto_855044 ) ) ( not ( = ?auto_855039 ?auto_855041 ) ) ( not ( = ?auto_855039 ?auto_855040 ) ) ( not ( = ?auto_855039 ?auto_855042 ) ) ( not ( = ?auto_855039 ?auto_855043 ) ) ( not ( = ?auto_855039 ?auto_855044 ) ) ( not ( = ?auto_855041 ?auto_855040 ) ) ( not ( = ?auto_855041 ?auto_855042 ) ) ( not ( = ?auto_855041 ?auto_855043 ) ) ( not ( = ?auto_855041 ?auto_855044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_855040 ?auto_855042 ?auto_855043 )
      ( MAKE-8CRATE-VERIFY ?auto_855036 ?auto_855037 ?auto_855038 ?auto_855035 ?auto_855039 ?auto_855041 ?auto_855040 ?auto_855042 ?auto_855043 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859152 - SURFACE
      ?auto_859153 - SURFACE
      ?auto_859154 - SURFACE
      ?auto_859151 - SURFACE
      ?auto_859155 - SURFACE
      ?auto_859157 - SURFACE
      ?auto_859156 - SURFACE
      ?auto_859158 - SURFACE
      ?auto_859159 - SURFACE
      ?auto_859160 - SURFACE
    )
    :vars
    (
      ?auto_859161 - HOIST
      ?auto_859162 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859161 ?auto_859162 ) ( SURFACE-AT ?auto_859159 ?auto_859162 ) ( CLEAR ?auto_859159 ) ( LIFTING ?auto_859161 ?auto_859160 ) ( IS-CRATE ?auto_859160 ) ( not ( = ?auto_859159 ?auto_859160 ) ) ( ON ?auto_859153 ?auto_859152 ) ( ON ?auto_859154 ?auto_859153 ) ( ON ?auto_859151 ?auto_859154 ) ( ON ?auto_859155 ?auto_859151 ) ( ON ?auto_859157 ?auto_859155 ) ( ON ?auto_859156 ?auto_859157 ) ( ON ?auto_859158 ?auto_859156 ) ( ON ?auto_859159 ?auto_859158 ) ( not ( = ?auto_859152 ?auto_859153 ) ) ( not ( = ?auto_859152 ?auto_859154 ) ) ( not ( = ?auto_859152 ?auto_859151 ) ) ( not ( = ?auto_859152 ?auto_859155 ) ) ( not ( = ?auto_859152 ?auto_859157 ) ) ( not ( = ?auto_859152 ?auto_859156 ) ) ( not ( = ?auto_859152 ?auto_859158 ) ) ( not ( = ?auto_859152 ?auto_859159 ) ) ( not ( = ?auto_859152 ?auto_859160 ) ) ( not ( = ?auto_859153 ?auto_859154 ) ) ( not ( = ?auto_859153 ?auto_859151 ) ) ( not ( = ?auto_859153 ?auto_859155 ) ) ( not ( = ?auto_859153 ?auto_859157 ) ) ( not ( = ?auto_859153 ?auto_859156 ) ) ( not ( = ?auto_859153 ?auto_859158 ) ) ( not ( = ?auto_859153 ?auto_859159 ) ) ( not ( = ?auto_859153 ?auto_859160 ) ) ( not ( = ?auto_859154 ?auto_859151 ) ) ( not ( = ?auto_859154 ?auto_859155 ) ) ( not ( = ?auto_859154 ?auto_859157 ) ) ( not ( = ?auto_859154 ?auto_859156 ) ) ( not ( = ?auto_859154 ?auto_859158 ) ) ( not ( = ?auto_859154 ?auto_859159 ) ) ( not ( = ?auto_859154 ?auto_859160 ) ) ( not ( = ?auto_859151 ?auto_859155 ) ) ( not ( = ?auto_859151 ?auto_859157 ) ) ( not ( = ?auto_859151 ?auto_859156 ) ) ( not ( = ?auto_859151 ?auto_859158 ) ) ( not ( = ?auto_859151 ?auto_859159 ) ) ( not ( = ?auto_859151 ?auto_859160 ) ) ( not ( = ?auto_859155 ?auto_859157 ) ) ( not ( = ?auto_859155 ?auto_859156 ) ) ( not ( = ?auto_859155 ?auto_859158 ) ) ( not ( = ?auto_859155 ?auto_859159 ) ) ( not ( = ?auto_859155 ?auto_859160 ) ) ( not ( = ?auto_859157 ?auto_859156 ) ) ( not ( = ?auto_859157 ?auto_859158 ) ) ( not ( = ?auto_859157 ?auto_859159 ) ) ( not ( = ?auto_859157 ?auto_859160 ) ) ( not ( = ?auto_859156 ?auto_859158 ) ) ( not ( = ?auto_859156 ?auto_859159 ) ) ( not ( = ?auto_859156 ?auto_859160 ) ) ( not ( = ?auto_859158 ?auto_859159 ) ) ( not ( = ?auto_859158 ?auto_859160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859159 ?auto_859160 )
      ( MAKE-9CRATE-VERIFY ?auto_859152 ?auto_859153 ?auto_859154 ?auto_859151 ?auto_859155 ?auto_859157 ?auto_859156 ?auto_859158 ?auto_859159 ?auto_859160 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859232 - SURFACE
      ?auto_859233 - SURFACE
      ?auto_859234 - SURFACE
      ?auto_859231 - SURFACE
      ?auto_859235 - SURFACE
      ?auto_859237 - SURFACE
      ?auto_859236 - SURFACE
      ?auto_859238 - SURFACE
      ?auto_859239 - SURFACE
      ?auto_859240 - SURFACE
    )
    :vars
    (
      ?auto_859242 - HOIST
      ?auto_859241 - PLACE
      ?auto_859243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859242 ?auto_859241 ) ( SURFACE-AT ?auto_859239 ?auto_859241 ) ( CLEAR ?auto_859239 ) ( IS-CRATE ?auto_859240 ) ( not ( = ?auto_859239 ?auto_859240 ) ) ( TRUCK-AT ?auto_859243 ?auto_859241 ) ( AVAILABLE ?auto_859242 ) ( IN ?auto_859240 ?auto_859243 ) ( ON ?auto_859239 ?auto_859238 ) ( not ( = ?auto_859238 ?auto_859239 ) ) ( not ( = ?auto_859238 ?auto_859240 ) ) ( ON ?auto_859233 ?auto_859232 ) ( ON ?auto_859234 ?auto_859233 ) ( ON ?auto_859231 ?auto_859234 ) ( ON ?auto_859235 ?auto_859231 ) ( ON ?auto_859237 ?auto_859235 ) ( ON ?auto_859236 ?auto_859237 ) ( ON ?auto_859238 ?auto_859236 ) ( not ( = ?auto_859232 ?auto_859233 ) ) ( not ( = ?auto_859232 ?auto_859234 ) ) ( not ( = ?auto_859232 ?auto_859231 ) ) ( not ( = ?auto_859232 ?auto_859235 ) ) ( not ( = ?auto_859232 ?auto_859237 ) ) ( not ( = ?auto_859232 ?auto_859236 ) ) ( not ( = ?auto_859232 ?auto_859238 ) ) ( not ( = ?auto_859232 ?auto_859239 ) ) ( not ( = ?auto_859232 ?auto_859240 ) ) ( not ( = ?auto_859233 ?auto_859234 ) ) ( not ( = ?auto_859233 ?auto_859231 ) ) ( not ( = ?auto_859233 ?auto_859235 ) ) ( not ( = ?auto_859233 ?auto_859237 ) ) ( not ( = ?auto_859233 ?auto_859236 ) ) ( not ( = ?auto_859233 ?auto_859238 ) ) ( not ( = ?auto_859233 ?auto_859239 ) ) ( not ( = ?auto_859233 ?auto_859240 ) ) ( not ( = ?auto_859234 ?auto_859231 ) ) ( not ( = ?auto_859234 ?auto_859235 ) ) ( not ( = ?auto_859234 ?auto_859237 ) ) ( not ( = ?auto_859234 ?auto_859236 ) ) ( not ( = ?auto_859234 ?auto_859238 ) ) ( not ( = ?auto_859234 ?auto_859239 ) ) ( not ( = ?auto_859234 ?auto_859240 ) ) ( not ( = ?auto_859231 ?auto_859235 ) ) ( not ( = ?auto_859231 ?auto_859237 ) ) ( not ( = ?auto_859231 ?auto_859236 ) ) ( not ( = ?auto_859231 ?auto_859238 ) ) ( not ( = ?auto_859231 ?auto_859239 ) ) ( not ( = ?auto_859231 ?auto_859240 ) ) ( not ( = ?auto_859235 ?auto_859237 ) ) ( not ( = ?auto_859235 ?auto_859236 ) ) ( not ( = ?auto_859235 ?auto_859238 ) ) ( not ( = ?auto_859235 ?auto_859239 ) ) ( not ( = ?auto_859235 ?auto_859240 ) ) ( not ( = ?auto_859237 ?auto_859236 ) ) ( not ( = ?auto_859237 ?auto_859238 ) ) ( not ( = ?auto_859237 ?auto_859239 ) ) ( not ( = ?auto_859237 ?auto_859240 ) ) ( not ( = ?auto_859236 ?auto_859238 ) ) ( not ( = ?auto_859236 ?auto_859239 ) ) ( not ( = ?auto_859236 ?auto_859240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859238 ?auto_859239 ?auto_859240 )
      ( MAKE-9CRATE-VERIFY ?auto_859232 ?auto_859233 ?auto_859234 ?auto_859231 ?auto_859235 ?auto_859237 ?auto_859236 ?auto_859238 ?auto_859239 ?auto_859240 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859322 - SURFACE
      ?auto_859323 - SURFACE
      ?auto_859324 - SURFACE
      ?auto_859321 - SURFACE
      ?auto_859325 - SURFACE
      ?auto_859327 - SURFACE
      ?auto_859326 - SURFACE
      ?auto_859328 - SURFACE
      ?auto_859329 - SURFACE
      ?auto_859330 - SURFACE
    )
    :vars
    (
      ?auto_859334 - HOIST
      ?auto_859332 - PLACE
      ?auto_859331 - TRUCK
      ?auto_859333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859334 ?auto_859332 ) ( SURFACE-AT ?auto_859329 ?auto_859332 ) ( CLEAR ?auto_859329 ) ( IS-CRATE ?auto_859330 ) ( not ( = ?auto_859329 ?auto_859330 ) ) ( AVAILABLE ?auto_859334 ) ( IN ?auto_859330 ?auto_859331 ) ( ON ?auto_859329 ?auto_859328 ) ( not ( = ?auto_859328 ?auto_859329 ) ) ( not ( = ?auto_859328 ?auto_859330 ) ) ( TRUCK-AT ?auto_859331 ?auto_859333 ) ( not ( = ?auto_859333 ?auto_859332 ) ) ( ON ?auto_859323 ?auto_859322 ) ( ON ?auto_859324 ?auto_859323 ) ( ON ?auto_859321 ?auto_859324 ) ( ON ?auto_859325 ?auto_859321 ) ( ON ?auto_859327 ?auto_859325 ) ( ON ?auto_859326 ?auto_859327 ) ( ON ?auto_859328 ?auto_859326 ) ( not ( = ?auto_859322 ?auto_859323 ) ) ( not ( = ?auto_859322 ?auto_859324 ) ) ( not ( = ?auto_859322 ?auto_859321 ) ) ( not ( = ?auto_859322 ?auto_859325 ) ) ( not ( = ?auto_859322 ?auto_859327 ) ) ( not ( = ?auto_859322 ?auto_859326 ) ) ( not ( = ?auto_859322 ?auto_859328 ) ) ( not ( = ?auto_859322 ?auto_859329 ) ) ( not ( = ?auto_859322 ?auto_859330 ) ) ( not ( = ?auto_859323 ?auto_859324 ) ) ( not ( = ?auto_859323 ?auto_859321 ) ) ( not ( = ?auto_859323 ?auto_859325 ) ) ( not ( = ?auto_859323 ?auto_859327 ) ) ( not ( = ?auto_859323 ?auto_859326 ) ) ( not ( = ?auto_859323 ?auto_859328 ) ) ( not ( = ?auto_859323 ?auto_859329 ) ) ( not ( = ?auto_859323 ?auto_859330 ) ) ( not ( = ?auto_859324 ?auto_859321 ) ) ( not ( = ?auto_859324 ?auto_859325 ) ) ( not ( = ?auto_859324 ?auto_859327 ) ) ( not ( = ?auto_859324 ?auto_859326 ) ) ( not ( = ?auto_859324 ?auto_859328 ) ) ( not ( = ?auto_859324 ?auto_859329 ) ) ( not ( = ?auto_859324 ?auto_859330 ) ) ( not ( = ?auto_859321 ?auto_859325 ) ) ( not ( = ?auto_859321 ?auto_859327 ) ) ( not ( = ?auto_859321 ?auto_859326 ) ) ( not ( = ?auto_859321 ?auto_859328 ) ) ( not ( = ?auto_859321 ?auto_859329 ) ) ( not ( = ?auto_859321 ?auto_859330 ) ) ( not ( = ?auto_859325 ?auto_859327 ) ) ( not ( = ?auto_859325 ?auto_859326 ) ) ( not ( = ?auto_859325 ?auto_859328 ) ) ( not ( = ?auto_859325 ?auto_859329 ) ) ( not ( = ?auto_859325 ?auto_859330 ) ) ( not ( = ?auto_859327 ?auto_859326 ) ) ( not ( = ?auto_859327 ?auto_859328 ) ) ( not ( = ?auto_859327 ?auto_859329 ) ) ( not ( = ?auto_859327 ?auto_859330 ) ) ( not ( = ?auto_859326 ?auto_859328 ) ) ( not ( = ?auto_859326 ?auto_859329 ) ) ( not ( = ?auto_859326 ?auto_859330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859328 ?auto_859329 ?auto_859330 )
      ( MAKE-9CRATE-VERIFY ?auto_859322 ?auto_859323 ?auto_859324 ?auto_859321 ?auto_859325 ?auto_859327 ?auto_859326 ?auto_859328 ?auto_859329 ?auto_859330 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859421 - SURFACE
      ?auto_859422 - SURFACE
      ?auto_859423 - SURFACE
      ?auto_859420 - SURFACE
      ?auto_859424 - SURFACE
      ?auto_859426 - SURFACE
      ?auto_859425 - SURFACE
      ?auto_859427 - SURFACE
      ?auto_859428 - SURFACE
      ?auto_859429 - SURFACE
    )
    :vars
    (
      ?auto_859430 - HOIST
      ?auto_859434 - PLACE
      ?auto_859433 - TRUCK
      ?auto_859431 - PLACE
      ?auto_859432 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_859430 ?auto_859434 ) ( SURFACE-AT ?auto_859428 ?auto_859434 ) ( CLEAR ?auto_859428 ) ( IS-CRATE ?auto_859429 ) ( not ( = ?auto_859428 ?auto_859429 ) ) ( AVAILABLE ?auto_859430 ) ( ON ?auto_859428 ?auto_859427 ) ( not ( = ?auto_859427 ?auto_859428 ) ) ( not ( = ?auto_859427 ?auto_859429 ) ) ( TRUCK-AT ?auto_859433 ?auto_859431 ) ( not ( = ?auto_859431 ?auto_859434 ) ) ( HOIST-AT ?auto_859432 ?auto_859431 ) ( LIFTING ?auto_859432 ?auto_859429 ) ( not ( = ?auto_859430 ?auto_859432 ) ) ( ON ?auto_859422 ?auto_859421 ) ( ON ?auto_859423 ?auto_859422 ) ( ON ?auto_859420 ?auto_859423 ) ( ON ?auto_859424 ?auto_859420 ) ( ON ?auto_859426 ?auto_859424 ) ( ON ?auto_859425 ?auto_859426 ) ( ON ?auto_859427 ?auto_859425 ) ( not ( = ?auto_859421 ?auto_859422 ) ) ( not ( = ?auto_859421 ?auto_859423 ) ) ( not ( = ?auto_859421 ?auto_859420 ) ) ( not ( = ?auto_859421 ?auto_859424 ) ) ( not ( = ?auto_859421 ?auto_859426 ) ) ( not ( = ?auto_859421 ?auto_859425 ) ) ( not ( = ?auto_859421 ?auto_859427 ) ) ( not ( = ?auto_859421 ?auto_859428 ) ) ( not ( = ?auto_859421 ?auto_859429 ) ) ( not ( = ?auto_859422 ?auto_859423 ) ) ( not ( = ?auto_859422 ?auto_859420 ) ) ( not ( = ?auto_859422 ?auto_859424 ) ) ( not ( = ?auto_859422 ?auto_859426 ) ) ( not ( = ?auto_859422 ?auto_859425 ) ) ( not ( = ?auto_859422 ?auto_859427 ) ) ( not ( = ?auto_859422 ?auto_859428 ) ) ( not ( = ?auto_859422 ?auto_859429 ) ) ( not ( = ?auto_859423 ?auto_859420 ) ) ( not ( = ?auto_859423 ?auto_859424 ) ) ( not ( = ?auto_859423 ?auto_859426 ) ) ( not ( = ?auto_859423 ?auto_859425 ) ) ( not ( = ?auto_859423 ?auto_859427 ) ) ( not ( = ?auto_859423 ?auto_859428 ) ) ( not ( = ?auto_859423 ?auto_859429 ) ) ( not ( = ?auto_859420 ?auto_859424 ) ) ( not ( = ?auto_859420 ?auto_859426 ) ) ( not ( = ?auto_859420 ?auto_859425 ) ) ( not ( = ?auto_859420 ?auto_859427 ) ) ( not ( = ?auto_859420 ?auto_859428 ) ) ( not ( = ?auto_859420 ?auto_859429 ) ) ( not ( = ?auto_859424 ?auto_859426 ) ) ( not ( = ?auto_859424 ?auto_859425 ) ) ( not ( = ?auto_859424 ?auto_859427 ) ) ( not ( = ?auto_859424 ?auto_859428 ) ) ( not ( = ?auto_859424 ?auto_859429 ) ) ( not ( = ?auto_859426 ?auto_859425 ) ) ( not ( = ?auto_859426 ?auto_859427 ) ) ( not ( = ?auto_859426 ?auto_859428 ) ) ( not ( = ?auto_859426 ?auto_859429 ) ) ( not ( = ?auto_859425 ?auto_859427 ) ) ( not ( = ?auto_859425 ?auto_859428 ) ) ( not ( = ?auto_859425 ?auto_859429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859427 ?auto_859428 ?auto_859429 )
      ( MAKE-9CRATE-VERIFY ?auto_859421 ?auto_859422 ?auto_859423 ?auto_859420 ?auto_859424 ?auto_859426 ?auto_859425 ?auto_859427 ?auto_859428 ?auto_859429 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859529 - SURFACE
      ?auto_859530 - SURFACE
      ?auto_859531 - SURFACE
      ?auto_859528 - SURFACE
      ?auto_859532 - SURFACE
      ?auto_859534 - SURFACE
      ?auto_859533 - SURFACE
      ?auto_859535 - SURFACE
      ?auto_859536 - SURFACE
      ?auto_859537 - SURFACE
    )
    :vars
    (
      ?auto_859540 - HOIST
      ?auto_859541 - PLACE
      ?auto_859543 - TRUCK
      ?auto_859542 - PLACE
      ?auto_859538 - HOIST
      ?auto_859539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859540 ?auto_859541 ) ( SURFACE-AT ?auto_859536 ?auto_859541 ) ( CLEAR ?auto_859536 ) ( IS-CRATE ?auto_859537 ) ( not ( = ?auto_859536 ?auto_859537 ) ) ( AVAILABLE ?auto_859540 ) ( ON ?auto_859536 ?auto_859535 ) ( not ( = ?auto_859535 ?auto_859536 ) ) ( not ( = ?auto_859535 ?auto_859537 ) ) ( TRUCK-AT ?auto_859543 ?auto_859542 ) ( not ( = ?auto_859542 ?auto_859541 ) ) ( HOIST-AT ?auto_859538 ?auto_859542 ) ( not ( = ?auto_859540 ?auto_859538 ) ) ( AVAILABLE ?auto_859538 ) ( SURFACE-AT ?auto_859537 ?auto_859542 ) ( ON ?auto_859537 ?auto_859539 ) ( CLEAR ?auto_859537 ) ( not ( = ?auto_859536 ?auto_859539 ) ) ( not ( = ?auto_859537 ?auto_859539 ) ) ( not ( = ?auto_859535 ?auto_859539 ) ) ( ON ?auto_859530 ?auto_859529 ) ( ON ?auto_859531 ?auto_859530 ) ( ON ?auto_859528 ?auto_859531 ) ( ON ?auto_859532 ?auto_859528 ) ( ON ?auto_859534 ?auto_859532 ) ( ON ?auto_859533 ?auto_859534 ) ( ON ?auto_859535 ?auto_859533 ) ( not ( = ?auto_859529 ?auto_859530 ) ) ( not ( = ?auto_859529 ?auto_859531 ) ) ( not ( = ?auto_859529 ?auto_859528 ) ) ( not ( = ?auto_859529 ?auto_859532 ) ) ( not ( = ?auto_859529 ?auto_859534 ) ) ( not ( = ?auto_859529 ?auto_859533 ) ) ( not ( = ?auto_859529 ?auto_859535 ) ) ( not ( = ?auto_859529 ?auto_859536 ) ) ( not ( = ?auto_859529 ?auto_859537 ) ) ( not ( = ?auto_859529 ?auto_859539 ) ) ( not ( = ?auto_859530 ?auto_859531 ) ) ( not ( = ?auto_859530 ?auto_859528 ) ) ( not ( = ?auto_859530 ?auto_859532 ) ) ( not ( = ?auto_859530 ?auto_859534 ) ) ( not ( = ?auto_859530 ?auto_859533 ) ) ( not ( = ?auto_859530 ?auto_859535 ) ) ( not ( = ?auto_859530 ?auto_859536 ) ) ( not ( = ?auto_859530 ?auto_859537 ) ) ( not ( = ?auto_859530 ?auto_859539 ) ) ( not ( = ?auto_859531 ?auto_859528 ) ) ( not ( = ?auto_859531 ?auto_859532 ) ) ( not ( = ?auto_859531 ?auto_859534 ) ) ( not ( = ?auto_859531 ?auto_859533 ) ) ( not ( = ?auto_859531 ?auto_859535 ) ) ( not ( = ?auto_859531 ?auto_859536 ) ) ( not ( = ?auto_859531 ?auto_859537 ) ) ( not ( = ?auto_859531 ?auto_859539 ) ) ( not ( = ?auto_859528 ?auto_859532 ) ) ( not ( = ?auto_859528 ?auto_859534 ) ) ( not ( = ?auto_859528 ?auto_859533 ) ) ( not ( = ?auto_859528 ?auto_859535 ) ) ( not ( = ?auto_859528 ?auto_859536 ) ) ( not ( = ?auto_859528 ?auto_859537 ) ) ( not ( = ?auto_859528 ?auto_859539 ) ) ( not ( = ?auto_859532 ?auto_859534 ) ) ( not ( = ?auto_859532 ?auto_859533 ) ) ( not ( = ?auto_859532 ?auto_859535 ) ) ( not ( = ?auto_859532 ?auto_859536 ) ) ( not ( = ?auto_859532 ?auto_859537 ) ) ( not ( = ?auto_859532 ?auto_859539 ) ) ( not ( = ?auto_859534 ?auto_859533 ) ) ( not ( = ?auto_859534 ?auto_859535 ) ) ( not ( = ?auto_859534 ?auto_859536 ) ) ( not ( = ?auto_859534 ?auto_859537 ) ) ( not ( = ?auto_859534 ?auto_859539 ) ) ( not ( = ?auto_859533 ?auto_859535 ) ) ( not ( = ?auto_859533 ?auto_859536 ) ) ( not ( = ?auto_859533 ?auto_859537 ) ) ( not ( = ?auto_859533 ?auto_859539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859535 ?auto_859536 ?auto_859537 )
      ( MAKE-9CRATE-VERIFY ?auto_859529 ?auto_859530 ?auto_859531 ?auto_859528 ?auto_859532 ?auto_859534 ?auto_859533 ?auto_859535 ?auto_859536 ?auto_859537 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859638 - SURFACE
      ?auto_859639 - SURFACE
      ?auto_859640 - SURFACE
      ?auto_859637 - SURFACE
      ?auto_859641 - SURFACE
      ?auto_859643 - SURFACE
      ?auto_859642 - SURFACE
      ?auto_859644 - SURFACE
      ?auto_859645 - SURFACE
      ?auto_859646 - SURFACE
    )
    :vars
    (
      ?auto_859651 - HOIST
      ?auto_859649 - PLACE
      ?auto_859650 - PLACE
      ?auto_859652 - HOIST
      ?auto_859647 - SURFACE
      ?auto_859648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859651 ?auto_859649 ) ( SURFACE-AT ?auto_859645 ?auto_859649 ) ( CLEAR ?auto_859645 ) ( IS-CRATE ?auto_859646 ) ( not ( = ?auto_859645 ?auto_859646 ) ) ( AVAILABLE ?auto_859651 ) ( ON ?auto_859645 ?auto_859644 ) ( not ( = ?auto_859644 ?auto_859645 ) ) ( not ( = ?auto_859644 ?auto_859646 ) ) ( not ( = ?auto_859650 ?auto_859649 ) ) ( HOIST-AT ?auto_859652 ?auto_859650 ) ( not ( = ?auto_859651 ?auto_859652 ) ) ( AVAILABLE ?auto_859652 ) ( SURFACE-AT ?auto_859646 ?auto_859650 ) ( ON ?auto_859646 ?auto_859647 ) ( CLEAR ?auto_859646 ) ( not ( = ?auto_859645 ?auto_859647 ) ) ( not ( = ?auto_859646 ?auto_859647 ) ) ( not ( = ?auto_859644 ?auto_859647 ) ) ( TRUCK-AT ?auto_859648 ?auto_859649 ) ( ON ?auto_859639 ?auto_859638 ) ( ON ?auto_859640 ?auto_859639 ) ( ON ?auto_859637 ?auto_859640 ) ( ON ?auto_859641 ?auto_859637 ) ( ON ?auto_859643 ?auto_859641 ) ( ON ?auto_859642 ?auto_859643 ) ( ON ?auto_859644 ?auto_859642 ) ( not ( = ?auto_859638 ?auto_859639 ) ) ( not ( = ?auto_859638 ?auto_859640 ) ) ( not ( = ?auto_859638 ?auto_859637 ) ) ( not ( = ?auto_859638 ?auto_859641 ) ) ( not ( = ?auto_859638 ?auto_859643 ) ) ( not ( = ?auto_859638 ?auto_859642 ) ) ( not ( = ?auto_859638 ?auto_859644 ) ) ( not ( = ?auto_859638 ?auto_859645 ) ) ( not ( = ?auto_859638 ?auto_859646 ) ) ( not ( = ?auto_859638 ?auto_859647 ) ) ( not ( = ?auto_859639 ?auto_859640 ) ) ( not ( = ?auto_859639 ?auto_859637 ) ) ( not ( = ?auto_859639 ?auto_859641 ) ) ( not ( = ?auto_859639 ?auto_859643 ) ) ( not ( = ?auto_859639 ?auto_859642 ) ) ( not ( = ?auto_859639 ?auto_859644 ) ) ( not ( = ?auto_859639 ?auto_859645 ) ) ( not ( = ?auto_859639 ?auto_859646 ) ) ( not ( = ?auto_859639 ?auto_859647 ) ) ( not ( = ?auto_859640 ?auto_859637 ) ) ( not ( = ?auto_859640 ?auto_859641 ) ) ( not ( = ?auto_859640 ?auto_859643 ) ) ( not ( = ?auto_859640 ?auto_859642 ) ) ( not ( = ?auto_859640 ?auto_859644 ) ) ( not ( = ?auto_859640 ?auto_859645 ) ) ( not ( = ?auto_859640 ?auto_859646 ) ) ( not ( = ?auto_859640 ?auto_859647 ) ) ( not ( = ?auto_859637 ?auto_859641 ) ) ( not ( = ?auto_859637 ?auto_859643 ) ) ( not ( = ?auto_859637 ?auto_859642 ) ) ( not ( = ?auto_859637 ?auto_859644 ) ) ( not ( = ?auto_859637 ?auto_859645 ) ) ( not ( = ?auto_859637 ?auto_859646 ) ) ( not ( = ?auto_859637 ?auto_859647 ) ) ( not ( = ?auto_859641 ?auto_859643 ) ) ( not ( = ?auto_859641 ?auto_859642 ) ) ( not ( = ?auto_859641 ?auto_859644 ) ) ( not ( = ?auto_859641 ?auto_859645 ) ) ( not ( = ?auto_859641 ?auto_859646 ) ) ( not ( = ?auto_859641 ?auto_859647 ) ) ( not ( = ?auto_859643 ?auto_859642 ) ) ( not ( = ?auto_859643 ?auto_859644 ) ) ( not ( = ?auto_859643 ?auto_859645 ) ) ( not ( = ?auto_859643 ?auto_859646 ) ) ( not ( = ?auto_859643 ?auto_859647 ) ) ( not ( = ?auto_859642 ?auto_859644 ) ) ( not ( = ?auto_859642 ?auto_859645 ) ) ( not ( = ?auto_859642 ?auto_859646 ) ) ( not ( = ?auto_859642 ?auto_859647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859644 ?auto_859645 ?auto_859646 )
      ( MAKE-9CRATE-VERIFY ?auto_859638 ?auto_859639 ?auto_859640 ?auto_859637 ?auto_859641 ?auto_859643 ?auto_859642 ?auto_859644 ?auto_859645 ?auto_859646 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859747 - SURFACE
      ?auto_859748 - SURFACE
      ?auto_859749 - SURFACE
      ?auto_859746 - SURFACE
      ?auto_859750 - SURFACE
      ?auto_859752 - SURFACE
      ?auto_859751 - SURFACE
      ?auto_859753 - SURFACE
      ?auto_859754 - SURFACE
      ?auto_859755 - SURFACE
    )
    :vars
    (
      ?auto_859758 - HOIST
      ?auto_859756 - PLACE
      ?auto_859757 - PLACE
      ?auto_859759 - HOIST
      ?auto_859761 - SURFACE
      ?auto_859760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859758 ?auto_859756 ) ( IS-CRATE ?auto_859755 ) ( not ( = ?auto_859754 ?auto_859755 ) ) ( not ( = ?auto_859753 ?auto_859754 ) ) ( not ( = ?auto_859753 ?auto_859755 ) ) ( not ( = ?auto_859757 ?auto_859756 ) ) ( HOIST-AT ?auto_859759 ?auto_859757 ) ( not ( = ?auto_859758 ?auto_859759 ) ) ( AVAILABLE ?auto_859759 ) ( SURFACE-AT ?auto_859755 ?auto_859757 ) ( ON ?auto_859755 ?auto_859761 ) ( CLEAR ?auto_859755 ) ( not ( = ?auto_859754 ?auto_859761 ) ) ( not ( = ?auto_859755 ?auto_859761 ) ) ( not ( = ?auto_859753 ?auto_859761 ) ) ( TRUCK-AT ?auto_859760 ?auto_859756 ) ( SURFACE-AT ?auto_859753 ?auto_859756 ) ( CLEAR ?auto_859753 ) ( LIFTING ?auto_859758 ?auto_859754 ) ( IS-CRATE ?auto_859754 ) ( ON ?auto_859748 ?auto_859747 ) ( ON ?auto_859749 ?auto_859748 ) ( ON ?auto_859746 ?auto_859749 ) ( ON ?auto_859750 ?auto_859746 ) ( ON ?auto_859752 ?auto_859750 ) ( ON ?auto_859751 ?auto_859752 ) ( ON ?auto_859753 ?auto_859751 ) ( not ( = ?auto_859747 ?auto_859748 ) ) ( not ( = ?auto_859747 ?auto_859749 ) ) ( not ( = ?auto_859747 ?auto_859746 ) ) ( not ( = ?auto_859747 ?auto_859750 ) ) ( not ( = ?auto_859747 ?auto_859752 ) ) ( not ( = ?auto_859747 ?auto_859751 ) ) ( not ( = ?auto_859747 ?auto_859753 ) ) ( not ( = ?auto_859747 ?auto_859754 ) ) ( not ( = ?auto_859747 ?auto_859755 ) ) ( not ( = ?auto_859747 ?auto_859761 ) ) ( not ( = ?auto_859748 ?auto_859749 ) ) ( not ( = ?auto_859748 ?auto_859746 ) ) ( not ( = ?auto_859748 ?auto_859750 ) ) ( not ( = ?auto_859748 ?auto_859752 ) ) ( not ( = ?auto_859748 ?auto_859751 ) ) ( not ( = ?auto_859748 ?auto_859753 ) ) ( not ( = ?auto_859748 ?auto_859754 ) ) ( not ( = ?auto_859748 ?auto_859755 ) ) ( not ( = ?auto_859748 ?auto_859761 ) ) ( not ( = ?auto_859749 ?auto_859746 ) ) ( not ( = ?auto_859749 ?auto_859750 ) ) ( not ( = ?auto_859749 ?auto_859752 ) ) ( not ( = ?auto_859749 ?auto_859751 ) ) ( not ( = ?auto_859749 ?auto_859753 ) ) ( not ( = ?auto_859749 ?auto_859754 ) ) ( not ( = ?auto_859749 ?auto_859755 ) ) ( not ( = ?auto_859749 ?auto_859761 ) ) ( not ( = ?auto_859746 ?auto_859750 ) ) ( not ( = ?auto_859746 ?auto_859752 ) ) ( not ( = ?auto_859746 ?auto_859751 ) ) ( not ( = ?auto_859746 ?auto_859753 ) ) ( not ( = ?auto_859746 ?auto_859754 ) ) ( not ( = ?auto_859746 ?auto_859755 ) ) ( not ( = ?auto_859746 ?auto_859761 ) ) ( not ( = ?auto_859750 ?auto_859752 ) ) ( not ( = ?auto_859750 ?auto_859751 ) ) ( not ( = ?auto_859750 ?auto_859753 ) ) ( not ( = ?auto_859750 ?auto_859754 ) ) ( not ( = ?auto_859750 ?auto_859755 ) ) ( not ( = ?auto_859750 ?auto_859761 ) ) ( not ( = ?auto_859752 ?auto_859751 ) ) ( not ( = ?auto_859752 ?auto_859753 ) ) ( not ( = ?auto_859752 ?auto_859754 ) ) ( not ( = ?auto_859752 ?auto_859755 ) ) ( not ( = ?auto_859752 ?auto_859761 ) ) ( not ( = ?auto_859751 ?auto_859753 ) ) ( not ( = ?auto_859751 ?auto_859754 ) ) ( not ( = ?auto_859751 ?auto_859755 ) ) ( not ( = ?auto_859751 ?auto_859761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859753 ?auto_859754 ?auto_859755 )
      ( MAKE-9CRATE-VERIFY ?auto_859747 ?auto_859748 ?auto_859749 ?auto_859746 ?auto_859750 ?auto_859752 ?auto_859751 ?auto_859753 ?auto_859754 ?auto_859755 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859856 - SURFACE
      ?auto_859857 - SURFACE
      ?auto_859858 - SURFACE
      ?auto_859855 - SURFACE
      ?auto_859859 - SURFACE
      ?auto_859861 - SURFACE
      ?auto_859860 - SURFACE
      ?auto_859862 - SURFACE
      ?auto_859863 - SURFACE
      ?auto_859864 - SURFACE
    )
    :vars
    (
      ?auto_859869 - HOIST
      ?auto_859870 - PLACE
      ?auto_859868 - PLACE
      ?auto_859865 - HOIST
      ?auto_859867 - SURFACE
      ?auto_859866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859869 ?auto_859870 ) ( IS-CRATE ?auto_859864 ) ( not ( = ?auto_859863 ?auto_859864 ) ) ( not ( = ?auto_859862 ?auto_859863 ) ) ( not ( = ?auto_859862 ?auto_859864 ) ) ( not ( = ?auto_859868 ?auto_859870 ) ) ( HOIST-AT ?auto_859865 ?auto_859868 ) ( not ( = ?auto_859869 ?auto_859865 ) ) ( AVAILABLE ?auto_859865 ) ( SURFACE-AT ?auto_859864 ?auto_859868 ) ( ON ?auto_859864 ?auto_859867 ) ( CLEAR ?auto_859864 ) ( not ( = ?auto_859863 ?auto_859867 ) ) ( not ( = ?auto_859864 ?auto_859867 ) ) ( not ( = ?auto_859862 ?auto_859867 ) ) ( TRUCK-AT ?auto_859866 ?auto_859870 ) ( SURFACE-AT ?auto_859862 ?auto_859870 ) ( CLEAR ?auto_859862 ) ( IS-CRATE ?auto_859863 ) ( AVAILABLE ?auto_859869 ) ( IN ?auto_859863 ?auto_859866 ) ( ON ?auto_859857 ?auto_859856 ) ( ON ?auto_859858 ?auto_859857 ) ( ON ?auto_859855 ?auto_859858 ) ( ON ?auto_859859 ?auto_859855 ) ( ON ?auto_859861 ?auto_859859 ) ( ON ?auto_859860 ?auto_859861 ) ( ON ?auto_859862 ?auto_859860 ) ( not ( = ?auto_859856 ?auto_859857 ) ) ( not ( = ?auto_859856 ?auto_859858 ) ) ( not ( = ?auto_859856 ?auto_859855 ) ) ( not ( = ?auto_859856 ?auto_859859 ) ) ( not ( = ?auto_859856 ?auto_859861 ) ) ( not ( = ?auto_859856 ?auto_859860 ) ) ( not ( = ?auto_859856 ?auto_859862 ) ) ( not ( = ?auto_859856 ?auto_859863 ) ) ( not ( = ?auto_859856 ?auto_859864 ) ) ( not ( = ?auto_859856 ?auto_859867 ) ) ( not ( = ?auto_859857 ?auto_859858 ) ) ( not ( = ?auto_859857 ?auto_859855 ) ) ( not ( = ?auto_859857 ?auto_859859 ) ) ( not ( = ?auto_859857 ?auto_859861 ) ) ( not ( = ?auto_859857 ?auto_859860 ) ) ( not ( = ?auto_859857 ?auto_859862 ) ) ( not ( = ?auto_859857 ?auto_859863 ) ) ( not ( = ?auto_859857 ?auto_859864 ) ) ( not ( = ?auto_859857 ?auto_859867 ) ) ( not ( = ?auto_859858 ?auto_859855 ) ) ( not ( = ?auto_859858 ?auto_859859 ) ) ( not ( = ?auto_859858 ?auto_859861 ) ) ( not ( = ?auto_859858 ?auto_859860 ) ) ( not ( = ?auto_859858 ?auto_859862 ) ) ( not ( = ?auto_859858 ?auto_859863 ) ) ( not ( = ?auto_859858 ?auto_859864 ) ) ( not ( = ?auto_859858 ?auto_859867 ) ) ( not ( = ?auto_859855 ?auto_859859 ) ) ( not ( = ?auto_859855 ?auto_859861 ) ) ( not ( = ?auto_859855 ?auto_859860 ) ) ( not ( = ?auto_859855 ?auto_859862 ) ) ( not ( = ?auto_859855 ?auto_859863 ) ) ( not ( = ?auto_859855 ?auto_859864 ) ) ( not ( = ?auto_859855 ?auto_859867 ) ) ( not ( = ?auto_859859 ?auto_859861 ) ) ( not ( = ?auto_859859 ?auto_859860 ) ) ( not ( = ?auto_859859 ?auto_859862 ) ) ( not ( = ?auto_859859 ?auto_859863 ) ) ( not ( = ?auto_859859 ?auto_859864 ) ) ( not ( = ?auto_859859 ?auto_859867 ) ) ( not ( = ?auto_859861 ?auto_859860 ) ) ( not ( = ?auto_859861 ?auto_859862 ) ) ( not ( = ?auto_859861 ?auto_859863 ) ) ( not ( = ?auto_859861 ?auto_859864 ) ) ( not ( = ?auto_859861 ?auto_859867 ) ) ( not ( = ?auto_859860 ?auto_859862 ) ) ( not ( = ?auto_859860 ?auto_859863 ) ) ( not ( = ?auto_859860 ?auto_859864 ) ) ( not ( = ?auto_859860 ?auto_859867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859862 ?auto_859863 ?auto_859864 )
      ( MAKE-9CRATE-VERIFY ?auto_859856 ?auto_859857 ?auto_859858 ?auto_859855 ?auto_859859 ?auto_859861 ?auto_859860 ?auto_859862 ?auto_859863 ?auto_859864 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865421 - SURFACE
      ?auto_865422 - SURFACE
      ?auto_865423 - SURFACE
      ?auto_865420 - SURFACE
      ?auto_865424 - SURFACE
      ?auto_865426 - SURFACE
      ?auto_865425 - SURFACE
      ?auto_865427 - SURFACE
      ?auto_865428 - SURFACE
      ?auto_865429 - SURFACE
      ?auto_865430 - SURFACE
    )
    :vars
    (
      ?auto_865432 - HOIST
      ?auto_865431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865432 ?auto_865431 ) ( SURFACE-AT ?auto_865429 ?auto_865431 ) ( CLEAR ?auto_865429 ) ( LIFTING ?auto_865432 ?auto_865430 ) ( IS-CRATE ?auto_865430 ) ( not ( = ?auto_865429 ?auto_865430 ) ) ( ON ?auto_865422 ?auto_865421 ) ( ON ?auto_865423 ?auto_865422 ) ( ON ?auto_865420 ?auto_865423 ) ( ON ?auto_865424 ?auto_865420 ) ( ON ?auto_865426 ?auto_865424 ) ( ON ?auto_865425 ?auto_865426 ) ( ON ?auto_865427 ?auto_865425 ) ( ON ?auto_865428 ?auto_865427 ) ( ON ?auto_865429 ?auto_865428 ) ( not ( = ?auto_865421 ?auto_865422 ) ) ( not ( = ?auto_865421 ?auto_865423 ) ) ( not ( = ?auto_865421 ?auto_865420 ) ) ( not ( = ?auto_865421 ?auto_865424 ) ) ( not ( = ?auto_865421 ?auto_865426 ) ) ( not ( = ?auto_865421 ?auto_865425 ) ) ( not ( = ?auto_865421 ?auto_865427 ) ) ( not ( = ?auto_865421 ?auto_865428 ) ) ( not ( = ?auto_865421 ?auto_865429 ) ) ( not ( = ?auto_865421 ?auto_865430 ) ) ( not ( = ?auto_865422 ?auto_865423 ) ) ( not ( = ?auto_865422 ?auto_865420 ) ) ( not ( = ?auto_865422 ?auto_865424 ) ) ( not ( = ?auto_865422 ?auto_865426 ) ) ( not ( = ?auto_865422 ?auto_865425 ) ) ( not ( = ?auto_865422 ?auto_865427 ) ) ( not ( = ?auto_865422 ?auto_865428 ) ) ( not ( = ?auto_865422 ?auto_865429 ) ) ( not ( = ?auto_865422 ?auto_865430 ) ) ( not ( = ?auto_865423 ?auto_865420 ) ) ( not ( = ?auto_865423 ?auto_865424 ) ) ( not ( = ?auto_865423 ?auto_865426 ) ) ( not ( = ?auto_865423 ?auto_865425 ) ) ( not ( = ?auto_865423 ?auto_865427 ) ) ( not ( = ?auto_865423 ?auto_865428 ) ) ( not ( = ?auto_865423 ?auto_865429 ) ) ( not ( = ?auto_865423 ?auto_865430 ) ) ( not ( = ?auto_865420 ?auto_865424 ) ) ( not ( = ?auto_865420 ?auto_865426 ) ) ( not ( = ?auto_865420 ?auto_865425 ) ) ( not ( = ?auto_865420 ?auto_865427 ) ) ( not ( = ?auto_865420 ?auto_865428 ) ) ( not ( = ?auto_865420 ?auto_865429 ) ) ( not ( = ?auto_865420 ?auto_865430 ) ) ( not ( = ?auto_865424 ?auto_865426 ) ) ( not ( = ?auto_865424 ?auto_865425 ) ) ( not ( = ?auto_865424 ?auto_865427 ) ) ( not ( = ?auto_865424 ?auto_865428 ) ) ( not ( = ?auto_865424 ?auto_865429 ) ) ( not ( = ?auto_865424 ?auto_865430 ) ) ( not ( = ?auto_865426 ?auto_865425 ) ) ( not ( = ?auto_865426 ?auto_865427 ) ) ( not ( = ?auto_865426 ?auto_865428 ) ) ( not ( = ?auto_865426 ?auto_865429 ) ) ( not ( = ?auto_865426 ?auto_865430 ) ) ( not ( = ?auto_865425 ?auto_865427 ) ) ( not ( = ?auto_865425 ?auto_865428 ) ) ( not ( = ?auto_865425 ?auto_865429 ) ) ( not ( = ?auto_865425 ?auto_865430 ) ) ( not ( = ?auto_865427 ?auto_865428 ) ) ( not ( = ?auto_865427 ?auto_865429 ) ) ( not ( = ?auto_865427 ?auto_865430 ) ) ( not ( = ?auto_865428 ?auto_865429 ) ) ( not ( = ?auto_865428 ?auto_865430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_865429 ?auto_865430 )
      ( MAKE-10CRATE-VERIFY ?auto_865421 ?auto_865422 ?auto_865423 ?auto_865420 ?auto_865424 ?auto_865426 ?auto_865425 ?auto_865427 ?auto_865428 ?auto_865429 ?auto_865430 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865515 - SURFACE
      ?auto_865516 - SURFACE
      ?auto_865517 - SURFACE
      ?auto_865514 - SURFACE
      ?auto_865518 - SURFACE
      ?auto_865520 - SURFACE
      ?auto_865519 - SURFACE
      ?auto_865521 - SURFACE
      ?auto_865522 - SURFACE
      ?auto_865523 - SURFACE
      ?auto_865524 - SURFACE
    )
    :vars
    (
      ?auto_865527 - HOIST
      ?auto_865526 - PLACE
      ?auto_865525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865527 ?auto_865526 ) ( SURFACE-AT ?auto_865523 ?auto_865526 ) ( CLEAR ?auto_865523 ) ( IS-CRATE ?auto_865524 ) ( not ( = ?auto_865523 ?auto_865524 ) ) ( TRUCK-AT ?auto_865525 ?auto_865526 ) ( AVAILABLE ?auto_865527 ) ( IN ?auto_865524 ?auto_865525 ) ( ON ?auto_865523 ?auto_865522 ) ( not ( = ?auto_865522 ?auto_865523 ) ) ( not ( = ?auto_865522 ?auto_865524 ) ) ( ON ?auto_865516 ?auto_865515 ) ( ON ?auto_865517 ?auto_865516 ) ( ON ?auto_865514 ?auto_865517 ) ( ON ?auto_865518 ?auto_865514 ) ( ON ?auto_865520 ?auto_865518 ) ( ON ?auto_865519 ?auto_865520 ) ( ON ?auto_865521 ?auto_865519 ) ( ON ?auto_865522 ?auto_865521 ) ( not ( = ?auto_865515 ?auto_865516 ) ) ( not ( = ?auto_865515 ?auto_865517 ) ) ( not ( = ?auto_865515 ?auto_865514 ) ) ( not ( = ?auto_865515 ?auto_865518 ) ) ( not ( = ?auto_865515 ?auto_865520 ) ) ( not ( = ?auto_865515 ?auto_865519 ) ) ( not ( = ?auto_865515 ?auto_865521 ) ) ( not ( = ?auto_865515 ?auto_865522 ) ) ( not ( = ?auto_865515 ?auto_865523 ) ) ( not ( = ?auto_865515 ?auto_865524 ) ) ( not ( = ?auto_865516 ?auto_865517 ) ) ( not ( = ?auto_865516 ?auto_865514 ) ) ( not ( = ?auto_865516 ?auto_865518 ) ) ( not ( = ?auto_865516 ?auto_865520 ) ) ( not ( = ?auto_865516 ?auto_865519 ) ) ( not ( = ?auto_865516 ?auto_865521 ) ) ( not ( = ?auto_865516 ?auto_865522 ) ) ( not ( = ?auto_865516 ?auto_865523 ) ) ( not ( = ?auto_865516 ?auto_865524 ) ) ( not ( = ?auto_865517 ?auto_865514 ) ) ( not ( = ?auto_865517 ?auto_865518 ) ) ( not ( = ?auto_865517 ?auto_865520 ) ) ( not ( = ?auto_865517 ?auto_865519 ) ) ( not ( = ?auto_865517 ?auto_865521 ) ) ( not ( = ?auto_865517 ?auto_865522 ) ) ( not ( = ?auto_865517 ?auto_865523 ) ) ( not ( = ?auto_865517 ?auto_865524 ) ) ( not ( = ?auto_865514 ?auto_865518 ) ) ( not ( = ?auto_865514 ?auto_865520 ) ) ( not ( = ?auto_865514 ?auto_865519 ) ) ( not ( = ?auto_865514 ?auto_865521 ) ) ( not ( = ?auto_865514 ?auto_865522 ) ) ( not ( = ?auto_865514 ?auto_865523 ) ) ( not ( = ?auto_865514 ?auto_865524 ) ) ( not ( = ?auto_865518 ?auto_865520 ) ) ( not ( = ?auto_865518 ?auto_865519 ) ) ( not ( = ?auto_865518 ?auto_865521 ) ) ( not ( = ?auto_865518 ?auto_865522 ) ) ( not ( = ?auto_865518 ?auto_865523 ) ) ( not ( = ?auto_865518 ?auto_865524 ) ) ( not ( = ?auto_865520 ?auto_865519 ) ) ( not ( = ?auto_865520 ?auto_865521 ) ) ( not ( = ?auto_865520 ?auto_865522 ) ) ( not ( = ?auto_865520 ?auto_865523 ) ) ( not ( = ?auto_865520 ?auto_865524 ) ) ( not ( = ?auto_865519 ?auto_865521 ) ) ( not ( = ?auto_865519 ?auto_865522 ) ) ( not ( = ?auto_865519 ?auto_865523 ) ) ( not ( = ?auto_865519 ?auto_865524 ) ) ( not ( = ?auto_865521 ?auto_865522 ) ) ( not ( = ?auto_865521 ?auto_865523 ) ) ( not ( = ?auto_865521 ?auto_865524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865522 ?auto_865523 ?auto_865524 )
      ( MAKE-10CRATE-VERIFY ?auto_865515 ?auto_865516 ?auto_865517 ?auto_865514 ?auto_865518 ?auto_865520 ?auto_865519 ?auto_865521 ?auto_865522 ?auto_865523 ?auto_865524 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865620 - SURFACE
      ?auto_865621 - SURFACE
      ?auto_865622 - SURFACE
      ?auto_865619 - SURFACE
      ?auto_865623 - SURFACE
      ?auto_865625 - SURFACE
      ?auto_865624 - SURFACE
      ?auto_865626 - SURFACE
      ?auto_865627 - SURFACE
      ?auto_865628 - SURFACE
      ?auto_865629 - SURFACE
    )
    :vars
    (
      ?auto_865632 - HOIST
      ?auto_865630 - PLACE
      ?auto_865631 - TRUCK
      ?auto_865633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865632 ?auto_865630 ) ( SURFACE-AT ?auto_865628 ?auto_865630 ) ( CLEAR ?auto_865628 ) ( IS-CRATE ?auto_865629 ) ( not ( = ?auto_865628 ?auto_865629 ) ) ( AVAILABLE ?auto_865632 ) ( IN ?auto_865629 ?auto_865631 ) ( ON ?auto_865628 ?auto_865627 ) ( not ( = ?auto_865627 ?auto_865628 ) ) ( not ( = ?auto_865627 ?auto_865629 ) ) ( TRUCK-AT ?auto_865631 ?auto_865633 ) ( not ( = ?auto_865633 ?auto_865630 ) ) ( ON ?auto_865621 ?auto_865620 ) ( ON ?auto_865622 ?auto_865621 ) ( ON ?auto_865619 ?auto_865622 ) ( ON ?auto_865623 ?auto_865619 ) ( ON ?auto_865625 ?auto_865623 ) ( ON ?auto_865624 ?auto_865625 ) ( ON ?auto_865626 ?auto_865624 ) ( ON ?auto_865627 ?auto_865626 ) ( not ( = ?auto_865620 ?auto_865621 ) ) ( not ( = ?auto_865620 ?auto_865622 ) ) ( not ( = ?auto_865620 ?auto_865619 ) ) ( not ( = ?auto_865620 ?auto_865623 ) ) ( not ( = ?auto_865620 ?auto_865625 ) ) ( not ( = ?auto_865620 ?auto_865624 ) ) ( not ( = ?auto_865620 ?auto_865626 ) ) ( not ( = ?auto_865620 ?auto_865627 ) ) ( not ( = ?auto_865620 ?auto_865628 ) ) ( not ( = ?auto_865620 ?auto_865629 ) ) ( not ( = ?auto_865621 ?auto_865622 ) ) ( not ( = ?auto_865621 ?auto_865619 ) ) ( not ( = ?auto_865621 ?auto_865623 ) ) ( not ( = ?auto_865621 ?auto_865625 ) ) ( not ( = ?auto_865621 ?auto_865624 ) ) ( not ( = ?auto_865621 ?auto_865626 ) ) ( not ( = ?auto_865621 ?auto_865627 ) ) ( not ( = ?auto_865621 ?auto_865628 ) ) ( not ( = ?auto_865621 ?auto_865629 ) ) ( not ( = ?auto_865622 ?auto_865619 ) ) ( not ( = ?auto_865622 ?auto_865623 ) ) ( not ( = ?auto_865622 ?auto_865625 ) ) ( not ( = ?auto_865622 ?auto_865624 ) ) ( not ( = ?auto_865622 ?auto_865626 ) ) ( not ( = ?auto_865622 ?auto_865627 ) ) ( not ( = ?auto_865622 ?auto_865628 ) ) ( not ( = ?auto_865622 ?auto_865629 ) ) ( not ( = ?auto_865619 ?auto_865623 ) ) ( not ( = ?auto_865619 ?auto_865625 ) ) ( not ( = ?auto_865619 ?auto_865624 ) ) ( not ( = ?auto_865619 ?auto_865626 ) ) ( not ( = ?auto_865619 ?auto_865627 ) ) ( not ( = ?auto_865619 ?auto_865628 ) ) ( not ( = ?auto_865619 ?auto_865629 ) ) ( not ( = ?auto_865623 ?auto_865625 ) ) ( not ( = ?auto_865623 ?auto_865624 ) ) ( not ( = ?auto_865623 ?auto_865626 ) ) ( not ( = ?auto_865623 ?auto_865627 ) ) ( not ( = ?auto_865623 ?auto_865628 ) ) ( not ( = ?auto_865623 ?auto_865629 ) ) ( not ( = ?auto_865625 ?auto_865624 ) ) ( not ( = ?auto_865625 ?auto_865626 ) ) ( not ( = ?auto_865625 ?auto_865627 ) ) ( not ( = ?auto_865625 ?auto_865628 ) ) ( not ( = ?auto_865625 ?auto_865629 ) ) ( not ( = ?auto_865624 ?auto_865626 ) ) ( not ( = ?auto_865624 ?auto_865627 ) ) ( not ( = ?auto_865624 ?auto_865628 ) ) ( not ( = ?auto_865624 ?auto_865629 ) ) ( not ( = ?auto_865626 ?auto_865627 ) ) ( not ( = ?auto_865626 ?auto_865628 ) ) ( not ( = ?auto_865626 ?auto_865629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865627 ?auto_865628 ?auto_865629 )
      ( MAKE-10CRATE-VERIFY ?auto_865620 ?auto_865621 ?auto_865622 ?auto_865619 ?auto_865623 ?auto_865625 ?auto_865624 ?auto_865626 ?auto_865627 ?auto_865628 ?auto_865629 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865735 - SURFACE
      ?auto_865736 - SURFACE
      ?auto_865737 - SURFACE
      ?auto_865734 - SURFACE
      ?auto_865738 - SURFACE
      ?auto_865740 - SURFACE
      ?auto_865739 - SURFACE
      ?auto_865741 - SURFACE
      ?auto_865742 - SURFACE
      ?auto_865743 - SURFACE
      ?auto_865744 - SURFACE
    )
    :vars
    (
      ?auto_865746 - HOIST
      ?auto_865748 - PLACE
      ?auto_865747 - TRUCK
      ?auto_865749 - PLACE
      ?auto_865745 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_865746 ?auto_865748 ) ( SURFACE-AT ?auto_865743 ?auto_865748 ) ( CLEAR ?auto_865743 ) ( IS-CRATE ?auto_865744 ) ( not ( = ?auto_865743 ?auto_865744 ) ) ( AVAILABLE ?auto_865746 ) ( ON ?auto_865743 ?auto_865742 ) ( not ( = ?auto_865742 ?auto_865743 ) ) ( not ( = ?auto_865742 ?auto_865744 ) ) ( TRUCK-AT ?auto_865747 ?auto_865749 ) ( not ( = ?auto_865749 ?auto_865748 ) ) ( HOIST-AT ?auto_865745 ?auto_865749 ) ( LIFTING ?auto_865745 ?auto_865744 ) ( not ( = ?auto_865746 ?auto_865745 ) ) ( ON ?auto_865736 ?auto_865735 ) ( ON ?auto_865737 ?auto_865736 ) ( ON ?auto_865734 ?auto_865737 ) ( ON ?auto_865738 ?auto_865734 ) ( ON ?auto_865740 ?auto_865738 ) ( ON ?auto_865739 ?auto_865740 ) ( ON ?auto_865741 ?auto_865739 ) ( ON ?auto_865742 ?auto_865741 ) ( not ( = ?auto_865735 ?auto_865736 ) ) ( not ( = ?auto_865735 ?auto_865737 ) ) ( not ( = ?auto_865735 ?auto_865734 ) ) ( not ( = ?auto_865735 ?auto_865738 ) ) ( not ( = ?auto_865735 ?auto_865740 ) ) ( not ( = ?auto_865735 ?auto_865739 ) ) ( not ( = ?auto_865735 ?auto_865741 ) ) ( not ( = ?auto_865735 ?auto_865742 ) ) ( not ( = ?auto_865735 ?auto_865743 ) ) ( not ( = ?auto_865735 ?auto_865744 ) ) ( not ( = ?auto_865736 ?auto_865737 ) ) ( not ( = ?auto_865736 ?auto_865734 ) ) ( not ( = ?auto_865736 ?auto_865738 ) ) ( not ( = ?auto_865736 ?auto_865740 ) ) ( not ( = ?auto_865736 ?auto_865739 ) ) ( not ( = ?auto_865736 ?auto_865741 ) ) ( not ( = ?auto_865736 ?auto_865742 ) ) ( not ( = ?auto_865736 ?auto_865743 ) ) ( not ( = ?auto_865736 ?auto_865744 ) ) ( not ( = ?auto_865737 ?auto_865734 ) ) ( not ( = ?auto_865737 ?auto_865738 ) ) ( not ( = ?auto_865737 ?auto_865740 ) ) ( not ( = ?auto_865737 ?auto_865739 ) ) ( not ( = ?auto_865737 ?auto_865741 ) ) ( not ( = ?auto_865737 ?auto_865742 ) ) ( not ( = ?auto_865737 ?auto_865743 ) ) ( not ( = ?auto_865737 ?auto_865744 ) ) ( not ( = ?auto_865734 ?auto_865738 ) ) ( not ( = ?auto_865734 ?auto_865740 ) ) ( not ( = ?auto_865734 ?auto_865739 ) ) ( not ( = ?auto_865734 ?auto_865741 ) ) ( not ( = ?auto_865734 ?auto_865742 ) ) ( not ( = ?auto_865734 ?auto_865743 ) ) ( not ( = ?auto_865734 ?auto_865744 ) ) ( not ( = ?auto_865738 ?auto_865740 ) ) ( not ( = ?auto_865738 ?auto_865739 ) ) ( not ( = ?auto_865738 ?auto_865741 ) ) ( not ( = ?auto_865738 ?auto_865742 ) ) ( not ( = ?auto_865738 ?auto_865743 ) ) ( not ( = ?auto_865738 ?auto_865744 ) ) ( not ( = ?auto_865740 ?auto_865739 ) ) ( not ( = ?auto_865740 ?auto_865741 ) ) ( not ( = ?auto_865740 ?auto_865742 ) ) ( not ( = ?auto_865740 ?auto_865743 ) ) ( not ( = ?auto_865740 ?auto_865744 ) ) ( not ( = ?auto_865739 ?auto_865741 ) ) ( not ( = ?auto_865739 ?auto_865742 ) ) ( not ( = ?auto_865739 ?auto_865743 ) ) ( not ( = ?auto_865739 ?auto_865744 ) ) ( not ( = ?auto_865741 ?auto_865742 ) ) ( not ( = ?auto_865741 ?auto_865743 ) ) ( not ( = ?auto_865741 ?auto_865744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865742 ?auto_865743 ?auto_865744 )
      ( MAKE-10CRATE-VERIFY ?auto_865735 ?auto_865736 ?auto_865737 ?auto_865734 ?auto_865738 ?auto_865740 ?auto_865739 ?auto_865741 ?auto_865742 ?auto_865743 ?auto_865744 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865860 - SURFACE
      ?auto_865861 - SURFACE
      ?auto_865862 - SURFACE
      ?auto_865859 - SURFACE
      ?auto_865863 - SURFACE
      ?auto_865865 - SURFACE
      ?auto_865864 - SURFACE
      ?auto_865866 - SURFACE
      ?auto_865867 - SURFACE
      ?auto_865868 - SURFACE
      ?auto_865869 - SURFACE
    )
    :vars
    (
      ?auto_865874 - HOIST
      ?auto_865871 - PLACE
      ?auto_865875 - TRUCK
      ?auto_865873 - PLACE
      ?auto_865870 - HOIST
      ?auto_865872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865874 ?auto_865871 ) ( SURFACE-AT ?auto_865868 ?auto_865871 ) ( CLEAR ?auto_865868 ) ( IS-CRATE ?auto_865869 ) ( not ( = ?auto_865868 ?auto_865869 ) ) ( AVAILABLE ?auto_865874 ) ( ON ?auto_865868 ?auto_865867 ) ( not ( = ?auto_865867 ?auto_865868 ) ) ( not ( = ?auto_865867 ?auto_865869 ) ) ( TRUCK-AT ?auto_865875 ?auto_865873 ) ( not ( = ?auto_865873 ?auto_865871 ) ) ( HOIST-AT ?auto_865870 ?auto_865873 ) ( not ( = ?auto_865874 ?auto_865870 ) ) ( AVAILABLE ?auto_865870 ) ( SURFACE-AT ?auto_865869 ?auto_865873 ) ( ON ?auto_865869 ?auto_865872 ) ( CLEAR ?auto_865869 ) ( not ( = ?auto_865868 ?auto_865872 ) ) ( not ( = ?auto_865869 ?auto_865872 ) ) ( not ( = ?auto_865867 ?auto_865872 ) ) ( ON ?auto_865861 ?auto_865860 ) ( ON ?auto_865862 ?auto_865861 ) ( ON ?auto_865859 ?auto_865862 ) ( ON ?auto_865863 ?auto_865859 ) ( ON ?auto_865865 ?auto_865863 ) ( ON ?auto_865864 ?auto_865865 ) ( ON ?auto_865866 ?auto_865864 ) ( ON ?auto_865867 ?auto_865866 ) ( not ( = ?auto_865860 ?auto_865861 ) ) ( not ( = ?auto_865860 ?auto_865862 ) ) ( not ( = ?auto_865860 ?auto_865859 ) ) ( not ( = ?auto_865860 ?auto_865863 ) ) ( not ( = ?auto_865860 ?auto_865865 ) ) ( not ( = ?auto_865860 ?auto_865864 ) ) ( not ( = ?auto_865860 ?auto_865866 ) ) ( not ( = ?auto_865860 ?auto_865867 ) ) ( not ( = ?auto_865860 ?auto_865868 ) ) ( not ( = ?auto_865860 ?auto_865869 ) ) ( not ( = ?auto_865860 ?auto_865872 ) ) ( not ( = ?auto_865861 ?auto_865862 ) ) ( not ( = ?auto_865861 ?auto_865859 ) ) ( not ( = ?auto_865861 ?auto_865863 ) ) ( not ( = ?auto_865861 ?auto_865865 ) ) ( not ( = ?auto_865861 ?auto_865864 ) ) ( not ( = ?auto_865861 ?auto_865866 ) ) ( not ( = ?auto_865861 ?auto_865867 ) ) ( not ( = ?auto_865861 ?auto_865868 ) ) ( not ( = ?auto_865861 ?auto_865869 ) ) ( not ( = ?auto_865861 ?auto_865872 ) ) ( not ( = ?auto_865862 ?auto_865859 ) ) ( not ( = ?auto_865862 ?auto_865863 ) ) ( not ( = ?auto_865862 ?auto_865865 ) ) ( not ( = ?auto_865862 ?auto_865864 ) ) ( not ( = ?auto_865862 ?auto_865866 ) ) ( not ( = ?auto_865862 ?auto_865867 ) ) ( not ( = ?auto_865862 ?auto_865868 ) ) ( not ( = ?auto_865862 ?auto_865869 ) ) ( not ( = ?auto_865862 ?auto_865872 ) ) ( not ( = ?auto_865859 ?auto_865863 ) ) ( not ( = ?auto_865859 ?auto_865865 ) ) ( not ( = ?auto_865859 ?auto_865864 ) ) ( not ( = ?auto_865859 ?auto_865866 ) ) ( not ( = ?auto_865859 ?auto_865867 ) ) ( not ( = ?auto_865859 ?auto_865868 ) ) ( not ( = ?auto_865859 ?auto_865869 ) ) ( not ( = ?auto_865859 ?auto_865872 ) ) ( not ( = ?auto_865863 ?auto_865865 ) ) ( not ( = ?auto_865863 ?auto_865864 ) ) ( not ( = ?auto_865863 ?auto_865866 ) ) ( not ( = ?auto_865863 ?auto_865867 ) ) ( not ( = ?auto_865863 ?auto_865868 ) ) ( not ( = ?auto_865863 ?auto_865869 ) ) ( not ( = ?auto_865863 ?auto_865872 ) ) ( not ( = ?auto_865865 ?auto_865864 ) ) ( not ( = ?auto_865865 ?auto_865866 ) ) ( not ( = ?auto_865865 ?auto_865867 ) ) ( not ( = ?auto_865865 ?auto_865868 ) ) ( not ( = ?auto_865865 ?auto_865869 ) ) ( not ( = ?auto_865865 ?auto_865872 ) ) ( not ( = ?auto_865864 ?auto_865866 ) ) ( not ( = ?auto_865864 ?auto_865867 ) ) ( not ( = ?auto_865864 ?auto_865868 ) ) ( not ( = ?auto_865864 ?auto_865869 ) ) ( not ( = ?auto_865864 ?auto_865872 ) ) ( not ( = ?auto_865866 ?auto_865867 ) ) ( not ( = ?auto_865866 ?auto_865868 ) ) ( not ( = ?auto_865866 ?auto_865869 ) ) ( not ( = ?auto_865866 ?auto_865872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865867 ?auto_865868 ?auto_865869 )
      ( MAKE-10CRATE-VERIFY ?auto_865860 ?auto_865861 ?auto_865862 ?auto_865859 ?auto_865863 ?auto_865865 ?auto_865864 ?auto_865866 ?auto_865867 ?auto_865868 ?auto_865869 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865986 - SURFACE
      ?auto_865987 - SURFACE
      ?auto_865988 - SURFACE
      ?auto_865985 - SURFACE
      ?auto_865989 - SURFACE
      ?auto_865991 - SURFACE
      ?auto_865990 - SURFACE
      ?auto_865992 - SURFACE
      ?auto_865993 - SURFACE
      ?auto_865994 - SURFACE
      ?auto_865995 - SURFACE
    )
    :vars
    (
      ?auto_866000 - HOIST
      ?auto_865996 - PLACE
      ?auto_866001 - PLACE
      ?auto_865997 - HOIST
      ?auto_865998 - SURFACE
      ?auto_865999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_866000 ?auto_865996 ) ( SURFACE-AT ?auto_865994 ?auto_865996 ) ( CLEAR ?auto_865994 ) ( IS-CRATE ?auto_865995 ) ( not ( = ?auto_865994 ?auto_865995 ) ) ( AVAILABLE ?auto_866000 ) ( ON ?auto_865994 ?auto_865993 ) ( not ( = ?auto_865993 ?auto_865994 ) ) ( not ( = ?auto_865993 ?auto_865995 ) ) ( not ( = ?auto_866001 ?auto_865996 ) ) ( HOIST-AT ?auto_865997 ?auto_866001 ) ( not ( = ?auto_866000 ?auto_865997 ) ) ( AVAILABLE ?auto_865997 ) ( SURFACE-AT ?auto_865995 ?auto_866001 ) ( ON ?auto_865995 ?auto_865998 ) ( CLEAR ?auto_865995 ) ( not ( = ?auto_865994 ?auto_865998 ) ) ( not ( = ?auto_865995 ?auto_865998 ) ) ( not ( = ?auto_865993 ?auto_865998 ) ) ( TRUCK-AT ?auto_865999 ?auto_865996 ) ( ON ?auto_865987 ?auto_865986 ) ( ON ?auto_865988 ?auto_865987 ) ( ON ?auto_865985 ?auto_865988 ) ( ON ?auto_865989 ?auto_865985 ) ( ON ?auto_865991 ?auto_865989 ) ( ON ?auto_865990 ?auto_865991 ) ( ON ?auto_865992 ?auto_865990 ) ( ON ?auto_865993 ?auto_865992 ) ( not ( = ?auto_865986 ?auto_865987 ) ) ( not ( = ?auto_865986 ?auto_865988 ) ) ( not ( = ?auto_865986 ?auto_865985 ) ) ( not ( = ?auto_865986 ?auto_865989 ) ) ( not ( = ?auto_865986 ?auto_865991 ) ) ( not ( = ?auto_865986 ?auto_865990 ) ) ( not ( = ?auto_865986 ?auto_865992 ) ) ( not ( = ?auto_865986 ?auto_865993 ) ) ( not ( = ?auto_865986 ?auto_865994 ) ) ( not ( = ?auto_865986 ?auto_865995 ) ) ( not ( = ?auto_865986 ?auto_865998 ) ) ( not ( = ?auto_865987 ?auto_865988 ) ) ( not ( = ?auto_865987 ?auto_865985 ) ) ( not ( = ?auto_865987 ?auto_865989 ) ) ( not ( = ?auto_865987 ?auto_865991 ) ) ( not ( = ?auto_865987 ?auto_865990 ) ) ( not ( = ?auto_865987 ?auto_865992 ) ) ( not ( = ?auto_865987 ?auto_865993 ) ) ( not ( = ?auto_865987 ?auto_865994 ) ) ( not ( = ?auto_865987 ?auto_865995 ) ) ( not ( = ?auto_865987 ?auto_865998 ) ) ( not ( = ?auto_865988 ?auto_865985 ) ) ( not ( = ?auto_865988 ?auto_865989 ) ) ( not ( = ?auto_865988 ?auto_865991 ) ) ( not ( = ?auto_865988 ?auto_865990 ) ) ( not ( = ?auto_865988 ?auto_865992 ) ) ( not ( = ?auto_865988 ?auto_865993 ) ) ( not ( = ?auto_865988 ?auto_865994 ) ) ( not ( = ?auto_865988 ?auto_865995 ) ) ( not ( = ?auto_865988 ?auto_865998 ) ) ( not ( = ?auto_865985 ?auto_865989 ) ) ( not ( = ?auto_865985 ?auto_865991 ) ) ( not ( = ?auto_865985 ?auto_865990 ) ) ( not ( = ?auto_865985 ?auto_865992 ) ) ( not ( = ?auto_865985 ?auto_865993 ) ) ( not ( = ?auto_865985 ?auto_865994 ) ) ( not ( = ?auto_865985 ?auto_865995 ) ) ( not ( = ?auto_865985 ?auto_865998 ) ) ( not ( = ?auto_865989 ?auto_865991 ) ) ( not ( = ?auto_865989 ?auto_865990 ) ) ( not ( = ?auto_865989 ?auto_865992 ) ) ( not ( = ?auto_865989 ?auto_865993 ) ) ( not ( = ?auto_865989 ?auto_865994 ) ) ( not ( = ?auto_865989 ?auto_865995 ) ) ( not ( = ?auto_865989 ?auto_865998 ) ) ( not ( = ?auto_865991 ?auto_865990 ) ) ( not ( = ?auto_865991 ?auto_865992 ) ) ( not ( = ?auto_865991 ?auto_865993 ) ) ( not ( = ?auto_865991 ?auto_865994 ) ) ( not ( = ?auto_865991 ?auto_865995 ) ) ( not ( = ?auto_865991 ?auto_865998 ) ) ( not ( = ?auto_865990 ?auto_865992 ) ) ( not ( = ?auto_865990 ?auto_865993 ) ) ( not ( = ?auto_865990 ?auto_865994 ) ) ( not ( = ?auto_865990 ?auto_865995 ) ) ( not ( = ?auto_865990 ?auto_865998 ) ) ( not ( = ?auto_865992 ?auto_865993 ) ) ( not ( = ?auto_865992 ?auto_865994 ) ) ( not ( = ?auto_865992 ?auto_865995 ) ) ( not ( = ?auto_865992 ?auto_865998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865993 ?auto_865994 ?auto_865995 )
      ( MAKE-10CRATE-VERIFY ?auto_865986 ?auto_865987 ?auto_865988 ?auto_865985 ?auto_865989 ?auto_865991 ?auto_865990 ?auto_865992 ?auto_865993 ?auto_865994 ?auto_865995 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_866112 - SURFACE
      ?auto_866113 - SURFACE
      ?auto_866114 - SURFACE
      ?auto_866111 - SURFACE
      ?auto_866115 - SURFACE
      ?auto_866117 - SURFACE
      ?auto_866116 - SURFACE
      ?auto_866118 - SURFACE
      ?auto_866119 - SURFACE
      ?auto_866120 - SURFACE
      ?auto_866121 - SURFACE
    )
    :vars
    (
      ?auto_866123 - HOIST
      ?auto_866126 - PLACE
      ?auto_866124 - PLACE
      ?auto_866125 - HOIST
      ?auto_866122 - SURFACE
      ?auto_866127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_866123 ?auto_866126 ) ( IS-CRATE ?auto_866121 ) ( not ( = ?auto_866120 ?auto_866121 ) ) ( not ( = ?auto_866119 ?auto_866120 ) ) ( not ( = ?auto_866119 ?auto_866121 ) ) ( not ( = ?auto_866124 ?auto_866126 ) ) ( HOIST-AT ?auto_866125 ?auto_866124 ) ( not ( = ?auto_866123 ?auto_866125 ) ) ( AVAILABLE ?auto_866125 ) ( SURFACE-AT ?auto_866121 ?auto_866124 ) ( ON ?auto_866121 ?auto_866122 ) ( CLEAR ?auto_866121 ) ( not ( = ?auto_866120 ?auto_866122 ) ) ( not ( = ?auto_866121 ?auto_866122 ) ) ( not ( = ?auto_866119 ?auto_866122 ) ) ( TRUCK-AT ?auto_866127 ?auto_866126 ) ( SURFACE-AT ?auto_866119 ?auto_866126 ) ( CLEAR ?auto_866119 ) ( LIFTING ?auto_866123 ?auto_866120 ) ( IS-CRATE ?auto_866120 ) ( ON ?auto_866113 ?auto_866112 ) ( ON ?auto_866114 ?auto_866113 ) ( ON ?auto_866111 ?auto_866114 ) ( ON ?auto_866115 ?auto_866111 ) ( ON ?auto_866117 ?auto_866115 ) ( ON ?auto_866116 ?auto_866117 ) ( ON ?auto_866118 ?auto_866116 ) ( ON ?auto_866119 ?auto_866118 ) ( not ( = ?auto_866112 ?auto_866113 ) ) ( not ( = ?auto_866112 ?auto_866114 ) ) ( not ( = ?auto_866112 ?auto_866111 ) ) ( not ( = ?auto_866112 ?auto_866115 ) ) ( not ( = ?auto_866112 ?auto_866117 ) ) ( not ( = ?auto_866112 ?auto_866116 ) ) ( not ( = ?auto_866112 ?auto_866118 ) ) ( not ( = ?auto_866112 ?auto_866119 ) ) ( not ( = ?auto_866112 ?auto_866120 ) ) ( not ( = ?auto_866112 ?auto_866121 ) ) ( not ( = ?auto_866112 ?auto_866122 ) ) ( not ( = ?auto_866113 ?auto_866114 ) ) ( not ( = ?auto_866113 ?auto_866111 ) ) ( not ( = ?auto_866113 ?auto_866115 ) ) ( not ( = ?auto_866113 ?auto_866117 ) ) ( not ( = ?auto_866113 ?auto_866116 ) ) ( not ( = ?auto_866113 ?auto_866118 ) ) ( not ( = ?auto_866113 ?auto_866119 ) ) ( not ( = ?auto_866113 ?auto_866120 ) ) ( not ( = ?auto_866113 ?auto_866121 ) ) ( not ( = ?auto_866113 ?auto_866122 ) ) ( not ( = ?auto_866114 ?auto_866111 ) ) ( not ( = ?auto_866114 ?auto_866115 ) ) ( not ( = ?auto_866114 ?auto_866117 ) ) ( not ( = ?auto_866114 ?auto_866116 ) ) ( not ( = ?auto_866114 ?auto_866118 ) ) ( not ( = ?auto_866114 ?auto_866119 ) ) ( not ( = ?auto_866114 ?auto_866120 ) ) ( not ( = ?auto_866114 ?auto_866121 ) ) ( not ( = ?auto_866114 ?auto_866122 ) ) ( not ( = ?auto_866111 ?auto_866115 ) ) ( not ( = ?auto_866111 ?auto_866117 ) ) ( not ( = ?auto_866111 ?auto_866116 ) ) ( not ( = ?auto_866111 ?auto_866118 ) ) ( not ( = ?auto_866111 ?auto_866119 ) ) ( not ( = ?auto_866111 ?auto_866120 ) ) ( not ( = ?auto_866111 ?auto_866121 ) ) ( not ( = ?auto_866111 ?auto_866122 ) ) ( not ( = ?auto_866115 ?auto_866117 ) ) ( not ( = ?auto_866115 ?auto_866116 ) ) ( not ( = ?auto_866115 ?auto_866118 ) ) ( not ( = ?auto_866115 ?auto_866119 ) ) ( not ( = ?auto_866115 ?auto_866120 ) ) ( not ( = ?auto_866115 ?auto_866121 ) ) ( not ( = ?auto_866115 ?auto_866122 ) ) ( not ( = ?auto_866117 ?auto_866116 ) ) ( not ( = ?auto_866117 ?auto_866118 ) ) ( not ( = ?auto_866117 ?auto_866119 ) ) ( not ( = ?auto_866117 ?auto_866120 ) ) ( not ( = ?auto_866117 ?auto_866121 ) ) ( not ( = ?auto_866117 ?auto_866122 ) ) ( not ( = ?auto_866116 ?auto_866118 ) ) ( not ( = ?auto_866116 ?auto_866119 ) ) ( not ( = ?auto_866116 ?auto_866120 ) ) ( not ( = ?auto_866116 ?auto_866121 ) ) ( not ( = ?auto_866116 ?auto_866122 ) ) ( not ( = ?auto_866118 ?auto_866119 ) ) ( not ( = ?auto_866118 ?auto_866120 ) ) ( not ( = ?auto_866118 ?auto_866121 ) ) ( not ( = ?auto_866118 ?auto_866122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_866119 ?auto_866120 ?auto_866121 )
      ( MAKE-10CRATE-VERIFY ?auto_866112 ?auto_866113 ?auto_866114 ?auto_866111 ?auto_866115 ?auto_866117 ?auto_866116 ?auto_866118 ?auto_866119 ?auto_866120 ?auto_866121 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_866238 - SURFACE
      ?auto_866239 - SURFACE
      ?auto_866240 - SURFACE
      ?auto_866237 - SURFACE
      ?auto_866241 - SURFACE
      ?auto_866243 - SURFACE
      ?auto_866242 - SURFACE
      ?auto_866244 - SURFACE
      ?auto_866245 - SURFACE
      ?auto_866246 - SURFACE
      ?auto_866247 - SURFACE
    )
    :vars
    (
      ?auto_866248 - HOIST
      ?auto_866251 - PLACE
      ?auto_866253 - PLACE
      ?auto_866252 - HOIST
      ?auto_866249 - SURFACE
      ?auto_866250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_866248 ?auto_866251 ) ( IS-CRATE ?auto_866247 ) ( not ( = ?auto_866246 ?auto_866247 ) ) ( not ( = ?auto_866245 ?auto_866246 ) ) ( not ( = ?auto_866245 ?auto_866247 ) ) ( not ( = ?auto_866253 ?auto_866251 ) ) ( HOIST-AT ?auto_866252 ?auto_866253 ) ( not ( = ?auto_866248 ?auto_866252 ) ) ( AVAILABLE ?auto_866252 ) ( SURFACE-AT ?auto_866247 ?auto_866253 ) ( ON ?auto_866247 ?auto_866249 ) ( CLEAR ?auto_866247 ) ( not ( = ?auto_866246 ?auto_866249 ) ) ( not ( = ?auto_866247 ?auto_866249 ) ) ( not ( = ?auto_866245 ?auto_866249 ) ) ( TRUCK-AT ?auto_866250 ?auto_866251 ) ( SURFACE-AT ?auto_866245 ?auto_866251 ) ( CLEAR ?auto_866245 ) ( IS-CRATE ?auto_866246 ) ( AVAILABLE ?auto_866248 ) ( IN ?auto_866246 ?auto_866250 ) ( ON ?auto_866239 ?auto_866238 ) ( ON ?auto_866240 ?auto_866239 ) ( ON ?auto_866237 ?auto_866240 ) ( ON ?auto_866241 ?auto_866237 ) ( ON ?auto_866243 ?auto_866241 ) ( ON ?auto_866242 ?auto_866243 ) ( ON ?auto_866244 ?auto_866242 ) ( ON ?auto_866245 ?auto_866244 ) ( not ( = ?auto_866238 ?auto_866239 ) ) ( not ( = ?auto_866238 ?auto_866240 ) ) ( not ( = ?auto_866238 ?auto_866237 ) ) ( not ( = ?auto_866238 ?auto_866241 ) ) ( not ( = ?auto_866238 ?auto_866243 ) ) ( not ( = ?auto_866238 ?auto_866242 ) ) ( not ( = ?auto_866238 ?auto_866244 ) ) ( not ( = ?auto_866238 ?auto_866245 ) ) ( not ( = ?auto_866238 ?auto_866246 ) ) ( not ( = ?auto_866238 ?auto_866247 ) ) ( not ( = ?auto_866238 ?auto_866249 ) ) ( not ( = ?auto_866239 ?auto_866240 ) ) ( not ( = ?auto_866239 ?auto_866237 ) ) ( not ( = ?auto_866239 ?auto_866241 ) ) ( not ( = ?auto_866239 ?auto_866243 ) ) ( not ( = ?auto_866239 ?auto_866242 ) ) ( not ( = ?auto_866239 ?auto_866244 ) ) ( not ( = ?auto_866239 ?auto_866245 ) ) ( not ( = ?auto_866239 ?auto_866246 ) ) ( not ( = ?auto_866239 ?auto_866247 ) ) ( not ( = ?auto_866239 ?auto_866249 ) ) ( not ( = ?auto_866240 ?auto_866237 ) ) ( not ( = ?auto_866240 ?auto_866241 ) ) ( not ( = ?auto_866240 ?auto_866243 ) ) ( not ( = ?auto_866240 ?auto_866242 ) ) ( not ( = ?auto_866240 ?auto_866244 ) ) ( not ( = ?auto_866240 ?auto_866245 ) ) ( not ( = ?auto_866240 ?auto_866246 ) ) ( not ( = ?auto_866240 ?auto_866247 ) ) ( not ( = ?auto_866240 ?auto_866249 ) ) ( not ( = ?auto_866237 ?auto_866241 ) ) ( not ( = ?auto_866237 ?auto_866243 ) ) ( not ( = ?auto_866237 ?auto_866242 ) ) ( not ( = ?auto_866237 ?auto_866244 ) ) ( not ( = ?auto_866237 ?auto_866245 ) ) ( not ( = ?auto_866237 ?auto_866246 ) ) ( not ( = ?auto_866237 ?auto_866247 ) ) ( not ( = ?auto_866237 ?auto_866249 ) ) ( not ( = ?auto_866241 ?auto_866243 ) ) ( not ( = ?auto_866241 ?auto_866242 ) ) ( not ( = ?auto_866241 ?auto_866244 ) ) ( not ( = ?auto_866241 ?auto_866245 ) ) ( not ( = ?auto_866241 ?auto_866246 ) ) ( not ( = ?auto_866241 ?auto_866247 ) ) ( not ( = ?auto_866241 ?auto_866249 ) ) ( not ( = ?auto_866243 ?auto_866242 ) ) ( not ( = ?auto_866243 ?auto_866244 ) ) ( not ( = ?auto_866243 ?auto_866245 ) ) ( not ( = ?auto_866243 ?auto_866246 ) ) ( not ( = ?auto_866243 ?auto_866247 ) ) ( not ( = ?auto_866243 ?auto_866249 ) ) ( not ( = ?auto_866242 ?auto_866244 ) ) ( not ( = ?auto_866242 ?auto_866245 ) ) ( not ( = ?auto_866242 ?auto_866246 ) ) ( not ( = ?auto_866242 ?auto_866247 ) ) ( not ( = ?auto_866242 ?auto_866249 ) ) ( not ( = ?auto_866244 ?auto_866245 ) ) ( not ( = ?auto_866244 ?auto_866246 ) ) ( not ( = ?auto_866244 ?auto_866247 ) ) ( not ( = ?auto_866244 ?auto_866249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_866245 ?auto_866246 ?auto_866247 )
      ( MAKE-10CRATE-VERIFY ?auto_866238 ?auto_866239 ?auto_866240 ?auto_866237 ?auto_866241 ?auto_866243 ?auto_866242 ?auto_866244 ?auto_866245 ?auto_866246 ?auto_866247 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873522 - SURFACE
      ?auto_873523 - SURFACE
      ?auto_873524 - SURFACE
      ?auto_873521 - SURFACE
      ?auto_873525 - SURFACE
      ?auto_873527 - SURFACE
      ?auto_873526 - SURFACE
      ?auto_873528 - SURFACE
      ?auto_873529 - SURFACE
      ?auto_873530 - SURFACE
      ?auto_873531 - SURFACE
      ?auto_873532 - SURFACE
    )
    :vars
    (
      ?auto_873534 - HOIST
      ?auto_873533 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_873534 ?auto_873533 ) ( SURFACE-AT ?auto_873531 ?auto_873533 ) ( CLEAR ?auto_873531 ) ( LIFTING ?auto_873534 ?auto_873532 ) ( IS-CRATE ?auto_873532 ) ( not ( = ?auto_873531 ?auto_873532 ) ) ( ON ?auto_873523 ?auto_873522 ) ( ON ?auto_873524 ?auto_873523 ) ( ON ?auto_873521 ?auto_873524 ) ( ON ?auto_873525 ?auto_873521 ) ( ON ?auto_873527 ?auto_873525 ) ( ON ?auto_873526 ?auto_873527 ) ( ON ?auto_873528 ?auto_873526 ) ( ON ?auto_873529 ?auto_873528 ) ( ON ?auto_873530 ?auto_873529 ) ( ON ?auto_873531 ?auto_873530 ) ( not ( = ?auto_873522 ?auto_873523 ) ) ( not ( = ?auto_873522 ?auto_873524 ) ) ( not ( = ?auto_873522 ?auto_873521 ) ) ( not ( = ?auto_873522 ?auto_873525 ) ) ( not ( = ?auto_873522 ?auto_873527 ) ) ( not ( = ?auto_873522 ?auto_873526 ) ) ( not ( = ?auto_873522 ?auto_873528 ) ) ( not ( = ?auto_873522 ?auto_873529 ) ) ( not ( = ?auto_873522 ?auto_873530 ) ) ( not ( = ?auto_873522 ?auto_873531 ) ) ( not ( = ?auto_873522 ?auto_873532 ) ) ( not ( = ?auto_873523 ?auto_873524 ) ) ( not ( = ?auto_873523 ?auto_873521 ) ) ( not ( = ?auto_873523 ?auto_873525 ) ) ( not ( = ?auto_873523 ?auto_873527 ) ) ( not ( = ?auto_873523 ?auto_873526 ) ) ( not ( = ?auto_873523 ?auto_873528 ) ) ( not ( = ?auto_873523 ?auto_873529 ) ) ( not ( = ?auto_873523 ?auto_873530 ) ) ( not ( = ?auto_873523 ?auto_873531 ) ) ( not ( = ?auto_873523 ?auto_873532 ) ) ( not ( = ?auto_873524 ?auto_873521 ) ) ( not ( = ?auto_873524 ?auto_873525 ) ) ( not ( = ?auto_873524 ?auto_873527 ) ) ( not ( = ?auto_873524 ?auto_873526 ) ) ( not ( = ?auto_873524 ?auto_873528 ) ) ( not ( = ?auto_873524 ?auto_873529 ) ) ( not ( = ?auto_873524 ?auto_873530 ) ) ( not ( = ?auto_873524 ?auto_873531 ) ) ( not ( = ?auto_873524 ?auto_873532 ) ) ( not ( = ?auto_873521 ?auto_873525 ) ) ( not ( = ?auto_873521 ?auto_873527 ) ) ( not ( = ?auto_873521 ?auto_873526 ) ) ( not ( = ?auto_873521 ?auto_873528 ) ) ( not ( = ?auto_873521 ?auto_873529 ) ) ( not ( = ?auto_873521 ?auto_873530 ) ) ( not ( = ?auto_873521 ?auto_873531 ) ) ( not ( = ?auto_873521 ?auto_873532 ) ) ( not ( = ?auto_873525 ?auto_873527 ) ) ( not ( = ?auto_873525 ?auto_873526 ) ) ( not ( = ?auto_873525 ?auto_873528 ) ) ( not ( = ?auto_873525 ?auto_873529 ) ) ( not ( = ?auto_873525 ?auto_873530 ) ) ( not ( = ?auto_873525 ?auto_873531 ) ) ( not ( = ?auto_873525 ?auto_873532 ) ) ( not ( = ?auto_873527 ?auto_873526 ) ) ( not ( = ?auto_873527 ?auto_873528 ) ) ( not ( = ?auto_873527 ?auto_873529 ) ) ( not ( = ?auto_873527 ?auto_873530 ) ) ( not ( = ?auto_873527 ?auto_873531 ) ) ( not ( = ?auto_873527 ?auto_873532 ) ) ( not ( = ?auto_873526 ?auto_873528 ) ) ( not ( = ?auto_873526 ?auto_873529 ) ) ( not ( = ?auto_873526 ?auto_873530 ) ) ( not ( = ?auto_873526 ?auto_873531 ) ) ( not ( = ?auto_873526 ?auto_873532 ) ) ( not ( = ?auto_873528 ?auto_873529 ) ) ( not ( = ?auto_873528 ?auto_873530 ) ) ( not ( = ?auto_873528 ?auto_873531 ) ) ( not ( = ?auto_873528 ?auto_873532 ) ) ( not ( = ?auto_873529 ?auto_873530 ) ) ( not ( = ?auto_873529 ?auto_873531 ) ) ( not ( = ?auto_873529 ?auto_873532 ) ) ( not ( = ?auto_873530 ?auto_873531 ) ) ( not ( = ?auto_873530 ?auto_873532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_873531 ?auto_873532 )
      ( MAKE-11CRATE-VERIFY ?auto_873522 ?auto_873523 ?auto_873524 ?auto_873521 ?auto_873525 ?auto_873527 ?auto_873526 ?auto_873528 ?auto_873529 ?auto_873530 ?auto_873531 ?auto_873532 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873631 - SURFACE
      ?auto_873632 - SURFACE
      ?auto_873633 - SURFACE
      ?auto_873630 - SURFACE
      ?auto_873634 - SURFACE
      ?auto_873636 - SURFACE
      ?auto_873635 - SURFACE
      ?auto_873637 - SURFACE
      ?auto_873638 - SURFACE
      ?auto_873639 - SURFACE
      ?auto_873640 - SURFACE
      ?auto_873641 - SURFACE
    )
    :vars
    (
      ?auto_873642 - HOIST
      ?auto_873644 - PLACE
      ?auto_873643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873642 ?auto_873644 ) ( SURFACE-AT ?auto_873640 ?auto_873644 ) ( CLEAR ?auto_873640 ) ( IS-CRATE ?auto_873641 ) ( not ( = ?auto_873640 ?auto_873641 ) ) ( TRUCK-AT ?auto_873643 ?auto_873644 ) ( AVAILABLE ?auto_873642 ) ( IN ?auto_873641 ?auto_873643 ) ( ON ?auto_873640 ?auto_873639 ) ( not ( = ?auto_873639 ?auto_873640 ) ) ( not ( = ?auto_873639 ?auto_873641 ) ) ( ON ?auto_873632 ?auto_873631 ) ( ON ?auto_873633 ?auto_873632 ) ( ON ?auto_873630 ?auto_873633 ) ( ON ?auto_873634 ?auto_873630 ) ( ON ?auto_873636 ?auto_873634 ) ( ON ?auto_873635 ?auto_873636 ) ( ON ?auto_873637 ?auto_873635 ) ( ON ?auto_873638 ?auto_873637 ) ( ON ?auto_873639 ?auto_873638 ) ( not ( = ?auto_873631 ?auto_873632 ) ) ( not ( = ?auto_873631 ?auto_873633 ) ) ( not ( = ?auto_873631 ?auto_873630 ) ) ( not ( = ?auto_873631 ?auto_873634 ) ) ( not ( = ?auto_873631 ?auto_873636 ) ) ( not ( = ?auto_873631 ?auto_873635 ) ) ( not ( = ?auto_873631 ?auto_873637 ) ) ( not ( = ?auto_873631 ?auto_873638 ) ) ( not ( = ?auto_873631 ?auto_873639 ) ) ( not ( = ?auto_873631 ?auto_873640 ) ) ( not ( = ?auto_873631 ?auto_873641 ) ) ( not ( = ?auto_873632 ?auto_873633 ) ) ( not ( = ?auto_873632 ?auto_873630 ) ) ( not ( = ?auto_873632 ?auto_873634 ) ) ( not ( = ?auto_873632 ?auto_873636 ) ) ( not ( = ?auto_873632 ?auto_873635 ) ) ( not ( = ?auto_873632 ?auto_873637 ) ) ( not ( = ?auto_873632 ?auto_873638 ) ) ( not ( = ?auto_873632 ?auto_873639 ) ) ( not ( = ?auto_873632 ?auto_873640 ) ) ( not ( = ?auto_873632 ?auto_873641 ) ) ( not ( = ?auto_873633 ?auto_873630 ) ) ( not ( = ?auto_873633 ?auto_873634 ) ) ( not ( = ?auto_873633 ?auto_873636 ) ) ( not ( = ?auto_873633 ?auto_873635 ) ) ( not ( = ?auto_873633 ?auto_873637 ) ) ( not ( = ?auto_873633 ?auto_873638 ) ) ( not ( = ?auto_873633 ?auto_873639 ) ) ( not ( = ?auto_873633 ?auto_873640 ) ) ( not ( = ?auto_873633 ?auto_873641 ) ) ( not ( = ?auto_873630 ?auto_873634 ) ) ( not ( = ?auto_873630 ?auto_873636 ) ) ( not ( = ?auto_873630 ?auto_873635 ) ) ( not ( = ?auto_873630 ?auto_873637 ) ) ( not ( = ?auto_873630 ?auto_873638 ) ) ( not ( = ?auto_873630 ?auto_873639 ) ) ( not ( = ?auto_873630 ?auto_873640 ) ) ( not ( = ?auto_873630 ?auto_873641 ) ) ( not ( = ?auto_873634 ?auto_873636 ) ) ( not ( = ?auto_873634 ?auto_873635 ) ) ( not ( = ?auto_873634 ?auto_873637 ) ) ( not ( = ?auto_873634 ?auto_873638 ) ) ( not ( = ?auto_873634 ?auto_873639 ) ) ( not ( = ?auto_873634 ?auto_873640 ) ) ( not ( = ?auto_873634 ?auto_873641 ) ) ( not ( = ?auto_873636 ?auto_873635 ) ) ( not ( = ?auto_873636 ?auto_873637 ) ) ( not ( = ?auto_873636 ?auto_873638 ) ) ( not ( = ?auto_873636 ?auto_873639 ) ) ( not ( = ?auto_873636 ?auto_873640 ) ) ( not ( = ?auto_873636 ?auto_873641 ) ) ( not ( = ?auto_873635 ?auto_873637 ) ) ( not ( = ?auto_873635 ?auto_873638 ) ) ( not ( = ?auto_873635 ?auto_873639 ) ) ( not ( = ?auto_873635 ?auto_873640 ) ) ( not ( = ?auto_873635 ?auto_873641 ) ) ( not ( = ?auto_873637 ?auto_873638 ) ) ( not ( = ?auto_873637 ?auto_873639 ) ) ( not ( = ?auto_873637 ?auto_873640 ) ) ( not ( = ?auto_873637 ?auto_873641 ) ) ( not ( = ?auto_873638 ?auto_873639 ) ) ( not ( = ?auto_873638 ?auto_873640 ) ) ( not ( = ?auto_873638 ?auto_873641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873639 ?auto_873640 ?auto_873641 )
      ( MAKE-11CRATE-VERIFY ?auto_873631 ?auto_873632 ?auto_873633 ?auto_873630 ?auto_873634 ?auto_873636 ?auto_873635 ?auto_873637 ?auto_873638 ?auto_873639 ?auto_873640 ?auto_873641 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873752 - SURFACE
      ?auto_873753 - SURFACE
      ?auto_873754 - SURFACE
      ?auto_873751 - SURFACE
      ?auto_873755 - SURFACE
      ?auto_873757 - SURFACE
      ?auto_873756 - SURFACE
      ?auto_873758 - SURFACE
      ?auto_873759 - SURFACE
      ?auto_873760 - SURFACE
      ?auto_873761 - SURFACE
      ?auto_873762 - SURFACE
    )
    :vars
    (
      ?auto_873763 - HOIST
      ?auto_873764 - PLACE
      ?auto_873765 - TRUCK
      ?auto_873766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_873763 ?auto_873764 ) ( SURFACE-AT ?auto_873761 ?auto_873764 ) ( CLEAR ?auto_873761 ) ( IS-CRATE ?auto_873762 ) ( not ( = ?auto_873761 ?auto_873762 ) ) ( AVAILABLE ?auto_873763 ) ( IN ?auto_873762 ?auto_873765 ) ( ON ?auto_873761 ?auto_873760 ) ( not ( = ?auto_873760 ?auto_873761 ) ) ( not ( = ?auto_873760 ?auto_873762 ) ) ( TRUCK-AT ?auto_873765 ?auto_873766 ) ( not ( = ?auto_873766 ?auto_873764 ) ) ( ON ?auto_873753 ?auto_873752 ) ( ON ?auto_873754 ?auto_873753 ) ( ON ?auto_873751 ?auto_873754 ) ( ON ?auto_873755 ?auto_873751 ) ( ON ?auto_873757 ?auto_873755 ) ( ON ?auto_873756 ?auto_873757 ) ( ON ?auto_873758 ?auto_873756 ) ( ON ?auto_873759 ?auto_873758 ) ( ON ?auto_873760 ?auto_873759 ) ( not ( = ?auto_873752 ?auto_873753 ) ) ( not ( = ?auto_873752 ?auto_873754 ) ) ( not ( = ?auto_873752 ?auto_873751 ) ) ( not ( = ?auto_873752 ?auto_873755 ) ) ( not ( = ?auto_873752 ?auto_873757 ) ) ( not ( = ?auto_873752 ?auto_873756 ) ) ( not ( = ?auto_873752 ?auto_873758 ) ) ( not ( = ?auto_873752 ?auto_873759 ) ) ( not ( = ?auto_873752 ?auto_873760 ) ) ( not ( = ?auto_873752 ?auto_873761 ) ) ( not ( = ?auto_873752 ?auto_873762 ) ) ( not ( = ?auto_873753 ?auto_873754 ) ) ( not ( = ?auto_873753 ?auto_873751 ) ) ( not ( = ?auto_873753 ?auto_873755 ) ) ( not ( = ?auto_873753 ?auto_873757 ) ) ( not ( = ?auto_873753 ?auto_873756 ) ) ( not ( = ?auto_873753 ?auto_873758 ) ) ( not ( = ?auto_873753 ?auto_873759 ) ) ( not ( = ?auto_873753 ?auto_873760 ) ) ( not ( = ?auto_873753 ?auto_873761 ) ) ( not ( = ?auto_873753 ?auto_873762 ) ) ( not ( = ?auto_873754 ?auto_873751 ) ) ( not ( = ?auto_873754 ?auto_873755 ) ) ( not ( = ?auto_873754 ?auto_873757 ) ) ( not ( = ?auto_873754 ?auto_873756 ) ) ( not ( = ?auto_873754 ?auto_873758 ) ) ( not ( = ?auto_873754 ?auto_873759 ) ) ( not ( = ?auto_873754 ?auto_873760 ) ) ( not ( = ?auto_873754 ?auto_873761 ) ) ( not ( = ?auto_873754 ?auto_873762 ) ) ( not ( = ?auto_873751 ?auto_873755 ) ) ( not ( = ?auto_873751 ?auto_873757 ) ) ( not ( = ?auto_873751 ?auto_873756 ) ) ( not ( = ?auto_873751 ?auto_873758 ) ) ( not ( = ?auto_873751 ?auto_873759 ) ) ( not ( = ?auto_873751 ?auto_873760 ) ) ( not ( = ?auto_873751 ?auto_873761 ) ) ( not ( = ?auto_873751 ?auto_873762 ) ) ( not ( = ?auto_873755 ?auto_873757 ) ) ( not ( = ?auto_873755 ?auto_873756 ) ) ( not ( = ?auto_873755 ?auto_873758 ) ) ( not ( = ?auto_873755 ?auto_873759 ) ) ( not ( = ?auto_873755 ?auto_873760 ) ) ( not ( = ?auto_873755 ?auto_873761 ) ) ( not ( = ?auto_873755 ?auto_873762 ) ) ( not ( = ?auto_873757 ?auto_873756 ) ) ( not ( = ?auto_873757 ?auto_873758 ) ) ( not ( = ?auto_873757 ?auto_873759 ) ) ( not ( = ?auto_873757 ?auto_873760 ) ) ( not ( = ?auto_873757 ?auto_873761 ) ) ( not ( = ?auto_873757 ?auto_873762 ) ) ( not ( = ?auto_873756 ?auto_873758 ) ) ( not ( = ?auto_873756 ?auto_873759 ) ) ( not ( = ?auto_873756 ?auto_873760 ) ) ( not ( = ?auto_873756 ?auto_873761 ) ) ( not ( = ?auto_873756 ?auto_873762 ) ) ( not ( = ?auto_873758 ?auto_873759 ) ) ( not ( = ?auto_873758 ?auto_873760 ) ) ( not ( = ?auto_873758 ?auto_873761 ) ) ( not ( = ?auto_873758 ?auto_873762 ) ) ( not ( = ?auto_873759 ?auto_873760 ) ) ( not ( = ?auto_873759 ?auto_873761 ) ) ( not ( = ?auto_873759 ?auto_873762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873760 ?auto_873761 ?auto_873762 )
      ( MAKE-11CRATE-VERIFY ?auto_873752 ?auto_873753 ?auto_873754 ?auto_873751 ?auto_873755 ?auto_873757 ?auto_873756 ?auto_873758 ?auto_873759 ?auto_873760 ?auto_873761 ?auto_873762 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873884 - SURFACE
      ?auto_873885 - SURFACE
      ?auto_873886 - SURFACE
      ?auto_873883 - SURFACE
      ?auto_873887 - SURFACE
      ?auto_873889 - SURFACE
      ?auto_873888 - SURFACE
      ?auto_873890 - SURFACE
      ?auto_873891 - SURFACE
      ?auto_873892 - SURFACE
      ?auto_873893 - SURFACE
      ?auto_873894 - SURFACE
    )
    :vars
    (
      ?auto_873897 - HOIST
      ?auto_873896 - PLACE
      ?auto_873899 - TRUCK
      ?auto_873895 - PLACE
      ?auto_873898 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_873897 ?auto_873896 ) ( SURFACE-AT ?auto_873893 ?auto_873896 ) ( CLEAR ?auto_873893 ) ( IS-CRATE ?auto_873894 ) ( not ( = ?auto_873893 ?auto_873894 ) ) ( AVAILABLE ?auto_873897 ) ( ON ?auto_873893 ?auto_873892 ) ( not ( = ?auto_873892 ?auto_873893 ) ) ( not ( = ?auto_873892 ?auto_873894 ) ) ( TRUCK-AT ?auto_873899 ?auto_873895 ) ( not ( = ?auto_873895 ?auto_873896 ) ) ( HOIST-AT ?auto_873898 ?auto_873895 ) ( LIFTING ?auto_873898 ?auto_873894 ) ( not ( = ?auto_873897 ?auto_873898 ) ) ( ON ?auto_873885 ?auto_873884 ) ( ON ?auto_873886 ?auto_873885 ) ( ON ?auto_873883 ?auto_873886 ) ( ON ?auto_873887 ?auto_873883 ) ( ON ?auto_873889 ?auto_873887 ) ( ON ?auto_873888 ?auto_873889 ) ( ON ?auto_873890 ?auto_873888 ) ( ON ?auto_873891 ?auto_873890 ) ( ON ?auto_873892 ?auto_873891 ) ( not ( = ?auto_873884 ?auto_873885 ) ) ( not ( = ?auto_873884 ?auto_873886 ) ) ( not ( = ?auto_873884 ?auto_873883 ) ) ( not ( = ?auto_873884 ?auto_873887 ) ) ( not ( = ?auto_873884 ?auto_873889 ) ) ( not ( = ?auto_873884 ?auto_873888 ) ) ( not ( = ?auto_873884 ?auto_873890 ) ) ( not ( = ?auto_873884 ?auto_873891 ) ) ( not ( = ?auto_873884 ?auto_873892 ) ) ( not ( = ?auto_873884 ?auto_873893 ) ) ( not ( = ?auto_873884 ?auto_873894 ) ) ( not ( = ?auto_873885 ?auto_873886 ) ) ( not ( = ?auto_873885 ?auto_873883 ) ) ( not ( = ?auto_873885 ?auto_873887 ) ) ( not ( = ?auto_873885 ?auto_873889 ) ) ( not ( = ?auto_873885 ?auto_873888 ) ) ( not ( = ?auto_873885 ?auto_873890 ) ) ( not ( = ?auto_873885 ?auto_873891 ) ) ( not ( = ?auto_873885 ?auto_873892 ) ) ( not ( = ?auto_873885 ?auto_873893 ) ) ( not ( = ?auto_873885 ?auto_873894 ) ) ( not ( = ?auto_873886 ?auto_873883 ) ) ( not ( = ?auto_873886 ?auto_873887 ) ) ( not ( = ?auto_873886 ?auto_873889 ) ) ( not ( = ?auto_873886 ?auto_873888 ) ) ( not ( = ?auto_873886 ?auto_873890 ) ) ( not ( = ?auto_873886 ?auto_873891 ) ) ( not ( = ?auto_873886 ?auto_873892 ) ) ( not ( = ?auto_873886 ?auto_873893 ) ) ( not ( = ?auto_873886 ?auto_873894 ) ) ( not ( = ?auto_873883 ?auto_873887 ) ) ( not ( = ?auto_873883 ?auto_873889 ) ) ( not ( = ?auto_873883 ?auto_873888 ) ) ( not ( = ?auto_873883 ?auto_873890 ) ) ( not ( = ?auto_873883 ?auto_873891 ) ) ( not ( = ?auto_873883 ?auto_873892 ) ) ( not ( = ?auto_873883 ?auto_873893 ) ) ( not ( = ?auto_873883 ?auto_873894 ) ) ( not ( = ?auto_873887 ?auto_873889 ) ) ( not ( = ?auto_873887 ?auto_873888 ) ) ( not ( = ?auto_873887 ?auto_873890 ) ) ( not ( = ?auto_873887 ?auto_873891 ) ) ( not ( = ?auto_873887 ?auto_873892 ) ) ( not ( = ?auto_873887 ?auto_873893 ) ) ( not ( = ?auto_873887 ?auto_873894 ) ) ( not ( = ?auto_873889 ?auto_873888 ) ) ( not ( = ?auto_873889 ?auto_873890 ) ) ( not ( = ?auto_873889 ?auto_873891 ) ) ( not ( = ?auto_873889 ?auto_873892 ) ) ( not ( = ?auto_873889 ?auto_873893 ) ) ( not ( = ?auto_873889 ?auto_873894 ) ) ( not ( = ?auto_873888 ?auto_873890 ) ) ( not ( = ?auto_873888 ?auto_873891 ) ) ( not ( = ?auto_873888 ?auto_873892 ) ) ( not ( = ?auto_873888 ?auto_873893 ) ) ( not ( = ?auto_873888 ?auto_873894 ) ) ( not ( = ?auto_873890 ?auto_873891 ) ) ( not ( = ?auto_873890 ?auto_873892 ) ) ( not ( = ?auto_873890 ?auto_873893 ) ) ( not ( = ?auto_873890 ?auto_873894 ) ) ( not ( = ?auto_873891 ?auto_873892 ) ) ( not ( = ?auto_873891 ?auto_873893 ) ) ( not ( = ?auto_873891 ?auto_873894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873892 ?auto_873893 ?auto_873894 )
      ( MAKE-11CRATE-VERIFY ?auto_873884 ?auto_873885 ?auto_873886 ?auto_873883 ?auto_873887 ?auto_873889 ?auto_873888 ?auto_873890 ?auto_873891 ?auto_873892 ?auto_873893 ?auto_873894 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_874027 - SURFACE
      ?auto_874028 - SURFACE
      ?auto_874029 - SURFACE
      ?auto_874026 - SURFACE
      ?auto_874030 - SURFACE
      ?auto_874032 - SURFACE
      ?auto_874031 - SURFACE
      ?auto_874033 - SURFACE
      ?auto_874034 - SURFACE
      ?auto_874035 - SURFACE
      ?auto_874036 - SURFACE
      ?auto_874037 - SURFACE
    )
    :vars
    (
      ?auto_874043 - HOIST
      ?auto_874041 - PLACE
      ?auto_874039 - TRUCK
      ?auto_874040 - PLACE
      ?auto_874042 - HOIST
      ?auto_874038 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_874043 ?auto_874041 ) ( SURFACE-AT ?auto_874036 ?auto_874041 ) ( CLEAR ?auto_874036 ) ( IS-CRATE ?auto_874037 ) ( not ( = ?auto_874036 ?auto_874037 ) ) ( AVAILABLE ?auto_874043 ) ( ON ?auto_874036 ?auto_874035 ) ( not ( = ?auto_874035 ?auto_874036 ) ) ( not ( = ?auto_874035 ?auto_874037 ) ) ( TRUCK-AT ?auto_874039 ?auto_874040 ) ( not ( = ?auto_874040 ?auto_874041 ) ) ( HOIST-AT ?auto_874042 ?auto_874040 ) ( not ( = ?auto_874043 ?auto_874042 ) ) ( AVAILABLE ?auto_874042 ) ( SURFACE-AT ?auto_874037 ?auto_874040 ) ( ON ?auto_874037 ?auto_874038 ) ( CLEAR ?auto_874037 ) ( not ( = ?auto_874036 ?auto_874038 ) ) ( not ( = ?auto_874037 ?auto_874038 ) ) ( not ( = ?auto_874035 ?auto_874038 ) ) ( ON ?auto_874028 ?auto_874027 ) ( ON ?auto_874029 ?auto_874028 ) ( ON ?auto_874026 ?auto_874029 ) ( ON ?auto_874030 ?auto_874026 ) ( ON ?auto_874032 ?auto_874030 ) ( ON ?auto_874031 ?auto_874032 ) ( ON ?auto_874033 ?auto_874031 ) ( ON ?auto_874034 ?auto_874033 ) ( ON ?auto_874035 ?auto_874034 ) ( not ( = ?auto_874027 ?auto_874028 ) ) ( not ( = ?auto_874027 ?auto_874029 ) ) ( not ( = ?auto_874027 ?auto_874026 ) ) ( not ( = ?auto_874027 ?auto_874030 ) ) ( not ( = ?auto_874027 ?auto_874032 ) ) ( not ( = ?auto_874027 ?auto_874031 ) ) ( not ( = ?auto_874027 ?auto_874033 ) ) ( not ( = ?auto_874027 ?auto_874034 ) ) ( not ( = ?auto_874027 ?auto_874035 ) ) ( not ( = ?auto_874027 ?auto_874036 ) ) ( not ( = ?auto_874027 ?auto_874037 ) ) ( not ( = ?auto_874027 ?auto_874038 ) ) ( not ( = ?auto_874028 ?auto_874029 ) ) ( not ( = ?auto_874028 ?auto_874026 ) ) ( not ( = ?auto_874028 ?auto_874030 ) ) ( not ( = ?auto_874028 ?auto_874032 ) ) ( not ( = ?auto_874028 ?auto_874031 ) ) ( not ( = ?auto_874028 ?auto_874033 ) ) ( not ( = ?auto_874028 ?auto_874034 ) ) ( not ( = ?auto_874028 ?auto_874035 ) ) ( not ( = ?auto_874028 ?auto_874036 ) ) ( not ( = ?auto_874028 ?auto_874037 ) ) ( not ( = ?auto_874028 ?auto_874038 ) ) ( not ( = ?auto_874029 ?auto_874026 ) ) ( not ( = ?auto_874029 ?auto_874030 ) ) ( not ( = ?auto_874029 ?auto_874032 ) ) ( not ( = ?auto_874029 ?auto_874031 ) ) ( not ( = ?auto_874029 ?auto_874033 ) ) ( not ( = ?auto_874029 ?auto_874034 ) ) ( not ( = ?auto_874029 ?auto_874035 ) ) ( not ( = ?auto_874029 ?auto_874036 ) ) ( not ( = ?auto_874029 ?auto_874037 ) ) ( not ( = ?auto_874029 ?auto_874038 ) ) ( not ( = ?auto_874026 ?auto_874030 ) ) ( not ( = ?auto_874026 ?auto_874032 ) ) ( not ( = ?auto_874026 ?auto_874031 ) ) ( not ( = ?auto_874026 ?auto_874033 ) ) ( not ( = ?auto_874026 ?auto_874034 ) ) ( not ( = ?auto_874026 ?auto_874035 ) ) ( not ( = ?auto_874026 ?auto_874036 ) ) ( not ( = ?auto_874026 ?auto_874037 ) ) ( not ( = ?auto_874026 ?auto_874038 ) ) ( not ( = ?auto_874030 ?auto_874032 ) ) ( not ( = ?auto_874030 ?auto_874031 ) ) ( not ( = ?auto_874030 ?auto_874033 ) ) ( not ( = ?auto_874030 ?auto_874034 ) ) ( not ( = ?auto_874030 ?auto_874035 ) ) ( not ( = ?auto_874030 ?auto_874036 ) ) ( not ( = ?auto_874030 ?auto_874037 ) ) ( not ( = ?auto_874030 ?auto_874038 ) ) ( not ( = ?auto_874032 ?auto_874031 ) ) ( not ( = ?auto_874032 ?auto_874033 ) ) ( not ( = ?auto_874032 ?auto_874034 ) ) ( not ( = ?auto_874032 ?auto_874035 ) ) ( not ( = ?auto_874032 ?auto_874036 ) ) ( not ( = ?auto_874032 ?auto_874037 ) ) ( not ( = ?auto_874032 ?auto_874038 ) ) ( not ( = ?auto_874031 ?auto_874033 ) ) ( not ( = ?auto_874031 ?auto_874034 ) ) ( not ( = ?auto_874031 ?auto_874035 ) ) ( not ( = ?auto_874031 ?auto_874036 ) ) ( not ( = ?auto_874031 ?auto_874037 ) ) ( not ( = ?auto_874031 ?auto_874038 ) ) ( not ( = ?auto_874033 ?auto_874034 ) ) ( not ( = ?auto_874033 ?auto_874035 ) ) ( not ( = ?auto_874033 ?auto_874036 ) ) ( not ( = ?auto_874033 ?auto_874037 ) ) ( not ( = ?auto_874033 ?auto_874038 ) ) ( not ( = ?auto_874034 ?auto_874035 ) ) ( not ( = ?auto_874034 ?auto_874036 ) ) ( not ( = ?auto_874034 ?auto_874037 ) ) ( not ( = ?auto_874034 ?auto_874038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_874035 ?auto_874036 ?auto_874037 )
      ( MAKE-11CRATE-VERIFY ?auto_874027 ?auto_874028 ?auto_874029 ?auto_874026 ?auto_874030 ?auto_874032 ?auto_874031 ?auto_874033 ?auto_874034 ?auto_874035 ?auto_874036 ?auto_874037 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_874171 - SURFACE
      ?auto_874172 - SURFACE
      ?auto_874173 - SURFACE
      ?auto_874170 - SURFACE
      ?auto_874174 - SURFACE
      ?auto_874176 - SURFACE
      ?auto_874175 - SURFACE
      ?auto_874177 - SURFACE
      ?auto_874178 - SURFACE
      ?auto_874179 - SURFACE
      ?auto_874180 - SURFACE
      ?auto_874181 - SURFACE
    )
    :vars
    (
      ?auto_874187 - HOIST
      ?auto_874186 - PLACE
      ?auto_874185 - PLACE
      ?auto_874184 - HOIST
      ?auto_874183 - SURFACE
      ?auto_874182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874187 ?auto_874186 ) ( SURFACE-AT ?auto_874180 ?auto_874186 ) ( CLEAR ?auto_874180 ) ( IS-CRATE ?auto_874181 ) ( not ( = ?auto_874180 ?auto_874181 ) ) ( AVAILABLE ?auto_874187 ) ( ON ?auto_874180 ?auto_874179 ) ( not ( = ?auto_874179 ?auto_874180 ) ) ( not ( = ?auto_874179 ?auto_874181 ) ) ( not ( = ?auto_874185 ?auto_874186 ) ) ( HOIST-AT ?auto_874184 ?auto_874185 ) ( not ( = ?auto_874187 ?auto_874184 ) ) ( AVAILABLE ?auto_874184 ) ( SURFACE-AT ?auto_874181 ?auto_874185 ) ( ON ?auto_874181 ?auto_874183 ) ( CLEAR ?auto_874181 ) ( not ( = ?auto_874180 ?auto_874183 ) ) ( not ( = ?auto_874181 ?auto_874183 ) ) ( not ( = ?auto_874179 ?auto_874183 ) ) ( TRUCK-AT ?auto_874182 ?auto_874186 ) ( ON ?auto_874172 ?auto_874171 ) ( ON ?auto_874173 ?auto_874172 ) ( ON ?auto_874170 ?auto_874173 ) ( ON ?auto_874174 ?auto_874170 ) ( ON ?auto_874176 ?auto_874174 ) ( ON ?auto_874175 ?auto_874176 ) ( ON ?auto_874177 ?auto_874175 ) ( ON ?auto_874178 ?auto_874177 ) ( ON ?auto_874179 ?auto_874178 ) ( not ( = ?auto_874171 ?auto_874172 ) ) ( not ( = ?auto_874171 ?auto_874173 ) ) ( not ( = ?auto_874171 ?auto_874170 ) ) ( not ( = ?auto_874171 ?auto_874174 ) ) ( not ( = ?auto_874171 ?auto_874176 ) ) ( not ( = ?auto_874171 ?auto_874175 ) ) ( not ( = ?auto_874171 ?auto_874177 ) ) ( not ( = ?auto_874171 ?auto_874178 ) ) ( not ( = ?auto_874171 ?auto_874179 ) ) ( not ( = ?auto_874171 ?auto_874180 ) ) ( not ( = ?auto_874171 ?auto_874181 ) ) ( not ( = ?auto_874171 ?auto_874183 ) ) ( not ( = ?auto_874172 ?auto_874173 ) ) ( not ( = ?auto_874172 ?auto_874170 ) ) ( not ( = ?auto_874172 ?auto_874174 ) ) ( not ( = ?auto_874172 ?auto_874176 ) ) ( not ( = ?auto_874172 ?auto_874175 ) ) ( not ( = ?auto_874172 ?auto_874177 ) ) ( not ( = ?auto_874172 ?auto_874178 ) ) ( not ( = ?auto_874172 ?auto_874179 ) ) ( not ( = ?auto_874172 ?auto_874180 ) ) ( not ( = ?auto_874172 ?auto_874181 ) ) ( not ( = ?auto_874172 ?auto_874183 ) ) ( not ( = ?auto_874173 ?auto_874170 ) ) ( not ( = ?auto_874173 ?auto_874174 ) ) ( not ( = ?auto_874173 ?auto_874176 ) ) ( not ( = ?auto_874173 ?auto_874175 ) ) ( not ( = ?auto_874173 ?auto_874177 ) ) ( not ( = ?auto_874173 ?auto_874178 ) ) ( not ( = ?auto_874173 ?auto_874179 ) ) ( not ( = ?auto_874173 ?auto_874180 ) ) ( not ( = ?auto_874173 ?auto_874181 ) ) ( not ( = ?auto_874173 ?auto_874183 ) ) ( not ( = ?auto_874170 ?auto_874174 ) ) ( not ( = ?auto_874170 ?auto_874176 ) ) ( not ( = ?auto_874170 ?auto_874175 ) ) ( not ( = ?auto_874170 ?auto_874177 ) ) ( not ( = ?auto_874170 ?auto_874178 ) ) ( not ( = ?auto_874170 ?auto_874179 ) ) ( not ( = ?auto_874170 ?auto_874180 ) ) ( not ( = ?auto_874170 ?auto_874181 ) ) ( not ( = ?auto_874170 ?auto_874183 ) ) ( not ( = ?auto_874174 ?auto_874176 ) ) ( not ( = ?auto_874174 ?auto_874175 ) ) ( not ( = ?auto_874174 ?auto_874177 ) ) ( not ( = ?auto_874174 ?auto_874178 ) ) ( not ( = ?auto_874174 ?auto_874179 ) ) ( not ( = ?auto_874174 ?auto_874180 ) ) ( not ( = ?auto_874174 ?auto_874181 ) ) ( not ( = ?auto_874174 ?auto_874183 ) ) ( not ( = ?auto_874176 ?auto_874175 ) ) ( not ( = ?auto_874176 ?auto_874177 ) ) ( not ( = ?auto_874176 ?auto_874178 ) ) ( not ( = ?auto_874176 ?auto_874179 ) ) ( not ( = ?auto_874176 ?auto_874180 ) ) ( not ( = ?auto_874176 ?auto_874181 ) ) ( not ( = ?auto_874176 ?auto_874183 ) ) ( not ( = ?auto_874175 ?auto_874177 ) ) ( not ( = ?auto_874175 ?auto_874178 ) ) ( not ( = ?auto_874175 ?auto_874179 ) ) ( not ( = ?auto_874175 ?auto_874180 ) ) ( not ( = ?auto_874175 ?auto_874181 ) ) ( not ( = ?auto_874175 ?auto_874183 ) ) ( not ( = ?auto_874177 ?auto_874178 ) ) ( not ( = ?auto_874177 ?auto_874179 ) ) ( not ( = ?auto_874177 ?auto_874180 ) ) ( not ( = ?auto_874177 ?auto_874181 ) ) ( not ( = ?auto_874177 ?auto_874183 ) ) ( not ( = ?auto_874178 ?auto_874179 ) ) ( not ( = ?auto_874178 ?auto_874180 ) ) ( not ( = ?auto_874178 ?auto_874181 ) ) ( not ( = ?auto_874178 ?auto_874183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_874179 ?auto_874180 ?auto_874181 )
      ( MAKE-11CRATE-VERIFY ?auto_874171 ?auto_874172 ?auto_874173 ?auto_874170 ?auto_874174 ?auto_874176 ?auto_874175 ?auto_874177 ?auto_874178 ?auto_874179 ?auto_874180 ?auto_874181 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_874315 - SURFACE
      ?auto_874316 - SURFACE
      ?auto_874317 - SURFACE
      ?auto_874314 - SURFACE
      ?auto_874318 - SURFACE
      ?auto_874320 - SURFACE
      ?auto_874319 - SURFACE
      ?auto_874321 - SURFACE
      ?auto_874322 - SURFACE
      ?auto_874323 - SURFACE
      ?auto_874324 - SURFACE
      ?auto_874325 - SURFACE
    )
    :vars
    (
      ?auto_874326 - HOIST
      ?auto_874327 - PLACE
      ?auto_874331 - PLACE
      ?auto_874329 - HOIST
      ?auto_874328 - SURFACE
      ?auto_874330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874326 ?auto_874327 ) ( IS-CRATE ?auto_874325 ) ( not ( = ?auto_874324 ?auto_874325 ) ) ( not ( = ?auto_874323 ?auto_874324 ) ) ( not ( = ?auto_874323 ?auto_874325 ) ) ( not ( = ?auto_874331 ?auto_874327 ) ) ( HOIST-AT ?auto_874329 ?auto_874331 ) ( not ( = ?auto_874326 ?auto_874329 ) ) ( AVAILABLE ?auto_874329 ) ( SURFACE-AT ?auto_874325 ?auto_874331 ) ( ON ?auto_874325 ?auto_874328 ) ( CLEAR ?auto_874325 ) ( not ( = ?auto_874324 ?auto_874328 ) ) ( not ( = ?auto_874325 ?auto_874328 ) ) ( not ( = ?auto_874323 ?auto_874328 ) ) ( TRUCK-AT ?auto_874330 ?auto_874327 ) ( SURFACE-AT ?auto_874323 ?auto_874327 ) ( CLEAR ?auto_874323 ) ( LIFTING ?auto_874326 ?auto_874324 ) ( IS-CRATE ?auto_874324 ) ( ON ?auto_874316 ?auto_874315 ) ( ON ?auto_874317 ?auto_874316 ) ( ON ?auto_874314 ?auto_874317 ) ( ON ?auto_874318 ?auto_874314 ) ( ON ?auto_874320 ?auto_874318 ) ( ON ?auto_874319 ?auto_874320 ) ( ON ?auto_874321 ?auto_874319 ) ( ON ?auto_874322 ?auto_874321 ) ( ON ?auto_874323 ?auto_874322 ) ( not ( = ?auto_874315 ?auto_874316 ) ) ( not ( = ?auto_874315 ?auto_874317 ) ) ( not ( = ?auto_874315 ?auto_874314 ) ) ( not ( = ?auto_874315 ?auto_874318 ) ) ( not ( = ?auto_874315 ?auto_874320 ) ) ( not ( = ?auto_874315 ?auto_874319 ) ) ( not ( = ?auto_874315 ?auto_874321 ) ) ( not ( = ?auto_874315 ?auto_874322 ) ) ( not ( = ?auto_874315 ?auto_874323 ) ) ( not ( = ?auto_874315 ?auto_874324 ) ) ( not ( = ?auto_874315 ?auto_874325 ) ) ( not ( = ?auto_874315 ?auto_874328 ) ) ( not ( = ?auto_874316 ?auto_874317 ) ) ( not ( = ?auto_874316 ?auto_874314 ) ) ( not ( = ?auto_874316 ?auto_874318 ) ) ( not ( = ?auto_874316 ?auto_874320 ) ) ( not ( = ?auto_874316 ?auto_874319 ) ) ( not ( = ?auto_874316 ?auto_874321 ) ) ( not ( = ?auto_874316 ?auto_874322 ) ) ( not ( = ?auto_874316 ?auto_874323 ) ) ( not ( = ?auto_874316 ?auto_874324 ) ) ( not ( = ?auto_874316 ?auto_874325 ) ) ( not ( = ?auto_874316 ?auto_874328 ) ) ( not ( = ?auto_874317 ?auto_874314 ) ) ( not ( = ?auto_874317 ?auto_874318 ) ) ( not ( = ?auto_874317 ?auto_874320 ) ) ( not ( = ?auto_874317 ?auto_874319 ) ) ( not ( = ?auto_874317 ?auto_874321 ) ) ( not ( = ?auto_874317 ?auto_874322 ) ) ( not ( = ?auto_874317 ?auto_874323 ) ) ( not ( = ?auto_874317 ?auto_874324 ) ) ( not ( = ?auto_874317 ?auto_874325 ) ) ( not ( = ?auto_874317 ?auto_874328 ) ) ( not ( = ?auto_874314 ?auto_874318 ) ) ( not ( = ?auto_874314 ?auto_874320 ) ) ( not ( = ?auto_874314 ?auto_874319 ) ) ( not ( = ?auto_874314 ?auto_874321 ) ) ( not ( = ?auto_874314 ?auto_874322 ) ) ( not ( = ?auto_874314 ?auto_874323 ) ) ( not ( = ?auto_874314 ?auto_874324 ) ) ( not ( = ?auto_874314 ?auto_874325 ) ) ( not ( = ?auto_874314 ?auto_874328 ) ) ( not ( = ?auto_874318 ?auto_874320 ) ) ( not ( = ?auto_874318 ?auto_874319 ) ) ( not ( = ?auto_874318 ?auto_874321 ) ) ( not ( = ?auto_874318 ?auto_874322 ) ) ( not ( = ?auto_874318 ?auto_874323 ) ) ( not ( = ?auto_874318 ?auto_874324 ) ) ( not ( = ?auto_874318 ?auto_874325 ) ) ( not ( = ?auto_874318 ?auto_874328 ) ) ( not ( = ?auto_874320 ?auto_874319 ) ) ( not ( = ?auto_874320 ?auto_874321 ) ) ( not ( = ?auto_874320 ?auto_874322 ) ) ( not ( = ?auto_874320 ?auto_874323 ) ) ( not ( = ?auto_874320 ?auto_874324 ) ) ( not ( = ?auto_874320 ?auto_874325 ) ) ( not ( = ?auto_874320 ?auto_874328 ) ) ( not ( = ?auto_874319 ?auto_874321 ) ) ( not ( = ?auto_874319 ?auto_874322 ) ) ( not ( = ?auto_874319 ?auto_874323 ) ) ( not ( = ?auto_874319 ?auto_874324 ) ) ( not ( = ?auto_874319 ?auto_874325 ) ) ( not ( = ?auto_874319 ?auto_874328 ) ) ( not ( = ?auto_874321 ?auto_874322 ) ) ( not ( = ?auto_874321 ?auto_874323 ) ) ( not ( = ?auto_874321 ?auto_874324 ) ) ( not ( = ?auto_874321 ?auto_874325 ) ) ( not ( = ?auto_874321 ?auto_874328 ) ) ( not ( = ?auto_874322 ?auto_874323 ) ) ( not ( = ?auto_874322 ?auto_874324 ) ) ( not ( = ?auto_874322 ?auto_874325 ) ) ( not ( = ?auto_874322 ?auto_874328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_874323 ?auto_874324 ?auto_874325 )
      ( MAKE-11CRATE-VERIFY ?auto_874315 ?auto_874316 ?auto_874317 ?auto_874314 ?auto_874318 ?auto_874320 ?auto_874319 ?auto_874321 ?auto_874322 ?auto_874323 ?auto_874324 ?auto_874325 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_874459 - SURFACE
      ?auto_874460 - SURFACE
      ?auto_874461 - SURFACE
      ?auto_874458 - SURFACE
      ?auto_874462 - SURFACE
      ?auto_874464 - SURFACE
      ?auto_874463 - SURFACE
      ?auto_874465 - SURFACE
      ?auto_874466 - SURFACE
      ?auto_874467 - SURFACE
      ?auto_874468 - SURFACE
      ?auto_874469 - SURFACE
    )
    :vars
    (
      ?auto_874475 - HOIST
      ?auto_874470 - PLACE
      ?auto_874471 - PLACE
      ?auto_874474 - HOIST
      ?auto_874472 - SURFACE
      ?auto_874473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874475 ?auto_874470 ) ( IS-CRATE ?auto_874469 ) ( not ( = ?auto_874468 ?auto_874469 ) ) ( not ( = ?auto_874467 ?auto_874468 ) ) ( not ( = ?auto_874467 ?auto_874469 ) ) ( not ( = ?auto_874471 ?auto_874470 ) ) ( HOIST-AT ?auto_874474 ?auto_874471 ) ( not ( = ?auto_874475 ?auto_874474 ) ) ( AVAILABLE ?auto_874474 ) ( SURFACE-AT ?auto_874469 ?auto_874471 ) ( ON ?auto_874469 ?auto_874472 ) ( CLEAR ?auto_874469 ) ( not ( = ?auto_874468 ?auto_874472 ) ) ( not ( = ?auto_874469 ?auto_874472 ) ) ( not ( = ?auto_874467 ?auto_874472 ) ) ( TRUCK-AT ?auto_874473 ?auto_874470 ) ( SURFACE-AT ?auto_874467 ?auto_874470 ) ( CLEAR ?auto_874467 ) ( IS-CRATE ?auto_874468 ) ( AVAILABLE ?auto_874475 ) ( IN ?auto_874468 ?auto_874473 ) ( ON ?auto_874460 ?auto_874459 ) ( ON ?auto_874461 ?auto_874460 ) ( ON ?auto_874458 ?auto_874461 ) ( ON ?auto_874462 ?auto_874458 ) ( ON ?auto_874464 ?auto_874462 ) ( ON ?auto_874463 ?auto_874464 ) ( ON ?auto_874465 ?auto_874463 ) ( ON ?auto_874466 ?auto_874465 ) ( ON ?auto_874467 ?auto_874466 ) ( not ( = ?auto_874459 ?auto_874460 ) ) ( not ( = ?auto_874459 ?auto_874461 ) ) ( not ( = ?auto_874459 ?auto_874458 ) ) ( not ( = ?auto_874459 ?auto_874462 ) ) ( not ( = ?auto_874459 ?auto_874464 ) ) ( not ( = ?auto_874459 ?auto_874463 ) ) ( not ( = ?auto_874459 ?auto_874465 ) ) ( not ( = ?auto_874459 ?auto_874466 ) ) ( not ( = ?auto_874459 ?auto_874467 ) ) ( not ( = ?auto_874459 ?auto_874468 ) ) ( not ( = ?auto_874459 ?auto_874469 ) ) ( not ( = ?auto_874459 ?auto_874472 ) ) ( not ( = ?auto_874460 ?auto_874461 ) ) ( not ( = ?auto_874460 ?auto_874458 ) ) ( not ( = ?auto_874460 ?auto_874462 ) ) ( not ( = ?auto_874460 ?auto_874464 ) ) ( not ( = ?auto_874460 ?auto_874463 ) ) ( not ( = ?auto_874460 ?auto_874465 ) ) ( not ( = ?auto_874460 ?auto_874466 ) ) ( not ( = ?auto_874460 ?auto_874467 ) ) ( not ( = ?auto_874460 ?auto_874468 ) ) ( not ( = ?auto_874460 ?auto_874469 ) ) ( not ( = ?auto_874460 ?auto_874472 ) ) ( not ( = ?auto_874461 ?auto_874458 ) ) ( not ( = ?auto_874461 ?auto_874462 ) ) ( not ( = ?auto_874461 ?auto_874464 ) ) ( not ( = ?auto_874461 ?auto_874463 ) ) ( not ( = ?auto_874461 ?auto_874465 ) ) ( not ( = ?auto_874461 ?auto_874466 ) ) ( not ( = ?auto_874461 ?auto_874467 ) ) ( not ( = ?auto_874461 ?auto_874468 ) ) ( not ( = ?auto_874461 ?auto_874469 ) ) ( not ( = ?auto_874461 ?auto_874472 ) ) ( not ( = ?auto_874458 ?auto_874462 ) ) ( not ( = ?auto_874458 ?auto_874464 ) ) ( not ( = ?auto_874458 ?auto_874463 ) ) ( not ( = ?auto_874458 ?auto_874465 ) ) ( not ( = ?auto_874458 ?auto_874466 ) ) ( not ( = ?auto_874458 ?auto_874467 ) ) ( not ( = ?auto_874458 ?auto_874468 ) ) ( not ( = ?auto_874458 ?auto_874469 ) ) ( not ( = ?auto_874458 ?auto_874472 ) ) ( not ( = ?auto_874462 ?auto_874464 ) ) ( not ( = ?auto_874462 ?auto_874463 ) ) ( not ( = ?auto_874462 ?auto_874465 ) ) ( not ( = ?auto_874462 ?auto_874466 ) ) ( not ( = ?auto_874462 ?auto_874467 ) ) ( not ( = ?auto_874462 ?auto_874468 ) ) ( not ( = ?auto_874462 ?auto_874469 ) ) ( not ( = ?auto_874462 ?auto_874472 ) ) ( not ( = ?auto_874464 ?auto_874463 ) ) ( not ( = ?auto_874464 ?auto_874465 ) ) ( not ( = ?auto_874464 ?auto_874466 ) ) ( not ( = ?auto_874464 ?auto_874467 ) ) ( not ( = ?auto_874464 ?auto_874468 ) ) ( not ( = ?auto_874464 ?auto_874469 ) ) ( not ( = ?auto_874464 ?auto_874472 ) ) ( not ( = ?auto_874463 ?auto_874465 ) ) ( not ( = ?auto_874463 ?auto_874466 ) ) ( not ( = ?auto_874463 ?auto_874467 ) ) ( not ( = ?auto_874463 ?auto_874468 ) ) ( not ( = ?auto_874463 ?auto_874469 ) ) ( not ( = ?auto_874463 ?auto_874472 ) ) ( not ( = ?auto_874465 ?auto_874466 ) ) ( not ( = ?auto_874465 ?auto_874467 ) ) ( not ( = ?auto_874465 ?auto_874468 ) ) ( not ( = ?auto_874465 ?auto_874469 ) ) ( not ( = ?auto_874465 ?auto_874472 ) ) ( not ( = ?auto_874466 ?auto_874467 ) ) ( not ( = ?auto_874466 ?auto_874468 ) ) ( not ( = ?auto_874466 ?auto_874469 ) ) ( not ( = ?auto_874466 ?auto_874472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_874467 ?auto_874468 ?auto_874469 )
      ( MAKE-11CRATE-VERIFY ?auto_874459 ?auto_874460 ?auto_874461 ?auto_874458 ?auto_874462 ?auto_874464 ?auto_874463 ?auto_874465 ?auto_874466 ?auto_874467 ?auto_874468 ?auto_874469 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883750 - SURFACE
      ?auto_883751 - SURFACE
      ?auto_883752 - SURFACE
      ?auto_883749 - SURFACE
      ?auto_883753 - SURFACE
      ?auto_883755 - SURFACE
      ?auto_883754 - SURFACE
      ?auto_883756 - SURFACE
      ?auto_883757 - SURFACE
      ?auto_883758 - SURFACE
      ?auto_883759 - SURFACE
      ?auto_883760 - SURFACE
      ?auto_883761 - SURFACE
    )
    :vars
    (
      ?auto_883762 - HOIST
      ?auto_883763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_883762 ?auto_883763 ) ( SURFACE-AT ?auto_883760 ?auto_883763 ) ( CLEAR ?auto_883760 ) ( LIFTING ?auto_883762 ?auto_883761 ) ( IS-CRATE ?auto_883761 ) ( not ( = ?auto_883760 ?auto_883761 ) ) ( ON ?auto_883751 ?auto_883750 ) ( ON ?auto_883752 ?auto_883751 ) ( ON ?auto_883749 ?auto_883752 ) ( ON ?auto_883753 ?auto_883749 ) ( ON ?auto_883755 ?auto_883753 ) ( ON ?auto_883754 ?auto_883755 ) ( ON ?auto_883756 ?auto_883754 ) ( ON ?auto_883757 ?auto_883756 ) ( ON ?auto_883758 ?auto_883757 ) ( ON ?auto_883759 ?auto_883758 ) ( ON ?auto_883760 ?auto_883759 ) ( not ( = ?auto_883750 ?auto_883751 ) ) ( not ( = ?auto_883750 ?auto_883752 ) ) ( not ( = ?auto_883750 ?auto_883749 ) ) ( not ( = ?auto_883750 ?auto_883753 ) ) ( not ( = ?auto_883750 ?auto_883755 ) ) ( not ( = ?auto_883750 ?auto_883754 ) ) ( not ( = ?auto_883750 ?auto_883756 ) ) ( not ( = ?auto_883750 ?auto_883757 ) ) ( not ( = ?auto_883750 ?auto_883758 ) ) ( not ( = ?auto_883750 ?auto_883759 ) ) ( not ( = ?auto_883750 ?auto_883760 ) ) ( not ( = ?auto_883750 ?auto_883761 ) ) ( not ( = ?auto_883751 ?auto_883752 ) ) ( not ( = ?auto_883751 ?auto_883749 ) ) ( not ( = ?auto_883751 ?auto_883753 ) ) ( not ( = ?auto_883751 ?auto_883755 ) ) ( not ( = ?auto_883751 ?auto_883754 ) ) ( not ( = ?auto_883751 ?auto_883756 ) ) ( not ( = ?auto_883751 ?auto_883757 ) ) ( not ( = ?auto_883751 ?auto_883758 ) ) ( not ( = ?auto_883751 ?auto_883759 ) ) ( not ( = ?auto_883751 ?auto_883760 ) ) ( not ( = ?auto_883751 ?auto_883761 ) ) ( not ( = ?auto_883752 ?auto_883749 ) ) ( not ( = ?auto_883752 ?auto_883753 ) ) ( not ( = ?auto_883752 ?auto_883755 ) ) ( not ( = ?auto_883752 ?auto_883754 ) ) ( not ( = ?auto_883752 ?auto_883756 ) ) ( not ( = ?auto_883752 ?auto_883757 ) ) ( not ( = ?auto_883752 ?auto_883758 ) ) ( not ( = ?auto_883752 ?auto_883759 ) ) ( not ( = ?auto_883752 ?auto_883760 ) ) ( not ( = ?auto_883752 ?auto_883761 ) ) ( not ( = ?auto_883749 ?auto_883753 ) ) ( not ( = ?auto_883749 ?auto_883755 ) ) ( not ( = ?auto_883749 ?auto_883754 ) ) ( not ( = ?auto_883749 ?auto_883756 ) ) ( not ( = ?auto_883749 ?auto_883757 ) ) ( not ( = ?auto_883749 ?auto_883758 ) ) ( not ( = ?auto_883749 ?auto_883759 ) ) ( not ( = ?auto_883749 ?auto_883760 ) ) ( not ( = ?auto_883749 ?auto_883761 ) ) ( not ( = ?auto_883753 ?auto_883755 ) ) ( not ( = ?auto_883753 ?auto_883754 ) ) ( not ( = ?auto_883753 ?auto_883756 ) ) ( not ( = ?auto_883753 ?auto_883757 ) ) ( not ( = ?auto_883753 ?auto_883758 ) ) ( not ( = ?auto_883753 ?auto_883759 ) ) ( not ( = ?auto_883753 ?auto_883760 ) ) ( not ( = ?auto_883753 ?auto_883761 ) ) ( not ( = ?auto_883755 ?auto_883754 ) ) ( not ( = ?auto_883755 ?auto_883756 ) ) ( not ( = ?auto_883755 ?auto_883757 ) ) ( not ( = ?auto_883755 ?auto_883758 ) ) ( not ( = ?auto_883755 ?auto_883759 ) ) ( not ( = ?auto_883755 ?auto_883760 ) ) ( not ( = ?auto_883755 ?auto_883761 ) ) ( not ( = ?auto_883754 ?auto_883756 ) ) ( not ( = ?auto_883754 ?auto_883757 ) ) ( not ( = ?auto_883754 ?auto_883758 ) ) ( not ( = ?auto_883754 ?auto_883759 ) ) ( not ( = ?auto_883754 ?auto_883760 ) ) ( not ( = ?auto_883754 ?auto_883761 ) ) ( not ( = ?auto_883756 ?auto_883757 ) ) ( not ( = ?auto_883756 ?auto_883758 ) ) ( not ( = ?auto_883756 ?auto_883759 ) ) ( not ( = ?auto_883756 ?auto_883760 ) ) ( not ( = ?auto_883756 ?auto_883761 ) ) ( not ( = ?auto_883757 ?auto_883758 ) ) ( not ( = ?auto_883757 ?auto_883759 ) ) ( not ( = ?auto_883757 ?auto_883760 ) ) ( not ( = ?auto_883757 ?auto_883761 ) ) ( not ( = ?auto_883758 ?auto_883759 ) ) ( not ( = ?auto_883758 ?auto_883760 ) ) ( not ( = ?auto_883758 ?auto_883761 ) ) ( not ( = ?auto_883759 ?auto_883760 ) ) ( not ( = ?auto_883759 ?auto_883761 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_883760 ?auto_883761 )
      ( MAKE-12CRATE-VERIFY ?auto_883750 ?auto_883751 ?auto_883752 ?auto_883749 ?auto_883753 ?auto_883755 ?auto_883754 ?auto_883756 ?auto_883757 ?auto_883758 ?auto_883759 ?auto_883760 ?auto_883761 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883875 - SURFACE
      ?auto_883876 - SURFACE
      ?auto_883877 - SURFACE
      ?auto_883874 - SURFACE
      ?auto_883878 - SURFACE
      ?auto_883880 - SURFACE
      ?auto_883879 - SURFACE
      ?auto_883881 - SURFACE
      ?auto_883882 - SURFACE
      ?auto_883883 - SURFACE
      ?auto_883884 - SURFACE
      ?auto_883885 - SURFACE
      ?auto_883886 - SURFACE
    )
    :vars
    (
      ?auto_883888 - HOIST
      ?auto_883889 - PLACE
      ?auto_883887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883888 ?auto_883889 ) ( SURFACE-AT ?auto_883885 ?auto_883889 ) ( CLEAR ?auto_883885 ) ( IS-CRATE ?auto_883886 ) ( not ( = ?auto_883885 ?auto_883886 ) ) ( TRUCK-AT ?auto_883887 ?auto_883889 ) ( AVAILABLE ?auto_883888 ) ( IN ?auto_883886 ?auto_883887 ) ( ON ?auto_883885 ?auto_883884 ) ( not ( = ?auto_883884 ?auto_883885 ) ) ( not ( = ?auto_883884 ?auto_883886 ) ) ( ON ?auto_883876 ?auto_883875 ) ( ON ?auto_883877 ?auto_883876 ) ( ON ?auto_883874 ?auto_883877 ) ( ON ?auto_883878 ?auto_883874 ) ( ON ?auto_883880 ?auto_883878 ) ( ON ?auto_883879 ?auto_883880 ) ( ON ?auto_883881 ?auto_883879 ) ( ON ?auto_883882 ?auto_883881 ) ( ON ?auto_883883 ?auto_883882 ) ( ON ?auto_883884 ?auto_883883 ) ( not ( = ?auto_883875 ?auto_883876 ) ) ( not ( = ?auto_883875 ?auto_883877 ) ) ( not ( = ?auto_883875 ?auto_883874 ) ) ( not ( = ?auto_883875 ?auto_883878 ) ) ( not ( = ?auto_883875 ?auto_883880 ) ) ( not ( = ?auto_883875 ?auto_883879 ) ) ( not ( = ?auto_883875 ?auto_883881 ) ) ( not ( = ?auto_883875 ?auto_883882 ) ) ( not ( = ?auto_883875 ?auto_883883 ) ) ( not ( = ?auto_883875 ?auto_883884 ) ) ( not ( = ?auto_883875 ?auto_883885 ) ) ( not ( = ?auto_883875 ?auto_883886 ) ) ( not ( = ?auto_883876 ?auto_883877 ) ) ( not ( = ?auto_883876 ?auto_883874 ) ) ( not ( = ?auto_883876 ?auto_883878 ) ) ( not ( = ?auto_883876 ?auto_883880 ) ) ( not ( = ?auto_883876 ?auto_883879 ) ) ( not ( = ?auto_883876 ?auto_883881 ) ) ( not ( = ?auto_883876 ?auto_883882 ) ) ( not ( = ?auto_883876 ?auto_883883 ) ) ( not ( = ?auto_883876 ?auto_883884 ) ) ( not ( = ?auto_883876 ?auto_883885 ) ) ( not ( = ?auto_883876 ?auto_883886 ) ) ( not ( = ?auto_883877 ?auto_883874 ) ) ( not ( = ?auto_883877 ?auto_883878 ) ) ( not ( = ?auto_883877 ?auto_883880 ) ) ( not ( = ?auto_883877 ?auto_883879 ) ) ( not ( = ?auto_883877 ?auto_883881 ) ) ( not ( = ?auto_883877 ?auto_883882 ) ) ( not ( = ?auto_883877 ?auto_883883 ) ) ( not ( = ?auto_883877 ?auto_883884 ) ) ( not ( = ?auto_883877 ?auto_883885 ) ) ( not ( = ?auto_883877 ?auto_883886 ) ) ( not ( = ?auto_883874 ?auto_883878 ) ) ( not ( = ?auto_883874 ?auto_883880 ) ) ( not ( = ?auto_883874 ?auto_883879 ) ) ( not ( = ?auto_883874 ?auto_883881 ) ) ( not ( = ?auto_883874 ?auto_883882 ) ) ( not ( = ?auto_883874 ?auto_883883 ) ) ( not ( = ?auto_883874 ?auto_883884 ) ) ( not ( = ?auto_883874 ?auto_883885 ) ) ( not ( = ?auto_883874 ?auto_883886 ) ) ( not ( = ?auto_883878 ?auto_883880 ) ) ( not ( = ?auto_883878 ?auto_883879 ) ) ( not ( = ?auto_883878 ?auto_883881 ) ) ( not ( = ?auto_883878 ?auto_883882 ) ) ( not ( = ?auto_883878 ?auto_883883 ) ) ( not ( = ?auto_883878 ?auto_883884 ) ) ( not ( = ?auto_883878 ?auto_883885 ) ) ( not ( = ?auto_883878 ?auto_883886 ) ) ( not ( = ?auto_883880 ?auto_883879 ) ) ( not ( = ?auto_883880 ?auto_883881 ) ) ( not ( = ?auto_883880 ?auto_883882 ) ) ( not ( = ?auto_883880 ?auto_883883 ) ) ( not ( = ?auto_883880 ?auto_883884 ) ) ( not ( = ?auto_883880 ?auto_883885 ) ) ( not ( = ?auto_883880 ?auto_883886 ) ) ( not ( = ?auto_883879 ?auto_883881 ) ) ( not ( = ?auto_883879 ?auto_883882 ) ) ( not ( = ?auto_883879 ?auto_883883 ) ) ( not ( = ?auto_883879 ?auto_883884 ) ) ( not ( = ?auto_883879 ?auto_883885 ) ) ( not ( = ?auto_883879 ?auto_883886 ) ) ( not ( = ?auto_883881 ?auto_883882 ) ) ( not ( = ?auto_883881 ?auto_883883 ) ) ( not ( = ?auto_883881 ?auto_883884 ) ) ( not ( = ?auto_883881 ?auto_883885 ) ) ( not ( = ?auto_883881 ?auto_883886 ) ) ( not ( = ?auto_883882 ?auto_883883 ) ) ( not ( = ?auto_883882 ?auto_883884 ) ) ( not ( = ?auto_883882 ?auto_883885 ) ) ( not ( = ?auto_883882 ?auto_883886 ) ) ( not ( = ?auto_883883 ?auto_883884 ) ) ( not ( = ?auto_883883 ?auto_883885 ) ) ( not ( = ?auto_883883 ?auto_883886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883884 ?auto_883885 ?auto_883886 )
      ( MAKE-12CRATE-VERIFY ?auto_883875 ?auto_883876 ?auto_883877 ?auto_883874 ?auto_883878 ?auto_883880 ?auto_883879 ?auto_883881 ?auto_883882 ?auto_883883 ?auto_883884 ?auto_883885 ?auto_883886 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884013 - SURFACE
      ?auto_884014 - SURFACE
      ?auto_884015 - SURFACE
      ?auto_884012 - SURFACE
      ?auto_884016 - SURFACE
      ?auto_884018 - SURFACE
      ?auto_884017 - SURFACE
      ?auto_884019 - SURFACE
      ?auto_884020 - SURFACE
      ?auto_884021 - SURFACE
      ?auto_884022 - SURFACE
      ?auto_884023 - SURFACE
      ?auto_884024 - SURFACE
    )
    :vars
    (
      ?auto_884027 - HOIST
      ?auto_884028 - PLACE
      ?auto_884026 - TRUCK
      ?auto_884025 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_884027 ?auto_884028 ) ( SURFACE-AT ?auto_884023 ?auto_884028 ) ( CLEAR ?auto_884023 ) ( IS-CRATE ?auto_884024 ) ( not ( = ?auto_884023 ?auto_884024 ) ) ( AVAILABLE ?auto_884027 ) ( IN ?auto_884024 ?auto_884026 ) ( ON ?auto_884023 ?auto_884022 ) ( not ( = ?auto_884022 ?auto_884023 ) ) ( not ( = ?auto_884022 ?auto_884024 ) ) ( TRUCK-AT ?auto_884026 ?auto_884025 ) ( not ( = ?auto_884025 ?auto_884028 ) ) ( ON ?auto_884014 ?auto_884013 ) ( ON ?auto_884015 ?auto_884014 ) ( ON ?auto_884012 ?auto_884015 ) ( ON ?auto_884016 ?auto_884012 ) ( ON ?auto_884018 ?auto_884016 ) ( ON ?auto_884017 ?auto_884018 ) ( ON ?auto_884019 ?auto_884017 ) ( ON ?auto_884020 ?auto_884019 ) ( ON ?auto_884021 ?auto_884020 ) ( ON ?auto_884022 ?auto_884021 ) ( not ( = ?auto_884013 ?auto_884014 ) ) ( not ( = ?auto_884013 ?auto_884015 ) ) ( not ( = ?auto_884013 ?auto_884012 ) ) ( not ( = ?auto_884013 ?auto_884016 ) ) ( not ( = ?auto_884013 ?auto_884018 ) ) ( not ( = ?auto_884013 ?auto_884017 ) ) ( not ( = ?auto_884013 ?auto_884019 ) ) ( not ( = ?auto_884013 ?auto_884020 ) ) ( not ( = ?auto_884013 ?auto_884021 ) ) ( not ( = ?auto_884013 ?auto_884022 ) ) ( not ( = ?auto_884013 ?auto_884023 ) ) ( not ( = ?auto_884013 ?auto_884024 ) ) ( not ( = ?auto_884014 ?auto_884015 ) ) ( not ( = ?auto_884014 ?auto_884012 ) ) ( not ( = ?auto_884014 ?auto_884016 ) ) ( not ( = ?auto_884014 ?auto_884018 ) ) ( not ( = ?auto_884014 ?auto_884017 ) ) ( not ( = ?auto_884014 ?auto_884019 ) ) ( not ( = ?auto_884014 ?auto_884020 ) ) ( not ( = ?auto_884014 ?auto_884021 ) ) ( not ( = ?auto_884014 ?auto_884022 ) ) ( not ( = ?auto_884014 ?auto_884023 ) ) ( not ( = ?auto_884014 ?auto_884024 ) ) ( not ( = ?auto_884015 ?auto_884012 ) ) ( not ( = ?auto_884015 ?auto_884016 ) ) ( not ( = ?auto_884015 ?auto_884018 ) ) ( not ( = ?auto_884015 ?auto_884017 ) ) ( not ( = ?auto_884015 ?auto_884019 ) ) ( not ( = ?auto_884015 ?auto_884020 ) ) ( not ( = ?auto_884015 ?auto_884021 ) ) ( not ( = ?auto_884015 ?auto_884022 ) ) ( not ( = ?auto_884015 ?auto_884023 ) ) ( not ( = ?auto_884015 ?auto_884024 ) ) ( not ( = ?auto_884012 ?auto_884016 ) ) ( not ( = ?auto_884012 ?auto_884018 ) ) ( not ( = ?auto_884012 ?auto_884017 ) ) ( not ( = ?auto_884012 ?auto_884019 ) ) ( not ( = ?auto_884012 ?auto_884020 ) ) ( not ( = ?auto_884012 ?auto_884021 ) ) ( not ( = ?auto_884012 ?auto_884022 ) ) ( not ( = ?auto_884012 ?auto_884023 ) ) ( not ( = ?auto_884012 ?auto_884024 ) ) ( not ( = ?auto_884016 ?auto_884018 ) ) ( not ( = ?auto_884016 ?auto_884017 ) ) ( not ( = ?auto_884016 ?auto_884019 ) ) ( not ( = ?auto_884016 ?auto_884020 ) ) ( not ( = ?auto_884016 ?auto_884021 ) ) ( not ( = ?auto_884016 ?auto_884022 ) ) ( not ( = ?auto_884016 ?auto_884023 ) ) ( not ( = ?auto_884016 ?auto_884024 ) ) ( not ( = ?auto_884018 ?auto_884017 ) ) ( not ( = ?auto_884018 ?auto_884019 ) ) ( not ( = ?auto_884018 ?auto_884020 ) ) ( not ( = ?auto_884018 ?auto_884021 ) ) ( not ( = ?auto_884018 ?auto_884022 ) ) ( not ( = ?auto_884018 ?auto_884023 ) ) ( not ( = ?auto_884018 ?auto_884024 ) ) ( not ( = ?auto_884017 ?auto_884019 ) ) ( not ( = ?auto_884017 ?auto_884020 ) ) ( not ( = ?auto_884017 ?auto_884021 ) ) ( not ( = ?auto_884017 ?auto_884022 ) ) ( not ( = ?auto_884017 ?auto_884023 ) ) ( not ( = ?auto_884017 ?auto_884024 ) ) ( not ( = ?auto_884019 ?auto_884020 ) ) ( not ( = ?auto_884019 ?auto_884021 ) ) ( not ( = ?auto_884019 ?auto_884022 ) ) ( not ( = ?auto_884019 ?auto_884023 ) ) ( not ( = ?auto_884019 ?auto_884024 ) ) ( not ( = ?auto_884020 ?auto_884021 ) ) ( not ( = ?auto_884020 ?auto_884022 ) ) ( not ( = ?auto_884020 ?auto_884023 ) ) ( not ( = ?auto_884020 ?auto_884024 ) ) ( not ( = ?auto_884021 ?auto_884022 ) ) ( not ( = ?auto_884021 ?auto_884023 ) ) ( not ( = ?auto_884021 ?auto_884024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884022 ?auto_884023 ?auto_884024 )
      ( MAKE-12CRATE-VERIFY ?auto_884013 ?auto_884014 ?auto_884015 ?auto_884012 ?auto_884016 ?auto_884018 ?auto_884017 ?auto_884019 ?auto_884020 ?auto_884021 ?auto_884022 ?auto_884023 ?auto_884024 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884163 - SURFACE
      ?auto_884164 - SURFACE
      ?auto_884165 - SURFACE
      ?auto_884162 - SURFACE
      ?auto_884166 - SURFACE
      ?auto_884168 - SURFACE
      ?auto_884167 - SURFACE
      ?auto_884169 - SURFACE
      ?auto_884170 - SURFACE
      ?auto_884171 - SURFACE
      ?auto_884172 - SURFACE
      ?auto_884173 - SURFACE
      ?auto_884174 - SURFACE
    )
    :vars
    (
      ?auto_884175 - HOIST
      ?auto_884176 - PLACE
      ?auto_884177 - TRUCK
      ?auto_884179 - PLACE
      ?auto_884178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_884175 ?auto_884176 ) ( SURFACE-AT ?auto_884173 ?auto_884176 ) ( CLEAR ?auto_884173 ) ( IS-CRATE ?auto_884174 ) ( not ( = ?auto_884173 ?auto_884174 ) ) ( AVAILABLE ?auto_884175 ) ( ON ?auto_884173 ?auto_884172 ) ( not ( = ?auto_884172 ?auto_884173 ) ) ( not ( = ?auto_884172 ?auto_884174 ) ) ( TRUCK-AT ?auto_884177 ?auto_884179 ) ( not ( = ?auto_884179 ?auto_884176 ) ) ( HOIST-AT ?auto_884178 ?auto_884179 ) ( LIFTING ?auto_884178 ?auto_884174 ) ( not ( = ?auto_884175 ?auto_884178 ) ) ( ON ?auto_884164 ?auto_884163 ) ( ON ?auto_884165 ?auto_884164 ) ( ON ?auto_884162 ?auto_884165 ) ( ON ?auto_884166 ?auto_884162 ) ( ON ?auto_884168 ?auto_884166 ) ( ON ?auto_884167 ?auto_884168 ) ( ON ?auto_884169 ?auto_884167 ) ( ON ?auto_884170 ?auto_884169 ) ( ON ?auto_884171 ?auto_884170 ) ( ON ?auto_884172 ?auto_884171 ) ( not ( = ?auto_884163 ?auto_884164 ) ) ( not ( = ?auto_884163 ?auto_884165 ) ) ( not ( = ?auto_884163 ?auto_884162 ) ) ( not ( = ?auto_884163 ?auto_884166 ) ) ( not ( = ?auto_884163 ?auto_884168 ) ) ( not ( = ?auto_884163 ?auto_884167 ) ) ( not ( = ?auto_884163 ?auto_884169 ) ) ( not ( = ?auto_884163 ?auto_884170 ) ) ( not ( = ?auto_884163 ?auto_884171 ) ) ( not ( = ?auto_884163 ?auto_884172 ) ) ( not ( = ?auto_884163 ?auto_884173 ) ) ( not ( = ?auto_884163 ?auto_884174 ) ) ( not ( = ?auto_884164 ?auto_884165 ) ) ( not ( = ?auto_884164 ?auto_884162 ) ) ( not ( = ?auto_884164 ?auto_884166 ) ) ( not ( = ?auto_884164 ?auto_884168 ) ) ( not ( = ?auto_884164 ?auto_884167 ) ) ( not ( = ?auto_884164 ?auto_884169 ) ) ( not ( = ?auto_884164 ?auto_884170 ) ) ( not ( = ?auto_884164 ?auto_884171 ) ) ( not ( = ?auto_884164 ?auto_884172 ) ) ( not ( = ?auto_884164 ?auto_884173 ) ) ( not ( = ?auto_884164 ?auto_884174 ) ) ( not ( = ?auto_884165 ?auto_884162 ) ) ( not ( = ?auto_884165 ?auto_884166 ) ) ( not ( = ?auto_884165 ?auto_884168 ) ) ( not ( = ?auto_884165 ?auto_884167 ) ) ( not ( = ?auto_884165 ?auto_884169 ) ) ( not ( = ?auto_884165 ?auto_884170 ) ) ( not ( = ?auto_884165 ?auto_884171 ) ) ( not ( = ?auto_884165 ?auto_884172 ) ) ( not ( = ?auto_884165 ?auto_884173 ) ) ( not ( = ?auto_884165 ?auto_884174 ) ) ( not ( = ?auto_884162 ?auto_884166 ) ) ( not ( = ?auto_884162 ?auto_884168 ) ) ( not ( = ?auto_884162 ?auto_884167 ) ) ( not ( = ?auto_884162 ?auto_884169 ) ) ( not ( = ?auto_884162 ?auto_884170 ) ) ( not ( = ?auto_884162 ?auto_884171 ) ) ( not ( = ?auto_884162 ?auto_884172 ) ) ( not ( = ?auto_884162 ?auto_884173 ) ) ( not ( = ?auto_884162 ?auto_884174 ) ) ( not ( = ?auto_884166 ?auto_884168 ) ) ( not ( = ?auto_884166 ?auto_884167 ) ) ( not ( = ?auto_884166 ?auto_884169 ) ) ( not ( = ?auto_884166 ?auto_884170 ) ) ( not ( = ?auto_884166 ?auto_884171 ) ) ( not ( = ?auto_884166 ?auto_884172 ) ) ( not ( = ?auto_884166 ?auto_884173 ) ) ( not ( = ?auto_884166 ?auto_884174 ) ) ( not ( = ?auto_884168 ?auto_884167 ) ) ( not ( = ?auto_884168 ?auto_884169 ) ) ( not ( = ?auto_884168 ?auto_884170 ) ) ( not ( = ?auto_884168 ?auto_884171 ) ) ( not ( = ?auto_884168 ?auto_884172 ) ) ( not ( = ?auto_884168 ?auto_884173 ) ) ( not ( = ?auto_884168 ?auto_884174 ) ) ( not ( = ?auto_884167 ?auto_884169 ) ) ( not ( = ?auto_884167 ?auto_884170 ) ) ( not ( = ?auto_884167 ?auto_884171 ) ) ( not ( = ?auto_884167 ?auto_884172 ) ) ( not ( = ?auto_884167 ?auto_884173 ) ) ( not ( = ?auto_884167 ?auto_884174 ) ) ( not ( = ?auto_884169 ?auto_884170 ) ) ( not ( = ?auto_884169 ?auto_884171 ) ) ( not ( = ?auto_884169 ?auto_884172 ) ) ( not ( = ?auto_884169 ?auto_884173 ) ) ( not ( = ?auto_884169 ?auto_884174 ) ) ( not ( = ?auto_884170 ?auto_884171 ) ) ( not ( = ?auto_884170 ?auto_884172 ) ) ( not ( = ?auto_884170 ?auto_884173 ) ) ( not ( = ?auto_884170 ?auto_884174 ) ) ( not ( = ?auto_884171 ?auto_884172 ) ) ( not ( = ?auto_884171 ?auto_884173 ) ) ( not ( = ?auto_884171 ?auto_884174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884172 ?auto_884173 ?auto_884174 )
      ( MAKE-12CRATE-VERIFY ?auto_884163 ?auto_884164 ?auto_884165 ?auto_884162 ?auto_884166 ?auto_884168 ?auto_884167 ?auto_884169 ?auto_884170 ?auto_884171 ?auto_884172 ?auto_884173 ?auto_884174 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884325 - SURFACE
      ?auto_884326 - SURFACE
      ?auto_884327 - SURFACE
      ?auto_884324 - SURFACE
      ?auto_884328 - SURFACE
      ?auto_884330 - SURFACE
      ?auto_884329 - SURFACE
      ?auto_884331 - SURFACE
      ?auto_884332 - SURFACE
      ?auto_884333 - SURFACE
      ?auto_884334 - SURFACE
      ?auto_884335 - SURFACE
      ?auto_884336 - SURFACE
    )
    :vars
    (
      ?auto_884337 - HOIST
      ?auto_884340 - PLACE
      ?auto_884339 - TRUCK
      ?auto_884342 - PLACE
      ?auto_884341 - HOIST
      ?auto_884338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_884337 ?auto_884340 ) ( SURFACE-AT ?auto_884335 ?auto_884340 ) ( CLEAR ?auto_884335 ) ( IS-CRATE ?auto_884336 ) ( not ( = ?auto_884335 ?auto_884336 ) ) ( AVAILABLE ?auto_884337 ) ( ON ?auto_884335 ?auto_884334 ) ( not ( = ?auto_884334 ?auto_884335 ) ) ( not ( = ?auto_884334 ?auto_884336 ) ) ( TRUCK-AT ?auto_884339 ?auto_884342 ) ( not ( = ?auto_884342 ?auto_884340 ) ) ( HOIST-AT ?auto_884341 ?auto_884342 ) ( not ( = ?auto_884337 ?auto_884341 ) ) ( AVAILABLE ?auto_884341 ) ( SURFACE-AT ?auto_884336 ?auto_884342 ) ( ON ?auto_884336 ?auto_884338 ) ( CLEAR ?auto_884336 ) ( not ( = ?auto_884335 ?auto_884338 ) ) ( not ( = ?auto_884336 ?auto_884338 ) ) ( not ( = ?auto_884334 ?auto_884338 ) ) ( ON ?auto_884326 ?auto_884325 ) ( ON ?auto_884327 ?auto_884326 ) ( ON ?auto_884324 ?auto_884327 ) ( ON ?auto_884328 ?auto_884324 ) ( ON ?auto_884330 ?auto_884328 ) ( ON ?auto_884329 ?auto_884330 ) ( ON ?auto_884331 ?auto_884329 ) ( ON ?auto_884332 ?auto_884331 ) ( ON ?auto_884333 ?auto_884332 ) ( ON ?auto_884334 ?auto_884333 ) ( not ( = ?auto_884325 ?auto_884326 ) ) ( not ( = ?auto_884325 ?auto_884327 ) ) ( not ( = ?auto_884325 ?auto_884324 ) ) ( not ( = ?auto_884325 ?auto_884328 ) ) ( not ( = ?auto_884325 ?auto_884330 ) ) ( not ( = ?auto_884325 ?auto_884329 ) ) ( not ( = ?auto_884325 ?auto_884331 ) ) ( not ( = ?auto_884325 ?auto_884332 ) ) ( not ( = ?auto_884325 ?auto_884333 ) ) ( not ( = ?auto_884325 ?auto_884334 ) ) ( not ( = ?auto_884325 ?auto_884335 ) ) ( not ( = ?auto_884325 ?auto_884336 ) ) ( not ( = ?auto_884325 ?auto_884338 ) ) ( not ( = ?auto_884326 ?auto_884327 ) ) ( not ( = ?auto_884326 ?auto_884324 ) ) ( not ( = ?auto_884326 ?auto_884328 ) ) ( not ( = ?auto_884326 ?auto_884330 ) ) ( not ( = ?auto_884326 ?auto_884329 ) ) ( not ( = ?auto_884326 ?auto_884331 ) ) ( not ( = ?auto_884326 ?auto_884332 ) ) ( not ( = ?auto_884326 ?auto_884333 ) ) ( not ( = ?auto_884326 ?auto_884334 ) ) ( not ( = ?auto_884326 ?auto_884335 ) ) ( not ( = ?auto_884326 ?auto_884336 ) ) ( not ( = ?auto_884326 ?auto_884338 ) ) ( not ( = ?auto_884327 ?auto_884324 ) ) ( not ( = ?auto_884327 ?auto_884328 ) ) ( not ( = ?auto_884327 ?auto_884330 ) ) ( not ( = ?auto_884327 ?auto_884329 ) ) ( not ( = ?auto_884327 ?auto_884331 ) ) ( not ( = ?auto_884327 ?auto_884332 ) ) ( not ( = ?auto_884327 ?auto_884333 ) ) ( not ( = ?auto_884327 ?auto_884334 ) ) ( not ( = ?auto_884327 ?auto_884335 ) ) ( not ( = ?auto_884327 ?auto_884336 ) ) ( not ( = ?auto_884327 ?auto_884338 ) ) ( not ( = ?auto_884324 ?auto_884328 ) ) ( not ( = ?auto_884324 ?auto_884330 ) ) ( not ( = ?auto_884324 ?auto_884329 ) ) ( not ( = ?auto_884324 ?auto_884331 ) ) ( not ( = ?auto_884324 ?auto_884332 ) ) ( not ( = ?auto_884324 ?auto_884333 ) ) ( not ( = ?auto_884324 ?auto_884334 ) ) ( not ( = ?auto_884324 ?auto_884335 ) ) ( not ( = ?auto_884324 ?auto_884336 ) ) ( not ( = ?auto_884324 ?auto_884338 ) ) ( not ( = ?auto_884328 ?auto_884330 ) ) ( not ( = ?auto_884328 ?auto_884329 ) ) ( not ( = ?auto_884328 ?auto_884331 ) ) ( not ( = ?auto_884328 ?auto_884332 ) ) ( not ( = ?auto_884328 ?auto_884333 ) ) ( not ( = ?auto_884328 ?auto_884334 ) ) ( not ( = ?auto_884328 ?auto_884335 ) ) ( not ( = ?auto_884328 ?auto_884336 ) ) ( not ( = ?auto_884328 ?auto_884338 ) ) ( not ( = ?auto_884330 ?auto_884329 ) ) ( not ( = ?auto_884330 ?auto_884331 ) ) ( not ( = ?auto_884330 ?auto_884332 ) ) ( not ( = ?auto_884330 ?auto_884333 ) ) ( not ( = ?auto_884330 ?auto_884334 ) ) ( not ( = ?auto_884330 ?auto_884335 ) ) ( not ( = ?auto_884330 ?auto_884336 ) ) ( not ( = ?auto_884330 ?auto_884338 ) ) ( not ( = ?auto_884329 ?auto_884331 ) ) ( not ( = ?auto_884329 ?auto_884332 ) ) ( not ( = ?auto_884329 ?auto_884333 ) ) ( not ( = ?auto_884329 ?auto_884334 ) ) ( not ( = ?auto_884329 ?auto_884335 ) ) ( not ( = ?auto_884329 ?auto_884336 ) ) ( not ( = ?auto_884329 ?auto_884338 ) ) ( not ( = ?auto_884331 ?auto_884332 ) ) ( not ( = ?auto_884331 ?auto_884333 ) ) ( not ( = ?auto_884331 ?auto_884334 ) ) ( not ( = ?auto_884331 ?auto_884335 ) ) ( not ( = ?auto_884331 ?auto_884336 ) ) ( not ( = ?auto_884331 ?auto_884338 ) ) ( not ( = ?auto_884332 ?auto_884333 ) ) ( not ( = ?auto_884332 ?auto_884334 ) ) ( not ( = ?auto_884332 ?auto_884335 ) ) ( not ( = ?auto_884332 ?auto_884336 ) ) ( not ( = ?auto_884332 ?auto_884338 ) ) ( not ( = ?auto_884333 ?auto_884334 ) ) ( not ( = ?auto_884333 ?auto_884335 ) ) ( not ( = ?auto_884333 ?auto_884336 ) ) ( not ( = ?auto_884333 ?auto_884338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884334 ?auto_884335 ?auto_884336 )
      ( MAKE-12CRATE-VERIFY ?auto_884325 ?auto_884326 ?auto_884327 ?auto_884324 ?auto_884328 ?auto_884330 ?auto_884329 ?auto_884331 ?auto_884332 ?auto_884333 ?auto_884334 ?auto_884335 ?auto_884336 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884488 - SURFACE
      ?auto_884489 - SURFACE
      ?auto_884490 - SURFACE
      ?auto_884487 - SURFACE
      ?auto_884491 - SURFACE
      ?auto_884493 - SURFACE
      ?auto_884492 - SURFACE
      ?auto_884494 - SURFACE
      ?auto_884495 - SURFACE
      ?auto_884496 - SURFACE
      ?auto_884497 - SURFACE
      ?auto_884498 - SURFACE
      ?auto_884499 - SURFACE
    )
    :vars
    (
      ?auto_884501 - HOIST
      ?auto_884505 - PLACE
      ?auto_884502 - PLACE
      ?auto_884503 - HOIST
      ?auto_884500 - SURFACE
      ?auto_884504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884501 ?auto_884505 ) ( SURFACE-AT ?auto_884498 ?auto_884505 ) ( CLEAR ?auto_884498 ) ( IS-CRATE ?auto_884499 ) ( not ( = ?auto_884498 ?auto_884499 ) ) ( AVAILABLE ?auto_884501 ) ( ON ?auto_884498 ?auto_884497 ) ( not ( = ?auto_884497 ?auto_884498 ) ) ( not ( = ?auto_884497 ?auto_884499 ) ) ( not ( = ?auto_884502 ?auto_884505 ) ) ( HOIST-AT ?auto_884503 ?auto_884502 ) ( not ( = ?auto_884501 ?auto_884503 ) ) ( AVAILABLE ?auto_884503 ) ( SURFACE-AT ?auto_884499 ?auto_884502 ) ( ON ?auto_884499 ?auto_884500 ) ( CLEAR ?auto_884499 ) ( not ( = ?auto_884498 ?auto_884500 ) ) ( not ( = ?auto_884499 ?auto_884500 ) ) ( not ( = ?auto_884497 ?auto_884500 ) ) ( TRUCK-AT ?auto_884504 ?auto_884505 ) ( ON ?auto_884489 ?auto_884488 ) ( ON ?auto_884490 ?auto_884489 ) ( ON ?auto_884487 ?auto_884490 ) ( ON ?auto_884491 ?auto_884487 ) ( ON ?auto_884493 ?auto_884491 ) ( ON ?auto_884492 ?auto_884493 ) ( ON ?auto_884494 ?auto_884492 ) ( ON ?auto_884495 ?auto_884494 ) ( ON ?auto_884496 ?auto_884495 ) ( ON ?auto_884497 ?auto_884496 ) ( not ( = ?auto_884488 ?auto_884489 ) ) ( not ( = ?auto_884488 ?auto_884490 ) ) ( not ( = ?auto_884488 ?auto_884487 ) ) ( not ( = ?auto_884488 ?auto_884491 ) ) ( not ( = ?auto_884488 ?auto_884493 ) ) ( not ( = ?auto_884488 ?auto_884492 ) ) ( not ( = ?auto_884488 ?auto_884494 ) ) ( not ( = ?auto_884488 ?auto_884495 ) ) ( not ( = ?auto_884488 ?auto_884496 ) ) ( not ( = ?auto_884488 ?auto_884497 ) ) ( not ( = ?auto_884488 ?auto_884498 ) ) ( not ( = ?auto_884488 ?auto_884499 ) ) ( not ( = ?auto_884488 ?auto_884500 ) ) ( not ( = ?auto_884489 ?auto_884490 ) ) ( not ( = ?auto_884489 ?auto_884487 ) ) ( not ( = ?auto_884489 ?auto_884491 ) ) ( not ( = ?auto_884489 ?auto_884493 ) ) ( not ( = ?auto_884489 ?auto_884492 ) ) ( not ( = ?auto_884489 ?auto_884494 ) ) ( not ( = ?auto_884489 ?auto_884495 ) ) ( not ( = ?auto_884489 ?auto_884496 ) ) ( not ( = ?auto_884489 ?auto_884497 ) ) ( not ( = ?auto_884489 ?auto_884498 ) ) ( not ( = ?auto_884489 ?auto_884499 ) ) ( not ( = ?auto_884489 ?auto_884500 ) ) ( not ( = ?auto_884490 ?auto_884487 ) ) ( not ( = ?auto_884490 ?auto_884491 ) ) ( not ( = ?auto_884490 ?auto_884493 ) ) ( not ( = ?auto_884490 ?auto_884492 ) ) ( not ( = ?auto_884490 ?auto_884494 ) ) ( not ( = ?auto_884490 ?auto_884495 ) ) ( not ( = ?auto_884490 ?auto_884496 ) ) ( not ( = ?auto_884490 ?auto_884497 ) ) ( not ( = ?auto_884490 ?auto_884498 ) ) ( not ( = ?auto_884490 ?auto_884499 ) ) ( not ( = ?auto_884490 ?auto_884500 ) ) ( not ( = ?auto_884487 ?auto_884491 ) ) ( not ( = ?auto_884487 ?auto_884493 ) ) ( not ( = ?auto_884487 ?auto_884492 ) ) ( not ( = ?auto_884487 ?auto_884494 ) ) ( not ( = ?auto_884487 ?auto_884495 ) ) ( not ( = ?auto_884487 ?auto_884496 ) ) ( not ( = ?auto_884487 ?auto_884497 ) ) ( not ( = ?auto_884487 ?auto_884498 ) ) ( not ( = ?auto_884487 ?auto_884499 ) ) ( not ( = ?auto_884487 ?auto_884500 ) ) ( not ( = ?auto_884491 ?auto_884493 ) ) ( not ( = ?auto_884491 ?auto_884492 ) ) ( not ( = ?auto_884491 ?auto_884494 ) ) ( not ( = ?auto_884491 ?auto_884495 ) ) ( not ( = ?auto_884491 ?auto_884496 ) ) ( not ( = ?auto_884491 ?auto_884497 ) ) ( not ( = ?auto_884491 ?auto_884498 ) ) ( not ( = ?auto_884491 ?auto_884499 ) ) ( not ( = ?auto_884491 ?auto_884500 ) ) ( not ( = ?auto_884493 ?auto_884492 ) ) ( not ( = ?auto_884493 ?auto_884494 ) ) ( not ( = ?auto_884493 ?auto_884495 ) ) ( not ( = ?auto_884493 ?auto_884496 ) ) ( not ( = ?auto_884493 ?auto_884497 ) ) ( not ( = ?auto_884493 ?auto_884498 ) ) ( not ( = ?auto_884493 ?auto_884499 ) ) ( not ( = ?auto_884493 ?auto_884500 ) ) ( not ( = ?auto_884492 ?auto_884494 ) ) ( not ( = ?auto_884492 ?auto_884495 ) ) ( not ( = ?auto_884492 ?auto_884496 ) ) ( not ( = ?auto_884492 ?auto_884497 ) ) ( not ( = ?auto_884492 ?auto_884498 ) ) ( not ( = ?auto_884492 ?auto_884499 ) ) ( not ( = ?auto_884492 ?auto_884500 ) ) ( not ( = ?auto_884494 ?auto_884495 ) ) ( not ( = ?auto_884494 ?auto_884496 ) ) ( not ( = ?auto_884494 ?auto_884497 ) ) ( not ( = ?auto_884494 ?auto_884498 ) ) ( not ( = ?auto_884494 ?auto_884499 ) ) ( not ( = ?auto_884494 ?auto_884500 ) ) ( not ( = ?auto_884495 ?auto_884496 ) ) ( not ( = ?auto_884495 ?auto_884497 ) ) ( not ( = ?auto_884495 ?auto_884498 ) ) ( not ( = ?auto_884495 ?auto_884499 ) ) ( not ( = ?auto_884495 ?auto_884500 ) ) ( not ( = ?auto_884496 ?auto_884497 ) ) ( not ( = ?auto_884496 ?auto_884498 ) ) ( not ( = ?auto_884496 ?auto_884499 ) ) ( not ( = ?auto_884496 ?auto_884500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884497 ?auto_884498 ?auto_884499 )
      ( MAKE-12CRATE-VERIFY ?auto_884488 ?auto_884489 ?auto_884490 ?auto_884487 ?auto_884491 ?auto_884493 ?auto_884492 ?auto_884494 ?auto_884495 ?auto_884496 ?auto_884497 ?auto_884498 ?auto_884499 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884651 - SURFACE
      ?auto_884652 - SURFACE
      ?auto_884653 - SURFACE
      ?auto_884650 - SURFACE
      ?auto_884654 - SURFACE
      ?auto_884656 - SURFACE
      ?auto_884655 - SURFACE
      ?auto_884657 - SURFACE
      ?auto_884658 - SURFACE
      ?auto_884659 - SURFACE
      ?auto_884660 - SURFACE
      ?auto_884661 - SURFACE
      ?auto_884662 - SURFACE
    )
    :vars
    (
      ?auto_884667 - HOIST
      ?auto_884666 - PLACE
      ?auto_884665 - PLACE
      ?auto_884664 - HOIST
      ?auto_884668 - SURFACE
      ?auto_884663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884667 ?auto_884666 ) ( IS-CRATE ?auto_884662 ) ( not ( = ?auto_884661 ?auto_884662 ) ) ( not ( = ?auto_884660 ?auto_884661 ) ) ( not ( = ?auto_884660 ?auto_884662 ) ) ( not ( = ?auto_884665 ?auto_884666 ) ) ( HOIST-AT ?auto_884664 ?auto_884665 ) ( not ( = ?auto_884667 ?auto_884664 ) ) ( AVAILABLE ?auto_884664 ) ( SURFACE-AT ?auto_884662 ?auto_884665 ) ( ON ?auto_884662 ?auto_884668 ) ( CLEAR ?auto_884662 ) ( not ( = ?auto_884661 ?auto_884668 ) ) ( not ( = ?auto_884662 ?auto_884668 ) ) ( not ( = ?auto_884660 ?auto_884668 ) ) ( TRUCK-AT ?auto_884663 ?auto_884666 ) ( SURFACE-AT ?auto_884660 ?auto_884666 ) ( CLEAR ?auto_884660 ) ( LIFTING ?auto_884667 ?auto_884661 ) ( IS-CRATE ?auto_884661 ) ( ON ?auto_884652 ?auto_884651 ) ( ON ?auto_884653 ?auto_884652 ) ( ON ?auto_884650 ?auto_884653 ) ( ON ?auto_884654 ?auto_884650 ) ( ON ?auto_884656 ?auto_884654 ) ( ON ?auto_884655 ?auto_884656 ) ( ON ?auto_884657 ?auto_884655 ) ( ON ?auto_884658 ?auto_884657 ) ( ON ?auto_884659 ?auto_884658 ) ( ON ?auto_884660 ?auto_884659 ) ( not ( = ?auto_884651 ?auto_884652 ) ) ( not ( = ?auto_884651 ?auto_884653 ) ) ( not ( = ?auto_884651 ?auto_884650 ) ) ( not ( = ?auto_884651 ?auto_884654 ) ) ( not ( = ?auto_884651 ?auto_884656 ) ) ( not ( = ?auto_884651 ?auto_884655 ) ) ( not ( = ?auto_884651 ?auto_884657 ) ) ( not ( = ?auto_884651 ?auto_884658 ) ) ( not ( = ?auto_884651 ?auto_884659 ) ) ( not ( = ?auto_884651 ?auto_884660 ) ) ( not ( = ?auto_884651 ?auto_884661 ) ) ( not ( = ?auto_884651 ?auto_884662 ) ) ( not ( = ?auto_884651 ?auto_884668 ) ) ( not ( = ?auto_884652 ?auto_884653 ) ) ( not ( = ?auto_884652 ?auto_884650 ) ) ( not ( = ?auto_884652 ?auto_884654 ) ) ( not ( = ?auto_884652 ?auto_884656 ) ) ( not ( = ?auto_884652 ?auto_884655 ) ) ( not ( = ?auto_884652 ?auto_884657 ) ) ( not ( = ?auto_884652 ?auto_884658 ) ) ( not ( = ?auto_884652 ?auto_884659 ) ) ( not ( = ?auto_884652 ?auto_884660 ) ) ( not ( = ?auto_884652 ?auto_884661 ) ) ( not ( = ?auto_884652 ?auto_884662 ) ) ( not ( = ?auto_884652 ?auto_884668 ) ) ( not ( = ?auto_884653 ?auto_884650 ) ) ( not ( = ?auto_884653 ?auto_884654 ) ) ( not ( = ?auto_884653 ?auto_884656 ) ) ( not ( = ?auto_884653 ?auto_884655 ) ) ( not ( = ?auto_884653 ?auto_884657 ) ) ( not ( = ?auto_884653 ?auto_884658 ) ) ( not ( = ?auto_884653 ?auto_884659 ) ) ( not ( = ?auto_884653 ?auto_884660 ) ) ( not ( = ?auto_884653 ?auto_884661 ) ) ( not ( = ?auto_884653 ?auto_884662 ) ) ( not ( = ?auto_884653 ?auto_884668 ) ) ( not ( = ?auto_884650 ?auto_884654 ) ) ( not ( = ?auto_884650 ?auto_884656 ) ) ( not ( = ?auto_884650 ?auto_884655 ) ) ( not ( = ?auto_884650 ?auto_884657 ) ) ( not ( = ?auto_884650 ?auto_884658 ) ) ( not ( = ?auto_884650 ?auto_884659 ) ) ( not ( = ?auto_884650 ?auto_884660 ) ) ( not ( = ?auto_884650 ?auto_884661 ) ) ( not ( = ?auto_884650 ?auto_884662 ) ) ( not ( = ?auto_884650 ?auto_884668 ) ) ( not ( = ?auto_884654 ?auto_884656 ) ) ( not ( = ?auto_884654 ?auto_884655 ) ) ( not ( = ?auto_884654 ?auto_884657 ) ) ( not ( = ?auto_884654 ?auto_884658 ) ) ( not ( = ?auto_884654 ?auto_884659 ) ) ( not ( = ?auto_884654 ?auto_884660 ) ) ( not ( = ?auto_884654 ?auto_884661 ) ) ( not ( = ?auto_884654 ?auto_884662 ) ) ( not ( = ?auto_884654 ?auto_884668 ) ) ( not ( = ?auto_884656 ?auto_884655 ) ) ( not ( = ?auto_884656 ?auto_884657 ) ) ( not ( = ?auto_884656 ?auto_884658 ) ) ( not ( = ?auto_884656 ?auto_884659 ) ) ( not ( = ?auto_884656 ?auto_884660 ) ) ( not ( = ?auto_884656 ?auto_884661 ) ) ( not ( = ?auto_884656 ?auto_884662 ) ) ( not ( = ?auto_884656 ?auto_884668 ) ) ( not ( = ?auto_884655 ?auto_884657 ) ) ( not ( = ?auto_884655 ?auto_884658 ) ) ( not ( = ?auto_884655 ?auto_884659 ) ) ( not ( = ?auto_884655 ?auto_884660 ) ) ( not ( = ?auto_884655 ?auto_884661 ) ) ( not ( = ?auto_884655 ?auto_884662 ) ) ( not ( = ?auto_884655 ?auto_884668 ) ) ( not ( = ?auto_884657 ?auto_884658 ) ) ( not ( = ?auto_884657 ?auto_884659 ) ) ( not ( = ?auto_884657 ?auto_884660 ) ) ( not ( = ?auto_884657 ?auto_884661 ) ) ( not ( = ?auto_884657 ?auto_884662 ) ) ( not ( = ?auto_884657 ?auto_884668 ) ) ( not ( = ?auto_884658 ?auto_884659 ) ) ( not ( = ?auto_884658 ?auto_884660 ) ) ( not ( = ?auto_884658 ?auto_884661 ) ) ( not ( = ?auto_884658 ?auto_884662 ) ) ( not ( = ?auto_884658 ?auto_884668 ) ) ( not ( = ?auto_884659 ?auto_884660 ) ) ( not ( = ?auto_884659 ?auto_884661 ) ) ( not ( = ?auto_884659 ?auto_884662 ) ) ( not ( = ?auto_884659 ?auto_884668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884660 ?auto_884661 ?auto_884662 )
      ( MAKE-12CRATE-VERIFY ?auto_884651 ?auto_884652 ?auto_884653 ?auto_884650 ?auto_884654 ?auto_884656 ?auto_884655 ?auto_884657 ?auto_884658 ?auto_884659 ?auto_884660 ?auto_884661 ?auto_884662 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884814 - SURFACE
      ?auto_884815 - SURFACE
      ?auto_884816 - SURFACE
      ?auto_884813 - SURFACE
      ?auto_884817 - SURFACE
      ?auto_884819 - SURFACE
      ?auto_884818 - SURFACE
      ?auto_884820 - SURFACE
      ?auto_884821 - SURFACE
      ?auto_884822 - SURFACE
      ?auto_884823 - SURFACE
      ?auto_884824 - SURFACE
      ?auto_884825 - SURFACE
    )
    :vars
    (
      ?auto_884826 - HOIST
      ?auto_884828 - PLACE
      ?auto_884831 - PLACE
      ?auto_884827 - HOIST
      ?auto_884829 - SURFACE
      ?auto_884830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884826 ?auto_884828 ) ( IS-CRATE ?auto_884825 ) ( not ( = ?auto_884824 ?auto_884825 ) ) ( not ( = ?auto_884823 ?auto_884824 ) ) ( not ( = ?auto_884823 ?auto_884825 ) ) ( not ( = ?auto_884831 ?auto_884828 ) ) ( HOIST-AT ?auto_884827 ?auto_884831 ) ( not ( = ?auto_884826 ?auto_884827 ) ) ( AVAILABLE ?auto_884827 ) ( SURFACE-AT ?auto_884825 ?auto_884831 ) ( ON ?auto_884825 ?auto_884829 ) ( CLEAR ?auto_884825 ) ( not ( = ?auto_884824 ?auto_884829 ) ) ( not ( = ?auto_884825 ?auto_884829 ) ) ( not ( = ?auto_884823 ?auto_884829 ) ) ( TRUCK-AT ?auto_884830 ?auto_884828 ) ( SURFACE-AT ?auto_884823 ?auto_884828 ) ( CLEAR ?auto_884823 ) ( IS-CRATE ?auto_884824 ) ( AVAILABLE ?auto_884826 ) ( IN ?auto_884824 ?auto_884830 ) ( ON ?auto_884815 ?auto_884814 ) ( ON ?auto_884816 ?auto_884815 ) ( ON ?auto_884813 ?auto_884816 ) ( ON ?auto_884817 ?auto_884813 ) ( ON ?auto_884819 ?auto_884817 ) ( ON ?auto_884818 ?auto_884819 ) ( ON ?auto_884820 ?auto_884818 ) ( ON ?auto_884821 ?auto_884820 ) ( ON ?auto_884822 ?auto_884821 ) ( ON ?auto_884823 ?auto_884822 ) ( not ( = ?auto_884814 ?auto_884815 ) ) ( not ( = ?auto_884814 ?auto_884816 ) ) ( not ( = ?auto_884814 ?auto_884813 ) ) ( not ( = ?auto_884814 ?auto_884817 ) ) ( not ( = ?auto_884814 ?auto_884819 ) ) ( not ( = ?auto_884814 ?auto_884818 ) ) ( not ( = ?auto_884814 ?auto_884820 ) ) ( not ( = ?auto_884814 ?auto_884821 ) ) ( not ( = ?auto_884814 ?auto_884822 ) ) ( not ( = ?auto_884814 ?auto_884823 ) ) ( not ( = ?auto_884814 ?auto_884824 ) ) ( not ( = ?auto_884814 ?auto_884825 ) ) ( not ( = ?auto_884814 ?auto_884829 ) ) ( not ( = ?auto_884815 ?auto_884816 ) ) ( not ( = ?auto_884815 ?auto_884813 ) ) ( not ( = ?auto_884815 ?auto_884817 ) ) ( not ( = ?auto_884815 ?auto_884819 ) ) ( not ( = ?auto_884815 ?auto_884818 ) ) ( not ( = ?auto_884815 ?auto_884820 ) ) ( not ( = ?auto_884815 ?auto_884821 ) ) ( not ( = ?auto_884815 ?auto_884822 ) ) ( not ( = ?auto_884815 ?auto_884823 ) ) ( not ( = ?auto_884815 ?auto_884824 ) ) ( not ( = ?auto_884815 ?auto_884825 ) ) ( not ( = ?auto_884815 ?auto_884829 ) ) ( not ( = ?auto_884816 ?auto_884813 ) ) ( not ( = ?auto_884816 ?auto_884817 ) ) ( not ( = ?auto_884816 ?auto_884819 ) ) ( not ( = ?auto_884816 ?auto_884818 ) ) ( not ( = ?auto_884816 ?auto_884820 ) ) ( not ( = ?auto_884816 ?auto_884821 ) ) ( not ( = ?auto_884816 ?auto_884822 ) ) ( not ( = ?auto_884816 ?auto_884823 ) ) ( not ( = ?auto_884816 ?auto_884824 ) ) ( not ( = ?auto_884816 ?auto_884825 ) ) ( not ( = ?auto_884816 ?auto_884829 ) ) ( not ( = ?auto_884813 ?auto_884817 ) ) ( not ( = ?auto_884813 ?auto_884819 ) ) ( not ( = ?auto_884813 ?auto_884818 ) ) ( not ( = ?auto_884813 ?auto_884820 ) ) ( not ( = ?auto_884813 ?auto_884821 ) ) ( not ( = ?auto_884813 ?auto_884822 ) ) ( not ( = ?auto_884813 ?auto_884823 ) ) ( not ( = ?auto_884813 ?auto_884824 ) ) ( not ( = ?auto_884813 ?auto_884825 ) ) ( not ( = ?auto_884813 ?auto_884829 ) ) ( not ( = ?auto_884817 ?auto_884819 ) ) ( not ( = ?auto_884817 ?auto_884818 ) ) ( not ( = ?auto_884817 ?auto_884820 ) ) ( not ( = ?auto_884817 ?auto_884821 ) ) ( not ( = ?auto_884817 ?auto_884822 ) ) ( not ( = ?auto_884817 ?auto_884823 ) ) ( not ( = ?auto_884817 ?auto_884824 ) ) ( not ( = ?auto_884817 ?auto_884825 ) ) ( not ( = ?auto_884817 ?auto_884829 ) ) ( not ( = ?auto_884819 ?auto_884818 ) ) ( not ( = ?auto_884819 ?auto_884820 ) ) ( not ( = ?auto_884819 ?auto_884821 ) ) ( not ( = ?auto_884819 ?auto_884822 ) ) ( not ( = ?auto_884819 ?auto_884823 ) ) ( not ( = ?auto_884819 ?auto_884824 ) ) ( not ( = ?auto_884819 ?auto_884825 ) ) ( not ( = ?auto_884819 ?auto_884829 ) ) ( not ( = ?auto_884818 ?auto_884820 ) ) ( not ( = ?auto_884818 ?auto_884821 ) ) ( not ( = ?auto_884818 ?auto_884822 ) ) ( not ( = ?auto_884818 ?auto_884823 ) ) ( not ( = ?auto_884818 ?auto_884824 ) ) ( not ( = ?auto_884818 ?auto_884825 ) ) ( not ( = ?auto_884818 ?auto_884829 ) ) ( not ( = ?auto_884820 ?auto_884821 ) ) ( not ( = ?auto_884820 ?auto_884822 ) ) ( not ( = ?auto_884820 ?auto_884823 ) ) ( not ( = ?auto_884820 ?auto_884824 ) ) ( not ( = ?auto_884820 ?auto_884825 ) ) ( not ( = ?auto_884820 ?auto_884829 ) ) ( not ( = ?auto_884821 ?auto_884822 ) ) ( not ( = ?auto_884821 ?auto_884823 ) ) ( not ( = ?auto_884821 ?auto_884824 ) ) ( not ( = ?auto_884821 ?auto_884825 ) ) ( not ( = ?auto_884821 ?auto_884829 ) ) ( not ( = ?auto_884822 ?auto_884823 ) ) ( not ( = ?auto_884822 ?auto_884824 ) ) ( not ( = ?auto_884822 ?auto_884825 ) ) ( not ( = ?auto_884822 ?auto_884829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884823 ?auto_884824 ?auto_884825 )
      ( MAKE-12CRATE-VERIFY ?auto_884814 ?auto_884815 ?auto_884816 ?auto_884813 ?auto_884817 ?auto_884819 ?auto_884818 ?auto_884820 ?auto_884821 ?auto_884822 ?auto_884823 ?auto_884824 ?auto_884825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_889246 - SURFACE
      ?auto_889247 - SURFACE
    )
    :vars
    (
      ?auto_889250 - HOIST
      ?auto_889252 - PLACE
      ?auto_889249 - SURFACE
      ?auto_889251 - TRUCK
      ?auto_889253 - PLACE
      ?auto_889254 - HOIST
      ?auto_889248 - SURFACE
      ?auto_889255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_889250 ?auto_889252 ) ( SURFACE-AT ?auto_889246 ?auto_889252 ) ( CLEAR ?auto_889246 ) ( IS-CRATE ?auto_889247 ) ( not ( = ?auto_889246 ?auto_889247 ) ) ( AVAILABLE ?auto_889250 ) ( ON ?auto_889246 ?auto_889249 ) ( not ( = ?auto_889249 ?auto_889246 ) ) ( not ( = ?auto_889249 ?auto_889247 ) ) ( TRUCK-AT ?auto_889251 ?auto_889253 ) ( not ( = ?auto_889253 ?auto_889252 ) ) ( HOIST-AT ?auto_889254 ?auto_889253 ) ( not ( = ?auto_889250 ?auto_889254 ) ) ( SURFACE-AT ?auto_889247 ?auto_889253 ) ( ON ?auto_889247 ?auto_889248 ) ( CLEAR ?auto_889247 ) ( not ( = ?auto_889246 ?auto_889248 ) ) ( not ( = ?auto_889247 ?auto_889248 ) ) ( not ( = ?auto_889249 ?auto_889248 ) ) ( LIFTING ?auto_889254 ?auto_889255 ) ( IS-CRATE ?auto_889255 ) ( not ( = ?auto_889246 ?auto_889255 ) ) ( not ( = ?auto_889247 ?auto_889255 ) ) ( not ( = ?auto_889249 ?auto_889255 ) ) ( not ( = ?auto_889248 ?auto_889255 ) ) )
    :subtasks
    ( ( !LOAD ?auto_889254 ?auto_889255 ?auto_889251 ?auto_889253 )
      ( MAKE-1CRATE ?auto_889246 ?auto_889247 )
      ( MAKE-1CRATE-VERIFY ?auto_889246 ?auto_889247 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896396 - SURFACE
      ?auto_896397 - SURFACE
      ?auto_896398 - SURFACE
      ?auto_896395 - SURFACE
      ?auto_896399 - SURFACE
      ?auto_896401 - SURFACE
      ?auto_896400 - SURFACE
      ?auto_896402 - SURFACE
      ?auto_896403 - SURFACE
      ?auto_896404 - SURFACE
      ?auto_896405 - SURFACE
      ?auto_896406 - SURFACE
      ?auto_896407 - SURFACE
      ?auto_896408 - SURFACE
    )
    :vars
    (
      ?auto_896410 - HOIST
      ?auto_896409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_896410 ?auto_896409 ) ( SURFACE-AT ?auto_896407 ?auto_896409 ) ( CLEAR ?auto_896407 ) ( LIFTING ?auto_896410 ?auto_896408 ) ( IS-CRATE ?auto_896408 ) ( not ( = ?auto_896407 ?auto_896408 ) ) ( ON ?auto_896397 ?auto_896396 ) ( ON ?auto_896398 ?auto_896397 ) ( ON ?auto_896395 ?auto_896398 ) ( ON ?auto_896399 ?auto_896395 ) ( ON ?auto_896401 ?auto_896399 ) ( ON ?auto_896400 ?auto_896401 ) ( ON ?auto_896402 ?auto_896400 ) ( ON ?auto_896403 ?auto_896402 ) ( ON ?auto_896404 ?auto_896403 ) ( ON ?auto_896405 ?auto_896404 ) ( ON ?auto_896406 ?auto_896405 ) ( ON ?auto_896407 ?auto_896406 ) ( not ( = ?auto_896396 ?auto_896397 ) ) ( not ( = ?auto_896396 ?auto_896398 ) ) ( not ( = ?auto_896396 ?auto_896395 ) ) ( not ( = ?auto_896396 ?auto_896399 ) ) ( not ( = ?auto_896396 ?auto_896401 ) ) ( not ( = ?auto_896396 ?auto_896400 ) ) ( not ( = ?auto_896396 ?auto_896402 ) ) ( not ( = ?auto_896396 ?auto_896403 ) ) ( not ( = ?auto_896396 ?auto_896404 ) ) ( not ( = ?auto_896396 ?auto_896405 ) ) ( not ( = ?auto_896396 ?auto_896406 ) ) ( not ( = ?auto_896396 ?auto_896407 ) ) ( not ( = ?auto_896396 ?auto_896408 ) ) ( not ( = ?auto_896397 ?auto_896398 ) ) ( not ( = ?auto_896397 ?auto_896395 ) ) ( not ( = ?auto_896397 ?auto_896399 ) ) ( not ( = ?auto_896397 ?auto_896401 ) ) ( not ( = ?auto_896397 ?auto_896400 ) ) ( not ( = ?auto_896397 ?auto_896402 ) ) ( not ( = ?auto_896397 ?auto_896403 ) ) ( not ( = ?auto_896397 ?auto_896404 ) ) ( not ( = ?auto_896397 ?auto_896405 ) ) ( not ( = ?auto_896397 ?auto_896406 ) ) ( not ( = ?auto_896397 ?auto_896407 ) ) ( not ( = ?auto_896397 ?auto_896408 ) ) ( not ( = ?auto_896398 ?auto_896395 ) ) ( not ( = ?auto_896398 ?auto_896399 ) ) ( not ( = ?auto_896398 ?auto_896401 ) ) ( not ( = ?auto_896398 ?auto_896400 ) ) ( not ( = ?auto_896398 ?auto_896402 ) ) ( not ( = ?auto_896398 ?auto_896403 ) ) ( not ( = ?auto_896398 ?auto_896404 ) ) ( not ( = ?auto_896398 ?auto_896405 ) ) ( not ( = ?auto_896398 ?auto_896406 ) ) ( not ( = ?auto_896398 ?auto_896407 ) ) ( not ( = ?auto_896398 ?auto_896408 ) ) ( not ( = ?auto_896395 ?auto_896399 ) ) ( not ( = ?auto_896395 ?auto_896401 ) ) ( not ( = ?auto_896395 ?auto_896400 ) ) ( not ( = ?auto_896395 ?auto_896402 ) ) ( not ( = ?auto_896395 ?auto_896403 ) ) ( not ( = ?auto_896395 ?auto_896404 ) ) ( not ( = ?auto_896395 ?auto_896405 ) ) ( not ( = ?auto_896395 ?auto_896406 ) ) ( not ( = ?auto_896395 ?auto_896407 ) ) ( not ( = ?auto_896395 ?auto_896408 ) ) ( not ( = ?auto_896399 ?auto_896401 ) ) ( not ( = ?auto_896399 ?auto_896400 ) ) ( not ( = ?auto_896399 ?auto_896402 ) ) ( not ( = ?auto_896399 ?auto_896403 ) ) ( not ( = ?auto_896399 ?auto_896404 ) ) ( not ( = ?auto_896399 ?auto_896405 ) ) ( not ( = ?auto_896399 ?auto_896406 ) ) ( not ( = ?auto_896399 ?auto_896407 ) ) ( not ( = ?auto_896399 ?auto_896408 ) ) ( not ( = ?auto_896401 ?auto_896400 ) ) ( not ( = ?auto_896401 ?auto_896402 ) ) ( not ( = ?auto_896401 ?auto_896403 ) ) ( not ( = ?auto_896401 ?auto_896404 ) ) ( not ( = ?auto_896401 ?auto_896405 ) ) ( not ( = ?auto_896401 ?auto_896406 ) ) ( not ( = ?auto_896401 ?auto_896407 ) ) ( not ( = ?auto_896401 ?auto_896408 ) ) ( not ( = ?auto_896400 ?auto_896402 ) ) ( not ( = ?auto_896400 ?auto_896403 ) ) ( not ( = ?auto_896400 ?auto_896404 ) ) ( not ( = ?auto_896400 ?auto_896405 ) ) ( not ( = ?auto_896400 ?auto_896406 ) ) ( not ( = ?auto_896400 ?auto_896407 ) ) ( not ( = ?auto_896400 ?auto_896408 ) ) ( not ( = ?auto_896402 ?auto_896403 ) ) ( not ( = ?auto_896402 ?auto_896404 ) ) ( not ( = ?auto_896402 ?auto_896405 ) ) ( not ( = ?auto_896402 ?auto_896406 ) ) ( not ( = ?auto_896402 ?auto_896407 ) ) ( not ( = ?auto_896402 ?auto_896408 ) ) ( not ( = ?auto_896403 ?auto_896404 ) ) ( not ( = ?auto_896403 ?auto_896405 ) ) ( not ( = ?auto_896403 ?auto_896406 ) ) ( not ( = ?auto_896403 ?auto_896407 ) ) ( not ( = ?auto_896403 ?auto_896408 ) ) ( not ( = ?auto_896404 ?auto_896405 ) ) ( not ( = ?auto_896404 ?auto_896406 ) ) ( not ( = ?auto_896404 ?auto_896407 ) ) ( not ( = ?auto_896404 ?auto_896408 ) ) ( not ( = ?auto_896405 ?auto_896406 ) ) ( not ( = ?auto_896405 ?auto_896407 ) ) ( not ( = ?auto_896405 ?auto_896408 ) ) ( not ( = ?auto_896406 ?auto_896407 ) ) ( not ( = ?auto_896406 ?auto_896408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_896407 ?auto_896408 )
      ( MAKE-13CRATE-VERIFY ?auto_896396 ?auto_896397 ?auto_896398 ?auto_896395 ?auto_896399 ?auto_896401 ?auto_896400 ?auto_896402 ?auto_896403 ?auto_896404 ?auto_896405 ?auto_896406 ?auto_896407 ?auto_896408 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896538 - SURFACE
      ?auto_896539 - SURFACE
      ?auto_896540 - SURFACE
      ?auto_896537 - SURFACE
      ?auto_896541 - SURFACE
      ?auto_896543 - SURFACE
      ?auto_896542 - SURFACE
      ?auto_896544 - SURFACE
      ?auto_896545 - SURFACE
      ?auto_896546 - SURFACE
      ?auto_896547 - SURFACE
      ?auto_896548 - SURFACE
      ?auto_896549 - SURFACE
      ?auto_896550 - SURFACE
    )
    :vars
    (
      ?auto_896552 - HOIST
      ?auto_896553 - PLACE
      ?auto_896551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_896552 ?auto_896553 ) ( SURFACE-AT ?auto_896549 ?auto_896553 ) ( CLEAR ?auto_896549 ) ( IS-CRATE ?auto_896550 ) ( not ( = ?auto_896549 ?auto_896550 ) ) ( TRUCK-AT ?auto_896551 ?auto_896553 ) ( AVAILABLE ?auto_896552 ) ( IN ?auto_896550 ?auto_896551 ) ( ON ?auto_896549 ?auto_896548 ) ( not ( = ?auto_896548 ?auto_896549 ) ) ( not ( = ?auto_896548 ?auto_896550 ) ) ( ON ?auto_896539 ?auto_896538 ) ( ON ?auto_896540 ?auto_896539 ) ( ON ?auto_896537 ?auto_896540 ) ( ON ?auto_896541 ?auto_896537 ) ( ON ?auto_896543 ?auto_896541 ) ( ON ?auto_896542 ?auto_896543 ) ( ON ?auto_896544 ?auto_896542 ) ( ON ?auto_896545 ?auto_896544 ) ( ON ?auto_896546 ?auto_896545 ) ( ON ?auto_896547 ?auto_896546 ) ( ON ?auto_896548 ?auto_896547 ) ( not ( = ?auto_896538 ?auto_896539 ) ) ( not ( = ?auto_896538 ?auto_896540 ) ) ( not ( = ?auto_896538 ?auto_896537 ) ) ( not ( = ?auto_896538 ?auto_896541 ) ) ( not ( = ?auto_896538 ?auto_896543 ) ) ( not ( = ?auto_896538 ?auto_896542 ) ) ( not ( = ?auto_896538 ?auto_896544 ) ) ( not ( = ?auto_896538 ?auto_896545 ) ) ( not ( = ?auto_896538 ?auto_896546 ) ) ( not ( = ?auto_896538 ?auto_896547 ) ) ( not ( = ?auto_896538 ?auto_896548 ) ) ( not ( = ?auto_896538 ?auto_896549 ) ) ( not ( = ?auto_896538 ?auto_896550 ) ) ( not ( = ?auto_896539 ?auto_896540 ) ) ( not ( = ?auto_896539 ?auto_896537 ) ) ( not ( = ?auto_896539 ?auto_896541 ) ) ( not ( = ?auto_896539 ?auto_896543 ) ) ( not ( = ?auto_896539 ?auto_896542 ) ) ( not ( = ?auto_896539 ?auto_896544 ) ) ( not ( = ?auto_896539 ?auto_896545 ) ) ( not ( = ?auto_896539 ?auto_896546 ) ) ( not ( = ?auto_896539 ?auto_896547 ) ) ( not ( = ?auto_896539 ?auto_896548 ) ) ( not ( = ?auto_896539 ?auto_896549 ) ) ( not ( = ?auto_896539 ?auto_896550 ) ) ( not ( = ?auto_896540 ?auto_896537 ) ) ( not ( = ?auto_896540 ?auto_896541 ) ) ( not ( = ?auto_896540 ?auto_896543 ) ) ( not ( = ?auto_896540 ?auto_896542 ) ) ( not ( = ?auto_896540 ?auto_896544 ) ) ( not ( = ?auto_896540 ?auto_896545 ) ) ( not ( = ?auto_896540 ?auto_896546 ) ) ( not ( = ?auto_896540 ?auto_896547 ) ) ( not ( = ?auto_896540 ?auto_896548 ) ) ( not ( = ?auto_896540 ?auto_896549 ) ) ( not ( = ?auto_896540 ?auto_896550 ) ) ( not ( = ?auto_896537 ?auto_896541 ) ) ( not ( = ?auto_896537 ?auto_896543 ) ) ( not ( = ?auto_896537 ?auto_896542 ) ) ( not ( = ?auto_896537 ?auto_896544 ) ) ( not ( = ?auto_896537 ?auto_896545 ) ) ( not ( = ?auto_896537 ?auto_896546 ) ) ( not ( = ?auto_896537 ?auto_896547 ) ) ( not ( = ?auto_896537 ?auto_896548 ) ) ( not ( = ?auto_896537 ?auto_896549 ) ) ( not ( = ?auto_896537 ?auto_896550 ) ) ( not ( = ?auto_896541 ?auto_896543 ) ) ( not ( = ?auto_896541 ?auto_896542 ) ) ( not ( = ?auto_896541 ?auto_896544 ) ) ( not ( = ?auto_896541 ?auto_896545 ) ) ( not ( = ?auto_896541 ?auto_896546 ) ) ( not ( = ?auto_896541 ?auto_896547 ) ) ( not ( = ?auto_896541 ?auto_896548 ) ) ( not ( = ?auto_896541 ?auto_896549 ) ) ( not ( = ?auto_896541 ?auto_896550 ) ) ( not ( = ?auto_896543 ?auto_896542 ) ) ( not ( = ?auto_896543 ?auto_896544 ) ) ( not ( = ?auto_896543 ?auto_896545 ) ) ( not ( = ?auto_896543 ?auto_896546 ) ) ( not ( = ?auto_896543 ?auto_896547 ) ) ( not ( = ?auto_896543 ?auto_896548 ) ) ( not ( = ?auto_896543 ?auto_896549 ) ) ( not ( = ?auto_896543 ?auto_896550 ) ) ( not ( = ?auto_896542 ?auto_896544 ) ) ( not ( = ?auto_896542 ?auto_896545 ) ) ( not ( = ?auto_896542 ?auto_896546 ) ) ( not ( = ?auto_896542 ?auto_896547 ) ) ( not ( = ?auto_896542 ?auto_896548 ) ) ( not ( = ?auto_896542 ?auto_896549 ) ) ( not ( = ?auto_896542 ?auto_896550 ) ) ( not ( = ?auto_896544 ?auto_896545 ) ) ( not ( = ?auto_896544 ?auto_896546 ) ) ( not ( = ?auto_896544 ?auto_896547 ) ) ( not ( = ?auto_896544 ?auto_896548 ) ) ( not ( = ?auto_896544 ?auto_896549 ) ) ( not ( = ?auto_896544 ?auto_896550 ) ) ( not ( = ?auto_896545 ?auto_896546 ) ) ( not ( = ?auto_896545 ?auto_896547 ) ) ( not ( = ?auto_896545 ?auto_896548 ) ) ( not ( = ?auto_896545 ?auto_896549 ) ) ( not ( = ?auto_896545 ?auto_896550 ) ) ( not ( = ?auto_896546 ?auto_896547 ) ) ( not ( = ?auto_896546 ?auto_896548 ) ) ( not ( = ?auto_896546 ?auto_896549 ) ) ( not ( = ?auto_896546 ?auto_896550 ) ) ( not ( = ?auto_896547 ?auto_896548 ) ) ( not ( = ?auto_896547 ?auto_896549 ) ) ( not ( = ?auto_896547 ?auto_896550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896548 ?auto_896549 ?auto_896550 )
      ( MAKE-13CRATE-VERIFY ?auto_896538 ?auto_896539 ?auto_896540 ?auto_896537 ?auto_896541 ?auto_896543 ?auto_896542 ?auto_896544 ?auto_896545 ?auto_896546 ?auto_896547 ?auto_896548 ?auto_896549 ?auto_896550 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896694 - SURFACE
      ?auto_896695 - SURFACE
      ?auto_896696 - SURFACE
      ?auto_896693 - SURFACE
      ?auto_896697 - SURFACE
      ?auto_896699 - SURFACE
      ?auto_896698 - SURFACE
      ?auto_896700 - SURFACE
      ?auto_896701 - SURFACE
      ?auto_896702 - SURFACE
      ?auto_896703 - SURFACE
      ?auto_896704 - SURFACE
      ?auto_896705 - SURFACE
      ?auto_896706 - SURFACE
    )
    :vars
    (
      ?auto_896710 - HOIST
      ?auto_896708 - PLACE
      ?auto_896707 - TRUCK
      ?auto_896709 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_896710 ?auto_896708 ) ( SURFACE-AT ?auto_896705 ?auto_896708 ) ( CLEAR ?auto_896705 ) ( IS-CRATE ?auto_896706 ) ( not ( = ?auto_896705 ?auto_896706 ) ) ( AVAILABLE ?auto_896710 ) ( IN ?auto_896706 ?auto_896707 ) ( ON ?auto_896705 ?auto_896704 ) ( not ( = ?auto_896704 ?auto_896705 ) ) ( not ( = ?auto_896704 ?auto_896706 ) ) ( TRUCK-AT ?auto_896707 ?auto_896709 ) ( not ( = ?auto_896709 ?auto_896708 ) ) ( ON ?auto_896695 ?auto_896694 ) ( ON ?auto_896696 ?auto_896695 ) ( ON ?auto_896693 ?auto_896696 ) ( ON ?auto_896697 ?auto_896693 ) ( ON ?auto_896699 ?auto_896697 ) ( ON ?auto_896698 ?auto_896699 ) ( ON ?auto_896700 ?auto_896698 ) ( ON ?auto_896701 ?auto_896700 ) ( ON ?auto_896702 ?auto_896701 ) ( ON ?auto_896703 ?auto_896702 ) ( ON ?auto_896704 ?auto_896703 ) ( not ( = ?auto_896694 ?auto_896695 ) ) ( not ( = ?auto_896694 ?auto_896696 ) ) ( not ( = ?auto_896694 ?auto_896693 ) ) ( not ( = ?auto_896694 ?auto_896697 ) ) ( not ( = ?auto_896694 ?auto_896699 ) ) ( not ( = ?auto_896694 ?auto_896698 ) ) ( not ( = ?auto_896694 ?auto_896700 ) ) ( not ( = ?auto_896694 ?auto_896701 ) ) ( not ( = ?auto_896694 ?auto_896702 ) ) ( not ( = ?auto_896694 ?auto_896703 ) ) ( not ( = ?auto_896694 ?auto_896704 ) ) ( not ( = ?auto_896694 ?auto_896705 ) ) ( not ( = ?auto_896694 ?auto_896706 ) ) ( not ( = ?auto_896695 ?auto_896696 ) ) ( not ( = ?auto_896695 ?auto_896693 ) ) ( not ( = ?auto_896695 ?auto_896697 ) ) ( not ( = ?auto_896695 ?auto_896699 ) ) ( not ( = ?auto_896695 ?auto_896698 ) ) ( not ( = ?auto_896695 ?auto_896700 ) ) ( not ( = ?auto_896695 ?auto_896701 ) ) ( not ( = ?auto_896695 ?auto_896702 ) ) ( not ( = ?auto_896695 ?auto_896703 ) ) ( not ( = ?auto_896695 ?auto_896704 ) ) ( not ( = ?auto_896695 ?auto_896705 ) ) ( not ( = ?auto_896695 ?auto_896706 ) ) ( not ( = ?auto_896696 ?auto_896693 ) ) ( not ( = ?auto_896696 ?auto_896697 ) ) ( not ( = ?auto_896696 ?auto_896699 ) ) ( not ( = ?auto_896696 ?auto_896698 ) ) ( not ( = ?auto_896696 ?auto_896700 ) ) ( not ( = ?auto_896696 ?auto_896701 ) ) ( not ( = ?auto_896696 ?auto_896702 ) ) ( not ( = ?auto_896696 ?auto_896703 ) ) ( not ( = ?auto_896696 ?auto_896704 ) ) ( not ( = ?auto_896696 ?auto_896705 ) ) ( not ( = ?auto_896696 ?auto_896706 ) ) ( not ( = ?auto_896693 ?auto_896697 ) ) ( not ( = ?auto_896693 ?auto_896699 ) ) ( not ( = ?auto_896693 ?auto_896698 ) ) ( not ( = ?auto_896693 ?auto_896700 ) ) ( not ( = ?auto_896693 ?auto_896701 ) ) ( not ( = ?auto_896693 ?auto_896702 ) ) ( not ( = ?auto_896693 ?auto_896703 ) ) ( not ( = ?auto_896693 ?auto_896704 ) ) ( not ( = ?auto_896693 ?auto_896705 ) ) ( not ( = ?auto_896693 ?auto_896706 ) ) ( not ( = ?auto_896697 ?auto_896699 ) ) ( not ( = ?auto_896697 ?auto_896698 ) ) ( not ( = ?auto_896697 ?auto_896700 ) ) ( not ( = ?auto_896697 ?auto_896701 ) ) ( not ( = ?auto_896697 ?auto_896702 ) ) ( not ( = ?auto_896697 ?auto_896703 ) ) ( not ( = ?auto_896697 ?auto_896704 ) ) ( not ( = ?auto_896697 ?auto_896705 ) ) ( not ( = ?auto_896697 ?auto_896706 ) ) ( not ( = ?auto_896699 ?auto_896698 ) ) ( not ( = ?auto_896699 ?auto_896700 ) ) ( not ( = ?auto_896699 ?auto_896701 ) ) ( not ( = ?auto_896699 ?auto_896702 ) ) ( not ( = ?auto_896699 ?auto_896703 ) ) ( not ( = ?auto_896699 ?auto_896704 ) ) ( not ( = ?auto_896699 ?auto_896705 ) ) ( not ( = ?auto_896699 ?auto_896706 ) ) ( not ( = ?auto_896698 ?auto_896700 ) ) ( not ( = ?auto_896698 ?auto_896701 ) ) ( not ( = ?auto_896698 ?auto_896702 ) ) ( not ( = ?auto_896698 ?auto_896703 ) ) ( not ( = ?auto_896698 ?auto_896704 ) ) ( not ( = ?auto_896698 ?auto_896705 ) ) ( not ( = ?auto_896698 ?auto_896706 ) ) ( not ( = ?auto_896700 ?auto_896701 ) ) ( not ( = ?auto_896700 ?auto_896702 ) ) ( not ( = ?auto_896700 ?auto_896703 ) ) ( not ( = ?auto_896700 ?auto_896704 ) ) ( not ( = ?auto_896700 ?auto_896705 ) ) ( not ( = ?auto_896700 ?auto_896706 ) ) ( not ( = ?auto_896701 ?auto_896702 ) ) ( not ( = ?auto_896701 ?auto_896703 ) ) ( not ( = ?auto_896701 ?auto_896704 ) ) ( not ( = ?auto_896701 ?auto_896705 ) ) ( not ( = ?auto_896701 ?auto_896706 ) ) ( not ( = ?auto_896702 ?auto_896703 ) ) ( not ( = ?auto_896702 ?auto_896704 ) ) ( not ( = ?auto_896702 ?auto_896705 ) ) ( not ( = ?auto_896702 ?auto_896706 ) ) ( not ( = ?auto_896703 ?auto_896704 ) ) ( not ( = ?auto_896703 ?auto_896705 ) ) ( not ( = ?auto_896703 ?auto_896706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896704 ?auto_896705 ?auto_896706 )
      ( MAKE-13CRATE-VERIFY ?auto_896694 ?auto_896695 ?auto_896696 ?auto_896693 ?auto_896697 ?auto_896699 ?auto_896698 ?auto_896700 ?auto_896701 ?auto_896702 ?auto_896703 ?auto_896704 ?auto_896705 ?auto_896706 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896863 - SURFACE
      ?auto_896864 - SURFACE
      ?auto_896865 - SURFACE
      ?auto_896862 - SURFACE
      ?auto_896866 - SURFACE
      ?auto_896868 - SURFACE
      ?auto_896867 - SURFACE
      ?auto_896869 - SURFACE
      ?auto_896870 - SURFACE
      ?auto_896871 - SURFACE
      ?auto_896872 - SURFACE
      ?auto_896873 - SURFACE
      ?auto_896874 - SURFACE
      ?auto_896875 - SURFACE
    )
    :vars
    (
      ?auto_896880 - HOIST
      ?auto_896876 - PLACE
      ?auto_896879 - TRUCK
      ?auto_896878 - PLACE
      ?auto_896877 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_896880 ?auto_896876 ) ( SURFACE-AT ?auto_896874 ?auto_896876 ) ( CLEAR ?auto_896874 ) ( IS-CRATE ?auto_896875 ) ( not ( = ?auto_896874 ?auto_896875 ) ) ( AVAILABLE ?auto_896880 ) ( ON ?auto_896874 ?auto_896873 ) ( not ( = ?auto_896873 ?auto_896874 ) ) ( not ( = ?auto_896873 ?auto_896875 ) ) ( TRUCK-AT ?auto_896879 ?auto_896878 ) ( not ( = ?auto_896878 ?auto_896876 ) ) ( HOIST-AT ?auto_896877 ?auto_896878 ) ( LIFTING ?auto_896877 ?auto_896875 ) ( not ( = ?auto_896880 ?auto_896877 ) ) ( ON ?auto_896864 ?auto_896863 ) ( ON ?auto_896865 ?auto_896864 ) ( ON ?auto_896862 ?auto_896865 ) ( ON ?auto_896866 ?auto_896862 ) ( ON ?auto_896868 ?auto_896866 ) ( ON ?auto_896867 ?auto_896868 ) ( ON ?auto_896869 ?auto_896867 ) ( ON ?auto_896870 ?auto_896869 ) ( ON ?auto_896871 ?auto_896870 ) ( ON ?auto_896872 ?auto_896871 ) ( ON ?auto_896873 ?auto_896872 ) ( not ( = ?auto_896863 ?auto_896864 ) ) ( not ( = ?auto_896863 ?auto_896865 ) ) ( not ( = ?auto_896863 ?auto_896862 ) ) ( not ( = ?auto_896863 ?auto_896866 ) ) ( not ( = ?auto_896863 ?auto_896868 ) ) ( not ( = ?auto_896863 ?auto_896867 ) ) ( not ( = ?auto_896863 ?auto_896869 ) ) ( not ( = ?auto_896863 ?auto_896870 ) ) ( not ( = ?auto_896863 ?auto_896871 ) ) ( not ( = ?auto_896863 ?auto_896872 ) ) ( not ( = ?auto_896863 ?auto_896873 ) ) ( not ( = ?auto_896863 ?auto_896874 ) ) ( not ( = ?auto_896863 ?auto_896875 ) ) ( not ( = ?auto_896864 ?auto_896865 ) ) ( not ( = ?auto_896864 ?auto_896862 ) ) ( not ( = ?auto_896864 ?auto_896866 ) ) ( not ( = ?auto_896864 ?auto_896868 ) ) ( not ( = ?auto_896864 ?auto_896867 ) ) ( not ( = ?auto_896864 ?auto_896869 ) ) ( not ( = ?auto_896864 ?auto_896870 ) ) ( not ( = ?auto_896864 ?auto_896871 ) ) ( not ( = ?auto_896864 ?auto_896872 ) ) ( not ( = ?auto_896864 ?auto_896873 ) ) ( not ( = ?auto_896864 ?auto_896874 ) ) ( not ( = ?auto_896864 ?auto_896875 ) ) ( not ( = ?auto_896865 ?auto_896862 ) ) ( not ( = ?auto_896865 ?auto_896866 ) ) ( not ( = ?auto_896865 ?auto_896868 ) ) ( not ( = ?auto_896865 ?auto_896867 ) ) ( not ( = ?auto_896865 ?auto_896869 ) ) ( not ( = ?auto_896865 ?auto_896870 ) ) ( not ( = ?auto_896865 ?auto_896871 ) ) ( not ( = ?auto_896865 ?auto_896872 ) ) ( not ( = ?auto_896865 ?auto_896873 ) ) ( not ( = ?auto_896865 ?auto_896874 ) ) ( not ( = ?auto_896865 ?auto_896875 ) ) ( not ( = ?auto_896862 ?auto_896866 ) ) ( not ( = ?auto_896862 ?auto_896868 ) ) ( not ( = ?auto_896862 ?auto_896867 ) ) ( not ( = ?auto_896862 ?auto_896869 ) ) ( not ( = ?auto_896862 ?auto_896870 ) ) ( not ( = ?auto_896862 ?auto_896871 ) ) ( not ( = ?auto_896862 ?auto_896872 ) ) ( not ( = ?auto_896862 ?auto_896873 ) ) ( not ( = ?auto_896862 ?auto_896874 ) ) ( not ( = ?auto_896862 ?auto_896875 ) ) ( not ( = ?auto_896866 ?auto_896868 ) ) ( not ( = ?auto_896866 ?auto_896867 ) ) ( not ( = ?auto_896866 ?auto_896869 ) ) ( not ( = ?auto_896866 ?auto_896870 ) ) ( not ( = ?auto_896866 ?auto_896871 ) ) ( not ( = ?auto_896866 ?auto_896872 ) ) ( not ( = ?auto_896866 ?auto_896873 ) ) ( not ( = ?auto_896866 ?auto_896874 ) ) ( not ( = ?auto_896866 ?auto_896875 ) ) ( not ( = ?auto_896868 ?auto_896867 ) ) ( not ( = ?auto_896868 ?auto_896869 ) ) ( not ( = ?auto_896868 ?auto_896870 ) ) ( not ( = ?auto_896868 ?auto_896871 ) ) ( not ( = ?auto_896868 ?auto_896872 ) ) ( not ( = ?auto_896868 ?auto_896873 ) ) ( not ( = ?auto_896868 ?auto_896874 ) ) ( not ( = ?auto_896868 ?auto_896875 ) ) ( not ( = ?auto_896867 ?auto_896869 ) ) ( not ( = ?auto_896867 ?auto_896870 ) ) ( not ( = ?auto_896867 ?auto_896871 ) ) ( not ( = ?auto_896867 ?auto_896872 ) ) ( not ( = ?auto_896867 ?auto_896873 ) ) ( not ( = ?auto_896867 ?auto_896874 ) ) ( not ( = ?auto_896867 ?auto_896875 ) ) ( not ( = ?auto_896869 ?auto_896870 ) ) ( not ( = ?auto_896869 ?auto_896871 ) ) ( not ( = ?auto_896869 ?auto_896872 ) ) ( not ( = ?auto_896869 ?auto_896873 ) ) ( not ( = ?auto_896869 ?auto_896874 ) ) ( not ( = ?auto_896869 ?auto_896875 ) ) ( not ( = ?auto_896870 ?auto_896871 ) ) ( not ( = ?auto_896870 ?auto_896872 ) ) ( not ( = ?auto_896870 ?auto_896873 ) ) ( not ( = ?auto_896870 ?auto_896874 ) ) ( not ( = ?auto_896870 ?auto_896875 ) ) ( not ( = ?auto_896871 ?auto_896872 ) ) ( not ( = ?auto_896871 ?auto_896873 ) ) ( not ( = ?auto_896871 ?auto_896874 ) ) ( not ( = ?auto_896871 ?auto_896875 ) ) ( not ( = ?auto_896872 ?auto_896873 ) ) ( not ( = ?auto_896872 ?auto_896874 ) ) ( not ( = ?auto_896872 ?auto_896875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896873 ?auto_896874 ?auto_896875 )
      ( MAKE-13CRATE-VERIFY ?auto_896863 ?auto_896864 ?auto_896865 ?auto_896862 ?auto_896866 ?auto_896868 ?auto_896867 ?auto_896869 ?auto_896870 ?auto_896871 ?auto_896872 ?auto_896873 ?auto_896874 ?auto_896875 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_897045 - SURFACE
      ?auto_897046 - SURFACE
      ?auto_897047 - SURFACE
      ?auto_897044 - SURFACE
      ?auto_897048 - SURFACE
      ?auto_897050 - SURFACE
      ?auto_897049 - SURFACE
      ?auto_897051 - SURFACE
      ?auto_897052 - SURFACE
      ?auto_897053 - SURFACE
      ?auto_897054 - SURFACE
      ?auto_897055 - SURFACE
      ?auto_897056 - SURFACE
      ?auto_897057 - SURFACE
    )
    :vars
    (
      ?auto_897063 - HOIST
      ?auto_897061 - PLACE
      ?auto_897060 - TRUCK
      ?auto_897058 - PLACE
      ?auto_897059 - HOIST
      ?auto_897062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_897063 ?auto_897061 ) ( SURFACE-AT ?auto_897056 ?auto_897061 ) ( CLEAR ?auto_897056 ) ( IS-CRATE ?auto_897057 ) ( not ( = ?auto_897056 ?auto_897057 ) ) ( AVAILABLE ?auto_897063 ) ( ON ?auto_897056 ?auto_897055 ) ( not ( = ?auto_897055 ?auto_897056 ) ) ( not ( = ?auto_897055 ?auto_897057 ) ) ( TRUCK-AT ?auto_897060 ?auto_897058 ) ( not ( = ?auto_897058 ?auto_897061 ) ) ( HOIST-AT ?auto_897059 ?auto_897058 ) ( not ( = ?auto_897063 ?auto_897059 ) ) ( AVAILABLE ?auto_897059 ) ( SURFACE-AT ?auto_897057 ?auto_897058 ) ( ON ?auto_897057 ?auto_897062 ) ( CLEAR ?auto_897057 ) ( not ( = ?auto_897056 ?auto_897062 ) ) ( not ( = ?auto_897057 ?auto_897062 ) ) ( not ( = ?auto_897055 ?auto_897062 ) ) ( ON ?auto_897046 ?auto_897045 ) ( ON ?auto_897047 ?auto_897046 ) ( ON ?auto_897044 ?auto_897047 ) ( ON ?auto_897048 ?auto_897044 ) ( ON ?auto_897050 ?auto_897048 ) ( ON ?auto_897049 ?auto_897050 ) ( ON ?auto_897051 ?auto_897049 ) ( ON ?auto_897052 ?auto_897051 ) ( ON ?auto_897053 ?auto_897052 ) ( ON ?auto_897054 ?auto_897053 ) ( ON ?auto_897055 ?auto_897054 ) ( not ( = ?auto_897045 ?auto_897046 ) ) ( not ( = ?auto_897045 ?auto_897047 ) ) ( not ( = ?auto_897045 ?auto_897044 ) ) ( not ( = ?auto_897045 ?auto_897048 ) ) ( not ( = ?auto_897045 ?auto_897050 ) ) ( not ( = ?auto_897045 ?auto_897049 ) ) ( not ( = ?auto_897045 ?auto_897051 ) ) ( not ( = ?auto_897045 ?auto_897052 ) ) ( not ( = ?auto_897045 ?auto_897053 ) ) ( not ( = ?auto_897045 ?auto_897054 ) ) ( not ( = ?auto_897045 ?auto_897055 ) ) ( not ( = ?auto_897045 ?auto_897056 ) ) ( not ( = ?auto_897045 ?auto_897057 ) ) ( not ( = ?auto_897045 ?auto_897062 ) ) ( not ( = ?auto_897046 ?auto_897047 ) ) ( not ( = ?auto_897046 ?auto_897044 ) ) ( not ( = ?auto_897046 ?auto_897048 ) ) ( not ( = ?auto_897046 ?auto_897050 ) ) ( not ( = ?auto_897046 ?auto_897049 ) ) ( not ( = ?auto_897046 ?auto_897051 ) ) ( not ( = ?auto_897046 ?auto_897052 ) ) ( not ( = ?auto_897046 ?auto_897053 ) ) ( not ( = ?auto_897046 ?auto_897054 ) ) ( not ( = ?auto_897046 ?auto_897055 ) ) ( not ( = ?auto_897046 ?auto_897056 ) ) ( not ( = ?auto_897046 ?auto_897057 ) ) ( not ( = ?auto_897046 ?auto_897062 ) ) ( not ( = ?auto_897047 ?auto_897044 ) ) ( not ( = ?auto_897047 ?auto_897048 ) ) ( not ( = ?auto_897047 ?auto_897050 ) ) ( not ( = ?auto_897047 ?auto_897049 ) ) ( not ( = ?auto_897047 ?auto_897051 ) ) ( not ( = ?auto_897047 ?auto_897052 ) ) ( not ( = ?auto_897047 ?auto_897053 ) ) ( not ( = ?auto_897047 ?auto_897054 ) ) ( not ( = ?auto_897047 ?auto_897055 ) ) ( not ( = ?auto_897047 ?auto_897056 ) ) ( not ( = ?auto_897047 ?auto_897057 ) ) ( not ( = ?auto_897047 ?auto_897062 ) ) ( not ( = ?auto_897044 ?auto_897048 ) ) ( not ( = ?auto_897044 ?auto_897050 ) ) ( not ( = ?auto_897044 ?auto_897049 ) ) ( not ( = ?auto_897044 ?auto_897051 ) ) ( not ( = ?auto_897044 ?auto_897052 ) ) ( not ( = ?auto_897044 ?auto_897053 ) ) ( not ( = ?auto_897044 ?auto_897054 ) ) ( not ( = ?auto_897044 ?auto_897055 ) ) ( not ( = ?auto_897044 ?auto_897056 ) ) ( not ( = ?auto_897044 ?auto_897057 ) ) ( not ( = ?auto_897044 ?auto_897062 ) ) ( not ( = ?auto_897048 ?auto_897050 ) ) ( not ( = ?auto_897048 ?auto_897049 ) ) ( not ( = ?auto_897048 ?auto_897051 ) ) ( not ( = ?auto_897048 ?auto_897052 ) ) ( not ( = ?auto_897048 ?auto_897053 ) ) ( not ( = ?auto_897048 ?auto_897054 ) ) ( not ( = ?auto_897048 ?auto_897055 ) ) ( not ( = ?auto_897048 ?auto_897056 ) ) ( not ( = ?auto_897048 ?auto_897057 ) ) ( not ( = ?auto_897048 ?auto_897062 ) ) ( not ( = ?auto_897050 ?auto_897049 ) ) ( not ( = ?auto_897050 ?auto_897051 ) ) ( not ( = ?auto_897050 ?auto_897052 ) ) ( not ( = ?auto_897050 ?auto_897053 ) ) ( not ( = ?auto_897050 ?auto_897054 ) ) ( not ( = ?auto_897050 ?auto_897055 ) ) ( not ( = ?auto_897050 ?auto_897056 ) ) ( not ( = ?auto_897050 ?auto_897057 ) ) ( not ( = ?auto_897050 ?auto_897062 ) ) ( not ( = ?auto_897049 ?auto_897051 ) ) ( not ( = ?auto_897049 ?auto_897052 ) ) ( not ( = ?auto_897049 ?auto_897053 ) ) ( not ( = ?auto_897049 ?auto_897054 ) ) ( not ( = ?auto_897049 ?auto_897055 ) ) ( not ( = ?auto_897049 ?auto_897056 ) ) ( not ( = ?auto_897049 ?auto_897057 ) ) ( not ( = ?auto_897049 ?auto_897062 ) ) ( not ( = ?auto_897051 ?auto_897052 ) ) ( not ( = ?auto_897051 ?auto_897053 ) ) ( not ( = ?auto_897051 ?auto_897054 ) ) ( not ( = ?auto_897051 ?auto_897055 ) ) ( not ( = ?auto_897051 ?auto_897056 ) ) ( not ( = ?auto_897051 ?auto_897057 ) ) ( not ( = ?auto_897051 ?auto_897062 ) ) ( not ( = ?auto_897052 ?auto_897053 ) ) ( not ( = ?auto_897052 ?auto_897054 ) ) ( not ( = ?auto_897052 ?auto_897055 ) ) ( not ( = ?auto_897052 ?auto_897056 ) ) ( not ( = ?auto_897052 ?auto_897057 ) ) ( not ( = ?auto_897052 ?auto_897062 ) ) ( not ( = ?auto_897053 ?auto_897054 ) ) ( not ( = ?auto_897053 ?auto_897055 ) ) ( not ( = ?auto_897053 ?auto_897056 ) ) ( not ( = ?auto_897053 ?auto_897057 ) ) ( not ( = ?auto_897053 ?auto_897062 ) ) ( not ( = ?auto_897054 ?auto_897055 ) ) ( not ( = ?auto_897054 ?auto_897056 ) ) ( not ( = ?auto_897054 ?auto_897057 ) ) ( not ( = ?auto_897054 ?auto_897062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_897055 ?auto_897056 ?auto_897057 )
      ( MAKE-13CRATE-VERIFY ?auto_897045 ?auto_897046 ?auto_897047 ?auto_897044 ?auto_897048 ?auto_897050 ?auto_897049 ?auto_897051 ?auto_897052 ?auto_897053 ?auto_897054 ?auto_897055 ?auto_897056 ?auto_897057 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_897228 - SURFACE
      ?auto_897229 - SURFACE
      ?auto_897230 - SURFACE
      ?auto_897227 - SURFACE
      ?auto_897231 - SURFACE
      ?auto_897233 - SURFACE
      ?auto_897232 - SURFACE
      ?auto_897234 - SURFACE
      ?auto_897235 - SURFACE
      ?auto_897236 - SURFACE
      ?auto_897237 - SURFACE
      ?auto_897238 - SURFACE
      ?auto_897239 - SURFACE
      ?auto_897240 - SURFACE
    )
    :vars
    (
      ?auto_897241 - HOIST
      ?auto_897245 - PLACE
      ?auto_897244 - PLACE
      ?auto_897243 - HOIST
      ?auto_897246 - SURFACE
      ?auto_897242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897241 ?auto_897245 ) ( SURFACE-AT ?auto_897239 ?auto_897245 ) ( CLEAR ?auto_897239 ) ( IS-CRATE ?auto_897240 ) ( not ( = ?auto_897239 ?auto_897240 ) ) ( AVAILABLE ?auto_897241 ) ( ON ?auto_897239 ?auto_897238 ) ( not ( = ?auto_897238 ?auto_897239 ) ) ( not ( = ?auto_897238 ?auto_897240 ) ) ( not ( = ?auto_897244 ?auto_897245 ) ) ( HOIST-AT ?auto_897243 ?auto_897244 ) ( not ( = ?auto_897241 ?auto_897243 ) ) ( AVAILABLE ?auto_897243 ) ( SURFACE-AT ?auto_897240 ?auto_897244 ) ( ON ?auto_897240 ?auto_897246 ) ( CLEAR ?auto_897240 ) ( not ( = ?auto_897239 ?auto_897246 ) ) ( not ( = ?auto_897240 ?auto_897246 ) ) ( not ( = ?auto_897238 ?auto_897246 ) ) ( TRUCK-AT ?auto_897242 ?auto_897245 ) ( ON ?auto_897229 ?auto_897228 ) ( ON ?auto_897230 ?auto_897229 ) ( ON ?auto_897227 ?auto_897230 ) ( ON ?auto_897231 ?auto_897227 ) ( ON ?auto_897233 ?auto_897231 ) ( ON ?auto_897232 ?auto_897233 ) ( ON ?auto_897234 ?auto_897232 ) ( ON ?auto_897235 ?auto_897234 ) ( ON ?auto_897236 ?auto_897235 ) ( ON ?auto_897237 ?auto_897236 ) ( ON ?auto_897238 ?auto_897237 ) ( not ( = ?auto_897228 ?auto_897229 ) ) ( not ( = ?auto_897228 ?auto_897230 ) ) ( not ( = ?auto_897228 ?auto_897227 ) ) ( not ( = ?auto_897228 ?auto_897231 ) ) ( not ( = ?auto_897228 ?auto_897233 ) ) ( not ( = ?auto_897228 ?auto_897232 ) ) ( not ( = ?auto_897228 ?auto_897234 ) ) ( not ( = ?auto_897228 ?auto_897235 ) ) ( not ( = ?auto_897228 ?auto_897236 ) ) ( not ( = ?auto_897228 ?auto_897237 ) ) ( not ( = ?auto_897228 ?auto_897238 ) ) ( not ( = ?auto_897228 ?auto_897239 ) ) ( not ( = ?auto_897228 ?auto_897240 ) ) ( not ( = ?auto_897228 ?auto_897246 ) ) ( not ( = ?auto_897229 ?auto_897230 ) ) ( not ( = ?auto_897229 ?auto_897227 ) ) ( not ( = ?auto_897229 ?auto_897231 ) ) ( not ( = ?auto_897229 ?auto_897233 ) ) ( not ( = ?auto_897229 ?auto_897232 ) ) ( not ( = ?auto_897229 ?auto_897234 ) ) ( not ( = ?auto_897229 ?auto_897235 ) ) ( not ( = ?auto_897229 ?auto_897236 ) ) ( not ( = ?auto_897229 ?auto_897237 ) ) ( not ( = ?auto_897229 ?auto_897238 ) ) ( not ( = ?auto_897229 ?auto_897239 ) ) ( not ( = ?auto_897229 ?auto_897240 ) ) ( not ( = ?auto_897229 ?auto_897246 ) ) ( not ( = ?auto_897230 ?auto_897227 ) ) ( not ( = ?auto_897230 ?auto_897231 ) ) ( not ( = ?auto_897230 ?auto_897233 ) ) ( not ( = ?auto_897230 ?auto_897232 ) ) ( not ( = ?auto_897230 ?auto_897234 ) ) ( not ( = ?auto_897230 ?auto_897235 ) ) ( not ( = ?auto_897230 ?auto_897236 ) ) ( not ( = ?auto_897230 ?auto_897237 ) ) ( not ( = ?auto_897230 ?auto_897238 ) ) ( not ( = ?auto_897230 ?auto_897239 ) ) ( not ( = ?auto_897230 ?auto_897240 ) ) ( not ( = ?auto_897230 ?auto_897246 ) ) ( not ( = ?auto_897227 ?auto_897231 ) ) ( not ( = ?auto_897227 ?auto_897233 ) ) ( not ( = ?auto_897227 ?auto_897232 ) ) ( not ( = ?auto_897227 ?auto_897234 ) ) ( not ( = ?auto_897227 ?auto_897235 ) ) ( not ( = ?auto_897227 ?auto_897236 ) ) ( not ( = ?auto_897227 ?auto_897237 ) ) ( not ( = ?auto_897227 ?auto_897238 ) ) ( not ( = ?auto_897227 ?auto_897239 ) ) ( not ( = ?auto_897227 ?auto_897240 ) ) ( not ( = ?auto_897227 ?auto_897246 ) ) ( not ( = ?auto_897231 ?auto_897233 ) ) ( not ( = ?auto_897231 ?auto_897232 ) ) ( not ( = ?auto_897231 ?auto_897234 ) ) ( not ( = ?auto_897231 ?auto_897235 ) ) ( not ( = ?auto_897231 ?auto_897236 ) ) ( not ( = ?auto_897231 ?auto_897237 ) ) ( not ( = ?auto_897231 ?auto_897238 ) ) ( not ( = ?auto_897231 ?auto_897239 ) ) ( not ( = ?auto_897231 ?auto_897240 ) ) ( not ( = ?auto_897231 ?auto_897246 ) ) ( not ( = ?auto_897233 ?auto_897232 ) ) ( not ( = ?auto_897233 ?auto_897234 ) ) ( not ( = ?auto_897233 ?auto_897235 ) ) ( not ( = ?auto_897233 ?auto_897236 ) ) ( not ( = ?auto_897233 ?auto_897237 ) ) ( not ( = ?auto_897233 ?auto_897238 ) ) ( not ( = ?auto_897233 ?auto_897239 ) ) ( not ( = ?auto_897233 ?auto_897240 ) ) ( not ( = ?auto_897233 ?auto_897246 ) ) ( not ( = ?auto_897232 ?auto_897234 ) ) ( not ( = ?auto_897232 ?auto_897235 ) ) ( not ( = ?auto_897232 ?auto_897236 ) ) ( not ( = ?auto_897232 ?auto_897237 ) ) ( not ( = ?auto_897232 ?auto_897238 ) ) ( not ( = ?auto_897232 ?auto_897239 ) ) ( not ( = ?auto_897232 ?auto_897240 ) ) ( not ( = ?auto_897232 ?auto_897246 ) ) ( not ( = ?auto_897234 ?auto_897235 ) ) ( not ( = ?auto_897234 ?auto_897236 ) ) ( not ( = ?auto_897234 ?auto_897237 ) ) ( not ( = ?auto_897234 ?auto_897238 ) ) ( not ( = ?auto_897234 ?auto_897239 ) ) ( not ( = ?auto_897234 ?auto_897240 ) ) ( not ( = ?auto_897234 ?auto_897246 ) ) ( not ( = ?auto_897235 ?auto_897236 ) ) ( not ( = ?auto_897235 ?auto_897237 ) ) ( not ( = ?auto_897235 ?auto_897238 ) ) ( not ( = ?auto_897235 ?auto_897239 ) ) ( not ( = ?auto_897235 ?auto_897240 ) ) ( not ( = ?auto_897235 ?auto_897246 ) ) ( not ( = ?auto_897236 ?auto_897237 ) ) ( not ( = ?auto_897236 ?auto_897238 ) ) ( not ( = ?auto_897236 ?auto_897239 ) ) ( not ( = ?auto_897236 ?auto_897240 ) ) ( not ( = ?auto_897236 ?auto_897246 ) ) ( not ( = ?auto_897237 ?auto_897238 ) ) ( not ( = ?auto_897237 ?auto_897239 ) ) ( not ( = ?auto_897237 ?auto_897240 ) ) ( not ( = ?auto_897237 ?auto_897246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_897238 ?auto_897239 ?auto_897240 )
      ( MAKE-13CRATE-VERIFY ?auto_897228 ?auto_897229 ?auto_897230 ?auto_897227 ?auto_897231 ?auto_897233 ?auto_897232 ?auto_897234 ?auto_897235 ?auto_897236 ?auto_897237 ?auto_897238 ?auto_897239 ?auto_897240 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_897411 - SURFACE
      ?auto_897412 - SURFACE
      ?auto_897413 - SURFACE
      ?auto_897410 - SURFACE
      ?auto_897414 - SURFACE
      ?auto_897416 - SURFACE
      ?auto_897415 - SURFACE
      ?auto_897417 - SURFACE
      ?auto_897418 - SURFACE
      ?auto_897419 - SURFACE
      ?auto_897420 - SURFACE
      ?auto_897421 - SURFACE
      ?auto_897422 - SURFACE
      ?auto_897423 - SURFACE
    )
    :vars
    (
      ?auto_897425 - HOIST
      ?auto_897428 - PLACE
      ?auto_897424 - PLACE
      ?auto_897427 - HOIST
      ?auto_897429 - SURFACE
      ?auto_897426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897425 ?auto_897428 ) ( IS-CRATE ?auto_897423 ) ( not ( = ?auto_897422 ?auto_897423 ) ) ( not ( = ?auto_897421 ?auto_897422 ) ) ( not ( = ?auto_897421 ?auto_897423 ) ) ( not ( = ?auto_897424 ?auto_897428 ) ) ( HOIST-AT ?auto_897427 ?auto_897424 ) ( not ( = ?auto_897425 ?auto_897427 ) ) ( AVAILABLE ?auto_897427 ) ( SURFACE-AT ?auto_897423 ?auto_897424 ) ( ON ?auto_897423 ?auto_897429 ) ( CLEAR ?auto_897423 ) ( not ( = ?auto_897422 ?auto_897429 ) ) ( not ( = ?auto_897423 ?auto_897429 ) ) ( not ( = ?auto_897421 ?auto_897429 ) ) ( TRUCK-AT ?auto_897426 ?auto_897428 ) ( SURFACE-AT ?auto_897421 ?auto_897428 ) ( CLEAR ?auto_897421 ) ( LIFTING ?auto_897425 ?auto_897422 ) ( IS-CRATE ?auto_897422 ) ( ON ?auto_897412 ?auto_897411 ) ( ON ?auto_897413 ?auto_897412 ) ( ON ?auto_897410 ?auto_897413 ) ( ON ?auto_897414 ?auto_897410 ) ( ON ?auto_897416 ?auto_897414 ) ( ON ?auto_897415 ?auto_897416 ) ( ON ?auto_897417 ?auto_897415 ) ( ON ?auto_897418 ?auto_897417 ) ( ON ?auto_897419 ?auto_897418 ) ( ON ?auto_897420 ?auto_897419 ) ( ON ?auto_897421 ?auto_897420 ) ( not ( = ?auto_897411 ?auto_897412 ) ) ( not ( = ?auto_897411 ?auto_897413 ) ) ( not ( = ?auto_897411 ?auto_897410 ) ) ( not ( = ?auto_897411 ?auto_897414 ) ) ( not ( = ?auto_897411 ?auto_897416 ) ) ( not ( = ?auto_897411 ?auto_897415 ) ) ( not ( = ?auto_897411 ?auto_897417 ) ) ( not ( = ?auto_897411 ?auto_897418 ) ) ( not ( = ?auto_897411 ?auto_897419 ) ) ( not ( = ?auto_897411 ?auto_897420 ) ) ( not ( = ?auto_897411 ?auto_897421 ) ) ( not ( = ?auto_897411 ?auto_897422 ) ) ( not ( = ?auto_897411 ?auto_897423 ) ) ( not ( = ?auto_897411 ?auto_897429 ) ) ( not ( = ?auto_897412 ?auto_897413 ) ) ( not ( = ?auto_897412 ?auto_897410 ) ) ( not ( = ?auto_897412 ?auto_897414 ) ) ( not ( = ?auto_897412 ?auto_897416 ) ) ( not ( = ?auto_897412 ?auto_897415 ) ) ( not ( = ?auto_897412 ?auto_897417 ) ) ( not ( = ?auto_897412 ?auto_897418 ) ) ( not ( = ?auto_897412 ?auto_897419 ) ) ( not ( = ?auto_897412 ?auto_897420 ) ) ( not ( = ?auto_897412 ?auto_897421 ) ) ( not ( = ?auto_897412 ?auto_897422 ) ) ( not ( = ?auto_897412 ?auto_897423 ) ) ( not ( = ?auto_897412 ?auto_897429 ) ) ( not ( = ?auto_897413 ?auto_897410 ) ) ( not ( = ?auto_897413 ?auto_897414 ) ) ( not ( = ?auto_897413 ?auto_897416 ) ) ( not ( = ?auto_897413 ?auto_897415 ) ) ( not ( = ?auto_897413 ?auto_897417 ) ) ( not ( = ?auto_897413 ?auto_897418 ) ) ( not ( = ?auto_897413 ?auto_897419 ) ) ( not ( = ?auto_897413 ?auto_897420 ) ) ( not ( = ?auto_897413 ?auto_897421 ) ) ( not ( = ?auto_897413 ?auto_897422 ) ) ( not ( = ?auto_897413 ?auto_897423 ) ) ( not ( = ?auto_897413 ?auto_897429 ) ) ( not ( = ?auto_897410 ?auto_897414 ) ) ( not ( = ?auto_897410 ?auto_897416 ) ) ( not ( = ?auto_897410 ?auto_897415 ) ) ( not ( = ?auto_897410 ?auto_897417 ) ) ( not ( = ?auto_897410 ?auto_897418 ) ) ( not ( = ?auto_897410 ?auto_897419 ) ) ( not ( = ?auto_897410 ?auto_897420 ) ) ( not ( = ?auto_897410 ?auto_897421 ) ) ( not ( = ?auto_897410 ?auto_897422 ) ) ( not ( = ?auto_897410 ?auto_897423 ) ) ( not ( = ?auto_897410 ?auto_897429 ) ) ( not ( = ?auto_897414 ?auto_897416 ) ) ( not ( = ?auto_897414 ?auto_897415 ) ) ( not ( = ?auto_897414 ?auto_897417 ) ) ( not ( = ?auto_897414 ?auto_897418 ) ) ( not ( = ?auto_897414 ?auto_897419 ) ) ( not ( = ?auto_897414 ?auto_897420 ) ) ( not ( = ?auto_897414 ?auto_897421 ) ) ( not ( = ?auto_897414 ?auto_897422 ) ) ( not ( = ?auto_897414 ?auto_897423 ) ) ( not ( = ?auto_897414 ?auto_897429 ) ) ( not ( = ?auto_897416 ?auto_897415 ) ) ( not ( = ?auto_897416 ?auto_897417 ) ) ( not ( = ?auto_897416 ?auto_897418 ) ) ( not ( = ?auto_897416 ?auto_897419 ) ) ( not ( = ?auto_897416 ?auto_897420 ) ) ( not ( = ?auto_897416 ?auto_897421 ) ) ( not ( = ?auto_897416 ?auto_897422 ) ) ( not ( = ?auto_897416 ?auto_897423 ) ) ( not ( = ?auto_897416 ?auto_897429 ) ) ( not ( = ?auto_897415 ?auto_897417 ) ) ( not ( = ?auto_897415 ?auto_897418 ) ) ( not ( = ?auto_897415 ?auto_897419 ) ) ( not ( = ?auto_897415 ?auto_897420 ) ) ( not ( = ?auto_897415 ?auto_897421 ) ) ( not ( = ?auto_897415 ?auto_897422 ) ) ( not ( = ?auto_897415 ?auto_897423 ) ) ( not ( = ?auto_897415 ?auto_897429 ) ) ( not ( = ?auto_897417 ?auto_897418 ) ) ( not ( = ?auto_897417 ?auto_897419 ) ) ( not ( = ?auto_897417 ?auto_897420 ) ) ( not ( = ?auto_897417 ?auto_897421 ) ) ( not ( = ?auto_897417 ?auto_897422 ) ) ( not ( = ?auto_897417 ?auto_897423 ) ) ( not ( = ?auto_897417 ?auto_897429 ) ) ( not ( = ?auto_897418 ?auto_897419 ) ) ( not ( = ?auto_897418 ?auto_897420 ) ) ( not ( = ?auto_897418 ?auto_897421 ) ) ( not ( = ?auto_897418 ?auto_897422 ) ) ( not ( = ?auto_897418 ?auto_897423 ) ) ( not ( = ?auto_897418 ?auto_897429 ) ) ( not ( = ?auto_897419 ?auto_897420 ) ) ( not ( = ?auto_897419 ?auto_897421 ) ) ( not ( = ?auto_897419 ?auto_897422 ) ) ( not ( = ?auto_897419 ?auto_897423 ) ) ( not ( = ?auto_897419 ?auto_897429 ) ) ( not ( = ?auto_897420 ?auto_897421 ) ) ( not ( = ?auto_897420 ?auto_897422 ) ) ( not ( = ?auto_897420 ?auto_897423 ) ) ( not ( = ?auto_897420 ?auto_897429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_897421 ?auto_897422 ?auto_897423 )
      ( MAKE-13CRATE-VERIFY ?auto_897411 ?auto_897412 ?auto_897413 ?auto_897410 ?auto_897414 ?auto_897416 ?auto_897415 ?auto_897417 ?auto_897418 ?auto_897419 ?auto_897420 ?auto_897421 ?auto_897422 ?auto_897423 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_897594 - SURFACE
      ?auto_897595 - SURFACE
      ?auto_897596 - SURFACE
      ?auto_897593 - SURFACE
      ?auto_897597 - SURFACE
      ?auto_897599 - SURFACE
      ?auto_897598 - SURFACE
      ?auto_897600 - SURFACE
      ?auto_897601 - SURFACE
      ?auto_897602 - SURFACE
      ?auto_897603 - SURFACE
      ?auto_897604 - SURFACE
      ?auto_897605 - SURFACE
      ?auto_897606 - SURFACE
    )
    :vars
    (
      ?auto_897612 - HOIST
      ?auto_897611 - PLACE
      ?auto_897607 - PLACE
      ?auto_897609 - HOIST
      ?auto_897610 - SURFACE
      ?auto_897608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897612 ?auto_897611 ) ( IS-CRATE ?auto_897606 ) ( not ( = ?auto_897605 ?auto_897606 ) ) ( not ( = ?auto_897604 ?auto_897605 ) ) ( not ( = ?auto_897604 ?auto_897606 ) ) ( not ( = ?auto_897607 ?auto_897611 ) ) ( HOIST-AT ?auto_897609 ?auto_897607 ) ( not ( = ?auto_897612 ?auto_897609 ) ) ( AVAILABLE ?auto_897609 ) ( SURFACE-AT ?auto_897606 ?auto_897607 ) ( ON ?auto_897606 ?auto_897610 ) ( CLEAR ?auto_897606 ) ( not ( = ?auto_897605 ?auto_897610 ) ) ( not ( = ?auto_897606 ?auto_897610 ) ) ( not ( = ?auto_897604 ?auto_897610 ) ) ( TRUCK-AT ?auto_897608 ?auto_897611 ) ( SURFACE-AT ?auto_897604 ?auto_897611 ) ( CLEAR ?auto_897604 ) ( IS-CRATE ?auto_897605 ) ( AVAILABLE ?auto_897612 ) ( IN ?auto_897605 ?auto_897608 ) ( ON ?auto_897595 ?auto_897594 ) ( ON ?auto_897596 ?auto_897595 ) ( ON ?auto_897593 ?auto_897596 ) ( ON ?auto_897597 ?auto_897593 ) ( ON ?auto_897599 ?auto_897597 ) ( ON ?auto_897598 ?auto_897599 ) ( ON ?auto_897600 ?auto_897598 ) ( ON ?auto_897601 ?auto_897600 ) ( ON ?auto_897602 ?auto_897601 ) ( ON ?auto_897603 ?auto_897602 ) ( ON ?auto_897604 ?auto_897603 ) ( not ( = ?auto_897594 ?auto_897595 ) ) ( not ( = ?auto_897594 ?auto_897596 ) ) ( not ( = ?auto_897594 ?auto_897593 ) ) ( not ( = ?auto_897594 ?auto_897597 ) ) ( not ( = ?auto_897594 ?auto_897599 ) ) ( not ( = ?auto_897594 ?auto_897598 ) ) ( not ( = ?auto_897594 ?auto_897600 ) ) ( not ( = ?auto_897594 ?auto_897601 ) ) ( not ( = ?auto_897594 ?auto_897602 ) ) ( not ( = ?auto_897594 ?auto_897603 ) ) ( not ( = ?auto_897594 ?auto_897604 ) ) ( not ( = ?auto_897594 ?auto_897605 ) ) ( not ( = ?auto_897594 ?auto_897606 ) ) ( not ( = ?auto_897594 ?auto_897610 ) ) ( not ( = ?auto_897595 ?auto_897596 ) ) ( not ( = ?auto_897595 ?auto_897593 ) ) ( not ( = ?auto_897595 ?auto_897597 ) ) ( not ( = ?auto_897595 ?auto_897599 ) ) ( not ( = ?auto_897595 ?auto_897598 ) ) ( not ( = ?auto_897595 ?auto_897600 ) ) ( not ( = ?auto_897595 ?auto_897601 ) ) ( not ( = ?auto_897595 ?auto_897602 ) ) ( not ( = ?auto_897595 ?auto_897603 ) ) ( not ( = ?auto_897595 ?auto_897604 ) ) ( not ( = ?auto_897595 ?auto_897605 ) ) ( not ( = ?auto_897595 ?auto_897606 ) ) ( not ( = ?auto_897595 ?auto_897610 ) ) ( not ( = ?auto_897596 ?auto_897593 ) ) ( not ( = ?auto_897596 ?auto_897597 ) ) ( not ( = ?auto_897596 ?auto_897599 ) ) ( not ( = ?auto_897596 ?auto_897598 ) ) ( not ( = ?auto_897596 ?auto_897600 ) ) ( not ( = ?auto_897596 ?auto_897601 ) ) ( not ( = ?auto_897596 ?auto_897602 ) ) ( not ( = ?auto_897596 ?auto_897603 ) ) ( not ( = ?auto_897596 ?auto_897604 ) ) ( not ( = ?auto_897596 ?auto_897605 ) ) ( not ( = ?auto_897596 ?auto_897606 ) ) ( not ( = ?auto_897596 ?auto_897610 ) ) ( not ( = ?auto_897593 ?auto_897597 ) ) ( not ( = ?auto_897593 ?auto_897599 ) ) ( not ( = ?auto_897593 ?auto_897598 ) ) ( not ( = ?auto_897593 ?auto_897600 ) ) ( not ( = ?auto_897593 ?auto_897601 ) ) ( not ( = ?auto_897593 ?auto_897602 ) ) ( not ( = ?auto_897593 ?auto_897603 ) ) ( not ( = ?auto_897593 ?auto_897604 ) ) ( not ( = ?auto_897593 ?auto_897605 ) ) ( not ( = ?auto_897593 ?auto_897606 ) ) ( not ( = ?auto_897593 ?auto_897610 ) ) ( not ( = ?auto_897597 ?auto_897599 ) ) ( not ( = ?auto_897597 ?auto_897598 ) ) ( not ( = ?auto_897597 ?auto_897600 ) ) ( not ( = ?auto_897597 ?auto_897601 ) ) ( not ( = ?auto_897597 ?auto_897602 ) ) ( not ( = ?auto_897597 ?auto_897603 ) ) ( not ( = ?auto_897597 ?auto_897604 ) ) ( not ( = ?auto_897597 ?auto_897605 ) ) ( not ( = ?auto_897597 ?auto_897606 ) ) ( not ( = ?auto_897597 ?auto_897610 ) ) ( not ( = ?auto_897599 ?auto_897598 ) ) ( not ( = ?auto_897599 ?auto_897600 ) ) ( not ( = ?auto_897599 ?auto_897601 ) ) ( not ( = ?auto_897599 ?auto_897602 ) ) ( not ( = ?auto_897599 ?auto_897603 ) ) ( not ( = ?auto_897599 ?auto_897604 ) ) ( not ( = ?auto_897599 ?auto_897605 ) ) ( not ( = ?auto_897599 ?auto_897606 ) ) ( not ( = ?auto_897599 ?auto_897610 ) ) ( not ( = ?auto_897598 ?auto_897600 ) ) ( not ( = ?auto_897598 ?auto_897601 ) ) ( not ( = ?auto_897598 ?auto_897602 ) ) ( not ( = ?auto_897598 ?auto_897603 ) ) ( not ( = ?auto_897598 ?auto_897604 ) ) ( not ( = ?auto_897598 ?auto_897605 ) ) ( not ( = ?auto_897598 ?auto_897606 ) ) ( not ( = ?auto_897598 ?auto_897610 ) ) ( not ( = ?auto_897600 ?auto_897601 ) ) ( not ( = ?auto_897600 ?auto_897602 ) ) ( not ( = ?auto_897600 ?auto_897603 ) ) ( not ( = ?auto_897600 ?auto_897604 ) ) ( not ( = ?auto_897600 ?auto_897605 ) ) ( not ( = ?auto_897600 ?auto_897606 ) ) ( not ( = ?auto_897600 ?auto_897610 ) ) ( not ( = ?auto_897601 ?auto_897602 ) ) ( not ( = ?auto_897601 ?auto_897603 ) ) ( not ( = ?auto_897601 ?auto_897604 ) ) ( not ( = ?auto_897601 ?auto_897605 ) ) ( not ( = ?auto_897601 ?auto_897606 ) ) ( not ( = ?auto_897601 ?auto_897610 ) ) ( not ( = ?auto_897602 ?auto_897603 ) ) ( not ( = ?auto_897602 ?auto_897604 ) ) ( not ( = ?auto_897602 ?auto_897605 ) ) ( not ( = ?auto_897602 ?auto_897606 ) ) ( not ( = ?auto_897602 ?auto_897610 ) ) ( not ( = ?auto_897603 ?auto_897604 ) ) ( not ( = ?auto_897603 ?auto_897605 ) ) ( not ( = ?auto_897603 ?auto_897606 ) ) ( not ( = ?auto_897603 ?auto_897610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_897604 ?auto_897605 ?auto_897606 )
      ( MAKE-13CRATE-VERIFY ?auto_897594 ?auto_897595 ?auto_897596 ?auto_897593 ?auto_897597 ?auto_897599 ?auto_897598 ?auto_897600 ?auto_897601 ?auto_897602 ?auto_897603 ?auto_897604 ?auto_897605 ?auto_897606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_903747 - SURFACE
      ?auto_903748 - SURFACE
    )
    :vars
    (
      ?auto_903750 - HOIST
      ?auto_903749 - PLACE
      ?auto_903751 - SURFACE
      ?auto_903755 - PLACE
      ?auto_903754 - HOIST
      ?auto_903752 - SURFACE
      ?auto_903753 - TRUCK
      ?auto_903756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_903750 ?auto_903749 ) ( SURFACE-AT ?auto_903747 ?auto_903749 ) ( CLEAR ?auto_903747 ) ( IS-CRATE ?auto_903748 ) ( not ( = ?auto_903747 ?auto_903748 ) ) ( ON ?auto_903747 ?auto_903751 ) ( not ( = ?auto_903751 ?auto_903747 ) ) ( not ( = ?auto_903751 ?auto_903748 ) ) ( not ( = ?auto_903755 ?auto_903749 ) ) ( HOIST-AT ?auto_903754 ?auto_903755 ) ( not ( = ?auto_903750 ?auto_903754 ) ) ( AVAILABLE ?auto_903754 ) ( SURFACE-AT ?auto_903748 ?auto_903755 ) ( ON ?auto_903748 ?auto_903752 ) ( CLEAR ?auto_903748 ) ( not ( = ?auto_903747 ?auto_903752 ) ) ( not ( = ?auto_903748 ?auto_903752 ) ) ( not ( = ?auto_903751 ?auto_903752 ) ) ( TRUCK-AT ?auto_903753 ?auto_903749 ) ( LIFTING ?auto_903750 ?auto_903756 ) ( IS-CRATE ?auto_903756 ) ( not ( = ?auto_903747 ?auto_903756 ) ) ( not ( = ?auto_903748 ?auto_903756 ) ) ( not ( = ?auto_903751 ?auto_903756 ) ) ( not ( = ?auto_903752 ?auto_903756 ) ) )
    :subtasks
    ( ( !LOAD ?auto_903750 ?auto_903756 ?auto_903753 ?auto_903749 )
      ( MAKE-1CRATE ?auto_903747 ?auto_903748 )
      ( MAKE-1CRATE-VERIFY ?auto_903747 ?auto_903748 ) )
  )

)

