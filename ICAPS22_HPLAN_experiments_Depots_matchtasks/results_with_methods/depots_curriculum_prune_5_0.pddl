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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_968 - SURFACE
      ?auto_969 - SURFACE
    )
    :vars
    (
      ?auto_970 - HOIST
      ?auto_971 - PLACE
      ?auto_973 - PLACE
      ?auto_974 - HOIST
      ?auto_975 - SURFACE
      ?auto_972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_970 ?auto_971 ) ( SURFACE-AT ?auto_968 ?auto_971 ) ( CLEAR ?auto_968 ) ( IS-CRATE ?auto_969 ) ( AVAILABLE ?auto_970 ) ( not ( = ?auto_973 ?auto_971 ) ) ( HOIST-AT ?auto_974 ?auto_973 ) ( AVAILABLE ?auto_974 ) ( SURFACE-AT ?auto_969 ?auto_973 ) ( ON ?auto_969 ?auto_975 ) ( CLEAR ?auto_969 ) ( TRUCK-AT ?auto_972 ?auto_971 ) ( not ( = ?auto_968 ?auto_969 ) ) ( not ( = ?auto_968 ?auto_975 ) ) ( not ( = ?auto_969 ?auto_975 ) ) ( not ( = ?auto_970 ?auto_974 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_972 ?auto_971 ?auto_973 )
      ( !LIFT ?auto_974 ?auto_969 ?auto_975 ?auto_973 )
      ( !LOAD ?auto_974 ?auto_969 ?auto_972 ?auto_973 )
      ( !DRIVE ?auto_972 ?auto_973 ?auto_971 )
      ( !UNLOAD ?auto_970 ?auto_969 ?auto_972 ?auto_971 )
      ( !DROP ?auto_970 ?auto_969 ?auto_968 ?auto_971 )
      ( MAKE-1CRATE-VERIFY ?auto_968 ?auto_969 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_989 - SURFACE
      ?auto_990 - SURFACE
      ?auto_991 - SURFACE
    )
    :vars
    (
      ?auto_994 - HOIST
      ?auto_992 - PLACE
      ?auto_995 - PLACE
      ?auto_996 - HOIST
      ?auto_997 - SURFACE
      ?auto_999 - PLACE
      ?auto_1000 - HOIST
      ?auto_998 - SURFACE
      ?auto_993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_994 ?auto_992 ) ( IS-CRATE ?auto_991 ) ( not ( = ?auto_995 ?auto_992 ) ) ( HOIST-AT ?auto_996 ?auto_995 ) ( AVAILABLE ?auto_996 ) ( SURFACE-AT ?auto_991 ?auto_995 ) ( ON ?auto_991 ?auto_997 ) ( CLEAR ?auto_991 ) ( not ( = ?auto_990 ?auto_991 ) ) ( not ( = ?auto_990 ?auto_997 ) ) ( not ( = ?auto_991 ?auto_997 ) ) ( not ( = ?auto_994 ?auto_996 ) ) ( SURFACE-AT ?auto_989 ?auto_992 ) ( CLEAR ?auto_989 ) ( IS-CRATE ?auto_990 ) ( AVAILABLE ?auto_994 ) ( not ( = ?auto_999 ?auto_992 ) ) ( HOIST-AT ?auto_1000 ?auto_999 ) ( AVAILABLE ?auto_1000 ) ( SURFACE-AT ?auto_990 ?auto_999 ) ( ON ?auto_990 ?auto_998 ) ( CLEAR ?auto_990 ) ( TRUCK-AT ?auto_993 ?auto_992 ) ( not ( = ?auto_989 ?auto_990 ) ) ( not ( = ?auto_989 ?auto_998 ) ) ( not ( = ?auto_990 ?auto_998 ) ) ( not ( = ?auto_994 ?auto_1000 ) ) ( not ( = ?auto_989 ?auto_991 ) ) ( not ( = ?auto_989 ?auto_997 ) ) ( not ( = ?auto_991 ?auto_998 ) ) ( not ( = ?auto_995 ?auto_999 ) ) ( not ( = ?auto_996 ?auto_1000 ) ) ( not ( = ?auto_997 ?auto_998 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_989 ?auto_990 )
      ( MAKE-1CRATE ?auto_990 ?auto_991 )
      ( MAKE-2CRATE-VERIFY ?auto_989 ?auto_990 ?auto_991 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1015 - SURFACE
      ?auto_1016 - SURFACE
      ?auto_1017 - SURFACE
      ?auto_1018 - SURFACE
    )
    :vars
    (
      ?auto_1021 - HOIST
      ?auto_1023 - PLACE
      ?auto_1022 - PLACE
      ?auto_1019 - HOIST
      ?auto_1020 - SURFACE
      ?auto_1030 - PLACE
      ?auto_1027 - HOIST
      ?auto_1028 - SURFACE
      ?auto_1025 - PLACE
      ?auto_1029 - HOIST
      ?auto_1026 - SURFACE
      ?auto_1024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1021 ?auto_1023 ) ( IS-CRATE ?auto_1018 ) ( not ( = ?auto_1022 ?auto_1023 ) ) ( HOIST-AT ?auto_1019 ?auto_1022 ) ( AVAILABLE ?auto_1019 ) ( SURFACE-AT ?auto_1018 ?auto_1022 ) ( ON ?auto_1018 ?auto_1020 ) ( CLEAR ?auto_1018 ) ( not ( = ?auto_1017 ?auto_1018 ) ) ( not ( = ?auto_1017 ?auto_1020 ) ) ( not ( = ?auto_1018 ?auto_1020 ) ) ( not ( = ?auto_1021 ?auto_1019 ) ) ( IS-CRATE ?auto_1017 ) ( not ( = ?auto_1030 ?auto_1023 ) ) ( HOIST-AT ?auto_1027 ?auto_1030 ) ( AVAILABLE ?auto_1027 ) ( SURFACE-AT ?auto_1017 ?auto_1030 ) ( ON ?auto_1017 ?auto_1028 ) ( CLEAR ?auto_1017 ) ( not ( = ?auto_1016 ?auto_1017 ) ) ( not ( = ?auto_1016 ?auto_1028 ) ) ( not ( = ?auto_1017 ?auto_1028 ) ) ( not ( = ?auto_1021 ?auto_1027 ) ) ( SURFACE-AT ?auto_1015 ?auto_1023 ) ( CLEAR ?auto_1015 ) ( IS-CRATE ?auto_1016 ) ( AVAILABLE ?auto_1021 ) ( not ( = ?auto_1025 ?auto_1023 ) ) ( HOIST-AT ?auto_1029 ?auto_1025 ) ( AVAILABLE ?auto_1029 ) ( SURFACE-AT ?auto_1016 ?auto_1025 ) ( ON ?auto_1016 ?auto_1026 ) ( CLEAR ?auto_1016 ) ( TRUCK-AT ?auto_1024 ?auto_1023 ) ( not ( = ?auto_1015 ?auto_1016 ) ) ( not ( = ?auto_1015 ?auto_1026 ) ) ( not ( = ?auto_1016 ?auto_1026 ) ) ( not ( = ?auto_1021 ?auto_1029 ) ) ( not ( = ?auto_1015 ?auto_1017 ) ) ( not ( = ?auto_1015 ?auto_1028 ) ) ( not ( = ?auto_1017 ?auto_1026 ) ) ( not ( = ?auto_1030 ?auto_1025 ) ) ( not ( = ?auto_1027 ?auto_1029 ) ) ( not ( = ?auto_1028 ?auto_1026 ) ) ( not ( = ?auto_1015 ?auto_1018 ) ) ( not ( = ?auto_1015 ?auto_1020 ) ) ( not ( = ?auto_1016 ?auto_1018 ) ) ( not ( = ?auto_1016 ?auto_1020 ) ) ( not ( = ?auto_1018 ?auto_1028 ) ) ( not ( = ?auto_1018 ?auto_1026 ) ) ( not ( = ?auto_1022 ?auto_1030 ) ) ( not ( = ?auto_1022 ?auto_1025 ) ) ( not ( = ?auto_1019 ?auto_1027 ) ) ( not ( = ?auto_1019 ?auto_1029 ) ) ( not ( = ?auto_1020 ?auto_1028 ) ) ( not ( = ?auto_1020 ?auto_1026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015 ?auto_1016 ?auto_1017 )
      ( MAKE-1CRATE ?auto_1017 ?auto_1018 )
      ( MAKE-3CRATE-VERIFY ?auto_1015 ?auto_1016 ?auto_1017 ?auto_1018 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
      ?auto_1048 - SURFACE
      ?auto_1049 - SURFACE
      ?auto_1050 - SURFACE
    )
    :vars
    (
      ?auto_1052 - HOIST
      ?auto_1054 - PLACE
      ?auto_1056 - PLACE
      ?auto_1055 - HOIST
      ?auto_1053 - SURFACE
      ?auto_1057 - PLACE
      ?auto_1062 - HOIST
      ?auto_1063 - SURFACE
      ?auto_1060 - PLACE
      ?auto_1061 - HOIST
      ?auto_1058 - SURFACE
      ?auto_1059 - SURFACE
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052 ?auto_1054 ) ( IS-CRATE ?auto_1050 ) ( not ( = ?auto_1056 ?auto_1054 ) ) ( HOIST-AT ?auto_1055 ?auto_1056 ) ( SURFACE-AT ?auto_1050 ?auto_1056 ) ( ON ?auto_1050 ?auto_1053 ) ( CLEAR ?auto_1050 ) ( not ( = ?auto_1049 ?auto_1050 ) ) ( not ( = ?auto_1049 ?auto_1053 ) ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1055 ) ) ( IS-CRATE ?auto_1049 ) ( not ( = ?auto_1057 ?auto_1054 ) ) ( HOIST-AT ?auto_1062 ?auto_1057 ) ( AVAILABLE ?auto_1062 ) ( SURFACE-AT ?auto_1049 ?auto_1057 ) ( ON ?auto_1049 ?auto_1063 ) ( CLEAR ?auto_1049 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( not ( = ?auto_1048 ?auto_1063 ) ) ( not ( = ?auto_1049 ?auto_1063 ) ) ( not ( = ?auto_1052 ?auto_1062 ) ) ( IS-CRATE ?auto_1048 ) ( not ( = ?auto_1060 ?auto_1054 ) ) ( HOIST-AT ?auto_1061 ?auto_1060 ) ( AVAILABLE ?auto_1061 ) ( SURFACE-AT ?auto_1048 ?auto_1060 ) ( ON ?auto_1048 ?auto_1058 ) ( CLEAR ?auto_1048 ) ( not ( = ?auto_1047 ?auto_1048 ) ) ( not ( = ?auto_1047 ?auto_1058 ) ) ( not ( = ?auto_1048 ?auto_1058 ) ) ( not ( = ?auto_1052 ?auto_1061 ) ) ( SURFACE-AT ?auto_1046 ?auto_1054 ) ( CLEAR ?auto_1046 ) ( IS-CRATE ?auto_1047 ) ( AVAILABLE ?auto_1052 ) ( AVAILABLE ?auto_1055 ) ( SURFACE-AT ?auto_1047 ?auto_1056 ) ( ON ?auto_1047 ?auto_1059 ) ( CLEAR ?auto_1047 ) ( TRUCK-AT ?auto_1051 ?auto_1054 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( not ( = ?auto_1046 ?auto_1059 ) ) ( not ( = ?auto_1047 ?auto_1059 ) ) ( not ( = ?auto_1046 ?auto_1048 ) ) ( not ( = ?auto_1046 ?auto_1058 ) ) ( not ( = ?auto_1048 ?auto_1059 ) ) ( not ( = ?auto_1060 ?auto_1056 ) ) ( not ( = ?auto_1061 ?auto_1055 ) ) ( not ( = ?auto_1058 ?auto_1059 ) ) ( not ( = ?auto_1046 ?auto_1049 ) ) ( not ( = ?auto_1046 ?auto_1063 ) ) ( not ( = ?auto_1047 ?auto_1049 ) ) ( not ( = ?auto_1047 ?auto_1063 ) ) ( not ( = ?auto_1049 ?auto_1058 ) ) ( not ( = ?auto_1049 ?auto_1059 ) ) ( not ( = ?auto_1057 ?auto_1060 ) ) ( not ( = ?auto_1057 ?auto_1056 ) ) ( not ( = ?auto_1062 ?auto_1061 ) ) ( not ( = ?auto_1062 ?auto_1055 ) ) ( not ( = ?auto_1063 ?auto_1058 ) ) ( not ( = ?auto_1063 ?auto_1059 ) ) ( not ( = ?auto_1046 ?auto_1050 ) ) ( not ( = ?auto_1046 ?auto_1053 ) ) ( not ( = ?auto_1047 ?auto_1050 ) ) ( not ( = ?auto_1047 ?auto_1053 ) ) ( not ( = ?auto_1048 ?auto_1050 ) ) ( not ( = ?auto_1048 ?auto_1053 ) ) ( not ( = ?auto_1050 ?auto_1063 ) ) ( not ( = ?auto_1050 ?auto_1058 ) ) ( not ( = ?auto_1050 ?auto_1059 ) ) ( not ( = ?auto_1053 ?auto_1063 ) ) ( not ( = ?auto_1053 ?auto_1058 ) ) ( not ( = ?auto_1053 ?auto_1059 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1046 ?auto_1047 ?auto_1048 ?auto_1049 )
      ( MAKE-1CRATE ?auto_1049 ?auto_1050 )
      ( MAKE-4CRATE-VERIFY ?auto_1046 ?auto_1047 ?auto_1048 ?auto_1049 ?auto_1050 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1080 - SURFACE
      ?auto_1081 - SURFACE
      ?auto_1082 - SURFACE
      ?auto_1083 - SURFACE
      ?auto_1084 - SURFACE
      ?auto_1085 - SURFACE
    )
    :vars
    (
      ?auto_1086 - HOIST
      ?auto_1091 - PLACE
      ?auto_1090 - PLACE
      ?auto_1089 - HOIST
      ?auto_1087 - SURFACE
      ?auto_1096 - PLACE
      ?auto_1095 - HOIST
      ?auto_1092 - SURFACE
      ?auto_1100 - PLACE
      ?auto_1099 - HOIST
      ?auto_1101 - SURFACE
      ?auto_1098 - PLACE
      ?auto_1093 - HOIST
      ?auto_1097 - SURFACE
      ?auto_1094 - SURFACE
      ?auto_1088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1086 ?auto_1091 ) ( IS-CRATE ?auto_1085 ) ( not ( = ?auto_1090 ?auto_1091 ) ) ( HOIST-AT ?auto_1089 ?auto_1090 ) ( AVAILABLE ?auto_1089 ) ( SURFACE-AT ?auto_1085 ?auto_1090 ) ( ON ?auto_1085 ?auto_1087 ) ( CLEAR ?auto_1085 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1087 ) ) ( not ( = ?auto_1085 ?auto_1087 ) ) ( not ( = ?auto_1086 ?auto_1089 ) ) ( IS-CRATE ?auto_1084 ) ( not ( = ?auto_1096 ?auto_1091 ) ) ( HOIST-AT ?auto_1095 ?auto_1096 ) ( SURFACE-AT ?auto_1084 ?auto_1096 ) ( ON ?auto_1084 ?auto_1092 ) ( CLEAR ?auto_1084 ) ( not ( = ?auto_1083 ?auto_1084 ) ) ( not ( = ?auto_1083 ?auto_1092 ) ) ( not ( = ?auto_1084 ?auto_1092 ) ) ( not ( = ?auto_1086 ?auto_1095 ) ) ( IS-CRATE ?auto_1083 ) ( not ( = ?auto_1100 ?auto_1091 ) ) ( HOIST-AT ?auto_1099 ?auto_1100 ) ( AVAILABLE ?auto_1099 ) ( SURFACE-AT ?auto_1083 ?auto_1100 ) ( ON ?auto_1083 ?auto_1101 ) ( CLEAR ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1101 ) ) ( not ( = ?auto_1083 ?auto_1101 ) ) ( not ( = ?auto_1086 ?auto_1099 ) ) ( IS-CRATE ?auto_1082 ) ( not ( = ?auto_1098 ?auto_1091 ) ) ( HOIST-AT ?auto_1093 ?auto_1098 ) ( AVAILABLE ?auto_1093 ) ( SURFACE-AT ?auto_1082 ?auto_1098 ) ( ON ?auto_1082 ?auto_1097 ) ( CLEAR ?auto_1082 ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( not ( = ?auto_1081 ?auto_1097 ) ) ( not ( = ?auto_1082 ?auto_1097 ) ) ( not ( = ?auto_1086 ?auto_1093 ) ) ( SURFACE-AT ?auto_1080 ?auto_1091 ) ( CLEAR ?auto_1080 ) ( IS-CRATE ?auto_1081 ) ( AVAILABLE ?auto_1086 ) ( AVAILABLE ?auto_1095 ) ( SURFACE-AT ?auto_1081 ?auto_1096 ) ( ON ?auto_1081 ?auto_1094 ) ( CLEAR ?auto_1081 ) ( TRUCK-AT ?auto_1088 ?auto_1091 ) ( not ( = ?auto_1080 ?auto_1081 ) ) ( not ( = ?auto_1080 ?auto_1094 ) ) ( not ( = ?auto_1081 ?auto_1094 ) ) ( not ( = ?auto_1080 ?auto_1082 ) ) ( not ( = ?auto_1080 ?auto_1097 ) ) ( not ( = ?auto_1082 ?auto_1094 ) ) ( not ( = ?auto_1098 ?auto_1096 ) ) ( not ( = ?auto_1093 ?auto_1095 ) ) ( not ( = ?auto_1097 ?auto_1094 ) ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( not ( = ?auto_1080 ?auto_1101 ) ) ( not ( = ?auto_1081 ?auto_1083 ) ) ( not ( = ?auto_1081 ?auto_1101 ) ) ( not ( = ?auto_1083 ?auto_1097 ) ) ( not ( = ?auto_1083 ?auto_1094 ) ) ( not ( = ?auto_1100 ?auto_1098 ) ) ( not ( = ?auto_1100 ?auto_1096 ) ) ( not ( = ?auto_1099 ?auto_1093 ) ) ( not ( = ?auto_1099 ?auto_1095 ) ) ( not ( = ?auto_1101 ?auto_1097 ) ) ( not ( = ?auto_1101 ?auto_1094 ) ) ( not ( = ?auto_1080 ?auto_1084 ) ) ( not ( = ?auto_1080 ?auto_1092 ) ) ( not ( = ?auto_1081 ?auto_1084 ) ) ( not ( = ?auto_1081 ?auto_1092 ) ) ( not ( = ?auto_1082 ?auto_1084 ) ) ( not ( = ?auto_1082 ?auto_1092 ) ) ( not ( = ?auto_1084 ?auto_1101 ) ) ( not ( = ?auto_1084 ?auto_1097 ) ) ( not ( = ?auto_1084 ?auto_1094 ) ) ( not ( = ?auto_1092 ?auto_1101 ) ) ( not ( = ?auto_1092 ?auto_1097 ) ) ( not ( = ?auto_1092 ?auto_1094 ) ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( not ( = ?auto_1080 ?auto_1087 ) ) ( not ( = ?auto_1081 ?auto_1085 ) ) ( not ( = ?auto_1081 ?auto_1087 ) ) ( not ( = ?auto_1082 ?auto_1085 ) ) ( not ( = ?auto_1082 ?auto_1087 ) ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1083 ?auto_1087 ) ) ( not ( = ?auto_1085 ?auto_1092 ) ) ( not ( = ?auto_1085 ?auto_1101 ) ) ( not ( = ?auto_1085 ?auto_1097 ) ) ( not ( = ?auto_1085 ?auto_1094 ) ) ( not ( = ?auto_1090 ?auto_1096 ) ) ( not ( = ?auto_1090 ?auto_1100 ) ) ( not ( = ?auto_1090 ?auto_1098 ) ) ( not ( = ?auto_1089 ?auto_1095 ) ) ( not ( = ?auto_1089 ?auto_1099 ) ) ( not ( = ?auto_1089 ?auto_1093 ) ) ( not ( = ?auto_1087 ?auto_1092 ) ) ( not ( = ?auto_1087 ?auto_1101 ) ) ( not ( = ?auto_1087 ?auto_1097 ) ) ( not ( = ?auto_1087 ?auto_1094 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 )
      ( MAKE-1CRATE ?auto_1084 ?auto_1085 )
      ( MAKE-5CRATE-VERIFY ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 ?auto_1085 ) )
  )

)

