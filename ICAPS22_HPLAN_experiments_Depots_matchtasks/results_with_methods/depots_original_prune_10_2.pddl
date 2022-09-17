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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320352 - SURFACE
      ?auto_320353 - SURFACE
    )
    :vars
    (
      ?auto_320354 - HOIST
      ?auto_320355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320354 ?auto_320355 ) ( SURFACE-AT ?auto_320352 ?auto_320355 ) ( CLEAR ?auto_320352 ) ( LIFTING ?auto_320354 ?auto_320353 ) ( IS-CRATE ?auto_320353 ) ( not ( = ?auto_320352 ?auto_320353 ) ) )
    :subtasks
    ( ( !DROP ?auto_320354 ?auto_320353 ?auto_320352 ?auto_320355 )
      ( MAKE-1CRATE-VERIFY ?auto_320352 ?auto_320353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320356 - SURFACE
      ?auto_320357 - SURFACE
    )
    :vars
    (
      ?auto_320358 - HOIST
      ?auto_320359 - PLACE
      ?auto_320360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320358 ?auto_320359 ) ( SURFACE-AT ?auto_320356 ?auto_320359 ) ( CLEAR ?auto_320356 ) ( IS-CRATE ?auto_320357 ) ( not ( = ?auto_320356 ?auto_320357 ) ) ( TRUCK-AT ?auto_320360 ?auto_320359 ) ( AVAILABLE ?auto_320358 ) ( IN ?auto_320357 ?auto_320360 ) )
    :subtasks
    ( ( !UNLOAD ?auto_320358 ?auto_320357 ?auto_320360 ?auto_320359 )
      ( MAKE-1CRATE ?auto_320356 ?auto_320357 )
      ( MAKE-1CRATE-VERIFY ?auto_320356 ?auto_320357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320361 - SURFACE
      ?auto_320362 - SURFACE
    )
    :vars
    (
      ?auto_320364 - HOIST
      ?auto_320363 - PLACE
      ?auto_320365 - TRUCK
      ?auto_320366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320364 ?auto_320363 ) ( SURFACE-AT ?auto_320361 ?auto_320363 ) ( CLEAR ?auto_320361 ) ( IS-CRATE ?auto_320362 ) ( not ( = ?auto_320361 ?auto_320362 ) ) ( AVAILABLE ?auto_320364 ) ( IN ?auto_320362 ?auto_320365 ) ( TRUCK-AT ?auto_320365 ?auto_320366 ) ( not ( = ?auto_320366 ?auto_320363 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_320365 ?auto_320366 ?auto_320363 )
      ( MAKE-1CRATE ?auto_320361 ?auto_320362 )
      ( MAKE-1CRATE-VERIFY ?auto_320361 ?auto_320362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320367 - SURFACE
      ?auto_320368 - SURFACE
    )
    :vars
    (
      ?auto_320372 - HOIST
      ?auto_320370 - PLACE
      ?auto_320369 - TRUCK
      ?auto_320371 - PLACE
      ?auto_320373 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320372 ?auto_320370 ) ( SURFACE-AT ?auto_320367 ?auto_320370 ) ( CLEAR ?auto_320367 ) ( IS-CRATE ?auto_320368 ) ( not ( = ?auto_320367 ?auto_320368 ) ) ( AVAILABLE ?auto_320372 ) ( TRUCK-AT ?auto_320369 ?auto_320371 ) ( not ( = ?auto_320371 ?auto_320370 ) ) ( HOIST-AT ?auto_320373 ?auto_320371 ) ( LIFTING ?auto_320373 ?auto_320368 ) ( not ( = ?auto_320372 ?auto_320373 ) ) )
    :subtasks
    ( ( !LOAD ?auto_320373 ?auto_320368 ?auto_320369 ?auto_320371 )
      ( MAKE-1CRATE ?auto_320367 ?auto_320368 )
      ( MAKE-1CRATE-VERIFY ?auto_320367 ?auto_320368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320374 - SURFACE
      ?auto_320375 - SURFACE
    )
    :vars
    (
      ?auto_320379 - HOIST
      ?auto_320380 - PLACE
      ?auto_320377 - TRUCK
      ?auto_320376 - PLACE
      ?auto_320378 - HOIST
      ?auto_320381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320379 ?auto_320380 ) ( SURFACE-AT ?auto_320374 ?auto_320380 ) ( CLEAR ?auto_320374 ) ( IS-CRATE ?auto_320375 ) ( not ( = ?auto_320374 ?auto_320375 ) ) ( AVAILABLE ?auto_320379 ) ( TRUCK-AT ?auto_320377 ?auto_320376 ) ( not ( = ?auto_320376 ?auto_320380 ) ) ( HOIST-AT ?auto_320378 ?auto_320376 ) ( not ( = ?auto_320379 ?auto_320378 ) ) ( AVAILABLE ?auto_320378 ) ( SURFACE-AT ?auto_320375 ?auto_320376 ) ( ON ?auto_320375 ?auto_320381 ) ( CLEAR ?auto_320375 ) ( not ( = ?auto_320374 ?auto_320381 ) ) ( not ( = ?auto_320375 ?auto_320381 ) ) )
    :subtasks
    ( ( !LIFT ?auto_320378 ?auto_320375 ?auto_320381 ?auto_320376 )
      ( MAKE-1CRATE ?auto_320374 ?auto_320375 )
      ( MAKE-1CRATE-VERIFY ?auto_320374 ?auto_320375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320382 - SURFACE
      ?auto_320383 - SURFACE
    )
    :vars
    (
      ?auto_320387 - HOIST
      ?auto_320385 - PLACE
      ?auto_320388 - PLACE
      ?auto_320386 - HOIST
      ?auto_320389 - SURFACE
      ?auto_320384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320387 ?auto_320385 ) ( SURFACE-AT ?auto_320382 ?auto_320385 ) ( CLEAR ?auto_320382 ) ( IS-CRATE ?auto_320383 ) ( not ( = ?auto_320382 ?auto_320383 ) ) ( AVAILABLE ?auto_320387 ) ( not ( = ?auto_320388 ?auto_320385 ) ) ( HOIST-AT ?auto_320386 ?auto_320388 ) ( not ( = ?auto_320387 ?auto_320386 ) ) ( AVAILABLE ?auto_320386 ) ( SURFACE-AT ?auto_320383 ?auto_320388 ) ( ON ?auto_320383 ?auto_320389 ) ( CLEAR ?auto_320383 ) ( not ( = ?auto_320382 ?auto_320389 ) ) ( not ( = ?auto_320383 ?auto_320389 ) ) ( TRUCK-AT ?auto_320384 ?auto_320385 ) )
    :subtasks
    ( ( !DRIVE ?auto_320384 ?auto_320385 ?auto_320388 )
      ( MAKE-1CRATE ?auto_320382 ?auto_320383 )
      ( MAKE-1CRATE-VERIFY ?auto_320382 ?auto_320383 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320399 - SURFACE
      ?auto_320400 - SURFACE
      ?auto_320401 - SURFACE
    )
    :vars
    (
      ?auto_320403 - HOIST
      ?auto_320402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320403 ?auto_320402 ) ( SURFACE-AT ?auto_320400 ?auto_320402 ) ( CLEAR ?auto_320400 ) ( LIFTING ?auto_320403 ?auto_320401 ) ( IS-CRATE ?auto_320401 ) ( not ( = ?auto_320400 ?auto_320401 ) ) ( ON ?auto_320400 ?auto_320399 ) ( not ( = ?auto_320399 ?auto_320400 ) ) ( not ( = ?auto_320399 ?auto_320401 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320400 ?auto_320401 )
      ( MAKE-2CRATE-VERIFY ?auto_320399 ?auto_320400 ?auto_320401 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320409 - SURFACE
      ?auto_320410 - SURFACE
      ?auto_320411 - SURFACE
    )
    :vars
    (
      ?auto_320414 - HOIST
      ?auto_320413 - PLACE
      ?auto_320412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320414 ?auto_320413 ) ( SURFACE-AT ?auto_320410 ?auto_320413 ) ( CLEAR ?auto_320410 ) ( IS-CRATE ?auto_320411 ) ( not ( = ?auto_320410 ?auto_320411 ) ) ( TRUCK-AT ?auto_320412 ?auto_320413 ) ( AVAILABLE ?auto_320414 ) ( IN ?auto_320411 ?auto_320412 ) ( ON ?auto_320410 ?auto_320409 ) ( not ( = ?auto_320409 ?auto_320410 ) ) ( not ( = ?auto_320409 ?auto_320411 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320410 ?auto_320411 )
      ( MAKE-2CRATE-VERIFY ?auto_320409 ?auto_320410 ?auto_320411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320415 - SURFACE
      ?auto_320416 - SURFACE
    )
    :vars
    (
      ?auto_320420 - HOIST
      ?auto_320419 - PLACE
      ?auto_320418 - TRUCK
      ?auto_320417 - SURFACE
      ?auto_320421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320420 ?auto_320419 ) ( SURFACE-AT ?auto_320415 ?auto_320419 ) ( CLEAR ?auto_320415 ) ( IS-CRATE ?auto_320416 ) ( not ( = ?auto_320415 ?auto_320416 ) ) ( AVAILABLE ?auto_320420 ) ( IN ?auto_320416 ?auto_320418 ) ( ON ?auto_320415 ?auto_320417 ) ( not ( = ?auto_320417 ?auto_320415 ) ) ( not ( = ?auto_320417 ?auto_320416 ) ) ( TRUCK-AT ?auto_320418 ?auto_320421 ) ( not ( = ?auto_320421 ?auto_320419 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_320418 ?auto_320421 ?auto_320419 )
      ( MAKE-2CRATE ?auto_320417 ?auto_320415 ?auto_320416 )
      ( MAKE-1CRATE-VERIFY ?auto_320415 ?auto_320416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320422 - SURFACE
      ?auto_320423 - SURFACE
      ?auto_320424 - SURFACE
    )
    :vars
    (
      ?auto_320425 - HOIST
      ?auto_320428 - PLACE
      ?auto_320426 - TRUCK
      ?auto_320427 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320425 ?auto_320428 ) ( SURFACE-AT ?auto_320423 ?auto_320428 ) ( CLEAR ?auto_320423 ) ( IS-CRATE ?auto_320424 ) ( not ( = ?auto_320423 ?auto_320424 ) ) ( AVAILABLE ?auto_320425 ) ( IN ?auto_320424 ?auto_320426 ) ( ON ?auto_320423 ?auto_320422 ) ( not ( = ?auto_320422 ?auto_320423 ) ) ( not ( = ?auto_320422 ?auto_320424 ) ) ( TRUCK-AT ?auto_320426 ?auto_320427 ) ( not ( = ?auto_320427 ?auto_320428 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320423 ?auto_320424 )
      ( MAKE-2CRATE-VERIFY ?auto_320422 ?auto_320423 ?auto_320424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320429 - SURFACE
      ?auto_320430 - SURFACE
    )
    :vars
    (
      ?auto_320431 - HOIST
      ?auto_320432 - PLACE
      ?auto_320433 - SURFACE
      ?auto_320434 - TRUCK
      ?auto_320435 - PLACE
      ?auto_320436 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320431 ?auto_320432 ) ( SURFACE-AT ?auto_320429 ?auto_320432 ) ( CLEAR ?auto_320429 ) ( IS-CRATE ?auto_320430 ) ( not ( = ?auto_320429 ?auto_320430 ) ) ( AVAILABLE ?auto_320431 ) ( ON ?auto_320429 ?auto_320433 ) ( not ( = ?auto_320433 ?auto_320429 ) ) ( not ( = ?auto_320433 ?auto_320430 ) ) ( TRUCK-AT ?auto_320434 ?auto_320435 ) ( not ( = ?auto_320435 ?auto_320432 ) ) ( HOIST-AT ?auto_320436 ?auto_320435 ) ( LIFTING ?auto_320436 ?auto_320430 ) ( not ( = ?auto_320431 ?auto_320436 ) ) )
    :subtasks
    ( ( !LOAD ?auto_320436 ?auto_320430 ?auto_320434 ?auto_320435 )
      ( MAKE-2CRATE ?auto_320433 ?auto_320429 ?auto_320430 )
      ( MAKE-1CRATE-VERIFY ?auto_320429 ?auto_320430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320437 - SURFACE
      ?auto_320438 - SURFACE
      ?auto_320439 - SURFACE
    )
    :vars
    (
      ?auto_320441 - HOIST
      ?auto_320443 - PLACE
      ?auto_320440 - TRUCK
      ?auto_320444 - PLACE
      ?auto_320442 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320441 ?auto_320443 ) ( SURFACE-AT ?auto_320438 ?auto_320443 ) ( CLEAR ?auto_320438 ) ( IS-CRATE ?auto_320439 ) ( not ( = ?auto_320438 ?auto_320439 ) ) ( AVAILABLE ?auto_320441 ) ( ON ?auto_320438 ?auto_320437 ) ( not ( = ?auto_320437 ?auto_320438 ) ) ( not ( = ?auto_320437 ?auto_320439 ) ) ( TRUCK-AT ?auto_320440 ?auto_320444 ) ( not ( = ?auto_320444 ?auto_320443 ) ) ( HOIST-AT ?auto_320442 ?auto_320444 ) ( LIFTING ?auto_320442 ?auto_320439 ) ( not ( = ?auto_320441 ?auto_320442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320438 ?auto_320439 )
      ( MAKE-2CRATE-VERIFY ?auto_320437 ?auto_320438 ?auto_320439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320445 - SURFACE
      ?auto_320446 - SURFACE
    )
    :vars
    (
      ?auto_320449 - HOIST
      ?auto_320451 - PLACE
      ?auto_320450 - SURFACE
      ?auto_320452 - TRUCK
      ?auto_320447 - PLACE
      ?auto_320448 - HOIST
      ?auto_320453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320449 ?auto_320451 ) ( SURFACE-AT ?auto_320445 ?auto_320451 ) ( CLEAR ?auto_320445 ) ( IS-CRATE ?auto_320446 ) ( not ( = ?auto_320445 ?auto_320446 ) ) ( AVAILABLE ?auto_320449 ) ( ON ?auto_320445 ?auto_320450 ) ( not ( = ?auto_320450 ?auto_320445 ) ) ( not ( = ?auto_320450 ?auto_320446 ) ) ( TRUCK-AT ?auto_320452 ?auto_320447 ) ( not ( = ?auto_320447 ?auto_320451 ) ) ( HOIST-AT ?auto_320448 ?auto_320447 ) ( not ( = ?auto_320449 ?auto_320448 ) ) ( AVAILABLE ?auto_320448 ) ( SURFACE-AT ?auto_320446 ?auto_320447 ) ( ON ?auto_320446 ?auto_320453 ) ( CLEAR ?auto_320446 ) ( not ( = ?auto_320445 ?auto_320453 ) ) ( not ( = ?auto_320446 ?auto_320453 ) ) ( not ( = ?auto_320450 ?auto_320453 ) ) )
    :subtasks
    ( ( !LIFT ?auto_320448 ?auto_320446 ?auto_320453 ?auto_320447 )
      ( MAKE-2CRATE ?auto_320450 ?auto_320445 ?auto_320446 )
      ( MAKE-1CRATE-VERIFY ?auto_320445 ?auto_320446 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320454 - SURFACE
      ?auto_320455 - SURFACE
      ?auto_320456 - SURFACE
    )
    :vars
    (
      ?auto_320459 - HOIST
      ?auto_320457 - PLACE
      ?auto_320460 - TRUCK
      ?auto_320462 - PLACE
      ?auto_320461 - HOIST
      ?auto_320458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320459 ?auto_320457 ) ( SURFACE-AT ?auto_320455 ?auto_320457 ) ( CLEAR ?auto_320455 ) ( IS-CRATE ?auto_320456 ) ( not ( = ?auto_320455 ?auto_320456 ) ) ( AVAILABLE ?auto_320459 ) ( ON ?auto_320455 ?auto_320454 ) ( not ( = ?auto_320454 ?auto_320455 ) ) ( not ( = ?auto_320454 ?auto_320456 ) ) ( TRUCK-AT ?auto_320460 ?auto_320462 ) ( not ( = ?auto_320462 ?auto_320457 ) ) ( HOIST-AT ?auto_320461 ?auto_320462 ) ( not ( = ?auto_320459 ?auto_320461 ) ) ( AVAILABLE ?auto_320461 ) ( SURFACE-AT ?auto_320456 ?auto_320462 ) ( ON ?auto_320456 ?auto_320458 ) ( CLEAR ?auto_320456 ) ( not ( = ?auto_320455 ?auto_320458 ) ) ( not ( = ?auto_320456 ?auto_320458 ) ) ( not ( = ?auto_320454 ?auto_320458 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320455 ?auto_320456 )
      ( MAKE-2CRATE-VERIFY ?auto_320454 ?auto_320455 ?auto_320456 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320463 - SURFACE
      ?auto_320464 - SURFACE
    )
    :vars
    (
      ?auto_320466 - HOIST
      ?auto_320467 - PLACE
      ?auto_320471 - SURFACE
      ?auto_320470 - PLACE
      ?auto_320468 - HOIST
      ?auto_320465 - SURFACE
      ?auto_320469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320466 ?auto_320467 ) ( SURFACE-AT ?auto_320463 ?auto_320467 ) ( CLEAR ?auto_320463 ) ( IS-CRATE ?auto_320464 ) ( not ( = ?auto_320463 ?auto_320464 ) ) ( AVAILABLE ?auto_320466 ) ( ON ?auto_320463 ?auto_320471 ) ( not ( = ?auto_320471 ?auto_320463 ) ) ( not ( = ?auto_320471 ?auto_320464 ) ) ( not ( = ?auto_320470 ?auto_320467 ) ) ( HOIST-AT ?auto_320468 ?auto_320470 ) ( not ( = ?auto_320466 ?auto_320468 ) ) ( AVAILABLE ?auto_320468 ) ( SURFACE-AT ?auto_320464 ?auto_320470 ) ( ON ?auto_320464 ?auto_320465 ) ( CLEAR ?auto_320464 ) ( not ( = ?auto_320463 ?auto_320465 ) ) ( not ( = ?auto_320464 ?auto_320465 ) ) ( not ( = ?auto_320471 ?auto_320465 ) ) ( TRUCK-AT ?auto_320469 ?auto_320467 ) )
    :subtasks
    ( ( !DRIVE ?auto_320469 ?auto_320467 ?auto_320470 )
      ( MAKE-2CRATE ?auto_320471 ?auto_320463 ?auto_320464 )
      ( MAKE-1CRATE-VERIFY ?auto_320463 ?auto_320464 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320472 - SURFACE
      ?auto_320473 - SURFACE
      ?auto_320474 - SURFACE
    )
    :vars
    (
      ?auto_320475 - HOIST
      ?auto_320480 - PLACE
      ?auto_320478 - PLACE
      ?auto_320477 - HOIST
      ?auto_320479 - SURFACE
      ?auto_320476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320475 ?auto_320480 ) ( SURFACE-AT ?auto_320473 ?auto_320480 ) ( CLEAR ?auto_320473 ) ( IS-CRATE ?auto_320474 ) ( not ( = ?auto_320473 ?auto_320474 ) ) ( AVAILABLE ?auto_320475 ) ( ON ?auto_320473 ?auto_320472 ) ( not ( = ?auto_320472 ?auto_320473 ) ) ( not ( = ?auto_320472 ?auto_320474 ) ) ( not ( = ?auto_320478 ?auto_320480 ) ) ( HOIST-AT ?auto_320477 ?auto_320478 ) ( not ( = ?auto_320475 ?auto_320477 ) ) ( AVAILABLE ?auto_320477 ) ( SURFACE-AT ?auto_320474 ?auto_320478 ) ( ON ?auto_320474 ?auto_320479 ) ( CLEAR ?auto_320474 ) ( not ( = ?auto_320473 ?auto_320479 ) ) ( not ( = ?auto_320474 ?auto_320479 ) ) ( not ( = ?auto_320472 ?auto_320479 ) ) ( TRUCK-AT ?auto_320476 ?auto_320480 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320473 ?auto_320474 )
      ( MAKE-2CRATE-VERIFY ?auto_320472 ?auto_320473 ?auto_320474 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320481 - SURFACE
      ?auto_320482 - SURFACE
    )
    :vars
    (
      ?auto_320487 - HOIST
      ?auto_320483 - PLACE
      ?auto_320484 - SURFACE
      ?auto_320488 - PLACE
      ?auto_320485 - HOIST
      ?auto_320486 - SURFACE
      ?auto_320489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320487 ?auto_320483 ) ( IS-CRATE ?auto_320482 ) ( not ( = ?auto_320481 ?auto_320482 ) ) ( not ( = ?auto_320484 ?auto_320481 ) ) ( not ( = ?auto_320484 ?auto_320482 ) ) ( not ( = ?auto_320488 ?auto_320483 ) ) ( HOIST-AT ?auto_320485 ?auto_320488 ) ( not ( = ?auto_320487 ?auto_320485 ) ) ( AVAILABLE ?auto_320485 ) ( SURFACE-AT ?auto_320482 ?auto_320488 ) ( ON ?auto_320482 ?auto_320486 ) ( CLEAR ?auto_320482 ) ( not ( = ?auto_320481 ?auto_320486 ) ) ( not ( = ?auto_320482 ?auto_320486 ) ) ( not ( = ?auto_320484 ?auto_320486 ) ) ( TRUCK-AT ?auto_320489 ?auto_320483 ) ( SURFACE-AT ?auto_320484 ?auto_320483 ) ( CLEAR ?auto_320484 ) ( LIFTING ?auto_320487 ?auto_320481 ) ( IS-CRATE ?auto_320481 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320484 ?auto_320481 )
      ( MAKE-2CRATE ?auto_320484 ?auto_320481 ?auto_320482 )
      ( MAKE-1CRATE-VERIFY ?auto_320481 ?auto_320482 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320490 - SURFACE
      ?auto_320491 - SURFACE
      ?auto_320492 - SURFACE
    )
    :vars
    (
      ?auto_320497 - HOIST
      ?auto_320498 - PLACE
      ?auto_320494 - PLACE
      ?auto_320495 - HOIST
      ?auto_320493 - SURFACE
      ?auto_320496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320497 ?auto_320498 ) ( IS-CRATE ?auto_320492 ) ( not ( = ?auto_320491 ?auto_320492 ) ) ( not ( = ?auto_320490 ?auto_320491 ) ) ( not ( = ?auto_320490 ?auto_320492 ) ) ( not ( = ?auto_320494 ?auto_320498 ) ) ( HOIST-AT ?auto_320495 ?auto_320494 ) ( not ( = ?auto_320497 ?auto_320495 ) ) ( AVAILABLE ?auto_320495 ) ( SURFACE-AT ?auto_320492 ?auto_320494 ) ( ON ?auto_320492 ?auto_320493 ) ( CLEAR ?auto_320492 ) ( not ( = ?auto_320491 ?auto_320493 ) ) ( not ( = ?auto_320492 ?auto_320493 ) ) ( not ( = ?auto_320490 ?auto_320493 ) ) ( TRUCK-AT ?auto_320496 ?auto_320498 ) ( SURFACE-AT ?auto_320490 ?auto_320498 ) ( CLEAR ?auto_320490 ) ( LIFTING ?auto_320497 ?auto_320491 ) ( IS-CRATE ?auto_320491 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320491 ?auto_320492 )
      ( MAKE-2CRATE-VERIFY ?auto_320490 ?auto_320491 ?auto_320492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320499 - SURFACE
      ?auto_320500 - SURFACE
    )
    :vars
    (
      ?auto_320506 - HOIST
      ?auto_320507 - PLACE
      ?auto_320501 - SURFACE
      ?auto_320502 - PLACE
      ?auto_320505 - HOIST
      ?auto_320503 - SURFACE
      ?auto_320504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320506 ?auto_320507 ) ( IS-CRATE ?auto_320500 ) ( not ( = ?auto_320499 ?auto_320500 ) ) ( not ( = ?auto_320501 ?auto_320499 ) ) ( not ( = ?auto_320501 ?auto_320500 ) ) ( not ( = ?auto_320502 ?auto_320507 ) ) ( HOIST-AT ?auto_320505 ?auto_320502 ) ( not ( = ?auto_320506 ?auto_320505 ) ) ( AVAILABLE ?auto_320505 ) ( SURFACE-AT ?auto_320500 ?auto_320502 ) ( ON ?auto_320500 ?auto_320503 ) ( CLEAR ?auto_320500 ) ( not ( = ?auto_320499 ?auto_320503 ) ) ( not ( = ?auto_320500 ?auto_320503 ) ) ( not ( = ?auto_320501 ?auto_320503 ) ) ( TRUCK-AT ?auto_320504 ?auto_320507 ) ( SURFACE-AT ?auto_320501 ?auto_320507 ) ( CLEAR ?auto_320501 ) ( IS-CRATE ?auto_320499 ) ( AVAILABLE ?auto_320506 ) ( IN ?auto_320499 ?auto_320504 ) )
    :subtasks
    ( ( !UNLOAD ?auto_320506 ?auto_320499 ?auto_320504 ?auto_320507 )
      ( MAKE-2CRATE ?auto_320501 ?auto_320499 ?auto_320500 )
      ( MAKE-1CRATE-VERIFY ?auto_320499 ?auto_320500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320508 - SURFACE
      ?auto_320509 - SURFACE
      ?auto_320510 - SURFACE
    )
    :vars
    (
      ?auto_320512 - HOIST
      ?auto_320514 - PLACE
      ?auto_320511 - PLACE
      ?auto_320515 - HOIST
      ?auto_320513 - SURFACE
      ?auto_320516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320512 ?auto_320514 ) ( IS-CRATE ?auto_320510 ) ( not ( = ?auto_320509 ?auto_320510 ) ) ( not ( = ?auto_320508 ?auto_320509 ) ) ( not ( = ?auto_320508 ?auto_320510 ) ) ( not ( = ?auto_320511 ?auto_320514 ) ) ( HOIST-AT ?auto_320515 ?auto_320511 ) ( not ( = ?auto_320512 ?auto_320515 ) ) ( AVAILABLE ?auto_320515 ) ( SURFACE-AT ?auto_320510 ?auto_320511 ) ( ON ?auto_320510 ?auto_320513 ) ( CLEAR ?auto_320510 ) ( not ( = ?auto_320509 ?auto_320513 ) ) ( not ( = ?auto_320510 ?auto_320513 ) ) ( not ( = ?auto_320508 ?auto_320513 ) ) ( TRUCK-AT ?auto_320516 ?auto_320514 ) ( SURFACE-AT ?auto_320508 ?auto_320514 ) ( CLEAR ?auto_320508 ) ( IS-CRATE ?auto_320509 ) ( AVAILABLE ?auto_320512 ) ( IN ?auto_320509 ?auto_320516 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320509 ?auto_320510 )
      ( MAKE-2CRATE-VERIFY ?auto_320508 ?auto_320509 ?auto_320510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320553 - SURFACE
      ?auto_320554 - SURFACE
    )
    :vars
    (
      ?auto_320561 - HOIST
      ?auto_320559 - PLACE
      ?auto_320560 - SURFACE
      ?auto_320555 - PLACE
      ?auto_320558 - HOIST
      ?auto_320556 - SURFACE
      ?auto_320557 - TRUCK
      ?auto_320562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320561 ?auto_320559 ) ( SURFACE-AT ?auto_320553 ?auto_320559 ) ( CLEAR ?auto_320553 ) ( IS-CRATE ?auto_320554 ) ( not ( = ?auto_320553 ?auto_320554 ) ) ( AVAILABLE ?auto_320561 ) ( ON ?auto_320553 ?auto_320560 ) ( not ( = ?auto_320560 ?auto_320553 ) ) ( not ( = ?auto_320560 ?auto_320554 ) ) ( not ( = ?auto_320555 ?auto_320559 ) ) ( HOIST-AT ?auto_320558 ?auto_320555 ) ( not ( = ?auto_320561 ?auto_320558 ) ) ( AVAILABLE ?auto_320558 ) ( SURFACE-AT ?auto_320554 ?auto_320555 ) ( ON ?auto_320554 ?auto_320556 ) ( CLEAR ?auto_320554 ) ( not ( = ?auto_320553 ?auto_320556 ) ) ( not ( = ?auto_320554 ?auto_320556 ) ) ( not ( = ?auto_320560 ?auto_320556 ) ) ( TRUCK-AT ?auto_320557 ?auto_320562 ) ( not ( = ?auto_320562 ?auto_320559 ) ) ( not ( = ?auto_320555 ?auto_320562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_320557 ?auto_320562 ?auto_320559 )
      ( MAKE-1CRATE ?auto_320553 ?auto_320554 )
      ( MAKE-1CRATE-VERIFY ?auto_320553 ?auto_320554 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320593 - SURFACE
      ?auto_320594 - SURFACE
      ?auto_320595 - SURFACE
      ?auto_320592 - SURFACE
    )
    :vars
    (
      ?auto_320597 - HOIST
      ?auto_320596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320597 ?auto_320596 ) ( SURFACE-AT ?auto_320595 ?auto_320596 ) ( CLEAR ?auto_320595 ) ( LIFTING ?auto_320597 ?auto_320592 ) ( IS-CRATE ?auto_320592 ) ( not ( = ?auto_320595 ?auto_320592 ) ) ( ON ?auto_320594 ?auto_320593 ) ( ON ?auto_320595 ?auto_320594 ) ( not ( = ?auto_320593 ?auto_320594 ) ) ( not ( = ?auto_320593 ?auto_320595 ) ) ( not ( = ?auto_320593 ?auto_320592 ) ) ( not ( = ?auto_320594 ?auto_320595 ) ) ( not ( = ?auto_320594 ?auto_320592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320595 ?auto_320592 )
      ( MAKE-3CRATE-VERIFY ?auto_320593 ?auto_320594 ?auto_320595 ?auto_320592 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320610 - SURFACE
      ?auto_320611 - SURFACE
      ?auto_320612 - SURFACE
      ?auto_320609 - SURFACE
    )
    :vars
    (
      ?auto_320613 - HOIST
      ?auto_320615 - PLACE
      ?auto_320614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320613 ?auto_320615 ) ( SURFACE-AT ?auto_320612 ?auto_320615 ) ( CLEAR ?auto_320612 ) ( IS-CRATE ?auto_320609 ) ( not ( = ?auto_320612 ?auto_320609 ) ) ( TRUCK-AT ?auto_320614 ?auto_320615 ) ( AVAILABLE ?auto_320613 ) ( IN ?auto_320609 ?auto_320614 ) ( ON ?auto_320612 ?auto_320611 ) ( not ( = ?auto_320611 ?auto_320612 ) ) ( not ( = ?auto_320611 ?auto_320609 ) ) ( ON ?auto_320611 ?auto_320610 ) ( not ( = ?auto_320610 ?auto_320611 ) ) ( not ( = ?auto_320610 ?auto_320612 ) ) ( not ( = ?auto_320610 ?auto_320609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320611 ?auto_320612 ?auto_320609 )
      ( MAKE-3CRATE-VERIFY ?auto_320610 ?auto_320611 ?auto_320612 ?auto_320609 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320631 - SURFACE
      ?auto_320632 - SURFACE
      ?auto_320633 - SURFACE
      ?auto_320630 - SURFACE
    )
    :vars
    (
      ?auto_320634 - HOIST
      ?auto_320637 - PLACE
      ?auto_320635 - TRUCK
      ?auto_320636 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320634 ?auto_320637 ) ( SURFACE-AT ?auto_320633 ?auto_320637 ) ( CLEAR ?auto_320633 ) ( IS-CRATE ?auto_320630 ) ( not ( = ?auto_320633 ?auto_320630 ) ) ( AVAILABLE ?auto_320634 ) ( IN ?auto_320630 ?auto_320635 ) ( ON ?auto_320633 ?auto_320632 ) ( not ( = ?auto_320632 ?auto_320633 ) ) ( not ( = ?auto_320632 ?auto_320630 ) ) ( TRUCK-AT ?auto_320635 ?auto_320636 ) ( not ( = ?auto_320636 ?auto_320637 ) ) ( ON ?auto_320632 ?auto_320631 ) ( not ( = ?auto_320631 ?auto_320632 ) ) ( not ( = ?auto_320631 ?auto_320633 ) ) ( not ( = ?auto_320631 ?auto_320630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320632 ?auto_320633 ?auto_320630 )
      ( MAKE-3CRATE-VERIFY ?auto_320631 ?auto_320632 ?auto_320633 ?auto_320630 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320655 - SURFACE
      ?auto_320656 - SURFACE
      ?auto_320657 - SURFACE
      ?auto_320654 - SURFACE
    )
    :vars
    (
      ?auto_320659 - HOIST
      ?auto_320658 - PLACE
      ?auto_320662 - TRUCK
      ?auto_320661 - PLACE
      ?auto_320660 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320659 ?auto_320658 ) ( SURFACE-AT ?auto_320657 ?auto_320658 ) ( CLEAR ?auto_320657 ) ( IS-CRATE ?auto_320654 ) ( not ( = ?auto_320657 ?auto_320654 ) ) ( AVAILABLE ?auto_320659 ) ( ON ?auto_320657 ?auto_320656 ) ( not ( = ?auto_320656 ?auto_320657 ) ) ( not ( = ?auto_320656 ?auto_320654 ) ) ( TRUCK-AT ?auto_320662 ?auto_320661 ) ( not ( = ?auto_320661 ?auto_320658 ) ) ( HOIST-AT ?auto_320660 ?auto_320661 ) ( LIFTING ?auto_320660 ?auto_320654 ) ( not ( = ?auto_320659 ?auto_320660 ) ) ( ON ?auto_320656 ?auto_320655 ) ( not ( = ?auto_320655 ?auto_320656 ) ) ( not ( = ?auto_320655 ?auto_320657 ) ) ( not ( = ?auto_320655 ?auto_320654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320656 ?auto_320657 ?auto_320654 )
      ( MAKE-3CRATE-VERIFY ?auto_320655 ?auto_320656 ?auto_320657 ?auto_320654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320682 - SURFACE
      ?auto_320683 - SURFACE
      ?auto_320684 - SURFACE
      ?auto_320681 - SURFACE
    )
    :vars
    (
      ?auto_320687 - HOIST
      ?auto_320690 - PLACE
      ?auto_320685 - TRUCK
      ?auto_320688 - PLACE
      ?auto_320689 - HOIST
      ?auto_320686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320687 ?auto_320690 ) ( SURFACE-AT ?auto_320684 ?auto_320690 ) ( CLEAR ?auto_320684 ) ( IS-CRATE ?auto_320681 ) ( not ( = ?auto_320684 ?auto_320681 ) ) ( AVAILABLE ?auto_320687 ) ( ON ?auto_320684 ?auto_320683 ) ( not ( = ?auto_320683 ?auto_320684 ) ) ( not ( = ?auto_320683 ?auto_320681 ) ) ( TRUCK-AT ?auto_320685 ?auto_320688 ) ( not ( = ?auto_320688 ?auto_320690 ) ) ( HOIST-AT ?auto_320689 ?auto_320688 ) ( not ( = ?auto_320687 ?auto_320689 ) ) ( AVAILABLE ?auto_320689 ) ( SURFACE-AT ?auto_320681 ?auto_320688 ) ( ON ?auto_320681 ?auto_320686 ) ( CLEAR ?auto_320681 ) ( not ( = ?auto_320684 ?auto_320686 ) ) ( not ( = ?auto_320681 ?auto_320686 ) ) ( not ( = ?auto_320683 ?auto_320686 ) ) ( ON ?auto_320683 ?auto_320682 ) ( not ( = ?auto_320682 ?auto_320683 ) ) ( not ( = ?auto_320682 ?auto_320684 ) ) ( not ( = ?auto_320682 ?auto_320681 ) ) ( not ( = ?auto_320682 ?auto_320686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320683 ?auto_320684 ?auto_320681 )
      ( MAKE-3CRATE-VERIFY ?auto_320682 ?auto_320683 ?auto_320684 ?auto_320681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320710 - SURFACE
      ?auto_320711 - SURFACE
      ?auto_320712 - SURFACE
      ?auto_320709 - SURFACE
    )
    :vars
    (
      ?auto_320716 - HOIST
      ?auto_320717 - PLACE
      ?auto_320718 - PLACE
      ?auto_320714 - HOIST
      ?auto_320715 - SURFACE
      ?auto_320713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320716 ?auto_320717 ) ( SURFACE-AT ?auto_320712 ?auto_320717 ) ( CLEAR ?auto_320712 ) ( IS-CRATE ?auto_320709 ) ( not ( = ?auto_320712 ?auto_320709 ) ) ( AVAILABLE ?auto_320716 ) ( ON ?auto_320712 ?auto_320711 ) ( not ( = ?auto_320711 ?auto_320712 ) ) ( not ( = ?auto_320711 ?auto_320709 ) ) ( not ( = ?auto_320718 ?auto_320717 ) ) ( HOIST-AT ?auto_320714 ?auto_320718 ) ( not ( = ?auto_320716 ?auto_320714 ) ) ( AVAILABLE ?auto_320714 ) ( SURFACE-AT ?auto_320709 ?auto_320718 ) ( ON ?auto_320709 ?auto_320715 ) ( CLEAR ?auto_320709 ) ( not ( = ?auto_320712 ?auto_320715 ) ) ( not ( = ?auto_320709 ?auto_320715 ) ) ( not ( = ?auto_320711 ?auto_320715 ) ) ( TRUCK-AT ?auto_320713 ?auto_320717 ) ( ON ?auto_320711 ?auto_320710 ) ( not ( = ?auto_320710 ?auto_320711 ) ) ( not ( = ?auto_320710 ?auto_320712 ) ) ( not ( = ?auto_320710 ?auto_320709 ) ) ( not ( = ?auto_320710 ?auto_320715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320711 ?auto_320712 ?auto_320709 )
      ( MAKE-3CRATE-VERIFY ?auto_320710 ?auto_320711 ?auto_320712 ?auto_320709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320738 - SURFACE
      ?auto_320739 - SURFACE
      ?auto_320740 - SURFACE
      ?auto_320737 - SURFACE
    )
    :vars
    (
      ?auto_320746 - HOIST
      ?auto_320741 - PLACE
      ?auto_320745 - PLACE
      ?auto_320744 - HOIST
      ?auto_320742 - SURFACE
      ?auto_320743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320746 ?auto_320741 ) ( IS-CRATE ?auto_320737 ) ( not ( = ?auto_320740 ?auto_320737 ) ) ( not ( = ?auto_320739 ?auto_320740 ) ) ( not ( = ?auto_320739 ?auto_320737 ) ) ( not ( = ?auto_320745 ?auto_320741 ) ) ( HOIST-AT ?auto_320744 ?auto_320745 ) ( not ( = ?auto_320746 ?auto_320744 ) ) ( AVAILABLE ?auto_320744 ) ( SURFACE-AT ?auto_320737 ?auto_320745 ) ( ON ?auto_320737 ?auto_320742 ) ( CLEAR ?auto_320737 ) ( not ( = ?auto_320740 ?auto_320742 ) ) ( not ( = ?auto_320737 ?auto_320742 ) ) ( not ( = ?auto_320739 ?auto_320742 ) ) ( TRUCK-AT ?auto_320743 ?auto_320741 ) ( SURFACE-AT ?auto_320739 ?auto_320741 ) ( CLEAR ?auto_320739 ) ( LIFTING ?auto_320746 ?auto_320740 ) ( IS-CRATE ?auto_320740 ) ( ON ?auto_320739 ?auto_320738 ) ( not ( = ?auto_320738 ?auto_320739 ) ) ( not ( = ?auto_320738 ?auto_320740 ) ) ( not ( = ?auto_320738 ?auto_320737 ) ) ( not ( = ?auto_320738 ?auto_320742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320739 ?auto_320740 ?auto_320737 )
      ( MAKE-3CRATE-VERIFY ?auto_320738 ?auto_320739 ?auto_320740 ?auto_320737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320766 - SURFACE
      ?auto_320767 - SURFACE
      ?auto_320768 - SURFACE
      ?auto_320765 - SURFACE
    )
    :vars
    (
      ?auto_320774 - HOIST
      ?auto_320771 - PLACE
      ?auto_320772 - PLACE
      ?auto_320773 - HOIST
      ?auto_320769 - SURFACE
      ?auto_320770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320774 ?auto_320771 ) ( IS-CRATE ?auto_320765 ) ( not ( = ?auto_320768 ?auto_320765 ) ) ( not ( = ?auto_320767 ?auto_320768 ) ) ( not ( = ?auto_320767 ?auto_320765 ) ) ( not ( = ?auto_320772 ?auto_320771 ) ) ( HOIST-AT ?auto_320773 ?auto_320772 ) ( not ( = ?auto_320774 ?auto_320773 ) ) ( AVAILABLE ?auto_320773 ) ( SURFACE-AT ?auto_320765 ?auto_320772 ) ( ON ?auto_320765 ?auto_320769 ) ( CLEAR ?auto_320765 ) ( not ( = ?auto_320768 ?auto_320769 ) ) ( not ( = ?auto_320765 ?auto_320769 ) ) ( not ( = ?auto_320767 ?auto_320769 ) ) ( TRUCK-AT ?auto_320770 ?auto_320771 ) ( SURFACE-AT ?auto_320767 ?auto_320771 ) ( CLEAR ?auto_320767 ) ( IS-CRATE ?auto_320768 ) ( AVAILABLE ?auto_320774 ) ( IN ?auto_320768 ?auto_320770 ) ( ON ?auto_320767 ?auto_320766 ) ( not ( = ?auto_320766 ?auto_320767 ) ) ( not ( = ?auto_320766 ?auto_320768 ) ) ( not ( = ?auto_320766 ?auto_320765 ) ) ( not ( = ?auto_320766 ?auto_320769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320767 ?auto_320768 ?auto_320765 )
      ( MAKE-3CRATE-VERIFY ?auto_320766 ?auto_320767 ?auto_320768 ?auto_320765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320950 - SURFACE
      ?auto_320951 - SURFACE
    )
    :vars
    (
      ?auto_320952 - HOIST
      ?auto_320957 - PLACE
      ?auto_320958 - SURFACE
      ?auto_320955 - TRUCK
      ?auto_320953 - PLACE
      ?auto_320954 - HOIST
      ?auto_320956 - SURFACE
      ?auto_320959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320952 ?auto_320957 ) ( SURFACE-AT ?auto_320950 ?auto_320957 ) ( CLEAR ?auto_320950 ) ( IS-CRATE ?auto_320951 ) ( not ( = ?auto_320950 ?auto_320951 ) ) ( AVAILABLE ?auto_320952 ) ( ON ?auto_320950 ?auto_320958 ) ( not ( = ?auto_320958 ?auto_320950 ) ) ( not ( = ?auto_320958 ?auto_320951 ) ) ( TRUCK-AT ?auto_320955 ?auto_320953 ) ( not ( = ?auto_320953 ?auto_320957 ) ) ( HOIST-AT ?auto_320954 ?auto_320953 ) ( not ( = ?auto_320952 ?auto_320954 ) ) ( SURFACE-AT ?auto_320951 ?auto_320953 ) ( ON ?auto_320951 ?auto_320956 ) ( CLEAR ?auto_320951 ) ( not ( = ?auto_320950 ?auto_320956 ) ) ( not ( = ?auto_320951 ?auto_320956 ) ) ( not ( = ?auto_320958 ?auto_320956 ) ) ( LIFTING ?auto_320954 ?auto_320959 ) ( IS-CRATE ?auto_320959 ) ( not ( = ?auto_320950 ?auto_320959 ) ) ( not ( = ?auto_320951 ?auto_320959 ) ) ( not ( = ?auto_320958 ?auto_320959 ) ) ( not ( = ?auto_320956 ?auto_320959 ) ) )
    :subtasks
    ( ( !LOAD ?auto_320954 ?auto_320959 ?auto_320955 ?auto_320953 )
      ( MAKE-1CRATE ?auto_320950 ?auto_320951 )
      ( MAKE-1CRATE-VERIFY ?auto_320950 ?auto_320951 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321059 - SURFACE
      ?auto_321060 - SURFACE
      ?auto_321061 - SURFACE
      ?auto_321058 - SURFACE
      ?auto_321062 - SURFACE
    )
    :vars
    (
      ?auto_321063 - HOIST
      ?auto_321064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321063 ?auto_321064 ) ( SURFACE-AT ?auto_321058 ?auto_321064 ) ( CLEAR ?auto_321058 ) ( LIFTING ?auto_321063 ?auto_321062 ) ( IS-CRATE ?auto_321062 ) ( not ( = ?auto_321058 ?auto_321062 ) ) ( ON ?auto_321060 ?auto_321059 ) ( ON ?auto_321061 ?auto_321060 ) ( ON ?auto_321058 ?auto_321061 ) ( not ( = ?auto_321059 ?auto_321060 ) ) ( not ( = ?auto_321059 ?auto_321061 ) ) ( not ( = ?auto_321059 ?auto_321058 ) ) ( not ( = ?auto_321059 ?auto_321062 ) ) ( not ( = ?auto_321060 ?auto_321061 ) ) ( not ( = ?auto_321060 ?auto_321058 ) ) ( not ( = ?auto_321060 ?auto_321062 ) ) ( not ( = ?auto_321061 ?auto_321058 ) ) ( not ( = ?auto_321061 ?auto_321062 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321058 ?auto_321062 )
      ( MAKE-4CRATE-VERIFY ?auto_321059 ?auto_321060 ?auto_321061 ?auto_321058 ?auto_321062 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321084 - SURFACE
      ?auto_321085 - SURFACE
      ?auto_321086 - SURFACE
      ?auto_321083 - SURFACE
      ?auto_321087 - SURFACE
    )
    :vars
    (
      ?auto_321088 - HOIST
      ?auto_321089 - PLACE
      ?auto_321090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321088 ?auto_321089 ) ( SURFACE-AT ?auto_321083 ?auto_321089 ) ( CLEAR ?auto_321083 ) ( IS-CRATE ?auto_321087 ) ( not ( = ?auto_321083 ?auto_321087 ) ) ( TRUCK-AT ?auto_321090 ?auto_321089 ) ( AVAILABLE ?auto_321088 ) ( IN ?auto_321087 ?auto_321090 ) ( ON ?auto_321083 ?auto_321086 ) ( not ( = ?auto_321086 ?auto_321083 ) ) ( not ( = ?auto_321086 ?auto_321087 ) ) ( ON ?auto_321085 ?auto_321084 ) ( ON ?auto_321086 ?auto_321085 ) ( not ( = ?auto_321084 ?auto_321085 ) ) ( not ( = ?auto_321084 ?auto_321086 ) ) ( not ( = ?auto_321084 ?auto_321083 ) ) ( not ( = ?auto_321084 ?auto_321087 ) ) ( not ( = ?auto_321085 ?auto_321086 ) ) ( not ( = ?auto_321085 ?auto_321083 ) ) ( not ( = ?auto_321085 ?auto_321087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321086 ?auto_321083 ?auto_321087 )
      ( MAKE-4CRATE-VERIFY ?auto_321084 ?auto_321085 ?auto_321086 ?auto_321083 ?auto_321087 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321114 - SURFACE
      ?auto_321115 - SURFACE
      ?auto_321116 - SURFACE
      ?auto_321113 - SURFACE
      ?auto_321117 - SURFACE
    )
    :vars
    (
      ?auto_321121 - HOIST
      ?auto_321120 - PLACE
      ?auto_321119 - TRUCK
      ?auto_321118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321121 ?auto_321120 ) ( SURFACE-AT ?auto_321113 ?auto_321120 ) ( CLEAR ?auto_321113 ) ( IS-CRATE ?auto_321117 ) ( not ( = ?auto_321113 ?auto_321117 ) ) ( AVAILABLE ?auto_321121 ) ( IN ?auto_321117 ?auto_321119 ) ( ON ?auto_321113 ?auto_321116 ) ( not ( = ?auto_321116 ?auto_321113 ) ) ( not ( = ?auto_321116 ?auto_321117 ) ) ( TRUCK-AT ?auto_321119 ?auto_321118 ) ( not ( = ?auto_321118 ?auto_321120 ) ) ( ON ?auto_321115 ?auto_321114 ) ( ON ?auto_321116 ?auto_321115 ) ( not ( = ?auto_321114 ?auto_321115 ) ) ( not ( = ?auto_321114 ?auto_321116 ) ) ( not ( = ?auto_321114 ?auto_321113 ) ) ( not ( = ?auto_321114 ?auto_321117 ) ) ( not ( = ?auto_321115 ?auto_321116 ) ) ( not ( = ?auto_321115 ?auto_321113 ) ) ( not ( = ?auto_321115 ?auto_321117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321116 ?auto_321113 ?auto_321117 )
      ( MAKE-4CRATE-VERIFY ?auto_321114 ?auto_321115 ?auto_321116 ?auto_321113 ?auto_321117 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321148 - SURFACE
      ?auto_321149 - SURFACE
      ?auto_321150 - SURFACE
      ?auto_321147 - SURFACE
      ?auto_321151 - SURFACE
    )
    :vars
    (
      ?auto_321156 - HOIST
      ?auto_321155 - PLACE
      ?auto_321153 - TRUCK
      ?auto_321154 - PLACE
      ?auto_321152 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_321156 ?auto_321155 ) ( SURFACE-AT ?auto_321147 ?auto_321155 ) ( CLEAR ?auto_321147 ) ( IS-CRATE ?auto_321151 ) ( not ( = ?auto_321147 ?auto_321151 ) ) ( AVAILABLE ?auto_321156 ) ( ON ?auto_321147 ?auto_321150 ) ( not ( = ?auto_321150 ?auto_321147 ) ) ( not ( = ?auto_321150 ?auto_321151 ) ) ( TRUCK-AT ?auto_321153 ?auto_321154 ) ( not ( = ?auto_321154 ?auto_321155 ) ) ( HOIST-AT ?auto_321152 ?auto_321154 ) ( LIFTING ?auto_321152 ?auto_321151 ) ( not ( = ?auto_321156 ?auto_321152 ) ) ( ON ?auto_321149 ?auto_321148 ) ( ON ?auto_321150 ?auto_321149 ) ( not ( = ?auto_321148 ?auto_321149 ) ) ( not ( = ?auto_321148 ?auto_321150 ) ) ( not ( = ?auto_321148 ?auto_321147 ) ) ( not ( = ?auto_321148 ?auto_321151 ) ) ( not ( = ?auto_321149 ?auto_321150 ) ) ( not ( = ?auto_321149 ?auto_321147 ) ) ( not ( = ?auto_321149 ?auto_321151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321150 ?auto_321147 ?auto_321151 )
      ( MAKE-4CRATE-VERIFY ?auto_321148 ?auto_321149 ?auto_321150 ?auto_321147 ?auto_321151 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321186 - SURFACE
      ?auto_321187 - SURFACE
      ?auto_321188 - SURFACE
      ?auto_321185 - SURFACE
      ?auto_321189 - SURFACE
    )
    :vars
    (
      ?auto_321194 - HOIST
      ?auto_321190 - PLACE
      ?auto_321192 - TRUCK
      ?auto_321193 - PLACE
      ?auto_321191 - HOIST
      ?auto_321195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321194 ?auto_321190 ) ( SURFACE-AT ?auto_321185 ?auto_321190 ) ( CLEAR ?auto_321185 ) ( IS-CRATE ?auto_321189 ) ( not ( = ?auto_321185 ?auto_321189 ) ) ( AVAILABLE ?auto_321194 ) ( ON ?auto_321185 ?auto_321188 ) ( not ( = ?auto_321188 ?auto_321185 ) ) ( not ( = ?auto_321188 ?auto_321189 ) ) ( TRUCK-AT ?auto_321192 ?auto_321193 ) ( not ( = ?auto_321193 ?auto_321190 ) ) ( HOIST-AT ?auto_321191 ?auto_321193 ) ( not ( = ?auto_321194 ?auto_321191 ) ) ( AVAILABLE ?auto_321191 ) ( SURFACE-AT ?auto_321189 ?auto_321193 ) ( ON ?auto_321189 ?auto_321195 ) ( CLEAR ?auto_321189 ) ( not ( = ?auto_321185 ?auto_321195 ) ) ( not ( = ?auto_321189 ?auto_321195 ) ) ( not ( = ?auto_321188 ?auto_321195 ) ) ( ON ?auto_321187 ?auto_321186 ) ( ON ?auto_321188 ?auto_321187 ) ( not ( = ?auto_321186 ?auto_321187 ) ) ( not ( = ?auto_321186 ?auto_321188 ) ) ( not ( = ?auto_321186 ?auto_321185 ) ) ( not ( = ?auto_321186 ?auto_321189 ) ) ( not ( = ?auto_321186 ?auto_321195 ) ) ( not ( = ?auto_321187 ?auto_321188 ) ) ( not ( = ?auto_321187 ?auto_321185 ) ) ( not ( = ?auto_321187 ?auto_321189 ) ) ( not ( = ?auto_321187 ?auto_321195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321188 ?auto_321185 ?auto_321189 )
      ( MAKE-4CRATE-VERIFY ?auto_321186 ?auto_321187 ?auto_321188 ?auto_321185 ?auto_321189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321225 - SURFACE
      ?auto_321226 - SURFACE
      ?auto_321227 - SURFACE
      ?auto_321224 - SURFACE
      ?auto_321228 - SURFACE
    )
    :vars
    (
      ?auto_321229 - HOIST
      ?auto_321232 - PLACE
      ?auto_321231 - PLACE
      ?auto_321233 - HOIST
      ?auto_321234 - SURFACE
      ?auto_321230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321229 ?auto_321232 ) ( SURFACE-AT ?auto_321224 ?auto_321232 ) ( CLEAR ?auto_321224 ) ( IS-CRATE ?auto_321228 ) ( not ( = ?auto_321224 ?auto_321228 ) ) ( AVAILABLE ?auto_321229 ) ( ON ?auto_321224 ?auto_321227 ) ( not ( = ?auto_321227 ?auto_321224 ) ) ( not ( = ?auto_321227 ?auto_321228 ) ) ( not ( = ?auto_321231 ?auto_321232 ) ) ( HOIST-AT ?auto_321233 ?auto_321231 ) ( not ( = ?auto_321229 ?auto_321233 ) ) ( AVAILABLE ?auto_321233 ) ( SURFACE-AT ?auto_321228 ?auto_321231 ) ( ON ?auto_321228 ?auto_321234 ) ( CLEAR ?auto_321228 ) ( not ( = ?auto_321224 ?auto_321234 ) ) ( not ( = ?auto_321228 ?auto_321234 ) ) ( not ( = ?auto_321227 ?auto_321234 ) ) ( TRUCK-AT ?auto_321230 ?auto_321232 ) ( ON ?auto_321226 ?auto_321225 ) ( ON ?auto_321227 ?auto_321226 ) ( not ( = ?auto_321225 ?auto_321226 ) ) ( not ( = ?auto_321225 ?auto_321227 ) ) ( not ( = ?auto_321225 ?auto_321224 ) ) ( not ( = ?auto_321225 ?auto_321228 ) ) ( not ( = ?auto_321225 ?auto_321234 ) ) ( not ( = ?auto_321226 ?auto_321227 ) ) ( not ( = ?auto_321226 ?auto_321224 ) ) ( not ( = ?auto_321226 ?auto_321228 ) ) ( not ( = ?auto_321226 ?auto_321234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321227 ?auto_321224 ?auto_321228 )
      ( MAKE-4CRATE-VERIFY ?auto_321225 ?auto_321226 ?auto_321227 ?auto_321224 ?auto_321228 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321264 - SURFACE
      ?auto_321265 - SURFACE
      ?auto_321266 - SURFACE
      ?auto_321263 - SURFACE
      ?auto_321267 - SURFACE
    )
    :vars
    (
      ?auto_321273 - HOIST
      ?auto_321268 - PLACE
      ?auto_321270 - PLACE
      ?auto_321269 - HOIST
      ?auto_321272 - SURFACE
      ?auto_321271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321273 ?auto_321268 ) ( IS-CRATE ?auto_321267 ) ( not ( = ?auto_321263 ?auto_321267 ) ) ( not ( = ?auto_321266 ?auto_321263 ) ) ( not ( = ?auto_321266 ?auto_321267 ) ) ( not ( = ?auto_321270 ?auto_321268 ) ) ( HOIST-AT ?auto_321269 ?auto_321270 ) ( not ( = ?auto_321273 ?auto_321269 ) ) ( AVAILABLE ?auto_321269 ) ( SURFACE-AT ?auto_321267 ?auto_321270 ) ( ON ?auto_321267 ?auto_321272 ) ( CLEAR ?auto_321267 ) ( not ( = ?auto_321263 ?auto_321272 ) ) ( not ( = ?auto_321267 ?auto_321272 ) ) ( not ( = ?auto_321266 ?auto_321272 ) ) ( TRUCK-AT ?auto_321271 ?auto_321268 ) ( SURFACE-AT ?auto_321266 ?auto_321268 ) ( CLEAR ?auto_321266 ) ( LIFTING ?auto_321273 ?auto_321263 ) ( IS-CRATE ?auto_321263 ) ( ON ?auto_321265 ?auto_321264 ) ( ON ?auto_321266 ?auto_321265 ) ( not ( = ?auto_321264 ?auto_321265 ) ) ( not ( = ?auto_321264 ?auto_321266 ) ) ( not ( = ?auto_321264 ?auto_321263 ) ) ( not ( = ?auto_321264 ?auto_321267 ) ) ( not ( = ?auto_321264 ?auto_321272 ) ) ( not ( = ?auto_321265 ?auto_321266 ) ) ( not ( = ?auto_321265 ?auto_321263 ) ) ( not ( = ?auto_321265 ?auto_321267 ) ) ( not ( = ?auto_321265 ?auto_321272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321266 ?auto_321263 ?auto_321267 )
      ( MAKE-4CRATE-VERIFY ?auto_321264 ?auto_321265 ?auto_321266 ?auto_321263 ?auto_321267 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321303 - SURFACE
      ?auto_321304 - SURFACE
      ?auto_321305 - SURFACE
      ?auto_321302 - SURFACE
      ?auto_321306 - SURFACE
    )
    :vars
    (
      ?auto_321307 - HOIST
      ?auto_321312 - PLACE
      ?auto_321311 - PLACE
      ?auto_321310 - HOIST
      ?auto_321309 - SURFACE
      ?auto_321308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321307 ?auto_321312 ) ( IS-CRATE ?auto_321306 ) ( not ( = ?auto_321302 ?auto_321306 ) ) ( not ( = ?auto_321305 ?auto_321302 ) ) ( not ( = ?auto_321305 ?auto_321306 ) ) ( not ( = ?auto_321311 ?auto_321312 ) ) ( HOIST-AT ?auto_321310 ?auto_321311 ) ( not ( = ?auto_321307 ?auto_321310 ) ) ( AVAILABLE ?auto_321310 ) ( SURFACE-AT ?auto_321306 ?auto_321311 ) ( ON ?auto_321306 ?auto_321309 ) ( CLEAR ?auto_321306 ) ( not ( = ?auto_321302 ?auto_321309 ) ) ( not ( = ?auto_321306 ?auto_321309 ) ) ( not ( = ?auto_321305 ?auto_321309 ) ) ( TRUCK-AT ?auto_321308 ?auto_321312 ) ( SURFACE-AT ?auto_321305 ?auto_321312 ) ( CLEAR ?auto_321305 ) ( IS-CRATE ?auto_321302 ) ( AVAILABLE ?auto_321307 ) ( IN ?auto_321302 ?auto_321308 ) ( ON ?auto_321304 ?auto_321303 ) ( ON ?auto_321305 ?auto_321304 ) ( not ( = ?auto_321303 ?auto_321304 ) ) ( not ( = ?auto_321303 ?auto_321305 ) ) ( not ( = ?auto_321303 ?auto_321302 ) ) ( not ( = ?auto_321303 ?auto_321306 ) ) ( not ( = ?auto_321303 ?auto_321309 ) ) ( not ( = ?auto_321304 ?auto_321305 ) ) ( not ( = ?auto_321304 ?auto_321302 ) ) ( not ( = ?auto_321304 ?auto_321306 ) ) ( not ( = ?auto_321304 ?auto_321309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321305 ?auto_321302 ?auto_321306 )
      ( MAKE-4CRATE-VERIFY ?auto_321303 ?auto_321304 ?auto_321305 ?auto_321302 ?auto_321306 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_321313 - SURFACE
      ?auto_321314 - SURFACE
    )
    :vars
    (
      ?auto_321315 - HOIST
      ?auto_321320 - PLACE
      ?auto_321321 - SURFACE
      ?auto_321319 - PLACE
      ?auto_321318 - HOIST
      ?auto_321317 - SURFACE
      ?auto_321316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321315 ?auto_321320 ) ( IS-CRATE ?auto_321314 ) ( not ( = ?auto_321313 ?auto_321314 ) ) ( not ( = ?auto_321321 ?auto_321313 ) ) ( not ( = ?auto_321321 ?auto_321314 ) ) ( not ( = ?auto_321319 ?auto_321320 ) ) ( HOIST-AT ?auto_321318 ?auto_321319 ) ( not ( = ?auto_321315 ?auto_321318 ) ) ( AVAILABLE ?auto_321318 ) ( SURFACE-AT ?auto_321314 ?auto_321319 ) ( ON ?auto_321314 ?auto_321317 ) ( CLEAR ?auto_321314 ) ( not ( = ?auto_321313 ?auto_321317 ) ) ( not ( = ?auto_321314 ?auto_321317 ) ) ( not ( = ?auto_321321 ?auto_321317 ) ) ( SURFACE-AT ?auto_321321 ?auto_321320 ) ( CLEAR ?auto_321321 ) ( IS-CRATE ?auto_321313 ) ( AVAILABLE ?auto_321315 ) ( IN ?auto_321313 ?auto_321316 ) ( TRUCK-AT ?auto_321316 ?auto_321319 ) )
    :subtasks
    ( ( !DRIVE ?auto_321316 ?auto_321319 ?auto_321320 )
      ( MAKE-2CRATE ?auto_321321 ?auto_321313 ?auto_321314 )
      ( MAKE-1CRATE-VERIFY ?auto_321313 ?auto_321314 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_321322 - SURFACE
      ?auto_321323 - SURFACE
      ?auto_321324 - SURFACE
    )
    :vars
    (
      ?auto_321329 - HOIST
      ?auto_321325 - PLACE
      ?auto_321328 - PLACE
      ?auto_321330 - HOIST
      ?auto_321327 - SURFACE
      ?auto_321326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321329 ?auto_321325 ) ( IS-CRATE ?auto_321324 ) ( not ( = ?auto_321323 ?auto_321324 ) ) ( not ( = ?auto_321322 ?auto_321323 ) ) ( not ( = ?auto_321322 ?auto_321324 ) ) ( not ( = ?auto_321328 ?auto_321325 ) ) ( HOIST-AT ?auto_321330 ?auto_321328 ) ( not ( = ?auto_321329 ?auto_321330 ) ) ( AVAILABLE ?auto_321330 ) ( SURFACE-AT ?auto_321324 ?auto_321328 ) ( ON ?auto_321324 ?auto_321327 ) ( CLEAR ?auto_321324 ) ( not ( = ?auto_321323 ?auto_321327 ) ) ( not ( = ?auto_321324 ?auto_321327 ) ) ( not ( = ?auto_321322 ?auto_321327 ) ) ( SURFACE-AT ?auto_321322 ?auto_321325 ) ( CLEAR ?auto_321322 ) ( IS-CRATE ?auto_321323 ) ( AVAILABLE ?auto_321329 ) ( IN ?auto_321323 ?auto_321326 ) ( TRUCK-AT ?auto_321326 ?auto_321328 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321323 ?auto_321324 )
      ( MAKE-2CRATE-VERIFY ?auto_321322 ?auto_321323 ?auto_321324 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_321332 - SURFACE
      ?auto_321333 - SURFACE
      ?auto_321334 - SURFACE
      ?auto_321331 - SURFACE
    )
    :vars
    (
      ?auto_321340 - HOIST
      ?auto_321338 - PLACE
      ?auto_321339 - PLACE
      ?auto_321336 - HOIST
      ?auto_321337 - SURFACE
      ?auto_321335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321340 ?auto_321338 ) ( IS-CRATE ?auto_321331 ) ( not ( = ?auto_321334 ?auto_321331 ) ) ( not ( = ?auto_321333 ?auto_321334 ) ) ( not ( = ?auto_321333 ?auto_321331 ) ) ( not ( = ?auto_321339 ?auto_321338 ) ) ( HOIST-AT ?auto_321336 ?auto_321339 ) ( not ( = ?auto_321340 ?auto_321336 ) ) ( AVAILABLE ?auto_321336 ) ( SURFACE-AT ?auto_321331 ?auto_321339 ) ( ON ?auto_321331 ?auto_321337 ) ( CLEAR ?auto_321331 ) ( not ( = ?auto_321334 ?auto_321337 ) ) ( not ( = ?auto_321331 ?auto_321337 ) ) ( not ( = ?auto_321333 ?auto_321337 ) ) ( SURFACE-AT ?auto_321333 ?auto_321338 ) ( CLEAR ?auto_321333 ) ( IS-CRATE ?auto_321334 ) ( AVAILABLE ?auto_321340 ) ( IN ?auto_321334 ?auto_321335 ) ( TRUCK-AT ?auto_321335 ?auto_321339 ) ( ON ?auto_321333 ?auto_321332 ) ( not ( = ?auto_321332 ?auto_321333 ) ) ( not ( = ?auto_321332 ?auto_321334 ) ) ( not ( = ?auto_321332 ?auto_321331 ) ) ( not ( = ?auto_321332 ?auto_321337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321333 ?auto_321334 ?auto_321331 )
      ( MAKE-3CRATE-VERIFY ?auto_321332 ?auto_321333 ?auto_321334 ?auto_321331 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321342 - SURFACE
      ?auto_321343 - SURFACE
      ?auto_321344 - SURFACE
      ?auto_321341 - SURFACE
      ?auto_321345 - SURFACE
    )
    :vars
    (
      ?auto_321351 - HOIST
      ?auto_321349 - PLACE
      ?auto_321350 - PLACE
      ?auto_321347 - HOIST
      ?auto_321348 - SURFACE
      ?auto_321346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321351 ?auto_321349 ) ( IS-CRATE ?auto_321345 ) ( not ( = ?auto_321341 ?auto_321345 ) ) ( not ( = ?auto_321344 ?auto_321341 ) ) ( not ( = ?auto_321344 ?auto_321345 ) ) ( not ( = ?auto_321350 ?auto_321349 ) ) ( HOIST-AT ?auto_321347 ?auto_321350 ) ( not ( = ?auto_321351 ?auto_321347 ) ) ( AVAILABLE ?auto_321347 ) ( SURFACE-AT ?auto_321345 ?auto_321350 ) ( ON ?auto_321345 ?auto_321348 ) ( CLEAR ?auto_321345 ) ( not ( = ?auto_321341 ?auto_321348 ) ) ( not ( = ?auto_321345 ?auto_321348 ) ) ( not ( = ?auto_321344 ?auto_321348 ) ) ( SURFACE-AT ?auto_321344 ?auto_321349 ) ( CLEAR ?auto_321344 ) ( IS-CRATE ?auto_321341 ) ( AVAILABLE ?auto_321351 ) ( IN ?auto_321341 ?auto_321346 ) ( TRUCK-AT ?auto_321346 ?auto_321350 ) ( ON ?auto_321343 ?auto_321342 ) ( ON ?auto_321344 ?auto_321343 ) ( not ( = ?auto_321342 ?auto_321343 ) ) ( not ( = ?auto_321342 ?auto_321344 ) ) ( not ( = ?auto_321342 ?auto_321341 ) ) ( not ( = ?auto_321342 ?auto_321345 ) ) ( not ( = ?auto_321342 ?auto_321348 ) ) ( not ( = ?auto_321343 ?auto_321344 ) ) ( not ( = ?auto_321343 ?auto_321341 ) ) ( not ( = ?auto_321343 ?auto_321345 ) ) ( not ( = ?auto_321343 ?auto_321348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321344 ?auto_321341 ?auto_321345 )
      ( MAKE-4CRATE-VERIFY ?auto_321342 ?auto_321343 ?auto_321344 ?auto_321341 ?auto_321345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_321352 - SURFACE
      ?auto_321353 - SURFACE
    )
    :vars
    (
      ?auto_321360 - HOIST
      ?auto_321358 - PLACE
      ?auto_321356 - SURFACE
      ?auto_321359 - PLACE
      ?auto_321355 - HOIST
      ?auto_321357 - SURFACE
      ?auto_321354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321360 ?auto_321358 ) ( IS-CRATE ?auto_321353 ) ( not ( = ?auto_321352 ?auto_321353 ) ) ( not ( = ?auto_321356 ?auto_321352 ) ) ( not ( = ?auto_321356 ?auto_321353 ) ) ( not ( = ?auto_321359 ?auto_321358 ) ) ( HOIST-AT ?auto_321355 ?auto_321359 ) ( not ( = ?auto_321360 ?auto_321355 ) ) ( SURFACE-AT ?auto_321353 ?auto_321359 ) ( ON ?auto_321353 ?auto_321357 ) ( CLEAR ?auto_321353 ) ( not ( = ?auto_321352 ?auto_321357 ) ) ( not ( = ?auto_321353 ?auto_321357 ) ) ( not ( = ?auto_321356 ?auto_321357 ) ) ( SURFACE-AT ?auto_321356 ?auto_321358 ) ( CLEAR ?auto_321356 ) ( IS-CRATE ?auto_321352 ) ( AVAILABLE ?auto_321360 ) ( TRUCK-AT ?auto_321354 ?auto_321359 ) ( LIFTING ?auto_321355 ?auto_321352 ) )
    :subtasks
    ( ( !LOAD ?auto_321355 ?auto_321352 ?auto_321354 ?auto_321359 )
      ( MAKE-2CRATE ?auto_321356 ?auto_321352 ?auto_321353 )
      ( MAKE-1CRATE-VERIFY ?auto_321352 ?auto_321353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_321361 - SURFACE
      ?auto_321362 - SURFACE
      ?auto_321363 - SURFACE
    )
    :vars
    (
      ?auto_321367 - HOIST
      ?auto_321368 - PLACE
      ?auto_321369 - PLACE
      ?auto_321366 - HOIST
      ?auto_321364 - SURFACE
      ?auto_321365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321367 ?auto_321368 ) ( IS-CRATE ?auto_321363 ) ( not ( = ?auto_321362 ?auto_321363 ) ) ( not ( = ?auto_321361 ?auto_321362 ) ) ( not ( = ?auto_321361 ?auto_321363 ) ) ( not ( = ?auto_321369 ?auto_321368 ) ) ( HOIST-AT ?auto_321366 ?auto_321369 ) ( not ( = ?auto_321367 ?auto_321366 ) ) ( SURFACE-AT ?auto_321363 ?auto_321369 ) ( ON ?auto_321363 ?auto_321364 ) ( CLEAR ?auto_321363 ) ( not ( = ?auto_321362 ?auto_321364 ) ) ( not ( = ?auto_321363 ?auto_321364 ) ) ( not ( = ?auto_321361 ?auto_321364 ) ) ( SURFACE-AT ?auto_321361 ?auto_321368 ) ( CLEAR ?auto_321361 ) ( IS-CRATE ?auto_321362 ) ( AVAILABLE ?auto_321367 ) ( TRUCK-AT ?auto_321365 ?auto_321369 ) ( LIFTING ?auto_321366 ?auto_321362 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321362 ?auto_321363 )
      ( MAKE-2CRATE-VERIFY ?auto_321361 ?auto_321362 ?auto_321363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_321371 - SURFACE
      ?auto_321372 - SURFACE
      ?auto_321373 - SURFACE
      ?auto_321370 - SURFACE
    )
    :vars
    (
      ?auto_321374 - HOIST
      ?auto_321377 - PLACE
      ?auto_321378 - PLACE
      ?auto_321376 - HOIST
      ?auto_321379 - SURFACE
      ?auto_321375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321374 ?auto_321377 ) ( IS-CRATE ?auto_321370 ) ( not ( = ?auto_321373 ?auto_321370 ) ) ( not ( = ?auto_321372 ?auto_321373 ) ) ( not ( = ?auto_321372 ?auto_321370 ) ) ( not ( = ?auto_321378 ?auto_321377 ) ) ( HOIST-AT ?auto_321376 ?auto_321378 ) ( not ( = ?auto_321374 ?auto_321376 ) ) ( SURFACE-AT ?auto_321370 ?auto_321378 ) ( ON ?auto_321370 ?auto_321379 ) ( CLEAR ?auto_321370 ) ( not ( = ?auto_321373 ?auto_321379 ) ) ( not ( = ?auto_321370 ?auto_321379 ) ) ( not ( = ?auto_321372 ?auto_321379 ) ) ( SURFACE-AT ?auto_321372 ?auto_321377 ) ( CLEAR ?auto_321372 ) ( IS-CRATE ?auto_321373 ) ( AVAILABLE ?auto_321374 ) ( TRUCK-AT ?auto_321375 ?auto_321378 ) ( LIFTING ?auto_321376 ?auto_321373 ) ( ON ?auto_321372 ?auto_321371 ) ( not ( = ?auto_321371 ?auto_321372 ) ) ( not ( = ?auto_321371 ?auto_321373 ) ) ( not ( = ?auto_321371 ?auto_321370 ) ) ( not ( = ?auto_321371 ?auto_321379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321372 ?auto_321373 ?auto_321370 )
      ( MAKE-3CRATE-VERIFY ?auto_321371 ?auto_321372 ?auto_321373 ?auto_321370 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321381 - SURFACE
      ?auto_321382 - SURFACE
      ?auto_321383 - SURFACE
      ?auto_321380 - SURFACE
      ?auto_321384 - SURFACE
    )
    :vars
    (
      ?auto_321385 - HOIST
      ?auto_321388 - PLACE
      ?auto_321389 - PLACE
      ?auto_321387 - HOIST
      ?auto_321390 - SURFACE
      ?auto_321386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321385 ?auto_321388 ) ( IS-CRATE ?auto_321384 ) ( not ( = ?auto_321380 ?auto_321384 ) ) ( not ( = ?auto_321383 ?auto_321380 ) ) ( not ( = ?auto_321383 ?auto_321384 ) ) ( not ( = ?auto_321389 ?auto_321388 ) ) ( HOIST-AT ?auto_321387 ?auto_321389 ) ( not ( = ?auto_321385 ?auto_321387 ) ) ( SURFACE-AT ?auto_321384 ?auto_321389 ) ( ON ?auto_321384 ?auto_321390 ) ( CLEAR ?auto_321384 ) ( not ( = ?auto_321380 ?auto_321390 ) ) ( not ( = ?auto_321384 ?auto_321390 ) ) ( not ( = ?auto_321383 ?auto_321390 ) ) ( SURFACE-AT ?auto_321383 ?auto_321388 ) ( CLEAR ?auto_321383 ) ( IS-CRATE ?auto_321380 ) ( AVAILABLE ?auto_321385 ) ( TRUCK-AT ?auto_321386 ?auto_321389 ) ( LIFTING ?auto_321387 ?auto_321380 ) ( ON ?auto_321382 ?auto_321381 ) ( ON ?auto_321383 ?auto_321382 ) ( not ( = ?auto_321381 ?auto_321382 ) ) ( not ( = ?auto_321381 ?auto_321383 ) ) ( not ( = ?auto_321381 ?auto_321380 ) ) ( not ( = ?auto_321381 ?auto_321384 ) ) ( not ( = ?auto_321381 ?auto_321390 ) ) ( not ( = ?auto_321382 ?auto_321383 ) ) ( not ( = ?auto_321382 ?auto_321380 ) ) ( not ( = ?auto_321382 ?auto_321384 ) ) ( not ( = ?auto_321382 ?auto_321390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321383 ?auto_321380 ?auto_321384 )
      ( MAKE-4CRATE-VERIFY ?auto_321381 ?auto_321382 ?auto_321383 ?auto_321380 ?auto_321384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_321391 - SURFACE
      ?auto_321392 - SURFACE
    )
    :vars
    (
      ?auto_321393 - HOIST
      ?auto_321397 - PLACE
      ?auto_321395 - SURFACE
      ?auto_321398 - PLACE
      ?auto_321396 - HOIST
      ?auto_321399 - SURFACE
      ?auto_321394 - TRUCK
      ?auto_321400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321393 ?auto_321397 ) ( IS-CRATE ?auto_321392 ) ( not ( = ?auto_321391 ?auto_321392 ) ) ( not ( = ?auto_321395 ?auto_321391 ) ) ( not ( = ?auto_321395 ?auto_321392 ) ) ( not ( = ?auto_321398 ?auto_321397 ) ) ( HOIST-AT ?auto_321396 ?auto_321398 ) ( not ( = ?auto_321393 ?auto_321396 ) ) ( SURFACE-AT ?auto_321392 ?auto_321398 ) ( ON ?auto_321392 ?auto_321399 ) ( CLEAR ?auto_321392 ) ( not ( = ?auto_321391 ?auto_321399 ) ) ( not ( = ?auto_321392 ?auto_321399 ) ) ( not ( = ?auto_321395 ?auto_321399 ) ) ( SURFACE-AT ?auto_321395 ?auto_321397 ) ( CLEAR ?auto_321395 ) ( IS-CRATE ?auto_321391 ) ( AVAILABLE ?auto_321393 ) ( TRUCK-AT ?auto_321394 ?auto_321398 ) ( AVAILABLE ?auto_321396 ) ( SURFACE-AT ?auto_321391 ?auto_321398 ) ( ON ?auto_321391 ?auto_321400 ) ( CLEAR ?auto_321391 ) ( not ( = ?auto_321391 ?auto_321400 ) ) ( not ( = ?auto_321392 ?auto_321400 ) ) ( not ( = ?auto_321395 ?auto_321400 ) ) ( not ( = ?auto_321399 ?auto_321400 ) ) )
    :subtasks
    ( ( !LIFT ?auto_321396 ?auto_321391 ?auto_321400 ?auto_321398 )
      ( MAKE-2CRATE ?auto_321395 ?auto_321391 ?auto_321392 )
      ( MAKE-1CRATE-VERIFY ?auto_321391 ?auto_321392 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_321401 - SURFACE
      ?auto_321402 - SURFACE
      ?auto_321403 - SURFACE
    )
    :vars
    (
      ?auto_321409 - HOIST
      ?auto_321407 - PLACE
      ?auto_321404 - PLACE
      ?auto_321408 - HOIST
      ?auto_321405 - SURFACE
      ?auto_321410 - TRUCK
      ?auto_321406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321409 ?auto_321407 ) ( IS-CRATE ?auto_321403 ) ( not ( = ?auto_321402 ?auto_321403 ) ) ( not ( = ?auto_321401 ?auto_321402 ) ) ( not ( = ?auto_321401 ?auto_321403 ) ) ( not ( = ?auto_321404 ?auto_321407 ) ) ( HOIST-AT ?auto_321408 ?auto_321404 ) ( not ( = ?auto_321409 ?auto_321408 ) ) ( SURFACE-AT ?auto_321403 ?auto_321404 ) ( ON ?auto_321403 ?auto_321405 ) ( CLEAR ?auto_321403 ) ( not ( = ?auto_321402 ?auto_321405 ) ) ( not ( = ?auto_321403 ?auto_321405 ) ) ( not ( = ?auto_321401 ?auto_321405 ) ) ( SURFACE-AT ?auto_321401 ?auto_321407 ) ( CLEAR ?auto_321401 ) ( IS-CRATE ?auto_321402 ) ( AVAILABLE ?auto_321409 ) ( TRUCK-AT ?auto_321410 ?auto_321404 ) ( AVAILABLE ?auto_321408 ) ( SURFACE-AT ?auto_321402 ?auto_321404 ) ( ON ?auto_321402 ?auto_321406 ) ( CLEAR ?auto_321402 ) ( not ( = ?auto_321402 ?auto_321406 ) ) ( not ( = ?auto_321403 ?auto_321406 ) ) ( not ( = ?auto_321401 ?auto_321406 ) ) ( not ( = ?auto_321405 ?auto_321406 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321402 ?auto_321403 )
      ( MAKE-2CRATE-VERIFY ?auto_321401 ?auto_321402 ?auto_321403 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_321412 - SURFACE
      ?auto_321413 - SURFACE
      ?auto_321414 - SURFACE
      ?auto_321411 - SURFACE
    )
    :vars
    (
      ?auto_321417 - HOIST
      ?auto_321419 - PLACE
      ?auto_321420 - PLACE
      ?auto_321416 - HOIST
      ?auto_321415 - SURFACE
      ?auto_321418 - TRUCK
      ?auto_321421 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321417 ?auto_321419 ) ( IS-CRATE ?auto_321411 ) ( not ( = ?auto_321414 ?auto_321411 ) ) ( not ( = ?auto_321413 ?auto_321414 ) ) ( not ( = ?auto_321413 ?auto_321411 ) ) ( not ( = ?auto_321420 ?auto_321419 ) ) ( HOIST-AT ?auto_321416 ?auto_321420 ) ( not ( = ?auto_321417 ?auto_321416 ) ) ( SURFACE-AT ?auto_321411 ?auto_321420 ) ( ON ?auto_321411 ?auto_321415 ) ( CLEAR ?auto_321411 ) ( not ( = ?auto_321414 ?auto_321415 ) ) ( not ( = ?auto_321411 ?auto_321415 ) ) ( not ( = ?auto_321413 ?auto_321415 ) ) ( SURFACE-AT ?auto_321413 ?auto_321419 ) ( CLEAR ?auto_321413 ) ( IS-CRATE ?auto_321414 ) ( AVAILABLE ?auto_321417 ) ( TRUCK-AT ?auto_321418 ?auto_321420 ) ( AVAILABLE ?auto_321416 ) ( SURFACE-AT ?auto_321414 ?auto_321420 ) ( ON ?auto_321414 ?auto_321421 ) ( CLEAR ?auto_321414 ) ( not ( = ?auto_321414 ?auto_321421 ) ) ( not ( = ?auto_321411 ?auto_321421 ) ) ( not ( = ?auto_321413 ?auto_321421 ) ) ( not ( = ?auto_321415 ?auto_321421 ) ) ( ON ?auto_321413 ?auto_321412 ) ( not ( = ?auto_321412 ?auto_321413 ) ) ( not ( = ?auto_321412 ?auto_321414 ) ) ( not ( = ?auto_321412 ?auto_321411 ) ) ( not ( = ?auto_321412 ?auto_321415 ) ) ( not ( = ?auto_321412 ?auto_321421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321413 ?auto_321414 ?auto_321411 )
      ( MAKE-3CRATE-VERIFY ?auto_321412 ?auto_321413 ?auto_321414 ?auto_321411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321423 - SURFACE
      ?auto_321424 - SURFACE
      ?auto_321425 - SURFACE
      ?auto_321422 - SURFACE
      ?auto_321426 - SURFACE
    )
    :vars
    (
      ?auto_321429 - HOIST
      ?auto_321431 - PLACE
      ?auto_321432 - PLACE
      ?auto_321428 - HOIST
      ?auto_321427 - SURFACE
      ?auto_321430 - TRUCK
      ?auto_321433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321429 ?auto_321431 ) ( IS-CRATE ?auto_321426 ) ( not ( = ?auto_321422 ?auto_321426 ) ) ( not ( = ?auto_321425 ?auto_321422 ) ) ( not ( = ?auto_321425 ?auto_321426 ) ) ( not ( = ?auto_321432 ?auto_321431 ) ) ( HOIST-AT ?auto_321428 ?auto_321432 ) ( not ( = ?auto_321429 ?auto_321428 ) ) ( SURFACE-AT ?auto_321426 ?auto_321432 ) ( ON ?auto_321426 ?auto_321427 ) ( CLEAR ?auto_321426 ) ( not ( = ?auto_321422 ?auto_321427 ) ) ( not ( = ?auto_321426 ?auto_321427 ) ) ( not ( = ?auto_321425 ?auto_321427 ) ) ( SURFACE-AT ?auto_321425 ?auto_321431 ) ( CLEAR ?auto_321425 ) ( IS-CRATE ?auto_321422 ) ( AVAILABLE ?auto_321429 ) ( TRUCK-AT ?auto_321430 ?auto_321432 ) ( AVAILABLE ?auto_321428 ) ( SURFACE-AT ?auto_321422 ?auto_321432 ) ( ON ?auto_321422 ?auto_321433 ) ( CLEAR ?auto_321422 ) ( not ( = ?auto_321422 ?auto_321433 ) ) ( not ( = ?auto_321426 ?auto_321433 ) ) ( not ( = ?auto_321425 ?auto_321433 ) ) ( not ( = ?auto_321427 ?auto_321433 ) ) ( ON ?auto_321424 ?auto_321423 ) ( ON ?auto_321425 ?auto_321424 ) ( not ( = ?auto_321423 ?auto_321424 ) ) ( not ( = ?auto_321423 ?auto_321425 ) ) ( not ( = ?auto_321423 ?auto_321422 ) ) ( not ( = ?auto_321423 ?auto_321426 ) ) ( not ( = ?auto_321423 ?auto_321427 ) ) ( not ( = ?auto_321423 ?auto_321433 ) ) ( not ( = ?auto_321424 ?auto_321425 ) ) ( not ( = ?auto_321424 ?auto_321422 ) ) ( not ( = ?auto_321424 ?auto_321426 ) ) ( not ( = ?auto_321424 ?auto_321427 ) ) ( not ( = ?auto_321424 ?auto_321433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321425 ?auto_321422 ?auto_321426 )
      ( MAKE-4CRATE-VERIFY ?auto_321423 ?auto_321424 ?auto_321425 ?auto_321422 ?auto_321426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_321434 - SURFACE
      ?auto_321435 - SURFACE
    )
    :vars
    (
      ?auto_321439 - HOIST
      ?auto_321441 - PLACE
      ?auto_321438 - SURFACE
      ?auto_321442 - PLACE
      ?auto_321437 - HOIST
      ?auto_321436 - SURFACE
      ?auto_321443 - SURFACE
      ?auto_321440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321439 ?auto_321441 ) ( IS-CRATE ?auto_321435 ) ( not ( = ?auto_321434 ?auto_321435 ) ) ( not ( = ?auto_321438 ?auto_321434 ) ) ( not ( = ?auto_321438 ?auto_321435 ) ) ( not ( = ?auto_321442 ?auto_321441 ) ) ( HOIST-AT ?auto_321437 ?auto_321442 ) ( not ( = ?auto_321439 ?auto_321437 ) ) ( SURFACE-AT ?auto_321435 ?auto_321442 ) ( ON ?auto_321435 ?auto_321436 ) ( CLEAR ?auto_321435 ) ( not ( = ?auto_321434 ?auto_321436 ) ) ( not ( = ?auto_321435 ?auto_321436 ) ) ( not ( = ?auto_321438 ?auto_321436 ) ) ( SURFACE-AT ?auto_321438 ?auto_321441 ) ( CLEAR ?auto_321438 ) ( IS-CRATE ?auto_321434 ) ( AVAILABLE ?auto_321439 ) ( AVAILABLE ?auto_321437 ) ( SURFACE-AT ?auto_321434 ?auto_321442 ) ( ON ?auto_321434 ?auto_321443 ) ( CLEAR ?auto_321434 ) ( not ( = ?auto_321434 ?auto_321443 ) ) ( not ( = ?auto_321435 ?auto_321443 ) ) ( not ( = ?auto_321438 ?auto_321443 ) ) ( not ( = ?auto_321436 ?auto_321443 ) ) ( TRUCK-AT ?auto_321440 ?auto_321441 ) )
    :subtasks
    ( ( !DRIVE ?auto_321440 ?auto_321441 ?auto_321442 )
      ( MAKE-2CRATE ?auto_321438 ?auto_321434 ?auto_321435 )
      ( MAKE-1CRATE-VERIFY ?auto_321434 ?auto_321435 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_321444 - SURFACE
      ?auto_321445 - SURFACE
      ?auto_321446 - SURFACE
    )
    :vars
    (
      ?auto_321453 - HOIST
      ?auto_321452 - PLACE
      ?auto_321450 - PLACE
      ?auto_321448 - HOIST
      ?auto_321449 - SURFACE
      ?auto_321447 - SURFACE
      ?auto_321451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321453 ?auto_321452 ) ( IS-CRATE ?auto_321446 ) ( not ( = ?auto_321445 ?auto_321446 ) ) ( not ( = ?auto_321444 ?auto_321445 ) ) ( not ( = ?auto_321444 ?auto_321446 ) ) ( not ( = ?auto_321450 ?auto_321452 ) ) ( HOIST-AT ?auto_321448 ?auto_321450 ) ( not ( = ?auto_321453 ?auto_321448 ) ) ( SURFACE-AT ?auto_321446 ?auto_321450 ) ( ON ?auto_321446 ?auto_321449 ) ( CLEAR ?auto_321446 ) ( not ( = ?auto_321445 ?auto_321449 ) ) ( not ( = ?auto_321446 ?auto_321449 ) ) ( not ( = ?auto_321444 ?auto_321449 ) ) ( SURFACE-AT ?auto_321444 ?auto_321452 ) ( CLEAR ?auto_321444 ) ( IS-CRATE ?auto_321445 ) ( AVAILABLE ?auto_321453 ) ( AVAILABLE ?auto_321448 ) ( SURFACE-AT ?auto_321445 ?auto_321450 ) ( ON ?auto_321445 ?auto_321447 ) ( CLEAR ?auto_321445 ) ( not ( = ?auto_321445 ?auto_321447 ) ) ( not ( = ?auto_321446 ?auto_321447 ) ) ( not ( = ?auto_321444 ?auto_321447 ) ) ( not ( = ?auto_321449 ?auto_321447 ) ) ( TRUCK-AT ?auto_321451 ?auto_321452 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321445 ?auto_321446 )
      ( MAKE-2CRATE-VERIFY ?auto_321444 ?auto_321445 ?auto_321446 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_321455 - SURFACE
      ?auto_321456 - SURFACE
      ?auto_321457 - SURFACE
      ?auto_321454 - SURFACE
    )
    :vars
    (
      ?auto_321460 - HOIST
      ?auto_321464 - PLACE
      ?auto_321458 - PLACE
      ?auto_321462 - HOIST
      ?auto_321461 - SURFACE
      ?auto_321459 - SURFACE
      ?auto_321463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321460 ?auto_321464 ) ( IS-CRATE ?auto_321454 ) ( not ( = ?auto_321457 ?auto_321454 ) ) ( not ( = ?auto_321456 ?auto_321457 ) ) ( not ( = ?auto_321456 ?auto_321454 ) ) ( not ( = ?auto_321458 ?auto_321464 ) ) ( HOIST-AT ?auto_321462 ?auto_321458 ) ( not ( = ?auto_321460 ?auto_321462 ) ) ( SURFACE-AT ?auto_321454 ?auto_321458 ) ( ON ?auto_321454 ?auto_321461 ) ( CLEAR ?auto_321454 ) ( not ( = ?auto_321457 ?auto_321461 ) ) ( not ( = ?auto_321454 ?auto_321461 ) ) ( not ( = ?auto_321456 ?auto_321461 ) ) ( SURFACE-AT ?auto_321456 ?auto_321464 ) ( CLEAR ?auto_321456 ) ( IS-CRATE ?auto_321457 ) ( AVAILABLE ?auto_321460 ) ( AVAILABLE ?auto_321462 ) ( SURFACE-AT ?auto_321457 ?auto_321458 ) ( ON ?auto_321457 ?auto_321459 ) ( CLEAR ?auto_321457 ) ( not ( = ?auto_321457 ?auto_321459 ) ) ( not ( = ?auto_321454 ?auto_321459 ) ) ( not ( = ?auto_321456 ?auto_321459 ) ) ( not ( = ?auto_321461 ?auto_321459 ) ) ( TRUCK-AT ?auto_321463 ?auto_321464 ) ( ON ?auto_321456 ?auto_321455 ) ( not ( = ?auto_321455 ?auto_321456 ) ) ( not ( = ?auto_321455 ?auto_321457 ) ) ( not ( = ?auto_321455 ?auto_321454 ) ) ( not ( = ?auto_321455 ?auto_321461 ) ) ( not ( = ?auto_321455 ?auto_321459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321456 ?auto_321457 ?auto_321454 )
      ( MAKE-3CRATE-VERIFY ?auto_321455 ?auto_321456 ?auto_321457 ?auto_321454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321466 - SURFACE
      ?auto_321467 - SURFACE
      ?auto_321468 - SURFACE
      ?auto_321465 - SURFACE
      ?auto_321469 - SURFACE
    )
    :vars
    (
      ?auto_321472 - HOIST
      ?auto_321476 - PLACE
      ?auto_321470 - PLACE
      ?auto_321474 - HOIST
      ?auto_321473 - SURFACE
      ?auto_321471 - SURFACE
      ?auto_321475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321472 ?auto_321476 ) ( IS-CRATE ?auto_321469 ) ( not ( = ?auto_321465 ?auto_321469 ) ) ( not ( = ?auto_321468 ?auto_321465 ) ) ( not ( = ?auto_321468 ?auto_321469 ) ) ( not ( = ?auto_321470 ?auto_321476 ) ) ( HOIST-AT ?auto_321474 ?auto_321470 ) ( not ( = ?auto_321472 ?auto_321474 ) ) ( SURFACE-AT ?auto_321469 ?auto_321470 ) ( ON ?auto_321469 ?auto_321473 ) ( CLEAR ?auto_321469 ) ( not ( = ?auto_321465 ?auto_321473 ) ) ( not ( = ?auto_321469 ?auto_321473 ) ) ( not ( = ?auto_321468 ?auto_321473 ) ) ( SURFACE-AT ?auto_321468 ?auto_321476 ) ( CLEAR ?auto_321468 ) ( IS-CRATE ?auto_321465 ) ( AVAILABLE ?auto_321472 ) ( AVAILABLE ?auto_321474 ) ( SURFACE-AT ?auto_321465 ?auto_321470 ) ( ON ?auto_321465 ?auto_321471 ) ( CLEAR ?auto_321465 ) ( not ( = ?auto_321465 ?auto_321471 ) ) ( not ( = ?auto_321469 ?auto_321471 ) ) ( not ( = ?auto_321468 ?auto_321471 ) ) ( not ( = ?auto_321473 ?auto_321471 ) ) ( TRUCK-AT ?auto_321475 ?auto_321476 ) ( ON ?auto_321467 ?auto_321466 ) ( ON ?auto_321468 ?auto_321467 ) ( not ( = ?auto_321466 ?auto_321467 ) ) ( not ( = ?auto_321466 ?auto_321468 ) ) ( not ( = ?auto_321466 ?auto_321465 ) ) ( not ( = ?auto_321466 ?auto_321469 ) ) ( not ( = ?auto_321466 ?auto_321473 ) ) ( not ( = ?auto_321466 ?auto_321471 ) ) ( not ( = ?auto_321467 ?auto_321468 ) ) ( not ( = ?auto_321467 ?auto_321465 ) ) ( not ( = ?auto_321467 ?auto_321469 ) ) ( not ( = ?auto_321467 ?auto_321473 ) ) ( not ( = ?auto_321467 ?auto_321471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321468 ?auto_321465 ?auto_321469 )
      ( MAKE-4CRATE-VERIFY ?auto_321466 ?auto_321467 ?auto_321468 ?auto_321465 ?auto_321469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_321477 - SURFACE
      ?auto_321478 - SURFACE
    )
    :vars
    (
      ?auto_321481 - HOIST
      ?auto_321486 - PLACE
      ?auto_321484 - SURFACE
      ?auto_321479 - PLACE
      ?auto_321483 - HOIST
      ?auto_321482 - SURFACE
      ?auto_321480 - SURFACE
      ?auto_321485 - TRUCK
      ?auto_321487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321481 ?auto_321486 ) ( IS-CRATE ?auto_321478 ) ( not ( = ?auto_321477 ?auto_321478 ) ) ( not ( = ?auto_321484 ?auto_321477 ) ) ( not ( = ?auto_321484 ?auto_321478 ) ) ( not ( = ?auto_321479 ?auto_321486 ) ) ( HOIST-AT ?auto_321483 ?auto_321479 ) ( not ( = ?auto_321481 ?auto_321483 ) ) ( SURFACE-AT ?auto_321478 ?auto_321479 ) ( ON ?auto_321478 ?auto_321482 ) ( CLEAR ?auto_321478 ) ( not ( = ?auto_321477 ?auto_321482 ) ) ( not ( = ?auto_321478 ?auto_321482 ) ) ( not ( = ?auto_321484 ?auto_321482 ) ) ( IS-CRATE ?auto_321477 ) ( AVAILABLE ?auto_321483 ) ( SURFACE-AT ?auto_321477 ?auto_321479 ) ( ON ?auto_321477 ?auto_321480 ) ( CLEAR ?auto_321477 ) ( not ( = ?auto_321477 ?auto_321480 ) ) ( not ( = ?auto_321478 ?auto_321480 ) ) ( not ( = ?auto_321484 ?auto_321480 ) ) ( not ( = ?auto_321482 ?auto_321480 ) ) ( TRUCK-AT ?auto_321485 ?auto_321486 ) ( SURFACE-AT ?auto_321487 ?auto_321486 ) ( CLEAR ?auto_321487 ) ( LIFTING ?auto_321481 ?auto_321484 ) ( IS-CRATE ?auto_321484 ) ( not ( = ?auto_321487 ?auto_321484 ) ) ( not ( = ?auto_321477 ?auto_321487 ) ) ( not ( = ?auto_321478 ?auto_321487 ) ) ( not ( = ?auto_321482 ?auto_321487 ) ) ( not ( = ?auto_321480 ?auto_321487 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321487 ?auto_321484 )
      ( MAKE-2CRATE ?auto_321484 ?auto_321477 ?auto_321478 )
      ( MAKE-1CRATE-VERIFY ?auto_321477 ?auto_321478 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_321488 - SURFACE
      ?auto_321489 - SURFACE
      ?auto_321490 - SURFACE
    )
    :vars
    (
      ?auto_321498 - HOIST
      ?auto_321491 - PLACE
      ?auto_321495 - PLACE
      ?auto_321493 - HOIST
      ?auto_321497 - SURFACE
      ?auto_321496 - SURFACE
      ?auto_321492 - TRUCK
      ?auto_321494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321498 ?auto_321491 ) ( IS-CRATE ?auto_321490 ) ( not ( = ?auto_321489 ?auto_321490 ) ) ( not ( = ?auto_321488 ?auto_321489 ) ) ( not ( = ?auto_321488 ?auto_321490 ) ) ( not ( = ?auto_321495 ?auto_321491 ) ) ( HOIST-AT ?auto_321493 ?auto_321495 ) ( not ( = ?auto_321498 ?auto_321493 ) ) ( SURFACE-AT ?auto_321490 ?auto_321495 ) ( ON ?auto_321490 ?auto_321497 ) ( CLEAR ?auto_321490 ) ( not ( = ?auto_321489 ?auto_321497 ) ) ( not ( = ?auto_321490 ?auto_321497 ) ) ( not ( = ?auto_321488 ?auto_321497 ) ) ( IS-CRATE ?auto_321489 ) ( AVAILABLE ?auto_321493 ) ( SURFACE-AT ?auto_321489 ?auto_321495 ) ( ON ?auto_321489 ?auto_321496 ) ( CLEAR ?auto_321489 ) ( not ( = ?auto_321489 ?auto_321496 ) ) ( not ( = ?auto_321490 ?auto_321496 ) ) ( not ( = ?auto_321488 ?auto_321496 ) ) ( not ( = ?auto_321497 ?auto_321496 ) ) ( TRUCK-AT ?auto_321492 ?auto_321491 ) ( SURFACE-AT ?auto_321494 ?auto_321491 ) ( CLEAR ?auto_321494 ) ( LIFTING ?auto_321498 ?auto_321488 ) ( IS-CRATE ?auto_321488 ) ( not ( = ?auto_321494 ?auto_321488 ) ) ( not ( = ?auto_321489 ?auto_321494 ) ) ( not ( = ?auto_321490 ?auto_321494 ) ) ( not ( = ?auto_321497 ?auto_321494 ) ) ( not ( = ?auto_321496 ?auto_321494 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321489 ?auto_321490 )
      ( MAKE-2CRATE-VERIFY ?auto_321488 ?auto_321489 ?auto_321490 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_321500 - SURFACE
      ?auto_321501 - SURFACE
      ?auto_321502 - SURFACE
      ?auto_321499 - SURFACE
    )
    :vars
    (
      ?auto_321503 - HOIST
      ?auto_321509 - PLACE
      ?auto_321504 - PLACE
      ?auto_321506 - HOIST
      ?auto_321508 - SURFACE
      ?auto_321507 - SURFACE
      ?auto_321505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321503 ?auto_321509 ) ( IS-CRATE ?auto_321499 ) ( not ( = ?auto_321502 ?auto_321499 ) ) ( not ( = ?auto_321501 ?auto_321502 ) ) ( not ( = ?auto_321501 ?auto_321499 ) ) ( not ( = ?auto_321504 ?auto_321509 ) ) ( HOIST-AT ?auto_321506 ?auto_321504 ) ( not ( = ?auto_321503 ?auto_321506 ) ) ( SURFACE-AT ?auto_321499 ?auto_321504 ) ( ON ?auto_321499 ?auto_321508 ) ( CLEAR ?auto_321499 ) ( not ( = ?auto_321502 ?auto_321508 ) ) ( not ( = ?auto_321499 ?auto_321508 ) ) ( not ( = ?auto_321501 ?auto_321508 ) ) ( IS-CRATE ?auto_321502 ) ( AVAILABLE ?auto_321506 ) ( SURFACE-AT ?auto_321502 ?auto_321504 ) ( ON ?auto_321502 ?auto_321507 ) ( CLEAR ?auto_321502 ) ( not ( = ?auto_321502 ?auto_321507 ) ) ( not ( = ?auto_321499 ?auto_321507 ) ) ( not ( = ?auto_321501 ?auto_321507 ) ) ( not ( = ?auto_321508 ?auto_321507 ) ) ( TRUCK-AT ?auto_321505 ?auto_321509 ) ( SURFACE-AT ?auto_321500 ?auto_321509 ) ( CLEAR ?auto_321500 ) ( LIFTING ?auto_321503 ?auto_321501 ) ( IS-CRATE ?auto_321501 ) ( not ( = ?auto_321500 ?auto_321501 ) ) ( not ( = ?auto_321502 ?auto_321500 ) ) ( not ( = ?auto_321499 ?auto_321500 ) ) ( not ( = ?auto_321508 ?auto_321500 ) ) ( not ( = ?auto_321507 ?auto_321500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321501 ?auto_321502 ?auto_321499 )
      ( MAKE-3CRATE-VERIFY ?auto_321500 ?auto_321501 ?auto_321502 ?auto_321499 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_321511 - SURFACE
      ?auto_321512 - SURFACE
      ?auto_321513 - SURFACE
      ?auto_321510 - SURFACE
      ?auto_321514 - SURFACE
    )
    :vars
    (
      ?auto_321515 - HOIST
      ?auto_321521 - PLACE
      ?auto_321516 - PLACE
      ?auto_321518 - HOIST
      ?auto_321520 - SURFACE
      ?auto_321519 - SURFACE
      ?auto_321517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321515 ?auto_321521 ) ( IS-CRATE ?auto_321514 ) ( not ( = ?auto_321510 ?auto_321514 ) ) ( not ( = ?auto_321513 ?auto_321510 ) ) ( not ( = ?auto_321513 ?auto_321514 ) ) ( not ( = ?auto_321516 ?auto_321521 ) ) ( HOIST-AT ?auto_321518 ?auto_321516 ) ( not ( = ?auto_321515 ?auto_321518 ) ) ( SURFACE-AT ?auto_321514 ?auto_321516 ) ( ON ?auto_321514 ?auto_321520 ) ( CLEAR ?auto_321514 ) ( not ( = ?auto_321510 ?auto_321520 ) ) ( not ( = ?auto_321514 ?auto_321520 ) ) ( not ( = ?auto_321513 ?auto_321520 ) ) ( IS-CRATE ?auto_321510 ) ( AVAILABLE ?auto_321518 ) ( SURFACE-AT ?auto_321510 ?auto_321516 ) ( ON ?auto_321510 ?auto_321519 ) ( CLEAR ?auto_321510 ) ( not ( = ?auto_321510 ?auto_321519 ) ) ( not ( = ?auto_321514 ?auto_321519 ) ) ( not ( = ?auto_321513 ?auto_321519 ) ) ( not ( = ?auto_321520 ?auto_321519 ) ) ( TRUCK-AT ?auto_321517 ?auto_321521 ) ( SURFACE-AT ?auto_321512 ?auto_321521 ) ( CLEAR ?auto_321512 ) ( LIFTING ?auto_321515 ?auto_321513 ) ( IS-CRATE ?auto_321513 ) ( not ( = ?auto_321512 ?auto_321513 ) ) ( not ( = ?auto_321510 ?auto_321512 ) ) ( not ( = ?auto_321514 ?auto_321512 ) ) ( not ( = ?auto_321520 ?auto_321512 ) ) ( not ( = ?auto_321519 ?auto_321512 ) ) ( ON ?auto_321512 ?auto_321511 ) ( not ( = ?auto_321511 ?auto_321512 ) ) ( not ( = ?auto_321511 ?auto_321513 ) ) ( not ( = ?auto_321511 ?auto_321510 ) ) ( not ( = ?auto_321511 ?auto_321514 ) ) ( not ( = ?auto_321511 ?auto_321520 ) ) ( not ( = ?auto_321511 ?auto_321519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321513 ?auto_321510 ?auto_321514 )
      ( MAKE-4CRATE-VERIFY ?auto_321511 ?auto_321512 ?auto_321513 ?auto_321510 ?auto_321514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_321793 - SURFACE
      ?auto_321794 - SURFACE
    )
    :vars
    (
      ?auto_321797 - HOIST
      ?auto_321801 - PLACE
      ?auto_321802 - SURFACE
      ?auto_321795 - PLACE
      ?auto_321799 - HOIST
      ?auto_321800 - SURFACE
      ?auto_321798 - TRUCK
      ?auto_321796 - SURFACE
      ?auto_321803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321797 ?auto_321801 ) ( IS-CRATE ?auto_321794 ) ( not ( = ?auto_321793 ?auto_321794 ) ) ( not ( = ?auto_321802 ?auto_321793 ) ) ( not ( = ?auto_321802 ?auto_321794 ) ) ( not ( = ?auto_321795 ?auto_321801 ) ) ( HOIST-AT ?auto_321799 ?auto_321795 ) ( not ( = ?auto_321797 ?auto_321799 ) ) ( SURFACE-AT ?auto_321794 ?auto_321795 ) ( ON ?auto_321794 ?auto_321800 ) ( CLEAR ?auto_321794 ) ( not ( = ?auto_321793 ?auto_321800 ) ) ( not ( = ?auto_321794 ?auto_321800 ) ) ( not ( = ?auto_321802 ?auto_321800 ) ) ( SURFACE-AT ?auto_321802 ?auto_321801 ) ( CLEAR ?auto_321802 ) ( IS-CRATE ?auto_321793 ) ( AVAILABLE ?auto_321797 ) ( TRUCK-AT ?auto_321798 ?auto_321795 ) ( SURFACE-AT ?auto_321793 ?auto_321795 ) ( ON ?auto_321793 ?auto_321796 ) ( CLEAR ?auto_321793 ) ( not ( = ?auto_321793 ?auto_321796 ) ) ( not ( = ?auto_321794 ?auto_321796 ) ) ( not ( = ?auto_321802 ?auto_321796 ) ) ( not ( = ?auto_321800 ?auto_321796 ) ) ( LIFTING ?auto_321799 ?auto_321803 ) ( IS-CRATE ?auto_321803 ) ( not ( = ?auto_321793 ?auto_321803 ) ) ( not ( = ?auto_321794 ?auto_321803 ) ) ( not ( = ?auto_321802 ?auto_321803 ) ) ( not ( = ?auto_321800 ?auto_321803 ) ) ( not ( = ?auto_321796 ?auto_321803 ) ) )
    :subtasks
    ( ( !LOAD ?auto_321799 ?auto_321803 ?auto_321798 ?auto_321795 )
      ( MAKE-2CRATE ?auto_321802 ?auto_321793 ?auto_321794 )
      ( MAKE-1CRATE-VERIFY ?auto_321793 ?auto_321794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_321804 - SURFACE
      ?auto_321805 - SURFACE
      ?auto_321806 - SURFACE
    )
    :vars
    (
      ?auto_321807 - HOIST
      ?auto_321808 - PLACE
      ?auto_321809 - PLACE
      ?auto_321811 - HOIST
      ?auto_321814 - SURFACE
      ?auto_321813 - TRUCK
      ?auto_321812 - SURFACE
      ?auto_321810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321807 ?auto_321808 ) ( IS-CRATE ?auto_321806 ) ( not ( = ?auto_321805 ?auto_321806 ) ) ( not ( = ?auto_321804 ?auto_321805 ) ) ( not ( = ?auto_321804 ?auto_321806 ) ) ( not ( = ?auto_321809 ?auto_321808 ) ) ( HOIST-AT ?auto_321811 ?auto_321809 ) ( not ( = ?auto_321807 ?auto_321811 ) ) ( SURFACE-AT ?auto_321806 ?auto_321809 ) ( ON ?auto_321806 ?auto_321814 ) ( CLEAR ?auto_321806 ) ( not ( = ?auto_321805 ?auto_321814 ) ) ( not ( = ?auto_321806 ?auto_321814 ) ) ( not ( = ?auto_321804 ?auto_321814 ) ) ( SURFACE-AT ?auto_321804 ?auto_321808 ) ( CLEAR ?auto_321804 ) ( IS-CRATE ?auto_321805 ) ( AVAILABLE ?auto_321807 ) ( TRUCK-AT ?auto_321813 ?auto_321809 ) ( SURFACE-AT ?auto_321805 ?auto_321809 ) ( ON ?auto_321805 ?auto_321812 ) ( CLEAR ?auto_321805 ) ( not ( = ?auto_321805 ?auto_321812 ) ) ( not ( = ?auto_321806 ?auto_321812 ) ) ( not ( = ?auto_321804 ?auto_321812 ) ) ( not ( = ?auto_321814 ?auto_321812 ) ) ( LIFTING ?auto_321811 ?auto_321810 ) ( IS-CRATE ?auto_321810 ) ( not ( = ?auto_321805 ?auto_321810 ) ) ( not ( = ?auto_321806 ?auto_321810 ) ) ( not ( = ?auto_321804 ?auto_321810 ) ) ( not ( = ?auto_321814 ?auto_321810 ) ) ( not ( = ?auto_321812 ?auto_321810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321805 ?auto_321806 )
      ( MAKE-2CRATE-VERIFY ?auto_321804 ?auto_321805 ?auto_321806 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321946 - SURFACE
      ?auto_321947 - SURFACE
      ?auto_321948 - SURFACE
      ?auto_321945 - SURFACE
      ?auto_321949 - SURFACE
      ?auto_321950 - SURFACE
    )
    :vars
    (
      ?auto_321951 - HOIST
      ?auto_321952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321951 ?auto_321952 ) ( SURFACE-AT ?auto_321949 ?auto_321952 ) ( CLEAR ?auto_321949 ) ( LIFTING ?auto_321951 ?auto_321950 ) ( IS-CRATE ?auto_321950 ) ( not ( = ?auto_321949 ?auto_321950 ) ) ( ON ?auto_321947 ?auto_321946 ) ( ON ?auto_321948 ?auto_321947 ) ( ON ?auto_321945 ?auto_321948 ) ( ON ?auto_321949 ?auto_321945 ) ( not ( = ?auto_321946 ?auto_321947 ) ) ( not ( = ?auto_321946 ?auto_321948 ) ) ( not ( = ?auto_321946 ?auto_321945 ) ) ( not ( = ?auto_321946 ?auto_321949 ) ) ( not ( = ?auto_321946 ?auto_321950 ) ) ( not ( = ?auto_321947 ?auto_321948 ) ) ( not ( = ?auto_321947 ?auto_321945 ) ) ( not ( = ?auto_321947 ?auto_321949 ) ) ( not ( = ?auto_321947 ?auto_321950 ) ) ( not ( = ?auto_321948 ?auto_321945 ) ) ( not ( = ?auto_321948 ?auto_321949 ) ) ( not ( = ?auto_321948 ?auto_321950 ) ) ( not ( = ?auto_321945 ?auto_321949 ) ) ( not ( = ?auto_321945 ?auto_321950 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321949 ?auto_321950 )
      ( MAKE-5CRATE-VERIFY ?auto_321946 ?auto_321947 ?auto_321948 ?auto_321945 ?auto_321949 ?auto_321950 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321980 - SURFACE
      ?auto_321981 - SURFACE
      ?auto_321982 - SURFACE
      ?auto_321979 - SURFACE
      ?auto_321983 - SURFACE
      ?auto_321984 - SURFACE
    )
    :vars
    (
      ?auto_321987 - HOIST
      ?auto_321986 - PLACE
      ?auto_321985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321987 ?auto_321986 ) ( SURFACE-AT ?auto_321983 ?auto_321986 ) ( CLEAR ?auto_321983 ) ( IS-CRATE ?auto_321984 ) ( not ( = ?auto_321983 ?auto_321984 ) ) ( TRUCK-AT ?auto_321985 ?auto_321986 ) ( AVAILABLE ?auto_321987 ) ( IN ?auto_321984 ?auto_321985 ) ( ON ?auto_321983 ?auto_321979 ) ( not ( = ?auto_321979 ?auto_321983 ) ) ( not ( = ?auto_321979 ?auto_321984 ) ) ( ON ?auto_321981 ?auto_321980 ) ( ON ?auto_321982 ?auto_321981 ) ( ON ?auto_321979 ?auto_321982 ) ( not ( = ?auto_321980 ?auto_321981 ) ) ( not ( = ?auto_321980 ?auto_321982 ) ) ( not ( = ?auto_321980 ?auto_321979 ) ) ( not ( = ?auto_321980 ?auto_321983 ) ) ( not ( = ?auto_321980 ?auto_321984 ) ) ( not ( = ?auto_321981 ?auto_321982 ) ) ( not ( = ?auto_321981 ?auto_321979 ) ) ( not ( = ?auto_321981 ?auto_321983 ) ) ( not ( = ?auto_321981 ?auto_321984 ) ) ( not ( = ?auto_321982 ?auto_321979 ) ) ( not ( = ?auto_321982 ?auto_321983 ) ) ( not ( = ?auto_321982 ?auto_321984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321979 ?auto_321983 ?auto_321984 )
      ( MAKE-5CRATE-VERIFY ?auto_321980 ?auto_321981 ?auto_321982 ?auto_321979 ?auto_321983 ?auto_321984 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322020 - SURFACE
      ?auto_322021 - SURFACE
      ?auto_322022 - SURFACE
      ?auto_322019 - SURFACE
      ?auto_322023 - SURFACE
      ?auto_322024 - SURFACE
    )
    :vars
    (
      ?auto_322025 - HOIST
      ?auto_322027 - PLACE
      ?auto_322028 - TRUCK
      ?auto_322026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322025 ?auto_322027 ) ( SURFACE-AT ?auto_322023 ?auto_322027 ) ( CLEAR ?auto_322023 ) ( IS-CRATE ?auto_322024 ) ( not ( = ?auto_322023 ?auto_322024 ) ) ( AVAILABLE ?auto_322025 ) ( IN ?auto_322024 ?auto_322028 ) ( ON ?auto_322023 ?auto_322019 ) ( not ( = ?auto_322019 ?auto_322023 ) ) ( not ( = ?auto_322019 ?auto_322024 ) ) ( TRUCK-AT ?auto_322028 ?auto_322026 ) ( not ( = ?auto_322026 ?auto_322027 ) ) ( ON ?auto_322021 ?auto_322020 ) ( ON ?auto_322022 ?auto_322021 ) ( ON ?auto_322019 ?auto_322022 ) ( not ( = ?auto_322020 ?auto_322021 ) ) ( not ( = ?auto_322020 ?auto_322022 ) ) ( not ( = ?auto_322020 ?auto_322019 ) ) ( not ( = ?auto_322020 ?auto_322023 ) ) ( not ( = ?auto_322020 ?auto_322024 ) ) ( not ( = ?auto_322021 ?auto_322022 ) ) ( not ( = ?auto_322021 ?auto_322019 ) ) ( not ( = ?auto_322021 ?auto_322023 ) ) ( not ( = ?auto_322021 ?auto_322024 ) ) ( not ( = ?auto_322022 ?auto_322019 ) ) ( not ( = ?auto_322022 ?auto_322023 ) ) ( not ( = ?auto_322022 ?auto_322024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322019 ?auto_322023 ?auto_322024 )
      ( MAKE-5CRATE-VERIFY ?auto_322020 ?auto_322021 ?auto_322022 ?auto_322019 ?auto_322023 ?auto_322024 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322065 - SURFACE
      ?auto_322066 - SURFACE
      ?auto_322067 - SURFACE
      ?auto_322064 - SURFACE
      ?auto_322068 - SURFACE
      ?auto_322069 - SURFACE
    )
    :vars
    (
      ?auto_322073 - HOIST
      ?auto_322072 - PLACE
      ?auto_322074 - TRUCK
      ?auto_322070 - PLACE
      ?auto_322071 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_322073 ?auto_322072 ) ( SURFACE-AT ?auto_322068 ?auto_322072 ) ( CLEAR ?auto_322068 ) ( IS-CRATE ?auto_322069 ) ( not ( = ?auto_322068 ?auto_322069 ) ) ( AVAILABLE ?auto_322073 ) ( ON ?auto_322068 ?auto_322064 ) ( not ( = ?auto_322064 ?auto_322068 ) ) ( not ( = ?auto_322064 ?auto_322069 ) ) ( TRUCK-AT ?auto_322074 ?auto_322070 ) ( not ( = ?auto_322070 ?auto_322072 ) ) ( HOIST-AT ?auto_322071 ?auto_322070 ) ( LIFTING ?auto_322071 ?auto_322069 ) ( not ( = ?auto_322073 ?auto_322071 ) ) ( ON ?auto_322066 ?auto_322065 ) ( ON ?auto_322067 ?auto_322066 ) ( ON ?auto_322064 ?auto_322067 ) ( not ( = ?auto_322065 ?auto_322066 ) ) ( not ( = ?auto_322065 ?auto_322067 ) ) ( not ( = ?auto_322065 ?auto_322064 ) ) ( not ( = ?auto_322065 ?auto_322068 ) ) ( not ( = ?auto_322065 ?auto_322069 ) ) ( not ( = ?auto_322066 ?auto_322067 ) ) ( not ( = ?auto_322066 ?auto_322064 ) ) ( not ( = ?auto_322066 ?auto_322068 ) ) ( not ( = ?auto_322066 ?auto_322069 ) ) ( not ( = ?auto_322067 ?auto_322064 ) ) ( not ( = ?auto_322067 ?auto_322068 ) ) ( not ( = ?auto_322067 ?auto_322069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322064 ?auto_322068 ?auto_322069 )
      ( MAKE-5CRATE-VERIFY ?auto_322065 ?auto_322066 ?auto_322067 ?auto_322064 ?auto_322068 ?auto_322069 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322115 - SURFACE
      ?auto_322116 - SURFACE
      ?auto_322117 - SURFACE
      ?auto_322114 - SURFACE
      ?auto_322118 - SURFACE
      ?auto_322119 - SURFACE
    )
    :vars
    (
      ?auto_322123 - HOIST
      ?auto_322121 - PLACE
      ?auto_322125 - TRUCK
      ?auto_322120 - PLACE
      ?auto_322122 - HOIST
      ?auto_322124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322123 ?auto_322121 ) ( SURFACE-AT ?auto_322118 ?auto_322121 ) ( CLEAR ?auto_322118 ) ( IS-CRATE ?auto_322119 ) ( not ( = ?auto_322118 ?auto_322119 ) ) ( AVAILABLE ?auto_322123 ) ( ON ?auto_322118 ?auto_322114 ) ( not ( = ?auto_322114 ?auto_322118 ) ) ( not ( = ?auto_322114 ?auto_322119 ) ) ( TRUCK-AT ?auto_322125 ?auto_322120 ) ( not ( = ?auto_322120 ?auto_322121 ) ) ( HOIST-AT ?auto_322122 ?auto_322120 ) ( not ( = ?auto_322123 ?auto_322122 ) ) ( AVAILABLE ?auto_322122 ) ( SURFACE-AT ?auto_322119 ?auto_322120 ) ( ON ?auto_322119 ?auto_322124 ) ( CLEAR ?auto_322119 ) ( not ( = ?auto_322118 ?auto_322124 ) ) ( not ( = ?auto_322119 ?auto_322124 ) ) ( not ( = ?auto_322114 ?auto_322124 ) ) ( ON ?auto_322116 ?auto_322115 ) ( ON ?auto_322117 ?auto_322116 ) ( ON ?auto_322114 ?auto_322117 ) ( not ( = ?auto_322115 ?auto_322116 ) ) ( not ( = ?auto_322115 ?auto_322117 ) ) ( not ( = ?auto_322115 ?auto_322114 ) ) ( not ( = ?auto_322115 ?auto_322118 ) ) ( not ( = ?auto_322115 ?auto_322119 ) ) ( not ( = ?auto_322115 ?auto_322124 ) ) ( not ( = ?auto_322116 ?auto_322117 ) ) ( not ( = ?auto_322116 ?auto_322114 ) ) ( not ( = ?auto_322116 ?auto_322118 ) ) ( not ( = ?auto_322116 ?auto_322119 ) ) ( not ( = ?auto_322116 ?auto_322124 ) ) ( not ( = ?auto_322117 ?auto_322114 ) ) ( not ( = ?auto_322117 ?auto_322118 ) ) ( not ( = ?auto_322117 ?auto_322119 ) ) ( not ( = ?auto_322117 ?auto_322124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322114 ?auto_322118 ?auto_322119 )
      ( MAKE-5CRATE-VERIFY ?auto_322115 ?auto_322116 ?auto_322117 ?auto_322114 ?auto_322118 ?auto_322119 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322166 - SURFACE
      ?auto_322167 - SURFACE
      ?auto_322168 - SURFACE
      ?auto_322165 - SURFACE
      ?auto_322169 - SURFACE
      ?auto_322170 - SURFACE
    )
    :vars
    (
      ?auto_322172 - HOIST
      ?auto_322176 - PLACE
      ?auto_322175 - PLACE
      ?auto_322174 - HOIST
      ?auto_322171 - SURFACE
      ?auto_322173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322172 ?auto_322176 ) ( SURFACE-AT ?auto_322169 ?auto_322176 ) ( CLEAR ?auto_322169 ) ( IS-CRATE ?auto_322170 ) ( not ( = ?auto_322169 ?auto_322170 ) ) ( AVAILABLE ?auto_322172 ) ( ON ?auto_322169 ?auto_322165 ) ( not ( = ?auto_322165 ?auto_322169 ) ) ( not ( = ?auto_322165 ?auto_322170 ) ) ( not ( = ?auto_322175 ?auto_322176 ) ) ( HOIST-AT ?auto_322174 ?auto_322175 ) ( not ( = ?auto_322172 ?auto_322174 ) ) ( AVAILABLE ?auto_322174 ) ( SURFACE-AT ?auto_322170 ?auto_322175 ) ( ON ?auto_322170 ?auto_322171 ) ( CLEAR ?auto_322170 ) ( not ( = ?auto_322169 ?auto_322171 ) ) ( not ( = ?auto_322170 ?auto_322171 ) ) ( not ( = ?auto_322165 ?auto_322171 ) ) ( TRUCK-AT ?auto_322173 ?auto_322176 ) ( ON ?auto_322167 ?auto_322166 ) ( ON ?auto_322168 ?auto_322167 ) ( ON ?auto_322165 ?auto_322168 ) ( not ( = ?auto_322166 ?auto_322167 ) ) ( not ( = ?auto_322166 ?auto_322168 ) ) ( not ( = ?auto_322166 ?auto_322165 ) ) ( not ( = ?auto_322166 ?auto_322169 ) ) ( not ( = ?auto_322166 ?auto_322170 ) ) ( not ( = ?auto_322166 ?auto_322171 ) ) ( not ( = ?auto_322167 ?auto_322168 ) ) ( not ( = ?auto_322167 ?auto_322165 ) ) ( not ( = ?auto_322167 ?auto_322169 ) ) ( not ( = ?auto_322167 ?auto_322170 ) ) ( not ( = ?auto_322167 ?auto_322171 ) ) ( not ( = ?auto_322168 ?auto_322165 ) ) ( not ( = ?auto_322168 ?auto_322169 ) ) ( not ( = ?auto_322168 ?auto_322170 ) ) ( not ( = ?auto_322168 ?auto_322171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322165 ?auto_322169 ?auto_322170 )
      ( MAKE-5CRATE-VERIFY ?auto_322166 ?auto_322167 ?auto_322168 ?auto_322165 ?auto_322169 ?auto_322170 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322217 - SURFACE
      ?auto_322218 - SURFACE
      ?auto_322219 - SURFACE
      ?auto_322216 - SURFACE
      ?auto_322220 - SURFACE
      ?auto_322221 - SURFACE
    )
    :vars
    (
      ?auto_322226 - HOIST
      ?auto_322227 - PLACE
      ?auto_322223 - PLACE
      ?auto_322225 - HOIST
      ?auto_322222 - SURFACE
      ?auto_322224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322226 ?auto_322227 ) ( IS-CRATE ?auto_322221 ) ( not ( = ?auto_322220 ?auto_322221 ) ) ( not ( = ?auto_322216 ?auto_322220 ) ) ( not ( = ?auto_322216 ?auto_322221 ) ) ( not ( = ?auto_322223 ?auto_322227 ) ) ( HOIST-AT ?auto_322225 ?auto_322223 ) ( not ( = ?auto_322226 ?auto_322225 ) ) ( AVAILABLE ?auto_322225 ) ( SURFACE-AT ?auto_322221 ?auto_322223 ) ( ON ?auto_322221 ?auto_322222 ) ( CLEAR ?auto_322221 ) ( not ( = ?auto_322220 ?auto_322222 ) ) ( not ( = ?auto_322221 ?auto_322222 ) ) ( not ( = ?auto_322216 ?auto_322222 ) ) ( TRUCK-AT ?auto_322224 ?auto_322227 ) ( SURFACE-AT ?auto_322216 ?auto_322227 ) ( CLEAR ?auto_322216 ) ( LIFTING ?auto_322226 ?auto_322220 ) ( IS-CRATE ?auto_322220 ) ( ON ?auto_322218 ?auto_322217 ) ( ON ?auto_322219 ?auto_322218 ) ( ON ?auto_322216 ?auto_322219 ) ( not ( = ?auto_322217 ?auto_322218 ) ) ( not ( = ?auto_322217 ?auto_322219 ) ) ( not ( = ?auto_322217 ?auto_322216 ) ) ( not ( = ?auto_322217 ?auto_322220 ) ) ( not ( = ?auto_322217 ?auto_322221 ) ) ( not ( = ?auto_322217 ?auto_322222 ) ) ( not ( = ?auto_322218 ?auto_322219 ) ) ( not ( = ?auto_322218 ?auto_322216 ) ) ( not ( = ?auto_322218 ?auto_322220 ) ) ( not ( = ?auto_322218 ?auto_322221 ) ) ( not ( = ?auto_322218 ?auto_322222 ) ) ( not ( = ?auto_322219 ?auto_322216 ) ) ( not ( = ?auto_322219 ?auto_322220 ) ) ( not ( = ?auto_322219 ?auto_322221 ) ) ( not ( = ?auto_322219 ?auto_322222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322216 ?auto_322220 ?auto_322221 )
      ( MAKE-5CRATE-VERIFY ?auto_322217 ?auto_322218 ?auto_322219 ?auto_322216 ?auto_322220 ?auto_322221 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322268 - SURFACE
      ?auto_322269 - SURFACE
      ?auto_322270 - SURFACE
      ?auto_322267 - SURFACE
      ?auto_322271 - SURFACE
      ?auto_322272 - SURFACE
    )
    :vars
    (
      ?auto_322275 - HOIST
      ?auto_322278 - PLACE
      ?auto_322277 - PLACE
      ?auto_322273 - HOIST
      ?auto_322276 - SURFACE
      ?auto_322274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322275 ?auto_322278 ) ( IS-CRATE ?auto_322272 ) ( not ( = ?auto_322271 ?auto_322272 ) ) ( not ( = ?auto_322267 ?auto_322271 ) ) ( not ( = ?auto_322267 ?auto_322272 ) ) ( not ( = ?auto_322277 ?auto_322278 ) ) ( HOIST-AT ?auto_322273 ?auto_322277 ) ( not ( = ?auto_322275 ?auto_322273 ) ) ( AVAILABLE ?auto_322273 ) ( SURFACE-AT ?auto_322272 ?auto_322277 ) ( ON ?auto_322272 ?auto_322276 ) ( CLEAR ?auto_322272 ) ( not ( = ?auto_322271 ?auto_322276 ) ) ( not ( = ?auto_322272 ?auto_322276 ) ) ( not ( = ?auto_322267 ?auto_322276 ) ) ( TRUCK-AT ?auto_322274 ?auto_322278 ) ( SURFACE-AT ?auto_322267 ?auto_322278 ) ( CLEAR ?auto_322267 ) ( IS-CRATE ?auto_322271 ) ( AVAILABLE ?auto_322275 ) ( IN ?auto_322271 ?auto_322274 ) ( ON ?auto_322269 ?auto_322268 ) ( ON ?auto_322270 ?auto_322269 ) ( ON ?auto_322267 ?auto_322270 ) ( not ( = ?auto_322268 ?auto_322269 ) ) ( not ( = ?auto_322268 ?auto_322270 ) ) ( not ( = ?auto_322268 ?auto_322267 ) ) ( not ( = ?auto_322268 ?auto_322271 ) ) ( not ( = ?auto_322268 ?auto_322272 ) ) ( not ( = ?auto_322268 ?auto_322276 ) ) ( not ( = ?auto_322269 ?auto_322270 ) ) ( not ( = ?auto_322269 ?auto_322267 ) ) ( not ( = ?auto_322269 ?auto_322271 ) ) ( not ( = ?auto_322269 ?auto_322272 ) ) ( not ( = ?auto_322269 ?auto_322276 ) ) ( not ( = ?auto_322270 ?auto_322267 ) ) ( not ( = ?auto_322270 ?auto_322271 ) ) ( not ( = ?auto_322270 ?auto_322272 ) ) ( not ( = ?auto_322270 ?auto_322276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322267 ?auto_322271 ?auto_322272 )
      ( MAKE-5CRATE-VERIFY ?auto_322268 ?auto_322269 ?auto_322270 ?auto_322267 ?auto_322271 ?auto_322272 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322319 - SURFACE
      ?auto_322320 - SURFACE
      ?auto_322321 - SURFACE
      ?auto_322318 - SURFACE
      ?auto_322322 - SURFACE
      ?auto_322323 - SURFACE
    )
    :vars
    (
      ?auto_322329 - HOIST
      ?auto_322327 - PLACE
      ?auto_322326 - PLACE
      ?auto_322328 - HOIST
      ?auto_322324 - SURFACE
      ?auto_322325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322329 ?auto_322327 ) ( IS-CRATE ?auto_322323 ) ( not ( = ?auto_322322 ?auto_322323 ) ) ( not ( = ?auto_322318 ?auto_322322 ) ) ( not ( = ?auto_322318 ?auto_322323 ) ) ( not ( = ?auto_322326 ?auto_322327 ) ) ( HOIST-AT ?auto_322328 ?auto_322326 ) ( not ( = ?auto_322329 ?auto_322328 ) ) ( AVAILABLE ?auto_322328 ) ( SURFACE-AT ?auto_322323 ?auto_322326 ) ( ON ?auto_322323 ?auto_322324 ) ( CLEAR ?auto_322323 ) ( not ( = ?auto_322322 ?auto_322324 ) ) ( not ( = ?auto_322323 ?auto_322324 ) ) ( not ( = ?auto_322318 ?auto_322324 ) ) ( SURFACE-AT ?auto_322318 ?auto_322327 ) ( CLEAR ?auto_322318 ) ( IS-CRATE ?auto_322322 ) ( AVAILABLE ?auto_322329 ) ( IN ?auto_322322 ?auto_322325 ) ( TRUCK-AT ?auto_322325 ?auto_322326 ) ( ON ?auto_322320 ?auto_322319 ) ( ON ?auto_322321 ?auto_322320 ) ( ON ?auto_322318 ?auto_322321 ) ( not ( = ?auto_322319 ?auto_322320 ) ) ( not ( = ?auto_322319 ?auto_322321 ) ) ( not ( = ?auto_322319 ?auto_322318 ) ) ( not ( = ?auto_322319 ?auto_322322 ) ) ( not ( = ?auto_322319 ?auto_322323 ) ) ( not ( = ?auto_322319 ?auto_322324 ) ) ( not ( = ?auto_322320 ?auto_322321 ) ) ( not ( = ?auto_322320 ?auto_322318 ) ) ( not ( = ?auto_322320 ?auto_322322 ) ) ( not ( = ?auto_322320 ?auto_322323 ) ) ( not ( = ?auto_322320 ?auto_322324 ) ) ( not ( = ?auto_322321 ?auto_322318 ) ) ( not ( = ?auto_322321 ?auto_322322 ) ) ( not ( = ?auto_322321 ?auto_322323 ) ) ( not ( = ?auto_322321 ?auto_322324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322318 ?auto_322322 ?auto_322323 )
      ( MAKE-5CRATE-VERIFY ?auto_322319 ?auto_322320 ?auto_322321 ?auto_322318 ?auto_322322 ?auto_322323 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322370 - SURFACE
      ?auto_322371 - SURFACE
      ?auto_322372 - SURFACE
      ?auto_322369 - SURFACE
      ?auto_322373 - SURFACE
      ?auto_322374 - SURFACE
    )
    :vars
    (
      ?auto_322375 - HOIST
      ?auto_322380 - PLACE
      ?auto_322379 - PLACE
      ?auto_322377 - HOIST
      ?auto_322378 - SURFACE
      ?auto_322376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322375 ?auto_322380 ) ( IS-CRATE ?auto_322374 ) ( not ( = ?auto_322373 ?auto_322374 ) ) ( not ( = ?auto_322369 ?auto_322373 ) ) ( not ( = ?auto_322369 ?auto_322374 ) ) ( not ( = ?auto_322379 ?auto_322380 ) ) ( HOIST-AT ?auto_322377 ?auto_322379 ) ( not ( = ?auto_322375 ?auto_322377 ) ) ( SURFACE-AT ?auto_322374 ?auto_322379 ) ( ON ?auto_322374 ?auto_322378 ) ( CLEAR ?auto_322374 ) ( not ( = ?auto_322373 ?auto_322378 ) ) ( not ( = ?auto_322374 ?auto_322378 ) ) ( not ( = ?auto_322369 ?auto_322378 ) ) ( SURFACE-AT ?auto_322369 ?auto_322380 ) ( CLEAR ?auto_322369 ) ( IS-CRATE ?auto_322373 ) ( AVAILABLE ?auto_322375 ) ( TRUCK-AT ?auto_322376 ?auto_322379 ) ( LIFTING ?auto_322377 ?auto_322373 ) ( ON ?auto_322371 ?auto_322370 ) ( ON ?auto_322372 ?auto_322371 ) ( ON ?auto_322369 ?auto_322372 ) ( not ( = ?auto_322370 ?auto_322371 ) ) ( not ( = ?auto_322370 ?auto_322372 ) ) ( not ( = ?auto_322370 ?auto_322369 ) ) ( not ( = ?auto_322370 ?auto_322373 ) ) ( not ( = ?auto_322370 ?auto_322374 ) ) ( not ( = ?auto_322370 ?auto_322378 ) ) ( not ( = ?auto_322371 ?auto_322372 ) ) ( not ( = ?auto_322371 ?auto_322369 ) ) ( not ( = ?auto_322371 ?auto_322373 ) ) ( not ( = ?auto_322371 ?auto_322374 ) ) ( not ( = ?auto_322371 ?auto_322378 ) ) ( not ( = ?auto_322372 ?auto_322369 ) ) ( not ( = ?auto_322372 ?auto_322373 ) ) ( not ( = ?auto_322372 ?auto_322374 ) ) ( not ( = ?auto_322372 ?auto_322378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322369 ?auto_322373 ?auto_322374 )
      ( MAKE-5CRATE-VERIFY ?auto_322370 ?auto_322371 ?auto_322372 ?auto_322369 ?auto_322373 ?auto_322374 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322425 - SURFACE
      ?auto_322426 - SURFACE
      ?auto_322427 - SURFACE
      ?auto_322424 - SURFACE
      ?auto_322428 - SURFACE
      ?auto_322429 - SURFACE
    )
    :vars
    (
      ?auto_322430 - HOIST
      ?auto_322434 - PLACE
      ?auto_322435 - PLACE
      ?auto_322432 - HOIST
      ?auto_322436 - SURFACE
      ?auto_322433 - TRUCK
      ?auto_322431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322430 ?auto_322434 ) ( IS-CRATE ?auto_322429 ) ( not ( = ?auto_322428 ?auto_322429 ) ) ( not ( = ?auto_322424 ?auto_322428 ) ) ( not ( = ?auto_322424 ?auto_322429 ) ) ( not ( = ?auto_322435 ?auto_322434 ) ) ( HOIST-AT ?auto_322432 ?auto_322435 ) ( not ( = ?auto_322430 ?auto_322432 ) ) ( SURFACE-AT ?auto_322429 ?auto_322435 ) ( ON ?auto_322429 ?auto_322436 ) ( CLEAR ?auto_322429 ) ( not ( = ?auto_322428 ?auto_322436 ) ) ( not ( = ?auto_322429 ?auto_322436 ) ) ( not ( = ?auto_322424 ?auto_322436 ) ) ( SURFACE-AT ?auto_322424 ?auto_322434 ) ( CLEAR ?auto_322424 ) ( IS-CRATE ?auto_322428 ) ( AVAILABLE ?auto_322430 ) ( TRUCK-AT ?auto_322433 ?auto_322435 ) ( AVAILABLE ?auto_322432 ) ( SURFACE-AT ?auto_322428 ?auto_322435 ) ( ON ?auto_322428 ?auto_322431 ) ( CLEAR ?auto_322428 ) ( not ( = ?auto_322428 ?auto_322431 ) ) ( not ( = ?auto_322429 ?auto_322431 ) ) ( not ( = ?auto_322424 ?auto_322431 ) ) ( not ( = ?auto_322436 ?auto_322431 ) ) ( ON ?auto_322426 ?auto_322425 ) ( ON ?auto_322427 ?auto_322426 ) ( ON ?auto_322424 ?auto_322427 ) ( not ( = ?auto_322425 ?auto_322426 ) ) ( not ( = ?auto_322425 ?auto_322427 ) ) ( not ( = ?auto_322425 ?auto_322424 ) ) ( not ( = ?auto_322425 ?auto_322428 ) ) ( not ( = ?auto_322425 ?auto_322429 ) ) ( not ( = ?auto_322425 ?auto_322436 ) ) ( not ( = ?auto_322425 ?auto_322431 ) ) ( not ( = ?auto_322426 ?auto_322427 ) ) ( not ( = ?auto_322426 ?auto_322424 ) ) ( not ( = ?auto_322426 ?auto_322428 ) ) ( not ( = ?auto_322426 ?auto_322429 ) ) ( not ( = ?auto_322426 ?auto_322436 ) ) ( not ( = ?auto_322426 ?auto_322431 ) ) ( not ( = ?auto_322427 ?auto_322424 ) ) ( not ( = ?auto_322427 ?auto_322428 ) ) ( not ( = ?auto_322427 ?auto_322429 ) ) ( not ( = ?auto_322427 ?auto_322436 ) ) ( not ( = ?auto_322427 ?auto_322431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322424 ?auto_322428 ?auto_322429 )
      ( MAKE-5CRATE-VERIFY ?auto_322425 ?auto_322426 ?auto_322427 ?auto_322424 ?auto_322428 ?auto_322429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322481 - SURFACE
      ?auto_322482 - SURFACE
      ?auto_322483 - SURFACE
      ?auto_322480 - SURFACE
      ?auto_322484 - SURFACE
      ?auto_322485 - SURFACE
    )
    :vars
    (
      ?auto_322492 - HOIST
      ?auto_322487 - PLACE
      ?auto_322488 - PLACE
      ?auto_322490 - HOIST
      ?auto_322489 - SURFACE
      ?auto_322486 - SURFACE
      ?auto_322491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322492 ?auto_322487 ) ( IS-CRATE ?auto_322485 ) ( not ( = ?auto_322484 ?auto_322485 ) ) ( not ( = ?auto_322480 ?auto_322484 ) ) ( not ( = ?auto_322480 ?auto_322485 ) ) ( not ( = ?auto_322488 ?auto_322487 ) ) ( HOIST-AT ?auto_322490 ?auto_322488 ) ( not ( = ?auto_322492 ?auto_322490 ) ) ( SURFACE-AT ?auto_322485 ?auto_322488 ) ( ON ?auto_322485 ?auto_322489 ) ( CLEAR ?auto_322485 ) ( not ( = ?auto_322484 ?auto_322489 ) ) ( not ( = ?auto_322485 ?auto_322489 ) ) ( not ( = ?auto_322480 ?auto_322489 ) ) ( SURFACE-AT ?auto_322480 ?auto_322487 ) ( CLEAR ?auto_322480 ) ( IS-CRATE ?auto_322484 ) ( AVAILABLE ?auto_322492 ) ( AVAILABLE ?auto_322490 ) ( SURFACE-AT ?auto_322484 ?auto_322488 ) ( ON ?auto_322484 ?auto_322486 ) ( CLEAR ?auto_322484 ) ( not ( = ?auto_322484 ?auto_322486 ) ) ( not ( = ?auto_322485 ?auto_322486 ) ) ( not ( = ?auto_322480 ?auto_322486 ) ) ( not ( = ?auto_322489 ?auto_322486 ) ) ( TRUCK-AT ?auto_322491 ?auto_322487 ) ( ON ?auto_322482 ?auto_322481 ) ( ON ?auto_322483 ?auto_322482 ) ( ON ?auto_322480 ?auto_322483 ) ( not ( = ?auto_322481 ?auto_322482 ) ) ( not ( = ?auto_322481 ?auto_322483 ) ) ( not ( = ?auto_322481 ?auto_322480 ) ) ( not ( = ?auto_322481 ?auto_322484 ) ) ( not ( = ?auto_322481 ?auto_322485 ) ) ( not ( = ?auto_322481 ?auto_322489 ) ) ( not ( = ?auto_322481 ?auto_322486 ) ) ( not ( = ?auto_322482 ?auto_322483 ) ) ( not ( = ?auto_322482 ?auto_322480 ) ) ( not ( = ?auto_322482 ?auto_322484 ) ) ( not ( = ?auto_322482 ?auto_322485 ) ) ( not ( = ?auto_322482 ?auto_322489 ) ) ( not ( = ?auto_322482 ?auto_322486 ) ) ( not ( = ?auto_322483 ?auto_322480 ) ) ( not ( = ?auto_322483 ?auto_322484 ) ) ( not ( = ?auto_322483 ?auto_322485 ) ) ( not ( = ?auto_322483 ?auto_322489 ) ) ( not ( = ?auto_322483 ?auto_322486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322480 ?auto_322484 ?auto_322485 )
      ( MAKE-5CRATE-VERIFY ?auto_322481 ?auto_322482 ?auto_322483 ?auto_322480 ?auto_322484 ?auto_322485 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_322539 - SURFACE
      ?auto_322540 - SURFACE
      ?auto_322541 - SURFACE
      ?auto_322538 - SURFACE
      ?auto_322542 - SURFACE
      ?auto_322543 - SURFACE
    )
    :vars
    (
      ?auto_322545 - HOIST
      ?auto_322550 - PLACE
      ?auto_322548 - PLACE
      ?auto_322544 - HOIST
      ?auto_322547 - SURFACE
      ?auto_322549 - SURFACE
      ?auto_322546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322545 ?auto_322550 ) ( IS-CRATE ?auto_322543 ) ( not ( = ?auto_322542 ?auto_322543 ) ) ( not ( = ?auto_322538 ?auto_322542 ) ) ( not ( = ?auto_322538 ?auto_322543 ) ) ( not ( = ?auto_322548 ?auto_322550 ) ) ( HOIST-AT ?auto_322544 ?auto_322548 ) ( not ( = ?auto_322545 ?auto_322544 ) ) ( SURFACE-AT ?auto_322543 ?auto_322548 ) ( ON ?auto_322543 ?auto_322547 ) ( CLEAR ?auto_322543 ) ( not ( = ?auto_322542 ?auto_322547 ) ) ( not ( = ?auto_322543 ?auto_322547 ) ) ( not ( = ?auto_322538 ?auto_322547 ) ) ( IS-CRATE ?auto_322542 ) ( AVAILABLE ?auto_322544 ) ( SURFACE-AT ?auto_322542 ?auto_322548 ) ( ON ?auto_322542 ?auto_322549 ) ( CLEAR ?auto_322542 ) ( not ( = ?auto_322542 ?auto_322549 ) ) ( not ( = ?auto_322543 ?auto_322549 ) ) ( not ( = ?auto_322538 ?auto_322549 ) ) ( not ( = ?auto_322547 ?auto_322549 ) ) ( TRUCK-AT ?auto_322546 ?auto_322550 ) ( SURFACE-AT ?auto_322541 ?auto_322550 ) ( CLEAR ?auto_322541 ) ( LIFTING ?auto_322545 ?auto_322538 ) ( IS-CRATE ?auto_322538 ) ( not ( = ?auto_322541 ?auto_322538 ) ) ( not ( = ?auto_322542 ?auto_322541 ) ) ( not ( = ?auto_322543 ?auto_322541 ) ) ( not ( = ?auto_322547 ?auto_322541 ) ) ( not ( = ?auto_322549 ?auto_322541 ) ) ( ON ?auto_322540 ?auto_322539 ) ( ON ?auto_322541 ?auto_322540 ) ( not ( = ?auto_322539 ?auto_322540 ) ) ( not ( = ?auto_322539 ?auto_322541 ) ) ( not ( = ?auto_322539 ?auto_322538 ) ) ( not ( = ?auto_322539 ?auto_322542 ) ) ( not ( = ?auto_322539 ?auto_322543 ) ) ( not ( = ?auto_322539 ?auto_322547 ) ) ( not ( = ?auto_322539 ?auto_322549 ) ) ( not ( = ?auto_322540 ?auto_322541 ) ) ( not ( = ?auto_322540 ?auto_322538 ) ) ( not ( = ?auto_322540 ?auto_322542 ) ) ( not ( = ?auto_322540 ?auto_322543 ) ) ( not ( = ?auto_322540 ?auto_322547 ) ) ( not ( = ?auto_322540 ?auto_322549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322538 ?auto_322542 ?auto_322543 )
      ( MAKE-5CRATE-VERIFY ?auto_322539 ?auto_322540 ?auto_322541 ?auto_322538 ?auto_322542 ?auto_322543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_322652 - SURFACE
      ?auto_322653 - SURFACE
    )
    :vars
    (
      ?auto_322657 - HOIST
      ?auto_322659 - PLACE
      ?auto_322656 - SURFACE
      ?auto_322661 - PLACE
      ?auto_322655 - HOIST
      ?auto_322654 - SURFACE
      ?auto_322660 - TRUCK
      ?auto_322658 - SURFACE
      ?auto_322662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322657 ?auto_322659 ) ( IS-CRATE ?auto_322653 ) ( not ( = ?auto_322652 ?auto_322653 ) ) ( not ( = ?auto_322656 ?auto_322652 ) ) ( not ( = ?auto_322656 ?auto_322653 ) ) ( not ( = ?auto_322661 ?auto_322659 ) ) ( HOIST-AT ?auto_322655 ?auto_322661 ) ( not ( = ?auto_322657 ?auto_322655 ) ) ( SURFACE-AT ?auto_322653 ?auto_322661 ) ( ON ?auto_322653 ?auto_322654 ) ( CLEAR ?auto_322653 ) ( not ( = ?auto_322652 ?auto_322654 ) ) ( not ( = ?auto_322653 ?auto_322654 ) ) ( not ( = ?auto_322656 ?auto_322654 ) ) ( SURFACE-AT ?auto_322656 ?auto_322659 ) ( CLEAR ?auto_322656 ) ( IS-CRATE ?auto_322652 ) ( AVAILABLE ?auto_322657 ) ( TRUCK-AT ?auto_322660 ?auto_322661 ) ( SURFACE-AT ?auto_322652 ?auto_322661 ) ( ON ?auto_322652 ?auto_322658 ) ( CLEAR ?auto_322652 ) ( not ( = ?auto_322652 ?auto_322658 ) ) ( not ( = ?auto_322653 ?auto_322658 ) ) ( not ( = ?auto_322656 ?auto_322658 ) ) ( not ( = ?auto_322654 ?auto_322658 ) ) ( LIFTING ?auto_322655 ?auto_322662 ) ( IS-CRATE ?auto_322662 ) ( not ( = ?auto_322652 ?auto_322662 ) ) ( not ( = ?auto_322653 ?auto_322662 ) ) ( not ( = ?auto_322656 ?auto_322662 ) ) ( not ( = ?auto_322654 ?auto_322662 ) ) ( not ( = ?auto_322658 ?auto_322662 ) ) )
    :subtasks
    ( ( !LOAD ?auto_322655 ?auto_322662 ?auto_322660 ?auto_322661 )
      ( MAKE-1CRATE ?auto_322652 ?auto_322653 )
      ( MAKE-1CRATE-VERIFY ?auto_322652 ?auto_322653 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323481 - SURFACE
      ?auto_323482 - SURFACE
      ?auto_323483 - SURFACE
      ?auto_323480 - SURFACE
      ?auto_323484 - SURFACE
      ?auto_323486 - SURFACE
      ?auto_323485 - SURFACE
    )
    :vars
    (
      ?auto_323487 - HOIST
      ?auto_323488 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323487 ?auto_323488 ) ( SURFACE-AT ?auto_323486 ?auto_323488 ) ( CLEAR ?auto_323486 ) ( LIFTING ?auto_323487 ?auto_323485 ) ( IS-CRATE ?auto_323485 ) ( not ( = ?auto_323486 ?auto_323485 ) ) ( ON ?auto_323482 ?auto_323481 ) ( ON ?auto_323483 ?auto_323482 ) ( ON ?auto_323480 ?auto_323483 ) ( ON ?auto_323484 ?auto_323480 ) ( ON ?auto_323486 ?auto_323484 ) ( not ( = ?auto_323481 ?auto_323482 ) ) ( not ( = ?auto_323481 ?auto_323483 ) ) ( not ( = ?auto_323481 ?auto_323480 ) ) ( not ( = ?auto_323481 ?auto_323484 ) ) ( not ( = ?auto_323481 ?auto_323486 ) ) ( not ( = ?auto_323481 ?auto_323485 ) ) ( not ( = ?auto_323482 ?auto_323483 ) ) ( not ( = ?auto_323482 ?auto_323480 ) ) ( not ( = ?auto_323482 ?auto_323484 ) ) ( not ( = ?auto_323482 ?auto_323486 ) ) ( not ( = ?auto_323482 ?auto_323485 ) ) ( not ( = ?auto_323483 ?auto_323480 ) ) ( not ( = ?auto_323483 ?auto_323484 ) ) ( not ( = ?auto_323483 ?auto_323486 ) ) ( not ( = ?auto_323483 ?auto_323485 ) ) ( not ( = ?auto_323480 ?auto_323484 ) ) ( not ( = ?auto_323480 ?auto_323486 ) ) ( not ( = ?auto_323480 ?auto_323485 ) ) ( not ( = ?auto_323484 ?auto_323486 ) ) ( not ( = ?auto_323484 ?auto_323485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_323486 ?auto_323485 )
      ( MAKE-6CRATE-VERIFY ?auto_323481 ?auto_323482 ?auto_323483 ?auto_323480 ?auto_323484 ?auto_323486 ?auto_323485 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323525 - SURFACE
      ?auto_323526 - SURFACE
      ?auto_323527 - SURFACE
      ?auto_323524 - SURFACE
      ?auto_323528 - SURFACE
      ?auto_323530 - SURFACE
      ?auto_323529 - SURFACE
    )
    :vars
    (
      ?auto_323532 - HOIST
      ?auto_323531 - PLACE
      ?auto_323533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323532 ?auto_323531 ) ( SURFACE-AT ?auto_323530 ?auto_323531 ) ( CLEAR ?auto_323530 ) ( IS-CRATE ?auto_323529 ) ( not ( = ?auto_323530 ?auto_323529 ) ) ( TRUCK-AT ?auto_323533 ?auto_323531 ) ( AVAILABLE ?auto_323532 ) ( IN ?auto_323529 ?auto_323533 ) ( ON ?auto_323530 ?auto_323528 ) ( not ( = ?auto_323528 ?auto_323530 ) ) ( not ( = ?auto_323528 ?auto_323529 ) ) ( ON ?auto_323526 ?auto_323525 ) ( ON ?auto_323527 ?auto_323526 ) ( ON ?auto_323524 ?auto_323527 ) ( ON ?auto_323528 ?auto_323524 ) ( not ( = ?auto_323525 ?auto_323526 ) ) ( not ( = ?auto_323525 ?auto_323527 ) ) ( not ( = ?auto_323525 ?auto_323524 ) ) ( not ( = ?auto_323525 ?auto_323528 ) ) ( not ( = ?auto_323525 ?auto_323530 ) ) ( not ( = ?auto_323525 ?auto_323529 ) ) ( not ( = ?auto_323526 ?auto_323527 ) ) ( not ( = ?auto_323526 ?auto_323524 ) ) ( not ( = ?auto_323526 ?auto_323528 ) ) ( not ( = ?auto_323526 ?auto_323530 ) ) ( not ( = ?auto_323526 ?auto_323529 ) ) ( not ( = ?auto_323527 ?auto_323524 ) ) ( not ( = ?auto_323527 ?auto_323528 ) ) ( not ( = ?auto_323527 ?auto_323530 ) ) ( not ( = ?auto_323527 ?auto_323529 ) ) ( not ( = ?auto_323524 ?auto_323528 ) ) ( not ( = ?auto_323524 ?auto_323530 ) ) ( not ( = ?auto_323524 ?auto_323529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323528 ?auto_323530 ?auto_323529 )
      ( MAKE-6CRATE-VERIFY ?auto_323525 ?auto_323526 ?auto_323527 ?auto_323524 ?auto_323528 ?auto_323530 ?auto_323529 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323576 - SURFACE
      ?auto_323577 - SURFACE
      ?auto_323578 - SURFACE
      ?auto_323575 - SURFACE
      ?auto_323579 - SURFACE
      ?auto_323581 - SURFACE
      ?auto_323580 - SURFACE
    )
    :vars
    (
      ?auto_323583 - HOIST
      ?auto_323584 - PLACE
      ?auto_323582 - TRUCK
      ?auto_323585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323583 ?auto_323584 ) ( SURFACE-AT ?auto_323581 ?auto_323584 ) ( CLEAR ?auto_323581 ) ( IS-CRATE ?auto_323580 ) ( not ( = ?auto_323581 ?auto_323580 ) ) ( AVAILABLE ?auto_323583 ) ( IN ?auto_323580 ?auto_323582 ) ( ON ?auto_323581 ?auto_323579 ) ( not ( = ?auto_323579 ?auto_323581 ) ) ( not ( = ?auto_323579 ?auto_323580 ) ) ( TRUCK-AT ?auto_323582 ?auto_323585 ) ( not ( = ?auto_323585 ?auto_323584 ) ) ( ON ?auto_323577 ?auto_323576 ) ( ON ?auto_323578 ?auto_323577 ) ( ON ?auto_323575 ?auto_323578 ) ( ON ?auto_323579 ?auto_323575 ) ( not ( = ?auto_323576 ?auto_323577 ) ) ( not ( = ?auto_323576 ?auto_323578 ) ) ( not ( = ?auto_323576 ?auto_323575 ) ) ( not ( = ?auto_323576 ?auto_323579 ) ) ( not ( = ?auto_323576 ?auto_323581 ) ) ( not ( = ?auto_323576 ?auto_323580 ) ) ( not ( = ?auto_323577 ?auto_323578 ) ) ( not ( = ?auto_323577 ?auto_323575 ) ) ( not ( = ?auto_323577 ?auto_323579 ) ) ( not ( = ?auto_323577 ?auto_323581 ) ) ( not ( = ?auto_323577 ?auto_323580 ) ) ( not ( = ?auto_323578 ?auto_323575 ) ) ( not ( = ?auto_323578 ?auto_323579 ) ) ( not ( = ?auto_323578 ?auto_323581 ) ) ( not ( = ?auto_323578 ?auto_323580 ) ) ( not ( = ?auto_323575 ?auto_323579 ) ) ( not ( = ?auto_323575 ?auto_323581 ) ) ( not ( = ?auto_323575 ?auto_323580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323579 ?auto_323581 ?auto_323580 )
      ( MAKE-6CRATE-VERIFY ?auto_323576 ?auto_323577 ?auto_323578 ?auto_323575 ?auto_323579 ?auto_323581 ?auto_323580 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323633 - SURFACE
      ?auto_323634 - SURFACE
      ?auto_323635 - SURFACE
      ?auto_323632 - SURFACE
      ?auto_323636 - SURFACE
      ?auto_323638 - SURFACE
      ?auto_323637 - SURFACE
    )
    :vars
    (
      ?auto_323640 - HOIST
      ?auto_323642 - PLACE
      ?auto_323641 - TRUCK
      ?auto_323643 - PLACE
      ?auto_323639 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_323640 ?auto_323642 ) ( SURFACE-AT ?auto_323638 ?auto_323642 ) ( CLEAR ?auto_323638 ) ( IS-CRATE ?auto_323637 ) ( not ( = ?auto_323638 ?auto_323637 ) ) ( AVAILABLE ?auto_323640 ) ( ON ?auto_323638 ?auto_323636 ) ( not ( = ?auto_323636 ?auto_323638 ) ) ( not ( = ?auto_323636 ?auto_323637 ) ) ( TRUCK-AT ?auto_323641 ?auto_323643 ) ( not ( = ?auto_323643 ?auto_323642 ) ) ( HOIST-AT ?auto_323639 ?auto_323643 ) ( LIFTING ?auto_323639 ?auto_323637 ) ( not ( = ?auto_323640 ?auto_323639 ) ) ( ON ?auto_323634 ?auto_323633 ) ( ON ?auto_323635 ?auto_323634 ) ( ON ?auto_323632 ?auto_323635 ) ( ON ?auto_323636 ?auto_323632 ) ( not ( = ?auto_323633 ?auto_323634 ) ) ( not ( = ?auto_323633 ?auto_323635 ) ) ( not ( = ?auto_323633 ?auto_323632 ) ) ( not ( = ?auto_323633 ?auto_323636 ) ) ( not ( = ?auto_323633 ?auto_323638 ) ) ( not ( = ?auto_323633 ?auto_323637 ) ) ( not ( = ?auto_323634 ?auto_323635 ) ) ( not ( = ?auto_323634 ?auto_323632 ) ) ( not ( = ?auto_323634 ?auto_323636 ) ) ( not ( = ?auto_323634 ?auto_323638 ) ) ( not ( = ?auto_323634 ?auto_323637 ) ) ( not ( = ?auto_323635 ?auto_323632 ) ) ( not ( = ?auto_323635 ?auto_323636 ) ) ( not ( = ?auto_323635 ?auto_323638 ) ) ( not ( = ?auto_323635 ?auto_323637 ) ) ( not ( = ?auto_323632 ?auto_323636 ) ) ( not ( = ?auto_323632 ?auto_323638 ) ) ( not ( = ?auto_323632 ?auto_323637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323636 ?auto_323638 ?auto_323637 )
      ( MAKE-6CRATE-VERIFY ?auto_323633 ?auto_323634 ?auto_323635 ?auto_323632 ?auto_323636 ?auto_323638 ?auto_323637 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323696 - SURFACE
      ?auto_323697 - SURFACE
      ?auto_323698 - SURFACE
      ?auto_323695 - SURFACE
      ?auto_323699 - SURFACE
      ?auto_323701 - SURFACE
      ?auto_323700 - SURFACE
    )
    :vars
    (
      ?auto_323705 - HOIST
      ?auto_323703 - PLACE
      ?auto_323707 - TRUCK
      ?auto_323702 - PLACE
      ?auto_323704 - HOIST
      ?auto_323706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323705 ?auto_323703 ) ( SURFACE-AT ?auto_323701 ?auto_323703 ) ( CLEAR ?auto_323701 ) ( IS-CRATE ?auto_323700 ) ( not ( = ?auto_323701 ?auto_323700 ) ) ( AVAILABLE ?auto_323705 ) ( ON ?auto_323701 ?auto_323699 ) ( not ( = ?auto_323699 ?auto_323701 ) ) ( not ( = ?auto_323699 ?auto_323700 ) ) ( TRUCK-AT ?auto_323707 ?auto_323702 ) ( not ( = ?auto_323702 ?auto_323703 ) ) ( HOIST-AT ?auto_323704 ?auto_323702 ) ( not ( = ?auto_323705 ?auto_323704 ) ) ( AVAILABLE ?auto_323704 ) ( SURFACE-AT ?auto_323700 ?auto_323702 ) ( ON ?auto_323700 ?auto_323706 ) ( CLEAR ?auto_323700 ) ( not ( = ?auto_323701 ?auto_323706 ) ) ( not ( = ?auto_323700 ?auto_323706 ) ) ( not ( = ?auto_323699 ?auto_323706 ) ) ( ON ?auto_323697 ?auto_323696 ) ( ON ?auto_323698 ?auto_323697 ) ( ON ?auto_323695 ?auto_323698 ) ( ON ?auto_323699 ?auto_323695 ) ( not ( = ?auto_323696 ?auto_323697 ) ) ( not ( = ?auto_323696 ?auto_323698 ) ) ( not ( = ?auto_323696 ?auto_323695 ) ) ( not ( = ?auto_323696 ?auto_323699 ) ) ( not ( = ?auto_323696 ?auto_323701 ) ) ( not ( = ?auto_323696 ?auto_323700 ) ) ( not ( = ?auto_323696 ?auto_323706 ) ) ( not ( = ?auto_323697 ?auto_323698 ) ) ( not ( = ?auto_323697 ?auto_323695 ) ) ( not ( = ?auto_323697 ?auto_323699 ) ) ( not ( = ?auto_323697 ?auto_323701 ) ) ( not ( = ?auto_323697 ?auto_323700 ) ) ( not ( = ?auto_323697 ?auto_323706 ) ) ( not ( = ?auto_323698 ?auto_323695 ) ) ( not ( = ?auto_323698 ?auto_323699 ) ) ( not ( = ?auto_323698 ?auto_323701 ) ) ( not ( = ?auto_323698 ?auto_323700 ) ) ( not ( = ?auto_323698 ?auto_323706 ) ) ( not ( = ?auto_323695 ?auto_323699 ) ) ( not ( = ?auto_323695 ?auto_323701 ) ) ( not ( = ?auto_323695 ?auto_323700 ) ) ( not ( = ?auto_323695 ?auto_323706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323699 ?auto_323701 ?auto_323700 )
      ( MAKE-6CRATE-VERIFY ?auto_323696 ?auto_323697 ?auto_323698 ?auto_323695 ?auto_323699 ?auto_323701 ?auto_323700 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323760 - SURFACE
      ?auto_323761 - SURFACE
      ?auto_323762 - SURFACE
      ?auto_323759 - SURFACE
      ?auto_323763 - SURFACE
      ?auto_323765 - SURFACE
      ?auto_323764 - SURFACE
    )
    :vars
    (
      ?auto_323767 - HOIST
      ?auto_323769 - PLACE
      ?auto_323766 - PLACE
      ?auto_323771 - HOIST
      ?auto_323770 - SURFACE
      ?auto_323768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323767 ?auto_323769 ) ( SURFACE-AT ?auto_323765 ?auto_323769 ) ( CLEAR ?auto_323765 ) ( IS-CRATE ?auto_323764 ) ( not ( = ?auto_323765 ?auto_323764 ) ) ( AVAILABLE ?auto_323767 ) ( ON ?auto_323765 ?auto_323763 ) ( not ( = ?auto_323763 ?auto_323765 ) ) ( not ( = ?auto_323763 ?auto_323764 ) ) ( not ( = ?auto_323766 ?auto_323769 ) ) ( HOIST-AT ?auto_323771 ?auto_323766 ) ( not ( = ?auto_323767 ?auto_323771 ) ) ( AVAILABLE ?auto_323771 ) ( SURFACE-AT ?auto_323764 ?auto_323766 ) ( ON ?auto_323764 ?auto_323770 ) ( CLEAR ?auto_323764 ) ( not ( = ?auto_323765 ?auto_323770 ) ) ( not ( = ?auto_323764 ?auto_323770 ) ) ( not ( = ?auto_323763 ?auto_323770 ) ) ( TRUCK-AT ?auto_323768 ?auto_323769 ) ( ON ?auto_323761 ?auto_323760 ) ( ON ?auto_323762 ?auto_323761 ) ( ON ?auto_323759 ?auto_323762 ) ( ON ?auto_323763 ?auto_323759 ) ( not ( = ?auto_323760 ?auto_323761 ) ) ( not ( = ?auto_323760 ?auto_323762 ) ) ( not ( = ?auto_323760 ?auto_323759 ) ) ( not ( = ?auto_323760 ?auto_323763 ) ) ( not ( = ?auto_323760 ?auto_323765 ) ) ( not ( = ?auto_323760 ?auto_323764 ) ) ( not ( = ?auto_323760 ?auto_323770 ) ) ( not ( = ?auto_323761 ?auto_323762 ) ) ( not ( = ?auto_323761 ?auto_323759 ) ) ( not ( = ?auto_323761 ?auto_323763 ) ) ( not ( = ?auto_323761 ?auto_323765 ) ) ( not ( = ?auto_323761 ?auto_323764 ) ) ( not ( = ?auto_323761 ?auto_323770 ) ) ( not ( = ?auto_323762 ?auto_323759 ) ) ( not ( = ?auto_323762 ?auto_323763 ) ) ( not ( = ?auto_323762 ?auto_323765 ) ) ( not ( = ?auto_323762 ?auto_323764 ) ) ( not ( = ?auto_323762 ?auto_323770 ) ) ( not ( = ?auto_323759 ?auto_323763 ) ) ( not ( = ?auto_323759 ?auto_323765 ) ) ( not ( = ?auto_323759 ?auto_323764 ) ) ( not ( = ?auto_323759 ?auto_323770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323763 ?auto_323765 ?auto_323764 )
      ( MAKE-6CRATE-VERIFY ?auto_323760 ?auto_323761 ?auto_323762 ?auto_323759 ?auto_323763 ?auto_323765 ?auto_323764 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323824 - SURFACE
      ?auto_323825 - SURFACE
      ?auto_323826 - SURFACE
      ?auto_323823 - SURFACE
      ?auto_323827 - SURFACE
      ?auto_323829 - SURFACE
      ?auto_323828 - SURFACE
    )
    :vars
    (
      ?auto_323835 - HOIST
      ?auto_323830 - PLACE
      ?auto_323831 - PLACE
      ?auto_323833 - HOIST
      ?auto_323834 - SURFACE
      ?auto_323832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323835 ?auto_323830 ) ( IS-CRATE ?auto_323828 ) ( not ( = ?auto_323829 ?auto_323828 ) ) ( not ( = ?auto_323827 ?auto_323829 ) ) ( not ( = ?auto_323827 ?auto_323828 ) ) ( not ( = ?auto_323831 ?auto_323830 ) ) ( HOIST-AT ?auto_323833 ?auto_323831 ) ( not ( = ?auto_323835 ?auto_323833 ) ) ( AVAILABLE ?auto_323833 ) ( SURFACE-AT ?auto_323828 ?auto_323831 ) ( ON ?auto_323828 ?auto_323834 ) ( CLEAR ?auto_323828 ) ( not ( = ?auto_323829 ?auto_323834 ) ) ( not ( = ?auto_323828 ?auto_323834 ) ) ( not ( = ?auto_323827 ?auto_323834 ) ) ( TRUCK-AT ?auto_323832 ?auto_323830 ) ( SURFACE-AT ?auto_323827 ?auto_323830 ) ( CLEAR ?auto_323827 ) ( LIFTING ?auto_323835 ?auto_323829 ) ( IS-CRATE ?auto_323829 ) ( ON ?auto_323825 ?auto_323824 ) ( ON ?auto_323826 ?auto_323825 ) ( ON ?auto_323823 ?auto_323826 ) ( ON ?auto_323827 ?auto_323823 ) ( not ( = ?auto_323824 ?auto_323825 ) ) ( not ( = ?auto_323824 ?auto_323826 ) ) ( not ( = ?auto_323824 ?auto_323823 ) ) ( not ( = ?auto_323824 ?auto_323827 ) ) ( not ( = ?auto_323824 ?auto_323829 ) ) ( not ( = ?auto_323824 ?auto_323828 ) ) ( not ( = ?auto_323824 ?auto_323834 ) ) ( not ( = ?auto_323825 ?auto_323826 ) ) ( not ( = ?auto_323825 ?auto_323823 ) ) ( not ( = ?auto_323825 ?auto_323827 ) ) ( not ( = ?auto_323825 ?auto_323829 ) ) ( not ( = ?auto_323825 ?auto_323828 ) ) ( not ( = ?auto_323825 ?auto_323834 ) ) ( not ( = ?auto_323826 ?auto_323823 ) ) ( not ( = ?auto_323826 ?auto_323827 ) ) ( not ( = ?auto_323826 ?auto_323829 ) ) ( not ( = ?auto_323826 ?auto_323828 ) ) ( not ( = ?auto_323826 ?auto_323834 ) ) ( not ( = ?auto_323823 ?auto_323827 ) ) ( not ( = ?auto_323823 ?auto_323829 ) ) ( not ( = ?auto_323823 ?auto_323828 ) ) ( not ( = ?auto_323823 ?auto_323834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323827 ?auto_323829 ?auto_323828 )
      ( MAKE-6CRATE-VERIFY ?auto_323824 ?auto_323825 ?auto_323826 ?auto_323823 ?auto_323827 ?auto_323829 ?auto_323828 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323888 - SURFACE
      ?auto_323889 - SURFACE
      ?auto_323890 - SURFACE
      ?auto_323887 - SURFACE
      ?auto_323891 - SURFACE
      ?auto_323893 - SURFACE
      ?auto_323892 - SURFACE
    )
    :vars
    (
      ?auto_323895 - HOIST
      ?auto_323897 - PLACE
      ?auto_323898 - PLACE
      ?auto_323894 - HOIST
      ?auto_323899 - SURFACE
      ?auto_323896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323895 ?auto_323897 ) ( IS-CRATE ?auto_323892 ) ( not ( = ?auto_323893 ?auto_323892 ) ) ( not ( = ?auto_323891 ?auto_323893 ) ) ( not ( = ?auto_323891 ?auto_323892 ) ) ( not ( = ?auto_323898 ?auto_323897 ) ) ( HOIST-AT ?auto_323894 ?auto_323898 ) ( not ( = ?auto_323895 ?auto_323894 ) ) ( AVAILABLE ?auto_323894 ) ( SURFACE-AT ?auto_323892 ?auto_323898 ) ( ON ?auto_323892 ?auto_323899 ) ( CLEAR ?auto_323892 ) ( not ( = ?auto_323893 ?auto_323899 ) ) ( not ( = ?auto_323892 ?auto_323899 ) ) ( not ( = ?auto_323891 ?auto_323899 ) ) ( TRUCK-AT ?auto_323896 ?auto_323897 ) ( SURFACE-AT ?auto_323891 ?auto_323897 ) ( CLEAR ?auto_323891 ) ( IS-CRATE ?auto_323893 ) ( AVAILABLE ?auto_323895 ) ( IN ?auto_323893 ?auto_323896 ) ( ON ?auto_323889 ?auto_323888 ) ( ON ?auto_323890 ?auto_323889 ) ( ON ?auto_323887 ?auto_323890 ) ( ON ?auto_323891 ?auto_323887 ) ( not ( = ?auto_323888 ?auto_323889 ) ) ( not ( = ?auto_323888 ?auto_323890 ) ) ( not ( = ?auto_323888 ?auto_323887 ) ) ( not ( = ?auto_323888 ?auto_323891 ) ) ( not ( = ?auto_323888 ?auto_323893 ) ) ( not ( = ?auto_323888 ?auto_323892 ) ) ( not ( = ?auto_323888 ?auto_323899 ) ) ( not ( = ?auto_323889 ?auto_323890 ) ) ( not ( = ?auto_323889 ?auto_323887 ) ) ( not ( = ?auto_323889 ?auto_323891 ) ) ( not ( = ?auto_323889 ?auto_323893 ) ) ( not ( = ?auto_323889 ?auto_323892 ) ) ( not ( = ?auto_323889 ?auto_323899 ) ) ( not ( = ?auto_323890 ?auto_323887 ) ) ( not ( = ?auto_323890 ?auto_323891 ) ) ( not ( = ?auto_323890 ?auto_323893 ) ) ( not ( = ?auto_323890 ?auto_323892 ) ) ( not ( = ?auto_323890 ?auto_323899 ) ) ( not ( = ?auto_323887 ?auto_323891 ) ) ( not ( = ?auto_323887 ?auto_323893 ) ) ( not ( = ?auto_323887 ?auto_323892 ) ) ( not ( = ?auto_323887 ?auto_323899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323891 ?auto_323893 ?auto_323892 )
      ( MAKE-6CRATE-VERIFY ?auto_323888 ?auto_323889 ?auto_323890 ?auto_323887 ?auto_323891 ?auto_323893 ?auto_323892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_324357 - SURFACE
      ?auto_324358 - SURFACE
    )
    :vars
    (
      ?auto_324362 - HOIST
      ?auto_324361 - PLACE
      ?auto_324364 - SURFACE
      ?auto_324360 - PLACE
      ?auto_324359 - HOIST
      ?auto_324365 - SURFACE
      ?auto_324363 - TRUCK
      ?auto_324366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_324362 ?auto_324361 ) ( SURFACE-AT ?auto_324357 ?auto_324361 ) ( CLEAR ?auto_324357 ) ( IS-CRATE ?auto_324358 ) ( not ( = ?auto_324357 ?auto_324358 ) ) ( ON ?auto_324357 ?auto_324364 ) ( not ( = ?auto_324364 ?auto_324357 ) ) ( not ( = ?auto_324364 ?auto_324358 ) ) ( not ( = ?auto_324360 ?auto_324361 ) ) ( HOIST-AT ?auto_324359 ?auto_324360 ) ( not ( = ?auto_324362 ?auto_324359 ) ) ( AVAILABLE ?auto_324359 ) ( SURFACE-AT ?auto_324358 ?auto_324360 ) ( ON ?auto_324358 ?auto_324365 ) ( CLEAR ?auto_324358 ) ( not ( = ?auto_324357 ?auto_324365 ) ) ( not ( = ?auto_324358 ?auto_324365 ) ) ( not ( = ?auto_324364 ?auto_324365 ) ) ( TRUCK-AT ?auto_324363 ?auto_324361 ) ( LIFTING ?auto_324362 ?auto_324366 ) ( IS-CRATE ?auto_324366 ) ( not ( = ?auto_324357 ?auto_324366 ) ) ( not ( = ?auto_324358 ?auto_324366 ) ) ( not ( = ?auto_324364 ?auto_324366 ) ) ( not ( = ?auto_324365 ?auto_324366 ) ) )
    :subtasks
    ( ( !LOAD ?auto_324362 ?auto_324366 ?auto_324363 ?auto_324361 )
      ( MAKE-1CRATE ?auto_324357 ?auto_324358 )
      ( MAKE-1CRATE-VERIFY ?auto_324357 ?auto_324358 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325811 - SURFACE
      ?auto_325812 - SURFACE
      ?auto_325813 - SURFACE
      ?auto_325810 - SURFACE
      ?auto_325814 - SURFACE
      ?auto_325816 - SURFACE
      ?auto_325815 - SURFACE
      ?auto_325817 - SURFACE
    )
    :vars
    (
      ?auto_325819 - HOIST
      ?auto_325818 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325819 ?auto_325818 ) ( SURFACE-AT ?auto_325815 ?auto_325818 ) ( CLEAR ?auto_325815 ) ( LIFTING ?auto_325819 ?auto_325817 ) ( IS-CRATE ?auto_325817 ) ( not ( = ?auto_325815 ?auto_325817 ) ) ( ON ?auto_325812 ?auto_325811 ) ( ON ?auto_325813 ?auto_325812 ) ( ON ?auto_325810 ?auto_325813 ) ( ON ?auto_325814 ?auto_325810 ) ( ON ?auto_325816 ?auto_325814 ) ( ON ?auto_325815 ?auto_325816 ) ( not ( = ?auto_325811 ?auto_325812 ) ) ( not ( = ?auto_325811 ?auto_325813 ) ) ( not ( = ?auto_325811 ?auto_325810 ) ) ( not ( = ?auto_325811 ?auto_325814 ) ) ( not ( = ?auto_325811 ?auto_325816 ) ) ( not ( = ?auto_325811 ?auto_325815 ) ) ( not ( = ?auto_325811 ?auto_325817 ) ) ( not ( = ?auto_325812 ?auto_325813 ) ) ( not ( = ?auto_325812 ?auto_325810 ) ) ( not ( = ?auto_325812 ?auto_325814 ) ) ( not ( = ?auto_325812 ?auto_325816 ) ) ( not ( = ?auto_325812 ?auto_325815 ) ) ( not ( = ?auto_325812 ?auto_325817 ) ) ( not ( = ?auto_325813 ?auto_325810 ) ) ( not ( = ?auto_325813 ?auto_325814 ) ) ( not ( = ?auto_325813 ?auto_325816 ) ) ( not ( = ?auto_325813 ?auto_325815 ) ) ( not ( = ?auto_325813 ?auto_325817 ) ) ( not ( = ?auto_325810 ?auto_325814 ) ) ( not ( = ?auto_325810 ?auto_325816 ) ) ( not ( = ?auto_325810 ?auto_325815 ) ) ( not ( = ?auto_325810 ?auto_325817 ) ) ( not ( = ?auto_325814 ?auto_325816 ) ) ( not ( = ?auto_325814 ?auto_325815 ) ) ( not ( = ?auto_325814 ?auto_325817 ) ) ( not ( = ?auto_325816 ?auto_325815 ) ) ( not ( = ?auto_325816 ?auto_325817 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_325815 ?auto_325817 )
      ( MAKE-7CRATE-VERIFY ?auto_325811 ?auto_325812 ?auto_325813 ?auto_325810 ?auto_325814 ?auto_325816 ?auto_325815 ?auto_325817 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325866 - SURFACE
      ?auto_325867 - SURFACE
      ?auto_325868 - SURFACE
      ?auto_325865 - SURFACE
      ?auto_325869 - SURFACE
      ?auto_325871 - SURFACE
      ?auto_325870 - SURFACE
      ?auto_325872 - SURFACE
    )
    :vars
    (
      ?auto_325875 - HOIST
      ?auto_325873 - PLACE
      ?auto_325874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325875 ?auto_325873 ) ( SURFACE-AT ?auto_325870 ?auto_325873 ) ( CLEAR ?auto_325870 ) ( IS-CRATE ?auto_325872 ) ( not ( = ?auto_325870 ?auto_325872 ) ) ( TRUCK-AT ?auto_325874 ?auto_325873 ) ( AVAILABLE ?auto_325875 ) ( IN ?auto_325872 ?auto_325874 ) ( ON ?auto_325870 ?auto_325871 ) ( not ( = ?auto_325871 ?auto_325870 ) ) ( not ( = ?auto_325871 ?auto_325872 ) ) ( ON ?auto_325867 ?auto_325866 ) ( ON ?auto_325868 ?auto_325867 ) ( ON ?auto_325865 ?auto_325868 ) ( ON ?auto_325869 ?auto_325865 ) ( ON ?auto_325871 ?auto_325869 ) ( not ( = ?auto_325866 ?auto_325867 ) ) ( not ( = ?auto_325866 ?auto_325868 ) ) ( not ( = ?auto_325866 ?auto_325865 ) ) ( not ( = ?auto_325866 ?auto_325869 ) ) ( not ( = ?auto_325866 ?auto_325871 ) ) ( not ( = ?auto_325866 ?auto_325870 ) ) ( not ( = ?auto_325866 ?auto_325872 ) ) ( not ( = ?auto_325867 ?auto_325868 ) ) ( not ( = ?auto_325867 ?auto_325865 ) ) ( not ( = ?auto_325867 ?auto_325869 ) ) ( not ( = ?auto_325867 ?auto_325871 ) ) ( not ( = ?auto_325867 ?auto_325870 ) ) ( not ( = ?auto_325867 ?auto_325872 ) ) ( not ( = ?auto_325868 ?auto_325865 ) ) ( not ( = ?auto_325868 ?auto_325869 ) ) ( not ( = ?auto_325868 ?auto_325871 ) ) ( not ( = ?auto_325868 ?auto_325870 ) ) ( not ( = ?auto_325868 ?auto_325872 ) ) ( not ( = ?auto_325865 ?auto_325869 ) ) ( not ( = ?auto_325865 ?auto_325871 ) ) ( not ( = ?auto_325865 ?auto_325870 ) ) ( not ( = ?auto_325865 ?auto_325872 ) ) ( not ( = ?auto_325869 ?auto_325871 ) ) ( not ( = ?auto_325869 ?auto_325870 ) ) ( not ( = ?auto_325869 ?auto_325872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325871 ?auto_325870 ?auto_325872 )
      ( MAKE-7CRATE-VERIFY ?auto_325866 ?auto_325867 ?auto_325868 ?auto_325865 ?auto_325869 ?auto_325871 ?auto_325870 ?auto_325872 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325929 - SURFACE
      ?auto_325930 - SURFACE
      ?auto_325931 - SURFACE
      ?auto_325928 - SURFACE
      ?auto_325932 - SURFACE
      ?auto_325934 - SURFACE
      ?auto_325933 - SURFACE
      ?auto_325935 - SURFACE
    )
    :vars
    (
      ?auto_325937 - HOIST
      ?auto_325936 - PLACE
      ?auto_325939 - TRUCK
      ?auto_325938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325937 ?auto_325936 ) ( SURFACE-AT ?auto_325933 ?auto_325936 ) ( CLEAR ?auto_325933 ) ( IS-CRATE ?auto_325935 ) ( not ( = ?auto_325933 ?auto_325935 ) ) ( AVAILABLE ?auto_325937 ) ( IN ?auto_325935 ?auto_325939 ) ( ON ?auto_325933 ?auto_325934 ) ( not ( = ?auto_325934 ?auto_325933 ) ) ( not ( = ?auto_325934 ?auto_325935 ) ) ( TRUCK-AT ?auto_325939 ?auto_325938 ) ( not ( = ?auto_325938 ?auto_325936 ) ) ( ON ?auto_325930 ?auto_325929 ) ( ON ?auto_325931 ?auto_325930 ) ( ON ?auto_325928 ?auto_325931 ) ( ON ?auto_325932 ?auto_325928 ) ( ON ?auto_325934 ?auto_325932 ) ( not ( = ?auto_325929 ?auto_325930 ) ) ( not ( = ?auto_325929 ?auto_325931 ) ) ( not ( = ?auto_325929 ?auto_325928 ) ) ( not ( = ?auto_325929 ?auto_325932 ) ) ( not ( = ?auto_325929 ?auto_325934 ) ) ( not ( = ?auto_325929 ?auto_325933 ) ) ( not ( = ?auto_325929 ?auto_325935 ) ) ( not ( = ?auto_325930 ?auto_325931 ) ) ( not ( = ?auto_325930 ?auto_325928 ) ) ( not ( = ?auto_325930 ?auto_325932 ) ) ( not ( = ?auto_325930 ?auto_325934 ) ) ( not ( = ?auto_325930 ?auto_325933 ) ) ( not ( = ?auto_325930 ?auto_325935 ) ) ( not ( = ?auto_325931 ?auto_325928 ) ) ( not ( = ?auto_325931 ?auto_325932 ) ) ( not ( = ?auto_325931 ?auto_325934 ) ) ( not ( = ?auto_325931 ?auto_325933 ) ) ( not ( = ?auto_325931 ?auto_325935 ) ) ( not ( = ?auto_325928 ?auto_325932 ) ) ( not ( = ?auto_325928 ?auto_325934 ) ) ( not ( = ?auto_325928 ?auto_325933 ) ) ( not ( = ?auto_325928 ?auto_325935 ) ) ( not ( = ?auto_325932 ?auto_325934 ) ) ( not ( = ?auto_325932 ?auto_325933 ) ) ( not ( = ?auto_325932 ?auto_325935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325934 ?auto_325933 ?auto_325935 )
      ( MAKE-7CRATE-VERIFY ?auto_325929 ?auto_325930 ?auto_325931 ?auto_325928 ?auto_325932 ?auto_325934 ?auto_325933 ?auto_325935 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325999 - SURFACE
      ?auto_326000 - SURFACE
      ?auto_326001 - SURFACE
      ?auto_325998 - SURFACE
      ?auto_326002 - SURFACE
      ?auto_326004 - SURFACE
      ?auto_326003 - SURFACE
      ?auto_326005 - SURFACE
    )
    :vars
    (
      ?auto_326009 - HOIST
      ?auto_326007 - PLACE
      ?auto_326006 - TRUCK
      ?auto_326010 - PLACE
      ?auto_326008 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_326009 ?auto_326007 ) ( SURFACE-AT ?auto_326003 ?auto_326007 ) ( CLEAR ?auto_326003 ) ( IS-CRATE ?auto_326005 ) ( not ( = ?auto_326003 ?auto_326005 ) ) ( AVAILABLE ?auto_326009 ) ( ON ?auto_326003 ?auto_326004 ) ( not ( = ?auto_326004 ?auto_326003 ) ) ( not ( = ?auto_326004 ?auto_326005 ) ) ( TRUCK-AT ?auto_326006 ?auto_326010 ) ( not ( = ?auto_326010 ?auto_326007 ) ) ( HOIST-AT ?auto_326008 ?auto_326010 ) ( LIFTING ?auto_326008 ?auto_326005 ) ( not ( = ?auto_326009 ?auto_326008 ) ) ( ON ?auto_326000 ?auto_325999 ) ( ON ?auto_326001 ?auto_326000 ) ( ON ?auto_325998 ?auto_326001 ) ( ON ?auto_326002 ?auto_325998 ) ( ON ?auto_326004 ?auto_326002 ) ( not ( = ?auto_325999 ?auto_326000 ) ) ( not ( = ?auto_325999 ?auto_326001 ) ) ( not ( = ?auto_325999 ?auto_325998 ) ) ( not ( = ?auto_325999 ?auto_326002 ) ) ( not ( = ?auto_325999 ?auto_326004 ) ) ( not ( = ?auto_325999 ?auto_326003 ) ) ( not ( = ?auto_325999 ?auto_326005 ) ) ( not ( = ?auto_326000 ?auto_326001 ) ) ( not ( = ?auto_326000 ?auto_325998 ) ) ( not ( = ?auto_326000 ?auto_326002 ) ) ( not ( = ?auto_326000 ?auto_326004 ) ) ( not ( = ?auto_326000 ?auto_326003 ) ) ( not ( = ?auto_326000 ?auto_326005 ) ) ( not ( = ?auto_326001 ?auto_325998 ) ) ( not ( = ?auto_326001 ?auto_326002 ) ) ( not ( = ?auto_326001 ?auto_326004 ) ) ( not ( = ?auto_326001 ?auto_326003 ) ) ( not ( = ?auto_326001 ?auto_326005 ) ) ( not ( = ?auto_325998 ?auto_326002 ) ) ( not ( = ?auto_325998 ?auto_326004 ) ) ( not ( = ?auto_325998 ?auto_326003 ) ) ( not ( = ?auto_325998 ?auto_326005 ) ) ( not ( = ?auto_326002 ?auto_326004 ) ) ( not ( = ?auto_326002 ?auto_326003 ) ) ( not ( = ?auto_326002 ?auto_326005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_326004 ?auto_326003 ?auto_326005 )
      ( MAKE-7CRATE-VERIFY ?auto_325999 ?auto_326000 ?auto_326001 ?auto_325998 ?auto_326002 ?auto_326004 ?auto_326003 ?auto_326005 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_326076 - SURFACE
      ?auto_326077 - SURFACE
      ?auto_326078 - SURFACE
      ?auto_326075 - SURFACE
      ?auto_326079 - SURFACE
      ?auto_326081 - SURFACE
      ?auto_326080 - SURFACE
      ?auto_326082 - SURFACE
    )
    :vars
    (
      ?auto_326084 - HOIST
      ?auto_326086 - PLACE
      ?auto_326088 - TRUCK
      ?auto_326085 - PLACE
      ?auto_326083 - HOIST
      ?auto_326087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_326084 ?auto_326086 ) ( SURFACE-AT ?auto_326080 ?auto_326086 ) ( CLEAR ?auto_326080 ) ( IS-CRATE ?auto_326082 ) ( not ( = ?auto_326080 ?auto_326082 ) ) ( AVAILABLE ?auto_326084 ) ( ON ?auto_326080 ?auto_326081 ) ( not ( = ?auto_326081 ?auto_326080 ) ) ( not ( = ?auto_326081 ?auto_326082 ) ) ( TRUCK-AT ?auto_326088 ?auto_326085 ) ( not ( = ?auto_326085 ?auto_326086 ) ) ( HOIST-AT ?auto_326083 ?auto_326085 ) ( not ( = ?auto_326084 ?auto_326083 ) ) ( AVAILABLE ?auto_326083 ) ( SURFACE-AT ?auto_326082 ?auto_326085 ) ( ON ?auto_326082 ?auto_326087 ) ( CLEAR ?auto_326082 ) ( not ( = ?auto_326080 ?auto_326087 ) ) ( not ( = ?auto_326082 ?auto_326087 ) ) ( not ( = ?auto_326081 ?auto_326087 ) ) ( ON ?auto_326077 ?auto_326076 ) ( ON ?auto_326078 ?auto_326077 ) ( ON ?auto_326075 ?auto_326078 ) ( ON ?auto_326079 ?auto_326075 ) ( ON ?auto_326081 ?auto_326079 ) ( not ( = ?auto_326076 ?auto_326077 ) ) ( not ( = ?auto_326076 ?auto_326078 ) ) ( not ( = ?auto_326076 ?auto_326075 ) ) ( not ( = ?auto_326076 ?auto_326079 ) ) ( not ( = ?auto_326076 ?auto_326081 ) ) ( not ( = ?auto_326076 ?auto_326080 ) ) ( not ( = ?auto_326076 ?auto_326082 ) ) ( not ( = ?auto_326076 ?auto_326087 ) ) ( not ( = ?auto_326077 ?auto_326078 ) ) ( not ( = ?auto_326077 ?auto_326075 ) ) ( not ( = ?auto_326077 ?auto_326079 ) ) ( not ( = ?auto_326077 ?auto_326081 ) ) ( not ( = ?auto_326077 ?auto_326080 ) ) ( not ( = ?auto_326077 ?auto_326082 ) ) ( not ( = ?auto_326077 ?auto_326087 ) ) ( not ( = ?auto_326078 ?auto_326075 ) ) ( not ( = ?auto_326078 ?auto_326079 ) ) ( not ( = ?auto_326078 ?auto_326081 ) ) ( not ( = ?auto_326078 ?auto_326080 ) ) ( not ( = ?auto_326078 ?auto_326082 ) ) ( not ( = ?auto_326078 ?auto_326087 ) ) ( not ( = ?auto_326075 ?auto_326079 ) ) ( not ( = ?auto_326075 ?auto_326081 ) ) ( not ( = ?auto_326075 ?auto_326080 ) ) ( not ( = ?auto_326075 ?auto_326082 ) ) ( not ( = ?auto_326075 ?auto_326087 ) ) ( not ( = ?auto_326079 ?auto_326081 ) ) ( not ( = ?auto_326079 ?auto_326080 ) ) ( not ( = ?auto_326079 ?auto_326082 ) ) ( not ( = ?auto_326079 ?auto_326087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_326081 ?auto_326080 ?auto_326082 )
      ( MAKE-7CRATE-VERIFY ?auto_326076 ?auto_326077 ?auto_326078 ?auto_326075 ?auto_326079 ?auto_326081 ?auto_326080 ?auto_326082 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_326154 - SURFACE
      ?auto_326155 - SURFACE
      ?auto_326156 - SURFACE
      ?auto_326153 - SURFACE
      ?auto_326157 - SURFACE
      ?auto_326159 - SURFACE
      ?auto_326158 - SURFACE
      ?auto_326160 - SURFACE
    )
    :vars
    (
      ?auto_326164 - HOIST
      ?auto_326163 - PLACE
      ?auto_326162 - PLACE
      ?auto_326161 - HOIST
      ?auto_326165 - SURFACE
      ?auto_326166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_326164 ?auto_326163 ) ( SURFACE-AT ?auto_326158 ?auto_326163 ) ( CLEAR ?auto_326158 ) ( IS-CRATE ?auto_326160 ) ( not ( = ?auto_326158 ?auto_326160 ) ) ( AVAILABLE ?auto_326164 ) ( ON ?auto_326158 ?auto_326159 ) ( not ( = ?auto_326159 ?auto_326158 ) ) ( not ( = ?auto_326159 ?auto_326160 ) ) ( not ( = ?auto_326162 ?auto_326163 ) ) ( HOIST-AT ?auto_326161 ?auto_326162 ) ( not ( = ?auto_326164 ?auto_326161 ) ) ( AVAILABLE ?auto_326161 ) ( SURFACE-AT ?auto_326160 ?auto_326162 ) ( ON ?auto_326160 ?auto_326165 ) ( CLEAR ?auto_326160 ) ( not ( = ?auto_326158 ?auto_326165 ) ) ( not ( = ?auto_326160 ?auto_326165 ) ) ( not ( = ?auto_326159 ?auto_326165 ) ) ( TRUCK-AT ?auto_326166 ?auto_326163 ) ( ON ?auto_326155 ?auto_326154 ) ( ON ?auto_326156 ?auto_326155 ) ( ON ?auto_326153 ?auto_326156 ) ( ON ?auto_326157 ?auto_326153 ) ( ON ?auto_326159 ?auto_326157 ) ( not ( = ?auto_326154 ?auto_326155 ) ) ( not ( = ?auto_326154 ?auto_326156 ) ) ( not ( = ?auto_326154 ?auto_326153 ) ) ( not ( = ?auto_326154 ?auto_326157 ) ) ( not ( = ?auto_326154 ?auto_326159 ) ) ( not ( = ?auto_326154 ?auto_326158 ) ) ( not ( = ?auto_326154 ?auto_326160 ) ) ( not ( = ?auto_326154 ?auto_326165 ) ) ( not ( = ?auto_326155 ?auto_326156 ) ) ( not ( = ?auto_326155 ?auto_326153 ) ) ( not ( = ?auto_326155 ?auto_326157 ) ) ( not ( = ?auto_326155 ?auto_326159 ) ) ( not ( = ?auto_326155 ?auto_326158 ) ) ( not ( = ?auto_326155 ?auto_326160 ) ) ( not ( = ?auto_326155 ?auto_326165 ) ) ( not ( = ?auto_326156 ?auto_326153 ) ) ( not ( = ?auto_326156 ?auto_326157 ) ) ( not ( = ?auto_326156 ?auto_326159 ) ) ( not ( = ?auto_326156 ?auto_326158 ) ) ( not ( = ?auto_326156 ?auto_326160 ) ) ( not ( = ?auto_326156 ?auto_326165 ) ) ( not ( = ?auto_326153 ?auto_326157 ) ) ( not ( = ?auto_326153 ?auto_326159 ) ) ( not ( = ?auto_326153 ?auto_326158 ) ) ( not ( = ?auto_326153 ?auto_326160 ) ) ( not ( = ?auto_326153 ?auto_326165 ) ) ( not ( = ?auto_326157 ?auto_326159 ) ) ( not ( = ?auto_326157 ?auto_326158 ) ) ( not ( = ?auto_326157 ?auto_326160 ) ) ( not ( = ?auto_326157 ?auto_326165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_326159 ?auto_326158 ?auto_326160 )
      ( MAKE-7CRATE-VERIFY ?auto_326154 ?auto_326155 ?auto_326156 ?auto_326153 ?auto_326157 ?auto_326159 ?auto_326158 ?auto_326160 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_326232 - SURFACE
      ?auto_326233 - SURFACE
      ?auto_326234 - SURFACE
      ?auto_326231 - SURFACE
      ?auto_326235 - SURFACE
      ?auto_326237 - SURFACE
      ?auto_326236 - SURFACE
      ?auto_326238 - SURFACE
    )
    :vars
    (
      ?auto_326240 - HOIST
      ?auto_326242 - PLACE
      ?auto_326241 - PLACE
      ?auto_326239 - HOIST
      ?auto_326243 - SURFACE
      ?auto_326244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_326240 ?auto_326242 ) ( IS-CRATE ?auto_326238 ) ( not ( = ?auto_326236 ?auto_326238 ) ) ( not ( = ?auto_326237 ?auto_326236 ) ) ( not ( = ?auto_326237 ?auto_326238 ) ) ( not ( = ?auto_326241 ?auto_326242 ) ) ( HOIST-AT ?auto_326239 ?auto_326241 ) ( not ( = ?auto_326240 ?auto_326239 ) ) ( AVAILABLE ?auto_326239 ) ( SURFACE-AT ?auto_326238 ?auto_326241 ) ( ON ?auto_326238 ?auto_326243 ) ( CLEAR ?auto_326238 ) ( not ( = ?auto_326236 ?auto_326243 ) ) ( not ( = ?auto_326238 ?auto_326243 ) ) ( not ( = ?auto_326237 ?auto_326243 ) ) ( TRUCK-AT ?auto_326244 ?auto_326242 ) ( SURFACE-AT ?auto_326237 ?auto_326242 ) ( CLEAR ?auto_326237 ) ( LIFTING ?auto_326240 ?auto_326236 ) ( IS-CRATE ?auto_326236 ) ( ON ?auto_326233 ?auto_326232 ) ( ON ?auto_326234 ?auto_326233 ) ( ON ?auto_326231 ?auto_326234 ) ( ON ?auto_326235 ?auto_326231 ) ( ON ?auto_326237 ?auto_326235 ) ( not ( = ?auto_326232 ?auto_326233 ) ) ( not ( = ?auto_326232 ?auto_326234 ) ) ( not ( = ?auto_326232 ?auto_326231 ) ) ( not ( = ?auto_326232 ?auto_326235 ) ) ( not ( = ?auto_326232 ?auto_326237 ) ) ( not ( = ?auto_326232 ?auto_326236 ) ) ( not ( = ?auto_326232 ?auto_326238 ) ) ( not ( = ?auto_326232 ?auto_326243 ) ) ( not ( = ?auto_326233 ?auto_326234 ) ) ( not ( = ?auto_326233 ?auto_326231 ) ) ( not ( = ?auto_326233 ?auto_326235 ) ) ( not ( = ?auto_326233 ?auto_326237 ) ) ( not ( = ?auto_326233 ?auto_326236 ) ) ( not ( = ?auto_326233 ?auto_326238 ) ) ( not ( = ?auto_326233 ?auto_326243 ) ) ( not ( = ?auto_326234 ?auto_326231 ) ) ( not ( = ?auto_326234 ?auto_326235 ) ) ( not ( = ?auto_326234 ?auto_326237 ) ) ( not ( = ?auto_326234 ?auto_326236 ) ) ( not ( = ?auto_326234 ?auto_326238 ) ) ( not ( = ?auto_326234 ?auto_326243 ) ) ( not ( = ?auto_326231 ?auto_326235 ) ) ( not ( = ?auto_326231 ?auto_326237 ) ) ( not ( = ?auto_326231 ?auto_326236 ) ) ( not ( = ?auto_326231 ?auto_326238 ) ) ( not ( = ?auto_326231 ?auto_326243 ) ) ( not ( = ?auto_326235 ?auto_326237 ) ) ( not ( = ?auto_326235 ?auto_326236 ) ) ( not ( = ?auto_326235 ?auto_326238 ) ) ( not ( = ?auto_326235 ?auto_326243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_326237 ?auto_326236 ?auto_326238 )
      ( MAKE-7CRATE-VERIFY ?auto_326232 ?auto_326233 ?auto_326234 ?auto_326231 ?auto_326235 ?auto_326237 ?auto_326236 ?auto_326238 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_326310 - SURFACE
      ?auto_326311 - SURFACE
      ?auto_326312 - SURFACE
      ?auto_326309 - SURFACE
      ?auto_326313 - SURFACE
      ?auto_326315 - SURFACE
      ?auto_326314 - SURFACE
      ?auto_326316 - SURFACE
    )
    :vars
    (
      ?auto_326317 - HOIST
      ?auto_326318 - PLACE
      ?auto_326319 - PLACE
      ?auto_326320 - HOIST
      ?auto_326321 - SURFACE
      ?auto_326322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_326317 ?auto_326318 ) ( IS-CRATE ?auto_326316 ) ( not ( = ?auto_326314 ?auto_326316 ) ) ( not ( = ?auto_326315 ?auto_326314 ) ) ( not ( = ?auto_326315 ?auto_326316 ) ) ( not ( = ?auto_326319 ?auto_326318 ) ) ( HOIST-AT ?auto_326320 ?auto_326319 ) ( not ( = ?auto_326317 ?auto_326320 ) ) ( AVAILABLE ?auto_326320 ) ( SURFACE-AT ?auto_326316 ?auto_326319 ) ( ON ?auto_326316 ?auto_326321 ) ( CLEAR ?auto_326316 ) ( not ( = ?auto_326314 ?auto_326321 ) ) ( not ( = ?auto_326316 ?auto_326321 ) ) ( not ( = ?auto_326315 ?auto_326321 ) ) ( TRUCK-AT ?auto_326322 ?auto_326318 ) ( SURFACE-AT ?auto_326315 ?auto_326318 ) ( CLEAR ?auto_326315 ) ( IS-CRATE ?auto_326314 ) ( AVAILABLE ?auto_326317 ) ( IN ?auto_326314 ?auto_326322 ) ( ON ?auto_326311 ?auto_326310 ) ( ON ?auto_326312 ?auto_326311 ) ( ON ?auto_326309 ?auto_326312 ) ( ON ?auto_326313 ?auto_326309 ) ( ON ?auto_326315 ?auto_326313 ) ( not ( = ?auto_326310 ?auto_326311 ) ) ( not ( = ?auto_326310 ?auto_326312 ) ) ( not ( = ?auto_326310 ?auto_326309 ) ) ( not ( = ?auto_326310 ?auto_326313 ) ) ( not ( = ?auto_326310 ?auto_326315 ) ) ( not ( = ?auto_326310 ?auto_326314 ) ) ( not ( = ?auto_326310 ?auto_326316 ) ) ( not ( = ?auto_326310 ?auto_326321 ) ) ( not ( = ?auto_326311 ?auto_326312 ) ) ( not ( = ?auto_326311 ?auto_326309 ) ) ( not ( = ?auto_326311 ?auto_326313 ) ) ( not ( = ?auto_326311 ?auto_326315 ) ) ( not ( = ?auto_326311 ?auto_326314 ) ) ( not ( = ?auto_326311 ?auto_326316 ) ) ( not ( = ?auto_326311 ?auto_326321 ) ) ( not ( = ?auto_326312 ?auto_326309 ) ) ( not ( = ?auto_326312 ?auto_326313 ) ) ( not ( = ?auto_326312 ?auto_326315 ) ) ( not ( = ?auto_326312 ?auto_326314 ) ) ( not ( = ?auto_326312 ?auto_326316 ) ) ( not ( = ?auto_326312 ?auto_326321 ) ) ( not ( = ?auto_326309 ?auto_326313 ) ) ( not ( = ?auto_326309 ?auto_326315 ) ) ( not ( = ?auto_326309 ?auto_326314 ) ) ( not ( = ?auto_326309 ?auto_326316 ) ) ( not ( = ?auto_326309 ?auto_326321 ) ) ( not ( = ?auto_326313 ?auto_326315 ) ) ( not ( = ?auto_326313 ?auto_326314 ) ) ( not ( = ?auto_326313 ?auto_326316 ) ) ( not ( = ?auto_326313 ?auto_326321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_326315 ?auto_326314 ?auto_326316 )
      ( MAKE-7CRATE-VERIFY ?auto_326310 ?auto_326311 ?auto_326312 ?auto_326309 ?auto_326313 ?auto_326315 ?auto_326314 ?auto_326316 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329229 - SURFACE
      ?auto_329230 - SURFACE
      ?auto_329231 - SURFACE
      ?auto_329228 - SURFACE
      ?auto_329232 - SURFACE
      ?auto_329234 - SURFACE
      ?auto_329233 - SURFACE
      ?auto_329235 - SURFACE
      ?auto_329236 - SURFACE
    )
    :vars
    (
      ?auto_329237 - HOIST
      ?auto_329238 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_329237 ?auto_329238 ) ( SURFACE-AT ?auto_329235 ?auto_329238 ) ( CLEAR ?auto_329235 ) ( LIFTING ?auto_329237 ?auto_329236 ) ( IS-CRATE ?auto_329236 ) ( not ( = ?auto_329235 ?auto_329236 ) ) ( ON ?auto_329230 ?auto_329229 ) ( ON ?auto_329231 ?auto_329230 ) ( ON ?auto_329228 ?auto_329231 ) ( ON ?auto_329232 ?auto_329228 ) ( ON ?auto_329234 ?auto_329232 ) ( ON ?auto_329233 ?auto_329234 ) ( ON ?auto_329235 ?auto_329233 ) ( not ( = ?auto_329229 ?auto_329230 ) ) ( not ( = ?auto_329229 ?auto_329231 ) ) ( not ( = ?auto_329229 ?auto_329228 ) ) ( not ( = ?auto_329229 ?auto_329232 ) ) ( not ( = ?auto_329229 ?auto_329234 ) ) ( not ( = ?auto_329229 ?auto_329233 ) ) ( not ( = ?auto_329229 ?auto_329235 ) ) ( not ( = ?auto_329229 ?auto_329236 ) ) ( not ( = ?auto_329230 ?auto_329231 ) ) ( not ( = ?auto_329230 ?auto_329228 ) ) ( not ( = ?auto_329230 ?auto_329232 ) ) ( not ( = ?auto_329230 ?auto_329234 ) ) ( not ( = ?auto_329230 ?auto_329233 ) ) ( not ( = ?auto_329230 ?auto_329235 ) ) ( not ( = ?auto_329230 ?auto_329236 ) ) ( not ( = ?auto_329231 ?auto_329228 ) ) ( not ( = ?auto_329231 ?auto_329232 ) ) ( not ( = ?auto_329231 ?auto_329234 ) ) ( not ( = ?auto_329231 ?auto_329233 ) ) ( not ( = ?auto_329231 ?auto_329235 ) ) ( not ( = ?auto_329231 ?auto_329236 ) ) ( not ( = ?auto_329228 ?auto_329232 ) ) ( not ( = ?auto_329228 ?auto_329234 ) ) ( not ( = ?auto_329228 ?auto_329233 ) ) ( not ( = ?auto_329228 ?auto_329235 ) ) ( not ( = ?auto_329228 ?auto_329236 ) ) ( not ( = ?auto_329232 ?auto_329234 ) ) ( not ( = ?auto_329232 ?auto_329233 ) ) ( not ( = ?auto_329232 ?auto_329235 ) ) ( not ( = ?auto_329232 ?auto_329236 ) ) ( not ( = ?auto_329234 ?auto_329233 ) ) ( not ( = ?auto_329234 ?auto_329235 ) ) ( not ( = ?auto_329234 ?auto_329236 ) ) ( not ( = ?auto_329233 ?auto_329235 ) ) ( not ( = ?auto_329233 ?auto_329236 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_329235 ?auto_329236 )
      ( MAKE-8CRATE-VERIFY ?auto_329229 ?auto_329230 ?auto_329231 ?auto_329228 ?auto_329232 ?auto_329234 ?auto_329233 ?auto_329235 ?auto_329236 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329296 - SURFACE
      ?auto_329297 - SURFACE
      ?auto_329298 - SURFACE
      ?auto_329295 - SURFACE
      ?auto_329299 - SURFACE
      ?auto_329301 - SURFACE
      ?auto_329300 - SURFACE
      ?auto_329302 - SURFACE
      ?auto_329303 - SURFACE
    )
    :vars
    (
      ?auto_329306 - HOIST
      ?auto_329304 - PLACE
      ?auto_329305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329306 ?auto_329304 ) ( SURFACE-AT ?auto_329302 ?auto_329304 ) ( CLEAR ?auto_329302 ) ( IS-CRATE ?auto_329303 ) ( not ( = ?auto_329302 ?auto_329303 ) ) ( TRUCK-AT ?auto_329305 ?auto_329304 ) ( AVAILABLE ?auto_329306 ) ( IN ?auto_329303 ?auto_329305 ) ( ON ?auto_329302 ?auto_329300 ) ( not ( = ?auto_329300 ?auto_329302 ) ) ( not ( = ?auto_329300 ?auto_329303 ) ) ( ON ?auto_329297 ?auto_329296 ) ( ON ?auto_329298 ?auto_329297 ) ( ON ?auto_329295 ?auto_329298 ) ( ON ?auto_329299 ?auto_329295 ) ( ON ?auto_329301 ?auto_329299 ) ( ON ?auto_329300 ?auto_329301 ) ( not ( = ?auto_329296 ?auto_329297 ) ) ( not ( = ?auto_329296 ?auto_329298 ) ) ( not ( = ?auto_329296 ?auto_329295 ) ) ( not ( = ?auto_329296 ?auto_329299 ) ) ( not ( = ?auto_329296 ?auto_329301 ) ) ( not ( = ?auto_329296 ?auto_329300 ) ) ( not ( = ?auto_329296 ?auto_329302 ) ) ( not ( = ?auto_329296 ?auto_329303 ) ) ( not ( = ?auto_329297 ?auto_329298 ) ) ( not ( = ?auto_329297 ?auto_329295 ) ) ( not ( = ?auto_329297 ?auto_329299 ) ) ( not ( = ?auto_329297 ?auto_329301 ) ) ( not ( = ?auto_329297 ?auto_329300 ) ) ( not ( = ?auto_329297 ?auto_329302 ) ) ( not ( = ?auto_329297 ?auto_329303 ) ) ( not ( = ?auto_329298 ?auto_329295 ) ) ( not ( = ?auto_329298 ?auto_329299 ) ) ( not ( = ?auto_329298 ?auto_329301 ) ) ( not ( = ?auto_329298 ?auto_329300 ) ) ( not ( = ?auto_329298 ?auto_329302 ) ) ( not ( = ?auto_329298 ?auto_329303 ) ) ( not ( = ?auto_329295 ?auto_329299 ) ) ( not ( = ?auto_329295 ?auto_329301 ) ) ( not ( = ?auto_329295 ?auto_329300 ) ) ( not ( = ?auto_329295 ?auto_329302 ) ) ( not ( = ?auto_329295 ?auto_329303 ) ) ( not ( = ?auto_329299 ?auto_329301 ) ) ( not ( = ?auto_329299 ?auto_329300 ) ) ( not ( = ?auto_329299 ?auto_329302 ) ) ( not ( = ?auto_329299 ?auto_329303 ) ) ( not ( = ?auto_329301 ?auto_329300 ) ) ( not ( = ?auto_329301 ?auto_329302 ) ) ( not ( = ?auto_329301 ?auto_329303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329300 ?auto_329302 ?auto_329303 )
      ( MAKE-8CRATE-VERIFY ?auto_329296 ?auto_329297 ?auto_329298 ?auto_329295 ?auto_329299 ?auto_329301 ?auto_329300 ?auto_329302 ?auto_329303 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329372 - SURFACE
      ?auto_329373 - SURFACE
      ?auto_329374 - SURFACE
      ?auto_329371 - SURFACE
      ?auto_329375 - SURFACE
      ?auto_329377 - SURFACE
      ?auto_329376 - SURFACE
      ?auto_329378 - SURFACE
      ?auto_329379 - SURFACE
    )
    :vars
    (
      ?auto_329382 - HOIST
      ?auto_329383 - PLACE
      ?auto_329381 - TRUCK
      ?auto_329380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_329382 ?auto_329383 ) ( SURFACE-AT ?auto_329378 ?auto_329383 ) ( CLEAR ?auto_329378 ) ( IS-CRATE ?auto_329379 ) ( not ( = ?auto_329378 ?auto_329379 ) ) ( AVAILABLE ?auto_329382 ) ( IN ?auto_329379 ?auto_329381 ) ( ON ?auto_329378 ?auto_329376 ) ( not ( = ?auto_329376 ?auto_329378 ) ) ( not ( = ?auto_329376 ?auto_329379 ) ) ( TRUCK-AT ?auto_329381 ?auto_329380 ) ( not ( = ?auto_329380 ?auto_329383 ) ) ( ON ?auto_329373 ?auto_329372 ) ( ON ?auto_329374 ?auto_329373 ) ( ON ?auto_329371 ?auto_329374 ) ( ON ?auto_329375 ?auto_329371 ) ( ON ?auto_329377 ?auto_329375 ) ( ON ?auto_329376 ?auto_329377 ) ( not ( = ?auto_329372 ?auto_329373 ) ) ( not ( = ?auto_329372 ?auto_329374 ) ) ( not ( = ?auto_329372 ?auto_329371 ) ) ( not ( = ?auto_329372 ?auto_329375 ) ) ( not ( = ?auto_329372 ?auto_329377 ) ) ( not ( = ?auto_329372 ?auto_329376 ) ) ( not ( = ?auto_329372 ?auto_329378 ) ) ( not ( = ?auto_329372 ?auto_329379 ) ) ( not ( = ?auto_329373 ?auto_329374 ) ) ( not ( = ?auto_329373 ?auto_329371 ) ) ( not ( = ?auto_329373 ?auto_329375 ) ) ( not ( = ?auto_329373 ?auto_329377 ) ) ( not ( = ?auto_329373 ?auto_329376 ) ) ( not ( = ?auto_329373 ?auto_329378 ) ) ( not ( = ?auto_329373 ?auto_329379 ) ) ( not ( = ?auto_329374 ?auto_329371 ) ) ( not ( = ?auto_329374 ?auto_329375 ) ) ( not ( = ?auto_329374 ?auto_329377 ) ) ( not ( = ?auto_329374 ?auto_329376 ) ) ( not ( = ?auto_329374 ?auto_329378 ) ) ( not ( = ?auto_329374 ?auto_329379 ) ) ( not ( = ?auto_329371 ?auto_329375 ) ) ( not ( = ?auto_329371 ?auto_329377 ) ) ( not ( = ?auto_329371 ?auto_329376 ) ) ( not ( = ?auto_329371 ?auto_329378 ) ) ( not ( = ?auto_329371 ?auto_329379 ) ) ( not ( = ?auto_329375 ?auto_329377 ) ) ( not ( = ?auto_329375 ?auto_329376 ) ) ( not ( = ?auto_329375 ?auto_329378 ) ) ( not ( = ?auto_329375 ?auto_329379 ) ) ( not ( = ?auto_329377 ?auto_329376 ) ) ( not ( = ?auto_329377 ?auto_329378 ) ) ( not ( = ?auto_329377 ?auto_329379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329376 ?auto_329378 ?auto_329379 )
      ( MAKE-8CRATE-VERIFY ?auto_329372 ?auto_329373 ?auto_329374 ?auto_329371 ?auto_329375 ?auto_329377 ?auto_329376 ?auto_329378 ?auto_329379 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329456 - SURFACE
      ?auto_329457 - SURFACE
      ?auto_329458 - SURFACE
      ?auto_329455 - SURFACE
      ?auto_329459 - SURFACE
      ?auto_329461 - SURFACE
      ?auto_329460 - SURFACE
      ?auto_329462 - SURFACE
      ?auto_329463 - SURFACE
    )
    :vars
    (
      ?auto_329468 - HOIST
      ?auto_329464 - PLACE
      ?auto_329467 - TRUCK
      ?auto_329466 - PLACE
      ?auto_329465 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_329468 ?auto_329464 ) ( SURFACE-AT ?auto_329462 ?auto_329464 ) ( CLEAR ?auto_329462 ) ( IS-CRATE ?auto_329463 ) ( not ( = ?auto_329462 ?auto_329463 ) ) ( AVAILABLE ?auto_329468 ) ( ON ?auto_329462 ?auto_329460 ) ( not ( = ?auto_329460 ?auto_329462 ) ) ( not ( = ?auto_329460 ?auto_329463 ) ) ( TRUCK-AT ?auto_329467 ?auto_329466 ) ( not ( = ?auto_329466 ?auto_329464 ) ) ( HOIST-AT ?auto_329465 ?auto_329466 ) ( LIFTING ?auto_329465 ?auto_329463 ) ( not ( = ?auto_329468 ?auto_329465 ) ) ( ON ?auto_329457 ?auto_329456 ) ( ON ?auto_329458 ?auto_329457 ) ( ON ?auto_329455 ?auto_329458 ) ( ON ?auto_329459 ?auto_329455 ) ( ON ?auto_329461 ?auto_329459 ) ( ON ?auto_329460 ?auto_329461 ) ( not ( = ?auto_329456 ?auto_329457 ) ) ( not ( = ?auto_329456 ?auto_329458 ) ) ( not ( = ?auto_329456 ?auto_329455 ) ) ( not ( = ?auto_329456 ?auto_329459 ) ) ( not ( = ?auto_329456 ?auto_329461 ) ) ( not ( = ?auto_329456 ?auto_329460 ) ) ( not ( = ?auto_329456 ?auto_329462 ) ) ( not ( = ?auto_329456 ?auto_329463 ) ) ( not ( = ?auto_329457 ?auto_329458 ) ) ( not ( = ?auto_329457 ?auto_329455 ) ) ( not ( = ?auto_329457 ?auto_329459 ) ) ( not ( = ?auto_329457 ?auto_329461 ) ) ( not ( = ?auto_329457 ?auto_329460 ) ) ( not ( = ?auto_329457 ?auto_329462 ) ) ( not ( = ?auto_329457 ?auto_329463 ) ) ( not ( = ?auto_329458 ?auto_329455 ) ) ( not ( = ?auto_329458 ?auto_329459 ) ) ( not ( = ?auto_329458 ?auto_329461 ) ) ( not ( = ?auto_329458 ?auto_329460 ) ) ( not ( = ?auto_329458 ?auto_329462 ) ) ( not ( = ?auto_329458 ?auto_329463 ) ) ( not ( = ?auto_329455 ?auto_329459 ) ) ( not ( = ?auto_329455 ?auto_329461 ) ) ( not ( = ?auto_329455 ?auto_329460 ) ) ( not ( = ?auto_329455 ?auto_329462 ) ) ( not ( = ?auto_329455 ?auto_329463 ) ) ( not ( = ?auto_329459 ?auto_329461 ) ) ( not ( = ?auto_329459 ?auto_329460 ) ) ( not ( = ?auto_329459 ?auto_329462 ) ) ( not ( = ?auto_329459 ?auto_329463 ) ) ( not ( = ?auto_329461 ?auto_329460 ) ) ( not ( = ?auto_329461 ?auto_329462 ) ) ( not ( = ?auto_329461 ?auto_329463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329460 ?auto_329462 ?auto_329463 )
      ( MAKE-8CRATE-VERIFY ?auto_329456 ?auto_329457 ?auto_329458 ?auto_329455 ?auto_329459 ?auto_329461 ?auto_329460 ?auto_329462 ?auto_329463 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329548 - SURFACE
      ?auto_329549 - SURFACE
      ?auto_329550 - SURFACE
      ?auto_329547 - SURFACE
      ?auto_329551 - SURFACE
      ?auto_329553 - SURFACE
      ?auto_329552 - SURFACE
      ?auto_329554 - SURFACE
      ?auto_329555 - SURFACE
    )
    :vars
    (
      ?auto_329560 - HOIST
      ?auto_329559 - PLACE
      ?auto_329557 - TRUCK
      ?auto_329561 - PLACE
      ?auto_329558 - HOIST
      ?auto_329556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_329560 ?auto_329559 ) ( SURFACE-AT ?auto_329554 ?auto_329559 ) ( CLEAR ?auto_329554 ) ( IS-CRATE ?auto_329555 ) ( not ( = ?auto_329554 ?auto_329555 ) ) ( AVAILABLE ?auto_329560 ) ( ON ?auto_329554 ?auto_329552 ) ( not ( = ?auto_329552 ?auto_329554 ) ) ( not ( = ?auto_329552 ?auto_329555 ) ) ( TRUCK-AT ?auto_329557 ?auto_329561 ) ( not ( = ?auto_329561 ?auto_329559 ) ) ( HOIST-AT ?auto_329558 ?auto_329561 ) ( not ( = ?auto_329560 ?auto_329558 ) ) ( AVAILABLE ?auto_329558 ) ( SURFACE-AT ?auto_329555 ?auto_329561 ) ( ON ?auto_329555 ?auto_329556 ) ( CLEAR ?auto_329555 ) ( not ( = ?auto_329554 ?auto_329556 ) ) ( not ( = ?auto_329555 ?auto_329556 ) ) ( not ( = ?auto_329552 ?auto_329556 ) ) ( ON ?auto_329549 ?auto_329548 ) ( ON ?auto_329550 ?auto_329549 ) ( ON ?auto_329547 ?auto_329550 ) ( ON ?auto_329551 ?auto_329547 ) ( ON ?auto_329553 ?auto_329551 ) ( ON ?auto_329552 ?auto_329553 ) ( not ( = ?auto_329548 ?auto_329549 ) ) ( not ( = ?auto_329548 ?auto_329550 ) ) ( not ( = ?auto_329548 ?auto_329547 ) ) ( not ( = ?auto_329548 ?auto_329551 ) ) ( not ( = ?auto_329548 ?auto_329553 ) ) ( not ( = ?auto_329548 ?auto_329552 ) ) ( not ( = ?auto_329548 ?auto_329554 ) ) ( not ( = ?auto_329548 ?auto_329555 ) ) ( not ( = ?auto_329548 ?auto_329556 ) ) ( not ( = ?auto_329549 ?auto_329550 ) ) ( not ( = ?auto_329549 ?auto_329547 ) ) ( not ( = ?auto_329549 ?auto_329551 ) ) ( not ( = ?auto_329549 ?auto_329553 ) ) ( not ( = ?auto_329549 ?auto_329552 ) ) ( not ( = ?auto_329549 ?auto_329554 ) ) ( not ( = ?auto_329549 ?auto_329555 ) ) ( not ( = ?auto_329549 ?auto_329556 ) ) ( not ( = ?auto_329550 ?auto_329547 ) ) ( not ( = ?auto_329550 ?auto_329551 ) ) ( not ( = ?auto_329550 ?auto_329553 ) ) ( not ( = ?auto_329550 ?auto_329552 ) ) ( not ( = ?auto_329550 ?auto_329554 ) ) ( not ( = ?auto_329550 ?auto_329555 ) ) ( not ( = ?auto_329550 ?auto_329556 ) ) ( not ( = ?auto_329547 ?auto_329551 ) ) ( not ( = ?auto_329547 ?auto_329553 ) ) ( not ( = ?auto_329547 ?auto_329552 ) ) ( not ( = ?auto_329547 ?auto_329554 ) ) ( not ( = ?auto_329547 ?auto_329555 ) ) ( not ( = ?auto_329547 ?auto_329556 ) ) ( not ( = ?auto_329551 ?auto_329553 ) ) ( not ( = ?auto_329551 ?auto_329552 ) ) ( not ( = ?auto_329551 ?auto_329554 ) ) ( not ( = ?auto_329551 ?auto_329555 ) ) ( not ( = ?auto_329551 ?auto_329556 ) ) ( not ( = ?auto_329553 ?auto_329552 ) ) ( not ( = ?auto_329553 ?auto_329554 ) ) ( not ( = ?auto_329553 ?auto_329555 ) ) ( not ( = ?auto_329553 ?auto_329556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329552 ?auto_329554 ?auto_329555 )
      ( MAKE-8CRATE-VERIFY ?auto_329548 ?auto_329549 ?auto_329550 ?auto_329547 ?auto_329551 ?auto_329553 ?auto_329552 ?auto_329554 ?auto_329555 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329641 - SURFACE
      ?auto_329642 - SURFACE
      ?auto_329643 - SURFACE
      ?auto_329640 - SURFACE
      ?auto_329644 - SURFACE
      ?auto_329646 - SURFACE
      ?auto_329645 - SURFACE
      ?auto_329647 - SURFACE
      ?auto_329648 - SURFACE
    )
    :vars
    (
      ?auto_329650 - HOIST
      ?auto_329654 - PLACE
      ?auto_329651 - PLACE
      ?auto_329653 - HOIST
      ?auto_329649 - SURFACE
      ?auto_329652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329650 ?auto_329654 ) ( SURFACE-AT ?auto_329647 ?auto_329654 ) ( CLEAR ?auto_329647 ) ( IS-CRATE ?auto_329648 ) ( not ( = ?auto_329647 ?auto_329648 ) ) ( AVAILABLE ?auto_329650 ) ( ON ?auto_329647 ?auto_329645 ) ( not ( = ?auto_329645 ?auto_329647 ) ) ( not ( = ?auto_329645 ?auto_329648 ) ) ( not ( = ?auto_329651 ?auto_329654 ) ) ( HOIST-AT ?auto_329653 ?auto_329651 ) ( not ( = ?auto_329650 ?auto_329653 ) ) ( AVAILABLE ?auto_329653 ) ( SURFACE-AT ?auto_329648 ?auto_329651 ) ( ON ?auto_329648 ?auto_329649 ) ( CLEAR ?auto_329648 ) ( not ( = ?auto_329647 ?auto_329649 ) ) ( not ( = ?auto_329648 ?auto_329649 ) ) ( not ( = ?auto_329645 ?auto_329649 ) ) ( TRUCK-AT ?auto_329652 ?auto_329654 ) ( ON ?auto_329642 ?auto_329641 ) ( ON ?auto_329643 ?auto_329642 ) ( ON ?auto_329640 ?auto_329643 ) ( ON ?auto_329644 ?auto_329640 ) ( ON ?auto_329646 ?auto_329644 ) ( ON ?auto_329645 ?auto_329646 ) ( not ( = ?auto_329641 ?auto_329642 ) ) ( not ( = ?auto_329641 ?auto_329643 ) ) ( not ( = ?auto_329641 ?auto_329640 ) ) ( not ( = ?auto_329641 ?auto_329644 ) ) ( not ( = ?auto_329641 ?auto_329646 ) ) ( not ( = ?auto_329641 ?auto_329645 ) ) ( not ( = ?auto_329641 ?auto_329647 ) ) ( not ( = ?auto_329641 ?auto_329648 ) ) ( not ( = ?auto_329641 ?auto_329649 ) ) ( not ( = ?auto_329642 ?auto_329643 ) ) ( not ( = ?auto_329642 ?auto_329640 ) ) ( not ( = ?auto_329642 ?auto_329644 ) ) ( not ( = ?auto_329642 ?auto_329646 ) ) ( not ( = ?auto_329642 ?auto_329645 ) ) ( not ( = ?auto_329642 ?auto_329647 ) ) ( not ( = ?auto_329642 ?auto_329648 ) ) ( not ( = ?auto_329642 ?auto_329649 ) ) ( not ( = ?auto_329643 ?auto_329640 ) ) ( not ( = ?auto_329643 ?auto_329644 ) ) ( not ( = ?auto_329643 ?auto_329646 ) ) ( not ( = ?auto_329643 ?auto_329645 ) ) ( not ( = ?auto_329643 ?auto_329647 ) ) ( not ( = ?auto_329643 ?auto_329648 ) ) ( not ( = ?auto_329643 ?auto_329649 ) ) ( not ( = ?auto_329640 ?auto_329644 ) ) ( not ( = ?auto_329640 ?auto_329646 ) ) ( not ( = ?auto_329640 ?auto_329645 ) ) ( not ( = ?auto_329640 ?auto_329647 ) ) ( not ( = ?auto_329640 ?auto_329648 ) ) ( not ( = ?auto_329640 ?auto_329649 ) ) ( not ( = ?auto_329644 ?auto_329646 ) ) ( not ( = ?auto_329644 ?auto_329645 ) ) ( not ( = ?auto_329644 ?auto_329647 ) ) ( not ( = ?auto_329644 ?auto_329648 ) ) ( not ( = ?auto_329644 ?auto_329649 ) ) ( not ( = ?auto_329646 ?auto_329645 ) ) ( not ( = ?auto_329646 ?auto_329647 ) ) ( not ( = ?auto_329646 ?auto_329648 ) ) ( not ( = ?auto_329646 ?auto_329649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329645 ?auto_329647 ?auto_329648 )
      ( MAKE-8CRATE-VERIFY ?auto_329641 ?auto_329642 ?auto_329643 ?auto_329640 ?auto_329644 ?auto_329646 ?auto_329645 ?auto_329647 ?auto_329648 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329734 - SURFACE
      ?auto_329735 - SURFACE
      ?auto_329736 - SURFACE
      ?auto_329733 - SURFACE
      ?auto_329737 - SURFACE
      ?auto_329739 - SURFACE
      ?auto_329738 - SURFACE
      ?auto_329740 - SURFACE
      ?auto_329741 - SURFACE
    )
    :vars
    (
      ?auto_329743 - HOIST
      ?auto_329747 - PLACE
      ?auto_329745 - PLACE
      ?auto_329742 - HOIST
      ?auto_329744 - SURFACE
      ?auto_329746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329743 ?auto_329747 ) ( IS-CRATE ?auto_329741 ) ( not ( = ?auto_329740 ?auto_329741 ) ) ( not ( = ?auto_329738 ?auto_329740 ) ) ( not ( = ?auto_329738 ?auto_329741 ) ) ( not ( = ?auto_329745 ?auto_329747 ) ) ( HOIST-AT ?auto_329742 ?auto_329745 ) ( not ( = ?auto_329743 ?auto_329742 ) ) ( AVAILABLE ?auto_329742 ) ( SURFACE-AT ?auto_329741 ?auto_329745 ) ( ON ?auto_329741 ?auto_329744 ) ( CLEAR ?auto_329741 ) ( not ( = ?auto_329740 ?auto_329744 ) ) ( not ( = ?auto_329741 ?auto_329744 ) ) ( not ( = ?auto_329738 ?auto_329744 ) ) ( TRUCK-AT ?auto_329746 ?auto_329747 ) ( SURFACE-AT ?auto_329738 ?auto_329747 ) ( CLEAR ?auto_329738 ) ( LIFTING ?auto_329743 ?auto_329740 ) ( IS-CRATE ?auto_329740 ) ( ON ?auto_329735 ?auto_329734 ) ( ON ?auto_329736 ?auto_329735 ) ( ON ?auto_329733 ?auto_329736 ) ( ON ?auto_329737 ?auto_329733 ) ( ON ?auto_329739 ?auto_329737 ) ( ON ?auto_329738 ?auto_329739 ) ( not ( = ?auto_329734 ?auto_329735 ) ) ( not ( = ?auto_329734 ?auto_329736 ) ) ( not ( = ?auto_329734 ?auto_329733 ) ) ( not ( = ?auto_329734 ?auto_329737 ) ) ( not ( = ?auto_329734 ?auto_329739 ) ) ( not ( = ?auto_329734 ?auto_329738 ) ) ( not ( = ?auto_329734 ?auto_329740 ) ) ( not ( = ?auto_329734 ?auto_329741 ) ) ( not ( = ?auto_329734 ?auto_329744 ) ) ( not ( = ?auto_329735 ?auto_329736 ) ) ( not ( = ?auto_329735 ?auto_329733 ) ) ( not ( = ?auto_329735 ?auto_329737 ) ) ( not ( = ?auto_329735 ?auto_329739 ) ) ( not ( = ?auto_329735 ?auto_329738 ) ) ( not ( = ?auto_329735 ?auto_329740 ) ) ( not ( = ?auto_329735 ?auto_329741 ) ) ( not ( = ?auto_329735 ?auto_329744 ) ) ( not ( = ?auto_329736 ?auto_329733 ) ) ( not ( = ?auto_329736 ?auto_329737 ) ) ( not ( = ?auto_329736 ?auto_329739 ) ) ( not ( = ?auto_329736 ?auto_329738 ) ) ( not ( = ?auto_329736 ?auto_329740 ) ) ( not ( = ?auto_329736 ?auto_329741 ) ) ( not ( = ?auto_329736 ?auto_329744 ) ) ( not ( = ?auto_329733 ?auto_329737 ) ) ( not ( = ?auto_329733 ?auto_329739 ) ) ( not ( = ?auto_329733 ?auto_329738 ) ) ( not ( = ?auto_329733 ?auto_329740 ) ) ( not ( = ?auto_329733 ?auto_329741 ) ) ( not ( = ?auto_329733 ?auto_329744 ) ) ( not ( = ?auto_329737 ?auto_329739 ) ) ( not ( = ?auto_329737 ?auto_329738 ) ) ( not ( = ?auto_329737 ?auto_329740 ) ) ( not ( = ?auto_329737 ?auto_329741 ) ) ( not ( = ?auto_329737 ?auto_329744 ) ) ( not ( = ?auto_329739 ?auto_329738 ) ) ( not ( = ?auto_329739 ?auto_329740 ) ) ( not ( = ?auto_329739 ?auto_329741 ) ) ( not ( = ?auto_329739 ?auto_329744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329738 ?auto_329740 ?auto_329741 )
      ( MAKE-8CRATE-VERIFY ?auto_329734 ?auto_329735 ?auto_329736 ?auto_329733 ?auto_329737 ?auto_329739 ?auto_329738 ?auto_329740 ?auto_329741 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329827 - SURFACE
      ?auto_329828 - SURFACE
      ?auto_329829 - SURFACE
      ?auto_329826 - SURFACE
      ?auto_329830 - SURFACE
      ?auto_329832 - SURFACE
      ?auto_329831 - SURFACE
      ?auto_329833 - SURFACE
      ?auto_329834 - SURFACE
    )
    :vars
    (
      ?auto_329835 - HOIST
      ?auto_329836 - PLACE
      ?auto_329838 - PLACE
      ?auto_329840 - HOIST
      ?auto_329839 - SURFACE
      ?auto_329837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329835 ?auto_329836 ) ( IS-CRATE ?auto_329834 ) ( not ( = ?auto_329833 ?auto_329834 ) ) ( not ( = ?auto_329831 ?auto_329833 ) ) ( not ( = ?auto_329831 ?auto_329834 ) ) ( not ( = ?auto_329838 ?auto_329836 ) ) ( HOIST-AT ?auto_329840 ?auto_329838 ) ( not ( = ?auto_329835 ?auto_329840 ) ) ( AVAILABLE ?auto_329840 ) ( SURFACE-AT ?auto_329834 ?auto_329838 ) ( ON ?auto_329834 ?auto_329839 ) ( CLEAR ?auto_329834 ) ( not ( = ?auto_329833 ?auto_329839 ) ) ( not ( = ?auto_329834 ?auto_329839 ) ) ( not ( = ?auto_329831 ?auto_329839 ) ) ( TRUCK-AT ?auto_329837 ?auto_329836 ) ( SURFACE-AT ?auto_329831 ?auto_329836 ) ( CLEAR ?auto_329831 ) ( IS-CRATE ?auto_329833 ) ( AVAILABLE ?auto_329835 ) ( IN ?auto_329833 ?auto_329837 ) ( ON ?auto_329828 ?auto_329827 ) ( ON ?auto_329829 ?auto_329828 ) ( ON ?auto_329826 ?auto_329829 ) ( ON ?auto_329830 ?auto_329826 ) ( ON ?auto_329832 ?auto_329830 ) ( ON ?auto_329831 ?auto_329832 ) ( not ( = ?auto_329827 ?auto_329828 ) ) ( not ( = ?auto_329827 ?auto_329829 ) ) ( not ( = ?auto_329827 ?auto_329826 ) ) ( not ( = ?auto_329827 ?auto_329830 ) ) ( not ( = ?auto_329827 ?auto_329832 ) ) ( not ( = ?auto_329827 ?auto_329831 ) ) ( not ( = ?auto_329827 ?auto_329833 ) ) ( not ( = ?auto_329827 ?auto_329834 ) ) ( not ( = ?auto_329827 ?auto_329839 ) ) ( not ( = ?auto_329828 ?auto_329829 ) ) ( not ( = ?auto_329828 ?auto_329826 ) ) ( not ( = ?auto_329828 ?auto_329830 ) ) ( not ( = ?auto_329828 ?auto_329832 ) ) ( not ( = ?auto_329828 ?auto_329831 ) ) ( not ( = ?auto_329828 ?auto_329833 ) ) ( not ( = ?auto_329828 ?auto_329834 ) ) ( not ( = ?auto_329828 ?auto_329839 ) ) ( not ( = ?auto_329829 ?auto_329826 ) ) ( not ( = ?auto_329829 ?auto_329830 ) ) ( not ( = ?auto_329829 ?auto_329832 ) ) ( not ( = ?auto_329829 ?auto_329831 ) ) ( not ( = ?auto_329829 ?auto_329833 ) ) ( not ( = ?auto_329829 ?auto_329834 ) ) ( not ( = ?auto_329829 ?auto_329839 ) ) ( not ( = ?auto_329826 ?auto_329830 ) ) ( not ( = ?auto_329826 ?auto_329832 ) ) ( not ( = ?auto_329826 ?auto_329831 ) ) ( not ( = ?auto_329826 ?auto_329833 ) ) ( not ( = ?auto_329826 ?auto_329834 ) ) ( not ( = ?auto_329826 ?auto_329839 ) ) ( not ( = ?auto_329830 ?auto_329832 ) ) ( not ( = ?auto_329830 ?auto_329831 ) ) ( not ( = ?auto_329830 ?auto_329833 ) ) ( not ( = ?auto_329830 ?auto_329834 ) ) ( not ( = ?auto_329830 ?auto_329839 ) ) ( not ( = ?auto_329832 ?auto_329831 ) ) ( not ( = ?auto_329832 ?auto_329833 ) ) ( not ( = ?auto_329832 ?auto_329834 ) ) ( not ( = ?auto_329832 ?auto_329839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329831 ?auto_329833 ?auto_329834 )
      ( MAKE-8CRATE-VERIFY ?auto_329827 ?auto_329828 ?auto_329829 ?auto_329826 ?auto_329830 ?auto_329832 ?auto_329831 ?auto_329833 ?auto_329834 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333943 - SURFACE
      ?auto_333944 - SURFACE
      ?auto_333945 - SURFACE
      ?auto_333942 - SURFACE
      ?auto_333946 - SURFACE
      ?auto_333948 - SURFACE
      ?auto_333947 - SURFACE
      ?auto_333949 - SURFACE
      ?auto_333950 - SURFACE
      ?auto_333951 - SURFACE
    )
    :vars
    (
      ?auto_333953 - HOIST
      ?auto_333952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333953 ?auto_333952 ) ( SURFACE-AT ?auto_333950 ?auto_333952 ) ( CLEAR ?auto_333950 ) ( LIFTING ?auto_333953 ?auto_333951 ) ( IS-CRATE ?auto_333951 ) ( not ( = ?auto_333950 ?auto_333951 ) ) ( ON ?auto_333944 ?auto_333943 ) ( ON ?auto_333945 ?auto_333944 ) ( ON ?auto_333942 ?auto_333945 ) ( ON ?auto_333946 ?auto_333942 ) ( ON ?auto_333948 ?auto_333946 ) ( ON ?auto_333947 ?auto_333948 ) ( ON ?auto_333949 ?auto_333947 ) ( ON ?auto_333950 ?auto_333949 ) ( not ( = ?auto_333943 ?auto_333944 ) ) ( not ( = ?auto_333943 ?auto_333945 ) ) ( not ( = ?auto_333943 ?auto_333942 ) ) ( not ( = ?auto_333943 ?auto_333946 ) ) ( not ( = ?auto_333943 ?auto_333948 ) ) ( not ( = ?auto_333943 ?auto_333947 ) ) ( not ( = ?auto_333943 ?auto_333949 ) ) ( not ( = ?auto_333943 ?auto_333950 ) ) ( not ( = ?auto_333943 ?auto_333951 ) ) ( not ( = ?auto_333944 ?auto_333945 ) ) ( not ( = ?auto_333944 ?auto_333942 ) ) ( not ( = ?auto_333944 ?auto_333946 ) ) ( not ( = ?auto_333944 ?auto_333948 ) ) ( not ( = ?auto_333944 ?auto_333947 ) ) ( not ( = ?auto_333944 ?auto_333949 ) ) ( not ( = ?auto_333944 ?auto_333950 ) ) ( not ( = ?auto_333944 ?auto_333951 ) ) ( not ( = ?auto_333945 ?auto_333942 ) ) ( not ( = ?auto_333945 ?auto_333946 ) ) ( not ( = ?auto_333945 ?auto_333948 ) ) ( not ( = ?auto_333945 ?auto_333947 ) ) ( not ( = ?auto_333945 ?auto_333949 ) ) ( not ( = ?auto_333945 ?auto_333950 ) ) ( not ( = ?auto_333945 ?auto_333951 ) ) ( not ( = ?auto_333942 ?auto_333946 ) ) ( not ( = ?auto_333942 ?auto_333948 ) ) ( not ( = ?auto_333942 ?auto_333947 ) ) ( not ( = ?auto_333942 ?auto_333949 ) ) ( not ( = ?auto_333942 ?auto_333950 ) ) ( not ( = ?auto_333942 ?auto_333951 ) ) ( not ( = ?auto_333946 ?auto_333948 ) ) ( not ( = ?auto_333946 ?auto_333947 ) ) ( not ( = ?auto_333946 ?auto_333949 ) ) ( not ( = ?auto_333946 ?auto_333950 ) ) ( not ( = ?auto_333946 ?auto_333951 ) ) ( not ( = ?auto_333948 ?auto_333947 ) ) ( not ( = ?auto_333948 ?auto_333949 ) ) ( not ( = ?auto_333948 ?auto_333950 ) ) ( not ( = ?auto_333948 ?auto_333951 ) ) ( not ( = ?auto_333947 ?auto_333949 ) ) ( not ( = ?auto_333947 ?auto_333950 ) ) ( not ( = ?auto_333947 ?auto_333951 ) ) ( not ( = ?auto_333949 ?auto_333950 ) ) ( not ( = ?auto_333949 ?auto_333951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_333950 ?auto_333951 )
      ( MAKE-9CRATE-VERIFY ?auto_333943 ?auto_333944 ?auto_333945 ?auto_333942 ?auto_333946 ?auto_333948 ?auto_333947 ?auto_333949 ?auto_333950 ?auto_333951 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334023 - SURFACE
      ?auto_334024 - SURFACE
      ?auto_334025 - SURFACE
      ?auto_334022 - SURFACE
      ?auto_334026 - SURFACE
      ?auto_334028 - SURFACE
      ?auto_334027 - SURFACE
      ?auto_334029 - SURFACE
      ?auto_334030 - SURFACE
      ?auto_334031 - SURFACE
    )
    :vars
    (
      ?auto_334034 - HOIST
      ?auto_334033 - PLACE
      ?auto_334032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334034 ?auto_334033 ) ( SURFACE-AT ?auto_334030 ?auto_334033 ) ( CLEAR ?auto_334030 ) ( IS-CRATE ?auto_334031 ) ( not ( = ?auto_334030 ?auto_334031 ) ) ( TRUCK-AT ?auto_334032 ?auto_334033 ) ( AVAILABLE ?auto_334034 ) ( IN ?auto_334031 ?auto_334032 ) ( ON ?auto_334030 ?auto_334029 ) ( not ( = ?auto_334029 ?auto_334030 ) ) ( not ( = ?auto_334029 ?auto_334031 ) ) ( ON ?auto_334024 ?auto_334023 ) ( ON ?auto_334025 ?auto_334024 ) ( ON ?auto_334022 ?auto_334025 ) ( ON ?auto_334026 ?auto_334022 ) ( ON ?auto_334028 ?auto_334026 ) ( ON ?auto_334027 ?auto_334028 ) ( ON ?auto_334029 ?auto_334027 ) ( not ( = ?auto_334023 ?auto_334024 ) ) ( not ( = ?auto_334023 ?auto_334025 ) ) ( not ( = ?auto_334023 ?auto_334022 ) ) ( not ( = ?auto_334023 ?auto_334026 ) ) ( not ( = ?auto_334023 ?auto_334028 ) ) ( not ( = ?auto_334023 ?auto_334027 ) ) ( not ( = ?auto_334023 ?auto_334029 ) ) ( not ( = ?auto_334023 ?auto_334030 ) ) ( not ( = ?auto_334023 ?auto_334031 ) ) ( not ( = ?auto_334024 ?auto_334025 ) ) ( not ( = ?auto_334024 ?auto_334022 ) ) ( not ( = ?auto_334024 ?auto_334026 ) ) ( not ( = ?auto_334024 ?auto_334028 ) ) ( not ( = ?auto_334024 ?auto_334027 ) ) ( not ( = ?auto_334024 ?auto_334029 ) ) ( not ( = ?auto_334024 ?auto_334030 ) ) ( not ( = ?auto_334024 ?auto_334031 ) ) ( not ( = ?auto_334025 ?auto_334022 ) ) ( not ( = ?auto_334025 ?auto_334026 ) ) ( not ( = ?auto_334025 ?auto_334028 ) ) ( not ( = ?auto_334025 ?auto_334027 ) ) ( not ( = ?auto_334025 ?auto_334029 ) ) ( not ( = ?auto_334025 ?auto_334030 ) ) ( not ( = ?auto_334025 ?auto_334031 ) ) ( not ( = ?auto_334022 ?auto_334026 ) ) ( not ( = ?auto_334022 ?auto_334028 ) ) ( not ( = ?auto_334022 ?auto_334027 ) ) ( not ( = ?auto_334022 ?auto_334029 ) ) ( not ( = ?auto_334022 ?auto_334030 ) ) ( not ( = ?auto_334022 ?auto_334031 ) ) ( not ( = ?auto_334026 ?auto_334028 ) ) ( not ( = ?auto_334026 ?auto_334027 ) ) ( not ( = ?auto_334026 ?auto_334029 ) ) ( not ( = ?auto_334026 ?auto_334030 ) ) ( not ( = ?auto_334026 ?auto_334031 ) ) ( not ( = ?auto_334028 ?auto_334027 ) ) ( not ( = ?auto_334028 ?auto_334029 ) ) ( not ( = ?auto_334028 ?auto_334030 ) ) ( not ( = ?auto_334028 ?auto_334031 ) ) ( not ( = ?auto_334027 ?auto_334029 ) ) ( not ( = ?auto_334027 ?auto_334030 ) ) ( not ( = ?auto_334027 ?auto_334031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334029 ?auto_334030 ?auto_334031 )
      ( MAKE-9CRATE-VERIFY ?auto_334023 ?auto_334024 ?auto_334025 ?auto_334022 ?auto_334026 ?auto_334028 ?auto_334027 ?auto_334029 ?auto_334030 ?auto_334031 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334113 - SURFACE
      ?auto_334114 - SURFACE
      ?auto_334115 - SURFACE
      ?auto_334112 - SURFACE
      ?auto_334116 - SURFACE
      ?auto_334118 - SURFACE
      ?auto_334117 - SURFACE
      ?auto_334119 - SURFACE
      ?auto_334120 - SURFACE
      ?auto_334121 - SURFACE
    )
    :vars
    (
      ?auto_334125 - HOIST
      ?auto_334122 - PLACE
      ?auto_334124 - TRUCK
      ?auto_334123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_334125 ?auto_334122 ) ( SURFACE-AT ?auto_334120 ?auto_334122 ) ( CLEAR ?auto_334120 ) ( IS-CRATE ?auto_334121 ) ( not ( = ?auto_334120 ?auto_334121 ) ) ( AVAILABLE ?auto_334125 ) ( IN ?auto_334121 ?auto_334124 ) ( ON ?auto_334120 ?auto_334119 ) ( not ( = ?auto_334119 ?auto_334120 ) ) ( not ( = ?auto_334119 ?auto_334121 ) ) ( TRUCK-AT ?auto_334124 ?auto_334123 ) ( not ( = ?auto_334123 ?auto_334122 ) ) ( ON ?auto_334114 ?auto_334113 ) ( ON ?auto_334115 ?auto_334114 ) ( ON ?auto_334112 ?auto_334115 ) ( ON ?auto_334116 ?auto_334112 ) ( ON ?auto_334118 ?auto_334116 ) ( ON ?auto_334117 ?auto_334118 ) ( ON ?auto_334119 ?auto_334117 ) ( not ( = ?auto_334113 ?auto_334114 ) ) ( not ( = ?auto_334113 ?auto_334115 ) ) ( not ( = ?auto_334113 ?auto_334112 ) ) ( not ( = ?auto_334113 ?auto_334116 ) ) ( not ( = ?auto_334113 ?auto_334118 ) ) ( not ( = ?auto_334113 ?auto_334117 ) ) ( not ( = ?auto_334113 ?auto_334119 ) ) ( not ( = ?auto_334113 ?auto_334120 ) ) ( not ( = ?auto_334113 ?auto_334121 ) ) ( not ( = ?auto_334114 ?auto_334115 ) ) ( not ( = ?auto_334114 ?auto_334112 ) ) ( not ( = ?auto_334114 ?auto_334116 ) ) ( not ( = ?auto_334114 ?auto_334118 ) ) ( not ( = ?auto_334114 ?auto_334117 ) ) ( not ( = ?auto_334114 ?auto_334119 ) ) ( not ( = ?auto_334114 ?auto_334120 ) ) ( not ( = ?auto_334114 ?auto_334121 ) ) ( not ( = ?auto_334115 ?auto_334112 ) ) ( not ( = ?auto_334115 ?auto_334116 ) ) ( not ( = ?auto_334115 ?auto_334118 ) ) ( not ( = ?auto_334115 ?auto_334117 ) ) ( not ( = ?auto_334115 ?auto_334119 ) ) ( not ( = ?auto_334115 ?auto_334120 ) ) ( not ( = ?auto_334115 ?auto_334121 ) ) ( not ( = ?auto_334112 ?auto_334116 ) ) ( not ( = ?auto_334112 ?auto_334118 ) ) ( not ( = ?auto_334112 ?auto_334117 ) ) ( not ( = ?auto_334112 ?auto_334119 ) ) ( not ( = ?auto_334112 ?auto_334120 ) ) ( not ( = ?auto_334112 ?auto_334121 ) ) ( not ( = ?auto_334116 ?auto_334118 ) ) ( not ( = ?auto_334116 ?auto_334117 ) ) ( not ( = ?auto_334116 ?auto_334119 ) ) ( not ( = ?auto_334116 ?auto_334120 ) ) ( not ( = ?auto_334116 ?auto_334121 ) ) ( not ( = ?auto_334118 ?auto_334117 ) ) ( not ( = ?auto_334118 ?auto_334119 ) ) ( not ( = ?auto_334118 ?auto_334120 ) ) ( not ( = ?auto_334118 ?auto_334121 ) ) ( not ( = ?auto_334117 ?auto_334119 ) ) ( not ( = ?auto_334117 ?auto_334120 ) ) ( not ( = ?auto_334117 ?auto_334121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334119 ?auto_334120 ?auto_334121 )
      ( MAKE-9CRATE-VERIFY ?auto_334113 ?auto_334114 ?auto_334115 ?auto_334112 ?auto_334116 ?auto_334118 ?auto_334117 ?auto_334119 ?auto_334120 ?auto_334121 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334212 - SURFACE
      ?auto_334213 - SURFACE
      ?auto_334214 - SURFACE
      ?auto_334211 - SURFACE
      ?auto_334215 - SURFACE
      ?auto_334217 - SURFACE
      ?auto_334216 - SURFACE
      ?auto_334218 - SURFACE
      ?auto_334219 - SURFACE
      ?auto_334220 - SURFACE
    )
    :vars
    (
      ?auto_334223 - HOIST
      ?auto_334224 - PLACE
      ?auto_334221 - TRUCK
      ?auto_334225 - PLACE
      ?auto_334222 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_334223 ?auto_334224 ) ( SURFACE-AT ?auto_334219 ?auto_334224 ) ( CLEAR ?auto_334219 ) ( IS-CRATE ?auto_334220 ) ( not ( = ?auto_334219 ?auto_334220 ) ) ( AVAILABLE ?auto_334223 ) ( ON ?auto_334219 ?auto_334218 ) ( not ( = ?auto_334218 ?auto_334219 ) ) ( not ( = ?auto_334218 ?auto_334220 ) ) ( TRUCK-AT ?auto_334221 ?auto_334225 ) ( not ( = ?auto_334225 ?auto_334224 ) ) ( HOIST-AT ?auto_334222 ?auto_334225 ) ( LIFTING ?auto_334222 ?auto_334220 ) ( not ( = ?auto_334223 ?auto_334222 ) ) ( ON ?auto_334213 ?auto_334212 ) ( ON ?auto_334214 ?auto_334213 ) ( ON ?auto_334211 ?auto_334214 ) ( ON ?auto_334215 ?auto_334211 ) ( ON ?auto_334217 ?auto_334215 ) ( ON ?auto_334216 ?auto_334217 ) ( ON ?auto_334218 ?auto_334216 ) ( not ( = ?auto_334212 ?auto_334213 ) ) ( not ( = ?auto_334212 ?auto_334214 ) ) ( not ( = ?auto_334212 ?auto_334211 ) ) ( not ( = ?auto_334212 ?auto_334215 ) ) ( not ( = ?auto_334212 ?auto_334217 ) ) ( not ( = ?auto_334212 ?auto_334216 ) ) ( not ( = ?auto_334212 ?auto_334218 ) ) ( not ( = ?auto_334212 ?auto_334219 ) ) ( not ( = ?auto_334212 ?auto_334220 ) ) ( not ( = ?auto_334213 ?auto_334214 ) ) ( not ( = ?auto_334213 ?auto_334211 ) ) ( not ( = ?auto_334213 ?auto_334215 ) ) ( not ( = ?auto_334213 ?auto_334217 ) ) ( not ( = ?auto_334213 ?auto_334216 ) ) ( not ( = ?auto_334213 ?auto_334218 ) ) ( not ( = ?auto_334213 ?auto_334219 ) ) ( not ( = ?auto_334213 ?auto_334220 ) ) ( not ( = ?auto_334214 ?auto_334211 ) ) ( not ( = ?auto_334214 ?auto_334215 ) ) ( not ( = ?auto_334214 ?auto_334217 ) ) ( not ( = ?auto_334214 ?auto_334216 ) ) ( not ( = ?auto_334214 ?auto_334218 ) ) ( not ( = ?auto_334214 ?auto_334219 ) ) ( not ( = ?auto_334214 ?auto_334220 ) ) ( not ( = ?auto_334211 ?auto_334215 ) ) ( not ( = ?auto_334211 ?auto_334217 ) ) ( not ( = ?auto_334211 ?auto_334216 ) ) ( not ( = ?auto_334211 ?auto_334218 ) ) ( not ( = ?auto_334211 ?auto_334219 ) ) ( not ( = ?auto_334211 ?auto_334220 ) ) ( not ( = ?auto_334215 ?auto_334217 ) ) ( not ( = ?auto_334215 ?auto_334216 ) ) ( not ( = ?auto_334215 ?auto_334218 ) ) ( not ( = ?auto_334215 ?auto_334219 ) ) ( not ( = ?auto_334215 ?auto_334220 ) ) ( not ( = ?auto_334217 ?auto_334216 ) ) ( not ( = ?auto_334217 ?auto_334218 ) ) ( not ( = ?auto_334217 ?auto_334219 ) ) ( not ( = ?auto_334217 ?auto_334220 ) ) ( not ( = ?auto_334216 ?auto_334218 ) ) ( not ( = ?auto_334216 ?auto_334219 ) ) ( not ( = ?auto_334216 ?auto_334220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334218 ?auto_334219 ?auto_334220 )
      ( MAKE-9CRATE-VERIFY ?auto_334212 ?auto_334213 ?auto_334214 ?auto_334211 ?auto_334215 ?auto_334217 ?auto_334216 ?auto_334218 ?auto_334219 ?auto_334220 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334320 - SURFACE
      ?auto_334321 - SURFACE
      ?auto_334322 - SURFACE
      ?auto_334319 - SURFACE
      ?auto_334323 - SURFACE
      ?auto_334325 - SURFACE
      ?auto_334324 - SURFACE
      ?auto_334326 - SURFACE
      ?auto_334327 - SURFACE
      ?auto_334328 - SURFACE
    )
    :vars
    (
      ?auto_334330 - HOIST
      ?auto_334332 - PLACE
      ?auto_334329 - TRUCK
      ?auto_334333 - PLACE
      ?auto_334334 - HOIST
      ?auto_334331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_334330 ?auto_334332 ) ( SURFACE-AT ?auto_334327 ?auto_334332 ) ( CLEAR ?auto_334327 ) ( IS-CRATE ?auto_334328 ) ( not ( = ?auto_334327 ?auto_334328 ) ) ( AVAILABLE ?auto_334330 ) ( ON ?auto_334327 ?auto_334326 ) ( not ( = ?auto_334326 ?auto_334327 ) ) ( not ( = ?auto_334326 ?auto_334328 ) ) ( TRUCK-AT ?auto_334329 ?auto_334333 ) ( not ( = ?auto_334333 ?auto_334332 ) ) ( HOIST-AT ?auto_334334 ?auto_334333 ) ( not ( = ?auto_334330 ?auto_334334 ) ) ( AVAILABLE ?auto_334334 ) ( SURFACE-AT ?auto_334328 ?auto_334333 ) ( ON ?auto_334328 ?auto_334331 ) ( CLEAR ?auto_334328 ) ( not ( = ?auto_334327 ?auto_334331 ) ) ( not ( = ?auto_334328 ?auto_334331 ) ) ( not ( = ?auto_334326 ?auto_334331 ) ) ( ON ?auto_334321 ?auto_334320 ) ( ON ?auto_334322 ?auto_334321 ) ( ON ?auto_334319 ?auto_334322 ) ( ON ?auto_334323 ?auto_334319 ) ( ON ?auto_334325 ?auto_334323 ) ( ON ?auto_334324 ?auto_334325 ) ( ON ?auto_334326 ?auto_334324 ) ( not ( = ?auto_334320 ?auto_334321 ) ) ( not ( = ?auto_334320 ?auto_334322 ) ) ( not ( = ?auto_334320 ?auto_334319 ) ) ( not ( = ?auto_334320 ?auto_334323 ) ) ( not ( = ?auto_334320 ?auto_334325 ) ) ( not ( = ?auto_334320 ?auto_334324 ) ) ( not ( = ?auto_334320 ?auto_334326 ) ) ( not ( = ?auto_334320 ?auto_334327 ) ) ( not ( = ?auto_334320 ?auto_334328 ) ) ( not ( = ?auto_334320 ?auto_334331 ) ) ( not ( = ?auto_334321 ?auto_334322 ) ) ( not ( = ?auto_334321 ?auto_334319 ) ) ( not ( = ?auto_334321 ?auto_334323 ) ) ( not ( = ?auto_334321 ?auto_334325 ) ) ( not ( = ?auto_334321 ?auto_334324 ) ) ( not ( = ?auto_334321 ?auto_334326 ) ) ( not ( = ?auto_334321 ?auto_334327 ) ) ( not ( = ?auto_334321 ?auto_334328 ) ) ( not ( = ?auto_334321 ?auto_334331 ) ) ( not ( = ?auto_334322 ?auto_334319 ) ) ( not ( = ?auto_334322 ?auto_334323 ) ) ( not ( = ?auto_334322 ?auto_334325 ) ) ( not ( = ?auto_334322 ?auto_334324 ) ) ( not ( = ?auto_334322 ?auto_334326 ) ) ( not ( = ?auto_334322 ?auto_334327 ) ) ( not ( = ?auto_334322 ?auto_334328 ) ) ( not ( = ?auto_334322 ?auto_334331 ) ) ( not ( = ?auto_334319 ?auto_334323 ) ) ( not ( = ?auto_334319 ?auto_334325 ) ) ( not ( = ?auto_334319 ?auto_334324 ) ) ( not ( = ?auto_334319 ?auto_334326 ) ) ( not ( = ?auto_334319 ?auto_334327 ) ) ( not ( = ?auto_334319 ?auto_334328 ) ) ( not ( = ?auto_334319 ?auto_334331 ) ) ( not ( = ?auto_334323 ?auto_334325 ) ) ( not ( = ?auto_334323 ?auto_334324 ) ) ( not ( = ?auto_334323 ?auto_334326 ) ) ( not ( = ?auto_334323 ?auto_334327 ) ) ( not ( = ?auto_334323 ?auto_334328 ) ) ( not ( = ?auto_334323 ?auto_334331 ) ) ( not ( = ?auto_334325 ?auto_334324 ) ) ( not ( = ?auto_334325 ?auto_334326 ) ) ( not ( = ?auto_334325 ?auto_334327 ) ) ( not ( = ?auto_334325 ?auto_334328 ) ) ( not ( = ?auto_334325 ?auto_334331 ) ) ( not ( = ?auto_334324 ?auto_334326 ) ) ( not ( = ?auto_334324 ?auto_334327 ) ) ( not ( = ?auto_334324 ?auto_334328 ) ) ( not ( = ?auto_334324 ?auto_334331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334326 ?auto_334327 ?auto_334328 )
      ( MAKE-9CRATE-VERIFY ?auto_334320 ?auto_334321 ?auto_334322 ?auto_334319 ?auto_334323 ?auto_334325 ?auto_334324 ?auto_334326 ?auto_334327 ?auto_334328 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334429 - SURFACE
      ?auto_334430 - SURFACE
      ?auto_334431 - SURFACE
      ?auto_334428 - SURFACE
      ?auto_334432 - SURFACE
      ?auto_334434 - SURFACE
      ?auto_334433 - SURFACE
      ?auto_334435 - SURFACE
      ?auto_334436 - SURFACE
      ?auto_334437 - SURFACE
    )
    :vars
    (
      ?auto_334438 - HOIST
      ?auto_334441 - PLACE
      ?auto_334442 - PLACE
      ?auto_334443 - HOIST
      ?auto_334440 - SURFACE
      ?auto_334439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334438 ?auto_334441 ) ( SURFACE-AT ?auto_334436 ?auto_334441 ) ( CLEAR ?auto_334436 ) ( IS-CRATE ?auto_334437 ) ( not ( = ?auto_334436 ?auto_334437 ) ) ( AVAILABLE ?auto_334438 ) ( ON ?auto_334436 ?auto_334435 ) ( not ( = ?auto_334435 ?auto_334436 ) ) ( not ( = ?auto_334435 ?auto_334437 ) ) ( not ( = ?auto_334442 ?auto_334441 ) ) ( HOIST-AT ?auto_334443 ?auto_334442 ) ( not ( = ?auto_334438 ?auto_334443 ) ) ( AVAILABLE ?auto_334443 ) ( SURFACE-AT ?auto_334437 ?auto_334442 ) ( ON ?auto_334437 ?auto_334440 ) ( CLEAR ?auto_334437 ) ( not ( = ?auto_334436 ?auto_334440 ) ) ( not ( = ?auto_334437 ?auto_334440 ) ) ( not ( = ?auto_334435 ?auto_334440 ) ) ( TRUCK-AT ?auto_334439 ?auto_334441 ) ( ON ?auto_334430 ?auto_334429 ) ( ON ?auto_334431 ?auto_334430 ) ( ON ?auto_334428 ?auto_334431 ) ( ON ?auto_334432 ?auto_334428 ) ( ON ?auto_334434 ?auto_334432 ) ( ON ?auto_334433 ?auto_334434 ) ( ON ?auto_334435 ?auto_334433 ) ( not ( = ?auto_334429 ?auto_334430 ) ) ( not ( = ?auto_334429 ?auto_334431 ) ) ( not ( = ?auto_334429 ?auto_334428 ) ) ( not ( = ?auto_334429 ?auto_334432 ) ) ( not ( = ?auto_334429 ?auto_334434 ) ) ( not ( = ?auto_334429 ?auto_334433 ) ) ( not ( = ?auto_334429 ?auto_334435 ) ) ( not ( = ?auto_334429 ?auto_334436 ) ) ( not ( = ?auto_334429 ?auto_334437 ) ) ( not ( = ?auto_334429 ?auto_334440 ) ) ( not ( = ?auto_334430 ?auto_334431 ) ) ( not ( = ?auto_334430 ?auto_334428 ) ) ( not ( = ?auto_334430 ?auto_334432 ) ) ( not ( = ?auto_334430 ?auto_334434 ) ) ( not ( = ?auto_334430 ?auto_334433 ) ) ( not ( = ?auto_334430 ?auto_334435 ) ) ( not ( = ?auto_334430 ?auto_334436 ) ) ( not ( = ?auto_334430 ?auto_334437 ) ) ( not ( = ?auto_334430 ?auto_334440 ) ) ( not ( = ?auto_334431 ?auto_334428 ) ) ( not ( = ?auto_334431 ?auto_334432 ) ) ( not ( = ?auto_334431 ?auto_334434 ) ) ( not ( = ?auto_334431 ?auto_334433 ) ) ( not ( = ?auto_334431 ?auto_334435 ) ) ( not ( = ?auto_334431 ?auto_334436 ) ) ( not ( = ?auto_334431 ?auto_334437 ) ) ( not ( = ?auto_334431 ?auto_334440 ) ) ( not ( = ?auto_334428 ?auto_334432 ) ) ( not ( = ?auto_334428 ?auto_334434 ) ) ( not ( = ?auto_334428 ?auto_334433 ) ) ( not ( = ?auto_334428 ?auto_334435 ) ) ( not ( = ?auto_334428 ?auto_334436 ) ) ( not ( = ?auto_334428 ?auto_334437 ) ) ( not ( = ?auto_334428 ?auto_334440 ) ) ( not ( = ?auto_334432 ?auto_334434 ) ) ( not ( = ?auto_334432 ?auto_334433 ) ) ( not ( = ?auto_334432 ?auto_334435 ) ) ( not ( = ?auto_334432 ?auto_334436 ) ) ( not ( = ?auto_334432 ?auto_334437 ) ) ( not ( = ?auto_334432 ?auto_334440 ) ) ( not ( = ?auto_334434 ?auto_334433 ) ) ( not ( = ?auto_334434 ?auto_334435 ) ) ( not ( = ?auto_334434 ?auto_334436 ) ) ( not ( = ?auto_334434 ?auto_334437 ) ) ( not ( = ?auto_334434 ?auto_334440 ) ) ( not ( = ?auto_334433 ?auto_334435 ) ) ( not ( = ?auto_334433 ?auto_334436 ) ) ( not ( = ?auto_334433 ?auto_334437 ) ) ( not ( = ?auto_334433 ?auto_334440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334435 ?auto_334436 ?auto_334437 )
      ( MAKE-9CRATE-VERIFY ?auto_334429 ?auto_334430 ?auto_334431 ?auto_334428 ?auto_334432 ?auto_334434 ?auto_334433 ?auto_334435 ?auto_334436 ?auto_334437 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334538 - SURFACE
      ?auto_334539 - SURFACE
      ?auto_334540 - SURFACE
      ?auto_334537 - SURFACE
      ?auto_334541 - SURFACE
      ?auto_334543 - SURFACE
      ?auto_334542 - SURFACE
      ?auto_334544 - SURFACE
      ?auto_334545 - SURFACE
      ?auto_334546 - SURFACE
    )
    :vars
    (
      ?auto_334547 - HOIST
      ?auto_334550 - PLACE
      ?auto_334551 - PLACE
      ?auto_334552 - HOIST
      ?auto_334548 - SURFACE
      ?auto_334549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334547 ?auto_334550 ) ( IS-CRATE ?auto_334546 ) ( not ( = ?auto_334545 ?auto_334546 ) ) ( not ( = ?auto_334544 ?auto_334545 ) ) ( not ( = ?auto_334544 ?auto_334546 ) ) ( not ( = ?auto_334551 ?auto_334550 ) ) ( HOIST-AT ?auto_334552 ?auto_334551 ) ( not ( = ?auto_334547 ?auto_334552 ) ) ( AVAILABLE ?auto_334552 ) ( SURFACE-AT ?auto_334546 ?auto_334551 ) ( ON ?auto_334546 ?auto_334548 ) ( CLEAR ?auto_334546 ) ( not ( = ?auto_334545 ?auto_334548 ) ) ( not ( = ?auto_334546 ?auto_334548 ) ) ( not ( = ?auto_334544 ?auto_334548 ) ) ( TRUCK-AT ?auto_334549 ?auto_334550 ) ( SURFACE-AT ?auto_334544 ?auto_334550 ) ( CLEAR ?auto_334544 ) ( LIFTING ?auto_334547 ?auto_334545 ) ( IS-CRATE ?auto_334545 ) ( ON ?auto_334539 ?auto_334538 ) ( ON ?auto_334540 ?auto_334539 ) ( ON ?auto_334537 ?auto_334540 ) ( ON ?auto_334541 ?auto_334537 ) ( ON ?auto_334543 ?auto_334541 ) ( ON ?auto_334542 ?auto_334543 ) ( ON ?auto_334544 ?auto_334542 ) ( not ( = ?auto_334538 ?auto_334539 ) ) ( not ( = ?auto_334538 ?auto_334540 ) ) ( not ( = ?auto_334538 ?auto_334537 ) ) ( not ( = ?auto_334538 ?auto_334541 ) ) ( not ( = ?auto_334538 ?auto_334543 ) ) ( not ( = ?auto_334538 ?auto_334542 ) ) ( not ( = ?auto_334538 ?auto_334544 ) ) ( not ( = ?auto_334538 ?auto_334545 ) ) ( not ( = ?auto_334538 ?auto_334546 ) ) ( not ( = ?auto_334538 ?auto_334548 ) ) ( not ( = ?auto_334539 ?auto_334540 ) ) ( not ( = ?auto_334539 ?auto_334537 ) ) ( not ( = ?auto_334539 ?auto_334541 ) ) ( not ( = ?auto_334539 ?auto_334543 ) ) ( not ( = ?auto_334539 ?auto_334542 ) ) ( not ( = ?auto_334539 ?auto_334544 ) ) ( not ( = ?auto_334539 ?auto_334545 ) ) ( not ( = ?auto_334539 ?auto_334546 ) ) ( not ( = ?auto_334539 ?auto_334548 ) ) ( not ( = ?auto_334540 ?auto_334537 ) ) ( not ( = ?auto_334540 ?auto_334541 ) ) ( not ( = ?auto_334540 ?auto_334543 ) ) ( not ( = ?auto_334540 ?auto_334542 ) ) ( not ( = ?auto_334540 ?auto_334544 ) ) ( not ( = ?auto_334540 ?auto_334545 ) ) ( not ( = ?auto_334540 ?auto_334546 ) ) ( not ( = ?auto_334540 ?auto_334548 ) ) ( not ( = ?auto_334537 ?auto_334541 ) ) ( not ( = ?auto_334537 ?auto_334543 ) ) ( not ( = ?auto_334537 ?auto_334542 ) ) ( not ( = ?auto_334537 ?auto_334544 ) ) ( not ( = ?auto_334537 ?auto_334545 ) ) ( not ( = ?auto_334537 ?auto_334546 ) ) ( not ( = ?auto_334537 ?auto_334548 ) ) ( not ( = ?auto_334541 ?auto_334543 ) ) ( not ( = ?auto_334541 ?auto_334542 ) ) ( not ( = ?auto_334541 ?auto_334544 ) ) ( not ( = ?auto_334541 ?auto_334545 ) ) ( not ( = ?auto_334541 ?auto_334546 ) ) ( not ( = ?auto_334541 ?auto_334548 ) ) ( not ( = ?auto_334543 ?auto_334542 ) ) ( not ( = ?auto_334543 ?auto_334544 ) ) ( not ( = ?auto_334543 ?auto_334545 ) ) ( not ( = ?auto_334543 ?auto_334546 ) ) ( not ( = ?auto_334543 ?auto_334548 ) ) ( not ( = ?auto_334542 ?auto_334544 ) ) ( not ( = ?auto_334542 ?auto_334545 ) ) ( not ( = ?auto_334542 ?auto_334546 ) ) ( not ( = ?auto_334542 ?auto_334548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334544 ?auto_334545 ?auto_334546 )
      ( MAKE-9CRATE-VERIFY ?auto_334538 ?auto_334539 ?auto_334540 ?auto_334537 ?auto_334541 ?auto_334543 ?auto_334542 ?auto_334544 ?auto_334545 ?auto_334546 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334647 - SURFACE
      ?auto_334648 - SURFACE
      ?auto_334649 - SURFACE
      ?auto_334646 - SURFACE
      ?auto_334650 - SURFACE
      ?auto_334652 - SURFACE
      ?auto_334651 - SURFACE
      ?auto_334653 - SURFACE
      ?auto_334654 - SURFACE
      ?auto_334655 - SURFACE
    )
    :vars
    (
      ?auto_334658 - HOIST
      ?auto_334656 - PLACE
      ?auto_334657 - PLACE
      ?auto_334660 - HOIST
      ?auto_334659 - SURFACE
      ?auto_334661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334658 ?auto_334656 ) ( IS-CRATE ?auto_334655 ) ( not ( = ?auto_334654 ?auto_334655 ) ) ( not ( = ?auto_334653 ?auto_334654 ) ) ( not ( = ?auto_334653 ?auto_334655 ) ) ( not ( = ?auto_334657 ?auto_334656 ) ) ( HOIST-AT ?auto_334660 ?auto_334657 ) ( not ( = ?auto_334658 ?auto_334660 ) ) ( AVAILABLE ?auto_334660 ) ( SURFACE-AT ?auto_334655 ?auto_334657 ) ( ON ?auto_334655 ?auto_334659 ) ( CLEAR ?auto_334655 ) ( not ( = ?auto_334654 ?auto_334659 ) ) ( not ( = ?auto_334655 ?auto_334659 ) ) ( not ( = ?auto_334653 ?auto_334659 ) ) ( TRUCK-AT ?auto_334661 ?auto_334656 ) ( SURFACE-AT ?auto_334653 ?auto_334656 ) ( CLEAR ?auto_334653 ) ( IS-CRATE ?auto_334654 ) ( AVAILABLE ?auto_334658 ) ( IN ?auto_334654 ?auto_334661 ) ( ON ?auto_334648 ?auto_334647 ) ( ON ?auto_334649 ?auto_334648 ) ( ON ?auto_334646 ?auto_334649 ) ( ON ?auto_334650 ?auto_334646 ) ( ON ?auto_334652 ?auto_334650 ) ( ON ?auto_334651 ?auto_334652 ) ( ON ?auto_334653 ?auto_334651 ) ( not ( = ?auto_334647 ?auto_334648 ) ) ( not ( = ?auto_334647 ?auto_334649 ) ) ( not ( = ?auto_334647 ?auto_334646 ) ) ( not ( = ?auto_334647 ?auto_334650 ) ) ( not ( = ?auto_334647 ?auto_334652 ) ) ( not ( = ?auto_334647 ?auto_334651 ) ) ( not ( = ?auto_334647 ?auto_334653 ) ) ( not ( = ?auto_334647 ?auto_334654 ) ) ( not ( = ?auto_334647 ?auto_334655 ) ) ( not ( = ?auto_334647 ?auto_334659 ) ) ( not ( = ?auto_334648 ?auto_334649 ) ) ( not ( = ?auto_334648 ?auto_334646 ) ) ( not ( = ?auto_334648 ?auto_334650 ) ) ( not ( = ?auto_334648 ?auto_334652 ) ) ( not ( = ?auto_334648 ?auto_334651 ) ) ( not ( = ?auto_334648 ?auto_334653 ) ) ( not ( = ?auto_334648 ?auto_334654 ) ) ( not ( = ?auto_334648 ?auto_334655 ) ) ( not ( = ?auto_334648 ?auto_334659 ) ) ( not ( = ?auto_334649 ?auto_334646 ) ) ( not ( = ?auto_334649 ?auto_334650 ) ) ( not ( = ?auto_334649 ?auto_334652 ) ) ( not ( = ?auto_334649 ?auto_334651 ) ) ( not ( = ?auto_334649 ?auto_334653 ) ) ( not ( = ?auto_334649 ?auto_334654 ) ) ( not ( = ?auto_334649 ?auto_334655 ) ) ( not ( = ?auto_334649 ?auto_334659 ) ) ( not ( = ?auto_334646 ?auto_334650 ) ) ( not ( = ?auto_334646 ?auto_334652 ) ) ( not ( = ?auto_334646 ?auto_334651 ) ) ( not ( = ?auto_334646 ?auto_334653 ) ) ( not ( = ?auto_334646 ?auto_334654 ) ) ( not ( = ?auto_334646 ?auto_334655 ) ) ( not ( = ?auto_334646 ?auto_334659 ) ) ( not ( = ?auto_334650 ?auto_334652 ) ) ( not ( = ?auto_334650 ?auto_334651 ) ) ( not ( = ?auto_334650 ?auto_334653 ) ) ( not ( = ?auto_334650 ?auto_334654 ) ) ( not ( = ?auto_334650 ?auto_334655 ) ) ( not ( = ?auto_334650 ?auto_334659 ) ) ( not ( = ?auto_334652 ?auto_334651 ) ) ( not ( = ?auto_334652 ?auto_334653 ) ) ( not ( = ?auto_334652 ?auto_334654 ) ) ( not ( = ?auto_334652 ?auto_334655 ) ) ( not ( = ?auto_334652 ?auto_334659 ) ) ( not ( = ?auto_334651 ?auto_334653 ) ) ( not ( = ?auto_334651 ?auto_334654 ) ) ( not ( = ?auto_334651 ?auto_334655 ) ) ( not ( = ?auto_334651 ?auto_334659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334653 ?auto_334654 ?auto_334655 )
      ( MAKE-9CRATE-VERIFY ?auto_334647 ?auto_334648 ?auto_334649 ?auto_334646 ?auto_334650 ?auto_334652 ?auto_334651 ?auto_334653 ?auto_334654 ?auto_334655 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340139 - SURFACE
      ?auto_340140 - SURFACE
      ?auto_340141 - SURFACE
      ?auto_340138 - SURFACE
      ?auto_340142 - SURFACE
      ?auto_340144 - SURFACE
      ?auto_340143 - SURFACE
      ?auto_340145 - SURFACE
      ?auto_340146 - SURFACE
      ?auto_340147 - SURFACE
      ?auto_340148 - SURFACE
    )
    :vars
    (
      ?auto_340150 - HOIST
      ?auto_340149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_340150 ?auto_340149 ) ( SURFACE-AT ?auto_340147 ?auto_340149 ) ( CLEAR ?auto_340147 ) ( LIFTING ?auto_340150 ?auto_340148 ) ( IS-CRATE ?auto_340148 ) ( not ( = ?auto_340147 ?auto_340148 ) ) ( ON ?auto_340140 ?auto_340139 ) ( ON ?auto_340141 ?auto_340140 ) ( ON ?auto_340138 ?auto_340141 ) ( ON ?auto_340142 ?auto_340138 ) ( ON ?auto_340144 ?auto_340142 ) ( ON ?auto_340143 ?auto_340144 ) ( ON ?auto_340145 ?auto_340143 ) ( ON ?auto_340146 ?auto_340145 ) ( ON ?auto_340147 ?auto_340146 ) ( not ( = ?auto_340139 ?auto_340140 ) ) ( not ( = ?auto_340139 ?auto_340141 ) ) ( not ( = ?auto_340139 ?auto_340138 ) ) ( not ( = ?auto_340139 ?auto_340142 ) ) ( not ( = ?auto_340139 ?auto_340144 ) ) ( not ( = ?auto_340139 ?auto_340143 ) ) ( not ( = ?auto_340139 ?auto_340145 ) ) ( not ( = ?auto_340139 ?auto_340146 ) ) ( not ( = ?auto_340139 ?auto_340147 ) ) ( not ( = ?auto_340139 ?auto_340148 ) ) ( not ( = ?auto_340140 ?auto_340141 ) ) ( not ( = ?auto_340140 ?auto_340138 ) ) ( not ( = ?auto_340140 ?auto_340142 ) ) ( not ( = ?auto_340140 ?auto_340144 ) ) ( not ( = ?auto_340140 ?auto_340143 ) ) ( not ( = ?auto_340140 ?auto_340145 ) ) ( not ( = ?auto_340140 ?auto_340146 ) ) ( not ( = ?auto_340140 ?auto_340147 ) ) ( not ( = ?auto_340140 ?auto_340148 ) ) ( not ( = ?auto_340141 ?auto_340138 ) ) ( not ( = ?auto_340141 ?auto_340142 ) ) ( not ( = ?auto_340141 ?auto_340144 ) ) ( not ( = ?auto_340141 ?auto_340143 ) ) ( not ( = ?auto_340141 ?auto_340145 ) ) ( not ( = ?auto_340141 ?auto_340146 ) ) ( not ( = ?auto_340141 ?auto_340147 ) ) ( not ( = ?auto_340141 ?auto_340148 ) ) ( not ( = ?auto_340138 ?auto_340142 ) ) ( not ( = ?auto_340138 ?auto_340144 ) ) ( not ( = ?auto_340138 ?auto_340143 ) ) ( not ( = ?auto_340138 ?auto_340145 ) ) ( not ( = ?auto_340138 ?auto_340146 ) ) ( not ( = ?auto_340138 ?auto_340147 ) ) ( not ( = ?auto_340138 ?auto_340148 ) ) ( not ( = ?auto_340142 ?auto_340144 ) ) ( not ( = ?auto_340142 ?auto_340143 ) ) ( not ( = ?auto_340142 ?auto_340145 ) ) ( not ( = ?auto_340142 ?auto_340146 ) ) ( not ( = ?auto_340142 ?auto_340147 ) ) ( not ( = ?auto_340142 ?auto_340148 ) ) ( not ( = ?auto_340144 ?auto_340143 ) ) ( not ( = ?auto_340144 ?auto_340145 ) ) ( not ( = ?auto_340144 ?auto_340146 ) ) ( not ( = ?auto_340144 ?auto_340147 ) ) ( not ( = ?auto_340144 ?auto_340148 ) ) ( not ( = ?auto_340143 ?auto_340145 ) ) ( not ( = ?auto_340143 ?auto_340146 ) ) ( not ( = ?auto_340143 ?auto_340147 ) ) ( not ( = ?auto_340143 ?auto_340148 ) ) ( not ( = ?auto_340145 ?auto_340146 ) ) ( not ( = ?auto_340145 ?auto_340147 ) ) ( not ( = ?auto_340145 ?auto_340148 ) ) ( not ( = ?auto_340146 ?auto_340147 ) ) ( not ( = ?auto_340146 ?auto_340148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_340147 ?auto_340148 )
      ( MAKE-10CRATE-VERIFY ?auto_340139 ?auto_340140 ?auto_340141 ?auto_340138 ?auto_340142 ?auto_340144 ?auto_340143 ?auto_340145 ?auto_340146 ?auto_340147 ?auto_340148 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340233 - SURFACE
      ?auto_340234 - SURFACE
      ?auto_340235 - SURFACE
      ?auto_340232 - SURFACE
      ?auto_340236 - SURFACE
      ?auto_340238 - SURFACE
      ?auto_340237 - SURFACE
      ?auto_340239 - SURFACE
      ?auto_340240 - SURFACE
      ?auto_340241 - SURFACE
      ?auto_340242 - SURFACE
    )
    :vars
    (
      ?auto_340243 - HOIST
      ?auto_340245 - PLACE
      ?auto_340244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340243 ?auto_340245 ) ( SURFACE-AT ?auto_340241 ?auto_340245 ) ( CLEAR ?auto_340241 ) ( IS-CRATE ?auto_340242 ) ( not ( = ?auto_340241 ?auto_340242 ) ) ( TRUCK-AT ?auto_340244 ?auto_340245 ) ( AVAILABLE ?auto_340243 ) ( IN ?auto_340242 ?auto_340244 ) ( ON ?auto_340241 ?auto_340240 ) ( not ( = ?auto_340240 ?auto_340241 ) ) ( not ( = ?auto_340240 ?auto_340242 ) ) ( ON ?auto_340234 ?auto_340233 ) ( ON ?auto_340235 ?auto_340234 ) ( ON ?auto_340232 ?auto_340235 ) ( ON ?auto_340236 ?auto_340232 ) ( ON ?auto_340238 ?auto_340236 ) ( ON ?auto_340237 ?auto_340238 ) ( ON ?auto_340239 ?auto_340237 ) ( ON ?auto_340240 ?auto_340239 ) ( not ( = ?auto_340233 ?auto_340234 ) ) ( not ( = ?auto_340233 ?auto_340235 ) ) ( not ( = ?auto_340233 ?auto_340232 ) ) ( not ( = ?auto_340233 ?auto_340236 ) ) ( not ( = ?auto_340233 ?auto_340238 ) ) ( not ( = ?auto_340233 ?auto_340237 ) ) ( not ( = ?auto_340233 ?auto_340239 ) ) ( not ( = ?auto_340233 ?auto_340240 ) ) ( not ( = ?auto_340233 ?auto_340241 ) ) ( not ( = ?auto_340233 ?auto_340242 ) ) ( not ( = ?auto_340234 ?auto_340235 ) ) ( not ( = ?auto_340234 ?auto_340232 ) ) ( not ( = ?auto_340234 ?auto_340236 ) ) ( not ( = ?auto_340234 ?auto_340238 ) ) ( not ( = ?auto_340234 ?auto_340237 ) ) ( not ( = ?auto_340234 ?auto_340239 ) ) ( not ( = ?auto_340234 ?auto_340240 ) ) ( not ( = ?auto_340234 ?auto_340241 ) ) ( not ( = ?auto_340234 ?auto_340242 ) ) ( not ( = ?auto_340235 ?auto_340232 ) ) ( not ( = ?auto_340235 ?auto_340236 ) ) ( not ( = ?auto_340235 ?auto_340238 ) ) ( not ( = ?auto_340235 ?auto_340237 ) ) ( not ( = ?auto_340235 ?auto_340239 ) ) ( not ( = ?auto_340235 ?auto_340240 ) ) ( not ( = ?auto_340235 ?auto_340241 ) ) ( not ( = ?auto_340235 ?auto_340242 ) ) ( not ( = ?auto_340232 ?auto_340236 ) ) ( not ( = ?auto_340232 ?auto_340238 ) ) ( not ( = ?auto_340232 ?auto_340237 ) ) ( not ( = ?auto_340232 ?auto_340239 ) ) ( not ( = ?auto_340232 ?auto_340240 ) ) ( not ( = ?auto_340232 ?auto_340241 ) ) ( not ( = ?auto_340232 ?auto_340242 ) ) ( not ( = ?auto_340236 ?auto_340238 ) ) ( not ( = ?auto_340236 ?auto_340237 ) ) ( not ( = ?auto_340236 ?auto_340239 ) ) ( not ( = ?auto_340236 ?auto_340240 ) ) ( not ( = ?auto_340236 ?auto_340241 ) ) ( not ( = ?auto_340236 ?auto_340242 ) ) ( not ( = ?auto_340238 ?auto_340237 ) ) ( not ( = ?auto_340238 ?auto_340239 ) ) ( not ( = ?auto_340238 ?auto_340240 ) ) ( not ( = ?auto_340238 ?auto_340241 ) ) ( not ( = ?auto_340238 ?auto_340242 ) ) ( not ( = ?auto_340237 ?auto_340239 ) ) ( not ( = ?auto_340237 ?auto_340240 ) ) ( not ( = ?auto_340237 ?auto_340241 ) ) ( not ( = ?auto_340237 ?auto_340242 ) ) ( not ( = ?auto_340239 ?auto_340240 ) ) ( not ( = ?auto_340239 ?auto_340241 ) ) ( not ( = ?auto_340239 ?auto_340242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340240 ?auto_340241 ?auto_340242 )
      ( MAKE-10CRATE-VERIFY ?auto_340233 ?auto_340234 ?auto_340235 ?auto_340232 ?auto_340236 ?auto_340238 ?auto_340237 ?auto_340239 ?auto_340240 ?auto_340241 ?auto_340242 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340338 - SURFACE
      ?auto_340339 - SURFACE
      ?auto_340340 - SURFACE
      ?auto_340337 - SURFACE
      ?auto_340341 - SURFACE
      ?auto_340343 - SURFACE
      ?auto_340342 - SURFACE
      ?auto_340344 - SURFACE
      ?auto_340345 - SURFACE
      ?auto_340346 - SURFACE
      ?auto_340347 - SURFACE
    )
    :vars
    (
      ?auto_340349 - HOIST
      ?auto_340348 - PLACE
      ?auto_340351 - TRUCK
      ?auto_340350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_340349 ?auto_340348 ) ( SURFACE-AT ?auto_340346 ?auto_340348 ) ( CLEAR ?auto_340346 ) ( IS-CRATE ?auto_340347 ) ( not ( = ?auto_340346 ?auto_340347 ) ) ( AVAILABLE ?auto_340349 ) ( IN ?auto_340347 ?auto_340351 ) ( ON ?auto_340346 ?auto_340345 ) ( not ( = ?auto_340345 ?auto_340346 ) ) ( not ( = ?auto_340345 ?auto_340347 ) ) ( TRUCK-AT ?auto_340351 ?auto_340350 ) ( not ( = ?auto_340350 ?auto_340348 ) ) ( ON ?auto_340339 ?auto_340338 ) ( ON ?auto_340340 ?auto_340339 ) ( ON ?auto_340337 ?auto_340340 ) ( ON ?auto_340341 ?auto_340337 ) ( ON ?auto_340343 ?auto_340341 ) ( ON ?auto_340342 ?auto_340343 ) ( ON ?auto_340344 ?auto_340342 ) ( ON ?auto_340345 ?auto_340344 ) ( not ( = ?auto_340338 ?auto_340339 ) ) ( not ( = ?auto_340338 ?auto_340340 ) ) ( not ( = ?auto_340338 ?auto_340337 ) ) ( not ( = ?auto_340338 ?auto_340341 ) ) ( not ( = ?auto_340338 ?auto_340343 ) ) ( not ( = ?auto_340338 ?auto_340342 ) ) ( not ( = ?auto_340338 ?auto_340344 ) ) ( not ( = ?auto_340338 ?auto_340345 ) ) ( not ( = ?auto_340338 ?auto_340346 ) ) ( not ( = ?auto_340338 ?auto_340347 ) ) ( not ( = ?auto_340339 ?auto_340340 ) ) ( not ( = ?auto_340339 ?auto_340337 ) ) ( not ( = ?auto_340339 ?auto_340341 ) ) ( not ( = ?auto_340339 ?auto_340343 ) ) ( not ( = ?auto_340339 ?auto_340342 ) ) ( not ( = ?auto_340339 ?auto_340344 ) ) ( not ( = ?auto_340339 ?auto_340345 ) ) ( not ( = ?auto_340339 ?auto_340346 ) ) ( not ( = ?auto_340339 ?auto_340347 ) ) ( not ( = ?auto_340340 ?auto_340337 ) ) ( not ( = ?auto_340340 ?auto_340341 ) ) ( not ( = ?auto_340340 ?auto_340343 ) ) ( not ( = ?auto_340340 ?auto_340342 ) ) ( not ( = ?auto_340340 ?auto_340344 ) ) ( not ( = ?auto_340340 ?auto_340345 ) ) ( not ( = ?auto_340340 ?auto_340346 ) ) ( not ( = ?auto_340340 ?auto_340347 ) ) ( not ( = ?auto_340337 ?auto_340341 ) ) ( not ( = ?auto_340337 ?auto_340343 ) ) ( not ( = ?auto_340337 ?auto_340342 ) ) ( not ( = ?auto_340337 ?auto_340344 ) ) ( not ( = ?auto_340337 ?auto_340345 ) ) ( not ( = ?auto_340337 ?auto_340346 ) ) ( not ( = ?auto_340337 ?auto_340347 ) ) ( not ( = ?auto_340341 ?auto_340343 ) ) ( not ( = ?auto_340341 ?auto_340342 ) ) ( not ( = ?auto_340341 ?auto_340344 ) ) ( not ( = ?auto_340341 ?auto_340345 ) ) ( not ( = ?auto_340341 ?auto_340346 ) ) ( not ( = ?auto_340341 ?auto_340347 ) ) ( not ( = ?auto_340343 ?auto_340342 ) ) ( not ( = ?auto_340343 ?auto_340344 ) ) ( not ( = ?auto_340343 ?auto_340345 ) ) ( not ( = ?auto_340343 ?auto_340346 ) ) ( not ( = ?auto_340343 ?auto_340347 ) ) ( not ( = ?auto_340342 ?auto_340344 ) ) ( not ( = ?auto_340342 ?auto_340345 ) ) ( not ( = ?auto_340342 ?auto_340346 ) ) ( not ( = ?auto_340342 ?auto_340347 ) ) ( not ( = ?auto_340344 ?auto_340345 ) ) ( not ( = ?auto_340344 ?auto_340346 ) ) ( not ( = ?auto_340344 ?auto_340347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340345 ?auto_340346 ?auto_340347 )
      ( MAKE-10CRATE-VERIFY ?auto_340338 ?auto_340339 ?auto_340340 ?auto_340337 ?auto_340341 ?auto_340343 ?auto_340342 ?auto_340344 ?auto_340345 ?auto_340346 ?auto_340347 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340453 - SURFACE
      ?auto_340454 - SURFACE
      ?auto_340455 - SURFACE
      ?auto_340452 - SURFACE
      ?auto_340456 - SURFACE
      ?auto_340458 - SURFACE
      ?auto_340457 - SURFACE
      ?auto_340459 - SURFACE
      ?auto_340460 - SURFACE
      ?auto_340461 - SURFACE
      ?auto_340462 - SURFACE
    )
    :vars
    (
      ?auto_340467 - HOIST
      ?auto_340464 - PLACE
      ?auto_340463 - TRUCK
      ?auto_340466 - PLACE
      ?auto_340465 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_340467 ?auto_340464 ) ( SURFACE-AT ?auto_340461 ?auto_340464 ) ( CLEAR ?auto_340461 ) ( IS-CRATE ?auto_340462 ) ( not ( = ?auto_340461 ?auto_340462 ) ) ( AVAILABLE ?auto_340467 ) ( ON ?auto_340461 ?auto_340460 ) ( not ( = ?auto_340460 ?auto_340461 ) ) ( not ( = ?auto_340460 ?auto_340462 ) ) ( TRUCK-AT ?auto_340463 ?auto_340466 ) ( not ( = ?auto_340466 ?auto_340464 ) ) ( HOIST-AT ?auto_340465 ?auto_340466 ) ( LIFTING ?auto_340465 ?auto_340462 ) ( not ( = ?auto_340467 ?auto_340465 ) ) ( ON ?auto_340454 ?auto_340453 ) ( ON ?auto_340455 ?auto_340454 ) ( ON ?auto_340452 ?auto_340455 ) ( ON ?auto_340456 ?auto_340452 ) ( ON ?auto_340458 ?auto_340456 ) ( ON ?auto_340457 ?auto_340458 ) ( ON ?auto_340459 ?auto_340457 ) ( ON ?auto_340460 ?auto_340459 ) ( not ( = ?auto_340453 ?auto_340454 ) ) ( not ( = ?auto_340453 ?auto_340455 ) ) ( not ( = ?auto_340453 ?auto_340452 ) ) ( not ( = ?auto_340453 ?auto_340456 ) ) ( not ( = ?auto_340453 ?auto_340458 ) ) ( not ( = ?auto_340453 ?auto_340457 ) ) ( not ( = ?auto_340453 ?auto_340459 ) ) ( not ( = ?auto_340453 ?auto_340460 ) ) ( not ( = ?auto_340453 ?auto_340461 ) ) ( not ( = ?auto_340453 ?auto_340462 ) ) ( not ( = ?auto_340454 ?auto_340455 ) ) ( not ( = ?auto_340454 ?auto_340452 ) ) ( not ( = ?auto_340454 ?auto_340456 ) ) ( not ( = ?auto_340454 ?auto_340458 ) ) ( not ( = ?auto_340454 ?auto_340457 ) ) ( not ( = ?auto_340454 ?auto_340459 ) ) ( not ( = ?auto_340454 ?auto_340460 ) ) ( not ( = ?auto_340454 ?auto_340461 ) ) ( not ( = ?auto_340454 ?auto_340462 ) ) ( not ( = ?auto_340455 ?auto_340452 ) ) ( not ( = ?auto_340455 ?auto_340456 ) ) ( not ( = ?auto_340455 ?auto_340458 ) ) ( not ( = ?auto_340455 ?auto_340457 ) ) ( not ( = ?auto_340455 ?auto_340459 ) ) ( not ( = ?auto_340455 ?auto_340460 ) ) ( not ( = ?auto_340455 ?auto_340461 ) ) ( not ( = ?auto_340455 ?auto_340462 ) ) ( not ( = ?auto_340452 ?auto_340456 ) ) ( not ( = ?auto_340452 ?auto_340458 ) ) ( not ( = ?auto_340452 ?auto_340457 ) ) ( not ( = ?auto_340452 ?auto_340459 ) ) ( not ( = ?auto_340452 ?auto_340460 ) ) ( not ( = ?auto_340452 ?auto_340461 ) ) ( not ( = ?auto_340452 ?auto_340462 ) ) ( not ( = ?auto_340456 ?auto_340458 ) ) ( not ( = ?auto_340456 ?auto_340457 ) ) ( not ( = ?auto_340456 ?auto_340459 ) ) ( not ( = ?auto_340456 ?auto_340460 ) ) ( not ( = ?auto_340456 ?auto_340461 ) ) ( not ( = ?auto_340456 ?auto_340462 ) ) ( not ( = ?auto_340458 ?auto_340457 ) ) ( not ( = ?auto_340458 ?auto_340459 ) ) ( not ( = ?auto_340458 ?auto_340460 ) ) ( not ( = ?auto_340458 ?auto_340461 ) ) ( not ( = ?auto_340458 ?auto_340462 ) ) ( not ( = ?auto_340457 ?auto_340459 ) ) ( not ( = ?auto_340457 ?auto_340460 ) ) ( not ( = ?auto_340457 ?auto_340461 ) ) ( not ( = ?auto_340457 ?auto_340462 ) ) ( not ( = ?auto_340459 ?auto_340460 ) ) ( not ( = ?auto_340459 ?auto_340461 ) ) ( not ( = ?auto_340459 ?auto_340462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340460 ?auto_340461 ?auto_340462 )
      ( MAKE-10CRATE-VERIFY ?auto_340453 ?auto_340454 ?auto_340455 ?auto_340452 ?auto_340456 ?auto_340458 ?auto_340457 ?auto_340459 ?auto_340460 ?auto_340461 ?auto_340462 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340578 - SURFACE
      ?auto_340579 - SURFACE
      ?auto_340580 - SURFACE
      ?auto_340577 - SURFACE
      ?auto_340581 - SURFACE
      ?auto_340583 - SURFACE
      ?auto_340582 - SURFACE
      ?auto_340584 - SURFACE
      ?auto_340585 - SURFACE
      ?auto_340586 - SURFACE
      ?auto_340587 - SURFACE
    )
    :vars
    (
      ?auto_340592 - HOIST
      ?auto_340588 - PLACE
      ?auto_340590 - TRUCK
      ?auto_340591 - PLACE
      ?auto_340589 - HOIST
      ?auto_340593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_340592 ?auto_340588 ) ( SURFACE-AT ?auto_340586 ?auto_340588 ) ( CLEAR ?auto_340586 ) ( IS-CRATE ?auto_340587 ) ( not ( = ?auto_340586 ?auto_340587 ) ) ( AVAILABLE ?auto_340592 ) ( ON ?auto_340586 ?auto_340585 ) ( not ( = ?auto_340585 ?auto_340586 ) ) ( not ( = ?auto_340585 ?auto_340587 ) ) ( TRUCK-AT ?auto_340590 ?auto_340591 ) ( not ( = ?auto_340591 ?auto_340588 ) ) ( HOIST-AT ?auto_340589 ?auto_340591 ) ( not ( = ?auto_340592 ?auto_340589 ) ) ( AVAILABLE ?auto_340589 ) ( SURFACE-AT ?auto_340587 ?auto_340591 ) ( ON ?auto_340587 ?auto_340593 ) ( CLEAR ?auto_340587 ) ( not ( = ?auto_340586 ?auto_340593 ) ) ( not ( = ?auto_340587 ?auto_340593 ) ) ( not ( = ?auto_340585 ?auto_340593 ) ) ( ON ?auto_340579 ?auto_340578 ) ( ON ?auto_340580 ?auto_340579 ) ( ON ?auto_340577 ?auto_340580 ) ( ON ?auto_340581 ?auto_340577 ) ( ON ?auto_340583 ?auto_340581 ) ( ON ?auto_340582 ?auto_340583 ) ( ON ?auto_340584 ?auto_340582 ) ( ON ?auto_340585 ?auto_340584 ) ( not ( = ?auto_340578 ?auto_340579 ) ) ( not ( = ?auto_340578 ?auto_340580 ) ) ( not ( = ?auto_340578 ?auto_340577 ) ) ( not ( = ?auto_340578 ?auto_340581 ) ) ( not ( = ?auto_340578 ?auto_340583 ) ) ( not ( = ?auto_340578 ?auto_340582 ) ) ( not ( = ?auto_340578 ?auto_340584 ) ) ( not ( = ?auto_340578 ?auto_340585 ) ) ( not ( = ?auto_340578 ?auto_340586 ) ) ( not ( = ?auto_340578 ?auto_340587 ) ) ( not ( = ?auto_340578 ?auto_340593 ) ) ( not ( = ?auto_340579 ?auto_340580 ) ) ( not ( = ?auto_340579 ?auto_340577 ) ) ( not ( = ?auto_340579 ?auto_340581 ) ) ( not ( = ?auto_340579 ?auto_340583 ) ) ( not ( = ?auto_340579 ?auto_340582 ) ) ( not ( = ?auto_340579 ?auto_340584 ) ) ( not ( = ?auto_340579 ?auto_340585 ) ) ( not ( = ?auto_340579 ?auto_340586 ) ) ( not ( = ?auto_340579 ?auto_340587 ) ) ( not ( = ?auto_340579 ?auto_340593 ) ) ( not ( = ?auto_340580 ?auto_340577 ) ) ( not ( = ?auto_340580 ?auto_340581 ) ) ( not ( = ?auto_340580 ?auto_340583 ) ) ( not ( = ?auto_340580 ?auto_340582 ) ) ( not ( = ?auto_340580 ?auto_340584 ) ) ( not ( = ?auto_340580 ?auto_340585 ) ) ( not ( = ?auto_340580 ?auto_340586 ) ) ( not ( = ?auto_340580 ?auto_340587 ) ) ( not ( = ?auto_340580 ?auto_340593 ) ) ( not ( = ?auto_340577 ?auto_340581 ) ) ( not ( = ?auto_340577 ?auto_340583 ) ) ( not ( = ?auto_340577 ?auto_340582 ) ) ( not ( = ?auto_340577 ?auto_340584 ) ) ( not ( = ?auto_340577 ?auto_340585 ) ) ( not ( = ?auto_340577 ?auto_340586 ) ) ( not ( = ?auto_340577 ?auto_340587 ) ) ( not ( = ?auto_340577 ?auto_340593 ) ) ( not ( = ?auto_340581 ?auto_340583 ) ) ( not ( = ?auto_340581 ?auto_340582 ) ) ( not ( = ?auto_340581 ?auto_340584 ) ) ( not ( = ?auto_340581 ?auto_340585 ) ) ( not ( = ?auto_340581 ?auto_340586 ) ) ( not ( = ?auto_340581 ?auto_340587 ) ) ( not ( = ?auto_340581 ?auto_340593 ) ) ( not ( = ?auto_340583 ?auto_340582 ) ) ( not ( = ?auto_340583 ?auto_340584 ) ) ( not ( = ?auto_340583 ?auto_340585 ) ) ( not ( = ?auto_340583 ?auto_340586 ) ) ( not ( = ?auto_340583 ?auto_340587 ) ) ( not ( = ?auto_340583 ?auto_340593 ) ) ( not ( = ?auto_340582 ?auto_340584 ) ) ( not ( = ?auto_340582 ?auto_340585 ) ) ( not ( = ?auto_340582 ?auto_340586 ) ) ( not ( = ?auto_340582 ?auto_340587 ) ) ( not ( = ?auto_340582 ?auto_340593 ) ) ( not ( = ?auto_340584 ?auto_340585 ) ) ( not ( = ?auto_340584 ?auto_340586 ) ) ( not ( = ?auto_340584 ?auto_340587 ) ) ( not ( = ?auto_340584 ?auto_340593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340585 ?auto_340586 ?auto_340587 )
      ( MAKE-10CRATE-VERIFY ?auto_340578 ?auto_340579 ?auto_340580 ?auto_340577 ?auto_340581 ?auto_340583 ?auto_340582 ?auto_340584 ?auto_340585 ?auto_340586 ?auto_340587 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340704 - SURFACE
      ?auto_340705 - SURFACE
      ?auto_340706 - SURFACE
      ?auto_340703 - SURFACE
      ?auto_340707 - SURFACE
      ?auto_340709 - SURFACE
      ?auto_340708 - SURFACE
      ?auto_340710 - SURFACE
      ?auto_340711 - SURFACE
      ?auto_340712 - SURFACE
      ?auto_340713 - SURFACE
    )
    :vars
    (
      ?auto_340719 - HOIST
      ?auto_340716 - PLACE
      ?auto_340718 - PLACE
      ?auto_340715 - HOIST
      ?auto_340717 - SURFACE
      ?auto_340714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340719 ?auto_340716 ) ( SURFACE-AT ?auto_340712 ?auto_340716 ) ( CLEAR ?auto_340712 ) ( IS-CRATE ?auto_340713 ) ( not ( = ?auto_340712 ?auto_340713 ) ) ( AVAILABLE ?auto_340719 ) ( ON ?auto_340712 ?auto_340711 ) ( not ( = ?auto_340711 ?auto_340712 ) ) ( not ( = ?auto_340711 ?auto_340713 ) ) ( not ( = ?auto_340718 ?auto_340716 ) ) ( HOIST-AT ?auto_340715 ?auto_340718 ) ( not ( = ?auto_340719 ?auto_340715 ) ) ( AVAILABLE ?auto_340715 ) ( SURFACE-AT ?auto_340713 ?auto_340718 ) ( ON ?auto_340713 ?auto_340717 ) ( CLEAR ?auto_340713 ) ( not ( = ?auto_340712 ?auto_340717 ) ) ( not ( = ?auto_340713 ?auto_340717 ) ) ( not ( = ?auto_340711 ?auto_340717 ) ) ( TRUCK-AT ?auto_340714 ?auto_340716 ) ( ON ?auto_340705 ?auto_340704 ) ( ON ?auto_340706 ?auto_340705 ) ( ON ?auto_340703 ?auto_340706 ) ( ON ?auto_340707 ?auto_340703 ) ( ON ?auto_340709 ?auto_340707 ) ( ON ?auto_340708 ?auto_340709 ) ( ON ?auto_340710 ?auto_340708 ) ( ON ?auto_340711 ?auto_340710 ) ( not ( = ?auto_340704 ?auto_340705 ) ) ( not ( = ?auto_340704 ?auto_340706 ) ) ( not ( = ?auto_340704 ?auto_340703 ) ) ( not ( = ?auto_340704 ?auto_340707 ) ) ( not ( = ?auto_340704 ?auto_340709 ) ) ( not ( = ?auto_340704 ?auto_340708 ) ) ( not ( = ?auto_340704 ?auto_340710 ) ) ( not ( = ?auto_340704 ?auto_340711 ) ) ( not ( = ?auto_340704 ?auto_340712 ) ) ( not ( = ?auto_340704 ?auto_340713 ) ) ( not ( = ?auto_340704 ?auto_340717 ) ) ( not ( = ?auto_340705 ?auto_340706 ) ) ( not ( = ?auto_340705 ?auto_340703 ) ) ( not ( = ?auto_340705 ?auto_340707 ) ) ( not ( = ?auto_340705 ?auto_340709 ) ) ( not ( = ?auto_340705 ?auto_340708 ) ) ( not ( = ?auto_340705 ?auto_340710 ) ) ( not ( = ?auto_340705 ?auto_340711 ) ) ( not ( = ?auto_340705 ?auto_340712 ) ) ( not ( = ?auto_340705 ?auto_340713 ) ) ( not ( = ?auto_340705 ?auto_340717 ) ) ( not ( = ?auto_340706 ?auto_340703 ) ) ( not ( = ?auto_340706 ?auto_340707 ) ) ( not ( = ?auto_340706 ?auto_340709 ) ) ( not ( = ?auto_340706 ?auto_340708 ) ) ( not ( = ?auto_340706 ?auto_340710 ) ) ( not ( = ?auto_340706 ?auto_340711 ) ) ( not ( = ?auto_340706 ?auto_340712 ) ) ( not ( = ?auto_340706 ?auto_340713 ) ) ( not ( = ?auto_340706 ?auto_340717 ) ) ( not ( = ?auto_340703 ?auto_340707 ) ) ( not ( = ?auto_340703 ?auto_340709 ) ) ( not ( = ?auto_340703 ?auto_340708 ) ) ( not ( = ?auto_340703 ?auto_340710 ) ) ( not ( = ?auto_340703 ?auto_340711 ) ) ( not ( = ?auto_340703 ?auto_340712 ) ) ( not ( = ?auto_340703 ?auto_340713 ) ) ( not ( = ?auto_340703 ?auto_340717 ) ) ( not ( = ?auto_340707 ?auto_340709 ) ) ( not ( = ?auto_340707 ?auto_340708 ) ) ( not ( = ?auto_340707 ?auto_340710 ) ) ( not ( = ?auto_340707 ?auto_340711 ) ) ( not ( = ?auto_340707 ?auto_340712 ) ) ( not ( = ?auto_340707 ?auto_340713 ) ) ( not ( = ?auto_340707 ?auto_340717 ) ) ( not ( = ?auto_340709 ?auto_340708 ) ) ( not ( = ?auto_340709 ?auto_340710 ) ) ( not ( = ?auto_340709 ?auto_340711 ) ) ( not ( = ?auto_340709 ?auto_340712 ) ) ( not ( = ?auto_340709 ?auto_340713 ) ) ( not ( = ?auto_340709 ?auto_340717 ) ) ( not ( = ?auto_340708 ?auto_340710 ) ) ( not ( = ?auto_340708 ?auto_340711 ) ) ( not ( = ?auto_340708 ?auto_340712 ) ) ( not ( = ?auto_340708 ?auto_340713 ) ) ( not ( = ?auto_340708 ?auto_340717 ) ) ( not ( = ?auto_340710 ?auto_340711 ) ) ( not ( = ?auto_340710 ?auto_340712 ) ) ( not ( = ?auto_340710 ?auto_340713 ) ) ( not ( = ?auto_340710 ?auto_340717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340711 ?auto_340712 ?auto_340713 )
      ( MAKE-10CRATE-VERIFY ?auto_340704 ?auto_340705 ?auto_340706 ?auto_340703 ?auto_340707 ?auto_340709 ?auto_340708 ?auto_340710 ?auto_340711 ?auto_340712 ?auto_340713 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340830 - SURFACE
      ?auto_340831 - SURFACE
      ?auto_340832 - SURFACE
      ?auto_340829 - SURFACE
      ?auto_340833 - SURFACE
      ?auto_340835 - SURFACE
      ?auto_340834 - SURFACE
      ?auto_340836 - SURFACE
      ?auto_340837 - SURFACE
      ?auto_340838 - SURFACE
      ?auto_340839 - SURFACE
    )
    :vars
    (
      ?auto_340841 - HOIST
      ?auto_340842 - PLACE
      ?auto_340840 - PLACE
      ?auto_340844 - HOIST
      ?auto_340845 - SURFACE
      ?auto_340843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340841 ?auto_340842 ) ( IS-CRATE ?auto_340839 ) ( not ( = ?auto_340838 ?auto_340839 ) ) ( not ( = ?auto_340837 ?auto_340838 ) ) ( not ( = ?auto_340837 ?auto_340839 ) ) ( not ( = ?auto_340840 ?auto_340842 ) ) ( HOIST-AT ?auto_340844 ?auto_340840 ) ( not ( = ?auto_340841 ?auto_340844 ) ) ( AVAILABLE ?auto_340844 ) ( SURFACE-AT ?auto_340839 ?auto_340840 ) ( ON ?auto_340839 ?auto_340845 ) ( CLEAR ?auto_340839 ) ( not ( = ?auto_340838 ?auto_340845 ) ) ( not ( = ?auto_340839 ?auto_340845 ) ) ( not ( = ?auto_340837 ?auto_340845 ) ) ( TRUCK-AT ?auto_340843 ?auto_340842 ) ( SURFACE-AT ?auto_340837 ?auto_340842 ) ( CLEAR ?auto_340837 ) ( LIFTING ?auto_340841 ?auto_340838 ) ( IS-CRATE ?auto_340838 ) ( ON ?auto_340831 ?auto_340830 ) ( ON ?auto_340832 ?auto_340831 ) ( ON ?auto_340829 ?auto_340832 ) ( ON ?auto_340833 ?auto_340829 ) ( ON ?auto_340835 ?auto_340833 ) ( ON ?auto_340834 ?auto_340835 ) ( ON ?auto_340836 ?auto_340834 ) ( ON ?auto_340837 ?auto_340836 ) ( not ( = ?auto_340830 ?auto_340831 ) ) ( not ( = ?auto_340830 ?auto_340832 ) ) ( not ( = ?auto_340830 ?auto_340829 ) ) ( not ( = ?auto_340830 ?auto_340833 ) ) ( not ( = ?auto_340830 ?auto_340835 ) ) ( not ( = ?auto_340830 ?auto_340834 ) ) ( not ( = ?auto_340830 ?auto_340836 ) ) ( not ( = ?auto_340830 ?auto_340837 ) ) ( not ( = ?auto_340830 ?auto_340838 ) ) ( not ( = ?auto_340830 ?auto_340839 ) ) ( not ( = ?auto_340830 ?auto_340845 ) ) ( not ( = ?auto_340831 ?auto_340832 ) ) ( not ( = ?auto_340831 ?auto_340829 ) ) ( not ( = ?auto_340831 ?auto_340833 ) ) ( not ( = ?auto_340831 ?auto_340835 ) ) ( not ( = ?auto_340831 ?auto_340834 ) ) ( not ( = ?auto_340831 ?auto_340836 ) ) ( not ( = ?auto_340831 ?auto_340837 ) ) ( not ( = ?auto_340831 ?auto_340838 ) ) ( not ( = ?auto_340831 ?auto_340839 ) ) ( not ( = ?auto_340831 ?auto_340845 ) ) ( not ( = ?auto_340832 ?auto_340829 ) ) ( not ( = ?auto_340832 ?auto_340833 ) ) ( not ( = ?auto_340832 ?auto_340835 ) ) ( not ( = ?auto_340832 ?auto_340834 ) ) ( not ( = ?auto_340832 ?auto_340836 ) ) ( not ( = ?auto_340832 ?auto_340837 ) ) ( not ( = ?auto_340832 ?auto_340838 ) ) ( not ( = ?auto_340832 ?auto_340839 ) ) ( not ( = ?auto_340832 ?auto_340845 ) ) ( not ( = ?auto_340829 ?auto_340833 ) ) ( not ( = ?auto_340829 ?auto_340835 ) ) ( not ( = ?auto_340829 ?auto_340834 ) ) ( not ( = ?auto_340829 ?auto_340836 ) ) ( not ( = ?auto_340829 ?auto_340837 ) ) ( not ( = ?auto_340829 ?auto_340838 ) ) ( not ( = ?auto_340829 ?auto_340839 ) ) ( not ( = ?auto_340829 ?auto_340845 ) ) ( not ( = ?auto_340833 ?auto_340835 ) ) ( not ( = ?auto_340833 ?auto_340834 ) ) ( not ( = ?auto_340833 ?auto_340836 ) ) ( not ( = ?auto_340833 ?auto_340837 ) ) ( not ( = ?auto_340833 ?auto_340838 ) ) ( not ( = ?auto_340833 ?auto_340839 ) ) ( not ( = ?auto_340833 ?auto_340845 ) ) ( not ( = ?auto_340835 ?auto_340834 ) ) ( not ( = ?auto_340835 ?auto_340836 ) ) ( not ( = ?auto_340835 ?auto_340837 ) ) ( not ( = ?auto_340835 ?auto_340838 ) ) ( not ( = ?auto_340835 ?auto_340839 ) ) ( not ( = ?auto_340835 ?auto_340845 ) ) ( not ( = ?auto_340834 ?auto_340836 ) ) ( not ( = ?auto_340834 ?auto_340837 ) ) ( not ( = ?auto_340834 ?auto_340838 ) ) ( not ( = ?auto_340834 ?auto_340839 ) ) ( not ( = ?auto_340834 ?auto_340845 ) ) ( not ( = ?auto_340836 ?auto_340837 ) ) ( not ( = ?auto_340836 ?auto_340838 ) ) ( not ( = ?auto_340836 ?auto_340839 ) ) ( not ( = ?auto_340836 ?auto_340845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340837 ?auto_340838 ?auto_340839 )
      ( MAKE-10CRATE-VERIFY ?auto_340830 ?auto_340831 ?auto_340832 ?auto_340829 ?auto_340833 ?auto_340835 ?auto_340834 ?auto_340836 ?auto_340837 ?auto_340838 ?auto_340839 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340956 - SURFACE
      ?auto_340957 - SURFACE
      ?auto_340958 - SURFACE
      ?auto_340955 - SURFACE
      ?auto_340959 - SURFACE
      ?auto_340961 - SURFACE
      ?auto_340960 - SURFACE
      ?auto_340962 - SURFACE
      ?auto_340963 - SURFACE
      ?auto_340964 - SURFACE
      ?auto_340965 - SURFACE
    )
    :vars
    (
      ?auto_340969 - HOIST
      ?auto_340970 - PLACE
      ?auto_340968 - PLACE
      ?auto_340966 - HOIST
      ?auto_340971 - SURFACE
      ?auto_340967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340969 ?auto_340970 ) ( IS-CRATE ?auto_340965 ) ( not ( = ?auto_340964 ?auto_340965 ) ) ( not ( = ?auto_340963 ?auto_340964 ) ) ( not ( = ?auto_340963 ?auto_340965 ) ) ( not ( = ?auto_340968 ?auto_340970 ) ) ( HOIST-AT ?auto_340966 ?auto_340968 ) ( not ( = ?auto_340969 ?auto_340966 ) ) ( AVAILABLE ?auto_340966 ) ( SURFACE-AT ?auto_340965 ?auto_340968 ) ( ON ?auto_340965 ?auto_340971 ) ( CLEAR ?auto_340965 ) ( not ( = ?auto_340964 ?auto_340971 ) ) ( not ( = ?auto_340965 ?auto_340971 ) ) ( not ( = ?auto_340963 ?auto_340971 ) ) ( TRUCK-AT ?auto_340967 ?auto_340970 ) ( SURFACE-AT ?auto_340963 ?auto_340970 ) ( CLEAR ?auto_340963 ) ( IS-CRATE ?auto_340964 ) ( AVAILABLE ?auto_340969 ) ( IN ?auto_340964 ?auto_340967 ) ( ON ?auto_340957 ?auto_340956 ) ( ON ?auto_340958 ?auto_340957 ) ( ON ?auto_340955 ?auto_340958 ) ( ON ?auto_340959 ?auto_340955 ) ( ON ?auto_340961 ?auto_340959 ) ( ON ?auto_340960 ?auto_340961 ) ( ON ?auto_340962 ?auto_340960 ) ( ON ?auto_340963 ?auto_340962 ) ( not ( = ?auto_340956 ?auto_340957 ) ) ( not ( = ?auto_340956 ?auto_340958 ) ) ( not ( = ?auto_340956 ?auto_340955 ) ) ( not ( = ?auto_340956 ?auto_340959 ) ) ( not ( = ?auto_340956 ?auto_340961 ) ) ( not ( = ?auto_340956 ?auto_340960 ) ) ( not ( = ?auto_340956 ?auto_340962 ) ) ( not ( = ?auto_340956 ?auto_340963 ) ) ( not ( = ?auto_340956 ?auto_340964 ) ) ( not ( = ?auto_340956 ?auto_340965 ) ) ( not ( = ?auto_340956 ?auto_340971 ) ) ( not ( = ?auto_340957 ?auto_340958 ) ) ( not ( = ?auto_340957 ?auto_340955 ) ) ( not ( = ?auto_340957 ?auto_340959 ) ) ( not ( = ?auto_340957 ?auto_340961 ) ) ( not ( = ?auto_340957 ?auto_340960 ) ) ( not ( = ?auto_340957 ?auto_340962 ) ) ( not ( = ?auto_340957 ?auto_340963 ) ) ( not ( = ?auto_340957 ?auto_340964 ) ) ( not ( = ?auto_340957 ?auto_340965 ) ) ( not ( = ?auto_340957 ?auto_340971 ) ) ( not ( = ?auto_340958 ?auto_340955 ) ) ( not ( = ?auto_340958 ?auto_340959 ) ) ( not ( = ?auto_340958 ?auto_340961 ) ) ( not ( = ?auto_340958 ?auto_340960 ) ) ( not ( = ?auto_340958 ?auto_340962 ) ) ( not ( = ?auto_340958 ?auto_340963 ) ) ( not ( = ?auto_340958 ?auto_340964 ) ) ( not ( = ?auto_340958 ?auto_340965 ) ) ( not ( = ?auto_340958 ?auto_340971 ) ) ( not ( = ?auto_340955 ?auto_340959 ) ) ( not ( = ?auto_340955 ?auto_340961 ) ) ( not ( = ?auto_340955 ?auto_340960 ) ) ( not ( = ?auto_340955 ?auto_340962 ) ) ( not ( = ?auto_340955 ?auto_340963 ) ) ( not ( = ?auto_340955 ?auto_340964 ) ) ( not ( = ?auto_340955 ?auto_340965 ) ) ( not ( = ?auto_340955 ?auto_340971 ) ) ( not ( = ?auto_340959 ?auto_340961 ) ) ( not ( = ?auto_340959 ?auto_340960 ) ) ( not ( = ?auto_340959 ?auto_340962 ) ) ( not ( = ?auto_340959 ?auto_340963 ) ) ( not ( = ?auto_340959 ?auto_340964 ) ) ( not ( = ?auto_340959 ?auto_340965 ) ) ( not ( = ?auto_340959 ?auto_340971 ) ) ( not ( = ?auto_340961 ?auto_340960 ) ) ( not ( = ?auto_340961 ?auto_340962 ) ) ( not ( = ?auto_340961 ?auto_340963 ) ) ( not ( = ?auto_340961 ?auto_340964 ) ) ( not ( = ?auto_340961 ?auto_340965 ) ) ( not ( = ?auto_340961 ?auto_340971 ) ) ( not ( = ?auto_340960 ?auto_340962 ) ) ( not ( = ?auto_340960 ?auto_340963 ) ) ( not ( = ?auto_340960 ?auto_340964 ) ) ( not ( = ?auto_340960 ?auto_340965 ) ) ( not ( = ?auto_340960 ?auto_340971 ) ) ( not ( = ?auto_340962 ?auto_340963 ) ) ( not ( = ?auto_340962 ?auto_340964 ) ) ( not ( = ?auto_340962 ?auto_340965 ) ) ( not ( = ?auto_340962 ?auto_340971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340963 ?auto_340964 ?auto_340965 )
      ( MAKE-10CRATE-VERIFY ?auto_340956 ?auto_340957 ?auto_340958 ?auto_340955 ?auto_340959 ?auto_340961 ?auto_340960 ?auto_340962 ?auto_340963 ?auto_340964 ?auto_340965 ) )
  )

)

