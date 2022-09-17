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
      ?auto_1072 - SURFACE
      ?auto_1073 - SURFACE
    )
    :vars
    (
      ?auto_1074 - HOIST
      ?auto_1075 - PLACE
      ?auto_1077 - PLACE
      ?auto_1078 - HOIST
      ?auto_1079 - SURFACE
      ?auto_1076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1074 ?auto_1075 ) ( SURFACE-AT ?auto_1073 ?auto_1075 ) ( CLEAR ?auto_1073 ) ( IS-CRATE ?auto_1072 ) ( AVAILABLE ?auto_1074 ) ( not ( = ?auto_1077 ?auto_1075 ) ) ( HOIST-AT ?auto_1078 ?auto_1077 ) ( AVAILABLE ?auto_1078 ) ( SURFACE-AT ?auto_1072 ?auto_1077 ) ( ON ?auto_1072 ?auto_1079 ) ( CLEAR ?auto_1072 ) ( TRUCK-AT ?auto_1076 ?auto_1075 ) ( not ( = ?auto_1072 ?auto_1073 ) ) ( not ( = ?auto_1072 ?auto_1079 ) ) ( not ( = ?auto_1073 ?auto_1079 ) ) ( not ( = ?auto_1074 ?auto_1078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1076 ?auto_1075 ?auto_1077 )
      ( !LIFT ?auto_1078 ?auto_1072 ?auto_1079 ?auto_1077 )
      ( !LOAD ?auto_1078 ?auto_1072 ?auto_1076 ?auto_1077 )
      ( !DRIVE ?auto_1076 ?auto_1077 ?auto_1075 )
      ( !UNLOAD ?auto_1074 ?auto_1072 ?auto_1076 ?auto_1075 )
      ( !DROP ?auto_1074 ?auto_1072 ?auto_1073 ?auto_1075 )
      ( MAKE-ON-VERIFY ?auto_1072 ?auto_1073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1082 - SURFACE
      ?auto_1083 - SURFACE
    )
    :vars
    (
      ?auto_1084 - HOIST
      ?auto_1085 - PLACE
      ?auto_1087 - PLACE
      ?auto_1088 - HOIST
      ?auto_1089 - SURFACE
      ?auto_1086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1084 ?auto_1085 ) ( SURFACE-AT ?auto_1083 ?auto_1085 ) ( CLEAR ?auto_1083 ) ( IS-CRATE ?auto_1082 ) ( AVAILABLE ?auto_1084 ) ( not ( = ?auto_1087 ?auto_1085 ) ) ( HOIST-AT ?auto_1088 ?auto_1087 ) ( AVAILABLE ?auto_1088 ) ( SURFACE-AT ?auto_1082 ?auto_1087 ) ( ON ?auto_1082 ?auto_1089 ) ( CLEAR ?auto_1082 ) ( TRUCK-AT ?auto_1086 ?auto_1085 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1089 ) ) ( not ( = ?auto_1083 ?auto_1089 ) ) ( not ( = ?auto_1084 ?auto_1088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1086 ?auto_1085 ?auto_1087 )
      ( !LIFT ?auto_1088 ?auto_1082 ?auto_1089 ?auto_1087 )
      ( !LOAD ?auto_1088 ?auto_1082 ?auto_1086 ?auto_1087 )
      ( !DRIVE ?auto_1086 ?auto_1087 ?auto_1085 )
      ( !UNLOAD ?auto_1084 ?auto_1082 ?auto_1086 ?auto_1085 )
      ( !DROP ?auto_1084 ?auto_1082 ?auto_1083 ?auto_1085 )
      ( MAKE-ON-VERIFY ?auto_1082 ?auto_1083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1092 - SURFACE
      ?auto_1093 - SURFACE
    )
    :vars
    (
      ?auto_1094 - HOIST
      ?auto_1095 - PLACE
      ?auto_1097 - PLACE
      ?auto_1098 - HOIST
      ?auto_1099 - SURFACE
      ?auto_1096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094 ?auto_1095 ) ( SURFACE-AT ?auto_1093 ?auto_1095 ) ( CLEAR ?auto_1093 ) ( IS-CRATE ?auto_1092 ) ( AVAILABLE ?auto_1094 ) ( not ( = ?auto_1097 ?auto_1095 ) ) ( HOIST-AT ?auto_1098 ?auto_1097 ) ( AVAILABLE ?auto_1098 ) ( SURFACE-AT ?auto_1092 ?auto_1097 ) ( ON ?auto_1092 ?auto_1099 ) ( CLEAR ?auto_1092 ) ( TRUCK-AT ?auto_1096 ?auto_1095 ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( not ( = ?auto_1092 ?auto_1099 ) ) ( not ( = ?auto_1093 ?auto_1099 ) ) ( not ( = ?auto_1094 ?auto_1098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1096 ?auto_1095 ?auto_1097 )
      ( !LIFT ?auto_1098 ?auto_1092 ?auto_1099 ?auto_1097 )
      ( !LOAD ?auto_1098 ?auto_1092 ?auto_1096 ?auto_1097 )
      ( !DRIVE ?auto_1096 ?auto_1097 ?auto_1095 )
      ( !UNLOAD ?auto_1094 ?auto_1092 ?auto_1096 ?auto_1095 )
      ( !DROP ?auto_1094 ?auto_1092 ?auto_1093 ?auto_1095 )
      ( MAKE-ON-VERIFY ?auto_1092 ?auto_1093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1102 - SURFACE
      ?auto_1103 - SURFACE
    )
    :vars
    (
      ?auto_1104 - HOIST
      ?auto_1105 - PLACE
      ?auto_1107 - PLACE
      ?auto_1108 - HOIST
      ?auto_1109 - SURFACE
      ?auto_1106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1104 ?auto_1105 ) ( SURFACE-AT ?auto_1103 ?auto_1105 ) ( CLEAR ?auto_1103 ) ( IS-CRATE ?auto_1102 ) ( AVAILABLE ?auto_1104 ) ( not ( = ?auto_1107 ?auto_1105 ) ) ( HOIST-AT ?auto_1108 ?auto_1107 ) ( AVAILABLE ?auto_1108 ) ( SURFACE-AT ?auto_1102 ?auto_1107 ) ( ON ?auto_1102 ?auto_1109 ) ( CLEAR ?auto_1102 ) ( TRUCK-AT ?auto_1106 ?auto_1105 ) ( not ( = ?auto_1102 ?auto_1103 ) ) ( not ( = ?auto_1102 ?auto_1109 ) ) ( not ( = ?auto_1103 ?auto_1109 ) ) ( not ( = ?auto_1104 ?auto_1108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1106 ?auto_1105 ?auto_1107 )
      ( !LIFT ?auto_1108 ?auto_1102 ?auto_1109 ?auto_1107 )
      ( !LOAD ?auto_1108 ?auto_1102 ?auto_1106 ?auto_1107 )
      ( !DRIVE ?auto_1106 ?auto_1107 ?auto_1105 )
      ( !UNLOAD ?auto_1104 ?auto_1102 ?auto_1106 ?auto_1105 )
      ( !DROP ?auto_1104 ?auto_1102 ?auto_1103 ?auto_1105 )
      ( MAKE-ON-VERIFY ?auto_1102 ?auto_1103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1112 - SURFACE
      ?auto_1113 - SURFACE
    )
    :vars
    (
      ?auto_1114 - HOIST
      ?auto_1115 - PLACE
      ?auto_1117 - PLACE
      ?auto_1118 - HOIST
      ?auto_1119 - SURFACE
      ?auto_1116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114 ?auto_1115 ) ( SURFACE-AT ?auto_1113 ?auto_1115 ) ( CLEAR ?auto_1113 ) ( IS-CRATE ?auto_1112 ) ( AVAILABLE ?auto_1114 ) ( not ( = ?auto_1117 ?auto_1115 ) ) ( HOIST-AT ?auto_1118 ?auto_1117 ) ( AVAILABLE ?auto_1118 ) ( SURFACE-AT ?auto_1112 ?auto_1117 ) ( ON ?auto_1112 ?auto_1119 ) ( CLEAR ?auto_1112 ) ( TRUCK-AT ?auto_1116 ?auto_1115 ) ( not ( = ?auto_1112 ?auto_1113 ) ) ( not ( = ?auto_1112 ?auto_1119 ) ) ( not ( = ?auto_1113 ?auto_1119 ) ) ( not ( = ?auto_1114 ?auto_1118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1116 ?auto_1115 ?auto_1117 )
      ( !LIFT ?auto_1118 ?auto_1112 ?auto_1119 ?auto_1117 )
      ( !LOAD ?auto_1118 ?auto_1112 ?auto_1116 ?auto_1117 )
      ( !DRIVE ?auto_1116 ?auto_1117 ?auto_1115 )
      ( !UNLOAD ?auto_1114 ?auto_1112 ?auto_1116 ?auto_1115 )
      ( !DROP ?auto_1114 ?auto_1112 ?auto_1113 ?auto_1115 )
      ( MAKE-ON-VERIFY ?auto_1112 ?auto_1113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1122 - SURFACE
      ?auto_1123 - SURFACE
    )
    :vars
    (
      ?auto_1124 - HOIST
      ?auto_1125 - PLACE
      ?auto_1127 - PLACE
      ?auto_1128 - HOIST
      ?auto_1129 - SURFACE
      ?auto_1126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1124 ?auto_1125 ) ( SURFACE-AT ?auto_1123 ?auto_1125 ) ( CLEAR ?auto_1123 ) ( IS-CRATE ?auto_1122 ) ( AVAILABLE ?auto_1124 ) ( not ( = ?auto_1127 ?auto_1125 ) ) ( HOIST-AT ?auto_1128 ?auto_1127 ) ( AVAILABLE ?auto_1128 ) ( SURFACE-AT ?auto_1122 ?auto_1127 ) ( ON ?auto_1122 ?auto_1129 ) ( CLEAR ?auto_1122 ) ( TRUCK-AT ?auto_1126 ?auto_1125 ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( not ( = ?auto_1122 ?auto_1129 ) ) ( not ( = ?auto_1123 ?auto_1129 ) ) ( not ( = ?auto_1124 ?auto_1128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1126 ?auto_1125 ?auto_1127 )
      ( !LIFT ?auto_1128 ?auto_1122 ?auto_1129 ?auto_1127 )
      ( !LOAD ?auto_1128 ?auto_1122 ?auto_1126 ?auto_1127 )
      ( !DRIVE ?auto_1126 ?auto_1127 ?auto_1125 )
      ( !UNLOAD ?auto_1124 ?auto_1122 ?auto_1126 ?auto_1125 )
      ( !DROP ?auto_1124 ?auto_1122 ?auto_1123 ?auto_1125 )
      ( MAKE-ON-VERIFY ?auto_1122 ?auto_1123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1132 - SURFACE
      ?auto_1133 - SURFACE
    )
    :vars
    (
      ?auto_1134 - HOIST
      ?auto_1135 - PLACE
      ?auto_1137 - PLACE
      ?auto_1138 - HOIST
      ?auto_1139 - SURFACE
      ?auto_1136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1134 ?auto_1135 ) ( SURFACE-AT ?auto_1133 ?auto_1135 ) ( CLEAR ?auto_1133 ) ( IS-CRATE ?auto_1132 ) ( AVAILABLE ?auto_1134 ) ( not ( = ?auto_1137 ?auto_1135 ) ) ( HOIST-AT ?auto_1138 ?auto_1137 ) ( AVAILABLE ?auto_1138 ) ( SURFACE-AT ?auto_1132 ?auto_1137 ) ( ON ?auto_1132 ?auto_1139 ) ( CLEAR ?auto_1132 ) ( TRUCK-AT ?auto_1136 ?auto_1135 ) ( not ( = ?auto_1132 ?auto_1133 ) ) ( not ( = ?auto_1132 ?auto_1139 ) ) ( not ( = ?auto_1133 ?auto_1139 ) ) ( not ( = ?auto_1134 ?auto_1138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1136 ?auto_1135 ?auto_1137 )
      ( !LIFT ?auto_1138 ?auto_1132 ?auto_1139 ?auto_1137 )
      ( !LOAD ?auto_1138 ?auto_1132 ?auto_1136 ?auto_1137 )
      ( !DRIVE ?auto_1136 ?auto_1137 ?auto_1135 )
      ( !UNLOAD ?auto_1134 ?auto_1132 ?auto_1136 ?auto_1135 )
      ( !DROP ?auto_1134 ?auto_1132 ?auto_1133 ?auto_1135 )
      ( MAKE-ON-VERIFY ?auto_1132 ?auto_1133 ) )
  )

)

