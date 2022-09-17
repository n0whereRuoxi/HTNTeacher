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
      ?auto_2943 - SURFACE
      ?auto_2944 - SURFACE
    )
    :vars
    (
      ?auto_2945 - HOIST
      ?auto_2946 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2945 ?auto_2946 ) ( SURFACE-AT ?auto_2944 ?auto_2946 ) ( CLEAR ?auto_2944 ) ( LIFTING ?auto_2945 ?auto_2943 ) ( IS-CRATE ?auto_2943 ) ( not ( = ?auto_2943 ?auto_2944 ) ) )
    :subtasks
    ( ( !DROP ?auto_2945 ?auto_2943 ?auto_2944 ?auto_2946 )
      ( MAKE-ON-VERIFY ?auto_2943 ?auto_2944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2947 - SURFACE
      ?auto_2948 - SURFACE
    )
    :vars
    (
      ?auto_2950 - HOIST
      ?auto_2949 - PLACE
      ?auto_2951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2950 ?auto_2949 ) ( SURFACE-AT ?auto_2948 ?auto_2949 ) ( CLEAR ?auto_2948 ) ( IS-CRATE ?auto_2947 ) ( not ( = ?auto_2947 ?auto_2948 ) ) ( TRUCK-AT ?auto_2951 ?auto_2949 ) ( AVAILABLE ?auto_2950 ) ( IN ?auto_2947 ?auto_2951 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2950 ?auto_2947 ?auto_2951 ?auto_2949 )
      ( MAKE-ON ?auto_2947 ?auto_2948 )
      ( MAKE-ON-VERIFY ?auto_2947 ?auto_2948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2952 - SURFACE
      ?auto_2953 - SURFACE
    )
    :vars
    (
      ?auto_2956 - HOIST
      ?auto_2955 - PLACE
      ?auto_2954 - TRUCK
      ?auto_2957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2956 ?auto_2955 ) ( SURFACE-AT ?auto_2953 ?auto_2955 ) ( CLEAR ?auto_2953 ) ( IS-CRATE ?auto_2952 ) ( not ( = ?auto_2952 ?auto_2953 ) ) ( AVAILABLE ?auto_2956 ) ( IN ?auto_2952 ?auto_2954 ) ( TRUCK-AT ?auto_2954 ?auto_2957 ) ( not ( = ?auto_2957 ?auto_2955 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2954 ?auto_2957 ?auto_2955 )
      ( MAKE-ON ?auto_2952 ?auto_2953 )
      ( MAKE-ON-VERIFY ?auto_2952 ?auto_2953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2958 - SURFACE
      ?auto_2959 - SURFACE
    )
    :vars
    (
      ?auto_2961 - HOIST
      ?auto_2963 - PLACE
      ?auto_2960 - TRUCK
      ?auto_2962 - PLACE
      ?auto_2964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2961 ?auto_2963 ) ( SURFACE-AT ?auto_2959 ?auto_2963 ) ( CLEAR ?auto_2959 ) ( IS-CRATE ?auto_2958 ) ( not ( = ?auto_2958 ?auto_2959 ) ) ( AVAILABLE ?auto_2961 ) ( TRUCK-AT ?auto_2960 ?auto_2962 ) ( not ( = ?auto_2962 ?auto_2963 ) ) ( HOIST-AT ?auto_2964 ?auto_2962 ) ( LIFTING ?auto_2964 ?auto_2958 ) ( not ( = ?auto_2961 ?auto_2964 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2964 ?auto_2958 ?auto_2960 ?auto_2962 )
      ( MAKE-ON ?auto_2958 ?auto_2959 )
      ( MAKE-ON-VERIFY ?auto_2958 ?auto_2959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2965 - SURFACE
      ?auto_2966 - SURFACE
    )
    :vars
    (
      ?auto_2969 - HOIST
      ?auto_2967 - PLACE
      ?auto_2971 - TRUCK
      ?auto_2970 - PLACE
      ?auto_2968 - HOIST
      ?auto_2972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2969 ?auto_2967 ) ( SURFACE-AT ?auto_2966 ?auto_2967 ) ( CLEAR ?auto_2966 ) ( IS-CRATE ?auto_2965 ) ( not ( = ?auto_2965 ?auto_2966 ) ) ( AVAILABLE ?auto_2969 ) ( TRUCK-AT ?auto_2971 ?auto_2970 ) ( not ( = ?auto_2970 ?auto_2967 ) ) ( HOIST-AT ?auto_2968 ?auto_2970 ) ( not ( = ?auto_2969 ?auto_2968 ) ) ( AVAILABLE ?auto_2968 ) ( SURFACE-AT ?auto_2965 ?auto_2970 ) ( ON ?auto_2965 ?auto_2972 ) ( CLEAR ?auto_2965 ) ( not ( = ?auto_2965 ?auto_2972 ) ) ( not ( = ?auto_2966 ?auto_2972 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2968 ?auto_2965 ?auto_2972 ?auto_2970 )
      ( MAKE-ON ?auto_2965 ?auto_2966 )
      ( MAKE-ON-VERIFY ?auto_2965 ?auto_2966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2973 - SURFACE
      ?auto_2974 - SURFACE
    )
    :vars
    (
      ?auto_2980 - HOIST
      ?auto_2977 - PLACE
      ?auto_2975 - PLACE
      ?auto_2979 - HOIST
      ?auto_2976 - SURFACE
      ?auto_2978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2980 ?auto_2977 ) ( SURFACE-AT ?auto_2974 ?auto_2977 ) ( CLEAR ?auto_2974 ) ( IS-CRATE ?auto_2973 ) ( not ( = ?auto_2973 ?auto_2974 ) ) ( AVAILABLE ?auto_2980 ) ( not ( = ?auto_2975 ?auto_2977 ) ) ( HOIST-AT ?auto_2979 ?auto_2975 ) ( not ( = ?auto_2980 ?auto_2979 ) ) ( AVAILABLE ?auto_2979 ) ( SURFACE-AT ?auto_2973 ?auto_2975 ) ( ON ?auto_2973 ?auto_2976 ) ( CLEAR ?auto_2973 ) ( not ( = ?auto_2973 ?auto_2976 ) ) ( not ( = ?auto_2974 ?auto_2976 ) ) ( TRUCK-AT ?auto_2978 ?auto_2977 ) )
    :subtasks
    ( ( !DRIVE ?auto_2978 ?auto_2977 ?auto_2975 )
      ( MAKE-ON ?auto_2973 ?auto_2974 )
      ( MAKE-ON-VERIFY ?auto_2973 ?auto_2974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2983 - SURFACE
      ?auto_2984 - SURFACE
    )
    :vars
    (
      ?auto_2985 - HOIST
      ?auto_2986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2985 ?auto_2986 ) ( SURFACE-AT ?auto_2984 ?auto_2986 ) ( CLEAR ?auto_2984 ) ( LIFTING ?auto_2985 ?auto_2983 ) ( IS-CRATE ?auto_2983 ) ( not ( = ?auto_2983 ?auto_2984 ) ) )
    :subtasks
    ( ( !DROP ?auto_2985 ?auto_2983 ?auto_2984 ?auto_2986 )
      ( MAKE-ON-VERIFY ?auto_2983 ?auto_2984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2987 - SURFACE
      ?auto_2988 - SURFACE
    )
    :vars
    (
      ?auto_2989 - HOIST
      ?auto_2990 - PLACE
      ?auto_2991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2989 ?auto_2990 ) ( SURFACE-AT ?auto_2988 ?auto_2990 ) ( CLEAR ?auto_2988 ) ( IS-CRATE ?auto_2987 ) ( not ( = ?auto_2987 ?auto_2988 ) ) ( TRUCK-AT ?auto_2991 ?auto_2990 ) ( AVAILABLE ?auto_2989 ) ( IN ?auto_2987 ?auto_2991 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2989 ?auto_2987 ?auto_2991 ?auto_2990 )
      ( MAKE-ON ?auto_2987 ?auto_2988 )
      ( MAKE-ON-VERIFY ?auto_2987 ?auto_2988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2992 - SURFACE
      ?auto_2993 - SURFACE
    )
    :vars
    (
      ?auto_2995 - HOIST
      ?auto_2994 - PLACE
      ?auto_2996 - TRUCK
      ?auto_2997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2995 ?auto_2994 ) ( SURFACE-AT ?auto_2993 ?auto_2994 ) ( CLEAR ?auto_2993 ) ( IS-CRATE ?auto_2992 ) ( not ( = ?auto_2992 ?auto_2993 ) ) ( AVAILABLE ?auto_2995 ) ( IN ?auto_2992 ?auto_2996 ) ( TRUCK-AT ?auto_2996 ?auto_2997 ) ( not ( = ?auto_2997 ?auto_2994 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2996 ?auto_2997 ?auto_2994 )
      ( MAKE-ON ?auto_2992 ?auto_2993 )
      ( MAKE-ON-VERIFY ?auto_2992 ?auto_2993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2998 - SURFACE
      ?auto_2999 - SURFACE
    )
    :vars
    (
      ?auto_3001 - HOIST
      ?auto_3003 - PLACE
      ?auto_3000 - TRUCK
      ?auto_3002 - PLACE
      ?auto_3004 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3001 ?auto_3003 ) ( SURFACE-AT ?auto_2999 ?auto_3003 ) ( CLEAR ?auto_2999 ) ( IS-CRATE ?auto_2998 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( AVAILABLE ?auto_3001 ) ( TRUCK-AT ?auto_3000 ?auto_3002 ) ( not ( = ?auto_3002 ?auto_3003 ) ) ( HOIST-AT ?auto_3004 ?auto_3002 ) ( LIFTING ?auto_3004 ?auto_2998 ) ( not ( = ?auto_3001 ?auto_3004 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3004 ?auto_2998 ?auto_3000 ?auto_3002 )
      ( MAKE-ON ?auto_2998 ?auto_2999 )
      ( MAKE-ON-VERIFY ?auto_2998 ?auto_2999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3005 - SURFACE
      ?auto_3006 - SURFACE
    )
    :vars
    (
      ?auto_3007 - HOIST
      ?auto_3010 - PLACE
      ?auto_3011 - TRUCK
      ?auto_3008 - PLACE
      ?auto_3009 - HOIST
      ?auto_3012 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3007 ?auto_3010 ) ( SURFACE-AT ?auto_3006 ?auto_3010 ) ( CLEAR ?auto_3006 ) ( IS-CRATE ?auto_3005 ) ( not ( = ?auto_3005 ?auto_3006 ) ) ( AVAILABLE ?auto_3007 ) ( TRUCK-AT ?auto_3011 ?auto_3008 ) ( not ( = ?auto_3008 ?auto_3010 ) ) ( HOIST-AT ?auto_3009 ?auto_3008 ) ( not ( = ?auto_3007 ?auto_3009 ) ) ( AVAILABLE ?auto_3009 ) ( SURFACE-AT ?auto_3005 ?auto_3008 ) ( ON ?auto_3005 ?auto_3012 ) ( CLEAR ?auto_3005 ) ( not ( = ?auto_3005 ?auto_3012 ) ) ( not ( = ?auto_3006 ?auto_3012 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3009 ?auto_3005 ?auto_3012 ?auto_3008 )
      ( MAKE-ON ?auto_3005 ?auto_3006 )
      ( MAKE-ON-VERIFY ?auto_3005 ?auto_3006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3013 - SURFACE
      ?auto_3014 - SURFACE
    )
    :vars
    (
      ?auto_3020 - HOIST
      ?auto_3015 - PLACE
      ?auto_3019 - PLACE
      ?auto_3017 - HOIST
      ?auto_3016 - SURFACE
      ?auto_3018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3020 ?auto_3015 ) ( SURFACE-AT ?auto_3014 ?auto_3015 ) ( CLEAR ?auto_3014 ) ( IS-CRATE ?auto_3013 ) ( not ( = ?auto_3013 ?auto_3014 ) ) ( AVAILABLE ?auto_3020 ) ( not ( = ?auto_3019 ?auto_3015 ) ) ( HOIST-AT ?auto_3017 ?auto_3019 ) ( not ( = ?auto_3020 ?auto_3017 ) ) ( AVAILABLE ?auto_3017 ) ( SURFACE-AT ?auto_3013 ?auto_3019 ) ( ON ?auto_3013 ?auto_3016 ) ( CLEAR ?auto_3013 ) ( not ( = ?auto_3013 ?auto_3016 ) ) ( not ( = ?auto_3014 ?auto_3016 ) ) ( TRUCK-AT ?auto_3018 ?auto_3015 ) )
    :subtasks
    ( ( !DRIVE ?auto_3018 ?auto_3015 ?auto_3019 )
      ( MAKE-ON ?auto_3013 ?auto_3014 )
      ( MAKE-ON-VERIFY ?auto_3013 ?auto_3014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3021 - SURFACE
      ?auto_3022 - SURFACE
    )
    :vars
    (
      ?auto_3025 - HOIST
      ?auto_3027 - PLACE
      ?auto_3028 - PLACE
      ?auto_3024 - HOIST
      ?auto_3023 - SURFACE
      ?auto_3026 - TRUCK
      ?auto_3029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3025 ?auto_3027 ) ( IS-CRATE ?auto_3021 ) ( not ( = ?auto_3021 ?auto_3022 ) ) ( not ( = ?auto_3028 ?auto_3027 ) ) ( HOIST-AT ?auto_3024 ?auto_3028 ) ( not ( = ?auto_3025 ?auto_3024 ) ) ( AVAILABLE ?auto_3024 ) ( SURFACE-AT ?auto_3021 ?auto_3028 ) ( ON ?auto_3021 ?auto_3023 ) ( CLEAR ?auto_3021 ) ( not ( = ?auto_3021 ?auto_3023 ) ) ( not ( = ?auto_3022 ?auto_3023 ) ) ( TRUCK-AT ?auto_3026 ?auto_3027 ) ( SURFACE-AT ?auto_3029 ?auto_3027 ) ( CLEAR ?auto_3029 ) ( LIFTING ?auto_3025 ?auto_3022 ) ( IS-CRATE ?auto_3022 ) ( not ( = ?auto_3021 ?auto_3029 ) ) ( not ( = ?auto_3022 ?auto_3029 ) ) ( not ( = ?auto_3023 ?auto_3029 ) ) )
    :subtasks
    ( ( !DROP ?auto_3025 ?auto_3022 ?auto_3029 ?auto_3027 )
      ( MAKE-ON ?auto_3021 ?auto_3022 )
      ( MAKE-ON-VERIFY ?auto_3021 ?auto_3022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3030 - SURFACE
      ?auto_3031 - SURFACE
    )
    :vars
    (
      ?auto_3035 - HOIST
      ?auto_3037 - PLACE
      ?auto_3033 - PLACE
      ?auto_3036 - HOIST
      ?auto_3034 - SURFACE
      ?auto_3038 - TRUCK
      ?auto_3032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3035 ?auto_3037 ) ( IS-CRATE ?auto_3030 ) ( not ( = ?auto_3030 ?auto_3031 ) ) ( not ( = ?auto_3033 ?auto_3037 ) ) ( HOIST-AT ?auto_3036 ?auto_3033 ) ( not ( = ?auto_3035 ?auto_3036 ) ) ( AVAILABLE ?auto_3036 ) ( SURFACE-AT ?auto_3030 ?auto_3033 ) ( ON ?auto_3030 ?auto_3034 ) ( CLEAR ?auto_3030 ) ( not ( = ?auto_3030 ?auto_3034 ) ) ( not ( = ?auto_3031 ?auto_3034 ) ) ( TRUCK-AT ?auto_3038 ?auto_3037 ) ( SURFACE-AT ?auto_3032 ?auto_3037 ) ( CLEAR ?auto_3032 ) ( IS-CRATE ?auto_3031 ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3031 ?auto_3032 ) ) ( not ( = ?auto_3034 ?auto_3032 ) ) ( AVAILABLE ?auto_3035 ) ( IN ?auto_3031 ?auto_3038 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3035 ?auto_3031 ?auto_3038 ?auto_3037 )
      ( MAKE-ON ?auto_3030 ?auto_3031 )
      ( MAKE-ON-VERIFY ?auto_3030 ?auto_3031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3039 - SURFACE
      ?auto_3040 - SURFACE
    )
    :vars
    (
      ?auto_3047 - HOIST
      ?auto_3046 - PLACE
      ?auto_3045 - PLACE
      ?auto_3044 - HOIST
      ?auto_3043 - SURFACE
      ?auto_3042 - SURFACE
      ?auto_3041 - TRUCK
      ?auto_3048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3047 ?auto_3046 ) ( IS-CRATE ?auto_3039 ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( not ( = ?auto_3045 ?auto_3046 ) ) ( HOIST-AT ?auto_3044 ?auto_3045 ) ( not ( = ?auto_3047 ?auto_3044 ) ) ( AVAILABLE ?auto_3044 ) ( SURFACE-AT ?auto_3039 ?auto_3045 ) ( ON ?auto_3039 ?auto_3043 ) ( CLEAR ?auto_3039 ) ( not ( = ?auto_3039 ?auto_3043 ) ) ( not ( = ?auto_3040 ?auto_3043 ) ) ( SURFACE-AT ?auto_3042 ?auto_3046 ) ( CLEAR ?auto_3042 ) ( IS-CRATE ?auto_3040 ) ( not ( = ?auto_3039 ?auto_3042 ) ) ( not ( = ?auto_3040 ?auto_3042 ) ) ( not ( = ?auto_3043 ?auto_3042 ) ) ( AVAILABLE ?auto_3047 ) ( IN ?auto_3040 ?auto_3041 ) ( TRUCK-AT ?auto_3041 ?auto_3048 ) ( not ( = ?auto_3048 ?auto_3046 ) ) ( not ( = ?auto_3045 ?auto_3048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3041 ?auto_3048 ?auto_3046 )
      ( MAKE-ON ?auto_3039 ?auto_3040 )
      ( MAKE-ON-VERIFY ?auto_3039 ?auto_3040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3049 - SURFACE
      ?auto_3050 - SURFACE
    )
    :vars
    (
      ?auto_3052 - HOIST
      ?auto_3058 - PLACE
      ?auto_3055 - PLACE
      ?auto_3051 - HOIST
      ?auto_3054 - SURFACE
      ?auto_3056 - SURFACE
      ?auto_3053 - TRUCK
      ?auto_3057 - PLACE
      ?auto_3059 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3052 ?auto_3058 ) ( IS-CRATE ?auto_3049 ) ( not ( = ?auto_3049 ?auto_3050 ) ) ( not ( = ?auto_3055 ?auto_3058 ) ) ( HOIST-AT ?auto_3051 ?auto_3055 ) ( not ( = ?auto_3052 ?auto_3051 ) ) ( AVAILABLE ?auto_3051 ) ( SURFACE-AT ?auto_3049 ?auto_3055 ) ( ON ?auto_3049 ?auto_3054 ) ( CLEAR ?auto_3049 ) ( not ( = ?auto_3049 ?auto_3054 ) ) ( not ( = ?auto_3050 ?auto_3054 ) ) ( SURFACE-AT ?auto_3056 ?auto_3058 ) ( CLEAR ?auto_3056 ) ( IS-CRATE ?auto_3050 ) ( not ( = ?auto_3049 ?auto_3056 ) ) ( not ( = ?auto_3050 ?auto_3056 ) ) ( not ( = ?auto_3054 ?auto_3056 ) ) ( AVAILABLE ?auto_3052 ) ( TRUCK-AT ?auto_3053 ?auto_3057 ) ( not ( = ?auto_3057 ?auto_3058 ) ) ( not ( = ?auto_3055 ?auto_3057 ) ) ( HOIST-AT ?auto_3059 ?auto_3057 ) ( LIFTING ?auto_3059 ?auto_3050 ) ( not ( = ?auto_3052 ?auto_3059 ) ) ( not ( = ?auto_3051 ?auto_3059 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3059 ?auto_3050 ?auto_3053 ?auto_3057 )
      ( MAKE-ON ?auto_3049 ?auto_3050 )
      ( MAKE-ON-VERIFY ?auto_3049 ?auto_3050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3060 - SURFACE
      ?auto_3061 - SURFACE
    )
    :vars
    (
      ?auto_3069 - HOIST
      ?auto_3062 - PLACE
      ?auto_3068 - PLACE
      ?auto_3065 - HOIST
      ?auto_3066 - SURFACE
      ?auto_3070 - SURFACE
      ?auto_3067 - TRUCK
      ?auto_3063 - PLACE
      ?auto_3064 - HOIST
      ?auto_3071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3069 ?auto_3062 ) ( IS-CRATE ?auto_3060 ) ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3068 ?auto_3062 ) ) ( HOIST-AT ?auto_3065 ?auto_3068 ) ( not ( = ?auto_3069 ?auto_3065 ) ) ( AVAILABLE ?auto_3065 ) ( SURFACE-AT ?auto_3060 ?auto_3068 ) ( ON ?auto_3060 ?auto_3066 ) ( CLEAR ?auto_3060 ) ( not ( = ?auto_3060 ?auto_3066 ) ) ( not ( = ?auto_3061 ?auto_3066 ) ) ( SURFACE-AT ?auto_3070 ?auto_3062 ) ( CLEAR ?auto_3070 ) ( IS-CRATE ?auto_3061 ) ( not ( = ?auto_3060 ?auto_3070 ) ) ( not ( = ?auto_3061 ?auto_3070 ) ) ( not ( = ?auto_3066 ?auto_3070 ) ) ( AVAILABLE ?auto_3069 ) ( TRUCK-AT ?auto_3067 ?auto_3063 ) ( not ( = ?auto_3063 ?auto_3062 ) ) ( not ( = ?auto_3068 ?auto_3063 ) ) ( HOIST-AT ?auto_3064 ?auto_3063 ) ( not ( = ?auto_3069 ?auto_3064 ) ) ( not ( = ?auto_3065 ?auto_3064 ) ) ( AVAILABLE ?auto_3064 ) ( SURFACE-AT ?auto_3061 ?auto_3063 ) ( ON ?auto_3061 ?auto_3071 ) ( CLEAR ?auto_3061 ) ( not ( = ?auto_3060 ?auto_3071 ) ) ( not ( = ?auto_3061 ?auto_3071 ) ) ( not ( = ?auto_3066 ?auto_3071 ) ) ( not ( = ?auto_3070 ?auto_3071 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3064 ?auto_3061 ?auto_3071 ?auto_3063 )
      ( MAKE-ON ?auto_3060 ?auto_3061 )
      ( MAKE-ON-VERIFY ?auto_3060 ?auto_3061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3072 - SURFACE
      ?auto_3073 - SURFACE
    )
    :vars
    (
      ?auto_3074 - HOIST
      ?auto_3081 - PLACE
      ?auto_3076 - PLACE
      ?auto_3075 - HOIST
      ?auto_3080 - SURFACE
      ?auto_3077 - SURFACE
      ?auto_3078 - PLACE
      ?auto_3079 - HOIST
      ?auto_3083 - SURFACE
      ?auto_3082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3074 ?auto_3081 ) ( IS-CRATE ?auto_3072 ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3076 ?auto_3081 ) ) ( HOIST-AT ?auto_3075 ?auto_3076 ) ( not ( = ?auto_3074 ?auto_3075 ) ) ( AVAILABLE ?auto_3075 ) ( SURFACE-AT ?auto_3072 ?auto_3076 ) ( ON ?auto_3072 ?auto_3080 ) ( CLEAR ?auto_3072 ) ( not ( = ?auto_3072 ?auto_3080 ) ) ( not ( = ?auto_3073 ?auto_3080 ) ) ( SURFACE-AT ?auto_3077 ?auto_3081 ) ( CLEAR ?auto_3077 ) ( IS-CRATE ?auto_3073 ) ( not ( = ?auto_3072 ?auto_3077 ) ) ( not ( = ?auto_3073 ?auto_3077 ) ) ( not ( = ?auto_3080 ?auto_3077 ) ) ( AVAILABLE ?auto_3074 ) ( not ( = ?auto_3078 ?auto_3081 ) ) ( not ( = ?auto_3076 ?auto_3078 ) ) ( HOIST-AT ?auto_3079 ?auto_3078 ) ( not ( = ?auto_3074 ?auto_3079 ) ) ( not ( = ?auto_3075 ?auto_3079 ) ) ( AVAILABLE ?auto_3079 ) ( SURFACE-AT ?auto_3073 ?auto_3078 ) ( ON ?auto_3073 ?auto_3083 ) ( CLEAR ?auto_3073 ) ( not ( = ?auto_3072 ?auto_3083 ) ) ( not ( = ?auto_3073 ?auto_3083 ) ) ( not ( = ?auto_3080 ?auto_3083 ) ) ( not ( = ?auto_3077 ?auto_3083 ) ) ( TRUCK-AT ?auto_3082 ?auto_3081 ) )
    :subtasks
    ( ( !DRIVE ?auto_3082 ?auto_3081 ?auto_3078 )
      ( MAKE-ON ?auto_3072 ?auto_3073 )
      ( MAKE-ON-VERIFY ?auto_3072 ?auto_3073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3086 - SURFACE
      ?auto_3087 - SURFACE
    )
    :vars
    (
      ?auto_3088 - HOIST
      ?auto_3089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3088 ?auto_3089 ) ( SURFACE-AT ?auto_3087 ?auto_3089 ) ( CLEAR ?auto_3087 ) ( LIFTING ?auto_3088 ?auto_3086 ) ( IS-CRATE ?auto_3086 ) ( not ( = ?auto_3086 ?auto_3087 ) ) )
    :subtasks
    ( ( !DROP ?auto_3088 ?auto_3086 ?auto_3087 ?auto_3089 )
      ( MAKE-ON-VERIFY ?auto_3086 ?auto_3087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3090 - SURFACE
      ?auto_3091 - SURFACE
    )
    :vars
    (
      ?auto_3093 - HOIST
      ?auto_3092 - PLACE
      ?auto_3094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3093 ?auto_3092 ) ( SURFACE-AT ?auto_3091 ?auto_3092 ) ( CLEAR ?auto_3091 ) ( IS-CRATE ?auto_3090 ) ( not ( = ?auto_3090 ?auto_3091 ) ) ( TRUCK-AT ?auto_3094 ?auto_3092 ) ( AVAILABLE ?auto_3093 ) ( IN ?auto_3090 ?auto_3094 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3093 ?auto_3090 ?auto_3094 ?auto_3092 )
      ( MAKE-ON ?auto_3090 ?auto_3091 )
      ( MAKE-ON-VERIFY ?auto_3090 ?auto_3091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3095 - SURFACE
      ?auto_3096 - SURFACE
    )
    :vars
    (
      ?auto_3097 - HOIST
      ?auto_3098 - PLACE
      ?auto_3099 - TRUCK
      ?auto_3100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3097 ?auto_3098 ) ( SURFACE-AT ?auto_3096 ?auto_3098 ) ( CLEAR ?auto_3096 ) ( IS-CRATE ?auto_3095 ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( AVAILABLE ?auto_3097 ) ( IN ?auto_3095 ?auto_3099 ) ( TRUCK-AT ?auto_3099 ?auto_3100 ) ( not ( = ?auto_3100 ?auto_3098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3099 ?auto_3100 ?auto_3098 )
      ( MAKE-ON ?auto_3095 ?auto_3096 )
      ( MAKE-ON-VERIFY ?auto_3095 ?auto_3096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3101 - SURFACE
      ?auto_3102 - SURFACE
    )
    :vars
    (
      ?auto_3106 - HOIST
      ?auto_3105 - PLACE
      ?auto_3104 - TRUCK
      ?auto_3103 - PLACE
      ?auto_3107 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3106 ?auto_3105 ) ( SURFACE-AT ?auto_3102 ?auto_3105 ) ( CLEAR ?auto_3102 ) ( IS-CRATE ?auto_3101 ) ( not ( = ?auto_3101 ?auto_3102 ) ) ( AVAILABLE ?auto_3106 ) ( TRUCK-AT ?auto_3104 ?auto_3103 ) ( not ( = ?auto_3103 ?auto_3105 ) ) ( HOIST-AT ?auto_3107 ?auto_3103 ) ( LIFTING ?auto_3107 ?auto_3101 ) ( not ( = ?auto_3106 ?auto_3107 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3107 ?auto_3101 ?auto_3104 ?auto_3103 )
      ( MAKE-ON ?auto_3101 ?auto_3102 )
      ( MAKE-ON-VERIFY ?auto_3101 ?auto_3102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3108 - SURFACE
      ?auto_3109 - SURFACE
    )
    :vars
    (
      ?auto_3114 - HOIST
      ?auto_3113 - PLACE
      ?auto_3111 - TRUCK
      ?auto_3112 - PLACE
      ?auto_3110 - HOIST
      ?auto_3115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3114 ?auto_3113 ) ( SURFACE-AT ?auto_3109 ?auto_3113 ) ( CLEAR ?auto_3109 ) ( IS-CRATE ?auto_3108 ) ( not ( = ?auto_3108 ?auto_3109 ) ) ( AVAILABLE ?auto_3114 ) ( TRUCK-AT ?auto_3111 ?auto_3112 ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( HOIST-AT ?auto_3110 ?auto_3112 ) ( not ( = ?auto_3114 ?auto_3110 ) ) ( AVAILABLE ?auto_3110 ) ( SURFACE-AT ?auto_3108 ?auto_3112 ) ( ON ?auto_3108 ?auto_3115 ) ( CLEAR ?auto_3108 ) ( not ( = ?auto_3108 ?auto_3115 ) ) ( not ( = ?auto_3109 ?auto_3115 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3110 ?auto_3108 ?auto_3115 ?auto_3112 )
      ( MAKE-ON ?auto_3108 ?auto_3109 )
      ( MAKE-ON-VERIFY ?auto_3108 ?auto_3109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3116 - SURFACE
      ?auto_3117 - SURFACE
    )
    :vars
    (
      ?auto_3120 - HOIST
      ?auto_3121 - PLACE
      ?auto_3122 - PLACE
      ?auto_3118 - HOIST
      ?auto_3119 - SURFACE
      ?auto_3123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3120 ?auto_3121 ) ( SURFACE-AT ?auto_3117 ?auto_3121 ) ( CLEAR ?auto_3117 ) ( IS-CRATE ?auto_3116 ) ( not ( = ?auto_3116 ?auto_3117 ) ) ( AVAILABLE ?auto_3120 ) ( not ( = ?auto_3122 ?auto_3121 ) ) ( HOIST-AT ?auto_3118 ?auto_3122 ) ( not ( = ?auto_3120 ?auto_3118 ) ) ( AVAILABLE ?auto_3118 ) ( SURFACE-AT ?auto_3116 ?auto_3122 ) ( ON ?auto_3116 ?auto_3119 ) ( CLEAR ?auto_3116 ) ( not ( = ?auto_3116 ?auto_3119 ) ) ( not ( = ?auto_3117 ?auto_3119 ) ) ( TRUCK-AT ?auto_3123 ?auto_3121 ) )
    :subtasks
    ( ( !DRIVE ?auto_3123 ?auto_3121 ?auto_3122 )
      ( MAKE-ON ?auto_3116 ?auto_3117 )
      ( MAKE-ON-VERIFY ?auto_3116 ?auto_3117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3124 - SURFACE
      ?auto_3125 - SURFACE
    )
    :vars
    (
      ?auto_3131 - HOIST
      ?auto_3129 - PLACE
      ?auto_3127 - PLACE
      ?auto_3126 - HOIST
      ?auto_3130 - SURFACE
      ?auto_3128 - TRUCK
      ?auto_3132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3131 ?auto_3129 ) ( IS-CRATE ?auto_3124 ) ( not ( = ?auto_3124 ?auto_3125 ) ) ( not ( = ?auto_3127 ?auto_3129 ) ) ( HOIST-AT ?auto_3126 ?auto_3127 ) ( not ( = ?auto_3131 ?auto_3126 ) ) ( AVAILABLE ?auto_3126 ) ( SURFACE-AT ?auto_3124 ?auto_3127 ) ( ON ?auto_3124 ?auto_3130 ) ( CLEAR ?auto_3124 ) ( not ( = ?auto_3124 ?auto_3130 ) ) ( not ( = ?auto_3125 ?auto_3130 ) ) ( TRUCK-AT ?auto_3128 ?auto_3129 ) ( SURFACE-AT ?auto_3132 ?auto_3129 ) ( CLEAR ?auto_3132 ) ( LIFTING ?auto_3131 ?auto_3125 ) ( IS-CRATE ?auto_3125 ) ( not ( = ?auto_3124 ?auto_3132 ) ) ( not ( = ?auto_3125 ?auto_3132 ) ) ( not ( = ?auto_3130 ?auto_3132 ) ) )
    :subtasks
    ( ( !DROP ?auto_3131 ?auto_3125 ?auto_3132 ?auto_3129 )
      ( MAKE-ON ?auto_3124 ?auto_3125 )
      ( MAKE-ON-VERIFY ?auto_3124 ?auto_3125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3133 - SURFACE
      ?auto_3134 - SURFACE
    )
    :vars
    (
      ?auto_3138 - HOIST
      ?auto_3137 - PLACE
      ?auto_3139 - PLACE
      ?auto_3135 - HOIST
      ?auto_3141 - SURFACE
      ?auto_3140 - TRUCK
      ?auto_3136 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3138 ?auto_3137 ) ( IS-CRATE ?auto_3133 ) ( not ( = ?auto_3133 ?auto_3134 ) ) ( not ( = ?auto_3139 ?auto_3137 ) ) ( HOIST-AT ?auto_3135 ?auto_3139 ) ( not ( = ?auto_3138 ?auto_3135 ) ) ( AVAILABLE ?auto_3135 ) ( SURFACE-AT ?auto_3133 ?auto_3139 ) ( ON ?auto_3133 ?auto_3141 ) ( CLEAR ?auto_3133 ) ( not ( = ?auto_3133 ?auto_3141 ) ) ( not ( = ?auto_3134 ?auto_3141 ) ) ( TRUCK-AT ?auto_3140 ?auto_3137 ) ( SURFACE-AT ?auto_3136 ?auto_3137 ) ( CLEAR ?auto_3136 ) ( IS-CRATE ?auto_3134 ) ( not ( = ?auto_3133 ?auto_3136 ) ) ( not ( = ?auto_3134 ?auto_3136 ) ) ( not ( = ?auto_3141 ?auto_3136 ) ) ( AVAILABLE ?auto_3138 ) ( IN ?auto_3134 ?auto_3140 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3138 ?auto_3134 ?auto_3140 ?auto_3137 )
      ( MAKE-ON ?auto_3133 ?auto_3134 )
      ( MAKE-ON-VERIFY ?auto_3133 ?auto_3134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3142 - SURFACE
      ?auto_3143 - SURFACE
    )
    :vars
    (
      ?auto_3147 - HOIST
      ?auto_3146 - PLACE
      ?auto_3148 - PLACE
      ?auto_3145 - HOIST
      ?auto_3144 - SURFACE
      ?auto_3149 - SURFACE
      ?auto_3150 - TRUCK
      ?auto_3151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3147 ?auto_3146 ) ( IS-CRATE ?auto_3142 ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3148 ?auto_3146 ) ) ( HOIST-AT ?auto_3145 ?auto_3148 ) ( not ( = ?auto_3147 ?auto_3145 ) ) ( AVAILABLE ?auto_3145 ) ( SURFACE-AT ?auto_3142 ?auto_3148 ) ( ON ?auto_3142 ?auto_3144 ) ( CLEAR ?auto_3142 ) ( not ( = ?auto_3142 ?auto_3144 ) ) ( not ( = ?auto_3143 ?auto_3144 ) ) ( SURFACE-AT ?auto_3149 ?auto_3146 ) ( CLEAR ?auto_3149 ) ( IS-CRATE ?auto_3143 ) ( not ( = ?auto_3142 ?auto_3149 ) ) ( not ( = ?auto_3143 ?auto_3149 ) ) ( not ( = ?auto_3144 ?auto_3149 ) ) ( AVAILABLE ?auto_3147 ) ( IN ?auto_3143 ?auto_3150 ) ( TRUCK-AT ?auto_3150 ?auto_3151 ) ( not ( = ?auto_3151 ?auto_3146 ) ) ( not ( = ?auto_3148 ?auto_3151 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3150 ?auto_3151 ?auto_3146 )
      ( MAKE-ON ?auto_3142 ?auto_3143 )
      ( MAKE-ON-VERIFY ?auto_3142 ?auto_3143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3152 - SURFACE
      ?auto_3153 - SURFACE
    )
    :vars
    (
      ?auto_3161 - HOIST
      ?auto_3154 - PLACE
      ?auto_3156 - PLACE
      ?auto_3155 - HOIST
      ?auto_3157 - SURFACE
      ?auto_3159 - SURFACE
      ?auto_3160 - TRUCK
      ?auto_3158 - PLACE
      ?auto_3162 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3161 ?auto_3154 ) ( IS-CRATE ?auto_3152 ) ( not ( = ?auto_3152 ?auto_3153 ) ) ( not ( = ?auto_3156 ?auto_3154 ) ) ( HOIST-AT ?auto_3155 ?auto_3156 ) ( not ( = ?auto_3161 ?auto_3155 ) ) ( AVAILABLE ?auto_3155 ) ( SURFACE-AT ?auto_3152 ?auto_3156 ) ( ON ?auto_3152 ?auto_3157 ) ( CLEAR ?auto_3152 ) ( not ( = ?auto_3152 ?auto_3157 ) ) ( not ( = ?auto_3153 ?auto_3157 ) ) ( SURFACE-AT ?auto_3159 ?auto_3154 ) ( CLEAR ?auto_3159 ) ( IS-CRATE ?auto_3153 ) ( not ( = ?auto_3152 ?auto_3159 ) ) ( not ( = ?auto_3153 ?auto_3159 ) ) ( not ( = ?auto_3157 ?auto_3159 ) ) ( AVAILABLE ?auto_3161 ) ( TRUCK-AT ?auto_3160 ?auto_3158 ) ( not ( = ?auto_3158 ?auto_3154 ) ) ( not ( = ?auto_3156 ?auto_3158 ) ) ( HOIST-AT ?auto_3162 ?auto_3158 ) ( LIFTING ?auto_3162 ?auto_3153 ) ( not ( = ?auto_3161 ?auto_3162 ) ) ( not ( = ?auto_3155 ?auto_3162 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3162 ?auto_3153 ?auto_3160 ?auto_3158 )
      ( MAKE-ON ?auto_3152 ?auto_3153 )
      ( MAKE-ON-VERIFY ?auto_3152 ?auto_3153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3163 - SURFACE
      ?auto_3164 - SURFACE
    )
    :vars
    (
      ?auto_3173 - HOIST
      ?auto_3168 - PLACE
      ?auto_3167 - PLACE
      ?auto_3172 - HOIST
      ?auto_3166 - SURFACE
      ?auto_3165 - SURFACE
      ?auto_3169 - TRUCK
      ?auto_3171 - PLACE
      ?auto_3170 - HOIST
      ?auto_3174 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3173 ?auto_3168 ) ( IS-CRATE ?auto_3163 ) ( not ( = ?auto_3163 ?auto_3164 ) ) ( not ( = ?auto_3167 ?auto_3168 ) ) ( HOIST-AT ?auto_3172 ?auto_3167 ) ( not ( = ?auto_3173 ?auto_3172 ) ) ( AVAILABLE ?auto_3172 ) ( SURFACE-AT ?auto_3163 ?auto_3167 ) ( ON ?auto_3163 ?auto_3166 ) ( CLEAR ?auto_3163 ) ( not ( = ?auto_3163 ?auto_3166 ) ) ( not ( = ?auto_3164 ?auto_3166 ) ) ( SURFACE-AT ?auto_3165 ?auto_3168 ) ( CLEAR ?auto_3165 ) ( IS-CRATE ?auto_3164 ) ( not ( = ?auto_3163 ?auto_3165 ) ) ( not ( = ?auto_3164 ?auto_3165 ) ) ( not ( = ?auto_3166 ?auto_3165 ) ) ( AVAILABLE ?auto_3173 ) ( TRUCK-AT ?auto_3169 ?auto_3171 ) ( not ( = ?auto_3171 ?auto_3168 ) ) ( not ( = ?auto_3167 ?auto_3171 ) ) ( HOIST-AT ?auto_3170 ?auto_3171 ) ( not ( = ?auto_3173 ?auto_3170 ) ) ( not ( = ?auto_3172 ?auto_3170 ) ) ( AVAILABLE ?auto_3170 ) ( SURFACE-AT ?auto_3164 ?auto_3171 ) ( ON ?auto_3164 ?auto_3174 ) ( CLEAR ?auto_3164 ) ( not ( = ?auto_3163 ?auto_3174 ) ) ( not ( = ?auto_3164 ?auto_3174 ) ) ( not ( = ?auto_3166 ?auto_3174 ) ) ( not ( = ?auto_3165 ?auto_3174 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3170 ?auto_3164 ?auto_3174 ?auto_3171 )
      ( MAKE-ON ?auto_3163 ?auto_3164 )
      ( MAKE-ON-VERIFY ?auto_3163 ?auto_3164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3175 - SURFACE
      ?auto_3176 - SURFACE
    )
    :vars
    (
      ?auto_3178 - HOIST
      ?auto_3179 - PLACE
      ?auto_3184 - PLACE
      ?auto_3182 - HOIST
      ?auto_3183 - SURFACE
      ?auto_3185 - SURFACE
      ?auto_3177 - PLACE
      ?auto_3186 - HOIST
      ?auto_3180 - SURFACE
      ?auto_3181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3178 ?auto_3179 ) ( IS-CRATE ?auto_3175 ) ( not ( = ?auto_3175 ?auto_3176 ) ) ( not ( = ?auto_3184 ?auto_3179 ) ) ( HOIST-AT ?auto_3182 ?auto_3184 ) ( not ( = ?auto_3178 ?auto_3182 ) ) ( AVAILABLE ?auto_3182 ) ( SURFACE-AT ?auto_3175 ?auto_3184 ) ( ON ?auto_3175 ?auto_3183 ) ( CLEAR ?auto_3175 ) ( not ( = ?auto_3175 ?auto_3183 ) ) ( not ( = ?auto_3176 ?auto_3183 ) ) ( SURFACE-AT ?auto_3185 ?auto_3179 ) ( CLEAR ?auto_3185 ) ( IS-CRATE ?auto_3176 ) ( not ( = ?auto_3175 ?auto_3185 ) ) ( not ( = ?auto_3176 ?auto_3185 ) ) ( not ( = ?auto_3183 ?auto_3185 ) ) ( AVAILABLE ?auto_3178 ) ( not ( = ?auto_3177 ?auto_3179 ) ) ( not ( = ?auto_3184 ?auto_3177 ) ) ( HOIST-AT ?auto_3186 ?auto_3177 ) ( not ( = ?auto_3178 ?auto_3186 ) ) ( not ( = ?auto_3182 ?auto_3186 ) ) ( AVAILABLE ?auto_3186 ) ( SURFACE-AT ?auto_3176 ?auto_3177 ) ( ON ?auto_3176 ?auto_3180 ) ( CLEAR ?auto_3176 ) ( not ( = ?auto_3175 ?auto_3180 ) ) ( not ( = ?auto_3176 ?auto_3180 ) ) ( not ( = ?auto_3183 ?auto_3180 ) ) ( not ( = ?auto_3185 ?auto_3180 ) ) ( TRUCK-AT ?auto_3181 ?auto_3179 ) )
    :subtasks
    ( ( !DRIVE ?auto_3181 ?auto_3179 ?auto_3177 )
      ( MAKE-ON ?auto_3175 ?auto_3176 )
      ( MAKE-ON-VERIFY ?auto_3175 ?auto_3176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3187 - SURFACE
      ?auto_3188 - SURFACE
    )
    :vars
    (
      ?auto_3191 - HOIST
      ?auto_3190 - PLACE
      ?auto_3197 - PLACE
      ?auto_3196 - HOIST
      ?auto_3189 - SURFACE
      ?auto_3194 - SURFACE
      ?auto_3193 - PLACE
      ?auto_3192 - HOIST
      ?auto_3198 - SURFACE
      ?auto_3195 - TRUCK
      ?auto_3199 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3191 ?auto_3190 ) ( IS-CRATE ?auto_3187 ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( not ( = ?auto_3197 ?auto_3190 ) ) ( HOIST-AT ?auto_3196 ?auto_3197 ) ( not ( = ?auto_3191 ?auto_3196 ) ) ( AVAILABLE ?auto_3196 ) ( SURFACE-AT ?auto_3187 ?auto_3197 ) ( ON ?auto_3187 ?auto_3189 ) ( CLEAR ?auto_3187 ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( IS-CRATE ?auto_3188 ) ( not ( = ?auto_3187 ?auto_3194 ) ) ( not ( = ?auto_3188 ?auto_3194 ) ) ( not ( = ?auto_3189 ?auto_3194 ) ) ( not ( = ?auto_3193 ?auto_3190 ) ) ( not ( = ?auto_3197 ?auto_3193 ) ) ( HOIST-AT ?auto_3192 ?auto_3193 ) ( not ( = ?auto_3191 ?auto_3192 ) ) ( not ( = ?auto_3196 ?auto_3192 ) ) ( AVAILABLE ?auto_3192 ) ( SURFACE-AT ?auto_3188 ?auto_3193 ) ( ON ?auto_3188 ?auto_3198 ) ( CLEAR ?auto_3188 ) ( not ( = ?auto_3187 ?auto_3198 ) ) ( not ( = ?auto_3188 ?auto_3198 ) ) ( not ( = ?auto_3189 ?auto_3198 ) ) ( not ( = ?auto_3194 ?auto_3198 ) ) ( TRUCK-AT ?auto_3195 ?auto_3190 ) ( SURFACE-AT ?auto_3199 ?auto_3190 ) ( CLEAR ?auto_3199 ) ( LIFTING ?auto_3191 ?auto_3194 ) ( IS-CRATE ?auto_3194 ) ( not ( = ?auto_3187 ?auto_3199 ) ) ( not ( = ?auto_3188 ?auto_3199 ) ) ( not ( = ?auto_3189 ?auto_3199 ) ) ( not ( = ?auto_3194 ?auto_3199 ) ) ( not ( = ?auto_3198 ?auto_3199 ) ) )
    :subtasks
    ( ( !DROP ?auto_3191 ?auto_3194 ?auto_3199 ?auto_3190 )
      ( MAKE-ON ?auto_3187 ?auto_3188 )
      ( MAKE-ON-VERIFY ?auto_3187 ?auto_3188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3200 - SURFACE
      ?auto_3201 - SURFACE
    )
    :vars
    (
      ?auto_3211 - HOIST
      ?auto_3209 - PLACE
      ?auto_3204 - PLACE
      ?auto_3205 - HOIST
      ?auto_3208 - SURFACE
      ?auto_3203 - SURFACE
      ?auto_3202 - PLACE
      ?auto_3212 - HOIST
      ?auto_3206 - SURFACE
      ?auto_3207 - TRUCK
      ?auto_3210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3211 ?auto_3209 ) ( IS-CRATE ?auto_3200 ) ( not ( = ?auto_3200 ?auto_3201 ) ) ( not ( = ?auto_3204 ?auto_3209 ) ) ( HOIST-AT ?auto_3205 ?auto_3204 ) ( not ( = ?auto_3211 ?auto_3205 ) ) ( AVAILABLE ?auto_3205 ) ( SURFACE-AT ?auto_3200 ?auto_3204 ) ( ON ?auto_3200 ?auto_3208 ) ( CLEAR ?auto_3200 ) ( not ( = ?auto_3200 ?auto_3208 ) ) ( not ( = ?auto_3201 ?auto_3208 ) ) ( IS-CRATE ?auto_3201 ) ( not ( = ?auto_3200 ?auto_3203 ) ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( not ( = ?auto_3208 ?auto_3203 ) ) ( not ( = ?auto_3202 ?auto_3209 ) ) ( not ( = ?auto_3204 ?auto_3202 ) ) ( HOIST-AT ?auto_3212 ?auto_3202 ) ( not ( = ?auto_3211 ?auto_3212 ) ) ( not ( = ?auto_3205 ?auto_3212 ) ) ( AVAILABLE ?auto_3212 ) ( SURFACE-AT ?auto_3201 ?auto_3202 ) ( ON ?auto_3201 ?auto_3206 ) ( CLEAR ?auto_3201 ) ( not ( = ?auto_3200 ?auto_3206 ) ) ( not ( = ?auto_3201 ?auto_3206 ) ) ( not ( = ?auto_3208 ?auto_3206 ) ) ( not ( = ?auto_3203 ?auto_3206 ) ) ( TRUCK-AT ?auto_3207 ?auto_3209 ) ( SURFACE-AT ?auto_3210 ?auto_3209 ) ( CLEAR ?auto_3210 ) ( IS-CRATE ?auto_3203 ) ( not ( = ?auto_3200 ?auto_3210 ) ) ( not ( = ?auto_3201 ?auto_3210 ) ) ( not ( = ?auto_3208 ?auto_3210 ) ) ( not ( = ?auto_3203 ?auto_3210 ) ) ( not ( = ?auto_3206 ?auto_3210 ) ) ( AVAILABLE ?auto_3211 ) ( IN ?auto_3203 ?auto_3207 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3211 ?auto_3203 ?auto_3207 ?auto_3209 )
      ( MAKE-ON ?auto_3200 ?auto_3201 )
      ( MAKE-ON-VERIFY ?auto_3200 ?auto_3201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3213 - SURFACE
      ?auto_3214 - SURFACE
    )
    :vars
    (
      ?auto_3224 - HOIST
      ?auto_3225 - PLACE
      ?auto_3220 - PLACE
      ?auto_3216 - HOIST
      ?auto_3223 - SURFACE
      ?auto_3219 - SURFACE
      ?auto_3222 - PLACE
      ?auto_3215 - HOIST
      ?auto_3217 - SURFACE
      ?auto_3218 - SURFACE
      ?auto_3221 - TRUCK
      ?auto_3226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3224 ?auto_3225 ) ( IS-CRATE ?auto_3213 ) ( not ( = ?auto_3213 ?auto_3214 ) ) ( not ( = ?auto_3220 ?auto_3225 ) ) ( HOIST-AT ?auto_3216 ?auto_3220 ) ( not ( = ?auto_3224 ?auto_3216 ) ) ( AVAILABLE ?auto_3216 ) ( SURFACE-AT ?auto_3213 ?auto_3220 ) ( ON ?auto_3213 ?auto_3223 ) ( CLEAR ?auto_3213 ) ( not ( = ?auto_3213 ?auto_3223 ) ) ( not ( = ?auto_3214 ?auto_3223 ) ) ( IS-CRATE ?auto_3214 ) ( not ( = ?auto_3213 ?auto_3219 ) ) ( not ( = ?auto_3214 ?auto_3219 ) ) ( not ( = ?auto_3223 ?auto_3219 ) ) ( not ( = ?auto_3222 ?auto_3225 ) ) ( not ( = ?auto_3220 ?auto_3222 ) ) ( HOIST-AT ?auto_3215 ?auto_3222 ) ( not ( = ?auto_3224 ?auto_3215 ) ) ( not ( = ?auto_3216 ?auto_3215 ) ) ( AVAILABLE ?auto_3215 ) ( SURFACE-AT ?auto_3214 ?auto_3222 ) ( ON ?auto_3214 ?auto_3217 ) ( CLEAR ?auto_3214 ) ( not ( = ?auto_3213 ?auto_3217 ) ) ( not ( = ?auto_3214 ?auto_3217 ) ) ( not ( = ?auto_3223 ?auto_3217 ) ) ( not ( = ?auto_3219 ?auto_3217 ) ) ( SURFACE-AT ?auto_3218 ?auto_3225 ) ( CLEAR ?auto_3218 ) ( IS-CRATE ?auto_3219 ) ( not ( = ?auto_3213 ?auto_3218 ) ) ( not ( = ?auto_3214 ?auto_3218 ) ) ( not ( = ?auto_3223 ?auto_3218 ) ) ( not ( = ?auto_3219 ?auto_3218 ) ) ( not ( = ?auto_3217 ?auto_3218 ) ) ( AVAILABLE ?auto_3224 ) ( IN ?auto_3219 ?auto_3221 ) ( TRUCK-AT ?auto_3221 ?auto_3226 ) ( not ( = ?auto_3226 ?auto_3225 ) ) ( not ( = ?auto_3220 ?auto_3226 ) ) ( not ( = ?auto_3222 ?auto_3226 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3221 ?auto_3226 ?auto_3225 )
      ( MAKE-ON ?auto_3213 ?auto_3214 )
      ( MAKE-ON-VERIFY ?auto_3213 ?auto_3214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3227 - SURFACE
      ?auto_3228 - SURFACE
    )
    :vars
    (
      ?auto_3236 - HOIST
      ?auto_3238 - PLACE
      ?auto_3234 - PLACE
      ?auto_3240 - HOIST
      ?auto_3232 - SURFACE
      ?auto_3233 - SURFACE
      ?auto_3235 - PLACE
      ?auto_3230 - HOIST
      ?auto_3237 - SURFACE
      ?auto_3239 - SURFACE
      ?auto_3231 - TRUCK
      ?auto_3229 - PLACE
      ?auto_3241 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3236 ?auto_3238 ) ( IS-CRATE ?auto_3227 ) ( not ( = ?auto_3227 ?auto_3228 ) ) ( not ( = ?auto_3234 ?auto_3238 ) ) ( HOIST-AT ?auto_3240 ?auto_3234 ) ( not ( = ?auto_3236 ?auto_3240 ) ) ( AVAILABLE ?auto_3240 ) ( SURFACE-AT ?auto_3227 ?auto_3234 ) ( ON ?auto_3227 ?auto_3232 ) ( CLEAR ?auto_3227 ) ( not ( = ?auto_3227 ?auto_3232 ) ) ( not ( = ?auto_3228 ?auto_3232 ) ) ( IS-CRATE ?auto_3228 ) ( not ( = ?auto_3227 ?auto_3233 ) ) ( not ( = ?auto_3228 ?auto_3233 ) ) ( not ( = ?auto_3232 ?auto_3233 ) ) ( not ( = ?auto_3235 ?auto_3238 ) ) ( not ( = ?auto_3234 ?auto_3235 ) ) ( HOIST-AT ?auto_3230 ?auto_3235 ) ( not ( = ?auto_3236 ?auto_3230 ) ) ( not ( = ?auto_3240 ?auto_3230 ) ) ( AVAILABLE ?auto_3230 ) ( SURFACE-AT ?auto_3228 ?auto_3235 ) ( ON ?auto_3228 ?auto_3237 ) ( CLEAR ?auto_3228 ) ( not ( = ?auto_3227 ?auto_3237 ) ) ( not ( = ?auto_3228 ?auto_3237 ) ) ( not ( = ?auto_3232 ?auto_3237 ) ) ( not ( = ?auto_3233 ?auto_3237 ) ) ( SURFACE-AT ?auto_3239 ?auto_3238 ) ( CLEAR ?auto_3239 ) ( IS-CRATE ?auto_3233 ) ( not ( = ?auto_3227 ?auto_3239 ) ) ( not ( = ?auto_3228 ?auto_3239 ) ) ( not ( = ?auto_3232 ?auto_3239 ) ) ( not ( = ?auto_3233 ?auto_3239 ) ) ( not ( = ?auto_3237 ?auto_3239 ) ) ( AVAILABLE ?auto_3236 ) ( TRUCK-AT ?auto_3231 ?auto_3229 ) ( not ( = ?auto_3229 ?auto_3238 ) ) ( not ( = ?auto_3234 ?auto_3229 ) ) ( not ( = ?auto_3235 ?auto_3229 ) ) ( HOIST-AT ?auto_3241 ?auto_3229 ) ( LIFTING ?auto_3241 ?auto_3233 ) ( not ( = ?auto_3236 ?auto_3241 ) ) ( not ( = ?auto_3240 ?auto_3241 ) ) ( not ( = ?auto_3230 ?auto_3241 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3241 ?auto_3233 ?auto_3231 ?auto_3229 )
      ( MAKE-ON ?auto_3227 ?auto_3228 )
      ( MAKE-ON-VERIFY ?auto_3227 ?auto_3228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3242 - SURFACE
      ?auto_3243 - SURFACE
    )
    :vars
    (
      ?auto_3246 - HOIST
      ?auto_3245 - PLACE
      ?auto_3244 - PLACE
      ?auto_3256 - HOIST
      ?auto_3250 - SURFACE
      ?auto_3248 - SURFACE
      ?auto_3254 - PLACE
      ?auto_3251 - HOIST
      ?auto_3255 - SURFACE
      ?auto_3249 - SURFACE
      ?auto_3247 - TRUCK
      ?auto_3252 - PLACE
      ?auto_3253 - HOIST
      ?auto_3257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3246 ?auto_3245 ) ( IS-CRATE ?auto_3242 ) ( not ( = ?auto_3242 ?auto_3243 ) ) ( not ( = ?auto_3244 ?auto_3245 ) ) ( HOIST-AT ?auto_3256 ?auto_3244 ) ( not ( = ?auto_3246 ?auto_3256 ) ) ( AVAILABLE ?auto_3256 ) ( SURFACE-AT ?auto_3242 ?auto_3244 ) ( ON ?auto_3242 ?auto_3250 ) ( CLEAR ?auto_3242 ) ( not ( = ?auto_3242 ?auto_3250 ) ) ( not ( = ?auto_3243 ?auto_3250 ) ) ( IS-CRATE ?auto_3243 ) ( not ( = ?auto_3242 ?auto_3248 ) ) ( not ( = ?auto_3243 ?auto_3248 ) ) ( not ( = ?auto_3250 ?auto_3248 ) ) ( not ( = ?auto_3254 ?auto_3245 ) ) ( not ( = ?auto_3244 ?auto_3254 ) ) ( HOIST-AT ?auto_3251 ?auto_3254 ) ( not ( = ?auto_3246 ?auto_3251 ) ) ( not ( = ?auto_3256 ?auto_3251 ) ) ( AVAILABLE ?auto_3251 ) ( SURFACE-AT ?auto_3243 ?auto_3254 ) ( ON ?auto_3243 ?auto_3255 ) ( CLEAR ?auto_3243 ) ( not ( = ?auto_3242 ?auto_3255 ) ) ( not ( = ?auto_3243 ?auto_3255 ) ) ( not ( = ?auto_3250 ?auto_3255 ) ) ( not ( = ?auto_3248 ?auto_3255 ) ) ( SURFACE-AT ?auto_3249 ?auto_3245 ) ( CLEAR ?auto_3249 ) ( IS-CRATE ?auto_3248 ) ( not ( = ?auto_3242 ?auto_3249 ) ) ( not ( = ?auto_3243 ?auto_3249 ) ) ( not ( = ?auto_3250 ?auto_3249 ) ) ( not ( = ?auto_3248 ?auto_3249 ) ) ( not ( = ?auto_3255 ?auto_3249 ) ) ( AVAILABLE ?auto_3246 ) ( TRUCK-AT ?auto_3247 ?auto_3252 ) ( not ( = ?auto_3252 ?auto_3245 ) ) ( not ( = ?auto_3244 ?auto_3252 ) ) ( not ( = ?auto_3254 ?auto_3252 ) ) ( HOIST-AT ?auto_3253 ?auto_3252 ) ( not ( = ?auto_3246 ?auto_3253 ) ) ( not ( = ?auto_3256 ?auto_3253 ) ) ( not ( = ?auto_3251 ?auto_3253 ) ) ( AVAILABLE ?auto_3253 ) ( SURFACE-AT ?auto_3248 ?auto_3252 ) ( ON ?auto_3248 ?auto_3257 ) ( CLEAR ?auto_3248 ) ( not ( = ?auto_3242 ?auto_3257 ) ) ( not ( = ?auto_3243 ?auto_3257 ) ) ( not ( = ?auto_3250 ?auto_3257 ) ) ( not ( = ?auto_3248 ?auto_3257 ) ) ( not ( = ?auto_3255 ?auto_3257 ) ) ( not ( = ?auto_3249 ?auto_3257 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3253 ?auto_3248 ?auto_3257 ?auto_3252 )
      ( MAKE-ON ?auto_3242 ?auto_3243 )
      ( MAKE-ON-VERIFY ?auto_3242 ?auto_3243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3258 - SURFACE
      ?auto_3259 - SURFACE
    )
    :vars
    (
      ?auto_3271 - HOIST
      ?auto_3269 - PLACE
      ?auto_3265 - PLACE
      ?auto_3260 - HOIST
      ?auto_3261 - SURFACE
      ?auto_3268 - SURFACE
      ?auto_3263 - PLACE
      ?auto_3262 - HOIST
      ?auto_3264 - SURFACE
      ?auto_3267 - SURFACE
      ?auto_3266 - PLACE
      ?auto_3272 - HOIST
      ?auto_3273 - SURFACE
      ?auto_3270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3271 ?auto_3269 ) ( IS-CRATE ?auto_3258 ) ( not ( = ?auto_3258 ?auto_3259 ) ) ( not ( = ?auto_3265 ?auto_3269 ) ) ( HOIST-AT ?auto_3260 ?auto_3265 ) ( not ( = ?auto_3271 ?auto_3260 ) ) ( AVAILABLE ?auto_3260 ) ( SURFACE-AT ?auto_3258 ?auto_3265 ) ( ON ?auto_3258 ?auto_3261 ) ( CLEAR ?auto_3258 ) ( not ( = ?auto_3258 ?auto_3261 ) ) ( not ( = ?auto_3259 ?auto_3261 ) ) ( IS-CRATE ?auto_3259 ) ( not ( = ?auto_3258 ?auto_3268 ) ) ( not ( = ?auto_3259 ?auto_3268 ) ) ( not ( = ?auto_3261 ?auto_3268 ) ) ( not ( = ?auto_3263 ?auto_3269 ) ) ( not ( = ?auto_3265 ?auto_3263 ) ) ( HOIST-AT ?auto_3262 ?auto_3263 ) ( not ( = ?auto_3271 ?auto_3262 ) ) ( not ( = ?auto_3260 ?auto_3262 ) ) ( AVAILABLE ?auto_3262 ) ( SURFACE-AT ?auto_3259 ?auto_3263 ) ( ON ?auto_3259 ?auto_3264 ) ( CLEAR ?auto_3259 ) ( not ( = ?auto_3258 ?auto_3264 ) ) ( not ( = ?auto_3259 ?auto_3264 ) ) ( not ( = ?auto_3261 ?auto_3264 ) ) ( not ( = ?auto_3268 ?auto_3264 ) ) ( SURFACE-AT ?auto_3267 ?auto_3269 ) ( CLEAR ?auto_3267 ) ( IS-CRATE ?auto_3268 ) ( not ( = ?auto_3258 ?auto_3267 ) ) ( not ( = ?auto_3259 ?auto_3267 ) ) ( not ( = ?auto_3261 ?auto_3267 ) ) ( not ( = ?auto_3268 ?auto_3267 ) ) ( not ( = ?auto_3264 ?auto_3267 ) ) ( AVAILABLE ?auto_3271 ) ( not ( = ?auto_3266 ?auto_3269 ) ) ( not ( = ?auto_3265 ?auto_3266 ) ) ( not ( = ?auto_3263 ?auto_3266 ) ) ( HOIST-AT ?auto_3272 ?auto_3266 ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( not ( = ?auto_3260 ?auto_3272 ) ) ( not ( = ?auto_3262 ?auto_3272 ) ) ( AVAILABLE ?auto_3272 ) ( SURFACE-AT ?auto_3268 ?auto_3266 ) ( ON ?auto_3268 ?auto_3273 ) ( CLEAR ?auto_3268 ) ( not ( = ?auto_3258 ?auto_3273 ) ) ( not ( = ?auto_3259 ?auto_3273 ) ) ( not ( = ?auto_3261 ?auto_3273 ) ) ( not ( = ?auto_3268 ?auto_3273 ) ) ( not ( = ?auto_3264 ?auto_3273 ) ) ( not ( = ?auto_3267 ?auto_3273 ) ) ( TRUCK-AT ?auto_3270 ?auto_3269 ) )
    :subtasks
    ( ( !DRIVE ?auto_3270 ?auto_3269 ?auto_3266 )
      ( MAKE-ON ?auto_3258 ?auto_3259 )
      ( MAKE-ON-VERIFY ?auto_3258 ?auto_3259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3276 - SURFACE
      ?auto_3277 - SURFACE
    )
    :vars
    (
      ?auto_3278 - HOIST
      ?auto_3279 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3278 ?auto_3279 ) ( SURFACE-AT ?auto_3277 ?auto_3279 ) ( CLEAR ?auto_3277 ) ( LIFTING ?auto_3278 ?auto_3276 ) ( IS-CRATE ?auto_3276 ) ( not ( = ?auto_3276 ?auto_3277 ) ) )
    :subtasks
    ( ( !DROP ?auto_3278 ?auto_3276 ?auto_3277 ?auto_3279 )
      ( MAKE-ON-VERIFY ?auto_3276 ?auto_3277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3280 - SURFACE
      ?auto_3281 - SURFACE
    )
    :vars
    (
      ?auto_3282 - HOIST
      ?auto_3283 - PLACE
      ?auto_3284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3282 ?auto_3283 ) ( SURFACE-AT ?auto_3281 ?auto_3283 ) ( CLEAR ?auto_3281 ) ( IS-CRATE ?auto_3280 ) ( not ( = ?auto_3280 ?auto_3281 ) ) ( TRUCK-AT ?auto_3284 ?auto_3283 ) ( AVAILABLE ?auto_3282 ) ( IN ?auto_3280 ?auto_3284 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3282 ?auto_3280 ?auto_3284 ?auto_3283 )
      ( MAKE-ON ?auto_3280 ?auto_3281 )
      ( MAKE-ON-VERIFY ?auto_3280 ?auto_3281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3285 - SURFACE
      ?auto_3286 - SURFACE
    )
    :vars
    (
      ?auto_3287 - HOIST
      ?auto_3289 - PLACE
      ?auto_3288 - TRUCK
      ?auto_3290 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3287 ?auto_3289 ) ( SURFACE-AT ?auto_3286 ?auto_3289 ) ( CLEAR ?auto_3286 ) ( IS-CRATE ?auto_3285 ) ( not ( = ?auto_3285 ?auto_3286 ) ) ( AVAILABLE ?auto_3287 ) ( IN ?auto_3285 ?auto_3288 ) ( TRUCK-AT ?auto_3288 ?auto_3290 ) ( not ( = ?auto_3290 ?auto_3289 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3288 ?auto_3290 ?auto_3289 )
      ( MAKE-ON ?auto_3285 ?auto_3286 )
      ( MAKE-ON-VERIFY ?auto_3285 ?auto_3286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3291 - SURFACE
      ?auto_3292 - SURFACE
    )
    :vars
    (
      ?auto_3296 - HOIST
      ?auto_3295 - PLACE
      ?auto_3294 - TRUCK
      ?auto_3293 - PLACE
      ?auto_3297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3296 ?auto_3295 ) ( SURFACE-AT ?auto_3292 ?auto_3295 ) ( CLEAR ?auto_3292 ) ( IS-CRATE ?auto_3291 ) ( not ( = ?auto_3291 ?auto_3292 ) ) ( AVAILABLE ?auto_3296 ) ( TRUCK-AT ?auto_3294 ?auto_3293 ) ( not ( = ?auto_3293 ?auto_3295 ) ) ( HOIST-AT ?auto_3297 ?auto_3293 ) ( LIFTING ?auto_3297 ?auto_3291 ) ( not ( = ?auto_3296 ?auto_3297 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3297 ?auto_3291 ?auto_3294 ?auto_3293 )
      ( MAKE-ON ?auto_3291 ?auto_3292 )
      ( MAKE-ON-VERIFY ?auto_3291 ?auto_3292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3298 - SURFACE
      ?auto_3299 - SURFACE
    )
    :vars
    (
      ?auto_3303 - HOIST
      ?auto_3302 - PLACE
      ?auto_3300 - TRUCK
      ?auto_3301 - PLACE
      ?auto_3304 - HOIST
      ?auto_3305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3303 ?auto_3302 ) ( SURFACE-AT ?auto_3299 ?auto_3302 ) ( CLEAR ?auto_3299 ) ( IS-CRATE ?auto_3298 ) ( not ( = ?auto_3298 ?auto_3299 ) ) ( AVAILABLE ?auto_3303 ) ( TRUCK-AT ?auto_3300 ?auto_3301 ) ( not ( = ?auto_3301 ?auto_3302 ) ) ( HOIST-AT ?auto_3304 ?auto_3301 ) ( not ( = ?auto_3303 ?auto_3304 ) ) ( AVAILABLE ?auto_3304 ) ( SURFACE-AT ?auto_3298 ?auto_3301 ) ( ON ?auto_3298 ?auto_3305 ) ( CLEAR ?auto_3298 ) ( not ( = ?auto_3298 ?auto_3305 ) ) ( not ( = ?auto_3299 ?auto_3305 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3304 ?auto_3298 ?auto_3305 ?auto_3301 )
      ( MAKE-ON ?auto_3298 ?auto_3299 )
      ( MAKE-ON-VERIFY ?auto_3298 ?auto_3299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3306 - SURFACE
      ?auto_3307 - SURFACE
    )
    :vars
    (
      ?auto_3310 - HOIST
      ?auto_3313 - PLACE
      ?auto_3309 - PLACE
      ?auto_3311 - HOIST
      ?auto_3308 - SURFACE
      ?auto_3312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3310 ?auto_3313 ) ( SURFACE-AT ?auto_3307 ?auto_3313 ) ( CLEAR ?auto_3307 ) ( IS-CRATE ?auto_3306 ) ( not ( = ?auto_3306 ?auto_3307 ) ) ( AVAILABLE ?auto_3310 ) ( not ( = ?auto_3309 ?auto_3313 ) ) ( HOIST-AT ?auto_3311 ?auto_3309 ) ( not ( = ?auto_3310 ?auto_3311 ) ) ( AVAILABLE ?auto_3311 ) ( SURFACE-AT ?auto_3306 ?auto_3309 ) ( ON ?auto_3306 ?auto_3308 ) ( CLEAR ?auto_3306 ) ( not ( = ?auto_3306 ?auto_3308 ) ) ( not ( = ?auto_3307 ?auto_3308 ) ) ( TRUCK-AT ?auto_3312 ?auto_3313 ) )
    :subtasks
    ( ( !DRIVE ?auto_3312 ?auto_3313 ?auto_3309 )
      ( MAKE-ON ?auto_3306 ?auto_3307 )
      ( MAKE-ON-VERIFY ?auto_3306 ?auto_3307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3314 - SURFACE
      ?auto_3315 - SURFACE
    )
    :vars
    (
      ?auto_3316 - HOIST
      ?auto_3318 - PLACE
      ?auto_3319 - PLACE
      ?auto_3321 - HOIST
      ?auto_3320 - SURFACE
      ?auto_3317 - TRUCK
      ?auto_3322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3316 ?auto_3318 ) ( IS-CRATE ?auto_3314 ) ( not ( = ?auto_3314 ?auto_3315 ) ) ( not ( = ?auto_3319 ?auto_3318 ) ) ( HOIST-AT ?auto_3321 ?auto_3319 ) ( not ( = ?auto_3316 ?auto_3321 ) ) ( AVAILABLE ?auto_3321 ) ( SURFACE-AT ?auto_3314 ?auto_3319 ) ( ON ?auto_3314 ?auto_3320 ) ( CLEAR ?auto_3314 ) ( not ( = ?auto_3314 ?auto_3320 ) ) ( not ( = ?auto_3315 ?auto_3320 ) ) ( TRUCK-AT ?auto_3317 ?auto_3318 ) ( SURFACE-AT ?auto_3322 ?auto_3318 ) ( CLEAR ?auto_3322 ) ( LIFTING ?auto_3316 ?auto_3315 ) ( IS-CRATE ?auto_3315 ) ( not ( = ?auto_3314 ?auto_3322 ) ) ( not ( = ?auto_3315 ?auto_3322 ) ) ( not ( = ?auto_3320 ?auto_3322 ) ) )
    :subtasks
    ( ( !DROP ?auto_3316 ?auto_3315 ?auto_3322 ?auto_3318 )
      ( MAKE-ON ?auto_3314 ?auto_3315 )
      ( MAKE-ON-VERIFY ?auto_3314 ?auto_3315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3323 - SURFACE
      ?auto_3324 - SURFACE
    )
    :vars
    (
      ?auto_3331 - HOIST
      ?auto_3327 - PLACE
      ?auto_3330 - PLACE
      ?auto_3325 - HOIST
      ?auto_3328 - SURFACE
      ?auto_3326 - TRUCK
      ?auto_3329 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3331 ?auto_3327 ) ( IS-CRATE ?auto_3323 ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( not ( = ?auto_3330 ?auto_3327 ) ) ( HOIST-AT ?auto_3325 ?auto_3330 ) ( not ( = ?auto_3331 ?auto_3325 ) ) ( AVAILABLE ?auto_3325 ) ( SURFACE-AT ?auto_3323 ?auto_3330 ) ( ON ?auto_3323 ?auto_3328 ) ( CLEAR ?auto_3323 ) ( not ( = ?auto_3323 ?auto_3328 ) ) ( not ( = ?auto_3324 ?auto_3328 ) ) ( TRUCK-AT ?auto_3326 ?auto_3327 ) ( SURFACE-AT ?auto_3329 ?auto_3327 ) ( CLEAR ?auto_3329 ) ( IS-CRATE ?auto_3324 ) ( not ( = ?auto_3323 ?auto_3329 ) ) ( not ( = ?auto_3324 ?auto_3329 ) ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( AVAILABLE ?auto_3331 ) ( IN ?auto_3324 ?auto_3326 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3331 ?auto_3324 ?auto_3326 ?auto_3327 )
      ( MAKE-ON ?auto_3323 ?auto_3324 )
      ( MAKE-ON-VERIFY ?auto_3323 ?auto_3324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3332 - SURFACE
      ?auto_3333 - SURFACE
    )
    :vars
    (
      ?auto_3337 - HOIST
      ?auto_3340 - PLACE
      ?auto_3334 - PLACE
      ?auto_3335 - HOIST
      ?auto_3339 - SURFACE
      ?auto_3338 - SURFACE
      ?auto_3336 - TRUCK
      ?auto_3341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3337 ?auto_3340 ) ( IS-CRATE ?auto_3332 ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( not ( = ?auto_3334 ?auto_3340 ) ) ( HOIST-AT ?auto_3335 ?auto_3334 ) ( not ( = ?auto_3337 ?auto_3335 ) ) ( AVAILABLE ?auto_3335 ) ( SURFACE-AT ?auto_3332 ?auto_3334 ) ( ON ?auto_3332 ?auto_3339 ) ( CLEAR ?auto_3332 ) ( not ( = ?auto_3332 ?auto_3339 ) ) ( not ( = ?auto_3333 ?auto_3339 ) ) ( SURFACE-AT ?auto_3338 ?auto_3340 ) ( CLEAR ?auto_3338 ) ( IS-CRATE ?auto_3333 ) ( not ( = ?auto_3332 ?auto_3338 ) ) ( not ( = ?auto_3333 ?auto_3338 ) ) ( not ( = ?auto_3339 ?auto_3338 ) ) ( AVAILABLE ?auto_3337 ) ( IN ?auto_3333 ?auto_3336 ) ( TRUCK-AT ?auto_3336 ?auto_3341 ) ( not ( = ?auto_3341 ?auto_3340 ) ) ( not ( = ?auto_3334 ?auto_3341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3336 ?auto_3341 ?auto_3340 )
      ( MAKE-ON ?auto_3332 ?auto_3333 )
      ( MAKE-ON-VERIFY ?auto_3332 ?auto_3333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3342 - SURFACE
      ?auto_3343 - SURFACE
    )
    :vars
    (
      ?auto_3350 - HOIST
      ?auto_3349 - PLACE
      ?auto_3348 - PLACE
      ?auto_3347 - HOIST
      ?auto_3344 - SURFACE
      ?auto_3346 - SURFACE
      ?auto_3351 - TRUCK
      ?auto_3345 - PLACE
      ?auto_3352 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3350 ?auto_3349 ) ( IS-CRATE ?auto_3342 ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( not ( = ?auto_3348 ?auto_3349 ) ) ( HOIST-AT ?auto_3347 ?auto_3348 ) ( not ( = ?auto_3350 ?auto_3347 ) ) ( AVAILABLE ?auto_3347 ) ( SURFACE-AT ?auto_3342 ?auto_3348 ) ( ON ?auto_3342 ?auto_3344 ) ( CLEAR ?auto_3342 ) ( not ( = ?auto_3342 ?auto_3344 ) ) ( not ( = ?auto_3343 ?auto_3344 ) ) ( SURFACE-AT ?auto_3346 ?auto_3349 ) ( CLEAR ?auto_3346 ) ( IS-CRATE ?auto_3343 ) ( not ( = ?auto_3342 ?auto_3346 ) ) ( not ( = ?auto_3343 ?auto_3346 ) ) ( not ( = ?auto_3344 ?auto_3346 ) ) ( AVAILABLE ?auto_3350 ) ( TRUCK-AT ?auto_3351 ?auto_3345 ) ( not ( = ?auto_3345 ?auto_3349 ) ) ( not ( = ?auto_3348 ?auto_3345 ) ) ( HOIST-AT ?auto_3352 ?auto_3345 ) ( LIFTING ?auto_3352 ?auto_3343 ) ( not ( = ?auto_3350 ?auto_3352 ) ) ( not ( = ?auto_3347 ?auto_3352 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3352 ?auto_3343 ?auto_3351 ?auto_3345 )
      ( MAKE-ON ?auto_3342 ?auto_3343 )
      ( MAKE-ON-VERIFY ?auto_3342 ?auto_3343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3353 - SURFACE
      ?auto_3354 - SURFACE
    )
    :vars
    (
      ?auto_3363 - HOIST
      ?auto_3357 - PLACE
      ?auto_3356 - PLACE
      ?auto_3359 - HOIST
      ?auto_3362 - SURFACE
      ?auto_3360 - SURFACE
      ?auto_3355 - TRUCK
      ?auto_3358 - PLACE
      ?auto_3361 - HOIST
      ?auto_3364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3363 ?auto_3357 ) ( IS-CRATE ?auto_3353 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( HOIST-AT ?auto_3359 ?auto_3356 ) ( not ( = ?auto_3363 ?auto_3359 ) ) ( AVAILABLE ?auto_3359 ) ( SURFACE-AT ?auto_3353 ?auto_3356 ) ( ON ?auto_3353 ?auto_3362 ) ( CLEAR ?auto_3353 ) ( not ( = ?auto_3353 ?auto_3362 ) ) ( not ( = ?auto_3354 ?auto_3362 ) ) ( SURFACE-AT ?auto_3360 ?auto_3357 ) ( CLEAR ?auto_3360 ) ( IS-CRATE ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3360 ) ) ( not ( = ?auto_3354 ?auto_3360 ) ) ( not ( = ?auto_3362 ?auto_3360 ) ) ( AVAILABLE ?auto_3363 ) ( TRUCK-AT ?auto_3355 ?auto_3358 ) ( not ( = ?auto_3358 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3358 ) ) ( HOIST-AT ?auto_3361 ?auto_3358 ) ( not ( = ?auto_3363 ?auto_3361 ) ) ( not ( = ?auto_3359 ?auto_3361 ) ) ( AVAILABLE ?auto_3361 ) ( SURFACE-AT ?auto_3354 ?auto_3358 ) ( ON ?auto_3354 ?auto_3364 ) ( CLEAR ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3364 ) ) ( not ( = ?auto_3354 ?auto_3364 ) ) ( not ( = ?auto_3362 ?auto_3364 ) ) ( not ( = ?auto_3360 ?auto_3364 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3361 ?auto_3354 ?auto_3364 ?auto_3358 )
      ( MAKE-ON ?auto_3353 ?auto_3354 )
      ( MAKE-ON-VERIFY ?auto_3353 ?auto_3354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3365 - SURFACE
      ?auto_3366 - SURFACE
    )
    :vars
    (
      ?auto_3368 - HOIST
      ?auto_3375 - PLACE
      ?auto_3373 - PLACE
      ?auto_3369 - HOIST
      ?auto_3374 - SURFACE
      ?auto_3370 - SURFACE
      ?auto_3371 - PLACE
      ?auto_3376 - HOIST
      ?auto_3367 - SURFACE
      ?auto_3372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3368 ?auto_3375 ) ( IS-CRATE ?auto_3365 ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( HOIST-AT ?auto_3369 ?auto_3373 ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( AVAILABLE ?auto_3369 ) ( SURFACE-AT ?auto_3365 ?auto_3373 ) ( ON ?auto_3365 ?auto_3374 ) ( CLEAR ?auto_3365 ) ( not ( = ?auto_3365 ?auto_3374 ) ) ( not ( = ?auto_3366 ?auto_3374 ) ) ( SURFACE-AT ?auto_3370 ?auto_3375 ) ( CLEAR ?auto_3370 ) ( IS-CRATE ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3370 ) ) ( not ( = ?auto_3366 ?auto_3370 ) ) ( not ( = ?auto_3374 ?auto_3370 ) ) ( AVAILABLE ?auto_3368 ) ( not ( = ?auto_3371 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3371 ) ) ( HOIST-AT ?auto_3376 ?auto_3371 ) ( not ( = ?auto_3368 ?auto_3376 ) ) ( not ( = ?auto_3369 ?auto_3376 ) ) ( AVAILABLE ?auto_3376 ) ( SURFACE-AT ?auto_3366 ?auto_3371 ) ( ON ?auto_3366 ?auto_3367 ) ( CLEAR ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3367 ) ) ( not ( = ?auto_3366 ?auto_3367 ) ) ( not ( = ?auto_3374 ?auto_3367 ) ) ( not ( = ?auto_3370 ?auto_3367 ) ) ( TRUCK-AT ?auto_3372 ?auto_3375 ) )
    :subtasks
    ( ( !DRIVE ?auto_3372 ?auto_3375 ?auto_3371 )
      ( MAKE-ON ?auto_3365 ?auto_3366 )
      ( MAKE-ON-VERIFY ?auto_3365 ?auto_3366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3377 - SURFACE
      ?auto_3378 - SURFACE
    )
    :vars
    (
      ?auto_3379 - HOIST
      ?auto_3387 - PLACE
      ?auto_3386 - PLACE
      ?auto_3383 - HOIST
      ?auto_3381 - SURFACE
      ?auto_3388 - SURFACE
      ?auto_3380 - PLACE
      ?auto_3384 - HOIST
      ?auto_3385 - SURFACE
      ?auto_3382 - TRUCK
      ?auto_3389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3379 ?auto_3387 ) ( IS-CRATE ?auto_3377 ) ( not ( = ?auto_3377 ?auto_3378 ) ) ( not ( = ?auto_3386 ?auto_3387 ) ) ( HOIST-AT ?auto_3383 ?auto_3386 ) ( not ( = ?auto_3379 ?auto_3383 ) ) ( AVAILABLE ?auto_3383 ) ( SURFACE-AT ?auto_3377 ?auto_3386 ) ( ON ?auto_3377 ?auto_3381 ) ( CLEAR ?auto_3377 ) ( not ( = ?auto_3377 ?auto_3381 ) ) ( not ( = ?auto_3378 ?auto_3381 ) ) ( IS-CRATE ?auto_3378 ) ( not ( = ?auto_3377 ?auto_3388 ) ) ( not ( = ?auto_3378 ?auto_3388 ) ) ( not ( = ?auto_3381 ?auto_3388 ) ) ( not ( = ?auto_3380 ?auto_3387 ) ) ( not ( = ?auto_3386 ?auto_3380 ) ) ( HOIST-AT ?auto_3384 ?auto_3380 ) ( not ( = ?auto_3379 ?auto_3384 ) ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( AVAILABLE ?auto_3384 ) ( SURFACE-AT ?auto_3378 ?auto_3380 ) ( ON ?auto_3378 ?auto_3385 ) ( CLEAR ?auto_3378 ) ( not ( = ?auto_3377 ?auto_3385 ) ) ( not ( = ?auto_3378 ?auto_3385 ) ) ( not ( = ?auto_3381 ?auto_3385 ) ) ( not ( = ?auto_3388 ?auto_3385 ) ) ( TRUCK-AT ?auto_3382 ?auto_3387 ) ( SURFACE-AT ?auto_3389 ?auto_3387 ) ( CLEAR ?auto_3389 ) ( LIFTING ?auto_3379 ?auto_3388 ) ( IS-CRATE ?auto_3388 ) ( not ( = ?auto_3377 ?auto_3389 ) ) ( not ( = ?auto_3378 ?auto_3389 ) ) ( not ( = ?auto_3381 ?auto_3389 ) ) ( not ( = ?auto_3388 ?auto_3389 ) ) ( not ( = ?auto_3385 ?auto_3389 ) ) )
    :subtasks
    ( ( !DROP ?auto_3379 ?auto_3388 ?auto_3389 ?auto_3387 )
      ( MAKE-ON ?auto_3377 ?auto_3378 )
      ( MAKE-ON-VERIFY ?auto_3377 ?auto_3378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3390 - SURFACE
      ?auto_3391 - SURFACE
    )
    :vars
    (
      ?auto_3402 - HOIST
      ?auto_3401 - PLACE
      ?auto_3399 - PLACE
      ?auto_3396 - HOIST
      ?auto_3395 - SURFACE
      ?auto_3398 - SURFACE
      ?auto_3393 - PLACE
      ?auto_3394 - HOIST
      ?auto_3397 - SURFACE
      ?auto_3392 - TRUCK
      ?auto_3400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3402 ?auto_3401 ) ( IS-CRATE ?auto_3390 ) ( not ( = ?auto_3390 ?auto_3391 ) ) ( not ( = ?auto_3399 ?auto_3401 ) ) ( HOIST-AT ?auto_3396 ?auto_3399 ) ( not ( = ?auto_3402 ?auto_3396 ) ) ( AVAILABLE ?auto_3396 ) ( SURFACE-AT ?auto_3390 ?auto_3399 ) ( ON ?auto_3390 ?auto_3395 ) ( CLEAR ?auto_3390 ) ( not ( = ?auto_3390 ?auto_3395 ) ) ( not ( = ?auto_3391 ?auto_3395 ) ) ( IS-CRATE ?auto_3391 ) ( not ( = ?auto_3390 ?auto_3398 ) ) ( not ( = ?auto_3391 ?auto_3398 ) ) ( not ( = ?auto_3395 ?auto_3398 ) ) ( not ( = ?auto_3393 ?auto_3401 ) ) ( not ( = ?auto_3399 ?auto_3393 ) ) ( HOIST-AT ?auto_3394 ?auto_3393 ) ( not ( = ?auto_3402 ?auto_3394 ) ) ( not ( = ?auto_3396 ?auto_3394 ) ) ( AVAILABLE ?auto_3394 ) ( SURFACE-AT ?auto_3391 ?auto_3393 ) ( ON ?auto_3391 ?auto_3397 ) ( CLEAR ?auto_3391 ) ( not ( = ?auto_3390 ?auto_3397 ) ) ( not ( = ?auto_3391 ?auto_3397 ) ) ( not ( = ?auto_3395 ?auto_3397 ) ) ( not ( = ?auto_3398 ?auto_3397 ) ) ( TRUCK-AT ?auto_3392 ?auto_3401 ) ( SURFACE-AT ?auto_3400 ?auto_3401 ) ( CLEAR ?auto_3400 ) ( IS-CRATE ?auto_3398 ) ( not ( = ?auto_3390 ?auto_3400 ) ) ( not ( = ?auto_3391 ?auto_3400 ) ) ( not ( = ?auto_3395 ?auto_3400 ) ) ( not ( = ?auto_3398 ?auto_3400 ) ) ( not ( = ?auto_3397 ?auto_3400 ) ) ( AVAILABLE ?auto_3402 ) ( IN ?auto_3398 ?auto_3392 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3402 ?auto_3398 ?auto_3392 ?auto_3401 )
      ( MAKE-ON ?auto_3390 ?auto_3391 )
      ( MAKE-ON-VERIFY ?auto_3390 ?auto_3391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3403 - SURFACE
      ?auto_3404 - SURFACE
    )
    :vars
    (
      ?auto_3405 - HOIST
      ?auto_3412 - PLACE
      ?auto_3413 - PLACE
      ?auto_3409 - HOIST
      ?auto_3407 - SURFACE
      ?auto_3411 - SURFACE
      ?auto_3414 - PLACE
      ?auto_3410 - HOIST
      ?auto_3406 - SURFACE
      ?auto_3415 - SURFACE
      ?auto_3408 - TRUCK
      ?auto_3416 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3405 ?auto_3412 ) ( IS-CRATE ?auto_3403 ) ( not ( = ?auto_3403 ?auto_3404 ) ) ( not ( = ?auto_3413 ?auto_3412 ) ) ( HOIST-AT ?auto_3409 ?auto_3413 ) ( not ( = ?auto_3405 ?auto_3409 ) ) ( AVAILABLE ?auto_3409 ) ( SURFACE-AT ?auto_3403 ?auto_3413 ) ( ON ?auto_3403 ?auto_3407 ) ( CLEAR ?auto_3403 ) ( not ( = ?auto_3403 ?auto_3407 ) ) ( not ( = ?auto_3404 ?auto_3407 ) ) ( IS-CRATE ?auto_3404 ) ( not ( = ?auto_3403 ?auto_3411 ) ) ( not ( = ?auto_3404 ?auto_3411 ) ) ( not ( = ?auto_3407 ?auto_3411 ) ) ( not ( = ?auto_3414 ?auto_3412 ) ) ( not ( = ?auto_3413 ?auto_3414 ) ) ( HOIST-AT ?auto_3410 ?auto_3414 ) ( not ( = ?auto_3405 ?auto_3410 ) ) ( not ( = ?auto_3409 ?auto_3410 ) ) ( AVAILABLE ?auto_3410 ) ( SURFACE-AT ?auto_3404 ?auto_3414 ) ( ON ?auto_3404 ?auto_3406 ) ( CLEAR ?auto_3404 ) ( not ( = ?auto_3403 ?auto_3406 ) ) ( not ( = ?auto_3404 ?auto_3406 ) ) ( not ( = ?auto_3407 ?auto_3406 ) ) ( not ( = ?auto_3411 ?auto_3406 ) ) ( SURFACE-AT ?auto_3415 ?auto_3412 ) ( CLEAR ?auto_3415 ) ( IS-CRATE ?auto_3411 ) ( not ( = ?auto_3403 ?auto_3415 ) ) ( not ( = ?auto_3404 ?auto_3415 ) ) ( not ( = ?auto_3407 ?auto_3415 ) ) ( not ( = ?auto_3411 ?auto_3415 ) ) ( not ( = ?auto_3406 ?auto_3415 ) ) ( AVAILABLE ?auto_3405 ) ( IN ?auto_3411 ?auto_3408 ) ( TRUCK-AT ?auto_3408 ?auto_3416 ) ( not ( = ?auto_3416 ?auto_3412 ) ) ( not ( = ?auto_3413 ?auto_3416 ) ) ( not ( = ?auto_3414 ?auto_3416 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3408 ?auto_3416 ?auto_3412 )
      ( MAKE-ON ?auto_3403 ?auto_3404 )
      ( MAKE-ON-VERIFY ?auto_3403 ?auto_3404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3417 - SURFACE
      ?auto_3418 - SURFACE
    )
    :vars
    (
      ?auto_3420 - HOIST
      ?auto_3424 - PLACE
      ?auto_3421 - PLACE
      ?auto_3422 - HOIST
      ?auto_3427 - SURFACE
      ?auto_3419 - SURFACE
      ?auto_3425 - PLACE
      ?auto_3423 - HOIST
      ?auto_3430 - SURFACE
      ?auto_3428 - SURFACE
      ?auto_3429 - TRUCK
      ?auto_3426 - PLACE
      ?auto_3431 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3420 ?auto_3424 ) ( IS-CRATE ?auto_3417 ) ( not ( = ?auto_3417 ?auto_3418 ) ) ( not ( = ?auto_3421 ?auto_3424 ) ) ( HOIST-AT ?auto_3422 ?auto_3421 ) ( not ( = ?auto_3420 ?auto_3422 ) ) ( AVAILABLE ?auto_3422 ) ( SURFACE-AT ?auto_3417 ?auto_3421 ) ( ON ?auto_3417 ?auto_3427 ) ( CLEAR ?auto_3417 ) ( not ( = ?auto_3417 ?auto_3427 ) ) ( not ( = ?auto_3418 ?auto_3427 ) ) ( IS-CRATE ?auto_3418 ) ( not ( = ?auto_3417 ?auto_3419 ) ) ( not ( = ?auto_3418 ?auto_3419 ) ) ( not ( = ?auto_3427 ?auto_3419 ) ) ( not ( = ?auto_3425 ?auto_3424 ) ) ( not ( = ?auto_3421 ?auto_3425 ) ) ( HOIST-AT ?auto_3423 ?auto_3425 ) ( not ( = ?auto_3420 ?auto_3423 ) ) ( not ( = ?auto_3422 ?auto_3423 ) ) ( AVAILABLE ?auto_3423 ) ( SURFACE-AT ?auto_3418 ?auto_3425 ) ( ON ?auto_3418 ?auto_3430 ) ( CLEAR ?auto_3418 ) ( not ( = ?auto_3417 ?auto_3430 ) ) ( not ( = ?auto_3418 ?auto_3430 ) ) ( not ( = ?auto_3427 ?auto_3430 ) ) ( not ( = ?auto_3419 ?auto_3430 ) ) ( SURFACE-AT ?auto_3428 ?auto_3424 ) ( CLEAR ?auto_3428 ) ( IS-CRATE ?auto_3419 ) ( not ( = ?auto_3417 ?auto_3428 ) ) ( not ( = ?auto_3418 ?auto_3428 ) ) ( not ( = ?auto_3427 ?auto_3428 ) ) ( not ( = ?auto_3419 ?auto_3428 ) ) ( not ( = ?auto_3430 ?auto_3428 ) ) ( AVAILABLE ?auto_3420 ) ( TRUCK-AT ?auto_3429 ?auto_3426 ) ( not ( = ?auto_3426 ?auto_3424 ) ) ( not ( = ?auto_3421 ?auto_3426 ) ) ( not ( = ?auto_3425 ?auto_3426 ) ) ( HOIST-AT ?auto_3431 ?auto_3426 ) ( LIFTING ?auto_3431 ?auto_3419 ) ( not ( = ?auto_3420 ?auto_3431 ) ) ( not ( = ?auto_3422 ?auto_3431 ) ) ( not ( = ?auto_3423 ?auto_3431 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3431 ?auto_3419 ?auto_3429 ?auto_3426 )
      ( MAKE-ON ?auto_3417 ?auto_3418 )
      ( MAKE-ON-VERIFY ?auto_3417 ?auto_3418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3432 - SURFACE
      ?auto_3433 - SURFACE
    )
    :vars
    (
      ?auto_3441 - HOIST
      ?auto_3442 - PLACE
      ?auto_3434 - PLACE
      ?auto_3440 - HOIST
      ?auto_3437 - SURFACE
      ?auto_3445 - SURFACE
      ?auto_3435 - PLACE
      ?auto_3438 - HOIST
      ?auto_3444 - SURFACE
      ?auto_3436 - SURFACE
      ?auto_3439 - TRUCK
      ?auto_3443 - PLACE
      ?auto_3446 - HOIST
      ?auto_3447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3441 ?auto_3442 ) ( IS-CRATE ?auto_3432 ) ( not ( = ?auto_3432 ?auto_3433 ) ) ( not ( = ?auto_3434 ?auto_3442 ) ) ( HOIST-AT ?auto_3440 ?auto_3434 ) ( not ( = ?auto_3441 ?auto_3440 ) ) ( AVAILABLE ?auto_3440 ) ( SURFACE-AT ?auto_3432 ?auto_3434 ) ( ON ?auto_3432 ?auto_3437 ) ( CLEAR ?auto_3432 ) ( not ( = ?auto_3432 ?auto_3437 ) ) ( not ( = ?auto_3433 ?auto_3437 ) ) ( IS-CRATE ?auto_3433 ) ( not ( = ?auto_3432 ?auto_3445 ) ) ( not ( = ?auto_3433 ?auto_3445 ) ) ( not ( = ?auto_3437 ?auto_3445 ) ) ( not ( = ?auto_3435 ?auto_3442 ) ) ( not ( = ?auto_3434 ?auto_3435 ) ) ( HOIST-AT ?auto_3438 ?auto_3435 ) ( not ( = ?auto_3441 ?auto_3438 ) ) ( not ( = ?auto_3440 ?auto_3438 ) ) ( AVAILABLE ?auto_3438 ) ( SURFACE-AT ?auto_3433 ?auto_3435 ) ( ON ?auto_3433 ?auto_3444 ) ( CLEAR ?auto_3433 ) ( not ( = ?auto_3432 ?auto_3444 ) ) ( not ( = ?auto_3433 ?auto_3444 ) ) ( not ( = ?auto_3437 ?auto_3444 ) ) ( not ( = ?auto_3445 ?auto_3444 ) ) ( SURFACE-AT ?auto_3436 ?auto_3442 ) ( CLEAR ?auto_3436 ) ( IS-CRATE ?auto_3445 ) ( not ( = ?auto_3432 ?auto_3436 ) ) ( not ( = ?auto_3433 ?auto_3436 ) ) ( not ( = ?auto_3437 ?auto_3436 ) ) ( not ( = ?auto_3445 ?auto_3436 ) ) ( not ( = ?auto_3444 ?auto_3436 ) ) ( AVAILABLE ?auto_3441 ) ( TRUCK-AT ?auto_3439 ?auto_3443 ) ( not ( = ?auto_3443 ?auto_3442 ) ) ( not ( = ?auto_3434 ?auto_3443 ) ) ( not ( = ?auto_3435 ?auto_3443 ) ) ( HOIST-AT ?auto_3446 ?auto_3443 ) ( not ( = ?auto_3441 ?auto_3446 ) ) ( not ( = ?auto_3440 ?auto_3446 ) ) ( not ( = ?auto_3438 ?auto_3446 ) ) ( AVAILABLE ?auto_3446 ) ( SURFACE-AT ?auto_3445 ?auto_3443 ) ( ON ?auto_3445 ?auto_3447 ) ( CLEAR ?auto_3445 ) ( not ( = ?auto_3432 ?auto_3447 ) ) ( not ( = ?auto_3433 ?auto_3447 ) ) ( not ( = ?auto_3437 ?auto_3447 ) ) ( not ( = ?auto_3445 ?auto_3447 ) ) ( not ( = ?auto_3444 ?auto_3447 ) ) ( not ( = ?auto_3436 ?auto_3447 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3446 ?auto_3445 ?auto_3447 ?auto_3443 )
      ( MAKE-ON ?auto_3432 ?auto_3433 )
      ( MAKE-ON-VERIFY ?auto_3432 ?auto_3433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3448 - SURFACE
      ?auto_3449 - SURFACE
    )
    :vars
    (
      ?auto_3453 - HOIST
      ?auto_3462 - PLACE
      ?auto_3463 - PLACE
      ?auto_3459 - HOIST
      ?auto_3460 - SURFACE
      ?auto_3458 - SURFACE
      ?auto_3452 - PLACE
      ?auto_3456 - HOIST
      ?auto_3457 - SURFACE
      ?auto_3455 - SURFACE
      ?auto_3454 - PLACE
      ?auto_3450 - HOIST
      ?auto_3461 - SURFACE
      ?auto_3451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3453 ?auto_3462 ) ( IS-CRATE ?auto_3448 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3463 ?auto_3462 ) ) ( HOIST-AT ?auto_3459 ?auto_3463 ) ( not ( = ?auto_3453 ?auto_3459 ) ) ( AVAILABLE ?auto_3459 ) ( SURFACE-AT ?auto_3448 ?auto_3463 ) ( ON ?auto_3448 ?auto_3460 ) ( CLEAR ?auto_3448 ) ( not ( = ?auto_3448 ?auto_3460 ) ) ( not ( = ?auto_3449 ?auto_3460 ) ) ( IS-CRATE ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3458 ) ) ( not ( = ?auto_3449 ?auto_3458 ) ) ( not ( = ?auto_3460 ?auto_3458 ) ) ( not ( = ?auto_3452 ?auto_3462 ) ) ( not ( = ?auto_3463 ?auto_3452 ) ) ( HOIST-AT ?auto_3456 ?auto_3452 ) ( not ( = ?auto_3453 ?auto_3456 ) ) ( not ( = ?auto_3459 ?auto_3456 ) ) ( AVAILABLE ?auto_3456 ) ( SURFACE-AT ?auto_3449 ?auto_3452 ) ( ON ?auto_3449 ?auto_3457 ) ( CLEAR ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3457 ) ) ( not ( = ?auto_3449 ?auto_3457 ) ) ( not ( = ?auto_3460 ?auto_3457 ) ) ( not ( = ?auto_3458 ?auto_3457 ) ) ( SURFACE-AT ?auto_3455 ?auto_3462 ) ( CLEAR ?auto_3455 ) ( IS-CRATE ?auto_3458 ) ( not ( = ?auto_3448 ?auto_3455 ) ) ( not ( = ?auto_3449 ?auto_3455 ) ) ( not ( = ?auto_3460 ?auto_3455 ) ) ( not ( = ?auto_3458 ?auto_3455 ) ) ( not ( = ?auto_3457 ?auto_3455 ) ) ( AVAILABLE ?auto_3453 ) ( not ( = ?auto_3454 ?auto_3462 ) ) ( not ( = ?auto_3463 ?auto_3454 ) ) ( not ( = ?auto_3452 ?auto_3454 ) ) ( HOIST-AT ?auto_3450 ?auto_3454 ) ( not ( = ?auto_3453 ?auto_3450 ) ) ( not ( = ?auto_3459 ?auto_3450 ) ) ( not ( = ?auto_3456 ?auto_3450 ) ) ( AVAILABLE ?auto_3450 ) ( SURFACE-AT ?auto_3458 ?auto_3454 ) ( ON ?auto_3458 ?auto_3461 ) ( CLEAR ?auto_3458 ) ( not ( = ?auto_3448 ?auto_3461 ) ) ( not ( = ?auto_3449 ?auto_3461 ) ) ( not ( = ?auto_3460 ?auto_3461 ) ) ( not ( = ?auto_3458 ?auto_3461 ) ) ( not ( = ?auto_3457 ?auto_3461 ) ) ( not ( = ?auto_3455 ?auto_3461 ) ) ( TRUCK-AT ?auto_3451 ?auto_3462 ) )
    :subtasks
    ( ( !DRIVE ?auto_3451 ?auto_3462 ?auto_3454 )
      ( MAKE-ON ?auto_3448 ?auto_3449 )
      ( MAKE-ON-VERIFY ?auto_3448 ?auto_3449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3464 - SURFACE
      ?auto_3465 - SURFACE
    )
    :vars
    (
      ?auto_3471 - HOIST
      ?auto_3473 - PLACE
      ?auto_3472 - PLACE
      ?auto_3475 - HOIST
      ?auto_3477 - SURFACE
      ?auto_3466 - SURFACE
      ?auto_3470 - PLACE
      ?auto_3469 - HOIST
      ?auto_3468 - SURFACE
      ?auto_3476 - SURFACE
      ?auto_3474 - PLACE
      ?auto_3478 - HOIST
      ?auto_3467 - SURFACE
      ?auto_3479 - TRUCK
      ?auto_3480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3471 ?auto_3473 ) ( IS-CRATE ?auto_3464 ) ( not ( = ?auto_3464 ?auto_3465 ) ) ( not ( = ?auto_3472 ?auto_3473 ) ) ( HOIST-AT ?auto_3475 ?auto_3472 ) ( not ( = ?auto_3471 ?auto_3475 ) ) ( AVAILABLE ?auto_3475 ) ( SURFACE-AT ?auto_3464 ?auto_3472 ) ( ON ?auto_3464 ?auto_3477 ) ( CLEAR ?auto_3464 ) ( not ( = ?auto_3464 ?auto_3477 ) ) ( not ( = ?auto_3465 ?auto_3477 ) ) ( IS-CRATE ?auto_3465 ) ( not ( = ?auto_3464 ?auto_3466 ) ) ( not ( = ?auto_3465 ?auto_3466 ) ) ( not ( = ?auto_3477 ?auto_3466 ) ) ( not ( = ?auto_3470 ?auto_3473 ) ) ( not ( = ?auto_3472 ?auto_3470 ) ) ( HOIST-AT ?auto_3469 ?auto_3470 ) ( not ( = ?auto_3471 ?auto_3469 ) ) ( not ( = ?auto_3475 ?auto_3469 ) ) ( AVAILABLE ?auto_3469 ) ( SURFACE-AT ?auto_3465 ?auto_3470 ) ( ON ?auto_3465 ?auto_3468 ) ( CLEAR ?auto_3465 ) ( not ( = ?auto_3464 ?auto_3468 ) ) ( not ( = ?auto_3465 ?auto_3468 ) ) ( not ( = ?auto_3477 ?auto_3468 ) ) ( not ( = ?auto_3466 ?auto_3468 ) ) ( IS-CRATE ?auto_3466 ) ( not ( = ?auto_3464 ?auto_3476 ) ) ( not ( = ?auto_3465 ?auto_3476 ) ) ( not ( = ?auto_3477 ?auto_3476 ) ) ( not ( = ?auto_3466 ?auto_3476 ) ) ( not ( = ?auto_3468 ?auto_3476 ) ) ( not ( = ?auto_3474 ?auto_3473 ) ) ( not ( = ?auto_3472 ?auto_3474 ) ) ( not ( = ?auto_3470 ?auto_3474 ) ) ( HOIST-AT ?auto_3478 ?auto_3474 ) ( not ( = ?auto_3471 ?auto_3478 ) ) ( not ( = ?auto_3475 ?auto_3478 ) ) ( not ( = ?auto_3469 ?auto_3478 ) ) ( AVAILABLE ?auto_3478 ) ( SURFACE-AT ?auto_3466 ?auto_3474 ) ( ON ?auto_3466 ?auto_3467 ) ( CLEAR ?auto_3466 ) ( not ( = ?auto_3464 ?auto_3467 ) ) ( not ( = ?auto_3465 ?auto_3467 ) ) ( not ( = ?auto_3477 ?auto_3467 ) ) ( not ( = ?auto_3466 ?auto_3467 ) ) ( not ( = ?auto_3468 ?auto_3467 ) ) ( not ( = ?auto_3476 ?auto_3467 ) ) ( TRUCK-AT ?auto_3479 ?auto_3473 ) ( SURFACE-AT ?auto_3480 ?auto_3473 ) ( CLEAR ?auto_3480 ) ( LIFTING ?auto_3471 ?auto_3476 ) ( IS-CRATE ?auto_3476 ) ( not ( = ?auto_3464 ?auto_3480 ) ) ( not ( = ?auto_3465 ?auto_3480 ) ) ( not ( = ?auto_3477 ?auto_3480 ) ) ( not ( = ?auto_3466 ?auto_3480 ) ) ( not ( = ?auto_3468 ?auto_3480 ) ) ( not ( = ?auto_3476 ?auto_3480 ) ) ( not ( = ?auto_3467 ?auto_3480 ) ) )
    :subtasks
    ( ( !DROP ?auto_3471 ?auto_3476 ?auto_3480 ?auto_3473 )
      ( MAKE-ON ?auto_3464 ?auto_3465 )
      ( MAKE-ON-VERIFY ?auto_3464 ?auto_3465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3481 - SURFACE
      ?auto_3482 - SURFACE
    )
    :vars
    (
      ?auto_3492 - HOIST
      ?auto_3491 - PLACE
      ?auto_3485 - PLACE
      ?auto_3489 - HOIST
      ?auto_3496 - SURFACE
      ?auto_3488 - SURFACE
      ?auto_3490 - PLACE
      ?auto_3495 - HOIST
      ?auto_3487 - SURFACE
      ?auto_3484 - SURFACE
      ?auto_3497 - PLACE
      ?auto_3486 - HOIST
      ?auto_3494 - SURFACE
      ?auto_3493 - TRUCK
      ?auto_3483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3492 ?auto_3491 ) ( IS-CRATE ?auto_3481 ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3485 ?auto_3491 ) ) ( HOIST-AT ?auto_3489 ?auto_3485 ) ( not ( = ?auto_3492 ?auto_3489 ) ) ( AVAILABLE ?auto_3489 ) ( SURFACE-AT ?auto_3481 ?auto_3485 ) ( ON ?auto_3481 ?auto_3496 ) ( CLEAR ?auto_3481 ) ( not ( = ?auto_3481 ?auto_3496 ) ) ( not ( = ?auto_3482 ?auto_3496 ) ) ( IS-CRATE ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3488 ) ) ( not ( = ?auto_3482 ?auto_3488 ) ) ( not ( = ?auto_3496 ?auto_3488 ) ) ( not ( = ?auto_3490 ?auto_3491 ) ) ( not ( = ?auto_3485 ?auto_3490 ) ) ( HOIST-AT ?auto_3495 ?auto_3490 ) ( not ( = ?auto_3492 ?auto_3495 ) ) ( not ( = ?auto_3489 ?auto_3495 ) ) ( AVAILABLE ?auto_3495 ) ( SURFACE-AT ?auto_3482 ?auto_3490 ) ( ON ?auto_3482 ?auto_3487 ) ( CLEAR ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3487 ) ) ( not ( = ?auto_3482 ?auto_3487 ) ) ( not ( = ?auto_3496 ?auto_3487 ) ) ( not ( = ?auto_3488 ?auto_3487 ) ) ( IS-CRATE ?auto_3488 ) ( not ( = ?auto_3481 ?auto_3484 ) ) ( not ( = ?auto_3482 ?auto_3484 ) ) ( not ( = ?auto_3496 ?auto_3484 ) ) ( not ( = ?auto_3488 ?auto_3484 ) ) ( not ( = ?auto_3487 ?auto_3484 ) ) ( not ( = ?auto_3497 ?auto_3491 ) ) ( not ( = ?auto_3485 ?auto_3497 ) ) ( not ( = ?auto_3490 ?auto_3497 ) ) ( HOIST-AT ?auto_3486 ?auto_3497 ) ( not ( = ?auto_3492 ?auto_3486 ) ) ( not ( = ?auto_3489 ?auto_3486 ) ) ( not ( = ?auto_3495 ?auto_3486 ) ) ( AVAILABLE ?auto_3486 ) ( SURFACE-AT ?auto_3488 ?auto_3497 ) ( ON ?auto_3488 ?auto_3494 ) ( CLEAR ?auto_3488 ) ( not ( = ?auto_3481 ?auto_3494 ) ) ( not ( = ?auto_3482 ?auto_3494 ) ) ( not ( = ?auto_3496 ?auto_3494 ) ) ( not ( = ?auto_3488 ?auto_3494 ) ) ( not ( = ?auto_3487 ?auto_3494 ) ) ( not ( = ?auto_3484 ?auto_3494 ) ) ( TRUCK-AT ?auto_3493 ?auto_3491 ) ( SURFACE-AT ?auto_3483 ?auto_3491 ) ( CLEAR ?auto_3483 ) ( IS-CRATE ?auto_3484 ) ( not ( = ?auto_3481 ?auto_3483 ) ) ( not ( = ?auto_3482 ?auto_3483 ) ) ( not ( = ?auto_3496 ?auto_3483 ) ) ( not ( = ?auto_3488 ?auto_3483 ) ) ( not ( = ?auto_3487 ?auto_3483 ) ) ( not ( = ?auto_3484 ?auto_3483 ) ) ( not ( = ?auto_3494 ?auto_3483 ) ) ( AVAILABLE ?auto_3492 ) ( IN ?auto_3484 ?auto_3493 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3492 ?auto_3484 ?auto_3493 ?auto_3491 )
      ( MAKE-ON ?auto_3481 ?auto_3482 )
      ( MAKE-ON-VERIFY ?auto_3481 ?auto_3482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3498 - SURFACE
      ?auto_3499 - SURFACE
    )
    :vars
    (
      ?auto_3500 - HOIST
      ?auto_3510 - PLACE
      ?auto_3505 - PLACE
      ?auto_3514 - HOIST
      ?auto_3504 - SURFACE
      ?auto_3502 - SURFACE
      ?auto_3507 - PLACE
      ?auto_3506 - HOIST
      ?auto_3503 - SURFACE
      ?auto_3513 - SURFACE
      ?auto_3509 - PLACE
      ?auto_3512 - HOIST
      ?auto_3508 - SURFACE
      ?auto_3511 - SURFACE
      ?auto_3501 - TRUCK
      ?auto_3515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3500 ?auto_3510 ) ( IS-CRATE ?auto_3498 ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3505 ?auto_3510 ) ) ( HOIST-AT ?auto_3514 ?auto_3505 ) ( not ( = ?auto_3500 ?auto_3514 ) ) ( AVAILABLE ?auto_3514 ) ( SURFACE-AT ?auto_3498 ?auto_3505 ) ( ON ?auto_3498 ?auto_3504 ) ( CLEAR ?auto_3498 ) ( not ( = ?auto_3498 ?auto_3504 ) ) ( not ( = ?auto_3499 ?auto_3504 ) ) ( IS-CRATE ?auto_3499 ) ( not ( = ?auto_3498 ?auto_3502 ) ) ( not ( = ?auto_3499 ?auto_3502 ) ) ( not ( = ?auto_3504 ?auto_3502 ) ) ( not ( = ?auto_3507 ?auto_3510 ) ) ( not ( = ?auto_3505 ?auto_3507 ) ) ( HOIST-AT ?auto_3506 ?auto_3507 ) ( not ( = ?auto_3500 ?auto_3506 ) ) ( not ( = ?auto_3514 ?auto_3506 ) ) ( AVAILABLE ?auto_3506 ) ( SURFACE-AT ?auto_3499 ?auto_3507 ) ( ON ?auto_3499 ?auto_3503 ) ( CLEAR ?auto_3499 ) ( not ( = ?auto_3498 ?auto_3503 ) ) ( not ( = ?auto_3499 ?auto_3503 ) ) ( not ( = ?auto_3504 ?auto_3503 ) ) ( not ( = ?auto_3502 ?auto_3503 ) ) ( IS-CRATE ?auto_3502 ) ( not ( = ?auto_3498 ?auto_3513 ) ) ( not ( = ?auto_3499 ?auto_3513 ) ) ( not ( = ?auto_3504 ?auto_3513 ) ) ( not ( = ?auto_3502 ?auto_3513 ) ) ( not ( = ?auto_3503 ?auto_3513 ) ) ( not ( = ?auto_3509 ?auto_3510 ) ) ( not ( = ?auto_3505 ?auto_3509 ) ) ( not ( = ?auto_3507 ?auto_3509 ) ) ( HOIST-AT ?auto_3512 ?auto_3509 ) ( not ( = ?auto_3500 ?auto_3512 ) ) ( not ( = ?auto_3514 ?auto_3512 ) ) ( not ( = ?auto_3506 ?auto_3512 ) ) ( AVAILABLE ?auto_3512 ) ( SURFACE-AT ?auto_3502 ?auto_3509 ) ( ON ?auto_3502 ?auto_3508 ) ( CLEAR ?auto_3502 ) ( not ( = ?auto_3498 ?auto_3508 ) ) ( not ( = ?auto_3499 ?auto_3508 ) ) ( not ( = ?auto_3504 ?auto_3508 ) ) ( not ( = ?auto_3502 ?auto_3508 ) ) ( not ( = ?auto_3503 ?auto_3508 ) ) ( not ( = ?auto_3513 ?auto_3508 ) ) ( SURFACE-AT ?auto_3511 ?auto_3510 ) ( CLEAR ?auto_3511 ) ( IS-CRATE ?auto_3513 ) ( not ( = ?auto_3498 ?auto_3511 ) ) ( not ( = ?auto_3499 ?auto_3511 ) ) ( not ( = ?auto_3504 ?auto_3511 ) ) ( not ( = ?auto_3502 ?auto_3511 ) ) ( not ( = ?auto_3503 ?auto_3511 ) ) ( not ( = ?auto_3513 ?auto_3511 ) ) ( not ( = ?auto_3508 ?auto_3511 ) ) ( AVAILABLE ?auto_3500 ) ( IN ?auto_3513 ?auto_3501 ) ( TRUCK-AT ?auto_3501 ?auto_3515 ) ( not ( = ?auto_3515 ?auto_3510 ) ) ( not ( = ?auto_3505 ?auto_3515 ) ) ( not ( = ?auto_3507 ?auto_3515 ) ) ( not ( = ?auto_3509 ?auto_3515 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3501 ?auto_3515 ?auto_3510 )
      ( MAKE-ON ?auto_3498 ?auto_3499 )
      ( MAKE-ON-VERIFY ?auto_3498 ?auto_3499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3516 - SURFACE
      ?auto_3517 - SURFACE
    )
    :vars
    (
      ?auto_3532 - HOIST
      ?auto_3528 - PLACE
      ?auto_3525 - PLACE
      ?auto_3522 - HOIST
      ?auto_3518 - SURFACE
      ?auto_3527 - SURFACE
      ?auto_3524 - PLACE
      ?auto_3519 - HOIST
      ?auto_3529 - SURFACE
      ?auto_3523 - SURFACE
      ?auto_3520 - PLACE
      ?auto_3530 - HOIST
      ?auto_3531 - SURFACE
      ?auto_3521 - SURFACE
      ?auto_3526 - TRUCK
      ?auto_3533 - PLACE
      ?auto_3534 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3532 ?auto_3528 ) ( IS-CRATE ?auto_3516 ) ( not ( = ?auto_3516 ?auto_3517 ) ) ( not ( = ?auto_3525 ?auto_3528 ) ) ( HOIST-AT ?auto_3522 ?auto_3525 ) ( not ( = ?auto_3532 ?auto_3522 ) ) ( AVAILABLE ?auto_3522 ) ( SURFACE-AT ?auto_3516 ?auto_3525 ) ( ON ?auto_3516 ?auto_3518 ) ( CLEAR ?auto_3516 ) ( not ( = ?auto_3516 ?auto_3518 ) ) ( not ( = ?auto_3517 ?auto_3518 ) ) ( IS-CRATE ?auto_3517 ) ( not ( = ?auto_3516 ?auto_3527 ) ) ( not ( = ?auto_3517 ?auto_3527 ) ) ( not ( = ?auto_3518 ?auto_3527 ) ) ( not ( = ?auto_3524 ?auto_3528 ) ) ( not ( = ?auto_3525 ?auto_3524 ) ) ( HOIST-AT ?auto_3519 ?auto_3524 ) ( not ( = ?auto_3532 ?auto_3519 ) ) ( not ( = ?auto_3522 ?auto_3519 ) ) ( AVAILABLE ?auto_3519 ) ( SURFACE-AT ?auto_3517 ?auto_3524 ) ( ON ?auto_3517 ?auto_3529 ) ( CLEAR ?auto_3517 ) ( not ( = ?auto_3516 ?auto_3529 ) ) ( not ( = ?auto_3517 ?auto_3529 ) ) ( not ( = ?auto_3518 ?auto_3529 ) ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( IS-CRATE ?auto_3527 ) ( not ( = ?auto_3516 ?auto_3523 ) ) ( not ( = ?auto_3517 ?auto_3523 ) ) ( not ( = ?auto_3518 ?auto_3523 ) ) ( not ( = ?auto_3527 ?auto_3523 ) ) ( not ( = ?auto_3529 ?auto_3523 ) ) ( not ( = ?auto_3520 ?auto_3528 ) ) ( not ( = ?auto_3525 ?auto_3520 ) ) ( not ( = ?auto_3524 ?auto_3520 ) ) ( HOIST-AT ?auto_3530 ?auto_3520 ) ( not ( = ?auto_3532 ?auto_3530 ) ) ( not ( = ?auto_3522 ?auto_3530 ) ) ( not ( = ?auto_3519 ?auto_3530 ) ) ( AVAILABLE ?auto_3530 ) ( SURFACE-AT ?auto_3527 ?auto_3520 ) ( ON ?auto_3527 ?auto_3531 ) ( CLEAR ?auto_3527 ) ( not ( = ?auto_3516 ?auto_3531 ) ) ( not ( = ?auto_3517 ?auto_3531 ) ) ( not ( = ?auto_3518 ?auto_3531 ) ) ( not ( = ?auto_3527 ?auto_3531 ) ) ( not ( = ?auto_3529 ?auto_3531 ) ) ( not ( = ?auto_3523 ?auto_3531 ) ) ( SURFACE-AT ?auto_3521 ?auto_3528 ) ( CLEAR ?auto_3521 ) ( IS-CRATE ?auto_3523 ) ( not ( = ?auto_3516 ?auto_3521 ) ) ( not ( = ?auto_3517 ?auto_3521 ) ) ( not ( = ?auto_3518 ?auto_3521 ) ) ( not ( = ?auto_3527 ?auto_3521 ) ) ( not ( = ?auto_3529 ?auto_3521 ) ) ( not ( = ?auto_3523 ?auto_3521 ) ) ( not ( = ?auto_3531 ?auto_3521 ) ) ( AVAILABLE ?auto_3532 ) ( TRUCK-AT ?auto_3526 ?auto_3533 ) ( not ( = ?auto_3533 ?auto_3528 ) ) ( not ( = ?auto_3525 ?auto_3533 ) ) ( not ( = ?auto_3524 ?auto_3533 ) ) ( not ( = ?auto_3520 ?auto_3533 ) ) ( HOIST-AT ?auto_3534 ?auto_3533 ) ( LIFTING ?auto_3534 ?auto_3523 ) ( not ( = ?auto_3532 ?auto_3534 ) ) ( not ( = ?auto_3522 ?auto_3534 ) ) ( not ( = ?auto_3519 ?auto_3534 ) ) ( not ( = ?auto_3530 ?auto_3534 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3534 ?auto_3523 ?auto_3526 ?auto_3533 )
      ( MAKE-ON ?auto_3516 ?auto_3517 )
      ( MAKE-ON-VERIFY ?auto_3516 ?auto_3517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3535 - SURFACE
      ?auto_3536 - SURFACE
    )
    :vars
    (
      ?auto_3544 - HOIST
      ?auto_3552 - PLACE
      ?auto_3547 - PLACE
      ?auto_3551 - HOIST
      ?auto_3543 - SURFACE
      ?auto_3539 - SURFACE
      ?auto_3541 - PLACE
      ?auto_3545 - HOIST
      ?auto_3553 - SURFACE
      ?auto_3540 - SURFACE
      ?auto_3546 - PLACE
      ?auto_3537 - HOIST
      ?auto_3550 - SURFACE
      ?auto_3538 - SURFACE
      ?auto_3549 - TRUCK
      ?auto_3548 - PLACE
      ?auto_3542 - HOIST
      ?auto_3554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3544 ?auto_3552 ) ( IS-CRATE ?auto_3535 ) ( not ( = ?auto_3535 ?auto_3536 ) ) ( not ( = ?auto_3547 ?auto_3552 ) ) ( HOIST-AT ?auto_3551 ?auto_3547 ) ( not ( = ?auto_3544 ?auto_3551 ) ) ( AVAILABLE ?auto_3551 ) ( SURFACE-AT ?auto_3535 ?auto_3547 ) ( ON ?auto_3535 ?auto_3543 ) ( CLEAR ?auto_3535 ) ( not ( = ?auto_3535 ?auto_3543 ) ) ( not ( = ?auto_3536 ?auto_3543 ) ) ( IS-CRATE ?auto_3536 ) ( not ( = ?auto_3535 ?auto_3539 ) ) ( not ( = ?auto_3536 ?auto_3539 ) ) ( not ( = ?auto_3543 ?auto_3539 ) ) ( not ( = ?auto_3541 ?auto_3552 ) ) ( not ( = ?auto_3547 ?auto_3541 ) ) ( HOIST-AT ?auto_3545 ?auto_3541 ) ( not ( = ?auto_3544 ?auto_3545 ) ) ( not ( = ?auto_3551 ?auto_3545 ) ) ( AVAILABLE ?auto_3545 ) ( SURFACE-AT ?auto_3536 ?auto_3541 ) ( ON ?auto_3536 ?auto_3553 ) ( CLEAR ?auto_3536 ) ( not ( = ?auto_3535 ?auto_3553 ) ) ( not ( = ?auto_3536 ?auto_3553 ) ) ( not ( = ?auto_3543 ?auto_3553 ) ) ( not ( = ?auto_3539 ?auto_3553 ) ) ( IS-CRATE ?auto_3539 ) ( not ( = ?auto_3535 ?auto_3540 ) ) ( not ( = ?auto_3536 ?auto_3540 ) ) ( not ( = ?auto_3543 ?auto_3540 ) ) ( not ( = ?auto_3539 ?auto_3540 ) ) ( not ( = ?auto_3553 ?auto_3540 ) ) ( not ( = ?auto_3546 ?auto_3552 ) ) ( not ( = ?auto_3547 ?auto_3546 ) ) ( not ( = ?auto_3541 ?auto_3546 ) ) ( HOIST-AT ?auto_3537 ?auto_3546 ) ( not ( = ?auto_3544 ?auto_3537 ) ) ( not ( = ?auto_3551 ?auto_3537 ) ) ( not ( = ?auto_3545 ?auto_3537 ) ) ( AVAILABLE ?auto_3537 ) ( SURFACE-AT ?auto_3539 ?auto_3546 ) ( ON ?auto_3539 ?auto_3550 ) ( CLEAR ?auto_3539 ) ( not ( = ?auto_3535 ?auto_3550 ) ) ( not ( = ?auto_3536 ?auto_3550 ) ) ( not ( = ?auto_3543 ?auto_3550 ) ) ( not ( = ?auto_3539 ?auto_3550 ) ) ( not ( = ?auto_3553 ?auto_3550 ) ) ( not ( = ?auto_3540 ?auto_3550 ) ) ( SURFACE-AT ?auto_3538 ?auto_3552 ) ( CLEAR ?auto_3538 ) ( IS-CRATE ?auto_3540 ) ( not ( = ?auto_3535 ?auto_3538 ) ) ( not ( = ?auto_3536 ?auto_3538 ) ) ( not ( = ?auto_3543 ?auto_3538 ) ) ( not ( = ?auto_3539 ?auto_3538 ) ) ( not ( = ?auto_3553 ?auto_3538 ) ) ( not ( = ?auto_3540 ?auto_3538 ) ) ( not ( = ?auto_3550 ?auto_3538 ) ) ( AVAILABLE ?auto_3544 ) ( TRUCK-AT ?auto_3549 ?auto_3548 ) ( not ( = ?auto_3548 ?auto_3552 ) ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( not ( = ?auto_3541 ?auto_3548 ) ) ( not ( = ?auto_3546 ?auto_3548 ) ) ( HOIST-AT ?auto_3542 ?auto_3548 ) ( not ( = ?auto_3544 ?auto_3542 ) ) ( not ( = ?auto_3551 ?auto_3542 ) ) ( not ( = ?auto_3545 ?auto_3542 ) ) ( not ( = ?auto_3537 ?auto_3542 ) ) ( AVAILABLE ?auto_3542 ) ( SURFACE-AT ?auto_3540 ?auto_3548 ) ( ON ?auto_3540 ?auto_3554 ) ( CLEAR ?auto_3540 ) ( not ( = ?auto_3535 ?auto_3554 ) ) ( not ( = ?auto_3536 ?auto_3554 ) ) ( not ( = ?auto_3543 ?auto_3554 ) ) ( not ( = ?auto_3539 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3554 ) ) ( not ( = ?auto_3540 ?auto_3554 ) ) ( not ( = ?auto_3550 ?auto_3554 ) ) ( not ( = ?auto_3538 ?auto_3554 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3542 ?auto_3540 ?auto_3554 ?auto_3548 )
      ( MAKE-ON ?auto_3535 ?auto_3536 )
      ( MAKE-ON-VERIFY ?auto_3535 ?auto_3536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3555 - SURFACE
      ?auto_3556 - SURFACE
    )
    :vars
    (
      ?auto_3567 - HOIST
      ?auto_3561 - PLACE
      ?auto_3557 - PLACE
      ?auto_3572 - HOIST
      ?auto_3573 - SURFACE
      ?auto_3568 - SURFACE
      ?auto_3571 - PLACE
      ?auto_3565 - HOIST
      ?auto_3562 - SURFACE
      ?auto_3570 - SURFACE
      ?auto_3558 - PLACE
      ?auto_3560 - HOIST
      ?auto_3563 - SURFACE
      ?auto_3569 - SURFACE
      ?auto_3566 - PLACE
      ?auto_3559 - HOIST
      ?auto_3574 - SURFACE
      ?auto_3564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3567 ?auto_3561 ) ( IS-CRATE ?auto_3555 ) ( not ( = ?auto_3555 ?auto_3556 ) ) ( not ( = ?auto_3557 ?auto_3561 ) ) ( HOIST-AT ?auto_3572 ?auto_3557 ) ( not ( = ?auto_3567 ?auto_3572 ) ) ( AVAILABLE ?auto_3572 ) ( SURFACE-AT ?auto_3555 ?auto_3557 ) ( ON ?auto_3555 ?auto_3573 ) ( CLEAR ?auto_3555 ) ( not ( = ?auto_3555 ?auto_3573 ) ) ( not ( = ?auto_3556 ?auto_3573 ) ) ( IS-CRATE ?auto_3556 ) ( not ( = ?auto_3555 ?auto_3568 ) ) ( not ( = ?auto_3556 ?auto_3568 ) ) ( not ( = ?auto_3573 ?auto_3568 ) ) ( not ( = ?auto_3571 ?auto_3561 ) ) ( not ( = ?auto_3557 ?auto_3571 ) ) ( HOIST-AT ?auto_3565 ?auto_3571 ) ( not ( = ?auto_3567 ?auto_3565 ) ) ( not ( = ?auto_3572 ?auto_3565 ) ) ( AVAILABLE ?auto_3565 ) ( SURFACE-AT ?auto_3556 ?auto_3571 ) ( ON ?auto_3556 ?auto_3562 ) ( CLEAR ?auto_3556 ) ( not ( = ?auto_3555 ?auto_3562 ) ) ( not ( = ?auto_3556 ?auto_3562 ) ) ( not ( = ?auto_3573 ?auto_3562 ) ) ( not ( = ?auto_3568 ?auto_3562 ) ) ( IS-CRATE ?auto_3568 ) ( not ( = ?auto_3555 ?auto_3570 ) ) ( not ( = ?auto_3556 ?auto_3570 ) ) ( not ( = ?auto_3573 ?auto_3570 ) ) ( not ( = ?auto_3568 ?auto_3570 ) ) ( not ( = ?auto_3562 ?auto_3570 ) ) ( not ( = ?auto_3558 ?auto_3561 ) ) ( not ( = ?auto_3557 ?auto_3558 ) ) ( not ( = ?auto_3571 ?auto_3558 ) ) ( HOIST-AT ?auto_3560 ?auto_3558 ) ( not ( = ?auto_3567 ?auto_3560 ) ) ( not ( = ?auto_3572 ?auto_3560 ) ) ( not ( = ?auto_3565 ?auto_3560 ) ) ( AVAILABLE ?auto_3560 ) ( SURFACE-AT ?auto_3568 ?auto_3558 ) ( ON ?auto_3568 ?auto_3563 ) ( CLEAR ?auto_3568 ) ( not ( = ?auto_3555 ?auto_3563 ) ) ( not ( = ?auto_3556 ?auto_3563 ) ) ( not ( = ?auto_3573 ?auto_3563 ) ) ( not ( = ?auto_3568 ?auto_3563 ) ) ( not ( = ?auto_3562 ?auto_3563 ) ) ( not ( = ?auto_3570 ?auto_3563 ) ) ( SURFACE-AT ?auto_3569 ?auto_3561 ) ( CLEAR ?auto_3569 ) ( IS-CRATE ?auto_3570 ) ( not ( = ?auto_3555 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3569 ) ) ( not ( = ?auto_3573 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3569 ) ) ( not ( = ?auto_3562 ?auto_3569 ) ) ( not ( = ?auto_3570 ?auto_3569 ) ) ( not ( = ?auto_3563 ?auto_3569 ) ) ( AVAILABLE ?auto_3567 ) ( not ( = ?auto_3566 ?auto_3561 ) ) ( not ( = ?auto_3557 ?auto_3566 ) ) ( not ( = ?auto_3571 ?auto_3566 ) ) ( not ( = ?auto_3558 ?auto_3566 ) ) ( HOIST-AT ?auto_3559 ?auto_3566 ) ( not ( = ?auto_3567 ?auto_3559 ) ) ( not ( = ?auto_3572 ?auto_3559 ) ) ( not ( = ?auto_3565 ?auto_3559 ) ) ( not ( = ?auto_3560 ?auto_3559 ) ) ( AVAILABLE ?auto_3559 ) ( SURFACE-AT ?auto_3570 ?auto_3566 ) ( ON ?auto_3570 ?auto_3574 ) ( CLEAR ?auto_3570 ) ( not ( = ?auto_3555 ?auto_3574 ) ) ( not ( = ?auto_3556 ?auto_3574 ) ) ( not ( = ?auto_3573 ?auto_3574 ) ) ( not ( = ?auto_3568 ?auto_3574 ) ) ( not ( = ?auto_3562 ?auto_3574 ) ) ( not ( = ?auto_3570 ?auto_3574 ) ) ( not ( = ?auto_3563 ?auto_3574 ) ) ( not ( = ?auto_3569 ?auto_3574 ) ) ( TRUCK-AT ?auto_3564 ?auto_3561 ) )
    :subtasks
    ( ( !DRIVE ?auto_3564 ?auto_3561 ?auto_3566 )
      ( MAKE-ON ?auto_3555 ?auto_3556 )
      ( MAKE-ON-VERIFY ?auto_3555 ?auto_3556 ) )
  )

)

