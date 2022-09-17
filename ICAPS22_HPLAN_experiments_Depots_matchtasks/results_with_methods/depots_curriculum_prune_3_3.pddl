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
      ?auto_362 - SURFACE
      ?auto_363 - SURFACE
    )
    :vars
    (
      ?auto_364 - HOIST
      ?auto_365 - PLACE
      ?auto_367 - PLACE
      ?auto_368 - HOIST
      ?auto_369 - SURFACE
      ?auto_366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_364 ?auto_365 ) ( SURFACE-AT ?auto_362 ?auto_365 ) ( CLEAR ?auto_362 ) ( IS-CRATE ?auto_363 ) ( AVAILABLE ?auto_364 ) ( not ( = ?auto_367 ?auto_365 ) ) ( HOIST-AT ?auto_368 ?auto_367 ) ( AVAILABLE ?auto_368 ) ( SURFACE-AT ?auto_363 ?auto_367 ) ( ON ?auto_363 ?auto_369 ) ( CLEAR ?auto_363 ) ( TRUCK-AT ?auto_366 ?auto_365 ) ( not ( = ?auto_362 ?auto_363 ) ) ( not ( = ?auto_362 ?auto_369 ) ) ( not ( = ?auto_363 ?auto_369 ) ) ( not ( = ?auto_364 ?auto_368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_366 ?auto_365 ?auto_367 )
      ( !LIFT ?auto_368 ?auto_363 ?auto_369 ?auto_367 )
      ( !LOAD ?auto_368 ?auto_363 ?auto_366 ?auto_367 )
      ( !DRIVE ?auto_366 ?auto_367 ?auto_365 )
      ( !UNLOAD ?auto_364 ?auto_363 ?auto_366 ?auto_365 )
      ( !DROP ?auto_364 ?auto_363 ?auto_362 ?auto_365 )
      ( MAKE-1CRATE-VERIFY ?auto_362 ?auto_363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_383 - SURFACE
      ?auto_384 - SURFACE
      ?auto_385 - SURFACE
    )
    :vars
    (
      ?auto_389 - HOIST
      ?auto_386 - PLACE
      ?auto_390 - PLACE
      ?auto_387 - HOIST
      ?auto_391 - SURFACE
      ?auto_392 - SURFACE
      ?auto_388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389 ?auto_386 ) ( IS-CRATE ?auto_385 ) ( not ( = ?auto_390 ?auto_386 ) ) ( HOIST-AT ?auto_387 ?auto_390 ) ( SURFACE-AT ?auto_385 ?auto_390 ) ( ON ?auto_385 ?auto_391 ) ( CLEAR ?auto_385 ) ( not ( = ?auto_384 ?auto_385 ) ) ( not ( = ?auto_384 ?auto_391 ) ) ( not ( = ?auto_385 ?auto_391 ) ) ( not ( = ?auto_389 ?auto_387 ) ) ( SURFACE-AT ?auto_383 ?auto_386 ) ( CLEAR ?auto_383 ) ( IS-CRATE ?auto_384 ) ( AVAILABLE ?auto_389 ) ( AVAILABLE ?auto_387 ) ( SURFACE-AT ?auto_384 ?auto_390 ) ( ON ?auto_384 ?auto_392 ) ( CLEAR ?auto_384 ) ( TRUCK-AT ?auto_388 ?auto_386 ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_383 ?auto_392 ) ) ( not ( = ?auto_384 ?auto_392 ) ) ( not ( = ?auto_383 ?auto_385 ) ) ( not ( = ?auto_383 ?auto_391 ) ) ( not ( = ?auto_385 ?auto_392 ) ) ( not ( = ?auto_391 ?auto_392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_383 ?auto_384 )
      ( MAKE-1CRATE ?auto_384 ?auto_385 )
      ( MAKE-2CRATE-VERIFY ?auto_383 ?auto_384 ?auto_385 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_407 - SURFACE
      ?auto_408 - SURFACE
      ?auto_409 - SURFACE
      ?auto_410 - SURFACE
    )
    :vars
    (
      ?auto_414 - HOIST
      ?auto_413 - PLACE
      ?auto_411 - PLACE
      ?auto_412 - HOIST
      ?auto_415 - SURFACE
      ?auto_419 - PLACE
      ?auto_420 - HOIST
      ?auto_417 - SURFACE
      ?auto_418 - SURFACE
      ?auto_416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_414 ?auto_413 ) ( IS-CRATE ?auto_410 ) ( not ( = ?auto_411 ?auto_413 ) ) ( HOIST-AT ?auto_412 ?auto_411 ) ( AVAILABLE ?auto_412 ) ( SURFACE-AT ?auto_410 ?auto_411 ) ( ON ?auto_410 ?auto_415 ) ( CLEAR ?auto_410 ) ( not ( = ?auto_409 ?auto_410 ) ) ( not ( = ?auto_409 ?auto_415 ) ) ( not ( = ?auto_410 ?auto_415 ) ) ( not ( = ?auto_414 ?auto_412 ) ) ( IS-CRATE ?auto_409 ) ( not ( = ?auto_419 ?auto_413 ) ) ( HOIST-AT ?auto_420 ?auto_419 ) ( SURFACE-AT ?auto_409 ?auto_419 ) ( ON ?auto_409 ?auto_417 ) ( CLEAR ?auto_409 ) ( not ( = ?auto_408 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_417 ) ) ( not ( = ?auto_409 ?auto_417 ) ) ( not ( = ?auto_414 ?auto_420 ) ) ( SURFACE-AT ?auto_407 ?auto_413 ) ( CLEAR ?auto_407 ) ( IS-CRATE ?auto_408 ) ( AVAILABLE ?auto_414 ) ( AVAILABLE ?auto_420 ) ( SURFACE-AT ?auto_408 ?auto_419 ) ( ON ?auto_408 ?auto_418 ) ( CLEAR ?auto_408 ) ( TRUCK-AT ?auto_416 ?auto_413 ) ( not ( = ?auto_407 ?auto_408 ) ) ( not ( = ?auto_407 ?auto_418 ) ) ( not ( = ?auto_408 ?auto_418 ) ) ( not ( = ?auto_407 ?auto_409 ) ) ( not ( = ?auto_407 ?auto_417 ) ) ( not ( = ?auto_409 ?auto_418 ) ) ( not ( = ?auto_417 ?auto_418 ) ) ( not ( = ?auto_407 ?auto_410 ) ) ( not ( = ?auto_407 ?auto_415 ) ) ( not ( = ?auto_408 ?auto_410 ) ) ( not ( = ?auto_408 ?auto_415 ) ) ( not ( = ?auto_410 ?auto_417 ) ) ( not ( = ?auto_410 ?auto_418 ) ) ( not ( = ?auto_411 ?auto_419 ) ) ( not ( = ?auto_412 ?auto_420 ) ) ( not ( = ?auto_415 ?auto_417 ) ) ( not ( = ?auto_415 ?auto_418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407 ?auto_408 ?auto_409 )
      ( MAKE-1CRATE ?auto_409 ?auto_410 )
      ( MAKE-3CRATE-VERIFY ?auto_407 ?auto_408 ?auto_409 ?auto_410 ) )
  )

)

