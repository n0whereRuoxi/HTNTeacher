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
      ?auto_2978 - PLACE
      ?auto_2979 - HOIST
      ?auto_2982 - SURFACE
      ?auto_2983 - SURFACE
      ?auto_2980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2981 ?auto_2977 ) ( IS-CRATE ?auto_2976 ) ( not ( = ?auto_2978 ?auto_2977 ) ) ( HOIST-AT ?auto_2979 ?auto_2978 ) ( SURFACE-AT ?auto_2976 ?auto_2978 ) ( ON ?auto_2976 ?auto_2982 ) ( CLEAR ?auto_2976 ) ( not ( = ?auto_2975 ?auto_2976 ) ) ( not ( = ?auto_2975 ?auto_2982 ) ) ( not ( = ?auto_2976 ?auto_2982 ) ) ( not ( = ?auto_2981 ?auto_2979 ) ) ( SURFACE-AT ?auto_2974 ?auto_2977 ) ( CLEAR ?auto_2974 ) ( IS-CRATE ?auto_2975 ) ( AVAILABLE ?auto_2981 ) ( AVAILABLE ?auto_2979 ) ( SURFACE-AT ?auto_2975 ?auto_2978 ) ( ON ?auto_2975 ?auto_2983 ) ( CLEAR ?auto_2975 ) ( TRUCK-AT ?auto_2980 ?auto_2977 ) ( not ( = ?auto_2974 ?auto_2975 ) ) ( not ( = ?auto_2974 ?auto_2983 ) ) ( not ( = ?auto_2975 ?auto_2983 ) ) ( not ( = ?auto_2974 ?auto_2976 ) ) ( not ( = ?auto_2974 ?auto_2982 ) ) ( not ( = ?auto_2976 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2974 ?auto_2975 )
      ( MAKE-1CRATE ?auto_2975 ?auto_2976 )
      ( MAKE-2CRATE-VERIFY ?auto_2974 ?auto_2975 ?auto_2976 ) )
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
      ?auto_3006 - HOIST
      ?auto_3003 - PLACE
      ?auto_3005 - PLACE
      ?auto_3002 - HOIST
      ?auto_3004 - SURFACE
      ?auto_3011 - PLACE
      ?auto_3010 - HOIST
      ?auto_3008 - SURFACE
      ?auto_3009 - SURFACE
      ?auto_3007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3006 ?auto_3003 ) ( IS-CRATE ?auto_3001 ) ( not ( = ?auto_3005 ?auto_3003 ) ) ( HOIST-AT ?auto_3002 ?auto_3005 ) ( AVAILABLE ?auto_3002 ) ( SURFACE-AT ?auto_3001 ?auto_3005 ) ( ON ?auto_3001 ?auto_3004 ) ( CLEAR ?auto_3001 ) ( not ( = ?auto_3000 ?auto_3001 ) ) ( not ( = ?auto_3000 ?auto_3004 ) ) ( not ( = ?auto_3001 ?auto_3004 ) ) ( not ( = ?auto_3006 ?auto_3002 ) ) ( IS-CRATE ?auto_3000 ) ( not ( = ?auto_3011 ?auto_3003 ) ) ( HOIST-AT ?auto_3010 ?auto_3011 ) ( SURFACE-AT ?auto_3000 ?auto_3011 ) ( ON ?auto_3000 ?auto_3008 ) ( CLEAR ?auto_3000 ) ( not ( = ?auto_2999 ?auto_3000 ) ) ( not ( = ?auto_2999 ?auto_3008 ) ) ( not ( = ?auto_3000 ?auto_3008 ) ) ( not ( = ?auto_3006 ?auto_3010 ) ) ( SURFACE-AT ?auto_2998 ?auto_3003 ) ( CLEAR ?auto_2998 ) ( IS-CRATE ?auto_2999 ) ( AVAILABLE ?auto_3006 ) ( AVAILABLE ?auto_3010 ) ( SURFACE-AT ?auto_2999 ?auto_3011 ) ( ON ?auto_2999 ?auto_3009 ) ( CLEAR ?auto_2999 ) ( TRUCK-AT ?auto_3007 ?auto_3003 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_3009 ) ) ( not ( = ?auto_2999 ?auto_3009 ) ) ( not ( = ?auto_2998 ?auto_3000 ) ) ( not ( = ?auto_2998 ?auto_3008 ) ) ( not ( = ?auto_3000 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3009 ) ) ( not ( = ?auto_2998 ?auto_3001 ) ) ( not ( = ?auto_2998 ?auto_3004 ) ) ( not ( = ?auto_2999 ?auto_3001 ) ) ( not ( = ?auto_2999 ?auto_3004 ) ) ( not ( = ?auto_3001 ?auto_3008 ) ) ( not ( = ?auto_3001 ?auto_3009 ) ) ( not ( = ?auto_3005 ?auto_3011 ) ) ( not ( = ?auto_3002 ?auto_3010 ) ) ( not ( = ?auto_3004 ?auto_3008 ) ) ( not ( = ?auto_3004 ?auto_3009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2998 ?auto_2999 ?auto_3000 )
      ( MAKE-1CRATE ?auto_3000 ?auto_3001 )
      ( MAKE-3CRATE-VERIFY ?auto_2998 ?auto_2999 ?auto_3000 ?auto_3001 ) )
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
      ?auto_3034 - PLACE
      ?auto_3033 - PLACE
      ?auto_3035 - HOIST
      ?auto_3032 - SURFACE
      ?auto_3038 - SURFACE
      ?auto_3039 - PLACE
      ?auto_3040 - HOIST
      ?auto_3041 - SURFACE
      ?auto_3042 - SURFACE
      ?auto_3037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3036 ?auto_3034 ) ( IS-CRATE ?auto_3031 ) ( not ( = ?auto_3033 ?auto_3034 ) ) ( HOIST-AT ?auto_3035 ?auto_3033 ) ( SURFACE-AT ?auto_3031 ?auto_3033 ) ( ON ?auto_3031 ?auto_3032 ) ( CLEAR ?auto_3031 ) ( not ( = ?auto_3030 ?auto_3031 ) ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3031 ?auto_3032 ) ) ( not ( = ?auto_3036 ?auto_3035 ) ) ( IS-CRATE ?auto_3030 ) ( AVAILABLE ?auto_3035 ) ( SURFACE-AT ?auto_3030 ?auto_3033 ) ( ON ?auto_3030 ?auto_3038 ) ( CLEAR ?auto_3030 ) ( not ( = ?auto_3029 ?auto_3030 ) ) ( not ( = ?auto_3029 ?auto_3038 ) ) ( not ( = ?auto_3030 ?auto_3038 ) ) ( IS-CRATE ?auto_3029 ) ( not ( = ?auto_3039 ?auto_3034 ) ) ( HOIST-AT ?auto_3040 ?auto_3039 ) ( SURFACE-AT ?auto_3029 ?auto_3039 ) ( ON ?auto_3029 ?auto_3041 ) ( CLEAR ?auto_3029 ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3041 ) ) ( not ( = ?auto_3029 ?auto_3041 ) ) ( not ( = ?auto_3036 ?auto_3040 ) ) ( SURFACE-AT ?auto_3027 ?auto_3034 ) ( CLEAR ?auto_3027 ) ( IS-CRATE ?auto_3028 ) ( AVAILABLE ?auto_3036 ) ( AVAILABLE ?auto_3040 ) ( SURFACE-AT ?auto_3028 ?auto_3039 ) ( ON ?auto_3028 ?auto_3042 ) ( CLEAR ?auto_3028 ) ( TRUCK-AT ?auto_3037 ?auto_3034 ) ( not ( = ?auto_3027 ?auto_3028 ) ) ( not ( = ?auto_3027 ?auto_3042 ) ) ( not ( = ?auto_3028 ?auto_3042 ) ) ( not ( = ?auto_3027 ?auto_3029 ) ) ( not ( = ?auto_3027 ?auto_3041 ) ) ( not ( = ?auto_3029 ?auto_3042 ) ) ( not ( = ?auto_3041 ?auto_3042 ) ) ( not ( = ?auto_3027 ?auto_3030 ) ) ( not ( = ?auto_3027 ?auto_3038 ) ) ( not ( = ?auto_3028 ?auto_3030 ) ) ( not ( = ?auto_3028 ?auto_3038 ) ) ( not ( = ?auto_3030 ?auto_3041 ) ) ( not ( = ?auto_3030 ?auto_3042 ) ) ( not ( = ?auto_3033 ?auto_3039 ) ) ( not ( = ?auto_3035 ?auto_3040 ) ) ( not ( = ?auto_3038 ?auto_3041 ) ) ( not ( = ?auto_3038 ?auto_3042 ) ) ( not ( = ?auto_3027 ?auto_3031 ) ) ( not ( = ?auto_3027 ?auto_3032 ) ) ( not ( = ?auto_3028 ?auto_3031 ) ) ( not ( = ?auto_3028 ?auto_3032 ) ) ( not ( = ?auto_3029 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3032 ) ) ( not ( = ?auto_3031 ?auto_3038 ) ) ( not ( = ?auto_3031 ?auto_3041 ) ) ( not ( = ?auto_3031 ?auto_3042 ) ) ( not ( = ?auto_3032 ?auto_3038 ) ) ( not ( = ?auto_3032 ?auto_3041 ) ) ( not ( = ?auto_3032 ?auto_3042 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3027 ?auto_3028 ?auto_3029 ?auto_3030 )
      ( MAKE-1CRATE ?auto_3030 ?auto_3031 )
      ( MAKE-4CRATE-VERIFY ?auto_3027 ?auto_3028 ?auto_3029 ?auto_3030 ?auto_3031 ) )
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
      ?auto_3067 - HOIST
      ?auto_3068 - PLACE
      ?auto_3069 - PLACE
      ?auto_3066 - HOIST
      ?auto_3065 - SURFACE
      ?auto_3075 - PLACE
      ?auto_3074 - HOIST
      ?auto_3072 - SURFACE
      ?auto_3073 - SURFACE
      ?auto_3071 - SURFACE
      ?auto_3076 - SURFACE
      ?auto_3070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3067 ?auto_3068 ) ( IS-CRATE ?auto_3064 ) ( not ( = ?auto_3069 ?auto_3068 ) ) ( HOIST-AT ?auto_3066 ?auto_3069 ) ( SURFACE-AT ?auto_3064 ?auto_3069 ) ( ON ?auto_3064 ?auto_3065 ) ( CLEAR ?auto_3064 ) ( not ( = ?auto_3063 ?auto_3064 ) ) ( not ( = ?auto_3063 ?auto_3065 ) ) ( not ( = ?auto_3064 ?auto_3065 ) ) ( not ( = ?auto_3067 ?auto_3066 ) ) ( IS-CRATE ?auto_3063 ) ( not ( = ?auto_3075 ?auto_3068 ) ) ( HOIST-AT ?auto_3074 ?auto_3075 ) ( SURFACE-AT ?auto_3063 ?auto_3075 ) ( ON ?auto_3063 ?auto_3072 ) ( CLEAR ?auto_3063 ) ( not ( = ?auto_3062 ?auto_3063 ) ) ( not ( = ?auto_3062 ?auto_3072 ) ) ( not ( = ?auto_3063 ?auto_3072 ) ) ( not ( = ?auto_3067 ?auto_3074 ) ) ( IS-CRATE ?auto_3062 ) ( AVAILABLE ?auto_3074 ) ( SURFACE-AT ?auto_3062 ?auto_3075 ) ( ON ?auto_3062 ?auto_3073 ) ( CLEAR ?auto_3062 ) ( not ( = ?auto_3061 ?auto_3062 ) ) ( not ( = ?auto_3061 ?auto_3073 ) ) ( not ( = ?auto_3062 ?auto_3073 ) ) ( IS-CRATE ?auto_3061 ) ( SURFACE-AT ?auto_3061 ?auto_3069 ) ( ON ?auto_3061 ?auto_3071 ) ( CLEAR ?auto_3061 ) ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3060 ?auto_3071 ) ) ( not ( = ?auto_3061 ?auto_3071 ) ) ( SURFACE-AT ?auto_3059 ?auto_3068 ) ( CLEAR ?auto_3059 ) ( IS-CRATE ?auto_3060 ) ( AVAILABLE ?auto_3067 ) ( AVAILABLE ?auto_3066 ) ( SURFACE-AT ?auto_3060 ?auto_3069 ) ( ON ?auto_3060 ?auto_3076 ) ( CLEAR ?auto_3060 ) ( TRUCK-AT ?auto_3070 ?auto_3068 ) ( not ( = ?auto_3059 ?auto_3060 ) ) ( not ( = ?auto_3059 ?auto_3076 ) ) ( not ( = ?auto_3060 ?auto_3076 ) ) ( not ( = ?auto_3059 ?auto_3061 ) ) ( not ( = ?auto_3059 ?auto_3071 ) ) ( not ( = ?auto_3061 ?auto_3076 ) ) ( not ( = ?auto_3071 ?auto_3076 ) ) ( not ( = ?auto_3059 ?auto_3062 ) ) ( not ( = ?auto_3059 ?auto_3073 ) ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3073 ) ) ( not ( = ?auto_3062 ?auto_3071 ) ) ( not ( = ?auto_3062 ?auto_3076 ) ) ( not ( = ?auto_3075 ?auto_3069 ) ) ( not ( = ?auto_3074 ?auto_3066 ) ) ( not ( = ?auto_3073 ?auto_3071 ) ) ( not ( = ?auto_3073 ?auto_3076 ) ) ( not ( = ?auto_3059 ?auto_3063 ) ) ( not ( = ?auto_3059 ?auto_3072 ) ) ( not ( = ?auto_3060 ?auto_3063 ) ) ( not ( = ?auto_3060 ?auto_3072 ) ) ( not ( = ?auto_3061 ?auto_3063 ) ) ( not ( = ?auto_3061 ?auto_3072 ) ) ( not ( = ?auto_3063 ?auto_3073 ) ) ( not ( = ?auto_3063 ?auto_3071 ) ) ( not ( = ?auto_3063 ?auto_3076 ) ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3071 ) ) ( not ( = ?auto_3072 ?auto_3076 ) ) ( not ( = ?auto_3059 ?auto_3064 ) ) ( not ( = ?auto_3059 ?auto_3065 ) ) ( not ( = ?auto_3060 ?auto_3064 ) ) ( not ( = ?auto_3060 ?auto_3065 ) ) ( not ( = ?auto_3061 ?auto_3064 ) ) ( not ( = ?auto_3061 ?auto_3065 ) ) ( not ( = ?auto_3062 ?auto_3064 ) ) ( not ( = ?auto_3062 ?auto_3065 ) ) ( not ( = ?auto_3064 ?auto_3072 ) ) ( not ( = ?auto_3064 ?auto_3073 ) ) ( not ( = ?auto_3064 ?auto_3071 ) ) ( not ( = ?auto_3064 ?auto_3076 ) ) ( not ( = ?auto_3065 ?auto_3072 ) ) ( not ( = ?auto_3065 ?auto_3073 ) ) ( not ( = ?auto_3065 ?auto_3071 ) ) ( not ( = ?auto_3065 ?auto_3076 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3059 ?auto_3060 ?auto_3061 ?auto_3062 ?auto_3063 )
      ( MAKE-1CRATE ?auto_3063 ?auto_3064 )
      ( MAKE-5CRATE-VERIFY ?auto_3059 ?auto_3060 ?auto_3061 ?auto_3062 ?auto_3063 ?auto_3064 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3094 - SURFACE
      ?auto_3095 - SURFACE
      ?auto_3096 - SURFACE
      ?auto_3097 - SURFACE
      ?auto_3098 - SURFACE
      ?auto_3099 - SURFACE
      ?auto_3100 - SURFACE
    )
    :vars
    (
      ?auto_3103 - HOIST
      ?auto_3104 - PLACE
      ?auto_3106 - PLACE
      ?auto_3105 - HOIST
      ?auto_3101 - SURFACE
      ?auto_3115 - PLACE
      ?auto_3107 - HOIST
      ?auto_3113 - SURFACE
      ?auto_3114 - PLACE
      ?auto_3110 - HOIST
      ?auto_3108 - SURFACE
      ?auto_3111 - SURFACE
      ?auto_3109 - SURFACE
      ?auto_3112 - SURFACE
      ?auto_3102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3103 ?auto_3104 ) ( IS-CRATE ?auto_3100 ) ( not ( = ?auto_3106 ?auto_3104 ) ) ( HOIST-AT ?auto_3105 ?auto_3106 ) ( AVAILABLE ?auto_3105 ) ( SURFACE-AT ?auto_3100 ?auto_3106 ) ( ON ?auto_3100 ?auto_3101 ) ( CLEAR ?auto_3100 ) ( not ( = ?auto_3099 ?auto_3100 ) ) ( not ( = ?auto_3099 ?auto_3101 ) ) ( not ( = ?auto_3100 ?auto_3101 ) ) ( not ( = ?auto_3103 ?auto_3105 ) ) ( IS-CRATE ?auto_3099 ) ( not ( = ?auto_3115 ?auto_3104 ) ) ( HOIST-AT ?auto_3107 ?auto_3115 ) ( SURFACE-AT ?auto_3099 ?auto_3115 ) ( ON ?auto_3099 ?auto_3113 ) ( CLEAR ?auto_3099 ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( not ( = ?auto_3098 ?auto_3113 ) ) ( not ( = ?auto_3099 ?auto_3113 ) ) ( not ( = ?auto_3103 ?auto_3107 ) ) ( IS-CRATE ?auto_3098 ) ( not ( = ?auto_3114 ?auto_3104 ) ) ( HOIST-AT ?auto_3110 ?auto_3114 ) ( SURFACE-AT ?auto_3098 ?auto_3114 ) ( ON ?auto_3098 ?auto_3108 ) ( CLEAR ?auto_3098 ) ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3097 ?auto_3108 ) ) ( not ( = ?auto_3098 ?auto_3108 ) ) ( not ( = ?auto_3103 ?auto_3110 ) ) ( IS-CRATE ?auto_3097 ) ( AVAILABLE ?auto_3110 ) ( SURFACE-AT ?auto_3097 ?auto_3114 ) ( ON ?auto_3097 ?auto_3111 ) ( CLEAR ?auto_3097 ) ( not ( = ?auto_3096 ?auto_3097 ) ) ( not ( = ?auto_3096 ?auto_3111 ) ) ( not ( = ?auto_3097 ?auto_3111 ) ) ( IS-CRATE ?auto_3096 ) ( SURFACE-AT ?auto_3096 ?auto_3115 ) ( ON ?auto_3096 ?auto_3109 ) ( CLEAR ?auto_3096 ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3109 ) ) ( not ( = ?auto_3096 ?auto_3109 ) ) ( SURFACE-AT ?auto_3094 ?auto_3104 ) ( CLEAR ?auto_3094 ) ( IS-CRATE ?auto_3095 ) ( AVAILABLE ?auto_3103 ) ( AVAILABLE ?auto_3107 ) ( SURFACE-AT ?auto_3095 ?auto_3115 ) ( ON ?auto_3095 ?auto_3112 ) ( CLEAR ?auto_3095 ) ( TRUCK-AT ?auto_3102 ?auto_3104 ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3112 ) ) ( not ( = ?auto_3095 ?auto_3112 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3094 ?auto_3109 ) ) ( not ( = ?auto_3096 ?auto_3112 ) ) ( not ( = ?auto_3109 ?auto_3112 ) ) ( not ( = ?auto_3094 ?auto_3097 ) ) ( not ( = ?auto_3094 ?auto_3111 ) ) ( not ( = ?auto_3095 ?auto_3097 ) ) ( not ( = ?auto_3095 ?auto_3111 ) ) ( not ( = ?auto_3097 ?auto_3109 ) ) ( not ( = ?auto_3097 ?auto_3112 ) ) ( not ( = ?auto_3114 ?auto_3115 ) ) ( not ( = ?auto_3110 ?auto_3107 ) ) ( not ( = ?auto_3111 ?auto_3109 ) ) ( not ( = ?auto_3111 ?auto_3112 ) ) ( not ( = ?auto_3094 ?auto_3098 ) ) ( not ( = ?auto_3094 ?auto_3108 ) ) ( not ( = ?auto_3095 ?auto_3098 ) ) ( not ( = ?auto_3095 ?auto_3108 ) ) ( not ( = ?auto_3096 ?auto_3098 ) ) ( not ( = ?auto_3096 ?auto_3108 ) ) ( not ( = ?auto_3098 ?auto_3111 ) ) ( not ( = ?auto_3098 ?auto_3109 ) ) ( not ( = ?auto_3098 ?auto_3112 ) ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3108 ?auto_3109 ) ) ( not ( = ?auto_3108 ?auto_3112 ) ) ( not ( = ?auto_3094 ?auto_3099 ) ) ( not ( = ?auto_3094 ?auto_3113 ) ) ( not ( = ?auto_3095 ?auto_3099 ) ) ( not ( = ?auto_3095 ?auto_3113 ) ) ( not ( = ?auto_3096 ?auto_3099 ) ) ( not ( = ?auto_3096 ?auto_3113 ) ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( not ( = ?auto_3097 ?auto_3113 ) ) ( not ( = ?auto_3099 ?auto_3108 ) ) ( not ( = ?auto_3099 ?auto_3111 ) ) ( not ( = ?auto_3099 ?auto_3109 ) ) ( not ( = ?auto_3099 ?auto_3112 ) ) ( not ( = ?auto_3113 ?auto_3108 ) ) ( not ( = ?auto_3113 ?auto_3111 ) ) ( not ( = ?auto_3113 ?auto_3109 ) ) ( not ( = ?auto_3113 ?auto_3112 ) ) ( not ( = ?auto_3094 ?auto_3100 ) ) ( not ( = ?auto_3094 ?auto_3101 ) ) ( not ( = ?auto_3095 ?auto_3100 ) ) ( not ( = ?auto_3095 ?auto_3101 ) ) ( not ( = ?auto_3096 ?auto_3100 ) ) ( not ( = ?auto_3096 ?auto_3101 ) ) ( not ( = ?auto_3097 ?auto_3100 ) ) ( not ( = ?auto_3097 ?auto_3101 ) ) ( not ( = ?auto_3098 ?auto_3100 ) ) ( not ( = ?auto_3098 ?auto_3101 ) ) ( not ( = ?auto_3100 ?auto_3113 ) ) ( not ( = ?auto_3100 ?auto_3108 ) ) ( not ( = ?auto_3100 ?auto_3111 ) ) ( not ( = ?auto_3100 ?auto_3109 ) ) ( not ( = ?auto_3100 ?auto_3112 ) ) ( not ( = ?auto_3106 ?auto_3115 ) ) ( not ( = ?auto_3106 ?auto_3114 ) ) ( not ( = ?auto_3105 ?auto_3107 ) ) ( not ( = ?auto_3105 ?auto_3110 ) ) ( not ( = ?auto_3101 ?auto_3113 ) ) ( not ( = ?auto_3101 ?auto_3108 ) ) ( not ( = ?auto_3101 ?auto_3111 ) ) ( not ( = ?auto_3101 ?auto_3109 ) ) ( not ( = ?auto_3101 ?auto_3112 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3099 )
      ( MAKE-1CRATE ?auto_3099 ?auto_3100 )
      ( MAKE-6CRATE-VERIFY ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3099 ?auto_3100 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3134 - SURFACE
      ?auto_3135 - SURFACE
      ?auto_3136 - SURFACE
      ?auto_3137 - SURFACE
      ?auto_3138 - SURFACE
      ?auto_3139 - SURFACE
      ?auto_3140 - SURFACE
      ?auto_3141 - SURFACE
    )
    :vars
    (
      ?auto_3142 - HOIST
      ?auto_3146 - PLACE
      ?auto_3147 - PLACE
      ?auto_3145 - HOIST
      ?auto_3144 - SURFACE
      ?auto_3152 - PLACE
      ?auto_3157 - HOIST
      ?auto_3154 - SURFACE
      ?auto_3150 - PLACE
      ?auto_3149 - HOIST
      ?auto_3148 - SURFACE
      ?auto_3155 - SURFACE
      ?auto_3151 - SURFACE
      ?auto_3153 - SURFACE
      ?auto_3156 - SURFACE
      ?auto_3143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3142 ?auto_3146 ) ( IS-CRATE ?auto_3141 ) ( not ( = ?auto_3147 ?auto_3146 ) ) ( HOIST-AT ?auto_3145 ?auto_3147 ) ( SURFACE-AT ?auto_3141 ?auto_3147 ) ( ON ?auto_3141 ?auto_3144 ) ( CLEAR ?auto_3141 ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3144 ) ) ( not ( = ?auto_3141 ?auto_3144 ) ) ( not ( = ?auto_3142 ?auto_3145 ) ) ( IS-CRATE ?auto_3140 ) ( not ( = ?auto_3152 ?auto_3146 ) ) ( HOIST-AT ?auto_3157 ?auto_3152 ) ( AVAILABLE ?auto_3157 ) ( SURFACE-AT ?auto_3140 ?auto_3152 ) ( ON ?auto_3140 ?auto_3154 ) ( CLEAR ?auto_3140 ) ( not ( = ?auto_3139 ?auto_3140 ) ) ( not ( = ?auto_3139 ?auto_3154 ) ) ( not ( = ?auto_3140 ?auto_3154 ) ) ( not ( = ?auto_3142 ?auto_3157 ) ) ( IS-CRATE ?auto_3139 ) ( not ( = ?auto_3150 ?auto_3146 ) ) ( HOIST-AT ?auto_3149 ?auto_3150 ) ( SURFACE-AT ?auto_3139 ?auto_3150 ) ( ON ?auto_3139 ?auto_3148 ) ( CLEAR ?auto_3139 ) ( not ( = ?auto_3138 ?auto_3139 ) ) ( not ( = ?auto_3138 ?auto_3148 ) ) ( not ( = ?auto_3139 ?auto_3148 ) ) ( not ( = ?auto_3142 ?auto_3149 ) ) ( IS-CRATE ?auto_3138 ) ( SURFACE-AT ?auto_3138 ?auto_3147 ) ( ON ?auto_3138 ?auto_3155 ) ( CLEAR ?auto_3138 ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3137 ?auto_3155 ) ) ( not ( = ?auto_3138 ?auto_3155 ) ) ( IS-CRATE ?auto_3137 ) ( AVAILABLE ?auto_3145 ) ( SURFACE-AT ?auto_3137 ?auto_3147 ) ( ON ?auto_3137 ?auto_3151 ) ( CLEAR ?auto_3137 ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( not ( = ?auto_3136 ?auto_3151 ) ) ( not ( = ?auto_3137 ?auto_3151 ) ) ( IS-CRATE ?auto_3136 ) ( SURFACE-AT ?auto_3136 ?auto_3150 ) ( ON ?auto_3136 ?auto_3153 ) ( CLEAR ?auto_3136 ) ( not ( = ?auto_3135 ?auto_3136 ) ) ( not ( = ?auto_3135 ?auto_3153 ) ) ( not ( = ?auto_3136 ?auto_3153 ) ) ( SURFACE-AT ?auto_3134 ?auto_3146 ) ( CLEAR ?auto_3134 ) ( IS-CRATE ?auto_3135 ) ( AVAILABLE ?auto_3142 ) ( AVAILABLE ?auto_3149 ) ( SURFACE-AT ?auto_3135 ?auto_3150 ) ( ON ?auto_3135 ?auto_3156 ) ( CLEAR ?auto_3135 ) ( TRUCK-AT ?auto_3143 ?auto_3146 ) ( not ( = ?auto_3134 ?auto_3135 ) ) ( not ( = ?auto_3134 ?auto_3156 ) ) ( not ( = ?auto_3135 ?auto_3156 ) ) ( not ( = ?auto_3134 ?auto_3136 ) ) ( not ( = ?auto_3134 ?auto_3153 ) ) ( not ( = ?auto_3136 ?auto_3156 ) ) ( not ( = ?auto_3153 ?auto_3156 ) ) ( not ( = ?auto_3134 ?auto_3137 ) ) ( not ( = ?auto_3134 ?auto_3151 ) ) ( not ( = ?auto_3135 ?auto_3137 ) ) ( not ( = ?auto_3135 ?auto_3151 ) ) ( not ( = ?auto_3137 ?auto_3153 ) ) ( not ( = ?auto_3137 ?auto_3156 ) ) ( not ( = ?auto_3147 ?auto_3150 ) ) ( not ( = ?auto_3145 ?auto_3149 ) ) ( not ( = ?auto_3151 ?auto_3153 ) ) ( not ( = ?auto_3151 ?auto_3156 ) ) ( not ( = ?auto_3134 ?auto_3138 ) ) ( not ( = ?auto_3134 ?auto_3155 ) ) ( not ( = ?auto_3135 ?auto_3138 ) ) ( not ( = ?auto_3135 ?auto_3155 ) ) ( not ( = ?auto_3136 ?auto_3138 ) ) ( not ( = ?auto_3136 ?auto_3155 ) ) ( not ( = ?auto_3138 ?auto_3151 ) ) ( not ( = ?auto_3138 ?auto_3153 ) ) ( not ( = ?auto_3138 ?auto_3156 ) ) ( not ( = ?auto_3155 ?auto_3151 ) ) ( not ( = ?auto_3155 ?auto_3153 ) ) ( not ( = ?auto_3155 ?auto_3156 ) ) ( not ( = ?auto_3134 ?auto_3139 ) ) ( not ( = ?auto_3134 ?auto_3148 ) ) ( not ( = ?auto_3135 ?auto_3139 ) ) ( not ( = ?auto_3135 ?auto_3148 ) ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3136 ?auto_3148 ) ) ( not ( = ?auto_3137 ?auto_3139 ) ) ( not ( = ?auto_3137 ?auto_3148 ) ) ( not ( = ?auto_3139 ?auto_3155 ) ) ( not ( = ?auto_3139 ?auto_3151 ) ) ( not ( = ?auto_3139 ?auto_3153 ) ) ( not ( = ?auto_3139 ?auto_3156 ) ) ( not ( = ?auto_3148 ?auto_3155 ) ) ( not ( = ?auto_3148 ?auto_3151 ) ) ( not ( = ?auto_3148 ?auto_3153 ) ) ( not ( = ?auto_3148 ?auto_3156 ) ) ( not ( = ?auto_3134 ?auto_3140 ) ) ( not ( = ?auto_3134 ?auto_3154 ) ) ( not ( = ?auto_3135 ?auto_3140 ) ) ( not ( = ?auto_3135 ?auto_3154 ) ) ( not ( = ?auto_3136 ?auto_3140 ) ) ( not ( = ?auto_3136 ?auto_3154 ) ) ( not ( = ?auto_3137 ?auto_3140 ) ) ( not ( = ?auto_3137 ?auto_3154 ) ) ( not ( = ?auto_3138 ?auto_3140 ) ) ( not ( = ?auto_3138 ?auto_3154 ) ) ( not ( = ?auto_3140 ?auto_3148 ) ) ( not ( = ?auto_3140 ?auto_3155 ) ) ( not ( = ?auto_3140 ?auto_3151 ) ) ( not ( = ?auto_3140 ?auto_3153 ) ) ( not ( = ?auto_3140 ?auto_3156 ) ) ( not ( = ?auto_3152 ?auto_3150 ) ) ( not ( = ?auto_3152 ?auto_3147 ) ) ( not ( = ?auto_3157 ?auto_3149 ) ) ( not ( = ?auto_3157 ?auto_3145 ) ) ( not ( = ?auto_3154 ?auto_3148 ) ) ( not ( = ?auto_3154 ?auto_3155 ) ) ( not ( = ?auto_3154 ?auto_3151 ) ) ( not ( = ?auto_3154 ?auto_3153 ) ) ( not ( = ?auto_3154 ?auto_3156 ) ) ( not ( = ?auto_3134 ?auto_3141 ) ) ( not ( = ?auto_3134 ?auto_3144 ) ) ( not ( = ?auto_3135 ?auto_3141 ) ) ( not ( = ?auto_3135 ?auto_3144 ) ) ( not ( = ?auto_3136 ?auto_3141 ) ) ( not ( = ?auto_3136 ?auto_3144 ) ) ( not ( = ?auto_3137 ?auto_3141 ) ) ( not ( = ?auto_3137 ?auto_3144 ) ) ( not ( = ?auto_3138 ?auto_3141 ) ) ( not ( = ?auto_3138 ?auto_3144 ) ) ( not ( = ?auto_3139 ?auto_3141 ) ) ( not ( = ?auto_3139 ?auto_3144 ) ) ( not ( = ?auto_3141 ?auto_3154 ) ) ( not ( = ?auto_3141 ?auto_3148 ) ) ( not ( = ?auto_3141 ?auto_3155 ) ) ( not ( = ?auto_3141 ?auto_3151 ) ) ( not ( = ?auto_3141 ?auto_3153 ) ) ( not ( = ?auto_3141 ?auto_3156 ) ) ( not ( = ?auto_3144 ?auto_3154 ) ) ( not ( = ?auto_3144 ?auto_3148 ) ) ( not ( = ?auto_3144 ?auto_3155 ) ) ( not ( = ?auto_3144 ?auto_3151 ) ) ( not ( = ?auto_3144 ?auto_3153 ) ) ( not ( = ?auto_3144 ?auto_3156 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3134 ?auto_3135 ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3139 ?auto_3140 )
      ( MAKE-1CRATE ?auto_3140 ?auto_3141 )
      ( MAKE-7CRATE-VERIFY ?auto_3134 ?auto_3135 ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3139 ?auto_3140 ?auto_3141 ) )
  )

)

