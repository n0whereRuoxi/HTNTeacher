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
      ?auto_2402 - SURFACE
      ?auto_2403 - SURFACE
    )
    :vars
    (
      ?auto_2404 - HOIST
      ?auto_2405 - PLACE
      ?auto_2407 - PLACE
      ?auto_2408 - HOIST
      ?auto_2409 - SURFACE
      ?auto_2406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404 ?auto_2405 ) ( SURFACE-AT ?auto_2403 ?auto_2405 ) ( CLEAR ?auto_2403 ) ( IS-CRATE ?auto_2402 ) ( AVAILABLE ?auto_2404 ) ( not ( = ?auto_2407 ?auto_2405 ) ) ( HOIST-AT ?auto_2408 ?auto_2407 ) ( AVAILABLE ?auto_2408 ) ( SURFACE-AT ?auto_2402 ?auto_2407 ) ( ON ?auto_2402 ?auto_2409 ) ( CLEAR ?auto_2402 ) ( TRUCK-AT ?auto_2406 ?auto_2405 ) ( not ( = ?auto_2402 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2409 ) ) ( not ( = ?auto_2403 ?auto_2409 ) ) ( not ( = ?auto_2404 ?auto_2408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2406 ?auto_2405 ?auto_2407 )
      ( !LIFT ?auto_2408 ?auto_2402 ?auto_2409 ?auto_2407 )
      ( !LOAD ?auto_2408 ?auto_2402 ?auto_2406 ?auto_2407 )
      ( !DRIVE ?auto_2406 ?auto_2407 ?auto_2405 )
      ( !UNLOAD ?auto_2404 ?auto_2402 ?auto_2406 ?auto_2405 )
      ( !DROP ?auto_2404 ?auto_2402 ?auto_2403 ?auto_2405 )
      ( MAKE-ON-VERIFY ?auto_2402 ?auto_2403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2412 - SURFACE
      ?auto_2413 - SURFACE
    )
    :vars
    (
      ?auto_2414 - HOIST
      ?auto_2415 - PLACE
      ?auto_2417 - PLACE
      ?auto_2418 - HOIST
      ?auto_2419 - SURFACE
      ?auto_2416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2414 ?auto_2415 ) ( SURFACE-AT ?auto_2413 ?auto_2415 ) ( CLEAR ?auto_2413 ) ( IS-CRATE ?auto_2412 ) ( AVAILABLE ?auto_2414 ) ( not ( = ?auto_2417 ?auto_2415 ) ) ( HOIST-AT ?auto_2418 ?auto_2417 ) ( AVAILABLE ?auto_2418 ) ( SURFACE-AT ?auto_2412 ?auto_2417 ) ( ON ?auto_2412 ?auto_2419 ) ( CLEAR ?auto_2412 ) ( TRUCK-AT ?auto_2416 ?auto_2415 ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( not ( = ?auto_2412 ?auto_2419 ) ) ( not ( = ?auto_2413 ?auto_2419 ) ) ( not ( = ?auto_2414 ?auto_2418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2416 ?auto_2415 ?auto_2417 )
      ( !LIFT ?auto_2418 ?auto_2412 ?auto_2419 ?auto_2417 )
      ( !LOAD ?auto_2418 ?auto_2412 ?auto_2416 ?auto_2417 )
      ( !DRIVE ?auto_2416 ?auto_2417 ?auto_2415 )
      ( !UNLOAD ?auto_2414 ?auto_2412 ?auto_2416 ?auto_2415 )
      ( !DROP ?auto_2414 ?auto_2412 ?auto_2413 ?auto_2415 )
      ( MAKE-ON-VERIFY ?auto_2412 ?auto_2413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2422 - SURFACE
      ?auto_2423 - SURFACE
    )
    :vars
    (
      ?auto_2424 - HOIST
      ?auto_2425 - PLACE
      ?auto_2427 - PLACE
      ?auto_2428 - HOIST
      ?auto_2429 - SURFACE
      ?auto_2426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2424 ?auto_2425 ) ( SURFACE-AT ?auto_2423 ?auto_2425 ) ( CLEAR ?auto_2423 ) ( IS-CRATE ?auto_2422 ) ( AVAILABLE ?auto_2424 ) ( not ( = ?auto_2427 ?auto_2425 ) ) ( HOIST-AT ?auto_2428 ?auto_2427 ) ( AVAILABLE ?auto_2428 ) ( SURFACE-AT ?auto_2422 ?auto_2427 ) ( ON ?auto_2422 ?auto_2429 ) ( CLEAR ?auto_2422 ) ( TRUCK-AT ?auto_2426 ?auto_2425 ) ( not ( = ?auto_2422 ?auto_2423 ) ) ( not ( = ?auto_2422 ?auto_2429 ) ) ( not ( = ?auto_2423 ?auto_2429 ) ) ( not ( = ?auto_2424 ?auto_2428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2426 ?auto_2425 ?auto_2427 )
      ( !LIFT ?auto_2428 ?auto_2422 ?auto_2429 ?auto_2427 )
      ( !LOAD ?auto_2428 ?auto_2422 ?auto_2426 ?auto_2427 )
      ( !DRIVE ?auto_2426 ?auto_2427 ?auto_2425 )
      ( !UNLOAD ?auto_2424 ?auto_2422 ?auto_2426 ?auto_2425 )
      ( !DROP ?auto_2424 ?auto_2422 ?auto_2423 ?auto_2425 )
      ( MAKE-ON-VERIFY ?auto_2422 ?auto_2423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2432 - SURFACE
      ?auto_2433 - SURFACE
    )
    :vars
    (
      ?auto_2434 - HOIST
      ?auto_2435 - PLACE
      ?auto_2437 - PLACE
      ?auto_2438 - HOIST
      ?auto_2439 - SURFACE
      ?auto_2436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2434 ?auto_2435 ) ( SURFACE-AT ?auto_2433 ?auto_2435 ) ( CLEAR ?auto_2433 ) ( IS-CRATE ?auto_2432 ) ( AVAILABLE ?auto_2434 ) ( not ( = ?auto_2437 ?auto_2435 ) ) ( HOIST-AT ?auto_2438 ?auto_2437 ) ( AVAILABLE ?auto_2438 ) ( SURFACE-AT ?auto_2432 ?auto_2437 ) ( ON ?auto_2432 ?auto_2439 ) ( CLEAR ?auto_2432 ) ( TRUCK-AT ?auto_2436 ?auto_2435 ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( not ( = ?auto_2432 ?auto_2439 ) ) ( not ( = ?auto_2433 ?auto_2439 ) ) ( not ( = ?auto_2434 ?auto_2438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2436 ?auto_2435 ?auto_2437 )
      ( !LIFT ?auto_2438 ?auto_2432 ?auto_2439 ?auto_2437 )
      ( !LOAD ?auto_2438 ?auto_2432 ?auto_2436 ?auto_2437 )
      ( !DRIVE ?auto_2436 ?auto_2437 ?auto_2435 )
      ( !UNLOAD ?auto_2434 ?auto_2432 ?auto_2436 ?auto_2435 )
      ( !DROP ?auto_2434 ?auto_2432 ?auto_2433 ?auto_2435 )
      ( MAKE-ON-VERIFY ?auto_2432 ?auto_2433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2442 - SURFACE
      ?auto_2443 - SURFACE
    )
    :vars
    (
      ?auto_2444 - HOIST
      ?auto_2445 - PLACE
      ?auto_2447 - PLACE
      ?auto_2448 - HOIST
      ?auto_2449 - SURFACE
      ?auto_2446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444 ?auto_2445 ) ( SURFACE-AT ?auto_2443 ?auto_2445 ) ( CLEAR ?auto_2443 ) ( IS-CRATE ?auto_2442 ) ( AVAILABLE ?auto_2444 ) ( not ( = ?auto_2447 ?auto_2445 ) ) ( HOIST-AT ?auto_2448 ?auto_2447 ) ( AVAILABLE ?auto_2448 ) ( SURFACE-AT ?auto_2442 ?auto_2447 ) ( ON ?auto_2442 ?auto_2449 ) ( CLEAR ?auto_2442 ) ( TRUCK-AT ?auto_2446 ?auto_2445 ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( not ( = ?auto_2442 ?auto_2449 ) ) ( not ( = ?auto_2443 ?auto_2449 ) ) ( not ( = ?auto_2444 ?auto_2448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2446 ?auto_2445 ?auto_2447 )
      ( !LIFT ?auto_2448 ?auto_2442 ?auto_2449 ?auto_2447 )
      ( !LOAD ?auto_2448 ?auto_2442 ?auto_2446 ?auto_2447 )
      ( !DRIVE ?auto_2446 ?auto_2447 ?auto_2445 )
      ( !UNLOAD ?auto_2444 ?auto_2442 ?auto_2446 ?auto_2445 )
      ( !DROP ?auto_2444 ?auto_2442 ?auto_2443 ?auto_2445 )
      ( MAKE-ON-VERIFY ?auto_2442 ?auto_2443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2452 - SURFACE
      ?auto_2453 - SURFACE
    )
    :vars
    (
      ?auto_2454 - HOIST
      ?auto_2455 - PLACE
      ?auto_2457 - PLACE
      ?auto_2458 - HOIST
      ?auto_2459 - SURFACE
      ?auto_2456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2454 ?auto_2455 ) ( SURFACE-AT ?auto_2453 ?auto_2455 ) ( CLEAR ?auto_2453 ) ( IS-CRATE ?auto_2452 ) ( AVAILABLE ?auto_2454 ) ( not ( = ?auto_2457 ?auto_2455 ) ) ( HOIST-AT ?auto_2458 ?auto_2457 ) ( AVAILABLE ?auto_2458 ) ( SURFACE-AT ?auto_2452 ?auto_2457 ) ( ON ?auto_2452 ?auto_2459 ) ( CLEAR ?auto_2452 ) ( TRUCK-AT ?auto_2456 ?auto_2455 ) ( not ( = ?auto_2452 ?auto_2453 ) ) ( not ( = ?auto_2452 ?auto_2459 ) ) ( not ( = ?auto_2453 ?auto_2459 ) ) ( not ( = ?auto_2454 ?auto_2458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2456 ?auto_2455 ?auto_2457 )
      ( !LIFT ?auto_2458 ?auto_2452 ?auto_2459 ?auto_2457 )
      ( !LOAD ?auto_2458 ?auto_2452 ?auto_2456 ?auto_2457 )
      ( !DRIVE ?auto_2456 ?auto_2457 ?auto_2455 )
      ( !UNLOAD ?auto_2454 ?auto_2452 ?auto_2456 ?auto_2455 )
      ( !DROP ?auto_2454 ?auto_2452 ?auto_2453 ?auto_2455 )
      ( MAKE-ON-VERIFY ?auto_2452 ?auto_2453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2462 - SURFACE
      ?auto_2463 - SURFACE
    )
    :vars
    (
      ?auto_2464 - HOIST
      ?auto_2465 - PLACE
      ?auto_2467 - PLACE
      ?auto_2468 - HOIST
      ?auto_2469 - SURFACE
      ?auto_2466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2464 ?auto_2465 ) ( SURFACE-AT ?auto_2463 ?auto_2465 ) ( CLEAR ?auto_2463 ) ( IS-CRATE ?auto_2462 ) ( AVAILABLE ?auto_2464 ) ( not ( = ?auto_2467 ?auto_2465 ) ) ( HOIST-AT ?auto_2468 ?auto_2467 ) ( AVAILABLE ?auto_2468 ) ( SURFACE-AT ?auto_2462 ?auto_2467 ) ( ON ?auto_2462 ?auto_2469 ) ( CLEAR ?auto_2462 ) ( TRUCK-AT ?auto_2466 ?auto_2465 ) ( not ( = ?auto_2462 ?auto_2463 ) ) ( not ( = ?auto_2462 ?auto_2469 ) ) ( not ( = ?auto_2463 ?auto_2469 ) ) ( not ( = ?auto_2464 ?auto_2468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2466 ?auto_2465 ?auto_2467 )
      ( !LIFT ?auto_2468 ?auto_2462 ?auto_2469 ?auto_2467 )
      ( !LOAD ?auto_2468 ?auto_2462 ?auto_2466 ?auto_2467 )
      ( !DRIVE ?auto_2466 ?auto_2467 ?auto_2465 )
      ( !UNLOAD ?auto_2464 ?auto_2462 ?auto_2466 ?auto_2465 )
      ( !DROP ?auto_2464 ?auto_2462 ?auto_2463 ?auto_2465 )
      ( MAKE-ON-VERIFY ?auto_2462 ?auto_2463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2472 - SURFACE
      ?auto_2473 - SURFACE
    )
    :vars
    (
      ?auto_2474 - HOIST
      ?auto_2475 - PLACE
      ?auto_2477 - PLACE
      ?auto_2478 - HOIST
      ?auto_2479 - SURFACE
      ?auto_2476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2474 ?auto_2475 ) ( SURFACE-AT ?auto_2473 ?auto_2475 ) ( CLEAR ?auto_2473 ) ( IS-CRATE ?auto_2472 ) ( AVAILABLE ?auto_2474 ) ( not ( = ?auto_2477 ?auto_2475 ) ) ( HOIST-AT ?auto_2478 ?auto_2477 ) ( AVAILABLE ?auto_2478 ) ( SURFACE-AT ?auto_2472 ?auto_2477 ) ( ON ?auto_2472 ?auto_2479 ) ( CLEAR ?auto_2472 ) ( TRUCK-AT ?auto_2476 ?auto_2475 ) ( not ( = ?auto_2472 ?auto_2473 ) ) ( not ( = ?auto_2472 ?auto_2479 ) ) ( not ( = ?auto_2473 ?auto_2479 ) ) ( not ( = ?auto_2474 ?auto_2478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2476 ?auto_2475 ?auto_2477 )
      ( !LIFT ?auto_2478 ?auto_2472 ?auto_2479 ?auto_2477 )
      ( !LOAD ?auto_2478 ?auto_2472 ?auto_2476 ?auto_2477 )
      ( !DRIVE ?auto_2476 ?auto_2477 ?auto_2475 )
      ( !UNLOAD ?auto_2474 ?auto_2472 ?auto_2476 ?auto_2475 )
      ( !DROP ?auto_2474 ?auto_2472 ?auto_2473 ?auto_2475 )
      ( MAKE-ON-VERIFY ?auto_2472 ?auto_2473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2482 - SURFACE
      ?auto_2483 - SURFACE
    )
    :vars
    (
      ?auto_2484 - HOIST
      ?auto_2485 - PLACE
      ?auto_2487 - PLACE
      ?auto_2488 - HOIST
      ?auto_2489 - SURFACE
      ?auto_2486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2484 ?auto_2485 ) ( SURFACE-AT ?auto_2483 ?auto_2485 ) ( CLEAR ?auto_2483 ) ( IS-CRATE ?auto_2482 ) ( AVAILABLE ?auto_2484 ) ( not ( = ?auto_2487 ?auto_2485 ) ) ( HOIST-AT ?auto_2488 ?auto_2487 ) ( AVAILABLE ?auto_2488 ) ( SURFACE-AT ?auto_2482 ?auto_2487 ) ( ON ?auto_2482 ?auto_2489 ) ( CLEAR ?auto_2482 ) ( TRUCK-AT ?auto_2486 ?auto_2485 ) ( not ( = ?auto_2482 ?auto_2483 ) ) ( not ( = ?auto_2482 ?auto_2489 ) ) ( not ( = ?auto_2483 ?auto_2489 ) ) ( not ( = ?auto_2484 ?auto_2488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2486 ?auto_2485 ?auto_2487 )
      ( !LIFT ?auto_2488 ?auto_2482 ?auto_2489 ?auto_2487 )
      ( !LOAD ?auto_2488 ?auto_2482 ?auto_2486 ?auto_2487 )
      ( !DRIVE ?auto_2486 ?auto_2487 ?auto_2485 )
      ( !UNLOAD ?auto_2484 ?auto_2482 ?auto_2486 ?auto_2485 )
      ( !DROP ?auto_2484 ?auto_2482 ?auto_2483 ?auto_2485 )
      ( MAKE-ON-VERIFY ?auto_2482 ?auto_2483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2492 - SURFACE
      ?auto_2493 - SURFACE
    )
    :vars
    (
      ?auto_2494 - HOIST
      ?auto_2495 - PLACE
      ?auto_2497 - PLACE
      ?auto_2498 - HOIST
      ?auto_2499 - SURFACE
      ?auto_2496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2494 ?auto_2495 ) ( SURFACE-AT ?auto_2493 ?auto_2495 ) ( CLEAR ?auto_2493 ) ( IS-CRATE ?auto_2492 ) ( AVAILABLE ?auto_2494 ) ( not ( = ?auto_2497 ?auto_2495 ) ) ( HOIST-AT ?auto_2498 ?auto_2497 ) ( AVAILABLE ?auto_2498 ) ( SURFACE-AT ?auto_2492 ?auto_2497 ) ( ON ?auto_2492 ?auto_2499 ) ( CLEAR ?auto_2492 ) ( TRUCK-AT ?auto_2496 ?auto_2495 ) ( not ( = ?auto_2492 ?auto_2493 ) ) ( not ( = ?auto_2492 ?auto_2499 ) ) ( not ( = ?auto_2493 ?auto_2499 ) ) ( not ( = ?auto_2494 ?auto_2498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2496 ?auto_2495 ?auto_2497 )
      ( !LIFT ?auto_2498 ?auto_2492 ?auto_2499 ?auto_2497 )
      ( !LOAD ?auto_2498 ?auto_2492 ?auto_2496 ?auto_2497 )
      ( !DRIVE ?auto_2496 ?auto_2497 ?auto_2495 )
      ( !UNLOAD ?auto_2494 ?auto_2492 ?auto_2496 ?auto_2495 )
      ( !DROP ?auto_2494 ?auto_2492 ?auto_2493 ?auto_2495 )
      ( MAKE-ON-VERIFY ?auto_2492 ?auto_2493 ) )
  )

)

