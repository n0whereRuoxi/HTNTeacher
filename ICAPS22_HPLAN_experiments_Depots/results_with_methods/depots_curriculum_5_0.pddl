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
      ?auto_452 - SURFACE
      ?auto_453 - SURFACE
    )
    :vars
    (
      ?auto_454 - HOIST
      ?auto_455 - PLACE
      ?auto_457 - PLACE
      ?auto_458 - HOIST
      ?auto_459 - SURFACE
      ?auto_456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454 ?auto_455 ) ( SURFACE-AT ?auto_453 ?auto_455 ) ( CLEAR ?auto_453 ) ( IS-CRATE ?auto_452 ) ( AVAILABLE ?auto_454 ) ( not ( = ?auto_457 ?auto_455 ) ) ( HOIST-AT ?auto_458 ?auto_457 ) ( AVAILABLE ?auto_458 ) ( SURFACE-AT ?auto_452 ?auto_457 ) ( ON ?auto_452 ?auto_459 ) ( CLEAR ?auto_452 ) ( TRUCK-AT ?auto_456 ?auto_455 ) ( not ( = ?auto_452 ?auto_453 ) ) ( not ( = ?auto_452 ?auto_459 ) ) ( not ( = ?auto_453 ?auto_459 ) ) ( not ( = ?auto_454 ?auto_458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_456 ?auto_455 ?auto_457 )
      ( !LIFT ?auto_458 ?auto_452 ?auto_459 ?auto_457 )
      ( !LOAD ?auto_458 ?auto_452 ?auto_456 ?auto_457 )
      ( !DRIVE ?auto_456 ?auto_457 ?auto_455 )
      ( !UNLOAD ?auto_454 ?auto_452 ?auto_456 ?auto_455 )
      ( !DROP ?auto_454 ?auto_452 ?auto_453 ?auto_455 )
      ( MAKE-ON-VERIFY ?auto_452 ?auto_453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_462 - SURFACE
      ?auto_463 - SURFACE
    )
    :vars
    (
      ?auto_464 - HOIST
      ?auto_465 - PLACE
      ?auto_467 - PLACE
      ?auto_468 - HOIST
      ?auto_469 - SURFACE
      ?auto_466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_464 ?auto_465 ) ( SURFACE-AT ?auto_463 ?auto_465 ) ( CLEAR ?auto_463 ) ( IS-CRATE ?auto_462 ) ( AVAILABLE ?auto_464 ) ( not ( = ?auto_467 ?auto_465 ) ) ( HOIST-AT ?auto_468 ?auto_467 ) ( AVAILABLE ?auto_468 ) ( SURFACE-AT ?auto_462 ?auto_467 ) ( ON ?auto_462 ?auto_469 ) ( CLEAR ?auto_462 ) ( TRUCK-AT ?auto_466 ?auto_465 ) ( not ( = ?auto_462 ?auto_463 ) ) ( not ( = ?auto_462 ?auto_469 ) ) ( not ( = ?auto_463 ?auto_469 ) ) ( not ( = ?auto_464 ?auto_468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_466 ?auto_465 ?auto_467 )
      ( !LIFT ?auto_468 ?auto_462 ?auto_469 ?auto_467 )
      ( !LOAD ?auto_468 ?auto_462 ?auto_466 ?auto_467 )
      ( !DRIVE ?auto_466 ?auto_467 ?auto_465 )
      ( !UNLOAD ?auto_464 ?auto_462 ?auto_466 ?auto_465 )
      ( !DROP ?auto_464 ?auto_462 ?auto_463 ?auto_465 )
      ( MAKE-ON-VERIFY ?auto_462 ?auto_463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_472 - SURFACE
      ?auto_473 - SURFACE
    )
    :vars
    (
      ?auto_474 - HOIST
      ?auto_475 - PLACE
      ?auto_477 - PLACE
      ?auto_478 - HOIST
      ?auto_479 - SURFACE
      ?auto_476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_474 ?auto_475 ) ( SURFACE-AT ?auto_473 ?auto_475 ) ( CLEAR ?auto_473 ) ( IS-CRATE ?auto_472 ) ( AVAILABLE ?auto_474 ) ( not ( = ?auto_477 ?auto_475 ) ) ( HOIST-AT ?auto_478 ?auto_477 ) ( AVAILABLE ?auto_478 ) ( SURFACE-AT ?auto_472 ?auto_477 ) ( ON ?auto_472 ?auto_479 ) ( CLEAR ?auto_472 ) ( TRUCK-AT ?auto_476 ?auto_475 ) ( not ( = ?auto_472 ?auto_473 ) ) ( not ( = ?auto_472 ?auto_479 ) ) ( not ( = ?auto_473 ?auto_479 ) ) ( not ( = ?auto_474 ?auto_478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_476 ?auto_475 ?auto_477 )
      ( !LIFT ?auto_478 ?auto_472 ?auto_479 ?auto_477 )
      ( !LOAD ?auto_478 ?auto_472 ?auto_476 ?auto_477 )
      ( !DRIVE ?auto_476 ?auto_477 ?auto_475 )
      ( !UNLOAD ?auto_474 ?auto_472 ?auto_476 ?auto_475 )
      ( !DROP ?auto_474 ?auto_472 ?auto_473 ?auto_475 )
      ( MAKE-ON-VERIFY ?auto_472 ?auto_473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_482 - SURFACE
      ?auto_483 - SURFACE
    )
    :vars
    (
      ?auto_484 - HOIST
      ?auto_485 - PLACE
      ?auto_487 - PLACE
      ?auto_488 - HOIST
      ?auto_489 - SURFACE
      ?auto_486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484 ?auto_485 ) ( SURFACE-AT ?auto_483 ?auto_485 ) ( CLEAR ?auto_483 ) ( IS-CRATE ?auto_482 ) ( AVAILABLE ?auto_484 ) ( not ( = ?auto_487 ?auto_485 ) ) ( HOIST-AT ?auto_488 ?auto_487 ) ( AVAILABLE ?auto_488 ) ( SURFACE-AT ?auto_482 ?auto_487 ) ( ON ?auto_482 ?auto_489 ) ( CLEAR ?auto_482 ) ( TRUCK-AT ?auto_486 ?auto_485 ) ( not ( = ?auto_482 ?auto_483 ) ) ( not ( = ?auto_482 ?auto_489 ) ) ( not ( = ?auto_483 ?auto_489 ) ) ( not ( = ?auto_484 ?auto_488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_486 ?auto_485 ?auto_487 )
      ( !LIFT ?auto_488 ?auto_482 ?auto_489 ?auto_487 )
      ( !LOAD ?auto_488 ?auto_482 ?auto_486 ?auto_487 )
      ( !DRIVE ?auto_486 ?auto_487 ?auto_485 )
      ( !UNLOAD ?auto_484 ?auto_482 ?auto_486 ?auto_485 )
      ( !DROP ?auto_484 ?auto_482 ?auto_483 ?auto_485 )
      ( MAKE-ON-VERIFY ?auto_482 ?auto_483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_492 - SURFACE
      ?auto_493 - SURFACE
    )
    :vars
    (
      ?auto_494 - HOIST
      ?auto_495 - PLACE
      ?auto_497 - PLACE
      ?auto_498 - HOIST
      ?auto_499 - SURFACE
      ?auto_496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_494 ?auto_495 ) ( SURFACE-AT ?auto_493 ?auto_495 ) ( CLEAR ?auto_493 ) ( IS-CRATE ?auto_492 ) ( AVAILABLE ?auto_494 ) ( not ( = ?auto_497 ?auto_495 ) ) ( HOIST-AT ?auto_498 ?auto_497 ) ( AVAILABLE ?auto_498 ) ( SURFACE-AT ?auto_492 ?auto_497 ) ( ON ?auto_492 ?auto_499 ) ( CLEAR ?auto_492 ) ( TRUCK-AT ?auto_496 ?auto_495 ) ( not ( = ?auto_492 ?auto_493 ) ) ( not ( = ?auto_492 ?auto_499 ) ) ( not ( = ?auto_493 ?auto_499 ) ) ( not ( = ?auto_494 ?auto_498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_496 ?auto_495 ?auto_497 )
      ( !LIFT ?auto_498 ?auto_492 ?auto_499 ?auto_497 )
      ( !LOAD ?auto_498 ?auto_492 ?auto_496 ?auto_497 )
      ( !DRIVE ?auto_496 ?auto_497 ?auto_495 )
      ( !UNLOAD ?auto_494 ?auto_492 ?auto_496 ?auto_495 )
      ( !DROP ?auto_494 ?auto_492 ?auto_493 ?auto_495 )
      ( MAKE-ON-VERIFY ?auto_492 ?auto_493 ) )
  )

)

