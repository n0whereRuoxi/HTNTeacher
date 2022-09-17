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
      ?auto_552 - SURFACE
      ?auto_553 - SURFACE
    )
    :vars
    (
      ?auto_554 - HOIST
      ?auto_555 - PLACE
      ?auto_557 - PLACE
      ?auto_558 - HOIST
      ?auto_559 - SURFACE
      ?auto_556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554 ?auto_555 ) ( SURFACE-AT ?auto_553 ?auto_555 ) ( CLEAR ?auto_553 ) ( IS-CRATE ?auto_552 ) ( AVAILABLE ?auto_554 ) ( not ( = ?auto_557 ?auto_555 ) ) ( HOIST-AT ?auto_558 ?auto_557 ) ( AVAILABLE ?auto_558 ) ( SURFACE-AT ?auto_552 ?auto_557 ) ( ON ?auto_552 ?auto_559 ) ( CLEAR ?auto_552 ) ( TRUCK-AT ?auto_556 ?auto_555 ) ( not ( = ?auto_552 ?auto_553 ) ) ( not ( = ?auto_552 ?auto_559 ) ) ( not ( = ?auto_553 ?auto_559 ) ) ( not ( = ?auto_554 ?auto_558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_556 ?auto_555 ?auto_557 )
      ( !LIFT ?auto_558 ?auto_552 ?auto_559 ?auto_557 )
      ( !LOAD ?auto_558 ?auto_552 ?auto_556 ?auto_557 )
      ( !DRIVE ?auto_556 ?auto_557 ?auto_555 )
      ( !UNLOAD ?auto_554 ?auto_552 ?auto_556 ?auto_555 )
      ( !DROP ?auto_554 ?auto_552 ?auto_553 ?auto_555 )
      ( MAKE-ON-VERIFY ?auto_552 ?auto_553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_562 - SURFACE
      ?auto_563 - SURFACE
    )
    :vars
    (
      ?auto_564 - HOIST
      ?auto_565 - PLACE
      ?auto_567 - PLACE
      ?auto_568 - HOIST
      ?auto_569 - SURFACE
      ?auto_566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564 ?auto_565 ) ( SURFACE-AT ?auto_563 ?auto_565 ) ( CLEAR ?auto_563 ) ( IS-CRATE ?auto_562 ) ( AVAILABLE ?auto_564 ) ( not ( = ?auto_567 ?auto_565 ) ) ( HOIST-AT ?auto_568 ?auto_567 ) ( AVAILABLE ?auto_568 ) ( SURFACE-AT ?auto_562 ?auto_567 ) ( ON ?auto_562 ?auto_569 ) ( CLEAR ?auto_562 ) ( TRUCK-AT ?auto_566 ?auto_565 ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_569 ) ) ( not ( = ?auto_563 ?auto_569 ) ) ( not ( = ?auto_564 ?auto_568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_566 ?auto_565 ?auto_567 )
      ( !LIFT ?auto_568 ?auto_562 ?auto_569 ?auto_567 )
      ( !LOAD ?auto_568 ?auto_562 ?auto_566 ?auto_567 )
      ( !DRIVE ?auto_566 ?auto_567 ?auto_565 )
      ( !UNLOAD ?auto_564 ?auto_562 ?auto_566 ?auto_565 )
      ( !DROP ?auto_564 ?auto_562 ?auto_563 ?auto_565 )
      ( MAKE-ON-VERIFY ?auto_562 ?auto_563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_572 - SURFACE
      ?auto_573 - SURFACE
    )
    :vars
    (
      ?auto_574 - HOIST
      ?auto_575 - PLACE
      ?auto_577 - PLACE
      ?auto_578 - HOIST
      ?auto_579 - SURFACE
      ?auto_576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_574 ?auto_575 ) ( SURFACE-AT ?auto_573 ?auto_575 ) ( CLEAR ?auto_573 ) ( IS-CRATE ?auto_572 ) ( AVAILABLE ?auto_574 ) ( not ( = ?auto_577 ?auto_575 ) ) ( HOIST-AT ?auto_578 ?auto_577 ) ( AVAILABLE ?auto_578 ) ( SURFACE-AT ?auto_572 ?auto_577 ) ( ON ?auto_572 ?auto_579 ) ( CLEAR ?auto_572 ) ( TRUCK-AT ?auto_576 ?auto_575 ) ( not ( = ?auto_572 ?auto_573 ) ) ( not ( = ?auto_572 ?auto_579 ) ) ( not ( = ?auto_573 ?auto_579 ) ) ( not ( = ?auto_574 ?auto_578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_576 ?auto_575 ?auto_577 )
      ( !LIFT ?auto_578 ?auto_572 ?auto_579 ?auto_577 )
      ( !LOAD ?auto_578 ?auto_572 ?auto_576 ?auto_577 )
      ( !DRIVE ?auto_576 ?auto_577 ?auto_575 )
      ( !UNLOAD ?auto_574 ?auto_572 ?auto_576 ?auto_575 )
      ( !DROP ?auto_574 ?auto_572 ?auto_573 ?auto_575 )
      ( MAKE-ON-VERIFY ?auto_572 ?auto_573 ) )
  )

  ( :method MAKE-ON
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
    ( and ( HOIST-AT ?auto_584 ?auto_585 ) ( SURFACE-AT ?auto_583 ?auto_585 ) ( CLEAR ?auto_583 ) ( IS-CRATE ?auto_582 ) ( AVAILABLE ?auto_584 ) ( not ( = ?auto_587 ?auto_585 ) ) ( HOIST-AT ?auto_588 ?auto_587 ) ( AVAILABLE ?auto_588 ) ( SURFACE-AT ?auto_582 ?auto_587 ) ( ON ?auto_582 ?auto_589 ) ( CLEAR ?auto_582 ) ( TRUCK-AT ?auto_586 ?auto_585 ) ( not ( = ?auto_582 ?auto_583 ) ) ( not ( = ?auto_582 ?auto_589 ) ) ( not ( = ?auto_583 ?auto_589 ) ) ( not ( = ?auto_584 ?auto_588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_586 ?auto_585 ?auto_587 )
      ( !LIFT ?auto_588 ?auto_582 ?auto_589 ?auto_587 )
      ( !LOAD ?auto_588 ?auto_582 ?auto_586 ?auto_587 )
      ( !DRIVE ?auto_586 ?auto_587 ?auto_585 )
      ( !UNLOAD ?auto_584 ?auto_582 ?auto_586 ?auto_585 )
      ( !DROP ?auto_584 ?auto_582 ?auto_583 ?auto_585 )
      ( MAKE-ON-VERIFY ?auto_582 ?auto_583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_592 - SURFACE
      ?auto_593 - SURFACE
    )
    :vars
    (
      ?auto_594 - HOIST
      ?auto_595 - PLACE
      ?auto_597 - PLACE
      ?auto_598 - HOIST
      ?auto_599 - SURFACE
      ?auto_596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594 ?auto_595 ) ( SURFACE-AT ?auto_593 ?auto_595 ) ( CLEAR ?auto_593 ) ( IS-CRATE ?auto_592 ) ( AVAILABLE ?auto_594 ) ( not ( = ?auto_597 ?auto_595 ) ) ( HOIST-AT ?auto_598 ?auto_597 ) ( AVAILABLE ?auto_598 ) ( SURFACE-AT ?auto_592 ?auto_597 ) ( ON ?auto_592 ?auto_599 ) ( CLEAR ?auto_592 ) ( TRUCK-AT ?auto_596 ?auto_595 ) ( not ( = ?auto_592 ?auto_593 ) ) ( not ( = ?auto_592 ?auto_599 ) ) ( not ( = ?auto_593 ?auto_599 ) ) ( not ( = ?auto_594 ?auto_598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_596 ?auto_595 ?auto_597 )
      ( !LIFT ?auto_598 ?auto_592 ?auto_599 ?auto_597 )
      ( !LOAD ?auto_598 ?auto_592 ?auto_596 ?auto_597 )
      ( !DRIVE ?auto_596 ?auto_597 ?auto_595 )
      ( !UNLOAD ?auto_594 ?auto_592 ?auto_596 ?auto_595 )
      ( !DROP ?auto_594 ?auto_592 ?auto_593 ?auto_595 )
      ( MAKE-ON-VERIFY ?auto_592 ?auto_593 ) )
  )

)

