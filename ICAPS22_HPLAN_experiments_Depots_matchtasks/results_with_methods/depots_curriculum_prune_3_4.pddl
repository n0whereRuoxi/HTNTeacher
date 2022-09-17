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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_423 - SURFACE
      ?auto_424 - SURFACE
    )
    :vars
    (
      ?auto_425 - HOIST
      ?auto_426 - PLACE
      ?auto_428 - PLACE
      ?auto_429 - HOIST
      ?auto_430 - SURFACE
      ?auto_427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_425 ?auto_426 ) ( SURFACE-AT ?auto_423 ?auto_426 ) ( CLEAR ?auto_423 ) ( IS-CRATE ?auto_424 ) ( AVAILABLE ?auto_425 ) ( not ( = ?auto_428 ?auto_426 ) ) ( HOIST-AT ?auto_429 ?auto_428 ) ( AVAILABLE ?auto_429 ) ( SURFACE-AT ?auto_424 ?auto_428 ) ( ON ?auto_424 ?auto_430 ) ( CLEAR ?auto_424 ) ( TRUCK-AT ?auto_427 ?auto_426 ) ( not ( = ?auto_423 ?auto_424 ) ) ( not ( = ?auto_423 ?auto_430 ) ) ( not ( = ?auto_424 ?auto_430 ) ) ( not ( = ?auto_425 ?auto_429 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_427 ?auto_426 ?auto_428 )
      ( !LIFT ?auto_429 ?auto_424 ?auto_430 ?auto_428 )
      ( !LOAD ?auto_429 ?auto_424 ?auto_427 ?auto_428 )
      ( !DRIVE ?auto_427 ?auto_428 ?auto_426 )
      ( !UNLOAD ?auto_425 ?auto_424 ?auto_427 ?auto_426 )
      ( !DROP ?auto_425 ?auto_424 ?auto_423 ?auto_426 )
      ( MAKE-1CRATE-VERIFY ?auto_423 ?auto_424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_444 - SURFACE
      ?auto_445 - SURFACE
      ?auto_446 - SURFACE
    )
    :vars
    (
      ?auto_447 - HOIST
      ?auto_452 - PLACE
      ?auto_449 - PLACE
      ?auto_448 - HOIST
      ?auto_450 - SURFACE
      ?auto_453 - SURFACE
      ?auto_451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447 ?auto_452 ) ( IS-CRATE ?auto_446 ) ( not ( = ?auto_449 ?auto_452 ) ) ( HOIST-AT ?auto_448 ?auto_449 ) ( SURFACE-AT ?auto_446 ?auto_449 ) ( ON ?auto_446 ?auto_450 ) ( CLEAR ?auto_446 ) ( not ( = ?auto_445 ?auto_446 ) ) ( not ( = ?auto_445 ?auto_450 ) ) ( not ( = ?auto_446 ?auto_450 ) ) ( not ( = ?auto_447 ?auto_448 ) ) ( SURFACE-AT ?auto_444 ?auto_452 ) ( CLEAR ?auto_444 ) ( IS-CRATE ?auto_445 ) ( AVAILABLE ?auto_447 ) ( AVAILABLE ?auto_448 ) ( SURFACE-AT ?auto_445 ?auto_449 ) ( ON ?auto_445 ?auto_453 ) ( CLEAR ?auto_445 ) ( TRUCK-AT ?auto_451 ?auto_452 ) ( not ( = ?auto_444 ?auto_445 ) ) ( not ( = ?auto_444 ?auto_453 ) ) ( not ( = ?auto_445 ?auto_453 ) ) ( not ( = ?auto_444 ?auto_446 ) ) ( not ( = ?auto_444 ?auto_450 ) ) ( not ( = ?auto_446 ?auto_453 ) ) ( not ( = ?auto_450 ?auto_453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_444 ?auto_445 )
      ( MAKE-1CRATE ?auto_445 ?auto_446 )
      ( MAKE-2CRATE-VERIFY ?auto_444 ?auto_445 ?auto_446 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_468 - SURFACE
      ?auto_469 - SURFACE
      ?auto_470 - SURFACE
      ?auto_471 - SURFACE
    )
    :vars
    (
      ?auto_475 - HOIST
      ?auto_473 - PLACE
      ?auto_477 - PLACE
      ?auto_474 - HOIST
      ?auto_472 - SURFACE
      ?auto_481 - PLACE
      ?auto_480 - HOIST
      ?auto_479 - SURFACE
      ?auto_478 - SURFACE
      ?auto_476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_475 ?auto_473 ) ( IS-CRATE ?auto_471 ) ( not ( = ?auto_477 ?auto_473 ) ) ( HOIST-AT ?auto_474 ?auto_477 ) ( AVAILABLE ?auto_474 ) ( SURFACE-AT ?auto_471 ?auto_477 ) ( ON ?auto_471 ?auto_472 ) ( CLEAR ?auto_471 ) ( not ( = ?auto_470 ?auto_471 ) ) ( not ( = ?auto_470 ?auto_472 ) ) ( not ( = ?auto_471 ?auto_472 ) ) ( not ( = ?auto_475 ?auto_474 ) ) ( IS-CRATE ?auto_470 ) ( not ( = ?auto_481 ?auto_473 ) ) ( HOIST-AT ?auto_480 ?auto_481 ) ( SURFACE-AT ?auto_470 ?auto_481 ) ( ON ?auto_470 ?auto_479 ) ( CLEAR ?auto_470 ) ( not ( = ?auto_469 ?auto_470 ) ) ( not ( = ?auto_469 ?auto_479 ) ) ( not ( = ?auto_470 ?auto_479 ) ) ( not ( = ?auto_475 ?auto_480 ) ) ( SURFACE-AT ?auto_468 ?auto_473 ) ( CLEAR ?auto_468 ) ( IS-CRATE ?auto_469 ) ( AVAILABLE ?auto_475 ) ( AVAILABLE ?auto_480 ) ( SURFACE-AT ?auto_469 ?auto_481 ) ( ON ?auto_469 ?auto_478 ) ( CLEAR ?auto_469 ) ( TRUCK-AT ?auto_476 ?auto_473 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_468 ?auto_478 ) ) ( not ( = ?auto_469 ?auto_478 ) ) ( not ( = ?auto_468 ?auto_470 ) ) ( not ( = ?auto_468 ?auto_479 ) ) ( not ( = ?auto_470 ?auto_478 ) ) ( not ( = ?auto_479 ?auto_478 ) ) ( not ( = ?auto_468 ?auto_471 ) ) ( not ( = ?auto_468 ?auto_472 ) ) ( not ( = ?auto_469 ?auto_471 ) ) ( not ( = ?auto_469 ?auto_472 ) ) ( not ( = ?auto_471 ?auto_479 ) ) ( not ( = ?auto_471 ?auto_478 ) ) ( not ( = ?auto_477 ?auto_481 ) ) ( not ( = ?auto_474 ?auto_480 ) ) ( not ( = ?auto_472 ?auto_479 ) ) ( not ( = ?auto_472 ?auto_478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_468 ?auto_469 ?auto_470 )
      ( MAKE-1CRATE ?auto_470 ?auto_471 )
      ( MAKE-3CRATE-VERIFY ?auto_468 ?auto_469 ?auto_470 ?auto_471 ) )
  )

)

