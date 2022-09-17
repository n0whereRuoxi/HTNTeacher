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
      ?auto_2793 - OBJ
      ?auto_2794 - LOCATION
    )
    :vars
    (
      ?auto_2796 - LOCATION
      ?auto_2797 - CITY
      ?auto_2795 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2796 ?auto_2797 ) ( IN-CITY ?auto_2794 ?auto_2797 ) ( not ( = ?auto_2794 ?auto_2796 ) ) ( OBJ-AT ?auto_2793 ?auto_2796 ) ( TRUCK-AT ?auto_2795 ?auto_2794 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2795 ?auto_2794 ?auto_2796 ?auto_2797 )
      ( !LOAD-TRUCK ?auto_2793 ?auto_2795 ?auto_2796 )
      ( !DRIVE-TRUCK ?auto_2795 ?auto_2796 ?auto_2794 ?auto_2797 )
      ( !UNLOAD-TRUCK ?auto_2793 ?auto_2795 ?auto_2794 )
      ( DELIVER-1PKG-VERIFY ?auto_2793 ?auto_2794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2808 - OBJ
      ?auto_2810 - OBJ
      ?auto_2809 - LOCATION
    )
    :vars
    (
      ?auto_2812 - LOCATION
      ?auto_2813 - CITY
      ?auto_2814 - LOCATION
      ?auto_2811 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2810 ?auto_2808 ) ( IN-CITY ?auto_2812 ?auto_2813 ) ( IN-CITY ?auto_2809 ?auto_2813 ) ( not ( = ?auto_2809 ?auto_2812 ) ) ( OBJ-AT ?auto_2810 ?auto_2812 ) ( IN-CITY ?auto_2814 ?auto_2813 ) ( not ( = ?auto_2809 ?auto_2814 ) ) ( OBJ-AT ?auto_2808 ?auto_2814 ) ( TRUCK-AT ?auto_2811 ?auto_2809 ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2812 ?auto_2814 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2808 ?auto_2809 )
      ( DELIVER-1PKG ?auto_2810 ?auto_2809 )
      ( DELIVER-2PKG-VERIFY ?auto_2808 ?auto_2810 ?auto_2809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2826 - OBJ
      ?auto_2828 - OBJ
      ?auto_2829 - OBJ
      ?auto_2827 - LOCATION
    )
    :vars
    (
      ?auto_2831 - LOCATION
      ?auto_2830 - CITY
      ?auto_2834 - LOCATION
      ?auto_2833 - LOCATION
      ?auto_2832 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2828 ?auto_2826 ) ( GREATER-THAN ?auto_2829 ?auto_2826 ) ( GREATER-THAN ?auto_2829 ?auto_2828 ) ( IN-CITY ?auto_2831 ?auto_2830 ) ( IN-CITY ?auto_2827 ?auto_2830 ) ( not ( = ?auto_2827 ?auto_2831 ) ) ( OBJ-AT ?auto_2829 ?auto_2831 ) ( IN-CITY ?auto_2834 ?auto_2830 ) ( not ( = ?auto_2827 ?auto_2834 ) ) ( OBJ-AT ?auto_2828 ?auto_2834 ) ( IN-CITY ?auto_2833 ?auto_2830 ) ( not ( = ?auto_2827 ?auto_2833 ) ) ( OBJ-AT ?auto_2826 ?auto_2833 ) ( TRUCK-AT ?auto_2832 ?auto_2827 ) ( not ( = ?auto_2826 ?auto_2828 ) ) ( not ( = ?auto_2834 ?auto_2833 ) ) ( not ( = ?auto_2826 ?auto_2829 ) ) ( not ( = ?auto_2828 ?auto_2829 ) ) ( not ( = ?auto_2831 ?auto_2834 ) ) ( not ( = ?auto_2831 ?auto_2833 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2826 ?auto_2828 ?auto_2827 )
      ( DELIVER-1PKG ?auto_2829 ?auto_2827 )
      ( DELIVER-3PKG-VERIFY ?auto_2826 ?auto_2828 ?auto_2829 ?auto_2827 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2847 - OBJ
      ?auto_2849 - OBJ
      ?auto_2850 - OBJ
      ?auto_2851 - OBJ
      ?auto_2848 - LOCATION
    )
    :vars
    (
      ?auto_2852 - LOCATION
      ?auto_2853 - CITY
      ?auto_2856 - LOCATION
      ?auto_2855 - LOCATION
      ?auto_2857 - LOCATION
      ?auto_2854 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2849 ?auto_2847 ) ( GREATER-THAN ?auto_2850 ?auto_2847 ) ( GREATER-THAN ?auto_2850 ?auto_2849 ) ( GREATER-THAN ?auto_2851 ?auto_2847 ) ( GREATER-THAN ?auto_2851 ?auto_2849 ) ( GREATER-THAN ?auto_2851 ?auto_2850 ) ( IN-CITY ?auto_2852 ?auto_2853 ) ( IN-CITY ?auto_2848 ?auto_2853 ) ( not ( = ?auto_2848 ?auto_2852 ) ) ( OBJ-AT ?auto_2851 ?auto_2852 ) ( IN-CITY ?auto_2856 ?auto_2853 ) ( not ( = ?auto_2848 ?auto_2856 ) ) ( OBJ-AT ?auto_2850 ?auto_2856 ) ( IN-CITY ?auto_2855 ?auto_2853 ) ( not ( = ?auto_2848 ?auto_2855 ) ) ( OBJ-AT ?auto_2849 ?auto_2855 ) ( IN-CITY ?auto_2857 ?auto_2853 ) ( not ( = ?auto_2848 ?auto_2857 ) ) ( OBJ-AT ?auto_2847 ?auto_2857 ) ( TRUCK-AT ?auto_2854 ?auto_2848 ) ( not ( = ?auto_2847 ?auto_2849 ) ) ( not ( = ?auto_2855 ?auto_2857 ) ) ( not ( = ?auto_2847 ?auto_2850 ) ) ( not ( = ?auto_2849 ?auto_2850 ) ) ( not ( = ?auto_2856 ?auto_2855 ) ) ( not ( = ?auto_2856 ?auto_2857 ) ) ( not ( = ?auto_2847 ?auto_2851 ) ) ( not ( = ?auto_2849 ?auto_2851 ) ) ( not ( = ?auto_2850 ?auto_2851 ) ) ( not ( = ?auto_2852 ?auto_2856 ) ) ( not ( = ?auto_2852 ?auto_2855 ) ) ( not ( = ?auto_2852 ?auto_2857 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2847 ?auto_2849 ?auto_2850 ?auto_2848 )
      ( DELIVER-1PKG ?auto_2851 ?auto_2848 )
      ( DELIVER-4PKG-VERIFY ?auto_2847 ?auto_2849 ?auto_2850 ?auto_2851 ?auto_2848 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2871 - OBJ
      ?auto_2873 - OBJ
      ?auto_2874 - OBJ
      ?auto_2875 - OBJ
      ?auto_2876 - OBJ
      ?auto_2872 - LOCATION
    )
    :vars
    (
      ?auto_2878 - LOCATION
      ?auto_2877 - CITY
      ?auto_2880 - LOCATION
      ?auto_2882 - LOCATION
      ?auto_2881 - LOCATION
      ?auto_2879 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2873 ?auto_2871 ) ( GREATER-THAN ?auto_2874 ?auto_2871 ) ( GREATER-THAN ?auto_2874 ?auto_2873 ) ( GREATER-THAN ?auto_2875 ?auto_2871 ) ( GREATER-THAN ?auto_2875 ?auto_2873 ) ( GREATER-THAN ?auto_2875 ?auto_2874 ) ( GREATER-THAN ?auto_2876 ?auto_2871 ) ( GREATER-THAN ?auto_2876 ?auto_2873 ) ( GREATER-THAN ?auto_2876 ?auto_2874 ) ( GREATER-THAN ?auto_2876 ?auto_2875 ) ( IN-CITY ?auto_2878 ?auto_2877 ) ( IN-CITY ?auto_2872 ?auto_2877 ) ( not ( = ?auto_2872 ?auto_2878 ) ) ( OBJ-AT ?auto_2876 ?auto_2878 ) ( IN-CITY ?auto_2880 ?auto_2877 ) ( not ( = ?auto_2872 ?auto_2880 ) ) ( OBJ-AT ?auto_2875 ?auto_2880 ) ( IN-CITY ?auto_2882 ?auto_2877 ) ( not ( = ?auto_2872 ?auto_2882 ) ) ( OBJ-AT ?auto_2874 ?auto_2882 ) ( OBJ-AT ?auto_2873 ?auto_2878 ) ( IN-CITY ?auto_2881 ?auto_2877 ) ( not ( = ?auto_2872 ?auto_2881 ) ) ( OBJ-AT ?auto_2871 ?auto_2881 ) ( TRUCK-AT ?auto_2879 ?auto_2872 ) ( not ( = ?auto_2871 ?auto_2873 ) ) ( not ( = ?auto_2878 ?auto_2881 ) ) ( not ( = ?auto_2871 ?auto_2874 ) ) ( not ( = ?auto_2873 ?auto_2874 ) ) ( not ( = ?auto_2882 ?auto_2878 ) ) ( not ( = ?auto_2882 ?auto_2881 ) ) ( not ( = ?auto_2871 ?auto_2875 ) ) ( not ( = ?auto_2873 ?auto_2875 ) ) ( not ( = ?auto_2874 ?auto_2875 ) ) ( not ( = ?auto_2880 ?auto_2882 ) ) ( not ( = ?auto_2880 ?auto_2878 ) ) ( not ( = ?auto_2880 ?auto_2881 ) ) ( not ( = ?auto_2871 ?auto_2876 ) ) ( not ( = ?auto_2873 ?auto_2876 ) ) ( not ( = ?auto_2874 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2876 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2871 ?auto_2873 ?auto_2874 ?auto_2875 ?auto_2872 )
      ( DELIVER-1PKG ?auto_2876 ?auto_2872 )
      ( DELIVER-5PKG-VERIFY ?auto_2871 ?auto_2873 ?auto_2874 ?auto_2875 ?auto_2876 ?auto_2872 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2897 - OBJ
      ?auto_2899 - OBJ
      ?auto_2900 - OBJ
      ?auto_2901 - OBJ
      ?auto_2902 - OBJ
      ?auto_2903 - OBJ
      ?auto_2898 - LOCATION
    )
    :vars
    (
      ?auto_2906 - LOCATION
      ?auto_2905 - CITY
      ?auto_2907 - LOCATION
      ?auto_2909 - LOCATION
      ?auto_2908 - LOCATION
      ?auto_2904 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2899 ?auto_2897 ) ( GREATER-THAN ?auto_2900 ?auto_2897 ) ( GREATER-THAN ?auto_2900 ?auto_2899 ) ( GREATER-THAN ?auto_2901 ?auto_2897 ) ( GREATER-THAN ?auto_2901 ?auto_2899 ) ( GREATER-THAN ?auto_2901 ?auto_2900 ) ( GREATER-THAN ?auto_2902 ?auto_2897 ) ( GREATER-THAN ?auto_2902 ?auto_2899 ) ( GREATER-THAN ?auto_2902 ?auto_2900 ) ( GREATER-THAN ?auto_2902 ?auto_2901 ) ( GREATER-THAN ?auto_2903 ?auto_2897 ) ( GREATER-THAN ?auto_2903 ?auto_2899 ) ( GREATER-THAN ?auto_2903 ?auto_2900 ) ( GREATER-THAN ?auto_2903 ?auto_2901 ) ( GREATER-THAN ?auto_2903 ?auto_2902 ) ( IN-CITY ?auto_2906 ?auto_2905 ) ( IN-CITY ?auto_2898 ?auto_2905 ) ( not ( = ?auto_2898 ?auto_2906 ) ) ( OBJ-AT ?auto_2903 ?auto_2906 ) ( IN-CITY ?auto_2907 ?auto_2905 ) ( not ( = ?auto_2898 ?auto_2907 ) ) ( OBJ-AT ?auto_2902 ?auto_2907 ) ( IN-CITY ?auto_2909 ?auto_2905 ) ( not ( = ?auto_2898 ?auto_2909 ) ) ( OBJ-AT ?auto_2901 ?auto_2909 ) ( OBJ-AT ?auto_2900 ?auto_2906 ) ( OBJ-AT ?auto_2899 ?auto_2907 ) ( IN-CITY ?auto_2908 ?auto_2905 ) ( not ( = ?auto_2898 ?auto_2908 ) ) ( OBJ-AT ?auto_2897 ?auto_2908 ) ( TRUCK-AT ?auto_2904 ?auto_2898 ) ( not ( = ?auto_2897 ?auto_2899 ) ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( not ( = ?auto_2897 ?auto_2900 ) ) ( not ( = ?auto_2899 ?auto_2900 ) ) ( not ( = ?auto_2906 ?auto_2907 ) ) ( not ( = ?auto_2906 ?auto_2908 ) ) ( not ( = ?auto_2897 ?auto_2901 ) ) ( not ( = ?auto_2899 ?auto_2901 ) ) ( not ( = ?auto_2900 ?auto_2901 ) ) ( not ( = ?auto_2909 ?auto_2906 ) ) ( not ( = ?auto_2909 ?auto_2907 ) ) ( not ( = ?auto_2909 ?auto_2908 ) ) ( not ( = ?auto_2897 ?auto_2902 ) ) ( not ( = ?auto_2899 ?auto_2902 ) ) ( not ( = ?auto_2900 ?auto_2902 ) ) ( not ( = ?auto_2901 ?auto_2902 ) ) ( not ( = ?auto_2897 ?auto_2903 ) ) ( not ( = ?auto_2899 ?auto_2903 ) ) ( not ( = ?auto_2900 ?auto_2903 ) ) ( not ( = ?auto_2901 ?auto_2903 ) ) ( not ( = ?auto_2902 ?auto_2903 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2897 ?auto_2899 ?auto_2900 ?auto_2901 ?auto_2902 ?auto_2898 )
      ( DELIVER-1PKG ?auto_2903 ?auto_2898 )
      ( DELIVER-6PKG-VERIFY ?auto_2897 ?auto_2899 ?auto_2900 ?auto_2901 ?auto_2902 ?auto_2903 ?auto_2898 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_2925 - OBJ
      ?auto_2927 - OBJ
      ?auto_2928 - OBJ
      ?auto_2929 - OBJ
      ?auto_2930 - OBJ
      ?auto_2931 - OBJ
      ?auto_2932 - OBJ
      ?auto_2926 - LOCATION
    )
    :vars
    (
      ?auto_2933 - LOCATION
      ?auto_2935 - CITY
      ?auto_2938 - LOCATION
      ?auto_2936 - LOCATION
      ?auto_2937 - LOCATION
      ?auto_2934 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2927 ?auto_2925 ) ( GREATER-THAN ?auto_2928 ?auto_2925 ) ( GREATER-THAN ?auto_2928 ?auto_2927 ) ( GREATER-THAN ?auto_2929 ?auto_2925 ) ( GREATER-THAN ?auto_2929 ?auto_2927 ) ( GREATER-THAN ?auto_2929 ?auto_2928 ) ( GREATER-THAN ?auto_2930 ?auto_2925 ) ( GREATER-THAN ?auto_2930 ?auto_2927 ) ( GREATER-THAN ?auto_2930 ?auto_2928 ) ( GREATER-THAN ?auto_2930 ?auto_2929 ) ( GREATER-THAN ?auto_2931 ?auto_2925 ) ( GREATER-THAN ?auto_2931 ?auto_2927 ) ( GREATER-THAN ?auto_2931 ?auto_2928 ) ( GREATER-THAN ?auto_2931 ?auto_2929 ) ( GREATER-THAN ?auto_2931 ?auto_2930 ) ( GREATER-THAN ?auto_2932 ?auto_2925 ) ( GREATER-THAN ?auto_2932 ?auto_2927 ) ( GREATER-THAN ?auto_2932 ?auto_2928 ) ( GREATER-THAN ?auto_2932 ?auto_2929 ) ( GREATER-THAN ?auto_2932 ?auto_2930 ) ( GREATER-THAN ?auto_2932 ?auto_2931 ) ( IN-CITY ?auto_2933 ?auto_2935 ) ( IN-CITY ?auto_2926 ?auto_2935 ) ( not ( = ?auto_2926 ?auto_2933 ) ) ( OBJ-AT ?auto_2932 ?auto_2933 ) ( OBJ-AT ?auto_2931 ?auto_2933 ) ( IN-CITY ?auto_2938 ?auto_2935 ) ( not ( = ?auto_2926 ?auto_2938 ) ) ( OBJ-AT ?auto_2930 ?auto_2938 ) ( IN-CITY ?auto_2936 ?auto_2935 ) ( not ( = ?auto_2926 ?auto_2936 ) ) ( OBJ-AT ?auto_2929 ?auto_2936 ) ( OBJ-AT ?auto_2928 ?auto_2933 ) ( OBJ-AT ?auto_2927 ?auto_2938 ) ( IN-CITY ?auto_2937 ?auto_2935 ) ( not ( = ?auto_2926 ?auto_2937 ) ) ( OBJ-AT ?auto_2925 ?auto_2937 ) ( TRUCK-AT ?auto_2934 ?auto_2926 ) ( not ( = ?auto_2925 ?auto_2927 ) ) ( not ( = ?auto_2938 ?auto_2937 ) ) ( not ( = ?auto_2925 ?auto_2928 ) ) ( not ( = ?auto_2927 ?auto_2928 ) ) ( not ( = ?auto_2933 ?auto_2938 ) ) ( not ( = ?auto_2933 ?auto_2937 ) ) ( not ( = ?auto_2925 ?auto_2929 ) ) ( not ( = ?auto_2927 ?auto_2929 ) ) ( not ( = ?auto_2928 ?auto_2929 ) ) ( not ( = ?auto_2936 ?auto_2933 ) ) ( not ( = ?auto_2936 ?auto_2938 ) ) ( not ( = ?auto_2936 ?auto_2937 ) ) ( not ( = ?auto_2925 ?auto_2930 ) ) ( not ( = ?auto_2927 ?auto_2930 ) ) ( not ( = ?auto_2928 ?auto_2930 ) ) ( not ( = ?auto_2929 ?auto_2930 ) ) ( not ( = ?auto_2925 ?auto_2931 ) ) ( not ( = ?auto_2927 ?auto_2931 ) ) ( not ( = ?auto_2928 ?auto_2931 ) ) ( not ( = ?auto_2929 ?auto_2931 ) ) ( not ( = ?auto_2930 ?auto_2931 ) ) ( not ( = ?auto_2925 ?auto_2932 ) ) ( not ( = ?auto_2927 ?auto_2932 ) ) ( not ( = ?auto_2928 ?auto_2932 ) ) ( not ( = ?auto_2929 ?auto_2932 ) ) ( not ( = ?auto_2930 ?auto_2932 ) ) ( not ( = ?auto_2931 ?auto_2932 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2925 ?auto_2927 ?auto_2928 ?auto_2929 ?auto_2930 ?auto_2931 ?auto_2926 )
      ( DELIVER-1PKG ?auto_2932 ?auto_2926 )
      ( DELIVER-7PKG-VERIFY ?auto_2925 ?auto_2927 ?auto_2928 ?auto_2929 ?auto_2930 ?auto_2931 ?auto_2932 ?auto_2926 ) )
  )

  ( :method DELIVER-8PKG
    :parameters
    (
      ?auto_2955 - OBJ
      ?auto_2957 - OBJ
      ?auto_2958 - OBJ
      ?auto_2959 - OBJ
      ?auto_2960 - OBJ
      ?auto_2962 - OBJ
      ?auto_2963 - OBJ
      ?auto_2961 - OBJ
      ?auto_2956 - LOCATION
    )
    :vars
    (
      ?auto_2964 - LOCATION
      ?auto_2966 - CITY
      ?auto_2968 - LOCATION
      ?auto_2967 - LOCATION
      ?auto_2969 - LOCATION
      ?auto_2965 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2957 ?auto_2955 ) ( GREATER-THAN ?auto_2958 ?auto_2955 ) ( GREATER-THAN ?auto_2958 ?auto_2957 ) ( GREATER-THAN ?auto_2959 ?auto_2955 ) ( GREATER-THAN ?auto_2959 ?auto_2957 ) ( GREATER-THAN ?auto_2959 ?auto_2958 ) ( GREATER-THAN ?auto_2960 ?auto_2955 ) ( GREATER-THAN ?auto_2960 ?auto_2957 ) ( GREATER-THAN ?auto_2960 ?auto_2958 ) ( GREATER-THAN ?auto_2960 ?auto_2959 ) ( GREATER-THAN ?auto_2962 ?auto_2955 ) ( GREATER-THAN ?auto_2962 ?auto_2957 ) ( GREATER-THAN ?auto_2962 ?auto_2958 ) ( GREATER-THAN ?auto_2962 ?auto_2959 ) ( GREATER-THAN ?auto_2962 ?auto_2960 ) ( GREATER-THAN ?auto_2963 ?auto_2955 ) ( GREATER-THAN ?auto_2963 ?auto_2957 ) ( GREATER-THAN ?auto_2963 ?auto_2958 ) ( GREATER-THAN ?auto_2963 ?auto_2959 ) ( GREATER-THAN ?auto_2963 ?auto_2960 ) ( GREATER-THAN ?auto_2963 ?auto_2962 ) ( GREATER-THAN ?auto_2961 ?auto_2955 ) ( GREATER-THAN ?auto_2961 ?auto_2957 ) ( GREATER-THAN ?auto_2961 ?auto_2958 ) ( GREATER-THAN ?auto_2961 ?auto_2959 ) ( GREATER-THAN ?auto_2961 ?auto_2960 ) ( GREATER-THAN ?auto_2961 ?auto_2962 ) ( GREATER-THAN ?auto_2961 ?auto_2963 ) ( IN-CITY ?auto_2964 ?auto_2966 ) ( IN-CITY ?auto_2956 ?auto_2966 ) ( not ( = ?auto_2956 ?auto_2964 ) ) ( OBJ-AT ?auto_2961 ?auto_2964 ) ( IN-CITY ?auto_2968 ?auto_2966 ) ( not ( = ?auto_2956 ?auto_2968 ) ) ( OBJ-AT ?auto_2963 ?auto_2968 ) ( OBJ-AT ?auto_2962 ?auto_2968 ) ( IN-CITY ?auto_2967 ?auto_2966 ) ( not ( = ?auto_2956 ?auto_2967 ) ) ( OBJ-AT ?auto_2960 ?auto_2967 ) ( IN-CITY ?auto_2969 ?auto_2966 ) ( not ( = ?auto_2956 ?auto_2969 ) ) ( OBJ-AT ?auto_2959 ?auto_2969 ) ( OBJ-AT ?auto_2958 ?auto_2968 ) ( OBJ-AT ?auto_2957 ?auto_2967 ) ( OBJ-AT ?auto_2955 ?auto_2964 ) ( TRUCK-AT ?auto_2965 ?auto_2956 ) ( not ( = ?auto_2955 ?auto_2957 ) ) ( not ( = ?auto_2967 ?auto_2964 ) ) ( not ( = ?auto_2955 ?auto_2958 ) ) ( not ( = ?auto_2957 ?auto_2958 ) ) ( not ( = ?auto_2968 ?auto_2967 ) ) ( not ( = ?auto_2968 ?auto_2964 ) ) ( not ( = ?auto_2955 ?auto_2959 ) ) ( not ( = ?auto_2957 ?auto_2959 ) ) ( not ( = ?auto_2958 ?auto_2959 ) ) ( not ( = ?auto_2969 ?auto_2968 ) ) ( not ( = ?auto_2969 ?auto_2967 ) ) ( not ( = ?auto_2969 ?auto_2964 ) ) ( not ( = ?auto_2955 ?auto_2960 ) ) ( not ( = ?auto_2957 ?auto_2960 ) ) ( not ( = ?auto_2958 ?auto_2960 ) ) ( not ( = ?auto_2959 ?auto_2960 ) ) ( not ( = ?auto_2955 ?auto_2962 ) ) ( not ( = ?auto_2957 ?auto_2962 ) ) ( not ( = ?auto_2958 ?auto_2962 ) ) ( not ( = ?auto_2959 ?auto_2962 ) ) ( not ( = ?auto_2960 ?auto_2962 ) ) ( not ( = ?auto_2955 ?auto_2963 ) ) ( not ( = ?auto_2957 ?auto_2963 ) ) ( not ( = ?auto_2958 ?auto_2963 ) ) ( not ( = ?auto_2959 ?auto_2963 ) ) ( not ( = ?auto_2960 ?auto_2963 ) ) ( not ( = ?auto_2962 ?auto_2963 ) ) ( not ( = ?auto_2955 ?auto_2961 ) ) ( not ( = ?auto_2957 ?auto_2961 ) ) ( not ( = ?auto_2958 ?auto_2961 ) ) ( not ( = ?auto_2959 ?auto_2961 ) ) ( not ( = ?auto_2960 ?auto_2961 ) ) ( not ( = ?auto_2962 ?auto_2961 ) ) ( not ( = ?auto_2963 ?auto_2961 ) ) )
    :subtasks
    ( ( DELIVER-7PKG ?auto_2955 ?auto_2957 ?auto_2958 ?auto_2959 ?auto_2960 ?auto_2962 ?auto_2963 ?auto_2956 )
      ( DELIVER-1PKG ?auto_2961 ?auto_2956 )
      ( DELIVER-8PKG-VERIFY ?auto_2955 ?auto_2957 ?auto_2958 ?auto_2959 ?auto_2960 ?auto_2962 ?auto_2963 ?auto_2961 ?auto_2956 ) )
  )

)

