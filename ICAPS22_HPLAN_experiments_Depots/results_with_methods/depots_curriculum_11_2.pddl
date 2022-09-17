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
      ?auto_2922 - SURFACE
      ?auto_2923 - SURFACE
    )
    :vars
    (
      ?auto_2924 - HOIST
      ?auto_2925 - PLACE
      ?auto_2927 - PLACE
      ?auto_2928 - HOIST
      ?auto_2929 - SURFACE
      ?auto_2926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2924 ?auto_2925 ) ( SURFACE-AT ?auto_2923 ?auto_2925 ) ( CLEAR ?auto_2923 ) ( IS-CRATE ?auto_2922 ) ( AVAILABLE ?auto_2924 ) ( not ( = ?auto_2927 ?auto_2925 ) ) ( HOIST-AT ?auto_2928 ?auto_2927 ) ( AVAILABLE ?auto_2928 ) ( SURFACE-AT ?auto_2922 ?auto_2927 ) ( ON ?auto_2922 ?auto_2929 ) ( CLEAR ?auto_2922 ) ( TRUCK-AT ?auto_2926 ?auto_2925 ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2929 ) ) ( not ( = ?auto_2923 ?auto_2929 ) ) ( not ( = ?auto_2924 ?auto_2928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2926 ?auto_2925 ?auto_2927 )
      ( !LIFT ?auto_2928 ?auto_2922 ?auto_2929 ?auto_2927 )
      ( !LOAD ?auto_2928 ?auto_2922 ?auto_2926 ?auto_2927 )
      ( !DRIVE ?auto_2926 ?auto_2927 ?auto_2925 )
      ( !UNLOAD ?auto_2924 ?auto_2922 ?auto_2926 ?auto_2925 )
      ( !DROP ?auto_2924 ?auto_2922 ?auto_2923 ?auto_2925 )
      ( MAKE-ON-VERIFY ?auto_2922 ?auto_2923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2932 - SURFACE
      ?auto_2933 - SURFACE
    )
    :vars
    (
      ?auto_2934 - HOIST
      ?auto_2935 - PLACE
      ?auto_2937 - PLACE
      ?auto_2938 - HOIST
      ?auto_2939 - SURFACE
      ?auto_2936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2934 ?auto_2935 ) ( SURFACE-AT ?auto_2933 ?auto_2935 ) ( CLEAR ?auto_2933 ) ( IS-CRATE ?auto_2932 ) ( AVAILABLE ?auto_2934 ) ( not ( = ?auto_2937 ?auto_2935 ) ) ( HOIST-AT ?auto_2938 ?auto_2937 ) ( AVAILABLE ?auto_2938 ) ( SURFACE-AT ?auto_2932 ?auto_2937 ) ( ON ?auto_2932 ?auto_2939 ) ( CLEAR ?auto_2932 ) ( TRUCK-AT ?auto_2936 ?auto_2935 ) ( not ( = ?auto_2932 ?auto_2933 ) ) ( not ( = ?auto_2932 ?auto_2939 ) ) ( not ( = ?auto_2933 ?auto_2939 ) ) ( not ( = ?auto_2934 ?auto_2938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2936 ?auto_2935 ?auto_2937 )
      ( !LIFT ?auto_2938 ?auto_2932 ?auto_2939 ?auto_2937 )
      ( !LOAD ?auto_2938 ?auto_2932 ?auto_2936 ?auto_2937 )
      ( !DRIVE ?auto_2936 ?auto_2937 ?auto_2935 )
      ( !UNLOAD ?auto_2934 ?auto_2932 ?auto_2936 ?auto_2935 )
      ( !DROP ?auto_2934 ?auto_2932 ?auto_2933 ?auto_2935 )
      ( MAKE-ON-VERIFY ?auto_2932 ?auto_2933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2942 - SURFACE
      ?auto_2943 - SURFACE
    )
    :vars
    (
      ?auto_2944 - HOIST
      ?auto_2945 - PLACE
      ?auto_2947 - PLACE
      ?auto_2948 - HOIST
      ?auto_2949 - SURFACE
      ?auto_2946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2944 ?auto_2945 ) ( SURFACE-AT ?auto_2943 ?auto_2945 ) ( CLEAR ?auto_2943 ) ( IS-CRATE ?auto_2942 ) ( AVAILABLE ?auto_2944 ) ( not ( = ?auto_2947 ?auto_2945 ) ) ( HOIST-AT ?auto_2948 ?auto_2947 ) ( AVAILABLE ?auto_2948 ) ( SURFACE-AT ?auto_2942 ?auto_2947 ) ( ON ?auto_2942 ?auto_2949 ) ( CLEAR ?auto_2942 ) ( TRUCK-AT ?auto_2946 ?auto_2945 ) ( not ( = ?auto_2942 ?auto_2943 ) ) ( not ( = ?auto_2942 ?auto_2949 ) ) ( not ( = ?auto_2943 ?auto_2949 ) ) ( not ( = ?auto_2944 ?auto_2948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2946 ?auto_2945 ?auto_2947 )
      ( !LIFT ?auto_2948 ?auto_2942 ?auto_2949 ?auto_2947 )
      ( !LOAD ?auto_2948 ?auto_2942 ?auto_2946 ?auto_2947 )
      ( !DRIVE ?auto_2946 ?auto_2947 ?auto_2945 )
      ( !UNLOAD ?auto_2944 ?auto_2942 ?auto_2946 ?auto_2945 )
      ( !DROP ?auto_2944 ?auto_2942 ?auto_2943 ?auto_2945 )
      ( MAKE-ON-VERIFY ?auto_2942 ?auto_2943 ) )
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
      ?auto_2957 - PLACE
      ?auto_2958 - HOIST
      ?auto_2959 - SURFACE
      ?auto_2956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2954 ?auto_2955 ) ( SURFACE-AT ?auto_2953 ?auto_2955 ) ( CLEAR ?auto_2953 ) ( IS-CRATE ?auto_2952 ) ( AVAILABLE ?auto_2954 ) ( not ( = ?auto_2957 ?auto_2955 ) ) ( HOIST-AT ?auto_2958 ?auto_2957 ) ( AVAILABLE ?auto_2958 ) ( SURFACE-AT ?auto_2952 ?auto_2957 ) ( ON ?auto_2952 ?auto_2959 ) ( CLEAR ?auto_2952 ) ( TRUCK-AT ?auto_2956 ?auto_2955 ) ( not ( = ?auto_2952 ?auto_2953 ) ) ( not ( = ?auto_2952 ?auto_2959 ) ) ( not ( = ?auto_2953 ?auto_2959 ) ) ( not ( = ?auto_2954 ?auto_2958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2956 ?auto_2955 ?auto_2957 )
      ( !LIFT ?auto_2958 ?auto_2952 ?auto_2959 ?auto_2957 )
      ( !LOAD ?auto_2958 ?auto_2952 ?auto_2956 ?auto_2957 )
      ( !DRIVE ?auto_2956 ?auto_2957 ?auto_2955 )
      ( !UNLOAD ?auto_2954 ?auto_2952 ?auto_2956 ?auto_2955 )
      ( !DROP ?auto_2954 ?auto_2952 ?auto_2953 ?auto_2955 )
      ( MAKE-ON-VERIFY ?auto_2952 ?auto_2953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2962 - SURFACE
      ?auto_2963 - SURFACE
    )
    :vars
    (
      ?auto_2964 - HOIST
      ?auto_2965 - PLACE
      ?auto_2967 - PLACE
      ?auto_2968 - HOIST
      ?auto_2969 - SURFACE
      ?auto_2966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2964 ?auto_2965 ) ( SURFACE-AT ?auto_2963 ?auto_2965 ) ( CLEAR ?auto_2963 ) ( IS-CRATE ?auto_2962 ) ( AVAILABLE ?auto_2964 ) ( not ( = ?auto_2967 ?auto_2965 ) ) ( HOIST-AT ?auto_2968 ?auto_2967 ) ( AVAILABLE ?auto_2968 ) ( SURFACE-AT ?auto_2962 ?auto_2967 ) ( ON ?auto_2962 ?auto_2969 ) ( CLEAR ?auto_2962 ) ( TRUCK-AT ?auto_2966 ?auto_2965 ) ( not ( = ?auto_2962 ?auto_2963 ) ) ( not ( = ?auto_2962 ?auto_2969 ) ) ( not ( = ?auto_2963 ?auto_2969 ) ) ( not ( = ?auto_2964 ?auto_2968 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2966 ?auto_2965 ?auto_2967 )
      ( !LIFT ?auto_2968 ?auto_2962 ?auto_2969 ?auto_2967 )
      ( !LOAD ?auto_2968 ?auto_2962 ?auto_2966 ?auto_2967 )
      ( !DRIVE ?auto_2966 ?auto_2967 ?auto_2965 )
      ( !UNLOAD ?auto_2964 ?auto_2962 ?auto_2966 ?auto_2965 )
      ( !DROP ?auto_2964 ?auto_2962 ?auto_2963 ?auto_2965 )
      ( MAKE-ON-VERIFY ?auto_2962 ?auto_2963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2972 - SURFACE
      ?auto_2973 - SURFACE
    )
    :vars
    (
      ?auto_2974 - HOIST
      ?auto_2975 - PLACE
      ?auto_2977 - PLACE
      ?auto_2978 - HOIST
      ?auto_2979 - SURFACE
      ?auto_2976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2974 ?auto_2975 ) ( SURFACE-AT ?auto_2973 ?auto_2975 ) ( CLEAR ?auto_2973 ) ( IS-CRATE ?auto_2972 ) ( AVAILABLE ?auto_2974 ) ( not ( = ?auto_2977 ?auto_2975 ) ) ( HOIST-AT ?auto_2978 ?auto_2977 ) ( AVAILABLE ?auto_2978 ) ( SURFACE-AT ?auto_2972 ?auto_2977 ) ( ON ?auto_2972 ?auto_2979 ) ( CLEAR ?auto_2972 ) ( TRUCK-AT ?auto_2976 ?auto_2975 ) ( not ( = ?auto_2972 ?auto_2973 ) ) ( not ( = ?auto_2972 ?auto_2979 ) ) ( not ( = ?auto_2973 ?auto_2979 ) ) ( not ( = ?auto_2974 ?auto_2978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2976 ?auto_2975 ?auto_2977 )
      ( !LIFT ?auto_2978 ?auto_2972 ?auto_2979 ?auto_2977 )
      ( !LOAD ?auto_2978 ?auto_2972 ?auto_2976 ?auto_2977 )
      ( !DRIVE ?auto_2976 ?auto_2977 ?auto_2975 )
      ( !UNLOAD ?auto_2974 ?auto_2972 ?auto_2976 ?auto_2975 )
      ( !DROP ?auto_2974 ?auto_2972 ?auto_2973 ?auto_2975 )
      ( MAKE-ON-VERIFY ?auto_2972 ?auto_2973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2982 - SURFACE
      ?auto_2983 - SURFACE
    )
    :vars
    (
      ?auto_2984 - HOIST
      ?auto_2985 - PLACE
      ?auto_2987 - PLACE
      ?auto_2988 - HOIST
      ?auto_2989 - SURFACE
      ?auto_2986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2984 ?auto_2985 ) ( SURFACE-AT ?auto_2983 ?auto_2985 ) ( CLEAR ?auto_2983 ) ( IS-CRATE ?auto_2982 ) ( AVAILABLE ?auto_2984 ) ( not ( = ?auto_2987 ?auto_2985 ) ) ( HOIST-AT ?auto_2988 ?auto_2987 ) ( AVAILABLE ?auto_2988 ) ( SURFACE-AT ?auto_2982 ?auto_2987 ) ( ON ?auto_2982 ?auto_2989 ) ( CLEAR ?auto_2982 ) ( TRUCK-AT ?auto_2986 ?auto_2985 ) ( not ( = ?auto_2982 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2989 ) ) ( not ( = ?auto_2983 ?auto_2989 ) ) ( not ( = ?auto_2984 ?auto_2988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2986 ?auto_2985 ?auto_2987 )
      ( !LIFT ?auto_2988 ?auto_2982 ?auto_2989 ?auto_2987 )
      ( !LOAD ?auto_2988 ?auto_2982 ?auto_2986 ?auto_2987 )
      ( !DRIVE ?auto_2986 ?auto_2987 ?auto_2985 )
      ( !UNLOAD ?auto_2984 ?auto_2982 ?auto_2986 ?auto_2985 )
      ( !DROP ?auto_2984 ?auto_2982 ?auto_2983 ?auto_2985 )
      ( MAKE-ON-VERIFY ?auto_2982 ?auto_2983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2992 - SURFACE
      ?auto_2993 - SURFACE
    )
    :vars
    (
      ?auto_2994 - HOIST
      ?auto_2995 - PLACE
      ?auto_2997 - PLACE
      ?auto_2998 - HOIST
      ?auto_2999 - SURFACE
      ?auto_2996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2994 ?auto_2995 ) ( SURFACE-AT ?auto_2993 ?auto_2995 ) ( CLEAR ?auto_2993 ) ( IS-CRATE ?auto_2992 ) ( AVAILABLE ?auto_2994 ) ( not ( = ?auto_2997 ?auto_2995 ) ) ( HOIST-AT ?auto_2998 ?auto_2997 ) ( AVAILABLE ?auto_2998 ) ( SURFACE-AT ?auto_2992 ?auto_2997 ) ( ON ?auto_2992 ?auto_2999 ) ( CLEAR ?auto_2992 ) ( TRUCK-AT ?auto_2996 ?auto_2995 ) ( not ( = ?auto_2992 ?auto_2993 ) ) ( not ( = ?auto_2992 ?auto_2999 ) ) ( not ( = ?auto_2993 ?auto_2999 ) ) ( not ( = ?auto_2994 ?auto_2998 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2996 ?auto_2995 ?auto_2997 )
      ( !LIFT ?auto_2998 ?auto_2992 ?auto_2999 ?auto_2997 )
      ( !LOAD ?auto_2998 ?auto_2992 ?auto_2996 ?auto_2997 )
      ( !DRIVE ?auto_2996 ?auto_2997 ?auto_2995 )
      ( !UNLOAD ?auto_2994 ?auto_2992 ?auto_2996 ?auto_2995 )
      ( !DROP ?auto_2994 ?auto_2992 ?auto_2993 ?auto_2995 )
      ( MAKE-ON-VERIFY ?auto_2992 ?auto_2993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3002 - SURFACE
      ?auto_3003 - SURFACE
    )
    :vars
    (
      ?auto_3004 - HOIST
      ?auto_3005 - PLACE
      ?auto_3007 - PLACE
      ?auto_3008 - HOIST
      ?auto_3009 - SURFACE
      ?auto_3006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3004 ?auto_3005 ) ( SURFACE-AT ?auto_3003 ?auto_3005 ) ( CLEAR ?auto_3003 ) ( IS-CRATE ?auto_3002 ) ( AVAILABLE ?auto_3004 ) ( not ( = ?auto_3007 ?auto_3005 ) ) ( HOIST-AT ?auto_3008 ?auto_3007 ) ( AVAILABLE ?auto_3008 ) ( SURFACE-AT ?auto_3002 ?auto_3007 ) ( ON ?auto_3002 ?auto_3009 ) ( CLEAR ?auto_3002 ) ( TRUCK-AT ?auto_3006 ?auto_3005 ) ( not ( = ?auto_3002 ?auto_3003 ) ) ( not ( = ?auto_3002 ?auto_3009 ) ) ( not ( = ?auto_3003 ?auto_3009 ) ) ( not ( = ?auto_3004 ?auto_3008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3006 ?auto_3005 ?auto_3007 )
      ( !LIFT ?auto_3008 ?auto_3002 ?auto_3009 ?auto_3007 )
      ( !LOAD ?auto_3008 ?auto_3002 ?auto_3006 ?auto_3007 )
      ( !DRIVE ?auto_3006 ?auto_3007 ?auto_3005 )
      ( !UNLOAD ?auto_3004 ?auto_3002 ?auto_3006 ?auto_3005 )
      ( !DROP ?auto_3004 ?auto_3002 ?auto_3003 ?auto_3005 )
      ( MAKE-ON-VERIFY ?auto_3002 ?auto_3003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3012 - SURFACE
      ?auto_3013 - SURFACE
    )
    :vars
    (
      ?auto_3014 - HOIST
      ?auto_3015 - PLACE
      ?auto_3017 - PLACE
      ?auto_3018 - HOIST
      ?auto_3019 - SURFACE
      ?auto_3016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3014 ?auto_3015 ) ( SURFACE-AT ?auto_3013 ?auto_3015 ) ( CLEAR ?auto_3013 ) ( IS-CRATE ?auto_3012 ) ( AVAILABLE ?auto_3014 ) ( not ( = ?auto_3017 ?auto_3015 ) ) ( HOIST-AT ?auto_3018 ?auto_3017 ) ( AVAILABLE ?auto_3018 ) ( SURFACE-AT ?auto_3012 ?auto_3017 ) ( ON ?auto_3012 ?auto_3019 ) ( CLEAR ?auto_3012 ) ( TRUCK-AT ?auto_3016 ?auto_3015 ) ( not ( = ?auto_3012 ?auto_3013 ) ) ( not ( = ?auto_3012 ?auto_3019 ) ) ( not ( = ?auto_3013 ?auto_3019 ) ) ( not ( = ?auto_3014 ?auto_3018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3016 ?auto_3015 ?auto_3017 )
      ( !LIFT ?auto_3018 ?auto_3012 ?auto_3019 ?auto_3017 )
      ( !LOAD ?auto_3018 ?auto_3012 ?auto_3016 ?auto_3017 )
      ( !DRIVE ?auto_3016 ?auto_3017 ?auto_3015 )
      ( !UNLOAD ?auto_3014 ?auto_3012 ?auto_3016 ?auto_3015 )
      ( !DROP ?auto_3014 ?auto_3012 ?auto_3013 ?auto_3015 )
      ( MAKE-ON-VERIFY ?auto_3012 ?auto_3013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3022 - SURFACE
      ?auto_3023 - SURFACE
    )
    :vars
    (
      ?auto_3024 - HOIST
      ?auto_3025 - PLACE
      ?auto_3027 - PLACE
      ?auto_3028 - HOIST
      ?auto_3029 - SURFACE
      ?auto_3026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3024 ?auto_3025 ) ( SURFACE-AT ?auto_3023 ?auto_3025 ) ( CLEAR ?auto_3023 ) ( IS-CRATE ?auto_3022 ) ( AVAILABLE ?auto_3024 ) ( not ( = ?auto_3027 ?auto_3025 ) ) ( HOIST-AT ?auto_3028 ?auto_3027 ) ( AVAILABLE ?auto_3028 ) ( SURFACE-AT ?auto_3022 ?auto_3027 ) ( ON ?auto_3022 ?auto_3029 ) ( CLEAR ?auto_3022 ) ( TRUCK-AT ?auto_3026 ?auto_3025 ) ( not ( = ?auto_3022 ?auto_3023 ) ) ( not ( = ?auto_3022 ?auto_3029 ) ) ( not ( = ?auto_3023 ?auto_3029 ) ) ( not ( = ?auto_3024 ?auto_3028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3026 ?auto_3025 ?auto_3027 )
      ( !LIFT ?auto_3028 ?auto_3022 ?auto_3029 ?auto_3027 )
      ( !LOAD ?auto_3028 ?auto_3022 ?auto_3026 ?auto_3027 )
      ( !DRIVE ?auto_3026 ?auto_3027 ?auto_3025 )
      ( !UNLOAD ?auto_3024 ?auto_3022 ?auto_3026 ?auto_3025 )
      ( !DROP ?auto_3024 ?auto_3022 ?auto_3023 ?auto_3025 )
      ( MAKE-ON-VERIFY ?auto_3022 ?auto_3023 ) )
  )

)

