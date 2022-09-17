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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2509 - SURFACE
      ?auto_2510 - SURFACE
    )
    :vars
    (
      ?auto_2511 - HOIST
      ?auto_2512 - PLACE
      ?auto_2514 - PLACE
      ?auto_2515 - HOIST
      ?auto_2516 - SURFACE
      ?auto_2513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2511 ?auto_2512 ) ( SURFACE-AT ?auto_2509 ?auto_2512 ) ( CLEAR ?auto_2509 ) ( IS-CRATE ?auto_2510 ) ( AVAILABLE ?auto_2511 ) ( not ( = ?auto_2514 ?auto_2512 ) ) ( HOIST-AT ?auto_2515 ?auto_2514 ) ( AVAILABLE ?auto_2515 ) ( SURFACE-AT ?auto_2510 ?auto_2514 ) ( ON ?auto_2510 ?auto_2516 ) ( CLEAR ?auto_2510 ) ( TRUCK-AT ?auto_2513 ?auto_2512 ) ( not ( = ?auto_2509 ?auto_2510 ) ) ( not ( = ?auto_2509 ?auto_2516 ) ) ( not ( = ?auto_2510 ?auto_2516 ) ) ( not ( = ?auto_2511 ?auto_2515 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2513 ?auto_2512 ?auto_2514 )
      ( !LIFT ?auto_2515 ?auto_2510 ?auto_2516 ?auto_2514 )
      ( !LOAD ?auto_2515 ?auto_2510 ?auto_2513 ?auto_2514 )
      ( !DRIVE ?auto_2513 ?auto_2514 ?auto_2512 )
      ( !UNLOAD ?auto_2511 ?auto_2510 ?auto_2513 ?auto_2512 )
      ( !DROP ?auto_2511 ?auto_2510 ?auto_2509 ?auto_2512 )
      ( MAKE-1CRATE-VERIFY ?auto_2509 ?auto_2510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2519 - SURFACE
      ?auto_2520 - SURFACE
    )
    :vars
    (
      ?auto_2521 - HOIST
      ?auto_2522 - PLACE
      ?auto_2524 - PLACE
      ?auto_2525 - HOIST
      ?auto_2526 - SURFACE
      ?auto_2523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2521 ?auto_2522 ) ( SURFACE-AT ?auto_2519 ?auto_2522 ) ( CLEAR ?auto_2519 ) ( IS-CRATE ?auto_2520 ) ( AVAILABLE ?auto_2521 ) ( not ( = ?auto_2524 ?auto_2522 ) ) ( HOIST-AT ?auto_2525 ?auto_2524 ) ( AVAILABLE ?auto_2525 ) ( SURFACE-AT ?auto_2520 ?auto_2524 ) ( ON ?auto_2520 ?auto_2526 ) ( CLEAR ?auto_2520 ) ( TRUCK-AT ?auto_2523 ?auto_2522 ) ( not ( = ?auto_2519 ?auto_2520 ) ) ( not ( = ?auto_2519 ?auto_2526 ) ) ( not ( = ?auto_2520 ?auto_2526 ) ) ( not ( = ?auto_2521 ?auto_2525 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2523 ?auto_2522 ?auto_2524 )
      ( !LIFT ?auto_2525 ?auto_2520 ?auto_2526 ?auto_2524 )
      ( !LOAD ?auto_2525 ?auto_2520 ?auto_2523 ?auto_2524 )
      ( !DRIVE ?auto_2523 ?auto_2524 ?auto_2522 )
      ( !UNLOAD ?auto_2521 ?auto_2520 ?auto_2523 ?auto_2522 )
      ( !DROP ?auto_2521 ?auto_2520 ?auto_2519 ?auto_2522 )
      ( MAKE-1CRATE-VERIFY ?auto_2519 ?auto_2520 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2530 - SURFACE
      ?auto_2531 - SURFACE
      ?auto_2532 - SURFACE
    )
    :vars
    (
      ?auto_2537 - HOIST
      ?auto_2533 - PLACE
      ?auto_2534 - PLACE
      ?auto_2536 - HOIST
      ?auto_2535 - SURFACE
      ?auto_2539 - PLACE
      ?auto_2541 - HOIST
      ?auto_2540 - SURFACE
      ?auto_2538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2537 ?auto_2533 ) ( IS-CRATE ?auto_2532 ) ( not ( = ?auto_2534 ?auto_2533 ) ) ( HOIST-AT ?auto_2536 ?auto_2534 ) ( AVAILABLE ?auto_2536 ) ( SURFACE-AT ?auto_2532 ?auto_2534 ) ( ON ?auto_2532 ?auto_2535 ) ( CLEAR ?auto_2532 ) ( not ( = ?auto_2531 ?auto_2532 ) ) ( not ( = ?auto_2531 ?auto_2535 ) ) ( not ( = ?auto_2532 ?auto_2535 ) ) ( not ( = ?auto_2537 ?auto_2536 ) ) ( SURFACE-AT ?auto_2530 ?auto_2533 ) ( CLEAR ?auto_2530 ) ( IS-CRATE ?auto_2531 ) ( AVAILABLE ?auto_2537 ) ( not ( = ?auto_2539 ?auto_2533 ) ) ( HOIST-AT ?auto_2541 ?auto_2539 ) ( AVAILABLE ?auto_2541 ) ( SURFACE-AT ?auto_2531 ?auto_2539 ) ( ON ?auto_2531 ?auto_2540 ) ( CLEAR ?auto_2531 ) ( TRUCK-AT ?auto_2538 ?auto_2533 ) ( not ( = ?auto_2530 ?auto_2531 ) ) ( not ( = ?auto_2530 ?auto_2540 ) ) ( not ( = ?auto_2531 ?auto_2540 ) ) ( not ( = ?auto_2537 ?auto_2541 ) ) ( not ( = ?auto_2530 ?auto_2532 ) ) ( not ( = ?auto_2530 ?auto_2535 ) ) ( not ( = ?auto_2532 ?auto_2540 ) ) ( not ( = ?auto_2534 ?auto_2539 ) ) ( not ( = ?auto_2536 ?auto_2541 ) ) ( not ( = ?auto_2535 ?auto_2540 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2530 ?auto_2531 )
      ( MAKE-1CRATE ?auto_2531 ?auto_2532 )
      ( MAKE-2CRATE-VERIFY ?auto_2530 ?auto_2531 ?auto_2532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2544 - SURFACE
      ?auto_2545 - SURFACE
    )
    :vars
    (
      ?auto_2546 - HOIST
      ?auto_2547 - PLACE
      ?auto_2549 - PLACE
      ?auto_2550 - HOIST
      ?auto_2551 - SURFACE
      ?auto_2548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2546 ?auto_2547 ) ( SURFACE-AT ?auto_2544 ?auto_2547 ) ( CLEAR ?auto_2544 ) ( IS-CRATE ?auto_2545 ) ( AVAILABLE ?auto_2546 ) ( not ( = ?auto_2549 ?auto_2547 ) ) ( HOIST-AT ?auto_2550 ?auto_2549 ) ( AVAILABLE ?auto_2550 ) ( SURFACE-AT ?auto_2545 ?auto_2549 ) ( ON ?auto_2545 ?auto_2551 ) ( CLEAR ?auto_2545 ) ( TRUCK-AT ?auto_2548 ?auto_2547 ) ( not ( = ?auto_2544 ?auto_2545 ) ) ( not ( = ?auto_2544 ?auto_2551 ) ) ( not ( = ?auto_2545 ?auto_2551 ) ) ( not ( = ?auto_2546 ?auto_2550 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2548 ?auto_2547 ?auto_2549 )
      ( !LIFT ?auto_2550 ?auto_2545 ?auto_2551 ?auto_2549 )
      ( !LOAD ?auto_2550 ?auto_2545 ?auto_2548 ?auto_2549 )
      ( !DRIVE ?auto_2548 ?auto_2549 ?auto_2547 )
      ( !UNLOAD ?auto_2546 ?auto_2545 ?auto_2548 ?auto_2547 )
      ( !DROP ?auto_2546 ?auto_2545 ?auto_2544 ?auto_2547 )
      ( MAKE-1CRATE-VERIFY ?auto_2544 ?auto_2545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2556 - SURFACE
      ?auto_2557 - SURFACE
      ?auto_2558 - SURFACE
      ?auto_2559 - SURFACE
    )
    :vars
    (
      ?auto_2561 - HOIST
      ?auto_2560 - PLACE
      ?auto_2565 - PLACE
      ?auto_2562 - HOIST
      ?auto_2563 - SURFACE
      ?auto_2569 - PLACE
      ?auto_2571 - HOIST
      ?auto_2570 - SURFACE
      ?auto_2568 - PLACE
      ?auto_2566 - HOIST
      ?auto_2567 - SURFACE
      ?auto_2564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561 ?auto_2560 ) ( IS-CRATE ?auto_2559 ) ( not ( = ?auto_2565 ?auto_2560 ) ) ( HOIST-AT ?auto_2562 ?auto_2565 ) ( AVAILABLE ?auto_2562 ) ( SURFACE-AT ?auto_2559 ?auto_2565 ) ( ON ?auto_2559 ?auto_2563 ) ( CLEAR ?auto_2559 ) ( not ( = ?auto_2558 ?auto_2559 ) ) ( not ( = ?auto_2558 ?auto_2563 ) ) ( not ( = ?auto_2559 ?auto_2563 ) ) ( not ( = ?auto_2561 ?auto_2562 ) ) ( IS-CRATE ?auto_2558 ) ( not ( = ?auto_2569 ?auto_2560 ) ) ( HOIST-AT ?auto_2571 ?auto_2569 ) ( AVAILABLE ?auto_2571 ) ( SURFACE-AT ?auto_2558 ?auto_2569 ) ( ON ?auto_2558 ?auto_2570 ) ( CLEAR ?auto_2558 ) ( not ( = ?auto_2557 ?auto_2558 ) ) ( not ( = ?auto_2557 ?auto_2570 ) ) ( not ( = ?auto_2558 ?auto_2570 ) ) ( not ( = ?auto_2561 ?auto_2571 ) ) ( SURFACE-AT ?auto_2556 ?auto_2560 ) ( CLEAR ?auto_2556 ) ( IS-CRATE ?auto_2557 ) ( AVAILABLE ?auto_2561 ) ( not ( = ?auto_2568 ?auto_2560 ) ) ( HOIST-AT ?auto_2566 ?auto_2568 ) ( AVAILABLE ?auto_2566 ) ( SURFACE-AT ?auto_2557 ?auto_2568 ) ( ON ?auto_2557 ?auto_2567 ) ( CLEAR ?auto_2557 ) ( TRUCK-AT ?auto_2564 ?auto_2560 ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2567 ) ) ( not ( = ?auto_2557 ?auto_2567 ) ) ( not ( = ?auto_2561 ?auto_2566 ) ) ( not ( = ?auto_2556 ?auto_2558 ) ) ( not ( = ?auto_2556 ?auto_2570 ) ) ( not ( = ?auto_2558 ?auto_2567 ) ) ( not ( = ?auto_2569 ?auto_2568 ) ) ( not ( = ?auto_2571 ?auto_2566 ) ) ( not ( = ?auto_2570 ?auto_2567 ) ) ( not ( = ?auto_2556 ?auto_2559 ) ) ( not ( = ?auto_2556 ?auto_2563 ) ) ( not ( = ?auto_2557 ?auto_2559 ) ) ( not ( = ?auto_2557 ?auto_2563 ) ) ( not ( = ?auto_2559 ?auto_2570 ) ) ( not ( = ?auto_2559 ?auto_2567 ) ) ( not ( = ?auto_2565 ?auto_2569 ) ) ( not ( = ?auto_2565 ?auto_2568 ) ) ( not ( = ?auto_2562 ?auto_2571 ) ) ( not ( = ?auto_2562 ?auto_2566 ) ) ( not ( = ?auto_2563 ?auto_2570 ) ) ( not ( = ?auto_2563 ?auto_2567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2556 ?auto_2557 ?auto_2558 )
      ( MAKE-1CRATE ?auto_2558 ?auto_2559 )
      ( MAKE-3CRATE-VERIFY ?auto_2556 ?auto_2557 ?auto_2558 ?auto_2559 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2574 - SURFACE
      ?auto_2575 - SURFACE
    )
    :vars
    (
      ?auto_2576 - HOIST
      ?auto_2577 - PLACE
      ?auto_2579 - PLACE
      ?auto_2580 - HOIST
      ?auto_2581 - SURFACE
      ?auto_2578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576 ?auto_2577 ) ( SURFACE-AT ?auto_2574 ?auto_2577 ) ( CLEAR ?auto_2574 ) ( IS-CRATE ?auto_2575 ) ( AVAILABLE ?auto_2576 ) ( not ( = ?auto_2579 ?auto_2577 ) ) ( HOIST-AT ?auto_2580 ?auto_2579 ) ( AVAILABLE ?auto_2580 ) ( SURFACE-AT ?auto_2575 ?auto_2579 ) ( ON ?auto_2575 ?auto_2581 ) ( CLEAR ?auto_2575 ) ( TRUCK-AT ?auto_2578 ?auto_2577 ) ( not ( = ?auto_2574 ?auto_2575 ) ) ( not ( = ?auto_2574 ?auto_2581 ) ) ( not ( = ?auto_2575 ?auto_2581 ) ) ( not ( = ?auto_2576 ?auto_2580 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2578 ?auto_2577 ?auto_2579 )
      ( !LIFT ?auto_2580 ?auto_2575 ?auto_2581 ?auto_2579 )
      ( !LOAD ?auto_2580 ?auto_2575 ?auto_2578 ?auto_2579 )
      ( !DRIVE ?auto_2578 ?auto_2579 ?auto_2577 )
      ( !UNLOAD ?auto_2576 ?auto_2575 ?auto_2578 ?auto_2577 )
      ( !DROP ?auto_2576 ?auto_2575 ?auto_2574 ?auto_2577 )
      ( MAKE-1CRATE-VERIFY ?auto_2574 ?auto_2575 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2587 - SURFACE
      ?auto_2588 - SURFACE
      ?auto_2589 - SURFACE
      ?auto_2590 - SURFACE
      ?auto_2591 - SURFACE
    )
    :vars
    (
      ?auto_2595 - HOIST
      ?auto_2596 - PLACE
      ?auto_2594 - PLACE
      ?auto_2593 - HOIST
      ?auto_2597 - SURFACE
      ?auto_2601 - PLACE
      ?auto_2598 - HOIST
      ?auto_2603 - SURFACE
      ?auto_2600 - PLACE
      ?auto_2604 - HOIST
      ?auto_2599 - SURFACE
      ?auto_2602 - PLACE
      ?auto_2605 - HOIST
      ?auto_2606 - SURFACE
      ?auto_2592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2595 ?auto_2596 ) ( IS-CRATE ?auto_2591 ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( HOIST-AT ?auto_2593 ?auto_2594 ) ( AVAILABLE ?auto_2593 ) ( SURFACE-AT ?auto_2591 ?auto_2594 ) ( ON ?auto_2591 ?auto_2597 ) ( CLEAR ?auto_2591 ) ( not ( = ?auto_2590 ?auto_2591 ) ) ( not ( = ?auto_2590 ?auto_2597 ) ) ( not ( = ?auto_2591 ?auto_2597 ) ) ( not ( = ?auto_2595 ?auto_2593 ) ) ( IS-CRATE ?auto_2590 ) ( not ( = ?auto_2601 ?auto_2596 ) ) ( HOIST-AT ?auto_2598 ?auto_2601 ) ( AVAILABLE ?auto_2598 ) ( SURFACE-AT ?auto_2590 ?auto_2601 ) ( ON ?auto_2590 ?auto_2603 ) ( CLEAR ?auto_2590 ) ( not ( = ?auto_2589 ?auto_2590 ) ) ( not ( = ?auto_2589 ?auto_2603 ) ) ( not ( = ?auto_2590 ?auto_2603 ) ) ( not ( = ?auto_2595 ?auto_2598 ) ) ( IS-CRATE ?auto_2589 ) ( not ( = ?auto_2600 ?auto_2596 ) ) ( HOIST-AT ?auto_2604 ?auto_2600 ) ( AVAILABLE ?auto_2604 ) ( SURFACE-AT ?auto_2589 ?auto_2600 ) ( ON ?auto_2589 ?auto_2599 ) ( CLEAR ?auto_2589 ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( not ( = ?auto_2588 ?auto_2599 ) ) ( not ( = ?auto_2589 ?auto_2599 ) ) ( not ( = ?auto_2595 ?auto_2604 ) ) ( SURFACE-AT ?auto_2587 ?auto_2596 ) ( CLEAR ?auto_2587 ) ( IS-CRATE ?auto_2588 ) ( AVAILABLE ?auto_2595 ) ( not ( = ?auto_2602 ?auto_2596 ) ) ( HOIST-AT ?auto_2605 ?auto_2602 ) ( AVAILABLE ?auto_2605 ) ( SURFACE-AT ?auto_2588 ?auto_2602 ) ( ON ?auto_2588 ?auto_2606 ) ( CLEAR ?auto_2588 ) ( TRUCK-AT ?auto_2592 ?auto_2596 ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( not ( = ?auto_2587 ?auto_2606 ) ) ( not ( = ?auto_2588 ?auto_2606 ) ) ( not ( = ?auto_2595 ?auto_2605 ) ) ( not ( = ?auto_2587 ?auto_2589 ) ) ( not ( = ?auto_2587 ?auto_2599 ) ) ( not ( = ?auto_2589 ?auto_2606 ) ) ( not ( = ?auto_2600 ?auto_2602 ) ) ( not ( = ?auto_2604 ?auto_2605 ) ) ( not ( = ?auto_2599 ?auto_2606 ) ) ( not ( = ?auto_2587 ?auto_2590 ) ) ( not ( = ?auto_2587 ?auto_2603 ) ) ( not ( = ?auto_2588 ?auto_2590 ) ) ( not ( = ?auto_2588 ?auto_2603 ) ) ( not ( = ?auto_2590 ?auto_2599 ) ) ( not ( = ?auto_2590 ?auto_2606 ) ) ( not ( = ?auto_2601 ?auto_2600 ) ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( not ( = ?auto_2598 ?auto_2604 ) ) ( not ( = ?auto_2598 ?auto_2605 ) ) ( not ( = ?auto_2603 ?auto_2599 ) ) ( not ( = ?auto_2603 ?auto_2606 ) ) ( not ( = ?auto_2587 ?auto_2591 ) ) ( not ( = ?auto_2587 ?auto_2597 ) ) ( not ( = ?auto_2588 ?auto_2591 ) ) ( not ( = ?auto_2588 ?auto_2597 ) ) ( not ( = ?auto_2589 ?auto_2591 ) ) ( not ( = ?auto_2589 ?auto_2597 ) ) ( not ( = ?auto_2591 ?auto_2603 ) ) ( not ( = ?auto_2591 ?auto_2599 ) ) ( not ( = ?auto_2591 ?auto_2606 ) ) ( not ( = ?auto_2594 ?auto_2601 ) ) ( not ( = ?auto_2594 ?auto_2600 ) ) ( not ( = ?auto_2594 ?auto_2602 ) ) ( not ( = ?auto_2593 ?auto_2598 ) ) ( not ( = ?auto_2593 ?auto_2604 ) ) ( not ( = ?auto_2593 ?auto_2605 ) ) ( not ( = ?auto_2597 ?auto_2603 ) ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( not ( = ?auto_2597 ?auto_2606 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2587 ?auto_2588 ?auto_2589 ?auto_2590 )
      ( MAKE-1CRATE ?auto_2590 ?auto_2591 )
      ( MAKE-4CRATE-VERIFY ?auto_2587 ?auto_2588 ?auto_2589 ?auto_2590 ?auto_2591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2609 - SURFACE
      ?auto_2610 - SURFACE
    )
    :vars
    (
      ?auto_2611 - HOIST
      ?auto_2612 - PLACE
      ?auto_2614 - PLACE
      ?auto_2615 - HOIST
      ?auto_2616 - SURFACE
      ?auto_2613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2611 ?auto_2612 ) ( SURFACE-AT ?auto_2609 ?auto_2612 ) ( CLEAR ?auto_2609 ) ( IS-CRATE ?auto_2610 ) ( AVAILABLE ?auto_2611 ) ( not ( = ?auto_2614 ?auto_2612 ) ) ( HOIST-AT ?auto_2615 ?auto_2614 ) ( AVAILABLE ?auto_2615 ) ( SURFACE-AT ?auto_2610 ?auto_2614 ) ( ON ?auto_2610 ?auto_2616 ) ( CLEAR ?auto_2610 ) ( TRUCK-AT ?auto_2613 ?auto_2612 ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( not ( = ?auto_2609 ?auto_2616 ) ) ( not ( = ?auto_2610 ?auto_2616 ) ) ( not ( = ?auto_2611 ?auto_2615 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2613 ?auto_2612 ?auto_2614 )
      ( !LIFT ?auto_2615 ?auto_2610 ?auto_2616 ?auto_2614 )
      ( !LOAD ?auto_2615 ?auto_2610 ?auto_2613 ?auto_2614 )
      ( !DRIVE ?auto_2613 ?auto_2614 ?auto_2612 )
      ( !UNLOAD ?auto_2611 ?auto_2610 ?auto_2613 ?auto_2612 )
      ( !DROP ?auto_2611 ?auto_2610 ?auto_2609 ?auto_2612 )
      ( MAKE-1CRATE-VERIFY ?auto_2609 ?auto_2610 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2623 - SURFACE
      ?auto_2624 - SURFACE
      ?auto_2625 - SURFACE
      ?auto_2626 - SURFACE
      ?auto_2627 - SURFACE
      ?auto_2628 - SURFACE
    )
    :vars
    (
      ?auto_2629 - HOIST
      ?auto_2631 - PLACE
      ?auto_2632 - PLACE
      ?auto_2630 - HOIST
      ?auto_2633 - SURFACE
      ?auto_2641 - SURFACE
      ?auto_2644 - PLACE
      ?auto_2635 - HOIST
      ?auto_2642 - SURFACE
      ?auto_2637 - PLACE
      ?auto_2643 - HOIST
      ?auto_2638 - SURFACE
      ?auto_2640 - PLACE
      ?auto_2639 - HOIST
      ?auto_2636 - SURFACE
      ?auto_2634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2629 ?auto_2631 ) ( IS-CRATE ?auto_2628 ) ( not ( = ?auto_2632 ?auto_2631 ) ) ( HOIST-AT ?auto_2630 ?auto_2632 ) ( SURFACE-AT ?auto_2628 ?auto_2632 ) ( ON ?auto_2628 ?auto_2633 ) ( CLEAR ?auto_2628 ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( not ( = ?auto_2627 ?auto_2633 ) ) ( not ( = ?auto_2628 ?auto_2633 ) ) ( not ( = ?auto_2629 ?auto_2630 ) ) ( IS-CRATE ?auto_2627 ) ( AVAILABLE ?auto_2630 ) ( SURFACE-AT ?auto_2627 ?auto_2632 ) ( ON ?auto_2627 ?auto_2641 ) ( CLEAR ?auto_2627 ) ( not ( = ?auto_2626 ?auto_2627 ) ) ( not ( = ?auto_2626 ?auto_2641 ) ) ( not ( = ?auto_2627 ?auto_2641 ) ) ( IS-CRATE ?auto_2626 ) ( not ( = ?auto_2644 ?auto_2631 ) ) ( HOIST-AT ?auto_2635 ?auto_2644 ) ( AVAILABLE ?auto_2635 ) ( SURFACE-AT ?auto_2626 ?auto_2644 ) ( ON ?auto_2626 ?auto_2642 ) ( CLEAR ?auto_2626 ) ( not ( = ?auto_2625 ?auto_2626 ) ) ( not ( = ?auto_2625 ?auto_2642 ) ) ( not ( = ?auto_2626 ?auto_2642 ) ) ( not ( = ?auto_2629 ?auto_2635 ) ) ( IS-CRATE ?auto_2625 ) ( not ( = ?auto_2637 ?auto_2631 ) ) ( HOIST-AT ?auto_2643 ?auto_2637 ) ( AVAILABLE ?auto_2643 ) ( SURFACE-AT ?auto_2625 ?auto_2637 ) ( ON ?auto_2625 ?auto_2638 ) ( CLEAR ?auto_2625 ) ( not ( = ?auto_2624 ?auto_2625 ) ) ( not ( = ?auto_2624 ?auto_2638 ) ) ( not ( = ?auto_2625 ?auto_2638 ) ) ( not ( = ?auto_2629 ?auto_2643 ) ) ( SURFACE-AT ?auto_2623 ?auto_2631 ) ( CLEAR ?auto_2623 ) ( IS-CRATE ?auto_2624 ) ( AVAILABLE ?auto_2629 ) ( not ( = ?auto_2640 ?auto_2631 ) ) ( HOIST-AT ?auto_2639 ?auto_2640 ) ( AVAILABLE ?auto_2639 ) ( SURFACE-AT ?auto_2624 ?auto_2640 ) ( ON ?auto_2624 ?auto_2636 ) ( CLEAR ?auto_2624 ) ( TRUCK-AT ?auto_2634 ?auto_2631 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( not ( = ?auto_2623 ?auto_2636 ) ) ( not ( = ?auto_2624 ?auto_2636 ) ) ( not ( = ?auto_2629 ?auto_2639 ) ) ( not ( = ?auto_2623 ?auto_2625 ) ) ( not ( = ?auto_2623 ?auto_2638 ) ) ( not ( = ?auto_2625 ?auto_2636 ) ) ( not ( = ?auto_2637 ?auto_2640 ) ) ( not ( = ?auto_2643 ?auto_2639 ) ) ( not ( = ?auto_2638 ?auto_2636 ) ) ( not ( = ?auto_2623 ?auto_2626 ) ) ( not ( = ?auto_2623 ?auto_2642 ) ) ( not ( = ?auto_2624 ?auto_2626 ) ) ( not ( = ?auto_2624 ?auto_2642 ) ) ( not ( = ?auto_2626 ?auto_2638 ) ) ( not ( = ?auto_2626 ?auto_2636 ) ) ( not ( = ?auto_2644 ?auto_2637 ) ) ( not ( = ?auto_2644 ?auto_2640 ) ) ( not ( = ?auto_2635 ?auto_2643 ) ) ( not ( = ?auto_2635 ?auto_2639 ) ) ( not ( = ?auto_2642 ?auto_2638 ) ) ( not ( = ?auto_2642 ?auto_2636 ) ) ( not ( = ?auto_2623 ?auto_2627 ) ) ( not ( = ?auto_2623 ?auto_2641 ) ) ( not ( = ?auto_2624 ?auto_2627 ) ) ( not ( = ?auto_2624 ?auto_2641 ) ) ( not ( = ?auto_2625 ?auto_2627 ) ) ( not ( = ?auto_2625 ?auto_2641 ) ) ( not ( = ?auto_2627 ?auto_2642 ) ) ( not ( = ?auto_2627 ?auto_2638 ) ) ( not ( = ?auto_2627 ?auto_2636 ) ) ( not ( = ?auto_2632 ?auto_2644 ) ) ( not ( = ?auto_2632 ?auto_2637 ) ) ( not ( = ?auto_2632 ?auto_2640 ) ) ( not ( = ?auto_2630 ?auto_2635 ) ) ( not ( = ?auto_2630 ?auto_2643 ) ) ( not ( = ?auto_2630 ?auto_2639 ) ) ( not ( = ?auto_2641 ?auto_2642 ) ) ( not ( = ?auto_2641 ?auto_2638 ) ) ( not ( = ?auto_2641 ?auto_2636 ) ) ( not ( = ?auto_2623 ?auto_2628 ) ) ( not ( = ?auto_2623 ?auto_2633 ) ) ( not ( = ?auto_2624 ?auto_2628 ) ) ( not ( = ?auto_2624 ?auto_2633 ) ) ( not ( = ?auto_2625 ?auto_2628 ) ) ( not ( = ?auto_2625 ?auto_2633 ) ) ( not ( = ?auto_2626 ?auto_2628 ) ) ( not ( = ?auto_2626 ?auto_2633 ) ) ( not ( = ?auto_2628 ?auto_2641 ) ) ( not ( = ?auto_2628 ?auto_2642 ) ) ( not ( = ?auto_2628 ?auto_2638 ) ) ( not ( = ?auto_2628 ?auto_2636 ) ) ( not ( = ?auto_2633 ?auto_2641 ) ) ( not ( = ?auto_2633 ?auto_2642 ) ) ( not ( = ?auto_2633 ?auto_2638 ) ) ( not ( = ?auto_2633 ?auto_2636 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2623 ?auto_2624 ?auto_2625 ?auto_2626 ?auto_2627 )
      ( MAKE-1CRATE ?auto_2627 ?auto_2628 )
      ( MAKE-5CRATE-VERIFY ?auto_2623 ?auto_2624 ?auto_2625 ?auto_2626 ?auto_2627 ?auto_2628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2647 - SURFACE
      ?auto_2648 - SURFACE
    )
    :vars
    (
      ?auto_2649 - HOIST
      ?auto_2650 - PLACE
      ?auto_2652 - PLACE
      ?auto_2653 - HOIST
      ?auto_2654 - SURFACE
      ?auto_2651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2649 ?auto_2650 ) ( SURFACE-AT ?auto_2647 ?auto_2650 ) ( CLEAR ?auto_2647 ) ( IS-CRATE ?auto_2648 ) ( AVAILABLE ?auto_2649 ) ( not ( = ?auto_2652 ?auto_2650 ) ) ( HOIST-AT ?auto_2653 ?auto_2652 ) ( AVAILABLE ?auto_2653 ) ( SURFACE-AT ?auto_2648 ?auto_2652 ) ( ON ?auto_2648 ?auto_2654 ) ( CLEAR ?auto_2648 ) ( TRUCK-AT ?auto_2651 ?auto_2650 ) ( not ( = ?auto_2647 ?auto_2648 ) ) ( not ( = ?auto_2647 ?auto_2654 ) ) ( not ( = ?auto_2648 ?auto_2654 ) ) ( not ( = ?auto_2649 ?auto_2653 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2651 ?auto_2650 ?auto_2652 )
      ( !LIFT ?auto_2653 ?auto_2648 ?auto_2654 ?auto_2652 )
      ( !LOAD ?auto_2653 ?auto_2648 ?auto_2651 ?auto_2652 )
      ( !DRIVE ?auto_2651 ?auto_2652 ?auto_2650 )
      ( !UNLOAD ?auto_2649 ?auto_2648 ?auto_2651 ?auto_2650 )
      ( !DROP ?auto_2649 ?auto_2648 ?auto_2647 ?auto_2650 )
      ( MAKE-1CRATE-VERIFY ?auto_2647 ?auto_2648 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2662 - SURFACE
      ?auto_2663 - SURFACE
      ?auto_2664 - SURFACE
      ?auto_2665 - SURFACE
      ?auto_2666 - SURFACE
      ?auto_2668 - SURFACE
      ?auto_2667 - SURFACE
    )
    :vars
    (
      ?auto_2671 - HOIST
      ?auto_2674 - PLACE
      ?auto_2670 - PLACE
      ?auto_2673 - HOIST
      ?auto_2672 - SURFACE
      ?auto_2680 - SURFACE
      ?auto_2683 - SURFACE
      ?auto_2682 - PLACE
      ?auto_2679 - HOIST
      ?auto_2685 - SURFACE
      ?auto_2677 - PLACE
      ?auto_2681 - HOIST
      ?auto_2676 - SURFACE
      ?auto_2675 - PLACE
      ?auto_2684 - HOIST
      ?auto_2678 - SURFACE
      ?auto_2669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671 ?auto_2674 ) ( IS-CRATE ?auto_2667 ) ( not ( = ?auto_2670 ?auto_2674 ) ) ( HOIST-AT ?auto_2673 ?auto_2670 ) ( SURFACE-AT ?auto_2667 ?auto_2670 ) ( ON ?auto_2667 ?auto_2672 ) ( CLEAR ?auto_2667 ) ( not ( = ?auto_2668 ?auto_2667 ) ) ( not ( = ?auto_2668 ?auto_2672 ) ) ( not ( = ?auto_2667 ?auto_2672 ) ) ( not ( = ?auto_2671 ?auto_2673 ) ) ( IS-CRATE ?auto_2668 ) ( SURFACE-AT ?auto_2668 ?auto_2670 ) ( ON ?auto_2668 ?auto_2680 ) ( CLEAR ?auto_2668 ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2680 ) ) ( not ( = ?auto_2668 ?auto_2680 ) ) ( IS-CRATE ?auto_2666 ) ( AVAILABLE ?auto_2673 ) ( SURFACE-AT ?auto_2666 ?auto_2670 ) ( ON ?auto_2666 ?auto_2683 ) ( CLEAR ?auto_2666 ) ( not ( = ?auto_2665 ?auto_2666 ) ) ( not ( = ?auto_2665 ?auto_2683 ) ) ( not ( = ?auto_2666 ?auto_2683 ) ) ( IS-CRATE ?auto_2665 ) ( not ( = ?auto_2682 ?auto_2674 ) ) ( HOIST-AT ?auto_2679 ?auto_2682 ) ( AVAILABLE ?auto_2679 ) ( SURFACE-AT ?auto_2665 ?auto_2682 ) ( ON ?auto_2665 ?auto_2685 ) ( CLEAR ?auto_2665 ) ( not ( = ?auto_2664 ?auto_2665 ) ) ( not ( = ?auto_2664 ?auto_2685 ) ) ( not ( = ?auto_2665 ?auto_2685 ) ) ( not ( = ?auto_2671 ?auto_2679 ) ) ( IS-CRATE ?auto_2664 ) ( not ( = ?auto_2677 ?auto_2674 ) ) ( HOIST-AT ?auto_2681 ?auto_2677 ) ( AVAILABLE ?auto_2681 ) ( SURFACE-AT ?auto_2664 ?auto_2677 ) ( ON ?auto_2664 ?auto_2676 ) ( CLEAR ?auto_2664 ) ( not ( = ?auto_2663 ?auto_2664 ) ) ( not ( = ?auto_2663 ?auto_2676 ) ) ( not ( = ?auto_2664 ?auto_2676 ) ) ( not ( = ?auto_2671 ?auto_2681 ) ) ( SURFACE-AT ?auto_2662 ?auto_2674 ) ( CLEAR ?auto_2662 ) ( IS-CRATE ?auto_2663 ) ( AVAILABLE ?auto_2671 ) ( not ( = ?auto_2675 ?auto_2674 ) ) ( HOIST-AT ?auto_2684 ?auto_2675 ) ( AVAILABLE ?auto_2684 ) ( SURFACE-AT ?auto_2663 ?auto_2675 ) ( ON ?auto_2663 ?auto_2678 ) ( CLEAR ?auto_2663 ) ( TRUCK-AT ?auto_2669 ?auto_2674 ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2678 ) ) ( not ( = ?auto_2663 ?auto_2678 ) ) ( not ( = ?auto_2671 ?auto_2684 ) ) ( not ( = ?auto_2662 ?auto_2664 ) ) ( not ( = ?auto_2662 ?auto_2676 ) ) ( not ( = ?auto_2664 ?auto_2678 ) ) ( not ( = ?auto_2677 ?auto_2675 ) ) ( not ( = ?auto_2681 ?auto_2684 ) ) ( not ( = ?auto_2676 ?auto_2678 ) ) ( not ( = ?auto_2662 ?auto_2665 ) ) ( not ( = ?auto_2662 ?auto_2685 ) ) ( not ( = ?auto_2663 ?auto_2665 ) ) ( not ( = ?auto_2663 ?auto_2685 ) ) ( not ( = ?auto_2665 ?auto_2676 ) ) ( not ( = ?auto_2665 ?auto_2678 ) ) ( not ( = ?auto_2682 ?auto_2677 ) ) ( not ( = ?auto_2682 ?auto_2675 ) ) ( not ( = ?auto_2679 ?auto_2681 ) ) ( not ( = ?auto_2679 ?auto_2684 ) ) ( not ( = ?auto_2685 ?auto_2676 ) ) ( not ( = ?auto_2685 ?auto_2678 ) ) ( not ( = ?auto_2662 ?auto_2666 ) ) ( not ( = ?auto_2662 ?auto_2683 ) ) ( not ( = ?auto_2663 ?auto_2666 ) ) ( not ( = ?auto_2663 ?auto_2683 ) ) ( not ( = ?auto_2664 ?auto_2666 ) ) ( not ( = ?auto_2664 ?auto_2683 ) ) ( not ( = ?auto_2666 ?auto_2685 ) ) ( not ( = ?auto_2666 ?auto_2676 ) ) ( not ( = ?auto_2666 ?auto_2678 ) ) ( not ( = ?auto_2670 ?auto_2682 ) ) ( not ( = ?auto_2670 ?auto_2677 ) ) ( not ( = ?auto_2670 ?auto_2675 ) ) ( not ( = ?auto_2673 ?auto_2679 ) ) ( not ( = ?auto_2673 ?auto_2681 ) ) ( not ( = ?auto_2673 ?auto_2684 ) ) ( not ( = ?auto_2683 ?auto_2685 ) ) ( not ( = ?auto_2683 ?auto_2676 ) ) ( not ( = ?auto_2683 ?auto_2678 ) ) ( not ( = ?auto_2662 ?auto_2668 ) ) ( not ( = ?auto_2662 ?auto_2680 ) ) ( not ( = ?auto_2663 ?auto_2668 ) ) ( not ( = ?auto_2663 ?auto_2680 ) ) ( not ( = ?auto_2664 ?auto_2668 ) ) ( not ( = ?auto_2664 ?auto_2680 ) ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2665 ?auto_2680 ) ) ( not ( = ?auto_2668 ?auto_2683 ) ) ( not ( = ?auto_2668 ?auto_2685 ) ) ( not ( = ?auto_2668 ?auto_2676 ) ) ( not ( = ?auto_2668 ?auto_2678 ) ) ( not ( = ?auto_2680 ?auto_2683 ) ) ( not ( = ?auto_2680 ?auto_2685 ) ) ( not ( = ?auto_2680 ?auto_2676 ) ) ( not ( = ?auto_2680 ?auto_2678 ) ) ( not ( = ?auto_2662 ?auto_2667 ) ) ( not ( = ?auto_2662 ?auto_2672 ) ) ( not ( = ?auto_2663 ?auto_2667 ) ) ( not ( = ?auto_2663 ?auto_2672 ) ) ( not ( = ?auto_2664 ?auto_2667 ) ) ( not ( = ?auto_2664 ?auto_2672 ) ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( not ( = ?auto_2665 ?auto_2672 ) ) ( not ( = ?auto_2666 ?auto_2667 ) ) ( not ( = ?auto_2666 ?auto_2672 ) ) ( not ( = ?auto_2667 ?auto_2680 ) ) ( not ( = ?auto_2667 ?auto_2683 ) ) ( not ( = ?auto_2667 ?auto_2685 ) ) ( not ( = ?auto_2667 ?auto_2676 ) ) ( not ( = ?auto_2667 ?auto_2678 ) ) ( not ( = ?auto_2672 ?auto_2680 ) ) ( not ( = ?auto_2672 ?auto_2683 ) ) ( not ( = ?auto_2672 ?auto_2685 ) ) ( not ( = ?auto_2672 ?auto_2676 ) ) ( not ( = ?auto_2672 ?auto_2678 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2662 ?auto_2663 ?auto_2664 ?auto_2665 ?auto_2666 ?auto_2668 )
      ( MAKE-1CRATE ?auto_2668 ?auto_2667 )
      ( MAKE-6CRATE-VERIFY ?auto_2662 ?auto_2663 ?auto_2664 ?auto_2665 ?auto_2666 ?auto_2668 ?auto_2667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2688 - SURFACE
      ?auto_2689 - SURFACE
    )
    :vars
    (
      ?auto_2690 - HOIST
      ?auto_2691 - PLACE
      ?auto_2693 - PLACE
      ?auto_2694 - HOIST
      ?auto_2695 - SURFACE
      ?auto_2692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2690 ?auto_2691 ) ( SURFACE-AT ?auto_2688 ?auto_2691 ) ( CLEAR ?auto_2688 ) ( IS-CRATE ?auto_2689 ) ( AVAILABLE ?auto_2690 ) ( not ( = ?auto_2693 ?auto_2691 ) ) ( HOIST-AT ?auto_2694 ?auto_2693 ) ( AVAILABLE ?auto_2694 ) ( SURFACE-AT ?auto_2689 ?auto_2693 ) ( ON ?auto_2689 ?auto_2695 ) ( CLEAR ?auto_2689 ) ( TRUCK-AT ?auto_2692 ?auto_2691 ) ( not ( = ?auto_2688 ?auto_2689 ) ) ( not ( = ?auto_2688 ?auto_2695 ) ) ( not ( = ?auto_2689 ?auto_2695 ) ) ( not ( = ?auto_2690 ?auto_2694 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2692 ?auto_2691 ?auto_2693 )
      ( !LIFT ?auto_2694 ?auto_2689 ?auto_2695 ?auto_2693 )
      ( !LOAD ?auto_2694 ?auto_2689 ?auto_2692 ?auto_2693 )
      ( !DRIVE ?auto_2692 ?auto_2693 ?auto_2691 )
      ( !UNLOAD ?auto_2690 ?auto_2689 ?auto_2692 ?auto_2691 )
      ( !DROP ?auto_2690 ?auto_2689 ?auto_2688 ?auto_2691 )
      ( MAKE-1CRATE-VERIFY ?auto_2688 ?auto_2689 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2704 - SURFACE
      ?auto_2705 - SURFACE
      ?auto_2706 - SURFACE
      ?auto_2707 - SURFACE
      ?auto_2708 - SURFACE
      ?auto_2710 - SURFACE
      ?auto_2709 - SURFACE
      ?auto_2711 - SURFACE
    )
    :vars
    (
      ?auto_2714 - HOIST
      ?auto_2716 - PLACE
      ?auto_2713 - PLACE
      ?auto_2717 - HOIST
      ?auto_2712 - SURFACE
      ?auto_2722 - PLACE
      ?auto_2727 - HOIST
      ?auto_2728 - SURFACE
      ?auto_2724 - SURFACE
      ?auto_2720 - SURFACE
      ?auto_2718 - SURFACE
      ?auto_2726 - PLACE
      ?auto_2723 - HOIST
      ?auto_2729 - SURFACE
      ?auto_2721 - PLACE
      ?auto_2719 - HOIST
      ?auto_2725 - SURFACE
      ?auto_2715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2714 ?auto_2716 ) ( IS-CRATE ?auto_2711 ) ( not ( = ?auto_2713 ?auto_2716 ) ) ( HOIST-AT ?auto_2717 ?auto_2713 ) ( SURFACE-AT ?auto_2711 ?auto_2713 ) ( ON ?auto_2711 ?auto_2712 ) ( CLEAR ?auto_2711 ) ( not ( = ?auto_2709 ?auto_2711 ) ) ( not ( = ?auto_2709 ?auto_2712 ) ) ( not ( = ?auto_2711 ?auto_2712 ) ) ( not ( = ?auto_2714 ?auto_2717 ) ) ( IS-CRATE ?auto_2709 ) ( not ( = ?auto_2722 ?auto_2716 ) ) ( HOIST-AT ?auto_2727 ?auto_2722 ) ( SURFACE-AT ?auto_2709 ?auto_2722 ) ( ON ?auto_2709 ?auto_2728 ) ( CLEAR ?auto_2709 ) ( not ( = ?auto_2710 ?auto_2709 ) ) ( not ( = ?auto_2710 ?auto_2728 ) ) ( not ( = ?auto_2709 ?auto_2728 ) ) ( not ( = ?auto_2714 ?auto_2727 ) ) ( IS-CRATE ?auto_2710 ) ( SURFACE-AT ?auto_2710 ?auto_2722 ) ( ON ?auto_2710 ?auto_2724 ) ( CLEAR ?auto_2710 ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2708 ?auto_2724 ) ) ( not ( = ?auto_2710 ?auto_2724 ) ) ( IS-CRATE ?auto_2708 ) ( AVAILABLE ?auto_2727 ) ( SURFACE-AT ?auto_2708 ?auto_2722 ) ( ON ?auto_2708 ?auto_2720 ) ( CLEAR ?auto_2708 ) ( not ( = ?auto_2707 ?auto_2708 ) ) ( not ( = ?auto_2707 ?auto_2720 ) ) ( not ( = ?auto_2708 ?auto_2720 ) ) ( IS-CRATE ?auto_2707 ) ( AVAILABLE ?auto_2717 ) ( SURFACE-AT ?auto_2707 ?auto_2713 ) ( ON ?auto_2707 ?auto_2718 ) ( CLEAR ?auto_2707 ) ( not ( = ?auto_2706 ?auto_2707 ) ) ( not ( = ?auto_2706 ?auto_2718 ) ) ( not ( = ?auto_2707 ?auto_2718 ) ) ( IS-CRATE ?auto_2706 ) ( not ( = ?auto_2726 ?auto_2716 ) ) ( HOIST-AT ?auto_2723 ?auto_2726 ) ( AVAILABLE ?auto_2723 ) ( SURFACE-AT ?auto_2706 ?auto_2726 ) ( ON ?auto_2706 ?auto_2729 ) ( CLEAR ?auto_2706 ) ( not ( = ?auto_2705 ?auto_2706 ) ) ( not ( = ?auto_2705 ?auto_2729 ) ) ( not ( = ?auto_2706 ?auto_2729 ) ) ( not ( = ?auto_2714 ?auto_2723 ) ) ( SURFACE-AT ?auto_2704 ?auto_2716 ) ( CLEAR ?auto_2704 ) ( IS-CRATE ?auto_2705 ) ( AVAILABLE ?auto_2714 ) ( not ( = ?auto_2721 ?auto_2716 ) ) ( HOIST-AT ?auto_2719 ?auto_2721 ) ( AVAILABLE ?auto_2719 ) ( SURFACE-AT ?auto_2705 ?auto_2721 ) ( ON ?auto_2705 ?auto_2725 ) ( CLEAR ?auto_2705 ) ( TRUCK-AT ?auto_2715 ?auto_2716 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2704 ?auto_2725 ) ) ( not ( = ?auto_2705 ?auto_2725 ) ) ( not ( = ?auto_2714 ?auto_2719 ) ) ( not ( = ?auto_2704 ?auto_2706 ) ) ( not ( = ?auto_2704 ?auto_2729 ) ) ( not ( = ?auto_2706 ?auto_2725 ) ) ( not ( = ?auto_2726 ?auto_2721 ) ) ( not ( = ?auto_2723 ?auto_2719 ) ) ( not ( = ?auto_2729 ?auto_2725 ) ) ( not ( = ?auto_2704 ?auto_2707 ) ) ( not ( = ?auto_2704 ?auto_2718 ) ) ( not ( = ?auto_2705 ?auto_2707 ) ) ( not ( = ?auto_2705 ?auto_2718 ) ) ( not ( = ?auto_2707 ?auto_2729 ) ) ( not ( = ?auto_2707 ?auto_2725 ) ) ( not ( = ?auto_2713 ?auto_2726 ) ) ( not ( = ?auto_2713 ?auto_2721 ) ) ( not ( = ?auto_2717 ?auto_2723 ) ) ( not ( = ?auto_2717 ?auto_2719 ) ) ( not ( = ?auto_2718 ?auto_2729 ) ) ( not ( = ?auto_2718 ?auto_2725 ) ) ( not ( = ?auto_2704 ?auto_2708 ) ) ( not ( = ?auto_2704 ?auto_2720 ) ) ( not ( = ?auto_2705 ?auto_2708 ) ) ( not ( = ?auto_2705 ?auto_2720 ) ) ( not ( = ?auto_2706 ?auto_2708 ) ) ( not ( = ?auto_2706 ?auto_2720 ) ) ( not ( = ?auto_2708 ?auto_2718 ) ) ( not ( = ?auto_2708 ?auto_2729 ) ) ( not ( = ?auto_2708 ?auto_2725 ) ) ( not ( = ?auto_2722 ?auto_2713 ) ) ( not ( = ?auto_2722 ?auto_2726 ) ) ( not ( = ?auto_2722 ?auto_2721 ) ) ( not ( = ?auto_2727 ?auto_2717 ) ) ( not ( = ?auto_2727 ?auto_2723 ) ) ( not ( = ?auto_2727 ?auto_2719 ) ) ( not ( = ?auto_2720 ?auto_2718 ) ) ( not ( = ?auto_2720 ?auto_2729 ) ) ( not ( = ?auto_2720 ?auto_2725 ) ) ( not ( = ?auto_2704 ?auto_2710 ) ) ( not ( = ?auto_2704 ?auto_2724 ) ) ( not ( = ?auto_2705 ?auto_2710 ) ) ( not ( = ?auto_2705 ?auto_2724 ) ) ( not ( = ?auto_2706 ?auto_2710 ) ) ( not ( = ?auto_2706 ?auto_2724 ) ) ( not ( = ?auto_2707 ?auto_2710 ) ) ( not ( = ?auto_2707 ?auto_2724 ) ) ( not ( = ?auto_2710 ?auto_2720 ) ) ( not ( = ?auto_2710 ?auto_2718 ) ) ( not ( = ?auto_2710 ?auto_2729 ) ) ( not ( = ?auto_2710 ?auto_2725 ) ) ( not ( = ?auto_2724 ?auto_2720 ) ) ( not ( = ?auto_2724 ?auto_2718 ) ) ( not ( = ?auto_2724 ?auto_2729 ) ) ( not ( = ?auto_2724 ?auto_2725 ) ) ( not ( = ?auto_2704 ?auto_2709 ) ) ( not ( = ?auto_2704 ?auto_2728 ) ) ( not ( = ?auto_2705 ?auto_2709 ) ) ( not ( = ?auto_2705 ?auto_2728 ) ) ( not ( = ?auto_2706 ?auto_2709 ) ) ( not ( = ?auto_2706 ?auto_2728 ) ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( not ( = ?auto_2707 ?auto_2728 ) ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2708 ?auto_2728 ) ) ( not ( = ?auto_2709 ?auto_2724 ) ) ( not ( = ?auto_2709 ?auto_2720 ) ) ( not ( = ?auto_2709 ?auto_2718 ) ) ( not ( = ?auto_2709 ?auto_2729 ) ) ( not ( = ?auto_2709 ?auto_2725 ) ) ( not ( = ?auto_2728 ?auto_2724 ) ) ( not ( = ?auto_2728 ?auto_2720 ) ) ( not ( = ?auto_2728 ?auto_2718 ) ) ( not ( = ?auto_2728 ?auto_2729 ) ) ( not ( = ?auto_2728 ?auto_2725 ) ) ( not ( = ?auto_2704 ?auto_2711 ) ) ( not ( = ?auto_2704 ?auto_2712 ) ) ( not ( = ?auto_2705 ?auto_2711 ) ) ( not ( = ?auto_2705 ?auto_2712 ) ) ( not ( = ?auto_2706 ?auto_2711 ) ) ( not ( = ?auto_2706 ?auto_2712 ) ) ( not ( = ?auto_2707 ?auto_2711 ) ) ( not ( = ?auto_2707 ?auto_2712 ) ) ( not ( = ?auto_2708 ?auto_2711 ) ) ( not ( = ?auto_2708 ?auto_2712 ) ) ( not ( = ?auto_2710 ?auto_2711 ) ) ( not ( = ?auto_2710 ?auto_2712 ) ) ( not ( = ?auto_2711 ?auto_2728 ) ) ( not ( = ?auto_2711 ?auto_2724 ) ) ( not ( = ?auto_2711 ?auto_2720 ) ) ( not ( = ?auto_2711 ?auto_2718 ) ) ( not ( = ?auto_2711 ?auto_2729 ) ) ( not ( = ?auto_2711 ?auto_2725 ) ) ( not ( = ?auto_2712 ?auto_2728 ) ) ( not ( = ?auto_2712 ?auto_2724 ) ) ( not ( = ?auto_2712 ?auto_2720 ) ) ( not ( = ?auto_2712 ?auto_2718 ) ) ( not ( = ?auto_2712 ?auto_2729 ) ) ( not ( = ?auto_2712 ?auto_2725 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2704 ?auto_2705 ?auto_2706 ?auto_2707 ?auto_2708 ?auto_2710 ?auto_2709 )
      ( MAKE-1CRATE ?auto_2709 ?auto_2711 )
      ( MAKE-7CRATE-VERIFY ?auto_2704 ?auto_2705 ?auto_2706 ?auto_2707 ?auto_2708 ?auto_2710 ?auto_2709 ?auto_2711 ) )
  )

)

