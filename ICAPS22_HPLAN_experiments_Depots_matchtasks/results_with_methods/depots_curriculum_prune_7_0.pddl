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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2530 - SURFACE
      ?auto_2531 - SURFACE
      ?auto_2532 - SURFACE
    )
    :vars
    (
      ?auto_2536 - HOIST
      ?auto_2534 - PLACE
      ?auto_2533 - PLACE
      ?auto_2537 - HOIST
      ?auto_2535 - SURFACE
      ?auto_2541 - PLACE
      ?auto_2540 - HOIST
      ?auto_2539 - SURFACE
      ?auto_2538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2536 ?auto_2534 ) ( IS-CRATE ?auto_2532 ) ( not ( = ?auto_2533 ?auto_2534 ) ) ( HOIST-AT ?auto_2537 ?auto_2533 ) ( AVAILABLE ?auto_2537 ) ( SURFACE-AT ?auto_2532 ?auto_2533 ) ( ON ?auto_2532 ?auto_2535 ) ( CLEAR ?auto_2532 ) ( not ( = ?auto_2531 ?auto_2532 ) ) ( not ( = ?auto_2531 ?auto_2535 ) ) ( not ( = ?auto_2532 ?auto_2535 ) ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( SURFACE-AT ?auto_2530 ?auto_2534 ) ( CLEAR ?auto_2530 ) ( IS-CRATE ?auto_2531 ) ( AVAILABLE ?auto_2536 ) ( not ( = ?auto_2541 ?auto_2534 ) ) ( HOIST-AT ?auto_2540 ?auto_2541 ) ( AVAILABLE ?auto_2540 ) ( SURFACE-AT ?auto_2531 ?auto_2541 ) ( ON ?auto_2531 ?auto_2539 ) ( CLEAR ?auto_2531 ) ( TRUCK-AT ?auto_2538 ?auto_2534 ) ( not ( = ?auto_2530 ?auto_2531 ) ) ( not ( = ?auto_2530 ?auto_2539 ) ) ( not ( = ?auto_2531 ?auto_2539 ) ) ( not ( = ?auto_2536 ?auto_2540 ) ) ( not ( = ?auto_2530 ?auto_2532 ) ) ( not ( = ?auto_2530 ?auto_2535 ) ) ( not ( = ?auto_2532 ?auto_2539 ) ) ( not ( = ?auto_2533 ?auto_2541 ) ) ( not ( = ?auto_2537 ?auto_2540 ) ) ( not ( = ?auto_2535 ?auto_2539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2530 ?auto_2531 )
      ( MAKE-1CRATE ?auto_2531 ?auto_2532 )
      ( MAKE-2CRATE-VERIFY ?auto_2530 ?auto_2531 ?auto_2532 ) )
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
      ?auto_2565 - HOIST
      ?auto_2563 - PLACE
      ?auto_2564 - PLACE
      ?auto_2561 - HOIST
      ?auto_2560 - SURFACE
      ?auto_2570 - PLACE
      ?auto_2571 - HOIST
      ?auto_2566 - SURFACE
      ?auto_2569 - PLACE
      ?auto_2568 - HOIST
      ?auto_2567 - SURFACE
      ?auto_2562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2565 ?auto_2563 ) ( IS-CRATE ?auto_2559 ) ( not ( = ?auto_2564 ?auto_2563 ) ) ( HOIST-AT ?auto_2561 ?auto_2564 ) ( AVAILABLE ?auto_2561 ) ( SURFACE-AT ?auto_2559 ?auto_2564 ) ( ON ?auto_2559 ?auto_2560 ) ( CLEAR ?auto_2559 ) ( not ( = ?auto_2558 ?auto_2559 ) ) ( not ( = ?auto_2558 ?auto_2560 ) ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( not ( = ?auto_2565 ?auto_2561 ) ) ( IS-CRATE ?auto_2558 ) ( not ( = ?auto_2570 ?auto_2563 ) ) ( HOIST-AT ?auto_2571 ?auto_2570 ) ( AVAILABLE ?auto_2571 ) ( SURFACE-AT ?auto_2558 ?auto_2570 ) ( ON ?auto_2558 ?auto_2566 ) ( CLEAR ?auto_2558 ) ( not ( = ?auto_2557 ?auto_2558 ) ) ( not ( = ?auto_2557 ?auto_2566 ) ) ( not ( = ?auto_2558 ?auto_2566 ) ) ( not ( = ?auto_2565 ?auto_2571 ) ) ( SURFACE-AT ?auto_2556 ?auto_2563 ) ( CLEAR ?auto_2556 ) ( IS-CRATE ?auto_2557 ) ( AVAILABLE ?auto_2565 ) ( not ( = ?auto_2569 ?auto_2563 ) ) ( HOIST-AT ?auto_2568 ?auto_2569 ) ( AVAILABLE ?auto_2568 ) ( SURFACE-AT ?auto_2557 ?auto_2569 ) ( ON ?auto_2557 ?auto_2567 ) ( CLEAR ?auto_2557 ) ( TRUCK-AT ?auto_2562 ?auto_2563 ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2567 ) ) ( not ( = ?auto_2557 ?auto_2567 ) ) ( not ( = ?auto_2565 ?auto_2568 ) ) ( not ( = ?auto_2556 ?auto_2558 ) ) ( not ( = ?auto_2556 ?auto_2566 ) ) ( not ( = ?auto_2558 ?auto_2567 ) ) ( not ( = ?auto_2570 ?auto_2569 ) ) ( not ( = ?auto_2571 ?auto_2568 ) ) ( not ( = ?auto_2566 ?auto_2567 ) ) ( not ( = ?auto_2556 ?auto_2559 ) ) ( not ( = ?auto_2556 ?auto_2560 ) ) ( not ( = ?auto_2557 ?auto_2559 ) ) ( not ( = ?auto_2557 ?auto_2560 ) ) ( not ( = ?auto_2559 ?auto_2566 ) ) ( not ( = ?auto_2559 ?auto_2567 ) ) ( not ( = ?auto_2564 ?auto_2570 ) ) ( not ( = ?auto_2564 ?auto_2569 ) ) ( not ( = ?auto_2561 ?auto_2571 ) ) ( not ( = ?auto_2561 ?auto_2568 ) ) ( not ( = ?auto_2560 ?auto_2566 ) ) ( not ( = ?auto_2560 ?auto_2567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2556 ?auto_2557 ?auto_2558 )
      ( MAKE-1CRATE ?auto_2558 ?auto_2559 )
      ( MAKE-3CRATE-VERIFY ?auto_2556 ?auto_2557 ?auto_2558 ?auto_2559 ) )
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
      ?auto_2594 - HOIST
      ?auto_2595 - PLACE
      ?auto_2592 - PLACE
      ?auto_2593 - HOIST
      ?auto_2597 - SURFACE
      ?auto_2598 - PLACE
      ?auto_2599 - HOIST
      ?auto_2600 - SURFACE
      ?auto_2605 - PLACE
      ?auto_2603 - HOIST
      ?auto_2601 - SURFACE
      ?auto_2606 - PLACE
      ?auto_2604 - HOIST
      ?auto_2602 - SURFACE
      ?auto_2596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2594 ?auto_2595 ) ( IS-CRATE ?auto_2591 ) ( not ( = ?auto_2592 ?auto_2595 ) ) ( HOIST-AT ?auto_2593 ?auto_2592 ) ( AVAILABLE ?auto_2593 ) ( SURFACE-AT ?auto_2591 ?auto_2592 ) ( ON ?auto_2591 ?auto_2597 ) ( CLEAR ?auto_2591 ) ( not ( = ?auto_2590 ?auto_2591 ) ) ( not ( = ?auto_2590 ?auto_2597 ) ) ( not ( = ?auto_2591 ?auto_2597 ) ) ( not ( = ?auto_2594 ?auto_2593 ) ) ( IS-CRATE ?auto_2590 ) ( not ( = ?auto_2598 ?auto_2595 ) ) ( HOIST-AT ?auto_2599 ?auto_2598 ) ( AVAILABLE ?auto_2599 ) ( SURFACE-AT ?auto_2590 ?auto_2598 ) ( ON ?auto_2590 ?auto_2600 ) ( CLEAR ?auto_2590 ) ( not ( = ?auto_2589 ?auto_2590 ) ) ( not ( = ?auto_2589 ?auto_2600 ) ) ( not ( = ?auto_2590 ?auto_2600 ) ) ( not ( = ?auto_2594 ?auto_2599 ) ) ( IS-CRATE ?auto_2589 ) ( not ( = ?auto_2605 ?auto_2595 ) ) ( HOIST-AT ?auto_2603 ?auto_2605 ) ( AVAILABLE ?auto_2603 ) ( SURFACE-AT ?auto_2589 ?auto_2605 ) ( ON ?auto_2589 ?auto_2601 ) ( CLEAR ?auto_2589 ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( not ( = ?auto_2588 ?auto_2601 ) ) ( not ( = ?auto_2589 ?auto_2601 ) ) ( not ( = ?auto_2594 ?auto_2603 ) ) ( SURFACE-AT ?auto_2587 ?auto_2595 ) ( CLEAR ?auto_2587 ) ( IS-CRATE ?auto_2588 ) ( AVAILABLE ?auto_2594 ) ( not ( = ?auto_2606 ?auto_2595 ) ) ( HOIST-AT ?auto_2604 ?auto_2606 ) ( AVAILABLE ?auto_2604 ) ( SURFACE-AT ?auto_2588 ?auto_2606 ) ( ON ?auto_2588 ?auto_2602 ) ( CLEAR ?auto_2588 ) ( TRUCK-AT ?auto_2596 ?auto_2595 ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( not ( = ?auto_2587 ?auto_2602 ) ) ( not ( = ?auto_2588 ?auto_2602 ) ) ( not ( = ?auto_2594 ?auto_2604 ) ) ( not ( = ?auto_2587 ?auto_2589 ) ) ( not ( = ?auto_2587 ?auto_2601 ) ) ( not ( = ?auto_2589 ?auto_2602 ) ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( not ( = ?auto_2603 ?auto_2604 ) ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( not ( = ?auto_2587 ?auto_2590 ) ) ( not ( = ?auto_2587 ?auto_2600 ) ) ( not ( = ?auto_2588 ?auto_2590 ) ) ( not ( = ?auto_2588 ?auto_2600 ) ) ( not ( = ?auto_2590 ?auto_2601 ) ) ( not ( = ?auto_2590 ?auto_2602 ) ) ( not ( = ?auto_2598 ?auto_2605 ) ) ( not ( = ?auto_2598 ?auto_2606 ) ) ( not ( = ?auto_2599 ?auto_2603 ) ) ( not ( = ?auto_2599 ?auto_2604 ) ) ( not ( = ?auto_2600 ?auto_2601 ) ) ( not ( = ?auto_2600 ?auto_2602 ) ) ( not ( = ?auto_2587 ?auto_2591 ) ) ( not ( = ?auto_2587 ?auto_2597 ) ) ( not ( = ?auto_2588 ?auto_2591 ) ) ( not ( = ?auto_2588 ?auto_2597 ) ) ( not ( = ?auto_2589 ?auto_2591 ) ) ( not ( = ?auto_2589 ?auto_2597 ) ) ( not ( = ?auto_2591 ?auto_2600 ) ) ( not ( = ?auto_2591 ?auto_2601 ) ) ( not ( = ?auto_2591 ?auto_2602 ) ) ( not ( = ?auto_2592 ?auto_2598 ) ) ( not ( = ?auto_2592 ?auto_2605 ) ) ( not ( = ?auto_2592 ?auto_2606 ) ) ( not ( = ?auto_2593 ?auto_2599 ) ) ( not ( = ?auto_2593 ?auto_2603 ) ) ( not ( = ?auto_2593 ?auto_2604 ) ) ( not ( = ?auto_2597 ?auto_2600 ) ) ( not ( = ?auto_2597 ?auto_2601 ) ) ( not ( = ?auto_2597 ?auto_2602 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2587 ?auto_2588 ?auto_2589 ?auto_2590 )
      ( MAKE-1CRATE ?auto_2590 ?auto_2591 )
      ( MAKE-4CRATE-VERIFY ?auto_2587 ?auto_2588 ?auto_2589 ?auto_2590 ?auto_2591 ) )
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
      ?auto_2634 - HOIST
      ?auto_2633 - PLACE
      ?auto_2629 - PLACE
      ?auto_2632 - HOIST
      ?auto_2630 - SURFACE
      ?auto_2635 - SURFACE
      ?auto_2639 - PLACE
      ?auto_2642 - HOIST
      ?auto_2640 - SURFACE
      ?auto_2644 - PLACE
      ?auto_2637 - HOIST
      ?auto_2643 - SURFACE
      ?auto_2641 - PLACE
      ?auto_2638 - HOIST
      ?auto_2636 - SURFACE
      ?auto_2631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2634 ?auto_2633 ) ( IS-CRATE ?auto_2628 ) ( not ( = ?auto_2629 ?auto_2633 ) ) ( HOIST-AT ?auto_2632 ?auto_2629 ) ( SURFACE-AT ?auto_2628 ?auto_2629 ) ( ON ?auto_2628 ?auto_2630 ) ( CLEAR ?auto_2628 ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( not ( = ?auto_2627 ?auto_2630 ) ) ( not ( = ?auto_2628 ?auto_2630 ) ) ( not ( = ?auto_2634 ?auto_2632 ) ) ( IS-CRATE ?auto_2627 ) ( AVAILABLE ?auto_2632 ) ( SURFACE-AT ?auto_2627 ?auto_2629 ) ( ON ?auto_2627 ?auto_2635 ) ( CLEAR ?auto_2627 ) ( not ( = ?auto_2626 ?auto_2627 ) ) ( not ( = ?auto_2626 ?auto_2635 ) ) ( not ( = ?auto_2627 ?auto_2635 ) ) ( IS-CRATE ?auto_2626 ) ( not ( = ?auto_2639 ?auto_2633 ) ) ( HOIST-AT ?auto_2642 ?auto_2639 ) ( AVAILABLE ?auto_2642 ) ( SURFACE-AT ?auto_2626 ?auto_2639 ) ( ON ?auto_2626 ?auto_2640 ) ( CLEAR ?auto_2626 ) ( not ( = ?auto_2625 ?auto_2626 ) ) ( not ( = ?auto_2625 ?auto_2640 ) ) ( not ( = ?auto_2626 ?auto_2640 ) ) ( not ( = ?auto_2634 ?auto_2642 ) ) ( IS-CRATE ?auto_2625 ) ( not ( = ?auto_2644 ?auto_2633 ) ) ( HOIST-AT ?auto_2637 ?auto_2644 ) ( AVAILABLE ?auto_2637 ) ( SURFACE-AT ?auto_2625 ?auto_2644 ) ( ON ?auto_2625 ?auto_2643 ) ( CLEAR ?auto_2625 ) ( not ( = ?auto_2624 ?auto_2625 ) ) ( not ( = ?auto_2624 ?auto_2643 ) ) ( not ( = ?auto_2625 ?auto_2643 ) ) ( not ( = ?auto_2634 ?auto_2637 ) ) ( SURFACE-AT ?auto_2623 ?auto_2633 ) ( CLEAR ?auto_2623 ) ( IS-CRATE ?auto_2624 ) ( AVAILABLE ?auto_2634 ) ( not ( = ?auto_2641 ?auto_2633 ) ) ( HOIST-AT ?auto_2638 ?auto_2641 ) ( AVAILABLE ?auto_2638 ) ( SURFACE-AT ?auto_2624 ?auto_2641 ) ( ON ?auto_2624 ?auto_2636 ) ( CLEAR ?auto_2624 ) ( TRUCK-AT ?auto_2631 ?auto_2633 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( not ( = ?auto_2623 ?auto_2636 ) ) ( not ( = ?auto_2624 ?auto_2636 ) ) ( not ( = ?auto_2634 ?auto_2638 ) ) ( not ( = ?auto_2623 ?auto_2625 ) ) ( not ( = ?auto_2623 ?auto_2643 ) ) ( not ( = ?auto_2625 ?auto_2636 ) ) ( not ( = ?auto_2644 ?auto_2641 ) ) ( not ( = ?auto_2637 ?auto_2638 ) ) ( not ( = ?auto_2643 ?auto_2636 ) ) ( not ( = ?auto_2623 ?auto_2626 ) ) ( not ( = ?auto_2623 ?auto_2640 ) ) ( not ( = ?auto_2624 ?auto_2626 ) ) ( not ( = ?auto_2624 ?auto_2640 ) ) ( not ( = ?auto_2626 ?auto_2643 ) ) ( not ( = ?auto_2626 ?auto_2636 ) ) ( not ( = ?auto_2639 ?auto_2644 ) ) ( not ( = ?auto_2639 ?auto_2641 ) ) ( not ( = ?auto_2642 ?auto_2637 ) ) ( not ( = ?auto_2642 ?auto_2638 ) ) ( not ( = ?auto_2640 ?auto_2643 ) ) ( not ( = ?auto_2640 ?auto_2636 ) ) ( not ( = ?auto_2623 ?auto_2627 ) ) ( not ( = ?auto_2623 ?auto_2635 ) ) ( not ( = ?auto_2624 ?auto_2627 ) ) ( not ( = ?auto_2624 ?auto_2635 ) ) ( not ( = ?auto_2625 ?auto_2627 ) ) ( not ( = ?auto_2625 ?auto_2635 ) ) ( not ( = ?auto_2627 ?auto_2640 ) ) ( not ( = ?auto_2627 ?auto_2643 ) ) ( not ( = ?auto_2627 ?auto_2636 ) ) ( not ( = ?auto_2629 ?auto_2639 ) ) ( not ( = ?auto_2629 ?auto_2644 ) ) ( not ( = ?auto_2629 ?auto_2641 ) ) ( not ( = ?auto_2632 ?auto_2642 ) ) ( not ( = ?auto_2632 ?auto_2637 ) ) ( not ( = ?auto_2632 ?auto_2638 ) ) ( not ( = ?auto_2635 ?auto_2640 ) ) ( not ( = ?auto_2635 ?auto_2643 ) ) ( not ( = ?auto_2635 ?auto_2636 ) ) ( not ( = ?auto_2623 ?auto_2628 ) ) ( not ( = ?auto_2623 ?auto_2630 ) ) ( not ( = ?auto_2624 ?auto_2628 ) ) ( not ( = ?auto_2624 ?auto_2630 ) ) ( not ( = ?auto_2625 ?auto_2628 ) ) ( not ( = ?auto_2625 ?auto_2630 ) ) ( not ( = ?auto_2626 ?auto_2628 ) ) ( not ( = ?auto_2626 ?auto_2630 ) ) ( not ( = ?auto_2628 ?auto_2635 ) ) ( not ( = ?auto_2628 ?auto_2640 ) ) ( not ( = ?auto_2628 ?auto_2643 ) ) ( not ( = ?auto_2628 ?auto_2636 ) ) ( not ( = ?auto_2630 ?auto_2635 ) ) ( not ( = ?auto_2630 ?auto_2640 ) ) ( not ( = ?auto_2630 ?auto_2643 ) ) ( not ( = ?auto_2630 ?auto_2636 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2623 ?auto_2624 ?auto_2625 ?auto_2626 ?auto_2627 )
      ( MAKE-1CRATE ?auto_2627 ?auto_2628 )
      ( MAKE-5CRATE-VERIFY ?auto_2623 ?auto_2624 ?auto_2625 ?auto_2626 ?auto_2627 ?auto_2628 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2662 - SURFACE
      ?auto_2663 - SURFACE
      ?auto_2664 - SURFACE
      ?auto_2665 - SURFACE
      ?auto_2666 - SURFACE
      ?auto_2667 - SURFACE
      ?auto_2668 - SURFACE
    )
    :vars
    (
      ?auto_2670 - HOIST
      ?auto_2673 - PLACE
      ?auto_2674 - PLACE
      ?auto_2672 - HOIST
      ?auto_2671 - SURFACE
      ?auto_2675 - SURFACE
      ?auto_2681 - SURFACE
      ?auto_2677 - PLACE
      ?auto_2676 - HOIST
      ?auto_2683 - SURFACE
      ?auto_2684 - PLACE
      ?auto_2685 - HOIST
      ?auto_2679 - SURFACE
      ?auto_2678 - PLACE
      ?auto_2682 - HOIST
      ?auto_2680 - SURFACE
      ?auto_2669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670 ?auto_2673 ) ( IS-CRATE ?auto_2668 ) ( not ( = ?auto_2674 ?auto_2673 ) ) ( HOIST-AT ?auto_2672 ?auto_2674 ) ( SURFACE-AT ?auto_2668 ?auto_2674 ) ( ON ?auto_2668 ?auto_2671 ) ( CLEAR ?auto_2668 ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2667 ?auto_2671 ) ) ( not ( = ?auto_2668 ?auto_2671 ) ) ( not ( = ?auto_2670 ?auto_2672 ) ) ( IS-CRATE ?auto_2667 ) ( SURFACE-AT ?auto_2667 ?auto_2674 ) ( ON ?auto_2667 ?auto_2675 ) ( CLEAR ?auto_2667 ) ( not ( = ?auto_2666 ?auto_2667 ) ) ( not ( = ?auto_2666 ?auto_2675 ) ) ( not ( = ?auto_2667 ?auto_2675 ) ) ( IS-CRATE ?auto_2666 ) ( AVAILABLE ?auto_2672 ) ( SURFACE-AT ?auto_2666 ?auto_2674 ) ( ON ?auto_2666 ?auto_2681 ) ( CLEAR ?auto_2666 ) ( not ( = ?auto_2665 ?auto_2666 ) ) ( not ( = ?auto_2665 ?auto_2681 ) ) ( not ( = ?auto_2666 ?auto_2681 ) ) ( IS-CRATE ?auto_2665 ) ( not ( = ?auto_2677 ?auto_2673 ) ) ( HOIST-AT ?auto_2676 ?auto_2677 ) ( AVAILABLE ?auto_2676 ) ( SURFACE-AT ?auto_2665 ?auto_2677 ) ( ON ?auto_2665 ?auto_2683 ) ( CLEAR ?auto_2665 ) ( not ( = ?auto_2664 ?auto_2665 ) ) ( not ( = ?auto_2664 ?auto_2683 ) ) ( not ( = ?auto_2665 ?auto_2683 ) ) ( not ( = ?auto_2670 ?auto_2676 ) ) ( IS-CRATE ?auto_2664 ) ( not ( = ?auto_2684 ?auto_2673 ) ) ( HOIST-AT ?auto_2685 ?auto_2684 ) ( AVAILABLE ?auto_2685 ) ( SURFACE-AT ?auto_2664 ?auto_2684 ) ( ON ?auto_2664 ?auto_2679 ) ( CLEAR ?auto_2664 ) ( not ( = ?auto_2663 ?auto_2664 ) ) ( not ( = ?auto_2663 ?auto_2679 ) ) ( not ( = ?auto_2664 ?auto_2679 ) ) ( not ( = ?auto_2670 ?auto_2685 ) ) ( SURFACE-AT ?auto_2662 ?auto_2673 ) ( CLEAR ?auto_2662 ) ( IS-CRATE ?auto_2663 ) ( AVAILABLE ?auto_2670 ) ( not ( = ?auto_2678 ?auto_2673 ) ) ( HOIST-AT ?auto_2682 ?auto_2678 ) ( AVAILABLE ?auto_2682 ) ( SURFACE-AT ?auto_2663 ?auto_2678 ) ( ON ?auto_2663 ?auto_2680 ) ( CLEAR ?auto_2663 ) ( TRUCK-AT ?auto_2669 ?auto_2673 ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2680 ) ) ( not ( = ?auto_2663 ?auto_2680 ) ) ( not ( = ?auto_2670 ?auto_2682 ) ) ( not ( = ?auto_2662 ?auto_2664 ) ) ( not ( = ?auto_2662 ?auto_2679 ) ) ( not ( = ?auto_2664 ?auto_2680 ) ) ( not ( = ?auto_2684 ?auto_2678 ) ) ( not ( = ?auto_2685 ?auto_2682 ) ) ( not ( = ?auto_2679 ?auto_2680 ) ) ( not ( = ?auto_2662 ?auto_2665 ) ) ( not ( = ?auto_2662 ?auto_2683 ) ) ( not ( = ?auto_2663 ?auto_2665 ) ) ( not ( = ?auto_2663 ?auto_2683 ) ) ( not ( = ?auto_2665 ?auto_2679 ) ) ( not ( = ?auto_2665 ?auto_2680 ) ) ( not ( = ?auto_2677 ?auto_2684 ) ) ( not ( = ?auto_2677 ?auto_2678 ) ) ( not ( = ?auto_2676 ?auto_2685 ) ) ( not ( = ?auto_2676 ?auto_2682 ) ) ( not ( = ?auto_2683 ?auto_2679 ) ) ( not ( = ?auto_2683 ?auto_2680 ) ) ( not ( = ?auto_2662 ?auto_2666 ) ) ( not ( = ?auto_2662 ?auto_2681 ) ) ( not ( = ?auto_2663 ?auto_2666 ) ) ( not ( = ?auto_2663 ?auto_2681 ) ) ( not ( = ?auto_2664 ?auto_2666 ) ) ( not ( = ?auto_2664 ?auto_2681 ) ) ( not ( = ?auto_2666 ?auto_2683 ) ) ( not ( = ?auto_2666 ?auto_2679 ) ) ( not ( = ?auto_2666 ?auto_2680 ) ) ( not ( = ?auto_2674 ?auto_2677 ) ) ( not ( = ?auto_2674 ?auto_2684 ) ) ( not ( = ?auto_2674 ?auto_2678 ) ) ( not ( = ?auto_2672 ?auto_2676 ) ) ( not ( = ?auto_2672 ?auto_2685 ) ) ( not ( = ?auto_2672 ?auto_2682 ) ) ( not ( = ?auto_2681 ?auto_2683 ) ) ( not ( = ?auto_2681 ?auto_2679 ) ) ( not ( = ?auto_2681 ?auto_2680 ) ) ( not ( = ?auto_2662 ?auto_2667 ) ) ( not ( = ?auto_2662 ?auto_2675 ) ) ( not ( = ?auto_2663 ?auto_2667 ) ) ( not ( = ?auto_2663 ?auto_2675 ) ) ( not ( = ?auto_2664 ?auto_2667 ) ) ( not ( = ?auto_2664 ?auto_2675 ) ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( not ( = ?auto_2665 ?auto_2675 ) ) ( not ( = ?auto_2667 ?auto_2681 ) ) ( not ( = ?auto_2667 ?auto_2683 ) ) ( not ( = ?auto_2667 ?auto_2679 ) ) ( not ( = ?auto_2667 ?auto_2680 ) ) ( not ( = ?auto_2675 ?auto_2681 ) ) ( not ( = ?auto_2675 ?auto_2683 ) ) ( not ( = ?auto_2675 ?auto_2679 ) ) ( not ( = ?auto_2675 ?auto_2680 ) ) ( not ( = ?auto_2662 ?auto_2668 ) ) ( not ( = ?auto_2662 ?auto_2671 ) ) ( not ( = ?auto_2663 ?auto_2668 ) ) ( not ( = ?auto_2663 ?auto_2671 ) ) ( not ( = ?auto_2664 ?auto_2668 ) ) ( not ( = ?auto_2664 ?auto_2671 ) ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2665 ?auto_2671 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2671 ) ) ( not ( = ?auto_2668 ?auto_2675 ) ) ( not ( = ?auto_2668 ?auto_2681 ) ) ( not ( = ?auto_2668 ?auto_2683 ) ) ( not ( = ?auto_2668 ?auto_2679 ) ) ( not ( = ?auto_2668 ?auto_2680 ) ) ( not ( = ?auto_2671 ?auto_2675 ) ) ( not ( = ?auto_2671 ?auto_2681 ) ) ( not ( = ?auto_2671 ?auto_2683 ) ) ( not ( = ?auto_2671 ?auto_2679 ) ) ( not ( = ?auto_2671 ?auto_2680 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2662 ?auto_2663 ?auto_2664 ?auto_2665 ?auto_2666 ?auto_2667 )
      ( MAKE-1CRATE ?auto_2667 ?auto_2668 )
      ( MAKE-6CRATE-VERIFY ?auto_2662 ?auto_2663 ?auto_2664 ?auto_2665 ?auto_2666 ?auto_2667 ?auto_2668 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2704 - SURFACE
      ?auto_2705 - SURFACE
      ?auto_2706 - SURFACE
      ?auto_2707 - SURFACE
      ?auto_2708 - SURFACE
      ?auto_2709 - SURFACE
      ?auto_2710 - SURFACE
      ?auto_2711 - SURFACE
    )
    :vars
    (
      ?auto_2717 - HOIST
      ?auto_2716 - PLACE
      ?auto_2712 - PLACE
      ?auto_2713 - HOIST
      ?auto_2714 - SURFACE
      ?auto_2723 - PLACE
      ?auto_2718 - HOIST
      ?auto_2720 - SURFACE
      ?auto_2724 - SURFACE
      ?auto_2719 - SURFACE
      ?auto_2728 - SURFACE
      ?auto_2726 - PLACE
      ?auto_2729 - HOIST
      ?auto_2727 - SURFACE
      ?auto_2725 - PLACE
      ?auto_2722 - HOIST
      ?auto_2721 - SURFACE
      ?auto_2715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2717 ?auto_2716 ) ( IS-CRATE ?auto_2711 ) ( not ( = ?auto_2712 ?auto_2716 ) ) ( HOIST-AT ?auto_2713 ?auto_2712 ) ( SURFACE-AT ?auto_2711 ?auto_2712 ) ( ON ?auto_2711 ?auto_2714 ) ( CLEAR ?auto_2711 ) ( not ( = ?auto_2710 ?auto_2711 ) ) ( not ( = ?auto_2710 ?auto_2714 ) ) ( not ( = ?auto_2711 ?auto_2714 ) ) ( not ( = ?auto_2717 ?auto_2713 ) ) ( IS-CRATE ?auto_2710 ) ( not ( = ?auto_2723 ?auto_2716 ) ) ( HOIST-AT ?auto_2718 ?auto_2723 ) ( SURFACE-AT ?auto_2710 ?auto_2723 ) ( ON ?auto_2710 ?auto_2720 ) ( CLEAR ?auto_2710 ) ( not ( = ?auto_2709 ?auto_2710 ) ) ( not ( = ?auto_2709 ?auto_2720 ) ) ( not ( = ?auto_2710 ?auto_2720 ) ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( IS-CRATE ?auto_2709 ) ( SURFACE-AT ?auto_2709 ?auto_2723 ) ( ON ?auto_2709 ?auto_2724 ) ( CLEAR ?auto_2709 ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2708 ?auto_2724 ) ) ( not ( = ?auto_2709 ?auto_2724 ) ) ( IS-CRATE ?auto_2708 ) ( AVAILABLE ?auto_2718 ) ( SURFACE-AT ?auto_2708 ?auto_2723 ) ( ON ?auto_2708 ?auto_2719 ) ( CLEAR ?auto_2708 ) ( not ( = ?auto_2707 ?auto_2708 ) ) ( not ( = ?auto_2707 ?auto_2719 ) ) ( not ( = ?auto_2708 ?auto_2719 ) ) ( IS-CRATE ?auto_2707 ) ( AVAILABLE ?auto_2713 ) ( SURFACE-AT ?auto_2707 ?auto_2712 ) ( ON ?auto_2707 ?auto_2728 ) ( CLEAR ?auto_2707 ) ( not ( = ?auto_2706 ?auto_2707 ) ) ( not ( = ?auto_2706 ?auto_2728 ) ) ( not ( = ?auto_2707 ?auto_2728 ) ) ( IS-CRATE ?auto_2706 ) ( not ( = ?auto_2726 ?auto_2716 ) ) ( HOIST-AT ?auto_2729 ?auto_2726 ) ( AVAILABLE ?auto_2729 ) ( SURFACE-AT ?auto_2706 ?auto_2726 ) ( ON ?auto_2706 ?auto_2727 ) ( CLEAR ?auto_2706 ) ( not ( = ?auto_2705 ?auto_2706 ) ) ( not ( = ?auto_2705 ?auto_2727 ) ) ( not ( = ?auto_2706 ?auto_2727 ) ) ( not ( = ?auto_2717 ?auto_2729 ) ) ( SURFACE-AT ?auto_2704 ?auto_2716 ) ( CLEAR ?auto_2704 ) ( IS-CRATE ?auto_2705 ) ( AVAILABLE ?auto_2717 ) ( not ( = ?auto_2725 ?auto_2716 ) ) ( HOIST-AT ?auto_2722 ?auto_2725 ) ( AVAILABLE ?auto_2722 ) ( SURFACE-AT ?auto_2705 ?auto_2725 ) ( ON ?auto_2705 ?auto_2721 ) ( CLEAR ?auto_2705 ) ( TRUCK-AT ?auto_2715 ?auto_2716 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2704 ?auto_2721 ) ) ( not ( = ?auto_2705 ?auto_2721 ) ) ( not ( = ?auto_2717 ?auto_2722 ) ) ( not ( = ?auto_2704 ?auto_2706 ) ) ( not ( = ?auto_2704 ?auto_2727 ) ) ( not ( = ?auto_2706 ?auto_2721 ) ) ( not ( = ?auto_2726 ?auto_2725 ) ) ( not ( = ?auto_2729 ?auto_2722 ) ) ( not ( = ?auto_2727 ?auto_2721 ) ) ( not ( = ?auto_2704 ?auto_2707 ) ) ( not ( = ?auto_2704 ?auto_2728 ) ) ( not ( = ?auto_2705 ?auto_2707 ) ) ( not ( = ?auto_2705 ?auto_2728 ) ) ( not ( = ?auto_2707 ?auto_2727 ) ) ( not ( = ?auto_2707 ?auto_2721 ) ) ( not ( = ?auto_2712 ?auto_2726 ) ) ( not ( = ?auto_2712 ?auto_2725 ) ) ( not ( = ?auto_2713 ?auto_2729 ) ) ( not ( = ?auto_2713 ?auto_2722 ) ) ( not ( = ?auto_2728 ?auto_2727 ) ) ( not ( = ?auto_2728 ?auto_2721 ) ) ( not ( = ?auto_2704 ?auto_2708 ) ) ( not ( = ?auto_2704 ?auto_2719 ) ) ( not ( = ?auto_2705 ?auto_2708 ) ) ( not ( = ?auto_2705 ?auto_2719 ) ) ( not ( = ?auto_2706 ?auto_2708 ) ) ( not ( = ?auto_2706 ?auto_2719 ) ) ( not ( = ?auto_2708 ?auto_2728 ) ) ( not ( = ?auto_2708 ?auto_2727 ) ) ( not ( = ?auto_2708 ?auto_2721 ) ) ( not ( = ?auto_2723 ?auto_2712 ) ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( not ( = ?auto_2723 ?auto_2725 ) ) ( not ( = ?auto_2718 ?auto_2713 ) ) ( not ( = ?auto_2718 ?auto_2729 ) ) ( not ( = ?auto_2718 ?auto_2722 ) ) ( not ( = ?auto_2719 ?auto_2728 ) ) ( not ( = ?auto_2719 ?auto_2727 ) ) ( not ( = ?auto_2719 ?auto_2721 ) ) ( not ( = ?auto_2704 ?auto_2709 ) ) ( not ( = ?auto_2704 ?auto_2724 ) ) ( not ( = ?auto_2705 ?auto_2709 ) ) ( not ( = ?auto_2705 ?auto_2724 ) ) ( not ( = ?auto_2706 ?auto_2709 ) ) ( not ( = ?auto_2706 ?auto_2724 ) ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( not ( = ?auto_2707 ?auto_2724 ) ) ( not ( = ?auto_2709 ?auto_2719 ) ) ( not ( = ?auto_2709 ?auto_2728 ) ) ( not ( = ?auto_2709 ?auto_2727 ) ) ( not ( = ?auto_2709 ?auto_2721 ) ) ( not ( = ?auto_2724 ?auto_2719 ) ) ( not ( = ?auto_2724 ?auto_2728 ) ) ( not ( = ?auto_2724 ?auto_2727 ) ) ( not ( = ?auto_2724 ?auto_2721 ) ) ( not ( = ?auto_2704 ?auto_2710 ) ) ( not ( = ?auto_2704 ?auto_2720 ) ) ( not ( = ?auto_2705 ?auto_2710 ) ) ( not ( = ?auto_2705 ?auto_2720 ) ) ( not ( = ?auto_2706 ?auto_2710 ) ) ( not ( = ?auto_2706 ?auto_2720 ) ) ( not ( = ?auto_2707 ?auto_2710 ) ) ( not ( = ?auto_2707 ?auto_2720 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2708 ?auto_2720 ) ) ( not ( = ?auto_2710 ?auto_2724 ) ) ( not ( = ?auto_2710 ?auto_2719 ) ) ( not ( = ?auto_2710 ?auto_2728 ) ) ( not ( = ?auto_2710 ?auto_2727 ) ) ( not ( = ?auto_2710 ?auto_2721 ) ) ( not ( = ?auto_2720 ?auto_2724 ) ) ( not ( = ?auto_2720 ?auto_2719 ) ) ( not ( = ?auto_2720 ?auto_2728 ) ) ( not ( = ?auto_2720 ?auto_2727 ) ) ( not ( = ?auto_2720 ?auto_2721 ) ) ( not ( = ?auto_2704 ?auto_2711 ) ) ( not ( = ?auto_2704 ?auto_2714 ) ) ( not ( = ?auto_2705 ?auto_2711 ) ) ( not ( = ?auto_2705 ?auto_2714 ) ) ( not ( = ?auto_2706 ?auto_2711 ) ) ( not ( = ?auto_2706 ?auto_2714 ) ) ( not ( = ?auto_2707 ?auto_2711 ) ) ( not ( = ?auto_2707 ?auto_2714 ) ) ( not ( = ?auto_2708 ?auto_2711 ) ) ( not ( = ?auto_2708 ?auto_2714 ) ) ( not ( = ?auto_2709 ?auto_2711 ) ) ( not ( = ?auto_2709 ?auto_2714 ) ) ( not ( = ?auto_2711 ?auto_2720 ) ) ( not ( = ?auto_2711 ?auto_2724 ) ) ( not ( = ?auto_2711 ?auto_2719 ) ) ( not ( = ?auto_2711 ?auto_2728 ) ) ( not ( = ?auto_2711 ?auto_2727 ) ) ( not ( = ?auto_2711 ?auto_2721 ) ) ( not ( = ?auto_2714 ?auto_2720 ) ) ( not ( = ?auto_2714 ?auto_2724 ) ) ( not ( = ?auto_2714 ?auto_2719 ) ) ( not ( = ?auto_2714 ?auto_2728 ) ) ( not ( = ?auto_2714 ?auto_2727 ) ) ( not ( = ?auto_2714 ?auto_2721 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2704 ?auto_2705 ?auto_2706 ?auto_2707 ?auto_2708 ?auto_2709 ?auto_2710 )
      ( MAKE-1CRATE ?auto_2710 ?auto_2711 )
      ( MAKE-7CRATE-VERIFY ?auto_2704 ?auto_2705 ?auto_2706 ?auto_2707 ?auto_2708 ?auto_2709 ?auto_2710 ?auto_2711 ) )
  )

)

