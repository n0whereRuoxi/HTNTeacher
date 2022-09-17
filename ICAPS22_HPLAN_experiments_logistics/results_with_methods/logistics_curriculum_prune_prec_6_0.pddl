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
      ?auto_2562 - OBJ
      ?auto_2563 - LOCATION
    )
    :vars
    (
      ?auto_2572 - LOCATION
      ?auto_2569 - CITY
      ?auto_2564 - TRUCK
      ?auto_2575 - LOCATION
      ?auto_2576 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2572 ?auto_2569 ) ( IN-CITY ?auto_2563 ?auto_2569 ) ( not ( = ?auto_2563 ?auto_2572 ) ) ( OBJ-AT ?auto_2562 ?auto_2572 ) ( TRUCK-AT ?auto_2564 ?auto_2575 ) ( IN-CITY ?auto_2575 ?auto_2576 ) ( IN-CITY ?auto_2572 ?auto_2576 ) ( not ( = ?auto_2572 ?auto_2575 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2564 ?auto_2575 ?auto_2572 ?auto_2576 )
      ( !LOAD-TRUCK ?auto_2562 ?auto_2564 ?auto_2572 )
      ( !DRIVE-TRUCK ?auto_2564 ?auto_2572 ?auto_2563 ?auto_2569 )
      ( !UNLOAD-TRUCK ?auto_2562 ?auto_2564 ?auto_2563 )
      ( DELIVER-1PKG-VERIFY ?auto_2562 ?auto_2563 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2599 - OBJ
      ?auto_2601 - OBJ
      ?auto_2603 - LOCATION
    )
    :vars
    (
      ?auto_2605 - LOCATION
      ?auto_2604 - CITY
      ?auto_2602 - CITY
      ?auto_2610 - LOCATION
      ?auto_2615 - CITY
      ?auto_2606 - TRUCK
      ?auto_2611 - LOCATION
      ?auto_2612 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2601 ?auto_2599 ) ( IN-CITY ?auto_2605 ?auto_2604 ) ( IN-CITY ?auto_2603 ?auto_2604 ) ( not ( = ?auto_2603 ?auto_2605 ) ) ( OBJ-AT ?auto_2601 ?auto_2605 ) ( IN-CITY ?auto_2603 ?auto_2602 ) ( IN-CITY ?auto_2605 ?auto_2602 ) ( IN-CITY ?auto_2610 ?auto_2615 ) ( IN-CITY ?auto_2603 ?auto_2615 ) ( not ( = ?auto_2603 ?auto_2610 ) ) ( OBJ-AT ?auto_2599 ?auto_2610 ) ( TRUCK-AT ?auto_2606 ?auto_2611 ) ( IN-CITY ?auto_2611 ?auto_2612 ) ( IN-CITY ?auto_2610 ?auto_2612 ) ( not ( = ?auto_2610 ?auto_2611 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2599 ?auto_2603 )
      ( DELIVER-1PKG ?auto_2601 ?auto_2603 )
      ( DELIVER-2PKG-VERIFY ?auto_2599 ?auto_2601 ?auto_2603 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2638 - OBJ
      ?auto_2640 - OBJ
      ?auto_2641 - OBJ
      ?auto_2646 - LOCATION
    )
    :vars
    (
      ?auto_2644 - LOCATION
      ?auto_2648 - CITY
      ?auto_2643 - CITY
      ?auto_2659 - LOCATION
      ?auto_2649 - CITY
      ?auto_2651 - CITY
      ?auto_2653 - LOCATION
      ?auto_2655 - CITY
      ?auto_2642 - TRUCK
      ?auto_2654 - LOCATION
      ?auto_2656 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2640 ?auto_2638 ) ( GREATER-THAN ?auto_2641 ?auto_2638 ) ( GREATER-THAN ?auto_2641 ?auto_2640 ) ( IN-CITY ?auto_2644 ?auto_2648 ) ( IN-CITY ?auto_2646 ?auto_2648 ) ( not ( = ?auto_2646 ?auto_2644 ) ) ( OBJ-AT ?auto_2641 ?auto_2644 ) ( IN-CITY ?auto_2646 ?auto_2643 ) ( IN-CITY ?auto_2644 ?auto_2643 ) ( IN-CITY ?auto_2659 ?auto_2649 ) ( IN-CITY ?auto_2646 ?auto_2649 ) ( not ( = ?auto_2646 ?auto_2659 ) ) ( OBJ-AT ?auto_2640 ?auto_2659 ) ( IN-CITY ?auto_2646 ?auto_2651 ) ( IN-CITY ?auto_2659 ?auto_2651 ) ( IN-CITY ?auto_2653 ?auto_2655 ) ( IN-CITY ?auto_2646 ?auto_2655 ) ( not ( = ?auto_2646 ?auto_2653 ) ) ( OBJ-AT ?auto_2638 ?auto_2653 ) ( TRUCK-AT ?auto_2642 ?auto_2654 ) ( IN-CITY ?auto_2654 ?auto_2656 ) ( IN-CITY ?auto_2653 ?auto_2656 ) ( not ( = ?auto_2653 ?auto_2654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2638 ?auto_2640 ?auto_2646 )
      ( DELIVER-1PKG ?auto_2641 ?auto_2646 )
      ( DELIVER-3PKG-VERIFY ?auto_2638 ?auto_2640 ?auto_2641 ?auto_2646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2683 - OBJ
      ?auto_2685 - OBJ
      ?auto_2686 - OBJ
      ?auto_2687 - OBJ
      ?auto_2692 - LOCATION
    )
    :vars
    (
      ?auto_2694 - LOCATION
      ?auto_2688 - CITY
      ?auto_2691 - CITY
      ?auto_2708 - LOCATION
      ?auto_2709 - CITY
      ?auto_2702 - CITY
      ?auto_2695 - LOCATION
      ?auto_2697 - CITY
      ?auto_2698 - CITY
      ?auto_2705 - LOCATION
      ?auto_2699 - CITY
      ?auto_2689 - TRUCK
      ?auto_2704 - LOCATION
      ?auto_2706 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2685 ?auto_2683 ) ( GREATER-THAN ?auto_2686 ?auto_2683 ) ( GREATER-THAN ?auto_2686 ?auto_2685 ) ( GREATER-THAN ?auto_2687 ?auto_2683 ) ( GREATER-THAN ?auto_2687 ?auto_2685 ) ( GREATER-THAN ?auto_2687 ?auto_2686 ) ( IN-CITY ?auto_2694 ?auto_2688 ) ( IN-CITY ?auto_2692 ?auto_2688 ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( OBJ-AT ?auto_2687 ?auto_2694 ) ( IN-CITY ?auto_2692 ?auto_2691 ) ( IN-CITY ?auto_2694 ?auto_2691 ) ( IN-CITY ?auto_2708 ?auto_2709 ) ( IN-CITY ?auto_2692 ?auto_2709 ) ( not ( = ?auto_2692 ?auto_2708 ) ) ( OBJ-AT ?auto_2686 ?auto_2708 ) ( IN-CITY ?auto_2692 ?auto_2702 ) ( IN-CITY ?auto_2708 ?auto_2702 ) ( IN-CITY ?auto_2695 ?auto_2697 ) ( IN-CITY ?auto_2692 ?auto_2697 ) ( not ( = ?auto_2692 ?auto_2695 ) ) ( OBJ-AT ?auto_2685 ?auto_2695 ) ( IN-CITY ?auto_2692 ?auto_2698 ) ( IN-CITY ?auto_2695 ?auto_2698 ) ( IN-CITY ?auto_2705 ?auto_2699 ) ( IN-CITY ?auto_2692 ?auto_2699 ) ( not ( = ?auto_2692 ?auto_2705 ) ) ( OBJ-AT ?auto_2683 ?auto_2705 ) ( TRUCK-AT ?auto_2689 ?auto_2704 ) ( IN-CITY ?auto_2704 ?auto_2706 ) ( IN-CITY ?auto_2705 ?auto_2706 ) ( not ( = ?auto_2705 ?auto_2704 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2683 ?auto_2685 ?auto_2686 ?auto_2692 )
      ( DELIVER-1PKG ?auto_2687 ?auto_2692 )
      ( DELIVER-4PKG-VERIFY ?auto_2683 ?auto_2685 ?auto_2686 ?auto_2687 ?auto_2692 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2734 - OBJ
      ?auto_2736 - OBJ
      ?auto_2737 - OBJ
      ?auto_2738 - OBJ
      ?auto_2739 - OBJ
      ?auto_2741 - LOCATION
    )
    :vars
    (
      ?auto_2742 - LOCATION
      ?auto_2743 - CITY
      ?auto_2744 - CITY
      ?auto_2764 - LOCATION
      ?auto_2759 - CITY
      ?auto_2762 - CITY
      ?auto_2747 - LOCATION
      ?auto_2756 - CITY
      ?auto_2750 - CITY
      ?auto_2751 - LOCATION
      ?auto_2749 - CITY
      ?auto_2748 - CITY
      ?auto_2754 - LOCATION
      ?auto_2755 - CITY
      ?auto_2740 - TRUCK
      ?auto_2752 - LOCATION
      ?auto_2753 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2736 ?auto_2734 ) ( GREATER-THAN ?auto_2737 ?auto_2734 ) ( GREATER-THAN ?auto_2737 ?auto_2736 ) ( GREATER-THAN ?auto_2738 ?auto_2734 ) ( GREATER-THAN ?auto_2738 ?auto_2736 ) ( GREATER-THAN ?auto_2738 ?auto_2737 ) ( GREATER-THAN ?auto_2739 ?auto_2734 ) ( GREATER-THAN ?auto_2739 ?auto_2736 ) ( GREATER-THAN ?auto_2739 ?auto_2737 ) ( GREATER-THAN ?auto_2739 ?auto_2738 ) ( IN-CITY ?auto_2742 ?auto_2743 ) ( IN-CITY ?auto_2741 ?auto_2743 ) ( not ( = ?auto_2741 ?auto_2742 ) ) ( OBJ-AT ?auto_2739 ?auto_2742 ) ( IN-CITY ?auto_2741 ?auto_2744 ) ( IN-CITY ?auto_2742 ?auto_2744 ) ( IN-CITY ?auto_2764 ?auto_2759 ) ( IN-CITY ?auto_2741 ?auto_2759 ) ( not ( = ?auto_2741 ?auto_2764 ) ) ( OBJ-AT ?auto_2738 ?auto_2764 ) ( IN-CITY ?auto_2741 ?auto_2762 ) ( IN-CITY ?auto_2764 ?auto_2762 ) ( IN-CITY ?auto_2747 ?auto_2756 ) ( IN-CITY ?auto_2741 ?auto_2756 ) ( not ( = ?auto_2741 ?auto_2747 ) ) ( OBJ-AT ?auto_2737 ?auto_2747 ) ( IN-CITY ?auto_2741 ?auto_2750 ) ( IN-CITY ?auto_2747 ?auto_2750 ) ( IN-CITY ?auto_2751 ?auto_2749 ) ( IN-CITY ?auto_2741 ?auto_2749 ) ( not ( = ?auto_2741 ?auto_2751 ) ) ( OBJ-AT ?auto_2736 ?auto_2751 ) ( IN-CITY ?auto_2741 ?auto_2748 ) ( IN-CITY ?auto_2751 ?auto_2748 ) ( IN-CITY ?auto_2754 ?auto_2755 ) ( IN-CITY ?auto_2741 ?auto_2755 ) ( not ( = ?auto_2741 ?auto_2754 ) ) ( OBJ-AT ?auto_2734 ?auto_2754 ) ( TRUCK-AT ?auto_2740 ?auto_2752 ) ( IN-CITY ?auto_2752 ?auto_2753 ) ( IN-CITY ?auto_2754 ?auto_2753 ) ( not ( = ?auto_2754 ?auto_2752 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2734 ?auto_2736 ?auto_2737 ?auto_2738 ?auto_2741 )
      ( DELIVER-1PKG ?auto_2739 ?auto_2741 )
      ( DELIVER-5PKG-VERIFY ?auto_2734 ?auto_2736 ?auto_2737 ?auto_2738 ?auto_2739 ?auto_2741 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2791 - OBJ
      ?auto_2793 - OBJ
      ?auto_2794 - OBJ
      ?auto_2795 - OBJ
      ?auto_2796 - OBJ
      ?auto_2797 - OBJ
      ?auto_2804 - LOCATION
    )
    :vars
    (
      ?auto_2799 - LOCATION
      ?auto_2801 - CITY
      ?auto_2802 - CITY
      ?auto_2817 - LOCATION
      ?auto_2820 - CITY
      ?auto_2812 - CITY
      ?auto_2827 - LOCATION
      ?auto_2822 - CITY
      ?auto_2819 - CITY
      ?auto_2821 - LOCATION
      ?auto_2823 - CITY
      ?auto_2816 - CITY
      ?auto_2806 - LOCATION
      ?auto_2809 - CITY
      ?auto_2815 - CITY
      ?auto_2808 - LOCATION
      ?auto_2824 - CITY
      ?auto_2803 - TRUCK
      ?auto_2807 - LOCATION
      ?auto_2805 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2793 ?auto_2791 ) ( GREATER-THAN ?auto_2794 ?auto_2791 ) ( GREATER-THAN ?auto_2794 ?auto_2793 ) ( GREATER-THAN ?auto_2795 ?auto_2791 ) ( GREATER-THAN ?auto_2795 ?auto_2793 ) ( GREATER-THAN ?auto_2795 ?auto_2794 ) ( GREATER-THAN ?auto_2796 ?auto_2791 ) ( GREATER-THAN ?auto_2796 ?auto_2793 ) ( GREATER-THAN ?auto_2796 ?auto_2794 ) ( GREATER-THAN ?auto_2796 ?auto_2795 ) ( GREATER-THAN ?auto_2797 ?auto_2791 ) ( GREATER-THAN ?auto_2797 ?auto_2793 ) ( GREATER-THAN ?auto_2797 ?auto_2794 ) ( GREATER-THAN ?auto_2797 ?auto_2795 ) ( GREATER-THAN ?auto_2797 ?auto_2796 ) ( IN-CITY ?auto_2799 ?auto_2801 ) ( IN-CITY ?auto_2804 ?auto_2801 ) ( not ( = ?auto_2804 ?auto_2799 ) ) ( OBJ-AT ?auto_2797 ?auto_2799 ) ( IN-CITY ?auto_2804 ?auto_2802 ) ( IN-CITY ?auto_2799 ?auto_2802 ) ( IN-CITY ?auto_2817 ?auto_2820 ) ( IN-CITY ?auto_2804 ?auto_2820 ) ( not ( = ?auto_2804 ?auto_2817 ) ) ( OBJ-AT ?auto_2796 ?auto_2817 ) ( IN-CITY ?auto_2804 ?auto_2812 ) ( IN-CITY ?auto_2817 ?auto_2812 ) ( IN-CITY ?auto_2827 ?auto_2822 ) ( IN-CITY ?auto_2804 ?auto_2822 ) ( not ( = ?auto_2804 ?auto_2827 ) ) ( OBJ-AT ?auto_2795 ?auto_2827 ) ( IN-CITY ?auto_2804 ?auto_2819 ) ( IN-CITY ?auto_2827 ?auto_2819 ) ( IN-CITY ?auto_2821 ?auto_2823 ) ( IN-CITY ?auto_2804 ?auto_2823 ) ( not ( = ?auto_2804 ?auto_2821 ) ) ( OBJ-AT ?auto_2794 ?auto_2821 ) ( IN-CITY ?auto_2804 ?auto_2816 ) ( IN-CITY ?auto_2821 ?auto_2816 ) ( IN-CITY ?auto_2806 ?auto_2809 ) ( IN-CITY ?auto_2804 ?auto_2809 ) ( not ( = ?auto_2804 ?auto_2806 ) ) ( OBJ-AT ?auto_2793 ?auto_2806 ) ( IN-CITY ?auto_2804 ?auto_2815 ) ( IN-CITY ?auto_2806 ?auto_2815 ) ( IN-CITY ?auto_2808 ?auto_2824 ) ( IN-CITY ?auto_2804 ?auto_2824 ) ( not ( = ?auto_2804 ?auto_2808 ) ) ( OBJ-AT ?auto_2791 ?auto_2808 ) ( TRUCK-AT ?auto_2803 ?auto_2807 ) ( IN-CITY ?auto_2807 ?auto_2805 ) ( IN-CITY ?auto_2808 ?auto_2805 ) ( not ( = ?auto_2808 ?auto_2807 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2791 ?auto_2793 ?auto_2794 ?auto_2795 ?auto_2796 ?auto_2804 )
      ( DELIVER-1PKG ?auto_2797 ?auto_2804 )
      ( DELIVER-6PKG-VERIFY ?auto_2791 ?auto_2793 ?auto_2794 ?auto_2795 ?auto_2796 ?auto_2797 ?auto_2804 ) )
  )

)

