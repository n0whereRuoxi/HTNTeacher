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
      ?auto_2692 - OBJ
      ?auto_2693 - LOCATION
    )
    :vars
    (
      ?auto_2694 - TRUCK
      ?auto_2695 - LOCATION
      ?auto_2696 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2694 ?auto_2695 ) ( IN-CITY ?auto_2695 ?auto_2696 ) ( IN-CITY ?auto_2693 ?auto_2696 ) ( not ( = ?auto_2693 ?auto_2695 ) ) ( OBJ-AT ?auto_2692 ?auto_2695 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2692 ?auto_2694 ?auto_2695 )
      ( !DRIVE-TRUCK ?auto_2694 ?auto_2695 ?auto_2693 ?auto_2696 )
      ( !UNLOAD-TRUCK ?auto_2692 ?auto_2694 ?auto_2693 )
      ( DELIVER-1PKG-VERIFY ?auto_2692 ?auto_2693 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2699 - OBJ
      ?auto_2700 - LOCATION
    )
    :vars
    (
      ?auto_2701 - LOCATION
      ?auto_2703 - CITY
      ?auto_2702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2701 ?auto_2703 ) ( IN-CITY ?auto_2700 ?auto_2703 ) ( not ( = ?auto_2700 ?auto_2701 ) ) ( OBJ-AT ?auto_2699 ?auto_2701 ) ( TRUCK-AT ?auto_2702 ?auto_2700 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2702 ?auto_2700 ?auto_2701 ?auto_2703 )
      ( DELIVER-1PKG ?auto_2699 ?auto_2700 )
      ( DELIVER-1PKG-VERIFY ?auto_2699 ?auto_2700 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2706 - OBJ
      ?auto_2707 - LOCATION
    )
    :vars
    (
      ?auto_2708 - TRUCK
      ?auto_2709 - LOCATION
      ?auto_2710 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2708 ?auto_2709 ) ( IN-CITY ?auto_2709 ?auto_2710 ) ( IN-CITY ?auto_2707 ?auto_2710 ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( OBJ-AT ?auto_2706 ?auto_2709 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2706 ?auto_2708 ?auto_2709 )
      ( !DRIVE-TRUCK ?auto_2708 ?auto_2709 ?auto_2707 ?auto_2710 )
      ( !UNLOAD-TRUCK ?auto_2706 ?auto_2708 ?auto_2707 )
      ( DELIVER-1PKG-VERIFY ?auto_2706 ?auto_2707 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2713 - OBJ
      ?auto_2714 - LOCATION
    )
    :vars
    (
      ?auto_2715 - LOCATION
      ?auto_2716 - CITY
      ?auto_2717 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2715 ?auto_2716 ) ( IN-CITY ?auto_2714 ?auto_2716 ) ( not ( = ?auto_2714 ?auto_2715 ) ) ( OBJ-AT ?auto_2713 ?auto_2715 ) ( TRUCK-AT ?auto_2717 ?auto_2714 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2717 ?auto_2714 ?auto_2715 ?auto_2716 )
      ( DELIVER-1PKG ?auto_2713 ?auto_2714 )
      ( DELIVER-1PKG-VERIFY ?auto_2713 ?auto_2714 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2721 - OBJ
      ?auto_2723 - OBJ
      ?auto_2722 - LOCATION
    )
    :vars
    (
      ?auto_2724 - LOCATION
      ?auto_2725 - CITY
      ?auto_2726 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2723 ?auto_2721 ) ( IN-CITY ?auto_2724 ?auto_2725 ) ( IN-CITY ?auto_2722 ?auto_2725 ) ( not ( = ?auto_2722 ?auto_2724 ) ) ( OBJ-AT ?auto_2723 ?auto_2724 ) ( TRUCK-AT ?auto_2726 ?auto_2724 ) ( OBJ-AT ?auto_2721 ?auto_2724 ) ( not ( = ?auto_2721 ?auto_2723 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2721 ?auto_2722 )
      ( DELIVER-1PKG ?auto_2723 ?auto_2722 )
      ( DELIVER-2PKG-VERIFY ?auto_2721 ?auto_2723 ?auto_2722 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2730 - OBJ
      ?auto_2732 - OBJ
      ?auto_2731 - LOCATION
    )
    :vars
    (
      ?auto_2735 - LOCATION
      ?auto_2733 - CITY
      ?auto_2734 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2732 ?auto_2730 ) ( IN-CITY ?auto_2735 ?auto_2733 ) ( IN-CITY ?auto_2731 ?auto_2733 ) ( not ( = ?auto_2731 ?auto_2735 ) ) ( OBJ-AT ?auto_2732 ?auto_2735 ) ( OBJ-AT ?auto_2730 ?auto_2735 ) ( not ( = ?auto_2730 ?auto_2732 ) ) ( TRUCK-AT ?auto_2734 ?auto_2731 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2734 ?auto_2731 ?auto_2735 ?auto_2733 )
      ( DELIVER-2PKG ?auto_2730 ?auto_2732 ?auto_2731 )
      ( DELIVER-2PKG-VERIFY ?auto_2730 ?auto_2732 ?auto_2731 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2738 - OBJ
      ?auto_2739 - LOCATION
    )
    :vars
    (
      ?auto_2740 - TRUCK
      ?auto_2741 - LOCATION
      ?auto_2742 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2740 ?auto_2741 ) ( IN-CITY ?auto_2741 ?auto_2742 ) ( IN-CITY ?auto_2739 ?auto_2742 ) ( not ( = ?auto_2739 ?auto_2741 ) ) ( OBJ-AT ?auto_2738 ?auto_2741 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2738 ?auto_2740 ?auto_2741 )
      ( !DRIVE-TRUCK ?auto_2740 ?auto_2741 ?auto_2739 ?auto_2742 )
      ( !UNLOAD-TRUCK ?auto_2738 ?auto_2740 ?auto_2739 )
      ( DELIVER-1PKG-VERIFY ?auto_2738 ?auto_2739 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2745 - OBJ
      ?auto_2746 - LOCATION
    )
    :vars
    (
      ?auto_2748 - LOCATION
      ?auto_2749 - CITY
      ?auto_2747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2748 ?auto_2749 ) ( IN-CITY ?auto_2746 ?auto_2749 ) ( not ( = ?auto_2746 ?auto_2748 ) ) ( OBJ-AT ?auto_2745 ?auto_2748 ) ( TRUCK-AT ?auto_2747 ?auto_2746 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2747 ?auto_2746 ?auto_2748 ?auto_2749 )
      ( DELIVER-1PKG ?auto_2745 ?auto_2746 )
      ( DELIVER-1PKG-VERIFY ?auto_2745 ?auto_2746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2754 - OBJ
      ?auto_2756 - OBJ
      ?auto_2757 - OBJ
      ?auto_2755 - LOCATION
    )
    :vars
    (
      ?auto_2759 - LOCATION
      ?auto_2760 - CITY
      ?auto_2761 - LOCATION
      ?auto_2758 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2756 ?auto_2754 ) ( GREATER-THAN ?auto_2757 ?auto_2754 ) ( GREATER-THAN ?auto_2757 ?auto_2756 ) ( IN-CITY ?auto_2759 ?auto_2760 ) ( IN-CITY ?auto_2755 ?auto_2760 ) ( not ( = ?auto_2755 ?auto_2759 ) ) ( OBJ-AT ?auto_2757 ?auto_2759 ) ( IN-CITY ?auto_2761 ?auto_2760 ) ( not ( = ?auto_2755 ?auto_2761 ) ) ( OBJ-AT ?auto_2756 ?auto_2761 ) ( TRUCK-AT ?auto_2758 ?auto_2761 ) ( OBJ-AT ?auto_2754 ?auto_2761 ) ( not ( = ?auto_2754 ?auto_2756 ) ) ( not ( = ?auto_2754 ?auto_2757 ) ) ( not ( = ?auto_2756 ?auto_2757 ) ) ( not ( = ?auto_2759 ?auto_2761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2754 ?auto_2756 ?auto_2755 )
      ( DELIVER-1PKG ?auto_2757 ?auto_2755 )
      ( DELIVER-3PKG-VERIFY ?auto_2754 ?auto_2756 ?auto_2757 ?auto_2755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2766 - OBJ
      ?auto_2768 - OBJ
      ?auto_2769 - OBJ
      ?auto_2767 - LOCATION
    )
    :vars
    (
      ?auto_2771 - LOCATION
      ?auto_2770 - CITY
      ?auto_2773 - LOCATION
      ?auto_2772 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2768 ?auto_2766 ) ( GREATER-THAN ?auto_2769 ?auto_2766 ) ( GREATER-THAN ?auto_2769 ?auto_2768 ) ( IN-CITY ?auto_2771 ?auto_2770 ) ( IN-CITY ?auto_2767 ?auto_2770 ) ( not ( = ?auto_2767 ?auto_2771 ) ) ( OBJ-AT ?auto_2769 ?auto_2771 ) ( IN-CITY ?auto_2773 ?auto_2770 ) ( not ( = ?auto_2767 ?auto_2773 ) ) ( OBJ-AT ?auto_2768 ?auto_2773 ) ( OBJ-AT ?auto_2766 ?auto_2773 ) ( not ( = ?auto_2766 ?auto_2768 ) ) ( not ( = ?auto_2766 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2769 ) ) ( not ( = ?auto_2771 ?auto_2773 ) ) ( TRUCK-AT ?auto_2772 ?auto_2767 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2772 ?auto_2767 ?auto_2773 ?auto_2770 )
      ( DELIVER-3PKG ?auto_2766 ?auto_2768 ?auto_2769 ?auto_2767 )
      ( DELIVER-3PKG-VERIFY ?auto_2766 ?auto_2768 ?auto_2769 ?auto_2767 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2776 - OBJ
      ?auto_2777 - LOCATION
    )
    :vars
    (
      ?auto_2778 - TRUCK
      ?auto_2779 - LOCATION
      ?auto_2780 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2778 ?auto_2779 ) ( IN-CITY ?auto_2779 ?auto_2780 ) ( IN-CITY ?auto_2777 ?auto_2780 ) ( not ( = ?auto_2777 ?auto_2779 ) ) ( OBJ-AT ?auto_2776 ?auto_2779 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2776 ?auto_2778 ?auto_2779 )
      ( !DRIVE-TRUCK ?auto_2778 ?auto_2779 ?auto_2777 ?auto_2780 )
      ( !UNLOAD-TRUCK ?auto_2776 ?auto_2778 ?auto_2777 )
      ( DELIVER-1PKG-VERIFY ?auto_2776 ?auto_2777 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2783 - OBJ
      ?auto_2784 - LOCATION
    )
    :vars
    (
      ?auto_2786 - LOCATION
      ?auto_2785 - CITY
      ?auto_2787 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2786 ?auto_2785 ) ( IN-CITY ?auto_2784 ?auto_2785 ) ( not ( = ?auto_2784 ?auto_2786 ) ) ( OBJ-AT ?auto_2783 ?auto_2786 ) ( TRUCK-AT ?auto_2787 ?auto_2784 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2787 ?auto_2784 ?auto_2786 ?auto_2785 )
      ( DELIVER-1PKG ?auto_2783 ?auto_2784 )
      ( DELIVER-1PKG-VERIFY ?auto_2783 ?auto_2784 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2793 - OBJ
      ?auto_2795 - OBJ
      ?auto_2796 - OBJ
      ?auto_2797 - OBJ
      ?auto_2794 - LOCATION
    )
    :vars
    (
      ?auto_2799 - LOCATION
      ?auto_2798 - CITY
      ?auto_2801 - LOCATION
      ?auto_2802 - LOCATION
      ?auto_2800 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2795 ?auto_2793 ) ( GREATER-THAN ?auto_2796 ?auto_2793 ) ( GREATER-THAN ?auto_2796 ?auto_2795 ) ( GREATER-THAN ?auto_2797 ?auto_2793 ) ( GREATER-THAN ?auto_2797 ?auto_2795 ) ( GREATER-THAN ?auto_2797 ?auto_2796 ) ( IN-CITY ?auto_2799 ?auto_2798 ) ( IN-CITY ?auto_2794 ?auto_2798 ) ( not ( = ?auto_2794 ?auto_2799 ) ) ( OBJ-AT ?auto_2797 ?auto_2799 ) ( IN-CITY ?auto_2801 ?auto_2798 ) ( not ( = ?auto_2794 ?auto_2801 ) ) ( OBJ-AT ?auto_2796 ?auto_2801 ) ( IN-CITY ?auto_2802 ?auto_2798 ) ( not ( = ?auto_2794 ?auto_2802 ) ) ( OBJ-AT ?auto_2795 ?auto_2802 ) ( TRUCK-AT ?auto_2800 ?auto_2802 ) ( OBJ-AT ?auto_2793 ?auto_2802 ) ( not ( = ?auto_2793 ?auto_2795 ) ) ( not ( = ?auto_2793 ?auto_2796 ) ) ( not ( = ?auto_2795 ?auto_2796 ) ) ( not ( = ?auto_2801 ?auto_2802 ) ) ( not ( = ?auto_2793 ?auto_2797 ) ) ( not ( = ?auto_2795 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( not ( = ?auto_2799 ?auto_2801 ) ) ( not ( = ?auto_2799 ?auto_2802 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2793 ?auto_2795 ?auto_2796 ?auto_2794 )
      ( DELIVER-1PKG ?auto_2797 ?auto_2794 )
      ( DELIVER-4PKG-VERIFY ?auto_2793 ?auto_2795 ?auto_2796 ?auto_2797 ?auto_2794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2808 - OBJ
      ?auto_2810 - OBJ
      ?auto_2811 - OBJ
      ?auto_2812 - OBJ
      ?auto_2809 - LOCATION
    )
    :vars
    (
      ?auto_2816 - LOCATION
      ?auto_2817 - CITY
      ?auto_2815 - LOCATION
      ?auto_2814 - LOCATION
      ?auto_2813 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2810 ?auto_2808 ) ( GREATER-THAN ?auto_2811 ?auto_2808 ) ( GREATER-THAN ?auto_2811 ?auto_2810 ) ( GREATER-THAN ?auto_2812 ?auto_2808 ) ( GREATER-THAN ?auto_2812 ?auto_2810 ) ( GREATER-THAN ?auto_2812 ?auto_2811 ) ( IN-CITY ?auto_2816 ?auto_2817 ) ( IN-CITY ?auto_2809 ?auto_2817 ) ( not ( = ?auto_2809 ?auto_2816 ) ) ( OBJ-AT ?auto_2812 ?auto_2816 ) ( IN-CITY ?auto_2815 ?auto_2817 ) ( not ( = ?auto_2809 ?auto_2815 ) ) ( OBJ-AT ?auto_2811 ?auto_2815 ) ( IN-CITY ?auto_2814 ?auto_2817 ) ( not ( = ?auto_2809 ?auto_2814 ) ) ( OBJ-AT ?auto_2810 ?auto_2814 ) ( OBJ-AT ?auto_2808 ?auto_2814 ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2808 ?auto_2811 ) ) ( not ( = ?auto_2810 ?auto_2811 ) ) ( not ( = ?auto_2815 ?auto_2814 ) ) ( not ( = ?auto_2808 ?auto_2812 ) ) ( not ( = ?auto_2810 ?auto_2812 ) ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( not ( = ?auto_2816 ?auto_2815 ) ) ( not ( = ?auto_2816 ?auto_2814 ) ) ( TRUCK-AT ?auto_2813 ?auto_2809 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2813 ?auto_2809 ?auto_2814 ?auto_2817 )
      ( DELIVER-4PKG ?auto_2808 ?auto_2810 ?auto_2811 ?auto_2812 ?auto_2809 )
      ( DELIVER-4PKG-VERIFY ?auto_2808 ?auto_2810 ?auto_2811 ?auto_2812 ?auto_2809 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2820 - OBJ
      ?auto_2821 - LOCATION
    )
    :vars
    (
      ?auto_2822 - TRUCK
      ?auto_2823 - LOCATION
      ?auto_2824 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2822 ?auto_2823 ) ( IN-CITY ?auto_2823 ?auto_2824 ) ( IN-CITY ?auto_2821 ?auto_2824 ) ( not ( = ?auto_2821 ?auto_2823 ) ) ( OBJ-AT ?auto_2820 ?auto_2823 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2820 ?auto_2822 ?auto_2823 )
      ( !DRIVE-TRUCK ?auto_2822 ?auto_2823 ?auto_2821 ?auto_2824 )
      ( !UNLOAD-TRUCK ?auto_2820 ?auto_2822 ?auto_2821 )
      ( DELIVER-1PKG-VERIFY ?auto_2820 ?auto_2821 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2827 - OBJ
      ?auto_2828 - LOCATION
    )
    :vars
    (
      ?auto_2831 - LOCATION
      ?auto_2830 - CITY
      ?auto_2829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2831 ?auto_2830 ) ( IN-CITY ?auto_2828 ?auto_2830 ) ( not ( = ?auto_2828 ?auto_2831 ) ) ( OBJ-AT ?auto_2827 ?auto_2831 ) ( TRUCK-AT ?auto_2829 ?auto_2828 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2829 ?auto_2828 ?auto_2831 ?auto_2830 )
      ( DELIVER-1PKG ?auto_2827 ?auto_2828 )
      ( DELIVER-1PKG-VERIFY ?auto_2827 ?auto_2828 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2838 - OBJ
      ?auto_2840 - OBJ
      ?auto_2841 - OBJ
      ?auto_2843 - OBJ
      ?auto_2842 - OBJ
      ?auto_2839 - LOCATION
    )
    :vars
    (
      ?auto_2844 - LOCATION
      ?auto_2845 - CITY
      ?auto_2848 - LOCATION
      ?auto_2847 - LOCATION
      ?auto_2846 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2840 ?auto_2838 ) ( GREATER-THAN ?auto_2841 ?auto_2838 ) ( GREATER-THAN ?auto_2841 ?auto_2840 ) ( GREATER-THAN ?auto_2843 ?auto_2838 ) ( GREATER-THAN ?auto_2843 ?auto_2840 ) ( GREATER-THAN ?auto_2843 ?auto_2841 ) ( GREATER-THAN ?auto_2842 ?auto_2838 ) ( GREATER-THAN ?auto_2842 ?auto_2840 ) ( GREATER-THAN ?auto_2842 ?auto_2841 ) ( GREATER-THAN ?auto_2842 ?auto_2843 ) ( IN-CITY ?auto_2844 ?auto_2845 ) ( IN-CITY ?auto_2839 ?auto_2845 ) ( not ( = ?auto_2839 ?auto_2844 ) ) ( OBJ-AT ?auto_2842 ?auto_2844 ) ( IN-CITY ?auto_2848 ?auto_2845 ) ( not ( = ?auto_2839 ?auto_2848 ) ) ( OBJ-AT ?auto_2843 ?auto_2848 ) ( IN-CITY ?auto_2847 ?auto_2845 ) ( not ( = ?auto_2839 ?auto_2847 ) ) ( OBJ-AT ?auto_2841 ?auto_2847 ) ( OBJ-AT ?auto_2840 ?auto_2844 ) ( TRUCK-AT ?auto_2846 ?auto_2844 ) ( OBJ-AT ?auto_2838 ?auto_2844 ) ( not ( = ?auto_2838 ?auto_2840 ) ) ( not ( = ?auto_2838 ?auto_2841 ) ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( not ( = ?auto_2847 ?auto_2844 ) ) ( not ( = ?auto_2838 ?auto_2843 ) ) ( not ( = ?auto_2840 ?auto_2843 ) ) ( not ( = ?auto_2841 ?auto_2843 ) ) ( not ( = ?auto_2848 ?auto_2847 ) ) ( not ( = ?auto_2848 ?auto_2844 ) ) ( not ( = ?auto_2838 ?auto_2842 ) ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2843 ?auto_2842 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2838 ?auto_2840 ?auto_2841 ?auto_2843 ?auto_2839 )
      ( DELIVER-1PKG ?auto_2842 ?auto_2839 )
      ( DELIVER-5PKG-VERIFY ?auto_2838 ?auto_2840 ?auto_2841 ?auto_2843 ?auto_2842 ?auto_2839 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2855 - OBJ
      ?auto_2857 - OBJ
      ?auto_2858 - OBJ
      ?auto_2860 - OBJ
      ?auto_2859 - OBJ
      ?auto_2856 - LOCATION
    )
    :vars
    (
      ?auto_2861 - LOCATION
      ?auto_2863 - CITY
      ?auto_2864 - LOCATION
      ?auto_2862 - LOCATION
      ?auto_2865 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2857 ?auto_2855 ) ( GREATER-THAN ?auto_2858 ?auto_2855 ) ( GREATER-THAN ?auto_2858 ?auto_2857 ) ( GREATER-THAN ?auto_2860 ?auto_2855 ) ( GREATER-THAN ?auto_2860 ?auto_2857 ) ( GREATER-THAN ?auto_2860 ?auto_2858 ) ( GREATER-THAN ?auto_2859 ?auto_2855 ) ( GREATER-THAN ?auto_2859 ?auto_2857 ) ( GREATER-THAN ?auto_2859 ?auto_2858 ) ( GREATER-THAN ?auto_2859 ?auto_2860 ) ( IN-CITY ?auto_2861 ?auto_2863 ) ( IN-CITY ?auto_2856 ?auto_2863 ) ( not ( = ?auto_2856 ?auto_2861 ) ) ( OBJ-AT ?auto_2859 ?auto_2861 ) ( IN-CITY ?auto_2864 ?auto_2863 ) ( not ( = ?auto_2856 ?auto_2864 ) ) ( OBJ-AT ?auto_2860 ?auto_2864 ) ( IN-CITY ?auto_2862 ?auto_2863 ) ( not ( = ?auto_2856 ?auto_2862 ) ) ( OBJ-AT ?auto_2858 ?auto_2862 ) ( OBJ-AT ?auto_2857 ?auto_2861 ) ( OBJ-AT ?auto_2855 ?auto_2861 ) ( not ( = ?auto_2855 ?auto_2857 ) ) ( not ( = ?auto_2855 ?auto_2858 ) ) ( not ( = ?auto_2857 ?auto_2858 ) ) ( not ( = ?auto_2862 ?auto_2861 ) ) ( not ( = ?auto_2855 ?auto_2860 ) ) ( not ( = ?auto_2857 ?auto_2860 ) ) ( not ( = ?auto_2858 ?auto_2860 ) ) ( not ( = ?auto_2864 ?auto_2862 ) ) ( not ( = ?auto_2864 ?auto_2861 ) ) ( not ( = ?auto_2855 ?auto_2859 ) ) ( not ( = ?auto_2857 ?auto_2859 ) ) ( not ( = ?auto_2858 ?auto_2859 ) ) ( not ( = ?auto_2860 ?auto_2859 ) ) ( TRUCK-AT ?auto_2865 ?auto_2856 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2865 ?auto_2856 ?auto_2861 ?auto_2863 )
      ( DELIVER-5PKG ?auto_2855 ?auto_2857 ?auto_2858 ?auto_2860 ?auto_2859 ?auto_2856 )
      ( DELIVER-5PKG-VERIFY ?auto_2855 ?auto_2857 ?auto_2858 ?auto_2860 ?auto_2859 ?auto_2856 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2868 - OBJ
      ?auto_2869 - LOCATION
    )
    :vars
    (
      ?auto_2870 - TRUCK
      ?auto_2871 - LOCATION
      ?auto_2872 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2870 ?auto_2871 ) ( IN-CITY ?auto_2871 ?auto_2872 ) ( IN-CITY ?auto_2869 ?auto_2872 ) ( not ( = ?auto_2869 ?auto_2871 ) ) ( OBJ-AT ?auto_2868 ?auto_2871 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2868 ?auto_2870 ?auto_2871 )
      ( !DRIVE-TRUCK ?auto_2870 ?auto_2871 ?auto_2869 ?auto_2872 )
      ( !UNLOAD-TRUCK ?auto_2868 ?auto_2870 ?auto_2869 )
      ( DELIVER-1PKG-VERIFY ?auto_2868 ?auto_2869 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2875 - OBJ
      ?auto_2876 - LOCATION
    )
    :vars
    (
      ?auto_2878 - LOCATION
      ?auto_2879 - CITY
      ?auto_2877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2878 ?auto_2879 ) ( IN-CITY ?auto_2876 ?auto_2879 ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( OBJ-AT ?auto_2875 ?auto_2878 ) ( TRUCK-AT ?auto_2877 ?auto_2876 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2877 ?auto_2876 ?auto_2878 ?auto_2879 )
      ( DELIVER-1PKG ?auto_2875 ?auto_2876 )
      ( DELIVER-1PKG-VERIFY ?auto_2875 ?auto_2876 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2887 - OBJ
      ?auto_2889 - OBJ
      ?auto_2890 - OBJ
      ?auto_2892 - OBJ
      ?auto_2891 - OBJ
      ?auto_2893 - OBJ
      ?auto_2888 - LOCATION
    )
    :vars
    (
      ?auto_2894 - LOCATION
      ?auto_2895 - CITY
      ?auto_2897 - LOCATION
      ?auto_2898 - LOCATION
      ?auto_2896 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2889 ?auto_2887 ) ( GREATER-THAN ?auto_2890 ?auto_2887 ) ( GREATER-THAN ?auto_2890 ?auto_2889 ) ( GREATER-THAN ?auto_2892 ?auto_2887 ) ( GREATER-THAN ?auto_2892 ?auto_2889 ) ( GREATER-THAN ?auto_2892 ?auto_2890 ) ( GREATER-THAN ?auto_2891 ?auto_2887 ) ( GREATER-THAN ?auto_2891 ?auto_2889 ) ( GREATER-THAN ?auto_2891 ?auto_2890 ) ( GREATER-THAN ?auto_2891 ?auto_2892 ) ( GREATER-THAN ?auto_2893 ?auto_2887 ) ( GREATER-THAN ?auto_2893 ?auto_2889 ) ( GREATER-THAN ?auto_2893 ?auto_2890 ) ( GREATER-THAN ?auto_2893 ?auto_2892 ) ( GREATER-THAN ?auto_2893 ?auto_2891 ) ( IN-CITY ?auto_2894 ?auto_2895 ) ( IN-CITY ?auto_2888 ?auto_2895 ) ( not ( = ?auto_2888 ?auto_2894 ) ) ( OBJ-AT ?auto_2893 ?auto_2894 ) ( IN-CITY ?auto_2897 ?auto_2895 ) ( not ( = ?auto_2888 ?auto_2897 ) ) ( OBJ-AT ?auto_2891 ?auto_2897 ) ( IN-CITY ?auto_2898 ?auto_2895 ) ( not ( = ?auto_2888 ?auto_2898 ) ) ( OBJ-AT ?auto_2892 ?auto_2898 ) ( OBJ-AT ?auto_2890 ?auto_2894 ) ( OBJ-AT ?auto_2889 ?auto_2897 ) ( TRUCK-AT ?auto_2896 ?auto_2897 ) ( OBJ-AT ?auto_2887 ?auto_2897 ) ( not ( = ?auto_2887 ?auto_2889 ) ) ( not ( = ?auto_2887 ?auto_2890 ) ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( not ( = ?auto_2894 ?auto_2897 ) ) ( not ( = ?auto_2887 ?auto_2892 ) ) ( not ( = ?auto_2889 ?auto_2892 ) ) ( not ( = ?auto_2890 ?auto_2892 ) ) ( not ( = ?auto_2898 ?auto_2894 ) ) ( not ( = ?auto_2898 ?auto_2897 ) ) ( not ( = ?auto_2887 ?auto_2891 ) ) ( not ( = ?auto_2889 ?auto_2891 ) ) ( not ( = ?auto_2890 ?auto_2891 ) ) ( not ( = ?auto_2892 ?auto_2891 ) ) ( not ( = ?auto_2887 ?auto_2893 ) ) ( not ( = ?auto_2889 ?auto_2893 ) ) ( not ( = ?auto_2890 ?auto_2893 ) ) ( not ( = ?auto_2892 ?auto_2893 ) ) ( not ( = ?auto_2891 ?auto_2893 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2887 ?auto_2889 ?auto_2890 ?auto_2892 ?auto_2891 ?auto_2888 )
      ( DELIVER-1PKG ?auto_2893 ?auto_2888 )
      ( DELIVER-6PKG-VERIFY ?auto_2887 ?auto_2889 ?auto_2890 ?auto_2892 ?auto_2891 ?auto_2893 ?auto_2888 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2906 - OBJ
      ?auto_2908 - OBJ
      ?auto_2909 - OBJ
      ?auto_2911 - OBJ
      ?auto_2910 - OBJ
      ?auto_2912 - OBJ
      ?auto_2907 - LOCATION
    )
    :vars
    (
      ?auto_2916 - LOCATION
      ?auto_2914 - CITY
      ?auto_2913 - LOCATION
      ?auto_2917 - LOCATION
      ?auto_2915 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2908 ?auto_2906 ) ( GREATER-THAN ?auto_2909 ?auto_2906 ) ( GREATER-THAN ?auto_2909 ?auto_2908 ) ( GREATER-THAN ?auto_2911 ?auto_2906 ) ( GREATER-THAN ?auto_2911 ?auto_2908 ) ( GREATER-THAN ?auto_2911 ?auto_2909 ) ( GREATER-THAN ?auto_2910 ?auto_2906 ) ( GREATER-THAN ?auto_2910 ?auto_2908 ) ( GREATER-THAN ?auto_2910 ?auto_2909 ) ( GREATER-THAN ?auto_2910 ?auto_2911 ) ( GREATER-THAN ?auto_2912 ?auto_2906 ) ( GREATER-THAN ?auto_2912 ?auto_2908 ) ( GREATER-THAN ?auto_2912 ?auto_2909 ) ( GREATER-THAN ?auto_2912 ?auto_2911 ) ( GREATER-THAN ?auto_2912 ?auto_2910 ) ( IN-CITY ?auto_2916 ?auto_2914 ) ( IN-CITY ?auto_2907 ?auto_2914 ) ( not ( = ?auto_2907 ?auto_2916 ) ) ( OBJ-AT ?auto_2912 ?auto_2916 ) ( IN-CITY ?auto_2913 ?auto_2914 ) ( not ( = ?auto_2907 ?auto_2913 ) ) ( OBJ-AT ?auto_2910 ?auto_2913 ) ( IN-CITY ?auto_2917 ?auto_2914 ) ( not ( = ?auto_2907 ?auto_2917 ) ) ( OBJ-AT ?auto_2911 ?auto_2917 ) ( OBJ-AT ?auto_2909 ?auto_2916 ) ( OBJ-AT ?auto_2908 ?auto_2913 ) ( OBJ-AT ?auto_2906 ?auto_2913 ) ( not ( = ?auto_2906 ?auto_2908 ) ) ( not ( = ?auto_2906 ?auto_2909 ) ) ( not ( = ?auto_2908 ?auto_2909 ) ) ( not ( = ?auto_2916 ?auto_2913 ) ) ( not ( = ?auto_2906 ?auto_2911 ) ) ( not ( = ?auto_2908 ?auto_2911 ) ) ( not ( = ?auto_2909 ?auto_2911 ) ) ( not ( = ?auto_2917 ?auto_2916 ) ) ( not ( = ?auto_2917 ?auto_2913 ) ) ( not ( = ?auto_2906 ?auto_2910 ) ) ( not ( = ?auto_2908 ?auto_2910 ) ) ( not ( = ?auto_2909 ?auto_2910 ) ) ( not ( = ?auto_2911 ?auto_2910 ) ) ( not ( = ?auto_2906 ?auto_2912 ) ) ( not ( = ?auto_2908 ?auto_2912 ) ) ( not ( = ?auto_2909 ?auto_2912 ) ) ( not ( = ?auto_2911 ?auto_2912 ) ) ( not ( = ?auto_2910 ?auto_2912 ) ) ( TRUCK-AT ?auto_2915 ?auto_2907 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2915 ?auto_2907 ?auto_2913 ?auto_2914 )
      ( DELIVER-6PKG ?auto_2906 ?auto_2908 ?auto_2909 ?auto_2911 ?auto_2910 ?auto_2912 ?auto_2907 )
      ( DELIVER-6PKG-VERIFY ?auto_2906 ?auto_2908 ?auto_2909 ?auto_2911 ?auto_2910 ?auto_2912 ?auto_2907 ) )
  )

)

