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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_450 - SURFACE
      ?auto_451 - SURFACE
    )
    :vars
    (
      ?auto_452 - HOIST
      ?auto_453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_452 ?auto_453 ) ( SURFACE-AT ?auto_450 ?auto_453 ) ( CLEAR ?auto_450 ) ( LIFTING ?auto_452 ?auto_451 ) ( IS-CRATE ?auto_451 ) ( not ( = ?auto_450 ?auto_451 ) ) )
    :subtasks
    ( ( !DROP ?auto_452 ?auto_451 ?auto_450 ?auto_453 )
      ( MAKE-1CRATE-VERIFY ?auto_450 ?auto_451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_454 - SURFACE
      ?auto_455 - SURFACE
    )
    :vars
    (
      ?auto_456 - HOIST
      ?auto_457 - PLACE
      ?auto_458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_456 ?auto_457 ) ( SURFACE-AT ?auto_454 ?auto_457 ) ( CLEAR ?auto_454 ) ( IS-CRATE ?auto_455 ) ( not ( = ?auto_454 ?auto_455 ) ) ( TRUCK-AT ?auto_458 ?auto_457 ) ( AVAILABLE ?auto_456 ) ( IN ?auto_455 ?auto_458 ) )
    :subtasks
    ( ( !UNLOAD ?auto_456 ?auto_455 ?auto_458 ?auto_457 )
      ( MAKE-1CRATE ?auto_454 ?auto_455 )
      ( MAKE-1CRATE-VERIFY ?auto_454 ?auto_455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_459 - SURFACE
      ?auto_460 - SURFACE
    )
    :vars
    (
      ?auto_463 - HOIST
      ?auto_462 - PLACE
      ?auto_461 - TRUCK
      ?auto_464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_463 ?auto_462 ) ( SURFACE-AT ?auto_459 ?auto_462 ) ( CLEAR ?auto_459 ) ( IS-CRATE ?auto_460 ) ( not ( = ?auto_459 ?auto_460 ) ) ( AVAILABLE ?auto_463 ) ( IN ?auto_460 ?auto_461 ) ( TRUCK-AT ?auto_461 ?auto_464 ) ( not ( = ?auto_464 ?auto_462 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_461 ?auto_464 ?auto_462 )
      ( MAKE-1CRATE ?auto_459 ?auto_460 )
      ( MAKE-1CRATE-VERIFY ?auto_459 ?auto_460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_465 - SURFACE
      ?auto_466 - SURFACE
    )
    :vars
    (
      ?auto_467 - HOIST
      ?auto_470 - PLACE
      ?auto_469 - TRUCK
      ?auto_468 - PLACE
      ?auto_471 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_467 ?auto_470 ) ( SURFACE-AT ?auto_465 ?auto_470 ) ( CLEAR ?auto_465 ) ( IS-CRATE ?auto_466 ) ( not ( = ?auto_465 ?auto_466 ) ) ( AVAILABLE ?auto_467 ) ( TRUCK-AT ?auto_469 ?auto_468 ) ( not ( = ?auto_468 ?auto_470 ) ) ( HOIST-AT ?auto_471 ?auto_468 ) ( LIFTING ?auto_471 ?auto_466 ) ( not ( = ?auto_467 ?auto_471 ) ) )
    :subtasks
    ( ( !LOAD ?auto_471 ?auto_466 ?auto_469 ?auto_468 )
      ( MAKE-1CRATE ?auto_465 ?auto_466 )
      ( MAKE-1CRATE-VERIFY ?auto_465 ?auto_466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_472 - SURFACE
      ?auto_473 - SURFACE
    )
    :vars
    (
      ?auto_476 - HOIST
      ?auto_475 - PLACE
      ?auto_474 - TRUCK
      ?auto_477 - PLACE
      ?auto_478 - HOIST
      ?auto_479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_476 ?auto_475 ) ( SURFACE-AT ?auto_472 ?auto_475 ) ( CLEAR ?auto_472 ) ( IS-CRATE ?auto_473 ) ( not ( = ?auto_472 ?auto_473 ) ) ( AVAILABLE ?auto_476 ) ( TRUCK-AT ?auto_474 ?auto_477 ) ( not ( = ?auto_477 ?auto_475 ) ) ( HOIST-AT ?auto_478 ?auto_477 ) ( not ( = ?auto_476 ?auto_478 ) ) ( AVAILABLE ?auto_478 ) ( SURFACE-AT ?auto_473 ?auto_477 ) ( ON ?auto_473 ?auto_479 ) ( CLEAR ?auto_473 ) ( not ( = ?auto_472 ?auto_479 ) ) ( not ( = ?auto_473 ?auto_479 ) ) )
    :subtasks
    ( ( !LIFT ?auto_478 ?auto_473 ?auto_479 ?auto_477 )
      ( MAKE-1CRATE ?auto_472 ?auto_473 )
      ( MAKE-1CRATE-VERIFY ?auto_472 ?auto_473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_480 - SURFACE
      ?auto_481 - SURFACE
    )
    :vars
    (
      ?auto_487 - HOIST
      ?auto_482 - PLACE
      ?auto_483 - PLACE
      ?auto_486 - HOIST
      ?auto_484 - SURFACE
      ?auto_485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_487 ?auto_482 ) ( SURFACE-AT ?auto_480 ?auto_482 ) ( CLEAR ?auto_480 ) ( IS-CRATE ?auto_481 ) ( not ( = ?auto_480 ?auto_481 ) ) ( AVAILABLE ?auto_487 ) ( not ( = ?auto_483 ?auto_482 ) ) ( HOIST-AT ?auto_486 ?auto_483 ) ( not ( = ?auto_487 ?auto_486 ) ) ( AVAILABLE ?auto_486 ) ( SURFACE-AT ?auto_481 ?auto_483 ) ( ON ?auto_481 ?auto_484 ) ( CLEAR ?auto_481 ) ( not ( = ?auto_480 ?auto_484 ) ) ( not ( = ?auto_481 ?auto_484 ) ) ( TRUCK-AT ?auto_485 ?auto_482 ) )
    :subtasks
    ( ( !DRIVE ?auto_485 ?auto_482 ?auto_483 )
      ( MAKE-1CRATE ?auto_480 ?auto_481 )
      ( MAKE-1CRATE-VERIFY ?auto_480 ?auto_481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_497 - SURFACE
      ?auto_498 - SURFACE
      ?auto_499 - SURFACE
    )
    :vars
    (
      ?auto_500 - HOIST
      ?auto_501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_500 ?auto_501 ) ( SURFACE-AT ?auto_498 ?auto_501 ) ( CLEAR ?auto_498 ) ( LIFTING ?auto_500 ?auto_499 ) ( IS-CRATE ?auto_499 ) ( not ( = ?auto_498 ?auto_499 ) ) ( ON ?auto_498 ?auto_497 ) ( not ( = ?auto_497 ?auto_498 ) ) ( not ( = ?auto_497 ?auto_499 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_498 ?auto_499 )
      ( MAKE-2CRATE-VERIFY ?auto_497 ?auto_498 ?auto_499 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_507 - SURFACE
      ?auto_508 - SURFACE
      ?auto_509 - SURFACE
    )
    :vars
    (
      ?auto_511 - HOIST
      ?auto_512 - PLACE
      ?auto_510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_511 ?auto_512 ) ( SURFACE-AT ?auto_508 ?auto_512 ) ( CLEAR ?auto_508 ) ( IS-CRATE ?auto_509 ) ( not ( = ?auto_508 ?auto_509 ) ) ( TRUCK-AT ?auto_510 ?auto_512 ) ( AVAILABLE ?auto_511 ) ( IN ?auto_509 ?auto_510 ) ( ON ?auto_508 ?auto_507 ) ( not ( = ?auto_507 ?auto_508 ) ) ( not ( = ?auto_507 ?auto_509 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_508 ?auto_509 )
      ( MAKE-2CRATE-VERIFY ?auto_507 ?auto_508 ?auto_509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_513 - SURFACE
      ?auto_514 - SURFACE
    )
    :vars
    (
      ?auto_515 - HOIST
      ?auto_517 - PLACE
      ?auto_518 - TRUCK
      ?auto_516 - SURFACE
      ?auto_519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_515 ?auto_517 ) ( SURFACE-AT ?auto_513 ?auto_517 ) ( CLEAR ?auto_513 ) ( IS-CRATE ?auto_514 ) ( not ( = ?auto_513 ?auto_514 ) ) ( AVAILABLE ?auto_515 ) ( IN ?auto_514 ?auto_518 ) ( ON ?auto_513 ?auto_516 ) ( not ( = ?auto_516 ?auto_513 ) ) ( not ( = ?auto_516 ?auto_514 ) ) ( TRUCK-AT ?auto_518 ?auto_519 ) ( not ( = ?auto_519 ?auto_517 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_518 ?auto_519 ?auto_517 )
      ( MAKE-2CRATE ?auto_516 ?auto_513 ?auto_514 )
      ( MAKE-1CRATE-VERIFY ?auto_513 ?auto_514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_520 - SURFACE
      ?auto_521 - SURFACE
      ?auto_522 - SURFACE
    )
    :vars
    (
      ?auto_524 - HOIST
      ?auto_526 - PLACE
      ?auto_523 - TRUCK
      ?auto_525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_524 ?auto_526 ) ( SURFACE-AT ?auto_521 ?auto_526 ) ( CLEAR ?auto_521 ) ( IS-CRATE ?auto_522 ) ( not ( = ?auto_521 ?auto_522 ) ) ( AVAILABLE ?auto_524 ) ( IN ?auto_522 ?auto_523 ) ( ON ?auto_521 ?auto_520 ) ( not ( = ?auto_520 ?auto_521 ) ) ( not ( = ?auto_520 ?auto_522 ) ) ( TRUCK-AT ?auto_523 ?auto_525 ) ( not ( = ?auto_525 ?auto_526 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_521 ?auto_522 )
      ( MAKE-2CRATE-VERIFY ?auto_520 ?auto_521 ?auto_522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_527 - SURFACE
      ?auto_528 - SURFACE
    )
    :vars
    (
      ?auto_533 - HOIST
      ?auto_531 - PLACE
      ?auto_532 - SURFACE
      ?auto_530 - TRUCK
      ?auto_529 - PLACE
      ?auto_534 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_533 ?auto_531 ) ( SURFACE-AT ?auto_527 ?auto_531 ) ( CLEAR ?auto_527 ) ( IS-CRATE ?auto_528 ) ( not ( = ?auto_527 ?auto_528 ) ) ( AVAILABLE ?auto_533 ) ( ON ?auto_527 ?auto_532 ) ( not ( = ?auto_532 ?auto_527 ) ) ( not ( = ?auto_532 ?auto_528 ) ) ( TRUCK-AT ?auto_530 ?auto_529 ) ( not ( = ?auto_529 ?auto_531 ) ) ( HOIST-AT ?auto_534 ?auto_529 ) ( LIFTING ?auto_534 ?auto_528 ) ( not ( = ?auto_533 ?auto_534 ) ) )
    :subtasks
    ( ( !LOAD ?auto_534 ?auto_528 ?auto_530 ?auto_529 )
      ( MAKE-2CRATE ?auto_532 ?auto_527 ?auto_528 )
      ( MAKE-1CRATE-VERIFY ?auto_527 ?auto_528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_535 - SURFACE
      ?auto_536 - SURFACE
      ?auto_537 - SURFACE
    )
    :vars
    (
      ?auto_539 - HOIST
      ?auto_538 - PLACE
      ?auto_540 - TRUCK
      ?auto_541 - PLACE
      ?auto_542 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_539 ?auto_538 ) ( SURFACE-AT ?auto_536 ?auto_538 ) ( CLEAR ?auto_536 ) ( IS-CRATE ?auto_537 ) ( not ( = ?auto_536 ?auto_537 ) ) ( AVAILABLE ?auto_539 ) ( ON ?auto_536 ?auto_535 ) ( not ( = ?auto_535 ?auto_536 ) ) ( not ( = ?auto_535 ?auto_537 ) ) ( TRUCK-AT ?auto_540 ?auto_541 ) ( not ( = ?auto_541 ?auto_538 ) ) ( HOIST-AT ?auto_542 ?auto_541 ) ( LIFTING ?auto_542 ?auto_537 ) ( not ( = ?auto_539 ?auto_542 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_536 ?auto_537 )
      ( MAKE-2CRATE-VERIFY ?auto_535 ?auto_536 ?auto_537 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_543 - SURFACE
      ?auto_544 - SURFACE
    )
    :vars
    (
      ?auto_548 - HOIST
      ?auto_546 - PLACE
      ?auto_547 - SURFACE
      ?auto_550 - TRUCK
      ?auto_545 - PLACE
      ?auto_549 - HOIST
      ?auto_551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_548 ?auto_546 ) ( SURFACE-AT ?auto_543 ?auto_546 ) ( CLEAR ?auto_543 ) ( IS-CRATE ?auto_544 ) ( not ( = ?auto_543 ?auto_544 ) ) ( AVAILABLE ?auto_548 ) ( ON ?auto_543 ?auto_547 ) ( not ( = ?auto_547 ?auto_543 ) ) ( not ( = ?auto_547 ?auto_544 ) ) ( TRUCK-AT ?auto_550 ?auto_545 ) ( not ( = ?auto_545 ?auto_546 ) ) ( HOIST-AT ?auto_549 ?auto_545 ) ( not ( = ?auto_548 ?auto_549 ) ) ( AVAILABLE ?auto_549 ) ( SURFACE-AT ?auto_544 ?auto_545 ) ( ON ?auto_544 ?auto_551 ) ( CLEAR ?auto_544 ) ( not ( = ?auto_543 ?auto_551 ) ) ( not ( = ?auto_544 ?auto_551 ) ) ( not ( = ?auto_547 ?auto_551 ) ) )
    :subtasks
    ( ( !LIFT ?auto_549 ?auto_544 ?auto_551 ?auto_545 )
      ( MAKE-2CRATE ?auto_547 ?auto_543 ?auto_544 )
      ( MAKE-1CRATE-VERIFY ?auto_543 ?auto_544 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_552 - SURFACE
      ?auto_553 - SURFACE
      ?auto_554 - SURFACE
    )
    :vars
    (
      ?auto_555 - HOIST
      ?auto_560 - PLACE
      ?auto_559 - TRUCK
      ?auto_557 - PLACE
      ?auto_558 - HOIST
      ?auto_556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555 ?auto_560 ) ( SURFACE-AT ?auto_553 ?auto_560 ) ( CLEAR ?auto_553 ) ( IS-CRATE ?auto_554 ) ( not ( = ?auto_553 ?auto_554 ) ) ( AVAILABLE ?auto_555 ) ( ON ?auto_553 ?auto_552 ) ( not ( = ?auto_552 ?auto_553 ) ) ( not ( = ?auto_552 ?auto_554 ) ) ( TRUCK-AT ?auto_559 ?auto_557 ) ( not ( = ?auto_557 ?auto_560 ) ) ( HOIST-AT ?auto_558 ?auto_557 ) ( not ( = ?auto_555 ?auto_558 ) ) ( AVAILABLE ?auto_558 ) ( SURFACE-AT ?auto_554 ?auto_557 ) ( ON ?auto_554 ?auto_556 ) ( CLEAR ?auto_554 ) ( not ( = ?auto_553 ?auto_556 ) ) ( not ( = ?auto_554 ?auto_556 ) ) ( not ( = ?auto_552 ?auto_556 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_553 ?auto_554 )
      ( MAKE-2CRATE-VERIFY ?auto_552 ?auto_553 ?auto_554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_561 - SURFACE
      ?auto_562 - SURFACE
    )
    :vars
    (
      ?auto_567 - HOIST
      ?auto_565 - PLACE
      ?auto_564 - SURFACE
      ?auto_566 - PLACE
      ?auto_569 - HOIST
      ?auto_563 - SURFACE
      ?auto_568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_567 ?auto_565 ) ( SURFACE-AT ?auto_561 ?auto_565 ) ( CLEAR ?auto_561 ) ( IS-CRATE ?auto_562 ) ( not ( = ?auto_561 ?auto_562 ) ) ( AVAILABLE ?auto_567 ) ( ON ?auto_561 ?auto_564 ) ( not ( = ?auto_564 ?auto_561 ) ) ( not ( = ?auto_564 ?auto_562 ) ) ( not ( = ?auto_566 ?auto_565 ) ) ( HOIST-AT ?auto_569 ?auto_566 ) ( not ( = ?auto_567 ?auto_569 ) ) ( AVAILABLE ?auto_569 ) ( SURFACE-AT ?auto_562 ?auto_566 ) ( ON ?auto_562 ?auto_563 ) ( CLEAR ?auto_562 ) ( not ( = ?auto_561 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_564 ?auto_563 ) ) ( TRUCK-AT ?auto_568 ?auto_565 ) )
    :subtasks
    ( ( !DRIVE ?auto_568 ?auto_565 ?auto_566 )
      ( MAKE-2CRATE ?auto_564 ?auto_561 ?auto_562 )
      ( MAKE-1CRATE-VERIFY ?auto_561 ?auto_562 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_570 - SURFACE
      ?auto_571 - SURFACE
      ?auto_572 - SURFACE
    )
    :vars
    (
      ?auto_575 - HOIST
      ?auto_574 - PLACE
      ?auto_578 - PLACE
      ?auto_573 - HOIST
      ?auto_576 - SURFACE
      ?auto_577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575 ?auto_574 ) ( SURFACE-AT ?auto_571 ?auto_574 ) ( CLEAR ?auto_571 ) ( IS-CRATE ?auto_572 ) ( not ( = ?auto_571 ?auto_572 ) ) ( AVAILABLE ?auto_575 ) ( ON ?auto_571 ?auto_570 ) ( not ( = ?auto_570 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_572 ) ) ( not ( = ?auto_578 ?auto_574 ) ) ( HOIST-AT ?auto_573 ?auto_578 ) ( not ( = ?auto_575 ?auto_573 ) ) ( AVAILABLE ?auto_573 ) ( SURFACE-AT ?auto_572 ?auto_578 ) ( ON ?auto_572 ?auto_576 ) ( CLEAR ?auto_572 ) ( not ( = ?auto_571 ?auto_576 ) ) ( not ( = ?auto_572 ?auto_576 ) ) ( not ( = ?auto_570 ?auto_576 ) ) ( TRUCK-AT ?auto_577 ?auto_574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_571 ?auto_572 )
      ( MAKE-2CRATE-VERIFY ?auto_570 ?auto_571 ?auto_572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_579 - SURFACE
      ?auto_580 - SURFACE
    )
    :vars
    (
      ?auto_583 - HOIST
      ?auto_586 - PLACE
      ?auto_587 - SURFACE
      ?auto_582 - PLACE
      ?auto_585 - HOIST
      ?auto_584 - SURFACE
      ?auto_581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583 ?auto_586 ) ( IS-CRATE ?auto_580 ) ( not ( = ?auto_579 ?auto_580 ) ) ( not ( = ?auto_587 ?auto_579 ) ) ( not ( = ?auto_587 ?auto_580 ) ) ( not ( = ?auto_582 ?auto_586 ) ) ( HOIST-AT ?auto_585 ?auto_582 ) ( not ( = ?auto_583 ?auto_585 ) ) ( AVAILABLE ?auto_585 ) ( SURFACE-AT ?auto_580 ?auto_582 ) ( ON ?auto_580 ?auto_584 ) ( CLEAR ?auto_580 ) ( not ( = ?auto_579 ?auto_584 ) ) ( not ( = ?auto_580 ?auto_584 ) ) ( not ( = ?auto_587 ?auto_584 ) ) ( TRUCK-AT ?auto_581 ?auto_586 ) ( SURFACE-AT ?auto_587 ?auto_586 ) ( CLEAR ?auto_587 ) ( LIFTING ?auto_583 ?auto_579 ) ( IS-CRATE ?auto_579 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_587 ?auto_579 )
      ( MAKE-2CRATE ?auto_587 ?auto_579 ?auto_580 )
      ( MAKE-1CRATE-VERIFY ?auto_579 ?auto_580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_588 - SURFACE
      ?auto_589 - SURFACE
      ?auto_590 - SURFACE
    )
    :vars
    (
      ?auto_592 - HOIST
      ?auto_594 - PLACE
      ?auto_595 - PLACE
      ?auto_591 - HOIST
      ?auto_596 - SURFACE
      ?auto_593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592 ?auto_594 ) ( IS-CRATE ?auto_590 ) ( not ( = ?auto_589 ?auto_590 ) ) ( not ( = ?auto_588 ?auto_589 ) ) ( not ( = ?auto_588 ?auto_590 ) ) ( not ( = ?auto_595 ?auto_594 ) ) ( HOIST-AT ?auto_591 ?auto_595 ) ( not ( = ?auto_592 ?auto_591 ) ) ( AVAILABLE ?auto_591 ) ( SURFACE-AT ?auto_590 ?auto_595 ) ( ON ?auto_590 ?auto_596 ) ( CLEAR ?auto_590 ) ( not ( = ?auto_589 ?auto_596 ) ) ( not ( = ?auto_590 ?auto_596 ) ) ( not ( = ?auto_588 ?auto_596 ) ) ( TRUCK-AT ?auto_593 ?auto_594 ) ( SURFACE-AT ?auto_588 ?auto_594 ) ( CLEAR ?auto_588 ) ( LIFTING ?auto_592 ?auto_589 ) ( IS-CRATE ?auto_589 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_589 ?auto_590 )
      ( MAKE-2CRATE-VERIFY ?auto_588 ?auto_589 ?auto_590 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_597 - SURFACE
      ?auto_598 - SURFACE
    )
    :vars
    (
      ?auto_599 - HOIST
      ?auto_602 - PLACE
      ?auto_600 - SURFACE
      ?auto_601 - PLACE
      ?auto_605 - HOIST
      ?auto_604 - SURFACE
      ?auto_603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_599 ?auto_602 ) ( IS-CRATE ?auto_598 ) ( not ( = ?auto_597 ?auto_598 ) ) ( not ( = ?auto_600 ?auto_597 ) ) ( not ( = ?auto_600 ?auto_598 ) ) ( not ( = ?auto_601 ?auto_602 ) ) ( HOIST-AT ?auto_605 ?auto_601 ) ( not ( = ?auto_599 ?auto_605 ) ) ( AVAILABLE ?auto_605 ) ( SURFACE-AT ?auto_598 ?auto_601 ) ( ON ?auto_598 ?auto_604 ) ( CLEAR ?auto_598 ) ( not ( = ?auto_597 ?auto_604 ) ) ( not ( = ?auto_598 ?auto_604 ) ) ( not ( = ?auto_600 ?auto_604 ) ) ( TRUCK-AT ?auto_603 ?auto_602 ) ( SURFACE-AT ?auto_600 ?auto_602 ) ( CLEAR ?auto_600 ) ( IS-CRATE ?auto_597 ) ( AVAILABLE ?auto_599 ) ( IN ?auto_597 ?auto_603 ) )
    :subtasks
    ( ( !UNLOAD ?auto_599 ?auto_597 ?auto_603 ?auto_602 )
      ( MAKE-2CRATE ?auto_600 ?auto_597 ?auto_598 )
      ( MAKE-1CRATE-VERIFY ?auto_597 ?auto_598 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_606 - SURFACE
      ?auto_607 - SURFACE
      ?auto_608 - SURFACE
    )
    :vars
    (
      ?auto_612 - HOIST
      ?auto_609 - PLACE
      ?auto_611 - PLACE
      ?auto_610 - HOIST
      ?auto_614 - SURFACE
      ?auto_613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612 ?auto_609 ) ( IS-CRATE ?auto_608 ) ( not ( = ?auto_607 ?auto_608 ) ) ( not ( = ?auto_606 ?auto_607 ) ) ( not ( = ?auto_606 ?auto_608 ) ) ( not ( = ?auto_611 ?auto_609 ) ) ( HOIST-AT ?auto_610 ?auto_611 ) ( not ( = ?auto_612 ?auto_610 ) ) ( AVAILABLE ?auto_610 ) ( SURFACE-AT ?auto_608 ?auto_611 ) ( ON ?auto_608 ?auto_614 ) ( CLEAR ?auto_608 ) ( not ( = ?auto_607 ?auto_614 ) ) ( not ( = ?auto_608 ?auto_614 ) ) ( not ( = ?auto_606 ?auto_614 ) ) ( TRUCK-AT ?auto_613 ?auto_609 ) ( SURFACE-AT ?auto_606 ?auto_609 ) ( CLEAR ?auto_606 ) ( IS-CRATE ?auto_607 ) ( AVAILABLE ?auto_612 ) ( IN ?auto_607 ?auto_613 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_607 ?auto_608 )
      ( MAKE-2CRATE-VERIFY ?auto_606 ?auto_607 ?auto_608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_615 - SURFACE
      ?auto_616 - SURFACE
    )
    :vars
    (
      ?auto_622 - HOIST
      ?auto_620 - PLACE
      ?auto_621 - SURFACE
      ?auto_623 - PLACE
      ?auto_619 - HOIST
      ?auto_617 - SURFACE
      ?auto_618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_622 ?auto_620 ) ( IS-CRATE ?auto_616 ) ( not ( = ?auto_615 ?auto_616 ) ) ( not ( = ?auto_621 ?auto_615 ) ) ( not ( = ?auto_621 ?auto_616 ) ) ( not ( = ?auto_623 ?auto_620 ) ) ( HOIST-AT ?auto_619 ?auto_623 ) ( not ( = ?auto_622 ?auto_619 ) ) ( AVAILABLE ?auto_619 ) ( SURFACE-AT ?auto_616 ?auto_623 ) ( ON ?auto_616 ?auto_617 ) ( CLEAR ?auto_616 ) ( not ( = ?auto_615 ?auto_617 ) ) ( not ( = ?auto_616 ?auto_617 ) ) ( not ( = ?auto_621 ?auto_617 ) ) ( SURFACE-AT ?auto_621 ?auto_620 ) ( CLEAR ?auto_621 ) ( IS-CRATE ?auto_615 ) ( AVAILABLE ?auto_622 ) ( IN ?auto_615 ?auto_618 ) ( TRUCK-AT ?auto_618 ?auto_623 ) )
    :subtasks
    ( ( !DRIVE ?auto_618 ?auto_623 ?auto_620 )
      ( MAKE-2CRATE ?auto_621 ?auto_615 ?auto_616 )
      ( MAKE-1CRATE-VERIFY ?auto_615 ?auto_616 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_624 - SURFACE
      ?auto_625 - SURFACE
      ?auto_626 - SURFACE
    )
    :vars
    (
      ?auto_629 - HOIST
      ?auto_631 - PLACE
      ?auto_632 - PLACE
      ?auto_628 - HOIST
      ?auto_627 - SURFACE
      ?auto_630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_629 ?auto_631 ) ( IS-CRATE ?auto_626 ) ( not ( = ?auto_625 ?auto_626 ) ) ( not ( = ?auto_624 ?auto_625 ) ) ( not ( = ?auto_624 ?auto_626 ) ) ( not ( = ?auto_632 ?auto_631 ) ) ( HOIST-AT ?auto_628 ?auto_632 ) ( not ( = ?auto_629 ?auto_628 ) ) ( AVAILABLE ?auto_628 ) ( SURFACE-AT ?auto_626 ?auto_632 ) ( ON ?auto_626 ?auto_627 ) ( CLEAR ?auto_626 ) ( not ( = ?auto_625 ?auto_627 ) ) ( not ( = ?auto_626 ?auto_627 ) ) ( not ( = ?auto_624 ?auto_627 ) ) ( SURFACE-AT ?auto_624 ?auto_631 ) ( CLEAR ?auto_624 ) ( IS-CRATE ?auto_625 ) ( AVAILABLE ?auto_629 ) ( IN ?auto_625 ?auto_630 ) ( TRUCK-AT ?auto_630 ?auto_632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_625 ?auto_626 )
      ( MAKE-2CRATE-VERIFY ?auto_624 ?auto_625 ?auto_626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_633 - SURFACE
      ?auto_634 - SURFACE
    )
    :vars
    (
      ?auto_635 - HOIST
      ?auto_641 - PLACE
      ?auto_638 - SURFACE
      ?auto_640 - PLACE
      ?auto_639 - HOIST
      ?auto_636 - SURFACE
      ?auto_637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_635 ?auto_641 ) ( IS-CRATE ?auto_634 ) ( not ( = ?auto_633 ?auto_634 ) ) ( not ( = ?auto_638 ?auto_633 ) ) ( not ( = ?auto_638 ?auto_634 ) ) ( not ( = ?auto_640 ?auto_641 ) ) ( HOIST-AT ?auto_639 ?auto_640 ) ( not ( = ?auto_635 ?auto_639 ) ) ( SURFACE-AT ?auto_634 ?auto_640 ) ( ON ?auto_634 ?auto_636 ) ( CLEAR ?auto_634 ) ( not ( = ?auto_633 ?auto_636 ) ) ( not ( = ?auto_634 ?auto_636 ) ) ( not ( = ?auto_638 ?auto_636 ) ) ( SURFACE-AT ?auto_638 ?auto_641 ) ( CLEAR ?auto_638 ) ( IS-CRATE ?auto_633 ) ( AVAILABLE ?auto_635 ) ( TRUCK-AT ?auto_637 ?auto_640 ) ( LIFTING ?auto_639 ?auto_633 ) )
    :subtasks
    ( ( !LOAD ?auto_639 ?auto_633 ?auto_637 ?auto_640 )
      ( MAKE-2CRATE ?auto_638 ?auto_633 ?auto_634 )
      ( MAKE-1CRATE-VERIFY ?auto_633 ?auto_634 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642 - SURFACE
      ?auto_643 - SURFACE
      ?auto_644 - SURFACE
    )
    :vars
    (
      ?auto_647 - HOIST
      ?auto_645 - PLACE
      ?auto_646 - PLACE
      ?auto_649 - HOIST
      ?auto_648 - SURFACE
      ?auto_650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_647 ?auto_645 ) ( IS-CRATE ?auto_644 ) ( not ( = ?auto_643 ?auto_644 ) ) ( not ( = ?auto_642 ?auto_643 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_646 ?auto_645 ) ) ( HOIST-AT ?auto_649 ?auto_646 ) ( not ( = ?auto_647 ?auto_649 ) ) ( SURFACE-AT ?auto_644 ?auto_646 ) ( ON ?auto_644 ?auto_648 ) ( CLEAR ?auto_644 ) ( not ( = ?auto_643 ?auto_648 ) ) ( not ( = ?auto_644 ?auto_648 ) ) ( not ( = ?auto_642 ?auto_648 ) ) ( SURFACE-AT ?auto_642 ?auto_645 ) ( CLEAR ?auto_642 ) ( IS-CRATE ?auto_643 ) ( AVAILABLE ?auto_647 ) ( TRUCK-AT ?auto_650 ?auto_646 ) ( LIFTING ?auto_649 ?auto_643 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643 ?auto_644 )
      ( MAKE-2CRATE-VERIFY ?auto_642 ?auto_643 ?auto_644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_651 - SURFACE
      ?auto_652 - SURFACE
    )
    :vars
    (
      ?auto_654 - HOIST
      ?auto_655 - PLACE
      ?auto_657 - SURFACE
      ?auto_659 - PLACE
      ?auto_658 - HOIST
      ?auto_656 - SURFACE
      ?auto_653 - TRUCK
      ?auto_660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_654 ?auto_655 ) ( IS-CRATE ?auto_652 ) ( not ( = ?auto_651 ?auto_652 ) ) ( not ( = ?auto_657 ?auto_651 ) ) ( not ( = ?auto_657 ?auto_652 ) ) ( not ( = ?auto_659 ?auto_655 ) ) ( HOIST-AT ?auto_658 ?auto_659 ) ( not ( = ?auto_654 ?auto_658 ) ) ( SURFACE-AT ?auto_652 ?auto_659 ) ( ON ?auto_652 ?auto_656 ) ( CLEAR ?auto_652 ) ( not ( = ?auto_651 ?auto_656 ) ) ( not ( = ?auto_652 ?auto_656 ) ) ( not ( = ?auto_657 ?auto_656 ) ) ( SURFACE-AT ?auto_657 ?auto_655 ) ( CLEAR ?auto_657 ) ( IS-CRATE ?auto_651 ) ( AVAILABLE ?auto_654 ) ( TRUCK-AT ?auto_653 ?auto_659 ) ( AVAILABLE ?auto_658 ) ( SURFACE-AT ?auto_651 ?auto_659 ) ( ON ?auto_651 ?auto_660 ) ( CLEAR ?auto_651 ) ( not ( = ?auto_651 ?auto_660 ) ) ( not ( = ?auto_652 ?auto_660 ) ) ( not ( = ?auto_657 ?auto_660 ) ) ( not ( = ?auto_656 ?auto_660 ) ) )
    :subtasks
    ( ( !LIFT ?auto_658 ?auto_651 ?auto_660 ?auto_659 )
      ( MAKE-2CRATE ?auto_657 ?auto_651 ?auto_652 )
      ( MAKE-1CRATE-VERIFY ?auto_651 ?auto_652 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_661 - SURFACE
      ?auto_662 - SURFACE
      ?auto_663 - SURFACE
    )
    :vars
    (
      ?auto_668 - HOIST
      ?auto_667 - PLACE
      ?auto_670 - PLACE
      ?auto_669 - HOIST
      ?auto_666 - SURFACE
      ?auto_664 - TRUCK
      ?auto_665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_668 ?auto_667 ) ( IS-CRATE ?auto_663 ) ( not ( = ?auto_662 ?auto_663 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_670 ?auto_667 ) ) ( HOIST-AT ?auto_669 ?auto_670 ) ( not ( = ?auto_668 ?auto_669 ) ) ( SURFACE-AT ?auto_663 ?auto_670 ) ( ON ?auto_663 ?auto_666 ) ( CLEAR ?auto_663 ) ( not ( = ?auto_662 ?auto_666 ) ) ( not ( = ?auto_663 ?auto_666 ) ) ( not ( = ?auto_661 ?auto_666 ) ) ( SURFACE-AT ?auto_661 ?auto_667 ) ( CLEAR ?auto_661 ) ( IS-CRATE ?auto_662 ) ( AVAILABLE ?auto_668 ) ( TRUCK-AT ?auto_664 ?auto_670 ) ( AVAILABLE ?auto_669 ) ( SURFACE-AT ?auto_662 ?auto_670 ) ( ON ?auto_662 ?auto_665 ) ( CLEAR ?auto_662 ) ( not ( = ?auto_662 ?auto_665 ) ) ( not ( = ?auto_663 ?auto_665 ) ) ( not ( = ?auto_661 ?auto_665 ) ) ( not ( = ?auto_666 ?auto_665 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_662 ?auto_663 )
      ( MAKE-2CRATE-VERIFY ?auto_661 ?auto_662 ?auto_663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_671 - SURFACE
      ?auto_672 - SURFACE
    )
    :vars
    (
      ?auto_680 - HOIST
      ?auto_674 - PLACE
      ?auto_678 - SURFACE
      ?auto_679 - PLACE
      ?auto_677 - HOIST
      ?auto_675 - SURFACE
      ?auto_676 - SURFACE
      ?auto_673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_680 ?auto_674 ) ( IS-CRATE ?auto_672 ) ( not ( = ?auto_671 ?auto_672 ) ) ( not ( = ?auto_678 ?auto_671 ) ) ( not ( = ?auto_678 ?auto_672 ) ) ( not ( = ?auto_679 ?auto_674 ) ) ( HOIST-AT ?auto_677 ?auto_679 ) ( not ( = ?auto_680 ?auto_677 ) ) ( SURFACE-AT ?auto_672 ?auto_679 ) ( ON ?auto_672 ?auto_675 ) ( CLEAR ?auto_672 ) ( not ( = ?auto_671 ?auto_675 ) ) ( not ( = ?auto_672 ?auto_675 ) ) ( not ( = ?auto_678 ?auto_675 ) ) ( SURFACE-AT ?auto_678 ?auto_674 ) ( CLEAR ?auto_678 ) ( IS-CRATE ?auto_671 ) ( AVAILABLE ?auto_680 ) ( AVAILABLE ?auto_677 ) ( SURFACE-AT ?auto_671 ?auto_679 ) ( ON ?auto_671 ?auto_676 ) ( CLEAR ?auto_671 ) ( not ( = ?auto_671 ?auto_676 ) ) ( not ( = ?auto_672 ?auto_676 ) ) ( not ( = ?auto_678 ?auto_676 ) ) ( not ( = ?auto_675 ?auto_676 ) ) ( TRUCK-AT ?auto_673 ?auto_674 ) )
    :subtasks
    ( ( !DRIVE ?auto_673 ?auto_674 ?auto_679 )
      ( MAKE-2CRATE ?auto_678 ?auto_671 ?auto_672 )
      ( MAKE-1CRATE-VERIFY ?auto_671 ?auto_672 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_681 - SURFACE
      ?auto_682 - SURFACE
      ?auto_683 - SURFACE
    )
    :vars
    (
      ?auto_684 - HOIST
      ?auto_687 - PLACE
      ?auto_688 - PLACE
      ?auto_685 - HOIST
      ?auto_689 - SURFACE
      ?auto_686 - SURFACE
      ?auto_690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_684 ?auto_687 ) ( IS-CRATE ?auto_683 ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_681 ?auto_683 ) ) ( not ( = ?auto_688 ?auto_687 ) ) ( HOIST-AT ?auto_685 ?auto_688 ) ( not ( = ?auto_684 ?auto_685 ) ) ( SURFACE-AT ?auto_683 ?auto_688 ) ( ON ?auto_683 ?auto_689 ) ( CLEAR ?auto_683 ) ( not ( = ?auto_682 ?auto_689 ) ) ( not ( = ?auto_683 ?auto_689 ) ) ( not ( = ?auto_681 ?auto_689 ) ) ( SURFACE-AT ?auto_681 ?auto_687 ) ( CLEAR ?auto_681 ) ( IS-CRATE ?auto_682 ) ( AVAILABLE ?auto_684 ) ( AVAILABLE ?auto_685 ) ( SURFACE-AT ?auto_682 ?auto_688 ) ( ON ?auto_682 ?auto_686 ) ( CLEAR ?auto_682 ) ( not ( = ?auto_682 ?auto_686 ) ) ( not ( = ?auto_683 ?auto_686 ) ) ( not ( = ?auto_681 ?auto_686 ) ) ( not ( = ?auto_689 ?auto_686 ) ) ( TRUCK-AT ?auto_690 ?auto_687 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_682 ?auto_683 )
      ( MAKE-2CRATE-VERIFY ?auto_681 ?auto_682 ?auto_683 ) )
  )

)

