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

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-8PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?obj8 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) ( OBJ-AT ?obj8 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2436 - OBJ
      ?auto_2437 - LOCATION
    )
    :vars
    (
      ?auto_2439 - LOCATION
      ?auto_2440 - CITY
      ?auto_2438 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2439 ?auto_2440 ) ( IN-CITY ?auto_2437 ?auto_2440 ) ( not ( = ?auto_2437 ?auto_2439 ) ) ( OBJ-AT ?auto_2436 ?auto_2439 ) ( TRUCK-AT ?auto_2438 ?auto_2437 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2438 ?auto_2437 ?auto_2439 ?auto_2440 )
      ( !LOAD-TRUCK ?auto_2436 ?auto_2438 ?auto_2439 )
      ( !DRIVE-TRUCK ?auto_2438 ?auto_2439 ?auto_2437 ?auto_2440 )
      ( !UNLOAD-TRUCK ?auto_2436 ?auto_2438 ?auto_2437 )
      ( DELIVER-1PKG-VERIFY ?auto_2436 ?auto_2437 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2451 - OBJ
      ?auto_2453 - OBJ
      ?auto_2452 - LOCATION
    )
    :vars
    (
      ?auto_2454 - LOCATION
      ?auto_2455 - CITY
      ?auto_2456 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2453 ?auto_2451 ) ( IN-CITY ?auto_2454 ?auto_2455 ) ( IN-CITY ?auto_2452 ?auto_2455 ) ( not ( = ?auto_2452 ?auto_2454 ) ) ( OBJ-AT ?auto_2453 ?auto_2454 ) ( OBJ-AT ?auto_2451 ?auto_2454 ) ( TRUCK-AT ?auto_2456 ?auto_2452 ) ( not ( = ?auto_2451 ?auto_2453 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2451 ?auto_2452 )
      ( DELIVER-1PKG ?auto_2453 ?auto_2452 )
      ( DELIVER-2PKG-VERIFY ?auto_2451 ?auto_2453 ?auto_2452 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2468 - OBJ
      ?auto_2470 - OBJ
      ?auto_2471 - OBJ
      ?auto_2469 - LOCATION
    )
    :vars
    (
      ?auto_2474 - LOCATION
      ?auto_2473 - CITY
      ?auto_2475 - LOCATION
      ?auto_2472 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2470 ?auto_2468 ) ( GREATER-THAN ?auto_2471 ?auto_2468 ) ( GREATER-THAN ?auto_2471 ?auto_2470 ) ( IN-CITY ?auto_2474 ?auto_2473 ) ( IN-CITY ?auto_2469 ?auto_2473 ) ( not ( = ?auto_2469 ?auto_2474 ) ) ( OBJ-AT ?auto_2471 ?auto_2474 ) ( IN-CITY ?auto_2475 ?auto_2473 ) ( not ( = ?auto_2469 ?auto_2475 ) ) ( OBJ-AT ?auto_2470 ?auto_2475 ) ( OBJ-AT ?auto_2468 ?auto_2475 ) ( TRUCK-AT ?auto_2472 ?auto_2469 ) ( not ( = ?auto_2468 ?auto_2470 ) ) ( not ( = ?auto_2468 ?auto_2471 ) ) ( not ( = ?auto_2470 ?auto_2471 ) ) ( not ( = ?auto_2474 ?auto_2475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2468 ?auto_2470 ?auto_2469 )
      ( DELIVER-1PKG ?auto_2471 ?auto_2469 )
      ( DELIVER-3PKG-VERIFY ?auto_2468 ?auto_2470 ?auto_2471 ?auto_2469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2488 - OBJ
      ?auto_2490 - OBJ
      ?auto_2491 - OBJ
      ?auto_2492 - OBJ
      ?auto_2489 - LOCATION
    )
    :vars
    (
      ?auto_2493 - LOCATION
      ?auto_2494 - CITY
      ?auto_2496 - LOCATION
      ?auto_2497 - LOCATION
      ?auto_2495 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2490 ?auto_2488 ) ( GREATER-THAN ?auto_2491 ?auto_2488 ) ( GREATER-THAN ?auto_2491 ?auto_2490 ) ( GREATER-THAN ?auto_2492 ?auto_2488 ) ( GREATER-THAN ?auto_2492 ?auto_2490 ) ( GREATER-THAN ?auto_2492 ?auto_2491 ) ( IN-CITY ?auto_2493 ?auto_2494 ) ( IN-CITY ?auto_2489 ?auto_2494 ) ( not ( = ?auto_2489 ?auto_2493 ) ) ( OBJ-AT ?auto_2492 ?auto_2493 ) ( IN-CITY ?auto_2496 ?auto_2494 ) ( not ( = ?auto_2489 ?auto_2496 ) ) ( OBJ-AT ?auto_2491 ?auto_2496 ) ( IN-CITY ?auto_2497 ?auto_2494 ) ( not ( = ?auto_2489 ?auto_2497 ) ) ( OBJ-AT ?auto_2490 ?auto_2497 ) ( OBJ-AT ?auto_2488 ?auto_2497 ) ( TRUCK-AT ?auto_2495 ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2490 ) ) ( not ( = ?auto_2488 ?auto_2491 ) ) ( not ( = ?auto_2490 ?auto_2491 ) ) ( not ( = ?auto_2496 ?auto_2497 ) ) ( not ( = ?auto_2488 ?auto_2492 ) ) ( not ( = ?auto_2490 ?auto_2492 ) ) ( not ( = ?auto_2491 ?auto_2492 ) ) ( not ( = ?auto_2493 ?auto_2496 ) ) ( not ( = ?auto_2493 ?auto_2497 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2488 ?auto_2490 ?auto_2491 ?auto_2489 )
      ( DELIVER-1PKG ?auto_2492 ?auto_2489 )
      ( DELIVER-4PKG-VERIFY ?auto_2488 ?auto_2490 ?auto_2491 ?auto_2492 ?auto_2489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2511 - OBJ
      ?auto_2513 - OBJ
      ?auto_2514 - OBJ
      ?auto_2515 - OBJ
      ?auto_2516 - OBJ
      ?auto_2512 - LOCATION
    )
    :vars
    (
      ?auto_2517 - LOCATION
      ?auto_2518 - CITY
      ?auto_2521 - LOCATION
      ?auto_2520 - LOCATION
      ?auto_2519 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2513 ?auto_2511 ) ( GREATER-THAN ?auto_2514 ?auto_2511 ) ( GREATER-THAN ?auto_2514 ?auto_2513 ) ( GREATER-THAN ?auto_2515 ?auto_2511 ) ( GREATER-THAN ?auto_2515 ?auto_2513 ) ( GREATER-THAN ?auto_2515 ?auto_2514 ) ( GREATER-THAN ?auto_2516 ?auto_2511 ) ( GREATER-THAN ?auto_2516 ?auto_2513 ) ( GREATER-THAN ?auto_2516 ?auto_2514 ) ( GREATER-THAN ?auto_2516 ?auto_2515 ) ( IN-CITY ?auto_2517 ?auto_2518 ) ( IN-CITY ?auto_2512 ?auto_2518 ) ( not ( = ?auto_2512 ?auto_2517 ) ) ( OBJ-AT ?auto_2516 ?auto_2517 ) ( IN-CITY ?auto_2521 ?auto_2518 ) ( not ( = ?auto_2512 ?auto_2521 ) ) ( OBJ-AT ?auto_2515 ?auto_2521 ) ( IN-CITY ?auto_2520 ?auto_2518 ) ( not ( = ?auto_2512 ?auto_2520 ) ) ( OBJ-AT ?auto_2514 ?auto_2520 ) ( OBJ-AT ?auto_2513 ?auto_2517 ) ( OBJ-AT ?auto_2511 ?auto_2517 ) ( TRUCK-AT ?auto_2519 ?auto_2512 ) ( not ( = ?auto_2511 ?auto_2513 ) ) ( not ( = ?auto_2511 ?auto_2514 ) ) ( not ( = ?auto_2513 ?auto_2514 ) ) ( not ( = ?auto_2520 ?auto_2517 ) ) ( not ( = ?auto_2511 ?auto_2515 ) ) ( not ( = ?auto_2513 ?auto_2515 ) ) ( not ( = ?auto_2514 ?auto_2515 ) ) ( not ( = ?auto_2521 ?auto_2520 ) ) ( not ( = ?auto_2521 ?auto_2517 ) ) ( not ( = ?auto_2511 ?auto_2516 ) ) ( not ( = ?auto_2513 ?auto_2516 ) ) ( not ( = ?auto_2514 ?auto_2516 ) ) ( not ( = ?auto_2515 ?auto_2516 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2511 ?auto_2513 ?auto_2514 ?auto_2515 ?auto_2512 )
      ( DELIVER-1PKG ?auto_2516 ?auto_2512 )
      ( DELIVER-5PKG-VERIFY ?auto_2511 ?auto_2513 ?auto_2514 ?auto_2515 ?auto_2516 ?auto_2512 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2536 - OBJ
      ?auto_2538 - OBJ
      ?auto_2539 - OBJ
      ?auto_2540 - OBJ
      ?auto_2541 - OBJ
      ?auto_2542 - OBJ
      ?auto_2537 - LOCATION
    )
    :vars
    (
      ?auto_2543 - LOCATION
      ?auto_2545 - CITY
      ?auto_2547 - LOCATION
      ?auto_2548 - LOCATION
      ?auto_2546 - LOCATION
      ?auto_2544 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2538 ?auto_2536 ) ( GREATER-THAN ?auto_2539 ?auto_2536 ) ( GREATER-THAN ?auto_2539 ?auto_2538 ) ( GREATER-THAN ?auto_2540 ?auto_2536 ) ( GREATER-THAN ?auto_2540 ?auto_2538 ) ( GREATER-THAN ?auto_2540 ?auto_2539 ) ( GREATER-THAN ?auto_2541 ?auto_2536 ) ( GREATER-THAN ?auto_2541 ?auto_2538 ) ( GREATER-THAN ?auto_2541 ?auto_2539 ) ( GREATER-THAN ?auto_2541 ?auto_2540 ) ( GREATER-THAN ?auto_2542 ?auto_2536 ) ( GREATER-THAN ?auto_2542 ?auto_2538 ) ( GREATER-THAN ?auto_2542 ?auto_2539 ) ( GREATER-THAN ?auto_2542 ?auto_2540 ) ( GREATER-THAN ?auto_2542 ?auto_2541 ) ( IN-CITY ?auto_2543 ?auto_2545 ) ( IN-CITY ?auto_2537 ?auto_2545 ) ( not ( = ?auto_2537 ?auto_2543 ) ) ( OBJ-AT ?auto_2542 ?auto_2543 ) ( IN-CITY ?auto_2547 ?auto_2545 ) ( not ( = ?auto_2537 ?auto_2547 ) ) ( OBJ-AT ?auto_2541 ?auto_2547 ) ( IN-CITY ?auto_2548 ?auto_2545 ) ( not ( = ?auto_2537 ?auto_2548 ) ) ( OBJ-AT ?auto_2540 ?auto_2548 ) ( IN-CITY ?auto_2546 ?auto_2545 ) ( not ( = ?auto_2537 ?auto_2546 ) ) ( OBJ-AT ?auto_2539 ?auto_2546 ) ( OBJ-AT ?auto_2538 ?auto_2547 ) ( OBJ-AT ?auto_2536 ?auto_2547 ) ( TRUCK-AT ?auto_2544 ?auto_2537 ) ( not ( = ?auto_2536 ?auto_2538 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2538 ?auto_2539 ) ) ( not ( = ?auto_2546 ?auto_2547 ) ) ( not ( = ?auto_2536 ?auto_2540 ) ) ( not ( = ?auto_2538 ?auto_2540 ) ) ( not ( = ?auto_2539 ?auto_2540 ) ) ( not ( = ?auto_2548 ?auto_2546 ) ) ( not ( = ?auto_2548 ?auto_2547 ) ) ( not ( = ?auto_2536 ?auto_2541 ) ) ( not ( = ?auto_2538 ?auto_2541 ) ) ( not ( = ?auto_2539 ?auto_2541 ) ) ( not ( = ?auto_2540 ?auto_2541 ) ) ( not ( = ?auto_2536 ?auto_2542 ) ) ( not ( = ?auto_2538 ?auto_2542 ) ) ( not ( = ?auto_2539 ?auto_2542 ) ) ( not ( = ?auto_2540 ?auto_2542 ) ) ( not ( = ?auto_2541 ?auto_2542 ) ) ( not ( = ?auto_2543 ?auto_2547 ) ) ( not ( = ?auto_2543 ?auto_2548 ) ) ( not ( = ?auto_2543 ?auto_2546 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2536 ?auto_2538 ?auto_2539 ?auto_2540 ?auto_2541 ?auto_2537 )
      ( DELIVER-1PKG ?auto_2542 ?auto_2537 )
      ( DELIVER-6PKG-VERIFY ?auto_2536 ?auto_2538 ?auto_2539 ?auto_2540 ?auto_2541 ?auto_2542 ?auto_2537 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_2564 - OBJ
      ?auto_2566 - OBJ
      ?auto_2567 - OBJ
      ?auto_2568 - OBJ
      ?auto_2569 - OBJ
      ?auto_2570 - OBJ
      ?auto_2571 - OBJ
      ?auto_2565 - LOCATION
    )
    :vars
    (
      ?auto_2572 - LOCATION
      ?auto_2573 - CITY
      ?auto_2577 - LOCATION
      ?auto_2576 - LOCATION
      ?auto_2575 - LOCATION
      ?auto_2574 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2566 ?auto_2564 ) ( GREATER-THAN ?auto_2567 ?auto_2564 ) ( GREATER-THAN ?auto_2567 ?auto_2566 ) ( GREATER-THAN ?auto_2568 ?auto_2564 ) ( GREATER-THAN ?auto_2568 ?auto_2566 ) ( GREATER-THAN ?auto_2568 ?auto_2567 ) ( GREATER-THAN ?auto_2569 ?auto_2564 ) ( GREATER-THAN ?auto_2569 ?auto_2566 ) ( GREATER-THAN ?auto_2569 ?auto_2567 ) ( GREATER-THAN ?auto_2569 ?auto_2568 ) ( GREATER-THAN ?auto_2570 ?auto_2564 ) ( GREATER-THAN ?auto_2570 ?auto_2566 ) ( GREATER-THAN ?auto_2570 ?auto_2567 ) ( GREATER-THAN ?auto_2570 ?auto_2568 ) ( GREATER-THAN ?auto_2570 ?auto_2569 ) ( GREATER-THAN ?auto_2571 ?auto_2564 ) ( GREATER-THAN ?auto_2571 ?auto_2566 ) ( GREATER-THAN ?auto_2571 ?auto_2567 ) ( GREATER-THAN ?auto_2571 ?auto_2568 ) ( GREATER-THAN ?auto_2571 ?auto_2569 ) ( GREATER-THAN ?auto_2571 ?auto_2570 ) ( IN-CITY ?auto_2572 ?auto_2573 ) ( IN-CITY ?auto_2565 ?auto_2573 ) ( not ( = ?auto_2565 ?auto_2572 ) ) ( OBJ-AT ?auto_2571 ?auto_2572 ) ( IN-CITY ?auto_2577 ?auto_2573 ) ( not ( = ?auto_2565 ?auto_2577 ) ) ( OBJ-AT ?auto_2570 ?auto_2577 ) ( IN-CITY ?auto_2576 ?auto_2573 ) ( not ( = ?auto_2565 ?auto_2576 ) ) ( OBJ-AT ?auto_2569 ?auto_2576 ) ( IN-CITY ?auto_2575 ?auto_2573 ) ( not ( = ?auto_2565 ?auto_2575 ) ) ( OBJ-AT ?auto_2568 ?auto_2575 ) ( OBJ-AT ?auto_2567 ?auto_2572 ) ( OBJ-AT ?auto_2566 ?auto_2576 ) ( OBJ-AT ?auto_2564 ?auto_2576 ) ( TRUCK-AT ?auto_2574 ?auto_2565 ) ( not ( = ?auto_2564 ?auto_2566 ) ) ( not ( = ?auto_2564 ?auto_2567 ) ) ( not ( = ?auto_2566 ?auto_2567 ) ) ( not ( = ?auto_2572 ?auto_2576 ) ) ( not ( = ?auto_2564 ?auto_2568 ) ) ( not ( = ?auto_2566 ?auto_2568 ) ) ( not ( = ?auto_2567 ?auto_2568 ) ) ( not ( = ?auto_2575 ?auto_2572 ) ) ( not ( = ?auto_2575 ?auto_2576 ) ) ( not ( = ?auto_2564 ?auto_2569 ) ) ( not ( = ?auto_2566 ?auto_2569 ) ) ( not ( = ?auto_2567 ?auto_2569 ) ) ( not ( = ?auto_2568 ?auto_2569 ) ) ( not ( = ?auto_2564 ?auto_2570 ) ) ( not ( = ?auto_2566 ?auto_2570 ) ) ( not ( = ?auto_2567 ?auto_2570 ) ) ( not ( = ?auto_2568 ?auto_2570 ) ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( not ( = ?auto_2577 ?auto_2576 ) ) ( not ( = ?auto_2577 ?auto_2575 ) ) ( not ( = ?auto_2577 ?auto_2572 ) ) ( not ( = ?auto_2564 ?auto_2571 ) ) ( not ( = ?auto_2566 ?auto_2571 ) ) ( not ( = ?auto_2567 ?auto_2571 ) ) ( not ( = ?auto_2568 ?auto_2571 ) ) ( not ( = ?auto_2569 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2571 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2564 ?auto_2566 ?auto_2567 ?auto_2568 ?auto_2569 ?auto_2570 ?auto_2565 )
      ( DELIVER-1PKG ?auto_2571 ?auto_2565 )
      ( DELIVER-7PKG-VERIFY ?auto_2564 ?auto_2566 ?auto_2567 ?auto_2568 ?auto_2569 ?auto_2570 ?auto_2571 ?auto_2565 ) )
  )

  ( :method DELIVER-8PKG
    :parameters
    (
      ?auto_2594 - OBJ
      ?auto_2596 - OBJ
      ?auto_2597 - OBJ
      ?auto_2598 - OBJ
      ?auto_2599 - OBJ
      ?auto_2601 - OBJ
      ?auto_2602 - OBJ
      ?auto_2600 - OBJ
      ?auto_2595 - LOCATION
    )
    :vars
    (
      ?auto_2605 - LOCATION
      ?auto_2604 - CITY
      ?auto_2607 - LOCATION
      ?auto_2606 - LOCATION
      ?auto_2608 - LOCATION
      ?auto_2603 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2596 ?auto_2594 ) ( GREATER-THAN ?auto_2597 ?auto_2594 ) ( GREATER-THAN ?auto_2597 ?auto_2596 ) ( GREATER-THAN ?auto_2598 ?auto_2594 ) ( GREATER-THAN ?auto_2598 ?auto_2596 ) ( GREATER-THAN ?auto_2598 ?auto_2597 ) ( GREATER-THAN ?auto_2599 ?auto_2594 ) ( GREATER-THAN ?auto_2599 ?auto_2596 ) ( GREATER-THAN ?auto_2599 ?auto_2597 ) ( GREATER-THAN ?auto_2599 ?auto_2598 ) ( GREATER-THAN ?auto_2601 ?auto_2594 ) ( GREATER-THAN ?auto_2601 ?auto_2596 ) ( GREATER-THAN ?auto_2601 ?auto_2597 ) ( GREATER-THAN ?auto_2601 ?auto_2598 ) ( GREATER-THAN ?auto_2601 ?auto_2599 ) ( GREATER-THAN ?auto_2602 ?auto_2594 ) ( GREATER-THAN ?auto_2602 ?auto_2596 ) ( GREATER-THAN ?auto_2602 ?auto_2597 ) ( GREATER-THAN ?auto_2602 ?auto_2598 ) ( GREATER-THAN ?auto_2602 ?auto_2599 ) ( GREATER-THAN ?auto_2602 ?auto_2601 ) ( GREATER-THAN ?auto_2600 ?auto_2594 ) ( GREATER-THAN ?auto_2600 ?auto_2596 ) ( GREATER-THAN ?auto_2600 ?auto_2597 ) ( GREATER-THAN ?auto_2600 ?auto_2598 ) ( GREATER-THAN ?auto_2600 ?auto_2599 ) ( GREATER-THAN ?auto_2600 ?auto_2601 ) ( GREATER-THAN ?auto_2600 ?auto_2602 ) ( IN-CITY ?auto_2605 ?auto_2604 ) ( IN-CITY ?auto_2595 ?auto_2604 ) ( not ( = ?auto_2595 ?auto_2605 ) ) ( OBJ-AT ?auto_2600 ?auto_2605 ) ( IN-CITY ?auto_2607 ?auto_2604 ) ( not ( = ?auto_2595 ?auto_2607 ) ) ( OBJ-AT ?auto_2602 ?auto_2607 ) ( OBJ-AT ?auto_2601 ?auto_2605 ) ( IN-CITY ?auto_2606 ?auto_2604 ) ( not ( = ?auto_2595 ?auto_2606 ) ) ( OBJ-AT ?auto_2599 ?auto_2606 ) ( IN-CITY ?auto_2608 ?auto_2604 ) ( not ( = ?auto_2595 ?auto_2608 ) ) ( OBJ-AT ?auto_2598 ?auto_2608 ) ( OBJ-AT ?auto_2597 ?auto_2607 ) ( OBJ-AT ?auto_2596 ?auto_2606 ) ( OBJ-AT ?auto_2594 ?auto_2606 ) ( TRUCK-AT ?auto_2603 ?auto_2595 ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2594 ?auto_2597 ) ) ( not ( = ?auto_2596 ?auto_2597 ) ) ( not ( = ?auto_2607 ?auto_2606 ) ) ( not ( = ?auto_2594 ?auto_2598 ) ) ( not ( = ?auto_2596 ?auto_2598 ) ) ( not ( = ?auto_2597 ?auto_2598 ) ) ( not ( = ?auto_2608 ?auto_2607 ) ) ( not ( = ?auto_2608 ?auto_2606 ) ) ( not ( = ?auto_2594 ?auto_2599 ) ) ( not ( = ?auto_2596 ?auto_2599 ) ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( not ( = ?auto_2594 ?auto_2601 ) ) ( not ( = ?auto_2596 ?auto_2601 ) ) ( not ( = ?auto_2597 ?auto_2601 ) ) ( not ( = ?auto_2598 ?auto_2601 ) ) ( not ( = ?auto_2599 ?auto_2601 ) ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( not ( = ?auto_2605 ?auto_2608 ) ) ( not ( = ?auto_2605 ?auto_2607 ) ) ( not ( = ?auto_2594 ?auto_2602 ) ) ( not ( = ?auto_2596 ?auto_2602 ) ) ( not ( = ?auto_2597 ?auto_2602 ) ) ( not ( = ?auto_2598 ?auto_2602 ) ) ( not ( = ?auto_2599 ?auto_2602 ) ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( not ( = ?auto_2594 ?auto_2600 ) ) ( not ( = ?auto_2596 ?auto_2600 ) ) ( not ( = ?auto_2597 ?auto_2600 ) ) ( not ( = ?auto_2598 ?auto_2600 ) ) ( not ( = ?auto_2599 ?auto_2600 ) ) ( not ( = ?auto_2601 ?auto_2600 ) ) ( not ( = ?auto_2602 ?auto_2600 ) ) )
    :subtasks
    ( ( DELIVER-7PKG ?auto_2594 ?auto_2596 ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2601 ?auto_2602 ?auto_2595 )
      ( DELIVER-1PKG ?auto_2600 ?auto_2595 )
      ( DELIVER-8PKG-VERIFY ?auto_2594 ?auto_2596 ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2601 ?auto_2602 ?auto_2600 ?auto_2595 ) )
  )

)

