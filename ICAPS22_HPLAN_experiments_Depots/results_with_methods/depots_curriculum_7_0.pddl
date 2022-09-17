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
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
    )
    :vars
    (
      ?auto_1004 - HOIST
      ?auto_1005 - PLACE
      ?auto_1007 - PLACE
      ?auto_1008 - HOIST
      ?auto_1009 - SURFACE
      ?auto_1006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004 ?auto_1005 ) ( SURFACE-AT ?auto_1003 ?auto_1005 ) ( CLEAR ?auto_1003 ) ( IS-CRATE ?auto_1002 ) ( AVAILABLE ?auto_1004 ) ( not ( = ?auto_1007 ?auto_1005 ) ) ( HOIST-AT ?auto_1008 ?auto_1007 ) ( AVAILABLE ?auto_1008 ) ( SURFACE-AT ?auto_1002 ?auto_1007 ) ( ON ?auto_1002 ?auto_1009 ) ( CLEAR ?auto_1002 ) ( TRUCK-AT ?auto_1006 ?auto_1005 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1009 ) ) ( not ( = ?auto_1003 ?auto_1009 ) ) ( not ( = ?auto_1004 ?auto_1008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1006 ?auto_1005 ?auto_1007 )
      ( !LIFT ?auto_1008 ?auto_1002 ?auto_1009 ?auto_1007 )
      ( !LOAD ?auto_1008 ?auto_1002 ?auto_1006 ?auto_1007 )
      ( !DRIVE ?auto_1006 ?auto_1007 ?auto_1005 )
      ( !UNLOAD ?auto_1004 ?auto_1002 ?auto_1006 ?auto_1005 )
      ( !DROP ?auto_1004 ?auto_1002 ?auto_1003 ?auto_1005 )
      ( MAKE-ON-VERIFY ?auto_1002 ?auto_1003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1012 - SURFACE
      ?auto_1013 - SURFACE
    )
    :vars
    (
      ?auto_1014 - HOIST
      ?auto_1015 - PLACE
      ?auto_1017 - PLACE
      ?auto_1018 - HOIST
      ?auto_1019 - SURFACE
      ?auto_1016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1014 ?auto_1015 ) ( SURFACE-AT ?auto_1013 ?auto_1015 ) ( CLEAR ?auto_1013 ) ( IS-CRATE ?auto_1012 ) ( AVAILABLE ?auto_1014 ) ( not ( = ?auto_1017 ?auto_1015 ) ) ( HOIST-AT ?auto_1018 ?auto_1017 ) ( AVAILABLE ?auto_1018 ) ( SURFACE-AT ?auto_1012 ?auto_1017 ) ( ON ?auto_1012 ?auto_1019 ) ( CLEAR ?auto_1012 ) ( TRUCK-AT ?auto_1016 ?auto_1015 ) ( not ( = ?auto_1012 ?auto_1013 ) ) ( not ( = ?auto_1012 ?auto_1019 ) ) ( not ( = ?auto_1013 ?auto_1019 ) ) ( not ( = ?auto_1014 ?auto_1018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1016 ?auto_1015 ?auto_1017 )
      ( !LIFT ?auto_1018 ?auto_1012 ?auto_1019 ?auto_1017 )
      ( !LOAD ?auto_1018 ?auto_1012 ?auto_1016 ?auto_1017 )
      ( !DRIVE ?auto_1016 ?auto_1017 ?auto_1015 )
      ( !UNLOAD ?auto_1014 ?auto_1012 ?auto_1016 ?auto_1015 )
      ( !DROP ?auto_1014 ?auto_1012 ?auto_1013 ?auto_1015 )
      ( MAKE-ON-VERIFY ?auto_1012 ?auto_1013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1022 - SURFACE
      ?auto_1023 - SURFACE
    )
    :vars
    (
      ?auto_1024 - HOIST
      ?auto_1025 - PLACE
      ?auto_1027 - PLACE
      ?auto_1028 - HOIST
      ?auto_1029 - SURFACE
      ?auto_1026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1024 ?auto_1025 ) ( SURFACE-AT ?auto_1023 ?auto_1025 ) ( CLEAR ?auto_1023 ) ( IS-CRATE ?auto_1022 ) ( AVAILABLE ?auto_1024 ) ( not ( = ?auto_1027 ?auto_1025 ) ) ( HOIST-AT ?auto_1028 ?auto_1027 ) ( AVAILABLE ?auto_1028 ) ( SURFACE-AT ?auto_1022 ?auto_1027 ) ( ON ?auto_1022 ?auto_1029 ) ( CLEAR ?auto_1022 ) ( TRUCK-AT ?auto_1026 ?auto_1025 ) ( not ( = ?auto_1022 ?auto_1023 ) ) ( not ( = ?auto_1022 ?auto_1029 ) ) ( not ( = ?auto_1023 ?auto_1029 ) ) ( not ( = ?auto_1024 ?auto_1028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1026 ?auto_1025 ?auto_1027 )
      ( !LIFT ?auto_1028 ?auto_1022 ?auto_1029 ?auto_1027 )
      ( !LOAD ?auto_1028 ?auto_1022 ?auto_1026 ?auto_1027 )
      ( !DRIVE ?auto_1026 ?auto_1027 ?auto_1025 )
      ( !UNLOAD ?auto_1024 ?auto_1022 ?auto_1026 ?auto_1025 )
      ( !DROP ?auto_1024 ?auto_1022 ?auto_1023 ?auto_1025 )
      ( MAKE-ON-VERIFY ?auto_1022 ?auto_1023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1032 - SURFACE
      ?auto_1033 - SURFACE
    )
    :vars
    (
      ?auto_1034 - HOIST
      ?auto_1035 - PLACE
      ?auto_1037 - PLACE
      ?auto_1038 - HOIST
      ?auto_1039 - SURFACE
      ?auto_1036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1034 ?auto_1035 ) ( SURFACE-AT ?auto_1033 ?auto_1035 ) ( CLEAR ?auto_1033 ) ( IS-CRATE ?auto_1032 ) ( AVAILABLE ?auto_1034 ) ( not ( = ?auto_1037 ?auto_1035 ) ) ( HOIST-AT ?auto_1038 ?auto_1037 ) ( AVAILABLE ?auto_1038 ) ( SURFACE-AT ?auto_1032 ?auto_1037 ) ( ON ?auto_1032 ?auto_1039 ) ( CLEAR ?auto_1032 ) ( TRUCK-AT ?auto_1036 ?auto_1035 ) ( not ( = ?auto_1032 ?auto_1033 ) ) ( not ( = ?auto_1032 ?auto_1039 ) ) ( not ( = ?auto_1033 ?auto_1039 ) ) ( not ( = ?auto_1034 ?auto_1038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1036 ?auto_1035 ?auto_1037 )
      ( !LIFT ?auto_1038 ?auto_1032 ?auto_1039 ?auto_1037 )
      ( !LOAD ?auto_1038 ?auto_1032 ?auto_1036 ?auto_1037 )
      ( !DRIVE ?auto_1036 ?auto_1037 ?auto_1035 )
      ( !UNLOAD ?auto_1034 ?auto_1032 ?auto_1036 ?auto_1035 )
      ( !DROP ?auto_1034 ?auto_1032 ?auto_1033 ?auto_1035 )
      ( MAKE-ON-VERIFY ?auto_1032 ?auto_1033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1042 - SURFACE
      ?auto_1043 - SURFACE
    )
    :vars
    (
      ?auto_1044 - HOIST
      ?auto_1045 - PLACE
      ?auto_1047 - PLACE
      ?auto_1048 - HOIST
      ?auto_1049 - SURFACE
      ?auto_1046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044 ?auto_1045 ) ( SURFACE-AT ?auto_1043 ?auto_1045 ) ( CLEAR ?auto_1043 ) ( IS-CRATE ?auto_1042 ) ( AVAILABLE ?auto_1044 ) ( not ( = ?auto_1047 ?auto_1045 ) ) ( HOIST-AT ?auto_1048 ?auto_1047 ) ( AVAILABLE ?auto_1048 ) ( SURFACE-AT ?auto_1042 ?auto_1047 ) ( ON ?auto_1042 ?auto_1049 ) ( CLEAR ?auto_1042 ) ( TRUCK-AT ?auto_1046 ?auto_1045 ) ( not ( = ?auto_1042 ?auto_1043 ) ) ( not ( = ?auto_1042 ?auto_1049 ) ) ( not ( = ?auto_1043 ?auto_1049 ) ) ( not ( = ?auto_1044 ?auto_1048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1046 ?auto_1045 ?auto_1047 )
      ( !LIFT ?auto_1048 ?auto_1042 ?auto_1049 ?auto_1047 )
      ( !LOAD ?auto_1048 ?auto_1042 ?auto_1046 ?auto_1047 )
      ( !DRIVE ?auto_1046 ?auto_1047 ?auto_1045 )
      ( !UNLOAD ?auto_1044 ?auto_1042 ?auto_1046 ?auto_1045 )
      ( !DROP ?auto_1044 ?auto_1042 ?auto_1043 ?auto_1045 )
      ( MAKE-ON-VERIFY ?auto_1042 ?auto_1043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1052 - SURFACE
      ?auto_1053 - SURFACE
    )
    :vars
    (
      ?auto_1054 - HOIST
      ?auto_1055 - PLACE
      ?auto_1057 - PLACE
      ?auto_1058 - HOIST
      ?auto_1059 - SURFACE
      ?auto_1056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1054 ?auto_1055 ) ( SURFACE-AT ?auto_1053 ?auto_1055 ) ( CLEAR ?auto_1053 ) ( IS-CRATE ?auto_1052 ) ( AVAILABLE ?auto_1054 ) ( not ( = ?auto_1057 ?auto_1055 ) ) ( HOIST-AT ?auto_1058 ?auto_1057 ) ( AVAILABLE ?auto_1058 ) ( SURFACE-AT ?auto_1052 ?auto_1057 ) ( ON ?auto_1052 ?auto_1059 ) ( CLEAR ?auto_1052 ) ( TRUCK-AT ?auto_1056 ?auto_1055 ) ( not ( = ?auto_1052 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1059 ) ) ( not ( = ?auto_1053 ?auto_1059 ) ) ( not ( = ?auto_1054 ?auto_1058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1056 ?auto_1055 ?auto_1057 )
      ( !LIFT ?auto_1058 ?auto_1052 ?auto_1059 ?auto_1057 )
      ( !LOAD ?auto_1058 ?auto_1052 ?auto_1056 ?auto_1057 )
      ( !DRIVE ?auto_1056 ?auto_1057 ?auto_1055 )
      ( !UNLOAD ?auto_1054 ?auto_1052 ?auto_1056 ?auto_1055 )
      ( !DROP ?auto_1054 ?auto_1052 ?auto_1053 ?auto_1055 )
      ( MAKE-ON-VERIFY ?auto_1052 ?auto_1053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1062 - SURFACE
      ?auto_1063 - SURFACE
    )
    :vars
    (
      ?auto_1064 - HOIST
      ?auto_1065 - PLACE
      ?auto_1067 - PLACE
      ?auto_1068 - HOIST
      ?auto_1069 - SURFACE
      ?auto_1066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1064 ?auto_1065 ) ( SURFACE-AT ?auto_1063 ?auto_1065 ) ( CLEAR ?auto_1063 ) ( IS-CRATE ?auto_1062 ) ( AVAILABLE ?auto_1064 ) ( not ( = ?auto_1067 ?auto_1065 ) ) ( HOIST-AT ?auto_1068 ?auto_1067 ) ( AVAILABLE ?auto_1068 ) ( SURFACE-AT ?auto_1062 ?auto_1067 ) ( ON ?auto_1062 ?auto_1069 ) ( CLEAR ?auto_1062 ) ( TRUCK-AT ?auto_1066 ?auto_1065 ) ( not ( = ?auto_1062 ?auto_1063 ) ) ( not ( = ?auto_1062 ?auto_1069 ) ) ( not ( = ?auto_1063 ?auto_1069 ) ) ( not ( = ?auto_1064 ?auto_1068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1066 ?auto_1065 ?auto_1067 )
      ( !LIFT ?auto_1068 ?auto_1062 ?auto_1069 ?auto_1067 )
      ( !LOAD ?auto_1068 ?auto_1062 ?auto_1066 ?auto_1067 )
      ( !DRIVE ?auto_1066 ?auto_1067 ?auto_1065 )
      ( !UNLOAD ?auto_1064 ?auto_1062 ?auto_1066 ?auto_1065 )
      ( !DROP ?auto_1064 ?auto_1062 ?auto_1063 ?auto_1065 )
      ( MAKE-ON-VERIFY ?auto_1062 ?auto_1063 ) )
  )

)

