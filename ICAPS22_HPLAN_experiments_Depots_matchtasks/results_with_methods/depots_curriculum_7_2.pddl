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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2953 - SURFACE
      ?auto_2954 - SURFACE
    )
    :vars
    (
      ?auto_2955 - HOIST
      ?auto_2956 - PLACE
      ?auto_2958 - PLACE
      ?auto_2959 - HOIST
      ?auto_2960 - SURFACE
      ?auto_2957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2955 ?auto_2956 ) ( SURFACE-AT ?auto_2953 ?auto_2956 ) ( CLEAR ?auto_2953 ) ( IS-CRATE ?auto_2954 ) ( AVAILABLE ?auto_2955 ) ( not ( = ?auto_2958 ?auto_2956 ) ) ( HOIST-AT ?auto_2959 ?auto_2958 ) ( AVAILABLE ?auto_2959 ) ( SURFACE-AT ?auto_2954 ?auto_2958 ) ( ON ?auto_2954 ?auto_2960 ) ( CLEAR ?auto_2954 ) ( TRUCK-AT ?auto_2957 ?auto_2956 ) ( not ( = ?auto_2953 ?auto_2954 ) ) ( not ( = ?auto_2953 ?auto_2960 ) ) ( not ( = ?auto_2954 ?auto_2960 ) ) ( not ( = ?auto_2955 ?auto_2959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2957 ?auto_2956 ?auto_2958 )
      ( !LIFT ?auto_2959 ?auto_2954 ?auto_2960 ?auto_2958 )
      ( !LOAD ?auto_2959 ?auto_2954 ?auto_2957 ?auto_2958 )
      ( !DRIVE ?auto_2957 ?auto_2958 ?auto_2956 )
      ( !UNLOAD ?auto_2955 ?auto_2954 ?auto_2957 ?auto_2956 )
      ( !DROP ?auto_2955 ?auto_2954 ?auto_2953 ?auto_2956 )
      ( MAKE-1CRATE-VERIFY ?auto_2953 ?auto_2954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2963 - SURFACE
      ?auto_2964 - SURFACE
    )
    :vars
    (
      ?auto_2965 - HOIST
      ?auto_2966 - PLACE
      ?auto_2968 - PLACE
      ?auto_2969 - HOIST
      ?auto_2970 - SURFACE
      ?auto_2967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2965 ?auto_2966 ) ( SURFACE-AT ?auto_2963 ?auto_2966 ) ( CLEAR ?auto_2963 ) ( IS-CRATE ?auto_2964 ) ( AVAILABLE ?auto_2965 ) ( not ( = ?auto_2968 ?auto_2966 ) ) ( HOIST-AT ?auto_2969 ?auto_2968 ) ( AVAILABLE ?auto_2969 ) ( SURFACE-AT ?auto_2964 ?auto_2968 ) ( ON ?auto_2964 ?auto_2970 ) ( CLEAR ?auto_2964 ) ( TRUCK-AT ?auto_2967 ?auto_2966 ) ( not ( = ?auto_2963 ?auto_2964 ) ) ( not ( = ?auto_2963 ?auto_2970 ) ) ( not ( = ?auto_2964 ?auto_2970 ) ) ( not ( = ?auto_2965 ?auto_2969 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2967 ?auto_2966 ?auto_2968 )
      ( !LIFT ?auto_2969 ?auto_2964 ?auto_2970 ?auto_2968 )
      ( !LOAD ?auto_2969 ?auto_2964 ?auto_2967 ?auto_2968 )
      ( !DRIVE ?auto_2967 ?auto_2968 ?auto_2966 )
      ( !UNLOAD ?auto_2965 ?auto_2964 ?auto_2967 ?auto_2966 )
      ( !DROP ?auto_2965 ?auto_2964 ?auto_2963 ?auto_2966 )
      ( MAKE-1CRATE-VERIFY ?auto_2963 ?auto_2964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2974 - SURFACE
      ?auto_2975 - SURFACE
      ?auto_2976 - SURFACE
    )
    :vars
    (
      ?auto_2981 - HOIST
      ?auto_2977 - PLACE
      ?auto_2980 - PLACE
      ?auto_2978 - HOIST
      ?auto_2982 - SURFACE
      ?auto_2983 - SURFACE
      ?auto_2979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2981 ?auto_2977 ) ( IS-CRATE ?auto_2976 ) ( not ( = ?auto_2980 ?auto_2977 ) ) ( HOIST-AT ?auto_2978 ?auto_2980 ) ( SURFACE-AT ?auto_2976 ?auto_2980 ) ( ON ?auto_2976 ?auto_2982 ) ( CLEAR ?auto_2976 ) ( not ( = ?auto_2975 ?auto_2976 ) ) ( not ( = ?auto_2975 ?auto_2982 ) ) ( not ( = ?auto_2976 ?auto_2982 ) ) ( not ( = ?auto_2981 ?auto_2978 ) ) ( SURFACE-AT ?auto_2974 ?auto_2977 ) ( CLEAR ?auto_2974 ) ( IS-CRATE ?auto_2975 ) ( AVAILABLE ?auto_2981 ) ( AVAILABLE ?auto_2978 ) ( SURFACE-AT ?auto_2975 ?auto_2980 ) ( ON ?auto_2975 ?auto_2983 ) ( CLEAR ?auto_2975 ) ( TRUCK-AT ?auto_2979 ?auto_2977 ) ( not ( = ?auto_2974 ?auto_2975 ) ) ( not ( = ?auto_2974 ?auto_2983 ) ) ( not ( = ?auto_2975 ?auto_2983 ) ) ( not ( = ?auto_2974 ?auto_2976 ) ) ( not ( = ?auto_2974 ?auto_2982 ) ) ( not ( = ?auto_2976 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2974 ?auto_2975 )
      ( MAKE-1CRATE ?auto_2975 ?auto_2976 )
      ( MAKE-2CRATE-VERIFY ?auto_2974 ?auto_2975 ?auto_2976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2986 - SURFACE
      ?auto_2987 - SURFACE
    )
    :vars
    (
      ?auto_2988 - HOIST
      ?auto_2989 - PLACE
      ?auto_2991 - PLACE
      ?auto_2992 - HOIST
      ?auto_2993 - SURFACE
      ?auto_2990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2988 ?auto_2989 ) ( SURFACE-AT ?auto_2986 ?auto_2989 ) ( CLEAR ?auto_2986 ) ( IS-CRATE ?auto_2987 ) ( AVAILABLE ?auto_2988 ) ( not ( = ?auto_2991 ?auto_2989 ) ) ( HOIST-AT ?auto_2992 ?auto_2991 ) ( AVAILABLE ?auto_2992 ) ( SURFACE-AT ?auto_2987 ?auto_2991 ) ( ON ?auto_2987 ?auto_2993 ) ( CLEAR ?auto_2987 ) ( TRUCK-AT ?auto_2990 ?auto_2989 ) ( not ( = ?auto_2986 ?auto_2987 ) ) ( not ( = ?auto_2986 ?auto_2993 ) ) ( not ( = ?auto_2987 ?auto_2993 ) ) ( not ( = ?auto_2988 ?auto_2992 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2990 ?auto_2989 ?auto_2991 )
      ( !LIFT ?auto_2992 ?auto_2987 ?auto_2993 ?auto_2991 )
      ( !LOAD ?auto_2992 ?auto_2987 ?auto_2990 ?auto_2991 )
      ( !DRIVE ?auto_2990 ?auto_2991 ?auto_2989 )
      ( !UNLOAD ?auto_2988 ?auto_2987 ?auto_2990 ?auto_2989 )
      ( !DROP ?auto_2988 ?auto_2987 ?auto_2986 ?auto_2989 )
      ( MAKE-1CRATE-VERIFY ?auto_2986 ?auto_2987 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2998 - SURFACE
      ?auto_2999 - SURFACE
      ?auto_3000 - SURFACE
      ?auto_3001 - SURFACE
    )
    :vars
    (
      ?auto_3002 - HOIST
      ?auto_3004 - PLACE
      ?auto_3006 - PLACE
      ?auto_3007 - HOIST
      ?auto_3003 - SURFACE
      ?auto_3009 - PLACE
      ?auto_3008 - HOIST
      ?auto_3010 - SURFACE
      ?auto_3011 - SURFACE
      ?auto_3005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3002 ?auto_3004 ) ( IS-CRATE ?auto_3001 ) ( not ( = ?auto_3006 ?auto_3004 ) ) ( HOIST-AT ?auto_3007 ?auto_3006 ) ( AVAILABLE ?auto_3007 ) ( SURFACE-AT ?auto_3001 ?auto_3006 ) ( ON ?auto_3001 ?auto_3003 ) ( CLEAR ?auto_3001 ) ( not ( = ?auto_3000 ?auto_3001 ) ) ( not ( = ?auto_3000 ?auto_3003 ) ) ( not ( = ?auto_3001 ?auto_3003 ) ) ( not ( = ?auto_3002 ?auto_3007 ) ) ( IS-CRATE ?auto_3000 ) ( not ( = ?auto_3009 ?auto_3004 ) ) ( HOIST-AT ?auto_3008 ?auto_3009 ) ( SURFACE-AT ?auto_3000 ?auto_3009 ) ( ON ?auto_3000 ?auto_3010 ) ( CLEAR ?auto_3000 ) ( not ( = ?auto_2999 ?auto_3000 ) ) ( not ( = ?auto_2999 ?auto_3010 ) ) ( not ( = ?auto_3000 ?auto_3010 ) ) ( not ( = ?auto_3002 ?auto_3008 ) ) ( SURFACE-AT ?auto_2998 ?auto_3004 ) ( CLEAR ?auto_2998 ) ( IS-CRATE ?auto_2999 ) ( AVAILABLE ?auto_3002 ) ( AVAILABLE ?auto_3008 ) ( SURFACE-AT ?auto_2999 ?auto_3009 ) ( ON ?auto_2999 ?auto_3011 ) ( CLEAR ?auto_2999 ) ( TRUCK-AT ?auto_3005 ?auto_3004 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_3011 ) ) ( not ( = ?auto_2999 ?auto_3011 ) ) ( not ( = ?auto_2998 ?auto_3000 ) ) ( not ( = ?auto_2998 ?auto_3010 ) ) ( not ( = ?auto_3000 ?auto_3011 ) ) ( not ( = ?auto_3010 ?auto_3011 ) ) ( not ( = ?auto_2998 ?auto_3001 ) ) ( not ( = ?auto_2998 ?auto_3003 ) ) ( not ( = ?auto_2999 ?auto_3001 ) ) ( not ( = ?auto_2999 ?auto_3003 ) ) ( not ( = ?auto_3001 ?auto_3010 ) ) ( not ( = ?auto_3001 ?auto_3011 ) ) ( not ( = ?auto_3006 ?auto_3009 ) ) ( not ( = ?auto_3007 ?auto_3008 ) ) ( not ( = ?auto_3003 ?auto_3010 ) ) ( not ( = ?auto_3003 ?auto_3011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2998 ?auto_2999 ?auto_3000 )
      ( MAKE-1CRATE ?auto_3000 ?auto_3001 )
      ( MAKE-3CRATE-VERIFY ?auto_2998 ?auto_2999 ?auto_3000 ?auto_3001 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3014 - SURFACE
      ?auto_3015 - SURFACE
    )
    :vars
    (
      ?auto_3016 - HOIST
      ?auto_3017 - PLACE
      ?auto_3019 - PLACE
      ?auto_3020 - HOIST
      ?auto_3021 - SURFACE
      ?auto_3018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3016 ?auto_3017 ) ( SURFACE-AT ?auto_3014 ?auto_3017 ) ( CLEAR ?auto_3014 ) ( IS-CRATE ?auto_3015 ) ( AVAILABLE ?auto_3016 ) ( not ( = ?auto_3019 ?auto_3017 ) ) ( HOIST-AT ?auto_3020 ?auto_3019 ) ( AVAILABLE ?auto_3020 ) ( SURFACE-AT ?auto_3015 ?auto_3019 ) ( ON ?auto_3015 ?auto_3021 ) ( CLEAR ?auto_3015 ) ( TRUCK-AT ?auto_3018 ?auto_3017 ) ( not ( = ?auto_3014 ?auto_3015 ) ) ( not ( = ?auto_3014 ?auto_3021 ) ) ( not ( = ?auto_3015 ?auto_3021 ) ) ( not ( = ?auto_3016 ?auto_3020 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3018 ?auto_3017 ?auto_3019 )
      ( !LIFT ?auto_3020 ?auto_3015 ?auto_3021 ?auto_3019 )
      ( !LOAD ?auto_3020 ?auto_3015 ?auto_3018 ?auto_3019 )
      ( !DRIVE ?auto_3018 ?auto_3019 ?auto_3017 )
      ( !UNLOAD ?auto_3016 ?auto_3015 ?auto_3018 ?auto_3017 )
      ( !DROP ?auto_3016 ?auto_3015 ?auto_3014 ?auto_3017 )
      ( MAKE-1CRATE-VERIFY ?auto_3014 ?auto_3015 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3027 - SURFACE
      ?auto_3028 - SURFACE
      ?auto_3029 - SURFACE
      ?auto_3030 - SURFACE
      ?auto_3031 - SURFACE
    )
    :vars
    (
      ?auto_3036 - HOIST
      ?auto_3033 - PLACE
      ?auto_3034 - PLACE
      ?auto_3032 - HOIST
      ?auto_3037 - SURFACE
      ?auto_3041 - SURFACE
      ?auto_3042 - PLACE
      ?auto_3040 - HOIST
      ?auto_3038 - SURFACE
      ?auto_3039 - SURFACE
      ?auto_3035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3036 ?auto_3033 ) ( IS-CRATE ?auto_3031 ) ( not ( = ?auto_3034 ?auto_3033 ) ) ( HOIST-AT ?auto_3032 ?auto_3034 ) ( SURFACE-AT ?auto_3031 ?auto_3034 ) ( ON ?auto_3031 ?auto_3037 ) ( CLEAR ?auto_3031 ) ( not ( = ?auto_3030 ?auto_3031 ) ) ( not ( = ?auto_3030 ?auto_3037 ) ) ( not ( = ?auto_3031 ?auto_3037 ) ) ( not ( = ?auto_3036 ?auto_3032 ) ) ( IS-CRATE ?auto_3030 ) ( AVAILABLE ?auto_3032 ) ( SURFACE-AT ?auto_3030 ?auto_3034 ) ( ON ?auto_3030 ?auto_3041 ) ( CLEAR ?auto_3030 ) ( not ( = ?auto_3029 ?auto_3030 ) ) ( not ( = ?auto_3029 ?auto_3041 ) ) ( not ( = ?auto_3030 ?auto_3041 ) ) ( IS-CRATE ?auto_3029 ) ( not ( = ?auto_3042 ?auto_3033 ) ) ( HOIST-AT ?auto_3040 ?auto_3042 ) ( SURFACE-AT ?auto_3029 ?auto_3042 ) ( ON ?auto_3029 ?auto_3038 ) ( CLEAR ?auto_3029 ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3038 ) ) ( not ( = ?auto_3029 ?auto_3038 ) ) ( not ( = ?auto_3036 ?auto_3040 ) ) ( SURFACE-AT ?auto_3027 ?auto_3033 ) ( CLEAR ?auto_3027 ) ( IS-CRATE ?auto_3028 ) ( AVAILABLE ?auto_3036 ) ( AVAILABLE ?auto_3040 ) ( SURFACE-AT ?auto_3028 ?auto_3042 ) ( ON ?auto_3028 ?auto_3039 ) ( CLEAR ?auto_3028 ) ( TRUCK-AT ?auto_3035 ?auto_3033 ) ( not ( = ?auto_3027 ?auto_3028 ) ) ( not ( = ?auto_3027 ?auto_3039 ) ) ( not ( = ?auto_3028 ?auto_3039 ) ) ( not ( = ?auto_3027 ?auto_3029 ) ) ( not ( = ?auto_3027 ?auto_3038 ) ) ( not ( = ?auto_3029 ?auto_3039 ) ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( not ( = ?auto_3027 ?auto_3030 ) ) ( not ( = ?auto_3027 ?auto_3041 ) ) ( not ( = ?auto_3028 ?auto_3030 ) ) ( not ( = ?auto_3028 ?auto_3041 ) ) ( not ( = ?auto_3030 ?auto_3038 ) ) ( not ( = ?auto_3030 ?auto_3039 ) ) ( not ( = ?auto_3034 ?auto_3042 ) ) ( not ( = ?auto_3032 ?auto_3040 ) ) ( not ( = ?auto_3041 ?auto_3038 ) ) ( not ( = ?auto_3041 ?auto_3039 ) ) ( not ( = ?auto_3027 ?auto_3031 ) ) ( not ( = ?auto_3027 ?auto_3037 ) ) ( not ( = ?auto_3028 ?auto_3031 ) ) ( not ( = ?auto_3028 ?auto_3037 ) ) ( not ( = ?auto_3029 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3037 ) ) ( not ( = ?auto_3031 ?auto_3041 ) ) ( not ( = ?auto_3031 ?auto_3038 ) ) ( not ( = ?auto_3031 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3041 ) ) ( not ( = ?auto_3037 ?auto_3038 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3027 ?auto_3028 ?auto_3029 ?auto_3030 )
      ( MAKE-1CRATE ?auto_3030 ?auto_3031 )
      ( MAKE-4CRATE-VERIFY ?auto_3027 ?auto_3028 ?auto_3029 ?auto_3030 ?auto_3031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3045 - SURFACE
      ?auto_3046 - SURFACE
    )
    :vars
    (
      ?auto_3047 - HOIST
      ?auto_3048 - PLACE
      ?auto_3050 - PLACE
      ?auto_3051 - HOIST
      ?auto_3052 - SURFACE
      ?auto_3049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3047 ?auto_3048 ) ( SURFACE-AT ?auto_3045 ?auto_3048 ) ( CLEAR ?auto_3045 ) ( IS-CRATE ?auto_3046 ) ( AVAILABLE ?auto_3047 ) ( not ( = ?auto_3050 ?auto_3048 ) ) ( HOIST-AT ?auto_3051 ?auto_3050 ) ( AVAILABLE ?auto_3051 ) ( SURFACE-AT ?auto_3046 ?auto_3050 ) ( ON ?auto_3046 ?auto_3052 ) ( CLEAR ?auto_3046 ) ( TRUCK-AT ?auto_3049 ?auto_3048 ) ( not ( = ?auto_3045 ?auto_3046 ) ) ( not ( = ?auto_3045 ?auto_3052 ) ) ( not ( = ?auto_3046 ?auto_3052 ) ) ( not ( = ?auto_3047 ?auto_3051 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3049 ?auto_3048 ?auto_3050 )
      ( !LIFT ?auto_3051 ?auto_3046 ?auto_3052 ?auto_3050 )
      ( !LOAD ?auto_3051 ?auto_3046 ?auto_3049 ?auto_3050 )
      ( !DRIVE ?auto_3049 ?auto_3050 ?auto_3048 )
      ( !UNLOAD ?auto_3047 ?auto_3046 ?auto_3049 ?auto_3048 )
      ( !DROP ?auto_3047 ?auto_3046 ?auto_3045 ?auto_3048 )
      ( MAKE-1CRATE-VERIFY ?auto_3045 ?auto_3046 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3059 - SURFACE
      ?auto_3060 - SURFACE
      ?auto_3061 - SURFACE
      ?auto_3062 - SURFACE
      ?auto_3063 - SURFACE
      ?auto_3064 - SURFACE
    )
    :vars
    (
      ?auto_3065 - HOIST
      ?auto_3068 - PLACE
      ?auto_3069 - PLACE
      ?auto_3067 - HOIST
      ?auto_3066 - SURFACE
      ?auto_3076 - PLACE
      ?auto_3075 - HOIST
      ?auto_3074 - SURFACE
      ?auto_3072 - SURFACE
      ?auto_3073 - SURFACE
      ?auto_3071 - SURFACE
      ?auto_3070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3065 ?auto_3068 ) ( IS-CRATE ?auto_3064 ) ( not ( = ?auto_3069 ?auto_3068 ) ) ( HOIST-AT ?auto_3067 ?auto_3069 ) ( SURFACE-AT ?auto_3064 ?auto_3069 ) ( ON ?auto_3064 ?auto_3066 ) ( CLEAR ?auto_3064 ) ( not ( = ?auto_3063 ?auto_3064 ) ) ( not ( = ?auto_3063 ?auto_3066 ) ) ( not ( = ?auto_3064 ?auto_3066 ) ) ( not ( = ?auto_3065 ?auto_3067 ) ) ( IS-CRATE ?auto_3063 ) ( not ( = ?auto_3076 ?auto_3068 ) ) ( HOIST-AT ?auto_3075 ?auto_3076 ) ( SURFACE-AT ?auto_3063 ?auto_3076 ) ( ON ?auto_3063 ?auto_3074 ) ( CLEAR ?auto_3063 ) ( not ( = ?auto_3062 ?auto_3063 ) ) ( not ( = ?auto_3062 ?auto_3074 ) ) ( not ( = ?auto_3063 ?auto_3074 ) ) ( not ( = ?auto_3065 ?auto_3075 ) ) ( IS-CRATE ?auto_3062 ) ( AVAILABLE ?auto_3075 ) ( SURFACE-AT ?auto_3062 ?auto_3076 ) ( ON ?auto_3062 ?auto_3072 ) ( CLEAR ?auto_3062 ) ( not ( = ?auto_3061 ?auto_3062 ) ) ( not ( = ?auto_3061 ?auto_3072 ) ) ( not ( = ?auto_3062 ?auto_3072 ) ) ( IS-CRATE ?auto_3061 ) ( SURFACE-AT ?auto_3061 ?auto_3069 ) ( ON ?auto_3061 ?auto_3073 ) ( CLEAR ?auto_3061 ) ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3060 ?auto_3073 ) ) ( not ( = ?auto_3061 ?auto_3073 ) ) ( SURFACE-AT ?auto_3059 ?auto_3068 ) ( CLEAR ?auto_3059 ) ( IS-CRATE ?auto_3060 ) ( AVAILABLE ?auto_3065 ) ( AVAILABLE ?auto_3067 ) ( SURFACE-AT ?auto_3060 ?auto_3069 ) ( ON ?auto_3060 ?auto_3071 ) ( CLEAR ?auto_3060 ) ( TRUCK-AT ?auto_3070 ?auto_3068 ) ( not ( = ?auto_3059 ?auto_3060 ) ) ( not ( = ?auto_3059 ?auto_3071 ) ) ( not ( = ?auto_3060 ?auto_3071 ) ) ( not ( = ?auto_3059 ?auto_3061 ) ) ( not ( = ?auto_3059 ?auto_3073 ) ) ( not ( = ?auto_3061 ?auto_3071 ) ) ( not ( = ?auto_3073 ?auto_3071 ) ) ( not ( = ?auto_3059 ?auto_3062 ) ) ( not ( = ?auto_3059 ?auto_3072 ) ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3072 ) ) ( not ( = ?auto_3062 ?auto_3073 ) ) ( not ( = ?auto_3062 ?auto_3071 ) ) ( not ( = ?auto_3076 ?auto_3069 ) ) ( not ( = ?auto_3075 ?auto_3067 ) ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3071 ) ) ( not ( = ?auto_3059 ?auto_3063 ) ) ( not ( = ?auto_3059 ?auto_3074 ) ) ( not ( = ?auto_3060 ?auto_3063 ) ) ( not ( = ?auto_3060 ?auto_3074 ) ) ( not ( = ?auto_3061 ?auto_3063 ) ) ( not ( = ?auto_3061 ?auto_3074 ) ) ( not ( = ?auto_3063 ?auto_3072 ) ) ( not ( = ?auto_3063 ?auto_3073 ) ) ( not ( = ?auto_3063 ?auto_3071 ) ) ( not ( = ?auto_3074 ?auto_3072 ) ) ( not ( = ?auto_3074 ?auto_3073 ) ) ( not ( = ?auto_3074 ?auto_3071 ) ) ( not ( = ?auto_3059 ?auto_3064 ) ) ( not ( = ?auto_3059 ?auto_3066 ) ) ( not ( = ?auto_3060 ?auto_3064 ) ) ( not ( = ?auto_3060 ?auto_3066 ) ) ( not ( = ?auto_3061 ?auto_3064 ) ) ( not ( = ?auto_3061 ?auto_3066 ) ) ( not ( = ?auto_3062 ?auto_3064 ) ) ( not ( = ?auto_3062 ?auto_3066 ) ) ( not ( = ?auto_3064 ?auto_3074 ) ) ( not ( = ?auto_3064 ?auto_3072 ) ) ( not ( = ?auto_3064 ?auto_3073 ) ) ( not ( = ?auto_3064 ?auto_3071 ) ) ( not ( = ?auto_3066 ?auto_3074 ) ) ( not ( = ?auto_3066 ?auto_3072 ) ) ( not ( = ?auto_3066 ?auto_3073 ) ) ( not ( = ?auto_3066 ?auto_3071 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3059 ?auto_3060 ?auto_3061 ?auto_3062 ?auto_3063 )
      ( MAKE-1CRATE ?auto_3063 ?auto_3064 )
      ( MAKE-5CRATE-VERIFY ?auto_3059 ?auto_3060 ?auto_3061 ?auto_3062 ?auto_3063 ?auto_3064 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3079 - SURFACE
      ?auto_3080 - SURFACE
    )
    :vars
    (
      ?auto_3081 - HOIST
      ?auto_3082 - PLACE
      ?auto_3084 - PLACE
      ?auto_3085 - HOIST
      ?auto_3086 - SURFACE
      ?auto_3083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3081 ?auto_3082 ) ( SURFACE-AT ?auto_3079 ?auto_3082 ) ( CLEAR ?auto_3079 ) ( IS-CRATE ?auto_3080 ) ( AVAILABLE ?auto_3081 ) ( not ( = ?auto_3084 ?auto_3082 ) ) ( HOIST-AT ?auto_3085 ?auto_3084 ) ( AVAILABLE ?auto_3085 ) ( SURFACE-AT ?auto_3080 ?auto_3084 ) ( ON ?auto_3080 ?auto_3086 ) ( CLEAR ?auto_3080 ) ( TRUCK-AT ?auto_3083 ?auto_3082 ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( not ( = ?auto_3079 ?auto_3086 ) ) ( not ( = ?auto_3080 ?auto_3086 ) ) ( not ( = ?auto_3081 ?auto_3085 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3083 ?auto_3082 ?auto_3084 )
      ( !LIFT ?auto_3085 ?auto_3080 ?auto_3086 ?auto_3084 )
      ( !LOAD ?auto_3085 ?auto_3080 ?auto_3083 ?auto_3084 )
      ( !DRIVE ?auto_3083 ?auto_3084 ?auto_3082 )
      ( !UNLOAD ?auto_3081 ?auto_3080 ?auto_3083 ?auto_3082 )
      ( !DROP ?auto_3081 ?auto_3080 ?auto_3079 ?auto_3082 )
      ( MAKE-1CRATE-VERIFY ?auto_3079 ?auto_3080 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3094 - SURFACE
      ?auto_3095 - SURFACE
      ?auto_3096 - SURFACE
      ?auto_3097 - SURFACE
      ?auto_3098 - SURFACE
      ?auto_3100 - SURFACE
      ?auto_3099 - SURFACE
    )
    :vars
    (
      ?auto_3104 - HOIST
      ?auto_3106 - PLACE
      ?auto_3102 - PLACE
      ?auto_3103 - HOIST
      ?auto_3101 - SURFACE
      ?auto_3109 - PLACE
      ?auto_3107 - HOIST
      ?auto_3108 - SURFACE
      ?auto_3112 - PLACE
      ?auto_3113 - HOIST
      ?auto_3111 - SURFACE
      ?auto_3115 - SURFACE
      ?auto_3110 - SURFACE
      ?auto_3114 - SURFACE
      ?auto_3105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3104 ?auto_3106 ) ( IS-CRATE ?auto_3099 ) ( not ( = ?auto_3102 ?auto_3106 ) ) ( HOIST-AT ?auto_3103 ?auto_3102 ) ( AVAILABLE ?auto_3103 ) ( SURFACE-AT ?auto_3099 ?auto_3102 ) ( ON ?auto_3099 ?auto_3101 ) ( CLEAR ?auto_3099 ) ( not ( = ?auto_3100 ?auto_3099 ) ) ( not ( = ?auto_3100 ?auto_3101 ) ) ( not ( = ?auto_3099 ?auto_3101 ) ) ( not ( = ?auto_3104 ?auto_3103 ) ) ( IS-CRATE ?auto_3100 ) ( not ( = ?auto_3109 ?auto_3106 ) ) ( HOIST-AT ?auto_3107 ?auto_3109 ) ( SURFACE-AT ?auto_3100 ?auto_3109 ) ( ON ?auto_3100 ?auto_3108 ) ( CLEAR ?auto_3100 ) ( not ( = ?auto_3098 ?auto_3100 ) ) ( not ( = ?auto_3098 ?auto_3108 ) ) ( not ( = ?auto_3100 ?auto_3108 ) ) ( not ( = ?auto_3104 ?auto_3107 ) ) ( IS-CRATE ?auto_3098 ) ( not ( = ?auto_3112 ?auto_3106 ) ) ( HOIST-AT ?auto_3113 ?auto_3112 ) ( SURFACE-AT ?auto_3098 ?auto_3112 ) ( ON ?auto_3098 ?auto_3111 ) ( CLEAR ?auto_3098 ) ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3097 ?auto_3111 ) ) ( not ( = ?auto_3098 ?auto_3111 ) ) ( not ( = ?auto_3104 ?auto_3113 ) ) ( IS-CRATE ?auto_3097 ) ( AVAILABLE ?auto_3113 ) ( SURFACE-AT ?auto_3097 ?auto_3112 ) ( ON ?auto_3097 ?auto_3115 ) ( CLEAR ?auto_3097 ) ( not ( = ?auto_3096 ?auto_3097 ) ) ( not ( = ?auto_3096 ?auto_3115 ) ) ( not ( = ?auto_3097 ?auto_3115 ) ) ( IS-CRATE ?auto_3096 ) ( SURFACE-AT ?auto_3096 ?auto_3109 ) ( ON ?auto_3096 ?auto_3110 ) ( CLEAR ?auto_3096 ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3110 ) ) ( not ( = ?auto_3096 ?auto_3110 ) ) ( SURFACE-AT ?auto_3094 ?auto_3106 ) ( CLEAR ?auto_3094 ) ( IS-CRATE ?auto_3095 ) ( AVAILABLE ?auto_3104 ) ( AVAILABLE ?auto_3107 ) ( SURFACE-AT ?auto_3095 ?auto_3109 ) ( ON ?auto_3095 ?auto_3114 ) ( CLEAR ?auto_3095 ) ( TRUCK-AT ?auto_3105 ?auto_3106 ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3114 ) ) ( not ( = ?auto_3095 ?auto_3114 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3094 ?auto_3110 ) ) ( not ( = ?auto_3096 ?auto_3114 ) ) ( not ( = ?auto_3110 ?auto_3114 ) ) ( not ( = ?auto_3094 ?auto_3097 ) ) ( not ( = ?auto_3094 ?auto_3115 ) ) ( not ( = ?auto_3095 ?auto_3097 ) ) ( not ( = ?auto_3095 ?auto_3115 ) ) ( not ( = ?auto_3097 ?auto_3110 ) ) ( not ( = ?auto_3097 ?auto_3114 ) ) ( not ( = ?auto_3112 ?auto_3109 ) ) ( not ( = ?auto_3113 ?auto_3107 ) ) ( not ( = ?auto_3115 ?auto_3110 ) ) ( not ( = ?auto_3115 ?auto_3114 ) ) ( not ( = ?auto_3094 ?auto_3098 ) ) ( not ( = ?auto_3094 ?auto_3111 ) ) ( not ( = ?auto_3095 ?auto_3098 ) ) ( not ( = ?auto_3095 ?auto_3111 ) ) ( not ( = ?auto_3096 ?auto_3098 ) ) ( not ( = ?auto_3096 ?auto_3111 ) ) ( not ( = ?auto_3098 ?auto_3115 ) ) ( not ( = ?auto_3098 ?auto_3110 ) ) ( not ( = ?auto_3098 ?auto_3114 ) ) ( not ( = ?auto_3111 ?auto_3115 ) ) ( not ( = ?auto_3111 ?auto_3110 ) ) ( not ( = ?auto_3111 ?auto_3114 ) ) ( not ( = ?auto_3094 ?auto_3100 ) ) ( not ( = ?auto_3094 ?auto_3108 ) ) ( not ( = ?auto_3095 ?auto_3100 ) ) ( not ( = ?auto_3095 ?auto_3108 ) ) ( not ( = ?auto_3096 ?auto_3100 ) ) ( not ( = ?auto_3096 ?auto_3108 ) ) ( not ( = ?auto_3097 ?auto_3100 ) ) ( not ( = ?auto_3097 ?auto_3108 ) ) ( not ( = ?auto_3100 ?auto_3111 ) ) ( not ( = ?auto_3100 ?auto_3115 ) ) ( not ( = ?auto_3100 ?auto_3110 ) ) ( not ( = ?auto_3100 ?auto_3114 ) ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3108 ?auto_3115 ) ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3108 ?auto_3114 ) ) ( not ( = ?auto_3094 ?auto_3099 ) ) ( not ( = ?auto_3094 ?auto_3101 ) ) ( not ( = ?auto_3095 ?auto_3099 ) ) ( not ( = ?auto_3095 ?auto_3101 ) ) ( not ( = ?auto_3096 ?auto_3099 ) ) ( not ( = ?auto_3096 ?auto_3101 ) ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( not ( = ?auto_3097 ?auto_3101 ) ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( not ( = ?auto_3098 ?auto_3101 ) ) ( not ( = ?auto_3099 ?auto_3108 ) ) ( not ( = ?auto_3099 ?auto_3111 ) ) ( not ( = ?auto_3099 ?auto_3115 ) ) ( not ( = ?auto_3099 ?auto_3110 ) ) ( not ( = ?auto_3099 ?auto_3114 ) ) ( not ( = ?auto_3102 ?auto_3109 ) ) ( not ( = ?auto_3102 ?auto_3112 ) ) ( not ( = ?auto_3103 ?auto_3107 ) ) ( not ( = ?auto_3103 ?auto_3113 ) ) ( not ( = ?auto_3101 ?auto_3108 ) ) ( not ( = ?auto_3101 ?auto_3111 ) ) ( not ( = ?auto_3101 ?auto_3115 ) ) ( not ( = ?auto_3101 ?auto_3110 ) ) ( not ( = ?auto_3101 ?auto_3114 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3100 )
      ( MAKE-1CRATE ?auto_3100 ?auto_3099 )
      ( MAKE-6CRATE-VERIFY ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3100 ?auto_3099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3118 - SURFACE
      ?auto_3119 - SURFACE
    )
    :vars
    (
      ?auto_3120 - HOIST
      ?auto_3121 - PLACE
      ?auto_3123 - PLACE
      ?auto_3124 - HOIST
      ?auto_3125 - SURFACE
      ?auto_3122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3120 ?auto_3121 ) ( SURFACE-AT ?auto_3118 ?auto_3121 ) ( CLEAR ?auto_3118 ) ( IS-CRATE ?auto_3119 ) ( AVAILABLE ?auto_3120 ) ( not ( = ?auto_3123 ?auto_3121 ) ) ( HOIST-AT ?auto_3124 ?auto_3123 ) ( AVAILABLE ?auto_3124 ) ( SURFACE-AT ?auto_3119 ?auto_3123 ) ( ON ?auto_3119 ?auto_3125 ) ( CLEAR ?auto_3119 ) ( TRUCK-AT ?auto_3122 ?auto_3121 ) ( not ( = ?auto_3118 ?auto_3119 ) ) ( not ( = ?auto_3118 ?auto_3125 ) ) ( not ( = ?auto_3119 ?auto_3125 ) ) ( not ( = ?auto_3120 ?auto_3124 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3122 ?auto_3121 ?auto_3123 )
      ( !LIFT ?auto_3124 ?auto_3119 ?auto_3125 ?auto_3123 )
      ( !LOAD ?auto_3124 ?auto_3119 ?auto_3122 ?auto_3123 )
      ( !DRIVE ?auto_3122 ?auto_3123 ?auto_3121 )
      ( !UNLOAD ?auto_3120 ?auto_3119 ?auto_3122 ?auto_3121 )
      ( !DROP ?auto_3120 ?auto_3119 ?auto_3118 ?auto_3121 )
      ( MAKE-1CRATE-VERIFY ?auto_3118 ?auto_3119 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3134 - SURFACE
      ?auto_3135 - SURFACE
      ?auto_3136 - SURFACE
      ?auto_3137 - SURFACE
      ?auto_3138 - SURFACE
      ?auto_3140 - SURFACE
      ?auto_3139 - SURFACE
      ?auto_3141 - SURFACE
    )
    :vars
    (
      ?auto_3147 - HOIST
      ?auto_3142 - PLACE
      ?auto_3145 - PLACE
      ?auto_3144 - HOIST
      ?auto_3143 - SURFACE
      ?auto_3153 - PLACE
      ?auto_3150 - HOIST
      ?auto_3148 - SURFACE
      ?auto_3157 - PLACE
      ?auto_3149 - HOIST
      ?auto_3151 - SURFACE
      ?auto_3156 - SURFACE
      ?auto_3154 - SURFACE
      ?auto_3152 - SURFACE
      ?auto_3155 - SURFACE
      ?auto_3146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3147 ?auto_3142 ) ( IS-CRATE ?auto_3141 ) ( not ( = ?auto_3145 ?auto_3142 ) ) ( HOIST-AT ?auto_3144 ?auto_3145 ) ( SURFACE-AT ?auto_3141 ?auto_3145 ) ( ON ?auto_3141 ?auto_3143 ) ( CLEAR ?auto_3141 ) ( not ( = ?auto_3139 ?auto_3141 ) ) ( not ( = ?auto_3139 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3147 ?auto_3144 ) ) ( IS-CRATE ?auto_3139 ) ( not ( = ?auto_3153 ?auto_3142 ) ) ( HOIST-AT ?auto_3150 ?auto_3153 ) ( AVAILABLE ?auto_3150 ) ( SURFACE-AT ?auto_3139 ?auto_3153 ) ( ON ?auto_3139 ?auto_3148 ) ( CLEAR ?auto_3139 ) ( not ( = ?auto_3140 ?auto_3139 ) ) ( not ( = ?auto_3140 ?auto_3148 ) ) ( not ( = ?auto_3139 ?auto_3148 ) ) ( not ( = ?auto_3147 ?auto_3150 ) ) ( IS-CRATE ?auto_3140 ) ( not ( = ?auto_3157 ?auto_3142 ) ) ( HOIST-AT ?auto_3149 ?auto_3157 ) ( SURFACE-AT ?auto_3140 ?auto_3157 ) ( ON ?auto_3140 ?auto_3151 ) ( CLEAR ?auto_3140 ) ( not ( = ?auto_3138 ?auto_3140 ) ) ( not ( = ?auto_3138 ?auto_3151 ) ) ( not ( = ?auto_3140 ?auto_3151 ) ) ( not ( = ?auto_3147 ?auto_3149 ) ) ( IS-CRATE ?auto_3138 ) ( SURFACE-AT ?auto_3138 ?auto_3145 ) ( ON ?auto_3138 ?auto_3156 ) ( CLEAR ?auto_3138 ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3137 ?auto_3156 ) ) ( not ( = ?auto_3138 ?auto_3156 ) ) ( IS-CRATE ?auto_3137 ) ( AVAILABLE ?auto_3144 ) ( SURFACE-AT ?auto_3137 ?auto_3145 ) ( ON ?auto_3137 ?auto_3154 ) ( CLEAR ?auto_3137 ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( not ( = ?auto_3136 ?auto_3154 ) ) ( not ( = ?auto_3137 ?auto_3154 ) ) ( IS-CRATE ?auto_3136 ) ( SURFACE-AT ?auto_3136 ?auto_3157 ) ( ON ?auto_3136 ?auto_3152 ) ( CLEAR ?auto_3136 ) ( not ( = ?auto_3135 ?auto_3136 ) ) ( not ( = ?auto_3135 ?auto_3152 ) ) ( not ( = ?auto_3136 ?auto_3152 ) ) ( SURFACE-AT ?auto_3134 ?auto_3142 ) ( CLEAR ?auto_3134 ) ( IS-CRATE ?auto_3135 ) ( AVAILABLE ?auto_3147 ) ( AVAILABLE ?auto_3149 ) ( SURFACE-AT ?auto_3135 ?auto_3157 ) ( ON ?auto_3135 ?auto_3155 ) ( CLEAR ?auto_3135 ) ( TRUCK-AT ?auto_3146 ?auto_3142 ) ( not ( = ?auto_3134 ?auto_3135 ) ) ( not ( = ?auto_3134 ?auto_3155 ) ) ( not ( = ?auto_3135 ?auto_3155 ) ) ( not ( = ?auto_3134 ?auto_3136 ) ) ( not ( = ?auto_3134 ?auto_3152 ) ) ( not ( = ?auto_3136 ?auto_3155 ) ) ( not ( = ?auto_3152 ?auto_3155 ) ) ( not ( = ?auto_3134 ?auto_3137 ) ) ( not ( = ?auto_3134 ?auto_3154 ) ) ( not ( = ?auto_3135 ?auto_3137 ) ) ( not ( = ?auto_3135 ?auto_3154 ) ) ( not ( = ?auto_3137 ?auto_3152 ) ) ( not ( = ?auto_3137 ?auto_3155 ) ) ( not ( = ?auto_3145 ?auto_3157 ) ) ( not ( = ?auto_3144 ?auto_3149 ) ) ( not ( = ?auto_3154 ?auto_3152 ) ) ( not ( = ?auto_3154 ?auto_3155 ) ) ( not ( = ?auto_3134 ?auto_3138 ) ) ( not ( = ?auto_3134 ?auto_3156 ) ) ( not ( = ?auto_3135 ?auto_3138 ) ) ( not ( = ?auto_3135 ?auto_3156 ) ) ( not ( = ?auto_3136 ?auto_3138 ) ) ( not ( = ?auto_3136 ?auto_3156 ) ) ( not ( = ?auto_3138 ?auto_3154 ) ) ( not ( = ?auto_3138 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3155 ) ) ( not ( = ?auto_3156 ?auto_3154 ) ) ( not ( = ?auto_3156 ?auto_3152 ) ) ( not ( = ?auto_3156 ?auto_3155 ) ) ( not ( = ?auto_3134 ?auto_3140 ) ) ( not ( = ?auto_3134 ?auto_3151 ) ) ( not ( = ?auto_3135 ?auto_3140 ) ) ( not ( = ?auto_3135 ?auto_3151 ) ) ( not ( = ?auto_3136 ?auto_3140 ) ) ( not ( = ?auto_3136 ?auto_3151 ) ) ( not ( = ?auto_3137 ?auto_3140 ) ) ( not ( = ?auto_3137 ?auto_3151 ) ) ( not ( = ?auto_3140 ?auto_3156 ) ) ( not ( = ?auto_3140 ?auto_3154 ) ) ( not ( = ?auto_3140 ?auto_3152 ) ) ( not ( = ?auto_3140 ?auto_3155 ) ) ( not ( = ?auto_3151 ?auto_3156 ) ) ( not ( = ?auto_3151 ?auto_3154 ) ) ( not ( = ?auto_3151 ?auto_3152 ) ) ( not ( = ?auto_3151 ?auto_3155 ) ) ( not ( = ?auto_3134 ?auto_3139 ) ) ( not ( = ?auto_3134 ?auto_3148 ) ) ( not ( = ?auto_3135 ?auto_3139 ) ) ( not ( = ?auto_3135 ?auto_3148 ) ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3136 ?auto_3148 ) ) ( not ( = ?auto_3137 ?auto_3139 ) ) ( not ( = ?auto_3137 ?auto_3148 ) ) ( not ( = ?auto_3138 ?auto_3139 ) ) ( not ( = ?auto_3138 ?auto_3148 ) ) ( not ( = ?auto_3139 ?auto_3151 ) ) ( not ( = ?auto_3139 ?auto_3156 ) ) ( not ( = ?auto_3139 ?auto_3154 ) ) ( not ( = ?auto_3139 ?auto_3152 ) ) ( not ( = ?auto_3139 ?auto_3155 ) ) ( not ( = ?auto_3153 ?auto_3157 ) ) ( not ( = ?auto_3153 ?auto_3145 ) ) ( not ( = ?auto_3150 ?auto_3149 ) ) ( not ( = ?auto_3150 ?auto_3144 ) ) ( not ( = ?auto_3148 ?auto_3151 ) ) ( not ( = ?auto_3148 ?auto_3156 ) ) ( not ( = ?auto_3148 ?auto_3154 ) ) ( not ( = ?auto_3148 ?auto_3152 ) ) ( not ( = ?auto_3148 ?auto_3155 ) ) ( not ( = ?auto_3134 ?auto_3141 ) ) ( not ( = ?auto_3134 ?auto_3143 ) ) ( not ( = ?auto_3135 ?auto_3141 ) ) ( not ( = ?auto_3135 ?auto_3143 ) ) ( not ( = ?auto_3136 ?auto_3141 ) ) ( not ( = ?auto_3136 ?auto_3143 ) ) ( not ( = ?auto_3137 ?auto_3141 ) ) ( not ( = ?auto_3137 ?auto_3143 ) ) ( not ( = ?auto_3138 ?auto_3141 ) ) ( not ( = ?auto_3138 ?auto_3143 ) ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3148 ) ) ( not ( = ?auto_3141 ?auto_3151 ) ) ( not ( = ?auto_3141 ?auto_3156 ) ) ( not ( = ?auto_3141 ?auto_3154 ) ) ( not ( = ?auto_3141 ?auto_3152 ) ) ( not ( = ?auto_3141 ?auto_3155 ) ) ( not ( = ?auto_3143 ?auto_3148 ) ) ( not ( = ?auto_3143 ?auto_3151 ) ) ( not ( = ?auto_3143 ?auto_3156 ) ) ( not ( = ?auto_3143 ?auto_3154 ) ) ( not ( = ?auto_3143 ?auto_3152 ) ) ( not ( = ?auto_3143 ?auto_3155 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3134 ?auto_3135 ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3140 ?auto_3139 )
      ( MAKE-1CRATE ?auto_3139 ?auto_3141 )
      ( MAKE-7CRATE-VERIFY ?auto_3134 ?auto_3135 ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3140 ?auto_3139 ?auto_3141 ) )
  )

)

