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
      ?auto_2972 - OBJ
      ?auto_2973 - LOCATION
    )
    :vars
    (
      ?auto_2975 - LOCATION
      ?auto_2976 - CITY
      ?auto_2974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2975 ?auto_2976 ) ( IN-CITY ?auto_2973 ?auto_2976 ) ( not ( = ?auto_2973 ?auto_2975 ) ) ( OBJ-AT ?auto_2972 ?auto_2975 ) ( TRUCK-AT ?auto_2974 ?auto_2973 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2974 ?auto_2973 ?auto_2975 ?auto_2976 )
      ( !LOAD-TRUCK ?auto_2972 ?auto_2974 ?auto_2975 )
      ( !DRIVE-TRUCK ?auto_2974 ?auto_2975 ?auto_2973 ?auto_2976 )
      ( !UNLOAD-TRUCK ?auto_2972 ?auto_2974 ?auto_2973 )
      ( DELIVER-1PKG-VERIFY ?auto_2972 ?auto_2973 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2987 - OBJ
      ?auto_2989 - OBJ
      ?auto_2988 - LOCATION
    )
    :vars
    (
      ?auto_2992 - LOCATION
      ?auto_2991 - CITY
      ?auto_2993 - LOCATION
      ?auto_2990 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2989 ?auto_2987 ) ( IN-CITY ?auto_2992 ?auto_2991 ) ( IN-CITY ?auto_2988 ?auto_2991 ) ( not ( = ?auto_2988 ?auto_2992 ) ) ( OBJ-AT ?auto_2989 ?auto_2992 ) ( IN-CITY ?auto_2993 ?auto_2991 ) ( not ( = ?auto_2988 ?auto_2993 ) ) ( OBJ-AT ?auto_2987 ?auto_2993 ) ( TRUCK-AT ?auto_2990 ?auto_2988 ) ( not ( = ?auto_2987 ?auto_2989 ) ) ( not ( = ?auto_2992 ?auto_2993 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2987 ?auto_2988 )
      ( DELIVER-1PKG ?auto_2989 ?auto_2988 )
      ( DELIVER-2PKG-VERIFY ?auto_2987 ?auto_2989 ?auto_2988 ) )
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
      ?auto_3010 - CITY
      ?auto_3013 - LOCATION
      ?auto_3012 - LOCATION
      ?auto_3009 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3007 ?auto_3005 ) ( GREATER-THAN ?auto_3008 ?auto_3005 ) ( GREATER-THAN ?auto_3008 ?auto_3007 ) ( IN-CITY ?auto_3011 ?auto_3010 ) ( IN-CITY ?auto_3006 ?auto_3010 ) ( not ( = ?auto_3006 ?auto_3011 ) ) ( OBJ-AT ?auto_3008 ?auto_3011 ) ( IN-CITY ?auto_3013 ?auto_3010 ) ( not ( = ?auto_3006 ?auto_3013 ) ) ( OBJ-AT ?auto_3007 ?auto_3013 ) ( IN-CITY ?auto_3012 ?auto_3010 ) ( not ( = ?auto_3006 ?auto_3012 ) ) ( OBJ-AT ?auto_3005 ?auto_3012 ) ( TRUCK-AT ?auto_3009 ?auto_3006 ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( not ( = ?auto_3013 ?auto_3012 ) ) ( not ( = ?auto_3005 ?auto_3008 ) ) ( not ( = ?auto_3007 ?auto_3008 ) ) ( not ( = ?auto_3011 ?auto_3013 ) ) ( not ( = ?auto_3011 ?auto_3012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3005 ?auto_3007 ?auto_3006 )
      ( DELIVER-1PKG ?auto_3008 ?auto_3006 )
      ( DELIVER-3PKG-VERIFY ?auto_3005 ?auto_3007 ?auto_3008 ?auto_3006 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3026 - OBJ
      ?auto_3028 - OBJ
      ?auto_3029 - OBJ
      ?auto_3030 - OBJ
      ?auto_3027 - LOCATION
    )
    :vars
    (
      ?auto_3032 - LOCATION
      ?auto_3031 - CITY
      ?auto_3036 - LOCATION
      ?auto_3035 - LOCATION
      ?auto_3034 - LOCATION
      ?auto_3033 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3028 ?auto_3026 ) ( GREATER-THAN ?auto_3029 ?auto_3026 ) ( GREATER-THAN ?auto_3029 ?auto_3028 ) ( GREATER-THAN ?auto_3030 ?auto_3026 ) ( GREATER-THAN ?auto_3030 ?auto_3028 ) ( GREATER-THAN ?auto_3030 ?auto_3029 ) ( IN-CITY ?auto_3032 ?auto_3031 ) ( IN-CITY ?auto_3027 ?auto_3031 ) ( not ( = ?auto_3027 ?auto_3032 ) ) ( OBJ-AT ?auto_3030 ?auto_3032 ) ( IN-CITY ?auto_3036 ?auto_3031 ) ( not ( = ?auto_3027 ?auto_3036 ) ) ( OBJ-AT ?auto_3029 ?auto_3036 ) ( IN-CITY ?auto_3035 ?auto_3031 ) ( not ( = ?auto_3027 ?auto_3035 ) ) ( OBJ-AT ?auto_3028 ?auto_3035 ) ( IN-CITY ?auto_3034 ?auto_3031 ) ( not ( = ?auto_3027 ?auto_3034 ) ) ( OBJ-AT ?auto_3026 ?auto_3034 ) ( TRUCK-AT ?auto_3033 ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3028 ) ) ( not ( = ?auto_3035 ?auto_3034 ) ) ( not ( = ?auto_3026 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( not ( = ?auto_3036 ?auto_3035 ) ) ( not ( = ?auto_3036 ?auto_3034 ) ) ( not ( = ?auto_3026 ?auto_3030 ) ) ( not ( = ?auto_3028 ?auto_3030 ) ) ( not ( = ?auto_3029 ?auto_3030 ) ) ( not ( = ?auto_3032 ?auto_3036 ) ) ( not ( = ?auto_3032 ?auto_3035 ) ) ( not ( = ?auto_3032 ?auto_3034 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3026 ?auto_3028 ?auto_3029 ?auto_3027 )
      ( DELIVER-1PKG ?auto_3030 ?auto_3027 )
      ( DELIVER-4PKG-VERIFY ?auto_3026 ?auto_3028 ?auto_3029 ?auto_3030 ?auto_3027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3050 - OBJ
      ?auto_3052 - OBJ
      ?auto_3053 - OBJ
      ?auto_3054 - OBJ
      ?auto_3055 - OBJ
      ?auto_3051 - LOCATION
    )
    :vars
    (
      ?auto_3056 - LOCATION
      ?auto_3057 - CITY
      ?auto_3059 - LOCATION
      ?auto_3060 - LOCATION
      ?auto_3062 - LOCATION
      ?auto_3061 - LOCATION
      ?auto_3058 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3052 ?auto_3050 ) ( GREATER-THAN ?auto_3053 ?auto_3050 ) ( GREATER-THAN ?auto_3053 ?auto_3052 ) ( GREATER-THAN ?auto_3054 ?auto_3050 ) ( GREATER-THAN ?auto_3054 ?auto_3052 ) ( GREATER-THAN ?auto_3054 ?auto_3053 ) ( GREATER-THAN ?auto_3055 ?auto_3050 ) ( GREATER-THAN ?auto_3055 ?auto_3052 ) ( GREATER-THAN ?auto_3055 ?auto_3053 ) ( GREATER-THAN ?auto_3055 ?auto_3054 ) ( IN-CITY ?auto_3056 ?auto_3057 ) ( IN-CITY ?auto_3051 ?auto_3057 ) ( not ( = ?auto_3051 ?auto_3056 ) ) ( OBJ-AT ?auto_3055 ?auto_3056 ) ( IN-CITY ?auto_3059 ?auto_3057 ) ( not ( = ?auto_3051 ?auto_3059 ) ) ( OBJ-AT ?auto_3054 ?auto_3059 ) ( IN-CITY ?auto_3060 ?auto_3057 ) ( not ( = ?auto_3051 ?auto_3060 ) ) ( OBJ-AT ?auto_3053 ?auto_3060 ) ( IN-CITY ?auto_3062 ?auto_3057 ) ( not ( = ?auto_3051 ?auto_3062 ) ) ( OBJ-AT ?auto_3052 ?auto_3062 ) ( IN-CITY ?auto_3061 ?auto_3057 ) ( not ( = ?auto_3051 ?auto_3061 ) ) ( OBJ-AT ?auto_3050 ?auto_3061 ) ( TRUCK-AT ?auto_3058 ?auto_3051 ) ( not ( = ?auto_3050 ?auto_3052 ) ) ( not ( = ?auto_3062 ?auto_3061 ) ) ( not ( = ?auto_3050 ?auto_3053 ) ) ( not ( = ?auto_3052 ?auto_3053 ) ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3050 ?auto_3054 ) ) ( not ( = ?auto_3052 ?auto_3054 ) ) ( not ( = ?auto_3053 ?auto_3054 ) ) ( not ( = ?auto_3059 ?auto_3060 ) ) ( not ( = ?auto_3059 ?auto_3062 ) ) ( not ( = ?auto_3059 ?auto_3061 ) ) ( not ( = ?auto_3050 ?auto_3055 ) ) ( not ( = ?auto_3052 ?auto_3055 ) ) ( not ( = ?auto_3053 ?auto_3055 ) ) ( not ( = ?auto_3054 ?auto_3055 ) ) ( not ( = ?auto_3056 ?auto_3059 ) ) ( not ( = ?auto_3056 ?auto_3060 ) ) ( not ( = ?auto_3056 ?auto_3062 ) ) ( not ( = ?auto_3056 ?auto_3061 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3050 ?auto_3052 ?auto_3053 ?auto_3054 ?auto_3051 )
      ( DELIVER-1PKG ?auto_3055 ?auto_3051 )
      ( DELIVER-5PKG-VERIFY ?auto_3050 ?auto_3052 ?auto_3053 ?auto_3054 ?auto_3055 ?auto_3051 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3077 - OBJ
      ?auto_3079 - OBJ
      ?auto_3080 - OBJ
      ?auto_3081 - OBJ
      ?auto_3082 - OBJ
      ?auto_3083 - OBJ
      ?auto_3078 - LOCATION
    )
    :vars
    (
      ?auto_3085 - LOCATION
      ?auto_3086 - CITY
      ?auto_3090 - LOCATION
      ?auto_3089 - LOCATION
      ?auto_3088 - LOCATION
      ?auto_3087 - LOCATION
      ?auto_3084 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3079 ?auto_3077 ) ( GREATER-THAN ?auto_3080 ?auto_3077 ) ( GREATER-THAN ?auto_3080 ?auto_3079 ) ( GREATER-THAN ?auto_3081 ?auto_3077 ) ( GREATER-THAN ?auto_3081 ?auto_3079 ) ( GREATER-THAN ?auto_3081 ?auto_3080 ) ( GREATER-THAN ?auto_3082 ?auto_3077 ) ( GREATER-THAN ?auto_3082 ?auto_3079 ) ( GREATER-THAN ?auto_3082 ?auto_3080 ) ( GREATER-THAN ?auto_3082 ?auto_3081 ) ( GREATER-THAN ?auto_3083 ?auto_3077 ) ( GREATER-THAN ?auto_3083 ?auto_3079 ) ( GREATER-THAN ?auto_3083 ?auto_3080 ) ( GREATER-THAN ?auto_3083 ?auto_3081 ) ( GREATER-THAN ?auto_3083 ?auto_3082 ) ( IN-CITY ?auto_3085 ?auto_3086 ) ( IN-CITY ?auto_3078 ?auto_3086 ) ( not ( = ?auto_3078 ?auto_3085 ) ) ( OBJ-AT ?auto_3083 ?auto_3085 ) ( IN-CITY ?auto_3090 ?auto_3086 ) ( not ( = ?auto_3078 ?auto_3090 ) ) ( OBJ-AT ?auto_3082 ?auto_3090 ) ( IN-CITY ?auto_3089 ?auto_3086 ) ( not ( = ?auto_3078 ?auto_3089 ) ) ( OBJ-AT ?auto_3081 ?auto_3089 ) ( IN-CITY ?auto_3088 ?auto_3086 ) ( not ( = ?auto_3078 ?auto_3088 ) ) ( OBJ-AT ?auto_3080 ?auto_3088 ) ( OBJ-AT ?auto_3079 ?auto_3085 ) ( IN-CITY ?auto_3087 ?auto_3086 ) ( not ( = ?auto_3078 ?auto_3087 ) ) ( OBJ-AT ?auto_3077 ?auto_3087 ) ( TRUCK-AT ?auto_3084 ?auto_3078 ) ( not ( = ?auto_3077 ?auto_3079 ) ) ( not ( = ?auto_3085 ?auto_3087 ) ) ( not ( = ?auto_3077 ?auto_3080 ) ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( not ( = ?auto_3088 ?auto_3085 ) ) ( not ( = ?auto_3088 ?auto_3087 ) ) ( not ( = ?auto_3077 ?auto_3081 ) ) ( not ( = ?auto_3079 ?auto_3081 ) ) ( not ( = ?auto_3080 ?auto_3081 ) ) ( not ( = ?auto_3089 ?auto_3088 ) ) ( not ( = ?auto_3089 ?auto_3085 ) ) ( not ( = ?auto_3089 ?auto_3087 ) ) ( not ( = ?auto_3077 ?auto_3082 ) ) ( not ( = ?auto_3079 ?auto_3082 ) ) ( not ( = ?auto_3080 ?auto_3082 ) ) ( not ( = ?auto_3081 ?auto_3082 ) ) ( not ( = ?auto_3090 ?auto_3089 ) ) ( not ( = ?auto_3090 ?auto_3088 ) ) ( not ( = ?auto_3090 ?auto_3085 ) ) ( not ( = ?auto_3090 ?auto_3087 ) ) ( not ( = ?auto_3077 ?auto_3083 ) ) ( not ( = ?auto_3079 ?auto_3083 ) ) ( not ( = ?auto_3080 ?auto_3083 ) ) ( not ( = ?auto_3081 ?auto_3083 ) ) ( not ( = ?auto_3082 ?auto_3083 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3077 ?auto_3079 ?auto_3080 ?auto_3081 ?auto_3082 ?auto_3078 )
      ( DELIVER-1PKG ?auto_3083 ?auto_3078 )
      ( DELIVER-6PKG-VERIFY ?auto_3077 ?auto_3079 ?auto_3080 ?auto_3081 ?auto_3082 ?auto_3083 ?auto_3078 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_3106 - OBJ
      ?auto_3108 - OBJ
      ?auto_3109 - OBJ
      ?auto_3110 - OBJ
      ?auto_3111 - OBJ
      ?auto_3112 - OBJ
      ?auto_3113 - OBJ
      ?auto_3107 - LOCATION
    )
    :vars
    (
      ?auto_3115 - LOCATION
      ?auto_3116 - CITY
      ?auto_3118 - LOCATION
      ?auto_3121 - LOCATION
      ?auto_3120 - LOCATION
      ?auto_3117 - LOCATION
      ?auto_3119 - LOCATION
      ?auto_3114 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3108 ?auto_3106 ) ( GREATER-THAN ?auto_3109 ?auto_3106 ) ( GREATER-THAN ?auto_3109 ?auto_3108 ) ( GREATER-THAN ?auto_3110 ?auto_3106 ) ( GREATER-THAN ?auto_3110 ?auto_3108 ) ( GREATER-THAN ?auto_3110 ?auto_3109 ) ( GREATER-THAN ?auto_3111 ?auto_3106 ) ( GREATER-THAN ?auto_3111 ?auto_3108 ) ( GREATER-THAN ?auto_3111 ?auto_3109 ) ( GREATER-THAN ?auto_3111 ?auto_3110 ) ( GREATER-THAN ?auto_3112 ?auto_3106 ) ( GREATER-THAN ?auto_3112 ?auto_3108 ) ( GREATER-THAN ?auto_3112 ?auto_3109 ) ( GREATER-THAN ?auto_3112 ?auto_3110 ) ( GREATER-THAN ?auto_3112 ?auto_3111 ) ( GREATER-THAN ?auto_3113 ?auto_3106 ) ( GREATER-THAN ?auto_3113 ?auto_3108 ) ( GREATER-THAN ?auto_3113 ?auto_3109 ) ( GREATER-THAN ?auto_3113 ?auto_3110 ) ( GREATER-THAN ?auto_3113 ?auto_3111 ) ( GREATER-THAN ?auto_3113 ?auto_3112 ) ( IN-CITY ?auto_3115 ?auto_3116 ) ( IN-CITY ?auto_3107 ?auto_3116 ) ( not ( = ?auto_3107 ?auto_3115 ) ) ( OBJ-AT ?auto_3113 ?auto_3115 ) ( IN-CITY ?auto_3118 ?auto_3116 ) ( not ( = ?auto_3107 ?auto_3118 ) ) ( OBJ-AT ?auto_3112 ?auto_3118 ) ( IN-CITY ?auto_3121 ?auto_3116 ) ( not ( = ?auto_3107 ?auto_3121 ) ) ( OBJ-AT ?auto_3111 ?auto_3121 ) ( IN-CITY ?auto_3120 ?auto_3116 ) ( not ( = ?auto_3107 ?auto_3120 ) ) ( OBJ-AT ?auto_3110 ?auto_3120 ) ( IN-CITY ?auto_3117 ?auto_3116 ) ( not ( = ?auto_3107 ?auto_3117 ) ) ( OBJ-AT ?auto_3109 ?auto_3117 ) ( OBJ-AT ?auto_3108 ?auto_3118 ) ( IN-CITY ?auto_3119 ?auto_3116 ) ( not ( = ?auto_3107 ?auto_3119 ) ) ( OBJ-AT ?auto_3106 ?auto_3119 ) ( TRUCK-AT ?auto_3114 ?auto_3107 ) ( not ( = ?auto_3106 ?auto_3108 ) ) ( not ( = ?auto_3118 ?auto_3119 ) ) ( not ( = ?auto_3106 ?auto_3109 ) ) ( not ( = ?auto_3108 ?auto_3109 ) ) ( not ( = ?auto_3117 ?auto_3118 ) ) ( not ( = ?auto_3117 ?auto_3119 ) ) ( not ( = ?auto_3106 ?auto_3110 ) ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3110 ) ) ( not ( = ?auto_3120 ?auto_3117 ) ) ( not ( = ?auto_3120 ?auto_3118 ) ) ( not ( = ?auto_3120 ?auto_3119 ) ) ( not ( = ?auto_3106 ?auto_3111 ) ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( not ( = ?auto_3121 ?auto_3120 ) ) ( not ( = ?auto_3121 ?auto_3117 ) ) ( not ( = ?auto_3121 ?auto_3118 ) ) ( not ( = ?auto_3121 ?auto_3119 ) ) ( not ( = ?auto_3106 ?auto_3112 ) ) ( not ( = ?auto_3108 ?auto_3112 ) ) ( not ( = ?auto_3109 ?auto_3112 ) ) ( not ( = ?auto_3110 ?auto_3112 ) ) ( not ( = ?auto_3111 ?auto_3112 ) ) ( not ( = ?auto_3106 ?auto_3113 ) ) ( not ( = ?auto_3108 ?auto_3113 ) ) ( not ( = ?auto_3109 ?auto_3113 ) ) ( not ( = ?auto_3110 ?auto_3113 ) ) ( not ( = ?auto_3111 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3115 ?auto_3118 ) ) ( not ( = ?auto_3115 ?auto_3121 ) ) ( not ( = ?auto_3115 ?auto_3120 ) ) ( not ( = ?auto_3115 ?auto_3117 ) ) ( not ( = ?auto_3115 ?auto_3119 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3106 ?auto_3108 ?auto_3109 ?auto_3110 ?auto_3111 ?auto_3112 ?auto_3107 )
      ( DELIVER-1PKG ?auto_3113 ?auto_3107 )
      ( DELIVER-7PKG-VERIFY ?auto_3106 ?auto_3108 ?auto_3109 ?auto_3110 ?auto_3111 ?auto_3112 ?auto_3113 ?auto_3107 ) )
  )

  ( :method DELIVER-8PKG
    :parameters
    (
      ?auto_3138 - OBJ
      ?auto_3140 - OBJ
      ?auto_3141 - OBJ
      ?auto_3142 - OBJ
      ?auto_3143 - OBJ
      ?auto_3145 - OBJ
      ?auto_3146 - OBJ
      ?auto_3144 - OBJ
      ?auto_3139 - LOCATION
    )
    :vars
    (
      ?auto_3148 - LOCATION
      ?auto_3147 - CITY
      ?auto_3150 - LOCATION
      ?auto_3154 - LOCATION
      ?auto_3155 - LOCATION
      ?auto_3153 - LOCATION
      ?auto_3151 - LOCATION
      ?auto_3152 - LOCATION
      ?auto_3149 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3140 ?auto_3138 ) ( GREATER-THAN ?auto_3141 ?auto_3138 ) ( GREATER-THAN ?auto_3141 ?auto_3140 ) ( GREATER-THAN ?auto_3142 ?auto_3138 ) ( GREATER-THAN ?auto_3142 ?auto_3140 ) ( GREATER-THAN ?auto_3142 ?auto_3141 ) ( GREATER-THAN ?auto_3143 ?auto_3138 ) ( GREATER-THAN ?auto_3143 ?auto_3140 ) ( GREATER-THAN ?auto_3143 ?auto_3141 ) ( GREATER-THAN ?auto_3143 ?auto_3142 ) ( GREATER-THAN ?auto_3145 ?auto_3138 ) ( GREATER-THAN ?auto_3145 ?auto_3140 ) ( GREATER-THAN ?auto_3145 ?auto_3141 ) ( GREATER-THAN ?auto_3145 ?auto_3142 ) ( GREATER-THAN ?auto_3145 ?auto_3143 ) ( GREATER-THAN ?auto_3146 ?auto_3138 ) ( GREATER-THAN ?auto_3146 ?auto_3140 ) ( GREATER-THAN ?auto_3146 ?auto_3141 ) ( GREATER-THAN ?auto_3146 ?auto_3142 ) ( GREATER-THAN ?auto_3146 ?auto_3143 ) ( GREATER-THAN ?auto_3146 ?auto_3145 ) ( GREATER-THAN ?auto_3144 ?auto_3138 ) ( GREATER-THAN ?auto_3144 ?auto_3140 ) ( GREATER-THAN ?auto_3144 ?auto_3141 ) ( GREATER-THAN ?auto_3144 ?auto_3142 ) ( GREATER-THAN ?auto_3144 ?auto_3143 ) ( GREATER-THAN ?auto_3144 ?auto_3145 ) ( GREATER-THAN ?auto_3144 ?auto_3146 ) ( IN-CITY ?auto_3148 ?auto_3147 ) ( IN-CITY ?auto_3139 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3148 ) ) ( OBJ-AT ?auto_3144 ?auto_3148 ) ( IN-CITY ?auto_3150 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3150 ) ) ( OBJ-AT ?auto_3146 ?auto_3150 ) ( IN-CITY ?auto_3154 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3154 ) ) ( OBJ-AT ?auto_3145 ?auto_3154 ) ( IN-CITY ?auto_3155 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3155 ) ) ( OBJ-AT ?auto_3143 ?auto_3155 ) ( IN-CITY ?auto_3153 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3153 ) ) ( OBJ-AT ?auto_3142 ?auto_3153 ) ( IN-CITY ?auto_3151 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3151 ) ) ( OBJ-AT ?auto_3141 ?auto_3151 ) ( OBJ-AT ?auto_3140 ?auto_3154 ) ( IN-CITY ?auto_3152 ?auto_3147 ) ( not ( = ?auto_3139 ?auto_3152 ) ) ( OBJ-AT ?auto_3138 ?auto_3152 ) ( TRUCK-AT ?auto_3149 ?auto_3139 ) ( not ( = ?auto_3138 ?auto_3140 ) ) ( not ( = ?auto_3154 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3151 ?auto_3154 ) ) ( not ( = ?auto_3151 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3142 ) ) ( not ( = ?auto_3140 ?auto_3142 ) ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3153 ?auto_3151 ) ) ( not ( = ?auto_3153 ?auto_3154 ) ) ( not ( = ?auto_3153 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3143 ) ) ( not ( = ?auto_3140 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3155 ?auto_3153 ) ) ( not ( = ?auto_3155 ?auto_3151 ) ) ( not ( = ?auto_3155 ?auto_3154 ) ) ( not ( = ?auto_3155 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3145 ) ) ( not ( = ?auto_3140 ?auto_3145 ) ) ( not ( = ?auto_3141 ?auto_3145 ) ) ( not ( = ?auto_3142 ?auto_3145 ) ) ( not ( = ?auto_3143 ?auto_3145 ) ) ( not ( = ?auto_3138 ?auto_3146 ) ) ( not ( = ?auto_3140 ?auto_3146 ) ) ( not ( = ?auto_3141 ?auto_3146 ) ) ( not ( = ?auto_3142 ?auto_3146 ) ) ( not ( = ?auto_3143 ?auto_3146 ) ) ( not ( = ?auto_3145 ?auto_3146 ) ) ( not ( = ?auto_3150 ?auto_3154 ) ) ( not ( = ?auto_3150 ?auto_3155 ) ) ( not ( = ?auto_3150 ?auto_3153 ) ) ( not ( = ?auto_3150 ?auto_3151 ) ) ( not ( = ?auto_3150 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3144 ) ) ( not ( = ?auto_3140 ?auto_3144 ) ) ( not ( = ?auto_3141 ?auto_3144 ) ) ( not ( = ?auto_3142 ?auto_3144 ) ) ( not ( = ?auto_3143 ?auto_3144 ) ) ( not ( = ?auto_3145 ?auto_3144 ) ) ( not ( = ?auto_3146 ?auto_3144 ) ) ( not ( = ?auto_3148 ?auto_3150 ) ) ( not ( = ?auto_3148 ?auto_3154 ) ) ( not ( = ?auto_3148 ?auto_3155 ) ) ( not ( = ?auto_3148 ?auto_3153 ) ) ( not ( = ?auto_3148 ?auto_3151 ) ) ( not ( = ?auto_3148 ?auto_3152 ) ) )
    :subtasks
    ( ( DELIVER-7PKG ?auto_3138 ?auto_3140 ?auto_3141 ?auto_3142 ?auto_3143 ?auto_3145 ?auto_3146 ?auto_3139 )
      ( DELIVER-1PKG ?auto_3144 ?auto_3139 )
      ( DELIVER-8PKG-VERIFY ?auto_3138 ?auto_3140 ?auto_3141 ?auto_3142 ?auto_3143 ?auto_3145 ?auto_3146 ?auto_3144 ?auto_3139 ) )
  )

)

