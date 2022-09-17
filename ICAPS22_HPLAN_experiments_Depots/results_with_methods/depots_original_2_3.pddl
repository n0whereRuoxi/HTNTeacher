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
      ?auto_417 - SURFACE
      ?auto_418 - SURFACE
    )
    :vars
    (
      ?auto_419 - HOIST
      ?auto_420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_419 ?auto_420 ) ( SURFACE-AT ?auto_418 ?auto_420 ) ( CLEAR ?auto_418 ) ( LIFTING ?auto_419 ?auto_417 ) ( IS-CRATE ?auto_417 ) ( not ( = ?auto_417 ?auto_418 ) ) )
    :subtasks
    ( ( !DROP ?auto_419 ?auto_417 ?auto_418 ?auto_420 )
      ( MAKE-ON-VERIFY ?auto_417 ?auto_418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_421 - SURFACE
      ?auto_422 - SURFACE
    )
    :vars
    (
      ?auto_424 - HOIST
      ?auto_423 - PLACE
      ?auto_425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424 ?auto_423 ) ( SURFACE-AT ?auto_422 ?auto_423 ) ( CLEAR ?auto_422 ) ( IS-CRATE ?auto_421 ) ( not ( = ?auto_421 ?auto_422 ) ) ( TRUCK-AT ?auto_425 ?auto_423 ) ( AVAILABLE ?auto_424 ) ( IN ?auto_421 ?auto_425 ) )
    :subtasks
    ( ( !UNLOAD ?auto_424 ?auto_421 ?auto_425 ?auto_423 )
      ( MAKE-ON ?auto_421 ?auto_422 )
      ( MAKE-ON-VERIFY ?auto_421 ?auto_422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_426 - SURFACE
      ?auto_427 - SURFACE
    )
    :vars
    (
      ?auto_430 - HOIST
      ?auto_428 - PLACE
      ?auto_429 - TRUCK
      ?auto_431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_430 ?auto_428 ) ( SURFACE-AT ?auto_427 ?auto_428 ) ( CLEAR ?auto_427 ) ( IS-CRATE ?auto_426 ) ( not ( = ?auto_426 ?auto_427 ) ) ( AVAILABLE ?auto_430 ) ( IN ?auto_426 ?auto_429 ) ( TRUCK-AT ?auto_429 ?auto_431 ) ( not ( = ?auto_431 ?auto_428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_429 ?auto_431 ?auto_428 )
      ( MAKE-ON ?auto_426 ?auto_427 )
      ( MAKE-ON-VERIFY ?auto_426 ?auto_427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_432 - SURFACE
      ?auto_433 - SURFACE
    )
    :vars
    (
      ?auto_434 - HOIST
      ?auto_435 - PLACE
      ?auto_437 - TRUCK
      ?auto_436 - PLACE
      ?auto_438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_434 ?auto_435 ) ( SURFACE-AT ?auto_433 ?auto_435 ) ( CLEAR ?auto_433 ) ( IS-CRATE ?auto_432 ) ( not ( = ?auto_432 ?auto_433 ) ) ( AVAILABLE ?auto_434 ) ( TRUCK-AT ?auto_437 ?auto_436 ) ( not ( = ?auto_436 ?auto_435 ) ) ( HOIST-AT ?auto_438 ?auto_436 ) ( LIFTING ?auto_438 ?auto_432 ) ( not ( = ?auto_434 ?auto_438 ) ) )
    :subtasks
    ( ( !LOAD ?auto_438 ?auto_432 ?auto_437 ?auto_436 )
      ( MAKE-ON ?auto_432 ?auto_433 )
      ( MAKE-ON-VERIFY ?auto_432 ?auto_433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_439 - SURFACE
      ?auto_440 - SURFACE
    )
    :vars
    (
      ?auto_445 - HOIST
      ?auto_442 - PLACE
      ?auto_444 - TRUCK
      ?auto_443 - PLACE
      ?auto_441 - HOIST
      ?auto_446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_445 ?auto_442 ) ( SURFACE-AT ?auto_440 ?auto_442 ) ( CLEAR ?auto_440 ) ( IS-CRATE ?auto_439 ) ( not ( = ?auto_439 ?auto_440 ) ) ( AVAILABLE ?auto_445 ) ( TRUCK-AT ?auto_444 ?auto_443 ) ( not ( = ?auto_443 ?auto_442 ) ) ( HOIST-AT ?auto_441 ?auto_443 ) ( not ( = ?auto_445 ?auto_441 ) ) ( AVAILABLE ?auto_441 ) ( SURFACE-AT ?auto_439 ?auto_443 ) ( ON ?auto_439 ?auto_446 ) ( CLEAR ?auto_439 ) ( not ( = ?auto_439 ?auto_446 ) ) ( not ( = ?auto_440 ?auto_446 ) ) )
    :subtasks
    ( ( !LIFT ?auto_441 ?auto_439 ?auto_446 ?auto_443 )
      ( MAKE-ON ?auto_439 ?auto_440 )
      ( MAKE-ON-VERIFY ?auto_439 ?auto_440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_447 - SURFACE
      ?auto_448 - SURFACE
    )
    :vars
    (
      ?auto_450 - HOIST
      ?auto_453 - PLACE
      ?auto_451 - PLACE
      ?auto_454 - HOIST
      ?auto_449 - SURFACE
      ?auto_452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450 ?auto_453 ) ( SURFACE-AT ?auto_448 ?auto_453 ) ( CLEAR ?auto_448 ) ( IS-CRATE ?auto_447 ) ( not ( = ?auto_447 ?auto_448 ) ) ( AVAILABLE ?auto_450 ) ( not ( = ?auto_451 ?auto_453 ) ) ( HOIST-AT ?auto_454 ?auto_451 ) ( not ( = ?auto_450 ?auto_454 ) ) ( AVAILABLE ?auto_454 ) ( SURFACE-AT ?auto_447 ?auto_451 ) ( ON ?auto_447 ?auto_449 ) ( CLEAR ?auto_447 ) ( not ( = ?auto_447 ?auto_449 ) ) ( not ( = ?auto_448 ?auto_449 ) ) ( TRUCK-AT ?auto_452 ?auto_453 ) )
    :subtasks
    ( ( !DRIVE ?auto_452 ?auto_453 ?auto_451 )
      ( MAKE-ON ?auto_447 ?auto_448 )
      ( MAKE-ON-VERIFY ?auto_447 ?auto_448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_457 - SURFACE
      ?auto_458 - SURFACE
    )
    :vars
    (
      ?auto_459 - HOIST
      ?auto_460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_459 ?auto_460 ) ( SURFACE-AT ?auto_458 ?auto_460 ) ( CLEAR ?auto_458 ) ( LIFTING ?auto_459 ?auto_457 ) ( IS-CRATE ?auto_457 ) ( not ( = ?auto_457 ?auto_458 ) ) )
    :subtasks
    ( ( !DROP ?auto_459 ?auto_457 ?auto_458 ?auto_460 )
      ( MAKE-ON-VERIFY ?auto_457 ?auto_458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_461 - SURFACE
      ?auto_462 - SURFACE
    )
    :vars
    (
      ?auto_464 - HOIST
      ?auto_463 - PLACE
      ?auto_465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_464 ?auto_463 ) ( SURFACE-AT ?auto_462 ?auto_463 ) ( CLEAR ?auto_462 ) ( IS-CRATE ?auto_461 ) ( not ( = ?auto_461 ?auto_462 ) ) ( TRUCK-AT ?auto_465 ?auto_463 ) ( AVAILABLE ?auto_464 ) ( IN ?auto_461 ?auto_465 ) )
    :subtasks
    ( ( !UNLOAD ?auto_464 ?auto_461 ?auto_465 ?auto_463 )
      ( MAKE-ON ?auto_461 ?auto_462 )
      ( MAKE-ON-VERIFY ?auto_461 ?auto_462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_466 - SURFACE
      ?auto_467 - SURFACE
    )
    :vars
    (
      ?auto_469 - HOIST
      ?auto_470 - PLACE
      ?auto_468 - TRUCK
      ?auto_471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469 ?auto_470 ) ( SURFACE-AT ?auto_467 ?auto_470 ) ( CLEAR ?auto_467 ) ( IS-CRATE ?auto_466 ) ( not ( = ?auto_466 ?auto_467 ) ) ( AVAILABLE ?auto_469 ) ( IN ?auto_466 ?auto_468 ) ( TRUCK-AT ?auto_468 ?auto_471 ) ( not ( = ?auto_471 ?auto_470 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_468 ?auto_471 ?auto_470 )
      ( MAKE-ON ?auto_466 ?auto_467 )
      ( MAKE-ON-VERIFY ?auto_466 ?auto_467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_472 - SURFACE
      ?auto_473 - SURFACE
    )
    :vars
    (
      ?auto_475 - HOIST
      ?auto_474 - PLACE
      ?auto_476 - TRUCK
      ?auto_477 - PLACE
      ?auto_478 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_475 ?auto_474 ) ( SURFACE-AT ?auto_473 ?auto_474 ) ( CLEAR ?auto_473 ) ( IS-CRATE ?auto_472 ) ( not ( = ?auto_472 ?auto_473 ) ) ( AVAILABLE ?auto_475 ) ( TRUCK-AT ?auto_476 ?auto_477 ) ( not ( = ?auto_477 ?auto_474 ) ) ( HOIST-AT ?auto_478 ?auto_477 ) ( LIFTING ?auto_478 ?auto_472 ) ( not ( = ?auto_475 ?auto_478 ) ) )
    :subtasks
    ( ( !LOAD ?auto_478 ?auto_472 ?auto_476 ?auto_477 )
      ( MAKE-ON ?auto_472 ?auto_473 )
      ( MAKE-ON-VERIFY ?auto_472 ?auto_473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_479 - SURFACE
      ?auto_480 - SURFACE
    )
    :vars
    (
      ?auto_485 - HOIST
      ?auto_483 - PLACE
      ?auto_484 - TRUCK
      ?auto_481 - PLACE
      ?auto_482 - HOIST
      ?auto_486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_485 ?auto_483 ) ( SURFACE-AT ?auto_480 ?auto_483 ) ( CLEAR ?auto_480 ) ( IS-CRATE ?auto_479 ) ( not ( = ?auto_479 ?auto_480 ) ) ( AVAILABLE ?auto_485 ) ( TRUCK-AT ?auto_484 ?auto_481 ) ( not ( = ?auto_481 ?auto_483 ) ) ( HOIST-AT ?auto_482 ?auto_481 ) ( not ( = ?auto_485 ?auto_482 ) ) ( AVAILABLE ?auto_482 ) ( SURFACE-AT ?auto_479 ?auto_481 ) ( ON ?auto_479 ?auto_486 ) ( CLEAR ?auto_479 ) ( not ( = ?auto_479 ?auto_486 ) ) ( not ( = ?auto_480 ?auto_486 ) ) )
    :subtasks
    ( ( !LIFT ?auto_482 ?auto_479 ?auto_486 ?auto_481 )
      ( MAKE-ON ?auto_479 ?auto_480 )
      ( MAKE-ON-VERIFY ?auto_479 ?auto_480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_487 - SURFACE
      ?auto_488 - SURFACE
    )
    :vars
    (
      ?auto_490 - HOIST
      ?auto_493 - PLACE
      ?auto_494 - PLACE
      ?auto_491 - HOIST
      ?auto_489 - SURFACE
      ?auto_492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_490 ?auto_493 ) ( SURFACE-AT ?auto_488 ?auto_493 ) ( CLEAR ?auto_488 ) ( IS-CRATE ?auto_487 ) ( not ( = ?auto_487 ?auto_488 ) ) ( AVAILABLE ?auto_490 ) ( not ( = ?auto_494 ?auto_493 ) ) ( HOIST-AT ?auto_491 ?auto_494 ) ( not ( = ?auto_490 ?auto_491 ) ) ( AVAILABLE ?auto_491 ) ( SURFACE-AT ?auto_487 ?auto_494 ) ( ON ?auto_487 ?auto_489 ) ( CLEAR ?auto_487 ) ( not ( = ?auto_487 ?auto_489 ) ) ( not ( = ?auto_488 ?auto_489 ) ) ( TRUCK-AT ?auto_492 ?auto_493 ) )
    :subtasks
    ( ( !DRIVE ?auto_492 ?auto_493 ?auto_494 )
      ( MAKE-ON ?auto_487 ?auto_488 )
      ( MAKE-ON-VERIFY ?auto_487 ?auto_488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_495 - SURFACE
      ?auto_496 - SURFACE
    )
    :vars
    (
      ?auto_500 - HOIST
      ?auto_498 - PLACE
      ?auto_497 - PLACE
      ?auto_501 - HOIST
      ?auto_499 - SURFACE
      ?auto_502 - TRUCK
      ?auto_503 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_500 ?auto_498 ) ( IS-CRATE ?auto_495 ) ( not ( = ?auto_495 ?auto_496 ) ) ( not ( = ?auto_497 ?auto_498 ) ) ( HOIST-AT ?auto_501 ?auto_497 ) ( not ( = ?auto_500 ?auto_501 ) ) ( AVAILABLE ?auto_501 ) ( SURFACE-AT ?auto_495 ?auto_497 ) ( ON ?auto_495 ?auto_499 ) ( CLEAR ?auto_495 ) ( not ( = ?auto_495 ?auto_499 ) ) ( not ( = ?auto_496 ?auto_499 ) ) ( TRUCK-AT ?auto_502 ?auto_498 ) ( SURFACE-AT ?auto_503 ?auto_498 ) ( CLEAR ?auto_503 ) ( LIFTING ?auto_500 ?auto_496 ) ( IS-CRATE ?auto_496 ) ( not ( = ?auto_495 ?auto_503 ) ) ( not ( = ?auto_496 ?auto_503 ) ) ( not ( = ?auto_499 ?auto_503 ) ) )
    :subtasks
    ( ( !DROP ?auto_500 ?auto_496 ?auto_503 ?auto_498 )
      ( MAKE-ON ?auto_495 ?auto_496 )
      ( MAKE-ON-VERIFY ?auto_495 ?auto_496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_504 - SURFACE
      ?auto_505 - SURFACE
    )
    :vars
    (
      ?auto_511 - HOIST
      ?auto_507 - PLACE
      ?auto_509 - PLACE
      ?auto_512 - HOIST
      ?auto_506 - SURFACE
      ?auto_508 - TRUCK
      ?auto_510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_511 ?auto_507 ) ( IS-CRATE ?auto_504 ) ( not ( = ?auto_504 ?auto_505 ) ) ( not ( = ?auto_509 ?auto_507 ) ) ( HOIST-AT ?auto_512 ?auto_509 ) ( not ( = ?auto_511 ?auto_512 ) ) ( AVAILABLE ?auto_512 ) ( SURFACE-AT ?auto_504 ?auto_509 ) ( ON ?auto_504 ?auto_506 ) ( CLEAR ?auto_504 ) ( not ( = ?auto_504 ?auto_506 ) ) ( not ( = ?auto_505 ?auto_506 ) ) ( TRUCK-AT ?auto_508 ?auto_507 ) ( SURFACE-AT ?auto_510 ?auto_507 ) ( CLEAR ?auto_510 ) ( IS-CRATE ?auto_505 ) ( not ( = ?auto_504 ?auto_510 ) ) ( not ( = ?auto_505 ?auto_510 ) ) ( not ( = ?auto_506 ?auto_510 ) ) ( AVAILABLE ?auto_511 ) ( IN ?auto_505 ?auto_508 ) )
    :subtasks
    ( ( !UNLOAD ?auto_511 ?auto_505 ?auto_508 ?auto_507 )
      ( MAKE-ON ?auto_504 ?auto_505 )
      ( MAKE-ON-VERIFY ?auto_504 ?auto_505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_513 - SURFACE
      ?auto_514 - SURFACE
    )
    :vars
    (
      ?auto_516 - HOIST
      ?auto_518 - PLACE
      ?auto_517 - PLACE
      ?auto_515 - HOIST
      ?auto_520 - SURFACE
      ?auto_519 - SURFACE
      ?auto_521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516 ?auto_518 ) ( IS-CRATE ?auto_513 ) ( not ( = ?auto_513 ?auto_514 ) ) ( not ( = ?auto_517 ?auto_518 ) ) ( HOIST-AT ?auto_515 ?auto_517 ) ( not ( = ?auto_516 ?auto_515 ) ) ( AVAILABLE ?auto_515 ) ( SURFACE-AT ?auto_513 ?auto_517 ) ( ON ?auto_513 ?auto_520 ) ( CLEAR ?auto_513 ) ( not ( = ?auto_513 ?auto_520 ) ) ( not ( = ?auto_514 ?auto_520 ) ) ( SURFACE-AT ?auto_519 ?auto_518 ) ( CLEAR ?auto_519 ) ( IS-CRATE ?auto_514 ) ( not ( = ?auto_513 ?auto_519 ) ) ( not ( = ?auto_514 ?auto_519 ) ) ( not ( = ?auto_520 ?auto_519 ) ) ( AVAILABLE ?auto_516 ) ( IN ?auto_514 ?auto_521 ) ( TRUCK-AT ?auto_521 ?auto_517 ) )
    :subtasks
    ( ( !DRIVE ?auto_521 ?auto_517 ?auto_518 )
      ( MAKE-ON ?auto_513 ?auto_514 )
      ( MAKE-ON-VERIFY ?auto_513 ?auto_514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_522 - SURFACE
      ?auto_523 - SURFACE
    )
    :vars
    (
      ?auto_526 - HOIST
      ?auto_528 - PLACE
      ?auto_527 - PLACE
      ?auto_524 - HOIST
      ?auto_529 - SURFACE
      ?auto_530 - SURFACE
      ?auto_525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526 ?auto_528 ) ( IS-CRATE ?auto_522 ) ( not ( = ?auto_522 ?auto_523 ) ) ( not ( = ?auto_527 ?auto_528 ) ) ( HOIST-AT ?auto_524 ?auto_527 ) ( not ( = ?auto_526 ?auto_524 ) ) ( SURFACE-AT ?auto_522 ?auto_527 ) ( ON ?auto_522 ?auto_529 ) ( CLEAR ?auto_522 ) ( not ( = ?auto_522 ?auto_529 ) ) ( not ( = ?auto_523 ?auto_529 ) ) ( SURFACE-AT ?auto_530 ?auto_528 ) ( CLEAR ?auto_530 ) ( IS-CRATE ?auto_523 ) ( not ( = ?auto_522 ?auto_530 ) ) ( not ( = ?auto_523 ?auto_530 ) ) ( not ( = ?auto_529 ?auto_530 ) ) ( AVAILABLE ?auto_526 ) ( TRUCK-AT ?auto_525 ?auto_527 ) ( LIFTING ?auto_524 ?auto_523 ) )
    :subtasks
    ( ( !LOAD ?auto_524 ?auto_523 ?auto_525 ?auto_527 )
      ( MAKE-ON ?auto_522 ?auto_523 )
      ( MAKE-ON-VERIFY ?auto_522 ?auto_523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_531 - SURFACE
      ?auto_532 - SURFACE
    )
    :vars
    (
      ?auto_537 - HOIST
      ?auto_538 - PLACE
      ?auto_536 - PLACE
      ?auto_539 - HOIST
      ?auto_535 - SURFACE
      ?auto_534 - SURFACE
      ?auto_533 - TRUCK
      ?auto_540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_537 ?auto_538 ) ( IS-CRATE ?auto_531 ) ( not ( = ?auto_531 ?auto_532 ) ) ( not ( = ?auto_536 ?auto_538 ) ) ( HOIST-AT ?auto_539 ?auto_536 ) ( not ( = ?auto_537 ?auto_539 ) ) ( SURFACE-AT ?auto_531 ?auto_536 ) ( ON ?auto_531 ?auto_535 ) ( CLEAR ?auto_531 ) ( not ( = ?auto_531 ?auto_535 ) ) ( not ( = ?auto_532 ?auto_535 ) ) ( SURFACE-AT ?auto_534 ?auto_538 ) ( CLEAR ?auto_534 ) ( IS-CRATE ?auto_532 ) ( not ( = ?auto_531 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_534 ) ) ( not ( = ?auto_535 ?auto_534 ) ) ( AVAILABLE ?auto_537 ) ( TRUCK-AT ?auto_533 ?auto_536 ) ( AVAILABLE ?auto_539 ) ( SURFACE-AT ?auto_532 ?auto_536 ) ( ON ?auto_532 ?auto_540 ) ( CLEAR ?auto_532 ) ( not ( = ?auto_531 ?auto_540 ) ) ( not ( = ?auto_532 ?auto_540 ) ) ( not ( = ?auto_535 ?auto_540 ) ) ( not ( = ?auto_534 ?auto_540 ) ) )
    :subtasks
    ( ( !LIFT ?auto_539 ?auto_532 ?auto_540 ?auto_536 )
      ( MAKE-ON ?auto_531 ?auto_532 )
      ( MAKE-ON-VERIFY ?auto_531 ?auto_532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_541 - SURFACE
      ?auto_542 - SURFACE
    )
    :vars
    (
      ?auto_545 - HOIST
      ?auto_550 - PLACE
      ?auto_546 - PLACE
      ?auto_549 - HOIST
      ?auto_548 - SURFACE
      ?auto_544 - SURFACE
      ?auto_543 - SURFACE
      ?auto_547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545 ?auto_550 ) ( IS-CRATE ?auto_541 ) ( not ( = ?auto_541 ?auto_542 ) ) ( not ( = ?auto_546 ?auto_550 ) ) ( HOIST-AT ?auto_549 ?auto_546 ) ( not ( = ?auto_545 ?auto_549 ) ) ( SURFACE-AT ?auto_541 ?auto_546 ) ( ON ?auto_541 ?auto_548 ) ( CLEAR ?auto_541 ) ( not ( = ?auto_541 ?auto_548 ) ) ( not ( = ?auto_542 ?auto_548 ) ) ( SURFACE-AT ?auto_544 ?auto_550 ) ( CLEAR ?auto_544 ) ( IS-CRATE ?auto_542 ) ( not ( = ?auto_541 ?auto_544 ) ) ( not ( = ?auto_542 ?auto_544 ) ) ( not ( = ?auto_548 ?auto_544 ) ) ( AVAILABLE ?auto_545 ) ( AVAILABLE ?auto_549 ) ( SURFACE-AT ?auto_542 ?auto_546 ) ( ON ?auto_542 ?auto_543 ) ( CLEAR ?auto_542 ) ( not ( = ?auto_541 ?auto_543 ) ) ( not ( = ?auto_542 ?auto_543 ) ) ( not ( = ?auto_548 ?auto_543 ) ) ( not ( = ?auto_544 ?auto_543 ) ) ( TRUCK-AT ?auto_547 ?auto_550 ) )
    :subtasks
    ( ( !DRIVE ?auto_547 ?auto_550 ?auto_546 )
      ( MAKE-ON ?auto_541 ?auto_542 )
      ( MAKE-ON-VERIFY ?auto_541 ?auto_542 ) )
  )

)

