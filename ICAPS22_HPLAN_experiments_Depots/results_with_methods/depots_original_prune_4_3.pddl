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
      ?auto_2635 - SURFACE
      ?auto_2636 - SURFACE
    )
    :vars
    (
      ?auto_2637 - HOIST
      ?auto_2638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2637 ?auto_2638 ) ( SURFACE-AT ?auto_2636 ?auto_2638 ) ( CLEAR ?auto_2636 ) ( LIFTING ?auto_2637 ?auto_2635 ) ( IS-CRATE ?auto_2635 ) ( not ( = ?auto_2635 ?auto_2636 ) ) )
    :subtasks
    ( ( !DROP ?auto_2637 ?auto_2635 ?auto_2636 ?auto_2638 )
      ( MAKE-ON-VERIFY ?auto_2635 ?auto_2636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2639 - SURFACE
      ?auto_2640 - SURFACE
    )
    :vars
    (
      ?auto_2642 - HOIST
      ?auto_2641 - PLACE
      ?auto_2643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2642 ?auto_2641 ) ( SURFACE-AT ?auto_2640 ?auto_2641 ) ( CLEAR ?auto_2640 ) ( IS-CRATE ?auto_2639 ) ( not ( = ?auto_2639 ?auto_2640 ) ) ( TRUCK-AT ?auto_2643 ?auto_2641 ) ( AVAILABLE ?auto_2642 ) ( IN ?auto_2639 ?auto_2643 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2642 ?auto_2639 ?auto_2643 ?auto_2641 )
      ( MAKE-ON ?auto_2639 ?auto_2640 )
      ( MAKE-ON-VERIFY ?auto_2639 ?auto_2640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2644 - SURFACE
      ?auto_2645 - SURFACE
    )
    :vars
    (
      ?auto_2646 - HOIST
      ?auto_2647 - PLACE
      ?auto_2648 - TRUCK
      ?auto_2649 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2646 ?auto_2647 ) ( SURFACE-AT ?auto_2645 ?auto_2647 ) ( CLEAR ?auto_2645 ) ( IS-CRATE ?auto_2644 ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( AVAILABLE ?auto_2646 ) ( IN ?auto_2644 ?auto_2648 ) ( TRUCK-AT ?auto_2648 ?auto_2649 ) ( not ( = ?auto_2649 ?auto_2647 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2648 ?auto_2649 ?auto_2647 )
      ( MAKE-ON ?auto_2644 ?auto_2645 )
      ( MAKE-ON-VERIFY ?auto_2644 ?auto_2645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2650 - SURFACE
      ?auto_2651 - SURFACE
    )
    :vars
    (
      ?auto_2652 - HOIST
      ?auto_2653 - PLACE
      ?auto_2655 - TRUCK
      ?auto_2654 - PLACE
      ?auto_2656 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2652 ?auto_2653 ) ( SURFACE-AT ?auto_2651 ?auto_2653 ) ( CLEAR ?auto_2651 ) ( IS-CRATE ?auto_2650 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( AVAILABLE ?auto_2652 ) ( TRUCK-AT ?auto_2655 ?auto_2654 ) ( not ( = ?auto_2654 ?auto_2653 ) ) ( HOIST-AT ?auto_2656 ?auto_2654 ) ( LIFTING ?auto_2656 ?auto_2650 ) ( not ( = ?auto_2652 ?auto_2656 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2656 ?auto_2650 ?auto_2655 ?auto_2654 )
      ( MAKE-ON ?auto_2650 ?auto_2651 )
      ( MAKE-ON-VERIFY ?auto_2650 ?auto_2651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2657 - SURFACE
      ?auto_2658 - SURFACE
    )
    :vars
    (
      ?auto_2663 - HOIST
      ?auto_2659 - PLACE
      ?auto_2660 - TRUCK
      ?auto_2662 - PLACE
      ?auto_2661 - HOIST
      ?auto_2664 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2663 ?auto_2659 ) ( SURFACE-AT ?auto_2658 ?auto_2659 ) ( CLEAR ?auto_2658 ) ( IS-CRATE ?auto_2657 ) ( not ( = ?auto_2657 ?auto_2658 ) ) ( AVAILABLE ?auto_2663 ) ( TRUCK-AT ?auto_2660 ?auto_2662 ) ( not ( = ?auto_2662 ?auto_2659 ) ) ( HOIST-AT ?auto_2661 ?auto_2662 ) ( not ( = ?auto_2663 ?auto_2661 ) ) ( AVAILABLE ?auto_2661 ) ( SURFACE-AT ?auto_2657 ?auto_2662 ) ( ON ?auto_2657 ?auto_2664 ) ( CLEAR ?auto_2657 ) ( not ( = ?auto_2657 ?auto_2664 ) ) ( not ( = ?auto_2658 ?auto_2664 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2661 ?auto_2657 ?auto_2664 ?auto_2662 )
      ( MAKE-ON ?auto_2657 ?auto_2658 )
      ( MAKE-ON-VERIFY ?auto_2657 ?auto_2658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2665 - SURFACE
      ?auto_2666 - SURFACE
    )
    :vars
    (
      ?auto_2669 - HOIST
      ?auto_2670 - PLACE
      ?auto_2667 - PLACE
      ?auto_2672 - HOIST
      ?auto_2668 - SURFACE
      ?auto_2671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669 ?auto_2670 ) ( SURFACE-AT ?auto_2666 ?auto_2670 ) ( CLEAR ?auto_2666 ) ( IS-CRATE ?auto_2665 ) ( not ( = ?auto_2665 ?auto_2666 ) ) ( AVAILABLE ?auto_2669 ) ( not ( = ?auto_2667 ?auto_2670 ) ) ( HOIST-AT ?auto_2672 ?auto_2667 ) ( not ( = ?auto_2669 ?auto_2672 ) ) ( AVAILABLE ?auto_2672 ) ( SURFACE-AT ?auto_2665 ?auto_2667 ) ( ON ?auto_2665 ?auto_2668 ) ( CLEAR ?auto_2665 ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( TRUCK-AT ?auto_2671 ?auto_2670 ) )
    :subtasks
    ( ( !DRIVE ?auto_2671 ?auto_2670 ?auto_2667 )
      ( MAKE-ON ?auto_2665 ?auto_2666 )
      ( MAKE-ON-VERIFY ?auto_2665 ?auto_2666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2713 - SURFACE
      ?auto_2714 - SURFACE
    )
    :vars
    (
      ?auto_2715 - HOIST
      ?auto_2718 - PLACE
      ?auto_2720 - PLACE
      ?auto_2716 - HOIST
      ?auto_2717 - SURFACE
      ?auto_2719 - TRUCK
      ?auto_2721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2715 ?auto_2718 ) ( IS-CRATE ?auto_2713 ) ( not ( = ?auto_2713 ?auto_2714 ) ) ( not ( = ?auto_2720 ?auto_2718 ) ) ( HOIST-AT ?auto_2716 ?auto_2720 ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( AVAILABLE ?auto_2716 ) ( SURFACE-AT ?auto_2713 ?auto_2720 ) ( ON ?auto_2713 ?auto_2717 ) ( CLEAR ?auto_2713 ) ( not ( = ?auto_2713 ?auto_2717 ) ) ( not ( = ?auto_2714 ?auto_2717 ) ) ( TRUCK-AT ?auto_2719 ?auto_2718 ) ( SURFACE-AT ?auto_2721 ?auto_2718 ) ( CLEAR ?auto_2721 ) ( LIFTING ?auto_2715 ?auto_2714 ) ( IS-CRATE ?auto_2714 ) ( not ( = ?auto_2713 ?auto_2721 ) ) ( not ( = ?auto_2714 ?auto_2721 ) ) ( not ( = ?auto_2717 ?auto_2721 ) ) )
    :subtasks
    ( ( !DROP ?auto_2715 ?auto_2714 ?auto_2721 ?auto_2718 )
      ( MAKE-ON ?auto_2713 ?auto_2714 )
      ( MAKE-ON-VERIFY ?auto_2713 ?auto_2714 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2722 - SURFACE
      ?auto_2723 - SURFACE
    )
    :vars
    (
      ?auto_2730 - HOIST
      ?auto_2726 - PLACE
      ?auto_2728 - PLACE
      ?auto_2724 - HOIST
      ?auto_2729 - SURFACE
      ?auto_2725 - TRUCK
      ?auto_2727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2730 ?auto_2726 ) ( IS-CRATE ?auto_2722 ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( not ( = ?auto_2728 ?auto_2726 ) ) ( HOIST-AT ?auto_2724 ?auto_2728 ) ( not ( = ?auto_2730 ?auto_2724 ) ) ( AVAILABLE ?auto_2724 ) ( SURFACE-AT ?auto_2722 ?auto_2728 ) ( ON ?auto_2722 ?auto_2729 ) ( CLEAR ?auto_2722 ) ( not ( = ?auto_2722 ?auto_2729 ) ) ( not ( = ?auto_2723 ?auto_2729 ) ) ( TRUCK-AT ?auto_2725 ?auto_2726 ) ( SURFACE-AT ?auto_2727 ?auto_2726 ) ( CLEAR ?auto_2727 ) ( IS-CRATE ?auto_2723 ) ( not ( = ?auto_2722 ?auto_2727 ) ) ( not ( = ?auto_2723 ?auto_2727 ) ) ( not ( = ?auto_2729 ?auto_2727 ) ) ( AVAILABLE ?auto_2730 ) ( IN ?auto_2723 ?auto_2725 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2730 ?auto_2723 ?auto_2725 ?auto_2726 )
      ( MAKE-ON ?auto_2722 ?auto_2723 )
      ( MAKE-ON-VERIFY ?auto_2722 ?auto_2723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2737 - SURFACE
      ?auto_2738 - SURFACE
    )
    :vars
    (
      ?auto_2741 - HOIST
      ?auto_2739 - PLACE
      ?auto_2744 - PLACE
      ?auto_2740 - HOIST
      ?auto_2743 - SURFACE
      ?auto_2742 - TRUCK
      ?auto_2745 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741 ?auto_2739 ) ( SURFACE-AT ?auto_2738 ?auto_2739 ) ( CLEAR ?auto_2738 ) ( IS-CRATE ?auto_2737 ) ( not ( = ?auto_2737 ?auto_2738 ) ) ( AVAILABLE ?auto_2741 ) ( not ( = ?auto_2744 ?auto_2739 ) ) ( HOIST-AT ?auto_2740 ?auto_2744 ) ( not ( = ?auto_2741 ?auto_2740 ) ) ( AVAILABLE ?auto_2740 ) ( SURFACE-AT ?auto_2737 ?auto_2744 ) ( ON ?auto_2737 ?auto_2743 ) ( CLEAR ?auto_2737 ) ( not ( = ?auto_2737 ?auto_2743 ) ) ( not ( = ?auto_2738 ?auto_2743 ) ) ( TRUCK-AT ?auto_2742 ?auto_2745 ) ( not ( = ?auto_2745 ?auto_2739 ) ) ( not ( = ?auto_2744 ?auto_2745 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2742 ?auto_2745 ?auto_2739 )
      ( MAKE-ON ?auto_2737 ?auto_2738 )
      ( MAKE-ON-VERIFY ?auto_2737 ?auto_2738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2910 - SURFACE
      ?auto_2911 - SURFACE
    )
    :vars
    (
      ?auto_2914 - HOIST
      ?auto_2917 - PLACE
      ?auto_2912 - TRUCK
      ?auto_2916 - PLACE
      ?auto_2913 - HOIST
      ?auto_2915 - SURFACE
      ?auto_2918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2914 ?auto_2917 ) ( SURFACE-AT ?auto_2911 ?auto_2917 ) ( CLEAR ?auto_2911 ) ( IS-CRATE ?auto_2910 ) ( not ( = ?auto_2910 ?auto_2911 ) ) ( AVAILABLE ?auto_2914 ) ( TRUCK-AT ?auto_2912 ?auto_2916 ) ( not ( = ?auto_2916 ?auto_2917 ) ) ( HOIST-AT ?auto_2913 ?auto_2916 ) ( not ( = ?auto_2914 ?auto_2913 ) ) ( SURFACE-AT ?auto_2910 ?auto_2916 ) ( ON ?auto_2910 ?auto_2915 ) ( CLEAR ?auto_2910 ) ( not ( = ?auto_2910 ?auto_2915 ) ) ( not ( = ?auto_2911 ?auto_2915 ) ) ( LIFTING ?auto_2913 ?auto_2918 ) ( IS-CRATE ?auto_2918 ) ( not ( = ?auto_2910 ?auto_2918 ) ) ( not ( = ?auto_2911 ?auto_2918 ) ) ( not ( = ?auto_2915 ?auto_2918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2913 ?auto_2918 ?auto_2912 ?auto_2916 )
      ( MAKE-ON ?auto_2910 ?auto_2911 )
      ( MAKE-ON-VERIFY ?auto_2910 ?auto_2911 ) )
  )

)

