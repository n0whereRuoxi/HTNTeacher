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
      ?auto_2830 - OBJ
      ?auto_2831 - LOCATION
    )
    :vars
    (
      ?auto_2840 - LOCATION
      ?auto_2837 - CITY
      ?auto_2832 - TRUCK
      ?auto_2843 - LOCATION
      ?auto_2844 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2840 ?auto_2837 ) ( IN-CITY ?auto_2831 ?auto_2837 ) ( not ( = ?auto_2831 ?auto_2840 ) ) ( OBJ-AT ?auto_2830 ?auto_2840 ) ( TRUCK-AT ?auto_2832 ?auto_2843 ) ( IN-CITY ?auto_2843 ?auto_2844 ) ( IN-CITY ?auto_2840 ?auto_2844 ) ( not ( = ?auto_2840 ?auto_2843 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2832 ?auto_2843 ?auto_2840 ?auto_2844 )
      ( !LOAD-TRUCK ?auto_2830 ?auto_2832 ?auto_2840 )
      ( !DRIVE-TRUCK ?auto_2832 ?auto_2840 ?auto_2831 ?auto_2837 )
      ( !UNLOAD-TRUCK ?auto_2830 ?auto_2832 ?auto_2831 )
      ( DELIVER-1PKG-VERIFY ?auto_2830 ?auto_2831 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2867 - OBJ
      ?auto_2869 - OBJ
      ?auto_2870 - LOCATION
    )
    :vars
    (
      ?auto_2871 - LOCATION
      ?auto_2875 - CITY
      ?auto_2872 - CITY
      ?auto_2881 - LOCATION
      ?auto_2883 - CITY
      ?auto_2873 - TRUCK
      ?auto_2879 - LOCATION
      ?auto_2877 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2869 ?auto_2867 ) ( IN-CITY ?auto_2871 ?auto_2875 ) ( IN-CITY ?auto_2870 ?auto_2875 ) ( not ( = ?auto_2870 ?auto_2871 ) ) ( OBJ-AT ?auto_2869 ?auto_2871 ) ( IN-CITY ?auto_2870 ?auto_2872 ) ( IN-CITY ?auto_2871 ?auto_2872 ) ( IN-CITY ?auto_2881 ?auto_2883 ) ( IN-CITY ?auto_2870 ?auto_2883 ) ( not ( = ?auto_2870 ?auto_2881 ) ) ( OBJ-AT ?auto_2867 ?auto_2881 ) ( TRUCK-AT ?auto_2873 ?auto_2879 ) ( IN-CITY ?auto_2879 ?auto_2877 ) ( IN-CITY ?auto_2881 ?auto_2877 ) ( not ( = ?auto_2881 ?auto_2879 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2867 ?auto_2870 )
      ( DELIVER-1PKG ?auto_2869 ?auto_2870 )
      ( DELIVER-2PKG-VERIFY ?auto_2867 ?auto_2869 ?auto_2870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2906 - OBJ
      ?auto_2908 - OBJ
      ?auto_2909 - OBJ
      ?auto_2911 - LOCATION
    )
    :vars
    (
      ?auto_2914 - LOCATION
      ?auto_2915 - CITY
      ?auto_2913 - CITY
      ?auto_2926 - LOCATION
      ?auto_2922 - CITY
      ?auto_2925 - CITY
      ?auto_2927 - LOCATION
      ?auto_2919 - CITY
      ?auto_2916 - TRUCK
      ?auto_2924 - LOCATION
      ?auto_2918 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2908 ?auto_2906 ) ( GREATER-THAN ?auto_2909 ?auto_2906 ) ( GREATER-THAN ?auto_2909 ?auto_2908 ) ( IN-CITY ?auto_2914 ?auto_2915 ) ( IN-CITY ?auto_2911 ?auto_2915 ) ( not ( = ?auto_2911 ?auto_2914 ) ) ( OBJ-AT ?auto_2909 ?auto_2914 ) ( IN-CITY ?auto_2911 ?auto_2913 ) ( IN-CITY ?auto_2914 ?auto_2913 ) ( IN-CITY ?auto_2926 ?auto_2922 ) ( IN-CITY ?auto_2911 ?auto_2922 ) ( not ( = ?auto_2911 ?auto_2926 ) ) ( OBJ-AT ?auto_2908 ?auto_2926 ) ( IN-CITY ?auto_2911 ?auto_2925 ) ( IN-CITY ?auto_2926 ?auto_2925 ) ( IN-CITY ?auto_2927 ?auto_2919 ) ( IN-CITY ?auto_2911 ?auto_2919 ) ( not ( = ?auto_2911 ?auto_2927 ) ) ( OBJ-AT ?auto_2906 ?auto_2927 ) ( TRUCK-AT ?auto_2916 ?auto_2924 ) ( IN-CITY ?auto_2924 ?auto_2918 ) ( IN-CITY ?auto_2927 ?auto_2918 ) ( not ( = ?auto_2927 ?auto_2924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2906 ?auto_2908 ?auto_2911 )
      ( DELIVER-1PKG ?auto_2909 ?auto_2911 )
      ( DELIVER-3PKG-VERIFY ?auto_2906 ?auto_2908 ?auto_2909 ?auto_2911 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2951 - OBJ
      ?auto_2953 - OBJ
      ?auto_2954 - OBJ
      ?auto_2955 - OBJ
      ?auto_2956 - LOCATION
    )
    :vars
    (
      ?auto_2959 - LOCATION
      ?auto_2960 - CITY
      ?auto_2961 - CITY
      ?auto_2966 - LOCATION
      ?auto_2970 - CITY
      ?auto_2965 - CITY
      ?auto_2971 - LOCATION
      ?auto_2975 - CITY
      ?auto_2972 - CITY
      ?auto_2968 - LOCATION
      ?auto_2973 - CITY
      ?auto_2958 - TRUCK
      ?auto_2976 - LOCATION
      ?auto_2974 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2953 ?auto_2951 ) ( GREATER-THAN ?auto_2954 ?auto_2951 ) ( GREATER-THAN ?auto_2954 ?auto_2953 ) ( GREATER-THAN ?auto_2955 ?auto_2951 ) ( GREATER-THAN ?auto_2955 ?auto_2953 ) ( GREATER-THAN ?auto_2955 ?auto_2954 ) ( IN-CITY ?auto_2959 ?auto_2960 ) ( IN-CITY ?auto_2956 ?auto_2960 ) ( not ( = ?auto_2956 ?auto_2959 ) ) ( OBJ-AT ?auto_2955 ?auto_2959 ) ( IN-CITY ?auto_2956 ?auto_2961 ) ( IN-CITY ?auto_2959 ?auto_2961 ) ( IN-CITY ?auto_2966 ?auto_2970 ) ( IN-CITY ?auto_2956 ?auto_2970 ) ( not ( = ?auto_2956 ?auto_2966 ) ) ( OBJ-AT ?auto_2954 ?auto_2966 ) ( IN-CITY ?auto_2956 ?auto_2965 ) ( IN-CITY ?auto_2966 ?auto_2965 ) ( IN-CITY ?auto_2971 ?auto_2975 ) ( IN-CITY ?auto_2956 ?auto_2975 ) ( not ( = ?auto_2956 ?auto_2971 ) ) ( OBJ-AT ?auto_2953 ?auto_2971 ) ( IN-CITY ?auto_2956 ?auto_2972 ) ( IN-CITY ?auto_2971 ?auto_2972 ) ( IN-CITY ?auto_2968 ?auto_2973 ) ( IN-CITY ?auto_2956 ?auto_2973 ) ( not ( = ?auto_2956 ?auto_2968 ) ) ( OBJ-AT ?auto_2951 ?auto_2968 ) ( TRUCK-AT ?auto_2958 ?auto_2976 ) ( IN-CITY ?auto_2976 ?auto_2974 ) ( IN-CITY ?auto_2968 ?auto_2974 ) ( not ( = ?auto_2968 ?auto_2976 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2951 ?auto_2953 ?auto_2954 ?auto_2956 )
      ( DELIVER-1PKG ?auto_2955 ?auto_2956 )
      ( DELIVER-4PKG-VERIFY ?auto_2951 ?auto_2953 ?auto_2954 ?auto_2955 ?auto_2956 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3002 - OBJ
      ?auto_3004 - OBJ
      ?auto_3005 - OBJ
      ?auto_3006 - OBJ
      ?auto_3007 - OBJ
      ?auto_3009 - LOCATION
    )
    :vars
    (
      ?auto_3012 - LOCATION
      ?auto_3008 - CITY
      ?auto_3011 - CITY
      ?auto_3030 - LOCATION
      ?auto_3033 - CITY
      ?auto_3023 - CITY
      ?auto_3026 - LOCATION
      ?auto_3016 - CITY
      ?auto_3015 - CITY
      ?auto_3018 - LOCATION
      ?auto_3021 - CITY
      ?auto_3017 - CITY
      ?auto_3022 - LOCATION
      ?auto_3020 - CITY
      ?auto_3010 - TRUCK
      ?auto_3025 - LOCATION
      ?auto_3019 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3004 ?auto_3002 ) ( GREATER-THAN ?auto_3005 ?auto_3002 ) ( GREATER-THAN ?auto_3005 ?auto_3004 ) ( GREATER-THAN ?auto_3006 ?auto_3002 ) ( GREATER-THAN ?auto_3006 ?auto_3004 ) ( GREATER-THAN ?auto_3006 ?auto_3005 ) ( GREATER-THAN ?auto_3007 ?auto_3002 ) ( GREATER-THAN ?auto_3007 ?auto_3004 ) ( GREATER-THAN ?auto_3007 ?auto_3005 ) ( GREATER-THAN ?auto_3007 ?auto_3006 ) ( IN-CITY ?auto_3012 ?auto_3008 ) ( IN-CITY ?auto_3009 ?auto_3008 ) ( not ( = ?auto_3009 ?auto_3012 ) ) ( OBJ-AT ?auto_3007 ?auto_3012 ) ( IN-CITY ?auto_3009 ?auto_3011 ) ( IN-CITY ?auto_3012 ?auto_3011 ) ( IN-CITY ?auto_3030 ?auto_3033 ) ( IN-CITY ?auto_3009 ?auto_3033 ) ( not ( = ?auto_3009 ?auto_3030 ) ) ( OBJ-AT ?auto_3006 ?auto_3030 ) ( IN-CITY ?auto_3009 ?auto_3023 ) ( IN-CITY ?auto_3030 ?auto_3023 ) ( IN-CITY ?auto_3026 ?auto_3016 ) ( IN-CITY ?auto_3009 ?auto_3016 ) ( not ( = ?auto_3009 ?auto_3026 ) ) ( OBJ-AT ?auto_3005 ?auto_3026 ) ( IN-CITY ?auto_3009 ?auto_3015 ) ( IN-CITY ?auto_3026 ?auto_3015 ) ( IN-CITY ?auto_3018 ?auto_3021 ) ( IN-CITY ?auto_3009 ?auto_3021 ) ( not ( = ?auto_3009 ?auto_3018 ) ) ( OBJ-AT ?auto_3004 ?auto_3018 ) ( IN-CITY ?auto_3009 ?auto_3017 ) ( IN-CITY ?auto_3018 ?auto_3017 ) ( IN-CITY ?auto_3022 ?auto_3020 ) ( IN-CITY ?auto_3009 ?auto_3020 ) ( not ( = ?auto_3009 ?auto_3022 ) ) ( OBJ-AT ?auto_3002 ?auto_3022 ) ( TRUCK-AT ?auto_3010 ?auto_3025 ) ( IN-CITY ?auto_3025 ?auto_3019 ) ( IN-CITY ?auto_3022 ?auto_3019 ) ( not ( = ?auto_3022 ?auto_3025 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3002 ?auto_3004 ?auto_3005 ?auto_3006 ?auto_3009 )
      ( DELIVER-1PKG ?auto_3007 ?auto_3009 )
      ( DELIVER-5PKG-VERIFY ?auto_3002 ?auto_3004 ?auto_3005 ?auto_3006 ?auto_3007 ?auto_3009 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3059 - OBJ
      ?auto_3061 - OBJ
      ?auto_3062 - OBJ
      ?auto_3063 - OBJ
      ?auto_3064 - OBJ
      ?auto_3065 - OBJ
      ?auto_3069 - LOCATION
    )
    :vars
    (
      ?auto_3071 - LOCATION
      ?auto_3072 - CITY
      ?auto_3070 - CITY
      ?auto_3084 - LOCATION
      ?auto_3078 - CITY
      ?auto_3077 - CITY
      ?auto_3083 - LOCATION
      ?auto_3079 - CITY
      ?auto_3075 - CITY
      ?auto_3092 - LOCATION
      ?auto_3086 - CITY
      ?auto_3085 - CITY
      ?auto_3095 - LOCATION
      ?auto_3089 - CITY
      ?auto_3087 - CITY
      ?auto_3088 - LOCATION
      ?auto_3082 - CITY
      ?auto_3066 - TRUCK
      ?auto_3080 - LOCATION
      ?auto_3081 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3061 ?auto_3059 ) ( GREATER-THAN ?auto_3062 ?auto_3059 ) ( GREATER-THAN ?auto_3062 ?auto_3061 ) ( GREATER-THAN ?auto_3063 ?auto_3059 ) ( GREATER-THAN ?auto_3063 ?auto_3061 ) ( GREATER-THAN ?auto_3063 ?auto_3062 ) ( GREATER-THAN ?auto_3064 ?auto_3059 ) ( GREATER-THAN ?auto_3064 ?auto_3061 ) ( GREATER-THAN ?auto_3064 ?auto_3062 ) ( GREATER-THAN ?auto_3064 ?auto_3063 ) ( GREATER-THAN ?auto_3065 ?auto_3059 ) ( GREATER-THAN ?auto_3065 ?auto_3061 ) ( GREATER-THAN ?auto_3065 ?auto_3062 ) ( GREATER-THAN ?auto_3065 ?auto_3063 ) ( GREATER-THAN ?auto_3065 ?auto_3064 ) ( IN-CITY ?auto_3071 ?auto_3072 ) ( IN-CITY ?auto_3069 ?auto_3072 ) ( not ( = ?auto_3069 ?auto_3071 ) ) ( OBJ-AT ?auto_3065 ?auto_3071 ) ( IN-CITY ?auto_3069 ?auto_3070 ) ( IN-CITY ?auto_3071 ?auto_3070 ) ( IN-CITY ?auto_3084 ?auto_3078 ) ( IN-CITY ?auto_3069 ?auto_3078 ) ( not ( = ?auto_3069 ?auto_3084 ) ) ( OBJ-AT ?auto_3064 ?auto_3084 ) ( IN-CITY ?auto_3069 ?auto_3077 ) ( IN-CITY ?auto_3084 ?auto_3077 ) ( IN-CITY ?auto_3083 ?auto_3079 ) ( IN-CITY ?auto_3069 ?auto_3079 ) ( not ( = ?auto_3069 ?auto_3083 ) ) ( OBJ-AT ?auto_3063 ?auto_3083 ) ( IN-CITY ?auto_3069 ?auto_3075 ) ( IN-CITY ?auto_3083 ?auto_3075 ) ( IN-CITY ?auto_3092 ?auto_3086 ) ( IN-CITY ?auto_3069 ?auto_3086 ) ( not ( = ?auto_3069 ?auto_3092 ) ) ( OBJ-AT ?auto_3062 ?auto_3092 ) ( IN-CITY ?auto_3069 ?auto_3085 ) ( IN-CITY ?auto_3092 ?auto_3085 ) ( IN-CITY ?auto_3095 ?auto_3089 ) ( IN-CITY ?auto_3069 ?auto_3089 ) ( not ( = ?auto_3069 ?auto_3095 ) ) ( OBJ-AT ?auto_3061 ?auto_3095 ) ( IN-CITY ?auto_3069 ?auto_3087 ) ( IN-CITY ?auto_3095 ?auto_3087 ) ( IN-CITY ?auto_3088 ?auto_3082 ) ( IN-CITY ?auto_3069 ?auto_3082 ) ( not ( = ?auto_3069 ?auto_3088 ) ) ( OBJ-AT ?auto_3059 ?auto_3088 ) ( TRUCK-AT ?auto_3066 ?auto_3080 ) ( IN-CITY ?auto_3080 ?auto_3081 ) ( IN-CITY ?auto_3088 ?auto_3081 ) ( not ( = ?auto_3088 ?auto_3080 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3059 ?auto_3061 ?auto_3062 ?auto_3063 ?auto_3064 ?auto_3069 )
      ( DELIVER-1PKG ?auto_3065 ?auto_3069 )
      ( DELIVER-6PKG-VERIFY ?auto_3059 ?auto_3061 ?auto_3062 ?auto_3063 ?auto_3064 ?auto_3065 ?auto_3069 ) )
  )

)

