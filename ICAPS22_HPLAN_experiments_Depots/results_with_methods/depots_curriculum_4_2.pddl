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
      ?auto_332 - SURFACE
      ?auto_333 - SURFACE
    )
    :vars
    (
      ?auto_334 - HOIST
      ?auto_335 - PLACE
      ?auto_337 - PLACE
      ?auto_338 - HOIST
      ?auto_339 - SURFACE
      ?auto_336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334 ?auto_335 ) ( SURFACE-AT ?auto_333 ?auto_335 ) ( CLEAR ?auto_333 ) ( IS-CRATE ?auto_332 ) ( AVAILABLE ?auto_334 ) ( not ( = ?auto_337 ?auto_335 ) ) ( HOIST-AT ?auto_338 ?auto_337 ) ( AVAILABLE ?auto_338 ) ( SURFACE-AT ?auto_332 ?auto_337 ) ( ON ?auto_332 ?auto_339 ) ( CLEAR ?auto_332 ) ( TRUCK-AT ?auto_336 ?auto_335 ) ( not ( = ?auto_332 ?auto_333 ) ) ( not ( = ?auto_332 ?auto_339 ) ) ( not ( = ?auto_333 ?auto_339 ) ) ( not ( = ?auto_334 ?auto_338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_336 ?auto_335 ?auto_337 )
      ( !LIFT ?auto_338 ?auto_332 ?auto_339 ?auto_337 )
      ( !LOAD ?auto_338 ?auto_332 ?auto_336 ?auto_337 )
      ( !DRIVE ?auto_336 ?auto_337 ?auto_335 )
      ( !UNLOAD ?auto_334 ?auto_332 ?auto_336 ?auto_335 )
      ( !DROP ?auto_334 ?auto_332 ?auto_333 ?auto_335 )
      ( MAKE-ON-VERIFY ?auto_332 ?auto_333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_342 - SURFACE
      ?auto_343 - SURFACE
    )
    :vars
    (
      ?auto_344 - HOIST
      ?auto_345 - PLACE
      ?auto_347 - PLACE
      ?auto_348 - HOIST
      ?auto_349 - SURFACE
      ?auto_346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_344 ?auto_345 ) ( SURFACE-AT ?auto_343 ?auto_345 ) ( CLEAR ?auto_343 ) ( IS-CRATE ?auto_342 ) ( AVAILABLE ?auto_344 ) ( not ( = ?auto_347 ?auto_345 ) ) ( HOIST-AT ?auto_348 ?auto_347 ) ( AVAILABLE ?auto_348 ) ( SURFACE-AT ?auto_342 ?auto_347 ) ( ON ?auto_342 ?auto_349 ) ( CLEAR ?auto_342 ) ( TRUCK-AT ?auto_346 ?auto_345 ) ( not ( = ?auto_342 ?auto_343 ) ) ( not ( = ?auto_342 ?auto_349 ) ) ( not ( = ?auto_343 ?auto_349 ) ) ( not ( = ?auto_344 ?auto_348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_346 ?auto_345 ?auto_347 )
      ( !LIFT ?auto_348 ?auto_342 ?auto_349 ?auto_347 )
      ( !LOAD ?auto_348 ?auto_342 ?auto_346 ?auto_347 )
      ( !DRIVE ?auto_346 ?auto_347 ?auto_345 )
      ( !UNLOAD ?auto_344 ?auto_342 ?auto_346 ?auto_345 )
      ( !DROP ?auto_344 ?auto_342 ?auto_343 ?auto_345 )
      ( MAKE-ON-VERIFY ?auto_342 ?auto_343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_352 - SURFACE
      ?auto_353 - SURFACE
    )
    :vars
    (
      ?auto_354 - HOIST
      ?auto_355 - PLACE
      ?auto_357 - PLACE
      ?auto_358 - HOIST
      ?auto_359 - SURFACE
      ?auto_356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_354 ?auto_355 ) ( SURFACE-AT ?auto_353 ?auto_355 ) ( CLEAR ?auto_353 ) ( IS-CRATE ?auto_352 ) ( AVAILABLE ?auto_354 ) ( not ( = ?auto_357 ?auto_355 ) ) ( HOIST-AT ?auto_358 ?auto_357 ) ( AVAILABLE ?auto_358 ) ( SURFACE-AT ?auto_352 ?auto_357 ) ( ON ?auto_352 ?auto_359 ) ( CLEAR ?auto_352 ) ( TRUCK-AT ?auto_356 ?auto_355 ) ( not ( = ?auto_352 ?auto_353 ) ) ( not ( = ?auto_352 ?auto_359 ) ) ( not ( = ?auto_353 ?auto_359 ) ) ( not ( = ?auto_354 ?auto_358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_356 ?auto_355 ?auto_357 )
      ( !LIFT ?auto_358 ?auto_352 ?auto_359 ?auto_357 )
      ( !LOAD ?auto_358 ?auto_352 ?auto_356 ?auto_357 )
      ( !DRIVE ?auto_356 ?auto_357 ?auto_355 )
      ( !UNLOAD ?auto_354 ?auto_352 ?auto_356 ?auto_355 )
      ( !DROP ?auto_354 ?auto_352 ?auto_353 ?auto_355 )
      ( MAKE-ON-VERIFY ?auto_352 ?auto_353 ) )
  )

  ( :method MAKE-ON
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
    ( and ( HOIST-AT ?auto_364 ?auto_365 ) ( SURFACE-AT ?auto_363 ?auto_365 ) ( CLEAR ?auto_363 ) ( IS-CRATE ?auto_362 ) ( AVAILABLE ?auto_364 ) ( not ( = ?auto_367 ?auto_365 ) ) ( HOIST-AT ?auto_368 ?auto_367 ) ( AVAILABLE ?auto_368 ) ( SURFACE-AT ?auto_362 ?auto_367 ) ( ON ?auto_362 ?auto_369 ) ( CLEAR ?auto_362 ) ( TRUCK-AT ?auto_366 ?auto_365 ) ( not ( = ?auto_362 ?auto_363 ) ) ( not ( = ?auto_362 ?auto_369 ) ) ( not ( = ?auto_363 ?auto_369 ) ) ( not ( = ?auto_364 ?auto_368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_366 ?auto_365 ?auto_367 )
      ( !LIFT ?auto_368 ?auto_362 ?auto_369 ?auto_367 )
      ( !LOAD ?auto_368 ?auto_362 ?auto_366 ?auto_367 )
      ( !DRIVE ?auto_366 ?auto_367 ?auto_365 )
      ( !UNLOAD ?auto_364 ?auto_362 ?auto_366 ?auto_365 )
      ( !DROP ?auto_364 ?auto_362 ?auto_363 ?auto_365 )
      ( MAKE-ON-VERIFY ?auto_362 ?auto_363 ) )
  )

)

