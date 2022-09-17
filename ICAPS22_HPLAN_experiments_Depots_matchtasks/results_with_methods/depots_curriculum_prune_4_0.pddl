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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_484 - SURFACE
      ?auto_485 - SURFACE
    )
    :vars
    (
      ?auto_486 - HOIST
      ?auto_487 - PLACE
      ?auto_489 - PLACE
      ?auto_490 - HOIST
      ?auto_491 - SURFACE
      ?auto_488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_486 ?auto_487 ) ( SURFACE-AT ?auto_484 ?auto_487 ) ( CLEAR ?auto_484 ) ( IS-CRATE ?auto_485 ) ( AVAILABLE ?auto_486 ) ( not ( = ?auto_489 ?auto_487 ) ) ( HOIST-AT ?auto_490 ?auto_489 ) ( AVAILABLE ?auto_490 ) ( SURFACE-AT ?auto_485 ?auto_489 ) ( ON ?auto_485 ?auto_491 ) ( CLEAR ?auto_485 ) ( TRUCK-AT ?auto_488 ?auto_487 ) ( not ( = ?auto_484 ?auto_485 ) ) ( not ( = ?auto_484 ?auto_491 ) ) ( not ( = ?auto_485 ?auto_491 ) ) ( not ( = ?auto_486 ?auto_490 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_488 ?auto_487 ?auto_489 )
      ( !LIFT ?auto_490 ?auto_485 ?auto_491 ?auto_489 )
      ( !LOAD ?auto_490 ?auto_485 ?auto_488 ?auto_489 )
      ( !DRIVE ?auto_488 ?auto_489 ?auto_487 )
      ( !UNLOAD ?auto_486 ?auto_485 ?auto_488 ?auto_487 )
      ( !DROP ?auto_486 ?auto_485 ?auto_484 ?auto_487 )
      ( MAKE-1CRATE-VERIFY ?auto_484 ?auto_485 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_505 - SURFACE
      ?auto_506 - SURFACE
      ?auto_507 - SURFACE
    )
    :vars
    (
      ?auto_511 - HOIST
      ?auto_513 - PLACE
      ?auto_508 - PLACE
      ?auto_509 - HOIST
      ?auto_512 - SURFACE
      ?auto_514 - PLACE
      ?auto_516 - HOIST
      ?auto_515 - SURFACE
      ?auto_510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_511 ?auto_513 ) ( IS-CRATE ?auto_507 ) ( not ( = ?auto_508 ?auto_513 ) ) ( HOIST-AT ?auto_509 ?auto_508 ) ( AVAILABLE ?auto_509 ) ( SURFACE-AT ?auto_507 ?auto_508 ) ( ON ?auto_507 ?auto_512 ) ( CLEAR ?auto_507 ) ( not ( = ?auto_506 ?auto_507 ) ) ( not ( = ?auto_506 ?auto_512 ) ) ( not ( = ?auto_507 ?auto_512 ) ) ( not ( = ?auto_511 ?auto_509 ) ) ( SURFACE-AT ?auto_505 ?auto_513 ) ( CLEAR ?auto_505 ) ( IS-CRATE ?auto_506 ) ( AVAILABLE ?auto_511 ) ( not ( = ?auto_514 ?auto_513 ) ) ( HOIST-AT ?auto_516 ?auto_514 ) ( AVAILABLE ?auto_516 ) ( SURFACE-AT ?auto_506 ?auto_514 ) ( ON ?auto_506 ?auto_515 ) ( CLEAR ?auto_506 ) ( TRUCK-AT ?auto_510 ?auto_513 ) ( not ( = ?auto_505 ?auto_506 ) ) ( not ( = ?auto_505 ?auto_515 ) ) ( not ( = ?auto_506 ?auto_515 ) ) ( not ( = ?auto_511 ?auto_516 ) ) ( not ( = ?auto_505 ?auto_507 ) ) ( not ( = ?auto_505 ?auto_512 ) ) ( not ( = ?auto_507 ?auto_515 ) ) ( not ( = ?auto_508 ?auto_514 ) ) ( not ( = ?auto_509 ?auto_516 ) ) ( not ( = ?auto_512 ?auto_515 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_505 ?auto_506 )
      ( MAKE-1CRATE ?auto_506 ?auto_507 )
      ( MAKE-2CRATE-VERIFY ?auto_505 ?auto_506 ?auto_507 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_531 - SURFACE
      ?auto_532 - SURFACE
      ?auto_533 - SURFACE
      ?auto_534 - SURFACE
    )
    :vars
    (
      ?auto_540 - HOIST
      ?auto_539 - PLACE
      ?auto_535 - PLACE
      ?auto_537 - HOIST
      ?auto_536 - SURFACE
      ?auto_542 - PLACE
      ?auto_546 - HOIST
      ?auto_545 - SURFACE
      ?auto_543 - PLACE
      ?auto_544 - HOIST
      ?auto_541 - SURFACE
      ?auto_538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_540 ?auto_539 ) ( IS-CRATE ?auto_534 ) ( not ( = ?auto_535 ?auto_539 ) ) ( HOIST-AT ?auto_537 ?auto_535 ) ( AVAILABLE ?auto_537 ) ( SURFACE-AT ?auto_534 ?auto_535 ) ( ON ?auto_534 ?auto_536 ) ( CLEAR ?auto_534 ) ( not ( = ?auto_533 ?auto_534 ) ) ( not ( = ?auto_533 ?auto_536 ) ) ( not ( = ?auto_534 ?auto_536 ) ) ( not ( = ?auto_540 ?auto_537 ) ) ( IS-CRATE ?auto_533 ) ( not ( = ?auto_542 ?auto_539 ) ) ( HOIST-AT ?auto_546 ?auto_542 ) ( AVAILABLE ?auto_546 ) ( SURFACE-AT ?auto_533 ?auto_542 ) ( ON ?auto_533 ?auto_545 ) ( CLEAR ?auto_533 ) ( not ( = ?auto_532 ?auto_533 ) ) ( not ( = ?auto_532 ?auto_545 ) ) ( not ( = ?auto_533 ?auto_545 ) ) ( not ( = ?auto_540 ?auto_546 ) ) ( SURFACE-AT ?auto_531 ?auto_539 ) ( CLEAR ?auto_531 ) ( IS-CRATE ?auto_532 ) ( AVAILABLE ?auto_540 ) ( not ( = ?auto_543 ?auto_539 ) ) ( HOIST-AT ?auto_544 ?auto_543 ) ( AVAILABLE ?auto_544 ) ( SURFACE-AT ?auto_532 ?auto_543 ) ( ON ?auto_532 ?auto_541 ) ( CLEAR ?auto_532 ) ( TRUCK-AT ?auto_538 ?auto_539 ) ( not ( = ?auto_531 ?auto_532 ) ) ( not ( = ?auto_531 ?auto_541 ) ) ( not ( = ?auto_532 ?auto_541 ) ) ( not ( = ?auto_540 ?auto_544 ) ) ( not ( = ?auto_531 ?auto_533 ) ) ( not ( = ?auto_531 ?auto_545 ) ) ( not ( = ?auto_533 ?auto_541 ) ) ( not ( = ?auto_542 ?auto_543 ) ) ( not ( = ?auto_546 ?auto_544 ) ) ( not ( = ?auto_545 ?auto_541 ) ) ( not ( = ?auto_531 ?auto_534 ) ) ( not ( = ?auto_531 ?auto_536 ) ) ( not ( = ?auto_532 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_536 ) ) ( not ( = ?auto_534 ?auto_545 ) ) ( not ( = ?auto_534 ?auto_541 ) ) ( not ( = ?auto_535 ?auto_542 ) ) ( not ( = ?auto_535 ?auto_543 ) ) ( not ( = ?auto_537 ?auto_546 ) ) ( not ( = ?auto_537 ?auto_544 ) ) ( not ( = ?auto_536 ?auto_545 ) ) ( not ( = ?auto_536 ?auto_541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531 ?auto_532 ?auto_533 )
      ( MAKE-1CRATE ?auto_533 ?auto_534 )
      ( MAKE-3CRATE-VERIFY ?auto_531 ?auto_532 ?auto_533 ?auto_534 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_562 - SURFACE
      ?auto_563 - SURFACE
      ?auto_564 - SURFACE
      ?auto_565 - SURFACE
      ?auto_566 - SURFACE
    )
    :vars
    (
      ?auto_568 - HOIST
      ?auto_571 - PLACE
      ?auto_567 - PLACE
      ?auto_572 - HOIST
      ?auto_570 - SURFACE
      ?auto_574 - PLACE
      ?auto_573 - HOIST
      ?auto_575 - SURFACE
      ?auto_579 - PLACE
      ?auto_576 - HOIST
      ?auto_577 - SURFACE
      ?auto_578 - SURFACE
      ?auto_569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568 ?auto_571 ) ( IS-CRATE ?auto_566 ) ( not ( = ?auto_567 ?auto_571 ) ) ( HOIST-AT ?auto_572 ?auto_567 ) ( SURFACE-AT ?auto_566 ?auto_567 ) ( ON ?auto_566 ?auto_570 ) ( CLEAR ?auto_566 ) ( not ( = ?auto_565 ?auto_566 ) ) ( not ( = ?auto_565 ?auto_570 ) ) ( not ( = ?auto_566 ?auto_570 ) ) ( not ( = ?auto_568 ?auto_572 ) ) ( IS-CRATE ?auto_565 ) ( not ( = ?auto_574 ?auto_571 ) ) ( HOIST-AT ?auto_573 ?auto_574 ) ( AVAILABLE ?auto_573 ) ( SURFACE-AT ?auto_565 ?auto_574 ) ( ON ?auto_565 ?auto_575 ) ( CLEAR ?auto_565 ) ( not ( = ?auto_564 ?auto_565 ) ) ( not ( = ?auto_564 ?auto_575 ) ) ( not ( = ?auto_565 ?auto_575 ) ) ( not ( = ?auto_568 ?auto_573 ) ) ( IS-CRATE ?auto_564 ) ( not ( = ?auto_579 ?auto_571 ) ) ( HOIST-AT ?auto_576 ?auto_579 ) ( AVAILABLE ?auto_576 ) ( SURFACE-AT ?auto_564 ?auto_579 ) ( ON ?auto_564 ?auto_577 ) ( CLEAR ?auto_564 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_577 ) ) ( not ( = ?auto_564 ?auto_577 ) ) ( not ( = ?auto_568 ?auto_576 ) ) ( SURFACE-AT ?auto_562 ?auto_571 ) ( CLEAR ?auto_562 ) ( IS-CRATE ?auto_563 ) ( AVAILABLE ?auto_568 ) ( AVAILABLE ?auto_572 ) ( SURFACE-AT ?auto_563 ?auto_567 ) ( ON ?auto_563 ?auto_578 ) ( CLEAR ?auto_563 ) ( TRUCK-AT ?auto_569 ?auto_571 ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_578 ) ) ( not ( = ?auto_563 ?auto_578 ) ) ( not ( = ?auto_562 ?auto_564 ) ) ( not ( = ?auto_562 ?auto_577 ) ) ( not ( = ?auto_564 ?auto_578 ) ) ( not ( = ?auto_579 ?auto_567 ) ) ( not ( = ?auto_576 ?auto_572 ) ) ( not ( = ?auto_577 ?auto_578 ) ) ( not ( = ?auto_562 ?auto_565 ) ) ( not ( = ?auto_562 ?auto_575 ) ) ( not ( = ?auto_563 ?auto_565 ) ) ( not ( = ?auto_563 ?auto_575 ) ) ( not ( = ?auto_565 ?auto_577 ) ) ( not ( = ?auto_565 ?auto_578 ) ) ( not ( = ?auto_574 ?auto_579 ) ) ( not ( = ?auto_574 ?auto_567 ) ) ( not ( = ?auto_573 ?auto_576 ) ) ( not ( = ?auto_573 ?auto_572 ) ) ( not ( = ?auto_575 ?auto_577 ) ) ( not ( = ?auto_575 ?auto_578 ) ) ( not ( = ?auto_562 ?auto_566 ) ) ( not ( = ?auto_562 ?auto_570 ) ) ( not ( = ?auto_563 ?auto_566 ) ) ( not ( = ?auto_563 ?auto_570 ) ) ( not ( = ?auto_564 ?auto_566 ) ) ( not ( = ?auto_564 ?auto_570 ) ) ( not ( = ?auto_566 ?auto_575 ) ) ( not ( = ?auto_566 ?auto_577 ) ) ( not ( = ?auto_566 ?auto_578 ) ) ( not ( = ?auto_570 ?auto_575 ) ) ( not ( = ?auto_570 ?auto_577 ) ) ( not ( = ?auto_570 ?auto_578 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_562 ?auto_563 ?auto_564 ?auto_565 )
      ( MAKE-1CRATE ?auto_565 ?auto_566 )
      ( MAKE-4CRATE-VERIFY ?auto_562 ?auto_563 ?auto_564 ?auto_565 ?auto_566 ) )
  )

)

