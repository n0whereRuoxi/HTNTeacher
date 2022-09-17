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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744333 - SURFACE
      ?auto_744334 - SURFACE
    )
    :vars
    (
      ?auto_744335 - HOIST
      ?auto_744336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744335 ?auto_744336 ) ( SURFACE-AT ?auto_744333 ?auto_744336 ) ( CLEAR ?auto_744333 ) ( LIFTING ?auto_744335 ?auto_744334 ) ( IS-CRATE ?auto_744334 ) ( not ( = ?auto_744333 ?auto_744334 ) ) )
    :subtasks
    ( ( !DROP ?auto_744335 ?auto_744334 ?auto_744333 ?auto_744336 )
      ( MAKE-1CRATE-VERIFY ?auto_744333 ?auto_744334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744337 - SURFACE
      ?auto_744338 - SURFACE
    )
    :vars
    (
      ?auto_744340 - HOIST
      ?auto_744339 - PLACE
      ?auto_744341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744340 ?auto_744339 ) ( SURFACE-AT ?auto_744337 ?auto_744339 ) ( CLEAR ?auto_744337 ) ( IS-CRATE ?auto_744338 ) ( not ( = ?auto_744337 ?auto_744338 ) ) ( TRUCK-AT ?auto_744341 ?auto_744339 ) ( AVAILABLE ?auto_744340 ) ( IN ?auto_744338 ?auto_744341 ) )
    :subtasks
    ( ( !UNLOAD ?auto_744340 ?auto_744338 ?auto_744341 ?auto_744339 )
      ( MAKE-1CRATE ?auto_744337 ?auto_744338 )
      ( MAKE-1CRATE-VERIFY ?auto_744337 ?auto_744338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744342 - SURFACE
      ?auto_744343 - SURFACE
    )
    :vars
    (
      ?auto_744346 - HOIST
      ?auto_744345 - PLACE
      ?auto_744344 - TRUCK
      ?auto_744347 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744346 ?auto_744345 ) ( SURFACE-AT ?auto_744342 ?auto_744345 ) ( CLEAR ?auto_744342 ) ( IS-CRATE ?auto_744343 ) ( not ( = ?auto_744342 ?auto_744343 ) ) ( AVAILABLE ?auto_744346 ) ( IN ?auto_744343 ?auto_744344 ) ( TRUCK-AT ?auto_744344 ?auto_744347 ) ( not ( = ?auto_744347 ?auto_744345 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744344 ?auto_744347 ?auto_744345 )
      ( MAKE-1CRATE ?auto_744342 ?auto_744343 )
      ( MAKE-1CRATE-VERIFY ?auto_744342 ?auto_744343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744348 - SURFACE
      ?auto_744349 - SURFACE
    )
    :vars
    (
      ?auto_744353 - HOIST
      ?auto_744350 - PLACE
      ?auto_744351 - TRUCK
      ?auto_744352 - PLACE
      ?auto_744354 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744353 ?auto_744350 ) ( SURFACE-AT ?auto_744348 ?auto_744350 ) ( CLEAR ?auto_744348 ) ( IS-CRATE ?auto_744349 ) ( not ( = ?auto_744348 ?auto_744349 ) ) ( AVAILABLE ?auto_744353 ) ( TRUCK-AT ?auto_744351 ?auto_744352 ) ( not ( = ?auto_744352 ?auto_744350 ) ) ( HOIST-AT ?auto_744354 ?auto_744352 ) ( LIFTING ?auto_744354 ?auto_744349 ) ( not ( = ?auto_744353 ?auto_744354 ) ) )
    :subtasks
    ( ( !LOAD ?auto_744354 ?auto_744349 ?auto_744351 ?auto_744352 )
      ( MAKE-1CRATE ?auto_744348 ?auto_744349 )
      ( MAKE-1CRATE-VERIFY ?auto_744348 ?auto_744349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744355 - SURFACE
      ?auto_744356 - SURFACE
    )
    :vars
    (
      ?auto_744358 - HOIST
      ?auto_744357 - PLACE
      ?auto_744359 - TRUCK
      ?auto_744361 - PLACE
      ?auto_744360 - HOIST
      ?auto_744362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744358 ?auto_744357 ) ( SURFACE-AT ?auto_744355 ?auto_744357 ) ( CLEAR ?auto_744355 ) ( IS-CRATE ?auto_744356 ) ( not ( = ?auto_744355 ?auto_744356 ) ) ( AVAILABLE ?auto_744358 ) ( TRUCK-AT ?auto_744359 ?auto_744361 ) ( not ( = ?auto_744361 ?auto_744357 ) ) ( HOIST-AT ?auto_744360 ?auto_744361 ) ( not ( = ?auto_744358 ?auto_744360 ) ) ( AVAILABLE ?auto_744360 ) ( SURFACE-AT ?auto_744356 ?auto_744361 ) ( ON ?auto_744356 ?auto_744362 ) ( CLEAR ?auto_744356 ) ( not ( = ?auto_744355 ?auto_744362 ) ) ( not ( = ?auto_744356 ?auto_744362 ) ) )
    :subtasks
    ( ( !LIFT ?auto_744360 ?auto_744356 ?auto_744362 ?auto_744361 )
      ( MAKE-1CRATE ?auto_744355 ?auto_744356 )
      ( MAKE-1CRATE-VERIFY ?auto_744355 ?auto_744356 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744363 - SURFACE
      ?auto_744364 - SURFACE
    )
    :vars
    (
      ?auto_744365 - HOIST
      ?auto_744370 - PLACE
      ?auto_744367 - PLACE
      ?auto_744368 - HOIST
      ?auto_744366 - SURFACE
      ?auto_744369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744365 ?auto_744370 ) ( SURFACE-AT ?auto_744363 ?auto_744370 ) ( CLEAR ?auto_744363 ) ( IS-CRATE ?auto_744364 ) ( not ( = ?auto_744363 ?auto_744364 ) ) ( AVAILABLE ?auto_744365 ) ( not ( = ?auto_744367 ?auto_744370 ) ) ( HOIST-AT ?auto_744368 ?auto_744367 ) ( not ( = ?auto_744365 ?auto_744368 ) ) ( AVAILABLE ?auto_744368 ) ( SURFACE-AT ?auto_744364 ?auto_744367 ) ( ON ?auto_744364 ?auto_744366 ) ( CLEAR ?auto_744364 ) ( not ( = ?auto_744363 ?auto_744366 ) ) ( not ( = ?auto_744364 ?auto_744366 ) ) ( TRUCK-AT ?auto_744369 ?auto_744370 ) )
    :subtasks
    ( ( !DRIVE ?auto_744369 ?auto_744370 ?auto_744367 )
      ( MAKE-1CRATE ?auto_744363 ?auto_744364 )
      ( MAKE-1CRATE-VERIFY ?auto_744363 ?auto_744364 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744380 - SURFACE
      ?auto_744381 - SURFACE
      ?auto_744382 - SURFACE
    )
    :vars
    (
      ?auto_744384 - HOIST
      ?auto_744383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744384 ?auto_744383 ) ( SURFACE-AT ?auto_744381 ?auto_744383 ) ( CLEAR ?auto_744381 ) ( LIFTING ?auto_744384 ?auto_744382 ) ( IS-CRATE ?auto_744382 ) ( not ( = ?auto_744381 ?auto_744382 ) ) ( ON ?auto_744381 ?auto_744380 ) ( not ( = ?auto_744380 ?auto_744381 ) ) ( not ( = ?auto_744380 ?auto_744382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744381 ?auto_744382 )
      ( MAKE-2CRATE-VERIFY ?auto_744380 ?auto_744381 ?auto_744382 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744390 - SURFACE
      ?auto_744391 - SURFACE
      ?auto_744392 - SURFACE
    )
    :vars
    (
      ?auto_744393 - HOIST
      ?auto_744395 - PLACE
      ?auto_744394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744393 ?auto_744395 ) ( SURFACE-AT ?auto_744391 ?auto_744395 ) ( CLEAR ?auto_744391 ) ( IS-CRATE ?auto_744392 ) ( not ( = ?auto_744391 ?auto_744392 ) ) ( TRUCK-AT ?auto_744394 ?auto_744395 ) ( AVAILABLE ?auto_744393 ) ( IN ?auto_744392 ?auto_744394 ) ( ON ?auto_744391 ?auto_744390 ) ( not ( = ?auto_744390 ?auto_744391 ) ) ( not ( = ?auto_744390 ?auto_744392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744391 ?auto_744392 )
      ( MAKE-2CRATE-VERIFY ?auto_744390 ?auto_744391 ?auto_744392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744396 - SURFACE
      ?auto_744397 - SURFACE
    )
    :vars
    (
      ?auto_744399 - HOIST
      ?auto_744401 - PLACE
      ?auto_744398 - TRUCK
      ?auto_744400 - SURFACE
      ?auto_744402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744399 ?auto_744401 ) ( SURFACE-AT ?auto_744396 ?auto_744401 ) ( CLEAR ?auto_744396 ) ( IS-CRATE ?auto_744397 ) ( not ( = ?auto_744396 ?auto_744397 ) ) ( AVAILABLE ?auto_744399 ) ( IN ?auto_744397 ?auto_744398 ) ( ON ?auto_744396 ?auto_744400 ) ( not ( = ?auto_744400 ?auto_744396 ) ) ( not ( = ?auto_744400 ?auto_744397 ) ) ( TRUCK-AT ?auto_744398 ?auto_744402 ) ( not ( = ?auto_744402 ?auto_744401 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744398 ?auto_744402 ?auto_744401 )
      ( MAKE-2CRATE ?auto_744400 ?auto_744396 ?auto_744397 )
      ( MAKE-1CRATE-VERIFY ?auto_744396 ?auto_744397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744403 - SURFACE
      ?auto_744404 - SURFACE
      ?auto_744405 - SURFACE
    )
    :vars
    (
      ?auto_744409 - HOIST
      ?auto_744407 - PLACE
      ?auto_744408 - TRUCK
      ?auto_744406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744409 ?auto_744407 ) ( SURFACE-AT ?auto_744404 ?auto_744407 ) ( CLEAR ?auto_744404 ) ( IS-CRATE ?auto_744405 ) ( not ( = ?auto_744404 ?auto_744405 ) ) ( AVAILABLE ?auto_744409 ) ( IN ?auto_744405 ?auto_744408 ) ( ON ?auto_744404 ?auto_744403 ) ( not ( = ?auto_744403 ?auto_744404 ) ) ( not ( = ?auto_744403 ?auto_744405 ) ) ( TRUCK-AT ?auto_744408 ?auto_744406 ) ( not ( = ?auto_744406 ?auto_744407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744404 ?auto_744405 )
      ( MAKE-2CRATE-VERIFY ?auto_744403 ?auto_744404 ?auto_744405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744410 - SURFACE
      ?auto_744411 - SURFACE
    )
    :vars
    (
      ?auto_744415 - HOIST
      ?auto_744414 - PLACE
      ?auto_744412 - SURFACE
      ?auto_744416 - TRUCK
      ?auto_744413 - PLACE
      ?auto_744417 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744415 ?auto_744414 ) ( SURFACE-AT ?auto_744410 ?auto_744414 ) ( CLEAR ?auto_744410 ) ( IS-CRATE ?auto_744411 ) ( not ( = ?auto_744410 ?auto_744411 ) ) ( AVAILABLE ?auto_744415 ) ( ON ?auto_744410 ?auto_744412 ) ( not ( = ?auto_744412 ?auto_744410 ) ) ( not ( = ?auto_744412 ?auto_744411 ) ) ( TRUCK-AT ?auto_744416 ?auto_744413 ) ( not ( = ?auto_744413 ?auto_744414 ) ) ( HOIST-AT ?auto_744417 ?auto_744413 ) ( LIFTING ?auto_744417 ?auto_744411 ) ( not ( = ?auto_744415 ?auto_744417 ) ) )
    :subtasks
    ( ( !LOAD ?auto_744417 ?auto_744411 ?auto_744416 ?auto_744413 )
      ( MAKE-2CRATE ?auto_744412 ?auto_744410 ?auto_744411 )
      ( MAKE-1CRATE-VERIFY ?auto_744410 ?auto_744411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744418 - SURFACE
      ?auto_744419 - SURFACE
      ?auto_744420 - SURFACE
    )
    :vars
    (
      ?auto_744422 - HOIST
      ?auto_744424 - PLACE
      ?auto_744421 - TRUCK
      ?auto_744425 - PLACE
      ?auto_744423 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744422 ?auto_744424 ) ( SURFACE-AT ?auto_744419 ?auto_744424 ) ( CLEAR ?auto_744419 ) ( IS-CRATE ?auto_744420 ) ( not ( = ?auto_744419 ?auto_744420 ) ) ( AVAILABLE ?auto_744422 ) ( ON ?auto_744419 ?auto_744418 ) ( not ( = ?auto_744418 ?auto_744419 ) ) ( not ( = ?auto_744418 ?auto_744420 ) ) ( TRUCK-AT ?auto_744421 ?auto_744425 ) ( not ( = ?auto_744425 ?auto_744424 ) ) ( HOIST-AT ?auto_744423 ?auto_744425 ) ( LIFTING ?auto_744423 ?auto_744420 ) ( not ( = ?auto_744422 ?auto_744423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744419 ?auto_744420 )
      ( MAKE-2CRATE-VERIFY ?auto_744418 ?auto_744419 ?auto_744420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744426 - SURFACE
      ?auto_744427 - SURFACE
    )
    :vars
    (
      ?auto_744430 - HOIST
      ?auto_744432 - PLACE
      ?auto_744428 - SURFACE
      ?auto_744433 - TRUCK
      ?auto_744429 - PLACE
      ?auto_744431 - HOIST
      ?auto_744434 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744430 ?auto_744432 ) ( SURFACE-AT ?auto_744426 ?auto_744432 ) ( CLEAR ?auto_744426 ) ( IS-CRATE ?auto_744427 ) ( not ( = ?auto_744426 ?auto_744427 ) ) ( AVAILABLE ?auto_744430 ) ( ON ?auto_744426 ?auto_744428 ) ( not ( = ?auto_744428 ?auto_744426 ) ) ( not ( = ?auto_744428 ?auto_744427 ) ) ( TRUCK-AT ?auto_744433 ?auto_744429 ) ( not ( = ?auto_744429 ?auto_744432 ) ) ( HOIST-AT ?auto_744431 ?auto_744429 ) ( not ( = ?auto_744430 ?auto_744431 ) ) ( AVAILABLE ?auto_744431 ) ( SURFACE-AT ?auto_744427 ?auto_744429 ) ( ON ?auto_744427 ?auto_744434 ) ( CLEAR ?auto_744427 ) ( not ( = ?auto_744426 ?auto_744434 ) ) ( not ( = ?auto_744427 ?auto_744434 ) ) ( not ( = ?auto_744428 ?auto_744434 ) ) )
    :subtasks
    ( ( !LIFT ?auto_744431 ?auto_744427 ?auto_744434 ?auto_744429 )
      ( MAKE-2CRATE ?auto_744428 ?auto_744426 ?auto_744427 )
      ( MAKE-1CRATE-VERIFY ?auto_744426 ?auto_744427 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744435 - SURFACE
      ?auto_744436 - SURFACE
      ?auto_744437 - SURFACE
    )
    :vars
    (
      ?auto_744442 - HOIST
      ?auto_744439 - PLACE
      ?auto_744438 - TRUCK
      ?auto_744440 - PLACE
      ?auto_744441 - HOIST
      ?auto_744443 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744442 ?auto_744439 ) ( SURFACE-AT ?auto_744436 ?auto_744439 ) ( CLEAR ?auto_744436 ) ( IS-CRATE ?auto_744437 ) ( not ( = ?auto_744436 ?auto_744437 ) ) ( AVAILABLE ?auto_744442 ) ( ON ?auto_744436 ?auto_744435 ) ( not ( = ?auto_744435 ?auto_744436 ) ) ( not ( = ?auto_744435 ?auto_744437 ) ) ( TRUCK-AT ?auto_744438 ?auto_744440 ) ( not ( = ?auto_744440 ?auto_744439 ) ) ( HOIST-AT ?auto_744441 ?auto_744440 ) ( not ( = ?auto_744442 ?auto_744441 ) ) ( AVAILABLE ?auto_744441 ) ( SURFACE-AT ?auto_744437 ?auto_744440 ) ( ON ?auto_744437 ?auto_744443 ) ( CLEAR ?auto_744437 ) ( not ( = ?auto_744436 ?auto_744443 ) ) ( not ( = ?auto_744437 ?auto_744443 ) ) ( not ( = ?auto_744435 ?auto_744443 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744436 ?auto_744437 )
      ( MAKE-2CRATE-VERIFY ?auto_744435 ?auto_744436 ?auto_744437 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744444 - SURFACE
      ?auto_744445 - SURFACE
    )
    :vars
    (
      ?auto_744448 - HOIST
      ?auto_744452 - PLACE
      ?auto_744451 - SURFACE
      ?auto_744447 - PLACE
      ?auto_744449 - HOIST
      ?auto_744450 - SURFACE
      ?auto_744446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744448 ?auto_744452 ) ( SURFACE-AT ?auto_744444 ?auto_744452 ) ( CLEAR ?auto_744444 ) ( IS-CRATE ?auto_744445 ) ( not ( = ?auto_744444 ?auto_744445 ) ) ( AVAILABLE ?auto_744448 ) ( ON ?auto_744444 ?auto_744451 ) ( not ( = ?auto_744451 ?auto_744444 ) ) ( not ( = ?auto_744451 ?auto_744445 ) ) ( not ( = ?auto_744447 ?auto_744452 ) ) ( HOIST-AT ?auto_744449 ?auto_744447 ) ( not ( = ?auto_744448 ?auto_744449 ) ) ( AVAILABLE ?auto_744449 ) ( SURFACE-AT ?auto_744445 ?auto_744447 ) ( ON ?auto_744445 ?auto_744450 ) ( CLEAR ?auto_744445 ) ( not ( = ?auto_744444 ?auto_744450 ) ) ( not ( = ?auto_744445 ?auto_744450 ) ) ( not ( = ?auto_744451 ?auto_744450 ) ) ( TRUCK-AT ?auto_744446 ?auto_744452 ) )
    :subtasks
    ( ( !DRIVE ?auto_744446 ?auto_744452 ?auto_744447 )
      ( MAKE-2CRATE ?auto_744451 ?auto_744444 ?auto_744445 )
      ( MAKE-1CRATE-VERIFY ?auto_744444 ?auto_744445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744453 - SURFACE
      ?auto_744454 - SURFACE
      ?auto_744455 - SURFACE
    )
    :vars
    (
      ?auto_744458 - HOIST
      ?auto_744461 - PLACE
      ?auto_744460 - PLACE
      ?auto_744456 - HOIST
      ?auto_744457 - SURFACE
      ?auto_744459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744458 ?auto_744461 ) ( SURFACE-AT ?auto_744454 ?auto_744461 ) ( CLEAR ?auto_744454 ) ( IS-CRATE ?auto_744455 ) ( not ( = ?auto_744454 ?auto_744455 ) ) ( AVAILABLE ?auto_744458 ) ( ON ?auto_744454 ?auto_744453 ) ( not ( = ?auto_744453 ?auto_744454 ) ) ( not ( = ?auto_744453 ?auto_744455 ) ) ( not ( = ?auto_744460 ?auto_744461 ) ) ( HOIST-AT ?auto_744456 ?auto_744460 ) ( not ( = ?auto_744458 ?auto_744456 ) ) ( AVAILABLE ?auto_744456 ) ( SURFACE-AT ?auto_744455 ?auto_744460 ) ( ON ?auto_744455 ?auto_744457 ) ( CLEAR ?auto_744455 ) ( not ( = ?auto_744454 ?auto_744457 ) ) ( not ( = ?auto_744455 ?auto_744457 ) ) ( not ( = ?auto_744453 ?auto_744457 ) ) ( TRUCK-AT ?auto_744459 ?auto_744461 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744454 ?auto_744455 )
      ( MAKE-2CRATE-VERIFY ?auto_744453 ?auto_744454 ?auto_744455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744462 - SURFACE
      ?auto_744463 - SURFACE
    )
    :vars
    (
      ?auto_744470 - HOIST
      ?auto_744469 - PLACE
      ?auto_744466 - SURFACE
      ?auto_744467 - PLACE
      ?auto_744465 - HOIST
      ?auto_744468 - SURFACE
      ?auto_744464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744470 ?auto_744469 ) ( IS-CRATE ?auto_744463 ) ( not ( = ?auto_744462 ?auto_744463 ) ) ( not ( = ?auto_744466 ?auto_744462 ) ) ( not ( = ?auto_744466 ?auto_744463 ) ) ( not ( = ?auto_744467 ?auto_744469 ) ) ( HOIST-AT ?auto_744465 ?auto_744467 ) ( not ( = ?auto_744470 ?auto_744465 ) ) ( AVAILABLE ?auto_744465 ) ( SURFACE-AT ?auto_744463 ?auto_744467 ) ( ON ?auto_744463 ?auto_744468 ) ( CLEAR ?auto_744463 ) ( not ( = ?auto_744462 ?auto_744468 ) ) ( not ( = ?auto_744463 ?auto_744468 ) ) ( not ( = ?auto_744466 ?auto_744468 ) ) ( TRUCK-AT ?auto_744464 ?auto_744469 ) ( SURFACE-AT ?auto_744466 ?auto_744469 ) ( CLEAR ?auto_744466 ) ( LIFTING ?auto_744470 ?auto_744462 ) ( IS-CRATE ?auto_744462 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744466 ?auto_744462 )
      ( MAKE-2CRATE ?auto_744466 ?auto_744462 ?auto_744463 )
      ( MAKE-1CRATE-VERIFY ?auto_744462 ?auto_744463 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744471 - SURFACE
      ?auto_744472 - SURFACE
      ?auto_744473 - SURFACE
    )
    :vars
    (
      ?auto_744475 - HOIST
      ?auto_744477 - PLACE
      ?auto_744474 - PLACE
      ?auto_744478 - HOIST
      ?auto_744476 - SURFACE
      ?auto_744479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744475 ?auto_744477 ) ( IS-CRATE ?auto_744473 ) ( not ( = ?auto_744472 ?auto_744473 ) ) ( not ( = ?auto_744471 ?auto_744472 ) ) ( not ( = ?auto_744471 ?auto_744473 ) ) ( not ( = ?auto_744474 ?auto_744477 ) ) ( HOIST-AT ?auto_744478 ?auto_744474 ) ( not ( = ?auto_744475 ?auto_744478 ) ) ( AVAILABLE ?auto_744478 ) ( SURFACE-AT ?auto_744473 ?auto_744474 ) ( ON ?auto_744473 ?auto_744476 ) ( CLEAR ?auto_744473 ) ( not ( = ?auto_744472 ?auto_744476 ) ) ( not ( = ?auto_744473 ?auto_744476 ) ) ( not ( = ?auto_744471 ?auto_744476 ) ) ( TRUCK-AT ?auto_744479 ?auto_744477 ) ( SURFACE-AT ?auto_744471 ?auto_744477 ) ( CLEAR ?auto_744471 ) ( LIFTING ?auto_744475 ?auto_744472 ) ( IS-CRATE ?auto_744472 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744472 ?auto_744473 )
      ( MAKE-2CRATE-VERIFY ?auto_744471 ?auto_744472 ?auto_744473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744480 - SURFACE
      ?auto_744481 - SURFACE
    )
    :vars
    (
      ?auto_744482 - HOIST
      ?auto_744484 - PLACE
      ?auto_744488 - SURFACE
      ?auto_744487 - PLACE
      ?auto_744486 - HOIST
      ?auto_744483 - SURFACE
      ?auto_744485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744482 ?auto_744484 ) ( IS-CRATE ?auto_744481 ) ( not ( = ?auto_744480 ?auto_744481 ) ) ( not ( = ?auto_744488 ?auto_744480 ) ) ( not ( = ?auto_744488 ?auto_744481 ) ) ( not ( = ?auto_744487 ?auto_744484 ) ) ( HOIST-AT ?auto_744486 ?auto_744487 ) ( not ( = ?auto_744482 ?auto_744486 ) ) ( AVAILABLE ?auto_744486 ) ( SURFACE-AT ?auto_744481 ?auto_744487 ) ( ON ?auto_744481 ?auto_744483 ) ( CLEAR ?auto_744481 ) ( not ( = ?auto_744480 ?auto_744483 ) ) ( not ( = ?auto_744481 ?auto_744483 ) ) ( not ( = ?auto_744488 ?auto_744483 ) ) ( TRUCK-AT ?auto_744485 ?auto_744484 ) ( SURFACE-AT ?auto_744488 ?auto_744484 ) ( CLEAR ?auto_744488 ) ( IS-CRATE ?auto_744480 ) ( AVAILABLE ?auto_744482 ) ( IN ?auto_744480 ?auto_744485 ) )
    :subtasks
    ( ( !UNLOAD ?auto_744482 ?auto_744480 ?auto_744485 ?auto_744484 )
      ( MAKE-2CRATE ?auto_744488 ?auto_744480 ?auto_744481 )
      ( MAKE-1CRATE-VERIFY ?auto_744480 ?auto_744481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744489 - SURFACE
      ?auto_744490 - SURFACE
      ?auto_744491 - SURFACE
    )
    :vars
    (
      ?auto_744494 - HOIST
      ?auto_744497 - PLACE
      ?auto_744492 - PLACE
      ?auto_744493 - HOIST
      ?auto_744496 - SURFACE
      ?auto_744495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744494 ?auto_744497 ) ( IS-CRATE ?auto_744491 ) ( not ( = ?auto_744490 ?auto_744491 ) ) ( not ( = ?auto_744489 ?auto_744490 ) ) ( not ( = ?auto_744489 ?auto_744491 ) ) ( not ( = ?auto_744492 ?auto_744497 ) ) ( HOIST-AT ?auto_744493 ?auto_744492 ) ( not ( = ?auto_744494 ?auto_744493 ) ) ( AVAILABLE ?auto_744493 ) ( SURFACE-AT ?auto_744491 ?auto_744492 ) ( ON ?auto_744491 ?auto_744496 ) ( CLEAR ?auto_744491 ) ( not ( = ?auto_744490 ?auto_744496 ) ) ( not ( = ?auto_744491 ?auto_744496 ) ) ( not ( = ?auto_744489 ?auto_744496 ) ) ( TRUCK-AT ?auto_744495 ?auto_744497 ) ( SURFACE-AT ?auto_744489 ?auto_744497 ) ( CLEAR ?auto_744489 ) ( IS-CRATE ?auto_744490 ) ( AVAILABLE ?auto_744494 ) ( IN ?auto_744490 ?auto_744495 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744490 ?auto_744491 )
      ( MAKE-2CRATE-VERIFY ?auto_744489 ?auto_744490 ?auto_744491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744534 - SURFACE
      ?auto_744535 - SURFACE
    )
    :vars
    (
      ?auto_744542 - HOIST
      ?auto_744536 - PLACE
      ?auto_744539 - SURFACE
      ?auto_744537 - PLACE
      ?auto_744538 - HOIST
      ?auto_744540 - SURFACE
      ?auto_744541 - TRUCK
      ?auto_744543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744542 ?auto_744536 ) ( SURFACE-AT ?auto_744534 ?auto_744536 ) ( CLEAR ?auto_744534 ) ( IS-CRATE ?auto_744535 ) ( not ( = ?auto_744534 ?auto_744535 ) ) ( AVAILABLE ?auto_744542 ) ( ON ?auto_744534 ?auto_744539 ) ( not ( = ?auto_744539 ?auto_744534 ) ) ( not ( = ?auto_744539 ?auto_744535 ) ) ( not ( = ?auto_744537 ?auto_744536 ) ) ( HOIST-AT ?auto_744538 ?auto_744537 ) ( not ( = ?auto_744542 ?auto_744538 ) ) ( AVAILABLE ?auto_744538 ) ( SURFACE-AT ?auto_744535 ?auto_744537 ) ( ON ?auto_744535 ?auto_744540 ) ( CLEAR ?auto_744535 ) ( not ( = ?auto_744534 ?auto_744540 ) ) ( not ( = ?auto_744535 ?auto_744540 ) ) ( not ( = ?auto_744539 ?auto_744540 ) ) ( TRUCK-AT ?auto_744541 ?auto_744543 ) ( not ( = ?auto_744543 ?auto_744536 ) ) ( not ( = ?auto_744537 ?auto_744543 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744541 ?auto_744543 ?auto_744536 )
      ( MAKE-1CRATE ?auto_744534 ?auto_744535 )
      ( MAKE-1CRATE-VERIFY ?auto_744534 ?auto_744535 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744574 - SURFACE
      ?auto_744575 - SURFACE
      ?auto_744576 - SURFACE
      ?auto_744573 - SURFACE
    )
    :vars
    (
      ?auto_744577 - HOIST
      ?auto_744578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744577 ?auto_744578 ) ( SURFACE-AT ?auto_744576 ?auto_744578 ) ( CLEAR ?auto_744576 ) ( LIFTING ?auto_744577 ?auto_744573 ) ( IS-CRATE ?auto_744573 ) ( not ( = ?auto_744576 ?auto_744573 ) ) ( ON ?auto_744575 ?auto_744574 ) ( ON ?auto_744576 ?auto_744575 ) ( not ( = ?auto_744574 ?auto_744575 ) ) ( not ( = ?auto_744574 ?auto_744576 ) ) ( not ( = ?auto_744574 ?auto_744573 ) ) ( not ( = ?auto_744575 ?auto_744576 ) ) ( not ( = ?auto_744575 ?auto_744573 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744576 ?auto_744573 )
      ( MAKE-3CRATE-VERIFY ?auto_744574 ?auto_744575 ?auto_744576 ?auto_744573 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744591 - SURFACE
      ?auto_744592 - SURFACE
      ?auto_744593 - SURFACE
      ?auto_744590 - SURFACE
    )
    :vars
    (
      ?auto_744596 - HOIST
      ?auto_744594 - PLACE
      ?auto_744595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744596 ?auto_744594 ) ( SURFACE-AT ?auto_744593 ?auto_744594 ) ( CLEAR ?auto_744593 ) ( IS-CRATE ?auto_744590 ) ( not ( = ?auto_744593 ?auto_744590 ) ) ( TRUCK-AT ?auto_744595 ?auto_744594 ) ( AVAILABLE ?auto_744596 ) ( IN ?auto_744590 ?auto_744595 ) ( ON ?auto_744593 ?auto_744592 ) ( not ( = ?auto_744592 ?auto_744593 ) ) ( not ( = ?auto_744592 ?auto_744590 ) ) ( ON ?auto_744592 ?auto_744591 ) ( not ( = ?auto_744591 ?auto_744592 ) ) ( not ( = ?auto_744591 ?auto_744593 ) ) ( not ( = ?auto_744591 ?auto_744590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744592 ?auto_744593 ?auto_744590 )
      ( MAKE-3CRATE-VERIFY ?auto_744591 ?auto_744592 ?auto_744593 ?auto_744590 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744612 - SURFACE
      ?auto_744613 - SURFACE
      ?auto_744614 - SURFACE
      ?auto_744611 - SURFACE
    )
    :vars
    (
      ?auto_744617 - HOIST
      ?auto_744616 - PLACE
      ?auto_744615 - TRUCK
      ?auto_744618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744617 ?auto_744616 ) ( SURFACE-AT ?auto_744614 ?auto_744616 ) ( CLEAR ?auto_744614 ) ( IS-CRATE ?auto_744611 ) ( not ( = ?auto_744614 ?auto_744611 ) ) ( AVAILABLE ?auto_744617 ) ( IN ?auto_744611 ?auto_744615 ) ( ON ?auto_744614 ?auto_744613 ) ( not ( = ?auto_744613 ?auto_744614 ) ) ( not ( = ?auto_744613 ?auto_744611 ) ) ( TRUCK-AT ?auto_744615 ?auto_744618 ) ( not ( = ?auto_744618 ?auto_744616 ) ) ( ON ?auto_744613 ?auto_744612 ) ( not ( = ?auto_744612 ?auto_744613 ) ) ( not ( = ?auto_744612 ?auto_744614 ) ) ( not ( = ?auto_744612 ?auto_744611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744613 ?auto_744614 ?auto_744611 )
      ( MAKE-3CRATE-VERIFY ?auto_744612 ?auto_744613 ?auto_744614 ?auto_744611 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744636 - SURFACE
      ?auto_744637 - SURFACE
      ?auto_744638 - SURFACE
      ?auto_744635 - SURFACE
    )
    :vars
    (
      ?auto_744643 - HOIST
      ?auto_744642 - PLACE
      ?auto_744639 - TRUCK
      ?auto_744640 - PLACE
      ?auto_744641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744643 ?auto_744642 ) ( SURFACE-AT ?auto_744638 ?auto_744642 ) ( CLEAR ?auto_744638 ) ( IS-CRATE ?auto_744635 ) ( not ( = ?auto_744638 ?auto_744635 ) ) ( AVAILABLE ?auto_744643 ) ( ON ?auto_744638 ?auto_744637 ) ( not ( = ?auto_744637 ?auto_744638 ) ) ( not ( = ?auto_744637 ?auto_744635 ) ) ( TRUCK-AT ?auto_744639 ?auto_744640 ) ( not ( = ?auto_744640 ?auto_744642 ) ) ( HOIST-AT ?auto_744641 ?auto_744640 ) ( LIFTING ?auto_744641 ?auto_744635 ) ( not ( = ?auto_744643 ?auto_744641 ) ) ( ON ?auto_744637 ?auto_744636 ) ( not ( = ?auto_744636 ?auto_744637 ) ) ( not ( = ?auto_744636 ?auto_744638 ) ) ( not ( = ?auto_744636 ?auto_744635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744637 ?auto_744638 ?auto_744635 )
      ( MAKE-3CRATE-VERIFY ?auto_744636 ?auto_744637 ?auto_744638 ?auto_744635 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744663 - SURFACE
      ?auto_744664 - SURFACE
      ?auto_744665 - SURFACE
      ?auto_744662 - SURFACE
    )
    :vars
    (
      ?auto_744667 - HOIST
      ?auto_744669 - PLACE
      ?auto_744668 - TRUCK
      ?auto_744666 - PLACE
      ?auto_744670 - HOIST
      ?auto_744671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744667 ?auto_744669 ) ( SURFACE-AT ?auto_744665 ?auto_744669 ) ( CLEAR ?auto_744665 ) ( IS-CRATE ?auto_744662 ) ( not ( = ?auto_744665 ?auto_744662 ) ) ( AVAILABLE ?auto_744667 ) ( ON ?auto_744665 ?auto_744664 ) ( not ( = ?auto_744664 ?auto_744665 ) ) ( not ( = ?auto_744664 ?auto_744662 ) ) ( TRUCK-AT ?auto_744668 ?auto_744666 ) ( not ( = ?auto_744666 ?auto_744669 ) ) ( HOIST-AT ?auto_744670 ?auto_744666 ) ( not ( = ?auto_744667 ?auto_744670 ) ) ( AVAILABLE ?auto_744670 ) ( SURFACE-AT ?auto_744662 ?auto_744666 ) ( ON ?auto_744662 ?auto_744671 ) ( CLEAR ?auto_744662 ) ( not ( = ?auto_744665 ?auto_744671 ) ) ( not ( = ?auto_744662 ?auto_744671 ) ) ( not ( = ?auto_744664 ?auto_744671 ) ) ( ON ?auto_744664 ?auto_744663 ) ( not ( = ?auto_744663 ?auto_744664 ) ) ( not ( = ?auto_744663 ?auto_744665 ) ) ( not ( = ?auto_744663 ?auto_744662 ) ) ( not ( = ?auto_744663 ?auto_744671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744664 ?auto_744665 ?auto_744662 )
      ( MAKE-3CRATE-VERIFY ?auto_744663 ?auto_744664 ?auto_744665 ?auto_744662 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744691 - SURFACE
      ?auto_744692 - SURFACE
      ?auto_744693 - SURFACE
      ?auto_744690 - SURFACE
    )
    :vars
    (
      ?auto_744696 - HOIST
      ?auto_744698 - PLACE
      ?auto_744695 - PLACE
      ?auto_744699 - HOIST
      ?auto_744694 - SURFACE
      ?auto_744697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744696 ?auto_744698 ) ( SURFACE-AT ?auto_744693 ?auto_744698 ) ( CLEAR ?auto_744693 ) ( IS-CRATE ?auto_744690 ) ( not ( = ?auto_744693 ?auto_744690 ) ) ( AVAILABLE ?auto_744696 ) ( ON ?auto_744693 ?auto_744692 ) ( not ( = ?auto_744692 ?auto_744693 ) ) ( not ( = ?auto_744692 ?auto_744690 ) ) ( not ( = ?auto_744695 ?auto_744698 ) ) ( HOIST-AT ?auto_744699 ?auto_744695 ) ( not ( = ?auto_744696 ?auto_744699 ) ) ( AVAILABLE ?auto_744699 ) ( SURFACE-AT ?auto_744690 ?auto_744695 ) ( ON ?auto_744690 ?auto_744694 ) ( CLEAR ?auto_744690 ) ( not ( = ?auto_744693 ?auto_744694 ) ) ( not ( = ?auto_744690 ?auto_744694 ) ) ( not ( = ?auto_744692 ?auto_744694 ) ) ( TRUCK-AT ?auto_744697 ?auto_744698 ) ( ON ?auto_744692 ?auto_744691 ) ( not ( = ?auto_744691 ?auto_744692 ) ) ( not ( = ?auto_744691 ?auto_744693 ) ) ( not ( = ?auto_744691 ?auto_744690 ) ) ( not ( = ?auto_744691 ?auto_744694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744692 ?auto_744693 ?auto_744690 )
      ( MAKE-3CRATE-VERIFY ?auto_744691 ?auto_744692 ?auto_744693 ?auto_744690 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744719 - SURFACE
      ?auto_744720 - SURFACE
      ?auto_744721 - SURFACE
      ?auto_744718 - SURFACE
    )
    :vars
    (
      ?auto_744724 - HOIST
      ?auto_744722 - PLACE
      ?auto_744723 - PLACE
      ?auto_744727 - HOIST
      ?auto_744725 - SURFACE
      ?auto_744726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744724 ?auto_744722 ) ( IS-CRATE ?auto_744718 ) ( not ( = ?auto_744721 ?auto_744718 ) ) ( not ( = ?auto_744720 ?auto_744721 ) ) ( not ( = ?auto_744720 ?auto_744718 ) ) ( not ( = ?auto_744723 ?auto_744722 ) ) ( HOIST-AT ?auto_744727 ?auto_744723 ) ( not ( = ?auto_744724 ?auto_744727 ) ) ( AVAILABLE ?auto_744727 ) ( SURFACE-AT ?auto_744718 ?auto_744723 ) ( ON ?auto_744718 ?auto_744725 ) ( CLEAR ?auto_744718 ) ( not ( = ?auto_744721 ?auto_744725 ) ) ( not ( = ?auto_744718 ?auto_744725 ) ) ( not ( = ?auto_744720 ?auto_744725 ) ) ( TRUCK-AT ?auto_744726 ?auto_744722 ) ( SURFACE-AT ?auto_744720 ?auto_744722 ) ( CLEAR ?auto_744720 ) ( LIFTING ?auto_744724 ?auto_744721 ) ( IS-CRATE ?auto_744721 ) ( ON ?auto_744720 ?auto_744719 ) ( not ( = ?auto_744719 ?auto_744720 ) ) ( not ( = ?auto_744719 ?auto_744721 ) ) ( not ( = ?auto_744719 ?auto_744718 ) ) ( not ( = ?auto_744719 ?auto_744725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744720 ?auto_744721 ?auto_744718 )
      ( MAKE-3CRATE-VERIFY ?auto_744719 ?auto_744720 ?auto_744721 ?auto_744718 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744747 - SURFACE
      ?auto_744748 - SURFACE
      ?auto_744749 - SURFACE
      ?auto_744746 - SURFACE
    )
    :vars
    (
      ?auto_744755 - HOIST
      ?auto_744751 - PLACE
      ?auto_744754 - PLACE
      ?auto_744753 - HOIST
      ?auto_744752 - SURFACE
      ?auto_744750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744755 ?auto_744751 ) ( IS-CRATE ?auto_744746 ) ( not ( = ?auto_744749 ?auto_744746 ) ) ( not ( = ?auto_744748 ?auto_744749 ) ) ( not ( = ?auto_744748 ?auto_744746 ) ) ( not ( = ?auto_744754 ?auto_744751 ) ) ( HOIST-AT ?auto_744753 ?auto_744754 ) ( not ( = ?auto_744755 ?auto_744753 ) ) ( AVAILABLE ?auto_744753 ) ( SURFACE-AT ?auto_744746 ?auto_744754 ) ( ON ?auto_744746 ?auto_744752 ) ( CLEAR ?auto_744746 ) ( not ( = ?auto_744749 ?auto_744752 ) ) ( not ( = ?auto_744746 ?auto_744752 ) ) ( not ( = ?auto_744748 ?auto_744752 ) ) ( TRUCK-AT ?auto_744750 ?auto_744751 ) ( SURFACE-AT ?auto_744748 ?auto_744751 ) ( CLEAR ?auto_744748 ) ( IS-CRATE ?auto_744749 ) ( AVAILABLE ?auto_744755 ) ( IN ?auto_744749 ?auto_744750 ) ( ON ?auto_744748 ?auto_744747 ) ( not ( = ?auto_744747 ?auto_744748 ) ) ( not ( = ?auto_744747 ?auto_744749 ) ) ( not ( = ?auto_744747 ?auto_744746 ) ) ( not ( = ?auto_744747 ?auto_744752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744748 ?auto_744749 ?auto_744746 )
      ( MAKE-3CRATE-VERIFY ?auto_744747 ?auto_744748 ?auto_744749 ?auto_744746 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745038 - SURFACE
      ?auto_745039 - SURFACE
      ?auto_745040 - SURFACE
      ?auto_745037 - SURFACE
      ?auto_745041 - SURFACE
    )
    :vars
    (
      ?auto_745043 - HOIST
      ?auto_745042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745043 ?auto_745042 ) ( SURFACE-AT ?auto_745037 ?auto_745042 ) ( CLEAR ?auto_745037 ) ( LIFTING ?auto_745043 ?auto_745041 ) ( IS-CRATE ?auto_745041 ) ( not ( = ?auto_745037 ?auto_745041 ) ) ( ON ?auto_745039 ?auto_745038 ) ( ON ?auto_745040 ?auto_745039 ) ( ON ?auto_745037 ?auto_745040 ) ( not ( = ?auto_745038 ?auto_745039 ) ) ( not ( = ?auto_745038 ?auto_745040 ) ) ( not ( = ?auto_745038 ?auto_745037 ) ) ( not ( = ?auto_745038 ?auto_745041 ) ) ( not ( = ?auto_745039 ?auto_745040 ) ) ( not ( = ?auto_745039 ?auto_745037 ) ) ( not ( = ?auto_745039 ?auto_745041 ) ) ( not ( = ?auto_745040 ?auto_745037 ) ) ( not ( = ?auto_745040 ?auto_745041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_745037 ?auto_745041 )
      ( MAKE-4CRATE-VERIFY ?auto_745038 ?auto_745039 ?auto_745040 ?auto_745037 ?auto_745041 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745063 - SURFACE
      ?auto_745064 - SURFACE
      ?auto_745065 - SURFACE
      ?auto_745062 - SURFACE
      ?auto_745066 - SURFACE
    )
    :vars
    (
      ?auto_745067 - HOIST
      ?auto_745068 - PLACE
      ?auto_745069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745067 ?auto_745068 ) ( SURFACE-AT ?auto_745062 ?auto_745068 ) ( CLEAR ?auto_745062 ) ( IS-CRATE ?auto_745066 ) ( not ( = ?auto_745062 ?auto_745066 ) ) ( TRUCK-AT ?auto_745069 ?auto_745068 ) ( AVAILABLE ?auto_745067 ) ( IN ?auto_745066 ?auto_745069 ) ( ON ?auto_745062 ?auto_745065 ) ( not ( = ?auto_745065 ?auto_745062 ) ) ( not ( = ?auto_745065 ?auto_745066 ) ) ( ON ?auto_745064 ?auto_745063 ) ( ON ?auto_745065 ?auto_745064 ) ( not ( = ?auto_745063 ?auto_745064 ) ) ( not ( = ?auto_745063 ?auto_745065 ) ) ( not ( = ?auto_745063 ?auto_745062 ) ) ( not ( = ?auto_745063 ?auto_745066 ) ) ( not ( = ?auto_745064 ?auto_745065 ) ) ( not ( = ?auto_745064 ?auto_745062 ) ) ( not ( = ?auto_745064 ?auto_745066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745065 ?auto_745062 ?auto_745066 )
      ( MAKE-4CRATE-VERIFY ?auto_745063 ?auto_745064 ?auto_745065 ?auto_745062 ?auto_745066 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745093 - SURFACE
      ?auto_745094 - SURFACE
      ?auto_745095 - SURFACE
      ?auto_745092 - SURFACE
      ?auto_745096 - SURFACE
    )
    :vars
    (
      ?auto_745098 - HOIST
      ?auto_745100 - PLACE
      ?auto_745099 - TRUCK
      ?auto_745097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745098 ?auto_745100 ) ( SURFACE-AT ?auto_745092 ?auto_745100 ) ( CLEAR ?auto_745092 ) ( IS-CRATE ?auto_745096 ) ( not ( = ?auto_745092 ?auto_745096 ) ) ( AVAILABLE ?auto_745098 ) ( IN ?auto_745096 ?auto_745099 ) ( ON ?auto_745092 ?auto_745095 ) ( not ( = ?auto_745095 ?auto_745092 ) ) ( not ( = ?auto_745095 ?auto_745096 ) ) ( TRUCK-AT ?auto_745099 ?auto_745097 ) ( not ( = ?auto_745097 ?auto_745100 ) ) ( ON ?auto_745094 ?auto_745093 ) ( ON ?auto_745095 ?auto_745094 ) ( not ( = ?auto_745093 ?auto_745094 ) ) ( not ( = ?auto_745093 ?auto_745095 ) ) ( not ( = ?auto_745093 ?auto_745092 ) ) ( not ( = ?auto_745093 ?auto_745096 ) ) ( not ( = ?auto_745094 ?auto_745095 ) ) ( not ( = ?auto_745094 ?auto_745092 ) ) ( not ( = ?auto_745094 ?auto_745096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745095 ?auto_745092 ?auto_745096 )
      ( MAKE-4CRATE-VERIFY ?auto_745093 ?auto_745094 ?auto_745095 ?auto_745092 ?auto_745096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745127 - SURFACE
      ?auto_745128 - SURFACE
      ?auto_745129 - SURFACE
      ?auto_745126 - SURFACE
      ?auto_745130 - SURFACE
    )
    :vars
    (
      ?auto_745135 - HOIST
      ?auto_745133 - PLACE
      ?auto_745134 - TRUCK
      ?auto_745132 - PLACE
      ?auto_745131 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_745135 ?auto_745133 ) ( SURFACE-AT ?auto_745126 ?auto_745133 ) ( CLEAR ?auto_745126 ) ( IS-CRATE ?auto_745130 ) ( not ( = ?auto_745126 ?auto_745130 ) ) ( AVAILABLE ?auto_745135 ) ( ON ?auto_745126 ?auto_745129 ) ( not ( = ?auto_745129 ?auto_745126 ) ) ( not ( = ?auto_745129 ?auto_745130 ) ) ( TRUCK-AT ?auto_745134 ?auto_745132 ) ( not ( = ?auto_745132 ?auto_745133 ) ) ( HOIST-AT ?auto_745131 ?auto_745132 ) ( LIFTING ?auto_745131 ?auto_745130 ) ( not ( = ?auto_745135 ?auto_745131 ) ) ( ON ?auto_745128 ?auto_745127 ) ( ON ?auto_745129 ?auto_745128 ) ( not ( = ?auto_745127 ?auto_745128 ) ) ( not ( = ?auto_745127 ?auto_745129 ) ) ( not ( = ?auto_745127 ?auto_745126 ) ) ( not ( = ?auto_745127 ?auto_745130 ) ) ( not ( = ?auto_745128 ?auto_745129 ) ) ( not ( = ?auto_745128 ?auto_745126 ) ) ( not ( = ?auto_745128 ?auto_745130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745129 ?auto_745126 ?auto_745130 )
      ( MAKE-4CRATE-VERIFY ?auto_745127 ?auto_745128 ?auto_745129 ?auto_745126 ?auto_745130 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745165 - SURFACE
      ?auto_745166 - SURFACE
      ?auto_745167 - SURFACE
      ?auto_745164 - SURFACE
      ?auto_745168 - SURFACE
    )
    :vars
    (
      ?auto_745174 - HOIST
      ?auto_745173 - PLACE
      ?auto_745172 - TRUCK
      ?auto_745171 - PLACE
      ?auto_745170 - HOIST
      ?auto_745169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745174 ?auto_745173 ) ( SURFACE-AT ?auto_745164 ?auto_745173 ) ( CLEAR ?auto_745164 ) ( IS-CRATE ?auto_745168 ) ( not ( = ?auto_745164 ?auto_745168 ) ) ( AVAILABLE ?auto_745174 ) ( ON ?auto_745164 ?auto_745167 ) ( not ( = ?auto_745167 ?auto_745164 ) ) ( not ( = ?auto_745167 ?auto_745168 ) ) ( TRUCK-AT ?auto_745172 ?auto_745171 ) ( not ( = ?auto_745171 ?auto_745173 ) ) ( HOIST-AT ?auto_745170 ?auto_745171 ) ( not ( = ?auto_745174 ?auto_745170 ) ) ( AVAILABLE ?auto_745170 ) ( SURFACE-AT ?auto_745168 ?auto_745171 ) ( ON ?auto_745168 ?auto_745169 ) ( CLEAR ?auto_745168 ) ( not ( = ?auto_745164 ?auto_745169 ) ) ( not ( = ?auto_745168 ?auto_745169 ) ) ( not ( = ?auto_745167 ?auto_745169 ) ) ( ON ?auto_745166 ?auto_745165 ) ( ON ?auto_745167 ?auto_745166 ) ( not ( = ?auto_745165 ?auto_745166 ) ) ( not ( = ?auto_745165 ?auto_745167 ) ) ( not ( = ?auto_745165 ?auto_745164 ) ) ( not ( = ?auto_745165 ?auto_745168 ) ) ( not ( = ?auto_745165 ?auto_745169 ) ) ( not ( = ?auto_745166 ?auto_745167 ) ) ( not ( = ?auto_745166 ?auto_745164 ) ) ( not ( = ?auto_745166 ?auto_745168 ) ) ( not ( = ?auto_745166 ?auto_745169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745167 ?auto_745164 ?auto_745168 )
      ( MAKE-4CRATE-VERIFY ?auto_745165 ?auto_745166 ?auto_745167 ?auto_745164 ?auto_745168 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745204 - SURFACE
      ?auto_745205 - SURFACE
      ?auto_745206 - SURFACE
      ?auto_745203 - SURFACE
      ?auto_745207 - SURFACE
    )
    :vars
    (
      ?auto_745209 - HOIST
      ?auto_745213 - PLACE
      ?auto_745208 - PLACE
      ?auto_745210 - HOIST
      ?auto_745212 - SURFACE
      ?auto_745211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745209 ?auto_745213 ) ( SURFACE-AT ?auto_745203 ?auto_745213 ) ( CLEAR ?auto_745203 ) ( IS-CRATE ?auto_745207 ) ( not ( = ?auto_745203 ?auto_745207 ) ) ( AVAILABLE ?auto_745209 ) ( ON ?auto_745203 ?auto_745206 ) ( not ( = ?auto_745206 ?auto_745203 ) ) ( not ( = ?auto_745206 ?auto_745207 ) ) ( not ( = ?auto_745208 ?auto_745213 ) ) ( HOIST-AT ?auto_745210 ?auto_745208 ) ( not ( = ?auto_745209 ?auto_745210 ) ) ( AVAILABLE ?auto_745210 ) ( SURFACE-AT ?auto_745207 ?auto_745208 ) ( ON ?auto_745207 ?auto_745212 ) ( CLEAR ?auto_745207 ) ( not ( = ?auto_745203 ?auto_745212 ) ) ( not ( = ?auto_745207 ?auto_745212 ) ) ( not ( = ?auto_745206 ?auto_745212 ) ) ( TRUCK-AT ?auto_745211 ?auto_745213 ) ( ON ?auto_745205 ?auto_745204 ) ( ON ?auto_745206 ?auto_745205 ) ( not ( = ?auto_745204 ?auto_745205 ) ) ( not ( = ?auto_745204 ?auto_745206 ) ) ( not ( = ?auto_745204 ?auto_745203 ) ) ( not ( = ?auto_745204 ?auto_745207 ) ) ( not ( = ?auto_745204 ?auto_745212 ) ) ( not ( = ?auto_745205 ?auto_745206 ) ) ( not ( = ?auto_745205 ?auto_745203 ) ) ( not ( = ?auto_745205 ?auto_745207 ) ) ( not ( = ?auto_745205 ?auto_745212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745206 ?auto_745203 ?auto_745207 )
      ( MAKE-4CRATE-VERIFY ?auto_745204 ?auto_745205 ?auto_745206 ?auto_745203 ?auto_745207 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745243 - SURFACE
      ?auto_745244 - SURFACE
      ?auto_745245 - SURFACE
      ?auto_745242 - SURFACE
      ?auto_745246 - SURFACE
    )
    :vars
    (
      ?auto_745247 - HOIST
      ?auto_745251 - PLACE
      ?auto_745252 - PLACE
      ?auto_745250 - HOIST
      ?auto_745249 - SURFACE
      ?auto_745248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745247 ?auto_745251 ) ( IS-CRATE ?auto_745246 ) ( not ( = ?auto_745242 ?auto_745246 ) ) ( not ( = ?auto_745245 ?auto_745242 ) ) ( not ( = ?auto_745245 ?auto_745246 ) ) ( not ( = ?auto_745252 ?auto_745251 ) ) ( HOIST-AT ?auto_745250 ?auto_745252 ) ( not ( = ?auto_745247 ?auto_745250 ) ) ( AVAILABLE ?auto_745250 ) ( SURFACE-AT ?auto_745246 ?auto_745252 ) ( ON ?auto_745246 ?auto_745249 ) ( CLEAR ?auto_745246 ) ( not ( = ?auto_745242 ?auto_745249 ) ) ( not ( = ?auto_745246 ?auto_745249 ) ) ( not ( = ?auto_745245 ?auto_745249 ) ) ( TRUCK-AT ?auto_745248 ?auto_745251 ) ( SURFACE-AT ?auto_745245 ?auto_745251 ) ( CLEAR ?auto_745245 ) ( LIFTING ?auto_745247 ?auto_745242 ) ( IS-CRATE ?auto_745242 ) ( ON ?auto_745244 ?auto_745243 ) ( ON ?auto_745245 ?auto_745244 ) ( not ( = ?auto_745243 ?auto_745244 ) ) ( not ( = ?auto_745243 ?auto_745245 ) ) ( not ( = ?auto_745243 ?auto_745242 ) ) ( not ( = ?auto_745243 ?auto_745246 ) ) ( not ( = ?auto_745243 ?auto_745249 ) ) ( not ( = ?auto_745244 ?auto_745245 ) ) ( not ( = ?auto_745244 ?auto_745242 ) ) ( not ( = ?auto_745244 ?auto_745246 ) ) ( not ( = ?auto_745244 ?auto_745249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745245 ?auto_745242 ?auto_745246 )
      ( MAKE-4CRATE-VERIFY ?auto_745243 ?auto_745244 ?auto_745245 ?auto_745242 ?auto_745246 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745282 - SURFACE
      ?auto_745283 - SURFACE
      ?auto_745284 - SURFACE
      ?auto_745281 - SURFACE
      ?auto_745285 - SURFACE
    )
    :vars
    (
      ?auto_745291 - HOIST
      ?auto_745286 - PLACE
      ?auto_745289 - PLACE
      ?auto_745288 - HOIST
      ?auto_745290 - SURFACE
      ?auto_745287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745291 ?auto_745286 ) ( IS-CRATE ?auto_745285 ) ( not ( = ?auto_745281 ?auto_745285 ) ) ( not ( = ?auto_745284 ?auto_745281 ) ) ( not ( = ?auto_745284 ?auto_745285 ) ) ( not ( = ?auto_745289 ?auto_745286 ) ) ( HOIST-AT ?auto_745288 ?auto_745289 ) ( not ( = ?auto_745291 ?auto_745288 ) ) ( AVAILABLE ?auto_745288 ) ( SURFACE-AT ?auto_745285 ?auto_745289 ) ( ON ?auto_745285 ?auto_745290 ) ( CLEAR ?auto_745285 ) ( not ( = ?auto_745281 ?auto_745290 ) ) ( not ( = ?auto_745285 ?auto_745290 ) ) ( not ( = ?auto_745284 ?auto_745290 ) ) ( TRUCK-AT ?auto_745287 ?auto_745286 ) ( SURFACE-AT ?auto_745284 ?auto_745286 ) ( CLEAR ?auto_745284 ) ( IS-CRATE ?auto_745281 ) ( AVAILABLE ?auto_745291 ) ( IN ?auto_745281 ?auto_745287 ) ( ON ?auto_745283 ?auto_745282 ) ( ON ?auto_745284 ?auto_745283 ) ( not ( = ?auto_745282 ?auto_745283 ) ) ( not ( = ?auto_745282 ?auto_745284 ) ) ( not ( = ?auto_745282 ?auto_745281 ) ) ( not ( = ?auto_745282 ?auto_745285 ) ) ( not ( = ?auto_745282 ?auto_745290 ) ) ( not ( = ?auto_745283 ?auto_745284 ) ) ( not ( = ?auto_745283 ?auto_745281 ) ) ( not ( = ?auto_745283 ?auto_745285 ) ) ( not ( = ?auto_745283 ?auto_745290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745284 ?auto_745281 ?auto_745285 )
      ( MAKE-4CRATE-VERIFY ?auto_745282 ?auto_745283 ?auto_745284 ?auto_745281 ?auto_745285 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745942 - SURFACE
      ?auto_745943 - SURFACE
      ?auto_745944 - SURFACE
      ?auto_745941 - SURFACE
      ?auto_745945 - SURFACE
      ?auto_745946 - SURFACE
    )
    :vars
    (
      ?auto_745947 - HOIST
      ?auto_745948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745947 ?auto_745948 ) ( SURFACE-AT ?auto_745945 ?auto_745948 ) ( CLEAR ?auto_745945 ) ( LIFTING ?auto_745947 ?auto_745946 ) ( IS-CRATE ?auto_745946 ) ( not ( = ?auto_745945 ?auto_745946 ) ) ( ON ?auto_745943 ?auto_745942 ) ( ON ?auto_745944 ?auto_745943 ) ( ON ?auto_745941 ?auto_745944 ) ( ON ?auto_745945 ?auto_745941 ) ( not ( = ?auto_745942 ?auto_745943 ) ) ( not ( = ?auto_745942 ?auto_745944 ) ) ( not ( = ?auto_745942 ?auto_745941 ) ) ( not ( = ?auto_745942 ?auto_745945 ) ) ( not ( = ?auto_745942 ?auto_745946 ) ) ( not ( = ?auto_745943 ?auto_745944 ) ) ( not ( = ?auto_745943 ?auto_745941 ) ) ( not ( = ?auto_745943 ?auto_745945 ) ) ( not ( = ?auto_745943 ?auto_745946 ) ) ( not ( = ?auto_745944 ?auto_745941 ) ) ( not ( = ?auto_745944 ?auto_745945 ) ) ( not ( = ?auto_745944 ?auto_745946 ) ) ( not ( = ?auto_745941 ?auto_745945 ) ) ( not ( = ?auto_745941 ?auto_745946 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_745945 ?auto_745946 )
      ( MAKE-5CRATE-VERIFY ?auto_745942 ?auto_745943 ?auto_745944 ?auto_745941 ?auto_745945 ?auto_745946 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745976 - SURFACE
      ?auto_745977 - SURFACE
      ?auto_745978 - SURFACE
      ?auto_745975 - SURFACE
      ?auto_745979 - SURFACE
      ?auto_745980 - SURFACE
    )
    :vars
    (
      ?auto_745983 - HOIST
      ?auto_745982 - PLACE
      ?auto_745981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745983 ?auto_745982 ) ( SURFACE-AT ?auto_745979 ?auto_745982 ) ( CLEAR ?auto_745979 ) ( IS-CRATE ?auto_745980 ) ( not ( = ?auto_745979 ?auto_745980 ) ) ( TRUCK-AT ?auto_745981 ?auto_745982 ) ( AVAILABLE ?auto_745983 ) ( IN ?auto_745980 ?auto_745981 ) ( ON ?auto_745979 ?auto_745975 ) ( not ( = ?auto_745975 ?auto_745979 ) ) ( not ( = ?auto_745975 ?auto_745980 ) ) ( ON ?auto_745977 ?auto_745976 ) ( ON ?auto_745978 ?auto_745977 ) ( ON ?auto_745975 ?auto_745978 ) ( not ( = ?auto_745976 ?auto_745977 ) ) ( not ( = ?auto_745976 ?auto_745978 ) ) ( not ( = ?auto_745976 ?auto_745975 ) ) ( not ( = ?auto_745976 ?auto_745979 ) ) ( not ( = ?auto_745976 ?auto_745980 ) ) ( not ( = ?auto_745977 ?auto_745978 ) ) ( not ( = ?auto_745977 ?auto_745975 ) ) ( not ( = ?auto_745977 ?auto_745979 ) ) ( not ( = ?auto_745977 ?auto_745980 ) ) ( not ( = ?auto_745978 ?auto_745975 ) ) ( not ( = ?auto_745978 ?auto_745979 ) ) ( not ( = ?auto_745978 ?auto_745980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745975 ?auto_745979 ?auto_745980 )
      ( MAKE-5CRATE-VERIFY ?auto_745976 ?auto_745977 ?auto_745978 ?auto_745975 ?auto_745979 ?auto_745980 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746016 - SURFACE
      ?auto_746017 - SURFACE
      ?auto_746018 - SURFACE
      ?auto_746015 - SURFACE
      ?auto_746019 - SURFACE
      ?auto_746020 - SURFACE
    )
    :vars
    (
      ?auto_746021 - HOIST
      ?auto_746022 - PLACE
      ?auto_746024 - TRUCK
      ?auto_746023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_746021 ?auto_746022 ) ( SURFACE-AT ?auto_746019 ?auto_746022 ) ( CLEAR ?auto_746019 ) ( IS-CRATE ?auto_746020 ) ( not ( = ?auto_746019 ?auto_746020 ) ) ( AVAILABLE ?auto_746021 ) ( IN ?auto_746020 ?auto_746024 ) ( ON ?auto_746019 ?auto_746015 ) ( not ( = ?auto_746015 ?auto_746019 ) ) ( not ( = ?auto_746015 ?auto_746020 ) ) ( TRUCK-AT ?auto_746024 ?auto_746023 ) ( not ( = ?auto_746023 ?auto_746022 ) ) ( ON ?auto_746017 ?auto_746016 ) ( ON ?auto_746018 ?auto_746017 ) ( ON ?auto_746015 ?auto_746018 ) ( not ( = ?auto_746016 ?auto_746017 ) ) ( not ( = ?auto_746016 ?auto_746018 ) ) ( not ( = ?auto_746016 ?auto_746015 ) ) ( not ( = ?auto_746016 ?auto_746019 ) ) ( not ( = ?auto_746016 ?auto_746020 ) ) ( not ( = ?auto_746017 ?auto_746018 ) ) ( not ( = ?auto_746017 ?auto_746015 ) ) ( not ( = ?auto_746017 ?auto_746019 ) ) ( not ( = ?auto_746017 ?auto_746020 ) ) ( not ( = ?auto_746018 ?auto_746015 ) ) ( not ( = ?auto_746018 ?auto_746019 ) ) ( not ( = ?auto_746018 ?auto_746020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746015 ?auto_746019 ?auto_746020 )
      ( MAKE-5CRATE-VERIFY ?auto_746016 ?auto_746017 ?auto_746018 ?auto_746015 ?auto_746019 ?auto_746020 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746061 - SURFACE
      ?auto_746062 - SURFACE
      ?auto_746063 - SURFACE
      ?auto_746060 - SURFACE
      ?auto_746064 - SURFACE
      ?auto_746065 - SURFACE
    )
    :vars
    (
      ?auto_746069 - HOIST
      ?auto_746068 - PLACE
      ?auto_746066 - TRUCK
      ?auto_746067 - PLACE
      ?auto_746070 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_746069 ?auto_746068 ) ( SURFACE-AT ?auto_746064 ?auto_746068 ) ( CLEAR ?auto_746064 ) ( IS-CRATE ?auto_746065 ) ( not ( = ?auto_746064 ?auto_746065 ) ) ( AVAILABLE ?auto_746069 ) ( ON ?auto_746064 ?auto_746060 ) ( not ( = ?auto_746060 ?auto_746064 ) ) ( not ( = ?auto_746060 ?auto_746065 ) ) ( TRUCK-AT ?auto_746066 ?auto_746067 ) ( not ( = ?auto_746067 ?auto_746068 ) ) ( HOIST-AT ?auto_746070 ?auto_746067 ) ( LIFTING ?auto_746070 ?auto_746065 ) ( not ( = ?auto_746069 ?auto_746070 ) ) ( ON ?auto_746062 ?auto_746061 ) ( ON ?auto_746063 ?auto_746062 ) ( ON ?auto_746060 ?auto_746063 ) ( not ( = ?auto_746061 ?auto_746062 ) ) ( not ( = ?auto_746061 ?auto_746063 ) ) ( not ( = ?auto_746061 ?auto_746060 ) ) ( not ( = ?auto_746061 ?auto_746064 ) ) ( not ( = ?auto_746061 ?auto_746065 ) ) ( not ( = ?auto_746062 ?auto_746063 ) ) ( not ( = ?auto_746062 ?auto_746060 ) ) ( not ( = ?auto_746062 ?auto_746064 ) ) ( not ( = ?auto_746062 ?auto_746065 ) ) ( not ( = ?auto_746063 ?auto_746060 ) ) ( not ( = ?auto_746063 ?auto_746064 ) ) ( not ( = ?auto_746063 ?auto_746065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746060 ?auto_746064 ?auto_746065 )
      ( MAKE-5CRATE-VERIFY ?auto_746061 ?auto_746062 ?auto_746063 ?auto_746060 ?auto_746064 ?auto_746065 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746111 - SURFACE
      ?auto_746112 - SURFACE
      ?auto_746113 - SURFACE
      ?auto_746110 - SURFACE
      ?auto_746114 - SURFACE
      ?auto_746115 - SURFACE
    )
    :vars
    (
      ?auto_746117 - HOIST
      ?auto_746119 - PLACE
      ?auto_746121 - TRUCK
      ?auto_746116 - PLACE
      ?auto_746118 - HOIST
      ?auto_746120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_746117 ?auto_746119 ) ( SURFACE-AT ?auto_746114 ?auto_746119 ) ( CLEAR ?auto_746114 ) ( IS-CRATE ?auto_746115 ) ( not ( = ?auto_746114 ?auto_746115 ) ) ( AVAILABLE ?auto_746117 ) ( ON ?auto_746114 ?auto_746110 ) ( not ( = ?auto_746110 ?auto_746114 ) ) ( not ( = ?auto_746110 ?auto_746115 ) ) ( TRUCK-AT ?auto_746121 ?auto_746116 ) ( not ( = ?auto_746116 ?auto_746119 ) ) ( HOIST-AT ?auto_746118 ?auto_746116 ) ( not ( = ?auto_746117 ?auto_746118 ) ) ( AVAILABLE ?auto_746118 ) ( SURFACE-AT ?auto_746115 ?auto_746116 ) ( ON ?auto_746115 ?auto_746120 ) ( CLEAR ?auto_746115 ) ( not ( = ?auto_746114 ?auto_746120 ) ) ( not ( = ?auto_746115 ?auto_746120 ) ) ( not ( = ?auto_746110 ?auto_746120 ) ) ( ON ?auto_746112 ?auto_746111 ) ( ON ?auto_746113 ?auto_746112 ) ( ON ?auto_746110 ?auto_746113 ) ( not ( = ?auto_746111 ?auto_746112 ) ) ( not ( = ?auto_746111 ?auto_746113 ) ) ( not ( = ?auto_746111 ?auto_746110 ) ) ( not ( = ?auto_746111 ?auto_746114 ) ) ( not ( = ?auto_746111 ?auto_746115 ) ) ( not ( = ?auto_746111 ?auto_746120 ) ) ( not ( = ?auto_746112 ?auto_746113 ) ) ( not ( = ?auto_746112 ?auto_746110 ) ) ( not ( = ?auto_746112 ?auto_746114 ) ) ( not ( = ?auto_746112 ?auto_746115 ) ) ( not ( = ?auto_746112 ?auto_746120 ) ) ( not ( = ?auto_746113 ?auto_746110 ) ) ( not ( = ?auto_746113 ?auto_746114 ) ) ( not ( = ?auto_746113 ?auto_746115 ) ) ( not ( = ?auto_746113 ?auto_746120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746110 ?auto_746114 ?auto_746115 )
      ( MAKE-5CRATE-VERIFY ?auto_746111 ?auto_746112 ?auto_746113 ?auto_746110 ?auto_746114 ?auto_746115 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746162 - SURFACE
      ?auto_746163 - SURFACE
      ?auto_746164 - SURFACE
      ?auto_746161 - SURFACE
      ?auto_746165 - SURFACE
      ?auto_746166 - SURFACE
    )
    :vars
    (
      ?auto_746169 - HOIST
      ?auto_746168 - PLACE
      ?auto_746167 - PLACE
      ?auto_746170 - HOIST
      ?auto_746171 - SURFACE
      ?auto_746172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746169 ?auto_746168 ) ( SURFACE-AT ?auto_746165 ?auto_746168 ) ( CLEAR ?auto_746165 ) ( IS-CRATE ?auto_746166 ) ( not ( = ?auto_746165 ?auto_746166 ) ) ( AVAILABLE ?auto_746169 ) ( ON ?auto_746165 ?auto_746161 ) ( not ( = ?auto_746161 ?auto_746165 ) ) ( not ( = ?auto_746161 ?auto_746166 ) ) ( not ( = ?auto_746167 ?auto_746168 ) ) ( HOIST-AT ?auto_746170 ?auto_746167 ) ( not ( = ?auto_746169 ?auto_746170 ) ) ( AVAILABLE ?auto_746170 ) ( SURFACE-AT ?auto_746166 ?auto_746167 ) ( ON ?auto_746166 ?auto_746171 ) ( CLEAR ?auto_746166 ) ( not ( = ?auto_746165 ?auto_746171 ) ) ( not ( = ?auto_746166 ?auto_746171 ) ) ( not ( = ?auto_746161 ?auto_746171 ) ) ( TRUCK-AT ?auto_746172 ?auto_746168 ) ( ON ?auto_746163 ?auto_746162 ) ( ON ?auto_746164 ?auto_746163 ) ( ON ?auto_746161 ?auto_746164 ) ( not ( = ?auto_746162 ?auto_746163 ) ) ( not ( = ?auto_746162 ?auto_746164 ) ) ( not ( = ?auto_746162 ?auto_746161 ) ) ( not ( = ?auto_746162 ?auto_746165 ) ) ( not ( = ?auto_746162 ?auto_746166 ) ) ( not ( = ?auto_746162 ?auto_746171 ) ) ( not ( = ?auto_746163 ?auto_746164 ) ) ( not ( = ?auto_746163 ?auto_746161 ) ) ( not ( = ?auto_746163 ?auto_746165 ) ) ( not ( = ?auto_746163 ?auto_746166 ) ) ( not ( = ?auto_746163 ?auto_746171 ) ) ( not ( = ?auto_746164 ?auto_746161 ) ) ( not ( = ?auto_746164 ?auto_746165 ) ) ( not ( = ?auto_746164 ?auto_746166 ) ) ( not ( = ?auto_746164 ?auto_746171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746161 ?auto_746165 ?auto_746166 )
      ( MAKE-5CRATE-VERIFY ?auto_746162 ?auto_746163 ?auto_746164 ?auto_746161 ?auto_746165 ?auto_746166 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746213 - SURFACE
      ?auto_746214 - SURFACE
      ?auto_746215 - SURFACE
      ?auto_746212 - SURFACE
      ?auto_746216 - SURFACE
      ?auto_746217 - SURFACE
    )
    :vars
    (
      ?auto_746221 - HOIST
      ?auto_746219 - PLACE
      ?auto_746220 - PLACE
      ?auto_746223 - HOIST
      ?auto_746218 - SURFACE
      ?auto_746222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746221 ?auto_746219 ) ( IS-CRATE ?auto_746217 ) ( not ( = ?auto_746216 ?auto_746217 ) ) ( not ( = ?auto_746212 ?auto_746216 ) ) ( not ( = ?auto_746212 ?auto_746217 ) ) ( not ( = ?auto_746220 ?auto_746219 ) ) ( HOIST-AT ?auto_746223 ?auto_746220 ) ( not ( = ?auto_746221 ?auto_746223 ) ) ( AVAILABLE ?auto_746223 ) ( SURFACE-AT ?auto_746217 ?auto_746220 ) ( ON ?auto_746217 ?auto_746218 ) ( CLEAR ?auto_746217 ) ( not ( = ?auto_746216 ?auto_746218 ) ) ( not ( = ?auto_746217 ?auto_746218 ) ) ( not ( = ?auto_746212 ?auto_746218 ) ) ( TRUCK-AT ?auto_746222 ?auto_746219 ) ( SURFACE-AT ?auto_746212 ?auto_746219 ) ( CLEAR ?auto_746212 ) ( LIFTING ?auto_746221 ?auto_746216 ) ( IS-CRATE ?auto_746216 ) ( ON ?auto_746214 ?auto_746213 ) ( ON ?auto_746215 ?auto_746214 ) ( ON ?auto_746212 ?auto_746215 ) ( not ( = ?auto_746213 ?auto_746214 ) ) ( not ( = ?auto_746213 ?auto_746215 ) ) ( not ( = ?auto_746213 ?auto_746212 ) ) ( not ( = ?auto_746213 ?auto_746216 ) ) ( not ( = ?auto_746213 ?auto_746217 ) ) ( not ( = ?auto_746213 ?auto_746218 ) ) ( not ( = ?auto_746214 ?auto_746215 ) ) ( not ( = ?auto_746214 ?auto_746212 ) ) ( not ( = ?auto_746214 ?auto_746216 ) ) ( not ( = ?auto_746214 ?auto_746217 ) ) ( not ( = ?auto_746214 ?auto_746218 ) ) ( not ( = ?auto_746215 ?auto_746212 ) ) ( not ( = ?auto_746215 ?auto_746216 ) ) ( not ( = ?auto_746215 ?auto_746217 ) ) ( not ( = ?auto_746215 ?auto_746218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746212 ?auto_746216 ?auto_746217 )
      ( MAKE-5CRATE-VERIFY ?auto_746213 ?auto_746214 ?auto_746215 ?auto_746212 ?auto_746216 ?auto_746217 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746264 - SURFACE
      ?auto_746265 - SURFACE
      ?auto_746266 - SURFACE
      ?auto_746263 - SURFACE
      ?auto_746267 - SURFACE
      ?auto_746268 - SURFACE
    )
    :vars
    (
      ?auto_746269 - HOIST
      ?auto_746271 - PLACE
      ?auto_746273 - PLACE
      ?auto_746272 - HOIST
      ?auto_746270 - SURFACE
      ?auto_746274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746269 ?auto_746271 ) ( IS-CRATE ?auto_746268 ) ( not ( = ?auto_746267 ?auto_746268 ) ) ( not ( = ?auto_746263 ?auto_746267 ) ) ( not ( = ?auto_746263 ?auto_746268 ) ) ( not ( = ?auto_746273 ?auto_746271 ) ) ( HOIST-AT ?auto_746272 ?auto_746273 ) ( not ( = ?auto_746269 ?auto_746272 ) ) ( AVAILABLE ?auto_746272 ) ( SURFACE-AT ?auto_746268 ?auto_746273 ) ( ON ?auto_746268 ?auto_746270 ) ( CLEAR ?auto_746268 ) ( not ( = ?auto_746267 ?auto_746270 ) ) ( not ( = ?auto_746268 ?auto_746270 ) ) ( not ( = ?auto_746263 ?auto_746270 ) ) ( TRUCK-AT ?auto_746274 ?auto_746271 ) ( SURFACE-AT ?auto_746263 ?auto_746271 ) ( CLEAR ?auto_746263 ) ( IS-CRATE ?auto_746267 ) ( AVAILABLE ?auto_746269 ) ( IN ?auto_746267 ?auto_746274 ) ( ON ?auto_746265 ?auto_746264 ) ( ON ?auto_746266 ?auto_746265 ) ( ON ?auto_746263 ?auto_746266 ) ( not ( = ?auto_746264 ?auto_746265 ) ) ( not ( = ?auto_746264 ?auto_746266 ) ) ( not ( = ?auto_746264 ?auto_746263 ) ) ( not ( = ?auto_746264 ?auto_746267 ) ) ( not ( = ?auto_746264 ?auto_746268 ) ) ( not ( = ?auto_746264 ?auto_746270 ) ) ( not ( = ?auto_746265 ?auto_746266 ) ) ( not ( = ?auto_746265 ?auto_746263 ) ) ( not ( = ?auto_746265 ?auto_746267 ) ) ( not ( = ?auto_746265 ?auto_746268 ) ) ( not ( = ?auto_746265 ?auto_746270 ) ) ( not ( = ?auto_746266 ?auto_746263 ) ) ( not ( = ?auto_746266 ?auto_746267 ) ) ( not ( = ?auto_746266 ?auto_746268 ) ) ( not ( = ?auto_746266 ?auto_746270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746263 ?auto_746267 ?auto_746268 )
      ( MAKE-5CRATE-VERIFY ?auto_746264 ?auto_746265 ?auto_746266 ?auto_746263 ?auto_746267 ?auto_746268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_746943 - SURFACE
      ?auto_746944 - SURFACE
    )
    :vars
    (
      ?auto_746950 - HOIST
      ?auto_746947 - PLACE
      ?auto_746951 - SURFACE
      ?auto_746946 - TRUCK
      ?auto_746949 - PLACE
      ?auto_746948 - HOIST
      ?auto_746945 - SURFACE
      ?auto_746952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_746950 ?auto_746947 ) ( SURFACE-AT ?auto_746943 ?auto_746947 ) ( CLEAR ?auto_746943 ) ( IS-CRATE ?auto_746944 ) ( not ( = ?auto_746943 ?auto_746944 ) ) ( AVAILABLE ?auto_746950 ) ( ON ?auto_746943 ?auto_746951 ) ( not ( = ?auto_746951 ?auto_746943 ) ) ( not ( = ?auto_746951 ?auto_746944 ) ) ( TRUCK-AT ?auto_746946 ?auto_746949 ) ( not ( = ?auto_746949 ?auto_746947 ) ) ( HOIST-AT ?auto_746948 ?auto_746949 ) ( not ( = ?auto_746950 ?auto_746948 ) ) ( SURFACE-AT ?auto_746944 ?auto_746949 ) ( ON ?auto_746944 ?auto_746945 ) ( CLEAR ?auto_746944 ) ( not ( = ?auto_746943 ?auto_746945 ) ) ( not ( = ?auto_746944 ?auto_746945 ) ) ( not ( = ?auto_746951 ?auto_746945 ) ) ( LIFTING ?auto_746948 ?auto_746952 ) ( IS-CRATE ?auto_746952 ) ( not ( = ?auto_746943 ?auto_746952 ) ) ( not ( = ?auto_746944 ?auto_746952 ) ) ( not ( = ?auto_746951 ?auto_746952 ) ) ( not ( = ?auto_746945 ?auto_746952 ) ) )
    :subtasks
    ( ( !LOAD ?auto_746948 ?auto_746952 ?auto_746946 ?auto_746949 )
      ( MAKE-1CRATE ?auto_746943 ?auto_746944 )
      ( MAKE-1CRATE-VERIFY ?auto_746943 ?auto_746944 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747470 - SURFACE
      ?auto_747471 - SURFACE
      ?auto_747472 - SURFACE
      ?auto_747469 - SURFACE
      ?auto_747473 - SURFACE
      ?auto_747475 - SURFACE
      ?auto_747474 - SURFACE
    )
    :vars
    (
      ?auto_747477 - HOIST
      ?auto_747476 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747477 ?auto_747476 ) ( SURFACE-AT ?auto_747475 ?auto_747476 ) ( CLEAR ?auto_747475 ) ( LIFTING ?auto_747477 ?auto_747474 ) ( IS-CRATE ?auto_747474 ) ( not ( = ?auto_747475 ?auto_747474 ) ) ( ON ?auto_747471 ?auto_747470 ) ( ON ?auto_747472 ?auto_747471 ) ( ON ?auto_747469 ?auto_747472 ) ( ON ?auto_747473 ?auto_747469 ) ( ON ?auto_747475 ?auto_747473 ) ( not ( = ?auto_747470 ?auto_747471 ) ) ( not ( = ?auto_747470 ?auto_747472 ) ) ( not ( = ?auto_747470 ?auto_747469 ) ) ( not ( = ?auto_747470 ?auto_747473 ) ) ( not ( = ?auto_747470 ?auto_747475 ) ) ( not ( = ?auto_747470 ?auto_747474 ) ) ( not ( = ?auto_747471 ?auto_747472 ) ) ( not ( = ?auto_747471 ?auto_747469 ) ) ( not ( = ?auto_747471 ?auto_747473 ) ) ( not ( = ?auto_747471 ?auto_747475 ) ) ( not ( = ?auto_747471 ?auto_747474 ) ) ( not ( = ?auto_747472 ?auto_747469 ) ) ( not ( = ?auto_747472 ?auto_747473 ) ) ( not ( = ?auto_747472 ?auto_747475 ) ) ( not ( = ?auto_747472 ?auto_747474 ) ) ( not ( = ?auto_747469 ?auto_747473 ) ) ( not ( = ?auto_747469 ?auto_747475 ) ) ( not ( = ?auto_747469 ?auto_747474 ) ) ( not ( = ?auto_747473 ?auto_747475 ) ) ( not ( = ?auto_747473 ?auto_747474 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_747475 ?auto_747474 )
      ( MAKE-6CRATE-VERIFY ?auto_747470 ?auto_747471 ?auto_747472 ?auto_747469 ?auto_747473 ?auto_747475 ?auto_747474 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747514 - SURFACE
      ?auto_747515 - SURFACE
      ?auto_747516 - SURFACE
      ?auto_747513 - SURFACE
      ?auto_747517 - SURFACE
      ?auto_747519 - SURFACE
      ?auto_747518 - SURFACE
    )
    :vars
    (
      ?auto_747521 - HOIST
      ?auto_747520 - PLACE
      ?auto_747522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747521 ?auto_747520 ) ( SURFACE-AT ?auto_747519 ?auto_747520 ) ( CLEAR ?auto_747519 ) ( IS-CRATE ?auto_747518 ) ( not ( = ?auto_747519 ?auto_747518 ) ) ( TRUCK-AT ?auto_747522 ?auto_747520 ) ( AVAILABLE ?auto_747521 ) ( IN ?auto_747518 ?auto_747522 ) ( ON ?auto_747519 ?auto_747517 ) ( not ( = ?auto_747517 ?auto_747519 ) ) ( not ( = ?auto_747517 ?auto_747518 ) ) ( ON ?auto_747515 ?auto_747514 ) ( ON ?auto_747516 ?auto_747515 ) ( ON ?auto_747513 ?auto_747516 ) ( ON ?auto_747517 ?auto_747513 ) ( not ( = ?auto_747514 ?auto_747515 ) ) ( not ( = ?auto_747514 ?auto_747516 ) ) ( not ( = ?auto_747514 ?auto_747513 ) ) ( not ( = ?auto_747514 ?auto_747517 ) ) ( not ( = ?auto_747514 ?auto_747519 ) ) ( not ( = ?auto_747514 ?auto_747518 ) ) ( not ( = ?auto_747515 ?auto_747516 ) ) ( not ( = ?auto_747515 ?auto_747513 ) ) ( not ( = ?auto_747515 ?auto_747517 ) ) ( not ( = ?auto_747515 ?auto_747519 ) ) ( not ( = ?auto_747515 ?auto_747518 ) ) ( not ( = ?auto_747516 ?auto_747513 ) ) ( not ( = ?auto_747516 ?auto_747517 ) ) ( not ( = ?auto_747516 ?auto_747519 ) ) ( not ( = ?auto_747516 ?auto_747518 ) ) ( not ( = ?auto_747513 ?auto_747517 ) ) ( not ( = ?auto_747513 ?auto_747519 ) ) ( not ( = ?auto_747513 ?auto_747518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747517 ?auto_747519 ?auto_747518 )
      ( MAKE-6CRATE-VERIFY ?auto_747514 ?auto_747515 ?auto_747516 ?auto_747513 ?auto_747517 ?auto_747519 ?auto_747518 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747565 - SURFACE
      ?auto_747566 - SURFACE
      ?auto_747567 - SURFACE
      ?auto_747564 - SURFACE
      ?auto_747568 - SURFACE
      ?auto_747570 - SURFACE
      ?auto_747569 - SURFACE
    )
    :vars
    (
      ?auto_747574 - HOIST
      ?auto_747572 - PLACE
      ?auto_747571 - TRUCK
      ?auto_747573 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747574 ?auto_747572 ) ( SURFACE-AT ?auto_747570 ?auto_747572 ) ( CLEAR ?auto_747570 ) ( IS-CRATE ?auto_747569 ) ( not ( = ?auto_747570 ?auto_747569 ) ) ( AVAILABLE ?auto_747574 ) ( IN ?auto_747569 ?auto_747571 ) ( ON ?auto_747570 ?auto_747568 ) ( not ( = ?auto_747568 ?auto_747570 ) ) ( not ( = ?auto_747568 ?auto_747569 ) ) ( TRUCK-AT ?auto_747571 ?auto_747573 ) ( not ( = ?auto_747573 ?auto_747572 ) ) ( ON ?auto_747566 ?auto_747565 ) ( ON ?auto_747567 ?auto_747566 ) ( ON ?auto_747564 ?auto_747567 ) ( ON ?auto_747568 ?auto_747564 ) ( not ( = ?auto_747565 ?auto_747566 ) ) ( not ( = ?auto_747565 ?auto_747567 ) ) ( not ( = ?auto_747565 ?auto_747564 ) ) ( not ( = ?auto_747565 ?auto_747568 ) ) ( not ( = ?auto_747565 ?auto_747570 ) ) ( not ( = ?auto_747565 ?auto_747569 ) ) ( not ( = ?auto_747566 ?auto_747567 ) ) ( not ( = ?auto_747566 ?auto_747564 ) ) ( not ( = ?auto_747566 ?auto_747568 ) ) ( not ( = ?auto_747566 ?auto_747570 ) ) ( not ( = ?auto_747566 ?auto_747569 ) ) ( not ( = ?auto_747567 ?auto_747564 ) ) ( not ( = ?auto_747567 ?auto_747568 ) ) ( not ( = ?auto_747567 ?auto_747570 ) ) ( not ( = ?auto_747567 ?auto_747569 ) ) ( not ( = ?auto_747564 ?auto_747568 ) ) ( not ( = ?auto_747564 ?auto_747570 ) ) ( not ( = ?auto_747564 ?auto_747569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747568 ?auto_747570 ?auto_747569 )
      ( MAKE-6CRATE-VERIFY ?auto_747565 ?auto_747566 ?auto_747567 ?auto_747564 ?auto_747568 ?auto_747570 ?auto_747569 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747622 - SURFACE
      ?auto_747623 - SURFACE
      ?auto_747624 - SURFACE
      ?auto_747621 - SURFACE
      ?auto_747625 - SURFACE
      ?auto_747627 - SURFACE
      ?auto_747626 - SURFACE
    )
    :vars
    (
      ?auto_747629 - HOIST
      ?auto_747628 - PLACE
      ?auto_747630 - TRUCK
      ?auto_747631 - PLACE
      ?auto_747632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_747629 ?auto_747628 ) ( SURFACE-AT ?auto_747627 ?auto_747628 ) ( CLEAR ?auto_747627 ) ( IS-CRATE ?auto_747626 ) ( not ( = ?auto_747627 ?auto_747626 ) ) ( AVAILABLE ?auto_747629 ) ( ON ?auto_747627 ?auto_747625 ) ( not ( = ?auto_747625 ?auto_747627 ) ) ( not ( = ?auto_747625 ?auto_747626 ) ) ( TRUCK-AT ?auto_747630 ?auto_747631 ) ( not ( = ?auto_747631 ?auto_747628 ) ) ( HOIST-AT ?auto_747632 ?auto_747631 ) ( LIFTING ?auto_747632 ?auto_747626 ) ( not ( = ?auto_747629 ?auto_747632 ) ) ( ON ?auto_747623 ?auto_747622 ) ( ON ?auto_747624 ?auto_747623 ) ( ON ?auto_747621 ?auto_747624 ) ( ON ?auto_747625 ?auto_747621 ) ( not ( = ?auto_747622 ?auto_747623 ) ) ( not ( = ?auto_747622 ?auto_747624 ) ) ( not ( = ?auto_747622 ?auto_747621 ) ) ( not ( = ?auto_747622 ?auto_747625 ) ) ( not ( = ?auto_747622 ?auto_747627 ) ) ( not ( = ?auto_747622 ?auto_747626 ) ) ( not ( = ?auto_747623 ?auto_747624 ) ) ( not ( = ?auto_747623 ?auto_747621 ) ) ( not ( = ?auto_747623 ?auto_747625 ) ) ( not ( = ?auto_747623 ?auto_747627 ) ) ( not ( = ?auto_747623 ?auto_747626 ) ) ( not ( = ?auto_747624 ?auto_747621 ) ) ( not ( = ?auto_747624 ?auto_747625 ) ) ( not ( = ?auto_747624 ?auto_747627 ) ) ( not ( = ?auto_747624 ?auto_747626 ) ) ( not ( = ?auto_747621 ?auto_747625 ) ) ( not ( = ?auto_747621 ?auto_747627 ) ) ( not ( = ?auto_747621 ?auto_747626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747625 ?auto_747627 ?auto_747626 )
      ( MAKE-6CRATE-VERIFY ?auto_747622 ?auto_747623 ?auto_747624 ?auto_747621 ?auto_747625 ?auto_747627 ?auto_747626 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747685 - SURFACE
      ?auto_747686 - SURFACE
      ?auto_747687 - SURFACE
      ?auto_747684 - SURFACE
      ?auto_747688 - SURFACE
      ?auto_747690 - SURFACE
      ?auto_747689 - SURFACE
    )
    :vars
    (
      ?auto_747692 - HOIST
      ?auto_747691 - PLACE
      ?auto_747696 - TRUCK
      ?auto_747693 - PLACE
      ?auto_747695 - HOIST
      ?auto_747694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747692 ?auto_747691 ) ( SURFACE-AT ?auto_747690 ?auto_747691 ) ( CLEAR ?auto_747690 ) ( IS-CRATE ?auto_747689 ) ( not ( = ?auto_747690 ?auto_747689 ) ) ( AVAILABLE ?auto_747692 ) ( ON ?auto_747690 ?auto_747688 ) ( not ( = ?auto_747688 ?auto_747690 ) ) ( not ( = ?auto_747688 ?auto_747689 ) ) ( TRUCK-AT ?auto_747696 ?auto_747693 ) ( not ( = ?auto_747693 ?auto_747691 ) ) ( HOIST-AT ?auto_747695 ?auto_747693 ) ( not ( = ?auto_747692 ?auto_747695 ) ) ( AVAILABLE ?auto_747695 ) ( SURFACE-AT ?auto_747689 ?auto_747693 ) ( ON ?auto_747689 ?auto_747694 ) ( CLEAR ?auto_747689 ) ( not ( = ?auto_747690 ?auto_747694 ) ) ( not ( = ?auto_747689 ?auto_747694 ) ) ( not ( = ?auto_747688 ?auto_747694 ) ) ( ON ?auto_747686 ?auto_747685 ) ( ON ?auto_747687 ?auto_747686 ) ( ON ?auto_747684 ?auto_747687 ) ( ON ?auto_747688 ?auto_747684 ) ( not ( = ?auto_747685 ?auto_747686 ) ) ( not ( = ?auto_747685 ?auto_747687 ) ) ( not ( = ?auto_747685 ?auto_747684 ) ) ( not ( = ?auto_747685 ?auto_747688 ) ) ( not ( = ?auto_747685 ?auto_747690 ) ) ( not ( = ?auto_747685 ?auto_747689 ) ) ( not ( = ?auto_747685 ?auto_747694 ) ) ( not ( = ?auto_747686 ?auto_747687 ) ) ( not ( = ?auto_747686 ?auto_747684 ) ) ( not ( = ?auto_747686 ?auto_747688 ) ) ( not ( = ?auto_747686 ?auto_747690 ) ) ( not ( = ?auto_747686 ?auto_747689 ) ) ( not ( = ?auto_747686 ?auto_747694 ) ) ( not ( = ?auto_747687 ?auto_747684 ) ) ( not ( = ?auto_747687 ?auto_747688 ) ) ( not ( = ?auto_747687 ?auto_747690 ) ) ( not ( = ?auto_747687 ?auto_747689 ) ) ( not ( = ?auto_747687 ?auto_747694 ) ) ( not ( = ?auto_747684 ?auto_747688 ) ) ( not ( = ?auto_747684 ?auto_747690 ) ) ( not ( = ?auto_747684 ?auto_747689 ) ) ( not ( = ?auto_747684 ?auto_747694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747688 ?auto_747690 ?auto_747689 )
      ( MAKE-6CRATE-VERIFY ?auto_747685 ?auto_747686 ?auto_747687 ?auto_747684 ?auto_747688 ?auto_747690 ?auto_747689 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747749 - SURFACE
      ?auto_747750 - SURFACE
      ?auto_747751 - SURFACE
      ?auto_747748 - SURFACE
      ?auto_747752 - SURFACE
      ?auto_747754 - SURFACE
      ?auto_747753 - SURFACE
    )
    :vars
    (
      ?auto_747757 - HOIST
      ?auto_747758 - PLACE
      ?auto_747756 - PLACE
      ?auto_747759 - HOIST
      ?auto_747760 - SURFACE
      ?auto_747755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747757 ?auto_747758 ) ( SURFACE-AT ?auto_747754 ?auto_747758 ) ( CLEAR ?auto_747754 ) ( IS-CRATE ?auto_747753 ) ( not ( = ?auto_747754 ?auto_747753 ) ) ( AVAILABLE ?auto_747757 ) ( ON ?auto_747754 ?auto_747752 ) ( not ( = ?auto_747752 ?auto_747754 ) ) ( not ( = ?auto_747752 ?auto_747753 ) ) ( not ( = ?auto_747756 ?auto_747758 ) ) ( HOIST-AT ?auto_747759 ?auto_747756 ) ( not ( = ?auto_747757 ?auto_747759 ) ) ( AVAILABLE ?auto_747759 ) ( SURFACE-AT ?auto_747753 ?auto_747756 ) ( ON ?auto_747753 ?auto_747760 ) ( CLEAR ?auto_747753 ) ( not ( = ?auto_747754 ?auto_747760 ) ) ( not ( = ?auto_747753 ?auto_747760 ) ) ( not ( = ?auto_747752 ?auto_747760 ) ) ( TRUCK-AT ?auto_747755 ?auto_747758 ) ( ON ?auto_747750 ?auto_747749 ) ( ON ?auto_747751 ?auto_747750 ) ( ON ?auto_747748 ?auto_747751 ) ( ON ?auto_747752 ?auto_747748 ) ( not ( = ?auto_747749 ?auto_747750 ) ) ( not ( = ?auto_747749 ?auto_747751 ) ) ( not ( = ?auto_747749 ?auto_747748 ) ) ( not ( = ?auto_747749 ?auto_747752 ) ) ( not ( = ?auto_747749 ?auto_747754 ) ) ( not ( = ?auto_747749 ?auto_747753 ) ) ( not ( = ?auto_747749 ?auto_747760 ) ) ( not ( = ?auto_747750 ?auto_747751 ) ) ( not ( = ?auto_747750 ?auto_747748 ) ) ( not ( = ?auto_747750 ?auto_747752 ) ) ( not ( = ?auto_747750 ?auto_747754 ) ) ( not ( = ?auto_747750 ?auto_747753 ) ) ( not ( = ?auto_747750 ?auto_747760 ) ) ( not ( = ?auto_747751 ?auto_747748 ) ) ( not ( = ?auto_747751 ?auto_747752 ) ) ( not ( = ?auto_747751 ?auto_747754 ) ) ( not ( = ?auto_747751 ?auto_747753 ) ) ( not ( = ?auto_747751 ?auto_747760 ) ) ( not ( = ?auto_747748 ?auto_747752 ) ) ( not ( = ?auto_747748 ?auto_747754 ) ) ( not ( = ?auto_747748 ?auto_747753 ) ) ( not ( = ?auto_747748 ?auto_747760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747752 ?auto_747754 ?auto_747753 )
      ( MAKE-6CRATE-VERIFY ?auto_747749 ?auto_747750 ?auto_747751 ?auto_747748 ?auto_747752 ?auto_747754 ?auto_747753 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747813 - SURFACE
      ?auto_747814 - SURFACE
      ?auto_747815 - SURFACE
      ?auto_747812 - SURFACE
      ?auto_747816 - SURFACE
      ?auto_747818 - SURFACE
      ?auto_747817 - SURFACE
    )
    :vars
    (
      ?auto_747823 - HOIST
      ?auto_747819 - PLACE
      ?auto_747822 - PLACE
      ?auto_747824 - HOIST
      ?auto_747821 - SURFACE
      ?auto_747820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747823 ?auto_747819 ) ( IS-CRATE ?auto_747817 ) ( not ( = ?auto_747818 ?auto_747817 ) ) ( not ( = ?auto_747816 ?auto_747818 ) ) ( not ( = ?auto_747816 ?auto_747817 ) ) ( not ( = ?auto_747822 ?auto_747819 ) ) ( HOIST-AT ?auto_747824 ?auto_747822 ) ( not ( = ?auto_747823 ?auto_747824 ) ) ( AVAILABLE ?auto_747824 ) ( SURFACE-AT ?auto_747817 ?auto_747822 ) ( ON ?auto_747817 ?auto_747821 ) ( CLEAR ?auto_747817 ) ( not ( = ?auto_747818 ?auto_747821 ) ) ( not ( = ?auto_747817 ?auto_747821 ) ) ( not ( = ?auto_747816 ?auto_747821 ) ) ( TRUCK-AT ?auto_747820 ?auto_747819 ) ( SURFACE-AT ?auto_747816 ?auto_747819 ) ( CLEAR ?auto_747816 ) ( LIFTING ?auto_747823 ?auto_747818 ) ( IS-CRATE ?auto_747818 ) ( ON ?auto_747814 ?auto_747813 ) ( ON ?auto_747815 ?auto_747814 ) ( ON ?auto_747812 ?auto_747815 ) ( ON ?auto_747816 ?auto_747812 ) ( not ( = ?auto_747813 ?auto_747814 ) ) ( not ( = ?auto_747813 ?auto_747815 ) ) ( not ( = ?auto_747813 ?auto_747812 ) ) ( not ( = ?auto_747813 ?auto_747816 ) ) ( not ( = ?auto_747813 ?auto_747818 ) ) ( not ( = ?auto_747813 ?auto_747817 ) ) ( not ( = ?auto_747813 ?auto_747821 ) ) ( not ( = ?auto_747814 ?auto_747815 ) ) ( not ( = ?auto_747814 ?auto_747812 ) ) ( not ( = ?auto_747814 ?auto_747816 ) ) ( not ( = ?auto_747814 ?auto_747818 ) ) ( not ( = ?auto_747814 ?auto_747817 ) ) ( not ( = ?auto_747814 ?auto_747821 ) ) ( not ( = ?auto_747815 ?auto_747812 ) ) ( not ( = ?auto_747815 ?auto_747816 ) ) ( not ( = ?auto_747815 ?auto_747818 ) ) ( not ( = ?auto_747815 ?auto_747817 ) ) ( not ( = ?auto_747815 ?auto_747821 ) ) ( not ( = ?auto_747812 ?auto_747816 ) ) ( not ( = ?auto_747812 ?auto_747818 ) ) ( not ( = ?auto_747812 ?auto_747817 ) ) ( not ( = ?auto_747812 ?auto_747821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747816 ?auto_747818 ?auto_747817 )
      ( MAKE-6CRATE-VERIFY ?auto_747813 ?auto_747814 ?auto_747815 ?auto_747812 ?auto_747816 ?auto_747818 ?auto_747817 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747877 - SURFACE
      ?auto_747878 - SURFACE
      ?auto_747879 - SURFACE
      ?auto_747876 - SURFACE
      ?auto_747880 - SURFACE
      ?auto_747882 - SURFACE
      ?auto_747881 - SURFACE
    )
    :vars
    (
      ?auto_747886 - HOIST
      ?auto_747884 - PLACE
      ?auto_747887 - PLACE
      ?auto_747885 - HOIST
      ?auto_747883 - SURFACE
      ?auto_747888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747886 ?auto_747884 ) ( IS-CRATE ?auto_747881 ) ( not ( = ?auto_747882 ?auto_747881 ) ) ( not ( = ?auto_747880 ?auto_747882 ) ) ( not ( = ?auto_747880 ?auto_747881 ) ) ( not ( = ?auto_747887 ?auto_747884 ) ) ( HOIST-AT ?auto_747885 ?auto_747887 ) ( not ( = ?auto_747886 ?auto_747885 ) ) ( AVAILABLE ?auto_747885 ) ( SURFACE-AT ?auto_747881 ?auto_747887 ) ( ON ?auto_747881 ?auto_747883 ) ( CLEAR ?auto_747881 ) ( not ( = ?auto_747882 ?auto_747883 ) ) ( not ( = ?auto_747881 ?auto_747883 ) ) ( not ( = ?auto_747880 ?auto_747883 ) ) ( TRUCK-AT ?auto_747888 ?auto_747884 ) ( SURFACE-AT ?auto_747880 ?auto_747884 ) ( CLEAR ?auto_747880 ) ( IS-CRATE ?auto_747882 ) ( AVAILABLE ?auto_747886 ) ( IN ?auto_747882 ?auto_747888 ) ( ON ?auto_747878 ?auto_747877 ) ( ON ?auto_747879 ?auto_747878 ) ( ON ?auto_747876 ?auto_747879 ) ( ON ?auto_747880 ?auto_747876 ) ( not ( = ?auto_747877 ?auto_747878 ) ) ( not ( = ?auto_747877 ?auto_747879 ) ) ( not ( = ?auto_747877 ?auto_747876 ) ) ( not ( = ?auto_747877 ?auto_747880 ) ) ( not ( = ?auto_747877 ?auto_747882 ) ) ( not ( = ?auto_747877 ?auto_747881 ) ) ( not ( = ?auto_747877 ?auto_747883 ) ) ( not ( = ?auto_747878 ?auto_747879 ) ) ( not ( = ?auto_747878 ?auto_747876 ) ) ( not ( = ?auto_747878 ?auto_747880 ) ) ( not ( = ?auto_747878 ?auto_747882 ) ) ( not ( = ?auto_747878 ?auto_747881 ) ) ( not ( = ?auto_747878 ?auto_747883 ) ) ( not ( = ?auto_747879 ?auto_747876 ) ) ( not ( = ?auto_747879 ?auto_747880 ) ) ( not ( = ?auto_747879 ?auto_747882 ) ) ( not ( = ?auto_747879 ?auto_747881 ) ) ( not ( = ?auto_747879 ?auto_747883 ) ) ( not ( = ?auto_747876 ?auto_747880 ) ) ( not ( = ?auto_747876 ?auto_747882 ) ) ( not ( = ?auto_747876 ?auto_747881 ) ) ( not ( = ?auto_747876 ?auto_747883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747880 ?auto_747882 ?auto_747881 )
      ( MAKE-6CRATE-VERIFY ?auto_747877 ?auto_747878 ?auto_747879 ?auto_747876 ?auto_747880 ?auto_747882 ?auto_747881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_749150 - SURFACE
      ?auto_749151 - SURFACE
    )
    :vars
    (
      ?auto_749154 - HOIST
      ?auto_749157 - PLACE
      ?auto_749155 - SURFACE
      ?auto_749158 - PLACE
      ?auto_749152 - HOIST
      ?auto_749153 - SURFACE
      ?auto_749156 - TRUCK
      ?auto_749159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749154 ?auto_749157 ) ( SURFACE-AT ?auto_749150 ?auto_749157 ) ( CLEAR ?auto_749150 ) ( IS-CRATE ?auto_749151 ) ( not ( = ?auto_749150 ?auto_749151 ) ) ( ON ?auto_749150 ?auto_749155 ) ( not ( = ?auto_749155 ?auto_749150 ) ) ( not ( = ?auto_749155 ?auto_749151 ) ) ( not ( = ?auto_749158 ?auto_749157 ) ) ( HOIST-AT ?auto_749152 ?auto_749158 ) ( not ( = ?auto_749154 ?auto_749152 ) ) ( AVAILABLE ?auto_749152 ) ( SURFACE-AT ?auto_749151 ?auto_749158 ) ( ON ?auto_749151 ?auto_749153 ) ( CLEAR ?auto_749151 ) ( not ( = ?auto_749150 ?auto_749153 ) ) ( not ( = ?auto_749151 ?auto_749153 ) ) ( not ( = ?auto_749155 ?auto_749153 ) ) ( TRUCK-AT ?auto_749156 ?auto_749157 ) ( LIFTING ?auto_749154 ?auto_749159 ) ( IS-CRATE ?auto_749159 ) ( not ( = ?auto_749150 ?auto_749159 ) ) ( not ( = ?auto_749151 ?auto_749159 ) ) ( not ( = ?auto_749155 ?auto_749159 ) ) ( not ( = ?auto_749153 ?auto_749159 ) ) )
    :subtasks
    ( ( !LOAD ?auto_749154 ?auto_749159 ?auto_749156 ?auto_749157 )
      ( MAKE-1CRATE ?auto_749150 ?auto_749151 )
      ( MAKE-1CRATE-VERIFY ?auto_749150 ?auto_749151 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749828 - SURFACE
      ?auto_749829 - SURFACE
      ?auto_749830 - SURFACE
      ?auto_749827 - SURFACE
      ?auto_749831 - SURFACE
      ?auto_749833 - SURFACE
      ?auto_749832 - SURFACE
      ?auto_749834 - SURFACE
    )
    :vars
    (
      ?auto_749836 - HOIST
      ?auto_749835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749836 ?auto_749835 ) ( SURFACE-AT ?auto_749832 ?auto_749835 ) ( CLEAR ?auto_749832 ) ( LIFTING ?auto_749836 ?auto_749834 ) ( IS-CRATE ?auto_749834 ) ( not ( = ?auto_749832 ?auto_749834 ) ) ( ON ?auto_749829 ?auto_749828 ) ( ON ?auto_749830 ?auto_749829 ) ( ON ?auto_749827 ?auto_749830 ) ( ON ?auto_749831 ?auto_749827 ) ( ON ?auto_749833 ?auto_749831 ) ( ON ?auto_749832 ?auto_749833 ) ( not ( = ?auto_749828 ?auto_749829 ) ) ( not ( = ?auto_749828 ?auto_749830 ) ) ( not ( = ?auto_749828 ?auto_749827 ) ) ( not ( = ?auto_749828 ?auto_749831 ) ) ( not ( = ?auto_749828 ?auto_749833 ) ) ( not ( = ?auto_749828 ?auto_749832 ) ) ( not ( = ?auto_749828 ?auto_749834 ) ) ( not ( = ?auto_749829 ?auto_749830 ) ) ( not ( = ?auto_749829 ?auto_749827 ) ) ( not ( = ?auto_749829 ?auto_749831 ) ) ( not ( = ?auto_749829 ?auto_749833 ) ) ( not ( = ?auto_749829 ?auto_749832 ) ) ( not ( = ?auto_749829 ?auto_749834 ) ) ( not ( = ?auto_749830 ?auto_749827 ) ) ( not ( = ?auto_749830 ?auto_749831 ) ) ( not ( = ?auto_749830 ?auto_749833 ) ) ( not ( = ?auto_749830 ?auto_749832 ) ) ( not ( = ?auto_749830 ?auto_749834 ) ) ( not ( = ?auto_749827 ?auto_749831 ) ) ( not ( = ?auto_749827 ?auto_749833 ) ) ( not ( = ?auto_749827 ?auto_749832 ) ) ( not ( = ?auto_749827 ?auto_749834 ) ) ( not ( = ?auto_749831 ?auto_749833 ) ) ( not ( = ?auto_749831 ?auto_749832 ) ) ( not ( = ?auto_749831 ?auto_749834 ) ) ( not ( = ?auto_749833 ?auto_749832 ) ) ( not ( = ?auto_749833 ?auto_749834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_749832 ?auto_749834 )
      ( MAKE-7CRATE-VERIFY ?auto_749828 ?auto_749829 ?auto_749830 ?auto_749827 ?auto_749831 ?auto_749833 ?auto_749832 ?auto_749834 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749883 - SURFACE
      ?auto_749884 - SURFACE
      ?auto_749885 - SURFACE
      ?auto_749882 - SURFACE
      ?auto_749886 - SURFACE
      ?auto_749888 - SURFACE
      ?auto_749887 - SURFACE
      ?auto_749889 - SURFACE
    )
    :vars
    (
      ?auto_749890 - HOIST
      ?auto_749891 - PLACE
      ?auto_749892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_749890 ?auto_749891 ) ( SURFACE-AT ?auto_749887 ?auto_749891 ) ( CLEAR ?auto_749887 ) ( IS-CRATE ?auto_749889 ) ( not ( = ?auto_749887 ?auto_749889 ) ) ( TRUCK-AT ?auto_749892 ?auto_749891 ) ( AVAILABLE ?auto_749890 ) ( IN ?auto_749889 ?auto_749892 ) ( ON ?auto_749887 ?auto_749888 ) ( not ( = ?auto_749888 ?auto_749887 ) ) ( not ( = ?auto_749888 ?auto_749889 ) ) ( ON ?auto_749884 ?auto_749883 ) ( ON ?auto_749885 ?auto_749884 ) ( ON ?auto_749882 ?auto_749885 ) ( ON ?auto_749886 ?auto_749882 ) ( ON ?auto_749888 ?auto_749886 ) ( not ( = ?auto_749883 ?auto_749884 ) ) ( not ( = ?auto_749883 ?auto_749885 ) ) ( not ( = ?auto_749883 ?auto_749882 ) ) ( not ( = ?auto_749883 ?auto_749886 ) ) ( not ( = ?auto_749883 ?auto_749888 ) ) ( not ( = ?auto_749883 ?auto_749887 ) ) ( not ( = ?auto_749883 ?auto_749889 ) ) ( not ( = ?auto_749884 ?auto_749885 ) ) ( not ( = ?auto_749884 ?auto_749882 ) ) ( not ( = ?auto_749884 ?auto_749886 ) ) ( not ( = ?auto_749884 ?auto_749888 ) ) ( not ( = ?auto_749884 ?auto_749887 ) ) ( not ( = ?auto_749884 ?auto_749889 ) ) ( not ( = ?auto_749885 ?auto_749882 ) ) ( not ( = ?auto_749885 ?auto_749886 ) ) ( not ( = ?auto_749885 ?auto_749888 ) ) ( not ( = ?auto_749885 ?auto_749887 ) ) ( not ( = ?auto_749885 ?auto_749889 ) ) ( not ( = ?auto_749882 ?auto_749886 ) ) ( not ( = ?auto_749882 ?auto_749888 ) ) ( not ( = ?auto_749882 ?auto_749887 ) ) ( not ( = ?auto_749882 ?auto_749889 ) ) ( not ( = ?auto_749886 ?auto_749888 ) ) ( not ( = ?auto_749886 ?auto_749887 ) ) ( not ( = ?auto_749886 ?auto_749889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749888 ?auto_749887 ?auto_749889 )
      ( MAKE-7CRATE-VERIFY ?auto_749883 ?auto_749884 ?auto_749885 ?auto_749882 ?auto_749886 ?auto_749888 ?auto_749887 ?auto_749889 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749946 - SURFACE
      ?auto_749947 - SURFACE
      ?auto_749948 - SURFACE
      ?auto_749945 - SURFACE
      ?auto_749949 - SURFACE
      ?auto_749951 - SURFACE
      ?auto_749950 - SURFACE
      ?auto_749952 - SURFACE
    )
    :vars
    (
      ?auto_749954 - HOIST
      ?auto_749953 - PLACE
      ?auto_749956 - TRUCK
      ?auto_749955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749954 ?auto_749953 ) ( SURFACE-AT ?auto_749950 ?auto_749953 ) ( CLEAR ?auto_749950 ) ( IS-CRATE ?auto_749952 ) ( not ( = ?auto_749950 ?auto_749952 ) ) ( AVAILABLE ?auto_749954 ) ( IN ?auto_749952 ?auto_749956 ) ( ON ?auto_749950 ?auto_749951 ) ( not ( = ?auto_749951 ?auto_749950 ) ) ( not ( = ?auto_749951 ?auto_749952 ) ) ( TRUCK-AT ?auto_749956 ?auto_749955 ) ( not ( = ?auto_749955 ?auto_749953 ) ) ( ON ?auto_749947 ?auto_749946 ) ( ON ?auto_749948 ?auto_749947 ) ( ON ?auto_749945 ?auto_749948 ) ( ON ?auto_749949 ?auto_749945 ) ( ON ?auto_749951 ?auto_749949 ) ( not ( = ?auto_749946 ?auto_749947 ) ) ( not ( = ?auto_749946 ?auto_749948 ) ) ( not ( = ?auto_749946 ?auto_749945 ) ) ( not ( = ?auto_749946 ?auto_749949 ) ) ( not ( = ?auto_749946 ?auto_749951 ) ) ( not ( = ?auto_749946 ?auto_749950 ) ) ( not ( = ?auto_749946 ?auto_749952 ) ) ( not ( = ?auto_749947 ?auto_749948 ) ) ( not ( = ?auto_749947 ?auto_749945 ) ) ( not ( = ?auto_749947 ?auto_749949 ) ) ( not ( = ?auto_749947 ?auto_749951 ) ) ( not ( = ?auto_749947 ?auto_749950 ) ) ( not ( = ?auto_749947 ?auto_749952 ) ) ( not ( = ?auto_749948 ?auto_749945 ) ) ( not ( = ?auto_749948 ?auto_749949 ) ) ( not ( = ?auto_749948 ?auto_749951 ) ) ( not ( = ?auto_749948 ?auto_749950 ) ) ( not ( = ?auto_749948 ?auto_749952 ) ) ( not ( = ?auto_749945 ?auto_749949 ) ) ( not ( = ?auto_749945 ?auto_749951 ) ) ( not ( = ?auto_749945 ?auto_749950 ) ) ( not ( = ?auto_749945 ?auto_749952 ) ) ( not ( = ?auto_749949 ?auto_749951 ) ) ( not ( = ?auto_749949 ?auto_749950 ) ) ( not ( = ?auto_749949 ?auto_749952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749951 ?auto_749950 ?auto_749952 )
      ( MAKE-7CRATE-VERIFY ?auto_749946 ?auto_749947 ?auto_749948 ?auto_749945 ?auto_749949 ?auto_749951 ?auto_749950 ?auto_749952 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750016 - SURFACE
      ?auto_750017 - SURFACE
      ?auto_750018 - SURFACE
      ?auto_750015 - SURFACE
      ?auto_750019 - SURFACE
      ?auto_750021 - SURFACE
      ?auto_750020 - SURFACE
      ?auto_750022 - SURFACE
    )
    :vars
    (
      ?auto_750026 - HOIST
      ?auto_750024 - PLACE
      ?auto_750027 - TRUCK
      ?auto_750023 - PLACE
      ?auto_750025 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_750026 ?auto_750024 ) ( SURFACE-AT ?auto_750020 ?auto_750024 ) ( CLEAR ?auto_750020 ) ( IS-CRATE ?auto_750022 ) ( not ( = ?auto_750020 ?auto_750022 ) ) ( AVAILABLE ?auto_750026 ) ( ON ?auto_750020 ?auto_750021 ) ( not ( = ?auto_750021 ?auto_750020 ) ) ( not ( = ?auto_750021 ?auto_750022 ) ) ( TRUCK-AT ?auto_750027 ?auto_750023 ) ( not ( = ?auto_750023 ?auto_750024 ) ) ( HOIST-AT ?auto_750025 ?auto_750023 ) ( LIFTING ?auto_750025 ?auto_750022 ) ( not ( = ?auto_750026 ?auto_750025 ) ) ( ON ?auto_750017 ?auto_750016 ) ( ON ?auto_750018 ?auto_750017 ) ( ON ?auto_750015 ?auto_750018 ) ( ON ?auto_750019 ?auto_750015 ) ( ON ?auto_750021 ?auto_750019 ) ( not ( = ?auto_750016 ?auto_750017 ) ) ( not ( = ?auto_750016 ?auto_750018 ) ) ( not ( = ?auto_750016 ?auto_750015 ) ) ( not ( = ?auto_750016 ?auto_750019 ) ) ( not ( = ?auto_750016 ?auto_750021 ) ) ( not ( = ?auto_750016 ?auto_750020 ) ) ( not ( = ?auto_750016 ?auto_750022 ) ) ( not ( = ?auto_750017 ?auto_750018 ) ) ( not ( = ?auto_750017 ?auto_750015 ) ) ( not ( = ?auto_750017 ?auto_750019 ) ) ( not ( = ?auto_750017 ?auto_750021 ) ) ( not ( = ?auto_750017 ?auto_750020 ) ) ( not ( = ?auto_750017 ?auto_750022 ) ) ( not ( = ?auto_750018 ?auto_750015 ) ) ( not ( = ?auto_750018 ?auto_750019 ) ) ( not ( = ?auto_750018 ?auto_750021 ) ) ( not ( = ?auto_750018 ?auto_750020 ) ) ( not ( = ?auto_750018 ?auto_750022 ) ) ( not ( = ?auto_750015 ?auto_750019 ) ) ( not ( = ?auto_750015 ?auto_750021 ) ) ( not ( = ?auto_750015 ?auto_750020 ) ) ( not ( = ?auto_750015 ?auto_750022 ) ) ( not ( = ?auto_750019 ?auto_750021 ) ) ( not ( = ?auto_750019 ?auto_750020 ) ) ( not ( = ?auto_750019 ?auto_750022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750021 ?auto_750020 ?auto_750022 )
      ( MAKE-7CRATE-VERIFY ?auto_750016 ?auto_750017 ?auto_750018 ?auto_750015 ?auto_750019 ?auto_750021 ?auto_750020 ?auto_750022 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750093 - SURFACE
      ?auto_750094 - SURFACE
      ?auto_750095 - SURFACE
      ?auto_750092 - SURFACE
      ?auto_750096 - SURFACE
      ?auto_750098 - SURFACE
      ?auto_750097 - SURFACE
      ?auto_750099 - SURFACE
    )
    :vars
    (
      ?auto_750103 - HOIST
      ?auto_750102 - PLACE
      ?auto_750105 - TRUCK
      ?auto_750104 - PLACE
      ?auto_750101 - HOIST
      ?auto_750100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_750103 ?auto_750102 ) ( SURFACE-AT ?auto_750097 ?auto_750102 ) ( CLEAR ?auto_750097 ) ( IS-CRATE ?auto_750099 ) ( not ( = ?auto_750097 ?auto_750099 ) ) ( AVAILABLE ?auto_750103 ) ( ON ?auto_750097 ?auto_750098 ) ( not ( = ?auto_750098 ?auto_750097 ) ) ( not ( = ?auto_750098 ?auto_750099 ) ) ( TRUCK-AT ?auto_750105 ?auto_750104 ) ( not ( = ?auto_750104 ?auto_750102 ) ) ( HOIST-AT ?auto_750101 ?auto_750104 ) ( not ( = ?auto_750103 ?auto_750101 ) ) ( AVAILABLE ?auto_750101 ) ( SURFACE-AT ?auto_750099 ?auto_750104 ) ( ON ?auto_750099 ?auto_750100 ) ( CLEAR ?auto_750099 ) ( not ( = ?auto_750097 ?auto_750100 ) ) ( not ( = ?auto_750099 ?auto_750100 ) ) ( not ( = ?auto_750098 ?auto_750100 ) ) ( ON ?auto_750094 ?auto_750093 ) ( ON ?auto_750095 ?auto_750094 ) ( ON ?auto_750092 ?auto_750095 ) ( ON ?auto_750096 ?auto_750092 ) ( ON ?auto_750098 ?auto_750096 ) ( not ( = ?auto_750093 ?auto_750094 ) ) ( not ( = ?auto_750093 ?auto_750095 ) ) ( not ( = ?auto_750093 ?auto_750092 ) ) ( not ( = ?auto_750093 ?auto_750096 ) ) ( not ( = ?auto_750093 ?auto_750098 ) ) ( not ( = ?auto_750093 ?auto_750097 ) ) ( not ( = ?auto_750093 ?auto_750099 ) ) ( not ( = ?auto_750093 ?auto_750100 ) ) ( not ( = ?auto_750094 ?auto_750095 ) ) ( not ( = ?auto_750094 ?auto_750092 ) ) ( not ( = ?auto_750094 ?auto_750096 ) ) ( not ( = ?auto_750094 ?auto_750098 ) ) ( not ( = ?auto_750094 ?auto_750097 ) ) ( not ( = ?auto_750094 ?auto_750099 ) ) ( not ( = ?auto_750094 ?auto_750100 ) ) ( not ( = ?auto_750095 ?auto_750092 ) ) ( not ( = ?auto_750095 ?auto_750096 ) ) ( not ( = ?auto_750095 ?auto_750098 ) ) ( not ( = ?auto_750095 ?auto_750097 ) ) ( not ( = ?auto_750095 ?auto_750099 ) ) ( not ( = ?auto_750095 ?auto_750100 ) ) ( not ( = ?auto_750092 ?auto_750096 ) ) ( not ( = ?auto_750092 ?auto_750098 ) ) ( not ( = ?auto_750092 ?auto_750097 ) ) ( not ( = ?auto_750092 ?auto_750099 ) ) ( not ( = ?auto_750092 ?auto_750100 ) ) ( not ( = ?auto_750096 ?auto_750098 ) ) ( not ( = ?auto_750096 ?auto_750097 ) ) ( not ( = ?auto_750096 ?auto_750099 ) ) ( not ( = ?auto_750096 ?auto_750100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750098 ?auto_750097 ?auto_750099 )
      ( MAKE-7CRATE-VERIFY ?auto_750093 ?auto_750094 ?auto_750095 ?auto_750092 ?auto_750096 ?auto_750098 ?auto_750097 ?auto_750099 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750171 - SURFACE
      ?auto_750172 - SURFACE
      ?auto_750173 - SURFACE
      ?auto_750170 - SURFACE
      ?auto_750174 - SURFACE
      ?auto_750176 - SURFACE
      ?auto_750175 - SURFACE
      ?auto_750177 - SURFACE
    )
    :vars
    (
      ?auto_750178 - HOIST
      ?auto_750180 - PLACE
      ?auto_750183 - PLACE
      ?auto_750181 - HOIST
      ?auto_750182 - SURFACE
      ?auto_750179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_750178 ?auto_750180 ) ( SURFACE-AT ?auto_750175 ?auto_750180 ) ( CLEAR ?auto_750175 ) ( IS-CRATE ?auto_750177 ) ( not ( = ?auto_750175 ?auto_750177 ) ) ( AVAILABLE ?auto_750178 ) ( ON ?auto_750175 ?auto_750176 ) ( not ( = ?auto_750176 ?auto_750175 ) ) ( not ( = ?auto_750176 ?auto_750177 ) ) ( not ( = ?auto_750183 ?auto_750180 ) ) ( HOIST-AT ?auto_750181 ?auto_750183 ) ( not ( = ?auto_750178 ?auto_750181 ) ) ( AVAILABLE ?auto_750181 ) ( SURFACE-AT ?auto_750177 ?auto_750183 ) ( ON ?auto_750177 ?auto_750182 ) ( CLEAR ?auto_750177 ) ( not ( = ?auto_750175 ?auto_750182 ) ) ( not ( = ?auto_750177 ?auto_750182 ) ) ( not ( = ?auto_750176 ?auto_750182 ) ) ( TRUCK-AT ?auto_750179 ?auto_750180 ) ( ON ?auto_750172 ?auto_750171 ) ( ON ?auto_750173 ?auto_750172 ) ( ON ?auto_750170 ?auto_750173 ) ( ON ?auto_750174 ?auto_750170 ) ( ON ?auto_750176 ?auto_750174 ) ( not ( = ?auto_750171 ?auto_750172 ) ) ( not ( = ?auto_750171 ?auto_750173 ) ) ( not ( = ?auto_750171 ?auto_750170 ) ) ( not ( = ?auto_750171 ?auto_750174 ) ) ( not ( = ?auto_750171 ?auto_750176 ) ) ( not ( = ?auto_750171 ?auto_750175 ) ) ( not ( = ?auto_750171 ?auto_750177 ) ) ( not ( = ?auto_750171 ?auto_750182 ) ) ( not ( = ?auto_750172 ?auto_750173 ) ) ( not ( = ?auto_750172 ?auto_750170 ) ) ( not ( = ?auto_750172 ?auto_750174 ) ) ( not ( = ?auto_750172 ?auto_750176 ) ) ( not ( = ?auto_750172 ?auto_750175 ) ) ( not ( = ?auto_750172 ?auto_750177 ) ) ( not ( = ?auto_750172 ?auto_750182 ) ) ( not ( = ?auto_750173 ?auto_750170 ) ) ( not ( = ?auto_750173 ?auto_750174 ) ) ( not ( = ?auto_750173 ?auto_750176 ) ) ( not ( = ?auto_750173 ?auto_750175 ) ) ( not ( = ?auto_750173 ?auto_750177 ) ) ( not ( = ?auto_750173 ?auto_750182 ) ) ( not ( = ?auto_750170 ?auto_750174 ) ) ( not ( = ?auto_750170 ?auto_750176 ) ) ( not ( = ?auto_750170 ?auto_750175 ) ) ( not ( = ?auto_750170 ?auto_750177 ) ) ( not ( = ?auto_750170 ?auto_750182 ) ) ( not ( = ?auto_750174 ?auto_750176 ) ) ( not ( = ?auto_750174 ?auto_750175 ) ) ( not ( = ?auto_750174 ?auto_750177 ) ) ( not ( = ?auto_750174 ?auto_750182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750176 ?auto_750175 ?auto_750177 )
      ( MAKE-7CRATE-VERIFY ?auto_750171 ?auto_750172 ?auto_750173 ?auto_750170 ?auto_750174 ?auto_750176 ?auto_750175 ?auto_750177 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750249 - SURFACE
      ?auto_750250 - SURFACE
      ?auto_750251 - SURFACE
      ?auto_750248 - SURFACE
      ?auto_750252 - SURFACE
      ?auto_750254 - SURFACE
      ?auto_750253 - SURFACE
      ?auto_750255 - SURFACE
    )
    :vars
    (
      ?auto_750260 - HOIST
      ?auto_750261 - PLACE
      ?auto_750259 - PLACE
      ?auto_750256 - HOIST
      ?auto_750258 - SURFACE
      ?auto_750257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_750260 ?auto_750261 ) ( IS-CRATE ?auto_750255 ) ( not ( = ?auto_750253 ?auto_750255 ) ) ( not ( = ?auto_750254 ?auto_750253 ) ) ( not ( = ?auto_750254 ?auto_750255 ) ) ( not ( = ?auto_750259 ?auto_750261 ) ) ( HOIST-AT ?auto_750256 ?auto_750259 ) ( not ( = ?auto_750260 ?auto_750256 ) ) ( AVAILABLE ?auto_750256 ) ( SURFACE-AT ?auto_750255 ?auto_750259 ) ( ON ?auto_750255 ?auto_750258 ) ( CLEAR ?auto_750255 ) ( not ( = ?auto_750253 ?auto_750258 ) ) ( not ( = ?auto_750255 ?auto_750258 ) ) ( not ( = ?auto_750254 ?auto_750258 ) ) ( TRUCK-AT ?auto_750257 ?auto_750261 ) ( SURFACE-AT ?auto_750254 ?auto_750261 ) ( CLEAR ?auto_750254 ) ( LIFTING ?auto_750260 ?auto_750253 ) ( IS-CRATE ?auto_750253 ) ( ON ?auto_750250 ?auto_750249 ) ( ON ?auto_750251 ?auto_750250 ) ( ON ?auto_750248 ?auto_750251 ) ( ON ?auto_750252 ?auto_750248 ) ( ON ?auto_750254 ?auto_750252 ) ( not ( = ?auto_750249 ?auto_750250 ) ) ( not ( = ?auto_750249 ?auto_750251 ) ) ( not ( = ?auto_750249 ?auto_750248 ) ) ( not ( = ?auto_750249 ?auto_750252 ) ) ( not ( = ?auto_750249 ?auto_750254 ) ) ( not ( = ?auto_750249 ?auto_750253 ) ) ( not ( = ?auto_750249 ?auto_750255 ) ) ( not ( = ?auto_750249 ?auto_750258 ) ) ( not ( = ?auto_750250 ?auto_750251 ) ) ( not ( = ?auto_750250 ?auto_750248 ) ) ( not ( = ?auto_750250 ?auto_750252 ) ) ( not ( = ?auto_750250 ?auto_750254 ) ) ( not ( = ?auto_750250 ?auto_750253 ) ) ( not ( = ?auto_750250 ?auto_750255 ) ) ( not ( = ?auto_750250 ?auto_750258 ) ) ( not ( = ?auto_750251 ?auto_750248 ) ) ( not ( = ?auto_750251 ?auto_750252 ) ) ( not ( = ?auto_750251 ?auto_750254 ) ) ( not ( = ?auto_750251 ?auto_750253 ) ) ( not ( = ?auto_750251 ?auto_750255 ) ) ( not ( = ?auto_750251 ?auto_750258 ) ) ( not ( = ?auto_750248 ?auto_750252 ) ) ( not ( = ?auto_750248 ?auto_750254 ) ) ( not ( = ?auto_750248 ?auto_750253 ) ) ( not ( = ?auto_750248 ?auto_750255 ) ) ( not ( = ?auto_750248 ?auto_750258 ) ) ( not ( = ?auto_750252 ?auto_750254 ) ) ( not ( = ?auto_750252 ?auto_750253 ) ) ( not ( = ?auto_750252 ?auto_750255 ) ) ( not ( = ?auto_750252 ?auto_750258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750254 ?auto_750253 ?auto_750255 )
      ( MAKE-7CRATE-VERIFY ?auto_750249 ?auto_750250 ?auto_750251 ?auto_750248 ?auto_750252 ?auto_750254 ?auto_750253 ?auto_750255 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750327 - SURFACE
      ?auto_750328 - SURFACE
      ?auto_750329 - SURFACE
      ?auto_750326 - SURFACE
      ?auto_750330 - SURFACE
      ?auto_750332 - SURFACE
      ?auto_750331 - SURFACE
      ?auto_750333 - SURFACE
    )
    :vars
    (
      ?auto_750334 - HOIST
      ?auto_750338 - PLACE
      ?auto_750337 - PLACE
      ?auto_750339 - HOIST
      ?auto_750335 - SURFACE
      ?auto_750336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_750334 ?auto_750338 ) ( IS-CRATE ?auto_750333 ) ( not ( = ?auto_750331 ?auto_750333 ) ) ( not ( = ?auto_750332 ?auto_750331 ) ) ( not ( = ?auto_750332 ?auto_750333 ) ) ( not ( = ?auto_750337 ?auto_750338 ) ) ( HOIST-AT ?auto_750339 ?auto_750337 ) ( not ( = ?auto_750334 ?auto_750339 ) ) ( AVAILABLE ?auto_750339 ) ( SURFACE-AT ?auto_750333 ?auto_750337 ) ( ON ?auto_750333 ?auto_750335 ) ( CLEAR ?auto_750333 ) ( not ( = ?auto_750331 ?auto_750335 ) ) ( not ( = ?auto_750333 ?auto_750335 ) ) ( not ( = ?auto_750332 ?auto_750335 ) ) ( TRUCK-AT ?auto_750336 ?auto_750338 ) ( SURFACE-AT ?auto_750332 ?auto_750338 ) ( CLEAR ?auto_750332 ) ( IS-CRATE ?auto_750331 ) ( AVAILABLE ?auto_750334 ) ( IN ?auto_750331 ?auto_750336 ) ( ON ?auto_750328 ?auto_750327 ) ( ON ?auto_750329 ?auto_750328 ) ( ON ?auto_750326 ?auto_750329 ) ( ON ?auto_750330 ?auto_750326 ) ( ON ?auto_750332 ?auto_750330 ) ( not ( = ?auto_750327 ?auto_750328 ) ) ( not ( = ?auto_750327 ?auto_750329 ) ) ( not ( = ?auto_750327 ?auto_750326 ) ) ( not ( = ?auto_750327 ?auto_750330 ) ) ( not ( = ?auto_750327 ?auto_750332 ) ) ( not ( = ?auto_750327 ?auto_750331 ) ) ( not ( = ?auto_750327 ?auto_750333 ) ) ( not ( = ?auto_750327 ?auto_750335 ) ) ( not ( = ?auto_750328 ?auto_750329 ) ) ( not ( = ?auto_750328 ?auto_750326 ) ) ( not ( = ?auto_750328 ?auto_750330 ) ) ( not ( = ?auto_750328 ?auto_750332 ) ) ( not ( = ?auto_750328 ?auto_750331 ) ) ( not ( = ?auto_750328 ?auto_750333 ) ) ( not ( = ?auto_750328 ?auto_750335 ) ) ( not ( = ?auto_750329 ?auto_750326 ) ) ( not ( = ?auto_750329 ?auto_750330 ) ) ( not ( = ?auto_750329 ?auto_750332 ) ) ( not ( = ?auto_750329 ?auto_750331 ) ) ( not ( = ?auto_750329 ?auto_750333 ) ) ( not ( = ?auto_750329 ?auto_750335 ) ) ( not ( = ?auto_750326 ?auto_750330 ) ) ( not ( = ?auto_750326 ?auto_750332 ) ) ( not ( = ?auto_750326 ?auto_750331 ) ) ( not ( = ?auto_750326 ?auto_750333 ) ) ( not ( = ?auto_750326 ?auto_750335 ) ) ( not ( = ?auto_750330 ?auto_750332 ) ) ( not ( = ?auto_750330 ?auto_750331 ) ) ( not ( = ?auto_750330 ?auto_750333 ) ) ( not ( = ?auto_750330 ?auto_750335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750332 ?auto_750331 ?auto_750333 )
      ( MAKE-7CRATE-VERIFY ?auto_750327 ?auto_750328 ?auto_750329 ?auto_750326 ?auto_750330 ?auto_750332 ?auto_750331 ?auto_750333 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753232 - SURFACE
      ?auto_753233 - SURFACE
      ?auto_753234 - SURFACE
      ?auto_753231 - SURFACE
      ?auto_753235 - SURFACE
      ?auto_753237 - SURFACE
      ?auto_753236 - SURFACE
      ?auto_753238 - SURFACE
      ?auto_753239 - SURFACE
    )
    :vars
    (
      ?auto_753240 - HOIST
      ?auto_753241 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753240 ?auto_753241 ) ( SURFACE-AT ?auto_753238 ?auto_753241 ) ( CLEAR ?auto_753238 ) ( LIFTING ?auto_753240 ?auto_753239 ) ( IS-CRATE ?auto_753239 ) ( not ( = ?auto_753238 ?auto_753239 ) ) ( ON ?auto_753233 ?auto_753232 ) ( ON ?auto_753234 ?auto_753233 ) ( ON ?auto_753231 ?auto_753234 ) ( ON ?auto_753235 ?auto_753231 ) ( ON ?auto_753237 ?auto_753235 ) ( ON ?auto_753236 ?auto_753237 ) ( ON ?auto_753238 ?auto_753236 ) ( not ( = ?auto_753232 ?auto_753233 ) ) ( not ( = ?auto_753232 ?auto_753234 ) ) ( not ( = ?auto_753232 ?auto_753231 ) ) ( not ( = ?auto_753232 ?auto_753235 ) ) ( not ( = ?auto_753232 ?auto_753237 ) ) ( not ( = ?auto_753232 ?auto_753236 ) ) ( not ( = ?auto_753232 ?auto_753238 ) ) ( not ( = ?auto_753232 ?auto_753239 ) ) ( not ( = ?auto_753233 ?auto_753234 ) ) ( not ( = ?auto_753233 ?auto_753231 ) ) ( not ( = ?auto_753233 ?auto_753235 ) ) ( not ( = ?auto_753233 ?auto_753237 ) ) ( not ( = ?auto_753233 ?auto_753236 ) ) ( not ( = ?auto_753233 ?auto_753238 ) ) ( not ( = ?auto_753233 ?auto_753239 ) ) ( not ( = ?auto_753234 ?auto_753231 ) ) ( not ( = ?auto_753234 ?auto_753235 ) ) ( not ( = ?auto_753234 ?auto_753237 ) ) ( not ( = ?auto_753234 ?auto_753236 ) ) ( not ( = ?auto_753234 ?auto_753238 ) ) ( not ( = ?auto_753234 ?auto_753239 ) ) ( not ( = ?auto_753231 ?auto_753235 ) ) ( not ( = ?auto_753231 ?auto_753237 ) ) ( not ( = ?auto_753231 ?auto_753236 ) ) ( not ( = ?auto_753231 ?auto_753238 ) ) ( not ( = ?auto_753231 ?auto_753239 ) ) ( not ( = ?auto_753235 ?auto_753237 ) ) ( not ( = ?auto_753235 ?auto_753236 ) ) ( not ( = ?auto_753235 ?auto_753238 ) ) ( not ( = ?auto_753235 ?auto_753239 ) ) ( not ( = ?auto_753237 ?auto_753236 ) ) ( not ( = ?auto_753237 ?auto_753238 ) ) ( not ( = ?auto_753237 ?auto_753239 ) ) ( not ( = ?auto_753236 ?auto_753238 ) ) ( not ( = ?auto_753236 ?auto_753239 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_753238 ?auto_753239 )
      ( MAKE-8CRATE-VERIFY ?auto_753232 ?auto_753233 ?auto_753234 ?auto_753231 ?auto_753235 ?auto_753237 ?auto_753236 ?auto_753238 ?auto_753239 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753299 - SURFACE
      ?auto_753300 - SURFACE
      ?auto_753301 - SURFACE
      ?auto_753298 - SURFACE
      ?auto_753302 - SURFACE
      ?auto_753304 - SURFACE
      ?auto_753303 - SURFACE
      ?auto_753305 - SURFACE
      ?auto_753306 - SURFACE
    )
    :vars
    (
      ?auto_753307 - HOIST
      ?auto_753309 - PLACE
      ?auto_753308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753307 ?auto_753309 ) ( SURFACE-AT ?auto_753305 ?auto_753309 ) ( CLEAR ?auto_753305 ) ( IS-CRATE ?auto_753306 ) ( not ( = ?auto_753305 ?auto_753306 ) ) ( TRUCK-AT ?auto_753308 ?auto_753309 ) ( AVAILABLE ?auto_753307 ) ( IN ?auto_753306 ?auto_753308 ) ( ON ?auto_753305 ?auto_753303 ) ( not ( = ?auto_753303 ?auto_753305 ) ) ( not ( = ?auto_753303 ?auto_753306 ) ) ( ON ?auto_753300 ?auto_753299 ) ( ON ?auto_753301 ?auto_753300 ) ( ON ?auto_753298 ?auto_753301 ) ( ON ?auto_753302 ?auto_753298 ) ( ON ?auto_753304 ?auto_753302 ) ( ON ?auto_753303 ?auto_753304 ) ( not ( = ?auto_753299 ?auto_753300 ) ) ( not ( = ?auto_753299 ?auto_753301 ) ) ( not ( = ?auto_753299 ?auto_753298 ) ) ( not ( = ?auto_753299 ?auto_753302 ) ) ( not ( = ?auto_753299 ?auto_753304 ) ) ( not ( = ?auto_753299 ?auto_753303 ) ) ( not ( = ?auto_753299 ?auto_753305 ) ) ( not ( = ?auto_753299 ?auto_753306 ) ) ( not ( = ?auto_753300 ?auto_753301 ) ) ( not ( = ?auto_753300 ?auto_753298 ) ) ( not ( = ?auto_753300 ?auto_753302 ) ) ( not ( = ?auto_753300 ?auto_753304 ) ) ( not ( = ?auto_753300 ?auto_753303 ) ) ( not ( = ?auto_753300 ?auto_753305 ) ) ( not ( = ?auto_753300 ?auto_753306 ) ) ( not ( = ?auto_753301 ?auto_753298 ) ) ( not ( = ?auto_753301 ?auto_753302 ) ) ( not ( = ?auto_753301 ?auto_753304 ) ) ( not ( = ?auto_753301 ?auto_753303 ) ) ( not ( = ?auto_753301 ?auto_753305 ) ) ( not ( = ?auto_753301 ?auto_753306 ) ) ( not ( = ?auto_753298 ?auto_753302 ) ) ( not ( = ?auto_753298 ?auto_753304 ) ) ( not ( = ?auto_753298 ?auto_753303 ) ) ( not ( = ?auto_753298 ?auto_753305 ) ) ( not ( = ?auto_753298 ?auto_753306 ) ) ( not ( = ?auto_753302 ?auto_753304 ) ) ( not ( = ?auto_753302 ?auto_753303 ) ) ( not ( = ?auto_753302 ?auto_753305 ) ) ( not ( = ?auto_753302 ?auto_753306 ) ) ( not ( = ?auto_753304 ?auto_753303 ) ) ( not ( = ?auto_753304 ?auto_753305 ) ) ( not ( = ?auto_753304 ?auto_753306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753303 ?auto_753305 ?auto_753306 )
      ( MAKE-8CRATE-VERIFY ?auto_753299 ?auto_753300 ?auto_753301 ?auto_753298 ?auto_753302 ?auto_753304 ?auto_753303 ?auto_753305 ?auto_753306 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753375 - SURFACE
      ?auto_753376 - SURFACE
      ?auto_753377 - SURFACE
      ?auto_753374 - SURFACE
      ?auto_753378 - SURFACE
      ?auto_753380 - SURFACE
      ?auto_753379 - SURFACE
      ?auto_753381 - SURFACE
      ?auto_753382 - SURFACE
    )
    :vars
    (
      ?auto_753384 - HOIST
      ?auto_753385 - PLACE
      ?auto_753386 - TRUCK
      ?auto_753383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753384 ?auto_753385 ) ( SURFACE-AT ?auto_753381 ?auto_753385 ) ( CLEAR ?auto_753381 ) ( IS-CRATE ?auto_753382 ) ( not ( = ?auto_753381 ?auto_753382 ) ) ( AVAILABLE ?auto_753384 ) ( IN ?auto_753382 ?auto_753386 ) ( ON ?auto_753381 ?auto_753379 ) ( not ( = ?auto_753379 ?auto_753381 ) ) ( not ( = ?auto_753379 ?auto_753382 ) ) ( TRUCK-AT ?auto_753386 ?auto_753383 ) ( not ( = ?auto_753383 ?auto_753385 ) ) ( ON ?auto_753376 ?auto_753375 ) ( ON ?auto_753377 ?auto_753376 ) ( ON ?auto_753374 ?auto_753377 ) ( ON ?auto_753378 ?auto_753374 ) ( ON ?auto_753380 ?auto_753378 ) ( ON ?auto_753379 ?auto_753380 ) ( not ( = ?auto_753375 ?auto_753376 ) ) ( not ( = ?auto_753375 ?auto_753377 ) ) ( not ( = ?auto_753375 ?auto_753374 ) ) ( not ( = ?auto_753375 ?auto_753378 ) ) ( not ( = ?auto_753375 ?auto_753380 ) ) ( not ( = ?auto_753375 ?auto_753379 ) ) ( not ( = ?auto_753375 ?auto_753381 ) ) ( not ( = ?auto_753375 ?auto_753382 ) ) ( not ( = ?auto_753376 ?auto_753377 ) ) ( not ( = ?auto_753376 ?auto_753374 ) ) ( not ( = ?auto_753376 ?auto_753378 ) ) ( not ( = ?auto_753376 ?auto_753380 ) ) ( not ( = ?auto_753376 ?auto_753379 ) ) ( not ( = ?auto_753376 ?auto_753381 ) ) ( not ( = ?auto_753376 ?auto_753382 ) ) ( not ( = ?auto_753377 ?auto_753374 ) ) ( not ( = ?auto_753377 ?auto_753378 ) ) ( not ( = ?auto_753377 ?auto_753380 ) ) ( not ( = ?auto_753377 ?auto_753379 ) ) ( not ( = ?auto_753377 ?auto_753381 ) ) ( not ( = ?auto_753377 ?auto_753382 ) ) ( not ( = ?auto_753374 ?auto_753378 ) ) ( not ( = ?auto_753374 ?auto_753380 ) ) ( not ( = ?auto_753374 ?auto_753379 ) ) ( not ( = ?auto_753374 ?auto_753381 ) ) ( not ( = ?auto_753374 ?auto_753382 ) ) ( not ( = ?auto_753378 ?auto_753380 ) ) ( not ( = ?auto_753378 ?auto_753379 ) ) ( not ( = ?auto_753378 ?auto_753381 ) ) ( not ( = ?auto_753378 ?auto_753382 ) ) ( not ( = ?auto_753380 ?auto_753379 ) ) ( not ( = ?auto_753380 ?auto_753381 ) ) ( not ( = ?auto_753380 ?auto_753382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753379 ?auto_753381 ?auto_753382 )
      ( MAKE-8CRATE-VERIFY ?auto_753375 ?auto_753376 ?auto_753377 ?auto_753374 ?auto_753378 ?auto_753380 ?auto_753379 ?auto_753381 ?auto_753382 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753459 - SURFACE
      ?auto_753460 - SURFACE
      ?auto_753461 - SURFACE
      ?auto_753458 - SURFACE
      ?auto_753462 - SURFACE
      ?auto_753464 - SURFACE
      ?auto_753463 - SURFACE
      ?auto_753465 - SURFACE
      ?auto_753466 - SURFACE
    )
    :vars
    (
      ?auto_753467 - HOIST
      ?auto_753470 - PLACE
      ?auto_753468 - TRUCK
      ?auto_753471 - PLACE
      ?auto_753469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_753467 ?auto_753470 ) ( SURFACE-AT ?auto_753465 ?auto_753470 ) ( CLEAR ?auto_753465 ) ( IS-CRATE ?auto_753466 ) ( not ( = ?auto_753465 ?auto_753466 ) ) ( AVAILABLE ?auto_753467 ) ( ON ?auto_753465 ?auto_753463 ) ( not ( = ?auto_753463 ?auto_753465 ) ) ( not ( = ?auto_753463 ?auto_753466 ) ) ( TRUCK-AT ?auto_753468 ?auto_753471 ) ( not ( = ?auto_753471 ?auto_753470 ) ) ( HOIST-AT ?auto_753469 ?auto_753471 ) ( LIFTING ?auto_753469 ?auto_753466 ) ( not ( = ?auto_753467 ?auto_753469 ) ) ( ON ?auto_753460 ?auto_753459 ) ( ON ?auto_753461 ?auto_753460 ) ( ON ?auto_753458 ?auto_753461 ) ( ON ?auto_753462 ?auto_753458 ) ( ON ?auto_753464 ?auto_753462 ) ( ON ?auto_753463 ?auto_753464 ) ( not ( = ?auto_753459 ?auto_753460 ) ) ( not ( = ?auto_753459 ?auto_753461 ) ) ( not ( = ?auto_753459 ?auto_753458 ) ) ( not ( = ?auto_753459 ?auto_753462 ) ) ( not ( = ?auto_753459 ?auto_753464 ) ) ( not ( = ?auto_753459 ?auto_753463 ) ) ( not ( = ?auto_753459 ?auto_753465 ) ) ( not ( = ?auto_753459 ?auto_753466 ) ) ( not ( = ?auto_753460 ?auto_753461 ) ) ( not ( = ?auto_753460 ?auto_753458 ) ) ( not ( = ?auto_753460 ?auto_753462 ) ) ( not ( = ?auto_753460 ?auto_753464 ) ) ( not ( = ?auto_753460 ?auto_753463 ) ) ( not ( = ?auto_753460 ?auto_753465 ) ) ( not ( = ?auto_753460 ?auto_753466 ) ) ( not ( = ?auto_753461 ?auto_753458 ) ) ( not ( = ?auto_753461 ?auto_753462 ) ) ( not ( = ?auto_753461 ?auto_753464 ) ) ( not ( = ?auto_753461 ?auto_753463 ) ) ( not ( = ?auto_753461 ?auto_753465 ) ) ( not ( = ?auto_753461 ?auto_753466 ) ) ( not ( = ?auto_753458 ?auto_753462 ) ) ( not ( = ?auto_753458 ?auto_753464 ) ) ( not ( = ?auto_753458 ?auto_753463 ) ) ( not ( = ?auto_753458 ?auto_753465 ) ) ( not ( = ?auto_753458 ?auto_753466 ) ) ( not ( = ?auto_753462 ?auto_753464 ) ) ( not ( = ?auto_753462 ?auto_753463 ) ) ( not ( = ?auto_753462 ?auto_753465 ) ) ( not ( = ?auto_753462 ?auto_753466 ) ) ( not ( = ?auto_753464 ?auto_753463 ) ) ( not ( = ?auto_753464 ?auto_753465 ) ) ( not ( = ?auto_753464 ?auto_753466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753463 ?auto_753465 ?auto_753466 )
      ( MAKE-8CRATE-VERIFY ?auto_753459 ?auto_753460 ?auto_753461 ?auto_753458 ?auto_753462 ?auto_753464 ?auto_753463 ?auto_753465 ?auto_753466 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753551 - SURFACE
      ?auto_753552 - SURFACE
      ?auto_753553 - SURFACE
      ?auto_753550 - SURFACE
      ?auto_753554 - SURFACE
      ?auto_753556 - SURFACE
      ?auto_753555 - SURFACE
      ?auto_753557 - SURFACE
      ?auto_753558 - SURFACE
    )
    :vars
    (
      ?auto_753560 - HOIST
      ?auto_753563 - PLACE
      ?auto_753561 - TRUCK
      ?auto_753562 - PLACE
      ?auto_753559 - HOIST
      ?auto_753564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753560 ?auto_753563 ) ( SURFACE-AT ?auto_753557 ?auto_753563 ) ( CLEAR ?auto_753557 ) ( IS-CRATE ?auto_753558 ) ( not ( = ?auto_753557 ?auto_753558 ) ) ( AVAILABLE ?auto_753560 ) ( ON ?auto_753557 ?auto_753555 ) ( not ( = ?auto_753555 ?auto_753557 ) ) ( not ( = ?auto_753555 ?auto_753558 ) ) ( TRUCK-AT ?auto_753561 ?auto_753562 ) ( not ( = ?auto_753562 ?auto_753563 ) ) ( HOIST-AT ?auto_753559 ?auto_753562 ) ( not ( = ?auto_753560 ?auto_753559 ) ) ( AVAILABLE ?auto_753559 ) ( SURFACE-AT ?auto_753558 ?auto_753562 ) ( ON ?auto_753558 ?auto_753564 ) ( CLEAR ?auto_753558 ) ( not ( = ?auto_753557 ?auto_753564 ) ) ( not ( = ?auto_753558 ?auto_753564 ) ) ( not ( = ?auto_753555 ?auto_753564 ) ) ( ON ?auto_753552 ?auto_753551 ) ( ON ?auto_753553 ?auto_753552 ) ( ON ?auto_753550 ?auto_753553 ) ( ON ?auto_753554 ?auto_753550 ) ( ON ?auto_753556 ?auto_753554 ) ( ON ?auto_753555 ?auto_753556 ) ( not ( = ?auto_753551 ?auto_753552 ) ) ( not ( = ?auto_753551 ?auto_753553 ) ) ( not ( = ?auto_753551 ?auto_753550 ) ) ( not ( = ?auto_753551 ?auto_753554 ) ) ( not ( = ?auto_753551 ?auto_753556 ) ) ( not ( = ?auto_753551 ?auto_753555 ) ) ( not ( = ?auto_753551 ?auto_753557 ) ) ( not ( = ?auto_753551 ?auto_753558 ) ) ( not ( = ?auto_753551 ?auto_753564 ) ) ( not ( = ?auto_753552 ?auto_753553 ) ) ( not ( = ?auto_753552 ?auto_753550 ) ) ( not ( = ?auto_753552 ?auto_753554 ) ) ( not ( = ?auto_753552 ?auto_753556 ) ) ( not ( = ?auto_753552 ?auto_753555 ) ) ( not ( = ?auto_753552 ?auto_753557 ) ) ( not ( = ?auto_753552 ?auto_753558 ) ) ( not ( = ?auto_753552 ?auto_753564 ) ) ( not ( = ?auto_753553 ?auto_753550 ) ) ( not ( = ?auto_753553 ?auto_753554 ) ) ( not ( = ?auto_753553 ?auto_753556 ) ) ( not ( = ?auto_753553 ?auto_753555 ) ) ( not ( = ?auto_753553 ?auto_753557 ) ) ( not ( = ?auto_753553 ?auto_753558 ) ) ( not ( = ?auto_753553 ?auto_753564 ) ) ( not ( = ?auto_753550 ?auto_753554 ) ) ( not ( = ?auto_753550 ?auto_753556 ) ) ( not ( = ?auto_753550 ?auto_753555 ) ) ( not ( = ?auto_753550 ?auto_753557 ) ) ( not ( = ?auto_753550 ?auto_753558 ) ) ( not ( = ?auto_753550 ?auto_753564 ) ) ( not ( = ?auto_753554 ?auto_753556 ) ) ( not ( = ?auto_753554 ?auto_753555 ) ) ( not ( = ?auto_753554 ?auto_753557 ) ) ( not ( = ?auto_753554 ?auto_753558 ) ) ( not ( = ?auto_753554 ?auto_753564 ) ) ( not ( = ?auto_753556 ?auto_753555 ) ) ( not ( = ?auto_753556 ?auto_753557 ) ) ( not ( = ?auto_753556 ?auto_753558 ) ) ( not ( = ?auto_753556 ?auto_753564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753555 ?auto_753557 ?auto_753558 )
      ( MAKE-8CRATE-VERIFY ?auto_753551 ?auto_753552 ?auto_753553 ?auto_753550 ?auto_753554 ?auto_753556 ?auto_753555 ?auto_753557 ?auto_753558 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753644 - SURFACE
      ?auto_753645 - SURFACE
      ?auto_753646 - SURFACE
      ?auto_753643 - SURFACE
      ?auto_753647 - SURFACE
      ?auto_753649 - SURFACE
      ?auto_753648 - SURFACE
      ?auto_753650 - SURFACE
      ?auto_753651 - SURFACE
    )
    :vars
    (
      ?auto_753653 - HOIST
      ?auto_753655 - PLACE
      ?auto_753657 - PLACE
      ?auto_753652 - HOIST
      ?auto_753656 - SURFACE
      ?auto_753654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753653 ?auto_753655 ) ( SURFACE-AT ?auto_753650 ?auto_753655 ) ( CLEAR ?auto_753650 ) ( IS-CRATE ?auto_753651 ) ( not ( = ?auto_753650 ?auto_753651 ) ) ( AVAILABLE ?auto_753653 ) ( ON ?auto_753650 ?auto_753648 ) ( not ( = ?auto_753648 ?auto_753650 ) ) ( not ( = ?auto_753648 ?auto_753651 ) ) ( not ( = ?auto_753657 ?auto_753655 ) ) ( HOIST-AT ?auto_753652 ?auto_753657 ) ( not ( = ?auto_753653 ?auto_753652 ) ) ( AVAILABLE ?auto_753652 ) ( SURFACE-AT ?auto_753651 ?auto_753657 ) ( ON ?auto_753651 ?auto_753656 ) ( CLEAR ?auto_753651 ) ( not ( = ?auto_753650 ?auto_753656 ) ) ( not ( = ?auto_753651 ?auto_753656 ) ) ( not ( = ?auto_753648 ?auto_753656 ) ) ( TRUCK-AT ?auto_753654 ?auto_753655 ) ( ON ?auto_753645 ?auto_753644 ) ( ON ?auto_753646 ?auto_753645 ) ( ON ?auto_753643 ?auto_753646 ) ( ON ?auto_753647 ?auto_753643 ) ( ON ?auto_753649 ?auto_753647 ) ( ON ?auto_753648 ?auto_753649 ) ( not ( = ?auto_753644 ?auto_753645 ) ) ( not ( = ?auto_753644 ?auto_753646 ) ) ( not ( = ?auto_753644 ?auto_753643 ) ) ( not ( = ?auto_753644 ?auto_753647 ) ) ( not ( = ?auto_753644 ?auto_753649 ) ) ( not ( = ?auto_753644 ?auto_753648 ) ) ( not ( = ?auto_753644 ?auto_753650 ) ) ( not ( = ?auto_753644 ?auto_753651 ) ) ( not ( = ?auto_753644 ?auto_753656 ) ) ( not ( = ?auto_753645 ?auto_753646 ) ) ( not ( = ?auto_753645 ?auto_753643 ) ) ( not ( = ?auto_753645 ?auto_753647 ) ) ( not ( = ?auto_753645 ?auto_753649 ) ) ( not ( = ?auto_753645 ?auto_753648 ) ) ( not ( = ?auto_753645 ?auto_753650 ) ) ( not ( = ?auto_753645 ?auto_753651 ) ) ( not ( = ?auto_753645 ?auto_753656 ) ) ( not ( = ?auto_753646 ?auto_753643 ) ) ( not ( = ?auto_753646 ?auto_753647 ) ) ( not ( = ?auto_753646 ?auto_753649 ) ) ( not ( = ?auto_753646 ?auto_753648 ) ) ( not ( = ?auto_753646 ?auto_753650 ) ) ( not ( = ?auto_753646 ?auto_753651 ) ) ( not ( = ?auto_753646 ?auto_753656 ) ) ( not ( = ?auto_753643 ?auto_753647 ) ) ( not ( = ?auto_753643 ?auto_753649 ) ) ( not ( = ?auto_753643 ?auto_753648 ) ) ( not ( = ?auto_753643 ?auto_753650 ) ) ( not ( = ?auto_753643 ?auto_753651 ) ) ( not ( = ?auto_753643 ?auto_753656 ) ) ( not ( = ?auto_753647 ?auto_753649 ) ) ( not ( = ?auto_753647 ?auto_753648 ) ) ( not ( = ?auto_753647 ?auto_753650 ) ) ( not ( = ?auto_753647 ?auto_753651 ) ) ( not ( = ?auto_753647 ?auto_753656 ) ) ( not ( = ?auto_753649 ?auto_753648 ) ) ( not ( = ?auto_753649 ?auto_753650 ) ) ( not ( = ?auto_753649 ?auto_753651 ) ) ( not ( = ?auto_753649 ?auto_753656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753648 ?auto_753650 ?auto_753651 )
      ( MAKE-8CRATE-VERIFY ?auto_753644 ?auto_753645 ?auto_753646 ?auto_753643 ?auto_753647 ?auto_753649 ?auto_753648 ?auto_753650 ?auto_753651 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753737 - SURFACE
      ?auto_753738 - SURFACE
      ?auto_753739 - SURFACE
      ?auto_753736 - SURFACE
      ?auto_753740 - SURFACE
      ?auto_753742 - SURFACE
      ?auto_753741 - SURFACE
      ?auto_753743 - SURFACE
      ?auto_753744 - SURFACE
    )
    :vars
    (
      ?auto_753747 - HOIST
      ?auto_753749 - PLACE
      ?auto_753748 - PLACE
      ?auto_753750 - HOIST
      ?auto_753745 - SURFACE
      ?auto_753746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753747 ?auto_753749 ) ( IS-CRATE ?auto_753744 ) ( not ( = ?auto_753743 ?auto_753744 ) ) ( not ( = ?auto_753741 ?auto_753743 ) ) ( not ( = ?auto_753741 ?auto_753744 ) ) ( not ( = ?auto_753748 ?auto_753749 ) ) ( HOIST-AT ?auto_753750 ?auto_753748 ) ( not ( = ?auto_753747 ?auto_753750 ) ) ( AVAILABLE ?auto_753750 ) ( SURFACE-AT ?auto_753744 ?auto_753748 ) ( ON ?auto_753744 ?auto_753745 ) ( CLEAR ?auto_753744 ) ( not ( = ?auto_753743 ?auto_753745 ) ) ( not ( = ?auto_753744 ?auto_753745 ) ) ( not ( = ?auto_753741 ?auto_753745 ) ) ( TRUCK-AT ?auto_753746 ?auto_753749 ) ( SURFACE-AT ?auto_753741 ?auto_753749 ) ( CLEAR ?auto_753741 ) ( LIFTING ?auto_753747 ?auto_753743 ) ( IS-CRATE ?auto_753743 ) ( ON ?auto_753738 ?auto_753737 ) ( ON ?auto_753739 ?auto_753738 ) ( ON ?auto_753736 ?auto_753739 ) ( ON ?auto_753740 ?auto_753736 ) ( ON ?auto_753742 ?auto_753740 ) ( ON ?auto_753741 ?auto_753742 ) ( not ( = ?auto_753737 ?auto_753738 ) ) ( not ( = ?auto_753737 ?auto_753739 ) ) ( not ( = ?auto_753737 ?auto_753736 ) ) ( not ( = ?auto_753737 ?auto_753740 ) ) ( not ( = ?auto_753737 ?auto_753742 ) ) ( not ( = ?auto_753737 ?auto_753741 ) ) ( not ( = ?auto_753737 ?auto_753743 ) ) ( not ( = ?auto_753737 ?auto_753744 ) ) ( not ( = ?auto_753737 ?auto_753745 ) ) ( not ( = ?auto_753738 ?auto_753739 ) ) ( not ( = ?auto_753738 ?auto_753736 ) ) ( not ( = ?auto_753738 ?auto_753740 ) ) ( not ( = ?auto_753738 ?auto_753742 ) ) ( not ( = ?auto_753738 ?auto_753741 ) ) ( not ( = ?auto_753738 ?auto_753743 ) ) ( not ( = ?auto_753738 ?auto_753744 ) ) ( not ( = ?auto_753738 ?auto_753745 ) ) ( not ( = ?auto_753739 ?auto_753736 ) ) ( not ( = ?auto_753739 ?auto_753740 ) ) ( not ( = ?auto_753739 ?auto_753742 ) ) ( not ( = ?auto_753739 ?auto_753741 ) ) ( not ( = ?auto_753739 ?auto_753743 ) ) ( not ( = ?auto_753739 ?auto_753744 ) ) ( not ( = ?auto_753739 ?auto_753745 ) ) ( not ( = ?auto_753736 ?auto_753740 ) ) ( not ( = ?auto_753736 ?auto_753742 ) ) ( not ( = ?auto_753736 ?auto_753741 ) ) ( not ( = ?auto_753736 ?auto_753743 ) ) ( not ( = ?auto_753736 ?auto_753744 ) ) ( not ( = ?auto_753736 ?auto_753745 ) ) ( not ( = ?auto_753740 ?auto_753742 ) ) ( not ( = ?auto_753740 ?auto_753741 ) ) ( not ( = ?auto_753740 ?auto_753743 ) ) ( not ( = ?auto_753740 ?auto_753744 ) ) ( not ( = ?auto_753740 ?auto_753745 ) ) ( not ( = ?auto_753742 ?auto_753741 ) ) ( not ( = ?auto_753742 ?auto_753743 ) ) ( not ( = ?auto_753742 ?auto_753744 ) ) ( not ( = ?auto_753742 ?auto_753745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753741 ?auto_753743 ?auto_753744 )
      ( MAKE-8CRATE-VERIFY ?auto_753737 ?auto_753738 ?auto_753739 ?auto_753736 ?auto_753740 ?auto_753742 ?auto_753741 ?auto_753743 ?auto_753744 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753830 - SURFACE
      ?auto_753831 - SURFACE
      ?auto_753832 - SURFACE
      ?auto_753829 - SURFACE
      ?auto_753833 - SURFACE
      ?auto_753835 - SURFACE
      ?auto_753834 - SURFACE
      ?auto_753836 - SURFACE
      ?auto_753837 - SURFACE
    )
    :vars
    (
      ?auto_753842 - HOIST
      ?auto_753838 - PLACE
      ?auto_753841 - PLACE
      ?auto_753840 - HOIST
      ?auto_753843 - SURFACE
      ?auto_753839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753842 ?auto_753838 ) ( IS-CRATE ?auto_753837 ) ( not ( = ?auto_753836 ?auto_753837 ) ) ( not ( = ?auto_753834 ?auto_753836 ) ) ( not ( = ?auto_753834 ?auto_753837 ) ) ( not ( = ?auto_753841 ?auto_753838 ) ) ( HOIST-AT ?auto_753840 ?auto_753841 ) ( not ( = ?auto_753842 ?auto_753840 ) ) ( AVAILABLE ?auto_753840 ) ( SURFACE-AT ?auto_753837 ?auto_753841 ) ( ON ?auto_753837 ?auto_753843 ) ( CLEAR ?auto_753837 ) ( not ( = ?auto_753836 ?auto_753843 ) ) ( not ( = ?auto_753837 ?auto_753843 ) ) ( not ( = ?auto_753834 ?auto_753843 ) ) ( TRUCK-AT ?auto_753839 ?auto_753838 ) ( SURFACE-AT ?auto_753834 ?auto_753838 ) ( CLEAR ?auto_753834 ) ( IS-CRATE ?auto_753836 ) ( AVAILABLE ?auto_753842 ) ( IN ?auto_753836 ?auto_753839 ) ( ON ?auto_753831 ?auto_753830 ) ( ON ?auto_753832 ?auto_753831 ) ( ON ?auto_753829 ?auto_753832 ) ( ON ?auto_753833 ?auto_753829 ) ( ON ?auto_753835 ?auto_753833 ) ( ON ?auto_753834 ?auto_753835 ) ( not ( = ?auto_753830 ?auto_753831 ) ) ( not ( = ?auto_753830 ?auto_753832 ) ) ( not ( = ?auto_753830 ?auto_753829 ) ) ( not ( = ?auto_753830 ?auto_753833 ) ) ( not ( = ?auto_753830 ?auto_753835 ) ) ( not ( = ?auto_753830 ?auto_753834 ) ) ( not ( = ?auto_753830 ?auto_753836 ) ) ( not ( = ?auto_753830 ?auto_753837 ) ) ( not ( = ?auto_753830 ?auto_753843 ) ) ( not ( = ?auto_753831 ?auto_753832 ) ) ( not ( = ?auto_753831 ?auto_753829 ) ) ( not ( = ?auto_753831 ?auto_753833 ) ) ( not ( = ?auto_753831 ?auto_753835 ) ) ( not ( = ?auto_753831 ?auto_753834 ) ) ( not ( = ?auto_753831 ?auto_753836 ) ) ( not ( = ?auto_753831 ?auto_753837 ) ) ( not ( = ?auto_753831 ?auto_753843 ) ) ( not ( = ?auto_753832 ?auto_753829 ) ) ( not ( = ?auto_753832 ?auto_753833 ) ) ( not ( = ?auto_753832 ?auto_753835 ) ) ( not ( = ?auto_753832 ?auto_753834 ) ) ( not ( = ?auto_753832 ?auto_753836 ) ) ( not ( = ?auto_753832 ?auto_753837 ) ) ( not ( = ?auto_753832 ?auto_753843 ) ) ( not ( = ?auto_753829 ?auto_753833 ) ) ( not ( = ?auto_753829 ?auto_753835 ) ) ( not ( = ?auto_753829 ?auto_753834 ) ) ( not ( = ?auto_753829 ?auto_753836 ) ) ( not ( = ?auto_753829 ?auto_753837 ) ) ( not ( = ?auto_753829 ?auto_753843 ) ) ( not ( = ?auto_753833 ?auto_753835 ) ) ( not ( = ?auto_753833 ?auto_753834 ) ) ( not ( = ?auto_753833 ?auto_753836 ) ) ( not ( = ?auto_753833 ?auto_753837 ) ) ( not ( = ?auto_753833 ?auto_753843 ) ) ( not ( = ?auto_753835 ?auto_753834 ) ) ( not ( = ?auto_753835 ?auto_753836 ) ) ( not ( = ?auto_753835 ?auto_753837 ) ) ( not ( = ?auto_753835 ?auto_753843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753834 ?auto_753836 ?auto_753837 )
      ( MAKE-8CRATE-VERIFY ?auto_753830 ?auto_753831 ?auto_753832 ?auto_753829 ?auto_753833 ?auto_753835 ?auto_753834 ?auto_753836 ?auto_753837 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757930 - SURFACE
      ?auto_757931 - SURFACE
      ?auto_757932 - SURFACE
      ?auto_757929 - SURFACE
      ?auto_757933 - SURFACE
      ?auto_757935 - SURFACE
      ?auto_757934 - SURFACE
      ?auto_757936 - SURFACE
      ?auto_757937 - SURFACE
      ?auto_757938 - SURFACE
    )
    :vars
    (
      ?auto_757940 - HOIST
      ?auto_757939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_757940 ?auto_757939 ) ( SURFACE-AT ?auto_757937 ?auto_757939 ) ( CLEAR ?auto_757937 ) ( LIFTING ?auto_757940 ?auto_757938 ) ( IS-CRATE ?auto_757938 ) ( not ( = ?auto_757937 ?auto_757938 ) ) ( ON ?auto_757931 ?auto_757930 ) ( ON ?auto_757932 ?auto_757931 ) ( ON ?auto_757929 ?auto_757932 ) ( ON ?auto_757933 ?auto_757929 ) ( ON ?auto_757935 ?auto_757933 ) ( ON ?auto_757934 ?auto_757935 ) ( ON ?auto_757936 ?auto_757934 ) ( ON ?auto_757937 ?auto_757936 ) ( not ( = ?auto_757930 ?auto_757931 ) ) ( not ( = ?auto_757930 ?auto_757932 ) ) ( not ( = ?auto_757930 ?auto_757929 ) ) ( not ( = ?auto_757930 ?auto_757933 ) ) ( not ( = ?auto_757930 ?auto_757935 ) ) ( not ( = ?auto_757930 ?auto_757934 ) ) ( not ( = ?auto_757930 ?auto_757936 ) ) ( not ( = ?auto_757930 ?auto_757937 ) ) ( not ( = ?auto_757930 ?auto_757938 ) ) ( not ( = ?auto_757931 ?auto_757932 ) ) ( not ( = ?auto_757931 ?auto_757929 ) ) ( not ( = ?auto_757931 ?auto_757933 ) ) ( not ( = ?auto_757931 ?auto_757935 ) ) ( not ( = ?auto_757931 ?auto_757934 ) ) ( not ( = ?auto_757931 ?auto_757936 ) ) ( not ( = ?auto_757931 ?auto_757937 ) ) ( not ( = ?auto_757931 ?auto_757938 ) ) ( not ( = ?auto_757932 ?auto_757929 ) ) ( not ( = ?auto_757932 ?auto_757933 ) ) ( not ( = ?auto_757932 ?auto_757935 ) ) ( not ( = ?auto_757932 ?auto_757934 ) ) ( not ( = ?auto_757932 ?auto_757936 ) ) ( not ( = ?auto_757932 ?auto_757937 ) ) ( not ( = ?auto_757932 ?auto_757938 ) ) ( not ( = ?auto_757929 ?auto_757933 ) ) ( not ( = ?auto_757929 ?auto_757935 ) ) ( not ( = ?auto_757929 ?auto_757934 ) ) ( not ( = ?auto_757929 ?auto_757936 ) ) ( not ( = ?auto_757929 ?auto_757937 ) ) ( not ( = ?auto_757929 ?auto_757938 ) ) ( not ( = ?auto_757933 ?auto_757935 ) ) ( not ( = ?auto_757933 ?auto_757934 ) ) ( not ( = ?auto_757933 ?auto_757936 ) ) ( not ( = ?auto_757933 ?auto_757937 ) ) ( not ( = ?auto_757933 ?auto_757938 ) ) ( not ( = ?auto_757935 ?auto_757934 ) ) ( not ( = ?auto_757935 ?auto_757936 ) ) ( not ( = ?auto_757935 ?auto_757937 ) ) ( not ( = ?auto_757935 ?auto_757938 ) ) ( not ( = ?auto_757934 ?auto_757936 ) ) ( not ( = ?auto_757934 ?auto_757937 ) ) ( not ( = ?auto_757934 ?auto_757938 ) ) ( not ( = ?auto_757936 ?auto_757937 ) ) ( not ( = ?auto_757936 ?auto_757938 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_757937 ?auto_757938 )
      ( MAKE-9CRATE-VERIFY ?auto_757930 ?auto_757931 ?auto_757932 ?auto_757929 ?auto_757933 ?auto_757935 ?auto_757934 ?auto_757936 ?auto_757937 ?auto_757938 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758010 - SURFACE
      ?auto_758011 - SURFACE
      ?auto_758012 - SURFACE
      ?auto_758009 - SURFACE
      ?auto_758013 - SURFACE
      ?auto_758015 - SURFACE
      ?auto_758014 - SURFACE
      ?auto_758016 - SURFACE
      ?auto_758017 - SURFACE
      ?auto_758018 - SURFACE
    )
    :vars
    (
      ?auto_758019 - HOIST
      ?auto_758021 - PLACE
      ?auto_758020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758019 ?auto_758021 ) ( SURFACE-AT ?auto_758017 ?auto_758021 ) ( CLEAR ?auto_758017 ) ( IS-CRATE ?auto_758018 ) ( not ( = ?auto_758017 ?auto_758018 ) ) ( TRUCK-AT ?auto_758020 ?auto_758021 ) ( AVAILABLE ?auto_758019 ) ( IN ?auto_758018 ?auto_758020 ) ( ON ?auto_758017 ?auto_758016 ) ( not ( = ?auto_758016 ?auto_758017 ) ) ( not ( = ?auto_758016 ?auto_758018 ) ) ( ON ?auto_758011 ?auto_758010 ) ( ON ?auto_758012 ?auto_758011 ) ( ON ?auto_758009 ?auto_758012 ) ( ON ?auto_758013 ?auto_758009 ) ( ON ?auto_758015 ?auto_758013 ) ( ON ?auto_758014 ?auto_758015 ) ( ON ?auto_758016 ?auto_758014 ) ( not ( = ?auto_758010 ?auto_758011 ) ) ( not ( = ?auto_758010 ?auto_758012 ) ) ( not ( = ?auto_758010 ?auto_758009 ) ) ( not ( = ?auto_758010 ?auto_758013 ) ) ( not ( = ?auto_758010 ?auto_758015 ) ) ( not ( = ?auto_758010 ?auto_758014 ) ) ( not ( = ?auto_758010 ?auto_758016 ) ) ( not ( = ?auto_758010 ?auto_758017 ) ) ( not ( = ?auto_758010 ?auto_758018 ) ) ( not ( = ?auto_758011 ?auto_758012 ) ) ( not ( = ?auto_758011 ?auto_758009 ) ) ( not ( = ?auto_758011 ?auto_758013 ) ) ( not ( = ?auto_758011 ?auto_758015 ) ) ( not ( = ?auto_758011 ?auto_758014 ) ) ( not ( = ?auto_758011 ?auto_758016 ) ) ( not ( = ?auto_758011 ?auto_758017 ) ) ( not ( = ?auto_758011 ?auto_758018 ) ) ( not ( = ?auto_758012 ?auto_758009 ) ) ( not ( = ?auto_758012 ?auto_758013 ) ) ( not ( = ?auto_758012 ?auto_758015 ) ) ( not ( = ?auto_758012 ?auto_758014 ) ) ( not ( = ?auto_758012 ?auto_758016 ) ) ( not ( = ?auto_758012 ?auto_758017 ) ) ( not ( = ?auto_758012 ?auto_758018 ) ) ( not ( = ?auto_758009 ?auto_758013 ) ) ( not ( = ?auto_758009 ?auto_758015 ) ) ( not ( = ?auto_758009 ?auto_758014 ) ) ( not ( = ?auto_758009 ?auto_758016 ) ) ( not ( = ?auto_758009 ?auto_758017 ) ) ( not ( = ?auto_758009 ?auto_758018 ) ) ( not ( = ?auto_758013 ?auto_758015 ) ) ( not ( = ?auto_758013 ?auto_758014 ) ) ( not ( = ?auto_758013 ?auto_758016 ) ) ( not ( = ?auto_758013 ?auto_758017 ) ) ( not ( = ?auto_758013 ?auto_758018 ) ) ( not ( = ?auto_758015 ?auto_758014 ) ) ( not ( = ?auto_758015 ?auto_758016 ) ) ( not ( = ?auto_758015 ?auto_758017 ) ) ( not ( = ?auto_758015 ?auto_758018 ) ) ( not ( = ?auto_758014 ?auto_758016 ) ) ( not ( = ?auto_758014 ?auto_758017 ) ) ( not ( = ?auto_758014 ?auto_758018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758016 ?auto_758017 ?auto_758018 )
      ( MAKE-9CRATE-VERIFY ?auto_758010 ?auto_758011 ?auto_758012 ?auto_758009 ?auto_758013 ?auto_758015 ?auto_758014 ?auto_758016 ?auto_758017 ?auto_758018 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758100 - SURFACE
      ?auto_758101 - SURFACE
      ?auto_758102 - SURFACE
      ?auto_758099 - SURFACE
      ?auto_758103 - SURFACE
      ?auto_758105 - SURFACE
      ?auto_758104 - SURFACE
      ?auto_758106 - SURFACE
      ?auto_758107 - SURFACE
      ?auto_758108 - SURFACE
    )
    :vars
    (
      ?auto_758109 - HOIST
      ?auto_758111 - PLACE
      ?auto_758112 - TRUCK
      ?auto_758110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758109 ?auto_758111 ) ( SURFACE-AT ?auto_758107 ?auto_758111 ) ( CLEAR ?auto_758107 ) ( IS-CRATE ?auto_758108 ) ( not ( = ?auto_758107 ?auto_758108 ) ) ( AVAILABLE ?auto_758109 ) ( IN ?auto_758108 ?auto_758112 ) ( ON ?auto_758107 ?auto_758106 ) ( not ( = ?auto_758106 ?auto_758107 ) ) ( not ( = ?auto_758106 ?auto_758108 ) ) ( TRUCK-AT ?auto_758112 ?auto_758110 ) ( not ( = ?auto_758110 ?auto_758111 ) ) ( ON ?auto_758101 ?auto_758100 ) ( ON ?auto_758102 ?auto_758101 ) ( ON ?auto_758099 ?auto_758102 ) ( ON ?auto_758103 ?auto_758099 ) ( ON ?auto_758105 ?auto_758103 ) ( ON ?auto_758104 ?auto_758105 ) ( ON ?auto_758106 ?auto_758104 ) ( not ( = ?auto_758100 ?auto_758101 ) ) ( not ( = ?auto_758100 ?auto_758102 ) ) ( not ( = ?auto_758100 ?auto_758099 ) ) ( not ( = ?auto_758100 ?auto_758103 ) ) ( not ( = ?auto_758100 ?auto_758105 ) ) ( not ( = ?auto_758100 ?auto_758104 ) ) ( not ( = ?auto_758100 ?auto_758106 ) ) ( not ( = ?auto_758100 ?auto_758107 ) ) ( not ( = ?auto_758100 ?auto_758108 ) ) ( not ( = ?auto_758101 ?auto_758102 ) ) ( not ( = ?auto_758101 ?auto_758099 ) ) ( not ( = ?auto_758101 ?auto_758103 ) ) ( not ( = ?auto_758101 ?auto_758105 ) ) ( not ( = ?auto_758101 ?auto_758104 ) ) ( not ( = ?auto_758101 ?auto_758106 ) ) ( not ( = ?auto_758101 ?auto_758107 ) ) ( not ( = ?auto_758101 ?auto_758108 ) ) ( not ( = ?auto_758102 ?auto_758099 ) ) ( not ( = ?auto_758102 ?auto_758103 ) ) ( not ( = ?auto_758102 ?auto_758105 ) ) ( not ( = ?auto_758102 ?auto_758104 ) ) ( not ( = ?auto_758102 ?auto_758106 ) ) ( not ( = ?auto_758102 ?auto_758107 ) ) ( not ( = ?auto_758102 ?auto_758108 ) ) ( not ( = ?auto_758099 ?auto_758103 ) ) ( not ( = ?auto_758099 ?auto_758105 ) ) ( not ( = ?auto_758099 ?auto_758104 ) ) ( not ( = ?auto_758099 ?auto_758106 ) ) ( not ( = ?auto_758099 ?auto_758107 ) ) ( not ( = ?auto_758099 ?auto_758108 ) ) ( not ( = ?auto_758103 ?auto_758105 ) ) ( not ( = ?auto_758103 ?auto_758104 ) ) ( not ( = ?auto_758103 ?auto_758106 ) ) ( not ( = ?auto_758103 ?auto_758107 ) ) ( not ( = ?auto_758103 ?auto_758108 ) ) ( not ( = ?auto_758105 ?auto_758104 ) ) ( not ( = ?auto_758105 ?auto_758106 ) ) ( not ( = ?auto_758105 ?auto_758107 ) ) ( not ( = ?auto_758105 ?auto_758108 ) ) ( not ( = ?auto_758104 ?auto_758106 ) ) ( not ( = ?auto_758104 ?auto_758107 ) ) ( not ( = ?auto_758104 ?auto_758108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758106 ?auto_758107 ?auto_758108 )
      ( MAKE-9CRATE-VERIFY ?auto_758100 ?auto_758101 ?auto_758102 ?auto_758099 ?auto_758103 ?auto_758105 ?auto_758104 ?auto_758106 ?auto_758107 ?auto_758108 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758199 - SURFACE
      ?auto_758200 - SURFACE
      ?auto_758201 - SURFACE
      ?auto_758198 - SURFACE
      ?auto_758202 - SURFACE
      ?auto_758204 - SURFACE
      ?auto_758203 - SURFACE
      ?auto_758205 - SURFACE
      ?auto_758206 - SURFACE
      ?auto_758207 - SURFACE
    )
    :vars
    (
      ?auto_758210 - HOIST
      ?auto_758209 - PLACE
      ?auto_758212 - TRUCK
      ?auto_758211 - PLACE
      ?auto_758208 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_758210 ?auto_758209 ) ( SURFACE-AT ?auto_758206 ?auto_758209 ) ( CLEAR ?auto_758206 ) ( IS-CRATE ?auto_758207 ) ( not ( = ?auto_758206 ?auto_758207 ) ) ( AVAILABLE ?auto_758210 ) ( ON ?auto_758206 ?auto_758205 ) ( not ( = ?auto_758205 ?auto_758206 ) ) ( not ( = ?auto_758205 ?auto_758207 ) ) ( TRUCK-AT ?auto_758212 ?auto_758211 ) ( not ( = ?auto_758211 ?auto_758209 ) ) ( HOIST-AT ?auto_758208 ?auto_758211 ) ( LIFTING ?auto_758208 ?auto_758207 ) ( not ( = ?auto_758210 ?auto_758208 ) ) ( ON ?auto_758200 ?auto_758199 ) ( ON ?auto_758201 ?auto_758200 ) ( ON ?auto_758198 ?auto_758201 ) ( ON ?auto_758202 ?auto_758198 ) ( ON ?auto_758204 ?auto_758202 ) ( ON ?auto_758203 ?auto_758204 ) ( ON ?auto_758205 ?auto_758203 ) ( not ( = ?auto_758199 ?auto_758200 ) ) ( not ( = ?auto_758199 ?auto_758201 ) ) ( not ( = ?auto_758199 ?auto_758198 ) ) ( not ( = ?auto_758199 ?auto_758202 ) ) ( not ( = ?auto_758199 ?auto_758204 ) ) ( not ( = ?auto_758199 ?auto_758203 ) ) ( not ( = ?auto_758199 ?auto_758205 ) ) ( not ( = ?auto_758199 ?auto_758206 ) ) ( not ( = ?auto_758199 ?auto_758207 ) ) ( not ( = ?auto_758200 ?auto_758201 ) ) ( not ( = ?auto_758200 ?auto_758198 ) ) ( not ( = ?auto_758200 ?auto_758202 ) ) ( not ( = ?auto_758200 ?auto_758204 ) ) ( not ( = ?auto_758200 ?auto_758203 ) ) ( not ( = ?auto_758200 ?auto_758205 ) ) ( not ( = ?auto_758200 ?auto_758206 ) ) ( not ( = ?auto_758200 ?auto_758207 ) ) ( not ( = ?auto_758201 ?auto_758198 ) ) ( not ( = ?auto_758201 ?auto_758202 ) ) ( not ( = ?auto_758201 ?auto_758204 ) ) ( not ( = ?auto_758201 ?auto_758203 ) ) ( not ( = ?auto_758201 ?auto_758205 ) ) ( not ( = ?auto_758201 ?auto_758206 ) ) ( not ( = ?auto_758201 ?auto_758207 ) ) ( not ( = ?auto_758198 ?auto_758202 ) ) ( not ( = ?auto_758198 ?auto_758204 ) ) ( not ( = ?auto_758198 ?auto_758203 ) ) ( not ( = ?auto_758198 ?auto_758205 ) ) ( not ( = ?auto_758198 ?auto_758206 ) ) ( not ( = ?auto_758198 ?auto_758207 ) ) ( not ( = ?auto_758202 ?auto_758204 ) ) ( not ( = ?auto_758202 ?auto_758203 ) ) ( not ( = ?auto_758202 ?auto_758205 ) ) ( not ( = ?auto_758202 ?auto_758206 ) ) ( not ( = ?auto_758202 ?auto_758207 ) ) ( not ( = ?auto_758204 ?auto_758203 ) ) ( not ( = ?auto_758204 ?auto_758205 ) ) ( not ( = ?auto_758204 ?auto_758206 ) ) ( not ( = ?auto_758204 ?auto_758207 ) ) ( not ( = ?auto_758203 ?auto_758205 ) ) ( not ( = ?auto_758203 ?auto_758206 ) ) ( not ( = ?auto_758203 ?auto_758207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758205 ?auto_758206 ?auto_758207 )
      ( MAKE-9CRATE-VERIFY ?auto_758199 ?auto_758200 ?auto_758201 ?auto_758198 ?auto_758202 ?auto_758204 ?auto_758203 ?auto_758205 ?auto_758206 ?auto_758207 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758307 - SURFACE
      ?auto_758308 - SURFACE
      ?auto_758309 - SURFACE
      ?auto_758306 - SURFACE
      ?auto_758310 - SURFACE
      ?auto_758312 - SURFACE
      ?auto_758311 - SURFACE
      ?auto_758313 - SURFACE
      ?auto_758314 - SURFACE
      ?auto_758315 - SURFACE
    )
    :vars
    (
      ?auto_758321 - HOIST
      ?auto_758319 - PLACE
      ?auto_758320 - TRUCK
      ?auto_758318 - PLACE
      ?auto_758317 - HOIST
      ?auto_758316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758321 ?auto_758319 ) ( SURFACE-AT ?auto_758314 ?auto_758319 ) ( CLEAR ?auto_758314 ) ( IS-CRATE ?auto_758315 ) ( not ( = ?auto_758314 ?auto_758315 ) ) ( AVAILABLE ?auto_758321 ) ( ON ?auto_758314 ?auto_758313 ) ( not ( = ?auto_758313 ?auto_758314 ) ) ( not ( = ?auto_758313 ?auto_758315 ) ) ( TRUCK-AT ?auto_758320 ?auto_758318 ) ( not ( = ?auto_758318 ?auto_758319 ) ) ( HOIST-AT ?auto_758317 ?auto_758318 ) ( not ( = ?auto_758321 ?auto_758317 ) ) ( AVAILABLE ?auto_758317 ) ( SURFACE-AT ?auto_758315 ?auto_758318 ) ( ON ?auto_758315 ?auto_758316 ) ( CLEAR ?auto_758315 ) ( not ( = ?auto_758314 ?auto_758316 ) ) ( not ( = ?auto_758315 ?auto_758316 ) ) ( not ( = ?auto_758313 ?auto_758316 ) ) ( ON ?auto_758308 ?auto_758307 ) ( ON ?auto_758309 ?auto_758308 ) ( ON ?auto_758306 ?auto_758309 ) ( ON ?auto_758310 ?auto_758306 ) ( ON ?auto_758312 ?auto_758310 ) ( ON ?auto_758311 ?auto_758312 ) ( ON ?auto_758313 ?auto_758311 ) ( not ( = ?auto_758307 ?auto_758308 ) ) ( not ( = ?auto_758307 ?auto_758309 ) ) ( not ( = ?auto_758307 ?auto_758306 ) ) ( not ( = ?auto_758307 ?auto_758310 ) ) ( not ( = ?auto_758307 ?auto_758312 ) ) ( not ( = ?auto_758307 ?auto_758311 ) ) ( not ( = ?auto_758307 ?auto_758313 ) ) ( not ( = ?auto_758307 ?auto_758314 ) ) ( not ( = ?auto_758307 ?auto_758315 ) ) ( not ( = ?auto_758307 ?auto_758316 ) ) ( not ( = ?auto_758308 ?auto_758309 ) ) ( not ( = ?auto_758308 ?auto_758306 ) ) ( not ( = ?auto_758308 ?auto_758310 ) ) ( not ( = ?auto_758308 ?auto_758312 ) ) ( not ( = ?auto_758308 ?auto_758311 ) ) ( not ( = ?auto_758308 ?auto_758313 ) ) ( not ( = ?auto_758308 ?auto_758314 ) ) ( not ( = ?auto_758308 ?auto_758315 ) ) ( not ( = ?auto_758308 ?auto_758316 ) ) ( not ( = ?auto_758309 ?auto_758306 ) ) ( not ( = ?auto_758309 ?auto_758310 ) ) ( not ( = ?auto_758309 ?auto_758312 ) ) ( not ( = ?auto_758309 ?auto_758311 ) ) ( not ( = ?auto_758309 ?auto_758313 ) ) ( not ( = ?auto_758309 ?auto_758314 ) ) ( not ( = ?auto_758309 ?auto_758315 ) ) ( not ( = ?auto_758309 ?auto_758316 ) ) ( not ( = ?auto_758306 ?auto_758310 ) ) ( not ( = ?auto_758306 ?auto_758312 ) ) ( not ( = ?auto_758306 ?auto_758311 ) ) ( not ( = ?auto_758306 ?auto_758313 ) ) ( not ( = ?auto_758306 ?auto_758314 ) ) ( not ( = ?auto_758306 ?auto_758315 ) ) ( not ( = ?auto_758306 ?auto_758316 ) ) ( not ( = ?auto_758310 ?auto_758312 ) ) ( not ( = ?auto_758310 ?auto_758311 ) ) ( not ( = ?auto_758310 ?auto_758313 ) ) ( not ( = ?auto_758310 ?auto_758314 ) ) ( not ( = ?auto_758310 ?auto_758315 ) ) ( not ( = ?auto_758310 ?auto_758316 ) ) ( not ( = ?auto_758312 ?auto_758311 ) ) ( not ( = ?auto_758312 ?auto_758313 ) ) ( not ( = ?auto_758312 ?auto_758314 ) ) ( not ( = ?auto_758312 ?auto_758315 ) ) ( not ( = ?auto_758312 ?auto_758316 ) ) ( not ( = ?auto_758311 ?auto_758313 ) ) ( not ( = ?auto_758311 ?auto_758314 ) ) ( not ( = ?auto_758311 ?auto_758315 ) ) ( not ( = ?auto_758311 ?auto_758316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758313 ?auto_758314 ?auto_758315 )
      ( MAKE-9CRATE-VERIFY ?auto_758307 ?auto_758308 ?auto_758309 ?auto_758306 ?auto_758310 ?auto_758312 ?auto_758311 ?auto_758313 ?auto_758314 ?auto_758315 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758416 - SURFACE
      ?auto_758417 - SURFACE
      ?auto_758418 - SURFACE
      ?auto_758415 - SURFACE
      ?auto_758419 - SURFACE
      ?auto_758421 - SURFACE
      ?auto_758420 - SURFACE
      ?auto_758422 - SURFACE
      ?auto_758423 - SURFACE
      ?auto_758424 - SURFACE
    )
    :vars
    (
      ?auto_758427 - HOIST
      ?auto_758428 - PLACE
      ?auto_758430 - PLACE
      ?auto_758429 - HOIST
      ?auto_758425 - SURFACE
      ?auto_758426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758427 ?auto_758428 ) ( SURFACE-AT ?auto_758423 ?auto_758428 ) ( CLEAR ?auto_758423 ) ( IS-CRATE ?auto_758424 ) ( not ( = ?auto_758423 ?auto_758424 ) ) ( AVAILABLE ?auto_758427 ) ( ON ?auto_758423 ?auto_758422 ) ( not ( = ?auto_758422 ?auto_758423 ) ) ( not ( = ?auto_758422 ?auto_758424 ) ) ( not ( = ?auto_758430 ?auto_758428 ) ) ( HOIST-AT ?auto_758429 ?auto_758430 ) ( not ( = ?auto_758427 ?auto_758429 ) ) ( AVAILABLE ?auto_758429 ) ( SURFACE-AT ?auto_758424 ?auto_758430 ) ( ON ?auto_758424 ?auto_758425 ) ( CLEAR ?auto_758424 ) ( not ( = ?auto_758423 ?auto_758425 ) ) ( not ( = ?auto_758424 ?auto_758425 ) ) ( not ( = ?auto_758422 ?auto_758425 ) ) ( TRUCK-AT ?auto_758426 ?auto_758428 ) ( ON ?auto_758417 ?auto_758416 ) ( ON ?auto_758418 ?auto_758417 ) ( ON ?auto_758415 ?auto_758418 ) ( ON ?auto_758419 ?auto_758415 ) ( ON ?auto_758421 ?auto_758419 ) ( ON ?auto_758420 ?auto_758421 ) ( ON ?auto_758422 ?auto_758420 ) ( not ( = ?auto_758416 ?auto_758417 ) ) ( not ( = ?auto_758416 ?auto_758418 ) ) ( not ( = ?auto_758416 ?auto_758415 ) ) ( not ( = ?auto_758416 ?auto_758419 ) ) ( not ( = ?auto_758416 ?auto_758421 ) ) ( not ( = ?auto_758416 ?auto_758420 ) ) ( not ( = ?auto_758416 ?auto_758422 ) ) ( not ( = ?auto_758416 ?auto_758423 ) ) ( not ( = ?auto_758416 ?auto_758424 ) ) ( not ( = ?auto_758416 ?auto_758425 ) ) ( not ( = ?auto_758417 ?auto_758418 ) ) ( not ( = ?auto_758417 ?auto_758415 ) ) ( not ( = ?auto_758417 ?auto_758419 ) ) ( not ( = ?auto_758417 ?auto_758421 ) ) ( not ( = ?auto_758417 ?auto_758420 ) ) ( not ( = ?auto_758417 ?auto_758422 ) ) ( not ( = ?auto_758417 ?auto_758423 ) ) ( not ( = ?auto_758417 ?auto_758424 ) ) ( not ( = ?auto_758417 ?auto_758425 ) ) ( not ( = ?auto_758418 ?auto_758415 ) ) ( not ( = ?auto_758418 ?auto_758419 ) ) ( not ( = ?auto_758418 ?auto_758421 ) ) ( not ( = ?auto_758418 ?auto_758420 ) ) ( not ( = ?auto_758418 ?auto_758422 ) ) ( not ( = ?auto_758418 ?auto_758423 ) ) ( not ( = ?auto_758418 ?auto_758424 ) ) ( not ( = ?auto_758418 ?auto_758425 ) ) ( not ( = ?auto_758415 ?auto_758419 ) ) ( not ( = ?auto_758415 ?auto_758421 ) ) ( not ( = ?auto_758415 ?auto_758420 ) ) ( not ( = ?auto_758415 ?auto_758422 ) ) ( not ( = ?auto_758415 ?auto_758423 ) ) ( not ( = ?auto_758415 ?auto_758424 ) ) ( not ( = ?auto_758415 ?auto_758425 ) ) ( not ( = ?auto_758419 ?auto_758421 ) ) ( not ( = ?auto_758419 ?auto_758420 ) ) ( not ( = ?auto_758419 ?auto_758422 ) ) ( not ( = ?auto_758419 ?auto_758423 ) ) ( not ( = ?auto_758419 ?auto_758424 ) ) ( not ( = ?auto_758419 ?auto_758425 ) ) ( not ( = ?auto_758421 ?auto_758420 ) ) ( not ( = ?auto_758421 ?auto_758422 ) ) ( not ( = ?auto_758421 ?auto_758423 ) ) ( not ( = ?auto_758421 ?auto_758424 ) ) ( not ( = ?auto_758421 ?auto_758425 ) ) ( not ( = ?auto_758420 ?auto_758422 ) ) ( not ( = ?auto_758420 ?auto_758423 ) ) ( not ( = ?auto_758420 ?auto_758424 ) ) ( not ( = ?auto_758420 ?auto_758425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758422 ?auto_758423 ?auto_758424 )
      ( MAKE-9CRATE-VERIFY ?auto_758416 ?auto_758417 ?auto_758418 ?auto_758415 ?auto_758419 ?auto_758421 ?auto_758420 ?auto_758422 ?auto_758423 ?auto_758424 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758525 - SURFACE
      ?auto_758526 - SURFACE
      ?auto_758527 - SURFACE
      ?auto_758524 - SURFACE
      ?auto_758528 - SURFACE
      ?auto_758530 - SURFACE
      ?auto_758529 - SURFACE
      ?auto_758531 - SURFACE
      ?auto_758532 - SURFACE
      ?auto_758533 - SURFACE
    )
    :vars
    (
      ?auto_758534 - HOIST
      ?auto_758539 - PLACE
      ?auto_758537 - PLACE
      ?auto_758538 - HOIST
      ?auto_758536 - SURFACE
      ?auto_758535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758534 ?auto_758539 ) ( IS-CRATE ?auto_758533 ) ( not ( = ?auto_758532 ?auto_758533 ) ) ( not ( = ?auto_758531 ?auto_758532 ) ) ( not ( = ?auto_758531 ?auto_758533 ) ) ( not ( = ?auto_758537 ?auto_758539 ) ) ( HOIST-AT ?auto_758538 ?auto_758537 ) ( not ( = ?auto_758534 ?auto_758538 ) ) ( AVAILABLE ?auto_758538 ) ( SURFACE-AT ?auto_758533 ?auto_758537 ) ( ON ?auto_758533 ?auto_758536 ) ( CLEAR ?auto_758533 ) ( not ( = ?auto_758532 ?auto_758536 ) ) ( not ( = ?auto_758533 ?auto_758536 ) ) ( not ( = ?auto_758531 ?auto_758536 ) ) ( TRUCK-AT ?auto_758535 ?auto_758539 ) ( SURFACE-AT ?auto_758531 ?auto_758539 ) ( CLEAR ?auto_758531 ) ( LIFTING ?auto_758534 ?auto_758532 ) ( IS-CRATE ?auto_758532 ) ( ON ?auto_758526 ?auto_758525 ) ( ON ?auto_758527 ?auto_758526 ) ( ON ?auto_758524 ?auto_758527 ) ( ON ?auto_758528 ?auto_758524 ) ( ON ?auto_758530 ?auto_758528 ) ( ON ?auto_758529 ?auto_758530 ) ( ON ?auto_758531 ?auto_758529 ) ( not ( = ?auto_758525 ?auto_758526 ) ) ( not ( = ?auto_758525 ?auto_758527 ) ) ( not ( = ?auto_758525 ?auto_758524 ) ) ( not ( = ?auto_758525 ?auto_758528 ) ) ( not ( = ?auto_758525 ?auto_758530 ) ) ( not ( = ?auto_758525 ?auto_758529 ) ) ( not ( = ?auto_758525 ?auto_758531 ) ) ( not ( = ?auto_758525 ?auto_758532 ) ) ( not ( = ?auto_758525 ?auto_758533 ) ) ( not ( = ?auto_758525 ?auto_758536 ) ) ( not ( = ?auto_758526 ?auto_758527 ) ) ( not ( = ?auto_758526 ?auto_758524 ) ) ( not ( = ?auto_758526 ?auto_758528 ) ) ( not ( = ?auto_758526 ?auto_758530 ) ) ( not ( = ?auto_758526 ?auto_758529 ) ) ( not ( = ?auto_758526 ?auto_758531 ) ) ( not ( = ?auto_758526 ?auto_758532 ) ) ( not ( = ?auto_758526 ?auto_758533 ) ) ( not ( = ?auto_758526 ?auto_758536 ) ) ( not ( = ?auto_758527 ?auto_758524 ) ) ( not ( = ?auto_758527 ?auto_758528 ) ) ( not ( = ?auto_758527 ?auto_758530 ) ) ( not ( = ?auto_758527 ?auto_758529 ) ) ( not ( = ?auto_758527 ?auto_758531 ) ) ( not ( = ?auto_758527 ?auto_758532 ) ) ( not ( = ?auto_758527 ?auto_758533 ) ) ( not ( = ?auto_758527 ?auto_758536 ) ) ( not ( = ?auto_758524 ?auto_758528 ) ) ( not ( = ?auto_758524 ?auto_758530 ) ) ( not ( = ?auto_758524 ?auto_758529 ) ) ( not ( = ?auto_758524 ?auto_758531 ) ) ( not ( = ?auto_758524 ?auto_758532 ) ) ( not ( = ?auto_758524 ?auto_758533 ) ) ( not ( = ?auto_758524 ?auto_758536 ) ) ( not ( = ?auto_758528 ?auto_758530 ) ) ( not ( = ?auto_758528 ?auto_758529 ) ) ( not ( = ?auto_758528 ?auto_758531 ) ) ( not ( = ?auto_758528 ?auto_758532 ) ) ( not ( = ?auto_758528 ?auto_758533 ) ) ( not ( = ?auto_758528 ?auto_758536 ) ) ( not ( = ?auto_758530 ?auto_758529 ) ) ( not ( = ?auto_758530 ?auto_758531 ) ) ( not ( = ?auto_758530 ?auto_758532 ) ) ( not ( = ?auto_758530 ?auto_758533 ) ) ( not ( = ?auto_758530 ?auto_758536 ) ) ( not ( = ?auto_758529 ?auto_758531 ) ) ( not ( = ?auto_758529 ?auto_758532 ) ) ( not ( = ?auto_758529 ?auto_758533 ) ) ( not ( = ?auto_758529 ?auto_758536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758531 ?auto_758532 ?auto_758533 )
      ( MAKE-9CRATE-VERIFY ?auto_758525 ?auto_758526 ?auto_758527 ?auto_758524 ?auto_758528 ?auto_758530 ?auto_758529 ?auto_758531 ?auto_758532 ?auto_758533 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758634 - SURFACE
      ?auto_758635 - SURFACE
      ?auto_758636 - SURFACE
      ?auto_758633 - SURFACE
      ?auto_758637 - SURFACE
      ?auto_758639 - SURFACE
      ?auto_758638 - SURFACE
      ?auto_758640 - SURFACE
      ?auto_758641 - SURFACE
      ?auto_758642 - SURFACE
    )
    :vars
    (
      ?auto_758643 - HOIST
      ?auto_758646 - PLACE
      ?auto_758644 - PLACE
      ?auto_758648 - HOIST
      ?auto_758647 - SURFACE
      ?auto_758645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758643 ?auto_758646 ) ( IS-CRATE ?auto_758642 ) ( not ( = ?auto_758641 ?auto_758642 ) ) ( not ( = ?auto_758640 ?auto_758641 ) ) ( not ( = ?auto_758640 ?auto_758642 ) ) ( not ( = ?auto_758644 ?auto_758646 ) ) ( HOIST-AT ?auto_758648 ?auto_758644 ) ( not ( = ?auto_758643 ?auto_758648 ) ) ( AVAILABLE ?auto_758648 ) ( SURFACE-AT ?auto_758642 ?auto_758644 ) ( ON ?auto_758642 ?auto_758647 ) ( CLEAR ?auto_758642 ) ( not ( = ?auto_758641 ?auto_758647 ) ) ( not ( = ?auto_758642 ?auto_758647 ) ) ( not ( = ?auto_758640 ?auto_758647 ) ) ( TRUCK-AT ?auto_758645 ?auto_758646 ) ( SURFACE-AT ?auto_758640 ?auto_758646 ) ( CLEAR ?auto_758640 ) ( IS-CRATE ?auto_758641 ) ( AVAILABLE ?auto_758643 ) ( IN ?auto_758641 ?auto_758645 ) ( ON ?auto_758635 ?auto_758634 ) ( ON ?auto_758636 ?auto_758635 ) ( ON ?auto_758633 ?auto_758636 ) ( ON ?auto_758637 ?auto_758633 ) ( ON ?auto_758639 ?auto_758637 ) ( ON ?auto_758638 ?auto_758639 ) ( ON ?auto_758640 ?auto_758638 ) ( not ( = ?auto_758634 ?auto_758635 ) ) ( not ( = ?auto_758634 ?auto_758636 ) ) ( not ( = ?auto_758634 ?auto_758633 ) ) ( not ( = ?auto_758634 ?auto_758637 ) ) ( not ( = ?auto_758634 ?auto_758639 ) ) ( not ( = ?auto_758634 ?auto_758638 ) ) ( not ( = ?auto_758634 ?auto_758640 ) ) ( not ( = ?auto_758634 ?auto_758641 ) ) ( not ( = ?auto_758634 ?auto_758642 ) ) ( not ( = ?auto_758634 ?auto_758647 ) ) ( not ( = ?auto_758635 ?auto_758636 ) ) ( not ( = ?auto_758635 ?auto_758633 ) ) ( not ( = ?auto_758635 ?auto_758637 ) ) ( not ( = ?auto_758635 ?auto_758639 ) ) ( not ( = ?auto_758635 ?auto_758638 ) ) ( not ( = ?auto_758635 ?auto_758640 ) ) ( not ( = ?auto_758635 ?auto_758641 ) ) ( not ( = ?auto_758635 ?auto_758642 ) ) ( not ( = ?auto_758635 ?auto_758647 ) ) ( not ( = ?auto_758636 ?auto_758633 ) ) ( not ( = ?auto_758636 ?auto_758637 ) ) ( not ( = ?auto_758636 ?auto_758639 ) ) ( not ( = ?auto_758636 ?auto_758638 ) ) ( not ( = ?auto_758636 ?auto_758640 ) ) ( not ( = ?auto_758636 ?auto_758641 ) ) ( not ( = ?auto_758636 ?auto_758642 ) ) ( not ( = ?auto_758636 ?auto_758647 ) ) ( not ( = ?auto_758633 ?auto_758637 ) ) ( not ( = ?auto_758633 ?auto_758639 ) ) ( not ( = ?auto_758633 ?auto_758638 ) ) ( not ( = ?auto_758633 ?auto_758640 ) ) ( not ( = ?auto_758633 ?auto_758641 ) ) ( not ( = ?auto_758633 ?auto_758642 ) ) ( not ( = ?auto_758633 ?auto_758647 ) ) ( not ( = ?auto_758637 ?auto_758639 ) ) ( not ( = ?auto_758637 ?auto_758638 ) ) ( not ( = ?auto_758637 ?auto_758640 ) ) ( not ( = ?auto_758637 ?auto_758641 ) ) ( not ( = ?auto_758637 ?auto_758642 ) ) ( not ( = ?auto_758637 ?auto_758647 ) ) ( not ( = ?auto_758639 ?auto_758638 ) ) ( not ( = ?auto_758639 ?auto_758640 ) ) ( not ( = ?auto_758639 ?auto_758641 ) ) ( not ( = ?auto_758639 ?auto_758642 ) ) ( not ( = ?auto_758639 ?auto_758647 ) ) ( not ( = ?auto_758638 ?auto_758640 ) ) ( not ( = ?auto_758638 ?auto_758641 ) ) ( not ( = ?auto_758638 ?auto_758642 ) ) ( not ( = ?auto_758638 ?auto_758647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758640 ?auto_758641 ?auto_758642 )
      ( MAKE-9CRATE-VERIFY ?auto_758634 ?auto_758635 ?auto_758636 ?auto_758633 ?auto_758637 ?auto_758639 ?auto_758638 ?auto_758640 ?auto_758641 ?auto_758642 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764199 - SURFACE
      ?auto_764200 - SURFACE
      ?auto_764201 - SURFACE
      ?auto_764198 - SURFACE
      ?auto_764202 - SURFACE
      ?auto_764204 - SURFACE
      ?auto_764203 - SURFACE
      ?auto_764205 - SURFACE
      ?auto_764206 - SURFACE
      ?auto_764207 - SURFACE
      ?auto_764208 - SURFACE
    )
    :vars
    (
      ?auto_764210 - HOIST
      ?auto_764209 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764210 ?auto_764209 ) ( SURFACE-AT ?auto_764207 ?auto_764209 ) ( CLEAR ?auto_764207 ) ( LIFTING ?auto_764210 ?auto_764208 ) ( IS-CRATE ?auto_764208 ) ( not ( = ?auto_764207 ?auto_764208 ) ) ( ON ?auto_764200 ?auto_764199 ) ( ON ?auto_764201 ?auto_764200 ) ( ON ?auto_764198 ?auto_764201 ) ( ON ?auto_764202 ?auto_764198 ) ( ON ?auto_764204 ?auto_764202 ) ( ON ?auto_764203 ?auto_764204 ) ( ON ?auto_764205 ?auto_764203 ) ( ON ?auto_764206 ?auto_764205 ) ( ON ?auto_764207 ?auto_764206 ) ( not ( = ?auto_764199 ?auto_764200 ) ) ( not ( = ?auto_764199 ?auto_764201 ) ) ( not ( = ?auto_764199 ?auto_764198 ) ) ( not ( = ?auto_764199 ?auto_764202 ) ) ( not ( = ?auto_764199 ?auto_764204 ) ) ( not ( = ?auto_764199 ?auto_764203 ) ) ( not ( = ?auto_764199 ?auto_764205 ) ) ( not ( = ?auto_764199 ?auto_764206 ) ) ( not ( = ?auto_764199 ?auto_764207 ) ) ( not ( = ?auto_764199 ?auto_764208 ) ) ( not ( = ?auto_764200 ?auto_764201 ) ) ( not ( = ?auto_764200 ?auto_764198 ) ) ( not ( = ?auto_764200 ?auto_764202 ) ) ( not ( = ?auto_764200 ?auto_764204 ) ) ( not ( = ?auto_764200 ?auto_764203 ) ) ( not ( = ?auto_764200 ?auto_764205 ) ) ( not ( = ?auto_764200 ?auto_764206 ) ) ( not ( = ?auto_764200 ?auto_764207 ) ) ( not ( = ?auto_764200 ?auto_764208 ) ) ( not ( = ?auto_764201 ?auto_764198 ) ) ( not ( = ?auto_764201 ?auto_764202 ) ) ( not ( = ?auto_764201 ?auto_764204 ) ) ( not ( = ?auto_764201 ?auto_764203 ) ) ( not ( = ?auto_764201 ?auto_764205 ) ) ( not ( = ?auto_764201 ?auto_764206 ) ) ( not ( = ?auto_764201 ?auto_764207 ) ) ( not ( = ?auto_764201 ?auto_764208 ) ) ( not ( = ?auto_764198 ?auto_764202 ) ) ( not ( = ?auto_764198 ?auto_764204 ) ) ( not ( = ?auto_764198 ?auto_764203 ) ) ( not ( = ?auto_764198 ?auto_764205 ) ) ( not ( = ?auto_764198 ?auto_764206 ) ) ( not ( = ?auto_764198 ?auto_764207 ) ) ( not ( = ?auto_764198 ?auto_764208 ) ) ( not ( = ?auto_764202 ?auto_764204 ) ) ( not ( = ?auto_764202 ?auto_764203 ) ) ( not ( = ?auto_764202 ?auto_764205 ) ) ( not ( = ?auto_764202 ?auto_764206 ) ) ( not ( = ?auto_764202 ?auto_764207 ) ) ( not ( = ?auto_764202 ?auto_764208 ) ) ( not ( = ?auto_764204 ?auto_764203 ) ) ( not ( = ?auto_764204 ?auto_764205 ) ) ( not ( = ?auto_764204 ?auto_764206 ) ) ( not ( = ?auto_764204 ?auto_764207 ) ) ( not ( = ?auto_764204 ?auto_764208 ) ) ( not ( = ?auto_764203 ?auto_764205 ) ) ( not ( = ?auto_764203 ?auto_764206 ) ) ( not ( = ?auto_764203 ?auto_764207 ) ) ( not ( = ?auto_764203 ?auto_764208 ) ) ( not ( = ?auto_764205 ?auto_764206 ) ) ( not ( = ?auto_764205 ?auto_764207 ) ) ( not ( = ?auto_764205 ?auto_764208 ) ) ( not ( = ?auto_764206 ?auto_764207 ) ) ( not ( = ?auto_764206 ?auto_764208 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_764207 ?auto_764208 )
      ( MAKE-10CRATE-VERIFY ?auto_764199 ?auto_764200 ?auto_764201 ?auto_764198 ?auto_764202 ?auto_764204 ?auto_764203 ?auto_764205 ?auto_764206 ?auto_764207 ?auto_764208 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764293 - SURFACE
      ?auto_764294 - SURFACE
      ?auto_764295 - SURFACE
      ?auto_764292 - SURFACE
      ?auto_764296 - SURFACE
      ?auto_764298 - SURFACE
      ?auto_764297 - SURFACE
      ?auto_764299 - SURFACE
      ?auto_764300 - SURFACE
      ?auto_764301 - SURFACE
      ?auto_764302 - SURFACE
    )
    :vars
    (
      ?auto_764303 - HOIST
      ?auto_764304 - PLACE
      ?auto_764305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764303 ?auto_764304 ) ( SURFACE-AT ?auto_764301 ?auto_764304 ) ( CLEAR ?auto_764301 ) ( IS-CRATE ?auto_764302 ) ( not ( = ?auto_764301 ?auto_764302 ) ) ( TRUCK-AT ?auto_764305 ?auto_764304 ) ( AVAILABLE ?auto_764303 ) ( IN ?auto_764302 ?auto_764305 ) ( ON ?auto_764301 ?auto_764300 ) ( not ( = ?auto_764300 ?auto_764301 ) ) ( not ( = ?auto_764300 ?auto_764302 ) ) ( ON ?auto_764294 ?auto_764293 ) ( ON ?auto_764295 ?auto_764294 ) ( ON ?auto_764292 ?auto_764295 ) ( ON ?auto_764296 ?auto_764292 ) ( ON ?auto_764298 ?auto_764296 ) ( ON ?auto_764297 ?auto_764298 ) ( ON ?auto_764299 ?auto_764297 ) ( ON ?auto_764300 ?auto_764299 ) ( not ( = ?auto_764293 ?auto_764294 ) ) ( not ( = ?auto_764293 ?auto_764295 ) ) ( not ( = ?auto_764293 ?auto_764292 ) ) ( not ( = ?auto_764293 ?auto_764296 ) ) ( not ( = ?auto_764293 ?auto_764298 ) ) ( not ( = ?auto_764293 ?auto_764297 ) ) ( not ( = ?auto_764293 ?auto_764299 ) ) ( not ( = ?auto_764293 ?auto_764300 ) ) ( not ( = ?auto_764293 ?auto_764301 ) ) ( not ( = ?auto_764293 ?auto_764302 ) ) ( not ( = ?auto_764294 ?auto_764295 ) ) ( not ( = ?auto_764294 ?auto_764292 ) ) ( not ( = ?auto_764294 ?auto_764296 ) ) ( not ( = ?auto_764294 ?auto_764298 ) ) ( not ( = ?auto_764294 ?auto_764297 ) ) ( not ( = ?auto_764294 ?auto_764299 ) ) ( not ( = ?auto_764294 ?auto_764300 ) ) ( not ( = ?auto_764294 ?auto_764301 ) ) ( not ( = ?auto_764294 ?auto_764302 ) ) ( not ( = ?auto_764295 ?auto_764292 ) ) ( not ( = ?auto_764295 ?auto_764296 ) ) ( not ( = ?auto_764295 ?auto_764298 ) ) ( not ( = ?auto_764295 ?auto_764297 ) ) ( not ( = ?auto_764295 ?auto_764299 ) ) ( not ( = ?auto_764295 ?auto_764300 ) ) ( not ( = ?auto_764295 ?auto_764301 ) ) ( not ( = ?auto_764295 ?auto_764302 ) ) ( not ( = ?auto_764292 ?auto_764296 ) ) ( not ( = ?auto_764292 ?auto_764298 ) ) ( not ( = ?auto_764292 ?auto_764297 ) ) ( not ( = ?auto_764292 ?auto_764299 ) ) ( not ( = ?auto_764292 ?auto_764300 ) ) ( not ( = ?auto_764292 ?auto_764301 ) ) ( not ( = ?auto_764292 ?auto_764302 ) ) ( not ( = ?auto_764296 ?auto_764298 ) ) ( not ( = ?auto_764296 ?auto_764297 ) ) ( not ( = ?auto_764296 ?auto_764299 ) ) ( not ( = ?auto_764296 ?auto_764300 ) ) ( not ( = ?auto_764296 ?auto_764301 ) ) ( not ( = ?auto_764296 ?auto_764302 ) ) ( not ( = ?auto_764298 ?auto_764297 ) ) ( not ( = ?auto_764298 ?auto_764299 ) ) ( not ( = ?auto_764298 ?auto_764300 ) ) ( not ( = ?auto_764298 ?auto_764301 ) ) ( not ( = ?auto_764298 ?auto_764302 ) ) ( not ( = ?auto_764297 ?auto_764299 ) ) ( not ( = ?auto_764297 ?auto_764300 ) ) ( not ( = ?auto_764297 ?auto_764301 ) ) ( not ( = ?auto_764297 ?auto_764302 ) ) ( not ( = ?auto_764299 ?auto_764300 ) ) ( not ( = ?auto_764299 ?auto_764301 ) ) ( not ( = ?auto_764299 ?auto_764302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764300 ?auto_764301 ?auto_764302 )
      ( MAKE-10CRATE-VERIFY ?auto_764293 ?auto_764294 ?auto_764295 ?auto_764292 ?auto_764296 ?auto_764298 ?auto_764297 ?auto_764299 ?auto_764300 ?auto_764301 ?auto_764302 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764398 - SURFACE
      ?auto_764399 - SURFACE
      ?auto_764400 - SURFACE
      ?auto_764397 - SURFACE
      ?auto_764401 - SURFACE
      ?auto_764403 - SURFACE
      ?auto_764402 - SURFACE
      ?auto_764404 - SURFACE
      ?auto_764405 - SURFACE
      ?auto_764406 - SURFACE
      ?auto_764407 - SURFACE
    )
    :vars
    (
      ?auto_764410 - HOIST
      ?auto_764408 - PLACE
      ?auto_764409 - TRUCK
      ?auto_764411 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764410 ?auto_764408 ) ( SURFACE-AT ?auto_764406 ?auto_764408 ) ( CLEAR ?auto_764406 ) ( IS-CRATE ?auto_764407 ) ( not ( = ?auto_764406 ?auto_764407 ) ) ( AVAILABLE ?auto_764410 ) ( IN ?auto_764407 ?auto_764409 ) ( ON ?auto_764406 ?auto_764405 ) ( not ( = ?auto_764405 ?auto_764406 ) ) ( not ( = ?auto_764405 ?auto_764407 ) ) ( TRUCK-AT ?auto_764409 ?auto_764411 ) ( not ( = ?auto_764411 ?auto_764408 ) ) ( ON ?auto_764399 ?auto_764398 ) ( ON ?auto_764400 ?auto_764399 ) ( ON ?auto_764397 ?auto_764400 ) ( ON ?auto_764401 ?auto_764397 ) ( ON ?auto_764403 ?auto_764401 ) ( ON ?auto_764402 ?auto_764403 ) ( ON ?auto_764404 ?auto_764402 ) ( ON ?auto_764405 ?auto_764404 ) ( not ( = ?auto_764398 ?auto_764399 ) ) ( not ( = ?auto_764398 ?auto_764400 ) ) ( not ( = ?auto_764398 ?auto_764397 ) ) ( not ( = ?auto_764398 ?auto_764401 ) ) ( not ( = ?auto_764398 ?auto_764403 ) ) ( not ( = ?auto_764398 ?auto_764402 ) ) ( not ( = ?auto_764398 ?auto_764404 ) ) ( not ( = ?auto_764398 ?auto_764405 ) ) ( not ( = ?auto_764398 ?auto_764406 ) ) ( not ( = ?auto_764398 ?auto_764407 ) ) ( not ( = ?auto_764399 ?auto_764400 ) ) ( not ( = ?auto_764399 ?auto_764397 ) ) ( not ( = ?auto_764399 ?auto_764401 ) ) ( not ( = ?auto_764399 ?auto_764403 ) ) ( not ( = ?auto_764399 ?auto_764402 ) ) ( not ( = ?auto_764399 ?auto_764404 ) ) ( not ( = ?auto_764399 ?auto_764405 ) ) ( not ( = ?auto_764399 ?auto_764406 ) ) ( not ( = ?auto_764399 ?auto_764407 ) ) ( not ( = ?auto_764400 ?auto_764397 ) ) ( not ( = ?auto_764400 ?auto_764401 ) ) ( not ( = ?auto_764400 ?auto_764403 ) ) ( not ( = ?auto_764400 ?auto_764402 ) ) ( not ( = ?auto_764400 ?auto_764404 ) ) ( not ( = ?auto_764400 ?auto_764405 ) ) ( not ( = ?auto_764400 ?auto_764406 ) ) ( not ( = ?auto_764400 ?auto_764407 ) ) ( not ( = ?auto_764397 ?auto_764401 ) ) ( not ( = ?auto_764397 ?auto_764403 ) ) ( not ( = ?auto_764397 ?auto_764402 ) ) ( not ( = ?auto_764397 ?auto_764404 ) ) ( not ( = ?auto_764397 ?auto_764405 ) ) ( not ( = ?auto_764397 ?auto_764406 ) ) ( not ( = ?auto_764397 ?auto_764407 ) ) ( not ( = ?auto_764401 ?auto_764403 ) ) ( not ( = ?auto_764401 ?auto_764402 ) ) ( not ( = ?auto_764401 ?auto_764404 ) ) ( not ( = ?auto_764401 ?auto_764405 ) ) ( not ( = ?auto_764401 ?auto_764406 ) ) ( not ( = ?auto_764401 ?auto_764407 ) ) ( not ( = ?auto_764403 ?auto_764402 ) ) ( not ( = ?auto_764403 ?auto_764404 ) ) ( not ( = ?auto_764403 ?auto_764405 ) ) ( not ( = ?auto_764403 ?auto_764406 ) ) ( not ( = ?auto_764403 ?auto_764407 ) ) ( not ( = ?auto_764402 ?auto_764404 ) ) ( not ( = ?auto_764402 ?auto_764405 ) ) ( not ( = ?auto_764402 ?auto_764406 ) ) ( not ( = ?auto_764402 ?auto_764407 ) ) ( not ( = ?auto_764404 ?auto_764405 ) ) ( not ( = ?auto_764404 ?auto_764406 ) ) ( not ( = ?auto_764404 ?auto_764407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764405 ?auto_764406 ?auto_764407 )
      ( MAKE-10CRATE-VERIFY ?auto_764398 ?auto_764399 ?auto_764400 ?auto_764397 ?auto_764401 ?auto_764403 ?auto_764402 ?auto_764404 ?auto_764405 ?auto_764406 ?auto_764407 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764513 - SURFACE
      ?auto_764514 - SURFACE
      ?auto_764515 - SURFACE
      ?auto_764512 - SURFACE
      ?auto_764516 - SURFACE
      ?auto_764518 - SURFACE
      ?auto_764517 - SURFACE
      ?auto_764519 - SURFACE
      ?auto_764520 - SURFACE
      ?auto_764521 - SURFACE
      ?auto_764522 - SURFACE
    )
    :vars
    (
      ?auto_764523 - HOIST
      ?auto_764527 - PLACE
      ?auto_764524 - TRUCK
      ?auto_764526 - PLACE
      ?auto_764525 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_764523 ?auto_764527 ) ( SURFACE-AT ?auto_764521 ?auto_764527 ) ( CLEAR ?auto_764521 ) ( IS-CRATE ?auto_764522 ) ( not ( = ?auto_764521 ?auto_764522 ) ) ( AVAILABLE ?auto_764523 ) ( ON ?auto_764521 ?auto_764520 ) ( not ( = ?auto_764520 ?auto_764521 ) ) ( not ( = ?auto_764520 ?auto_764522 ) ) ( TRUCK-AT ?auto_764524 ?auto_764526 ) ( not ( = ?auto_764526 ?auto_764527 ) ) ( HOIST-AT ?auto_764525 ?auto_764526 ) ( LIFTING ?auto_764525 ?auto_764522 ) ( not ( = ?auto_764523 ?auto_764525 ) ) ( ON ?auto_764514 ?auto_764513 ) ( ON ?auto_764515 ?auto_764514 ) ( ON ?auto_764512 ?auto_764515 ) ( ON ?auto_764516 ?auto_764512 ) ( ON ?auto_764518 ?auto_764516 ) ( ON ?auto_764517 ?auto_764518 ) ( ON ?auto_764519 ?auto_764517 ) ( ON ?auto_764520 ?auto_764519 ) ( not ( = ?auto_764513 ?auto_764514 ) ) ( not ( = ?auto_764513 ?auto_764515 ) ) ( not ( = ?auto_764513 ?auto_764512 ) ) ( not ( = ?auto_764513 ?auto_764516 ) ) ( not ( = ?auto_764513 ?auto_764518 ) ) ( not ( = ?auto_764513 ?auto_764517 ) ) ( not ( = ?auto_764513 ?auto_764519 ) ) ( not ( = ?auto_764513 ?auto_764520 ) ) ( not ( = ?auto_764513 ?auto_764521 ) ) ( not ( = ?auto_764513 ?auto_764522 ) ) ( not ( = ?auto_764514 ?auto_764515 ) ) ( not ( = ?auto_764514 ?auto_764512 ) ) ( not ( = ?auto_764514 ?auto_764516 ) ) ( not ( = ?auto_764514 ?auto_764518 ) ) ( not ( = ?auto_764514 ?auto_764517 ) ) ( not ( = ?auto_764514 ?auto_764519 ) ) ( not ( = ?auto_764514 ?auto_764520 ) ) ( not ( = ?auto_764514 ?auto_764521 ) ) ( not ( = ?auto_764514 ?auto_764522 ) ) ( not ( = ?auto_764515 ?auto_764512 ) ) ( not ( = ?auto_764515 ?auto_764516 ) ) ( not ( = ?auto_764515 ?auto_764518 ) ) ( not ( = ?auto_764515 ?auto_764517 ) ) ( not ( = ?auto_764515 ?auto_764519 ) ) ( not ( = ?auto_764515 ?auto_764520 ) ) ( not ( = ?auto_764515 ?auto_764521 ) ) ( not ( = ?auto_764515 ?auto_764522 ) ) ( not ( = ?auto_764512 ?auto_764516 ) ) ( not ( = ?auto_764512 ?auto_764518 ) ) ( not ( = ?auto_764512 ?auto_764517 ) ) ( not ( = ?auto_764512 ?auto_764519 ) ) ( not ( = ?auto_764512 ?auto_764520 ) ) ( not ( = ?auto_764512 ?auto_764521 ) ) ( not ( = ?auto_764512 ?auto_764522 ) ) ( not ( = ?auto_764516 ?auto_764518 ) ) ( not ( = ?auto_764516 ?auto_764517 ) ) ( not ( = ?auto_764516 ?auto_764519 ) ) ( not ( = ?auto_764516 ?auto_764520 ) ) ( not ( = ?auto_764516 ?auto_764521 ) ) ( not ( = ?auto_764516 ?auto_764522 ) ) ( not ( = ?auto_764518 ?auto_764517 ) ) ( not ( = ?auto_764518 ?auto_764519 ) ) ( not ( = ?auto_764518 ?auto_764520 ) ) ( not ( = ?auto_764518 ?auto_764521 ) ) ( not ( = ?auto_764518 ?auto_764522 ) ) ( not ( = ?auto_764517 ?auto_764519 ) ) ( not ( = ?auto_764517 ?auto_764520 ) ) ( not ( = ?auto_764517 ?auto_764521 ) ) ( not ( = ?auto_764517 ?auto_764522 ) ) ( not ( = ?auto_764519 ?auto_764520 ) ) ( not ( = ?auto_764519 ?auto_764521 ) ) ( not ( = ?auto_764519 ?auto_764522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764520 ?auto_764521 ?auto_764522 )
      ( MAKE-10CRATE-VERIFY ?auto_764513 ?auto_764514 ?auto_764515 ?auto_764512 ?auto_764516 ?auto_764518 ?auto_764517 ?auto_764519 ?auto_764520 ?auto_764521 ?auto_764522 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764638 - SURFACE
      ?auto_764639 - SURFACE
      ?auto_764640 - SURFACE
      ?auto_764637 - SURFACE
      ?auto_764641 - SURFACE
      ?auto_764643 - SURFACE
      ?auto_764642 - SURFACE
      ?auto_764644 - SURFACE
      ?auto_764645 - SURFACE
      ?auto_764646 - SURFACE
      ?auto_764647 - SURFACE
    )
    :vars
    (
      ?auto_764650 - HOIST
      ?auto_764648 - PLACE
      ?auto_764653 - TRUCK
      ?auto_764652 - PLACE
      ?auto_764649 - HOIST
      ?auto_764651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764650 ?auto_764648 ) ( SURFACE-AT ?auto_764646 ?auto_764648 ) ( CLEAR ?auto_764646 ) ( IS-CRATE ?auto_764647 ) ( not ( = ?auto_764646 ?auto_764647 ) ) ( AVAILABLE ?auto_764650 ) ( ON ?auto_764646 ?auto_764645 ) ( not ( = ?auto_764645 ?auto_764646 ) ) ( not ( = ?auto_764645 ?auto_764647 ) ) ( TRUCK-AT ?auto_764653 ?auto_764652 ) ( not ( = ?auto_764652 ?auto_764648 ) ) ( HOIST-AT ?auto_764649 ?auto_764652 ) ( not ( = ?auto_764650 ?auto_764649 ) ) ( AVAILABLE ?auto_764649 ) ( SURFACE-AT ?auto_764647 ?auto_764652 ) ( ON ?auto_764647 ?auto_764651 ) ( CLEAR ?auto_764647 ) ( not ( = ?auto_764646 ?auto_764651 ) ) ( not ( = ?auto_764647 ?auto_764651 ) ) ( not ( = ?auto_764645 ?auto_764651 ) ) ( ON ?auto_764639 ?auto_764638 ) ( ON ?auto_764640 ?auto_764639 ) ( ON ?auto_764637 ?auto_764640 ) ( ON ?auto_764641 ?auto_764637 ) ( ON ?auto_764643 ?auto_764641 ) ( ON ?auto_764642 ?auto_764643 ) ( ON ?auto_764644 ?auto_764642 ) ( ON ?auto_764645 ?auto_764644 ) ( not ( = ?auto_764638 ?auto_764639 ) ) ( not ( = ?auto_764638 ?auto_764640 ) ) ( not ( = ?auto_764638 ?auto_764637 ) ) ( not ( = ?auto_764638 ?auto_764641 ) ) ( not ( = ?auto_764638 ?auto_764643 ) ) ( not ( = ?auto_764638 ?auto_764642 ) ) ( not ( = ?auto_764638 ?auto_764644 ) ) ( not ( = ?auto_764638 ?auto_764645 ) ) ( not ( = ?auto_764638 ?auto_764646 ) ) ( not ( = ?auto_764638 ?auto_764647 ) ) ( not ( = ?auto_764638 ?auto_764651 ) ) ( not ( = ?auto_764639 ?auto_764640 ) ) ( not ( = ?auto_764639 ?auto_764637 ) ) ( not ( = ?auto_764639 ?auto_764641 ) ) ( not ( = ?auto_764639 ?auto_764643 ) ) ( not ( = ?auto_764639 ?auto_764642 ) ) ( not ( = ?auto_764639 ?auto_764644 ) ) ( not ( = ?auto_764639 ?auto_764645 ) ) ( not ( = ?auto_764639 ?auto_764646 ) ) ( not ( = ?auto_764639 ?auto_764647 ) ) ( not ( = ?auto_764639 ?auto_764651 ) ) ( not ( = ?auto_764640 ?auto_764637 ) ) ( not ( = ?auto_764640 ?auto_764641 ) ) ( not ( = ?auto_764640 ?auto_764643 ) ) ( not ( = ?auto_764640 ?auto_764642 ) ) ( not ( = ?auto_764640 ?auto_764644 ) ) ( not ( = ?auto_764640 ?auto_764645 ) ) ( not ( = ?auto_764640 ?auto_764646 ) ) ( not ( = ?auto_764640 ?auto_764647 ) ) ( not ( = ?auto_764640 ?auto_764651 ) ) ( not ( = ?auto_764637 ?auto_764641 ) ) ( not ( = ?auto_764637 ?auto_764643 ) ) ( not ( = ?auto_764637 ?auto_764642 ) ) ( not ( = ?auto_764637 ?auto_764644 ) ) ( not ( = ?auto_764637 ?auto_764645 ) ) ( not ( = ?auto_764637 ?auto_764646 ) ) ( not ( = ?auto_764637 ?auto_764647 ) ) ( not ( = ?auto_764637 ?auto_764651 ) ) ( not ( = ?auto_764641 ?auto_764643 ) ) ( not ( = ?auto_764641 ?auto_764642 ) ) ( not ( = ?auto_764641 ?auto_764644 ) ) ( not ( = ?auto_764641 ?auto_764645 ) ) ( not ( = ?auto_764641 ?auto_764646 ) ) ( not ( = ?auto_764641 ?auto_764647 ) ) ( not ( = ?auto_764641 ?auto_764651 ) ) ( not ( = ?auto_764643 ?auto_764642 ) ) ( not ( = ?auto_764643 ?auto_764644 ) ) ( not ( = ?auto_764643 ?auto_764645 ) ) ( not ( = ?auto_764643 ?auto_764646 ) ) ( not ( = ?auto_764643 ?auto_764647 ) ) ( not ( = ?auto_764643 ?auto_764651 ) ) ( not ( = ?auto_764642 ?auto_764644 ) ) ( not ( = ?auto_764642 ?auto_764645 ) ) ( not ( = ?auto_764642 ?auto_764646 ) ) ( not ( = ?auto_764642 ?auto_764647 ) ) ( not ( = ?auto_764642 ?auto_764651 ) ) ( not ( = ?auto_764644 ?auto_764645 ) ) ( not ( = ?auto_764644 ?auto_764646 ) ) ( not ( = ?auto_764644 ?auto_764647 ) ) ( not ( = ?auto_764644 ?auto_764651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764645 ?auto_764646 ?auto_764647 )
      ( MAKE-10CRATE-VERIFY ?auto_764638 ?auto_764639 ?auto_764640 ?auto_764637 ?auto_764641 ?auto_764643 ?auto_764642 ?auto_764644 ?auto_764645 ?auto_764646 ?auto_764647 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764764 - SURFACE
      ?auto_764765 - SURFACE
      ?auto_764766 - SURFACE
      ?auto_764763 - SURFACE
      ?auto_764767 - SURFACE
      ?auto_764769 - SURFACE
      ?auto_764768 - SURFACE
      ?auto_764770 - SURFACE
      ?auto_764771 - SURFACE
      ?auto_764772 - SURFACE
      ?auto_764773 - SURFACE
    )
    :vars
    (
      ?auto_764775 - HOIST
      ?auto_764774 - PLACE
      ?auto_764778 - PLACE
      ?auto_764776 - HOIST
      ?auto_764779 - SURFACE
      ?auto_764777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764775 ?auto_764774 ) ( SURFACE-AT ?auto_764772 ?auto_764774 ) ( CLEAR ?auto_764772 ) ( IS-CRATE ?auto_764773 ) ( not ( = ?auto_764772 ?auto_764773 ) ) ( AVAILABLE ?auto_764775 ) ( ON ?auto_764772 ?auto_764771 ) ( not ( = ?auto_764771 ?auto_764772 ) ) ( not ( = ?auto_764771 ?auto_764773 ) ) ( not ( = ?auto_764778 ?auto_764774 ) ) ( HOIST-AT ?auto_764776 ?auto_764778 ) ( not ( = ?auto_764775 ?auto_764776 ) ) ( AVAILABLE ?auto_764776 ) ( SURFACE-AT ?auto_764773 ?auto_764778 ) ( ON ?auto_764773 ?auto_764779 ) ( CLEAR ?auto_764773 ) ( not ( = ?auto_764772 ?auto_764779 ) ) ( not ( = ?auto_764773 ?auto_764779 ) ) ( not ( = ?auto_764771 ?auto_764779 ) ) ( TRUCK-AT ?auto_764777 ?auto_764774 ) ( ON ?auto_764765 ?auto_764764 ) ( ON ?auto_764766 ?auto_764765 ) ( ON ?auto_764763 ?auto_764766 ) ( ON ?auto_764767 ?auto_764763 ) ( ON ?auto_764769 ?auto_764767 ) ( ON ?auto_764768 ?auto_764769 ) ( ON ?auto_764770 ?auto_764768 ) ( ON ?auto_764771 ?auto_764770 ) ( not ( = ?auto_764764 ?auto_764765 ) ) ( not ( = ?auto_764764 ?auto_764766 ) ) ( not ( = ?auto_764764 ?auto_764763 ) ) ( not ( = ?auto_764764 ?auto_764767 ) ) ( not ( = ?auto_764764 ?auto_764769 ) ) ( not ( = ?auto_764764 ?auto_764768 ) ) ( not ( = ?auto_764764 ?auto_764770 ) ) ( not ( = ?auto_764764 ?auto_764771 ) ) ( not ( = ?auto_764764 ?auto_764772 ) ) ( not ( = ?auto_764764 ?auto_764773 ) ) ( not ( = ?auto_764764 ?auto_764779 ) ) ( not ( = ?auto_764765 ?auto_764766 ) ) ( not ( = ?auto_764765 ?auto_764763 ) ) ( not ( = ?auto_764765 ?auto_764767 ) ) ( not ( = ?auto_764765 ?auto_764769 ) ) ( not ( = ?auto_764765 ?auto_764768 ) ) ( not ( = ?auto_764765 ?auto_764770 ) ) ( not ( = ?auto_764765 ?auto_764771 ) ) ( not ( = ?auto_764765 ?auto_764772 ) ) ( not ( = ?auto_764765 ?auto_764773 ) ) ( not ( = ?auto_764765 ?auto_764779 ) ) ( not ( = ?auto_764766 ?auto_764763 ) ) ( not ( = ?auto_764766 ?auto_764767 ) ) ( not ( = ?auto_764766 ?auto_764769 ) ) ( not ( = ?auto_764766 ?auto_764768 ) ) ( not ( = ?auto_764766 ?auto_764770 ) ) ( not ( = ?auto_764766 ?auto_764771 ) ) ( not ( = ?auto_764766 ?auto_764772 ) ) ( not ( = ?auto_764766 ?auto_764773 ) ) ( not ( = ?auto_764766 ?auto_764779 ) ) ( not ( = ?auto_764763 ?auto_764767 ) ) ( not ( = ?auto_764763 ?auto_764769 ) ) ( not ( = ?auto_764763 ?auto_764768 ) ) ( not ( = ?auto_764763 ?auto_764770 ) ) ( not ( = ?auto_764763 ?auto_764771 ) ) ( not ( = ?auto_764763 ?auto_764772 ) ) ( not ( = ?auto_764763 ?auto_764773 ) ) ( not ( = ?auto_764763 ?auto_764779 ) ) ( not ( = ?auto_764767 ?auto_764769 ) ) ( not ( = ?auto_764767 ?auto_764768 ) ) ( not ( = ?auto_764767 ?auto_764770 ) ) ( not ( = ?auto_764767 ?auto_764771 ) ) ( not ( = ?auto_764767 ?auto_764772 ) ) ( not ( = ?auto_764767 ?auto_764773 ) ) ( not ( = ?auto_764767 ?auto_764779 ) ) ( not ( = ?auto_764769 ?auto_764768 ) ) ( not ( = ?auto_764769 ?auto_764770 ) ) ( not ( = ?auto_764769 ?auto_764771 ) ) ( not ( = ?auto_764769 ?auto_764772 ) ) ( not ( = ?auto_764769 ?auto_764773 ) ) ( not ( = ?auto_764769 ?auto_764779 ) ) ( not ( = ?auto_764768 ?auto_764770 ) ) ( not ( = ?auto_764768 ?auto_764771 ) ) ( not ( = ?auto_764768 ?auto_764772 ) ) ( not ( = ?auto_764768 ?auto_764773 ) ) ( not ( = ?auto_764768 ?auto_764779 ) ) ( not ( = ?auto_764770 ?auto_764771 ) ) ( not ( = ?auto_764770 ?auto_764772 ) ) ( not ( = ?auto_764770 ?auto_764773 ) ) ( not ( = ?auto_764770 ?auto_764779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764771 ?auto_764772 ?auto_764773 )
      ( MAKE-10CRATE-VERIFY ?auto_764764 ?auto_764765 ?auto_764766 ?auto_764763 ?auto_764767 ?auto_764769 ?auto_764768 ?auto_764770 ?auto_764771 ?auto_764772 ?auto_764773 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764890 - SURFACE
      ?auto_764891 - SURFACE
      ?auto_764892 - SURFACE
      ?auto_764889 - SURFACE
      ?auto_764893 - SURFACE
      ?auto_764895 - SURFACE
      ?auto_764894 - SURFACE
      ?auto_764896 - SURFACE
      ?auto_764897 - SURFACE
      ?auto_764898 - SURFACE
      ?auto_764899 - SURFACE
    )
    :vars
    (
      ?auto_764903 - HOIST
      ?auto_764901 - PLACE
      ?auto_764902 - PLACE
      ?auto_764900 - HOIST
      ?auto_764905 - SURFACE
      ?auto_764904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764903 ?auto_764901 ) ( IS-CRATE ?auto_764899 ) ( not ( = ?auto_764898 ?auto_764899 ) ) ( not ( = ?auto_764897 ?auto_764898 ) ) ( not ( = ?auto_764897 ?auto_764899 ) ) ( not ( = ?auto_764902 ?auto_764901 ) ) ( HOIST-AT ?auto_764900 ?auto_764902 ) ( not ( = ?auto_764903 ?auto_764900 ) ) ( AVAILABLE ?auto_764900 ) ( SURFACE-AT ?auto_764899 ?auto_764902 ) ( ON ?auto_764899 ?auto_764905 ) ( CLEAR ?auto_764899 ) ( not ( = ?auto_764898 ?auto_764905 ) ) ( not ( = ?auto_764899 ?auto_764905 ) ) ( not ( = ?auto_764897 ?auto_764905 ) ) ( TRUCK-AT ?auto_764904 ?auto_764901 ) ( SURFACE-AT ?auto_764897 ?auto_764901 ) ( CLEAR ?auto_764897 ) ( LIFTING ?auto_764903 ?auto_764898 ) ( IS-CRATE ?auto_764898 ) ( ON ?auto_764891 ?auto_764890 ) ( ON ?auto_764892 ?auto_764891 ) ( ON ?auto_764889 ?auto_764892 ) ( ON ?auto_764893 ?auto_764889 ) ( ON ?auto_764895 ?auto_764893 ) ( ON ?auto_764894 ?auto_764895 ) ( ON ?auto_764896 ?auto_764894 ) ( ON ?auto_764897 ?auto_764896 ) ( not ( = ?auto_764890 ?auto_764891 ) ) ( not ( = ?auto_764890 ?auto_764892 ) ) ( not ( = ?auto_764890 ?auto_764889 ) ) ( not ( = ?auto_764890 ?auto_764893 ) ) ( not ( = ?auto_764890 ?auto_764895 ) ) ( not ( = ?auto_764890 ?auto_764894 ) ) ( not ( = ?auto_764890 ?auto_764896 ) ) ( not ( = ?auto_764890 ?auto_764897 ) ) ( not ( = ?auto_764890 ?auto_764898 ) ) ( not ( = ?auto_764890 ?auto_764899 ) ) ( not ( = ?auto_764890 ?auto_764905 ) ) ( not ( = ?auto_764891 ?auto_764892 ) ) ( not ( = ?auto_764891 ?auto_764889 ) ) ( not ( = ?auto_764891 ?auto_764893 ) ) ( not ( = ?auto_764891 ?auto_764895 ) ) ( not ( = ?auto_764891 ?auto_764894 ) ) ( not ( = ?auto_764891 ?auto_764896 ) ) ( not ( = ?auto_764891 ?auto_764897 ) ) ( not ( = ?auto_764891 ?auto_764898 ) ) ( not ( = ?auto_764891 ?auto_764899 ) ) ( not ( = ?auto_764891 ?auto_764905 ) ) ( not ( = ?auto_764892 ?auto_764889 ) ) ( not ( = ?auto_764892 ?auto_764893 ) ) ( not ( = ?auto_764892 ?auto_764895 ) ) ( not ( = ?auto_764892 ?auto_764894 ) ) ( not ( = ?auto_764892 ?auto_764896 ) ) ( not ( = ?auto_764892 ?auto_764897 ) ) ( not ( = ?auto_764892 ?auto_764898 ) ) ( not ( = ?auto_764892 ?auto_764899 ) ) ( not ( = ?auto_764892 ?auto_764905 ) ) ( not ( = ?auto_764889 ?auto_764893 ) ) ( not ( = ?auto_764889 ?auto_764895 ) ) ( not ( = ?auto_764889 ?auto_764894 ) ) ( not ( = ?auto_764889 ?auto_764896 ) ) ( not ( = ?auto_764889 ?auto_764897 ) ) ( not ( = ?auto_764889 ?auto_764898 ) ) ( not ( = ?auto_764889 ?auto_764899 ) ) ( not ( = ?auto_764889 ?auto_764905 ) ) ( not ( = ?auto_764893 ?auto_764895 ) ) ( not ( = ?auto_764893 ?auto_764894 ) ) ( not ( = ?auto_764893 ?auto_764896 ) ) ( not ( = ?auto_764893 ?auto_764897 ) ) ( not ( = ?auto_764893 ?auto_764898 ) ) ( not ( = ?auto_764893 ?auto_764899 ) ) ( not ( = ?auto_764893 ?auto_764905 ) ) ( not ( = ?auto_764895 ?auto_764894 ) ) ( not ( = ?auto_764895 ?auto_764896 ) ) ( not ( = ?auto_764895 ?auto_764897 ) ) ( not ( = ?auto_764895 ?auto_764898 ) ) ( not ( = ?auto_764895 ?auto_764899 ) ) ( not ( = ?auto_764895 ?auto_764905 ) ) ( not ( = ?auto_764894 ?auto_764896 ) ) ( not ( = ?auto_764894 ?auto_764897 ) ) ( not ( = ?auto_764894 ?auto_764898 ) ) ( not ( = ?auto_764894 ?auto_764899 ) ) ( not ( = ?auto_764894 ?auto_764905 ) ) ( not ( = ?auto_764896 ?auto_764897 ) ) ( not ( = ?auto_764896 ?auto_764898 ) ) ( not ( = ?auto_764896 ?auto_764899 ) ) ( not ( = ?auto_764896 ?auto_764905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764897 ?auto_764898 ?auto_764899 )
      ( MAKE-10CRATE-VERIFY ?auto_764890 ?auto_764891 ?auto_764892 ?auto_764889 ?auto_764893 ?auto_764895 ?auto_764894 ?auto_764896 ?auto_764897 ?auto_764898 ?auto_764899 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_765016 - SURFACE
      ?auto_765017 - SURFACE
      ?auto_765018 - SURFACE
      ?auto_765015 - SURFACE
      ?auto_765019 - SURFACE
      ?auto_765021 - SURFACE
      ?auto_765020 - SURFACE
      ?auto_765022 - SURFACE
      ?auto_765023 - SURFACE
      ?auto_765024 - SURFACE
      ?auto_765025 - SURFACE
    )
    :vars
    (
      ?auto_765029 - HOIST
      ?auto_765030 - PLACE
      ?auto_765028 - PLACE
      ?auto_765027 - HOIST
      ?auto_765026 - SURFACE
      ?auto_765031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_765029 ?auto_765030 ) ( IS-CRATE ?auto_765025 ) ( not ( = ?auto_765024 ?auto_765025 ) ) ( not ( = ?auto_765023 ?auto_765024 ) ) ( not ( = ?auto_765023 ?auto_765025 ) ) ( not ( = ?auto_765028 ?auto_765030 ) ) ( HOIST-AT ?auto_765027 ?auto_765028 ) ( not ( = ?auto_765029 ?auto_765027 ) ) ( AVAILABLE ?auto_765027 ) ( SURFACE-AT ?auto_765025 ?auto_765028 ) ( ON ?auto_765025 ?auto_765026 ) ( CLEAR ?auto_765025 ) ( not ( = ?auto_765024 ?auto_765026 ) ) ( not ( = ?auto_765025 ?auto_765026 ) ) ( not ( = ?auto_765023 ?auto_765026 ) ) ( TRUCK-AT ?auto_765031 ?auto_765030 ) ( SURFACE-AT ?auto_765023 ?auto_765030 ) ( CLEAR ?auto_765023 ) ( IS-CRATE ?auto_765024 ) ( AVAILABLE ?auto_765029 ) ( IN ?auto_765024 ?auto_765031 ) ( ON ?auto_765017 ?auto_765016 ) ( ON ?auto_765018 ?auto_765017 ) ( ON ?auto_765015 ?auto_765018 ) ( ON ?auto_765019 ?auto_765015 ) ( ON ?auto_765021 ?auto_765019 ) ( ON ?auto_765020 ?auto_765021 ) ( ON ?auto_765022 ?auto_765020 ) ( ON ?auto_765023 ?auto_765022 ) ( not ( = ?auto_765016 ?auto_765017 ) ) ( not ( = ?auto_765016 ?auto_765018 ) ) ( not ( = ?auto_765016 ?auto_765015 ) ) ( not ( = ?auto_765016 ?auto_765019 ) ) ( not ( = ?auto_765016 ?auto_765021 ) ) ( not ( = ?auto_765016 ?auto_765020 ) ) ( not ( = ?auto_765016 ?auto_765022 ) ) ( not ( = ?auto_765016 ?auto_765023 ) ) ( not ( = ?auto_765016 ?auto_765024 ) ) ( not ( = ?auto_765016 ?auto_765025 ) ) ( not ( = ?auto_765016 ?auto_765026 ) ) ( not ( = ?auto_765017 ?auto_765018 ) ) ( not ( = ?auto_765017 ?auto_765015 ) ) ( not ( = ?auto_765017 ?auto_765019 ) ) ( not ( = ?auto_765017 ?auto_765021 ) ) ( not ( = ?auto_765017 ?auto_765020 ) ) ( not ( = ?auto_765017 ?auto_765022 ) ) ( not ( = ?auto_765017 ?auto_765023 ) ) ( not ( = ?auto_765017 ?auto_765024 ) ) ( not ( = ?auto_765017 ?auto_765025 ) ) ( not ( = ?auto_765017 ?auto_765026 ) ) ( not ( = ?auto_765018 ?auto_765015 ) ) ( not ( = ?auto_765018 ?auto_765019 ) ) ( not ( = ?auto_765018 ?auto_765021 ) ) ( not ( = ?auto_765018 ?auto_765020 ) ) ( not ( = ?auto_765018 ?auto_765022 ) ) ( not ( = ?auto_765018 ?auto_765023 ) ) ( not ( = ?auto_765018 ?auto_765024 ) ) ( not ( = ?auto_765018 ?auto_765025 ) ) ( not ( = ?auto_765018 ?auto_765026 ) ) ( not ( = ?auto_765015 ?auto_765019 ) ) ( not ( = ?auto_765015 ?auto_765021 ) ) ( not ( = ?auto_765015 ?auto_765020 ) ) ( not ( = ?auto_765015 ?auto_765022 ) ) ( not ( = ?auto_765015 ?auto_765023 ) ) ( not ( = ?auto_765015 ?auto_765024 ) ) ( not ( = ?auto_765015 ?auto_765025 ) ) ( not ( = ?auto_765015 ?auto_765026 ) ) ( not ( = ?auto_765019 ?auto_765021 ) ) ( not ( = ?auto_765019 ?auto_765020 ) ) ( not ( = ?auto_765019 ?auto_765022 ) ) ( not ( = ?auto_765019 ?auto_765023 ) ) ( not ( = ?auto_765019 ?auto_765024 ) ) ( not ( = ?auto_765019 ?auto_765025 ) ) ( not ( = ?auto_765019 ?auto_765026 ) ) ( not ( = ?auto_765021 ?auto_765020 ) ) ( not ( = ?auto_765021 ?auto_765022 ) ) ( not ( = ?auto_765021 ?auto_765023 ) ) ( not ( = ?auto_765021 ?auto_765024 ) ) ( not ( = ?auto_765021 ?auto_765025 ) ) ( not ( = ?auto_765021 ?auto_765026 ) ) ( not ( = ?auto_765020 ?auto_765022 ) ) ( not ( = ?auto_765020 ?auto_765023 ) ) ( not ( = ?auto_765020 ?auto_765024 ) ) ( not ( = ?auto_765020 ?auto_765025 ) ) ( not ( = ?auto_765020 ?auto_765026 ) ) ( not ( = ?auto_765022 ?auto_765023 ) ) ( not ( = ?auto_765022 ?auto_765024 ) ) ( not ( = ?auto_765022 ?auto_765025 ) ) ( not ( = ?auto_765022 ?auto_765026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_765023 ?auto_765024 ?auto_765025 )
      ( MAKE-10CRATE-VERIFY ?auto_765016 ?auto_765017 ?auto_765018 ?auto_765015 ?auto_765019 ?auto_765021 ?auto_765020 ?auto_765022 ?auto_765023 ?auto_765024 ?auto_765025 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772300 - SURFACE
      ?auto_772301 - SURFACE
      ?auto_772302 - SURFACE
      ?auto_772299 - SURFACE
      ?auto_772303 - SURFACE
      ?auto_772305 - SURFACE
      ?auto_772304 - SURFACE
      ?auto_772306 - SURFACE
      ?auto_772307 - SURFACE
      ?auto_772308 - SURFACE
      ?auto_772309 - SURFACE
      ?auto_772310 - SURFACE
    )
    :vars
    (
      ?auto_772311 - HOIST
      ?auto_772312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772311 ?auto_772312 ) ( SURFACE-AT ?auto_772309 ?auto_772312 ) ( CLEAR ?auto_772309 ) ( LIFTING ?auto_772311 ?auto_772310 ) ( IS-CRATE ?auto_772310 ) ( not ( = ?auto_772309 ?auto_772310 ) ) ( ON ?auto_772301 ?auto_772300 ) ( ON ?auto_772302 ?auto_772301 ) ( ON ?auto_772299 ?auto_772302 ) ( ON ?auto_772303 ?auto_772299 ) ( ON ?auto_772305 ?auto_772303 ) ( ON ?auto_772304 ?auto_772305 ) ( ON ?auto_772306 ?auto_772304 ) ( ON ?auto_772307 ?auto_772306 ) ( ON ?auto_772308 ?auto_772307 ) ( ON ?auto_772309 ?auto_772308 ) ( not ( = ?auto_772300 ?auto_772301 ) ) ( not ( = ?auto_772300 ?auto_772302 ) ) ( not ( = ?auto_772300 ?auto_772299 ) ) ( not ( = ?auto_772300 ?auto_772303 ) ) ( not ( = ?auto_772300 ?auto_772305 ) ) ( not ( = ?auto_772300 ?auto_772304 ) ) ( not ( = ?auto_772300 ?auto_772306 ) ) ( not ( = ?auto_772300 ?auto_772307 ) ) ( not ( = ?auto_772300 ?auto_772308 ) ) ( not ( = ?auto_772300 ?auto_772309 ) ) ( not ( = ?auto_772300 ?auto_772310 ) ) ( not ( = ?auto_772301 ?auto_772302 ) ) ( not ( = ?auto_772301 ?auto_772299 ) ) ( not ( = ?auto_772301 ?auto_772303 ) ) ( not ( = ?auto_772301 ?auto_772305 ) ) ( not ( = ?auto_772301 ?auto_772304 ) ) ( not ( = ?auto_772301 ?auto_772306 ) ) ( not ( = ?auto_772301 ?auto_772307 ) ) ( not ( = ?auto_772301 ?auto_772308 ) ) ( not ( = ?auto_772301 ?auto_772309 ) ) ( not ( = ?auto_772301 ?auto_772310 ) ) ( not ( = ?auto_772302 ?auto_772299 ) ) ( not ( = ?auto_772302 ?auto_772303 ) ) ( not ( = ?auto_772302 ?auto_772305 ) ) ( not ( = ?auto_772302 ?auto_772304 ) ) ( not ( = ?auto_772302 ?auto_772306 ) ) ( not ( = ?auto_772302 ?auto_772307 ) ) ( not ( = ?auto_772302 ?auto_772308 ) ) ( not ( = ?auto_772302 ?auto_772309 ) ) ( not ( = ?auto_772302 ?auto_772310 ) ) ( not ( = ?auto_772299 ?auto_772303 ) ) ( not ( = ?auto_772299 ?auto_772305 ) ) ( not ( = ?auto_772299 ?auto_772304 ) ) ( not ( = ?auto_772299 ?auto_772306 ) ) ( not ( = ?auto_772299 ?auto_772307 ) ) ( not ( = ?auto_772299 ?auto_772308 ) ) ( not ( = ?auto_772299 ?auto_772309 ) ) ( not ( = ?auto_772299 ?auto_772310 ) ) ( not ( = ?auto_772303 ?auto_772305 ) ) ( not ( = ?auto_772303 ?auto_772304 ) ) ( not ( = ?auto_772303 ?auto_772306 ) ) ( not ( = ?auto_772303 ?auto_772307 ) ) ( not ( = ?auto_772303 ?auto_772308 ) ) ( not ( = ?auto_772303 ?auto_772309 ) ) ( not ( = ?auto_772303 ?auto_772310 ) ) ( not ( = ?auto_772305 ?auto_772304 ) ) ( not ( = ?auto_772305 ?auto_772306 ) ) ( not ( = ?auto_772305 ?auto_772307 ) ) ( not ( = ?auto_772305 ?auto_772308 ) ) ( not ( = ?auto_772305 ?auto_772309 ) ) ( not ( = ?auto_772305 ?auto_772310 ) ) ( not ( = ?auto_772304 ?auto_772306 ) ) ( not ( = ?auto_772304 ?auto_772307 ) ) ( not ( = ?auto_772304 ?auto_772308 ) ) ( not ( = ?auto_772304 ?auto_772309 ) ) ( not ( = ?auto_772304 ?auto_772310 ) ) ( not ( = ?auto_772306 ?auto_772307 ) ) ( not ( = ?auto_772306 ?auto_772308 ) ) ( not ( = ?auto_772306 ?auto_772309 ) ) ( not ( = ?auto_772306 ?auto_772310 ) ) ( not ( = ?auto_772307 ?auto_772308 ) ) ( not ( = ?auto_772307 ?auto_772309 ) ) ( not ( = ?auto_772307 ?auto_772310 ) ) ( not ( = ?auto_772308 ?auto_772309 ) ) ( not ( = ?auto_772308 ?auto_772310 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_772309 ?auto_772310 )
      ( MAKE-11CRATE-VERIFY ?auto_772300 ?auto_772301 ?auto_772302 ?auto_772299 ?auto_772303 ?auto_772305 ?auto_772304 ?auto_772306 ?auto_772307 ?auto_772308 ?auto_772309 ?auto_772310 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772409 - SURFACE
      ?auto_772410 - SURFACE
      ?auto_772411 - SURFACE
      ?auto_772408 - SURFACE
      ?auto_772412 - SURFACE
      ?auto_772414 - SURFACE
      ?auto_772413 - SURFACE
      ?auto_772415 - SURFACE
      ?auto_772416 - SURFACE
      ?auto_772417 - SURFACE
      ?auto_772418 - SURFACE
      ?auto_772419 - SURFACE
    )
    :vars
    (
      ?auto_772421 - HOIST
      ?auto_772420 - PLACE
      ?auto_772422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772421 ?auto_772420 ) ( SURFACE-AT ?auto_772418 ?auto_772420 ) ( CLEAR ?auto_772418 ) ( IS-CRATE ?auto_772419 ) ( not ( = ?auto_772418 ?auto_772419 ) ) ( TRUCK-AT ?auto_772422 ?auto_772420 ) ( AVAILABLE ?auto_772421 ) ( IN ?auto_772419 ?auto_772422 ) ( ON ?auto_772418 ?auto_772417 ) ( not ( = ?auto_772417 ?auto_772418 ) ) ( not ( = ?auto_772417 ?auto_772419 ) ) ( ON ?auto_772410 ?auto_772409 ) ( ON ?auto_772411 ?auto_772410 ) ( ON ?auto_772408 ?auto_772411 ) ( ON ?auto_772412 ?auto_772408 ) ( ON ?auto_772414 ?auto_772412 ) ( ON ?auto_772413 ?auto_772414 ) ( ON ?auto_772415 ?auto_772413 ) ( ON ?auto_772416 ?auto_772415 ) ( ON ?auto_772417 ?auto_772416 ) ( not ( = ?auto_772409 ?auto_772410 ) ) ( not ( = ?auto_772409 ?auto_772411 ) ) ( not ( = ?auto_772409 ?auto_772408 ) ) ( not ( = ?auto_772409 ?auto_772412 ) ) ( not ( = ?auto_772409 ?auto_772414 ) ) ( not ( = ?auto_772409 ?auto_772413 ) ) ( not ( = ?auto_772409 ?auto_772415 ) ) ( not ( = ?auto_772409 ?auto_772416 ) ) ( not ( = ?auto_772409 ?auto_772417 ) ) ( not ( = ?auto_772409 ?auto_772418 ) ) ( not ( = ?auto_772409 ?auto_772419 ) ) ( not ( = ?auto_772410 ?auto_772411 ) ) ( not ( = ?auto_772410 ?auto_772408 ) ) ( not ( = ?auto_772410 ?auto_772412 ) ) ( not ( = ?auto_772410 ?auto_772414 ) ) ( not ( = ?auto_772410 ?auto_772413 ) ) ( not ( = ?auto_772410 ?auto_772415 ) ) ( not ( = ?auto_772410 ?auto_772416 ) ) ( not ( = ?auto_772410 ?auto_772417 ) ) ( not ( = ?auto_772410 ?auto_772418 ) ) ( not ( = ?auto_772410 ?auto_772419 ) ) ( not ( = ?auto_772411 ?auto_772408 ) ) ( not ( = ?auto_772411 ?auto_772412 ) ) ( not ( = ?auto_772411 ?auto_772414 ) ) ( not ( = ?auto_772411 ?auto_772413 ) ) ( not ( = ?auto_772411 ?auto_772415 ) ) ( not ( = ?auto_772411 ?auto_772416 ) ) ( not ( = ?auto_772411 ?auto_772417 ) ) ( not ( = ?auto_772411 ?auto_772418 ) ) ( not ( = ?auto_772411 ?auto_772419 ) ) ( not ( = ?auto_772408 ?auto_772412 ) ) ( not ( = ?auto_772408 ?auto_772414 ) ) ( not ( = ?auto_772408 ?auto_772413 ) ) ( not ( = ?auto_772408 ?auto_772415 ) ) ( not ( = ?auto_772408 ?auto_772416 ) ) ( not ( = ?auto_772408 ?auto_772417 ) ) ( not ( = ?auto_772408 ?auto_772418 ) ) ( not ( = ?auto_772408 ?auto_772419 ) ) ( not ( = ?auto_772412 ?auto_772414 ) ) ( not ( = ?auto_772412 ?auto_772413 ) ) ( not ( = ?auto_772412 ?auto_772415 ) ) ( not ( = ?auto_772412 ?auto_772416 ) ) ( not ( = ?auto_772412 ?auto_772417 ) ) ( not ( = ?auto_772412 ?auto_772418 ) ) ( not ( = ?auto_772412 ?auto_772419 ) ) ( not ( = ?auto_772414 ?auto_772413 ) ) ( not ( = ?auto_772414 ?auto_772415 ) ) ( not ( = ?auto_772414 ?auto_772416 ) ) ( not ( = ?auto_772414 ?auto_772417 ) ) ( not ( = ?auto_772414 ?auto_772418 ) ) ( not ( = ?auto_772414 ?auto_772419 ) ) ( not ( = ?auto_772413 ?auto_772415 ) ) ( not ( = ?auto_772413 ?auto_772416 ) ) ( not ( = ?auto_772413 ?auto_772417 ) ) ( not ( = ?auto_772413 ?auto_772418 ) ) ( not ( = ?auto_772413 ?auto_772419 ) ) ( not ( = ?auto_772415 ?auto_772416 ) ) ( not ( = ?auto_772415 ?auto_772417 ) ) ( not ( = ?auto_772415 ?auto_772418 ) ) ( not ( = ?auto_772415 ?auto_772419 ) ) ( not ( = ?auto_772416 ?auto_772417 ) ) ( not ( = ?auto_772416 ?auto_772418 ) ) ( not ( = ?auto_772416 ?auto_772419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772417 ?auto_772418 ?auto_772419 )
      ( MAKE-11CRATE-VERIFY ?auto_772409 ?auto_772410 ?auto_772411 ?auto_772408 ?auto_772412 ?auto_772414 ?auto_772413 ?auto_772415 ?auto_772416 ?auto_772417 ?auto_772418 ?auto_772419 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772530 - SURFACE
      ?auto_772531 - SURFACE
      ?auto_772532 - SURFACE
      ?auto_772529 - SURFACE
      ?auto_772533 - SURFACE
      ?auto_772535 - SURFACE
      ?auto_772534 - SURFACE
      ?auto_772536 - SURFACE
      ?auto_772537 - SURFACE
      ?auto_772538 - SURFACE
      ?auto_772539 - SURFACE
      ?auto_772540 - SURFACE
    )
    :vars
    (
      ?auto_772542 - HOIST
      ?auto_772541 - PLACE
      ?auto_772543 - TRUCK
      ?auto_772544 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772542 ?auto_772541 ) ( SURFACE-AT ?auto_772539 ?auto_772541 ) ( CLEAR ?auto_772539 ) ( IS-CRATE ?auto_772540 ) ( not ( = ?auto_772539 ?auto_772540 ) ) ( AVAILABLE ?auto_772542 ) ( IN ?auto_772540 ?auto_772543 ) ( ON ?auto_772539 ?auto_772538 ) ( not ( = ?auto_772538 ?auto_772539 ) ) ( not ( = ?auto_772538 ?auto_772540 ) ) ( TRUCK-AT ?auto_772543 ?auto_772544 ) ( not ( = ?auto_772544 ?auto_772541 ) ) ( ON ?auto_772531 ?auto_772530 ) ( ON ?auto_772532 ?auto_772531 ) ( ON ?auto_772529 ?auto_772532 ) ( ON ?auto_772533 ?auto_772529 ) ( ON ?auto_772535 ?auto_772533 ) ( ON ?auto_772534 ?auto_772535 ) ( ON ?auto_772536 ?auto_772534 ) ( ON ?auto_772537 ?auto_772536 ) ( ON ?auto_772538 ?auto_772537 ) ( not ( = ?auto_772530 ?auto_772531 ) ) ( not ( = ?auto_772530 ?auto_772532 ) ) ( not ( = ?auto_772530 ?auto_772529 ) ) ( not ( = ?auto_772530 ?auto_772533 ) ) ( not ( = ?auto_772530 ?auto_772535 ) ) ( not ( = ?auto_772530 ?auto_772534 ) ) ( not ( = ?auto_772530 ?auto_772536 ) ) ( not ( = ?auto_772530 ?auto_772537 ) ) ( not ( = ?auto_772530 ?auto_772538 ) ) ( not ( = ?auto_772530 ?auto_772539 ) ) ( not ( = ?auto_772530 ?auto_772540 ) ) ( not ( = ?auto_772531 ?auto_772532 ) ) ( not ( = ?auto_772531 ?auto_772529 ) ) ( not ( = ?auto_772531 ?auto_772533 ) ) ( not ( = ?auto_772531 ?auto_772535 ) ) ( not ( = ?auto_772531 ?auto_772534 ) ) ( not ( = ?auto_772531 ?auto_772536 ) ) ( not ( = ?auto_772531 ?auto_772537 ) ) ( not ( = ?auto_772531 ?auto_772538 ) ) ( not ( = ?auto_772531 ?auto_772539 ) ) ( not ( = ?auto_772531 ?auto_772540 ) ) ( not ( = ?auto_772532 ?auto_772529 ) ) ( not ( = ?auto_772532 ?auto_772533 ) ) ( not ( = ?auto_772532 ?auto_772535 ) ) ( not ( = ?auto_772532 ?auto_772534 ) ) ( not ( = ?auto_772532 ?auto_772536 ) ) ( not ( = ?auto_772532 ?auto_772537 ) ) ( not ( = ?auto_772532 ?auto_772538 ) ) ( not ( = ?auto_772532 ?auto_772539 ) ) ( not ( = ?auto_772532 ?auto_772540 ) ) ( not ( = ?auto_772529 ?auto_772533 ) ) ( not ( = ?auto_772529 ?auto_772535 ) ) ( not ( = ?auto_772529 ?auto_772534 ) ) ( not ( = ?auto_772529 ?auto_772536 ) ) ( not ( = ?auto_772529 ?auto_772537 ) ) ( not ( = ?auto_772529 ?auto_772538 ) ) ( not ( = ?auto_772529 ?auto_772539 ) ) ( not ( = ?auto_772529 ?auto_772540 ) ) ( not ( = ?auto_772533 ?auto_772535 ) ) ( not ( = ?auto_772533 ?auto_772534 ) ) ( not ( = ?auto_772533 ?auto_772536 ) ) ( not ( = ?auto_772533 ?auto_772537 ) ) ( not ( = ?auto_772533 ?auto_772538 ) ) ( not ( = ?auto_772533 ?auto_772539 ) ) ( not ( = ?auto_772533 ?auto_772540 ) ) ( not ( = ?auto_772535 ?auto_772534 ) ) ( not ( = ?auto_772535 ?auto_772536 ) ) ( not ( = ?auto_772535 ?auto_772537 ) ) ( not ( = ?auto_772535 ?auto_772538 ) ) ( not ( = ?auto_772535 ?auto_772539 ) ) ( not ( = ?auto_772535 ?auto_772540 ) ) ( not ( = ?auto_772534 ?auto_772536 ) ) ( not ( = ?auto_772534 ?auto_772537 ) ) ( not ( = ?auto_772534 ?auto_772538 ) ) ( not ( = ?auto_772534 ?auto_772539 ) ) ( not ( = ?auto_772534 ?auto_772540 ) ) ( not ( = ?auto_772536 ?auto_772537 ) ) ( not ( = ?auto_772536 ?auto_772538 ) ) ( not ( = ?auto_772536 ?auto_772539 ) ) ( not ( = ?auto_772536 ?auto_772540 ) ) ( not ( = ?auto_772537 ?auto_772538 ) ) ( not ( = ?auto_772537 ?auto_772539 ) ) ( not ( = ?auto_772537 ?auto_772540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772538 ?auto_772539 ?auto_772540 )
      ( MAKE-11CRATE-VERIFY ?auto_772530 ?auto_772531 ?auto_772532 ?auto_772529 ?auto_772533 ?auto_772535 ?auto_772534 ?auto_772536 ?auto_772537 ?auto_772538 ?auto_772539 ?auto_772540 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772662 - SURFACE
      ?auto_772663 - SURFACE
      ?auto_772664 - SURFACE
      ?auto_772661 - SURFACE
      ?auto_772665 - SURFACE
      ?auto_772667 - SURFACE
      ?auto_772666 - SURFACE
      ?auto_772668 - SURFACE
      ?auto_772669 - SURFACE
      ?auto_772670 - SURFACE
      ?auto_772671 - SURFACE
      ?auto_772672 - SURFACE
    )
    :vars
    (
      ?auto_772673 - HOIST
      ?auto_772674 - PLACE
      ?auto_772675 - TRUCK
      ?auto_772677 - PLACE
      ?auto_772676 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_772673 ?auto_772674 ) ( SURFACE-AT ?auto_772671 ?auto_772674 ) ( CLEAR ?auto_772671 ) ( IS-CRATE ?auto_772672 ) ( not ( = ?auto_772671 ?auto_772672 ) ) ( AVAILABLE ?auto_772673 ) ( ON ?auto_772671 ?auto_772670 ) ( not ( = ?auto_772670 ?auto_772671 ) ) ( not ( = ?auto_772670 ?auto_772672 ) ) ( TRUCK-AT ?auto_772675 ?auto_772677 ) ( not ( = ?auto_772677 ?auto_772674 ) ) ( HOIST-AT ?auto_772676 ?auto_772677 ) ( LIFTING ?auto_772676 ?auto_772672 ) ( not ( = ?auto_772673 ?auto_772676 ) ) ( ON ?auto_772663 ?auto_772662 ) ( ON ?auto_772664 ?auto_772663 ) ( ON ?auto_772661 ?auto_772664 ) ( ON ?auto_772665 ?auto_772661 ) ( ON ?auto_772667 ?auto_772665 ) ( ON ?auto_772666 ?auto_772667 ) ( ON ?auto_772668 ?auto_772666 ) ( ON ?auto_772669 ?auto_772668 ) ( ON ?auto_772670 ?auto_772669 ) ( not ( = ?auto_772662 ?auto_772663 ) ) ( not ( = ?auto_772662 ?auto_772664 ) ) ( not ( = ?auto_772662 ?auto_772661 ) ) ( not ( = ?auto_772662 ?auto_772665 ) ) ( not ( = ?auto_772662 ?auto_772667 ) ) ( not ( = ?auto_772662 ?auto_772666 ) ) ( not ( = ?auto_772662 ?auto_772668 ) ) ( not ( = ?auto_772662 ?auto_772669 ) ) ( not ( = ?auto_772662 ?auto_772670 ) ) ( not ( = ?auto_772662 ?auto_772671 ) ) ( not ( = ?auto_772662 ?auto_772672 ) ) ( not ( = ?auto_772663 ?auto_772664 ) ) ( not ( = ?auto_772663 ?auto_772661 ) ) ( not ( = ?auto_772663 ?auto_772665 ) ) ( not ( = ?auto_772663 ?auto_772667 ) ) ( not ( = ?auto_772663 ?auto_772666 ) ) ( not ( = ?auto_772663 ?auto_772668 ) ) ( not ( = ?auto_772663 ?auto_772669 ) ) ( not ( = ?auto_772663 ?auto_772670 ) ) ( not ( = ?auto_772663 ?auto_772671 ) ) ( not ( = ?auto_772663 ?auto_772672 ) ) ( not ( = ?auto_772664 ?auto_772661 ) ) ( not ( = ?auto_772664 ?auto_772665 ) ) ( not ( = ?auto_772664 ?auto_772667 ) ) ( not ( = ?auto_772664 ?auto_772666 ) ) ( not ( = ?auto_772664 ?auto_772668 ) ) ( not ( = ?auto_772664 ?auto_772669 ) ) ( not ( = ?auto_772664 ?auto_772670 ) ) ( not ( = ?auto_772664 ?auto_772671 ) ) ( not ( = ?auto_772664 ?auto_772672 ) ) ( not ( = ?auto_772661 ?auto_772665 ) ) ( not ( = ?auto_772661 ?auto_772667 ) ) ( not ( = ?auto_772661 ?auto_772666 ) ) ( not ( = ?auto_772661 ?auto_772668 ) ) ( not ( = ?auto_772661 ?auto_772669 ) ) ( not ( = ?auto_772661 ?auto_772670 ) ) ( not ( = ?auto_772661 ?auto_772671 ) ) ( not ( = ?auto_772661 ?auto_772672 ) ) ( not ( = ?auto_772665 ?auto_772667 ) ) ( not ( = ?auto_772665 ?auto_772666 ) ) ( not ( = ?auto_772665 ?auto_772668 ) ) ( not ( = ?auto_772665 ?auto_772669 ) ) ( not ( = ?auto_772665 ?auto_772670 ) ) ( not ( = ?auto_772665 ?auto_772671 ) ) ( not ( = ?auto_772665 ?auto_772672 ) ) ( not ( = ?auto_772667 ?auto_772666 ) ) ( not ( = ?auto_772667 ?auto_772668 ) ) ( not ( = ?auto_772667 ?auto_772669 ) ) ( not ( = ?auto_772667 ?auto_772670 ) ) ( not ( = ?auto_772667 ?auto_772671 ) ) ( not ( = ?auto_772667 ?auto_772672 ) ) ( not ( = ?auto_772666 ?auto_772668 ) ) ( not ( = ?auto_772666 ?auto_772669 ) ) ( not ( = ?auto_772666 ?auto_772670 ) ) ( not ( = ?auto_772666 ?auto_772671 ) ) ( not ( = ?auto_772666 ?auto_772672 ) ) ( not ( = ?auto_772668 ?auto_772669 ) ) ( not ( = ?auto_772668 ?auto_772670 ) ) ( not ( = ?auto_772668 ?auto_772671 ) ) ( not ( = ?auto_772668 ?auto_772672 ) ) ( not ( = ?auto_772669 ?auto_772670 ) ) ( not ( = ?auto_772669 ?auto_772671 ) ) ( not ( = ?auto_772669 ?auto_772672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772670 ?auto_772671 ?auto_772672 )
      ( MAKE-11CRATE-VERIFY ?auto_772662 ?auto_772663 ?auto_772664 ?auto_772661 ?auto_772665 ?auto_772667 ?auto_772666 ?auto_772668 ?auto_772669 ?auto_772670 ?auto_772671 ?auto_772672 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772805 - SURFACE
      ?auto_772806 - SURFACE
      ?auto_772807 - SURFACE
      ?auto_772804 - SURFACE
      ?auto_772808 - SURFACE
      ?auto_772810 - SURFACE
      ?auto_772809 - SURFACE
      ?auto_772811 - SURFACE
      ?auto_772812 - SURFACE
      ?auto_772813 - SURFACE
      ?auto_772814 - SURFACE
      ?auto_772815 - SURFACE
    )
    :vars
    (
      ?auto_772818 - HOIST
      ?auto_772819 - PLACE
      ?auto_772817 - TRUCK
      ?auto_772820 - PLACE
      ?auto_772821 - HOIST
      ?auto_772816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772818 ?auto_772819 ) ( SURFACE-AT ?auto_772814 ?auto_772819 ) ( CLEAR ?auto_772814 ) ( IS-CRATE ?auto_772815 ) ( not ( = ?auto_772814 ?auto_772815 ) ) ( AVAILABLE ?auto_772818 ) ( ON ?auto_772814 ?auto_772813 ) ( not ( = ?auto_772813 ?auto_772814 ) ) ( not ( = ?auto_772813 ?auto_772815 ) ) ( TRUCK-AT ?auto_772817 ?auto_772820 ) ( not ( = ?auto_772820 ?auto_772819 ) ) ( HOIST-AT ?auto_772821 ?auto_772820 ) ( not ( = ?auto_772818 ?auto_772821 ) ) ( AVAILABLE ?auto_772821 ) ( SURFACE-AT ?auto_772815 ?auto_772820 ) ( ON ?auto_772815 ?auto_772816 ) ( CLEAR ?auto_772815 ) ( not ( = ?auto_772814 ?auto_772816 ) ) ( not ( = ?auto_772815 ?auto_772816 ) ) ( not ( = ?auto_772813 ?auto_772816 ) ) ( ON ?auto_772806 ?auto_772805 ) ( ON ?auto_772807 ?auto_772806 ) ( ON ?auto_772804 ?auto_772807 ) ( ON ?auto_772808 ?auto_772804 ) ( ON ?auto_772810 ?auto_772808 ) ( ON ?auto_772809 ?auto_772810 ) ( ON ?auto_772811 ?auto_772809 ) ( ON ?auto_772812 ?auto_772811 ) ( ON ?auto_772813 ?auto_772812 ) ( not ( = ?auto_772805 ?auto_772806 ) ) ( not ( = ?auto_772805 ?auto_772807 ) ) ( not ( = ?auto_772805 ?auto_772804 ) ) ( not ( = ?auto_772805 ?auto_772808 ) ) ( not ( = ?auto_772805 ?auto_772810 ) ) ( not ( = ?auto_772805 ?auto_772809 ) ) ( not ( = ?auto_772805 ?auto_772811 ) ) ( not ( = ?auto_772805 ?auto_772812 ) ) ( not ( = ?auto_772805 ?auto_772813 ) ) ( not ( = ?auto_772805 ?auto_772814 ) ) ( not ( = ?auto_772805 ?auto_772815 ) ) ( not ( = ?auto_772805 ?auto_772816 ) ) ( not ( = ?auto_772806 ?auto_772807 ) ) ( not ( = ?auto_772806 ?auto_772804 ) ) ( not ( = ?auto_772806 ?auto_772808 ) ) ( not ( = ?auto_772806 ?auto_772810 ) ) ( not ( = ?auto_772806 ?auto_772809 ) ) ( not ( = ?auto_772806 ?auto_772811 ) ) ( not ( = ?auto_772806 ?auto_772812 ) ) ( not ( = ?auto_772806 ?auto_772813 ) ) ( not ( = ?auto_772806 ?auto_772814 ) ) ( not ( = ?auto_772806 ?auto_772815 ) ) ( not ( = ?auto_772806 ?auto_772816 ) ) ( not ( = ?auto_772807 ?auto_772804 ) ) ( not ( = ?auto_772807 ?auto_772808 ) ) ( not ( = ?auto_772807 ?auto_772810 ) ) ( not ( = ?auto_772807 ?auto_772809 ) ) ( not ( = ?auto_772807 ?auto_772811 ) ) ( not ( = ?auto_772807 ?auto_772812 ) ) ( not ( = ?auto_772807 ?auto_772813 ) ) ( not ( = ?auto_772807 ?auto_772814 ) ) ( not ( = ?auto_772807 ?auto_772815 ) ) ( not ( = ?auto_772807 ?auto_772816 ) ) ( not ( = ?auto_772804 ?auto_772808 ) ) ( not ( = ?auto_772804 ?auto_772810 ) ) ( not ( = ?auto_772804 ?auto_772809 ) ) ( not ( = ?auto_772804 ?auto_772811 ) ) ( not ( = ?auto_772804 ?auto_772812 ) ) ( not ( = ?auto_772804 ?auto_772813 ) ) ( not ( = ?auto_772804 ?auto_772814 ) ) ( not ( = ?auto_772804 ?auto_772815 ) ) ( not ( = ?auto_772804 ?auto_772816 ) ) ( not ( = ?auto_772808 ?auto_772810 ) ) ( not ( = ?auto_772808 ?auto_772809 ) ) ( not ( = ?auto_772808 ?auto_772811 ) ) ( not ( = ?auto_772808 ?auto_772812 ) ) ( not ( = ?auto_772808 ?auto_772813 ) ) ( not ( = ?auto_772808 ?auto_772814 ) ) ( not ( = ?auto_772808 ?auto_772815 ) ) ( not ( = ?auto_772808 ?auto_772816 ) ) ( not ( = ?auto_772810 ?auto_772809 ) ) ( not ( = ?auto_772810 ?auto_772811 ) ) ( not ( = ?auto_772810 ?auto_772812 ) ) ( not ( = ?auto_772810 ?auto_772813 ) ) ( not ( = ?auto_772810 ?auto_772814 ) ) ( not ( = ?auto_772810 ?auto_772815 ) ) ( not ( = ?auto_772810 ?auto_772816 ) ) ( not ( = ?auto_772809 ?auto_772811 ) ) ( not ( = ?auto_772809 ?auto_772812 ) ) ( not ( = ?auto_772809 ?auto_772813 ) ) ( not ( = ?auto_772809 ?auto_772814 ) ) ( not ( = ?auto_772809 ?auto_772815 ) ) ( not ( = ?auto_772809 ?auto_772816 ) ) ( not ( = ?auto_772811 ?auto_772812 ) ) ( not ( = ?auto_772811 ?auto_772813 ) ) ( not ( = ?auto_772811 ?auto_772814 ) ) ( not ( = ?auto_772811 ?auto_772815 ) ) ( not ( = ?auto_772811 ?auto_772816 ) ) ( not ( = ?auto_772812 ?auto_772813 ) ) ( not ( = ?auto_772812 ?auto_772814 ) ) ( not ( = ?auto_772812 ?auto_772815 ) ) ( not ( = ?auto_772812 ?auto_772816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772813 ?auto_772814 ?auto_772815 )
      ( MAKE-11CRATE-VERIFY ?auto_772805 ?auto_772806 ?auto_772807 ?auto_772804 ?auto_772808 ?auto_772810 ?auto_772809 ?auto_772811 ?auto_772812 ?auto_772813 ?auto_772814 ?auto_772815 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772949 - SURFACE
      ?auto_772950 - SURFACE
      ?auto_772951 - SURFACE
      ?auto_772948 - SURFACE
      ?auto_772952 - SURFACE
      ?auto_772954 - SURFACE
      ?auto_772953 - SURFACE
      ?auto_772955 - SURFACE
      ?auto_772956 - SURFACE
      ?auto_772957 - SURFACE
      ?auto_772958 - SURFACE
      ?auto_772959 - SURFACE
    )
    :vars
    (
      ?auto_772961 - HOIST
      ?auto_772962 - PLACE
      ?auto_772964 - PLACE
      ?auto_772965 - HOIST
      ?auto_772960 - SURFACE
      ?auto_772963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772961 ?auto_772962 ) ( SURFACE-AT ?auto_772958 ?auto_772962 ) ( CLEAR ?auto_772958 ) ( IS-CRATE ?auto_772959 ) ( not ( = ?auto_772958 ?auto_772959 ) ) ( AVAILABLE ?auto_772961 ) ( ON ?auto_772958 ?auto_772957 ) ( not ( = ?auto_772957 ?auto_772958 ) ) ( not ( = ?auto_772957 ?auto_772959 ) ) ( not ( = ?auto_772964 ?auto_772962 ) ) ( HOIST-AT ?auto_772965 ?auto_772964 ) ( not ( = ?auto_772961 ?auto_772965 ) ) ( AVAILABLE ?auto_772965 ) ( SURFACE-AT ?auto_772959 ?auto_772964 ) ( ON ?auto_772959 ?auto_772960 ) ( CLEAR ?auto_772959 ) ( not ( = ?auto_772958 ?auto_772960 ) ) ( not ( = ?auto_772959 ?auto_772960 ) ) ( not ( = ?auto_772957 ?auto_772960 ) ) ( TRUCK-AT ?auto_772963 ?auto_772962 ) ( ON ?auto_772950 ?auto_772949 ) ( ON ?auto_772951 ?auto_772950 ) ( ON ?auto_772948 ?auto_772951 ) ( ON ?auto_772952 ?auto_772948 ) ( ON ?auto_772954 ?auto_772952 ) ( ON ?auto_772953 ?auto_772954 ) ( ON ?auto_772955 ?auto_772953 ) ( ON ?auto_772956 ?auto_772955 ) ( ON ?auto_772957 ?auto_772956 ) ( not ( = ?auto_772949 ?auto_772950 ) ) ( not ( = ?auto_772949 ?auto_772951 ) ) ( not ( = ?auto_772949 ?auto_772948 ) ) ( not ( = ?auto_772949 ?auto_772952 ) ) ( not ( = ?auto_772949 ?auto_772954 ) ) ( not ( = ?auto_772949 ?auto_772953 ) ) ( not ( = ?auto_772949 ?auto_772955 ) ) ( not ( = ?auto_772949 ?auto_772956 ) ) ( not ( = ?auto_772949 ?auto_772957 ) ) ( not ( = ?auto_772949 ?auto_772958 ) ) ( not ( = ?auto_772949 ?auto_772959 ) ) ( not ( = ?auto_772949 ?auto_772960 ) ) ( not ( = ?auto_772950 ?auto_772951 ) ) ( not ( = ?auto_772950 ?auto_772948 ) ) ( not ( = ?auto_772950 ?auto_772952 ) ) ( not ( = ?auto_772950 ?auto_772954 ) ) ( not ( = ?auto_772950 ?auto_772953 ) ) ( not ( = ?auto_772950 ?auto_772955 ) ) ( not ( = ?auto_772950 ?auto_772956 ) ) ( not ( = ?auto_772950 ?auto_772957 ) ) ( not ( = ?auto_772950 ?auto_772958 ) ) ( not ( = ?auto_772950 ?auto_772959 ) ) ( not ( = ?auto_772950 ?auto_772960 ) ) ( not ( = ?auto_772951 ?auto_772948 ) ) ( not ( = ?auto_772951 ?auto_772952 ) ) ( not ( = ?auto_772951 ?auto_772954 ) ) ( not ( = ?auto_772951 ?auto_772953 ) ) ( not ( = ?auto_772951 ?auto_772955 ) ) ( not ( = ?auto_772951 ?auto_772956 ) ) ( not ( = ?auto_772951 ?auto_772957 ) ) ( not ( = ?auto_772951 ?auto_772958 ) ) ( not ( = ?auto_772951 ?auto_772959 ) ) ( not ( = ?auto_772951 ?auto_772960 ) ) ( not ( = ?auto_772948 ?auto_772952 ) ) ( not ( = ?auto_772948 ?auto_772954 ) ) ( not ( = ?auto_772948 ?auto_772953 ) ) ( not ( = ?auto_772948 ?auto_772955 ) ) ( not ( = ?auto_772948 ?auto_772956 ) ) ( not ( = ?auto_772948 ?auto_772957 ) ) ( not ( = ?auto_772948 ?auto_772958 ) ) ( not ( = ?auto_772948 ?auto_772959 ) ) ( not ( = ?auto_772948 ?auto_772960 ) ) ( not ( = ?auto_772952 ?auto_772954 ) ) ( not ( = ?auto_772952 ?auto_772953 ) ) ( not ( = ?auto_772952 ?auto_772955 ) ) ( not ( = ?auto_772952 ?auto_772956 ) ) ( not ( = ?auto_772952 ?auto_772957 ) ) ( not ( = ?auto_772952 ?auto_772958 ) ) ( not ( = ?auto_772952 ?auto_772959 ) ) ( not ( = ?auto_772952 ?auto_772960 ) ) ( not ( = ?auto_772954 ?auto_772953 ) ) ( not ( = ?auto_772954 ?auto_772955 ) ) ( not ( = ?auto_772954 ?auto_772956 ) ) ( not ( = ?auto_772954 ?auto_772957 ) ) ( not ( = ?auto_772954 ?auto_772958 ) ) ( not ( = ?auto_772954 ?auto_772959 ) ) ( not ( = ?auto_772954 ?auto_772960 ) ) ( not ( = ?auto_772953 ?auto_772955 ) ) ( not ( = ?auto_772953 ?auto_772956 ) ) ( not ( = ?auto_772953 ?auto_772957 ) ) ( not ( = ?auto_772953 ?auto_772958 ) ) ( not ( = ?auto_772953 ?auto_772959 ) ) ( not ( = ?auto_772953 ?auto_772960 ) ) ( not ( = ?auto_772955 ?auto_772956 ) ) ( not ( = ?auto_772955 ?auto_772957 ) ) ( not ( = ?auto_772955 ?auto_772958 ) ) ( not ( = ?auto_772955 ?auto_772959 ) ) ( not ( = ?auto_772955 ?auto_772960 ) ) ( not ( = ?auto_772956 ?auto_772957 ) ) ( not ( = ?auto_772956 ?auto_772958 ) ) ( not ( = ?auto_772956 ?auto_772959 ) ) ( not ( = ?auto_772956 ?auto_772960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772957 ?auto_772958 ?auto_772959 )
      ( MAKE-11CRATE-VERIFY ?auto_772949 ?auto_772950 ?auto_772951 ?auto_772948 ?auto_772952 ?auto_772954 ?auto_772953 ?auto_772955 ?auto_772956 ?auto_772957 ?auto_772958 ?auto_772959 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_773093 - SURFACE
      ?auto_773094 - SURFACE
      ?auto_773095 - SURFACE
      ?auto_773092 - SURFACE
      ?auto_773096 - SURFACE
      ?auto_773098 - SURFACE
      ?auto_773097 - SURFACE
      ?auto_773099 - SURFACE
      ?auto_773100 - SURFACE
      ?auto_773101 - SURFACE
      ?auto_773102 - SURFACE
      ?auto_773103 - SURFACE
    )
    :vars
    (
      ?auto_773105 - HOIST
      ?auto_773106 - PLACE
      ?auto_773104 - PLACE
      ?auto_773107 - HOIST
      ?auto_773108 - SURFACE
      ?auto_773109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_773105 ?auto_773106 ) ( IS-CRATE ?auto_773103 ) ( not ( = ?auto_773102 ?auto_773103 ) ) ( not ( = ?auto_773101 ?auto_773102 ) ) ( not ( = ?auto_773101 ?auto_773103 ) ) ( not ( = ?auto_773104 ?auto_773106 ) ) ( HOIST-AT ?auto_773107 ?auto_773104 ) ( not ( = ?auto_773105 ?auto_773107 ) ) ( AVAILABLE ?auto_773107 ) ( SURFACE-AT ?auto_773103 ?auto_773104 ) ( ON ?auto_773103 ?auto_773108 ) ( CLEAR ?auto_773103 ) ( not ( = ?auto_773102 ?auto_773108 ) ) ( not ( = ?auto_773103 ?auto_773108 ) ) ( not ( = ?auto_773101 ?auto_773108 ) ) ( TRUCK-AT ?auto_773109 ?auto_773106 ) ( SURFACE-AT ?auto_773101 ?auto_773106 ) ( CLEAR ?auto_773101 ) ( LIFTING ?auto_773105 ?auto_773102 ) ( IS-CRATE ?auto_773102 ) ( ON ?auto_773094 ?auto_773093 ) ( ON ?auto_773095 ?auto_773094 ) ( ON ?auto_773092 ?auto_773095 ) ( ON ?auto_773096 ?auto_773092 ) ( ON ?auto_773098 ?auto_773096 ) ( ON ?auto_773097 ?auto_773098 ) ( ON ?auto_773099 ?auto_773097 ) ( ON ?auto_773100 ?auto_773099 ) ( ON ?auto_773101 ?auto_773100 ) ( not ( = ?auto_773093 ?auto_773094 ) ) ( not ( = ?auto_773093 ?auto_773095 ) ) ( not ( = ?auto_773093 ?auto_773092 ) ) ( not ( = ?auto_773093 ?auto_773096 ) ) ( not ( = ?auto_773093 ?auto_773098 ) ) ( not ( = ?auto_773093 ?auto_773097 ) ) ( not ( = ?auto_773093 ?auto_773099 ) ) ( not ( = ?auto_773093 ?auto_773100 ) ) ( not ( = ?auto_773093 ?auto_773101 ) ) ( not ( = ?auto_773093 ?auto_773102 ) ) ( not ( = ?auto_773093 ?auto_773103 ) ) ( not ( = ?auto_773093 ?auto_773108 ) ) ( not ( = ?auto_773094 ?auto_773095 ) ) ( not ( = ?auto_773094 ?auto_773092 ) ) ( not ( = ?auto_773094 ?auto_773096 ) ) ( not ( = ?auto_773094 ?auto_773098 ) ) ( not ( = ?auto_773094 ?auto_773097 ) ) ( not ( = ?auto_773094 ?auto_773099 ) ) ( not ( = ?auto_773094 ?auto_773100 ) ) ( not ( = ?auto_773094 ?auto_773101 ) ) ( not ( = ?auto_773094 ?auto_773102 ) ) ( not ( = ?auto_773094 ?auto_773103 ) ) ( not ( = ?auto_773094 ?auto_773108 ) ) ( not ( = ?auto_773095 ?auto_773092 ) ) ( not ( = ?auto_773095 ?auto_773096 ) ) ( not ( = ?auto_773095 ?auto_773098 ) ) ( not ( = ?auto_773095 ?auto_773097 ) ) ( not ( = ?auto_773095 ?auto_773099 ) ) ( not ( = ?auto_773095 ?auto_773100 ) ) ( not ( = ?auto_773095 ?auto_773101 ) ) ( not ( = ?auto_773095 ?auto_773102 ) ) ( not ( = ?auto_773095 ?auto_773103 ) ) ( not ( = ?auto_773095 ?auto_773108 ) ) ( not ( = ?auto_773092 ?auto_773096 ) ) ( not ( = ?auto_773092 ?auto_773098 ) ) ( not ( = ?auto_773092 ?auto_773097 ) ) ( not ( = ?auto_773092 ?auto_773099 ) ) ( not ( = ?auto_773092 ?auto_773100 ) ) ( not ( = ?auto_773092 ?auto_773101 ) ) ( not ( = ?auto_773092 ?auto_773102 ) ) ( not ( = ?auto_773092 ?auto_773103 ) ) ( not ( = ?auto_773092 ?auto_773108 ) ) ( not ( = ?auto_773096 ?auto_773098 ) ) ( not ( = ?auto_773096 ?auto_773097 ) ) ( not ( = ?auto_773096 ?auto_773099 ) ) ( not ( = ?auto_773096 ?auto_773100 ) ) ( not ( = ?auto_773096 ?auto_773101 ) ) ( not ( = ?auto_773096 ?auto_773102 ) ) ( not ( = ?auto_773096 ?auto_773103 ) ) ( not ( = ?auto_773096 ?auto_773108 ) ) ( not ( = ?auto_773098 ?auto_773097 ) ) ( not ( = ?auto_773098 ?auto_773099 ) ) ( not ( = ?auto_773098 ?auto_773100 ) ) ( not ( = ?auto_773098 ?auto_773101 ) ) ( not ( = ?auto_773098 ?auto_773102 ) ) ( not ( = ?auto_773098 ?auto_773103 ) ) ( not ( = ?auto_773098 ?auto_773108 ) ) ( not ( = ?auto_773097 ?auto_773099 ) ) ( not ( = ?auto_773097 ?auto_773100 ) ) ( not ( = ?auto_773097 ?auto_773101 ) ) ( not ( = ?auto_773097 ?auto_773102 ) ) ( not ( = ?auto_773097 ?auto_773103 ) ) ( not ( = ?auto_773097 ?auto_773108 ) ) ( not ( = ?auto_773099 ?auto_773100 ) ) ( not ( = ?auto_773099 ?auto_773101 ) ) ( not ( = ?auto_773099 ?auto_773102 ) ) ( not ( = ?auto_773099 ?auto_773103 ) ) ( not ( = ?auto_773099 ?auto_773108 ) ) ( not ( = ?auto_773100 ?auto_773101 ) ) ( not ( = ?auto_773100 ?auto_773102 ) ) ( not ( = ?auto_773100 ?auto_773103 ) ) ( not ( = ?auto_773100 ?auto_773108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_773101 ?auto_773102 ?auto_773103 )
      ( MAKE-11CRATE-VERIFY ?auto_773093 ?auto_773094 ?auto_773095 ?auto_773092 ?auto_773096 ?auto_773098 ?auto_773097 ?auto_773099 ?auto_773100 ?auto_773101 ?auto_773102 ?auto_773103 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_773237 - SURFACE
      ?auto_773238 - SURFACE
      ?auto_773239 - SURFACE
      ?auto_773236 - SURFACE
      ?auto_773240 - SURFACE
      ?auto_773242 - SURFACE
      ?auto_773241 - SURFACE
      ?auto_773243 - SURFACE
      ?auto_773244 - SURFACE
      ?auto_773245 - SURFACE
      ?auto_773246 - SURFACE
      ?auto_773247 - SURFACE
    )
    :vars
    (
      ?auto_773250 - HOIST
      ?auto_773252 - PLACE
      ?auto_773251 - PLACE
      ?auto_773249 - HOIST
      ?auto_773248 - SURFACE
      ?auto_773253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_773250 ?auto_773252 ) ( IS-CRATE ?auto_773247 ) ( not ( = ?auto_773246 ?auto_773247 ) ) ( not ( = ?auto_773245 ?auto_773246 ) ) ( not ( = ?auto_773245 ?auto_773247 ) ) ( not ( = ?auto_773251 ?auto_773252 ) ) ( HOIST-AT ?auto_773249 ?auto_773251 ) ( not ( = ?auto_773250 ?auto_773249 ) ) ( AVAILABLE ?auto_773249 ) ( SURFACE-AT ?auto_773247 ?auto_773251 ) ( ON ?auto_773247 ?auto_773248 ) ( CLEAR ?auto_773247 ) ( not ( = ?auto_773246 ?auto_773248 ) ) ( not ( = ?auto_773247 ?auto_773248 ) ) ( not ( = ?auto_773245 ?auto_773248 ) ) ( TRUCK-AT ?auto_773253 ?auto_773252 ) ( SURFACE-AT ?auto_773245 ?auto_773252 ) ( CLEAR ?auto_773245 ) ( IS-CRATE ?auto_773246 ) ( AVAILABLE ?auto_773250 ) ( IN ?auto_773246 ?auto_773253 ) ( ON ?auto_773238 ?auto_773237 ) ( ON ?auto_773239 ?auto_773238 ) ( ON ?auto_773236 ?auto_773239 ) ( ON ?auto_773240 ?auto_773236 ) ( ON ?auto_773242 ?auto_773240 ) ( ON ?auto_773241 ?auto_773242 ) ( ON ?auto_773243 ?auto_773241 ) ( ON ?auto_773244 ?auto_773243 ) ( ON ?auto_773245 ?auto_773244 ) ( not ( = ?auto_773237 ?auto_773238 ) ) ( not ( = ?auto_773237 ?auto_773239 ) ) ( not ( = ?auto_773237 ?auto_773236 ) ) ( not ( = ?auto_773237 ?auto_773240 ) ) ( not ( = ?auto_773237 ?auto_773242 ) ) ( not ( = ?auto_773237 ?auto_773241 ) ) ( not ( = ?auto_773237 ?auto_773243 ) ) ( not ( = ?auto_773237 ?auto_773244 ) ) ( not ( = ?auto_773237 ?auto_773245 ) ) ( not ( = ?auto_773237 ?auto_773246 ) ) ( not ( = ?auto_773237 ?auto_773247 ) ) ( not ( = ?auto_773237 ?auto_773248 ) ) ( not ( = ?auto_773238 ?auto_773239 ) ) ( not ( = ?auto_773238 ?auto_773236 ) ) ( not ( = ?auto_773238 ?auto_773240 ) ) ( not ( = ?auto_773238 ?auto_773242 ) ) ( not ( = ?auto_773238 ?auto_773241 ) ) ( not ( = ?auto_773238 ?auto_773243 ) ) ( not ( = ?auto_773238 ?auto_773244 ) ) ( not ( = ?auto_773238 ?auto_773245 ) ) ( not ( = ?auto_773238 ?auto_773246 ) ) ( not ( = ?auto_773238 ?auto_773247 ) ) ( not ( = ?auto_773238 ?auto_773248 ) ) ( not ( = ?auto_773239 ?auto_773236 ) ) ( not ( = ?auto_773239 ?auto_773240 ) ) ( not ( = ?auto_773239 ?auto_773242 ) ) ( not ( = ?auto_773239 ?auto_773241 ) ) ( not ( = ?auto_773239 ?auto_773243 ) ) ( not ( = ?auto_773239 ?auto_773244 ) ) ( not ( = ?auto_773239 ?auto_773245 ) ) ( not ( = ?auto_773239 ?auto_773246 ) ) ( not ( = ?auto_773239 ?auto_773247 ) ) ( not ( = ?auto_773239 ?auto_773248 ) ) ( not ( = ?auto_773236 ?auto_773240 ) ) ( not ( = ?auto_773236 ?auto_773242 ) ) ( not ( = ?auto_773236 ?auto_773241 ) ) ( not ( = ?auto_773236 ?auto_773243 ) ) ( not ( = ?auto_773236 ?auto_773244 ) ) ( not ( = ?auto_773236 ?auto_773245 ) ) ( not ( = ?auto_773236 ?auto_773246 ) ) ( not ( = ?auto_773236 ?auto_773247 ) ) ( not ( = ?auto_773236 ?auto_773248 ) ) ( not ( = ?auto_773240 ?auto_773242 ) ) ( not ( = ?auto_773240 ?auto_773241 ) ) ( not ( = ?auto_773240 ?auto_773243 ) ) ( not ( = ?auto_773240 ?auto_773244 ) ) ( not ( = ?auto_773240 ?auto_773245 ) ) ( not ( = ?auto_773240 ?auto_773246 ) ) ( not ( = ?auto_773240 ?auto_773247 ) ) ( not ( = ?auto_773240 ?auto_773248 ) ) ( not ( = ?auto_773242 ?auto_773241 ) ) ( not ( = ?auto_773242 ?auto_773243 ) ) ( not ( = ?auto_773242 ?auto_773244 ) ) ( not ( = ?auto_773242 ?auto_773245 ) ) ( not ( = ?auto_773242 ?auto_773246 ) ) ( not ( = ?auto_773242 ?auto_773247 ) ) ( not ( = ?auto_773242 ?auto_773248 ) ) ( not ( = ?auto_773241 ?auto_773243 ) ) ( not ( = ?auto_773241 ?auto_773244 ) ) ( not ( = ?auto_773241 ?auto_773245 ) ) ( not ( = ?auto_773241 ?auto_773246 ) ) ( not ( = ?auto_773241 ?auto_773247 ) ) ( not ( = ?auto_773241 ?auto_773248 ) ) ( not ( = ?auto_773243 ?auto_773244 ) ) ( not ( = ?auto_773243 ?auto_773245 ) ) ( not ( = ?auto_773243 ?auto_773246 ) ) ( not ( = ?auto_773243 ?auto_773247 ) ) ( not ( = ?auto_773243 ?auto_773248 ) ) ( not ( = ?auto_773244 ?auto_773245 ) ) ( not ( = ?auto_773244 ?auto_773246 ) ) ( not ( = ?auto_773244 ?auto_773247 ) ) ( not ( = ?auto_773244 ?auto_773248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_773245 ?auto_773246 ?auto_773247 )
      ( MAKE-11CRATE-VERIFY ?auto_773237 ?auto_773238 ?auto_773239 ?auto_773236 ?auto_773240 ?auto_773242 ?auto_773241 ?auto_773243 ?auto_773244 ?auto_773245 ?auto_773246 ?auto_773247 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782486 - SURFACE
      ?auto_782487 - SURFACE
      ?auto_782488 - SURFACE
      ?auto_782485 - SURFACE
      ?auto_782489 - SURFACE
      ?auto_782491 - SURFACE
      ?auto_782490 - SURFACE
      ?auto_782492 - SURFACE
      ?auto_782493 - SURFACE
      ?auto_782494 - SURFACE
      ?auto_782495 - SURFACE
      ?auto_782496 - SURFACE
      ?auto_782497 - SURFACE
    )
    :vars
    (
      ?auto_782498 - HOIST
      ?auto_782499 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782498 ?auto_782499 ) ( SURFACE-AT ?auto_782496 ?auto_782499 ) ( CLEAR ?auto_782496 ) ( LIFTING ?auto_782498 ?auto_782497 ) ( IS-CRATE ?auto_782497 ) ( not ( = ?auto_782496 ?auto_782497 ) ) ( ON ?auto_782487 ?auto_782486 ) ( ON ?auto_782488 ?auto_782487 ) ( ON ?auto_782485 ?auto_782488 ) ( ON ?auto_782489 ?auto_782485 ) ( ON ?auto_782491 ?auto_782489 ) ( ON ?auto_782490 ?auto_782491 ) ( ON ?auto_782492 ?auto_782490 ) ( ON ?auto_782493 ?auto_782492 ) ( ON ?auto_782494 ?auto_782493 ) ( ON ?auto_782495 ?auto_782494 ) ( ON ?auto_782496 ?auto_782495 ) ( not ( = ?auto_782486 ?auto_782487 ) ) ( not ( = ?auto_782486 ?auto_782488 ) ) ( not ( = ?auto_782486 ?auto_782485 ) ) ( not ( = ?auto_782486 ?auto_782489 ) ) ( not ( = ?auto_782486 ?auto_782491 ) ) ( not ( = ?auto_782486 ?auto_782490 ) ) ( not ( = ?auto_782486 ?auto_782492 ) ) ( not ( = ?auto_782486 ?auto_782493 ) ) ( not ( = ?auto_782486 ?auto_782494 ) ) ( not ( = ?auto_782486 ?auto_782495 ) ) ( not ( = ?auto_782486 ?auto_782496 ) ) ( not ( = ?auto_782486 ?auto_782497 ) ) ( not ( = ?auto_782487 ?auto_782488 ) ) ( not ( = ?auto_782487 ?auto_782485 ) ) ( not ( = ?auto_782487 ?auto_782489 ) ) ( not ( = ?auto_782487 ?auto_782491 ) ) ( not ( = ?auto_782487 ?auto_782490 ) ) ( not ( = ?auto_782487 ?auto_782492 ) ) ( not ( = ?auto_782487 ?auto_782493 ) ) ( not ( = ?auto_782487 ?auto_782494 ) ) ( not ( = ?auto_782487 ?auto_782495 ) ) ( not ( = ?auto_782487 ?auto_782496 ) ) ( not ( = ?auto_782487 ?auto_782497 ) ) ( not ( = ?auto_782488 ?auto_782485 ) ) ( not ( = ?auto_782488 ?auto_782489 ) ) ( not ( = ?auto_782488 ?auto_782491 ) ) ( not ( = ?auto_782488 ?auto_782490 ) ) ( not ( = ?auto_782488 ?auto_782492 ) ) ( not ( = ?auto_782488 ?auto_782493 ) ) ( not ( = ?auto_782488 ?auto_782494 ) ) ( not ( = ?auto_782488 ?auto_782495 ) ) ( not ( = ?auto_782488 ?auto_782496 ) ) ( not ( = ?auto_782488 ?auto_782497 ) ) ( not ( = ?auto_782485 ?auto_782489 ) ) ( not ( = ?auto_782485 ?auto_782491 ) ) ( not ( = ?auto_782485 ?auto_782490 ) ) ( not ( = ?auto_782485 ?auto_782492 ) ) ( not ( = ?auto_782485 ?auto_782493 ) ) ( not ( = ?auto_782485 ?auto_782494 ) ) ( not ( = ?auto_782485 ?auto_782495 ) ) ( not ( = ?auto_782485 ?auto_782496 ) ) ( not ( = ?auto_782485 ?auto_782497 ) ) ( not ( = ?auto_782489 ?auto_782491 ) ) ( not ( = ?auto_782489 ?auto_782490 ) ) ( not ( = ?auto_782489 ?auto_782492 ) ) ( not ( = ?auto_782489 ?auto_782493 ) ) ( not ( = ?auto_782489 ?auto_782494 ) ) ( not ( = ?auto_782489 ?auto_782495 ) ) ( not ( = ?auto_782489 ?auto_782496 ) ) ( not ( = ?auto_782489 ?auto_782497 ) ) ( not ( = ?auto_782491 ?auto_782490 ) ) ( not ( = ?auto_782491 ?auto_782492 ) ) ( not ( = ?auto_782491 ?auto_782493 ) ) ( not ( = ?auto_782491 ?auto_782494 ) ) ( not ( = ?auto_782491 ?auto_782495 ) ) ( not ( = ?auto_782491 ?auto_782496 ) ) ( not ( = ?auto_782491 ?auto_782497 ) ) ( not ( = ?auto_782490 ?auto_782492 ) ) ( not ( = ?auto_782490 ?auto_782493 ) ) ( not ( = ?auto_782490 ?auto_782494 ) ) ( not ( = ?auto_782490 ?auto_782495 ) ) ( not ( = ?auto_782490 ?auto_782496 ) ) ( not ( = ?auto_782490 ?auto_782497 ) ) ( not ( = ?auto_782492 ?auto_782493 ) ) ( not ( = ?auto_782492 ?auto_782494 ) ) ( not ( = ?auto_782492 ?auto_782495 ) ) ( not ( = ?auto_782492 ?auto_782496 ) ) ( not ( = ?auto_782492 ?auto_782497 ) ) ( not ( = ?auto_782493 ?auto_782494 ) ) ( not ( = ?auto_782493 ?auto_782495 ) ) ( not ( = ?auto_782493 ?auto_782496 ) ) ( not ( = ?auto_782493 ?auto_782497 ) ) ( not ( = ?auto_782494 ?auto_782495 ) ) ( not ( = ?auto_782494 ?auto_782496 ) ) ( not ( = ?auto_782494 ?auto_782497 ) ) ( not ( = ?auto_782495 ?auto_782496 ) ) ( not ( = ?auto_782495 ?auto_782497 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_782496 ?auto_782497 )
      ( MAKE-12CRATE-VERIFY ?auto_782486 ?auto_782487 ?auto_782488 ?auto_782485 ?auto_782489 ?auto_782491 ?auto_782490 ?auto_782492 ?auto_782493 ?auto_782494 ?auto_782495 ?auto_782496 ?auto_782497 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782611 - SURFACE
      ?auto_782612 - SURFACE
      ?auto_782613 - SURFACE
      ?auto_782610 - SURFACE
      ?auto_782614 - SURFACE
      ?auto_782616 - SURFACE
      ?auto_782615 - SURFACE
      ?auto_782617 - SURFACE
      ?auto_782618 - SURFACE
      ?auto_782619 - SURFACE
      ?auto_782620 - SURFACE
      ?auto_782621 - SURFACE
      ?auto_782622 - SURFACE
    )
    :vars
    (
      ?auto_782623 - HOIST
      ?auto_782624 - PLACE
      ?auto_782625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_782623 ?auto_782624 ) ( SURFACE-AT ?auto_782621 ?auto_782624 ) ( CLEAR ?auto_782621 ) ( IS-CRATE ?auto_782622 ) ( not ( = ?auto_782621 ?auto_782622 ) ) ( TRUCK-AT ?auto_782625 ?auto_782624 ) ( AVAILABLE ?auto_782623 ) ( IN ?auto_782622 ?auto_782625 ) ( ON ?auto_782621 ?auto_782620 ) ( not ( = ?auto_782620 ?auto_782621 ) ) ( not ( = ?auto_782620 ?auto_782622 ) ) ( ON ?auto_782612 ?auto_782611 ) ( ON ?auto_782613 ?auto_782612 ) ( ON ?auto_782610 ?auto_782613 ) ( ON ?auto_782614 ?auto_782610 ) ( ON ?auto_782616 ?auto_782614 ) ( ON ?auto_782615 ?auto_782616 ) ( ON ?auto_782617 ?auto_782615 ) ( ON ?auto_782618 ?auto_782617 ) ( ON ?auto_782619 ?auto_782618 ) ( ON ?auto_782620 ?auto_782619 ) ( not ( = ?auto_782611 ?auto_782612 ) ) ( not ( = ?auto_782611 ?auto_782613 ) ) ( not ( = ?auto_782611 ?auto_782610 ) ) ( not ( = ?auto_782611 ?auto_782614 ) ) ( not ( = ?auto_782611 ?auto_782616 ) ) ( not ( = ?auto_782611 ?auto_782615 ) ) ( not ( = ?auto_782611 ?auto_782617 ) ) ( not ( = ?auto_782611 ?auto_782618 ) ) ( not ( = ?auto_782611 ?auto_782619 ) ) ( not ( = ?auto_782611 ?auto_782620 ) ) ( not ( = ?auto_782611 ?auto_782621 ) ) ( not ( = ?auto_782611 ?auto_782622 ) ) ( not ( = ?auto_782612 ?auto_782613 ) ) ( not ( = ?auto_782612 ?auto_782610 ) ) ( not ( = ?auto_782612 ?auto_782614 ) ) ( not ( = ?auto_782612 ?auto_782616 ) ) ( not ( = ?auto_782612 ?auto_782615 ) ) ( not ( = ?auto_782612 ?auto_782617 ) ) ( not ( = ?auto_782612 ?auto_782618 ) ) ( not ( = ?auto_782612 ?auto_782619 ) ) ( not ( = ?auto_782612 ?auto_782620 ) ) ( not ( = ?auto_782612 ?auto_782621 ) ) ( not ( = ?auto_782612 ?auto_782622 ) ) ( not ( = ?auto_782613 ?auto_782610 ) ) ( not ( = ?auto_782613 ?auto_782614 ) ) ( not ( = ?auto_782613 ?auto_782616 ) ) ( not ( = ?auto_782613 ?auto_782615 ) ) ( not ( = ?auto_782613 ?auto_782617 ) ) ( not ( = ?auto_782613 ?auto_782618 ) ) ( not ( = ?auto_782613 ?auto_782619 ) ) ( not ( = ?auto_782613 ?auto_782620 ) ) ( not ( = ?auto_782613 ?auto_782621 ) ) ( not ( = ?auto_782613 ?auto_782622 ) ) ( not ( = ?auto_782610 ?auto_782614 ) ) ( not ( = ?auto_782610 ?auto_782616 ) ) ( not ( = ?auto_782610 ?auto_782615 ) ) ( not ( = ?auto_782610 ?auto_782617 ) ) ( not ( = ?auto_782610 ?auto_782618 ) ) ( not ( = ?auto_782610 ?auto_782619 ) ) ( not ( = ?auto_782610 ?auto_782620 ) ) ( not ( = ?auto_782610 ?auto_782621 ) ) ( not ( = ?auto_782610 ?auto_782622 ) ) ( not ( = ?auto_782614 ?auto_782616 ) ) ( not ( = ?auto_782614 ?auto_782615 ) ) ( not ( = ?auto_782614 ?auto_782617 ) ) ( not ( = ?auto_782614 ?auto_782618 ) ) ( not ( = ?auto_782614 ?auto_782619 ) ) ( not ( = ?auto_782614 ?auto_782620 ) ) ( not ( = ?auto_782614 ?auto_782621 ) ) ( not ( = ?auto_782614 ?auto_782622 ) ) ( not ( = ?auto_782616 ?auto_782615 ) ) ( not ( = ?auto_782616 ?auto_782617 ) ) ( not ( = ?auto_782616 ?auto_782618 ) ) ( not ( = ?auto_782616 ?auto_782619 ) ) ( not ( = ?auto_782616 ?auto_782620 ) ) ( not ( = ?auto_782616 ?auto_782621 ) ) ( not ( = ?auto_782616 ?auto_782622 ) ) ( not ( = ?auto_782615 ?auto_782617 ) ) ( not ( = ?auto_782615 ?auto_782618 ) ) ( not ( = ?auto_782615 ?auto_782619 ) ) ( not ( = ?auto_782615 ?auto_782620 ) ) ( not ( = ?auto_782615 ?auto_782621 ) ) ( not ( = ?auto_782615 ?auto_782622 ) ) ( not ( = ?auto_782617 ?auto_782618 ) ) ( not ( = ?auto_782617 ?auto_782619 ) ) ( not ( = ?auto_782617 ?auto_782620 ) ) ( not ( = ?auto_782617 ?auto_782621 ) ) ( not ( = ?auto_782617 ?auto_782622 ) ) ( not ( = ?auto_782618 ?auto_782619 ) ) ( not ( = ?auto_782618 ?auto_782620 ) ) ( not ( = ?auto_782618 ?auto_782621 ) ) ( not ( = ?auto_782618 ?auto_782622 ) ) ( not ( = ?auto_782619 ?auto_782620 ) ) ( not ( = ?auto_782619 ?auto_782621 ) ) ( not ( = ?auto_782619 ?auto_782622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782620 ?auto_782621 ?auto_782622 )
      ( MAKE-12CRATE-VERIFY ?auto_782611 ?auto_782612 ?auto_782613 ?auto_782610 ?auto_782614 ?auto_782616 ?auto_782615 ?auto_782617 ?auto_782618 ?auto_782619 ?auto_782620 ?auto_782621 ?auto_782622 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782749 - SURFACE
      ?auto_782750 - SURFACE
      ?auto_782751 - SURFACE
      ?auto_782748 - SURFACE
      ?auto_782752 - SURFACE
      ?auto_782754 - SURFACE
      ?auto_782753 - SURFACE
      ?auto_782755 - SURFACE
      ?auto_782756 - SURFACE
      ?auto_782757 - SURFACE
      ?auto_782758 - SURFACE
      ?auto_782759 - SURFACE
      ?auto_782760 - SURFACE
    )
    :vars
    (
      ?auto_782761 - HOIST
      ?auto_782762 - PLACE
      ?auto_782763 - TRUCK
      ?auto_782764 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782761 ?auto_782762 ) ( SURFACE-AT ?auto_782759 ?auto_782762 ) ( CLEAR ?auto_782759 ) ( IS-CRATE ?auto_782760 ) ( not ( = ?auto_782759 ?auto_782760 ) ) ( AVAILABLE ?auto_782761 ) ( IN ?auto_782760 ?auto_782763 ) ( ON ?auto_782759 ?auto_782758 ) ( not ( = ?auto_782758 ?auto_782759 ) ) ( not ( = ?auto_782758 ?auto_782760 ) ) ( TRUCK-AT ?auto_782763 ?auto_782764 ) ( not ( = ?auto_782764 ?auto_782762 ) ) ( ON ?auto_782750 ?auto_782749 ) ( ON ?auto_782751 ?auto_782750 ) ( ON ?auto_782748 ?auto_782751 ) ( ON ?auto_782752 ?auto_782748 ) ( ON ?auto_782754 ?auto_782752 ) ( ON ?auto_782753 ?auto_782754 ) ( ON ?auto_782755 ?auto_782753 ) ( ON ?auto_782756 ?auto_782755 ) ( ON ?auto_782757 ?auto_782756 ) ( ON ?auto_782758 ?auto_782757 ) ( not ( = ?auto_782749 ?auto_782750 ) ) ( not ( = ?auto_782749 ?auto_782751 ) ) ( not ( = ?auto_782749 ?auto_782748 ) ) ( not ( = ?auto_782749 ?auto_782752 ) ) ( not ( = ?auto_782749 ?auto_782754 ) ) ( not ( = ?auto_782749 ?auto_782753 ) ) ( not ( = ?auto_782749 ?auto_782755 ) ) ( not ( = ?auto_782749 ?auto_782756 ) ) ( not ( = ?auto_782749 ?auto_782757 ) ) ( not ( = ?auto_782749 ?auto_782758 ) ) ( not ( = ?auto_782749 ?auto_782759 ) ) ( not ( = ?auto_782749 ?auto_782760 ) ) ( not ( = ?auto_782750 ?auto_782751 ) ) ( not ( = ?auto_782750 ?auto_782748 ) ) ( not ( = ?auto_782750 ?auto_782752 ) ) ( not ( = ?auto_782750 ?auto_782754 ) ) ( not ( = ?auto_782750 ?auto_782753 ) ) ( not ( = ?auto_782750 ?auto_782755 ) ) ( not ( = ?auto_782750 ?auto_782756 ) ) ( not ( = ?auto_782750 ?auto_782757 ) ) ( not ( = ?auto_782750 ?auto_782758 ) ) ( not ( = ?auto_782750 ?auto_782759 ) ) ( not ( = ?auto_782750 ?auto_782760 ) ) ( not ( = ?auto_782751 ?auto_782748 ) ) ( not ( = ?auto_782751 ?auto_782752 ) ) ( not ( = ?auto_782751 ?auto_782754 ) ) ( not ( = ?auto_782751 ?auto_782753 ) ) ( not ( = ?auto_782751 ?auto_782755 ) ) ( not ( = ?auto_782751 ?auto_782756 ) ) ( not ( = ?auto_782751 ?auto_782757 ) ) ( not ( = ?auto_782751 ?auto_782758 ) ) ( not ( = ?auto_782751 ?auto_782759 ) ) ( not ( = ?auto_782751 ?auto_782760 ) ) ( not ( = ?auto_782748 ?auto_782752 ) ) ( not ( = ?auto_782748 ?auto_782754 ) ) ( not ( = ?auto_782748 ?auto_782753 ) ) ( not ( = ?auto_782748 ?auto_782755 ) ) ( not ( = ?auto_782748 ?auto_782756 ) ) ( not ( = ?auto_782748 ?auto_782757 ) ) ( not ( = ?auto_782748 ?auto_782758 ) ) ( not ( = ?auto_782748 ?auto_782759 ) ) ( not ( = ?auto_782748 ?auto_782760 ) ) ( not ( = ?auto_782752 ?auto_782754 ) ) ( not ( = ?auto_782752 ?auto_782753 ) ) ( not ( = ?auto_782752 ?auto_782755 ) ) ( not ( = ?auto_782752 ?auto_782756 ) ) ( not ( = ?auto_782752 ?auto_782757 ) ) ( not ( = ?auto_782752 ?auto_782758 ) ) ( not ( = ?auto_782752 ?auto_782759 ) ) ( not ( = ?auto_782752 ?auto_782760 ) ) ( not ( = ?auto_782754 ?auto_782753 ) ) ( not ( = ?auto_782754 ?auto_782755 ) ) ( not ( = ?auto_782754 ?auto_782756 ) ) ( not ( = ?auto_782754 ?auto_782757 ) ) ( not ( = ?auto_782754 ?auto_782758 ) ) ( not ( = ?auto_782754 ?auto_782759 ) ) ( not ( = ?auto_782754 ?auto_782760 ) ) ( not ( = ?auto_782753 ?auto_782755 ) ) ( not ( = ?auto_782753 ?auto_782756 ) ) ( not ( = ?auto_782753 ?auto_782757 ) ) ( not ( = ?auto_782753 ?auto_782758 ) ) ( not ( = ?auto_782753 ?auto_782759 ) ) ( not ( = ?auto_782753 ?auto_782760 ) ) ( not ( = ?auto_782755 ?auto_782756 ) ) ( not ( = ?auto_782755 ?auto_782757 ) ) ( not ( = ?auto_782755 ?auto_782758 ) ) ( not ( = ?auto_782755 ?auto_782759 ) ) ( not ( = ?auto_782755 ?auto_782760 ) ) ( not ( = ?auto_782756 ?auto_782757 ) ) ( not ( = ?auto_782756 ?auto_782758 ) ) ( not ( = ?auto_782756 ?auto_782759 ) ) ( not ( = ?auto_782756 ?auto_782760 ) ) ( not ( = ?auto_782757 ?auto_782758 ) ) ( not ( = ?auto_782757 ?auto_782759 ) ) ( not ( = ?auto_782757 ?auto_782760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782758 ?auto_782759 ?auto_782760 )
      ( MAKE-12CRATE-VERIFY ?auto_782749 ?auto_782750 ?auto_782751 ?auto_782748 ?auto_782752 ?auto_782754 ?auto_782753 ?auto_782755 ?auto_782756 ?auto_782757 ?auto_782758 ?auto_782759 ?auto_782760 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782899 - SURFACE
      ?auto_782900 - SURFACE
      ?auto_782901 - SURFACE
      ?auto_782898 - SURFACE
      ?auto_782902 - SURFACE
      ?auto_782904 - SURFACE
      ?auto_782903 - SURFACE
      ?auto_782905 - SURFACE
      ?auto_782906 - SURFACE
      ?auto_782907 - SURFACE
      ?auto_782908 - SURFACE
      ?auto_782909 - SURFACE
      ?auto_782910 - SURFACE
    )
    :vars
    (
      ?auto_782913 - HOIST
      ?auto_782915 - PLACE
      ?auto_782912 - TRUCK
      ?auto_782914 - PLACE
      ?auto_782911 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_782913 ?auto_782915 ) ( SURFACE-AT ?auto_782909 ?auto_782915 ) ( CLEAR ?auto_782909 ) ( IS-CRATE ?auto_782910 ) ( not ( = ?auto_782909 ?auto_782910 ) ) ( AVAILABLE ?auto_782913 ) ( ON ?auto_782909 ?auto_782908 ) ( not ( = ?auto_782908 ?auto_782909 ) ) ( not ( = ?auto_782908 ?auto_782910 ) ) ( TRUCK-AT ?auto_782912 ?auto_782914 ) ( not ( = ?auto_782914 ?auto_782915 ) ) ( HOIST-AT ?auto_782911 ?auto_782914 ) ( LIFTING ?auto_782911 ?auto_782910 ) ( not ( = ?auto_782913 ?auto_782911 ) ) ( ON ?auto_782900 ?auto_782899 ) ( ON ?auto_782901 ?auto_782900 ) ( ON ?auto_782898 ?auto_782901 ) ( ON ?auto_782902 ?auto_782898 ) ( ON ?auto_782904 ?auto_782902 ) ( ON ?auto_782903 ?auto_782904 ) ( ON ?auto_782905 ?auto_782903 ) ( ON ?auto_782906 ?auto_782905 ) ( ON ?auto_782907 ?auto_782906 ) ( ON ?auto_782908 ?auto_782907 ) ( not ( = ?auto_782899 ?auto_782900 ) ) ( not ( = ?auto_782899 ?auto_782901 ) ) ( not ( = ?auto_782899 ?auto_782898 ) ) ( not ( = ?auto_782899 ?auto_782902 ) ) ( not ( = ?auto_782899 ?auto_782904 ) ) ( not ( = ?auto_782899 ?auto_782903 ) ) ( not ( = ?auto_782899 ?auto_782905 ) ) ( not ( = ?auto_782899 ?auto_782906 ) ) ( not ( = ?auto_782899 ?auto_782907 ) ) ( not ( = ?auto_782899 ?auto_782908 ) ) ( not ( = ?auto_782899 ?auto_782909 ) ) ( not ( = ?auto_782899 ?auto_782910 ) ) ( not ( = ?auto_782900 ?auto_782901 ) ) ( not ( = ?auto_782900 ?auto_782898 ) ) ( not ( = ?auto_782900 ?auto_782902 ) ) ( not ( = ?auto_782900 ?auto_782904 ) ) ( not ( = ?auto_782900 ?auto_782903 ) ) ( not ( = ?auto_782900 ?auto_782905 ) ) ( not ( = ?auto_782900 ?auto_782906 ) ) ( not ( = ?auto_782900 ?auto_782907 ) ) ( not ( = ?auto_782900 ?auto_782908 ) ) ( not ( = ?auto_782900 ?auto_782909 ) ) ( not ( = ?auto_782900 ?auto_782910 ) ) ( not ( = ?auto_782901 ?auto_782898 ) ) ( not ( = ?auto_782901 ?auto_782902 ) ) ( not ( = ?auto_782901 ?auto_782904 ) ) ( not ( = ?auto_782901 ?auto_782903 ) ) ( not ( = ?auto_782901 ?auto_782905 ) ) ( not ( = ?auto_782901 ?auto_782906 ) ) ( not ( = ?auto_782901 ?auto_782907 ) ) ( not ( = ?auto_782901 ?auto_782908 ) ) ( not ( = ?auto_782901 ?auto_782909 ) ) ( not ( = ?auto_782901 ?auto_782910 ) ) ( not ( = ?auto_782898 ?auto_782902 ) ) ( not ( = ?auto_782898 ?auto_782904 ) ) ( not ( = ?auto_782898 ?auto_782903 ) ) ( not ( = ?auto_782898 ?auto_782905 ) ) ( not ( = ?auto_782898 ?auto_782906 ) ) ( not ( = ?auto_782898 ?auto_782907 ) ) ( not ( = ?auto_782898 ?auto_782908 ) ) ( not ( = ?auto_782898 ?auto_782909 ) ) ( not ( = ?auto_782898 ?auto_782910 ) ) ( not ( = ?auto_782902 ?auto_782904 ) ) ( not ( = ?auto_782902 ?auto_782903 ) ) ( not ( = ?auto_782902 ?auto_782905 ) ) ( not ( = ?auto_782902 ?auto_782906 ) ) ( not ( = ?auto_782902 ?auto_782907 ) ) ( not ( = ?auto_782902 ?auto_782908 ) ) ( not ( = ?auto_782902 ?auto_782909 ) ) ( not ( = ?auto_782902 ?auto_782910 ) ) ( not ( = ?auto_782904 ?auto_782903 ) ) ( not ( = ?auto_782904 ?auto_782905 ) ) ( not ( = ?auto_782904 ?auto_782906 ) ) ( not ( = ?auto_782904 ?auto_782907 ) ) ( not ( = ?auto_782904 ?auto_782908 ) ) ( not ( = ?auto_782904 ?auto_782909 ) ) ( not ( = ?auto_782904 ?auto_782910 ) ) ( not ( = ?auto_782903 ?auto_782905 ) ) ( not ( = ?auto_782903 ?auto_782906 ) ) ( not ( = ?auto_782903 ?auto_782907 ) ) ( not ( = ?auto_782903 ?auto_782908 ) ) ( not ( = ?auto_782903 ?auto_782909 ) ) ( not ( = ?auto_782903 ?auto_782910 ) ) ( not ( = ?auto_782905 ?auto_782906 ) ) ( not ( = ?auto_782905 ?auto_782907 ) ) ( not ( = ?auto_782905 ?auto_782908 ) ) ( not ( = ?auto_782905 ?auto_782909 ) ) ( not ( = ?auto_782905 ?auto_782910 ) ) ( not ( = ?auto_782906 ?auto_782907 ) ) ( not ( = ?auto_782906 ?auto_782908 ) ) ( not ( = ?auto_782906 ?auto_782909 ) ) ( not ( = ?auto_782906 ?auto_782910 ) ) ( not ( = ?auto_782907 ?auto_782908 ) ) ( not ( = ?auto_782907 ?auto_782909 ) ) ( not ( = ?auto_782907 ?auto_782910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782908 ?auto_782909 ?auto_782910 )
      ( MAKE-12CRATE-VERIFY ?auto_782899 ?auto_782900 ?auto_782901 ?auto_782898 ?auto_782902 ?auto_782904 ?auto_782903 ?auto_782905 ?auto_782906 ?auto_782907 ?auto_782908 ?auto_782909 ?auto_782910 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783061 - SURFACE
      ?auto_783062 - SURFACE
      ?auto_783063 - SURFACE
      ?auto_783060 - SURFACE
      ?auto_783064 - SURFACE
      ?auto_783066 - SURFACE
      ?auto_783065 - SURFACE
      ?auto_783067 - SURFACE
      ?auto_783068 - SURFACE
      ?auto_783069 - SURFACE
      ?auto_783070 - SURFACE
      ?auto_783071 - SURFACE
      ?auto_783072 - SURFACE
    )
    :vars
    (
      ?auto_783073 - HOIST
      ?auto_783075 - PLACE
      ?auto_783074 - TRUCK
      ?auto_783078 - PLACE
      ?auto_783077 - HOIST
      ?auto_783076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_783073 ?auto_783075 ) ( SURFACE-AT ?auto_783071 ?auto_783075 ) ( CLEAR ?auto_783071 ) ( IS-CRATE ?auto_783072 ) ( not ( = ?auto_783071 ?auto_783072 ) ) ( AVAILABLE ?auto_783073 ) ( ON ?auto_783071 ?auto_783070 ) ( not ( = ?auto_783070 ?auto_783071 ) ) ( not ( = ?auto_783070 ?auto_783072 ) ) ( TRUCK-AT ?auto_783074 ?auto_783078 ) ( not ( = ?auto_783078 ?auto_783075 ) ) ( HOIST-AT ?auto_783077 ?auto_783078 ) ( not ( = ?auto_783073 ?auto_783077 ) ) ( AVAILABLE ?auto_783077 ) ( SURFACE-AT ?auto_783072 ?auto_783078 ) ( ON ?auto_783072 ?auto_783076 ) ( CLEAR ?auto_783072 ) ( not ( = ?auto_783071 ?auto_783076 ) ) ( not ( = ?auto_783072 ?auto_783076 ) ) ( not ( = ?auto_783070 ?auto_783076 ) ) ( ON ?auto_783062 ?auto_783061 ) ( ON ?auto_783063 ?auto_783062 ) ( ON ?auto_783060 ?auto_783063 ) ( ON ?auto_783064 ?auto_783060 ) ( ON ?auto_783066 ?auto_783064 ) ( ON ?auto_783065 ?auto_783066 ) ( ON ?auto_783067 ?auto_783065 ) ( ON ?auto_783068 ?auto_783067 ) ( ON ?auto_783069 ?auto_783068 ) ( ON ?auto_783070 ?auto_783069 ) ( not ( = ?auto_783061 ?auto_783062 ) ) ( not ( = ?auto_783061 ?auto_783063 ) ) ( not ( = ?auto_783061 ?auto_783060 ) ) ( not ( = ?auto_783061 ?auto_783064 ) ) ( not ( = ?auto_783061 ?auto_783066 ) ) ( not ( = ?auto_783061 ?auto_783065 ) ) ( not ( = ?auto_783061 ?auto_783067 ) ) ( not ( = ?auto_783061 ?auto_783068 ) ) ( not ( = ?auto_783061 ?auto_783069 ) ) ( not ( = ?auto_783061 ?auto_783070 ) ) ( not ( = ?auto_783061 ?auto_783071 ) ) ( not ( = ?auto_783061 ?auto_783072 ) ) ( not ( = ?auto_783061 ?auto_783076 ) ) ( not ( = ?auto_783062 ?auto_783063 ) ) ( not ( = ?auto_783062 ?auto_783060 ) ) ( not ( = ?auto_783062 ?auto_783064 ) ) ( not ( = ?auto_783062 ?auto_783066 ) ) ( not ( = ?auto_783062 ?auto_783065 ) ) ( not ( = ?auto_783062 ?auto_783067 ) ) ( not ( = ?auto_783062 ?auto_783068 ) ) ( not ( = ?auto_783062 ?auto_783069 ) ) ( not ( = ?auto_783062 ?auto_783070 ) ) ( not ( = ?auto_783062 ?auto_783071 ) ) ( not ( = ?auto_783062 ?auto_783072 ) ) ( not ( = ?auto_783062 ?auto_783076 ) ) ( not ( = ?auto_783063 ?auto_783060 ) ) ( not ( = ?auto_783063 ?auto_783064 ) ) ( not ( = ?auto_783063 ?auto_783066 ) ) ( not ( = ?auto_783063 ?auto_783065 ) ) ( not ( = ?auto_783063 ?auto_783067 ) ) ( not ( = ?auto_783063 ?auto_783068 ) ) ( not ( = ?auto_783063 ?auto_783069 ) ) ( not ( = ?auto_783063 ?auto_783070 ) ) ( not ( = ?auto_783063 ?auto_783071 ) ) ( not ( = ?auto_783063 ?auto_783072 ) ) ( not ( = ?auto_783063 ?auto_783076 ) ) ( not ( = ?auto_783060 ?auto_783064 ) ) ( not ( = ?auto_783060 ?auto_783066 ) ) ( not ( = ?auto_783060 ?auto_783065 ) ) ( not ( = ?auto_783060 ?auto_783067 ) ) ( not ( = ?auto_783060 ?auto_783068 ) ) ( not ( = ?auto_783060 ?auto_783069 ) ) ( not ( = ?auto_783060 ?auto_783070 ) ) ( not ( = ?auto_783060 ?auto_783071 ) ) ( not ( = ?auto_783060 ?auto_783072 ) ) ( not ( = ?auto_783060 ?auto_783076 ) ) ( not ( = ?auto_783064 ?auto_783066 ) ) ( not ( = ?auto_783064 ?auto_783065 ) ) ( not ( = ?auto_783064 ?auto_783067 ) ) ( not ( = ?auto_783064 ?auto_783068 ) ) ( not ( = ?auto_783064 ?auto_783069 ) ) ( not ( = ?auto_783064 ?auto_783070 ) ) ( not ( = ?auto_783064 ?auto_783071 ) ) ( not ( = ?auto_783064 ?auto_783072 ) ) ( not ( = ?auto_783064 ?auto_783076 ) ) ( not ( = ?auto_783066 ?auto_783065 ) ) ( not ( = ?auto_783066 ?auto_783067 ) ) ( not ( = ?auto_783066 ?auto_783068 ) ) ( not ( = ?auto_783066 ?auto_783069 ) ) ( not ( = ?auto_783066 ?auto_783070 ) ) ( not ( = ?auto_783066 ?auto_783071 ) ) ( not ( = ?auto_783066 ?auto_783072 ) ) ( not ( = ?auto_783066 ?auto_783076 ) ) ( not ( = ?auto_783065 ?auto_783067 ) ) ( not ( = ?auto_783065 ?auto_783068 ) ) ( not ( = ?auto_783065 ?auto_783069 ) ) ( not ( = ?auto_783065 ?auto_783070 ) ) ( not ( = ?auto_783065 ?auto_783071 ) ) ( not ( = ?auto_783065 ?auto_783072 ) ) ( not ( = ?auto_783065 ?auto_783076 ) ) ( not ( = ?auto_783067 ?auto_783068 ) ) ( not ( = ?auto_783067 ?auto_783069 ) ) ( not ( = ?auto_783067 ?auto_783070 ) ) ( not ( = ?auto_783067 ?auto_783071 ) ) ( not ( = ?auto_783067 ?auto_783072 ) ) ( not ( = ?auto_783067 ?auto_783076 ) ) ( not ( = ?auto_783068 ?auto_783069 ) ) ( not ( = ?auto_783068 ?auto_783070 ) ) ( not ( = ?auto_783068 ?auto_783071 ) ) ( not ( = ?auto_783068 ?auto_783072 ) ) ( not ( = ?auto_783068 ?auto_783076 ) ) ( not ( = ?auto_783069 ?auto_783070 ) ) ( not ( = ?auto_783069 ?auto_783071 ) ) ( not ( = ?auto_783069 ?auto_783072 ) ) ( not ( = ?auto_783069 ?auto_783076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783070 ?auto_783071 ?auto_783072 )
      ( MAKE-12CRATE-VERIFY ?auto_783061 ?auto_783062 ?auto_783063 ?auto_783060 ?auto_783064 ?auto_783066 ?auto_783065 ?auto_783067 ?auto_783068 ?auto_783069 ?auto_783070 ?auto_783071 ?auto_783072 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783224 - SURFACE
      ?auto_783225 - SURFACE
      ?auto_783226 - SURFACE
      ?auto_783223 - SURFACE
      ?auto_783227 - SURFACE
      ?auto_783229 - SURFACE
      ?auto_783228 - SURFACE
      ?auto_783230 - SURFACE
      ?auto_783231 - SURFACE
      ?auto_783232 - SURFACE
      ?auto_783233 - SURFACE
      ?auto_783234 - SURFACE
      ?auto_783235 - SURFACE
    )
    :vars
    (
      ?auto_783237 - HOIST
      ?auto_783239 - PLACE
      ?auto_783238 - PLACE
      ?auto_783240 - HOIST
      ?auto_783241 - SURFACE
      ?auto_783236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783237 ?auto_783239 ) ( SURFACE-AT ?auto_783234 ?auto_783239 ) ( CLEAR ?auto_783234 ) ( IS-CRATE ?auto_783235 ) ( not ( = ?auto_783234 ?auto_783235 ) ) ( AVAILABLE ?auto_783237 ) ( ON ?auto_783234 ?auto_783233 ) ( not ( = ?auto_783233 ?auto_783234 ) ) ( not ( = ?auto_783233 ?auto_783235 ) ) ( not ( = ?auto_783238 ?auto_783239 ) ) ( HOIST-AT ?auto_783240 ?auto_783238 ) ( not ( = ?auto_783237 ?auto_783240 ) ) ( AVAILABLE ?auto_783240 ) ( SURFACE-AT ?auto_783235 ?auto_783238 ) ( ON ?auto_783235 ?auto_783241 ) ( CLEAR ?auto_783235 ) ( not ( = ?auto_783234 ?auto_783241 ) ) ( not ( = ?auto_783235 ?auto_783241 ) ) ( not ( = ?auto_783233 ?auto_783241 ) ) ( TRUCK-AT ?auto_783236 ?auto_783239 ) ( ON ?auto_783225 ?auto_783224 ) ( ON ?auto_783226 ?auto_783225 ) ( ON ?auto_783223 ?auto_783226 ) ( ON ?auto_783227 ?auto_783223 ) ( ON ?auto_783229 ?auto_783227 ) ( ON ?auto_783228 ?auto_783229 ) ( ON ?auto_783230 ?auto_783228 ) ( ON ?auto_783231 ?auto_783230 ) ( ON ?auto_783232 ?auto_783231 ) ( ON ?auto_783233 ?auto_783232 ) ( not ( = ?auto_783224 ?auto_783225 ) ) ( not ( = ?auto_783224 ?auto_783226 ) ) ( not ( = ?auto_783224 ?auto_783223 ) ) ( not ( = ?auto_783224 ?auto_783227 ) ) ( not ( = ?auto_783224 ?auto_783229 ) ) ( not ( = ?auto_783224 ?auto_783228 ) ) ( not ( = ?auto_783224 ?auto_783230 ) ) ( not ( = ?auto_783224 ?auto_783231 ) ) ( not ( = ?auto_783224 ?auto_783232 ) ) ( not ( = ?auto_783224 ?auto_783233 ) ) ( not ( = ?auto_783224 ?auto_783234 ) ) ( not ( = ?auto_783224 ?auto_783235 ) ) ( not ( = ?auto_783224 ?auto_783241 ) ) ( not ( = ?auto_783225 ?auto_783226 ) ) ( not ( = ?auto_783225 ?auto_783223 ) ) ( not ( = ?auto_783225 ?auto_783227 ) ) ( not ( = ?auto_783225 ?auto_783229 ) ) ( not ( = ?auto_783225 ?auto_783228 ) ) ( not ( = ?auto_783225 ?auto_783230 ) ) ( not ( = ?auto_783225 ?auto_783231 ) ) ( not ( = ?auto_783225 ?auto_783232 ) ) ( not ( = ?auto_783225 ?auto_783233 ) ) ( not ( = ?auto_783225 ?auto_783234 ) ) ( not ( = ?auto_783225 ?auto_783235 ) ) ( not ( = ?auto_783225 ?auto_783241 ) ) ( not ( = ?auto_783226 ?auto_783223 ) ) ( not ( = ?auto_783226 ?auto_783227 ) ) ( not ( = ?auto_783226 ?auto_783229 ) ) ( not ( = ?auto_783226 ?auto_783228 ) ) ( not ( = ?auto_783226 ?auto_783230 ) ) ( not ( = ?auto_783226 ?auto_783231 ) ) ( not ( = ?auto_783226 ?auto_783232 ) ) ( not ( = ?auto_783226 ?auto_783233 ) ) ( not ( = ?auto_783226 ?auto_783234 ) ) ( not ( = ?auto_783226 ?auto_783235 ) ) ( not ( = ?auto_783226 ?auto_783241 ) ) ( not ( = ?auto_783223 ?auto_783227 ) ) ( not ( = ?auto_783223 ?auto_783229 ) ) ( not ( = ?auto_783223 ?auto_783228 ) ) ( not ( = ?auto_783223 ?auto_783230 ) ) ( not ( = ?auto_783223 ?auto_783231 ) ) ( not ( = ?auto_783223 ?auto_783232 ) ) ( not ( = ?auto_783223 ?auto_783233 ) ) ( not ( = ?auto_783223 ?auto_783234 ) ) ( not ( = ?auto_783223 ?auto_783235 ) ) ( not ( = ?auto_783223 ?auto_783241 ) ) ( not ( = ?auto_783227 ?auto_783229 ) ) ( not ( = ?auto_783227 ?auto_783228 ) ) ( not ( = ?auto_783227 ?auto_783230 ) ) ( not ( = ?auto_783227 ?auto_783231 ) ) ( not ( = ?auto_783227 ?auto_783232 ) ) ( not ( = ?auto_783227 ?auto_783233 ) ) ( not ( = ?auto_783227 ?auto_783234 ) ) ( not ( = ?auto_783227 ?auto_783235 ) ) ( not ( = ?auto_783227 ?auto_783241 ) ) ( not ( = ?auto_783229 ?auto_783228 ) ) ( not ( = ?auto_783229 ?auto_783230 ) ) ( not ( = ?auto_783229 ?auto_783231 ) ) ( not ( = ?auto_783229 ?auto_783232 ) ) ( not ( = ?auto_783229 ?auto_783233 ) ) ( not ( = ?auto_783229 ?auto_783234 ) ) ( not ( = ?auto_783229 ?auto_783235 ) ) ( not ( = ?auto_783229 ?auto_783241 ) ) ( not ( = ?auto_783228 ?auto_783230 ) ) ( not ( = ?auto_783228 ?auto_783231 ) ) ( not ( = ?auto_783228 ?auto_783232 ) ) ( not ( = ?auto_783228 ?auto_783233 ) ) ( not ( = ?auto_783228 ?auto_783234 ) ) ( not ( = ?auto_783228 ?auto_783235 ) ) ( not ( = ?auto_783228 ?auto_783241 ) ) ( not ( = ?auto_783230 ?auto_783231 ) ) ( not ( = ?auto_783230 ?auto_783232 ) ) ( not ( = ?auto_783230 ?auto_783233 ) ) ( not ( = ?auto_783230 ?auto_783234 ) ) ( not ( = ?auto_783230 ?auto_783235 ) ) ( not ( = ?auto_783230 ?auto_783241 ) ) ( not ( = ?auto_783231 ?auto_783232 ) ) ( not ( = ?auto_783231 ?auto_783233 ) ) ( not ( = ?auto_783231 ?auto_783234 ) ) ( not ( = ?auto_783231 ?auto_783235 ) ) ( not ( = ?auto_783231 ?auto_783241 ) ) ( not ( = ?auto_783232 ?auto_783233 ) ) ( not ( = ?auto_783232 ?auto_783234 ) ) ( not ( = ?auto_783232 ?auto_783235 ) ) ( not ( = ?auto_783232 ?auto_783241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783233 ?auto_783234 ?auto_783235 )
      ( MAKE-12CRATE-VERIFY ?auto_783224 ?auto_783225 ?auto_783226 ?auto_783223 ?auto_783227 ?auto_783229 ?auto_783228 ?auto_783230 ?auto_783231 ?auto_783232 ?auto_783233 ?auto_783234 ?auto_783235 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783387 - SURFACE
      ?auto_783388 - SURFACE
      ?auto_783389 - SURFACE
      ?auto_783386 - SURFACE
      ?auto_783390 - SURFACE
      ?auto_783392 - SURFACE
      ?auto_783391 - SURFACE
      ?auto_783393 - SURFACE
      ?auto_783394 - SURFACE
      ?auto_783395 - SURFACE
      ?auto_783396 - SURFACE
      ?auto_783397 - SURFACE
      ?auto_783398 - SURFACE
    )
    :vars
    (
      ?auto_783401 - HOIST
      ?auto_783399 - PLACE
      ?auto_783404 - PLACE
      ?auto_783400 - HOIST
      ?auto_783403 - SURFACE
      ?auto_783402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783401 ?auto_783399 ) ( IS-CRATE ?auto_783398 ) ( not ( = ?auto_783397 ?auto_783398 ) ) ( not ( = ?auto_783396 ?auto_783397 ) ) ( not ( = ?auto_783396 ?auto_783398 ) ) ( not ( = ?auto_783404 ?auto_783399 ) ) ( HOIST-AT ?auto_783400 ?auto_783404 ) ( not ( = ?auto_783401 ?auto_783400 ) ) ( AVAILABLE ?auto_783400 ) ( SURFACE-AT ?auto_783398 ?auto_783404 ) ( ON ?auto_783398 ?auto_783403 ) ( CLEAR ?auto_783398 ) ( not ( = ?auto_783397 ?auto_783403 ) ) ( not ( = ?auto_783398 ?auto_783403 ) ) ( not ( = ?auto_783396 ?auto_783403 ) ) ( TRUCK-AT ?auto_783402 ?auto_783399 ) ( SURFACE-AT ?auto_783396 ?auto_783399 ) ( CLEAR ?auto_783396 ) ( LIFTING ?auto_783401 ?auto_783397 ) ( IS-CRATE ?auto_783397 ) ( ON ?auto_783388 ?auto_783387 ) ( ON ?auto_783389 ?auto_783388 ) ( ON ?auto_783386 ?auto_783389 ) ( ON ?auto_783390 ?auto_783386 ) ( ON ?auto_783392 ?auto_783390 ) ( ON ?auto_783391 ?auto_783392 ) ( ON ?auto_783393 ?auto_783391 ) ( ON ?auto_783394 ?auto_783393 ) ( ON ?auto_783395 ?auto_783394 ) ( ON ?auto_783396 ?auto_783395 ) ( not ( = ?auto_783387 ?auto_783388 ) ) ( not ( = ?auto_783387 ?auto_783389 ) ) ( not ( = ?auto_783387 ?auto_783386 ) ) ( not ( = ?auto_783387 ?auto_783390 ) ) ( not ( = ?auto_783387 ?auto_783392 ) ) ( not ( = ?auto_783387 ?auto_783391 ) ) ( not ( = ?auto_783387 ?auto_783393 ) ) ( not ( = ?auto_783387 ?auto_783394 ) ) ( not ( = ?auto_783387 ?auto_783395 ) ) ( not ( = ?auto_783387 ?auto_783396 ) ) ( not ( = ?auto_783387 ?auto_783397 ) ) ( not ( = ?auto_783387 ?auto_783398 ) ) ( not ( = ?auto_783387 ?auto_783403 ) ) ( not ( = ?auto_783388 ?auto_783389 ) ) ( not ( = ?auto_783388 ?auto_783386 ) ) ( not ( = ?auto_783388 ?auto_783390 ) ) ( not ( = ?auto_783388 ?auto_783392 ) ) ( not ( = ?auto_783388 ?auto_783391 ) ) ( not ( = ?auto_783388 ?auto_783393 ) ) ( not ( = ?auto_783388 ?auto_783394 ) ) ( not ( = ?auto_783388 ?auto_783395 ) ) ( not ( = ?auto_783388 ?auto_783396 ) ) ( not ( = ?auto_783388 ?auto_783397 ) ) ( not ( = ?auto_783388 ?auto_783398 ) ) ( not ( = ?auto_783388 ?auto_783403 ) ) ( not ( = ?auto_783389 ?auto_783386 ) ) ( not ( = ?auto_783389 ?auto_783390 ) ) ( not ( = ?auto_783389 ?auto_783392 ) ) ( not ( = ?auto_783389 ?auto_783391 ) ) ( not ( = ?auto_783389 ?auto_783393 ) ) ( not ( = ?auto_783389 ?auto_783394 ) ) ( not ( = ?auto_783389 ?auto_783395 ) ) ( not ( = ?auto_783389 ?auto_783396 ) ) ( not ( = ?auto_783389 ?auto_783397 ) ) ( not ( = ?auto_783389 ?auto_783398 ) ) ( not ( = ?auto_783389 ?auto_783403 ) ) ( not ( = ?auto_783386 ?auto_783390 ) ) ( not ( = ?auto_783386 ?auto_783392 ) ) ( not ( = ?auto_783386 ?auto_783391 ) ) ( not ( = ?auto_783386 ?auto_783393 ) ) ( not ( = ?auto_783386 ?auto_783394 ) ) ( not ( = ?auto_783386 ?auto_783395 ) ) ( not ( = ?auto_783386 ?auto_783396 ) ) ( not ( = ?auto_783386 ?auto_783397 ) ) ( not ( = ?auto_783386 ?auto_783398 ) ) ( not ( = ?auto_783386 ?auto_783403 ) ) ( not ( = ?auto_783390 ?auto_783392 ) ) ( not ( = ?auto_783390 ?auto_783391 ) ) ( not ( = ?auto_783390 ?auto_783393 ) ) ( not ( = ?auto_783390 ?auto_783394 ) ) ( not ( = ?auto_783390 ?auto_783395 ) ) ( not ( = ?auto_783390 ?auto_783396 ) ) ( not ( = ?auto_783390 ?auto_783397 ) ) ( not ( = ?auto_783390 ?auto_783398 ) ) ( not ( = ?auto_783390 ?auto_783403 ) ) ( not ( = ?auto_783392 ?auto_783391 ) ) ( not ( = ?auto_783392 ?auto_783393 ) ) ( not ( = ?auto_783392 ?auto_783394 ) ) ( not ( = ?auto_783392 ?auto_783395 ) ) ( not ( = ?auto_783392 ?auto_783396 ) ) ( not ( = ?auto_783392 ?auto_783397 ) ) ( not ( = ?auto_783392 ?auto_783398 ) ) ( not ( = ?auto_783392 ?auto_783403 ) ) ( not ( = ?auto_783391 ?auto_783393 ) ) ( not ( = ?auto_783391 ?auto_783394 ) ) ( not ( = ?auto_783391 ?auto_783395 ) ) ( not ( = ?auto_783391 ?auto_783396 ) ) ( not ( = ?auto_783391 ?auto_783397 ) ) ( not ( = ?auto_783391 ?auto_783398 ) ) ( not ( = ?auto_783391 ?auto_783403 ) ) ( not ( = ?auto_783393 ?auto_783394 ) ) ( not ( = ?auto_783393 ?auto_783395 ) ) ( not ( = ?auto_783393 ?auto_783396 ) ) ( not ( = ?auto_783393 ?auto_783397 ) ) ( not ( = ?auto_783393 ?auto_783398 ) ) ( not ( = ?auto_783393 ?auto_783403 ) ) ( not ( = ?auto_783394 ?auto_783395 ) ) ( not ( = ?auto_783394 ?auto_783396 ) ) ( not ( = ?auto_783394 ?auto_783397 ) ) ( not ( = ?auto_783394 ?auto_783398 ) ) ( not ( = ?auto_783394 ?auto_783403 ) ) ( not ( = ?auto_783395 ?auto_783396 ) ) ( not ( = ?auto_783395 ?auto_783397 ) ) ( not ( = ?auto_783395 ?auto_783398 ) ) ( not ( = ?auto_783395 ?auto_783403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783396 ?auto_783397 ?auto_783398 )
      ( MAKE-12CRATE-VERIFY ?auto_783387 ?auto_783388 ?auto_783389 ?auto_783386 ?auto_783390 ?auto_783392 ?auto_783391 ?auto_783393 ?auto_783394 ?auto_783395 ?auto_783396 ?auto_783397 ?auto_783398 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783550 - SURFACE
      ?auto_783551 - SURFACE
      ?auto_783552 - SURFACE
      ?auto_783549 - SURFACE
      ?auto_783553 - SURFACE
      ?auto_783555 - SURFACE
      ?auto_783554 - SURFACE
      ?auto_783556 - SURFACE
      ?auto_783557 - SURFACE
      ?auto_783558 - SURFACE
      ?auto_783559 - SURFACE
      ?auto_783560 - SURFACE
      ?auto_783561 - SURFACE
    )
    :vars
    (
      ?auto_783564 - HOIST
      ?auto_783565 - PLACE
      ?auto_783562 - PLACE
      ?auto_783563 - HOIST
      ?auto_783567 - SURFACE
      ?auto_783566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783564 ?auto_783565 ) ( IS-CRATE ?auto_783561 ) ( not ( = ?auto_783560 ?auto_783561 ) ) ( not ( = ?auto_783559 ?auto_783560 ) ) ( not ( = ?auto_783559 ?auto_783561 ) ) ( not ( = ?auto_783562 ?auto_783565 ) ) ( HOIST-AT ?auto_783563 ?auto_783562 ) ( not ( = ?auto_783564 ?auto_783563 ) ) ( AVAILABLE ?auto_783563 ) ( SURFACE-AT ?auto_783561 ?auto_783562 ) ( ON ?auto_783561 ?auto_783567 ) ( CLEAR ?auto_783561 ) ( not ( = ?auto_783560 ?auto_783567 ) ) ( not ( = ?auto_783561 ?auto_783567 ) ) ( not ( = ?auto_783559 ?auto_783567 ) ) ( TRUCK-AT ?auto_783566 ?auto_783565 ) ( SURFACE-AT ?auto_783559 ?auto_783565 ) ( CLEAR ?auto_783559 ) ( IS-CRATE ?auto_783560 ) ( AVAILABLE ?auto_783564 ) ( IN ?auto_783560 ?auto_783566 ) ( ON ?auto_783551 ?auto_783550 ) ( ON ?auto_783552 ?auto_783551 ) ( ON ?auto_783549 ?auto_783552 ) ( ON ?auto_783553 ?auto_783549 ) ( ON ?auto_783555 ?auto_783553 ) ( ON ?auto_783554 ?auto_783555 ) ( ON ?auto_783556 ?auto_783554 ) ( ON ?auto_783557 ?auto_783556 ) ( ON ?auto_783558 ?auto_783557 ) ( ON ?auto_783559 ?auto_783558 ) ( not ( = ?auto_783550 ?auto_783551 ) ) ( not ( = ?auto_783550 ?auto_783552 ) ) ( not ( = ?auto_783550 ?auto_783549 ) ) ( not ( = ?auto_783550 ?auto_783553 ) ) ( not ( = ?auto_783550 ?auto_783555 ) ) ( not ( = ?auto_783550 ?auto_783554 ) ) ( not ( = ?auto_783550 ?auto_783556 ) ) ( not ( = ?auto_783550 ?auto_783557 ) ) ( not ( = ?auto_783550 ?auto_783558 ) ) ( not ( = ?auto_783550 ?auto_783559 ) ) ( not ( = ?auto_783550 ?auto_783560 ) ) ( not ( = ?auto_783550 ?auto_783561 ) ) ( not ( = ?auto_783550 ?auto_783567 ) ) ( not ( = ?auto_783551 ?auto_783552 ) ) ( not ( = ?auto_783551 ?auto_783549 ) ) ( not ( = ?auto_783551 ?auto_783553 ) ) ( not ( = ?auto_783551 ?auto_783555 ) ) ( not ( = ?auto_783551 ?auto_783554 ) ) ( not ( = ?auto_783551 ?auto_783556 ) ) ( not ( = ?auto_783551 ?auto_783557 ) ) ( not ( = ?auto_783551 ?auto_783558 ) ) ( not ( = ?auto_783551 ?auto_783559 ) ) ( not ( = ?auto_783551 ?auto_783560 ) ) ( not ( = ?auto_783551 ?auto_783561 ) ) ( not ( = ?auto_783551 ?auto_783567 ) ) ( not ( = ?auto_783552 ?auto_783549 ) ) ( not ( = ?auto_783552 ?auto_783553 ) ) ( not ( = ?auto_783552 ?auto_783555 ) ) ( not ( = ?auto_783552 ?auto_783554 ) ) ( not ( = ?auto_783552 ?auto_783556 ) ) ( not ( = ?auto_783552 ?auto_783557 ) ) ( not ( = ?auto_783552 ?auto_783558 ) ) ( not ( = ?auto_783552 ?auto_783559 ) ) ( not ( = ?auto_783552 ?auto_783560 ) ) ( not ( = ?auto_783552 ?auto_783561 ) ) ( not ( = ?auto_783552 ?auto_783567 ) ) ( not ( = ?auto_783549 ?auto_783553 ) ) ( not ( = ?auto_783549 ?auto_783555 ) ) ( not ( = ?auto_783549 ?auto_783554 ) ) ( not ( = ?auto_783549 ?auto_783556 ) ) ( not ( = ?auto_783549 ?auto_783557 ) ) ( not ( = ?auto_783549 ?auto_783558 ) ) ( not ( = ?auto_783549 ?auto_783559 ) ) ( not ( = ?auto_783549 ?auto_783560 ) ) ( not ( = ?auto_783549 ?auto_783561 ) ) ( not ( = ?auto_783549 ?auto_783567 ) ) ( not ( = ?auto_783553 ?auto_783555 ) ) ( not ( = ?auto_783553 ?auto_783554 ) ) ( not ( = ?auto_783553 ?auto_783556 ) ) ( not ( = ?auto_783553 ?auto_783557 ) ) ( not ( = ?auto_783553 ?auto_783558 ) ) ( not ( = ?auto_783553 ?auto_783559 ) ) ( not ( = ?auto_783553 ?auto_783560 ) ) ( not ( = ?auto_783553 ?auto_783561 ) ) ( not ( = ?auto_783553 ?auto_783567 ) ) ( not ( = ?auto_783555 ?auto_783554 ) ) ( not ( = ?auto_783555 ?auto_783556 ) ) ( not ( = ?auto_783555 ?auto_783557 ) ) ( not ( = ?auto_783555 ?auto_783558 ) ) ( not ( = ?auto_783555 ?auto_783559 ) ) ( not ( = ?auto_783555 ?auto_783560 ) ) ( not ( = ?auto_783555 ?auto_783561 ) ) ( not ( = ?auto_783555 ?auto_783567 ) ) ( not ( = ?auto_783554 ?auto_783556 ) ) ( not ( = ?auto_783554 ?auto_783557 ) ) ( not ( = ?auto_783554 ?auto_783558 ) ) ( not ( = ?auto_783554 ?auto_783559 ) ) ( not ( = ?auto_783554 ?auto_783560 ) ) ( not ( = ?auto_783554 ?auto_783561 ) ) ( not ( = ?auto_783554 ?auto_783567 ) ) ( not ( = ?auto_783556 ?auto_783557 ) ) ( not ( = ?auto_783556 ?auto_783558 ) ) ( not ( = ?auto_783556 ?auto_783559 ) ) ( not ( = ?auto_783556 ?auto_783560 ) ) ( not ( = ?auto_783556 ?auto_783561 ) ) ( not ( = ?auto_783556 ?auto_783567 ) ) ( not ( = ?auto_783557 ?auto_783558 ) ) ( not ( = ?auto_783557 ?auto_783559 ) ) ( not ( = ?auto_783557 ?auto_783560 ) ) ( not ( = ?auto_783557 ?auto_783561 ) ) ( not ( = ?auto_783557 ?auto_783567 ) ) ( not ( = ?auto_783558 ?auto_783559 ) ) ( not ( = ?auto_783558 ?auto_783560 ) ) ( not ( = ?auto_783558 ?auto_783561 ) ) ( not ( = ?auto_783558 ?auto_783567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783559 ?auto_783560 ?auto_783561 )
      ( MAKE-12CRATE-VERIFY ?auto_783550 ?auto_783551 ?auto_783552 ?auto_783549 ?auto_783553 ?auto_783555 ?auto_783554 ?auto_783556 ?auto_783557 ?auto_783558 ?auto_783559 ?auto_783560 ?auto_783561 ) )
  )

)

