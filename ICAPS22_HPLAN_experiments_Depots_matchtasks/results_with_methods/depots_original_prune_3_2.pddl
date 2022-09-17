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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2521 - SURFACE
      ?auto_2522 - SURFACE
    )
    :vars
    (
      ?auto_2523 - HOIST
      ?auto_2524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523 ?auto_2524 ) ( SURFACE-AT ?auto_2521 ?auto_2524 ) ( CLEAR ?auto_2521 ) ( LIFTING ?auto_2523 ?auto_2522 ) ( IS-CRATE ?auto_2522 ) ( not ( = ?auto_2521 ?auto_2522 ) ) )
    :subtasks
    ( ( !DROP ?auto_2523 ?auto_2522 ?auto_2521 ?auto_2524 )
      ( MAKE-1CRATE-VERIFY ?auto_2521 ?auto_2522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525 - SURFACE
      ?auto_2526 - SURFACE
    )
    :vars
    (
      ?auto_2528 - HOIST
      ?auto_2527 - PLACE
      ?auto_2529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528 ?auto_2527 ) ( SURFACE-AT ?auto_2525 ?auto_2527 ) ( CLEAR ?auto_2525 ) ( IS-CRATE ?auto_2526 ) ( not ( = ?auto_2525 ?auto_2526 ) ) ( TRUCK-AT ?auto_2529 ?auto_2527 ) ( AVAILABLE ?auto_2528 ) ( IN ?auto_2526 ?auto_2529 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2528 ?auto_2526 ?auto_2529 ?auto_2527 )
      ( MAKE-1CRATE ?auto_2525 ?auto_2526 )
      ( MAKE-1CRATE-VERIFY ?auto_2525 ?auto_2526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2530 - SURFACE
      ?auto_2531 - SURFACE
    )
    :vars
    (
      ?auto_2532 - HOIST
      ?auto_2533 - PLACE
      ?auto_2534 - TRUCK
      ?auto_2535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532 ?auto_2533 ) ( SURFACE-AT ?auto_2530 ?auto_2533 ) ( CLEAR ?auto_2530 ) ( IS-CRATE ?auto_2531 ) ( not ( = ?auto_2530 ?auto_2531 ) ) ( AVAILABLE ?auto_2532 ) ( IN ?auto_2531 ?auto_2534 ) ( TRUCK-AT ?auto_2534 ?auto_2535 ) ( not ( = ?auto_2535 ?auto_2533 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2534 ?auto_2535 ?auto_2533 )
      ( MAKE-1CRATE ?auto_2530 ?auto_2531 )
      ( MAKE-1CRATE-VERIFY ?auto_2530 ?auto_2531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2536 - SURFACE
      ?auto_2537 - SURFACE
    )
    :vars
    (
      ?auto_2539 - HOIST
      ?auto_2538 - PLACE
      ?auto_2541 - TRUCK
      ?auto_2540 - PLACE
      ?auto_2542 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2539 ?auto_2538 ) ( SURFACE-AT ?auto_2536 ?auto_2538 ) ( CLEAR ?auto_2536 ) ( IS-CRATE ?auto_2537 ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( AVAILABLE ?auto_2539 ) ( TRUCK-AT ?auto_2541 ?auto_2540 ) ( not ( = ?auto_2540 ?auto_2538 ) ) ( HOIST-AT ?auto_2542 ?auto_2540 ) ( LIFTING ?auto_2542 ?auto_2537 ) ( not ( = ?auto_2539 ?auto_2542 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2542 ?auto_2537 ?auto_2541 ?auto_2540 )
      ( MAKE-1CRATE ?auto_2536 ?auto_2537 )
      ( MAKE-1CRATE-VERIFY ?auto_2536 ?auto_2537 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2543 - SURFACE
      ?auto_2544 - SURFACE
    )
    :vars
    (
      ?auto_2547 - HOIST
      ?auto_2549 - PLACE
      ?auto_2546 - TRUCK
      ?auto_2545 - PLACE
      ?auto_2548 - HOIST
      ?auto_2550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2547 ?auto_2549 ) ( SURFACE-AT ?auto_2543 ?auto_2549 ) ( CLEAR ?auto_2543 ) ( IS-CRATE ?auto_2544 ) ( not ( = ?auto_2543 ?auto_2544 ) ) ( AVAILABLE ?auto_2547 ) ( TRUCK-AT ?auto_2546 ?auto_2545 ) ( not ( = ?auto_2545 ?auto_2549 ) ) ( HOIST-AT ?auto_2548 ?auto_2545 ) ( not ( = ?auto_2547 ?auto_2548 ) ) ( AVAILABLE ?auto_2548 ) ( SURFACE-AT ?auto_2544 ?auto_2545 ) ( ON ?auto_2544 ?auto_2550 ) ( CLEAR ?auto_2544 ) ( not ( = ?auto_2543 ?auto_2550 ) ) ( not ( = ?auto_2544 ?auto_2550 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2548 ?auto_2544 ?auto_2550 ?auto_2545 )
      ( MAKE-1CRATE ?auto_2543 ?auto_2544 )
      ( MAKE-1CRATE-VERIFY ?auto_2543 ?auto_2544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2551 - SURFACE
      ?auto_2552 - SURFACE
    )
    :vars
    (
      ?auto_2554 - HOIST
      ?auto_2557 - PLACE
      ?auto_2558 - PLACE
      ?auto_2555 - HOIST
      ?auto_2556 - SURFACE
      ?auto_2553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2554 ?auto_2557 ) ( SURFACE-AT ?auto_2551 ?auto_2557 ) ( CLEAR ?auto_2551 ) ( IS-CRATE ?auto_2552 ) ( not ( = ?auto_2551 ?auto_2552 ) ) ( AVAILABLE ?auto_2554 ) ( not ( = ?auto_2558 ?auto_2557 ) ) ( HOIST-AT ?auto_2555 ?auto_2558 ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( AVAILABLE ?auto_2555 ) ( SURFACE-AT ?auto_2552 ?auto_2558 ) ( ON ?auto_2552 ?auto_2556 ) ( CLEAR ?auto_2552 ) ( not ( = ?auto_2551 ?auto_2556 ) ) ( not ( = ?auto_2552 ?auto_2556 ) ) ( TRUCK-AT ?auto_2553 ?auto_2557 ) )
    :subtasks
    ( ( !DRIVE ?auto_2553 ?auto_2557 ?auto_2558 )
      ( MAKE-1CRATE ?auto_2551 ?auto_2552 )
      ( MAKE-1CRATE-VERIFY ?auto_2551 ?auto_2552 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2568 - SURFACE
      ?auto_2569 - SURFACE
      ?auto_2570 - SURFACE
    )
    :vars
    (
      ?auto_2571 - HOIST
      ?auto_2572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2571 ?auto_2572 ) ( SURFACE-AT ?auto_2569 ?auto_2572 ) ( CLEAR ?auto_2569 ) ( LIFTING ?auto_2571 ?auto_2570 ) ( IS-CRATE ?auto_2570 ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( ON ?auto_2569 ?auto_2568 ) ( not ( = ?auto_2568 ?auto_2569 ) ) ( not ( = ?auto_2568 ?auto_2570 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2569 ?auto_2570 )
      ( MAKE-2CRATE-VERIFY ?auto_2568 ?auto_2569 ?auto_2570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2578 - SURFACE
      ?auto_2579 - SURFACE
      ?auto_2580 - SURFACE
    )
    :vars
    (
      ?auto_2583 - HOIST
      ?auto_2582 - PLACE
      ?auto_2581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2583 ?auto_2582 ) ( SURFACE-AT ?auto_2579 ?auto_2582 ) ( CLEAR ?auto_2579 ) ( IS-CRATE ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( TRUCK-AT ?auto_2581 ?auto_2582 ) ( AVAILABLE ?auto_2583 ) ( IN ?auto_2580 ?auto_2581 ) ( ON ?auto_2579 ?auto_2578 ) ( not ( = ?auto_2578 ?auto_2579 ) ) ( not ( = ?auto_2578 ?auto_2580 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2579 ?auto_2580 )
      ( MAKE-2CRATE-VERIFY ?auto_2578 ?auto_2579 ?auto_2580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2584 - SURFACE
      ?auto_2585 - SURFACE
    )
    :vars
    (
      ?auto_2589 - HOIST
      ?auto_2587 - PLACE
      ?auto_2586 - TRUCK
      ?auto_2588 - SURFACE
      ?auto_2590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2589 ?auto_2587 ) ( SURFACE-AT ?auto_2584 ?auto_2587 ) ( CLEAR ?auto_2584 ) ( IS-CRATE ?auto_2585 ) ( not ( = ?auto_2584 ?auto_2585 ) ) ( AVAILABLE ?auto_2589 ) ( IN ?auto_2585 ?auto_2586 ) ( ON ?auto_2584 ?auto_2588 ) ( not ( = ?auto_2588 ?auto_2584 ) ) ( not ( = ?auto_2588 ?auto_2585 ) ) ( TRUCK-AT ?auto_2586 ?auto_2590 ) ( not ( = ?auto_2590 ?auto_2587 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2586 ?auto_2590 ?auto_2587 )
      ( MAKE-2CRATE ?auto_2588 ?auto_2584 ?auto_2585 )
      ( MAKE-1CRATE-VERIFY ?auto_2584 ?auto_2585 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2591 - SURFACE
      ?auto_2592 - SURFACE
      ?auto_2593 - SURFACE
    )
    :vars
    (
      ?auto_2597 - HOIST
      ?auto_2596 - PLACE
      ?auto_2594 - TRUCK
      ?auto_2595 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2597 ?auto_2596 ) ( SURFACE-AT ?auto_2592 ?auto_2596 ) ( CLEAR ?auto_2592 ) ( IS-CRATE ?auto_2593 ) ( not ( = ?auto_2592 ?auto_2593 ) ) ( AVAILABLE ?auto_2597 ) ( IN ?auto_2593 ?auto_2594 ) ( ON ?auto_2592 ?auto_2591 ) ( not ( = ?auto_2591 ?auto_2592 ) ) ( not ( = ?auto_2591 ?auto_2593 ) ) ( TRUCK-AT ?auto_2594 ?auto_2595 ) ( not ( = ?auto_2595 ?auto_2596 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2592 ?auto_2593 )
      ( MAKE-2CRATE-VERIFY ?auto_2591 ?auto_2592 ?auto_2593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2598 - SURFACE
      ?auto_2599 - SURFACE
    )
    :vars
    (
      ?auto_2604 - HOIST
      ?auto_2601 - PLACE
      ?auto_2600 - SURFACE
      ?auto_2603 - TRUCK
      ?auto_2602 - PLACE
      ?auto_2605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2604 ?auto_2601 ) ( SURFACE-AT ?auto_2598 ?auto_2601 ) ( CLEAR ?auto_2598 ) ( IS-CRATE ?auto_2599 ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( AVAILABLE ?auto_2604 ) ( ON ?auto_2598 ?auto_2600 ) ( not ( = ?auto_2600 ?auto_2598 ) ) ( not ( = ?auto_2600 ?auto_2599 ) ) ( TRUCK-AT ?auto_2603 ?auto_2602 ) ( not ( = ?auto_2602 ?auto_2601 ) ) ( HOIST-AT ?auto_2605 ?auto_2602 ) ( LIFTING ?auto_2605 ?auto_2599 ) ( not ( = ?auto_2604 ?auto_2605 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2605 ?auto_2599 ?auto_2603 ?auto_2602 )
      ( MAKE-2CRATE ?auto_2600 ?auto_2598 ?auto_2599 )
      ( MAKE-1CRATE-VERIFY ?auto_2598 ?auto_2599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2606 - SURFACE
      ?auto_2607 - SURFACE
      ?auto_2608 - SURFACE
    )
    :vars
    (
      ?auto_2609 - HOIST
      ?auto_2613 - PLACE
      ?auto_2610 - TRUCK
      ?auto_2612 - PLACE
      ?auto_2611 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609 ?auto_2613 ) ( SURFACE-AT ?auto_2607 ?auto_2613 ) ( CLEAR ?auto_2607 ) ( IS-CRATE ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2608 ) ) ( AVAILABLE ?auto_2609 ) ( ON ?auto_2607 ?auto_2606 ) ( not ( = ?auto_2606 ?auto_2607 ) ) ( not ( = ?auto_2606 ?auto_2608 ) ) ( TRUCK-AT ?auto_2610 ?auto_2612 ) ( not ( = ?auto_2612 ?auto_2613 ) ) ( HOIST-AT ?auto_2611 ?auto_2612 ) ( LIFTING ?auto_2611 ?auto_2608 ) ( not ( = ?auto_2609 ?auto_2611 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2607 ?auto_2608 )
      ( MAKE-2CRATE-VERIFY ?auto_2606 ?auto_2607 ?auto_2608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2614 - SURFACE
      ?auto_2615 - SURFACE
    )
    :vars
    (
      ?auto_2621 - HOIST
      ?auto_2620 - PLACE
      ?auto_2618 - SURFACE
      ?auto_2617 - TRUCK
      ?auto_2616 - PLACE
      ?auto_2619 - HOIST
      ?auto_2622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2621 ?auto_2620 ) ( SURFACE-AT ?auto_2614 ?auto_2620 ) ( CLEAR ?auto_2614 ) ( IS-CRATE ?auto_2615 ) ( not ( = ?auto_2614 ?auto_2615 ) ) ( AVAILABLE ?auto_2621 ) ( ON ?auto_2614 ?auto_2618 ) ( not ( = ?auto_2618 ?auto_2614 ) ) ( not ( = ?auto_2618 ?auto_2615 ) ) ( TRUCK-AT ?auto_2617 ?auto_2616 ) ( not ( = ?auto_2616 ?auto_2620 ) ) ( HOIST-AT ?auto_2619 ?auto_2616 ) ( not ( = ?auto_2621 ?auto_2619 ) ) ( AVAILABLE ?auto_2619 ) ( SURFACE-AT ?auto_2615 ?auto_2616 ) ( ON ?auto_2615 ?auto_2622 ) ( CLEAR ?auto_2615 ) ( not ( = ?auto_2614 ?auto_2622 ) ) ( not ( = ?auto_2615 ?auto_2622 ) ) ( not ( = ?auto_2618 ?auto_2622 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2619 ?auto_2615 ?auto_2622 ?auto_2616 )
      ( MAKE-2CRATE ?auto_2618 ?auto_2614 ?auto_2615 )
      ( MAKE-1CRATE-VERIFY ?auto_2614 ?auto_2615 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2623 - SURFACE
      ?auto_2624 - SURFACE
      ?auto_2625 - SURFACE
    )
    :vars
    (
      ?auto_2628 - HOIST
      ?auto_2626 - PLACE
      ?auto_2627 - TRUCK
      ?auto_2629 - PLACE
      ?auto_2630 - HOIST
      ?auto_2631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2628 ?auto_2626 ) ( SURFACE-AT ?auto_2624 ?auto_2626 ) ( CLEAR ?auto_2624 ) ( IS-CRATE ?auto_2625 ) ( not ( = ?auto_2624 ?auto_2625 ) ) ( AVAILABLE ?auto_2628 ) ( ON ?auto_2624 ?auto_2623 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( not ( = ?auto_2623 ?auto_2625 ) ) ( TRUCK-AT ?auto_2627 ?auto_2629 ) ( not ( = ?auto_2629 ?auto_2626 ) ) ( HOIST-AT ?auto_2630 ?auto_2629 ) ( not ( = ?auto_2628 ?auto_2630 ) ) ( AVAILABLE ?auto_2630 ) ( SURFACE-AT ?auto_2625 ?auto_2629 ) ( ON ?auto_2625 ?auto_2631 ) ( CLEAR ?auto_2625 ) ( not ( = ?auto_2624 ?auto_2631 ) ) ( not ( = ?auto_2625 ?auto_2631 ) ) ( not ( = ?auto_2623 ?auto_2631 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2624 ?auto_2625 )
      ( MAKE-2CRATE-VERIFY ?auto_2623 ?auto_2624 ?auto_2625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2632 - SURFACE
      ?auto_2633 - SURFACE
    )
    :vars
    (
      ?auto_2638 - HOIST
      ?auto_2634 - PLACE
      ?auto_2636 - SURFACE
      ?auto_2635 - PLACE
      ?auto_2640 - HOIST
      ?auto_2637 - SURFACE
      ?auto_2639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2638 ?auto_2634 ) ( SURFACE-AT ?auto_2632 ?auto_2634 ) ( CLEAR ?auto_2632 ) ( IS-CRATE ?auto_2633 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( AVAILABLE ?auto_2638 ) ( ON ?auto_2632 ?auto_2636 ) ( not ( = ?auto_2636 ?auto_2632 ) ) ( not ( = ?auto_2636 ?auto_2633 ) ) ( not ( = ?auto_2635 ?auto_2634 ) ) ( HOIST-AT ?auto_2640 ?auto_2635 ) ( not ( = ?auto_2638 ?auto_2640 ) ) ( AVAILABLE ?auto_2640 ) ( SURFACE-AT ?auto_2633 ?auto_2635 ) ( ON ?auto_2633 ?auto_2637 ) ( CLEAR ?auto_2633 ) ( not ( = ?auto_2632 ?auto_2637 ) ) ( not ( = ?auto_2633 ?auto_2637 ) ) ( not ( = ?auto_2636 ?auto_2637 ) ) ( TRUCK-AT ?auto_2639 ?auto_2634 ) )
    :subtasks
    ( ( !DRIVE ?auto_2639 ?auto_2634 ?auto_2635 )
      ( MAKE-2CRATE ?auto_2636 ?auto_2632 ?auto_2633 )
      ( MAKE-1CRATE-VERIFY ?auto_2632 ?auto_2633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2641 - SURFACE
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
    )
    :vars
    (
      ?auto_2644 - HOIST
      ?auto_2649 - PLACE
      ?auto_2648 - PLACE
      ?auto_2645 - HOIST
      ?auto_2646 - SURFACE
      ?auto_2647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2644 ?auto_2649 ) ( SURFACE-AT ?auto_2642 ?auto_2649 ) ( CLEAR ?auto_2642 ) ( IS-CRATE ?auto_2643 ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( AVAILABLE ?auto_2644 ) ( ON ?auto_2642 ?auto_2641 ) ( not ( = ?auto_2641 ?auto_2642 ) ) ( not ( = ?auto_2641 ?auto_2643 ) ) ( not ( = ?auto_2648 ?auto_2649 ) ) ( HOIST-AT ?auto_2645 ?auto_2648 ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( AVAILABLE ?auto_2645 ) ( SURFACE-AT ?auto_2643 ?auto_2648 ) ( ON ?auto_2643 ?auto_2646 ) ( CLEAR ?auto_2643 ) ( not ( = ?auto_2642 ?auto_2646 ) ) ( not ( = ?auto_2643 ?auto_2646 ) ) ( not ( = ?auto_2641 ?auto_2646 ) ) ( TRUCK-AT ?auto_2647 ?auto_2649 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2642 ?auto_2643 )
      ( MAKE-2CRATE-VERIFY ?auto_2641 ?auto_2642 ?auto_2643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2650 - SURFACE
      ?auto_2651 - SURFACE
    )
    :vars
    (
      ?auto_2653 - HOIST
      ?auto_2652 - PLACE
      ?auto_2654 - SURFACE
      ?auto_2658 - PLACE
      ?auto_2655 - HOIST
      ?auto_2656 - SURFACE
      ?auto_2657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2653 ?auto_2652 ) ( IS-CRATE ?auto_2651 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( not ( = ?auto_2654 ?auto_2650 ) ) ( not ( = ?auto_2654 ?auto_2651 ) ) ( not ( = ?auto_2658 ?auto_2652 ) ) ( HOIST-AT ?auto_2655 ?auto_2658 ) ( not ( = ?auto_2653 ?auto_2655 ) ) ( AVAILABLE ?auto_2655 ) ( SURFACE-AT ?auto_2651 ?auto_2658 ) ( ON ?auto_2651 ?auto_2656 ) ( CLEAR ?auto_2651 ) ( not ( = ?auto_2650 ?auto_2656 ) ) ( not ( = ?auto_2651 ?auto_2656 ) ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( TRUCK-AT ?auto_2657 ?auto_2652 ) ( SURFACE-AT ?auto_2654 ?auto_2652 ) ( CLEAR ?auto_2654 ) ( LIFTING ?auto_2653 ?auto_2650 ) ( IS-CRATE ?auto_2650 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2654 ?auto_2650 )
      ( MAKE-2CRATE ?auto_2654 ?auto_2650 ?auto_2651 )
      ( MAKE-1CRATE-VERIFY ?auto_2650 ?auto_2651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2659 - SURFACE
      ?auto_2660 - SURFACE
      ?auto_2661 - SURFACE
    )
    :vars
    (
      ?auto_2667 - HOIST
      ?auto_2663 - PLACE
      ?auto_2665 - PLACE
      ?auto_2662 - HOIST
      ?auto_2666 - SURFACE
      ?auto_2664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2667 ?auto_2663 ) ( IS-CRATE ?auto_2661 ) ( not ( = ?auto_2660 ?auto_2661 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2661 ) ) ( not ( = ?auto_2665 ?auto_2663 ) ) ( HOIST-AT ?auto_2662 ?auto_2665 ) ( not ( = ?auto_2667 ?auto_2662 ) ) ( AVAILABLE ?auto_2662 ) ( SURFACE-AT ?auto_2661 ?auto_2665 ) ( ON ?auto_2661 ?auto_2666 ) ( CLEAR ?auto_2661 ) ( not ( = ?auto_2660 ?auto_2666 ) ) ( not ( = ?auto_2661 ?auto_2666 ) ) ( not ( = ?auto_2659 ?auto_2666 ) ) ( TRUCK-AT ?auto_2664 ?auto_2663 ) ( SURFACE-AT ?auto_2659 ?auto_2663 ) ( CLEAR ?auto_2659 ) ( LIFTING ?auto_2667 ?auto_2660 ) ( IS-CRATE ?auto_2660 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2660 ?auto_2661 )
      ( MAKE-2CRATE-VERIFY ?auto_2659 ?auto_2660 ?auto_2661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2668 - SURFACE
      ?auto_2669 - SURFACE
    )
    :vars
    (
      ?auto_2676 - HOIST
      ?auto_2671 - PLACE
      ?auto_2670 - SURFACE
      ?auto_2673 - PLACE
      ?auto_2674 - HOIST
      ?auto_2675 - SURFACE
      ?auto_2672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676 ?auto_2671 ) ( IS-CRATE ?auto_2669 ) ( not ( = ?auto_2668 ?auto_2669 ) ) ( not ( = ?auto_2670 ?auto_2668 ) ) ( not ( = ?auto_2670 ?auto_2669 ) ) ( not ( = ?auto_2673 ?auto_2671 ) ) ( HOIST-AT ?auto_2674 ?auto_2673 ) ( not ( = ?auto_2676 ?auto_2674 ) ) ( AVAILABLE ?auto_2674 ) ( SURFACE-AT ?auto_2669 ?auto_2673 ) ( ON ?auto_2669 ?auto_2675 ) ( CLEAR ?auto_2669 ) ( not ( = ?auto_2668 ?auto_2675 ) ) ( not ( = ?auto_2669 ?auto_2675 ) ) ( not ( = ?auto_2670 ?auto_2675 ) ) ( TRUCK-AT ?auto_2672 ?auto_2671 ) ( SURFACE-AT ?auto_2670 ?auto_2671 ) ( CLEAR ?auto_2670 ) ( IS-CRATE ?auto_2668 ) ( AVAILABLE ?auto_2676 ) ( IN ?auto_2668 ?auto_2672 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2676 ?auto_2668 ?auto_2672 ?auto_2671 )
      ( MAKE-2CRATE ?auto_2670 ?auto_2668 ?auto_2669 )
      ( MAKE-1CRATE-VERIFY ?auto_2668 ?auto_2669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2677 - SURFACE
      ?auto_2678 - SURFACE
      ?auto_2679 - SURFACE
    )
    :vars
    (
      ?auto_2684 - HOIST
      ?auto_2682 - PLACE
      ?auto_2685 - PLACE
      ?auto_2683 - HOIST
      ?auto_2680 - SURFACE
      ?auto_2681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684 ?auto_2682 ) ( IS-CRATE ?auto_2679 ) ( not ( = ?auto_2678 ?auto_2679 ) ) ( not ( = ?auto_2677 ?auto_2678 ) ) ( not ( = ?auto_2677 ?auto_2679 ) ) ( not ( = ?auto_2685 ?auto_2682 ) ) ( HOIST-AT ?auto_2683 ?auto_2685 ) ( not ( = ?auto_2684 ?auto_2683 ) ) ( AVAILABLE ?auto_2683 ) ( SURFACE-AT ?auto_2679 ?auto_2685 ) ( ON ?auto_2679 ?auto_2680 ) ( CLEAR ?auto_2679 ) ( not ( = ?auto_2678 ?auto_2680 ) ) ( not ( = ?auto_2679 ?auto_2680 ) ) ( not ( = ?auto_2677 ?auto_2680 ) ) ( TRUCK-AT ?auto_2681 ?auto_2682 ) ( SURFACE-AT ?auto_2677 ?auto_2682 ) ( CLEAR ?auto_2677 ) ( IS-CRATE ?auto_2678 ) ( AVAILABLE ?auto_2684 ) ( IN ?auto_2678 ?auto_2681 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2678 ?auto_2679 )
      ( MAKE-2CRATE-VERIFY ?auto_2677 ?auto_2678 ?auto_2679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2722 - SURFACE
      ?auto_2723 - SURFACE
    )
    :vars
    (
      ?auto_2727 - HOIST
      ?auto_2728 - PLACE
      ?auto_2729 - SURFACE
      ?auto_2724 - PLACE
      ?auto_2725 - HOIST
      ?auto_2726 - SURFACE
      ?auto_2730 - TRUCK
      ?auto_2731 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2727 ?auto_2728 ) ( SURFACE-AT ?auto_2722 ?auto_2728 ) ( CLEAR ?auto_2722 ) ( IS-CRATE ?auto_2723 ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( AVAILABLE ?auto_2727 ) ( ON ?auto_2722 ?auto_2729 ) ( not ( = ?auto_2729 ?auto_2722 ) ) ( not ( = ?auto_2729 ?auto_2723 ) ) ( not ( = ?auto_2724 ?auto_2728 ) ) ( HOIST-AT ?auto_2725 ?auto_2724 ) ( not ( = ?auto_2727 ?auto_2725 ) ) ( AVAILABLE ?auto_2725 ) ( SURFACE-AT ?auto_2723 ?auto_2724 ) ( ON ?auto_2723 ?auto_2726 ) ( CLEAR ?auto_2723 ) ( not ( = ?auto_2722 ?auto_2726 ) ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( not ( = ?auto_2729 ?auto_2726 ) ) ( TRUCK-AT ?auto_2730 ?auto_2731 ) ( not ( = ?auto_2731 ?auto_2728 ) ) ( not ( = ?auto_2724 ?auto_2731 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2730 ?auto_2731 ?auto_2728 )
      ( MAKE-1CRATE ?auto_2722 ?auto_2723 )
      ( MAKE-1CRATE-VERIFY ?auto_2722 ?auto_2723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2762 - SURFACE
      ?auto_2763 - SURFACE
      ?auto_2764 - SURFACE
      ?auto_2761 - SURFACE
    )
    :vars
    (
      ?auto_2766 - HOIST
      ?auto_2765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2766 ?auto_2765 ) ( SURFACE-AT ?auto_2764 ?auto_2765 ) ( CLEAR ?auto_2764 ) ( LIFTING ?auto_2766 ?auto_2761 ) ( IS-CRATE ?auto_2761 ) ( not ( = ?auto_2764 ?auto_2761 ) ) ( ON ?auto_2763 ?auto_2762 ) ( ON ?auto_2764 ?auto_2763 ) ( not ( = ?auto_2762 ?auto_2763 ) ) ( not ( = ?auto_2762 ?auto_2764 ) ) ( not ( = ?auto_2762 ?auto_2761 ) ) ( not ( = ?auto_2763 ?auto_2764 ) ) ( not ( = ?auto_2763 ?auto_2761 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2764 ?auto_2761 )
      ( MAKE-3CRATE-VERIFY ?auto_2762 ?auto_2763 ?auto_2764 ?auto_2761 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2779 - SURFACE
      ?auto_2780 - SURFACE
      ?auto_2781 - SURFACE
      ?auto_2778 - SURFACE
    )
    :vars
    (
      ?auto_2783 - HOIST
      ?auto_2784 - PLACE
      ?auto_2782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2783 ?auto_2784 ) ( SURFACE-AT ?auto_2781 ?auto_2784 ) ( CLEAR ?auto_2781 ) ( IS-CRATE ?auto_2778 ) ( not ( = ?auto_2781 ?auto_2778 ) ) ( TRUCK-AT ?auto_2782 ?auto_2784 ) ( AVAILABLE ?auto_2783 ) ( IN ?auto_2778 ?auto_2782 ) ( ON ?auto_2781 ?auto_2780 ) ( not ( = ?auto_2780 ?auto_2781 ) ) ( not ( = ?auto_2780 ?auto_2778 ) ) ( ON ?auto_2780 ?auto_2779 ) ( not ( = ?auto_2779 ?auto_2780 ) ) ( not ( = ?auto_2779 ?auto_2781 ) ) ( not ( = ?auto_2779 ?auto_2778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2780 ?auto_2781 ?auto_2778 )
      ( MAKE-3CRATE-VERIFY ?auto_2779 ?auto_2780 ?auto_2781 ?auto_2778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2800 - SURFACE
      ?auto_2801 - SURFACE
      ?auto_2802 - SURFACE
      ?auto_2799 - SURFACE
    )
    :vars
    (
      ?auto_2805 - HOIST
      ?auto_2806 - PLACE
      ?auto_2803 - TRUCK
      ?auto_2804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2805 ?auto_2806 ) ( SURFACE-AT ?auto_2802 ?auto_2806 ) ( CLEAR ?auto_2802 ) ( IS-CRATE ?auto_2799 ) ( not ( = ?auto_2802 ?auto_2799 ) ) ( AVAILABLE ?auto_2805 ) ( IN ?auto_2799 ?auto_2803 ) ( ON ?auto_2802 ?auto_2801 ) ( not ( = ?auto_2801 ?auto_2802 ) ) ( not ( = ?auto_2801 ?auto_2799 ) ) ( TRUCK-AT ?auto_2803 ?auto_2804 ) ( not ( = ?auto_2804 ?auto_2806 ) ) ( ON ?auto_2801 ?auto_2800 ) ( not ( = ?auto_2800 ?auto_2801 ) ) ( not ( = ?auto_2800 ?auto_2802 ) ) ( not ( = ?auto_2800 ?auto_2799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2801 ?auto_2802 ?auto_2799 )
      ( MAKE-3CRATE-VERIFY ?auto_2800 ?auto_2801 ?auto_2802 ?auto_2799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2824 - SURFACE
      ?auto_2825 - SURFACE
      ?auto_2826 - SURFACE
      ?auto_2823 - SURFACE
    )
    :vars
    (
      ?auto_2829 - HOIST
      ?auto_2827 - PLACE
      ?auto_2828 - TRUCK
      ?auto_2831 - PLACE
      ?auto_2830 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2829 ?auto_2827 ) ( SURFACE-AT ?auto_2826 ?auto_2827 ) ( CLEAR ?auto_2826 ) ( IS-CRATE ?auto_2823 ) ( not ( = ?auto_2826 ?auto_2823 ) ) ( AVAILABLE ?auto_2829 ) ( ON ?auto_2826 ?auto_2825 ) ( not ( = ?auto_2825 ?auto_2826 ) ) ( not ( = ?auto_2825 ?auto_2823 ) ) ( TRUCK-AT ?auto_2828 ?auto_2831 ) ( not ( = ?auto_2831 ?auto_2827 ) ) ( HOIST-AT ?auto_2830 ?auto_2831 ) ( LIFTING ?auto_2830 ?auto_2823 ) ( not ( = ?auto_2829 ?auto_2830 ) ) ( ON ?auto_2825 ?auto_2824 ) ( not ( = ?auto_2824 ?auto_2825 ) ) ( not ( = ?auto_2824 ?auto_2826 ) ) ( not ( = ?auto_2824 ?auto_2823 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2825 ?auto_2826 ?auto_2823 )
      ( MAKE-3CRATE-VERIFY ?auto_2824 ?auto_2825 ?auto_2826 ?auto_2823 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2851 - SURFACE
      ?auto_2852 - SURFACE
      ?auto_2853 - SURFACE
      ?auto_2850 - SURFACE
    )
    :vars
    (
      ?auto_2854 - HOIST
      ?auto_2859 - PLACE
      ?auto_2855 - TRUCK
      ?auto_2858 - PLACE
      ?auto_2856 - HOIST
      ?auto_2857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2854 ?auto_2859 ) ( SURFACE-AT ?auto_2853 ?auto_2859 ) ( CLEAR ?auto_2853 ) ( IS-CRATE ?auto_2850 ) ( not ( = ?auto_2853 ?auto_2850 ) ) ( AVAILABLE ?auto_2854 ) ( ON ?auto_2853 ?auto_2852 ) ( not ( = ?auto_2852 ?auto_2853 ) ) ( not ( = ?auto_2852 ?auto_2850 ) ) ( TRUCK-AT ?auto_2855 ?auto_2858 ) ( not ( = ?auto_2858 ?auto_2859 ) ) ( HOIST-AT ?auto_2856 ?auto_2858 ) ( not ( = ?auto_2854 ?auto_2856 ) ) ( AVAILABLE ?auto_2856 ) ( SURFACE-AT ?auto_2850 ?auto_2858 ) ( ON ?auto_2850 ?auto_2857 ) ( CLEAR ?auto_2850 ) ( not ( = ?auto_2853 ?auto_2857 ) ) ( not ( = ?auto_2850 ?auto_2857 ) ) ( not ( = ?auto_2852 ?auto_2857 ) ) ( ON ?auto_2852 ?auto_2851 ) ( not ( = ?auto_2851 ?auto_2852 ) ) ( not ( = ?auto_2851 ?auto_2853 ) ) ( not ( = ?auto_2851 ?auto_2850 ) ) ( not ( = ?auto_2851 ?auto_2857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2852 ?auto_2853 ?auto_2850 )
      ( MAKE-3CRATE-VERIFY ?auto_2851 ?auto_2852 ?auto_2853 ?auto_2850 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2879 - SURFACE
      ?auto_2880 - SURFACE
      ?auto_2881 - SURFACE
      ?auto_2878 - SURFACE
    )
    :vars
    (
      ?auto_2883 - HOIST
      ?auto_2885 - PLACE
      ?auto_2886 - PLACE
      ?auto_2887 - HOIST
      ?auto_2884 - SURFACE
      ?auto_2882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2883 ?auto_2885 ) ( SURFACE-AT ?auto_2881 ?auto_2885 ) ( CLEAR ?auto_2881 ) ( IS-CRATE ?auto_2878 ) ( not ( = ?auto_2881 ?auto_2878 ) ) ( AVAILABLE ?auto_2883 ) ( ON ?auto_2881 ?auto_2880 ) ( not ( = ?auto_2880 ?auto_2881 ) ) ( not ( = ?auto_2880 ?auto_2878 ) ) ( not ( = ?auto_2886 ?auto_2885 ) ) ( HOIST-AT ?auto_2887 ?auto_2886 ) ( not ( = ?auto_2883 ?auto_2887 ) ) ( AVAILABLE ?auto_2887 ) ( SURFACE-AT ?auto_2878 ?auto_2886 ) ( ON ?auto_2878 ?auto_2884 ) ( CLEAR ?auto_2878 ) ( not ( = ?auto_2881 ?auto_2884 ) ) ( not ( = ?auto_2878 ?auto_2884 ) ) ( not ( = ?auto_2880 ?auto_2884 ) ) ( TRUCK-AT ?auto_2882 ?auto_2885 ) ( ON ?auto_2880 ?auto_2879 ) ( not ( = ?auto_2879 ?auto_2880 ) ) ( not ( = ?auto_2879 ?auto_2881 ) ) ( not ( = ?auto_2879 ?auto_2878 ) ) ( not ( = ?auto_2879 ?auto_2884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2880 ?auto_2881 ?auto_2878 )
      ( MAKE-3CRATE-VERIFY ?auto_2879 ?auto_2880 ?auto_2881 ?auto_2878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2907 - SURFACE
      ?auto_2908 - SURFACE
      ?auto_2909 - SURFACE
      ?auto_2906 - SURFACE
    )
    :vars
    (
      ?auto_2914 - HOIST
      ?auto_2915 - PLACE
      ?auto_2910 - PLACE
      ?auto_2912 - HOIST
      ?auto_2913 - SURFACE
      ?auto_2911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2914 ?auto_2915 ) ( IS-CRATE ?auto_2906 ) ( not ( = ?auto_2909 ?auto_2906 ) ) ( not ( = ?auto_2908 ?auto_2909 ) ) ( not ( = ?auto_2908 ?auto_2906 ) ) ( not ( = ?auto_2910 ?auto_2915 ) ) ( HOIST-AT ?auto_2912 ?auto_2910 ) ( not ( = ?auto_2914 ?auto_2912 ) ) ( AVAILABLE ?auto_2912 ) ( SURFACE-AT ?auto_2906 ?auto_2910 ) ( ON ?auto_2906 ?auto_2913 ) ( CLEAR ?auto_2906 ) ( not ( = ?auto_2909 ?auto_2913 ) ) ( not ( = ?auto_2906 ?auto_2913 ) ) ( not ( = ?auto_2908 ?auto_2913 ) ) ( TRUCK-AT ?auto_2911 ?auto_2915 ) ( SURFACE-AT ?auto_2908 ?auto_2915 ) ( CLEAR ?auto_2908 ) ( LIFTING ?auto_2914 ?auto_2909 ) ( IS-CRATE ?auto_2909 ) ( ON ?auto_2908 ?auto_2907 ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( not ( = ?auto_2907 ?auto_2909 ) ) ( not ( = ?auto_2907 ?auto_2906 ) ) ( not ( = ?auto_2907 ?auto_2913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2908 ?auto_2909 ?auto_2906 )
      ( MAKE-3CRATE-VERIFY ?auto_2907 ?auto_2908 ?auto_2909 ?auto_2906 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2935 - SURFACE
      ?auto_2936 - SURFACE
      ?auto_2937 - SURFACE
      ?auto_2934 - SURFACE
    )
    :vars
    (
      ?auto_2941 - HOIST
      ?auto_2943 - PLACE
      ?auto_2942 - PLACE
      ?auto_2939 - HOIST
      ?auto_2938 - SURFACE
      ?auto_2940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2941 ?auto_2943 ) ( IS-CRATE ?auto_2934 ) ( not ( = ?auto_2937 ?auto_2934 ) ) ( not ( = ?auto_2936 ?auto_2937 ) ) ( not ( = ?auto_2936 ?auto_2934 ) ) ( not ( = ?auto_2942 ?auto_2943 ) ) ( HOIST-AT ?auto_2939 ?auto_2942 ) ( not ( = ?auto_2941 ?auto_2939 ) ) ( AVAILABLE ?auto_2939 ) ( SURFACE-AT ?auto_2934 ?auto_2942 ) ( ON ?auto_2934 ?auto_2938 ) ( CLEAR ?auto_2934 ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2934 ?auto_2938 ) ) ( not ( = ?auto_2936 ?auto_2938 ) ) ( TRUCK-AT ?auto_2940 ?auto_2943 ) ( SURFACE-AT ?auto_2936 ?auto_2943 ) ( CLEAR ?auto_2936 ) ( IS-CRATE ?auto_2937 ) ( AVAILABLE ?auto_2941 ) ( IN ?auto_2937 ?auto_2940 ) ( ON ?auto_2936 ?auto_2935 ) ( not ( = ?auto_2935 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2937 ) ) ( not ( = ?auto_2935 ?auto_2934 ) ) ( not ( = ?auto_2935 ?auto_2938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2936 ?auto_2937 ?auto_2934 )
      ( MAKE-3CRATE-VERIFY ?auto_2935 ?auto_2936 ?auto_2937 ?auto_2934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3119 - SURFACE
      ?auto_3120 - SURFACE
    )
    :vars
    (
      ?auto_3125 - HOIST
      ?auto_3126 - PLACE
      ?auto_3127 - SURFACE
      ?auto_3122 - TRUCK
      ?auto_3123 - PLACE
      ?auto_3121 - HOIST
      ?auto_3124 - SURFACE
      ?auto_3128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3125 ?auto_3126 ) ( SURFACE-AT ?auto_3119 ?auto_3126 ) ( CLEAR ?auto_3119 ) ( IS-CRATE ?auto_3120 ) ( not ( = ?auto_3119 ?auto_3120 ) ) ( AVAILABLE ?auto_3125 ) ( ON ?auto_3119 ?auto_3127 ) ( not ( = ?auto_3127 ?auto_3119 ) ) ( not ( = ?auto_3127 ?auto_3120 ) ) ( TRUCK-AT ?auto_3122 ?auto_3123 ) ( not ( = ?auto_3123 ?auto_3126 ) ) ( HOIST-AT ?auto_3121 ?auto_3123 ) ( not ( = ?auto_3125 ?auto_3121 ) ) ( SURFACE-AT ?auto_3120 ?auto_3123 ) ( ON ?auto_3120 ?auto_3124 ) ( CLEAR ?auto_3120 ) ( not ( = ?auto_3119 ?auto_3124 ) ) ( not ( = ?auto_3120 ?auto_3124 ) ) ( not ( = ?auto_3127 ?auto_3124 ) ) ( LIFTING ?auto_3121 ?auto_3128 ) ( IS-CRATE ?auto_3128 ) ( not ( = ?auto_3119 ?auto_3128 ) ) ( not ( = ?auto_3120 ?auto_3128 ) ) ( not ( = ?auto_3127 ?auto_3128 ) ) ( not ( = ?auto_3124 ?auto_3128 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3121 ?auto_3128 ?auto_3122 ?auto_3123 )
      ( MAKE-1CRATE ?auto_3119 ?auto_3120 )
      ( MAKE-1CRATE-VERIFY ?auto_3119 ?auto_3120 ) )
  )

)

