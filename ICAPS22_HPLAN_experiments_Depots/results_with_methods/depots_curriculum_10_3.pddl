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
      ?auto_2502 - SURFACE
      ?auto_2503 - SURFACE
    )
    :vars
    (
      ?auto_2504 - HOIST
      ?auto_2505 - PLACE
      ?auto_2507 - PLACE
      ?auto_2508 - HOIST
      ?auto_2509 - SURFACE
      ?auto_2506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2504 ?auto_2505 ) ( SURFACE-AT ?auto_2503 ?auto_2505 ) ( CLEAR ?auto_2503 ) ( IS-CRATE ?auto_2502 ) ( AVAILABLE ?auto_2504 ) ( not ( = ?auto_2507 ?auto_2505 ) ) ( HOIST-AT ?auto_2508 ?auto_2507 ) ( AVAILABLE ?auto_2508 ) ( SURFACE-AT ?auto_2502 ?auto_2507 ) ( ON ?auto_2502 ?auto_2509 ) ( CLEAR ?auto_2502 ) ( TRUCK-AT ?auto_2506 ?auto_2505 ) ( not ( = ?auto_2502 ?auto_2503 ) ) ( not ( = ?auto_2502 ?auto_2509 ) ) ( not ( = ?auto_2503 ?auto_2509 ) ) ( not ( = ?auto_2504 ?auto_2508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2506 ?auto_2505 ?auto_2507 )
      ( !LIFT ?auto_2508 ?auto_2502 ?auto_2509 ?auto_2507 )
      ( !LOAD ?auto_2508 ?auto_2502 ?auto_2506 ?auto_2507 )
      ( !DRIVE ?auto_2506 ?auto_2507 ?auto_2505 )
      ( !UNLOAD ?auto_2504 ?auto_2502 ?auto_2506 ?auto_2505 )
      ( !DROP ?auto_2504 ?auto_2502 ?auto_2503 ?auto_2505 )
      ( MAKE-ON-VERIFY ?auto_2502 ?auto_2503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2512 - SURFACE
      ?auto_2513 - SURFACE
    )
    :vars
    (
      ?auto_2514 - HOIST
      ?auto_2515 - PLACE
      ?auto_2517 - PLACE
      ?auto_2518 - HOIST
      ?auto_2519 - SURFACE
      ?auto_2516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2514 ?auto_2515 ) ( SURFACE-AT ?auto_2513 ?auto_2515 ) ( CLEAR ?auto_2513 ) ( IS-CRATE ?auto_2512 ) ( AVAILABLE ?auto_2514 ) ( not ( = ?auto_2517 ?auto_2515 ) ) ( HOIST-AT ?auto_2518 ?auto_2517 ) ( AVAILABLE ?auto_2518 ) ( SURFACE-AT ?auto_2512 ?auto_2517 ) ( ON ?auto_2512 ?auto_2519 ) ( CLEAR ?auto_2512 ) ( TRUCK-AT ?auto_2516 ?auto_2515 ) ( not ( = ?auto_2512 ?auto_2513 ) ) ( not ( = ?auto_2512 ?auto_2519 ) ) ( not ( = ?auto_2513 ?auto_2519 ) ) ( not ( = ?auto_2514 ?auto_2518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2516 ?auto_2515 ?auto_2517 )
      ( !LIFT ?auto_2518 ?auto_2512 ?auto_2519 ?auto_2517 )
      ( !LOAD ?auto_2518 ?auto_2512 ?auto_2516 ?auto_2517 )
      ( !DRIVE ?auto_2516 ?auto_2517 ?auto_2515 )
      ( !UNLOAD ?auto_2514 ?auto_2512 ?auto_2516 ?auto_2515 )
      ( !DROP ?auto_2514 ?auto_2512 ?auto_2513 ?auto_2515 )
      ( MAKE-ON-VERIFY ?auto_2512 ?auto_2513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2522 - SURFACE
      ?auto_2523 - SURFACE
    )
    :vars
    (
      ?auto_2524 - HOIST
      ?auto_2525 - PLACE
      ?auto_2527 - PLACE
      ?auto_2528 - HOIST
      ?auto_2529 - SURFACE
      ?auto_2526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524 ?auto_2525 ) ( SURFACE-AT ?auto_2523 ?auto_2525 ) ( CLEAR ?auto_2523 ) ( IS-CRATE ?auto_2522 ) ( AVAILABLE ?auto_2524 ) ( not ( = ?auto_2527 ?auto_2525 ) ) ( HOIST-AT ?auto_2528 ?auto_2527 ) ( AVAILABLE ?auto_2528 ) ( SURFACE-AT ?auto_2522 ?auto_2527 ) ( ON ?auto_2522 ?auto_2529 ) ( CLEAR ?auto_2522 ) ( TRUCK-AT ?auto_2526 ?auto_2525 ) ( not ( = ?auto_2522 ?auto_2523 ) ) ( not ( = ?auto_2522 ?auto_2529 ) ) ( not ( = ?auto_2523 ?auto_2529 ) ) ( not ( = ?auto_2524 ?auto_2528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2526 ?auto_2525 ?auto_2527 )
      ( !LIFT ?auto_2528 ?auto_2522 ?auto_2529 ?auto_2527 )
      ( !LOAD ?auto_2528 ?auto_2522 ?auto_2526 ?auto_2527 )
      ( !DRIVE ?auto_2526 ?auto_2527 ?auto_2525 )
      ( !UNLOAD ?auto_2524 ?auto_2522 ?auto_2526 ?auto_2525 )
      ( !DROP ?auto_2524 ?auto_2522 ?auto_2523 ?auto_2525 )
      ( MAKE-ON-VERIFY ?auto_2522 ?auto_2523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2532 - SURFACE
      ?auto_2533 - SURFACE
    )
    :vars
    (
      ?auto_2534 - HOIST
      ?auto_2535 - PLACE
      ?auto_2537 - PLACE
      ?auto_2538 - HOIST
      ?auto_2539 - SURFACE
      ?auto_2536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534 ?auto_2535 ) ( SURFACE-AT ?auto_2533 ?auto_2535 ) ( CLEAR ?auto_2533 ) ( IS-CRATE ?auto_2532 ) ( AVAILABLE ?auto_2534 ) ( not ( = ?auto_2537 ?auto_2535 ) ) ( HOIST-AT ?auto_2538 ?auto_2537 ) ( AVAILABLE ?auto_2538 ) ( SURFACE-AT ?auto_2532 ?auto_2537 ) ( ON ?auto_2532 ?auto_2539 ) ( CLEAR ?auto_2532 ) ( TRUCK-AT ?auto_2536 ?auto_2535 ) ( not ( = ?auto_2532 ?auto_2533 ) ) ( not ( = ?auto_2532 ?auto_2539 ) ) ( not ( = ?auto_2533 ?auto_2539 ) ) ( not ( = ?auto_2534 ?auto_2538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2536 ?auto_2535 ?auto_2537 )
      ( !LIFT ?auto_2538 ?auto_2532 ?auto_2539 ?auto_2537 )
      ( !LOAD ?auto_2538 ?auto_2532 ?auto_2536 ?auto_2537 )
      ( !DRIVE ?auto_2536 ?auto_2537 ?auto_2535 )
      ( !UNLOAD ?auto_2534 ?auto_2532 ?auto_2536 ?auto_2535 )
      ( !DROP ?auto_2534 ?auto_2532 ?auto_2533 ?auto_2535 )
      ( MAKE-ON-VERIFY ?auto_2532 ?auto_2533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2542 - SURFACE
      ?auto_2543 - SURFACE
    )
    :vars
    (
      ?auto_2544 - HOIST
      ?auto_2545 - PLACE
      ?auto_2547 - PLACE
      ?auto_2548 - HOIST
      ?auto_2549 - SURFACE
      ?auto_2546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544 ?auto_2545 ) ( SURFACE-AT ?auto_2543 ?auto_2545 ) ( CLEAR ?auto_2543 ) ( IS-CRATE ?auto_2542 ) ( AVAILABLE ?auto_2544 ) ( not ( = ?auto_2547 ?auto_2545 ) ) ( HOIST-AT ?auto_2548 ?auto_2547 ) ( AVAILABLE ?auto_2548 ) ( SURFACE-AT ?auto_2542 ?auto_2547 ) ( ON ?auto_2542 ?auto_2549 ) ( CLEAR ?auto_2542 ) ( TRUCK-AT ?auto_2546 ?auto_2545 ) ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2549 ) ) ( not ( = ?auto_2543 ?auto_2549 ) ) ( not ( = ?auto_2544 ?auto_2548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2546 ?auto_2545 ?auto_2547 )
      ( !LIFT ?auto_2548 ?auto_2542 ?auto_2549 ?auto_2547 )
      ( !LOAD ?auto_2548 ?auto_2542 ?auto_2546 ?auto_2547 )
      ( !DRIVE ?auto_2546 ?auto_2547 ?auto_2545 )
      ( !UNLOAD ?auto_2544 ?auto_2542 ?auto_2546 ?auto_2545 )
      ( !DROP ?auto_2544 ?auto_2542 ?auto_2543 ?auto_2545 )
      ( MAKE-ON-VERIFY ?auto_2542 ?auto_2543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2552 - SURFACE
      ?auto_2553 - SURFACE
    )
    :vars
    (
      ?auto_2554 - HOIST
      ?auto_2555 - PLACE
      ?auto_2557 - PLACE
      ?auto_2558 - HOIST
      ?auto_2559 - SURFACE
      ?auto_2556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2554 ?auto_2555 ) ( SURFACE-AT ?auto_2553 ?auto_2555 ) ( CLEAR ?auto_2553 ) ( IS-CRATE ?auto_2552 ) ( AVAILABLE ?auto_2554 ) ( not ( = ?auto_2557 ?auto_2555 ) ) ( HOIST-AT ?auto_2558 ?auto_2557 ) ( AVAILABLE ?auto_2558 ) ( SURFACE-AT ?auto_2552 ?auto_2557 ) ( ON ?auto_2552 ?auto_2559 ) ( CLEAR ?auto_2552 ) ( TRUCK-AT ?auto_2556 ?auto_2555 ) ( not ( = ?auto_2552 ?auto_2553 ) ) ( not ( = ?auto_2552 ?auto_2559 ) ) ( not ( = ?auto_2553 ?auto_2559 ) ) ( not ( = ?auto_2554 ?auto_2558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2556 ?auto_2555 ?auto_2557 )
      ( !LIFT ?auto_2558 ?auto_2552 ?auto_2559 ?auto_2557 )
      ( !LOAD ?auto_2558 ?auto_2552 ?auto_2556 ?auto_2557 )
      ( !DRIVE ?auto_2556 ?auto_2557 ?auto_2555 )
      ( !UNLOAD ?auto_2554 ?auto_2552 ?auto_2556 ?auto_2555 )
      ( !DROP ?auto_2554 ?auto_2552 ?auto_2553 ?auto_2555 )
      ( MAKE-ON-VERIFY ?auto_2552 ?auto_2553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2562 - SURFACE
      ?auto_2563 - SURFACE
    )
    :vars
    (
      ?auto_2564 - HOIST
      ?auto_2565 - PLACE
      ?auto_2567 - PLACE
      ?auto_2568 - HOIST
      ?auto_2569 - SURFACE
      ?auto_2566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2564 ?auto_2565 ) ( SURFACE-AT ?auto_2563 ?auto_2565 ) ( CLEAR ?auto_2563 ) ( IS-CRATE ?auto_2562 ) ( AVAILABLE ?auto_2564 ) ( not ( = ?auto_2567 ?auto_2565 ) ) ( HOIST-AT ?auto_2568 ?auto_2567 ) ( AVAILABLE ?auto_2568 ) ( SURFACE-AT ?auto_2562 ?auto_2567 ) ( ON ?auto_2562 ?auto_2569 ) ( CLEAR ?auto_2562 ) ( TRUCK-AT ?auto_2566 ?auto_2565 ) ( not ( = ?auto_2562 ?auto_2563 ) ) ( not ( = ?auto_2562 ?auto_2569 ) ) ( not ( = ?auto_2563 ?auto_2569 ) ) ( not ( = ?auto_2564 ?auto_2568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2566 ?auto_2565 ?auto_2567 )
      ( !LIFT ?auto_2568 ?auto_2562 ?auto_2569 ?auto_2567 )
      ( !LOAD ?auto_2568 ?auto_2562 ?auto_2566 ?auto_2567 )
      ( !DRIVE ?auto_2566 ?auto_2567 ?auto_2565 )
      ( !UNLOAD ?auto_2564 ?auto_2562 ?auto_2566 ?auto_2565 )
      ( !DROP ?auto_2564 ?auto_2562 ?auto_2563 ?auto_2565 )
      ( MAKE-ON-VERIFY ?auto_2562 ?auto_2563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2572 - SURFACE
      ?auto_2573 - SURFACE
    )
    :vars
    (
      ?auto_2574 - HOIST
      ?auto_2575 - PLACE
      ?auto_2577 - PLACE
      ?auto_2578 - HOIST
      ?auto_2579 - SURFACE
      ?auto_2576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574 ?auto_2575 ) ( SURFACE-AT ?auto_2573 ?auto_2575 ) ( CLEAR ?auto_2573 ) ( IS-CRATE ?auto_2572 ) ( AVAILABLE ?auto_2574 ) ( not ( = ?auto_2577 ?auto_2575 ) ) ( HOIST-AT ?auto_2578 ?auto_2577 ) ( AVAILABLE ?auto_2578 ) ( SURFACE-AT ?auto_2572 ?auto_2577 ) ( ON ?auto_2572 ?auto_2579 ) ( CLEAR ?auto_2572 ) ( TRUCK-AT ?auto_2576 ?auto_2575 ) ( not ( = ?auto_2572 ?auto_2573 ) ) ( not ( = ?auto_2572 ?auto_2579 ) ) ( not ( = ?auto_2573 ?auto_2579 ) ) ( not ( = ?auto_2574 ?auto_2578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2576 ?auto_2575 ?auto_2577 )
      ( !LIFT ?auto_2578 ?auto_2572 ?auto_2579 ?auto_2577 )
      ( !LOAD ?auto_2578 ?auto_2572 ?auto_2576 ?auto_2577 )
      ( !DRIVE ?auto_2576 ?auto_2577 ?auto_2575 )
      ( !UNLOAD ?auto_2574 ?auto_2572 ?auto_2576 ?auto_2575 )
      ( !DROP ?auto_2574 ?auto_2572 ?auto_2573 ?auto_2575 )
      ( MAKE-ON-VERIFY ?auto_2572 ?auto_2573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2582 - SURFACE
      ?auto_2583 - SURFACE
    )
    :vars
    (
      ?auto_2584 - HOIST
      ?auto_2585 - PLACE
      ?auto_2587 - PLACE
      ?auto_2588 - HOIST
      ?auto_2589 - SURFACE
      ?auto_2586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2584 ?auto_2585 ) ( SURFACE-AT ?auto_2583 ?auto_2585 ) ( CLEAR ?auto_2583 ) ( IS-CRATE ?auto_2582 ) ( AVAILABLE ?auto_2584 ) ( not ( = ?auto_2587 ?auto_2585 ) ) ( HOIST-AT ?auto_2588 ?auto_2587 ) ( AVAILABLE ?auto_2588 ) ( SURFACE-AT ?auto_2582 ?auto_2587 ) ( ON ?auto_2582 ?auto_2589 ) ( CLEAR ?auto_2582 ) ( TRUCK-AT ?auto_2586 ?auto_2585 ) ( not ( = ?auto_2582 ?auto_2583 ) ) ( not ( = ?auto_2582 ?auto_2589 ) ) ( not ( = ?auto_2583 ?auto_2589 ) ) ( not ( = ?auto_2584 ?auto_2588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2586 ?auto_2585 ?auto_2587 )
      ( !LIFT ?auto_2588 ?auto_2582 ?auto_2589 ?auto_2587 )
      ( !LOAD ?auto_2588 ?auto_2582 ?auto_2586 ?auto_2587 )
      ( !DRIVE ?auto_2586 ?auto_2587 ?auto_2585 )
      ( !UNLOAD ?auto_2584 ?auto_2582 ?auto_2586 ?auto_2585 )
      ( !DROP ?auto_2584 ?auto_2582 ?auto_2583 ?auto_2585 )
      ( MAKE-ON-VERIFY ?auto_2582 ?auto_2583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2592 - SURFACE
      ?auto_2593 - SURFACE
    )
    :vars
    (
      ?auto_2594 - HOIST
      ?auto_2595 - PLACE
      ?auto_2597 - PLACE
      ?auto_2598 - HOIST
      ?auto_2599 - SURFACE
      ?auto_2596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2594 ?auto_2595 ) ( SURFACE-AT ?auto_2593 ?auto_2595 ) ( CLEAR ?auto_2593 ) ( IS-CRATE ?auto_2592 ) ( AVAILABLE ?auto_2594 ) ( not ( = ?auto_2597 ?auto_2595 ) ) ( HOIST-AT ?auto_2598 ?auto_2597 ) ( AVAILABLE ?auto_2598 ) ( SURFACE-AT ?auto_2592 ?auto_2597 ) ( ON ?auto_2592 ?auto_2599 ) ( CLEAR ?auto_2592 ) ( TRUCK-AT ?auto_2596 ?auto_2595 ) ( not ( = ?auto_2592 ?auto_2593 ) ) ( not ( = ?auto_2592 ?auto_2599 ) ) ( not ( = ?auto_2593 ?auto_2599 ) ) ( not ( = ?auto_2594 ?auto_2598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2596 ?auto_2595 ?auto_2597 )
      ( !LIFT ?auto_2598 ?auto_2592 ?auto_2599 ?auto_2597 )
      ( !LOAD ?auto_2598 ?auto_2592 ?auto_2596 ?auto_2597 )
      ( !DRIVE ?auto_2596 ?auto_2597 ?auto_2595 )
      ( !UNLOAD ?auto_2594 ?auto_2592 ?auto_2596 ?auto_2595 )
      ( !DROP ?auto_2594 ?auto_2592 ?auto_2593 ?auto_2595 )
      ( MAKE-ON-VERIFY ?auto_2592 ?auto_2593 ) )
  )

)

