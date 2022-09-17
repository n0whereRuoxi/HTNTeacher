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
      ?auto_2602 - SURFACE
      ?auto_2603 - SURFACE
    )
    :vars
    (
      ?auto_2604 - HOIST
      ?auto_2605 - PLACE
      ?auto_2607 - PLACE
      ?auto_2608 - HOIST
      ?auto_2609 - SURFACE
      ?auto_2606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2604 ?auto_2605 ) ( SURFACE-AT ?auto_2603 ?auto_2605 ) ( CLEAR ?auto_2603 ) ( IS-CRATE ?auto_2602 ) ( AVAILABLE ?auto_2604 ) ( not ( = ?auto_2607 ?auto_2605 ) ) ( HOIST-AT ?auto_2608 ?auto_2607 ) ( AVAILABLE ?auto_2608 ) ( SURFACE-AT ?auto_2602 ?auto_2607 ) ( ON ?auto_2602 ?auto_2609 ) ( CLEAR ?auto_2602 ) ( TRUCK-AT ?auto_2606 ?auto_2605 ) ( not ( = ?auto_2602 ?auto_2603 ) ) ( not ( = ?auto_2602 ?auto_2609 ) ) ( not ( = ?auto_2603 ?auto_2609 ) ) ( not ( = ?auto_2604 ?auto_2608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2606 ?auto_2605 ?auto_2607 )
      ( !LIFT ?auto_2608 ?auto_2602 ?auto_2609 ?auto_2607 )
      ( !LOAD ?auto_2608 ?auto_2602 ?auto_2606 ?auto_2607 )
      ( !DRIVE ?auto_2606 ?auto_2607 ?auto_2605 )
      ( !UNLOAD ?auto_2604 ?auto_2602 ?auto_2606 ?auto_2605 )
      ( !DROP ?auto_2604 ?auto_2602 ?auto_2603 ?auto_2605 )
      ( MAKE-ON-VERIFY ?auto_2602 ?auto_2603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2612 - SURFACE
      ?auto_2613 - SURFACE
    )
    :vars
    (
      ?auto_2614 - HOIST
      ?auto_2615 - PLACE
      ?auto_2617 - PLACE
      ?auto_2618 - HOIST
      ?auto_2619 - SURFACE
      ?auto_2616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2614 ?auto_2615 ) ( SURFACE-AT ?auto_2613 ?auto_2615 ) ( CLEAR ?auto_2613 ) ( IS-CRATE ?auto_2612 ) ( AVAILABLE ?auto_2614 ) ( not ( = ?auto_2617 ?auto_2615 ) ) ( HOIST-AT ?auto_2618 ?auto_2617 ) ( AVAILABLE ?auto_2618 ) ( SURFACE-AT ?auto_2612 ?auto_2617 ) ( ON ?auto_2612 ?auto_2619 ) ( CLEAR ?auto_2612 ) ( TRUCK-AT ?auto_2616 ?auto_2615 ) ( not ( = ?auto_2612 ?auto_2613 ) ) ( not ( = ?auto_2612 ?auto_2619 ) ) ( not ( = ?auto_2613 ?auto_2619 ) ) ( not ( = ?auto_2614 ?auto_2618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2616 ?auto_2615 ?auto_2617 )
      ( !LIFT ?auto_2618 ?auto_2612 ?auto_2619 ?auto_2617 )
      ( !LOAD ?auto_2618 ?auto_2612 ?auto_2616 ?auto_2617 )
      ( !DRIVE ?auto_2616 ?auto_2617 ?auto_2615 )
      ( !UNLOAD ?auto_2614 ?auto_2612 ?auto_2616 ?auto_2615 )
      ( !DROP ?auto_2614 ?auto_2612 ?auto_2613 ?auto_2615 )
      ( MAKE-ON-VERIFY ?auto_2612 ?auto_2613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2622 - SURFACE
      ?auto_2623 - SURFACE
    )
    :vars
    (
      ?auto_2624 - HOIST
      ?auto_2625 - PLACE
      ?auto_2627 - PLACE
      ?auto_2628 - HOIST
      ?auto_2629 - SURFACE
      ?auto_2626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2624 ?auto_2625 ) ( SURFACE-AT ?auto_2623 ?auto_2625 ) ( CLEAR ?auto_2623 ) ( IS-CRATE ?auto_2622 ) ( AVAILABLE ?auto_2624 ) ( not ( = ?auto_2627 ?auto_2625 ) ) ( HOIST-AT ?auto_2628 ?auto_2627 ) ( AVAILABLE ?auto_2628 ) ( SURFACE-AT ?auto_2622 ?auto_2627 ) ( ON ?auto_2622 ?auto_2629 ) ( CLEAR ?auto_2622 ) ( TRUCK-AT ?auto_2626 ?auto_2625 ) ( not ( = ?auto_2622 ?auto_2623 ) ) ( not ( = ?auto_2622 ?auto_2629 ) ) ( not ( = ?auto_2623 ?auto_2629 ) ) ( not ( = ?auto_2624 ?auto_2628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2626 ?auto_2625 ?auto_2627 )
      ( !LIFT ?auto_2628 ?auto_2622 ?auto_2629 ?auto_2627 )
      ( !LOAD ?auto_2628 ?auto_2622 ?auto_2626 ?auto_2627 )
      ( !DRIVE ?auto_2626 ?auto_2627 ?auto_2625 )
      ( !UNLOAD ?auto_2624 ?auto_2622 ?auto_2626 ?auto_2625 )
      ( !DROP ?auto_2624 ?auto_2622 ?auto_2623 ?auto_2625 )
      ( MAKE-ON-VERIFY ?auto_2622 ?auto_2623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2632 - SURFACE
      ?auto_2633 - SURFACE
    )
    :vars
    (
      ?auto_2634 - HOIST
      ?auto_2635 - PLACE
      ?auto_2637 - PLACE
      ?auto_2638 - HOIST
      ?auto_2639 - SURFACE
      ?auto_2636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2634 ?auto_2635 ) ( SURFACE-AT ?auto_2633 ?auto_2635 ) ( CLEAR ?auto_2633 ) ( IS-CRATE ?auto_2632 ) ( AVAILABLE ?auto_2634 ) ( not ( = ?auto_2637 ?auto_2635 ) ) ( HOIST-AT ?auto_2638 ?auto_2637 ) ( AVAILABLE ?auto_2638 ) ( SURFACE-AT ?auto_2632 ?auto_2637 ) ( ON ?auto_2632 ?auto_2639 ) ( CLEAR ?auto_2632 ) ( TRUCK-AT ?auto_2636 ?auto_2635 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2632 ?auto_2639 ) ) ( not ( = ?auto_2633 ?auto_2639 ) ) ( not ( = ?auto_2634 ?auto_2638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2636 ?auto_2635 ?auto_2637 )
      ( !LIFT ?auto_2638 ?auto_2632 ?auto_2639 ?auto_2637 )
      ( !LOAD ?auto_2638 ?auto_2632 ?auto_2636 ?auto_2637 )
      ( !DRIVE ?auto_2636 ?auto_2637 ?auto_2635 )
      ( !UNLOAD ?auto_2634 ?auto_2632 ?auto_2636 ?auto_2635 )
      ( !DROP ?auto_2634 ?auto_2632 ?auto_2633 ?auto_2635 )
      ( MAKE-ON-VERIFY ?auto_2632 ?auto_2633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
    )
    :vars
    (
      ?auto_2644 - HOIST
      ?auto_2645 - PLACE
      ?auto_2647 - PLACE
      ?auto_2648 - HOIST
      ?auto_2649 - SURFACE
      ?auto_2646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2644 ?auto_2645 ) ( SURFACE-AT ?auto_2643 ?auto_2645 ) ( CLEAR ?auto_2643 ) ( IS-CRATE ?auto_2642 ) ( AVAILABLE ?auto_2644 ) ( not ( = ?auto_2647 ?auto_2645 ) ) ( HOIST-AT ?auto_2648 ?auto_2647 ) ( AVAILABLE ?auto_2648 ) ( SURFACE-AT ?auto_2642 ?auto_2647 ) ( ON ?auto_2642 ?auto_2649 ) ( CLEAR ?auto_2642 ) ( TRUCK-AT ?auto_2646 ?auto_2645 ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2649 ) ) ( not ( = ?auto_2643 ?auto_2649 ) ) ( not ( = ?auto_2644 ?auto_2648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2646 ?auto_2645 ?auto_2647 )
      ( !LIFT ?auto_2648 ?auto_2642 ?auto_2649 ?auto_2647 )
      ( !LOAD ?auto_2648 ?auto_2642 ?auto_2646 ?auto_2647 )
      ( !DRIVE ?auto_2646 ?auto_2647 ?auto_2645 )
      ( !UNLOAD ?auto_2644 ?auto_2642 ?auto_2646 ?auto_2645 )
      ( !DROP ?auto_2644 ?auto_2642 ?auto_2643 ?auto_2645 )
      ( MAKE-ON-VERIFY ?auto_2642 ?auto_2643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2652 - SURFACE
      ?auto_2653 - SURFACE
    )
    :vars
    (
      ?auto_2654 - HOIST
      ?auto_2655 - PLACE
      ?auto_2657 - PLACE
      ?auto_2658 - HOIST
      ?auto_2659 - SURFACE
      ?auto_2656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2654 ?auto_2655 ) ( SURFACE-AT ?auto_2653 ?auto_2655 ) ( CLEAR ?auto_2653 ) ( IS-CRATE ?auto_2652 ) ( AVAILABLE ?auto_2654 ) ( not ( = ?auto_2657 ?auto_2655 ) ) ( HOIST-AT ?auto_2658 ?auto_2657 ) ( AVAILABLE ?auto_2658 ) ( SURFACE-AT ?auto_2652 ?auto_2657 ) ( ON ?auto_2652 ?auto_2659 ) ( CLEAR ?auto_2652 ) ( TRUCK-AT ?auto_2656 ?auto_2655 ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2659 ) ) ( not ( = ?auto_2653 ?auto_2659 ) ) ( not ( = ?auto_2654 ?auto_2658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2656 ?auto_2655 ?auto_2657 )
      ( !LIFT ?auto_2658 ?auto_2652 ?auto_2659 ?auto_2657 )
      ( !LOAD ?auto_2658 ?auto_2652 ?auto_2656 ?auto_2657 )
      ( !DRIVE ?auto_2656 ?auto_2657 ?auto_2655 )
      ( !UNLOAD ?auto_2654 ?auto_2652 ?auto_2656 ?auto_2655 )
      ( !DROP ?auto_2654 ?auto_2652 ?auto_2653 ?auto_2655 )
      ( MAKE-ON-VERIFY ?auto_2652 ?auto_2653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2662 - SURFACE
      ?auto_2663 - SURFACE
    )
    :vars
    (
      ?auto_2664 - HOIST
      ?auto_2665 - PLACE
      ?auto_2667 - PLACE
      ?auto_2668 - HOIST
      ?auto_2669 - SURFACE
      ?auto_2666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664 ?auto_2665 ) ( SURFACE-AT ?auto_2663 ?auto_2665 ) ( CLEAR ?auto_2663 ) ( IS-CRATE ?auto_2662 ) ( AVAILABLE ?auto_2664 ) ( not ( = ?auto_2667 ?auto_2665 ) ) ( HOIST-AT ?auto_2668 ?auto_2667 ) ( AVAILABLE ?auto_2668 ) ( SURFACE-AT ?auto_2662 ?auto_2667 ) ( ON ?auto_2662 ?auto_2669 ) ( CLEAR ?auto_2662 ) ( TRUCK-AT ?auto_2666 ?auto_2665 ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2669 ) ) ( not ( = ?auto_2663 ?auto_2669 ) ) ( not ( = ?auto_2664 ?auto_2668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2666 ?auto_2665 ?auto_2667 )
      ( !LIFT ?auto_2668 ?auto_2662 ?auto_2669 ?auto_2667 )
      ( !LOAD ?auto_2668 ?auto_2662 ?auto_2666 ?auto_2667 )
      ( !DRIVE ?auto_2666 ?auto_2667 ?auto_2665 )
      ( !UNLOAD ?auto_2664 ?auto_2662 ?auto_2666 ?auto_2665 )
      ( !DROP ?auto_2664 ?auto_2662 ?auto_2663 ?auto_2665 )
      ( MAKE-ON-VERIFY ?auto_2662 ?auto_2663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2672 - SURFACE
      ?auto_2673 - SURFACE
    )
    :vars
    (
      ?auto_2674 - HOIST
      ?auto_2675 - PLACE
      ?auto_2677 - PLACE
      ?auto_2678 - HOIST
      ?auto_2679 - SURFACE
      ?auto_2676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2674 ?auto_2675 ) ( SURFACE-AT ?auto_2673 ?auto_2675 ) ( CLEAR ?auto_2673 ) ( IS-CRATE ?auto_2672 ) ( AVAILABLE ?auto_2674 ) ( not ( = ?auto_2677 ?auto_2675 ) ) ( HOIST-AT ?auto_2678 ?auto_2677 ) ( AVAILABLE ?auto_2678 ) ( SURFACE-AT ?auto_2672 ?auto_2677 ) ( ON ?auto_2672 ?auto_2679 ) ( CLEAR ?auto_2672 ) ( TRUCK-AT ?auto_2676 ?auto_2675 ) ( not ( = ?auto_2672 ?auto_2673 ) ) ( not ( = ?auto_2672 ?auto_2679 ) ) ( not ( = ?auto_2673 ?auto_2679 ) ) ( not ( = ?auto_2674 ?auto_2678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2676 ?auto_2675 ?auto_2677 )
      ( !LIFT ?auto_2678 ?auto_2672 ?auto_2679 ?auto_2677 )
      ( !LOAD ?auto_2678 ?auto_2672 ?auto_2676 ?auto_2677 )
      ( !DRIVE ?auto_2676 ?auto_2677 ?auto_2675 )
      ( !UNLOAD ?auto_2674 ?auto_2672 ?auto_2676 ?auto_2675 )
      ( !DROP ?auto_2674 ?auto_2672 ?auto_2673 ?auto_2675 )
      ( MAKE-ON-VERIFY ?auto_2672 ?auto_2673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2682 - SURFACE
      ?auto_2683 - SURFACE
    )
    :vars
    (
      ?auto_2684 - HOIST
      ?auto_2685 - PLACE
      ?auto_2687 - PLACE
      ?auto_2688 - HOIST
      ?auto_2689 - SURFACE
      ?auto_2686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684 ?auto_2685 ) ( SURFACE-AT ?auto_2683 ?auto_2685 ) ( CLEAR ?auto_2683 ) ( IS-CRATE ?auto_2682 ) ( AVAILABLE ?auto_2684 ) ( not ( = ?auto_2687 ?auto_2685 ) ) ( HOIST-AT ?auto_2688 ?auto_2687 ) ( AVAILABLE ?auto_2688 ) ( SURFACE-AT ?auto_2682 ?auto_2687 ) ( ON ?auto_2682 ?auto_2689 ) ( CLEAR ?auto_2682 ) ( TRUCK-AT ?auto_2686 ?auto_2685 ) ( not ( = ?auto_2682 ?auto_2683 ) ) ( not ( = ?auto_2682 ?auto_2689 ) ) ( not ( = ?auto_2683 ?auto_2689 ) ) ( not ( = ?auto_2684 ?auto_2688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2686 ?auto_2685 ?auto_2687 )
      ( !LIFT ?auto_2688 ?auto_2682 ?auto_2689 ?auto_2687 )
      ( !LOAD ?auto_2688 ?auto_2682 ?auto_2686 ?auto_2687 )
      ( !DRIVE ?auto_2686 ?auto_2687 ?auto_2685 )
      ( !UNLOAD ?auto_2684 ?auto_2682 ?auto_2686 ?auto_2685 )
      ( !DROP ?auto_2684 ?auto_2682 ?auto_2683 ?auto_2685 )
      ( MAKE-ON-VERIFY ?auto_2682 ?auto_2683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2692 - SURFACE
      ?auto_2693 - SURFACE
    )
    :vars
    (
      ?auto_2694 - HOIST
      ?auto_2695 - PLACE
      ?auto_2697 - PLACE
      ?auto_2698 - HOIST
      ?auto_2699 - SURFACE
      ?auto_2696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2694 ?auto_2695 ) ( SURFACE-AT ?auto_2693 ?auto_2695 ) ( CLEAR ?auto_2693 ) ( IS-CRATE ?auto_2692 ) ( AVAILABLE ?auto_2694 ) ( not ( = ?auto_2697 ?auto_2695 ) ) ( HOIST-AT ?auto_2698 ?auto_2697 ) ( AVAILABLE ?auto_2698 ) ( SURFACE-AT ?auto_2692 ?auto_2697 ) ( ON ?auto_2692 ?auto_2699 ) ( CLEAR ?auto_2692 ) ( TRUCK-AT ?auto_2696 ?auto_2695 ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2699 ) ) ( not ( = ?auto_2693 ?auto_2699 ) ) ( not ( = ?auto_2694 ?auto_2698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2696 ?auto_2695 ?auto_2697 )
      ( !LIFT ?auto_2698 ?auto_2692 ?auto_2699 ?auto_2697 )
      ( !LOAD ?auto_2698 ?auto_2692 ?auto_2696 ?auto_2697 )
      ( !DRIVE ?auto_2696 ?auto_2697 ?auto_2695 )
      ( !UNLOAD ?auto_2694 ?auto_2692 ?auto_2696 ?auto_2695 )
      ( !DROP ?auto_2694 ?auto_2692 ?auto_2693 ?auto_2695 )
      ( MAKE-ON-VERIFY ?auto_2692 ?auto_2693 ) )
  )

)

