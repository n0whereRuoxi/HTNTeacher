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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2531 - OBJ
      ?auto_2532 - LOCATION
    )
    :vars
    (
      ?auto_2533 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2533 ?auto_2532 ) ( IN-TRUCK ?auto_2531 ?auto_2533 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2531 ?auto_2533 ?auto_2532 )
      ( DELIVER-1PKG-VERIFY ?auto_2531 ?auto_2532 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2538 - OBJ
      ?auto_2539 - LOCATION
    )
    :vars
    (
      ?auto_2540 - TRUCK
      ?auto_2544 - LOCATION
      ?auto_2545 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2538 ?auto_2540 ) ( TRUCK-AT ?auto_2540 ?auto_2544 ) ( IN-CITY ?auto_2544 ?auto_2545 ) ( IN-CITY ?auto_2539 ?auto_2545 ) ( not ( = ?auto_2539 ?auto_2544 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2540 ?auto_2544 ?auto_2539 ?auto_2545 )
      ( DELIVER-1PKG ?auto_2538 ?auto_2539 )
      ( DELIVER-1PKG-VERIFY ?auto_2538 ?auto_2539 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2549 - OBJ
      ?auto_2550 - LOCATION
    )
    :vars
    (
      ?auto_2553 - TRUCK
      ?auto_2551 - LOCATION
      ?auto_2552 - CITY
      ?auto_2557 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2553 ?auto_2551 ) ( IN-CITY ?auto_2551 ?auto_2552 ) ( IN-CITY ?auto_2550 ?auto_2552 ) ( not ( = ?auto_2550 ?auto_2551 ) ) ( TRUCK-AT ?auto_2553 ?auto_2557 ) ( OBJ-AT ?auto_2549 ?auto_2557 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2549 ?auto_2553 ?auto_2557 )
      ( DELIVER-1PKG ?auto_2549 ?auto_2550 )
      ( DELIVER-1PKG-VERIFY ?auto_2549 ?auto_2550 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2561 - OBJ
      ?auto_2562 - LOCATION
    )
    :vars
    (
      ?auto_2568 - LOCATION
      ?auto_2564 - CITY
      ?auto_2567 - TRUCK
      ?auto_2570 - LOCATION
      ?auto_2571 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2568 ?auto_2564 ) ( IN-CITY ?auto_2562 ?auto_2564 ) ( not ( = ?auto_2562 ?auto_2568 ) ) ( OBJ-AT ?auto_2561 ?auto_2568 ) ( TRUCK-AT ?auto_2567 ?auto_2570 ) ( IN-CITY ?auto_2570 ?auto_2571 ) ( IN-CITY ?auto_2568 ?auto_2571 ) ( not ( = ?auto_2568 ?auto_2570 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2567 ?auto_2570 ?auto_2568 ?auto_2571 )
      ( DELIVER-1PKG ?auto_2561 ?auto_2562 )
      ( DELIVER-1PKG-VERIFY ?auto_2561 ?auto_2562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2620 - OBJ
      ?auto_2622 - OBJ
      ?auto_2621 - LOCATION
    )
    :vars
    (
      ?auto_2625 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2622 ?auto_2620 ) ( TRUCK-AT ?auto_2625 ?auto_2621 ) ( IN-TRUCK ?auto_2622 ?auto_2625 ) ( OBJ-AT ?auto_2620 ?auto_2621 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2622 ?auto_2621 )
      ( DELIVER-2PKG-VERIFY ?auto_2620 ?auto_2622 ?auto_2621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2629 - OBJ
      ?auto_2631 - OBJ
      ?auto_2630 - LOCATION
    )
    :vars
    (
      ?auto_2635 - TRUCK
      ?auto_2632 - LOCATION
      ?auto_2633 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2631 ?auto_2629 ) ( IN-TRUCK ?auto_2631 ?auto_2635 ) ( TRUCK-AT ?auto_2635 ?auto_2632 ) ( IN-CITY ?auto_2632 ?auto_2633 ) ( IN-CITY ?auto_2630 ?auto_2633 ) ( not ( = ?auto_2630 ?auto_2632 ) ) ( OBJ-AT ?auto_2629 ?auto_2630 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2631 ?auto_2630 )
      ( DELIVER-2PKG-VERIFY ?auto_2629 ?auto_2631 ?auto_2630 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2640 - OBJ
      ?auto_2642 - OBJ
      ?auto_2641 - LOCATION
    )
    :vars
    (
      ?auto_2646 - TRUCK
      ?auto_2645 - LOCATION
      ?auto_2648 - CITY
      ?auto_2644 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2642 ?auto_2640 ) ( TRUCK-AT ?auto_2646 ?auto_2645 ) ( IN-CITY ?auto_2645 ?auto_2648 ) ( IN-CITY ?auto_2641 ?auto_2648 ) ( not ( = ?auto_2641 ?auto_2645 ) ) ( TRUCK-AT ?auto_2646 ?auto_2644 ) ( OBJ-AT ?auto_2642 ?auto_2644 ) ( OBJ-AT ?auto_2640 ?auto_2641 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2642 ?auto_2641 )
      ( DELIVER-2PKG-VERIFY ?auto_2640 ?auto_2642 ?auto_2641 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2652 - OBJ
      ?auto_2654 - OBJ
      ?auto_2653 - LOCATION
    )
    :vars
    (
      ?auto_2658 - LOCATION
      ?auto_2655 - CITY
      ?auto_2656 - TRUCK
      ?auto_2657 - LOCATION
      ?auto_2660 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2654 ?auto_2652 ) ( IN-CITY ?auto_2658 ?auto_2655 ) ( IN-CITY ?auto_2653 ?auto_2655 ) ( not ( = ?auto_2653 ?auto_2658 ) ) ( OBJ-AT ?auto_2654 ?auto_2658 ) ( TRUCK-AT ?auto_2656 ?auto_2657 ) ( IN-CITY ?auto_2657 ?auto_2660 ) ( IN-CITY ?auto_2658 ?auto_2660 ) ( not ( = ?auto_2658 ?auto_2657 ) ) ( OBJ-AT ?auto_2652 ?auto_2653 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2654 ?auto_2653 )
      ( DELIVER-2PKG-VERIFY ?auto_2652 ?auto_2654 ?auto_2653 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2672 - OBJ
      ?auto_2667 - OBJ
      ?auto_2666 - LOCATION
    )
    :vars
    (
      ?auto_2669 - LOCATION
      ?auto_2673 - CITY
      ?auto_2675 - TRUCK
      ?auto_2671 - LOCATION
      ?auto_2674 - CITY
      ?auto_2676 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2667 ?auto_2672 ) ( IN-CITY ?auto_2669 ?auto_2673 ) ( IN-CITY ?auto_2666 ?auto_2673 ) ( not ( = ?auto_2666 ?auto_2669 ) ) ( OBJ-AT ?auto_2667 ?auto_2669 ) ( TRUCK-AT ?auto_2675 ?auto_2671 ) ( IN-CITY ?auto_2671 ?auto_2674 ) ( IN-CITY ?auto_2669 ?auto_2674 ) ( not ( = ?auto_2669 ?auto_2671 ) ) ( TRUCK-AT ?auto_2676 ?auto_2666 ) ( IN-TRUCK ?auto_2672 ?auto_2676 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2672 ?auto_2666 )
      ( DELIVER-2PKG ?auto_2672 ?auto_2667 ?auto_2666 )
      ( DELIVER-2PKG-VERIFY ?auto_2672 ?auto_2667 ?auto_2666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2682 - OBJ
      ?auto_2684 - OBJ
      ?auto_2683 - LOCATION
    )
    :vars
    (
      ?auto_2685 - LOCATION
      ?auto_2689 - CITY
      ?auto_2688 - CITY
      ?auto_2686 - TRUCK
      ?auto_2695 - LOCATION
      ?auto_2696 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2684 ?auto_2682 ) ( IN-CITY ?auto_2685 ?auto_2689 ) ( IN-CITY ?auto_2683 ?auto_2689 ) ( not ( = ?auto_2683 ?auto_2685 ) ) ( OBJ-AT ?auto_2684 ?auto_2685 ) ( IN-CITY ?auto_2683 ?auto_2688 ) ( IN-CITY ?auto_2685 ?auto_2688 ) ( IN-TRUCK ?auto_2682 ?auto_2686 ) ( TRUCK-AT ?auto_2686 ?auto_2695 ) ( IN-CITY ?auto_2695 ?auto_2696 ) ( IN-CITY ?auto_2683 ?auto_2696 ) ( not ( = ?auto_2683 ?auto_2695 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2686 ?auto_2695 ?auto_2683 ?auto_2696 )
      ( DELIVER-2PKG ?auto_2682 ?auto_2684 ?auto_2683 )
      ( DELIVER-2PKG-VERIFY ?auto_2682 ?auto_2684 ?auto_2683 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2701 - OBJ
      ?auto_2703 - OBJ
      ?auto_2702 - LOCATION
    )
    :vars
    (
      ?auto_2704 - LOCATION
      ?auto_2710 - CITY
      ?auto_2707 - CITY
      ?auto_2706 - TRUCK
      ?auto_2711 - LOCATION
      ?auto_2712 - CITY
      ?auto_2714 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2703 ?auto_2701 ) ( IN-CITY ?auto_2704 ?auto_2710 ) ( IN-CITY ?auto_2702 ?auto_2710 ) ( not ( = ?auto_2702 ?auto_2704 ) ) ( OBJ-AT ?auto_2703 ?auto_2704 ) ( IN-CITY ?auto_2702 ?auto_2707 ) ( IN-CITY ?auto_2704 ?auto_2707 ) ( TRUCK-AT ?auto_2706 ?auto_2711 ) ( IN-CITY ?auto_2711 ?auto_2712 ) ( IN-CITY ?auto_2702 ?auto_2712 ) ( not ( = ?auto_2702 ?auto_2711 ) ) ( TRUCK-AT ?auto_2706 ?auto_2714 ) ( OBJ-AT ?auto_2701 ?auto_2714 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2701 ?auto_2706 ?auto_2714 )
      ( DELIVER-2PKG ?auto_2701 ?auto_2703 ?auto_2702 )
      ( DELIVER-2PKG-VERIFY ?auto_2701 ?auto_2703 ?auto_2702 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2719 - OBJ
      ?auto_2721 - OBJ
      ?auto_2720 - LOCATION
    )
    :vars
    (
      ?auto_2730 - LOCATION
      ?auto_2723 - CITY
      ?auto_2731 - CITY
      ?auto_2728 - LOCATION
      ?auto_2727 - CITY
      ?auto_2724 - TRUCK
      ?auto_2733 - LOCATION
      ?auto_2734 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2721 ?auto_2719 ) ( IN-CITY ?auto_2730 ?auto_2723 ) ( IN-CITY ?auto_2720 ?auto_2723 ) ( not ( = ?auto_2720 ?auto_2730 ) ) ( OBJ-AT ?auto_2721 ?auto_2730 ) ( IN-CITY ?auto_2720 ?auto_2731 ) ( IN-CITY ?auto_2730 ?auto_2731 ) ( IN-CITY ?auto_2728 ?auto_2727 ) ( IN-CITY ?auto_2720 ?auto_2727 ) ( not ( = ?auto_2720 ?auto_2728 ) ) ( OBJ-AT ?auto_2719 ?auto_2728 ) ( TRUCK-AT ?auto_2724 ?auto_2733 ) ( IN-CITY ?auto_2733 ?auto_2734 ) ( IN-CITY ?auto_2728 ?auto_2734 ) ( not ( = ?auto_2728 ?auto_2733 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2724 ?auto_2733 ?auto_2728 ?auto_2734 )
      ( DELIVER-2PKG ?auto_2719 ?auto_2721 ?auto_2720 )
      ( DELIVER-2PKG-VERIFY ?auto_2719 ?auto_2721 ?auto_2720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2784 - OBJ
      ?auto_2786 - OBJ
      ?auto_2787 - OBJ
      ?auto_2785 - LOCATION
    )
    :vars
    (
      ?auto_2789 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2786 ?auto_2784 ) ( GREATER-THAN ?auto_2787 ?auto_2784 ) ( GREATER-THAN ?auto_2787 ?auto_2786 ) ( TRUCK-AT ?auto_2789 ?auto_2785 ) ( IN-TRUCK ?auto_2787 ?auto_2789 ) ( OBJ-AT ?auto_2784 ?auto_2785 ) ( OBJ-AT ?auto_2786 ?auto_2785 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2787 ?auto_2785 )
      ( DELIVER-3PKG-VERIFY ?auto_2784 ?auto_2786 ?auto_2787 ?auto_2785 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2795 - OBJ
      ?auto_2797 - OBJ
      ?auto_2798 - OBJ
      ?auto_2796 - LOCATION
    )
    :vars
    (
      ?auto_2802 - TRUCK
      ?auto_2801 - LOCATION
      ?auto_2799 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2797 ?auto_2795 ) ( GREATER-THAN ?auto_2798 ?auto_2795 ) ( GREATER-THAN ?auto_2798 ?auto_2797 ) ( IN-TRUCK ?auto_2798 ?auto_2802 ) ( TRUCK-AT ?auto_2802 ?auto_2801 ) ( IN-CITY ?auto_2801 ?auto_2799 ) ( IN-CITY ?auto_2796 ?auto_2799 ) ( not ( = ?auto_2796 ?auto_2801 ) ) ( OBJ-AT ?auto_2795 ?auto_2796 ) ( OBJ-AT ?auto_2797 ?auto_2796 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2798 ?auto_2796 )
      ( DELIVER-3PKG-VERIFY ?auto_2795 ?auto_2797 ?auto_2798 ?auto_2796 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2808 - OBJ
      ?auto_2810 - OBJ
      ?auto_2811 - OBJ
      ?auto_2809 - LOCATION
    )
    :vars
    (
      ?auto_2816 - TRUCK
      ?auto_2813 - LOCATION
      ?auto_2815 - CITY
      ?auto_2812 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2810 ?auto_2808 ) ( GREATER-THAN ?auto_2811 ?auto_2808 ) ( GREATER-THAN ?auto_2811 ?auto_2810 ) ( TRUCK-AT ?auto_2816 ?auto_2813 ) ( IN-CITY ?auto_2813 ?auto_2815 ) ( IN-CITY ?auto_2809 ?auto_2815 ) ( not ( = ?auto_2809 ?auto_2813 ) ) ( TRUCK-AT ?auto_2816 ?auto_2812 ) ( OBJ-AT ?auto_2811 ?auto_2812 ) ( OBJ-AT ?auto_2808 ?auto_2809 ) ( OBJ-AT ?auto_2810 ?auto_2809 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2811 ?auto_2809 )
      ( DELIVER-3PKG-VERIFY ?auto_2808 ?auto_2810 ?auto_2811 ?auto_2809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2822 - OBJ
      ?auto_2824 - OBJ
      ?auto_2825 - OBJ
      ?auto_2823 - LOCATION
    )
    :vars
    (
      ?auto_2828 - LOCATION
      ?auto_2830 - CITY
      ?auto_2831 - TRUCK
      ?auto_2827 - LOCATION
      ?auto_2829 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2824 ?auto_2822 ) ( GREATER-THAN ?auto_2825 ?auto_2822 ) ( GREATER-THAN ?auto_2825 ?auto_2824 ) ( IN-CITY ?auto_2828 ?auto_2830 ) ( IN-CITY ?auto_2823 ?auto_2830 ) ( not ( = ?auto_2823 ?auto_2828 ) ) ( OBJ-AT ?auto_2825 ?auto_2828 ) ( TRUCK-AT ?auto_2831 ?auto_2827 ) ( IN-CITY ?auto_2827 ?auto_2829 ) ( IN-CITY ?auto_2828 ?auto_2829 ) ( not ( = ?auto_2828 ?auto_2827 ) ) ( OBJ-AT ?auto_2822 ?auto_2823 ) ( OBJ-AT ?auto_2824 ?auto_2823 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2825 ?auto_2823 )
      ( DELIVER-3PKG-VERIFY ?auto_2822 ?auto_2824 ?auto_2825 ?auto_2823 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2837 - OBJ
      ?auto_2845 - OBJ
      ?auto_2840 - OBJ
      ?auto_2838 - LOCATION
    )
    :vars
    (
      ?auto_2848 - OBJ
      ?auto_2847 - LOCATION
      ?auto_2842 - CITY
      ?auto_2843 - TRUCK
      ?auto_2846 - LOCATION
      ?auto_2844 - CITY
      ?auto_2852 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2845 ?auto_2837 ) ( GREATER-THAN ?auto_2840 ?auto_2837 ) ( GREATER-THAN ?auto_2840 ?auto_2845 ) ( GREATER-THAN ?auto_2845 ?auto_2848 ) ( GREATER-THAN ?auto_2840 ?auto_2848 ) ( IN-CITY ?auto_2847 ?auto_2842 ) ( IN-CITY ?auto_2838 ?auto_2842 ) ( not ( = ?auto_2838 ?auto_2847 ) ) ( OBJ-AT ?auto_2840 ?auto_2847 ) ( TRUCK-AT ?auto_2843 ?auto_2846 ) ( IN-CITY ?auto_2846 ?auto_2844 ) ( IN-CITY ?auto_2847 ?auto_2844 ) ( not ( = ?auto_2847 ?auto_2846 ) ) ( OBJ-AT ?auto_2848 ?auto_2838 ) ( TRUCK-AT ?auto_2852 ?auto_2838 ) ( IN-TRUCK ?auto_2845 ?auto_2852 ) ( OBJ-AT ?auto_2837 ?auto_2838 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2845 ?auto_2838 )
      ( DELIVER-3PKG ?auto_2848 ?auto_2845 ?auto_2840 ?auto_2838 )
      ( DELIVER-3PKG-VERIFY ?auto_2837 ?auto_2845 ?auto_2840 ?auto_2838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2857 - OBJ
      ?auto_2859 - OBJ
      ?auto_2860 - OBJ
      ?auto_2858 - LOCATION
    )
    :vars
    (
      ?auto_2871 - OBJ
      ?auto_2863 - OBJ
      ?auto_2866 - LOCATION
      ?auto_2868 - CITY
      ?auto_2864 - CITY
      ?auto_2869 - TRUCK
      ?auto_2873 - LOCATION
      ?auto_2874 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2859 ?auto_2857 ) ( GREATER-THAN ?auto_2860 ?auto_2857 ) ( GREATER-THAN ?auto_2860 ?auto_2859 ) ( GREATER-THAN ?auto_2859 ?auto_2871 ) ( GREATER-THAN ?auto_2860 ?auto_2871 ) ( GREATER-THAN ?auto_2859 ?auto_2863 ) ( GREATER-THAN ?auto_2860 ?auto_2863 ) ( IN-CITY ?auto_2866 ?auto_2868 ) ( IN-CITY ?auto_2858 ?auto_2868 ) ( not ( = ?auto_2858 ?auto_2866 ) ) ( OBJ-AT ?auto_2860 ?auto_2866 ) ( IN-CITY ?auto_2858 ?auto_2864 ) ( IN-CITY ?auto_2866 ?auto_2864 ) ( OBJ-AT ?auto_2863 ?auto_2858 ) ( IN-TRUCK ?auto_2859 ?auto_2869 ) ( OBJ-AT ?auto_2871 ?auto_2858 ) ( TRUCK-AT ?auto_2869 ?auto_2873 ) ( IN-CITY ?auto_2873 ?auto_2874 ) ( IN-CITY ?auto_2858 ?auto_2874 ) ( not ( = ?auto_2858 ?auto_2873 ) ) ( OBJ-AT ?auto_2857 ?auto_2858 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2869 ?auto_2873 ?auto_2858 ?auto_2874 )
      ( DELIVER-3PKG ?auto_2871 ?auto_2859 ?auto_2860 ?auto_2858 )
      ( DELIVER-3PKG-VERIFY ?auto_2857 ?auto_2859 ?auto_2860 ?auto_2858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2880 - OBJ
      ?auto_2882 - OBJ
      ?auto_2883 - OBJ
      ?auto_2881 - LOCATION
    )
    :vars
    (
      ?auto_2892 - OBJ
      ?auto_2894 - OBJ
      ?auto_2885 - OBJ
      ?auto_2884 - LOCATION
      ?auto_2890 - CITY
      ?auto_2895 - CITY
      ?auto_2888 - TRUCK
      ?auto_2893 - LOCATION
      ?auto_2891 - CITY
      ?auto_2897 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2882 ?auto_2880 ) ( GREATER-THAN ?auto_2883 ?auto_2880 ) ( GREATER-THAN ?auto_2883 ?auto_2882 ) ( GREATER-THAN ?auto_2882 ?auto_2892 ) ( GREATER-THAN ?auto_2883 ?auto_2892 ) ( GREATER-THAN ?auto_2882 ?auto_2894 ) ( GREATER-THAN ?auto_2883 ?auto_2894 ) ( GREATER-THAN ?auto_2882 ?auto_2885 ) ( GREATER-THAN ?auto_2883 ?auto_2885 ) ( IN-CITY ?auto_2884 ?auto_2890 ) ( IN-CITY ?auto_2881 ?auto_2890 ) ( not ( = ?auto_2881 ?auto_2884 ) ) ( OBJ-AT ?auto_2883 ?auto_2884 ) ( IN-CITY ?auto_2881 ?auto_2895 ) ( IN-CITY ?auto_2884 ?auto_2895 ) ( OBJ-AT ?auto_2885 ?auto_2881 ) ( OBJ-AT ?auto_2894 ?auto_2881 ) ( TRUCK-AT ?auto_2888 ?auto_2893 ) ( IN-CITY ?auto_2893 ?auto_2891 ) ( IN-CITY ?auto_2881 ?auto_2891 ) ( not ( = ?auto_2881 ?auto_2893 ) ) ( OBJ-AT ?auto_2892 ?auto_2881 ) ( TRUCK-AT ?auto_2888 ?auto_2897 ) ( OBJ-AT ?auto_2882 ?auto_2897 ) ( OBJ-AT ?auto_2880 ?auto_2881 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2882 ?auto_2888 ?auto_2897 )
      ( DELIVER-3PKG ?auto_2892 ?auto_2882 ?auto_2883 ?auto_2881 )
      ( DELIVER-3PKG-VERIFY ?auto_2880 ?auto_2882 ?auto_2883 ?auto_2881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2903 - OBJ
      ?auto_2905 - OBJ
      ?auto_2906 - OBJ
      ?auto_2904 - LOCATION
    )
    :vars
    (
      ?auto_2920 - OBJ
      ?auto_2908 - OBJ
      ?auto_2918 - OBJ
      ?auto_2911 - OBJ
      ?auto_2914 - LOCATION
      ?auto_2913 - CITY
      ?auto_2917 - CITY
      ?auto_2919 - LOCATION
      ?auto_2912 - CITY
      ?auto_2909 - TRUCK
      ?auto_2922 - LOCATION
      ?auto_2923 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2905 ?auto_2903 ) ( GREATER-THAN ?auto_2906 ?auto_2903 ) ( GREATER-THAN ?auto_2906 ?auto_2905 ) ( GREATER-THAN ?auto_2905 ?auto_2920 ) ( GREATER-THAN ?auto_2906 ?auto_2920 ) ( GREATER-THAN ?auto_2905 ?auto_2908 ) ( GREATER-THAN ?auto_2906 ?auto_2908 ) ( GREATER-THAN ?auto_2905 ?auto_2918 ) ( GREATER-THAN ?auto_2906 ?auto_2918 ) ( GREATER-THAN ?auto_2905 ?auto_2911 ) ( GREATER-THAN ?auto_2906 ?auto_2911 ) ( IN-CITY ?auto_2914 ?auto_2913 ) ( IN-CITY ?auto_2904 ?auto_2913 ) ( not ( = ?auto_2904 ?auto_2914 ) ) ( OBJ-AT ?auto_2906 ?auto_2914 ) ( IN-CITY ?auto_2904 ?auto_2917 ) ( IN-CITY ?auto_2914 ?auto_2917 ) ( OBJ-AT ?auto_2911 ?auto_2904 ) ( OBJ-AT ?auto_2918 ?auto_2904 ) ( IN-CITY ?auto_2919 ?auto_2912 ) ( IN-CITY ?auto_2904 ?auto_2912 ) ( not ( = ?auto_2904 ?auto_2919 ) ) ( OBJ-AT ?auto_2908 ?auto_2904 ) ( OBJ-AT ?auto_2905 ?auto_2919 ) ( OBJ-AT ?auto_2920 ?auto_2904 ) ( TRUCK-AT ?auto_2909 ?auto_2922 ) ( IN-CITY ?auto_2922 ?auto_2923 ) ( IN-CITY ?auto_2919 ?auto_2923 ) ( not ( = ?auto_2919 ?auto_2922 ) ) ( OBJ-AT ?auto_2903 ?auto_2904 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2909 ?auto_2922 ?auto_2919 ?auto_2923 )
      ( DELIVER-3PKG ?auto_2920 ?auto_2905 ?auto_2906 ?auto_2904 )
      ( DELIVER-3PKG-VERIFY ?auto_2903 ?auto_2905 ?auto_2906 ?auto_2904 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2946 - OBJ
      ?auto_2931 - OBJ
      ?auto_2932 - OBJ
      ?auto_2930 - LOCATION
    )
    :vars
    (
      ?auto_2939 - LOCATION
      ?auto_2937 - CITY
      ?auto_2938 - CITY
      ?auto_2941 - LOCATION
      ?auto_2943 - CITY
      ?auto_2934 - TRUCK
      ?auto_2945 - LOCATION
      ?auto_2944 - CITY
      ?auto_2949 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2931 ?auto_2946 ) ( GREATER-THAN ?auto_2932 ?auto_2946 ) ( GREATER-THAN ?auto_2932 ?auto_2931 ) ( IN-CITY ?auto_2939 ?auto_2937 ) ( IN-CITY ?auto_2930 ?auto_2937 ) ( not ( = ?auto_2930 ?auto_2939 ) ) ( OBJ-AT ?auto_2932 ?auto_2939 ) ( IN-CITY ?auto_2930 ?auto_2938 ) ( IN-CITY ?auto_2939 ?auto_2938 ) ( IN-CITY ?auto_2941 ?auto_2943 ) ( IN-CITY ?auto_2930 ?auto_2943 ) ( not ( = ?auto_2930 ?auto_2941 ) ) ( OBJ-AT ?auto_2931 ?auto_2941 ) ( TRUCK-AT ?auto_2934 ?auto_2945 ) ( IN-CITY ?auto_2945 ?auto_2944 ) ( IN-CITY ?auto_2941 ?auto_2944 ) ( not ( = ?auto_2941 ?auto_2945 ) ) ( TRUCK-AT ?auto_2949 ?auto_2930 ) ( IN-TRUCK ?auto_2946 ?auto_2949 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2946 ?auto_2930 )
      ( DELIVER-3PKG ?auto_2946 ?auto_2931 ?auto_2932 ?auto_2930 )
      ( DELIVER-3PKG-VERIFY ?auto_2946 ?auto_2931 ?auto_2932 ?auto_2930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2956 - OBJ
      ?auto_2958 - OBJ
      ?auto_2959 - OBJ
      ?auto_2957 - LOCATION
    )
    :vars
    (
      ?auto_2969 - LOCATION
      ?auto_2962 - CITY
      ?auto_2967 - CITY
      ?auto_2963 - LOCATION
      ?auto_2966 - CITY
      ?auto_2964 - CITY
      ?auto_2968 - TRUCK
      ?auto_2974 - LOCATION
      ?auto_2975 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2958 ?auto_2956 ) ( GREATER-THAN ?auto_2959 ?auto_2956 ) ( GREATER-THAN ?auto_2959 ?auto_2958 ) ( IN-CITY ?auto_2969 ?auto_2962 ) ( IN-CITY ?auto_2957 ?auto_2962 ) ( not ( = ?auto_2957 ?auto_2969 ) ) ( OBJ-AT ?auto_2959 ?auto_2969 ) ( IN-CITY ?auto_2957 ?auto_2967 ) ( IN-CITY ?auto_2969 ?auto_2967 ) ( IN-CITY ?auto_2963 ?auto_2966 ) ( IN-CITY ?auto_2957 ?auto_2966 ) ( not ( = ?auto_2957 ?auto_2963 ) ) ( OBJ-AT ?auto_2958 ?auto_2963 ) ( IN-CITY ?auto_2957 ?auto_2964 ) ( IN-CITY ?auto_2963 ?auto_2964 ) ( IN-TRUCK ?auto_2956 ?auto_2968 ) ( TRUCK-AT ?auto_2968 ?auto_2974 ) ( IN-CITY ?auto_2974 ?auto_2975 ) ( IN-CITY ?auto_2957 ?auto_2975 ) ( not ( = ?auto_2957 ?auto_2974 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2968 ?auto_2974 ?auto_2957 ?auto_2975 )
      ( DELIVER-3PKG ?auto_2956 ?auto_2958 ?auto_2959 ?auto_2957 )
      ( DELIVER-3PKG-VERIFY ?auto_2956 ?auto_2958 ?auto_2959 ?auto_2957 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2981 - OBJ
      ?auto_2983 - OBJ
      ?auto_2984 - OBJ
      ?auto_2982 - LOCATION
    )
    :vars
    (
      ?auto_2995 - LOCATION
      ?auto_2988 - CITY
      ?auto_2987 - CITY
      ?auto_2993 - LOCATION
      ?auto_2990 - CITY
      ?auto_2992 - CITY
      ?auto_2996 - TRUCK
      ?auto_2997 - LOCATION
      ?auto_2985 - CITY
      ?auto_2999 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2983 ?auto_2981 ) ( GREATER-THAN ?auto_2984 ?auto_2981 ) ( GREATER-THAN ?auto_2984 ?auto_2983 ) ( IN-CITY ?auto_2995 ?auto_2988 ) ( IN-CITY ?auto_2982 ?auto_2988 ) ( not ( = ?auto_2982 ?auto_2995 ) ) ( OBJ-AT ?auto_2984 ?auto_2995 ) ( IN-CITY ?auto_2982 ?auto_2987 ) ( IN-CITY ?auto_2995 ?auto_2987 ) ( IN-CITY ?auto_2993 ?auto_2990 ) ( IN-CITY ?auto_2982 ?auto_2990 ) ( not ( = ?auto_2982 ?auto_2993 ) ) ( OBJ-AT ?auto_2983 ?auto_2993 ) ( IN-CITY ?auto_2982 ?auto_2992 ) ( IN-CITY ?auto_2993 ?auto_2992 ) ( TRUCK-AT ?auto_2996 ?auto_2997 ) ( IN-CITY ?auto_2997 ?auto_2985 ) ( IN-CITY ?auto_2982 ?auto_2985 ) ( not ( = ?auto_2982 ?auto_2997 ) ) ( TRUCK-AT ?auto_2996 ?auto_2999 ) ( OBJ-AT ?auto_2981 ?auto_2999 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2981 ?auto_2996 ?auto_2999 )
      ( DELIVER-3PKG ?auto_2981 ?auto_2983 ?auto_2984 ?auto_2982 )
      ( DELIVER-3PKG-VERIFY ?auto_2981 ?auto_2983 ?auto_2984 ?auto_2982 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3005 - OBJ
      ?auto_3007 - OBJ
      ?auto_3008 - OBJ
      ?auto_3006 - LOCATION
    )
    :vars
    (
      ?auto_3011 - LOCATION
      ?auto_3009 - CITY
      ?auto_3012 - CITY
      ?auto_3022 - LOCATION
      ?auto_3014 - CITY
      ?auto_3010 - CITY
      ?auto_3018 - LOCATION
      ?auto_3016 - CITY
      ?auto_3013 - TRUCK
      ?auto_3024 - LOCATION
      ?auto_3025 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3007 ?auto_3005 ) ( GREATER-THAN ?auto_3008 ?auto_3005 ) ( GREATER-THAN ?auto_3008 ?auto_3007 ) ( IN-CITY ?auto_3011 ?auto_3009 ) ( IN-CITY ?auto_3006 ?auto_3009 ) ( not ( = ?auto_3006 ?auto_3011 ) ) ( OBJ-AT ?auto_3008 ?auto_3011 ) ( IN-CITY ?auto_3006 ?auto_3012 ) ( IN-CITY ?auto_3011 ?auto_3012 ) ( IN-CITY ?auto_3022 ?auto_3014 ) ( IN-CITY ?auto_3006 ?auto_3014 ) ( not ( = ?auto_3006 ?auto_3022 ) ) ( OBJ-AT ?auto_3007 ?auto_3022 ) ( IN-CITY ?auto_3006 ?auto_3010 ) ( IN-CITY ?auto_3022 ?auto_3010 ) ( IN-CITY ?auto_3018 ?auto_3016 ) ( IN-CITY ?auto_3006 ?auto_3016 ) ( not ( = ?auto_3006 ?auto_3018 ) ) ( OBJ-AT ?auto_3005 ?auto_3018 ) ( TRUCK-AT ?auto_3013 ?auto_3024 ) ( IN-CITY ?auto_3024 ?auto_3025 ) ( IN-CITY ?auto_3018 ?auto_3025 ) ( not ( = ?auto_3018 ?auto_3024 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3013 ?auto_3024 ?auto_3018 ?auto_3025 )
      ( DELIVER-3PKG ?auto_3005 ?auto_3007 ?auto_3008 ?auto_3006 )
      ( DELIVER-3PKG-VERIFY ?auto_3005 ?auto_3007 ?auto_3008 ?auto_3006 ) )
  )

)

