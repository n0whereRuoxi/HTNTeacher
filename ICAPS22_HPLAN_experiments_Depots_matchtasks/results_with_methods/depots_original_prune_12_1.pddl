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
      ?auto_643285 - SURFACE
      ?auto_643286 - SURFACE
    )
    :vars
    (
      ?auto_643287 - HOIST
      ?auto_643288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643287 ?auto_643288 ) ( SURFACE-AT ?auto_643285 ?auto_643288 ) ( CLEAR ?auto_643285 ) ( LIFTING ?auto_643287 ?auto_643286 ) ( IS-CRATE ?auto_643286 ) ( not ( = ?auto_643285 ?auto_643286 ) ) )
    :subtasks
    ( ( !DROP ?auto_643287 ?auto_643286 ?auto_643285 ?auto_643288 )
      ( MAKE-1CRATE-VERIFY ?auto_643285 ?auto_643286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643289 - SURFACE
      ?auto_643290 - SURFACE
    )
    :vars
    (
      ?auto_643292 - HOIST
      ?auto_643291 - PLACE
      ?auto_643293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643292 ?auto_643291 ) ( SURFACE-AT ?auto_643289 ?auto_643291 ) ( CLEAR ?auto_643289 ) ( IS-CRATE ?auto_643290 ) ( not ( = ?auto_643289 ?auto_643290 ) ) ( TRUCK-AT ?auto_643293 ?auto_643291 ) ( AVAILABLE ?auto_643292 ) ( IN ?auto_643290 ?auto_643293 ) )
    :subtasks
    ( ( !UNLOAD ?auto_643292 ?auto_643290 ?auto_643293 ?auto_643291 )
      ( MAKE-1CRATE ?auto_643289 ?auto_643290 )
      ( MAKE-1CRATE-VERIFY ?auto_643289 ?auto_643290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643294 - SURFACE
      ?auto_643295 - SURFACE
    )
    :vars
    (
      ?auto_643298 - HOIST
      ?auto_643297 - PLACE
      ?auto_643296 - TRUCK
      ?auto_643299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643298 ?auto_643297 ) ( SURFACE-AT ?auto_643294 ?auto_643297 ) ( CLEAR ?auto_643294 ) ( IS-CRATE ?auto_643295 ) ( not ( = ?auto_643294 ?auto_643295 ) ) ( AVAILABLE ?auto_643298 ) ( IN ?auto_643295 ?auto_643296 ) ( TRUCK-AT ?auto_643296 ?auto_643299 ) ( not ( = ?auto_643299 ?auto_643297 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643296 ?auto_643299 ?auto_643297 )
      ( MAKE-1CRATE ?auto_643294 ?auto_643295 )
      ( MAKE-1CRATE-VERIFY ?auto_643294 ?auto_643295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643300 - SURFACE
      ?auto_643301 - SURFACE
    )
    :vars
    (
      ?auto_643305 - HOIST
      ?auto_643302 - PLACE
      ?auto_643304 - TRUCK
      ?auto_643303 - PLACE
      ?auto_643306 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643305 ?auto_643302 ) ( SURFACE-AT ?auto_643300 ?auto_643302 ) ( CLEAR ?auto_643300 ) ( IS-CRATE ?auto_643301 ) ( not ( = ?auto_643300 ?auto_643301 ) ) ( AVAILABLE ?auto_643305 ) ( TRUCK-AT ?auto_643304 ?auto_643303 ) ( not ( = ?auto_643303 ?auto_643302 ) ) ( HOIST-AT ?auto_643306 ?auto_643303 ) ( LIFTING ?auto_643306 ?auto_643301 ) ( not ( = ?auto_643305 ?auto_643306 ) ) )
    :subtasks
    ( ( !LOAD ?auto_643306 ?auto_643301 ?auto_643304 ?auto_643303 )
      ( MAKE-1CRATE ?auto_643300 ?auto_643301 )
      ( MAKE-1CRATE-VERIFY ?auto_643300 ?auto_643301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643307 - SURFACE
      ?auto_643308 - SURFACE
    )
    :vars
    (
      ?auto_643310 - HOIST
      ?auto_643311 - PLACE
      ?auto_643313 - TRUCK
      ?auto_643309 - PLACE
      ?auto_643312 - HOIST
      ?auto_643314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643310 ?auto_643311 ) ( SURFACE-AT ?auto_643307 ?auto_643311 ) ( CLEAR ?auto_643307 ) ( IS-CRATE ?auto_643308 ) ( not ( = ?auto_643307 ?auto_643308 ) ) ( AVAILABLE ?auto_643310 ) ( TRUCK-AT ?auto_643313 ?auto_643309 ) ( not ( = ?auto_643309 ?auto_643311 ) ) ( HOIST-AT ?auto_643312 ?auto_643309 ) ( not ( = ?auto_643310 ?auto_643312 ) ) ( AVAILABLE ?auto_643312 ) ( SURFACE-AT ?auto_643308 ?auto_643309 ) ( ON ?auto_643308 ?auto_643314 ) ( CLEAR ?auto_643308 ) ( not ( = ?auto_643307 ?auto_643314 ) ) ( not ( = ?auto_643308 ?auto_643314 ) ) )
    :subtasks
    ( ( !LIFT ?auto_643312 ?auto_643308 ?auto_643314 ?auto_643309 )
      ( MAKE-1CRATE ?auto_643307 ?auto_643308 )
      ( MAKE-1CRATE-VERIFY ?auto_643307 ?auto_643308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643315 - SURFACE
      ?auto_643316 - SURFACE
    )
    :vars
    (
      ?auto_643320 - HOIST
      ?auto_643322 - PLACE
      ?auto_643319 - PLACE
      ?auto_643321 - HOIST
      ?auto_643317 - SURFACE
      ?auto_643318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643320 ?auto_643322 ) ( SURFACE-AT ?auto_643315 ?auto_643322 ) ( CLEAR ?auto_643315 ) ( IS-CRATE ?auto_643316 ) ( not ( = ?auto_643315 ?auto_643316 ) ) ( AVAILABLE ?auto_643320 ) ( not ( = ?auto_643319 ?auto_643322 ) ) ( HOIST-AT ?auto_643321 ?auto_643319 ) ( not ( = ?auto_643320 ?auto_643321 ) ) ( AVAILABLE ?auto_643321 ) ( SURFACE-AT ?auto_643316 ?auto_643319 ) ( ON ?auto_643316 ?auto_643317 ) ( CLEAR ?auto_643316 ) ( not ( = ?auto_643315 ?auto_643317 ) ) ( not ( = ?auto_643316 ?auto_643317 ) ) ( TRUCK-AT ?auto_643318 ?auto_643322 ) )
    :subtasks
    ( ( !DRIVE ?auto_643318 ?auto_643322 ?auto_643319 )
      ( MAKE-1CRATE ?auto_643315 ?auto_643316 )
      ( MAKE-1CRATE-VERIFY ?auto_643315 ?auto_643316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643332 - SURFACE
      ?auto_643333 - SURFACE
      ?auto_643334 - SURFACE
    )
    :vars
    (
      ?auto_643336 - HOIST
      ?auto_643335 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643336 ?auto_643335 ) ( SURFACE-AT ?auto_643333 ?auto_643335 ) ( CLEAR ?auto_643333 ) ( LIFTING ?auto_643336 ?auto_643334 ) ( IS-CRATE ?auto_643334 ) ( not ( = ?auto_643333 ?auto_643334 ) ) ( ON ?auto_643333 ?auto_643332 ) ( not ( = ?auto_643332 ?auto_643333 ) ) ( not ( = ?auto_643332 ?auto_643334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643333 ?auto_643334 )
      ( MAKE-2CRATE-VERIFY ?auto_643332 ?auto_643333 ?auto_643334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643342 - SURFACE
      ?auto_643343 - SURFACE
      ?auto_643344 - SURFACE
    )
    :vars
    (
      ?auto_643346 - HOIST
      ?auto_643347 - PLACE
      ?auto_643345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643346 ?auto_643347 ) ( SURFACE-AT ?auto_643343 ?auto_643347 ) ( CLEAR ?auto_643343 ) ( IS-CRATE ?auto_643344 ) ( not ( = ?auto_643343 ?auto_643344 ) ) ( TRUCK-AT ?auto_643345 ?auto_643347 ) ( AVAILABLE ?auto_643346 ) ( IN ?auto_643344 ?auto_643345 ) ( ON ?auto_643343 ?auto_643342 ) ( not ( = ?auto_643342 ?auto_643343 ) ) ( not ( = ?auto_643342 ?auto_643344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643343 ?auto_643344 )
      ( MAKE-2CRATE-VERIFY ?auto_643342 ?auto_643343 ?auto_643344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643348 - SURFACE
      ?auto_643349 - SURFACE
    )
    :vars
    (
      ?auto_643352 - HOIST
      ?auto_643350 - PLACE
      ?auto_643353 - TRUCK
      ?auto_643351 - SURFACE
      ?auto_643354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643352 ?auto_643350 ) ( SURFACE-AT ?auto_643348 ?auto_643350 ) ( CLEAR ?auto_643348 ) ( IS-CRATE ?auto_643349 ) ( not ( = ?auto_643348 ?auto_643349 ) ) ( AVAILABLE ?auto_643352 ) ( IN ?auto_643349 ?auto_643353 ) ( ON ?auto_643348 ?auto_643351 ) ( not ( = ?auto_643351 ?auto_643348 ) ) ( not ( = ?auto_643351 ?auto_643349 ) ) ( TRUCK-AT ?auto_643353 ?auto_643354 ) ( not ( = ?auto_643354 ?auto_643350 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643353 ?auto_643354 ?auto_643350 )
      ( MAKE-2CRATE ?auto_643351 ?auto_643348 ?auto_643349 )
      ( MAKE-1CRATE-VERIFY ?auto_643348 ?auto_643349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643355 - SURFACE
      ?auto_643356 - SURFACE
      ?auto_643357 - SURFACE
    )
    :vars
    (
      ?auto_643358 - HOIST
      ?auto_643360 - PLACE
      ?auto_643359 - TRUCK
      ?auto_643361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643358 ?auto_643360 ) ( SURFACE-AT ?auto_643356 ?auto_643360 ) ( CLEAR ?auto_643356 ) ( IS-CRATE ?auto_643357 ) ( not ( = ?auto_643356 ?auto_643357 ) ) ( AVAILABLE ?auto_643358 ) ( IN ?auto_643357 ?auto_643359 ) ( ON ?auto_643356 ?auto_643355 ) ( not ( = ?auto_643355 ?auto_643356 ) ) ( not ( = ?auto_643355 ?auto_643357 ) ) ( TRUCK-AT ?auto_643359 ?auto_643361 ) ( not ( = ?auto_643361 ?auto_643360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643356 ?auto_643357 )
      ( MAKE-2CRATE-VERIFY ?auto_643355 ?auto_643356 ?auto_643357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643362 - SURFACE
      ?auto_643363 - SURFACE
    )
    :vars
    (
      ?auto_643367 - HOIST
      ?auto_643364 - PLACE
      ?auto_643365 - SURFACE
      ?auto_643366 - TRUCK
      ?auto_643368 - PLACE
      ?auto_643369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643367 ?auto_643364 ) ( SURFACE-AT ?auto_643362 ?auto_643364 ) ( CLEAR ?auto_643362 ) ( IS-CRATE ?auto_643363 ) ( not ( = ?auto_643362 ?auto_643363 ) ) ( AVAILABLE ?auto_643367 ) ( ON ?auto_643362 ?auto_643365 ) ( not ( = ?auto_643365 ?auto_643362 ) ) ( not ( = ?auto_643365 ?auto_643363 ) ) ( TRUCK-AT ?auto_643366 ?auto_643368 ) ( not ( = ?auto_643368 ?auto_643364 ) ) ( HOIST-AT ?auto_643369 ?auto_643368 ) ( LIFTING ?auto_643369 ?auto_643363 ) ( not ( = ?auto_643367 ?auto_643369 ) ) )
    :subtasks
    ( ( !LOAD ?auto_643369 ?auto_643363 ?auto_643366 ?auto_643368 )
      ( MAKE-2CRATE ?auto_643365 ?auto_643362 ?auto_643363 )
      ( MAKE-1CRATE-VERIFY ?auto_643362 ?auto_643363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643370 - SURFACE
      ?auto_643371 - SURFACE
      ?auto_643372 - SURFACE
    )
    :vars
    (
      ?auto_643374 - HOIST
      ?auto_643373 - PLACE
      ?auto_643375 - TRUCK
      ?auto_643377 - PLACE
      ?auto_643376 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643374 ?auto_643373 ) ( SURFACE-AT ?auto_643371 ?auto_643373 ) ( CLEAR ?auto_643371 ) ( IS-CRATE ?auto_643372 ) ( not ( = ?auto_643371 ?auto_643372 ) ) ( AVAILABLE ?auto_643374 ) ( ON ?auto_643371 ?auto_643370 ) ( not ( = ?auto_643370 ?auto_643371 ) ) ( not ( = ?auto_643370 ?auto_643372 ) ) ( TRUCK-AT ?auto_643375 ?auto_643377 ) ( not ( = ?auto_643377 ?auto_643373 ) ) ( HOIST-AT ?auto_643376 ?auto_643377 ) ( LIFTING ?auto_643376 ?auto_643372 ) ( not ( = ?auto_643374 ?auto_643376 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643371 ?auto_643372 )
      ( MAKE-2CRATE-VERIFY ?auto_643370 ?auto_643371 ?auto_643372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643378 - SURFACE
      ?auto_643379 - SURFACE
    )
    :vars
    (
      ?auto_643381 - HOIST
      ?auto_643382 - PLACE
      ?auto_643384 - SURFACE
      ?auto_643383 - TRUCK
      ?auto_643385 - PLACE
      ?auto_643380 - HOIST
      ?auto_643386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643381 ?auto_643382 ) ( SURFACE-AT ?auto_643378 ?auto_643382 ) ( CLEAR ?auto_643378 ) ( IS-CRATE ?auto_643379 ) ( not ( = ?auto_643378 ?auto_643379 ) ) ( AVAILABLE ?auto_643381 ) ( ON ?auto_643378 ?auto_643384 ) ( not ( = ?auto_643384 ?auto_643378 ) ) ( not ( = ?auto_643384 ?auto_643379 ) ) ( TRUCK-AT ?auto_643383 ?auto_643385 ) ( not ( = ?auto_643385 ?auto_643382 ) ) ( HOIST-AT ?auto_643380 ?auto_643385 ) ( not ( = ?auto_643381 ?auto_643380 ) ) ( AVAILABLE ?auto_643380 ) ( SURFACE-AT ?auto_643379 ?auto_643385 ) ( ON ?auto_643379 ?auto_643386 ) ( CLEAR ?auto_643379 ) ( not ( = ?auto_643378 ?auto_643386 ) ) ( not ( = ?auto_643379 ?auto_643386 ) ) ( not ( = ?auto_643384 ?auto_643386 ) ) )
    :subtasks
    ( ( !LIFT ?auto_643380 ?auto_643379 ?auto_643386 ?auto_643385 )
      ( MAKE-2CRATE ?auto_643384 ?auto_643378 ?auto_643379 )
      ( MAKE-1CRATE-VERIFY ?auto_643378 ?auto_643379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643387 - SURFACE
      ?auto_643388 - SURFACE
      ?auto_643389 - SURFACE
    )
    :vars
    (
      ?auto_643393 - HOIST
      ?auto_643395 - PLACE
      ?auto_643390 - TRUCK
      ?auto_643391 - PLACE
      ?auto_643394 - HOIST
      ?auto_643392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643393 ?auto_643395 ) ( SURFACE-AT ?auto_643388 ?auto_643395 ) ( CLEAR ?auto_643388 ) ( IS-CRATE ?auto_643389 ) ( not ( = ?auto_643388 ?auto_643389 ) ) ( AVAILABLE ?auto_643393 ) ( ON ?auto_643388 ?auto_643387 ) ( not ( = ?auto_643387 ?auto_643388 ) ) ( not ( = ?auto_643387 ?auto_643389 ) ) ( TRUCK-AT ?auto_643390 ?auto_643391 ) ( not ( = ?auto_643391 ?auto_643395 ) ) ( HOIST-AT ?auto_643394 ?auto_643391 ) ( not ( = ?auto_643393 ?auto_643394 ) ) ( AVAILABLE ?auto_643394 ) ( SURFACE-AT ?auto_643389 ?auto_643391 ) ( ON ?auto_643389 ?auto_643392 ) ( CLEAR ?auto_643389 ) ( not ( = ?auto_643388 ?auto_643392 ) ) ( not ( = ?auto_643389 ?auto_643392 ) ) ( not ( = ?auto_643387 ?auto_643392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643388 ?auto_643389 )
      ( MAKE-2CRATE-VERIFY ?auto_643387 ?auto_643388 ?auto_643389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643396 - SURFACE
      ?auto_643397 - SURFACE
    )
    :vars
    (
      ?auto_643403 - HOIST
      ?auto_643400 - PLACE
      ?auto_643401 - SURFACE
      ?auto_643399 - PLACE
      ?auto_643402 - HOIST
      ?auto_643398 - SURFACE
      ?auto_643404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643403 ?auto_643400 ) ( SURFACE-AT ?auto_643396 ?auto_643400 ) ( CLEAR ?auto_643396 ) ( IS-CRATE ?auto_643397 ) ( not ( = ?auto_643396 ?auto_643397 ) ) ( AVAILABLE ?auto_643403 ) ( ON ?auto_643396 ?auto_643401 ) ( not ( = ?auto_643401 ?auto_643396 ) ) ( not ( = ?auto_643401 ?auto_643397 ) ) ( not ( = ?auto_643399 ?auto_643400 ) ) ( HOIST-AT ?auto_643402 ?auto_643399 ) ( not ( = ?auto_643403 ?auto_643402 ) ) ( AVAILABLE ?auto_643402 ) ( SURFACE-AT ?auto_643397 ?auto_643399 ) ( ON ?auto_643397 ?auto_643398 ) ( CLEAR ?auto_643397 ) ( not ( = ?auto_643396 ?auto_643398 ) ) ( not ( = ?auto_643397 ?auto_643398 ) ) ( not ( = ?auto_643401 ?auto_643398 ) ) ( TRUCK-AT ?auto_643404 ?auto_643400 ) )
    :subtasks
    ( ( !DRIVE ?auto_643404 ?auto_643400 ?auto_643399 )
      ( MAKE-2CRATE ?auto_643401 ?auto_643396 ?auto_643397 )
      ( MAKE-1CRATE-VERIFY ?auto_643396 ?auto_643397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643405 - SURFACE
      ?auto_643406 - SURFACE
      ?auto_643407 - SURFACE
    )
    :vars
    (
      ?auto_643409 - HOIST
      ?auto_643413 - PLACE
      ?auto_643408 - PLACE
      ?auto_643411 - HOIST
      ?auto_643410 - SURFACE
      ?auto_643412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643409 ?auto_643413 ) ( SURFACE-AT ?auto_643406 ?auto_643413 ) ( CLEAR ?auto_643406 ) ( IS-CRATE ?auto_643407 ) ( not ( = ?auto_643406 ?auto_643407 ) ) ( AVAILABLE ?auto_643409 ) ( ON ?auto_643406 ?auto_643405 ) ( not ( = ?auto_643405 ?auto_643406 ) ) ( not ( = ?auto_643405 ?auto_643407 ) ) ( not ( = ?auto_643408 ?auto_643413 ) ) ( HOIST-AT ?auto_643411 ?auto_643408 ) ( not ( = ?auto_643409 ?auto_643411 ) ) ( AVAILABLE ?auto_643411 ) ( SURFACE-AT ?auto_643407 ?auto_643408 ) ( ON ?auto_643407 ?auto_643410 ) ( CLEAR ?auto_643407 ) ( not ( = ?auto_643406 ?auto_643410 ) ) ( not ( = ?auto_643407 ?auto_643410 ) ) ( not ( = ?auto_643405 ?auto_643410 ) ) ( TRUCK-AT ?auto_643412 ?auto_643413 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643406 ?auto_643407 )
      ( MAKE-2CRATE-VERIFY ?auto_643405 ?auto_643406 ?auto_643407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643414 - SURFACE
      ?auto_643415 - SURFACE
    )
    :vars
    (
      ?auto_643421 - HOIST
      ?auto_643416 - PLACE
      ?auto_643419 - SURFACE
      ?auto_643422 - PLACE
      ?auto_643417 - HOIST
      ?auto_643418 - SURFACE
      ?auto_643420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643421 ?auto_643416 ) ( IS-CRATE ?auto_643415 ) ( not ( = ?auto_643414 ?auto_643415 ) ) ( not ( = ?auto_643419 ?auto_643414 ) ) ( not ( = ?auto_643419 ?auto_643415 ) ) ( not ( = ?auto_643422 ?auto_643416 ) ) ( HOIST-AT ?auto_643417 ?auto_643422 ) ( not ( = ?auto_643421 ?auto_643417 ) ) ( AVAILABLE ?auto_643417 ) ( SURFACE-AT ?auto_643415 ?auto_643422 ) ( ON ?auto_643415 ?auto_643418 ) ( CLEAR ?auto_643415 ) ( not ( = ?auto_643414 ?auto_643418 ) ) ( not ( = ?auto_643415 ?auto_643418 ) ) ( not ( = ?auto_643419 ?auto_643418 ) ) ( TRUCK-AT ?auto_643420 ?auto_643416 ) ( SURFACE-AT ?auto_643419 ?auto_643416 ) ( CLEAR ?auto_643419 ) ( LIFTING ?auto_643421 ?auto_643414 ) ( IS-CRATE ?auto_643414 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643419 ?auto_643414 )
      ( MAKE-2CRATE ?auto_643419 ?auto_643414 ?auto_643415 )
      ( MAKE-1CRATE-VERIFY ?auto_643414 ?auto_643415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643423 - SURFACE
      ?auto_643424 - SURFACE
      ?auto_643425 - SURFACE
    )
    :vars
    (
      ?auto_643431 - HOIST
      ?auto_643426 - PLACE
      ?auto_643427 - PLACE
      ?auto_643430 - HOIST
      ?auto_643428 - SURFACE
      ?auto_643429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643431 ?auto_643426 ) ( IS-CRATE ?auto_643425 ) ( not ( = ?auto_643424 ?auto_643425 ) ) ( not ( = ?auto_643423 ?auto_643424 ) ) ( not ( = ?auto_643423 ?auto_643425 ) ) ( not ( = ?auto_643427 ?auto_643426 ) ) ( HOIST-AT ?auto_643430 ?auto_643427 ) ( not ( = ?auto_643431 ?auto_643430 ) ) ( AVAILABLE ?auto_643430 ) ( SURFACE-AT ?auto_643425 ?auto_643427 ) ( ON ?auto_643425 ?auto_643428 ) ( CLEAR ?auto_643425 ) ( not ( = ?auto_643424 ?auto_643428 ) ) ( not ( = ?auto_643425 ?auto_643428 ) ) ( not ( = ?auto_643423 ?auto_643428 ) ) ( TRUCK-AT ?auto_643429 ?auto_643426 ) ( SURFACE-AT ?auto_643423 ?auto_643426 ) ( CLEAR ?auto_643423 ) ( LIFTING ?auto_643431 ?auto_643424 ) ( IS-CRATE ?auto_643424 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643424 ?auto_643425 )
      ( MAKE-2CRATE-VERIFY ?auto_643423 ?auto_643424 ?auto_643425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643432 - SURFACE
      ?auto_643433 - SURFACE
    )
    :vars
    (
      ?auto_643436 - HOIST
      ?auto_643434 - PLACE
      ?auto_643439 - SURFACE
      ?auto_643438 - PLACE
      ?auto_643435 - HOIST
      ?auto_643440 - SURFACE
      ?auto_643437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643436 ?auto_643434 ) ( IS-CRATE ?auto_643433 ) ( not ( = ?auto_643432 ?auto_643433 ) ) ( not ( = ?auto_643439 ?auto_643432 ) ) ( not ( = ?auto_643439 ?auto_643433 ) ) ( not ( = ?auto_643438 ?auto_643434 ) ) ( HOIST-AT ?auto_643435 ?auto_643438 ) ( not ( = ?auto_643436 ?auto_643435 ) ) ( AVAILABLE ?auto_643435 ) ( SURFACE-AT ?auto_643433 ?auto_643438 ) ( ON ?auto_643433 ?auto_643440 ) ( CLEAR ?auto_643433 ) ( not ( = ?auto_643432 ?auto_643440 ) ) ( not ( = ?auto_643433 ?auto_643440 ) ) ( not ( = ?auto_643439 ?auto_643440 ) ) ( TRUCK-AT ?auto_643437 ?auto_643434 ) ( SURFACE-AT ?auto_643439 ?auto_643434 ) ( CLEAR ?auto_643439 ) ( IS-CRATE ?auto_643432 ) ( AVAILABLE ?auto_643436 ) ( IN ?auto_643432 ?auto_643437 ) )
    :subtasks
    ( ( !UNLOAD ?auto_643436 ?auto_643432 ?auto_643437 ?auto_643434 )
      ( MAKE-2CRATE ?auto_643439 ?auto_643432 ?auto_643433 )
      ( MAKE-1CRATE-VERIFY ?auto_643432 ?auto_643433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643441 - SURFACE
      ?auto_643442 - SURFACE
      ?auto_643443 - SURFACE
    )
    :vars
    (
      ?auto_643449 - HOIST
      ?auto_643447 - PLACE
      ?auto_643444 - PLACE
      ?auto_643445 - HOIST
      ?auto_643446 - SURFACE
      ?auto_643448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643449 ?auto_643447 ) ( IS-CRATE ?auto_643443 ) ( not ( = ?auto_643442 ?auto_643443 ) ) ( not ( = ?auto_643441 ?auto_643442 ) ) ( not ( = ?auto_643441 ?auto_643443 ) ) ( not ( = ?auto_643444 ?auto_643447 ) ) ( HOIST-AT ?auto_643445 ?auto_643444 ) ( not ( = ?auto_643449 ?auto_643445 ) ) ( AVAILABLE ?auto_643445 ) ( SURFACE-AT ?auto_643443 ?auto_643444 ) ( ON ?auto_643443 ?auto_643446 ) ( CLEAR ?auto_643443 ) ( not ( = ?auto_643442 ?auto_643446 ) ) ( not ( = ?auto_643443 ?auto_643446 ) ) ( not ( = ?auto_643441 ?auto_643446 ) ) ( TRUCK-AT ?auto_643448 ?auto_643447 ) ( SURFACE-AT ?auto_643441 ?auto_643447 ) ( CLEAR ?auto_643441 ) ( IS-CRATE ?auto_643442 ) ( AVAILABLE ?auto_643449 ) ( IN ?auto_643442 ?auto_643448 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643442 ?auto_643443 )
      ( MAKE-2CRATE-VERIFY ?auto_643441 ?auto_643442 ?auto_643443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643486 - SURFACE
      ?auto_643487 - SURFACE
    )
    :vars
    (
      ?auto_643490 - HOIST
      ?auto_643494 - PLACE
      ?auto_643489 - SURFACE
      ?auto_643488 - PLACE
      ?auto_643492 - HOIST
      ?auto_643493 - SURFACE
      ?auto_643491 - TRUCK
      ?auto_643495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643490 ?auto_643494 ) ( SURFACE-AT ?auto_643486 ?auto_643494 ) ( CLEAR ?auto_643486 ) ( IS-CRATE ?auto_643487 ) ( not ( = ?auto_643486 ?auto_643487 ) ) ( AVAILABLE ?auto_643490 ) ( ON ?auto_643486 ?auto_643489 ) ( not ( = ?auto_643489 ?auto_643486 ) ) ( not ( = ?auto_643489 ?auto_643487 ) ) ( not ( = ?auto_643488 ?auto_643494 ) ) ( HOIST-AT ?auto_643492 ?auto_643488 ) ( not ( = ?auto_643490 ?auto_643492 ) ) ( AVAILABLE ?auto_643492 ) ( SURFACE-AT ?auto_643487 ?auto_643488 ) ( ON ?auto_643487 ?auto_643493 ) ( CLEAR ?auto_643487 ) ( not ( = ?auto_643486 ?auto_643493 ) ) ( not ( = ?auto_643487 ?auto_643493 ) ) ( not ( = ?auto_643489 ?auto_643493 ) ) ( TRUCK-AT ?auto_643491 ?auto_643495 ) ( not ( = ?auto_643495 ?auto_643494 ) ) ( not ( = ?auto_643488 ?auto_643495 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643491 ?auto_643495 ?auto_643494 )
      ( MAKE-1CRATE ?auto_643486 ?auto_643487 )
      ( MAKE-1CRATE-VERIFY ?auto_643486 ?auto_643487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643526 - SURFACE
      ?auto_643527 - SURFACE
      ?auto_643528 - SURFACE
      ?auto_643525 - SURFACE
    )
    :vars
    (
      ?auto_643529 - HOIST
      ?auto_643530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643529 ?auto_643530 ) ( SURFACE-AT ?auto_643528 ?auto_643530 ) ( CLEAR ?auto_643528 ) ( LIFTING ?auto_643529 ?auto_643525 ) ( IS-CRATE ?auto_643525 ) ( not ( = ?auto_643528 ?auto_643525 ) ) ( ON ?auto_643527 ?auto_643526 ) ( ON ?auto_643528 ?auto_643527 ) ( not ( = ?auto_643526 ?auto_643527 ) ) ( not ( = ?auto_643526 ?auto_643528 ) ) ( not ( = ?auto_643526 ?auto_643525 ) ) ( not ( = ?auto_643527 ?auto_643528 ) ) ( not ( = ?auto_643527 ?auto_643525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643528 ?auto_643525 )
      ( MAKE-3CRATE-VERIFY ?auto_643526 ?auto_643527 ?auto_643528 ?auto_643525 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643543 - SURFACE
      ?auto_643544 - SURFACE
      ?auto_643545 - SURFACE
      ?auto_643542 - SURFACE
    )
    :vars
    (
      ?auto_643546 - HOIST
      ?auto_643548 - PLACE
      ?auto_643547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643546 ?auto_643548 ) ( SURFACE-AT ?auto_643545 ?auto_643548 ) ( CLEAR ?auto_643545 ) ( IS-CRATE ?auto_643542 ) ( not ( = ?auto_643545 ?auto_643542 ) ) ( TRUCK-AT ?auto_643547 ?auto_643548 ) ( AVAILABLE ?auto_643546 ) ( IN ?auto_643542 ?auto_643547 ) ( ON ?auto_643545 ?auto_643544 ) ( not ( = ?auto_643544 ?auto_643545 ) ) ( not ( = ?auto_643544 ?auto_643542 ) ) ( ON ?auto_643544 ?auto_643543 ) ( not ( = ?auto_643543 ?auto_643544 ) ) ( not ( = ?auto_643543 ?auto_643545 ) ) ( not ( = ?auto_643543 ?auto_643542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643544 ?auto_643545 ?auto_643542 )
      ( MAKE-3CRATE-VERIFY ?auto_643543 ?auto_643544 ?auto_643545 ?auto_643542 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643564 - SURFACE
      ?auto_643565 - SURFACE
      ?auto_643566 - SURFACE
      ?auto_643563 - SURFACE
    )
    :vars
    (
      ?auto_643568 - HOIST
      ?auto_643570 - PLACE
      ?auto_643567 - TRUCK
      ?auto_643569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643568 ?auto_643570 ) ( SURFACE-AT ?auto_643566 ?auto_643570 ) ( CLEAR ?auto_643566 ) ( IS-CRATE ?auto_643563 ) ( not ( = ?auto_643566 ?auto_643563 ) ) ( AVAILABLE ?auto_643568 ) ( IN ?auto_643563 ?auto_643567 ) ( ON ?auto_643566 ?auto_643565 ) ( not ( = ?auto_643565 ?auto_643566 ) ) ( not ( = ?auto_643565 ?auto_643563 ) ) ( TRUCK-AT ?auto_643567 ?auto_643569 ) ( not ( = ?auto_643569 ?auto_643570 ) ) ( ON ?auto_643565 ?auto_643564 ) ( not ( = ?auto_643564 ?auto_643565 ) ) ( not ( = ?auto_643564 ?auto_643566 ) ) ( not ( = ?auto_643564 ?auto_643563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643565 ?auto_643566 ?auto_643563 )
      ( MAKE-3CRATE-VERIFY ?auto_643564 ?auto_643565 ?auto_643566 ?auto_643563 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643588 - SURFACE
      ?auto_643589 - SURFACE
      ?auto_643590 - SURFACE
      ?auto_643587 - SURFACE
    )
    :vars
    (
      ?auto_643592 - HOIST
      ?auto_643591 - PLACE
      ?auto_643595 - TRUCK
      ?auto_643594 - PLACE
      ?auto_643593 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643592 ?auto_643591 ) ( SURFACE-AT ?auto_643590 ?auto_643591 ) ( CLEAR ?auto_643590 ) ( IS-CRATE ?auto_643587 ) ( not ( = ?auto_643590 ?auto_643587 ) ) ( AVAILABLE ?auto_643592 ) ( ON ?auto_643590 ?auto_643589 ) ( not ( = ?auto_643589 ?auto_643590 ) ) ( not ( = ?auto_643589 ?auto_643587 ) ) ( TRUCK-AT ?auto_643595 ?auto_643594 ) ( not ( = ?auto_643594 ?auto_643591 ) ) ( HOIST-AT ?auto_643593 ?auto_643594 ) ( LIFTING ?auto_643593 ?auto_643587 ) ( not ( = ?auto_643592 ?auto_643593 ) ) ( ON ?auto_643589 ?auto_643588 ) ( not ( = ?auto_643588 ?auto_643589 ) ) ( not ( = ?auto_643588 ?auto_643590 ) ) ( not ( = ?auto_643588 ?auto_643587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643589 ?auto_643590 ?auto_643587 )
      ( MAKE-3CRATE-VERIFY ?auto_643588 ?auto_643589 ?auto_643590 ?auto_643587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643615 - SURFACE
      ?auto_643616 - SURFACE
      ?auto_643617 - SURFACE
      ?auto_643614 - SURFACE
    )
    :vars
    (
      ?auto_643621 - HOIST
      ?auto_643622 - PLACE
      ?auto_643619 - TRUCK
      ?auto_643620 - PLACE
      ?auto_643623 - HOIST
      ?auto_643618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643621 ?auto_643622 ) ( SURFACE-AT ?auto_643617 ?auto_643622 ) ( CLEAR ?auto_643617 ) ( IS-CRATE ?auto_643614 ) ( not ( = ?auto_643617 ?auto_643614 ) ) ( AVAILABLE ?auto_643621 ) ( ON ?auto_643617 ?auto_643616 ) ( not ( = ?auto_643616 ?auto_643617 ) ) ( not ( = ?auto_643616 ?auto_643614 ) ) ( TRUCK-AT ?auto_643619 ?auto_643620 ) ( not ( = ?auto_643620 ?auto_643622 ) ) ( HOIST-AT ?auto_643623 ?auto_643620 ) ( not ( = ?auto_643621 ?auto_643623 ) ) ( AVAILABLE ?auto_643623 ) ( SURFACE-AT ?auto_643614 ?auto_643620 ) ( ON ?auto_643614 ?auto_643618 ) ( CLEAR ?auto_643614 ) ( not ( = ?auto_643617 ?auto_643618 ) ) ( not ( = ?auto_643614 ?auto_643618 ) ) ( not ( = ?auto_643616 ?auto_643618 ) ) ( ON ?auto_643616 ?auto_643615 ) ( not ( = ?auto_643615 ?auto_643616 ) ) ( not ( = ?auto_643615 ?auto_643617 ) ) ( not ( = ?auto_643615 ?auto_643614 ) ) ( not ( = ?auto_643615 ?auto_643618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643616 ?auto_643617 ?auto_643614 )
      ( MAKE-3CRATE-VERIFY ?auto_643615 ?auto_643616 ?auto_643617 ?auto_643614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643643 - SURFACE
      ?auto_643644 - SURFACE
      ?auto_643645 - SURFACE
      ?auto_643642 - SURFACE
    )
    :vars
    (
      ?auto_643647 - HOIST
      ?auto_643646 - PLACE
      ?auto_643651 - PLACE
      ?auto_643650 - HOIST
      ?auto_643648 - SURFACE
      ?auto_643649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643647 ?auto_643646 ) ( SURFACE-AT ?auto_643645 ?auto_643646 ) ( CLEAR ?auto_643645 ) ( IS-CRATE ?auto_643642 ) ( not ( = ?auto_643645 ?auto_643642 ) ) ( AVAILABLE ?auto_643647 ) ( ON ?auto_643645 ?auto_643644 ) ( not ( = ?auto_643644 ?auto_643645 ) ) ( not ( = ?auto_643644 ?auto_643642 ) ) ( not ( = ?auto_643651 ?auto_643646 ) ) ( HOIST-AT ?auto_643650 ?auto_643651 ) ( not ( = ?auto_643647 ?auto_643650 ) ) ( AVAILABLE ?auto_643650 ) ( SURFACE-AT ?auto_643642 ?auto_643651 ) ( ON ?auto_643642 ?auto_643648 ) ( CLEAR ?auto_643642 ) ( not ( = ?auto_643645 ?auto_643648 ) ) ( not ( = ?auto_643642 ?auto_643648 ) ) ( not ( = ?auto_643644 ?auto_643648 ) ) ( TRUCK-AT ?auto_643649 ?auto_643646 ) ( ON ?auto_643644 ?auto_643643 ) ( not ( = ?auto_643643 ?auto_643644 ) ) ( not ( = ?auto_643643 ?auto_643645 ) ) ( not ( = ?auto_643643 ?auto_643642 ) ) ( not ( = ?auto_643643 ?auto_643648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643644 ?auto_643645 ?auto_643642 )
      ( MAKE-3CRATE-VERIFY ?auto_643643 ?auto_643644 ?auto_643645 ?auto_643642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643671 - SURFACE
      ?auto_643672 - SURFACE
      ?auto_643673 - SURFACE
      ?auto_643670 - SURFACE
    )
    :vars
    (
      ?auto_643678 - HOIST
      ?auto_643676 - PLACE
      ?auto_643674 - PLACE
      ?auto_643679 - HOIST
      ?auto_643675 - SURFACE
      ?auto_643677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643678 ?auto_643676 ) ( IS-CRATE ?auto_643670 ) ( not ( = ?auto_643673 ?auto_643670 ) ) ( not ( = ?auto_643672 ?auto_643673 ) ) ( not ( = ?auto_643672 ?auto_643670 ) ) ( not ( = ?auto_643674 ?auto_643676 ) ) ( HOIST-AT ?auto_643679 ?auto_643674 ) ( not ( = ?auto_643678 ?auto_643679 ) ) ( AVAILABLE ?auto_643679 ) ( SURFACE-AT ?auto_643670 ?auto_643674 ) ( ON ?auto_643670 ?auto_643675 ) ( CLEAR ?auto_643670 ) ( not ( = ?auto_643673 ?auto_643675 ) ) ( not ( = ?auto_643670 ?auto_643675 ) ) ( not ( = ?auto_643672 ?auto_643675 ) ) ( TRUCK-AT ?auto_643677 ?auto_643676 ) ( SURFACE-AT ?auto_643672 ?auto_643676 ) ( CLEAR ?auto_643672 ) ( LIFTING ?auto_643678 ?auto_643673 ) ( IS-CRATE ?auto_643673 ) ( ON ?auto_643672 ?auto_643671 ) ( not ( = ?auto_643671 ?auto_643672 ) ) ( not ( = ?auto_643671 ?auto_643673 ) ) ( not ( = ?auto_643671 ?auto_643670 ) ) ( not ( = ?auto_643671 ?auto_643675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643672 ?auto_643673 ?auto_643670 )
      ( MAKE-3CRATE-VERIFY ?auto_643671 ?auto_643672 ?auto_643673 ?auto_643670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643699 - SURFACE
      ?auto_643700 - SURFACE
      ?auto_643701 - SURFACE
      ?auto_643698 - SURFACE
    )
    :vars
    (
      ?auto_643705 - HOIST
      ?auto_643703 - PLACE
      ?auto_643702 - PLACE
      ?auto_643707 - HOIST
      ?auto_643706 - SURFACE
      ?auto_643704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643705 ?auto_643703 ) ( IS-CRATE ?auto_643698 ) ( not ( = ?auto_643701 ?auto_643698 ) ) ( not ( = ?auto_643700 ?auto_643701 ) ) ( not ( = ?auto_643700 ?auto_643698 ) ) ( not ( = ?auto_643702 ?auto_643703 ) ) ( HOIST-AT ?auto_643707 ?auto_643702 ) ( not ( = ?auto_643705 ?auto_643707 ) ) ( AVAILABLE ?auto_643707 ) ( SURFACE-AT ?auto_643698 ?auto_643702 ) ( ON ?auto_643698 ?auto_643706 ) ( CLEAR ?auto_643698 ) ( not ( = ?auto_643701 ?auto_643706 ) ) ( not ( = ?auto_643698 ?auto_643706 ) ) ( not ( = ?auto_643700 ?auto_643706 ) ) ( TRUCK-AT ?auto_643704 ?auto_643703 ) ( SURFACE-AT ?auto_643700 ?auto_643703 ) ( CLEAR ?auto_643700 ) ( IS-CRATE ?auto_643701 ) ( AVAILABLE ?auto_643705 ) ( IN ?auto_643701 ?auto_643704 ) ( ON ?auto_643700 ?auto_643699 ) ( not ( = ?auto_643699 ?auto_643700 ) ) ( not ( = ?auto_643699 ?auto_643701 ) ) ( not ( = ?auto_643699 ?auto_643698 ) ) ( not ( = ?auto_643699 ?auto_643706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643700 ?auto_643701 ?auto_643698 )
      ( MAKE-3CRATE-VERIFY ?auto_643699 ?auto_643700 ?auto_643701 ?auto_643698 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643990 - SURFACE
      ?auto_643991 - SURFACE
      ?auto_643992 - SURFACE
      ?auto_643989 - SURFACE
      ?auto_643993 - SURFACE
    )
    :vars
    (
      ?auto_643995 - HOIST
      ?auto_643994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643995 ?auto_643994 ) ( SURFACE-AT ?auto_643989 ?auto_643994 ) ( CLEAR ?auto_643989 ) ( LIFTING ?auto_643995 ?auto_643993 ) ( IS-CRATE ?auto_643993 ) ( not ( = ?auto_643989 ?auto_643993 ) ) ( ON ?auto_643991 ?auto_643990 ) ( ON ?auto_643992 ?auto_643991 ) ( ON ?auto_643989 ?auto_643992 ) ( not ( = ?auto_643990 ?auto_643991 ) ) ( not ( = ?auto_643990 ?auto_643992 ) ) ( not ( = ?auto_643990 ?auto_643989 ) ) ( not ( = ?auto_643990 ?auto_643993 ) ) ( not ( = ?auto_643991 ?auto_643992 ) ) ( not ( = ?auto_643991 ?auto_643989 ) ) ( not ( = ?auto_643991 ?auto_643993 ) ) ( not ( = ?auto_643992 ?auto_643989 ) ) ( not ( = ?auto_643992 ?auto_643993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643989 ?auto_643993 )
      ( MAKE-4CRATE-VERIFY ?auto_643990 ?auto_643991 ?auto_643992 ?auto_643989 ?auto_643993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644015 - SURFACE
      ?auto_644016 - SURFACE
      ?auto_644017 - SURFACE
      ?auto_644014 - SURFACE
      ?auto_644018 - SURFACE
    )
    :vars
    (
      ?auto_644020 - HOIST
      ?auto_644021 - PLACE
      ?auto_644019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644020 ?auto_644021 ) ( SURFACE-AT ?auto_644014 ?auto_644021 ) ( CLEAR ?auto_644014 ) ( IS-CRATE ?auto_644018 ) ( not ( = ?auto_644014 ?auto_644018 ) ) ( TRUCK-AT ?auto_644019 ?auto_644021 ) ( AVAILABLE ?auto_644020 ) ( IN ?auto_644018 ?auto_644019 ) ( ON ?auto_644014 ?auto_644017 ) ( not ( = ?auto_644017 ?auto_644014 ) ) ( not ( = ?auto_644017 ?auto_644018 ) ) ( ON ?auto_644016 ?auto_644015 ) ( ON ?auto_644017 ?auto_644016 ) ( not ( = ?auto_644015 ?auto_644016 ) ) ( not ( = ?auto_644015 ?auto_644017 ) ) ( not ( = ?auto_644015 ?auto_644014 ) ) ( not ( = ?auto_644015 ?auto_644018 ) ) ( not ( = ?auto_644016 ?auto_644017 ) ) ( not ( = ?auto_644016 ?auto_644014 ) ) ( not ( = ?auto_644016 ?auto_644018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644017 ?auto_644014 ?auto_644018 )
      ( MAKE-4CRATE-VERIFY ?auto_644015 ?auto_644016 ?auto_644017 ?auto_644014 ?auto_644018 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644045 - SURFACE
      ?auto_644046 - SURFACE
      ?auto_644047 - SURFACE
      ?auto_644044 - SURFACE
      ?auto_644048 - SURFACE
    )
    :vars
    (
      ?auto_644050 - HOIST
      ?auto_644049 - PLACE
      ?auto_644052 - TRUCK
      ?auto_644051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644050 ?auto_644049 ) ( SURFACE-AT ?auto_644044 ?auto_644049 ) ( CLEAR ?auto_644044 ) ( IS-CRATE ?auto_644048 ) ( not ( = ?auto_644044 ?auto_644048 ) ) ( AVAILABLE ?auto_644050 ) ( IN ?auto_644048 ?auto_644052 ) ( ON ?auto_644044 ?auto_644047 ) ( not ( = ?auto_644047 ?auto_644044 ) ) ( not ( = ?auto_644047 ?auto_644048 ) ) ( TRUCK-AT ?auto_644052 ?auto_644051 ) ( not ( = ?auto_644051 ?auto_644049 ) ) ( ON ?auto_644046 ?auto_644045 ) ( ON ?auto_644047 ?auto_644046 ) ( not ( = ?auto_644045 ?auto_644046 ) ) ( not ( = ?auto_644045 ?auto_644047 ) ) ( not ( = ?auto_644045 ?auto_644044 ) ) ( not ( = ?auto_644045 ?auto_644048 ) ) ( not ( = ?auto_644046 ?auto_644047 ) ) ( not ( = ?auto_644046 ?auto_644044 ) ) ( not ( = ?auto_644046 ?auto_644048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644047 ?auto_644044 ?auto_644048 )
      ( MAKE-4CRATE-VERIFY ?auto_644045 ?auto_644046 ?auto_644047 ?auto_644044 ?auto_644048 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644079 - SURFACE
      ?auto_644080 - SURFACE
      ?auto_644081 - SURFACE
      ?auto_644078 - SURFACE
      ?auto_644082 - SURFACE
    )
    :vars
    (
      ?auto_644086 - HOIST
      ?auto_644084 - PLACE
      ?auto_644083 - TRUCK
      ?auto_644087 - PLACE
      ?auto_644085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_644086 ?auto_644084 ) ( SURFACE-AT ?auto_644078 ?auto_644084 ) ( CLEAR ?auto_644078 ) ( IS-CRATE ?auto_644082 ) ( not ( = ?auto_644078 ?auto_644082 ) ) ( AVAILABLE ?auto_644086 ) ( ON ?auto_644078 ?auto_644081 ) ( not ( = ?auto_644081 ?auto_644078 ) ) ( not ( = ?auto_644081 ?auto_644082 ) ) ( TRUCK-AT ?auto_644083 ?auto_644087 ) ( not ( = ?auto_644087 ?auto_644084 ) ) ( HOIST-AT ?auto_644085 ?auto_644087 ) ( LIFTING ?auto_644085 ?auto_644082 ) ( not ( = ?auto_644086 ?auto_644085 ) ) ( ON ?auto_644080 ?auto_644079 ) ( ON ?auto_644081 ?auto_644080 ) ( not ( = ?auto_644079 ?auto_644080 ) ) ( not ( = ?auto_644079 ?auto_644081 ) ) ( not ( = ?auto_644079 ?auto_644078 ) ) ( not ( = ?auto_644079 ?auto_644082 ) ) ( not ( = ?auto_644080 ?auto_644081 ) ) ( not ( = ?auto_644080 ?auto_644078 ) ) ( not ( = ?auto_644080 ?auto_644082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644081 ?auto_644078 ?auto_644082 )
      ( MAKE-4CRATE-VERIFY ?auto_644079 ?auto_644080 ?auto_644081 ?auto_644078 ?auto_644082 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644117 - SURFACE
      ?auto_644118 - SURFACE
      ?auto_644119 - SURFACE
      ?auto_644116 - SURFACE
      ?auto_644120 - SURFACE
    )
    :vars
    (
      ?auto_644125 - HOIST
      ?auto_644123 - PLACE
      ?auto_644121 - TRUCK
      ?auto_644122 - PLACE
      ?auto_644124 - HOIST
      ?auto_644126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644125 ?auto_644123 ) ( SURFACE-AT ?auto_644116 ?auto_644123 ) ( CLEAR ?auto_644116 ) ( IS-CRATE ?auto_644120 ) ( not ( = ?auto_644116 ?auto_644120 ) ) ( AVAILABLE ?auto_644125 ) ( ON ?auto_644116 ?auto_644119 ) ( not ( = ?auto_644119 ?auto_644116 ) ) ( not ( = ?auto_644119 ?auto_644120 ) ) ( TRUCK-AT ?auto_644121 ?auto_644122 ) ( not ( = ?auto_644122 ?auto_644123 ) ) ( HOIST-AT ?auto_644124 ?auto_644122 ) ( not ( = ?auto_644125 ?auto_644124 ) ) ( AVAILABLE ?auto_644124 ) ( SURFACE-AT ?auto_644120 ?auto_644122 ) ( ON ?auto_644120 ?auto_644126 ) ( CLEAR ?auto_644120 ) ( not ( = ?auto_644116 ?auto_644126 ) ) ( not ( = ?auto_644120 ?auto_644126 ) ) ( not ( = ?auto_644119 ?auto_644126 ) ) ( ON ?auto_644118 ?auto_644117 ) ( ON ?auto_644119 ?auto_644118 ) ( not ( = ?auto_644117 ?auto_644118 ) ) ( not ( = ?auto_644117 ?auto_644119 ) ) ( not ( = ?auto_644117 ?auto_644116 ) ) ( not ( = ?auto_644117 ?auto_644120 ) ) ( not ( = ?auto_644117 ?auto_644126 ) ) ( not ( = ?auto_644118 ?auto_644119 ) ) ( not ( = ?auto_644118 ?auto_644116 ) ) ( not ( = ?auto_644118 ?auto_644120 ) ) ( not ( = ?auto_644118 ?auto_644126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644119 ?auto_644116 ?auto_644120 )
      ( MAKE-4CRATE-VERIFY ?auto_644117 ?auto_644118 ?auto_644119 ?auto_644116 ?auto_644120 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644156 - SURFACE
      ?auto_644157 - SURFACE
      ?auto_644158 - SURFACE
      ?auto_644155 - SURFACE
      ?auto_644159 - SURFACE
    )
    :vars
    (
      ?auto_644165 - HOIST
      ?auto_644163 - PLACE
      ?auto_644164 - PLACE
      ?auto_644162 - HOIST
      ?auto_644161 - SURFACE
      ?auto_644160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644165 ?auto_644163 ) ( SURFACE-AT ?auto_644155 ?auto_644163 ) ( CLEAR ?auto_644155 ) ( IS-CRATE ?auto_644159 ) ( not ( = ?auto_644155 ?auto_644159 ) ) ( AVAILABLE ?auto_644165 ) ( ON ?auto_644155 ?auto_644158 ) ( not ( = ?auto_644158 ?auto_644155 ) ) ( not ( = ?auto_644158 ?auto_644159 ) ) ( not ( = ?auto_644164 ?auto_644163 ) ) ( HOIST-AT ?auto_644162 ?auto_644164 ) ( not ( = ?auto_644165 ?auto_644162 ) ) ( AVAILABLE ?auto_644162 ) ( SURFACE-AT ?auto_644159 ?auto_644164 ) ( ON ?auto_644159 ?auto_644161 ) ( CLEAR ?auto_644159 ) ( not ( = ?auto_644155 ?auto_644161 ) ) ( not ( = ?auto_644159 ?auto_644161 ) ) ( not ( = ?auto_644158 ?auto_644161 ) ) ( TRUCK-AT ?auto_644160 ?auto_644163 ) ( ON ?auto_644157 ?auto_644156 ) ( ON ?auto_644158 ?auto_644157 ) ( not ( = ?auto_644156 ?auto_644157 ) ) ( not ( = ?auto_644156 ?auto_644158 ) ) ( not ( = ?auto_644156 ?auto_644155 ) ) ( not ( = ?auto_644156 ?auto_644159 ) ) ( not ( = ?auto_644156 ?auto_644161 ) ) ( not ( = ?auto_644157 ?auto_644158 ) ) ( not ( = ?auto_644157 ?auto_644155 ) ) ( not ( = ?auto_644157 ?auto_644159 ) ) ( not ( = ?auto_644157 ?auto_644161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644158 ?auto_644155 ?auto_644159 )
      ( MAKE-4CRATE-VERIFY ?auto_644156 ?auto_644157 ?auto_644158 ?auto_644155 ?auto_644159 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644195 - SURFACE
      ?auto_644196 - SURFACE
      ?auto_644197 - SURFACE
      ?auto_644194 - SURFACE
      ?auto_644198 - SURFACE
    )
    :vars
    (
      ?auto_644203 - HOIST
      ?auto_644204 - PLACE
      ?auto_644201 - PLACE
      ?auto_644202 - HOIST
      ?auto_644199 - SURFACE
      ?auto_644200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644203 ?auto_644204 ) ( IS-CRATE ?auto_644198 ) ( not ( = ?auto_644194 ?auto_644198 ) ) ( not ( = ?auto_644197 ?auto_644194 ) ) ( not ( = ?auto_644197 ?auto_644198 ) ) ( not ( = ?auto_644201 ?auto_644204 ) ) ( HOIST-AT ?auto_644202 ?auto_644201 ) ( not ( = ?auto_644203 ?auto_644202 ) ) ( AVAILABLE ?auto_644202 ) ( SURFACE-AT ?auto_644198 ?auto_644201 ) ( ON ?auto_644198 ?auto_644199 ) ( CLEAR ?auto_644198 ) ( not ( = ?auto_644194 ?auto_644199 ) ) ( not ( = ?auto_644198 ?auto_644199 ) ) ( not ( = ?auto_644197 ?auto_644199 ) ) ( TRUCK-AT ?auto_644200 ?auto_644204 ) ( SURFACE-AT ?auto_644197 ?auto_644204 ) ( CLEAR ?auto_644197 ) ( LIFTING ?auto_644203 ?auto_644194 ) ( IS-CRATE ?auto_644194 ) ( ON ?auto_644196 ?auto_644195 ) ( ON ?auto_644197 ?auto_644196 ) ( not ( = ?auto_644195 ?auto_644196 ) ) ( not ( = ?auto_644195 ?auto_644197 ) ) ( not ( = ?auto_644195 ?auto_644194 ) ) ( not ( = ?auto_644195 ?auto_644198 ) ) ( not ( = ?auto_644195 ?auto_644199 ) ) ( not ( = ?auto_644196 ?auto_644197 ) ) ( not ( = ?auto_644196 ?auto_644194 ) ) ( not ( = ?auto_644196 ?auto_644198 ) ) ( not ( = ?auto_644196 ?auto_644199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644197 ?auto_644194 ?auto_644198 )
      ( MAKE-4CRATE-VERIFY ?auto_644195 ?auto_644196 ?auto_644197 ?auto_644194 ?auto_644198 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644234 - SURFACE
      ?auto_644235 - SURFACE
      ?auto_644236 - SURFACE
      ?auto_644233 - SURFACE
      ?auto_644237 - SURFACE
    )
    :vars
    (
      ?auto_644243 - HOIST
      ?auto_644238 - PLACE
      ?auto_644239 - PLACE
      ?auto_644240 - HOIST
      ?auto_644242 - SURFACE
      ?auto_644241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644243 ?auto_644238 ) ( IS-CRATE ?auto_644237 ) ( not ( = ?auto_644233 ?auto_644237 ) ) ( not ( = ?auto_644236 ?auto_644233 ) ) ( not ( = ?auto_644236 ?auto_644237 ) ) ( not ( = ?auto_644239 ?auto_644238 ) ) ( HOIST-AT ?auto_644240 ?auto_644239 ) ( not ( = ?auto_644243 ?auto_644240 ) ) ( AVAILABLE ?auto_644240 ) ( SURFACE-AT ?auto_644237 ?auto_644239 ) ( ON ?auto_644237 ?auto_644242 ) ( CLEAR ?auto_644237 ) ( not ( = ?auto_644233 ?auto_644242 ) ) ( not ( = ?auto_644237 ?auto_644242 ) ) ( not ( = ?auto_644236 ?auto_644242 ) ) ( TRUCK-AT ?auto_644241 ?auto_644238 ) ( SURFACE-AT ?auto_644236 ?auto_644238 ) ( CLEAR ?auto_644236 ) ( IS-CRATE ?auto_644233 ) ( AVAILABLE ?auto_644243 ) ( IN ?auto_644233 ?auto_644241 ) ( ON ?auto_644235 ?auto_644234 ) ( ON ?auto_644236 ?auto_644235 ) ( not ( = ?auto_644234 ?auto_644235 ) ) ( not ( = ?auto_644234 ?auto_644236 ) ) ( not ( = ?auto_644234 ?auto_644233 ) ) ( not ( = ?auto_644234 ?auto_644237 ) ) ( not ( = ?auto_644234 ?auto_644242 ) ) ( not ( = ?auto_644235 ?auto_644236 ) ) ( not ( = ?auto_644235 ?auto_644233 ) ) ( not ( = ?auto_644235 ?auto_644237 ) ) ( not ( = ?auto_644235 ?auto_644242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644236 ?auto_644233 ?auto_644237 )
      ( MAKE-4CRATE-VERIFY ?auto_644234 ?auto_644235 ?auto_644236 ?auto_644233 ?auto_644237 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644894 - SURFACE
      ?auto_644895 - SURFACE
      ?auto_644896 - SURFACE
      ?auto_644893 - SURFACE
      ?auto_644897 - SURFACE
      ?auto_644898 - SURFACE
    )
    :vars
    (
      ?auto_644899 - HOIST
      ?auto_644900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644899 ?auto_644900 ) ( SURFACE-AT ?auto_644897 ?auto_644900 ) ( CLEAR ?auto_644897 ) ( LIFTING ?auto_644899 ?auto_644898 ) ( IS-CRATE ?auto_644898 ) ( not ( = ?auto_644897 ?auto_644898 ) ) ( ON ?auto_644895 ?auto_644894 ) ( ON ?auto_644896 ?auto_644895 ) ( ON ?auto_644893 ?auto_644896 ) ( ON ?auto_644897 ?auto_644893 ) ( not ( = ?auto_644894 ?auto_644895 ) ) ( not ( = ?auto_644894 ?auto_644896 ) ) ( not ( = ?auto_644894 ?auto_644893 ) ) ( not ( = ?auto_644894 ?auto_644897 ) ) ( not ( = ?auto_644894 ?auto_644898 ) ) ( not ( = ?auto_644895 ?auto_644896 ) ) ( not ( = ?auto_644895 ?auto_644893 ) ) ( not ( = ?auto_644895 ?auto_644897 ) ) ( not ( = ?auto_644895 ?auto_644898 ) ) ( not ( = ?auto_644896 ?auto_644893 ) ) ( not ( = ?auto_644896 ?auto_644897 ) ) ( not ( = ?auto_644896 ?auto_644898 ) ) ( not ( = ?auto_644893 ?auto_644897 ) ) ( not ( = ?auto_644893 ?auto_644898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_644897 ?auto_644898 )
      ( MAKE-5CRATE-VERIFY ?auto_644894 ?auto_644895 ?auto_644896 ?auto_644893 ?auto_644897 ?auto_644898 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644928 - SURFACE
      ?auto_644929 - SURFACE
      ?auto_644930 - SURFACE
      ?auto_644927 - SURFACE
      ?auto_644931 - SURFACE
      ?auto_644932 - SURFACE
    )
    :vars
    (
      ?auto_644935 - HOIST
      ?auto_644933 - PLACE
      ?auto_644934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644935 ?auto_644933 ) ( SURFACE-AT ?auto_644931 ?auto_644933 ) ( CLEAR ?auto_644931 ) ( IS-CRATE ?auto_644932 ) ( not ( = ?auto_644931 ?auto_644932 ) ) ( TRUCK-AT ?auto_644934 ?auto_644933 ) ( AVAILABLE ?auto_644935 ) ( IN ?auto_644932 ?auto_644934 ) ( ON ?auto_644931 ?auto_644927 ) ( not ( = ?auto_644927 ?auto_644931 ) ) ( not ( = ?auto_644927 ?auto_644932 ) ) ( ON ?auto_644929 ?auto_644928 ) ( ON ?auto_644930 ?auto_644929 ) ( ON ?auto_644927 ?auto_644930 ) ( not ( = ?auto_644928 ?auto_644929 ) ) ( not ( = ?auto_644928 ?auto_644930 ) ) ( not ( = ?auto_644928 ?auto_644927 ) ) ( not ( = ?auto_644928 ?auto_644931 ) ) ( not ( = ?auto_644928 ?auto_644932 ) ) ( not ( = ?auto_644929 ?auto_644930 ) ) ( not ( = ?auto_644929 ?auto_644927 ) ) ( not ( = ?auto_644929 ?auto_644931 ) ) ( not ( = ?auto_644929 ?auto_644932 ) ) ( not ( = ?auto_644930 ?auto_644927 ) ) ( not ( = ?auto_644930 ?auto_644931 ) ) ( not ( = ?auto_644930 ?auto_644932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644927 ?auto_644931 ?auto_644932 )
      ( MAKE-5CRATE-VERIFY ?auto_644928 ?auto_644929 ?auto_644930 ?auto_644927 ?auto_644931 ?auto_644932 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644968 - SURFACE
      ?auto_644969 - SURFACE
      ?auto_644970 - SURFACE
      ?auto_644967 - SURFACE
      ?auto_644971 - SURFACE
      ?auto_644972 - SURFACE
    )
    :vars
    (
      ?auto_644976 - HOIST
      ?auto_644975 - PLACE
      ?auto_644974 - TRUCK
      ?auto_644973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644976 ?auto_644975 ) ( SURFACE-AT ?auto_644971 ?auto_644975 ) ( CLEAR ?auto_644971 ) ( IS-CRATE ?auto_644972 ) ( not ( = ?auto_644971 ?auto_644972 ) ) ( AVAILABLE ?auto_644976 ) ( IN ?auto_644972 ?auto_644974 ) ( ON ?auto_644971 ?auto_644967 ) ( not ( = ?auto_644967 ?auto_644971 ) ) ( not ( = ?auto_644967 ?auto_644972 ) ) ( TRUCK-AT ?auto_644974 ?auto_644973 ) ( not ( = ?auto_644973 ?auto_644975 ) ) ( ON ?auto_644969 ?auto_644968 ) ( ON ?auto_644970 ?auto_644969 ) ( ON ?auto_644967 ?auto_644970 ) ( not ( = ?auto_644968 ?auto_644969 ) ) ( not ( = ?auto_644968 ?auto_644970 ) ) ( not ( = ?auto_644968 ?auto_644967 ) ) ( not ( = ?auto_644968 ?auto_644971 ) ) ( not ( = ?auto_644968 ?auto_644972 ) ) ( not ( = ?auto_644969 ?auto_644970 ) ) ( not ( = ?auto_644969 ?auto_644967 ) ) ( not ( = ?auto_644969 ?auto_644971 ) ) ( not ( = ?auto_644969 ?auto_644972 ) ) ( not ( = ?auto_644970 ?auto_644967 ) ) ( not ( = ?auto_644970 ?auto_644971 ) ) ( not ( = ?auto_644970 ?auto_644972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644967 ?auto_644971 ?auto_644972 )
      ( MAKE-5CRATE-VERIFY ?auto_644968 ?auto_644969 ?auto_644970 ?auto_644967 ?auto_644971 ?auto_644972 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645013 - SURFACE
      ?auto_645014 - SURFACE
      ?auto_645015 - SURFACE
      ?auto_645012 - SURFACE
      ?auto_645016 - SURFACE
      ?auto_645017 - SURFACE
    )
    :vars
    (
      ?auto_645020 - HOIST
      ?auto_645019 - PLACE
      ?auto_645021 - TRUCK
      ?auto_645018 - PLACE
      ?auto_645022 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_645020 ?auto_645019 ) ( SURFACE-AT ?auto_645016 ?auto_645019 ) ( CLEAR ?auto_645016 ) ( IS-CRATE ?auto_645017 ) ( not ( = ?auto_645016 ?auto_645017 ) ) ( AVAILABLE ?auto_645020 ) ( ON ?auto_645016 ?auto_645012 ) ( not ( = ?auto_645012 ?auto_645016 ) ) ( not ( = ?auto_645012 ?auto_645017 ) ) ( TRUCK-AT ?auto_645021 ?auto_645018 ) ( not ( = ?auto_645018 ?auto_645019 ) ) ( HOIST-AT ?auto_645022 ?auto_645018 ) ( LIFTING ?auto_645022 ?auto_645017 ) ( not ( = ?auto_645020 ?auto_645022 ) ) ( ON ?auto_645014 ?auto_645013 ) ( ON ?auto_645015 ?auto_645014 ) ( ON ?auto_645012 ?auto_645015 ) ( not ( = ?auto_645013 ?auto_645014 ) ) ( not ( = ?auto_645013 ?auto_645015 ) ) ( not ( = ?auto_645013 ?auto_645012 ) ) ( not ( = ?auto_645013 ?auto_645016 ) ) ( not ( = ?auto_645013 ?auto_645017 ) ) ( not ( = ?auto_645014 ?auto_645015 ) ) ( not ( = ?auto_645014 ?auto_645012 ) ) ( not ( = ?auto_645014 ?auto_645016 ) ) ( not ( = ?auto_645014 ?auto_645017 ) ) ( not ( = ?auto_645015 ?auto_645012 ) ) ( not ( = ?auto_645015 ?auto_645016 ) ) ( not ( = ?auto_645015 ?auto_645017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645012 ?auto_645016 ?auto_645017 )
      ( MAKE-5CRATE-VERIFY ?auto_645013 ?auto_645014 ?auto_645015 ?auto_645012 ?auto_645016 ?auto_645017 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645063 - SURFACE
      ?auto_645064 - SURFACE
      ?auto_645065 - SURFACE
      ?auto_645062 - SURFACE
      ?auto_645066 - SURFACE
      ?auto_645067 - SURFACE
    )
    :vars
    (
      ?auto_645069 - HOIST
      ?auto_645068 - PLACE
      ?auto_645073 - TRUCK
      ?auto_645072 - PLACE
      ?auto_645071 - HOIST
      ?auto_645070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645069 ?auto_645068 ) ( SURFACE-AT ?auto_645066 ?auto_645068 ) ( CLEAR ?auto_645066 ) ( IS-CRATE ?auto_645067 ) ( not ( = ?auto_645066 ?auto_645067 ) ) ( AVAILABLE ?auto_645069 ) ( ON ?auto_645066 ?auto_645062 ) ( not ( = ?auto_645062 ?auto_645066 ) ) ( not ( = ?auto_645062 ?auto_645067 ) ) ( TRUCK-AT ?auto_645073 ?auto_645072 ) ( not ( = ?auto_645072 ?auto_645068 ) ) ( HOIST-AT ?auto_645071 ?auto_645072 ) ( not ( = ?auto_645069 ?auto_645071 ) ) ( AVAILABLE ?auto_645071 ) ( SURFACE-AT ?auto_645067 ?auto_645072 ) ( ON ?auto_645067 ?auto_645070 ) ( CLEAR ?auto_645067 ) ( not ( = ?auto_645066 ?auto_645070 ) ) ( not ( = ?auto_645067 ?auto_645070 ) ) ( not ( = ?auto_645062 ?auto_645070 ) ) ( ON ?auto_645064 ?auto_645063 ) ( ON ?auto_645065 ?auto_645064 ) ( ON ?auto_645062 ?auto_645065 ) ( not ( = ?auto_645063 ?auto_645064 ) ) ( not ( = ?auto_645063 ?auto_645065 ) ) ( not ( = ?auto_645063 ?auto_645062 ) ) ( not ( = ?auto_645063 ?auto_645066 ) ) ( not ( = ?auto_645063 ?auto_645067 ) ) ( not ( = ?auto_645063 ?auto_645070 ) ) ( not ( = ?auto_645064 ?auto_645065 ) ) ( not ( = ?auto_645064 ?auto_645062 ) ) ( not ( = ?auto_645064 ?auto_645066 ) ) ( not ( = ?auto_645064 ?auto_645067 ) ) ( not ( = ?auto_645064 ?auto_645070 ) ) ( not ( = ?auto_645065 ?auto_645062 ) ) ( not ( = ?auto_645065 ?auto_645066 ) ) ( not ( = ?auto_645065 ?auto_645067 ) ) ( not ( = ?auto_645065 ?auto_645070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645062 ?auto_645066 ?auto_645067 )
      ( MAKE-5CRATE-VERIFY ?auto_645063 ?auto_645064 ?auto_645065 ?auto_645062 ?auto_645066 ?auto_645067 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645114 - SURFACE
      ?auto_645115 - SURFACE
      ?auto_645116 - SURFACE
      ?auto_645113 - SURFACE
      ?auto_645117 - SURFACE
      ?auto_645118 - SURFACE
    )
    :vars
    (
      ?auto_645124 - HOIST
      ?auto_645121 - PLACE
      ?auto_645123 - PLACE
      ?auto_645119 - HOIST
      ?auto_645122 - SURFACE
      ?auto_645120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645124 ?auto_645121 ) ( SURFACE-AT ?auto_645117 ?auto_645121 ) ( CLEAR ?auto_645117 ) ( IS-CRATE ?auto_645118 ) ( not ( = ?auto_645117 ?auto_645118 ) ) ( AVAILABLE ?auto_645124 ) ( ON ?auto_645117 ?auto_645113 ) ( not ( = ?auto_645113 ?auto_645117 ) ) ( not ( = ?auto_645113 ?auto_645118 ) ) ( not ( = ?auto_645123 ?auto_645121 ) ) ( HOIST-AT ?auto_645119 ?auto_645123 ) ( not ( = ?auto_645124 ?auto_645119 ) ) ( AVAILABLE ?auto_645119 ) ( SURFACE-AT ?auto_645118 ?auto_645123 ) ( ON ?auto_645118 ?auto_645122 ) ( CLEAR ?auto_645118 ) ( not ( = ?auto_645117 ?auto_645122 ) ) ( not ( = ?auto_645118 ?auto_645122 ) ) ( not ( = ?auto_645113 ?auto_645122 ) ) ( TRUCK-AT ?auto_645120 ?auto_645121 ) ( ON ?auto_645115 ?auto_645114 ) ( ON ?auto_645116 ?auto_645115 ) ( ON ?auto_645113 ?auto_645116 ) ( not ( = ?auto_645114 ?auto_645115 ) ) ( not ( = ?auto_645114 ?auto_645116 ) ) ( not ( = ?auto_645114 ?auto_645113 ) ) ( not ( = ?auto_645114 ?auto_645117 ) ) ( not ( = ?auto_645114 ?auto_645118 ) ) ( not ( = ?auto_645114 ?auto_645122 ) ) ( not ( = ?auto_645115 ?auto_645116 ) ) ( not ( = ?auto_645115 ?auto_645113 ) ) ( not ( = ?auto_645115 ?auto_645117 ) ) ( not ( = ?auto_645115 ?auto_645118 ) ) ( not ( = ?auto_645115 ?auto_645122 ) ) ( not ( = ?auto_645116 ?auto_645113 ) ) ( not ( = ?auto_645116 ?auto_645117 ) ) ( not ( = ?auto_645116 ?auto_645118 ) ) ( not ( = ?auto_645116 ?auto_645122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645113 ?auto_645117 ?auto_645118 )
      ( MAKE-5CRATE-VERIFY ?auto_645114 ?auto_645115 ?auto_645116 ?auto_645113 ?auto_645117 ?auto_645118 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645165 - SURFACE
      ?auto_645166 - SURFACE
      ?auto_645167 - SURFACE
      ?auto_645164 - SURFACE
      ?auto_645168 - SURFACE
      ?auto_645169 - SURFACE
    )
    :vars
    (
      ?auto_645171 - HOIST
      ?auto_645174 - PLACE
      ?auto_645175 - PLACE
      ?auto_645173 - HOIST
      ?auto_645172 - SURFACE
      ?auto_645170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645171 ?auto_645174 ) ( IS-CRATE ?auto_645169 ) ( not ( = ?auto_645168 ?auto_645169 ) ) ( not ( = ?auto_645164 ?auto_645168 ) ) ( not ( = ?auto_645164 ?auto_645169 ) ) ( not ( = ?auto_645175 ?auto_645174 ) ) ( HOIST-AT ?auto_645173 ?auto_645175 ) ( not ( = ?auto_645171 ?auto_645173 ) ) ( AVAILABLE ?auto_645173 ) ( SURFACE-AT ?auto_645169 ?auto_645175 ) ( ON ?auto_645169 ?auto_645172 ) ( CLEAR ?auto_645169 ) ( not ( = ?auto_645168 ?auto_645172 ) ) ( not ( = ?auto_645169 ?auto_645172 ) ) ( not ( = ?auto_645164 ?auto_645172 ) ) ( TRUCK-AT ?auto_645170 ?auto_645174 ) ( SURFACE-AT ?auto_645164 ?auto_645174 ) ( CLEAR ?auto_645164 ) ( LIFTING ?auto_645171 ?auto_645168 ) ( IS-CRATE ?auto_645168 ) ( ON ?auto_645166 ?auto_645165 ) ( ON ?auto_645167 ?auto_645166 ) ( ON ?auto_645164 ?auto_645167 ) ( not ( = ?auto_645165 ?auto_645166 ) ) ( not ( = ?auto_645165 ?auto_645167 ) ) ( not ( = ?auto_645165 ?auto_645164 ) ) ( not ( = ?auto_645165 ?auto_645168 ) ) ( not ( = ?auto_645165 ?auto_645169 ) ) ( not ( = ?auto_645165 ?auto_645172 ) ) ( not ( = ?auto_645166 ?auto_645167 ) ) ( not ( = ?auto_645166 ?auto_645164 ) ) ( not ( = ?auto_645166 ?auto_645168 ) ) ( not ( = ?auto_645166 ?auto_645169 ) ) ( not ( = ?auto_645166 ?auto_645172 ) ) ( not ( = ?auto_645167 ?auto_645164 ) ) ( not ( = ?auto_645167 ?auto_645168 ) ) ( not ( = ?auto_645167 ?auto_645169 ) ) ( not ( = ?auto_645167 ?auto_645172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645164 ?auto_645168 ?auto_645169 )
      ( MAKE-5CRATE-VERIFY ?auto_645165 ?auto_645166 ?auto_645167 ?auto_645164 ?auto_645168 ?auto_645169 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645216 - SURFACE
      ?auto_645217 - SURFACE
      ?auto_645218 - SURFACE
      ?auto_645215 - SURFACE
      ?auto_645219 - SURFACE
      ?auto_645220 - SURFACE
    )
    :vars
    (
      ?auto_645222 - HOIST
      ?auto_645224 - PLACE
      ?auto_645223 - PLACE
      ?auto_645225 - HOIST
      ?auto_645226 - SURFACE
      ?auto_645221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645222 ?auto_645224 ) ( IS-CRATE ?auto_645220 ) ( not ( = ?auto_645219 ?auto_645220 ) ) ( not ( = ?auto_645215 ?auto_645219 ) ) ( not ( = ?auto_645215 ?auto_645220 ) ) ( not ( = ?auto_645223 ?auto_645224 ) ) ( HOIST-AT ?auto_645225 ?auto_645223 ) ( not ( = ?auto_645222 ?auto_645225 ) ) ( AVAILABLE ?auto_645225 ) ( SURFACE-AT ?auto_645220 ?auto_645223 ) ( ON ?auto_645220 ?auto_645226 ) ( CLEAR ?auto_645220 ) ( not ( = ?auto_645219 ?auto_645226 ) ) ( not ( = ?auto_645220 ?auto_645226 ) ) ( not ( = ?auto_645215 ?auto_645226 ) ) ( TRUCK-AT ?auto_645221 ?auto_645224 ) ( SURFACE-AT ?auto_645215 ?auto_645224 ) ( CLEAR ?auto_645215 ) ( IS-CRATE ?auto_645219 ) ( AVAILABLE ?auto_645222 ) ( IN ?auto_645219 ?auto_645221 ) ( ON ?auto_645217 ?auto_645216 ) ( ON ?auto_645218 ?auto_645217 ) ( ON ?auto_645215 ?auto_645218 ) ( not ( = ?auto_645216 ?auto_645217 ) ) ( not ( = ?auto_645216 ?auto_645218 ) ) ( not ( = ?auto_645216 ?auto_645215 ) ) ( not ( = ?auto_645216 ?auto_645219 ) ) ( not ( = ?auto_645216 ?auto_645220 ) ) ( not ( = ?auto_645216 ?auto_645226 ) ) ( not ( = ?auto_645217 ?auto_645218 ) ) ( not ( = ?auto_645217 ?auto_645215 ) ) ( not ( = ?auto_645217 ?auto_645219 ) ) ( not ( = ?auto_645217 ?auto_645220 ) ) ( not ( = ?auto_645217 ?auto_645226 ) ) ( not ( = ?auto_645218 ?auto_645215 ) ) ( not ( = ?auto_645218 ?auto_645219 ) ) ( not ( = ?auto_645218 ?auto_645220 ) ) ( not ( = ?auto_645218 ?auto_645226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645215 ?auto_645219 ?auto_645220 )
      ( MAKE-5CRATE-VERIFY ?auto_645216 ?auto_645217 ?auto_645218 ?auto_645215 ?auto_645219 ?auto_645220 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646425 - SURFACE
      ?auto_646426 - SURFACE
      ?auto_646427 - SURFACE
      ?auto_646424 - SURFACE
      ?auto_646428 - SURFACE
      ?auto_646430 - SURFACE
      ?auto_646429 - SURFACE
    )
    :vars
    (
      ?auto_646431 - HOIST
      ?auto_646432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646431 ?auto_646432 ) ( SURFACE-AT ?auto_646430 ?auto_646432 ) ( CLEAR ?auto_646430 ) ( LIFTING ?auto_646431 ?auto_646429 ) ( IS-CRATE ?auto_646429 ) ( not ( = ?auto_646430 ?auto_646429 ) ) ( ON ?auto_646426 ?auto_646425 ) ( ON ?auto_646427 ?auto_646426 ) ( ON ?auto_646424 ?auto_646427 ) ( ON ?auto_646428 ?auto_646424 ) ( ON ?auto_646430 ?auto_646428 ) ( not ( = ?auto_646425 ?auto_646426 ) ) ( not ( = ?auto_646425 ?auto_646427 ) ) ( not ( = ?auto_646425 ?auto_646424 ) ) ( not ( = ?auto_646425 ?auto_646428 ) ) ( not ( = ?auto_646425 ?auto_646430 ) ) ( not ( = ?auto_646425 ?auto_646429 ) ) ( not ( = ?auto_646426 ?auto_646427 ) ) ( not ( = ?auto_646426 ?auto_646424 ) ) ( not ( = ?auto_646426 ?auto_646428 ) ) ( not ( = ?auto_646426 ?auto_646430 ) ) ( not ( = ?auto_646426 ?auto_646429 ) ) ( not ( = ?auto_646427 ?auto_646424 ) ) ( not ( = ?auto_646427 ?auto_646428 ) ) ( not ( = ?auto_646427 ?auto_646430 ) ) ( not ( = ?auto_646427 ?auto_646429 ) ) ( not ( = ?auto_646424 ?auto_646428 ) ) ( not ( = ?auto_646424 ?auto_646430 ) ) ( not ( = ?auto_646424 ?auto_646429 ) ) ( not ( = ?auto_646428 ?auto_646430 ) ) ( not ( = ?auto_646428 ?auto_646429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_646430 ?auto_646429 )
      ( MAKE-6CRATE-VERIFY ?auto_646425 ?auto_646426 ?auto_646427 ?auto_646424 ?auto_646428 ?auto_646430 ?auto_646429 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646469 - SURFACE
      ?auto_646470 - SURFACE
      ?auto_646471 - SURFACE
      ?auto_646468 - SURFACE
      ?auto_646472 - SURFACE
      ?auto_646474 - SURFACE
      ?auto_646473 - SURFACE
    )
    :vars
    (
      ?auto_646475 - HOIST
      ?auto_646477 - PLACE
      ?auto_646476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646475 ?auto_646477 ) ( SURFACE-AT ?auto_646474 ?auto_646477 ) ( CLEAR ?auto_646474 ) ( IS-CRATE ?auto_646473 ) ( not ( = ?auto_646474 ?auto_646473 ) ) ( TRUCK-AT ?auto_646476 ?auto_646477 ) ( AVAILABLE ?auto_646475 ) ( IN ?auto_646473 ?auto_646476 ) ( ON ?auto_646474 ?auto_646472 ) ( not ( = ?auto_646472 ?auto_646474 ) ) ( not ( = ?auto_646472 ?auto_646473 ) ) ( ON ?auto_646470 ?auto_646469 ) ( ON ?auto_646471 ?auto_646470 ) ( ON ?auto_646468 ?auto_646471 ) ( ON ?auto_646472 ?auto_646468 ) ( not ( = ?auto_646469 ?auto_646470 ) ) ( not ( = ?auto_646469 ?auto_646471 ) ) ( not ( = ?auto_646469 ?auto_646468 ) ) ( not ( = ?auto_646469 ?auto_646472 ) ) ( not ( = ?auto_646469 ?auto_646474 ) ) ( not ( = ?auto_646469 ?auto_646473 ) ) ( not ( = ?auto_646470 ?auto_646471 ) ) ( not ( = ?auto_646470 ?auto_646468 ) ) ( not ( = ?auto_646470 ?auto_646472 ) ) ( not ( = ?auto_646470 ?auto_646474 ) ) ( not ( = ?auto_646470 ?auto_646473 ) ) ( not ( = ?auto_646471 ?auto_646468 ) ) ( not ( = ?auto_646471 ?auto_646472 ) ) ( not ( = ?auto_646471 ?auto_646474 ) ) ( not ( = ?auto_646471 ?auto_646473 ) ) ( not ( = ?auto_646468 ?auto_646472 ) ) ( not ( = ?auto_646468 ?auto_646474 ) ) ( not ( = ?auto_646468 ?auto_646473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646472 ?auto_646474 ?auto_646473 )
      ( MAKE-6CRATE-VERIFY ?auto_646469 ?auto_646470 ?auto_646471 ?auto_646468 ?auto_646472 ?auto_646474 ?auto_646473 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646520 - SURFACE
      ?auto_646521 - SURFACE
      ?auto_646522 - SURFACE
      ?auto_646519 - SURFACE
      ?auto_646523 - SURFACE
      ?auto_646525 - SURFACE
      ?auto_646524 - SURFACE
    )
    :vars
    (
      ?auto_646527 - HOIST
      ?auto_646526 - PLACE
      ?auto_646528 - TRUCK
      ?auto_646529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646527 ?auto_646526 ) ( SURFACE-AT ?auto_646525 ?auto_646526 ) ( CLEAR ?auto_646525 ) ( IS-CRATE ?auto_646524 ) ( not ( = ?auto_646525 ?auto_646524 ) ) ( AVAILABLE ?auto_646527 ) ( IN ?auto_646524 ?auto_646528 ) ( ON ?auto_646525 ?auto_646523 ) ( not ( = ?auto_646523 ?auto_646525 ) ) ( not ( = ?auto_646523 ?auto_646524 ) ) ( TRUCK-AT ?auto_646528 ?auto_646529 ) ( not ( = ?auto_646529 ?auto_646526 ) ) ( ON ?auto_646521 ?auto_646520 ) ( ON ?auto_646522 ?auto_646521 ) ( ON ?auto_646519 ?auto_646522 ) ( ON ?auto_646523 ?auto_646519 ) ( not ( = ?auto_646520 ?auto_646521 ) ) ( not ( = ?auto_646520 ?auto_646522 ) ) ( not ( = ?auto_646520 ?auto_646519 ) ) ( not ( = ?auto_646520 ?auto_646523 ) ) ( not ( = ?auto_646520 ?auto_646525 ) ) ( not ( = ?auto_646520 ?auto_646524 ) ) ( not ( = ?auto_646521 ?auto_646522 ) ) ( not ( = ?auto_646521 ?auto_646519 ) ) ( not ( = ?auto_646521 ?auto_646523 ) ) ( not ( = ?auto_646521 ?auto_646525 ) ) ( not ( = ?auto_646521 ?auto_646524 ) ) ( not ( = ?auto_646522 ?auto_646519 ) ) ( not ( = ?auto_646522 ?auto_646523 ) ) ( not ( = ?auto_646522 ?auto_646525 ) ) ( not ( = ?auto_646522 ?auto_646524 ) ) ( not ( = ?auto_646519 ?auto_646523 ) ) ( not ( = ?auto_646519 ?auto_646525 ) ) ( not ( = ?auto_646519 ?auto_646524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646523 ?auto_646525 ?auto_646524 )
      ( MAKE-6CRATE-VERIFY ?auto_646520 ?auto_646521 ?auto_646522 ?auto_646519 ?auto_646523 ?auto_646525 ?auto_646524 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646577 - SURFACE
      ?auto_646578 - SURFACE
      ?auto_646579 - SURFACE
      ?auto_646576 - SURFACE
      ?auto_646580 - SURFACE
      ?auto_646582 - SURFACE
      ?auto_646581 - SURFACE
    )
    :vars
    (
      ?auto_646586 - HOIST
      ?auto_646584 - PLACE
      ?auto_646585 - TRUCK
      ?auto_646587 - PLACE
      ?auto_646583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_646586 ?auto_646584 ) ( SURFACE-AT ?auto_646582 ?auto_646584 ) ( CLEAR ?auto_646582 ) ( IS-CRATE ?auto_646581 ) ( not ( = ?auto_646582 ?auto_646581 ) ) ( AVAILABLE ?auto_646586 ) ( ON ?auto_646582 ?auto_646580 ) ( not ( = ?auto_646580 ?auto_646582 ) ) ( not ( = ?auto_646580 ?auto_646581 ) ) ( TRUCK-AT ?auto_646585 ?auto_646587 ) ( not ( = ?auto_646587 ?auto_646584 ) ) ( HOIST-AT ?auto_646583 ?auto_646587 ) ( LIFTING ?auto_646583 ?auto_646581 ) ( not ( = ?auto_646586 ?auto_646583 ) ) ( ON ?auto_646578 ?auto_646577 ) ( ON ?auto_646579 ?auto_646578 ) ( ON ?auto_646576 ?auto_646579 ) ( ON ?auto_646580 ?auto_646576 ) ( not ( = ?auto_646577 ?auto_646578 ) ) ( not ( = ?auto_646577 ?auto_646579 ) ) ( not ( = ?auto_646577 ?auto_646576 ) ) ( not ( = ?auto_646577 ?auto_646580 ) ) ( not ( = ?auto_646577 ?auto_646582 ) ) ( not ( = ?auto_646577 ?auto_646581 ) ) ( not ( = ?auto_646578 ?auto_646579 ) ) ( not ( = ?auto_646578 ?auto_646576 ) ) ( not ( = ?auto_646578 ?auto_646580 ) ) ( not ( = ?auto_646578 ?auto_646582 ) ) ( not ( = ?auto_646578 ?auto_646581 ) ) ( not ( = ?auto_646579 ?auto_646576 ) ) ( not ( = ?auto_646579 ?auto_646580 ) ) ( not ( = ?auto_646579 ?auto_646582 ) ) ( not ( = ?auto_646579 ?auto_646581 ) ) ( not ( = ?auto_646576 ?auto_646580 ) ) ( not ( = ?auto_646576 ?auto_646582 ) ) ( not ( = ?auto_646576 ?auto_646581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646580 ?auto_646582 ?auto_646581 )
      ( MAKE-6CRATE-VERIFY ?auto_646577 ?auto_646578 ?auto_646579 ?auto_646576 ?auto_646580 ?auto_646582 ?auto_646581 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646640 - SURFACE
      ?auto_646641 - SURFACE
      ?auto_646642 - SURFACE
      ?auto_646639 - SURFACE
      ?auto_646643 - SURFACE
      ?auto_646645 - SURFACE
      ?auto_646644 - SURFACE
    )
    :vars
    (
      ?auto_646649 - HOIST
      ?auto_646646 - PLACE
      ?auto_646651 - TRUCK
      ?auto_646647 - PLACE
      ?auto_646650 - HOIST
      ?auto_646648 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646649 ?auto_646646 ) ( SURFACE-AT ?auto_646645 ?auto_646646 ) ( CLEAR ?auto_646645 ) ( IS-CRATE ?auto_646644 ) ( not ( = ?auto_646645 ?auto_646644 ) ) ( AVAILABLE ?auto_646649 ) ( ON ?auto_646645 ?auto_646643 ) ( not ( = ?auto_646643 ?auto_646645 ) ) ( not ( = ?auto_646643 ?auto_646644 ) ) ( TRUCK-AT ?auto_646651 ?auto_646647 ) ( not ( = ?auto_646647 ?auto_646646 ) ) ( HOIST-AT ?auto_646650 ?auto_646647 ) ( not ( = ?auto_646649 ?auto_646650 ) ) ( AVAILABLE ?auto_646650 ) ( SURFACE-AT ?auto_646644 ?auto_646647 ) ( ON ?auto_646644 ?auto_646648 ) ( CLEAR ?auto_646644 ) ( not ( = ?auto_646645 ?auto_646648 ) ) ( not ( = ?auto_646644 ?auto_646648 ) ) ( not ( = ?auto_646643 ?auto_646648 ) ) ( ON ?auto_646641 ?auto_646640 ) ( ON ?auto_646642 ?auto_646641 ) ( ON ?auto_646639 ?auto_646642 ) ( ON ?auto_646643 ?auto_646639 ) ( not ( = ?auto_646640 ?auto_646641 ) ) ( not ( = ?auto_646640 ?auto_646642 ) ) ( not ( = ?auto_646640 ?auto_646639 ) ) ( not ( = ?auto_646640 ?auto_646643 ) ) ( not ( = ?auto_646640 ?auto_646645 ) ) ( not ( = ?auto_646640 ?auto_646644 ) ) ( not ( = ?auto_646640 ?auto_646648 ) ) ( not ( = ?auto_646641 ?auto_646642 ) ) ( not ( = ?auto_646641 ?auto_646639 ) ) ( not ( = ?auto_646641 ?auto_646643 ) ) ( not ( = ?auto_646641 ?auto_646645 ) ) ( not ( = ?auto_646641 ?auto_646644 ) ) ( not ( = ?auto_646641 ?auto_646648 ) ) ( not ( = ?auto_646642 ?auto_646639 ) ) ( not ( = ?auto_646642 ?auto_646643 ) ) ( not ( = ?auto_646642 ?auto_646645 ) ) ( not ( = ?auto_646642 ?auto_646644 ) ) ( not ( = ?auto_646642 ?auto_646648 ) ) ( not ( = ?auto_646639 ?auto_646643 ) ) ( not ( = ?auto_646639 ?auto_646645 ) ) ( not ( = ?auto_646639 ?auto_646644 ) ) ( not ( = ?auto_646639 ?auto_646648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646643 ?auto_646645 ?auto_646644 )
      ( MAKE-6CRATE-VERIFY ?auto_646640 ?auto_646641 ?auto_646642 ?auto_646639 ?auto_646643 ?auto_646645 ?auto_646644 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646704 - SURFACE
      ?auto_646705 - SURFACE
      ?auto_646706 - SURFACE
      ?auto_646703 - SURFACE
      ?auto_646707 - SURFACE
      ?auto_646709 - SURFACE
      ?auto_646708 - SURFACE
    )
    :vars
    (
      ?auto_646715 - HOIST
      ?auto_646713 - PLACE
      ?auto_646714 - PLACE
      ?auto_646712 - HOIST
      ?auto_646710 - SURFACE
      ?auto_646711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646715 ?auto_646713 ) ( SURFACE-AT ?auto_646709 ?auto_646713 ) ( CLEAR ?auto_646709 ) ( IS-CRATE ?auto_646708 ) ( not ( = ?auto_646709 ?auto_646708 ) ) ( AVAILABLE ?auto_646715 ) ( ON ?auto_646709 ?auto_646707 ) ( not ( = ?auto_646707 ?auto_646709 ) ) ( not ( = ?auto_646707 ?auto_646708 ) ) ( not ( = ?auto_646714 ?auto_646713 ) ) ( HOIST-AT ?auto_646712 ?auto_646714 ) ( not ( = ?auto_646715 ?auto_646712 ) ) ( AVAILABLE ?auto_646712 ) ( SURFACE-AT ?auto_646708 ?auto_646714 ) ( ON ?auto_646708 ?auto_646710 ) ( CLEAR ?auto_646708 ) ( not ( = ?auto_646709 ?auto_646710 ) ) ( not ( = ?auto_646708 ?auto_646710 ) ) ( not ( = ?auto_646707 ?auto_646710 ) ) ( TRUCK-AT ?auto_646711 ?auto_646713 ) ( ON ?auto_646705 ?auto_646704 ) ( ON ?auto_646706 ?auto_646705 ) ( ON ?auto_646703 ?auto_646706 ) ( ON ?auto_646707 ?auto_646703 ) ( not ( = ?auto_646704 ?auto_646705 ) ) ( not ( = ?auto_646704 ?auto_646706 ) ) ( not ( = ?auto_646704 ?auto_646703 ) ) ( not ( = ?auto_646704 ?auto_646707 ) ) ( not ( = ?auto_646704 ?auto_646709 ) ) ( not ( = ?auto_646704 ?auto_646708 ) ) ( not ( = ?auto_646704 ?auto_646710 ) ) ( not ( = ?auto_646705 ?auto_646706 ) ) ( not ( = ?auto_646705 ?auto_646703 ) ) ( not ( = ?auto_646705 ?auto_646707 ) ) ( not ( = ?auto_646705 ?auto_646709 ) ) ( not ( = ?auto_646705 ?auto_646708 ) ) ( not ( = ?auto_646705 ?auto_646710 ) ) ( not ( = ?auto_646706 ?auto_646703 ) ) ( not ( = ?auto_646706 ?auto_646707 ) ) ( not ( = ?auto_646706 ?auto_646709 ) ) ( not ( = ?auto_646706 ?auto_646708 ) ) ( not ( = ?auto_646706 ?auto_646710 ) ) ( not ( = ?auto_646703 ?auto_646707 ) ) ( not ( = ?auto_646703 ?auto_646709 ) ) ( not ( = ?auto_646703 ?auto_646708 ) ) ( not ( = ?auto_646703 ?auto_646710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646707 ?auto_646709 ?auto_646708 )
      ( MAKE-6CRATE-VERIFY ?auto_646704 ?auto_646705 ?auto_646706 ?auto_646703 ?auto_646707 ?auto_646709 ?auto_646708 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646768 - SURFACE
      ?auto_646769 - SURFACE
      ?auto_646770 - SURFACE
      ?auto_646767 - SURFACE
      ?auto_646771 - SURFACE
      ?auto_646773 - SURFACE
      ?auto_646772 - SURFACE
    )
    :vars
    (
      ?auto_646777 - HOIST
      ?auto_646776 - PLACE
      ?auto_646774 - PLACE
      ?auto_646778 - HOIST
      ?auto_646775 - SURFACE
      ?auto_646779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646777 ?auto_646776 ) ( IS-CRATE ?auto_646772 ) ( not ( = ?auto_646773 ?auto_646772 ) ) ( not ( = ?auto_646771 ?auto_646773 ) ) ( not ( = ?auto_646771 ?auto_646772 ) ) ( not ( = ?auto_646774 ?auto_646776 ) ) ( HOIST-AT ?auto_646778 ?auto_646774 ) ( not ( = ?auto_646777 ?auto_646778 ) ) ( AVAILABLE ?auto_646778 ) ( SURFACE-AT ?auto_646772 ?auto_646774 ) ( ON ?auto_646772 ?auto_646775 ) ( CLEAR ?auto_646772 ) ( not ( = ?auto_646773 ?auto_646775 ) ) ( not ( = ?auto_646772 ?auto_646775 ) ) ( not ( = ?auto_646771 ?auto_646775 ) ) ( TRUCK-AT ?auto_646779 ?auto_646776 ) ( SURFACE-AT ?auto_646771 ?auto_646776 ) ( CLEAR ?auto_646771 ) ( LIFTING ?auto_646777 ?auto_646773 ) ( IS-CRATE ?auto_646773 ) ( ON ?auto_646769 ?auto_646768 ) ( ON ?auto_646770 ?auto_646769 ) ( ON ?auto_646767 ?auto_646770 ) ( ON ?auto_646771 ?auto_646767 ) ( not ( = ?auto_646768 ?auto_646769 ) ) ( not ( = ?auto_646768 ?auto_646770 ) ) ( not ( = ?auto_646768 ?auto_646767 ) ) ( not ( = ?auto_646768 ?auto_646771 ) ) ( not ( = ?auto_646768 ?auto_646773 ) ) ( not ( = ?auto_646768 ?auto_646772 ) ) ( not ( = ?auto_646768 ?auto_646775 ) ) ( not ( = ?auto_646769 ?auto_646770 ) ) ( not ( = ?auto_646769 ?auto_646767 ) ) ( not ( = ?auto_646769 ?auto_646771 ) ) ( not ( = ?auto_646769 ?auto_646773 ) ) ( not ( = ?auto_646769 ?auto_646772 ) ) ( not ( = ?auto_646769 ?auto_646775 ) ) ( not ( = ?auto_646770 ?auto_646767 ) ) ( not ( = ?auto_646770 ?auto_646771 ) ) ( not ( = ?auto_646770 ?auto_646773 ) ) ( not ( = ?auto_646770 ?auto_646772 ) ) ( not ( = ?auto_646770 ?auto_646775 ) ) ( not ( = ?auto_646767 ?auto_646771 ) ) ( not ( = ?auto_646767 ?auto_646773 ) ) ( not ( = ?auto_646767 ?auto_646772 ) ) ( not ( = ?auto_646767 ?auto_646775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646771 ?auto_646773 ?auto_646772 )
      ( MAKE-6CRATE-VERIFY ?auto_646768 ?auto_646769 ?auto_646770 ?auto_646767 ?auto_646771 ?auto_646773 ?auto_646772 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646832 - SURFACE
      ?auto_646833 - SURFACE
      ?auto_646834 - SURFACE
      ?auto_646831 - SURFACE
      ?auto_646835 - SURFACE
      ?auto_646837 - SURFACE
      ?auto_646836 - SURFACE
    )
    :vars
    (
      ?auto_646840 - HOIST
      ?auto_646843 - PLACE
      ?auto_646842 - PLACE
      ?auto_646839 - HOIST
      ?auto_646841 - SURFACE
      ?auto_646838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646840 ?auto_646843 ) ( IS-CRATE ?auto_646836 ) ( not ( = ?auto_646837 ?auto_646836 ) ) ( not ( = ?auto_646835 ?auto_646837 ) ) ( not ( = ?auto_646835 ?auto_646836 ) ) ( not ( = ?auto_646842 ?auto_646843 ) ) ( HOIST-AT ?auto_646839 ?auto_646842 ) ( not ( = ?auto_646840 ?auto_646839 ) ) ( AVAILABLE ?auto_646839 ) ( SURFACE-AT ?auto_646836 ?auto_646842 ) ( ON ?auto_646836 ?auto_646841 ) ( CLEAR ?auto_646836 ) ( not ( = ?auto_646837 ?auto_646841 ) ) ( not ( = ?auto_646836 ?auto_646841 ) ) ( not ( = ?auto_646835 ?auto_646841 ) ) ( TRUCK-AT ?auto_646838 ?auto_646843 ) ( SURFACE-AT ?auto_646835 ?auto_646843 ) ( CLEAR ?auto_646835 ) ( IS-CRATE ?auto_646837 ) ( AVAILABLE ?auto_646840 ) ( IN ?auto_646837 ?auto_646838 ) ( ON ?auto_646833 ?auto_646832 ) ( ON ?auto_646834 ?auto_646833 ) ( ON ?auto_646831 ?auto_646834 ) ( ON ?auto_646835 ?auto_646831 ) ( not ( = ?auto_646832 ?auto_646833 ) ) ( not ( = ?auto_646832 ?auto_646834 ) ) ( not ( = ?auto_646832 ?auto_646831 ) ) ( not ( = ?auto_646832 ?auto_646835 ) ) ( not ( = ?auto_646832 ?auto_646837 ) ) ( not ( = ?auto_646832 ?auto_646836 ) ) ( not ( = ?auto_646832 ?auto_646841 ) ) ( not ( = ?auto_646833 ?auto_646834 ) ) ( not ( = ?auto_646833 ?auto_646831 ) ) ( not ( = ?auto_646833 ?auto_646835 ) ) ( not ( = ?auto_646833 ?auto_646837 ) ) ( not ( = ?auto_646833 ?auto_646836 ) ) ( not ( = ?auto_646833 ?auto_646841 ) ) ( not ( = ?auto_646834 ?auto_646831 ) ) ( not ( = ?auto_646834 ?auto_646835 ) ) ( not ( = ?auto_646834 ?auto_646837 ) ) ( not ( = ?auto_646834 ?auto_646836 ) ) ( not ( = ?auto_646834 ?auto_646841 ) ) ( not ( = ?auto_646831 ?auto_646835 ) ) ( not ( = ?auto_646831 ?auto_646837 ) ) ( not ( = ?auto_646831 ?auto_646836 ) ) ( not ( = ?auto_646831 ?auto_646841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646835 ?auto_646837 ?auto_646836 )
      ( MAKE-6CRATE-VERIFY ?auto_646832 ?auto_646833 ?auto_646834 ?auto_646831 ?auto_646835 ?auto_646837 ?auto_646836 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648788 - SURFACE
      ?auto_648789 - SURFACE
      ?auto_648790 - SURFACE
      ?auto_648787 - SURFACE
      ?auto_648791 - SURFACE
      ?auto_648793 - SURFACE
      ?auto_648792 - SURFACE
      ?auto_648794 - SURFACE
    )
    :vars
    (
      ?auto_648796 - HOIST
      ?auto_648795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648796 ?auto_648795 ) ( SURFACE-AT ?auto_648792 ?auto_648795 ) ( CLEAR ?auto_648792 ) ( LIFTING ?auto_648796 ?auto_648794 ) ( IS-CRATE ?auto_648794 ) ( not ( = ?auto_648792 ?auto_648794 ) ) ( ON ?auto_648789 ?auto_648788 ) ( ON ?auto_648790 ?auto_648789 ) ( ON ?auto_648787 ?auto_648790 ) ( ON ?auto_648791 ?auto_648787 ) ( ON ?auto_648793 ?auto_648791 ) ( ON ?auto_648792 ?auto_648793 ) ( not ( = ?auto_648788 ?auto_648789 ) ) ( not ( = ?auto_648788 ?auto_648790 ) ) ( not ( = ?auto_648788 ?auto_648787 ) ) ( not ( = ?auto_648788 ?auto_648791 ) ) ( not ( = ?auto_648788 ?auto_648793 ) ) ( not ( = ?auto_648788 ?auto_648792 ) ) ( not ( = ?auto_648788 ?auto_648794 ) ) ( not ( = ?auto_648789 ?auto_648790 ) ) ( not ( = ?auto_648789 ?auto_648787 ) ) ( not ( = ?auto_648789 ?auto_648791 ) ) ( not ( = ?auto_648789 ?auto_648793 ) ) ( not ( = ?auto_648789 ?auto_648792 ) ) ( not ( = ?auto_648789 ?auto_648794 ) ) ( not ( = ?auto_648790 ?auto_648787 ) ) ( not ( = ?auto_648790 ?auto_648791 ) ) ( not ( = ?auto_648790 ?auto_648793 ) ) ( not ( = ?auto_648790 ?auto_648792 ) ) ( not ( = ?auto_648790 ?auto_648794 ) ) ( not ( = ?auto_648787 ?auto_648791 ) ) ( not ( = ?auto_648787 ?auto_648793 ) ) ( not ( = ?auto_648787 ?auto_648792 ) ) ( not ( = ?auto_648787 ?auto_648794 ) ) ( not ( = ?auto_648791 ?auto_648793 ) ) ( not ( = ?auto_648791 ?auto_648792 ) ) ( not ( = ?auto_648791 ?auto_648794 ) ) ( not ( = ?auto_648793 ?auto_648792 ) ) ( not ( = ?auto_648793 ?auto_648794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_648792 ?auto_648794 )
      ( MAKE-7CRATE-VERIFY ?auto_648788 ?auto_648789 ?auto_648790 ?auto_648787 ?auto_648791 ?auto_648793 ?auto_648792 ?auto_648794 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648843 - SURFACE
      ?auto_648844 - SURFACE
      ?auto_648845 - SURFACE
      ?auto_648842 - SURFACE
      ?auto_648846 - SURFACE
      ?auto_648848 - SURFACE
      ?auto_648847 - SURFACE
      ?auto_648849 - SURFACE
    )
    :vars
    (
      ?auto_648851 - HOIST
      ?auto_648852 - PLACE
      ?auto_648850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648851 ?auto_648852 ) ( SURFACE-AT ?auto_648847 ?auto_648852 ) ( CLEAR ?auto_648847 ) ( IS-CRATE ?auto_648849 ) ( not ( = ?auto_648847 ?auto_648849 ) ) ( TRUCK-AT ?auto_648850 ?auto_648852 ) ( AVAILABLE ?auto_648851 ) ( IN ?auto_648849 ?auto_648850 ) ( ON ?auto_648847 ?auto_648848 ) ( not ( = ?auto_648848 ?auto_648847 ) ) ( not ( = ?auto_648848 ?auto_648849 ) ) ( ON ?auto_648844 ?auto_648843 ) ( ON ?auto_648845 ?auto_648844 ) ( ON ?auto_648842 ?auto_648845 ) ( ON ?auto_648846 ?auto_648842 ) ( ON ?auto_648848 ?auto_648846 ) ( not ( = ?auto_648843 ?auto_648844 ) ) ( not ( = ?auto_648843 ?auto_648845 ) ) ( not ( = ?auto_648843 ?auto_648842 ) ) ( not ( = ?auto_648843 ?auto_648846 ) ) ( not ( = ?auto_648843 ?auto_648848 ) ) ( not ( = ?auto_648843 ?auto_648847 ) ) ( not ( = ?auto_648843 ?auto_648849 ) ) ( not ( = ?auto_648844 ?auto_648845 ) ) ( not ( = ?auto_648844 ?auto_648842 ) ) ( not ( = ?auto_648844 ?auto_648846 ) ) ( not ( = ?auto_648844 ?auto_648848 ) ) ( not ( = ?auto_648844 ?auto_648847 ) ) ( not ( = ?auto_648844 ?auto_648849 ) ) ( not ( = ?auto_648845 ?auto_648842 ) ) ( not ( = ?auto_648845 ?auto_648846 ) ) ( not ( = ?auto_648845 ?auto_648848 ) ) ( not ( = ?auto_648845 ?auto_648847 ) ) ( not ( = ?auto_648845 ?auto_648849 ) ) ( not ( = ?auto_648842 ?auto_648846 ) ) ( not ( = ?auto_648842 ?auto_648848 ) ) ( not ( = ?auto_648842 ?auto_648847 ) ) ( not ( = ?auto_648842 ?auto_648849 ) ) ( not ( = ?auto_648846 ?auto_648848 ) ) ( not ( = ?auto_648846 ?auto_648847 ) ) ( not ( = ?auto_648846 ?auto_648849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648848 ?auto_648847 ?auto_648849 )
      ( MAKE-7CRATE-VERIFY ?auto_648843 ?auto_648844 ?auto_648845 ?auto_648842 ?auto_648846 ?auto_648848 ?auto_648847 ?auto_648849 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648906 - SURFACE
      ?auto_648907 - SURFACE
      ?auto_648908 - SURFACE
      ?auto_648905 - SURFACE
      ?auto_648909 - SURFACE
      ?auto_648911 - SURFACE
      ?auto_648910 - SURFACE
      ?auto_648912 - SURFACE
    )
    :vars
    (
      ?auto_648916 - HOIST
      ?auto_648914 - PLACE
      ?auto_648915 - TRUCK
      ?auto_648913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648916 ?auto_648914 ) ( SURFACE-AT ?auto_648910 ?auto_648914 ) ( CLEAR ?auto_648910 ) ( IS-CRATE ?auto_648912 ) ( not ( = ?auto_648910 ?auto_648912 ) ) ( AVAILABLE ?auto_648916 ) ( IN ?auto_648912 ?auto_648915 ) ( ON ?auto_648910 ?auto_648911 ) ( not ( = ?auto_648911 ?auto_648910 ) ) ( not ( = ?auto_648911 ?auto_648912 ) ) ( TRUCK-AT ?auto_648915 ?auto_648913 ) ( not ( = ?auto_648913 ?auto_648914 ) ) ( ON ?auto_648907 ?auto_648906 ) ( ON ?auto_648908 ?auto_648907 ) ( ON ?auto_648905 ?auto_648908 ) ( ON ?auto_648909 ?auto_648905 ) ( ON ?auto_648911 ?auto_648909 ) ( not ( = ?auto_648906 ?auto_648907 ) ) ( not ( = ?auto_648906 ?auto_648908 ) ) ( not ( = ?auto_648906 ?auto_648905 ) ) ( not ( = ?auto_648906 ?auto_648909 ) ) ( not ( = ?auto_648906 ?auto_648911 ) ) ( not ( = ?auto_648906 ?auto_648910 ) ) ( not ( = ?auto_648906 ?auto_648912 ) ) ( not ( = ?auto_648907 ?auto_648908 ) ) ( not ( = ?auto_648907 ?auto_648905 ) ) ( not ( = ?auto_648907 ?auto_648909 ) ) ( not ( = ?auto_648907 ?auto_648911 ) ) ( not ( = ?auto_648907 ?auto_648910 ) ) ( not ( = ?auto_648907 ?auto_648912 ) ) ( not ( = ?auto_648908 ?auto_648905 ) ) ( not ( = ?auto_648908 ?auto_648909 ) ) ( not ( = ?auto_648908 ?auto_648911 ) ) ( not ( = ?auto_648908 ?auto_648910 ) ) ( not ( = ?auto_648908 ?auto_648912 ) ) ( not ( = ?auto_648905 ?auto_648909 ) ) ( not ( = ?auto_648905 ?auto_648911 ) ) ( not ( = ?auto_648905 ?auto_648910 ) ) ( not ( = ?auto_648905 ?auto_648912 ) ) ( not ( = ?auto_648909 ?auto_648911 ) ) ( not ( = ?auto_648909 ?auto_648910 ) ) ( not ( = ?auto_648909 ?auto_648912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648911 ?auto_648910 ?auto_648912 )
      ( MAKE-7CRATE-VERIFY ?auto_648906 ?auto_648907 ?auto_648908 ?auto_648905 ?auto_648909 ?auto_648911 ?auto_648910 ?auto_648912 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648976 - SURFACE
      ?auto_648977 - SURFACE
      ?auto_648978 - SURFACE
      ?auto_648975 - SURFACE
      ?auto_648979 - SURFACE
      ?auto_648981 - SURFACE
      ?auto_648980 - SURFACE
      ?auto_648982 - SURFACE
    )
    :vars
    (
      ?auto_648987 - HOIST
      ?auto_648986 - PLACE
      ?auto_648985 - TRUCK
      ?auto_648984 - PLACE
      ?auto_648983 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_648987 ?auto_648986 ) ( SURFACE-AT ?auto_648980 ?auto_648986 ) ( CLEAR ?auto_648980 ) ( IS-CRATE ?auto_648982 ) ( not ( = ?auto_648980 ?auto_648982 ) ) ( AVAILABLE ?auto_648987 ) ( ON ?auto_648980 ?auto_648981 ) ( not ( = ?auto_648981 ?auto_648980 ) ) ( not ( = ?auto_648981 ?auto_648982 ) ) ( TRUCK-AT ?auto_648985 ?auto_648984 ) ( not ( = ?auto_648984 ?auto_648986 ) ) ( HOIST-AT ?auto_648983 ?auto_648984 ) ( LIFTING ?auto_648983 ?auto_648982 ) ( not ( = ?auto_648987 ?auto_648983 ) ) ( ON ?auto_648977 ?auto_648976 ) ( ON ?auto_648978 ?auto_648977 ) ( ON ?auto_648975 ?auto_648978 ) ( ON ?auto_648979 ?auto_648975 ) ( ON ?auto_648981 ?auto_648979 ) ( not ( = ?auto_648976 ?auto_648977 ) ) ( not ( = ?auto_648976 ?auto_648978 ) ) ( not ( = ?auto_648976 ?auto_648975 ) ) ( not ( = ?auto_648976 ?auto_648979 ) ) ( not ( = ?auto_648976 ?auto_648981 ) ) ( not ( = ?auto_648976 ?auto_648980 ) ) ( not ( = ?auto_648976 ?auto_648982 ) ) ( not ( = ?auto_648977 ?auto_648978 ) ) ( not ( = ?auto_648977 ?auto_648975 ) ) ( not ( = ?auto_648977 ?auto_648979 ) ) ( not ( = ?auto_648977 ?auto_648981 ) ) ( not ( = ?auto_648977 ?auto_648980 ) ) ( not ( = ?auto_648977 ?auto_648982 ) ) ( not ( = ?auto_648978 ?auto_648975 ) ) ( not ( = ?auto_648978 ?auto_648979 ) ) ( not ( = ?auto_648978 ?auto_648981 ) ) ( not ( = ?auto_648978 ?auto_648980 ) ) ( not ( = ?auto_648978 ?auto_648982 ) ) ( not ( = ?auto_648975 ?auto_648979 ) ) ( not ( = ?auto_648975 ?auto_648981 ) ) ( not ( = ?auto_648975 ?auto_648980 ) ) ( not ( = ?auto_648975 ?auto_648982 ) ) ( not ( = ?auto_648979 ?auto_648981 ) ) ( not ( = ?auto_648979 ?auto_648980 ) ) ( not ( = ?auto_648979 ?auto_648982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648981 ?auto_648980 ?auto_648982 )
      ( MAKE-7CRATE-VERIFY ?auto_648976 ?auto_648977 ?auto_648978 ?auto_648975 ?auto_648979 ?auto_648981 ?auto_648980 ?auto_648982 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649053 - SURFACE
      ?auto_649054 - SURFACE
      ?auto_649055 - SURFACE
      ?auto_649052 - SURFACE
      ?auto_649056 - SURFACE
      ?auto_649058 - SURFACE
      ?auto_649057 - SURFACE
      ?auto_649059 - SURFACE
    )
    :vars
    (
      ?auto_649064 - HOIST
      ?auto_649065 - PLACE
      ?auto_649063 - TRUCK
      ?auto_649060 - PLACE
      ?auto_649061 - HOIST
      ?auto_649062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_649064 ?auto_649065 ) ( SURFACE-AT ?auto_649057 ?auto_649065 ) ( CLEAR ?auto_649057 ) ( IS-CRATE ?auto_649059 ) ( not ( = ?auto_649057 ?auto_649059 ) ) ( AVAILABLE ?auto_649064 ) ( ON ?auto_649057 ?auto_649058 ) ( not ( = ?auto_649058 ?auto_649057 ) ) ( not ( = ?auto_649058 ?auto_649059 ) ) ( TRUCK-AT ?auto_649063 ?auto_649060 ) ( not ( = ?auto_649060 ?auto_649065 ) ) ( HOIST-AT ?auto_649061 ?auto_649060 ) ( not ( = ?auto_649064 ?auto_649061 ) ) ( AVAILABLE ?auto_649061 ) ( SURFACE-AT ?auto_649059 ?auto_649060 ) ( ON ?auto_649059 ?auto_649062 ) ( CLEAR ?auto_649059 ) ( not ( = ?auto_649057 ?auto_649062 ) ) ( not ( = ?auto_649059 ?auto_649062 ) ) ( not ( = ?auto_649058 ?auto_649062 ) ) ( ON ?auto_649054 ?auto_649053 ) ( ON ?auto_649055 ?auto_649054 ) ( ON ?auto_649052 ?auto_649055 ) ( ON ?auto_649056 ?auto_649052 ) ( ON ?auto_649058 ?auto_649056 ) ( not ( = ?auto_649053 ?auto_649054 ) ) ( not ( = ?auto_649053 ?auto_649055 ) ) ( not ( = ?auto_649053 ?auto_649052 ) ) ( not ( = ?auto_649053 ?auto_649056 ) ) ( not ( = ?auto_649053 ?auto_649058 ) ) ( not ( = ?auto_649053 ?auto_649057 ) ) ( not ( = ?auto_649053 ?auto_649059 ) ) ( not ( = ?auto_649053 ?auto_649062 ) ) ( not ( = ?auto_649054 ?auto_649055 ) ) ( not ( = ?auto_649054 ?auto_649052 ) ) ( not ( = ?auto_649054 ?auto_649056 ) ) ( not ( = ?auto_649054 ?auto_649058 ) ) ( not ( = ?auto_649054 ?auto_649057 ) ) ( not ( = ?auto_649054 ?auto_649059 ) ) ( not ( = ?auto_649054 ?auto_649062 ) ) ( not ( = ?auto_649055 ?auto_649052 ) ) ( not ( = ?auto_649055 ?auto_649056 ) ) ( not ( = ?auto_649055 ?auto_649058 ) ) ( not ( = ?auto_649055 ?auto_649057 ) ) ( not ( = ?auto_649055 ?auto_649059 ) ) ( not ( = ?auto_649055 ?auto_649062 ) ) ( not ( = ?auto_649052 ?auto_649056 ) ) ( not ( = ?auto_649052 ?auto_649058 ) ) ( not ( = ?auto_649052 ?auto_649057 ) ) ( not ( = ?auto_649052 ?auto_649059 ) ) ( not ( = ?auto_649052 ?auto_649062 ) ) ( not ( = ?auto_649056 ?auto_649058 ) ) ( not ( = ?auto_649056 ?auto_649057 ) ) ( not ( = ?auto_649056 ?auto_649059 ) ) ( not ( = ?auto_649056 ?auto_649062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649058 ?auto_649057 ?auto_649059 )
      ( MAKE-7CRATE-VERIFY ?auto_649053 ?auto_649054 ?auto_649055 ?auto_649052 ?auto_649056 ?auto_649058 ?auto_649057 ?auto_649059 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649131 - SURFACE
      ?auto_649132 - SURFACE
      ?auto_649133 - SURFACE
      ?auto_649130 - SURFACE
      ?auto_649134 - SURFACE
      ?auto_649136 - SURFACE
      ?auto_649135 - SURFACE
      ?auto_649137 - SURFACE
    )
    :vars
    (
      ?auto_649139 - HOIST
      ?auto_649141 - PLACE
      ?auto_649138 - PLACE
      ?auto_649140 - HOIST
      ?auto_649143 - SURFACE
      ?auto_649142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649139 ?auto_649141 ) ( SURFACE-AT ?auto_649135 ?auto_649141 ) ( CLEAR ?auto_649135 ) ( IS-CRATE ?auto_649137 ) ( not ( = ?auto_649135 ?auto_649137 ) ) ( AVAILABLE ?auto_649139 ) ( ON ?auto_649135 ?auto_649136 ) ( not ( = ?auto_649136 ?auto_649135 ) ) ( not ( = ?auto_649136 ?auto_649137 ) ) ( not ( = ?auto_649138 ?auto_649141 ) ) ( HOIST-AT ?auto_649140 ?auto_649138 ) ( not ( = ?auto_649139 ?auto_649140 ) ) ( AVAILABLE ?auto_649140 ) ( SURFACE-AT ?auto_649137 ?auto_649138 ) ( ON ?auto_649137 ?auto_649143 ) ( CLEAR ?auto_649137 ) ( not ( = ?auto_649135 ?auto_649143 ) ) ( not ( = ?auto_649137 ?auto_649143 ) ) ( not ( = ?auto_649136 ?auto_649143 ) ) ( TRUCK-AT ?auto_649142 ?auto_649141 ) ( ON ?auto_649132 ?auto_649131 ) ( ON ?auto_649133 ?auto_649132 ) ( ON ?auto_649130 ?auto_649133 ) ( ON ?auto_649134 ?auto_649130 ) ( ON ?auto_649136 ?auto_649134 ) ( not ( = ?auto_649131 ?auto_649132 ) ) ( not ( = ?auto_649131 ?auto_649133 ) ) ( not ( = ?auto_649131 ?auto_649130 ) ) ( not ( = ?auto_649131 ?auto_649134 ) ) ( not ( = ?auto_649131 ?auto_649136 ) ) ( not ( = ?auto_649131 ?auto_649135 ) ) ( not ( = ?auto_649131 ?auto_649137 ) ) ( not ( = ?auto_649131 ?auto_649143 ) ) ( not ( = ?auto_649132 ?auto_649133 ) ) ( not ( = ?auto_649132 ?auto_649130 ) ) ( not ( = ?auto_649132 ?auto_649134 ) ) ( not ( = ?auto_649132 ?auto_649136 ) ) ( not ( = ?auto_649132 ?auto_649135 ) ) ( not ( = ?auto_649132 ?auto_649137 ) ) ( not ( = ?auto_649132 ?auto_649143 ) ) ( not ( = ?auto_649133 ?auto_649130 ) ) ( not ( = ?auto_649133 ?auto_649134 ) ) ( not ( = ?auto_649133 ?auto_649136 ) ) ( not ( = ?auto_649133 ?auto_649135 ) ) ( not ( = ?auto_649133 ?auto_649137 ) ) ( not ( = ?auto_649133 ?auto_649143 ) ) ( not ( = ?auto_649130 ?auto_649134 ) ) ( not ( = ?auto_649130 ?auto_649136 ) ) ( not ( = ?auto_649130 ?auto_649135 ) ) ( not ( = ?auto_649130 ?auto_649137 ) ) ( not ( = ?auto_649130 ?auto_649143 ) ) ( not ( = ?auto_649134 ?auto_649136 ) ) ( not ( = ?auto_649134 ?auto_649135 ) ) ( not ( = ?auto_649134 ?auto_649137 ) ) ( not ( = ?auto_649134 ?auto_649143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649136 ?auto_649135 ?auto_649137 )
      ( MAKE-7CRATE-VERIFY ?auto_649131 ?auto_649132 ?auto_649133 ?auto_649130 ?auto_649134 ?auto_649136 ?auto_649135 ?auto_649137 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649209 - SURFACE
      ?auto_649210 - SURFACE
      ?auto_649211 - SURFACE
      ?auto_649208 - SURFACE
      ?auto_649212 - SURFACE
      ?auto_649214 - SURFACE
      ?auto_649213 - SURFACE
      ?auto_649215 - SURFACE
    )
    :vars
    (
      ?auto_649218 - HOIST
      ?auto_649216 - PLACE
      ?auto_649217 - PLACE
      ?auto_649221 - HOIST
      ?auto_649220 - SURFACE
      ?auto_649219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649218 ?auto_649216 ) ( IS-CRATE ?auto_649215 ) ( not ( = ?auto_649213 ?auto_649215 ) ) ( not ( = ?auto_649214 ?auto_649213 ) ) ( not ( = ?auto_649214 ?auto_649215 ) ) ( not ( = ?auto_649217 ?auto_649216 ) ) ( HOIST-AT ?auto_649221 ?auto_649217 ) ( not ( = ?auto_649218 ?auto_649221 ) ) ( AVAILABLE ?auto_649221 ) ( SURFACE-AT ?auto_649215 ?auto_649217 ) ( ON ?auto_649215 ?auto_649220 ) ( CLEAR ?auto_649215 ) ( not ( = ?auto_649213 ?auto_649220 ) ) ( not ( = ?auto_649215 ?auto_649220 ) ) ( not ( = ?auto_649214 ?auto_649220 ) ) ( TRUCK-AT ?auto_649219 ?auto_649216 ) ( SURFACE-AT ?auto_649214 ?auto_649216 ) ( CLEAR ?auto_649214 ) ( LIFTING ?auto_649218 ?auto_649213 ) ( IS-CRATE ?auto_649213 ) ( ON ?auto_649210 ?auto_649209 ) ( ON ?auto_649211 ?auto_649210 ) ( ON ?auto_649208 ?auto_649211 ) ( ON ?auto_649212 ?auto_649208 ) ( ON ?auto_649214 ?auto_649212 ) ( not ( = ?auto_649209 ?auto_649210 ) ) ( not ( = ?auto_649209 ?auto_649211 ) ) ( not ( = ?auto_649209 ?auto_649208 ) ) ( not ( = ?auto_649209 ?auto_649212 ) ) ( not ( = ?auto_649209 ?auto_649214 ) ) ( not ( = ?auto_649209 ?auto_649213 ) ) ( not ( = ?auto_649209 ?auto_649215 ) ) ( not ( = ?auto_649209 ?auto_649220 ) ) ( not ( = ?auto_649210 ?auto_649211 ) ) ( not ( = ?auto_649210 ?auto_649208 ) ) ( not ( = ?auto_649210 ?auto_649212 ) ) ( not ( = ?auto_649210 ?auto_649214 ) ) ( not ( = ?auto_649210 ?auto_649213 ) ) ( not ( = ?auto_649210 ?auto_649215 ) ) ( not ( = ?auto_649210 ?auto_649220 ) ) ( not ( = ?auto_649211 ?auto_649208 ) ) ( not ( = ?auto_649211 ?auto_649212 ) ) ( not ( = ?auto_649211 ?auto_649214 ) ) ( not ( = ?auto_649211 ?auto_649213 ) ) ( not ( = ?auto_649211 ?auto_649215 ) ) ( not ( = ?auto_649211 ?auto_649220 ) ) ( not ( = ?auto_649208 ?auto_649212 ) ) ( not ( = ?auto_649208 ?auto_649214 ) ) ( not ( = ?auto_649208 ?auto_649213 ) ) ( not ( = ?auto_649208 ?auto_649215 ) ) ( not ( = ?auto_649208 ?auto_649220 ) ) ( not ( = ?auto_649212 ?auto_649214 ) ) ( not ( = ?auto_649212 ?auto_649213 ) ) ( not ( = ?auto_649212 ?auto_649215 ) ) ( not ( = ?auto_649212 ?auto_649220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649214 ?auto_649213 ?auto_649215 )
      ( MAKE-7CRATE-VERIFY ?auto_649209 ?auto_649210 ?auto_649211 ?auto_649208 ?auto_649212 ?auto_649214 ?auto_649213 ?auto_649215 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649287 - SURFACE
      ?auto_649288 - SURFACE
      ?auto_649289 - SURFACE
      ?auto_649286 - SURFACE
      ?auto_649290 - SURFACE
      ?auto_649292 - SURFACE
      ?auto_649291 - SURFACE
      ?auto_649293 - SURFACE
    )
    :vars
    (
      ?auto_649299 - HOIST
      ?auto_649297 - PLACE
      ?auto_649294 - PLACE
      ?auto_649296 - HOIST
      ?auto_649298 - SURFACE
      ?auto_649295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649299 ?auto_649297 ) ( IS-CRATE ?auto_649293 ) ( not ( = ?auto_649291 ?auto_649293 ) ) ( not ( = ?auto_649292 ?auto_649291 ) ) ( not ( = ?auto_649292 ?auto_649293 ) ) ( not ( = ?auto_649294 ?auto_649297 ) ) ( HOIST-AT ?auto_649296 ?auto_649294 ) ( not ( = ?auto_649299 ?auto_649296 ) ) ( AVAILABLE ?auto_649296 ) ( SURFACE-AT ?auto_649293 ?auto_649294 ) ( ON ?auto_649293 ?auto_649298 ) ( CLEAR ?auto_649293 ) ( not ( = ?auto_649291 ?auto_649298 ) ) ( not ( = ?auto_649293 ?auto_649298 ) ) ( not ( = ?auto_649292 ?auto_649298 ) ) ( TRUCK-AT ?auto_649295 ?auto_649297 ) ( SURFACE-AT ?auto_649292 ?auto_649297 ) ( CLEAR ?auto_649292 ) ( IS-CRATE ?auto_649291 ) ( AVAILABLE ?auto_649299 ) ( IN ?auto_649291 ?auto_649295 ) ( ON ?auto_649288 ?auto_649287 ) ( ON ?auto_649289 ?auto_649288 ) ( ON ?auto_649286 ?auto_649289 ) ( ON ?auto_649290 ?auto_649286 ) ( ON ?auto_649292 ?auto_649290 ) ( not ( = ?auto_649287 ?auto_649288 ) ) ( not ( = ?auto_649287 ?auto_649289 ) ) ( not ( = ?auto_649287 ?auto_649286 ) ) ( not ( = ?auto_649287 ?auto_649290 ) ) ( not ( = ?auto_649287 ?auto_649292 ) ) ( not ( = ?auto_649287 ?auto_649291 ) ) ( not ( = ?auto_649287 ?auto_649293 ) ) ( not ( = ?auto_649287 ?auto_649298 ) ) ( not ( = ?auto_649288 ?auto_649289 ) ) ( not ( = ?auto_649288 ?auto_649286 ) ) ( not ( = ?auto_649288 ?auto_649290 ) ) ( not ( = ?auto_649288 ?auto_649292 ) ) ( not ( = ?auto_649288 ?auto_649291 ) ) ( not ( = ?auto_649288 ?auto_649293 ) ) ( not ( = ?auto_649288 ?auto_649298 ) ) ( not ( = ?auto_649289 ?auto_649286 ) ) ( not ( = ?auto_649289 ?auto_649290 ) ) ( not ( = ?auto_649289 ?auto_649292 ) ) ( not ( = ?auto_649289 ?auto_649291 ) ) ( not ( = ?auto_649289 ?auto_649293 ) ) ( not ( = ?auto_649289 ?auto_649298 ) ) ( not ( = ?auto_649286 ?auto_649290 ) ) ( not ( = ?auto_649286 ?auto_649292 ) ) ( not ( = ?auto_649286 ?auto_649291 ) ) ( not ( = ?auto_649286 ?auto_649293 ) ) ( not ( = ?auto_649286 ?auto_649298 ) ) ( not ( = ?auto_649290 ?auto_649292 ) ) ( not ( = ?auto_649290 ?auto_649291 ) ) ( not ( = ?auto_649290 ?auto_649293 ) ) ( not ( = ?auto_649290 ?auto_649298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649292 ?auto_649291 ?auto_649293 )
      ( MAKE-7CRATE-VERIFY ?auto_649287 ?auto_649288 ?auto_649289 ?auto_649286 ?auto_649290 ?auto_649292 ?auto_649291 ?auto_649293 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652206 - SURFACE
      ?auto_652207 - SURFACE
      ?auto_652208 - SURFACE
      ?auto_652205 - SURFACE
      ?auto_652209 - SURFACE
      ?auto_652211 - SURFACE
      ?auto_652210 - SURFACE
      ?auto_652212 - SURFACE
      ?auto_652213 - SURFACE
    )
    :vars
    (
      ?auto_652215 - HOIST
      ?auto_652214 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652215 ?auto_652214 ) ( SURFACE-AT ?auto_652212 ?auto_652214 ) ( CLEAR ?auto_652212 ) ( LIFTING ?auto_652215 ?auto_652213 ) ( IS-CRATE ?auto_652213 ) ( not ( = ?auto_652212 ?auto_652213 ) ) ( ON ?auto_652207 ?auto_652206 ) ( ON ?auto_652208 ?auto_652207 ) ( ON ?auto_652205 ?auto_652208 ) ( ON ?auto_652209 ?auto_652205 ) ( ON ?auto_652211 ?auto_652209 ) ( ON ?auto_652210 ?auto_652211 ) ( ON ?auto_652212 ?auto_652210 ) ( not ( = ?auto_652206 ?auto_652207 ) ) ( not ( = ?auto_652206 ?auto_652208 ) ) ( not ( = ?auto_652206 ?auto_652205 ) ) ( not ( = ?auto_652206 ?auto_652209 ) ) ( not ( = ?auto_652206 ?auto_652211 ) ) ( not ( = ?auto_652206 ?auto_652210 ) ) ( not ( = ?auto_652206 ?auto_652212 ) ) ( not ( = ?auto_652206 ?auto_652213 ) ) ( not ( = ?auto_652207 ?auto_652208 ) ) ( not ( = ?auto_652207 ?auto_652205 ) ) ( not ( = ?auto_652207 ?auto_652209 ) ) ( not ( = ?auto_652207 ?auto_652211 ) ) ( not ( = ?auto_652207 ?auto_652210 ) ) ( not ( = ?auto_652207 ?auto_652212 ) ) ( not ( = ?auto_652207 ?auto_652213 ) ) ( not ( = ?auto_652208 ?auto_652205 ) ) ( not ( = ?auto_652208 ?auto_652209 ) ) ( not ( = ?auto_652208 ?auto_652211 ) ) ( not ( = ?auto_652208 ?auto_652210 ) ) ( not ( = ?auto_652208 ?auto_652212 ) ) ( not ( = ?auto_652208 ?auto_652213 ) ) ( not ( = ?auto_652205 ?auto_652209 ) ) ( not ( = ?auto_652205 ?auto_652211 ) ) ( not ( = ?auto_652205 ?auto_652210 ) ) ( not ( = ?auto_652205 ?auto_652212 ) ) ( not ( = ?auto_652205 ?auto_652213 ) ) ( not ( = ?auto_652209 ?auto_652211 ) ) ( not ( = ?auto_652209 ?auto_652210 ) ) ( not ( = ?auto_652209 ?auto_652212 ) ) ( not ( = ?auto_652209 ?auto_652213 ) ) ( not ( = ?auto_652211 ?auto_652210 ) ) ( not ( = ?auto_652211 ?auto_652212 ) ) ( not ( = ?auto_652211 ?auto_652213 ) ) ( not ( = ?auto_652210 ?auto_652212 ) ) ( not ( = ?auto_652210 ?auto_652213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_652212 ?auto_652213 )
      ( MAKE-8CRATE-VERIFY ?auto_652206 ?auto_652207 ?auto_652208 ?auto_652205 ?auto_652209 ?auto_652211 ?auto_652210 ?auto_652212 ?auto_652213 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652273 - SURFACE
      ?auto_652274 - SURFACE
      ?auto_652275 - SURFACE
      ?auto_652272 - SURFACE
      ?auto_652276 - SURFACE
      ?auto_652278 - SURFACE
      ?auto_652277 - SURFACE
      ?auto_652279 - SURFACE
      ?auto_652280 - SURFACE
    )
    :vars
    (
      ?auto_652281 - HOIST
      ?auto_652282 - PLACE
      ?auto_652283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652281 ?auto_652282 ) ( SURFACE-AT ?auto_652279 ?auto_652282 ) ( CLEAR ?auto_652279 ) ( IS-CRATE ?auto_652280 ) ( not ( = ?auto_652279 ?auto_652280 ) ) ( TRUCK-AT ?auto_652283 ?auto_652282 ) ( AVAILABLE ?auto_652281 ) ( IN ?auto_652280 ?auto_652283 ) ( ON ?auto_652279 ?auto_652277 ) ( not ( = ?auto_652277 ?auto_652279 ) ) ( not ( = ?auto_652277 ?auto_652280 ) ) ( ON ?auto_652274 ?auto_652273 ) ( ON ?auto_652275 ?auto_652274 ) ( ON ?auto_652272 ?auto_652275 ) ( ON ?auto_652276 ?auto_652272 ) ( ON ?auto_652278 ?auto_652276 ) ( ON ?auto_652277 ?auto_652278 ) ( not ( = ?auto_652273 ?auto_652274 ) ) ( not ( = ?auto_652273 ?auto_652275 ) ) ( not ( = ?auto_652273 ?auto_652272 ) ) ( not ( = ?auto_652273 ?auto_652276 ) ) ( not ( = ?auto_652273 ?auto_652278 ) ) ( not ( = ?auto_652273 ?auto_652277 ) ) ( not ( = ?auto_652273 ?auto_652279 ) ) ( not ( = ?auto_652273 ?auto_652280 ) ) ( not ( = ?auto_652274 ?auto_652275 ) ) ( not ( = ?auto_652274 ?auto_652272 ) ) ( not ( = ?auto_652274 ?auto_652276 ) ) ( not ( = ?auto_652274 ?auto_652278 ) ) ( not ( = ?auto_652274 ?auto_652277 ) ) ( not ( = ?auto_652274 ?auto_652279 ) ) ( not ( = ?auto_652274 ?auto_652280 ) ) ( not ( = ?auto_652275 ?auto_652272 ) ) ( not ( = ?auto_652275 ?auto_652276 ) ) ( not ( = ?auto_652275 ?auto_652278 ) ) ( not ( = ?auto_652275 ?auto_652277 ) ) ( not ( = ?auto_652275 ?auto_652279 ) ) ( not ( = ?auto_652275 ?auto_652280 ) ) ( not ( = ?auto_652272 ?auto_652276 ) ) ( not ( = ?auto_652272 ?auto_652278 ) ) ( not ( = ?auto_652272 ?auto_652277 ) ) ( not ( = ?auto_652272 ?auto_652279 ) ) ( not ( = ?auto_652272 ?auto_652280 ) ) ( not ( = ?auto_652276 ?auto_652278 ) ) ( not ( = ?auto_652276 ?auto_652277 ) ) ( not ( = ?auto_652276 ?auto_652279 ) ) ( not ( = ?auto_652276 ?auto_652280 ) ) ( not ( = ?auto_652278 ?auto_652277 ) ) ( not ( = ?auto_652278 ?auto_652279 ) ) ( not ( = ?auto_652278 ?auto_652280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652277 ?auto_652279 ?auto_652280 )
      ( MAKE-8CRATE-VERIFY ?auto_652273 ?auto_652274 ?auto_652275 ?auto_652272 ?auto_652276 ?auto_652278 ?auto_652277 ?auto_652279 ?auto_652280 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652349 - SURFACE
      ?auto_652350 - SURFACE
      ?auto_652351 - SURFACE
      ?auto_652348 - SURFACE
      ?auto_652352 - SURFACE
      ?auto_652354 - SURFACE
      ?auto_652353 - SURFACE
      ?auto_652355 - SURFACE
      ?auto_652356 - SURFACE
    )
    :vars
    (
      ?auto_652359 - HOIST
      ?auto_652360 - PLACE
      ?auto_652357 - TRUCK
      ?auto_652358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652359 ?auto_652360 ) ( SURFACE-AT ?auto_652355 ?auto_652360 ) ( CLEAR ?auto_652355 ) ( IS-CRATE ?auto_652356 ) ( not ( = ?auto_652355 ?auto_652356 ) ) ( AVAILABLE ?auto_652359 ) ( IN ?auto_652356 ?auto_652357 ) ( ON ?auto_652355 ?auto_652353 ) ( not ( = ?auto_652353 ?auto_652355 ) ) ( not ( = ?auto_652353 ?auto_652356 ) ) ( TRUCK-AT ?auto_652357 ?auto_652358 ) ( not ( = ?auto_652358 ?auto_652360 ) ) ( ON ?auto_652350 ?auto_652349 ) ( ON ?auto_652351 ?auto_652350 ) ( ON ?auto_652348 ?auto_652351 ) ( ON ?auto_652352 ?auto_652348 ) ( ON ?auto_652354 ?auto_652352 ) ( ON ?auto_652353 ?auto_652354 ) ( not ( = ?auto_652349 ?auto_652350 ) ) ( not ( = ?auto_652349 ?auto_652351 ) ) ( not ( = ?auto_652349 ?auto_652348 ) ) ( not ( = ?auto_652349 ?auto_652352 ) ) ( not ( = ?auto_652349 ?auto_652354 ) ) ( not ( = ?auto_652349 ?auto_652353 ) ) ( not ( = ?auto_652349 ?auto_652355 ) ) ( not ( = ?auto_652349 ?auto_652356 ) ) ( not ( = ?auto_652350 ?auto_652351 ) ) ( not ( = ?auto_652350 ?auto_652348 ) ) ( not ( = ?auto_652350 ?auto_652352 ) ) ( not ( = ?auto_652350 ?auto_652354 ) ) ( not ( = ?auto_652350 ?auto_652353 ) ) ( not ( = ?auto_652350 ?auto_652355 ) ) ( not ( = ?auto_652350 ?auto_652356 ) ) ( not ( = ?auto_652351 ?auto_652348 ) ) ( not ( = ?auto_652351 ?auto_652352 ) ) ( not ( = ?auto_652351 ?auto_652354 ) ) ( not ( = ?auto_652351 ?auto_652353 ) ) ( not ( = ?auto_652351 ?auto_652355 ) ) ( not ( = ?auto_652351 ?auto_652356 ) ) ( not ( = ?auto_652348 ?auto_652352 ) ) ( not ( = ?auto_652348 ?auto_652354 ) ) ( not ( = ?auto_652348 ?auto_652353 ) ) ( not ( = ?auto_652348 ?auto_652355 ) ) ( not ( = ?auto_652348 ?auto_652356 ) ) ( not ( = ?auto_652352 ?auto_652354 ) ) ( not ( = ?auto_652352 ?auto_652353 ) ) ( not ( = ?auto_652352 ?auto_652355 ) ) ( not ( = ?auto_652352 ?auto_652356 ) ) ( not ( = ?auto_652354 ?auto_652353 ) ) ( not ( = ?auto_652354 ?auto_652355 ) ) ( not ( = ?auto_652354 ?auto_652356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652353 ?auto_652355 ?auto_652356 )
      ( MAKE-8CRATE-VERIFY ?auto_652349 ?auto_652350 ?auto_652351 ?auto_652348 ?auto_652352 ?auto_652354 ?auto_652353 ?auto_652355 ?auto_652356 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652433 - SURFACE
      ?auto_652434 - SURFACE
      ?auto_652435 - SURFACE
      ?auto_652432 - SURFACE
      ?auto_652436 - SURFACE
      ?auto_652438 - SURFACE
      ?auto_652437 - SURFACE
      ?auto_652439 - SURFACE
      ?auto_652440 - SURFACE
    )
    :vars
    (
      ?auto_652442 - HOIST
      ?auto_652443 - PLACE
      ?auto_652441 - TRUCK
      ?auto_652444 - PLACE
      ?auto_652445 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_652442 ?auto_652443 ) ( SURFACE-AT ?auto_652439 ?auto_652443 ) ( CLEAR ?auto_652439 ) ( IS-CRATE ?auto_652440 ) ( not ( = ?auto_652439 ?auto_652440 ) ) ( AVAILABLE ?auto_652442 ) ( ON ?auto_652439 ?auto_652437 ) ( not ( = ?auto_652437 ?auto_652439 ) ) ( not ( = ?auto_652437 ?auto_652440 ) ) ( TRUCK-AT ?auto_652441 ?auto_652444 ) ( not ( = ?auto_652444 ?auto_652443 ) ) ( HOIST-AT ?auto_652445 ?auto_652444 ) ( LIFTING ?auto_652445 ?auto_652440 ) ( not ( = ?auto_652442 ?auto_652445 ) ) ( ON ?auto_652434 ?auto_652433 ) ( ON ?auto_652435 ?auto_652434 ) ( ON ?auto_652432 ?auto_652435 ) ( ON ?auto_652436 ?auto_652432 ) ( ON ?auto_652438 ?auto_652436 ) ( ON ?auto_652437 ?auto_652438 ) ( not ( = ?auto_652433 ?auto_652434 ) ) ( not ( = ?auto_652433 ?auto_652435 ) ) ( not ( = ?auto_652433 ?auto_652432 ) ) ( not ( = ?auto_652433 ?auto_652436 ) ) ( not ( = ?auto_652433 ?auto_652438 ) ) ( not ( = ?auto_652433 ?auto_652437 ) ) ( not ( = ?auto_652433 ?auto_652439 ) ) ( not ( = ?auto_652433 ?auto_652440 ) ) ( not ( = ?auto_652434 ?auto_652435 ) ) ( not ( = ?auto_652434 ?auto_652432 ) ) ( not ( = ?auto_652434 ?auto_652436 ) ) ( not ( = ?auto_652434 ?auto_652438 ) ) ( not ( = ?auto_652434 ?auto_652437 ) ) ( not ( = ?auto_652434 ?auto_652439 ) ) ( not ( = ?auto_652434 ?auto_652440 ) ) ( not ( = ?auto_652435 ?auto_652432 ) ) ( not ( = ?auto_652435 ?auto_652436 ) ) ( not ( = ?auto_652435 ?auto_652438 ) ) ( not ( = ?auto_652435 ?auto_652437 ) ) ( not ( = ?auto_652435 ?auto_652439 ) ) ( not ( = ?auto_652435 ?auto_652440 ) ) ( not ( = ?auto_652432 ?auto_652436 ) ) ( not ( = ?auto_652432 ?auto_652438 ) ) ( not ( = ?auto_652432 ?auto_652437 ) ) ( not ( = ?auto_652432 ?auto_652439 ) ) ( not ( = ?auto_652432 ?auto_652440 ) ) ( not ( = ?auto_652436 ?auto_652438 ) ) ( not ( = ?auto_652436 ?auto_652437 ) ) ( not ( = ?auto_652436 ?auto_652439 ) ) ( not ( = ?auto_652436 ?auto_652440 ) ) ( not ( = ?auto_652438 ?auto_652437 ) ) ( not ( = ?auto_652438 ?auto_652439 ) ) ( not ( = ?auto_652438 ?auto_652440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652437 ?auto_652439 ?auto_652440 )
      ( MAKE-8CRATE-VERIFY ?auto_652433 ?auto_652434 ?auto_652435 ?auto_652432 ?auto_652436 ?auto_652438 ?auto_652437 ?auto_652439 ?auto_652440 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652525 - SURFACE
      ?auto_652526 - SURFACE
      ?auto_652527 - SURFACE
      ?auto_652524 - SURFACE
      ?auto_652528 - SURFACE
      ?auto_652530 - SURFACE
      ?auto_652529 - SURFACE
      ?auto_652531 - SURFACE
      ?auto_652532 - SURFACE
    )
    :vars
    (
      ?auto_652538 - HOIST
      ?auto_652536 - PLACE
      ?auto_652535 - TRUCK
      ?auto_652534 - PLACE
      ?auto_652537 - HOIST
      ?auto_652533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652538 ?auto_652536 ) ( SURFACE-AT ?auto_652531 ?auto_652536 ) ( CLEAR ?auto_652531 ) ( IS-CRATE ?auto_652532 ) ( not ( = ?auto_652531 ?auto_652532 ) ) ( AVAILABLE ?auto_652538 ) ( ON ?auto_652531 ?auto_652529 ) ( not ( = ?auto_652529 ?auto_652531 ) ) ( not ( = ?auto_652529 ?auto_652532 ) ) ( TRUCK-AT ?auto_652535 ?auto_652534 ) ( not ( = ?auto_652534 ?auto_652536 ) ) ( HOIST-AT ?auto_652537 ?auto_652534 ) ( not ( = ?auto_652538 ?auto_652537 ) ) ( AVAILABLE ?auto_652537 ) ( SURFACE-AT ?auto_652532 ?auto_652534 ) ( ON ?auto_652532 ?auto_652533 ) ( CLEAR ?auto_652532 ) ( not ( = ?auto_652531 ?auto_652533 ) ) ( not ( = ?auto_652532 ?auto_652533 ) ) ( not ( = ?auto_652529 ?auto_652533 ) ) ( ON ?auto_652526 ?auto_652525 ) ( ON ?auto_652527 ?auto_652526 ) ( ON ?auto_652524 ?auto_652527 ) ( ON ?auto_652528 ?auto_652524 ) ( ON ?auto_652530 ?auto_652528 ) ( ON ?auto_652529 ?auto_652530 ) ( not ( = ?auto_652525 ?auto_652526 ) ) ( not ( = ?auto_652525 ?auto_652527 ) ) ( not ( = ?auto_652525 ?auto_652524 ) ) ( not ( = ?auto_652525 ?auto_652528 ) ) ( not ( = ?auto_652525 ?auto_652530 ) ) ( not ( = ?auto_652525 ?auto_652529 ) ) ( not ( = ?auto_652525 ?auto_652531 ) ) ( not ( = ?auto_652525 ?auto_652532 ) ) ( not ( = ?auto_652525 ?auto_652533 ) ) ( not ( = ?auto_652526 ?auto_652527 ) ) ( not ( = ?auto_652526 ?auto_652524 ) ) ( not ( = ?auto_652526 ?auto_652528 ) ) ( not ( = ?auto_652526 ?auto_652530 ) ) ( not ( = ?auto_652526 ?auto_652529 ) ) ( not ( = ?auto_652526 ?auto_652531 ) ) ( not ( = ?auto_652526 ?auto_652532 ) ) ( not ( = ?auto_652526 ?auto_652533 ) ) ( not ( = ?auto_652527 ?auto_652524 ) ) ( not ( = ?auto_652527 ?auto_652528 ) ) ( not ( = ?auto_652527 ?auto_652530 ) ) ( not ( = ?auto_652527 ?auto_652529 ) ) ( not ( = ?auto_652527 ?auto_652531 ) ) ( not ( = ?auto_652527 ?auto_652532 ) ) ( not ( = ?auto_652527 ?auto_652533 ) ) ( not ( = ?auto_652524 ?auto_652528 ) ) ( not ( = ?auto_652524 ?auto_652530 ) ) ( not ( = ?auto_652524 ?auto_652529 ) ) ( not ( = ?auto_652524 ?auto_652531 ) ) ( not ( = ?auto_652524 ?auto_652532 ) ) ( not ( = ?auto_652524 ?auto_652533 ) ) ( not ( = ?auto_652528 ?auto_652530 ) ) ( not ( = ?auto_652528 ?auto_652529 ) ) ( not ( = ?auto_652528 ?auto_652531 ) ) ( not ( = ?auto_652528 ?auto_652532 ) ) ( not ( = ?auto_652528 ?auto_652533 ) ) ( not ( = ?auto_652530 ?auto_652529 ) ) ( not ( = ?auto_652530 ?auto_652531 ) ) ( not ( = ?auto_652530 ?auto_652532 ) ) ( not ( = ?auto_652530 ?auto_652533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652529 ?auto_652531 ?auto_652532 )
      ( MAKE-8CRATE-VERIFY ?auto_652525 ?auto_652526 ?auto_652527 ?auto_652524 ?auto_652528 ?auto_652530 ?auto_652529 ?auto_652531 ?auto_652532 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652618 - SURFACE
      ?auto_652619 - SURFACE
      ?auto_652620 - SURFACE
      ?auto_652617 - SURFACE
      ?auto_652621 - SURFACE
      ?auto_652623 - SURFACE
      ?auto_652622 - SURFACE
      ?auto_652624 - SURFACE
      ?auto_652625 - SURFACE
    )
    :vars
    (
      ?auto_652630 - HOIST
      ?auto_652628 - PLACE
      ?auto_652626 - PLACE
      ?auto_652631 - HOIST
      ?auto_652629 - SURFACE
      ?auto_652627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652630 ?auto_652628 ) ( SURFACE-AT ?auto_652624 ?auto_652628 ) ( CLEAR ?auto_652624 ) ( IS-CRATE ?auto_652625 ) ( not ( = ?auto_652624 ?auto_652625 ) ) ( AVAILABLE ?auto_652630 ) ( ON ?auto_652624 ?auto_652622 ) ( not ( = ?auto_652622 ?auto_652624 ) ) ( not ( = ?auto_652622 ?auto_652625 ) ) ( not ( = ?auto_652626 ?auto_652628 ) ) ( HOIST-AT ?auto_652631 ?auto_652626 ) ( not ( = ?auto_652630 ?auto_652631 ) ) ( AVAILABLE ?auto_652631 ) ( SURFACE-AT ?auto_652625 ?auto_652626 ) ( ON ?auto_652625 ?auto_652629 ) ( CLEAR ?auto_652625 ) ( not ( = ?auto_652624 ?auto_652629 ) ) ( not ( = ?auto_652625 ?auto_652629 ) ) ( not ( = ?auto_652622 ?auto_652629 ) ) ( TRUCK-AT ?auto_652627 ?auto_652628 ) ( ON ?auto_652619 ?auto_652618 ) ( ON ?auto_652620 ?auto_652619 ) ( ON ?auto_652617 ?auto_652620 ) ( ON ?auto_652621 ?auto_652617 ) ( ON ?auto_652623 ?auto_652621 ) ( ON ?auto_652622 ?auto_652623 ) ( not ( = ?auto_652618 ?auto_652619 ) ) ( not ( = ?auto_652618 ?auto_652620 ) ) ( not ( = ?auto_652618 ?auto_652617 ) ) ( not ( = ?auto_652618 ?auto_652621 ) ) ( not ( = ?auto_652618 ?auto_652623 ) ) ( not ( = ?auto_652618 ?auto_652622 ) ) ( not ( = ?auto_652618 ?auto_652624 ) ) ( not ( = ?auto_652618 ?auto_652625 ) ) ( not ( = ?auto_652618 ?auto_652629 ) ) ( not ( = ?auto_652619 ?auto_652620 ) ) ( not ( = ?auto_652619 ?auto_652617 ) ) ( not ( = ?auto_652619 ?auto_652621 ) ) ( not ( = ?auto_652619 ?auto_652623 ) ) ( not ( = ?auto_652619 ?auto_652622 ) ) ( not ( = ?auto_652619 ?auto_652624 ) ) ( not ( = ?auto_652619 ?auto_652625 ) ) ( not ( = ?auto_652619 ?auto_652629 ) ) ( not ( = ?auto_652620 ?auto_652617 ) ) ( not ( = ?auto_652620 ?auto_652621 ) ) ( not ( = ?auto_652620 ?auto_652623 ) ) ( not ( = ?auto_652620 ?auto_652622 ) ) ( not ( = ?auto_652620 ?auto_652624 ) ) ( not ( = ?auto_652620 ?auto_652625 ) ) ( not ( = ?auto_652620 ?auto_652629 ) ) ( not ( = ?auto_652617 ?auto_652621 ) ) ( not ( = ?auto_652617 ?auto_652623 ) ) ( not ( = ?auto_652617 ?auto_652622 ) ) ( not ( = ?auto_652617 ?auto_652624 ) ) ( not ( = ?auto_652617 ?auto_652625 ) ) ( not ( = ?auto_652617 ?auto_652629 ) ) ( not ( = ?auto_652621 ?auto_652623 ) ) ( not ( = ?auto_652621 ?auto_652622 ) ) ( not ( = ?auto_652621 ?auto_652624 ) ) ( not ( = ?auto_652621 ?auto_652625 ) ) ( not ( = ?auto_652621 ?auto_652629 ) ) ( not ( = ?auto_652623 ?auto_652622 ) ) ( not ( = ?auto_652623 ?auto_652624 ) ) ( not ( = ?auto_652623 ?auto_652625 ) ) ( not ( = ?auto_652623 ?auto_652629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652622 ?auto_652624 ?auto_652625 )
      ( MAKE-8CRATE-VERIFY ?auto_652618 ?auto_652619 ?auto_652620 ?auto_652617 ?auto_652621 ?auto_652623 ?auto_652622 ?auto_652624 ?auto_652625 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652711 - SURFACE
      ?auto_652712 - SURFACE
      ?auto_652713 - SURFACE
      ?auto_652710 - SURFACE
      ?auto_652714 - SURFACE
      ?auto_652716 - SURFACE
      ?auto_652715 - SURFACE
      ?auto_652717 - SURFACE
      ?auto_652718 - SURFACE
    )
    :vars
    (
      ?auto_652724 - HOIST
      ?auto_652720 - PLACE
      ?auto_652719 - PLACE
      ?auto_652721 - HOIST
      ?auto_652723 - SURFACE
      ?auto_652722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652724 ?auto_652720 ) ( IS-CRATE ?auto_652718 ) ( not ( = ?auto_652717 ?auto_652718 ) ) ( not ( = ?auto_652715 ?auto_652717 ) ) ( not ( = ?auto_652715 ?auto_652718 ) ) ( not ( = ?auto_652719 ?auto_652720 ) ) ( HOIST-AT ?auto_652721 ?auto_652719 ) ( not ( = ?auto_652724 ?auto_652721 ) ) ( AVAILABLE ?auto_652721 ) ( SURFACE-AT ?auto_652718 ?auto_652719 ) ( ON ?auto_652718 ?auto_652723 ) ( CLEAR ?auto_652718 ) ( not ( = ?auto_652717 ?auto_652723 ) ) ( not ( = ?auto_652718 ?auto_652723 ) ) ( not ( = ?auto_652715 ?auto_652723 ) ) ( TRUCK-AT ?auto_652722 ?auto_652720 ) ( SURFACE-AT ?auto_652715 ?auto_652720 ) ( CLEAR ?auto_652715 ) ( LIFTING ?auto_652724 ?auto_652717 ) ( IS-CRATE ?auto_652717 ) ( ON ?auto_652712 ?auto_652711 ) ( ON ?auto_652713 ?auto_652712 ) ( ON ?auto_652710 ?auto_652713 ) ( ON ?auto_652714 ?auto_652710 ) ( ON ?auto_652716 ?auto_652714 ) ( ON ?auto_652715 ?auto_652716 ) ( not ( = ?auto_652711 ?auto_652712 ) ) ( not ( = ?auto_652711 ?auto_652713 ) ) ( not ( = ?auto_652711 ?auto_652710 ) ) ( not ( = ?auto_652711 ?auto_652714 ) ) ( not ( = ?auto_652711 ?auto_652716 ) ) ( not ( = ?auto_652711 ?auto_652715 ) ) ( not ( = ?auto_652711 ?auto_652717 ) ) ( not ( = ?auto_652711 ?auto_652718 ) ) ( not ( = ?auto_652711 ?auto_652723 ) ) ( not ( = ?auto_652712 ?auto_652713 ) ) ( not ( = ?auto_652712 ?auto_652710 ) ) ( not ( = ?auto_652712 ?auto_652714 ) ) ( not ( = ?auto_652712 ?auto_652716 ) ) ( not ( = ?auto_652712 ?auto_652715 ) ) ( not ( = ?auto_652712 ?auto_652717 ) ) ( not ( = ?auto_652712 ?auto_652718 ) ) ( not ( = ?auto_652712 ?auto_652723 ) ) ( not ( = ?auto_652713 ?auto_652710 ) ) ( not ( = ?auto_652713 ?auto_652714 ) ) ( not ( = ?auto_652713 ?auto_652716 ) ) ( not ( = ?auto_652713 ?auto_652715 ) ) ( not ( = ?auto_652713 ?auto_652717 ) ) ( not ( = ?auto_652713 ?auto_652718 ) ) ( not ( = ?auto_652713 ?auto_652723 ) ) ( not ( = ?auto_652710 ?auto_652714 ) ) ( not ( = ?auto_652710 ?auto_652716 ) ) ( not ( = ?auto_652710 ?auto_652715 ) ) ( not ( = ?auto_652710 ?auto_652717 ) ) ( not ( = ?auto_652710 ?auto_652718 ) ) ( not ( = ?auto_652710 ?auto_652723 ) ) ( not ( = ?auto_652714 ?auto_652716 ) ) ( not ( = ?auto_652714 ?auto_652715 ) ) ( not ( = ?auto_652714 ?auto_652717 ) ) ( not ( = ?auto_652714 ?auto_652718 ) ) ( not ( = ?auto_652714 ?auto_652723 ) ) ( not ( = ?auto_652716 ?auto_652715 ) ) ( not ( = ?auto_652716 ?auto_652717 ) ) ( not ( = ?auto_652716 ?auto_652718 ) ) ( not ( = ?auto_652716 ?auto_652723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652715 ?auto_652717 ?auto_652718 )
      ( MAKE-8CRATE-VERIFY ?auto_652711 ?auto_652712 ?auto_652713 ?auto_652710 ?auto_652714 ?auto_652716 ?auto_652715 ?auto_652717 ?auto_652718 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652804 - SURFACE
      ?auto_652805 - SURFACE
      ?auto_652806 - SURFACE
      ?auto_652803 - SURFACE
      ?auto_652807 - SURFACE
      ?auto_652809 - SURFACE
      ?auto_652808 - SURFACE
      ?auto_652810 - SURFACE
      ?auto_652811 - SURFACE
    )
    :vars
    (
      ?auto_652817 - HOIST
      ?auto_652812 - PLACE
      ?auto_652815 - PLACE
      ?auto_652814 - HOIST
      ?auto_652816 - SURFACE
      ?auto_652813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652817 ?auto_652812 ) ( IS-CRATE ?auto_652811 ) ( not ( = ?auto_652810 ?auto_652811 ) ) ( not ( = ?auto_652808 ?auto_652810 ) ) ( not ( = ?auto_652808 ?auto_652811 ) ) ( not ( = ?auto_652815 ?auto_652812 ) ) ( HOIST-AT ?auto_652814 ?auto_652815 ) ( not ( = ?auto_652817 ?auto_652814 ) ) ( AVAILABLE ?auto_652814 ) ( SURFACE-AT ?auto_652811 ?auto_652815 ) ( ON ?auto_652811 ?auto_652816 ) ( CLEAR ?auto_652811 ) ( not ( = ?auto_652810 ?auto_652816 ) ) ( not ( = ?auto_652811 ?auto_652816 ) ) ( not ( = ?auto_652808 ?auto_652816 ) ) ( TRUCK-AT ?auto_652813 ?auto_652812 ) ( SURFACE-AT ?auto_652808 ?auto_652812 ) ( CLEAR ?auto_652808 ) ( IS-CRATE ?auto_652810 ) ( AVAILABLE ?auto_652817 ) ( IN ?auto_652810 ?auto_652813 ) ( ON ?auto_652805 ?auto_652804 ) ( ON ?auto_652806 ?auto_652805 ) ( ON ?auto_652803 ?auto_652806 ) ( ON ?auto_652807 ?auto_652803 ) ( ON ?auto_652809 ?auto_652807 ) ( ON ?auto_652808 ?auto_652809 ) ( not ( = ?auto_652804 ?auto_652805 ) ) ( not ( = ?auto_652804 ?auto_652806 ) ) ( not ( = ?auto_652804 ?auto_652803 ) ) ( not ( = ?auto_652804 ?auto_652807 ) ) ( not ( = ?auto_652804 ?auto_652809 ) ) ( not ( = ?auto_652804 ?auto_652808 ) ) ( not ( = ?auto_652804 ?auto_652810 ) ) ( not ( = ?auto_652804 ?auto_652811 ) ) ( not ( = ?auto_652804 ?auto_652816 ) ) ( not ( = ?auto_652805 ?auto_652806 ) ) ( not ( = ?auto_652805 ?auto_652803 ) ) ( not ( = ?auto_652805 ?auto_652807 ) ) ( not ( = ?auto_652805 ?auto_652809 ) ) ( not ( = ?auto_652805 ?auto_652808 ) ) ( not ( = ?auto_652805 ?auto_652810 ) ) ( not ( = ?auto_652805 ?auto_652811 ) ) ( not ( = ?auto_652805 ?auto_652816 ) ) ( not ( = ?auto_652806 ?auto_652803 ) ) ( not ( = ?auto_652806 ?auto_652807 ) ) ( not ( = ?auto_652806 ?auto_652809 ) ) ( not ( = ?auto_652806 ?auto_652808 ) ) ( not ( = ?auto_652806 ?auto_652810 ) ) ( not ( = ?auto_652806 ?auto_652811 ) ) ( not ( = ?auto_652806 ?auto_652816 ) ) ( not ( = ?auto_652803 ?auto_652807 ) ) ( not ( = ?auto_652803 ?auto_652809 ) ) ( not ( = ?auto_652803 ?auto_652808 ) ) ( not ( = ?auto_652803 ?auto_652810 ) ) ( not ( = ?auto_652803 ?auto_652811 ) ) ( not ( = ?auto_652803 ?auto_652816 ) ) ( not ( = ?auto_652807 ?auto_652809 ) ) ( not ( = ?auto_652807 ?auto_652808 ) ) ( not ( = ?auto_652807 ?auto_652810 ) ) ( not ( = ?auto_652807 ?auto_652811 ) ) ( not ( = ?auto_652807 ?auto_652816 ) ) ( not ( = ?auto_652809 ?auto_652808 ) ) ( not ( = ?auto_652809 ?auto_652810 ) ) ( not ( = ?auto_652809 ?auto_652811 ) ) ( not ( = ?auto_652809 ?auto_652816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652808 ?auto_652810 ?auto_652811 )
      ( MAKE-8CRATE-VERIFY ?auto_652804 ?auto_652805 ?auto_652806 ?auto_652803 ?auto_652807 ?auto_652809 ?auto_652808 ?auto_652810 ?auto_652811 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_655898 - SURFACE
      ?auto_655899 - SURFACE
    )
    :vars
    (
      ?auto_655904 - HOIST
      ?auto_655902 - PLACE
      ?auto_655905 - SURFACE
      ?auto_655906 - TRUCK
      ?auto_655903 - PLACE
      ?auto_655901 - HOIST
      ?auto_655900 - SURFACE
      ?auto_655907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_655904 ?auto_655902 ) ( SURFACE-AT ?auto_655898 ?auto_655902 ) ( CLEAR ?auto_655898 ) ( IS-CRATE ?auto_655899 ) ( not ( = ?auto_655898 ?auto_655899 ) ) ( AVAILABLE ?auto_655904 ) ( ON ?auto_655898 ?auto_655905 ) ( not ( = ?auto_655905 ?auto_655898 ) ) ( not ( = ?auto_655905 ?auto_655899 ) ) ( TRUCK-AT ?auto_655906 ?auto_655903 ) ( not ( = ?auto_655903 ?auto_655902 ) ) ( HOIST-AT ?auto_655901 ?auto_655903 ) ( not ( = ?auto_655904 ?auto_655901 ) ) ( SURFACE-AT ?auto_655899 ?auto_655903 ) ( ON ?auto_655899 ?auto_655900 ) ( CLEAR ?auto_655899 ) ( not ( = ?auto_655898 ?auto_655900 ) ) ( not ( = ?auto_655899 ?auto_655900 ) ) ( not ( = ?auto_655905 ?auto_655900 ) ) ( LIFTING ?auto_655901 ?auto_655907 ) ( IS-CRATE ?auto_655907 ) ( not ( = ?auto_655898 ?auto_655907 ) ) ( not ( = ?auto_655899 ?auto_655907 ) ) ( not ( = ?auto_655905 ?auto_655907 ) ) ( not ( = ?auto_655900 ?auto_655907 ) ) )
    :subtasks
    ( ( !LOAD ?auto_655901 ?auto_655907 ?auto_655906 ?auto_655903 )
      ( MAKE-1CRATE ?auto_655898 ?auto_655899 )
      ( MAKE-1CRATE-VERIFY ?auto_655898 ?auto_655899 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656911 - SURFACE
      ?auto_656912 - SURFACE
      ?auto_656913 - SURFACE
      ?auto_656910 - SURFACE
      ?auto_656914 - SURFACE
      ?auto_656916 - SURFACE
      ?auto_656915 - SURFACE
      ?auto_656917 - SURFACE
      ?auto_656918 - SURFACE
      ?auto_656919 - SURFACE
    )
    :vars
    (
      ?auto_656921 - HOIST
      ?auto_656920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_656921 ?auto_656920 ) ( SURFACE-AT ?auto_656918 ?auto_656920 ) ( CLEAR ?auto_656918 ) ( LIFTING ?auto_656921 ?auto_656919 ) ( IS-CRATE ?auto_656919 ) ( not ( = ?auto_656918 ?auto_656919 ) ) ( ON ?auto_656912 ?auto_656911 ) ( ON ?auto_656913 ?auto_656912 ) ( ON ?auto_656910 ?auto_656913 ) ( ON ?auto_656914 ?auto_656910 ) ( ON ?auto_656916 ?auto_656914 ) ( ON ?auto_656915 ?auto_656916 ) ( ON ?auto_656917 ?auto_656915 ) ( ON ?auto_656918 ?auto_656917 ) ( not ( = ?auto_656911 ?auto_656912 ) ) ( not ( = ?auto_656911 ?auto_656913 ) ) ( not ( = ?auto_656911 ?auto_656910 ) ) ( not ( = ?auto_656911 ?auto_656914 ) ) ( not ( = ?auto_656911 ?auto_656916 ) ) ( not ( = ?auto_656911 ?auto_656915 ) ) ( not ( = ?auto_656911 ?auto_656917 ) ) ( not ( = ?auto_656911 ?auto_656918 ) ) ( not ( = ?auto_656911 ?auto_656919 ) ) ( not ( = ?auto_656912 ?auto_656913 ) ) ( not ( = ?auto_656912 ?auto_656910 ) ) ( not ( = ?auto_656912 ?auto_656914 ) ) ( not ( = ?auto_656912 ?auto_656916 ) ) ( not ( = ?auto_656912 ?auto_656915 ) ) ( not ( = ?auto_656912 ?auto_656917 ) ) ( not ( = ?auto_656912 ?auto_656918 ) ) ( not ( = ?auto_656912 ?auto_656919 ) ) ( not ( = ?auto_656913 ?auto_656910 ) ) ( not ( = ?auto_656913 ?auto_656914 ) ) ( not ( = ?auto_656913 ?auto_656916 ) ) ( not ( = ?auto_656913 ?auto_656915 ) ) ( not ( = ?auto_656913 ?auto_656917 ) ) ( not ( = ?auto_656913 ?auto_656918 ) ) ( not ( = ?auto_656913 ?auto_656919 ) ) ( not ( = ?auto_656910 ?auto_656914 ) ) ( not ( = ?auto_656910 ?auto_656916 ) ) ( not ( = ?auto_656910 ?auto_656915 ) ) ( not ( = ?auto_656910 ?auto_656917 ) ) ( not ( = ?auto_656910 ?auto_656918 ) ) ( not ( = ?auto_656910 ?auto_656919 ) ) ( not ( = ?auto_656914 ?auto_656916 ) ) ( not ( = ?auto_656914 ?auto_656915 ) ) ( not ( = ?auto_656914 ?auto_656917 ) ) ( not ( = ?auto_656914 ?auto_656918 ) ) ( not ( = ?auto_656914 ?auto_656919 ) ) ( not ( = ?auto_656916 ?auto_656915 ) ) ( not ( = ?auto_656916 ?auto_656917 ) ) ( not ( = ?auto_656916 ?auto_656918 ) ) ( not ( = ?auto_656916 ?auto_656919 ) ) ( not ( = ?auto_656915 ?auto_656917 ) ) ( not ( = ?auto_656915 ?auto_656918 ) ) ( not ( = ?auto_656915 ?auto_656919 ) ) ( not ( = ?auto_656917 ?auto_656918 ) ) ( not ( = ?auto_656917 ?auto_656919 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_656918 ?auto_656919 )
      ( MAKE-9CRATE-VERIFY ?auto_656911 ?auto_656912 ?auto_656913 ?auto_656910 ?auto_656914 ?auto_656916 ?auto_656915 ?auto_656917 ?auto_656918 ?auto_656919 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656991 - SURFACE
      ?auto_656992 - SURFACE
      ?auto_656993 - SURFACE
      ?auto_656990 - SURFACE
      ?auto_656994 - SURFACE
      ?auto_656996 - SURFACE
      ?auto_656995 - SURFACE
      ?auto_656997 - SURFACE
      ?auto_656998 - SURFACE
      ?auto_656999 - SURFACE
    )
    :vars
    (
      ?auto_657001 - HOIST
      ?auto_657002 - PLACE
      ?auto_657000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657001 ?auto_657002 ) ( SURFACE-AT ?auto_656998 ?auto_657002 ) ( CLEAR ?auto_656998 ) ( IS-CRATE ?auto_656999 ) ( not ( = ?auto_656998 ?auto_656999 ) ) ( TRUCK-AT ?auto_657000 ?auto_657002 ) ( AVAILABLE ?auto_657001 ) ( IN ?auto_656999 ?auto_657000 ) ( ON ?auto_656998 ?auto_656997 ) ( not ( = ?auto_656997 ?auto_656998 ) ) ( not ( = ?auto_656997 ?auto_656999 ) ) ( ON ?auto_656992 ?auto_656991 ) ( ON ?auto_656993 ?auto_656992 ) ( ON ?auto_656990 ?auto_656993 ) ( ON ?auto_656994 ?auto_656990 ) ( ON ?auto_656996 ?auto_656994 ) ( ON ?auto_656995 ?auto_656996 ) ( ON ?auto_656997 ?auto_656995 ) ( not ( = ?auto_656991 ?auto_656992 ) ) ( not ( = ?auto_656991 ?auto_656993 ) ) ( not ( = ?auto_656991 ?auto_656990 ) ) ( not ( = ?auto_656991 ?auto_656994 ) ) ( not ( = ?auto_656991 ?auto_656996 ) ) ( not ( = ?auto_656991 ?auto_656995 ) ) ( not ( = ?auto_656991 ?auto_656997 ) ) ( not ( = ?auto_656991 ?auto_656998 ) ) ( not ( = ?auto_656991 ?auto_656999 ) ) ( not ( = ?auto_656992 ?auto_656993 ) ) ( not ( = ?auto_656992 ?auto_656990 ) ) ( not ( = ?auto_656992 ?auto_656994 ) ) ( not ( = ?auto_656992 ?auto_656996 ) ) ( not ( = ?auto_656992 ?auto_656995 ) ) ( not ( = ?auto_656992 ?auto_656997 ) ) ( not ( = ?auto_656992 ?auto_656998 ) ) ( not ( = ?auto_656992 ?auto_656999 ) ) ( not ( = ?auto_656993 ?auto_656990 ) ) ( not ( = ?auto_656993 ?auto_656994 ) ) ( not ( = ?auto_656993 ?auto_656996 ) ) ( not ( = ?auto_656993 ?auto_656995 ) ) ( not ( = ?auto_656993 ?auto_656997 ) ) ( not ( = ?auto_656993 ?auto_656998 ) ) ( not ( = ?auto_656993 ?auto_656999 ) ) ( not ( = ?auto_656990 ?auto_656994 ) ) ( not ( = ?auto_656990 ?auto_656996 ) ) ( not ( = ?auto_656990 ?auto_656995 ) ) ( not ( = ?auto_656990 ?auto_656997 ) ) ( not ( = ?auto_656990 ?auto_656998 ) ) ( not ( = ?auto_656990 ?auto_656999 ) ) ( not ( = ?auto_656994 ?auto_656996 ) ) ( not ( = ?auto_656994 ?auto_656995 ) ) ( not ( = ?auto_656994 ?auto_656997 ) ) ( not ( = ?auto_656994 ?auto_656998 ) ) ( not ( = ?auto_656994 ?auto_656999 ) ) ( not ( = ?auto_656996 ?auto_656995 ) ) ( not ( = ?auto_656996 ?auto_656997 ) ) ( not ( = ?auto_656996 ?auto_656998 ) ) ( not ( = ?auto_656996 ?auto_656999 ) ) ( not ( = ?auto_656995 ?auto_656997 ) ) ( not ( = ?auto_656995 ?auto_656998 ) ) ( not ( = ?auto_656995 ?auto_656999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656997 ?auto_656998 ?auto_656999 )
      ( MAKE-9CRATE-VERIFY ?auto_656991 ?auto_656992 ?auto_656993 ?auto_656990 ?auto_656994 ?auto_656996 ?auto_656995 ?auto_656997 ?auto_656998 ?auto_656999 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657081 - SURFACE
      ?auto_657082 - SURFACE
      ?auto_657083 - SURFACE
      ?auto_657080 - SURFACE
      ?auto_657084 - SURFACE
      ?auto_657086 - SURFACE
      ?auto_657085 - SURFACE
      ?auto_657087 - SURFACE
      ?auto_657088 - SURFACE
      ?auto_657089 - SURFACE
    )
    :vars
    (
      ?auto_657092 - HOIST
      ?auto_657090 - PLACE
      ?auto_657093 - TRUCK
      ?auto_657091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657092 ?auto_657090 ) ( SURFACE-AT ?auto_657088 ?auto_657090 ) ( CLEAR ?auto_657088 ) ( IS-CRATE ?auto_657089 ) ( not ( = ?auto_657088 ?auto_657089 ) ) ( AVAILABLE ?auto_657092 ) ( IN ?auto_657089 ?auto_657093 ) ( ON ?auto_657088 ?auto_657087 ) ( not ( = ?auto_657087 ?auto_657088 ) ) ( not ( = ?auto_657087 ?auto_657089 ) ) ( TRUCK-AT ?auto_657093 ?auto_657091 ) ( not ( = ?auto_657091 ?auto_657090 ) ) ( ON ?auto_657082 ?auto_657081 ) ( ON ?auto_657083 ?auto_657082 ) ( ON ?auto_657080 ?auto_657083 ) ( ON ?auto_657084 ?auto_657080 ) ( ON ?auto_657086 ?auto_657084 ) ( ON ?auto_657085 ?auto_657086 ) ( ON ?auto_657087 ?auto_657085 ) ( not ( = ?auto_657081 ?auto_657082 ) ) ( not ( = ?auto_657081 ?auto_657083 ) ) ( not ( = ?auto_657081 ?auto_657080 ) ) ( not ( = ?auto_657081 ?auto_657084 ) ) ( not ( = ?auto_657081 ?auto_657086 ) ) ( not ( = ?auto_657081 ?auto_657085 ) ) ( not ( = ?auto_657081 ?auto_657087 ) ) ( not ( = ?auto_657081 ?auto_657088 ) ) ( not ( = ?auto_657081 ?auto_657089 ) ) ( not ( = ?auto_657082 ?auto_657083 ) ) ( not ( = ?auto_657082 ?auto_657080 ) ) ( not ( = ?auto_657082 ?auto_657084 ) ) ( not ( = ?auto_657082 ?auto_657086 ) ) ( not ( = ?auto_657082 ?auto_657085 ) ) ( not ( = ?auto_657082 ?auto_657087 ) ) ( not ( = ?auto_657082 ?auto_657088 ) ) ( not ( = ?auto_657082 ?auto_657089 ) ) ( not ( = ?auto_657083 ?auto_657080 ) ) ( not ( = ?auto_657083 ?auto_657084 ) ) ( not ( = ?auto_657083 ?auto_657086 ) ) ( not ( = ?auto_657083 ?auto_657085 ) ) ( not ( = ?auto_657083 ?auto_657087 ) ) ( not ( = ?auto_657083 ?auto_657088 ) ) ( not ( = ?auto_657083 ?auto_657089 ) ) ( not ( = ?auto_657080 ?auto_657084 ) ) ( not ( = ?auto_657080 ?auto_657086 ) ) ( not ( = ?auto_657080 ?auto_657085 ) ) ( not ( = ?auto_657080 ?auto_657087 ) ) ( not ( = ?auto_657080 ?auto_657088 ) ) ( not ( = ?auto_657080 ?auto_657089 ) ) ( not ( = ?auto_657084 ?auto_657086 ) ) ( not ( = ?auto_657084 ?auto_657085 ) ) ( not ( = ?auto_657084 ?auto_657087 ) ) ( not ( = ?auto_657084 ?auto_657088 ) ) ( not ( = ?auto_657084 ?auto_657089 ) ) ( not ( = ?auto_657086 ?auto_657085 ) ) ( not ( = ?auto_657086 ?auto_657087 ) ) ( not ( = ?auto_657086 ?auto_657088 ) ) ( not ( = ?auto_657086 ?auto_657089 ) ) ( not ( = ?auto_657085 ?auto_657087 ) ) ( not ( = ?auto_657085 ?auto_657088 ) ) ( not ( = ?auto_657085 ?auto_657089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657087 ?auto_657088 ?auto_657089 )
      ( MAKE-9CRATE-VERIFY ?auto_657081 ?auto_657082 ?auto_657083 ?auto_657080 ?auto_657084 ?auto_657086 ?auto_657085 ?auto_657087 ?auto_657088 ?auto_657089 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657180 - SURFACE
      ?auto_657181 - SURFACE
      ?auto_657182 - SURFACE
      ?auto_657179 - SURFACE
      ?auto_657183 - SURFACE
      ?auto_657185 - SURFACE
      ?auto_657184 - SURFACE
      ?auto_657186 - SURFACE
      ?auto_657187 - SURFACE
      ?auto_657188 - SURFACE
    )
    :vars
    (
      ?auto_657192 - HOIST
      ?auto_657191 - PLACE
      ?auto_657189 - TRUCK
      ?auto_657193 - PLACE
      ?auto_657190 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_657192 ?auto_657191 ) ( SURFACE-AT ?auto_657187 ?auto_657191 ) ( CLEAR ?auto_657187 ) ( IS-CRATE ?auto_657188 ) ( not ( = ?auto_657187 ?auto_657188 ) ) ( AVAILABLE ?auto_657192 ) ( ON ?auto_657187 ?auto_657186 ) ( not ( = ?auto_657186 ?auto_657187 ) ) ( not ( = ?auto_657186 ?auto_657188 ) ) ( TRUCK-AT ?auto_657189 ?auto_657193 ) ( not ( = ?auto_657193 ?auto_657191 ) ) ( HOIST-AT ?auto_657190 ?auto_657193 ) ( LIFTING ?auto_657190 ?auto_657188 ) ( not ( = ?auto_657192 ?auto_657190 ) ) ( ON ?auto_657181 ?auto_657180 ) ( ON ?auto_657182 ?auto_657181 ) ( ON ?auto_657179 ?auto_657182 ) ( ON ?auto_657183 ?auto_657179 ) ( ON ?auto_657185 ?auto_657183 ) ( ON ?auto_657184 ?auto_657185 ) ( ON ?auto_657186 ?auto_657184 ) ( not ( = ?auto_657180 ?auto_657181 ) ) ( not ( = ?auto_657180 ?auto_657182 ) ) ( not ( = ?auto_657180 ?auto_657179 ) ) ( not ( = ?auto_657180 ?auto_657183 ) ) ( not ( = ?auto_657180 ?auto_657185 ) ) ( not ( = ?auto_657180 ?auto_657184 ) ) ( not ( = ?auto_657180 ?auto_657186 ) ) ( not ( = ?auto_657180 ?auto_657187 ) ) ( not ( = ?auto_657180 ?auto_657188 ) ) ( not ( = ?auto_657181 ?auto_657182 ) ) ( not ( = ?auto_657181 ?auto_657179 ) ) ( not ( = ?auto_657181 ?auto_657183 ) ) ( not ( = ?auto_657181 ?auto_657185 ) ) ( not ( = ?auto_657181 ?auto_657184 ) ) ( not ( = ?auto_657181 ?auto_657186 ) ) ( not ( = ?auto_657181 ?auto_657187 ) ) ( not ( = ?auto_657181 ?auto_657188 ) ) ( not ( = ?auto_657182 ?auto_657179 ) ) ( not ( = ?auto_657182 ?auto_657183 ) ) ( not ( = ?auto_657182 ?auto_657185 ) ) ( not ( = ?auto_657182 ?auto_657184 ) ) ( not ( = ?auto_657182 ?auto_657186 ) ) ( not ( = ?auto_657182 ?auto_657187 ) ) ( not ( = ?auto_657182 ?auto_657188 ) ) ( not ( = ?auto_657179 ?auto_657183 ) ) ( not ( = ?auto_657179 ?auto_657185 ) ) ( not ( = ?auto_657179 ?auto_657184 ) ) ( not ( = ?auto_657179 ?auto_657186 ) ) ( not ( = ?auto_657179 ?auto_657187 ) ) ( not ( = ?auto_657179 ?auto_657188 ) ) ( not ( = ?auto_657183 ?auto_657185 ) ) ( not ( = ?auto_657183 ?auto_657184 ) ) ( not ( = ?auto_657183 ?auto_657186 ) ) ( not ( = ?auto_657183 ?auto_657187 ) ) ( not ( = ?auto_657183 ?auto_657188 ) ) ( not ( = ?auto_657185 ?auto_657184 ) ) ( not ( = ?auto_657185 ?auto_657186 ) ) ( not ( = ?auto_657185 ?auto_657187 ) ) ( not ( = ?auto_657185 ?auto_657188 ) ) ( not ( = ?auto_657184 ?auto_657186 ) ) ( not ( = ?auto_657184 ?auto_657187 ) ) ( not ( = ?auto_657184 ?auto_657188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657186 ?auto_657187 ?auto_657188 )
      ( MAKE-9CRATE-VERIFY ?auto_657180 ?auto_657181 ?auto_657182 ?auto_657179 ?auto_657183 ?auto_657185 ?auto_657184 ?auto_657186 ?auto_657187 ?auto_657188 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657288 - SURFACE
      ?auto_657289 - SURFACE
      ?auto_657290 - SURFACE
      ?auto_657287 - SURFACE
      ?auto_657291 - SURFACE
      ?auto_657293 - SURFACE
      ?auto_657292 - SURFACE
      ?auto_657294 - SURFACE
      ?auto_657295 - SURFACE
      ?auto_657296 - SURFACE
    )
    :vars
    (
      ?auto_657298 - HOIST
      ?auto_657300 - PLACE
      ?auto_657301 - TRUCK
      ?auto_657299 - PLACE
      ?auto_657302 - HOIST
      ?auto_657297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657298 ?auto_657300 ) ( SURFACE-AT ?auto_657295 ?auto_657300 ) ( CLEAR ?auto_657295 ) ( IS-CRATE ?auto_657296 ) ( not ( = ?auto_657295 ?auto_657296 ) ) ( AVAILABLE ?auto_657298 ) ( ON ?auto_657295 ?auto_657294 ) ( not ( = ?auto_657294 ?auto_657295 ) ) ( not ( = ?auto_657294 ?auto_657296 ) ) ( TRUCK-AT ?auto_657301 ?auto_657299 ) ( not ( = ?auto_657299 ?auto_657300 ) ) ( HOIST-AT ?auto_657302 ?auto_657299 ) ( not ( = ?auto_657298 ?auto_657302 ) ) ( AVAILABLE ?auto_657302 ) ( SURFACE-AT ?auto_657296 ?auto_657299 ) ( ON ?auto_657296 ?auto_657297 ) ( CLEAR ?auto_657296 ) ( not ( = ?auto_657295 ?auto_657297 ) ) ( not ( = ?auto_657296 ?auto_657297 ) ) ( not ( = ?auto_657294 ?auto_657297 ) ) ( ON ?auto_657289 ?auto_657288 ) ( ON ?auto_657290 ?auto_657289 ) ( ON ?auto_657287 ?auto_657290 ) ( ON ?auto_657291 ?auto_657287 ) ( ON ?auto_657293 ?auto_657291 ) ( ON ?auto_657292 ?auto_657293 ) ( ON ?auto_657294 ?auto_657292 ) ( not ( = ?auto_657288 ?auto_657289 ) ) ( not ( = ?auto_657288 ?auto_657290 ) ) ( not ( = ?auto_657288 ?auto_657287 ) ) ( not ( = ?auto_657288 ?auto_657291 ) ) ( not ( = ?auto_657288 ?auto_657293 ) ) ( not ( = ?auto_657288 ?auto_657292 ) ) ( not ( = ?auto_657288 ?auto_657294 ) ) ( not ( = ?auto_657288 ?auto_657295 ) ) ( not ( = ?auto_657288 ?auto_657296 ) ) ( not ( = ?auto_657288 ?auto_657297 ) ) ( not ( = ?auto_657289 ?auto_657290 ) ) ( not ( = ?auto_657289 ?auto_657287 ) ) ( not ( = ?auto_657289 ?auto_657291 ) ) ( not ( = ?auto_657289 ?auto_657293 ) ) ( not ( = ?auto_657289 ?auto_657292 ) ) ( not ( = ?auto_657289 ?auto_657294 ) ) ( not ( = ?auto_657289 ?auto_657295 ) ) ( not ( = ?auto_657289 ?auto_657296 ) ) ( not ( = ?auto_657289 ?auto_657297 ) ) ( not ( = ?auto_657290 ?auto_657287 ) ) ( not ( = ?auto_657290 ?auto_657291 ) ) ( not ( = ?auto_657290 ?auto_657293 ) ) ( not ( = ?auto_657290 ?auto_657292 ) ) ( not ( = ?auto_657290 ?auto_657294 ) ) ( not ( = ?auto_657290 ?auto_657295 ) ) ( not ( = ?auto_657290 ?auto_657296 ) ) ( not ( = ?auto_657290 ?auto_657297 ) ) ( not ( = ?auto_657287 ?auto_657291 ) ) ( not ( = ?auto_657287 ?auto_657293 ) ) ( not ( = ?auto_657287 ?auto_657292 ) ) ( not ( = ?auto_657287 ?auto_657294 ) ) ( not ( = ?auto_657287 ?auto_657295 ) ) ( not ( = ?auto_657287 ?auto_657296 ) ) ( not ( = ?auto_657287 ?auto_657297 ) ) ( not ( = ?auto_657291 ?auto_657293 ) ) ( not ( = ?auto_657291 ?auto_657292 ) ) ( not ( = ?auto_657291 ?auto_657294 ) ) ( not ( = ?auto_657291 ?auto_657295 ) ) ( not ( = ?auto_657291 ?auto_657296 ) ) ( not ( = ?auto_657291 ?auto_657297 ) ) ( not ( = ?auto_657293 ?auto_657292 ) ) ( not ( = ?auto_657293 ?auto_657294 ) ) ( not ( = ?auto_657293 ?auto_657295 ) ) ( not ( = ?auto_657293 ?auto_657296 ) ) ( not ( = ?auto_657293 ?auto_657297 ) ) ( not ( = ?auto_657292 ?auto_657294 ) ) ( not ( = ?auto_657292 ?auto_657295 ) ) ( not ( = ?auto_657292 ?auto_657296 ) ) ( not ( = ?auto_657292 ?auto_657297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657294 ?auto_657295 ?auto_657296 )
      ( MAKE-9CRATE-VERIFY ?auto_657288 ?auto_657289 ?auto_657290 ?auto_657287 ?auto_657291 ?auto_657293 ?auto_657292 ?auto_657294 ?auto_657295 ?auto_657296 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657397 - SURFACE
      ?auto_657398 - SURFACE
      ?auto_657399 - SURFACE
      ?auto_657396 - SURFACE
      ?auto_657400 - SURFACE
      ?auto_657402 - SURFACE
      ?auto_657401 - SURFACE
      ?auto_657403 - SURFACE
      ?auto_657404 - SURFACE
      ?auto_657405 - SURFACE
    )
    :vars
    (
      ?auto_657407 - HOIST
      ?auto_657411 - PLACE
      ?auto_657406 - PLACE
      ?auto_657409 - HOIST
      ?auto_657408 - SURFACE
      ?auto_657410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657407 ?auto_657411 ) ( SURFACE-AT ?auto_657404 ?auto_657411 ) ( CLEAR ?auto_657404 ) ( IS-CRATE ?auto_657405 ) ( not ( = ?auto_657404 ?auto_657405 ) ) ( AVAILABLE ?auto_657407 ) ( ON ?auto_657404 ?auto_657403 ) ( not ( = ?auto_657403 ?auto_657404 ) ) ( not ( = ?auto_657403 ?auto_657405 ) ) ( not ( = ?auto_657406 ?auto_657411 ) ) ( HOIST-AT ?auto_657409 ?auto_657406 ) ( not ( = ?auto_657407 ?auto_657409 ) ) ( AVAILABLE ?auto_657409 ) ( SURFACE-AT ?auto_657405 ?auto_657406 ) ( ON ?auto_657405 ?auto_657408 ) ( CLEAR ?auto_657405 ) ( not ( = ?auto_657404 ?auto_657408 ) ) ( not ( = ?auto_657405 ?auto_657408 ) ) ( not ( = ?auto_657403 ?auto_657408 ) ) ( TRUCK-AT ?auto_657410 ?auto_657411 ) ( ON ?auto_657398 ?auto_657397 ) ( ON ?auto_657399 ?auto_657398 ) ( ON ?auto_657396 ?auto_657399 ) ( ON ?auto_657400 ?auto_657396 ) ( ON ?auto_657402 ?auto_657400 ) ( ON ?auto_657401 ?auto_657402 ) ( ON ?auto_657403 ?auto_657401 ) ( not ( = ?auto_657397 ?auto_657398 ) ) ( not ( = ?auto_657397 ?auto_657399 ) ) ( not ( = ?auto_657397 ?auto_657396 ) ) ( not ( = ?auto_657397 ?auto_657400 ) ) ( not ( = ?auto_657397 ?auto_657402 ) ) ( not ( = ?auto_657397 ?auto_657401 ) ) ( not ( = ?auto_657397 ?auto_657403 ) ) ( not ( = ?auto_657397 ?auto_657404 ) ) ( not ( = ?auto_657397 ?auto_657405 ) ) ( not ( = ?auto_657397 ?auto_657408 ) ) ( not ( = ?auto_657398 ?auto_657399 ) ) ( not ( = ?auto_657398 ?auto_657396 ) ) ( not ( = ?auto_657398 ?auto_657400 ) ) ( not ( = ?auto_657398 ?auto_657402 ) ) ( not ( = ?auto_657398 ?auto_657401 ) ) ( not ( = ?auto_657398 ?auto_657403 ) ) ( not ( = ?auto_657398 ?auto_657404 ) ) ( not ( = ?auto_657398 ?auto_657405 ) ) ( not ( = ?auto_657398 ?auto_657408 ) ) ( not ( = ?auto_657399 ?auto_657396 ) ) ( not ( = ?auto_657399 ?auto_657400 ) ) ( not ( = ?auto_657399 ?auto_657402 ) ) ( not ( = ?auto_657399 ?auto_657401 ) ) ( not ( = ?auto_657399 ?auto_657403 ) ) ( not ( = ?auto_657399 ?auto_657404 ) ) ( not ( = ?auto_657399 ?auto_657405 ) ) ( not ( = ?auto_657399 ?auto_657408 ) ) ( not ( = ?auto_657396 ?auto_657400 ) ) ( not ( = ?auto_657396 ?auto_657402 ) ) ( not ( = ?auto_657396 ?auto_657401 ) ) ( not ( = ?auto_657396 ?auto_657403 ) ) ( not ( = ?auto_657396 ?auto_657404 ) ) ( not ( = ?auto_657396 ?auto_657405 ) ) ( not ( = ?auto_657396 ?auto_657408 ) ) ( not ( = ?auto_657400 ?auto_657402 ) ) ( not ( = ?auto_657400 ?auto_657401 ) ) ( not ( = ?auto_657400 ?auto_657403 ) ) ( not ( = ?auto_657400 ?auto_657404 ) ) ( not ( = ?auto_657400 ?auto_657405 ) ) ( not ( = ?auto_657400 ?auto_657408 ) ) ( not ( = ?auto_657402 ?auto_657401 ) ) ( not ( = ?auto_657402 ?auto_657403 ) ) ( not ( = ?auto_657402 ?auto_657404 ) ) ( not ( = ?auto_657402 ?auto_657405 ) ) ( not ( = ?auto_657402 ?auto_657408 ) ) ( not ( = ?auto_657401 ?auto_657403 ) ) ( not ( = ?auto_657401 ?auto_657404 ) ) ( not ( = ?auto_657401 ?auto_657405 ) ) ( not ( = ?auto_657401 ?auto_657408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657403 ?auto_657404 ?auto_657405 )
      ( MAKE-9CRATE-VERIFY ?auto_657397 ?auto_657398 ?auto_657399 ?auto_657396 ?auto_657400 ?auto_657402 ?auto_657401 ?auto_657403 ?auto_657404 ?auto_657405 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657506 - SURFACE
      ?auto_657507 - SURFACE
      ?auto_657508 - SURFACE
      ?auto_657505 - SURFACE
      ?auto_657509 - SURFACE
      ?auto_657511 - SURFACE
      ?auto_657510 - SURFACE
      ?auto_657512 - SURFACE
      ?auto_657513 - SURFACE
      ?auto_657514 - SURFACE
    )
    :vars
    (
      ?auto_657515 - HOIST
      ?auto_657518 - PLACE
      ?auto_657517 - PLACE
      ?auto_657520 - HOIST
      ?auto_657519 - SURFACE
      ?auto_657516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657515 ?auto_657518 ) ( IS-CRATE ?auto_657514 ) ( not ( = ?auto_657513 ?auto_657514 ) ) ( not ( = ?auto_657512 ?auto_657513 ) ) ( not ( = ?auto_657512 ?auto_657514 ) ) ( not ( = ?auto_657517 ?auto_657518 ) ) ( HOIST-AT ?auto_657520 ?auto_657517 ) ( not ( = ?auto_657515 ?auto_657520 ) ) ( AVAILABLE ?auto_657520 ) ( SURFACE-AT ?auto_657514 ?auto_657517 ) ( ON ?auto_657514 ?auto_657519 ) ( CLEAR ?auto_657514 ) ( not ( = ?auto_657513 ?auto_657519 ) ) ( not ( = ?auto_657514 ?auto_657519 ) ) ( not ( = ?auto_657512 ?auto_657519 ) ) ( TRUCK-AT ?auto_657516 ?auto_657518 ) ( SURFACE-AT ?auto_657512 ?auto_657518 ) ( CLEAR ?auto_657512 ) ( LIFTING ?auto_657515 ?auto_657513 ) ( IS-CRATE ?auto_657513 ) ( ON ?auto_657507 ?auto_657506 ) ( ON ?auto_657508 ?auto_657507 ) ( ON ?auto_657505 ?auto_657508 ) ( ON ?auto_657509 ?auto_657505 ) ( ON ?auto_657511 ?auto_657509 ) ( ON ?auto_657510 ?auto_657511 ) ( ON ?auto_657512 ?auto_657510 ) ( not ( = ?auto_657506 ?auto_657507 ) ) ( not ( = ?auto_657506 ?auto_657508 ) ) ( not ( = ?auto_657506 ?auto_657505 ) ) ( not ( = ?auto_657506 ?auto_657509 ) ) ( not ( = ?auto_657506 ?auto_657511 ) ) ( not ( = ?auto_657506 ?auto_657510 ) ) ( not ( = ?auto_657506 ?auto_657512 ) ) ( not ( = ?auto_657506 ?auto_657513 ) ) ( not ( = ?auto_657506 ?auto_657514 ) ) ( not ( = ?auto_657506 ?auto_657519 ) ) ( not ( = ?auto_657507 ?auto_657508 ) ) ( not ( = ?auto_657507 ?auto_657505 ) ) ( not ( = ?auto_657507 ?auto_657509 ) ) ( not ( = ?auto_657507 ?auto_657511 ) ) ( not ( = ?auto_657507 ?auto_657510 ) ) ( not ( = ?auto_657507 ?auto_657512 ) ) ( not ( = ?auto_657507 ?auto_657513 ) ) ( not ( = ?auto_657507 ?auto_657514 ) ) ( not ( = ?auto_657507 ?auto_657519 ) ) ( not ( = ?auto_657508 ?auto_657505 ) ) ( not ( = ?auto_657508 ?auto_657509 ) ) ( not ( = ?auto_657508 ?auto_657511 ) ) ( not ( = ?auto_657508 ?auto_657510 ) ) ( not ( = ?auto_657508 ?auto_657512 ) ) ( not ( = ?auto_657508 ?auto_657513 ) ) ( not ( = ?auto_657508 ?auto_657514 ) ) ( not ( = ?auto_657508 ?auto_657519 ) ) ( not ( = ?auto_657505 ?auto_657509 ) ) ( not ( = ?auto_657505 ?auto_657511 ) ) ( not ( = ?auto_657505 ?auto_657510 ) ) ( not ( = ?auto_657505 ?auto_657512 ) ) ( not ( = ?auto_657505 ?auto_657513 ) ) ( not ( = ?auto_657505 ?auto_657514 ) ) ( not ( = ?auto_657505 ?auto_657519 ) ) ( not ( = ?auto_657509 ?auto_657511 ) ) ( not ( = ?auto_657509 ?auto_657510 ) ) ( not ( = ?auto_657509 ?auto_657512 ) ) ( not ( = ?auto_657509 ?auto_657513 ) ) ( not ( = ?auto_657509 ?auto_657514 ) ) ( not ( = ?auto_657509 ?auto_657519 ) ) ( not ( = ?auto_657511 ?auto_657510 ) ) ( not ( = ?auto_657511 ?auto_657512 ) ) ( not ( = ?auto_657511 ?auto_657513 ) ) ( not ( = ?auto_657511 ?auto_657514 ) ) ( not ( = ?auto_657511 ?auto_657519 ) ) ( not ( = ?auto_657510 ?auto_657512 ) ) ( not ( = ?auto_657510 ?auto_657513 ) ) ( not ( = ?auto_657510 ?auto_657514 ) ) ( not ( = ?auto_657510 ?auto_657519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657512 ?auto_657513 ?auto_657514 )
      ( MAKE-9CRATE-VERIFY ?auto_657506 ?auto_657507 ?auto_657508 ?auto_657505 ?auto_657509 ?auto_657511 ?auto_657510 ?auto_657512 ?auto_657513 ?auto_657514 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657615 - SURFACE
      ?auto_657616 - SURFACE
      ?auto_657617 - SURFACE
      ?auto_657614 - SURFACE
      ?auto_657618 - SURFACE
      ?auto_657620 - SURFACE
      ?auto_657619 - SURFACE
      ?auto_657621 - SURFACE
      ?auto_657622 - SURFACE
      ?auto_657623 - SURFACE
    )
    :vars
    (
      ?auto_657629 - HOIST
      ?auto_657626 - PLACE
      ?auto_657625 - PLACE
      ?auto_657627 - HOIST
      ?auto_657628 - SURFACE
      ?auto_657624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657629 ?auto_657626 ) ( IS-CRATE ?auto_657623 ) ( not ( = ?auto_657622 ?auto_657623 ) ) ( not ( = ?auto_657621 ?auto_657622 ) ) ( not ( = ?auto_657621 ?auto_657623 ) ) ( not ( = ?auto_657625 ?auto_657626 ) ) ( HOIST-AT ?auto_657627 ?auto_657625 ) ( not ( = ?auto_657629 ?auto_657627 ) ) ( AVAILABLE ?auto_657627 ) ( SURFACE-AT ?auto_657623 ?auto_657625 ) ( ON ?auto_657623 ?auto_657628 ) ( CLEAR ?auto_657623 ) ( not ( = ?auto_657622 ?auto_657628 ) ) ( not ( = ?auto_657623 ?auto_657628 ) ) ( not ( = ?auto_657621 ?auto_657628 ) ) ( TRUCK-AT ?auto_657624 ?auto_657626 ) ( SURFACE-AT ?auto_657621 ?auto_657626 ) ( CLEAR ?auto_657621 ) ( IS-CRATE ?auto_657622 ) ( AVAILABLE ?auto_657629 ) ( IN ?auto_657622 ?auto_657624 ) ( ON ?auto_657616 ?auto_657615 ) ( ON ?auto_657617 ?auto_657616 ) ( ON ?auto_657614 ?auto_657617 ) ( ON ?auto_657618 ?auto_657614 ) ( ON ?auto_657620 ?auto_657618 ) ( ON ?auto_657619 ?auto_657620 ) ( ON ?auto_657621 ?auto_657619 ) ( not ( = ?auto_657615 ?auto_657616 ) ) ( not ( = ?auto_657615 ?auto_657617 ) ) ( not ( = ?auto_657615 ?auto_657614 ) ) ( not ( = ?auto_657615 ?auto_657618 ) ) ( not ( = ?auto_657615 ?auto_657620 ) ) ( not ( = ?auto_657615 ?auto_657619 ) ) ( not ( = ?auto_657615 ?auto_657621 ) ) ( not ( = ?auto_657615 ?auto_657622 ) ) ( not ( = ?auto_657615 ?auto_657623 ) ) ( not ( = ?auto_657615 ?auto_657628 ) ) ( not ( = ?auto_657616 ?auto_657617 ) ) ( not ( = ?auto_657616 ?auto_657614 ) ) ( not ( = ?auto_657616 ?auto_657618 ) ) ( not ( = ?auto_657616 ?auto_657620 ) ) ( not ( = ?auto_657616 ?auto_657619 ) ) ( not ( = ?auto_657616 ?auto_657621 ) ) ( not ( = ?auto_657616 ?auto_657622 ) ) ( not ( = ?auto_657616 ?auto_657623 ) ) ( not ( = ?auto_657616 ?auto_657628 ) ) ( not ( = ?auto_657617 ?auto_657614 ) ) ( not ( = ?auto_657617 ?auto_657618 ) ) ( not ( = ?auto_657617 ?auto_657620 ) ) ( not ( = ?auto_657617 ?auto_657619 ) ) ( not ( = ?auto_657617 ?auto_657621 ) ) ( not ( = ?auto_657617 ?auto_657622 ) ) ( not ( = ?auto_657617 ?auto_657623 ) ) ( not ( = ?auto_657617 ?auto_657628 ) ) ( not ( = ?auto_657614 ?auto_657618 ) ) ( not ( = ?auto_657614 ?auto_657620 ) ) ( not ( = ?auto_657614 ?auto_657619 ) ) ( not ( = ?auto_657614 ?auto_657621 ) ) ( not ( = ?auto_657614 ?auto_657622 ) ) ( not ( = ?auto_657614 ?auto_657623 ) ) ( not ( = ?auto_657614 ?auto_657628 ) ) ( not ( = ?auto_657618 ?auto_657620 ) ) ( not ( = ?auto_657618 ?auto_657619 ) ) ( not ( = ?auto_657618 ?auto_657621 ) ) ( not ( = ?auto_657618 ?auto_657622 ) ) ( not ( = ?auto_657618 ?auto_657623 ) ) ( not ( = ?auto_657618 ?auto_657628 ) ) ( not ( = ?auto_657620 ?auto_657619 ) ) ( not ( = ?auto_657620 ?auto_657621 ) ) ( not ( = ?auto_657620 ?auto_657622 ) ) ( not ( = ?auto_657620 ?auto_657623 ) ) ( not ( = ?auto_657620 ?auto_657628 ) ) ( not ( = ?auto_657619 ?auto_657621 ) ) ( not ( = ?auto_657619 ?auto_657622 ) ) ( not ( = ?auto_657619 ?auto_657623 ) ) ( not ( = ?auto_657619 ?auto_657628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657621 ?auto_657622 ?auto_657623 )
      ( MAKE-9CRATE-VERIFY ?auto_657615 ?auto_657616 ?auto_657617 ?auto_657614 ?auto_657618 ?auto_657620 ?auto_657619 ?auto_657621 ?auto_657622 ?auto_657623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_657630 - SURFACE
      ?auto_657631 - SURFACE
    )
    :vars
    (
      ?auto_657638 - HOIST
      ?auto_657635 - PLACE
      ?auto_657634 - SURFACE
      ?auto_657633 - PLACE
      ?auto_657636 - HOIST
      ?auto_657637 - SURFACE
      ?auto_657632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657638 ?auto_657635 ) ( IS-CRATE ?auto_657631 ) ( not ( = ?auto_657630 ?auto_657631 ) ) ( not ( = ?auto_657634 ?auto_657630 ) ) ( not ( = ?auto_657634 ?auto_657631 ) ) ( not ( = ?auto_657633 ?auto_657635 ) ) ( HOIST-AT ?auto_657636 ?auto_657633 ) ( not ( = ?auto_657638 ?auto_657636 ) ) ( AVAILABLE ?auto_657636 ) ( SURFACE-AT ?auto_657631 ?auto_657633 ) ( ON ?auto_657631 ?auto_657637 ) ( CLEAR ?auto_657631 ) ( not ( = ?auto_657630 ?auto_657637 ) ) ( not ( = ?auto_657631 ?auto_657637 ) ) ( not ( = ?auto_657634 ?auto_657637 ) ) ( SURFACE-AT ?auto_657634 ?auto_657635 ) ( CLEAR ?auto_657634 ) ( IS-CRATE ?auto_657630 ) ( AVAILABLE ?auto_657638 ) ( IN ?auto_657630 ?auto_657632 ) ( TRUCK-AT ?auto_657632 ?auto_657633 ) )
    :subtasks
    ( ( !DRIVE ?auto_657632 ?auto_657633 ?auto_657635 )
      ( MAKE-2CRATE ?auto_657634 ?auto_657630 ?auto_657631 )
      ( MAKE-1CRATE-VERIFY ?auto_657630 ?auto_657631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_657639 - SURFACE
      ?auto_657640 - SURFACE
      ?auto_657641 - SURFACE
    )
    :vars
    (
      ?auto_657644 - HOIST
      ?auto_657647 - PLACE
      ?auto_657642 - PLACE
      ?auto_657645 - HOIST
      ?auto_657643 - SURFACE
      ?auto_657646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657644 ?auto_657647 ) ( IS-CRATE ?auto_657641 ) ( not ( = ?auto_657640 ?auto_657641 ) ) ( not ( = ?auto_657639 ?auto_657640 ) ) ( not ( = ?auto_657639 ?auto_657641 ) ) ( not ( = ?auto_657642 ?auto_657647 ) ) ( HOIST-AT ?auto_657645 ?auto_657642 ) ( not ( = ?auto_657644 ?auto_657645 ) ) ( AVAILABLE ?auto_657645 ) ( SURFACE-AT ?auto_657641 ?auto_657642 ) ( ON ?auto_657641 ?auto_657643 ) ( CLEAR ?auto_657641 ) ( not ( = ?auto_657640 ?auto_657643 ) ) ( not ( = ?auto_657641 ?auto_657643 ) ) ( not ( = ?auto_657639 ?auto_657643 ) ) ( SURFACE-AT ?auto_657639 ?auto_657647 ) ( CLEAR ?auto_657639 ) ( IS-CRATE ?auto_657640 ) ( AVAILABLE ?auto_657644 ) ( IN ?auto_657640 ?auto_657646 ) ( TRUCK-AT ?auto_657646 ?auto_657642 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_657640 ?auto_657641 )
      ( MAKE-2CRATE-VERIFY ?auto_657639 ?auto_657640 ?auto_657641 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_657649 - SURFACE
      ?auto_657650 - SURFACE
      ?auto_657651 - SURFACE
      ?auto_657648 - SURFACE
    )
    :vars
    (
      ?auto_657653 - HOIST
      ?auto_657654 - PLACE
      ?auto_657656 - PLACE
      ?auto_657657 - HOIST
      ?auto_657652 - SURFACE
      ?auto_657655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657653 ?auto_657654 ) ( IS-CRATE ?auto_657648 ) ( not ( = ?auto_657651 ?auto_657648 ) ) ( not ( = ?auto_657650 ?auto_657651 ) ) ( not ( = ?auto_657650 ?auto_657648 ) ) ( not ( = ?auto_657656 ?auto_657654 ) ) ( HOIST-AT ?auto_657657 ?auto_657656 ) ( not ( = ?auto_657653 ?auto_657657 ) ) ( AVAILABLE ?auto_657657 ) ( SURFACE-AT ?auto_657648 ?auto_657656 ) ( ON ?auto_657648 ?auto_657652 ) ( CLEAR ?auto_657648 ) ( not ( = ?auto_657651 ?auto_657652 ) ) ( not ( = ?auto_657648 ?auto_657652 ) ) ( not ( = ?auto_657650 ?auto_657652 ) ) ( SURFACE-AT ?auto_657650 ?auto_657654 ) ( CLEAR ?auto_657650 ) ( IS-CRATE ?auto_657651 ) ( AVAILABLE ?auto_657653 ) ( IN ?auto_657651 ?auto_657655 ) ( TRUCK-AT ?auto_657655 ?auto_657656 ) ( ON ?auto_657650 ?auto_657649 ) ( not ( = ?auto_657649 ?auto_657650 ) ) ( not ( = ?auto_657649 ?auto_657651 ) ) ( not ( = ?auto_657649 ?auto_657648 ) ) ( not ( = ?auto_657649 ?auto_657652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657650 ?auto_657651 ?auto_657648 )
      ( MAKE-3CRATE-VERIFY ?auto_657649 ?auto_657650 ?auto_657651 ?auto_657648 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_657659 - SURFACE
      ?auto_657660 - SURFACE
      ?auto_657661 - SURFACE
      ?auto_657658 - SURFACE
      ?auto_657662 - SURFACE
    )
    :vars
    (
      ?auto_657664 - HOIST
      ?auto_657665 - PLACE
      ?auto_657667 - PLACE
      ?auto_657668 - HOIST
      ?auto_657663 - SURFACE
      ?auto_657666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657664 ?auto_657665 ) ( IS-CRATE ?auto_657662 ) ( not ( = ?auto_657658 ?auto_657662 ) ) ( not ( = ?auto_657661 ?auto_657658 ) ) ( not ( = ?auto_657661 ?auto_657662 ) ) ( not ( = ?auto_657667 ?auto_657665 ) ) ( HOIST-AT ?auto_657668 ?auto_657667 ) ( not ( = ?auto_657664 ?auto_657668 ) ) ( AVAILABLE ?auto_657668 ) ( SURFACE-AT ?auto_657662 ?auto_657667 ) ( ON ?auto_657662 ?auto_657663 ) ( CLEAR ?auto_657662 ) ( not ( = ?auto_657658 ?auto_657663 ) ) ( not ( = ?auto_657662 ?auto_657663 ) ) ( not ( = ?auto_657661 ?auto_657663 ) ) ( SURFACE-AT ?auto_657661 ?auto_657665 ) ( CLEAR ?auto_657661 ) ( IS-CRATE ?auto_657658 ) ( AVAILABLE ?auto_657664 ) ( IN ?auto_657658 ?auto_657666 ) ( TRUCK-AT ?auto_657666 ?auto_657667 ) ( ON ?auto_657660 ?auto_657659 ) ( ON ?auto_657661 ?auto_657660 ) ( not ( = ?auto_657659 ?auto_657660 ) ) ( not ( = ?auto_657659 ?auto_657661 ) ) ( not ( = ?auto_657659 ?auto_657658 ) ) ( not ( = ?auto_657659 ?auto_657662 ) ) ( not ( = ?auto_657659 ?auto_657663 ) ) ( not ( = ?auto_657660 ?auto_657661 ) ) ( not ( = ?auto_657660 ?auto_657658 ) ) ( not ( = ?auto_657660 ?auto_657662 ) ) ( not ( = ?auto_657660 ?auto_657663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657661 ?auto_657658 ?auto_657662 )
      ( MAKE-4CRATE-VERIFY ?auto_657659 ?auto_657660 ?auto_657661 ?auto_657658 ?auto_657662 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_657670 - SURFACE
      ?auto_657671 - SURFACE
      ?auto_657672 - SURFACE
      ?auto_657669 - SURFACE
      ?auto_657673 - SURFACE
      ?auto_657674 - SURFACE
    )
    :vars
    (
      ?auto_657676 - HOIST
      ?auto_657677 - PLACE
      ?auto_657679 - PLACE
      ?auto_657680 - HOIST
      ?auto_657675 - SURFACE
      ?auto_657678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657676 ?auto_657677 ) ( IS-CRATE ?auto_657674 ) ( not ( = ?auto_657673 ?auto_657674 ) ) ( not ( = ?auto_657669 ?auto_657673 ) ) ( not ( = ?auto_657669 ?auto_657674 ) ) ( not ( = ?auto_657679 ?auto_657677 ) ) ( HOIST-AT ?auto_657680 ?auto_657679 ) ( not ( = ?auto_657676 ?auto_657680 ) ) ( AVAILABLE ?auto_657680 ) ( SURFACE-AT ?auto_657674 ?auto_657679 ) ( ON ?auto_657674 ?auto_657675 ) ( CLEAR ?auto_657674 ) ( not ( = ?auto_657673 ?auto_657675 ) ) ( not ( = ?auto_657674 ?auto_657675 ) ) ( not ( = ?auto_657669 ?auto_657675 ) ) ( SURFACE-AT ?auto_657669 ?auto_657677 ) ( CLEAR ?auto_657669 ) ( IS-CRATE ?auto_657673 ) ( AVAILABLE ?auto_657676 ) ( IN ?auto_657673 ?auto_657678 ) ( TRUCK-AT ?auto_657678 ?auto_657679 ) ( ON ?auto_657671 ?auto_657670 ) ( ON ?auto_657672 ?auto_657671 ) ( ON ?auto_657669 ?auto_657672 ) ( not ( = ?auto_657670 ?auto_657671 ) ) ( not ( = ?auto_657670 ?auto_657672 ) ) ( not ( = ?auto_657670 ?auto_657669 ) ) ( not ( = ?auto_657670 ?auto_657673 ) ) ( not ( = ?auto_657670 ?auto_657674 ) ) ( not ( = ?auto_657670 ?auto_657675 ) ) ( not ( = ?auto_657671 ?auto_657672 ) ) ( not ( = ?auto_657671 ?auto_657669 ) ) ( not ( = ?auto_657671 ?auto_657673 ) ) ( not ( = ?auto_657671 ?auto_657674 ) ) ( not ( = ?auto_657671 ?auto_657675 ) ) ( not ( = ?auto_657672 ?auto_657669 ) ) ( not ( = ?auto_657672 ?auto_657673 ) ) ( not ( = ?auto_657672 ?auto_657674 ) ) ( not ( = ?auto_657672 ?auto_657675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657669 ?auto_657673 ?auto_657674 )
      ( MAKE-5CRATE-VERIFY ?auto_657670 ?auto_657671 ?auto_657672 ?auto_657669 ?auto_657673 ?auto_657674 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_657682 - SURFACE
      ?auto_657683 - SURFACE
      ?auto_657684 - SURFACE
      ?auto_657681 - SURFACE
      ?auto_657685 - SURFACE
      ?auto_657687 - SURFACE
      ?auto_657686 - SURFACE
    )
    :vars
    (
      ?auto_657689 - HOIST
      ?auto_657690 - PLACE
      ?auto_657692 - PLACE
      ?auto_657693 - HOIST
      ?auto_657688 - SURFACE
      ?auto_657691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657689 ?auto_657690 ) ( IS-CRATE ?auto_657686 ) ( not ( = ?auto_657687 ?auto_657686 ) ) ( not ( = ?auto_657685 ?auto_657687 ) ) ( not ( = ?auto_657685 ?auto_657686 ) ) ( not ( = ?auto_657692 ?auto_657690 ) ) ( HOIST-AT ?auto_657693 ?auto_657692 ) ( not ( = ?auto_657689 ?auto_657693 ) ) ( AVAILABLE ?auto_657693 ) ( SURFACE-AT ?auto_657686 ?auto_657692 ) ( ON ?auto_657686 ?auto_657688 ) ( CLEAR ?auto_657686 ) ( not ( = ?auto_657687 ?auto_657688 ) ) ( not ( = ?auto_657686 ?auto_657688 ) ) ( not ( = ?auto_657685 ?auto_657688 ) ) ( SURFACE-AT ?auto_657685 ?auto_657690 ) ( CLEAR ?auto_657685 ) ( IS-CRATE ?auto_657687 ) ( AVAILABLE ?auto_657689 ) ( IN ?auto_657687 ?auto_657691 ) ( TRUCK-AT ?auto_657691 ?auto_657692 ) ( ON ?auto_657683 ?auto_657682 ) ( ON ?auto_657684 ?auto_657683 ) ( ON ?auto_657681 ?auto_657684 ) ( ON ?auto_657685 ?auto_657681 ) ( not ( = ?auto_657682 ?auto_657683 ) ) ( not ( = ?auto_657682 ?auto_657684 ) ) ( not ( = ?auto_657682 ?auto_657681 ) ) ( not ( = ?auto_657682 ?auto_657685 ) ) ( not ( = ?auto_657682 ?auto_657687 ) ) ( not ( = ?auto_657682 ?auto_657686 ) ) ( not ( = ?auto_657682 ?auto_657688 ) ) ( not ( = ?auto_657683 ?auto_657684 ) ) ( not ( = ?auto_657683 ?auto_657681 ) ) ( not ( = ?auto_657683 ?auto_657685 ) ) ( not ( = ?auto_657683 ?auto_657687 ) ) ( not ( = ?auto_657683 ?auto_657686 ) ) ( not ( = ?auto_657683 ?auto_657688 ) ) ( not ( = ?auto_657684 ?auto_657681 ) ) ( not ( = ?auto_657684 ?auto_657685 ) ) ( not ( = ?auto_657684 ?auto_657687 ) ) ( not ( = ?auto_657684 ?auto_657686 ) ) ( not ( = ?auto_657684 ?auto_657688 ) ) ( not ( = ?auto_657681 ?auto_657685 ) ) ( not ( = ?auto_657681 ?auto_657687 ) ) ( not ( = ?auto_657681 ?auto_657686 ) ) ( not ( = ?auto_657681 ?auto_657688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657685 ?auto_657687 ?auto_657686 )
      ( MAKE-6CRATE-VERIFY ?auto_657682 ?auto_657683 ?auto_657684 ?auto_657681 ?auto_657685 ?auto_657687 ?auto_657686 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_657695 - SURFACE
      ?auto_657696 - SURFACE
      ?auto_657697 - SURFACE
      ?auto_657694 - SURFACE
      ?auto_657698 - SURFACE
      ?auto_657700 - SURFACE
      ?auto_657699 - SURFACE
      ?auto_657701 - SURFACE
    )
    :vars
    (
      ?auto_657703 - HOIST
      ?auto_657704 - PLACE
      ?auto_657706 - PLACE
      ?auto_657707 - HOIST
      ?auto_657702 - SURFACE
      ?auto_657705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657703 ?auto_657704 ) ( IS-CRATE ?auto_657701 ) ( not ( = ?auto_657699 ?auto_657701 ) ) ( not ( = ?auto_657700 ?auto_657699 ) ) ( not ( = ?auto_657700 ?auto_657701 ) ) ( not ( = ?auto_657706 ?auto_657704 ) ) ( HOIST-AT ?auto_657707 ?auto_657706 ) ( not ( = ?auto_657703 ?auto_657707 ) ) ( AVAILABLE ?auto_657707 ) ( SURFACE-AT ?auto_657701 ?auto_657706 ) ( ON ?auto_657701 ?auto_657702 ) ( CLEAR ?auto_657701 ) ( not ( = ?auto_657699 ?auto_657702 ) ) ( not ( = ?auto_657701 ?auto_657702 ) ) ( not ( = ?auto_657700 ?auto_657702 ) ) ( SURFACE-AT ?auto_657700 ?auto_657704 ) ( CLEAR ?auto_657700 ) ( IS-CRATE ?auto_657699 ) ( AVAILABLE ?auto_657703 ) ( IN ?auto_657699 ?auto_657705 ) ( TRUCK-AT ?auto_657705 ?auto_657706 ) ( ON ?auto_657696 ?auto_657695 ) ( ON ?auto_657697 ?auto_657696 ) ( ON ?auto_657694 ?auto_657697 ) ( ON ?auto_657698 ?auto_657694 ) ( ON ?auto_657700 ?auto_657698 ) ( not ( = ?auto_657695 ?auto_657696 ) ) ( not ( = ?auto_657695 ?auto_657697 ) ) ( not ( = ?auto_657695 ?auto_657694 ) ) ( not ( = ?auto_657695 ?auto_657698 ) ) ( not ( = ?auto_657695 ?auto_657700 ) ) ( not ( = ?auto_657695 ?auto_657699 ) ) ( not ( = ?auto_657695 ?auto_657701 ) ) ( not ( = ?auto_657695 ?auto_657702 ) ) ( not ( = ?auto_657696 ?auto_657697 ) ) ( not ( = ?auto_657696 ?auto_657694 ) ) ( not ( = ?auto_657696 ?auto_657698 ) ) ( not ( = ?auto_657696 ?auto_657700 ) ) ( not ( = ?auto_657696 ?auto_657699 ) ) ( not ( = ?auto_657696 ?auto_657701 ) ) ( not ( = ?auto_657696 ?auto_657702 ) ) ( not ( = ?auto_657697 ?auto_657694 ) ) ( not ( = ?auto_657697 ?auto_657698 ) ) ( not ( = ?auto_657697 ?auto_657700 ) ) ( not ( = ?auto_657697 ?auto_657699 ) ) ( not ( = ?auto_657697 ?auto_657701 ) ) ( not ( = ?auto_657697 ?auto_657702 ) ) ( not ( = ?auto_657694 ?auto_657698 ) ) ( not ( = ?auto_657694 ?auto_657700 ) ) ( not ( = ?auto_657694 ?auto_657699 ) ) ( not ( = ?auto_657694 ?auto_657701 ) ) ( not ( = ?auto_657694 ?auto_657702 ) ) ( not ( = ?auto_657698 ?auto_657700 ) ) ( not ( = ?auto_657698 ?auto_657699 ) ) ( not ( = ?auto_657698 ?auto_657701 ) ) ( not ( = ?auto_657698 ?auto_657702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657700 ?auto_657699 ?auto_657701 )
      ( MAKE-7CRATE-VERIFY ?auto_657695 ?auto_657696 ?auto_657697 ?auto_657694 ?auto_657698 ?auto_657700 ?auto_657699 ?auto_657701 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_657709 - SURFACE
      ?auto_657710 - SURFACE
      ?auto_657711 - SURFACE
      ?auto_657708 - SURFACE
      ?auto_657712 - SURFACE
      ?auto_657714 - SURFACE
      ?auto_657713 - SURFACE
      ?auto_657715 - SURFACE
      ?auto_657716 - SURFACE
    )
    :vars
    (
      ?auto_657718 - HOIST
      ?auto_657719 - PLACE
      ?auto_657721 - PLACE
      ?auto_657722 - HOIST
      ?auto_657717 - SURFACE
      ?auto_657720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657718 ?auto_657719 ) ( IS-CRATE ?auto_657716 ) ( not ( = ?auto_657715 ?auto_657716 ) ) ( not ( = ?auto_657713 ?auto_657715 ) ) ( not ( = ?auto_657713 ?auto_657716 ) ) ( not ( = ?auto_657721 ?auto_657719 ) ) ( HOIST-AT ?auto_657722 ?auto_657721 ) ( not ( = ?auto_657718 ?auto_657722 ) ) ( AVAILABLE ?auto_657722 ) ( SURFACE-AT ?auto_657716 ?auto_657721 ) ( ON ?auto_657716 ?auto_657717 ) ( CLEAR ?auto_657716 ) ( not ( = ?auto_657715 ?auto_657717 ) ) ( not ( = ?auto_657716 ?auto_657717 ) ) ( not ( = ?auto_657713 ?auto_657717 ) ) ( SURFACE-AT ?auto_657713 ?auto_657719 ) ( CLEAR ?auto_657713 ) ( IS-CRATE ?auto_657715 ) ( AVAILABLE ?auto_657718 ) ( IN ?auto_657715 ?auto_657720 ) ( TRUCK-AT ?auto_657720 ?auto_657721 ) ( ON ?auto_657710 ?auto_657709 ) ( ON ?auto_657711 ?auto_657710 ) ( ON ?auto_657708 ?auto_657711 ) ( ON ?auto_657712 ?auto_657708 ) ( ON ?auto_657714 ?auto_657712 ) ( ON ?auto_657713 ?auto_657714 ) ( not ( = ?auto_657709 ?auto_657710 ) ) ( not ( = ?auto_657709 ?auto_657711 ) ) ( not ( = ?auto_657709 ?auto_657708 ) ) ( not ( = ?auto_657709 ?auto_657712 ) ) ( not ( = ?auto_657709 ?auto_657714 ) ) ( not ( = ?auto_657709 ?auto_657713 ) ) ( not ( = ?auto_657709 ?auto_657715 ) ) ( not ( = ?auto_657709 ?auto_657716 ) ) ( not ( = ?auto_657709 ?auto_657717 ) ) ( not ( = ?auto_657710 ?auto_657711 ) ) ( not ( = ?auto_657710 ?auto_657708 ) ) ( not ( = ?auto_657710 ?auto_657712 ) ) ( not ( = ?auto_657710 ?auto_657714 ) ) ( not ( = ?auto_657710 ?auto_657713 ) ) ( not ( = ?auto_657710 ?auto_657715 ) ) ( not ( = ?auto_657710 ?auto_657716 ) ) ( not ( = ?auto_657710 ?auto_657717 ) ) ( not ( = ?auto_657711 ?auto_657708 ) ) ( not ( = ?auto_657711 ?auto_657712 ) ) ( not ( = ?auto_657711 ?auto_657714 ) ) ( not ( = ?auto_657711 ?auto_657713 ) ) ( not ( = ?auto_657711 ?auto_657715 ) ) ( not ( = ?auto_657711 ?auto_657716 ) ) ( not ( = ?auto_657711 ?auto_657717 ) ) ( not ( = ?auto_657708 ?auto_657712 ) ) ( not ( = ?auto_657708 ?auto_657714 ) ) ( not ( = ?auto_657708 ?auto_657713 ) ) ( not ( = ?auto_657708 ?auto_657715 ) ) ( not ( = ?auto_657708 ?auto_657716 ) ) ( not ( = ?auto_657708 ?auto_657717 ) ) ( not ( = ?auto_657712 ?auto_657714 ) ) ( not ( = ?auto_657712 ?auto_657713 ) ) ( not ( = ?auto_657712 ?auto_657715 ) ) ( not ( = ?auto_657712 ?auto_657716 ) ) ( not ( = ?auto_657712 ?auto_657717 ) ) ( not ( = ?auto_657714 ?auto_657713 ) ) ( not ( = ?auto_657714 ?auto_657715 ) ) ( not ( = ?auto_657714 ?auto_657716 ) ) ( not ( = ?auto_657714 ?auto_657717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657713 ?auto_657715 ?auto_657716 )
      ( MAKE-8CRATE-VERIFY ?auto_657709 ?auto_657710 ?auto_657711 ?auto_657708 ?auto_657712 ?auto_657714 ?auto_657713 ?auto_657715 ?auto_657716 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657724 - SURFACE
      ?auto_657725 - SURFACE
      ?auto_657726 - SURFACE
      ?auto_657723 - SURFACE
      ?auto_657727 - SURFACE
      ?auto_657729 - SURFACE
      ?auto_657728 - SURFACE
      ?auto_657730 - SURFACE
      ?auto_657731 - SURFACE
      ?auto_657732 - SURFACE
    )
    :vars
    (
      ?auto_657734 - HOIST
      ?auto_657735 - PLACE
      ?auto_657737 - PLACE
      ?auto_657738 - HOIST
      ?auto_657733 - SURFACE
      ?auto_657736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657734 ?auto_657735 ) ( IS-CRATE ?auto_657732 ) ( not ( = ?auto_657731 ?auto_657732 ) ) ( not ( = ?auto_657730 ?auto_657731 ) ) ( not ( = ?auto_657730 ?auto_657732 ) ) ( not ( = ?auto_657737 ?auto_657735 ) ) ( HOIST-AT ?auto_657738 ?auto_657737 ) ( not ( = ?auto_657734 ?auto_657738 ) ) ( AVAILABLE ?auto_657738 ) ( SURFACE-AT ?auto_657732 ?auto_657737 ) ( ON ?auto_657732 ?auto_657733 ) ( CLEAR ?auto_657732 ) ( not ( = ?auto_657731 ?auto_657733 ) ) ( not ( = ?auto_657732 ?auto_657733 ) ) ( not ( = ?auto_657730 ?auto_657733 ) ) ( SURFACE-AT ?auto_657730 ?auto_657735 ) ( CLEAR ?auto_657730 ) ( IS-CRATE ?auto_657731 ) ( AVAILABLE ?auto_657734 ) ( IN ?auto_657731 ?auto_657736 ) ( TRUCK-AT ?auto_657736 ?auto_657737 ) ( ON ?auto_657725 ?auto_657724 ) ( ON ?auto_657726 ?auto_657725 ) ( ON ?auto_657723 ?auto_657726 ) ( ON ?auto_657727 ?auto_657723 ) ( ON ?auto_657729 ?auto_657727 ) ( ON ?auto_657728 ?auto_657729 ) ( ON ?auto_657730 ?auto_657728 ) ( not ( = ?auto_657724 ?auto_657725 ) ) ( not ( = ?auto_657724 ?auto_657726 ) ) ( not ( = ?auto_657724 ?auto_657723 ) ) ( not ( = ?auto_657724 ?auto_657727 ) ) ( not ( = ?auto_657724 ?auto_657729 ) ) ( not ( = ?auto_657724 ?auto_657728 ) ) ( not ( = ?auto_657724 ?auto_657730 ) ) ( not ( = ?auto_657724 ?auto_657731 ) ) ( not ( = ?auto_657724 ?auto_657732 ) ) ( not ( = ?auto_657724 ?auto_657733 ) ) ( not ( = ?auto_657725 ?auto_657726 ) ) ( not ( = ?auto_657725 ?auto_657723 ) ) ( not ( = ?auto_657725 ?auto_657727 ) ) ( not ( = ?auto_657725 ?auto_657729 ) ) ( not ( = ?auto_657725 ?auto_657728 ) ) ( not ( = ?auto_657725 ?auto_657730 ) ) ( not ( = ?auto_657725 ?auto_657731 ) ) ( not ( = ?auto_657725 ?auto_657732 ) ) ( not ( = ?auto_657725 ?auto_657733 ) ) ( not ( = ?auto_657726 ?auto_657723 ) ) ( not ( = ?auto_657726 ?auto_657727 ) ) ( not ( = ?auto_657726 ?auto_657729 ) ) ( not ( = ?auto_657726 ?auto_657728 ) ) ( not ( = ?auto_657726 ?auto_657730 ) ) ( not ( = ?auto_657726 ?auto_657731 ) ) ( not ( = ?auto_657726 ?auto_657732 ) ) ( not ( = ?auto_657726 ?auto_657733 ) ) ( not ( = ?auto_657723 ?auto_657727 ) ) ( not ( = ?auto_657723 ?auto_657729 ) ) ( not ( = ?auto_657723 ?auto_657728 ) ) ( not ( = ?auto_657723 ?auto_657730 ) ) ( not ( = ?auto_657723 ?auto_657731 ) ) ( not ( = ?auto_657723 ?auto_657732 ) ) ( not ( = ?auto_657723 ?auto_657733 ) ) ( not ( = ?auto_657727 ?auto_657729 ) ) ( not ( = ?auto_657727 ?auto_657728 ) ) ( not ( = ?auto_657727 ?auto_657730 ) ) ( not ( = ?auto_657727 ?auto_657731 ) ) ( not ( = ?auto_657727 ?auto_657732 ) ) ( not ( = ?auto_657727 ?auto_657733 ) ) ( not ( = ?auto_657729 ?auto_657728 ) ) ( not ( = ?auto_657729 ?auto_657730 ) ) ( not ( = ?auto_657729 ?auto_657731 ) ) ( not ( = ?auto_657729 ?auto_657732 ) ) ( not ( = ?auto_657729 ?auto_657733 ) ) ( not ( = ?auto_657728 ?auto_657730 ) ) ( not ( = ?auto_657728 ?auto_657731 ) ) ( not ( = ?auto_657728 ?auto_657732 ) ) ( not ( = ?auto_657728 ?auto_657733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657730 ?auto_657731 ?auto_657732 )
      ( MAKE-9CRATE-VERIFY ?auto_657724 ?auto_657725 ?auto_657726 ?auto_657723 ?auto_657727 ?auto_657729 ?auto_657728 ?auto_657730 ?auto_657731 ?auto_657732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_657739 - SURFACE
      ?auto_657740 - SURFACE
    )
    :vars
    (
      ?auto_657743 - HOIST
      ?auto_657744 - PLACE
      ?auto_657741 - SURFACE
      ?auto_657746 - PLACE
      ?auto_657747 - HOIST
      ?auto_657742 - SURFACE
      ?auto_657745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657743 ?auto_657744 ) ( IS-CRATE ?auto_657740 ) ( not ( = ?auto_657739 ?auto_657740 ) ) ( not ( = ?auto_657741 ?auto_657739 ) ) ( not ( = ?auto_657741 ?auto_657740 ) ) ( not ( = ?auto_657746 ?auto_657744 ) ) ( HOIST-AT ?auto_657747 ?auto_657746 ) ( not ( = ?auto_657743 ?auto_657747 ) ) ( SURFACE-AT ?auto_657740 ?auto_657746 ) ( ON ?auto_657740 ?auto_657742 ) ( CLEAR ?auto_657740 ) ( not ( = ?auto_657739 ?auto_657742 ) ) ( not ( = ?auto_657740 ?auto_657742 ) ) ( not ( = ?auto_657741 ?auto_657742 ) ) ( SURFACE-AT ?auto_657741 ?auto_657744 ) ( CLEAR ?auto_657741 ) ( IS-CRATE ?auto_657739 ) ( AVAILABLE ?auto_657743 ) ( TRUCK-AT ?auto_657745 ?auto_657746 ) ( LIFTING ?auto_657747 ?auto_657739 ) )
    :subtasks
    ( ( !LOAD ?auto_657747 ?auto_657739 ?auto_657745 ?auto_657746 )
      ( MAKE-2CRATE ?auto_657741 ?auto_657739 ?auto_657740 )
      ( MAKE-1CRATE-VERIFY ?auto_657739 ?auto_657740 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_657748 - SURFACE
      ?auto_657749 - SURFACE
      ?auto_657750 - SURFACE
    )
    :vars
    (
      ?auto_657753 - HOIST
      ?auto_657755 - PLACE
      ?auto_657756 - PLACE
      ?auto_657754 - HOIST
      ?auto_657752 - SURFACE
      ?auto_657751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657753 ?auto_657755 ) ( IS-CRATE ?auto_657750 ) ( not ( = ?auto_657749 ?auto_657750 ) ) ( not ( = ?auto_657748 ?auto_657749 ) ) ( not ( = ?auto_657748 ?auto_657750 ) ) ( not ( = ?auto_657756 ?auto_657755 ) ) ( HOIST-AT ?auto_657754 ?auto_657756 ) ( not ( = ?auto_657753 ?auto_657754 ) ) ( SURFACE-AT ?auto_657750 ?auto_657756 ) ( ON ?auto_657750 ?auto_657752 ) ( CLEAR ?auto_657750 ) ( not ( = ?auto_657749 ?auto_657752 ) ) ( not ( = ?auto_657750 ?auto_657752 ) ) ( not ( = ?auto_657748 ?auto_657752 ) ) ( SURFACE-AT ?auto_657748 ?auto_657755 ) ( CLEAR ?auto_657748 ) ( IS-CRATE ?auto_657749 ) ( AVAILABLE ?auto_657753 ) ( TRUCK-AT ?auto_657751 ?auto_657756 ) ( LIFTING ?auto_657754 ?auto_657749 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_657749 ?auto_657750 )
      ( MAKE-2CRATE-VERIFY ?auto_657748 ?auto_657749 ?auto_657750 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_657758 - SURFACE
      ?auto_657759 - SURFACE
      ?auto_657760 - SURFACE
      ?auto_657757 - SURFACE
    )
    :vars
    (
      ?auto_657761 - HOIST
      ?auto_657763 - PLACE
      ?auto_657762 - PLACE
      ?auto_657766 - HOIST
      ?auto_657764 - SURFACE
      ?auto_657765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657761 ?auto_657763 ) ( IS-CRATE ?auto_657757 ) ( not ( = ?auto_657760 ?auto_657757 ) ) ( not ( = ?auto_657759 ?auto_657760 ) ) ( not ( = ?auto_657759 ?auto_657757 ) ) ( not ( = ?auto_657762 ?auto_657763 ) ) ( HOIST-AT ?auto_657766 ?auto_657762 ) ( not ( = ?auto_657761 ?auto_657766 ) ) ( SURFACE-AT ?auto_657757 ?auto_657762 ) ( ON ?auto_657757 ?auto_657764 ) ( CLEAR ?auto_657757 ) ( not ( = ?auto_657760 ?auto_657764 ) ) ( not ( = ?auto_657757 ?auto_657764 ) ) ( not ( = ?auto_657759 ?auto_657764 ) ) ( SURFACE-AT ?auto_657759 ?auto_657763 ) ( CLEAR ?auto_657759 ) ( IS-CRATE ?auto_657760 ) ( AVAILABLE ?auto_657761 ) ( TRUCK-AT ?auto_657765 ?auto_657762 ) ( LIFTING ?auto_657766 ?auto_657760 ) ( ON ?auto_657759 ?auto_657758 ) ( not ( = ?auto_657758 ?auto_657759 ) ) ( not ( = ?auto_657758 ?auto_657760 ) ) ( not ( = ?auto_657758 ?auto_657757 ) ) ( not ( = ?auto_657758 ?auto_657764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657759 ?auto_657760 ?auto_657757 )
      ( MAKE-3CRATE-VERIFY ?auto_657758 ?auto_657759 ?auto_657760 ?auto_657757 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_657768 - SURFACE
      ?auto_657769 - SURFACE
      ?auto_657770 - SURFACE
      ?auto_657767 - SURFACE
      ?auto_657771 - SURFACE
    )
    :vars
    (
      ?auto_657772 - HOIST
      ?auto_657774 - PLACE
      ?auto_657773 - PLACE
      ?auto_657777 - HOIST
      ?auto_657775 - SURFACE
      ?auto_657776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657772 ?auto_657774 ) ( IS-CRATE ?auto_657771 ) ( not ( = ?auto_657767 ?auto_657771 ) ) ( not ( = ?auto_657770 ?auto_657767 ) ) ( not ( = ?auto_657770 ?auto_657771 ) ) ( not ( = ?auto_657773 ?auto_657774 ) ) ( HOIST-AT ?auto_657777 ?auto_657773 ) ( not ( = ?auto_657772 ?auto_657777 ) ) ( SURFACE-AT ?auto_657771 ?auto_657773 ) ( ON ?auto_657771 ?auto_657775 ) ( CLEAR ?auto_657771 ) ( not ( = ?auto_657767 ?auto_657775 ) ) ( not ( = ?auto_657771 ?auto_657775 ) ) ( not ( = ?auto_657770 ?auto_657775 ) ) ( SURFACE-AT ?auto_657770 ?auto_657774 ) ( CLEAR ?auto_657770 ) ( IS-CRATE ?auto_657767 ) ( AVAILABLE ?auto_657772 ) ( TRUCK-AT ?auto_657776 ?auto_657773 ) ( LIFTING ?auto_657777 ?auto_657767 ) ( ON ?auto_657769 ?auto_657768 ) ( ON ?auto_657770 ?auto_657769 ) ( not ( = ?auto_657768 ?auto_657769 ) ) ( not ( = ?auto_657768 ?auto_657770 ) ) ( not ( = ?auto_657768 ?auto_657767 ) ) ( not ( = ?auto_657768 ?auto_657771 ) ) ( not ( = ?auto_657768 ?auto_657775 ) ) ( not ( = ?auto_657769 ?auto_657770 ) ) ( not ( = ?auto_657769 ?auto_657767 ) ) ( not ( = ?auto_657769 ?auto_657771 ) ) ( not ( = ?auto_657769 ?auto_657775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657770 ?auto_657767 ?auto_657771 )
      ( MAKE-4CRATE-VERIFY ?auto_657768 ?auto_657769 ?auto_657770 ?auto_657767 ?auto_657771 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_657779 - SURFACE
      ?auto_657780 - SURFACE
      ?auto_657781 - SURFACE
      ?auto_657778 - SURFACE
      ?auto_657782 - SURFACE
      ?auto_657783 - SURFACE
    )
    :vars
    (
      ?auto_657784 - HOIST
      ?auto_657786 - PLACE
      ?auto_657785 - PLACE
      ?auto_657789 - HOIST
      ?auto_657787 - SURFACE
      ?auto_657788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657784 ?auto_657786 ) ( IS-CRATE ?auto_657783 ) ( not ( = ?auto_657782 ?auto_657783 ) ) ( not ( = ?auto_657778 ?auto_657782 ) ) ( not ( = ?auto_657778 ?auto_657783 ) ) ( not ( = ?auto_657785 ?auto_657786 ) ) ( HOIST-AT ?auto_657789 ?auto_657785 ) ( not ( = ?auto_657784 ?auto_657789 ) ) ( SURFACE-AT ?auto_657783 ?auto_657785 ) ( ON ?auto_657783 ?auto_657787 ) ( CLEAR ?auto_657783 ) ( not ( = ?auto_657782 ?auto_657787 ) ) ( not ( = ?auto_657783 ?auto_657787 ) ) ( not ( = ?auto_657778 ?auto_657787 ) ) ( SURFACE-AT ?auto_657778 ?auto_657786 ) ( CLEAR ?auto_657778 ) ( IS-CRATE ?auto_657782 ) ( AVAILABLE ?auto_657784 ) ( TRUCK-AT ?auto_657788 ?auto_657785 ) ( LIFTING ?auto_657789 ?auto_657782 ) ( ON ?auto_657780 ?auto_657779 ) ( ON ?auto_657781 ?auto_657780 ) ( ON ?auto_657778 ?auto_657781 ) ( not ( = ?auto_657779 ?auto_657780 ) ) ( not ( = ?auto_657779 ?auto_657781 ) ) ( not ( = ?auto_657779 ?auto_657778 ) ) ( not ( = ?auto_657779 ?auto_657782 ) ) ( not ( = ?auto_657779 ?auto_657783 ) ) ( not ( = ?auto_657779 ?auto_657787 ) ) ( not ( = ?auto_657780 ?auto_657781 ) ) ( not ( = ?auto_657780 ?auto_657778 ) ) ( not ( = ?auto_657780 ?auto_657782 ) ) ( not ( = ?auto_657780 ?auto_657783 ) ) ( not ( = ?auto_657780 ?auto_657787 ) ) ( not ( = ?auto_657781 ?auto_657778 ) ) ( not ( = ?auto_657781 ?auto_657782 ) ) ( not ( = ?auto_657781 ?auto_657783 ) ) ( not ( = ?auto_657781 ?auto_657787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657778 ?auto_657782 ?auto_657783 )
      ( MAKE-5CRATE-VERIFY ?auto_657779 ?auto_657780 ?auto_657781 ?auto_657778 ?auto_657782 ?auto_657783 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_657791 - SURFACE
      ?auto_657792 - SURFACE
      ?auto_657793 - SURFACE
      ?auto_657790 - SURFACE
      ?auto_657794 - SURFACE
      ?auto_657796 - SURFACE
      ?auto_657795 - SURFACE
    )
    :vars
    (
      ?auto_657797 - HOIST
      ?auto_657799 - PLACE
      ?auto_657798 - PLACE
      ?auto_657802 - HOIST
      ?auto_657800 - SURFACE
      ?auto_657801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657797 ?auto_657799 ) ( IS-CRATE ?auto_657795 ) ( not ( = ?auto_657796 ?auto_657795 ) ) ( not ( = ?auto_657794 ?auto_657796 ) ) ( not ( = ?auto_657794 ?auto_657795 ) ) ( not ( = ?auto_657798 ?auto_657799 ) ) ( HOIST-AT ?auto_657802 ?auto_657798 ) ( not ( = ?auto_657797 ?auto_657802 ) ) ( SURFACE-AT ?auto_657795 ?auto_657798 ) ( ON ?auto_657795 ?auto_657800 ) ( CLEAR ?auto_657795 ) ( not ( = ?auto_657796 ?auto_657800 ) ) ( not ( = ?auto_657795 ?auto_657800 ) ) ( not ( = ?auto_657794 ?auto_657800 ) ) ( SURFACE-AT ?auto_657794 ?auto_657799 ) ( CLEAR ?auto_657794 ) ( IS-CRATE ?auto_657796 ) ( AVAILABLE ?auto_657797 ) ( TRUCK-AT ?auto_657801 ?auto_657798 ) ( LIFTING ?auto_657802 ?auto_657796 ) ( ON ?auto_657792 ?auto_657791 ) ( ON ?auto_657793 ?auto_657792 ) ( ON ?auto_657790 ?auto_657793 ) ( ON ?auto_657794 ?auto_657790 ) ( not ( = ?auto_657791 ?auto_657792 ) ) ( not ( = ?auto_657791 ?auto_657793 ) ) ( not ( = ?auto_657791 ?auto_657790 ) ) ( not ( = ?auto_657791 ?auto_657794 ) ) ( not ( = ?auto_657791 ?auto_657796 ) ) ( not ( = ?auto_657791 ?auto_657795 ) ) ( not ( = ?auto_657791 ?auto_657800 ) ) ( not ( = ?auto_657792 ?auto_657793 ) ) ( not ( = ?auto_657792 ?auto_657790 ) ) ( not ( = ?auto_657792 ?auto_657794 ) ) ( not ( = ?auto_657792 ?auto_657796 ) ) ( not ( = ?auto_657792 ?auto_657795 ) ) ( not ( = ?auto_657792 ?auto_657800 ) ) ( not ( = ?auto_657793 ?auto_657790 ) ) ( not ( = ?auto_657793 ?auto_657794 ) ) ( not ( = ?auto_657793 ?auto_657796 ) ) ( not ( = ?auto_657793 ?auto_657795 ) ) ( not ( = ?auto_657793 ?auto_657800 ) ) ( not ( = ?auto_657790 ?auto_657794 ) ) ( not ( = ?auto_657790 ?auto_657796 ) ) ( not ( = ?auto_657790 ?auto_657795 ) ) ( not ( = ?auto_657790 ?auto_657800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657794 ?auto_657796 ?auto_657795 )
      ( MAKE-6CRATE-VERIFY ?auto_657791 ?auto_657792 ?auto_657793 ?auto_657790 ?auto_657794 ?auto_657796 ?auto_657795 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_657804 - SURFACE
      ?auto_657805 - SURFACE
      ?auto_657806 - SURFACE
      ?auto_657803 - SURFACE
      ?auto_657807 - SURFACE
      ?auto_657809 - SURFACE
      ?auto_657808 - SURFACE
      ?auto_657810 - SURFACE
    )
    :vars
    (
      ?auto_657811 - HOIST
      ?auto_657813 - PLACE
      ?auto_657812 - PLACE
      ?auto_657816 - HOIST
      ?auto_657814 - SURFACE
      ?auto_657815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657811 ?auto_657813 ) ( IS-CRATE ?auto_657810 ) ( not ( = ?auto_657808 ?auto_657810 ) ) ( not ( = ?auto_657809 ?auto_657808 ) ) ( not ( = ?auto_657809 ?auto_657810 ) ) ( not ( = ?auto_657812 ?auto_657813 ) ) ( HOIST-AT ?auto_657816 ?auto_657812 ) ( not ( = ?auto_657811 ?auto_657816 ) ) ( SURFACE-AT ?auto_657810 ?auto_657812 ) ( ON ?auto_657810 ?auto_657814 ) ( CLEAR ?auto_657810 ) ( not ( = ?auto_657808 ?auto_657814 ) ) ( not ( = ?auto_657810 ?auto_657814 ) ) ( not ( = ?auto_657809 ?auto_657814 ) ) ( SURFACE-AT ?auto_657809 ?auto_657813 ) ( CLEAR ?auto_657809 ) ( IS-CRATE ?auto_657808 ) ( AVAILABLE ?auto_657811 ) ( TRUCK-AT ?auto_657815 ?auto_657812 ) ( LIFTING ?auto_657816 ?auto_657808 ) ( ON ?auto_657805 ?auto_657804 ) ( ON ?auto_657806 ?auto_657805 ) ( ON ?auto_657803 ?auto_657806 ) ( ON ?auto_657807 ?auto_657803 ) ( ON ?auto_657809 ?auto_657807 ) ( not ( = ?auto_657804 ?auto_657805 ) ) ( not ( = ?auto_657804 ?auto_657806 ) ) ( not ( = ?auto_657804 ?auto_657803 ) ) ( not ( = ?auto_657804 ?auto_657807 ) ) ( not ( = ?auto_657804 ?auto_657809 ) ) ( not ( = ?auto_657804 ?auto_657808 ) ) ( not ( = ?auto_657804 ?auto_657810 ) ) ( not ( = ?auto_657804 ?auto_657814 ) ) ( not ( = ?auto_657805 ?auto_657806 ) ) ( not ( = ?auto_657805 ?auto_657803 ) ) ( not ( = ?auto_657805 ?auto_657807 ) ) ( not ( = ?auto_657805 ?auto_657809 ) ) ( not ( = ?auto_657805 ?auto_657808 ) ) ( not ( = ?auto_657805 ?auto_657810 ) ) ( not ( = ?auto_657805 ?auto_657814 ) ) ( not ( = ?auto_657806 ?auto_657803 ) ) ( not ( = ?auto_657806 ?auto_657807 ) ) ( not ( = ?auto_657806 ?auto_657809 ) ) ( not ( = ?auto_657806 ?auto_657808 ) ) ( not ( = ?auto_657806 ?auto_657810 ) ) ( not ( = ?auto_657806 ?auto_657814 ) ) ( not ( = ?auto_657803 ?auto_657807 ) ) ( not ( = ?auto_657803 ?auto_657809 ) ) ( not ( = ?auto_657803 ?auto_657808 ) ) ( not ( = ?auto_657803 ?auto_657810 ) ) ( not ( = ?auto_657803 ?auto_657814 ) ) ( not ( = ?auto_657807 ?auto_657809 ) ) ( not ( = ?auto_657807 ?auto_657808 ) ) ( not ( = ?auto_657807 ?auto_657810 ) ) ( not ( = ?auto_657807 ?auto_657814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657809 ?auto_657808 ?auto_657810 )
      ( MAKE-7CRATE-VERIFY ?auto_657804 ?auto_657805 ?auto_657806 ?auto_657803 ?auto_657807 ?auto_657809 ?auto_657808 ?auto_657810 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_657818 - SURFACE
      ?auto_657819 - SURFACE
      ?auto_657820 - SURFACE
      ?auto_657817 - SURFACE
      ?auto_657821 - SURFACE
      ?auto_657823 - SURFACE
      ?auto_657822 - SURFACE
      ?auto_657824 - SURFACE
      ?auto_657825 - SURFACE
    )
    :vars
    (
      ?auto_657826 - HOIST
      ?auto_657828 - PLACE
      ?auto_657827 - PLACE
      ?auto_657831 - HOIST
      ?auto_657829 - SURFACE
      ?auto_657830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657826 ?auto_657828 ) ( IS-CRATE ?auto_657825 ) ( not ( = ?auto_657824 ?auto_657825 ) ) ( not ( = ?auto_657822 ?auto_657824 ) ) ( not ( = ?auto_657822 ?auto_657825 ) ) ( not ( = ?auto_657827 ?auto_657828 ) ) ( HOIST-AT ?auto_657831 ?auto_657827 ) ( not ( = ?auto_657826 ?auto_657831 ) ) ( SURFACE-AT ?auto_657825 ?auto_657827 ) ( ON ?auto_657825 ?auto_657829 ) ( CLEAR ?auto_657825 ) ( not ( = ?auto_657824 ?auto_657829 ) ) ( not ( = ?auto_657825 ?auto_657829 ) ) ( not ( = ?auto_657822 ?auto_657829 ) ) ( SURFACE-AT ?auto_657822 ?auto_657828 ) ( CLEAR ?auto_657822 ) ( IS-CRATE ?auto_657824 ) ( AVAILABLE ?auto_657826 ) ( TRUCK-AT ?auto_657830 ?auto_657827 ) ( LIFTING ?auto_657831 ?auto_657824 ) ( ON ?auto_657819 ?auto_657818 ) ( ON ?auto_657820 ?auto_657819 ) ( ON ?auto_657817 ?auto_657820 ) ( ON ?auto_657821 ?auto_657817 ) ( ON ?auto_657823 ?auto_657821 ) ( ON ?auto_657822 ?auto_657823 ) ( not ( = ?auto_657818 ?auto_657819 ) ) ( not ( = ?auto_657818 ?auto_657820 ) ) ( not ( = ?auto_657818 ?auto_657817 ) ) ( not ( = ?auto_657818 ?auto_657821 ) ) ( not ( = ?auto_657818 ?auto_657823 ) ) ( not ( = ?auto_657818 ?auto_657822 ) ) ( not ( = ?auto_657818 ?auto_657824 ) ) ( not ( = ?auto_657818 ?auto_657825 ) ) ( not ( = ?auto_657818 ?auto_657829 ) ) ( not ( = ?auto_657819 ?auto_657820 ) ) ( not ( = ?auto_657819 ?auto_657817 ) ) ( not ( = ?auto_657819 ?auto_657821 ) ) ( not ( = ?auto_657819 ?auto_657823 ) ) ( not ( = ?auto_657819 ?auto_657822 ) ) ( not ( = ?auto_657819 ?auto_657824 ) ) ( not ( = ?auto_657819 ?auto_657825 ) ) ( not ( = ?auto_657819 ?auto_657829 ) ) ( not ( = ?auto_657820 ?auto_657817 ) ) ( not ( = ?auto_657820 ?auto_657821 ) ) ( not ( = ?auto_657820 ?auto_657823 ) ) ( not ( = ?auto_657820 ?auto_657822 ) ) ( not ( = ?auto_657820 ?auto_657824 ) ) ( not ( = ?auto_657820 ?auto_657825 ) ) ( not ( = ?auto_657820 ?auto_657829 ) ) ( not ( = ?auto_657817 ?auto_657821 ) ) ( not ( = ?auto_657817 ?auto_657823 ) ) ( not ( = ?auto_657817 ?auto_657822 ) ) ( not ( = ?auto_657817 ?auto_657824 ) ) ( not ( = ?auto_657817 ?auto_657825 ) ) ( not ( = ?auto_657817 ?auto_657829 ) ) ( not ( = ?auto_657821 ?auto_657823 ) ) ( not ( = ?auto_657821 ?auto_657822 ) ) ( not ( = ?auto_657821 ?auto_657824 ) ) ( not ( = ?auto_657821 ?auto_657825 ) ) ( not ( = ?auto_657821 ?auto_657829 ) ) ( not ( = ?auto_657823 ?auto_657822 ) ) ( not ( = ?auto_657823 ?auto_657824 ) ) ( not ( = ?auto_657823 ?auto_657825 ) ) ( not ( = ?auto_657823 ?auto_657829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657822 ?auto_657824 ?auto_657825 )
      ( MAKE-8CRATE-VERIFY ?auto_657818 ?auto_657819 ?auto_657820 ?auto_657817 ?auto_657821 ?auto_657823 ?auto_657822 ?auto_657824 ?auto_657825 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657833 - SURFACE
      ?auto_657834 - SURFACE
      ?auto_657835 - SURFACE
      ?auto_657832 - SURFACE
      ?auto_657836 - SURFACE
      ?auto_657838 - SURFACE
      ?auto_657837 - SURFACE
      ?auto_657839 - SURFACE
      ?auto_657840 - SURFACE
      ?auto_657841 - SURFACE
    )
    :vars
    (
      ?auto_657842 - HOIST
      ?auto_657844 - PLACE
      ?auto_657843 - PLACE
      ?auto_657847 - HOIST
      ?auto_657845 - SURFACE
      ?auto_657846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657842 ?auto_657844 ) ( IS-CRATE ?auto_657841 ) ( not ( = ?auto_657840 ?auto_657841 ) ) ( not ( = ?auto_657839 ?auto_657840 ) ) ( not ( = ?auto_657839 ?auto_657841 ) ) ( not ( = ?auto_657843 ?auto_657844 ) ) ( HOIST-AT ?auto_657847 ?auto_657843 ) ( not ( = ?auto_657842 ?auto_657847 ) ) ( SURFACE-AT ?auto_657841 ?auto_657843 ) ( ON ?auto_657841 ?auto_657845 ) ( CLEAR ?auto_657841 ) ( not ( = ?auto_657840 ?auto_657845 ) ) ( not ( = ?auto_657841 ?auto_657845 ) ) ( not ( = ?auto_657839 ?auto_657845 ) ) ( SURFACE-AT ?auto_657839 ?auto_657844 ) ( CLEAR ?auto_657839 ) ( IS-CRATE ?auto_657840 ) ( AVAILABLE ?auto_657842 ) ( TRUCK-AT ?auto_657846 ?auto_657843 ) ( LIFTING ?auto_657847 ?auto_657840 ) ( ON ?auto_657834 ?auto_657833 ) ( ON ?auto_657835 ?auto_657834 ) ( ON ?auto_657832 ?auto_657835 ) ( ON ?auto_657836 ?auto_657832 ) ( ON ?auto_657838 ?auto_657836 ) ( ON ?auto_657837 ?auto_657838 ) ( ON ?auto_657839 ?auto_657837 ) ( not ( = ?auto_657833 ?auto_657834 ) ) ( not ( = ?auto_657833 ?auto_657835 ) ) ( not ( = ?auto_657833 ?auto_657832 ) ) ( not ( = ?auto_657833 ?auto_657836 ) ) ( not ( = ?auto_657833 ?auto_657838 ) ) ( not ( = ?auto_657833 ?auto_657837 ) ) ( not ( = ?auto_657833 ?auto_657839 ) ) ( not ( = ?auto_657833 ?auto_657840 ) ) ( not ( = ?auto_657833 ?auto_657841 ) ) ( not ( = ?auto_657833 ?auto_657845 ) ) ( not ( = ?auto_657834 ?auto_657835 ) ) ( not ( = ?auto_657834 ?auto_657832 ) ) ( not ( = ?auto_657834 ?auto_657836 ) ) ( not ( = ?auto_657834 ?auto_657838 ) ) ( not ( = ?auto_657834 ?auto_657837 ) ) ( not ( = ?auto_657834 ?auto_657839 ) ) ( not ( = ?auto_657834 ?auto_657840 ) ) ( not ( = ?auto_657834 ?auto_657841 ) ) ( not ( = ?auto_657834 ?auto_657845 ) ) ( not ( = ?auto_657835 ?auto_657832 ) ) ( not ( = ?auto_657835 ?auto_657836 ) ) ( not ( = ?auto_657835 ?auto_657838 ) ) ( not ( = ?auto_657835 ?auto_657837 ) ) ( not ( = ?auto_657835 ?auto_657839 ) ) ( not ( = ?auto_657835 ?auto_657840 ) ) ( not ( = ?auto_657835 ?auto_657841 ) ) ( not ( = ?auto_657835 ?auto_657845 ) ) ( not ( = ?auto_657832 ?auto_657836 ) ) ( not ( = ?auto_657832 ?auto_657838 ) ) ( not ( = ?auto_657832 ?auto_657837 ) ) ( not ( = ?auto_657832 ?auto_657839 ) ) ( not ( = ?auto_657832 ?auto_657840 ) ) ( not ( = ?auto_657832 ?auto_657841 ) ) ( not ( = ?auto_657832 ?auto_657845 ) ) ( not ( = ?auto_657836 ?auto_657838 ) ) ( not ( = ?auto_657836 ?auto_657837 ) ) ( not ( = ?auto_657836 ?auto_657839 ) ) ( not ( = ?auto_657836 ?auto_657840 ) ) ( not ( = ?auto_657836 ?auto_657841 ) ) ( not ( = ?auto_657836 ?auto_657845 ) ) ( not ( = ?auto_657838 ?auto_657837 ) ) ( not ( = ?auto_657838 ?auto_657839 ) ) ( not ( = ?auto_657838 ?auto_657840 ) ) ( not ( = ?auto_657838 ?auto_657841 ) ) ( not ( = ?auto_657838 ?auto_657845 ) ) ( not ( = ?auto_657837 ?auto_657839 ) ) ( not ( = ?auto_657837 ?auto_657840 ) ) ( not ( = ?auto_657837 ?auto_657841 ) ) ( not ( = ?auto_657837 ?auto_657845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657839 ?auto_657840 ?auto_657841 )
      ( MAKE-9CRATE-VERIFY ?auto_657833 ?auto_657834 ?auto_657835 ?auto_657832 ?auto_657836 ?auto_657838 ?auto_657837 ?auto_657839 ?auto_657840 ?auto_657841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_657848 - SURFACE
      ?auto_657849 - SURFACE
    )
    :vars
    (
      ?auto_657850 - HOIST
      ?auto_657853 - PLACE
      ?auto_657851 - SURFACE
      ?auto_657852 - PLACE
      ?auto_657856 - HOIST
      ?auto_657854 - SURFACE
      ?auto_657855 - TRUCK
      ?auto_657857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657850 ?auto_657853 ) ( IS-CRATE ?auto_657849 ) ( not ( = ?auto_657848 ?auto_657849 ) ) ( not ( = ?auto_657851 ?auto_657848 ) ) ( not ( = ?auto_657851 ?auto_657849 ) ) ( not ( = ?auto_657852 ?auto_657853 ) ) ( HOIST-AT ?auto_657856 ?auto_657852 ) ( not ( = ?auto_657850 ?auto_657856 ) ) ( SURFACE-AT ?auto_657849 ?auto_657852 ) ( ON ?auto_657849 ?auto_657854 ) ( CLEAR ?auto_657849 ) ( not ( = ?auto_657848 ?auto_657854 ) ) ( not ( = ?auto_657849 ?auto_657854 ) ) ( not ( = ?auto_657851 ?auto_657854 ) ) ( SURFACE-AT ?auto_657851 ?auto_657853 ) ( CLEAR ?auto_657851 ) ( IS-CRATE ?auto_657848 ) ( AVAILABLE ?auto_657850 ) ( TRUCK-AT ?auto_657855 ?auto_657852 ) ( AVAILABLE ?auto_657856 ) ( SURFACE-AT ?auto_657848 ?auto_657852 ) ( ON ?auto_657848 ?auto_657857 ) ( CLEAR ?auto_657848 ) ( not ( = ?auto_657848 ?auto_657857 ) ) ( not ( = ?auto_657849 ?auto_657857 ) ) ( not ( = ?auto_657851 ?auto_657857 ) ) ( not ( = ?auto_657854 ?auto_657857 ) ) )
    :subtasks
    ( ( !LIFT ?auto_657856 ?auto_657848 ?auto_657857 ?auto_657852 )
      ( MAKE-2CRATE ?auto_657851 ?auto_657848 ?auto_657849 )
      ( MAKE-1CRATE-VERIFY ?auto_657848 ?auto_657849 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_657858 - SURFACE
      ?auto_657859 - SURFACE
      ?auto_657860 - SURFACE
    )
    :vars
    (
      ?auto_657862 - HOIST
      ?auto_657864 - PLACE
      ?auto_657866 - PLACE
      ?auto_657863 - HOIST
      ?auto_657865 - SURFACE
      ?auto_657867 - TRUCK
      ?auto_657861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657862 ?auto_657864 ) ( IS-CRATE ?auto_657860 ) ( not ( = ?auto_657859 ?auto_657860 ) ) ( not ( = ?auto_657858 ?auto_657859 ) ) ( not ( = ?auto_657858 ?auto_657860 ) ) ( not ( = ?auto_657866 ?auto_657864 ) ) ( HOIST-AT ?auto_657863 ?auto_657866 ) ( not ( = ?auto_657862 ?auto_657863 ) ) ( SURFACE-AT ?auto_657860 ?auto_657866 ) ( ON ?auto_657860 ?auto_657865 ) ( CLEAR ?auto_657860 ) ( not ( = ?auto_657859 ?auto_657865 ) ) ( not ( = ?auto_657860 ?auto_657865 ) ) ( not ( = ?auto_657858 ?auto_657865 ) ) ( SURFACE-AT ?auto_657858 ?auto_657864 ) ( CLEAR ?auto_657858 ) ( IS-CRATE ?auto_657859 ) ( AVAILABLE ?auto_657862 ) ( TRUCK-AT ?auto_657867 ?auto_657866 ) ( AVAILABLE ?auto_657863 ) ( SURFACE-AT ?auto_657859 ?auto_657866 ) ( ON ?auto_657859 ?auto_657861 ) ( CLEAR ?auto_657859 ) ( not ( = ?auto_657859 ?auto_657861 ) ) ( not ( = ?auto_657860 ?auto_657861 ) ) ( not ( = ?auto_657858 ?auto_657861 ) ) ( not ( = ?auto_657865 ?auto_657861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_657859 ?auto_657860 )
      ( MAKE-2CRATE-VERIFY ?auto_657858 ?auto_657859 ?auto_657860 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_657869 - SURFACE
      ?auto_657870 - SURFACE
      ?auto_657871 - SURFACE
      ?auto_657868 - SURFACE
    )
    :vars
    (
      ?auto_657874 - HOIST
      ?auto_657878 - PLACE
      ?auto_657877 - PLACE
      ?auto_657873 - HOIST
      ?auto_657872 - SURFACE
      ?auto_657875 - TRUCK
      ?auto_657876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657874 ?auto_657878 ) ( IS-CRATE ?auto_657868 ) ( not ( = ?auto_657871 ?auto_657868 ) ) ( not ( = ?auto_657870 ?auto_657871 ) ) ( not ( = ?auto_657870 ?auto_657868 ) ) ( not ( = ?auto_657877 ?auto_657878 ) ) ( HOIST-AT ?auto_657873 ?auto_657877 ) ( not ( = ?auto_657874 ?auto_657873 ) ) ( SURFACE-AT ?auto_657868 ?auto_657877 ) ( ON ?auto_657868 ?auto_657872 ) ( CLEAR ?auto_657868 ) ( not ( = ?auto_657871 ?auto_657872 ) ) ( not ( = ?auto_657868 ?auto_657872 ) ) ( not ( = ?auto_657870 ?auto_657872 ) ) ( SURFACE-AT ?auto_657870 ?auto_657878 ) ( CLEAR ?auto_657870 ) ( IS-CRATE ?auto_657871 ) ( AVAILABLE ?auto_657874 ) ( TRUCK-AT ?auto_657875 ?auto_657877 ) ( AVAILABLE ?auto_657873 ) ( SURFACE-AT ?auto_657871 ?auto_657877 ) ( ON ?auto_657871 ?auto_657876 ) ( CLEAR ?auto_657871 ) ( not ( = ?auto_657871 ?auto_657876 ) ) ( not ( = ?auto_657868 ?auto_657876 ) ) ( not ( = ?auto_657870 ?auto_657876 ) ) ( not ( = ?auto_657872 ?auto_657876 ) ) ( ON ?auto_657870 ?auto_657869 ) ( not ( = ?auto_657869 ?auto_657870 ) ) ( not ( = ?auto_657869 ?auto_657871 ) ) ( not ( = ?auto_657869 ?auto_657868 ) ) ( not ( = ?auto_657869 ?auto_657872 ) ) ( not ( = ?auto_657869 ?auto_657876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657870 ?auto_657871 ?auto_657868 )
      ( MAKE-3CRATE-VERIFY ?auto_657869 ?auto_657870 ?auto_657871 ?auto_657868 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_657880 - SURFACE
      ?auto_657881 - SURFACE
      ?auto_657882 - SURFACE
      ?auto_657879 - SURFACE
      ?auto_657883 - SURFACE
    )
    :vars
    (
      ?auto_657886 - HOIST
      ?auto_657890 - PLACE
      ?auto_657889 - PLACE
      ?auto_657885 - HOIST
      ?auto_657884 - SURFACE
      ?auto_657887 - TRUCK
      ?auto_657888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657886 ?auto_657890 ) ( IS-CRATE ?auto_657883 ) ( not ( = ?auto_657879 ?auto_657883 ) ) ( not ( = ?auto_657882 ?auto_657879 ) ) ( not ( = ?auto_657882 ?auto_657883 ) ) ( not ( = ?auto_657889 ?auto_657890 ) ) ( HOIST-AT ?auto_657885 ?auto_657889 ) ( not ( = ?auto_657886 ?auto_657885 ) ) ( SURFACE-AT ?auto_657883 ?auto_657889 ) ( ON ?auto_657883 ?auto_657884 ) ( CLEAR ?auto_657883 ) ( not ( = ?auto_657879 ?auto_657884 ) ) ( not ( = ?auto_657883 ?auto_657884 ) ) ( not ( = ?auto_657882 ?auto_657884 ) ) ( SURFACE-AT ?auto_657882 ?auto_657890 ) ( CLEAR ?auto_657882 ) ( IS-CRATE ?auto_657879 ) ( AVAILABLE ?auto_657886 ) ( TRUCK-AT ?auto_657887 ?auto_657889 ) ( AVAILABLE ?auto_657885 ) ( SURFACE-AT ?auto_657879 ?auto_657889 ) ( ON ?auto_657879 ?auto_657888 ) ( CLEAR ?auto_657879 ) ( not ( = ?auto_657879 ?auto_657888 ) ) ( not ( = ?auto_657883 ?auto_657888 ) ) ( not ( = ?auto_657882 ?auto_657888 ) ) ( not ( = ?auto_657884 ?auto_657888 ) ) ( ON ?auto_657881 ?auto_657880 ) ( ON ?auto_657882 ?auto_657881 ) ( not ( = ?auto_657880 ?auto_657881 ) ) ( not ( = ?auto_657880 ?auto_657882 ) ) ( not ( = ?auto_657880 ?auto_657879 ) ) ( not ( = ?auto_657880 ?auto_657883 ) ) ( not ( = ?auto_657880 ?auto_657884 ) ) ( not ( = ?auto_657880 ?auto_657888 ) ) ( not ( = ?auto_657881 ?auto_657882 ) ) ( not ( = ?auto_657881 ?auto_657879 ) ) ( not ( = ?auto_657881 ?auto_657883 ) ) ( not ( = ?auto_657881 ?auto_657884 ) ) ( not ( = ?auto_657881 ?auto_657888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657882 ?auto_657879 ?auto_657883 )
      ( MAKE-4CRATE-VERIFY ?auto_657880 ?auto_657881 ?auto_657882 ?auto_657879 ?auto_657883 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_657892 - SURFACE
      ?auto_657893 - SURFACE
      ?auto_657894 - SURFACE
      ?auto_657891 - SURFACE
      ?auto_657895 - SURFACE
      ?auto_657896 - SURFACE
    )
    :vars
    (
      ?auto_657899 - HOIST
      ?auto_657903 - PLACE
      ?auto_657902 - PLACE
      ?auto_657898 - HOIST
      ?auto_657897 - SURFACE
      ?auto_657900 - TRUCK
      ?auto_657901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657899 ?auto_657903 ) ( IS-CRATE ?auto_657896 ) ( not ( = ?auto_657895 ?auto_657896 ) ) ( not ( = ?auto_657891 ?auto_657895 ) ) ( not ( = ?auto_657891 ?auto_657896 ) ) ( not ( = ?auto_657902 ?auto_657903 ) ) ( HOIST-AT ?auto_657898 ?auto_657902 ) ( not ( = ?auto_657899 ?auto_657898 ) ) ( SURFACE-AT ?auto_657896 ?auto_657902 ) ( ON ?auto_657896 ?auto_657897 ) ( CLEAR ?auto_657896 ) ( not ( = ?auto_657895 ?auto_657897 ) ) ( not ( = ?auto_657896 ?auto_657897 ) ) ( not ( = ?auto_657891 ?auto_657897 ) ) ( SURFACE-AT ?auto_657891 ?auto_657903 ) ( CLEAR ?auto_657891 ) ( IS-CRATE ?auto_657895 ) ( AVAILABLE ?auto_657899 ) ( TRUCK-AT ?auto_657900 ?auto_657902 ) ( AVAILABLE ?auto_657898 ) ( SURFACE-AT ?auto_657895 ?auto_657902 ) ( ON ?auto_657895 ?auto_657901 ) ( CLEAR ?auto_657895 ) ( not ( = ?auto_657895 ?auto_657901 ) ) ( not ( = ?auto_657896 ?auto_657901 ) ) ( not ( = ?auto_657891 ?auto_657901 ) ) ( not ( = ?auto_657897 ?auto_657901 ) ) ( ON ?auto_657893 ?auto_657892 ) ( ON ?auto_657894 ?auto_657893 ) ( ON ?auto_657891 ?auto_657894 ) ( not ( = ?auto_657892 ?auto_657893 ) ) ( not ( = ?auto_657892 ?auto_657894 ) ) ( not ( = ?auto_657892 ?auto_657891 ) ) ( not ( = ?auto_657892 ?auto_657895 ) ) ( not ( = ?auto_657892 ?auto_657896 ) ) ( not ( = ?auto_657892 ?auto_657897 ) ) ( not ( = ?auto_657892 ?auto_657901 ) ) ( not ( = ?auto_657893 ?auto_657894 ) ) ( not ( = ?auto_657893 ?auto_657891 ) ) ( not ( = ?auto_657893 ?auto_657895 ) ) ( not ( = ?auto_657893 ?auto_657896 ) ) ( not ( = ?auto_657893 ?auto_657897 ) ) ( not ( = ?auto_657893 ?auto_657901 ) ) ( not ( = ?auto_657894 ?auto_657891 ) ) ( not ( = ?auto_657894 ?auto_657895 ) ) ( not ( = ?auto_657894 ?auto_657896 ) ) ( not ( = ?auto_657894 ?auto_657897 ) ) ( not ( = ?auto_657894 ?auto_657901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657891 ?auto_657895 ?auto_657896 )
      ( MAKE-5CRATE-VERIFY ?auto_657892 ?auto_657893 ?auto_657894 ?auto_657891 ?auto_657895 ?auto_657896 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_657905 - SURFACE
      ?auto_657906 - SURFACE
      ?auto_657907 - SURFACE
      ?auto_657904 - SURFACE
      ?auto_657908 - SURFACE
      ?auto_657910 - SURFACE
      ?auto_657909 - SURFACE
    )
    :vars
    (
      ?auto_657913 - HOIST
      ?auto_657917 - PLACE
      ?auto_657916 - PLACE
      ?auto_657912 - HOIST
      ?auto_657911 - SURFACE
      ?auto_657914 - TRUCK
      ?auto_657915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657913 ?auto_657917 ) ( IS-CRATE ?auto_657909 ) ( not ( = ?auto_657910 ?auto_657909 ) ) ( not ( = ?auto_657908 ?auto_657910 ) ) ( not ( = ?auto_657908 ?auto_657909 ) ) ( not ( = ?auto_657916 ?auto_657917 ) ) ( HOIST-AT ?auto_657912 ?auto_657916 ) ( not ( = ?auto_657913 ?auto_657912 ) ) ( SURFACE-AT ?auto_657909 ?auto_657916 ) ( ON ?auto_657909 ?auto_657911 ) ( CLEAR ?auto_657909 ) ( not ( = ?auto_657910 ?auto_657911 ) ) ( not ( = ?auto_657909 ?auto_657911 ) ) ( not ( = ?auto_657908 ?auto_657911 ) ) ( SURFACE-AT ?auto_657908 ?auto_657917 ) ( CLEAR ?auto_657908 ) ( IS-CRATE ?auto_657910 ) ( AVAILABLE ?auto_657913 ) ( TRUCK-AT ?auto_657914 ?auto_657916 ) ( AVAILABLE ?auto_657912 ) ( SURFACE-AT ?auto_657910 ?auto_657916 ) ( ON ?auto_657910 ?auto_657915 ) ( CLEAR ?auto_657910 ) ( not ( = ?auto_657910 ?auto_657915 ) ) ( not ( = ?auto_657909 ?auto_657915 ) ) ( not ( = ?auto_657908 ?auto_657915 ) ) ( not ( = ?auto_657911 ?auto_657915 ) ) ( ON ?auto_657906 ?auto_657905 ) ( ON ?auto_657907 ?auto_657906 ) ( ON ?auto_657904 ?auto_657907 ) ( ON ?auto_657908 ?auto_657904 ) ( not ( = ?auto_657905 ?auto_657906 ) ) ( not ( = ?auto_657905 ?auto_657907 ) ) ( not ( = ?auto_657905 ?auto_657904 ) ) ( not ( = ?auto_657905 ?auto_657908 ) ) ( not ( = ?auto_657905 ?auto_657910 ) ) ( not ( = ?auto_657905 ?auto_657909 ) ) ( not ( = ?auto_657905 ?auto_657911 ) ) ( not ( = ?auto_657905 ?auto_657915 ) ) ( not ( = ?auto_657906 ?auto_657907 ) ) ( not ( = ?auto_657906 ?auto_657904 ) ) ( not ( = ?auto_657906 ?auto_657908 ) ) ( not ( = ?auto_657906 ?auto_657910 ) ) ( not ( = ?auto_657906 ?auto_657909 ) ) ( not ( = ?auto_657906 ?auto_657911 ) ) ( not ( = ?auto_657906 ?auto_657915 ) ) ( not ( = ?auto_657907 ?auto_657904 ) ) ( not ( = ?auto_657907 ?auto_657908 ) ) ( not ( = ?auto_657907 ?auto_657910 ) ) ( not ( = ?auto_657907 ?auto_657909 ) ) ( not ( = ?auto_657907 ?auto_657911 ) ) ( not ( = ?auto_657907 ?auto_657915 ) ) ( not ( = ?auto_657904 ?auto_657908 ) ) ( not ( = ?auto_657904 ?auto_657910 ) ) ( not ( = ?auto_657904 ?auto_657909 ) ) ( not ( = ?auto_657904 ?auto_657911 ) ) ( not ( = ?auto_657904 ?auto_657915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657908 ?auto_657910 ?auto_657909 )
      ( MAKE-6CRATE-VERIFY ?auto_657905 ?auto_657906 ?auto_657907 ?auto_657904 ?auto_657908 ?auto_657910 ?auto_657909 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_657919 - SURFACE
      ?auto_657920 - SURFACE
      ?auto_657921 - SURFACE
      ?auto_657918 - SURFACE
      ?auto_657922 - SURFACE
      ?auto_657924 - SURFACE
      ?auto_657923 - SURFACE
      ?auto_657925 - SURFACE
    )
    :vars
    (
      ?auto_657928 - HOIST
      ?auto_657932 - PLACE
      ?auto_657931 - PLACE
      ?auto_657927 - HOIST
      ?auto_657926 - SURFACE
      ?auto_657929 - TRUCK
      ?auto_657930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657928 ?auto_657932 ) ( IS-CRATE ?auto_657925 ) ( not ( = ?auto_657923 ?auto_657925 ) ) ( not ( = ?auto_657924 ?auto_657923 ) ) ( not ( = ?auto_657924 ?auto_657925 ) ) ( not ( = ?auto_657931 ?auto_657932 ) ) ( HOIST-AT ?auto_657927 ?auto_657931 ) ( not ( = ?auto_657928 ?auto_657927 ) ) ( SURFACE-AT ?auto_657925 ?auto_657931 ) ( ON ?auto_657925 ?auto_657926 ) ( CLEAR ?auto_657925 ) ( not ( = ?auto_657923 ?auto_657926 ) ) ( not ( = ?auto_657925 ?auto_657926 ) ) ( not ( = ?auto_657924 ?auto_657926 ) ) ( SURFACE-AT ?auto_657924 ?auto_657932 ) ( CLEAR ?auto_657924 ) ( IS-CRATE ?auto_657923 ) ( AVAILABLE ?auto_657928 ) ( TRUCK-AT ?auto_657929 ?auto_657931 ) ( AVAILABLE ?auto_657927 ) ( SURFACE-AT ?auto_657923 ?auto_657931 ) ( ON ?auto_657923 ?auto_657930 ) ( CLEAR ?auto_657923 ) ( not ( = ?auto_657923 ?auto_657930 ) ) ( not ( = ?auto_657925 ?auto_657930 ) ) ( not ( = ?auto_657924 ?auto_657930 ) ) ( not ( = ?auto_657926 ?auto_657930 ) ) ( ON ?auto_657920 ?auto_657919 ) ( ON ?auto_657921 ?auto_657920 ) ( ON ?auto_657918 ?auto_657921 ) ( ON ?auto_657922 ?auto_657918 ) ( ON ?auto_657924 ?auto_657922 ) ( not ( = ?auto_657919 ?auto_657920 ) ) ( not ( = ?auto_657919 ?auto_657921 ) ) ( not ( = ?auto_657919 ?auto_657918 ) ) ( not ( = ?auto_657919 ?auto_657922 ) ) ( not ( = ?auto_657919 ?auto_657924 ) ) ( not ( = ?auto_657919 ?auto_657923 ) ) ( not ( = ?auto_657919 ?auto_657925 ) ) ( not ( = ?auto_657919 ?auto_657926 ) ) ( not ( = ?auto_657919 ?auto_657930 ) ) ( not ( = ?auto_657920 ?auto_657921 ) ) ( not ( = ?auto_657920 ?auto_657918 ) ) ( not ( = ?auto_657920 ?auto_657922 ) ) ( not ( = ?auto_657920 ?auto_657924 ) ) ( not ( = ?auto_657920 ?auto_657923 ) ) ( not ( = ?auto_657920 ?auto_657925 ) ) ( not ( = ?auto_657920 ?auto_657926 ) ) ( not ( = ?auto_657920 ?auto_657930 ) ) ( not ( = ?auto_657921 ?auto_657918 ) ) ( not ( = ?auto_657921 ?auto_657922 ) ) ( not ( = ?auto_657921 ?auto_657924 ) ) ( not ( = ?auto_657921 ?auto_657923 ) ) ( not ( = ?auto_657921 ?auto_657925 ) ) ( not ( = ?auto_657921 ?auto_657926 ) ) ( not ( = ?auto_657921 ?auto_657930 ) ) ( not ( = ?auto_657918 ?auto_657922 ) ) ( not ( = ?auto_657918 ?auto_657924 ) ) ( not ( = ?auto_657918 ?auto_657923 ) ) ( not ( = ?auto_657918 ?auto_657925 ) ) ( not ( = ?auto_657918 ?auto_657926 ) ) ( not ( = ?auto_657918 ?auto_657930 ) ) ( not ( = ?auto_657922 ?auto_657924 ) ) ( not ( = ?auto_657922 ?auto_657923 ) ) ( not ( = ?auto_657922 ?auto_657925 ) ) ( not ( = ?auto_657922 ?auto_657926 ) ) ( not ( = ?auto_657922 ?auto_657930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657924 ?auto_657923 ?auto_657925 )
      ( MAKE-7CRATE-VERIFY ?auto_657919 ?auto_657920 ?auto_657921 ?auto_657918 ?auto_657922 ?auto_657924 ?auto_657923 ?auto_657925 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_657934 - SURFACE
      ?auto_657935 - SURFACE
      ?auto_657936 - SURFACE
      ?auto_657933 - SURFACE
      ?auto_657937 - SURFACE
      ?auto_657939 - SURFACE
      ?auto_657938 - SURFACE
      ?auto_657940 - SURFACE
      ?auto_657941 - SURFACE
    )
    :vars
    (
      ?auto_657944 - HOIST
      ?auto_657948 - PLACE
      ?auto_657947 - PLACE
      ?auto_657943 - HOIST
      ?auto_657942 - SURFACE
      ?auto_657945 - TRUCK
      ?auto_657946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657944 ?auto_657948 ) ( IS-CRATE ?auto_657941 ) ( not ( = ?auto_657940 ?auto_657941 ) ) ( not ( = ?auto_657938 ?auto_657940 ) ) ( not ( = ?auto_657938 ?auto_657941 ) ) ( not ( = ?auto_657947 ?auto_657948 ) ) ( HOIST-AT ?auto_657943 ?auto_657947 ) ( not ( = ?auto_657944 ?auto_657943 ) ) ( SURFACE-AT ?auto_657941 ?auto_657947 ) ( ON ?auto_657941 ?auto_657942 ) ( CLEAR ?auto_657941 ) ( not ( = ?auto_657940 ?auto_657942 ) ) ( not ( = ?auto_657941 ?auto_657942 ) ) ( not ( = ?auto_657938 ?auto_657942 ) ) ( SURFACE-AT ?auto_657938 ?auto_657948 ) ( CLEAR ?auto_657938 ) ( IS-CRATE ?auto_657940 ) ( AVAILABLE ?auto_657944 ) ( TRUCK-AT ?auto_657945 ?auto_657947 ) ( AVAILABLE ?auto_657943 ) ( SURFACE-AT ?auto_657940 ?auto_657947 ) ( ON ?auto_657940 ?auto_657946 ) ( CLEAR ?auto_657940 ) ( not ( = ?auto_657940 ?auto_657946 ) ) ( not ( = ?auto_657941 ?auto_657946 ) ) ( not ( = ?auto_657938 ?auto_657946 ) ) ( not ( = ?auto_657942 ?auto_657946 ) ) ( ON ?auto_657935 ?auto_657934 ) ( ON ?auto_657936 ?auto_657935 ) ( ON ?auto_657933 ?auto_657936 ) ( ON ?auto_657937 ?auto_657933 ) ( ON ?auto_657939 ?auto_657937 ) ( ON ?auto_657938 ?auto_657939 ) ( not ( = ?auto_657934 ?auto_657935 ) ) ( not ( = ?auto_657934 ?auto_657936 ) ) ( not ( = ?auto_657934 ?auto_657933 ) ) ( not ( = ?auto_657934 ?auto_657937 ) ) ( not ( = ?auto_657934 ?auto_657939 ) ) ( not ( = ?auto_657934 ?auto_657938 ) ) ( not ( = ?auto_657934 ?auto_657940 ) ) ( not ( = ?auto_657934 ?auto_657941 ) ) ( not ( = ?auto_657934 ?auto_657942 ) ) ( not ( = ?auto_657934 ?auto_657946 ) ) ( not ( = ?auto_657935 ?auto_657936 ) ) ( not ( = ?auto_657935 ?auto_657933 ) ) ( not ( = ?auto_657935 ?auto_657937 ) ) ( not ( = ?auto_657935 ?auto_657939 ) ) ( not ( = ?auto_657935 ?auto_657938 ) ) ( not ( = ?auto_657935 ?auto_657940 ) ) ( not ( = ?auto_657935 ?auto_657941 ) ) ( not ( = ?auto_657935 ?auto_657942 ) ) ( not ( = ?auto_657935 ?auto_657946 ) ) ( not ( = ?auto_657936 ?auto_657933 ) ) ( not ( = ?auto_657936 ?auto_657937 ) ) ( not ( = ?auto_657936 ?auto_657939 ) ) ( not ( = ?auto_657936 ?auto_657938 ) ) ( not ( = ?auto_657936 ?auto_657940 ) ) ( not ( = ?auto_657936 ?auto_657941 ) ) ( not ( = ?auto_657936 ?auto_657942 ) ) ( not ( = ?auto_657936 ?auto_657946 ) ) ( not ( = ?auto_657933 ?auto_657937 ) ) ( not ( = ?auto_657933 ?auto_657939 ) ) ( not ( = ?auto_657933 ?auto_657938 ) ) ( not ( = ?auto_657933 ?auto_657940 ) ) ( not ( = ?auto_657933 ?auto_657941 ) ) ( not ( = ?auto_657933 ?auto_657942 ) ) ( not ( = ?auto_657933 ?auto_657946 ) ) ( not ( = ?auto_657937 ?auto_657939 ) ) ( not ( = ?auto_657937 ?auto_657938 ) ) ( not ( = ?auto_657937 ?auto_657940 ) ) ( not ( = ?auto_657937 ?auto_657941 ) ) ( not ( = ?auto_657937 ?auto_657942 ) ) ( not ( = ?auto_657937 ?auto_657946 ) ) ( not ( = ?auto_657939 ?auto_657938 ) ) ( not ( = ?auto_657939 ?auto_657940 ) ) ( not ( = ?auto_657939 ?auto_657941 ) ) ( not ( = ?auto_657939 ?auto_657942 ) ) ( not ( = ?auto_657939 ?auto_657946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657938 ?auto_657940 ?auto_657941 )
      ( MAKE-8CRATE-VERIFY ?auto_657934 ?auto_657935 ?auto_657936 ?auto_657933 ?auto_657937 ?auto_657939 ?auto_657938 ?auto_657940 ?auto_657941 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657950 - SURFACE
      ?auto_657951 - SURFACE
      ?auto_657952 - SURFACE
      ?auto_657949 - SURFACE
      ?auto_657953 - SURFACE
      ?auto_657955 - SURFACE
      ?auto_657954 - SURFACE
      ?auto_657956 - SURFACE
      ?auto_657957 - SURFACE
      ?auto_657958 - SURFACE
    )
    :vars
    (
      ?auto_657961 - HOIST
      ?auto_657965 - PLACE
      ?auto_657964 - PLACE
      ?auto_657960 - HOIST
      ?auto_657959 - SURFACE
      ?auto_657962 - TRUCK
      ?auto_657963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657961 ?auto_657965 ) ( IS-CRATE ?auto_657958 ) ( not ( = ?auto_657957 ?auto_657958 ) ) ( not ( = ?auto_657956 ?auto_657957 ) ) ( not ( = ?auto_657956 ?auto_657958 ) ) ( not ( = ?auto_657964 ?auto_657965 ) ) ( HOIST-AT ?auto_657960 ?auto_657964 ) ( not ( = ?auto_657961 ?auto_657960 ) ) ( SURFACE-AT ?auto_657958 ?auto_657964 ) ( ON ?auto_657958 ?auto_657959 ) ( CLEAR ?auto_657958 ) ( not ( = ?auto_657957 ?auto_657959 ) ) ( not ( = ?auto_657958 ?auto_657959 ) ) ( not ( = ?auto_657956 ?auto_657959 ) ) ( SURFACE-AT ?auto_657956 ?auto_657965 ) ( CLEAR ?auto_657956 ) ( IS-CRATE ?auto_657957 ) ( AVAILABLE ?auto_657961 ) ( TRUCK-AT ?auto_657962 ?auto_657964 ) ( AVAILABLE ?auto_657960 ) ( SURFACE-AT ?auto_657957 ?auto_657964 ) ( ON ?auto_657957 ?auto_657963 ) ( CLEAR ?auto_657957 ) ( not ( = ?auto_657957 ?auto_657963 ) ) ( not ( = ?auto_657958 ?auto_657963 ) ) ( not ( = ?auto_657956 ?auto_657963 ) ) ( not ( = ?auto_657959 ?auto_657963 ) ) ( ON ?auto_657951 ?auto_657950 ) ( ON ?auto_657952 ?auto_657951 ) ( ON ?auto_657949 ?auto_657952 ) ( ON ?auto_657953 ?auto_657949 ) ( ON ?auto_657955 ?auto_657953 ) ( ON ?auto_657954 ?auto_657955 ) ( ON ?auto_657956 ?auto_657954 ) ( not ( = ?auto_657950 ?auto_657951 ) ) ( not ( = ?auto_657950 ?auto_657952 ) ) ( not ( = ?auto_657950 ?auto_657949 ) ) ( not ( = ?auto_657950 ?auto_657953 ) ) ( not ( = ?auto_657950 ?auto_657955 ) ) ( not ( = ?auto_657950 ?auto_657954 ) ) ( not ( = ?auto_657950 ?auto_657956 ) ) ( not ( = ?auto_657950 ?auto_657957 ) ) ( not ( = ?auto_657950 ?auto_657958 ) ) ( not ( = ?auto_657950 ?auto_657959 ) ) ( not ( = ?auto_657950 ?auto_657963 ) ) ( not ( = ?auto_657951 ?auto_657952 ) ) ( not ( = ?auto_657951 ?auto_657949 ) ) ( not ( = ?auto_657951 ?auto_657953 ) ) ( not ( = ?auto_657951 ?auto_657955 ) ) ( not ( = ?auto_657951 ?auto_657954 ) ) ( not ( = ?auto_657951 ?auto_657956 ) ) ( not ( = ?auto_657951 ?auto_657957 ) ) ( not ( = ?auto_657951 ?auto_657958 ) ) ( not ( = ?auto_657951 ?auto_657959 ) ) ( not ( = ?auto_657951 ?auto_657963 ) ) ( not ( = ?auto_657952 ?auto_657949 ) ) ( not ( = ?auto_657952 ?auto_657953 ) ) ( not ( = ?auto_657952 ?auto_657955 ) ) ( not ( = ?auto_657952 ?auto_657954 ) ) ( not ( = ?auto_657952 ?auto_657956 ) ) ( not ( = ?auto_657952 ?auto_657957 ) ) ( not ( = ?auto_657952 ?auto_657958 ) ) ( not ( = ?auto_657952 ?auto_657959 ) ) ( not ( = ?auto_657952 ?auto_657963 ) ) ( not ( = ?auto_657949 ?auto_657953 ) ) ( not ( = ?auto_657949 ?auto_657955 ) ) ( not ( = ?auto_657949 ?auto_657954 ) ) ( not ( = ?auto_657949 ?auto_657956 ) ) ( not ( = ?auto_657949 ?auto_657957 ) ) ( not ( = ?auto_657949 ?auto_657958 ) ) ( not ( = ?auto_657949 ?auto_657959 ) ) ( not ( = ?auto_657949 ?auto_657963 ) ) ( not ( = ?auto_657953 ?auto_657955 ) ) ( not ( = ?auto_657953 ?auto_657954 ) ) ( not ( = ?auto_657953 ?auto_657956 ) ) ( not ( = ?auto_657953 ?auto_657957 ) ) ( not ( = ?auto_657953 ?auto_657958 ) ) ( not ( = ?auto_657953 ?auto_657959 ) ) ( not ( = ?auto_657953 ?auto_657963 ) ) ( not ( = ?auto_657955 ?auto_657954 ) ) ( not ( = ?auto_657955 ?auto_657956 ) ) ( not ( = ?auto_657955 ?auto_657957 ) ) ( not ( = ?auto_657955 ?auto_657958 ) ) ( not ( = ?auto_657955 ?auto_657959 ) ) ( not ( = ?auto_657955 ?auto_657963 ) ) ( not ( = ?auto_657954 ?auto_657956 ) ) ( not ( = ?auto_657954 ?auto_657957 ) ) ( not ( = ?auto_657954 ?auto_657958 ) ) ( not ( = ?auto_657954 ?auto_657959 ) ) ( not ( = ?auto_657954 ?auto_657963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657956 ?auto_657957 ?auto_657958 )
      ( MAKE-9CRATE-VERIFY ?auto_657950 ?auto_657951 ?auto_657952 ?auto_657949 ?auto_657953 ?auto_657955 ?auto_657954 ?auto_657956 ?auto_657957 ?auto_657958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_657966 - SURFACE
      ?auto_657967 - SURFACE
    )
    :vars
    (
      ?auto_657970 - HOIST
      ?auto_657974 - PLACE
      ?auto_657975 - SURFACE
      ?auto_657973 - PLACE
      ?auto_657969 - HOIST
      ?auto_657968 - SURFACE
      ?auto_657972 - SURFACE
      ?auto_657971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657970 ?auto_657974 ) ( IS-CRATE ?auto_657967 ) ( not ( = ?auto_657966 ?auto_657967 ) ) ( not ( = ?auto_657975 ?auto_657966 ) ) ( not ( = ?auto_657975 ?auto_657967 ) ) ( not ( = ?auto_657973 ?auto_657974 ) ) ( HOIST-AT ?auto_657969 ?auto_657973 ) ( not ( = ?auto_657970 ?auto_657969 ) ) ( SURFACE-AT ?auto_657967 ?auto_657973 ) ( ON ?auto_657967 ?auto_657968 ) ( CLEAR ?auto_657967 ) ( not ( = ?auto_657966 ?auto_657968 ) ) ( not ( = ?auto_657967 ?auto_657968 ) ) ( not ( = ?auto_657975 ?auto_657968 ) ) ( SURFACE-AT ?auto_657975 ?auto_657974 ) ( CLEAR ?auto_657975 ) ( IS-CRATE ?auto_657966 ) ( AVAILABLE ?auto_657970 ) ( AVAILABLE ?auto_657969 ) ( SURFACE-AT ?auto_657966 ?auto_657973 ) ( ON ?auto_657966 ?auto_657972 ) ( CLEAR ?auto_657966 ) ( not ( = ?auto_657966 ?auto_657972 ) ) ( not ( = ?auto_657967 ?auto_657972 ) ) ( not ( = ?auto_657975 ?auto_657972 ) ) ( not ( = ?auto_657968 ?auto_657972 ) ) ( TRUCK-AT ?auto_657971 ?auto_657974 ) )
    :subtasks
    ( ( !DRIVE ?auto_657971 ?auto_657974 ?auto_657973 )
      ( MAKE-2CRATE ?auto_657975 ?auto_657966 ?auto_657967 )
      ( MAKE-1CRATE-VERIFY ?auto_657966 ?auto_657967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_657976 - SURFACE
      ?auto_657977 - SURFACE
      ?auto_657978 - SURFACE
    )
    :vars
    (
      ?auto_657985 - HOIST
      ?auto_657982 - PLACE
      ?auto_657984 - PLACE
      ?auto_657983 - HOIST
      ?auto_657980 - SURFACE
      ?auto_657981 - SURFACE
      ?auto_657979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657985 ?auto_657982 ) ( IS-CRATE ?auto_657978 ) ( not ( = ?auto_657977 ?auto_657978 ) ) ( not ( = ?auto_657976 ?auto_657977 ) ) ( not ( = ?auto_657976 ?auto_657978 ) ) ( not ( = ?auto_657984 ?auto_657982 ) ) ( HOIST-AT ?auto_657983 ?auto_657984 ) ( not ( = ?auto_657985 ?auto_657983 ) ) ( SURFACE-AT ?auto_657978 ?auto_657984 ) ( ON ?auto_657978 ?auto_657980 ) ( CLEAR ?auto_657978 ) ( not ( = ?auto_657977 ?auto_657980 ) ) ( not ( = ?auto_657978 ?auto_657980 ) ) ( not ( = ?auto_657976 ?auto_657980 ) ) ( SURFACE-AT ?auto_657976 ?auto_657982 ) ( CLEAR ?auto_657976 ) ( IS-CRATE ?auto_657977 ) ( AVAILABLE ?auto_657985 ) ( AVAILABLE ?auto_657983 ) ( SURFACE-AT ?auto_657977 ?auto_657984 ) ( ON ?auto_657977 ?auto_657981 ) ( CLEAR ?auto_657977 ) ( not ( = ?auto_657977 ?auto_657981 ) ) ( not ( = ?auto_657978 ?auto_657981 ) ) ( not ( = ?auto_657976 ?auto_657981 ) ) ( not ( = ?auto_657980 ?auto_657981 ) ) ( TRUCK-AT ?auto_657979 ?auto_657982 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_657977 ?auto_657978 )
      ( MAKE-2CRATE-VERIFY ?auto_657976 ?auto_657977 ?auto_657978 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_657987 - SURFACE
      ?auto_657988 - SURFACE
      ?auto_657989 - SURFACE
      ?auto_657986 - SURFACE
    )
    :vars
    (
      ?auto_657993 - HOIST
      ?auto_657991 - PLACE
      ?auto_657996 - PLACE
      ?auto_657994 - HOIST
      ?auto_657990 - SURFACE
      ?auto_657992 - SURFACE
      ?auto_657995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657993 ?auto_657991 ) ( IS-CRATE ?auto_657986 ) ( not ( = ?auto_657989 ?auto_657986 ) ) ( not ( = ?auto_657988 ?auto_657989 ) ) ( not ( = ?auto_657988 ?auto_657986 ) ) ( not ( = ?auto_657996 ?auto_657991 ) ) ( HOIST-AT ?auto_657994 ?auto_657996 ) ( not ( = ?auto_657993 ?auto_657994 ) ) ( SURFACE-AT ?auto_657986 ?auto_657996 ) ( ON ?auto_657986 ?auto_657990 ) ( CLEAR ?auto_657986 ) ( not ( = ?auto_657989 ?auto_657990 ) ) ( not ( = ?auto_657986 ?auto_657990 ) ) ( not ( = ?auto_657988 ?auto_657990 ) ) ( SURFACE-AT ?auto_657988 ?auto_657991 ) ( CLEAR ?auto_657988 ) ( IS-CRATE ?auto_657989 ) ( AVAILABLE ?auto_657993 ) ( AVAILABLE ?auto_657994 ) ( SURFACE-AT ?auto_657989 ?auto_657996 ) ( ON ?auto_657989 ?auto_657992 ) ( CLEAR ?auto_657989 ) ( not ( = ?auto_657989 ?auto_657992 ) ) ( not ( = ?auto_657986 ?auto_657992 ) ) ( not ( = ?auto_657988 ?auto_657992 ) ) ( not ( = ?auto_657990 ?auto_657992 ) ) ( TRUCK-AT ?auto_657995 ?auto_657991 ) ( ON ?auto_657988 ?auto_657987 ) ( not ( = ?auto_657987 ?auto_657988 ) ) ( not ( = ?auto_657987 ?auto_657989 ) ) ( not ( = ?auto_657987 ?auto_657986 ) ) ( not ( = ?auto_657987 ?auto_657990 ) ) ( not ( = ?auto_657987 ?auto_657992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657988 ?auto_657989 ?auto_657986 )
      ( MAKE-3CRATE-VERIFY ?auto_657987 ?auto_657988 ?auto_657989 ?auto_657986 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_657998 - SURFACE
      ?auto_657999 - SURFACE
      ?auto_658000 - SURFACE
      ?auto_657997 - SURFACE
      ?auto_658001 - SURFACE
    )
    :vars
    (
      ?auto_658005 - HOIST
      ?auto_658003 - PLACE
      ?auto_658008 - PLACE
      ?auto_658006 - HOIST
      ?auto_658002 - SURFACE
      ?auto_658004 - SURFACE
      ?auto_658007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658005 ?auto_658003 ) ( IS-CRATE ?auto_658001 ) ( not ( = ?auto_657997 ?auto_658001 ) ) ( not ( = ?auto_658000 ?auto_657997 ) ) ( not ( = ?auto_658000 ?auto_658001 ) ) ( not ( = ?auto_658008 ?auto_658003 ) ) ( HOIST-AT ?auto_658006 ?auto_658008 ) ( not ( = ?auto_658005 ?auto_658006 ) ) ( SURFACE-AT ?auto_658001 ?auto_658008 ) ( ON ?auto_658001 ?auto_658002 ) ( CLEAR ?auto_658001 ) ( not ( = ?auto_657997 ?auto_658002 ) ) ( not ( = ?auto_658001 ?auto_658002 ) ) ( not ( = ?auto_658000 ?auto_658002 ) ) ( SURFACE-AT ?auto_658000 ?auto_658003 ) ( CLEAR ?auto_658000 ) ( IS-CRATE ?auto_657997 ) ( AVAILABLE ?auto_658005 ) ( AVAILABLE ?auto_658006 ) ( SURFACE-AT ?auto_657997 ?auto_658008 ) ( ON ?auto_657997 ?auto_658004 ) ( CLEAR ?auto_657997 ) ( not ( = ?auto_657997 ?auto_658004 ) ) ( not ( = ?auto_658001 ?auto_658004 ) ) ( not ( = ?auto_658000 ?auto_658004 ) ) ( not ( = ?auto_658002 ?auto_658004 ) ) ( TRUCK-AT ?auto_658007 ?auto_658003 ) ( ON ?auto_657999 ?auto_657998 ) ( ON ?auto_658000 ?auto_657999 ) ( not ( = ?auto_657998 ?auto_657999 ) ) ( not ( = ?auto_657998 ?auto_658000 ) ) ( not ( = ?auto_657998 ?auto_657997 ) ) ( not ( = ?auto_657998 ?auto_658001 ) ) ( not ( = ?auto_657998 ?auto_658002 ) ) ( not ( = ?auto_657998 ?auto_658004 ) ) ( not ( = ?auto_657999 ?auto_658000 ) ) ( not ( = ?auto_657999 ?auto_657997 ) ) ( not ( = ?auto_657999 ?auto_658001 ) ) ( not ( = ?auto_657999 ?auto_658002 ) ) ( not ( = ?auto_657999 ?auto_658004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658000 ?auto_657997 ?auto_658001 )
      ( MAKE-4CRATE-VERIFY ?auto_657998 ?auto_657999 ?auto_658000 ?auto_657997 ?auto_658001 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_658010 - SURFACE
      ?auto_658011 - SURFACE
      ?auto_658012 - SURFACE
      ?auto_658009 - SURFACE
      ?auto_658013 - SURFACE
      ?auto_658014 - SURFACE
    )
    :vars
    (
      ?auto_658018 - HOIST
      ?auto_658016 - PLACE
      ?auto_658021 - PLACE
      ?auto_658019 - HOIST
      ?auto_658015 - SURFACE
      ?auto_658017 - SURFACE
      ?auto_658020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658018 ?auto_658016 ) ( IS-CRATE ?auto_658014 ) ( not ( = ?auto_658013 ?auto_658014 ) ) ( not ( = ?auto_658009 ?auto_658013 ) ) ( not ( = ?auto_658009 ?auto_658014 ) ) ( not ( = ?auto_658021 ?auto_658016 ) ) ( HOIST-AT ?auto_658019 ?auto_658021 ) ( not ( = ?auto_658018 ?auto_658019 ) ) ( SURFACE-AT ?auto_658014 ?auto_658021 ) ( ON ?auto_658014 ?auto_658015 ) ( CLEAR ?auto_658014 ) ( not ( = ?auto_658013 ?auto_658015 ) ) ( not ( = ?auto_658014 ?auto_658015 ) ) ( not ( = ?auto_658009 ?auto_658015 ) ) ( SURFACE-AT ?auto_658009 ?auto_658016 ) ( CLEAR ?auto_658009 ) ( IS-CRATE ?auto_658013 ) ( AVAILABLE ?auto_658018 ) ( AVAILABLE ?auto_658019 ) ( SURFACE-AT ?auto_658013 ?auto_658021 ) ( ON ?auto_658013 ?auto_658017 ) ( CLEAR ?auto_658013 ) ( not ( = ?auto_658013 ?auto_658017 ) ) ( not ( = ?auto_658014 ?auto_658017 ) ) ( not ( = ?auto_658009 ?auto_658017 ) ) ( not ( = ?auto_658015 ?auto_658017 ) ) ( TRUCK-AT ?auto_658020 ?auto_658016 ) ( ON ?auto_658011 ?auto_658010 ) ( ON ?auto_658012 ?auto_658011 ) ( ON ?auto_658009 ?auto_658012 ) ( not ( = ?auto_658010 ?auto_658011 ) ) ( not ( = ?auto_658010 ?auto_658012 ) ) ( not ( = ?auto_658010 ?auto_658009 ) ) ( not ( = ?auto_658010 ?auto_658013 ) ) ( not ( = ?auto_658010 ?auto_658014 ) ) ( not ( = ?auto_658010 ?auto_658015 ) ) ( not ( = ?auto_658010 ?auto_658017 ) ) ( not ( = ?auto_658011 ?auto_658012 ) ) ( not ( = ?auto_658011 ?auto_658009 ) ) ( not ( = ?auto_658011 ?auto_658013 ) ) ( not ( = ?auto_658011 ?auto_658014 ) ) ( not ( = ?auto_658011 ?auto_658015 ) ) ( not ( = ?auto_658011 ?auto_658017 ) ) ( not ( = ?auto_658012 ?auto_658009 ) ) ( not ( = ?auto_658012 ?auto_658013 ) ) ( not ( = ?auto_658012 ?auto_658014 ) ) ( not ( = ?auto_658012 ?auto_658015 ) ) ( not ( = ?auto_658012 ?auto_658017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658009 ?auto_658013 ?auto_658014 )
      ( MAKE-5CRATE-VERIFY ?auto_658010 ?auto_658011 ?auto_658012 ?auto_658009 ?auto_658013 ?auto_658014 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_658023 - SURFACE
      ?auto_658024 - SURFACE
      ?auto_658025 - SURFACE
      ?auto_658022 - SURFACE
      ?auto_658026 - SURFACE
      ?auto_658028 - SURFACE
      ?auto_658027 - SURFACE
    )
    :vars
    (
      ?auto_658032 - HOIST
      ?auto_658030 - PLACE
      ?auto_658035 - PLACE
      ?auto_658033 - HOIST
      ?auto_658029 - SURFACE
      ?auto_658031 - SURFACE
      ?auto_658034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658032 ?auto_658030 ) ( IS-CRATE ?auto_658027 ) ( not ( = ?auto_658028 ?auto_658027 ) ) ( not ( = ?auto_658026 ?auto_658028 ) ) ( not ( = ?auto_658026 ?auto_658027 ) ) ( not ( = ?auto_658035 ?auto_658030 ) ) ( HOIST-AT ?auto_658033 ?auto_658035 ) ( not ( = ?auto_658032 ?auto_658033 ) ) ( SURFACE-AT ?auto_658027 ?auto_658035 ) ( ON ?auto_658027 ?auto_658029 ) ( CLEAR ?auto_658027 ) ( not ( = ?auto_658028 ?auto_658029 ) ) ( not ( = ?auto_658027 ?auto_658029 ) ) ( not ( = ?auto_658026 ?auto_658029 ) ) ( SURFACE-AT ?auto_658026 ?auto_658030 ) ( CLEAR ?auto_658026 ) ( IS-CRATE ?auto_658028 ) ( AVAILABLE ?auto_658032 ) ( AVAILABLE ?auto_658033 ) ( SURFACE-AT ?auto_658028 ?auto_658035 ) ( ON ?auto_658028 ?auto_658031 ) ( CLEAR ?auto_658028 ) ( not ( = ?auto_658028 ?auto_658031 ) ) ( not ( = ?auto_658027 ?auto_658031 ) ) ( not ( = ?auto_658026 ?auto_658031 ) ) ( not ( = ?auto_658029 ?auto_658031 ) ) ( TRUCK-AT ?auto_658034 ?auto_658030 ) ( ON ?auto_658024 ?auto_658023 ) ( ON ?auto_658025 ?auto_658024 ) ( ON ?auto_658022 ?auto_658025 ) ( ON ?auto_658026 ?auto_658022 ) ( not ( = ?auto_658023 ?auto_658024 ) ) ( not ( = ?auto_658023 ?auto_658025 ) ) ( not ( = ?auto_658023 ?auto_658022 ) ) ( not ( = ?auto_658023 ?auto_658026 ) ) ( not ( = ?auto_658023 ?auto_658028 ) ) ( not ( = ?auto_658023 ?auto_658027 ) ) ( not ( = ?auto_658023 ?auto_658029 ) ) ( not ( = ?auto_658023 ?auto_658031 ) ) ( not ( = ?auto_658024 ?auto_658025 ) ) ( not ( = ?auto_658024 ?auto_658022 ) ) ( not ( = ?auto_658024 ?auto_658026 ) ) ( not ( = ?auto_658024 ?auto_658028 ) ) ( not ( = ?auto_658024 ?auto_658027 ) ) ( not ( = ?auto_658024 ?auto_658029 ) ) ( not ( = ?auto_658024 ?auto_658031 ) ) ( not ( = ?auto_658025 ?auto_658022 ) ) ( not ( = ?auto_658025 ?auto_658026 ) ) ( not ( = ?auto_658025 ?auto_658028 ) ) ( not ( = ?auto_658025 ?auto_658027 ) ) ( not ( = ?auto_658025 ?auto_658029 ) ) ( not ( = ?auto_658025 ?auto_658031 ) ) ( not ( = ?auto_658022 ?auto_658026 ) ) ( not ( = ?auto_658022 ?auto_658028 ) ) ( not ( = ?auto_658022 ?auto_658027 ) ) ( not ( = ?auto_658022 ?auto_658029 ) ) ( not ( = ?auto_658022 ?auto_658031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658026 ?auto_658028 ?auto_658027 )
      ( MAKE-6CRATE-VERIFY ?auto_658023 ?auto_658024 ?auto_658025 ?auto_658022 ?auto_658026 ?auto_658028 ?auto_658027 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_658037 - SURFACE
      ?auto_658038 - SURFACE
      ?auto_658039 - SURFACE
      ?auto_658036 - SURFACE
      ?auto_658040 - SURFACE
      ?auto_658042 - SURFACE
      ?auto_658041 - SURFACE
      ?auto_658043 - SURFACE
    )
    :vars
    (
      ?auto_658047 - HOIST
      ?auto_658045 - PLACE
      ?auto_658050 - PLACE
      ?auto_658048 - HOIST
      ?auto_658044 - SURFACE
      ?auto_658046 - SURFACE
      ?auto_658049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658047 ?auto_658045 ) ( IS-CRATE ?auto_658043 ) ( not ( = ?auto_658041 ?auto_658043 ) ) ( not ( = ?auto_658042 ?auto_658041 ) ) ( not ( = ?auto_658042 ?auto_658043 ) ) ( not ( = ?auto_658050 ?auto_658045 ) ) ( HOIST-AT ?auto_658048 ?auto_658050 ) ( not ( = ?auto_658047 ?auto_658048 ) ) ( SURFACE-AT ?auto_658043 ?auto_658050 ) ( ON ?auto_658043 ?auto_658044 ) ( CLEAR ?auto_658043 ) ( not ( = ?auto_658041 ?auto_658044 ) ) ( not ( = ?auto_658043 ?auto_658044 ) ) ( not ( = ?auto_658042 ?auto_658044 ) ) ( SURFACE-AT ?auto_658042 ?auto_658045 ) ( CLEAR ?auto_658042 ) ( IS-CRATE ?auto_658041 ) ( AVAILABLE ?auto_658047 ) ( AVAILABLE ?auto_658048 ) ( SURFACE-AT ?auto_658041 ?auto_658050 ) ( ON ?auto_658041 ?auto_658046 ) ( CLEAR ?auto_658041 ) ( not ( = ?auto_658041 ?auto_658046 ) ) ( not ( = ?auto_658043 ?auto_658046 ) ) ( not ( = ?auto_658042 ?auto_658046 ) ) ( not ( = ?auto_658044 ?auto_658046 ) ) ( TRUCK-AT ?auto_658049 ?auto_658045 ) ( ON ?auto_658038 ?auto_658037 ) ( ON ?auto_658039 ?auto_658038 ) ( ON ?auto_658036 ?auto_658039 ) ( ON ?auto_658040 ?auto_658036 ) ( ON ?auto_658042 ?auto_658040 ) ( not ( = ?auto_658037 ?auto_658038 ) ) ( not ( = ?auto_658037 ?auto_658039 ) ) ( not ( = ?auto_658037 ?auto_658036 ) ) ( not ( = ?auto_658037 ?auto_658040 ) ) ( not ( = ?auto_658037 ?auto_658042 ) ) ( not ( = ?auto_658037 ?auto_658041 ) ) ( not ( = ?auto_658037 ?auto_658043 ) ) ( not ( = ?auto_658037 ?auto_658044 ) ) ( not ( = ?auto_658037 ?auto_658046 ) ) ( not ( = ?auto_658038 ?auto_658039 ) ) ( not ( = ?auto_658038 ?auto_658036 ) ) ( not ( = ?auto_658038 ?auto_658040 ) ) ( not ( = ?auto_658038 ?auto_658042 ) ) ( not ( = ?auto_658038 ?auto_658041 ) ) ( not ( = ?auto_658038 ?auto_658043 ) ) ( not ( = ?auto_658038 ?auto_658044 ) ) ( not ( = ?auto_658038 ?auto_658046 ) ) ( not ( = ?auto_658039 ?auto_658036 ) ) ( not ( = ?auto_658039 ?auto_658040 ) ) ( not ( = ?auto_658039 ?auto_658042 ) ) ( not ( = ?auto_658039 ?auto_658041 ) ) ( not ( = ?auto_658039 ?auto_658043 ) ) ( not ( = ?auto_658039 ?auto_658044 ) ) ( not ( = ?auto_658039 ?auto_658046 ) ) ( not ( = ?auto_658036 ?auto_658040 ) ) ( not ( = ?auto_658036 ?auto_658042 ) ) ( not ( = ?auto_658036 ?auto_658041 ) ) ( not ( = ?auto_658036 ?auto_658043 ) ) ( not ( = ?auto_658036 ?auto_658044 ) ) ( not ( = ?auto_658036 ?auto_658046 ) ) ( not ( = ?auto_658040 ?auto_658042 ) ) ( not ( = ?auto_658040 ?auto_658041 ) ) ( not ( = ?auto_658040 ?auto_658043 ) ) ( not ( = ?auto_658040 ?auto_658044 ) ) ( not ( = ?auto_658040 ?auto_658046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658042 ?auto_658041 ?auto_658043 )
      ( MAKE-7CRATE-VERIFY ?auto_658037 ?auto_658038 ?auto_658039 ?auto_658036 ?auto_658040 ?auto_658042 ?auto_658041 ?auto_658043 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_658052 - SURFACE
      ?auto_658053 - SURFACE
      ?auto_658054 - SURFACE
      ?auto_658051 - SURFACE
      ?auto_658055 - SURFACE
      ?auto_658057 - SURFACE
      ?auto_658056 - SURFACE
      ?auto_658058 - SURFACE
      ?auto_658059 - SURFACE
    )
    :vars
    (
      ?auto_658063 - HOIST
      ?auto_658061 - PLACE
      ?auto_658066 - PLACE
      ?auto_658064 - HOIST
      ?auto_658060 - SURFACE
      ?auto_658062 - SURFACE
      ?auto_658065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658063 ?auto_658061 ) ( IS-CRATE ?auto_658059 ) ( not ( = ?auto_658058 ?auto_658059 ) ) ( not ( = ?auto_658056 ?auto_658058 ) ) ( not ( = ?auto_658056 ?auto_658059 ) ) ( not ( = ?auto_658066 ?auto_658061 ) ) ( HOIST-AT ?auto_658064 ?auto_658066 ) ( not ( = ?auto_658063 ?auto_658064 ) ) ( SURFACE-AT ?auto_658059 ?auto_658066 ) ( ON ?auto_658059 ?auto_658060 ) ( CLEAR ?auto_658059 ) ( not ( = ?auto_658058 ?auto_658060 ) ) ( not ( = ?auto_658059 ?auto_658060 ) ) ( not ( = ?auto_658056 ?auto_658060 ) ) ( SURFACE-AT ?auto_658056 ?auto_658061 ) ( CLEAR ?auto_658056 ) ( IS-CRATE ?auto_658058 ) ( AVAILABLE ?auto_658063 ) ( AVAILABLE ?auto_658064 ) ( SURFACE-AT ?auto_658058 ?auto_658066 ) ( ON ?auto_658058 ?auto_658062 ) ( CLEAR ?auto_658058 ) ( not ( = ?auto_658058 ?auto_658062 ) ) ( not ( = ?auto_658059 ?auto_658062 ) ) ( not ( = ?auto_658056 ?auto_658062 ) ) ( not ( = ?auto_658060 ?auto_658062 ) ) ( TRUCK-AT ?auto_658065 ?auto_658061 ) ( ON ?auto_658053 ?auto_658052 ) ( ON ?auto_658054 ?auto_658053 ) ( ON ?auto_658051 ?auto_658054 ) ( ON ?auto_658055 ?auto_658051 ) ( ON ?auto_658057 ?auto_658055 ) ( ON ?auto_658056 ?auto_658057 ) ( not ( = ?auto_658052 ?auto_658053 ) ) ( not ( = ?auto_658052 ?auto_658054 ) ) ( not ( = ?auto_658052 ?auto_658051 ) ) ( not ( = ?auto_658052 ?auto_658055 ) ) ( not ( = ?auto_658052 ?auto_658057 ) ) ( not ( = ?auto_658052 ?auto_658056 ) ) ( not ( = ?auto_658052 ?auto_658058 ) ) ( not ( = ?auto_658052 ?auto_658059 ) ) ( not ( = ?auto_658052 ?auto_658060 ) ) ( not ( = ?auto_658052 ?auto_658062 ) ) ( not ( = ?auto_658053 ?auto_658054 ) ) ( not ( = ?auto_658053 ?auto_658051 ) ) ( not ( = ?auto_658053 ?auto_658055 ) ) ( not ( = ?auto_658053 ?auto_658057 ) ) ( not ( = ?auto_658053 ?auto_658056 ) ) ( not ( = ?auto_658053 ?auto_658058 ) ) ( not ( = ?auto_658053 ?auto_658059 ) ) ( not ( = ?auto_658053 ?auto_658060 ) ) ( not ( = ?auto_658053 ?auto_658062 ) ) ( not ( = ?auto_658054 ?auto_658051 ) ) ( not ( = ?auto_658054 ?auto_658055 ) ) ( not ( = ?auto_658054 ?auto_658057 ) ) ( not ( = ?auto_658054 ?auto_658056 ) ) ( not ( = ?auto_658054 ?auto_658058 ) ) ( not ( = ?auto_658054 ?auto_658059 ) ) ( not ( = ?auto_658054 ?auto_658060 ) ) ( not ( = ?auto_658054 ?auto_658062 ) ) ( not ( = ?auto_658051 ?auto_658055 ) ) ( not ( = ?auto_658051 ?auto_658057 ) ) ( not ( = ?auto_658051 ?auto_658056 ) ) ( not ( = ?auto_658051 ?auto_658058 ) ) ( not ( = ?auto_658051 ?auto_658059 ) ) ( not ( = ?auto_658051 ?auto_658060 ) ) ( not ( = ?auto_658051 ?auto_658062 ) ) ( not ( = ?auto_658055 ?auto_658057 ) ) ( not ( = ?auto_658055 ?auto_658056 ) ) ( not ( = ?auto_658055 ?auto_658058 ) ) ( not ( = ?auto_658055 ?auto_658059 ) ) ( not ( = ?auto_658055 ?auto_658060 ) ) ( not ( = ?auto_658055 ?auto_658062 ) ) ( not ( = ?auto_658057 ?auto_658056 ) ) ( not ( = ?auto_658057 ?auto_658058 ) ) ( not ( = ?auto_658057 ?auto_658059 ) ) ( not ( = ?auto_658057 ?auto_658060 ) ) ( not ( = ?auto_658057 ?auto_658062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658056 ?auto_658058 ?auto_658059 )
      ( MAKE-8CRATE-VERIFY ?auto_658052 ?auto_658053 ?auto_658054 ?auto_658051 ?auto_658055 ?auto_658057 ?auto_658056 ?auto_658058 ?auto_658059 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_658068 - SURFACE
      ?auto_658069 - SURFACE
      ?auto_658070 - SURFACE
      ?auto_658067 - SURFACE
      ?auto_658071 - SURFACE
      ?auto_658073 - SURFACE
      ?auto_658072 - SURFACE
      ?auto_658074 - SURFACE
      ?auto_658075 - SURFACE
      ?auto_658076 - SURFACE
    )
    :vars
    (
      ?auto_658080 - HOIST
      ?auto_658078 - PLACE
      ?auto_658083 - PLACE
      ?auto_658081 - HOIST
      ?auto_658077 - SURFACE
      ?auto_658079 - SURFACE
      ?auto_658082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658080 ?auto_658078 ) ( IS-CRATE ?auto_658076 ) ( not ( = ?auto_658075 ?auto_658076 ) ) ( not ( = ?auto_658074 ?auto_658075 ) ) ( not ( = ?auto_658074 ?auto_658076 ) ) ( not ( = ?auto_658083 ?auto_658078 ) ) ( HOIST-AT ?auto_658081 ?auto_658083 ) ( not ( = ?auto_658080 ?auto_658081 ) ) ( SURFACE-AT ?auto_658076 ?auto_658083 ) ( ON ?auto_658076 ?auto_658077 ) ( CLEAR ?auto_658076 ) ( not ( = ?auto_658075 ?auto_658077 ) ) ( not ( = ?auto_658076 ?auto_658077 ) ) ( not ( = ?auto_658074 ?auto_658077 ) ) ( SURFACE-AT ?auto_658074 ?auto_658078 ) ( CLEAR ?auto_658074 ) ( IS-CRATE ?auto_658075 ) ( AVAILABLE ?auto_658080 ) ( AVAILABLE ?auto_658081 ) ( SURFACE-AT ?auto_658075 ?auto_658083 ) ( ON ?auto_658075 ?auto_658079 ) ( CLEAR ?auto_658075 ) ( not ( = ?auto_658075 ?auto_658079 ) ) ( not ( = ?auto_658076 ?auto_658079 ) ) ( not ( = ?auto_658074 ?auto_658079 ) ) ( not ( = ?auto_658077 ?auto_658079 ) ) ( TRUCK-AT ?auto_658082 ?auto_658078 ) ( ON ?auto_658069 ?auto_658068 ) ( ON ?auto_658070 ?auto_658069 ) ( ON ?auto_658067 ?auto_658070 ) ( ON ?auto_658071 ?auto_658067 ) ( ON ?auto_658073 ?auto_658071 ) ( ON ?auto_658072 ?auto_658073 ) ( ON ?auto_658074 ?auto_658072 ) ( not ( = ?auto_658068 ?auto_658069 ) ) ( not ( = ?auto_658068 ?auto_658070 ) ) ( not ( = ?auto_658068 ?auto_658067 ) ) ( not ( = ?auto_658068 ?auto_658071 ) ) ( not ( = ?auto_658068 ?auto_658073 ) ) ( not ( = ?auto_658068 ?auto_658072 ) ) ( not ( = ?auto_658068 ?auto_658074 ) ) ( not ( = ?auto_658068 ?auto_658075 ) ) ( not ( = ?auto_658068 ?auto_658076 ) ) ( not ( = ?auto_658068 ?auto_658077 ) ) ( not ( = ?auto_658068 ?auto_658079 ) ) ( not ( = ?auto_658069 ?auto_658070 ) ) ( not ( = ?auto_658069 ?auto_658067 ) ) ( not ( = ?auto_658069 ?auto_658071 ) ) ( not ( = ?auto_658069 ?auto_658073 ) ) ( not ( = ?auto_658069 ?auto_658072 ) ) ( not ( = ?auto_658069 ?auto_658074 ) ) ( not ( = ?auto_658069 ?auto_658075 ) ) ( not ( = ?auto_658069 ?auto_658076 ) ) ( not ( = ?auto_658069 ?auto_658077 ) ) ( not ( = ?auto_658069 ?auto_658079 ) ) ( not ( = ?auto_658070 ?auto_658067 ) ) ( not ( = ?auto_658070 ?auto_658071 ) ) ( not ( = ?auto_658070 ?auto_658073 ) ) ( not ( = ?auto_658070 ?auto_658072 ) ) ( not ( = ?auto_658070 ?auto_658074 ) ) ( not ( = ?auto_658070 ?auto_658075 ) ) ( not ( = ?auto_658070 ?auto_658076 ) ) ( not ( = ?auto_658070 ?auto_658077 ) ) ( not ( = ?auto_658070 ?auto_658079 ) ) ( not ( = ?auto_658067 ?auto_658071 ) ) ( not ( = ?auto_658067 ?auto_658073 ) ) ( not ( = ?auto_658067 ?auto_658072 ) ) ( not ( = ?auto_658067 ?auto_658074 ) ) ( not ( = ?auto_658067 ?auto_658075 ) ) ( not ( = ?auto_658067 ?auto_658076 ) ) ( not ( = ?auto_658067 ?auto_658077 ) ) ( not ( = ?auto_658067 ?auto_658079 ) ) ( not ( = ?auto_658071 ?auto_658073 ) ) ( not ( = ?auto_658071 ?auto_658072 ) ) ( not ( = ?auto_658071 ?auto_658074 ) ) ( not ( = ?auto_658071 ?auto_658075 ) ) ( not ( = ?auto_658071 ?auto_658076 ) ) ( not ( = ?auto_658071 ?auto_658077 ) ) ( not ( = ?auto_658071 ?auto_658079 ) ) ( not ( = ?auto_658073 ?auto_658072 ) ) ( not ( = ?auto_658073 ?auto_658074 ) ) ( not ( = ?auto_658073 ?auto_658075 ) ) ( not ( = ?auto_658073 ?auto_658076 ) ) ( not ( = ?auto_658073 ?auto_658077 ) ) ( not ( = ?auto_658073 ?auto_658079 ) ) ( not ( = ?auto_658072 ?auto_658074 ) ) ( not ( = ?auto_658072 ?auto_658075 ) ) ( not ( = ?auto_658072 ?auto_658076 ) ) ( not ( = ?auto_658072 ?auto_658077 ) ) ( not ( = ?auto_658072 ?auto_658079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658074 ?auto_658075 ?auto_658076 )
      ( MAKE-9CRATE-VERIFY ?auto_658068 ?auto_658069 ?auto_658070 ?auto_658067 ?auto_658071 ?auto_658073 ?auto_658072 ?auto_658074 ?auto_658075 ?auto_658076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_658084 - SURFACE
      ?auto_658085 - SURFACE
    )
    :vars
    (
      ?auto_658089 - HOIST
      ?auto_658087 - PLACE
      ?auto_658093 - SURFACE
      ?auto_658092 - PLACE
      ?auto_658090 - HOIST
      ?auto_658086 - SURFACE
      ?auto_658088 - SURFACE
      ?auto_658091 - TRUCK
      ?auto_658094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_658089 ?auto_658087 ) ( IS-CRATE ?auto_658085 ) ( not ( = ?auto_658084 ?auto_658085 ) ) ( not ( = ?auto_658093 ?auto_658084 ) ) ( not ( = ?auto_658093 ?auto_658085 ) ) ( not ( = ?auto_658092 ?auto_658087 ) ) ( HOIST-AT ?auto_658090 ?auto_658092 ) ( not ( = ?auto_658089 ?auto_658090 ) ) ( SURFACE-AT ?auto_658085 ?auto_658092 ) ( ON ?auto_658085 ?auto_658086 ) ( CLEAR ?auto_658085 ) ( not ( = ?auto_658084 ?auto_658086 ) ) ( not ( = ?auto_658085 ?auto_658086 ) ) ( not ( = ?auto_658093 ?auto_658086 ) ) ( IS-CRATE ?auto_658084 ) ( AVAILABLE ?auto_658090 ) ( SURFACE-AT ?auto_658084 ?auto_658092 ) ( ON ?auto_658084 ?auto_658088 ) ( CLEAR ?auto_658084 ) ( not ( = ?auto_658084 ?auto_658088 ) ) ( not ( = ?auto_658085 ?auto_658088 ) ) ( not ( = ?auto_658093 ?auto_658088 ) ) ( not ( = ?auto_658086 ?auto_658088 ) ) ( TRUCK-AT ?auto_658091 ?auto_658087 ) ( SURFACE-AT ?auto_658094 ?auto_658087 ) ( CLEAR ?auto_658094 ) ( LIFTING ?auto_658089 ?auto_658093 ) ( IS-CRATE ?auto_658093 ) ( not ( = ?auto_658094 ?auto_658093 ) ) ( not ( = ?auto_658084 ?auto_658094 ) ) ( not ( = ?auto_658085 ?auto_658094 ) ) ( not ( = ?auto_658086 ?auto_658094 ) ) ( not ( = ?auto_658088 ?auto_658094 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_658094 ?auto_658093 )
      ( MAKE-2CRATE ?auto_658093 ?auto_658084 ?auto_658085 )
      ( MAKE-1CRATE-VERIFY ?auto_658084 ?auto_658085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_658095 - SURFACE
      ?auto_658096 - SURFACE
      ?auto_658097 - SURFACE
    )
    :vars
    (
      ?auto_658099 - HOIST
      ?auto_658101 - PLACE
      ?auto_658103 - PLACE
      ?auto_658102 - HOIST
      ?auto_658104 - SURFACE
      ?auto_658105 - SURFACE
      ?auto_658100 - TRUCK
      ?auto_658098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_658099 ?auto_658101 ) ( IS-CRATE ?auto_658097 ) ( not ( = ?auto_658096 ?auto_658097 ) ) ( not ( = ?auto_658095 ?auto_658096 ) ) ( not ( = ?auto_658095 ?auto_658097 ) ) ( not ( = ?auto_658103 ?auto_658101 ) ) ( HOIST-AT ?auto_658102 ?auto_658103 ) ( not ( = ?auto_658099 ?auto_658102 ) ) ( SURFACE-AT ?auto_658097 ?auto_658103 ) ( ON ?auto_658097 ?auto_658104 ) ( CLEAR ?auto_658097 ) ( not ( = ?auto_658096 ?auto_658104 ) ) ( not ( = ?auto_658097 ?auto_658104 ) ) ( not ( = ?auto_658095 ?auto_658104 ) ) ( IS-CRATE ?auto_658096 ) ( AVAILABLE ?auto_658102 ) ( SURFACE-AT ?auto_658096 ?auto_658103 ) ( ON ?auto_658096 ?auto_658105 ) ( CLEAR ?auto_658096 ) ( not ( = ?auto_658096 ?auto_658105 ) ) ( not ( = ?auto_658097 ?auto_658105 ) ) ( not ( = ?auto_658095 ?auto_658105 ) ) ( not ( = ?auto_658104 ?auto_658105 ) ) ( TRUCK-AT ?auto_658100 ?auto_658101 ) ( SURFACE-AT ?auto_658098 ?auto_658101 ) ( CLEAR ?auto_658098 ) ( LIFTING ?auto_658099 ?auto_658095 ) ( IS-CRATE ?auto_658095 ) ( not ( = ?auto_658098 ?auto_658095 ) ) ( not ( = ?auto_658096 ?auto_658098 ) ) ( not ( = ?auto_658097 ?auto_658098 ) ) ( not ( = ?auto_658104 ?auto_658098 ) ) ( not ( = ?auto_658105 ?auto_658098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_658096 ?auto_658097 )
      ( MAKE-2CRATE-VERIFY ?auto_658095 ?auto_658096 ?auto_658097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_658107 - SURFACE
      ?auto_658108 - SURFACE
      ?auto_658109 - SURFACE
      ?auto_658106 - SURFACE
    )
    :vars
    (
      ?auto_658114 - HOIST
      ?auto_658111 - PLACE
      ?auto_658112 - PLACE
      ?auto_658115 - HOIST
      ?auto_658113 - SURFACE
      ?auto_658110 - SURFACE
      ?auto_658116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658114 ?auto_658111 ) ( IS-CRATE ?auto_658106 ) ( not ( = ?auto_658109 ?auto_658106 ) ) ( not ( = ?auto_658108 ?auto_658109 ) ) ( not ( = ?auto_658108 ?auto_658106 ) ) ( not ( = ?auto_658112 ?auto_658111 ) ) ( HOIST-AT ?auto_658115 ?auto_658112 ) ( not ( = ?auto_658114 ?auto_658115 ) ) ( SURFACE-AT ?auto_658106 ?auto_658112 ) ( ON ?auto_658106 ?auto_658113 ) ( CLEAR ?auto_658106 ) ( not ( = ?auto_658109 ?auto_658113 ) ) ( not ( = ?auto_658106 ?auto_658113 ) ) ( not ( = ?auto_658108 ?auto_658113 ) ) ( IS-CRATE ?auto_658109 ) ( AVAILABLE ?auto_658115 ) ( SURFACE-AT ?auto_658109 ?auto_658112 ) ( ON ?auto_658109 ?auto_658110 ) ( CLEAR ?auto_658109 ) ( not ( = ?auto_658109 ?auto_658110 ) ) ( not ( = ?auto_658106 ?auto_658110 ) ) ( not ( = ?auto_658108 ?auto_658110 ) ) ( not ( = ?auto_658113 ?auto_658110 ) ) ( TRUCK-AT ?auto_658116 ?auto_658111 ) ( SURFACE-AT ?auto_658107 ?auto_658111 ) ( CLEAR ?auto_658107 ) ( LIFTING ?auto_658114 ?auto_658108 ) ( IS-CRATE ?auto_658108 ) ( not ( = ?auto_658107 ?auto_658108 ) ) ( not ( = ?auto_658109 ?auto_658107 ) ) ( not ( = ?auto_658106 ?auto_658107 ) ) ( not ( = ?auto_658113 ?auto_658107 ) ) ( not ( = ?auto_658110 ?auto_658107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658108 ?auto_658109 ?auto_658106 )
      ( MAKE-3CRATE-VERIFY ?auto_658107 ?auto_658108 ?auto_658109 ?auto_658106 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_658118 - SURFACE
      ?auto_658119 - SURFACE
      ?auto_658120 - SURFACE
      ?auto_658117 - SURFACE
      ?auto_658121 - SURFACE
    )
    :vars
    (
      ?auto_658126 - HOIST
      ?auto_658123 - PLACE
      ?auto_658124 - PLACE
      ?auto_658127 - HOIST
      ?auto_658125 - SURFACE
      ?auto_658122 - SURFACE
      ?auto_658128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658126 ?auto_658123 ) ( IS-CRATE ?auto_658121 ) ( not ( = ?auto_658117 ?auto_658121 ) ) ( not ( = ?auto_658120 ?auto_658117 ) ) ( not ( = ?auto_658120 ?auto_658121 ) ) ( not ( = ?auto_658124 ?auto_658123 ) ) ( HOIST-AT ?auto_658127 ?auto_658124 ) ( not ( = ?auto_658126 ?auto_658127 ) ) ( SURFACE-AT ?auto_658121 ?auto_658124 ) ( ON ?auto_658121 ?auto_658125 ) ( CLEAR ?auto_658121 ) ( not ( = ?auto_658117 ?auto_658125 ) ) ( not ( = ?auto_658121 ?auto_658125 ) ) ( not ( = ?auto_658120 ?auto_658125 ) ) ( IS-CRATE ?auto_658117 ) ( AVAILABLE ?auto_658127 ) ( SURFACE-AT ?auto_658117 ?auto_658124 ) ( ON ?auto_658117 ?auto_658122 ) ( CLEAR ?auto_658117 ) ( not ( = ?auto_658117 ?auto_658122 ) ) ( not ( = ?auto_658121 ?auto_658122 ) ) ( not ( = ?auto_658120 ?auto_658122 ) ) ( not ( = ?auto_658125 ?auto_658122 ) ) ( TRUCK-AT ?auto_658128 ?auto_658123 ) ( SURFACE-AT ?auto_658119 ?auto_658123 ) ( CLEAR ?auto_658119 ) ( LIFTING ?auto_658126 ?auto_658120 ) ( IS-CRATE ?auto_658120 ) ( not ( = ?auto_658119 ?auto_658120 ) ) ( not ( = ?auto_658117 ?auto_658119 ) ) ( not ( = ?auto_658121 ?auto_658119 ) ) ( not ( = ?auto_658125 ?auto_658119 ) ) ( not ( = ?auto_658122 ?auto_658119 ) ) ( ON ?auto_658119 ?auto_658118 ) ( not ( = ?auto_658118 ?auto_658119 ) ) ( not ( = ?auto_658118 ?auto_658120 ) ) ( not ( = ?auto_658118 ?auto_658117 ) ) ( not ( = ?auto_658118 ?auto_658121 ) ) ( not ( = ?auto_658118 ?auto_658125 ) ) ( not ( = ?auto_658118 ?auto_658122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658120 ?auto_658117 ?auto_658121 )
      ( MAKE-4CRATE-VERIFY ?auto_658118 ?auto_658119 ?auto_658120 ?auto_658117 ?auto_658121 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_658130 - SURFACE
      ?auto_658131 - SURFACE
      ?auto_658132 - SURFACE
      ?auto_658129 - SURFACE
      ?auto_658133 - SURFACE
      ?auto_658134 - SURFACE
    )
    :vars
    (
      ?auto_658139 - HOIST
      ?auto_658136 - PLACE
      ?auto_658137 - PLACE
      ?auto_658140 - HOIST
      ?auto_658138 - SURFACE
      ?auto_658135 - SURFACE
      ?auto_658141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658139 ?auto_658136 ) ( IS-CRATE ?auto_658134 ) ( not ( = ?auto_658133 ?auto_658134 ) ) ( not ( = ?auto_658129 ?auto_658133 ) ) ( not ( = ?auto_658129 ?auto_658134 ) ) ( not ( = ?auto_658137 ?auto_658136 ) ) ( HOIST-AT ?auto_658140 ?auto_658137 ) ( not ( = ?auto_658139 ?auto_658140 ) ) ( SURFACE-AT ?auto_658134 ?auto_658137 ) ( ON ?auto_658134 ?auto_658138 ) ( CLEAR ?auto_658134 ) ( not ( = ?auto_658133 ?auto_658138 ) ) ( not ( = ?auto_658134 ?auto_658138 ) ) ( not ( = ?auto_658129 ?auto_658138 ) ) ( IS-CRATE ?auto_658133 ) ( AVAILABLE ?auto_658140 ) ( SURFACE-AT ?auto_658133 ?auto_658137 ) ( ON ?auto_658133 ?auto_658135 ) ( CLEAR ?auto_658133 ) ( not ( = ?auto_658133 ?auto_658135 ) ) ( not ( = ?auto_658134 ?auto_658135 ) ) ( not ( = ?auto_658129 ?auto_658135 ) ) ( not ( = ?auto_658138 ?auto_658135 ) ) ( TRUCK-AT ?auto_658141 ?auto_658136 ) ( SURFACE-AT ?auto_658132 ?auto_658136 ) ( CLEAR ?auto_658132 ) ( LIFTING ?auto_658139 ?auto_658129 ) ( IS-CRATE ?auto_658129 ) ( not ( = ?auto_658132 ?auto_658129 ) ) ( not ( = ?auto_658133 ?auto_658132 ) ) ( not ( = ?auto_658134 ?auto_658132 ) ) ( not ( = ?auto_658138 ?auto_658132 ) ) ( not ( = ?auto_658135 ?auto_658132 ) ) ( ON ?auto_658131 ?auto_658130 ) ( ON ?auto_658132 ?auto_658131 ) ( not ( = ?auto_658130 ?auto_658131 ) ) ( not ( = ?auto_658130 ?auto_658132 ) ) ( not ( = ?auto_658130 ?auto_658129 ) ) ( not ( = ?auto_658130 ?auto_658133 ) ) ( not ( = ?auto_658130 ?auto_658134 ) ) ( not ( = ?auto_658130 ?auto_658138 ) ) ( not ( = ?auto_658130 ?auto_658135 ) ) ( not ( = ?auto_658131 ?auto_658132 ) ) ( not ( = ?auto_658131 ?auto_658129 ) ) ( not ( = ?auto_658131 ?auto_658133 ) ) ( not ( = ?auto_658131 ?auto_658134 ) ) ( not ( = ?auto_658131 ?auto_658138 ) ) ( not ( = ?auto_658131 ?auto_658135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658129 ?auto_658133 ?auto_658134 )
      ( MAKE-5CRATE-VERIFY ?auto_658130 ?auto_658131 ?auto_658132 ?auto_658129 ?auto_658133 ?auto_658134 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_658143 - SURFACE
      ?auto_658144 - SURFACE
      ?auto_658145 - SURFACE
      ?auto_658142 - SURFACE
      ?auto_658146 - SURFACE
      ?auto_658148 - SURFACE
      ?auto_658147 - SURFACE
    )
    :vars
    (
      ?auto_658153 - HOIST
      ?auto_658150 - PLACE
      ?auto_658151 - PLACE
      ?auto_658154 - HOIST
      ?auto_658152 - SURFACE
      ?auto_658149 - SURFACE
      ?auto_658155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658153 ?auto_658150 ) ( IS-CRATE ?auto_658147 ) ( not ( = ?auto_658148 ?auto_658147 ) ) ( not ( = ?auto_658146 ?auto_658148 ) ) ( not ( = ?auto_658146 ?auto_658147 ) ) ( not ( = ?auto_658151 ?auto_658150 ) ) ( HOIST-AT ?auto_658154 ?auto_658151 ) ( not ( = ?auto_658153 ?auto_658154 ) ) ( SURFACE-AT ?auto_658147 ?auto_658151 ) ( ON ?auto_658147 ?auto_658152 ) ( CLEAR ?auto_658147 ) ( not ( = ?auto_658148 ?auto_658152 ) ) ( not ( = ?auto_658147 ?auto_658152 ) ) ( not ( = ?auto_658146 ?auto_658152 ) ) ( IS-CRATE ?auto_658148 ) ( AVAILABLE ?auto_658154 ) ( SURFACE-AT ?auto_658148 ?auto_658151 ) ( ON ?auto_658148 ?auto_658149 ) ( CLEAR ?auto_658148 ) ( not ( = ?auto_658148 ?auto_658149 ) ) ( not ( = ?auto_658147 ?auto_658149 ) ) ( not ( = ?auto_658146 ?auto_658149 ) ) ( not ( = ?auto_658152 ?auto_658149 ) ) ( TRUCK-AT ?auto_658155 ?auto_658150 ) ( SURFACE-AT ?auto_658142 ?auto_658150 ) ( CLEAR ?auto_658142 ) ( LIFTING ?auto_658153 ?auto_658146 ) ( IS-CRATE ?auto_658146 ) ( not ( = ?auto_658142 ?auto_658146 ) ) ( not ( = ?auto_658148 ?auto_658142 ) ) ( not ( = ?auto_658147 ?auto_658142 ) ) ( not ( = ?auto_658152 ?auto_658142 ) ) ( not ( = ?auto_658149 ?auto_658142 ) ) ( ON ?auto_658144 ?auto_658143 ) ( ON ?auto_658145 ?auto_658144 ) ( ON ?auto_658142 ?auto_658145 ) ( not ( = ?auto_658143 ?auto_658144 ) ) ( not ( = ?auto_658143 ?auto_658145 ) ) ( not ( = ?auto_658143 ?auto_658142 ) ) ( not ( = ?auto_658143 ?auto_658146 ) ) ( not ( = ?auto_658143 ?auto_658148 ) ) ( not ( = ?auto_658143 ?auto_658147 ) ) ( not ( = ?auto_658143 ?auto_658152 ) ) ( not ( = ?auto_658143 ?auto_658149 ) ) ( not ( = ?auto_658144 ?auto_658145 ) ) ( not ( = ?auto_658144 ?auto_658142 ) ) ( not ( = ?auto_658144 ?auto_658146 ) ) ( not ( = ?auto_658144 ?auto_658148 ) ) ( not ( = ?auto_658144 ?auto_658147 ) ) ( not ( = ?auto_658144 ?auto_658152 ) ) ( not ( = ?auto_658144 ?auto_658149 ) ) ( not ( = ?auto_658145 ?auto_658142 ) ) ( not ( = ?auto_658145 ?auto_658146 ) ) ( not ( = ?auto_658145 ?auto_658148 ) ) ( not ( = ?auto_658145 ?auto_658147 ) ) ( not ( = ?auto_658145 ?auto_658152 ) ) ( not ( = ?auto_658145 ?auto_658149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658146 ?auto_658148 ?auto_658147 )
      ( MAKE-6CRATE-VERIFY ?auto_658143 ?auto_658144 ?auto_658145 ?auto_658142 ?auto_658146 ?auto_658148 ?auto_658147 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_658157 - SURFACE
      ?auto_658158 - SURFACE
      ?auto_658159 - SURFACE
      ?auto_658156 - SURFACE
      ?auto_658160 - SURFACE
      ?auto_658162 - SURFACE
      ?auto_658161 - SURFACE
      ?auto_658163 - SURFACE
    )
    :vars
    (
      ?auto_658168 - HOIST
      ?auto_658165 - PLACE
      ?auto_658166 - PLACE
      ?auto_658169 - HOIST
      ?auto_658167 - SURFACE
      ?auto_658164 - SURFACE
      ?auto_658170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658168 ?auto_658165 ) ( IS-CRATE ?auto_658163 ) ( not ( = ?auto_658161 ?auto_658163 ) ) ( not ( = ?auto_658162 ?auto_658161 ) ) ( not ( = ?auto_658162 ?auto_658163 ) ) ( not ( = ?auto_658166 ?auto_658165 ) ) ( HOIST-AT ?auto_658169 ?auto_658166 ) ( not ( = ?auto_658168 ?auto_658169 ) ) ( SURFACE-AT ?auto_658163 ?auto_658166 ) ( ON ?auto_658163 ?auto_658167 ) ( CLEAR ?auto_658163 ) ( not ( = ?auto_658161 ?auto_658167 ) ) ( not ( = ?auto_658163 ?auto_658167 ) ) ( not ( = ?auto_658162 ?auto_658167 ) ) ( IS-CRATE ?auto_658161 ) ( AVAILABLE ?auto_658169 ) ( SURFACE-AT ?auto_658161 ?auto_658166 ) ( ON ?auto_658161 ?auto_658164 ) ( CLEAR ?auto_658161 ) ( not ( = ?auto_658161 ?auto_658164 ) ) ( not ( = ?auto_658163 ?auto_658164 ) ) ( not ( = ?auto_658162 ?auto_658164 ) ) ( not ( = ?auto_658167 ?auto_658164 ) ) ( TRUCK-AT ?auto_658170 ?auto_658165 ) ( SURFACE-AT ?auto_658160 ?auto_658165 ) ( CLEAR ?auto_658160 ) ( LIFTING ?auto_658168 ?auto_658162 ) ( IS-CRATE ?auto_658162 ) ( not ( = ?auto_658160 ?auto_658162 ) ) ( not ( = ?auto_658161 ?auto_658160 ) ) ( not ( = ?auto_658163 ?auto_658160 ) ) ( not ( = ?auto_658167 ?auto_658160 ) ) ( not ( = ?auto_658164 ?auto_658160 ) ) ( ON ?auto_658158 ?auto_658157 ) ( ON ?auto_658159 ?auto_658158 ) ( ON ?auto_658156 ?auto_658159 ) ( ON ?auto_658160 ?auto_658156 ) ( not ( = ?auto_658157 ?auto_658158 ) ) ( not ( = ?auto_658157 ?auto_658159 ) ) ( not ( = ?auto_658157 ?auto_658156 ) ) ( not ( = ?auto_658157 ?auto_658160 ) ) ( not ( = ?auto_658157 ?auto_658162 ) ) ( not ( = ?auto_658157 ?auto_658161 ) ) ( not ( = ?auto_658157 ?auto_658163 ) ) ( not ( = ?auto_658157 ?auto_658167 ) ) ( not ( = ?auto_658157 ?auto_658164 ) ) ( not ( = ?auto_658158 ?auto_658159 ) ) ( not ( = ?auto_658158 ?auto_658156 ) ) ( not ( = ?auto_658158 ?auto_658160 ) ) ( not ( = ?auto_658158 ?auto_658162 ) ) ( not ( = ?auto_658158 ?auto_658161 ) ) ( not ( = ?auto_658158 ?auto_658163 ) ) ( not ( = ?auto_658158 ?auto_658167 ) ) ( not ( = ?auto_658158 ?auto_658164 ) ) ( not ( = ?auto_658159 ?auto_658156 ) ) ( not ( = ?auto_658159 ?auto_658160 ) ) ( not ( = ?auto_658159 ?auto_658162 ) ) ( not ( = ?auto_658159 ?auto_658161 ) ) ( not ( = ?auto_658159 ?auto_658163 ) ) ( not ( = ?auto_658159 ?auto_658167 ) ) ( not ( = ?auto_658159 ?auto_658164 ) ) ( not ( = ?auto_658156 ?auto_658160 ) ) ( not ( = ?auto_658156 ?auto_658162 ) ) ( not ( = ?auto_658156 ?auto_658161 ) ) ( not ( = ?auto_658156 ?auto_658163 ) ) ( not ( = ?auto_658156 ?auto_658167 ) ) ( not ( = ?auto_658156 ?auto_658164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658162 ?auto_658161 ?auto_658163 )
      ( MAKE-7CRATE-VERIFY ?auto_658157 ?auto_658158 ?auto_658159 ?auto_658156 ?auto_658160 ?auto_658162 ?auto_658161 ?auto_658163 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_658172 - SURFACE
      ?auto_658173 - SURFACE
      ?auto_658174 - SURFACE
      ?auto_658171 - SURFACE
      ?auto_658175 - SURFACE
      ?auto_658177 - SURFACE
      ?auto_658176 - SURFACE
      ?auto_658178 - SURFACE
      ?auto_658179 - SURFACE
    )
    :vars
    (
      ?auto_658184 - HOIST
      ?auto_658181 - PLACE
      ?auto_658182 - PLACE
      ?auto_658185 - HOIST
      ?auto_658183 - SURFACE
      ?auto_658180 - SURFACE
      ?auto_658186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658184 ?auto_658181 ) ( IS-CRATE ?auto_658179 ) ( not ( = ?auto_658178 ?auto_658179 ) ) ( not ( = ?auto_658176 ?auto_658178 ) ) ( not ( = ?auto_658176 ?auto_658179 ) ) ( not ( = ?auto_658182 ?auto_658181 ) ) ( HOIST-AT ?auto_658185 ?auto_658182 ) ( not ( = ?auto_658184 ?auto_658185 ) ) ( SURFACE-AT ?auto_658179 ?auto_658182 ) ( ON ?auto_658179 ?auto_658183 ) ( CLEAR ?auto_658179 ) ( not ( = ?auto_658178 ?auto_658183 ) ) ( not ( = ?auto_658179 ?auto_658183 ) ) ( not ( = ?auto_658176 ?auto_658183 ) ) ( IS-CRATE ?auto_658178 ) ( AVAILABLE ?auto_658185 ) ( SURFACE-AT ?auto_658178 ?auto_658182 ) ( ON ?auto_658178 ?auto_658180 ) ( CLEAR ?auto_658178 ) ( not ( = ?auto_658178 ?auto_658180 ) ) ( not ( = ?auto_658179 ?auto_658180 ) ) ( not ( = ?auto_658176 ?auto_658180 ) ) ( not ( = ?auto_658183 ?auto_658180 ) ) ( TRUCK-AT ?auto_658186 ?auto_658181 ) ( SURFACE-AT ?auto_658177 ?auto_658181 ) ( CLEAR ?auto_658177 ) ( LIFTING ?auto_658184 ?auto_658176 ) ( IS-CRATE ?auto_658176 ) ( not ( = ?auto_658177 ?auto_658176 ) ) ( not ( = ?auto_658178 ?auto_658177 ) ) ( not ( = ?auto_658179 ?auto_658177 ) ) ( not ( = ?auto_658183 ?auto_658177 ) ) ( not ( = ?auto_658180 ?auto_658177 ) ) ( ON ?auto_658173 ?auto_658172 ) ( ON ?auto_658174 ?auto_658173 ) ( ON ?auto_658171 ?auto_658174 ) ( ON ?auto_658175 ?auto_658171 ) ( ON ?auto_658177 ?auto_658175 ) ( not ( = ?auto_658172 ?auto_658173 ) ) ( not ( = ?auto_658172 ?auto_658174 ) ) ( not ( = ?auto_658172 ?auto_658171 ) ) ( not ( = ?auto_658172 ?auto_658175 ) ) ( not ( = ?auto_658172 ?auto_658177 ) ) ( not ( = ?auto_658172 ?auto_658176 ) ) ( not ( = ?auto_658172 ?auto_658178 ) ) ( not ( = ?auto_658172 ?auto_658179 ) ) ( not ( = ?auto_658172 ?auto_658183 ) ) ( not ( = ?auto_658172 ?auto_658180 ) ) ( not ( = ?auto_658173 ?auto_658174 ) ) ( not ( = ?auto_658173 ?auto_658171 ) ) ( not ( = ?auto_658173 ?auto_658175 ) ) ( not ( = ?auto_658173 ?auto_658177 ) ) ( not ( = ?auto_658173 ?auto_658176 ) ) ( not ( = ?auto_658173 ?auto_658178 ) ) ( not ( = ?auto_658173 ?auto_658179 ) ) ( not ( = ?auto_658173 ?auto_658183 ) ) ( not ( = ?auto_658173 ?auto_658180 ) ) ( not ( = ?auto_658174 ?auto_658171 ) ) ( not ( = ?auto_658174 ?auto_658175 ) ) ( not ( = ?auto_658174 ?auto_658177 ) ) ( not ( = ?auto_658174 ?auto_658176 ) ) ( not ( = ?auto_658174 ?auto_658178 ) ) ( not ( = ?auto_658174 ?auto_658179 ) ) ( not ( = ?auto_658174 ?auto_658183 ) ) ( not ( = ?auto_658174 ?auto_658180 ) ) ( not ( = ?auto_658171 ?auto_658175 ) ) ( not ( = ?auto_658171 ?auto_658177 ) ) ( not ( = ?auto_658171 ?auto_658176 ) ) ( not ( = ?auto_658171 ?auto_658178 ) ) ( not ( = ?auto_658171 ?auto_658179 ) ) ( not ( = ?auto_658171 ?auto_658183 ) ) ( not ( = ?auto_658171 ?auto_658180 ) ) ( not ( = ?auto_658175 ?auto_658177 ) ) ( not ( = ?auto_658175 ?auto_658176 ) ) ( not ( = ?auto_658175 ?auto_658178 ) ) ( not ( = ?auto_658175 ?auto_658179 ) ) ( not ( = ?auto_658175 ?auto_658183 ) ) ( not ( = ?auto_658175 ?auto_658180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658176 ?auto_658178 ?auto_658179 )
      ( MAKE-8CRATE-VERIFY ?auto_658172 ?auto_658173 ?auto_658174 ?auto_658171 ?auto_658175 ?auto_658177 ?auto_658176 ?auto_658178 ?auto_658179 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_658188 - SURFACE
      ?auto_658189 - SURFACE
      ?auto_658190 - SURFACE
      ?auto_658187 - SURFACE
      ?auto_658191 - SURFACE
      ?auto_658193 - SURFACE
      ?auto_658192 - SURFACE
      ?auto_658194 - SURFACE
      ?auto_658195 - SURFACE
      ?auto_658196 - SURFACE
    )
    :vars
    (
      ?auto_658201 - HOIST
      ?auto_658198 - PLACE
      ?auto_658199 - PLACE
      ?auto_658202 - HOIST
      ?auto_658200 - SURFACE
      ?auto_658197 - SURFACE
      ?auto_658203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658201 ?auto_658198 ) ( IS-CRATE ?auto_658196 ) ( not ( = ?auto_658195 ?auto_658196 ) ) ( not ( = ?auto_658194 ?auto_658195 ) ) ( not ( = ?auto_658194 ?auto_658196 ) ) ( not ( = ?auto_658199 ?auto_658198 ) ) ( HOIST-AT ?auto_658202 ?auto_658199 ) ( not ( = ?auto_658201 ?auto_658202 ) ) ( SURFACE-AT ?auto_658196 ?auto_658199 ) ( ON ?auto_658196 ?auto_658200 ) ( CLEAR ?auto_658196 ) ( not ( = ?auto_658195 ?auto_658200 ) ) ( not ( = ?auto_658196 ?auto_658200 ) ) ( not ( = ?auto_658194 ?auto_658200 ) ) ( IS-CRATE ?auto_658195 ) ( AVAILABLE ?auto_658202 ) ( SURFACE-AT ?auto_658195 ?auto_658199 ) ( ON ?auto_658195 ?auto_658197 ) ( CLEAR ?auto_658195 ) ( not ( = ?auto_658195 ?auto_658197 ) ) ( not ( = ?auto_658196 ?auto_658197 ) ) ( not ( = ?auto_658194 ?auto_658197 ) ) ( not ( = ?auto_658200 ?auto_658197 ) ) ( TRUCK-AT ?auto_658203 ?auto_658198 ) ( SURFACE-AT ?auto_658192 ?auto_658198 ) ( CLEAR ?auto_658192 ) ( LIFTING ?auto_658201 ?auto_658194 ) ( IS-CRATE ?auto_658194 ) ( not ( = ?auto_658192 ?auto_658194 ) ) ( not ( = ?auto_658195 ?auto_658192 ) ) ( not ( = ?auto_658196 ?auto_658192 ) ) ( not ( = ?auto_658200 ?auto_658192 ) ) ( not ( = ?auto_658197 ?auto_658192 ) ) ( ON ?auto_658189 ?auto_658188 ) ( ON ?auto_658190 ?auto_658189 ) ( ON ?auto_658187 ?auto_658190 ) ( ON ?auto_658191 ?auto_658187 ) ( ON ?auto_658193 ?auto_658191 ) ( ON ?auto_658192 ?auto_658193 ) ( not ( = ?auto_658188 ?auto_658189 ) ) ( not ( = ?auto_658188 ?auto_658190 ) ) ( not ( = ?auto_658188 ?auto_658187 ) ) ( not ( = ?auto_658188 ?auto_658191 ) ) ( not ( = ?auto_658188 ?auto_658193 ) ) ( not ( = ?auto_658188 ?auto_658192 ) ) ( not ( = ?auto_658188 ?auto_658194 ) ) ( not ( = ?auto_658188 ?auto_658195 ) ) ( not ( = ?auto_658188 ?auto_658196 ) ) ( not ( = ?auto_658188 ?auto_658200 ) ) ( not ( = ?auto_658188 ?auto_658197 ) ) ( not ( = ?auto_658189 ?auto_658190 ) ) ( not ( = ?auto_658189 ?auto_658187 ) ) ( not ( = ?auto_658189 ?auto_658191 ) ) ( not ( = ?auto_658189 ?auto_658193 ) ) ( not ( = ?auto_658189 ?auto_658192 ) ) ( not ( = ?auto_658189 ?auto_658194 ) ) ( not ( = ?auto_658189 ?auto_658195 ) ) ( not ( = ?auto_658189 ?auto_658196 ) ) ( not ( = ?auto_658189 ?auto_658200 ) ) ( not ( = ?auto_658189 ?auto_658197 ) ) ( not ( = ?auto_658190 ?auto_658187 ) ) ( not ( = ?auto_658190 ?auto_658191 ) ) ( not ( = ?auto_658190 ?auto_658193 ) ) ( not ( = ?auto_658190 ?auto_658192 ) ) ( not ( = ?auto_658190 ?auto_658194 ) ) ( not ( = ?auto_658190 ?auto_658195 ) ) ( not ( = ?auto_658190 ?auto_658196 ) ) ( not ( = ?auto_658190 ?auto_658200 ) ) ( not ( = ?auto_658190 ?auto_658197 ) ) ( not ( = ?auto_658187 ?auto_658191 ) ) ( not ( = ?auto_658187 ?auto_658193 ) ) ( not ( = ?auto_658187 ?auto_658192 ) ) ( not ( = ?auto_658187 ?auto_658194 ) ) ( not ( = ?auto_658187 ?auto_658195 ) ) ( not ( = ?auto_658187 ?auto_658196 ) ) ( not ( = ?auto_658187 ?auto_658200 ) ) ( not ( = ?auto_658187 ?auto_658197 ) ) ( not ( = ?auto_658191 ?auto_658193 ) ) ( not ( = ?auto_658191 ?auto_658192 ) ) ( not ( = ?auto_658191 ?auto_658194 ) ) ( not ( = ?auto_658191 ?auto_658195 ) ) ( not ( = ?auto_658191 ?auto_658196 ) ) ( not ( = ?auto_658191 ?auto_658200 ) ) ( not ( = ?auto_658191 ?auto_658197 ) ) ( not ( = ?auto_658193 ?auto_658192 ) ) ( not ( = ?auto_658193 ?auto_658194 ) ) ( not ( = ?auto_658193 ?auto_658195 ) ) ( not ( = ?auto_658193 ?auto_658196 ) ) ( not ( = ?auto_658193 ?auto_658200 ) ) ( not ( = ?auto_658193 ?auto_658197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_658194 ?auto_658195 ?auto_658196 )
      ( MAKE-9CRATE-VERIFY ?auto_658188 ?auto_658189 ?auto_658190 ?auto_658187 ?auto_658191 ?auto_658193 ?auto_658192 ?auto_658194 ?auto_658195 ?auto_658196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_661873 - SURFACE
      ?auto_661874 - SURFACE
    )
    :vars
    (
      ?auto_661878 - HOIST
      ?auto_661880 - PLACE
      ?auto_661875 - SURFACE
      ?auto_661882 - PLACE
      ?auto_661877 - HOIST
      ?auto_661879 - SURFACE
      ?auto_661876 - TRUCK
      ?auto_661881 - SURFACE
      ?auto_661883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_661878 ?auto_661880 ) ( IS-CRATE ?auto_661874 ) ( not ( = ?auto_661873 ?auto_661874 ) ) ( not ( = ?auto_661875 ?auto_661873 ) ) ( not ( = ?auto_661875 ?auto_661874 ) ) ( not ( = ?auto_661882 ?auto_661880 ) ) ( HOIST-AT ?auto_661877 ?auto_661882 ) ( not ( = ?auto_661878 ?auto_661877 ) ) ( SURFACE-AT ?auto_661874 ?auto_661882 ) ( ON ?auto_661874 ?auto_661879 ) ( CLEAR ?auto_661874 ) ( not ( = ?auto_661873 ?auto_661879 ) ) ( not ( = ?auto_661874 ?auto_661879 ) ) ( not ( = ?auto_661875 ?auto_661879 ) ) ( SURFACE-AT ?auto_661875 ?auto_661880 ) ( CLEAR ?auto_661875 ) ( IS-CRATE ?auto_661873 ) ( AVAILABLE ?auto_661878 ) ( TRUCK-AT ?auto_661876 ?auto_661882 ) ( SURFACE-AT ?auto_661873 ?auto_661882 ) ( ON ?auto_661873 ?auto_661881 ) ( CLEAR ?auto_661873 ) ( not ( = ?auto_661873 ?auto_661881 ) ) ( not ( = ?auto_661874 ?auto_661881 ) ) ( not ( = ?auto_661875 ?auto_661881 ) ) ( not ( = ?auto_661879 ?auto_661881 ) ) ( LIFTING ?auto_661877 ?auto_661883 ) ( IS-CRATE ?auto_661883 ) ( not ( = ?auto_661873 ?auto_661883 ) ) ( not ( = ?auto_661874 ?auto_661883 ) ) ( not ( = ?auto_661875 ?auto_661883 ) ) ( not ( = ?auto_661879 ?auto_661883 ) ) ( not ( = ?auto_661881 ?auto_661883 ) ) )
    :subtasks
    ( ( !LOAD ?auto_661877 ?auto_661883 ?auto_661876 ?auto_661882 )
      ( MAKE-2CRATE ?auto_661875 ?auto_661873 ?auto_661874 )
      ( MAKE-1CRATE-VERIFY ?auto_661873 ?auto_661874 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_661884 - SURFACE
      ?auto_661885 - SURFACE
      ?auto_661886 - SURFACE
    )
    :vars
    (
      ?auto_661889 - HOIST
      ?auto_661894 - PLACE
      ?auto_661891 - PLACE
      ?auto_661887 - HOIST
      ?auto_661892 - SURFACE
      ?auto_661888 - TRUCK
      ?auto_661893 - SURFACE
      ?auto_661890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_661889 ?auto_661894 ) ( IS-CRATE ?auto_661886 ) ( not ( = ?auto_661885 ?auto_661886 ) ) ( not ( = ?auto_661884 ?auto_661885 ) ) ( not ( = ?auto_661884 ?auto_661886 ) ) ( not ( = ?auto_661891 ?auto_661894 ) ) ( HOIST-AT ?auto_661887 ?auto_661891 ) ( not ( = ?auto_661889 ?auto_661887 ) ) ( SURFACE-AT ?auto_661886 ?auto_661891 ) ( ON ?auto_661886 ?auto_661892 ) ( CLEAR ?auto_661886 ) ( not ( = ?auto_661885 ?auto_661892 ) ) ( not ( = ?auto_661886 ?auto_661892 ) ) ( not ( = ?auto_661884 ?auto_661892 ) ) ( SURFACE-AT ?auto_661884 ?auto_661894 ) ( CLEAR ?auto_661884 ) ( IS-CRATE ?auto_661885 ) ( AVAILABLE ?auto_661889 ) ( TRUCK-AT ?auto_661888 ?auto_661891 ) ( SURFACE-AT ?auto_661885 ?auto_661891 ) ( ON ?auto_661885 ?auto_661893 ) ( CLEAR ?auto_661885 ) ( not ( = ?auto_661885 ?auto_661893 ) ) ( not ( = ?auto_661886 ?auto_661893 ) ) ( not ( = ?auto_661884 ?auto_661893 ) ) ( not ( = ?auto_661892 ?auto_661893 ) ) ( LIFTING ?auto_661887 ?auto_661890 ) ( IS-CRATE ?auto_661890 ) ( not ( = ?auto_661885 ?auto_661890 ) ) ( not ( = ?auto_661886 ?auto_661890 ) ) ( not ( = ?auto_661884 ?auto_661890 ) ) ( not ( = ?auto_661892 ?auto_661890 ) ) ( not ( = ?auto_661893 ?auto_661890 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_661885 ?auto_661886 )
      ( MAKE-2CRATE-VERIFY ?auto_661884 ?auto_661885 ?auto_661886 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663069 - SURFACE
      ?auto_663070 - SURFACE
      ?auto_663071 - SURFACE
      ?auto_663068 - SURFACE
      ?auto_663072 - SURFACE
      ?auto_663074 - SURFACE
      ?auto_663073 - SURFACE
      ?auto_663075 - SURFACE
      ?auto_663076 - SURFACE
      ?auto_663077 - SURFACE
      ?auto_663078 - SURFACE
    )
    :vars
    (
      ?auto_663079 - HOIST
      ?auto_663080 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663079 ?auto_663080 ) ( SURFACE-AT ?auto_663077 ?auto_663080 ) ( CLEAR ?auto_663077 ) ( LIFTING ?auto_663079 ?auto_663078 ) ( IS-CRATE ?auto_663078 ) ( not ( = ?auto_663077 ?auto_663078 ) ) ( ON ?auto_663070 ?auto_663069 ) ( ON ?auto_663071 ?auto_663070 ) ( ON ?auto_663068 ?auto_663071 ) ( ON ?auto_663072 ?auto_663068 ) ( ON ?auto_663074 ?auto_663072 ) ( ON ?auto_663073 ?auto_663074 ) ( ON ?auto_663075 ?auto_663073 ) ( ON ?auto_663076 ?auto_663075 ) ( ON ?auto_663077 ?auto_663076 ) ( not ( = ?auto_663069 ?auto_663070 ) ) ( not ( = ?auto_663069 ?auto_663071 ) ) ( not ( = ?auto_663069 ?auto_663068 ) ) ( not ( = ?auto_663069 ?auto_663072 ) ) ( not ( = ?auto_663069 ?auto_663074 ) ) ( not ( = ?auto_663069 ?auto_663073 ) ) ( not ( = ?auto_663069 ?auto_663075 ) ) ( not ( = ?auto_663069 ?auto_663076 ) ) ( not ( = ?auto_663069 ?auto_663077 ) ) ( not ( = ?auto_663069 ?auto_663078 ) ) ( not ( = ?auto_663070 ?auto_663071 ) ) ( not ( = ?auto_663070 ?auto_663068 ) ) ( not ( = ?auto_663070 ?auto_663072 ) ) ( not ( = ?auto_663070 ?auto_663074 ) ) ( not ( = ?auto_663070 ?auto_663073 ) ) ( not ( = ?auto_663070 ?auto_663075 ) ) ( not ( = ?auto_663070 ?auto_663076 ) ) ( not ( = ?auto_663070 ?auto_663077 ) ) ( not ( = ?auto_663070 ?auto_663078 ) ) ( not ( = ?auto_663071 ?auto_663068 ) ) ( not ( = ?auto_663071 ?auto_663072 ) ) ( not ( = ?auto_663071 ?auto_663074 ) ) ( not ( = ?auto_663071 ?auto_663073 ) ) ( not ( = ?auto_663071 ?auto_663075 ) ) ( not ( = ?auto_663071 ?auto_663076 ) ) ( not ( = ?auto_663071 ?auto_663077 ) ) ( not ( = ?auto_663071 ?auto_663078 ) ) ( not ( = ?auto_663068 ?auto_663072 ) ) ( not ( = ?auto_663068 ?auto_663074 ) ) ( not ( = ?auto_663068 ?auto_663073 ) ) ( not ( = ?auto_663068 ?auto_663075 ) ) ( not ( = ?auto_663068 ?auto_663076 ) ) ( not ( = ?auto_663068 ?auto_663077 ) ) ( not ( = ?auto_663068 ?auto_663078 ) ) ( not ( = ?auto_663072 ?auto_663074 ) ) ( not ( = ?auto_663072 ?auto_663073 ) ) ( not ( = ?auto_663072 ?auto_663075 ) ) ( not ( = ?auto_663072 ?auto_663076 ) ) ( not ( = ?auto_663072 ?auto_663077 ) ) ( not ( = ?auto_663072 ?auto_663078 ) ) ( not ( = ?auto_663074 ?auto_663073 ) ) ( not ( = ?auto_663074 ?auto_663075 ) ) ( not ( = ?auto_663074 ?auto_663076 ) ) ( not ( = ?auto_663074 ?auto_663077 ) ) ( not ( = ?auto_663074 ?auto_663078 ) ) ( not ( = ?auto_663073 ?auto_663075 ) ) ( not ( = ?auto_663073 ?auto_663076 ) ) ( not ( = ?auto_663073 ?auto_663077 ) ) ( not ( = ?auto_663073 ?auto_663078 ) ) ( not ( = ?auto_663075 ?auto_663076 ) ) ( not ( = ?auto_663075 ?auto_663077 ) ) ( not ( = ?auto_663075 ?auto_663078 ) ) ( not ( = ?auto_663076 ?auto_663077 ) ) ( not ( = ?auto_663076 ?auto_663078 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_663077 ?auto_663078 )
      ( MAKE-10CRATE-VERIFY ?auto_663069 ?auto_663070 ?auto_663071 ?auto_663068 ?auto_663072 ?auto_663074 ?auto_663073 ?auto_663075 ?auto_663076 ?auto_663077 ?auto_663078 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663163 - SURFACE
      ?auto_663164 - SURFACE
      ?auto_663165 - SURFACE
      ?auto_663162 - SURFACE
      ?auto_663166 - SURFACE
      ?auto_663168 - SURFACE
      ?auto_663167 - SURFACE
      ?auto_663169 - SURFACE
      ?auto_663170 - SURFACE
      ?auto_663171 - SURFACE
      ?auto_663172 - SURFACE
    )
    :vars
    (
      ?auto_663174 - HOIST
      ?auto_663175 - PLACE
      ?auto_663173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663174 ?auto_663175 ) ( SURFACE-AT ?auto_663171 ?auto_663175 ) ( CLEAR ?auto_663171 ) ( IS-CRATE ?auto_663172 ) ( not ( = ?auto_663171 ?auto_663172 ) ) ( TRUCK-AT ?auto_663173 ?auto_663175 ) ( AVAILABLE ?auto_663174 ) ( IN ?auto_663172 ?auto_663173 ) ( ON ?auto_663171 ?auto_663170 ) ( not ( = ?auto_663170 ?auto_663171 ) ) ( not ( = ?auto_663170 ?auto_663172 ) ) ( ON ?auto_663164 ?auto_663163 ) ( ON ?auto_663165 ?auto_663164 ) ( ON ?auto_663162 ?auto_663165 ) ( ON ?auto_663166 ?auto_663162 ) ( ON ?auto_663168 ?auto_663166 ) ( ON ?auto_663167 ?auto_663168 ) ( ON ?auto_663169 ?auto_663167 ) ( ON ?auto_663170 ?auto_663169 ) ( not ( = ?auto_663163 ?auto_663164 ) ) ( not ( = ?auto_663163 ?auto_663165 ) ) ( not ( = ?auto_663163 ?auto_663162 ) ) ( not ( = ?auto_663163 ?auto_663166 ) ) ( not ( = ?auto_663163 ?auto_663168 ) ) ( not ( = ?auto_663163 ?auto_663167 ) ) ( not ( = ?auto_663163 ?auto_663169 ) ) ( not ( = ?auto_663163 ?auto_663170 ) ) ( not ( = ?auto_663163 ?auto_663171 ) ) ( not ( = ?auto_663163 ?auto_663172 ) ) ( not ( = ?auto_663164 ?auto_663165 ) ) ( not ( = ?auto_663164 ?auto_663162 ) ) ( not ( = ?auto_663164 ?auto_663166 ) ) ( not ( = ?auto_663164 ?auto_663168 ) ) ( not ( = ?auto_663164 ?auto_663167 ) ) ( not ( = ?auto_663164 ?auto_663169 ) ) ( not ( = ?auto_663164 ?auto_663170 ) ) ( not ( = ?auto_663164 ?auto_663171 ) ) ( not ( = ?auto_663164 ?auto_663172 ) ) ( not ( = ?auto_663165 ?auto_663162 ) ) ( not ( = ?auto_663165 ?auto_663166 ) ) ( not ( = ?auto_663165 ?auto_663168 ) ) ( not ( = ?auto_663165 ?auto_663167 ) ) ( not ( = ?auto_663165 ?auto_663169 ) ) ( not ( = ?auto_663165 ?auto_663170 ) ) ( not ( = ?auto_663165 ?auto_663171 ) ) ( not ( = ?auto_663165 ?auto_663172 ) ) ( not ( = ?auto_663162 ?auto_663166 ) ) ( not ( = ?auto_663162 ?auto_663168 ) ) ( not ( = ?auto_663162 ?auto_663167 ) ) ( not ( = ?auto_663162 ?auto_663169 ) ) ( not ( = ?auto_663162 ?auto_663170 ) ) ( not ( = ?auto_663162 ?auto_663171 ) ) ( not ( = ?auto_663162 ?auto_663172 ) ) ( not ( = ?auto_663166 ?auto_663168 ) ) ( not ( = ?auto_663166 ?auto_663167 ) ) ( not ( = ?auto_663166 ?auto_663169 ) ) ( not ( = ?auto_663166 ?auto_663170 ) ) ( not ( = ?auto_663166 ?auto_663171 ) ) ( not ( = ?auto_663166 ?auto_663172 ) ) ( not ( = ?auto_663168 ?auto_663167 ) ) ( not ( = ?auto_663168 ?auto_663169 ) ) ( not ( = ?auto_663168 ?auto_663170 ) ) ( not ( = ?auto_663168 ?auto_663171 ) ) ( not ( = ?auto_663168 ?auto_663172 ) ) ( not ( = ?auto_663167 ?auto_663169 ) ) ( not ( = ?auto_663167 ?auto_663170 ) ) ( not ( = ?auto_663167 ?auto_663171 ) ) ( not ( = ?auto_663167 ?auto_663172 ) ) ( not ( = ?auto_663169 ?auto_663170 ) ) ( not ( = ?auto_663169 ?auto_663171 ) ) ( not ( = ?auto_663169 ?auto_663172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663170 ?auto_663171 ?auto_663172 )
      ( MAKE-10CRATE-VERIFY ?auto_663163 ?auto_663164 ?auto_663165 ?auto_663162 ?auto_663166 ?auto_663168 ?auto_663167 ?auto_663169 ?auto_663170 ?auto_663171 ?auto_663172 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663268 - SURFACE
      ?auto_663269 - SURFACE
      ?auto_663270 - SURFACE
      ?auto_663267 - SURFACE
      ?auto_663271 - SURFACE
      ?auto_663273 - SURFACE
      ?auto_663272 - SURFACE
      ?auto_663274 - SURFACE
      ?auto_663275 - SURFACE
      ?auto_663276 - SURFACE
      ?auto_663277 - SURFACE
    )
    :vars
    (
      ?auto_663279 - HOIST
      ?auto_663280 - PLACE
      ?auto_663281 - TRUCK
      ?auto_663278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663279 ?auto_663280 ) ( SURFACE-AT ?auto_663276 ?auto_663280 ) ( CLEAR ?auto_663276 ) ( IS-CRATE ?auto_663277 ) ( not ( = ?auto_663276 ?auto_663277 ) ) ( AVAILABLE ?auto_663279 ) ( IN ?auto_663277 ?auto_663281 ) ( ON ?auto_663276 ?auto_663275 ) ( not ( = ?auto_663275 ?auto_663276 ) ) ( not ( = ?auto_663275 ?auto_663277 ) ) ( TRUCK-AT ?auto_663281 ?auto_663278 ) ( not ( = ?auto_663278 ?auto_663280 ) ) ( ON ?auto_663269 ?auto_663268 ) ( ON ?auto_663270 ?auto_663269 ) ( ON ?auto_663267 ?auto_663270 ) ( ON ?auto_663271 ?auto_663267 ) ( ON ?auto_663273 ?auto_663271 ) ( ON ?auto_663272 ?auto_663273 ) ( ON ?auto_663274 ?auto_663272 ) ( ON ?auto_663275 ?auto_663274 ) ( not ( = ?auto_663268 ?auto_663269 ) ) ( not ( = ?auto_663268 ?auto_663270 ) ) ( not ( = ?auto_663268 ?auto_663267 ) ) ( not ( = ?auto_663268 ?auto_663271 ) ) ( not ( = ?auto_663268 ?auto_663273 ) ) ( not ( = ?auto_663268 ?auto_663272 ) ) ( not ( = ?auto_663268 ?auto_663274 ) ) ( not ( = ?auto_663268 ?auto_663275 ) ) ( not ( = ?auto_663268 ?auto_663276 ) ) ( not ( = ?auto_663268 ?auto_663277 ) ) ( not ( = ?auto_663269 ?auto_663270 ) ) ( not ( = ?auto_663269 ?auto_663267 ) ) ( not ( = ?auto_663269 ?auto_663271 ) ) ( not ( = ?auto_663269 ?auto_663273 ) ) ( not ( = ?auto_663269 ?auto_663272 ) ) ( not ( = ?auto_663269 ?auto_663274 ) ) ( not ( = ?auto_663269 ?auto_663275 ) ) ( not ( = ?auto_663269 ?auto_663276 ) ) ( not ( = ?auto_663269 ?auto_663277 ) ) ( not ( = ?auto_663270 ?auto_663267 ) ) ( not ( = ?auto_663270 ?auto_663271 ) ) ( not ( = ?auto_663270 ?auto_663273 ) ) ( not ( = ?auto_663270 ?auto_663272 ) ) ( not ( = ?auto_663270 ?auto_663274 ) ) ( not ( = ?auto_663270 ?auto_663275 ) ) ( not ( = ?auto_663270 ?auto_663276 ) ) ( not ( = ?auto_663270 ?auto_663277 ) ) ( not ( = ?auto_663267 ?auto_663271 ) ) ( not ( = ?auto_663267 ?auto_663273 ) ) ( not ( = ?auto_663267 ?auto_663272 ) ) ( not ( = ?auto_663267 ?auto_663274 ) ) ( not ( = ?auto_663267 ?auto_663275 ) ) ( not ( = ?auto_663267 ?auto_663276 ) ) ( not ( = ?auto_663267 ?auto_663277 ) ) ( not ( = ?auto_663271 ?auto_663273 ) ) ( not ( = ?auto_663271 ?auto_663272 ) ) ( not ( = ?auto_663271 ?auto_663274 ) ) ( not ( = ?auto_663271 ?auto_663275 ) ) ( not ( = ?auto_663271 ?auto_663276 ) ) ( not ( = ?auto_663271 ?auto_663277 ) ) ( not ( = ?auto_663273 ?auto_663272 ) ) ( not ( = ?auto_663273 ?auto_663274 ) ) ( not ( = ?auto_663273 ?auto_663275 ) ) ( not ( = ?auto_663273 ?auto_663276 ) ) ( not ( = ?auto_663273 ?auto_663277 ) ) ( not ( = ?auto_663272 ?auto_663274 ) ) ( not ( = ?auto_663272 ?auto_663275 ) ) ( not ( = ?auto_663272 ?auto_663276 ) ) ( not ( = ?auto_663272 ?auto_663277 ) ) ( not ( = ?auto_663274 ?auto_663275 ) ) ( not ( = ?auto_663274 ?auto_663276 ) ) ( not ( = ?auto_663274 ?auto_663277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663275 ?auto_663276 ?auto_663277 )
      ( MAKE-10CRATE-VERIFY ?auto_663268 ?auto_663269 ?auto_663270 ?auto_663267 ?auto_663271 ?auto_663273 ?auto_663272 ?auto_663274 ?auto_663275 ?auto_663276 ?auto_663277 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663383 - SURFACE
      ?auto_663384 - SURFACE
      ?auto_663385 - SURFACE
      ?auto_663382 - SURFACE
      ?auto_663386 - SURFACE
      ?auto_663388 - SURFACE
      ?auto_663387 - SURFACE
      ?auto_663389 - SURFACE
      ?auto_663390 - SURFACE
      ?auto_663391 - SURFACE
      ?auto_663392 - SURFACE
    )
    :vars
    (
      ?auto_663395 - HOIST
      ?auto_663397 - PLACE
      ?auto_663393 - TRUCK
      ?auto_663394 - PLACE
      ?auto_663396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_663395 ?auto_663397 ) ( SURFACE-AT ?auto_663391 ?auto_663397 ) ( CLEAR ?auto_663391 ) ( IS-CRATE ?auto_663392 ) ( not ( = ?auto_663391 ?auto_663392 ) ) ( AVAILABLE ?auto_663395 ) ( ON ?auto_663391 ?auto_663390 ) ( not ( = ?auto_663390 ?auto_663391 ) ) ( not ( = ?auto_663390 ?auto_663392 ) ) ( TRUCK-AT ?auto_663393 ?auto_663394 ) ( not ( = ?auto_663394 ?auto_663397 ) ) ( HOIST-AT ?auto_663396 ?auto_663394 ) ( LIFTING ?auto_663396 ?auto_663392 ) ( not ( = ?auto_663395 ?auto_663396 ) ) ( ON ?auto_663384 ?auto_663383 ) ( ON ?auto_663385 ?auto_663384 ) ( ON ?auto_663382 ?auto_663385 ) ( ON ?auto_663386 ?auto_663382 ) ( ON ?auto_663388 ?auto_663386 ) ( ON ?auto_663387 ?auto_663388 ) ( ON ?auto_663389 ?auto_663387 ) ( ON ?auto_663390 ?auto_663389 ) ( not ( = ?auto_663383 ?auto_663384 ) ) ( not ( = ?auto_663383 ?auto_663385 ) ) ( not ( = ?auto_663383 ?auto_663382 ) ) ( not ( = ?auto_663383 ?auto_663386 ) ) ( not ( = ?auto_663383 ?auto_663388 ) ) ( not ( = ?auto_663383 ?auto_663387 ) ) ( not ( = ?auto_663383 ?auto_663389 ) ) ( not ( = ?auto_663383 ?auto_663390 ) ) ( not ( = ?auto_663383 ?auto_663391 ) ) ( not ( = ?auto_663383 ?auto_663392 ) ) ( not ( = ?auto_663384 ?auto_663385 ) ) ( not ( = ?auto_663384 ?auto_663382 ) ) ( not ( = ?auto_663384 ?auto_663386 ) ) ( not ( = ?auto_663384 ?auto_663388 ) ) ( not ( = ?auto_663384 ?auto_663387 ) ) ( not ( = ?auto_663384 ?auto_663389 ) ) ( not ( = ?auto_663384 ?auto_663390 ) ) ( not ( = ?auto_663384 ?auto_663391 ) ) ( not ( = ?auto_663384 ?auto_663392 ) ) ( not ( = ?auto_663385 ?auto_663382 ) ) ( not ( = ?auto_663385 ?auto_663386 ) ) ( not ( = ?auto_663385 ?auto_663388 ) ) ( not ( = ?auto_663385 ?auto_663387 ) ) ( not ( = ?auto_663385 ?auto_663389 ) ) ( not ( = ?auto_663385 ?auto_663390 ) ) ( not ( = ?auto_663385 ?auto_663391 ) ) ( not ( = ?auto_663385 ?auto_663392 ) ) ( not ( = ?auto_663382 ?auto_663386 ) ) ( not ( = ?auto_663382 ?auto_663388 ) ) ( not ( = ?auto_663382 ?auto_663387 ) ) ( not ( = ?auto_663382 ?auto_663389 ) ) ( not ( = ?auto_663382 ?auto_663390 ) ) ( not ( = ?auto_663382 ?auto_663391 ) ) ( not ( = ?auto_663382 ?auto_663392 ) ) ( not ( = ?auto_663386 ?auto_663388 ) ) ( not ( = ?auto_663386 ?auto_663387 ) ) ( not ( = ?auto_663386 ?auto_663389 ) ) ( not ( = ?auto_663386 ?auto_663390 ) ) ( not ( = ?auto_663386 ?auto_663391 ) ) ( not ( = ?auto_663386 ?auto_663392 ) ) ( not ( = ?auto_663388 ?auto_663387 ) ) ( not ( = ?auto_663388 ?auto_663389 ) ) ( not ( = ?auto_663388 ?auto_663390 ) ) ( not ( = ?auto_663388 ?auto_663391 ) ) ( not ( = ?auto_663388 ?auto_663392 ) ) ( not ( = ?auto_663387 ?auto_663389 ) ) ( not ( = ?auto_663387 ?auto_663390 ) ) ( not ( = ?auto_663387 ?auto_663391 ) ) ( not ( = ?auto_663387 ?auto_663392 ) ) ( not ( = ?auto_663389 ?auto_663390 ) ) ( not ( = ?auto_663389 ?auto_663391 ) ) ( not ( = ?auto_663389 ?auto_663392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663390 ?auto_663391 ?auto_663392 )
      ( MAKE-10CRATE-VERIFY ?auto_663383 ?auto_663384 ?auto_663385 ?auto_663382 ?auto_663386 ?auto_663388 ?auto_663387 ?auto_663389 ?auto_663390 ?auto_663391 ?auto_663392 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663508 - SURFACE
      ?auto_663509 - SURFACE
      ?auto_663510 - SURFACE
      ?auto_663507 - SURFACE
      ?auto_663511 - SURFACE
      ?auto_663513 - SURFACE
      ?auto_663512 - SURFACE
      ?auto_663514 - SURFACE
      ?auto_663515 - SURFACE
      ?auto_663516 - SURFACE
      ?auto_663517 - SURFACE
    )
    :vars
    (
      ?auto_663521 - HOIST
      ?auto_663522 - PLACE
      ?auto_663520 - TRUCK
      ?auto_663518 - PLACE
      ?auto_663523 - HOIST
      ?auto_663519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663521 ?auto_663522 ) ( SURFACE-AT ?auto_663516 ?auto_663522 ) ( CLEAR ?auto_663516 ) ( IS-CRATE ?auto_663517 ) ( not ( = ?auto_663516 ?auto_663517 ) ) ( AVAILABLE ?auto_663521 ) ( ON ?auto_663516 ?auto_663515 ) ( not ( = ?auto_663515 ?auto_663516 ) ) ( not ( = ?auto_663515 ?auto_663517 ) ) ( TRUCK-AT ?auto_663520 ?auto_663518 ) ( not ( = ?auto_663518 ?auto_663522 ) ) ( HOIST-AT ?auto_663523 ?auto_663518 ) ( not ( = ?auto_663521 ?auto_663523 ) ) ( AVAILABLE ?auto_663523 ) ( SURFACE-AT ?auto_663517 ?auto_663518 ) ( ON ?auto_663517 ?auto_663519 ) ( CLEAR ?auto_663517 ) ( not ( = ?auto_663516 ?auto_663519 ) ) ( not ( = ?auto_663517 ?auto_663519 ) ) ( not ( = ?auto_663515 ?auto_663519 ) ) ( ON ?auto_663509 ?auto_663508 ) ( ON ?auto_663510 ?auto_663509 ) ( ON ?auto_663507 ?auto_663510 ) ( ON ?auto_663511 ?auto_663507 ) ( ON ?auto_663513 ?auto_663511 ) ( ON ?auto_663512 ?auto_663513 ) ( ON ?auto_663514 ?auto_663512 ) ( ON ?auto_663515 ?auto_663514 ) ( not ( = ?auto_663508 ?auto_663509 ) ) ( not ( = ?auto_663508 ?auto_663510 ) ) ( not ( = ?auto_663508 ?auto_663507 ) ) ( not ( = ?auto_663508 ?auto_663511 ) ) ( not ( = ?auto_663508 ?auto_663513 ) ) ( not ( = ?auto_663508 ?auto_663512 ) ) ( not ( = ?auto_663508 ?auto_663514 ) ) ( not ( = ?auto_663508 ?auto_663515 ) ) ( not ( = ?auto_663508 ?auto_663516 ) ) ( not ( = ?auto_663508 ?auto_663517 ) ) ( not ( = ?auto_663508 ?auto_663519 ) ) ( not ( = ?auto_663509 ?auto_663510 ) ) ( not ( = ?auto_663509 ?auto_663507 ) ) ( not ( = ?auto_663509 ?auto_663511 ) ) ( not ( = ?auto_663509 ?auto_663513 ) ) ( not ( = ?auto_663509 ?auto_663512 ) ) ( not ( = ?auto_663509 ?auto_663514 ) ) ( not ( = ?auto_663509 ?auto_663515 ) ) ( not ( = ?auto_663509 ?auto_663516 ) ) ( not ( = ?auto_663509 ?auto_663517 ) ) ( not ( = ?auto_663509 ?auto_663519 ) ) ( not ( = ?auto_663510 ?auto_663507 ) ) ( not ( = ?auto_663510 ?auto_663511 ) ) ( not ( = ?auto_663510 ?auto_663513 ) ) ( not ( = ?auto_663510 ?auto_663512 ) ) ( not ( = ?auto_663510 ?auto_663514 ) ) ( not ( = ?auto_663510 ?auto_663515 ) ) ( not ( = ?auto_663510 ?auto_663516 ) ) ( not ( = ?auto_663510 ?auto_663517 ) ) ( not ( = ?auto_663510 ?auto_663519 ) ) ( not ( = ?auto_663507 ?auto_663511 ) ) ( not ( = ?auto_663507 ?auto_663513 ) ) ( not ( = ?auto_663507 ?auto_663512 ) ) ( not ( = ?auto_663507 ?auto_663514 ) ) ( not ( = ?auto_663507 ?auto_663515 ) ) ( not ( = ?auto_663507 ?auto_663516 ) ) ( not ( = ?auto_663507 ?auto_663517 ) ) ( not ( = ?auto_663507 ?auto_663519 ) ) ( not ( = ?auto_663511 ?auto_663513 ) ) ( not ( = ?auto_663511 ?auto_663512 ) ) ( not ( = ?auto_663511 ?auto_663514 ) ) ( not ( = ?auto_663511 ?auto_663515 ) ) ( not ( = ?auto_663511 ?auto_663516 ) ) ( not ( = ?auto_663511 ?auto_663517 ) ) ( not ( = ?auto_663511 ?auto_663519 ) ) ( not ( = ?auto_663513 ?auto_663512 ) ) ( not ( = ?auto_663513 ?auto_663514 ) ) ( not ( = ?auto_663513 ?auto_663515 ) ) ( not ( = ?auto_663513 ?auto_663516 ) ) ( not ( = ?auto_663513 ?auto_663517 ) ) ( not ( = ?auto_663513 ?auto_663519 ) ) ( not ( = ?auto_663512 ?auto_663514 ) ) ( not ( = ?auto_663512 ?auto_663515 ) ) ( not ( = ?auto_663512 ?auto_663516 ) ) ( not ( = ?auto_663512 ?auto_663517 ) ) ( not ( = ?auto_663512 ?auto_663519 ) ) ( not ( = ?auto_663514 ?auto_663515 ) ) ( not ( = ?auto_663514 ?auto_663516 ) ) ( not ( = ?auto_663514 ?auto_663517 ) ) ( not ( = ?auto_663514 ?auto_663519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663515 ?auto_663516 ?auto_663517 )
      ( MAKE-10CRATE-VERIFY ?auto_663508 ?auto_663509 ?auto_663510 ?auto_663507 ?auto_663511 ?auto_663513 ?auto_663512 ?auto_663514 ?auto_663515 ?auto_663516 ?auto_663517 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663634 - SURFACE
      ?auto_663635 - SURFACE
      ?auto_663636 - SURFACE
      ?auto_663633 - SURFACE
      ?auto_663637 - SURFACE
      ?auto_663639 - SURFACE
      ?auto_663638 - SURFACE
      ?auto_663640 - SURFACE
      ?auto_663641 - SURFACE
      ?auto_663642 - SURFACE
      ?auto_663643 - SURFACE
    )
    :vars
    (
      ?auto_663646 - HOIST
      ?auto_663647 - PLACE
      ?auto_663649 - PLACE
      ?auto_663644 - HOIST
      ?auto_663648 - SURFACE
      ?auto_663645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663646 ?auto_663647 ) ( SURFACE-AT ?auto_663642 ?auto_663647 ) ( CLEAR ?auto_663642 ) ( IS-CRATE ?auto_663643 ) ( not ( = ?auto_663642 ?auto_663643 ) ) ( AVAILABLE ?auto_663646 ) ( ON ?auto_663642 ?auto_663641 ) ( not ( = ?auto_663641 ?auto_663642 ) ) ( not ( = ?auto_663641 ?auto_663643 ) ) ( not ( = ?auto_663649 ?auto_663647 ) ) ( HOIST-AT ?auto_663644 ?auto_663649 ) ( not ( = ?auto_663646 ?auto_663644 ) ) ( AVAILABLE ?auto_663644 ) ( SURFACE-AT ?auto_663643 ?auto_663649 ) ( ON ?auto_663643 ?auto_663648 ) ( CLEAR ?auto_663643 ) ( not ( = ?auto_663642 ?auto_663648 ) ) ( not ( = ?auto_663643 ?auto_663648 ) ) ( not ( = ?auto_663641 ?auto_663648 ) ) ( TRUCK-AT ?auto_663645 ?auto_663647 ) ( ON ?auto_663635 ?auto_663634 ) ( ON ?auto_663636 ?auto_663635 ) ( ON ?auto_663633 ?auto_663636 ) ( ON ?auto_663637 ?auto_663633 ) ( ON ?auto_663639 ?auto_663637 ) ( ON ?auto_663638 ?auto_663639 ) ( ON ?auto_663640 ?auto_663638 ) ( ON ?auto_663641 ?auto_663640 ) ( not ( = ?auto_663634 ?auto_663635 ) ) ( not ( = ?auto_663634 ?auto_663636 ) ) ( not ( = ?auto_663634 ?auto_663633 ) ) ( not ( = ?auto_663634 ?auto_663637 ) ) ( not ( = ?auto_663634 ?auto_663639 ) ) ( not ( = ?auto_663634 ?auto_663638 ) ) ( not ( = ?auto_663634 ?auto_663640 ) ) ( not ( = ?auto_663634 ?auto_663641 ) ) ( not ( = ?auto_663634 ?auto_663642 ) ) ( not ( = ?auto_663634 ?auto_663643 ) ) ( not ( = ?auto_663634 ?auto_663648 ) ) ( not ( = ?auto_663635 ?auto_663636 ) ) ( not ( = ?auto_663635 ?auto_663633 ) ) ( not ( = ?auto_663635 ?auto_663637 ) ) ( not ( = ?auto_663635 ?auto_663639 ) ) ( not ( = ?auto_663635 ?auto_663638 ) ) ( not ( = ?auto_663635 ?auto_663640 ) ) ( not ( = ?auto_663635 ?auto_663641 ) ) ( not ( = ?auto_663635 ?auto_663642 ) ) ( not ( = ?auto_663635 ?auto_663643 ) ) ( not ( = ?auto_663635 ?auto_663648 ) ) ( not ( = ?auto_663636 ?auto_663633 ) ) ( not ( = ?auto_663636 ?auto_663637 ) ) ( not ( = ?auto_663636 ?auto_663639 ) ) ( not ( = ?auto_663636 ?auto_663638 ) ) ( not ( = ?auto_663636 ?auto_663640 ) ) ( not ( = ?auto_663636 ?auto_663641 ) ) ( not ( = ?auto_663636 ?auto_663642 ) ) ( not ( = ?auto_663636 ?auto_663643 ) ) ( not ( = ?auto_663636 ?auto_663648 ) ) ( not ( = ?auto_663633 ?auto_663637 ) ) ( not ( = ?auto_663633 ?auto_663639 ) ) ( not ( = ?auto_663633 ?auto_663638 ) ) ( not ( = ?auto_663633 ?auto_663640 ) ) ( not ( = ?auto_663633 ?auto_663641 ) ) ( not ( = ?auto_663633 ?auto_663642 ) ) ( not ( = ?auto_663633 ?auto_663643 ) ) ( not ( = ?auto_663633 ?auto_663648 ) ) ( not ( = ?auto_663637 ?auto_663639 ) ) ( not ( = ?auto_663637 ?auto_663638 ) ) ( not ( = ?auto_663637 ?auto_663640 ) ) ( not ( = ?auto_663637 ?auto_663641 ) ) ( not ( = ?auto_663637 ?auto_663642 ) ) ( not ( = ?auto_663637 ?auto_663643 ) ) ( not ( = ?auto_663637 ?auto_663648 ) ) ( not ( = ?auto_663639 ?auto_663638 ) ) ( not ( = ?auto_663639 ?auto_663640 ) ) ( not ( = ?auto_663639 ?auto_663641 ) ) ( not ( = ?auto_663639 ?auto_663642 ) ) ( not ( = ?auto_663639 ?auto_663643 ) ) ( not ( = ?auto_663639 ?auto_663648 ) ) ( not ( = ?auto_663638 ?auto_663640 ) ) ( not ( = ?auto_663638 ?auto_663641 ) ) ( not ( = ?auto_663638 ?auto_663642 ) ) ( not ( = ?auto_663638 ?auto_663643 ) ) ( not ( = ?auto_663638 ?auto_663648 ) ) ( not ( = ?auto_663640 ?auto_663641 ) ) ( not ( = ?auto_663640 ?auto_663642 ) ) ( not ( = ?auto_663640 ?auto_663643 ) ) ( not ( = ?auto_663640 ?auto_663648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663641 ?auto_663642 ?auto_663643 )
      ( MAKE-10CRATE-VERIFY ?auto_663634 ?auto_663635 ?auto_663636 ?auto_663633 ?auto_663637 ?auto_663639 ?auto_663638 ?auto_663640 ?auto_663641 ?auto_663642 ?auto_663643 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663760 - SURFACE
      ?auto_663761 - SURFACE
      ?auto_663762 - SURFACE
      ?auto_663759 - SURFACE
      ?auto_663763 - SURFACE
      ?auto_663765 - SURFACE
      ?auto_663764 - SURFACE
      ?auto_663766 - SURFACE
      ?auto_663767 - SURFACE
      ?auto_663768 - SURFACE
      ?auto_663769 - SURFACE
    )
    :vars
    (
      ?auto_663773 - HOIST
      ?auto_663774 - PLACE
      ?auto_663771 - PLACE
      ?auto_663770 - HOIST
      ?auto_663772 - SURFACE
      ?auto_663775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663773 ?auto_663774 ) ( IS-CRATE ?auto_663769 ) ( not ( = ?auto_663768 ?auto_663769 ) ) ( not ( = ?auto_663767 ?auto_663768 ) ) ( not ( = ?auto_663767 ?auto_663769 ) ) ( not ( = ?auto_663771 ?auto_663774 ) ) ( HOIST-AT ?auto_663770 ?auto_663771 ) ( not ( = ?auto_663773 ?auto_663770 ) ) ( AVAILABLE ?auto_663770 ) ( SURFACE-AT ?auto_663769 ?auto_663771 ) ( ON ?auto_663769 ?auto_663772 ) ( CLEAR ?auto_663769 ) ( not ( = ?auto_663768 ?auto_663772 ) ) ( not ( = ?auto_663769 ?auto_663772 ) ) ( not ( = ?auto_663767 ?auto_663772 ) ) ( TRUCK-AT ?auto_663775 ?auto_663774 ) ( SURFACE-AT ?auto_663767 ?auto_663774 ) ( CLEAR ?auto_663767 ) ( LIFTING ?auto_663773 ?auto_663768 ) ( IS-CRATE ?auto_663768 ) ( ON ?auto_663761 ?auto_663760 ) ( ON ?auto_663762 ?auto_663761 ) ( ON ?auto_663759 ?auto_663762 ) ( ON ?auto_663763 ?auto_663759 ) ( ON ?auto_663765 ?auto_663763 ) ( ON ?auto_663764 ?auto_663765 ) ( ON ?auto_663766 ?auto_663764 ) ( ON ?auto_663767 ?auto_663766 ) ( not ( = ?auto_663760 ?auto_663761 ) ) ( not ( = ?auto_663760 ?auto_663762 ) ) ( not ( = ?auto_663760 ?auto_663759 ) ) ( not ( = ?auto_663760 ?auto_663763 ) ) ( not ( = ?auto_663760 ?auto_663765 ) ) ( not ( = ?auto_663760 ?auto_663764 ) ) ( not ( = ?auto_663760 ?auto_663766 ) ) ( not ( = ?auto_663760 ?auto_663767 ) ) ( not ( = ?auto_663760 ?auto_663768 ) ) ( not ( = ?auto_663760 ?auto_663769 ) ) ( not ( = ?auto_663760 ?auto_663772 ) ) ( not ( = ?auto_663761 ?auto_663762 ) ) ( not ( = ?auto_663761 ?auto_663759 ) ) ( not ( = ?auto_663761 ?auto_663763 ) ) ( not ( = ?auto_663761 ?auto_663765 ) ) ( not ( = ?auto_663761 ?auto_663764 ) ) ( not ( = ?auto_663761 ?auto_663766 ) ) ( not ( = ?auto_663761 ?auto_663767 ) ) ( not ( = ?auto_663761 ?auto_663768 ) ) ( not ( = ?auto_663761 ?auto_663769 ) ) ( not ( = ?auto_663761 ?auto_663772 ) ) ( not ( = ?auto_663762 ?auto_663759 ) ) ( not ( = ?auto_663762 ?auto_663763 ) ) ( not ( = ?auto_663762 ?auto_663765 ) ) ( not ( = ?auto_663762 ?auto_663764 ) ) ( not ( = ?auto_663762 ?auto_663766 ) ) ( not ( = ?auto_663762 ?auto_663767 ) ) ( not ( = ?auto_663762 ?auto_663768 ) ) ( not ( = ?auto_663762 ?auto_663769 ) ) ( not ( = ?auto_663762 ?auto_663772 ) ) ( not ( = ?auto_663759 ?auto_663763 ) ) ( not ( = ?auto_663759 ?auto_663765 ) ) ( not ( = ?auto_663759 ?auto_663764 ) ) ( not ( = ?auto_663759 ?auto_663766 ) ) ( not ( = ?auto_663759 ?auto_663767 ) ) ( not ( = ?auto_663759 ?auto_663768 ) ) ( not ( = ?auto_663759 ?auto_663769 ) ) ( not ( = ?auto_663759 ?auto_663772 ) ) ( not ( = ?auto_663763 ?auto_663765 ) ) ( not ( = ?auto_663763 ?auto_663764 ) ) ( not ( = ?auto_663763 ?auto_663766 ) ) ( not ( = ?auto_663763 ?auto_663767 ) ) ( not ( = ?auto_663763 ?auto_663768 ) ) ( not ( = ?auto_663763 ?auto_663769 ) ) ( not ( = ?auto_663763 ?auto_663772 ) ) ( not ( = ?auto_663765 ?auto_663764 ) ) ( not ( = ?auto_663765 ?auto_663766 ) ) ( not ( = ?auto_663765 ?auto_663767 ) ) ( not ( = ?auto_663765 ?auto_663768 ) ) ( not ( = ?auto_663765 ?auto_663769 ) ) ( not ( = ?auto_663765 ?auto_663772 ) ) ( not ( = ?auto_663764 ?auto_663766 ) ) ( not ( = ?auto_663764 ?auto_663767 ) ) ( not ( = ?auto_663764 ?auto_663768 ) ) ( not ( = ?auto_663764 ?auto_663769 ) ) ( not ( = ?auto_663764 ?auto_663772 ) ) ( not ( = ?auto_663766 ?auto_663767 ) ) ( not ( = ?auto_663766 ?auto_663768 ) ) ( not ( = ?auto_663766 ?auto_663769 ) ) ( not ( = ?auto_663766 ?auto_663772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663767 ?auto_663768 ?auto_663769 )
      ( MAKE-10CRATE-VERIFY ?auto_663760 ?auto_663761 ?auto_663762 ?auto_663759 ?auto_663763 ?auto_663765 ?auto_663764 ?auto_663766 ?auto_663767 ?auto_663768 ?auto_663769 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663886 - SURFACE
      ?auto_663887 - SURFACE
      ?auto_663888 - SURFACE
      ?auto_663885 - SURFACE
      ?auto_663889 - SURFACE
      ?auto_663891 - SURFACE
      ?auto_663890 - SURFACE
      ?auto_663892 - SURFACE
      ?auto_663893 - SURFACE
      ?auto_663894 - SURFACE
      ?auto_663895 - SURFACE
    )
    :vars
    (
      ?auto_663898 - HOIST
      ?auto_663896 - PLACE
      ?auto_663900 - PLACE
      ?auto_663899 - HOIST
      ?auto_663897 - SURFACE
      ?auto_663901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663898 ?auto_663896 ) ( IS-CRATE ?auto_663895 ) ( not ( = ?auto_663894 ?auto_663895 ) ) ( not ( = ?auto_663893 ?auto_663894 ) ) ( not ( = ?auto_663893 ?auto_663895 ) ) ( not ( = ?auto_663900 ?auto_663896 ) ) ( HOIST-AT ?auto_663899 ?auto_663900 ) ( not ( = ?auto_663898 ?auto_663899 ) ) ( AVAILABLE ?auto_663899 ) ( SURFACE-AT ?auto_663895 ?auto_663900 ) ( ON ?auto_663895 ?auto_663897 ) ( CLEAR ?auto_663895 ) ( not ( = ?auto_663894 ?auto_663897 ) ) ( not ( = ?auto_663895 ?auto_663897 ) ) ( not ( = ?auto_663893 ?auto_663897 ) ) ( TRUCK-AT ?auto_663901 ?auto_663896 ) ( SURFACE-AT ?auto_663893 ?auto_663896 ) ( CLEAR ?auto_663893 ) ( IS-CRATE ?auto_663894 ) ( AVAILABLE ?auto_663898 ) ( IN ?auto_663894 ?auto_663901 ) ( ON ?auto_663887 ?auto_663886 ) ( ON ?auto_663888 ?auto_663887 ) ( ON ?auto_663885 ?auto_663888 ) ( ON ?auto_663889 ?auto_663885 ) ( ON ?auto_663891 ?auto_663889 ) ( ON ?auto_663890 ?auto_663891 ) ( ON ?auto_663892 ?auto_663890 ) ( ON ?auto_663893 ?auto_663892 ) ( not ( = ?auto_663886 ?auto_663887 ) ) ( not ( = ?auto_663886 ?auto_663888 ) ) ( not ( = ?auto_663886 ?auto_663885 ) ) ( not ( = ?auto_663886 ?auto_663889 ) ) ( not ( = ?auto_663886 ?auto_663891 ) ) ( not ( = ?auto_663886 ?auto_663890 ) ) ( not ( = ?auto_663886 ?auto_663892 ) ) ( not ( = ?auto_663886 ?auto_663893 ) ) ( not ( = ?auto_663886 ?auto_663894 ) ) ( not ( = ?auto_663886 ?auto_663895 ) ) ( not ( = ?auto_663886 ?auto_663897 ) ) ( not ( = ?auto_663887 ?auto_663888 ) ) ( not ( = ?auto_663887 ?auto_663885 ) ) ( not ( = ?auto_663887 ?auto_663889 ) ) ( not ( = ?auto_663887 ?auto_663891 ) ) ( not ( = ?auto_663887 ?auto_663890 ) ) ( not ( = ?auto_663887 ?auto_663892 ) ) ( not ( = ?auto_663887 ?auto_663893 ) ) ( not ( = ?auto_663887 ?auto_663894 ) ) ( not ( = ?auto_663887 ?auto_663895 ) ) ( not ( = ?auto_663887 ?auto_663897 ) ) ( not ( = ?auto_663888 ?auto_663885 ) ) ( not ( = ?auto_663888 ?auto_663889 ) ) ( not ( = ?auto_663888 ?auto_663891 ) ) ( not ( = ?auto_663888 ?auto_663890 ) ) ( not ( = ?auto_663888 ?auto_663892 ) ) ( not ( = ?auto_663888 ?auto_663893 ) ) ( not ( = ?auto_663888 ?auto_663894 ) ) ( not ( = ?auto_663888 ?auto_663895 ) ) ( not ( = ?auto_663888 ?auto_663897 ) ) ( not ( = ?auto_663885 ?auto_663889 ) ) ( not ( = ?auto_663885 ?auto_663891 ) ) ( not ( = ?auto_663885 ?auto_663890 ) ) ( not ( = ?auto_663885 ?auto_663892 ) ) ( not ( = ?auto_663885 ?auto_663893 ) ) ( not ( = ?auto_663885 ?auto_663894 ) ) ( not ( = ?auto_663885 ?auto_663895 ) ) ( not ( = ?auto_663885 ?auto_663897 ) ) ( not ( = ?auto_663889 ?auto_663891 ) ) ( not ( = ?auto_663889 ?auto_663890 ) ) ( not ( = ?auto_663889 ?auto_663892 ) ) ( not ( = ?auto_663889 ?auto_663893 ) ) ( not ( = ?auto_663889 ?auto_663894 ) ) ( not ( = ?auto_663889 ?auto_663895 ) ) ( not ( = ?auto_663889 ?auto_663897 ) ) ( not ( = ?auto_663891 ?auto_663890 ) ) ( not ( = ?auto_663891 ?auto_663892 ) ) ( not ( = ?auto_663891 ?auto_663893 ) ) ( not ( = ?auto_663891 ?auto_663894 ) ) ( not ( = ?auto_663891 ?auto_663895 ) ) ( not ( = ?auto_663891 ?auto_663897 ) ) ( not ( = ?auto_663890 ?auto_663892 ) ) ( not ( = ?auto_663890 ?auto_663893 ) ) ( not ( = ?auto_663890 ?auto_663894 ) ) ( not ( = ?auto_663890 ?auto_663895 ) ) ( not ( = ?auto_663890 ?auto_663897 ) ) ( not ( = ?auto_663892 ?auto_663893 ) ) ( not ( = ?auto_663892 ?auto_663894 ) ) ( not ( = ?auto_663892 ?auto_663895 ) ) ( not ( = ?auto_663892 ?auto_663897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663893 ?auto_663894 ?auto_663895 )
      ( MAKE-10CRATE-VERIFY ?auto_663886 ?auto_663887 ?auto_663888 ?auto_663885 ?auto_663889 ?auto_663891 ?auto_663890 ?auto_663892 ?auto_663893 ?auto_663894 ?auto_663895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_664833 - SURFACE
      ?auto_664834 - SURFACE
    )
    :vars
    (
      ?auto_664841 - HOIST
      ?auto_664840 - PLACE
      ?auto_664837 - SURFACE
      ?auto_664835 - PLACE
      ?auto_664836 - HOIST
      ?auto_664838 - SURFACE
      ?auto_664839 - TRUCK
      ?auto_664842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_664841 ?auto_664840 ) ( SURFACE-AT ?auto_664833 ?auto_664840 ) ( CLEAR ?auto_664833 ) ( IS-CRATE ?auto_664834 ) ( not ( = ?auto_664833 ?auto_664834 ) ) ( ON ?auto_664833 ?auto_664837 ) ( not ( = ?auto_664837 ?auto_664833 ) ) ( not ( = ?auto_664837 ?auto_664834 ) ) ( not ( = ?auto_664835 ?auto_664840 ) ) ( HOIST-AT ?auto_664836 ?auto_664835 ) ( not ( = ?auto_664841 ?auto_664836 ) ) ( AVAILABLE ?auto_664836 ) ( SURFACE-AT ?auto_664834 ?auto_664835 ) ( ON ?auto_664834 ?auto_664838 ) ( CLEAR ?auto_664834 ) ( not ( = ?auto_664833 ?auto_664838 ) ) ( not ( = ?auto_664834 ?auto_664838 ) ) ( not ( = ?auto_664837 ?auto_664838 ) ) ( TRUCK-AT ?auto_664839 ?auto_664840 ) ( LIFTING ?auto_664841 ?auto_664842 ) ( IS-CRATE ?auto_664842 ) ( not ( = ?auto_664833 ?auto_664842 ) ) ( not ( = ?auto_664834 ?auto_664842 ) ) ( not ( = ?auto_664837 ?auto_664842 ) ) ( not ( = ?auto_664838 ?auto_664842 ) ) )
    :subtasks
    ( ( !LOAD ?auto_664841 ?auto_664842 ?auto_664839 ?auto_664840 )
      ( MAKE-1CRATE ?auto_664833 ?auto_664834 )
      ( MAKE-1CRATE-VERIFY ?auto_664833 ?auto_664834 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671110 - SURFACE
      ?auto_671111 - SURFACE
      ?auto_671112 - SURFACE
      ?auto_671109 - SURFACE
      ?auto_671113 - SURFACE
      ?auto_671115 - SURFACE
      ?auto_671114 - SURFACE
      ?auto_671116 - SURFACE
      ?auto_671117 - SURFACE
      ?auto_671118 - SURFACE
      ?auto_671119 - SURFACE
      ?auto_671120 - SURFACE
    )
    :vars
    (
      ?auto_671121 - HOIST
      ?auto_671122 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671121 ?auto_671122 ) ( SURFACE-AT ?auto_671119 ?auto_671122 ) ( CLEAR ?auto_671119 ) ( LIFTING ?auto_671121 ?auto_671120 ) ( IS-CRATE ?auto_671120 ) ( not ( = ?auto_671119 ?auto_671120 ) ) ( ON ?auto_671111 ?auto_671110 ) ( ON ?auto_671112 ?auto_671111 ) ( ON ?auto_671109 ?auto_671112 ) ( ON ?auto_671113 ?auto_671109 ) ( ON ?auto_671115 ?auto_671113 ) ( ON ?auto_671114 ?auto_671115 ) ( ON ?auto_671116 ?auto_671114 ) ( ON ?auto_671117 ?auto_671116 ) ( ON ?auto_671118 ?auto_671117 ) ( ON ?auto_671119 ?auto_671118 ) ( not ( = ?auto_671110 ?auto_671111 ) ) ( not ( = ?auto_671110 ?auto_671112 ) ) ( not ( = ?auto_671110 ?auto_671109 ) ) ( not ( = ?auto_671110 ?auto_671113 ) ) ( not ( = ?auto_671110 ?auto_671115 ) ) ( not ( = ?auto_671110 ?auto_671114 ) ) ( not ( = ?auto_671110 ?auto_671116 ) ) ( not ( = ?auto_671110 ?auto_671117 ) ) ( not ( = ?auto_671110 ?auto_671118 ) ) ( not ( = ?auto_671110 ?auto_671119 ) ) ( not ( = ?auto_671110 ?auto_671120 ) ) ( not ( = ?auto_671111 ?auto_671112 ) ) ( not ( = ?auto_671111 ?auto_671109 ) ) ( not ( = ?auto_671111 ?auto_671113 ) ) ( not ( = ?auto_671111 ?auto_671115 ) ) ( not ( = ?auto_671111 ?auto_671114 ) ) ( not ( = ?auto_671111 ?auto_671116 ) ) ( not ( = ?auto_671111 ?auto_671117 ) ) ( not ( = ?auto_671111 ?auto_671118 ) ) ( not ( = ?auto_671111 ?auto_671119 ) ) ( not ( = ?auto_671111 ?auto_671120 ) ) ( not ( = ?auto_671112 ?auto_671109 ) ) ( not ( = ?auto_671112 ?auto_671113 ) ) ( not ( = ?auto_671112 ?auto_671115 ) ) ( not ( = ?auto_671112 ?auto_671114 ) ) ( not ( = ?auto_671112 ?auto_671116 ) ) ( not ( = ?auto_671112 ?auto_671117 ) ) ( not ( = ?auto_671112 ?auto_671118 ) ) ( not ( = ?auto_671112 ?auto_671119 ) ) ( not ( = ?auto_671112 ?auto_671120 ) ) ( not ( = ?auto_671109 ?auto_671113 ) ) ( not ( = ?auto_671109 ?auto_671115 ) ) ( not ( = ?auto_671109 ?auto_671114 ) ) ( not ( = ?auto_671109 ?auto_671116 ) ) ( not ( = ?auto_671109 ?auto_671117 ) ) ( not ( = ?auto_671109 ?auto_671118 ) ) ( not ( = ?auto_671109 ?auto_671119 ) ) ( not ( = ?auto_671109 ?auto_671120 ) ) ( not ( = ?auto_671113 ?auto_671115 ) ) ( not ( = ?auto_671113 ?auto_671114 ) ) ( not ( = ?auto_671113 ?auto_671116 ) ) ( not ( = ?auto_671113 ?auto_671117 ) ) ( not ( = ?auto_671113 ?auto_671118 ) ) ( not ( = ?auto_671113 ?auto_671119 ) ) ( not ( = ?auto_671113 ?auto_671120 ) ) ( not ( = ?auto_671115 ?auto_671114 ) ) ( not ( = ?auto_671115 ?auto_671116 ) ) ( not ( = ?auto_671115 ?auto_671117 ) ) ( not ( = ?auto_671115 ?auto_671118 ) ) ( not ( = ?auto_671115 ?auto_671119 ) ) ( not ( = ?auto_671115 ?auto_671120 ) ) ( not ( = ?auto_671114 ?auto_671116 ) ) ( not ( = ?auto_671114 ?auto_671117 ) ) ( not ( = ?auto_671114 ?auto_671118 ) ) ( not ( = ?auto_671114 ?auto_671119 ) ) ( not ( = ?auto_671114 ?auto_671120 ) ) ( not ( = ?auto_671116 ?auto_671117 ) ) ( not ( = ?auto_671116 ?auto_671118 ) ) ( not ( = ?auto_671116 ?auto_671119 ) ) ( not ( = ?auto_671116 ?auto_671120 ) ) ( not ( = ?auto_671117 ?auto_671118 ) ) ( not ( = ?auto_671117 ?auto_671119 ) ) ( not ( = ?auto_671117 ?auto_671120 ) ) ( not ( = ?auto_671118 ?auto_671119 ) ) ( not ( = ?auto_671118 ?auto_671120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_671119 ?auto_671120 )
      ( MAKE-11CRATE-VERIFY ?auto_671110 ?auto_671111 ?auto_671112 ?auto_671109 ?auto_671113 ?auto_671115 ?auto_671114 ?auto_671116 ?auto_671117 ?auto_671118 ?auto_671119 ?auto_671120 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671219 - SURFACE
      ?auto_671220 - SURFACE
      ?auto_671221 - SURFACE
      ?auto_671218 - SURFACE
      ?auto_671222 - SURFACE
      ?auto_671224 - SURFACE
      ?auto_671223 - SURFACE
      ?auto_671225 - SURFACE
      ?auto_671226 - SURFACE
      ?auto_671227 - SURFACE
      ?auto_671228 - SURFACE
      ?auto_671229 - SURFACE
    )
    :vars
    (
      ?auto_671231 - HOIST
      ?auto_671230 - PLACE
      ?auto_671232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671231 ?auto_671230 ) ( SURFACE-AT ?auto_671228 ?auto_671230 ) ( CLEAR ?auto_671228 ) ( IS-CRATE ?auto_671229 ) ( not ( = ?auto_671228 ?auto_671229 ) ) ( TRUCK-AT ?auto_671232 ?auto_671230 ) ( AVAILABLE ?auto_671231 ) ( IN ?auto_671229 ?auto_671232 ) ( ON ?auto_671228 ?auto_671227 ) ( not ( = ?auto_671227 ?auto_671228 ) ) ( not ( = ?auto_671227 ?auto_671229 ) ) ( ON ?auto_671220 ?auto_671219 ) ( ON ?auto_671221 ?auto_671220 ) ( ON ?auto_671218 ?auto_671221 ) ( ON ?auto_671222 ?auto_671218 ) ( ON ?auto_671224 ?auto_671222 ) ( ON ?auto_671223 ?auto_671224 ) ( ON ?auto_671225 ?auto_671223 ) ( ON ?auto_671226 ?auto_671225 ) ( ON ?auto_671227 ?auto_671226 ) ( not ( = ?auto_671219 ?auto_671220 ) ) ( not ( = ?auto_671219 ?auto_671221 ) ) ( not ( = ?auto_671219 ?auto_671218 ) ) ( not ( = ?auto_671219 ?auto_671222 ) ) ( not ( = ?auto_671219 ?auto_671224 ) ) ( not ( = ?auto_671219 ?auto_671223 ) ) ( not ( = ?auto_671219 ?auto_671225 ) ) ( not ( = ?auto_671219 ?auto_671226 ) ) ( not ( = ?auto_671219 ?auto_671227 ) ) ( not ( = ?auto_671219 ?auto_671228 ) ) ( not ( = ?auto_671219 ?auto_671229 ) ) ( not ( = ?auto_671220 ?auto_671221 ) ) ( not ( = ?auto_671220 ?auto_671218 ) ) ( not ( = ?auto_671220 ?auto_671222 ) ) ( not ( = ?auto_671220 ?auto_671224 ) ) ( not ( = ?auto_671220 ?auto_671223 ) ) ( not ( = ?auto_671220 ?auto_671225 ) ) ( not ( = ?auto_671220 ?auto_671226 ) ) ( not ( = ?auto_671220 ?auto_671227 ) ) ( not ( = ?auto_671220 ?auto_671228 ) ) ( not ( = ?auto_671220 ?auto_671229 ) ) ( not ( = ?auto_671221 ?auto_671218 ) ) ( not ( = ?auto_671221 ?auto_671222 ) ) ( not ( = ?auto_671221 ?auto_671224 ) ) ( not ( = ?auto_671221 ?auto_671223 ) ) ( not ( = ?auto_671221 ?auto_671225 ) ) ( not ( = ?auto_671221 ?auto_671226 ) ) ( not ( = ?auto_671221 ?auto_671227 ) ) ( not ( = ?auto_671221 ?auto_671228 ) ) ( not ( = ?auto_671221 ?auto_671229 ) ) ( not ( = ?auto_671218 ?auto_671222 ) ) ( not ( = ?auto_671218 ?auto_671224 ) ) ( not ( = ?auto_671218 ?auto_671223 ) ) ( not ( = ?auto_671218 ?auto_671225 ) ) ( not ( = ?auto_671218 ?auto_671226 ) ) ( not ( = ?auto_671218 ?auto_671227 ) ) ( not ( = ?auto_671218 ?auto_671228 ) ) ( not ( = ?auto_671218 ?auto_671229 ) ) ( not ( = ?auto_671222 ?auto_671224 ) ) ( not ( = ?auto_671222 ?auto_671223 ) ) ( not ( = ?auto_671222 ?auto_671225 ) ) ( not ( = ?auto_671222 ?auto_671226 ) ) ( not ( = ?auto_671222 ?auto_671227 ) ) ( not ( = ?auto_671222 ?auto_671228 ) ) ( not ( = ?auto_671222 ?auto_671229 ) ) ( not ( = ?auto_671224 ?auto_671223 ) ) ( not ( = ?auto_671224 ?auto_671225 ) ) ( not ( = ?auto_671224 ?auto_671226 ) ) ( not ( = ?auto_671224 ?auto_671227 ) ) ( not ( = ?auto_671224 ?auto_671228 ) ) ( not ( = ?auto_671224 ?auto_671229 ) ) ( not ( = ?auto_671223 ?auto_671225 ) ) ( not ( = ?auto_671223 ?auto_671226 ) ) ( not ( = ?auto_671223 ?auto_671227 ) ) ( not ( = ?auto_671223 ?auto_671228 ) ) ( not ( = ?auto_671223 ?auto_671229 ) ) ( not ( = ?auto_671225 ?auto_671226 ) ) ( not ( = ?auto_671225 ?auto_671227 ) ) ( not ( = ?auto_671225 ?auto_671228 ) ) ( not ( = ?auto_671225 ?auto_671229 ) ) ( not ( = ?auto_671226 ?auto_671227 ) ) ( not ( = ?auto_671226 ?auto_671228 ) ) ( not ( = ?auto_671226 ?auto_671229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671227 ?auto_671228 ?auto_671229 )
      ( MAKE-11CRATE-VERIFY ?auto_671219 ?auto_671220 ?auto_671221 ?auto_671218 ?auto_671222 ?auto_671224 ?auto_671223 ?auto_671225 ?auto_671226 ?auto_671227 ?auto_671228 ?auto_671229 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671340 - SURFACE
      ?auto_671341 - SURFACE
      ?auto_671342 - SURFACE
      ?auto_671339 - SURFACE
      ?auto_671343 - SURFACE
      ?auto_671345 - SURFACE
      ?auto_671344 - SURFACE
      ?auto_671346 - SURFACE
      ?auto_671347 - SURFACE
      ?auto_671348 - SURFACE
      ?auto_671349 - SURFACE
      ?auto_671350 - SURFACE
    )
    :vars
    (
      ?auto_671353 - HOIST
      ?auto_671354 - PLACE
      ?auto_671351 - TRUCK
      ?auto_671352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671353 ?auto_671354 ) ( SURFACE-AT ?auto_671349 ?auto_671354 ) ( CLEAR ?auto_671349 ) ( IS-CRATE ?auto_671350 ) ( not ( = ?auto_671349 ?auto_671350 ) ) ( AVAILABLE ?auto_671353 ) ( IN ?auto_671350 ?auto_671351 ) ( ON ?auto_671349 ?auto_671348 ) ( not ( = ?auto_671348 ?auto_671349 ) ) ( not ( = ?auto_671348 ?auto_671350 ) ) ( TRUCK-AT ?auto_671351 ?auto_671352 ) ( not ( = ?auto_671352 ?auto_671354 ) ) ( ON ?auto_671341 ?auto_671340 ) ( ON ?auto_671342 ?auto_671341 ) ( ON ?auto_671339 ?auto_671342 ) ( ON ?auto_671343 ?auto_671339 ) ( ON ?auto_671345 ?auto_671343 ) ( ON ?auto_671344 ?auto_671345 ) ( ON ?auto_671346 ?auto_671344 ) ( ON ?auto_671347 ?auto_671346 ) ( ON ?auto_671348 ?auto_671347 ) ( not ( = ?auto_671340 ?auto_671341 ) ) ( not ( = ?auto_671340 ?auto_671342 ) ) ( not ( = ?auto_671340 ?auto_671339 ) ) ( not ( = ?auto_671340 ?auto_671343 ) ) ( not ( = ?auto_671340 ?auto_671345 ) ) ( not ( = ?auto_671340 ?auto_671344 ) ) ( not ( = ?auto_671340 ?auto_671346 ) ) ( not ( = ?auto_671340 ?auto_671347 ) ) ( not ( = ?auto_671340 ?auto_671348 ) ) ( not ( = ?auto_671340 ?auto_671349 ) ) ( not ( = ?auto_671340 ?auto_671350 ) ) ( not ( = ?auto_671341 ?auto_671342 ) ) ( not ( = ?auto_671341 ?auto_671339 ) ) ( not ( = ?auto_671341 ?auto_671343 ) ) ( not ( = ?auto_671341 ?auto_671345 ) ) ( not ( = ?auto_671341 ?auto_671344 ) ) ( not ( = ?auto_671341 ?auto_671346 ) ) ( not ( = ?auto_671341 ?auto_671347 ) ) ( not ( = ?auto_671341 ?auto_671348 ) ) ( not ( = ?auto_671341 ?auto_671349 ) ) ( not ( = ?auto_671341 ?auto_671350 ) ) ( not ( = ?auto_671342 ?auto_671339 ) ) ( not ( = ?auto_671342 ?auto_671343 ) ) ( not ( = ?auto_671342 ?auto_671345 ) ) ( not ( = ?auto_671342 ?auto_671344 ) ) ( not ( = ?auto_671342 ?auto_671346 ) ) ( not ( = ?auto_671342 ?auto_671347 ) ) ( not ( = ?auto_671342 ?auto_671348 ) ) ( not ( = ?auto_671342 ?auto_671349 ) ) ( not ( = ?auto_671342 ?auto_671350 ) ) ( not ( = ?auto_671339 ?auto_671343 ) ) ( not ( = ?auto_671339 ?auto_671345 ) ) ( not ( = ?auto_671339 ?auto_671344 ) ) ( not ( = ?auto_671339 ?auto_671346 ) ) ( not ( = ?auto_671339 ?auto_671347 ) ) ( not ( = ?auto_671339 ?auto_671348 ) ) ( not ( = ?auto_671339 ?auto_671349 ) ) ( not ( = ?auto_671339 ?auto_671350 ) ) ( not ( = ?auto_671343 ?auto_671345 ) ) ( not ( = ?auto_671343 ?auto_671344 ) ) ( not ( = ?auto_671343 ?auto_671346 ) ) ( not ( = ?auto_671343 ?auto_671347 ) ) ( not ( = ?auto_671343 ?auto_671348 ) ) ( not ( = ?auto_671343 ?auto_671349 ) ) ( not ( = ?auto_671343 ?auto_671350 ) ) ( not ( = ?auto_671345 ?auto_671344 ) ) ( not ( = ?auto_671345 ?auto_671346 ) ) ( not ( = ?auto_671345 ?auto_671347 ) ) ( not ( = ?auto_671345 ?auto_671348 ) ) ( not ( = ?auto_671345 ?auto_671349 ) ) ( not ( = ?auto_671345 ?auto_671350 ) ) ( not ( = ?auto_671344 ?auto_671346 ) ) ( not ( = ?auto_671344 ?auto_671347 ) ) ( not ( = ?auto_671344 ?auto_671348 ) ) ( not ( = ?auto_671344 ?auto_671349 ) ) ( not ( = ?auto_671344 ?auto_671350 ) ) ( not ( = ?auto_671346 ?auto_671347 ) ) ( not ( = ?auto_671346 ?auto_671348 ) ) ( not ( = ?auto_671346 ?auto_671349 ) ) ( not ( = ?auto_671346 ?auto_671350 ) ) ( not ( = ?auto_671347 ?auto_671348 ) ) ( not ( = ?auto_671347 ?auto_671349 ) ) ( not ( = ?auto_671347 ?auto_671350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671348 ?auto_671349 ?auto_671350 )
      ( MAKE-11CRATE-VERIFY ?auto_671340 ?auto_671341 ?auto_671342 ?auto_671339 ?auto_671343 ?auto_671345 ?auto_671344 ?auto_671346 ?auto_671347 ?auto_671348 ?auto_671349 ?auto_671350 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671472 - SURFACE
      ?auto_671473 - SURFACE
      ?auto_671474 - SURFACE
      ?auto_671471 - SURFACE
      ?auto_671475 - SURFACE
      ?auto_671477 - SURFACE
      ?auto_671476 - SURFACE
      ?auto_671478 - SURFACE
      ?auto_671479 - SURFACE
      ?auto_671480 - SURFACE
      ?auto_671481 - SURFACE
      ?auto_671482 - SURFACE
    )
    :vars
    (
      ?auto_671484 - HOIST
      ?auto_671485 - PLACE
      ?auto_671486 - TRUCK
      ?auto_671483 - PLACE
      ?auto_671487 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_671484 ?auto_671485 ) ( SURFACE-AT ?auto_671481 ?auto_671485 ) ( CLEAR ?auto_671481 ) ( IS-CRATE ?auto_671482 ) ( not ( = ?auto_671481 ?auto_671482 ) ) ( AVAILABLE ?auto_671484 ) ( ON ?auto_671481 ?auto_671480 ) ( not ( = ?auto_671480 ?auto_671481 ) ) ( not ( = ?auto_671480 ?auto_671482 ) ) ( TRUCK-AT ?auto_671486 ?auto_671483 ) ( not ( = ?auto_671483 ?auto_671485 ) ) ( HOIST-AT ?auto_671487 ?auto_671483 ) ( LIFTING ?auto_671487 ?auto_671482 ) ( not ( = ?auto_671484 ?auto_671487 ) ) ( ON ?auto_671473 ?auto_671472 ) ( ON ?auto_671474 ?auto_671473 ) ( ON ?auto_671471 ?auto_671474 ) ( ON ?auto_671475 ?auto_671471 ) ( ON ?auto_671477 ?auto_671475 ) ( ON ?auto_671476 ?auto_671477 ) ( ON ?auto_671478 ?auto_671476 ) ( ON ?auto_671479 ?auto_671478 ) ( ON ?auto_671480 ?auto_671479 ) ( not ( = ?auto_671472 ?auto_671473 ) ) ( not ( = ?auto_671472 ?auto_671474 ) ) ( not ( = ?auto_671472 ?auto_671471 ) ) ( not ( = ?auto_671472 ?auto_671475 ) ) ( not ( = ?auto_671472 ?auto_671477 ) ) ( not ( = ?auto_671472 ?auto_671476 ) ) ( not ( = ?auto_671472 ?auto_671478 ) ) ( not ( = ?auto_671472 ?auto_671479 ) ) ( not ( = ?auto_671472 ?auto_671480 ) ) ( not ( = ?auto_671472 ?auto_671481 ) ) ( not ( = ?auto_671472 ?auto_671482 ) ) ( not ( = ?auto_671473 ?auto_671474 ) ) ( not ( = ?auto_671473 ?auto_671471 ) ) ( not ( = ?auto_671473 ?auto_671475 ) ) ( not ( = ?auto_671473 ?auto_671477 ) ) ( not ( = ?auto_671473 ?auto_671476 ) ) ( not ( = ?auto_671473 ?auto_671478 ) ) ( not ( = ?auto_671473 ?auto_671479 ) ) ( not ( = ?auto_671473 ?auto_671480 ) ) ( not ( = ?auto_671473 ?auto_671481 ) ) ( not ( = ?auto_671473 ?auto_671482 ) ) ( not ( = ?auto_671474 ?auto_671471 ) ) ( not ( = ?auto_671474 ?auto_671475 ) ) ( not ( = ?auto_671474 ?auto_671477 ) ) ( not ( = ?auto_671474 ?auto_671476 ) ) ( not ( = ?auto_671474 ?auto_671478 ) ) ( not ( = ?auto_671474 ?auto_671479 ) ) ( not ( = ?auto_671474 ?auto_671480 ) ) ( not ( = ?auto_671474 ?auto_671481 ) ) ( not ( = ?auto_671474 ?auto_671482 ) ) ( not ( = ?auto_671471 ?auto_671475 ) ) ( not ( = ?auto_671471 ?auto_671477 ) ) ( not ( = ?auto_671471 ?auto_671476 ) ) ( not ( = ?auto_671471 ?auto_671478 ) ) ( not ( = ?auto_671471 ?auto_671479 ) ) ( not ( = ?auto_671471 ?auto_671480 ) ) ( not ( = ?auto_671471 ?auto_671481 ) ) ( not ( = ?auto_671471 ?auto_671482 ) ) ( not ( = ?auto_671475 ?auto_671477 ) ) ( not ( = ?auto_671475 ?auto_671476 ) ) ( not ( = ?auto_671475 ?auto_671478 ) ) ( not ( = ?auto_671475 ?auto_671479 ) ) ( not ( = ?auto_671475 ?auto_671480 ) ) ( not ( = ?auto_671475 ?auto_671481 ) ) ( not ( = ?auto_671475 ?auto_671482 ) ) ( not ( = ?auto_671477 ?auto_671476 ) ) ( not ( = ?auto_671477 ?auto_671478 ) ) ( not ( = ?auto_671477 ?auto_671479 ) ) ( not ( = ?auto_671477 ?auto_671480 ) ) ( not ( = ?auto_671477 ?auto_671481 ) ) ( not ( = ?auto_671477 ?auto_671482 ) ) ( not ( = ?auto_671476 ?auto_671478 ) ) ( not ( = ?auto_671476 ?auto_671479 ) ) ( not ( = ?auto_671476 ?auto_671480 ) ) ( not ( = ?auto_671476 ?auto_671481 ) ) ( not ( = ?auto_671476 ?auto_671482 ) ) ( not ( = ?auto_671478 ?auto_671479 ) ) ( not ( = ?auto_671478 ?auto_671480 ) ) ( not ( = ?auto_671478 ?auto_671481 ) ) ( not ( = ?auto_671478 ?auto_671482 ) ) ( not ( = ?auto_671479 ?auto_671480 ) ) ( not ( = ?auto_671479 ?auto_671481 ) ) ( not ( = ?auto_671479 ?auto_671482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671480 ?auto_671481 ?auto_671482 )
      ( MAKE-11CRATE-VERIFY ?auto_671472 ?auto_671473 ?auto_671474 ?auto_671471 ?auto_671475 ?auto_671477 ?auto_671476 ?auto_671478 ?auto_671479 ?auto_671480 ?auto_671481 ?auto_671482 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671615 - SURFACE
      ?auto_671616 - SURFACE
      ?auto_671617 - SURFACE
      ?auto_671614 - SURFACE
      ?auto_671618 - SURFACE
      ?auto_671620 - SURFACE
      ?auto_671619 - SURFACE
      ?auto_671621 - SURFACE
      ?auto_671622 - SURFACE
      ?auto_671623 - SURFACE
      ?auto_671624 - SURFACE
      ?auto_671625 - SURFACE
    )
    :vars
    (
      ?auto_671626 - HOIST
      ?auto_671630 - PLACE
      ?auto_671628 - TRUCK
      ?auto_671629 - PLACE
      ?auto_671631 - HOIST
      ?auto_671627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671626 ?auto_671630 ) ( SURFACE-AT ?auto_671624 ?auto_671630 ) ( CLEAR ?auto_671624 ) ( IS-CRATE ?auto_671625 ) ( not ( = ?auto_671624 ?auto_671625 ) ) ( AVAILABLE ?auto_671626 ) ( ON ?auto_671624 ?auto_671623 ) ( not ( = ?auto_671623 ?auto_671624 ) ) ( not ( = ?auto_671623 ?auto_671625 ) ) ( TRUCK-AT ?auto_671628 ?auto_671629 ) ( not ( = ?auto_671629 ?auto_671630 ) ) ( HOIST-AT ?auto_671631 ?auto_671629 ) ( not ( = ?auto_671626 ?auto_671631 ) ) ( AVAILABLE ?auto_671631 ) ( SURFACE-AT ?auto_671625 ?auto_671629 ) ( ON ?auto_671625 ?auto_671627 ) ( CLEAR ?auto_671625 ) ( not ( = ?auto_671624 ?auto_671627 ) ) ( not ( = ?auto_671625 ?auto_671627 ) ) ( not ( = ?auto_671623 ?auto_671627 ) ) ( ON ?auto_671616 ?auto_671615 ) ( ON ?auto_671617 ?auto_671616 ) ( ON ?auto_671614 ?auto_671617 ) ( ON ?auto_671618 ?auto_671614 ) ( ON ?auto_671620 ?auto_671618 ) ( ON ?auto_671619 ?auto_671620 ) ( ON ?auto_671621 ?auto_671619 ) ( ON ?auto_671622 ?auto_671621 ) ( ON ?auto_671623 ?auto_671622 ) ( not ( = ?auto_671615 ?auto_671616 ) ) ( not ( = ?auto_671615 ?auto_671617 ) ) ( not ( = ?auto_671615 ?auto_671614 ) ) ( not ( = ?auto_671615 ?auto_671618 ) ) ( not ( = ?auto_671615 ?auto_671620 ) ) ( not ( = ?auto_671615 ?auto_671619 ) ) ( not ( = ?auto_671615 ?auto_671621 ) ) ( not ( = ?auto_671615 ?auto_671622 ) ) ( not ( = ?auto_671615 ?auto_671623 ) ) ( not ( = ?auto_671615 ?auto_671624 ) ) ( not ( = ?auto_671615 ?auto_671625 ) ) ( not ( = ?auto_671615 ?auto_671627 ) ) ( not ( = ?auto_671616 ?auto_671617 ) ) ( not ( = ?auto_671616 ?auto_671614 ) ) ( not ( = ?auto_671616 ?auto_671618 ) ) ( not ( = ?auto_671616 ?auto_671620 ) ) ( not ( = ?auto_671616 ?auto_671619 ) ) ( not ( = ?auto_671616 ?auto_671621 ) ) ( not ( = ?auto_671616 ?auto_671622 ) ) ( not ( = ?auto_671616 ?auto_671623 ) ) ( not ( = ?auto_671616 ?auto_671624 ) ) ( not ( = ?auto_671616 ?auto_671625 ) ) ( not ( = ?auto_671616 ?auto_671627 ) ) ( not ( = ?auto_671617 ?auto_671614 ) ) ( not ( = ?auto_671617 ?auto_671618 ) ) ( not ( = ?auto_671617 ?auto_671620 ) ) ( not ( = ?auto_671617 ?auto_671619 ) ) ( not ( = ?auto_671617 ?auto_671621 ) ) ( not ( = ?auto_671617 ?auto_671622 ) ) ( not ( = ?auto_671617 ?auto_671623 ) ) ( not ( = ?auto_671617 ?auto_671624 ) ) ( not ( = ?auto_671617 ?auto_671625 ) ) ( not ( = ?auto_671617 ?auto_671627 ) ) ( not ( = ?auto_671614 ?auto_671618 ) ) ( not ( = ?auto_671614 ?auto_671620 ) ) ( not ( = ?auto_671614 ?auto_671619 ) ) ( not ( = ?auto_671614 ?auto_671621 ) ) ( not ( = ?auto_671614 ?auto_671622 ) ) ( not ( = ?auto_671614 ?auto_671623 ) ) ( not ( = ?auto_671614 ?auto_671624 ) ) ( not ( = ?auto_671614 ?auto_671625 ) ) ( not ( = ?auto_671614 ?auto_671627 ) ) ( not ( = ?auto_671618 ?auto_671620 ) ) ( not ( = ?auto_671618 ?auto_671619 ) ) ( not ( = ?auto_671618 ?auto_671621 ) ) ( not ( = ?auto_671618 ?auto_671622 ) ) ( not ( = ?auto_671618 ?auto_671623 ) ) ( not ( = ?auto_671618 ?auto_671624 ) ) ( not ( = ?auto_671618 ?auto_671625 ) ) ( not ( = ?auto_671618 ?auto_671627 ) ) ( not ( = ?auto_671620 ?auto_671619 ) ) ( not ( = ?auto_671620 ?auto_671621 ) ) ( not ( = ?auto_671620 ?auto_671622 ) ) ( not ( = ?auto_671620 ?auto_671623 ) ) ( not ( = ?auto_671620 ?auto_671624 ) ) ( not ( = ?auto_671620 ?auto_671625 ) ) ( not ( = ?auto_671620 ?auto_671627 ) ) ( not ( = ?auto_671619 ?auto_671621 ) ) ( not ( = ?auto_671619 ?auto_671622 ) ) ( not ( = ?auto_671619 ?auto_671623 ) ) ( not ( = ?auto_671619 ?auto_671624 ) ) ( not ( = ?auto_671619 ?auto_671625 ) ) ( not ( = ?auto_671619 ?auto_671627 ) ) ( not ( = ?auto_671621 ?auto_671622 ) ) ( not ( = ?auto_671621 ?auto_671623 ) ) ( not ( = ?auto_671621 ?auto_671624 ) ) ( not ( = ?auto_671621 ?auto_671625 ) ) ( not ( = ?auto_671621 ?auto_671627 ) ) ( not ( = ?auto_671622 ?auto_671623 ) ) ( not ( = ?auto_671622 ?auto_671624 ) ) ( not ( = ?auto_671622 ?auto_671625 ) ) ( not ( = ?auto_671622 ?auto_671627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671623 ?auto_671624 ?auto_671625 )
      ( MAKE-11CRATE-VERIFY ?auto_671615 ?auto_671616 ?auto_671617 ?auto_671614 ?auto_671618 ?auto_671620 ?auto_671619 ?auto_671621 ?auto_671622 ?auto_671623 ?auto_671624 ?auto_671625 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671759 - SURFACE
      ?auto_671760 - SURFACE
      ?auto_671761 - SURFACE
      ?auto_671758 - SURFACE
      ?auto_671762 - SURFACE
      ?auto_671764 - SURFACE
      ?auto_671763 - SURFACE
      ?auto_671765 - SURFACE
      ?auto_671766 - SURFACE
      ?auto_671767 - SURFACE
      ?auto_671768 - SURFACE
      ?auto_671769 - SURFACE
    )
    :vars
    (
      ?auto_671771 - HOIST
      ?auto_671773 - PLACE
      ?auto_671772 - PLACE
      ?auto_671770 - HOIST
      ?auto_671775 - SURFACE
      ?auto_671774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671771 ?auto_671773 ) ( SURFACE-AT ?auto_671768 ?auto_671773 ) ( CLEAR ?auto_671768 ) ( IS-CRATE ?auto_671769 ) ( not ( = ?auto_671768 ?auto_671769 ) ) ( AVAILABLE ?auto_671771 ) ( ON ?auto_671768 ?auto_671767 ) ( not ( = ?auto_671767 ?auto_671768 ) ) ( not ( = ?auto_671767 ?auto_671769 ) ) ( not ( = ?auto_671772 ?auto_671773 ) ) ( HOIST-AT ?auto_671770 ?auto_671772 ) ( not ( = ?auto_671771 ?auto_671770 ) ) ( AVAILABLE ?auto_671770 ) ( SURFACE-AT ?auto_671769 ?auto_671772 ) ( ON ?auto_671769 ?auto_671775 ) ( CLEAR ?auto_671769 ) ( not ( = ?auto_671768 ?auto_671775 ) ) ( not ( = ?auto_671769 ?auto_671775 ) ) ( not ( = ?auto_671767 ?auto_671775 ) ) ( TRUCK-AT ?auto_671774 ?auto_671773 ) ( ON ?auto_671760 ?auto_671759 ) ( ON ?auto_671761 ?auto_671760 ) ( ON ?auto_671758 ?auto_671761 ) ( ON ?auto_671762 ?auto_671758 ) ( ON ?auto_671764 ?auto_671762 ) ( ON ?auto_671763 ?auto_671764 ) ( ON ?auto_671765 ?auto_671763 ) ( ON ?auto_671766 ?auto_671765 ) ( ON ?auto_671767 ?auto_671766 ) ( not ( = ?auto_671759 ?auto_671760 ) ) ( not ( = ?auto_671759 ?auto_671761 ) ) ( not ( = ?auto_671759 ?auto_671758 ) ) ( not ( = ?auto_671759 ?auto_671762 ) ) ( not ( = ?auto_671759 ?auto_671764 ) ) ( not ( = ?auto_671759 ?auto_671763 ) ) ( not ( = ?auto_671759 ?auto_671765 ) ) ( not ( = ?auto_671759 ?auto_671766 ) ) ( not ( = ?auto_671759 ?auto_671767 ) ) ( not ( = ?auto_671759 ?auto_671768 ) ) ( not ( = ?auto_671759 ?auto_671769 ) ) ( not ( = ?auto_671759 ?auto_671775 ) ) ( not ( = ?auto_671760 ?auto_671761 ) ) ( not ( = ?auto_671760 ?auto_671758 ) ) ( not ( = ?auto_671760 ?auto_671762 ) ) ( not ( = ?auto_671760 ?auto_671764 ) ) ( not ( = ?auto_671760 ?auto_671763 ) ) ( not ( = ?auto_671760 ?auto_671765 ) ) ( not ( = ?auto_671760 ?auto_671766 ) ) ( not ( = ?auto_671760 ?auto_671767 ) ) ( not ( = ?auto_671760 ?auto_671768 ) ) ( not ( = ?auto_671760 ?auto_671769 ) ) ( not ( = ?auto_671760 ?auto_671775 ) ) ( not ( = ?auto_671761 ?auto_671758 ) ) ( not ( = ?auto_671761 ?auto_671762 ) ) ( not ( = ?auto_671761 ?auto_671764 ) ) ( not ( = ?auto_671761 ?auto_671763 ) ) ( not ( = ?auto_671761 ?auto_671765 ) ) ( not ( = ?auto_671761 ?auto_671766 ) ) ( not ( = ?auto_671761 ?auto_671767 ) ) ( not ( = ?auto_671761 ?auto_671768 ) ) ( not ( = ?auto_671761 ?auto_671769 ) ) ( not ( = ?auto_671761 ?auto_671775 ) ) ( not ( = ?auto_671758 ?auto_671762 ) ) ( not ( = ?auto_671758 ?auto_671764 ) ) ( not ( = ?auto_671758 ?auto_671763 ) ) ( not ( = ?auto_671758 ?auto_671765 ) ) ( not ( = ?auto_671758 ?auto_671766 ) ) ( not ( = ?auto_671758 ?auto_671767 ) ) ( not ( = ?auto_671758 ?auto_671768 ) ) ( not ( = ?auto_671758 ?auto_671769 ) ) ( not ( = ?auto_671758 ?auto_671775 ) ) ( not ( = ?auto_671762 ?auto_671764 ) ) ( not ( = ?auto_671762 ?auto_671763 ) ) ( not ( = ?auto_671762 ?auto_671765 ) ) ( not ( = ?auto_671762 ?auto_671766 ) ) ( not ( = ?auto_671762 ?auto_671767 ) ) ( not ( = ?auto_671762 ?auto_671768 ) ) ( not ( = ?auto_671762 ?auto_671769 ) ) ( not ( = ?auto_671762 ?auto_671775 ) ) ( not ( = ?auto_671764 ?auto_671763 ) ) ( not ( = ?auto_671764 ?auto_671765 ) ) ( not ( = ?auto_671764 ?auto_671766 ) ) ( not ( = ?auto_671764 ?auto_671767 ) ) ( not ( = ?auto_671764 ?auto_671768 ) ) ( not ( = ?auto_671764 ?auto_671769 ) ) ( not ( = ?auto_671764 ?auto_671775 ) ) ( not ( = ?auto_671763 ?auto_671765 ) ) ( not ( = ?auto_671763 ?auto_671766 ) ) ( not ( = ?auto_671763 ?auto_671767 ) ) ( not ( = ?auto_671763 ?auto_671768 ) ) ( not ( = ?auto_671763 ?auto_671769 ) ) ( not ( = ?auto_671763 ?auto_671775 ) ) ( not ( = ?auto_671765 ?auto_671766 ) ) ( not ( = ?auto_671765 ?auto_671767 ) ) ( not ( = ?auto_671765 ?auto_671768 ) ) ( not ( = ?auto_671765 ?auto_671769 ) ) ( not ( = ?auto_671765 ?auto_671775 ) ) ( not ( = ?auto_671766 ?auto_671767 ) ) ( not ( = ?auto_671766 ?auto_671768 ) ) ( not ( = ?auto_671766 ?auto_671769 ) ) ( not ( = ?auto_671766 ?auto_671775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671767 ?auto_671768 ?auto_671769 )
      ( MAKE-11CRATE-VERIFY ?auto_671759 ?auto_671760 ?auto_671761 ?auto_671758 ?auto_671762 ?auto_671764 ?auto_671763 ?auto_671765 ?auto_671766 ?auto_671767 ?auto_671768 ?auto_671769 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671903 - SURFACE
      ?auto_671904 - SURFACE
      ?auto_671905 - SURFACE
      ?auto_671902 - SURFACE
      ?auto_671906 - SURFACE
      ?auto_671908 - SURFACE
      ?auto_671907 - SURFACE
      ?auto_671909 - SURFACE
      ?auto_671910 - SURFACE
      ?auto_671911 - SURFACE
      ?auto_671912 - SURFACE
      ?auto_671913 - SURFACE
    )
    :vars
    (
      ?auto_671914 - HOIST
      ?auto_671916 - PLACE
      ?auto_671918 - PLACE
      ?auto_671919 - HOIST
      ?auto_671915 - SURFACE
      ?auto_671917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671914 ?auto_671916 ) ( IS-CRATE ?auto_671913 ) ( not ( = ?auto_671912 ?auto_671913 ) ) ( not ( = ?auto_671911 ?auto_671912 ) ) ( not ( = ?auto_671911 ?auto_671913 ) ) ( not ( = ?auto_671918 ?auto_671916 ) ) ( HOIST-AT ?auto_671919 ?auto_671918 ) ( not ( = ?auto_671914 ?auto_671919 ) ) ( AVAILABLE ?auto_671919 ) ( SURFACE-AT ?auto_671913 ?auto_671918 ) ( ON ?auto_671913 ?auto_671915 ) ( CLEAR ?auto_671913 ) ( not ( = ?auto_671912 ?auto_671915 ) ) ( not ( = ?auto_671913 ?auto_671915 ) ) ( not ( = ?auto_671911 ?auto_671915 ) ) ( TRUCK-AT ?auto_671917 ?auto_671916 ) ( SURFACE-AT ?auto_671911 ?auto_671916 ) ( CLEAR ?auto_671911 ) ( LIFTING ?auto_671914 ?auto_671912 ) ( IS-CRATE ?auto_671912 ) ( ON ?auto_671904 ?auto_671903 ) ( ON ?auto_671905 ?auto_671904 ) ( ON ?auto_671902 ?auto_671905 ) ( ON ?auto_671906 ?auto_671902 ) ( ON ?auto_671908 ?auto_671906 ) ( ON ?auto_671907 ?auto_671908 ) ( ON ?auto_671909 ?auto_671907 ) ( ON ?auto_671910 ?auto_671909 ) ( ON ?auto_671911 ?auto_671910 ) ( not ( = ?auto_671903 ?auto_671904 ) ) ( not ( = ?auto_671903 ?auto_671905 ) ) ( not ( = ?auto_671903 ?auto_671902 ) ) ( not ( = ?auto_671903 ?auto_671906 ) ) ( not ( = ?auto_671903 ?auto_671908 ) ) ( not ( = ?auto_671903 ?auto_671907 ) ) ( not ( = ?auto_671903 ?auto_671909 ) ) ( not ( = ?auto_671903 ?auto_671910 ) ) ( not ( = ?auto_671903 ?auto_671911 ) ) ( not ( = ?auto_671903 ?auto_671912 ) ) ( not ( = ?auto_671903 ?auto_671913 ) ) ( not ( = ?auto_671903 ?auto_671915 ) ) ( not ( = ?auto_671904 ?auto_671905 ) ) ( not ( = ?auto_671904 ?auto_671902 ) ) ( not ( = ?auto_671904 ?auto_671906 ) ) ( not ( = ?auto_671904 ?auto_671908 ) ) ( not ( = ?auto_671904 ?auto_671907 ) ) ( not ( = ?auto_671904 ?auto_671909 ) ) ( not ( = ?auto_671904 ?auto_671910 ) ) ( not ( = ?auto_671904 ?auto_671911 ) ) ( not ( = ?auto_671904 ?auto_671912 ) ) ( not ( = ?auto_671904 ?auto_671913 ) ) ( not ( = ?auto_671904 ?auto_671915 ) ) ( not ( = ?auto_671905 ?auto_671902 ) ) ( not ( = ?auto_671905 ?auto_671906 ) ) ( not ( = ?auto_671905 ?auto_671908 ) ) ( not ( = ?auto_671905 ?auto_671907 ) ) ( not ( = ?auto_671905 ?auto_671909 ) ) ( not ( = ?auto_671905 ?auto_671910 ) ) ( not ( = ?auto_671905 ?auto_671911 ) ) ( not ( = ?auto_671905 ?auto_671912 ) ) ( not ( = ?auto_671905 ?auto_671913 ) ) ( not ( = ?auto_671905 ?auto_671915 ) ) ( not ( = ?auto_671902 ?auto_671906 ) ) ( not ( = ?auto_671902 ?auto_671908 ) ) ( not ( = ?auto_671902 ?auto_671907 ) ) ( not ( = ?auto_671902 ?auto_671909 ) ) ( not ( = ?auto_671902 ?auto_671910 ) ) ( not ( = ?auto_671902 ?auto_671911 ) ) ( not ( = ?auto_671902 ?auto_671912 ) ) ( not ( = ?auto_671902 ?auto_671913 ) ) ( not ( = ?auto_671902 ?auto_671915 ) ) ( not ( = ?auto_671906 ?auto_671908 ) ) ( not ( = ?auto_671906 ?auto_671907 ) ) ( not ( = ?auto_671906 ?auto_671909 ) ) ( not ( = ?auto_671906 ?auto_671910 ) ) ( not ( = ?auto_671906 ?auto_671911 ) ) ( not ( = ?auto_671906 ?auto_671912 ) ) ( not ( = ?auto_671906 ?auto_671913 ) ) ( not ( = ?auto_671906 ?auto_671915 ) ) ( not ( = ?auto_671908 ?auto_671907 ) ) ( not ( = ?auto_671908 ?auto_671909 ) ) ( not ( = ?auto_671908 ?auto_671910 ) ) ( not ( = ?auto_671908 ?auto_671911 ) ) ( not ( = ?auto_671908 ?auto_671912 ) ) ( not ( = ?auto_671908 ?auto_671913 ) ) ( not ( = ?auto_671908 ?auto_671915 ) ) ( not ( = ?auto_671907 ?auto_671909 ) ) ( not ( = ?auto_671907 ?auto_671910 ) ) ( not ( = ?auto_671907 ?auto_671911 ) ) ( not ( = ?auto_671907 ?auto_671912 ) ) ( not ( = ?auto_671907 ?auto_671913 ) ) ( not ( = ?auto_671907 ?auto_671915 ) ) ( not ( = ?auto_671909 ?auto_671910 ) ) ( not ( = ?auto_671909 ?auto_671911 ) ) ( not ( = ?auto_671909 ?auto_671912 ) ) ( not ( = ?auto_671909 ?auto_671913 ) ) ( not ( = ?auto_671909 ?auto_671915 ) ) ( not ( = ?auto_671910 ?auto_671911 ) ) ( not ( = ?auto_671910 ?auto_671912 ) ) ( not ( = ?auto_671910 ?auto_671913 ) ) ( not ( = ?auto_671910 ?auto_671915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671911 ?auto_671912 ?auto_671913 )
      ( MAKE-11CRATE-VERIFY ?auto_671903 ?auto_671904 ?auto_671905 ?auto_671902 ?auto_671906 ?auto_671908 ?auto_671907 ?auto_671909 ?auto_671910 ?auto_671911 ?auto_671912 ?auto_671913 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_672047 - SURFACE
      ?auto_672048 - SURFACE
      ?auto_672049 - SURFACE
      ?auto_672046 - SURFACE
      ?auto_672050 - SURFACE
      ?auto_672052 - SURFACE
      ?auto_672051 - SURFACE
      ?auto_672053 - SURFACE
      ?auto_672054 - SURFACE
      ?auto_672055 - SURFACE
      ?auto_672056 - SURFACE
      ?auto_672057 - SURFACE
    )
    :vars
    (
      ?auto_672063 - HOIST
      ?auto_672060 - PLACE
      ?auto_672058 - PLACE
      ?auto_672059 - HOIST
      ?auto_672062 - SURFACE
      ?auto_672061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_672063 ?auto_672060 ) ( IS-CRATE ?auto_672057 ) ( not ( = ?auto_672056 ?auto_672057 ) ) ( not ( = ?auto_672055 ?auto_672056 ) ) ( not ( = ?auto_672055 ?auto_672057 ) ) ( not ( = ?auto_672058 ?auto_672060 ) ) ( HOIST-AT ?auto_672059 ?auto_672058 ) ( not ( = ?auto_672063 ?auto_672059 ) ) ( AVAILABLE ?auto_672059 ) ( SURFACE-AT ?auto_672057 ?auto_672058 ) ( ON ?auto_672057 ?auto_672062 ) ( CLEAR ?auto_672057 ) ( not ( = ?auto_672056 ?auto_672062 ) ) ( not ( = ?auto_672057 ?auto_672062 ) ) ( not ( = ?auto_672055 ?auto_672062 ) ) ( TRUCK-AT ?auto_672061 ?auto_672060 ) ( SURFACE-AT ?auto_672055 ?auto_672060 ) ( CLEAR ?auto_672055 ) ( IS-CRATE ?auto_672056 ) ( AVAILABLE ?auto_672063 ) ( IN ?auto_672056 ?auto_672061 ) ( ON ?auto_672048 ?auto_672047 ) ( ON ?auto_672049 ?auto_672048 ) ( ON ?auto_672046 ?auto_672049 ) ( ON ?auto_672050 ?auto_672046 ) ( ON ?auto_672052 ?auto_672050 ) ( ON ?auto_672051 ?auto_672052 ) ( ON ?auto_672053 ?auto_672051 ) ( ON ?auto_672054 ?auto_672053 ) ( ON ?auto_672055 ?auto_672054 ) ( not ( = ?auto_672047 ?auto_672048 ) ) ( not ( = ?auto_672047 ?auto_672049 ) ) ( not ( = ?auto_672047 ?auto_672046 ) ) ( not ( = ?auto_672047 ?auto_672050 ) ) ( not ( = ?auto_672047 ?auto_672052 ) ) ( not ( = ?auto_672047 ?auto_672051 ) ) ( not ( = ?auto_672047 ?auto_672053 ) ) ( not ( = ?auto_672047 ?auto_672054 ) ) ( not ( = ?auto_672047 ?auto_672055 ) ) ( not ( = ?auto_672047 ?auto_672056 ) ) ( not ( = ?auto_672047 ?auto_672057 ) ) ( not ( = ?auto_672047 ?auto_672062 ) ) ( not ( = ?auto_672048 ?auto_672049 ) ) ( not ( = ?auto_672048 ?auto_672046 ) ) ( not ( = ?auto_672048 ?auto_672050 ) ) ( not ( = ?auto_672048 ?auto_672052 ) ) ( not ( = ?auto_672048 ?auto_672051 ) ) ( not ( = ?auto_672048 ?auto_672053 ) ) ( not ( = ?auto_672048 ?auto_672054 ) ) ( not ( = ?auto_672048 ?auto_672055 ) ) ( not ( = ?auto_672048 ?auto_672056 ) ) ( not ( = ?auto_672048 ?auto_672057 ) ) ( not ( = ?auto_672048 ?auto_672062 ) ) ( not ( = ?auto_672049 ?auto_672046 ) ) ( not ( = ?auto_672049 ?auto_672050 ) ) ( not ( = ?auto_672049 ?auto_672052 ) ) ( not ( = ?auto_672049 ?auto_672051 ) ) ( not ( = ?auto_672049 ?auto_672053 ) ) ( not ( = ?auto_672049 ?auto_672054 ) ) ( not ( = ?auto_672049 ?auto_672055 ) ) ( not ( = ?auto_672049 ?auto_672056 ) ) ( not ( = ?auto_672049 ?auto_672057 ) ) ( not ( = ?auto_672049 ?auto_672062 ) ) ( not ( = ?auto_672046 ?auto_672050 ) ) ( not ( = ?auto_672046 ?auto_672052 ) ) ( not ( = ?auto_672046 ?auto_672051 ) ) ( not ( = ?auto_672046 ?auto_672053 ) ) ( not ( = ?auto_672046 ?auto_672054 ) ) ( not ( = ?auto_672046 ?auto_672055 ) ) ( not ( = ?auto_672046 ?auto_672056 ) ) ( not ( = ?auto_672046 ?auto_672057 ) ) ( not ( = ?auto_672046 ?auto_672062 ) ) ( not ( = ?auto_672050 ?auto_672052 ) ) ( not ( = ?auto_672050 ?auto_672051 ) ) ( not ( = ?auto_672050 ?auto_672053 ) ) ( not ( = ?auto_672050 ?auto_672054 ) ) ( not ( = ?auto_672050 ?auto_672055 ) ) ( not ( = ?auto_672050 ?auto_672056 ) ) ( not ( = ?auto_672050 ?auto_672057 ) ) ( not ( = ?auto_672050 ?auto_672062 ) ) ( not ( = ?auto_672052 ?auto_672051 ) ) ( not ( = ?auto_672052 ?auto_672053 ) ) ( not ( = ?auto_672052 ?auto_672054 ) ) ( not ( = ?auto_672052 ?auto_672055 ) ) ( not ( = ?auto_672052 ?auto_672056 ) ) ( not ( = ?auto_672052 ?auto_672057 ) ) ( not ( = ?auto_672052 ?auto_672062 ) ) ( not ( = ?auto_672051 ?auto_672053 ) ) ( not ( = ?auto_672051 ?auto_672054 ) ) ( not ( = ?auto_672051 ?auto_672055 ) ) ( not ( = ?auto_672051 ?auto_672056 ) ) ( not ( = ?auto_672051 ?auto_672057 ) ) ( not ( = ?auto_672051 ?auto_672062 ) ) ( not ( = ?auto_672053 ?auto_672054 ) ) ( not ( = ?auto_672053 ?auto_672055 ) ) ( not ( = ?auto_672053 ?auto_672056 ) ) ( not ( = ?auto_672053 ?auto_672057 ) ) ( not ( = ?auto_672053 ?auto_672062 ) ) ( not ( = ?auto_672054 ?auto_672055 ) ) ( not ( = ?auto_672054 ?auto_672056 ) ) ( not ( = ?auto_672054 ?auto_672057 ) ) ( not ( = ?auto_672054 ?auto_672062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_672055 ?auto_672056 ?auto_672057 )
      ( MAKE-11CRATE-VERIFY ?auto_672047 ?auto_672048 ?auto_672049 ?auto_672046 ?auto_672050 ?auto_672052 ?auto_672051 ?auto_672053 ?auto_672054 ?auto_672055 ?auto_672056 ?auto_672057 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681316 - SURFACE
      ?auto_681317 - SURFACE
      ?auto_681318 - SURFACE
      ?auto_681315 - SURFACE
      ?auto_681319 - SURFACE
      ?auto_681321 - SURFACE
      ?auto_681320 - SURFACE
      ?auto_681322 - SURFACE
      ?auto_681323 - SURFACE
      ?auto_681324 - SURFACE
      ?auto_681325 - SURFACE
      ?auto_681326 - SURFACE
      ?auto_681327 - SURFACE
    )
    :vars
    (
      ?auto_681328 - HOIST
      ?auto_681329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681328 ?auto_681329 ) ( SURFACE-AT ?auto_681326 ?auto_681329 ) ( CLEAR ?auto_681326 ) ( LIFTING ?auto_681328 ?auto_681327 ) ( IS-CRATE ?auto_681327 ) ( not ( = ?auto_681326 ?auto_681327 ) ) ( ON ?auto_681317 ?auto_681316 ) ( ON ?auto_681318 ?auto_681317 ) ( ON ?auto_681315 ?auto_681318 ) ( ON ?auto_681319 ?auto_681315 ) ( ON ?auto_681321 ?auto_681319 ) ( ON ?auto_681320 ?auto_681321 ) ( ON ?auto_681322 ?auto_681320 ) ( ON ?auto_681323 ?auto_681322 ) ( ON ?auto_681324 ?auto_681323 ) ( ON ?auto_681325 ?auto_681324 ) ( ON ?auto_681326 ?auto_681325 ) ( not ( = ?auto_681316 ?auto_681317 ) ) ( not ( = ?auto_681316 ?auto_681318 ) ) ( not ( = ?auto_681316 ?auto_681315 ) ) ( not ( = ?auto_681316 ?auto_681319 ) ) ( not ( = ?auto_681316 ?auto_681321 ) ) ( not ( = ?auto_681316 ?auto_681320 ) ) ( not ( = ?auto_681316 ?auto_681322 ) ) ( not ( = ?auto_681316 ?auto_681323 ) ) ( not ( = ?auto_681316 ?auto_681324 ) ) ( not ( = ?auto_681316 ?auto_681325 ) ) ( not ( = ?auto_681316 ?auto_681326 ) ) ( not ( = ?auto_681316 ?auto_681327 ) ) ( not ( = ?auto_681317 ?auto_681318 ) ) ( not ( = ?auto_681317 ?auto_681315 ) ) ( not ( = ?auto_681317 ?auto_681319 ) ) ( not ( = ?auto_681317 ?auto_681321 ) ) ( not ( = ?auto_681317 ?auto_681320 ) ) ( not ( = ?auto_681317 ?auto_681322 ) ) ( not ( = ?auto_681317 ?auto_681323 ) ) ( not ( = ?auto_681317 ?auto_681324 ) ) ( not ( = ?auto_681317 ?auto_681325 ) ) ( not ( = ?auto_681317 ?auto_681326 ) ) ( not ( = ?auto_681317 ?auto_681327 ) ) ( not ( = ?auto_681318 ?auto_681315 ) ) ( not ( = ?auto_681318 ?auto_681319 ) ) ( not ( = ?auto_681318 ?auto_681321 ) ) ( not ( = ?auto_681318 ?auto_681320 ) ) ( not ( = ?auto_681318 ?auto_681322 ) ) ( not ( = ?auto_681318 ?auto_681323 ) ) ( not ( = ?auto_681318 ?auto_681324 ) ) ( not ( = ?auto_681318 ?auto_681325 ) ) ( not ( = ?auto_681318 ?auto_681326 ) ) ( not ( = ?auto_681318 ?auto_681327 ) ) ( not ( = ?auto_681315 ?auto_681319 ) ) ( not ( = ?auto_681315 ?auto_681321 ) ) ( not ( = ?auto_681315 ?auto_681320 ) ) ( not ( = ?auto_681315 ?auto_681322 ) ) ( not ( = ?auto_681315 ?auto_681323 ) ) ( not ( = ?auto_681315 ?auto_681324 ) ) ( not ( = ?auto_681315 ?auto_681325 ) ) ( not ( = ?auto_681315 ?auto_681326 ) ) ( not ( = ?auto_681315 ?auto_681327 ) ) ( not ( = ?auto_681319 ?auto_681321 ) ) ( not ( = ?auto_681319 ?auto_681320 ) ) ( not ( = ?auto_681319 ?auto_681322 ) ) ( not ( = ?auto_681319 ?auto_681323 ) ) ( not ( = ?auto_681319 ?auto_681324 ) ) ( not ( = ?auto_681319 ?auto_681325 ) ) ( not ( = ?auto_681319 ?auto_681326 ) ) ( not ( = ?auto_681319 ?auto_681327 ) ) ( not ( = ?auto_681321 ?auto_681320 ) ) ( not ( = ?auto_681321 ?auto_681322 ) ) ( not ( = ?auto_681321 ?auto_681323 ) ) ( not ( = ?auto_681321 ?auto_681324 ) ) ( not ( = ?auto_681321 ?auto_681325 ) ) ( not ( = ?auto_681321 ?auto_681326 ) ) ( not ( = ?auto_681321 ?auto_681327 ) ) ( not ( = ?auto_681320 ?auto_681322 ) ) ( not ( = ?auto_681320 ?auto_681323 ) ) ( not ( = ?auto_681320 ?auto_681324 ) ) ( not ( = ?auto_681320 ?auto_681325 ) ) ( not ( = ?auto_681320 ?auto_681326 ) ) ( not ( = ?auto_681320 ?auto_681327 ) ) ( not ( = ?auto_681322 ?auto_681323 ) ) ( not ( = ?auto_681322 ?auto_681324 ) ) ( not ( = ?auto_681322 ?auto_681325 ) ) ( not ( = ?auto_681322 ?auto_681326 ) ) ( not ( = ?auto_681322 ?auto_681327 ) ) ( not ( = ?auto_681323 ?auto_681324 ) ) ( not ( = ?auto_681323 ?auto_681325 ) ) ( not ( = ?auto_681323 ?auto_681326 ) ) ( not ( = ?auto_681323 ?auto_681327 ) ) ( not ( = ?auto_681324 ?auto_681325 ) ) ( not ( = ?auto_681324 ?auto_681326 ) ) ( not ( = ?auto_681324 ?auto_681327 ) ) ( not ( = ?auto_681325 ?auto_681326 ) ) ( not ( = ?auto_681325 ?auto_681327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_681326 ?auto_681327 )
      ( MAKE-12CRATE-VERIFY ?auto_681316 ?auto_681317 ?auto_681318 ?auto_681315 ?auto_681319 ?auto_681321 ?auto_681320 ?auto_681322 ?auto_681323 ?auto_681324 ?auto_681325 ?auto_681326 ?auto_681327 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681441 - SURFACE
      ?auto_681442 - SURFACE
      ?auto_681443 - SURFACE
      ?auto_681440 - SURFACE
      ?auto_681444 - SURFACE
      ?auto_681446 - SURFACE
      ?auto_681445 - SURFACE
      ?auto_681447 - SURFACE
      ?auto_681448 - SURFACE
      ?auto_681449 - SURFACE
      ?auto_681450 - SURFACE
      ?auto_681451 - SURFACE
      ?auto_681452 - SURFACE
    )
    :vars
    (
      ?auto_681455 - HOIST
      ?auto_681453 - PLACE
      ?auto_681454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_681455 ?auto_681453 ) ( SURFACE-AT ?auto_681451 ?auto_681453 ) ( CLEAR ?auto_681451 ) ( IS-CRATE ?auto_681452 ) ( not ( = ?auto_681451 ?auto_681452 ) ) ( TRUCK-AT ?auto_681454 ?auto_681453 ) ( AVAILABLE ?auto_681455 ) ( IN ?auto_681452 ?auto_681454 ) ( ON ?auto_681451 ?auto_681450 ) ( not ( = ?auto_681450 ?auto_681451 ) ) ( not ( = ?auto_681450 ?auto_681452 ) ) ( ON ?auto_681442 ?auto_681441 ) ( ON ?auto_681443 ?auto_681442 ) ( ON ?auto_681440 ?auto_681443 ) ( ON ?auto_681444 ?auto_681440 ) ( ON ?auto_681446 ?auto_681444 ) ( ON ?auto_681445 ?auto_681446 ) ( ON ?auto_681447 ?auto_681445 ) ( ON ?auto_681448 ?auto_681447 ) ( ON ?auto_681449 ?auto_681448 ) ( ON ?auto_681450 ?auto_681449 ) ( not ( = ?auto_681441 ?auto_681442 ) ) ( not ( = ?auto_681441 ?auto_681443 ) ) ( not ( = ?auto_681441 ?auto_681440 ) ) ( not ( = ?auto_681441 ?auto_681444 ) ) ( not ( = ?auto_681441 ?auto_681446 ) ) ( not ( = ?auto_681441 ?auto_681445 ) ) ( not ( = ?auto_681441 ?auto_681447 ) ) ( not ( = ?auto_681441 ?auto_681448 ) ) ( not ( = ?auto_681441 ?auto_681449 ) ) ( not ( = ?auto_681441 ?auto_681450 ) ) ( not ( = ?auto_681441 ?auto_681451 ) ) ( not ( = ?auto_681441 ?auto_681452 ) ) ( not ( = ?auto_681442 ?auto_681443 ) ) ( not ( = ?auto_681442 ?auto_681440 ) ) ( not ( = ?auto_681442 ?auto_681444 ) ) ( not ( = ?auto_681442 ?auto_681446 ) ) ( not ( = ?auto_681442 ?auto_681445 ) ) ( not ( = ?auto_681442 ?auto_681447 ) ) ( not ( = ?auto_681442 ?auto_681448 ) ) ( not ( = ?auto_681442 ?auto_681449 ) ) ( not ( = ?auto_681442 ?auto_681450 ) ) ( not ( = ?auto_681442 ?auto_681451 ) ) ( not ( = ?auto_681442 ?auto_681452 ) ) ( not ( = ?auto_681443 ?auto_681440 ) ) ( not ( = ?auto_681443 ?auto_681444 ) ) ( not ( = ?auto_681443 ?auto_681446 ) ) ( not ( = ?auto_681443 ?auto_681445 ) ) ( not ( = ?auto_681443 ?auto_681447 ) ) ( not ( = ?auto_681443 ?auto_681448 ) ) ( not ( = ?auto_681443 ?auto_681449 ) ) ( not ( = ?auto_681443 ?auto_681450 ) ) ( not ( = ?auto_681443 ?auto_681451 ) ) ( not ( = ?auto_681443 ?auto_681452 ) ) ( not ( = ?auto_681440 ?auto_681444 ) ) ( not ( = ?auto_681440 ?auto_681446 ) ) ( not ( = ?auto_681440 ?auto_681445 ) ) ( not ( = ?auto_681440 ?auto_681447 ) ) ( not ( = ?auto_681440 ?auto_681448 ) ) ( not ( = ?auto_681440 ?auto_681449 ) ) ( not ( = ?auto_681440 ?auto_681450 ) ) ( not ( = ?auto_681440 ?auto_681451 ) ) ( not ( = ?auto_681440 ?auto_681452 ) ) ( not ( = ?auto_681444 ?auto_681446 ) ) ( not ( = ?auto_681444 ?auto_681445 ) ) ( not ( = ?auto_681444 ?auto_681447 ) ) ( not ( = ?auto_681444 ?auto_681448 ) ) ( not ( = ?auto_681444 ?auto_681449 ) ) ( not ( = ?auto_681444 ?auto_681450 ) ) ( not ( = ?auto_681444 ?auto_681451 ) ) ( not ( = ?auto_681444 ?auto_681452 ) ) ( not ( = ?auto_681446 ?auto_681445 ) ) ( not ( = ?auto_681446 ?auto_681447 ) ) ( not ( = ?auto_681446 ?auto_681448 ) ) ( not ( = ?auto_681446 ?auto_681449 ) ) ( not ( = ?auto_681446 ?auto_681450 ) ) ( not ( = ?auto_681446 ?auto_681451 ) ) ( not ( = ?auto_681446 ?auto_681452 ) ) ( not ( = ?auto_681445 ?auto_681447 ) ) ( not ( = ?auto_681445 ?auto_681448 ) ) ( not ( = ?auto_681445 ?auto_681449 ) ) ( not ( = ?auto_681445 ?auto_681450 ) ) ( not ( = ?auto_681445 ?auto_681451 ) ) ( not ( = ?auto_681445 ?auto_681452 ) ) ( not ( = ?auto_681447 ?auto_681448 ) ) ( not ( = ?auto_681447 ?auto_681449 ) ) ( not ( = ?auto_681447 ?auto_681450 ) ) ( not ( = ?auto_681447 ?auto_681451 ) ) ( not ( = ?auto_681447 ?auto_681452 ) ) ( not ( = ?auto_681448 ?auto_681449 ) ) ( not ( = ?auto_681448 ?auto_681450 ) ) ( not ( = ?auto_681448 ?auto_681451 ) ) ( not ( = ?auto_681448 ?auto_681452 ) ) ( not ( = ?auto_681449 ?auto_681450 ) ) ( not ( = ?auto_681449 ?auto_681451 ) ) ( not ( = ?auto_681449 ?auto_681452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681450 ?auto_681451 ?auto_681452 )
      ( MAKE-12CRATE-VERIFY ?auto_681441 ?auto_681442 ?auto_681443 ?auto_681440 ?auto_681444 ?auto_681446 ?auto_681445 ?auto_681447 ?auto_681448 ?auto_681449 ?auto_681450 ?auto_681451 ?auto_681452 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681579 - SURFACE
      ?auto_681580 - SURFACE
      ?auto_681581 - SURFACE
      ?auto_681578 - SURFACE
      ?auto_681582 - SURFACE
      ?auto_681584 - SURFACE
      ?auto_681583 - SURFACE
      ?auto_681585 - SURFACE
      ?auto_681586 - SURFACE
      ?auto_681587 - SURFACE
      ?auto_681588 - SURFACE
      ?auto_681589 - SURFACE
      ?auto_681590 - SURFACE
    )
    :vars
    (
      ?auto_681593 - HOIST
      ?auto_681594 - PLACE
      ?auto_681592 - TRUCK
      ?auto_681591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681593 ?auto_681594 ) ( SURFACE-AT ?auto_681589 ?auto_681594 ) ( CLEAR ?auto_681589 ) ( IS-CRATE ?auto_681590 ) ( not ( = ?auto_681589 ?auto_681590 ) ) ( AVAILABLE ?auto_681593 ) ( IN ?auto_681590 ?auto_681592 ) ( ON ?auto_681589 ?auto_681588 ) ( not ( = ?auto_681588 ?auto_681589 ) ) ( not ( = ?auto_681588 ?auto_681590 ) ) ( TRUCK-AT ?auto_681592 ?auto_681591 ) ( not ( = ?auto_681591 ?auto_681594 ) ) ( ON ?auto_681580 ?auto_681579 ) ( ON ?auto_681581 ?auto_681580 ) ( ON ?auto_681578 ?auto_681581 ) ( ON ?auto_681582 ?auto_681578 ) ( ON ?auto_681584 ?auto_681582 ) ( ON ?auto_681583 ?auto_681584 ) ( ON ?auto_681585 ?auto_681583 ) ( ON ?auto_681586 ?auto_681585 ) ( ON ?auto_681587 ?auto_681586 ) ( ON ?auto_681588 ?auto_681587 ) ( not ( = ?auto_681579 ?auto_681580 ) ) ( not ( = ?auto_681579 ?auto_681581 ) ) ( not ( = ?auto_681579 ?auto_681578 ) ) ( not ( = ?auto_681579 ?auto_681582 ) ) ( not ( = ?auto_681579 ?auto_681584 ) ) ( not ( = ?auto_681579 ?auto_681583 ) ) ( not ( = ?auto_681579 ?auto_681585 ) ) ( not ( = ?auto_681579 ?auto_681586 ) ) ( not ( = ?auto_681579 ?auto_681587 ) ) ( not ( = ?auto_681579 ?auto_681588 ) ) ( not ( = ?auto_681579 ?auto_681589 ) ) ( not ( = ?auto_681579 ?auto_681590 ) ) ( not ( = ?auto_681580 ?auto_681581 ) ) ( not ( = ?auto_681580 ?auto_681578 ) ) ( not ( = ?auto_681580 ?auto_681582 ) ) ( not ( = ?auto_681580 ?auto_681584 ) ) ( not ( = ?auto_681580 ?auto_681583 ) ) ( not ( = ?auto_681580 ?auto_681585 ) ) ( not ( = ?auto_681580 ?auto_681586 ) ) ( not ( = ?auto_681580 ?auto_681587 ) ) ( not ( = ?auto_681580 ?auto_681588 ) ) ( not ( = ?auto_681580 ?auto_681589 ) ) ( not ( = ?auto_681580 ?auto_681590 ) ) ( not ( = ?auto_681581 ?auto_681578 ) ) ( not ( = ?auto_681581 ?auto_681582 ) ) ( not ( = ?auto_681581 ?auto_681584 ) ) ( not ( = ?auto_681581 ?auto_681583 ) ) ( not ( = ?auto_681581 ?auto_681585 ) ) ( not ( = ?auto_681581 ?auto_681586 ) ) ( not ( = ?auto_681581 ?auto_681587 ) ) ( not ( = ?auto_681581 ?auto_681588 ) ) ( not ( = ?auto_681581 ?auto_681589 ) ) ( not ( = ?auto_681581 ?auto_681590 ) ) ( not ( = ?auto_681578 ?auto_681582 ) ) ( not ( = ?auto_681578 ?auto_681584 ) ) ( not ( = ?auto_681578 ?auto_681583 ) ) ( not ( = ?auto_681578 ?auto_681585 ) ) ( not ( = ?auto_681578 ?auto_681586 ) ) ( not ( = ?auto_681578 ?auto_681587 ) ) ( not ( = ?auto_681578 ?auto_681588 ) ) ( not ( = ?auto_681578 ?auto_681589 ) ) ( not ( = ?auto_681578 ?auto_681590 ) ) ( not ( = ?auto_681582 ?auto_681584 ) ) ( not ( = ?auto_681582 ?auto_681583 ) ) ( not ( = ?auto_681582 ?auto_681585 ) ) ( not ( = ?auto_681582 ?auto_681586 ) ) ( not ( = ?auto_681582 ?auto_681587 ) ) ( not ( = ?auto_681582 ?auto_681588 ) ) ( not ( = ?auto_681582 ?auto_681589 ) ) ( not ( = ?auto_681582 ?auto_681590 ) ) ( not ( = ?auto_681584 ?auto_681583 ) ) ( not ( = ?auto_681584 ?auto_681585 ) ) ( not ( = ?auto_681584 ?auto_681586 ) ) ( not ( = ?auto_681584 ?auto_681587 ) ) ( not ( = ?auto_681584 ?auto_681588 ) ) ( not ( = ?auto_681584 ?auto_681589 ) ) ( not ( = ?auto_681584 ?auto_681590 ) ) ( not ( = ?auto_681583 ?auto_681585 ) ) ( not ( = ?auto_681583 ?auto_681586 ) ) ( not ( = ?auto_681583 ?auto_681587 ) ) ( not ( = ?auto_681583 ?auto_681588 ) ) ( not ( = ?auto_681583 ?auto_681589 ) ) ( not ( = ?auto_681583 ?auto_681590 ) ) ( not ( = ?auto_681585 ?auto_681586 ) ) ( not ( = ?auto_681585 ?auto_681587 ) ) ( not ( = ?auto_681585 ?auto_681588 ) ) ( not ( = ?auto_681585 ?auto_681589 ) ) ( not ( = ?auto_681585 ?auto_681590 ) ) ( not ( = ?auto_681586 ?auto_681587 ) ) ( not ( = ?auto_681586 ?auto_681588 ) ) ( not ( = ?auto_681586 ?auto_681589 ) ) ( not ( = ?auto_681586 ?auto_681590 ) ) ( not ( = ?auto_681587 ?auto_681588 ) ) ( not ( = ?auto_681587 ?auto_681589 ) ) ( not ( = ?auto_681587 ?auto_681590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681588 ?auto_681589 ?auto_681590 )
      ( MAKE-12CRATE-VERIFY ?auto_681579 ?auto_681580 ?auto_681581 ?auto_681578 ?auto_681582 ?auto_681584 ?auto_681583 ?auto_681585 ?auto_681586 ?auto_681587 ?auto_681588 ?auto_681589 ?auto_681590 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681729 - SURFACE
      ?auto_681730 - SURFACE
      ?auto_681731 - SURFACE
      ?auto_681728 - SURFACE
      ?auto_681732 - SURFACE
      ?auto_681734 - SURFACE
      ?auto_681733 - SURFACE
      ?auto_681735 - SURFACE
      ?auto_681736 - SURFACE
      ?auto_681737 - SURFACE
      ?auto_681738 - SURFACE
      ?auto_681739 - SURFACE
      ?auto_681740 - SURFACE
    )
    :vars
    (
      ?auto_681744 - HOIST
      ?auto_681741 - PLACE
      ?auto_681742 - TRUCK
      ?auto_681743 - PLACE
      ?auto_681745 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_681744 ?auto_681741 ) ( SURFACE-AT ?auto_681739 ?auto_681741 ) ( CLEAR ?auto_681739 ) ( IS-CRATE ?auto_681740 ) ( not ( = ?auto_681739 ?auto_681740 ) ) ( AVAILABLE ?auto_681744 ) ( ON ?auto_681739 ?auto_681738 ) ( not ( = ?auto_681738 ?auto_681739 ) ) ( not ( = ?auto_681738 ?auto_681740 ) ) ( TRUCK-AT ?auto_681742 ?auto_681743 ) ( not ( = ?auto_681743 ?auto_681741 ) ) ( HOIST-AT ?auto_681745 ?auto_681743 ) ( LIFTING ?auto_681745 ?auto_681740 ) ( not ( = ?auto_681744 ?auto_681745 ) ) ( ON ?auto_681730 ?auto_681729 ) ( ON ?auto_681731 ?auto_681730 ) ( ON ?auto_681728 ?auto_681731 ) ( ON ?auto_681732 ?auto_681728 ) ( ON ?auto_681734 ?auto_681732 ) ( ON ?auto_681733 ?auto_681734 ) ( ON ?auto_681735 ?auto_681733 ) ( ON ?auto_681736 ?auto_681735 ) ( ON ?auto_681737 ?auto_681736 ) ( ON ?auto_681738 ?auto_681737 ) ( not ( = ?auto_681729 ?auto_681730 ) ) ( not ( = ?auto_681729 ?auto_681731 ) ) ( not ( = ?auto_681729 ?auto_681728 ) ) ( not ( = ?auto_681729 ?auto_681732 ) ) ( not ( = ?auto_681729 ?auto_681734 ) ) ( not ( = ?auto_681729 ?auto_681733 ) ) ( not ( = ?auto_681729 ?auto_681735 ) ) ( not ( = ?auto_681729 ?auto_681736 ) ) ( not ( = ?auto_681729 ?auto_681737 ) ) ( not ( = ?auto_681729 ?auto_681738 ) ) ( not ( = ?auto_681729 ?auto_681739 ) ) ( not ( = ?auto_681729 ?auto_681740 ) ) ( not ( = ?auto_681730 ?auto_681731 ) ) ( not ( = ?auto_681730 ?auto_681728 ) ) ( not ( = ?auto_681730 ?auto_681732 ) ) ( not ( = ?auto_681730 ?auto_681734 ) ) ( not ( = ?auto_681730 ?auto_681733 ) ) ( not ( = ?auto_681730 ?auto_681735 ) ) ( not ( = ?auto_681730 ?auto_681736 ) ) ( not ( = ?auto_681730 ?auto_681737 ) ) ( not ( = ?auto_681730 ?auto_681738 ) ) ( not ( = ?auto_681730 ?auto_681739 ) ) ( not ( = ?auto_681730 ?auto_681740 ) ) ( not ( = ?auto_681731 ?auto_681728 ) ) ( not ( = ?auto_681731 ?auto_681732 ) ) ( not ( = ?auto_681731 ?auto_681734 ) ) ( not ( = ?auto_681731 ?auto_681733 ) ) ( not ( = ?auto_681731 ?auto_681735 ) ) ( not ( = ?auto_681731 ?auto_681736 ) ) ( not ( = ?auto_681731 ?auto_681737 ) ) ( not ( = ?auto_681731 ?auto_681738 ) ) ( not ( = ?auto_681731 ?auto_681739 ) ) ( not ( = ?auto_681731 ?auto_681740 ) ) ( not ( = ?auto_681728 ?auto_681732 ) ) ( not ( = ?auto_681728 ?auto_681734 ) ) ( not ( = ?auto_681728 ?auto_681733 ) ) ( not ( = ?auto_681728 ?auto_681735 ) ) ( not ( = ?auto_681728 ?auto_681736 ) ) ( not ( = ?auto_681728 ?auto_681737 ) ) ( not ( = ?auto_681728 ?auto_681738 ) ) ( not ( = ?auto_681728 ?auto_681739 ) ) ( not ( = ?auto_681728 ?auto_681740 ) ) ( not ( = ?auto_681732 ?auto_681734 ) ) ( not ( = ?auto_681732 ?auto_681733 ) ) ( not ( = ?auto_681732 ?auto_681735 ) ) ( not ( = ?auto_681732 ?auto_681736 ) ) ( not ( = ?auto_681732 ?auto_681737 ) ) ( not ( = ?auto_681732 ?auto_681738 ) ) ( not ( = ?auto_681732 ?auto_681739 ) ) ( not ( = ?auto_681732 ?auto_681740 ) ) ( not ( = ?auto_681734 ?auto_681733 ) ) ( not ( = ?auto_681734 ?auto_681735 ) ) ( not ( = ?auto_681734 ?auto_681736 ) ) ( not ( = ?auto_681734 ?auto_681737 ) ) ( not ( = ?auto_681734 ?auto_681738 ) ) ( not ( = ?auto_681734 ?auto_681739 ) ) ( not ( = ?auto_681734 ?auto_681740 ) ) ( not ( = ?auto_681733 ?auto_681735 ) ) ( not ( = ?auto_681733 ?auto_681736 ) ) ( not ( = ?auto_681733 ?auto_681737 ) ) ( not ( = ?auto_681733 ?auto_681738 ) ) ( not ( = ?auto_681733 ?auto_681739 ) ) ( not ( = ?auto_681733 ?auto_681740 ) ) ( not ( = ?auto_681735 ?auto_681736 ) ) ( not ( = ?auto_681735 ?auto_681737 ) ) ( not ( = ?auto_681735 ?auto_681738 ) ) ( not ( = ?auto_681735 ?auto_681739 ) ) ( not ( = ?auto_681735 ?auto_681740 ) ) ( not ( = ?auto_681736 ?auto_681737 ) ) ( not ( = ?auto_681736 ?auto_681738 ) ) ( not ( = ?auto_681736 ?auto_681739 ) ) ( not ( = ?auto_681736 ?auto_681740 ) ) ( not ( = ?auto_681737 ?auto_681738 ) ) ( not ( = ?auto_681737 ?auto_681739 ) ) ( not ( = ?auto_681737 ?auto_681740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681738 ?auto_681739 ?auto_681740 )
      ( MAKE-12CRATE-VERIFY ?auto_681729 ?auto_681730 ?auto_681731 ?auto_681728 ?auto_681732 ?auto_681734 ?auto_681733 ?auto_681735 ?auto_681736 ?auto_681737 ?auto_681738 ?auto_681739 ?auto_681740 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681891 - SURFACE
      ?auto_681892 - SURFACE
      ?auto_681893 - SURFACE
      ?auto_681890 - SURFACE
      ?auto_681894 - SURFACE
      ?auto_681896 - SURFACE
      ?auto_681895 - SURFACE
      ?auto_681897 - SURFACE
      ?auto_681898 - SURFACE
      ?auto_681899 - SURFACE
      ?auto_681900 - SURFACE
      ?auto_681901 - SURFACE
      ?auto_681902 - SURFACE
    )
    :vars
    (
      ?auto_681908 - HOIST
      ?auto_681907 - PLACE
      ?auto_681904 - TRUCK
      ?auto_681903 - PLACE
      ?auto_681905 - HOIST
      ?auto_681906 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681908 ?auto_681907 ) ( SURFACE-AT ?auto_681901 ?auto_681907 ) ( CLEAR ?auto_681901 ) ( IS-CRATE ?auto_681902 ) ( not ( = ?auto_681901 ?auto_681902 ) ) ( AVAILABLE ?auto_681908 ) ( ON ?auto_681901 ?auto_681900 ) ( not ( = ?auto_681900 ?auto_681901 ) ) ( not ( = ?auto_681900 ?auto_681902 ) ) ( TRUCK-AT ?auto_681904 ?auto_681903 ) ( not ( = ?auto_681903 ?auto_681907 ) ) ( HOIST-AT ?auto_681905 ?auto_681903 ) ( not ( = ?auto_681908 ?auto_681905 ) ) ( AVAILABLE ?auto_681905 ) ( SURFACE-AT ?auto_681902 ?auto_681903 ) ( ON ?auto_681902 ?auto_681906 ) ( CLEAR ?auto_681902 ) ( not ( = ?auto_681901 ?auto_681906 ) ) ( not ( = ?auto_681902 ?auto_681906 ) ) ( not ( = ?auto_681900 ?auto_681906 ) ) ( ON ?auto_681892 ?auto_681891 ) ( ON ?auto_681893 ?auto_681892 ) ( ON ?auto_681890 ?auto_681893 ) ( ON ?auto_681894 ?auto_681890 ) ( ON ?auto_681896 ?auto_681894 ) ( ON ?auto_681895 ?auto_681896 ) ( ON ?auto_681897 ?auto_681895 ) ( ON ?auto_681898 ?auto_681897 ) ( ON ?auto_681899 ?auto_681898 ) ( ON ?auto_681900 ?auto_681899 ) ( not ( = ?auto_681891 ?auto_681892 ) ) ( not ( = ?auto_681891 ?auto_681893 ) ) ( not ( = ?auto_681891 ?auto_681890 ) ) ( not ( = ?auto_681891 ?auto_681894 ) ) ( not ( = ?auto_681891 ?auto_681896 ) ) ( not ( = ?auto_681891 ?auto_681895 ) ) ( not ( = ?auto_681891 ?auto_681897 ) ) ( not ( = ?auto_681891 ?auto_681898 ) ) ( not ( = ?auto_681891 ?auto_681899 ) ) ( not ( = ?auto_681891 ?auto_681900 ) ) ( not ( = ?auto_681891 ?auto_681901 ) ) ( not ( = ?auto_681891 ?auto_681902 ) ) ( not ( = ?auto_681891 ?auto_681906 ) ) ( not ( = ?auto_681892 ?auto_681893 ) ) ( not ( = ?auto_681892 ?auto_681890 ) ) ( not ( = ?auto_681892 ?auto_681894 ) ) ( not ( = ?auto_681892 ?auto_681896 ) ) ( not ( = ?auto_681892 ?auto_681895 ) ) ( not ( = ?auto_681892 ?auto_681897 ) ) ( not ( = ?auto_681892 ?auto_681898 ) ) ( not ( = ?auto_681892 ?auto_681899 ) ) ( not ( = ?auto_681892 ?auto_681900 ) ) ( not ( = ?auto_681892 ?auto_681901 ) ) ( not ( = ?auto_681892 ?auto_681902 ) ) ( not ( = ?auto_681892 ?auto_681906 ) ) ( not ( = ?auto_681893 ?auto_681890 ) ) ( not ( = ?auto_681893 ?auto_681894 ) ) ( not ( = ?auto_681893 ?auto_681896 ) ) ( not ( = ?auto_681893 ?auto_681895 ) ) ( not ( = ?auto_681893 ?auto_681897 ) ) ( not ( = ?auto_681893 ?auto_681898 ) ) ( not ( = ?auto_681893 ?auto_681899 ) ) ( not ( = ?auto_681893 ?auto_681900 ) ) ( not ( = ?auto_681893 ?auto_681901 ) ) ( not ( = ?auto_681893 ?auto_681902 ) ) ( not ( = ?auto_681893 ?auto_681906 ) ) ( not ( = ?auto_681890 ?auto_681894 ) ) ( not ( = ?auto_681890 ?auto_681896 ) ) ( not ( = ?auto_681890 ?auto_681895 ) ) ( not ( = ?auto_681890 ?auto_681897 ) ) ( not ( = ?auto_681890 ?auto_681898 ) ) ( not ( = ?auto_681890 ?auto_681899 ) ) ( not ( = ?auto_681890 ?auto_681900 ) ) ( not ( = ?auto_681890 ?auto_681901 ) ) ( not ( = ?auto_681890 ?auto_681902 ) ) ( not ( = ?auto_681890 ?auto_681906 ) ) ( not ( = ?auto_681894 ?auto_681896 ) ) ( not ( = ?auto_681894 ?auto_681895 ) ) ( not ( = ?auto_681894 ?auto_681897 ) ) ( not ( = ?auto_681894 ?auto_681898 ) ) ( not ( = ?auto_681894 ?auto_681899 ) ) ( not ( = ?auto_681894 ?auto_681900 ) ) ( not ( = ?auto_681894 ?auto_681901 ) ) ( not ( = ?auto_681894 ?auto_681902 ) ) ( not ( = ?auto_681894 ?auto_681906 ) ) ( not ( = ?auto_681896 ?auto_681895 ) ) ( not ( = ?auto_681896 ?auto_681897 ) ) ( not ( = ?auto_681896 ?auto_681898 ) ) ( not ( = ?auto_681896 ?auto_681899 ) ) ( not ( = ?auto_681896 ?auto_681900 ) ) ( not ( = ?auto_681896 ?auto_681901 ) ) ( not ( = ?auto_681896 ?auto_681902 ) ) ( not ( = ?auto_681896 ?auto_681906 ) ) ( not ( = ?auto_681895 ?auto_681897 ) ) ( not ( = ?auto_681895 ?auto_681898 ) ) ( not ( = ?auto_681895 ?auto_681899 ) ) ( not ( = ?auto_681895 ?auto_681900 ) ) ( not ( = ?auto_681895 ?auto_681901 ) ) ( not ( = ?auto_681895 ?auto_681902 ) ) ( not ( = ?auto_681895 ?auto_681906 ) ) ( not ( = ?auto_681897 ?auto_681898 ) ) ( not ( = ?auto_681897 ?auto_681899 ) ) ( not ( = ?auto_681897 ?auto_681900 ) ) ( not ( = ?auto_681897 ?auto_681901 ) ) ( not ( = ?auto_681897 ?auto_681902 ) ) ( not ( = ?auto_681897 ?auto_681906 ) ) ( not ( = ?auto_681898 ?auto_681899 ) ) ( not ( = ?auto_681898 ?auto_681900 ) ) ( not ( = ?auto_681898 ?auto_681901 ) ) ( not ( = ?auto_681898 ?auto_681902 ) ) ( not ( = ?auto_681898 ?auto_681906 ) ) ( not ( = ?auto_681899 ?auto_681900 ) ) ( not ( = ?auto_681899 ?auto_681901 ) ) ( not ( = ?auto_681899 ?auto_681902 ) ) ( not ( = ?auto_681899 ?auto_681906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681900 ?auto_681901 ?auto_681902 )
      ( MAKE-12CRATE-VERIFY ?auto_681891 ?auto_681892 ?auto_681893 ?auto_681890 ?auto_681894 ?auto_681896 ?auto_681895 ?auto_681897 ?auto_681898 ?auto_681899 ?auto_681900 ?auto_681901 ?auto_681902 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_682054 - SURFACE
      ?auto_682055 - SURFACE
      ?auto_682056 - SURFACE
      ?auto_682053 - SURFACE
      ?auto_682057 - SURFACE
      ?auto_682059 - SURFACE
      ?auto_682058 - SURFACE
      ?auto_682060 - SURFACE
      ?auto_682061 - SURFACE
      ?auto_682062 - SURFACE
      ?auto_682063 - SURFACE
      ?auto_682064 - SURFACE
      ?auto_682065 - SURFACE
    )
    :vars
    (
      ?auto_682068 - HOIST
      ?auto_682066 - PLACE
      ?auto_682070 - PLACE
      ?auto_682067 - HOIST
      ?auto_682071 - SURFACE
      ?auto_682069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682068 ?auto_682066 ) ( SURFACE-AT ?auto_682064 ?auto_682066 ) ( CLEAR ?auto_682064 ) ( IS-CRATE ?auto_682065 ) ( not ( = ?auto_682064 ?auto_682065 ) ) ( AVAILABLE ?auto_682068 ) ( ON ?auto_682064 ?auto_682063 ) ( not ( = ?auto_682063 ?auto_682064 ) ) ( not ( = ?auto_682063 ?auto_682065 ) ) ( not ( = ?auto_682070 ?auto_682066 ) ) ( HOIST-AT ?auto_682067 ?auto_682070 ) ( not ( = ?auto_682068 ?auto_682067 ) ) ( AVAILABLE ?auto_682067 ) ( SURFACE-AT ?auto_682065 ?auto_682070 ) ( ON ?auto_682065 ?auto_682071 ) ( CLEAR ?auto_682065 ) ( not ( = ?auto_682064 ?auto_682071 ) ) ( not ( = ?auto_682065 ?auto_682071 ) ) ( not ( = ?auto_682063 ?auto_682071 ) ) ( TRUCK-AT ?auto_682069 ?auto_682066 ) ( ON ?auto_682055 ?auto_682054 ) ( ON ?auto_682056 ?auto_682055 ) ( ON ?auto_682053 ?auto_682056 ) ( ON ?auto_682057 ?auto_682053 ) ( ON ?auto_682059 ?auto_682057 ) ( ON ?auto_682058 ?auto_682059 ) ( ON ?auto_682060 ?auto_682058 ) ( ON ?auto_682061 ?auto_682060 ) ( ON ?auto_682062 ?auto_682061 ) ( ON ?auto_682063 ?auto_682062 ) ( not ( = ?auto_682054 ?auto_682055 ) ) ( not ( = ?auto_682054 ?auto_682056 ) ) ( not ( = ?auto_682054 ?auto_682053 ) ) ( not ( = ?auto_682054 ?auto_682057 ) ) ( not ( = ?auto_682054 ?auto_682059 ) ) ( not ( = ?auto_682054 ?auto_682058 ) ) ( not ( = ?auto_682054 ?auto_682060 ) ) ( not ( = ?auto_682054 ?auto_682061 ) ) ( not ( = ?auto_682054 ?auto_682062 ) ) ( not ( = ?auto_682054 ?auto_682063 ) ) ( not ( = ?auto_682054 ?auto_682064 ) ) ( not ( = ?auto_682054 ?auto_682065 ) ) ( not ( = ?auto_682054 ?auto_682071 ) ) ( not ( = ?auto_682055 ?auto_682056 ) ) ( not ( = ?auto_682055 ?auto_682053 ) ) ( not ( = ?auto_682055 ?auto_682057 ) ) ( not ( = ?auto_682055 ?auto_682059 ) ) ( not ( = ?auto_682055 ?auto_682058 ) ) ( not ( = ?auto_682055 ?auto_682060 ) ) ( not ( = ?auto_682055 ?auto_682061 ) ) ( not ( = ?auto_682055 ?auto_682062 ) ) ( not ( = ?auto_682055 ?auto_682063 ) ) ( not ( = ?auto_682055 ?auto_682064 ) ) ( not ( = ?auto_682055 ?auto_682065 ) ) ( not ( = ?auto_682055 ?auto_682071 ) ) ( not ( = ?auto_682056 ?auto_682053 ) ) ( not ( = ?auto_682056 ?auto_682057 ) ) ( not ( = ?auto_682056 ?auto_682059 ) ) ( not ( = ?auto_682056 ?auto_682058 ) ) ( not ( = ?auto_682056 ?auto_682060 ) ) ( not ( = ?auto_682056 ?auto_682061 ) ) ( not ( = ?auto_682056 ?auto_682062 ) ) ( not ( = ?auto_682056 ?auto_682063 ) ) ( not ( = ?auto_682056 ?auto_682064 ) ) ( not ( = ?auto_682056 ?auto_682065 ) ) ( not ( = ?auto_682056 ?auto_682071 ) ) ( not ( = ?auto_682053 ?auto_682057 ) ) ( not ( = ?auto_682053 ?auto_682059 ) ) ( not ( = ?auto_682053 ?auto_682058 ) ) ( not ( = ?auto_682053 ?auto_682060 ) ) ( not ( = ?auto_682053 ?auto_682061 ) ) ( not ( = ?auto_682053 ?auto_682062 ) ) ( not ( = ?auto_682053 ?auto_682063 ) ) ( not ( = ?auto_682053 ?auto_682064 ) ) ( not ( = ?auto_682053 ?auto_682065 ) ) ( not ( = ?auto_682053 ?auto_682071 ) ) ( not ( = ?auto_682057 ?auto_682059 ) ) ( not ( = ?auto_682057 ?auto_682058 ) ) ( not ( = ?auto_682057 ?auto_682060 ) ) ( not ( = ?auto_682057 ?auto_682061 ) ) ( not ( = ?auto_682057 ?auto_682062 ) ) ( not ( = ?auto_682057 ?auto_682063 ) ) ( not ( = ?auto_682057 ?auto_682064 ) ) ( not ( = ?auto_682057 ?auto_682065 ) ) ( not ( = ?auto_682057 ?auto_682071 ) ) ( not ( = ?auto_682059 ?auto_682058 ) ) ( not ( = ?auto_682059 ?auto_682060 ) ) ( not ( = ?auto_682059 ?auto_682061 ) ) ( not ( = ?auto_682059 ?auto_682062 ) ) ( not ( = ?auto_682059 ?auto_682063 ) ) ( not ( = ?auto_682059 ?auto_682064 ) ) ( not ( = ?auto_682059 ?auto_682065 ) ) ( not ( = ?auto_682059 ?auto_682071 ) ) ( not ( = ?auto_682058 ?auto_682060 ) ) ( not ( = ?auto_682058 ?auto_682061 ) ) ( not ( = ?auto_682058 ?auto_682062 ) ) ( not ( = ?auto_682058 ?auto_682063 ) ) ( not ( = ?auto_682058 ?auto_682064 ) ) ( not ( = ?auto_682058 ?auto_682065 ) ) ( not ( = ?auto_682058 ?auto_682071 ) ) ( not ( = ?auto_682060 ?auto_682061 ) ) ( not ( = ?auto_682060 ?auto_682062 ) ) ( not ( = ?auto_682060 ?auto_682063 ) ) ( not ( = ?auto_682060 ?auto_682064 ) ) ( not ( = ?auto_682060 ?auto_682065 ) ) ( not ( = ?auto_682060 ?auto_682071 ) ) ( not ( = ?auto_682061 ?auto_682062 ) ) ( not ( = ?auto_682061 ?auto_682063 ) ) ( not ( = ?auto_682061 ?auto_682064 ) ) ( not ( = ?auto_682061 ?auto_682065 ) ) ( not ( = ?auto_682061 ?auto_682071 ) ) ( not ( = ?auto_682062 ?auto_682063 ) ) ( not ( = ?auto_682062 ?auto_682064 ) ) ( not ( = ?auto_682062 ?auto_682065 ) ) ( not ( = ?auto_682062 ?auto_682071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682063 ?auto_682064 ?auto_682065 )
      ( MAKE-12CRATE-VERIFY ?auto_682054 ?auto_682055 ?auto_682056 ?auto_682053 ?auto_682057 ?auto_682059 ?auto_682058 ?auto_682060 ?auto_682061 ?auto_682062 ?auto_682063 ?auto_682064 ?auto_682065 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_682217 - SURFACE
      ?auto_682218 - SURFACE
      ?auto_682219 - SURFACE
      ?auto_682216 - SURFACE
      ?auto_682220 - SURFACE
      ?auto_682222 - SURFACE
      ?auto_682221 - SURFACE
      ?auto_682223 - SURFACE
      ?auto_682224 - SURFACE
      ?auto_682225 - SURFACE
      ?auto_682226 - SURFACE
      ?auto_682227 - SURFACE
      ?auto_682228 - SURFACE
    )
    :vars
    (
      ?auto_682234 - HOIST
      ?auto_682229 - PLACE
      ?auto_682232 - PLACE
      ?auto_682233 - HOIST
      ?auto_682231 - SURFACE
      ?auto_682230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682234 ?auto_682229 ) ( IS-CRATE ?auto_682228 ) ( not ( = ?auto_682227 ?auto_682228 ) ) ( not ( = ?auto_682226 ?auto_682227 ) ) ( not ( = ?auto_682226 ?auto_682228 ) ) ( not ( = ?auto_682232 ?auto_682229 ) ) ( HOIST-AT ?auto_682233 ?auto_682232 ) ( not ( = ?auto_682234 ?auto_682233 ) ) ( AVAILABLE ?auto_682233 ) ( SURFACE-AT ?auto_682228 ?auto_682232 ) ( ON ?auto_682228 ?auto_682231 ) ( CLEAR ?auto_682228 ) ( not ( = ?auto_682227 ?auto_682231 ) ) ( not ( = ?auto_682228 ?auto_682231 ) ) ( not ( = ?auto_682226 ?auto_682231 ) ) ( TRUCK-AT ?auto_682230 ?auto_682229 ) ( SURFACE-AT ?auto_682226 ?auto_682229 ) ( CLEAR ?auto_682226 ) ( LIFTING ?auto_682234 ?auto_682227 ) ( IS-CRATE ?auto_682227 ) ( ON ?auto_682218 ?auto_682217 ) ( ON ?auto_682219 ?auto_682218 ) ( ON ?auto_682216 ?auto_682219 ) ( ON ?auto_682220 ?auto_682216 ) ( ON ?auto_682222 ?auto_682220 ) ( ON ?auto_682221 ?auto_682222 ) ( ON ?auto_682223 ?auto_682221 ) ( ON ?auto_682224 ?auto_682223 ) ( ON ?auto_682225 ?auto_682224 ) ( ON ?auto_682226 ?auto_682225 ) ( not ( = ?auto_682217 ?auto_682218 ) ) ( not ( = ?auto_682217 ?auto_682219 ) ) ( not ( = ?auto_682217 ?auto_682216 ) ) ( not ( = ?auto_682217 ?auto_682220 ) ) ( not ( = ?auto_682217 ?auto_682222 ) ) ( not ( = ?auto_682217 ?auto_682221 ) ) ( not ( = ?auto_682217 ?auto_682223 ) ) ( not ( = ?auto_682217 ?auto_682224 ) ) ( not ( = ?auto_682217 ?auto_682225 ) ) ( not ( = ?auto_682217 ?auto_682226 ) ) ( not ( = ?auto_682217 ?auto_682227 ) ) ( not ( = ?auto_682217 ?auto_682228 ) ) ( not ( = ?auto_682217 ?auto_682231 ) ) ( not ( = ?auto_682218 ?auto_682219 ) ) ( not ( = ?auto_682218 ?auto_682216 ) ) ( not ( = ?auto_682218 ?auto_682220 ) ) ( not ( = ?auto_682218 ?auto_682222 ) ) ( not ( = ?auto_682218 ?auto_682221 ) ) ( not ( = ?auto_682218 ?auto_682223 ) ) ( not ( = ?auto_682218 ?auto_682224 ) ) ( not ( = ?auto_682218 ?auto_682225 ) ) ( not ( = ?auto_682218 ?auto_682226 ) ) ( not ( = ?auto_682218 ?auto_682227 ) ) ( not ( = ?auto_682218 ?auto_682228 ) ) ( not ( = ?auto_682218 ?auto_682231 ) ) ( not ( = ?auto_682219 ?auto_682216 ) ) ( not ( = ?auto_682219 ?auto_682220 ) ) ( not ( = ?auto_682219 ?auto_682222 ) ) ( not ( = ?auto_682219 ?auto_682221 ) ) ( not ( = ?auto_682219 ?auto_682223 ) ) ( not ( = ?auto_682219 ?auto_682224 ) ) ( not ( = ?auto_682219 ?auto_682225 ) ) ( not ( = ?auto_682219 ?auto_682226 ) ) ( not ( = ?auto_682219 ?auto_682227 ) ) ( not ( = ?auto_682219 ?auto_682228 ) ) ( not ( = ?auto_682219 ?auto_682231 ) ) ( not ( = ?auto_682216 ?auto_682220 ) ) ( not ( = ?auto_682216 ?auto_682222 ) ) ( not ( = ?auto_682216 ?auto_682221 ) ) ( not ( = ?auto_682216 ?auto_682223 ) ) ( not ( = ?auto_682216 ?auto_682224 ) ) ( not ( = ?auto_682216 ?auto_682225 ) ) ( not ( = ?auto_682216 ?auto_682226 ) ) ( not ( = ?auto_682216 ?auto_682227 ) ) ( not ( = ?auto_682216 ?auto_682228 ) ) ( not ( = ?auto_682216 ?auto_682231 ) ) ( not ( = ?auto_682220 ?auto_682222 ) ) ( not ( = ?auto_682220 ?auto_682221 ) ) ( not ( = ?auto_682220 ?auto_682223 ) ) ( not ( = ?auto_682220 ?auto_682224 ) ) ( not ( = ?auto_682220 ?auto_682225 ) ) ( not ( = ?auto_682220 ?auto_682226 ) ) ( not ( = ?auto_682220 ?auto_682227 ) ) ( not ( = ?auto_682220 ?auto_682228 ) ) ( not ( = ?auto_682220 ?auto_682231 ) ) ( not ( = ?auto_682222 ?auto_682221 ) ) ( not ( = ?auto_682222 ?auto_682223 ) ) ( not ( = ?auto_682222 ?auto_682224 ) ) ( not ( = ?auto_682222 ?auto_682225 ) ) ( not ( = ?auto_682222 ?auto_682226 ) ) ( not ( = ?auto_682222 ?auto_682227 ) ) ( not ( = ?auto_682222 ?auto_682228 ) ) ( not ( = ?auto_682222 ?auto_682231 ) ) ( not ( = ?auto_682221 ?auto_682223 ) ) ( not ( = ?auto_682221 ?auto_682224 ) ) ( not ( = ?auto_682221 ?auto_682225 ) ) ( not ( = ?auto_682221 ?auto_682226 ) ) ( not ( = ?auto_682221 ?auto_682227 ) ) ( not ( = ?auto_682221 ?auto_682228 ) ) ( not ( = ?auto_682221 ?auto_682231 ) ) ( not ( = ?auto_682223 ?auto_682224 ) ) ( not ( = ?auto_682223 ?auto_682225 ) ) ( not ( = ?auto_682223 ?auto_682226 ) ) ( not ( = ?auto_682223 ?auto_682227 ) ) ( not ( = ?auto_682223 ?auto_682228 ) ) ( not ( = ?auto_682223 ?auto_682231 ) ) ( not ( = ?auto_682224 ?auto_682225 ) ) ( not ( = ?auto_682224 ?auto_682226 ) ) ( not ( = ?auto_682224 ?auto_682227 ) ) ( not ( = ?auto_682224 ?auto_682228 ) ) ( not ( = ?auto_682224 ?auto_682231 ) ) ( not ( = ?auto_682225 ?auto_682226 ) ) ( not ( = ?auto_682225 ?auto_682227 ) ) ( not ( = ?auto_682225 ?auto_682228 ) ) ( not ( = ?auto_682225 ?auto_682231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682226 ?auto_682227 ?auto_682228 )
      ( MAKE-12CRATE-VERIFY ?auto_682217 ?auto_682218 ?auto_682219 ?auto_682216 ?auto_682220 ?auto_682222 ?auto_682221 ?auto_682223 ?auto_682224 ?auto_682225 ?auto_682226 ?auto_682227 ?auto_682228 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_682380 - SURFACE
      ?auto_682381 - SURFACE
      ?auto_682382 - SURFACE
      ?auto_682379 - SURFACE
      ?auto_682383 - SURFACE
      ?auto_682385 - SURFACE
      ?auto_682384 - SURFACE
      ?auto_682386 - SURFACE
      ?auto_682387 - SURFACE
      ?auto_682388 - SURFACE
      ?auto_682389 - SURFACE
      ?auto_682390 - SURFACE
      ?auto_682391 - SURFACE
    )
    :vars
    (
      ?auto_682395 - HOIST
      ?auto_682392 - PLACE
      ?auto_682394 - PLACE
      ?auto_682397 - HOIST
      ?auto_682396 - SURFACE
      ?auto_682393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682395 ?auto_682392 ) ( IS-CRATE ?auto_682391 ) ( not ( = ?auto_682390 ?auto_682391 ) ) ( not ( = ?auto_682389 ?auto_682390 ) ) ( not ( = ?auto_682389 ?auto_682391 ) ) ( not ( = ?auto_682394 ?auto_682392 ) ) ( HOIST-AT ?auto_682397 ?auto_682394 ) ( not ( = ?auto_682395 ?auto_682397 ) ) ( AVAILABLE ?auto_682397 ) ( SURFACE-AT ?auto_682391 ?auto_682394 ) ( ON ?auto_682391 ?auto_682396 ) ( CLEAR ?auto_682391 ) ( not ( = ?auto_682390 ?auto_682396 ) ) ( not ( = ?auto_682391 ?auto_682396 ) ) ( not ( = ?auto_682389 ?auto_682396 ) ) ( TRUCK-AT ?auto_682393 ?auto_682392 ) ( SURFACE-AT ?auto_682389 ?auto_682392 ) ( CLEAR ?auto_682389 ) ( IS-CRATE ?auto_682390 ) ( AVAILABLE ?auto_682395 ) ( IN ?auto_682390 ?auto_682393 ) ( ON ?auto_682381 ?auto_682380 ) ( ON ?auto_682382 ?auto_682381 ) ( ON ?auto_682379 ?auto_682382 ) ( ON ?auto_682383 ?auto_682379 ) ( ON ?auto_682385 ?auto_682383 ) ( ON ?auto_682384 ?auto_682385 ) ( ON ?auto_682386 ?auto_682384 ) ( ON ?auto_682387 ?auto_682386 ) ( ON ?auto_682388 ?auto_682387 ) ( ON ?auto_682389 ?auto_682388 ) ( not ( = ?auto_682380 ?auto_682381 ) ) ( not ( = ?auto_682380 ?auto_682382 ) ) ( not ( = ?auto_682380 ?auto_682379 ) ) ( not ( = ?auto_682380 ?auto_682383 ) ) ( not ( = ?auto_682380 ?auto_682385 ) ) ( not ( = ?auto_682380 ?auto_682384 ) ) ( not ( = ?auto_682380 ?auto_682386 ) ) ( not ( = ?auto_682380 ?auto_682387 ) ) ( not ( = ?auto_682380 ?auto_682388 ) ) ( not ( = ?auto_682380 ?auto_682389 ) ) ( not ( = ?auto_682380 ?auto_682390 ) ) ( not ( = ?auto_682380 ?auto_682391 ) ) ( not ( = ?auto_682380 ?auto_682396 ) ) ( not ( = ?auto_682381 ?auto_682382 ) ) ( not ( = ?auto_682381 ?auto_682379 ) ) ( not ( = ?auto_682381 ?auto_682383 ) ) ( not ( = ?auto_682381 ?auto_682385 ) ) ( not ( = ?auto_682381 ?auto_682384 ) ) ( not ( = ?auto_682381 ?auto_682386 ) ) ( not ( = ?auto_682381 ?auto_682387 ) ) ( not ( = ?auto_682381 ?auto_682388 ) ) ( not ( = ?auto_682381 ?auto_682389 ) ) ( not ( = ?auto_682381 ?auto_682390 ) ) ( not ( = ?auto_682381 ?auto_682391 ) ) ( not ( = ?auto_682381 ?auto_682396 ) ) ( not ( = ?auto_682382 ?auto_682379 ) ) ( not ( = ?auto_682382 ?auto_682383 ) ) ( not ( = ?auto_682382 ?auto_682385 ) ) ( not ( = ?auto_682382 ?auto_682384 ) ) ( not ( = ?auto_682382 ?auto_682386 ) ) ( not ( = ?auto_682382 ?auto_682387 ) ) ( not ( = ?auto_682382 ?auto_682388 ) ) ( not ( = ?auto_682382 ?auto_682389 ) ) ( not ( = ?auto_682382 ?auto_682390 ) ) ( not ( = ?auto_682382 ?auto_682391 ) ) ( not ( = ?auto_682382 ?auto_682396 ) ) ( not ( = ?auto_682379 ?auto_682383 ) ) ( not ( = ?auto_682379 ?auto_682385 ) ) ( not ( = ?auto_682379 ?auto_682384 ) ) ( not ( = ?auto_682379 ?auto_682386 ) ) ( not ( = ?auto_682379 ?auto_682387 ) ) ( not ( = ?auto_682379 ?auto_682388 ) ) ( not ( = ?auto_682379 ?auto_682389 ) ) ( not ( = ?auto_682379 ?auto_682390 ) ) ( not ( = ?auto_682379 ?auto_682391 ) ) ( not ( = ?auto_682379 ?auto_682396 ) ) ( not ( = ?auto_682383 ?auto_682385 ) ) ( not ( = ?auto_682383 ?auto_682384 ) ) ( not ( = ?auto_682383 ?auto_682386 ) ) ( not ( = ?auto_682383 ?auto_682387 ) ) ( not ( = ?auto_682383 ?auto_682388 ) ) ( not ( = ?auto_682383 ?auto_682389 ) ) ( not ( = ?auto_682383 ?auto_682390 ) ) ( not ( = ?auto_682383 ?auto_682391 ) ) ( not ( = ?auto_682383 ?auto_682396 ) ) ( not ( = ?auto_682385 ?auto_682384 ) ) ( not ( = ?auto_682385 ?auto_682386 ) ) ( not ( = ?auto_682385 ?auto_682387 ) ) ( not ( = ?auto_682385 ?auto_682388 ) ) ( not ( = ?auto_682385 ?auto_682389 ) ) ( not ( = ?auto_682385 ?auto_682390 ) ) ( not ( = ?auto_682385 ?auto_682391 ) ) ( not ( = ?auto_682385 ?auto_682396 ) ) ( not ( = ?auto_682384 ?auto_682386 ) ) ( not ( = ?auto_682384 ?auto_682387 ) ) ( not ( = ?auto_682384 ?auto_682388 ) ) ( not ( = ?auto_682384 ?auto_682389 ) ) ( not ( = ?auto_682384 ?auto_682390 ) ) ( not ( = ?auto_682384 ?auto_682391 ) ) ( not ( = ?auto_682384 ?auto_682396 ) ) ( not ( = ?auto_682386 ?auto_682387 ) ) ( not ( = ?auto_682386 ?auto_682388 ) ) ( not ( = ?auto_682386 ?auto_682389 ) ) ( not ( = ?auto_682386 ?auto_682390 ) ) ( not ( = ?auto_682386 ?auto_682391 ) ) ( not ( = ?auto_682386 ?auto_682396 ) ) ( not ( = ?auto_682387 ?auto_682388 ) ) ( not ( = ?auto_682387 ?auto_682389 ) ) ( not ( = ?auto_682387 ?auto_682390 ) ) ( not ( = ?auto_682387 ?auto_682391 ) ) ( not ( = ?auto_682387 ?auto_682396 ) ) ( not ( = ?auto_682388 ?auto_682389 ) ) ( not ( = ?auto_682388 ?auto_682390 ) ) ( not ( = ?auto_682388 ?auto_682391 ) ) ( not ( = ?auto_682388 ?auto_682396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682389 ?auto_682390 ?auto_682391 )
      ( MAKE-12CRATE-VERIFY ?auto_682380 ?auto_682381 ?auto_682382 ?auto_682379 ?auto_682383 ?auto_682385 ?auto_682384 ?auto_682386 ?auto_682387 ?auto_682388 ?auto_682389 ?auto_682390 ?auto_682391 ) )
  )

)

