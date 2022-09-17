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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_494 - SURFACE
      ?auto_495 - SURFACE
    )
    :vars
    (
      ?auto_496 - HOIST
      ?auto_497 - PLACE
      ?auto_499 - PLACE
      ?auto_500 - HOIST
      ?auto_501 - SURFACE
      ?auto_498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_496 ?auto_497 ) ( SURFACE-AT ?auto_494 ?auto_497 ) ( CLEAR ?auto_494 ) ( IS-CRATE ?auto_495 ) ( AVAILABLE ?auto_496 ) ( not ( = ?auto_499 ?auto_497 ) ) ( HOIST-AT ?auto_500 ?auto_499 ) ( AVAILABLE ?auto_500 ) ( SURFACE-AT ?auto_495 ?auto_499 ) ( ON ?auto_495 ?auto_501 ) ( CLEAR ?auto_495 ) ( TRUCK-AT ?auto_498 ?auto_497 ) ( not ( = ?auto_494 ?auto_495 ) ) ( not ( = ?auto_494 ?auto_501 ) ) ( not ( = ?auto_495 ?auto_501 ) ) ( not ( = ?auto_496 ?auto_500 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_498 ?auto_497 ?auto_499 )
      ( !LIFT ?auto_500 ?auto_495 ?auto_501 ?auto_499 )
      ( !LOAD ?auto_500 ?auto_495 ?auto_498 ?auto_499 )
      ( !DRIVE ?auto_498 ?auto_499 ?auto_497 )
      ( !UNLOAD ?auto_496 ?auto_495 ?auto_498 ?auto_497 )
      ( !DROP ?auto_496 ?auto_495 ?auto_494 ?auto_497 )
      ( MAKE-1CRATE-VERIFY ?auto_494 ?auto_495 ) )
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
      ?auto_509 - HOIST
      ?auto_512 - PLACE
      ?auto_513 - PLACE
      ?auto_510 - HOIST
      ?auto_508 - SURFACE
      ?auto_514 - PLACE
      ?auto_516 - HOIST
      ?auto_515 - SURFACE
      ?auto_511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_509 ?auto_512 ) ( IS-CRATE ?auto_507 ) ( not ( = ?auto_513 ?auto_512 ) ) ( HOIST-AT ?auto_510 ?auto_513 ) ( AVAILABLE ?auto_510 ) ( SURFACE-AT ?auto_507 ?auto_513 ) ( ON ?auto_507 ?auto_508 ) ( CLEAR ?auto_507 ) ( not ( = ?auto_506 ?auto_507 ) ) ( not ( = ?auto_506 ?auto_508 ) ) ( not ( = ?auto_507 ?auto_508 ) ) ( not ( = ?auto_509 ?auto_510 ) ) ( SURFACE-AT ?auto_505 ?auto_512 ) ( CLEAR ?auto_505 ) ( IS-CRATE ?auto_506 ) ( AVAILABLE ?auto_509 ) ( not ( = ?auto_514 ?auto_512 ) ) ( HOIST-AT ?auto_516 ?auto_514 ) ( AVAILABLE ?auto_516 ) ( SURFACE-AT ?auto_506 ?auto_514 ) ( ON ?auto_506 ?auto_515 ) ( CLEAR ?auto_506 ) ( TRUCK-AT ?auto_511 ?auto_512 ) ( not ( = ?auto_505 ?auto_506 ) ) ( not ( = ?auto_505 ?auto_515 ) ) ( not ( = ?auto_506 ?auto_515 ) ) ( not ( = ?auto_509 ?auto_516 ) ) ( not ( = ?auto_505 ?auto_507 ) ) ( not ( = ?auto_505 ?auto_508 ) ) ( not ( = ?auto_507 ?auto_515 ) ) ( not ( = ?auto_513 ?auto_514 ) ) ( not ( = ?auto_510 ?auto_516 ) ) ( not ( = ?auto_508 ?auto_515 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_505 ?auto_506 )
      ( MAKE-1CRATE ?auto_506 ?auto_507 )
      ( MAKE-2CRATE-VERIFY ?auto_505 ?auto_506 ?auto_507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_519 - SURFACE
      ?auto_520 - SURFACE
    )
    :vars
    (
      ?auto_521 - HOIST
      ?auto_522 - PLACE
      ?auto_524 - PLACE
      ?auto_525 - HOIST
      ?auto_526 - SURFACE
      ?auto_523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_521 ?auto_522 ) ( SURFACE-AT ?auto_519 ?auto_522 ) ( CLEAR ?auto_519 ) ( IS-CRATE ?auto_520 ) ( AVAILABLE ?auto_521 ) ( not ( = ?auto_524 ?auto_522 ) ) ( HOIST-AT ?auto_525 ?auto_524 ) ( AVAILABLE ?auto_525 ) ( SURFACE-AT ?auto_520 ?auto_524 ) ( ON ?auto_520 ?auto_526 ) ( CLEAR ?auto_520 ) ( TRUCK-AT ?auto_523 ?auto_522 ) ( not ( = ?auto_519 ?auto_520 ) ) ( not ( = ?auto_519 ?auto_526 ) ) ( not ( = ?auto_520 ?auto_526 ) ) ( not ( = ?auto_521 ?auto_525 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_523 ?auto_522 ?auto_524 )
      ( !LIFT ?auto_525 ?auto_520 ?auto_526 ?auto_524 )
      ( !LOAD ?auto_525 ?auto_520 ?auto_523 ?auto_524 )
      ( !DRIVE ?auto_523 ?auto_524 ?auto_522 )
      ( !UNLOAD ?auto_521 ?auto_520 ?auto_523 ?auto_522 )
      ( !DROP ?auto_521 ?auto_520 ?auto_519 ?auto_522 )
      ( MAKE-1CRATE-VERIFY ?auto_519 ?auto_520 ) )
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
      ?auto_546 - PLACE
      ?auto_541 - HOIST
      ?auto_545 - SURFACE
      ?auto_542 - PLACE
      ?auto_544 - HOIST
      ?auto_543 - SURFACE
      ?auto_538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_540 ?auto_539 ) ( IS-CRATE ?auto_534 ) ( not ( = ?auto_535 ?auto_539 ) ) ( HOIST-AT ?auto_537 ?auto_535 ) ( AVAILABLE ?auto_537 ) ( SURFACE-AT ?auto_534 ?auto_535 ) ( ON ?auto_534 ?auto_536 ) ( CLEAR ?auto_534 ) ( not ( = ?auto_533 ?auto_534 ) ) ( not ( = ?auto_533 ?auto_536 ) ) ( not ( = ?auto_534 ?auto_536 ) ) ( not ( = ?auto_540 ?auto_537 ) ) ( IS-CRATE ?auto_533 ) ( not ( = ?auto_546 ?auto_539 ) ) ( HOIST-AT ?auto_541 ?auto_546 ) ( AVAILABLE ?auto_541 ) ( SURFACE-AT ?auto_533 ?auto_546 ) ( ON ?auto_533 ?auto_545 ) ( CLEAR ?auto_533 ) ( not ( = ?auto_532 ?auto_533 ) ) ( not ( = ?auto_532 ?auto_545 ) ) ( not ( = ?auto_533 ?auto_545 ) ) ( not ( = ?auto_540 ?auto_541 ) ) ( SURFACE-AT ?auto_531 ?auto_539 ) ( CLEAR ?auto_531 ) ( IS-CRATE ?auto_532 ) ( AVAILABLE ?auto_540 ) ( not ( = ?auto_542 ?auto_539 ) ) ( HOIST-AT ?auto_544 ?auto_542 ) ( AVAILABLE ?auto_544 ) ( SURFACE-AT ?auto_532 ?auto_542 ) ( ON ?auto_532 ?auto_543 ) ( CLEAR ?auto_532 ) ( TRUCK-AT ?auto_538 ?auto_539 ) ( not ( = ?auto_531 ?auto_532 ) ) ( not ( = ?auto_531 ?auto_543 ) ) ( not ( = ?auto_532 ?auto_543 ) ) ( not ( = ?auto_540 ?auto_544 ) ) ( not ( = ?auto_531 ?auto_533 ) ) ( not ( = ?auto_531 ?auto_545 ) ) ( not ( = ?auto_533 ?auto_543 ) ) ( not ( = ?auto_546 ?auto_542 ) ) ( not ( = ?auto_541 ?auto_544 ) ) ( not ( = ?auto_545 ?auto_543 ) ) ( not ( = ?auto_531 ?auto_534 ) ) ( not ( = ?auto_531 ?auto_536 ) ) ( not ( = ?auto_532 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_536 ) ) ( not ( = ?auto_534 ?auto_545 ) ) ( not ( = ?auto_534 ?auto_543 ) ) ( not ( = ?auto_535 ?auto_546 ) ) ( not ( = ?auto_535 ?auto_542 ) ) ( not ( = ?auto_537 ?auto_541 ) ) ( not ( = ?auto_537 ?auto_544 ) ) ( not ( = ?auto_536 ?auto_545 ) ) ( not ( = ?auto_536 ?auto_543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531 ?auto_532 ?auto_533 )
      ( MAKE-1CRATE ?auto_533 ?auto_534 )
      ( MAKE-3CRATE-VERIFY ?auto_531 ?auto_532 ?auto_533 ?auto_534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_549 - SURFACE
      ?auto_550 - SURFACE
    )
    :vars
    (
      ?auto_551 - HOIST
      ?auto_552 - PLACE
      ?auto_554 - PLACE
      ?auto_555 - HOIST
      ?auto_556 - SURFACE
      ?auto_553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_551 ?auto_552 ) ( SURFACE-AT ?auto_549 ?auto_552 ) ( CLEAR ?auto_549 ) ( IS-CRATE ?auto_550 ) ( AVAILABLE ?auto_551 ) ( not ( = ?auto_554 ?auto_552 ) ) ( HOIST-AT ?auto_555 ?auto_554 ) ( AVAILABLE ?auto_555 ) ( SURFACE-AT ?auto_550 ?auto_554 ) ( ON ?auto_550 ?auto_556 ) ( CLEAR ?auto_550 ) ( TRUCK-AT ?auto_553 ?auto_552 ) ( not ( = ?auto_549 ?auto_550 ) ) ( not ( = ?auto_549 ?auto_556 ) ) ( not ( = ?auto_550 ?auto_556 ) ) ( not ( = ?auto_551 ?auto_555 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_553 ?auto_552 ?auto_554 )
      ( !LIFT ?auto_555 ?auto_550 ?auto_556 ?auto_554 )
      ( !LOAD ?auto_555 ?auto_550 ?auto_553 ?auto_554 )
      ( !DRIVE ?auto_553 ?auto_554 ?auto_552 )
      ( !UNLOAD ?auto_551 ?auto_550 ?auto_553 ?auto_552 )
      ( !DROP ?auto_551 ?auto_550 ?auto_549 ?auto_552 )
      ( MAKE-1CRATE-VERIFY ?auto_549 ?auto_550 ) )
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
      ?auto_567 - HOIST
      ?auto_570 - PLACE
      ?auto_571 - PLACE
      ?auto_569 - HOIST
      ?auto_568 - SURFACE
      ?auto_573 - PLACE
      ?auto_574 - HOIST
      ?auto_578 - SURFACE
      ?auto_575 - PLACE
      ?auto_579 - HOIST
      ?auto_577 - SURFACE
      ?auto_576 - SURFACE
      ?auto_572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_567 ?auto_570 ) ( IS-CRATE ?auto_566 ) ( not ( = ?auto_571 ?auto_570 ) ) ( HOIST-AT ?auto_569 ?auto_571 ) ( SURFACE-AT ?auto_566 ?auto_571 ) ( ON ?auto_566 ?auto_568 ) ( CLEAR ?auto_566 ) ( not ( = ?auto_565 ?auto_566 ) ) ( not ( = ?auto_565 ?auto_568 ) ) ( not ( = ?auto_566 ?auto_568 ) ) ( not ( = ?auto_567 ?auto_569 ) ) ( IS-CRATE ?auto_565 ) ( not ( = ?auto_573 ?auto_570 ) ) ( HOIST-AT ?auto_574 ?auto_573 ) ( AVAILABLE ?auto_574 ) ( SURFACE-AT ?auto_565 ?auto_573 ) ( ON ?auto_565 ?auto_578 ) ( CLEAR ?auto_565 ) ( not ( = ?auto_564 ?auto_565 ) ) ( not ( = ?auto_564 ?auto_578 ) ) ( not ( = ?auto_565 ?auto_578 ) ) ( not ( = ?auto_567 ?auto_574 ) ) ( IS-CRATE ?auto_564 ) ( not ( = ?auto_575 ?auto_570 ) ) ( HOIST-AT ?auto_579 ?auto_575 ) ( AVAILABLE ?auto_579 ) ( SURFACE-AT ?auto_564 ?auto_575 ) ( ON ?auto_564 ?auto_577 ) ( CLEAR ?auto_564 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_577 ) ) ( not ( = ?auto_564 ?auto_577 ) ) ( not ( = ?auto_567 ?auto_579 ) ) ( SURFACE-AT ?auto_562 ?auto_570 ) ( CLEAR ?auto_562 ) ( IS-CRATE ?auto_563 ) ( AVAILABLE ?auto_567 ) ( AVAILABLE ?auto_569 ) ( SURFACE-AT ?auto_563 ?auto_571 ) ( ON ?auto_563 ?auto_576 ) ( CLEAR ?auto_563 ) ( TRUCK-AT ?auto_572 ?auto_570 ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_576 ) ) ( not ( = ?auto_563 ?auto_576 ) ) ( not ( = ?auto_562 ?auto_564 ) ) ( not ( = ?auto_562 ?auto_577 ) ) ( not ( = ?auto_564 ?auto_576 ) ) ( not ( = ?auto_575 ?auto_571 ) ) ( not ( = ?auto_579 ?auto_569 ) ) ( not ( = ?auto_577 ?auto_576 ) ) ( not ( = ?auto_562 ?auto_565 ) ) ( not ( = ?auto_562 ?auto_578 ) ) ( not ( = ?auto_563 ?auto_565 ) ) ( not ( = ?auto_563 ?auto_578 ) ) ( not ( = ?auto_565 ?auto_577 ) ) ( not ( = ?auto_565 ?auto_576 ) ) ( not ( = ?auto_573 ?auto_575 ) ) ( not ( = ?auto_573 ?auto_571 ) ) ( not ( = ?auto_574 ?auto_579 ) ) ( not ( = ?auto_574 ?auto_569 ) ) ( not ( = ?auto_578 ?auto_577 ) ) ( not ( = ?auto_578 ?auto_576 ) ) ( not ( = ?auto_562 ?auto_566 ) ) ( not ( = ?auto_562 ?auto_568 ) ) ( not ( = ?auto_563 ?auto_566 ) ) ( not ( = ?auto_563 ?auto_568 ) ) ( not ( = ?auto_564 ?auto_566 ) ) ( not ( = ?auto_564 ?auto_568 ) ) ( not ( = ?auto_566 ?auto_578 ) ) ( not ( = ?auto_566 ?auto_577 ) ) ( not ( = ?auto_566 ?auto_576 ) ) ( not ( = ?auto_568 ?auto_578 ) ) ( not ( = ?auto_568 ?auto_577 ) ) ( not ( = ?auto_568 ?auto_576 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_562 ?auto_563 ?auto_564 ?auto_565 )
      ( MAKE-1CRATE ?auto_565 ?auto_566 )
      ( MAKE-4CRATE-VERIFY ?auto_562 ?auto_563 ?auto_564 ?auto_565 ?auto_566 ) )
  )

)

