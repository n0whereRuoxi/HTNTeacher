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
      ?auto_2937 - SURFACE
      ?auto_2938 - SURFACE
    )
    :vars
    (
      ?auto_2939 - HOIST
      ?auto_2940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2939 ?auto_2940 ) ( SURFACE-AT ?auto_2938 ?auto_2940 ) ( CLEAR ?auto_2938 ) ( LIFTING ?auto_2939 ?auto_2937 ) ( IS-CRATE ?auto_2937 ) ( not ( = ?auto_2937 ?auto_2938 ) ) )
    :subtasks
    ( ( !DROP ?auto_2939 ?auto_2937 ?auto_2938 ?auto_2940 )
      ( MAKE-ON-VERIFY ?auto_2937 ?auto_2938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2941 - SURFACE
      ?auto_2942 - SURFACE
    )
    :vars
    (
      ?auto_2943 - HOIST
      ?auto_2944 - PLACE
      ?auto_2945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2943 ?auto_2944 ) ( SURFACE-AT ?auto_2942 ?auto_2944 ) ( CLEAR ?auto_2942 ) ( IS-CRATE ?auto_2941 ) ( not ( = ?auto_2941 ?auto_2942 ) ) ( TRUCK-AT ?auto_2945 ?auto_2944 ) ( AVAILABLE ?auto_2943 ) ( IN ?auto_2941 ?auto_2945 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2943 ?auto_2941 ?auto_2945 ?auto_2944 )
      ( MAKE-ON ?auto_2941 ?auto_2942 )
      ( MAKE-ON-VERIFY ?auto_2941 ?auto_2942 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2946 - SURFACE
      ?auto_2947 - SURFACE
    )
    :vars
    (
      ?auto_2948 - HOIST
      ?auto_2950 - PLACE
      ?auto_2949 - TRUCK
      ?auto_2951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2948 ?auto_2950 ) ( SURFACE-AT ?auto_2947 ?auto_2950 ) ( CLEAR ?auto_2947 ) ( IS-CRATE ?auto_2946 ) ( not ( = ?auto_2946 ?auto_2947 ) ) ( AVAILABLE ?auto_2948 ) ( IN ?auto_2946 ?auto_2949 ) ( TRUCK-AT ?auto_2949 ?auto_2951 ) ( not ( = ?auto_2951 ?auto_2950 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2949 ?auto_2951 ?auto_2950 )
      ( MAKE-ON ?auto_2946 ?auto_2947 )
      ( MAKE-ON-VERIFY ?auto_2946 ?auto_2947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2952 - SURFACE
      ?auto_2953 - SURFACE
    )
    :vars
    (
      ?auto_2954 - HOIST
      ?auto_2955 - PLACE
      ?auto_2957 - TRUCK
      ?auto_2956 - PLACE
      ?auto_2958 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2954 ?auto_2955 ) ( SURFACE-AT ?auto_2953 ?auto_2955 ) ( CLEAR ?auto_2953 ) ( IS-CRATE ?auto_2952 ) ( not ( = ?auto_2952 ?auto_2953 ) ) ( AVAILABLE ?auto_2954 ) ( TRUCK-AT ?auto_2957 ?auto_2956 ) ( not ( = ?auto_2956 ?auto_2955 ) ) ( HOIST-AT ?auto_2958 ?auto_2956 ) ( LIFTING ?auto_2958 ?auto_2952 ) ( not ( = ?auto_2954 ?auto_2958 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2958 ?auto_2952 ?auto_2957 ?auto_2956 )
      ( MAKE-ON ?auto_2952 ?auto_2953 )
      ( MAKE-ON-VERIFY ?auto_2952 ?auto_2953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2959 - SURFACE
      ?auto_2960 - SURFACE
    )
    :vars
    (
      ?auto_2964 - HOIST
      ?auto_2961 - PLACE
      ?auto_2963 - TRUCK
      ?auto_2962 - PLACE
      ?auto_2965 - HOIST
      ?auto_2966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2964 ?auto_2961 ) ( SURFACE-AT ?auto_2960 ?auto_2961 ) ( CLEAR ?auto_2960 ) ( IS-CRATE ?auto_2959 ) ( not ( = ?auto_2959 ?auto_2960 ) ) ( AVAILABLE ?auto_2964 ) ( TRUCK-AT ?auto_2963 ?auto_2962 ) ( not ( = ?auto_2962 ?auto_2961 ) ) ( HOIST-AT ?auto_2965 ?auto_2962 ) ( not ( = ?auto_2964 ?auto_2965 ) ) ( AVAILABLE ?auto_2965 ) ( SURFACE-AT ?auto_2959 ?auto_2962 ) ( ON ?auto_2959 ?auto_2966 ) ( CLEAR ?auto_2959 ) ( not ( = ?auto_2959 ?auto_2966 ) ) ( not ( = ?auto_2960 ?auto_2966 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2965 ?auto_2959 ?auto_2966 ?auto_2962 )
      ( MAKE-ON ?auto_2959 ?auto_2960 )
      ( MAKE-ON-VERIFY ?auto_2959 ?auto_2960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2967 - SURFACE
      ?auto_2968 - SURFACE
    )
    :vars
    (
      ?auto_2969 - HOIST
      ?auto_2972 - PLACE
      ?auto_2970 - PLACE
      ?auto_2974 - HOIST
      ?auto_2973 - SURFACE
      ?auto_2971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2969 ?auto_2972 ) ( SURFACE-AT ?auto_2968 ?auto_2972 ) ( CLEAR ?auto_2968 ) ( IS-CRATE ?auto_2967 ) ( not ( = ?auto_2967 ?auto_2968 ) ) ( AVAILABLE ?auto_2969 ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( HOIST-AT ?auto_2974 ?auto_2970 ) ( not ( = ?auto_2969 ?auto_2974 ) ) ( AVAILABLE ?auto_2974 ) ( SURFACE-AT ?auto_2967 ?auto_2970 ) ( ON ?auto_2967 ?auto_2973 ) ( CLEAR ?auto_2967 ) ( not ( = ?auto_2967 ?auto_2973 ) ) ( not ( = ?auto_2968 ?auto_2973 ) ) ( TRUCK-AT ?auto_2971 ?auto_2972 ) )
    :subtasks
    ( ( !DRIVE ?auto_2971 ?auto_2972 ?auto_2970 )
      ( MAKE-ON ?auto_2967 ?auto_2968 )
      ( MAKE-ON-VERIFY ?auto_2967 ?auto_2968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3015 - SURFACE
      ?auto_3016 - SURFACE
    )
    :vars
    (
      ?auto_3022 - HOIST
      ?auto_3020 - PLACE
      ?auto_3018 - PLACE
      ?auto_3017 - HOIST
      ?auto_3019 - SURFACE
      ?auto_3021 - TRUCK
      ?auto_3023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3022 ?auto_3020 ) ( IS-CRATE ?auto_3015 ) ( not ( = ?auto_3015 ?auto_3016 ) ) ( not ( = ?auto_3018 ?auto_3020 ) ) ( HOIST-AT ?auto_3017 ?auto_3018 ) ( not ( = ?auto_3022 ?auto_3017 ) ) ( AVAILABLE ?auto_3017 ) ( SURFACE-AT ?auto_3015 ?auto_3018 ) ( ON ?auto_3015 ?auto_3019 ) ( CLEAR ?auto_3015 ) ( not ( = ?auto_3015 ?auto_3019 ) ) ( not ( = ?auto_3016 ?auto_3019 ) ) ( TRUCK-AT ?auto_3021 ?auto_3020 ) ( SURFACE-AT ?auto_3023 ?auto_3020 ) ( CLEAR ?auto_3023 ) ( LIFTING ?auto_3022 ?auto_3016 ) ( IS-CRATE ?auto_3016 ) ( not ( = ?auto_3015 ?auto_3023 ) ) ( not ( = ?auto_3016 ?auto_3023 ) ) ( not ( = ?auto_3019 ?auto_3023 ) ) )
    :subtasks
    ( ( !DROP ?auto_3022 ?auto_3016 ?auto_3023 ?auto_3020 )
      ( MAKE-ON ?auto_3015 ?auto_3016 )
      ( MAKE-ON-VERIFY ?auto_3015 ?auto_3016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3024 - SURFACE
      ?auto_3025 - SURFACE
    )
    :vars
    (
      ?auto_3029 - HOIST
      ?auto_3031 - PLACE
      ?auto_3027 - PLACE
      ?auto_3032 - HOIST
      ?auto_3028 - SURFACE
      ?auto_3026 - TRUCK
      ?auto_3030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3029 ?auto_3031 ) ( IS-CRATE ?auto_3024 ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( not ( = ?auto_3027 ?auto_3031 ) ) ( HOIST-AT ?auto_3032 ?auto_3027 ) ( not ( = ?auto_3029 ?auto_3032 ) ) ( AVAILABLE ?auto_3032 ) ( SURFACE-AT ?auto_3024 ?auto_3027 ) ( ON ?auto_3024 ?auto_3028 ) ( CLEAR ?auto_3024 ) ( not ( = ?auto_3024 ?auto_3028 ) ) ( not ( = ?auto_3025 ?auto_3028 ) ) ( TRUCK-AT ?auto_3026 ?auto_3031 ) ( SURFACE-AT ?auto_3030 ?auto_3031 ) ( CLEAR ?auto_3030 ) ( IS-CRATE ?auto_3025 ) ( not ( = ?auto_3024 ?auto_3030 ) ) ( not ( = ?auto_3025 ?auto_3030 ) ) ( not ( = ?auto_3028 ?auto_3030 ) ) ( AVAILABLE ?auto_3029 ) ( IN ?auto_3025 ?auto_3026 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3029 ?auto_3025 ?auto_3026 ?auto_3031 )
      ( MAKE-ON ?auto_3024 ?auto_3025 )
      ( MAKE-ON-VERIFY ?auto_3024 ?auto_3025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3039 - SURFACE
      ?auto_3040 - SURFACE
    )
    :vars
    (
      ?auto_3045 - HOIST
      ?auto_3042 - PLACE
      ?auto_3043 - PLACE
      ?auto_3044 - HOIST
      ?auto_3041 - SURFACE
      ?auto_3046 - TRUCK
      ?auto_3047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3045 ?auto_3042 ) ( SURFACE-AT ?auto_3040 ?auto_3042 ) ( CLEAR ?auto_3040 ) ( IS-CRATE ?auto_3039 ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( AVAILABLE ?auto_3045 ) ( not ( = ?auto_3043 ?auto_3042 ) ) ( HOIST-AT ?auto_3044 ?auto_3043 ) ( not ( = ?auto_3045 ?auto_3044 ) ) ( AVAILABLE ?auto_3044 ) ( SURFACE-AT ?auto_3039 ?auto_3043 ) ( ON ?auto_3039 ?auto_3041 ) ( CLEAR ?auto_3039 ) ( not ( = ?auto_3039 ?auto_3041 ) ) ( not ( = ?auto_3040 ?auto_3041 ) ) ( TRUCK-AT ?auto_3046 ?auto_3047 ) ( not ( = ?auto_3047 ?auto_3042 ) ) ( not ( = ?auto_3043 ?auto_3047 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3046 ?auto_3047 ?auto_3042 )
      ( MAKE-ON ?auto_3039 ?auto_3040 )
      ( MAKE-ON-VERIFY ?auto_3039 ?auto_3040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3212 - SURFACE
      ?auto_3213 - SURFACE
    )
    :vars
    (
      ?auto_3215 - HOIST
      ?auto_3218 - PLACE
      ?auto_3216 - TRUCK
      ?auto_3217 - PLACE
      ?auto_3214 - HOIST
      ?auto_3219 - SURFACE
      ?auto_3220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3215 ?auto_3218 ) ( SURFACE-AT ?auto_3213 ?auto_3218 ) ( CLEAR ?auto_3213 ) ( IS-CRATE ?auto_3212 ) ( not ( = ?auto_3212 ?auto_3213 ) ) ( AVAILABLE ?auto_3215 ) ( TRUCK-AT ?auto_3216 ?auto_3217 ) ( not ( = ?auto_3217 ?auto_3218 ) ) ( HOIST-AT ?auto_3214 ?auto_3217 ) ( not ( = ?auto_3215 ?auto_3214 ) ) ( SURFACE-AT ?auto_3212 ?auto_3217 ) ( ON ?auto_3212 ?auto_3219 ) ( CLEAR ?auto_3212 ) ( not ( = ?auto_3212 ?auto_3219 ) ) ( not ( = ?auto_3213 ?auto_3219 ) ) ( LIFTING ?auto_3214 ?auto_3220 ) ( IS-CRATE ?auto_3220 ) ( not ( = ?auto_3212 ?auto_3220 ) ) ( not ( = ?auto_3213 ?auto_3220 ) ) ( not ( = ?auto_3219 ?auto_3220 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3214 ?auto_3220 ?auto_3216 ?auto_3217 )
      ( MAKE-ON ?auto_3212 ?auto_3213 )
      ( MAKE-ON-VERIFY ?auto_3212 ?auto_3213 ) )
  )

)

