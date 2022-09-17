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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139341 - SURFACE
      ?auto_139342 - SURFACE
    )
    :vars
    (
      ?auto_139343 - HOIST
      ?auto_139344 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139343 ?auto_139344 ) ( SURFACE-AT ?auto_139341 ?auto_139344 ) ( CLEAR ?auto_139341 ) ( LIFTING ?auto_139343 ?auto_139342 ) ( IS-CRATE ?auto_139342 ) ( not ( = ?auto_139341 ?auto_139342 ) ) )
    :subtasks
    ( ( !DROP ?auto_139343 ?auto_139342 ?auto_139341 ?auto_139344 )
      ( MAKE-1CRATE-VERIFY ?auto_139341 ?auto_139342 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139345 - SURFACE
      ?auto_139346 - SURFACE
    )
    :vars
    (
      ?auto_139347 - HOIST
      ?auto_139348 - PLACE
      ?auto_139349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139347 ?auto_139348 ) ( SURFACE-AT ?auto_139345 ?auto_139348 ) ( CLEAR ?auto_139345 ) ( IS-CRATE ?auto_139346 ) ( not ( = ?auto_139345 ?auto_139346 ) ) ( TRUCK-AT ?auto_139349 ?auto_139348 ) ( AVAILABLE ?auto_139347 ) ( IN ?auto_139346 ?auto_139349 ) )
    :subtasks
    ( ( !UNLOAD ?auto_139347 ?auto_139346 ?auto_139349 ?auto_139348 )
      ( MAKE-1CRATE ?auto_139345 ?auto_139346 )
      ( MAKE-1CRATE-VERIFY ?auto_139345 ?auto_139346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139350 - SURFACE
      ?auto_139351 - SURFACE
    )
    :vars
    (
      ?auto_139352 - HOIST
      ?auto_139354 - PLACE
      ?auto_139353 - TRUCK
      ?auto_139355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139352 ?auto_139354 ) ( SURFACE-AT ?auto_139350 ?auto_139354 ) ( CLEAR ?auto_139350 ) ( IS-CRATE ?auto_139351 ) ( not ( = ?auto_139350 ?auto_139351 ) ) ( AVAILABLE ?auto_139352 ) ( IN ?auto_139351 ?auto_139353 ) ( TRUCK-AT ?auto_139353 ?auto_139355 ) ( not ( = ?auto_139355 ?auto_139354 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139353 ?auto_139355 ?auto_139354 )
      ( MAKE-1CRATE ?auto_139350 ?auto_139351 )
      ( MAKE-1CRATE-VERIFY ?auto_139350 ?auto_139351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139356 - SURFACE
      ?auto_139357 - SURFACE
    )
    :vars
    (
      ?auto_139360 - HOIST
      ?auto_139358 - PLACE
      ?auto_139359 - TRUCK
      ?auto_139361 - PLACE
      ?auto_139362 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139360 ?auto_139358 ) ( SURFACE-AT ?auto_139356 ?auto_139358 ) ( CLEAR ?auto_139356 ) ( IS-CRATE ?auto_139357 ) ( not ( = ?auto_139356 ?auto_139357 ) ) ( AVAILABLE ?auto_139360 ) ( TRUCK-AT ?auto_139359 ?auto_139361 ) ( not ( = ?auto_139361 ?auto_139358 ) ) ( HOIST-AT ?auto_139362 ?auto_139361 ) ( LIFTING ?auto_139362 ?auto_139357 ) ( not ( = ?auto_139360 ?auto_139362 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139362 ?auto_139357 ?auto_139359 ?auto_139361 )
      ( MAKE-1CRATE ?auto_139356 ?auto_139357 )
      ( MAKE-1CRATE-VERIFY ?auto_139356 ?auto_139357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139363 - SURFACE
      ?auto_139364 - SURFACE
    )
    :vars
    (
      ?auto_139366 - HOIST
      ?auto_139369 - PLACE
      ?auto_139368 - TRUCK
      ?auto_139367 - PLACE
      ?auto_139365 - HOIST
      ?auto_139370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139366 ?auto_139369 ) ( SURFACE-AT ?auto_139363 ?auto_139369 ) ( CLEAR ?auto_139363 ) ( IS-CRATE ?auto_139364 ) ( not ( = ?auto_139363 ?auto_139364 ) ) ( AVAILABLE ?auto_139366 ) ( TRUCK-AT ?auto_139368 ?auto_139367 ) ( not ( = ?auto_139367 ?auto_139369 ) ) ( HOIST-AT ?auto_139365 ?auto_139367 ) ( not ( = ?auto_139366 ?auto_139365 ) ) ( AVAILABLE ?auto_139365 ) ( SURFACE-AT ?auto_139364 ?auto_139367 ) ( ON ?auto_139364 ?auto_139370 ) ( CLEAR ?auto_139364 ) ( not ( = ?auto_139363 ?auto_139370 ) ) ( not ( = ?auto_139364 ?auto_139370 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139365 ?auto_139364 ?auto_139370 ?auto_139367 )
      ( MAKE-1CRATE ?auto_139363 ?auto_139364 )
      ( MAKE-1CRATE-VERIFY ?auto_139363 ?auto_139364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139371 - SURFACE
      ?auto_139372 - SURFACE
    )
    :vars
    (
      ?auto_139378 - HOIST
      ?auto_139376 - PLACE
      ?auto_139375 - PLACE
      ?auto_139373 - HOIST
      ?auto_139374 - SURFACE
      ?auto_139377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139378 ?auto_139376 ) ( SURFACE-AT ?auto_139371 ?auto_139376 ) ( CLEAR ?auto_139371 ) ( IS-CRATE ?auto_139372 ) ( not ( = ?auto_139371 ?auto_139372 ) ) ( AVAILABLE ?auto_139378 ) ( not ( = ?auto_139375 ?auto_139376 ) ) ( HOIST-AT ?auto_139373 ?auto_139375 ) ( not ( = ?auto_139378 ?auto_139373 ) ) ( AVAILABLE ?auto_139373 ) ( SURFACE-AT ?auto_139372 ?auto_139375 ) ( ON ?auto_139372 ?auto_139374 ) ( CLEAR ?auto_139372 ) ( not ( = ?auto_139371 ?auto_139374 ) ) ( not ( = ?auto_139372 ?auto_139374 ) ) ( TRUCK-AT ?auto_139377 ?auto_139376 ) )
    :subtasks
    ( ( !DRIVE ?auto_139377 ?auto_139376 ?auto_139375 )
      ( MAKE-1CRATE ?auto_139371 ?auto_139372 )
      ( MAKE-1CRATE-VERIFY ?auto_139371 ?auto_139372 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139388 - SURFACE
      ?auto_139389 - SURFACE
      ?auto_139390 - SURFACE
    )
    :vars
    (
      ?auto_139392 - HOIST
      ?auto_139391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139392 ?auto_139391 ) ( SURFACE-AT ?auto_139389 ?auto_139391 ) ( CLEAR ?auto_139389 ) ( LIFTING ?auto_139392 ?auto_139390 ) ( IS-CRATE ?auto_139390 ) ( not ( = ?auto_139389 ?auto_139390 ) ) ( ON ?auto_139389 ?auto_139388 ) ( not ( = ?auto_139388 ?auto_139389 ) ) ( not ( = ?auto_139388 ?auto_139390 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139389 ?auto_139390 )
      ( MAKE-2CRATE-VERIFY ?auto_139388 ?auto_139389 ?auto_139390 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139398 - SURFACE
      ?auto_139399 - SURFACE
      ?auto_139400 - SURFACE
    )
    :vars
    (
      ?auto_139401 - HOIST
      ?auto_139402 - PLACE
      ?auto_139403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139401 ?auto_139402 ) ( SURFACE-AT ?auto_139399 ?auto_139402 ) ( CLEAR ?auto_139399 ) ( IS-CRATE ?auto_139400 ) ( not ( = ?auto_139399 ?auto_139400 ) ) ( TRUCK-AT ?auto_139403 ?auto_139402 ) ( AVAILABLE ?auto_139401 ) ( IN ?auto_139400 ?auto_139403 ) ( ON ?auto_139399 ?auto_139398 ) ( not ( = ?auto_139398 ?auto_139399 ) ) ( not ( = ?auto_139398 ?auto_139400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139399 ?auto_139400 )
      ( MAKE-2CRATE-VERIFY ?auto_139398 ?auto_139399 ?auto_139400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139404 - SURFACE
      ?auto_139405 - SURFACE
    )
    :vars
    (
      ?auto_139407 - HOIST
      ?auto_139408 - PLACE
      ?auto_139409 - TRUCK
      ?auto_139406 - SURFACE
      ?auto_139410 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139407 ?auto_139408 ) ( SURFACE-AT ?auto_139404 ?auto_139408 ) ( CLEAR ?auto_139404 ) ( IS-CRATE ?auto_139405 ) ( not ( = ?auto_139404 ?auto_139405 ) ) ( AVAILABLE ?auto_139407 ) ( IN ?auto_139405 ?auto_139409 ) ( ON ?auto_139404 ?auto_139406 ) ( not ( = ?auto_139406 ?auto_139404 ) ) ( not ( = ?auto_139406 ?auto_139405 ) ) ( TRUCK-AT ?auto_139409 ?auto_139410 ) ( not ( = ?auto_139410 ?auto_139408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139409 ?auto_139410 ?auto_139408 )
      ( MAKE-2CRATE ?auto_139406 ?auto_139404 ?auto_139405 )
      ( MAKE-1CRATE-VERIFY ?auto_139404 ?auto_139405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139411 - SURFACE
      ?auto_139412 - SURFACE
      ?auto_139413 - SURFACE
    )
    :vars
    (
      ?auto_139416 - HOIST
      ?auto_139414 - PLACE
      ?auto_139415 - TRUCK
      ?auto_139417 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139416 ?auto_139414 ) ( SURFACE-AT ?auto_139412 ?auto_139414 ) ( CLEAR ?auto_139412 ) ( IS-CRATE ?auto_139413 ) ( not ( = ?auto_139412 ?auto_139413 ) ) ( AVAILABLE ?auto_139416 ) ( IN ?auto_139413 ?auto_139415 ) ( ON ?auto_139412 ?auto_139411 ) ( not ( = ?auto_139411 ?auto_139412 ) ) ( not ( = ?auto_139411 ?auto_139413 ) ) ( TRUCK-AT ?auto_139415 ?auto_139417 ) ( not ( = ?auto_139417 ?auto_139414 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139412 ?auto_139413 )
      ( MAKE-2CRATE-VERIFY ?auto_139411 ?auto_139412 ?auto_139413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139418 - SURFACE
      ?auto_139419 - SURFACE
    )
    :vars
    (
      ?auto_139423 - HOIST
      ?auto_139422 - PLACE
      ?auto_139421 - SURFACE
      ?auto_139424 - TRUCK
      ?auto_139420 - PLACE
      ?auto_139425 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139423 ?auto_139422 ) ( SURFACE-AT ?auto_139418 ?auto_139422 ) ( CLEAR ?auto_139418 ) ( IS-CRATE ?auto_139419 ) ( not ( = ?auto_139418 ?auto_139419 ) ) ( AVAILABLE ?auto_139423 ) ( ON ?auto_139418 ?auto_139421 ) ( not ( = ?auto_139421 ?auto_139418 ) ) ( not ( = ?auto_139421 ?auto_139419 ) ) ( TRUCK-AT ?auto_139424 ?auto_139420 ) ( not ( = ?auto_139420 ?auto_139422 ) ) ( HOIST-AT ?auto_139425 ?auto_139420 ) ( LIFTING ?auto_139425 ?auto_139419 ) ( not ( = ?auto_139423 ?auto_139425 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139425 ?auto_139419 ?auto_139424 ?auto_139420 )
      ( MAKE-2CRATE ?auto_139421 ?auto_139418 ?auto_139419 )
      ( MAKE-1CRATE-VERIFY ?auto_139418 ?auto_139419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139426 - SURFACE
      ?auto_139427 - SURFACE
      ?auto_139428 - SURFACE
    )
    :vars
    (
      ?auto_139432 - HOIST
      ?auto_139433 - PLACE
      ?auto_139430 - TRUCK
      ?auto_139429 - PLACE
      ?auto_139431 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139432 ?auto_139433 ) ( SURFACE-AT ?auto_139427 ?auto_139433 ) ( CLEAR ?auto_139427 ) ( IS-CRATE ?auto_139428 ) ( not ( = ?auto_139427 ?auto_139428 ) ) ( AVAILABLE ?auto_139432 ) ( ON ?auto_139427 ?auto_139426 ) ( not ( = ?auto_139426 ?auto_139427 ) ) ( not ( = ?auto_139426 ?auto_139428 ) ) ( TRUCK-AT ?auto_139430 ?auto_139429 ) ( not ( = ?auto_139429 ?auto_139433 ) ) ( HOIST-AT ?auto_139431 ?auto_139429 ) ( LIFTING ?auto_139431 ?auto_139428 ) ( not ( = ?auto_139432 ?auto_139431 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139427 ?auto_139428 )
      ( MAKE-2CRATE-VERIFY ?auto_139426 ?auto_139427 ?auto_139428 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139434 - SURFACE
      ?auto_139435 - SURFACE
    )
    :vars
    (
      ?auto_139438 - HOIST
      ?auto_139437 - PLACE
      ?auto_139439 - SURFACE
      ?auto_139440 - TRUCK
      ?auto_139441 - PLACE
      ?auto_139436 - HOIST
      ?auto_139442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139438 ?auto_139437 ) ( SURFACE-AT ?auto_139434 ?auto_139437 ) ( CLEAR ?auto_139434 ) ( IS-CRATE ?auto_139435 ) ( not ( = ?auto_139434 ?auto_139435 ) ) ( AVAILABLE ?auto_139438 ) ( ON ?auto_139434 ?auto_139439 ) ( not ( = ?auto_139439 ?auto_139434 ) ) ( not ( = ?auto_139439 ?auto_139435 ) ) ( TRUCK-AT ?auto_139440 ?auto_139441 ) ( not ( = ?auto_139441 ?auto_139437 ) ) ( HOIST-AT ?auto_139436 ?auto_139441 ) ( not ( = ?auto_139438 ?auto_139436 ) ) ( AVAILABLE ?auto_139436 ) ( SURFACE-AT ?auto_139435 ?auto_139441 ) ( ON ?auto_139435 ?auto_139442 ) ( CLEAR ?auto_139435 ) ( not ( = ?auto_139434 ?auto_139442 ) ) ( not ( = ?auto_139435 ?auto_139442 ) ) ( not ( = ?auto_139439 ?auto_139442 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139436 ?auto_139435 ?auto_139442 ?auto_139441 )
      ( MAKE-2CRATE ?auto_139439 ?auto_139434 ?auto_139435 )
      ( MAKE-1CRATE-VERIFY ?auto_139434 ?auto_139435 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139443 - SURFACE
      ?auto_139444 - SURFACE
      ?auto_139445 - SURFACE
    )
    :vars
    (
      ?auto_139451 - HOIST
      ?auto_139449 - PLACE
      ?auto_139446 - TRUCK
      ?auto_139450 - PLACE
      ?auto_139447 - HOIST
      ?auto_139448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139451 ?auto_139449 ) ( SURFACE-AT ?auto_139444 ?auto_139449 ) ( CLEAR ?auto_139444 ) ( IS-CRATE ?auto_139445 ) ( not ( = ?auto_139444 ?auto_139445 ) ) ( AVAILABLE ?auto_139451 ) ( ON ?auto_139444 ?auto_139443 ) ( not ( = ?auto_139443 ?auto_139444 ) ) ( not ( = ?auto_139443 ?auto_139445 ) ) ( TRUCK-AT ?auto_139446 ?auto_139450 ) ( not ( = ?auto_139450 ?auto_139449 ) ) ( HOIST-AT ?auto_139447 ?auto_139450 ) ( not ( = ?auto_139451 ?auto_139447 ) ) ( AVAILABLE ?auto_139447 ) ( SURFACE-AT ?auto_139445 ?auto_139450 ) ( ON ?auto_139445 ?auto_139448 ) ( CLEAR ?auto_139445 ) ( not ( = ?auto_139444 ?auto_139448 ) ) ( not ( = ?auto_139445 ?auto_139448 ) ) ( not ( = ?auto_139443 ?auto_139448 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139444 ?auto_139445 )
      ( MAKE-2CRATE-VERIFY ?auto_139443 ?auto_139444 ?auto_139445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139452 - SURFACE
      ?auto_139453 - SURFACE
    )
    :vars
    (
      ?auto_139456 - HOIST
      ?auto_139458 - PLACE
      ?auto_139455 - SURFACE
      ?auto_139457 - PLACE
      ?auto_139459 - HOIST
      ?auto_139454 - SURFACE
      ?auto_139460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139456 ?auto_139458 ) ( SURFACE-AT ?auto_139452 ?auto_139458 ) ( CLEAR ?auto_139452 ) ( IS-CRATE ?auto_139453 ) ( not ( = ?auto_139452 ?auto_139453 ) ) ( AVAILABLE ?auto_139456 ) ( ON ?auto_139452 ?auto_139455 ) ( not ( = ?auto_139455 ?auto_139452 ) ) ( not ( = ?auto_139455 ?auto_139453 ) ) ( not ( = ?auto_139457 ?auto_139458 ) ) ( HOIST-AT ?auto_139459 ?auto_139457 ) ( not ( = ?auto_139456 ?auto_139459 ) ) ( AVAILABLE ?auto_139459 ) ( SURFACE-AT ?auto_139453 ?auto_139457 ) ( ON ?auto_139453 ?auto_139454 ) ( CLEAR ?auto_139453 ) ( not ( = ?auto_139452 ?auto_139454 ) ) ( not ( = ?auto_139453 ?auto_139454 ) ) ( not ( = ?auto_139455 ?auto_139454 ) ) ( TRUCK-AT ?auto_139460 ?auto_139458 ) )
    :subtasks
    ( ( !DRIVE ?auto_139460 ?auto_139458 ?auto_139457 )
      ( MAKE-2CRATE ?auto_139455 ?auto_139452 ?auto_139453 )
      ( MAKE-1CRATE-VERIFY ?auto_139452 ?auto_139453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139461 - SURFACE
      ?auto_139462 - SURFACE
      ?auto_139463 - SURFACE
    )
    :vars
    (
      ?auto_139466 - HOIST
      ?auto_139468 - PLACE
      ?auto_139465 - PLACE
      ?auto_139467 - HOIST
      ?auto_139469 - SURFACE
      ?auto_139464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139466 ?auto_139468 ) ( SURFACE-AT ?auto_139462 ?auto_139468 ) ( CLEAR ?auto_139462 ) ( IS-CRATE ?auto_139463 ) ( not ( = ?auto_139462 ?auto_139463 ) ) ( AVAILABLE ?auto_139466 ) ( ON ?auto_139462 ?auto_139461 ) ( not ( = ?auto_139461 ?auto_139462 ) ) ( not ( = ?auto_139461 ?auto_139463 ) ) ( not ( = ?auto_139465 ?auto_139468 ) ) ( HOIST-AT ?auto_139467 ?auto_139465 ) ( not ( = ?auto_139466 ?auto_139467 ) ) ( AVAILABLE ?auto_139467 ) ( SURFACE-AT ?auto_139463 ?auto_139465 ) ( ON ?auto_139463 ?auto_139469 ) ( CLEAR ?auto_139463 ) ( not ( = ?auto_139462 ?auto_139469 ) ) ( not ( = ?auto_139463 ?auto_139469 ) ) ( not ( = ?auto_139461 ?auto_139469 ) ) ( TRUCK-AT ?auto_139464 ?auto_139468 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139462 ?auto_139463 )
      ( MAKE-2CRATE-VERIFY ?auto_139461 ?auto_139462 ?auto_139463 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139470 - SURFACE
      ?auto_139471 - SURFACE
    )
    :vars
    (
      ?auto_139474 - HOIST
      ?auto_139473 - PLACE
      ?auto_139477 - SURFACE
      ?auto_139475 - PLACE
      ?auto_139478 - HOIST
      ?auto_139472 - SURFACE
      ?auto_139476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139474 ?auto_139473 ) ( IS-CRATE ?auto_139471 ) ( not ( = ?auto_139470 ?auto_139471 ) ) ( not ( = ?auto_139477 ?auto_139470 ) ) ( not ( = ?auto_139477 ?auto_139471 ) ) ( not ( = ?auto_139475 ?auto_139473 ) ) ( HOIST-AT ?auto_139478 ?auto_139475 ) ( not ( = ?auto_139474 ?auto_139478 ) ) ( AVAILABLE ?auto_139478 ) ( SURFACE-AT ?auto_139471 ?auto_139475 ) ( ON ?auto_139471 ?auto_139472 ) ( CLEAR ?auto_139471 ) ( not ( = ?auto_139470 ?auto_139472 ) ) ( not ( = ?auto_139471 ?auto_139472 ) ) ( not ( = ?auto_139477 ?auto_139472 ) ) ( TRUCK-AT ?auto_139476 ?auto_139473 ) ( SURFACE-AT ?auto_139477 ?auto_139473 ) ( CLEAR ?auto_139477 ) ( LIFTING ?auto_139474 ?auto_139470 ) ( IS-CRATE ?auto_139470 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139477 ?auto_139470 )
      ( MAKE-2CRATE ?auto_139477 ?auto_139470 ?auto_139471 )
      ( MAKE-1CRATE-VERIFY ?auto_139470 ?auto_139471 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139479 - SURFACE
      ?auto_139480 - SURFACE
      ?auto_139481 - SURFACE
    )
    :vars
    (
      ?auto_139483 - HOIST
      ?auto_139486 - PLACE
      ?auto_139485 - PLACE
      ?auto_139487 - HOIST
      ?auto_139484 - SURFACE
      ?auto_139482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139483 ?auto_139486 ) ( IS-CRATE ?auto_139481 ) ( not ( = ?auto_139480 ?auto_139481 ) ) ( not ( = ?auto_139479 ?auto_139480 ) ) ( not ( = ?auto_139479 ?auto_139481 ) ) ( not ( = ?auto_139485 ?auto_139486 ) ) ( HOIST-AT ?auto_139487 ?auto_139485 ) ( not ( = ?auto_139483 ?auto_139487 ) ) ( AVAILABLE ?auto_139487 ) ( SURFACE-AT ?auto_139481 ?auto_139485 ) ( ON ?auto_139481 ?auto_139484 ) ( CLEAR ?auto_139481 ) ( not ( = ?auto_139480 ?auto_139484 ) ) ( not ( = ?auto_139481 ?auto_139484 ) ) ( not ( = ?auto_139479 ?auto_139484 ) ) ( TRUCK-AT ?auto_139482 ?auto_139486 ) ( SURFACE-AT ?auto_139479 ?auto_139486 ) ( CLEAR ?auto_139479 ) ( LIFTING ?auto_139483 ?auto_139480 ) ( IS-CRATE ?auto_139480 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139480 ?auto_139481 )
      ( MAKE-2CRATE-VERIFY ?auto_139479 ?auto_139480 ?auto_139481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139488 - SURFACE
      ?auto_139489 - SURFACE
    )
    :vars
    (
      ?auto_139496 - HOIST
      ?auto_139491 - PLACE
      ?auto_139494 - SURFACE
      ?auto_139495 - PLACE
      ?auto_139493 - HOIST
      ?auto_139492 - SURFACE
      ?auto_139490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139496 ?auto_139491 ) ( IS-CRATE ?auto_139489 ) ( not ( = ?auto_139488 ?auto_139489 ) ) ( not ( = ?auto_139494 ?auto_139488 ) ) ( not ( = ?auto_139494 ?auto_139489 ) ) ( not ( = ?auto_139495 ?auto_139491 ) ) ( HOIST-AT ?auto_139493 ?auto_139495 ) ( not ( = ?auto_139496 ?auto_139493 ) ) ( AVAILABLE ?auto_139493 ) ( SURFACE-AT ?auto_139489 ?auto_139495 ) ( ON ?auto_139489 ?auto_139492 ) ( CLEAR ?auto_139489 ) ( not ( = ?auto_139488 ?auto_139492 ) ) ( not ( = ?auto_139489 ?auto_139492 ) ) ( not ( = ?auto_139494 ?auto_139492 ) ) ( TRUCK-AT ?auto_139490 ?auto_139491 ) ( SURFACE-AT ?auto_139494 ?auto_139491 ) ( CLEAR ?auto_139494 ) ( IS-CRATE ?auto_139488 ) ( AVAILABLE ?auto_139496 ) ( IN ?auto_139488 ?auto_139490 ) )
    :subtasks
    ( ( !UNLOAD ?auto_139496 ?auto_139488 ?auto_139490 ?auto_139491 )
      ( MAKE-2CRATE ?auto_139494 ?auto_139488 ?auto_139489 )
      ( MAKE-1CRATE-VERIFY ?auto_139488 ?auto_139489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139497 - SURFACE
      ?auto_139498 - SURFACE
      ?auto_139499 - SURFACE
    )
    :vars
    (
      ?auto_139500 - HOIST
      ?auto_139503 - PLACE
      ?auto_139502 - PLACE
      ?auto_139505 - HOIST
      ?auto_139501 - SURFACE
      ?auto_139504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139500 ?auto_139503 ) ( IS-CRATE ?auto_139499 ) ( not ( = ?auto_139498 ?auto_139499 ) ) ( not ( = ?auto_139497 ?auto_139498 ) ) ( not ( = ?auto_139497 ?auto_139499 ) ) ( not ( = ?auto_139502 ?auto_139503 ) ) ( HOIST-AT ?auto_139505 ?auto_139502 ) ( not ( = ?auto_139500 ?auto_139505 ) ) ( AVAILABLE ?auto_139505 ) ( SURFACE-AT ?auto_139499 ?auto_139502 ) ( ON ?auto_139499 ?auto_139501 ) ( CLEAR ?auto_139499 ) ( not ( = ?auto_139498 ?auto_139501 ) ) ( not ( = ?auto_139499 ?auto_139501 ) ) ( not ( = ?auto_139497 ?auto_139501 ) ) ( TRUCK-AT ?auto_139504 ?auto_139503 ) ( SURFACE-AT ?auto_139497 ?auto_139503 ) ( CLEAR ?auto_139497 ) ( IS-CRATE ?auto_139498 ) ( AVAILABLE ?auto_139500 ) ( IN ?auto_139498 ?auto_139504 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139498 ?auto_139499 )
      ( MAKE-2CRATE-VERIFY ?auto_139497 ?auto_139498 ?auto_139499 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139506 - SURFACE
      ?auto_139507 - SURFACE
    )
    :vars
    (
      ?auto_139512 - HOIST
      ?auto_139514 - PLACE
      ?auto_139509 - SURFACE
      ?auto_139513 - PLACE
      ?auto_139508 - HOIST
      ?auto_139511 - SURFACE
      ?auto_139510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139512 ?auto_139514 ) ( IS-CRATE ?auto_139507 ) ( not ( = ?auto_139506 ?auto_139507 ) ) ( not ( = ?auto_139509 ?auto_139506 ) ) ( not ( = ?auto_139509 ?auto_139507 ) ) ( not ( = ?auto_139513 ?auto_139514 ) ) ( HOIST-AT ?auto_139508 ?auto_139513 ) ( not ( = ?auto_139512 ?auto_139508 ) ) ( AVAILABLE ?auto_139508 ) ( SURFACE-AT ?auto_139507 ?auto_139513 ) ( ON ?auto_139507 ?auto_139511 ) ( CLEAR ?auto_139507 ) ( not ( = ?auto_139506 ?auto_139511 ) ) ( not ( = ?auto_139507 ?auto_139511 ) ) ( not ( = ?auto_139509 ?auto_139511 ) ) ( SURFACE-AT ?auto_139509 ?auto_139514 ) ( CLEAR ?auto_139509 ) ( IS-CRATE ?auto_139506 ) ( AVAILABLE ?auto_139512 ) ( IN ?auto_139506 ?auto_139510 ) ( TRUCK-AT ?auto_139510 ?auto_139513 ) )
    :subtasks
    ( ( !DRIVE ?auto_139510 ?auto_139513 ?auto_139514 )
      ( MAKE-2CRATE ?auto_139509 ?auto_139506 ?auto_139507 )
      ( MAKE-1CRATE-VERIFY ?auto_139506 ?auto_139507 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139515 - SURFACE
      ?auto_139516 - SURFACE
      ?auto_139517 - SURFACE
    )
    :vars
    (
      ?auto_139520 - HOIST
      ?auto_139519 - PLACE
      ?auto_139521 - PLACE
      ?auto_139518 - HOIST
      ?auto_139522 - SURFACE
      ?auto_139523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139520 ?auto_139519 ) ( IS-CRATE ?auto_139517 ) ( not ( = ?auto_139516 ?auto_139517 ) ) ( not ( = ?auto_139515 ?auto_139516 ) ) ( not ( = ?auto_139515 ?auto_139517 ) ) ( not ( = ?auto_139521 ?auto_139519 ) ) ( HOIST-AT ?auto_139518 ?auto_139521 ) ( not ( = ?auto_139520 ?auto_139518 ) ) ( AVAILABLE ?auto_139518 ) ( SURFACE-AT ?auto_139517 ?auto_139521 ) ( ON ?auto_139517 ?auto_139522 ) ( CLEAR ?auto_139517 ) ( not ( = ?auto_139516 ?auto_139522 ) ) ( not ( = ?auto_139517 ?auto_139522 ) ) ( not ( = ?auto_139515 ?auto_139522 ) ) ( SURFACE-AT ?auto_139515 ?auto_139519 ) ( CLEAR ?auto_139515 ) ( IS-CRATE ?auto_139516 ) ( AVAILABLE ?auto_139520 ) ( IN ?auto_139516 ?auto_139523 ) ( TRUCK-AT ?auto_139523 ?auto_139521 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139516 ?auto_139517 )
      ( MAKE-2CRATE-VERIFY ?auto_139515 ?auto_139516 ?auto_139517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139524 - SURFACE
      ?auto_139525 - SURFACE
    )
    :vars
    (
      ?auto_139529 - HOIST
      ?auto_139532 - PLACE
      ?auto_139526 - SURFACE
      ?auto_139530 - PLACE
      ?auto_139528 - HOIST
      ?auto_139531 - SURFACE
      ?auto_139527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139529 ?auto_139532 ) ( IS-CRATE ?auto_139525 ) ( not ( = ?auto_139524 ?auto_139525 ) ) ( not ( = ?auto_139526 ?auto_139524 ) ) ( not ( = ?auto_139526 ?auto_139525 ) ) ( not ( = ?auto_139530 ?auto_139532 ) ) ( HOIST-AT ?auto_139528 ?auto_139530 ) ( not ( = ?auto_139529 ?auto_139528 ) ) ( SURFACE-AT ?auto_139525 ?auto_139530 ) ( ON ?auto_139525 ?auto_139531 ) ( CLEAR ?auto_139525 ) ( not ( = ?auto_139524 ?auto_139531 ) ) ( not ( = ?auto_139525 ?auto_139531 ) ) ( not ( = ?auto_139526 ?auto_139531 ) ) ( SURFACE-AT ?auto_139526 ?auto_139532 ) ( CLEAR ?auto_139526 ) ( IS-CRATE ?auto_139524 ) ( AVAILABLE ?auto_139529 ) ( TRUCK-AT ?auto_139527 ?auto_139530 ) ( LIFTING ?auto_139528 ?auto_139524 ) )
    :subtasks
    ( ( !LOAD ?auto_139528 ?auto_139524 ?auto_139527 ?auto_139530 )
      ( MAKE-2CRATE ?auto_139526 ?auto_139524 ?auto_139525 )
      ( MAKE-1CRATE-VERIFY ?auto_139524 ?auto_139525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139533 - SURFACE
      ?auto_139534 - SURFACE
      ?auto_139535 - SURFACE
    )
    :vars
    (
      ?auto_139538 - HOIST
      ?auto_139541 - PLACE
      ?auto_139537 - PLACE
      ?auto_139536 - HOIST
      ?auto_139539 - SURFACE
      ?auto_139540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139538 ?auto_139541 ) ( IS-CRATE ?auto_139535 ) ( not ( = ?auto_139534 ?auto_139535 ) ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( not ( = ?auto_139533 ?auto_139535 ) ) ( not ( = ?auto_139537 ?auto_139541 ) ) ( HOIST-AT ?auto_139536 ?auto_139537 ) ( not ( = ?auto_139538 ?auto_139536 ) ) ( SURFACE-AT ?auto_139535 ?auto_139537 ) ( ON ?auto_139535 ?auto_139539 ) ( CLEAR ?auto_139535 ) ( not ( = ?auto_139534 ?auto_139539 ) ) ( not ( = ?auto_139535 ?auto_139539 ) ) ( not ( = ?auto_139533 ?auto_139539 ) ) ( SURFACE-AT ?auto_139533 ?auto_139541 ) ( CLEAR ?auto_139533 ) ( IS-CRATE ?auto_139534 ) ( AVAILABLE ?auto_139538 ) ( TRUCK-AT ?auto_139540 ?auto_139537 ) ( LIFTING ?auto_139536 ?auto_139534 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139534 ?auto_139535 )
      ( MAKE-2CRATE-VERIFY ?auto_139533 ?auto_139534 ?auto_139535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139542 - SURFACE
      ?auto_139543 - SURFACE
    )
    :vars
    (
      ?auto_139548 - HOIST
      ?auto_139549 - PLACE
      ?auto_139547 - SURFACE
      ?auto_139545 - PLACE
      ?auto_139546 - HOIST
      ?auto_139550 - SURFACE
      ?auto_139544 - TRUCK
      ?auto_139551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139548 ?auto_139549 ) ( IS-CRATE ?auto_139543 ) ( not ( = ?auto_139542 ?auto_139543 ) ) ( not ( = ?auto_139547 ?auto_139542 ) ) ( not ( = ?auto_139547 ?auto_139543 ) ) ( not ( = ?auto_139545 ?auto_139549 ) ) ( HOIST-AT ?auto_139546 ?auto_139545 ) ( not ( = ?auto_139548 ?auto_139546 ) ) ( SURFACE-AT ?auto_139543 ?auto_139545 ) ( ON ?auto_139543 ?auto_139550 ) ( CLEAR ?auto_139543 ) ( not ( = ?auto_139542 ?auto_139550 ) ) ( not ( = ?auto_139543 ?auto_139550 ) ) ( not ( = ?auto_139547 ?auto_139550 ) ) ( SURFACE-AT ?auto_139547 ?auto_139549 ) ( CLEAR ?auto_139547 ) ( IS-CRATE ?auto_139542 ) ( AVAILABLE ?auto_139548 ) ( TRUCK-AT ?auto_139544 ?auto_139545 ) ( AVAILABLE ?auto_139546 ) ( SURFACE-AT ?auto_139542 ?auto_139545 ) ( ON ?auto_139542 ?auto_139551 ) ( CLEAR ?auto_139542 ) ( not ( = ?auto_139542 ?auto_139551 ) ) ( not ( = ?auto_139543 ?auto_139551 ) ) ( not ( = ?auto_139547 ?auto_139551 ) ) ( not ( = ?auto_139550 ?auto_139551 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139546 ?auto_139542 ?auto_139551 ?auto_139545 )
      ( MAKE-2CRATE ?auto_139547 ?auto_139542 ?auto_139543 )
      ( MAKE-1CRATE-VERIFY ?auto_139542 ?auto_139543 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139552 - SURFACE
      ?auto_139553 - SURFACE
      ?auto_139554 - SURFACE
    )
    :vars
    (
      ?auto_139558 - HOIST
      ?auto_139555 - PLACE
      ?auto_139559 - PLACE
      ?auto_139561 - HOIST
      ?auto_139557 - SURFACE
      ?auto_139560 - TRUCK
      ?auto_139556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139558 ?auto_139555 ) ( IS-CRATE ?auto_139554 ) ( not ( = ?auto_139553 ?auto_139554 ) ) ( not ( = ?auto_139552 ?auto_139553 ) ) ( not ( = ?auto_139552 ?auto_139554 ) ) ( not ( = ?auto_139559 ?auto_139555 ) ) ( HOIST-AT ?auto_139561 ?auto_139559 ) ( not ( = ?auto_139558 ?auto_139561 ) ) ( SURFACE-AT ?auto_139554 ?auto_139559 ) ( ON ?auto_139554 ?auto_139557 ) ( CLEAR ?auto_139554 ) ( not ( = ?auto_139553 ?auto_139557 ) ) ( not ( = ?auto_139554 ?auto_139557 ) ) ( not ( = ?auto_139552 ?auto_139557 ) ) ( SURFACE-AT ?auto_139552 ?auto_139555 ) ( CLEAR ?auto_139552 ) ( IS-CRATE ?auto_139553 ) ( AVAILABLE ?auto_139558 ) ( TRUCK-AT ?auto_139560 ?auto_139559 ) ( AVAILABLE ?auto_139561 ) ( SURFACE-AT ?auto_139553 ?auto_139559 ) ( ON ?auto_139553 ?auto_139556 ) ( CLEAR ?auto_139553 ) ( not ( = ?auto_139553 ?auto_139556 ) ) ( not ( = ?auto_139554 ?auto_139556 ) ) ( not ( = ?auto_139552 ?auto_139556 ) ) ( not ( = ?auto_139557 ?auto_139556 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139553 ?auto_139554 )
      ( MAKE-2CRATE-VERIFY ?auto_139552 ?auto_139553 ?auto_139554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139562 - SURFACE
      ?auto_139563 - SURFACE
    )
    :vars
    (
      ?auto_139570 - HOIST
      ?auto_139565 - PLACE
      ?auto_139564 - SURFACE
      ?auto_139571 - PLACE
      ?auto_139567 - HOIST
      ?auto_139566 - SURFACE
      ?auto_139568 - SURFACE
      ?auto_139569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139570 ?auto_139565 ) ( IS-CRATE ?auto_139563 ) ( not ( = ?auto_139562 ?auto_139563 ) ) ( not ( = ?auto_139564 ?auto_139562 ) ) ( not ( = ?auto_139564 ?auto_139563 ) ) ( not ( = ?auto_139571 ?auto_139565 ) ) ( HOIST-AT ?auto_139567 ?auto_139571 ) ( not ( = ?auto_139570 ?auto_139567 ) ) ( SURFACE-AT ?auto_139563 ?auto_139571 ) ( ON ?auto_139563 ?auto_139566 ) ( CLEAR ?auto_139563 ) ( not ( = ?auto_139562 ?auto_139566 ) ) ( not ( = ?auto_139563 ?auto_139566 ) ) ( not ( = ?auto_139564 ?auto_139566 ) ) ( SURFACE-AT ?auto_139564 ?auto_139565 ) ( CLEAR ?auto_139564 ) ( IS-CRATE ?auto_139562 ) ( AVAILABLE ?auto_139570 ) ( AVAILABLE ?auto_139567 ) ( SURFACE-AT ?auto_139562 ?auto_139571 ) ( ON ?auto_139562 ?auto_139568 ) ( CLEAR ?auto_139562 ) ( not ( = ?auto_139562 ?auto_139568 ) ) ( not ( = ?auto_139563 ?auto_139568 ) ) ( not ( = ?auto_139564 ?auto_139568 ) ) ( not ( = ?auto_139566 ?auto_139568 ) ) ( TRUCK-AT ?auto_139569 ?auto_139565 ) )
    :subtasks
    ( ( !DRIVE ?auto_139569 ?auto_139565 ?auto_139571 )
      ( MAKE-2CRATE ?auto_139564 ?auto_139562 ?auto_139563 )
      ( MAKE-1CRATE-VERIFY ?auto_139562 ?auto_139563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139572 - SURFACE
      ?auto_139573 - SURFACE
      ?auto_139574 - SURFACE
    )
    :vars
    (
      ?auto_139579 - HOIST
      ?auto_139577 - PLACE
      ?auto_139580 - PLACE
      ?auto_139575 - HOIST
      ?auto_139578 - SURFACE
      ?auto_139576 - SURFACE
      ?auto_139581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139579 ?auto_139577 ) ( IS-CRATE ?auto_139574 ) ( not ( = ?auto_139573 ?auto_139574 ) ) ( not ( = ?auto_139572 ?auto_139573 ) ) ( not ( = ?auto_139572 ?auto_139574 ) ) ( not ( = ?auto_139580 ?auto_139577 ) ) ( HOIST-AT ?auto_139575 ?auto_139580 ) ( not ( = ?auto_139579 ?auto_139575 ) ) ( SURFACE-AT ?auto_139574 ?auto_139580 ) ( ON ?auto_139574 ?auto_139578 ) ( CLEAR ?auto_139574 ) ( not ( = ?auto_139573 ?auto_139578 ) ) ( not ( = ?auto_139574 ?auto_139578 ) ) ( not ( = ?auto_139572 ?auto_139578 ) ) ( SURFACE-AT ?auto_139572 ?auto_139577 ) ( CLEAR ?auto_139572 ) ( IS-CRATE ?auto_139573 ) ( AVAILABLE ?auto_139579 ) ( AVAILABLE ?auto_139575 ) ( SURFACE-AT ?auto_139573 ?auto_139580 ) ( ON ?auto_139573 ?auto_139576 ) ( CLEAR ?auto_139573 ) ( not ( = ?auto_139573 ?auto_139576 ) ) ( not ( = ?auto_139574 ?auto_139576 ) ) ( not ( = ?auto_139572 ?auto_139576 ) ) ( not ( = ?auto_139578 ?auto_139576 ) ) ( TRUCK-AT ?auto_139581 ?auto_139577 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139573 ?auto_139574 )
      ( MAKE-2CRATE-VERIFY ?auto_139572 ?auto_139573 ?auto_139574 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139601 - SURFACE
      ?auto_139602 - SURFACE
      ?auto_139603 - SURFACE
      ?auto_139600 - SURFACE
    )
    :vars
    (
      ?auto_139604 - HOIST
      ?auto_139605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139604 ?auto_139605 ) ( SURFACE-AT ?auto_139603 ?auto_139605 ) ( CLEAR ?auto_139603 ) ( LIFTING ?auto_139604 ?auto_139600 ) ( IS-CRATE ?auto_139600 ) ( not ( = ?auto_139603 ?auto_139600 ) ) ( ON ?auto_139602 ?auto_139601 ) ( ON ?auto_139603 ?auto_139602 ) ( not ( = ?auto_139601 ?auto_139602 ) ) ( not ( = ?auto_139601 ?auto_139603 ) ) ( not ( = ?auto_139601 ?auto_139600 ) ) ( not ( = ?auto_139602 ?auto_139603 ) ) ( not ( = ?auto_139602 ?auto_139600 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139603 ?auto_139600 )
      ( MAKE-3CRATE-VERIFY ?auto_139601 ?auto_139602 ?auto_139603 ?auto_139600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139618 - SURFACE
      ?auto_139619 - SURFACE
      ?auto_139620 - SURFACE
      ?auto_139617 - SURFACE
    )
    :vars
    (
      ?auto_139621 - HOIST
      ?auto_139622 - PLACE
      ?auto_139623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139621 ?auto_139622 ) ( SURFACE-AT ?auto_139620 ?auto_139622 ) ( CLEAR ?auto_139620 ) ( IS-CRATE ?auto_139617 ) ( not ( = ?auto_139620 ?auto_139617 ) ) ( TRUCK-AT ?auto_139623 ?auto_139622 ) ( AVAILABLE ?auto_139621 ) ( IN ?auto_139617 ?auto_139623 ) ( ON ?auto_139620 ?auto_139619 ) ( not ( = ?auto_139619 ?auto_139620 ) ) ( not ( = ?auto_139619 ?auto_139617 ) ) ( ON ?auto_139619 ?auto_139618 ) ( not ( = ?auto_139618 ?auto_139619 ) ) ( not ( = ?auto_139618 ?auto_139620 ) ) ( not ( = ?auto_139618 ?auto_139617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139619 ?auto_139620 ?auto_139617 )
      ( MAKE-3CRATE-VERIFY ?auto_139618 ?auto_139619 ?auto_139620 ?auto_139617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139639 - SURFACE
      ?auto_139640 - SURFACE
      ?auto_139641 - SURFACE
      ?auto_139638 - SURFACE
    )
    :vars
    (
      ?auto_139645 - HOIST
      ?auto_139644 - PLACE
      ?auto_139643 - TRUCK
      ?auto_139642 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139645 ?auto_139644 ) ( SURFACE-AT ?auto_139641 ?auto_139644 ) ( CLEAR ?auto_139641 ) ( IS-CRATE ?auto_139638 ) ( not ( = ?auto_139641 ?auto_139638 ) ) ( AVAILABLE ?auto_139645 ) ( IN ?auto_139638 ?auto_139643 ) ( ON ?auto_139641 ?auto_139640 ) ( not ( = ?auto_139640 ?auto_139641 ) ) ( not ( = ?auto_139640 ?auto_139638 ) ) ( TRUCK-AT ?auto_139643 ?auto_139642 ) ( not ( = ?auto_139642 ?auto_139644 ) ) ( ON ?auto_139640 ?auto_139639 ) ( not ( = ?auto_139639 ?auto_139640 ) ) ( not ( = ?auto_139639 ?auto_139641 ) ) ( not ( = ?auto_139639 ?auto_139638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139640 ?auto_139641 ?auto_139638 )
      ( MAKE-3CRATE-VERIFY ?auto_139639 ?auto_139640 ?auto_139641 ?auto_139638 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139663 - SURFACE
      ?auto_139664 - SURFACE
      ?auto_139665 - SURFACE
      ?auto_139662 - SURFACE
    )
    :vars
    (
      ?auto_139670 - HOIST
      ?auto_139668 - PLACE
      ?auto_139667 - TRUCK
      ?auto_139666 - PLACE
      ?auto_139669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139670 ?auto_139668 ) ( SURFACE-AT ?auto_139665 ?auto_139668 ) ( CLEAR ?auto_139665 ) ( IS-CRATE ?auto_139662 ) ( not ( = ?auto_139665 ?auto_139662 ) ) ( AVAILABLE ?auto_139670 ) ( ON ?auto_139665 ?auto_139664 ) ( not ( = ?auto_139664 ?auto_139665 ) ) ( not ( = ?auto_139664 ?auto_139662 ) ) ( TRUCK-AT ?auto_139667 ?auto_139666 ) ( not ( = ?auto_139666 ?auto_139668 ) ) ( HOIST-AT ?auto_139669 ?auto_139666 ) ( LIFTING ?auto_139669 ?auto_139662 ) ( not ( = ?auto_139670 ?auto_139669 ) ) ( ON ?auto_139664 ?auto_139663 ) ( not ( = ?auto_139663 ?auto_139664 ) ) ( not ( = ?auto_139663 ?auto_139665 ) ) ( not ( = ?auto_139663 ?auto_139662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139664 ?auto_139665 ?auto_139662 )
      ( MAKE-3CRATE-VERIFY ?auto_139663 ?auto_139664 ?auto_139665 ?auto_139662 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139690 - SURFACE
      ?auto_139691 - SURFACE
      ?auto_139692 - SURFACE
      ?auto_139689 - SURFACE
    )
    :vars
    (
      ?auto_139698 - HOIST
      ?auto_139694 - PLACE
      ?auto_139695 - TRUCK
      ?auto_139696 - PLACE
      ?auto_139697 - HOIST
      ?auto_139693 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139698 ?auto_139694 ) ( SURFACE-AT ?auto_139692 ?auto_139694 ) ( CLEAR ?auto_139692 ) ( IS-CRATE ?auto_139689 ) ( not ( = ?auto_139692 ?auto_139689 ) ) ( AVAILABLE ?auto_139698 ) ( ON ?auto_139692 ?auto_139691 ) ( not ( = ?auto_139691 ?auto_139692 ) ) ( not ( = ?auto_139691 ?auto_139689 ) ) ( TRUCK-AT ?auto_139695 ?auto_139696 ) ( not ( = ?auto_139696 ?auto_139694 ) ) ( HOIST-AT ?auto_139697 ?auto_139696 ) ( not ( = ?auto_139698 ?auto_139697 ) ) ( AVAILABLE ?auto_139697 ) ( SURFACE-AT ?auto_139689 ?auto_139696 ) ( ON ?auto_139689 ?auto_139693 ) ( CLEAR ?auto_139689 ) ( not ( = ?auto_139692 ?auto_139693 ) ) ( not ( = ?auto_139689 ?auto_139693 ) ) ( not ( = ?auto_139691 ?auto_139693 ) ) ( ON ?auto_139691 ?auto_139690 ) ( not ( = ?auto_139690 ?auto_139691 ) ) ( not ( = ?auto_139690 ?auto_139692 ) ) ( not ( = ?auto_139690 ?auto_139689 ) ) ( not ( = ?auto_139690 ?auto_139693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139691 ?auto_139692 ?auto_139689 )
      ( MAKE-3CRATE-VERIFY ?auto_139690 ?auto_139691 ?auto_139692 ?auto_139689 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139718 - SURFACE
      ?auto_139719 - SURFACE
      ?auto_139720 - SURFACE
      ?auto_139717 - SURFACE
    )
    :vars
    (
      ?auto_139722 - HOIST
      ?auto_139721 - PLACE
      ?auto_139725 - PLACE
      ?auto_139726 - HOIST
      ?auto_139724 - SURFACE
      ?auto_139723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139722 ?auto_139721 ) ( SURFACE-AT ?auto_139720 ?auto_139721 ) ( CLEAR ?auto_139720 ) ( IS-CRATE ?auto_139717 ) ( not ( = ?auto_139720 ?auto_139717 ) ) ( AVAILABLE ?auto_139722 ) ( ON ?auto_139720 ?auto_139719 ) ( not ( = ?auto_139719 ?auto_139720 ) ) ( not ( = ?auto_139719 ?auto_139717 ) ) ( not ( = ?auto_139725 ?auto_139721 ) ) ( HOIST-AT ?auto_139726 ?auto_139725 ) ( not ( = ?auto_139722 ?auto_139726 ) ) ( AVAILABLE ?auto_139726 ) ( SURFACE-AT ?auto_139717 ?auto_139725 ) ( ON ?auto_139717 ?auto_139724 ) ( CLEAR ?auto_139717 ) ( not ( = ?auto_139720 ?auto_139724 ) ) ( not ( = ?auto_139717 ?auto_139724 ) ) ( not ( = ?auto_139719 ?auto_139724 ) ) ( TRUCK-AT ?auto_139723 ?auto_139721 ) ( ON ?auto_139719 ?auto_139718 ) ( not ( = ?auto_139718 ?auto_139719 ) ) ( not ( = ?auto_139718 ?auto_139720 ) ) ( not ( = ?auto_139718 ?auto_139717 ) ) ( not ( = ?auto_139718 ?auto_139724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139719 ?auto_139720 ?auto_139717 )
      ( MAKE-3CRATE-VERIFY ?auto_139718 ?auto_139719 ?auto_139720 ?auto_139717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139746 - SURFACE
      ?auto_139747 - SURFACE
      ?auto_139748 - SURFACE
      ?auto_139745 - SURFACE
    )
    :vars
    (
      ?auto_139751 - HOIST
      ?auto_139749 - PLACE
      ?auto_139754 - PLACE
      ?auto_139752 - HOIST
      ?auto_139750 - SURFACE
      ?auto_139753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139751 ?auto_139749 ) ( IS-CRATE ?auto_139745 ) ( not ( = ?auto_139748 ?auto_139745 ) ) ( not ( = ?auto_139747 ?auto_139748 ) ) ( not ( = ?auto_139747 ?auto_139745 ) ) ( not ( = ?auto_139754 ?auto_139749 ) ) ( HOIST-AT ?auto_139752 ?auto_139754 ) ( not ( = ?auto_139751 ?auto_139752 ) ) ( AVAILABLE ?auto_139752 ) ( SURFACE-AT ?auto_139745 ?auto_139754 ) ( ON ?auto_139745 ?auto_139750 ) ( CLEAR ?auto_139745 ) ( not ( = ?auto_139748 ?auto_139750 ) ) ( not ( = ?auto_139745 ?auto_139750 ) ) ( not ( = ?auto_139747 ?auto_139750 ) ) ( TRUCK-AT ?auto_139753 ?auto_139749 ) ( SURFACE-AT ?auto_139747 ?auto_139749 ) ( CLEAR ?auto_139747 ) ( LIFTING ?auto_139751 ?auto_139748 ) ( IS-CRATE ?auto_139748 ) ( ON ?auto_139747 ?auto_139746 ) ( not ( = ?auto_139746 ?auto_139747 ) ) ( not ( = ?auto_139746 ?auto_139748 ) ) ( not ( = ?auto_139746 ?auto_139745 ) ) ( not ( = ?auto_139746 ?auto_139750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139747 ?auto_139748 ?auto_139745 )
      ( MAKE-3CRATE-VERIFY ?auto_139746 ?auto_139747 ?auto_139748 ?auto_139745 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139774 - SURFACE
      ?auto_139775 - SURFACE
      ?auto_139776 - SURFACE
      ?auto_139773 - SURFACE
    )
    :vars
    (
      ?auto_139777 - HOIST
      ?auto_139778 - PLACE
      ?auto_139782 - PLACE
      ?auto_139781 - HOIST
      ?auto_139779 - SURFACE
      ?auto_139780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139777 ?auto_139778 ) ( IS-CRATE ?auto_139773 ) ( not ( = ?auto_139776 ?auto_139773 ) ) ( not ( = ?auto_139775 ?auto_139776 ) ) ( not ( = ?auto_139775 ?auto_139773 ) ) ( not ( = ?auto_139782 ?auto_139778 ) ) ( HOIST-AT ?auto_139781 ?auto_139782 ) ( not ( = ?auto_139777 ?auto_139781 ) ) ( AVAILABLE ?auto_139781 ) ( SURFACE-AT ?auto_139773 ?auto_139782 ) ( ON ?auto_139773 ?auto_139779 ) ( CLEAR ?auto_139773 ) ( not ( = ?auto_139776 ?auto_139779 ) ) ( not ( = ?auto_139773 ?auto_139779 ) ) ( not ( = ?auto_139775 ?auto_139779 ) ) ( TRUCK-AT ?auto_139780 ?auto_139778 ) ( SURFACE-AT ?auto_139775 ?auto_139778 ) ( CLEAR ?auto_139775 ) ( IS-CRATE ?auto_139776 ) ( AVAILABLE ?auto_139777 ) ( IN ?auto_139776 ?auto_139780 ) ( ON ?auto_139775 ?auto_139774 ) ( not ( = ?auto_139774 ?auto_139775 ) ) ( not ( = ?auto_139774 ?auto_139776 ) ) ( not ( = ?auto_139774 ?auto_139773 ) ) ( not ( = ?auto_139774 ?auto_139779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139775 ?auto_139776 ?auto_139773 )
      ( MAKE-3CRATE-VERIFY ?auto_139774 ?auto_139775 ?auto_139776 ?auto_139773 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139802 - SURFACE
      ?auto_139803 - SURFACE
      ?auto_139804 - SURFACE
      ?auto_139801 - SURFACE
    )
    :vars
    (
      ?auto_139806 - HOIST
      ?auto_139810 - PLACE
      ?auto_139807 - PLACE
      ?auto_139808 - HOIST
      ?auto_139805 - SURFACE
      ?auto_139809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139806 ?auto_139810 ) ( IS-CRATE ?auto_139801 ) ( not ( = ?auto_139804 ?auto_139801 ) ) ( not ( = ?auto_139803 ?auto_139804 ) ) ( not ( = ?auto_139803 ?auto_139801 ) ) ( not ( = ?auto_139807 ?auto_139810 ) ) ( HOIST-AT ?auto_139808 ?auto_139807 ) ( not ( = ?auto_139806 ?auto_139808 ) ) ( AVAILABLE ?auto_139808 ) ( SURFACE-AT ?auto_139801 ?auto_139807 ) ( ON ?auto_139801 ?auto_139805 ) ( CLEAR ?auto_139801 ) ( not ( = ?auto_139804 ?auto_139805 ) ) ( not ( = ?auto_139801 ?auto_139805 ) ) ( not ( = ?auto_139803 ?auto_139805 ) ) ( SURFACE-AT ?auto_139803 ?auto_139810 ) ( CLEAR ?auto_139803 ) ( IS-CRATE ?auto_139804 ) ( AVAILABLE ?auto_139806 ) ( IN ?auto_139804 ?auto_139809 ) ( TRUCK-AT ?auto_139809 ?auto_139807 ) ( ON ?auto_139803 ?auto_139802 ) ( not ( = ?auto_139802 ?auto_139803 ) ) ( not ( = ?auto_139802 ?auto_139804 ) ) ( not ( = ?auto_139802 ?auto_139801 ) ) ( not ( = ?auto_139802 ?auto_139805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139803 ?auto_139804 ?auto_139801 )
      ( MAKE-3CRATE-VERIFY ?auto_139802 ?auto_139803 ?auto_139804 ?auto_139801 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139830 - SURFACE
      ?auto_139831 - SURFACE
      ?auto_139832 - SURFACE
      ?auto_139829 - SURFACE
    )
    :vars
    (
      ?auto_139836 - HOIST
      ?auto_139835 - PLACE
      ?auto_139837 - PLACE
      ?auto_139834 - HOIST
      ?auto_139833 - SURFACE
      ?auto_139838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139836 ?auto_139835 ) ( IS-CRATE ?auto_139829 ) ( not ( = ?auto_139832 ?auto_139829 ) ) ( not ( = ?auto_139831 ?auto_139832 ) ) ( not ( = ?auto_139831 ?auto_139829 ) ) ( not ( = ?auto_139837 ?auto_139835 ) ) ( HOIST-AT ?auto_139834 ?auto_139837 ) ( not ( = ?auto_139836 ?auto_139834 ) ) ( SURFACE-AT ?auto_139829 ?auto_139837 ) ( ON ?auto_139829 ?auto_139833 ) ( CLEAR ?auto_139829 ) ( not ( = ?auto_139832 ?auto_139833 ) ) ( not ( = ?auto_139829 ?auto_139833 ) ) ( not ( = ?auto_139831 ?auto_139833 ) ) ( SURFACE-AT ?auto_139831 ?auto_139835 ) ( CLEAR ?auto_139831 ) ( IS-CRATE ?auto_139832 ) ( AVAILABLE ?auto_139836 ) ( TRUCK-AT ?auto_139838 ?auto_139837 ) ( LIFTING ?auto_139834 ?auto_139832 ) ( ON ?auto_139831 ?auto_139830 ) ( not ( = ?auto_139830 ?auto_139831 ) ) ( not ( = ?auto_139830 ?auto_139832 ) ) ( not ( = ?auto_139830 ?auto_139829 ) ) ( not ( = ?auto_139830 ?auto_139833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139831 ?auto_139832 ?auto_139829 )
      ( MAKE-3CRATE-VERIFY ?auto_139830 ?auto_139831 ?auto_139832 ?auto_139829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139860 - SURFACE
      ?auto_139861 - SURFACE
      ?auto_139862 - SURFACE
      ?auto_139859 - SURFACE
    )
    :vars
    (
      ?auto_139869 - HOIST
      ?auto_139865 - PLACE
      ?auto_139866 - PLACE
      ?auto_139863 - HOIST
      ?auto_139864 - SURFACE
      ?auto_139867 - TRUCK
      ?auto_139868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139869 ?auto_139865 ) ( IS-CRATE ?auto_139859 ) ( not ( = ?auto_139862 ?auto_139859 ) ) ( not ( = ?auto_139861 ?auto_139862 ) ) ( not ( = ?auto_139861 ?auto_139859 ) ) ( not ( = ?auto_139866 ?auto_139865 ) ) ( HOIST-AT ?auto_139863 ?auto_139866 ) ( not ( = ?auto_139869 ?auto_139863 ) ) ( SURFACE-AT ?auto_139859 ?auto_139866 ) ( ON ?auto_139859 ?auto_139864 ) ( CLEAR ?auto_139859 ) ( not ( = ?auto_139862 ?auto_139864 ) ) ( not ( = ?auto_139859 ?auto_139864 ) ) ( not ( = ?auto_139861 ?auto_139864 ) ) ( SURFACE-AT ?auto_139861 ?auto_139865 ) ( CLEAR ?auto_139861 ) ( IS-CRATE ?auto_139862 ) ( AVAILABLE ?auto_139869 ) ( TRUCK-AT ?auto_139867 ?auto_139866 ) ( AVAILABLE ?auto_139863 ) ( SURFACE-AT ?auto_139862 ?auto_139866 ) ( ON ?auto_139862 ?auto_139868 ) ( CLEAR ?auto_139862 ) ( not ( = ?auto_139862 ?auto_139868 ) ) ( not ( = ?auto_139859 ?auto_139868 ) ) ( not ( = ?auto_139861 ?auto_139868 ) ) ( not ( = ?auto_139864 ?auto_139868 ) ) ( ON ?auto_139861 ?auto_139860 ) ( not ( = ?auto_139860 ?auto_139861 ) ) ( not ( = ?auto_139860 ?auto_139862 ) ) ( not ( = ?auto_139860 ?auto_139859 ) ) ( not ( = ?auto_139860 ?auto_139864 ) ) ( not ( = ?auto_139860 ?auto_139868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139861 ?auto_139862 ?auto_139859 )
      ( MAKE-3CRATE-VERIFY ?auto_139860 ?auto_139861 ?auto_139862 ?auto_139859 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139891 - SURFACE
      ?auto_139892 - SURFACE
      ?auto_139893 - SURFACE
      ?auto_139890 - SURFACE
    )
    :vars
    (
      ?auto_139900 - HOIST
      ?auto_139899 - PLACE
      ?auto_139898 - PLACE
      ?auto_139896 - HOIST
      ?auto_139895 - SURFACE
      ?auto_139894 - SURFACE
      ?auto_139897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139900 ?auto_139899 ) ( IS-CRATE ?auto_139890 ) ( not ( = ?auto_139893 ?auto_139890 ) ) ( not ( = ?auto_139892 ?auto_139893 ) ) ( not ( = ?auto_139892 ?auto_139890 ) ) ( not ( = ?auto_139898 ?auto_139899 ) ) ( HOIST-AT ?auto_139896 ?auto_139898 ) ( not ( = ?auto_139900 ?auto_139896 ) ) ( SURFACE-AT ?auto_139890 ?auto_139898 ) ( ON ?auto_139890 ?auto_139895 ) ( CLEAR ?auto_139890 ) ( not ( = ?auto_139893 ?auto_139895 ) ) ( not ( = ?auto_139890 ?auto_139895 ) ) ( not ( = ?auto_139892 ?auto_139895 ) ) ( SURFACE-AT ?auto_139892 ?auto_139899 ) ( CLEAR ?auto_139892 ) ( IS-CRATE ?auto_139893 ) ( AVAILABLE ?auto_139900 ) ( AVAILABLE ?auto_139896 ) ( SURFACE-AT ?auto_139893 ?auto_139898 ) ( ON ?auto_139893 ?auto_139894 ) ( CLEAR ?auto_139893 ) ( not ( = ?auto_139893 ?auto_139894 ) ) ( not ( = ?auto_139890 ?auto_139894 ) ) ( not ( = ?auto_139892 ?auto_139894 ) ) ( not ( = ?auto_139895 ?auto_139894 ) ) ( TRUCK-AT ?auto_139897 ?auto_139899 ) ( ON ?auto_139892 ?auto_139891 ) ( not ( = ?auto_139891 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139893 ) ) ( not ( = ?auto_139891 ?auto_139890 ) ) ( not ( = ?auto_139891 ?auto_139895 ) ) ( not ( = ?auto_139891 ?auto_139894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139892 ?auto_139893 ?auto_139890 )
      ( MAKE-3CRATE-VERIFY ?auto_139891 ?auto_139892 ?auto_139893 ?auto_139890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139901 - SURFACE
      ?auto_139902 - SURFACE
    )
    :vars
    (
      ?auto_139910 - HOIST
      ?auto_139909 - PLACE
      ?auto_139903 - SURFACE
      ?auto_139908 - PLACE
      ?auto_139906 - HOIST
      ?auto_139905 - SURFACE
      ?auto_139904 - SURFACE
      ?auto_139907 - TRUCK
      ?auto_139911 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139910 ?auto_139909 ) ( IS-CRATE ?auto_139902 ) ( not ( = ?auto_139901 ?auto_139902 ) ) ( not ( = ?auto_139903 ?auto_139901 ) ) ( not ( = ?auto_139903 ?auto_139902 ) ) ( not ( = ?auto_139908 ?auto_139909 ) ) ( HOIST-AT ?auto_139906 ?auto_139908 ) ( not ( = ?auto_139910 ?auto_139906 ) ) ( SURFACE-AT ?auto_139902 ?auto_139908 ) ( ON ?auto_139902 ?auto_139905 ) ( CLEAR ?auto_139902 ) ( not ( = ?auto_139901 ?auto_139905 ) ) ( not ( = ?auto_139902 ?auto_139905 ) ) ( not ( = ?auto_139903 ?auto_139905 ) ) ( IS-CRATE ?auto_139901 ) ( AVAILABLE ?auto_139906 ) ( SURFACE-AT ?auto_139901 ?auto_139908 ) ( ON ?auto_139901 ?auto_139904 ) ( CLEAR ?auto_139901 ) ( not ( = ?auto_139901 ?auto_139904 ) ) ( not ( = ?auto_139902 ?auto_139904 ) ) ( not ( = ?auto_139903 ?auto_139904 ) ) ( not ( = ?auto_139905 ?auto_139904 ) ) ( TRUCK-AT ?auto_139907 ?auto_139909 ) ( SURFACE-AT ?auto_139911 ?auto_139909 ) ( CLEAR ?auto_139911 ) ( LIFTING ?auto_139910 ?auto_139903 ) ( IS-CRATE ?auto_139903 ) ( not ( = ?auto_139911 ?auto_139903 ) ) ( not ( = ?auto_139901 ?auto_139911 ) ) ( not ( = ?auto_139902 ?auto_139911 ) ) ( not ( = ?auto_139905 ?auto_139911 ) ) ( not ( = ?auto_139904 ?auto_139911 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139911 ?auto_139903 )
      ( MAKE-2CRATE ?auto_139903 ?auto_139901 ?auto_139902 )
      ( MAKE-1CRATE-VERIFY ?auto_139901 ?auto_139902 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139912 - SURFACE
      ?auto_139913 - SURFACE
      ?auto_139914 - SURFACE
    )
    :vars
    (
      ?auto_139916 - HOIST
      ?auto_139915 - PLACE
      ?auto_139919 - PLACE
      ?auto_139920 - HOIST
      ?auto_139917 - SURFACE
      ?auto_139918 - SURFACE
      ?auto_139922 - TRUCK
      ?auto_139921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139916 ?auto_139915 ) ( IS-CRATE ?auto_139914 ) ( not ( = ?auto_139913 ?auto_139914 ) ) ( not ( = ?auto_139912 ?auto_139913 ) ) ( not ( = ?auto_139912 ?auto_139914 ) ) ( not ( = ?auto_139919 ?auto_139915 ) ) ( HOIST-AT ?auto_139920 ?auto_139919 ) ( not ( = ?auto_139916 ?auto_139920 ) ) ( SURFACE-AT ?auto_139914 ?auto_139919 ) ( ON ?auto_139914 ?auto_139917 ) ( CLEAR ?auto_139914 ) ( not ( = ?auto_139913 ?auto_139917 ) ) ( not ( = ?auto_139914 ?auto_139917 ) ) ( not ( = ?auto_139912 ?auto_139917 ) ) ( IS-CRATE ?auto_139913 ) ( AVAILABLE ?auto_139920 ) ( SURFACE-AT ?auto_139913 ?auto_139919 ) ( ON ?auto_139913 ?auto_139918 ) ( CLEAR ?auto_139913 ) ( not ( = ?auto_139913 ?auto_139918 ) ) ( not ( = ?auto_139914 ?auto_139918 ) ) ( not ( = ?auto_139912 ?auto_139918 ) ) ( not ( = ?auto_139917 ?auto_139918 ) ) ( TRUCK-AT ?auto_139922 ?auto_139915 ) ( SURFACE-AT ?auto_139921 ?auto_139915 ) ( CLEAR ?auto_139921 ) ( LIFTING ?auto_139916 ?auto_139912 ) ( IS-CRATE ?auto_139912 ) ( not ( = ?auto_139921 ?auto_139912 ) ) ( not ( = ?auto_139913 ?auto_139921 ) ) ( not ( = ?auto_139914 ?auto_139921 ) ) ( not ( = ?auto_139917 ?auto_139921 ) ) ( not ( = ?auto_139918 ?auto_139921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139913 ?auto_139914 )
      ( MAKE-2CRATE-VERIFY ?auto_139912 ?auto_139913 ?auto_139914 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139924 - SURFACE
      ?auto_139925 - SURFACE
      ?auto_139926 - SURFACE
      ?auto_139923 - SURFACE
    )
    :vars
    (
      ?auto_139928 - HOIST
      ?auto_139933 - PLACE
      ?auto_139927 - PLACE
      ?auto_139932 - HOIST
      ?auto_139930 - SURFACE
      ?auto_139931 - SURFACE
      ?auto_139929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139928 ?auto_139933 ) ( IS-CRATE ?auto_139923 ) ( not ( = ?auto_139926 ?auto_139923 ) ) ( not ( = ?auto_139925 ?auto_139926 ) ) ( not ( = ?auto_139925 ?auto_139923 ) ) ( not ( = ?auto_139927 ?auto_139933 ) ) ( HOIST-AT ?auto_139932 ?auto_139927 ) ( not ( = ?auto_139928 ?auto_139932 ) ) ( SURFACE-AT ?auto_139923 ?auto_139927 ) ( ON ?auto_139923 ?auto_139930 ) ( CLEAR ?auto_139923 ) ( not ( = ?auto_139926 ?auto_139930 ) ) ( not ( = ?auto_139923 ?auto_139930 ) ) ( not ( = ?auto_139925 ?auto_139930 ) ) ( IS-CRATE ?auto_139926 ) ( AVAILABLE ?auto_139932 ) ( SURFACE-AT ?auto_139926 ?auto_139927 ) ( ON ?auto_139926 ?auto_139931 ) ( CLEAR ?auto_139926 ) ( not ( = ?auto_139926 ?auto_139931 ) ) ( not ( = ?auto_139923 ?auto_139931 ) ) ( not ( = ?auto_139925 ?auto_139931 ) ) ( not ( = ?auto_139930 ?auto_139931 ) ) ( TRUCK-AT ?auto_139929 ?auto_139933 ) ( SURFACE-AT ?auto_139924 ?auto_139933 ) ( CLEAR ?auto_139924 ) ( LIFTING ?auto_139928 ?auto_139925 ) ( IS-CRATE ?auto_139925 ) ( not ( = ?auto_139924 ?auto_139925 ) ) ( not ( = ?auto_139926 ?auto_139924 ) ) ( not ( = ?auto_139923 ?auto_139924 ) ) ( not ( = ?auto_139930 ?auto_139924 ) ) ( not ( = ?auto_139931 ?auto_139924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139925 ?auto_139926 ?auto_139923 )
      ( MAKE-3CRATE-VERIFY ?auto_139924 ?auto_139925 ?auto_139926 ?auto_139923 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139982 - SURFACE
      ?auto_139983 - SURFACE
    )
    :vars
    (
      ?auto_139987 - HOIST
      ?auto_139989 - PLACE
      ?auto_139990 - SURFACE
      ?auto_139991 - PLACE
      ?auto_139986 - HOIST
      ?auto_139985 - SURFACE
      ?auto_139988 - TRUCK
      ?auto_139984 - SURFACE
      ?auto_139992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139987 ?auto_139989 ) ( IS-CRATE ?auto_139983 ) ( not ( = ?auto_139982 ?auto_139983 ) ) ( not ( = ?auto_139990 ?auto_139982 ) ) ( not ( = ?auto_139990 ?auto_139983 ) ) ( not ( = ?auto_139991 ?auto_139989 ) ) ( HOIST-AT ?auto_139986 ?auto_139991 ) ( not ( = ?auto_139987 ?auto_139986 ) ) ( SURFACE-AT ?auto_139983 ?auto_139991 ) ( ON ?auto_139983 ?auto_139985 ) ( CLEAR ?auto_139983 ) ( not ( = ?auto_139982 ?auto_139985 ) ) ( not ( = ?auto_139983 ?auto_139985 ) ) ( not ( = ?auto_139990 ?auto_139985 ) ) ( SURFACE-AT ?auto_139990 ?auto_139989 ) ( CLEAR ?auto_139990 ) ( IS-CRATE ?auto_139982 ) ( AVAILABLE ?auto_139987 ) ( TRUCK-AT ?auto_139988 ?auto_139991 ) ( SURFACE-AT ?auto_139982 ?auto_139991 ) ( ON ?auto_139982 ?auto_139984 ) ( CLEAR ?auto_139982 ) ( not ( = ?auto_139982 ?auto_139984 ) ) ( not ( = ?auto_139983 ?auto_139984 ) ) ( not ( = ?auto_139990 ?auto_139984 ) ) ( not ( = ?auto_139985 ?auto_139984 ) ) ( LIFTING ?auto_139986 ?auto_139992 ) ( IS-CRATE ?auto_139992 ) ( not ( = ?auto_139982 ?auto_139992 ) ) ( not ( = ?auto_139983 ?auto_139992 ) ) ( not ( = ?auto_139990 ?auto_139992 ) ) ( not ( = ?auto_139985 ?auto_139992 ) ) ( not ( = ?auto_139984 ?auto_139992 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139986 ?auto_139992 ?auto_139988 ?auto_139991 )
      ( MAKE-1CRATE ?auto_139982 ?auto_139983 )
      ( MAKE-1CRATE-VERIFY ?auto_139982 ?auto_139983 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140093 - SURFACE
      ?auto_140094 - SURFACE
      ?auto_140095 - SURFACE
      ?auto_140092 - SURFACE
      ?auto_140096 - SURFACE
    )
    :vars
    (
      ?auto_140097 - HOIST
      ?auto_140098 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140097 ?auto_140098 ) ( SURFACE-AT ?auto_140092 ?auto_140098 ) ( CLEAR ?auto_140092 ) ( LIFTING ?auto_140097 ?auto_140096 ) ( IS-CRATE ?auto_140096 ) ( not ( = ?auto_140092 ?auto_140096 ) ) ( ON ?auto_140094 ?auto_140093 ) ( ON ?auto_140095 ?auto_140094 ) ( ON ?auto_140092 ?auto_140095 ) ( not ( = ?auto_140093 ?auto_140094 ) ) ( not ( = ?auto_140093 ?auto_140095 ) ) ( not ( = ?auto_140093 ?auto_140092 ) ) ( not ( = ?auto_140093 ?auto_140096 ) ) ( not ( = ?auto_140094 ?auto_140095 ) ) ( not ( = ?auto_140094 ?auto_140092 ) ) ( not ( = ?auto_140094 ?auto_140096 ) ) ( not ( = ?auto_140095 ?auto_140092 ) ) ( not ( = ?auto_140095 ?auto_140096 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140092 ?auto_140096 )
      ( MAKE-4CRATE-VERIFY ?auto_140093 ?auto_140094 ?auto_140095 ?auto_140092 ?auto_140096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140118 - SURFACE
      ?auto_140119 - SURFACE
      ?auto_140120 - SURFACE
      ?auto_140117 - SURFACE
      ?auto_140121 - SURFACE
    )
    :vars
    (
      ?auto_140123 - HOIST
      ?auto_140124 - PLACE
      ?auto_140122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140123 ?auto_140124 ) ( SURFACE-AT ?auto_140117 ?auto_140124 ) ( CLEAR ?auto_140117 ) ( IS-CRATE ?auto_140121 ) ( not ( = ?auto_140117 ?auto_140121 ) ) ( TRUCK-AT ?auto_140122 ?auto_140124 ) ( AVAILABLE ?auto_140123 ) ( IN ?auto_140121 ?auto_140122 ) ( ON ?auto_140117 ?auto_140120 ) ( not ( = ?auto_140120 ?auto_140117 ) ) ( not ( = ?auto_140120 ?auto_140121 ) ) ( ON ?auto_140119 ?auto_140118 ) ( ON ?auto_140120 ?auto_140119 ) ( not ( = ?auto_140118 ?auto_140119 ) ) ( not ( = ?auto_140118 ?auto_140120 ) ) ( not ( = ?auto_140118 ?auto_140117 ) ) ( not ( = ?auto_140118 ?auto_140121 ) ) ( not ( = ?auto_140119 ?auto_140120 ) ) ( not ( = ?auto_140119 ?auto_140117 ) ) ( not ( = ?auto_140119 ?auto_140121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140120 ?auto_140117 ?auto_140121 )
      ( MAKE-4CRATE-VERIFY ?auto_140118 ?auto_140119 ?auto_140120 ?auto_140117 ?auto_140121 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140148 - SURFACE
      ?auto_140149 - SURFACE
      ?auto_140150 - SURFACE
      ?auto_140147 - SURFACE
      ?auto_140151 - SURFACE
    )
    :vars
    (
      ?auto_140152 - HOIST
      ?auto_140153 - PLACE
      ?auto_140155 - TRUCK
      ?auto_140154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140152 ?auto_140153 ) ( SURFACE-AT ?auto_140147 ?auto_140153 ) ( CLEAR ?auto_140147 ) ( IS-CRATE ?auto_140151 ) ( not ( = ?auto_140147 ?auto_140151 ) ) ( AVAILABLE ?auto_140152 ) ( IN ?auto_140151 ?auto_140155 ) ( ON ?auto_140147 ?auto_140150 ) ( not ( = ?auto_140150 ?auto_140147 ) ) ( not ( = ?auto_140150 ?auto_140151 ) ) ( TRUCK-AT ?auto_140155 ?auto_140154 ) ( not ( = ?auto_140154 ?auto_140153 ) ) ( ON ?auto_140149 ?auto_140148 ) ( ON ?auto_140150 ?auto_140149 ) ( not ( = ?auto_140148 ?auto_140149 ) ) ( not ( = ?auto_140148 ?auto_140150 ) ) ( not ( = ?auto_140148 ?auto_140147 ) ) ( not ( = ?auto_140148 ?auto_140151 ) ) ( not ( = ?auto_140149 ?auto_140150 ) ) ( not ( = ?auto_140149 ?auto_140147 ) ) ( not ( = ?auto_140149 ?auto_140151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140150 ?auto_140147 ?auto_140151 )
      ( MAKE-4CRATE-VERIFY ?auto_140148 ?auto_140149 ?auto_140150 ?auto_140147 ?auto_140151 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140182 - SURFACE
      ?auto_140183 - SURFACE
      ?auto_140184 - SURFACE
      ?auto_140181 - SURFACE
      ?auto_140185 - SURFACE
    )
    :vars
    (
      ?auto_140190 - HOIST
      ?auto_140188 - PLACE
      ?auto_140187 - TRUCK
      ?auto_140189 - PLACE
      ?auto_140186 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_140190 ?auto_140188 ) ( SURFACE-AT ?auto_140181 ?auto_140188 ) ( CLEAR ?auto_140181 ) ( IS-CRATE ?auto_140185 ) ( not ( = ?auto_140181 ?auto_140185 ) ) ( AVAILABLE ?auto_140190 ) ( ON ?auto_140181 ?auto_140184 ) ( not ( = ?auto_140184 ?auto_140181 ) ) ( not ( = ?auto_140184 ?auto_140185 ) ) ( TRUCK-AT ?auto_140187 ?auto_140189 ) ( not ( = ?auto_140189 ?auto_140188 ) ) ( HOIST-AT ?auto_140186 ?auto_140189 ) ( LIFTING ?auto_140186 ?auto_140185 ) ( not ( = ?auto_140190 ?auto_140186 ) ) ( ON ?auto_140183 ?auto_140182 ) ( ON ?auto_140184 ?auto_140183 ) ( not ( = ?auto_140182 ?auto_140183 ) ) ( not ( = ?auto_140182 ?auto_140184 ) ) ( not ( = ?auto_140182 ?auto_140181 ) ) ( not ( = ?auto_140182 ?auto_140185 ) ) ( not ( = ?auto_140183 ?auto_140184 ) ) ( not ( = ?auto_140183 ?auto_140181 ) ) ( not ( = ?auto_140183 ?auto_140185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140184 ?auto_140181 ?auto_140185 )
      ( MAKE-4CRATE-VERIFY ?auto_140182 ?auto_140183 ?auto_140184 ?auto_140181 ?auto_140185 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140220 - SURFACE
      ?auto_140221 - SURFACE
      ?auto_140222 - SURFACE
      ?auto_140219 - SURFACE
      ?auto_140223 - SURFACE
    )
    :vars
    (
      ?auto_140224 - HOIST
      ?auto_140229 - PLACE
      ?auto_140227 - TRUCK
      ?auto_140225 - PLACE
      ?auto_140226 - HOIST
      ?auto_140228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140224 ?auto_140229 ) ( SURFACE-AT ?auto_140219 ?auto_140229 ) ( CLEAR ?auto_140219 ) ( IS-CRATE ?auto_140223 ) ( not ( = ?auto_140219 ?auto_140223 ) ) ( AVAILABLE ?auto_140224 ) ( ON ?auto_140219 ?auto_140222 ) ( not ( = ?auto_140222 ?auto_140219 ) ) ( not ( = ?auto_140222 ?auto_140223 ) ) ( TRUCK-AT ?auto_140227 ?auto_140225 ) ( not ( = ?auto_140225 ?auto_140229 ) ) ( HOIST-AT ?auto_140226 ?auto_140225 ) ( not ( = ?auto_140224 ?auto_140226 ) ) ( AVAILABLE ?auto_140226 ) ( SURFACE-AT ?auto_140223 ?auto_140225 ) ( ON ?auto_140223 ?auto_140228 ) ( CLEAR ?auto_140223 ) ( not ( = ?auto_140219 ?auto_140228 ) ) ( not ( = ?auto_140223 ?auto_140228 ) ) ( not ( = ?auto_140222 ?auto_140228 ) ) ( ON ?auto_140221 ?auto_140220 ) ( ON ?auto_140222 ?auto_140221 ) ( not ( = ?auto_140220 ?auto_140221 ) ) ( not ( = ?auto_140220 ?auto_140222 ) ) ( not ( = ?auto_140220 ?auto_140219 ) ) ( not ( = ?auto_140220 ?auto_140223 ) ) ( not ( = ?auto_140220 ?auto_140228 ) ) ( not ( = ?auto_140221 ?auto_140222 ) ) ( not ( = ?auto_140221 ?auto_140219 ) ) ( not ( = ?auto_140221 ?auto_140223 ) ) ( not ( = ?auto_140221 ?auto_140228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140222 ?auto_140219 ?auto_140223 )
      ( MAKE-4CRATE-VERIFY ?auto_140220 ?auto_140221 ?auto_140222 ?auto_140219 ?auto_140223 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140259 - SURFACE
      ?auto_140260 - SURFACE
      ?auto_140261 - SURFACE
      ?auto_140258 - SURFACE
      ?auto_140262 - SURFACE
    )
    :vars
    (
      ?auto_140265 - HOIST
      ?auto_140266 - PLACE
      ?auto_140264 - PLACE
      ?auto_140263 - HOIST
      ?auto_140268 - SURFACE
      ?auto_140267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140265 ?auto_140266 ) ( SURFACE-AT ?auto_140258 ?auto_140266 ) ( CLEAR ?auto_140258 ) ( IS-CRATE ?auto_140262 ) ( not ( = ?auto_140258 ?auto_140262 ) ) ( AVAILABLE ?auto_140265 ) ( ON ?auto_140258 ?auto_140261 ) ( not ( = ?auto_140261 ?auto_140258 ) ) ( not ( = ?auto_140261 ?auto_140262 ) ) ( not ( = ?auto_140264 ?auto_140266 ) ) ( HOIST-AT ?auto_140263 ?auto_140264 ) ( not ( = ?auto_140265 ?auto_140263 ) ) ( AVAILABLE ?auto_140263 ) ( SURFACE-AT ?auto_140262 ?auto_140264 ) ( ON ?auto_140262 ?auto_140268 ) ( CLEAR ?auto_140262 ) ( not ( = ?auto_140258 ?auto_140268 ) ) ( not ( = ?auto_140262 ?auto_140268 ) ) ( not ( = ?auto_140261 ?auto_140268 ) ) ( TRUCK-AT ?auto_140267 ?auto_140266 ) ( ON ?auto_140260 ?auto_140259 ) ( ON ?auto_140261 ?auto_140260 ) ( not ( = ?auto_140259 ?auto_140260 ) ) ( not ( = ?auto_140259 ?auto_140261 ) ) ( not ( = ?auto_140259 ?auto_140258 ) ) ( not ( = ?auto_140259 ?auto_140262 ) ) ( not ( = ?auto_140259 ?auto_140268 ) ) ( not ( = ?auto_140260 ?auto_140261 ) ) ( not ( = ?auto_140260 ?auto_140258 ) ) ( not ( = ?auto_140260 ?auto_140262 ) ) ( not ( = ?auto_140260 ?auto_140268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140261 ?auto_140258 ?auto_140262 )
      ( MAKE-4CRATE-VERIFY ?auto_140259 ?auto_140260 ?auto_140261 ?auto_140258 ?auto_140262 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140298 - SURFACE
      ?auto_140299 - SURFACE
      ?auto_140300 - SURFACE
      ?auto_140297 - SURFACE
      ?auto_140301 - SURFACE
    )
    :vars
    (
      ?auto_140303 - HOIST
      ?auto_140304 - PLACE
      ?auto_140305 - PLACE
      ?auto_140307 - HOIST
      ?auto_140306 - SURFACE
      ?auto_140302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140303 ?auto_140304 ) ( IS-CRATE ?auto_140301 ) ( not ( = ?auto_140297 ?auto_140301 ) ) ( not ( = ?auto_140300 ?auto_140297 ) ) ( not ( = ?auto_140300 ?auto_140301 ) ) ( not ( = ?auto_140305 ?auto_140304 ) ) ( HOIST-AT ?auto_140307 ?auto_140305 ) ( not ( = ?auto_140303 ?auto_140307 ) ) ( AVAILABLE ?auto_140307 ) ( SURFACE-AT ?auto_140301 ?auto_140305 ) ( ON ?auto_140301 ?auto_140306 ) ( CLEAR ?auto_140301 ) ( not ( = ?auto_140297 ?auto_140306 ) ) ( not ( = ?auto_140301 ?auto_140306 ) ) ( not ( = ?auto_140300 ?auto_140306 ) ) ( TRUCK-AT ?auto_140302 ?auto_140304 ) ( SURFACE-AT ?auto_140300 ?auto_140304 ) ( CLEAR ?auto_140300 ) ( LIFTING ?auto_140303 ?auto_140297 ) ( IS-CRATE ?auto_140297 ) ( ON ?auto_140299 ?auto_140298 ) ( ON ?auto_140300 ?auto_140299 ) ( not ( = ?auto_140298 ?auto_140299 ) ) ( not ( = ?auto_140298 ?auto_140300 ) ) ( not ( = ?auto_140298 ?auto_140297 ) ) ( not ( = ?auto_140298 ?auto_140301 ) ) ( not ( = ?auto_140298 ?auto_140306 ) ) ( not ( = ?auto_140299 ?auto_140300 ) ) ( not ( = ?auto_140299 ?auto_140297 ) ) ( not ( = ?auto_140299 ?auto_140301 ) ) ( not ( = ?auto_140299 ?auto_140306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140300 ?auto_140297 ?auto_140301 )
      ( MAKE-4CRATE-VERIFY ?auto_140298 ?auto_140299 ?auto_140300 ?auto_140297 ?auto_140301 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140337 - SURFACE
      ?auto_140338 - SURFACE
      ?auto_140339 - SURFACE
      ?auto_140336 - SURFACE
      ?auto_140340 - SURFACE
    )
    :vars
    (
      ?auto_140344 - HOIST
      ?auto_140341 - PLACE
      ?auto_140342 - PLACE
      ?auto_140346 - HOIST
      ?auto_140343 - SURFACE
      ?auto_140345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140344 ?auto_140341 ) ( IS-CRATE ?auto_140340 ) ( not ( = ?auto_140336 ?auto_140340 ) ) ( not ( = ?auto_140339 ?auto_140336 ) ) ( not ( = ?auto_140339 ?auto_140340 ) ) ( not ( = ?auto_140342 ?auto_140341 ) ) ( HOIST-AT ?auto_140346 ?auto_140342 ) ( not ( = ?auto_140344 ?auto_140346 ) ) ( AVAILABLE ?auto_140346 ) ( SURFACE-AT ?auto_140340 ?auto_140342 ) ( ON ?auto_140340 ?auto_140343 ) ( CLEAR ?auto_140340 ) ( not ( = ?auto_140336 ?auto_140343 ) ) ( not ( = ?auto_140340 ?auto_140343 ) ) ( not ( = ?auto_140339 ?auto_140343 ) ) ( TRUCK-AT ?auto_140345 ?auto_140341 ) ( SURFACE-AT ?auto_140339 ?auto_140341 ) ( CLEAR ?auto_140339 ) ( IS-CRATE ?auto_140336 ) ( AVAILABLE ?auto_140344 ) ( IN ?auto_140336 ?auto_140345 ) ( ON ?auto_140338 ?auto_140337 ) ( ON ?auto_140339 ?auto_140338 ) ( not ( = ?auto_140337 ?auto_140338 ) ) ( not ( = ?auto_140337 ?auto_140339 ) ) ( not ( = ?auto_140337 ?auto_140336 ) ) ( not ( = ?auto_140337 ?auto_140340 ) ) ( not ( = ?auto_140337 ?auto_140343 ) ) ( not ( = ?auto_140338 ?auto_140339 ) ) ( not ( = ?auto_140338 ?auto_140336 ) ) ( not ( = ?auto_140338 ?auto_140340 ) ) ( not ( = ?auto_140338 ?auto_140343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140339 ?auto_140336 ?auto_140340 )
      ( MAKE-4CRATE-VERIFY ?auto_140337 ?auto_140338 ?auto_140339 ?auto_140336 ?auto_140340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140452 - SURFACE
      ?auto_140453 - SURFACE
    )
    :vars
    (
      ?auto_140460 - HOIST
      ?auto_140459 - PLACE
      ?auto_140457 - SURFACE
      ?auto_140454 - PLACE
      ?auto_140455 - HOIST
      ?auto_140458 - SURFACE
      ?auto_140456 - TRUCK
      ?auto_140461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140460 ?auto_140459 ) ( SURFACE-AT ?auto_140452 ?auto_140459 ) ( CLEAR ?auto_140452 ) ( IS-CRATE ?auto_140453 ) ( not ( = ?auto_140452 ?auto_140453 ) ) ( AVAILABLE ?auto_140460 ) ( ON ?auto_140452 ?auto_140457 ) ( not ( = ?auto_140457 ?auto_140452 ) ) ( not ( = ?auto_140457 ?auto_140453 ) ) ( not ( = ?auto_140454 ?auto_140459 ) ) ( HOIST-AT ?auto_140455 ?auto_140454 ) ( not ( = ?auto_140460 ?auto_140455 ) ) ( AVAILABLE ?auto_140455 ) ( SURFACE-AT ?auto_140453 ?auto_140454 ) ( ON ?auto_140453 ?auto_140458 ) ( CLEAR ?auto_140453 ) ( not ( = ?auto_140452 ?auto_140458 ) ) ( not ( = ?auto_140453 ?auto_140458 ) ) ( not ( = ?auto_140457 ?auto_140458 ) ) ( TRUCK-AT ?auto_140456 ?auto_140461 ) ( not ( = ?auto_140461 ?auto_140459 ) ) ( not ( = ?auto_140454 ?auto_140461 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_140456 ?auto_140461 ?auto_140459 )
      ( MAKE-1CRATE ?auto_140452 ?auto_140453 )
      ( MAKE-1CRATE-VERIFY ?auto_140452 ?auto_140453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140609 - SURFACE
      ?auto_140610 - SURFACE
    )
    :vars
    (
      ?auto_140615 - HOIST
      ?auto_140614 - PLACE
      ?auto_140617 - SURFACE
      ?auto_140611 - PLACE
      ?auto_140612 - HOIST
      ?auto_140616 - SURFACE
      ?auto_140613 - TRUCK
      ?auto_140618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140615 ?auto_140614 ) ( SURFACE-AT ?auto_140609 ?auto_140614 ) ( CLEAR ?auto_140609 ) ( IS-CRATE ?auto_140610 ) ( not ( = ?auto_140609 ?auto_140610 ) ) ( ON ?auto_140609 ?auto_140617 ) ( not ( = ?auto_140617 ?auto_140609 ) ) ( not ( = ?auto_140617 ?auto_140610 ) ) ( not ( = ?auto_140611 ?auto_140614 ) ) ( HOIST-AT ?auto_140612 ?auto_140611 ) ( not ( = ?auto_140615 ?auto_140612 ) ) ( AVAILABLE ?auto_140612 ) ( SURFACE-AT ?auto_140610 ?auto_140611 ) ( ON ?auto_140610 ?auto_140616 ) ( CLEAR ?auto_140610 ) ( not ( = ?auto_140609 ?auto_140616 ) ) ( not ( = ?auto_140610 ?auto_140616 ) ) ( not ( = ?auto_140617 ?auto_140616 ) ) ( TRUCK-AT ?auto_140613 ?auto_140614 ) ( LIFTING ?auto_140615 ?auto_140618 ) ( IS-CRATE ?auto_140618 ) ( not ( = ?auto_140609 ?auto_140618 ) ) ( not ( = ?auto_140610 ?auto_140618 ) ) ( not ( = ?auto_140617 ?auto_140618 ) ) ( not ( = ?auto_140616 ?auto_140618 ) ) )
    :subtasks
    ( ( !LOAD ?auto_140615 ?auto_140618 ?auto_140613 ?auto_140614 )
      ( MAKE-1CRATE ?auto_140609 ?auto_140610 )
      ( MAKE-1CRATE-VERIFY ?auto_140609 ?auto_140610 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_140988 - SURFACE
      ?auto_140989 - SURFACE
      ?auto_140990 - SURFACE
      ?auto_140987 - SURFACE
      ?auto_140991 - SURFACE
      ?auto_140992 - SURFACE
    )
    :vars
    (
      ?auto_140993 - HOIST
      ?auto_140994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140993 ?auto_140994 ) ( SURFACE-AT ?auto_140991 ?auto_140994 ) ( CLEAR ?auto_140991 ) ( LIFTING ?auto_140993 ?auto_140992 ) ( IS-CRATE ?auto_140992 ) ( not ( = ?auto_140991 ?auto_140992 ) ) ( ON ?auto_140989 ?auto_140988 ) ( ON ?auto_140990 ?auto_140989 ) ( ON ?auto_140987 ?auto_140990 ) ( ON ?auto_140991 ?auto_140987 ) ( not ( = ?auto_140988 ?auto_140989 ) ) ( not ( = ?auto_140988 ?auto_140990 ) ) ( not ( = ?auto_140988 ?auto_140987 ) ) ( not ( = ?auto_140988 ?auto_140991 ) ) ( not ( = ?auto_140988 ?auto_140992 ) ) ( not ( = ?auto_140989 ?auto_140990 ) ) ( not ( = ?auto_140989 ?auto_140987 ) ) ( not ( = ?auto_140989 ?auto_140991 ) ) ( not ( = ?auto_140989 ?auto_140992 ) ) ( not ( = ?auto_140990 ?auto_140987 ) ) ( not ( = ?auto_140990 ?auto_140991 ) ) ( not ( = ?auto_140990 ?auto_140992 ) ) ( not ( = ?auto_140987 ?auto_140991 ) ) ( not ( = ?auto_140987 ?auto_140992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140991 ?auto_140992 )
      ( MAKE-5CRATE-VERIFY ?auto_140988 ?auto_140989 ?auto_140990 ?auto_140987 ?auto_140991 ?auto_140992 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141022 - SURFACE
      ?auto_141023 - SURFACE
      ?auto_141024 - SURFACE
      ?auto_141021 - SURFACE
      ?auto_141025 - SURFACE
      ?auto_141026 - SURFACE
    )
    :vars
    (
      ?auto_141029 - HOIST
      ?auto_141027 - PLACE
      ?auto_141028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141029 ?auto_141027 ) ( SURFACE-AT ?auto_141025 ?auto_141027 ) ( CLEAR ?auto_141025 ) ( IS-CRATE ?auto_141026 ) ( not ( = ?auto_141025 ?auto_141026 ) ) ( TRUCK-AT ?auto_141028 ?auto_141027 ) ( AVAILABLE ?auto_141029 ) ( IN ?auto_141026 ?auto_141028 ) ( ON ?auto_141025 ?auto_141021 ) ( not ( = ?auto_141021 ?auto_141025 ) ) ( not ( = ?auto_141021 ?auto_141026 ) ) ( ON ?auto_141023 ?auto_141022 ) ( ON ?auto_141024 ?auto_141023 ) ( ON ?auto_141021 ?auto_141024 ) ( not ( = ?auto_141022 ?auto_141023 ) ) ( not ( = ?auto_141022 ?auto_141024 ) ) ( not ( = ?auto_141022 ?auto_141021 ) ) ( not ( = ?auto_141022 ?auto_141025 ) ) ( not ( = ?auto_141022 ?auto_141026 ) ) ( not ( = ?auto_141023 ?auto_141024 ) ) ( not ( = ?auto_141023 ?auto_141021 ) ) ( not ( = ?auto_141023 ?auto_141025 ) ) ( not ( = ?auto_141023 ?auto_141026 ) ) ( not ( = ?auto_141024 ?auto_141021 ) ) ( not ( = ?auto_141024 ?auto_141025 ) ) ( not ( = ?auto_141024 ?auto_141026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141021 ?auto_141025 ?auto_141026 )
      ( MAKE-5CRATE-VERIFY ?auto_141022 ?auto_141023 ?auto_141024 ?auto_141021 ?auto_141025 ?auto_141026 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141062 - SURFACE
      ?auto_141063 - SURFACE
      ?auto_141064 - SURFACE
      ?auto_141061 - SURFACE
      ?auto_141065 - SURFACE
      ?auto_141066 - SURFACE
    )
    :vars
    (
      ?auto_141069 - HOIST
      ?auto_141067 - PLACE
      ?auto_141070 - TRUCK
      ?auto_141068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141069 ?auto_141067 ) ( SURFACE-AT ?auto_141065 ?auto_141067 ) ( CLEAR ?auto_141065 ) ( IS-CRATE ?auto_141066 ) ( not ( = ?auto_141065 ?auto_141066 ) ) ( AVAILABLE ?auto_141069 ) ( IN ?auto_141066 ?auto_141070 ) ( ON ?auto_141065 ?auto_141061 ) ( not ( = ?auto_141061 ?auto_141065 ) ) ( not ( = ?auto_141061 ?auto_141066 ) ) ( TRUCK-AT ?auto_141070 ?auto_141068 ) ( not ( = ?auto_141068 ?auto_141067 ) ) ( ON ?auto_141063 ?auto_141062 ) ( ON ?auto_141064 ?auto_141063 ) ( ON ?auto_141061 ?auto_141064 ) ( not ( = ?auto_141062 ?auto_141063 ) ) ( not ( = ?auto_141062 ?auto_141064 ) ) ( not ( = ?auto_141062 ?auto_141061 ) ) ( not ( = ?auto_141062 ?auto_141065 ) ) ( not ( = ?auto_141062 ?auto_141066 ) ) ( not ( = ?auto_141063 ?auto_141064 ) ) ( not ( = ?auto_141063 ?auto_141061 ) ) ( not ( = ?auto_141063 ?auto_141065 ) ) ( not ( = ?auto_141063 ?auto_141066 ) ) ( not ( = ?auto_141064 ?auto_141061 ) ) ( not ( = ?auto_141064 ?auto_141065 ) ) ( not ( = ?auto_141064 ?auto_141066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141061 ?auto_141065 ?auto_141066 )
      ( MAKE-5CRATE-VERIFY ?auto_141062 ?auto_141063 ?auto_141064 ?auto_141061 ?auto_141065 ?auto_141066 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141107 - SURFACE
      ?auto_141108 - SURFACE
      ?auto_141109 - SURFACE
      ?auto_141106 - SURFACE
      ?auto_141110 - SURFACE
      ?auto_141111 - SURFACE
    )
    :vars
    (
      ?auto_141116 - HOIST
      ?auto_141115 - PLACE
      ?auto_141114 - TRUCK
      ?auto_141113 - PLACE
      ?auto_141112 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_141116 ?auto_141115 ) ( SURFACE-AT ?auto_141110 ?auto_141115 ) ( CLEAR ?auto_141110 ) ( IS-CRATE ?auto_141111 ) ( not ( = ?auto_141110 ?auto_141111 ) ) ( AVAILABLE ?auto_141116 ) ( ON ?auto_141110 ?auto_141106 ) ( not ( = ?auto_141106 ?auto_141110 ) ) ( not ( = ?auto_141106 ?auto_141111 ) ) ( TRUCK-AT ?auto_141114 ?auto_141113 ) ( not ( = ?auto_141113 ?auto_141115 ) ) ( HOIST-AT ?auto_141112 ?auto_141113 ) ( LIFTING ?auto_141112 ?auto_141111 ) ( not ( = ?auto_141116 ?auto_141112 ) ) ( ON ?auto_141108 ?auto_141107 ) ( ON ?auto_141109 ?auto_141108 ) ( ON ?auto_141106 ?auto_141109 ) ( not ( = ?auto_141107 ?auto_141108 ) ) ( not ( = ?auto_141107 ?auto_141109 ) ) ( not ( = ?auto_141107 ?auto_141106 ) ) ( not ( = ?auto_141107 ?auto_141110 ) ) ( not ( = ?auto_141107 ?auto_141111 ) ) ( not ( = ?auto_141108 ?auto_141109 ) ) ( not ( = ?auto_141108 ?auto_141106 ) ) ( not ( = ?auto_141108 ?auto_141110 ) ) ( not ( = ?auto_141108 ?auto_141111 ) ) ( not ( = ?auto_141109 ?auto_141106 ) ) ( not ( = ?auto_141109 ?auto_141110 ) ) ( not ( = ?auto_141109 ?auto_141111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141106 ?auto_141110 ?auto_141111 )
      ( MAKE-5CRATE-VERIFY ?auto_141107 ?auto_141108 ?auto_141109 ?auto_141106 ?auto_141110 ?auto_141111 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141157 - SURFACE
      ?auto_141158 - SURFACE
      ?auto_141159 - SURFACE
      ?auto_141156 - SURFACE
      ?auto_141160 - SURFACE
      ?auto_141161 - SURFACE
    )
    :vars
    (
      ?auto_141162 - HOIST
      ?auto_141166 - PLACE
      ?auto_141163 - TRUCK
      ?auto_141165 - PLACE
      ?auto_141164 - HOIST
      ?auto_141167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141162 ?auto_141166 ) ( SURFACE-AT ?auto_141160 ?auto_141166 ) ( CLEAR ?auto_141160 ) ( IS-CRATE ?auto_141161 ) ( not ( = ?auto_141160 ?auto_141161 ) ) ( AVAILABLE ?auto_141162 ) ( ON ?auto_141160 ?auto_141156 ) ( not ( = ?auto_141156 ?auto_141160 ) ) ( not ( = ?auto_141156 ?auto_141161 ) ) ( TRUCK-AT ?auto_141163 ?auto_141165 ) ( not ( = ?auto_141165 ?auto_141166 ) ) ( HOIST-AT ?auto_141164 ?auto_141165 ) ( not ( = ?auto_141162 ?auto_141164 ) ) ( AVAILABLE ?auto_141164 ) ( SURFACE-AT ?auto_141161 ?auto_141165 ) ( ON ?auto_141161 ?auto_141167 ) ( CLEAR ?auto_141161 ) ( not ( = ?auto_141160 ?auto_141167 ) ) ( not ( = ?auto_141161 ?auto_141167 ) ) ( not ( = ?auto_141156 ?auto_141167 ) ) ( ON ?auto_141158 ?auto_141157 ) ( ON ?auto_141159 ?auto_141158 ) ( ON ?auto_141156 ?auto_141159 ) ( not ( = ?auto_141157 ?auto_141158 ) ) ( not ( = ?auto_141157 ?auto_141159 ) ) ( not ( = ?auto_141157 ?auto_141156 ) ) ( not ( = ?auto_141157 ?auto_141160 ) ) ( not ( = ?auto_141157 ?auto_141161 ) ) ( not ( = ?auto_141157 ?auto_141167 ) ) ( not ( = ?auto_141158 ?auto_141159 ) ) ( not ( = ?auto_141158 ?auto_141156 ) ) ( not ( = ?auto_141158 ?auto_141160 ) ) ( not ( = ?auto_141158 ?auto_141161 ) ) ( not ( = ?auto_141158 ?auto_141167 ) ) ( not ( = ?auto_141159 ?auto_141156 ) ) ( not ( = ?auto_141159 ?auto_141160 ) ) ( not ( = ?auto_141159 ?auto_141161 ) ) ( not ( = ?auto_141159 ?auto_141167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141156 ?auto_141160 ?auto_141161 )
      ( MAKE-5CRATE-VERIFY ?auto_141157 ?auto_141158 ?auto_141159 ?auto_141156 ?auto_141160 ?auto_141161 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141208 - SURFACE
      ?auto_141209 - SURFACE
      ?auto_141210 - SURFACE
      ?auto_141207 - SURFACE
      ?auto_141211 - SURFACE
      ?auto_141212 - SURFACE
    )
    :vars
    (
      ?auto_141215 - HOIST
      ?auto_141213 - PLACE
      ?auto_141216 - PLACE
      ?auto_141214 - HOIST
      ?auto_141217 - SURFACE
      ?auto_141218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141215 ?auto_141213 ) ( SURFACE-AT ?auto_141211 ?auto_141213 ) ( CLEAR ?auto_141211 ) ( IS-CRATE ?auto_141212 ) ( not ( = ?auto_141211 ?auto_141212 ) ) ( AVAILABLE ?auto_141215 ) ( ON ?auto_141211 ?auto_141207 ) ( not ( = ?auto_141207 ?auto_141211 ) ) ( not ( = ?auto_141207 ?auto_141212 ) ) ( not ( = ?auto_141216 ?auto_141213 ) ) ( HOIST-AT ?auto_141214 ?auto_141216 ) ( not ( = ?auto_141215 ?auto_141214 ) ) ( AVAILABLE ?auto_141214 ) ( SURFACE-AT ?auto_141212 ?auto_141216 ) ( ON ?auto_141212 ?auto_141217 ) ( CLEAR ?auto_141212 ) ( not ( = ?auto_141211 ?auto_141217 ) ) ( not ( = ?auto_141212 ?auto_141217 ) ) ( not ( = ?auto_141207 ?auto_141217 ) ) ( TRUCK-AT ?auto_141218 ?auto_141213 ) ( ON ?auto_141209 ?auto_141208 ) ( ON ?auto_141210 ?auto_141209 ) ( ON ?auto_141207 ?auto_141210 ) ( not ( = ?auto_141208 ?auto_141209 ) ) ( not ( = ?auto_141208 ?auto_141210 ) ) ( not ( = ?auto_141208 ?auto_141207 ) ) ( not ( = ?auto_141208 ?auto_141211 ) ) ( not ( = ?auto_141208 ?auto_141212 ) ) ( not ( = ?auto_141208 ?auto_141217 ) ) ( not ( = ?auto_141209 ?auto_141210 ) ) ( not ( = ?auto_141209 ?auto_141207 ) ) ( not ( = ?auto_141209 ?auto_141211 ) ) ( not ( = ?auto_141209 ?auto_141212 ) ) ( not ( = ?auto_141209 ?auto_141217 ) ) ( not ( = ?auto_141210 ?auto_141207 ) ) ( not ( = ?auto_141210 ?auto_141211 ) ) ( not ( = ?auto_141210 ?auto_141212 ) ) ( not ( = ?auto_141210 ?auto_141217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141207 ?auto_141211 ?auto_141212 )
      ( MAKE-5CRATE-VERIFY ?auto_141208 ?auto_141209 ?auto_141210 ?auto_141207 ?auto_141211 ?auto_141212 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141259 - SURFACE
      ?auto_141260 - SURFACE
      ?auto_141261 - SURFACE
      ?auto_141258 - SURFACE
      ?auto_141262 - SURFACE
      ?auto_141263 - SURFACE
    )
    :vars
    (
      ?auto_141267 - HOIST
      ?auto_141264 - PLACE
      ?auto_141268 - PLACE
      ?auto_141266 - HOIST
      ?auto_141265 - SURFACE
      ?auto_141269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141267 ?auto_141264 ) ( IS-CRATE ?auto_141263 ) ( not ( = ?auto_141262 ?auto_141263 ) ) ( not ( = ?auto_141258 ?auto_141262 ) ) ( not ( = ?auto_141258 ?auto_141263 ) ) ( not ( = ?auto_141268 ?auto_141264 ) ) ( HOIST-AT ?auto_141266 ?auto_141268 ) ( not ( = ?auto_141267 ?auto_141266 ) ) ( AVAILABLE ?auto_141266 ) ( SURFACE-AT ?auto_141263 ?auto_141268 ) ( ON ?auto_141263 ?auto_141265 ) ( CLEAR ?auto_141263 ) ( not ( = ?auto_141262 ?auto_141265 ) ) ( not ( = ?auto_141263 ?auto_141265 ) ) ( not ( = ?auto_141258 ?auto_141265 ) ) ( TRUCK-AT ?auto_141269 ?auto_141264 ) ( SURFACE-AT ?auto_141258 ?auto_141264 ) ( CLEAR ?auto_141258 ) ( LIFTING ?auto_141267 ?auto_141262 ) ( IS-CRATE ?auto_141262 ) ( ON ?auto_141260 ?auto_141259 ) ( ON ?auto_141261 ?auto_141260 ) ( ON ?auto_141258 ?auto_141261 ) ( not ( = ?auto_141259 ?auto_141260 ) ) ( not ( = ?auto_141259 ?auto_141261 ) ) ( not ( = ?auto_141259 ?auto_141258 ) ) ( not ( = ?auto_141259 ?auto_141262 ) ) ( not ( = ?auto_141259 ?auto_141263 ) ) ( not ( = ?auto_141259 ?auto_141265 ) ) ( not ( = ?auto_141260 ?auto_141261 ) ) ( not ( = ?auto_141260 ?auto_141258 ) ) ( not ( = ?auto_141260 ?auto_141262 ) ) ( not ( = ?auto_141260 ?auto_141263 ) ) ( not ( = ?auto_141260 ?auto_141265 ) ) ( not ( = ?auto_141261 ?auto_141258 ) ) ( not ( = ?auto_141261 ?auto_141262 ) ) ( not ( = ?auto_141261 ?auto_141263 ) ) ( not ( = ?auto_141261 ?auto_141265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141258 ?auto_141262 ?auto_141263 )
      ( MAKE-5CRATE-VERIFY ?auto_141259 ?auto_141260 ?auto_141261 ?auto_141258 ?auto_141262 ?auto_141263 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141310 - SURFACE
      ?auto_141311 - SURFACE
      ?auto_141312 - SURFACE
      ?auto_141309 - SURFACE
      ?auto_141313 - SURFACE
      ?auto_141314 - SURFACE
    )
    :vars
    (
      ?auto_141318 - HOIST
      ?auto_141315 - PLACE
      ?auto_141320 - PLACE
      ?auto_141316 - HOIST
      ?auto_141317 - SURFACE
      ?auto_141319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141318 ?auto_141315 ) ( IS-CRATE ?auto_141314 ) ( not ( = ?auto_141313 ?auto_141314 ) ) ( not ( = ?auto_141309 ?auto_141313 ) ) ( not ( = ?auto_141309 ?auto_141314 ) ) ( not ( = ?auto_141320 ?auto_141315 ) ) ( HOIST-AT ?auto_141316 ?auto_141320 ) ( not ( = ?auto_141318 ?auto_141316 ) ) ( AVAILABLE ?auto_141316 ) ( SURFACE-AT ?auto_141314 ?auto_141320 ) ( ON ?auto_141314 ?auto_141317 ) ( CLEAR ?auto_141314 ) ( not ( = ?auto_141313 ?auto_141317 ) ) ( not ( = ?auto_141314 ?auto_141317 ) ) ( not ( = ?auto_141309 ?auto_141317 ) ) ( TRUCK-AT ?auto_141319 ?auto_141315 ) ( SURFACE-AT ?auto_141309 ?auto_141315 ) ( CLEAR ?auto_141309 ) ( IS-CRATE ?auto_141313 ) ( AVAILABLE ?auto_141318 ) ( IN ?auto_141313 ?auto_141319 ) ( ON ?auto_141311 ?auto_141310 ) ( ON ?auto_141312 ?auto_141311 ) ( ON ?auto_141309 ?auto_141312 ) ( not ( = ?auto_141310 ?auto_141311 ) ) ( not ( = ?auto_141310 ?auto_141312 ) ) ( not ( = ?auto_141310 ?auto_141309 ) ) ( not ( = ?auto_141310 ?auto_141313 ) ) ( not ( = ?auto_141310 ?auto_141314 ) ) ( not ( = ?auto_141310 ?auto_141317 ) ) ( not ( = ?auto_141311 ?auto_141312 ) ) ( not ( = ?auto_141311 ?auto_141309 ) ) ( not ( = ?auto_141311 ?auto_141313 ) ) ( not ( = ?auto_141311 ?auto_141314 ) ) ( not ( = ?auto_141311 ?auto_141317 ) ) ( not ( = ?auto_141312 ?auto_141309 ) ) ( not ( = ?auto_141312 ?auto_141313 ) ) ( not ( = ?auto_141312 ?auto_141314 ) ) ( not ( = ?auto_141312 ?auto_141317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141309 ?auto_141313 ?auto_141314 )
      ( MAKE-5CRATE-VERIFY ?auto_141310 ?auto_141311 ?auto_141312 ?auto_141309 ?auto_141313 ?auto_141314 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142519 - SURFACE
      ?auto_142520 - SURFACE
      ?auto_142521 - SURFACE
      ?auto_142518 - SURFACE
      ?auto_142522 - SURFACE
      ?auto_142524 - SURFACE
      ?auto_142523 - SURFACE
    )
    :vars
    (
      ?auto_142526 - HOIST
      ?auto_142525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142526 ?auto_142525 ) ( SURFACE-AT ?auto_142524 ?auto_142525 ) ( CLEAR ?auto_142524 ) ( LIFTING ?auto_142526 ?auto_142523 ) ( IS-CRATE ?auto_142523 ) ( not ( = ?auto_142524 ?auto_142523 ) ) ( ON ?auto_142520 ?auto_142519 ) ( ON ?auto_142521 ?auto_142520 ) ( ON ?auto_142518 ?auto_142521 ) ( ON ?auto_142522 ?auto_142518 ) ( ON ?auto_142524 ?auto_142522 ) ( not ( = ?auto_142519 ?auto_142520 ) ) ( not ( = ?auto_142519 ?auto_142521 ) ) ( not ( = ?auto_142519 ?auto_142518 ) ) ( not ( = ?auto_142519 ?auto_142522 ) ) ( not ( = ?auto_142519 ?auto_142524 ) ) ( not ( = ?auto_142519 ?auto_142523 ) ) ( not ( = ?auto_142520 ?auto_142521 ) ) ( not ( = ?auto_142520 ?auto_142518 ) ) ( not ( = ?auto_142520 ?auto_142522 ) ) ( not ( = ?auto_142520 ?auto_142524 ) ) ( not ( = ?auto_142520 ?auto_142523 ) ) ( not ( = ?auto_142521 ?auto_142518 ) ) ( not ( = ?auto_142521 ?auto_142522 ) ) ( not ( = ?auto_142521 ?auto_142524 ) ) ( not ( = ?auto_142521 ?auto_142523 ) ) ( not ( = ?auto_142518 ?auto_142522 ) ) ( not ( = ?auto_142518 ?auto_142524 ) ) ( not ( = ?auto_142518 ?auto_142523 ) ) ( not ( = ?auto_142522 ?auto_142524 ) ) ( not ( = ?auto_142522 ?auto_142523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_142524 ?auto_142523 )
      ( MAKE-6CRATE-VERIFY ?auto_142519 ?auto_142520 ?auto_142521 ?auto_142518 ?auto_142522 ?auto_142524 ?auto_142523 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142563 - SURFACE
      ?auto_142564 - SURFACE
      ?auto_142565 - SURFACE
      ?auto_142562 - SURFACE
      ?auto_142566 - SURFACE
      ?auto_142568 - SURFACE
      ?auto_142567 - SURFACE
    )
    :vars
    (
      ?auto_142570 - HOIST
      ?auto_142571 - PLACE
      ?auto_142569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142570 ?auto_142571 ) ( SURFACE-AT ?auto_142568 ?auto_142571 ) ( CLEAR ?auto_142568 ) ( IS-CRATE ?auto_142567 ) ( not ( = ?auto_142568 ?auto_142567 ) ) ( TRUCK-AT ?auto_142569 ?auto_142571 ) ( AVAILABLE ?auto_142570 ) ( IN ?auto_142567 ?auto_142569 ) ( ON ?auto_142568 ?auto_142566 ) ( not ( = ?auto_142566 ?auto_142568 ) ) ( not ( = ?auto_142566 ?auto_142567 ) ) ( ON ?auto_142564 ?auto_142563 ) ( ON ?auto_142565 ?auto_142564 ) ( ON ?auto_142562 ?auto_142565 ) ( ON ?auto_142566 ?auto_142562 ) ( not ( = ?auto_142563 ?auto_142564 ) ) ( not ( = ?auto_142563 ?auto_142565 ) ) ( not ( = ?auto_142563 ?auto_142562 ) ) ( not ( = ?auto_142563 ?auto_142566 ) ) ( not ( = ?auto_142563 ?auto_142568 ) ) ( not ( = ?auto_142563 ?auto_142567 ) ) ( not ( = ?auto_142564 ?auto_142565 ) ) ( not ( = ?auto_142564 ?auto_142562 ) ) ( not ( = ?auto_142564 ?auto_142566 ) ) ( not ( = ?auto_142564 ?auto_142568 ) ) ( not ( = ?auto_142564 ?auto_142567 ) ) ( not ( = ?auto_142565 ?auto_142562 ) ) ( not ( = ?auto_142565 ?auto_142566 ) ) ( not ( = ?auto_142565 ?auto_142568 ) ) ( not ( = ?auto_142565 ?auto_142567 ) ) ( not ( = ?auto_142562 ?auto_142566 ) ) ( not ( = ?auto_142562 ?auto_142568 ) ) ( not ( = ?auto_142562 ?auto_142567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142566 ?auto_142568 ?auto_142567 )
      ( MAKE-6CRATE-VERIFY ?auto_142563 ?auto_142564 ?auto_142565 ?auto_142562 ?auto_142566 ?auto_142568 ?auto_142567 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142614 - SURFACE
      ?auto_142615 - SURFACE
      ?auto_142616 - SURFACE
      ?auto_142613 - SURFACE
      ?auto_142617 - SURFACE
      ?auto_142619 - SURFACE
      ?auto_142618 - SURFACE
    )
    :vars
    (
      ?auto_142622 - HOIST
      ?auto_142620 - PLACE
      ?auto_142623 - TRUCK
      ?auto_142621 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142622 ?auto_142620 ) ( SURFACE-AT ?auto_142619 ?auto_142620 ) ( CLEAR ?auto_142619 ) ( IS-CRATE ?auto_142618 ) ( not ( = ?auto_142619 ?auto_142618 ) ) ( AVAILABLE ?auto_142622 ) ( IN ?auto_142618 ?auto_142623 ) ( ON ?auto_142619 ?auto_142617 ) ( not ( = ?auto_142617 ?auto_142619 ) ) ( not ( = ?auto_142617 ?auto_142618 ) ) ( TRUCK-AT ?auto_142623 ?auto_142621 ) ( not ( = ?auto_142621 ?auto_142620 ) ) ( ON ?auto_142615 ?auto_142614 ) ( ON ?auto_142616 ?auto_142615 ) ( ON ?auto_142613 ?auto_142616 ) ( ON ?auto_142617 ?auto_142613 ) ( not ( = ?auto_142614 ?auto_142615 ) ) ( not ( = ?auto_142614 ?auto_142616 ) ) ( not ( = ?auto_142614 ?auto_142613 ) ) ( not ( = ?auto_142614 ?auto_142617 ) ) ( not ( = ?auto_142614 ?auto_142619 ) ) ( not ( = ?auto_142614 ?auto_142618 ) ) ( not ( = ?auto_142615 ?auto_142616 ) ) ( not ( = ?auto_142615 ?auto_142613 ) ) ( not ( = ?auto_142615 ?auto_142617 ) ) ( not ( = ?auto_142615 ?auto_142619 ) ) ( not ( = ?auto_142615 ?auto_142618 ) ) ( not ( = ?auto_142616 ?auto_142613 ) ) ( not ( = ?auto_142616 ?auto_142617 ) ) ( not ( = ?auto_142616 ?auto_142619 ) ) ( not ( = ?auto_142616 ?auto_142618 ) ) ( not ( = ?auto_142613 ?auto_142617 ) ) ( not ( = ?auto_142613 ?auto_142619 ) ) ( not ( = ?auto_142613 ?auto_142618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142617 ?auto_142619 ?auto_142618 )
      ( MAKE-6CRATE-VERIFY ?auto_142614 ?auto_142615 ?auto_142616 ?auto_142613 ?auto_142617 ?auto_142619 ?auto_142618 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142671 - SURFACE
      ?auto_142672 - SURFACE
      ?auto_142673 - SURFACE
      ?auto_142670 - SURFACE
      ?auto_142674 - SURFACE
      ?auto_142676 - SURFACE
      ?auto_142675 - SURFACE
    )
    :vars
    (
      ?auto_142677 - HOIST
      ?auto_142681 - PLACE
      ?auto_142680 - TRUCK
      ?auto_142678 - PLACE
      ?auto_142679 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_142677 ?auto_142681 ) ( SURFACE-AT ?auto_142676 ?auto_142681 ) ( CLEAR ?auto_142676 ) ( IS-CRATE ?auto_142675 ) ( not ( = ?auto_142676 ?auto_142675 ) ) ( AVAILABLE ?auto_142677 ) ( ON ?auto_142676 ?auto_142674 ) ( not ( = ?auto_142674 ?auto_142676 ) ) ( not ( = ?auto_142674 ?auto_142675 ) ) ( TRUCK-AT ?auto_142680 ?auto_142678 ) ( not ( = ?auto_142678 ?auto_142681 ) ) ( HOIST-AT ?auto_142679 ?auto_142678 ) ( LIFTING ?auto_142679 ?auto_142675 ) ( not ( = ?auto_142677 ?auto_142679 ) ) ( ON ?auto_142672 ?auto_142671 ) ( ON ?auto_142673 ?auto_142672 ) ( ON ?auto_142670 ?auto_142673 ) ( ON ?auto_142674 ?auto_142670 ) ( not ( = ?auto_142671 ?auto_142672 ) ) ( not ( = ?auto_142671 ?auto_142673 ) ) ( not ( = ?auto_142671 ?auto_142670 ) ) ( not ( = ?auto_142671 ?auto_142674 ) ) ( not ( = ?auto_142671 ?auto_142676 ) ) ( not ( = ?auto_142671 ?auto_142675 ) ) ( not ( = ?auto_142672 ?auto_142673 ) ) ( not ( = ?auto_142672 ?auto_142670 ) ) ( not ( = ?auto_142672 ?auto_142674 ) ) ( not ( = ?auto_142672 ?auto_142676 ) ) ( not ( = ?auto_142672 ?auto_142675 ) ) ( not ( = ?auto_142673 ?auto_142670 ) ) ( not ( = ?auto_142673 ?auto_142674 ) ) ( not ( = ?auto_142673 ?auto_142676 ) ) ( not ( = ?auto_142673 ?auto_142675 ) ) ( not ( = ?auto_142670 ?auto_142674 ) ) ( not ( = ?auto_142670 ?auto_142676 ) ) ( not ( = ?auto_142670 ?auto_142675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142674 ?auto_142676 ?auto_142675 )
      ( MAKE-6CRATE-VERIFY ?auto_142671 ?auto_142672 ?auto_142673 ?auto_142670 ?auto_142674 ?auto_142676 ?auto_142675 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142734 - SURFACE
      ?auto_142735 - SURFACE
      ?auto_142736 - SURFACE
      ?auto_142733 - SURFACE
      ?auto_142737 - SURFACE
      ?auto_142739 - SURFACE
      ?auto_142738 - SURFACE
    )
    :vars
    (
      ?auto_142743 - HOIST
      ?auto_142740 - PLACE
      ?auto_142741 - TRUCK
      ?auto_142744 - PLACE
      ?auto_142742 - HOIST
      ?auto_142745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142743 ?auto_142740 ) ( SURFACE-AT ?auto_142739 ?auto_142740 ) ( CLEAR ?auto_142739 ) ( IS-CRATE ?auto_142738 ) ( not ( = ?auto_142739 ?auto_142738 ) ) ( AVAILABLE ?auto_142743 ) ( ON ?auto_142739 ?auto_142737 ) ( not ( = ?auto_142737 ?auto_142739 ) ) ( not ( = ?auto_142737 ?auto_142738 ) ) ( TRUCK-AT ?auto_142741 ?auto_142744 ) ( not ( = ?auto_142744 ?auto_142740 ) ) ( HOIST-AT ?auto_142742 ?auto_142744 ) ( not ( = ?auto_142743 ?auto_142742 ) ) ( AVAILABLE ?auto_142742 ) ( SURFACE-AT ?auto_142738 ?auto_142744 ) ( ON ?auto_142738 ?auto_142745 ) ( CLEAR ?auto_142738 ) ( not ( = ?auto_142739 ?auto_142745 ) ) ( not ( = ?auto_142738 ?auto_142745 ) ) ( not ( = ?auto_142737 ?auto_142745 ) ) ( ON ?auto_142735 ?auto_142734 ) ( ON ?auto_142736 ?auto_142735 ) ( ON ?auto_142733 ?auto_142736 ) ( ON ?auto_142737 ?auto_142733 ) ( not ( = ?auto_142734 ?auto_142735 ) ) ( not ( = ?auto_142734 ?auto_142736 ) ) ( not ( = ?auto_142734 ?auto_142733 ) ) ( not ( = ?auto_142734 ?auto_142737 ) ) ( not ( = ?auto_142734 ?auto_142739 ) ) ( not ( = ?auto_142734 ?auto_142738 ) ) ( not ( = ?auto_142734 ?auto_142745 ) ) ( not ( = ?auto_142735 ?auto_142736 ) ) ( not ( = ?auto_142735 ?auto_142733 ) ) ( not ( = ?auto_142735 ?auto_142737 ) ) ( not ( = ?auto_142735 ?auto_142739 ) ) ( not ( = ?auto_142735 ?auto_142738 ) ) ( not ( = ?auto_142735 ?auto_142745 ) ) ( not ( = ?auto_142736 ?auto_142733 ) ) ( not ( = ?auto_142736 ?auto_142737 ) ) ( not ( = ?auto_142736 ?auto_142739 ) ) ( not ( = ?auto_142736 ?auto_142738 ) ) ( not ( = ?auto_142736 ?auto_142745 ) ) ( not ( = ?auto_142733 ?auto_142737 ) ) ( not ( = ?auto_142733 ?auto_142739 ) ) ( not ( = ?auto_142733 ?auto_142738 ) ) ( not ( = ?auto_142733 ?auto_142745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142737 ?auto_142739 ?auto_142738 )
      ( MAKE-6CRATE-VERIFY ?auto_142734 ?auto_142735 ?auto_142736 ?auto_142733 ?auto_142737 ?auto_142739 ?auto_142738 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142798 - SURFACE
      ?auto_142799 - SURFACE
      ?auto_142800 - SURFACE
      ?auto_142797 - SURFACE
      ?auto_142801 - SURFACE
      ?auto_142803 - SURFACE
      ?auto_142802 - SURFACE
    )
    :vars
    (
      ?auto_142807 - HOIST
      ?auto_142805 - PLACE
      ?auto_142808 - PLACE
      ?auto_142804 - HOIST
      ?auto_142806 - SURFACE
      ?auto_142809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142807 ?auto_142805 ) ( SURFACE-AT ?auto_142803 ?auto_142805 ) ( CLEAR ?auto_142803 ) ( IS-CRATE ?auto_142802 ) ( not ( = ?auto_142803 ?auto_142802 ) ) ( AVAILABLE ?auto_142807 ) ( ON ?auto_142803 ?auto_142801 ) ( not ( = ?auto_142801 ?auto_142803 ) ) ( not ( = ?auto_142801 ?auto_142802 ) ) ( not ( = ?auto_142808 ?auto_142805 ) ) ( HOIST-AT ?auto_142804 ?auto_142808 ) ( not ( = ?auto_142807 ?auto_142804 ) ) ( AVAILABLE ?auto_142804 ) ( SURFACE-AT ?auto_142802 ?auto_142808 ) ( ON ?auto_142802 ?auto_142806 ) ( CLEAR ?auto_142802 ) ( not ( = ?auto_142803 ?auto_142806 ) ) ( not ( = ?auto_142802 ?auto_142806 ) ) ( not ( = ?auto_142801 ?auto_142806 ) ) ( TRUCK-AT ?auto_142809 ?auto_142805 ) ( ON ?auto_142799 ?auto_142798 ) ( ON ?auto_142800 ?auto_142799 ) ( ON ?auto_142797 ?auto_142800 ) ( ON ?auto_142801 ?auto_142797 ) ( not ( = ?auto_142798 ?auto_142799 ) ) ( not ( = ?auto_142798 ?auto_142800 ) ) ( not ( = ?auto_142798 ?auto_142797 ) ) ( not ( = ?auto_142798 ?auto_142801 ) ) ( not ( = ?auto_142798 ?auto_142803 ) ) ( not ( = ?auto_142798 ?auto_142802 ) ) ( not ( = ?auto_142798 ?auto_142806 ) ) ( not ( = ?auto_142799 ?auto_142800 ) ) ( not ( = ?auto_142799 ?auto_142797 ) ) ( not ( = ?auto_142799 ?auto_142801 ) ) ( not ( = ?auto_142799 ?auto_142803 ) ) ( not ( = ?auto_142799 ?auto_142802 ) ) ( not ( = ?auto_142799 ?auto_142806 ) ) ( not ( = ?auto_142800 ?auto_142797 ) ) ( not ( = ?auto_142800 ?auto_142801 ) ) ( not ( = ?auto_142800 ?auto_142803 ) ) ( not ( = ?auto_142800 ?auto_142802 ) ) ( not ( = ?auto_142800 ?auto_142806 ) ) ( not ( = ?auto_142797 ?auto_142801 ) ) ( not ( = ?auto_142797 ?auto_142803 ) ) ( not ( = ?auto_142797 ?auto_142802 ) ) ( not ( = ?auto_142797 ?auto_142806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142801 ?auto_142803 ?auto_142802 )
      ( MAKE-6CRATE-VERIFY ?auto_142798 ?auto_142799 ?auto_142800 ?auto_142797 ?auto_142801 ?auto_142803 ?auto_142802 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142862 - SURFACE
      ?auto_142863 - SURFACE
      ?auto_142864 - SURFACE
      ?auto_142861 - SURFACE
      ?auto_142865 - SURFACE
      ?auto_142867 - SURFACE
      ?auto_142866 - SURFACE
    )
    :vars
    (
      ?auto_142870 - HOIST
      ?auto_142871 - PLACE
      ?auto_142872 - PLACE
      ?auto_142873 - HOIST
      ?auto_142868 - SURFACE
      ?auto_142869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142870 ?auto_142871 ) ( IS-CRATE ?auto_142866 ) ( not ( = ?auto_142867 ?auto_142866 ) ) ( not ( = ?auto_142865 ?auto_142867 ) ) ( not ( = ?auto_142865 ?auto_142866 ) ) ( not ( = ?auto_142872 ?auto_142871 ) ) ( HOIST-AT ?auto_142873 ?auto_142872 ) ( not ( = ?auto_142870 ?auto_142873 ) ) ( AVAILABLE ?auto_142873 ) ( SURFACE-AT ?auto_142866 ?auto_142872 ) ( ON ?auto_142866 ?auto_142868 ) ( CLEAR ?auto_142866 ) ( not ( = ?auto_142867 ?auto_142868 ) ) ( not ( = ?auto_142866 ?auto_142868 ) ) ( not ( = ?auto_142865 ?auto_142868 ) ) ( TRUCK-AT ?auto_142869 ?auto_142871 ) ( SURFACE-AT ?auto_142865 ?auto_142871 ) ( CLEAR ?auto_142865 ) ( LIFTING ?auto_142870 ?auto_142867 ) ( IS-CRATE ?auto_142867 ) ( ON ?auto_142863 ?auto_142862 ) ( ON ?auto_142864 ?auto_142863 ) ( ON ?auto_142861 ?auto_142864 ) ( ON ?auto_142865 ?auto_142861 ) ( not ( = ?auto_142862 ?auto_142863 ) ) ( not ( = ?auto_142862 ?auto_142864 ) ) ( not ( = ?auto_142862 ?auto_142861 ) ) ( not ( = ?auto_142862 ?auto_142865 ) ) ( not ( = ?auto_142862 ?auto_142867 ) ) ( not ( = ?auto_142862 ?auto_142866 ) ) ( not ( = ?auto_142862 ?auto_142868 ) ) ( not ( = ?auto_142863 ?auto_142864 ) ) ( not ( = ?auto_142863 ?auto_142861 ) ) ( not ( = ?auto_142863 ?auto_142865 ) ) ( not ( = ?auto_142863 ?auto_142867 ) ) ( not ( = ?auto_142863 ?auto_142866 ) ) ( not ( = ?auto_142863 ?auto_142868 ) ) ( not ( = ?auto_142864 ?auto_142861 ) ) ( not ( = ?auto_142864 ?auto_142865 ) ) ( not ( = ?auto_142864 ?auto_142867 ) ) ( not ( = ?auto_142864 ?auto_142866 ) ) ( not ( = ?auto_142864 ?auto_142868 ) ) ( not ( = ?auto_142861 ?auto_142865 ) ) ( not ( = ?auto_142861 ?auto_142867 ) ) ( not ( = ?auto_142861 ?auto_142866 ) ) ( not ( = ?auto_142861 ?auto_142868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142865 ?auto_142867 ?auto_142866 )
      ( MAKE-6CRATE-VERIFY ?auto_142862 ?auto_142863 ?auto_142864 ?auto_142861 ?auto_142865 ?auto_142867 ?auto_142866 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142926 - SURFACE
      ?auto_142927 - SURFACE
      ?auto_142928 - SURFACE
      ?auto_142925 - SURFACE
      ?auto_142929 - SURFACE
      ?auto_142931 - SURFACE
      ?auto_142930 - SURFACE
    )
    :vars
    (
      ?auto_142935 - HOIST
      ?auto_142934 - PLACE
      ?auto_142933 - PLACE
      ?auto_142936 - HOIST
      ?auto_142932 - SURFACE
      ?auto_142937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142935 ?auto_142934 ) ( IS-CRATE ?auto_142930 ) ( not ( = ?auto_142931 ?auto_142930 ) ) ( not ( = ?auto_142929 ?auto_142931 ) ) ( not ( = ?auto_142929 ?auto_142930 ) ) ( not ( = ?auto_142933 ?auto_142934 ) ) ( HOIST-AT ?auto_142936 ?auto_142933 ) ( not ( = ?auto_142935 ?auto_142936 ) ) ( AVAILABLE ?auto_142936 ) ( SURFACE-AT ?auto_142930 ?auto_142933 ) ( ON ?auto_142930 ?auto_142932 ) ( CLEAR ?auto_142930 ) ( not ( = ?auto_142931 ?auto_142932 ) ) ( not ( = ?auto_142930 ?auto_142932 ) ) ( not ( = ?auto_142929 ?auto_142932 ) ) ( TRUCK-AT ?auto_142937 ?auto_142934 ) ( SURFACE-AT ?auto_142929 ?auto_142934 ) ( CLEAR ?auto_142929 ) ( IS-CRATE ?auto_142931 ) ( AVAILABLE ?auto_142935 ) ( IN ?auto_142931 ?auto_142937 ) ( ON ?auto_142927 ?auto_142926 ) ( ON ?auto_142928 ?auto_142927 ) ( ON ?auto_142925 ?auto_142928 ) ( ON ?auto_142929 ?auto_142925 ) ( not ( = ?auto_142926 ?auto_142927 ) ) ( not ( = ?auto_142926 ?auto_142928 ) ) ( not ( = ?auto_142926 ?auto_142925 ) ) ( not ( = ?auto_142926 ?auto_142929 ) ) ( not ( = ?auto_142926 ?auto_142931 ) ) ( not ( = ?auto_142926 ?auto_142930 ) ) ( not ( = ?auto_142926 ?auto_142932 ) ) ( not ( = ?auto_142927 ?auto_142928 ) ) ( not ( = ?auto_142927 ?auto_142925 ) ) ( not ( = ?auto_142927 ?auto_142929 ) ) ( not ( = ?auto_142927 ?auto_142931 ) ) ( not ( = ?auto_142927 ?auto_142930 ) ) ( not ( = ?auto_142927 ?auto_142932 ) ) ( not ( = ?auto_142928 ?auto_142925 ) ) ( not ( = ?auto_142928 ?auto_142929 ) ) ( not ( = ?auto_142928 ?auto_142931 ) ) ( not ( = ?auto_142928 ?auto_142930 ) ) ( not ( = ?auto_142928 ?auto_142932 ) ) ( not ( = ?auto_142925 ?auto_142929 ) ) ( not ( = ?auto_142925 ?auto_142931 ) ) ( not ( = ?auto_142925 ?auto_142930 ) ) ( not ( = ?auto_142925 ?auto_142932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142929 ?auto_142931 ?auto_142930 )
      ( MAKE-6CRATE-VERIFY ?auto_142926 ?auto_142927 ?auto_142928 ?auto_142925 ?auto_142929 ?auto_142931 ?auto_142930 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144882 - SURFACE
      ?auto_144883 - SURFACE
      ?auto_144884 - SURFACE
      ?auto_144881 - SURFACE
      ?auto_144885 - SURFACE
      ?auto_144887 - SURFACE
      ?auto_144886 - SURFACE
      ?auto_144888 - SURFACE
    )
    :vars
    (
      ?auto_144889 - HOIST
      ?auto_144890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_144889 ?auto_144890 ) ( SURFACE-AT ?auto_144886 ?auto_144890 ) ( CLEAR ?auto_144886 ) ( LIFTING ?auto_144889 ?auto_144888 ) ( IS-CRATE ?auto_144888 ) ( not ( = ?auto_144886 ?auto_144888 ) ) ( ON ?auto_144883 ?auto_144882 ) ( ON ?auto_144884 ?auto_144883 ) ( ON ?auto_144881 ?auto_144884 ) ( ON ?auto_144885 ?auto_144881 ) ( ON ?auto_144887 ?auto_144885 ) ( ON ?auto_144886 ?auto_144887 ) ( not ( = ?auto_144882 ?auto_144883 ) ) ( not ( = ?auto_144882 ?auto_144884 ) ) ( not ( = ?auto_144882 ?auto_144881 ) ) ( not ( = ?auto_144882 ?auto_144885 ) ) ( not ( = ?auto_144882 ?auto_144887 ) ) ( not ( = ?auto_144882 ?auto_144886 ) ) ( not ( = ?auto_144882 ?auto_144888 ) ) ( not ( = ?auto_144883 ?auto_144884 ) ) ( not ( = ?auto_144883 ?auto_144881 ) ) ( not ( = ?auto_144883 ?auto_144885 ) ) ( not ( = ?auto_144883 ?auto_144887 ) ) ( not ( = ?auto_144883 ?auto_144886 ) ) ( not ( = ?auto_144883 ?auto_144888 ) ) ( not ( = ?auto_144884 ?auto_144881 ) ) ( not ( = ?auto_144884 ?auto_144885 ) ) ( not ( = ?auto_144884 ?auto_144887 ) ) ( not ( = ?auto_144884 ?auto_144886 ) ) ( not ( = ?auto_144884 ?auto_144888 ) ) ( not ( = ?auto_144881 ?auto_144885 ) ) ( not ( = ?auto_144881 ?auto_144887 ) ) ( not ( = ?auto_144881 ?auto_144886 ) ) ( not ( = ?auto_144881 ?auto_144888 ) ) ( not ( = ?auto_144885 ?auto_144887 ) ) ( not ( = ?auto_144885 ?auto_144886 ) ) ( not ( = ?auto_144885 ?auto_144888 ) ) ( not ( = ?auto_144887 ?auto_144886 ) ) ( not ( = ?auto_144887 ?auto_144888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_144886 ?auto_144888 )
      ( MAKE-7CRATE-VERIFY ?auto_144882 ?auto_144883 ?auto_144884 ?auto_144881 ?auto_144885 ?auto_144887 ?auto_144886 ?auto_144888 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144937 - SURFACE
      ?auto_144938 - SURFACE
      ?auto_144939 - SURFACE
      ?auto_144936 - SURFACE
      ?auto_144940 - SURFACE
      ?auto_144942 - SURFACE
      ?auto_144941 - SURFACE
      ?auto_144943 - SURFACE
    )
    :vars
    (
      ?auto_144946 - HOIST
      ?auto_144944 - PLACE
      ?auto_144945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_144946 ?auto_144944 ) ( SURFACE-AT ?auto_144941 ?auto_144944 ) ( CLEAR ?auto_144941 ) ( IS-CRATE ?auto_144943 ) ( not ( = ?auto_144941 ?auto_144943 ) ) ( TRUCK-AT ?auto_144945 ?auto_144944 ) ( AVAILABLE ?auto_144946 ) ( IN ?auto_144943 ?auto_144945 ) ( ON ?auto_144941 ?auto_144942 ) ( not ( = ?auto_144942 ?auto_144941 ) ) ( not ( = ?auto_144942 ?auto_144943 ) ) ( ON ?auto_144938 ?auto_144937 ) ( ON ?auto_144939 ?auto_144938 ) ( ON ?auto_144936 ?auto_144939 ) ( ON ?auto_144940 ?auto_144936 ) ( ON ?auto_144942 ?auto_144940 ) ( not ( = ?auto_144937 ?auto_144938 ) ) ( not ( = ?auto_144937 ?auto_144939 ) ) ( not ( = ?auto_144937 ?auto_144936 ) ) ( not ( = ?auto_144937 ?auto_144940 ) ) ( not ( = ?auto_144937 ?auto_144942 ) ) ( not ( = ?auto_144937 ?auto_144941 ) ) ( not ( = ?auto_144937 ?auto_144943 ) ) ( not ( = ?auto_144938 ?auto_144939 ) ) ( not ( = ?auto_144938 ?auto_144936 ) ) ( not ( = ?auto_144938 ?auto_144940 ) ) ( not ( = ?auto_144938 ?auto_144942 ) ) ( not ( = ?auto_144938 ?auto_144941 ) ) ( not ( = ?auto_144938 ?auto_144943 ) ) ( not ( = ?auto_144939 ?auto_144936 ) ) ( not ( = ?auto_144939 ?auto_144940 ) ) ( not ( = ?auto_144939 ?auto_144942 ) ) ( not ( = ?auto_144939 ?auto_144941 ) ) ( not ( = ?auto_144939 ?auto_144943 ) ) ( not ( = ?auto_144936 ?auto_144940 ) ) ( not ( = ?auto_144936 ?auto_144942 ) ) ( not ( = ?auto_144936 ?auto_144941 ) ) ( not ( = ?auto_144936 ?auto_144943 ) ) ( not ( = ?auto_144940 ?auto_144942 ) ) ( not ( = ?auto_144940 ?auto_144941 ) ) ( not ( = ?auto_144940 ?auto_144943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_144942 ?auto_144941 ?auto_144943 )
      ( MAKE-7CRATE-VERIFY ?auto_144937 ?auto_144938 ?auto_144939 ?auto_144936 ?auto_144940 ?auto_144942 ?auto_144941 ?auto_144943 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145000 - SURFACE
      ?auto_145001 - SURFACE
      ?auto_145002 - SURFACE
      ?auto_144999 - SURFACE
      ?auto_145003 - SURFACE
      ?auto_145005 - SURFACE
      ?auto_145004 - SURFACE
      ?auto_145006 - SURFACE
    )
    :vars
    (
      ?auto_145009 - HOIST
      ?auto_145010 - PLACE
      ?auto_145007 - TRUCK
      ?auto_145008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_145009 ?auto_145010 ) ( SURFACE-AT ?auto_145004 ?auto_145010 ) ( CLEAR ?auto_145004 ) ( IS-CRATE ?auto_145006 ) ( not ( = ?auto_145004 ?auto_145006 ) ) ( AVAILABLE ?auto_145009 ) ( IN ?auto_145006 ?auto_145007 ) ( ON ?auto_145004 ?auto_145005 ) ( not ( = ?auto_145005 ?auto_145004 ) ) ( not ( = ?auto_145005 ?auto_145006 ) ) ( TRUCK-AT ?auto_145007 ?auto_145008 ) ( not ( = ?auto_145008 ?auto_145010 ) ) ( ON ?auto_145001 ?auto_145000 ) ( ON ?auto_145002 ?auto_145001 ) ( ON ?auto_144999 ?auto_145002 ) ( ON ?auto_145003 ?auto_144999 ) ( ON ?auto_145005 ?auto_145003 ) ( not ( = ?auto_145000 ?auto_145001 ) ) ( not ( = ?auto_145000 ?auto_145002 ) ) ( not ( = ?auto_145000 ?auto_144999 ) ) ( not ( = ?auto_145000 ?auto_145003 ) ) ( not ( = ?auto_145000 ?auto_145005 ) ) ( not ( = ?auto_145000 ?auto_145004 ) ) ( not ( = ?auto_145000 ?auto_145006 ) ) ( not ( = ?auto_145001 ?auto_145002 ) ) ( not ( = ?auto_145001 ?auto_144999 ) ) ( not ( = ?auto_145001 ?auto_145003 ) ) ( not ( = ?auto_145001 ?auto_145005 ) ) ( not ( = ?auto_145001 ?auto_145004 ) ) ( not ( = ?auto_145001 ?auto_145006 ) ) ( not ( = ?auto_145002 ?auto_144999 ) ) ( not ( = ?auto_145002 ?auto_145003 ) ) ( not ( = ?auto_145002 ?auto_145005 ) ) ( not ( = ?auto_145002 ?auto_145004 ) ) ( not ( = ?auto_145002 ?auto_145006 ) ) ( not ( = ?auto_144999 ?auto_145003 ) ) ( not ( = ?auto_144999 ?auto_145005 ) ) ( not ( = ?auto_144999 ?auto_145004 ) ) ( not ( = ?auto_144999 ?auto_145006 ) ) ( not ( = ?auto_145003 ?auto_145005 ) ) ( not ( = ?auto_145003 ?auto_145004 ) ) ( not ( = ?auto_145003 ?auto_145006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145005 ?auto_145004 ?auto_145006 )
      ( MAKE-7CRATE-VERIFY ?auto_145000 ?auto_145001 ?auto_145002 ?auto_144999 ?auto_145003 ?auto_145005 ?auto_145004 ?auto_145006 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145070 - SURFACE
      ?auto_145071 - SURFACE
      ?auto_145072 - SURFACE
      ?auto_145069 - SURFACE
      ?auto_145073 - SURFACE
      ?auto_145075 - SURFACE
      ?auto_145074 - SURFACE
      ?auto_145076 - SURFACE
    )
    :vars
    (
      ?auto_145081 - HOIST
      ?auto_145080 - PLACE
      ?auto_145077 - TRUCK
      ?auto_145079 - PLACE
      ?auto_145078 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_145081 ?auto_145080 ) ( SURFACE-AT ?auto_145074 ?auto_145080 ) ( CLEAR ?auto_145074 ) ( IS-CRATE ?auto_145076 ) ( not ( = ?auto_145074 ?auto_145076 ) ) ( AVAILABLE ?auto_145081 ) ( ON ?auto_145074 ?auto_145075 ) ( not ( = ?auto_145075 ?auto_145074 ) ) ( not ( = ?auto_145075 ?auto_145076 ) ) ( TRUCK-AT ?auto_145077 ?auto_145079 ) ( not ( = ?auto_145079 ?auto_145080 ) ) ( HOIST-AT ?auto_145078 ?auto_145079 ) ( LIFTING ?auto_145078 ?auto_145076 ) ( not ( = ?auto_145081 ?auto_145078 ) ) ( ON ?auto_145071 ?auto_145070 ) ( ON ?auto_145072 ?auto_145071 ) ( ON ?auto_145069 ?auto_145072 ) ( ON ?auto_145073 ?auto_145069 ) ( ON ?auto_145075 ?auto_145073 ) ( not ( = ?auto_145070 ?auto_145071 ) ) ( not ( = ?auto_145070 ?auto_145072 ) ) ( not ( = ?auto_145070 ?auto_145069 ) ) ( not ( = ?auto_145070 ?auto_145073 ) ) ( not ( = ?auto_145070 ?auto_145075 ) ) ( not ( = ?auto_145070 ?auto_145074 ) ) ( not ( = ?auto_145070 ?auto_145076 ) ) ( not ( = ?auto_145071 ?auto_145072 ) ) ( not ( = ?auto_145071 ?auto_145069 ) ) ( not ( = ?auto_145071 ?auto_145073 ) ) ( not ( = ?auto_145071 ?auto_145075 ) ) ( not ( = ?auto_145071 ?auto_145074 ) ) ( not ( = ?auto_145071 ?auto_145076 ) ) ( not ( = ?auto_145072 ?auto_145069 ) ) ( not ( = ?auto_145072 ?auto_145073 ) ) ( not ( = ?auto_145072 ?auto_145075 ) ) ( not ( = ?auto_145072 ?auto_145074 ) ) ( not ( = ?auto_145072 ?auto_145076 ) ) ( not ( = ?auto_145069 ?auto_145073 ) ) ( not ( = ?auto_145069 ?auto_145075 ) ) ( not ( = ?auto_145069 ?auto_145074 ) ) ( not ( = ?auto_145069 ?auto_145076 ) ) ( not ( = ?auto_145073 ?auto_145075 ) ) ( not ( = ?auto_145073 ?auto_145074 ) ) ( not ( = ?auto_145073 ?auto_145076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145075 ?auto_145074 ?auto_145076 )
      ( MAKE-7CRATE-VERIFY ?auto_145070 ?auto_145071 ?auto_145072 ?auto_145069 ?auto_145073 ?auto_145075 ?auto_145074 ?auto_145076 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145147 - SURFACE
      ?auto_145148 - SURFACE
      ?auto_145149 - SURFACE
      ?auto_145146 - SURFACE
      ?auto_145150 - SURFACE
      ?auto_145152 - SURFACE
      ?auto_145151 - SURFACE
      ?auto_145153 - SURFACE
    )
    :vars
    (
      ?auto_145159 - HOIST
      ?auto_145154 - PLACE
      ?auto_145158 - TRUCK
      ?auto_145157 - PLACE
      ?auto_145156 - HOIST
      ?auto_145155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_145159 ?auto_145154 ) ( SURFACE-AT ?auto_145151 ?auto_145154 ) ( CLEAR ?auto_145151 ) ( IS-CRATE ?auto_145153 ) ( not ( = ?auto_145151 ?auto_145153 ) ) ( AVAILABLE ?auto_145159 ) ( ON ?auto_145151 ?auto_145152 ) ( not ( = ?auto_145152 ?auto_145151 ) ) ( not ( = ?auto_145152 ?auto_145153 ) ) ( TRUCK-AT ?auto_145158 ?auto_145157 ) ( not ( = ?auto_145157 ?auto_145154 ) ) ( HOIST-AT ?auto_145156 ?auto_145157 ) ( not ( = ?auto_145159 ?auto_145156 ) ) ( AVAILABLE ?auto_145156 ) ( SURFACE-AT ?auto_145153 ?auto_145157 ) ( ON ?auto_145153 ?auto_145155 ) ( CLEAR ?auto_145153 ) ( not ( = ?auto_145151 ?auto_145155 ) ) ( not ( = ?auto_145153 ?auto_145155 ) ) ( not ( = ?auto_145152 ?auto_145155 ) ) ( ON ?auto_145148 ?auto_145147 ) ( ON ?auto_145149 ?auto_145148 ) ( ON ?auto_145146 ?auto_145149 ) ( ON ?auto_145150 ?auto_145146 ) ( ON ?auto_145152 ?auto_145150 ) ( not ( = ?auto_145147 ?auto_145148 ) ) ( not ( = ?auto_145147 ?auto_145149 ) ) ( not ( = ?auto_145147 ?auto_145146 ) ) ( not ( = ?auto_145147 ?auto_145150 ) ) ( not ( = ?auto_145147 ?auto_145152 ) ) ( not ( = ?auto_145147 ?auto_145151 ) ) ( not ( = ?auto_145147 ?auto_145153 ) ) ( not ( = ?auto_145147 ?auto_145155 ) ) ( not ( = ?auto_145148 ?auto_145149 ) ) ( not ( = ?auto_145148 ?auto_145146 ) ) ( not ( = ?auto_145148 ?auto_145150 ) ) ( not ( = ?auto_145148 ?auto_145152 ) ) ( not ( = ?auto_145148 ?auto_145151 ) ) ( not ( = ?auto_145148 ?auto_145153 ) ) ( not ( = ?auto_145148 ?auto_145155 ) ) ( not ( = ?auto_145149 ?auto_145146 ) ) ( not ( = ?auto_145149 ?auto_145150 ) ) ( not ( = ?auto_145149 ?auto_145152 ) ) ( not ( = ?auto_145149 ?auto_145151 ) ) ( not ( = ?auto_145149 ?auto_145153 ) ) ( not ( = ?auto_145149 ?auto_145155 ) ) ( not ( = ?auto_145146 ?auto_145150 ) ) ( not ( = ?auto_145146 ?auto_145152 ) ) ( not ( = ?auto_145146 ?auto_145151 ) ) ( not ( = ?auto_145146 ?auto_145153 ) ) ( not ( = ?auto_145146 ?auto_145155 ) ) ( not ( = ?auto_145150 ?auto_145152 ) ) ( not ( = ?auto_145150 ?auto_145151 ) ) ( not ( = ?auto_145150 ?auto_145153 ) ) ( not ( = ?auto_145150 ?auto_145155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145152 ?auto_145151 ?auto_145153 )
      ( MAKE-7CRATE-VERIFY ?auto_145147 ?auto_145148 ?auto_145149 ?auto_145146 ?auto_145150 ?auto_145152 ?auto_145151 ?auto_145153 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145225 - SURFACE
      ?auto_145226 - SURFACE
      ?auto_145227 - SURFACE
      ?auto_145224 - SURFACE
      ?auto_145228 - SURFACE
      ?auto_145230 - SURFACE
      ?auto_145229 - SURFACE
      ?auto_145231 - SURFACE
    )
    :vars
    (
      ?auto_145235 - HOIST
      ?auto_145236 - PLACE
      ?auto_145232 - PLACE
      ?auto_145234 - HOIST
      ?auto_145237 - SURFACE
      ?auto_145233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145235 ?auto_145236 ) ( SURFACE-AT ?auto_145229 ?auto_145236 ) ( CLEAR ?auto_145229 ) ( IS-CRATE ?auto_145231 ) ( not ( = ?auto_145229 ?auto_145231 ) ) ( AVAILABLE ?auto_145235 ) ( ON ?auto_145229 ?auto_145230 ) ( not ( = ?auto_145230 ?auto_145229 ) ) ( not ( = ?auto_145230 ?auto_145231 ) ) ( not ( = ?auto_145232 ?auto_145236 ) ) ( HOIST-AT ?auto_145234 ?auto_145232 ) ( not ( = ?auto_145235 ?auto_145234 ) ) ( AVAILABLE ?auto_145234 ) ( SURFACE-AT ?auto_145231 ?auto_145232 ) ( ON ?auto_145231 ?auto_145237 ) ( CLEAR ?auto_145231 ) ( not ( = ?auto_145229 ?auto_145237 ) ) ( not ( = ?auto_145231 ?auto_145237 ) ) ( not ( = ?auto_145230 ?auto_145237 ) ) ( TRUCK-AT ?auto_145233 ?auto_145236 ) ( ON ?auto_145226 ?auto_145225 ) ( ON ?auto_145227 ?auto_145226 ) ( ON ?auto_145224 ?auto_145227 ) ( ON ?auto_145228 ?auto_145224 ) ( ON ?auto_145230 ?auto_145228 ) ( not ( = ?auto_145225 ?auto_145226 ) ) ( not ( = ?auto_145225 ?auto_145227 ) ) ( not ( = ?auto_145225 ?auto_145224 ) ) ( not ( = ?auto_145225 ?auto_145228 ) ) ( not ( = ?auto_145225 ?auto_145230 ) ) ( not ( = ?auto_145225 ?auto_145229 ) ) ( not ( = ?auto_145225 ?auto_145231 ) ) ( not ( = ?auto_145225 ?auto_145237 ) ) ( not ( = ?auto_145226 ?auto_145227 ) ) ( not ( = ?auto_145226 ?auto_145224 ) ) ( not ( = ?auto_145226 ?auto_145228 ) ) ( not ( = ?auto_145226 ?auto_145230 ) ) ( not ( = ?auto_145226 ?auto_145229 ) ) ( not ( = ?auto_145226 ?auto_145231 ) ) ( not ( = ?auto_145226 ?auto_145237 ) ) ( not ( = ?auto_145227 ?auto_145224 ) ) ( not ( = ?auto_145227 ?auto_145228 ) ) ( not ( = ?auto_145227 ?auto_145230 ) ) ( not ( = ?auto_145227 ?auto_145229 ) ) ( not ( = ?auto_145227 ?auto_145231 ) ) ( not ( = ?auto_145227 ?auto_145237 ) ) ( not ( = ?auto_145224 ?auto_145228 ) ) ( not ( = ?auto_145224 ?auto_145230 ) ) ( not ( = ?auto_145224 ?auto_145229 ) ) ( not ( = ?auto_145224 ?auto_145231 ) ) ( not ( = ?auto_145224 ?auto_145237 ) ) ( not ( = ?auto_145228 ?auto_145230 ) ) ( not ( = ?auto_145228 ?auto_145229 ) ) ( not ( = ?auto_145228 ?auto_145231 ) ) ( not ( = ?auto_145228 ?auto_145237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145230 ?auto_145229 ?auto_145231 )
      ( MAKE-7CRATE-VERIFY ?auto_145225 ?auto_145226 ?auto_145227 ?auto_145224 ?auto_145228 ?auto_145230 ?auto_145229 ?auto_145231 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145303 - SURFACE
      ?auto_145304 - SURFACE
      ?auto_145305 - SURFACE
      ?auto_145302 - SURFACE
      ?auto_145306 - SURFACE
      ?auto_145308 - SURFACE
      ?auto_145307 - SURFACE
      ?auto_145309 - SURFACE
    )
    :vars
    (
      ?auto_145312 - HOIST
      ?auto_145310 - PLACE
      ?auto_145314 - PLACE
      ?auto_145311 - HOIST
      ?auto_145315 - SURFACE
      ?auto_145313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145312 ?auto_145310 ) ( IS-CRATE ?auto_145309 ) ( not ( = ?auto_145307 ?auto_145309 ) ) ( not ( = ?auto_145308 ?auto_145307 ) ) ( not ( = ?auto_145308 ?auto_145309 ) ) ( not ( = ?auto_145314 ?auto_145310 ) ) ( HOIST-AT ?auto_145311 ?auto_145314 ) ( not ( = ?auto_145312 ?auto_145311 ) ) ( AVAILABLE ?auto_145311 ) ( SURFACE-AT ?auto_145309 ?auto_145314 ) ( ON ?auto_145309 ?auto_145315 ) ( CLEAR ?auto_145309 ) ( not ( = ?auto_145307 ?auto_145315 ) ) ( not ( = ?auto_145309 ?auto_145315 ) ) ( not ( = ?auto_145308 ?auto_145315 ) ) ( TRUCK-AT ?auto_145313 ?auto_145310 ) ( SURFACE-AT ?auto_145308 ?auto_145310 ) ( CLEAR ?auto_145308 ) ( LIFTING ?auto_145312 ?auto_145307 ) ( IS-CRATE ?auto_145307 ) ( ON ?auto_145304 ?auto_145303 ) ( ON ?auto_145305 ?auto_145304 ) ( ON ?auto_145302 ?auto_145305 ) ( ON ?auto_145306 ?auto_145302 ) ( ON ?auto_145308 ?auto_145306 ) ( not ( = ?auto_145303 ?auto_145304 ) ) ( not ( = ?auto_145303 ?auto_145305 ) ) ( not ( = ?auto_145303 ?auto_145302 ) ) ( not ( = ?auto_145303 ?auto_145306 ) ) ( not ( = ?auto_145303 ?auto_145308 ) ) ( not ( = ?auto_145303 ?auto_145307 ) ) ( not ( = ?auto_145303 ?auto_145309 ) ) ( not ( = ?auto_145303 ?auto_145315 ) ) ( not ( = ?auto_145304 ?auto_145305 ) ) ( not ( = ?auto_145304 ?auto_145302 ) ) ( not ( = ?auto_145304 ?auto_145306 ) ) ( not ( = ?auto_145304 ?auto_145308 ) ) ( not ( = ?auto_145304 ?auto_145307 ) ) ( not ( = ?auto_145304 ?auto_145309 ) ) ( not ( = ?auto_145304 ?auto_145315 ) ) ( not ( = ?auto_145305 ?auto_145302 ) ) ( not ( = ?auto_145305 ?auto_145306 ) ) ( not ( = ?auto_145305 ?auto_145308 ) ) ( not ( = ?auto_145305 ?auto_145307 ) ) ( not ( = ?auto_145305 ?auto_145309 ) ) ( not ( = ?auto_145305 ?auto_145315 ) ) ( not ( = ?auto_145302 ?auto_145306 ) ) ( not ( = ?auto_145302 ?auto_145308 ) ) ( not ( = ?auto_145302 ?auto_145307 ) ) ( not ( = ?auto_145302 ?auto_145309 ) ) ( not ( = ?auto_145302 ?auto_145315 ) ) ( not ( = ?auto_145306 ?auto_145308 ) ) ( not ( = ?auto_145306 ?auto_145307 ) ) ( not ( = ?auto_145306 ?auto_145309 ) ) ( not ( = ?auto_145306 ?auto_145315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145308 ?auto_145307 ?auto_145309 )
      ( MAKE-7CRATE-VERIFY ?auto_145303 ?auto_145304 ?auto_145305 ?auto_145302 ?auto_145306 ?auto_145308 ?auto_145307 ?auto_145309 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145381 - SURFACE
      ?auto_145382 - SURFACE
      ?auto_145383 - SURFACE
      ?auto_145380 - SURFACE
      ?auto_145384 - SURFACE
      ?auto_145386 - SURFACE
      ?auto_145385 - SURFACE
      ?auto_145387 - SURFACE
    )
    :vars
    (
      ?auto_145391 - HOIST
      ?auto_145390 - PLACE
      ?auto_145393 - PLACE
      ?auto_145388 - HOIST
      ?auto_145392 - SURFACE
      ?auto_145389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145391 ?auto_145390 ) ( IS-CRATE ?auto_145387 ) ( not ( = ?auto_145385 ?auto_145387 ) ) ( not ( = ?auto_145386 ?auto_145385 ) ) ( not ( = ?auto_145386 ?auto_145387 ) ) ( not ( = ?auto_145393 ?auto_145390 ) ) ( HOIST-AT ?auto_145388 ?auto_145393 ) ( not ( = ?auto_145391 ?auto_145388 ) ) ( AVAILABLE ?auto_145388 ) ( SURFACE-AT ?auto_145387 ?auto_145393 ) ( ON ?auto_145387 ?auto_145392 ) ( CLEAR ?auto_145387 ) ( not ( = ?auto_145385 ?auto_145392 ) ) ( not ( = ?auto_145387 ?auto_145392 ) ) ( not ( = ?auto_145386 ?auto_145392 ) ) ( TRUCK-AT ?auto_145389 ?auto_145390 ) ( SURFACE-AT ?auto_145386 ?auto_145390 ) ( CLEAR ?auto_145386 ) ( IS-CRATE ?auto_145385 ) ( AVAILABLE ?auto_145391 ) ( IN ?auto_145385 ?auto_145389 ) ( ON ?auto_145382 ?auto_145381 ) ( ON ?auto_145383 ?auto_145382 ) ( ON ?auto_145380 ?auto_145383 ) ( ON ?auto_145384 ?auto_145380 ) ( ON ?auto_145386 ?auto_145384 ) ( not ( = ?auto_145381 ?auto_145382 ) ) ( not ( = ?auto_145381 ?auto_145383 ) ) ( not ( = ?auto_145381 ?auto_145380 ) ) ( not ( = ?auto_145381 ?auto_145384 ) ) ( not ( = ?auto_145381 ?auto_145386 ) ) ( not ( = ?auto_145381 ?auto_145385 ) ) ( not ( = ?auto_145381 ?auto_145387 ) ) ( not ( = ?auto_145381 ?auto_145392 ) ) ( not ( = ?auto_145382 ?auto_145383 ) ) ( not ( = ?auto_145382 ?auto_145380 ) ) ( not ( = ?auto_145382 ?auto_145384 ) ) ( not ( = ?auto_145382 ?auto_145386 ) ) ( not ( = ?auto_145382 ?auto_145385 ) ) ( not ( = ?auto_145382 ?auto_145387 ) ) ( not ( = ?auto_145382 ?auto_145392 ) ) ( not ( = ?auto_145383 ?auto_145380 ) ) ( not ( = ?auto_145383 ?auto_145384 ) ) ( not ( = ?auto_145383 ?auto_145386 ) ) ( not ( = ?auto_145383 ?auto_145385 ) ) ( not ( = ?auto_145383 ?auto_145387 ) ) ( not ( = ?auto_145383 ?auto_145392 ) ) ( not ( = ?auto_145380 ?auto_145384 ) ) ( not ( = ?auto_145380 ?auto_145386 ) ) ( not ( = ?auto_145380 ?auto_145385 ) ) ( not ( = ?auto_145380 ?auto_145387 ) ) ( not ( = ?auto_145380 ?auto_145392 ) ) ( not ( = ?auto_145384 ?auto_145386 ) ) ( not ( = ?auto_145384 ?auto_145385 ) ) ( not ( = ?auto_145384 ?auto_145387 ) ) ( not ( = ?auto_145384 ?auto_145392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145386 ?auto_145385 ?auto_145387 )
      ( MAKE-7CRATE-VERIFY ?auto_145381 ?auto_145382 ?auto_145383 ?auto_145380 ?auto_145384 ?auto_145386 ?auto_145385 ?auto_145387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_146955 - SURFACE
      ?auto_146956 - SURFACE
    )
    :vars
    (
      ?auto_146959 - HOIST
      ?auto_146963 - PLACE
      ?auto_146960 - SURFACE
      ?auto_146961 - TRUCK
      ?auto_146957 - PLACE
      ?auto_146958 - HOIST
      ?auto_146962 - SURFACE
      ?auto_146964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_146959 ?auto_146963 ) ( SURFACE-AT ?auto_146955 ?auto_146963 ) ( CLEAR ?auto_146955 ) ( IS-CRATE ?auto_146956 ) ( not ( = ?auto_146955 ?auto_146956 ) ) ( AVAILABLE ?auto_146959 ) ( ON ?auto_146955 ?auto_146960 ) ( not ( = ?auto_146960 ?auto_146955 ) ) ( not ( = ?auto_146960 ?auto_146956 ) ) ( TRUCK-AT ?auto_146961 ?auto_146957 ) ( not ( = ?auto_146957 ?auto_146963 ) ) ( HOIST-AT ?auto_146958 ?auto_146957 ) ( not ( = ?auto_146959 ?auto_146958 ) ) ( SURFACE-AT ?auto_146956 ?auto_146957 ) ( ON ?auto_146956 ?auto_146962 ) ( CLEAR ?auto_146956 ) ( not ( = ?auto_146955 ?auto_146962 ) ) ( not ( = ?auto_146956 ?auto_146962 ) ) ( not ( = ?auto_146960 ?auto_146962 ) ) ( LIFTING ?auto_146958 ?auto_146964 ) ( IS-CRATE ?auto_146964 ) ( not ( = ?auto_146955 ?auto_146964 ) ) ( not ( = ?auto_146956 ?auto_146964 ) ) ( not ( = ?auto_146960 ?auto_146964 ) ) ( not ( = ?auto_146962 ?auto_146964 ) ) )
    :subtasks
    ( ( !LOAD ?auto_146958 ?auto_146964 ?auto_146961 ?auto_146957 )
      ( MAKE-1CRATE ?auto_146955 ?auto_146956 )
      ( MAKE-1CRATE-VERIFY ?auto_146955 ?auto_146956 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148263 - SURFACE
      ?auto_148264 - SURFACE
      ?auto_148265 - SURFACE
      ?auto_148262 - SURFACE
      ?auto_148266 - SURFACE
      ?auto_148268 - SURFACE
      ?auto_148267 - SURFACE
      ?auto_148269 - SURFACE
      ?auto_148270 - SURFACE
    )
    :vars
    (
      ?auto_148272 - HOIST
      ?auto_148271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148272 ?auto_148271 ) ( SURFACE-AT ?auto_148269 ?auto_148271 ) ( CLEAR ?auto_148269 ) ( LIFTING ?auto_148272 ?auto_148270 ) ( IS-CRATE ?auto_148270 ) ( not ( = ?auto_148269 ?auto_148270 ) ) ( ON ?auto_148264 ?auto_148263 ) ( ON ?auto_148265 ?auto_148264 ) ( ON ?auto_148262 ?auto_148265 ) ( ON ?auto_148266 ?auto_148262 ) ( ON ?auto_148268 ?auto_148266 ) ( ON ?auto_148267 ?auto_148268 ) ( ON ?auto_148269 ?auto_148267 ) ( not ( = ?auto_148263 ?auto_148264 ) ) ( not ( = ?auto_148263 ?auto_148265 ) ) ( not ( = ?auto_148263 ?auto_148262 ) ) ( not ( = ?auto_148263 ?auto_148266 ) ) ( not ( = ?auto_148263 ?auto_148268 ) ) ( not ( = ?auto_148263 ?auto_148267 ) ) ( not ( = ?auto_148263 ?auto_148269 ) ) ( not ( = ?auto_148263 ?auto_148270 ) ) ( not ( = ?auto_148264 ?auto_148265 ) ) ( not ( = ?auto_148264 ?auto_148262 ) ) ( not ( = ?auto_148264 ?auto_148266 ) ) ( not ( = ?auto_148264 ?auto_148268 ) ) ( not ( = ?auto_148264 ?auto_148267 ) ) ( not ( = ?auto_148264 ?auto_148269 ) ) ( not ( = ?auto_148264 ?auto_148270 ) ) ( not ( = ?auto_148265 ?auto_148262 ) ) ( not ( = ?auto_148265 ?auto_148266 ) ) ( not ( = ?auto_148265 ?auto_148268 ) ) ( not ( = ?auto_148265 ?auto_148267 ) ) ( not ( = ?auto_148265 ?auto_148269 ) ) ( not ( = ?auto_148265 ?auto_148270 ) ) ( not ( = ?auto_148262 ?auto_148266 ) ) ( not ( = ?auto_148262 ?auto_148268 ) ) ( not ( = ?auto_148262 ?auto_148267 ) ) ( not ( = ?auto_148262 ?auto_148269 ) ) ( not ( = ?auto_148262 ?auto_148270 ) ) ( not ( = ?auto_148266 ?auto_148268 ) ) ( not ( = ?auto_148266 ?auto_148267 ) ) ( not ( = ?auto_148266 ?auto_148269 ) ) ( not ( = ?auto_148266 ?auto_148270 ) ) ( not ( = ?auto_148268 ?auto_148267 ) ) ( not ( = ?auto_148268 ?auto_148269 ) ) ( not ( = ?auto_148268 ?auto_148270 ) ) ( not ( = ?auto_148267 ?auto_148269 ) ) ( not ( = ?auto_148267 ?auto_148270 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_148269 ?auto_148270 )
      ( MAKE-8CRATE-VERIFY ?auto_148263 ?auto_148264 ?auto_148265 ?auto_148262 ?auto_148266 ?auto_148268 ?auto_148267 ?auto_148269 ?auto_148270 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148330 - SURFACE
      ?auto_148331 - SURFACE
      ?auto_148332 - SURFACE
      ?auto_148329 - SURFACE
      ?auto_148333 - SURFACE
      ?auto_148335 - SURFACE
      ?auto_148334 - SURFACE
      ?auto_148336 - SURFACE
      ?auto_148337 - SURFACE
    )
    :vars
    (
      ?auto_148340 - HOIST
      ?auto_148339 - PLACE
      ?auto_148338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148340 ?auto_148339 ) ( SURFACE-AT ?auto_148336 ?auto_148339 ) ( CLEAR ?auto_148336 ) ( IS-CRATE ?auto_148337 ) ( not ( = ?auto_148336 ?auto_148337 ) ) ( TRUCK-AT ?auto_148338 ?auto_148339 ) ( AVAILABLE ?auto_148340 ) ( IN ?auto_148337 ?auto_148338 ) ( ON ?auto_148336 ?auto_148334 ) ( not ( = ?auto_148334 ?auto_148336 ) ) ( not ( = ?auto_148334 ?auto_148337 ) ) ( ON ?auto_148331 ?auto_148330 ) ( ON ?auto_148332 ?auto_148331 ) ( ON ?auto_148329 ?auto_148332 ) ( ON ?auto_148333 ?auto_148329 ) ( ON ?auto_148335 ?auto_148333 ) ( ON ?auto_148334 ?auto_148335 ) ( not ( = ?auto_148330 ?auto_148331 ) ) ( not ( = ?auto_148330 ?auto_148332 ) ) ( not ( = ?auto_148330 ?auto_148329 ) ) ( not ( = ?auto_148330 ?auto_148333 ) ) ( not ( = ?auto_148330 ?auto_148335 ) ) ( not ( = ?auto_148330 ?auto_148334 ) ) ( not ( = ?auto_148330 ?auto_148336 ) ) ( not ( = ?auto_148330 ?auto_148337 ) ) ( not ( = ?auto_148331 ?auto_148332 ) ) ( not ( = ?auto_148331 ?auto_148329 ) ) ( not ( = ?auto_148331 ?auto_148333 ) ) ( not ( = ?auto_148331 ?auto_148335 ) ) ( not ( = ?auto_148331 ?auto_148334 ) ) ( not ( = ?auto_148331 ?auto_148336 ) ) ( not ( = ?auto_148331 ?auto_148337 ) ) ( not ( = ?auto_148332 ?auto_148329 ) ) ( not ( = ?auto_148332 ?auto_148333 ) ) ( not ( = ?auto_148332 ?auto_148335 ) ) ( not ( = ?auto_148332 ?auto_148334 ) ) ( not ( = ?auto_148332 ?auto_148336 ) ) ( not ( = ?auto_148332 ?auto_148337 ) ) ( not ( = ?auto_148329 ?auto_148333 ) ) ( not ( = ?auto_148329 ?auto_148335 ) ) ( not ( = ?auto_148329 ?auto_148334 ) ) ( not ( = ?auto_148329 ?auto_148336 ) ) ( not ( = ?auto_148329 ?auto_148337 ) ) ( not ( = ?auto_148333 ?auto_148335 ) ) ( not ( = ?auto_148333 ?auto_148334 ) ) ( not ( = ?auto_148333 ?auto_148336 ) ) ( not ( = ?auto_148333 ?auto_148337 ) ) ( not ( = ?auto_148335 ?auto_148334 ) ) ( not ( = ?auto_148335 ?auto_148336 ) ) ( not ( = ?auto_148335 ?auto_148337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148334 ?auto_148336 ?auto_148337 )
      ( MAKE-8CRATE-VERIFY ?auto_148330 ?auto_148331 ?auto_148332 ?auto_148329 ?auto_148333 ?auto_148335 ?auto_148334 ?auto_148336 ?auto_148337 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148406 - SURFACE
      ?auto_148407 - SURFACE
      ?auto_148408 - SURFACE
      ?auto_148405 - SURFACE
      ?auto_148409 - SURFACE
      ?auto_148411 - SURFACE
      ?auto_148410 - SURFACE
      ?auto_148412 - SURFACE
      ?auto_148413 - SURFACE
    )
    :vars
    (
      ?auto_148417 - HOIST
      ?auto_148414 - PLACE
      ?auto_148416 - TRUCK
      ?auto_148415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148417 ?auto_148414 ) ( SURFACE-AT ?auto_148412 ?auto_148414 ) ( CLEAR ?auto_148412 ) ( IS-CRATE ?auto_148413 ) ( not ( = ?auto_148412 ?auto_148413 ) ) ( AVAILABLE ?auto_148417 ) ( IN ?auto_148413 ?auto_148416 ) ( ON ?auto_148412 ?auto_148410 ) ( not ( = ?auto_148410 ?auto_148412 ) ) ( not ( = ?auto_148410 ?auto_148413 ) ) ( TRUCK-AT ?auto_148416 ?auto_148415 ) ( not ( = ?auto_148415 ?auto_148414 ) ) ( ON ?auto_148407 ?auto_148406 ) ( ON ?auto_148408 ?auto_148407 ) ( ON ?auto_148405 ?auto_148408 ) ( ON ?auto_148409 ?auto_148405 ) ( ON ?auto_148411 ?auto_148409 ) ( ON ?auto_148410 ?auto_148411 ) ( not ( = ?auto_148406 ?auto_148407 ) ) ( not ( = ?auto_148406 ?auto_148408 ) ) ( not ( = ?auto_148406 ?auto_148405 ) ) ( not ( = ?auto_148406 ?auto_148409 ) ) ( not ( = ?auto_148406 ?auto_148411 ) ) ( not ( = ?auto_148406 ?auto_148410 ) ) ( not ( = ?auto_148406 ?auto_148412 ) ) ( not ( = ?auto_148406 ?auto_148413 ) ) ( not ( = ?auto_148407 ?auto_148408 ) ) ( not ( = ?auto_148407 ?auto_148405 ) ) ( not ( = ?auto_148407 ?auto_148409 ) ) ( not ( = ?auto_148407 ?auto_148411 ) ) ( not ( = ?auto_148407 ?auto_148410 ) ) ( not ( = ?auto_148407 ?auto_148412 ) ) ( not ( = ?auto_148407 ?auto_148413 ) ) ( not ( = ?auto_148408 ?auto_148405 ) ) ( not ( = ?auto_148408 ?auto_148409 ) ) ( not ( = ?auto_148408 ?auto_148411 ) ) ( not ( = ?auto_148408 ?auto_148410 ) ) ( not ( = ?auto_148408 ?auto_148412 ) ) ( not ( = ?auto_148408 ?auto_148413 ) ) ( not ( = ?auto_148405 ?auto_148409 ) ) ( not ( = ?auto_148405 ?auto_148411 ) ) ( not ( = ?auto_148405 ?auto_148410 ) ) ( not ( = ?auto_148405 ?auto_148412 ) ) ( not ( = ?auto_148405 ?auto_148413 ) ) ( not ( = ?auto_148409 ?auto_148411 ) ) ( not ( = ?auto_148409 ?auto_148410 ) ) ( not ( = ?auto_148409 ?auto_148412 ) ) ( not ( = ?auto_148409 ?auto_148413 ) ) ( not ( = ?auto_148411 ?auto_148410 ) ) ( not ( = ?auto_148411 ?auto_148412 ) ) ( not ( = ?auto_148411 ?auto_148413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148410 ?auto_148412 ?auto_148413 )
      ( MAKE-8CRATE-VERIFY ?auto_148406 ?auto_148407 ?auto_148408 ?auto_148405 ?auto_148409 ?auto_148411 ?auto_148410 ?auto_148412 ?auto_148413 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148490 - SURFACE
      ?auto_148491 - SURFACE
      ?auto_148492 - SURFACE
      ?auto_148489 - SURFACE
      ?auto_148493 - SURFACE
      ?auto_148495 - SURFACE
      ?auto_148494 - SURFACE
      ?auto_148496 - SURFACE
      ?auto_148497 - SURFACE
    )
    :vars
    (
      ?auto_148499 - HOIST
      ?auto_148498 - PLACE
      ?auto_148500 - TRUCK
      ?auto_148501 - PLACE
      ?auto_148502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_148499 ?auto_148498 ) ( SURFACE-AT ?auto_148496 ?auto_148498 ) ( CLEAR ?auto_148496 ) ( IS-CRATE ?auto_148497 ) ( not ( = ?auto_148496 ?auto_148497 ) ) ( AVAILABLE ?auto_148499 ) ( ON ?auto_148496 ?auto_148494 ) ( not ( = ?auto_148494 ?auto_148496 ) ) ( not ( = ?auto_148494 ?auto_148497 ) ) ( TRUCK-AT ?auto_148500 ?auto_148501 ) ( not ( = ?auto_148501 ?auto_148498 ) ) ( HOIST-AT ?auto_148502 ?auto_148501 ) ( LIFTING ?auto_148502 ?auto_148497 ) ( not ( = ?auto_148499 ?auto_148502 ) ) ( ON ?auto_148491 ?auto_148490 ) ( ON ?auto_148492 ?auto_148491 ) ( ON ?auto_148489 ?auto_148492 ) ( ON ?auto_148493 ?auto_148489 ) ( ON ?auto_148495 ?auto_148493 ) ( ON ?auto_148494 ?auto_148495 ) ( not ( = ?auto_148490 ?auto_148491 ) ) ( not ( = ?auto_148490 ?auto_148492 ) ) ( not ( = ?auto_148490 ?auto_148489 ) ) ( not ( = ?auto_148490 ?auto_148493 ) ) ( not ( = ?auto_148490 ?auto_148495 ) ) ( not ( = ?auto_148490 ?auto_148494 ) ) ( not ( = ?auto_148490 ?auto_148496 ) ) ( not ( = ?auto_148490 ?auto_148497 ) ) ( not ( = ?auto_148491 ?auto_148492 ) ) ( not ( = ?auto_148491 ?auto_148489 ) ) ( not ( = ?auto_148491 ?auto_148493 ) ) ( not ( = ?auto_148491 ?auto_148495 ) ) ( not ( = ?auto_148491 ?auto_148494 ) ) ( not ( = ?auto_148491 ?auto_148496 ) ) ( not ( = ?auto_148491 ?auto_148497 ) ) ( not ( = ?auto_148492 ?auto_148489 ) ) ( not ( = ?auto_148492 ?auto_148493 ) ) ( not ( = ?auto_148492 ?auto_148495 ) ) ( not ( = ?auto_148492 ?auto_148494 ) ) ( not ( = ?auto_148492 ?auto_148496 ) ) ( not ( = ?auto_148492 ?auto_148497 ) ) ( not ( = ?auto_148489 ?auto_148493 ) ) ( not ( = ?auto_148489 ?auto_148495 ) ) ( not ( = ?auto_148489 ?auto_148494 ) ) ( not ( = ?auto_148489 ?auto_148496 ) ) ( not ( = ?auto_148489 ?auto_148497 ) ) ( not ( = ?auto_148493 ?auto_148495 ) ) ( not ( = ?auto_148493 ?auto_148494 ) ) ( not ( = ?auto_148493 ?auto_148496 ) ) ( not ( = ?auto_148493 ?auto_148497 ) ) ( not ( = ?auto_148495 ?auto_148494 ) ) ( not ( = ?auto_148495 ?auto_148496 ) ) ( not ( = ?auto_148495 ?auto_148497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148494 ?auto_148496 ?auto_148497 )
      ( MAKE-8CRATE-VERIFY ?auto_148490 ?auto_148491 ?auto_148492 ?auto_148489 ?auto_148493 ?auto_148495 ?auto_148494 ?auto_148496 ?auto_148497 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148582 - SURFACE
      ?auto_148583 - SURFACE
      ?auto_148584 - SURFACE
      ?auto_148581 - SURFACE
      ?auto_148585 - SURFACE
      ?auto_148587 - SURFACE
      ?auto_148586 - SURFACE
      ?auto_148588 - SURFACE
      ?auto_148589 - SURFACE
    )
    :vars
    (
      ?auto_148593 - HOIST
      ?auto_148592 - PLACE
      ?auto_148590 - TRUCK
      ?auto_148594 - PLACE
      ?auto_148595 - HOIST
      ?auto_148591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148593 ?auto_148592 ) ( SURFACE-AT ?auto_148588 ?auto_148592 ) ( CLEAR ?auto_148588 ) ( IS-CRATE ?auto_148589 ) ( not ( = ?auto_148588 ?auto_148589 ) ) ( AVAILABLE ?auto_148593 ) ( ON ?auto_148588 ?auto_148586 ) ( not ( = ?auto_148586 ?auto_148588 ) ) ( not ( = ?auto_148586 ?auto_148589 ) ) ( TRUCK-AT ?auto_148590 ?auto_148594 ) ( not ( = ?auto_148594 ?auto_148592 ) ) ( HOIST-AT ?auto_148595 ?auto_148594 ) ( not ( = ?auto_148593 ?auto_148595 ) ) ( AVAILABLE ?auto_148595 ) ( SURFACE-AT ?auto_148589 ?auto_148594 ) ( ON ?auto_148589 ?auto_148591 ) ( CLEAR ?auto_148589 ) ( not ( = ?auto_148588 ?auto_148591 ) ) ( not ( = ?auto_148589 ?auto_148591 ) ) ( not ( = ?auto_148586 ?auto_148591 ) ) ( ON ?auto_148583 ?auto_148582 ) ( ON ?auto_148584 ?auto_148583 ) ( ON ?auto_148581 ?auto_148584 ) ( ON ?auto_148585 ?auto_148581 ) ( ON ?auto_148587 ?auto_148585 ) ( ON ?auto_148586 ?auto_148587 ) ( not ( = ?auto_148582 ?auto_148583 ) ) ( not ( = ?auto_148582 ?auto_148584 ) ) ( not ( = ?auto_148582 ?auto_148581 ) ) ( not ( = ?auto_148582 ?auto_148585 ) ) ( not ( = ?auto_148582 ?auto_148587 ) ) ( not ( = ?auto_148582 ?auto_148586 ) ) ( not ( = ?auto_148582 ?auto_148588 ) ) ( not ( = ?auto_148582 ?auto_148589 ) ) ( not ( = ?auto_148582 ?auto_148591 ) ) ( not ( = ?auto_148583 ?auto_148584 ) ) ( not ( = ?auto_148583 ?auto_148581 ) ) ( not ( = ?auto_148583 ?auto_148585 ) ) ( not ( = ?auto_148583 ?auto_148587 ) ) ( not ( = ?auto_148583 ?auto_148586 ) ) ( not ( = ?auto_148583 ?auto_148588 ) ) ( not ( = ?auto_148583 ?auto_148589 ) ) ( not ( = ?auto_148583 ?auto_148591 ) ) ( not ( = ?auto_148584 ?auto_148581 ) ) ( not ( = ?auto_148584 ?auto_148585 ) ) ( not ( = ?auto_148584 ?auto_148587 ) ) ( not ( = ?auto_148584 ?auto_148586 ) ) ( not ( = ?auto_148584 ?auto_148588 ) ) ( not ( = ?auto_148584 ?auto_148589 ) ) ( not ( = ?auto_148584 ?auto_148591 ) ) ( not ( = ?auto_148581 ?auto_148585 ) ) ( not ( = ?auto_148581 ?auto_148587 ) ) ( not ( = ?auto_148581 ?auto_148586 ) ) ( not ( = ?auto_148581 ?auto_148588 ) ) ( not ( = ?auto_148581 ?auto_148589 ) ) ( not ( = ?auto_148581 ?auto_148591 ) ) ( not ( = ?auto_148585 ?auto_148587 ) ) ( not ( = ?auto_148585 ?auto_148586 ) ) ( not ( = ?auto_148585 ?auto_148588 ) ) ( not ( = ?auto_148585 ?auto_148589 ) ) ( not ( = ?auto_148585 ?auto_148591 ) ) ( not ( = ?auto_148587 ?auto_148586 ) ) ( not ( = ?auto_148587 ?auto_148588 ) ) ( not ( = ?auto_148587 ?auto_148589 ) ) ( not ( = ?auto_148587 ?auto_148591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148586 ?auto_148588 ?auto_148589 )
      ( MAKE-8CRATE-VERIFY ?auto_148582 ?auto_148583 ?auto_148584 ?auto_148581 ?auto_148585 ?auto_148587 ?auto_148586 ?auto_148588 ?auto_148589 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148675 - SURFACE
      ?auto_148676 - SURFACE
      ?auto_148677 - SURFACE
      ?auto_148674 - SURFACE
      ?auto_148678 - SURFACE
      ?auto_148680 - SURFACE
      ?auto_148679 - SURFACE
      ?auto_148681 - SURFACE
      ?auto_148682 - SURFACE
    )
    :vars
    (
      ?auto_148685 - HOIST
      ?auto_148683 - PLACE
      ?auto_148687 - PLACE
      ?auto_148686 - HOIST
      ?auto_148684 - SURFACE
      ?auto_148688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148685 ?auto_148683 ) ( SURFACE-AT ?auto_148681 ?auto_148683 ) ( CLEAR ?auto_148681 ) ( IS-CRATE ?auto_148682 ) ( not ( = ?auto_148681 ?auto_148682 ) ) ( AVAILABLE ?auto_148685 ) ( ON ?auto_148681 ?auto_148679 ) ( not ( = ?auto_148679 ?auto_148681 ) ) ( not ( = ?auto_148679 ?auto_148682 ) ) ( not ( = ?auto_148687 ?auto_148683 ) ) ( HOIST-AT ?auto_148686 ?auto_148687 ) ( not ( = ?auto_148685 ?auto_148686 ) ) ( AVAILABLE ?auto_148686 ) ( SURFACE-AT ?auto_148682 ?auto_148687 ) ( ON ?auto_148682 ?auto_148684 ) ( CLEAR ?auto_148682 ) ( not ( = ?auto_148681 ?auto_148684 ) ) ( not ( = ?auto_148682 ?auto_148684 ) ) ( not ( = ?auto_148679 ?auto_148684 ) ) ( TRUCK-AT ?auto_148688 ?auto_148683 ) ( ON ?auto_148676 ?auto_148675 ) ( ON ?auto_148677 ?auto_148676 ) ( ON ?auto_148674 ?auto_148677 ) ( ON ?auto_148678 ?auto_148674 ) ( ON ?auto_148680 ?auto_148678 ) ( ON ?auto_148679 ?auto_148680 ) ( not ( = ?auto_148675 ?auto_148676 ) ) ( not ( = ?auto_148675 ?auto_148677 ) ) ( not ( = ?auto_148675 ?auto_148674 ) ) ( not ( = ?auto_148675 ?auto_148678 ) ) ( not ( = ?auto_148675 ?auto_148680 ) ) ( not ( = ?auto_148675 ?auto_148679 ) ) ( not ( = ?auto_148675 ?auto_148681 ) ) ( not ( = ?auto_148675 ?auto_148682 ) ) ( not ( = ?auto_148675 ?auto_148684 ) ) ( not ( = ?auto_148676 ?auto_148677 ) ) ( not ( = ?auto_148676 ?auto_148674 ) ) ( not ( = ?auto_148676 ?auto_148678 ) ) ( not ( = ?auto_148676 ?auto_148680 ) ) ( not ( = ?auto_148676 ?auto_148679 ) ) ( not ( = ?auto_148676 ?auto_148681 ) ) ( not ( = ?auto_148676 ?auto_148682 ) ) ( not ( = ?auto_148676 ?auto_148684 ) ) ( not ( = ?auto_148677 ?auto_148674 ) ) ( not ( = ?auto_148677 ?auto_148678 ) ) ( not ( = ?auto_148677 ?auto_148680 ) ) ( not ( = ?auto_148677 ?auto_148679 ) ) ( not ( = ?auto_148677 ?auto_148681 ) ) ( not ( = ?auto_148677 ?auto_148682 ) ) ( not ( = ?auto_148677 ?auto_148684 ) ) ( not ( = ?auto_148674 ?auto_148678 ) ) ( not ( = ?auto_148674 ?auto_148680 ) ) ( not ( = ?auto_148674 ?auto_148679 ) ) ( not ( = ?auto_148674 ?auto_148681 ) ) ( not ( = ?auto_148674 ?auto_148682 ) ) ( not ( = ?auto_148674 ?auto_148684 ) ) ( not ( = ?auto_148678 ?auto_148680 ) ) ( not ( = ?auto_148678 ?auto_148679 ) ) ( not ( = ?auto_148678 ?auto_148681 ) ) ( not ( = ?auto_148678 ?auto_148682 ) ) ( not ( = ?auto_148678 ?auto_148684 ) ) ( not ( = ?auto_148680 ?auto_148679 ) ) ( not ( = ?auto_148680 ?auto_148681 ) ) ( not ( = ?auto_148680 ?auto_148682 ) ) ( not ( = ?auto_148680 ?auto_148684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148679 ?auto_148681 ?auto_148682 )
      ( MAKE-8CRATE-VERIFY ?auto_148675 ?auto_148676 ?auto_148677 ?auto_148674 ?auto_148678 ?auto_148680 ?auto_148679 ?auto_148681 ?auto_148682 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148768 - SURFACE
      ?auto_148769 - SURFACE
      ?auto_148770 - SURFACE
      ?auto_148767 - SURFACE
      ?auto_148771 - SURFACE
      ?auto_148773 - SURFACE
      ?auto_148772 - SURFACE
      ?auto_148774 - SURFACE
      ?auto_148775 - SURFACE
    )
    :vars
    (
      ?auto_148777 - HOIST
      ?auto_148776 - PLACE
      ?auto_148780 - PLACE
      ?auto_148779 - HOIST
      ?auto_148778 - SURFACE
      ?auto_148781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148777 ?auto_148776 ) ( IS-CRATE ?auto_148775 ) ( not ( = ?auto_148774 ?auto_148775 ) ) ( not ( = ?auto_148772 ?auto_148774 ) ) ( not ( = ?auto_148772 ?auto_148775 ) ) ( not ( = ?auto_148780 ?auto_148776 ) ) ( HOIST-AT ?auto_148779 ?auto_148780 ) ( not ( = ?auto_148777 ?auto_148779 ) ) ( AVAILABLE ?auto_148779 ) ( SURFACE-AT ?auto_148775 ?auto_148780 ) ( ON ?auto_148775 ?auto_148778 ) ( CLEAR ?auto_148775 ) ( not ( = ?auto_148774 ?auto_148778 ) ) ( not ( = ?auto_148775 ?auto_148778 ) ) ( not ( = ?auto_148772 ?auto_148778 ) ) ( TRUCK-AT ?auto_148781 ?auto_148776 ) ( SURFACE-AT ?auto_148772 ?auto_148776 ) ( CLEAR ?auto_148772 ) ( LIFTING ?auto_148777 ?auto_148774 ) ( IS-CRATE ?auto_148774 ) ( ON ?auto_148769 ?auto_148768 ) ( ON ?auto_148770 ?auto_148769 ) ( ON ?auto_148767 ?auto_148770 ) ( ON ?auto_148771 ?auto_148767 ) ( ON ?auto_148773 ?auto_148771 ) ( ON ?auto_148772 ?auto_148773 ) ( not ( = ?auto_148768 ?auto_148769 ) ) ( not ( = ?auto_148768 ?auto_148770 ) ) ( not ( = ?auto_148768 ?auto_148767 ) ) ( not ( = ?auto_148768 ?auto_148771 ) ) ( not ( = ?auto_148768 ?auto_148773 ) ) ( not ( = ?auto_148768 ?auto_148772 ) ) ( not ( = ?auto_148768 ?auto_148774 ) ) ( not ( = ?auto_148768 ?auto_148775 ) ) ( not ( = ?auto_148768 ?auto_148778 ) ) ( not ( = ?auto_148769 ?auto_148770 ) ) ( not ( = ?auto_148769 ?auto_148767 ) ) ( not ( = ?auto_148769 ?auto_148771 ) ) ( not ( = ?auto_148769 ?auto_148773 ) ) ( not ( = ?auto_148769 ?auto_148772 ) ) ( not ( = ?auto_148769 ?auto_148774 ) ) ( not ( = ?auto_148769 ?auto_148775 ) ) ( not ( = ?auto_148769 ?auto_148778 ) ) ( not ( = ?auto_148770 ?auto_148767 ) ) ( not ( = ?auto_148770 ?auto_148771 ) ) ( not ( = ?auto_148770 ?auto_148773 ) ) ( not ( = ?auto_148770 ?auto_148772 ) ) ( not ( = ?auto_148770 ?auto_148774 ) ) ( not ( = ?auto_148770 ?auto_148775 ) ) ( not ( = ?auto_148770 ?auto_148778 ) ) ( not ( = ?auto_148767 ?auto_148771 ) ) ( not ( = ?auto_148767 ?auto_148773 ) ) ( not ( = ?auto_148767 ?auto_148772 ) ) ( not ( = ?auto_148767 ?auto_148774 ) ) ( not ( = ?auto_148767 ?auto_148775 ) ) ( not ( = ?auto_148767 ?auto_148778 ) ) ( not ( = ?auto_148771 ?auto_148773 ) ) ( not ( = ?auto_148771 ?auto_148772 ) ) ( not ( = ?auto_148771 ?auto_148774 ) ) ( not ( = ?auto_148771 ?auto_148775 ) ) ( not ( = ?auto_148771 ?auto_148778 ) ) ( not ( = ?auto_148773 ?auto_148772 ) ) ( not ( = ?auto_148773 ?auto_148774 ) ) ( not ( = ?auto_148773 ?auto_148775 ) ) ( not ( = ?auto_148773 ?auto_148778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148772 ?auto_148774 ?auto_148775 )
      ( MAKE-8CRATE-VERIFY ?auto_148768 ?auto_148769 ?auto_148770 ?auto_148767 ?auto_148771 ?auto_148773 ?auto_148772 ?auto_148774 ?auto_148775 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148861 - SURFACE
      ?auto_148862 - SURFACE
      ?auto_148863 - SURFACE
      ?auto_148860 - SURFACE
      ?auto_148864 - SURFACE
      ?auto_148866 - SURFACE
      ?auto_148865 - SURFACE
      ?auto_148867 - SURFACE
      ?auto_148868 - SURFACE
    )
    :vars
    (
      ?auto_148869 - HOIST
      ?auto_148872 - PLACE
      ?auto_148870 - PLACE
      ?auto_148871 - HOIST
      ?auto_148873 - SURFACE
      ?auto_148874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148869 ?auto_148872 ) ( IS-CRATE ?auto_148868 ) ( not ( = ?auto_148867 ?auto_148868 ) ) ( not ( = ?auto_148865 ?auto_148867 ) ) ( not ( = ?auto_148865 ?auto_148868 ) ) ( not ( = ?auto_148870 ?auto_148872 ) ) ( HOIST-AT ?auto_148871 ?auto_148870 ) ( not ( = ?auto_148869 ?auto_148871 ) ) ( AVAILABLE ?auto_148871 ) ( SURFACE-AT ?auto_148868 ?auto_148870 ) ( ON ?auto_148868 ?auto_148873 ) ( CLEAR ?auto_148868 ) ( not ( = ?auto_148867 ?auto_148873 ) ) ( not ( = ?auto_148868 ?auto_148873 ) ) ( not ( = ?auto_148865 ?auto_148873 ) ) ( TRUCK-AT ?auto_148874 ?auto_148872 ) ( SURFACE-AT ?auto_148865 ?auto_148872 ) ( CLEAR ?auto_148865 ) ( IS-CRATE ?auto_148867 ) ( AVAILABLE ?auto_148869 ) ( IN ?auto_148867 ?auto_148874 ) ( ON ?auto_148862 ?auto_148861 ) ( ON ?auto_148863 ?auto_148862 ) ( ON ?auto_148860 ?auto_148863 ) ( ON ?auto_148864 ?auto_148860 ) ( ON ?auto_148866 ?auto_148864 ) ( ON ?auto_148865 ?auto_148866 ) ( not ( = ?auto_148861 ?auto_148862 ) ) ( not ( = ?auto_148861 ?auto_148863 ) ) ( not ( = ?auto_148861 ?auto_148860 ) ) ( not ( = ?auto_148861 ?auto_148864 ) ) ( not ( = ?auto_148861 ?auto_148866 ) ) ( not ( = ?auto_148861 ?auto_148865 ) ) ( not ( = ?auto_148861 ?auto_148867 ) ) ( not ( = ?auto_148861 ?auto_148868 ) ) ( not ( = ?auto_148861 ?auto_148873 ) ) ( not ( = ?auto_148862 ?auto_148863 ) ) ( not ( = ?auto_148862 ?auto_148860 ) ) ( not ( = ?auto_148862 ?auto_148864 ) ) ( not ( = ?auto_148862 ?auto_148866 ) ) ( not ( = ?auto_148862 ?auto_148865 ) ) ( not ( = ?auto_148862 ?auto_148867 ) ) ( not ( = ?auto_148862 ?auto_148868 ) ) ( not ( = ?auto_148862 ?auto_148873 ) ) ( not ( = ?auto_148863 ?auto_148860 ) ) ( not ( = ?auto_148863 ?auto_148864 ) ) ( not ( = ?auto_148863 ?auto_148866 ) ) ( not ( = ?auto_148863 ?auto_148865 ) ) ( not ( = ?auto_148863 ?auto_148867 ) ) ( not ( = ?auto_148863 ?auto_148868 ) ) ( not ( = ?auto_148863 ?auto_148873 ) ) ( not ( = ?auto_148860 ?auto_148864 ) ) ( not ( = ?auto_148860 ?auto_148866 ) ) ( not ( = ?auto_148860 ?auto_148865 ) ) ( not ( = ?auto_148860 ?auto_148867 ) ) ( not ( = ?auto_148860 ?auto_148868 ) ) ( not ( = ?auto_148860 ?auto_148873 ) ) ( not ( = ?auto_148864 ?auto_148866 ) ) ( not ( = ?auto_148864 ?auto_148865 ) ) ( not ( = ?auto_148864 ?auto_148867 ) ) ( not ( = ?auto_148864 ?auto_148868 ) ) ( not ( = ?auto_148864 ?auto_148873 ) ) ( not ( = ?auto_148866 ?auto_148865 ) ) ( not ( = ?auto_148866 ?auto_148867 ) ) ( not ( = ?auto_148866 ?auto_148868 ) ) ( not ( = ?auto_148866 ?auto_148873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148865 ?auto_148867 ?auto_148868 )
      ( MAKE-8CRATE-VERIFY ?auto_148861 ?auto_148862 ?auto_148863 ?auto_148860 ?auto_148864 ?auto_148866 ?auto_148865 ?auto_148867 ?auto_148868 ) )
  )

)

