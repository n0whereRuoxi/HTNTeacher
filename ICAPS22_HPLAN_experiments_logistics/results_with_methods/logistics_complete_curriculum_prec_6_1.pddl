( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2458 - OBJ
      ?auto_2459 - LOCATION
    )
    :vars
    (
      ?auto_2460 - TRUCK
      ?auto_2461 - LOCATION
      ?auto_2462 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2460 ?auto_2461 ) ( IN-CITY ?auto_2461 ?auto_2462 ) ( IN-CITY ?auto_2459 ?auto_2462 ) ( not ( = ?auto_2459 ?auto_2461 ) ) ( OBJ-AT ?auto_2458 ?auto_2461 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2458 ?auto_2460 ?auto_2461 )
      ( !DRIVE-TRUCK ?auto_2460 ?auto_2461 ?auto_2459 ?auto_2462 )
      ( !UNLOAD-TRUCK ?auto_2458 ?auto_2460 ?auto_2459 )
      ( DELIVER-1PKG-VERIFY ?auto_2458 ?auto_2459 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2465 - OBJ
      ?auto_2466 - LOCATION
    )
    :vars
    (
      ?auto_2469 - LOCATION
      ?auto_2468 - CITY
      ?auto_2467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2469 ?auto_2468 ) ( IN-CITY ?auto_2466 ?auto_2468 ) ( not ( = ?auto_2466 ?auto_2469 ) ) ( OBJ-AT ?auto_2465 ?auto_2469 ) ( TRUCK-AT ?auto_2467 ?auto_2466 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2467 ?auto_2466 ?auto_2469 ?auto_2468 )
      ( DELIVER-1PKG ?auto_2465 ?auto_2466 )
      ( DELIVER-1PKG-VERIFY ?auto_2465 ?auto_2466 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2472 - OBJ
      ?auto_2473 - LOCATION
    )
    :vars
    (
      ?auto_2474 - TRUCK
      ?auto_2475 - LOCATION
      ?auto_2476 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2474 ?auto_2475 ) ( IN-CITY ?auto_2475 ?auto_2476 ) ( IN-CITY ?auto_2473 ?auto_2476 ) ( not ( = ?auto_2473 ?auto_2475 ) ) ( OBJ-AT ?auto_2472 ?auto_2475 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2472 ?auto_2474 ?auto_2475 )
      ( !DRIVE-TRUCK ?auto_2474 ?auto_2475 ?auto_2473 ?auto_2476 )
      ( !UNLOAD-TRUCK ?auto_2472 ?auto_2474 ?auto_2473 )
      ( DELIVER-1PKG-VERIFY ?auto_2472 ?auto_2473 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2479 - OBJ
      ?auto_2480 - LOCATION
    )
    :vars
    (
      ?auto_2481 - LOCATION
      ?auto_2483 - CITY
      ?auto_2482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2481 ?auto_2483 ) ( IN-CITY ?auto_2480 ?auto_2483 ) ( not ( = ?auto_2480 ?auto_2481 ) ) ( OBJ-AT ?auto_2479 ?auto_2481 ) ( TRUCK-AT ?auto_2482 ?auto_2480 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2482 ?auto_2480 ?auto_2481 ?auto_2483 )
      ( DELIVER-1PKG ?auto_2479 ?auto_2480 )
      ( DELIVER-1PKG-VERIFY ?auto_2479 ?auto_2480 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2487 - OBJ
      ?auto_2489 - OBJ
      ?auto_2488 - LOCATION
    )
    :vars
    (
      ?auto_2491 - LOCATION
      ?auto_2492 - CITY
      ?auto_2490 - TRUCK
      ?auto_2493 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2489 ?auto_2487 ) ( IN-CITY ?auto_2491 ?auto_2492 ) ( IN-CITY ?auto_2488 ?auto_2492 ) ( not ( = ?auto_2488 ?auto_2491 ) ) ( OBJ-AT ?auto_2489 ?auto_2491 ) ( TRUCK-AT ?auto_2490 ?auto_2493 ) ( IN-CITY ?auto_2493 ?auto_2492 ) ( not ( = ?auto_2488 ?auto_2493 ) ) ( OBJ-AT ?auto_2487 ?auto_2493 ) ( not ( = ?auto_2487 ?auto_2489 ) ) ( not ( = ?auto_2491 ?auto_2493 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2487 ?auto_2488 )
      ( DELIVER-1PKG ?auto_2489 ?auto_2488 )
      ( DELIVER-2PKG-VERIFY ?auto_2487 ?auto_2489 ?auto_2488 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2497 - OBJ
      ?auto_2499 - OBJ
      ?auto_2498 - LOCATION
    )
    :vars
    (
      ?auto_2500 - LOCATION
      ?auto_2502 - CITY
      ?auto_2501 - LOCATION
      ?auto_2503 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2499 ?auto_2497 ) ( IN-CITY ?auto_2500 ?auto_2502 ) ( IN-CITY ?auto_2498 ?auto_2502 ) ( not ( = ?auto_2498 ?auto_2500 ) ) ( OBJ-AT ?auto_2499 ?auto_2500 ) ( IN-CITY ?auto_2501 ?auto_2502 ) ( not ( = ?auto_2498 ?auto_2501 ) ) ( OBJ-AT ?auto_2497 ?auto_2501 ) ( not ( = ?auto_2497 ?auto_2499 ) ) ( not ( = ?auto_2500 ?auto_2501 ) ) ( TRUCK-AT ?auto_2503 ?auto_2498 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2503 ?auto_2498 ?auto_2501 ?auto_2502 )
      ( DELIVER-2PKG ?auto_2497 ?auto_2499 ?auto_2498 )
      ( DELIVER-2PKG-VERIFY ?auto_2497 ?auto_2499 ?auto_2498 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2506 - OBJ
      ?auto_2507 - LOCATION
    )
    :vars
    (
      ?auto_2508 - TRUCK
      ?auto_2509 - LOCATION
      ?auto_2510 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2508 ?auto_2509 ) ( IN-CITY ?auto_2509 ?auto_2510 ) ( IN-CITY ?auto_2507 ?auto_2510 ) ( not ( = ?auto_2507 ?auto_2509 ) ) ( OBJ-AT ?auto_2506 ?auto_2509 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2506 ?auto_2508 ?auto_2509 )
      ( !DRIVE-TRUCK ?auto_2508 ?auto_2509 ?auto_2507 ?auto_2510 )
      ( !UNLOAD-TRUCK ?auto_2506 ?auto_2508 ?auto_2507 )
      ( DELIVER-1PKG-VERIFY ?auto_2506 ?auto_2507 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2513 - OBJ
      ?auto_2514 - LOCATION
    )
    :vars
    (
      ?auto_2516 - LOCATION
      ?auto_2517 - CITY
      ?auto_2515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2516 ?auto_2517 ) ( IN-CITY ?auto_2514 ?auto_2517 ) ( not ( = ?auto_2514 ?auto_2516 ) ) ( OBJ-AT ?auto_2513 ?auto_2516 ) ( TRUCK-AT ?auto_2515 ?auto_2514 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2515 ?auto_2514 ?auto_2516 ?auto_2517 )
      ( DELIVER-1PKG ?auto_2513 ?auto_2514 )
      ( DELIVER-1PKG-VERIFY ?auto_2513 ?auto_2514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2522 - OBJ
      ?auto_2524 - OBJ
      ?auto_2525 - OBJ
      ?auto_2523 - LOCATION
    )
    :vars
    (
      ?auto_2528 - LOCATION
      ?auto_2527 - CITY
      ?auto_2526 - TRUCK
      ?auto_2529 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2524 ?auto_2522 ) ( GREATER-THAN ?auto_2525 ?auto_2522 ) ( GREATER-THAN ?auto_2525 ?auto_2524 ) ( IN-CITY ?auto_2528 ?auto_2527 ) ( IN-CITY ?auto_2523 ?auto_2527 ) ( not ( = ?auto_2523 ?auto_2528 ) ) ( OBJ-AT ?auto_2525 ?auto_2528 ) ( OBJ-AT ?auto_2524 ?auto_2528 ) ( TRUCK-AT ?auto_2526 ?auto_2529 ) ( IN-CITY ?auto_2529 ?auto_2527 ) ( not ( = ?auto_2523 ?auto_2529 ) ) ( OBJ-AT ?auto_2522 ?auto_2529 ) ( not ( = ?auto_2522 ?auto_2524 ) ) ( not ( = ?auto_2528 ?auto_2529 ) ) ( not ( = ?auto_2522 ?auto_2525 ) ) ( not ( = ?auto_2524 ?auto_2525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2522 ?auto_2524 ?auto_2523 )
      ( DELIVER-1PKG ?auto_2525 ?auto_2523 )
      ( DELIVER-3PKG-VERIFY ?auto_2522 ?auto_2524 ?auto_2525 ?auto_2523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2534 - OBJ
      ?auto_2536 - OBJ
      ?auto_2537 - OBJ
      ?auto_2535 - LOCATION
    )
    :vars
    (
      ?auto_2540 - LOCATION
      ?auto_2541 - CITY
      ?auto_2538 - LOCATION
      ?auto_2539 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2536 ?auto_2534 ) ( GREATER-THAN ?auto_2537 ?auto_2534 ) ( GREATER-THAN ?auto_2537 ?auto_2536 ) ( IN-CITY ?auto_2540 ?auto_2541 ) ( IN-CITY ?auto_2535 ?auto_2541 ) ( not ( = ?auto_2535 ?auto_2540 ) ) ( OBJ-AT ?auto_2537 ?auto_2540 ) ( OBJ-AT ?auto_2536 ?auto_2540 ) ( IN-CITY ?auto_2538 ?auto_2541 ) ( not ( = ?auto_2535 ?auto_2538 ) ) ( OBJ-AT ?auto_2534 ?auto_2538 ) ( not ( = ?auto_2534 ?auto_2536 ) ) ( not ( = ?auto_2540 ?auto_2538 ) ) ( not ( = ?auto_2534 ?auto_2537 ) ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( TRUCK-AT ?auto_2539 ?auto_2535 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2539 ?auto_2535 ?auto_2538 ?auto_2541 )
      ( DELIVER-3PKG ?auto_2534 ?auto_2536 ?auto_2537 ?auto_2535 )
      ( DELIVER-3PKG-VERIFY ?auto_2534 ?auto_2536 ?auto_2537 ?auto_2535 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2544 - OBJ
      ?auto_2545 - LOCATION
    )
    :vars
    (
      ?auto_2546 - TRUCK
      ?auto_2547 - LOCATION
      ?auto_2548 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2546 ?auto_2547 ) ( IN-CITY ?auto_2547 ?auto_2548 ) ( IN-CITY ?auto_2545 ?auto_2548 ) ( not ( = ?auto_2545 ?auto_2547 ) ) ( OBJ-AT ?auto_2544 ?auto_2547 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2544 ?auto_2546 ?auto_2547 )
      ( !DRIVE-TRUCK ?auto_2546 ?auto_2547 ?auto_2545 ?auto_2548 )
      ( !UNLOAD-TRUCK ?auto_2544 ?auto_2546 ?auto_2545 )
      ( DELIVER-1PKG-VERIFY ?auto_2544 ?auto_2545 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2551 - OBJ
      ?auto_2552 - LOCATION
    )
    :vars
    (
      ?auto_2553 - LOCATION
      ?auto_2555 - CITY
      ?auto_2554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2553 ?auto_2555 ) ( IN-CITY ?auto_2552 ?auto_2555 ) ( not ( = ?auto_2552 ?auto_2553 ) ) ( OBJ-AT ?auto_2551 ?auto_2553 ) ( TRUCK-AT ?auto_2554 ?auto_2552 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2554 ?auto_2552 ?auto_2553 ?auto_2555 )
      ( DELIVER-1PKG ?auto_2551 ?auto_2552 )
      ( DELIVER-1PKG-VERIFY ?auto_2551 ?auto_2552 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2561 - OBJ
      ?auto_2563 - OBJ
      ?auto_2564 - OBJ
      ?auto_2565 - OBJ
      ?auto_2562 - LOCATION
    )
    :vars
    (
      ?auto_2567 - LOCATION
      ?auto_2568 - CITY
      ?auto_2570 - LOCATION
      ?auto_2566 - TRUCK
      ?auto_2569 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2563 ?auto_2561 ) ( GREATER-THAN ?auto_2564 ?auto_2561 ) ( GREATER-THAN ?auto_2564 ?auto_2563 ) ( GREATER-THAN ?auto_2565 ?auto_2561 ) ( GREATER-THAN ?auto_2565 ?auto_2563 ) ( GREATER-THAN ?auto_2565 ?auto_2564 ) ( IN-CITY ?auto_2567 ?auto_2568 ) ( IN-CITY ?auto_2562 ?auto_2568 ) ( not ( = ?auto_2562 ?auto_2567 ) ) ( OBJ-AT ?auto_2565 ?auto_2567 ) ( IN-CITY ?auto_2570 ?auto_2568 ) ( not ( = ?auto_2562 ?auto_2570 ) ) ( OBJ-AT ?auto_2564 ?auto_2570 ) ( OBJ-AT ?auto_2563 ?auto_2570 ) ( TRUCK-AT ?auto_2566 ?auto_2569 ) ( IN-CITY ?auto_2569 ?auto_2568 ) ( not ( = ?auto_2562 ?auto_2569 ) ) ( OBJ-AT ?auto_2561 ?auto_2569 ) ( not ( = ?auto_2561 ?auto_2563 ) ) ( not ( = ?auto_2570 ?auto_2569 ) ) ( not ( = ?auto_2561 ?auto_2564 ) ) ( not ( = ?auto_2563 ?auto_2564 ) ) ( not ( = ?auto_2561 ?auto_2565 ) ) ( not ( = ?auto_2563 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2567 ?auto_2570 ) ) ( not ( = ?auto_2567 ?auto_2569 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2561 ?auto_2563 ?auto_2564 ?auto_2562 )
      ( DELIVER-1PKG ?auto_2565 ?auto_2562 )
      ( DELIVER-4PKG-VERIFY ?auto_2561 ?auto_2563 ?auto_2564 ?auto_2565 ?auto_2562 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2576 - OBJ
      ?auto_2578 - OBJ
      ?auto_2579 - OBJ
      ?auto_2580 - OBJ
      ?auto_2577 - LOCATION
    )
    :vars
    (
      ?auto_2584 - LOCATION
      ?auto_2585 - CITY
      ?auto_2581 - LOCATION
      ?auto_2583 - LOCATION
      ?auto_2582 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2578 ?auto_2576 ) ( GREATER-THAN ?auto_2579 ?auto_2576 ) ( GREATER-THAN ?auto_2579 ?auto_2578 ) ( GREATER-THAN ?auto_2580 ?auto_2576 ) ( GREATER-THAN ?auto_2580 ?auto_2578 ) ( GREATER-THAN ?auto_2580 ?auto_2579 ) ( IN-CITY ?auto_2584 ?auto_2585 ) ( IN-CITY ?auto_2577 ?auto_2585 ) ( not ( = ?auto_2577 ?auto_2584 ) ) ( OBJ-AT ?auto_2580 ?auto_2584 ) ( IN-CITY ?auto_2581 ?auto_2585 ) ( not ( = ?auto_2577 ?auto_2581 ) ) ( OBJ-AT ?auto_2579 ?auto_2581 ) ( OBJ-AT ?auto_2578 ?auto_2581 ) ( IN-CITY ?auto_2583 ?auto_2585 ) ( not ( = ?auto_2577 ?auto_2583 ) ) ( OBJ-AT ?auto_2576 ?auto_2583 ) ( not ( = ?auto_2576 ?auto_2578 ) ) ( not ( = ?auto_2581 ?auto_2583 ) ) ( not ( = ?auto_2576 ?auto_2579 ) ) ( not ( = ?auto_2578 ?auto_2579 ) ) ( not ( = ?auto_2576 ?auto_2580 ) ) ( not ( = ?auto_2578 ?auto_2580 ) ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( not ( = ?auto_2584 ?auto_2581 ) ) ( not ( = ?auto_2584 ?auto_2583 ) ) ( TRUCK-AT ?auto_2582 ?auto_2577 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2582 ?auto_2577 ?auto_2583 ?auto_2585 )
      ( DELIVER-4PKG ?auto_2576 ?auto_2578 ?auto_2579 ?auto_2580 ?auto_2577 )
      ( DELIVER-4PKG-VERIFY ?auto_2576 ?auto_2578 ?auto_2579 ?auto_2580 ?auto_2577 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2588 - OBJ
      ?auto_2589 - LOCATION
    )
    :vars
    (
      ?auto_2590 - TRUCK
      ?auto_2591 - LOCATION
      ?auto_2592 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2590 ?auto_2591 ) ( IN-CITY ?auto_2591 ?auto_2592 ) ( IN-CITY ?auto_2589 ?auto_2592 ) ( not ( = ?auto_2589 ?auto_2591 ) ) ( OBJ-AT ?auto_2588 ?auto_2591 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2588 ?auto_2590 ?auto_2591 )
      ( !DRIVE-TRUCK ?auto_2590 ?auto_2591 ?auto_2589 ?auto_2592 )
      ( !UNLOAD-TRUCK ?auto_2588 ?auto_2590 ?auto_2589 )
      ( DELIVER-1PKG-VERIFY ?auto_2588 ?auto_2589 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2595 - OBJ
      ?auto_2596 - LOCATION
    )
    :vars
    (
      ?auto_2599 - LOCATION
      ?auto_2597 - CITY
      ?auto_2598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2599 ?auto_2597 ) ( IN-CITY ?auto_2596 ?auto_2597 ) ( not ( = ?auto_2596 ?auto_2599 ) ) ( OBJ-AT ?auto_2595 ?auto_2599 ) ( TRUCK-AT ?auto_2598 ?auto_2596 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2598 ?auto_2596 ?auto_2599 ?auto_2597 )
      ( DELIVER-1PKG ?auto_2595 ?auto_2596 )
      ( DELIVER-1PKG-VERIFY ?auto_2595 ?auto_2596 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2606 - OBJ
      ?auto_2608 - OBJ
      ?auto_2609 - OBJ
      ?auto_2611 - OBJ
      ?auto_2610 - OBJ
      ?auto_2607 - LOCATION
    )
    :vars
    (
      ?auto_2614 - LOCATION
      ?auto_2612 - CITY
      ?auto_2617 - LOCATION
      ?auto_2615 - LOCATION
      ?auto_2613 - TRUCK
      ?auto_2616 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2608 ?auto_2606 ) ( GREATER-THAN ?auto_2609 ?auto_2606 ) ( GREATER-THAN ?auto_2609 ?auto_2608 ) ( GREATER-THAN ?auto_2611 ?auto_2606 ) ( GREATER-THAN ?auto_2611 ?auto_2608 ) ( GREATER-THAN ?auto_2611 ?auto_2609 ) ( GREATER-THAN ?auto_2610 ?auto_2606 ) ( GREATER-THAN ?auto_2610 ?auto_2608 ) ( GREATER-THAN ?auto_2610 ?auto_2609 ) ( GREATER-THAN ?auto_2610 ?auto_2611 ) ( IN-CITY ?auto_2614 ?auto_2612 ) ( IN-CITY ?auto_2607 ?auto_2612 ) ( not ( = ?auto_2607 ?auto_2614 ) ) ( OBJ-AT ?auto_2610 ?auto_2614 ) ( IN-CITY ?auto_2617 ?auto_2612 ) ( not ( = ?auto_2607 ?auto_2617 ) ) ( OBJ-AT ?auto_2611 ?auto_2617 ) ( IN-CITY ?auto_2615 ?auto_2612 ) ( not ( = ?auto_2607 ?auto_2615 ) ) ( OBJ-AT ?auto_2609 ?auto_2615 ) ( OBJ-AT ?auto_2608 ?auto_2615 ) ( TRUCK-AT ?auto_2613 ?auto_2616 ) ( IN-CITY ?auto_2616 ?auto_2612 ) ( not ( = ?auto_2607 ?auto_2616 ) ) ( OBJ-AT ?auto_2606 ?auto_2616 ) ( not ( = ?auto_2606 ?auto_2608 ) ) ( not ( = ?auto_2615 ?auto_2616 ) ) ( not ( = ?auto_2606 ?auto_2609 ) ) ( not ( = ?auto_2608 ?auto_2609 ) ) ( not ( = ?auto_2606 ?auto_2611 ) ) ( not ( = ?auto_2608 ?auto_2611 ) ) ( not ( = ?auto_2609 ?auto_2611 ) ) ( not ( = ?auto_2617 ?auto_2615 ) ) ( not ( = ?auto_2617 ?auto_2616 ) ) ( not ( = ?auto_2606 ?auto_2610 ) ) ( not ( = ?auto_2608 ?auto_2610 ) ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( not ( = ?auto_2611 ?auto_2610 ) ) ( not ( = ?auto_2614 ?auto_2617 ) ) ( not ( = ?auto_2614 ?auto_2615 ) ) ( not ( = ?auto_2614 ?auto_2616 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2606 ?auto_2608 ?auto_2609 ?auto_2611 ?auto_2607 )
      ( DELIVER-1PKG ?auto_2610 ?auto_2607 )
      ( DELIVER-5PKG-VERIFY ?auto_2606 ?auto_2608 ?auto_2609 ?auto_2611 ?auto_2610 ?auto_2607 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2624 - OBJ
      ?auto_2626 - OBJ
      ?auto_2627 - OBJ
      ?auto_2629 - OBJ
      ?auto_2628 - OBJ
      ?auto_2625 - LOCATION
    )
    :vars
    (
      ?auto_2630 - LOCATION
      ?auto_2633 - CITY
      ?auto_2631 - LOCATION
      ?auto_2635 - LOCATION
      ?auto_2632 - LOCATION
      ?auto_2634 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2626 ?auto_2624 ) ( GREATER-THAN ?auto_2627 ?auto_2624 ) ( GREATER-THAN ?auto_2627 ?auto_2626 ) ( GREATER-THAN ?auto_2629 ?auto_2624 ) ( GREATER-THAN ?auto_2629 ?auto_2626 ) ( GREATER-THAN ?auto_2629 ?auto_2627 ) ( GREATER-THAN ?auto_2628 ?auto_2624 ) ( GREATER-THAN ?auto_2628 ?auto_2626 ) ( GREATER-THAN ?auto_2628 ?auto_2627 ) ( GREATER-THAN ?auto_2628 ?auto_2629 ) ( IN-CITY ?auto_2630 ?auto_2633 ) ( IN-CITY ?auto_2625 ?auto_2633 ) ( not ( = ?auto_2625 ?auto_2630 ) ) ( OBJ-AT ?auto_2628 ?auto_2630 ) ( IN-CITY ?auto_2631 ?auto_2633 ) ( not ( = ?auto_2625 ?auto_2631 ) ) ( OBJ-AT ?auto_2629 ?auto_2631 ) ( IN-CITY ?auto_2635 ?auto_2633 ) ( not ( = ?auto_2625 ?auto_2635 ) ) ( OBJ-AT ?auto_2627 ?auto_2635 ) ( OBJ-AT ?auto_2626 ?auto_2635 ) ( IN-CITY ?auto_2632 ?auto_2633 ) ( not ( = ?auto_2625 ?auto_2632 ) ) ( OBJ-AT ?auto_2624 ?auto_2632 ) ( not ( = ?auto_2624 ?auto_2626 ) ) ( not ( = ?auto_2635 ?auto_2632 ) ) ( not ( = ?auto_2624 ?auto_2627 ) ) ( not ( = ?auto_2626 ?auto_2627 ) ) ( not ( = ?auto_2624 ?auto_2629 ) ) ( not ( = ?auto_2626 ?auto_2629 ) ) ( not ( = ?auto_2627 ?auto_2629 ) ) ( not ( = ?auto_2631 ?auto_2635 ) ) ( not ( = ?auto_2631 ?auto_2632 ) ) ( not ( = ?auto_2624 ?auto_2628 ) ) ( not ( = ?auto_2626 ?auto_2628 ) ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( not ( = ?auto_2629 ?auto_2628 ) ) ( not ( = ?auto_2630 ?auto_2631 ) ) ( not ( = ?auto_2630 ?auto_2635 ) ) ( not ( = ?auto_2630 ?auto_2632 ) ) ( TRUCK-AT ?auto_2634 ?auto_2625 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2634 ?auto_2625 ?auto_2632 ?auto_2633 )
      ( DELIVER-5PKG ?auto_2624 ?auto_2626 ?auto_2627 ?auto_2629 ?auto_2628 ?auto_2625 )
      ( DELIVER-5PKG-VERIFY ?auto_2624 ?auto_2626 ?auto_2627 ?auto_2629 ?auto_2628 ?auto_2625 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2638 - OBJ
      ?auto_2639 - LOCATION
    )
    :vars
    (
      ?auto_2640 - TRUCK
      ?auto_2641 - LOCATION
      ?auto_2642 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2640 ?auto_2641 ) ( IN-CITY ?auto_2641 ?auto_2642 ) ( IN-CITY ?auto_2639 ?auto_2642 ) ( not ( = ?auto_2639 ?auto_2641 ) ) ( OBJ-AT ?auto_2638 ?auto_2641 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2638 ?auto_2640 ?auto_2641 )
      ( !DRIVE-TRUCK ?auto_2640 ?auto_2641 ?auto_2639 ?auto_2642 )
      ( !UNLOAD-TRUCK ?auto_2638 ?auto_2640 ?auto_2639 )
      ( DELIVER-1PKG-VERIFY ?auto_2638 ?auto_2639 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2645 - OBJ
      ?auto_2646 - LOCATION
    )
    :vars
    (
      ?auto_2649 - LOCATION
      ?auto_2647 - CITY
      ?auto_2648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2649 ?auto_2647 ) ( IN-CITY ?auto_2646 ?auto_2647 ) ( not ( = ?auto_2646 ?auto_2649 ) ) ( OBJ-AT ?auto_2645 ?auto_2649 ) ( TRUCK-AT ?auto_2648 ?auto_2646 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2648 ?auto_2646 ?auto_2649 ?auto_2647 )
      ( DELIVER-1PKG ?auto_2645 ?auto_2646 )
      ( DELIVER-1PKG-VERIFY ?auto_2645 ?auto_2646 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2657 - OBJ
      ?auto_2659 - OBJ
      ?auto_2660 - OBJ
      ?auto_2662 - OBJ
      ?auto_2661 - OBJ
      ?auto_2663 - OBJ
      ?auto_2658 - LOCATION
    )
    :vars
    (
      ?auto_2664 - LOCATION
      ?auto_2665 - CITY
      ?auto_2667 - LOCATION
      ?auto_2668 - LOCATION
      ?auto_2666 - TRUCK
      ?auto_2669 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2659 ?auto_2657 ) ( GREATER-THAN ?auto_2660 ?auto_2657 ) ( GREATER-THAN ?auto_2660 ?auto_2659 ) ( GREATER-THAN ?auto_2662 ?auto_2657 ) ( GREATER-THAN ?auto_2662 ?auto_2659 ) ( GREATER-THAN ?auto_2662 ?auto_2660 ) ( GREATER-THAN ?auto_2661 ?auto_2657 ) ( GREATER-THAN ?auto_2661 ?auto_2659 ) ( GREATER-THAN ?auto_2661 ?auto_2660 ) ( GREATER-THAN ?auto_2661 ?auto_2662 ) ( GREATER-THAN ?auto_2663 ?auto_2657 ) ( GREATER-THAN ?auto_2663 ?auto_2659 ) ( GREATER-THAN ?auto_2663 ?auto_2660 ) ( GREATER-THAN ?auto_2663 ?auto_2662 ) ( GREATER-THAN ?auto_2663 ?auto_2661 ) ( IN-CITY ?auto_2664 ?auto_2665 ) ( IN-CITY ?auto_2658 ?auto_2665 ) ( not ( = ?auto_2658 ?auto_2664 ) ) ( OBJ-AT ?auto_2663 ?auto_2664 ) ( IN-CITY ?auto_2667 ?auto_2665 ) ( not ( = ?auto_2658 ?auto_2667 ) ) ( OBJ-AT ?auto_2661 ?auto_2667 ) ( IN-CITY ?auto_2668 ?auto_2665 ) ( not ( = ?auto_2658 ?auto_2668 ) ) ( OBJ-AT ?auto_2662 ?auto_2668 ) ( OBJ-AT ?auto_2660 ?auto_2664 ) ( OBJ-AT ?auto_2659 ?auto_2664 ) ( TRUCK-AT ?auto_2666 ?auto_2669 ) ( IN-CITY ?auto_2669 ?auto_2665 ) ( not ( = ?auto_2658 ?auto_2669 ) ) ( OBJ-AT ?auto_2657 ?auto_2669 ) ( not ( = ?auto_2657 ?auto_2659 ) ) ( not ( = ?auto_2664 ?auto_2669 ) ) ( not ( = ?auto_2657 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( not ( = ?auto_2657 ?auto_2662 ) ) ( not ( = ?auto_2659 ?auto_2662 ) ) ( not ( = ?auto_2660 ?auto_2662 ) ) ( not ( = ?auto_2668 ?auto_2664 ) ) ( not ( = ?auto_2668 ?auto_2669 ) ) ( not ( = ?auto_2657 ?auto_2661 ) ) ( not ( = ?auto_2659 ?auto_2661 ) ) ( not ( = ?auto_2660 ?auto_2661 ) ) ( not ( = ?auto_2662 ?auto_2661 ) ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2667 ?auto_2664 ) ) ( not ( = ?auto_2667 ?auto_2669 ) ) ( not ( = ?auto_2657 ?auto_2663 ) ) ( not ( = ?auto_2659 ?auto_2663 ) ) ( not ( = ?auto_2660 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( not ( = ?auto_2661 ?auto_2663 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2657 ?auto_2659 ?auto_2660 ?auto_2662 ?auto_2661 ?auto_2658 )
      ( DELIVER-1PKG ?auto_2663 ?auto_2658 )
      ( DELIVER-6PKG-VERIFY ?auto_2657 ?auto_2659 ?auto_2660 ?auto_2662 ?auto_2661 ?auto_2663 ?auto_2658 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2677 - OBJ
      ?auto_2679 - OBJ
      ?auto_2680 - OBJ
      ?auto_2682 - OBJ
      ?auto_2681 - OBJ
      ?auto_2683 - OBJ
      ?auto_2678 - LOCATION
    )
    :vars
    (
      ?auto_2689 - LOCATION
      ?auto_2684 - CITY
      ?auto_2687 - LOCATION
      ?auto_2686 - LOCATION
      ?auto_2688 - LOCATION
      ?auto_2685 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2679 ?auto_2677 ) ( GREATER-THAN ?auto_2680 ?auto_2677 ) ( GREATER-THAN ?auto_2680 ?auto_2679 ) ( GREATER-THAN ?auto_2682 ?auto_2677 ) ( GREATER-THAN ?auto_2682 ?auto_2679 ) ( GREATER-THAN ?auto_2682 ?auto_2680 ) ( GREATER-THAN ?auto_2681 ?auto_2677 ) ( GREATER-THAN ?auto_2681 ?auto_2679 ) ( GREATER-THAN ?auto_2681 ?auto_2680 ) ( GREATER-THAN ?auto_2681 ?auto_2682 ) ( GREATER-THAN ?auto_2683 ?auto_2677 ) ( GREATER-THAN ?auto_2683 ?auto_2679 ) ( GREATER-THAN ?auto_2683 ?auto_2680 ) ( GREATER-THAN ?auto_2683 ?auto_2682 ) ( GREATER-THAN ?auto_2683 ?auto_2681 ) ( IN-CITY ?auto_2689 ?auto_2684 ) ( IN-CITY ?auto_2678 ?auto_2684 ) ( not ( = ?auto_2678 ?auto_2689 ) ) ( OBJ-AT ?auto_2683 ?auto_2689 ) ( IN-CITY ?auto_2687 ?auto_2684 ) ( not ( = ?auto_2678 ?auto_2687 ) ) ( OBJ-AT ?auto_2681 ?auto_2687 ) ( IN-CITY ?auto_2686 ?auto_2684 ) ( not ( = ?auto_2678 ?auto_2686 ) ) ( OBJ-AT ?auto_2682 ?auto_2686 ) ( OBJ-AT ?auto_2680 ?auto_2689 ) ( OBJ-AT ?auto_2679 ?auto_2689 ) ( IN-CITY ?auto_2688 ?auto_2684 ) ( not ( = ?auto_2678 ?auto_2688 ) ) ( OBJ-AT ?auto_2677 ?auto_2688 ) ( not ( = ?auto_2677 ?auto_2679 ) ) ( not ( = ?auto_2689 ?auto_2688 ) ) ( not ( = ?auto_2677 ?auto_2680 ) ) ( not ( = ?auto_2679 ?auto_2680 ) ) ( not ( = ?auto_2677 ?auto_2682 ) ) ( not ( = ?auto_2679 ?auto_2682 ) ) ( not ( = ?auto_2680 ?auto_2682 ) ) ( not ( = ?auto_2686 ?auto_2689 ) ) ( not ( = ?auto_2686 ?auto_2688 ) ) ( not ( = ?auto_2677 ?auto_2681 ) ) ( not ( = ?auto_2679 ?auto_2681 ) ) ( not ( = ?auto_2680 ?auto_2681 ) ) ( not ( = ?auto_2682 ?auto_2681 ) ) ( not ( = ?auto_2687 ?auto_2686 ) ) ( not ( = ?auto_2687 ?auto_2689 ) ) ( not ( = ?auto_2687 ?auto_2688 ) ) ( not ( = ?auto_2677 ?auto_2683 ) ) ( not ( = ?auto_2679 ?auto_2683 ) ) ( not ( = ?auto_2680 ?auto_2683 ) ) ( not ( = ?auto_2682 ?auto_2683 ) ) ( not ( = ?auto_2681 ?auto_2683 ) ) ( TRUCK-AT ?auto_2685 ?auto_2678 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2685 ?auto_2678 ?auto_2688 ?auto_2684 )
      ( DELIVER-6PKG ?auto_2677 ?auto_2679 ?auto_2680 ?auto_2682 ?auto_2681 ?auto_2683 ?auto_2678 )
      ( DELIVER-6PKG-VERIFY ?auto_2677 ?auto_2679 ?auto_2680 ?auto_2682 ?auto_2681 ?auto_2683 ?auto_2678 ) )
  )

)

