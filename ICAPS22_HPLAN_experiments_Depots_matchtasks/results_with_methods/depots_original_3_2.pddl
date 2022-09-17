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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2897 - SURFACE
      ?auto_2898 - SURFACE
    )
    :vars
    (
      ?auto_2899 - HOIST
      ?auto_2900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2899 ?auto_2900 ) ( SURFACE-AT ?auto_2897 ?auto_2900 ) ( CLEAR ?auto_2897 ) ( LIFTING ?auto_2899 ?auto_2898 ) ( IS-CRATE ?auto_2898 ) ( not ( = ?auto_2897 ?auto_2898 ) ) )
    :subtasks
    ( ( !DROP ?auto_2899 ?auto_2898 ?auto_2897 ?auto_2900 )
      ( MAKE-1CRATE-VERIFY ?auto_2897 ?auto_2898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2901 - SURFACE
      ?auto_2902 - SURFACE
    )
    :vars
    (
      ?auto_2903 - HOIST
      ?auto_2904 - PLACE
      ?auto_2905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2903 ?auto_2904 ) ( SURFACE-AT ?auto_2901 ?auto_2904 ) ( CLEAR ?auto_2901 ) ( IS-CRATE ?auto_2902 ) ( not ( = ?auto_2901 ?auto_2902 ) ) ( TRUCK-AT ?auto_2905 ?auto_2904 ) ( AVAILABLE ?auto_2903 ) ( IN ?auto_2902 ?auto_2905 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2903 ?auto_2902 ?auto_2905 ?auto_2904 )
      ( MAKE-1CRATE ?auto_2901 ?auto_2902 )
      ( MAKE-1CRATE-VERIFY ?auto_2901 ?auto_2902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2906 - SURFACE
      ?auto_2907 - SURFACE
    )
    :vars
    (
      ?auto_2910 - HOIST
      ?auto_2909 - PLACE
      ?auto_2908 - TRUCK
      ?auto_2911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2910 ?auto_2909 ) ( SURFACE-AT ?auto_2906 ?auto_2909 ) ( CLEAR ?auto_2906 ) ( IS-CRATE ?auto_2907 ) ( not ( = ?auto_2906 ?auto_2907 ) ) ( AVAILABLE ?auto_2910 ) ( IN ?auto_2907 ?auto_2908 ) ( TRUCK-AT ?auto_2908 ?auto_2911 ) ( not ( = ?auto_2911 ?auto_2909 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2908 ?auto_2911 ?auto_2909 )
      ( MAKE-1CRATE ?auto_2906 ?auto_2907 )
      ( MAKE-1CRATE-VERIFY ?auto_2906 ?auto_2907 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2912 - SURFACE
      ?auto_2913 - SURFACE
    )
    :vars
    (
      ?auto_2915 - HOIST
      ?auto_2916 - PLACE
      ?auto_2917 - TRUCK
      ?auto_2914 - PLACE
      ?auto_2918 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2915 ?auto_2916 ) ( SURFACE-AT ?auto_2912 ?auto_2916 ) ( CLEAR ?auto_2912 ) ( IS-CRATE ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2913 ) ) ( AVAILABLE ?auto_2915 ) ( TRUCK-AT ?auto_2917 ?auto_2914 ) ( not ( = ?auto_2914 ?auto_2916 ) ) ( HOIST-AT ?auto_2918 ?auto_2914 ) ( LIFTING ?auto_2918 ?auto_2913 ) ( not ( = ?auto_2915 ?auto_2918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2918 ?auto_2913 ?auto_2917 ?auto_2914 )
      ( MAKE-1CRATE ?auto_2912 ?auto_2913 )
      ( MAKE-1CRATE-VERIFY ?auto_2912 ?auto_2913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2919 - SURFACE
      ?auto_2920 - SURFACE
    )
    :vars
    (
      ?auto_2925 - HOIST
      ?auto_2922 - PLACE
      ?auto_2921 - TRUCK
      ?auto_2924 - PLACE
      ?auto_2923 - HOIST
      ?auto_2926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2925 ?auto_2922 ) ( SURFACE-AT ?auto_2919 ?auto_2922 ) ( CLEAR ?auto_2919 ) ( IS-CRATE ?auto_2920 ) ( not ( = ?auto_2919 ?auto_2920 ) ) ( AVAILABLE ?auto_2925 ) ( TRUCK-AT ?auto_2921 ?auto_2924 ) ( not ( = ?auto_2924 ?auto_2922 ) ) ( HOIST-AT ?auto_2923 ?auto_2924 ) ( not ( = ?auto_2925 ?auto_2923 ) ) ( AVAILABLE ?auto_2923 ) ( SURFACE-AT ?auto_2920 ?auto_2924 ) ( ON ?auto_2920 ?auto_2926 ) ( CLEAR ?auto_2920 ) ( not ( = ?auto_2919 ?auto_2926 ) ) ( not ( = ?auto_2920 ?auto_2926 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2923 ?auto_2920 ?auto_2926 ?auto_2924 )
      ( MAKE-1CRATE ?auto_2919 ?auto_2920 )
      ( MAKE-1CRATE-VERIFY ?auto_2919 ?auto_2920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2927 - SURFACE
      ?auto_2928 - SURFACE
    )
    :vars
    (
      ?auto_2931 - HOIST
      ?auto_2929 - PLACE
      ?auto_2930 - PLACE
      ?auto_2934 - HOIST
      ?auto_2932 - SURFACE
      ?auto_2933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2931 ?auto_2929 ) ( SURFACE-AT ?auto_2927 ?auto_2929 ) ( CLEAR ?auto_2927 ) ( IS-CRATE ?auto_2928 ) ( not ( = ?auto_2927 ?auto_2928 ) ) ( AVAILABLE ?auto_2931 ) ( not ( = ?auto_2930 ?auto_2929 ) ) ( HOIST-AT ?auto_2934 ?auto_2930 ) ( not ( = ?auto_2931 ?auto_2934 ) ) ( AVAILABLE ?auto_2934 ) ( SURFACE-AT ?auto_2928 ?auto_2930 ) ( ON ?auto_2928 ?auto_2932 ) ( CLEAR ?auto_2928 ) ( not ( = ?auto_2927 ?auto_2932 ) ) ( not ( = ?auto_2928 ?auto_2932 ) ) ( TRUCK-AT ?auto_2933 ?auto_2929 ) )
    :subtasks
    ( ( !DRIVE ?auto_2933 ?auto_2929 ?auto_2930 )
      ( MAKE-1CRATE ?auto_2927 ?auto_2928 )
      ( MAKE-1CRATE-VERIFY ?auto_2927 ?auto_2928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2940 - SURFACE
      ?auto_2941 - SURFACE
    )
    :vars
    (
      ?auto_2942 - HOIST
      ?auto_2943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2942 ?auto_2943 ) ( SURFACE-AT ?auto_2940 ?auto_2943 ) ( CLEAR ?auto_2940 ) ( LIFTING ?auto_2942 ?auto_2941 ) ( IS-CRATE ?auto_2941 ) ( not ( = ?auto_2940 ?auto_2941 ) ) )
    :subtasks
    ( ( !DROP ?auto_2942 ?auto_2941 ?auto_2940 ?auto_2943 )
      ( MAKE-1CRATE-VERIFY ?auto_2940 ?auto_2941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2944 - SURFACE
      ?auto_2945 - SURFACE
      ?auto_2946 - SURFACE
    )
    :vars
    (
      ?auto_2948 - HOIST
      ?auto_2947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2948 ?auto_2947 ) ( SURFACE-AT ?auto_2945 ?auto_2947 ) ( CLEAR ?auto_2945 ) ( LIFTING ?auto_2948 ?auto_2946 ) ( IS-CRATE ?auto_2946 ) ( not ( = ?auto_2945 ?auto_2946 ) ) ( ON ?auto_2945 ?auto_2944 ) ( not ( = ?auto_2944 ?auto_2945 ) ) ( not ( = ?auto_2944 ?auto_2946 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2945 ?auto_2946 )
      ( MAKE-2CRATE-VERIFY ?auto_2944 ?auto_2945 ?auto_2946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2949 - SURFACE
      ?auto_2950 - SURFACE
    )
    :vars
    (
      ?auto_2952 - HOIST
      ?auto_2951 - PLACE
      ?auto_2953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2952 ?auto_2951 ) ( SURFACE-AT ?auto_2949 ?auto_2951 ) ( CLEAR ?auto_2949 ) ( IS-CRATE ?auto_2950 ) ( not ( = ?auto_2949 ?auto_2950 ) ) ( TRUCK-AT ?auto_2953 ?auto_2951 ) ( AVAILABLE ?auto_2952 ) ( IN ?auto_2950 ?auto_2953 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2952 ?auto_2950 ?auto_2953 ?auto_2951 )
      ( MAKE-1CRATE ?auto_2949 ?auto_2950 )
      ( MAKE-1CRATE-VERIFY ?auto_2949 ?auto_2950 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2954 - SURFACE
      ?auto_2955 - SURFACE
      ?auto_2956 - SURFACE
    )
    :vars
    (
      ?auto_2957 - HOIST
      ?auto_2959 - PLACE
      ?auto_2958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2957 ?auto_2959 ) ( SURFACE-AT ?auto_2955 ?auto_2959 ) ( CLEAR ?auto_2955 ) ( IS-CRATE ?auto_2956 ) ( not ( = ?auto_2955 ?auto_2956 ) ) ( TRUCK-AT ?auto_2958 ?auto_2959 ) ( AVAILABLE ?auto_2957 ) ( IN ?auto_2956 ?auto_2958 ) ( ON ?auto_2955 ?auto_2954 ) ( not ( = ?auto_2954 ?auto_2955 ) ) ( not ( = ?auto_2954 ?auto_2956 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2955 ?auto_2956 )
      ( MAKE-2CRATE-VERIFY ?auto_2954 ?auto_2955 ?auto_2956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2960 - SURFACE
      ?auto_2961 - SURFACE
    )
    :vars
    (
      ?auto_2963 - HOIST
      ?auto_2962 - PLACE
      ?auto_2964 - TRUCK
      ?auto_2965 - SURFACE
      ?auto_2966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2963 ?auto_2962 ) ( SURFACE-AT ?auto_2960 ?auto_2962 ) ( CLEAR ?auto_2960 ) ( IS-CRATE ?auto_2961 ) ( not ( = ?auto_2960 ?auto_2961 ) ) ( AVAILABLE ?auto_2963 ) ( IN ?auto_2961 ?auto_2964 ) ( ON ?auto_2960 ?auto_2965 ) ( not ( = ?auto_2965 ?auto_2960 ) ) ( not ( = ?auto_2965 ?auto_2961 ) ) ( TRUCK-AT ?auto_2964 ?auto_2966 ) ( not ( = ?auto_2966 ?auto_2962 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2964 ?auto_2966 ?auto_2962 )
      ( MAKE-2CRATE ?auto_2965 ?auto_2960 ?auto_2961 )
      ( MAKE-1CRATE-VERIFY ?auto_2960 ?auto_2961 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2967 - SURFACE
      ?auto_2968 - SURFACE
      ?auto_2969 - SURFACE
    )
    :vars
    (
      ?auto_2971 - HOIST
      ?auto_2970 - PLACE
      ?auto_2973 - TRUCK
      ?auto_2972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2971 ?auto_2970 ) ( SURFACE-AT ?auto_2968 ?auto_2970 ) ( CLEAR ?auto_2968 ) ( IS-CRATE ?auto_2969 ) ( not ( = ?auto_2968 ?auto_2969 ) ) ( AVAILABLE ?auto_2971 ) ( IN ?auto_2969 ?auto_2973 ) ( ON ?auto_2968 ?auto_2967 ) ( not ( = ?auto_2967 ?auto_2968 ) ) ( not ( = ?auto_2967 ?auto_2969 ) ) ( TRUCK-AT ?auto_2973 ?auto_2972 ) ( not ( = ?auto_2972 ?auto_2970 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2968 ?auto_2969 )
      ( MAKE-2CRATE-VERIFY ?auto_2967 ?auto_2968 ?auto_2969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2974 - SURFACE
      ?auto_2975 - SURFACE
    )
    :vars
    (
      ?auto_2980 - HOIST
      ?auto_2979 - PLACE
      ?auto_2976 - SURFACE
      ?auto_2977 - TRUCK
      ?auto_2978 - PLACE
      ?auto_2981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2980 ?auto_2979 ) ( SURFACE-AT ?auto_2974 ?auto_2979 ) ( CLEAR ?auto_2974 ) ( IS-CRATE ?auto_2975 ) ( not ( = ?auto_2974 ?auto_2975 ) ) ( AVAILABLE ?auto_2980 ) ( ON ?auto_2974 ?auto_2976 ) ( not ( = ?auto_2976 ?auto_2974 ) ) ( not ( = ?auto_2976 ?auto_2975 ) ) ( TRUCK-AT ?auto_2977 ?auto_2978 ) ( not ( = ?auto_2978 ?auto_2979 ) ) ( HOIST-AT ?auto_2981 ?auto_2978 ) ( LIFTING ?auto_2981 ?auto_2975 ) ( not ( = ?auto_2980 ?auto_2981 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2981 ?auto_2975 ?auto_2977 ?auto_2978 )
      ( MAKE-2CRATE ?auto_2976 ?auto_2974 ?auto_2975 )
      ( MAKE-1CRATE-VERIFY ?auto_2974 ?auto_2975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2982 - SURFACE
      ?auto_2983 - SURFACE
      ?auto_2984 - SURFACE
    )
    :vars
    (
      ?auto_2989 - HOIST
      ?auto_2985 - PLACE
      ?auto_2988 - TRUCK
      ?auto_2986 - PLACE
      ?auto_2987 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2989 ?auto_2985 ) ( SURFACE-AT ?auto_2983 ?auto_2985 ) ( CLEAR ?auto_2983 ) ( IS-CRATE ?auto_2984 ) ( not ( = ?auto_2983 ?auto_2984 ) ) ( AVAILABLE ?auto_2989 ) ( ON ?auto_2983 ?auto_2982 ) ( not ( = ?auto_2982 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2984 ) ) ( TRUCK-AT ?auto_2988 ?auto_2986 ) ( not ( = ?auto_2986 ?auto_2985 ) ) ( HOIST-AT ?auto_2987 ?auto_2986 ) ( LIFTING ?auto_2987 ?auto_2984 ) ( not ( = ?auto_2989 ?auto_2987 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2983 ?auto_2984 )
      ( MAKE-2CRATE-VERIFY ?auto_2982 ?auto_2983 ?auto_2984 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2990 - SURFACE
      ?auto_2991 - SURFACE
    )
    :vars
    (
      ?auto_2995 - HOIST
      ?auto_2993 - PLACE
      ?auto_2992 - SURFACE
      ?auto_2997 - TRUCK
      ?auto_2994 - PLACE
      ?auto_2996 - HOIST
      ?auto_2998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2995 ?auto_2993 ) ( SURFACE-AT ?auto_2990 ?auto_2993 ) ( CLEAR ?auto_2990 ) ( IS-CRATE ?auto_2991 ) ( not ( = ?auto_2990 ?auto_2991 ) ) ( AVAILABLE ?auto_2995 ) ( ON ?auto_2990 ?auto_2992 ) ( not ( = ?auto_2992 ?auto_2990 ) ) ( not ( = ?auto_2992 ?auto_2991 ) ) ( TRUCK-AT ?auto_2997 ?auto_2994 ) ( not ( = ?auto_2994 ?auto_2993 ) ) ( HOIST-AT ?auto_2996 ?auto_2994 ) ( not ( = ?auto_2995 ?auto_2996 ) ) ( AVAILABLE ?auto_2996 ) ( SURFACE-AT ?auto_2991 ?auto_2994 ) ( ON ?auto_2991 ?auto_2998 ) ( CLEAR ?auto_2991 ) ( not ( = ?auto_2990 ?auto_2998 ) ) ( not ( = ?auto_2991 ?auto_2998 ) ) ( not ( = ?auto_2992 ?auto_2998 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2996 ?auto_2991 ?auto_2998 ?auto_2994 )
      ( MAKE-2CRATE ?auto_2992 ?auto_2990 ?auto_2991 )
      ( MAKE-1CRATE-VERIFY ?auto_2990 ?auto_2991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2999 - SURFACE
      ?auto_3000 - SURFACE
      ?auto_3001 - SURFACE
    )
    :vars
    (
      ?auto_3007 - HOIST
      ?auto_3005 - PLACE
      ?auto_3006 - TRUCK
      ?auto_3004 - PLACE
      ?auto_3003 - HOIST
      ?auto_3002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3007 ?auto_3005 ) ( SURFACE-AT ?auto_3000 ?auto_3005 ) ( CLEAR ?auto_3000 ) ( IS-CRATE ?auto_3001 ) ( not ( = ?auto_3000 ?auto_3001 ) ) ( AVAILABLE ?auto_3007 ) ( ON ?auto_3000 ?auto_2999 ) ( not ( = ?auto_2999 ?auto_3000 ) ) ( not ( = ?auto_2999 ?auto_3001 ) ) ( TRUCK-AT ?auto_3006 ?auto_3004 ) ( not ( = ?auto_3004 ?auto_3005 ) ) ( HOIST-AT ?auto_3003 ?auto_3004 ) ( not ( = ?auto_3007 ?auto_3003 ) ) ( AVAILABLE ?auto_3003 ) ( SURFACE-AT ?auto_3001 ?auto_3004 ) ( ON ?auto_3001 ?auto_3002 ) ( CLEAR ?auto_3001 ) ( not ( = ?auto_3000 ?auto_3002 ) ) ( not ( = ?auto_3001 ?auto_3002 ) ) ( not ( = ?auto_2999 ?auto_3002 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3000 ?auto_3001 )
      ( MAKE-2CRATE-VERIFY ?auto_2999 ?auto_3000 ?auto_3001 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3008 - SURFACE
      ?auto_3009 - SURFACE
    )
    :vars
    (
      ?auto_3011 - HOIST
      ?auto_3014 - PLACE
      ?auto_3016 - SURFACE
      ?auto_3015 - PLACE
      ?auto_3010 - HOIST
      ?auto_3012 - SURFACE
      ?auto_3013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3011 ?auto_3014 ) ( SURFACE-AT ?auto_3008 ?auto_3014 ) ( CLEAR ?auto_3008 ) ( IS-CRATE ?auto_3009 ) ( not ( = ?auto_3008 ?auto_3009 ) ) ( AVAILABLE ?auto_3011 ) ( ON ?auto_3008 ?auto_3016 ) ( not ( = ?auto_3016 ?auto_3008 ) ) ( not ( = ?auto_3016 ?auto_3009 ) ) ( not ( = ?auto_3015 ?auto_3014 ) ) ( HOIST-AT ?auto_3010 ?auto_3015 ) ( not ( = ?auto_3011 ?auto_3010 ) ) ( AVAILABLE ?auto_3010 ) ( SURFACE-AT ?auto_3009 ?auto_3015 ) ( ON ?auto_3009 ?auto_3012 ) ( CLEAR ?auto_3009 ) ( not ( = ?auto_3008 ?auto_3012 ) ) ( not ( = ?auto_3009 ?auto_3012 ) ) ( not ( = ?auto_3016 ?auto_3012 ) ) ( TRUCK-AT ?auto_3013 ?auto_3014 ) )
    :subtasks
    ( ( !DRIVE ?auto_3013 ?auto_3014 ?auto_3015 )
      ( MAKE-2CRATE ?auto_3016 ?auto_3008 ?auto_3009 )
      ( MAKE-1CRATE-VERIFY ?auto_3008 ?auto_3009 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3017 - SURFACE
      ?auto_3018 - SURFACE
      ?auto_3019 - SURFACE
    )
    :vars
    (
      ?auto_3021 - HOIST
      ?auto_3022 - PLACE
      ?auto_3023 - PLACE
      ?auto_3024 - HOIST
      ?auto_3020 - SURFACE
      ?auto_3025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3021 ?auto_3022 ) ( SURFACE-AT ?auto_3018 ?auto_3022 ) ( CLEAR ?auto_3018 ) ( IS-CRATE ?auto_3019 ) ( not ( = ?auto_3018 ?auto_3019 ) ) ( AVAILABLE ?auto_3021 ) ( ON ?auto_3018 ?auto_3017 ) ( not ( = ?auto_3017 ?auto_3018 ) ) ( not ( = ?auto_3017 ?auto_3019 ) ) ( not ( = ?auto_3023 ?auto_3022 ) ) ( HOIST-AT ?auto_3024 ?auto_3023 ) ( not ( = ?auto_3021 ?auto_3024 ) ) ( AVAILABLE ?auto_3024 ) ( SURFACE-AT ?auto_3019 ?auto_3023 ) ( ON ?auto_3019 ?auto_3020 ) ( CLEAR ?auto_3019 ) ( not ( = ?auto_3018 ?auto_3020 ) ) ( not ( = ?auto_3019 ?auto_3020 ) ) ( not ( = ?auto_3017 ?auto_3020 ) ) ( TRUCK-AT ?auto_3025 ?auto_3022 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3018 ?auto_3019 )
      ( MAKE-2CRATE-VERIFY ?auto_3017 ?auto_3018 ?auto_3019 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3026 - SURFACE
      ?auto_3027 - SURFACE
    )
    :vars
    (
      ?auto_3028 - HOIST
      ?auto_3032 - PLACE
      ?auto_3034 - SURFACE
      ?auto_3030 - PLACE
      ?auto_3029 - HOIST
      ?auto_3033 - SURFACE
      ?auto_3031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3028 ?auto_3032 ) ( IS-CRATE ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3027 ) ) ( not ( = ?auto_3034 ?auto_3026 ) ) ( not ( = ?auto_3034 ?auto_3027 ) ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( HOIST-AT ?auto_3029 ?auto_3030 ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( AVAILABLE ?auto_3029 ) ( SURFACE-AT ?auto_3027 ?auto_3030 ) ( ON ?auto_3027 ?auto_3033 ) ( CLEAR ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3033 ) ) ( not ( = ?auto_3027 ?auto_3033 ) ) ( not ( = ?auto_3034 ?auto_3033 ) ) ( TRUCK-AT ?auto_3031 ?auto_3032 ) ( SURFACE-AT ?auto_3034 ?auto_3032 ) ( CLEAR ?auto_3034 ) ( LIFTING ?auto_3028 ?auto_3026 ) ( IS-CRATE ?auto_3026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3034 ?auto_3026 )
      ( MAKE-2CRATE ?auto_3034 ?auto_3026 ?auto_3027 )
      ( MAKE-1CRATE-VERIFY ?auto_3026 ?auto_3027 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3035 - SURFACE
      ?auto_3036 - SURFACE
      ?auto_3037 - SURFACE
    )
    :vars
    (
      ?auto_3038 - HOIST
      ?auto_3041 - PLACE
      ?auto_3039 - PLACE
      ?auto_3042 - HOIST
      ?auto_3043 - SURFACE
      ?auto_3040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3038 ?auto_3041 ) ( IS-CRATE ?auto_3037 ) ( not ( = ?auto_3036 ?auto_3037 ) ) ( not ( = ?auto_3035 ?auto_3036 ) ) ( not ( = ?auto_3035 ?auto_3037 ) ) ( not ( = ?auto_3039 ?auto_3041 ) ) ( HOIST-AT ?auto_3042 ?auto_3039 ) ( not ( = ?auto_3038 ?auto_3042 ) ) ( AVAILABLE ?auto_3042 ) ( SURFACE-AT ?auto_3037 ?auto_3039 ) ( ON ?auto_3037 ?auto_3043 ) ( CLEAR ?auto_3037 ) ( not ( = ?auto_3036 ?auto_3043 ) ) ( not ( = ?auto_3037 ?auto_3043 ) ) ( not ( = ?auto_3035 ?auto_3043 ) ) ( TRUCK-AT ?auto_3040 ?auto_3041 ) ( SURFACE-AT ?auto_3035 ?auto_3041 ) ( CLEAR ?auto_3035 ) ( LIFTING ?auto_3038 ?auto_3036 ) ( IS-CRATE ?auto_3036 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3036 ?auto_3037 )
      ( MAKE-2CRATE-VERIFY ?auto_3035 ?auto_3036 ?auto_3037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3044 - SURFACE
      ?auto_3045 - SURFACE
    )
    :vars
    (
      ?auto_3052 - HOIST
      ?auto_3047 - PLACE
      ?auto_3048 - SURFACE
      ?auto_3050 - PLACE
      ?auto_3051 - HOIST
      ?auto_3049 - SURFACE
      ?auto_3046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3052 ?auto_3047 ) ( IS-CRATE ?auto_3045 ) ( not ( = ?auto_3044 ?auto_3045 ) ) ( not ( = ?auto_3048 ?auto_3044 ) ) ( not ( = ?auto_3048 ?auto_3045 ) ) ( not ( = ?auto_3050 ?auto_3047 ) ) ( HOIST-AT ?auto_3051 ?auto_3050 ) ( not ( = ?auto_3052 ?auto_3051 ) ) ( AVAILABLE ?auto_3051 ) ( SURFACE-AT ?auto_3045 ?auto_3050 ) ( ON ?auto_3045 ?auto_3049 ) ( CLEAR ?auto_3045 ) ( not ( = ?auto_3044 ?auto_3049 ) ) ( not ( = ?auto_3045 ?auto_3049 ) ) ( not ( = ?auto_3048 ?auto_3049 ) ) ( TRUCK-AT ?auto_3046 ?auto_3047 ) ( SURFACE-AT ?auto_3048 ?auto_3047 ) ( CLEAR ?auto_3048 ) ( IS-CRATE ?auto_3044 ) ( AVAILABLE ?auto_3052 ) ( IN ?auto_3044 ?auto_3046 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3052 ?auto_3044 ?auto_3046 ?auto_3047 )
      ( MAKE-2CRATE ?auto_3048 ?auto_3044 ?auto_3045 )
      ( MAKE-1CRATE-VERIFY ?auto_3044 ?auto_3045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3053 - SURFACE
      ?auto_3054 - SURFACE
      ?auto_3055 - SURFACE
    )
    :vars
    (
      ?auto_3061 - HOIST
      ?auto_3060 - PLACE
      ?auto_3057 - PLACE
      ?auto_3058 - HOIST
      ?auto_3059 - SURFACE
      ?auto_3056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3061 ?auto_3060 ) ( IS-CRATE ?auto_3055 ) ( not ( = ?auto_3054 ?auto_3055 ) ) ( not ( = ?auto_3053 ?auto_3054 ) ) ( not ( = ?auto_3053 ?auto_3055 ) ) ( not ( = ?auto_3057 ?auto_3060 ) ) ( HOIST-AT ?auto_3058 ?auto_3057 ) ( not ( = ?auto_3061 ?auto_3058 ) ) ( AVAILABLE ?auto_3058 ) ( SURFACE-AT ?auto_3055 ?auto_3057 ) ( ON ?auto_3055 ?auto_3059 ) ( CLEAR ?auto_3055 ) ( not ( = ?auto_3054 ?auto_3059 ) ) ( not ( = ?auto_3055 ?auto_3059 ) ) ( not ( = ?auto_3053 ?auto_3059 ) ) ( TRUCK-AT ?auto_3056 ?auto_3060 ) ( SURFACE-AT ?auto_3053 ?auto_3060 ) ( CLEAR ?auto_3053 ) ( IS-CRATE ?auto_3054 ) ( AVAILABLE ?auto_3061 ) ( IN ?auto_3054 ?auto_3056 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3054 ?auto_3055 )
      ( MAKE-2CRATE-VERIFY ?auto_3053 ?auto_3054 ?auto_3055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3062 - SURFACE
      ?auto_3063 - SURFACE
    )
    :vars
    (
      ?auto_3067 - HOIST
      ?auto_3066 - PLACE
      ?auto_3064 - SURFACE
      ?auto_3069 - PLACE
      ?auto_3068 - HOIST
      ?auto_3070 - SURFACE
      ?auto_3065 - TRUCK
      ?auto_3071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3067 ?auto_3066 ) ( IS-CRATE ?auto_3063 ) ( not ( = ?auto_3062 ?auto_3063 ) ) ( not ( = ?auto_3064 ?auto_3062 ) ) ( not ( = ?auto_3064 ?auto_3063 ) ) ( not ( = ?auto_3069 ?auto_3066 ) ) ( HOIST-AT ?auto_3068 ?auto_3069 ) ( not ( = ?auto_3067 ?auto_3068 ) ) ( AVAILABLE ?auto_3068 ) ( SURFACE-AT ?auto_3063 ?auto_3069 ) ( ON ?auto_3063 ?auto_3070 ) ( CLEAR ?auto_3063 ) ( not ( = ?auto_3062 ?auto_3070 ) ) ( not ( = ?auto_3063 ?auto_3070 ) ) ( not ( = ?auto_3064 ?auto_3070 ) ) ( SURFACE-AT ?auto_3064 ?auto_3066 ) ( CLEAR ?auto_3064 ) ( IS-CRATE ?auto_3062 ) ( AVAILABLE ?auto_3067 ) ( IN ?auto_3062 ?auto_3065 ) ( TRUCK-AT ?auto_3065 ?auto_3071 ) ( not ( = ?auto_3071 ?auto_3066 ) ) ( not ( = ?auto_3069 ?auto_3071 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3065 ?auto_3071 ?auto_3066 )
      ( MAKE-2CRATE ?auto_3064 ?auto_3062 ?auto_3063 )
      ( MAKE-1CRATE-VERIFY ?auto_3062 ?auto_3063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3072 - SURFACE
      ?auto_3073 - SURFACE
      ?auto_3074 - SURFACE
    )
    :vars
    (
      ?auto_3076 - HOIST
      ?auto_3078 - PLACE
      ?auto_3081 - PLACE
      ?auto_3075 - HOIST
      ?auto_3079 - SURFACE
      ?auto_3080 - TRUCK
      ?auto_3077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3076 ?auto_3078 ) ( IS-CRATE ?auto_3074 ) ( not ( = ?auto_3073 ?auto_3074 ) ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3074 ) ) ( not ( = ?auto_3081 ?auto_3078 ) ) ( HOIST-AT ?auto_3075 ?auto_3081 ) ( not ( = ?auto_3076 ?auto_3075 ) ) ( AVAILABLE ?auto_3075 ) ( SURFACE-AT ?auto_3074 ?auto_3081 ) ( ON ?auto_3074 ?auto_3079 ) ( CLEAR ?auto_3074 ) ( not ( = ?auto_3073 ?auto_3079 ) ) ( not ( = ?auto_3074 ?auto_3079 ) ) ( not ( = ?auto_3072 ?auto_3079 ) ) ( SURFACE-AT ?auto_3072 ?auto_3078 ) ( CLEAR ?auto_3072 ) ( IS-CRATE ?auto_3073 ) ( AVAILABLE ?auto_3076 ) ( IN ?auto_3073 ?auto_3080 ) ( TRUCK-AT ?auto_3080 ?auto_3077 ) ( not ( = ?auto_3077 ?auto_3078 ) ) ( not ( = ?auto_3081 ?auto_3077 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3073 ?auto_3074 )
      ( MAKE-2CRATE-VERIFY ?auto_3072 ?auto_3073 ?auto_3074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3082 - SURFACE
      ?auto_3083 - SURFACE
    )
    :vars
    (
      ?auto_3086 - HOIST
      ?auto_3090 - PLACE
      ?auto_3088 - SURFACE
      ?auto_3091 - PLACE
      ?auto_3084 - HOIST
      ?auto_3085 - SURFACE
      ?auto_3087 - TRUCK
      ?auto_3089 - PLACE
      ?auto_3092 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3086 ?auto_3090 ) ( IS-CRATE ?auto_3083 ) ( not ( = ?auto_3082 ?auto_3083 ) ) ( not ( = ?auto_3088 ?auto_3082 ) ) ( not ( = ?auto_3088 ?auto_3083 ) ) ( not ( = ?auto_3091 ?auto_3090 ) ) ( HOIST-AT ?auto_3084 ?auto_3091 ) ( not ( = ?auto_3086 ?auto_3084 ) ) ( AVAILABLE ?auto_3084 ) ( SURFACE-AT ?auto_3083 ?auto_3091 ) ( ON ?auto_3083 ?auto_3085 ) ( CLEAR ?auto_3083 ) ( not ( = ?auto_3082 ?auto_3085 ) ) ( not ( = ?auto_3083 ?auto_3085 ) ) ( not ( = ?auto_3088 ?auto_3085 ) ) ( SURFACE-AT ?auto_3088 ?auto_3090 ) ( CLEAR ?auto_3088 ) ( IS-CRATE ?auto_3082 ) ( AVAILABLE ?auto_3086 ) ( TRUCK-AT ?auto_3087 ?auto_3089 ) ( not ( = ?auto_3089 ?auto_3090 ) ) ( not ( = ?auto_3091 ?auto_3089 ) ) ( HOIST-AT ?auto_3092 ?auto_3089 ) ( LIFTING ?auto_3092 ?auto_3082 ) ( not ( = ?auto_3086 ?auto_3092 ) ) ( not ( = ?auto_3084 ?auto_3092 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3092 ?auto_3082 ?auto_3087 ?auto_3089 )
      ( MAKE-2CRATE ?auto_3088 ?auto_3082 ?auto_3083 )
      ( MAKE-1CRATE-VERIFY ?auto_3082 ?auto_3083 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3093 - SURFACE
      ?auto_3094 - SURFACE
      ?auto_3095 - SURFACE
    )
    :vars
    (
      ?auto_3099 - HOIST
      ?auto_3101 - PLACE
      ?auto_3100 - PLACE
      ?auto_3098 - HOIST
      ?auto_3102 - SURFACE
      ?auto_3096 - TRUCK
      ?auto_3097 - PLACE
      ?auto_3103 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3099 ?auto_3101 ) ( IS-CRATE ?auto_3095 ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3093 ?auto_3094 ) ) ( not ( = ?auto_3093 ?auto_3095 ) ) ( not ( = ?auto_3100 ?auto_3101 ) ) ( HOIST-AT ?auto_3098 ?auto_3100 ) ( not ( = ?auto_3099 ?auto_3098 ) ) ( AVAILABLE ?auto_3098 ) ( SURFACE-AT ?auto_3095 ?auto_3100 ) ( ON ?auto_3095 ?auto_3102 ) ( CLEAR ?auto_3095 ) ( not ( = ?auto_3094 ?auto_3102 ) ) ( not ( = ?auto_3095 ?auto_3102 ) ) ( not ( = ?auto_3093 ?auto_3102 ) ) ( SURFACE-AT ?auto_3093 ?auto_3101 ) ( CLEAR ?auto_3093 ) ( IS-CRATE ?auto_3094 ) ( AVAILABLE ?auto_3099 ) ( TRUCK-AT ?auto_3096 ?auto_3097 ) ( not ( = ?auto_3097 ?auto_3101 ) ) ( not ( = ?auto_3100 ?auto_3097 ) ) ( HOIST-AT ?auto_3103 ?auto_3097 ) ( LIFTING ?auto_3103 ?auto_3094 ) ( not ( = ?auto_3099 ?auto_3103 ) ) ( not ( = ?auto_3098 ?auto_3103 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3094 ?auto_3095 )
      ( MAKE-2CRATE-VERIFY ?auto_3093 ?auto_3094 ?auto_3095 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3104 - SURFACE
      ?auto_3105 - SURFACE
    )
    :vars
    (
      ?auto_3108 - HOIST
      ?auto_3113 - PLACE
      ?auto_3111 - SURFACE
      ?auto_3106 - PLACE
      ?auto_3114 - HOIST
      ?auto_3109 - SURFACE
      ?auto_3107 - TRUCK
      ?auto_3112 - PLACE
      ?auto_3110 - HOIST
      ?auto_3115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3108 ?auto_3113 ) ( IS-CRATE ?auto_3105 ) ( not ( = ?auto_3104 ?auto_3105 ) ) ( not ( = ?auto_3111 ?auto_3104 ) ) ( not ( = ?auto_3111 ?auto_3105 ) ) ( not ( = ?auto_3106 ?auto_3113 ) ) ( HOIST-AT ?auto_3114 ?auto_3106 ) ( not ( = ?auto_3108 ?auto_3114 ) ) ( AVAILABLE ?auto_3114 ) ( SURFACE-AT ?auto_3105 ?auto_3106 ) ( ON ?auto_3105 ?auto_3109 ) ( CLEAR ?auto_3105 ) ( not ( = ?auto_3104 ?auto_3109 ) ) ( not ( = ?auto_3105 ?auto_3109 ) ) ( not ( = ?auto_3111 ?auto_3109 ) ) ( SURFACE-AT ?auto_3111 ?auto_3113 ) ( CLEAR ?auto_3111 ) ( IS-CRATE ?auto_3104 ) ( AVAILABLE ?auto_3108 ) ( TRUCK-AT ?auto_3107 ?auto_3112 ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3106 ?auto_3112 ) ) ( HOIST-AT ?auto_3110 ?auto_3112 ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3114 ?auto_3110 ) ) ( AVAILABLE ?auto_3110 ) ( SURFACE-AT ?auto_3104 ?auto_3112 ) ( ON ?auto_3104 ?auto_3115 ) ( CLEAR ?auto_3104 ) ( not ( = ?auto_3104 ?auto_3115 ) ) ( not ( = ?auto_3105 ?auto_3115 ) ) ( not ( = ?auto_3111 ?auto_3115 ) ) ( not ( = ?auto_3109 ?auto_3115 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3110 ?auto_3104 ?auto_3115 ?auto_3112 )
      ( MAKE-2CRATE ?auto_3111 ?auto_3104 ?auto_3105 )
      ( MAKE-1CRATE-VERIFY ?auto_3104 ?auto_3105 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3116 - SURFACE
      ?auto_3117 - SURFACE
      ?auto_3118 - SURFACE
    )
    :vars
    (
      ?auto_3127 - HOIST
      ?auto_3119 - PLACE
      ?auto_3126 - PLACE
      ?auto_3123 - HOIST
      ?auto_3122 - SURFACE
      ?auto_3120 - TRUCK
      ?auto_3121 - PLACE
      ?auto_3125 - HOIST
      ?auto_3124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3127 ?auto_3119 ) ( IS-CRATE ?auto_3118 ) ( not ( = ?auto_3117 ?auto_3118 ) ) ( not ( = ?auto_3116 ?auto_3117 ) ) ( not ( = ?auto_3116 ?auto_3118 ) ) ( not ( = ?auto_3126 ?auto_3119 ) ) ( HOIST-AT ?auto_3123 ?auto_3126 ) ( not ( = ?auto_3127 ?auto_3123 ) ) ( AVAILABLE ?auto_3123 ) ( SURFACE-AT ?auto_3118 ?auto_3126 ) ( ON ?auto_3118 ?auto_3122 ) ( CLEAR ?auto_3118 ) ( not ( = ?auto_3117 ?auto_3122 ) ) ( not ( = ?auto_3118 ?auto_3122 ) ) ( not ( = ?auto_3116 ?auto_3122 ) ) ( SURFACE-AT ?auto_3116 ?auto_3119 ) ( CLEAR ?auto_3116 ) ( IS-CRATE ?auto_3117 ) ( AVAILABLE ?auto_3127 ) ( TRUCK-AT ?auto_3120 ?auto_3121 ) ( not ( = ?auto_3121 ?auto_3119 ) ) ( not ( = ?auto_3126 ?auto_3121 ) ) ( HOIST-AT ?auto_3125 ?auto_3121 ) ( not ( = ?auto_3127 ?auto_3125 ) ) ( not ( = ?auto_3123 ?auto_3125 ) ) ( AVAILABLE ?auto_3125 ) ( SURFACE-AT ?auto_3117 ?auto_3121 ) ( ON ?auto_3117 ?auto_3124 ) ( CLEAR ?auto_3117 ) ( not ( = ?auto_3117 ?auto_3124 ) ) ( not ( = ?auto_3118 ?auto_3124 ) ) ( not ( = ?auto_3116 ?auto_3124 ) ) ( not ( = ?auto_3122 ?auto_3124 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3117 ?auto_3118 )
      ( MAKE-2CRATE-VERIFY ?auto_3116 ?auto_3117 ?auto_3118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3128 - SURFACE
      ?auto_3129 - SURFACE
    )
    :vars
    (
      ?auto_3130 - HOIST
      ?auto_3131 - PLACE
      ?auto_3132 - SURFACE
      ?auto_3136 - PLACE
      ?auto_3133 - HOIST
      ?auto_3134 - SURFACE
      ?auto_3137 - PLACE
      ?auto_3138 - HOIST
      ?auto_3139 - SURFACE
      ?auto_3135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3130 ?auto_3131 ) ( IS-CRATE ?auto_3129 ) ( not ( = ?auto_3128 ?auto_3129 ) ) ( not ( = ?auto_3132 ?auto_3128 ) ) ( not ( = ?auto_3132 ?auto_3129 ) ) ( not ( = ?auto_3136 ?auto_3131 ) ) ( HOIST-AT ?auto_3133 ?auto_3136 ) ( not ( = ?auto_3130 ?auto_3133 ) ) ( AVAILABLE ?auto_3133 ) ( SURFACE-AT ?auto_3129 ?auto_3136 ) ( ON ?auto_3129 ?auto_3134 ) ( CLEAR ?auto_3129 ) ( not ( = ?auto_3128 ?auto_3134 ) ) ( not ( = ?auto_3129 ?auto_3134 ) ) ( not ( = ?auto_3132 ?auto_3134 ) ) ( SURFACE-AT ?auto_3132 ?auto_3131 ) ( CLEAR ?auto_3132 ) ( IS-CRATE ?auto_3128 ) ( AVAILABLE ?auto_3130 ) ( not ( = ?auto_3137 ?auto_3131 ) ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( HOIST-AT ?auto_3138 ?auto_3137 ) ( not ( = ?auto_3130 ?auto_3138 ) ) ( not ( = ?auto_3133 ?auto_3138 ) ) ( AVAILABLE ?auto_3138 ) ( SURFACE-AT ?auto_3128 ?auto_3137 ) ( ON ?auto_3128 ?auto_3139 ) ( CLEAR ?auto_3128 ) ( not ( = ?auto_3128 ?auto_3139 ) ) ( not ( = ?auto_3129 ?auto_3139 ) ) ( not ( = ?auto_3132 ?auto_3139 ) ) ( not ( = ?auto_3134 ?auto_3139 ) ) ( TRUCK-AT ?auto_3135 ?auto_3131 ) )
    :subtasks
    ( ( !DRIVE ?auto_3135 ?auto_3131 ?auto_3137 )
      ( MAKE-2CRATE ?auto_3132 ?auto_3128 ?auto_3129 )
      ( MAKE-1CRATE-VERIFY ?auto_3128 ?auto_3129 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3140 - SURFACE
      ?auto_3141 - SURFACE
      ?auto_3142 - SURFACE
    )
    :vars
    (
      ?auto_3144 - HOIST
      ?auto_3151 - PLACE
      ?auto_3147 - PLACE
      ?auto_3150 - HOIST
      ?auto_3143 - SURFACE
      ?auto_3146 - PLACE
      ?auto_3148 - HOIST
      ?auto_3145 - SURFACE
      ?auto_3149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3144 ?auto_3151 ) ( IS-CRATE ?auto_3142 ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3142 ) ) ( not ( = ?auto_3147 ?auto_3151 ) ) ( HOIST-AT ?auto_3150 ?auto_3147 ) ( not ( = ?auto_3144 ?auto_3150 ) ) ( AVAILABLE ?auto_3150 ) ( SURFACE-AT ?auto_3142 ?auto_3147 ) ( ON ?auto_3142 ?auto_3143 ) ( CLEAR ?auto_3142 ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3140 ?auto_3143 ) ) ( SURFACE-AT ?auto_3140 ?auto_3151 ) ( CLEAR ?auto_3140 ) ( IS-CRATE ?auto_3141 ) ( AVAILABLE ?auto_3144 ) ( not ( = ?auto_3146 ?auto_3151 ) ) ( not ( = ?auto_3147 ?auto_3146 ) ) ( HOIST-AT ?auto_3148 ?auto_3146 ) ( not ( = ?auto_3144 ?auto_3148 ) ) ( not ( = ?auto_3150 ?auto_3148 ) ) ( AVAILABLE ?auto_3148 ) ( SURFACE-AT ?auto_3141 ?auto_3146 ) ( ON ?auto_3141 ?auto_3145 ) ( CLEAR ?auto_3141 ) ( not ( = ?auto_3141 ?auto_3145 ) ) ( not ( = ?auto_3142 ?auto_3145 ) ) ( not ( = ?auto_3140 ?auto_3145 ) ) ( not ( = ?auto_3143 ?auto_3145 ) ) ( TRUCK-AT ?auto_3149 ?auto_3151 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3141 ?auto_3142 )
      ( MAKE-2CRATE-VERIFY ?auto_3140 ?auto_3141 ?auto_3142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3161 - SURFACE
      ?auto_3162 - SURFACE
    )
    :vars
    (
      ?auto_3163 - HOIST
      ?auto_3164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3163 ?auto_3164 ) ( SURFACE-AT ?auto_3161 ?auto_3164 ) ( CLEAR ?auto_3161 ) ( LIFTING ?auto_3163 ?auto_3162 ) ( IS-CRATE ?auto_3162 ) ( not ( = ?auto_3161 ?auto_3162 ) ) )
    :subtasks
    ( ( !DROP ?auto_3163 ?auto_3162 ?auto_3161 ?auto_3164 )
      ( MAKE-1CRATE-VERIFY ?auto_3161 ?auto_3162 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3165 - SURFACE
      ?auto_3166 - SURFACE
      ?auto_3167 - SURFACE
    )
    :vars
    (
      ?auto_3169 - HOIST
      ?auto_3168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3169 ?auto_3168 ) ( SURFACE-AT ?auto_3166 ?auto_3168 ) ( CLEAR ?auto_3166 ) ( LIFTING ?auto_3169 ?auto_3167 ) ( IS-CRATE ?auto_3167 ) ( not ( = ?auto_3166 ?auto_3167 ) ) ( ON ?auto_3166 ?auto_3165 ) ( not ( = ?auto_3165 ?auto_3166 ) ) ( not ( = ?auto_3165 ?auto_3167 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3166 ?auto_3167 )
      ( MAKE-2CRATE-VERIFY ?auto_3165 ?auto_3166 ?auto_3167 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3170 - SURFACE
      ?auto_3171 - SURFACE
      ?auto_3172 - SURFACE
      ?auto_3173 - SURFACE
    )
    :vars
    (
      ?auto_3175 - HOIST
      ?auto_3174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3175 ?auto_3174 ) ( SURFACE-AT ?auto_3172 ?auto_3174 ) ( CLEAR ?auto_3172 ) ( LIFTING ?auto_3175 ?auto_3173 ) ( IS-CRATE ?auto_3173 ) ( not ( = ?auto_3172 ?auto_3173 ) ) ( ON ?auto_3171 ?auto_3170 ) ( ON ?auto_3172 ?auto_3171 ) ( not ( = ?auto_3170 ?auto_3171 ) ) ( not ( = ?auto_3170 ?auto_3172 ) ) ( not ( = ?auto_3170 ?auto_3173 ) ) ( not ( = ?auto_3171 ?auto_3172 ) ) ( not ( = ?auto_3171 ?auto_3173 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3172 ?auto_3173 )
      ( MAKE-3CRATE-VERIFY ?auto_3170 ?auto_3171 ?auto_3172 ?auto_3173 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3176 - SURFACE
      ?auto_3177 - SURFACE
    )
    :vars
    (
      ?auto_3179 - HOIST
      ?auto_3178 - PLACE
      ?auto_3180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3179 ?auto_3178 ) ( SURFACE-AT ?auto_3176 ?auto_3178 ) ( CLEAR ?auto_3176 ) ( IS-CRATE ?auto_3177 ) ( not ( = ?auto_3176 ?auto_3177 ) ) ( TRUCK-AT ?auto_3180 ?auto_3178 ) ( AVAILABLE ?auto_3179 ) ( IN ?auto_3177 ?auto_3180 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3179 ?auto_3177 ?auto_3180 ?auto_3178 )
      ( MAKE-1CRATE ?auto_3176 ?auto_3177 )
      ( MAKE-1CRATE-VERIFY ?auto_3176 ?auto_3177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3181 - SURFACE
      ?auto_3182 - SURFACE
      ?auto_3183 - SURFACE
    )
    :vars
    (
      ?auto_3185 - HOIST
      ?auto_3184 - PLACE
      ?auto_3186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3185 ?auto_3184 ) ( SURFACE-AT ?auto_3182 ?auto_3184 ) ( CLEAR ?auto_3182 ) ( IS-CRATE ?auto_3183 ) ( not ( = ?auto_3182 ?auto_3183 ) ) ( TRUCK-AT ?auto_3186 ?auto_3184 ) ( AVAILABLE ?auto_3185 ) ( IN ?auto_3183 ?auto_3186 ) ( ON ?auto_3182 ?auto_3181 ) ( not ( = ?auto_3181 ?auto_3182 ) ) ( not ( = ?auto_3181 ?auto_3183 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3182 ?auto_3183 )
      ( MAKE-2CRATE-VERIFY ?auto_3181 ?auto_3182 ?auto_3183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3187 - SURFACE
      ?auto_3188 - SURFACE
      ?auto_3189 - SURFACE
      ?auto_3190 - SURFACE
    )
    :vars
    (
      ?auto_3191 - HOIST
      ?auto_3193 - PLACE
      ?auto_3192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3191 ?auto_3193 ) ( SURFACE-AT ?auto_3189 ?auto_3193 ) ( CLEAR ?auto_3189 ) ( IS-CRATE ?auto_3190 ) ( not ( = ?auto_3189 ?auto_3190 ) ) ( TRUCK-AT ?auto_3192 ?auto_3193 ) ( AVAILABLE ?auto_3191 ) ( IN ?auto_3190 ?auto_3192 ) ( ON ?auto_3189 ?auto_3188 ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3190 ) ) ( ON ?auto_3188 ?auto_3187 ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( not ( = ?auto_3187 ?auto_3190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3188 ?auto_3189 ?auto_3190 )
      ( MAKE-3CRATE-VERIFY ?auto_3187 ?auto_3188 ?auto_3189 ?auto_3190 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3194 - SURFACE
      ?auto_3195 - SURFACE
    )
    :vars
    (
      ?auto_3196 - HOIST
      ?auto_3199 - PLACE
      ?auto_3198 - TRUCK
      ?auto_3197 - SURFACE
      ?auto_3200 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3196 ?auto_3199 ) ( SURFACE-AT ?auto_3194 ?auto_3199 ) ( CLEAR ?auto_3194 ) ( IS-CRATE ?auto_3195 ) ( not ( = ?auto_3194 ?auto_3195 ) ) ( AVAILABLE ?auto_3196 ) ( IN ?auto_3195 ?auto_3198 ) ( ON ?auto_3194 ?auto_3197 ) ( not ( = ?auto_3197 ?auto_3194 ) ) ( not ( = ?auto_3197 ?auto_3195 ) ) ( TRUCK-AT ?auto_3198 ?auto_3200 ) ( not ( = ?auto_3200 ?auto_3199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3198 ?auto_3200 ?auto_3199 )
      ( MAKE-2CRATE ?auto_3197 ?auto_3194 ?auto_3195 )
      ( MAKE-1CRATE-VERIFY ?auto_3194 ?auto_3195 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3201 - SURFACE
      ?auto_3202 - SURFACE
      ?auto_3203 - SURFACE
    )
    :vars
    (
      ?auto_3205 - HOIST
      ?auto_3204 - PLACE
      ?auto_3206 - TRUCK
      ?auto_3207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3205 ?auto_3204 ) ( SURFACE-AT ?auto_3202 ?auto_3204 ) ( CLEAR ?auto_3202 ) ( IS-CRATE ?auto_3203 ) ( not ( = ?auto_3202 ?auto_3203 ) ) ( AVAILABLE ?auto_3205 ) ( IN ?auto_3203 ?auto_3206 ) ( ON ?auto_3202 ?auto_3201 ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( TRUCK-AT ?auto_3206 ?auto_3207 ) ( not ( = ?auto_3207 ?auto_3204 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3202 ?auto_3203 )
      ( MAKE-2CRATE-VERIFY ?auto_3201 ?auto_3202 ?auto_3203 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3208 - SURFACE
      ?auto_3209 - SURFACE
      ?auto_3210 - SURFACE
      ?auto_3211 - SURFACE
    )
    :vars
    (
      ?auto_3212 - HOIST
      ?auto_3214 - PLACE
      ?auto_3213 - TRUCK
      ?auto_3215 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3212 ?auto_3214 ) ( SURFACE-AT ?auto_3210 ?auto_3214 ) ( CLEAR ?auto_3210 ) ( IS-CRATE ?auto_3211 ) ( not ( = ?auto_3210 ?auto_3211 ) ) ( AVAILABLE ?auto_3212 ) ( IN ?auto_3211 ?auto_3213 ) ( ON ?auto_3210 ?auto_3209 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( not ( = ?auto_3209 ?auto_3211 ) ) ( TRUCK-AT ?auto_3213 ?auto_3215 ) ( not ( = ?auto_3215 ?auto_3214 ) ) ( ON ?auto_3209 ?auto_3208 ) ( not ( = ?auto_3208 ?auto_3209 ) ) ( not ( = ?auto_3208 ?auto_3210 ) ) ( not ( = ?auto_3208 ?auto_3211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3209 ?auto_3210 ?auto_3211 )
      ( MAKE-3CRATE-VERIFY ?auto_3208 ?auto_3209 ?auto_3210 ?auto_3211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3216 - SURFACE
      ?auto_3217 - SURFACE
    )
    :vars
    (
      ?auto_3219 - HOIST
      ?auto_3221 - PLACE
      ?auto_3218 - SURFACE
      ?auto_3220 - TRUCK
      ?auto_3222 - PLACE
      ?auto_3223 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3219 ?auto_3221 ) ( SURFACE-AT ?auto_3216 ?auto_3221 ) ( CLEAR ?auto_3216 ) ( IS-CRATE ?auto_3217 ) ( not ( = ?auto_3216 ?auto_3217 ) ) ( AVAILABLE ?auto_3219 ) ( ON ?auto_3216 ?auto_3218 ) ( not ( = ?auto_3218 ?auto_3216 ) ) ( not ( = ?auto_3218 ?auto_3217 ) ) ( TRUCK-AT ?auto_3220 ?auto_3222 ) ( not ( = ?auto_3222 ?auto_3221 ) ) ( HOIST-AT ?auto_3223 ?auto_3222 ) ( LIFTING ?auto_3223 ?auto_3217 ) ( not ( = ?auto_3219 ?auto_3223 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3223 ?auto_3217 ?auto_3220 ?auto_3222 )
      ( MAKE-2CRATE ?auto_3218 ?auto_3216 ?auto_3217 )
      ( MAKE-1CRATE-VERIFY ?auto_3216 ?auto_3217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3224 - SURFACE
      ?auto_3225 - SURFACE
      ?auto_3226 - SURFACE
    )
    :vars
    (
      ?auto_3231 - HOIST
      ?auto_3228 - PLACE
      ?auto_3227 - TRUCK
      ?auto_3230 - PLACE
      ?auto_3229 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3231 ?auto_3228 ) ( SURFACE-AT ?auto_3225 ?auto_3228 ) ( CLEAR ?auto_3225 ) ( IS-CRATE ?auto_3226 ) ( not ( = ?auto_3225 ?auto_3226 ) ) ( AVAILABLE ?auto_3231 ) ( ON ?auto_3225 ?auto_3224 ) ( not ( = ?auto_3224 ?auto_3225 ) ) ( not ( = ?auto_3224 ?auto_3226 ) ) ( TRUCK-AT ?auto_3227 ?auto_3230 ) ( not ( = ?auto_3230 ?auto_3228 ) ) ( HOIST-AT ?auto_3229 ?auto_3230 ) ( LIFTING ?auto_3229 ?auto_3226 ) ( not ( = ?auto_3231 ?auto_3229 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3225 ?auto_3226 )
      ( MAKE-2CRATE-VERIFY ?auto_3224 ?auto_3225 ?auto_3226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3232 - SURFACE
      ?auto_3233 - SURFACE
      ?auto_3234 - SURFACE
      ?auto_3235 - SURFACE
    )
    :vars
    (
      ?auto_3239 - HOIST
      ?auto_3237 - PLACE
      ?auto_3240 - TRUCK
      ?auto_3238 - PLACE
      ?auto_3236 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3239 ?auto_3237 ) ( SURFACE-AT ?auto_3234 ?auto_3237 ) ( CLEAR ?auto_3234 ) ( IS-CRATE ?auto_3235 ) ( not ( = ?auto_3234 ?auto_3235 ) ) ( AVAILABLE ?auto_3239 ) ( ON ?auto_3234 ?auto_3233 ) ( not ( = ?auto_3233 ?auto_3234 ) ) ( not ( = ?auto_3233 ?auto_3235 ) ) ( TRUCK-AT ?auto_3240 ?auto_3238 ) ( not ( = ?auto_3238 ?auto_3237 ) ) ( HOIST-AT ?auto_3236 ?auto_3238 ) ( LIFTING ?auto_3236 ?auto_3235 ) ( not ( = ?auto_3239 ?auto_3236 ) ) ( ON ?auto_3233 ?auto_3232 ) ( not ( = ?auto_3232 ?auto_3233 ) ) ( not ( = ?auto_3232 ?auto_3234 ) ) ( not ( = ?auto_3232 ?auto_3235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3233 ?auto_3234 ?auto_3235 )
      ( MAKE-3CRATE-VERIFY ?auto_3232 ?auto_3233 ?auto_3234 ?auto_3235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3241 - SURFACE
      ?auto_3242 - SURFACE
    )
    :vars
    (
      ?auto_3247 - HOIST
      ?auto_3244 - PLACE
      ?auto_3245 - SURFACE
      ?auto_3248 - TRUCK
      ?auto_3246 - PLACE
      ?auto_3243 - HOIST
      ?auto_3249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3247 ?auto_3244 ) ( SURFACE-AT ?auto_3241 ?auto_3244 ) ( CLEAR ?auto_3241 ) ( IS-CRATE ?auto_3242 ) ( not ( = ?auto_3241 ?auto_3242 ) ) ( AVAILABLE ?auto_3247 ) ( ON ?auto_3241 ?auto_3245 ) ( not ( = ?auto_3245 ?auto_3241 ) ) ( not ( = ?auto_3245 ?auto_3242 ) ) ( TRUCK-AT ?auto_3248 ?auto_3246 ) ( not ( = ?auto_3246 ?auto_3244 ) ) ( HOIST-AT ?auto_3243 ?auto_3246 ) ( not ( = ?auto_3247 ?auto_3243 ) ) ( AVAILABLE ?auto_3243 ) ( SURFACE-AT ?auto_3242 ?auto_3246 ) ( ON ?auto_3242 ?auto_3249 ) ( CLEAR ?auto_3242 ) ( not ( = ?auto_3241 ?auto_3249 ) ) ( not ( = ?auto_3242 ?auto_3249 ) ) ( not ( = ?auto_3245 ?auto_3249 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3243 ?auto_3242 ?auto_3249 ?auto_3246 )
      ( MAKE-2CRATE ?auto_3245 ?auto_3241 ?auto_3242 )
      ( MAKE-1CRATE-VERIFY ?auto_3241 ?auto_3242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3250 - SURFACE
      ?auto_3251 - SURFACE
      ?auto_3252 - SURFACE
    )
    :vars
    (
      ?auto_3257 - HOIST
      ?auto_3255 - PLACE
      ?auto_3253 - TRUCK
      ?auto_3258 - PLACE
      ?auto_3254 - HOIST
      ?auto_3256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3257 ?auto_3255 ) ( SURFACE-AT ?auto_3251 ?auto_3255 ) ( CLEAR ?auto_3251 ) ( IS-CRATE ?auto_3252 ) ( not ( = ?auto_3251 ?auto_3252 ) ) ( AVAILABLE ?auto_3257 ) ( ON ?auto_3251 ?auto_3250 ) ( not ( = ?auto_3250 ?auto_3251 ) ) ( not ( = ?auto_3250 ?auto_3252 ) ) ( TRUCK-AT ?auto_3253 ?auto_3258 ) ( not ( = ?auto_3258 ?auto_3255 ) ) ( HOIST-AT ?auto_3254 ?auto_3258 ) ( not ( = ?auto_3257 ?auto_3254 ) ) ( AVAILABLE ?auto_3254 ) ( SURFACE-AT ?auto_3252 ?auto_3258 ) ( ON ?auto_3252 ?auto_3256 ) ( CLEAR ?auto_3252 ) ( not ( = ?auto_3251 ?auto_3256 ) ) ( not ( = ?auto_3252 ?auto_3256 ) ) ( not ( = ?auto_3250 ?auto_3256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3251 ?auto_3252 )
      ( MAKE-2CRATE-VERIFY ?auto_3250 ?auto_3251 ?auto_3252 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3259 - SURFACE
      ?auto_3260 - SURFACE
      ?auto_3261 - SURFACE
      ?auto_3262 - SURFACE
    )
    :vars
    (
      ?auto_3267 - HOIST
      ?auto_3264 - PLACE
      ?auto_3268 - TRUCK
      ?auto_3263 - PLACE
      ?auto_3266 - HOIST
      ?auto_3265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3267 ?auto_3264 ) ( SURFACE-AT ?auto_3261 ?auto_3264 ) ( CLEAR ?auto_3261 ) ( IS-CRATE ?auto_3262 ) ( not ( = ?auto_3261 ?auto_3262 ) ) ( AVAILABLE ?auto_3267 ) ( ON ?auto_3261 ?auto_3260 ) ( not ( = ?auto_3260 ?auto_3261 ) ) ( not ( = ?auto_3260 ?auto_3262 ) ) ( TRUCK-AT ?auto_3268 ?auto_3263 ) ( not ( = ?auto_3263 ?auto_3264 ) ) ( HOIST-AT ?auto_3266 ?auto_3263 ) ( not ( = ?auto_3267 ?auto_3266 ) ) ( AVAILABLE ?auto_3266 ) ( SURFACE-AT ?auto_3262 ?auto_3263 ) ( ON ?auto_3262 ?auto_3265 ) ( CLEAR ?auto_3262 ) ( not ( = ?auto_3261 ?auto_3265 ) ) ( not ( = ?auto_3262 ?auto_3265 ) ) ( not ( = ?auto_3260 ?auto_3265 ) ) ( ON ?auto_3260 ?auto_3259 ) ( not ( = ?auto_3259 ?auto_3260 ) ) ( not ( = ?auto_3259 ?auto_3261 ) ) ( not ( = ?auto_3259 ?auto_3262 ) ) ( not ( = ?auto_3259 ?auto_3265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3260 ?auto_3261 ?auto_3262 )
      ( MAKE-3CRATE-VERIFY ?auto_3259 ?auto_3260 ?auto_3261 ?auto_3262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3269 - SURFACE
      ?auto_3270 - SURFACE
    )
    :vars
    (
      ?auto_3275 - HOIST
      ?auto_3272 - PLACE
      ?auto_3276 - SURFACE
      ?auto_3271 - PLACE
      ?auto_3274 - HOIST
      ?auto_3273 - SURFACE
      ?auto_3277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3275 ?auto_3272 ) ( SURFACE-AT ?auto_3269 ?auto_3272 ) ( CLEAR ?auto_3269 ) ( IS-CRATE ?auto_3270 ) ( not ( = ?auto_3269 ?auto_3270 ) ) ( AVAILABLE ?auto_3275 ) ( ON ?auto_3269 ?auto_3276 ) ( not ( = ?auto_3276 ?auto_3269 ) ) ( not ( = ?auto_3276 ?auto_3270 ) ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( HOIST-AT ?auto_3274 ?auto_3271 ) ( not ( = ?auto_3275 ?auto_3274 ) ) ( AVAILABLE ?auto_3274 ) ( SURFACE-AT ?auto_3270 ?auto_3271 ) ( ON ?auto_3270 ?auto_3273 ) ( CLEAR ?auto_3270 ) ( not ( = ?auto_3269 ?auto_3273 ) ) ( not ( = ?auto_3270 ?auto_3273 ) ) ( not ( = ?auto_3276 ?auto_3273 ) ) ( TRUCK-AT ?auto_3277 ?auto_3272 ) )
    :subtasks
    ( ( !DRIVE ?auto_3277 ?auto_3272 ?auto_3271 )
      ( MAKE-2CRATE ?auto_3276 ?auto_3269 ?auto_3270 )
      ( MAKE-1CRATE-VERIFY ?auto_3269 ?auto_3270 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3278 - SURFACE
      ?auto_3279 - SURFACE
      ?auto_3280 - SURFACE
    )
    :vars
    (
      ?auto_3285 - HOIST
      ?auto_3283 - PLACE
      ?auto_3286 - PLACE
      ?auto_3284 - HOIST
      ?auto_3282 - SURFACE
      ?auto_3281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3285 ?auto_3283 ) ( SURFACE-AT ?auto_3279 ?auto_3283 ) ( CLEAR ?auto_3279 ) ( IS-CRATE ?auto_3280 ) ( not ( = ?auto_3279 ?auto_3280 ) ) ( AVAILABLE ?auto_3285 ) ( ON ?auto_3279 ?auto_3278 ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3280 ) ) ( not ( = ?auto_3286 ?auto_3283 ) ) ( HOIST-AT ?auto_3284 ?auto_3286 ) ( not ( = ?auto_3285 ?auto_3284 ) ) ( AVAILABLE ?auto_3284 ) ( SURFACE-AT ?auto_3280 ?auto_3286 ) ( ON ?auto_3280 ?auto_3282 ) ( CLEAR ?auto_3280 ) ( not ( = ?auto_3279 ?auto_3282 ) ) ( not ( = ?auto_3280 ?auto_3282 ) ) ( not ( = ?auto_3278 ?auto_3282 ) ) ( TRUCK-AT ?auto_3281 ?auto_3283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3279 ?auto_3280 )
      ( MAKE-2CRATE-VERIFY ?auto_3278 ?auto_3279 ?auto_3280 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3287 - SURFACE
      ?auto_3288 - SURFACE
      ?auto_3289 - SURFACE
      ?auto_3290 - SURFACE
    )
    :vars
    (
      ?auto_3292 - HOIST
      ?auto_3296 - PLACE
      ?auto_3295 - PLACE
      ?auto_3291 - HOIST
      ?auto_3293 - SURFACE
      ?auto_3294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3292 ?auto_3296 ) ( SURFACE-AT ?auto_3289 ?auto_3296 ) ( CLEAR ?auto_3289 ) ( IS-CRATE ?auto_3290 ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( AVAILABLE ?auto_3292 ) ( ON ?auto_3289 ?auto_3288 ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( not ( = ?auto_3288 ?auto_3290 ) ) ( not ( = ?auto_3295 ?auto_3296 ) ) ( HOIST-AT ?auto_3291 ?auto_3295 ) ( not ( = ?auto_3292 ?auto_3291 ) ) ( AVAILABLE ?auto_3291 ) ( SURFACE-AT ?auto_3290 ?auto_3295 ) ( ON ?auto_3290 ?auto_3293 ) ( CLEAR ?auto_3290 ) ( not ( = ?auto_3289 ?auto_3293 ) ) ( not ( = ?auto_3290 ?auto_3293 ) ) ( not ( = ?auto_3288 ?auto_3293 ) ) ( TRUCK-AT ?auto_3294 ?auto_3296 ) ( ON ?auto_3288 ?auto_3287 ) ( not ( = ?auto_3287 ?auto_3288 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3288 ?auto_3289 ?auto_3290 )
      ( MAKE-3CRATE-VERIFY ?auto_3287 ?auto_3288 ?auto_3289 ?auto_3290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3297 - SURFACE
      ?auto_3298 - SURFACE
    )
    :vars
    (
      ?auto_3301 - HOIST
      ?auto_3305 - PLACE
      ?auto_3299 - SURFACE
      ?auto_3304 - PLACE
      ?auto_3300 - HOIST
      ?auto_3302 - SURFACE
      ?auto_3303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3301 ?auto_3305 ) ( IS-CRATE ?auto_3298 ) ( not ( = ?auto_3297 ?auto_3298 ) ) ( not ( = ?auto_3299 ?auto_3297 ) ) ( not ( = ?auto_3299 ?auto_3298 ) ) ( not ( = ?auto_3304 ?auto_3305 ) ) ( HOIST-AT ?auto_3300 ?auto_3304 ) ( not ( = ?auto_3301 ?auto_3300 ) ) ( AVAILABLE ?auto_3300 ) ( SURFACE-AT ?auto_3298 ?auto_3304 ) ( ON ?auto_3298 ?auto_3302 ) ( CLEAR ?auto_3298 ) ( not ( = ?auto_3297 ?auto_3302 ) ) ( not ( = ?auto_3298 ?auto_3302 ) ) ( not ( = ?auto_3299 ?auto_3302 ) ) ( TRUCK-AT ?auto_3303 ?auto_3305 ) ( SURFACE-AT ?auto_3299 ?auto_3305 ) ( CLEAR ?auto_3299 ) ( LIFTING ?auto_3301 ?auto_3297 ) ( IS-CRATE ?auto_3297 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3299 ?auto_3297 )
      ( MAKE-2CRATE ?auto_3299 ?auto_3297 ?auto_3298 )
      ( MAKE-1CRATE-VERIFY ?auto_3297 ?auto_3298 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3306 - SURFACE
      ?auto_3307 - SURFACE
      ?auto_3308 - SURFACE
    )
    :vars
    (
      ?auto_3310 - HOIST
      ?auto_3312 - PLACE
      ?auto_3314 - PLACE
      ?auto_3309 - HOIST
      ?auto_3311 - SURFACE
      ?auto_3313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3310 ?auto_3312 ) ( IS-CRATE ?auto_3308 ) ( not ( = ?auto_3307 ?auto_3308 ) ) ( not ( = ?auto_3306 ?auto_3307 ) ) ( not ( = ?auto_3306 ?auto_3308 ) ) ( not ( = ?auto_3314 ?auto_3312 ) ) ( HOIST-AT ?auto_3309 ?auto_3314 ) ( not ( = ?auto_3310 ?auto_3309 ) ) ( AVAILABLE ?auto_3309 ) ( SURFACE-AT ?auto_3308 ?auto_3314 ) ( ON ?auto_3308 ?auto_3311 ) ( CLEAR ?auto_3308 ) ( not ( = ?auto_3307 ?auto_3311 ) ) ( not ( = ?auto_3308 ?auto_3311 ) ) ( not ( = ?auto_3306 ?auto_3311 ) ) ( TRUCK-AT ?auto_3313 ?auto_3312 ) ( SURFACE-AT ?auto_3306 ?auto_3312 ) ( CLEAR ?auto_3306 ) ( LIFTING ?auto_3310 ?auto_3307 ) ( IS-CRATE ?auto_3307 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3307 ?auto_3308 )
      ( MAKE-2CRATE-VERIFY ?auto_3306 ?auto_3307 ?auto_3308 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3315 - SURFACE
      ?auto_3316 - SURFACE
      ?auto_3317 - SURFACE
      ?auto_3318 - SURFACE
    )
    :vars
    (
      ?auto_3319 - HOIST
      ?auto_3322 - PLACE
      ?auto_3324 - PLACE
      ?auto_3321 - HOIST
      ?auto_3320 - SURFACE
      ?auto_3323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3319 ?auto_3322 ) ( IS-CRATE ?auto_3318 ) ( not ( = ?auto_3317 ?auto_3318 ) ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3318 ) ) ( not ( = ?auto_3324 ?auto_3322 ) ) ( HOIST-AT ?auto_3321 ?auto_3324 ) ( not ( = ?auto_3319 ?auto_3321 ) ) ( AVAILABLE ?auto_3321 ) ( SURFACE-AT ?auto_3318 ?auto_3324 ) ( ON ?auto_3318 ?auto_3320 ) ( CLEAR ?auto_3318 ) ( not ( = ?auto_3317 ?auto_3320 ) ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( not ( = ?auto_3316 ?auto_3320 ) ) ( TRUCK-AT ?auto_3323 ?auto_3322 ) ( SURFACE-AT ?auto_3316 ?auto_3322 ) ( CLEAR ?auto_3316 ) ( LIFTING ?auto_3319 ?auto_3317 ) ( IS-CRATE ?auto_3317 ) ( ON ?auto_3316 ?auto_3315 ) ( not ( = ?auto_3315 ?auto_3316 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3318 ) ) ( not ( = ?auto_3315 ?auto_3320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3316 ?auto_3317 ?auto_3318 )
      ( MAKE-3CRATE-VERIFY ?auto_3315 ?auto_3316 ?auto_3317 ?auto_3318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3325 - SURFACE
      ?auto_3326 - SURFACE
    )
    :vars
    (
      ?auto_3327 - HOIST
      ?auto_3331 - PLACE
      ?auto_3328 - SURFACE
      ?auto_3333 - PLACE
      ?auto_3330 - HOIST
      ?auto_3329 - SURFACE
      ?auto_3332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3327 ?auto_3331 ) ( IS-CRATE ?auto_3326 ) ( not ( = ?auto_3325 ?auto_3326 ) ) ( not ( = ?auto_3328 ?auto_3325 ) ) ( not ( = ?auto_3328 ?auto_3326 ) ) ( not ( = ?auto_3333 ?auto_3331 ) ) ( HOIST-AT ?auto_3330 ?auto_3333 ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( AVAILABLE ?auto_3330 ) ( SURFACE-AT ?auto_3326 ?auto_3333 ) ( ON ?auto_3326 ?auto_3329 ) ( CLEAR ?auto_3326 ) ( not ( = ?auto_3325 ?auto_3329 ) ) ( not ( = ?auto_3326 ?auto_3329 ) ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( TRUCK-AT ?auto_3332 ?auto_3331 ) ( SURFACE-AT ?auto_3328 ?auto_3331 ) ( CLEAR ?auto_3328 ) ( IS-CRATE ?auto_3325 ) ( AVAILABLE ?auto_3327 ) ( IN ?auto_3325 ?auto_3332 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3327 ?auto_3325 ?auto_3332 ?auto_3331 )
      ( MAKE-2CRATE ?auto_3328 ?auto_3325 ?auto_3326 )
      ( MAKE-1CRATE-VERIFY ?auto_3325 ?auto_3326 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3334 - SURFACE
      ?auto_3335 - SURFACE
      ?auto_3336 - SURFACE
    )
    :vars
    (
      ?auto_3340 - HOIST
      ?auto_3339 - PLACE
      ?auto_3338 - PLACE
      ?auto_3337 - HOIST
      ?auto_3342 - SURFACE
      ?auto_3341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3340 ?auto_3339 ) ( IS-CRATE ?auto_3336 ) ( not ( = ?auto_3335 ?auto_3336 ) ) ( not ( = ?auto_3334 ?auto_3335 ) ) ( not ( = ?auto_3334 ?auto_3336 ) ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( HOIST-AT ?auto_3337 ?auto_3338 ) ( not ( = ?auto_3340 ?auto_3337 ) ) ( AVAILABLE ?auto_3337 ) ( SURFACE-AT ?auto_3336 ?auto_3338 ) ( ON ?auto_3336 ?auto_3342 ) ( CLEAR ?auto_3336 ) ( not ( = ?auto_3335 ?auto_3342 ) ) ( not ( = ?auto_3336 ?auto_3342 ) ) ( not ( = ?auto_3334 ?auto_3342 ) ) ( TRUCK-AT ?auto_3341 ?auto_3339 ) ( SURFACE-AT ?auto_3334 ?auto_3339 ) ( CLEAR ?auto_3334 ) ( IS-CRATE ?auto_3335 ) ( AVAILABLE ?auto_3340 ) ( IN ?auto_3335 ?auto_3341 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3335 ?auto_3336 )
      ( MAKE-2CRATE-VERIFY ?auto_3334 ?auto_3335 ?auto_3336 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3343 - SURFACE
      ?auto_3344 - SURFACE
      ?auto_3345 - SURFACE
      ?auto_3346 - SURFACE
    )
    :vars
    (
      ?auto_3352 - HOIST
      ?auto_3348 - PLACE
      ?auto_3350 - PLACE
      ?auto_3349 - HOIST
      ?auto_3351 - SURFACE
      ?auto_3347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3352 ?auto_3348 ) ( IS-CRATE ?auto_3346 ) ( not ( = ?auto_3345 ?auto_3346 ) ) ( not ( = ?auto_3344 ?auto_3345 ) ) ( not ( = ?auto_3344 ?auto_3346 ) ) ( not ( = ?auto_3350 ?auto_3348 ) ) ( HOIST-AT ?auto_3349 ?auto_3350 ) ( not ( = ?auto_3352 ?auto_3349 ) ) ( AVAILABLE ?auto_3349 ) ( SURFACE-AT ?auto_3346 ?auto_3350 ) ( ON ?auto_3346 ?auto_3351 ) ( CLEAR ?auto_3346 ) ( not ( = ?auto_3345 ?auto_3351 ) ) ( not ( = ?auto_3346 ?auto_3351 ) ) ( not ( = ?auto_3344 ?auto_3351 ) ) ( TRUCK-AT ?auto_3347 ?auto_3348 ) ( SURFACE-AT ?auto_3344 ?auto_3348 ) ( CLEAR ?auto_3344 ) ( IS-CRATE ?auto_3345 ) ( AVAILABLE ?auto_3352 ) ( IN ?auto_3345 ?auto_3347 ) ( ON ?auto_3344 ?auto_3343 ) ( not ( = ?auto_3343 ?auto_3344 ) ) ( not ( = ?auto_3343 ?auto_3345 ) ) ( not ( = ?auto_3343 ?auto_3346 ) ) ( not ( = ?auto_3343 ?auto_3351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3344 ?auto_3345 ?auto_3346 )
      ( MAKE-3CRATE-VERIFY ?auto_3343 ?auto_3344 ?auto_3345 ?auto_3346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3353 - SURFACE
      ?auto_3354 - SURFACE
    )
    :vars
    (
      ?auto_3361 - HOIST
      ?auto_3356 - PLACE
      ?auto_3359 - SURFACE
      ?auto_3358 - PLACE
      ?auto_3357 - HOIST
      ?auto_3360 - SURFACE
      ?auto_3355 - TRUCK
      ?auto_3362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3361 ?auto_3356 ) ( IS-CRATE ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( not ( = ?auto_3359 ?auto_3353 ) ) ( not ( = ?auto_3359 ?auto_3354 ) ) ( not ( = ?auto_3358 ?auto_3356 ) ) ( HOIST-AT ?auto_3357 ?auto_3358 ) ( not ( = ?auto_3361 ?auto_3357 ) ) ( AVAILABLE ?auto_3357 ) ( SURFACE-AT ?auto_3354 ?auto_3358 ) ( ON ?auto_3354 ?auto_3360 ) ( CLEAR ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3360 ) ) ( not ( = ?auto_3354 ?auto_3360 ) ) ( not ( = ?auto_3359 ?auto_3360 ) ) ( SURFACE-AT ?auto_3359 ?auto_3356 ) ( CLEAR ?auto_3359 ) ( IS-CRATE ?auto_3353 ) ( AVAILABLE ?auto_3361 ) ( IN ?auto_3353 ?auto_3355 ) ( TRUCK-AT ?auto_3355 ?auto_3362 ) ( not ( = ?auto_3362 ?auto_3356 ) ) ( not ( = ?auto_3358 ?auto_3362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3355 ?auto_3362 ?auto_3356 )
      ( MAKE-2CRATE ?auto_3359 ?auto_3353 ?auto_3354 )
      ( MAKE-1CRATE-VERIFY ?auto_3353 ?auto_3354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3363 - SURFACE
      ?auto_3364 - SURFACE
      ?auto_3365 - SURFACE
    )
    :vars
    (
      ?auto_3371 - HOIST
      ?auto_3366 - PLACE
      ?auto_3370 - PLACE
      ?auto_3372 - HOIST
      ?auto_3368 - SURFACE
      ?auto_3369 - TRUCK
      ?auto_3367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3371 ?auto_3366 ) ( IS-CRATE ?auto_3365 ) ( not ( = ?auto_3364 ?auto_3365 ) ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( not ( = ?auto_3363 ?auto_3365 ) ) ( not ( = ?auto_3370 ?auto_3366 ) ) ( HOIST-AT ?auto_3372 ?auto_3370 ) ( not ( = ?auto_3371 ?auto_3372 ) ) ( AVAILABLE ?auto_3372 ) ( SURFACE-AT ?auto_3365 ?auto_3370 ) ( ON ?auto_3365 ?auto_3368 ) ( CLEAR ?auto_3365 ) ( not ( = ?auto_3364 ?auto_3368 ) ) ( not ( = ?auto_3365 ?auto_3368 ) ) ( not ( = ?auto_3363 ?auto_3368 ) ) ( SURFACE-AT ?auto_3363 ?auto_3366 ) ( CLEAR ?auto_3363 ) ( IS-CRATE ?auto_3364 ) ( AVAILABLE ?auto_3371 ) ( IN ?auto_3364 ?auto_3369 ) ( TRUCK-AT ?auto_3369 ?auto_3367 ) ( not ( = ?auto_3367 ?auto_3366 ) ) ( not ( = ?auto_3370 ?auto_3367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3364 ?auto_3365 )
      ( MAKE-2CRATE-VERIFY ?auto_3363 ?auto_3364 ?auto_3365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3373 - SURFACE
      ?auto_3374 - SURFACE
      ?auto_3375 - SURFACE
      ?auto_3376 - SURFACE
    )
    :vars
    (
      ?auto_3381 - HOIST
      ?auto_3377 - PLACE
      ?auto_3378 - PLACE
      ?auto_3382 - HOIST
      ?auto_3383 - SURFACE
      ?auto_3379 - TRUCK
      ?auto_3380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3381 ?auto_3377 ) ( IS-CRATE ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3378 ?auto_3377 ) ) ( HOIST-AT ?auto_3382 ?auto_3378 ) ( not ( = ?auto_3381 ?auto_3382 ) ) ( AVAILABLE ?auto_3382 ) ( SURFACE-AT ?auto_3376 ?auto_3378 ) ( ON ?auto_3376 ?auto_3383 ) ( CLEAR ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3383 ) ) ( not ( = ?auto_3376 ?auto_3383 ) ) ( not ( = ?auto_3374 ?auto_3383 ) ) ( SURFACE-AT ?auto_3374 ?auto_3377 ) ( CLEAR ?auto_3374 ) ( IS-CRATE ?auto_3375 ) ( AVAILABLE ?auto_3381 ) ( IN ?auto_3375 ?auto_3379 ) ( TRUCK-AT ?auto_3379 ?auto_3380 ) ( not ( = ?auto_3380 ?auto_3377 ) ) ( not ( = ?auto_3378 ?auto_3380 ) ) ( ON ?auto_3374 ?auto_3373 ) ( not ( = ?auto_3373 ?auto_3374 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3376 ) ) ( not ( = ?auto_3373 ?auto_3383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3374 ?auto_3375 ?auto_3376 )
      ( MAKE-3CRATE-VERIFY ?auto_3373 ?auto_3374 ?auto_3375 ?auto_3376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3384 - SURFACE
      ?auto_3385 - SURFACE
    )
    :vars
    (
      ?auto_3391 - HOIST
      ?auto_3386 - PLACE
      ?auto_3390 - SURFACE
      ?auto_3387 - PLACE
      ?auto_3392 - HOIST
      ?auto_3393 - SURFACE
      ?auto_3388 - TRUCK
      ?auto_3389 - PLACE
      ?auto_3394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3391 ?auto_3386 ) ( IS-CRATE ?auto_3385 ) ( not ( = ?auto_3384 ?auto_3385 ) ) ( not ( = ?auto_3390 ?auto_3384 ) ) ( not ( = ?auto_3390 ?auto_3385 ) ) ( not ( = ?auto_3387 ?auto_3386 ) ) ( HOIST-AT ?auto_3392 ?auto_3387 ) ( not ( = ?auto_3391 ?auto_3392 ) ) ( AVAILABLE ?auto_3392 ) ( SURFACE-AT ?auto_3385 ?auto_3387 ) ( ON ?auto_3385 ?auto_3393 ) ( CLEAR ?auto_3385 ) ( not ( = ?auto_3384 ?auto_3393 ) ) ( not ( = ?auto_3385 ?auto_3393 ) ) ( not ( = ?auto_3390 ?auto_3393 ) ) ( SURFACE-AT ?auto_3390 ?auto_3386 ) ( CLEAR ?auto_3390 ) ( IS-CRATE ?auto_3384 ) ( AVAILABLE ?auto_3391 ) ( TRUCK-AT ?auto_3388 ?auto_3389 ) ( not ( = ?auto_3389 ?auto_3386 ) ) ( not ( = ?auto_3387 ?auto_3389 ) ) ( HOIST-AT ?auto_3394 ?auto_3389 ) ( LIFTING ?auto_3394 ?auto_3384 ) ( not ( = ?auto_3391 ?auto_3394 ) ) ( not ( = ?auto_3392 ?auto_3394 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3394 ?auto_3384 ?auto_3388 ?auto_3389 )
      ( MAKE-2CRATE ?auto_3390 ?auto_3384 ?auto_3385 )
      ( MAKE-1CRATE-VERIFY ?auto_3384 ?auto_3385 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3395 - SURFACE
      ?auto_3396 - SURFACE
      ?auto_3397 - SURFACE
    )
    :vars
    (
      ?auto_3399 - HOIST
      ?auto_3400 - PLACE
      ?auto_3402 - PLACE
      ?auto_3398 - HOIST
      ?auto_3401 - SURFACE
      ?auto_3404 - TRUCK
      ?auto_3405 - PLACE
      ?auto_3403 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3399 ?auto_3400 ) ( IS-CRATE ?auto_3397 ) ( not ( = ?auto_3396 ?auto_3397 ) ) ( not ( = ?auto_3395 ?auto_3396 ) ) ( not ( = ?auto_3395 ?auto_3397 ) ) ( not ( = ?auto_3402 ?auto_3400 ) ) ( HOIST-AT ?auto_3398 ?auto_3402 ) ( not ( = ?auto_3399 ?auto_3398 ) ) ( AVAILABLE ?auto_3398 ) ( SURFACE-AT ?auto_3397 ?auto_3402 ) ( ON ?auto_3397 ?auto_3401 ) ( CLEAR ?auto_3397 ) ( not ( = ?auto_3396 ?auto_3401 ) ) ( not ( = ?auto_3397 ?auto_3401 ) ) ( not ( = ?auto_3395 ?auto_3401 ) ) ( SURFACE-AT ?auto_3395 ?auto_3400 ) ( CLEAR ?auto_3395 ) ( IS-CRATE ?auto_3396 ) ( AVAILABLE ?auto_3399 ) ( TRUCK-AT ?auto_3404 ?auto_3405 ) ( not ( = ?auto_3405 ?auto_3400 ) ) ( not ( = ?auto_3402 ?auto_3405 ) ) ( HOIST-AT ?auto_3403 ?auto_3405 ) ( LIFTING ?auto_3403 ?auto_3396 ) ( not ( = ?auto_3399 ?auto_3403 ) ) ( not ( = ?auto_3398 ?auto_3403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3396 ?auto_3397 )
      ( MAKE-2CRATE-VERIFY ?auto_3395 ?auto_3396 ?auto_3397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3406 - SURFACE
      ?auto_3407 - SURFACE
      ?auto_3408 - SURFACE
      ?auto_3409 - SURFACE
    )
    :vars
    (
      ?auto_3411 - HOIST
      ?auto_3410 - PLACE
      ?auto_3414 - PLACE
      ?auto_3417 - HOIST
      ?auto_3415 - SURFACE
      ?auto_3413 - TRUCK
      ?auto_3412 - PLACE
      ?auto_3416 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3411 ?auto_3410 ) ( IS-CRATE ?auto_3409 ) ( not ( = ?auto_3408 ?auto_3409 ) ) ( not ( = ?auto_3407 ?auto_3408 ) ) ( not ( = ?auto_3407 ?auto_3409 ) ) ( not ( = ?auto_3414 ?auto_3410 ) ) ( HOIST-AT ?auto_3417 ?auto_3414 ) ( not ( = ?auto_3411 ?auto_3417 ) ) ( AVAILABLE ?auto_3417 ) ( SURFACE-AT ?auto_3409 ?auto_3414 ) ( ON ?auto_3409 ?auto_3415 ) ( CLEAR ?auto_3409 ) ( not ( = ?auto_3408 ?auto_3415 ) ) ( not ( = ?auto_3409 ?auto_3415 ) ) ( not ( = ?auto_3407 ?auto_3415 ) ) ( SURFACE-AT ?auto_3407 ?auto_3410 ) ( CLEAR ?auto_3407 ) ( IS-CRATE ?auto_3408 ) ( AVAILABLE ?auto_3411 ) ( TRUCK-AT ?auto_3413 ?auto_3412 ) ( not ( = ?auto_3412 ?auto_3410 ) ) ( not ( = ?auto_3414 ?auto_3412 ) ) ( HOIST-AT ?auto_3416 ?auto_3412 ) ( LIFTING ?auto_3416 ?auto_3408 ) ( not ( = ?auto_3411 ?auto_3416 ) ) ( not ( = ?auto_3417 ?auto_3416 ) ) ( ON ?auto_3407 ?auto_3406 ) ( not ( = ?auto_3406 ?auto_3407 ) ) ( not ( = ?auto_3406 ?auto_3408 ) ) ( not ( = ?auto_3406 ?auto_3409 ) ) ( not ( = ?auto_3406 ?auto_3415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3407 ?auto_3408 ?auto_3409 )
      ( MAKE-3CRATE-VERIFY ?auto_3406 ?auto_3407 ?auto_3408 ?auto_3409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3418 - SURFACE
      ?auto_3419 - SURFACE
    )
    :vars
    (
      ?auto_3421 - HOIST
      ?auto_3420 - PLACE
      ?auto_3425 - SURFACE
      ?auto_3424 - PLACE
      ?auto_3428 - HOIST
      ?auto_3426 - SURFACE
      ?auto_3423 - TRUCK
      ?auto_3422 - PLACE
      ?auto_3427 - HOIST
      ?auto_3429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3421 ?auto_3420 ) ( IS-CRATE ?auto_3419 ) ( not ( = ?auto_3418 ?auto_3419 ) ) ( not ( = ?auto_3425 ?auto_3418 ) ) ( not ( = ?auto_3425 ?auto_3419 ) ) ( not ( = ?auto_3424 ?auto_3420 ) ) ( HOIST-AT ?auto_3428 ?auto_3424 ) ( not ( = ?auto_3421 ?auto_3428 ) ) ( AVAILABLE ?auto_3428 ) ( SURFACE-AT ?auto_3419 ?auto_3424 ) ( ON ?auto_3419 ?auto_3426 ) ( CLEAR ?auto_3419 ) ( not ( = ?auto_3418 ?auto_3426 ) ) ( not ( = ?auto_3419 ?auto_3426 ) ) ( not ( = ?auto_3425 ?auto_3426 ) ) ( SURFACE-AT ?auto_3425 ?auto_3420 ) ( CLEAR ?auto_3425 ) ( IS-CRATE ?auto_3418 ) ( AVAILABLE ?auto_3421 ) ( TRUCK-AT ?auto_3423 ?auto_3422 ) ( not ( = ?auto_3422 ?auto_3420 ) ) ( not ( = ?auto_3424 ?auto_3422 ) ) ( HOIST-AT ?auto_3427 ?auto_3422 ) ( not ( = ?auto_3421 ?auto_3427 ) ) ( not ( = ?auto_3428 ?auto_3427 ) ) ( AVAILABLE ?auto_3427 ) ( SURFACE-AT ?auto_3418 ?auto_3422 ) ( ON ?auto_3418 ?auto_3429 ) ( CLEAR ?auto_3418 ) ( not ( = ?auto_3418 ?auto_3429 ) ) ( not ( = ?auto_3419 ?auto_3429 ) ) ( not ( = ?auto_3425 ?auto_3429 ) ) ( not ( = ?auto_3426 ?auto_3429 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3427 ?auto_3418 ?auto_3429 ?auto_3422 )
      ( MAKE-2CRATE ?auto_3425 ?auto_3418 ?auto_3419 )
      ( MAKE-1CRATE-VERIFY ?auto_3418 ?auto_3419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3430 - SURFACE
      ?auto_3431 - SURFACE
      ?auto_3432 - SURFACE
    )
    :vars
    (
      ?auto_3437 - HOIST
      ?auto_3436 - PLACE
      ?auto_3434 - PLACE
      ?auto_3433 - HOIST
      ?auto_3441 - SURFACE
      ?auto_3440 - TRUCK
      ?auto_3435 - PLACE
      ?auto_3439 - HOIST
      ?auto_3438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3437 ?auto_3436 ) ( IS-CRATE ?auto_3432 ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( not ( = ?auto_3434 ?auto_3436 ) ) ( HOIST-AT ?auto_3433 ?auto_3434 ) ( not ( = ?auto_3437 ?auto_3433 ) ) ( AVAILABLE ?auto_3433 ) ( SURFACE-AT ?auto_3432 ?auto_3434 ) ( ON ?auto_3432 ?auto_3441 ) ( CLEAR ?auto_3432 ) ( not ( = ?auto_3431 ?auto_3441 ) ) ( not ( = ?auto_3432 ?auto_3441 ) ) ( not ( = ?auto_3430 ?auto_3441 ) ) ( SURFACE-AT ?auto_3430 ?auto_3436 ) ( CLEAR ?auto_3430 ) ( IS-CRATE ?auto_3431 ) ( AVAILABLE ?auto_3437 ) ( TRUCK-AT ?auto_3440 ?auto_3435 ) ( not ( = ?auto_3435 ?auto_3436 ) ) ( not ( = ?auto_3434 ?auto_3435 ) ) ( HOIST-AT ?auto_3439 ?auto_3435 ) ( not ( = ?auto_3437 ?auto_3439 ) ) ( not ( = ?auto_3433 ?auto_3439 ) ) ( AVAILABLE ?auto_3439 ) ( SURFACE-AT ?auto_3431 ?auto_3435 ) ( ON ?auto_3431 ?auto_3438 ) ( CLEAR ?auto_3431 ) ( not ( = ?auto_3431 ?auto_3438 ) ) ( not ( = ?auto_3432 ?auto_3438 ) ) ( not ( = ?auto_3430 ?auto_3438 ) ) ( not ( = ?auto_3441 ?auto_3438 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3431 ?auto_3432 )
      ( MAKE-2CRATE-VERIFY ?auto_3430 ?auto_3431 ?auto_3432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3442 - SURFACE
      ?auto_3443 - SURFACE
      ?auto_3444 - SURFACE
      ?auto_3445 - SURFACE
    )
    :vars
    (
      ?auto_3447 - HOIST
      ?auto_3451 - PLACE
      ?auto_3453 - PLACE
      ?auto_3454 - HOIST
      ?auto_3452 - SURFACE
      ?auto_3448 - TRUCK
      ?auto_3450 - PLACE
      ?auto_3446 - HOIST
      ?auto_3449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3447 ?auto_3451 ) ( IS-CRATE ?auto_3445 ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3445 ) ) ( not ( = ?auto_3453 ?auto_3451 ) ) ( HOIST-AT ?auto_3454 ?auto_3453 ) ( not ( = ?auto_3447 ?auto_3454 ) ) ( AVAILABLE ?auto_3454 ) ( SURFACE-AT ?auto_3445 ?auto_3453 ) ( ON ?auto_3445 ?auto_3452 ) ( CLEAR ?auto_3445 ) ( not ( = ?auto_3444 ?auto_3452 ) ) ( not ( = ?auto_3445 ?auto_3452 ) ) ( not ( = ?auto_3443 ?auto_3452 ) ) ( SURFACE-AT ?auto_3443 ?auto_3451 ) ( CLEAR ?auto_3443 ) ( IS-CRATE ?auto_3444 ) ( AVAILABLE ?auto_3447 ) ( TRUCK-AT ?auto_3448 ?auto_3450 ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( not ( = ?auto_3453 ?auto_3450 ) ) ( HOIST-AT ?auto_3446 ?auto_3450 ) ( not ( = ?auto_3447 ?auto_3446 ) ) ( not ( = ?auto_3454 ?auto_3446 ) ) ( AVAILABLE ?auto_3446 ) ( SURFACE-AT ?auto_3444 ?auto_3450 ) ( ON ?auto_3444 ?auto_3449 ) ( CLEAR ?auto_3444 ) ( not ( = ?auto_3444 ?auto_3449 ) ) ( not ( = ?auto_3445 ?auto_3449 ) ) ( not ( = ?auto_3443 ?auto_3449 ) ) ( not ( = ?auto_3452 ?auto_3449 ) ) ( ON ?auto_3443 ?auto_3442 ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3442 ?auto_3452 ) ) ( not ( = ?auto_3442 ?auto_3449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3443 ?auto_3444 ?auto_3445 )
      ( MAKE-3CRATE-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3455 - SURFACE
      ?auto_3456 - SURFACE
    )
    :vars
    (
      ?auto_3458 - HOIST
      ?auto_3462 - PLACE
      ?auto_3463 - SURFACE
      ?auto_3465 - PLACE
      ?auto_3466 - HOIST
      ?auto_3464 - SURFACE
      ?auto_3461 - PLACE
      ?auto_3457 - HOIST
      ?auto_3460 - SURFACE
      ?auto_3459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3458 ?auto_3462 ) ( IS-CRATE ?auto_3456 ) ( not ( = ?auto_3455 ?auto_3456 ) ) ( not ( = ?auto_3463 ?auto_3455 ) ) ( not ( = ?auto_3463 ?auto_3456 ) ) ( not ( = ?auto_3465 ?auto_3462 ) ) ( HOIST-AT ?auto_3466 ?auto_3465 ) ( not ( = ?auto_3458 ?auto_3466 ) ) ( AVAILABLE ?auto_3466 ) ( SURFACE-AT ?auto_3456 ?auto_3465 ) ( ON ?auto_3456 ?auto_3464 ) ( CLEAR ?auto_3456 ) ( not ( = ?auto_3455 ?auto_3464 ) ) ( not ( = ?auto_3456 ?auto_3464 ) ) ( not ( = ?auto_3463 ?auto_3464 ) ) ( SURFACE-AT ?auto_3463 ?auto_3462 ) ( CLEAR ?auto_3463 ) ( IS-CRATE ?auto_3455 ) ( AVAILABLE ?auto_3458 ) ( not ( = ?auto_3461 ?auto_3462 ) ) ( not ( = ?auto_3465 ?auto_3461 ) ) ( HOIST-AT ?auto_3457 ?auto_3461 ) ( not ( = ?auto_3458 ?auto_3457 ) ) ( not ( = ?auto_3466 ?auto_3457 ) ) ( AVAILABLE ?auto_3457 ) ( SURFACE-AT ?auto_3455 ?auto_3461 ) ( ON ?auto_3455 ?auto_3460 ) ( CLEAR ?auto_3455 ) ( not ( = ?auto_3455 ?auto_3460 ) ) ( not ( = ?auto_3456 ?auto_3460 ) ) ( not ( = ?auto_3463 ?auto_3460 ) ) ( not ( = ?auto_3464 ?auto_3460 ) ) ( TRUCK-AT ?auto_3459 ?auto_3462 ) )
    :subtasks
    ( ( !DRIVE ?auto_3459 ?auto_3462 ?auto_3461 )
      ( MAKE-2CRATE ?auto_3463 ?auto_3455 ?auto_3456 )
      ( MAKE-1CRATE-VERIFY ?auto_3455 ?auto_3456 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3467 - SURFACE
      ?auto_3468 - SURFACE
      ?auto_3469 - SURFACE
    )
    :vars
    (
      ?auto_3476 - HOIST
      ?auto_3473 - PLACE
      ?auto_3474 - PLACE
      ?auto_3472 - HOIST
      ?auto_3470 - SURFACE
      ?auto_3478 - PLACE
      ?auto_3471 - HOIST
      ?auto_3477 - SURFACE
      ?auto_3475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3476 ?auto_3473 ) ( IS-CRATE ?auto_3469 ) ( not ( = ?auto_3468 ?auto_3469 ) ) ( not ( = ?auto_3467 ?auto_3468 ) ) ( not ( = ?auto_3467 ?auto_3469 ) ) ( not ( = ?auto_3474 ?auto_3473 ) ) ( HOIST-AT ?auto_3472 ?auto_3474 ) ( not ( = ?auto_3476 ?auto_3472 ) ) ( AVAILABLE ?auto_3472 ) ( SURFACE-AT ?auto_3469 ?auto_3474 ) ( ON ?auto_3469 ?auto_3470 ) ( CLEAR ?auto_3469 ) ( not ( = ?auto_3468 ?auto_3470 ) ) ( not ( = ?auto_3469 ?auto_3470 ) ) ( not ( = ?auto_3467 ?auto_3470 ) ) ( SURFACE-AT ?auto_3467 ?auto_3473 ) ( CLEAR ?auto_3467 ) ( IS-CRATE ?auto_3468 ) ( AVAILABLE ?auto_3476 ) ( not ( = ?auto_3478 ?auto_3473 ) ) ( not ( = ?auto_3474 ?auto_3478 ) ) ( HOIST-AT ?auto_3471 ?auto_3478 ) ( not ( = ?auto_3476 ?auto_3471 ) ) ( not ( = ?auto_3472 ?auto_3471 ) ) ( AVAILABLE ?auto_3471 ) ( SURFACE-AT ?auto_3468 ?auto_3478 ) ( ON ?auto_3468 ?auto_3477 ) ( CLEAR ?auto_3468 ) ( not ( = ?auto_3468 ?auto_3477 ) ) ( not ( = ?auto_3469 ?auto_3477 ) ) ( not ( = ?auto_3467 ?auto_3477 ) ) ( not ( = ?auto_3470 ?auto_3477 ) ) ( TRUCK-AT ?auto_3475 ?auto_3473 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3468 ?auto_3469 )
      ( MAKE-2CRATE-VERIFY ?auto_3467 ?auto_3468 ?auto_3469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3479 - SURFACE
      ?auto_3480 - SURFACE
      ?auto_3481 - SURFACE
      ?auto_3482 - SURFACE
    )
    :vars
    (
      ?auto_3489 - HOIST
      ?auto_3483 - PLACE
      ?auto_3487 - PLACE
      ?auto_3488 - HOIST
      ?auto_3491 - SURFACE
      ?auto_3484 - PLACE
      ?auto_3486 - HOIST
      ?auto_3485 - SURFACE
      ?auto_3490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3489 ?auto_3483 ) ( IS-CRATE ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( not ( = ?auto_3480 ?auto_3482 ) ) ( not ( = ?auto_3487 ?auto_3483 ) ) ( HOIST-AT ?auto_3488 ?auto_3487 ) ( not ( = ?auto_3489 ?auto_3488 ) ) ( AVAILABLE ?auto_3488 ) ( SURFACE-AT ?auto_3482 ?auto_3487 ) ( ON ?auto_3482 ?auto_3491 ) ( CLEAR ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3491 ) ) ( not ( = ?auto_3482 ?auto_3491 ) ) ( not ( = ?auto_3480 ?auto_3491 ) ) ( SURFACE-AT ?auto_3480 ?auto_3483 ) ( CLEAR ?auto_3480 ) ( IS-CRATE ?auto_3481 ) ( AVAILABLE ?auto_3489 ) ( not ( = ?auto_3484 ?auto_3483 ) ) ( not ( = ?auto_3487 ?auto_3484 ) ) ( HOIST-AT ?auto_3486 ?auto_3484 ) ( not ( = ?auto_3489 ?auto_3486 ) ) ( not ( = ?auto_3488 ?auto_3486 ) ) ( AVAILABLE ?auto_3486 ) ( SURFACE-AT ?auto_3481 ?auto_3484 ) ( ON ?auto_3481 ?auto_3485 ) ( CLEAR ?auto_3481 ) ( not ( = ?auto_3481 ?auto_3485 ) ) ( not ( = ?auto_3482 ?auto_3485 ) ) ( not ( = ?auto_3480 ?auto_3485 ) ) ( not ( = ?auto_3491 ?auto_3485 ) ) ( TRUCK-AT ?auto_3490 ?auto_3483 ) ( ON ?auto_3480 ?auto_3479 ) ( not ( = ?auto_3479 ?auto_3480 ) ) ( not ( = ?auto_3479 ?auto_3481 ) ) ( not ( = ?auto_3479 ?auto_3482 ) ) ( not ( = ?auto_3479 ?auto_3491 ) ) ( not ( = ?auto_3479 ?auto_3485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3480 ?auto_3481 ?auto_3482 )
      ( MAKE-3CRATE-VERIFY ?auto_3479 ?auto_3480 ?auto_3481 ?auto_3482 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3492 - SURFACE
      ?auto_3493 - SURFACE
    )
    :vars
    (
      ?auto_3501 - HOIST
      ?auto_3494 - PLACE
      ?auto_3500 - SURFACE
      ?auto_3498 - PLACE
      ?auto_3499 - HOIST
      ?auto_3503 - SURFACE
      ?auto_3495 - PLACE
      ?auto_3497 - HOIST
      ?auto_3496 - SURFACE
      ?auto_3502 - TRUCK
      ?auto_3504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3501 ?auto_3494 ) ( IS-CRATE ?auto_3493 ) ( not ( = ?auto_3492 ?auto_3493 ) ) ( not ( = ?auto_3500 ?auto_3492 ) ) ( not ( = ?auto_3500 ?auto_3493 ) ) ( not ( = ?auto_3498 ?auto_3494 ) ) ( HOIST-AT ?auto_3499 ?auto_3498 ) ( not ( = ?auto_3501 ?auto_3499 ) ) ( AVAILABLE ?auto_3499 ) ( SURFACE-AT ?auto_3493 ?auto_3498 ) ( ON ?auto_3493 ?auto_3503 ) ( CLEAR ?auto_3493 ) ( not ( = ?auto_3492 ?auto_3503 ) ) ( not ( = ?auto_3493 ?auto_3503 ) ) ( not ( = ?auto_3500 ?auto_3503 ) ) ( IS-CRATE ?auto_3492 ) ( not ( = ?auto_3495 ?auto_3494 ) ) ( not ( = ?auto_3498 ?auto_3495 ) ) ( HOIST-AT ?auto_3497 ?auto_3495 ) ( not ( = ?auto_3501 ?auto_3497 ) ) ( not ( = ?auto_3499 ?auto_3497 ) ) ( AVAILABLE ?auto_3497 ) ( SURFACE-AT ?auto_3492 ?auto_3495 ) ( ON ?auto_3492 ?auto_3496 ) ( CLEAR ?auto_3492 ) ( not ( = ?auto_3492 ?auto_3496 ) ) ( not ( = ?auto_3493 ?auto_3496 ) ) ( not ( = ?auto_3500 ?auto_3496 ) ) ( not ( = ?auto_3503 ?auto_3496 ) ) ( TRUCK-AT ?auto_3502 ?auto_3494 ) ( SURFACE-AT ?auto_3504 ?auto_3494 ) ( CLEAR ?auto_3504 ) ( LIFTING ?auto_3501 ?auto_3500 ) ( IS-CRATE ?auto_3500 ) ( not ( = ?auto_3504 ?auto_3500 ) ) ( not ( = ?auto_3492 ?auto_3504 ) ) ( not ( = ?auto_3493 ?auto_3504 ) ) ( not ( = ?auto_3503 ?auto_3504 ) ) ( not ( = ?auto_3496 ?auto_3504 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3504 ?auto_3500 )
      ( MAKE-2CRATE ?auto_3500 ?auto_3492 ?auto_3493 )
      ( MAKE-1CRATE-VERIFY ?auto_3492 ?auto_3493 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3505 - SURFACE
      ?auto_3506 - SURFACE
      ?auto_3507 - SURFACE
    )
    :vars
    (
      ?auto_3511 - HOIST
      ?auto_3517 - PLACE
      ?auto_3509 - PLACE
      ?auto_3514 - HOIST
      ?auto_3515 - SURFACE
      ?auto_3508 - PLACE
      ?auto_3513 - HOIST
      ?auto_3516 - SURFACE
      ?auto_3510 - TRUCK
      ?auto_3512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3511 ?auto_3517 ) ( IS-CRATE ?auto_3507 ) ( not ( = ?auto_3506 ?auto_3507 ) ) ( not ( = ?auto_3505 ?auto_3506 ) ) ( not ( = ?auto_3505 ?auto_3507 ) ) ( not ( = ?auto_3509 ?auto_3517 ) ) ( HOIST-AT ?auto_3514 ?auto_3509 ) ( not ( = ?auto_3511 ?auto_3514 ) ) ( AVAILABLE ?auto_3514 ) ( SURFACE-AT ?auto_3507 ?auto_3509 ) ( ON ?auto_3507 ?auto_3515 ) ( CLEAR ?auto_3507 ) ( not ( = ?auto_3506 ?auto_3515 ) ) ( not ( = ?auto_3507 ?auto_3515 ) ) ( not ( = ?auto_3505 ?auto_3515 ) ) ( IS-CRATE ?auto_3506 ) ( not ( = ?auto_3508 ?auto_3517 ) ) ( not ( = ?auto_3509 ?auto_3508 ) ) ( HOIST-AT ?auto_3513 ?auto_3508 ) ( not ( = ?auto_3511 ?auto_3513 ) ) ( not ( = ?auto_3514 ?auto_3513 ) ) ( AVAILABLE ?auto_3513 ) ( SURFACE-AT ?auto_3506 ?auto_3508 ) ( ON ?auto_3506 ?auto_3516 ) ( CLEAR ?auto_3506 ) ( not ( = ?auto_3506 ?auto_3516 ) ) ( not ( = ?auto_3507 ?auto_3516 ) ) ( not ( = ?auto_3505 ?auto_3516 ) ) ( not ( = ?auto_3515 ?auto_3516 ) ) ( TRUCK-AT ?auto_3510 ?auto_3517 ) ( SURFACE-AT ?auto_3512 ?auto_3517 ) ( CLEAR ?auto_3512 ) ( LIFTING ?auto_3511 ?auto_3505 ) ( IS-CRATE ?auto_3505 ) ( not ( = ?auto_3512 ?auto_3505 ) ) ( not ( = ?auto_3506 ?auto_3512 ) ) ( not ( = ?auto_3507 ?auto_3512 ) ) ( not ( = ?auto_3515 ?auto_3512 ) ) ( not ( = ?auto_3516 ?auto_3512 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3506 ?auto_3507 )
      ( MAKE-2CRATE-VERIFY ?auto_3505 ?auto_3506 ?auto_3507 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3518 - SURFACE
      ?auto_3519 - SURFACE
      ?auto_3520 - SURFACE
      ?auto_3521 - SURFACE
    )
    :vars
    (
      ?auto_3527 - HOIST
      ?auto_3522 - PLACE
      ?auto_3530 - PLACE
      ?auto_3526 - HOIST
      ?auto_3523 - SURFACE
      ?auto_3524 - PLACE
      ?auto_3529 - HOIST
      ?auto_3528 - SURFACE
      ?auto_3525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3527 ?auto_3522 ) ( IS-CRATE ?auto_3521 ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( not ( = ?auto_3519 ?auto_3520 ) ) ( not ( = ?auto_3519 ?auto_3521 ) ) ( not ( = ?auto_3530 ?auto_3522 ) ) ( HOIST-AT ?auto_3526 ?auto_3530 ) ( not ( = ?auto_3527 ?auto_3526 ) ) ( AVAILABLE ?auto_3526 ) ( SURFACE-AT ?auto_3521 ?auto_3530 ) ( ON ?auto_3521 ?auto_3523 ) ( CLEAR ?auto_3521 ) ( not ( = ?auto_3520 ?auto_3523 ) ) ( not ( = ?auto_3521 ?auto_3523 ) ) ( not ( = ?auto_3519 ?auto_3523 ) ) ( IS-CRATE ?auto_3520 ) ( not ( = ?auto_3524 ?auto_3522 ) ) ( not ( = ?auto_3530 ?auto_3524 ) ) ( HOIST-AT ?auto_3529 ?auto_3524 ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( not ( = ?auto_3526 ?auto_3529 ) ) ( AVAILABLE ?auto_3529 ) ( SURFACE-AT ?auto_3520 ?auto_3524 ) ( ON ?auto_3520 ?auto_3528 ) ( CLEAR ?auto_3520 ) ( not ( = ?auto_3520 ?auto_3528 ) ) ( not ( = ?auto_3521 ?auto_3528 ) ) ( not ( = ?auto_3519 ?auto_3528 ) ) ( not ( = ?auto_3523 ?auto_3528 ) ) ( TRUCK-AT ?auto_3525 ?auto_3522 ) ( SURFACE-AT ?auto_3518 ?auto_3522 ) ( CLEAR ?auto_3518 ) ( LIFTING ?auto_3527 ?auto_3519 ) ( IS-CRATE ?auto_3519 ) ( not ( = ?auto_3518 ?auto_3519 ) ) ( not ( = ?auto_3520 ?auto_3518 ) ) ( not ( = ?auto_3521 ?auto_3518 ) ) ( not ( = ?auto_3523 ?auto_3518 ) ) ( not ( = ?auto_3528 ?auto_3518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3519 ?auto_3520 ?auto_3521 )
      ( MAKE-3CRATE-VERIFY ?auto_3518 ?auto_3519 ?auto_3520 ?auto_3521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3531 - SURFACE
      ?auto_3532 - SURFACE
    )
    :vars
    (
      ?auto_3539 - HOIST
      ?auto_3534 - PLACE
      ?auto_3533 - SURFACE
      ?auto_3543 - PLACE
      ?auto_3538 - HOIST
      ?auto_3535 - SURFACE
      ?auto_3536 - PLACE
      ?auto_3541 - HOIST
      ?auto_3540 - SURFACE
      ?auto_3537 - TRUCK
      ?auto_3542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3539 ?auto_3534 ) ( IS-CRATE ?auto_3532 ) ( not ( = ?auto_3531 ?auto_3532 ) ) ( not ( = ?auto_3533 ?auto_3531 ) ) ( not ( = ?auto_3533 ?auto_3532 ) ) ( not ( = ?auto_3543 ?auto_3534 ) ) ( HOIST-AT ?auto_3538 ?auto_3543 ) ( not ( = ?auto_3539 ?auto_3538 ) ) ( AVAILABLE ?auto_3538 ) ( SURFACE-AT ?auto_3532 ?auto_3543 ) ( ON ?auto_3532 ?auto_3535 ) ( CLEAR ?auto_3532 ) ( not ( = ?auto_3531 ?auto_3535 ) ) ( not ( = ?auto_3532 ?auto_3535 ) ) ( not ( = ?auto_3533 ?auto_3535 ) ) ( IS-CRATE ?auto_3531 ) ( not ( = ?auto_3536 ?auto_3534 ) ) ( not ( = ?auto_3543 ?auto_3536 ) ) ( HOIST-AT ?auto_3541 ?auto_3536 ) ( not ( = ?auto_3539 ?auto_3541 ) ) ( not ( = ?auto_3538 ?auto_3541 ) ) ( AVAILABLE ?auto_3541 ) ( SURFACE-AT ?auto_3531 ?auto_3536 ) ( ON ?auto_3531 ?auto_3540 ) ( CLEAR ?auto_3531 ) ( not ( = ?auto_3531 ?auto_3540 ) ) ( not ( = ?auto_3532 ?auto_3540 ) ) ( not ( = ?auto_3533 ?auto_3540 ) ) ( not ( = ?auto_3535 ?auto_3540 ) ) ( TRUCK-AT ?auto_3537 ?auto_3534 ) ( SURFACE-AT ?auto_3542 ?auto_3534 ) ( CLEAR ?auto_3542 ) ( IS-CRATE ?auto_3533 ) ( not ( = ?auto_3542 ?auto_3533 ) ) ( not ( = ?auto_3531 ?auto_3542 ) ) ( not ( = ?auto_3532 ?auto_3542 ) ) ( not ( = ?auto_3535 ?auto_3542 ) ) ( not ( = ?auto_3540 ?auto_3542 ) ) ( AVAILABLE ?auto_3539 ) ( IN ?auto_3533 ?auto_3537 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3539 ?auto_3533 ?auto_3537 ?auto_3534 )
      ( MAKE-2CRATE ?auto_3533 ?auto_3531 ?auto_3532 )
      ( MAKE-1CRATE-VERIFY ?auto_3531 ?auto_3532 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3544 - SURFACE
      ?auto_3545 - SURFACE
      ?auto_3546 - SURFACE
    )
    :vars
    (
      ?auto_3551 - HOIST
      ?auto_3550 - PLACE
      ?auto_3548 - PLACE
      ?auto_3549 - HOIST
      ?auto_3553 - SURFACE
      ?auto_3556 - PLACE
      ?auto_3552 - HOIST
      ?auto_3554 - SURFACE
      ?auto_3547 - TRUCK
      ?auto_3555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3551 ?auto_3550 ) ( IS-CRATE ?auto_3546 ) ( not ( = ?auto_3545 ?auto_3546 ) ) ( not ( = ?auto_3544 ?auto_3545 ) ) ( not ( = ?auto_3544 ?auto_3546 ) ) ( not ( = ?auto_3548 ?auto_3550 ) ) ( HOIST-AT ?auto_3549 ?auto_3548 ) ( not ( = ?auto_3551 ?auto_3549 ) ) ( AVAILABLE ?auto_3549 ) ( SURFACE-AT ?auto_3546 ?auto_3548 ) ( ON ?auto_3546 ?auto_3553 ) ( CLEAR ?auto_3546 ) ( not ( = ?auto_3545 ?auto_3553 ) ) ( not ( = ?auto_3546 ?auto_3553 ) ) ( not ( = ?auto_3544 ?auto_3553 ) ) ( IS-CRATE ?auto_3545 ) ( not ( = ?auto_3556 ?auto_3550 ) ) ( not ( = ?auto_3548 ?auto_3556 ) ) ( HOIST-AT ?auto_3552 ?auto_3556 ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( not ( = ?auto_3549 ?auto_3552 ) ) ( AVAILABLE ?auto_3552 ) ( SURFACE-AT ?auto_3545 ?auto_3556 ) ( ON ?auto_3545 ?auto_3554 ) ( CLEAR ?auto_3545 ) ( not ( = ?auto_3545 ?auto_3554 ) ) ( not ( = ?auto_3546 ?auto_3554 ) ) ( not ( = ?auto_3544 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3554 ) ) ( TRUCK-AT ?auto_3547 ?auto_3550 ) ( SURFACE-AT ?auto_3555 ?auto_3550 ) ( CLEAR ?auto_3555 ) ( IS-CRATE ?auto_3544 ) ( not ( = ?auto_3555 ?auto_3544 ) ) ( not ( = ?auto_3545 ?auto_3555 ) ) ( not ( = ?auto_3546 ?auto_3555 ) ) ( not ( = ?auto_3553 ?auto_3555 ) ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( AVAILABLE ?auto_3551 ) ( IN ?auto_3544 ?auto_3547 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3545 ?auto_3546 )
      ( MAKE-2CRATE-VERIFY ?auto_3544 ?auto_3545 ?auto_3546 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3557 - SURFACE
      ?auto_3558 - SURFACE
      ?auto_3559 - SURFACE
      ?auto_3560 - SURFACE
    )
    :vars
    (
      ?auto_3566 - HOIST
      ?auto_3564 - PLACE
      ?auto_3562 - PLACE
      ?auto_3563 - HOIST
      ?auto_3568 - SURFACE
      ?auto_3565 - PLACE
      ?auto_3561 - HOIST
      ?auto_3569 - SURFACE
      ?auto_3567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3566 ?auto_3564 ) ( IS-CRATE ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( not ( = ?auto_3562 ?auto_3564 ) ) ( HOIST-AT ?auto_3563 ?auto_3562 ) ( not ( = ?auto_3566 ?auto_3563 ) ) ( AVAILABLE ?auto_3563 ) ( SURFACE-AT ?auto_3560 ?auto_3562 ) ( ON ?auto_3560 ?auto_3568 ) ( CLEAR ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3568 ) ) ( not ( = ?auto_3560 ?auto_3568 ) ) ( not ( = ?auto_3558 ?auto_3568 ) ) ( IS-CRATE ?auto_3559 ) ( not ( = ?auto_3565 ?auto_3564 ) ) ( not ( = ?auto_3562 ?auto_3565 ) ) ( HOIST-AT ?auto_3561 ?auto_3565 ) ( not ( = ?auto_3566 ?auto_3561 ) ) ( not ( = ?auto_3563 ?auto_3561 ) ) ( AVAILABLE ?auto_3561 ) ( SURFACE-AT ?auto_3559 ?auto_3565 ) ( ON ?auto_3559 ?auto_3569 ) ( CLEAR ?auto_3559 ) ( not ( = ?auto_3559 ?auto_3569 ) ) ( not ( = ?auto_3560 ?auto_3569 ) ) ( not ( = ?auto_3558 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3569 ) ) ( TRUCK-AT ?auto_3567 ?auto_3564 ) ( SURFACE-AT ?auto_3557 ?auto_3564 ) ( CLEAR ?auto_3557 ) ( IS-CRATE ?auto_3558 ) ( not ( = ?auto_3557 ?auto_3558 ) ) ( not ( = ?auto_3559 ?auto_3557 ) ) ( not ( = ?auto_3560 ?auto_3557 ) ) ( not ( = ?auto_3568 ?auto_3557 ) ) ( not ( = ?auto_3569 ?auto_3557 ) ) ( AVAILABLE ?auto_3566 ) ( IN ?auto_3558 ?auto_3567 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3558 ?auto_3559 ?auto_3560 )
      ( MAKE-3CRATE-VERIFY ?auto_3557 ?auto_3558 ?auto_3559 ?auto_3560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3570 - SURFACE
      ?auto_3571 - SURFACE
    )
    :vars
    (
      ?auto_3578 - HOIST
      ?auto_3576 - PLACE
      ?auto_3582 - SURFACE
      ?auto_3573 - PLACE
      ?auto_3574 - HOIST
      ?auto_3580 - SURFACE
      ?auto_3577 - PLACE
      ?auto_3572 - HOIST
      ?auto_3581 - SURFACE
      ?auto_3575 - SURFACE
      ?auto_3579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3578 ?auto_3576 ) ( IS-CRATE ?auto_3571 ) ( not ( = ?auto_3570 ?auto_3571 ) ) ( not ( = ?auto_3582 ?auto_3570 ) ) ( not ( = ?auto_3582 ?auto_3571 ) ) ( not ( = ?auto_3573 ?auto_3576 ) ) ( HOIST-AT ?auto_3574 ?auto_3573 ) ( not ( = ?auto_3578 ?auto_3574 ) ) ( AVAILABLE ?auto_3574 ) ( SURFACE-AT ?auto_3571 ?auto_3573 ) ( ON ?auto_3571 ?auto_3580 ) ( CLEAR ?auto_3571 ) ( not ( = ?auto_3570 ?auto_3580 ) ) ( not ( = ?auto_3571 ?auto_3580 ) ) ( not ( = ?auto_3582 ?auto_3580 ) ) ( IS-CRATE ?auto_3570 ) ( not ( = ?auto_3577 ?auto_3576 ) ) ( not ( = ?auto_3573 ?auto_3577 ) ) ( HOIST-AT ?auto_3572 ?auto_3577 ) ( not ( = ?auto_3578 ?auto_3572 ) ) ( not ( = ?auto_3574 ?auto_3572 ) ) ( AVAILABLE ?auto_3572 ) ( SURFACE-AT ?auto_3570 ?auto_3577 ) ( ON ?auto_3570 ?auto_3581 ) ( CLEAR ?auto_3570 ) ( not ( = ?auto_3570 ?auto_3581 ) ) ( not ( = ?auto_3571 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3581 ) ) ( not ( = ?auto_3580 ?auto_3581 ) ) ( SURFACE-AT ?auto_3575 ?auto_3576 ) ( CLEAR ?auto_3575 ) ( IS-CRATE ?auto_3582 ) ( not ( = ?auto_3575 ?auto_3582 ) ) ( not ( = ?auto_3570 ?auto_3575 ) ) ( not ( = ?auto_3571 ?auto_3575 ) ) ( not ( = ?auto_3580 ?auto_3575 ) ) ( not ( = ?auto_3581 ?auto_3575 ) ) ( AVAILABLE ?auto_3578 ) ( IN ?auto_3582 ?auto_3579 ) ( TRUCK-AT ?auto_3579 ?auto_3573 ) )
    :subtasks
    ( ( !DRIVE ?auto_3579 ?auto_3573 ?auto_3576 )
      ( MAKE-2CRATE ?auto_3582 ?auto_3570 ?auto_3571 )
      ( MAKE-1CRATE-VERIFY ?auto_3570 ?auto_3571 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3583 - SURFACE
      ?auto_3584 - SURFACE
      ?auto_3585 - SURFACE
    )
    :vars
    (
      ?auto_3594 - HOIST
      ?auto_3587 - PLACE
      ?auto_3592 - PLACE
      ?auto_3591 - HOIST
      ?auto_3589 - SURFACE
      ?auto_3588 - PLACE
      ?auto_3593 - HOIST
      ?auto_3586 - SURFACE
      ?auto_3595 - SURFACE
      ?auto_3590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3594 ?auto_3587 ) ( IS-CRATE ?auto_3585 ) ( not ( = ?auto_3584 ?auto_3585 ) ) ( not ( = ?auto_3583 ?auto_3584 ) ) ( not ( = ?auto_3583 ?auto_3585 ) ) ( not ( = ?auto_3592 ?auto_3587 ) ) ( HOIST-AT ?auto_3591 ?auto_3592 ) ( not ( = ?auto_3594 ?auto_3591 ) ) ( AVAILABLE ?auto_3591 ) ( SURFACE-AT ?auto_3585 ?auto_3592 ) ( ON ?auto_3585 ?auto_3589 ) ( CLEAR ?auto_3585 ) ( not ( = ?auto_3584 ?auto_3589 ) ) ( not ( = ?auto_3585 ?auto_3589 ) ) ( not ( = ?auto_3583 ?auto_3589 ) ) ( IS-CRATE ?auto_3584 ) ( not ( = ?auto_3588 ?auto_3587 ) ) ( not ( = ?auto_3592 ?auto_3588 ) ) ( HOIST-AT ?auto_3593 ?auto_3588 ) ( not ( = ?auto_3594 ?auto_3593 ) ) ( not ( = ?auto_3591 ?auto_3593 ) ) ( AVAILABLE ?auto_3593 ) ( SURFACE-AT ?auto_3584 ?auto_3588 ) ( ON ?auto_3584 ?auto_3586 ) ( CLEAR ?auto_3584 ) ( not ( = ?auto_3584 ?auto_3586 ) ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( not ( = ?auto_3583 ?auto_3586 ) ) ( not ( = ?auto_3589 ?auto_3586 ) ) ( SURFACE-AT ?auto_3595 ?auto_3587 ) ( CLEAR ?auto_3595 ) ( IS-CRATE ?auto_3583 ) ( not ( = ?auto_3595 ?auto_3583 ) ) ( not ( = ?auto_3584 ?auto_3595 ) ) ( not ( = ?auto_3585 ?auto_3595 ) ) ( not ( = ?auto_3589 ?auto_3595 ) ) ( not ( = ?auto_3586 ?auto_3595 ) ) ( AVAILABLE ?auto_3594 ) ( IN ?auto_3583 ?auto_3590 ) ( TRUCK-AT ?auto_3590 ?auto_3592 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3584 ?auto_3585 )
      ( MAKE-2CRATE-VERIFY ?auto_3583 ?auto_3584 ?auto_3585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3596 - SURFACE
      ?auto_3597 - SURFACE
      ?auto_3598 - SURFACE
      ?auto_3599 - SURFACE
    )
    :vars
    (
      ?auto_3603 - HOIST
      ?auto_3605 - PLACE
      ?auto_3607 - PLACE
      ?auto_3602 - HOIST
      ?auto_3606 - SURFACE
      ?auto_3600 - PLACE
      ?auto_3604 - HOIST
      ?auto_3601 - SURFACE
      ?auto_3608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3603 ?auto_3605 ) ( IS-CRATE ?auto_3599 ) ( not ( = ?auto_3598 ?auto_3599 ) ) ( not ( = ?auto_3597 ?auto_3598 ) ) ( not ( = ?auto_3597 ?auto_3599 ) ) ( not ( = ?auto_3607 ?auto_3605 ) ) ( HOIST-AT ?auto_3602 ?auto_3607 ) ( not ( = ?auto_3603 ?auto_3602 ) ) ( AVAILABLE ?auto_3602 ) ( SURFACE-AT ?auto_3599 ?auto_3607 ) ( ON ?auto_3599 ?auto_3606 ) ( CLEAR ?auto_3599 ) ( not ( = ?auto_3598 ?auto_3606 ) ) ( not ( = ?auto_3599 ?auto_3606 ) ) ( not ( = ?auto_3597 ?auto_3606 ) ) ( IS-CRATE ?auto_3598 ) ( not ( = ?auto_3600 ?auto_3605 ) ) ( not ( = ?auto_3607 ?auto_3600 ) ) ( HOIST-AT ?auto_3604 ?auto_3600 ) ( not ( = ?auto_3603 ?auto_3604 ) ) ( not ( = ?auto_3602 ?auto_3604 ) ) ( AVAILABLE ?auto_3604 ) ( SURFACE-AT ?auto_3598 ?auto_3600 ) ( ON ?auto_3598 ?auto_3601 ) ( CLEAR ?auto_3598 ) ( not ( = ?auto_3598 ?auto_3601 ) ) ( not ( = ?auto_3599 ?auto_3601 ) ) ( not ( = ?auto_3597 ?auto_3601 ) ) ( not ( = ?auto_3606 ?auto_3601 ) ) ( SURFACE-AT ?auto_3596 ?auto_3605 ) ( CLEAR ?auto_3596 ) ( IS-CRATE ?auto_3597 ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( not ( = ?auto_3598 ?auto_3596 ) ) ( not ( = ?auto_3599 ?auto_3596 ) ) ( not ( = ?auto_3606 ?auto_3596 ) ) ( not ( = ?auto_3601 ?auto_3596 ) ) ( AVAILABLE ?auto_3603 ) ( IN ?auto_3597 ?auto_3608 ) ( TRUCK-AT ?auto_3608 ?auto_3607 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3597 ?auto_3598 ?auto_3599 )
      ( MAKE-3CRATE-VERIFY ?auto_3596 ?auto_3597 ?auto_3598 ?auto_3599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3609 - SURFACE
      ?auto_3610 - SURFACE
    )
    :vars
    (
      ?auto_3615 - HOIST
      ?auto_3617 - PLACE
      ?auto_3614 - SURFACE
      ?auto_3619 - PLACE
      ?auto_3613 - HOIST
      ?auto_3618 - SURFACE
      ?auto_3611 - PLACE
      ?auto_3616 - HOIST
      ?auto_3612 - SURFACE
      ?auto_3620 - SURFACE
      ?auto_3621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3615 ?auto_3617 ) ( IS-CRATE ?auto_3610 ) ( not ( = ?auto_3609 ?auto_3610 ) ) ( not ( = ?auto_3614 ?auto_3609 ) ) ( not ( = ?auto_3614 ?auto_3610 ) ) ( not ( = ?auto_3619 ?auto_3617 ) ) ( HOIST-AT ?auto_3613 ?auto_3619 ) ( not ( = ?auto_3615 ?auto_3613 ) ) ( SURFACE-AT ?auto_3610 ?auto_3619 ) ( ON ?auto_3610 ?auto_3618 ) ( CLEAR ?auto_3610 ) ( not ( = ?auto_3609 ?auto_3618 ) ) ( not ( = ?auto_3610 ?auto_3618 ) ) ( not ( = ?auto_3614 ?auto_3618 ) ) ( IS-CRATE ?auto_3609 ) ( not ( = ?auto_3611 ?auto_3617 ) ) ( not ( = ?auto_3619 ?auto_3611 ) ) ( HOIST-AT ?auto_3616 ?auto_3611 ) ( not ( = ?auto_3615 ?auto_3616 ) ) ( not ( = ?auto_3613 ?auto_3616 ) ) ( AVAILABLE ?auto_3616 ) ( SURFACE-AT ?auto_3609 ?auto_3611 ) ( ON ?auto_3609 ?auto_3612 ) ( CLEAR ?auto_3609 ) ( not ( = ?auto_3609 ?auto_3612 ) ) ( not ( = ?auto_3610 ?auto_3612 ) ) ( not ( = ?auto_3614 ?auto_3612 ) ) ( not ( = ?auto_3618 ?auto_3612 ) ) ( SURFACE-AT ?auto_3620 ?auto_3617 ) ( CLEAR ?auto_3620 ) ( IS-CRATE ?auto_3614 ) ( not ( = ?auto_3620 ?auto_3614 ) ) ( not ( = ?auto_3609 ?auto_3620 ) ) ( not ( = ?auto_3610 ?auto_3620 ) ) ( not ( = ?auto_3618 ?auto_3620 ) ) ( not ( = ?auto_3612 ?auto_3620 ) ) ( AVAILABLE ?auto_3615 ) ( TRUCK-AT ?auto_3621 ?auto_3619 ) ( LIFTING ?auto_3613 ?auto_3614 ) )
    :subtasks
    ( ( !LOAD ?auto_3613 ?auto_3614 ?auto_3621 ?auto_3619 )
      ( MAKE-2CRATE ?auto_3614 ?auto_3609 ?auto_3610 )
      ( MAKE-1CRATE-VERIFY ?auto_3609 ?auto_3610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3622 - SURFACE
      ?auto_3623 - SURFACE
      ?auto_3624 - SURFACE
    )
    :vars
    (
      ?auto_3634 - HOIST
      ?auto_3626 - PLACE
      ?auto_3631 - PLACE
      ?auto_3628 - HOIST
      ?auto_3625 - SURFACE
      ?auto_3630 - PLACE
      ?auto_3632 - HOIST
      ?auto_3629 - SURFACE
      ?auto_3627 - SURFACE
      ?auto_3633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3634 ?auto_3626 ) ( IS-CRATE ?auto_3624 ) ( not ( = ?auto_3623 ?auto_3624 ) ) ( not ( = ?auto_3622 ?auto_3623 ) ) ( not ( = ?auto_3622 ?auto_3624 ) ) ( not ( = ?auto_3631 ?auto_3626 ) ) ( HOIST-AT ?auto_3628 ?auto_3631 ) ( not ( = ?auto_3634 ?auto_3628 ) ) ( SURFACE-AT ?auto_3624 ?auto_3631 ) ( ON ?auto_3624 ?auto_3625 ) ( CLEAR ?auto_3624 ) ( not ( = ?auto_3623 ?auto_3625 ) ) ( not ( = ?auto_3624 ?auto_3625 ) ) ( not ( = ?auto_3622 ?auto_3625 ) ) ( IS-CRATE ?auto_3623 ) ( not ( = ?auto_3630 ?auto_3626 ) ) ( not ( = ?auto_3631 ?auto_3630 ) ) ( HOIST-AT ?auto_3632 ?auto_3630 ) ( not ( = ?auto_3634 ?auto_3632 ) ) ( not ( = ?auto_3628 ?auto_3632 ) ) ( AVAILABLE ?auto_3632 ) ( SURFACE-AT ?auto_3623 ?auto_3630 ) ( ON ?auto_3623 ?auto_3629 ) ( CLEAR ?auto_3623 ) ( not ( = ?auto_3623 ?auto_3629 ) ) ( not ( = ?auto_3624 ?auto_3629 ) ) ( not ( = ?auto_3622 ?auto_3629 ) ) ( not ( = ?auto_3625 ?auto_3629 ) ) ( SURFACE-AT ?auto_3627 ?auto_3626 ) ( CLEAR ?auto_3627 ) ( IS-CRATE ?auto_3622 ) ( not ( = ?auto_3627 ?auto_3622 ) ) ( not ( = ?auto_3623 ?auto_3627 ) ) ( not ( = ?auto_3624 ?auto_3627 ) ) ( not ( = ?auto_3625 ?auto_3627 ) ) ( not ( = ?auto_3629 ?auto_3627 ) ) ( AVAILABLE ?auto_3634 ) ( TRUCK-AT ?auto_3633 ?auto_3631 ) ( LIFTING ?auto_3628 ?auto_3622 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3623 ?auto_3624 )
      ( MAKE-2CRATE-VERIFY ?auto_3622 ?auto_3623 ?auto_3624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3635 - SURFACE
      ?auto_3636 - SURFACE
      ?auto_3637 - SURFACE
      ?auto_3638 - SURFACE
    )
    :vars
    (
      ?auto_3640 - HOIST
      ?auto_3644 - PLACE
      ?auto_3641 - PLACE
      ?auto_3639 - HOIST
      ?auto_3643 - SURFACE
      ?auto_3646 - PLACE
      ?auto_3642 - HOIST
      ?auto_3647 - SURFACE
      ?auto_3645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3640 ?auto_3644 ) ( IS-CRATE ?auto_3638 ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( not ( = ?auto_3636 ?auto_3638 ) ) ( not ( = ?auto_3641 ?auto_3644 ) ) ( HOIST-AT ?auto_3639 ?auto_3641 ) ( not ( = ?auto_3640 ?auto_3639 ) ) ( SURFACE-AT ?auto_3638 ?auto_3641 ) ( ON ?auto_3638 ?auto_3643 ) ( CLEAR ?auto_3638 ) ( not ( = ?auto_3637 ?auto_3643 ) ) ( not ( = ?auto_3638 ?auto_3643 ) ) ( not ( = ?auto_3636 ?auto_3643 ) ) ( IS-CRATE ?auto_3637 ) ( not ( = ?auto_3646 ?auto_3644 ) ) ( not ( = ?auto_3641 ?auto_3646 ) ) ( HOIST-AT ?auto_3642 ?auto_3646 ) ( not ( = ?auto_3640 ?auto_3642 ) ) ( not ( = ?auto_3639 ?auto_3642 ) ) ( AVAILABLE ?auto_3642 ) ( SURFACE-AT ?auto_3637 ?auto_3646 ) ( ON ?auto_3637 ?auto_3647 ) ( CLEAR ?auto_3637 ) ( not ( = ?auto_3637 ?auto_3647 ) ) ( not ( = ?auto_3638 ?auto_3647 ) ) ( not ( = ?auto_3636 ?auto_3647 ) ) ( not ( = ?auto_3643 ?auto_3647 ) ) ( SURFACE-AT ?auto_3635 ?auto_3644 ) ( CLEAR ?auto_3635 ) ( IS-CRATE ?auto_3636 ) ( not ( = ?auto_3635 ?auto_3636 ) ) ( not ( = ?auto_3637 ?auto_3635 ) ) ( not ( = ?auto_3638 ?auto_3635 ) ) ( not ( = ?auto_3643 ?auto_3635 ) ) ( not ( = ?auto_3647 ?auto_3635 ) ) ( AVAILABLE ?auto_3640 ) ( TRUCK-AT ?auto_3645 ?auto_3641 ) ( LIFTING ?auto_3639 ?auto_3636 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3636 ?auto_3637 ?auto_3638 )
      ( MAKE-3CRATE-VERIFY ?auto_3635 ?auto_3636 ?auto_3637 ?auto_3638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3648 - SURFACE
      ?auto_3649 - SURFACE
    )
    :vars
    (
      ?auto_3652 - HOIST
      ?auto_3656 - PLACE
      ?auto_3660 - SURFACE
      ?auto_3653 - PLACE
      ?auto_3650 - HOIST
      ?auto_3655 - SURFACE
      ?auto_3658 - PLACE
      ?auto_3654 - HOIST
      ?auto_3659 - SURFACE
      ?auto_3651 - SURFACE
      ?auto_3657 - TRUCK
      ?auto_3661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3652 ?auto_3656 ) ( IS-CRATE ?auto_3649 ) ( not ( = ?auto_3648 ?auto_3649 ) ) ( not ( = ?auto_3660 ?auto_3648 ) ) ( not ( = ?auto_3660 ?auto_3649 ) ) ( not ( = ?auto_3653 ?auto_3656 ) ) ( HOIST-AT ?auto_3650 ?auto_3653 ) ( not ( = ?auto_3652 ?auto_3650 ) ) ( SURFACE-AT ?auto_3649 ?auto_3653 ) ( ON ?auto_3649 ?auto_3655 ) ( CLEAR ?auto_3649 ) ( not ( = ?auto_3648 ?auto_3655 ) ) ( not ( = ?auto_3649 ?auto_3655 ) ) ( not ( = ?auto_3660 ?auto_3655 ) ) ( IS-CRATE ?auto_3648 ) ( not ( = ?auto_3658 ?auto_3656 ) ) ( not ( = ?auto_3653 ?auto_3658 ) ) ( HOIST-AT ?auto_3654 ?auto_3658 ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3650 ?auto_3654 ) ) ( AVAILABLE ?auto_3654 ) ( SURFACE-AT ?auto_3648 ?auto_3658 ) ( ON ?auto_3648 ?auto_3659 ) ( CLEAR ?auto_3648 ) ( not ( = ?auto_3648 ?auto_3659 ) ) ( not ( = ?auto_3649 ?auto_3659 ) ) ( not ( = ?auto_3660 ?auto_3659 ) ) ( not ( = ?auto_3655 ?auto_3659 ) ) ( SURFACE-AT ?auto_3651 ?auto_3656 ) ( CLEAR ?auto_3651 ) ( IS-CRATE ?auto_3660 ) ( not ( = ?auto_3651 ?auto_3660 ) ) ( not ( = ?auto_3648 ?auto_3651 ) ) ( not ( = ?auto_3649 ?auto_3651 ) ) ( not ( = ?auto_3655 ?auto_3651 ) ) ( not ( = ?auto_3659 ?auto_3651 ) ) ( AVAILABLE ?auto_3652 ) ( TRUCK-AT ?auto_3657 ?auto_3653 ) ( AVAILABLE ?auto_3650 ) ( SURFACE-AT ?auto_3660 ?auto_3653 ) ( ON ?auto_3660 ?auto_3661 ) ( CLEAR ?auto_3660 ) ( not ( = ?auto_3648 ?auto_3661 ) ) ( not ( = ?auto_3649 ?auto_3661 ) ) ( not ( = ?auto_3660 ?auto_3661 ) ) ( not ( = ?auto_3655 ?auto_3661 ) ) ( not ( = ?auto_3659 ?auto_3661 ) ) ( not ( = ?auto_3651 ?auto_3661 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3650 ?auto_3660 ?auto_3661 ?auto_3653 )
      ( MAKE-2CRATE ?auto_3660 ?auto_3648 ?auto_3649 )
      ( MAKE-1CRATE-VERIFY ?auto_3648 ?auto_3649 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3662 - SURFACE
      ?auto_3663 - SURFACE
      ?auto_3664 - SURFACE
    )
    :vars
    (
      ?auto_3667 - HOIST
      ?auto_3672 - PLACE
      ?auto_3669 - PLACE
      ?auto_3668 - HOIST
      ?auto_3665 - SURFACE
      ?auto_3675 - PLACE
      ?auto_3670 - HOIST
      ?auto_3666 - SURFACE
      ?auto_3674 - SURFACE
      ?auto_3671 - TRUCK
      ?auto_3673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3667 ?auto_3672 ) ( IS-CRATE ?auto_3664 ) ( not ( = ?auto_3663 ?auto_3664 ) ) ( not ( = ?auto_3662 ?auto_3663 ) ) ( not ( = ?auto_3662 ?auto_3664 ) ) ( not ( = ?auto_3669 ?auto_3672 ) ) ( HOIST-AT ?auto_3668 ?auto_3669 ) ( not ( = ?auto_3667 ?auto_3668 ) ) ( SURFACE-AT ?auto_3664 ?auto_3669 ) ( ON ?auto_3664 ?auto_3665 ) ( CLEAR ?auto_3664 ) ( not ( = ?auto_3663 ?auto_3665 ) ) ( not ( = ?auto_3664 ?auto_3665 ) ) ( not ( = ?auto_3662 ?auto_3665 ) ) ( IS-CRATE ?auto_3663 ) ( not ( = ?auto_3675 ?auto_3672 ) ) ( not ( = ?auto_3669 ?auto_3675 ) ) ( HOIST-AT ?auto_3670 ?auto_3675 ) ( not ( = ?auto_3667 ?auto_3670 ) ) ( not ( = ?auto_3668 ?auto_3670 ) ) ( AVAILABLE ?auto_3670 ) ( SURFACE-AT ?auto_3663 ?auto_3675 ) ( ON ?auto_3663 ?auto_3666 ) ( CLEAR ?auto_3663 ) ( not ( = ?auto_3663 ?auto_3666 ) ) ( not ( = ?auto_3664 ?auto_3666 ) ) ( not ( = ?auto_3662 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( SURFACE-AT ?auto_3674 ?auto_3672 ) ( CLEAR ?auto_3674 ) ( IS-CRATE ?auto_3662 ) ( not ( = ?auto_3674 ?auto_3662 ) ) ( not ( = ?auto_3663 ?auto_3674 ) ) ( not ( = ?auto_3664 ?auto_3674 ) ) ( not ( = ?auto_3665 ?auto_3674 ) ) ( not ( = ?auto_3666 ?auto_3674 ) ) ( AVAILABLE ?auto_3667 ) ( TRUCK-AT ?auto_3671 ?auto_3669 ) ( AVAILABLE ?auto_3668 ) ( SURFACE-AT ?auto_3662 ?auto_3669 ) ( ON ?auto_3662 ?auto_3673 ) ( CLEAR ?auto_3662 ) ( not ( = ?auto_3663 ?auto_3673 ) ) ( not ( = ?auto_3664 ?auto_3673 ) ) ( not ( = ?auto_3662 ?auto_3673 ) ) ( not ( = ?auto_3665 ?auto_3673 ) ) ( not ( = ?auto_3666 ?auto_3673 ) ) ( not ( = ?auto_3674 ?auto_3673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3663 ?auto_3664 )
      ( MAKE-2CRATE-VERIFY ?auto_3662 ?auto_3663 ?auto_3664 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3676 - SURFACE
      ?auto_3677 - SURFACE
      ?auto_3678 - SURFACE
      ?auto_3679 - SURFACE
    )
    :vars
    (
      ?auto_3686 - HOIST
      ?auto_3683 - PLACE
      ?auto_3684 - PLACE
      ?auto_3687 - HOIST
      ?auto_3682 - SURFACE
      ?auto_3680 - PLACE
      ?auto_3688 - HOIST
      ?auto_3685 - SURFACE
      ?auto_3689 - TRUCK
      ?auto_3681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3686 ?auto_3683 ) ( IS-CRATE ?auto_3679 ) ( not ( = ?auto_3678 ?auto_3679 ) ) ( not ( = ?auto_3677 ?auto_3678 ) ) ( not ( = ?auto_3677 ?auto_3679 ) ) ( not ( = ?auto_3684 ?auto_3683 ) ) ( HOIST-AT ?auto_3687 ?auto_3684 ) ( not ( = ?auto_3686 ?auto_3687 ) ) ( SURFACE-AT ?auto_3679 ?auto_3684 ) ( ON ?auto_3679 ?auto_3682 ) ( CLEAR ?auto_3679 ) ( not ( = ?auto_3678 ?auto_3682 ) ) ( not ( = ?auto_3679 ?auto_3682 ) ) ( not ( = ?auto_3677 ?auto_3682 ) ) ( IS-CRATE ?auto_3678 ) ( not ( = ?auto_3680 ?auto_3683 ) ) ( not ( = ?auto_3684 ?auto_3680 ) ) ( HOIST-AT ?auto_3688 ?auto_3680 ) ( not ( = ?auto_3686 ?auto_3688 ) ) ( not ( = ?auto_3687 ?auto_3688 ) ) ( AVAILABLE ?auto_3688 ) ( SURFACE-AT ?auto_3678 ?auto_3680 ) ( ON ?auto_3678 ?auto_3685 ) ( CLEAR ?auto_3678 ) ( not ( = ?auto_3678 ?auto_3685 ) ) ( not ( = ?auto_3679 ?auto_3685 ) ) ( not ( = ?auto_3677 ?auto_3685 ) ) ( not ( = ?auto_3682 ?auto_3685 ) ) ( SURFACE-AT ?auto_3676 ?auto_3683 ) ( CLEAR ?auto_3676 ) ( IS-CRATE ?auto_3677 ) ( not ( = ?auto_3676 ?auto_3677 ) ) ( not ( = ?auto_3678 ?auto_3676 ) ) ( not ( = ?auto_3679 ?auto_3676 ) ) ( not ( = ?auto_3682 ?auto_3676 ) ) ( not ( = ?auto_3685 ?auto_3676 ) ) ( AVAILABLE ?auto_3686 ) ( TRUCK-AT ?auto_3689 ?auto_3684 ) ( AVAILABLE ?auto_3687 ) ( SURFACE-AT ?auto_3677 ?auto_3684 ) ( ON ?auto_3677 ?auto_3681 ) ( CLEAR ?auto_3677 ) ( not ( = ?auto_3678 ?auto_3681 ) ) ( not ( = ?auto_3679 ?auto_3681 ) ) ( not ( = ?auto_3677 ?auto_3681 ) ) ( not ( = ?auto_3682 ?auto_3681 ) ) ( not ( = ?auto_3685 ?auto_3681 ) ) ( not ( = ?auto_3676 ?auto_3681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3677 ?auto_3678 ?auto_3679 )
      ( MAKE-3CRATE-VERIFY ?auto_3676 ?auto_3677 ?auto_3678 ?auto_3679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3690 - SURFACE
      ?auto_3691 - SURFACE
    )
    :vars
    (
      ?auto_3699 - HOIST
      ?auto_3695 - PLACE
      ?auto_3703 - SURFACE
      ?auto_3697 - PLACE
      ?auto_3700 - HOIST
      ?auto_3694 - SURFACE
      ?auto_3692 - PLACE
      ?auto_3701 - HOIST
      ?auto_3698 - SURFACE
      ?auto_3696 - SURFACE
      ?auto_3693 - SURFACE
      ?auto_3702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3699 ?auto_3695 ) ( IS-CRATE ?auto_3691 ) ( not ( = ?auto_3690 ?auto_3691 ) ) ( not ( = ?auto_3703 ?auto_3690 ) ) ( not ( = ?auto_3703 ?auto_3691 ) ) ( not ( = ?auto_3697 ?auto_3695 ) ) ( HOIST-AT ?auto_3700 ?auto_3697 ) ( not ( = ?auto_3699 ?auto_3700 ) ) ( SURFACE-AT ?auto_3691 ?auto_3697 ) ( ON ?auto_3691 ?auto_3694 ) ( CLEAR ?auto_3691 ) ( not ( = ?auto_3690 ?auto_3694 ) ) ( not ( = ?auto_3691 ?auto_3694 ) ) ( not ( = ?auto_3703 ?auto_3694 ) ) ( IS-CRATE ?auto_3690 ) ( not ( = ?auto_3692 ?auto_3695 ) ) ( not ( = ?auto_3697 ?auto_3692 ) ) ( HOIST-AT ?auto_3701 ?auto_3692 ) ( not ( = ?auto_3699 ?auto_3701 ) ) ( not ( = ?auto_3700 ?auto_3701 ) ) ( AVAILABLE ?auto_3701 ) ( SURFACE-AT ?auto_3690 ?auto_3692 ) ( ON ?auto_3690 ?auto_3698 ) ( CLEAR ?auto_3690 ) ( not ( = ?auto_3690 ?auto_3698 ) ) ( not ( = ?auto_3691 ?auto_3698 ) ) ( not ( = ?auto_3703 ?auto_3698 ) ) ( not ( = ?auto_3694 ?auto_3698 ) ) ( SURFACE-AT ?auto_3696 ?auto_3695 ) ( CLEAR ?auto_3696 ) ( IS-CRATE ?auto_3703 ) ( not ( = ?auto_3696 ?auto_3703 ) ) ( not ( = ?auto_3690 ?auto_3696 ) ) ( not ( = ?auto_3691 ?auto_3696 ) ) ( not ( = ?auto_3694 ?auto_3696 ) ) ( not ( = ?auto_3698 ?auto_3696 ) ) ( AVAILABLE ?auto_3699 ) ( AVAILABLE ?auto_3700 ) ( SURFACE-AT ?auto_3703 ?auto_3697 ) ( ON ?auto_3703 ?auto_3693 ) ( CLEAR ?auto_3703 ) ( not ( = ?auto_3690 ?auto_3693 ) ) ( not ( = ?auto_3691 ?auto_3693 ) ) ( not ( = ?auto_3703 ?auto_3693 ) ) ( not ( = ?auto_3694 ?auto_3693 ) ) ( not ( = ?auto_3698 ?auto_3693 ) ) ( not ( = ?auto_3696 ?auto_3693 ) ) ( TRUCK-AT ?auto_3702 ?auto_3695 ) )
    :subtasks
    ( ( !DRIVE ?auto_3702 ?auto_3695 ?auto_3697 )
      ( MAKE-2CRATE ?auto_3703 ?auto_3690 ?auto_3691 )
      ( MAKE-1CRATE-VERIFY ?auto_3690 ?auto_3691 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3704 - SURFACE
      ?auto_3705 - SURFACE
      ?auto_3706 - SURFACE
    )
    :vars
    (
      ?auto_3714 - HOIST
      ?auto_3713 - PLACE
      ?auto_3711 - PLACE
      ?auto_3707 - HOIST
      ?auto_3715 - SURFACE
      ?auto_3717 - PLACE
      ?auto_3712 - HOIST
      ?auto_3708 - SURFACE
      ?auto_3709 - SURFACE
      ?auto_3710 - SURFACE
      ?auto_3716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3714 ?auto_3713 ) ( IS-CRATE ?auto_3706 ) ( not ( = ?auto_3705 ?auto_3706 ) ) ( not ( = ?auto_3704 ?auto_3705 ) ) ( not ( = ?auto_3704 ?auto_3706 ) ) ( not ( = ?auto_3711 ?auto_3713 ) ) ( HOIST-AT ?auto_3707 ?auto_3711 ) ( not ( = ?auto_3714 ?auto_3707 ) ) ( SURFACE-AT ?auto_3706 ?auto_3711 ) ( ON ?auto_3706 ?auto_3715 ) ( CLEAR ?auto_3706 ) ( not ( = ?auto_3705 ?auto_3715 ) ) ( not ( = ?auto_3706 ?auto_3715 ) ) ( not ( = ?auto_3704 ?auto_3715 ) ) ( IS-CRATE ?auto_3705 ) ( not ( = ?auto_3717 ?auto_3713 ) ) ( not ( = ?auto_3711 ?auto_3717 ) ) ( HOIST-AT ?auto_3712 ?auto_3717 ) ( not ( = ?auto_3714 ?auto_3712 ) ) ( not ( = ?auto_3707 ?auto_3712 ) ) ( AVAILABLE ?auto_3712 ) ( SURFACE-AT ?auto_3705 ?auto_3717 ) ( ON ?auto_3705 ?auto_3708 ) ( CLEAR ?auto_3705 ) ( not ( = ?auto_3705 ?auto_3708 ) ) ( not ( = ?auto_3706 ?auto_3708 ) ) ( not ( = ?auto_3704 ?auto_3708 ) ) ( not ( = ?auto_3715 ?auto_3708 ) ) ( SURFACE-AT ?auto_3709 ?auto_3713 ) ( CLEAR ?auto_3709 ) ( IS-CRATE ?auto_3704 ) ( not ( = ?auto_3709 ?auto_3704 ) ) ( not ( = ?auto_3705 ?auto_3709 ) ) ( not ( = ?auto_3706 ?auto_3709 ) ) ( not ( = ?auto_3715 ?auto_3709 ) ) ( not ( = ?auto_3708 ?auto_3709 ) ) ( AVAILABLE ?auto_3714 ) ( AVAILABLE ?auto_3707 ) ( SURFACE-AT ?auto_3704 ?auto_3711 ) ( ON ?auto_3704 ?auto_3710 ) ( CLEAR ?auto_3704 ) ( not ( = ?auto_3705 ?auto_3710 ) ) ( not ( = ?auto_3706 ?auto_3710 ) ) ( not ( = ?auto_3704 ?auto_3710 ) ) ( not ( = ?auto_3715 ?auto_3710 ) ) ( not ( = ?auto_3708 ?auto_3710 ) ) ( not ( = ?auto_3709 ?auto_3710 ) ) ( TRUCK-AT ?auto_3716 ?auto_3713 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3705 ?auto_3706 )
      ( MAKE-2CRATE-VERIFY ?auto_3704 ?auto_3705 ?auto_3706 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3718 - SURFACE
      ?auto_3719 - SURFACE
      ?auto_3720 - SURFACE
      ?auto_3721 - SURFACE
    )
    :vars
    (
      ?auto_3723 - HOIST
      ?auto_3729 - PLACE
      ?auto_3727 - PLACE
      ?auto_3731 - HOIST
      ?auto_3728 - SURFACE
      ?auto_3726 - PLACE
      ?auto_3722 - HOIST
      ?auto_3730 - SURFACE
      ?auto_3725 - SURFACE
      ?auto_3724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3723 ?auto_3729 ) ( IS-CRATE ?auto_3721 ) ( not ( = ?auto_3720 ?auto_3721 ) ) ( not ( = ?auto_3719 ?auto_3720 ) ) ( not ( = ?auto_3719 ?auto_3721 ) ) ( not ( = ?auto_3727 ?auto_3729 ) ) ( HOIST-AT ?auto_3731 ?auto_3727 ) ( not ( = ?auto_3723 ?auto_3731 ) ) ( SURFACE-AT ?auto_3721 ?auto_3727 ) ( ON ?auto_3721 ?auto_3728 ) ( CLEAR ?auto_3721 ) ( not ( = ?auto_3720 ?auto_3728 ) ) ( not ( = ?auto_3721 ?auto_3728 ) ) ( not ( = ?auto_3719 ?auto_3728 ) ) ( IS-CRATE ?auto_3720 ) ( not ( = ?auto_3726 ?auto_3729 ) ) ( not ( = ?auto_3727 ?auto_3726 ) ) ( HOIST-AT ?auto_3722 ?auto_3726 ) ( not ( = ?auto_3723 ?auto_3722 ) ) ( not ( = ?auto_3731 ?auto_3722 ) ) ( AVAILABLE ?auto_3722 ) ( SURFACE-AT ?auto_3720 ?auto_3726 ) ( ON ?auto_3720 ?auto_3730 ) ( CLEAR ?auto_3720 ) ( not ( = ?auto_3720 ?auto_3730 ) ) ( not ( = ?auto_3721 ?auto_3730 ) ) ( not ( = ?auto_3719 ?auto_3730 ) ) ( not ( = ?auto_3728 ?auto_3730 ) ) ( SURFACE-AT ?auto_3718 ?auto_3729 ) ( CLEAR ?auto_3718 ) ( IS-CRATE ?auto_3719 ) ( not ( = ?auto_3718 ?auto_3719 ) ) ( not ( = ?auto_3720 ?auto_3718 ) ) ( not ( = ?auto_3721 ?auto_3718 ) ) ( not ( = ?auto_3728 ?auto_3718 ) ) ( not ( = ?auto_3730 ?auto_3718 ) ) ( AVAILABLE ?auto_3723 ) ( AVAILABLE ?auto_3731 ) ( SURFACE-AT ?auto_3719 ?auto_3727 ) ( ON ?auto_3719 ?auto_3725 ) ( CLEAR ?auto_3719 ) ( not ( = ?auto_3720 ?auto_3725 ) ) ( not ( = ?auto_3721 ?auto_3725 ) ) ( not ( = ?auto_3719 ?auto_3725 ) ) ( not ( = ?auto_3728 ?auto_3725 ) ) ( not ( = ?auto_3730 ?auto_3725 ) ) ( not ( = ?auto_3718 ?auto_3725 ) ) ( TRUCK-AT ?auto_3724 ?auto_3729 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3719 ?auto_3720 ?auto_3721 )
      ( MAKE-3CRATE-VERIFY ?auto_3718 ?auto_3719 ?auto_3720 ?auto_3721 ) )
  )

)

