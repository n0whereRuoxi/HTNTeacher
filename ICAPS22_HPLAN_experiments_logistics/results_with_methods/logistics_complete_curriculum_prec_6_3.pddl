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
      ?auto_2920 - OBJ
      ?auto_2921 - LOCATION
    )
    :vars
    (
      ?auto_2922 - TRUCK
      ?auto_2923 - LOCATION
      ?auto_2924 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2922 ?auto_2923 ) ( IN-CITY ?auto_2923 ?auto_2924 ) ( IN-CITY ?auto_2921 ?auto_2924 ) ( not ( = ?auto_2921 ?auto_2923 ) ) ( OBJ-AT ?auto_2920 ?auto_2923 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2920 ?auto_2922 ?auto_2923 )
      ( !DRIVE-TRUCK ?auto_2922 ?auto_2923 ?auto_2921 ?auto_2924 )
      ( !UNLOAD-TRUCK ?auto_2920 ?auto_2922 ?auto_2921 )
      ( DELIVER-1PKG-VERIFY ?auto_2920 ?auto_2921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2927 - OBJ
      ?auto_2928 - LOCATION
    )
    :vars
    (
      ?auto_2929 - LOCATION
      ?auto_2930 - CITY
      ?auto_2931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2929 ?auto_2930 ) ( IN-CITY ?auto_2928 ?auto_2930 ) ( not ( = ?auto_2928 ?auto_2929 ) ) ( OBJ-AT ?auto_2927 ?auto_2929 ) ( TRUCK-AT ?auto_2931 ?auto_2928 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2931 ?auto_2928 ?auto_2929 ?auto_2930 )
      ( DELIVER-1PKG ?auto_2927 ?auto_2928 )
      ( DELIVER-1PKG-VERIFY ?auto_2927 ?auto_2928 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2934 - OBJ
      ?auto_2935 - LOCATION
    )
    :vars
    (
      ?auto_2936 - TRUCK
      ?auto_2937 - LOCATION
      ?auto_2938 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2936 ?auto_2937 ) ( IN-CITY ?auto_2937 ?auto_2938 ) ( IN-CITY ?auto_2935 ?auto_2938 ) ( not ( = ?auto_2935 ?auto_2937 ) ) ( OBJ-AT ?auto_2934 ?auto_2937 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2934 ?auto_2936 ?auto_2937 )
      ( !DRIVE-TRUCK ?auto_2936 ?auto_2937 ?auto_2935 ?auto_2938 )
      ( !UNLOAD-TRUCK ?auto_2934 ?auto_2936 ?auto_2935 )
      ( DELIVER-1PKG-VERIFY ?auto_2934 ?auto_2935 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2941 - OBJ
      ?auto_2942 - LOCATION
    )
    :vars
    (
      ?auto_2945 - LOCATION
      ?auto_2944 - CITY
      ?auto_2943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2945 ?auto_2944 ) ( IN-CITY ?auto_2942 ?auto_2944 ) ( not ( = ?auto_2942 ?auto_2945 ) ) ( OBJ-AT ?auto_2941 ?auto_2945 ) ( TRUCK-AT ?auto_2943 ?auto_2942 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2943 ?auto_2942 ?auto_2945 ?auto_2944 )
      ( DELIVER-1PKG ?auto_2941 ?auto_2942 )
      ( DELIVER-1PKG-VERIFY ?auto_2941 ?auto_2942 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2949 - OBJ
      ?auto_2951 - OBJ
      ?auto_2950 - LOCATION
    )
    :vars
    (
      ?auto_2953 - LOCATION
      ?auto_2954 - CITY
      ?auto_2952 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2951 ?auto_2949 ) ( IN-CITY ?auto_2953 ?auto_2954 ) ( IN-CITY ?auto_2950 ?auto_2954 ) ( not ( = ?auto_2950 ?auto_2953 ) ) ( OBJ-AT ?auto_2951 ?auto_2953 ) ( TRUCK-AT ?auto_2952 ?auto_2953 ) ( OBJ-AT ?auto_2949 ?auto_2953 ) ( not ( = ?auto_2949 ?auto_2951 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2949 ?auto_2950 )
      ( DELIVER-1PKG ?auto_2951 ?auto_2950 )
      ( DELIVER-2PKG-VERIFY ?auto_2949 ?auto_2951 ?auto_2950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2958 - OBJ
      ?auto_2960 - OBJ
      ?auto_2959 - LOCATION
    )
    :vars
    (
      ?auto_2963 - LOCATION
      ?auto_2962 - CITY
      ?auto_2961 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2960 ?auto_2958 ) ( IN-CITY ?auto_2963 ?auto_2962 ) ( IN-CITY ?auto_2959 ?auto_2962 ) ( not ( = ?auto_2959 ?auto_2963 ) ) ( OBJ-AT ?auto_2960 ?auto_2963 ) ( OBJ-AT ?auto_2958 ?auto_2963 ) ( not ( = ?auto_2958 ?auto_2960 ) ) ( TRUCK-AT ?auto_2961 ?auto_2959 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2961 ?auto_2959 ?auto_2963 ?auto_2962 )
      ( DELIVER-2PKG ?auto_2958 ?auto_2960 ?auto_2959 )
      ( DELIVER-2PKG-VERIFY ?auto_2958 ?auto_2960 ?auto_2959 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2966 - OBJ
      ?auto_2967 - LOCATION
    )
    :vars
    (
      ?auto_2968 - TRUCK
      ?auto_2969 - LOCATION
      ?auto_2970 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2968 ?auto_2969 ) ( IN-CITY ?auto_2969 ?auto_2970 ) ( IN-CITY ?auto_2967 ?auto_2970 ) ( not ( = ?auto_2967 ?auto_2969 ) ) ( OBJ-AT ?auto_2966 ?auto_2969 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2966 ?auto_2968 ?auto_2969 )
      ( !DRIVE-TRUCK ?auto_2968 ?auto_2969 ?auto_2967 ?auto_2970 )
      ( !UNLOAD-TRUCK ?auto_2966 ?auto_2968 ?auto_2967 )
      ( DELIVER-1PKG-VERIFY ?auto_2966 ?auto_2967 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2973 - OBJ
      ?auto_2974 - LOCATION
    )
    :vars
    (
      ?auto_2975 - LOCATION
      ?auto_2976 - CITY
      ?auto_2977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2975 ?auto_2976 ) ( IN-CITY ?auto_2974 ?auto_2976 ) ( not ( = ?auto_2974 ?auto_2975 ) ) ( OBJ-AT ?auto_2973 ?auto_2975 ) ( TRUCK-AT ?auto_2977 ?auto_2974 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2977 ?auto_2974 ?auto_2975 ?auto_2976 )
      ( DELIVER-1PKG ?auto_2973 ?auto_2974 )
      ( DELIVER-1PKG-VERIFY ?auto_2973 ?auto_2974 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2982 - OBJ
      ?auto_2984 - OBJ
      ?auto_2985 - OBJ
      ?auto_2983 - LOCATION
    )
    :vars
    (
      ?auto_2988 - LOCATION
      ?auto_2986 - CITY
      ?auto_2989 - LOCATION
      ?auto_2987 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2984 ?auto_2982 ) ( GREATER-THAN ?auto_2985 ?auto_2982 ) ( GREATER-THAN ?auto_2985 ?auto_2984 ) ( IN-CITY ?auto_2988 ?auto_2986 ) ( IN-CITY ?auto_2983 ?auto_2986 ) ( not ( = ?auto_2983 ?auto_2988 ) ) ( OBJ-AT ?auto_2985 ?auto_2988 ) ( IN-CITY ?auto_2989 ?auto_2986 ) ( not ( = ?auto_2983 ?auto_2989 ) ) ( OBJ-AT ?auto_2984 ?auto_2989 ) ( TRUCK-AT ?auto_2987 ?auto_2989 ) ( OBJ-AT ?auto_2982 ?auto_2989 ) ( not ( = ?auto_2982 ?auto_2984 ) ) ( not ( = ?auto_2982 ?auto_2985 ) ) ( not ( = ?auto_2984 ?auto_2985 ) ) ( not ( = ?auto_2988 ?auto_2989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2982 ?auto_2984 ?auto_2983 )
      ( DELIVER-1PKG ?auto_2985 ?auto_2983 )
      ( DELIVER-3PKG-VERIFY ?auto_2982 ?auto_2984 ?auto_2985 ?auto_2983 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2994 - OBJ
      ?auto_2996 - OBJ
      ?auto_2997 - OBJ
      ?auto_2995 - LOCATION
    )
    :vars
    (
      ?auto_3001 - LOCATION
      ?auto_2999 - CITY
      ?auto_3000 - LOCATION
      ?auto_2998 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2996 ?auto_2994 ) ( GREATER-THAN ?auto_2997 ?auto_2994 ) ( GREATER-THAN ?auto_2997 ?auto_2996 ) ( IN-CITY ?auto_3001 ?auto_2999 ) ( IN-CITY ?auto_2995 ?auto_2999 ) ( not ( = ?auto_2995 ?auto_3001 ) ) ( OBJ-AT ?auto_2997 ?auto_3001 ) ( IN-CITY ?auto_3000 ?auto_2999 ) ( not ( = ?auto_2995 ?auto_3000 ) ) ( OBJ-AT ?auto_2996 ?auto_3000 ) ( OBJ-AT ?auto_2994 ?auto_3000 ) ( not ( = ?auto_2994 ?auto_2996 ) ) ( not ( = ?auto_2994 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_3001 ?auto_3000 ) ) ( TRUCK-AT ?auto_2998 ?auto_2995 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2998 ?auto_2995 ?auto_3000 ?auto_2999 )
      ( DELIVER-3PKG ?auto_2994 ?auto_2996 ?auto_2997 ?auto_2995 )
      ( DELIVER-3PKG-VERIFY ?auto_2994 ?auto_2996 ?auto_2997 ?auto_2995 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3004 - OBJ
      ?auto_3005 - LOCATION
    )
    :vars
    (
      ?auto_3006 - TRUCK
      ?auto_3007 - LOCATION
      ?auto_3008 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3006 ?auto_3007 ) ( IN-CITY ?auto_3007 ?auto_3008 ) ( IN-CITY ?auto_3005 ?auto_3008 ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( OBJ-AT ?auto_3004 ?auto_3007 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3004 ?auto_3006 ?auto_3007 )
      ( !DRIVE-TRUCK ?auto_3006 ?auto_3007 ?auto_3005 ?auto_3008 )
      ( !UNLOAD-TRUCK ?auto_3004 ?auto_3006 ?auto_3005 )
      ( DELIVER-1PKG-VERIFY ?auto_3004 ?auto_3005 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3011 - OBJ
      ?auto_3012 - LOCATION
    )
    :vars
    (
      ?auto_3015 - LOCATION
      ?auto_3013 - CITY
      ?auto_3014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3015 ?auto_3013 ) ( IN-CITY ?auto_3012 ?auto_3013 ) ( not ( = ?auto_3012 ?auto_3015 ) ) ( OBJ-AT ?auto_3011 ?auto_3015 ) ( TRUCK-AT ?auto_3014 ?auto_3012 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3014 ?auto_3012 ?auto_3015 ?auto_3013 )
      ( DELIVER-1PKG ?auto_3011 ?auto_3012 )
      ( DELIVER-1PKG-VERIFY ?auto_3011 ?auto_3012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3021 - OBJ
      ?auto_3023 - OBJ
      ?auto_3024 - OBJ
      ?auto_3025 - OBJ
      ?auto_3022 - LOCATION
    )
    :vars
    (
      ?auto_3026 - LOCATION
      ?auto_3028 - CITY
      ?auto_3030 - LOCATION
      ?auto_3029 - LOCATION
      ?auto_3027 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3023 ?auto_3021 ) ( GREATER-THAN ?auto_3024 ?auto_3021 ) ( GREATER-THAN ?auto_3024 ?auto_3023 ) ( GREATER-THAN ?auto_3025 ?auto_3021 ) ( GREATER-THAN ?auto_3025 ?auto_3023 ) ( GREATER-THAN ?auto_3025 ?auto_3024 ) ( IN-CITY ?auto_3026 ?auto_3028 ) ( IN-CITY ?auto_3022 ?auto_3028 ) ( not ( = ?auto_3022 ?auto_3026 ) ) ( OBJ-AT ?auto_3025 ?auto_3026 ) ( IN-CITY ?auto_3030 ?auto_3028 ) ( not ( = ?auto_3022 ?auto_3030 ) ) ( OBJ-AT ?auto_3024 ?auto_3030 ) ( IN-CITY ?auto_3029 ?auto_3028 ) ( not ( = ?auto_3022 ?auto_3029 ) ) ( OBJ-AT ?auto_3023 ?auto_3029 ) ( TRUCK-AT ?auto_3027 ?auto_3029 ) ( OBJ-AT ?auto_3021 ?auto_3029 ) ( not ( = ?auto_3021 ?auto_3023 ) ) ( not ( = ?auto_3021 ?auto_3024 ) ) ( not ( = ?auto_3023 ?auto_3024 ) ) ( not ( = ?auto_3030 ?auto_3029 ) ) ( not ( = ?auto_3021 ?auto_3025 ) ) ( not ( = ?auto_3023 ?auto_3025 ) ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( not ( = ?auto_3026 ?auto_3030 ) ) ( not ( = ?auto_3026 ?auto_3029 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3021 ?auto_3023 ?auto_3024 ?auto_3022 )
      ( DELIVER-1PKG ?auto_3025 ?auto_3022 )
      ( DELIVER-4PKG-VERIFY ?auto_3021 ?auto_3023 ?auto_3024 ?auto_3025 ?auto_3022 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3036 - OBJ
      ?auto_3038 - OBJ
      ?auto_3039 - OBJ
      ?auto_3040 - OBJ
      ?auto_3037 - LOCATION
    )
    :vars
    (
      ?auto_3041 - LOCATION
      ?auto_3045 - CITY
      ?auto_3044 - LOCATION
      ?auto_3043 - LOCATION
      ?auto_3042 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3038 ?auto_3036 ) ( GREATER-THAN ?auto_3039 ?auto_3036 ) ( GREATER-THAN ?auto_3039 ?auto_3038 ) ( GREATER-THAN ?auto_3040 ?auto_3036 ) ( GREATER-THAN ?auto_3040 ?auto_3038 ) ( GREATER-THAN ?auto_3040 ?auto_3039 ) ( IN-CITY ?auto_3041 ?auto_3045 ) ( IN-CITY ?auto_3037 ?auto_3045 ) ( not ( = ?auto_3037 ?auto_3041 ) ) ( OBJ-AT ?auto_3040 ?auto_3041 ) ( IN-CITY ?auto_3044 ?auto_3045 ) ( not ( = ?auto_3037 ?auto_3044 ) ) ( OBJ-AT ?auto_3039 ?auto_3044 ) ( IN-CITY ?auto_3043 ?auto_3045 ) ( not ( = ?auto_3037 ?auto_3043 ) ) ( OBJ-AT ?auto_3038 ?auto_3043 ) ( OBJ-AT ?auto_3036 ?auto_3043 ) ( not ( = ?auto_3036 ?auto_3038 ) ) ( not ( = ?auto_3036 ?auto_3039 ) ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( not ( = ?auto_3044 ?auto_3043 ) ) ( not ( = ?auto_3036 ?auto_3040 ) ) ( not ( = ?auto_3038 ?auto_3040 ) ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( not ( = ?auto_3041 ?auto_3044 ) ) ( not ( = ?auto_3041 ?auto_3043 ) ) ( TRUCK-AT ?auto_3042 ?auto_3037 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3042 ?auto_3037 ?auto_3043 ?auto_3045 )
      ( DELIVER-4PKG ?auto_3036 ?auto_3038 ?auto_3039 ?auto_3040 ?auto_3037 )
      ( DELIVER-4PKG-VERIFY ?auto_3036 ?auto_3038 ?auto_3039 ?auto_3040 ?auto_3037 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3048 - OBJ
      ?auto_3049 - LOCATION
    )
    :vars
    (
      ?auto_3050 - TRUCK
      ?auto_3051 - LOCATION
      ?auto_3052 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3050 ?auto_3051 ) ( IN-CITY ?auto_3051 ?auto_3052 ) ( IN-CITY ?auto_3049 ?auto_3052 ) ( not ( = ?auto_3049 ?auto_3051 ) ) ( OBJ-AT ?auto_3048 ?auto_3051 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3048 ?auto_3050 ?auto_3051 )
      ( !DRIVE-TRUCK ?auto_3050 ?auto_3051 ?auto_3049 ?auto_3052 )
      ( !UNLOAD-TRUCK ?auto_3048 ?auto_3050 ?auto_3049 )
      ( DELIVER-1PKG-VERIFY ?auto_3048 ?auto_3049 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3055 - OBJ
      ?auto_3056 - LOCATION
    )
    :vars
    (
      ?auto_3058 - LOCATION
      ?auto_3059 - CITY
      ?auto_3057 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3058 ?auto_3059 ) ( IN-CITY ?auto_3056 ?auto_3059 ) ( not ( = ?auto_3056 ?auto_3058 ) ) ( OBJ-AT ?auto_3055 ?auto_3058 ) ( TRUCK-AT ?auto_3057 ?auto_3056 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3057 ?auto_3056 ?auto_3058 ?auto_3059 )
      ( DELIVER-1PKG ?auto_3055 ?auto_3056 )
      ( DELIVER-1PKG-VERIFY ?auto_3055 ?auto_3056 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3066 - OBJ
      ?auto_3068 - OBJ
      ?auto_3069 - OBJ
      ?auto_3071 - OBJ
      ?auto_3070 - OBJ
      ?auto_3067 - LOCATION
    )
    :vars
    (
      ?auto_3073 - LOCATION
      ?auto_3074 - CITY
      ?auto_3076 - LOCATION
      ?auto_3075 - LOCATION
      ?auto_3072 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3068 ?auto_3066 ) ( GREATER-THAN ?auto_3069 ?auto_3066 ) ( GREATER-THAN ?auto_3069 ?auto_3068 ) ( GREATER-THAN ?auto_3071 ?auto_3066 ) ( GREATER-THAN ?auto_3071 ?auto_3068 ) ( GREATER-THAN ?auto_3071 ?auto_3069 ) ( GREATER-THAN ?auto_3070 ?auto_3066 ) ( GREATER-THAN ?auto_3070 ?auto_3068 ) ( GREATER-THAN ?auto_3070 ?auto_3069 ) ( GREATER-THAN ?auto_3070 ?auto_3071 ) ( IN-CITY ?auto_3073 ?auto_3074 ) ( IN-CITY ?auto_3067 ?auto_3074 ) ( not ( = ?auto_3067 ?auto_3073 ) ) ( OBJ-AT ?auto_3070 ?auto_3073 ) ( OBJ-AT ?auto_3071 ?auto_3073 ) ( IN-CITY ?auto_3076 ?auto_3074 ) ( not ( = ?auto_3067 ?auto_3076 ) ) ( OBJ-AT ?auto_3069 ?auto_3076 ) ( IN-CITY ?auto_3075 ?auto_3074 ) ( not ( = ?auto_3067 ?auto_3075 ) ) ( OBJ-AT ?auto_3068 ?auto_3075 ) ( TRUCK-AT ?auto_3072 ?auto_3075 ) ( OBJ-AT ?auto_3066 ?auto_3075 ) ( not ( = ?auto_3066 ?auto_3068 ) ) ( not ( = ?auto_3066 ?auto_3069 ) ) ( not ( = ?auto_3068 ?auto_3069 ) ) ( not ( = ?auto_3076 ?auto_3075 ) ) ( not ( = ?auto_3066 ?auto_3071 ) ) ( not ( = ?auto_3068 ?auto_3071 ) ) ( not ( = ?auto_3069 ?auto_3071 ) ) ( not ( = ?auto_3073 ?auto_3076 ) ) ( not ( = ?auto_3073 ?auto_3075 ) ) ( not ( = ?auto_3066 ?auto_3070 ) ) ( not ( = ?auto_3068 ?auto_3070 ) ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( not ( = ?auto_3071 ?auto_3070 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3066 ?auto_3068 ?auto_3069 ?auto_3071 ?auto_3067 )
      ( DELIVER-1PKG ?auto_3070 ?auto_3067 )
      ( DELIVER-5PKG-VERIFY ?auto_3066 ?auto_3068 ?auto_3069 ?auto_3071 ?auto_3070 ?auto_3067 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3083 - OBJ
      ?auto_3085 - OBJ
      ?auto_3086 - OBJ
      ?auto_3088 - OBJ
      ?auto_3087 - OBJ
      ?auto_3084 - LOCATION
    )
    :vars
    (
      ?auto_3093 - LOCATION
      ?auto_3091 - CITY
      ?auto_3090 - LOCATION
      ?auto_3092 - LOCATION
      ?auto_3089 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3085 ?auto_3083 ) ( GREATER-THAN ?auto_3086 ?auto_3083 ) ( GREATER-THAN ?auto_3086 ?auto_3085 ) ( GREATER-THAN ?auto_3088 ?auto_3083 ) ( GREATER-THAN ?auto_3088 ?auto_3085 ) ( GREATER-THAN ?auto_3088 ?auto_3086 ) ( GREATER-THAN ?auto_3087 ?auto_3083 ) ( GREATER-THAN ?auto_3087 ?auto_3085 ) ( GREATER-THAN ?auto_3087 ?auto_3086 ) ( GREATER-THAN ?auto_3087 ?auto_3088 ) ( IN-CITY ?auto_3093 ?auto_3091 ) ( IN-CITY ?auto_3084 ?auto_3091 ) ( not ( = ?auto_3084 ?auto_3093 ) ) ( OBJ-AT ?auto_3087 ?auto_3093 ) ( OBJ-AT ?auto_3088 ?auto_3093 ) ( IN-CITY ?auto_3090 ?auto_3091 ) ( not ( = ?auto_3084 ?auto_3090 ) ) ( OBJ-AT ?auto_3086 ?auto_3090 ) ( IN-CITY ?auto_3092 ?auto_3091 ) ( not ( = ?auto_3084 ?auto_3092 ) ) ( OBJ-AT ?auto_3085 ?auto_3092 ) ( OBJ-AT ?auto_3083 ?auto_3092 ) ( not ( = ?auto_3083 ?auto_3085 ) ) ( not ( = ?auto_3083 ?auto_3086 ) ) ( not ( = ?auto_3085 ?auto_3086 ) ) ( not ( = ?auto_3090 ?auto_3092 ) ) ( not ( = ?auto_3083 ?auto_3088 ) ) ( not ( = ?auto_3085 ?auto_3088 ) ) ( not ( = ?auto_3086 ?auto_3088 ) ) ( not ( = ?auto_3093 ?auto_3090 ) ) ( not ( = ?auto_3093 ?auto_3092 ) ) ( not ( = ?auto_3083 ?auto_3087 ) ) ( not ( = ?auto_3085 ?auto_3087 ) ) ( not ( = ?auto_3086 ?auto_3087 ) ) ( not ( = ?auto_3088 ?auto_3087 ) ) ( TRUCK-AT ?auto_3089 ?auto_3084 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3089 ?auto_3084 ?auto_3092 ?auto_3091 )
      ( DELIVER-5PKG ?auto_3083 ?auto_3085 ?auto_3086 ?auto_3088 ?auto_3087 ?auto_3084 )
      ( DELIVER-5PKG-VERIFY ?auto_3083 ?auto_3085 ?auto_3086 ?auto_3088 ?auto_3087 ?auto_3084 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3096 - OBJ
      ?auto_3097 - LOCATION
    )
    :vars
    (
      ?auto_3098 - TRUCK
      ?auto_3099 - LOCATION
      ?auto_3100 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3098 ?auto_3099 ) ( IN-CITY ?auto_3099 ?auto_3100 ) ( IN-CITY ?auto_3097 ?auto_3100 ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( OBJ-AT ?auto_3096 ?auto_3099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3096 ?auto_3098 ?auto_3099 )
      ( !DRIVE-TRUCK ?auto_3098 ?auto_3099 ?auto_3097 ?auto_3100 )
      ( !UNLOAD-TRUCK ?auto_3096 ?auto_3098 ?auto_3097 )
      ( DELIVER-1PKG-VERIFY ?auto_3096 ?auto_3097 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3103 - OBJ
      ?auto_3104 - LOCATION
    )
    :vars
    (
      ?auto_3105 - LOCATION
      ?auto_3107 - CITY
      ?auto_3106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3105 ?auto_3107 ) ( IN-CITY ?auto_3104 ?auto_3107 ) ( not ( = ?auto_3104 ?auto_3105 ) ) ( OBJ-AT ?auto_3103 ?auto_3105 ) ( TRUCK-AT ?auto_3106 ?auto_3104 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3106 ?auto_3104 ?auto_3105 ?auto_3107 )
      ( DELIVER-1PKG ?auto_3103 ?auto_3104 )
      ( DELIVER-1PKG-VERIFY ?auto_3103 ?auto_3104 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3115 - OBJ
      ?auto_3117 - OBJ
      ?auto_3118 - OBJ
      ?auto_3120 - OBJ
      ?auto_3119 - OBJ
      ?auto_3121 - OBJ
      ?auto_3116 - LOCATION
    )
    :vars
    (
      ?auto_3124 - LOCATION
      ?auto_3123 - CITY
      ?auto_3126 - LOCATION
      ?auto_3125 - LOCATION
      ?auto_3122 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3117 ?auto_3115 ) ( GREATER-THAN ?auto_3118 ?auto_3115 ) ( GREATER-THAN ?auto_3118 ?auto_3117 ) ( GREATER-THAN ?auto_3120 ?auto_3115 ) ( GREATER-THAN ?auto_3120 ?auto_3117 ) ( GREATER-THAN ?auto_3120 ?auto_3118 ) ( GREATER-THAN ?auto_3119 ?auto_3115 ) ( GREATER-THAN ?auto_3119 ?auto_3117 ) ( GREATER-THAN ?auto_3119 ?auto_3118 ) ( GREATER-THAN ?auto_3119 ?auto_3120 ) ( GREATER-THAN ?auto_3121 ?auto_3115 ) ( GREATER-THAN ?auto_3121 ?auto_3117 ) ( GREATER-THAN ?auto_3121 ?auto_3118 ) ( GREATER-THAN ?auto_3121 ?auto_3120 ) ( GREATER-THAN ?auto_3121 ?auto_3119 ) ( IN-CITY ?auto_3124 ?auto_3123 ) ( IN-CITY ?auto_3116 ?auto_3123 ) ( not ( = ?auto_3116 ?auto_3124 ) ) ( OBJ-AT ?auto_3121 ?auto_3124 ) ( IN-CITY ?auto_3126 ?auto_3123 ) ( not ( = ?auto_3116 ?auto_3126 ) ) ( OBJ-AT ?auto_3119 ?auto_3126 ) ( OBJ-AT ?auto_3120 ?auto_3126 ) ( OBJ-AT ?auto_3118 ?auto_3124 ) ( IN-CITY ?auto_3125 ?auto_3123 ) ( not ( = ?auto_3116 ?auto_3125 ) ) ( OBJ-AT ?auto_3117 ?auto_3125 ) ( TRUCK-AT ?auto_3122 ?auto_3125 ) ( OBJ-AT ?auto_3115 ?auto_3125 ) ( not ( = ?auto_3115 ?auto_3117 ) ) ( not ( = ?auto_3115 ?auto_3118 ) ) ( not ( = ?auto_3117 ?auto_3118 ) ) ( not ( = ?auto_3124 ?auto_3125 ) ) ( not ( = ?auto_3115 ?auto_3120 ) ) ( not ( = ?auto_3117 ?auto_3120 ) ) ( not ( = ?auto_3118 ?auto_3120 ) ) ( not ( = ?auto_3126 ?auto_3124 ) ) ( not ( = ?auto_3126 ?auto_3125 ) ) ( not ( = ?auto_3115 ?auto_3119 ) ) ( not ( = ?auto_3117 ?auto_3119 ) ) ( not ( = ?auto_3118 ?auto_3119 ) ) ( not ( = ?auto_3120 ?auto_3119 ) ) ( not ( = ?auto_3115 ?auto_3121 ) ) ( not ( = ?auto_3117 ?auto_3121 ) ) ( not ( = ?auto_3118 ?auto_3121 ) ) ( not ( = ?auto_3120 ?auto_3121 ) ) ( not ( = ?auto_3119 ?auto_3121 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3115 ?auto_3117 ?auto_3118 ?auto_3120 ?auto_3119 ?auto_3116 )
      ( DELIVER-1PKG ?auto_3121 ?auto_3116 )
      ( DELIVER-6PKG-VERIFY ?auto_3115 ?auto_3117 ?auto_3118 ?auto_3120 ?auto_3119 ?auto_3121 ?auto_3116 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3134 - OBJ
      ?auto_3136 - OBJ
      ?auto_3137 - OBJ
      ?auto_3139 - OBJ
      ?auto_3138 - OBJ
      ?auto_3140 - OBJ
      ?auto_3135 - LOCATION
    )
    :vars
    (
      ?auto_3141 - LOCATION
      ?auto_3143 - CITY
      ?auto_3144 - LOCATION
      ?auto_3142 - LOCATION
      ?auto_3145 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3136 ?auto_3134 ) ( GREATER-THAN ?auto_3137 ?auto_3134 ) ( GREATER-THAN ?auto_3137 ?auto_3136 ) ( GREATER-THAN ?auto_3139 ?auto_3134 ) ( GREATER-THAN ?auto_3139 ?auto_3136 ) ( GREATER-THAN ?auto_3139 ?auto_3137 ) ( GREATER-THAN ?auto_3138 ?auto_3134 ) ( GREATER-THAN ?auto_3138 ?auto_3136 ) ( GREATER-THAN ?auto_3138 ?auto_3137 ) ( GREATER-THAN ?auto_3138 ?auto_3139 ) ( GREATER-THAN ?auto_3140 ?auto_3134 ) ( GREATER-THAN ?auto_3140 ?auto_3136 ) ( GREATER-THAN ?auto_3140 ?auto_3137 ) ( GREATER-THAN ?auto_3140 ?auto_3139 ) ( GREATER-THAN ?auto_3140 ?auto_3138 ) ( IN-CITY ?auto_3141 ?auto_3143 ) ( IN-CITY ?auto_3135 ?auto_3143 ) ( not ( = ?auto_3135 ?auto_3141 ) ) ( OBJ-AT ?auto_3140 ?auto_3141 ) ( IN-CITY ?auto_3144 ?auto_3143 ) ( not ( = ?auto_3135 ?auto_3144 ) ) ( OBJ-AT ?auto_3138 ?auto_3144 ) ( OBJ-AT ?auto_3139 ?auto_3144 ) ( OBJ-AT ?auto_3137 ?auto_3141 ) ( IN-CITY ?auto_3142 ?auto_3143 ) ( not ( = ?auto_3135 ?auto_3142 ) ) ( OBJ-AT ?auto_3136 ?auto_3142 ) ( OBJ-AT ?auto_3134 ?auto_3142 ) ( not ( = ?auto_3134 ?auto_3136 ) ) ( not ( = ?auto_3134 ?auto_3137 ) ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3134 ?auto_3139 ) ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3137 ?auto_3139 ) ) ( not ( = ?auto_3144 ?auto_3141 ) ) ( not ( = ?auto_3144 ?auto_3142 ) ) ( not ( = ?auto_3134 ?auto_3138 ) ) ( not ( = ?auto_3136 ?auto_3138 ) ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3139 ?auto_3138 ) ) ( not ( = ?auto_3134 ?auto_3140 ) ) ( not ( = ?auto_3136 ?auto_3140 ) ) ( not ( = ?auto_3137 ?auto_3140 ) ) ( not ( = ?auto_3139 ?auto_3140 ) ) ( not ( = ?auto_3138 ?auto_3140 ) ) ( TRUCK-AT ?auto_3145 ?auto_3135 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3145 ?auto_3135 ?auto_3142 ?auto_3143 )
      ( DELIVER-6PKG ?auto_3134 ?auto_3136 ?auto_3137 ?auto_3139 ?auto_3138 ?auto_3140 ?auto_3135 )
      ( DELIVER-6PKG-VERIFY ?auto_3134 ?auto_3136 ?auto_3137 ?auto_3139 ?auto_3138 ?auto_3140 ?auto_3135 ) )
  )

)

