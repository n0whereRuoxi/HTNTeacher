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
      ?auto_25925 - SURFACE
      ?auto_25926 - SURFACE
    )
    :vars
    (
      ?auto_25927 - HOIST
      ?auto_25928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25927 ?auto_25928 ) ( SURFACE-AT ?auto_25926 ?auto_25928 ) ( CLEAR ?auto_25926 ) ( LIFTING ?auto_25927 ?auto_25925 ) ( IS-CRATE ?auto_25925 ) ( not ( = ?auto_25925 ?auto_25926 ) ) )
    :subtasks
    ( ( !DROP ?auto_25927 ?auto_25925 ?auto_25926 ?auto_25928 )
      ( MAKE-ON-VERIFY ?auto_25925 ?auto_25926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25929 - SURFACE
      ?auto_25930 - SURFACE
    )
    :vars
    (
      ?auto_25931 - HOIST
      ?auto_25932 - PLACE
      ?auto_25933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25931 ?auto_25932 ) ( SURFACE-AT ?auto_25930 ?auto_25932 ) ( CLEAR ?auto_25930 ) ( IS-CRATE ?auto_25929 ) ( not ( = ?auto_25929 ?auto_25930 ) ) ( TRUCK-AT ?auto_25933 ?auto_25932 ) ( AVAILABLE ?auto_25931 ) ( IN ?auto_25929 ?auto_25933 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25931 ?auto_25929 ?auto_25933 ?auto_25932 )
      ( MAKE-ON ?auto_25929 ?auto_25930 )
      ( MAKE-ON-VERIFY ?auto_25929 ?auto_25930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25934 - SURFACE
      ?auto_25935 - SURFACE
    )
    :vars
    (
      ?auto_25938 - HOIST
      ?auto_25936 - PLACE
      ?auto_25937 - TRUCK
      ?auto_25939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25938 ?auto_25936 ) ( SURFACE-AT ?auto_25935 ?auto_25936 ) ( CLEAR ?auto_25935 ) ( IS-CRATE ?auto_25934 ) ( not ( = ?auto_25934 ?auto_25935 ) ) ( AVAILABLE ?auto_25938 ) ( IN ?auto_25934 ?auto_25937 ) ( TRUCK-AT ?auto_25937 ?auto_25939 ) ( not ( = ?auto_25939 ?auto_25936 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25937 ?auto_25939 ?auto_25936 )
      ( MAKE-ON ?auto_25934 ?auto_25935 )
      ( MAKE-ON-VERIFY ?auto_25934 ?auto_25935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25940 - SURFACE
      ?auto_25941 - SURFACE
    )
    :vars
    (
      ?auto_25943 - HOIST
      ?auto_25944 - PLACE
      ?auto_25945 - TRUCK
      ?auto_25942 - PLACE
      ?auto_25946 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25943 ?auto_25944 ) ( SURFACE-AT ?auto_25941 ?auto_25944 ) ( CLEAR ?auto_25941 ) ( IS-CRATE ?auto_25940 ) ( not ( = ?auto_25940 ?auto_25941 ) ) ( AVAILABLE ?auto_25943 ) ( TRUCK-AT ?auto_25945 ?auto_25942 ) ( not ( = ?auto_25942 ?auto_25944 ) ) ( HOIST-AT ?auto_25946 ?auto_25942 ) ( LIFTING ?auto_25946 ?auto_25940 ) ( not ( = ?auto_25943 ?auto_25946 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25946 ?auto_25940 ?auto_25945 ?auto_25942 )
      ( MAKE-ON ?auto_25940 ?auto_25941 )
      ( MAKE-ON-VERIFY ?auto_25940 ?auto_25941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25947 - SURFACE
      ?auto_25948 - SURFACE
    )
    :vars
    (
      ?auto_25949 - HOIST
      ?auto_25953 - PLACE
      ?auto_25952 - TRUCK
      ?auto_25951 - PLACE
      ?auto_25950 - HOIST
      ?auto_25954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25949 ?auto_25953 ) ( SURFACE-AT ?auto_25948 ?auto_25953 ) ( CLEAR ?auto_25948 ) ( IS-CRATE ?auto_25947 ) ( not ( = ?auto_25947 ?auto_25948 ) ) ( AVAILABLE ?auto_25949 ) ( TRUCK-AT ?auto_25952 ?auto_25951 ) ( not ( = ?auto_25951 ?auto_25953 ) ) ( HOIST-AT ?auto_25950 ?auto_25951 ) ( not ( = ?auto_25949 ?auto_25950 ) ) ( AVAILABLE ?auto_25950 ) ( SURFACE-AT ?auto_25947 ?auto_25951 ) ( ON ?auto_25947 ?auto_25954 ) ( CLEAR ?auto_25947 ) ( not ( = ?auto_25947 ?auto_25954 ) ) ( not ( = ?auto_25948 ?auto_25954 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25950 ?auto_25947 ?auto_25954 ?auto_25951 )
      ( MAKE-ON ?auto_25947 ?auto_25948 )
      ( MAKE-ON-VERIFY ?auto_25947 ?auto_25948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25955 - SURFACE
      ?auto_25956 - SURFACE
    )
    :vars
    (
      ?auto_25961 - HOIST
      ?auto_25958 - PLACE
      ?auto_25960 - PLACE
      ?auto_25957 - HOIST
      ?auto_25962 - SURFACE
      ?auto_25959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25961 ?auto_25958 ) ( SURFACE-AT ?auto_25956 ?auto_25958 ) ( CLEAR ?auto_25956 ) ( IS-CRATE ?auto_25955 ) ( not ( = ?auto_25955 ?auto_25956 ) ) ( AVAILABLE ?auto_25961 ) ( not ( = ?auto_25960 ?auto_25958 ) ) ( HOIST-AT ?auto_25957 ?auto_25960 ) ( not ( = ?auto_25961 ?auto_25957 ) ) ( AVAILABLE ?auto_25957 ) ( SURFACE-AT ?auto_25955 ?auto_25960 ) ( ON ?auto_25955 ?auto_25962 ) ( CLEAR ?auto_25955 ) ( not ( = ?auto_25955 ?auto_25962 ) ) ( not ( = ?auto_25956 ?auto_25962 ) ) ( TRUCK-AT ?auto_25959 ?auto_25958 ) )
    :subtasks
    ( ( !DRIVE ?auto_25959 ?auto_25958 ?auto_25960 )
      ( MAKE-ON ?auto_25955 ?auto_25956 )
      ( MAKE-ON-VERIFY ?auto_25955 ?auto_25956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26003 - SURFACE
      ?auto_26004 - SURFACE
    )
    :vars
    (
      ?auto_26008 - HOIST
      ?auto_26007 - PLACE
      ?auto_26009 - PLACE
      ?auto_26010 - HOIST
      ?auto_26005 - SURFACE
      ?auto_26006 - TRUCK
      ?auto_26011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26008 ?auto_26007 ) ( IS-CRATE ?auto_26003 ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26009 ?auto_26007 ) ) ( HOIST-AT ?auto_26010 ?auto_26009 ) ( not ( = ?auto_26008 ?auto_26010 ) ) ( AVAILABLE ?auto_26010 ) ( SURFACE-AT ?auto_26003 ?auto_26009 ) ( ON ?auto_26003 ?auto_26005 ) ( CLEAR ?auto_26003 ) ( not ( = ?auto_26003 ?auto_26005 ) ) ( not ( = ?auto_26004 ?auto_26005 ) ) ( TRUCK-AT ?auto_26006 ?auto_26007 ) ( SURFACE-AT ?auto_26011 ?auto_26007 ) ( CLEAR ?auto_26011 ) ( LIFTING ?auto_26008 ?auto_26004 ) ( IS-CRATE ?auto_26004 ) ( not ( = ?auto_26003 ?auto_26011 ) ) ( not ( = ?auto_26004 ?auto_26011 ) ) ( not ( = ?auto_26005 ?auto_26011 ) ) )
    :subtasks
    ( ( !DROP ?auto_26008 ?auto_26004 ?auto_26011 ?auto_26007 )
      ( MAKE-ON ?auto_26003 ?auto_26004 )
      ( MAKE-ON-VERIFY ?auto_26003 ?auto_26004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26012 - SURFACE
      ?auto_26013 - SURFACE
    )
    :vars
    (
      ?auto_26016 - HOIST
      ?auto_26014 - PLACE
      ?auto_26017 - PLACE
      ?auto_26020 - HOIST
      ?auto_26015 - SURFACE
      ?auto_26019 - TRUCK
      ?auto_26018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26016 ?auto_26014 ) ( IS-CRATE ?auto_26012 ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( not ( = ?auto_26017 ?auto_26014 ) ) ( HOIST-AT ?auto_26020 ?auto_26017 ) ( not ( = ?auto_26016 ?auto_26020 ) ) ( AVAILABLE ?auto_26020 ) ( SURFACE-AT ?auto_26012 ?auto_26017 ) ( ON ?auto_26012 ?auto_26015 ) ( CLEAR ?auto_26012 ) ( not ( = ?auto_26012 ?auto_26015 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( TRUCK-AT ?auto_26019 ?auto_26014 ) ( SURFACE-AT ?auto_26018 ?auto_26014 ) ( CLEAR ?auto_26018 ) ( IS-CRATE ?auto_26013 ) ( not ( = ?auto_26012 ?auto_26018 ) ) ( not ( = ?auto_26013 ?auto_26018 ) ) ( not ( = ?auto_26015 ?auto_26018 ) ) ( AVAILABLE ?auto_26016 ) ( IN ?auto_26013 ?auto_26019 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26016 ?auto_26013 ?auto_26019 ?auto_26014 )
      ( MAKE-ON ?auto_26012 ?auto_26013 )
      ( MAKE-ON-VERIFY ?auto_26012 ?auto_26013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26021 - SURFACE
      ?auto_26022 - SURFACE
    )
    :vars
    (
      ?auto_26027 - HOIST
      ?auto_26025 - PLACE
      ?auto_26026 - PLACE
      ?auto_26028 - HOIST
      ?auto_26024 - SURFACE
      ?auto_26029 - SURFACE
      ?auto_26023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26027 ?auto_26025 ) ( IS-CRATE ?auto_26021 ) ( not ( = ?auto_26021 ?auto_26022 ) ) ( not ( = ?auto_26026 ?auto_26025 ) ) ( HOIST-AT ?auto_26028 ?auto_26026 ) ( not ( = ?auto_26027 ?auto_26028 ) ) ( AVAILABLE ?auto_26028 ) ( SURFACE-AT ?auto_26021 ?auto_26026 ) ( ON ?auto_26021 ?auto_26024 ) ( CLEAR ?auto_26021 ) ( not ( = ?auto_26021 ?auto_26024 ) ) ( not ( = ?auto_26022 ?auto_26024 ) ) ( SURFACE-AT ?auto_26029 ?auto_26025 ) ( CLEAR ?auto_26029 ) ( IS-CRATE ?auto_26022 ) ( not ( = ?auto_26021 ?auto_26029 ) ) ( not ( = ?auto_26022 ?auto_26029 ) ) ( not ( = ?auto_26024 ?auto_26029 ) ) ( AVAILABLE ?auto_26027 ) ( IN ?auto_26022 ?auto_26023 ) ( TRUCK-AT ?auto_26023 ?auto_26026 ) )
    :subtasks
    ( ( !DRIVE ?auto_26023 ?auto_26026 ?auto_26025 )
      ( MAKE-ON ?auto_26021 ?auto_26022 )
      ( MAKE-ON-VERIFY ?auto_26021 ?auto_26022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26030 - SURFACE
      ?auto_26031 - SURFACE
    )
    :vars
    (
      ?auto_26034 - HOIST
      ?auto_26037 - PLACE
      ?auto_26033 - PLACE
      ?auto_26035 - HOIST
      ?auto_26032 - SURFACE
      ?auto_26038 - SURFACE
      ?auto_26036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26034 ?auto_26037 ) ( IS-CRATE ?auto_26030 ) ( not ( = ?auto_26030 ?auto_26031 ) ) ( not ( = ?auto_26033 ?auto_26037 ) ) ( HOIST-AT ?auto_26035 ?auto_26033 ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( SURFACE-AT ?auto_26030 ?auto_26033 ) ( ON ?auto_26030 ?auto_26032 ) ( CLEAR ?auto_26030 ) ( not ( = ?auto_26030 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26032 ) ) ( SURFACE-AT ?auto_26038 ?auto_26037 ) ( CLEAR ?auto_26038 ) ( IS-CRATE ?auto_26031 ) ( not ( = ?auto_26030 ?auto_26038 ) ) ( not ( = ?auto_26031 ?auto_26038 ) ) ( not ( = ?auto_26032 ?auto_26038 ) ) ( AVAILABLE ?auto_26034 ) ( TRUCK-AT ?auto_26036 ?auto_26033 ) ( LIFTING ?auto_26035 ?auto_26031 ) )
    :subtasks
    ( ( !LOAD ?auto_26035 ?auto_26031 ?auto_26036 ?auto_26033 )
      ( MAKE-ON ?auto_26030 ?auto_26031 )
      ( MAKE-ON-VERIFY ?auto_26030 ?auto_26031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26039 - SURFACE
      ?auto_26040 - SURFACE
    )
    :vars
    (
      ?auto_26044 - HOIST
      ?auto_26045 - PLACE
      ?auto_26043 - PLACE
      ?auto_26047 - HOIST
      ?auto_26046 - SURFACE
      ?auto_26041 - SURFACE
      ?auto_26042 - TRUCK
      ?auto_26048 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26044 ?auto_26045 ) ( IS-CRATE ?auto_26039 ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( HOIST-AT ?auto_26047 ?auto_26043 ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( SURFACE-AT ?auto_26039 ?auto_26043 ) ( ON ?auto_26039 ?auto_26046 ) ( CLEAR ?auto_26039 ) ( not ( = ?auto_26039 ?auto_26046 ) ) ( not ( = ?auto_26040 ?auto_26046 ) ) ( SURFACE-AT ?auto_26041 ?auto_26045 ) ( CLEAR ?auto_26041 ) ( IS-CRATE ?auto_26040 ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26040 ?auto_26041 ) ) ( not ( = ?auto_26046 ?auto_26041 ) ) ( AVAILABLE ?auto_26044 ) ( TRUCK-AT ?auto_26042 ?auto_26043 ) ( AVAILABLE ?auto_26047 ) ( SURFACE-AT ?auto_26040 ?auto_26043 ) ( ON ?auto_26040 ?auto_26048 ) ( CLEAR ?auto_26040 ) ( not ( = ?auto_26039 ?auto_26048 ) ) ( not ( = ?auto_26040 ?auto_26048 ) ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( not ( = ?auto_26041 ?auto_26048 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26047 ?auto_26040 ?auto_26048 ?auto_26043 )
      ( MAKE-ON ?auto_26039 ?auto_26040 )
      ( MAKE-ON-VERIFY ?auto_26039 ?auto_26040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26049 - SURFACE
      ?auto_26050 - SURFACE
    )
    :vars
    (
      ?auto_26054 - HOIST
      ?auto_26055 - PLACE
      ?auto_26057 - PLACE
      ?auto_26053 - HOIST
      ?auto_26051 - SURFACE
      ?auto_26052 - SURFACE
      ?auto_26058 - SURFACE
      ?auto_26056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26054 ?auto_26055 ) ( IS-CRATE ?auto_26049 ) ( not ( = ?auto_26049 ?auto_26050 ) ) ( not ( = ?auto_26057 ?auto_26055 ) ) ( HOIST-AT ?auto_26053 ?auto_26057 ) ( not ( = ?auto_26054 ?auto_26053 ) ) ( SURFACE-AT ?auto_26049 ?auto_26057 ) ( ON ?auto_26049 ?auto_26051 ) ( CLEAR ?auto_26049 ) ( not ( = ?auto_26049 ?auto_26051 ) ) ( not ( = ?auto_26050 ?auto_26051 ) ) ( SURFACE-AT ?auto_26052 ?auto_26055 ) ( CLEAR ?auto_26052 ) ( IS-CRATE ?auto_26050 ) ( not ( = ?auto_26049 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26051 ?auto_26052 ) ) ( AVAILABLE ?auto_26054 ) ( AVAILABLE ?auto_26053 ) ( SURFACE-AT ?auto_26050 ?auto_26057 ) ( ON ?auto_26050 ?auto_26058 ) ( CLEAR ?auto_26050 ) ( not ( = ?auto_26049 ?auto_26058 ) ) ( not ( = ?auto_26050 ?auto_26058 ) ) ( not ( = ?auto_26051 ?auto_26058 ) ) ( not ( = ?auto_26052 ?auto_26058 ) ) ( TRUCK-AT ?auto_26056 ?auto_26055 ) )
    :subtasks
    ( ( !DRIVE ?auto_26056 ?auto_26055 ?auto_26057 )
      ( MAKE-ON ?auto_26049 ?auto_26050 )
      ( MAKE-ON-VERIFY ?auto_26049 ?auto_26050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26123 - SURFACE
      ?auto_26124 - SURFACE
    )
    :vars
    (
      ?auto_26128 - HOIST
      ?auto_26127 - PLACE
      ?auto_26129 - PLACE
      ?auto_26130 - HOIST
      ?auto_26126 - SURFACE
      ?auto_26125 - TRUCK
      ?auto_26131 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26128 ?auto_26127 ) ( SURFACE-AT ?auto_26124 ?auto_26127 ) ( CLEAR ?auto_26124 ) ( IS-CRATE ?auto_26123 ) ( not ( = ?auto_26123 ?auto_26124 ) ) ( AVAILABLE ?auto_26128 ) ( not ( = ?auto_26129 ?auto_26127 ) ) ( HOIST-AT ?auto_26130 ?auto_26129 ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( AVAILABLE ?auto_26130 ) ( SURFACE-AT ?auto_26123 ?auto_26129 ) ( ON ?auto_26123 ?auto_26126 ) ( CLEAR ?auto_26123 ) ( not ( = ?auto_26123 ?auto_26126 ) ) ( not ( = ?auto_26124 ?auto_26126 ) ) ( TRUCK-AT ?auto_26125 ?auto_26131 ) ( not ( = ?auto_26131 ?auto_26127 ) ) ( not ( = ?auto_26129 ?auto_26131 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26125 ?auto_26131 ?auto_26127 )
      ( MAKE-ON ?auto_26123 ?auto_26124 )
      ( MAKE-ON-VERIFY ?auto_26123 ?auto_26124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26138 - SURFACE
      ?auto_26139 - SURFACE
    )
    :vars
    (
      ?auto_26140 - HOIST
      ?auto_26145 - PLACE
      ?auto_26144 - PLACE
      ?auto_26143 - HOIST
      ?auto_26142 - SURFACE
      ?auto_26141 - TRUCK
      ?auto_26146 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26140 ?auto_26145 ) ( SURFACE-AT ?auto_26139 ?auto_26145 ) ( CLEAR ?auto_26139 ) ( IS-CRATE ?auto_26138 ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26144 ?auto_26145 ) ) ( HOIST-AT ?auto_26143 ?auto_26144 ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( AVAILABLE ?auto_26143 ) ( SURFACE-AT ?auto_26138 ?auto_26144 ) ( ON ?auto_26138 ?auto_26142 ) ( CLEAR ?auto_26138 ) ( not ( = ?auto_26138 ?auto_26142 ) ) ( not ( = ?auto_26139 ?auto_26142 ) ) ( TRUCK-AT ?auto_26141 ?auto_26145 ) ( LIFTING ?auto_26140 ?auto_26146 ) ( IS-CRATE ?auto_26146 ) ( not ( = ?auto_26138 ?auto_26146 ) ) ( not ( = ?auto_26139 ?auto_26146 ) ) ( not ( = ?auto_26142 ?auto_26146 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26140 ?auto_26146 ?auto_26141 ?auto_26145 )
      ( MAKE-ON ?auto_26138 ?auto_26139 )
      ( MAKE-ON-VERIFY ?auto_26138 ?auto_26139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26247 - SURFACE
      ?auto_26248 - SURFACE
    )
    :vars
    (
      ?auto_26251 - HOIST
      ?auto_26252 - PLACE
      ?auto_26255 - PLACE
      ?auto_26253 - HOIST
      ?auto_26256 - SURFACE
      ?auto_26249 - SURFACE
      ?auto_26254 - SURFACE
      ?auto_26250 - TRUCK
      ?auto_26257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26251 ?auto_26252 ) ( IS-CRATE ?auto_26247 ) ( not ( = ?auto_26247 ?auto_26248 ) ) ( not ( = ?auto_26255 ?auto_26252 ) ) ( HOIST-AT ?auto_26253 ?auto_26255 ) ( not ( = ?auto_26251 ?auto_26253 ) ) ( SURFACE-AT ?auto_26247 ?auto_26255 ) ( ON ?auto_26247 ?auto_26256 ) ( CLEAR ?auto_26247 ) ( not ( = ?auto_26247 ?auto_26256 ) ) ( not ( = ?auto_26248 ?auto_26256 ) ) ( IS-CRATE ?auto_26248 ) ( not ( = ?auto_26247 ?auto_26249 ) ) ( not ( = ?auto_26248 ?auto_26249 ) ) ( not ( = ?auto_26256 ?auto_26249 ) ) ( AVAILABLE ?auto_26253 ) ( SURFACE-AT ?auto_26248 ?auto_26255 ) ( ON ?auto_26248 ?auto_26254 ) ( CLEAR ?auto_26248 ) ( not ( = ?auto_26247 ?auto_26254 ) ) ( not ( = ?auto_26248 ?auto_26254 ) ) ( not ( = ?auto_26256 ?auto_26254 ) ) ( not ( = ?auto_26249 ?auto_26254 ) ) ( TRUCK-AT ?auto_26250 ?auto_26252 ) ( SURFACE-AT ?auto_26257 ?auto_26252 ) ( CLEAR ?auto_26257 ) ( LIFTING ?auto_26251 ?auto_26249 ) ( IS-CRATE ?auto_26249 ) ( not ( = ?auto_26247 ?auto_26257 ) ) ( not ( = ?auto_26248 ?auto_26257 ) ) ( not ( = ?auto_26256 ?auto_26257 ) ) ( not ( = ?auto_26249 ?auto_26257 ) ) ( not ( = ?auto_26254 ?auto_26257 ) ) )
    :subtasks
    ( ( !DROP ?auto_26251 ?auto_26249 ?auto_26257 ?auto_26252 )
      ( MAKE-ON ?auto_26247 ?auto_26248 )
      ( MAKE-ON-VERIFY ?auto_26247 ?auto_26248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26793 - SURFACE
      ?auto_26794 - SURFACE
    )
    :vars
    (
      ?auto_26801 - HOIST
      ?auto_26802 - PLACE
      ?auto_26795 - PLACE
      ?auto_26796 - HOIST
      ?auto_26799 - SURFACE
      ?auto_26798 - SURFACE
      ?auto_26800 - TRUCK
      ?auto_26797 - SURFACE
      ?auto_26803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26801 ?auto_26802 ) ( IS-CRATE ?auto_26793 ) ( not ( = ?auto_26793 ?auto_26794 ) ) ( not ( = ?auto_26795 ?auto_26802 ) ) ( HOIST-AT ?auto_26796 ?auto_26795 ) ( not ( = ?auto_26801 ?auto_26796 ) ) ( SURFACE-AT ?auto_26793 ?auto_26795 ) ( ON ?auto_26793 ?auto_26799 ) ( CLEAR ?auto_26793 ) ( not ( = ?auto_26793 ?auto_26799 ) ) ( not ( = ?auto_26794 ?auto_26799 ) ) ( SURFACE-AT ?auto_26798 ?auto_26802 ) ( CLEAR ?auto_26798 ) ( IS-CRATE ?auto_26794 ) ( not ( = ?auto_26793 ?auto_26798 ) ) ( not ( = ?auto_26794 ?auto_26798 ) ) ( not ( = ?auto_26799 ?auto_26798 ) ) ( AVAILABLE ?auto_26801 ) ( TRUCK-AT ?auto_26800 ?auto_26795 ) ( SURFACE-AT ?auto_26794 ?auto_26795 ) ( ON ?auto_26794 ?auto_26797 ) ( CLEAR ?auto_26794 ) ( not ( = ?auto_26793 ?auto_26797 ) ) ( not ( = ?auto_26794 ?auto_26797 ) ) ( not ( = ?auto_26799 ?auto_26797 ) ) ( not ( = ?auto_26798 ?auto_26797 ) ) ( LIFTING ?auto_26796 ?auto_26803 ) ( IS-CRATE ?auto_26803 ) ( not ( = ?auto_26793 ?auto_26803 ) ) ( not ( = ?auto_26794 ?auto_26803 ) ) ( not ( = ?auto_26799 ?auto_26803 ) ) ( not ( = ?auto_26798 ?auto_26803 ) ) ( not ( = ?auto_26797 ?auto_26803 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26796 ?auto_26803 ?auto_26800 ?auto_26795 )
      ( MAKE-ON ?auto_26793 ?auto_26794 )
      ( MAKE-ON-VERIFY ?auto_26793 ?auto_26794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27147 - SURFACE
      ?auto_27148 - SURFACE
    )
    :vars
    (
      ?auto_27150 - HOIST
      ?auto_27151 - PLACE
      ?auto_27153 - TRUCK
      ?auto_27149 - PLACE
      ?auto_27154 - HOIST
      ?auto_27152 - SURFACE
      ?auto_27155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27150 ?auto_27151 ) ( SURFACE-AT ?auto_27148 ?auto_27151 ) ( CLEAR ?auto_27148 ) ( IS-CRATE ?auto_27147 ) ( not ( = ?auto_27147 ?auto_27148 ) ) ( AVAILABLE ?auto_27150 ) ( TRUCK-AT ?auto_27153 ?auto_27149 ) ( not ( = ?auto_27149 ?auto_27151 ) ) ( HOIST-AT ?auto_27154 ?auto_27149 ) ( not ( = ?auto_27150 ?auto_27154 ) ) ( SURFACE-AT ?auto_27147 ?auto_27149 ) ( ON ?auto_27147 ?auto_27152 ) ( CLEAR ?auto_27147 ) ( not ( = ?auto_27147 ?auto_27152 ) ) ( not ( = ?auto_27148 ?auto_27152 ) ) ( LIFTING ?auto_27154 ?auto_27155 ) ( IS-CRATE ?auto_27155 ) ( not ( = ?auto_27147 ?auto_27155 ) ) ( not ( = ?auto_27148 ?auto_27155 ) ) ( not ( = ?auto_27152 ?auto_27155 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27154 ?auto_27155 ?auto_27153 ?auto_27149 )
      ( MAKE-ON ?auto_27147 ?auto_27148 )
      ( MAKE-ON-VERIFY ?auto_27147 ?auto_27148 ) )
  )

)

