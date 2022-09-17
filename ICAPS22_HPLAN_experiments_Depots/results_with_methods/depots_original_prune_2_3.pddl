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
      ?auto_387 - SURFACE
      ?auto_388 - SURFACE
    )
    :vars
    (
      ?auto_389 - HOIST
      ?auto_390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389 ?auto_390 ) ( SURFACE-AT ?auto_388 ?auto_390 ) ( CLEAR ?auto_388 ) ( LIFTING ?auto_389 ?auto_387 ) ( IS-CRATE ?auto_387 ) ( not ( = ?auto_387 ?auto_388 ) ) )
    :subtasks
    ( ( !DROP ?auto_389 ?auto_387 ?auto_388 ?auto_390 )
      ( MAKE-ON-VERIFY ?auto_387 ?auto_388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_391 - SURFACE
      ?auto_392 - SURFACE
    )
    :vars
    (
      ?auto_394 - HOIST
      ?auto_393 - PLACE
      ?auto_395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_394 ?auto_393 ) ( SURFACE-AT ?auto_392 ?auto_393 ) ( CLEAR ?auto_392 ) ( IS-CRATE ?auto_391 ) ( not ( = ?auto_391 ?auto_392 ) ) ( TRUCK-AT ?auto_395 ?auto_393 ) ( AVAILABLE ?auto_394 ) ( IN ?auto_391 ?auto_395 ) )
    :subtasks
    ( ( !UNLOAD ?auto_394 ?auto_391 ?auto_395 ?auto_393 )
      ( MAKE-ON ?auto_391 ?auto_392 )
      ( MAKE-ON-VERIFY ?auto_391 ?auto_392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_396 - SURFACE
      ?auto_397 - SURFACE
    )
    :vars
    (
      ?auto_400 - HOIST
      ?auto_399 - PLACE
      ?auto_398 - TRUCK
      ?auto_401 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_400 ?auto_399 ) ( SURFACE-AT ?auto_397 ?auto_399 ) ( CLEAR ?auto_397 ) ( IS-CRATE ?auto_396 ) ( not ( = ?auto_396 ?auto_397 ) ) ( AVAILABLE ?auto_400 ) ( IN ?auto_396 ?auto_398 ) ( TRUCK-AT ?auto_398 ?auto_401 ) ( not ( = ?auto_401 ?auto_399 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_398 ?auto_401 ?auto_399 )
      ( MAKE-ON ?auto_396 ?auto_397 )
      ( MAKE-ON-VERIFY ?auto_396 ?auto_397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_402 - SURFACE
      ?auto_403 - SURFACE
    )
    :vars
    (
      ?auto_406 - HOIST
      ?auto_404 - PLACE
      ?auto_405 - TRUCK
      ?auto_407 - PLACE
      ?auto_408 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_406 ?auto_404 ) ( SURFACE-AT ?auto_403 ?auto_404 ) ( CLEAR ?auto_403 ) ( IS-CRATE ?auto_402 ) ( not ( = ?auto_402 ?auto_403 ) ) ( AVAILABLE ?auto_406 ) ( TRUCK-AT ?auto_405 ?auto_407 ) ( not ( = ?auto_407 ?auto_404 ) ) ( HOIST-AT ?auto_408 ?auto_407 ) ( LIFTING ?auto_408 ?auto_402 ) ( not ( = ?auto_406 ?auto_408 ) ) )
    :subtasks
    ( ( !LOAD ?auto_408 ?auto_402 ?auto_405 ?auto_407 )
      ( MAKE-ON ?auto_402 ?auto_403 )
      ( MAKE-ON-VERIFY ?auto_402 ?auto_403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_409 - SURFACE
      ?auto_410 - SURFACE
    )
    :vars
    (
      ?auto_415 - HOIST
      ?auto_411 - PLACE
      ?auto_412 - TRUCK
      ?auto_413 - PLACE
      ?auto_414 - HOIST
      ?auto_416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_415 ?auto_411 ) ( SURFACE-AT ?auto_410 ?auto_411 ) ( CLEAR ?auto_410 ) ( IS-CRATE ?auto_409 ) ( not ( = ?auto_409 ?auto_410 ) ) ( AVAILABLE ?auto_415 ) ( TRUCK-AT ?auto_412 ?auto_413 ) ( not ( = ?auto_413 ?auto_411 ) ) ( HOIST-AT ?auto_414 ?auto_413 ) ( not ( = ?auto_415 ?auto_414 ) ) ( AVAILABLE ?auto_414 ) ( SURFACE-AT ?auto_409 ?auto_413 ) ( ON ?auto_409 ?auto_416 ) ( CLEAR ?auto_409 ) ( not ( = ?auto_409 ?auto_416 ) ) ( not ( = ?auto_410 ?auto_416 ) ) )
    :subtasks
    ( ( !LIFT ?auto_414 ?auto_409 ?auto_416 ?auto_413 )
      ( MAKE-ON ?auto_409 ?auto_410 )
      ( MAKE-ON-VERIFY ?auto_409 ?auto_410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_417 - SURFACE
      ?auto_418 - SURFACE
    )
    :vars
    (
      ?auto_424 - HOIST
      ?auto_423 - PLACE
      ?auto_419 - PLACE
      ?auto_422 - HOIST
      ?auto_420 - SURFACE
      ?auto_421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424 ?auto_423 ) ( SURFACE-AT ?auto_418 ?auto_423 ) ( CLEAR ?auto_418 ) ( IS-CRATE ?auto_417 ) ( not ( = ?auto_417 ?auto_418 ) ) ( AVAILABLE ?auto_424 ) ( not ( = ?auto_419 ?auto_423 ) ) ( HOIST-AT ?auto_422 ?auto_419 ) ( not ( = ?auto_424 ?auto_422 ) ) ( AVAILABLE ?auto_422 ) ( SURFACE-AT ?auto_417 ?auto_419 ) ( ON ?auto_417 ?auto_420 ) ( CLEAR ?auto_417 ) ( not ( = ?auto_417 ?auto_420 ) ) ( not ( = ?auto_418 ?auto_420 ) ) ( TRUCK-AT ?auto_421 ?auto_423 ) )
    :subtasks
    ( ( !DRIVE ?auto_421 ?auto_423 ?auto_419 )
      ( MAKE-ON ?auto_417 ?auto_418 )
      ( MAKE-ON-VERIFY ?auto_417 ?auto_418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_465 - SURFACE
      ?auto_466 - SURFACE
    )
    :vars
    (
      ?auto_472 - HOIST
      ?auto_470 - PLACE
      ?auto_471 - PLACE
      ?auto_467 - HOIST
      ?auto_469 - SURFACE
      ?auto_468 - TRUCK
      ?auto_473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_472 ?auto_470 ) ( IS-CRATE ?auto_465 ) ( not ( = ?auto_465 ?auto_466 ) ) ( not ( = ?auto_471 ?auto_470 ) ) ( HOIST-AT ?auto_467 ?auto_471 ) ( not ( = ?auto_472 ?auto_467 ) ) ( AVAILABLE ?auto_467 ) ( SURFACE-AT ?auto_465 ?auto_471 ) ( ON ?auto_465 ?auto_469 ) ( CLEAR ?auto_465 ) ( not ( = ?auto_465 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( TRUCK-AT ?auto_468 ?auto_470 ) ( SURFACE-AT ?auto_473 ?auto_470 ) ( CLEAR ?auto_473 ) ( LIFTING ?auto_472 ?auto_466 ) ( IS-CRATE ?auto_466 ) ( not ( = ?auto_465 ?auto_473 ) ) ( not ( = ?auto_466 ?auto_473 ) ) ( not ( = ?auto_469 ?auto_473 ) ) )
    :subtasks
    ( ( !DROP ?auto_472 ?auto_466 ?auto_473 ?auto_470 )
      ( MAKE-ON ?auto_465 ?auto_466 )
      ( MAKE-ON-VERIFY ?auto_465 ?auto_466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_474 - SURFACE
      ?auto_475 - SURFACE
    )
    :vars
    (
      ?auto_482 - HOIST
      ?auto_481 - PLACE
      ?auto_480 - PLACE
      ?auto_476 - HOIST
      ?auto_479 - SURFACE
      ?auto_478 - TRUCK
      ?auto_477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482 ?auto_481 ) ( IS-CRATE ?auto_474 ) ( not ( = ?auto_474 ?auto_475 ) ) ( not ( = ?auto_480 ?auto_481 ) ) ( HOIST-AT ?auto_476 ?auto_480 ) ( not ( = ?auto_482 ?auto_476 ) ) ( AVAILABLE ?auto_476 ) ( SURFACE-AT ?auto_474 ?auto_480 ) ( ON ?auto_474 ?auto_479 ) ( CLEAR ?auto_474 ) ( not ( = ?auto_474 ?auto_479 ) ) ( not ( = ?auto_475 ?auto_479 ) ) ( TRUCK-AT ?auto_478 ?auto_481 ) ( SURFACE-AT ?auto_477 ?auto_481 ) ( CLEAR ?auto_477 ) ( IS-CRATE ?auto_475 ) ( not ( = ?auto_474 ?auto_477 ) ) ( not ( = ?auto_475 ?auto_477 ) ) ( not ( = ?auto_479 ?auto_477 ) ) ( AVAILABLE ?auto_482 ) ( IN ?auto_475 ?auto_478 ) )
    :subtasks
    ( ( !UNLOAD ?auto_482 ?auto_475 ?auto_478 ?auto_481 )
      ( MAKE-ON ?auto_474 ?auto_475 )
      ( MAKE-ON-VERIFY ?auto_474 ?auto_475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_483 - SURFACE
      ?auto_484 - SURFACE
    )
    :vars
    (
      ?auto_485 - HOIST
      ?auto_488 - PLACE
      ?auto_486 - PLACE
      ?auto_487 - HOIST
      ?auto_491 - SURFACE
      ?auto_489 - SURFACE
      ?auto_490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485 ?auto_488 ) ( IS-CRATE ?auto_483 ) ( not ( = ?auto_483 ?auto_484 ) ) ( not ( = ?auto_486 ?auto_488 ) ) ( HOIST-AT ?auto_487 ?auto_486 ) ( not ( = ?auto_485 ?auto_487 ) ) ( AVAILABLE ?auto_487 ) ( SURFACE-AT ?auto_483 ?auto_486 ) ( ON ?auto_483 ?auto_491 ) ( CLEAR ?auto_483 ) ( not ( = ?auto_483 ?auto_491 ) ) ( not ( = ?auto_484 ?auto_491 ) ) ( SURFACE-AT ?auto_489 ?auto_488 ) ( CLEAR ?auto_489 ) ( IS-CRATE ?auto_484 ) ( not ( = ?auto_483 ?auto_489 ) ) ( not ( = ?auto_484 ?auto_489 ) ) ( not ( = ?auto_491 ?auto_489 ) ) ( AVAILABLE ?auto_485 ) ( IN ?auto_484 ?auto_490 ) ( TRUCK-AT ?auto_490 ?auto_486 ) )
    :subtasks
    ( ( !DRIVE ?auto_490 ?auto_486 ?auto_488 )
      ( MAKE-ON ?auto_483 ?auto_484 )
      ( MAKE-ON-VERIFY ?auto_483 ?auto_484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_492 - SURFACE
      ?auto_493 - SURFACE
    )
    :vars
    (
      ?auto_500 - HOIST
      ?auto_498 - PLACE
      ?auto_495 - PLACE
      ?auto_496 - HOIST
      ?auto_497 - SURFACE
      ?auto_499 - SURFACE
      ?auto_494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_500 ?auto_498 ) ( IS-CRATE ?auto_492 ) ( not ( = ?auto_492 ?auto_493 ) ) ( not ( = ?auto_495 ?auto_498 ) ) ( HOIST-AT ?auto_496 ?auto_495 ) ( not ( = ?auto_500 ?auto_496 ) ) ( SURFACE-AT ?auto_492 ?auto_495 ) ( ON ?auto_492 ?auto_497 ) ( CLEAR ?auto_492 ) ( not ( = ?auto_492 ?auto_497 ) ) ( not ( = ?auto_493 ?auto_497 ) ) ( SURFACE-AT ?auto_499 ?auto_498 ) ( CLEAR ?auto_499 ) ( IS-CRATE ?auto_493 ) ( not ( = ?auto_492 ?auto_499 ) ) ( not ( = ?auto_493 ?auto_499 ) ) ( not ( = ?auto_497 ?auto_499 ) ) ( AVAILABLE ?auto_500 ) ( TRUCK-AT ?auto_494 ?auto_495 ) ( LIFTING ?auto_496 ?auto_493 ) )
    :subtasks
    ( ( !LOAD ?auto_496 ?auto_493 ?auto_494 ?auto_495 )
      ( MAKE-ON ?auto_492 ?auto_493 )
      ( MAKE-ON-VERIFY ?auto_492 ?auto_493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_501 - SURFACE
      ?auto_502 - SURFACE
    )
    :vars
    (
      ?auto_506 - HOIST
      ?auto_507 - PLACE
      ?auto_509 - PLACE
      ?auto_504 - HOIST
      ?auto_508 - SURFACE
      ?auto_503 - SURFACE
      ?auto_505 - TRUCK
      ?auto_510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_506 ?auto_507 ) ( IS-CRATE ?auto_501 ) ( not ( = ?auto_501 ?auto_502 ) ) ( not ( = ?auto_509 ?auto_507 ) ) ( HOIST-AT ?auto_504 ?auto_509 ) ( not ( = ?auto_506 ?auto_504 ) ) ( SURFACE-AT ?auto_501 ?auto_509 ) ( ON ?auto_501 ?auto_508 ) ( CLEAR ?auto_501 ) ( not ( = ?auto_501 ?auto_508 ) ) ( not ( = ?auto_502 ?auto_508 ) ) ( SURFACE-AT ?auto_503 ?auto_507 ) ( CLEAR ?auto_503 ) ( IS-CRATE ?auto_502 ) ( not ( = ?auto_501 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( not ( = ?auto_508 ?auto_503 ) ) ( AVAILABLE ?auto_506 ) ( TRUCK-AT ?auto_505 ?auto_509 ) ( AVAILABLE ?auto_504 ) ( SURFACE-AT ?auto_502 ?auto_509 ) ( ON ?auto_502 ?auto_510 ) ( CLEAR ?auto_502 ) ( not ( = ?auto_501 ?auto_510 ) ) ( not ( = ?auto_502 ?auto_510 ) ) ( not ( = ?auto_508 ?auto_510 ) ) ( not ( = ?auto_503 ?auto_510 ) ) )
    :subtasks
    ( ( !LIFT ?auto_504 ?auto_502 ?auto_510 ?auto_509 )
      ( MAKE-ON ?auto_501 ?auto_502 )
      ( MAKE-ON-VERIFY ?auto_501 ?auto_502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_511 - SURFACE
      ?auto_512 - SURFACE
    )
    :vars
    (
      ?auto_514 - HOIST
      ?auto_517 - PLACE
      ?auto_513 - PLACE
      ?auto_518 - HOIST
      ?auto_519 - SURFACE
      ?auto_520 - SURFACE
      ?auto_516 - SURFACE
      ?auto_515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_514 ?auto_517 ) ( IS-CRATE ?auto_511 ) ( not ( = ?auto_511 ?auto_512 ) ) ( not ( = ?auto_513 ?auto_517 ) ) ( HOIST-AT ?auto_518 ?auto_513 ) ( not ( = ?auto_514 ?auto_518 ) ) ( SURFACE-AT ?auto_511 ?auto_513 ) ( ON ?auto_511 ?auto_519 ) ( CLEAR ?auto_511 ) ( not ( = ?auto_511 ?auto_519 ) ) ( not ( = ?auto_512 ?auto_519 ) ) ( SURFACE-AT ?auto_520 ?auto_517 ) ( CLEAR ?auto_520 ) ( IS-CRATE ?auto_512 ) ( not ( = ?auto_511 ?auto_520 ) ) ( not ( = ?auto_512 ?auto_520 ) ) ( not ( = ?auto_519 ?auto_520 ) ) ( AVAILABLE ?auto_514 ) ( AVAILABLE ?auto_518 ) ( SURFACE-AT ?auto_512 ?auto_513 ) ( ON ?auto_512 ?auto_516 ) ( CLEAR ?auto_512 ) ( not ( = ?auto_511 ?auto_516 ) ) ( not ( = ?auto_512 ?auto_516 ) ) ( not ( = ?auto_519 ?auto_516 ) ) ( not ( = ?auto_520 ?auto_516 ) ) ( TRUCK-AT ?auto_515 ?auto_517 ) )
    :subtasks
    ( ( !DRIVE ?auto_515 ?auto_517 ?auto_513 )
      ( MAKE-ON ?auto_511 ?auto_512 )
      ( MAKE-ON-VERIFY ?auto_511 ?auto_512 ) )
  )

)

