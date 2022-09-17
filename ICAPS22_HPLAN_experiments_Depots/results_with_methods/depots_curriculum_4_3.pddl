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
      ?auto_372 - SURFACE
      ?auto_373 - SURFACE
    )
    :vars
    (
      ?auto_374 - HOIST
      ?auto_375 - PLACE
      ?auto_377 - PLACE
      ?auto_378 - HOIST
      ?auto_379 - SURFACE
      ?auto_376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_374 ?auto_375 ) ( SURFACE-AT ?auto_373 ?auto_375 ) ( CLEAR ?auto_373 ) ( IS-CRATE ?auto_372 ) ( AVAILABLE ?auto_374 ) ( not ( = ?auto_377 ?auto_375 ) ) ( HOIST-AT ?auto_378 ?auto_377 ) ( AVAILABLE ?auto_378 ) ( SURFACE-AT ?auto_372 ?auto_377 ) ( ON ?auto_372 ?auto_379 ) ( CLEAR ?auto_372 ) ( TRUCK-AT ?auto_376 ?auto_375 ) ( not ( = ?auto_372 ?auto_373 ) ) ( not ( = ?auto_372 ?auto_379 ) ) ( not ( = ?auto_373 ?auto_379 ) ) ( not ( = ?auto_374 ?auto_378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_376 ?auto_375 ?auto_377 )
      ( !LIFT ?auto_378 ?auto_372 ?auto_379 ?auto_377 )
      ( !LOAD ?auto_378 ?auto_372 ?auto_376 ?auto_377 )
      ( !DRIVE ?auto_376 ?auto_377 ?auto_375 )
      ( !UNLOAD ?auto_374 ?auto_372 ?auto_376 ?auto_375 )
      ( !DROP ?auto_374 ?auto_372 ?auto_373 ?auto_375 )
      ( MAKE-ON-VERIFY ?auto_372 ?auto_373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_382 - SURFACE
      ?auto_383 - SURFACE
    )
    :vars
    (
      ?auto_384 - HOIST
      ?auto_385 - PLACE
      ?auto_387 - PLACE
      ?auto_388 - HOIST
      ?auto_389 - SURFACE
      ?auto_386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384 ?auto_385 ) ( SURFACE-AT ?auto_383 ?auto_385 ) ( CLEAR ?auto_383 ) ( IS-CRATE ?auto_382 ) ( AVAILABLE ?auto_384 ) ( not ( = ?auto_387 ?auto_385 ) ) ( HOIST-AT ?auto_388 ?auto_387 ) ( AVAILABLE ?auto_388 ) ( SURFACE-AT ?auto_382 ?auto_387 ) ( ON ?auto_382 ?auto_389 ) ( CLEAR ?auto_382 ) ( TRUCK-AT ?auto_386 ?auto_385 ) ( not ( = ?auto_382 ?auto_383 ) ) ( not ( = ?auto_382 ?auto_389 ) ) ( not ( = ?auto_383 ?auto_389 ) ) ( not ( = ?auto_384 ?auto_388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_386 ?auto_385 ?auto_387 )
      ( !LIFT ?auto_388 ?auto_382 ?auto_389 ?auto_387 )
      ( !LOAD ?auto_388 ?auto_382 ?auto_386 ?auto_387 )
      ( !DRIVE ?auto_386 ?auto_387 ?auto_385 )
      ( !UNLOAD ?auto_384 ?auto_382 ?auto_386 ?auto_385 )
      ( !DROP ?auto_384 ?auto_382 ?auto_383 ?auto_385 )
      ( MAKE-ON-VERIFY ?auto_382 ?auto_383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_392 - SURFACE
      ?auto_393 - SURFACE
    )
    :vars
    (
      ?auto_394 - HOIST
      ?auto_395 - PLACE
      ?auto_397 - PLACE
      ?auto_398 - HOIST
      ?auto_399 - SURFACE
      ?auto_396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_394 ?auto_395 ) ( SURFACE-AT ?auto_393 ?auto_395 ) ( CLEAR ?auto_393 ) ( IS-CRATE ?auto_392 ) ( AVAILABLE ?auto_394 ) ( not ( = ?auto_397 ?auto_395 ) ) ( HOIST-AT ?auto_398 ?auto_397 ) ( AVAILABLE ?auto_398 ) ( SURFACE-AT ?auto_392 ?auto_397 ) ( ON ?auto_392 ?auto_399 ) ( CLEAR ?auto_392 ) ( TRUCK-AT ?auto_396 ?auto_395 ) ( not ( = ?auto_392 ?auto_393 ) ) ( not ( = ?auto_392 ?auto_399 ) ) ( not ( = ?auto_393 ?auto_399 ) ) ( not ( = ?auto_394 ?auto_398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_396 ?auto_395 ?auto_397 )
      ( !LIFT ?auto_398 ?auto_392 ?auto_399 ?auto_397 )
      ( !LOAD ?auto_398 ?auto_392 ?auto_396 ?auto_397 )
      ( !DRIVE ?auto_396 ?auto_397 ?auto_395 )
      ( !UNLOAD ?auto_394 ?auto_392 ?auto_396 ?auto_395 )
      ( !DROP ?auto_394 ?auto_392 ?auto_393 ?auto_395 )
      ( MAKE-ON-VERIFY ?auto_392 ?auto_393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_402 - SURFACE
      ?auto_403 - SURFACE
    )
    :vars
    (
      ?auto_404 - HOIST
      ?auto_405 - PLACE
      ?auto_407 - PLACE
      ?auto_408 - HOIST
      ?auto_409 - SURFACE
      ?auto_406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404 ?auto_405 ) ( SURFACE-AT ?auto_403 ?auto_405 ) ( CLEAR ?auto_403 ) ( IS-CRATE ?auto_402 ) ( AVAILABLE ?auto_404 ) ( not ( = ?auto_407 ?auto_405 ) ) ( HOIST-AT ?auto_408 ?auto_407 ) ( AVAILABLE ?auto_408 ) ( SURFACE-AT ?auto_402 ?auto_407 ) ( ON ?auto_402 ?auto_409 ) ( CLEAR ?auto_402 ) ( TRUCK-AT ?auto_406 ?auto_405 ) ( not ( = ?auto_402 ?auto_403 ) ) ( not ( = ?auto_402 ?auto_409 ) ) ( not ( = ?auto_403 ?auto_409 ) ) ( not ( = ?auto_404 ?auto_408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_406 ?auto_405 ?auto_407 )
      ( !LIFT ?auto_408 ?auto_402 ?auto_409 ?auto_407 )
      ( !LOAD ?auto_408 ?auto_402 ?auto_406 ?auto_407 )
      ( !DRIVE ?auto_406 ?auto_407 ?auto_405 )
      ( !UNLOAD ?auto_404 ?auto_402 ?auto_406 ?auto_405 )
      ( !DROP ?auto_404 ?auto_402 ?auto_403 ?auto_405 )
      ( MAKE-ON-VERIFY ?auto_402 ?auto_403 ) )
  )

)

