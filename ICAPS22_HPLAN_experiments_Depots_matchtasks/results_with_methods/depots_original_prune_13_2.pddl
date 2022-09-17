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

  ( :method MAKE-13CRATE-VERIFY
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
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977315 - SURFACE
      ?auto_977316 - SURFACE
    )
    :vars
    (
      ?auto_977317 - HOIST
      ?auto_977318 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977317 ?auto_977318 ) ( SURFACE-AT ?auto_977315 ?auto_977318 ) ( CLEAR ?auto_977315 ) ( LIFTING ?auto_977317 ?auto_977316 ) ( IS-CRATE ?auto_977316 ) ( not ( = ?auto_977315 ?auto_977316 ) ) )
    :subtasks
    ( ( !DROP ?auto_977317 ?auto_977316 ?auto_977315 ?auto_977318 )
      ( MAKE-1CRATE-VERIFY ?auto_977315 ?auto_977316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977319 - SURFACE
      ?auto_977320 - SURFACE
    )
    :vars
    (
      ?auto_977322 - HOIST
      ?auto_977321 - PLACE
      ?auto_977323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977322 ?auto_977321 ) ( SURFACE-AT ?auto_977319 ?auto_977321 ) ( CLEAR ?auto_977319 ) ( IS-CRATE ?auto_977320 ) ( not ( = ?auto_977319 ?auto_977320 ) ) ( TRUCK-AT ?auto_977323 ?auto_977321 ) ( AVAILABLE ?auto_977322 ) ( IN ?auto_977320 ?auto_977323 ) )
    :subtasks
    ( ( !UNLOAD ?auto_977322 ?auto_977320 ?auto_977323 ?auto_977321 )
      ( MAKE-1CRATE ?auto_977319 ?auto_977320 )
      ( MAKE-1CRATE-VERIFY ?auto_977319 ?auto_977320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977324 - SURFACE
      ?auto_977325 - SURFACE
    )
    :vars
    (
      ?auto_977328 - HOIST
      ?auto_977327 - PLACE
      ?auto_977326 - TRUCK
      ?auto_977329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977328 ?auto_977327 ) ( SURFACE-AT ?auto_977324 ?auto_977327 ) ( CLEAR ?auto_977324 ) ( IS-CRATE ?auto_977325 ) ( not ( = ?auto_977324 ?auto_977325 ) ) ( AVAILABLE ?auto_977328 ) ( IN ?auto_977325 ?auto_977326 ) ( TRUCK-AT ?auto_977326 ?auto_977329 ) ( not ( = ?auto_977329 ?auto_977327 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977326 ?auto_977329 ?auto_977327 )
      ( MAKE-1CRATE ?auto_977324 ?auto_977325 )
      ( MAKE-1CRATE-VERIFY ?auto_977324 ?auto_977325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977330 - SURFACE
      ?auto_977331 - SURFACE
    )
    :vars
    (
      ?auto_977333 - HOIST
      ?auto_977334 - PLACE
      ?auto_977335 - TRUCK
      ?auto_977332 - PLACE
      ?auto_977336 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977333 ?auto_977334 ) ( SURFACE-AT ?auto_977330 ?auto_977334 ) ( CLEAR ?auto_977330 ) ( IS-CRATE ?auto_977331 ) ( not ( = ?auto_977330 ?auto_977331 ) ) ( AVAILABLE ?auto_977333 ) ( TRUCK-AT ?auto_977335 ?auto_977332 ) ( not ( = ?auto_977332 ?auto_977334 ) ) ( HOIST-AT ?auto_977336 ?auto_977332 ) ( LIFTING ?auto_977336 ?auto_977331 ) ( not ( = ?auto_977333 ?auto_977336 ) ) )
    :subtasks
    ( ( !LOAD ?auto_977336 ?auto_977331 ?auto_977335 ?auto_977332 )
      ( MAKE-1CRATE ?auto_977330 ?auto_977331 )
      ( MAKE-1CRATE-VERIFY ?auto_977330 ?auto_977331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977337 - SURFACE
      ?auto_977338 - SURFACE
    )
    :vars
    (
      ?auto_977340 - HOIST
      ?auto_977342 - PLACE
      ?auto_977343 - TRUCK
      ?auto_977341 - PLACE
      ?auto_977339 - HOIST
      ?auto_977344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977340 ?auto_977342 ) ( SURFACE-AT ?auto_977337 ?auto_977342 ) ( CLEAR ?auto_977337 ) ( IS-CRATE ?auto_977338 ) ( not ( = ?auto_977337 ?auto_977338 ) ) ( AVAILABLE ?auto_977340 ) ( TRUCK-AT ?auto_977343 ?auto_977341 ) ( not ( = ?auto_977341 ?auto_977342 ) ) ( HOIST-AT ?auto_977339 ?auto_977341 ) ( not ( = ?auto_977340 ?auto_977339 ) ) ( AVAILABLE ?auto_977339 ) ( SURFACE-AT ?auto_977338 ?auto_977341 ) ( ON ?auto_977338 ?auto_977344 ) ( CLEAR ?auto_977338 ) ( not ( = ?auto_977337 ?auto_977344 ) ) ( not ( = ?auto_977338 ?auto_977344 ) ) )
    :subtasks
    ( ( !LIFT ?auto_977339 ?auto_977338 ?auto_977344 ?auto_977341 )
      ( MAKE-1CRATE ?auto_977337 ?auto_977338 )
      ( MAKE-1CRATE-VERIFY ?auto_977337 ?auto_977338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977345 - SURFACE
      ?auto_977346 - SURFACE
    )
    :vars
    (
      ?auto_977349 - HOIST
      ?auto_977348 - PLACE
      ?auto_977350 - PLACE
      ?auto_977347 - HOIST
      ?auto_977351 - SURFACE
      ?auto_977352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977349 ?auto_977348 ) ( SURFACE-AT ?auto_977345 ?auto_977348 ) ( CLEAR ?auto_977345 ) ( IS-CRATE ?auto_977346 ) ( not ( = ?auto_977345 ?auto_977346 ) ) ( AVAILABLE ?auto_977349 ) ( not ( = ?auto_977350 ?auto_977348 ) ) ( HOIST-AT ?auto_977347 ?auto_977350 ) ( not ( = ?auto_977349 ?auto_977347 ) ) ( AVAILABLE ?auto_977347 ) ( SURFACE-AT ?auto_977346 ?auto_977350 ) ( ON ?auto_977346 ?auto_977351 ) ( CLEAR ?auto_977346 ) ( not ( = ?auto_977345 ?auto_977351 ) ) ( not ( = ?auto_977346 ?auto_977351 ) ) ( TRUCK-AT ?auto_977352 ?auto_977348 ) )
    :subtasks
    ( ( !DRIVE ?auto_977352 ?auto_977348 ?auto_977350 )
      ( MAKE-1CRATE ?auto_977345 ?auto_977346 )
      ( MAKE-1CRATE-VERIFY ?auto_977345 ?auto_977346 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977362 - SURFACE
      ?auto_977363 - SURFACE
      ?auto_977364 - SURFACE
    )
    :vars
    (
      ?auto_977365 - HOIST
      ?auto_977366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977365 ?auto_977366 ) ( SURFACE-AT ?auto_977363 ?auto_977366 ) ( CLEAR ?auto_977363 ) ( LIFTING ?auto_977365 ?auto_977364 ) ( IS-CRATE ?auto_977364 ) ( not ( = ?auto_977363 ?auto_977364 ) ) ( ON ?auto_977363 ?auto_977362 ) ( not ( = ?auto_977362 ?auto_977363 ) ) ( not ( = ?auto_977362 ?auto_977364 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977363 ?auto_977364 )
      ( MAKE-2CRATE-VERIFY ?auto_977362 ?auto_977363 ?auto_977364 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977372 - SURFACE
      ?auto_977373 - SURFACE
      ?auto_977374 - SURFACE
    )
    :vars
    (
      ?auto_977375 - HOIST
      ?auto_977376 - PLACE
      ?auto_977377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977375 ?auto_977376 ) ( SURFACE-AT ?auto_977373 ?auto_977376 ) ( CLEAR ?auto_977373 ) ( IS-CRATE ?auto_977374 ) ( not ( = ?auto_977373 ?auto_977374 ) ) ( TRUCK-AT ?auto_977377 ?auto_977376 ) ( AVAILABLE ?auto_977375 ) ( IN ?auto_977374 ?auto_977377 ) ( ON ?auto_977373 ?auto_977372 ) ( not ( = ?auto_977372 ?auto_977373 ) ) ( not ( = ?auto_977372 ?auto_977374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977373 ?auto_977374 )
      ( MAKE-2CRATE-VERIFY ?auto_977372 ?auto_977373 ?auto_977374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977378 - SURFACE
      ?auto_977379 - SURFACE
    )
    :vars
    (
      ?auto_977380 - HOIST
      ?auto_977383 - PLACE
      ?auto_977381 - TRUCK
      ?auto_977382 - SURFACE
      ?auto_977384 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977380 ?auto_977383 ) ( SURFACE-AT ?auto_977378 ?auto_977383 ) ( CLEAR ?auto_977378 ) ( IS-CRATE ?auto_977379 ) ( not ( = ?auto_977378 ?auto_977379 ) ) ( AVAILABLE ?auto_977380 ) ( IN ?auto_977379 ?auto_977381 ) ( ON ?auto_977378 ?auto_977382 ) ( not ( = ?auto_977382 ?auto_977378 ) ) ( not ( = ?auto_977382 ?auto_977379 ) ) ( TRUCK-AT ?auto_977381 ?auto_977384 ) ( not ( = ?auto_977384 ?auto_977383 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977381 ?auto_977384 ?auto_977383 )
      ( MAKE-2CRATE ?auto_977382 ?auto_977378 ?auto_977379 )
      ( MAKE-1CRATE-VERIFY ?auto_977378 ?auto_977379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977385 - SURFACE
      ?auto_977386 - SURFACE
      ?auto_977387 - SURFACE
    )
    :vars
    (
      ?auto_977389 - HOIST
      ?auto_977388 - PLACE
      ?auto_977391 - TRUCK
      ?auto_977390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977389 ?auto_977388 ) ( SURFACE-AT ?auto_977386 ?auto_977388 ) ( CLEAR ?auto_977386 ) ( IS-CRATE ?auto_977387 ) ( not ( = ?auto_977386 ?auto_977387 ) ) ( AVAILABLE ?auto_977389 ) ( IN ?auto_977387 ?auto_977391 ) ( ON ?auto_977386 ?auto_977385 ) ( not ( = ?auto_977385 ?auto_977386 ) ) ( not ( = ?auto_977385 ?auto_977387 ) ) ( TRUCK-AT ?auto_977391 ?auto_977390 ) ( not ( = ?auto_977390 ?auto_977388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977386 ?auto_977387 )
      ( MAKE-2CRATE-VERIFY ?auto_977385 ?auto_977386 ?auto_977387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977392 - SURFACE
      ?auto_977393 - SURFACE
    )
    :vars
    (
      ?auto_977394 - HOIST
      ?auto_977397 - PLACE
      ?auto_977398 - SURFACE
      ?auto_977395 - TRUCK
      ?auto_977396 - PLACE
      ?auto_977399 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977394 ?auto_977397 ) ( SURFACE-AT ?auto_977392 ?auto_977397 ) ( CLEAR ?auto_977392 ) ( IS-CRATE ?auto_977393 ) ( not ( = ?auto_977392 ?auto_977393 ) ) ( AVAILABLE ?auto_977394 ) ( ON ?auto_977392 ?auto_977398 ) ( not ( = ?auto_977398 ?auto_977392 ) ) ( not ( = ?auto_977398 ?auto_977393 ) ) ( TRUCK-AT ?auto_977395 ?auto_977396 ) ( not ( = ?auto_977396 ?auto_977397 ) ) ( HOIST-AT ?auto_977399 ?auto_977396 ) ( LIFTING ?auto_977399 ?auto_977393 ) ( not ( = ?auto_977394 ?auto_977399 ) ) )
    :subtasks
    ( ( !LOAD ?auto_977399 ?auto_977393 ?auto_977395 ?auto_977396 )
      ( MAKE-2CRATE ?auto_977398 ?auto_977392 ?auto_977393 )
      ( MAKE-1CRATE-VERIFY ?auto_977392 ?auto_977393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977400 - SURFACE
      ?auto_977401 - SURFACE
      ?auto_977402 - SURFACE
    )
    :vars
    (
      ?auto_977405 - HOIST
      ?auto_977407 - PLACE
      ?auto_977404 - TRUCK
      ?auto_977406 - PLACE
      ?auto_977403 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977405 ?auto_977407 ) ( SURFACE-AT ?auto_977401 ?auto_977407 ) ( CLEAR ?auto_977401 ) ( IS-CRATE ?auto_977402 ) ( not ( = ?auto_977401 ?auto_977402 ) ) ( AVAILABLE ?auto_977405 ) ( ON ?auto_977401 ?auto_977400 ) ( not ( = ?auto_977400 ?auto_977401 ) ) ( not ( = ?auto_977400 ?auto_977402 ) ) ( TRUCK-AT ?auto_977404 ?auto_977406 ) ( not ( = ?auto_977406 ?auto_977407 ) ) ( HOIST-AT ?auto_977403 ?auto_977406 ) ( LIFTING ?auto_977403 ?auto_977402 ) ( not ( = ?auto_977405 ?auto_977403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977401 ?auto_977402 )
      ( MAKE-2CRATE-VERIFY ?auto_977400 ?auto_977401 ?auto_977402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977408 - SURFACE
      ?auto_977409 - SURFACE
    )
    :vars
    (
      ?auto_977412 - HOIST
      ?auto_977413 - PLACE
      ?auto_977411 - SURFACE
      ?auto_977415 - TRUCK
      ?auto_977414 - PLACE
      ?auto_977410 - HOIST
      ?auto_977416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977412 ?auto_977413 ) ( SURFACE-AT ?auto_977408 ?auto_977413 ) ( CLEAR ?auto_977408 ) ( IS-CRATE ?auto_977409 ) ( not ( = ?auto_977408 ?auto_977409 ) ) ( AVAILABLE ?auto_977412 ) ( ON ?auto_977408 ?auto_977411 ) ( not ( = ?auto_977411 ?auto_977408 ) ) ( not ( = ?auto_977411 ?auto_977409 ) ) ( TRUCK-AT ?auto_977415 ?auto_977414 ) ( not ( = ?auto_977414 ?auto_977413 ) ) ( HOIST-AT ?auto_977410 ?auto_977414 ) ( not ( = ?auto_977412 ?auto_977410 ) ) ( AVAILABLE ?auto_977410 ) ( SURFACE-AT ?auto_977409 ?auto_977414 ) ( ON ?auto_977409 ?auto_977416 ) ( CLEAR ?auto_977409 ) ( not ( = ?auto_977408 ?auto_977416 ) ) ( not ( = ?auto_977409 ?auto_977416 ) ) ( not ( = ?auto_977411 ?auto_977416 ) ) )
    :subtasks
    ( ( !LIFT ?auto_977410 ?auto_977409 ?auto_977416 ?auto_977414 )
      ( MAKE-2CRATE ?auto_977411 ?auto_977408 ?auto_977409 )
      ( MAKE-1CRATE-VERIFY ?auto_977408 ?auto_977409 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977417 - SURFACE
      ?auto_977418 - SURFACE
      ?auto_977419 - SURFACE
    )
    :vars
    (
      ?auto_977425 - HOIST
      ?auto_977423 - PLACE
      ?auto_977422 - TRUCK
      ?auto_977421 - PLACE
      ?auto_977424 - HOIST
      ?auto_977420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977425 ?auto_977423 ) ( SURFACE-AT ?auto_977418 ?auto_977423 ) ( CLEAR ?auto_977418 ) ( IS-CRATE ?auto_977419 ) ( not ( = ?auto_977418 ?auto_977419 ) ) ( AVAILABLE ?auto_977425 ) ( ON ?auto_977418 ?auto_977417 ) ( not ( = ?auto_977417 ?auto_977418 ) ) ( not ( = ?auto_977417 ?auto_977419 ) ) ( TRUCK-AT ?auto_977422 ?auto_977421 ) ( not ( = ?auto_977421 ?auto_977423 ) ) ( HOIST-AT ?auto_977424 ?auto_977421 ) ( not ( = ?auto_977425 ?auto_977424 ) ) ( AVAILABLE ?auto_977424 ) ( SURFACE-AT ?auto_977419 ?auto_977421 ) ( ON ?auto_977419 ?auto_977420 ) ( CLEAR ?auto_977419 ) ( not ( = ?auto_977418 ?auto_977420 ) ) ( not ( = ?auto_977419 ?auto_977420 ) ) ( not ( = ?auto_977417 ?auto_977420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977418 ?auto_977419 )
      ( MAKE-2CRATE-VERIFY ?auto_977417 ?auto_977418 ?auto_977419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977426 - SURFACE
      ?auto_977427 - SURFACE
    )
    :vars
    (
      ?auto_977432 - HOIST
      ?auto_977431 - PLACE
      ?auto_977433 - SURFACE
      ?auto_977430 - PLACE
      ?auto_977434 - HOIST
      ?auto_977428 - SURFACE
      ?auto_977429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977432 ?auto_977431 ) ( SURFACE-AT ?auto_977426 ?auto_977431 ) ( CLEAR ?auto_977426 ) ( IS-CRATE ?auto_977427 ) ( not ( = ?auto_977426 ?auto_977427 ) ) ( AVAILABLE ?auto_977432 ) ( ON ?auto_977426 ?auto_977433 ) ( not ( = ?auto_977433 ?auto_977426 ) ) ( not ( = ?auto_977433 ?auto_977427 ) ) ( not ( = ?auto_977430 ?auto_977431 ) ) ( HOIST-AT ?auto_977434 ?auto_977430 ) ( not ( = ?auto_977432 ?auto_977434 ) ) ( AVAILABLE ?auto_977434 ) ( SURFACE-AT ?auto_977427 ?auto_977430 ) ( ON ?auto_977427 ?auto_977428 ) ( CLEAR ?auto_977427 ) ( not ( = ?auto_977426 ?auto_977428 ) ) ( not ( = ?auto_977427 ?auto_977428 ) ) ( not ( = ?auto_977433 ?auto_977428 ) ) ( TRUCK-AT ?auto_977429 ?auto_977431 ) )
    :subtasks
    ( ( !DRIVE ?auto_977429 ?auto_977431 ?auto_977430 )
      ( MAKE-2CRATE ?auto_977433 ?auto_977426 ?auto_977427 )
      ( MAKE-1CRATE-VERIFY ?auto_977426 ?auto_977427 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977435 - SURFACE
      ?auto_977436 - SURFACE
      ?auto_977437 - SURFACE
    )
    :vars
    (
      ?auto_977442 - HOIST
      ?auto_977441 - PLACE
      ?auto_977439 - PLACE
      ?auto_977443 - HOIST
      ?auto_977438 - SURFACE
      ?auto_977440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977442 ?auto_977441 ) ( SURFACE-AT ?auto_977436 ?auto_977441 ) ( CLEAR ?auto_977436 ) ( IS-CRATE ?auto_977437 ) ( not ( = ?auto_977436 ?auto_977437 ) ) ( AVAILABLE ?auto_977442 ) ( ON ?auto_977436 ?auto_977435 ) ( not ( = ?auto_977435 ?auto_977436 ) ) ( not ( = ?auto_977435 ?auto_977437 ) ) ( not ( = ?auto_977439 ?auto_977441 ) ) ( HOIST-AT ?auto_977443 ?auto_977439 ) ( not ( = ?auto_977442 ?auto_977443 ) ) ( AVAILABLE ?auto_977443 ) ( SURFACE-AT ?auto_977437 ?auto_977439 ) ( ON ?auto_977437 ?auto_977438 ) ( CLEAR ?auto_977437 ) ( not ( = ?auto_977436 ?auto_977438 ) ) ( not ( = ?auto_977437 ?auto_977438 ) ) ( not ( = ?auto_977435 ?auto_977438 ) ) ( TRUCK-AT ?auto_977440 ?auto_977441 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977436 ?auto_977437 )
      ( MAKE-2CRATE-VERIFY ?auto_977435 ?auto_977436 ?auto_977437 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977444 - SURFACE
      ?auto_977445 - SURFACE
    )
    :vars
    (
      ?auto_977449 - HOIST
      ?auto_977450 - PLACE
      ?auto_977451 - SURFACE
      ?auto_977447 - PLACE
      ?auto_977446 - HOIST
      ?auto_977448 - SURFACE
      ?auto_977452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977449 ?auto_977450 ) ( IS-CRATE ?auto_977445 ) ( not ( = ?auto_977444 ?auto_977445 ) ) ( not ( = ?auto_977451 ?auto_977444 ) ) ( not ( = ?auto_977451 ?auto_977445 ) ) ( not ( = ?auto_977447 ?auto_977450 ) ) ( HOIST-AT ?auto_977446 ?auto_977447 ) ( not ( = ?auto_977449 ?auto_977446 ) ) ( AVAILABLE ?auto_977446 ) ( SURFACE-AT ?auto_977445 ?auto_977447 ) ( ON ?auto_977445 ?auto_977448 ) ( CLEAR ?auto_977445 ) ( not ( = ?auto_977444 ?auto_977448 ) ) ( not ( = ?auto_977445 ?auto_977448 ) ) ( not ( = ?auto_977451 ?auto_977448 ) ) ( TRUCK-AT ?auto_977452 ?auto_977450 ) ( SURFACE-AT ?auto_977451 ?auto_977450 ) ( CLEAR ?auto_977451 ) ( LIFTING ?auto_977449 ?auto_977444 ) ( IS-CRATE ?auto_977444 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977451 ?auto_977444 )
      ( MAKE-2CRATE ?auto_977451 ?auto_977444 ?auto_977445 )
      ( MAKE-1CRATE-VERIFY ?auto_977444 ?auto_977445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977453 - SURFACE
      ?auto_977454 - SURFACE
      ?auto_977455 - SURFACE
    )
    :vars
    (
      ?auto_977458 - HOIST
      ?auto_977459 - PLACE
      ?auto_977457 - PLACE
      ?auto_977460 - HOIST
      ?auto_977456 - SURFACE
      ?auto_977461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977458 ?auto_977459 ) ( IS-CRATE ?auto_977455 ) ( not ( = ?auto_977454 ?auto_977455 ) ) ( not ( = ?auto_977453 ?auto_977454 ) ) ( not ( = ?auto_977453 ?auto_977455 ) ) ( not ( = ?auto_977457 ?auto_977459 ) ) ( HOIST-AT ?auto_977460 ?auto_977457 ) ( not ( = ?auto_977458 ?auto_977460 ) ) ( AVAILABLE ?auto_977460 ) ( SURFACE-AT ?auto_977455 ?auto_977457 ) ( ON ?auto_977455 ?auto_977456 ) ( CLEAR ?auto_977455 ) ( not ( = ?auto_977454 ?auto_977456 ) ) ( not ( = ?auto_977455 ?auto_977456 ) ) ( not ( = ?auto_977453 ?auto_977456 ) ) ( TRUCK-AT ?auto_977461 ?auto_977459 ) ( SURFACE-AT ?auto_977453 ?auto_977459 ) ( CLEAR ?auto_977453 ) ( LIFTING ?auto_977458 ?auto_977454 ) ( IS-CRATE ?auto_977454 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977454 ?auto_977455 )
      ( MAKE-2CRATE-VERIFY ?auto_977453 ?auto_977454 ?auto_977455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977462 - SURFACE
      ?auto_977463 - SURFACE
    )
    :vars
    (
      ?auto_977464 - HOIST
      ?auto_977467 - PLACE
      ?auto_977469 - SURFACE
      ?auto_977465 - PLACE
      ?auto_977470 - HOIST
      ?auto_977466 - SURFACE
      ?auto_977468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977464 ?auto_977467 ) ( IS-CRATE ?auto_977463 ) ( not ( = ?auto_977462 ?auto_977463 ) ) ( not ( = ?auto_977469 ?auto_977462 ) ) ( not ( = ?auto_977469 ?auto_977463 ) ) ( not ( = ?auto_977465 ?auto_977467 ) ) ( HOIST-AT ?auto_977470 ?auto_977465 ) ( not ( = ?auto_977464 ?auto_977470 ) ) ( AVAILABLE ?auto_977470 ) ( SURFACE-AT ?auto_977463 ?auto_977465 ) ( ON ?auto_977463 ?auto_977466 ) ( CLEAR ?auto_977463 ) ( not ( = ?auto_977462 ?auto_977466 ) ) ( not ( = ?auto_977463 ?auto_977466 ) ) ( not ( = ?auto_977469 ?auto_977466 ) ) ( TRUCK-AT ?auto_977468 ?auto_977467 ) ( SURFACE-AT ?auto_977469 ?auto_977467 ) ( CLEAR ?auto_977469 ) ( IS-CRATE ?auto_977462 ) ( AVAILABLE ?auto_977464 ) ( IN ?auto_977462 ?auto_977468 ) )
    :subtasks
    ( ( !UNLOAD ?auto_977464 ?auto_977462 ?auto_977468 ?auto_977467 )
      ( MAKE-2CRATE ?auto_977469 ?auto_977462 ?auto_977463 )
      ( MAKE-1CRATE-VERIFY ?auto_977462 ?auto_977463 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977471 - SURFACE
      ?auto_977472 - SURFACE
      ?auto_977473 - SURFACE
    )
    :vars
    (
      ?auto_977474 - HOIST
      ?auto_977479 - PLACE
      ?auto_977478 - PLACE
      ?auto_977477 - HOIST
      ?auto_977476 - SURFACE
      ?auto_977475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977474 ?auto_977479 ) ( IS-CRATE ?auto_977473 ) ( not ( = ?auto_977472 ?auto_977473 ) ) ( not ( = ?auto_977471 ?auto_977472 ) ) ( not ( = ?auto_977471 ?auto_977473 ) ) ( not ( = ?auto_977478 ?auto_977479 ) ) ( HOIST-AT ?auto_977477 ?auto_977478 ) ( not ( = ?auto_977474 ?auto_977477 ) ) ( AVAILABLE ?auto_977477 ) ( SURFACE-AT ?auto_977473 ?auto_977478 ) ( ON ?auto_977473 ?auto_977476 ) ( CLEAR ?auto_977473 ) ( not ( = ?auto_977472 ?auto_977476 ) ) ( not ( = ?auto_977473 ?auto_977476 ) ) ( not ( = ?auto_977471 ?auto_977476 ) ) ( TRUCK-AT ?auto_977475 ?auto_977479 ) ( SURFACE-AT ?auto_977471 ?auto_977479 ) ( CLEAR ?auto_977471 ) ( IS-CRATE ?auto_977472 ) ( AVAILABLE ?auto_977474 ) ( IN ?auto_977472 ?auto_977475 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977472 ?auto_977473 )
      ( MAKE-2CRATE-VERIFY ?auto_977471 ?auto_977472 ?auto_977473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977516 - SURFACE
      ?auto_977517 - SURFACE
    )
    :vars
    (
      ?auto_977519 - HOIST
      ?auto_977523 - PLACE
      ?auto_977524 - SURFACE
      ?auto_977518 - PLACE
      ?auto_977522 - HOIST
      ?auto_977521 - SURFACE
      ?auto_977520 - TRUCK
      ?auto_977525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977519 ?auto_977523 ) ( SURFACE-AT ?auto_977516 ?auto_977523 ) ( CLEAR ?auto_977516 ) ( IS-CRATE ?auto_977517 ) ( not ( = ?auto_977516 ?auto_977517 ) ) ( AVAILABLE ?auto_977519 ) ( ON ?auto_977516 ?auto_977524 ) ( not ( = ?auto_977524 ?auto_977516 ) ) ( not ( = ?auto_977524 ?auto_977517 ) ) ( not ( = ?auto_977518 ?auto_977523 ) ) ( HOIST-AT ?auto_977522 ?auto_977518 ) ( not ( = ?auto_977519 ?auto_977522 ) ) ( AVAILABLE ?auto_977522 ) ( SURFACE-AT ?auto_977517 ?auto_977518 ) ( ON ?auto_977517 ?auto_977521 ) ( CLEAR ?auto_977517 ) ( not ( = ?auto_977516 ?auto_977521 ) ) ( not ( = ?auto_977517 ?auto_977521 ) ) ( not ( = ?auto_977524 ?auto_977521 ) ) ( TRUCK-AT ?auto_977520 ?auto_977525 ) ( not ( = ?auto_977525 ?auto_977523 ) ) ( not ( = ?auto_977518 ?auto_977525 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977520 ?auto_977525 ?auto_977523 )
      ( MAKE-1CRATE ?auto_977516 ?auto_977517 )
      ( MAKE-1CRATE-VERIFY ?auto_977516 ?auto_977517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977556 - SURFACE
      ?auto_977557 - SURFACE
      ?auto_977558 - SURFACE
      ?auto_977555 - SURFACE
    )
    :vars
    (
      ?auto_977559 - HOIST
      ?auto_977560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977559 ?auto_977560 ) ( SURFACE-AT ?auto_977558 ?auto_977560 ) ( CLEAR ?auto_977558 ) ( LIFTING ?auto_977559 ?auto_977555 ) ( IS-CRATE ?auto_977555 ) ( not ( = ?auto_977558 ?auto_977555 ) ) ( ON ?auto_977557 ?auto_977556 ) ( ON ?auto_977558 ?auto_977557 ) ( not ( = ?auto_977556 ?auto_977557 ) ) ( not ( = ?auto_977556 ?auto_977558 ) ) ( not ( = ?auto_977556 ?auto_977555 ) ) ( not ( = ?auto_977557 ?auto_977558 ) ) ( not ( = ?auto_977557 ?auto_977555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977558 ?auto_977555 )
      ( MAKE-3CRATE-VERIFY ?auto_977556 ?auto_977557 ?auto_977558 ?auto_977555 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977573 - SURFACE
      ?auto_977574 - SURFACE
      ?auto_977575 - SURFACE
      ?auto_977572 - SURFACE
    )
    :vars
    (
      ?auto_977576 - HOIST
      ?auto_977578 - PLACE
      ?auto_977577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977576 ?auto_977578 ) ( SURFACE-AT ?auto_977575 ?auto_977578 ) ( CLEAR ?auto_977575 ) ( IS-CRATE ?auto_977572 ) ( not ( = ?auto_977575 ?auto_977572 ) ) ( TRUCK-AT ?auto_977577 ?auto_977578 ) ( AVAILABLE ?auto_977576 ) ( IN ?auto_977572 ?auto_977577 ) ( ON ?auto_977575 ?auto_977574 ) ( not ( = ?auto_977574 ?auto_977575 ) ) ( not ( = ?auto_977574 ?auto_977572 ) ) ( ON ?auto_977574 ?auto_977573 ) ( not ( = ?auto_977573 ?auto_977574 ) ) ( not ( = ?auto_977573 ?auto_977575 ) ) ( not ( = ?auto_977573 ?auto_977572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977574 ?auto_977575 ?auto_977572 )
      ( MAKE-3CRATE-VERIFY ?auto_977573 ?auto_977574 ?auto_977575 ?auto_977572 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977594 - SURFACE
      ?auto_977595 - SURFACE
      ?auto_977596 - SURFACE
      ?auto_977593 - SURFACE
    )
    :vars
    (
      ?auto_977597 - HOIST
      ?auto_977598 - PLACE
      ?auto_977599 - TRUCK
      ?auto_977600 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977597 ?auto_977598 ) ( SURFACE-AT ?auto_977596 ?auto_977598 ) ( CLEAR ?auto_977596 ) ( IS-CRATE ?auto_977593 ) ( not ( = ?auto_977596 ?auto_977593 ) ) ( AVAILABLE ?auto_977597 ) ( IN ?auto_977593 ?auto_977599 ) ( ON ?auto_977596 ?auto_977595 ) ( not ( = ?auto_977595 ?auto_977596 ) ) ( not ( = ?auto_977595 ?auto_977593 ) ) ( TRUCK-AT ?auto_977599 ?auto_977600 ) ( not ( = ?auto_977600 ?auto_977598 ) ) ( ON ?auto_977595 ?auto_977594 ) ( not ( = ?auto_977594 ?auto_977595 ) ) ( not ( = ?auto_977594 ?auto_977596 ) ) ( not ( = ?auto_977594 ?auto_977593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977595 ?auto_977596 ?auto_977593 )
      ( MAKE-3CRATE-VERIFY ?auto_977594 ?auto_977595 ?auto_977596 ?auto_977593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977618 - SURFACE
      ?auto_977619 - SURFACE
      ?auto_977620 - SURFACE
      ?auto_977617 - SURFACE
    )
    :vars
    (
      ?auto_977622 - HOIST
      ?auto_977625 - PLACE
      ?auto_977623 - TRUCK
      ?auto_977624 - PLACE
      ?auto_977621 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977622 ?auto_977625 ) ( SURFACE-AT ?auto_977620 ?auto_977625 ) ( CLEAR ?auto_977620 ) ( IS-CRATE ?auto_977617 ) ( not ( = ?auto_977620 ?auto_977617 ) ) ( AVAILABLE ?auto_977622 ) ( ON ?auto_977620 ?auto_977619 ) ( not ( = ?auto_977619 ?auto_977620 ) ) ( not ( = ?auto_977619 ?auto_977617 ) ) ( TRUCK-AT ?auto_977623 ?auto_977624 ) ( not ( = ?auto_977624 ?auto_977625 ) ) ( HOIST-AT ?auto_977621 ?auto_977624 ) ( LIFTING ?auto_977621 ?auto_977617 ) ( not ( = ?auto_977622 ?auto_977621 ) ) ( ON ?auto_977619 ?auto_977618 ) ( not ( = ?auto_977618 ?auto_977619 ) ) ( not ( = ?auto_977618 ?auto_977620 ) ) ( not ( = ?auto_977618 ?auto_977617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977619 ?auto_977620 ?auto_977617 )
      ( MAKE-3CRATE-VERIFY ?auto_977618 ?auto_977619 ?auto_977620 ?auto_977617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977645 - SURFACE
      ?auto_977646 - SURFACE
      ?auto_977647 - SURFACE
      ?auto_977644 - SURFACE
    )
    :vars
    (
      ?auto_977650 - HOIST
      ?auto_977648 - PLACE
      ?auto_977653 - TRUCK
      ?auto_977651 - PLACE
      ?auto_977649 - HOIST
      ?auto_977652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977650 ?auto_977648 ) ( SURFACE-AT ?auto_977647 ?auto_977648 ) ( CLEAR ?auto_977647 ) ( IS-CRATE ?auto_977644 ) ( not ( = ?auto_977647 ?auto_977644 ) ) ( AVAILABLE ?auto_977650 ) ( ON ?auto_977647 ?auto_977646 ) ( not ( = ?auto_977646 ?auto_977647 ) ) ( not ( = ?auto_977646 ?auto_977644 ) ) ( TRUCK-AT ?auto_977653 ?auto_977651 ) ( not ( = ?auto_977651 ?auto_977648 ) ) ( HOIST-AT ?auto_977649 ?auto_977651 ) ( not ( = ?auto_977650 ?auto_977649 ) ) ( AVAILABLE ?auto_977649 ) ( SURFACE-AT ?auto_977644 ?auto_977651 ) ( ON ?auto_977644 ?auto_977652 ) ( CLEAR ?auto_977644 ) ( not ( = ?auto_977647 ?auto_977652 ) ) ( not ( = ?auto_977644 ?auto_977652 ) ) ( not ( = ?auto_977646 ?auto_977652 ) ) ( ON ?auto_977646 ?auto_977645 ) ( not ( = ?auto_977645 ?auto_977646 ) ) ( not ( = ?auto_977645 ?auto_977647 ) ) ( not ( = ?auto_977645 ?auto_977644 ) ) ( not ( = ?auto_977645 ?auto_977652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977646 ?auto_977647 ?auto_977644 )
      ( MAKE-3CRATE-VERIFY ?auto_977645 ?auto_977646 ?auto_977647 ?auto_977644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977673 - SURFACE
      ?auto_977674 - SURFACE
      ?auto_977675 - SURFACE
      ?auto_977672 - SURFACE
    )
    :vars
    (
      ?auto_977678 - HOIST
      ?auto_977679 - PLACE
      ?auto_977677 - PLACE
      ?auto_977681 - HOIST
      ?auto_977676 - SURFACE
      ?auto_977680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977678 ?auto_977679 ) ( SURFACE-AT ?auto_977675 ?auto_977679 ) ( CLEAR ?auto_977675 ) ( IS-CRATE ?auto_977672 ) ( not ( = ?auto_977675 ?auto_977672 ) ) ( AVAILABLE ?auto_977678 ) ( ON ?auto_977675 ?auto_977674 ) ( not ( = ?auto_977674 ?auto_977675 ) ) ( not ( = ?auto_977674 ?auto_977672 ) ) ( not ( = ?auto_977677 ?auto_977679 ) ) ( HOIST-AT ?auto_977681 ?auto_977677 ) ( not ( = ?auto_977678 ?auto_977681 ) ) ( AVAILABLE ?auto_977681 ) ( SURFACE-AT ?auto_977672 ?auto_977677 ) ( ON ?auto_977672 ?auto_977676 ) ( CLEAR ?auto_977672 ) ( not ( = ?auto_977675 ?auto_977676 ) ) ( not ( = ?auto_977672 ?auto_977676 ) ) ( not ( = ?auto_977674 ?auto_977676 ) ) ( TRUCK-AT ?auto_977680 ?auto_977679 ) ( ON ?auto_977674 ?auto_977673 ) ( not ( = ?auto_977673 ?auto_977674 ) ) ( not ( = ?auto_977673 ?auto_977675 ) ) ( not ( = ?auto_977673 ?auto_977672 ) ) ( not ( = ?auto_977673 ?auto_977676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977674 ?auto_977675 ?auto_977672 )
      ( MAKE-3CRATE-VERIFY ?auto_977673 ?auto_977674 ?auto_977675 ?auto_977672 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977701 - SURFACE
      ?auto_977702 - SURFACE
      ?auto_977703 - SURFACE
      ?auto_977700 - SURFACE
    )
    :vars
    (
      ?auto_977705 - HOIST
      ?auto_977709 - PLACE
      ?auto_977704 - PLACE
      ?auto_977706 - HOIST
      ?auto_977707 - SURFACE
      ?auto_977708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977705 ?auto_977709 ) ( IS-CRATE ?auto_977700 ) ( not ( = ?auto_977703 ?auto_977700 ) ) ( not ( = ?auto_977702 ?auto_977703 ) ) ( not ( = ?auto_977702 ?auto_977700 ) ) ( not ( = ?auto_977704 ?auto_977709 ) ) ( HOIST-AT ?auto_977706 ?auto_977704 ) ( not ( = ?auto_977705 ?auto_977706 ) ) ( AVAILABLE ?auto_977706 ) ( SURFACE-AT ?auto_977700 ?auto_977704 ) ( ON ?auto_977700 ?auto_977707 ) ( CLEAR ?auto_977700 ) ( not ( = ?auto_977703 ?auto_977707 ) ) ( not ( = ?auto_977700 ?auto_977707 ) ) ( not ( = ?auto_977702 ?auto_977707 ) ) ( TRUCK-AT ?auto_977708 ?auto_977709 ) ( SURFACE-AT ?auto_977702 ?auto_977709 ) ( CLEAR ?auto_977702 ) ( LIFTING ?auto_977705 ?auto_977703 ) ( IS-CRATE ?auto_977703 ) ( ON ?auto_977702 ?auto_977701 ) ( not ( = ?auto_977701 ?auto_977702 ) ) ( not ( = ?auto_977701 ?auto_977703 ) ) ( not ( = ?auto_977701 ?auto_977700 ) ) ( not ( = ?auto_977701 ?auto_977707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977702 ?auto_977703 ?auto_977700 )
      ( MAKE-3CRATE-VERIFY ?auto_977701 ?auto_977702 ?auto_977703 ?auto_977700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977729 - SURFACE
      ?auto_977730 - SURFACE
      ?auto_977731 - SURFACE
      ?auto_977728 - SURFACE
    )
    :vars
    (
      ?auto_977736 - HOIST
      ?auto_977735 - PLACE
      ?auto_977732 - PLACE
      ?auto_977734 - HOIST
      ?auto_977737 - SURFACE
      ?auto_977733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977736 ?auto_977735 ) ( IS-CRATE ?auto_977728 ) ( not ( = ?auto_977731 ?auto_977728 ) ) ( not ( = ?auto_977730 ?auto_977731 ) ) ( not ( = ?auto_977730 ?auto_977728 ) ) ( not ( = ?auto_977732 ?auto_977735 ) ) ( HOIST-AT ?auto_977734 ?auto_977732 ) ( not ( = ?auto_977736 ?auto_977734 ) ) ( AVAILABLE ?auto_977734 ) ( SURFACE-AT ?auto_977728 ?auto_977732 ) ( ON ?auto_977728 ?auto_977737 ) ( CLEAR ?auto_977728 ) ( not ( = ?auto_977731 ?auto_977737 ) ) ( not ( = ?auto_977728 ?auto_977737 ) ) ( not ( = ?auto_977730 ?auto_977737 ) ) ( TRUCK-AT ?auto_977733 ?auto_977735 ) ( SURFACE-AT ?auto_977730 ?auto_977735 ) ( CLEAR ?auto_977730 ) ( IS-CRATE ?auto_977731 ) ( AVAILABLE ?auto_977736 ) ( IN ?auto_977731 ?auto_977733 ) ( ON ?auto_977730 ?auto_977729 ) ( not ( = ?auto_977729 ?auto_977730 ) ) ( not ( = ?auto_977729 ?auto_977731 ) ) ( not ( = ?auto_977729 ?auto_977728 ) ) ( not ( = ?auto_977729 ?auto_977737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977730 ?auto_977731 ?auto_977728 )
      ( MAKE-3CRATE-VERIFY ?auto_977729 ?auto_977730 ?auto_977731 ?auto_977728 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978020 - SURFACE
      ?auto_978021 - SURFACE
      ?auto_978022 - SURFACE
      ?auto_978019 - SURFACE
      ?auto_978023 - SURFACE
    )
    :vars
    (
      ?auto_978025 - HOIST
      ?auto_978024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978025 ?auto_978024 ) ( SURFACE-AT ?auto_978019 ?auto_978024 ) ( CLEAR ?auto_978019 ) ( LIFTING ?auto_978025 ?auto_978023 ) ( IS-CRATE ?auto_978023 ) ( not ( = ?auto_978019 ?auto_978023 ) ) ( ON ?auto_978021 ?auto_978020 ) ( ON ?auto_978022 ?auto_978021 ) ( ON ?auto_978019 ?auto_978022 ) ( not ( = ?auto_978020 ?auto_978021 ) ) ( not ( = ?auto_978020 ?auto_978022 ) ) ( not ( = ?auto_978020 ?auto_978019 ) ) ( not ( = ?auto_978020 ?auto_978023 ) ) ( not ( = ?auto_978021 ?auto_978022 ) ) ( not ( = ?auto_978021 ?auto_978019 ) ) ( not ( = ?auto_978021 ?auto_978023 ) ) ( not ( = ?auto_978022 ?auto_978019 ) ) ( not ( = ?auto_978022 ?auto_978023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_978019 ?auto_978023 )
      ( MAKE-4CRATE-VERIFY ?auto_978020 ?auto_978021 ?auto_978022 ?auto_978019 ?auto_978023 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978045 - SURFACE
      ?auto_978046 - SURFACE
      ?auto_978047 - SURFACE
      ?auto_978044 - SURFACE
      ?auto_978048 - SURFACE
    )
    :vars
    (
      ?auto_978050 - HOIST
      ?auto_978051 - PLACE
      ?auto_978049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978050 ?auto_978051 ) ( SURFACE-AT ?auto_978044 ?auto_978051 ) ( CLEAR ?auto_978044 ) ( IS-CRATE ?auto_978048 ) ( not ( = ?auto_978044 ?auto_978048 ) ) ( TRUCK-AT ?auto_978049 ?auto_978051 ) ( AVAILABLE ?auto_978050 ) ( IN ?auto_978048 ?auto_978049 ) ( ON ?auto_978044 ?auto_978047 ) ( not ( = ?auto_978047 ?auto_978044 ) ) ( not ( = ?auto_978047 ?auto_978048 ) ) ( ON ?auto_978046 ?auto_978045 ) ( ON ?auto_978047 ?auto_978046 ) ( not ( = ?auto_978045 ?auto_978046 ) ) ( not ( = ?auto_978045 ?auto_978047 ) ) ( not ( = ?auto_978045 ?auto_978044 ) ) ( not ( = ?auto_978045 ?auto_978048 ) ) ( not ( = ?auto_978046 ?auto_978047 ) ) ( not ( = ?auto_978046 ?auto_978044 ) ) ( not ( = ?auto_978046 ?auto_978048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978047 ?auto_978044 ?auto_978048 )
      ( MAKE-4CRATE-VERIFY ?auto_978045 ?auto_978046 ?auto_978047 ?auto_978044 ?auto_978048 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978075 - SURFACE
      ?auto_978076 - SURFACE
      ?auto_978077 - SURFACE
      ?auto_978074 - SURFACE
      ?auto_978078 - SURFACE
    )
    :vars
    (
      ?auto_978081 - HOIST
      ?auto_978079 - PLACE
      ?auto_978080 - TRUCK
      ?auto_978082 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978081 ?auto_978079 ) ( SURFACE-AT ?auto_978074 ?auto_978079 ) ( CLEAR ?auto_978074 ) ( IS-CRATE ?auto_978078 ) ( not ( = ?auto_978074 ?auto_978078 ) ) ( AVAILABLE ?auto_978081 ) ( IN ?auto_978078 ?auto_978080 ) ( ON ?auto_978074 ?auto_978077 ) ( not ( = ?auto_978077 ?auto_978074 ) ) ( not ( = ?auto_978077 ?auto_978078 ) ) ( TRUCK-AT ?auto_978080 ?auto_978082 ) ( not ( = ?auto_978082 ?auto_978079 ) ) ( ON ?auto_978076 ?auto_978075 ) ( ON ?auto_978077 ?auto_978076 ) ( not ( = ?auto_978075 ?auto_978076 ) ) ( not ( = ?auto_978075 ?auto_978077 ) ) ( not ( = ?auto_978075 ?auto_978074 ) ) ( not ( = ?auto_978075 ?auto_978078 ) ) ( not ( = ?auto_978076 ?auto_978077 ) ) ( not ( = ?auto_978076 ?auto_978074 ) ) ( not ( = ?auto_978076 ?auto_978078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978077 ?auto_978074 ?auto_978078 )
      ( MAKE-4CRATE-VERIFY ?auto_978075 ?auto_978076 ?auto_978077 ?auto_978074 ?auto_978078 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978109 - SURFACE
      ?auto_978110 - SURFACE
      ?auto_978111 - SURFACE
      ?auto_978108 - SURFACE
      ?auto_978112 - SURFACE
    )
    :vars
    (
      ?auto_978114 - HOIST
      ?auto_978113 - PLACE
      ?auto_978116 - TRUCK
      ?auto_978117 - PLACE
      ?auto_978115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_978114 ?auto_978113 ) ( SURFACE-AT ?auto_978108 ?auto_978113 ) ( CLEAR ?auto_978108 ) ( IS-CRATE ?auto_978112 ) ( not ( = ?auto_978108 ?auto_978112 ) ) ( AVAILABLE ?auto_978114 ) ( ON ?auto_978108 ?auto_978111 ) ( not ( = ?auto_978111 ?auto_978108 ) ) ( not ( = ?auto_978111 ?auto_978112 ) ) ( TRUCK-AT ?auto_978116 ?auto_978117 ) ( not ( = ?auto_978117 ?auto_978113 ) ) ( HOIST-AT ?auto_978115 ?auto_978117 ) ( LIFTING ?auto_978115 ?auto_978112 ) ( not ( = ?auto_978114 ?auto_978115 ) ) ( ON ?auto_978110 ?auto_978109 ) ( ON ?auto_978111 ?auto_978110 ) ( not ( = ?auto_978109 ?auto_978110 ) ) ( not ( = ?auto_978109 ?auto_978111 ) ) ( not ( = ?auto_978109 ?auto_978108 ) ) ( not ( = ?auto_978109 ?auto_978112 ) ) ( not ( = ?auto_978110 ?auto_978111 ) ) ( not ( = ?auto_978110 ?auto_978108 ) ) ( not ( = ?auto_978110 ?auto_978112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978111 ?auto_978108 ?auto_978112 )
      ( MAKE-4CRATE-VERIFY ?auto_978109 ?auto_978110 ?auto_978111 ?auto_978108 ?auto_978112 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978147 - SURFACE
      ?auto_978148 - SURFACE
      ?auto_978149 - SURFACE
      ?auto_978146 - SURFACE
      ?auto_978150 - SURFACE
    )
    :vars
    (
      ?auto_978153 - HOIST
      ?auto_978155 - PLACE
      ?auto_978151 - TRUCK
      ?auto_978156 - PLACE
      ?auto_978154 - HOIST
      ?auto_978152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978153 ?auto_978155 ) ( SURFACE-AT ?auto_978146 ?auto_978155 ) ( CLEAR ?auto_978146 ) ( IS-CRATE ?auto_978150 ) ( not ( = ?auto_978146 ?auto_978150 ) ) ( AVAILABLE ?auto_978153 ) ( ON ?auto_978146 ?auto_978149 ) ( not ( = ?auto_978149 ?auto_978146 ) ) ( not ( = ?auto_978149 ?auto_978150 ) ) ( TRUCK-AT ?auto_978151 ?auto_978156 ) ( not ( = ?auto_978156 ?auto_978155 ) ) ( HOIST-AT ?auto_978154 ?auto_978156 ) ( not ( = ?auto_978153 ?auto_978154 ) ) ( AVAILABLE ?auto_978154 ) ( SURFACE-AT ?auto_978150 ?auto_978156 ) ( ON ?auto_978150 ?auto_978152 ) ( CLEAR ?auto_978150 ) ( not ( = ?auto_978146 ?auto_978152 ) ) ( not ( = ?auto_978150 ?auto_978152 ) ) ( not ( = ?auto_978149 ?auto_978152 ) ) ( ON ?auto_978148 ?auto_978147 ) ( ON ?auto_978149 ?auto_978148 ) ( not ( = ?auto_978147 ?auto_978148 ) ) ( not ( = ?auto_978147 ?auto_978149 ) ) ( not ( = ?auto_978147 ?auto_978146 ) ) ( not ( = ?auto_978147 ?auto_978150 ) ) ( not ( = ?auto_978147 ?auto_978152 ) ) ( not ( = ?auto_978148 ?auto_978149 ) ) ( not ( = ?auto_978148 ?auto_978146 ) ) ( not ( = ?auto_978148 ?auto_978150 ) ) ( not ( = ?auto_978148 ?auto_978152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978149 ?auto_978146 ?auto_978150 )
      ( MAKE-4CRATE-VERIFY ?auto_978147 ?auto_978148 ?auto_978149 ?auto_978146 ?auto_978150 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978186 - SURFACE
      ?auto_978187 - SURFACE
      ?auto_978188 - SURFACE
      ?auto_978185 - SURFACE
      ?auto_978189 - SURFACE
    )
    :vars
    (
      ?auto_978195 - HOIST
      ?auto_978193 - PLACE
      ?auto_978194 - PLACE
      ?auto_978191 - HOIST
      ?auto_978192 - SURFACE
      ?auto_978190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978195 ?auto_978193 ) ( SURFACE-AT ?auto_978185 ?auto_978193 ) ( CLEAR ?auto_978185 ) ( IS-CRATE ?auto_978189 ) ( not ( = ?auto_978185 ?auto_978189 ) ) ( AVAILABLE ?auto_978195 ) ( ON ?auto_978185 ?auto_978188 ) ( not ( = ?auto_978188 ?auto_978185 ) ) ( not ( = ?auto_978188 ?auto_978189 ) ) ( not ( = ?auto_978194 ?auto_978193 ) ) ( HOIST-AT ?auto_978191 ?auto_978194 ) ( not ( = ?auto_978195 ?auto_978191 ) ) ( AVAILABLE ?auto_978191 ) ( SURFACE-AT ?auto_978189 ?auto_978194 ) ( ON ?auto_978189 ?auto_978192 ) ( CLEAR ?auto_978189 ) ( not ( = ?auto_978185 ?auto_978192 ) ) ( not ( = ?auto_978189 ?auto_978192 ) ) ( not ( = ?auto_978188 ?auto_978192 ) ) ( TRUCK-AT ?auto_978190 ?auto_978193 ) ( ON ?auto_978187 ?auto_978186 ) ( ON ?auto_978188 ?auto_978187 ) ( not ( = ?auto_978186 ?auto_978187 ) ) ( not ( = ?auto_978186 ?auto_978188 ) ) ( not ( = ?auto_978186 ?auto_978185 ) ) ( not ( = ?auto_978186 ?auto_978189 ) ) ( not ( = ?auto_978186 ?auto_978192 ) ) ( not ( = ?auto_978187 ?auto_978188 ) ) ( not ( = ?auto_978187 ?auto_978185 ) ) ( not ( = ?auto_978187 ?auto_978189 ) ) ( not ( = ?auto_978187 ?auto_978192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978188 ?auto_978185 ?auto_978189 )
      ( MAKE-4CRATE-VERIFY ?auto_978186 ?auto_978187 ?auto_978188 ?auto_978185 ?auto_978189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978225 - SURFACE
      ?auto_978226 - SURFACE
      ?auto_978227 - SURFACE
      ?auto_978224 - SURFACE
      ?auto_978228 - SURFACE
    )
    :vars
    (
      ?auto_978229 - HOIST
      ?auto_978234 - PLACE
      ?auto_978230 - PLACE
      ?auto_978231 - HOIST
      ?auto_978233 - SURFACE
      ?auto_978232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978229 ?auto_978234 ) ( IS-CRATE ?auto_978228 ) ( not ( = ?auto_978224 ?auto_978228 ) ) ( not ( = ?auto_978227 ?auto_978224 ) ) ( not ( = ?auto_978227 ?auto_978228 ) ) ( not ( = ?auto_978230 ?auto_978234 ) ) ( HOIST-AT ?auto_978231 ?auto_978230 ) ( not ( = ?auto_978229 ?auto_978231 ) ) ( AVAILABLE ?auto_978231 ) ( SURFACE-AT ?auto_978228 ?auto_978230 ) ( ON ?auto_978228 ?auto_978233 ) ( CLEAR ?auto_978228 ) ( not ( = ?auto_978224 ?auto_978233 ) ) ( not ( = ?auto_978228 ?auto_978233 ) ) ( not ( = ?auto_978227 ?auto_978233 ) ) ( TRUCK-AT ?auto_978232 ?auto_978234 ) ( SURFACE-AT ?auto_978227 ?auto_978234 ) ( CLEAR ?auto_978227 ) ( LIFTING ?auto_978229 ?auto_978224 ) ( IS-CRATE ?auto_978224 ) ( ON ?auto_978226 ?auto_978225 ) ( ON ?auto_978227 ?auto_978226 ) ( not ( = ?auto_978225 ?auto_978226 ) ) ( not ( = ?auto_978225 ?auto_978227 ) ) ( not ( = ?auto_978225 ?auto_978224 ) ) ( not ( = ?auto_978225 ?auto_978228 ) ) ( not ( = ?auto_978225 ?auto_978233 ) ) ( not ( = ?auto_978226 ?auto_978227 ) ) ( not ( = ?auto_978226 ?auto_978224 ) ) ( not ( = ?auto_978226 ?auto_978228 ) ) ( not ( = ?auto_978226 ?auto_978233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978227 ?auto_978224 ?auto_978228 )
      ( MAKE-4CRATE-VERIFY ?auto_978225 ?auto_978226 ?auto_978227 ?auto_978224 ?auto_978228 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978264 - SURFACE
      ?auto_978265 - SURFACE
      ?auto_978266 - SURFACE
      ?auto_978263 - SURFACE
      ?auto_978267 - SURFACE
    )
    :vars
    (
      ?auto_978270 - HOIST
      ?auto_978273 - PLACE
      ?auto_978269 - PLACE
      ?auto_978272 - HOIST
      ?auto_978271 - SURFACE
      ?auto_978268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978270 ?auto_978273 ) ( IS-CRATE ?auto_978267 ) ( not ( = ?auto_978263 ?auto_978267 ) ) ( not ( = ?auto_978266 ?auto_978263 ) ) ( not ( = ?auto_978266 ?auto_978267 ) ) ( not ( = ?auto_978269 ?auto_978273 ) ) ( HOIST-AT ?auto_978272 ?auto_978269 ) ( not ( = ?auto_978270 ?auto_978272 ) ) ( AVAILABLE ?auto_978272 ) ( SURFACE-AT ?auto_978267 ?auto_978269 ) ( ON ?auto_978267 ?auto_978271 ) ( CLEAR ?auto_978267 ) ( not ( = ?auto_978263 ?auto_978271 ) ) ( not ( = ?auto_978267 ?auto_978271 ) ) ( not ( = ?auto_978266 ?auto_978271 ) ) ( TRUCK-AT ?auto_978268 ?auto_978273 ) ( SURFACE-AT ?auto_978266 ?auto_978273 ) ( CLEAR ?auto_978266 ) ( IS-CRATE ?auto_978263 ) ( AVAILABLE ?auto_978270 ) ( IN ?auto_978263 ?auto_978268 ) ( ON ?auto_978265 ?auto_978264 ) ( ON ?auto_978266 ?auto_978265 ) ( not ( = ?auto_978264 ?auto_978265 ) ) ( not ( = ?auto_978264 ?auto_978266 ) ) ( not ( = ?auto_978264 ?auto_978263 ) ) ( not ( = ?auto_978264 ?auto_978267 ) ) ( not ( = ?auto_978264 ?auto_978271 ) ) ( not ( = ?auto_978265 ?auto_978266 ) ) ( not ( = ?auto_978265 ?auto_978263 ) ) ( not ( = ?auto_978265 ?auto_978267 ) ) ( not ( = ?auto_978265 ?auto_978271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978266 ?auto_978263 ?auto_978267 )
      ( MAKE-4CRATE-VERIFY ?auto_978264 ?auto_978265 ?auto_978266 ?auto_978263 ?auto_978267 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978924 - SURFACE
      ?auto_978925 - SURFACE
      ?auto_978926 - SURFACE
      ?auto_978923 - SURFACE
      ?auto_978927 - SURFACE
      ?auto_978928 - SURFACE
    )
    :vars
    (
      ?auto_978930 - HOIST
      ?auto_978929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978930 ?auto_978929 ) ( SURFACE-AT ?auto_978927 ?auto_978929 ) ( CLEAR ?auto_978927 ) ( LIFTING ?auto_978930 ?auto_978928 ) ( IS-CRATE ?auto_978928 ) ( not ( = ?auto_978927 ?auto_978928 ) ) ( ON ?auto_978925 ?auto_978924 ) ( ON ?auto_978926 ?auto_978925 ) ( ON ?auto_978923 ?auto_978926 ) ( ON ?auto_978927 ?auto_978923 ) ( not ( = ?auto_978924 ?auto_978925 ) ) ( not ( = ?auto_978924 ?auto_978926 ) ) ( not ( = ?auto_978924 ?auto_978923 ) ) ( not ( = ?auto_978924 ?auto_978927 ) ) ( not ( = ?auto_978924 ?auto_978928 ) ) ( not ( = ?auto_978925 ?auto_978926 ) ) ( not ( = ?auto_978925 ?auto_978923 ) ) ( not ( = ?auto_978925 ?auto_978927 ) ) ( not ( = ?auto_978925 ?auto_978928 ) ) ( not ( = ?auto_978926 ?auto_978923 ) ) ( not ( = ?auto_978926 ?auto_978927 ) ) ( not ( = ?auto_978926 ?auto_978928 ) ) ( not ( = ?auto_978923 ?auto_978927 ) ) ( not ( = ?auto_978923 ?auto_978928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_978927 ?auto_978928 )
      ( MAKE-5CRATE-VERIFY ?auto_978924 ?auto_978925 ?auto_978926 ?auto_978923 ?auto_978927 ?auto_978928 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978958 - SURFACE
      ?auto_978959 - SURFACE
      ?auto_978960 - SURFACE
      ?auto_978957 - SURFACE
      ?auto_978961 - SURFACE
      ?auto_978962 - SURFACE
    )
    :vars
    (
      ?auto_978963 - HOIST
      ?auto_978964 - PLACE
      ?auto_978965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978963 ?auto_978964 ) ( SURFACE-AT ?auto_978961 ?auto_978964 ) ( CLEAR ?auto_978961 ) ( IS-CRATE ?auto_978962 ) ( not ( = ?auto_978961 ?auto_978962 ) ) ( TRUCK-AT ?auto_978965 ?auto_978964 ) ( AVAILABLE ?auto_978963 ) ( IN ?auto_978962 ?auto_978965 ) ( ON ?auto_978961 ?auto_978957 ) ( not ( = ?auto_978957 ?auto_978961 ) ) ( not ( = ?auto_978957 ?auto_978962 ) ) ( ON ?auto_978959 ?auto_978958 ) ( ON ?auto_978960 ?auto_978959 ) ( ON ?auto_978957 ?auto_978960 ) ( not ( = ?auto_978958 ?auto_978959 ) ) ( not ( = ?auto_978958 ?auto_978960 ) ) ( not ( = ?auto_978958 ?auto_978957 ) ) ( not ( = ?auto_978958 ?auto_978961 ) ) ( not ( = ?auto_978958 ?auto_978962 ) ) ( not ( = ?auto_978959 ?auto_978960 ) ) ( not ( = ?auto_978959 ?auto_978957 ) ) ( not ( = ?auto_978959 ?auto_978961 ) ) ( not ( = ?auto_978959 ?auto_978962 ) ) ( not ( = ?auto_978960 ?auto_978957 ) ) ( not ( = ?auto_978960 ?auto_978961 ) ) ( not ( = ?auto_978960 ?auto_978962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978957 ?auto_978961 ?auto_978962 )
      ( MAKE-5CRATE-VERIFY ?auto_978958 ?auto_978959 ?auto_978960 ?auto_978957 ?auto_978961 ?auto_978962 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978998 - SURFACE
      ?auto_978999 - SURFACE
      ?auto_979000 - SURFACE
      ?auto_978997 - SURFACE
      ?auto_979001 - SURFACE
      ?auto_979002 - SURFACE
    )
    :vars
    (
      ?auto_979003 - HOIST
      ?auto_979006 - PLACE
      ?auto_979005 - TRUCK
      ?auto_979004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_979003 ?auto_979006 ) ( SURFACE-AT ?auto_979001 ?auto_979006 ) ( CLEAR ?auto_979001 ) ( IS-CRATE ?auto_979002 ) ( not ( = ?auto_979001 ?auto_979002 ) ) ( AVAILABLE ?auto_979003 ) ( IN ?auto_979002 ?auto_979005 ) ( ON ?auto_979001 ?auto_978997 ) ( not ( = ?auto_978997 ?auto_979001 ) ) ( not ( = ?auto_978997 ?auto_979002 ) ) ( TRUCK-AT ?auto_979005 ?auto_979004 ) ( not ( = ?auto_979004 ?auto_979006 ) ) ( ON ?auto_978999 ?auto_978998 ) ( ON ?auto_979000 ?auto_978999 ) ( ON ?auto_978997 ?auto_979000 ) ( not ( = ?auto_978998 ?auto_978999 ) ) ( not ( = ?auto_978998 ?auto_979000 ) ) ( not ( = ?auto_978998 ?auto_978997 ) ) ( not ( = ?auto_978998 ?auto_979001 ) ) ( not ( = ?auto_978998 ?auto_979002 ) ) ( not ( = ?auto_978999 ?auto_979000 ) ) ( not ( = ?auto_978999 ?auto_978997 ) ) ( not ( = ?auto_978999 ?auto_979001 ) ) ( not ( = ?auto_978999 ?auto_979002 ) ) ( not ( = ?auto_979000 ?auto_978997 ) ) ( not ( = ?auto_979000 ?auto_979001 ) ) ( not ( = ?auto_979000 ?auto_979002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978997 ?auto_979001 ?auto_979002 )
      ( MAKE-5CRATE-VERIFY ?auto_978998 ?auto_978999 ?auto_979000 ?auto_978997 ?auto_979001 ?auto_979002 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979043 - SURFACE
      ?auto_979044 - SURFACE
      ?auto_979045 - SURFACE
      ?auto_979042 - SURFACE
      ?auto_979046 - SURFACE
      ?auto_979047 - SURFACE
    )
    :vars
    (
      ?auto_979050 - HOIST
      ?auto_979048 - PLACE
      ?auto_979051 - TRUCK
      ?auto_979052 - PLACE
      ?auto_979049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_979050 ?auto_979048 ) ( SURFACE-AT ?auto_979046 ?auto_979048 ) ( CLEAR ?auto_979046 ) ( IS-CRATE ?auto_979047 ) ( not ( = ?auto_979046 ?auto_979047 ) ) ( AVAILABLE ?auto_979050 ) ( ON ?auto_979046 ?auto_979042 ) ( not ( = ?auto_979042 ?auto_979046 ) ) ( not ( = ?auto_979042 ?auto_979047 ) ) ( TRUCK-AT ?auto_979051 ?auto_979052 ) ( not ( = ?auto_979052 ?auto_979048 ) ) ( HOIST-AT ?auto_979049 ?auto_979052 ) ( LIFTING ?auto_979049 ?auto_979047 ) ( not ( = ?auto_979050 ?auto_979049 ) ) ( ON ?auto_979044 ?auto_979043 ) ( ON ?auto_979045 ?auto_979044 ) ( ON ?auto_979042 ?auto_979045 ) ( not ( = ?auto_979043 ?auto_979044 ) ) ( not ( = ?auto_979043 ?auto_979045 ) ) ( not ( = ?auto_979043 ?auto_979042 ) ) ( not ( = ?auto_979043 ?auto_979046 ) ) ( not ( = ?auto_979043 ?auto_979047 ) ) ( not ( = ?auto_979044 ?auto_979045 ) ) ( not ( = ?auto_979044 ?auto_979042 ) ) ( not ( = ?auto_979044 ?auto_979046 ) ) ( not ( = ?auto_979044 ?auto_979047 ) ) ( not ( = ?auto_979045 ?auto_979042 ) ) ( not ( = ?auto_979045 ?auto_979046 ) ) ( not ( = ?auto_979045 ?auto_979047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979042 ?auto_979046 ?auto_979047 )
      ( MAKE-5CRATE-VERIFY ?auto_979043 ?auto_979044 ?auto_979045 ?auto_979042 ?auto_979046 ?auto_979047 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979093 - SURFACE
      ?auto_979094 - SURFACE
      ?auto_979095 - SURFACE
      ?auto_979092 - SURFACE
      ?auto_979096 - SURFACE
      ?auto_979097 - SURFACE
    )
    :vars
    (
      ?auto_979099 - HOIST
      ?auto_979101 - PLACE
      ?auto_979102 - TRUCK
      ?auto_979103 - PLACE
      ?auto_979100 - HOIST
      ?auto_979098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_979099 ?auto_979101 ) ( SURFACE-AT ?auto_979096 ?auto_979101 ) ( CLEAR ?auto_979096 ) ( IS-CRATE ?auto_979097 ) ( not ( = ?auto_979096 ?auto_979097 ) ) ( AVAILABLE ?auto_979099 ) ( ON ?auto_979096 ?auto_979092 ) ( not ( = ?auto_979092 ?auto_979096 ) ) ( not ( = ?auto_979092 ?auto_979097 ) ) ( TRUCK-AT ?auto_979102 ?auto_979103 ) ( not ( = ?auto_979103 ?auto_979101 ) ) ( HOIST-AT ?auto_979100 ?auto_979103 ) ( not ( = ?auto_979099 ?auto_979100 ) ) ( AVAILABLE ?auto_979100 ) ( SURFACE-AT ?auto_979097 ?auto_979103 ) ( ON ?auto_979097 ?auto_979098 ) ( CLEAR ?auto_979097 ) ( not ( = ?auto_979096 ?auto_979098 ) ) ( not ( = ?auto_979097 ?auto_979098 ) ) ( not ( = ?auto_979092 ?auto_979098 ) ) ( ON ?auto_979094 ?auto_979093 ) ( ON ?auto_979095 ?auto_979094 ) ( ON ?auto_979092 ?auto_979095 ) ( not ( = ?auto_979093 ?auto_979094 ) ) ( not ( = ?auto_979093 ?auto_979095 ) ) ( not ( = ?auto_979093 ?auto_979092 ) ) ( not ( = ?auto_979093 ?auto_979096 ) ) ( not ( = ?auto_979093 ?auto_979097 ) ) ( not ( = ?auto_979093 ?auto_979098 ) ) ( not ( = ?auto_979094 ?auto_979095 ) ) ( not ( = ?auto_979094 ?auto_979092 ) ) ( not ( = ?auto_979094 ?auto_979096 ) ) ( not ( = ?auto_979094 ?auto_979097 ) ) ( not ( = ?auto_979094 ?auto_979098 ) ) ( not ( = ?auto_979095 ?auto_979092 ) ) ( not ( = ?auto_979095 ?auto_979096 ) ) ( not ( = ?auto_979095 ?auto_979097 ) ) ( not ( = ?auto_979095 ?auto_979098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979092 ?auto_979096 ?auto_979097 )
      ( MAKE-5CRATE-VERIFY ?auto_979093 ?auto_979094 ?auto_979095 ?auto_979092 ?auto_979096 ?auto_979097 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979144 - SURFACE
      ?auto_979145 - SURFACE
      ?auto_979146 - SURFACE
      ?auto_979143 - SURFACE
      ?auto_979147 - SURFACE
      ?auto_979148 - SURFACE
    )
    :vars
    (
      ?auto_979150 - HOIST
      ?auto_979151 - PLACE
      ?auto_979149 - PLACE
      ?auto_979152 - HOIST
      ?auto_979153 - SURFACE
      ?auto_979154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979150 ?auto_979151 ) ( SURFACE-AT ?auto_979147 ?auto_979151 ) ( CLEAR ?auto_979147 ) ( IS-CRATE ?auto_979148 ) ( not ( = ?auto_979147 ?auto_979148 ) ) ( AVAILABLE ?auto_979150 ) ( ON ?auto_979147 ?auto_979143 ) ( not ( = ?auto_979143 ?auto_979147 ) ) ( not ( = ?auto_979143 ?auto_979148 ) ) ( not ( = ?auto_979149 ?auto_979151 ) ) ( HOIST-AT ?auto_979152 ?auto_979149 ) ( not ( = ?auto_979150 ?auto_979152 ) ) ( AVAILABLE ?auto_979152 ) ( SURFACE-AT ?auto_979148 ?auto_979149 ) ( ON ?auto_979148 ?auto_979153 ) ( CLEAR ?auto_979148 ) ( not ( = ?auto_979147 ?auto_979153 ) ) ( not ( = ?auto_979148 ?auto_979153 ) ) ( not ( = ?auto_979143 ?auto_979153 ) ) ( TRUCK-AT ?auto_979154 ?auto_979151 ) ( ON ?auto_979145 ?auto_979144 ) ( ON ?auto_979146 ?auto_979145 ) ( ON ?auto_979143 ?auto_979146 ) ( not ( = ?auto_979144 ?auto_979145 ) ) ( not ( = ?auto_979144 ?auto_979146 ) ) ( not ( = ?auto_979144 ?auto_979143 ) ) ( not ( = ?auto_979144 ?auto_979147 ) ) ( not ( = ?auto_979144 ?auto_979148 ) ) ( not ( = ?auto_979144 ?auto_979153 ) ) ( not ( = ?auto_979145 ?auto_979146 ) ) ( not ( = ?auto_979145 ?auto_979143 ) ) ( not ( = ?auto_979145 ?auto_979147 ) ) ( not ( = ?auto_979145 ?auto_979148 ) ) ( not ( = ?auto_979145 ?auto_979153 ) ) ( not ( = ?auto_979146 ?auto_979143 ) ) ( not ( = ?auto_979146 ?auto_979147 ) ) ( not ( = ?auto_979146 ?auto_979148 ) ) ( not ( = ?auto_979146 ?auto_979153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979143 ?auto_979147 ?auto_979148 )
      ( MAKE-5CRATE-VERIFY ?auto_979144 ?auto_979145 ?auto_979146 ?auto_979143 ?auto_979147 ?auto_979148 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979195 - SURFACE
      ?auto_979196 - SURFACE
      ?auto_979197 - SURFACE
      ?auto_979194 - SURFACE
      ?auto_979198 - SURFACE
      ?auto_979199 - SURFACE
    )
    :vars
    (
      ?auto_979204 - HOIST
      ?auto_979202 - PLACE
      ?auto_979205 - PLACE
      ?auto_979200 - HOIST
      ?auto_979203 - SURFACE
      ?auto_979201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979204 ?auto_979202 ) ( IS-CRATE ?auto_979199 ) ( not ( = ?auto_979198 ?auto_979199 ) ) ( not ( = ?auto_979194 ?auto_979198 ) ) ( not ( = ?auto_979194 ?auto_979199 ) ) ( not ( = ?auto_979205 ?auto_979202 ) ) ( HOIST-AT ?auto_979200 ?auto_979205 ) ( not ( = ?auto_979204 ?auto_979200 ) ) ( AVAILABLE ?auto_979200 ) ( SURFACE-AT ?auto_979199 ?auto_979205 ) ( ON ?auto_979199 ?auto_979203 ) ( CLEAR ?auto_979199 ) ( not ( = ?auto_979198 ?auto_979203 ) ) ( not ( = ?auto_979199 ?auto_979203 ) ) ( not ( = ?auto_979194 ?auto_979203 ) ) ( TRUCK-AT ?auto_979201 ?auto_979202 ) ( SURFACE-AT ?auto_979194 ?auto_979202 ) ( CLEAR ?auto_979194 ) ( LIFTING ?auto_979204 ?auto_979198 ) ( IS-CRATE ?auto_979198 ) ( ON ?auto_979196 ?auto_979195 ) ( ON ?auto_979197 ?auto_979196 ) ( ON ?auto_979194 ?auto_979197 ) ( not ( = ?auto_979195 ?auto_979196 ) ) ( not ( = ?auto_979195 ?auto_979197 ) ) ( not ( = ?auto_979195 ?auto_979194 ) ) ( not ( = ?auto_979195 ?auto_979198 ) ) ( not ( = ?auto_979195 ?auto_979199 ) ) ( not ( = ?auto_979195 ?auto_979203 ) ) ( not ( = ?auto_979196 ?auto_979197 ) ) ( not ( = ?auto_979196 ?auto_979194 ) ) ( not ( = ?auto_979196 ?auto_979198 ) ) ( not ( = ?auto_979196 ?auto_979199 ) ) ( not ( = ?auto_979196 ?auto_979203 ) ) ( not ( = ?auto_979197 ?auto_979194 ) ) ( not ( = ?auto_979197 ?auto_979198 ) ) ( not ( = ?auto_979197 ?auto_979199 ) ) ( not ( = ?auto_979197 ?auto_979203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979194 ?auto_979198 ?auto_979199 )
      ( MAKE-5CRATE-VERIFY ?auto_979195 ?auto_979196 ?auto_979197 ?auto_979194 ?auto_979198 ?auto_979199 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979246 - SURFACE
      ?auto_979247 - SURFACE
      ?auto_979248 - SURFACE
      ?auto_979245 - SURFACE
      ?auto_979249 - SURFACE
      ?auto_979250 - SURFACE
    )
    :vars
    (
      ?auto_979254 - HOIST
      ?auto_979255 - PLACE
      ?auto_979256 - PLACE
      ?auto_979252 - HOIST
      ?auto_979253 - SURFACE
      ?auto_979251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979254 ?auto_979255 ) ( IS-CRATE ?auto_979250 ) ( not ( = ?auto_979249 ?auto_979250 ) ) ( not ( = ?auto_979245 ?auto_979249 ) ) ( not ( = ?auto_979245 ?auto_979250 ) ) ( not ( = ?auto_979256 ?auto_979255 ) ) ( HOIST-AT ?auto_979252 ?auto_979256 ) ( not ( = ?auto_979254 ?auto_979252 ) ) ( AVAILABLE ?auto_979252 ) ( SURFACE-AT ?auto_979250 ?auto_979256 ) ( ON ?auto_979250 ?auto_979253 ) ( CLEAR ?auto_979250 ) ( not ( = ?auto_979249 ?auto_979253 ) ) ( not ( = ?auto_979250 ?auto_979253 ) ) ( not ( = ?auto_979245 ?auto_979253 ) ) ( TRUCK-AT ?auto_979251 ?auto_979255 ) ( SURFACE-AT ?auto_979245 ?auto_979255 ) ( CLEAR ?auto_979245 ) ( IS-CRATE ?auto_979249 ) ( AVAILABLE ?auto_979254 ) ( IN ?auto_979249 ?auto_979251 ) ( ON ?auto_979247 ?auto_979246 ) ( ON ?auto_979248 ?auto_979247 ) ( ON ?auto_979245 ?auto_979248 ) ( not ( = ?auto_979246 ?auto_979247 ) ) ( not ( = ?auto_979246 ?auto_979248 ) ) ( not ( = ?auto_979246 ?auto_979245 ) ) ( not ( = ?auto_979246 ?auto_979249 ) ) ( not ( = ?auto_979246 ?auto_979250 ) ) ( not ( = ?auto_979246 ?auto_979253 ) ) ( not ( = ?auto_979247 ?auto_979248 ) ) ( not ( = ?auto_979247 ?auto_979245 ) ) ( not ( = ?auto_979247 ?auto_979249 ) ) ( not ( = ?auto_979247 ?auto_979250 ) ) ( not ( = ?auto_979247 ?auto_979253 ) ) ( not ( = ?auto_979248 ?auto_979245 ) ) ( not ( = ?auto_979248 ?auto_979249 ) ) ( not ( = ?auto_979248 ?auto_979250 ) ) ( not ( = ?auto_979248 ?auto_979253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979245 ?auto_979249 ?auto_979250 )
      ( MAKE-5CRATE-VERIFY ?auto_979246 ?auto_979247 ?auto_979248 ?auto_979245 ?auto_979249 ?auto_979250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_980237 - SURFACE
      ?auto_980238 - SURFACE
    )
    :vars
    (
      ?auto_980242 - HOIST
      ?auto_980245 - PLACE
      ?auto_980240 - SURFACE
      ?auto_980241 - TRUCK
      ?auto_980244 - PLACE
      ?auto_980239 - HOIST
      ?auto_980243 - SURFACE
      ?auto_980246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980242 ?auto_980245 ) ( SURFACE-AT ?auto_980237 ?auto_980245 ) ( CLEAR ?auto_980237 ) ( IS-CRATE ?auto_980238 ) ( not ( = ?auto_980237 ?auto_980238 ) ) ( AVAILABLE ?auto_980242 ) ( ON ?auto_980237 ?auto_980240 ) ( not ( = ?auto_980240 ?auto_980237 ) ) ( not ( = ?auto_980240 ?auto_980238 ) ) ( TRUCK-AT ?auto_980241 ?auto_980244 ) ( not ( = ?auto_980244 ?auto_980245 ) ) ( HOIST-AT ?auto_980239 ?auto_980244 ) ( not ( = ?auto_980242 ?auto_980239 ) ) ( SURFACE-AT ?auto_980238 ?auto_980244 ) ( ON ?auto_980238 ?auto_980243 ) ( CLEAR ?auto_980238 ) ( not ( = ?auto_980237 ?auto_980243 ) ) ( not ( = ?auto_980238 ?auto_980243 ) ) ( not ( = ?auto_980240 ?auto_980243 ) ) ( LIFTING ?auto_980239 ?auto_980246 ) ( IS-CRATE ?auto_980246 ) ( not ( = ?auto_980237 ?auto_980246 ) ) ( not ( = ?auto_980238 ?auto_980246 ) ) ( not ( = ?auto_980240 ?auto_980246 ) ) ( not ( = ?auto_980243 ?auto_980246 ) ) )
    :subtasks
    ( ( !LOAD ?auto_980239 ?auto_980246 ?auto_980241 ?auto_980244 )
      ( MAKE-1CRATE ?auto_980237 ?auto_980238 )
      ( MAKE-1CRATE-VERIFY ?auto_980237 ?auto_980238 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980453 - SURFACE
      ?auto_980454 - SURFACE
      ?auto_980455 - SURFACE
      ?auto_980452 - SURFACE
      ?auto_980456 - SURFACE
      ?auto_980458 - SURFACE
      ?auto_980457 - SURFACE
    )
    :vars
    (
      ?auto_980459 - HOIST
      ?auto_980460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980459 ?auto_980460 ) ( SURFACE-AT ?auto_980458 ?auto_980460 ) ( CLEAR ?auto_980458 ) ( LIFTING ?auto_980459 ?auto_980457 ) ( IS-CRATE ?auto_980457 ) ( not ( = ?auto_980458 ?auto_980457 ) ) ( ON ?auto_980454 ?auto_980453 ) ( ON ?auto_980455 ?auto_980454 ) ( ON ?auto_980452 ?auto_980455 ) ( ON ?auto_980456 ?auto_980452 ) ( ON ?auto_980458 ?auto_980456 ) ( not ( = ?auto_980453 ?auto_980454 ) ) ( not ( = ?auto_980453 ?auto_980455 ) ) ( not ( = ?auto_980453 ?auto_980452 ) ) ( not ( = ?auto_980453 ?auto_980456 ) ) ( not ( = ?auto_980453 ?auto_980458 ) ) ( not ( = ?auto_980453 ?auto_980457 ) ) ( not ( = ?auto_980454 ?auto_980455 ) ) ( not ( = ?auto_980454 ?auto_980452 ) ) ( not ( = ?auto_980454 ?auto_980456 ) ) ( not ( = ?auto_980454 ?auto_980458 ) ) ( not ( = ?auto_980454 ?auto_980457 ) ) ( not ( = ?auto_980455 ?auto_980452 ) ) ( not ( = ?auto_980455 ?auto_980456 ) ) ( not ( = ?auto_980455 ?auto_980458 ) ) ( not ( = ?auto_980455 ?auto_980457 ) ) ( not ( = ?auto_980452 ?auto_980456 ) ) ( not ( = ?auto_980452 ?auto_980458 ) ) ( not ( = ?auto_980452 ?auto_980457 ) ) ( not ( = ?auto_980456 ?auto_980458 ) ) ( not ( = ?auto_980456 ?auto_980457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_980458 ?auto_980457 )
      ( MAKE-6CRATE-VERIFY ?auto_980453 ?auto_980454 ?auto_980455 ?auto_980452 ?auto_980456 ?auto_980458 ?auto_980457 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980497 - SURFACE
      ?auto_980498 - SURFACE
      ?auto_980499 - SURFACE
      ?auto_980496 - SURFACE
      ?auto_980500 - SURFACE
      ?auto_980502 - SURFACE
      ?auto_980501 - SURFACE
    )
    :vars
    (
      ?auto_980504 - HOIST
      ?auto_980503 - PLACE
      ?auto_980505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980504 ?auto_980503 ) ( SURFACE-AT ?auto_980502 ?auto_980503 ) ( CLEAR ?auto_980502 ) ( IS-CRATE ?auto_980501 ) ( not ( = ?auto_980502 ?auto_980501 ) ) ( TRUCK-AT ?auto_980505 ?auto_980503 ) ( AVAILABLE ?auto_980504 ) ( IN ?auto_980501 ?auto_980505 ) ( ON ?auto_980502 ?auto_980500 ) ( not ( = ?auto_980500 ?auto_980502 ) ) ( not ( = ?auto_980500 ?auto_980501 ) ) ( ON ?auto_980498 ?auto_980497 ) ( ON ?auto_980499 ?auto_980498 ) ( ON ?auto_980496 ?auto_980499 ) ( ON ?auto_980500 ?auto_980496 ) ( not ( = ?auto_980497 ?auto_980498 ) ) ( not ( = ?auto_980497 ?auto_980499 ) ) ( not ( = ?auto_980497 ?auto_980496 ) ) ( not ( = ?auto_980497 ?auto_980500 ) ) ( not ( = ?auto_980497 ?auto_980502 ) ) ( not ( = ?auto_980497 ?auto_980501 ) ) ( not ( = ?auto_980498 ?auto_980499 ) ) ( not ( = ?auto_980498 ?auto_980496 ) ) ( not ( = ?auto_980498 ?auto_980500 ) ) ( not ( = ?auto_980498 ?auto_980502 ) ) ( not ( = ?auto_980498 ?auto_980501 ) ) ( not ( = ?auto_980499 ?auto_980496 ) ) ( not ( = ?auto_980499 ?auto_980500 ) ) ( not ( = ?auto_980499 ?auto_980502 ) ) ( not ( = ?auto_980499 ?auto_980501 ) ) ( not ( = ?auto_980496 ?auto_980500 ) ) ( not ( = ?auto_980496 ?auto_980502 ) ) ( not ( = ?auto_980496 ?auto_980501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980500 ?auto_980502 ?auto_980501 )
      ( MAKE-6CRATE-VERIFY ?auto_980497 ?auto_980498 ?auto_980499 ?auto_980496 ?auto_980500 ?auto_980502 ?auto_980501 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980548 - SURFACE
      ?auto_980549 - SURFACE
      ?auto_980550 - SURFACE
      ?auto_980547 - SURFACE
      ?auto_980551 - SURFACE
      ?auto_980553 - SURFACE
      ?auto_980552 - SURFACE
    )
    :vars
    (
      ?auto_980555 - HOIST
      ?auto_980556 - PLACE
      ?auto_980557 - TRUCK
      ?auto_980554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980555 ?auto_980556 ) ( SURFACE-AT ?auto_980553 ?auto_980556 ) ( CLEAR ?auto_980553 ) ( IS-CRATE ?auto_980552 ) ( not ( = ?auto_980553 ?auto_980552 ) ) ( AVAILABLE ?auto_980555 ) ( IN ?auto_980552 ?auto_980557 ) ( ON ?auto_980553 ?auto_980551 ) ( not ( = ?auto_980551 ?auto_980553 ) ) ( not ( = ?auto_980551 ?auto_980552 ) ) ( TRUCK-AT ?auto_980557 ?auto_980554 ) ( not ( = ?auto_980554 ?auto_980556 ) ) ( ON ?auto_980549 ?auto_980548 ) ( ON ?auto_980550 ?auto_980549 ) ( ON ?auto_980547 ?auto_980550 ) ( ON ?auto_980551 ?auto_980547 ) ( not ( = ?auto_980548 ?auto_980549 ) ) ( not ( = ?auto_980548 ?auto_980550 ) ) ( not ( = ?auto_980548 ?auto_980547 ) ) ( not ( = ?auto_980548 ?auto_980551 ) ) ( not ( = ?auto_980548 ?auto_980553 ) ) ( not ( = ?auto_980548 ?auto_980552 ) ) ( not ( = ?auto_980549 ?auto_980550 ) ) ( not ( = ?auto_980549 ?auto_980547 ) ) ( not ( = ?auto_980549 ?auto_980551 ) ) ( not ( = ?auto_980549 ?auto_980553 ) ) ( not ( = ?auto_980549 ?auto_980552 ) ) ( not ( = ?auto_980550 ?auto_980547 ) ) ( not ( = ?auto_980550 ?auto_980551 ) ) ( not ( = ?auto_980550 ?auto_980553 ) ) ( not ( = ?auto_980550 ?auto_980552 ) ) ( not ( = ?auto_980547 ?auto_980551 ) ) ( not ( = ?auto_980547 ?auto_980553 ) ) ( not ( = ?auto_980547 ?auto_980552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980551 ?auto_980553 ?auto_980552 )
      ( MAKE-6CRATE-VERIFY ?auto_980548 ?auto_980549 ?auto_980550 ?auto_980547 ?auto_980551 ?auto_980553 ?auto_980552 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980605 - SURFACE
      ?auto_980606 - SURFACE
      ?auto_980607 - SURFACE
      ?auto_980604 - SURFACE
      ?auto_980608 - SURFACE
      ?auto_980610 - SURFACE
      ?auto_980609 - SURFACE
    )
    :vars
    (
      ?auto_980612 - HOIST
      ?auto_980611 - PLACE
      ?auto_980613 - TRUCK
      ?auto_980615 - PLACE
      ?auto_980614 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_980612 ?auto_980611 ) ( SURFACE-AT ?auto_980610 ?auto_980611 ) ( CLEAR ?auto_980610 ) ( IS-CRATE ?auto_980609 ) ( not ( = ?auto_980610 ?auto_980609 ) ) ( AVAILABLE ?auto_980612 ) ( ON ?auto_980610 ?auto_980608 ) ( not ( = ?auto_980608 ?auto_980610 ) ) ( not ( = ?auto_980608 ?auto_980609 ) ) ( TRUCK-AT ?auto_980613 ?auto_980615 ) ( not ( = ?auto_980615 ?auto_980611 ) ) ( HOIST-AT ?auto_980614 ?auto_980615 ) ( LIFTING ?auto_980614 ?auto_980609 ) ( not ( = ?auto_980612 ?auto_980614 ) ) ( ON ?auto_980606 ?auto_980605 ) ( ON ?auto_980607 ?auto_980606 ) ( ON ?auto_980604 ?auto_980607 ) ( ON ?auto_980608 ?auto_980604 ) ( not ( = ?auto_980605 ?auto_980606 ) ) ( not ( = ?auto_980605 ?auto_980607 ) ) ( not ( = ?auto_980605 ?auto_980604 ) ) ( not ( = ?auto_980605 ?auto_980608 ) ) ( not ( = ?auto_980605 ?auto_980610 ) ) ( not ( = ?auto_980605 ?auto_980609 ) ) ( not ( = ?auto_980606 ?auto_980607 ) ) ( not ( = ?auto_980606 ?auto_980604 ) ) ( not ( = ?auto_980606 ?auto_980608 ) ) ( not ( = ?auto_980606 ?auto_980610 ) ) ( not ( = ?auto_980606 ?auto_980609 ) ) ( not ( = ?auto_980607 ?auto_980604 ) ) ( not ( = ?auto_980607 ?auto_980608 ) ) ( not ( = ?auto_980607 ?auto_980610 ) ) ( not ( = ?auto_980607 ?auto_980609 ) ) ( not ( = ?auto_980604 ?auto_980608 ) ) ( not ( = ?auto_980604 ?auto_980610 ) ) ( not ( = ?auto_980604 ?auto_980609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980608 ?auto_980610 ?auto_980609 )
      ( MAKE-6CRATE-VERIFY ?auto_980605 ?auto_980606 ?auto_980607 ?auto_980604 ?auto_980608 ?auto_980610 ?auto_980609 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980668 - SURFACE
      ?auto_980669 - SURFACE
      ?auto_980670 - SURFACE
      ?auto_980667 - SURFACE
      ?auto_980671 - SURFACE
      ?auto_980673 - SURFACE
      ?auto_980672 - SURFACE
    )
    :vars
    (
      ?auto_980675 - HOIST
      ?auto_980679 - PLACE
      ?auto_980678 - TRUCK
      ?auto_980674 - PLACE
      ?auto_980677 - HOIST
      ?auto_980676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980675 ?auto_980679 ) ( SURFACE-AT ?auto_980673 ?auto_980679 ) ( CLEAR ?auto_980673 ) ( IS-CRATE ?auto_980672 ) ( not ( = ?auto_980673 ?auto_980672 ) ) ( AVAILABLE ?auto_980675 ) ( ON ?auto_980673 ?auto_980671 ) ( not ( = ?auto_980671 ?auto_980673 ) ) ( not ( = ?auto_980671 ?auto_980672 ) ) ( TRUCK-AT ?auto_980678 ?auto_980674 ) ( not ( = ?auto_980674 ?auto_980679 ) ) ( HOIST-AT ?auto_980677 ?auto_980674 ) ( not ( = ?auto_980675 ?auto_980677 ) ) ( AVAILABLE ?auto_980677 ) ( SURFACE-AT ?auto_980672 ?auto_980674 ) ( ON ?auto_980672 ?auto_980676 ) ( CLEAR ?auto_980672 ) ( not ( = ?auto_980673 ?auto_980676 ) ) ( not ( = ?auto_980672 ?auto_980676 ) ) ( not ( = ?auto_980671 ?auto_980676 ) ) ( ON ?auto_980669 ?auto_980668 ) ( ON ?auto_980670 ?auto_980669 ) ( ON ?auto_980667 ?auto_980670 ) ( ON ?auto_980671 ?auto_980667 ) ( not ( = ?auto_980668 ?auto_980669 ) ) ( not ( = ?auto_980668 ?auto_980670 ) ) ( not ( = ?auto_980668 ?auto_980667 ) ) ( not ( = ?auto_980668 ?auto_980671 ) ) ( not ( = ?auto_980668 ?auto_980673 ) ) ( not ( = ?auto_980668 ?auto_980672 ) ) ( not ( = ?auto_980668 ?auto_980676 ) ) ( not ( = ?auto_980669 ?auto_980670 ) ) ( not ( = ?auto_980669 ?auto_980667 ) ) ( not ( = ?auto_980669 ?auto_980671 ) ) ( not ( = ?auto_980669 ?auto_980673 ) ) ( not ( = ?auto_980669 ?auto_980672 ) ) ( not ( = ?auto_980669 ?auto_980676 ) ) ( not ( = ?auto_980670 ?auto_980667 ) ) ( not ( = ?auto_980670 ?auto_980671 ) ) ( not ( = ?auto_980670 ?auto_980673 ) ) ( not ( = ?auto_980670 ?auto_980672 ) ) ( not ( = ?auto_980670 ?auto_980676 ) ) ( not ( = ?auto_980667 ?auto_980671 ) ) ( not ( = ?auto_980667 ?auto_980673 ) ) ( not ( = ?auto_980667 ?auto_980672 ) ) ( not ( = ?auto_980667 ?auto_980676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980671 ?auto_980673 ?auto_980672 )
      ( MAKE-6CRATE-VERIFY ?auto_980668 ?auto_980669 ?auto_980670 ?auto_980667 ?auto_980671 ?auto_980673 ?auto_980672 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980732 - SURFACE
      ?auto_980733 - SURFACE
      ?auto_980734 - SURFACE
      ?auto_980731 - SURFACE
      ?auto_980735 - SURFACE
      ?auto_980737 - SURFACE
      ?auto_980736 - SURFACE
    )
    :vars
    (
      ?auto_980739 - HOIST
      ?auto_980743 - PLACE
      ?auto_980738 - PLACE
      ?auto_980740 - HOIST
      ?auto_980741 - SURFACE
      ?auto_980742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980739 ?auto_980743 ) ( SURFACE-AT ?auto_980737 ?auto_980743 ) ( CLEAR ?auto_980737 ) ( IS-CRATE ?auto_980736 ) ( not ( = ?auto_980737 ?auto_980736 ) ) ( AVAILABLE ?auto_980739 ) ( ON ?auto_980737 ?auto_980735 ) ( not ( = ?auto_980735 ?auto_980737 ) ) ( not ( = ?auto_980735 ?auto_980736 ) ) ( not ( = ?auto_980738 ?auto_980743 ) ) ( HOIST-AT ?auto_980740 ?auto_980738 ) ( not ( = ?auto_980739 ?auto_980740 ) ) ( AVAILABLE ?auto_980740 ) ( SURFACE-AT ?auto_980736 ?auto_980738 ) ( ON ?auto_980736 ?auto_980741 ) ( CLEAR ?auto_980736 ) ( not ( = ?auto_980737 ?auto_980741 ) ) ( not ( = ?auto_980736 ?auto_980741 ) ) ( not ( = ?auto_980735 ?auto_980741 ) ) ( TRUCK-AT ?auto_980742 ?auto_980743 ) ( ON ?auto_980733 ?auto_980732 ) ( ON ?auto_980734 ?auto_980733 ) ( ON ?auto_980731 ?auto_980734 ) ( ON ?auto_980735 ?auto_980731 ) ( not ( = ?auto_980732 ?auto_980733 ) ) ( not ( = ?auto_980732 ?auto_980734 ) ) ( not ( = ?auto_980732 ?auto_980731 ) ) ( not ( = ?auto_980732 ?auto_980735 ) ) ( not ( = ?auto_980732 ?auto_980737 ) ) ( not ( = ?auto_980732 ?auto_980736 ) ) ( not ( = ?auto_980732 ?auto_980741 ) ) ( not ( = ?auto_980733 ?auto_980734 ) ) ( not ( = ?auto_980733 ?auto_980731 ) ) ( not ( = ?auto_980733 ?auto_980735 ) ) ( not ( = ?auto_980733 ?auto_980737 ) ) ( not ( = ?auto_980733 ?auto_980736 ) ) ( not ( = ?auto_980733 ?auto_980741 ) ) ( not ( = ?auto_980734 ?auto_980731 ) ) ( not ( = ?auto_980734 ?auto_980735 ) ) ( not ( = ?auto_980734 ?auto_980737 ) ) ( not ( = ?auto_980734 ?auto_980736 ) ) ( not ( = ?auto_980734 ?auto_980741 ) ) ( not ( = ?auto_980731 ?auto_980735 ) ) ( not ( = ?auto_980731 ?auto_980737 ) ) ( not ( = ?auto_980731 ?auto_980736 ) ) ( not ( = ?auto_980731 ?auto_980741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980735 ?auto_980737 ?auto_980736 )
      ( MAKE-6CRATE-VERIFY ?auto_980732 ?auto_980733 ?auto_980734 ?auto_980731 ?auto_980735 ?auto_980737 ?auto_980736 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980796 - SURFACE
      ?auto_980797 - SURFACE
      ?auto_980798 - SURFACE
      ?auto_980795 - SURFACE
      ?auto_980799 - SURFACE
      ?auto_980801 - SURFACE
      ?auto_980800 - SURFACE
    )
    :vars
    (
      ?auto_980803 - HOIST
      ?auto_980806 - PLACE
      ?auto_980802 - PLACE
      ?auto_980805 - HOIST
      ?auto_980804 - SURFACE
      ?auto_980807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980803 ?auto_980806 ) ( IS-CRATE ?auto_980800 ) ( not ( = ?auto_980801 ?auto_980800 ) ) ( not ( = ?auto_980799 ?auto_980801 ) ) ( not ( = ?auto_980799 ?auto_980800 ) ) ( not ( = ?auto_980802 ?auto_980806 ) ) ( HOIST-AT ?auto_980805 ?auto_980802 ) ( not ( = ?auto_980803 ?auto_980805 ) ) ( AVAILABLE ?auto_980805 ) ( SURFACE-AT ?auto_980800 ?auto_980802 ) ( ON ?auto_980800 ?auto_980804 ) ( CLEAR ?auto_980800 ) ( not ( = ?auto_980801 ?auto_980804 ) ) ( not ( = ?auto_980800 ?auto_980804 ) ) ( not ( = ?auto_980799 ?auto_980804 ) ) ( TRUCK-AT ?auto_980807 ?auto_980806 ) ( SURFACE-AT ?auto_980799 ?auto_980806 ) ( CLEAR ?auto_980799 ) ( LIFTING ?auto_980803 ?auto_980801 ) ( IS-CRATE ?auto_980801 ) ( ON ?auto_980797 ?auto_980796 ) ( ON ?auto_980798 ?auto_980797 ) ( ON ?auto_980795 ?auto_980798 ) ( ON ?auto_980799 ?auto_980795 ) ( not ( = ?auto_980796 ?auto_980797 ) ) ( not ( = ?auto_980796 ?auto_980798 ) ) ( not ( = ?auto_980796 ?auto_980795 ) ) ( not ( = ?auto_980796 ?auto_980799 ) ) ( not ( = ?auto_980796 ?auto_980801 ) ) ( not ( = ?auto_980796 ?auto_980800 ) ) ( not ( = ?auto_980796 ?auto_980804 ) ) ( not ( = ?auto_980797 ?auto_980798 ) ) ( not ( = ?auto_980797 ?auto_980795 ) ) ( not ( = ?auto_980797 ?auto_980799 ) ) ( not ( = ?auto_980797 ?auto_980801 ) ) ( not ( = ?auto_980797 ?auto_980800 ) ) ( not ( = ?auto_980797 ?auto_980804 ) ) ( not ( = ?auto_980798 ?auto_980795 ) ) ( not ( = ?auto_980798 ?auto_980799 ) ) ( not ( = ?auto_980798 ?auto_980801 ) ) ( not ( = ?auto_980798 ?auto_980800 ) ) ( not ( = ?auto_980798 ?auto_980804 ) ) ( not ( = ?auto_980795 ?auto_980799 ) ) ( not ( = ?auto_980795 ?auto_980801 ) ) ( not ( = ?auto_980795 ?auto_980800 ) ) ( not ( = ?auto_980795 ?auto_980804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980799 ?auto_980801 ?auto_980800 )
      ( MAKE-6CRATE-VERIFY ?auto_980796 ?auto_980797 ?auto_980798 ?auto_980795 ?auto_980799 ?auto_980801 ?auto_980800 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980860 - SURFACE
      ?auto_980861 - SURFACE
      ?auto_980862 - SURFACE
      ?auto_980859 - SURFACE
      ?auto_980863 - SURFACE
      ?auto_980865 - SURFACE
      ?auto_980864 - SURFACE
    )
    :vars
    (
      ?auto_980869 - HOIST
      ?auto_980866 - PLACE
      ?auto_980870 - PLACE
      ?auto_980867 - HOIST
      ?auto_980868 - SURFACE
      ?auto_980871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980869 ?auto_980866 ) ( IS-CRATE ?auto_980864 ) ( not ( = ?auto_980865 ?auto_980864 ) ) ( not ( = ?auto_980863 ?auto_980865 ) ) ( not ( = ?auto_980863 ?auto_980864 ) ) ( not ( = ?auto_980870 ?auto_980866 ) ) ( HOIST-AT ?auto_980867 ?auto_980870 ) ( not ( = ?auto_980869 ?auto_980867 ) ) ( AVAILABLE ?auto_980867 ) ( SURFACE-AT ?auto_980864 ?auto_980870 ) ( ON ?auto_980864 ?auto_980868 ) ( CLEAR ?auto_980864 ) ( not ( = ?auto_980865 ?auto_980868 ) ) ( not ( = ?auto_980864 ?auto_980868 ) ) ( not ( = ?auto_980863 ?auto_980868 ) ) ( TRUCK-AT ?auto_980871 ?auto_980866 ) ( SURFACE-AT ?auto_980863 ?auto_980866 ) ( CLEAR ?auto_980863 ) ( IS-CRATE ?auto_980865 ) ( AVAILABLE ?auto_980869 ) ( IN ?auto_980865 ?auto_980871 ) ( ON ?auto_980861 ?auto_980860 ) ( ON ?auto_980862 ?auto_980861 ) ( ON ?auto_980859 ?auto_980862 ) ( ON ?auto_980863 ?auto_980859 ) ( not ( = ?auto_980860 ?auto_980861 ) ) ( not ( = ?auto_980860 ?auto_980862 ) ) ( not ( = ?auto_980860 ?auto_980859 ) ) ( not ( = ?auto_980860 ?auto_980863 ) ) ( not ( = ?auto_980860 ?auto_980865 ) ) ( not ( = ?auto_980860 ?auto_980864 ) ) ( not ( = ?auto_980860 ?auto_980868 ) ) ( not ( = ?auto_980861 ?auto_980862 ) ) ( not ( = ?auto_980861 ?auto_980859 ) ) ( not ( = ?auto_980861 ?auto_980863 ) ) ( not ( = ?auto_980861 ?auto_980865 ) ) ( not ( = ?auto_980861 ?auto_980864 ) ) ( not ( = ?auto_980861 ?auto_980868 ) ) ( not ( = ?auto_980862 ?auto_980859 ) ) ( not ( = ?auto_980862 ?auto_980863 ) ) ( not ( = ?auto_980862 ?auto_980865 ) ) ( not ( = ?auto_980862 ?auto_980864 ) ) ( not ( = ?auto_980862 ?auto_980868 ) ) ( not ( = ?auto_980859 ?auto_980863 ) ) ( not ( = ?auto_980859 ?auto_980865 ) ) ( not ( = ?auto_980859 ?auto_980864 ) ) ( not ( = ?auto_980859 ?auto_980868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980863 ?auto_980865 ?auto_980864 )
      ( MAKE-6CRATE-VERIFY ?auto_980860 ?auto_980861 ?auto_980862 ?auto_980859 ?auto_980863 ?auto_980865 ?auto_980864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_982535 - SURFACE
      ?auto_982536 - SURFACE
    )
    :vars
    (
      ?auto_982542 - HOIST
      ?auto_982537 - PLACE
      ?auto_982539 - SURFACE
      ?auto_982540 - PLACE
      ?auto_982541 - HOIST
      ?auto_982543 - SURFACE
      ?auto_982538 - TRUCK
      ?auto_982544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982542 ?auto_982537 ) ( SURFACE-AT ?auto_982535 ?auto_982537 ) ( CLEAR ?auto_982535 ) ( IS-CRATE ?auto_982536 ) ( not ( = ?auto_982535 ?auto_982536 ) ) ( ON ?auto_982535 ?auto_982539 ) ( not ( = ?auto_982539 ?auto_982535 ) ) ( not ( = ?auto_982539 ?auto_982536 ) ) ( not ( = ?auto_982540 ?auto_982537 ) ) ( HOIST-AT ?auto_982541 ?auto_982540 ) ( not ( = ?auto_982542 ?auto_982541 ) ) ( AVAILABLE ?auto_982541 ) ( SURFACE-AT ?auto_982536 ?auto_982540 ) ( ON ?auto_982536 ?auto_982543 ) ( CLEAR ?auto_982536 ) ( not ( = ?auto_982535 ?auto_982543 ) ) ( not ( = ?auto_982536 ?auto_982543 ) ) ( not ( = ?auto_982539 ?auto_982543 ) ) ( TRUCK-AT ?auto_982538 ?auto_982537 ) ( LIFTING ?auto_982542 ?auto_982544 ) ( IS-CRATE ?auto_982544 ) ( not ( = ?auto_982535 ?auto_982544 ) ) ( not ( = ?auto_982536 ?auto_982544 ) ) ( not ( = ?auto_982539 ?auto_982544 ) ) ( not ( = ?auto_982543 ?auto_982544 ) ) )
    :subtasks
    ( ( !LOAD ?auto_982542 ?auto_982544 ?auto_982538 ?auto_982537 )
      ( MAKE-1CRATE ?auto_982535 ?auto_982536 )
      ( MAKE-1CRATE-VERIFY ?auto_982535 ?auto_982536 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982812 - SURFACE
      ?auto_982813 - SURFACE
      ?auto_982814 - SURFACE
      ?auto_982811 - SURFACE
      ?auto_982815 - SURFACE
      ?auto_982817 - SURFACE
      ?auto_982816 - SURFACE
      ?auto_982818 - SURFACE
    )
    :vars
    (
      ?auto_982819 - HOIST
      ?auto_982820 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982819 ?auto_982820 ) ( SURFACE-AT ?auto_982816 ?auto_982820 ) ( CLEAR ?auto_982816 ) ( LIFTING ?auto_982819 ?auto_982818 ) ( IS-CRATE ?auto_982818 ) ( not ( = ?auto_982816 ?auto_982818 ) ) ( ON ?auto_982813 ?auto_982812 ) ( ON ?auto_982814 ?auto_982813 ) ( ON ?auto_982811 ?auto_982814 ) ( ON ?auto_982815 ?auto_982811 ) ( ON ?auto_982817 ?auto_982815 ) ( ON ?auto_982816 ?auto_982817 ) ( not ( = ?auto_982812 ?auto_982813 ) ) ( not ( = ?auto_982812 ?auto_982814 ) ) ( not ( = ?auto_982812 ?auto_982811 ) ) ( not ( = ?auto_982812 ?auto_982815 ) ) ( not ( = ?auto_982812 ?auto_982817 ) ) ( not ( = ?auto_982812 ?auto_982816 ) ) ( not ( = ?auto_982812 ?auto_982818 ) ) ( not ( = ?auto_982813 ?auto_982814 ) ) ( not ( = ?auto_982813 ?auto_982811 ) ) ( not ( = ?auto_982813 ?auto_982815 ) ) ( not ( = ?auto_982813 ?auto_982817 ) ) ( not ( = ?auto_982813 ?auto_982816 ) ) ( not ( = ?auto_982813 ?auto_982818 ) ) ( not ( = ?auto_982814 ?auto_982811 ) ) ( not ( = ?auto_982814 ?auto_982815 ) ) ( not ( = ?auto_982814 ?auto_982817 ) ) ( not ( = ?auto_982814 ?auto_982816 ) ) ( not ( = ?auto_982814 ?auto_982818 ) ) ( not ( = ?auto_982811 ?auto_982815 ) ) ( not ( = ?auto_982811 ?auto_982817 ) ) ( not ( = ?auto_982811 ?auto_982816 ) ) ( not ( = ?auto_982811 ?auto_982818 ) ) ( not ( = ?auto_982815 ?auto_982817 ) ) ( not ( = ?auto_982815 ?auto_982816 ) ) ( not ( = ?auto_982815 ?auto_982818 ) ) ( not ( = ?auto_982817 ?auto_982816 ) ) ( not ( = ?auto_982817 ?auto_982818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_982816 ?auto_982818 )
      ( MAKE-7CRATE-VERIFY ?auto_982812 ?auto_982813 ?auto_982814 ?auto_982811 ?auto_982815 ?auto_982817 ?auto_982816 ?auto_982818 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982867 - SURFACE
      ?auto_982868 - SURFACE
      ?auto_982869 - SURFACE
      ?auto_982866 - SURFACE
      ?auto_982870 - SURFACE
      ?auto_982872 - SURFACE
      ?auto_982871 - SURFACE
      ?auto_982873 - SURFACE
    )
    :vars
    (
      ?auto_982875 - HOIST
      ?auto_982874 - PLACE
      ?auto_982876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982875 ?auto_982874 ) ( SURFACE-AT ?auto_982871 ?auto_982874 ) ( CLEAR ?auto_982871 ) ( IS-CRATE ?auto_982873 ) ( not ( = ?auto_982871 ?auto_982873 ) ) ( TRUCK-AT ?auto_982876 ?auto_982874 ) ( AVAILABLE ?auto_982875 ) ( IN ?auto_982873 ?auto_982876 ) ( ON ?auto_982871 ?auto_982872 ) ( not ( = ?auto_982872 ?auto_982871 ) ) ( not ( = ?auto_982872 ?auto_982873 ) ) ( ON ?auto_982868 ?auto_982867 ) ( ON ?auto_982869 ?auto_982868 ) ( ON ?auto_982866 ?auto_982869 ) ( ON ?auto_982870 ?auto_982866 ) ( ON ?auto_982872 ?auto_982870 ) ( not ( = ?auto_982867 ?auto_982868 ) ) ( not ( = ?auto_982867 ?auto_982869 ) ) ( not ( = ?auto_982867 ?auto_982866 ) ) ( not ( = ?auto_982867 ?auto_982870 ) ) ( not ( = ?auto_982867 ?auto_982872 ) ) ( not ( = ?auto_982867 ?auto_982871 ) ) ( not ( = ?auto_982867 ?auto_982873 ) ) ( not ( = ?auto_982868 ?auto_982869 ) ) ( not ( = ?auto_982868 ?auto_982866 ) ) ( not ( = ?auto_982868 ?auto_982870 ) ) ( not ( = ?auto_982868 ?auto_982872 ) ) ( not ( = ?auto_982868 ?auto_982871 ) ) ( not ( = ?auto_982868 ?auto_982873 ) ) ( not ( = ?auto_982869 ?auto_982866 ) ) ( not ( = ?auto_982869 ?auto_982870 ) ) ( not ( = ?auto_982869 ?auto_982872 ) ) ( not ( = ?auto_982869 ?auto_982871 ) ) ( not ( = ?auto_982869 ?auto_982873 ) ) ( not ( = ?auto_982866 ?auto_982870 ) ) ( not ( = ?auto_982866 ?auto_982872 ) ) ( not ( = ?auto_982866 ?auto_982871 ) ) ( not ( = ?auto_982866 ?auto_982873 ) ) ( not ( = ?auto_982870 ?auto_982872 ) ) ( not ( = ?auto_982870 ?auto_982871 ) ) ( not ( = ?auto_982870 ?auto_982873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982872 ?auto_982871 ?auto_982873 )
      ( MAKE-7CRATE-VERIFY ?auto_982867 ?auto_982868 ?auto_982869 ?auto_982866 ?auto_982870 ?auto_982872 ?auto_982871 ?auto_982873 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982930 - SURFACE
      ?auto_982931 - SURFACE
      ?auto_982932 - SURFACE
      ?auto_982929 - SURFACE
      ?auto_982933 - SURFACE
      ?auto_982935 - SURFACE
      ?auto_982934 - SURFACE
      ?auto_982936 - SURFACE
    )
    :vars
    (
      ?auto_982939 - HOIST
      ?auto_982937 - PLACE
      ?auto_982940 - TRUCK
      ?auto_982938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982939 ?auto_982937 ) ( SURFACE-AT ?auto_982934 ?auto_982937 ) ( CLEAR ?auto_982934 ) ( IS-CRATE ?auto_982936 ) ( not ( = ?auto_982934 ?auto_982936 ) ) ( AVAILABLE ?auto_982939 ) ( IN ?auto_982936 ?auto_982940 ) ( ON ?auto_982934 ?auto_982935 ) ( not ( = ?auto_982935 ?auto_982934 ) ) ( not ( = ?auto_982935 ?auto_982936 ) ) ( TRUCK-AT ?auto_982940 ?auto_982938 ) ( not ( = ?auto_982938 ?auto_982937 ) ) ( ON ?auto_982931 ?auto_982930 ) ( ON ?auto_982932 ?auto_982931 ) ( ON ?auto_982929 ?auto_982932 ) ( ON ?auto_982933 ?auto_982929 ) ( ON ?auto_982935 ?auto_982933 ) ( not ( = ?auto_982930 ?auto_982931 ) ) ( not ( = ?auto_982930 ?auto_982932 ) ) ( not ( = ?auto_982930 ?auto_982929 ) ) ( not ( = ?auto_982930 ?auto_982933 ) ) ( not ( = ?auto_982930 ?auto_982935 ) ) ( not ( = ?auto_982930 ?auto_982934 ) ) ( not ( = ?auto_982930 ?auto_982936 ) ) ( not ( = ?auto_982931 ?auto_982932 ) ) ( not ( = ?auto_982931 ?auto_982929 ) ) ( not ( = ?auto_982931 ?auto_982933 ) ) ( not ( = ?auto_982931 ?auto_982935 ) ) ( not ( = ?auto_982931 ?auto_982934 ) ) ( not ( = ?auto_982931 ?auto_982936 ) ) ( not ( = ?auto_982932 ?auto_982929 ) ) ( not ( = ?auto_982932 ?auto_982933 ) ) ( not ( = ?auto_982932 ?auto_982935 ) ) ( not ( = ?auto_982932 ?auto_982934 ) ) ( not ( = ?auto_982932 ?auto_982936 ) ) ( not ( = ?auto_982929 ?auto_982933 ) ) ( not ( = ?auto_982929 ?auto_982935 ) ) ( not ( = ?auto_982929 ?auto_982934 ) ) ( not ( = ?auto_982929 ?auto_982936 ) ) ( not ( = ?auto_982933 ?auto_982935 ) ) ( not ( = ?auto_982933 ?auto_982934 ) ) ( not ( = ?auto_982933 ?auto_982936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982935 ?auto_982934 ?auto_982936 )
      ( MAKE-7CRATE-VERIFY ?auto_982930 ?auto_982931 ?auto_982932 ?auto_982929 ?auto_982933 ?auto_982935 ?auto_982934 ?auto_982936 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983000 - SURFACE
      ?auto_983001 - SURFACE
      ?auto_983002 - SURFACE
      ?auto_982999 - SURFACE
      ?auto_983003 - SURFACE
      ?auto_983005 - SURFACE
      ?auto_983004 - SURFACE
      ?auto_983006 - SURFACE
    )
    :vars
    (
      ?auto_983010 - HOIST
      ?auto_983007 - PLACE
      ?auto_983009 - TRUCK
      ?auto_983008 - PLACE
      ?auto_983011 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_983010 ?auto_983007 ) ( SURFACE-AT ?auto_983004 ?auto_983007 ) ( CLEAR ?auto_983004 ) ( IS-CRATE ?auto_983006 ) ( not ( = ?auto_983004 ?auto_983006 ) ) ( AVAILABLE ?auto_983010 ) ( ON ?auto_983004 ?auto_983005 ) ( not ( = ?auto_983005 ?auto_983004 ) ) ( not ( = ?auto_983005 ?auto_983006 ) ) ( TRUCK-AT ?auto_983009 ?auto_983008 ) ( not ( = ?auto_983008 ?auto_983007 ) ) ( HOIST-AT ?auto_983011 ?auto_983008 ) ( LIFTING ?auto_983011 ?auto_983006 ) ( not ( = ?auto_983010 ?auto_983011 ) ) ( ON ?auto_983001 ?auto_983000 ) ( ON ?auto_983002 ?auto_983001 ) ( ON ?auto_982999 ?auto_983002 ) ( ON ?auto_983003 ?auto_982999 ) ( ON ?auto_983005 ?auto_983003 ) ( not ( = ?auto_983000 ?auto_983001 ) ) ( not ( = ?auto_983000 ?auto_983002 ) ) ( not ( = ?auto_983000 ?auto_982999 ) ) ( not ( = ?auto_983000 ?auto_983003 ) ) ( not ( = ?auto_983000 ?auto_983005 ) ) ( not ( = ?auto_983000 ?auto_983004 ) ) ( not ( = ?auto_983000 ?auto_983006 ) ) ( not ( = ?auto_983001 ?auto_983002 ) ) ( not ( = ?auto_983001 ?auto_982999 ) ) ( not ( = ?auto_983001 ?auto_983003 ) ) ( not ( = ?auto_983001 ?auto_983005 ) ) ( not ( = ?auto_983001 ?auto_983004 ) ) ( not ( = ?auto_983001 ?auto_983006 ) ) ( not ( = ?auto_983002 ?auto_982999 ) ) ( not ( = ?auto_983002 ?auto_983003 ) ) ( not ( = ?auto_983002 ?auto_983005 ) ) ( not ( = ?auto_983002 ?auto_983004 ) ) ( not ( = ?auto_983002 ?auto_983006 ) ) ( not ( = ?auto_982999 ?auto_983003 ) ) ( not ( = ?auto_982999 ?auto_983005 ) ) ( not ( = ?auto_982999 ?auto_983004 ) ) ( not ( = ?auto_982999 ?auto_983006 ) ) ( not ( = ?auto_983003 ?auto_983005 ) ) ( not ( = ?auto_983003 ?auto_983004 ) ) ( not ( = ?auto_983003 ?auto_983006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983005 ?auto_983004 ?auto_983006 )
      ( MAKE-7CRATE-VERIFY ?auto_983000 ?auto_983001 ?auto_983002 ?auto_982999 ?auto_983003 ?auto_983005 ?auto_983004 ?auto_983006 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983077 - SURFACE
      ?auto_983078 - SURFACE
      ?auto_983079 - SURFACE
      ?auto_983076 - SURFACE
      ?auto_983080 - SURFACE
      ?auto_983082 - SURFACE
      ?auto_983081 - SURFACE
      ?auto_983083 - SURFACE
    )
    :vars
    (
      ?auto_983089 - HOIST
      ?auto_983088 - PLACE
      ?auto_983085 - TRUCK
      ?auto_983084 - PLACE
      ?auto_983086 - HOIST
      ?auto_983087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_983089 ?auto_983088 ) ( SURFACE-AT ?auto_983081 ?auto_983088 ) ( CLEAR ?auto_983081 ) ( IS-CRATE ?auto_983083 ) ( not ( = ?auto_983081 ?auto_983083 ) ) ( AVAILABLE ?auto_983089 ) ( ON ?auto_983081 ?auto_983082 ) ( not ( = ?auto_983082 ?auto_983081 ) ) ( not ( = ?auto_983082 ?auto_983083 ) ) ( TRUCK-AT ?auto_983085 ?auto_983084 ) ( not ( = ?auto_983084 ?auto_983088 ) ) ( HOIST-AT ?auto_983086 ?auto_983084 ) ( not ( = ?auto_983089 ?auto_983086 ) ) ( AVAILABLE ?auto_983086 ) ( SURFACE-AT ?auto_983083 ?auto_983084 ) ( ON ?auto_983083 ?auto_983087 ) ( CLEAR ?auto_983083 ) ( not ( = ?auto_983081 ?auto_983087 ) ) ( not ( = ?auto_983083 ?auto_983087 ) ) ( not ( = ?auto_983082 ?auto_983087 ) ) ( ON ?auto_983078 ?auto_983077 ) ( ON ?auto_983079 ?auto_983078 ) ( ON ?auto_983076 ?auto_983079 ) ( ON ?auto_983080 ?auto_983076 ) ( ON ?auto_983082 ?auto_983080 ) ( not ( = ?auto_983077 ?auto_983078 ) ) ( not ( = ?auto_983077 ?auto_983079 ) ) ( not ( = ?auto_983077 ?auto_983076 ) ) ( not ( = ?auto_983077 ?auto_983080 ) ) ( not ( = ?auto_983077 ?auto_983082 ) ) ( not ( = ?auto_983077 ?auto_983081 ) ) ( not ( = ?auto_983077 ?auto_983083 ) ) ( not ( = ?auto_983077 ?auto_983087 ) ) ( not ( = ?auto_983078 ?auto_983079 ) ) ( not ( = ?auto_983078 ?auto_983076 ) ) ( not ( = ?auto_983078 ?auto_983080 ) ) ( not ( = ?auto_983078 ?auto_983082 ) ) ( not ( = ?auto_983078 ?auto_983081 ) ) ( not ( = ?auto_983078 ?auto_983083 ) ) ( not ( = ?auto_983078 ?auto_983087 ) ) ( not ( = ?auto_983079 ?auto_983076 ) ) ( not ( = ?auto_983079 ?auto_983080 ) ) ( not ( = ?auto_983079 ?auto_983082 ) ) ( not ( = ?auto_983079 ?auto_983081 ) ) ( not ( = ?auto_983079 ?auto_983083 ) ) ( not ( = ?auto_983079 ?auto_983087 ) ) ( not ( = ?auto_983076 ?auto_983080 ) ) ( not ( = ?auto_983076 ?auto_983082 ) ) ( not ( = ?auto_983076 ?auto_983081 ) ) ( not ( = ?auto_983076 ?auto_983083 ) ) ( not ( = ?auto_983076 ?auto_983087 ) ) ( not ( = ?auto_983080 ?auto_983082 ) ) ( not ( = ?auto_983080 ?auto_983081 ) ) ( not ( = ?auto_983080 ?auto_983083 ) ) ( not ( = ?auto_983080 ?auto_983087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983082 ?auto_983081 ?auto_983083 )
      ( MAKE-7CRATE-VERIFY ?auto_983077 ?auto_983078 ?auto_983079 ?auto_983076 ?auto_983080 ?auto_983082 ?auto_983081 ?auto_983083 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983155 - SURFACE
      ?auto_983156 - SURFACE
      ?auto_983157 - SURFACE
      ?auto_983154 - SURFACE
      ?auto_983158 - SURFACE
      ?auto_983160 - SURFACE
      ?auto_983159 - SURFACE
      ?auto_983161 - SURFACE
    )
    :vars
    (
      ?auto_983163 - HOIST
      ?auto_983164 - PLACE
      ?auto_983162 - PLACE
      ?auto_983167 - HOIST
      ?auto_983165 - SURFACE
      ?auto_983166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_983163 ?auto_983164 ) ( SURFACE-AT ?auto_983159 ?auto_983164 ) ( CLEAR ?auto_983159 ) ( IS-CRATE ?auto_983161 ) ( not ( = ?auto_983159 ?auto_983161 ) ) ( AVAILABLE ?auto_983163 ) ( ON ?auto_983159 ?auto_983160 ) ( not ( = ?auto_983160 ?auto_983159 ) ) ( not ( = ?auto_983160 ?auto_983161 ) ) ( not ( = ?auto_983162 ?auto_983164 ) ) ( HOIST-AT ?auto_983167 ?auto_983162 ) ( not ( = ?auto_983163 ?auto_983167 ) ) ( AVAILABLE ?auto_983167 ) ( SURFACE-AT ?auto_983161 ?auto_983162 ) ( ON ?auto_983161 ?auto_983165 ) ( CLEAR ?auto_983161 ) ( not ( = ?auto_983159 ?auto_983165 ) ) ( not ( = ?auto_983161 ?auto_983165 ) ) ( not ( = ?auto_983160 ?auto_983165 ) ) ( TRUCK-AT ?auto_983166 ?auto_983164 ) ( ON ?auto_983156 ?auto_983155 ) ( ON ?auto_983157 ?auto_983156 ) ( ON ?auto_983154 ?auto_983157 ) ( ON ?auto_983158 ?auto_983154 ) ( ON ?auto_983160 ?auto_983158 ) ( not ( = ?auto_983155 ?auto_983156 ) ) ( not ( = ?auto_983155 ?auto_983157 ) ) ( not ( = ?auto_983155 ?auto_983154 ) ) ( not ( = ?auto_983155 ?auto_983158 ) ) ( not ( = ?auto_983155 ?auto_983160 ) ) ( not ( = ?auto_983155 ?auto_983159 ) ) ( not ( = ?auto_983155 ?auto_983161 ) ) ( not ( = ?auto_983155 ?auto_983165 ) ) ( not ( = ?auto_983156 ?auto_983157 ) ) ( not ( = ?auto_983156 ?auto_983154 ) ) ( not ( = ?auto_983156 ?auto_983158 ) ) ( not ( = ?auto_983156 ?auto_983160 ) ) ( not ( = ?auto_983156 ?auto_983159 ) ) ( not ( = ?auto_983156 ?auto_983161 ) ) ( not ( = ?auto_983156 ?auto_983165 ) ) ( not ( = ?auto_983157 ?auto_983154 ) ) ( not ( = ?auto_983157 ?auto_983158 ) ) ( not ( = ?auto_983157 ?auto_983160 ) ) ( not ( = ?auto_983157 ?auto_983159 ) ) ( not ( = ?auto_983157 ?auto_983161 ) ) ( not ( = ?auto_983157 ?auto_983165 ) ) ( not ( = ?auto_983154 ?auto_983158 ) ) ( not ( = ?auto_983154 ?auto_983160 ) ) ( not ( = ?auto_983154 ?auto_983159 ) ) ( not ( = ?auto_983154 ?auto_983161 ) ) ( not ( = ?auto_983154 ?auto_983165 ) ) ( not ( = ?auto_983158 ?auto_983160 ) ) ( not ( = ?auto_983158 ?auto_983159 ) ) ( not ( = ?auto_983158 ?auto_983161 ) ) ( not ( = ?auto_983158 ?auto_983165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983160 ?auto_983159 ?auto_983161 )
      ( MAKE-7CRATE-VERIFY ?auto_983155 ?auto_983156 ?auto_983157 ?auto_983154 ?auto_983158 ?auto_983160 ?auto_983159 ?auto_983161 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983233 - SURFACE
      ?auto_983234 - SURFACE
      ?auto_983235 - SURFACE
      ?auto_983232 - SURFACE
      ?auto_983236 - SURFACE
      ?auto_983238 - SURFACE
      ?auto_983237 - SURFACE
      ?auto_983239 - SURFACE
    )
    :vars
    (
      ?auto_983242 - HOIST
      ?auto_983243 - PLACE
      ?auto_983244 - PLACE
      ?auto_983245 - HOIST
      ?auto_983241 - SURFACE
      ?auto_983240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_983242 ?auto_983243 ) ( IS-CRATE ?auto_983239 ) ( not ( = ?auto_983237 ?auto_983239 ) ) ( not ( = ?auto_983238 ?auto_983237 ) ) ( not ( = ?auto_983238 ?auto_983239 ) ) ( not ( = ?auto_983244 ?auto_983243 ) ) ( HOIST-AT ?auto_983245 ?auto_983244 ) ( not ( = ?auto_983242 ?auto_983245 ) ) ( AVAILABLE ?auto_983245 ) ( SURFACE-AT ?auto_983239 ?auto_983244 ) ( ON ?auto_983239 ?auto_983241 ) ( CLEAR ?auto_983239 ) ( not ( = ?auto_983237 ?auto_983241 ) ) ( not ( = ?auto_983239 ?auto_983241 ) ) ( not ( = ?auto_983238 ?auto_983241 ) ) ( TRUCK-AT ?auto_983240 ?auto_983243 ) ( SURFACE-AT ?auto_983238 ?auto_983243 ) ( CLEAR ?auto_983238 ) ( LIFTING ?auto_983242 ?auto_983237 ) ( IS-CRATE ?auto_983237 ) ( ON ?auto_983234 ?auto_983233 ) ( ON ?auto_983235 ?auto_983234 ) ( ON ?auto_983232 ?auto_983235 ) ( ON ?auto_983236 ?auto_983232 ) ( ON ?auto_983238 ?auto_983236 ) ( not ( = ?auto_983233 ?auto_983234 ) ) ( not ( = ?auto_983233 ?auto_983235 ) ) ( not ( = ?auto_983233 ?auto_983232 ) ) ( not ( = ?auto_983233 ?auto_983236 ) ) ( not ( = ?auto_983233 ?auto_983238 ) ) ( not ( = ?auto_983233 ?auto_983237 ) ) ( not ( = ?auto_983233 ?auto_983239 ) ) ( not ( = ?auto_983233 ?auto_983241 ) ) ( not ( = ?auto_983234 ?auto_983235 ) ) ( not ( = ?auto_983234 ?auto_983232 ) ) ( not ( = ?auto_983234 ?auto_983236 ) ) ( not ( = ?auto_983234 ?auto_983238 ) ) ( not ( = ?auto_983234 ?auto_983237 ) ) ( not ( = ?auto_983234 ?auto_983239 ) ) ( not ( = ?auto_983234 ?auto_983241 ) ) ( not ( = ?auto_983235 ?auto_983232 ) ) ( not ( = ?auto_983235 ?auto_983236 ) ) ( not ( = ?auto_983235 ?auto_983238 ) ) ( not ( = ?auto_983235 ?auto_983237 ) ) ( not ( = ?auto_983235 ?auto_983239 ) ) ( not ( = ?auto_983235 ?auto_983241 ) ) ( not ( = ?auto_983232 ?auto_983236 ) ) ( not ( = ?auto_983232 ?auto_983238 ) ) ( not ( = ?auto_983232 ?auto_983237 ) ) ( not ( = ?auto_983232 ?auto_983239 ) ) ( not ( = ?auto_983232 ?auto_983241 ) ) ( not ( = ?auto_983236 ?auto_983238 ) ) ( not ( = ?auto_983236 ?auto_983237 ) ) ( not ( = ?auto_983236 ?auto_983239 ) ) ( not ( = ?auto_983236 ?auto_983241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983238 ?auto_983237 ?auto_983239 )
      ( MAKE-7CRATE-VERIFY ?auto_983233 ?auto_983234 ?auto_983235 ?auto_983232 ?auto_983236 ?auto_983238 ?auto_983237 ?auto_983239 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983311 - SURFACE
      ?auto_983312 - SURFACE
      ?auto_983313 - SURFACE
      ?auto_983310 - SURFACE
      ?auto_983314 - SURFACE
      ?auto_983316 - SURFACE
      ?auto_983315 - SURFACE
      ?auto_983317 - SURFACE
    )
    :vars
    (
      ?auto_983319 - HOIST
      ?auto_983322 - PLACE
      ?auto_983321 - PLACE
      ?auto_983320 - HOIST
      ?auto_983323 - SURFACE
      ?auto_983318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_983319 ?auto_983322 ) ( IS-CRATE ?auto_983317 ) ( not ( = ?auto_983315 ?auto_983317 ) ) ( not ( = ?auto_983316 ?auto_983315 ) ) ( not ( = ?auto_983316 ?auto_983317 ) ) ( not ( = ?auto_983321 ?auto_983322 ) ) ( HOIST-AT ?auto_983320 ?auto_983321 ) ( not ( = ?auto_983319 ?auto_983320 ) ) ( AVAILABLE ?auto_983320 ) ( SURFACE-AT ?auto_983317 ?auto_983321 ) ( ON ?auto_983317 ?auto_983323 ) ( CLEAR ?auto_983317 ) ( not ( = ?auto_983315 ?auto_983323 ) ) ( not ( = ?auto_983317 ?auto_983323 ) ) ( not ( = ?auto_983316 ?auto_983323 ) ) ( TRUCK-AT ?auto_983318 ?auto_983322 ) ( SURFACE-AT ?auto_983316 ?auto_983322 ) ( CLEAR ?auto_983316 ) ( IS-CRATE ?auto_983315 ) ( AVAILABLE ?auto_983319 ) ( IN ?auto_983315 ?auto_983318 ) ( ON ?auto_983312 ?auto_983311 ) ( ON ?auto_983313 ?auto_983312 ) ( ON ?auto_983310 ?auto_983313 ) ( ON ?auto_983314 ?auto_983310 ) ( ON ?auto_983316 ?auto_983314 ) ( not ( = ?auto_983311 ?auto_983312 ) ) ( not ( = ?auto_983311 ?auto_983313 ) ) ( not ( = ?auto_983311 ?auto_983310 ) ) ( not ( = ?auto_983311 ?auto_983314 ) ) ( not ( = ?auto_983311 ?auto_983316 ) ) ( not ( = ?auto_983311 ?auto_983315 ) ) ( not ( = ?auto_983311 ?auto_983317 ) ) ( not ( = ?auto_983311 ?auto_983323 ) ) ( not ( = ?auto_983312 ?auto_983313 ) ) ( not ( = ?auto_983312 ?auto_983310 ) ) ( not ( = ?auto_983312 ?auto_983314 ) ) ( not ( = ?auto_983312 ?auto_983316 ) ) ( not ( = ?auto_983312 ?auto_983315 ) ) ( not ( = ?auto_983312 ?auto_983317 ) ) ( not ( = ?auto_983312 ?auto_983323 ) ) ( not ( = ?auto_983313 ?auto_983310 ) ) ( not ( = ?auto_983313 ?auto_983314 ) ) ( not ( = ?auto_983313 ?auto_983316 ) ) ( not ( = ?auto_983313 ?auto_983315 ) ) ( not ( = ?auto_983313 ?auto_983317 ) ) ( not ( = ?auto_983313 ?auto_983323 ) ) ( not ( = ?auto_983310 ?auto_983314 ) ) ( not ( = ?auto_983310 ?auto_983316 ) ) ( not ( = ?auto_983310 ?auto_983315 ) ) ( not ( = ?auto_983310 ?auto_983317 ) ) ( not ( = ?auto_983310 ?auto_983323 ) ) ( not ( = ?auto_983314 ?auto_983316 ) ) ( not ( = ?auto_983314 ?auto_983315 ) ) ( not ( = ?auto_983314 ?auto_983317 ) ) ( not ( = ?auto_983314 ?auto_983323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983316 ?auto_983315 ?auto_983317 )
      ( MAKE-7CRATE-VERIFY ?auto_983311 ?auto_983312 ?auto_983313 ?auto_983310 ?auto_983314 ?auto_983316 ?auto_983315 ?auto_983317 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986222 - SURFACE
      ?auto_986223 - SURFACE
      ?auto_986224 - SURFACE
      ?auto_986221 - SURFACE
      ?auto_986225 - SURFACE
      ?auto_986227 - SURFACE
      ?auto_986226 - SURFACE
      ?auto_986228 - SURFACE
      ?auto_986229 - SURFACE
    )
    :vars
    (
      ?auto_986230 - HOIST
      ?auto_986231 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_986230 ?auto_986231 ) ( SURFACE-AT ?auto_986228 ?auto_986231 ) ( CLEAR ?auto_986228 ) ( LIFTING ?auto_986230 ?auto_986229 ) ( IS-CRATE ?auto_986229 ) ( not ( = ?auto_986228 ?auto_986229 ) ) ( ON ?auto_986223 ?auto_986222 ) ( ON ?auto_986224 ?auto_986223 ) ( ON ?auto_986221 ?auto_986224 ) ( ON ?auto_986225 ?auto_986221 ) ( ON ?auto_986227 ?auto_986225 ) ( ON ?auto_986226 ?auto_986227 ) ( ON ?auto_986228 ?auto_986226 ) ( not ( = ?auto_986222 ?auto_986223 ) ) ( not ( = ?auto_986222 ?auto_986224 ) ) ( not ( = ?auto_986222 ?auto_986221 ) ) ( not ( = ?auto_986222 ?auto_986225 ) ) ( not ( = ?auto_986222 ?auto_986227 ) ) ( not ( = ?auto_986222 ?auto_986226 ) ) ( not ( = ?auto_986222 ?auto_986228 ) ) ( not ( = ?auto_986222 ?auto_986229 ) ) ( not ( = ?auto_986223 ?auto_986224 ) ) ( not ( = ?auto_986223 ?auto_986221 ) ) ( not ( = ?auto_986223 ?auto_986225 ) ) ( not ( = ?auto_986223 ?auto_986227 ) ) ( not ( = ?auto_986223 ?auto_986226 ) ) ( not ( = ?auto_986223 ?auto_986228 ) ) ( not ( = ?auto_986223 ?auto_986229 ) ) ( not ( = ?auto_986224 ?auto_986221 ) ) ( not ( = ?auto_986224 ?auto_986225 ) ) ( not ( = ?auto_986224 ?auto_986227 ) ) ( not ( = ?auto_986224 ?auto_986226 ) ) ( not ( = ?auto_986224 ?auto_986228 ) ) ( not ( = ?auto_986224 ?auto_986229 ) ) ( not ( = ?auto_986221 ?auto_986225 ) ) ( not ( = ?auto_986221 ?auto_986227 ) ) ( not ( = ?auto_986221 ?auto_986226 ) ) ( not ( = ?auto_986221 ?auto_986228 ) ) ( not ( = ?auto_986221 ?auto_986229 ) ) ( not ( = ?auto_986225 ?auto_986227 ) ) ( not ( = ?auto_986225 ?auto_986226 ) ) ( not ( = ?auto_986225 ?auto_986228 ) ) ( not ( = ?auto_986225 ?auto_986229 ) ) ( not ( = ?auto_986227 ?auto_986226 ) ) ( not ( = ?auto_986227 ?auto_986228 ) ) ( not ( = ?auto_986227 ?auto_986229 ) ) ( not ( = ?auto_986226 ?auto_986228 ) ) ( not ( = ?auto_986226 ?auto_986229 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_986228 ?auto_986229 )
      ( MAKE-8CRATE-VERIFY ?auto_986222 ?auto_986223 ?auto_986224 ?auto_986221 ?auto_986225 ?auto_986227 ?auto_986226 ?auto_986228 ?auto_986229 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986289 - SURFACE
      ?auto_986290 - SURFACE
      ?auto_986291 - SURFACE
      ?auto_986288 - SURFACE
      ?auto_986292 - SURFACE
      ?auto_986294 - SURFACE
      ?auto_986293 - SURFACE
      ?auto_986295 - SURFACE
      ?auto_986296 - SURFACE
    )
    :vars
    (
      ?auto_986299 - HOIST
      ?auto_986297 - PLACE
      ?auto_986298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986299 ?auto_986297 ) ( SURFACE-AT ?auto_986295 ?auto_986297 ) ( CLEAR ?auto_986295 ) ( IS-CRATE ?auto_986296 ) ( not ( = ?auto_986295 ?auto_986296 ) ) ( TRUCK-AT ?auto_986298 ?auto_986297 ) ( AVAILABLE ?auto_986299 ) ( IN ?auto_986296 ?auto_986298 ) ( ON ?auto_986295 ?auto_986293 ) ( not ( = ?auto_986293 ?auto_986295 ) ) ( not ( = ?auto_986293 ?auto_986296 ) ) ( ON ?auto_986290 ?auto_986289 ) ( ON ?auto_986291 ?auto_986290 ) ( ON ?auto_986288 ?auto_986291 ) ( ON ?auto_986292 ?auto_986288 ) ( ON ?auto_986294 ?auto_986292 ) ( ON ?auto_986293 ?auto_986294 ) ( not ( = ?auto_986289 ?auto_986290 ) ) ( not ( = ?auto_986289 ?auto_986291 ) ) ( not ( = ?auto_986289 ?auto_986288 ) ) ( not ( = ?auto_986289 ?auto_986292 ) ) ( not ( = ?auto_986289 ?auto_986294 ) ) ( not ( = ?auto_986289 ?auto_986293 ) ) ( not ( = ?auto_986289 ?auto_986295 ) ) ( not ( = ?auto_986289 ?auto_986296 ) ) ( not ( = ?auto_986290 ?auto_986291 ) ) ( not ( = ?auto_986290 ?auto_986288 ) ) ( not ( = ?auto_986290 ?auto_986292 ) ) ( not ( = ?auto_986290 ?auto_986294 ) ) ( not ( = ?auto_986290 ?auto_986293 ) ) ( not ( = ?auto_986290 ?auto_986295 ) ) ( not ( = ?auto_986290 ?auto_986296 ) ) ( not ( = ?auto_986291 ?auto_986288 ) ) ( not ( = ?auto_986291 ?auto_986292 ) ) ( not ( = ?auto_986291 ?auto_986294 ) ) ( not ( = ?auto_986291 ?auto_986293 ) ) ( not ( = ?auto_986291 ?auto_986295 ) ) ( not ( = ?auto_986291 ?auto_986296 ) ) ( not ( = ?auto_986288 ?auto_986292 ) ) ( not ( = ?auto_986288 ?auto_986294 ) ) ( not ( = ?auto_986288 ?auto_986293 ) ) ( not ( = ?auto_986288 ?auto_986295 ) ) ( not ( = ?auto_986288 ?auto_986296 ) ) ( not ( = ?auto_986292 ?auto_986294 ) ) ( not ( = ?auto_986292 ?auto_986293 ) ) ( not ( = ?auto_986292 ?auto_986295 ) ) ( not ( = ?auto_986292 ?auto_986296 ) ) ( not ( = ?auto_986294 ?auto_986293 ) ) ( not ( = ?auto_986294 ?auto_986295 ) ) ( not ( = ?auto_986294 ?auto_986296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986293 ?auto_986295 ?auto_986296 )
      ( MAKE-8CRATE-VERIFY ?auto_986289 ?auto_986290 ?auto_986291 ?auto_986288 ?auto_986292 ?auto_986294 ?auto_986293 ?auto_986295 ?auto_986296 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986365 - SURFACE
      ?auto_986366 - SURFACE
      ?auto_986367 - SURFACE
      ?auto_986364 - SURFACE
      ?auto_986368 - SURFACE
      ?auto_986370 - SURFACE
      ?auto_986369 - SURFACE
      ?auto_986371 - SURFACE
      ?auto_986372 - SURFACE
    )
    :vars
    (
      ?auto_986373 - HOIST
      ?auto_986376 - PLACE
      ?auto_986375 - TRUCK
      ?auto_986374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_986373 ?auto_986376 ) ( SURFACE-AT ?auto_986371 ?auto_986376 ) ( CLEAR ?auto_986371 ) ( IS-CRATE ?auto_986372 ) ( not ( = ?auto_986371 ?auto_986372 ) ) ( AVAILABLE ?auto_986373 ) ( IN ?auto_986372 ?auto_986375 ) ( ON ?auto_986371 ?auto_986369 ) ( not ( = ?auto_986369 ?auto_986371 ) ) ( not ( = ?auto_986369 ?auto_986372 ) ) ( TRUCK-AT ?auto_986375 ?auto_986374 ) ( not ( = ?auto_986374 ?auto_986376 ) ) ( ON ?auto_986366 ?auto_986365 ) ( ON ?auto_986367 ?auto_986366 ) ( ON ?auto_986364 ?auto_986367 ) ( ON ?auto_986368 ?auto_986364 ) ( ON ?auto_986370 ?auto_986368 ) ( ON ?auto_986369 ?auto_986370 ) ( not ( = ?auto_986365 ?auto_986366 ) ) ( not ( = ?auto_986365 ?auto_986367 ) ) ( not ( = ?auto_986365 ?auto_986364 ) ) ( not ( = ?auto_986365 ?auto_986368 ) ) ( not ( = ?auto_986365 ?auto_986370 ) ) ( not ( = ?auto_986365 ?auto_986369 ) ) ( not ( = ?auto_986365 ?auto_986371 ) ) ( not ( = ?auto_986365 ?auto_986372 ) ) ( not ( = ?auto_986366 ?auto_986367 ) ) ( not ( = ?auto_986366 ?auto_986364 ) ) ( not ( = ?auto_986366 ?auto_986368 ) ) ( not ( = ?auto_986366 ?auto_986370 ) ) ( not ( = ?auto_986366 ?auto_986369 ) ) ( not ( = ?auto_986366 ?auto_986371 ) ) ( not ( = ?auto_986366 ?auto_986372 ) ) ( not ( = ?auto_986367 ?auto_986364 ) ) ( not ( = ?auto_986367 ?auto_986368 ) ) ( not ( = ?auto_986367 ?auto_986370 ) ) ( not ( = ?auto_986367 ?auto_986369 ) ) ( not ( = ?auto_986367 ?auto_986371 ) ) ( not ( = ?auto_986367 ?auto_986372 ) ) ( not ( = ?auto_986364 ?auto_986368 ) ) ( not ( = ?auto_986364 ?auto_986370 ) ) ( not ( = ?auto_986364 ?auto_986369 ) ) ( not ( = ?auto_986364 ?auto_986371 ) ) ( not ( = ?auto_986364 ?auto_986372 ) ) ( not ( = ?auto_986368 ?auto_986370 ) ) ( not ( = ?auto_986368 ?auto_986369 ) ) ( not ( = ?auto_986368 ?auto_986371 ) ) ( not ( = ?auto_986368 ?auto_986372 ) ) ( not ( = ?auto_986370 ?auto_986369 ) ) ( not ( = ?auto_986370 ?auto_986371 ) ) ( not ( = ?auto_986370 ?auto_986372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986369 ?auto_986371 ?auto_986372 )
      ( MAKE-8CRATE-VERIFY ?auto_986365 ?auto_986366 ?auto_986367 ?auto_986364 ?auto_986368 ?auto_986370 ?auto_986369 ?auto_986371 ?auto_986372 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986449 - SURFACE
      ?auto_986450 - SURFACE
      ?auto_986451 - SURFACE
      ?auto_986448 - SURFACE
      ?auto_986452 - SURFACE
      ?auto_986454 - SURFACE
      ?auto_986453 - SURFACE
      ?auto_986455 - SURFACE
      ?auto_986456 - SURFACE
    )
    :vars
    (
      ?auto_986457 - HOIST
      ?auto_986460 - PLACE
      ?auto_986459 - TRUCK
      ?auto_986458 - PLACE
      ?auto_986461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_986457 ?auto_986460 ) ( SURFACE-AT ?auto_986455 ?auto_986460 ) ( CLEAR ?auto_986455 ) ( IS-CRATE ?auto_986456 ) ( not ( = ?auto_986455 ?auto_986456 ) ) ( AVAILABLE ?auto_986457 ) ( ON ?auto_986455 ?auto_986453 ) ( not ( = ?auto_986453 ?auto_986455 ) ) ( not ( = ?auto_986453 ?auto_986456 ) ) ( TRUCK-AT ?auto_986459 ?auto_986458 ) ( not ( = ?auto_986458 ?auto_986460 ) ) ( HOIST-AT ?auto_986461 ?auto_986458 ) ( LIFTING ?auto_986461 ?auto_986456 ) ( not ( = ?auto_986457 ?auto_986461 ) ) ( ON ?auto_986450 ?auto_986449 ) ( ON ?auto_986451 ?auto_986450 ) ( ON ?auto_986448 ?auto_986451 ) ( ON ?auto_986452 ?auto_986448 ) ( ON ?auto_986454 ?auto_986452 ) ( ON ?auto_986453 ?auto_986454 ) ( not ( = ?auto_986449 ?auto_986450 ) ) ( not ( = ?auto_986449 ?auto_986451 ) ) ( not ( = ?auto_986449 ?auto_986448 ) ) ( not ( = ?auto_986449 ?auto_986452 ) ) ( not ( = ?auto_986449 ?auto_986454 ) ) ( not ( = ?auto_986449 ?auto_986453 ) ) ( not ( = ?auto_986449 ?auto_986455 ) ) ( not ( = ?auto_986449 ?auto_986456 ) ) ( not ( = ?auto_986450 ?auto_986451 ) ) ( not ( = ?auto_986450 ?auto_986448 ) ) ( not ( = ?auto_986450 ?auto_986452 ) ) ( not ( = ?auto_986450 ?auto_986454 ) ) ( not ( = ?auto_986450 ?auto_986453 ) ) ( not ( = ?auto_986450 ?auto_986455 ) ) ( not ( = ?auto_986450 ?auto_986456 ) ) ( not ( = ?auto_986451 ?auto_986448 ) ) ( not ( = ?auto_986451 ?auto_986452 ) ) ( not ( = ?auto_986451 ?auto_986454 ) ) ( not ( = ?auto_986451 ?auto_986453 ) ) ( not ( = ?auto_986451 ?auto_986455 ) ) ( not ( = ?auto_986451 ?auto_986456 ) ) ( not ( = ?auto_986448 ?auto_986452 ) ) ( not ( = ?auto_986448 ?auto_986454 ) ) ( not ( = ?auto_986448 ?auto_986453 ) ) ( not ( = ?auto_986448 ?auto_986455 ) ) ( not ( = ?auto_986448 ?auto_986456 ) ) ( not ( = ?auto_986452 ?auto_986454 ) ) ( not ( = ?auto_986452 ?auto_986453 ) ) ( not ( = ?auto_986452 ?auto_986455 ) ) ( not ( = ?auto_986452 ?auto_986456 ) ) ( not ( = ?auto_986454 ?auto_986453 ) ) ( not ( = ?auto_986454 ?auto_986455 ) ) ( not ( = ?auto_986454 ?auto_986456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986453 ?auto_986455 ?auto_986456 )
      ( MAKE-8CRATE-VERIFY ?auto_986449 ?auto_986450 ?auto_986451 ?auto_986448 ?auto_986452 ?auto_986454 ?auto_986453 ?auto_986455 ?auto_986456 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986541 - SURFACE
      ?auto_986542 - SURFACE
      ?auto_986543 - SURFACE
      ?auto_986540 - SURFACE
      ?auto_986544 - SURFACE
      ?auto_986546 - SURFACE
      ?auto_986545 - SURFACE
      ?auto_986547 - SURFACE
      ?auto_986548 - SURFACE
    )
    :vars
    (
      ?auto_986550 - HOIST
      ?auto_986551 - PLACE
      ?auto_986554 - TRUCK
      ?auto_986549 - PLACE
      ?auto_986553 - HOIST
      ?auto_986552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_986550 ?auto_986551 ) ( SURFACE-AT ?auto_986547 ?auto_986551 ) ( CLEAR ?auto_986547 ) ( IS-CRATE ?auto_986548 ) ( not ( = ?auto_986547 ?auto_986548 ) ) ( AVAILABLE ?auto_986550 ) ( ON ?auto_986547 ?auto_986545 ) ( not ( = ?auto_986545 ?auto_986547 ) ) ( not ( = ?auto_986545 ?auto_986548 ) ) ( TRUCK-AT ?auto_986554 ?auto_986549 ) ( not ( = ?auto_986549 ?auto_986551 ) ) ( HOIST-AT ?auto_986553 ?auto_986549 ) ( not ( = ?auto_986550 ?auto_986553 ) ) ( AVAILABLE ?auto_986553 ) ( SURFACE-AT ?auto_986548 ?auto_986549 ) ( ON ?auto_986548 ?auto_986552 ) ( CLEAR ?auto_986548 ) ( not ( = ?auto_986547 ?auto_986552 ) ) ( not ( = ?auto_986548 ?auto_986552 ) ) ( not ( = ?auto_986545 ?auto_986552 ) ) ( ON ?auto_986542 ?auto_986541 ) ( ON ?auto_986543 ?auto_986542 ) ( ON ?auto_986540 ?auto_986543 ) ( ON ?auto_986544 ?auto_986540 ) ( ON ?auto_986546 ?auto_986544 ) ( ON ?auto_986545 ?auto_986546 ) ( not ( = ?auto_986541 ?auto_986542 ) ) ( not ( = ?auto_986541 ?auto_986543 ) ) ( not ( = ?auto_986541 ?auto_986540 ) ) ( not ( = ?auto_986541 ?auto_986544 ) ) ( not ( = ?auto_986541 ?auto_986546 ) ) ( not ( = ?auto_986541 ?auto_986545 ) ) ( not ( = ?auto_986541 ?auto_986547 ) ) ( not ( = ?auto_986541 ?auto_986548 ) ) ( not ( = ?auto_986541 ?auto_986552 ) ) ( not ( = ?auto_986542 ?auto_986543 ) ) ( not ( = ?auto_986542 ?auto_986540 ) ) ( not ( = ?auto_986542 ?auto_986544 ) ) ( not ( = ?auto_986542 ?auto_986546 ) ) ( not ( = ?auto_986542 ?auto_986545 ) ) ( not ( = ?auto_986542 ?auto_986547 ) ) ( not ( = ?auto_986542 ?auto_986548 ) ) ( not ( = ?auto_986542 ?auto_986552 ) ) ( not ( = ?auto_986543 ?auto_986540 ) ) ( not ( = ?auto_986543 ?auto_986544 ) ) ( not ( = ?auto_986543 ?auto_986546 ) ) ( not ( = ?auto_986543 ?auto_986545 ) ) ( not ( = ?auto_986543 ?auto_986547 ) ) ( not ( = ?auto_986543 ?auto_986548 ) ) ( not ( = ?auto_986543 ?auto_986552 ) ) ( not ( = ?auto_986540 ?auto_986544 ) ) ( not ( = ?auto_986540 ?auto_986546 ) ) ( not ( = ?auto_986540 ?auto_986545 ) ) ( not ( = ?auto_986540 ?auto_986547 ) ) ( not ( = ?auto_986540 ?auto_986548 ) ) ( not ( = ?auto_986540 ?auto_986552 ) ) ( not ( = ?auto_986544 ?auto_986546 ) ) ( not ( = ?auto_986544 ?auto_986545 ) ) ( not ( = ?auto_986544 ?auto_986547 ) ) ( not ( = ?auto_986544 ?auto_986548 ) ) ( not ( = ?auto_986544 ?auto_986552 ) ) ( not ( = ?auto_986546 ?auto_986545 ) ) ( not ( = ?auto_986546 ?auto_986547 ) ) ( not ( = ?auto_986546 ?auto_986548 ) ) ( not ( = ?auto_986546 ?auto_986552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986545 ?auto_986547 ?auto_986548 )
      ( MAKE-8CRATE-VERIFY ?auto_986541 ?auto_986542 ?auto_986543 ?auto_986540 ?auto_986544 ?auto_986546 ?auto_986545 ?auto_986547 ?auto_986548 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986634 - SURFACE
      ?auto_986635 - SURFACE
      ?auto_986636 - SURFACE
      ?auto_986633 - SURFACE
      ?auto_986637 - SURFACE
      ?auto_986639 - SURFACE
      ?auto_986638 - SURFACE
      ?auto_986640 - SURFACE
      ?auto_986641 - SURFACE
    )
    :vars
    (
      ?auto_986642 - HOIST
      ?auto_986643 - PLACE
      ?auto_986645 - PLACE
      ?auto_986646 - HOIST
      ?auto_986644 - SURFACE
      ?auto_986647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986642 ?auto_986643 ) ( SURFACE-AT ?auto_986640 ?auto_986643 ) ( CLEAR ?auto_986640 ) ( IS-CRATE ?auto_986641 ) ( not ( = ?auto_986640 ?auto_986641 ) ) ( AVAILABLE ?auto_986642 ) ( ON ?auto_986640 ?auto_986638 ) ( not ( = ?auto_986638 ?auto_986640 ) ) ( not ( = ?auto_986638 ?auto_986641 ) ) ( not ( = ?auto_986645 ?auto_986643 ) ) ( HOIST-AT ?auto_986646 ?auto_986645 ) ( not ( = ?auto_986642 ?auto_986646 ) ) ( AVAILABLE ?auto_986646 ) ( SURFACE-AT ?auto_986641 ?auto_986645 ) ( ON ?auto_986641 ?auto_986644 ) ( CLEAR ?auto_986641 ) ( not ( = ?auto_986640 ?auto_986644 ) ) ( not ( = ?auto_986641 ?auto_986644 ) ) ( not ( = ?auto_986638 ?auto_986644 ) ) ( TRUCK-AT ?auto_986647 ?auto_986643 ) ( ON ?auto_986635 ?auto_986634 ) ( ON ?auto_986636 ?auto_986635 ) ( ON ?auto_986633 ?auto_986636 ) ( ON ?auto_986637 ?auto_986633 ) ( ON ?auto_986639 ?auto_986637 ) ( ON ?auto_986638 ?auto_986639 ) ( not ( = ?auto_986634 ?auto_986635 ) ) ( not ( = ?auto_986634 ?auto_986636 ) ) ( not ( = ?auto_986634 ?auto_986633 ) ) ( not ( = ?auto_986634 ?auto_986637 ) ) ( not ( = ?auto_986634 ?auto_986639 ) ) ( not ( = ?auto_986634 ?auto_986638 ) ) ( not ( = ?auto_986634 ?auto_986640 ) ) ( not ( = ?auto_986634 ?auto_986641 ) ) ( not ( = ?auto_986634 ?auto_986644 ) ) ( not ( = ?auto_986635 ?auto_986636 ) ) ( not ( = ?auto_986635 ?auto_986633 ) ) ( not ( = ?auto_986635 ?auto_986637 ) ) ( not ( = ?auto_986635 ?auto_986639 ) ) ( not ( = ?auto_986635 ?auto_986638 ) ) ( not ( = ?auto_986635 ?auto_986640 ) ) ( not ( = ?auto_986635 ?auto_986641 ) ) ( not ( = ?auto_986635 ?auto_986644 ) ) ( not ( = ?auto_986636 ?auto_986633 ) ) ( not ( = ?auto_986636 ?auto_986637 ) ) ( not ( = ?auto_986636 ?auto_986639 ) ) ( not ( = ?auto_986636 ?auto_986638 ) ) ( not ( = ?auto_986636 ?auto_986640 ) ) ( not ( = ?auto_986636 ?auto_986641 ) ) ( not ( = ?auto_986636 ?auto_986644 ) ) ( not ( = ?auto_986633 ?auto_986637 ) ) ( not ( = ?auto_986633 ?auto_986639 ) ) ( not ( = ?auto_986633 ?auto_986638 ) ) ( not ( = ?auto_986633 ?auto_986640 ) ) ( not ( = ?auto_986633 ?auto_986641 ) ) ( not ( = ?auto_986633 ?auto_986644 ) ) ( not ( = ?auto_986637 ?auto_986639 ) ) ( not ( = ?auto_986637 ?auto_986638 ) ) ( not ( = ?auto_986637 ?auto_986640 ) ) ( not ( = ?auto_986637 ?auto_986641 ) ) ( not ( = ?auto_986637 ?auto_986644 ) ) ( not ( = ?auto_986639 ?auto_986638 ) ) ( not ( = ?auto_986639 ?auto_986640 ) ) ( not ( = ?auto_986639 ?auto_986641 ) ) ( not ( = ?auto_986639 ?auto_986644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986638 ?auto_986640 ?auto_986641 )
      ( MAKE-8CRATE-VERIFY ?auto_986634 ?auto_986635 ?auto_986636 ?auto_986633 ?auto_986637 ?auto_986639 ?auto_986638 ?auto_986640 ?auto_986641 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986727 - SURFACE
      ?auto_986728 - SURFACE
      ?auto_986729 - SURFACE
      ?auto_986726 - SURFACE
      ?auto_986730 - SURFACE
      ?auto_986732 - SURFACE
      ?auto_986731 - SURFACE
      ?auto_986733 - SURFACE
      ?auto_986734 - SURFACE
    )
    :vars
    (
      ?auto_986740 - HOIST
      ?auto_986735 - PLACE
      ?auto_986739 - PLACE
      ?auto_986737 - HOIST
      ?auto_986736 - SURFACE
      ?auto_986738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986740 ?auto_986735 ) ( IS-CRATE ?auto_986734 ) ( not ( = ?auto_986733 ?auto_986734 ) ) ( not ( = ?auto_986731 ?auto_986733 ) ) ( not ( = ?auto_986731 ?auto_986734 ) ) ( not ( = ?auto_986739 ?auto_986735 ) ) ( HOIST-AT ?auto_986737 ?auto_986739 ) ( not ( = ?auto_986740 ?auto_986737 ) ) ( AVAILABLE ?auto_986737 ) ( SURFACE-AT ?auto_986734 ?auto_986739 ) ( ON ?auto_986734 ?auto_986736 ) ( CLEAR ?auto_986734 ) ( not ( = ?auto_986733 ?auto_986736 ) ) ( not ( = ?auto_986734 ?auto_986736 ) ) ( not ( = ?auto_986731 ?auto_986736 ) ) ( TRUCK-AT ?auto_986738 ?auto_986735 ) ( SURFACE-AT ?auto_986731 ?auto_986735 ) ( CLEAR ?auto_986731 ) ( LIFTING ?auto_986740 ?auto_986733 ) ( IS-CRATE ?auto_986733 ) ( ON ?auto_986728 ?auto_986727 ) ( ON ?auto_986729 ?auto_986728 ) ( ON ?auto_986726 ?auto_986729 ) ( ON ?auto_986730 ?auto_986726 ) ( ON ?auto_986732 ?auto_986730 ) ( ON ?auto_986731 ?auto_986732 ) ( not ( = ?auto_986727 ?auto_986728 ) ) ( not ( = ?auto_986727 ?auto_986729 ) ) ( not ( = ?auto_986727 ?auto_986726 ) ) ( not ( = ?auto_986727 ?auto_986730 ) ) ( not ( = ?auto_986727 ?auto_986732 ) ) ( not ( = ?auto_986727 ?auto_986731 ) ) ( not ( = ?auto_986727 ?auto_986733 ) ) ( not ( = ?auto_986727 ?auto_986734 ) ) ( not ( = ?auto_986727 ?auto_986736 ) ) ( not ( = ?auto_986728 ?auto_986729 ) ) ( not ( = ?auto_986728 ?auto_986726 ) ) ( not ( = ?auto_986728 ?auto_986730 ) ) ( not ( = ?auto_986728 ?auto_986732 ) ) ( not ( = ?auto_986728 ?auto_986731 ) ) ( not ( = ?auto_986728 ?auto_986733 ) ) ( not ( = ?auto_986728 ?auto_986734 ) ) ( not ( = ?auto_986728 ?auto_986736 ) ) ( not ( = ?auto_986729 ?auto_986726 ) ) ( not ( = ?auto_986729 ?auto_986730 ) ) ( not ( = ?auto_986729 ?auto_986732 ) ) ( not ( = ?auto_986729 ?auto_986731 ) ) ( not ( = ?auto_986729 ?auto_986733 ) ) ( not ( = ?auto_986729 ?auto_986734 ) ) ( not ( = ?auto_986729 ?auto_986736 ) ) ( not ( = ?auto_986726 ?auto_986730 ) ) ( not ( = ?auto_986726 ?auto_986732 ) ) ( not ( = ?auto_986726 ?auto_986731 ) ) ( not ( = ?auto_986726 ?auto_986733 ) ) ( not ( = ?auto_986726 ?auto_986734 ) ) ( not ( = ?auto_986726 ?auto_986736 ) ) ( not ( = ?auto_986730 ?auto_986732 ) ) ( not ( = ?auto_986730 ?auto_986731 ) ) ( not ( = ?auto_986730 ?auto_986733 ) ) ( not ( = ?auto_986730 ?auto_986734 ) ) ( not ( = ?auto_986730 ?auto_986736 ) ) ( not ( = ?auto_986732 ?auto_986731 ) ) ( not ( = ?auto_986732 ?auto_986733 ) ) ( not ( = ?auto_986732 ?auto_986734 ) ) ( not ( = ?auto_986732 ?auto_986736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986731 ?auto_986733 ?auto_986734 )
      ( MAKE-8CRATE-VERIFY ?auto_986727 ?auto_986728 ?auto_986729 ?auto_986726 ?auto_986730 ?auto_986732 ?auto_986731 ?auto_986733 ?auto_986734 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986820 - SURFACE
      ?auto_986821 - SURFACE
      ?auto_986822 - SURFACE
      ?auto_986819 - SURFACE
      ?auto_986823 - SURFACE
      ?auto_986825 - SURFACE
      ?auto_986824 - SURFACE
      ?auto_986826 - SURFACE
      ?auto_986827 - SURFACE
    )
    :vars
    (
      ?auto_986833 - HOIST
      ?auto_986832 - PLACE
      ?auto_986830 - PLACE
      ?auto_986828 - HOIST
      ?auto_986829 - SURFACE
      ?auto_986831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986833 ?auto_986832 ) ( IS-CRATE ?auto_986827 ) ( not ( = ?auto_986826 ?auto_986827 ) ) ( not ( = ?auto_986824 ?auto_986826 ) ) ( not ( = ?auto_986824 ?auto_986827 ) ) ( not ( = ?auto_986830 ?auto_986832 ) ) ( HOIST-AT ?auto_986828 ?auto_986830 ) ( not ( = ?auto_986833 ?auto_986828 ) ) ( AVAILABLE ?auto_986828 ) ( SURFACE-AT ?auto_986827 ?auto_986830 ) ( ON ?auto_986827 ?auto_986829 ) ( CLEAR ?auto_986827 ) ( not ( = ?auto_986826 ?auto_986829 ) ) ( not ( = ?auto_986827 ?auto_986829 ) ) ( not ( = ?auto_986824 ?auto_986829 ) ) ( TRUCK-AT ?auto_986831 ?auto_986832 ) ( SURFACE-AT ?auto_986824 ?auto_986832 ) ( CLEAR ?auto_986824 ) ( IS-CRATE ?auto_986826 ) ( AVAILABLE ?auto_986833 ) ( IN ?auto_986826 ?auto_986831 ) ( ON ?auto_986821 ?auto_986820 ) ( ON ?auto_986822 ?auto_986821 ) ( ON ?auto_986819 ?auto_986822 ) ( ON ?auto_986823 ?auto_986819 ) ( ON ?auto_986825 ?auto_986823 ) ( ON ?auto_986824 ?auto_986825 ) ( not ( = ?auto_986820 ?auto_986821 ) ) ( not ( = ?auto_986820 ?auto_986822 ) ) ( not ( = ?auto_986820 ?auto_986819 ) ) ( not ( = ?auto_986820 ?auto_986823 ) ) ( not ( = ?auto_986820 ?auto_986825 ) ) ( not ( = ?auto_986820 ?auto_986824 ) ) ( not ( = ?auto_986820 ?auto_986826 ) ) ( not ( = ?auto_986820 ?auto_986827 ) ) ( not ( = ?auto_986820 ?auto_986829 ) ) ( not ( = ?auto_986821 ?auto_986822 ) ) ( not ( = ?auto_986821 ?auto_986819 ) ) ( not ( = ?auto_986821 ?auto_986823 ) ) ( not ( = ?auto_986821 ?auto_986825 ) ) ( not ( = ?auto_986821 ?auto_986824 ) ) ( not ( = ?auto_986821 ?auto_986826 ) ) ( not ( = ?auto_986821 ?auto_986827 ) ) ( not ( = ?auto_986821 ?auto_986829 ) ) ( not ( = ?auto_986822 ?auto_986819 ) ) ( not ( = ?auto_986822 ?auto_986823 ) ) ( not ( = ?auto_986822 ?auto_986825 ) ) ( not ( = ?auto_986822 ?auto_986824 ) ) ( not ( = ?auto_986822 ?auto_986826 ) ) ( not ( = ?auto_986822 ?auto_986827 ) ) ( not ( = ?auto_986822 ?auto_986829 ) ) ( not ( = ?auto_986819 ?auto_986823 ) ) ( not ( = ?auto_986819 ?auto_986825 ) ) ( not ( = ?auto_986819 ?auto_986824 ) ) ( not ( = ?auto_986819 ?auto_986826 ) ) ( not ( = ?auto_986819 ?auto_986827 ) ) ( not ( = ?auto_986819 ?auto_986829 ) ) ( not ( = ?auto_986823 ?auto_986825 ) ) ( not ( = ?auto_986823 ?auto_986824 ) ) ( not ( = ?auto_986823 ?auto_986826 ) ) ( not ( = ?auto_986823 ?auto_986827 ) ) ( not ( = ?auto_986823 ?auto_986829 ) ) ( not ( = ?auto_986825 ?auto_986824 ) ) ( not ( = ?auto_986825 ?auto_986826 ) ) ( not ( = ?auto_986825 ?auto_986827 ) ) ( not ( = ?auto_986825 ?auto_986829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986824 ?auto_986826 ?auto_986827 )
      ( MAKE-8CRATE-VERIFY ?auto_986820 ?auto_986821 ?auto_986822 ?auto_986819 ?auto_986823 ?auto_986825 ?auto_986824 ?auto_986826 ?auto_986827 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990926 - SURFACE
      ?auto_990927 - SURFACE
      ?auto_990928 - SURFACE
      ?auto_990925 - SURFACE
      ?auto_990929 - SURFACE
      ?auto_990931 - SURFACE
      ?auto_990930 - SURFACE
      ?auto_990932 - SURFACE
      ?auto_990933 - SURFACE
      ?auto_990934 - SURFACE
    )
    :vars
    (
      ?auto_990936 - HOIST
      ?auto_990935 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_990936 ?auto_990935 ) ( SURFACE-AT ?auto_990933 ?auto_990935 ) ( CLEAR ?auto_990933 ) ( LIFTING ?auto_990936 ?auto_990934 ) ( IS-CRATE ?auto_990934 ) ( not ( = ?auto_990933 ?auto_990934 ) ) ( ON ?auto_990927 ?auto_990926 ) ( ON ?auto_990928 ?auto_990927 ) ( ON ?auto_990925 ?auto_990928 ) ( ON ?auto_990929 ?auto_990925 ) ( ON ?auto_990931 ?auto_990929 ) ( ON ?auto_990930 ?auto_990931 ) ( ON ?auto_990932 ?auto_990930 ) ( ON ?auto_990933 ?auto_990932 ) ( not ( = ?auto_990926 ?auto_990927 ) ) ( not ( = ?auto_990926 ?auto_990928 ) ) ( not ( = ?auto_990926 ?auto_990925 ) ) ( not ( = ?auto_990926 ?auto_990929 ) ) ( not ( = ?auto_990926 ?auto_990931 ) ) ( not ( = ?auto_990926 ?auto_990930 ) ) ( not ( = ?auto_990926 ?auto_990932 ) ) ( not ( = ?auto_990926 ?auto_990933 ) ) ( not ( = ?auto_990926 ?auto_990934 ) ) ( not ( = ?auto_990927 ?auto_990928 ) ) ( not ( = ?auto_990927 ?auto_990925 ) ) ( not ( = ?auto_990927 ?auto_990929 ) ) ( not ( = ?auto_990927 ?auto_990931 ) ) ( not ( = ?auto_990927 ?auto_990930 ) ) ( not ( = ?auto_990927 ?auto_990932 ) ) ( not ( = ?auto_990927 ?auto_990933 ) ) ( not ( = ?auto_990927 ?auto_990934 ) ) ( not ( = ?auto_990928 ?auto_990925 ) ) ( not ( = ?auto_990928 ?auto_990929 ) ) ( not ( = ?auto_990928 ?auto_990931 ) ) ( not ( = ?auto_990928 ?auto_990930 ) ) ( not ( = ?auto_990928 ?auto_990932 ) ) ( not ( = ?auto_990928 ?auto_990933 ) ) ( not ( = ?auto_990928 ?auto_990934 ) ) ( not ( = ?auto_990925 ?auto_990929 ) ) ( not ( = ?auto_990925 ?auto_990931 ) ) ( not ( = ?auto_990925 ?auto_990930 ) ) ( not ( = ?auto_990925 ?auto_990932 ) ) ( not ( = ?auto_990925 ?auto_990933 ) ) ( not ( = ?auto_990925 ?auto_990934 ) ) ( not ( = ?auto_990929 ?auto_990931 ) ) ( not ( = ?auto_990929 ?auto_990930 ) ) ( not ( = ?auto_990929 ?auto_990932 ) ) ( not ( = ?auto_990929 ?auto_990933 ) ) ( not ( = ?auto_990929 ?auto_990934 ) ) ( not ( = ?auto_990931 ?auto_990930 ) ) ( not ( = ?auto_990931 ?auto_990932 ) ) ( not ( = ?auto_990931 ?auto_990933 ) ) ( not ( = ?auto_990931 ?auto_990934 ) ) ( not ( = ?auto_990930 ?auto_990932 ) ) ( not ( = ?auto_990930 ?auto_990933 ) ) ( not ( = ?auto_990930 ?auto_990934 ) ) ( not ( = ?auto_990932 ?auto_990933 ) ) ( not ( = ?auto_990932 ?auto_990934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_990933 ?auto_990934 )
      ( MAKE-9CRATE-VERIFY ?auto_990926 ?auto_990927 ?auto_990928 ?auto_990925 ?auto_990929 ?auto_990931 ?auto_990930 ?auto_990932 ?auto_990933 ?auto_990934 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991006 - SURFACE
      ?auto_991007 - SURFACE
      ?auto_991008 - SURFACE
      ?auto_991005 - SURFACE
      ?auto_991009 - SURFACE
      ?auto_991011 - SURFACE
      ?auto_991010 - SURFACE
      ?auto_991012 - SURFACE
      ?auto_991013 - SURFACE
      ?auto_991014 - SURFACE
    )
    :vars
    (
      ?auto_991016 - HOIST
      ?auto_991015 - PLACE
      ?auto_991017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991016 ?auto_991015 ) ( SURFACE-AT ?auto_991013 ?auto_991015 ) ( CLEAR ?auto_991013 ) ( IS-CRATE ?auto_991014 ) ( not ( = ?auto_991013 ?auto_991014 ) ) ( TRUCK-AT ?auto_991017 ?auto_991015 ) ( AVAILABLE ?auto_991016 ) ( IN ?auto_991014 ?auto_991017 ) ( ON ?auto_991013 ?auto_991012 ) ( not ( = ?auto_991012 ?auto_991013 ) ) ( not ( = ?auto_991012 ?auto_991014 ) ) ( ON ?auto_991007 ?auto_991006 ) ( ON ?auto_991008 ?auto_991007 ) ( ON ?auto_991005 ?auto_991008 ) ( ON ?auto_991009 ?auto_991005 ) ( ON ?auto_991011 ?auto_991009 ) ( ON ?auto_991010 ?auto_991011 ) ( ON ?auto_991012 ?auto_991010 ) ( not ( = ?auto_991006 ?auto_991007 ) ) ( not ( = ?auto_991006 ?auto_991008 ) ) ( not ( = ?auto_991006 ?auto_991005 ) ) ( not ( = ?auto_991006 ?auto_991009 ) ) ( not ( = ?auto_991006 ?auto_991011 ) ) ( not ( = ?auto_991006 ?auto_991010 ) ) ( not ( = ?auto_991006 ?auto_991012 ) ) ( not ( = ?auto_991006 ?auto_991013 ) ) ( not ( = ?auto_991006 ?auto_991014 ) ) ( not ( = ?auto_991007 ?auto_991008 ) ) ( not ( = ?auto_991007 ?auto_991005 ) ) ( not ( = ?auto_991007 ?auto_991009 ) ) ( not ( = ?auto_991007 ?auto_991011 ) ) ( not ( = ?auto_991007 ?auto_991010 ) ) ( not ( = ?auto_991007 ?auto_991012 ) ) ( not ( = ?auto_991007 ?auto_991013 ) ) ( not ( = ?auto_991007 ?auto_991014 ) ) ( not ( = ?auto_991008 ?auto_991005 ) ) ( not ( = ?auto_991008 ?auto_991009 ) ) ( not ( = ?auto_991008 ?auto_991011 ) ) ( not ( = ?auto_991008 ?auto_991010 ) ) ( not ( = ?auto_991008 ?auto_991012 ) ) ( not ( = ?auto_991008 ?auto_991013 ) ) ( not ( = ?auto_991008 ?auto_991014 ) ) ( not ( = ?auto_991005 ?auto_991009 ) ) ( not ( = ?auto_991005 ?auto_991011 ) ) ( not ( = ?auto_991005 ?auto_991010 ) ) ( not ( = ?auto_991005 ?auto_991012 ) ) ( not ( = ?auto_991005 ?auto_991013 ) ) ( not ( = ?auto_991005 ?auto_991014 ) ) ( not ( = ?auto_991009 ?auto_991011 ) ) ( not ( = ?auto_991009 ?auto_991010 ) ) ( not ( = ?auto_991009 ?auto_991012 ) ) ( not ( = ?auto_991009 ?auto_991013 ) ) ( not ( = ?auto_991009 ?auto_991014 ) ) ( not ( = ?auto_991011 ?auto_991010 ) ) ( not ( = ?auto_991011 ?auto_991012 ) ) ( not ( = ?auto_991011 ?auto_991013 ) ) ( not ( = ?auto_991011 ?auto_991014 ) ) ( not ( = ?auto_991010 ?auto_991012 ) ) ( not ( = ?auto_991010 ?auto_991013 ) ) ( not ( = ?auto_991010 ?auto_991014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991012 ?auto_991013 ?auto_991014 )
      ( MAKE-9CRATE-VERIFY ?auto_991006 ?auto_991007 ?auto_991008 ?auto_991005 ?auto_991009 ?auto_991011 ?auto_991010 ?auto_991012 ?auto_991013 ?auto_991014 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991096 - SURFACE
      ?auto_991097 - SURFACE
      ?auto_991098 - SURFACE
      ?auto_991095 - SURFACE
      ?auto_991099 - SURFACE
      ?auto_991101 - SURFACE
      ?auto_991100 - SURFACE
      ?auto_991102 - SURFACE
      ?auto_991103 - SURFACE
      ?auto_991104 - SURFACE
    )
    :vars
    (
      ?auto_991105 - HOIST
      ?auto_991107 - PLACE
      ?auto_991108 - TRUCK
      ?auto_991106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_991105 ?auto_991107 ) ( SURFACE-AT ?auto_991103 ?auto_991107 ) ( CLEAR ?auto_991103 ) ( IS-CRATE ?auto_991104 ) ( not ( = ?auto_991103 ?auto_991104 ) ) ( AVAILABLE ?auto_991105 ) ( IN ?auto_991104 ?auto_991108 ) ( ON ?auto_991103 ?auto_991102 ) ( not ( = ?auto_991102 ?auto_991103 ) ) ( not ( = ?auto_991102 ?auto_991104 ) ) ( TRUCK-AT ?auto_991108 ?auto_991106 ) ( not ( = ?auto_991106 ?auto_991107 ) ) ( ON ?auto_991097 ?auto_991096 ) ( ON ?auto_991098 ?auto_991097 ) ( ON ?auto_991095 ?auto_991098 ) ( ON ?auto_991099 ?auto_991095 ) ( ON ?auto_991101 ?auto_991099 ) ( ON ?auto_991100 ?auto_991101 ) ( ON ?auto_991102 ?auto_991100 ) ( not ( = ?auto_991096 ?auto_991097 ) ) ( not ( = ?auto_991096 ?auto_991098 ) ) ( not ( = ?auto_991096 ?auto_991095 ) ) ( not ( = ?auto_991096 ?auto_991099 ) ) ( not ( = ?auto_991096 ?auto_991101 ) ) ( not ( = ?auto_991096 ?auto_991100 ) ) ( not ( = ?auto_991096 ?auto_991102 ) ) ( not ( = ?auto_991096 ?auto_991103 ) ) ( not ( = ?auto_991096 ?auto_991104 ) ) ( not ( = ?auto_991097 ?auto_991098 ) ) ( not ( = ?auto_991097 ?auto_991095 ) ) ( not ( = ?auto_991097 ?auto_991099 ) ) ( not ( = ?auto_991097 ?auto_991101 ) ) ( not ( = ?auto_991097 ?auto_991100 ) ) ( not ( = ?auto_991097 ?auto_991102 ) ) ( not ( = ?auto_991097 ?auto_991103 ) ) ( not ( = ?auto_991097 ?auto_991104 ) ) ( not ( = ?auto_991098 ?auto_991095 ) ) ( not ( = ?auto_991098 ?auto_991099 ) ) ( not ( = ?auto_991098 ?auto_991101 ) ) ( not ( = ?auto_991098 ?auto_991100 ) ) ( not ( = ?auto_991098 ?auto_991102 ) ) ( not ( = ?auto_991098 ?auto_991103 ) ) ( not ( = ?auto_991098 ?auto_991104 ) ) ( not ( = ?auto_991095 ?auto_991099 ) ) ( not ( = ?auto_991095 ?auto_991101 ) ) ( not ( = ?auto_991095 ?auto_991100 ) ) ( not ( = ?auto_991095 ?auto_991102 ) ) ( not ( = ?auto_991095 ?auto_991103 ) ) ( not ( = ?auto_991095 ?auto_991104 ) ) ( not ( = ?auto_991099 ?auto_991101 ) ) ( not ( = ?auto_991099 ?auto_991100 ) ) ( not ( = ?auto_991099 ?auto_991102 ) ) ( not ( = ?auto_991099 ?auto_991103 ) ) ( not ( = ?auto_991099 ?auto_991104 ) ) ( not ( = ?auto_991101 ?auto_991100 ) ) ( not ( = ?auto_991101 ?auto_991102 ) ) ( not ( = ?auto_991101 ?auto_991103 ) ) ( not ( = ?auto_991101 ?auto_991104 ) ) ( not ( = ?auto_991100 ?auto_991102 ) ) ( not ( = ?auto_991100 ?auto_991103 ) ) ( not ( = ?auto_991100 ?auto_991104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991102 ?auto_991103 ?auto_991104 )
      ( MAKE-9CRATE-VERIFY ?auto_991096 ?auto_991097 ?auto_991098 ?auto_991095 ?auto_991099 ?auto_991101 ?auto_991100 ?auto_991102 ?auto_991103 ?auto_991104 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991195 - SURFACE
      ?auto_991196 - SURFACE
      ?auto_991197 - SURFACE
      ?auto_991194 - SURFACE
      ?auto_991198 - SURFACE
      ?auto_991200 - SURFACE
      ?auto_991199 - SURFACE
      ?auto_991201 - SURFACE
      ?auto_991202 - SURFACE
      ?auto_991203 - SURFACE
    )
    :vars
    (
      ?auto_991208 - HOIST
      ?auto_991204 - PLACE
      ?auto_991205 - TRUCK
      ?auto_991207 - PLACE
      ?auto_991206 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_991208 ?auto_991204 ) ( SURFACE-AT ?auto_991202 ?auto_991204 ) ( CLEAR ?auto_991202 ) ( IS-CRATE ?auto_991203 ) ( not ( = ?auto_991202 ?auto_991203 ) ) ( AVAILABLE ?auto_991208 ) ( ON ?auto_991202 ?auto_991201 ) ( not ( = ?auto_991201 ?auto_991202 ) ) ( not ( = ?auto_991201 ?auto_991203 ) ) ( TRUCK-AT ?auto_991205 ?auto_991207 ) ( not ( = ?auto_991207 ?auto_991204 ) ) ( HOIST-AT ?auto_991206 ?auto_991207 ) ( LIFTING ?auto_991206 ?auto_991203 ) ( not ( = ?auto_991208 ?auto_991206 ) ) ( ON ?auto_991196 ?auto_991195 ) ( ON ?auto_991197 ?auto_991196 ) ( ON ?auto_991194 ?auto_991197 ) ( ON ?auto_991198 ?auto_991194 ) ( ON ?auto_991200 ?auto_991198 ) ( ON ?auto_991199 ?auto_991200 ) ( ON ?auto_991201 ?auto_991199 ) ( not ( = ?auto_991195 ?auto_991196 ) ) ( not ( = ?auto_991195 ?auto_991197 ) ) ( not ( = ?auto_991195 ?auto_991194 ) ) ( not ( = ?auto_991195 ?auto_991198 ) ) ( not ( = ?auto_991195 ?auto_991200 ) ) ( not ( = ?auto_991195 ?auto_991199 ) ) ( not ( = ?auto_991195 ?auto_991201 ) ) ( not ( = ?auto_991195 ?auto_991202 ) ) ( not ( = ?auto_991195 ?auto_991203 ) ) ( not ( = ?auto_991196 ?auto_991197 ) ) ( not ( = ?auto_991196 ?auto_991194 ) ) ( not ( = ?auto_991196 ?auto_991198 ) ) ( not ( = ?auto_991196 ?auto_991200 ) ) ( not ( = ?auto_991196 ?auto_991199 ) ) ( not ( = ?auto_991196 ?auto_991201 ) ) ( not ( = ?auto_991196 ?auto_991202 ) ) ( not ( = ?auto_991196 ?auto_991203 ) ) ( not ( = ?auto_991197 ?auto_991194 ) ) ( not ( = ?auto_991197 ?auto_991198 ) ) ( not ( = ?auto_991197 ?auto_991200 ) ) ( not ( = ?auto_991197 ?auto_991199 ) ) ( not ( = ?auto_991197 ?auto_991201 ) ) ( not ( = ?auto_991197 ?auto_991202 ) ) ( not ( = ?auto_991197 ?auto_991203 ) ) ( not ( = ?auto_991194 ?auto_991198 ) ) ( not ( = ?auto_991194 ?auto_991200 ) ) ( not ( = ?auto_991194 ?auto_991199 ) ) ( not ( = ?auto_991194 ?auto_991201 ) ) ( not ( = ?auto_991194 ?auto_991202 ) ) ( not ( = ?auto_991194 ?auto_991203 ) ) ( not ( = ?auto_991198 ?auto_991200 ) ) ( not ( = ?auto_991198 ?auto_991199 ) ) ( not ( = ?auto_991198 ?auto_991201 ) ) ( not ( = ?auto_991198 ?auto_991202 ) ) ( not ( = ?auto_991198 ?auto_991203 ) ) ( not ( = ?auto_991200 ?auto_991199 ) ) ( not ( = ?auto_991200 ?auto_991201 ) ) ( not ( = ?auto_991200 ?auto_991202 ) ) ( not ( = ?auto_991200 ?auto_991203 ) ) ( not ( = ?auto_991199 ?auto_991201 ) ) ( not ( = ?auto_991199 ?auto_991202 ) ) ( not ( = ?auto_991199 ?auto_991203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991201 ?auto_991202 ?auto_991203 )
      ( MAKE-9CRATE-VERIFY ?auto_991195 ?auto_991196 ?auto_991197 ?auto_991194 ?auto_991198 ?auto_991200 ?auto_991199 ?auto_991201 ?auto_991202 ?auto_991203 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991303 - SURFACE
      ?auto_991304 - SURFACE
      ?auto_991305 - SURFACE
      ?auto_991302 - SURFACE
      ?auto_991306 - SURFACE
      ?auto_991308 - SURFACE
      ?auto_991307 - SURFACE
      ?auto_991309 - SURFACE
      ?auto_991310 - SURFACE
      ?auto_991311 - SURFACE
    )
    :vars
    (
      ?auto_991317 - HOIST
      ?auto_991312 - PLACE
      ?auto_991316 - TRUCK
      ?auto_991313 - PLACE
      ?auto_991314 - HOIST
      ?auto_991315 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_991317 ?auto_991312 ) ( SURFACE-AT ?auto_991310 ?auto_991312 ) ( CLEAR ?auto_991310 ) ( IS-CRATE ?auto_991311 ) ( not ( = ?auto_991310 ?auto_991311 ) ) ( AVAILABLE ?auto_991317 ) ( ON ?auto_991310 ?auto_991309 ) ( not ( = ?auto_991309 ?auto_991310 ) ) ( not ( = ?auto_991309 ?auto_991311 ) ) ( TRUCK-AT ?auto_991316 ?auto_991313 ) ( not ( = ?auto_991313 ?auto_991312 ) ) ( HOIST-AT ?auto_991314 ?auto_991313 ) ( not ( = ?auto_991317 ?auto_991314 ) ) ( AVAILABLE ?auto_991314 ) ( SURFACE-AT ?auto_991311 ?auto_991313 ) ( ON ?auto_991311 ?auto_991315 ) ( CLEAR ?auto_991311 ) ( not ( = ?auto_991310 ?auto_991315 ) ) ( not ( = ?auto_991311 ?auto_991315 ) ) ( not ( = ?auto_991309 ?auto_991315 ) ) ( ON ?auto_991304 ?auto_991303 ) ( ON ?auto_991305 ?auto_991304 ) ( ON ?auto_991302 ?auto_991305 ) ( ON ?auto_991306 ?auto_991302 ) ( ON ?auto_991308 ?auto_991306 ) ( ON ?auto_991307 ?auto_991308 ) ( ON ?auto_991309 ?auto_991307 ) ( not ( = ?auto_991303 ?auto_991304 ) ) ( not ( = ?auto_991303 ?auto_991305 ) ) ( not ( = ?auto_991303 ?auto_991302 ) ) ( not ( = ?auto_991303 ?auto_991306 ) ) ( not ( = ?auto_991303 ?auto_991308 ) ) ( not ( = ?auto_991303 ?auto_991307 ) ) ( not ( = ?auto_991303 ?auto_991309 ) ) ( not ( = ?auto_991303 ?auto_991310 ) ) ( not ( = ?auto_991303 ?auto_991311 ) ) ( not ( = ?auto_991303 ?auto_991315 ) ) ( not ( = ?auto_991304 ?auto_991305 ) ) ( not ( = ?auto_991304 ?auto_991302 ) ) ( not ( = ?auto_991304 ?auto_991306 ) ) ( not ( = ?auto_991304 ?auto_991308 ) ) ( not ( = ?auto_991304 ?auto_991307 ) ) ( not ( = ?auto_991304 ?auto_991309 ) ) ( not ( = ?auto_991304 ?auto_991310 ) ) ( not ( = ?auto_991304 ?auto_991311 ) ) ( not ( = ?auto_991304 ?auto_991315 ) ) ( not ( = ?auto_991305 ?auto_991302 ) ) ( not ( = ?auto_991305 ?auto_991306 ) ) ( not ( = ?auto_991305 ?auto_991308 ) ) ( not ( = ?auto_991305 ?auto_991307 ) ) ( not ( = ?auto_991305 ?auto_991309 ) ) ( not ( = ?auto_991305 ?auto_991310 ) ) ( not ( = ?auto_991305 ?auto_991311 ) ) ( not ( = ?auto_991305 ?auto_991315 ) ) ( not ( = ?auto_991302 ?auto_991306 ) ) ( not ( = ?auto_991302 ?auto_991308 ) ) ( not ( = ?auto_991302 ?auto_991307 ) ) ( not ( = ?auto_991302 ?auto_991309 ) ) ( not ( = ?auto_991302 ?auto_991310 ) ) ( not ( = ?auto_991302 ?auto_991311 ) ) ( not ( = ?auto_991302 ?auto_991315 ) ) ( not ( = ?auto_991306 ?auto_991308 ) ) ( not ( = ?auto_991306 ?auto_991307 ) ) ( not ( = ?auto_991306 ?auto_991309 ) ) ( not ( = ?auto_991306 ?auto_991310 ) ) ( not ( = ?auto_991306 ?auto_991311 ) ) ( not ( = ?auto_991306 ?auto_991315 ) ) ( not ( = ?auto_991308 ?auto_991307 ) ) ( not ( = ?auto_991308 ?auto_991309 ) ) ( not ( = ?auto_991308 ?auto_991310 ) ) ( not ( = ?auto_991308 ?auto_991311 ) ) ( not ( = ?auto_991308 ?auto_991315 ) ) ( not ( = ?auto_991307 ?auto_991309 ) ) ( not ( = ?auto_991307 ?auto_991310 ) ) ( not ( = ?auto_991307 ?auto_991311 ) ) ( not ( = ?auto_991307 ?auto_991315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991309 ?auto_991310 ?auto_991311 )
      ( MAKE-9CRATE-VERIFY ?auto_991303 ?auto_991304 ?auto_991305 ?auto_991302 ?auto_991306 ?auto_991308 ?auto_991307 ?auto_991309 ?auto_991310 ?auto_991311 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991412 - SURFACE
      ?auto_991413 - SURFACE
      ?auto_991414 - SURFACE
      ?auto_991411 - SURFACE
      ?auto_991415 - SURFACE
      ?auto_991417 - SURFACE
      ?auto_991416 - SURFACE
      ?auto_991418 - SURFACE
      ?auto_991419 - SURFACE
      ?auto_991420 - SURFACE
    )
    :vars
    (
      ?auto_991423 - HOIST
      ?auto_991422 - PLACE
      ?auto_991425 - PLACE
      ?auto_991421 - HOIST
      ?auto_991426 - SURFACE
      ?auto_991424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991423 ?auto_991422 ) ( SURFACE-AT ?auto_991419 ?auto_991422 ) ( CLEAR ?auto_991419 ) ( IS-CRATE ?auto_991420 ) ( not ( = ?auto_991419 ?auto_991420 ) ) ( AVAILABLE ?auto_991423 ) ( ON ?auto_991419 ?auto_991418 ) ( not ( = ?auto_991418 ?auto_991419 ) ) ( not ( = ?auto_991418 ?auto_991420 ) ) ( not ( = ?auto_991425 ?auto_991422 ) ) ( HOIST-AT ?auto_991421 ?auto_991425 ) ( not ( = ?auto_991423 ?auto_991421 ) ) ( AVAILABLE ?auto_991421 ) ( SURFACE-AT ?auto_991420 ?auto_991425 ) ( ON ?auto_991420 ?auto_991426 ) ( CLEAR ?auto_991420 ) ( not ( = ?auto_991419 ?auto_991426 ) ) ( not ( = ?auto_991420 ?auto_991426 ) ) ( not ( = ?auto_991418 ?auto_991426 ) ) ( TRUCK-AT ?auto_991424 ?auto_991422 ) ( ON ?auto_991413 ?auto_991412 ) ( ON ?auto_991414 ?auto_991413 ) ( ON ?auto_991411 ?auto_991414 ) ( ON ?auto_991415 ?auto_991411 ) ( ON ?auto_991417 ?auto_991415 ) ( ON ?auto_991416 ?auto_991417 ) ( ON ?auto_991418 ?auto_991416 ) ( not ( = ?auto_991412 ?auto_991413 ) ) ( not ( = ?auto_991412 ?auto_991414 ) ) ( not ( = ?auto_991412 ?auto_991411 ) ) ( not ( = ?auto_991412 ?auto_991415 ) ) ( not ( = ?auto_991412 ?auto_991417 ) ) ( not ( = ?auto_991412 ?auto_991416 ) ) ( not ( = ?auto_991412 ?auto_991418 ) ) ( not ( = ?auto_991412 ?auto_991419 ) ) ( not ( = ?auto_991412 ?auto_991420 ) ) ( not ( = ?auto_991412 ?auto_991426 ) ) ( not ( = ?auto_991413 ?auto_991414 ) ) ( not ( = ?auto_991413 ?auto_991411 ) ) ( not ( = ?auto_991413 ?auto_991415 ) ) ( not ( = ?auto_991413 ?auto_991417 ) ) ( not ( = ?auto_991413 ?auto_991416 ) ) ( not ( = ?auto_991413 ?auto_991418 ) ) ( not ( = ?auto_991413 ?auto_991419 ) ) ( not ( = ?auto_991413 ?auto_991420 ) ) ( not ( = ?auto_991413 ?auto_991426 ) ) ( not ( = ?auto_991414 ?auto_991411 ) ) ( not ( = ?auto_991414 ?auto_991415 ) ) ( not ( = ?auto_991414 ?auto_991417 ) ) ( not ( = ?auto_991414 ?auto_991416 ) ) ( not ( = ?auto_991414 ?auto_991418 ) ) ( not ( = ?auto_991414 ?auto_991419 ) ) ( not ( = ?auto_991414 ?auto_991420 ) ) ( not ( = ?auto_991414 ?auto_991426 ) ) ( not ( = ?auto_991411 ?auto_991415 ) ) ( not ( = ?auto_991411 ?auto_991417 ) ) ( not ( = ?auto_991411 ?auto_991416 ) ) ( not ( = ?auto_991411 ?auto_991418 ) ) ( not ( = ?auto_991411 ?auto_991419 ) ) ( not ( = ?auto_991411 ?auto_991420 ) ) ( not ( = ?auto_991411 ?auto_991426 ) ) ( not ( = ?auto_991415 ?auto_991417 ) ) ( not ( = ?auto_991415 ?auto_991416 ) ) ( not ( = ?auto_991415 ?auto_991418 ) ) ( not ( = ?auto_991415 ?auto_991419 ) ) ( not ( = ?auto_991415 ?auto_991420 ) ) ( not ( = ?auto_991415 ?auto_991426 ) ) ( not ( = ?auto_991417 ?auto_991416 ) ) ( not ( = ?auto_991417 ?auto_991418 ) ) ( not ( = ?auto_991417 ?auto_991419 ) ) ( not ( = ?auto_991417 ?auto_991420 ) ) ( not ( = ?auto_991417 ?auto_991426 ) ) ( not ( = ?auto_991416 ?auto_991418 ) ) ( not ( = ?auto_991416 ?auto_991419 ) ) ( not ( = ?auto_991416 ?auto_991420 ) ) ( not ( = ?auto_991416 ?auto_991426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991418 ?auto_991419 ?auto_991420 )
      ( MAKE-9CRATE-VERIFY ?auto_991412 ?auto_991413 ?auto_991414 ?auto_991411 ?auto_991415 ?auto_991417 ?auto_991416 ?auto_991418 ?auto_991419 ?auto_991420 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991521 - SURFACE
      ?auto_991522 - SURFACE
      ?auto_991523 - SURFACE
      ?auto_991520 - SURFACE
      ?auto_991524 - SURFACE
      ?auto_991526 - SURFACE
      ?auto_991525 - SURFACE
      ?auto_991527 - SURFACE
      ?auto_991528 - SURFACE
      ?auto_991529 - SURFACE
    )
    :vars
    (
      ?auto_991530 - HOIST
      ?auto_991533 - PLACE
      ?auto_991531 - PLACE
      ?auto_991534 - HOIST
      ?auto_991532 - SURFACE
      ?auto_991535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991530 ?auto_991533 ) ( IS-CRATE ?auto_991529 ) ( not ( = ?auto_991528 ?auto_991529 ) ) ( not ( = ?auto_991527 ?auto_991528 ) ) ( not ( = ?auto_991527 ?auto_991529 ) ) ( not ( = ?auto_991531 ?auto_991533 ) ) ( HOIST-AT ?auto_991534 ?auto_991531 ) ( not ( = ?auto_991530 ?auto_991534 ) ) ( AVAILABLE ?auto_991534 ) ( SURFACE-AT ?auto_991529 ?auto_991531 ) ( ON ?auto_991529 ?auto_991532 ) ( CLEAR ?auto_991529 ) ( not ( = ?auto_991528 ?auto_991532 ) ) ( not ( = ?auto_991529 ?auto_991532 ) ) ( not ( = ?auto_991527 ?auto_991532 ) ) ( TRUCK-AT ?auto_991535 ?auto_991533 ) ( SURFACE-AT ?auto_991527 ?auto_991533 ) ( CLEAR ?auto_991527 ) ( LIFTING ?auto_991530 ?auto_991528 ) ( IS-CRATE ?auto_991528 ) ( ON ?auto_991522 ?auto_991521 ) ( ON ?auto_991523 ?auto_991522 ) ( ON ?auto_991520 ?auto_991523 ) ( ON ?auto_991524 ?auto_991520 ) ( ON ?auto_991526 ?auto_991524 ) ( ON ?auto_991525 ?auto_991526 ) ( ON ?auto_991527 ?auto_991525 ) ( not ( = ?auto_991521 ?auto_991522 ) ) ( not ( = ?auto_991521 ?auto_991523 ) ) ( not ( = ?auto_991521 ?auto_991520 ) ) ( not ( = ?auto_991521 ?auto_991524 ) ) ( not ( = ?auto_991521 ?auto_991526 ) ) ( not ( = ?auto_991521 ?auto_991525 ) ) ( not ( = ?auto_991521 ?auto_991527 ) ) ( not ( = ?auto_991521 ?auto_991528 ) ) ( not ( = ?auto_991521 ?auto_991529 ) ) ( not ( = ?auto_991521 ?auto_991532 ) ) ( not ( = ?auto_991522 ?auto_991523 ) ) ( not ( = ?auto_991522 ?auto_991520 ) ) ( not ( = ?auto_991522 ?auto_991524 ) ) ( not ( = ?auto_991522 ?auto_991526 ) ) ( not ( = ?auto_991522 ?auto_991525 ) ) ( not ( = ?auto_991522 ?auto_991527 ) ) ( not ( = ?auto_991522 ?auto_991528 ) ) ( not ( = ?auto_991522 ?auto_991529 ) ) ( not ( = ?auto_991522 ?auto_991532 ) ) ( not ( = ?auto_991523 ?auto_991520 ) ) ( not ( = ?auto_991523 ?auto_991524 ) ) ( not ( = ?auto_991523 ?auto_991526 ) ) ( not ( = ?auto_991523 ?auto_991525 ) ) ( not ( = ?auto_991523 ?auto_991527 ) ) ( not ( = ?auto_991523 ?auto_991528 ) ) ( not ( = ?auto_991523 ?auto_991529 ) ) ( not ( = ?auto_991523 ?auto_991532 ) ) ( not ( = ?auto_991520 ?auto_991524 ) ) ( not ( = ?auto_991520 ?auto_991526 ) ) ( not ( = ?auto_991520 ?auto_991525 ) ) ( not ( = ?auto_991520 ?auto_991527 ) ) ( not ( = ?auto_991520 ?auto_991528 ) ) ( not ( = ?auto_991520 ?auto_991529 ) ) ( not ( = ?auto_991520 ?auto_991532 ) ) ( not ( = ?auto_991524 ?auto_991526 ) ) ( not ( = ?auto_991524 ?auto_991525 ) ) ( not ( = ?auto_991524 ?auto_991527 ) ) ( not ( = ?auto_991524 ?auto_991528 ) ) ( not ( = ?auto_991524 ?auto_991529 ) ) ( not ( = ?auto_991524 ?auto_991532 ) ) ( not ( = ?auto_991526 ?auto_991525 ) ) ( not ( = ?auto_991526 ?auto_991527 ) ) ( not ( = ?auto_991526 ?auto_991528 ) ) ( not ( = ?auto_991526 ?auto_991529 ) ) ( not ( = ?auto_991526 ?auto_991532 ) ) ( not ( = ?auto_991525 ?auto_991527 ) ) ( not ( = ?auto_991525 ?auto_991528 ) ) ( not ( = ?auto_991525 ?auto_991529 ) ) ( not ( = ?auto_991525 ?auto_991532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991527 ?auto_991528 ?auto_991529 )
      ( MAKE-9CRATE-VERIFY ?auto_991521 ?auto_991522 ?auto_991523 ?auto_991520 ?auto_991524 ?auto_991526 ?auto_991525 ?auto_991527 ?auto_991528 ?auto_991529 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991630 - SURFACE
      ?auto_991631 - SURFACE
      ?auto_991632 - SURFACE
      ?auto_991629 - SURFACE
      ?auto_991633 - SURFACE
      ?auto_991635 - SURFACE
      ?auto_991634 - SURFACE
      ?auto_991636 - SURFACE
      ?auto_991637 - SURFACE
      ?auto_991638 - SURFACE
    )
    :vars
    (
      ?auto_991639 - HOIST
      ?auto_991642 - PLACE
      ?auto_991640 - PLACE
      ?auto_991641 - HOIST
      ?auto_991644 - SURFACE
      ?auto_991643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991639 ?auto_991642 ) ( IS-CRATE ?auto_991638 ) ( not ( = ?auto_991637 ?auto_991638 ) ) ( not ( = ?auto_991636 ?auto_991637 ) ) ( not ( = ?auto_991636 ?auto_991638 ) ) ( not ( = ?auto_991640 ?auto_991642 ) ) ( HOIST-AT ?auto_991641 ?auto_991640 ) ( not ( = ?auto_991639 ?auto_991641 ) ) ( AVAILABLE ?auto_991641 ) ( SURFACE-AT ?auto_991638 ?auto_991640 ) ( ON ?auto_991638 ?auto_991644 ) ( CLEAR ?auto_991638 ) ( not ( = ?auto_991637 ?auto_991644 ) ) ( not ( = ?auto_991638 ?auto_991644 ) ) ( not ( = ?auto_991636 ?auto_991644 ) ) ( TRUCK-AT ?auto_991643 ?auto_991642 ) ( SURFACE-AT ?auto_991636 ?auto_991642 ) ( CLEAR ?auto_991636 ) ( IS-CRATE ?auto_991637 ) ( AVAILABLE ?auto_991639 ) ( IN ?auto_991637 ?auto_991643 ) ( ON ?auto_991631 ?auto_991630 ) ( ON ?auto_991632 ?auto_991631 ) ( ON ?auto_991629 ?auto_991632 ) ( ON ?auto_991633 ?auto_991629 ) ( ON ?auto_991635 ?auto_991633 ) ( ON ?auto_991634 ?auto_991635 ) ( ON ?auto_991636 ?auto_991634 ) ( not ( = ?auto_991630 ?auto_991631 ) ) ( not ( = ?auto_991630 ?auto_991632 ) ) ( not ( = ?auto_991630 ?auto_991629 ) ) ( not ( = ?auto_991630 ?auto_991633 ) ) ( not ( = ?auto_991630 ?auto_991635 ) ) ( not ( = ?auto_991630 ?auto_991634 ) ) ( not ( = ?auto_991630 ?auto_991636 ) ) ( not ( = ?auto_991630 ?auto_991637 ) ) ( not ( = ?auto_991630 ?auto_991638 ) ) ( not ( = ?auto_991630 ?auto_991644 ) ) ( not ( = ?auto_991631 ?auto_991632 ) ) ( not ( = ?auto_991631 ?auto_991629 ) ) ( not ( = ?auto_991631 ?auto_991633 ) ) ( not ( = ?auto_991631 ?auto_991635 ) ) ( not ( = ?auto_991631 ?auto_991634 ) ) ( not ( = ?auto_991631 ?auto_991636 ) ) ( not ( = ?auto_991631 ?auto_991637 ) ) ( not ( = ?auto_991631 ?auto_991638 ) ) ( not ( = ?auto_991631 ?auto_991644 ) ) ( not ( = ?auto_991632 ?auto_991629 ) ) ( not ( = ?auto_991632 ?auto_991633 ) ) ( not ( = ?auto_991632 ?auto_991635 ) ) ( not ( = ?auto_991632 ?auto_991634 ) ) ( not ( = ?auto_991632 ?auto_991636 ) ) ( not ( = ?auto_991632 ?auto_991637 ) ) ( not ( = ?auto_991632 ?auto_991638 ) ) ( not ( = ?auto_991632 ?auto_991644 ) ) ( not ( = ?auto_991629 ?auto_991633 ) ) ( not ( = ?auto_991629 ?auto_991635 ) ) ( not ( = ?auto_991629 ?auto_991634 ) ) ( not ( = ?auto_991629 ?auto_991636 ) ) ( not ( = ?auto_991629 ?auto_991637 ) ) ( not ( = ?auto_991629 ?auto_991638 ) ) ( not ( = ?auto_991629 ?auto_991644 ) ) ( not ( = ?auto_991633 ?auto_991635 ) ) ( not ( = ?auto_991633 ?auto_991634 ) ) ( not ( = ?auto_991633 ?auto_991636 ) ) ( not ( = ?auto_991633 ?auto_991637 ) ) ( not ( = ?auto_991633 ?auto_991638 ) ) ( not ( = ?auto_991633 ?auto_991644 ) ) ( not ( = ?auto_991635 ?auto_991634 ) ) ( not ( = ?auto_991635 ?auto_991636 ) ) ( not ( = ?auto_991635 ?auto_991637 ) ) ( not ( = ?auto_991635 ?auto_991638 ) ) ( not ( = ?auto_991635 ?auto_991644 ) ) ( not ( = ?auto_991634 ?auto_991636 ) ) ( not ( = ?auto_991634 ?auto_991637 ) ) ( not ( = ?auto_991634 ?auto_991638 ) ) ( not ( = ?auto_991634 ?auto_991644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991636 ?auto_991637 ?auto_991638 )
      ( MAKE-9CRATE-VERIFY ?auto_991630 ?auto_991631 ?auto_991632 ?auto_991629 ?auto_991633 ?auto_991635 ?auto_991634 ?auto_991636 ?auto_991637 ?auto_991638 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997163 - SURFACE
      ?auto_997164 - SURFACE
      ?auto_997165 - SURFACE
      ?auto_997162 - SURFACE
      ?auto_997166 - SURFACE
      ?auto_997168 - SURFACE
      ?auto_997167 - SURFACE
      ?auto_997169 - SURFACE
      ?auto_997170 - SURFACE
      ?auto_997171 - SURFACE
      ?auto_997172 - SURFACE
    )
    :vars
    (
      ?auto_997173 - HOIST
      ?auto_997174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_997173 ?auto_997174 ) ( SURFACE-AT ?auto_997171 ?auto_997174 ) ( CLEAR ?auto_997171 ) ( LIFTING ?auto_997173 ?auto_997172 ) ( IS-CRATE ?auto_997172 ) ( not ( = ?auto_997171 ?auto_997172 ) ) ( ON ?auto_997164 ?auto_997163 ) ( ON ?auto_997165 ?auto_997164 ) ( ON ?auto_997162 ?auto_997165 ) ( ON ?auto_997166 ?auto_997162 ) ( ON ?auto_997168 ?auto_997166 ) ( ON ?auto_997167 ?auto_997168 ) ( ON ?auto_997169 ?auto_997167 ) ( ON ?auto_997170 ?auto_997169 ) ( ON ?auto_997171 ?auto_997170 ) ( not ( = ?auto_997163 ?auto_997164 ) ) ( not ( = ?auto_997163 ?auto_997165 ) ) ( not ( = ?auto_997163 ?auto_997162 ) ) ( not ( = ?auto_997163 ?auto_997166 ) ) ( not ( = ?auto_997163 ?auto_997168 ) ) ( not ( = ?auto_997163 ?auto_997167 ) ) ( not ( = ?auto_997163 ?auto_997169 ) ) ( not ( = ?auto_997163 ?auto_997170 ) ) ( not ( = ?auto_997163 ?auto_997171 ) ) ( not ( = ?auto_997163 ?auto_997172 ) ) ( not ( = ?auto_997164 ?auto_997165 ) ) ( not ( = ?auto_997164 ?auto_997162 ) ) ( not ( = ?auto_997164 ?auto_997166 ) ) ( not ( = ?auto_997164 ?auto_997168 ) ) ( not ( = ?auto_997164 ?auto_997167 ) ) ( not ( = ?auto_997164 ?auto_997169 ) ) ( not ( = ?auto_997164 ?auto_997170 ) ) ( not ( = ?auto_997164 ?auto_997171 ) ) ( not ( = ?auto_997164 ?auto_997172 ) ) ( not ( = ?auto_997165 ?auto_997162 ) ) ( not ( = ?auto_997165 ?auto_997166 ) ) ( not ( = ?auto_997165 ?auto_997168 ) ) ( not ( = ?auto_997165 ?auto_997167 ) ) ( not ( = ?auto_997165 ?auto_997169 ) ) ( not ( = ?auto_997165 ?auto_997170 ) ) ( not ( = ?auto_997165 ?auto_997171 ) ) ( not ( = ?auto_997165 ?auto_997172 ) ) ( not ( = ?auto_997162 ?auto_997166 ) ) ( not ( = ?auto_997162 ?auto_997168 ) ) ( not ( = ?auto_997162 ?auto_997167 ) ) ( not ( = ?auto_997162 ?auto_997169 ) ) ( not ( = ?auto_997162 ?auto_997170 ) ) ( not ( = ?auto_997162 ?auto_997171 ) ) ( not ( = ?auto_997162 ?auto_997172 ) ) ( not ( = ?auto_997166 ?auto_997168 ) ) ( not ( = ?auto_997166 ?auto_997167 ) ) ( not ( = ?auto_997166 ?auto_997169 ) ) ( not ( = ?auto_997166 ?auto_997170 ) ) ( not ( = ?auto_997166 ?auto_997171 ) ) ( not ( = ?auto_997166 ?auto_997172 ) ) ( not ( = ?auto_997168 ?auto_997167 ) ) ( not ( = ?auto_997168 ?auto_997169 ) ) ( not ( = ?auto_997168 ?auto_997170 ) ) ( not ( = ?auto_997168 ?auto_997171 ) ) ( not ( = ?auto_997168 ?auto_997172 ) ) ( not ( = ?auto_997167 ?auto_997169 ) ) ( not ( = ?auto_997167 ?auto_997170 ) ) ( not ( = ?auto_997167 ?auto_997171 ) ) ( not ( = ?auto_997167 ?auto_997172 ) ) ( not ( = ?auto_997169 ?auto_997170 ) ) ( not ( = ?auto_997169 ?auto_997171 ) ) ( not ( = ?auto_997169 ?auto_997172 ) ) ( not ( = ?auto_997170 ?auto_997171 ) ) ( not ( = ?auto_997170 ?auto_997172 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_997171 ?auto_997172 )
      ( MAKE-10CRATE-VERIFY ?auto_997163 ?auto_997164 ?auto_997165 ?auto_997162 ?auto_997166 ?auto_997168 ?auto_997167 ?auto_997169 ?auto_997170 ?auto_997171 ?auto_997172 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997257 - SURFACE
      ?auto_997258 - SURFACE
      ?auto_997259 - SURFACE
      ?auto_997256 - SURFACE
      ?auto_997260 - SURFACE
      ?auto_997262 - SURFACE
      ?auto_997261 - SURFACE
      ?auto_997263 - SURFACE
      ?auto_997264 - SURFACE
      ?auto_997265 - SURFACE
      ?auto_997266 - SURFACE
    )
    :vars
    (
      ?auto_997268 - HOIST
      ?auto_997269 - PLACE
      ?auto_997267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997268 ?auto_997269 ) ( SURFACE-AT ?auto_997265 ?auto_997269 ) ( CLEAR ?auto_997265 ) ( IS-CRATE ?auto_997266 ) ( not ( = ?auto_997265 ?auto_997266 ) ) ( TRUCK-AT ?auto_997267 ?auto_997269 ) ( AVAILABLE ?auto_997268 ) ( IN ?auto_997266 ?auto_997267 ) ( ON ?auto_997265 ?auto_997264 ) ( not ( = ?auto_997264 ?auto_997265 ) ) ( not ( = ?auto_997264 ?auto_997266 ) ) ( ON ?auto_997258 ?auto_997257 ) ( ON ?auto_997259 ?auto_997258 ) ( ON ?auto_997256 ?auto_997259 ) ( ON ?auto_997260 ?auto_997256 ) ( ON ?auto_997262 ?auto_997260 ) ( ON ?auto_997261 ?auto_997262 ) ( ON ?auto_997263 ?auto_997261 ) ( ON ?auto_997264 ?auto_997263 ) ( not ( = ?auto_997257 ?auto_997258 ) ) ( not ( = ?auto_997257 ?auto_997259 ) ) ( not ( = ?auto_997257 ?auto_997256 ) ) ( not ( = ?auto_997257 ?auto_997260 ) ) ( not ( = ?auto_997257 ?auto_997262 ) ) ( not ( = ?auto_997257 ?auto_997261 ) ) ( not ( = ?auto_997257 ?auto_997263 ) ) ( not ( = ?auto_997257 ?auto_997264 ) ) ( not ( = ?auto_997257 ?auto_997265 ) ) ( not ( = ?auto_997257 ?auto_997266 ) ) ( not ( = ?auto_997258 ?auto_997259 ) ) ( not ( = ?auto_997258 ?auto_997256 ) ) ( not ( = ?auto_997258 ?auto_997260 ) ) ( not ( = ?auto_997258 ?auto_997262 ) ) ( not ( = ?auto_997258 ?auto_997261 ) ) ( not ( = ?auto_997258 ?auto_997263 ) ) ( not ( = ?auto_997258 ?auto_997264 ) ) ( not ( = ?auto_997258 ?auto_997265 ) ) ( not ( = ?auto_997258 ?auto_997266 ) ) ( not ( = ?auto_997259 ?auto_997256 ) ) ( not ( = ?auto_997259 ?auto_997260 ) ) ( not ( = ?auto_997259 ?auto_997262 ) ) ( not ( = ?auto_997259 ?auto_997261 ) ) ( not ( = ?auto_997259 ?auto_997263 ) ) ( not ( = ?auto_997259 ?auto_997264 ) ) ( not ( = ?auto_997259 ?auto_997265 ) ) ( not ( = ?auto_997259 ?auto_997266 ) ) ( not ( = ?auto_997256 ?auto_997260 ) ) ( not ( = ?auto_997256 ?auto_997262 ) ) ( not ( = ?auto_997256 ?auto_997261 ) ) ( not ( = ?auto_997256 ?auto_997263 ) ) ( not ( = ?auto_997256 ?auto_997264 ) ) ( not ( = ?auto_997256 ?auto_997265 ) ) ( not ( = ?auto_997256 ?auto_997266 ) ) ( not ( = ?auto_997260 ?auto_997262 ) ) ( not ( = ?auto_997260 ?auto_997261 ) ) ( not ( = ?auto_997260 ?auto_997263 ) ) ( not ( = ?auto_997260 ?auto_997264 ) ) ( not ( = ?auto_997260 ?auto_997265 ) ) ( not ( = ?auto_997260 ?auto_997266 ) ) ( not ( = ?auto_997262 ?auto_997261 ) ) ( not ( = ?auto_997262 ?auto_997263 ) ) ( not ( = ?auto_997262 ?auto_997264 ) ) ( not ( = ?auto_997262 ?auto_997265 ) ) ( not ( = ?auto_997262 ?auto_997266 ) ) ( not ( = ?auto_997261 ?auto_997263 ) ) ( not ( = ?auto_997261 ?auto_997264 ) ) ( not ( = ?auto_997261 ?auto_997265 ) ) ( not ( = ?auto_997261 ?auto_997266 ) ) ( not ( = ?auto_997263 ?auto_997264 ) ) ( not ( = ?auto_997263 ?auto_997265 ) ) ( not ( = ?auto_997263 ?auto_997266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997264 ?auto_997265 ?auto_997266 )
      ( MAKE-10CRATE-VERIFY ?auto_997257 ?auto_997258 ?auto_997259 ?auto_997256 ?auto_997260 ?auto_997262 ?auto_997261 ?auto_997263 ?auto_997264 ?auto_997265 ?auto_997266 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997362 - SURFACE
      ?auto_997363 - SURFACE
      ?auto_997364 - SURFACE
      ?auto_997361 - SURFACE
      ?auto_997365 - SURFACE
      ?auto_997367 - SURFACE
      ?auto_997366 - SURFACE
      ?auto_997368 - SURFACE
      ?auto_997369 - SURFACE
      ?auto_997370 - SURFACE
      ?auto_997371 - SURFACE
    )
    :vars
    (
      ?auto_997372 - HOIST
      ?auto_997374 - PLACE
      ?auto_997373 - TRUCK
      ?auto_997375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_997372 ?auto_997374 ) ( SURFACE-AT ?auto_997370 ?auto_997374 ) ( CLEAR ?auto_997370 ) ( IS-CRATE ?auto_997371 ) ( not ( = ?auto_997370 ?auto_997371 ) ) ( AVAILABLE ?auto_997372 ) ( IN ?auto_997371 ?auto_997373 ) ( ON ?auto_997370 ?auto_997369 ) ( not ( = ?auto_997369 ?auto_997370 ) ) ( not ( = ?auto_997369 ?auto_997371 ) ) ( TRUCK-AT ?auto_997373 ?auto_997375 ) ( not ( = ?auto_997375 ?auto_997374 ) ) ( ON ?auto_997363 ?auto_997362 ) ( ON ?auto_997364 ?auto_997363 ) ( ON ?auto_997361 ?auto_997364 ) ( ON ?auto_997365 ?auto_997361 ) ( ON ?auto_997367 ?auto_997365 ) ( ON ?auto_997366 ?auto_997367 ) ( ON ?auto_997368 ?auto_997366 ) ( ON ?auto_997369 ?auto_997368 ) ( not ( = ?auto_997362 ?auto_997363 ) ) ( not ( = ?auto_997362 ?auto_997364 ) ) ( not ( = ?auto_997362 ?auto_997361 ) ) ( not ( = ?auto_997362 ?auto_997365 ) ) ( not ( = ?auto_997362 ?auto_997367 ) ) ( not ( = ?auto_997362 ?auto_997366 ) ) ( not ( = ?auto_997362 ?auto_997368 ) ) ( not ( = ?auto_997362 ?auto_997369 ) ) ( not ( = ?auto_997362 ?auto_997370 ) ) ( not ( = ?auto_997362 ?auto_997371 ) ) ( not ( = ?auto_997363 ?auto_997364 ) ) ( not ( = ?auto_997363 ?auto_997361 ) ) ( not ( = ?auto_997363 ?auto_997365 ) ) ( not ( = ?auto_997363 ?auto_997367 ) ) ( not ( = ?auto_997363 ?auto_997366 ) ) ( not ( = ?auto_997363 ?auto_997368 ) ) ( not ( = ?auto_997363 ?auto_997369 ) ) ( not ( = ?auto_997363 ?auto_997370 ) ) ( not ( = ?auto_997363 ?auto_997371 ) ) ( not ( = ?auto_997364 ?auto_997361 ) ) ( not ( = ?auto_997364 ?auto_997365 ) ) ( not ( = ?auto_997364 ?auto_997367 ) ) ( not ( = ?auto_997364 ?auto_997366 ) ) ( not ( = ?auto_997364 ?auto_997368 ) ) ( not ( = ?auto_997364 ?auto_997369 ) ) ( not ( = ?auto_997364 ?auto_997370 ) ) ( not ( = ?auto_997364 ?auto_997371 ) ) ( not ( = ?auto_997361 ?auto_997365 ) ) ( not ( = ?auto_997361 ?auto_997367 ) ) ( not ( = ?auto_997361 ?auto_997366 ) ) ( not ( = ?auto_997361 ?auto_997368 ) ) ( not ( = ?auto_997361 ?auto_997369 ) ) ( not ( = ?auto_997361 ?auto_997370 ) ) ( not ( = ?auto_997361 ?auto_997371 ) ) ( not ( = ?auto_997365 ?auto_997367 ) ) ( not ( = ?auto_997365 ?auto_997366 ) ) ( not ( = ?auto_997365 ?auto_997368 ) ) ( not ( = ?auto_997365 ?auto_997369 ) ) ( not ( = ?auto_997365 ?auto_997370 ) ) ( not ( = ?auto_997365 ?auto_997371 ) ) ( not ( = ?auto_997367 ?auto_997366 ) ) ( not ( = ?auto_997367 ?auto_997368 ) ) ( not ( = ?auto_997367 ?auto_997369 ) ) ( not ( = ?auto_997367 ?auto_997370 ) ) ( not ( = ?auto_997367 ?auto_997371 ) ) ( not ( = ?auto_997366 ?auto_997368 ) ) ( not ( = ?auto_997366 ?auto_997369 ) ) ( not ( = ?auto_997366 ?auto_997370 ) ) ( not ( = ?auto_997366 ?auto_997371 ) ) ( not ( = ?auto_997368 ?auto_997369 ) ) ( not ( = ?auto_997368 ?auto_997370 ) ) ( not ( = ?auto_997368 ?auto_997371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997369 ?auto_997370 ?auto_997371 )
      ( MAKE-10CRATE-VERIFY ?auto_997362 ?auto_997363 ?auto_997364 ?auto_997361 ?auto_997365 ?auto_997367 ?auto_997366 ?auto_997368 ?auto_997369 ?auto_997370 ?auto_997371 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997477 - SURFACE
      ?auto_997478 - SURFACE
      ?auto_997479 - SURFACE
      ?auto_997476 - SURFACE
      ?auto_997480 - SURFACE
      ?auto_997482 - SURFACE
      ?auto_997481 - SURFACE
      ?auto_997483 - SURFACE
      ?auto_997484 - SURFACE
      ?auto_997485 - SURFACE
      ?auto_997486 - SURFACE
    )
    :vars
    (
      ?auto_997490 - HOIST
      ?auto_997489 - PLACE
      ?auto_997487 - TRUCK
      ?auto_997488 - PLACE
      ?auto_997491 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_997490 ?auto_997489 ) ( SURFACE-AT ?auto_997485 ?auto_997489 ) ( CLEAR ?auto_997485 ) ( IS-CRATE ?auto_997486 ) ( not ( = ?auto_997485 ?auto_997486 ) ) ( AVAILABLE ?auto_997490 ) ( ON ?auto_997485 ?auto_997484 ) ( not ( = ?auto_997484 ?auto_997485 ) ) ( not ( = ?auto_997484 ?auto_997486 ) ) ( TRUCK-AT ?auto_997487 ?auto_997488 ) ( not ( = ?auto_997488 ?auto_997489 ) ) ( HOIST-AT ?auto_997491 ?auto_997488 ) ( LIFTING ?auto_997491 ?auto_997486 ) ( not ( = ?auto_997490 ?auto_997491 ) ) ( ON ?auto_997478 ?auto_997477 ) ( ON ?auto_997479 ?auto_997478 ) ( ON ?auto_997476 ?auto_997479 ) ( ON ?auto_997480 ?auto_997476 ) ( ON ?auto_997482 ?auto_997480 ) ( ON ?auto_997481 ?auto_997482 ) ( ON ?auto_997483 ?auto_997481 ) ( ON ?auto_997484 ?auto_997483 ) ( not ( = ?auto_997477 ?auto_997478 ) ) ( not ( = ?auto_997477 ?auto_997479 ) ) ( not ( = ?auto_997477 ?auto_997476 ) ) ( not ( = ?auto_997477 ?auto_997480 ) ) ( not ( = ?auto_997477 ?auto_997482 ) ) ( not ( = ?auto_997477 ?auto_997481 ) ) ( not ( = ?auto_997477 ?auto_997483 ) ) ( not ( = ?auto_997477 ?auto_997484 ) ) ( not ( = ?auto_997477 ?auto_997485 ) ) ( not ( = ?auto_997477 ?auto_997486 ) ) ( not ( = ?auto_997478 ?auto_997479 ) ) ( not ( = ?auto_997478 ?auto_997476 ) ) ( not ( = ?auto_997478 ?auto_997480 ) ) ( not ( = ?auto_997478 ?auto_997482 ) ) ( not ( = ?auto_997478 ?auto_997481 ) ) ( not ( = ?auto_997478 ?auto_997483 ) ) ( not ( = ?auto_997478 ?auto_997484 ) ) ( not ( = ?auto_997478 ?auto_997485 ) ) ( not ( = ?auto_997478 ?auto_997486 ) ) ( not ( = ?auto_997479 ?auto_997476 ) ) ( not ( = ?auto_997479 ?auto_997480 ) ) ( not ( = ?auto_997479 ?auto_997482 ) ) ( not ( = ?auto_997479 ?auto_997481 ) ) ( not ( = ?auto_997479 ?auto_997483 ) ) ( not ( = ?auto_997479 ?auto_997484 ) ) ( not ( = ?auto_997479 ?auto_997485 ) ) ( not ( = ?auto_997479 ?auto_997486 ) ) ( not ( = ?auto_997476 ?auto_997480 ) ) ( not ( = ?auto_997476 ?auto_997482 ) ) ( not ( = ?auto_997476 ?auto_997481 ) ) ( not ( = ?auto_997476 ?auto_997483 ) ) ( not ( = ?auto_997476 ?auto_997484 ) ) ( not ( = ?auto_997476 ?auto_997485 ) ) ( not ( = ?auto_997476 ?auto_997486 ) ) ( not ( = ?auto_997480 ?auto_997482 ) ) ( not ( = ?auto_997480 ?auto_997481 ) ) ( not ( = ?auto_997480 ?auto_997483 ) ) ( not ( = ?auto_997480 ?auto_997484 ) ) ( not ( = ?auto_997480 ?auto_997485 ) ) ( not ( = ?auto_997480 ?auto_997486 ) ) ( not ( = ?auto_997482 ?auto_997481 ) ) ( not ( = ?auto_997482 ?auto_997483 ) ) ( not ( = ?auto_997482 ?auto_997484 ) ) ( not ( = ?auto_997482 ?auto_997485 ) ) ( not ( = ?auto_997482 ?auto_997486 ) ) ( not ( = ?auto_997481 ?auto_997483 ) ) ( not ( = ?auto_997481 ?auto_997484 ) ) ( not ( = ?auto_997481 ?auto_997485 ) ) ( not ( = ?auto_997481 ?auto_997486 ) ) ( not ( = ?auto_997483 ?auto_997484 ) ) ( not ( = ?auto_997483 ?auto_997485 ) ) ( not ( = ?auto_997483 ?auto_997486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997484 ?auto_997485 ?auto_997486 )
      ( MAKE-10CRATE-VERIFY ?auto_997477 ?auto_997478 ?auto_997479 ?auto_997476 ?auto_997480 ?auto_997482 ?auto_997481 ?auto_997483 ?auto_997484 ?auto_997485 ?auto_997486 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997602 - SURFACE
      ?auto_997603 - SURFACE
      ?auto_997604 - SURFACE
      ?auto_997601 - SURFACE
      ?auto_997605 - SURFACE
      ?auto_997607 - SURFACE
      ?auto_997606 - SURFACE
      ?auto_997608 - SURFACE
      ?auto_997609 - SURFACE
      ?auto_997610 - SURFACE
      ?auto_997611 - SURFACE
    )
    :vars
    (
      ?auto_997612 - HOIST
      ?auto_997616 - PLACE
      ?auto_997617 - TRUCK
      ?auto_997615 - PLACE
      ?auto_997613 - HOIST
      ?auto_997614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_997612 ?auto_997616 ) ( SURFACE-AT ?auto_997610 ?auto_997616 ) ( CLEAR ?auto_997610 ) ( IS-CRATE ?auto_997611 ) ( not ( = ?auto_997610 ?auto_997611 ) ) ( AVAILABLE ?auto_997612 ) ( ON ?auto_997610 ?auto_997609 ) ( not ( = ?auto_997609 ?auto_997610 ) ) ( not ( = ?auto_997609 ?auto_997611 ) ) ( TRUCK-AT ?auto_997617 ?auto_997615 ) ( not ( = ?auto_997615 ?auto_997616 ) ) ( HOIST-AT ?auto_997613 ?auto_997615 ) ( not ( = ?auto_997612 ?auto_997613 ) ) ( AVAILABLE ?auto_997613 ) ( SURFACE-AT ?auto_997611 ?auto_997615 ) ( ON ?auto_997611 ?auto_997614 ) ( CLEAR ?auto_997611 ) ( not ( = ?auto_997610 ?auto_997614 ) ) ( not ( = ?auto_997611 ?auto_997614 ) ) ( not ( = ?auto_997609 ?auto_997614 ) ) ( ON ?auto_997603 ?auto_997602 ) ( ON ?auto_997604 ?auto_997603 ) ( ON ?auto_997601 ?auto_997604 ) ( ON ?auto_997605 ?auto_997601 ) ( ON ?auto_997607 ?auto_997605 ) ( ON ?auto_997606 ?auto_997607 ) ( ON ?auto_997608 ?auto_997606 ) ( ON ?auto_997609 ?auto_997608 ) ( not ( = ?auto_997602 ?auto_997603 ) ) ( not ( = ?auto_997602 ?auto_997604 ) ) ( not ( = ?auto_997602 ?auto_997601 ) ) ( not ( = ?auto_997602 ?auto_997605 ) ) ( not ( = ?auto_997602 ?auto_997607 ) ) ( not ( = ?auto_997602 ?auto_997606 ) ) ( not ( = ?auto_997602 ?auto_997608 ) ) ( not ( = ?auto_997602 ?auto_997609 ) ) ( not ( = ?auto_997602 ?auto_997610 ) ) ( not ( = ?auto_997602 ?auto_997611 ) ) ( not ( = ?auto_997602 ?auto_997614 ) ) ( not ( = ?auto_997603 ?auto_997604 ) ) ( not ( = ?auto_997603 ?auto_997601 ) ) ( not ( = ?auto_997603 ?auto_997605 ) ) ( not ( = ?auto_997603 ?auto_997607 ) ) ( not ( = ?auto_997603 ?auto_997606 ) ) ( not ( = ?auto_997603 ?auto_997608 ) ) ( not ( = ?auto_997603 ?auto_997609 ) ) ( not ( = ?auto_997603 ?auto_997610 ) ) ( not ( = ?auto_997603 ?auto_997611 ) ) ( not ( = ?auto_997603 ?auto_997614 ) ) ( not ( = ?auto_997604 ?auto_997601 ) ) ( not ( = ?auto_997604 ?auto_997605 ) ) ( not ( = ?auto_997604 ?auto_997607 ) ) ( not ( = ?auto_997604 ?auto_997606 ) ) ( not ( = ?auto_997604 ?auto_997608 ) ) ( not ( = ?auto_997604 ?auto_997609 ) ) ( not ( = ?auto_997604 ?auto_997610 ) ) ( not ( = ?auto_997604 ?auto_997611 ) ) ( not ( = ?auto_997604 ?auto_997614 ) ) ( not ( = ?auto_997601 ?auto_997605 ) ) ( not ( = ?auto_997601 ?auto_997607 ) ) ( not ( = ?auto_997601 ?auto_997606 ) ) ( not ( = ?auto_997601 ?auto_997608 ) ) ( not ( = ?auto_997601 ?auto_997609 ) ) ( not ( = ?auto_997601 ?auto_997610 ) ) ( not ( = ?auto_997601 ?auto_997611 ) ) ( not ( = ?auto_997601 ?auto_997614 ) ) ( not ( = ?auto_997605 ?auto_997607 ) ) ( not ( = ?auto_997605 ?auto_997606 ) ) ( not ( = ?auto_997605 ?auto_997608 ) ) ( not ( = ?auto_997605 ?auto_997609 ) ) ( not ( = ?auto_997605 ?auto_997610 ) ) ( not ( = ?auto_997605 ?auto_997611 ) ) ( not ( = ?auto_997605 ?auto_997614 ) ) ( not ( = ?auto_997607 ?auto_997606 ) ) ( not ( = ?auto_997607 ?auto_997608 ) ) ( not ( = ?auto_997607 ?auto_997609 ) ) ( not ( = ?auto_997607 ?auto_997610 ) ) ( not ( = ?auto_997607 ?auto_997611 ) ) ( not ( = ?auto_997607 ?auto_997614 ) ) ( not ( = ?auto_997606 ?auto_997608 ) ) ( not ( = ?auto_997606 ?auto_997609 ) ) ( not ( = ?auto_997606 ?auto_997610 ) ) ( not ( = ?auto_997606 ?auto_997611 ) ) ( not ( = ?auto_997606 ?auto_997614 ) ) ( not ( = ?auto_997608 ?auto_997609 ) ) ( not ( = ?auto_997608 ?auto_997610 ) ) ( not ( = ?auto_997608 ?auto_997611 ) ) ( not ( = ?auto_997608 ?auto_997614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997609 ?auto_997610 ?auto_997611 )
      ( MAKE-10CRATE-VERIFY ?auto_997602 ?auto_997603 ?auto_997604 ?auto_997601 ?auto_997605 ?auto_997607 ?auto_997606 ?auto_997608 ?auto_997609 ?auto_997610 ?auto_997611 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997728 - SURFACE
      ?auto_997729 - SURFACE
      ?auto_997730 - SURFACE
      ?auto_997727 - SURFACE
      ?auto_997731 - SURFACE
      ?auto_997733 - SURFACE
      ?auto_997732 - SURFACE
      ?auto_997734 - SURFACE
      ?auto_997735 - SURFACE
      ?auto_997736 - SURFACE
      ?auto_997737 - SURFACE
    )
    :vars
    (
      ?auto_997742 - HOIST
      ?auto_997741 - PLACE
      ?auto_997740 - PLACE
      ?auto_997738 - HOIST
      ?auto_997739 - SURFACE
      ?auto_997743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997742 ?auto_997741 ) ( SURFACE-AT ?auto_997736 ?auto_997741 ) ( CLEAR ?auto_997736 ) ( IS-CRATE ?auto_997737 ) ( not ( = ?auto_997736 ?auto_997737 ) ) ( AVAILABLE ?auto_997742 ) ( ON ?auto_997736 ?auto_997735 ) ( not ( = ?auto_997735 ?auto_997736 ) ) ( not ( = ?auto_997735 ?auto_997737 ) ) ( not ( = ?auto_997740 ?auto_997741 ) ) ( HOIST-AT ?auto_997738 ?auto_997740 ) ( not ( = ?auto_997742 ?auto_997738 ) ) ( AVAILABLE ?auto_997738 ) ( SURFACE-AT ?auto_997737 ?auto_997740 ) ( ON ?auto_997737 ?auto_997739 ) ( CLEAR ?auto_997737 ) ( not ( = ?auto_997736 ?auto_997739 ) ) ( not ( = ?auto_997737 ?auto_997739 ) ) ( not ( = ?auto_997735 ?auto_997739 ) ) ( TRUCK-AT ?auto_997743 ?auto_997741 ) ( ON ?auto_997729 ?auto_997728 ) ( ON ?auto_997730 ?auto_997729 ) ( ON ?auto_997727 ?auto_997730 ) ( ON ?auto_997731 ?auto_997727 ) ( ON ?auto_997733 ?auto_997731 ) ( ON ?auto_997732 ?auto_997733 ) ( ON ?auto_997734 ?auto_997732 ) ( ON ?auto_997735 ?auto_997734 ) ( not ( = ?auto_997728 ?auto_997729 ) ) ( not ( = ?auto_997728 ?auto_997730 ) ) ( not ( = ?auto_997728 ?auto_997727 ) ) ( not ( = ?auto_997728 ?auto_997731 ) ) ( not ( = ?auto_997728 ?auto_997733 ) ) ( not ( = ?auto_997728 ?auto_997732 ) ) ( not ( = ?auto_997728 ?auto_997734 ) ) ( not ( = ?auto_997728 ?auto_997735 ) ) ( not ( = ?auto_997728 ?auto_997736 ) ) ( not ( = ?auto_997728 ?auto_997737 ) ) ( not ( = ?auto_997728 ?auto_997739 ) ) ( not ( = ?auto_997729 ?auto_997730 ) ) ( not ( = ?auto_997729 ?auto_997727 ) ) ( not ( = ?auto_997729 ?auto_997731 ) ) ( not ( = ?auto_997729 ?auto_997733 ) ) ( not ( = ?auto_997729 ?auto_997732 ) ) ( not ( = ?auto_997729 ?auto_997734 ) ) ( not ( = ?auto_997729 ?auto_997735 ) ) ( not ( = ?auto_997729 ?auto_997736 ) ) ( not ( = ?auto_997729 ?auto_997737 ) ) ( not ( = ?auto_997729 ?auto_997739 ) ) ( not ( = ?auto_997730 ?auto_997727 ) ) ( not ( = ?auto_997730 ?auto_997731 ) ) ( not ( = ?auto_997730 ?auto_997733 ) ) ( not ( = ?auto_997730 ?auto_997732 ) ) ( not ( = ?auto_997730 ?auto_997734 ) ) ( not ( = ?auto_997730 ?auto_997735 ) ) ( not ( = ?auto_997730 ?auto_997736 ) ) ( not ( = ?auto_997730 ?auto_997737 ) ) ( not ( = ?auto_997730 ?auto_997739 ) ) ( not ( = ?auto_997727 ?auto_997731 ) ) ( not ( = ?auto_997727 ?auto_997733 ) ) ( not ( = ?auto_997727 ?auto_997732 ) ) ( not ( = ?auto_997727 ?auto_997734 ) ) ( not ( = ?auto_997727 ?auto_997735 ) ) ( not ( = ?auto_997727 ?auto_997736 ) ) ( not ( = ?auto_997727 ?auto_997737 ) ) ( not ( = ?auto_997727 ?auto_997739 ) ) ( not ( = ?auto_997731 ?auto_997733 ) ) ( not ( = ?auto_997731 ?auto_997732 ) ) ( not ( = ?auto_997731 ?auto_997734 ) ) ( not ( = ?auto_997731 ?auto_997735 ) ) ( not ( = ?auto_997731 ?auto_997736 ) ) ( not ( = ?auto_997731 ?auto_997737 ) ) ( not ( = ?auto_997731 ?auto_997739 ) ) ( not ( = ?auto_997733 ?auto_997732 ) ) ( not ( = ?auto_997733 ?auto_997734 ) ) ( not ( = ?auto_997733 ?auto_997735 ) ) ( not ( = ?auto_997733 ?auto_997736 ) ) ( not ( = ?auto_997733 ?auto_997737 ) ) ( not ( = ?auto_997733 ?auto_997739 ) ) ( not ( = ?auto_997732 ?auto_997734 ) ) ( not ( = ?auto_997732 ?auto_997735 ) ) ( not ( = ?auto_997732 ?auto_997736 ) ) ( not ( = ?auto_997732 ?auto_997737 ) ) ( not ( = ?auto_997732 ?auto_997739 ) ) ( not ( = ?auto_997734 ?auto_997735 ) ) ( not ( = ?auto_997734 ?auto_997736 ) ) ( not ( = ?auto_997734 ?auto_997737 ) ) ( not ( = ?auto_997734 ?auto_997739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997735 ?auto_997736 ?auto_997737 )
      ( MAKE-10CRATE-VERIFY ?auto_997728 ?auto_997729 ?auto_997730 ?auto_997727 ?auto_997731 ?auto_997733 ?auto_997732 ?auto_997734 ?auto_997735 ?auto_997736 ?auto_997737 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997854 - SURFACE
      ?auto_997855 - SURFACE
      ?auto_997856 - SURFACE
      ?auto_997853 - SURFACE
      ?auto_997857 - SURFACE
      ?auto_997859 - SURFACE
      ?auto_997858 - SURFACE
      ?auto_997860 - SURFACE
      ?auto_997861 - SURFACE
      ?auto_997862 - SURFACE
      ?auto_997863 - SURFACE
    )
    :vars
    (
      ?auto_997868 - HOIST
      ?auto_997869 - PLACE
      ?auto_997865 - PLACE
      ?auto_997866 - HOIST
      ?auto_997867 - SURFACE
      ?auto_997864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997868 ?auto_997869 ) ( IS-CRATE ?auto_997863 ) ( not ( = ?auto_997862 ?auto_997863 ) ) ( not ( = ?auto_997861 ?auto_997862 ) ) ( not ( = ?auto_997861 ?auto_997863 ) ) ( not ( = ?auto_997865 ?auto_997869 ) ) ( HOIST-AT ?auto_997866 ?auto_997865 ) ( not ( = ?auto_997868 ?auto_997866 ) ) ( AVAILABLE ?auto_997866 ) ( SURFACE-AT ?auto_997863 ?auto_997865 ) ( ON ?auto_997863 ?auto_997867 ) ( CLEAR ?auto_997863 ) ( not ( = ?auto_997862 ?auto_997867 ) ) ( not ( = ?auto_997863 ?auto_997867 ) ) ( not ( = ?auto_997861 ?auto_997867 ) ) ( TRUCK-AT ?auto_997864 ?auto_997869 ) ( SURFACE-AT ?auto_997861 ?auto_997869 ) ( CLEAR ?auto_997861 ) ( LIFTING ?auto_997868 ?auto_997862 ) ( IS-CRATE ?auto_997862 ) ( ON ?auto_997855 ?auto_997854 ) ( ON ?auto_997856 ?auto_997855 ) ( ON ?auto_997853 ?auto_997856 ) ( ON ?auto_997857 ?auto_997853 ) ( ON ?auto_997859 ?auto_997857 ) ( ON ?auto_997858 ?auto_997859 ) ( ON ?auto_997860 ?auto_997858 ) ( ON ?auto_997861 ?auto_997860 ) ( not ( = ?auto_997854 ?auto_997855 ) ) ( not ( = ?auto_997854 ?auto_997856 ) ) ( not ( = ?auto_997854 ?auto_997853 ) ) ( not ( = ?auto_997854 ?auto_997857 ) ) ( not ( = ?auto_997854 ?auto_997859 ) ) ( not ( = ?auto_997854 ?auto_997858 ) ) ( not ( = ?auto_997854 ?auto_997860 ) ) ( not ( = ?auto_997854 ?auto_997861 ) ) ( not ( = ?auto_997854 ?auto_997862 ) ) ( not ( = ?auto_997854 ?auto_997863 ) ) ( not ( = ?auto_997854 ?auto_997867 ) ) ( not ( = ?auto_997855 ?auto_997856 ) ) ( not ( = ?auto_997855 ?auto_997853 ) ) ( not ( = ?auto_997855 ?auto_997857 ) ) ( not ( = ?auto_997855 ?auto_997859 ) ) ( not ( = ?auto_997855 ?auto_997858 ) ) ( not ( = ?auto_997855 ?auto_997860 ) ) ( not ( = ?auto_997855 ?auto_997861 ) ) ( not ( = ?auto_997855 ?auto_997862 ) ) ( not ( = ?auto_997855 ?auto_997863 ) ) ( not ( = ?auto_997855 ?auto_997867 ) ) ( not ( = ?auto_997856 ?auto_997853 ) ) ( not ( = ?auto_997856 ?auto_997857 ) ) ( not ( = ?auto_997856 ?auto_997859 ) ) ( not ( = ?auto_997856 ?auto_997858 ) ) ( not ( = ?auto_997856 ?auto_997860 ) ) ( not ( = ?auto_997856 ?auto_997861 ) ) ( not ( = ?auto_997856 ?auto_997862 ) ) ( not ( = ?auto_997856 ?auto_997863 ) ) ( not ( = ?auto_997856 ?auto_997867 ) ) ( not ( = ?auto_997853 ?auto_997857 ) ) ( not ( = ?auto_997853 ?auto_997859 ) ) ( not ( = ?auto_997853 ?auto_997858 ) ) ( not ( = ?auto_997853 ?auto_997860 ) ) ( not ( = ?auto_997853 ?auto_997861 ) ) ( not ( = ?auto_997853 ?auto_997862 ) ) ( not ( = ?auto_997853 ?auto_997863 ) ) ( not ( = ?auto_997853 ?auto_997867 ) ) ( not ( = ?auto_997857 ?auto_997859 ) ) ( not ( = ?auto_997857 ?auto_997858 ) ) ( not ( = ?auto_997857 ?auto_997860 ) ) ( not ( = ?auto_997857 ?auto_997861 ) ) ( not ( = ?auto_997857 ?auto_997862 ) ) ( not ( = ?auto_997857 ?auto_997863 ) ) ( not ( = ?auto_997857 ?auto_997867 ) ) ( not ( = ?auto_997859 ?auto_997858 ) ) ( not ( = ?auto_997859 ?auto_997860 ) ) ( not ( = ?auto_997859 ?auto_997861 ) ) ( not ( = ?auto_997859 ?auto_997862 ) ) ( not ( = ?auto_997859 ?auto_997863 ) ) ( not ( = ?auto_997859 ?auto_997867 ) ) ( not ( = ?auto_997858 ?auto_997860 ) ) ( not ( = ?auto_997858 ?auto_997861 ) ) ( not ( = ?auto_997858 ?auto_997862 ) ) ( not ( = ?auto_997858 ?auto_997863 ) ) ( not ( = ?auto_997858 ?auto_997867 ) ) ( not ( = ?auto_997860 ?auto_997861 ) ) ( not ( = ?auto_997860 ?auto_997862 ) ) ( not ( = ?auto_997860 ?auto_997863 ) ) ( not ( = ?auto_997860 ?auto_997867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997861 ?auto_997862 ?auto_997863 )
      ( MAKE-10CRATE-VERIFY ?auto_997854 ?auto_997855 ?auto_997856 ?auto_997853 ?auto_997857 ?auto_997859 ?auto_997858 ?auto_997860 ?auto_997861 ?auto_997862 ?auto_997863 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997980 - SURFACE
      ?auto_997981 - SURFACE
      ?auto_997982 - SURFACE
      ?auto_997979 - SURFACE
      ?auto_997983 - SURFACE
      ?auto_997985 - SURFACE
      ?auto_997984 - SURFACE
      ?auto_997986 - SURFACE
      ?auto_997987 - SURFACE
      ?auto_997988 - SURFACE
      ?auto_997989 - SURFACE
    )
    :vars
    (
      ?auto_997990 - HOIST
      ?auto_997991 - PLACE
      ?auto_997995 - PLACE
      ?auto_997993 - HOIST
      ?auto_997992 - SURFACE
      ?auto_997994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997990 ?auto_997991 ) ( IS-CRATE ?auto_997989 ) ( not ( = ?auto_997988 ?auto_997989 ) ) ( not ( = ?auto_997987 ?auto_997988 ) ) ( not ( = ?auto_997987 ?auto_997989 ) ) ( not ( = ?auto_997995 ?auto_997991 ) ) ( HOIST-AT ?auto_997993 ?auto_997995 ) ( not ( = ?auto_997990 ?auto_997993 ) ) ( AVAILABLE ?auto_997993 ) ( SURFACE-AT ?auto_997989 ?auto_997995 ) ( ON ?auto_997989 ?auto_997992 ) ( CLEAR ?auto_997989 ) ( not ( = ?auto_997988 ?auto_997992 ) ) ( not ( = ?auto_997989 ?auto_997992 ) ) ( not ( = ?auto_997987 ?auto_997992 ) ) ( TRUCK-AT ?auto_997994 ?auto_997991 ) ( SURFACE-AT ?auto_997987 ?auto_997991 ) ( CLEAR ?auto_997987 ) ( IS-CRATE ?auto_997988 ) ( AVAILABLE ?auto_997990 ) ( IN ?auto_997988 ?auto_997994 ) ( ON ?auto_997981 ?auto_997980 ) ( ON ?auto_997982 ?auto_997981 ) ( ON ?auto_997979 ?auto_997982 ) ( ON ?auto_997983 ?auto_997979 ) ( ON ?auto_997985 ?auto_997983 ) ( ON ?auto_997984 ?auto_997985 ) ( ON ?auto_997986 ?auto_997984 ) ( ON ?auto_997987 ?auto_997986 ) ( not ( = ?auto_997980 ?auto_997981 ) ) ( not ( = ?auto_997980 ?auto_997982 ) ) ( not ( = ?auto_997980 ?auto_997979 ) ) ( not ( = ?auto_997980 ?auto_997983 ) ) ( not ( = ?auto_997980 ?auto_997985 ) ) ( not ( = ?auto_997980 ?auto_997984 ) ) ( not ( = ?auto_997980 ?auto_997986 ) ) ( not ( = ?auto_997980 ?auto_997987 ) ) ( not ( = ?auto_997980 ?auto_997988 ) ) ( not ( = ?auto_997980 ?auto_997989 ) ) ( not ( = ?auto_997980 ?auto_997992 ) ) ( not ( = ?auto_997981 ?auto_997982 ) ) ( not ( = ?auto_997981 ?auto_997979 ) ) ( not ( = ?auto_997981 ?auto_997983 ) ) ( not ( = ?auto_997981 ?auto_997985 ) ) ( not ( = ?auto_997981 ?auto_997984 ) ) ( not ( = ?auto_997981 ?auto_997986 ) ) ( not ( = ?auto_997981 ?auto_997987 ) ) ( not ( = ?auto_997981 ?auto_997988 ) ) ( not ( = ?auto_997981 ?auto_997989 ) ) ( not ( = ?auto_997981 ?auto_997992 ) ) ( not ( = ?auto_997982 ?auto_997979 ) ) ( not ( = ?auto_997982 ?auto_997983 ) ) ( not ( = ?auto_997982 ?auto_997985 ) ) ( not ( = ?auto_997982 ?auto_997984 ) ) ( not ( = ?auto_997982 ?auto_997986 ) ) ( not ( = ?auto_997982 ?auto_997987 ) ) ( not ( = ?auto_997982 ?auto_997988 ) ) ( not ( = ?auto_997982 ?auto_997989 ) ) ( not ( = ?auto_997982 ?auto_997992 ) ) ( not ( = ?auto_997979 ?auto_997983 ) ) ( not ( = ?auto_997979 ?auto_997985 ) ) ( not ( = ?auto_997979 ?auto_997984 ) ) ( not ( = ?auto_997979 ?auto_997986 ) ) ( not ( = ?auto_997979 ?auto_997987 ) ) ( not ( = ?auto_997979 ?auto_997988 ) ) ( not ( = ?auto_997979 ?auto_997989 ) ) ( not ( = ?auto_997979 ?auto_997992 ) ) ( not ( = ?auto_997983 ?auto_997985 ) ) ( not ( = ?auto_997983 ?auto_997984 ) ) ( not ( = ?auto_997983 ?auto_997986 ) ) ( not ( = ?auto_997983 ?auto_997987 ) ) ( not ( = ?auto_997983 ?auto_997988 ) ) ( not ( = ?auto_997983 ?auto_997989 ) ) ( not ( = ?auto_997983 ?auto_997992 ) ) ( not ( = ?auto_997985 ?auto_997984 ) ) ( not ( = ?auto_997985 ?auto_997986 ) ) ( not ( = ?auto_997985 ?auto_997987 ) ) ( not ( = ?auto_997985 ?auto_997988 ) ) ( not ( = ?auto_997985 ?auto_997989 ) ) ( not ( = ?auto_997985 ?auto_997992 ) ) ( not ( = ?auto_997984 ?auto_997986 ) ) ( not ( = ?auto_997984 ?auto_997987 ) ) ( not ( = ?auto_997984 ?auto_997988 ) ) ( not ( = ?auto_997984 ?auto_997989 ) ) ( not ( = ?auto_997984 ?auto_997992 ) ) ( not ( = ?auto_997986 ?auto_997987 ) ) ( not ( = ?auto_997986 ?auto_997988 ) ) ( not ( = ?auto_997986 ?auto_997989 ) ) ( not ( = ?auto_997986 ?auto_997992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997987 ?auto_997988 ?auto_997989 )
      ( MAKE-10CRATE-VERIFY ?auto_997980 ?auto_997981 ?auto_997982 ?auto_997979 ?auto_997983 ?auto_997985 ?auto_997984 ?auto_997986 ?auto_997987 ?auto_997988 ?auto_997989 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005228 - SURFACE
      ?auto_1005229 - SURFACE
      ?auto_1005230 - SURFACE
      ?auto_1005227 - SURFACE
      ?auto_1005231 - SURFACE
      ?auto_1005233 - SURFACE
      ?auto_1005232 - SURFACE
      ?auto_1005234 - SURFACE
      ?auto_1005235 - SURFACE
      ?auto_1005236 - SURFACE
      ?auto_1005237 - SURFACE
      ?auto_1005238 - SURFACE
    )
    :vars
    (
      ?auto_1005240 - HOIST
      ?auto_1005239 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005240 ?auto_1005239 ) ( SURFACE-AT ?auto_1005237 ?auto_1005239 ) ( CLEAR ?auto_1005237 ) ( LIFTING ?auto_1005240 ?auto_1005238 ) ( IS-CRATE ?auto_1005238 ) ( not ( = ?auto_1005237 ?auto_1005238 ) ) ( ON ?auto_1005229 ?auto_1005228 ) ( ON ?auto_1005230 ?auto_1005229 ) ( ON ?auto_1005227 ?auto_1005230 ) ( ON ?auto_1005231 ?auto_1005227 ) ( ON ?auto_1005233 ?auto_1005231 ) ( ON ?auto_1005232 ?auto_1005233 ) ( ON ?auto_1005234 ?auto_1005232 ) ( ON ?auto_1005235 ?auto_1005234 ) ( ON ?auto_1005236 ?auto_1005235 ) ( ON ?auto_1005237 ?auto_1005236 ) ( not ( = ?auto_1005228 ?auto_1005229 ) ) ( not ( = ?auto_1005228 ?auto_1005230 ) ) ( not ( = ?auto_1005228 ?auto_1005227 ) ) ( not ( = ?auto_1005228 ?auto_1005231 ) ) ( not ( = ?auto_1005228 ?auto_1005233 ) ) ( not ( = ?auto_1005228 ?auto_1005232 ) ) ( not ( = ?auto_1005228 ?auto_1005234 ) ) ( not ( = ?auto_1005228 ?auto_1005235 ) ) ( not ( = ?auto_1005228 ?auto_1005236 ) ) ( not ( = ?auto_1005228 ?auto_1005237 ) ) ( not ( = ?auto_1005228 ?auto_1005238 ) ) ( not ( = ?auto_1005229 ?auto_1005230 ) ) ( not ( = ?auto_1005229 ?auto_1005227 ) ) ( not ( = ?auto_1005229 ?auto_1005231 ) ) ( not ( = ?auto_1005229 ?auto_1005233 ) ) ( not ( = ?auto_1005229 ?auto_1005232 ) ) ( not ( = ?auto_1005229 ?auto_1005234 ) ) ( not ( = ?auto_1005229 ?auto_1005235 ) ) ( not ( = ?auto_1005229 ?auto_1005236 ) ) ( not ( = ?auto_1005229 ?auto_1005237 ) ) ( not ( = ?auto_1005229 ?auto_1005238 ) ) ( not ( = ?auto_1005230 ?auto_1005227 ) ) ( not ( = ?auto_1005230 ?auto_1005231 ) ) ( not ( = ?auto_1005230 ?auto_1005233 ) ) ( not ( = ?auto_1005230 ?auto_1005232 ) ) ( not ( = ?auto_1005230 ?auto_1005234 ) ) ( not ( = ?auto_1005230 ?auto_1005235 ) ) ( not ( = ?auto_1005230 ?auto_1005236 ) ) ( not ( = ?auto_1005230 ?auto_1005237 ) ) ( not ( = ?auto_1005230 ?auto_1005238 ) ) ( not ( = ?auto_1005227 ?auto_1005231 ) ) ( not ( = ?auto_1005227 ?auto_1005233 ) ) ( not ( = ?auto_1005227 ?auto_1005232 ) ) ( not ( = ?auto_1005227 ?auto_1005234 ) ) ( not ( = ?auto_1005227 ?auto_1005235 ) ) ( not ( = ?auto_1005227 ?auto_1005236 ) ) ( not ( = ?auto_1005227 ?auto_1005237 ) ) ( not ( = ?auto_1005227 ?auto_1005238 ) ) ( not ( = ?auto_1005231 ?auto_1005233 ) ) ( not ( = ?auto_1005231 ?auto_1005232 ) ) ( not ( = ?auto_1005231 ?auto_1005234 ) ) ( not ( = ?auto_1005231 ?auto_1005235 ) ) ( not ( = ?auto_1005231 ?auto_1005236 ) ) ( not ( = ?auto_1005231 ?auto_1005237 ) ) ( not ( = ?auto_1005231 ?auto_1005238 ) ) ( not ( = ?auto_1005233 ?auto_1005232 ) ) ( not ( = ?auto_1005233 ?auto_1005234 ) ) ( not ( = ?auto_1005233 ?auto_1005235 ) ) ( not ( = ?auto_1005233 ?auto_1005236 ) ) ( not ( = ?auto_1005233 ?auto_1005237 ) ) ( not ( = ?auto_1005233 ?auto_1005238 ) ) ( not ( = ?auto_1005232 ?auto_1005234 ) ) ( not ( = ?auto_1005232 ?auto_1005235 ) ) ( not ( = ?auto_1005232 ?auto_1005236 ) ) ( not ( = ?auto_1005232 ?auto_1005237 ) ) ( not ( = ?auto_1005232 ?auto_1005238 ) ) ( not ( = ?auto_1005234 ?auto_1005235 ) ) ( not ( = ?auto_1005234 ?auto_1005236 ) ) ( not ( = ?auto_1005234 ?auto_1005237 ) ) ( not ( = ?auto_1005234 ?auto_1005238 ) ) ( not ( = ?auto_1005235 ?auto_1005236 ) ) ( not ( = ?auto_1005235 ?auto_1005237 ) ) ( not ( = ?auto_1005235 ?auto_1005238 ) ) ( not ( = ?auto_1005236 ?auto_1005237 ) ) ( not ( = ?auto_1005236 ?auto_1005238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1005237 ?auto_1005238 )
      ( MAKE-11CRATE-VERIFY ?auto_1005228 ?auto_1005229 ?auto_1005230 ?auto_1005227 ?auto_1005231 ?auto_1005233 ?auto_1005232 ?auto_1005234 ?auto_1005235 ?auto_1005236 ?auto_1005237 ?auto_1005238 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005337 - SURFACE
      ?auto_1005338 - SURFACE
      ?auto_1005339 - SURFACE
      ?auto_1005336 - SURFACE
      ?auto_1005340 - SURFACE
      ?auto_1005342 - SURFACE
      ?auto_1005341 - SURFACE
      ?auto_1005343 - SURFACE
      ?auto_1005344 - SURFACE
      ?auto_1005345 - SURFACE
      ?auto_1005346 - SURFACE
      ?auto_1005347 - SURFACE
    )
    :vars
    (
      ?auto_1005348 - HOIST
      ?auto_1005350 - PLACE
      ?auto_1005349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005348 ?auto_1005350 ) ( SURFACE-AT ?auto_1005346 ?auto_1005350 ) ( CLEAR ?auto_1005346 ) ( IS-CRATE ?auto_1005347 ) ( not ( = ?auto_1005346 ?auto_1005347 ) ) ( TRUCK-AT ?auto_1005349 ?auto_1005350 ) ( AVAILABLE ?auto_1005348 ) ( IN ?auto_1005347 ?auto_1005349 ) ( ON ?auto_1005346 ?auto_1005345 ) ( not ( = ?auto_1005345 ?auto_1005346 ) ) ( not ( = ?auto_1005345 ?auto_1005347 ) ) ( ON ?auto_1005338 ?auto_1005337 ) ( ON ?auto_1005339 ?auto_1005338 ) ( ON ?auto_1005336 ?auto_1005339 ) ( ON ?auto_1005340 ?auto_1005336 ) ( ON ?auto_1005342 ?auto_1005340 ) ( ON ?auto_1005341 ?auto_1005342 ) ( ON ?auto_1005343 ?auto_1005341 ) ( ON ?auto_1005344 ?auto_1005343 ) ( ON ?auto_1005345 ?auto_1005344 ) ( not ( = ?auto_1005337 ?auto_1005338 ) ) ( not ( = ?auto_1005337 ?auto_1005339 ) ) ( not ( = ?auto_1005337 ?auto_1005336 ) ) ( not ( = ?auto_1005337 ?auto_1005340 ) ) ( not ( = ?auto_1005337 ?auto_1005342 ) ) ( not ( = ?auto_1005337 ?auto_1005341 ) ) ( not ( = ?auto_1005337 ?auto_1005343 ) ) ( not ( = ?auto_1005337 ?auto_1005344 ) ) ( not ( = ?auto_1005337 ?auto_1005345 ) ) ( not ( = ?auto_1005337 ?auto_1005346 ) ) ( not ( = ?auto_1005337 ?auto_1005347 ) ) ( not ( = ?auto_1005338 ?auto_1005339 ) ) ( not ( = ?auto_1005338 ?auto_1005336 ) ) ( not ( = ?auto_1005338 ?auto_1005340 ) ) ( not ( = ?auto_1005338 ?auto_1005342 ) ) ( not ( = ?auto_1005338 ?auto_1005341 ) ) ( not ( = ?auto_1005338 ?auto_1005343 ) ) ( not ( = ?auto_1005338 ?auto_1005344 ) ) ( not ( = ?auto_1005338 ?auto_1005345 ) ) ( not ( = ?auto_1005338 ?auto_1005346 ) ) ( not ( = ?auto_1005338 ?auto_1005347 ) ) ( not ( = ?auto_1005339 ?auto_1005336 ) ) ( not ( = ?auto_1005339 ?auto_1005340 ) ) ( not ( = ?auto_1005339 ?auto_1005342 ) ) ( not ( = ?auto_1005339 ?auto_1005341 ) ) ( not ( = ?auto_1005339 ?auto_1005343 ) ) ( not ( = ?auto_1005339 ?auto_1005344 ) ) ( not ( = ?auto_1005339 ?auto_1005345 ) ) ( not ( = ?auto_1005339 ?auto_1005346 ) ) ( not ( = ?auto_1005339 ?auto_1005347 ) ) ( not ( = ?auto_1005336 ?auto_1005340 ) ) ( not ( = ?auto_1005336 ?auto_1005342 ) ) ( not ( = ?auto_1005336 ?auto_1005341 ) ) ( not ( = ?auto_1005336 ?auto_1005343 ) ) ( not ( = ?auto_1005336 ?auto_1005344 ) ) ( not ( = ?auto_1005336 ?auto_1005345 ) ) ( not ( = ?auto_1005336 ?auto_1005346 ) ) ( not ( = ?auto_1005336 ?auto_1005347 ) ) ( not ( = ?auto_1005340 ?auto_1005342 ) ) ( not ( = ?auto_1005340 ?auto_1005341 ) ) ( not ( = ?auto_1005340 ?auto_1005343 ) ) ( not ( = ?auto_1005340 ?auto_1005344 ) ) ( not ( = ?auto_1005340 ?auto_1005345 ) ) ( not ( = ?auto_1005340 ?auto_1005346 ) ) ( not ( = ?auto_1005340 ?auto_1005347 ) ) ( not ( = ?auto_1005342 ?auto_1005341 ) ) ( not ( = ?auto_1005342 ?auto_1005343 ) ) ( not ( = ?auto_1005342 ?auto_1005344 ) ) ( not ( = ?auto_1005342 ?auto_1005345 ) ) ( not ( = ?auto_1005342 ?auto_1005346 ) ) ( not ( = ?auto_1005342 ?auto_1005347 ) ) ( not ( = ?auto_1005341 ?auto_1005343 ) ) ( not ( = ?auto_1005341 ?auto_1005344 ) ) ( not ( = ?auto_1005341 ?auto_1005345 ) ) ( not ( = ?auto_1005341 ?auto_1005346 ) ) ( not ( = ?auto_1005341 ?auto_1005347 ) ) ( not ( = ?auto_1005343 ?auto_1005344 ) ) ( not ( = ?auto_1005343 ?auto_1005345 ) ) ( not ( = ?auto_1005343 ?auto_1005346 ) ) ( not ( = ?auto_1005343 ?auto_1005347 ) ) ( not ( = ?auto_1005344 ?auto_1005345 ) ) ( not ( = ?auto_1005344 ?auto_1005346 ) ) ( not ( = ?auto_1005344 ?auto_1005347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005345 ?auto_1005346 ?auto_1005347 )
      ( MAKE-11CRATE-VERIFY ?auto_1005337 ?auto_1005338 ?auto_1005339 ?auto_1005336 ?auto_1005340 ?auto_1005342 ?auto_1005341 ?auto_1005343 ?auto_1005344 ?auto_1005345 ?auto_1005346 ?auto_1005347 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005458 - SURFACE
      ?auto_1005459 - SURFACE
      ?auto_1005460 - SURFACE
      ?auto_1005457 - SURFACE
      ?auto_1005461 - SURFACE
      ?auto_1005463 - SURFACE
      ?auto_1005462 - SURFACE
      ?auto_1005464 - SURFACE
      ?auto_1005465 - SURFACE
      ?auto_1005466 - SURFACE
      ?auto_1005467 - SURFACE
      ?auto_1005468 - SURFACE
    )
    :vars
    (
      ?auto_1005469 - HOIST
      ?auto_1005471 - PLACE
      ?auto_1005472 - TRUCK
      ?auto_1005470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005469 ?auto_1005471 ) ( SURFACE-AT ?auto_1005467 ?auto_1005471 ) ( CLEAR ?auto_1005467 ) ( IS-CRATE ?auto_1005468 ) ( not ( = ?auto_1005467 ?auto_1005468 ) ) ( AVAILABLE ?auto_1005469 ) ( IN ?auto_1005468 ?auto_1005472 ) ( ON ?auto_1005467 ?auto_1005466 ) ( not ( = ?auto_1005466 ?auto_1005467 ) ) ( not ( = ?auto_1005466 ?auto_1005468 ) ) ( TRUCK-AT ?auto_1005472 ?auto_1005470 ) ( not ( = ?auto_1005470 ?auto_1005471 ) ) ( ON ?auto_1005459 ?auto_1005458 ) ( ON ?auto_1005460 ?auto_1005459 ) ( ON ?auto_1005457 ?auto_1005460 ) ( ON ?auto_1005461 ?auto_1005457 ) ( ON ?auto_1005463 ?auto_1005461 ) ( ON ?auto_1005462 ?auto_1005463 ) ( ON ?auto_1005464 ?auto_1005462 ) ( ON ?auto_1005465 ?auto_1005464 ) ( ON ?auto_1005466 ?auto_1005465 ) ( not ( = ?auto_1005458 ?auto_1005459 ) ) ( not ( = ?auto_1005458 ?auto_1005460 ) ) ( not ( = ?auto_1005458 ?auto_1005457 ) ) ( not ( = ?auto_1005458 ?auto_1005461 ) ) ( not ( = ?auto_1005458 ?auto_1005463 ) ) ( not ( = ?auto_1005458 ?auto_1005462 ) ) ( not ( = ?auto_1005458 ?auto_1005464 ) ) ( not ( = ?auto_1005458 ?auto_1005465 ) ) ( not ( = ?auto_1005458 ?auto_1005466 ) ) ( not ( = ?auto_1005458 ?auto_1005467 ) ) ( not ( = ?auto_1005458 ?auto_1005468 ) ) ( not ( = ?auto_1005459 ?auto_1005460 ) ) ( not ( = ?auto_1005459 ?auto_1005457 ) ) ( not ( = ?auto_1005459 ?auto_1005461 ) ) ( not ( = ?auto_1005459 ?auto_1005463 ) ) ( not ( = ?auto_1005459 ?auto_1005462 ) ) ( not ( = ?auto_1005459 ?auto_1005464 ) ) ( not ( = ?auto_1005459 ?auto_1005465 ) ) ( not ( = ?auto_1005459 ?auto_1005466 ) ) ( not ( = ?auto_1005459 ?auto_1005467 ) ) ( not ( = ?auto_1005459 ?auto_1005468 ) ) ( not ( = ?auto_1005460 ?auto_1005457 ) ) ( not ( = ?auto_1005460 ?auto_1005461 ) ) ( not ( = ?auto_1005460 ?auto_1005463 ) ) ( not ( = ?auto_1005460 ?auto_1005462 ) ) ( not ( = ?auto_1005460 ?auto_1005464 ) ) ( not ( = ?auto_1005460 ?auto_1005465 ) ) ( not ( = ?auto_1005460 ?auto_1005466 ) ) ( not ( = ?auto_1005460 ?auto_1005467 ) ) ( not ( = ?auto_1005460 ?auto_1005468 ) ) ( not ( = ?auto_1005457 ?auto_1005461 ) ) ( not ( = ?auto_1005457 ?auto_1005463 ) ) ( not ( = ?auto_1005457 ?auto_1005462 ) ) ( not ( = ?auto_1005457 ?auto_1005464 ) ) ( not ( = ?auto_1005457 ?auto_1005465 ) ) ( not ( = ?auto_1005457 ?auto_1005466 ) ) ( not ( = ?auto_1005457 ?auto_1005467 ) ) ( not ( = ?auto_1005457 ?auto_1005468 ) ) ( not ( = ?auto_1005461 ?auto_1005463 ) ) ( not ( = ?auto_1005461 ?auto_1005462 ) ) ( not ( = ?auto_1005461 ?auto_1005464 ) ) ( not ( = ?auto_1005461 ?auto_1005465 ) ) ( not ( = ?auto_1005461 ?auto_1005466 ) ) ( not ( = ?auto_1005461 ?auto_1005467 ) ) ( not ( = ?auto_1005461 ?auto_1005468 ) ) ( not ( = ?auto_1005463 ?auto_1005462 ) ) ( not ( = ?auto_1005463 ?auto_1005464 ) ) ( not ( = ?auto_1005463 ?auto_1005465 ) ) ( not ( = ?auto_1005463 ?auto_1005466 ) ) ( not ( = ?auto_1005463 ?auto_1005467 ) ) ( not ( = ?auto_1005463 ?auto_1005468 ) ) ( not ( = ?auto_1005462 ?auto_1005464 ) ) ( not ( = ?auto_1005462 ?auto_1005465 ) ) ( not ( = ?auto_1005462 ?auto_1005466 ) ) ( not ( = ?auto_1005462 ?auto_1005467 ) ) ( not ( = ?auto_1005462 ?auto_1005468 ) ) ( not ( = ?auto_1005464 ?auto_1005465 ) ) ( not ( = ?auto_1005464 ?auto_1005466 ) ) ( not ( = ?auto_1005464 ?auto_1005467 ) ) ( not ( = ?auto_1005464 ?auto_1005468 ) ) ( not ( = ?auto_1005465 ?auto_1005466 ) ) ( not ( = ?auto_1005465 ?auto_1005467 ) ) ( not ( = ?auto_1005465 ?auto_1005468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005466 ?auto_1005467 ?auto_1005468 )
      ( MAKE-11CRATE-VERIFY ?auto_1005458 ?auto_1005459 ?auto_1005460 ?auto_1005457 ?auto_1005461 ?auto_1005463 ?auto_1005462 ?auto_1005464 ?auto_1005465 ?auto_1005466 ?auto_1005467 ?auto_1005468 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005590 - SURFACE
      ?auto_1005591 - SURFACE
      ?auto_1005592 - SURFACE
      ?auto_1005589 - SURFACE
      ?auto_1005593 - SURFACE
      ?auto_1005595 - SURFACE
      ?auto_1005594 - SURFACE
      ?auto_1005596 - SURFACE
      ?auto_1005597 - SURFACE
      ?auto_1005598 - SURFACE
      ?auto_1005599 - SURFACE
      ?auto_1005600 - SURFACE
    )
    :vars
    (
      ?auto_1005605 - HOIST
      ?auto_1005602 - PLACE
      ?auto_1005603 - TRUCK
      ?auto_1005601 - PLACE
      ?auto_1005604 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005605 ?auto_1005602 ) ( SURFACE-AT ?auto_1005599 ?auto_1005602 ) ( CLEAR ?auto_1005599 ) ( IS-CRATE ?auto_1005600 ) ( not ( = ?auto_1005599 ?auto_1005600 ) ) ( AVAILABLE ?auto_1005605 ) ( ON ?auto_1005599 ?auto_1005598 ) ( not ( = ?auto_1005598 ?auto_1005599 ) ) ( not ( = ?auto_1005598 ?auto_1005600 ) ) ( TRUCK-AT ?auto_1005603 ?auto_1005601 ) ( not ( = ?auto_1005601 ?auto_1005602 ) ) ( HOIST-AT ?auto_1005604 ?auto_1005601 ) ( LIFTING ?auto_1005604 ?auto_1005600 ) ( not ( = ?auto_1005605 ?auto_1005604 ) ) ( ON ?auto_1005591 ?auto_1005590 ) ( ON ?auto_1005592 ?auto_1005591 ) ( ON ?auto_1005589 ?auto_1005592 ) ( ON ?auto_1005593 ?auto_1005589 ) ( ON ?auto_1005595 ?auto_1005593 ) ( ON ?auto_1005594 ?auto_1005595 ) ( ON ?auto_1005596 ?auto_1005594 ) ( ON ?auto_1005597 ?auto_1005596 ) ( ON ?auto_1005598 ?auto_1005597 ) ( not ( = ?auto_1005590 ?auto_1005591 ) ) ( not ( = ?auto_1005590 ?auto_1005592 ) ) ( not ( = ?auto_1005590 ?auto_1005589 ) ) ( not ( = ?auto_1005590 ?auto_1005593 ) ) ( not ( = ?auto_1005590 ?auto_1005595 ) ) ( not ( = ?auto_1005590 ?auto_1005594 ) ) ( not ( = ?auto_1005590 ?auto_1005596 ) ) ( not ( = ?auto_1005590 ?auto_1005597 ) ) ( not ( = ?auto_1005590 ?auto_1005598 ) ) ( not ( = ?auto_1005590 ?auto_1005599 ) ) ( not ( = ?auto_1005590 ?auto_1005600 ) ) ( not ( = ?auto_1005591 ?auto_1005592 ) ) ( not ( = ?auto_1005591 ?auto_1005589 ) ) ( not ( = ?auto_1005591 ?auto_1005593 ) ) ( not ( = ?auto_1005591 ?auto_1005595 ) ) ( not ( = ?auto_1005591 ?auto_1005594 ) ) ( not ( = ?auto_1005591 ?auto_1005596 ) ) ( not ( = ?auto_1005591 ?auto_1005597 ) ) ( not ( = ?auto_1005591 ?auto_1005598 ) ) ( not ( = ?auto_1005591 ?auto_1005599 ) ) ( not ( = ?auto_1005591 ?auto_1005600 ) ) ( not ( = ?auto_1005592 ?auto_1005589 ) ) ( not ( = ?auto_1005592 ?auto_1005593 ) ) ( not ( = ?auto_1005592 ?auto_1005595 ) ) ( not ( = ?auto_1005592 ?auto_1005594 ) ) ( not ( = ?auto_1005592 ?auto_1005596 ) ) ( not ( = ?auto_1005592 ?auto_1005597 ) ) ( not ( = ?auto_1005592 ?auto_1005598 ) ) ( not ( = ?auto_1005592 ?auto_1005599 ) ) ( not ( = ?auto_1005592 ?auto_1005600 ) ) ( not ( = ?auto_1005589 ?auto_1005593 ) ) ( not ( = ?auto_1005589 ?auto_1005595 ) ) ( not ( = ?auto_1005589 ?auto_1005594 ) ) ( not ( = ?auto_1005589 ?auto_1005596 ) ) ( not ( = ?auto_1005589 ?auto_1005597 ) ) ( not ( = ?auto_1005589 ?auto_1005598 ) ) ( not ( = ?auto_1005589 ?auto_1005599 ) ) ( not ( = ?auto_1005589 ?auto_1005600 ) ) ( not ( = ?auto_1005593 ?auto_1005595 ) ) ( not ( = ?auto_1005593 ?auto_1005594 ) ) ( not ( = ?auto_1005593 ?auto_1005596 ) ) ( not ( = ?auto_1005593 ?auto_1005597 ) ) ( not ( = ?auto_1005593 ?auto_1005598 ) ) ( not ( = ?auto_1005593 ?auto_1005599 ) ) ( not ( = ?auto_1005593 ?auto_1005600 ) ) ( not ( = ?auto_1005595 ?auto_1005594 ) ) ( not ( = ?auto_1005595 ?auto_1005596 ) ) ( not ( = ?auto_1005595 ?auto_1005597 ) ) ( not ( = ?auto_1005595 ?auto_1005598 ) ) ( not ( = ?auto_1005595 ?auto_1005599 ) ) ( not ( = ?auto_1005595 ?auto_1005600 ) ) ( not ( = ?auto_1005594 ?auto_1005596 ) ) ( not ( = ?auto_1005594 ?auto_1005597 ) ) ( not ( = ?auto_1005594 ?auto_1005598 ) ) ( not ( = ?auto_1005594 ?auto_1005599 ) ) ( not ( = ?auto_1005594 ?auto_1005600 ) ) ( not ( = ?auto_1005596 ?auto_1005597 ) ) ( not ( = ?auto_1005596 ?auto_1005598 ) ) ( not ( = ?auto_1005596 ?auto_1005599 ) ) ( not ( = ?auto_1005596 ?auto_1005600 ) ) ( not ( = ?auto_1005597 ?auto_1005598 ) ) ( not ( = ?auto_1005597 ?auto_1005599 ) ) ( not ( = ?auto_1005597 ?auto_1005600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005598 ?auto_1005599 ?auto_1005600 )
      ( MAKE-11CRATE-VERIFY ?auto_1005590 ?auto_1005591 ?auto_1005592 ?auto_1005589 ?auto_1005593 ?auto_1005595 ?auto_1005594 ?auto_1005596 ?auto_1005597 ?auto_1005598 ?auto_1005599 ?auto_1005600 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005733 - SURFACE
      ?auto_1005734 - SURFACE
      ?auto_1005735 - SURFACE
      ?auto_1005732 - SURFACE
      ?auto_1005736 - SURFACE
      ?auto_1005738 - SURFACE
      ?auto_1005737 - SURFACE
      ?auto_1005739 - SURFACE
      ?auto_1005740 - SURFACE
      ?auto_1005741 - SURFACE
      ?auto_1005742 - SURFACE
      ?auto_1005743 - SURFACE
    )
    :vars
    (
      ?auto_1005746 - HOIST
      ?auto_1005744 - PLACE
      ?auto_1005745 - TRUCK
      ?auto_1005747 - PLACE
      ?auto_1005748 - HOIST
      ?auto_1005749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005746 ?auto_1005744 ) ( SURFACE-AT ?auto_1005742 ?auto_1005744 ) ( CLEAR ?auto_1005742 ) ( IS-CRATE ?auto_1005743 ) ( not ( = ?auto_1005742 ?auto_1005743 ) ) ( AVAILABLE ?auto_1005746 ) ( ON ?auto_1005742 ?auto_1005741 ) ( not ( = ?auto_1005741 ?auto_1005742 ) ) ( not ( = ?auto_1005741 ?auto_1005743 ) ) ( TRUCK-AT ?auto_1005745 ?auto_1005747 ) ( not ( = ?auto_1005747 ?auto_1005744 ) ) ( HOIST-AT ?auto_1005748 ?auto_1005747 ) ( not ( = ?auto_1005746 ?auto_1005748 ) ) ( AVAILABLE ?auto_1005748 ) ( SURFACE-AT ?auto_1005743 ?auto_1005747 ) ( ON ?auto_1005743 ?auto_1005749 ) ( CLEAR ?auto_1005743 ) ( not ( = ?auto_1005742 ?auto_1005749 ) ) ( not ( = ?auto_1005743 ?auto_1005749 ) ) ( not ( = ?auto_1005741 ?auto_1005749 ) ) ( ON ?auto_1005734 ?auto_1005733 ) ( ON ?auto_1005735 ?auto_1005734 ) ( ON ?auto_1005732 ?auto_1005735 ) ( ON ?auto_1005736 ?auto_1005732 ) ( ON ?auto_1005738 ?auto_1005736 ) ( ON ?auto_1005737 ?auto_1005738 ) ( ON ?auto_1005739 ?auto_1005737 ) ( ON ?auto_1005740 ?auto_1005739 ) ( ON ?auto_1005741 ?auto_1005740 ) ( not ( = ?auto_1005733 ?auto_1005734 ) ) ( not ( = ?auto_1005733 ?auto_1005735 ) ) ( not ( = ?auto_1005733 ?auto_1005732 ) ) ( not ( = ?auto_1005733 ?auto_1005736 ) ) ( not ( = ?auto_1005733 ?auto_1005738 ) ) ( not ( = ?auto_1005733 ?auto_1005737 ) ) ( not ( = ?auto_1005733 ?auto_1005739 ) ) ( not ( = ?auto_1005733 ?auto_1005740 ) ) ( not ( = ?auto_1005733 ?auto_1005741 ) ) ( not ( = ?auto_1005733 ?auto_1005742 ) ) ( not ( = ?auto_1005733 ?auto_1005743 ) ) ( not ( = ?auto_1005733 ?auto_1005749 ) ) ( not ( = ?auto_1005734 ?auto_1005735 ) ) ( not ( = ?auto_1005734 ?auto_1005732 ) ) ( not ( = ?auto_1005734 ?auto_1005736 ) ) ( not ( = ?auto_1005734 ?auto_1005738 ) ) ( not ( = ?auto_1005734 ?auto_1005737 ) ) ( not ( = ?auto_1005734 ?auto_1005739 ) ) ( not ( = ?auto_1005734 ?auto_1005740 ) ) ( not ( = ?auto_1005734 ?auto_1005741 ) ) ( not ( = ?auto_1005734 ?auto_1005742 ) ) ( not ( = ?auto_1005734 ?auto_1005743 ) ) ( not ( = ?auto_1005734 ?auto_1005749 ) ) ( not ( = ?auto_1005735 ?auto_1005732 ) ) ( not ( = ?auto_1005735 ?auto_1005736 ) ) ( not ( = ?auto_1005735 ?auto_1005738 ) ) ( not ( = ?auto_1005735 ?auto_1005737 ) ) ( not ( = ?auto_1005735 ?auto_1005739 ) ) ( not ( = ?auto_1005735 ?auto_1005740 ) ) ( not ( = ?auto_1005735 ?auto_1005741 ) ) ( not ( = ?auto_1005735 ?auto_1005742 ) ) ( not ( = ?auto_1005735 ?auto_1005743 ) ) ( not ( = ?auto_1005735 ?auto_1005749 ) ) ( not ( = ?auto_1005732 ?auto_1005736 ) ) ( not ( = ?auto_1005732 ?auto_1005738 ) ) ( not ( = ?auto_1005732 ?auto_1005737 ) ) ( not ( = ?auto_1005732 ?auto_1005739 ) ) ( not ( = ?auto_1005732 ?auto_1005740 ) ) ( not ( = ?auto_1005732 ?auto_1005741 ) ) ( not ( = ?auto_1005732 ?auto_1005742 ) ) ( not ( = ?auto_1005732 ?auto_1005743 ) ) ( not ( = ?auto_1005732 ?auto_1005749 ) ) ( not ( = ?auto_1005736 ?auto_1005738 ) ) ( not ( = ?auto_1005736 ?auto_1005737 ) ) ( not ( = ?auto_1005736 ?auto_1005739 ) ) ( not ( = ?auto_1005736 ?auto_1005740 ) ) ( not ( = ?auto_1005736 ?auto_1005741 ) ) ( not ( = ?auto_1005736 ?auto_1005742 ) ) ( not ( = ?auto_1005736 ?auto_1005743 ) ) ( not ( = ?auto_1005736 ?auto_1005749 ) ) ( not ( = ?auto_1005738 ?auto_1005737 ) ) ( not ( = ?auto_1005738 ?auto_1005739 ) ) ( not ( = ?auto_1005738 ?auto_1005740 ) ) ( not ( = ?auto_1005738 ?auto_1005741 ) ) ( not ( = ?auto_1005738 ?auto_1005742 ) ) ( not ( = ?auto_1005738 ?auto_1005743 ) ) ( not ( = ?auto_1005738 ?auto_1005749 ) ) ( not ( = ?auto_1005737 ?auto_1005739 ) ) ( not ( = ?auto_1005737 ?auto_1005740 ) ) ( not ( = ?auto_1005737 ?auto_1005741 ) ) ( not ( = ?auto_1005737 ?auto_1005742 ) ) ( not ( = ?auto_1005737 ?auto_1005743 ) ) ( not ( = ?auto_1005737 ?auto_1005749 ) ) ( not ( = ?auto_1005739 ?auto_1005740 ) ) ( not ( = ?auto_1005739 ?auto_1005741 ) ) ( not ( = ?auto_1005739 ?auto_1005742 ) ) ( not ( = ?auto_1005739 ?auto_1005743 ) ) ( not ( = ?auto_1005739 ?auto_1005749 ) ) ( not ( = ?auto_1005740 ?auto_1005741 ) ) ( not ( = ?auto_1005740 ?auto_1005742 ) ) ( not ( = ?auto_1005740 ?auto_1005743 ) ) ( not ( = ?auto_1005740 ?auto_1005749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005741 ?auto_1005742 ?auto_1005743 )
      ( MAKE-11CRATE-VERIFY ?auto_1005733 ?auto_1005734 ?auto_1005735 ?auto_1005732 ?auto_1005736 ?auto_1005738 ?auto_1005737 ?auto_1005739 ?auto_1005740 ?auto_1005741 ?auto_1005742 ?auto_1005743 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005877 - SURFACE
      ?auto_1005878 - SURFACE
      ?auto_1005879 - SURFACE
      ?auto_1005876 - SURFACE
      ?auto_1005880 - SURFACE
      ?auto_1005882 - SURFACE
      ?auto_1005881 - SURFACE
      ?auto_1005883 - SURFACE
      ?auto_1005884 - SURFACE
      ?auto_1005885 - SURFACE
      ?auto_1005886 - SURFACE
      ?auto_1005887 - SURFACE
    )
    :vars
    (
      ?auto_1005892 - HOIST
      ?auto_1005891 - PLACE
      ?auto_1005893 - PLACE
      ?auto_1005888 - HOIST
      ?auto_1005890 - SURFACE
      ?auto_1005889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005892 ?auto_1005891 ) ( SURFACE-AT ?auto_1005886 ?auto_1005891 ) ( CLEAR ?auto_1005886 ) ( IS-CRATE ?auto_1005887 ) ( not ( = ?auto_1005886 ?auto_1005887 ) ) ( AVAILABLE ?auto_1005892 ) ( ON ?auto_1005886 ?auto_1005885 ) ( not ( = ?auto_1005885 ?auto_1005886 ) ) ( not ( = ?auto_1005885 ?auto_1005887 ) ) ( not ( = ?auto_1005893 ?auto_1005891 ) ) ( HOIST-AT ?auto_1005888 ?auto_1005893 ) ( not ( = ?auto_1005892 ?auto_1005888 ) ) ( AVAILABLE ?auto_1005888 ) ( SURFACE-AT ?auto_1005887 ?auto_1005893 ) ( ON ?auto_1005887 ?auto_1005890 ) ( CLEAR ?auto_1005887 ) ( not ( = ?auto_1005886 ?auto_1005890 ) ) ( not ( = ?auto_1005887 ?auto_1005890 ) ) ( not ( = ?auto_1005885 ?auto_1005890 ) ) ( TRUCK-AT ?auto_1005889 ?auto_1005891 ) ( ON ?auto_1005878 ?auto_1005877 ) ( ON ?auto_1005879 ?auto_1005878 ) ( ON ?auto_1005876 ?auto_1005879 ) ( ON ?auto_1005880 ?auto_1005876 ) ( ON ?auto_1005882 ?auto_1005880 ) ( ON ?auto_1005881 ?auto_1005882 ) ( ON ?auto_1005883 ?auto_1005881 ) ( ON ?auto_1005884 ?auto_1005883 ) ( ON ?auto_1005885 ?auto_1005884 ) ( not ( = ?auto_1005877 ?auto_1005878 ) ) ( not ( = ?auto_1005877 ?auto_1005879 ) ) ( not ( = ?auto_1005877 ?auto_1005876 ) ) ( not ( = ?auto_1005877 ?auto_1005880 ) ) ( not ( = ?auto_1005877 ?auto_1005882 ) ) ( not ( = ?auto_1005877 ?auto_1005881 ) ) ( not ( = ?auto_1005877 ?auto_1005883 ) ) ( not ( = ?auto_1005877 ?auto_1005884 ) ) ( not ( = ?auto_1005877 ?auto_1005885 ) ) ( not ( = ?auto_1005877 ?auto_1005886 ) ) ( not ( = ?auto_1005877 ?auto_1005887 ) ) ( not ( = ?auto_1005877 ?auto_1005890 ) ) ( not ( = ?auto_1005878 ?auto_1005879 ) ) ( not ( = ?auto_1005878 ?auto_1005876 ) ) ( not ( = ?auto_1005878 ?auto_1005880 ) ) ( not ( = ?auto_1005878 ?auto_1005882 ) ) ( not ( = ?auto_1005878 ?auto_1005881 ) ) ( not ( = ?auto_1005878 ?auto_1005883 ) ) ( not ( = ?auto_1005878 ?auto_1005884 ) ) ( not ( = ?auto_1005878 ?auto_1005885 ) ) ( not ( = ?auto_1005878 ?auto_1005886 ) ) ( not ( = ?auto_1005878 ?auto_1005887 ) ) ( not ( = ?auto_1005878 ?auto_1005890 ) ) ( not ( = ?auto_1005879 ?auto_1005876 ) ) ( not ( = ?auto_1005879 ?auto_1005880 ) ) ( not ( = ?auto_1005879 ?auto_1005882 ) ) ( not ( = ?auto_1005879 ?auto_1005881 ) ) ( not ( = ?auto_1005879 ?auto_1005883 ) ) ( not ( = ?auto_1005879 ?auto_1005884 ) ) ( not ( = ?auto_1005879 ?auto_1005885 ) ) ( not ( = ?auto_1005879 ?auto_1005886 ) ) ( not ( = ?auto_1005879 ?auto_1005887 ) ) ( not ( = ?auto_1005879 ?auto_1005890 ) ) ( not ( = ?auto_1005876 ?auto_1005880 ) ) ( not ( = ?auto_1005876 ?auto_1005882 ) ) ( not ( = ?auto_1005876 ?auto_1005881 ) ) ( not ( = ?auto_1005876 ?auto_1005883 ) ) ( not ( = ?auto_1005876 ?auto_1005884 ) ) ( not ( = ?auto_1005876 ?auto_1005885 ) ) ( not ( = ?auto_1005876 ?auto_1005886 ) ) ( not ( = ?auto_1005876 ?auto_1005887 ) ) ( not ( = ?auto_1005876 ?auto_1005890 ) ) ( not ( = ?auto_1005880 ?auto_1005882 ) ) ( not ( = ?auto_1005880 ?auto_1005881 ) ) ( not ( = ?auto_1005880 ?auto_1005883 ) ) ( not ( = ?auto_1005880 ?auto_1005884 ) ) ( not ( = ?auto_1005880 ?auto_1005885 ) ) ( not ( = ?auto_1005880 ?auto_1005886 ) ) ( not ( = ?auto_1005880 ?auto_1005887 ) ) ( not ( = ?auto_1005880 ?auto_1005890 ) ) ( not ( = ?auto_1005882 ?auto_1005881 ) ) ( not ( = ?auto_1005882 ?auto_1005883 ) ) ( not ( = ?auto_1005882 ?auto_1005884 ) ) ( not ( = ?auto_1005882 ?auto_1005885 ) ) ( not ( = ?auto_1005882 ?auto_1005886 ) ) ( not ( = ?auto_1005882 ?auto_1005887 ) ) ( not ( = ?auto_1005882 ?auto_1005890 ) ) ( not ( = ?auto_1005881 ?auto_1005883 ) ) ( not ( = ?auto_1005881 ?auto_1005884 ) ) ( not ( = ?auto_1005881 ?auto_1005885 ) ) ( not ( = ?auto_1005881 ?auto_1005886 ) ) ( not ( = ?auto_1005881 ?auto_1005887 ) ) ( not ( = ?auto_1005881 ?auto_1005890 ) ) ( not ( = ?auto_1005883 ?auto_1005884 ) ) ( not ( = ?auto_1005883 ?auto_1005885 ) ) ( not ( = ?auto_1005883 ?auto_1005886 ) ) ( not ( = ?auto_1005883 ?auto_1005887 ) ) ( not ( = ?auto_1005883 ?auto_1005890 ) ) ( not ( = ?auto_1005884 ?auto_1005885 ) ) ( not ( = ?auto_1005884 ?auto_1005886 ) ) ( not ( = ?auto_1005884 ?auto_1005887 ) ) ( not ( = ?auto_1005884 ?auto_1005890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005885 ?auto_1005886 ?auto_1005887 )
      ( MAKE-11CRATE-VERIFY ?auto_1005877 ?auto_1005878 ?auto_1005879 ?auto_1005876 ?auto_1005880 ?auto_1005882 ?auto_1005881 ?auto_1005883 ?auto_1005884 ?auto_1005885 ?auto_1005886 ?auto_1005887 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006021 - SURFACE
      ?auto_1006022 - SURFACE
      ?auto_1006023 - SURFACE
      ?auto_1006020 - SURFACE
      ?auto_1006024 - SURFACE
      ?auto_1006026 - SURFACE
      ?auto_1006025 - SURFACE
      ?auto_1006027 - SURFACE
      ?auto_1006028 - SURFACE
      ?auto_1006029 - SURFACE
      ?auto_1006030 - SURFACE
      ?auto_1006031 - SURFACE
    )
    :vars
    (
      ?auto_1006036 - HOIST
      ?auto_1006033 - PLACE
      ?auto_1006035 - PLACE
      ?auto_1006037 - HOIST
      ?auto_1006032 - SURFACE
      ?auto_1006034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006036 ?auto_1006033 ) ( IS-CRATE ?auto_1006031 ) ( not ( = ?auto_1006030 ?auto_1006031 ) ) ( not ( = ?auto_1006029 ?auto_1006030 ) ) ( not ( = ?auto_1006029 ?auto_1006031 ) ) ( not ( = ?auto_1006035 ?auto_1006033 ) ) ( HOIST-AT ?auto_1006037 ?auto_1006035 ) ( not ( = ?auto_1006036 ?auto_1006037 ) ) ( AVAILABLE ?auto_1006037 ) ( SURFACE-AT ?auto_1006031 ?auto_1006035 ) ( ON ?auto_1006031 ?auto_1006032 ) ( CLEAR ?auto_1006031 ) ( not ( = ?auto_1006030 ?auto_1006032 ) ) ( not ( = ?auto_1006031 ?auto_1006032 ) ) ( not ( = ?auto_1006029 ?auto_1006032 ) ) ( TRUCK-AT ?auto_1006034 ?auto_1006033 ) ( SURFACE-AT ?auto_1006029 ?auto_1006033 ) ( CLEAR ?auto_1006029 ) ( LIFTING ?auto_1006036 ?auto_1006030 ) ( IS-CRATE ?auto_1006030 ) ( ON ?auto_1006022 ?auto_1006021 ) ( ON ?auto_1006023 ?auto_1006022 ) ( ON ?auto_1006020 ?auto_1006023 ) ( ON ?auto_1006024 ?auto_1006020 ) ( ON ?auto_1006026 ?auto_1006024 ) ( ON ?auto_1006025 ?auto_1006026 ) ( ON ?auto_1006027 ?auto_1006025 ) ( ON ?auto_1006028 ?auto_1006027 ) ( ON ?auto_1006029 ?auto_1006028 ) ( not ( = ?auto_1006021 ?auto_1006022 ) ) ( not ( = ?auto_1006021 ?auto_1006023 ) ) ( not ( = ?auto_1006021 ?auto_1006020 ) ) ( not ( = ?auto_1006021 ?auto_1006024 ) ) ( not ( = ?auto_1006021 ?auto_1006026 ) ) ( not ( = ?auto_1006021 ?auto_1006025 ) ) ( not ( = ?auto_1006021 ?auto_1006027 ) ) ( not ( = ?auto_1006021 ?auto_1006028 ) ) ( not ( = ?auto_1006021 ?auto_1006029 ) ) ( not ( = ?auto_1006021 ?auto_1006030 ) ) ( not ( = ?auto_1006021 ?auto_1006031 ) ) ( not ( = ?auto_1006021 ?auto_1006032 ) ) ( not ( = ?auto_1006022 ?auto_1006023 ) ) ( not ( = ?auto_1006022 ?auto_1006020 ) ) ( not ( = ?auto_1006022 ?auto_1006024 ) ) ( not ( = ?auto_1006022 ?auto_1006026 ) ) ( not ( = ?auto_1006022 ?auto_1006025 ) ) ( not ( = ?auto_1006022 ?auto_1006027 ) ) ( not ( = ?auto_1006022 ?auto_1006028 ) ) ( not ( = ?auto_1006022 ?auto_1006029 ) ) ( not ( = ?auto_1006022 ?auto_1006030 ) ) ( not ( = ?auto_1006022 ?auto_1006031 ) ) ( not ( = ?auto_1006022 ?auto_1006032 ) ) ( not ( = ?auto_1006023 ?auto_1006020 ) ) ( not ( = ?auto_1006023 ?auto_1006024 ) ) ( not ( = ?auto_1006023 ?auto_1006026 ) ) ( not ( = ?auto_1006023 ?auto_1006025 ) ) ( not ( = ?auto_1006023 ?auto_1006027 ) ) ( not ( = ?auto_1006023 ?auto_1006028 ) ) ( not ( = ?auto_1006023 ?auto_1006029 ) ) ( not ( = ?auto_1006023 ?auto_1006030 ) ) ( not ( = ?auto_1006023 ?auto_1006031 ) ) ( not ( = ?auto_1006023 ?auto_1006032 ) ) ( not ( = ?auto_1006020 ?auto_1006024 ) ) ( not ( = ?auto_1006020 ?auto_1006026 ) ) ( not ( = ?auto_1006020 ?auto_1006025 ) ) ( not ( = ?auto_1006020 ?auto_1006027 ) ) ( not ( = ?auto_1006020 ?auto_1006028 ) ) ( not ( = ?auto_1006020 ?auto_1006029 ) ) ( not ( = ?auto_1006020 ?auto_1006030 ) ) ( not ( = ?auto_1006020 ?auto_1006031 ) ) ( not ( = ?auto_1006020 ?auto_1006032 ) ) ( not ( = ?auto_1006024 ?auto_1006026 ) ) ( not ( = ?auto_1006024 ?auto_1006025 ) ) ( not ( = ?auto_1006024 ?auto_1006027 ) ) ( not ( = ?auto_1006024 ?auto_1006028 ) ) ( not ( = ?auto_1006024 ?auto_1006029 ) ) ( not ( = ?auto_1006024 ?auto_1006030 ) ) ( not ( = ?auto_1006024 ?auto_1006031 ) ) ( not ( = ?auto_1006024 ?auto_1006032 ) ) ( not ( = ?auto_1006026 ?auto_1006025 ) ) ( not ( = ?auto_1006026 ?auto_1006027 ) ) ( not ( = ?auto_1006026 ?auto_1006028 ) ) ( not ( = ?auto_1006026 ?auto_1006029 ) ) ( not ( = ?auto_1006026 ?auto_1006030 ) ) ( not ( = ?auto_1006026 ?auto_1006031 ) ) ( not ( = ?auto_1006026 ?auto_1006032 ) ) ( not ( = ?auto_1006025 ?auto_1006027 ) ) ( not ( = ?auto_1006025 ?auto_1006028 ) ) ( not ( = ?auto_1006025 ?auto_1006029 ) ) ( not ( = ?auto_1006025 ?auto_1006030 ) ) ( not ( = ?auto_1006025 ?auto_1006031 ) ) ( not ( = ?auto_1006025 ?auto_1006032 ) ) ( not ( = ?auto_1006027 ?auto_1006028 ) ) ( not ( = ?auto_1006027 ?auto_1006029 ) ) ( not ( = ?auto_1006027 ?auto_1006030 ) ) ( not ( = ?auto_1006027 ?auto_1006031 ) ) ( not ( = ?auto_1006027 ?auto_1006032 ) ) ( not ( = ?auto_1006028 ?auto_1006029 ) ) ( not ( = ?auto_1006028 ?auto_1006030 ) ) ( not ( = ?auto_1006028 ?auto_1006031 ) ) ( not ( = ?auto_1006028 ?auto_1006032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006029 ?auto_1006030 ?auto_1006031 )
      ( MAKE-11CRATE-VERIFY ?auto_1006021 ?auto_1006022 ?auto_1006023 ?auto_1006020 ?auto_1006024 ?auto_1006026 ?auto_1006025 ?auto_1006027 ?auto_1006028 ?auto_1006029 ?auto_1006030 ?auto_1006031 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006165 - SURFACE
      ?auto_1006166 - SURFACE
      ?auto_1006167 - SURFACE
      ?auto_1006164 - SURFACE
      ?auto_1006168 - SURFACE
      ?auto_1006170 - SURFACE
      ?auto_1006169 - SURFACE
      ?auto_1006171 - SURFACE
      ?auto_1006172 - SURFACE
      ?auto_1006173 - SURFACE
      ?auto_1006174 - SURFACE
      ?auto_1006175 - SURFACE
    )
    :vars
    (
      ?auto_1006178 - HOIST
      ?auto_1006177 - PLACE
      ?auto_1006179 - PLACE
      ?auto_1006176 - HOIST
      ?auto_1006181 - SURFACE
      ?auto_1006180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006178 ?auto_1006177 ) ( IS-CRATE ?auto_1006175 ) ( not ( = ?auto_1006174 ?auto_1006175 ) ) ( not ( = ?auto_1006173 ?auto_1006174 ) ) ( not ( = ?auto_1006173 ?auto_1006175 ) ) ( not ( = ?auto_1006179 ?auto_1006177 ) ) ( HOIST-AT ?auto_1006176 ?auto_1006179 ) ( not ( = ?auto_1006178 ?auto_1006176 ) ) ( AVAILABLE ?auto_1006176 ) ( SURFACE-AT ?auto_1006175 ?auto_1006179 ) ( ON ?auto_1006175 ?auto_1006181 ) ( CLEAR ?auto_1006175 ) ( not ( = ?auto_1006174 ?auto_1006181 ) ) ( not ( = ?auto_1006175 ?auto_1006181 ) ) ( not ( = ?auto_1006173 ?auto_1006181 ) ) ( TRUCK-AT ?auto_1006180 ?auto_1006177 ) ( SURFACE-AT ?auto_1006173 ?auto_1006177 ) ( CLEAR ?auto_1006173 ) ( IS-CRATE ?auto_1006174 ) ( AVAILABLE ?auto_1006178 ) ( IN ?auto_1006174 ?auto_1006180 ) ( ON ?auto_1006166 ?auto_1006165 ) ( ON ?auto_1006167 ?auto_1006166 ) ( ON ?auto_1006164 ?auto_1006167 ) ( ON ?auto_1006168 ?auto_1006164 ) ( ON ?auto_1006170 ?auto_1006168 ) ( ON ?auto_1006169 ?auto_1006170 ) ( ON ?auto_1006171 ?auto_1006169 ) ( ON ?auto_1006172 ?auto_1006171 ) ( ON ?auto_1006173 ?auto_1006172 ) ( not ( = ?auto_1006165 ?auto_1006166 ) ) ( not ( = ?auto_1006165 ?auto_1006167 ) ) ( not ( = ?auto_1006165 ?auto_1006164 ) ) ( not ( = ?auto_1006165 ?auto_1006168 ) ) ( not ( = ?auto_1006165 ?auto_1006170 ) ) ( not ( = ?auto_1006165 ?auto_1006169 ) ) ( not ( = ?auto_1006165 ?auto_1006171 ) ) ( not ( = ?auto_1006165 ?auto_1006172 ) ) ( not ( = ?auto_1006165 ?auto_1006173 ) ) ( not ( = ?auto_1006165 ?auto_1006174 ) ) ( not ( = ?auto_1006165 ?auto_1006175 ) ) ( not ( = ?auto_1006165 ?auto_1006181 ) ) ( not ( = ?auto_1006166 ?auto_1006167 ) ) ( not ( = ?auto_1006166 ?auto_1006164 ) ) ( not ( = ?auto_1006166 ?auto_1006168 ) ) ( not ( = ?auto_1006166 ?auto_1006170 ) ) ( not ( = ?auto_1006166 ?auto_1006169 ) ) ( not ( = ?auto_1006166 ?auto_1006171 ) ) ( not ( = ?auto_1006166 ?auto_1006172 ) ) ( not ( = ?auto_1006166 ?auto_1006173 ) ) ( not ( = ?auto_1006166 ?auto_1006174 ) ) ( not ( = ?auto_1006166 ?auto_1006175 ) ) ( not ( = ?auto_1006166 ?auto_1006181 ) ) ( not ( = ?auto_1006167 ?auto_1006164 ) ) ( not ( = ?auto_1006167 ?auto_1006168 ) ) ( not ( = ?auto_1006167 ?auto_1006170 ) ) ( not ( = ?auto_1006167 ?auto_1006169 ) ) ( not ( = ?auto_1006167 ?auto_1006171 ) ) ( not ( = ?auto_1006167 ?auto_1006172 ) ) ( not ( = ?auto_1006167 ?auto_1006173 ) ) ( not ( = ?auto_1006167 ?auto_1006174 ) ) ( not ( = ?auto_1006167 ?auto_1006175 ) ) ( not ( = ?auto_1006167 ?auto_1006181 ) ) ( not ( = ?auto_1006164 ?auto_1006168 ) ) ( not ( = ?auto_1006164 ?auto_1006170 ) ) ( not ( = ?auto_1006164 ?auto_1006169 ) ) ( not ( = ?auto_1006164 ?auto_1006171 ) ) ( not ( = ?auto_1006164 ?auto_1006172 ) ) ( not ( = ?auto_1006164 ?auto_1006173 ) ) ( not ( = ?auto_1006164 ?auto_1006174 ) ) ( not ( = ?auto_1006164 ?auto_1006175 ) ) ( not ( = ?auto_1006164 ?auto_1006181 ) ) ( not ( = ?auto_1006168 ?auto_1006170 ) ) ( not ( = ?auto_1006168 ?auto_1006169 ) ) ( not ( = ?auto_1006168 ?auto_1006171 ) ) ( not ( = ?auto_1006168 ?auto_1006172 ) ) ( not ( = ?auto_1006168 ?auto_1006173 ) ) ( not ( = ?auto_1006168 ?auto_1006174 ) ) ( not ( = ?auto_1006168 ?auto_1006175 ) ) ( not ( = ?auto_1006168 ?auto_1006181 ) ) ( not ( = ?auto_1006170 ?auto_1006169 ) ) ( not ( = ?auto_1006170 ?auto_1006171 ) ) ( not ( = ?auto_1006170 ?auto_1006172 ) ) ( not ( = ?auto_1006170 ?auto_1006173 ) ) ( not ( = ?auto_1006170 ?auto_1006174 ) ) ( not ( = ?auto_1006170 ?auto_1006175 ) ) ( not ( = ?auto_1006170 ?auto_1006181 ) ) ( not ( = ?auto_1006169 ?auto_1006171 ) ) ( not ( = ?auto_1006169 ?auto_1006172 ) ) ( not ( = ?auto_1006169 ?auto_1006173 ) ) ( not ( = ?auto_1006169 ?auto_1006174 ) ) ( not ( = ?auto_1006169 ?auto_1006175 ) ) ( not ( = ?auto_1006169 ?auto_1006181 ) ) ( not ( = ?auto_1006171 ?auto_1006172 ) ) ( not ( = ?auto_1006171 ?auto_1006173 ) ) ( not ( = ?auto_1006171 ?auto_1006174 ) ) ( not ( = ?auto_1006171 ?auto_1006175 ) ) ( not ( = ?auto_1006171 ?auto_1006181 ) ) ( not ( = ?auto_1006172 ?auto_1006173 ) ) ( not ( = ?auto_1006172 ?auto_1006174 ) ) ( not ( = ?auto_1006172 ?auto_1006175 ) ) ( not ( = ?auto_1006172 ?auto_1006181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006173 ?auto_1006174 ?auto_1006175 )
      ( MAKE-11CRATE-VERIFY ?auto_1006165 ?auto_1006166 ?auto_1006167 ?auto_1006164 ?auto_1006168 ?auto_1006170 ?auto_1006169 ?auto_1006171 ?auto_1006172 ?auto_1006173 ?auto_1006174 ?auto_1006175 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015456 - SURFACE
      ?auto_1015457 - SURFACE
      ?auto_1015458 - SURFACE
      ?auto_1015455 - SURFACE
      ?auto_1015459 - SURFACE
      ?auto_1015461 - SURFACE
      ?auto_1015460 - SURFACE
      ?auto_1015462 - SURFACE
      ?auto_1015463 - SURFACE
      ?auto_1015464 - SURFACE
      ?auto_1015465 - SURFACE
      ?auto_1015466 - SURFACE
      ?auto_1015467 - SURFACE
    )
    :vars
    (
      ?auto_1015469 - HOIST
      ?auto_1015468 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015469 ?auto_1015468 ) ( SURFACE-AT ?auto_1015466 ?auto_1015468 ) ( CLEAR ?auto_1015466 ) ( LIFTING ?auto_1015469 ?auto_1015467 ) ( IS-CRATE ?auto_1015467 ) ( not ( = ?auto_1015466 ?auto_1015467 ) ) ( ON ?auto_1015457 ?auto_1015456 ) ( ON ?auto_1015458 ?auto_1015457 ) ( ON ?auto_1015455 ?auto_1015458 ) ( ON ?auto_1015459 ?auto_1015455 ) ( ON ?auto_1015461 ?auto_1015459 ) ( ON ?auto_1015460 ?auto_1015461 ) ( ON ?auto_1015462 ?auto_1015460 ) ( ON ?auto_1015463 ?auto_1015462 ) ( ON ?auto_1015464 ?auto_1015463 ) ( ON ?auto_1015465 ?auto_1015464 ) ( ON ?auto_1015466 ?auto_1015465 ) ( not ( = ?auto_1015456 ?auto_1015457 ) ) ( not ( = ?auto_1015456 ?auto_1015458 ) ) ( not ( = ?auto_1015456 ?auto_1015455 ) ) ( not ( = ?auto_1015456 ?auto_1015459 ) ) ( not ( = ?auto_1015456 ?auto_1015461 ) ) ( not ( = ?auto_1015456 ?auto_1015460 ) ) ( not ( = ?auto_1015456 ?auto_1015462 ) ) ( not ( = ?auto_1015456 ?auto_1015463 ) ) ( not ( = ?auto_1015456 ?auto_1015464 ) ) ( not ( = ?auto_1015456 ?auto_1015465 ) ) ( not ( = ?auto_1015456 ?auto_1015466 ) ) ( not ( = ?auto_1015456 ?auto_1015467 ) ) ( not ( = ?auto_1015457 ?auto_1015458 ) ) ( not ( = ?auto_1015457 ?auto_1015455 ) ) ( not ( = ?auto_1015457 ?auto_1015459 ) ) ( not ( = ?auto_1015457 ?auto_1015461 ) ) ( not ( = ?auto_1015457 ?auto_1015460 ) ) ( not ( = ?auto_1015457 ?auto_1015462 ) ) ( not ( = ?auto_1015457 ?auto_1015463 ) ) ( not ( = ?auto_1015457 ?auto_1015464 ) ) ( not ( = ?auto_1015457 ?auto_1015465 ) ) ( not ( = ?auto_1015457 ?auto_1015466 ) ) ( not ( = ?auto_1015457 ?auto_1015467 ) ) ( not ( = ?auto_1015458 ?auto_1015455 ) ) ( not ( = ?auto_1015458 ?auto_1015459 ) ) ( not ( = ?auto_1015458 ?auto_1015461 ) ) ( not ( = ?auto_1015458 ?auto_1015460 ) ) ( not ( = ?auto_1015458 ?auto_1015462 ) ) ( not ( = ?auto_1015458 ?auto_1015463 ) ) ( not ( = ?auto_1015458 ?auto_1015464 ) ) ( not ( = ?auto_1015458 ?auto_1015465 ) ) ( not ( = ?auto_1015458 ?auto_1015466 ) ) ( not ( = ?auto_1015458 ?auto_1015467 ) ) ( not ( = ?auto_1015455 ?auto_1015459 ) ) ( not ( = ?auto_1015455 ?auto_1015461 ) ) ( not ( = ?auto_1015455 ?auto_1015460 ) ) ( not ( = ?auto_1015455 ?auto_1015462 ) ) ( not ( = ?auto_1015455 ?auto_1015463 ) ) ( not ( = ?auto_1015455 ?auto_1015464 ) ) ( not ( = ?auto_1015455 ?auto_1015465 ) ) ( not ( = ?auto_1015455 ?auto_1015466 ) ) ( not ( = ?auto_1015455 ?auto_1015467 ) ) ( not ( = ?auto_1015459 ?auto_1015461 ) ) ( not ( = ?auto_1015459 ?auto_1015460 ) ) ( not ( = ?auto_1015459 ?auto_1015462 ) ) ( not ( = ?auto_1015459 ?auto_1015463 ) ) ( not ( = ?auto_1015459 ?auto_1015464 ) ) ( not ( = ?auto_1015459 ?auto_1015465 ) ) ( not ( = ?auto_1015459 ?auto_1015466 ) ) ( not ( = ?auto_1015459 ?auto_1015467 ) ) ( not ( = ?auto_1015461 ?auto_1015460 ) ) ( not ( = ?auto_1015461 ?auto_1015462 ) ) ( not ( = ?auto_1015461 ?auto_1015463 ) ) ( not ( = ?auto_1015461 ?auto_1015464 ) ) ( not ( = ?auto_1015461 ?auto_1015465 ) ) ( not ( = ?auto_1015461 ?auto_1015466 ) ) ( not ( = ?auto_1015461 ?auto_1015467 ) ) ( not ( = ?auto_1015460 ?auto_1015462 ) ) ( not ( = ?auto_1015460 ?auto_1015463 ) ) ( not ( = ?auto_1015460 ?auto_1015464 ) ) ( not ( = ?auto_1015460 ?auto_1015465 ) ) ( not ( = ?auto_1015460 ?auto_1015466 ) ) ( not ( = ?auto_1015460 ?auto_1015467 ) ) ( not ( = ?auto_1015462 ?auto_1015463 ) ) ( not ( = ?auto_1015462 ?auto_1015464 ) ) ( not ( = ?auto_1015462 ?auto_1015465 ) ) ( not ( = ?auto_1015462 ?auto_1015466 ) ) ( not ( = ?auto_1015462 ?auto_1015467 ) ) ( not ( = ?auto_1015463 ?auto_1015464 ) ) ( not ( = ?auto_1015463 ?auto_1015465 ) ) ( not ( = ?auto_1015463 ?auto_1015466 ) ) ( not ( = ?auto_1015463 ?auto_1015467 ) ) ( not ( = ?auto_1015464 ?auto_1015465 ) ) ( not ( = ?auto_1015464 ?auto_1015466 ) ) ( not ( = ?auto_1015464 ?auto_1015467 ) ) ( not ( = ?auto_1015465 ?auto_1015466 ) ) ( not ( = ?auto_1015465 ?auto_1015467 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1015466 ?auto_1015467 )
      ( MAKE-12CRATE-VERIFY ?auto_1015456 ?auto_1015457 ?auto_1015458 ?auto_1015455 ?auto_1015459 ?auto_1015461 ?auto_1015460 ?auto_1015462 ?auto_1015463 ?auto_1015464 ?auto_1015465 ?auto_1015466 ?auto_1015467 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015581 - SURFACE
      ?auto_1015582 - SURFACE
      ?auto_1015583 - SURFACE
      ?auto_1015580 - SURFACE
      ?auto_1015584 - SURFACE
      ?auto_1015586 - SURFACE
      ?auto_1015585 - SURFACE
      ?auto_1015587 - SURFACE
      ?auto_1015588 - SURFACE
      ?auto_1015589 - SURFACE
      ?auto_1015590 - SURFACE
      ?auto_1015591 - SURFACE
      ?auto_1015592 - SURFACE
    )
    :vars
    (
      ?auto_1015595 - HOIST
      ?auto_1015593 - PLACE
      ?auto_1015594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015595 ?auto_1015593 ) ( SURFACE-AT ?auto_1015591 ?auto_1015593 ) ( CLEAR ?auto_1015591 ) ( IS-CRATE ?auto_1015592 ) ( not ( = ?auto_1015591 ?auto_1015592 ) ) ( TRUCK-AT ?auto_1015594 ?auto_1015593 ) ( AVAILABLE ?auto_1015595 ) ( IN ?auto_1015592 ?auto_1015594 ) ( ON ?auto_1015591 ?auto_1015590 ) ( not ( = ?auto_1015590 ?auto_1015591 ) ) ( not ( = ?auto_1015590 ?auto_1015592 ) ) ( ON ?auto_1015582 ?auto_1015581 ) ( ON ?auto_1015583 ?auto_1015582 ) ( ON ?auto_1015580 ?auto_1015583 ) ( ON ?auto_1015584 ?auto_1015580 ) ( ON ?auto_1015586 ?auto_1015584 ) ( ON ?auto_1015585 ?auto_1015586 ) ( ON ?auto_1015587 ?auto_1015585 ) ( ON ?auto_1015588 ?auto_1015587 ) ( ON ?auto_1015589 ?auto_1015588 ) ( ON ?auto_1015590 ?auto_1015589 ) ( not ( = ?auto_1015581 ?auto_1015582 ) ) ( not ( = ?auto_1015581 ?auto_1015583 ) ) ( not ( = ?auto_1015581 ?auto_1015580 ) ) ( not ( = ?auto_1015581 ?auto_1015584 ) ) ( not ( = ?auto_1015581 ?auto_1015586 ) ) ( not ( = ?auto_1015581 ?auto_1015585 ) ) ( not ( = ?auto_1015581 ?auto_1015587 ) ) ( not ( = ?auto_1015581 ?auto_1015588 ) ) ( not ( = ?auto_1015581 ?auto_1015589 ) ) ( not ( = ?auto_1015581 ?auto_1015590 ) ) ( not ( = ?auto_1015581 ?auto_1015591 ) ) ( not ( = ?auto_1015581 ?auto_1015592 ) ) ( not ( = ?auto_1015582 ?auto_1015583 ) ) ( not ( = ?auto_1015582 ?auto_1015580 ) ) ( not ( = ?auto_1015582 ?auto_1015584 ) ) ( not ( = ?auto_1015582 ?auto_1015586 ) ) ( not ( = ?auto_1015582 ?auto_1015585 ) ) ( not ( = ?auto_1015582 ?auto_1015587 ) ) ( not ( = ?auto_1015582 ?auto_1015588 ) ) ( not ( = ?auto_1015582 ?auto_1015589 ) ) ( not ( = ?auto_1015582 ?auto_1015590 ) ) ( not ( = ?auto_1015582 ?auto_1015591 ) ) ( not ( = ?auto_1015582 ?auto_1015592 ) ) ( not ( = ?auto_1015583 ?auto_1015580 ) ) ( not ( = ?auto_1015583 ?auto_1015584 ) ) ( not ( = ?auto_1015583 ?auto_1015586 ) ) ( not ( = ?auto_1015583 ?auto_1015585 ) ) ( not ( = ?auto_1015583 ?auto_1015587 ) ) ( not ( = ?auto_1015583 ?auto_1015588 ) ) ( not ( = ?auto_1015583 ?auto_1015589 ) ) ( not ( = ?auto_1015583 ?auto_1015590 ) ) ( not ( = ?auto_1015583 ?auto_1015591 ) ) ( not ( = ?auto_1015583 ?auto_1015592 ) ) ( not ( = ?auto_1015580 ?auto_1015584 ) ) ( not ( = ?auto_1015580 ?auto_1015586 ) ) ( not ( = ?auto_1015580 ?auto_1015585 ) ) ( not ( = ?auto_1015580 ?auto_1015587 ) ) ( not ( = ?auto_1015580 ?auto_1015588 ) ) ( not ( = ?auto_1015580 ?auto_1015589 ) ) ( not ( = ?auto_1015580 ?auto_1015590 ) ) ( not ( = ?auto_1015580 ?auto_1015591 ) ) ( not ( = ?auto_1015580 ?auto_1015592 ) ) ( not ( = ?auto_1015584 ?auto_1015586 ) ) ( not ( = ?auto_1015584 ?auto_1015585 ) ) ( not ( = ?auto_1015584 ?auto_1015587 ) ) ( not ( = ?auto_1015584 ?auto_1015588 ) ) ( not ( = ?auto_1015584 ?auto_1015589 ) ) ( not ( = ?auto_1015584 ?auto_1015590 ) ) ( not ( = ?auto_1015584 ?auto_1015591 ) ) ( not ( = ?auto_1015584 ?auto_1015592 ) ) ( not ( = ?auto_1015586 ?auto_1015585 ) ) ( not ( = ?auto_1015586 ?auto_1015587 ) ) ( not ( = ?auto_1015586 ?auto_1015588 ) ) ( not ( = ?auto_1015586 ?auto_1015589 ) ) ( not ( = ?auto_1015586 ?auto_1015590 ) ) ( not ( = ?auto_1015586 ?auto_1015591 ) ) ( not ( = ?auto_1015586 ?auto_1015592 ) ) ( not ( = ?auto_1015585 ?auto_1015587 ) ) ( not ( = ?auto_1015585 ?auto_1015588 ) ) ( not ( = ?auto_1015585 ?auto_1015589 ) ) ( not ( = ?auto_1015585 ?auto_1015590 ) ) ( not ( = ?auto_1015585 ?auto_1015591 ) ) ( not ( = ?auto_1015585 ?auto_1015592 ) ) ( not ( = ?auto_1015587 ?auto_1015588 ) ) ( not ( = ?auto_1015587 ?auto_1015589 ) ) ( not ( = ?auto_1015587 ?auto_1015590 ) ) ( not ( = ?auto_1015587 ?auto_1015591 ) ) ( not ( = ?auto_1015587 ?auto_1015592 ) ) ( not ( = ?auto_1015588 ?auto_1015589 ) ) ( not ( = ?auto_1015588 ?auto_1015590 ) ) ( not ( = ?auto_1015588 ?auto_1015591 ) ) ( not ( = ?auto_1015588 ?auto_1015592 ) ) ( not ( = ?auto_1015589 ?auto_1015590 ) ) ( not ( = ?auto_1015589 ?auto_1015591 ) ) ( not ( = ?auto_1015589 ?auto_1015592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015590 ?auto_1015591 ?auto_1015592 )
      ( MAKE-12CRATE-VERIFY ?auto_1015581 ?auto_1015582 ?auto_1015583 ?auto_1015580 ?auto_1015584 ?auto_1015586 ?auto_1015585 ?auto_1015587 ?auto_1015588 ?auto_1015589 ?auto_1015590 ?auto_1015591 ?auto_1015592 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015719 - SURFACE
      ?auto_1015720 - SURFACE
      ?auto_1015721 - SURFACE
      ?auto_1015718 - SURFACE
      ?auto_1015722 - SURFACE
      ?auto_1015724 - SURFACE
      ?auto_1015723 - SURFACE
      ?auto_1015725 - SURFACE
      ?auto_1015726 - SURFACE
      ?auto_1015727 - SURFACE
      ?auto_1015728 - SURFACE
      ?auto_1015729 - SURFACE
      ?auto_1015730 - SURFACE
    )
    :vars
    (
      ?auto_1015733 - HOIST
      ?auto_1015734 - PLACE
      ?auto_1015731 - TRUCK
      ?auto_1015732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015733 ?auto_1015734 ) ( SURFACE-AT ?auto_1015729 ?auto_1015734 ) ( CLEAR ?auto_1015729 ) ( IS-CRATE ?auto_1015730 ) ( not ( = ?auto_1015729 ?auto_1015730 ) ) ( AVAILABLE ?auto_1015733 ) ( IN ?auto_1015730 ?auto_1015731 ) ( ON ?auto_1015729 ?auto_1015728 ) ( not ( = ?auto_1015728 ?auto_1015729 ) ) ( not ( = ?auto_1015728 ?auto_1015730 ) ) ( TRUCK-AT ?auto_1015731 ?auto_1015732 ) ( not ( = ?auto_1015732 ?auto_1015734 ) ) ( ON ?auto_1015720 ?auto_1015719 ) ( ON ?auto_1015721 ?auto_1015720 ) ( ON ?auto_1015718 ?auto_1015721 ) ( ON ?auto_1015722 ?auto_1015718 ) ( ON ?auto_1015724 ?auto_1015722 ) ( ON ?auto_1015723 ?auto_1015724 ) ( ON ?auto_1015725 ?auto_1015723 ) ( ON ?auto_1015726 ?auto_1015725 ) ( ON ?auto_1015727 ?auto_1015726 ) ( ON ?auto_1015728 ?auto_1015727 ) ( not ( = ?auto_1015719 ?auto_1015720 ) ) ( not ( = ?auto_1015719 ?auto_1015721 ) ) ( not ( = ?auto_1015719 ?auto_1015718 ) ) ( not ( = ?auto_1015719 ?auto_1015722 ) ) ( not ( = ?auto_1015719 ?auto_1015724 ) ) ( not ( = ?auto_1015719 ?auto_1015723 ) ) ( not ( = ?auto_1015719 ?auto_1015725 ) ) ( not ( = ?auto_1015719 ?auto_1015726 ) ) ( not ( = ?auto_1015719 ?auto_1015727 ) ) ( not ( = ?auto_1015719 ?auto_1015728 ) ) ( not ( = ?auto_1015719 ?auto_1015729 ) ) ( not ( = ?auto_1015719 ?auto_1015730 ) ) ( not ( = ?auto_1015720 ?auto_1015721 ) ) ( not ( = ?auto_1015720 ?auto_1015718 ) ) ( not ( = ?auto_1015720 ?auto_1015722 ) ) ( not ( = ?auto_1015720 ?auto_1015724 ) ) ( not ( = ?auto_1015720 ?auto_1015723 ) ) ( not ( = ?auto_1015720 ?auto_1015725 ) ) ( not ( = ?auto_1015720 ?auto_1015726 ) ) ( not ( = ?auto_1015720 ?auto_1015727 ) ) ( not ( = ?auto_1015720 ?auto_1015728 ) ) ( not ( = ?auto_1015720 ?auto_1015729 ) ) ( not ( = ?auto_1015720 ?auto_1015730 ) ) ( not ( = ?auto_1015721 ?auto_1015718 ) ) ( not ( = ?auto_1015721 ?auto_1015722 ) ) ( not ( = ?auto_1015721 ?auto_1015724 ) ) ( not ( = ?auto_1015721 ?auto_1015723 ) ) ( not ( = ?auto_1015721 ?auto_1015725 ) ) ( not ( = ?auto_1015721 ?auto_1015726 ) ) ( not ( = ?auto_1015721 ?auto_1015727 ) ) ( not ( = ?auto_1015721 ?auto_1015728 ) ) ( not ( = ?auto_1015721 ?auto_1015729 ) ) ( not ( = ?auto_1015721 ?auto_1015730 ) ) ( not ( = ?auto_1015718 ?auto_1015722 ) ) ( not ( = ?auto_1015718 ?auto_1015724 ) ) ( not ( = ?auto_1015718 ?auto_1015723 ) ) ( not ( = ?auto_1015718 ?auto_1015725 ) ) ( not ( = ?auto_1015718 ?auto_1015726 ) ) ( not ( = ?auto_1015718 ?auto_1015727 ) ) ( not ( = ?auto_1015718 ?auto_1015728 ) ) ( not ( = ?auto_1015718 ?auto_1015729 ) ) ( not ( = ?auto_1015718 ?auto_1015730 ) ) ( not ( = ?auto_1015722 ?auto_1015724 ) ) ( not ( = ?auto_1015722 ?auto_1015723 ) ) ( not ( = ?auto_1015722 ?auto_1015725 ) ) ( not ( = ?auto_1015722 ?auto_1015726 ) ) ( not ( = ?auto_1015722 ?auto_1015727 ) ) ( not ( = ?auto_1015722 ?auto_1015728 ) ) ( not ( = ?auto_1015722 ?auto_1015729 ) ) ( not ( = ?auto_1015722 ?auto_1015730 ) ) ( not ( = ?auto_1015724 ?auto_1015723 ) ) ( not ( = ?auto_1015724 ?auto_1015725 ) ) ( not ( = ?auto_1015724 ?auto_1015726 ) ) ( not ( = ?auto_1015724 ?auto_1015727 ) ) ( not ( = ?auto_1015724 ?auto_1015728 ) ) ( not ( = ?auto_1015724 ?auto_1015729 ) ) ( not ( = ?auto_1015724 ?auto_1015730 ) ) ( not ( = ?auto_1015723 ?auto_1015725 ) ) ( not ( = ?auto_1015723 ?auto_1015726 ) ) ( not ( = ?auto_1015723 ?auto_1015727 ) ) ( not ( = ?auto_1015723 ?auto_1015728 ) ) ( not ( = ?auto_1015723 ?auto_1015729 ) ) ( not ( = ?auto_1015723 ?auto_1015730 ) ) ( not ( = ?auto_1015725 ?auto_1015726 ) ) ( not ( = ?auto_1015725 ?auto_1015727 ) ) ( not ( = ?auto_1015725 ?auto_1015728 ) ) ( not ( = ?auto_1015725 ?auto_1015729 ) ) ( not ( = ?auto_1015725 ?auto_1015730 ) ) ( not ( = ?auto_1015726 ?auto_1015727 ) ) ( not ( = ?auto_1015726 ?auto_1015728 ) ) ( not ( = ?auto_1015726 ?auto_1015729 ) ) ( not ( = ?auto_1015726 ?auto_1015730 ) ) ( not ( = ?auto_1015727 ?auto_1015728 ) ) ( not ( = ?auto_1015727 ?auto_1015729 ) ) ( not ( = ?auto_1015727 ?auto_1015730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015728 ?auto_1015729 ?auto_1015730 )
      ( MAKE-12CRATE-VERIFY ?auto_1015719 ?auto_1015720 ?auto_1015721 ?auto_1015718 ?auto_1015722 ?auto_1015724 ?auto_1015723 ?auto_1015725 ?auto_1015726 ?auto_1015727 ?auto_1015728 ?auto_1015729 ?auto_1015730 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015869 - SURFACE
      ?auto_1015870 - SURFACE
      ?auto_1015871 - SURFACE
      ?auto_1015868 - SURFACE
      ?auto_1015872 - SURFACE
      ?auto_1015874 - SURFACE
      ?auto_1015873 - SURFACE
      ?auto_1015875 - SURFACE
      ?auto_1015876 - SURFACE
      ?auto_1015877 - SURFACE
      ?auto_1015878 - SURFACE
      ?auto_1015879 - SURFACE
      ?auto_1015880 - SURFACE
    )
    :vars
    (
      ?auto_1015884 - HOIST
      ?auto_1015882 - PLACE
      ?auto_1015881 - TRUCK
      ?auto_1015885 - PLACE
      ?auto_1015883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015884 ?auto_1015882 ) ( SURFACE-AT ?auto_1015879 ?auto_1015882 ) ( CLEAR ?auto_1015879 ) ( IS-CRATE ?auto_1015880 ) ( not ( = ?auto_1015879 ?auto_1015880 ) ) ( AVAILABLE ?auto_1015884 ) ( ON ?auto_1015879 ?auto_1015878 ) ( not ( = ?auto_1015878 ?auto_1015879 ) ) ( not ( = ?auto_1015878 ?auto_1015880 ) ) ( TRUCK-AT ?auto_1015881 ?auto_1015885 ) ( not ( = ?auto_1015885 ?auto_1015882 ) ) ( HOIST-AT ?auto_1015883 ?auto_1015885 ) ( LIFTING ?auto_1015883 ?auto_1015880 ) ( not ( = ?auto_1015884 ?auto_1015883 ) ) ( ON ?auto_1015870 ?auto_1015869 ) ( ON ?auto_1015871 ?auto_1015870 ) ( ON ?auto_1015868 ?auto_1015871 ) ( ON ?auto_1015872 ?auto_1015868 ) ( ON ?auto_1015874 ?auto_1015872 ) ( ON ?auto_1015873 ?auto_1015874 ) ( ON ?auto_1015875 ?auto_1015873 ) ( ON ?auto_1015876 ?auto_1015875 ) ( ON ?auto_1015877 ?auto_1015876 ) ( ON ?auto_1015878 ?auto_1015877 ) ( not ( = ?auto_1015869 ?auto_1015870 ) ) ( not ( = ?auto_1015869 ?auto_1015871 ) ) ( not ( = ?auto_1015869 ?auto_1015868 ) ) ( not ( = ?auto_1015869 ?auto_1015872 ) ) ( not ( = ?auto_1015869 ?auto_1015874 ) ) ( not ( = ?auto_1015869 ?auto_1015873 ) ) ( not ( = ?auto_1015869 ?auto_1015875 ) ) ( not ( = ?auto_1015869 ?auto_1015876 ) ) ( not ( = ?auto_1015869 ?auto_1015877 ) ) ( not ( = ?auto_1015869 ?auto_1015878 ) ) ( not ( = ?auto_1015869 ?auto_1015879 ) ) ( not ( = ?auto_1015869 ?auto_1015880 ) ) ( not ( = ?auto_1015870 ?auto_1015871 ) ) ( not ( = ?auto_1015870 ?auto_1015868 ) ) ( not ( = ?auto_1015870 ?auto_1015872 ) ) ( not ( = ?auto_1015870 ?auto_1015874 ) ) ( not ( = ?auto_1015870 ?auto_1015873 ) ) ( not ( = ?auto_1015870 ?auto_1015875 ) ) ( not ( = ?auto_1015870 ?auto_1015876 ) ) ( not ( = ?auto_1015870 ?auto_1015877 ) ) ( not ( = ?auto_1015870 ?auto_1015878 ) ) ( not ( = ?auto_1015870 ?auto_1015879 ) ) ( not ( = ?auto_1015870 ?auto_1015880 ) ) ( not ( = ?auto_1015871 ?auto_1015868 ) ) ( not ( = ?auto_1015871 ?auto_1015872 ) ) ( not ( = ?auto_1015871 ?auto_1015874 ) ) ( not ( = ?auto_1015871 ?auto_1015873 ) ) ( not ( = ?auto_1015871 ?auto_1015875 ) ) ( not ( = ?auto_1015871 ?auto_1015876 ) ) ( not ( = ?auto_1015871 ?auto_1015877 ) ) ( not ( = ?auto_1015871 ?auto_1015878 ) ) ( not ( = ?auto_1015871 ?auto_1015879 ) ) ( not ( = ?auto_1015871 ?auto_1015880 ) ) ( not ( = ?auto_1015868 ?auto_1015872 ) ) ( not ( = ?auto_1015868 ?auto_1015874 ) ) ( not ( = ?auto_1015868 ?auto_1015873 ) ) ( not ( = ?auto_1015868 ?auto_1015875 ) ) ( not ( = ?auto_1015868 ?auto_1015876 ) ) ( not ( = ?auto_1015868 ?auto_1015877 ) ) ( not ( = ?auto_1015868 ?auto_1015878 ) ) ( not ( = ?auto_1015868 ?auto_1015879 ) ) ( not ( = ?auto_1015868 ?auto_1015880 ) ) ( not ( = ?auto_1015872 ?auto_1015874 ) ) ( not ( = ?auto_1015872 ?auto_1015873 ) ) ( not ( = ?auto_1015872 ?auto_1015875 ) ) ( not ( = ?auto_1015872 ?auto_1015876 ) ) ( not ( = ?auto_1015872 ?auto_1015877 ) ) ( not ( = ?auto_1015872 ?auto_1015878 ) ) ( not ( = ?auto_1015872 ?auto_1015879 ) ) ( not ( = ?auto_1015872 ?auto_1015880 ) ) ( not ( = ?auto_1015874 ?auto_1015873 ) ) ( not ( = ?auto_1015874 ?auto_1015875 ) ) ( not ( = ?auto_1015874 ?auto_1015876 ) ) ( not ( = ?auto_1015874 ?auto_1015877 ) ) ( not ( = ?auto_1015874 ?auto_1015878 ) ) ( not ( = ?auto_1015874 ?auto_1015879 ) ) ( not ( = ?auto_1015874 ?auto_1015880 ) ) ( not ( = ?auto_1015873 ?auto_1015875 ) ) ( not ( = ?auto_1015873 ?auto_1015876 ) ) ( not ( = ?auto_1015873 ?auto_1015877 ) ) ( not ( = ?auto_1015873 ?auto_1015878 ) ) ( not ( = ?auto_1015873 ?auto_1015879 ) ) ( not ( = ?auto_1015873 ?auto_1015880 ) ) ( not ( = ?auto_1015875 ?auto_1015876 ) ) ( not ( = ?auto_1015875 ?auto_1015877 ) ) ( not ( = ?auto_1015875 ?auto_1015878 ) ) ( not ( = ?auto_1015875 ?auto_1015879 ) ) ( not ( = ?auto_1015875 ?auto_1015880 ) ) ( not ( = ?auto_1015876 ?auto_1015877 ) ) ( not ( = ?auto_1015876 ?auto_1015878 ) ) ( not ( = ?auto_1015876 ?auto_1015879 ) ) ( not ( = ?auto_1015876 ?auto_1015880 ) ) ( not ( = ?auto_1015877 ?auto_1015878 ) ) ( not ( = ?auto_1015877 ?auto_1015879 ) ) ( not ( = ?auto_1015877 ?auto_1015880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015878 ?auto_1015879 ?auto_1015880 )
      ( MAKE-12CRATE-VERIFY ?auto_1015869 ?auto_1015870 ?auto_1015871 ?auto_1015868 ?auto_1015872 ?auto_1015874 ?auto_1015873 ?auto_1015875 ?auto_1015876 ?auto_1015877 ?auto_1015878 ?auto_1015879 ?auto_1015880 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1016031 - SURFACE
      ?auto_1016032 - SURFACE
      ?auto_1016033 - SURFACE
      ?auto_1016030 - SURFACE
      ?auto_1016034 - SURFACE
      ?auto_1016036 - SURFACE
      ?auto_1016035 - SURFACE
      ?auto_1016037 - SURFACE
      ?auto_1016038 - SURFACE
      ?auto_1016039 - SURFACE
      ?auto_1016040 - SURFACE
      ?auto_1016041 - SURFACE
      ?auto_1016042 - SURFACE
    )
    :vars
    (
      ?auto_1016047 - HOIST
      ?auto_1016044 - PLACE
      ?auto_1016046 - TRUCK
      ?auto_1016045 - PLACE
      ?auto_1016043 - HOIST
      ?auto_1016048 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016047 ?auto_1016044 ) ( SURFACE-AT ?auto_1016041 ?auto_1016044 ) ( CLEAR ?auto_1016041 ) ( IS-CRATE ?auto_1016042 ) ( not ( = ?auto_1016041 ?auto_1016042 ) ) ( AVAILABLE ?auto_1016047 ) ( ON ?auto_1016041 ?auto_1016040 ) ( not ( = ?auto_1016040 ?auto_1016041 ) ) ( not ( = ?auto_1016040 ?auto_1016042 ) ) ( TRUCK-AT ?auto_1016046 ?auto_1016045 ) ( not ( = ?auto_1016045 ?auto_1016044 ) ) ( HOIST-AT ?auto_1016043 ?auto_1016045 ) ( not ( = ?auto_1016047 ?auto_1016043 ) ) ( AVAILABLE ?auto_1016043 ) ( SURFACE-AT ?auto_1016042 ?auto_1016045 ) ( ON ?auto_1016042 ?auto_1016048 ) ( CLEAR ?auto_1016042 ) ( not ( = ?auto_1016041 ?auto_1016048 ) ) ( not ( = ?auto_1016042 ?auto_1016048 ) ) ( not ( = ?auto_1016040 ?auto_1016048 ) ) ( ON ?auto_1016032 ?auto_1016031 ) ( ON ?auto_1016033 ?auto_1016032 ) ( ON ?auto_1016030 ?auto_1016033 ) ( ON ?auto_1016034 ?auto_1016030 ) ( ON ?auto_1016036 ?auto_1016034 ) ( ON ?auto_1016035 ?auto_1016036 ) ( ON ?auto_1016037 ?auto_1016035 ) ( ON ?auto_1016038 ?auto_1016037 ) ( ON ?auto_1016039 ?auto_1016038 ) ( ON ?auto_1016040 ?auto_1016039 ) ( not ( = ?auto_1016031 ?auto_1016032 ) ) ( not ( = ?auto_1016031 ?auto_1016033 ) ) ( not ( = ?auto_1016031 ?auto_1016030 ) ) ( not ( = ?auto_1016031 ?auto_1016034 ) ) ( not ( = ?auto_1016031 ?auto_1016036 ) ) ( not ( = ?auto_1016031 ?auto_1016035 ) ) ( not ( = ?auto_1016031 ?auto_1016037 ) ) ( not ( = ?auto_1016031 ?auto_1016038 ) ) ( not ( = ?auto_1016031 ?auto_1016039 ) ) ( not ( = ?auto_1016031 ?auto_1016040 ) ) ( not ( = ?auto_1016031 ?auto_1016041 ) ) ( not ( = ?auto_1016031 ?auto_1016042 ) ) ( not ( = ?auto_1016031 ?auto_1016048 ) ) ( not ( = ?auto_1016032 ?auto_1016033 ) ) ( not ( = ?auto_1016032 ?auto_1016030 ) ) ( not ( = ?auto_1016032 ?auto_1016034 ) ) ( not ( = ?auto_1016032 ?auto_1016036 ) ) ( not ( = ?auto_1016032 ?auto_1016035 ) ) ( not ( = ?auto_1016032 ?auto_1016037 ) ) ( not ( = ?auto_1016032 ?auto_1016038 ) ) ( not ( = ?auto_1016032 ?auto_1016039 ) ) ( not ( = ?auto_1016032 ?auto_1016040 ) ) ( not ( = ?auto_1016032 ?auto_1016041 ) ) ( not ( = ?auto_1016032 ?auto_1016042 ) ) ( not ( = ?auto_1016032 ?auto_1016048 ) ) ( not ( = ?auto_1016033 ?auto_1016030 ) ) ( not ( = ?auto_1016033 ?auto_1016034 ) ) ( not ( = ?auto_1016033 ?auto_1016036 ) ) ( not ( = ?auto_1016033 ?auto_1016035 ) ) ( not ( = ?auto_1016033 ?auto_1016037 ) ) ( not ( = ?auto_1016033 ?auto_1016038 ) ) ( not ( = ?auto_1016033 ?auto_1016039 ) ) ( not ( = ?auto_1016033 ?auto_1016040 ) ) ( not ( = ?auto_1016033 ?auto_1016041 ) ) ( not ( = ?auto_1016033 ?auto_1016042 ) ) ( not ( = ?auto_1016033 ?auto_1016048 ) ) ( not ( = ?auto_1016030 ?auto_1016034 ) ) ( not ( = ?auto_1016030 ?auto_1016036 ) ) ( not ( = ?auto_1016030 ?auto_1016035 ) ) ( not ( = ?auto_1016030 ?auto_1016037 ) ) ( not ( = ?auto_1016030 ?auto_1016038 ) ) ( not ( = ?auto_1016030 ?auto_1016039 ) ) ( not ( = ?auto_1016030 ?auto_1016040 ) ) ( not ( = ?auto_1016030 ?auto_1016041 ) ) ( not ( = ?auto_1016030 ?auto_1016042 ) ) ( not ( = ?auto_1016030 ?auto_1016048 ) ) ( not ( = ?auto_1016034 ?auto_1016036 ) ) ( not ( = ?auto_1016034 ?auto_1016035 ) ) ( not ( = ?auto_1016034 ?auto_1016037 ) ) ( not ( = ?auto_1016034 ?auto_1016038 ) ) ( not ( = ?auto_1016034 ?auto_1016039 ) ) ( not ( = ?auto_1016034 ?auto_1016040 ) ) ( not ( = ?auto_1016034 ?auto_1016041 ) ) ( not ( = ?auto_1016034 ?auto_1016042 ) ) ( not ( = ?auto_1016034 ?auto_1016048 ) ) ( not ( = ?auto_1016036 ?auto_1016035 ) ) ( not ( = ?auto_1016036 ?auto_1016037 ) ) ( not ( = ?auto_1016036 ?auto_1016038 ) ) ( not ( = ?auto_1016036 ?auto_1016039 ) ) ( not ( = ?auto_1016036 ?auto_1016040 ) ) ( not ( = ?auto_1016036 ?auto_1016041 ) ) ( not ( = ?auto_1016036 ?auto_1016042 ) ) ( not ( = ?auto_1016036 ?auto_1016048 ) ) ( not ( = ?auto_1016035 ?auto_1016037 ) ) ( not ( = ?auto_1016035 ?auto_1016038 ) ) ( not ( = ?auto_1016035 ?auto_1016039 ) ) ( not ( = ?auto_1016035 ?auto_1016040 ) ) ( not ( = ?auto_1016035 ?auto_1016041 ) ) ( not ( = ?auto_1016035 ?auto_1016042 ) ) ( not ( = ?auto_1016035 ?auto_1016048 ) ) ( not ( = ?auto_1016037 ?auto_1016038 ) ) ( not ( = ?auto_1016037 ?auto_1016039 ) ) ( not ( = ?auto_1016037 ?auto_1016040 ) ) ( not ( = ?auto_1016037 ?auto_1016041 ) ) ( not ( = ?auto_1016037 ?auto_1016042 ) ) ( not ( = ?auto_1016037 ?auto_1016048 ) ) ( not ( = ?auto_1016038 ?auto_1016039 ) ) ( not ( = ?auto_1016038 ?auto_1016040 ) ) ( not ( = ?auto_1016038 ?auto_1016041 ) ) ( not ( = ?auto_1016038 ?auto_1016042 ) ) ( not ( = ?auto_1016038 ?auto_1016048 ) ) ( not ( = ?auto_1016039 ?auto_1016040 ) ) ( not ( = ?auto_1016039 ?auto_1016041 ) ) ( not ( = ?auto_1016039 ?auto_1016042 ) ) ( not ( = ?auto_1016039 ?auto_1016048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1016040 ?auto_1016041 ?auto_1016042 )
      ( MAKE-12CRATE-VERIFY ?auto_1016031 ?auto_1016032 ?auto_1016033 ?auto_1016030 ?auto_1016034 ?auto_1016036 ?auto_1016035 ?auto_1016037 ?auto_1016038 ?auto_1016039 ?auto_1016040 ?auto_1016041 ?auto_1016042 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1016194 - SURFACE
      ?auto_1016195 - SURFACE
      ?auto_1016196 - SURFACE
      ?auto_1016193 - SURFACE
      ?auto_1016197 - SURFACE
      ?auto_1016199 - SURFACE
      ?auto_1016198 - SURFACE
      ?auto_1016200 - SURFACE
      ?auto_1016201 - SURFACE
      ?auto_1016202 - SURFACE
      ?auto_1016203 - SURFACE
      ?auto_1016204 - SURFACE
      ?auto_1016205 - SURFACE
    )
    :vars
    (
      ?auto_1016208 - HOIST
      ?auto_1016209 - PLACE
      ?auto_1016207 - PLACE
      ?auto_1016211 - HOIST
      ?auto_1016210 - SURFACE
      ?auto_1016206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016208 ?auto_1016209 ) ( SURFACE-AT ?auto_1016204 ?auto_1016209 ) ( CLEAR ?auto_1016204 ) ( IS-CRATE ?auto_1016205 ) ( not ( = ?auto_1016204 ?auto_1016205 ) ) ( AVAILABLE ?auto_1016208 ) ( ON ?auto_1016204 ?auto_1016203 ) ( not ( = ?auto_1016203 ?auto_1016204 ) ) ( not ( = ?auto_1016203 ?auto_1016205 ) ) ( not ( = ?auto_1016207 ?auto_1016209 ) ) ( HOIST-AT ?auto_1016211 ?auto_1016207 ) ( not ( = ?auto_1016208 ?auto_1016211 ) ) ( AVAILABLE ?auto_1016211 ) ( SURFACE-AT ?auto_1016205 ?auto_1016207 ) ( ON ?auto_1016205 ?auto_1016210 ) ( CLEAR ?auto_1016205 ) ( not ( = ?auto_1016204 ?auto_1016210 ) ) ( not ( = ?auto_1016205 ?auto_1016210 ) ) ( not ( = ?auto_1016203 ?auto_1016210 ) ) ( TRUCK-AT ?auto_1016206 ?auto_1016209 ) ( ON ?auto_1016195 ?auto_1016194 ) ( ON ?auto_1016196 ?auto_1016195 ) ( ON ?auto_1016193 ?auto_1016196 ) ( ON ?auto_1016197 ?auto_1016193 ) ( ON ?auto_1016199 ?auto_1016197 ) ( ON ?auto_1016198 ?auto_1016199 ) ( ON ?auto_1016200 ?auto_1016198 ) ( ON ?auto_1016201 ?auto_1016200 ) ( ON ?auto_1016202 ?auto_1016201 ) ( ON ?auto_1016203 ?auto_1016202 ) ( not ( = ?auto_1016194 ?auto_1016195 ) ) ( not ( = ?auto_1016194 ?auto_1016196 ) ) ( not ( = ?auto_1016194 ?auto_1016193 ) ) ( not ( = ?auto_1016194 ?auto_1016197 ) ) ( not ( = ?auto_1016194 ?auto_1016199 ) ) ( not ( = ?auto_1016194 ?auto_1016198 ) ) ( not ( = ?auto_1016194 ?auto_1016200 ) ) ( not ( = ?auto_1016194 ?auto_1016201 ) ) ( not ( = ?auto_1016194 ?auto_1016202 ) ) ( not ( = ?auto_1016194 ?auto_1016203 ) ) ( not ( = ?auto_1016194 ?auto_1016204 ) ) ( not ( = ?auto_1016194 ?auto_1016205 ) ) ( not ( = ?auto_1016194 ?auto_1016210 ) ) ( not ( = ?auto_1016195 ?auto_1016196 ) ) ( not ( = ?auto_1016195 ?auto_1016193 ) ) ( not ( = ?auto_1016195 ?auto_1016197 ) ) ( not ( = ?auto_1016195 ?auto_1016199 ) ) ( not ( = ?auto_1016195 ?auto_1016198 ) ) ( not ( = ?auto_1016195 ?auto_1016200 ) ) ( not ( = ?auto_1016195 ?auto_1016201 ) ) ( not ( = ?auto_1016195 ?auto_1016202 ) ) ( not ( = ?auto_1016195 ?auto_1016203 ) ) ( not ( = ?auto_1016195 ?auto_1016204 ) ) ( not ( = ?auto_1016195 ?auto_1016205 ) ) ( not ( = ?auto_1016195 ?auto_1016210 ) ) ( not ( = ?auto_1016196 ?auto_1016193 ) ) ( not ( = ?auto_1016196 ?auto_1016197 ) ) ( not ( = ?auto_1016196 ?auto_1016199 ) ) ( not ( = ?auto_1016196 ?auto_1016198 ) ) ( not ( = ?auto_1016196 ?auto_1016200 ) ) ( not ( = ?auto_1016196 ?auto_1016201 ) ) ( not ( = ?auto_1016196 ?auto_1016202 ) ) ( not ( = ?auto_1016196 ?auto_1016203 ) ) ( not ( = ?auto_1016196 ?auto_1016204 ) ) ( not ( = ?auto_1016196 ?auto_1016205 ) ) ( not ( = ?auto_1016196 ?auto_1016210 ) ) ( not ( = ?auto_1016193 ?auto_1016197 ) ) ( not ( = ?auto_1016193 ?auto_1016199 ) ) ( not ( = ?auto_1016193 ?auto_1016198 ) ) ( not ( = ?auto_1016193 ?auto_1016200 ) ) ( not ( = ?auto_1016193 ?auto_1016201 ) ) ( not ( = ?auto_1016193 ?auto_1016202 ) ) ( not ( = ?auto_1016193 ?auto_1016203 ) ) ( not ( = ?auto_1016193 ?auto_1016204 ) ) ( not ( = ?auto_1016193 ?auto_1016205 ) ) ( not ( = ?auto_1016193 ?auto_1016210 ) ) ( not ( = ?auto_1016197 ?auto_1016199 ) ) ( not ( = ?auto_1016197 ?auto_1016198 ) ) ( not ( = ?auto_1016197 ?auto_1016200 ) ) ( not ( = ?auto_1016197 ?auto_1016201 ) ) ( not ( = ?auto_1016197 ?auto_1016202 ) ) ( not ( = ?auto_1016197 ?auto_1016203 ) ) ( not ( = ?auto_1016197 ?auto_1016204 ) ) ( not ( = ?auto_1016197 ?auto_1016205 ) ) ( not ( = ?auto_1016197 ?auto_1016210 ) ) ( not ( = ?auto_1016199 ?auto_1016198 ) ) ( not ( = ?auto_1016199 ?auto_1016200 ) ) ( not ( = ?auto_1016199 ?auto_1016201 ) ) ( not ( = ?auto_1016199 ?auto_1016202 ) ) ( not ( = ?auto_1016199 ?auto_1016203 ) ) ( not ( = ?auto_1016199 ?auto_1016204 ) ) ( not ( = ?auto_1016199 ?auto_1016205 ) ) ( not ( = ?auto_1016199 ?auto_1016210 ) ) ( not ( = ?auto_1016198 ?auto_1016200 ) ) ( not ( = ?auto_1016198 ?auto_1016201 ) ) ( not ( = ?auto_1016198 ?auto_1016202 ) ) ( not ( = ?auto_1016198 ?auto_1016203 ) ) ( not ( = ?auto_1016198 ?auto_1016204 ) ) ( not ( = ?auto_1016198 ?auto_1016205 ) ) ( not ( = ?auto_1016198 ?auto_1016210 ) ) ( not ( = ?auto_1016200 ?auto_1016201 ) ) ( not ( = ?auto_1016200 ?auto_1016202 ) ) ( not ( = ?auto_1016200 ?auto_1016203 ) ) ( not ( = ?auto_1016200 ?auto_1016204 ) ) ( not ( = ?auto_1016200 ?auto_1016205 ) ) ( not ( = ?auto_1016200 ?auto_1016210 ) ) ( not ( = ?auto_1016201 ?auto_1016202 ) ) ( not ( = ?auto_1016201 ?auto_1016203 ) ) ( not ( = ?auto_1016201 ?auto_1016204 ) ) ( not ( = ?auto_1016201 ?auto_1016205 ) ) ( not ( = ?auto_1016201 ?auto_1016210 ) ) ( not ( = ?auto_1016202 ?auto_1016203 ) ) ( not ( = ?auto_1016202 ?auto_1016204 ) ) ( not ( = ?auto_1016202 ?auto_1016205 ) ) ( not ( = ?auto_1016202 ?auto_1016210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1016203 ?auto_1016204 ?auto_1016205 )
      ( MAKE-12CRATE-VERIFY ?auto_1016194 ?auto_1016195 ?auto_1016196 ?auto_1016193 ?auto_1016197 ?auto_1016199 ?auto_1016198 ?auto_1016200 ?auto_1016201 ?auto_1016202 ?auto_1016203 ?auto_1016204 ?auto_1016205 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1016357 - SURFACE
      ?auto_1016358 - SURFACE
      ?auto_1016359 - SURFACE
      ?auto_1016356 - SURFACE
      ?auto_1016360 - SURFACE
      ?auto_1016362 - SURFACE
      ?auto_1016361 - SURFACE
      ?auto_1016363 - SURFACE
      ?auto_1016364 - SURFACE
      ?auto_1016365 - SURFACE
      ?auto_1016366 - SURFACE
      ?auto_1016367 - SURFACE
      ?auto_1016368 - SURFACE
    )
    :vars
    (
      ?auto_1016372 - HOIST
      ?auto_1016371 - PLACE
      ?auto_1016370 - PLACE
      ?auto_1016373 - HOIST
      ?auto_1016374 - SURFACE
      ?auto_1016369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016372 ?auto_1016371 ) ( IS-CRATE ?auto_1016368 ) ( not ( = ?auto_1016367 ?auto_1016368 ) ) ( not ( = ?auto_1016366 ?auto_1016367 ) ) ( not ( = ?auto_1016366 ?auto_1016368 ) ) ( not ( = ?auto_1016370 ?auto_1016371 ) ) ( HOIST-AT ?auto_1016373 ?auto_1016370 ) ( not ( = ?auto_1016372 ?auto_1016373 ) ) ( AVAILABLE ?auto_1016373 ) ( SURFACE-AT ?auto_1016368 ?auto_1016370 ) ( ON ?auto_1016368 ?auto_1016374 ) ( CLEAR ?auto_1016368 ) ( not ( = ?auto_1016367 ?auto_1016374 ) ) ( not ( = ?auto_1016368 ?auto_1016374 ) ) ( not ( = ?auto_1016366 ?auto_1016374 ) ) ( TRUCK-AT ?auto_1016369 ?auto_1016371 ) ( SURFACE-AT ?auto_1016366 ?auto_1016371 ) ( CLEAR ?auto_1016366 ) ( LIFTING ?auto_1016372 ?auto_1016367 ) ( IS-CRATE ?auto_1016367 ) ( ON ?auto_1016358 ?auto_1016357 ) ( ON ?auto_1016359 ?auto_1016358 ) ( ON ?auto_1016356 ?auto_1016359 ) ( ON ?auto_1016360 ?auto_1016356 ) ( ON ?auto_1016362 ?auto_1016360 ) ( ON ?auto_1016361 ?auto_1016362 ) ( ON ?auto_1016363 ?auto_1016361 ) ( ON ?auto_1016364 ?auto_1016363 ) ( ON ?auto_1016365 ?auto_1016364 ) ( ON ?auto_1016366 ?auto_1016365 ) ( not ( = ?auto_1016357 ?auto_1016358 ) ) ( not ( = ?auto_1016357 ?auto_1016359 ) ) ( not ( = ?auto_1016357 ?auto_1016356 ) ) ( not ( = ?auto_1016357 ?auto_1016360 ) ) ( not ( = ?auto_1016357 ?auto_1016362 ) ) ( not ( = ?auto_1016357 ?auto_1016361 ) ) ( not ( = ?auto_1016357 ?auto_1016363 ) ) ( not ( = ?auto_1016357 ?auto_1016364 ) ) ( not ( = ?auto_1016357 ?auto_1016365 ) ) ( not ( = ?auto_1016357 ?auto_1016366 ) ) ( not ( = ?auto_1016357 ?auto_1016367 ) ) ( not ( = ?auto_1016357 ?auto_1016368 ) ) ( not ( = ?auto_1016357 ?auto_1016374 ) ) ( not ( = ?auto_1016358 ?auto_1016359 ) ) ( not ( = ?auto_1016358 ?auto_1016356 ) ) ( not ( = ?auto_1016358 ?auto_1016360 ) ) ( not ( = ?auto_1016358 ?auto_1016362 ) ) ( not ( = ?auto_1016358 ?auto_1016361 ) ) ( not ( = ?auto_1016358 ?auto_1016363 ) ) ( not ( = ?auto_1016358 ?auto_1016364 ) ) ( not ( = ?auto_1016358 ?auto_1016365 ) ) ( not ( = ?auto_1016358 ?auto_1016366 ) ) ( not ( = ?auto_1016358 ?auto_1016367 ) ) ( not ( = ?auto_1016358 ?auto_1016368 ) ) ( not ( = ?auto_1016358 ?auto_1016374 ) ) ( not ( = ?auto_1016359 ?auto_1016356 ) ) ( not ( = ?auto_1016359 ?auto_1016360 ) ) ( not ( = ?auto_1016359 ?auto_1016362 ) ) ( not ( = ?auto_1016359 ?auto_1016361 ) ) ( not ( = ?auto_1016359 ?auto_1016363 ) ) ( not ( = ?auto_1016359 ?auto_1016364 ) ) ( not ( = ?auto_1016359 ?auto_1016365 ) ) ( not ( = ?auto_1016359 ?auto_1016366 ) ) ( not ( = ?auto_1016359 ?auto_1016367 ) ) ( not ( = ?auto_1016359 ?auto_1016368 ) ) ( not ( = ?auto_1016359 ?auto_1016374 ) ) ( not ( = ?auto_1016356 ?auto_1016360 ) ) ( not ( = ?auto_1016356 ?auto_1016362 ) ) ( not ( = ?auto_1016356 ?auto_1016361 ) ) ( not ( = ?auto_1016356 ?auto_1016363 ) ) ( not ( = ?auto_1016356 ?auto_1016364 ) ) ( not ( = ?auto_1016356 ?auto_1016365 ) ) ( not ( = ?auto_1016356 ?auto_1016366 ) ) ( not ( = ?auto_1016356 ?auto_1016367 ) ) ( not ( = ?auto_1016356 ?auto_1016368 ) ) ( not ( = ?auto_1016356 ?auto_1016374 ) ) ( not ( = ?auto_1016360 ?auto_1016362 ) ) ( not ( = ?auto_1016360 ?auto_1016361 ) ) ( not ( = ?auto_1016360 ?auto_1016363 ) ) ( not ( = ?auto_1016360 ?auto_1016364 ) ) ( not ( = ?auto_1016360 ?auto_1016365 ) ) ( not ( = ?auto_1016360 ?auto_1016366 ) ) ( not ( = ?auto_1016360 ?auto_1016367 ) ) ( not ( = ?auto_1016360 ?auto_1016368 ) ) ( not ( = ?auto_1016360 ?auto_1016374 ) ) ( not ( = ?auto_1016362 ?auto_1016361 ) ) ( not ( = ?auto_1016362 ?auto_1016363 ) ) ( not ( = ?auto_1016362 ?auto_1016364 ) ) ( not ( = ?auto_1016362 ?auto_1016365 ) ) ( not ( = ?auto_1016362 ?auto_1016366 ) ) ( not ( = ?auto_1016362 ?auto_1016367 ) ) ( not ( = ?auto_1016362 ?auto_1016368 ) ) ( not ( = ?auto_1016362 ?auto_1016374 ) ) ( not ( = ?auto_1016361 ?auto_1016363 ) ) ( not ( = ?auto_1016361 ?auto_1016364 ) ) ( not ( = ?auto_1016361 ?auto_1016365 ) ) ( not ( = ?auto_1016361 ?auto_1016366 ) ) ( not ( = ?auto_1016361 ?auto_1016367 ) ) ( not ( = ?auto_1016361 ?auto_1016368 ) ) ( not ( = ?auto_1016361 ?auto_1016374 ) ) ( not ( = ?auto_1016363 ?auto_1016364 ) ) ( not ( = ?auto_1016363 ?auto_1016365 ) ) ( not ( = ?auto_1016363 ?auto_1016366 ) ) ( not ( = ?auto_1016363 ?auto_1016367 ) ) ( not ( = ?auto_1016363 ?auto_1016368 ) ) ( not ( = ?auto_1016363 ?auto_1016374 ) ) ( not ( = ?auto_1016364 ?auto_1016365 ) ) ( not ( = ?auto_1016364 ?auto_1016366 ) ) ( not ( = ?auto_1016364 ?auto_1016367 ) ) ( not ( = ?auto_1016364 ?auto_1016368 ) ) ( not ( = ?auto_1016364 ?auto_1016374 ) ) ( not ( = ?auto_1016365 ?auto_1016366 ) ) ( not ( = ?auto_1016365 ?auto_1016367 ) ) ( not ( = ?auto_1016365 ?auto_1016368 ) ) ( not ( = ?auto_1016365 ?auto_1016374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1016366 ?auto_1016367 ?auto_1016368 )
      ( MAKE-12CRATE-VERIFY ?auto_1016357 ?auto_1016358 ?auto_1016359 ?auto_1016356 ?auto_1016360 ?auto_1016362 ?auto_1016361 ?auto_1016363 ?auto_1016364 ?auto_1016365 ?auto_1016366 ?auto_1016367 ?auto_1016368 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1016520 - SURFACE
      ?auto_1016521 - SURFACE
      ?auto_1016522 - SURFACE
      ?auto_1016519 - SURFACE
      ?auto_1016523 - SURFACE
      ?auto_1016525 - SURFACE
      ?auto_1016524 - SURFACE
      ?auto_1016526 - SURFACE
      ?auto_1016527 - SURFACE
      ?auto_1016528 - SURFACE
      ?auto_1016529 - SURFACE
      ?auto_1016530 - SURFACE
      ?auto_1016531 - SURFACE
    )
    :vars
    (
      ?auto_1016536 - HOIST
      ?auto_1016537 - PLACE
      ?auto_1016532 - PLACE
      ?auto_1016535 - HOIST
      ?auto_1016534 - SURFACE
      ?auto_1016533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016536 ?auto_1016537 ) ( IS-CRATE ?auto_1016531 ) ( not ( = ?auto_1016530 ?auto_1016531 ) ) ( not ( = ?auto_1016529 ?auto_1016530 ) ) ( not ( = ?auto_1016529 ?auto_1016531 ) ) ( not ( = ?auto_1016532 ?auto_1016537 ) ) ( HOIST-AT ?auto_1016535 ?auto_1016532 ) ( not ( = ?auto_1016536 ?auto_1016535 ) ) ( AVAILABLE ?auto_1016535 ) ( SURFACE-AT ?auto_1016531 ?auto_1016532 ) ( ON ?auto_1016531 ?auto_1016534 ) ( CLEAR ?auto_1016531 ) ( not ( = ?auto_1016530 ?auto_1016534 ) ) ( not ( = ?auto_1016531 ?auto_1016534 ) ) ( not ( = ?auto_1016529 ?auto_1016534 ) ) ( TRUCK-AT ?auto_1016533 ?auto_1016537 ) ( SURFACE-AT ?auto_1016529 ?auto_1016537 ) ( CLEAR ?auto_1016529 ) ( IS-CRATE ?auto_1016530 ) ( AVAILABLE ?auto_1016536 ) ( IN ?auto_1016530 ?auto_1016533 ) ( ON ?auto_1016521 ?auto_1016520 ) ( ON ?auto_1016522 ?auto_1016521 ) ( ON ?auto_1016519 ?auto_1016522 ) ( ON ?auto_1016523 ?auto_1016519 ) ( ON ?auto_1016525 ?auto_1016523 ) ( ON ?auto_1016524 ?auto_1016525 ) ( ON ?auto_1016526 ?auto_1016524 ) ( ON ?auto_1016527 ?auto_1016526 ) ( ON ?auto_1016528 ?auto_1016527 ) ( ON ?auto_1016529 ?auto_1016528 ) ( not ( = ?auto_1016520 ?auto_1016521 ) ) ( not ( = ?auto_1016520 ?auto_1016522 ) ) ( not ( = ?auto_1016520 ?auto_1016519 ) ) ( not ( = ?auto_1016520 ?auto_1016523 ) ) ( not ( = ?auto_1016520 ?auto_1016525 ) ) ( not ( = ?auto_1016520 ?auto_1016524 ) ) ( not ( = ?auto_1016520 ?auto_1016526 ) ) ( not ( = ?auto_1016520 ?auto_1016527 ) ) ( not ( = ?auto_1016520 ?auto_1016528 ) ) ( not ( = ?auto_1016520 ?auto_1016529 ) ) ( not ( = ?auto_1016520 ?auto_1016530 ) ) ( not ( = ?auto_1016520 ?auto_1016531 ) ) ( not ( = ?auto_1016520 ?auto_1016534 ) ) ( not ( = ?auto_1016521 ?auto_1016522 ) ) ( not ( = ?auto_1016521 ?auto_1016519 ) ) ( not ( = ?auto_1016521 ?auto_1016523 ) ) ( not ( = ?auto_1016521 ?auto_1016525 ) ) ( not ( = ?auto_1016521 ?auto_1016524 ) ) ( not ( = ?auto_1016521 ?auto_1016526 ) ) ( not ( = ?auto_1016521 ?auto_1016527 ) ) ( not ( = ?auto_1016521 ?auto_1016528 ) ) ( not ( = ?auto_1016521 ?auto_1016529 ) ) ( not ( = ?auto_1016521 ?auto_1016530 ) ) ( not ( = ?auto_1016521 ?auto_1016531 ) ) ( not ( = ?auto_1016521 ?auto_1016534 ) ) ( not ( = ?auto_1016522 ?auto_1016519 ) ) ( not ( = ?auto_1016522 ?auto_1016523 ) ) ( not ( = ?auto_1016522 ?auto_1016525 ) ) ( not ( = ?auto_1016522 ?auto_1016524 ) ) ( not ( = ?auto_1016522 ?auto_1016526 ) ) ( not ( = ?auto_1016522 ?auto_1016527 ) ) ( not ( = ?auto_1016522 ?auto_1016528 ) ) ( not ( = ?auto_1016522 ?auto_1016529 ) ) ( not ( = ?auto_1016522 ?auto_1016530 ) ) ( not ( = ?auto_1016522 ?auto_1016531 ) ) ( not ( = ?auto_1016522 ?auto_1016534 ) ) ( not ( = ?auto_1016519 ?auto_1016523 ) ) ( not ( = ?auto_1016519 ?auto_1016525 ) ) ( not ( = ?auto_1016519 ?auto_1016524 ) ) ( not ( = ?auto_1016519 ?auto_1016526 ) ) ( not ( = ?auto_1016519 ?auto_1016527 ) ) ( not ( = ?auto_1016519 ?auto_1016528 ) ) ( not ( = ?auto_1016519 ?auto_1016529 ) ) ( not ( = ?auto_1016519 ?auto_1016530 ) ) ( not ( = ?auto_1016519 ?auto_1016531 ) ) ( not ( = ?auto_1016519 ?auto_1016534 ) ) ( not ( = ?auto_1016523 ?auto_1016525 ) ) ( not ( = ?auto_1016523 ?auto_1016524 ) ) ( not ( = ?auto_1016523 ?auto_1016526 ) ) ( not ( = ?auto_1016523 ?auto_1016527 ) ) ( not ( = ?auto_1016523 ?auto_1016528 ) ) ( not ( = ?auto_1016523 ?auto_1016529 ) ) ( not ( = ?auto_1016523 ?auto_1016530 ) ) ( not ( = ?auto_1016523 ?auto_1016531 ) ) ( not ( = ?auto_1016523 ?auto_1016534 ) ) ( not ( = ?auto_1016525 ?auto_1016524 ) ) ( not ( = ?auto_1016525 ?auto_1016526 ) ) ( not ( = ?auto_1016525 ?auto_1016527 ) ) ( not ( = ?auto_1016525 ?auto_1016528 ) ) ( not ( = ?auto_1016525 ?auto_1016529 ) ) ( not ( = ?auto_1016525 ?auto_1016530 ) ) ( not ( = ?auto_1016525 ?auto_1016531 ) ) ( not ( = ?auto_1016525 ?auto_1016534 ) ) ( not ( = ?auto_1016524 ?auto_1016526 ) ) ( not ( = ?auto_1016524 ?auto_1016527 ) ) ( not ( = ?auto_1016524 ?auto_1016528 ) ) ( not ( = ?auto_1016524 ?auto_1016529 ) ) ( not ( = ?auto_1016524 ?auto_1016530 ) ) ( not ( = ?auto_1016524 ?auto_1016531 ) ) ( not ( = ?auto_1016524 ?auto_1016534 ) ) ( not ( = ?auto_1016526 ?auto_1016527 ) ) ( not ( = ?auto_1016526 ?auto_1016528 ) ) ( not ( = ?auto_1016526 ?auto_1016529 ) ) ( not ( = ?auto_1016526 ?auto_1016530 ) ) ( not ( = ?auto_1016526 ?auto_1016531 ) ) ( not ( = ?auto_1016526 ?auto_1016534 ) ) ( not ( = ?auto_1016527 ?auto_1016528 ) ) ( not ( = ?auto_1016527 ?auto_1016529 ) ) ( not ( = ?auto_1016527 ?auto_1016530 ) ) ( not ( = ?auto_1016527 ?auto_1016531 ) ) ( not ( = ?auto_1016527 ?auto_1016534 ) ) ( not ( = ?auto_1016528 ?auto_1016529 ) ) ( not ( = ?auto_1016528 ?auto_1016530 ) ) ( not ( = ?auto_1016528 ?auto_1016531 ) ) ( not ( = ?auto_1016528 ?auto_1016534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1016529 ?auto_1016530 ?auto_1016531 )
      ( MAKE-12CRATE-VERIFY ?auto_1016520 ?auto_1016521 ?auto_1016522 ?auto_1016519 ?auto_1016523 ?auto_1016525 ?auto_1016524 ?auto_1016526 ?auto_1016527 ?auto_1016528 ?auto_1016529 ?auto_1016530 ?auto_1016531 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028048 - SURFACE
      ?auto_1028049 - SURFACE
      ?auto_1028050 - SURFACE
      ?auto_1028047 - SURFACE
      ?auto_1028051 - SURFACE
      ?auto_1028053 - SURFACE
      ?auto_1028052 - SURFACE
      ?auto_1028054 - SURFACE
      ?auto_1028055 - SURFACE
      ?auto_1028056 - SURFACE
      ?auto_1028057 - SURFACE
      ?auto_1028058 - SURFACE
      ?auto_1028059 - SURFACE
      ?auto_1028060 - SURFACE
    )
    :vars
    (
      ?auto_1028062 - HOIST
      ?auto_1028061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028062 ?auto_1028061 ) ( SURFACE-AT ?auto_1028059 ?auto_1028061 ) ( CLEAR ?auto_1028059 ) ( LIFTING ?auto_1028062 ?auto_1028060 ) ( IS-CRATE ?auto_1028060 ) ( not ( = ?auto_1028059 ?auto_1028060 ) ) ( ON ?auto_1028049 ?auto_1028048 ) ( ON ?auto_1028050 ?auto_1028049 ) ( ON ?auto_1028047 ?auto_1028050 ) ( ON ?auto_1028051 ?auto_1028047 ) ( ON ?auto_1028053 ?auto_1028051 ) ( ON ?auto_1028052 ?auto_1028053 ) ( ON ?auto_1028054 ?auto_1028052 ) ( ON ?auto_1028055 ?auto_1028054 ) ( ON ?auto_1028056 ?auto_1028055 ) ( ON ?auto_1028057 ?auto_1028056 ) ( ON ?auto_1028058 ?auto_1028057 ) ( ON ?auto_1028059 ?auto_1028058 ) ( not ( = ?auto_1028048 ?auto_1028049 ) ) ( not ( = ?auto_1028048 ?auto_1028050 ) ) ( not ( = ?auto_1028048 ?auto_1028047 ) ) ( not ( = ?auto_1028048 ?auto_1028051 ) ) ( not ( = ?auto_1028048 ?auto_1028053 ) ) ( not ( = ?auto_1028048 ?auto_1028052 ) ) ( not ( = ?auto_1028048 ?auto_1028054 ) ) ( not ( = ?auto_1028048 ?auto_1028055 ) ) ( not ( = ?auto_1028048 ?auto_1028056 ) ) ( not ( = ?auto_1028048 ?auto_1028057 ) ) ( not ( = ?auto_1028048 ?auto_1028058 ) ) ( not ( = ?auto_1028048 ?auto_1028059 ) ) ( not ( = ?auto_1028048 ?auto_1028060 ) ) ( not ( = ?auto_1028049 ?auto_1028050 ) ) ( not ( = ?auto_1028049 ?auto_1028047 ) ) ( not ( = ?auto_1028049 ?auto_1028051 ) ) ( not ( = ?auto_1028049 ?auto_1028053 ) ) ( not ( = ?auto_1028049 ?auto_1028052 ) ) ( not ( = ?auto_1028049 ?auto_1028054 ) ) ( not ( = ?auto_1028049 ?auto_1028055 ) ) ( not ( = ?auto_1028049 ?auto_1028056 ) ) ( not ( = ?auto_1028049 ?auto_1028057 ) ) ( not ( = ?auto_1028049 ?auto_1028058 ) ) ( not ( = ?auto_1028049 ?auto_1028059 ) ) ( not ( = ?auto_1028049 ?auto_1028060 ) ) ( not ( = ?auto_1028050 ?auto_1028047 ) ) ( not ( = ?auto_1028050 ?auto_1028051 ) ) ( not ( = ?auto_1028050 ?auto_1028053 ) ) ( not ( = ?auto_1028050 ?auto_1028052 ) ) ( not ( = ?auto_1028050 ?auto_1028054 ) ) ( not ( = ?auto_1028050 ?auto_1028055 ) ) ( not ( = ?auto_1028050 ?auto_1028056 ) ) ( not ( = ?auto_1028050 ?auto_1028057 ) ) ( not ( = ?auto_1028050 ?auto_1028058 ) ) ( not ( = ?auto_1028050 ?auto_1028059 ) ) ( not ( = ?auto_1028050 ?auto_1028060 ) ) ( not ( = ?auto_1028047 ?auto_1028051 ) ) ( not ( = ?auto_1028047 ?auto_1028053 ) ) ( not ( = ?auto_1028047 ?auto_1028052 ) ) ( not ( = ?auto_1028047 ?auto_1028054 ) ) ( not ( = ?auto_1028047 ?auto_1028055 ) ) ( not ( = ?auto_1028047 ?auto_1028056 ) ) ( not ( = ?auto_1028047 ?auto_1028057 ) ) ( not ( = ?auto_1028047 ?auto_1028058 ) ) ( not ( = ?auto_1028047 ?auto_1028059 ) ) ( not ( = ?auto_1028047 ?auto_1028060 ) ) ( not ( = ?auto_1028051 ?auto_1028053 ) ) ( not ( = ?auto_1028051 ?auto_1028052 ) ) ( not ( = ?auto_1028051 ?auto_1028054 ) ) ( not ( = ?auto_1028051 ?auto_1028055 ) ) ( not ( = ?auto_1028051 ?auto_1028056 ) ) ( not ( = ?auto_1028051 ?auto_1028057 ) ) ( not ( = ?auto_1028051 ?auto_1028058 ) ) ( not ( = ?auto_1028051 ?auto_1028059 ) ) ( not ( = ?auto_1028051 ?auto_1028060 ) ) ( not ( = ?auto_1028053 ?auto_1028052 ) ) ( not ( = ?auto_1028053 ?auto_1028054 ) ) ( not ( = ?auto_1028053 ?auto_1028055 ) ) ( not ( = ?auto_1028053 ?auto_1028056 ) ) ( not ( = ?auto_1028053 ?auto_1028057 ) ) ( not ( = ?auto_1028053 ?auto_1028058 ) ) ( not ( = ?auto_1028053 ?auto_1028059 ) ) ( not ( = ?auto_1028053 ?auto_1028060 ) ) ( not ( = ?auto_1028052 ?auto_1028054 ) ) ( not ( = ?auto_1028052 ?auto_1028055 ) ) ( not ( = ?auto_1028052 ?auto_1028056 ) ) ( not ( = ?auto_1028052 ?auto_1028057 ) ) ( not ( = ?auto_1028052 ?auto_1028058 ) ) ( not ( = ?auto_1028052 ?auto_1028059 ) ) ( not ( = ?auto_1028052 ?auto_1028060 ) ) ( not ( = ?auto_1028054 ?auto_1028055 ) ) ( not ( = ?auto_1028054 ?auto_1028056 ) ) ( not ( = ?auto_1028054 ?auto_1028057 ) ) ( not ( = ?auto_1028054 ?auto_1028058 ) ) ( not ( = ?auto_1028054 ?auto_1028059 ) ) ( not ( = ?auto_1028054 ?auto_1028060 ) ) ( not ( = ?auto_1028055 ?auto_1028056 ) ) ( not ( = ?auto_1028055 ?auto_1028057 ) ) ( not ( = ?auto_1028055 ?auto_1028058 ) ) ( not ( = ?auto_1028055 ?auto_1028059 ) ) ( not ( = ?auto_1028055 ?auto_1028060 ) ) ( not ( = ?auto_1028056 ?auto_1028057 ) ) ( not ( = ?auto_1028056 ?auto_1028058 ) ) ( not ( = ?auto_1028056 ?auto_1028059 ) ) ( not ( = ?auto_1028056 ?auto_1028060 ) ) ( not ( = ?auto_1028057 ?auto_1028058 ) ) ( not ( = ?auto_1028057 ?auto_1028059 ) ) ( not ( = ?auto_1028057 ?auto_1028060 ) ) ( not ( = ?auto_1028058 ?auto_1028059 ) ) ( not ( = ?auto_1028058 ?auto_1028060 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1028059 ?auto_1028060 )
      ( MAKE-13CRATE-VERIFY ?auto_1028048 ?auto_1028049 ?auto_1028050 ?auto_1028047 ?auto_1028051 ?auto_1028053 ?auto_1028052 ?auto_1028054 ?auto_1028055 ?auto_1028056 ?auto_1028057 ?auto_1028058 ?auto_1028059 ?auto_1028060 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028190 - SURFACE
      ?auto_1028191 - SURFACE
      ?auto_1028192 - SURFACE
      ?auto_1028189 - SURFACE
      ?auto_1028193 - SURFACE
      ?auto_1028195 - SURFACE
      ?auto_1028194 - SURFACE
      ?auto_1028196 - SURFACE
      ?auto_1028197 - SURFACE
      ?auto_1028198 - SURFACE
      ?auto_1028199 - SURFACE
      ?auto_1028200 - SURFACE
      ?auto_1028201 - SURFACE
      ?auto_1028202 - SURFACE
    )
    :vars
    (
      ?auto_1028205 - HOIST
      ?auto_1028203 - PLACE
      ?auto_1028204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028205 ?auto_1028203 ) ( SURFACE-AT ?auto_1028201 ?auto_1028203 ) ( CLEAR ?auto_1028201 ) ( IS-CRATE ?auto_1028202 ) ( not ( = ?auto_1028201 ?auto_1028202 ) ) ( TRUCK-AT ?auto_1028204 ?auto_1028203 ) ( AVAILABLE ?auto_1028205 ) ( IN ?auto_1028202 ?auto_1028204 ) ( ON ?auto_1028201 ?auto_1028200 ) ( not ( = ?auto_1028200 ?auto_1028201 ) ) ( not ( = ?auto_1028200 ?auto_1028202 ) ) ( ON ?auto_1028191 ?auto_1028190 ) ( ON ?auto_1028192 ?auto_1028191 ) ( ON ?auto_1028189 ?auto_1028192 ) ( ON ?auto_1028193 ?auto_1028189 ) ( ON ?auto_1028195 ?auto_1028193 ) ( ON ?auto_1028194 ?auto_1028195 ) ( ON ?auto_1028196 ?auto_1028194 ) ( ON ?auto_1028197 ?auto_1028196 ) ( ON ?auto_1028198 ?auto_1028197 ) ( ON ?auto_1028199 ?auto_1028198 ) ( ON ?auto_1028200 ?auto_1028199 ) ( not ( = ?auto_1028190 ?auto_1028191 ) ) ( not ( = ?auto_1028190 ?auto_1028192 ) ) ( not ( = ?auto_1028190 ?auto_1028189 ) ) ( not ( = ?auto_1028190 ?auto_1028193 ) ) ( not ( = ?auto_1028190 ?auto_1028195 ) ) ( not ( = ?auto_1028190 ?auto_1028194 ) ) ( not ( = ?auto_1028190 ?auto_1028196 ) ) ( not ( = ?auto_1028190 ?auto_1028197 ) ) ( not ( = ?auto_1028190 ?auto_1028198 ) ) ( not ( = ?auto_1028190 ?auto_1028199 ) ) ( not ( = ?auto_1028190 ?auto_1028200 ) ) ( not ( = ?auto_1028190 ?auto_1028201 ) ) ( not ( = ?auto_1028190 ?auto_1028202 ) ) ( not ( = ?auto_1028191 ?auto_1028192 ) ) ( not ( = ?auto_1028191 ?auto_1028189 ) ) ( not ( = ?auto_1028191 ?auto_1028193 ) ) ( not ( = ?auto_1028191 ?auto_1028195 ) ) ( not ( = ?auto_1028191 ?auto_1028194 ) ) ( not ( = ?auto_1028191 ?auto_1028196 ) ) ( not ( = ?auto_1028191 ?auto_1028197 ) ) ( not ( = ?auto_1028191 ?auto_1028198 ) ) ( not ( = ?auto_1028191 ?auto_1028199 ) ) ( not ( = ?auto_1028191 ?auto_1028200 ) ) ( not ( = ?auto_1028191 ?auto_1028201 ) ) ( not ( = ?auto_1028191 ?auto_1028202 ) ) ( not ( = ?auto_1028192 ?auto_1028189 ) ) ( not ( = ?auto_1028192 ?auto_1028193 ) ) ( not ( = ?auto_1028192 ?auto_1028195 ) ) ( not ( = ?auto_1028192 ?auto_1028194 ) ) ( not ( = ?auto_1028192 ?auto_1028196 ) ) ( not ( = ?auto_1028192 ?auto_1028197 ) ) ( not ( = ?auto_1028192 ?auto_1028198 ) ) ( not ( = ?auto_1028192 ?auto_1028199 ) ) ( not ( = ?auto_1028192 ?auto_1028200 ) ) ( not ( = ?auto_1028192 ?auto_1028201 ) ) ( not ( = ?auto_1028192 ?auto_1028202 ) ) ( not ( = ?auto_1028189 ?auto_1028193 ) ) ( not ( = ?auto_1028189 ?auto_1028195 ) ) ( not ( = ?auto_1028189 ?auto_1028194 ) ) ( not ( = ?auto_1028189 ?auto_1028196 ) ) ( not ( = ?auto_1028189 ?auto_1028197 ) ) ( not ( = ?auto_1028189 ?auto_1028198 ) ) ( not ( = ?auto_1028189 ?auto_1028199 ) ) ( not ( = ?auto_1028189 ?auto_1028200 ) ) ( not ( = ?auto_1028189 ?auto_1028201 ) ) ( not ( = ?auto_1028189 ?auto_1028202 ) ) ( not ( = ?auto_1028193 ?auto_1028195 ) ) ( not ( = ?auto_1028193 ?auto_1028194 ) ) ( not ( = ?auto_1028193 ?auto_1028196 ) ) ( not ( = ?auto_1028193 ?auto_1028197 ) ) ( not ( = ?auto_1028193 ?auto_1028198 ) ) ( not ( = ?auto_1028193 ?auto_1028199 ) ) ( not ( = ?auto_1028193 ?auto_1028200 ) ) ( not ( = ?auto_1028193 ?auto_1028201 ) ) ( not ( = ?auto_1028193 ?auto_1028202 ) ) ( not ( = ?auto_1028195 ?auto_1028194 ) ) ( not ( = ?auto_1028195 ?auto_1028196 ) ) ( not ( = ?auto_1028195 ?auto_1028197 ) ) ( not ( = ?auto_1028195 ?auto_1028198 ) ) ( not ( = ?auto_1028195 ?auto_1028199 ) ) ( not ( = ?auto_1028195 ?auto_1028200 ) ) ( not ( = ?auto_1028195 ?auto_1028201 ) ) ( not ( = ?auto_1028195 ?auto_1028202 ) ) ( not ( = ?auto_1028194 ?auto_1028196 ) ) ( not ( = ?auto_1028194 ?auto_1028197 ) ) ( not ( = ?auto_1028194 ?auto_1028198 ) ) ( not ( = ?auto_1028194 ?auto_1028199 ) ) ( not ( = ?auto_1028194 ?auto_1028200 ) ) ( not ( = ?auto_1028194 ?auto_1028201 ) ) ( not ( = ?auto_1028194 ?auto_1028202 ) ) ( not ( = ?auto_1028196 ?auto_1028197 ) ) ( not ( = ?auto_1028196 ?auto_1028198 ) ) ( not ( = ?auto_1028196 ?auto_1028199 ) ) ( not ( = ?auto_1028196 ?auto_1028200 ) ) ( not ( = ?auto_1028196 ?auto_1028201 ) ) ( not ( = ?auto_1028196 ?auto_1028202 ) ) ( not ( = ?auto_1028197 ?auto_1028198 ) ) ( not ( = ?auto_1028197 ?auto_1028199 ) ) ( not ( = ?auto_1028197 ?auto_1028200 ) ) ( not ( = ?auto_1028197 ?auto_1028201 ) ) ( not ( = ?auto_1028197 ?auto_1028202 ) ) ( not ( = ?auto_1028198 ?auto_1028199 ) ) ( not ( = ?auto_1028198 ?auto_1028200 ) ) ( not ( = ?auto_1028198 ?auto_1028201 ) ) ( not ( = ?auto_1028198 ?auto_1028202 ) ) ( not ( = ?auto_1028199 ?auto_1028200 ) ) ( not ( = ?auto_1028199 ?auto_1028201 ) ) ( not ( = ?auto_1028199 ?auto_1028202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028200 ?auto_1028201 ?auto_1028202 )
      ( MAKE-13CRATE-VERIFY ?auto_1028190 ?auto_1028191 ?auto_1028192 ?auto_1028189 ?auto_1028193 ?auto_1028195 ?auto_1028194 ?auto_1028196 ?auto_1028197 ?auto_1028198 ?auto_1028199 ?auto_1028200 ?auto_1028201 ?auto_1028202 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028346 - SURFACE
      ?auto_1028347 - SURFACE
      ?auto_1028348 - SURFACE
      ?auto_1028345 - SURFACE
      ?auto_1028349 - SURFACE
      ?auto_1028351 - SURFACE
      ?auto_1028350 - SURFACE
      ?auto_1028352 - SURFACE
      ?auto_1028353 - SURFACE
      ?auto_1028354 - SURFACE
      ?auto_1028355 - SURFACE
      ?auto_1028356 - SURFACE
      ?auto_1028357 - SURFACE
      ?auto_1028358 - SURFACE
    )
    :vars
    (
      ?auto_1028361 - HOIST
      ?auto_1028360 - PLACE
      ?auto_1028362 - TRUCK
      ?auto_1028359 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028361 ?auto_1028360 ) ( SURFACE-AT ?auto_1028357 ?auto_1028360 ) ( CLEAR ?auto_1028357 ) ( IS-CRATE ?auto_1028358 ) ( not ( = ?auto_1028357 ?auto_1028358 ) ) ( AVAILABLE ?auto_1028361 ) ( IN ?auto_1028358 ?auto_1028362 ) ( ON ?auto_1028357 ?auto_1028356 ) ( not ( = ?auto_1028356 ?auto_1028357 ) ) ( not ( = ?auto_1028356 ?auto_1028358 ) ) ( TRUCK-AT ?auto_1028362 ?auto_1028359 ) ( not ( = ?auto_1028359 ?auto_1028360 ) ) ( ON ?auto_1028347 ?auto_1028346 ) ( ON ?auto_1028348 ?auto_1028347 ) ( ON ?auto_1028345 ?auto_1028348 ) ( ON ?auto_1028349 ?auto_1028345 ) ( ON ?auto_1028351 ?auto_1028349 ) ( ON ?auto_1028350 ?auto_1028351 ) ( ON ?auto_1028352 ?auto_1028350 ) ( ON ?auto_1028353 ?auto_1028352 ) ( ON ?auto_1028354 ?auto_1028353 ) ( ON ?auto_1028355 ?auto_1028354 ) ( ON ?auto_1028356 ?auto_1028355 ) ( not ( = ?auto_1028346 ?auto_1028347 ) ) ( not ( = ?auto_1028346 ?auto_1028348 ) ) ( not ( = ?auto_1028346 ?auto_1028345 ) ) ( not ( = ?auto_1028346 ?auto_1028349 ) ) ( not ( = ?auto_1028346 ?auto_1028351 ) ) ( not ( = ?auto_1028346 ?auto_1028350 ) ) ( not ( = ?auto_1028346 ?auto_1028352 ) ) ( not ( = ?auto_1028346 ?auto_1028353 ) ) ( not ( = ?auto_1028346 ?auto_1028354 ) ) ( not ( = ?auto_1028346 ?auto_1028355 ) ) ( not ( = ?auto_1028346 ?auto_1028356 ) ) ( not ( = ?auto_1028346 ?auto_1028357 ) ) ( not ( = ?auto_1028346 ?auto_1028358 ) ) ( not ( = ?auto_1028347 ?auto_1028348 ) ) ( not ( = ?auto_1028347 ?auto_1028345 ) ) ( not ( = ?auto_1028347 ?auto_1028349 ) ) ( not ( = ?auto_1028347 ?auto_1028351 ) ) ( not ( = ?auto_1028347 ?auto_1028350 ) ) ( not ( = ?auto_1028347 ?auto_1028352 ) ) ( not ( = ?auto_1028347 ?auto_1028353 ) ) ( not ( = ?auto_1028347 ?auto_1028354 ) ) ( not ( = ?auto_1028347 ?auto_1028355 ) ) ( not ( = ?auto_1028347 ?auto_1028356 ) ) ( not ( = ?auto_1028347 ?auto_1028357 ) ) ( not ( = ?auto_1028347 ?auto_1028358 ) ) ( not ( = ?auto_1028348 ?auto_1028345 ) ) ( not ( = ?auto_1028348 ?auto_1028349 ) ) ( not ( = ?auto_1028348 ?auto_1028351 ) ) ( not ( = ?auto_1028348 ?auto_1028350 ) ) ( not ( = ?auto_1028348 ?auto_1028352 ) ) ( not ( = ?auto_1028348 ?auto_1028353 ) ) ( not ( = ?auto_1028348 ?auto_1028354 ) ) ( not ( = ?auto_1028348 ?auto_1028355 ) ) ( not ( = ?auto_1028348 ?auto_1028356 ) ) ( not ( = ?auto_1028348 ?auto_1028357 ) ) ( not ( = ?auto_1028348 ?auto_1028358 ) ) ( not ( = ?auto_1028345 ?auto_1028349 ) ) ( not ( = ?auto_1028345 ?auto_1028351 ) ) ( not ( = ?auto_1028345 ?auto_1028350 ) ) ( not ( = ?auto_1028345 ?auto_1028352 ) ) ( not ( = ?auto_1028345 ?auto_1028353 ) ) ( not ( = ?auto_1028345 ?auto_1028354 ) ) ( not ( = ?auto_1028345 ?auto_1028355 ) ) ( not ( = ?auto_1028345 ?auto_1028356 ) ) ( not ( = ?auto_1028345 ?auto_1028357 ) ) ( not ( = ?auto_1028345 ?auto_1028358 ) ) ( not ( = ?auto_1028349 ?auto_1028351 ) ) ( not ( = ?auto_1028349 ?auto_1028350 ) ) ( not ( = ?auto_1028349 ?auto_1028352 ) ) ( not ( = ?auto_1028349 ?auto_1028353 ) ) ( not ( = ?auto_1028349 ?auto_1028354 ) ) ( not ( = ?auto_1028349 ?auto_1028355 ) ) ( not ( = ?auto_1028349 ?auto_1028356 ) ) ( not ( = ?auto_1028349 ?auto_1028357 ) ) ( not ( = ?auto_1028349 ?auto_1028358 ) ) ( not ( = ?auto_1028351 ?auto_1028350 ) ) ( not ( = ?auto_1028351 ?auto_1028352 ) ) ( not ( = ?auto_1028351 ?auto_1028353 ) ) ( not ( = ?auto_1028351 ?auto_1028354 ) ) ( not ( = ?auto_1028351 ?auto_1028355 ) ) ( not ( = ?auto_1028351 ?auto_1028356 ) ) ( not ( = ?auto_1028351 ?auto_1028357 ) ) ( not ( = ?auto_1028351 ?auto_1028358 ) ) ( not ( = ?auto_1028350 ?auto_1028352 ) ) ( not ( = ?auto_1028350 ?auto_1028353 ) ) ( not ( = ?auto_1028350 ?auto_1028354 ) ) ( not ( = ?auto_1028350 ?auto_1028355 ) ) ( not ( = ?auto_1028350 ?auto_1028356 ) ) ( not ( = ?auto_1028350 ?auto_1028357 ) ) ( not ( = ?auto_1028350 ?auto_1028358 ) ) ( not ( = ?auto_1028352 ?auto_1028353 ) ) ( not ( = ?auto_1028352 ?auto_1028354 ) ) ( not ( = ?auto_1028352 ?auto_1028355 ) ) ( not ( = ?auto_1028352 ?auto_1028356 ) ) ( not ( = ?auto_1028352 ?auto_1028357 ) ) ( not ( = ?auto_1028352 ?auto_1028358 ) ) ( not ( = ?auto_1028353 ?auto_1028354 ) ) ( not ( = ?auto_1028353 ?auto_1028355 ) ) ( not ( = ?auto_1028353 ?auto_1028356 ) ) ( not ( = ?auto_1028353 ?auto_1028357 ) ) ( not ( = ?auto_1028353 ?auto_1028358 ) ) ( not ( = ?auto_1028354 ?auto_1028355 ) ) ( not ( = ?auto_1028354 ?auto_1028356 ) ) ( not ( = ?auto_1028354 ?auto_1028357 ) ) ( not ( = ?auto_1028354 ?auto_1028358 ) ) ( not ( = ?auto_1028355 ?auto_1028356 ) ) ( not ( = ?auto_1028355 ?auto_1028357 ) ) ( not ( = ?auto_1028355 ?auto_1028358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028356 ?auto_1028357 ?auto_1028358 )
      ( MAKE-13CRATE-VERIFY ?auto_1028346 ?auto_1028347 ?auto_1028348 ?auto_1028345 ?auto_1028349 ?auto_1028351 ?auto_1028350 ?auto_1028352 ?auto_1028353 ?auto_1028354 ?auto_1028355 ?auto_1028356 ?auto_1028357 ?auto_1028358 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028515 - SURFACE
      ?auto_1028516 - SURFACE
      ?auto_1028517 - SURFACE
      ?auto_1028514 - SURFACE
      ?auto_1028518 - SURFACE
      ?auto_1028520 - SURFACE
      ?auto_1028519 - SURFACE
      ?auto_1028521 - SURFACE
      ?auto_1028522 - SURFACE
      ?auto_1028523 - SURFACE
      ?auto_1028524 - SURFACE
      ?auto_1028525 - SURFACE
      ?auto_1028526 - SURFACE
      ?auto_1028527 - SURFACE
    )
    :vars
    (
      ?auto_1028530 - HOIST
      ?auto_1028531 - PLACE
      ?auto_1028532 - TRUCK
      ?auto_1028528 - PLACE
      ?auto_1028529 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028530 ?auto_1028531 ) ( SURFACE-AT ?auto_1028526 ?auto_1028531 ) ( CLEAR ?auto_1028526 ) ( IS-CRATE ?auto_1028527 ) ( not ( = ?auto_1028526 ?auto_1028527 ) ) ( AVAILABLE ?auto_1028530 ) ( ON ?auto_1028526 ?auto_1028525 ) ( not ( = ?auto_1028525 ?auto_1028526 ) ) ( not ( = ?auto_1028525 ?auto_1028527 ) ) ( TRUCK-AT ?auto_1028532 ?auto_1028528 ) ( not ( = ?auto_1028528 ?auto_1028531 ) ) ( HOIST-AT ?auto_1028529 ?auto_1028528 ) ( LIFTING ?auto_1028529 ?auto_1028527 ) ( not ( = ?auto_1028530 ?auto_1028529 ) ) ( ON ?auto_1028516 ?auto_1028515 ) ( ON ?auto_1028517 ?auto_1028516 ) ( ON ?auto_1028514 ?auto_1028517 ) ( ON ?auto_1028518 ?auto_1028514 ) ( ON ?auto_1028520 ?auto_1028518 ) ( ON ?auto_1028519 ?auto_1028520 ) ( ON ?auto_1028521 ?auto_1028519 ) ( ON ?auto_1028522 ?auto_1028521 ) ( ON ?auto_1028523 ?auto_1028522 ) ( ON ?auto_1028524 ?auto_1028523 ) ( ON ?auto_1028525 ?auto_1028524 ) ( not ( = ?auto_1028515 ?auto_1028516 ) ) ( not ( = ?auto_1028515 ?auto_1028517 ) ) ( not ( = ?auto_1028515 ?auto_1028514 ) ) ( not ( = ?auto_1028515 ?auto_1028518 ) ) ( not ( = ?auto_1028515 ?auto_1028520 ) ) ( not ( = ?auto_1028515 ?auto_1028519 ) ) ( not ( = ?auto_1028515 ?auto_1028521 ) ) ( not ( = ?auto_1028515 ?auto_1028522 ) ) ( not ( = ?auto_1028515 ?auto_1028523 ) ) ( not ( = ?auto_1028515 ?auto_1028524 ) ) ( not ( = ?auto_1028515 ?auto_1028525 ) ) ( not ( = ?auto_1028515 ?auto_1028526 ) ) ( not ( = ?auto_1028515 ?auto_1028527 ) ) ( not ( = ?auto_1028516 ?auto_1028517 ) ) ( not ( = ?auto_1028516 ?auto_1028514 ) ) ( not ( = ?auto_1028516 ?auto_1028518 ) ) ( not ( = ?auto_1028516 ?auto_1028520 ) ) ( not ( = ?auto_1028516 ?auto_1028519 ) ) ( not ( = ?auto_1028516 ?auto_1028521 ) ) ( not ( = ?auto_1028516 ?auto_1028522 ) ) ( not ( = ?auto_1028516 ?auto_1028523 ) ) ( not ( = ?auto_1028516 ?auto_1028524 ) ) ( not ( = ?auto_1028516 ?auto_1028525 ) ) ( not ( = ?auto_1028516 ?auto_1028526 ) ) ( not ( = ?auto_1028516 ?auto_1028527 ) ) ( not ( = ?auto_1028517 ?auto_1028514 ) ) ( not ( = ?auto_1028517 ?auto_1028518 ) ) ( not ( = ?auto_1028517 ?auto_1028520 ) ) ( not ( = ?auto_1028517 ?auto_1028519 ) ) ( not ( = ?auto_1028517 ?auto_1028521 ) ) ( not ( = ?auto_1028517 ?auto_1028522 ) ) ( not ( = ?auto_1028517 ?auto_1028523 ) ) ( not ( = ?auto_1028517 ?auto_1028524 ) ) ( not ( = ?auto_1028517 ?auto_1028525 ) ) ( not ( = ?auto_1028517 ?auto_1028526 ) ) ( not ( = ?auto_1028517 ?auto_1028527 ) ) ( not ( = ?auto_1028514 ?auto_1028518 ) ) ( not ( = ?auto_1028514 ?auto_1028520 ) ) ( not ( = ?auto_1028514 ?auto_1028519 ) ) ( not ( = ?auto_1028514 ?auto_1028521 ) ) ( not ( = ?auto_1028514 ?auto_1028522 ) ) ( not ( = ?auto_1028514 ?auto_1028523 ) ) ( not ( = ?auto_1028514 ?auto_1028524 ) ) ( not ( = ?auto_1028514 ?auto_1028525 ) ) ( not ( = ?auto_1028514 ?auto_1028526 ) ) ( not ( = ?auto_1028514 ?auto_1028527 ) ) ( not ( = ?auto_1028518 ?auto_1028520 ) ) ( not ( = ?auto_1028518 ?auto_1028519 ) ) ( not ( = ?auto_1028518 ?auto_1028521 ) ) ( not ( = ?auto_1028518 ?auto_1028522 ) ) ( not ( = ?auto_1028518 ?auto_1028523 ) ) ( not ( = ?auto_1028518 ?auto_1028524 ) ) ( not ( = ?auto_1028518 ?auto_1028525 ) ) ( not ( = ?auto_1028518 ?auto_1028526 ) ) ( not ( = ?auto_1028518 ?auto_1028527 ) ) ( not ( = ?auto_1028520 ?auto_1028519 ) ) ( not ( = ?auto_1028520 ?auto_1028521 ) ) ( not ( = ?auto_1028520 ?auto_1028522 ) ) ( not ( = ?auto_1028520 ?auto_1028523 ) ) ( not ( = ?auto_1028520 ?auto_1028524 ) ) ( not ( = ?auto_1028520 ?auto_1028525 ) ) ( not ( = ?auto_1028520 ?auto_1028526 ) ) ( not ( = ?auto_1028520 ?auto_1028527 ) ) ( not ( = ?auto_1028519 ?auto_1028521 ) ) ( not ( = ?auto_1028519 ?auto_1028522 ) ) ( not ( = ?auto_1028519 ?auto_1028523 ) ) ( not ( = ?auto_1028519 ?auto_1028524 ) ) ( not ( = ?auto_1028519 ?auto_1028525 ) ) ( not ( = ?auto_1028519 ?auto_1028526 ) ) ( not ( = ?auto_1028519 ?auto_1028527 ) ) ( not ( = ?auto_1028521 ?auto_1028522 ) ) ( not ( = ?auto_1028521 ?auto_1028523 ) ) ( not ( = ?auto_1028521 ?auto_1028524 ) ) ( not ( = ?auto_1028521 ?auto_1028525 ) ) ( not ( = ?auto_1028521 ?auto_1028526 ) ) ( not ( = ?auto_1028521 ?auto_1028527 ) ) ( not ( = ?auto_1028522 ?auto_1028523 ) ) ( not ( = ?auto_1028522 ?auto_1028524 ) ) ( not ( = ?auto_1028522 ?auto_1028525 ) ) ( not ( = ?auto_1028522 ?auto_1028526 ) ) ( not ( = ?auto_1028522 ?auto_1028527 ) ) ( not ( = ?auto_1028523 ?auto_1028524 ) ) ( not ( = ?auto_1028523 ?auto_1028525 ) ) ( not ( = ?auto_1028523 ?auto_1028526 ) ) ( not ( = ?auto_1028523 ?auto_1028527 ) ) ( not ( = ?auto_1028524 ?auto_1028525 ) ) ( not ( = ?auto_1028524 ?auto_1028526 ) ) ( not ( = ?auto_1028524 ?auto_1028527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028525 ?auto_1028526 ?auto_1028527 )
      ( MAKE-13CRATE-VERIFY ?auto_1028515 ?auto_1028516 ?auto_1028517 ?auto_1028514 ?auto_1028518 ?auto_1028520 ?auto_1028519 ?auto_1028521 ?auto_1028522 ?auto_1028523 ?auto_1028524 ?auto_1028525 ?auto_1028526 ?auto_1028527 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028697 - SURFACE
      ?auto_1028698 - SURFACE
      ?auto_1028699 - SURFACE
      ?auto_1028696 - SURFACE
      ?auto_1028700 - SURFACE
      ?auto_1028702 - SURFACE
      ?auto_1028701 - SURFACE
      ?auto_1028703 - SURFACE
      ?auto_1028704 - SURFACE
      ?auto_1028705 - SURFACE
      ?auto_1028706 - SURFACE
      ?auto_1028707 - SURFACE
      ?auto_1028708 - SURFACE
      ?auto_1028709 - SURFACE
    )
    :vars
    (
      ?auto_1028714 - HOIST
      ?auto_1028713 - PLACE
      ?auto_1028712 - TRUCK
      ?auto_1028710 - PLACE
      ?auto_1028711 - HOIST
      ?auto_1028715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028714 ?auto_1028713 ) ( SURFACE-AT ?auto_1028708 ?auto_1028713 ) ( CLEAR ?auto_1028708 ) ( IS-CRATE ?auto_1028709 ) ( not ( = ?auto_1028708 ?auto_1028709 ) ) ( AVAILABLE ?auto_1028714 ) ( ON ?auto_1028708 ?auto_1028707 ) ( not ( = ?auto_1028707 ?auto_1028708 ) ) ( not ( = ?auto_1028707 ?auto_1028709 ) ) ( TRUCK-AT ?auto_1028712 ?auto_1028710 ) ( not ( = ?auto_1028710 ?auto_1028713 ) ) ( HOIST-AT ?auto_1028711 ?auto_1028710 ) ( not ( = ?auto_1028714 ?auto_1028711 ) ) ( AVAILABLE ?auto_1028711 ) ( SURFACE-AT ?auto_1028709 ?auto_1028710 ) ( ON ?auto_1028709 ?auto_1028715 ) ( CLEAR ?auto_1028709 ) ( not ( = ?auto_1028708 ?auto_1028715 ) ) ( not ( = ?auto_1028709 ?auto_1028715 ) ) ( not ( = ?auto_1028707 ?auto_1028715 ) ) ( ON ?auto_1028698 ?auto_1028697 ) ( ON ?auto_1028699 ?auto_1028698 ) ( ON ?auto_1028696 ?auto_1028699 ) ( ON ?auto_1028700 ?auto_1028696 ) ( ON ?auto_1028702 ?auto_1028700 ) ( ON ?auto_1028701 ?auto_1028702 ) ( ON ?auto_1028703 ?auto_1028701 ) ( ON ?auto_1028704 ?auto_1028703 ) ( ON ?auto_1028705 ?auto_1028704 ) ( ON ?auto_1028706 ?auto_1028705 ) ( ON ?auto_1028707 ?auto_1028706 ) ( not ( = ?auto_1028697 ?auto_1028698 ) ) ( not ( = ?auto_1028697 ?auto_1028699 ) ) ( not ( = ?auto_1028697 ?auto_1028696 ) ) ( not ( = ?auto_1028697 ?auto_1028700 ) ) ( not ( = ?auto_1028697 ?auto_1028702 ) ) ( not ( = ?auto_1028697 ?auto_1028701 ) ) ( not ( = ?auto_1028697 ?auto_1028703 ) ) ( not ( = ?auto_1028697 ?auto_1028704 ) ) ( not ( = ?auto_1028697 ?auto_1028705 ) ) ( not ( = ?auto_1028697 ?auto_1028706 ) ) ( not ( = ?auto_1028697 ?auto_1028707 ) ) ( not ( = ?auto_1028697 ?auto_1028708 ) ) ( not ( = ?auto_1028697 ?auto_1028709 ) ) ( not ( = ?auto_1028697 ?auto_1028715 ) ) ( not ( = ?auto_1028698 ?auto_1028699 ) ) ( not ( = ?auto_1028698 ?auto_1028696 ) ) ( not ( = ?auto_1028698 ?auto_1028700 ) ) ( not ( = ?auto_1028698 ?auto_1028702 ) ) ( not ( = ?auto_1028698 ?auto_1028701 ) ) ( not ( = ?auto_1028698 ?auto_1028703 ) ) ( not ( = ?auto_1028698 ?auto_1028704 ) ) ( not ( = ?auto_1028698 ?auto_1028705 ) ) ( not ( = ?auto_1028698 ?auto_1028706 ) ) ( not ( = ?auto_1028698 ?auto_1028707 ) ) ( not ( = ?auto_1028698 ?auto_1028708 ) ) ( not ( = ?auto_1028698 ?auto_1028709 ) ) ( not ( = ?auto_1028698 ?auto_1028715 ) ) ( not ( = ?auto_1028699 ?auto_1028696 ) ) ( not ( = ?auto_1028699 ?auto_1028700 ) ) ( not ( = ?auto_1028699 ?auto_1028702 ) ) ( not ( = ?auto_1028699 ?auto_1028701 ) ) ( not ( = ?auto_1028699 ?auto_1028703 ) ) ( not ( = ?auto_1028699 ?auto_1028704 ) ) ( not ( = ?auto_1028699 ?auto_1028705 ) ) ( not ( = ?auto_1028699 ?auto_1028706 ) ) ( not ( = ?auto_1028699 ?auto_1028707 ) ) ( not ( = ?auto_1028699 ?auto_1028708 ) ) ( not ( = ?auto_1028699 ?auto_1028709 ) ) ( not ( = ?auto_1028699 ?auto_1028715 ) ) ( not ( = ?auto_1028696 ?auto_1028700 ) ) ( not ( = ?auto_1028696 ?auto_1028702 ) ) ( not ( = ?auto_1028696 ?auto_1028701 ) ) ( not ( = ?auto_1028696 ?auto_1028703 ) ) ( not ( = ?auto_1028696 ?auto_1028704 ) ) ( not ( = ?auto_1028696 ?auto_1028705 ) ) ( not ( = ?auto_1028696 ?auto_1028706 ) ) ( not ( = ?auto_1028696 ?auto_1028707 ) ) ( not ( = ?auto_1028696 ?auto_1028708 ) ) ( not ( = ?auto_1028696 ?auto_1028709 ) ) ( not ( = ?auto_1028696 ?auto_1028715 ) ) ( not ( = ?auto_1028700 ?auto_1028702 ) ) ( not ( = ?auto_1028700 ?auto_1028701 ) ) ( not ( = ?auto_1028700 ?auto_1028703 ) ) ( not ( = ?auto_1028700 ?auto_1028704 ) ) ( not ( = ?auto_1028700 ?auto_1028705 ) ) ( not ( = ?auto_1028700 ?auto_1028706 ) ) ( not ( = ?auto_1028700 ?auto_1028707 ) ) ( not ( = ?auto_1028700 ?auto_1028708 ) ) ( not ( = ?auto_1028700 ?auto_1028709 ) ) ( not ( = ?auto_1028700 ?auto_1028715 ) ) ( not ( = ?auto_1028702 ?auto_1028701 ) ) ( not ( = ?auto_1028702 ?auto_1028703 ) ) ( not ( = ?auto_1028702 ?auto_1028704 ) ) ( not ( = ?auto_1028702 ?auto_1028705 ) ) ( not ( = ?auto_1028702 ?auto_1028706 ) ) ( not ( = ?auto_1028702 ?auto_1028707 ) ) ( not ( = ?auto_1028702 ?auto_1028708 ) ) ( not ( = ?auto_1028702 ?auto_1028709 ) ) ( not ( = ?auto_1028702 ?auto_1028715 ) ) ( not ( = ?auto_1028701 ?auto_1028703 ) ) ( not ( = ?auto_1028701 ?auto_1028704 ) ) ( not ( = ?auto_1028701 ?auto_1028705 ) ) ( not ( = ?auto_1028701 ?auto_1028706 ) ) ( not ( = ?auto_1028701 ?auto_1028707 ) ) ( not ( = ?auto_1028701 ?auto_1028708 ) ) ( not ( = ?auto_1028701 ?auto_1028709 ) ) ( not ( = ?auto_1028701 ?auto_1028715 ) ) ( not ( = ?auto_1028703 ?auto_1028704 ) ) ( not ( = ?auto_1028703 ?auto_1028705 ) ) ( not ( = ?auto_1028703 ?auto_1028706 ) ) ( not ( = ?auto_1028703 ?auto_1028707 ) ) ( not ( = ?auto_1028703 ?auto_1028708 ) ) ( not ( = ?auto_1028703 ?auto_1028709 ) ) ( not ( = ?auto_1028703 ?auto_1028715 ) ) ( not ( = ?auto_1028704 ?auto_1028705 ) ) ( not ( = ?auto_1028704 ?auto_1028706 ) ) ( not ( = ?auto_1028704 ?auto_1028707 ) ) ( not ( = ?auto_1028704 ?auto_1028708 ) ) ( not ( = ?auto_1028704 ?auto_1028709 ) ) ( not ( = ?auto_1028704 ?auto_1028715 ) ) ( not ( = ?auto_1028705 ?auto_1028706 ) ) ( not ( = ?auto_1028705 ?auto_1028707 ) ) ( not ( = ?auto_1028705 ?auto_1028708 ) ) ( not ( = ?auto_1028705 ?auto_1028709 ) ) ( not ( = ?auto_1028705 ?auto_1028715 ) ) ( not ( = ?auto_1028706 ?auto_1028707 ) ) ( not ( = ?auto_1028706 ?auto_1028708 ) ) ( not ( = ?auto_1028706 ?auto_1028709 ) ) ( not ( = ?auto_1028706 ?auto_1028715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028707 ?auto_1028708 ?auto_1028709 )
      ( MAKE-13CRATE-VERIFY ?auto_1028697 ?auto_1028698 ?auto_1028699 ?auto_1028696 ?auto_1028700 ?auto_1028702 ?auto_1028701 ?auto_1028703 ?auto_1028704 ?auto_1028705 ?auto_1028706 ?auto_1028707 ?auto_1028708 ?auto_1028709 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028880 - SURFACE
      ?auto_1028881 - SURFACE
      ?auto_1028882 - SURFACE
      ?auto_1028879 - SURFACE
      ?auto_1028883 - SURFACE
      ?auto_1028885 - SURFACE
      ?auto_1028884 - SURFACE
      ?auto_1028886 - SURFACE
      ?auto_1028887 - SURFACE
      ?auto_1028888 - SURFACE
      ?auto_1028889 - SURFACE
      ?auto_1028890 - SURFACE
      ?auto_1028891 - SURFACE
      ?auto_1028892 - SURFACE
    )
    :vars
    (
      ?auto_1028894 - HOIST
      ?auto_1028897 - PLACE
      ?auto_1028893 - PLACE
      ?auto_1028898 - HOIST
      ?auto_1028896 - SURFACE
      ?auto_1028895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028894 ?auto_1028897 ) ( SURFACE-AT ?auto_1028891 ?auto_1028897 ) ( CLEAR ?auto_1028891 ) ( IS-CRATE ?auto_1028892 ) ( not ( = ?auto_1028891 ?auto_1028892 ) ) ( AVAILABLE ?auto_1028894 ) ( ON ?auto_1028891 ?auto_1028890 ) ( not ( = ?auto_1028890 ?auto_1028891 ) ) ( not ( = ?auto_1028890 ?auto_1028892 ) ) ( not ( = ?auto_1028893 ?auto_1028897 ) ) ( HOIST-AT ?auto_1028898 ?auto_1028893 ) ( not ( = ?auto_1028894 ?auto_1028898 ) ) ( AVAILABLE ?auto_1028898 ) ( SURFACE-AT ?auto_1028892 ?auto_1028893 ) ( ON ?auto_1028892 ?auto_1028896 ) ( CLEAR ?auto_1028892 ) ( not ( = ?auto_1028891 ?auto_1028896 ) ) ( not ( = ?auto_1028892 ?auto_1028896 ) ) ( not ( = ?auto_1028890 ?auto_1028896 ) ) ( TRUCK-AT ?auto_1028895 ?auto_1028897 ) ( ON ?auto_1028881 ?auto_1028880 ) ( ON ?auto_1028882 ?auto_1028881 ) ( ON ?auto_1028879 ?auto_1028882 ) ( ON ?auto_1028883 ?auto_1028879 ) ( ON ?auto_1028885 ?auto_1028883 ) ( ON ?auto_1028884 ?auto_1028885 ) ( ON ?auto_1028886 ?auto_1028884 ) ( ON ?auto_1028887 ?auto_1028886 ) ( ON ?auto_1028888 ?auto_1028887 ) ( ON ?auto_1028889 ?auto_1028888 ) ( ON ?auto_1028890 ?auto_1028889 ) ( not ( = ?auto_1028880 ?auto_1028881 ) ) ( not ( = ?auto_1028880 ?auto_1028882 ) ) ( not ( = ?auto_1028880 ?auto_1028879 ) ) ( not ( = ?auto_1028880 ?auto_1028883 ) ) ( not ( = ?auto_1028880 ?auto_1028885 ) ) ( not ( = ?auto_1028880 ?auto_1028884 ) ) ( not ( = ?auto_1028880 ?auto_1028886 ) ) ( not ( = ?auto_1028880 ?auto_1028887 ) ) ( not ( = ?auto_1028880 ?auto_1028888 ) ) ( not ( = ?auto_1028880 ?auto_1028889 ) ) ( not ( = ?auto_1028880 ?auto_1028890 ) ) ( not ( = ?auto_1028880 ?auto_1028891 ) ) ( not ( = ?auto_1028880 ?auto_1028892 ) ) ( not ( = ?auto_1028880 ?auto_1028896 ) ) ( not ( = ?auto_1028881 ?auto_1028882 ) ) ( not ( = ?auto_1028881 ?auto_1028879 ) ) ( not ( = ?auto_1028881 ?auto_1028883 ) ) ( not ( = ?auto_1028881 ?auto_1028885 ) ) ( not ( = ?auto_1028881 ?auto_1028884 ) ) ( not ( = ?auto_1028881 ?auto_1028886 ) ) ( not ( = ?auto_1028881 ?auto_1028887 ) ) ( not ( = ?auto_1028881 ?auto_1028888 ) ) ( not ( = ?auto_1028881 ?auto_1028889 ) ) ( not ( = ?auto_1028881 ?auto_1028890 ) ) ( not ( = ?auto_1028881 ?auto_1028891 ) ) ( not ( = ?auto_1028881 ?auto_1028892 ) ) ( not ( = ?auto_1028881 ?auto_1028896 ) ) ( not ( = ?auto_1028882 ?auto_1028879 ) ) ( not ( = ?auto_1028882 ?auto_1028883 ) ) ( not ( = ?auto_1028882 ?auto_1028885 ) ) ( not ( = ?auto_1028882 ?auto_1028884 ) ) ( not ( = ?auto_1028882 ?auto_1028886 ) ) ( not ( = ?auto_1028882 ?auto_1028887 ) ) ( not ( = ?auto_1028882 ?auto_1028888 ) ) ( not ( = ?auto_1028882 ?auto_1028889 ) ) ( not ( = ?auto_1028882 ?auto_1028890 ) ) ( not ( = ?auto_1028882 ?auto_1028891 ) ) ( not ( = ?auto_1028882 ?auto_1028892 ) ) ( not ( = ?auto_1028882 ?auto_1028896 ) ) ( not ( = ?auto_1028879 ?auto_1028883 ) ) ( not ( = ?auto_1028879 ?auto_1028885 ) ) ( not ( = ?auto_1028879 ?auto_1028884 ) ) ( not ( = ?auto_1028879 ?auto_1028886 ) ) ( not ( = ?auto_1028879 ?auto_1028887 ) ) ( not ( = ?auto_1028879 ?auto_1028888 ) ) ( not ( = ?auto_1028879 ?auto_1028889 ) ) ( not ( = ?auto_1028879 ?auto_1028890 ) ) ( not ( = ?auto_1028879 ?auto_1028891 ) ) ( not ( = ?auto_1028879 ?auto_1028892 ) ) ( not ( = ?auto_1028879 ?auto_1028896 ) ) ( not ( = ?auto_1028883 ?auto_1028885 ) ) ( not ( = ?auto_1028883 ?auto_1028884 ) ) ( not ( = ?auto_1028883 ?auto_1028886 ) ) ( not ( = ?auto_1028883 ?auto_1028887 ) ) ( not ( = ?auto_1028883 ?auto_1028888 ) ) ( not ( = ?auto_1028883 ?auto_1028889 ) ) ( not ( = ?auto_1028883 ?auto_1028890 ) ) ( not ( = ?auto_1028883 ?auto_1028891 ) ) ( not ( = ?auto_1028883 ?auto_1028892 ) ) ( not ( = ?auto_1028883 ?auto_1028896 ) ) ( not ( = ?auto_1028885 ?auto_1028884 ) ) ( not ( = ?auto_1028885 ?auto_1028886 ) ) ( not ( = ?auto_1028885 ?auto_1028887 ) ) ( not ( = ?auto_1028885 ?auto_1028888 ) ) ( not ( = ?auto_1028885 ?auto_1028889 ) ) ( not ( = ?auto_1028885 ?auto_1028890 ) ) ( not ( = ?auto_1028885 ?auto_1028891 ) ) ( not ( = ?auto_1028885 ?auto_1028892 ) ) ( not ( = ?auto_1028885 ?auto_1028896 ) ) ( not ( = ?auto_1028884 ?auto_1028886 ) ) ( not ( = ?auto_1028884 ?auto_1028887 ) ) ( not ( = ?auto_1028884 ?auto_1028888 ) ) ( not ( = ?auto_1028884 ?auto_1028889 ) ) ( not ( = ?auto_1028884 ?auto_1028890 ) ) ( not ( = ?auto_1028884 ?auto_1028891 ) ) ( not ( = ?auto_1028884 ?auto_1028892 ) ) ( not ( = ?auto_1028884 ?auto_1028896 ) ) ( not ( = ?auto_1028886 ?auto_1028887 ) ) ( not ( = ?auto_1028886 ?auto_1028888 ) ) ( not ( = ?auto_1028886 ?auto_1028889 ) ) ( not ( = ?auto_1028886 ?auto_1028890 ) ) ( not ( = ?auto_1028886 ?auto_1028891 ) ) ( not ( = ?auto_1028886 ?auto_1028892 ) ) ( not ( = ?auto_1028886 ?auto_1028896 ) ) ( not ( = ?auto_1028887 ?auto_1028888 ) ) ( not ( = ?auto_1028887 ?auto_1028889 ) ) ( not ( = ?auto_1028887 ?auto_1028890 ) ) ( not ( = ?auto_1028887 ?auto_1028891 ) ) ( not ( = ?auto_1028887 ?auto_1028892 ) ) ( not ( = ?auto_1028887 ?auto_1028896 ) ) ( not ( = ?auto_1028888 ?auto_1028889 ) ) ( not ( = ?auto_1028888 ?auto_1028890 ) ) ( not ( = ?auto_1028888 ?auto_1028891 ) ) ( not ( = ?auto_1028888 ?auto_1028892 ) ) ( not ( = ?auto_1028888 ?auto_1028896 ) ) ( not ( = ?auto_1028889 ?auto_1028890 ) ) ( not ( = ?auto_1028889 ?auto_1028891 ) ) ( not ( = ?auto_1028889 ?auto_1028892 ) ) ( not ( = ?auto_1028889 ?auto_1028896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028890 ?auto_1028891 ?auto_1028892 )
      ( MAKE-13CRATE-VERIFY ?auto_1028880 ?auto_1028881 ?auto_1028882 ?auto_1028879 ?auto_1028883 ?auto_1028885 ?auto_1028884 ?auto_1028886 ?auto_1028887 ?auto_1028888 ?auto_1028889 ?auto_1028890 ?auto_1028891 ?auto_1028892 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1029063 - SURFACE
      ?auto_1029064 - SURFACE
      ?auto_1029065 - SURFACE
      ?auto_1029062 - SURFACE
      ?auto_1029066 - SURFACE
      ?auto_1029068 - SURFACE
      ?auto_1029067 - SURFACE
      ?auto_1029069 - SURFACE
      ?auto_1029070 - SURFACE
      ?auto_1029071 - SURFACE
      ?auto_1029072 - SURFACE
      ?auto_1029073 - SURFACE
      ?auto_1029074 - SURFACE
      ?auto_1029075 - SURFACE
    )
    :vars
    (
      ?auto_1029080 - HOIST
      ?auto_1029077 - PLACE
      ?auto_1029081 - PLACE
      ?auto_1029078 - HOIST
      ?auto_1029079 - SURFACE
      ?auto_1029076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1029080 ?auto_1029077 ) ( IS-CRATE ?auto_1029075 ) ( not ( = ?auto_1029074 ?auto_1029075 ) ) ( not ( = ?auto_1029073 ?auto_1029074 ) ) ( not ( = ?auto_1029073 ?auto_1029075 ) ) ( not ( = ?auto_1029081 ?auto_1029077 ) ) ( HOIST-AT ?auto_1029078 ?auto_1029081 ) ( not ( = ?auto_1029080 ?auto_1029078 ) ) ( AVAILABLE ?auto_1029078 ) ( SURFACE-AT ?auto_1029075 ?auto_1029081 ) ( ON ?auto_1029075 ?auto_1029079 ) ( CLEAR ?auto_1029075 ) ( not ( = ?auto_1029074 ?auto_1029079 ) ) ( not ( = ?auto_1029075 ?auto_1029079 ) ) ( not ( = ?auto_1029073 ?auto_1029079 ) ) ( TRUCK-AT ?auto_1029076 ?auto_1029077 ) ( SURFACE-AT ?auto_1029073 ?auto_1029077 ) ( CLEAR ?auto_1029073 ) ( LIFTING ?auto_1029080 ?auto_1029074 ) ( IS-CRATE ?auto_1029074 ) ( ON ?auto_1029064 ?auto_1029063 ) ( ON ?auto_1029065 ?auto_1029064 ) ( ON ?auto_1029062 ?auto_1029065 ) ( ON ?auto_1029066 ?auto_1029062 ) ( ON ?auto_1029068 ?auto_1029066 ) ( ON ?auto_1029067 ?auto_1029068 ) ( ON ?auto_1029069 ?auto_1029067 ) ( ON ?auto_1029070 ?auto_1029069 ) ( ON ?auto_1029071 ?auto_1029070 ) ( ON ?auto_1029072 ?auto_1029071 ) ( ON ?auto_1029073 ?auto_1029072 ) ( not ( = ?auto_1029063 ?auto_1029064 ) ) ( not ( = ?auto_1029063 ?auto_1029065 ) ) ( not ( = ?auto_1029063 ?auto_1029062 ) ) ( not ( = ?auto_1029063 ?auto_1029066 ) ) ( not ( = ?auto_1029063 ?auto_1029068 ) ) ( not ( = ?auto_1029063 ?auto_1029067 ) ) ( not ( = ?auto_1029063 ?auto_1029069 ) ) ( not ( = ?auto_1029063 ?auto_1029070 ) ) ( not ( = ?auto_1029063 ?auto_1029071 ) ) ( not ( = ?auto_1029063 ?auto_1029072 ) ) ( not ( = ?auto_1029063 ?auto_1029073 ) ) ( not ( = ?auto_1029063 ?auto_1029074 ) ) ( not ( = ?auto_1029063 ?auto_1029075 ) ) ( not ( = ?auto_1029063 ?auto_1029079 ) ) ( not ( = ?auto_1029064 ?auto_1029065 ) ) ( not ( = ?auto_1029064 ?auto_1029062 ) ) ( not ( = ?auto_1029064 ?auto_1029066 ) ) ( not ( = ?auto_1029064 ?auto_1029068 ) ) ( not ( = ?auto_1029064 ?auto_1029067 ) ) ( not ( = ?auto_1029064 ?auto_1029069 ) ) ( not ( = ?auto_1029064 ?auto_1029070 ) ) ( not ( = ?auto_1029064 ?auto_1029071 ) ) ( not ( = ?auto_1029064 ?auto_1029072 ) ) ( not ( = ?auto_1029064 ?auto_1029073 ) ) ( not ( = ?auto_1029064 ?auto_1029074 ) ) ( not ( = ?auto_1029064 ?auto_1029075 ) ) ( not ( = ?auto_1029064 ?auto_1029079 ) ) ( not ( = ?auto_1029065 ?auto_1029062 ) ) ( not ( = ?auto_1029065 ?auto_1029066 ) ) ( not ( = ?auto_1029065 ?auto_1029068 ) ) ( not ( = ?auto_1029065 ?auto_1029067 ) ) ( not ( = ?auto_1029065 ?auto_1029069 ) ) ( not ( = ?auto_1029065 ?auto_1029070 ) ) ( not ( = ?auto_1029065 ?auto_1029071 ) ) ( not ( = ?auto_1029065 ?auto_1029072 ) ) ( not ( = ?auto_1029065 ?auto_1029073 ) ) ( not ( = ?auto_1029065 ?auto_1029074 ) ) ( not ( = ?auto_1029065 ?auto_1029075 ) ) ( not ( = ?auto_1029065 ?auto_1029079 ) ) ( not ( = ?auto_1029062 ?auto_1029066 ) ) ( not ( = ?auto_1029062 ?auto_1029068 ) ) ( not ( = ?auto_1029062 ?auto_1029067 ) ) ( not ( = ?auto_1029062 ?auto_1029069 ) ) ( not ( = ?auto_1029062 ?auto_1029070 ) ) ( not ( = ?auto_1029062 ?auto_1029071 ) ) ( not ( = ?auto_1029062 ?auto_1029072 ) ) ( not ( = ?auto_1029062 ?auto_1029073 ) ) ( not ( = ?auto_1029062 ?auto_1029074 ) ) ( not ( = ?auto_1029062 ?auto_1029075 ) ) ( not ( = ?auto_1029062 ?auto_1029079 ) ) ( not ( = ?auto_1029066 ?auto_1029068 ) ) ( not ( = ?auto_1029066 ?auto_1029067 ) ) ( not ( = ?auto_1029066 ?auto_1029069 ) ) ( not ( = ?auto_1029066 ?auto_1029070 ) ) ( not ( = ?auto_1029066 ?auto_1029071 ) ) ( not ( = ?auto_1029066 ?auto_1029072 ) ) ( not ( = ?auto_1029066 ?auto_1029073 ) ) ( not ( = ?auto_1029066 ?auto_1029074 ) ) ( not ( = ?auto_1029066 ?auto_1029075 ) ) ( not ( = ?auto_1029066 ?auto_1029079 ) ) ( not ( = ?auto_1029068 ?auto_1029067 ) ) ( not ( = ?auto_1029068 ?auto_1029069 ) ) ( not ( = ?auto_1029068 ?auto_1029070 ) ) ( not ( = ?auto_1029068 ?auto_1029071 ) ) ( not ( = ?auto_1029068 ?auto_1029072 ) ) ( not ( = ?auto_1029068 ?auto_1029073 ) ) ( not ( = ?auto_1029068 ?auto_1029074 ) ) ( not ( = ?auto_1029068 ?auto_1029075 ) ) ( not ( = ?auto_1029068 ?auto_1029079 ) ) ( not ( = ?auto_1029067 ?auto_1029069 ) ) ( not ( = ?auto_1029067 ?auto_1029070 ) ) ( not ( = ?auto_1029067 ?auto_1029071 ) ) ( not ( = ?auto_1029067 ?auto_1029072 ) ) ( not ( = ?auto_1029067 ?auto_1029073 ) ) ( not ( = ?auto_1029067 ?auto_1029074 ) ) ( not ( = ?auto_1029067 ?auto_1029075 ) ) ( not ( = ?auto_1029067 ?auto_1029079 ) ) ( not ( = ?auto_1029069 ?auto_1029070 ) ) ( not ( = ?auto_1029069 ?auto_1029071 ) ) ( not ( = ?auto_1029069 ?auto_1029072 ) ) ( not ( = ?auto_1029069 ?auto_1029073 ) ) ( not ( = ?auto_1029069 ?auto_1029074 ) ) ( not ( = ?auto_1029069 ?auto_1029075 ) ) ( not ( = ?auto_1029069 ?auto_1029079 ) ) ( not ( = ?auto_1029070 ?auto_1029071 ) ) ( not ( = ?auto_1029070 ?auto_1029072 ) ) ( not ( = ?auto_1029070 ?auto_1029073 ) ) ( not ( = ?auto_1029070 ?auto_1029074 ) ) ( not ( = ?auto_1029070 ?auto_1029075 ) ) ( not ( = ?auto_1029070 ?auto_1029079 ) ) ( not ( = ?auto_1029071 ?auto_1029072 ) ) ( not ( = ?auto_1029071 ?auto_1029073 ) ) ( not ( = ?auto_1029071 ?auto_1029074 ) ) ( not ( = ?auto_1029071 ?auto_1029075 ) ) ( not ( = ?auto_1029071 ?auto_1029079 ) ) ( not ( = ?auto_1029072 ?auto_1029073 ) ) ( not ( = ?auto_1029072 ?auto_1029074 ) ) ( not ( = ?auto_1029072 ?auto_1029075 ) ) ( not ( = ?auto_1029072 ?auto_1029079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1029073 ?auto_1029074 ?auto_1029075 )
      ( MAKE-13CRATE-VERIFY ?auto_1029063 ?auto_1029064 ?auto_1029065 ?auto_1029062 ?auto_1029066 ?auto_1029068 ?auto_1029067 ?auto_1029069 ?auto_1029070 ?auto_1029071 ?auto_1029072 ?auto_1029073 ?auto_1029074 ?auto_1029075 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1029246 - SURFACE
      ?auto_1029247 - SURFACE
      ?auto_1029248 - SURFACE
      ?auto_1029245 - SURFACE
      ?auto_1029249 - SURFACE
      ?auto_1029251 - SURFACE
      ?auto_1029250 - SURFACE
      ?auto_1029252 - SURFACE
      ?auto_1029253 - SURFACE
      ?auto_1029254 - SURFACE
      ?auto_1029255 - SURFACE
      ?auto_1029256 - SURFACE
      ?auto_1029257 - SURFACE
      ?auto_1029258 - SURFACE
    )
    :vars
    (
      ?auto_1029263 - HOIST
      ?auto_1029259 - PLACE
      ?auto_1029262 - PLACE
      ?auto_1029260 - HOIST
      ?auto_1029264 - SURFACE
      ?auto_1029261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1029263 ?auto_1029259 ) ( IS-CRATE ?auto_1029258 ) ( not ( = ?auto_1029257 ?auto_1029258 ) ) ( not ( = ?auto_1029256 ?auto_1029257 ) ) ( not ( = ?auto_1029256 ?auto_1029258 ) ) ( not ( = ?auto_1029262 ?auto_1029259 ) ) ( HOIST-AT ?auto_1029260 ?auto_1029262 ) ( not ( = ?auto_1029263 ?auto_1029260 ) ) ( AVAILABLE ?auto_1029260 ) ( SURFACE-AT ?auto_1029258 ?auto_1029262 ) ( ON ?auto_1029258 ?auto_1029264 ) ( CLEAR ?auto_1029258 ) ( not ( = ?auto_1029257 ?auto_1029264 ) ) ( not ( = ?auto_1029258 ?auto_1029264 ) ) ( not ( = ?auto_1029256 ?auto_1029264 ) ) ( TRUCK-AT ?auto_1029261 ?auto_1029259 ) ( SURFACE-AT ?auto_1029256 ?auto_1029259 ) ( CLEAR ?auto_1029256 ) ( IS-CRATE ?auto_1029257 ) ( AVAILABLE ?auto_1029263 ) ( IN ?auto_1029257 ?auto_1029261 ) ( ON ?auto_1029247 ?auto_1029246 ) ( ON ?auto_1029248 ?auto_1029247 ) ( ON ?auto_1029245 ?auto_1029248 ) ( ON ?auto_1029249 ?auto_1029245 ) ( ON ?auto_1029251 ?auto_1029249 ) ( ON ?auto_1029250 ?auto_1029251 ) ( ON ?auto_1029252 ?auto_1029250 ) ( ON ?auto_1029253 ?auto_1029252 ) ( ON ?auto_1029254 ?auto_1029253 ) ( ON ?auto_1029255 ?auto_1029254 ) ( ON ?auto_1029256 ?auto_1029255 ) ( not ( = ?auto_1029246 ?auto_1029247 ) ) ( not ( = ?auto_1029246 ?auto_1029248 ) ) ( not ( = ?auto_1029246 ?auto_1029245 ) ) ( not ( = ?auto_1029246 ?auto_1029249 ) ) ( not ( = ?auto_1029246 ?auto_1029251 ) ) ( not ( = ?auto_1029246 ?auto_1029250 ) ) ( not ( = ?auto_1029246 ?auto_1029252 ) ) ( not ( = ?auto_1029246 ?auto_1029253 ) ) ( not ( = ?auto_1029246 ?auto_1029254 ) ) ( not ( = ?auto_1029246 ?auto_1029255 ) ) ( not ( = ?auto_1029246 ?auto_1029256 ) ) ( not ( = ?auto_1029246 ?auto_1029257 ) ) ( not ( = ?auto_1029246 ?auto_1029258 ) ) ( not ( = ?auto_1029246 ?auto_1029264 ) ) ( not ( = ?auto_1029247 ?auto_1029248 ) ) ( not ( = ?auto_1029247 ?auto_1029245 ) ) ( not ( = ?auto_1029247 ?auto_1029249 ) ) ( not ( = ?auto_1029247 ?auto_1029251 ) ) ( not ( = ?auto_1029247 ?auto_1029250 ) ) ( not ( = ?auto_1029247 ?auto_1029252 ) ) ( not ( = ?auto_1029247 ?auto_1029253 ) ) ( not ( = ?auto_1029247 ?auto_1029254 ) ) ( not ( = ?auto_1029247 ?auto_1029255 ) ) ( not ( = ?auto_1029247 ?auto_1029256 ) ) ( not ( = ?auto_1029247 ?auto_1029257 ) ) ( not ( = ?auto_1029247 ?auto_1029258 ) ) ( not ( = ?auto_1029247 ?auto_1029264 ) ) ( not ( = ?auto_1029248 ?auto_1029245 ) ) ( not ( = ?auto_1029248 ?auto_1029249 ) ) ( not ( = ?auto_1029248 ?auto_1029251 ) ) ( not ( = ?auto_1029248 ?auto_1029250 ) ) ( not ( = ?auto_1029248 ?auto_1029252 ) ) ( not ( = ?auto_1029248 ?auto_1029253 ) ) ( not ( = ?auto_1029248 ?auto_1029254 ) ) ( not ( = ?auto_1029248 ?auto_1029255 ) ) ( not ( = ?auto_1029248 ?auto_1029256 ) ) ( not ( = ?auto_1029248 ?auto_1029257 ) ) ( not ( = ?auto_1029248 ?auto_1029258 ) ) ( not ( = ?auto_1029248 ?auto_1029264 ) ) ( not ( = ?auto_1029245 ?auto_1029249 ) ) ( not ( = ?auto_1029245 ?auto_1029251 ) ) ( not ( = ?auto_1029245 ?auto_1029250 ) ) ( not ( = ?auto_1029245 ?auto_1029252 ) ) ( not ( = ?auto_1029245 ?auto_1029253 ) ) ( not ( = ?auto_1029245 ?auto_1029254 ) ) ( not ( = ?auto_1029245 ?auto_1029255 ) ) ( not ( = ?auto_1029245 ?auto_1029256 ) ) ( not ( = ?auto_1029245 ?auto_1029257 ) ) ( not ( = ?auto_1029245 ?auto_1029258 ) ) ( not ( = ?auto_1029245 ?auto_1029264 ) ) ( not ( = ?auto_1029249 ?auto_1029251 ) ) ( not ( = ?auto_1029249 ?auto_1029250 ) ) ( not ( = ?auto_1029249 ?auto_1029252 ) ) ( not ( = ?auto_1029249 ?auto_1029253 ) ) ( not ( = ?auto_1029249 ?auto_1029254 ) ) ( not ( = ?auto_1029249 ?auto_1029255 ) ) ( not ( = ?auto_1029249 ?auto_1029256 ) ) ( not ( = ?auto_1029249 ?auto_1029257 ) ) ( not ( = ?auto_1029249 ?auto_1029258 ) ) ( not ( = ?auto_1029249 ?auto_1029264 ) ) ( not ( = ?auto_1029251 ?auto_1029250 ) ) ( not ( = ?auto_1029251 ?auto_1029252 ) ) ( not ( = ?auto_1029251 ?auto_1029253 ) ) ( not ( = ?auto_1029251 ?auto_1029254 ) ) ( not ( = ?auto_1029251 ?auto_1029255 ) ) ( not ( = ?auto_1029251 ?auto_1029256 ) ) ( not ( = ?auto_1029251 ?auto_1029257 ) ) ( not ( = ?auto_1029251 ?auto_1029258 ) ) ( not ( = ?auto_1029251 ?auto_1029264 ) ) ( not ( = ?auto_1029250 ?auto_1029252 ) ) ( not ( = ?auto_1029250 ?auto_1029253 ) ) ( not ( = ?auto_1029250 ?auto_1029254 ) ) ( not ( = ?auto_1029250 ?auto_1029255 ) ) ( not ( = ?auto_1029250 ?auto_1029256 ) ) ( not ( = ?auto_1029250 ?auto_1029257 ) ) ( not ( = ?auto_1029250 ?auto_1029258 ) ) ( not ( = ?auto_1029250 ?auto_1029264 ) ) ( not ( = ?auto_1029252 ?auto_1029253 ) ) ( not ( = ?auto_1029252 ?auto_1029254 ) ) ( not ( = ?auto_1029252 ?auto_1029255 ) ) ( not ( = ?auto_1029252 ?auto_1029256 ) ) ( not ( = ?auto_1029252 ?auto_1029257 ) ) ( not ( = ?auto_1029252 ?auto_1029258 ) ) ( not ( = ?auto_1029252 ?auto_1029264 ) ) ( not ( = ?auto_1029253 ?auto_1029254 ) ) ( not ( = ?auto_1029253 ?auto_1029255 ) ) ( not ( = ?auto_1029253 ?auto_1029256 ) ) ( not ( = ?auto_1029253 ?auto_1029257 ) ) ( not ( = ?auto_1029253 ?auto_1029258 ) ) ( not ( = ?auto_1029253 ?auto_1029264 ) ) ( not ( = ?auto_1029254 ?auto_1029255 ) ) ( not ( = ?auto_1029254 ?auto_1029256 ) ) ( not ( = ?auto_1029254 ?auto_1029257 ) ) ( not ( = ?auto_1029254 ?auto_1029258 ) ) ( not ( = ?auto_1029254 ?auto_1029264 ) ) ( not ( = ?auto_1029255 ?auto_1029256 ) ) ( not ( = ?auto_1029255 ?auto_1029257 ) ) ( not ( = ?auto_1029255 ?auto_1029258 ) ) ( not ( = ?auto_1029255 ?auto_1029264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1029256 ?auto_1029257 ?auto_1029258 )
      ( MAKE-13CRATE-VERIFY ?auto_1029246 ?auto_1029247 ?auto_1029248 ?auto_1029245 ?auto_1029249 ?auto_1029251 ?auto_1029250 ?auto_1029252 ?auto_1029253 ?auto_1029254 ?auto_1029255 ?auto_1029256 ?auto_1029257 ?auto_1029258 ) )
  )

)

