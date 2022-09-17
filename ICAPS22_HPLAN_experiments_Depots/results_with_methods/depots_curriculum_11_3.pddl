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
      ?auto_3032 - SURFACE
      ?auto_3033 - SURFACE
    )
    :vars
    (
      ?auto_3034 - HOIST
      ?auto_3035 - PLACE
      ?auto_3037 - PLACE
      ?auto_3038 - HOIST
      ?auto_3039 - SURFACE
      ?auto_3036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3034 ?auto_3035 ) ( SURFACE-AT ?auto_3033 ?auto_3035 ) ( CLEAR ?auto_3033 ) ( IS-CRATE ?auto_3032 ) ( AVAILABLE ?auto_3034 ) ( not ( = ?auto_3037 ?auto_3035 ) ) ( HOIST-AT ?auto_3038 ?auto_3037 ) ( AVAILABLE ?auto_3038 ) ( SURFACE-AT ?auto_3032 ?auto_3037 ) ( ON ?auto_3032 ?auto_3039 ) ( CLEAR ?auto_3032 ) ( TRUCK-AT ?auto_3036 ?auto_3035 ) ( not ( = ?auto_3032 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3039 ) ) ( not ( = ?auto_3033 ?auto_3039 ) ) ( not ( = ?auto_3034 ?auto_3038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3036 ?auto_3035 ?auto_3037 )
      ( !LIFT ?auto_3038 ?auto_3032 ?auto_3039 ?auto_3037 )
      ( !LOAD ?auto_3038 ?auto_3032 ?auto_3036 ?auto_3037 )
      ( !DRIVE ?auto_3036 ?auto_3037 ?auto_3035 )
      ( !UNLOAD ?auto_3034 ?auto_3032 ?auto_3036 ?auto_3035 )
      ( !DROP ?auto_3034 ?auto_3032 ?auto_3033 ?auto_3035 )
      ( MAKE-ON-VERIFY ?auto_3032 ?auto_3033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3042 - SURFACE
      ?auto_3043 - SURFACE
    )
    :vars
    (
      ?auto_3044 - HOIST
      ?auto_3045 - PLACE
      ?auto_3047 - PLACE
      ?auto_3048 - HOIST
      ?auto_3049 - SURFACE
      ?auto_3046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3044 ?auto_3045 ) ( SURFACE-AT ?auto_3043 ?auto_3045 ) ( CLEAR ?auto_3043 ) ( IS-CRATE ?auto_3042 ) ( AVAILABLE ?auto_3044 ) ( not ( = ?auto_3047 ?auto_3045 ) ) ( HOIST-AT ?auto_3048 ?auto_3047 ) ( AVAILABLE ?auto_3048 ) ( SURFACE-AT ?auto_3042 ?auto_3047 ) ( ON ?auto_3042 ?auto_3049 ) ( CLEAR ?auto_3042 ) ( TRUCK-AT ?auto_3046 ?auto_3045 ) ( not ( = ?auto_3042 ?auto_3043 ) ) ( not ( = ?auto_3042 ?auto_3049 ) ) ( not ( = ?auto_3043 ?auto_3049 ) ) ( not ( = ?auto_3044 ?auto_3048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3046 ?auto_3045 ?auto_3047 )
      ( !LIFT ?auto_3048 ?auto_3042 ?auto_3049 ?auto_3047 )
      ( !LOAD ?auto_3048 ?auto_3042 ?auto_3046 ?auto_3047 )
      ( !DRIVE ?auto_3046 ?auto_3047 ?auto_3045 )
      ( !UNLOAD ?auto_3044 ?auto_3042 ?auto_3046 ?auto_3045 )
      ( !DROP ?auto_3044 ?auto_3042 ?auto_3043 ?auto_3045 )
      ( MAKE-ON-VERIFY ?auto_3042 ?auto_3043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3052 - SURFACE
      ?auto_3053 - SURFACE
    )
    :vars
    (
      ?auto_3054 - HOIST
      ?auto_3055 - PLACE
      ?auto_3057 - PLACE
      ?auto_3058 - HOIST
      ?auto_3059 - SURFACE
      ?auto_3056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3054 ?auto_3055 ) ( SURFACE-AT ?auto_3053 ?auto_3055 ) ( CLEAR ?auto_3053 ) ( IS-CRATE ?auto_3052 ) ( AVAILABLE ?auto_3054 ) ( not ( = ?auto_3057 ?auto_3055 ) ) ( HOIST-AT ?auto_3058 ?auto_3057 ) ( AVAILABLE ?auto_3058 ) ( SURFACE-AT ?auto_3052 ?auto_3057 ) ( ON ?auto_3052 ?auto_3059 ) ( CLEAR ?auto_3052 ) ( TRUCK-AT ?auto_3056 ?auto_3055 ) ( not ( = ?auto_3052 ?auto_3053 ) ) ( not ( = ?auto_3052 ?auto_3059 ) ) ( not ( = ?auto_3053 ?auto_3059 ) ) ( not ( = ?auto_3054 ?auto_3058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3056 ?auto_3055 ?auto_3057 )
      ( !LIFT ?auto_3058 ?auto_3052 ?auto_3059 ?auto_3057 )
      ( !LOAD ?auto_3058 ?auto_3052 ?auto_3056 ?auto_3057 )
      ( !DRIVE ?auto_3056 ?auto_3057 ?auto_3055 )
      ( !UNLOAD ?auto_3054 ?auto_3052 ?auto_3056 ?auto_3055 )
      ( !DROP ?auto_3054 ?auto_3052 ?auto_3053 ?auto_3055 )
      ( MAKE-ON-VERIFY ?auto_3052 ?auto_3053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3062 - SURFACE
      ?auto_3063 - SURFACE
    )
    :vars
    (
      ?auto_3064 - HOIST
      ?auto_3065 - PLACE
      ?auto_3067 - PLACE
      ?auto_3068 - HOIST
      ?auto_3069 - SURFACE
      ?auto_3066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3064 ?auto_3065 ) ( SURFACE-AT ?auto_3063 ?auto_3065 ) ( CLEAR ?auto_3063 ) ( IS-CRATE ?auto_3062 ) ( AVAILABLE ?auto_3064 ) ( not ( = ?auto_3067 ?auto_3065 ) ) ( HOIST-AT ?auto_3068 ?auto_3067 ) ( AVAILABLE ?auto_3068 ) ( SURFACE-AT ?auto_3062 ?auto_3067 ) ( ON ?auto_3062 ?auto_3069 ) ( CLEAR ?auto_3062 ) ( TRUCK-AT ?auto_3066 ?auto_3065 ) ( not ( = ?auto_3062 ?auto_3063 ) ) ( not ( = ?auto_3062 ?auto_3069 ) ) ( not ( = ?auto_3063 ?auto_3069 ) ) ( not ( = ?auto_3064 ?auto_3068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3066 ?auto_3065 ?auto_3067 )
      ( !LIFT ?auto_3068 ?auto_3062 ?auto_3069 ?auto_3067 )
      ( !LOAD ?auto_3068 ?auto_3062 ?auto_3066 ?auto_3067 )
      ( !DRIVE ?auto_3066 ?auto_3067 ?auto_3065 )
      ( !UNLOAD ?auto_3064 ?auto_3062 ?auto_3066 ?auto_3065 )
      ( !DROP ?auto_3064 ?auto_3062 ?auto_3063 ?auto_3065 )
      ( MAKE-ON-VERIFY ?auto_3062 ?auto_3063 ) )
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
      ?auto_3075 - PLACE
      ?auto_3077 - PLACE
      ?auto_3078 - HOIST
      ?auto_3079 - SURFACE
      ?auto_3076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3074 ?auto_3075 ) ( SURFACE-AT ?auto_3073 ?auto_3075 ) ( CLEAR ?auto_3073 ) ( IS-CRATE ?auto_3072 ) ( AVAILABLE ?auto_3074 ) ( not ( = ?auto_3077 ?auto_3075 ) ) ( HOIST-AT ?auto_3078 ?auto_3077 ) ( AVAILABLE ?auto_3078 ) ( SURFACE-AT ?auto_3072 ?auto_3077 ) ( ON ?auto_3072 ?auto_3079 ) ( CLEAR ?auto_3072 ) ( TRUCK-AT ?auto_3076 ?auto_3075 ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3079 ) ) ( not ( = ?auto_3073 ?auto_3079 ) ) ( not ( = ?auto_3074 ?auto_3078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3076 ?auto_3075 ?auto_3077 )
      ( !LIFT ?auto_3078 ?auto_3072 ?auto_3079 ?auto_3077 )
      ( !LOAD ?auto_3078 ?auto_3072 ?auto_3076 ?auto_3077 )
      ( !DRIVE ?auto_3076 ?auto_3077 ?auto_3075 )
      ( !UNLOAD ?auto_3074 ?auto_3072 ?auto_3076 ?auto_3075 )
      ( !DROP ?auto_3074 ?auto_3072 ?auto_3073 ?auto_3075 )
      ( MAKE-ON-VERIFY ?auto_3072 ?auto_3073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3082 - SURFACE
      ?auto_3083 - SURFACE
    )
    :vars
    (
      ?auto_3084 - HOIST
      ?auto_3085 - PLACE
      ?auto_3087 - PLACE
      ?auto_3088 - HOIST
      ?auto_3089 - SURFACE
      ?auto_3086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3084 ?auto_3085 ) ( SURFACE-AT ?auto_3083 ?auto_3085 ) ( CLEAR ?auto_3083 ) ( IS-CRATE ?auto_3082 ) ( AVAILABLE ?auto_3084 ) ( not ( = ?auto_3087 ?auto_3085 ) ) ( HOIST-AT ?auto_3088 ?auto_3087 ) ( AVAILABLE ?auto_3088 ) ( SURFACE-AT ?auto_3082 ?auto_3087 ) ( ON ?auto_3082 ?auto_3089 ) ( CLEAR ?auto_3082 ) ( TRUCK-AT ?auto_3086 ?auto_3085 ) ( not ( = ?auto_3082 ?auto_3083 ) ) ( not ( = ?auto_3082 ?auto_3089 ) ) ( not ( = ?auto_3083 ?auto_3089 ) ) ( not ( = ?auto_3084 ?auto_3088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3086 ?auto_3085 ?auto_3087 )
      ( !LIFT ?auto_3088 ?auto_3082 ?auto_3089 ?auto_3087 )
      ( !LOAD ?auto_3088 ?auto_3082 ?auto_3086 ?auto_3087 )
      ( !DRIVE ?auto_3086 ?auto_3087 ?auto_3085 )
      ( !UNLOAD ?auto_3084 ?auto_3082 ?auto_3086 ?auto_3085 )
      ( !DROP ?auto_3084 ?auto_3082 ?auto_3083 ?auto_3085 )
      ( MAKE-ON-VERIFY ?auto_3082 ?auto_3083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3092 - SURFACE
      ?auto_3093 - SURFACE
    )
    :vars
    (
      ?auto_3094 - HOIST
      ?auto_3095 - PLACE
      ?auto_3097 - PLACE
      ?auto_3098 - HOIST
      ?auto_3099 - SURFACE
      ?auto_3096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3094 ?auto_3095 ) ( SURFACE-AT ?auto_3093 ?auto_3095 ) ( CLEAR ?auto_3093 ) ( IS-CRATE ?auto_3092 ) ( AVAILABLE ?auto_3094 ) ( not ( = ?auto_3097 ?auto_3095 ) ) ( HOIST-AT ?auto_3098 ?auto_3097 ) ( AVAILABLE ?auto_3098 ) ( SURFACE-AT ?auto_3092 ?auto_3097 ) ( ON ?auto_3092 ?auto_3099 ) ( CLEAR ?auto_3092 ) ( TRUCK-AT ?auto_3096 ?auto_3095 ) ( not ( = ?auto_3092 ?auto_3093 ) ) ( not ( = ?auto_3092 ?auto_3099 ) ) ( not ( = ?auto_3093 ?auto_3099 ) ) ( not ( = ?auto_3094 ?auto_3098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3096 ?auto_3095 ?auto_3097 )
      ( !LIFT ?auto_3098 ?auto_3092 ?auto_3099 ?auto_3097 )
      ( !LOAD ?auto_3098 ?auto_3092 ?auto_3096 ?auto_3097 )
      ( !DRIVE ?auto_3096 ?auto_3097 ?auto_3095 )
      ( !UNLOAD ?auto_3094 ?auto_3092 ?auto_3096 ?auto_3095 )
      ( !DROP ?auto_3094 ?auto_3092 ?auto_3093 ?auto_3095 )
      ( MAKE-ON-VERIFY ?auto_3092 ?auto_3093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3102 - SURFACE
      ?auto_3103 - SURFACE
    )
    :vars
    (
      ?auto_3104 - HOIST
      ?auto_3105 - PLACE
      ?auto_3107 - PLACE
      ?auto_3108 - HOIST
      ?auto_3109 - SURFACE
      ?auto_3106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3104 ?auto_3105 ) ( SURFACE-AT ?auto_3103 ?auto_3105 ) ( CLEAR ?auto_3103 ) ( IS-CRATE ?auto_3102 ) ( AVAILABLE ?auto_3104 ) ( not ( = ?auto_3107 ?auto_3105 ) ) ( HOIST-AT ?auto_3108 ?auto_3107 ) ( AVAILABLE ?auto_3108 ) ( SURFACE-AT ?auto_3102 ?auto_3107 ) ( ON ?auto_3102 ?auto_3109 ) ( CLEAR ?auto_3102 ) ( TRUCK-AT ?auto_3106 ?auto_3105 ) ( not ( = ?auto_3102 ?auto_3103 ) ) ( not ( = ?auto_3102 ?auto_3109 ) ) ( not ( = ?auto_3103 ?auto_3109 ) ) ( not ( = ?auto_3104 ?auto_3108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3106 ?auto_3105 ?auto_3107 )
      ( !LIFT ?auto_3108 ?auto_3102 ?auto_3109 ?auto_3107 )
      ( !LOAD ?auto_3108 ?auto_3102 ?auto_3106 ?auto_3107 )
      ( !DRIVE ?auto_3106 ?auto_3107 ?auto_3105 )
      ( !UNLOAD ?auto_3104 ?auto_3102 ?auto_3106 ?auto_3105 )
      ( !DROP ?auto_3104 ?auto_3102 ?auto_3103 ?auto_3105 )
      ( MAKE-ON-VERIFY ?auto_3102 ?auto_3103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3112 - SURFACE
      ?auto_3113 - SURFACE
    )
    :vars
    (
      ?auto_3114 - HOIST
      ?auto_3115 - PLACE
      ?auto_3117 - PLACE
      ?auto_3118 - HOIST
      ?auto_3119 - SURFACE
      ?auto_3116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3114 ?auto_3115 ) ( SURFACE-AT ?auto_3113 ?auto_3115 ) ( CLEAR ?auto_3113 ) ( IS-CRATE ?auto_3112 ) ( AVAILABLE ?auto_3114 ) ( not ( = ?auto_3117 ?auto_3115 ) ) ( HOIST-AT ?auto_3118 ?auto_3117 ) ( AVAILABLE ?auto_3118 ) ( SURFACE-AT ?auto_3112 ?auto_3117 ) ( ON ?auto_3112 ?auto_3119 ) ( CLEAR ?auto_3112 ) ( TRUCK-AT ?auto_3116 ?auto_3115 ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3119 ) ) ( not ( = ?auto_3113 ?auto_3119 ) ) ( not ( = ?auto_3114 ?auto_3118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3116 ?auto_3115 ?auto_3117 )
      ( !LIFT ?auto_3118 ?auto_3112 ?auto_3119 ?auto_3117 )
      ( !LOAD ?auto_3118 ?auto_3112 ?auto_3116 ?auto_3117 )
      ( !DRIVE ?auto_3116 ?auto_3117 ?auto_3115 )
      ( !UNLOAD ?auto_3114 ?auto_3112 ?auto_3116 ?auto_3115 )
      ( !DROP ?auto_3114 ?auto_3112 ?auto_3113 ?auto_3115 )
      ( MAKE-ON-VERIFY ?auto_3112 ?auto_3113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3122 - SURFACE
      ?auto_3123 - SURFACE
    )
    :vars
    (
      ?auto_3124 - HOIST
      ?auto_3125 - PLACE
      ?auto_3127 - PLACE
      ?auto_3128 - HOIST
      ?auto_3129 - SURFACE
      ?auto_3126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3124 ?auto_3125 ) ( SURFACE-AT ?auto_3123 ?auto_3125 ) ( CLEAR ?auto_3123 ) ( IS-CRATE ?auto_3122 ) ( AVAILABLE ?auto_3124 ) ( not ( = ?auto_3127 ?auto_3125 ) ) ( HOIST-AT ?auto_3128 ?auto_3127 ) ( AVAILABLE ?auto_3128 ) ( SURFACE-AT ?auto_3122 ?auto_3127 ) ( ON ?auto_3122 ?auto_3129 ) ( CLEAR ?auto_3122 ) ( TRUCK-AT ?auto_3126 ?auto_3125 ) ( not ( = ?auto_3122 ?auto_3123 ) ) ( not ( = ?auto_3122 ?auto_3129 ) ) ( not ( = ?auto_3123 ?auto_3129 ) ) ( not ( = ?auto_3124 ?auto_3128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3126 ?auto_3125 ?auto_3127 )
      ( !LIFT ?auto_3128 ?auto_3122 ?auto_3129 ?auto_3127 )
      ( !LOAD ?auto_3128 ?auto_3122 ?auto_3126 ?auto_3127 )
      ( !DRIVE ?auto_3126 ?auto_3127 ?auto_3125 )
      ( !UNLOAD ?auto_3124 ?auto_3122 ?auto_3126 ?auto_3125 )
      ( !DROP ?auto_3124 ?auto_3122 ?auto_3123 ?auto_3125 )
      ( MAKE-ON-VERIFY ?auto_3122 ?auto_3123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3132 - SURFACE
      ?auto_3133 - SURFACE
    )
    :vars
    (
      ?auto_3134 - HOIST
      ?auto_3135 - PLACE
      ?auto_3137 - PLACE
      ?auto_3138 - HOIST
      ?auto_3139 - SURFACE
      ?auto_3136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3134 ?auto_3135 ) ( SURFACE-AT ?auto_3133 ?auto_3135 ) ( CLEAR ?auto_3133 ) ( IS-CRATE ?auto_3132 ) ( AVAILABLE ?auto_3134 ) ( not ( = ?auto_3137 ?auto_3135 ) ) ( HOIST-AT ?auto_3138 ?auto_3137 ) ( AVAILABLE ?auto_3138 ) ( SURFACE-AT ?auto_3132 ?auto_3137 ) ( ON ?auto_3132 ?auto_3139 ) ( CLEAR ?auto_3132 ) ( TRUCK-AT ?auto_3136 ?auto_3135 ) ( not ( = ?auto_3132 ?auto_3133 ) ) ( not ( = ?auto_3132 ?auto_3139 ) ) ( not ( = ?auto_3133 ?auto_3139 ) ) ( not ( = ?auto_3134 ?auto_3138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3136 ?auto_3135 ?auto_3137 )
      ( !LIFT ?auto_3138 ?auto_3132 ?auto_3139 ?auto_3137 )
      ( !LOAD ?auto_3138 ?auto_3132 ?auto_3136 ?auto_3137 )
      ( !DRIVE ?auto_3136 ?auto_3137 ?auto_3135 )
      ( !UNLOAD ?auto_3134 ?auto_3132 ?auto_3136 ?auto_3135 )
      ( !DROP ?auto_3134 ?auto_3132 ?auto_3133 ?auto_3135 )
      ( MAKE-ON-VERIFY ?auto_3132 ?auto_3133 ) )
  )

)

