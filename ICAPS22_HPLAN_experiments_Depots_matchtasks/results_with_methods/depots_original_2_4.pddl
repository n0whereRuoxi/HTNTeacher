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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1016 - SURFACE
      ?auto_1017 - SURFACE
    )
    :vars
    (
      ?auto_1018 - HOIST
      ?auto_1019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1018 ?auto_1019 ) ( SURFACE-AT ?auto_1016 ?auto_1019 ) ( CLEAR ?auto_1016 ) ( LIFTING ?auto_1018 ?auto_1017 ) ( IS-CRATE ?auto_1017 ) ( not ( = ?auto_1016 ?auto_1017 ) ) )
    :subtasks
    ( ( !DROP ?auto_1018 ?auto_1017 ?auto_1016 ?auto_1019 )
      ( MAKE-1CRATE-VERIFY ?auto_1016 ?auto_1017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1020 - SURFACE
      ?auto_1021 - SURFACE
    )
    :vars
    (
      ?auto_1022 - HOIST
      ?auto_1023 - PLACE
      ?auto_1024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1022 ?auto_1023 ) ( SURFACE-AT ?auto_1020 ?auto_1023 ) ( CLEAR ?auto_1020 ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( TRUCK-AT ?auto_1024 ?auto_1023 ) ( AVAILABLE ?auto_1022 ) ( IN ?auto_1021 ?auto_1024 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1022 ?auto_1021 ?auto_1024 ?auto_1023 )
      ( MAKE-1CRATE ?auto_1020 ?auto_1021 )
      ( MAKE-1CRATE-VERIFY ?auto_1020 ?auto_1021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1025 - SURFACE
      ?auto_1026 - SURFACE
    )
    :vars
    (
      ?auto_1027 - HOIST
      ?auto_1029 - PLACE
      ?auto_1028 - TRUCK
      ?auto_1030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027 ?auto_1029 ) ( SURFACE-AT ?auto_1025 ?auto_1029 ) ( CLEAR ?auto_1025 ) ( IS-CRATE ?auto_1026 ) ( not ( = ?auto_1025 ?auto_1026 ) ) ( AVAILABLE ?auto_1027 ) ( IN ?auto_1026 ?auto_1028 ) ( TRUCK-AT ?auto_1028 ?auto_1030 ) ( not ( = ?auto_1030 ?auto_1029 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1028 ?auto_1030 ?auto_1029 )
      ( MAKE-1CRATE ?auto_1025 ?auto_1026 )
      ( MAKE-1CRATE-VERIFY ?auto_1025 ?auto_1026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1031 - SURFACE
      ?auto_1032 - SURFACE
    )
    :vars
    (
      ?auto_1033 - HOIST
      ?auto_1034 - PLACE
      ?auto_1036 - TRUCK
      ?auto_1035 - PLACE
      ?auto_1037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1033 ?auto_1034 ) ( SURFACE-AT ?auto_1031 ?auto_1034 ) ( CLEAR ?auto_1031 ) ( IS-CRATE ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( AVAILABLE ?auto_1033 ) ( TRUCK-AT ?auto_1036 ?auto_1035 ) ( not ( = ?auto_1035 ?auto_1034 ) ) ( HOIST-AT ?auto_1037 ?auto_1035 ) ( LIFTING ?auto_1037 ?auto_1032 ) ( not ( = ?auto_1033 ?auto_1037 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1037 ?auto_1032 ?auto_1036 ?auto_1035 )
      ( MAKE-1CRATE ?auto_1031 ?auto_1032 )
      ( MAKE-1CRATE-VERIFY ?auto_1031 ?auto_1032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1038 - SURFACE
      ?auto_1039 - SURFACE
    )
    :vars
    (
      ?auto_1042 - HOIST
      ?auto_1040 - PLACE
      ?auto_1043 - TRUCK
      ?auto_1044 - PLACE
      ?auto_1041 - HOIST
      ?auto_1045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042 ?auto_1040 ) ( SURFACE-AT ?auto_1038 ?auto_1040 ) ( CLEAR ?auto_1038 ) ( IS-CRATE ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1039 ) ) ( AVAILABLE ?auto_1042 ) ( TRUCK-AT ?auto_1043 ?auto_1044 ) ( not ( = ?auto_1044 ?auto_1040 ) ) ( HOIST-AT ?auto_1041 ?auto_1044 ) ( not ( = ?auto_1042 ?auto_1041 ) ) ( AVAILABLE ?auto_1041 ) ( SURFACE-AT ?auto_1039 ?auto_1044 ) ( ON ?auto_1039 ?auto_1045 ) ( CLEAR ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1045 ) ) ( not ( = ?auto_1039 ?auto_1045 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1041 ?auto_1039 ?auto_1045 ?auto_1044 )
      ( MAKE-1CRATE ?auto_1038 ?auto_1039 )
      ( MAKE-1CRATE-VERIFY ?auto_1038 ?auto_1039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
    )
    :vars
    (
      ?auto_1049 - HOIST
      ?auto_1053 - PLACE
      ?auto_1050 - PLACE
      ?auto_1052 - HOIST
      ?auto_1048 - SURFACE
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1049 ?auto_1053 ) ( SURFACE-AT ?auto_1046 ?auto_1053 ) ( CLEAR ?auto_1046 ) ( IS-CRATE ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( AVAILABLE ?auto_1049 ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( HOIST-AT ?auto_1052 ?auto_1050 ) ( not ( = ?auto_1049 ?auto_1052 ) ) ( AVAILABLE ?auto_1052 ) ( SURFACE-AT ?auto_1047 ?auto_1050 ) ( ON ?auto_1047 ?auto_1048 ) ( CLEAR ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1048 ) ) ( not ( = ?auto_1047 ?auto_1048 ) ) ( TRUCK-AT ?auto_1051 ?auto_1053 ) )
    :subtasks
    ( ( !DRIVE ?auto_1051 ?auto_1053 ?auto_1050 )
      ( MAKE-1CRATE ?auto_1046 ?auto_1047 )
      ( MAKE-1CRATE-VERIFY ?auto_1046 ?auto_1047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1059 - SURFACE
      ?auto_1060 - SURFACE
    )
    :vars
    (
      ?auto_1061 - HOIST
      ?auto_1062 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1061 ?auto_1062 ) ( SURFACE-AT ?auto_1059 ?auto_1062 ) ( CLEAR ?auto_1059 ) ( LIFTING ?auto_1061 ?auto_1060 ) ( IS-CRATE ?auto_1060 ) ( not ( = ?auto_1059 ?auto_1060 ) ) )
    :subtasks
    ( ( !DROP ?auto_1061 ?auto_1060 ?auto_1059 ?auto_1062 )
      ( MAKE-1CRATE-VERIFY ?auto_1059 ?auto_1060 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1063 - SURFACE
      ?auto_1064 - SURFACE
      ?auto_1065 - SURFACE
    )
    :vars
    (
      ?auto_1066 - HOIST
      ?auto_1067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1066 ?auto_1067 ) ( SURFACE-AT ?auto_1064 ?auto_1067 ) ( CLEAR ?auto_1064 ) ( LIFTING ?auto_1066 ?auto_1065 ) ( IS-CRATE ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1065 ) ) ( ON ?auto_1064 ?auto_1063 ) ( not ( = ?auto_1063 ?auto_1064 ) ) ( not ( = ?auto_1063 ?auto_1065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1064 ?auto_1065 )
      ( MAKE-2CRATE-VERIFY ?auto_1063 ?auto_1064 ?auto_1065 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1068 - SURFACE
      ?auto_1069 - SURFACE
    )
    :vars
    (
      ?auto_1070 - HOIST
      ?auto_1071 - PLACE
      ?auto_1072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070 ?auto_1071 ) ( SURFACE-AT ?auto_1068 ?auto_1071 ) ( CLEAR ?auto_1068 ) ( IS-CRATE ?auto_1069 ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( TRUCK-AT ?auto_1072 ?auto_1071 ) ( AVAILABLE ?auto_1070 ) ( IN ?auto_1069 ?auto_1072 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1070 ?auto_1069 ?auto_1072 ?auto_1071 )
      ( MAKE-1CRATE ?auto_1068 ?auto_1069 )
      ( MAKE-1CRATE-VERIFY ?auto_1068 ?auto_1069 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1073 - SURFACE
      ?auto_1074 - SURFACE
      ?auto_1075 - SURFACE
    )
    :vars
    (
      ?auto_1076 - HOIST
      ?auto_1077 - PLACE
      ?auto_1078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1076 ?auto_1077 ) ( SURFACE-AT ?auto_1074 ?auto_1077 ) ( CLEAR ?auto_1074 ) ( IS-CRATE ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1075 ) ) ( TRUCK-AT ?auto_1078 ?auto_1077 ) ( AVAILABLE ?auto_1076 ) ( IN ?auto_1075 ?auto_1078 ) ( ON ?auto_1074 ?auto_1073 ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( not ( = ?auto_1073 ?auto_1075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1074 ?auto_1075 )
      ( MAKE-2CRATE-VERIFY ?auto_1073 ?auto_1074 ?auto_1075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1079 - SURFACE
      ?auto_1080 - SURFACE
    )
    :vars
    (
      ?auto_1083 - HOIST
      ?auto_1082 - PLACE
      ?auto_1084 - TRUCK
      ?auto_1081 - SURFACE
      ?auto_1085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1083 ?auto_1082 ) ( SURFACE-AT ?auto_1079 ?auto_1082 ) ( CLEAR ?auto_1079 ) ( IS-CRATE ?auto_1080 ) ( not ( = ?auto_1079 ?auto_1080 ) ) ( AVAILABLE ?auto_1083 ) ( IN ?auto_1080 ?auto_1084 ) ( ON ?auto_1079 ?auto_1081 ) ( not ( = ?auto_1081 ?auto_1079 ) ) ( not ( = ?auto_1081 ?auto_1080 ) ) ( TRUCK-AT ?auto_1084 ?auto_1085 ) ( not ( = ?auto_1085 ?auto_1082 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1084 ?auto_1085 ?auto_1082 )
      ( MAKE-2CRATE ?auto_1081 ?auto_1079 ?auto_1080 )
      ( MAKE-1CRATE-VERIFY ?auto_1079 ?auto_1080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1086 - SURFACE
      ?auto_1087 - SURFACE
      ?auto_1088 - SURFACE
    )
    :vars
    (
      ?auto_1092 - HOIST
      ?auto_1089 - PLACE
      ?auto_1090 - TRUCK
      ?auto_1091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1092 ?auto_1089 ) ( SURFACE-AT ?auto_1087 ?auto_1089 ) ( CLEAR ?auto_1087 ) ( IS-CRATE ?auto_1088 ) ( not ( = ?auto_1087 ?auto_1088 ) ) ( AVAILABLE ?auto_1092 ) ( IN ?auto_1088 ?auto_1090 ) ( ON ?auto_1087 ?auto_1086 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( not ( = ?auto_1086 ?auto_1088 ) ) ( TRUCK-AT ?auto_1090 ?auto_1091 ) ( not ( = ?auto_1091 ?auto_1089 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1087 ?auto_1088 )
      ( MAKE-2CRATE-VERIFY ?auto_1086 ?auto_1087 ?auto_1088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1093 - SURFACE
      ?auto_1094 - SURFACE
    )
    :vars
    (
      ?auto_1099 - HOIST
      ?auto_1095 - PLACE
      ?auto_1098 - SURFACE
      ?auto_1096 - TRUCK
      ?auto_1097 - PLACE
      ?auto_1100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1099 ?auto_1095 ) ( SURFACE-AT ?auto_1093 ?auto_1095 ) ( CLEAR ?auto_1093 ) ( IS-CRATE ?auto_1094 ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( AVAILABLE ?auto_1099 ) ( ON ?auto_1093 ?auto_1098 ) ( not ( = ?auto_1098 ?auto_1093 ) ) ( not ( = ?auto_1098 ?auto_1094 ) ) ( TRUCK-AT ?auto_1096 ?auto_1097 ) ( not ( = ?auto_1097 ?auto_1095 ) ) ( HOIST-AT ?auto_1100 ?auto_1097 ) ( LIFTING ?auto_1100 ?auto_1094 ) ( not ( = ?auto_1099 ?auto_1100 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1100 ?auto_1094 ?auto_1096 ?auto_1097 )
      ( MAKE-2CRATE ?auto_1098 ?auto_1093 ?auto_1094 )
      ( MAKE-1CRATE-VERIFY ?auto_1093 ?auto_1094 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1101 - SURFACE
      ?auto_1102 - SURFACE
      ?auto_1103 - SURFACE
    )
    :vars
    (
      ?auto_1105 - HOIST
      ?auto_1107 - PLACE
      ?auto_1104 - TRUCK
      ?auto_1108 - PLACE
      ?auto_1106 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1105 ?auto_1107 ) ( SURFACE-AT ?auto_1102 ?auto_1107 ) ( CLEAR ?auto_1102 ) ( IS-CRATE ?auto_1103 ) ( not ( = ?auto_1102 ?auto_1103 ) ) ( AVAILABLE ?auto_1105 ) ( ON ?auto_1102 ?auto_1101 ) ( not ( = ?auto_1101 ?auto_1102 ) ) ( not ( = ?auto_1101 ?auto_1103 ) ) ( TRUCK-AT ?auto_1104 ?auto_1108 ) ( not ( = ?auto_1108 ?auto_1107 ) ) ( HOIST-AT ?auto_1106 ?auto_1108 ) ( LIFTING ?auto_1106 ?auto_1103 ) ( not ( = ?auto_1105 ?auto_1106 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1102 ?auto_1103 )
      ( MAKE-2CRATE-VERIFY ?auto_1101 ?auto_1102 ?auto_1103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109 - SURFACE
      ?auto_1110 - SURFACE
    )
    :vars
    (
      ?auto_1116 - HOIST
      ?auto_1111 - PLACE
      ?auto_1115 - SURFACE
      ?auto_1113 - TRUCK
      ?auto_1112 - PLACE
      ?auto_1114 - HOIST
      ?auto_1117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1116 ?auto_1111 ) ( SURFACE-AT ?auto_1109 ?auto_1111 ) ( CLEAR ?auto_1109 ) ( IS-CRATE ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1110 ) ) ( AVAILABLE ?auto_1116 ) ( ON ?auto_1109 ?auto_1115 ) ( not ( = ?auto_1115 ?auto_1109 ) ) ( not ( = ?auto_1115 ?auto_1110 ) ) ( TRUCK-AT ?auto_1113 ?auto_1112 ) ( not ( = ?auto_1112 ?auto_1111 ) ) ( HOIST-AT ?auto_1114 ?auto_1112 ) ( not ( = ?auto_1116 ?auto_1114 ) ) ( AVAILABLE ?auto_1114 ) ( SURFACE-AT ?auto_1110 ?auto_1112 ) ( ON ?auto_1110 ?auto_1117 ) ( CLEAR ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1117 ) ) ( not ( = ?auto_1110 ?auto_1117 ) ) ( not ( = ?auto_1115 ?auto_1117 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1114 ?auto_1110 ?auto_1117 ?auto_1112 )
      ( MAKE-2CRATE ?auto_1115 ?auto_1109 ?auto_1110 )
      ( MAKE-1CRATE-VERIFY ?auto_1109 ?auto_1110 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118 - SURFACE
      ?auto_1119 - SURFACE
      ?auto_1120 - SURFACE
    )
    :vars
    (
      ?auto_1122 - HOIST
      ?auto_1124 - PLACE
      ?auto_1123 - TRUCK
      ?auto_1121 - PLACE
      ?auto_1126 - HOIST
      ?auto_1125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122 ?auto_1124 ) ( SURFACE-AT ?auto_1119 ?auto_1124 ) ( CLEAR ?auto_1119 ) ( IS-CRATE ?auto_1120 ) ( not ( = ?auto_1119 ?auto_1120 ) ) ( AVAILABLE ?auto_1122 ) ( ON ?auto_1119 ?auto_1118 ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( not ( = ?auto_1118 ?auto_1120 ) ) ( TRUCK-AT ?auto_1123 ?auto_1121 ) ( not ( = ?auto_1121 ?auto_1124 ) ) ( HOIST-AT ?auto_1126 ?auto_1121 ) ( not ( = ?auto_1122 ?auto_1126 ) ) ( AVAILABLE ?auto_1126 ) ( SURFACE-AT ?auto_1120 ?auto_1121 ) ( ON ?auto_1120 ?auto_1125 ) ( CLEAR ?auto_1120 ) ( not ( = ?auto_1119 ?auto_1125 ) ) ( not ( = ?auto_1120 ?auto_1125 ) ) ( not ( = ?auto_1118 ?auto_1125 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1119 ?auto_1120 )
      ( MAKE-2CRATE-VERIFY ?auto_1118 ?auto_1119 ?auto_1120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1127 - SURFACE
      ?auto_1128 - SURFACE
    )
    :vars
    (
      ?auto_1129 - HOIST
      ?auto_1134 - PLACE
      ?auto_1135 - SURFACE
      ?auto_1133 - PLACE
      ?auto_1132 - HOIST
      ?auto_1130 - SURFACE
      ?auto_1131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129 ?auto_1134 ) ( SURFACE-AT ?auto_1127 ?auto_1134 ) ( CLEAR ?auto_1127 ) ( IS-CRATE ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1128 ) ) ( AVAILABLE ?auto_1129 ) ( ON ?auto_1127 ?auto_1135 ) ( not ( = ?auto_1135 ?auto_1127 ) ) ( not ( = ?auto_1135 ?auto_1128 ) ) ( not ( = ?auto_1133 ?auto_1134 ) ) ( HOIST-AT ?auto_1132 ?auto_1133 ) ( not ( = ?auto_1129 ?auto_1132 ) ) ( AVAILABLE ?auto_1132 ) ( SURFACE-AT ?auto_1128 ?auto_1133 ) ( ON ?auto_1128 ?auto_1130 ) ( CLEAR ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1130 ) ) ( not ( = ?auto_1128 ?auto_1130 ) ) ( not ( = ?auto_1135 ?auto_1130 ) ) ( TRUCK-AT ?auto_1131 ?auto_1134 ) )
    :subtasks
    ( ( !DRIVE ?auto_1131 ?auto_1134 ?auto_1133 )
      ( MAKE-2CRATE ?auto_1135 ?auto_1127 ?auto_1128 )
      ( MAKE-1CRATE-VERIFY ?auto_1127 ?auto_1128 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1136 - SURFACE
      ?auto_1137 - SURFACE
      ?auto_1138 - SURFACE
    )
    :vars
    (
      ?auto_1139 - HOIST
      ?auto_1140 - PLACE
      ?auto_1142 - PLACE
      ?auto_1143 - HOIST
      ?auto_1141 - SURFACE
      ?auto_1144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1139 ?auto_1140 ) ( SURFACE-AT ?auto_1137 ?auto_1140 ) ( CLEAR ?auto_1137 ) ( IS-CRATE ?auto_1138 ) ( not ( = ?auto_1137 ?auto_1138 ) ) ( AVAILABLE ?auto_1139 ) ( ON ?auto_1137 ?auto_1136 ) ( not ( = ?auto_1136 ?auto_1137 ) ) ( not ( = ?auto_1136 ?auto_1138 ) ) ( not ( = ?auto_1142 ?auto_1140 ) ) ( HOIST-AT ?auto_1143 ?auto_1142 ) ( not ( = ?auto_1139 ?auto_1143 ) ) ( AVAILABLE ?auto_1143 ) ( SURFACE-AT ?auto_1138 ?auto_1142 ) ( ON ?auto_1138 ?auto_1141 ) ( CLEAR ?auto_1138 ) ( not ( = ?auto_1137 ?auto_1141 ) ) ( not ( = ?auto_1138 ?auto_1141 ) ) ( not ( = ?auto_1136 ?auto_1141 ) ) ( TRUCK-AT ?auto_1144 ?auto_1140 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1137 ?auto_1138 )
      ( MAKE-2CRATE-VERIFY ?auto_1136 ?auto_1137 ?auto_1138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1145 - SURFACE
      ?auto_1146 - SURFACE
    )
    :vars
    (
      ?auto_1151 - HOIST
      ?auto_1148 - PLACE
      ?auto_1147 - SURFACE
      ?auto_1153 - PLACE
      ?auto_1150 - HOIST
      ?auto_1149 - SURFACE
      ?auto_1152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1151 ?auto_1148 ) ( IS-CRATE ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1146 ) ) ( not ( = ?auto_1147 ?auto_1145 ) ) ( not ( = ?auto_1147 ?auto_1146 ) ) ( not ( = ?auto_1153 ?auto_1148 ) ) ( HOIST-AT ?auto_1150 ?auto_1153 ) ( not ( = ?auto_1151 ?auto_1150 ) ) ( AVAILABLE ?auto_1150 ) ( SURFACE-AT ?auto_1146 ?auto_1153 ) ( ON ?auto_1146 ?auto_1149 ) ( CLEAR ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1149 ) ) ( not ( = ?auto_1146 ?auto_1149 ) ) ( not ( = ?auto_1147 ?auto_1149 ) ) ( TRUCK-AT ?auto_1152 ?auto_1148 ) ( SURFACE-AT ?auto_1147 ?auto_1148 ) ( CLEAR ?auto_1147 ) ( LIFTING ?auto_1151 ?auto_1145 ) ( IS-CRATE ?auto_1145 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1147 ?auto_1145 )
      ( MAKE-2CRATE ?auto_1147 ?auto_1145 ?auto_1146 )
      ( MAKE-1CRATE-VERIFY ?auto_1145 ?auto_1146 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1154 - SURFACE
      ?auto_1155 - SURFACE
      ?auto_1156 - SURFACE
    )
    :vars
    (
      ?auto_1157 - HOIST
      ?auto_1158 - PLACE
      ?auto_1161 - PLACE
      ?auto_1159 - HOIST
      ?auto_1162 - SURFACE
      ?auto_1160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1157 ?auto_1158 ) ( IS-CRATE ?auto_1156 ) ( not ( = ?auto_1155 ?auto_1156 ) ) ( not ( = ?auto_1154 ?auto_1155 ) ) ( not ( = ?auto_1154 ?auto_1156 ) ) ( not ( = ?auto_1161 ?auto_1158 ) ) ( HOIST-AT ?auto_1159 ?auto_1161 ) ( not ( = ?auto_1157 ?auto_1159 ) ) ( AVAILABLE ?auto_1159 ) ( SURFACE-AT ?auto_1156 ?auto_1161 ) ( ON ?auto_1156 ?auto_1162 ) ( CLEAR ?auto_1156 ) ( not ( = ?auto_1155 ?auto_1162 ) ) ( not ( = ?auto_1156 ?auto_1162 ) ) ( not ( = ?auto_1154 ?auto_1162 ) ) ( TRUCK-AT ?auto_1160 ?auto_1158 ) ( SURFACE-AT ?auto_1154 ?auto_1158 ) ( CLEAR ?auto_1154 ) ( LIFTING ?auto_1157 ?auto_1155 ) ( IS-CRATE ?auto_1155 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1155 ?auto_1156 )
      ( MAKE-2CRATE-VERIFY ?auto_1154 ?auto_1155 ?auto_1156 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1163 - SURFACE
      ?auto_1164 - SURFACE
    )
    :vars
    (
      ?auto_1170 - HOIST
      ?auto_1167 - PLACE
      ?auto_1165 - SURFACE
      ?auto_1166 - PLACE
      ?auto_1169 - HOIST
      ?auto_1171 - SURFACE
      ?auto_1168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1170 ?auto_1167 ) ( IS-CRATE ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1164 ) ) ( not ( = ?auto_1165 ?auto_1163 ) ) ( not ( = ?auto_1165 ?auto_1164 ) ) ( not ( = ?auto_1166 ?auto_1167 ) ) ( HOIST-AT ?auto_1169 ?auto_1166 ) ( not ( = ?auto_1170 ?auto_1169 ) ) ( AVAILABLE ?auto_1169 ) ( SURFACE-AT ?auto_1164 ?auto_1166 ) ( ON ?auto_1164 ?auto_1171 ) ( CLEAR ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1171 ) ) ( not ( = ?auto_1164 ?auto_1171 ) ) ( not ( = ?auto_1165 ?auto_1171 ) ) ( TRUCK-AT ?auto_1168 ?auto_1167 ) ( SURFACE-AT ?auto_1165 ?auto_1167 ) ( CLEAR ?auto_1165 ) ( IS-CRATE ?auto_1163 ) ( AVAILABLE ?auto_1170 ) ( IN ?auto_1163 ?auto_1168 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1170 ?auto_1163 ?auto_1168 ?auto_1167 )
      ( MAKE-2CRATE ?auto_1165 ?auto_1163 ?auto_1164 )
      ( MAKE-1CRATE-VERIFY ?auto_1163 ?auto_1164 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1172 - SURFACE
      ?auto_1173 - SURFACE
      ?auto_1174 - SURFACE
    )
    :vars
    (
      ?auto_1177 - HOIST
      ?auto_1179 - PLACE
      ?auto_1175 - PLACE
      ?auto_1180 - HOIST
      ?auto_1176 - SURFACE
      ?auto_1178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177 ?auto_1179 ) ( IS-CRATE ?auto_1174 ) ( not ( = ?auto_1173 ?auto_1174 ) ) ( not ( = ?auto_1172 ?auto_1173 ) ) ( not ( = ?auto_1172 ?auto_1174 ) ) ( not ( = ?auto_1175 ?auto_1179 ) ) ( HOIST-AT ?auto_1180 ?auto_1175 ) ( not ( = ?auto_1177 ?auto_1180 ) ) ( AVAILABLE ?auto_1180 ) ( SURFACE-AT ?auto_1174 ?auto_1175 ) ( ON ?auto_1174 ?auto_1176 ) ( CLEAR ?auto_1174 ) ( not ( = ?auto_1173 ?auto_1176 ) ) ( not ( = ?auto_1174 ?auto_1176 ) ) ( not ( = ?auto_1172 ?auto_1176 ) ) ( TRUCK-AT ?auto_1178 ?auto_1179 ) ( SURFACE-AT ?auto_1172 ?auto_1179 ) ( CLEAR ?auto_1172 ) ( IS-CRATE ?auto_1173 ) ( AVAILABLE ?auto_1177 ) ( IN ?auto_1173 ?auto_1178 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173 ?auto_1174 )
      ( MAKE-2CRATE-VERIFY ?auto_1172 ?auto_1173 ?auto_1174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1181 - SURFACE
      ?auto_1182 - SURFACE
    )
    :vars
    (
      ?auto_1185 - HOIST
      ?auto_1186 - PLACE
      ?auto_1189 - SURFACE
      ?auto_1183 - PLACE
      ?auto_1184 - HOIST
      ?auto_1188 - SURFACE
      ?auto_1187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1185 ?auto_1186 ) ( IS-CRATE ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1182 ) ) ( not ( = ?auto_1189 ?auto_1181 ) ) ( not ( = ?auto_1189 ?auto_1182 ) ) ( not ( = ?auto_1183 ?auto_1186 ) ) ( HOIST-AT ?auto_1184 ?auto_1183 ) ( not ( = ?auto_1185 ?auto_1184 ) ) ( AVAILABLE ?auto_1184 ) ( SURFACE-AT ?auto_1182 ?auto_1183 ) ( ON ?auto_1182 ?auto_1188 ) ( CLEAR ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1188 ) ) ( not ( = ?auto_1182 ?auto_1188 ) ) ( not ( = ?auto_1189 ?auto_1188 ) ) ( SURFACE-AT ?auto_1189 ?auto_1186 ) ( CLEAR ?auto_1189 ) ( IS-CRATE ?auto_1181 ) ( AVAILABLE ?auto_1185 ) ( IN ?auto_1181 ?auto_1187 ) ( TRUCK-AT ?auto_1187 ?auto_1183 ) )
    :subtasks
    ( ( !DRIVE ?auto_1187 ?auto_1183 ?auto_1186 )
      ( MAKE-2CRATE ?auto_1189 ?auto_1181 ?auto_1182 )
      ( MAKE-1CRATE-VERIFY ?auto_1181 ?auto_1182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1190 - SURFACE
      ?auto_1191 - SURFACE
      ?auto_1192 - SURFACE
    )
    :vars
    (
      ?auto_1198 - HOIST
      ?auto_1193 - PLACE
      ?auto_1196 - PLACE
      ?auto_1197 - HOIST
      ?auto_1195 - SURFACE
      ?auto_1194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1198 ?auto_1193 ) ( IS-CRATE ?auto_1192 ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( not ( = ?auto_1190 ?auto_1191 ) ) ( not ( = ?auto_1190 ?auto_1192 ) ) ( not ( = ?auto_1196 ?auto_1193 ) ) ( HOIST-AT ?auto_1197 ?auto_1196 ) ( not ( = ?auto_1198 ?auto_1197 ) ) ( AVAILABLE ?auto_1197 ) ( SURFACE-AT ?auto_1192 ?auto_1196 ) ( ON ?auto_1192 ?auto_1195 ) ( CLEAR ?auto_1192 ) ( not ( = ?auto_1191 ?auto_1195 ) ) ( not ( = ?auto_1192 ?auto_1195 ) ) ( not ( = ?auto_1190 ?auto_1195 ) ) ( SURFACE-AT ?auto_1190 ?auto_1193 ) ( CLEAR ?auto_1190 ) ( IS-CRATE ?auto_1191 ) ( AVAILABLE ?auto_1198 ) ( IN ?auto_1191 ?auto_1194 ) ( TRUCK-AT ?auto_1194 ?auto_1196 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1191 ?auto_1192 )
      ( MAKE-2CRATE-VERIFY ?auto_1190 ?auto_1191 ?auto_1192 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1199 - SURFACE
      ?auto_1200 - SURFACE
    )
    :vars
    (
      ?auto_1205 - HOIST
      ?auto_1202 - PLACE
      ?auto_1203 - SURFACE
      ?auto_1201 - PLACE
      ?auto_1204 - HOIST
      ?auto_1207 - SURFACE
      ?auto_1206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1205 ?auto_1202 ) ( IS-CRATE ?auto_1200 ) ( not ( = ?auto_1199 ?auto_1200 ) ) ( not ( = ?auto_1203 ?auto_1199 ) ) ( not ( = ?auto_1203 ?auto_1200 ) ) ( not ( = ?auto_1201 ?auto_1202 ) ) ( HOIST-AT ?auto_1204 ?auto_1201 ) ( not ( = ?auto_1205 ?auto_1204 ) ) ( SURFACE-AT ?auto_1200 ?auto_1201 ) ( ON ?auto_1200 ?auto_1207 ) ( CLEAR ?auto_1200 ) ( not ( = ?auto_1199 ?auto_1207 ) ) ( not ( = ?auto_1200 ?auto_1207 ) ) ( not ( = ?auto_1203 ?auto_1207 ) ) ( SURFACE-AT ?auto_1203 ?auto_1202 ) ( CLEAR ?auto_1203 ) ( IS-CRATE ?auto_1199 ) ( AVAILABLE ?auto_1205 ) ( TRUCK-AT ?auto_1206 ?auto_1201 ) ( LIFTING ?auto_1204 ?auto_1199 ) )
    :subtasks
    ( ( !LOAD ?auto_1204 ?auto_1199 ?auto_1206 ?auto_1201 )
      ( MAKE-2CRATE ?auto_1203 ?auto_1199 ?auto_1200 )
      ( MAKE-1CRATE-VERIFY ?auto_1199 ?auto_1200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1208 - SURFACE
      ?auto_1209 - SURFACE
      ?auto_1210 - SURFACE
    )
    :vars
    (
      ?auto_1212 - HOIST
      ?auto_1215 - PLACE
      ?auto_1216 - PLACE
      ?auto_1211 - HOIST
      ?auto_1214 - SURFACE
      ?auto_1213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212 ?auto_1215 ) ( IS-CRATE ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1210 ) ) ( not ( = ?auto_1208 ?auto_1209 ) ) ( not ( = ?auto_1208 ?auto_1210 ) ) ( not ( = ?auto_1216 ?auto_1215 ) ) ( HOIST-AT ?auto_1211 ?auto_1216 ) ( not ( = ?auto_1212 ?auto_1211 ) ) ( SURFACE-AT ?auto_1210 ?auto_1216 ) ( ON ?auto_1210 ?auto_1214 ) ( CLEAR ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1214 ) ) ( not ( = ?auto_1210 ?auto_1214 ) ) ( not ( = ?auto_1208 ?auto_1214 ) ) ( SURFACE-AT ?auto_1208 ?auto_1215 ) ( CLEAR ?auto_1208 ) ( IS-CRATE ?auto_1209 ) ( AVAILABLE ?auto_1212 ) ( TRUCK-AT ?auto_1213 ?auto_1216 ) ( LIFTING ?auto_1211 ?auto_1209 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1209 ?auto_1210 )
      ( MAKE-2CRATE-VERIFY ?auto_1208 ?auto_1209 ?auto_1210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1217 - SURFACE
      ?auto_1218 - SURFACE
    )
    :vars
    (
      ?auto_1223 - HOIST
      ?auto_1222 - PLACE
      ?auto_1225 - SURFACE
      ?auto_1221 - PLACE
      ?auto_1219 - HOIST
      ?auto_1224 - SURFACE
      ?auto_1220 - TRUCK
      ?auto_1226 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1223 ?auto_1222 ) ( IS-CRATE ?auto_1218 ) ( not ( = ?auto_1217 ?auto_1218 ) ) ( not ( = ?auto_1225 ?auto_1217 ) ) ( not ( = ?auto_1225 ?auto_1218 ) ) ( not ( = ?auto_1221 ?auto_1222 ) ) ( HOIST-AT ?auto_1219 ?auto_1221 ) ( not ( = ?auto_1223 ?auto_1219 ) ) ( SURFACE-AT ?auto_1218 ?auto_1221 ) ( ON ?auto_1218 ?auto_1224 ) ( CLEAR ?auto_1218 ) ( not ( = ?auto_1217 ?auto_1224 ) ) ( not ( = ?auto_1218 ?auto_1224 ) ) ( not ( = ?auto_1225 ?auto_1224 ) ) ( SURFACE-AT ?auto_1225 ?auto_1222 ) ( CLEAR ?auto_1225 ) ( IS-CRATE ?auto_1217 ) ( AVAILABLE ?auto_1223 ) ( TRUCK-AT ?auto_1220 ?auto_1221 ) ( AVAILABLE ?auto_1219 ) ( SURFACE-AT ?auto_1217 ?auto_1221 ) ( ON ?auto_1217 ?auto_1226 ) ( CLEAR ?auto_1217 ) ( not ( = ?auto_1217 ?auto_1226 ) ) ( not ( = ?auto_1218 ?auto_1226 ) ) ( not ( = ?auto_1225 ?auto_1226 ) ) ( not ( = ?auto_1224 ?auto_1226 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1219 ?auto_1217 ?auto_1226 ?auto_1221 )
      ( MAKE-2CRATE ?auto_1225 ?auto_1217 ?auto_1218 )
      ( MAKE-1CRATE-VERIFY ?auto_1217 ?auto_1218 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1227 - SURFACE
      ?auto_1228 - SURFACE
      ?auto_1229 - SURFACE
    )
    :vars
    (
      ?auto_1230 - HOIST
      ?auto_1236 - PLACE
      ?auto_1231 - PLACE
      ?auto_1234 - HOIST
      ?auto_1232 - SURFACE
      ?auto_1233 - TRUCK
      ?auto_1235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1230 ?auto_1236 ) ( IS-CRATE ?auto_1229 ) ( not ( = ?auto_1228 ?auto_1229 ) ) ( not ( = ?auto_1227 ?auto_1228 ) ) ( not ( = ?auto_1227 ?auto_1229 ) ) ( not ( = ?auto_1231 ?auto_1236 ) ) ( HOIST-AT ?auto_1234 ?auto_1231 ) ( not ( = ?auto_1230 ?auto_1234 ) ) ( SURFACE-AT ?auto_1229 ?auto_1231 ) ( ON ?auto_1229 ?auto_1232 ) ( CLEAR ?auto_1229 ) ( not ( = ?auto_1228 ?auto_1232 ) ) ( not ( = ?auto_1229 ?auto_1232 ) ) ( not ( = ?auto_1227 ?auto_1232 ) ) ( SURFACE-AT ?auto_1227 ?auto_1236 ) ( CLEAR ?auto_1227 ) ( IS-CRATE ?auto_1228 ) ( AVAILABLE ?auto_1230 ) ( TRUCK-AT ?auto_1233 ?auto_1231 ) ( AVAILABLE ?auto_1234 ) ( SURFACE-AT ?auto_1228 ?auto_1231 ) ( ON ?auto_1228 ?auto_1235 ) ( CLEAR ?auto_1228 ) ( not ( = ?auto_1228 ?auto_1235 ) ) ( not ( = ?auto_1229 ?auto_1235 ) ) ( not ( = ?auto_1227 ?auto_1235 ) ) ( not ( = ?auto_1232 ?auto_1235 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1228 ?auto_1229 )
      ( MAKE-2CRATE-VERIFY ?auto_1227 ?auto_1228 ?auto_1229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1237 - SURFACE
      ?auto_1238 - SURFACE
    )
    :vars
    (
      ?auto_1243 - HOIST
      ?auto_1240 - PLACE
      ?auto_1246 - SURFACE
      ?auto_1244 - PLACE
      ?auto_1242 - HOIST
      ?auto_1245 - SURFACE
      ?auto_1241 - SURFACE
      ?auto_1239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1243 ?auto_1240 ) ( IS-CRATE ?auto_1238 ) ( not ( = ?auto_1237 ?auto_1238 ) ) ( not ( = ?auto_1246 ?auto_1237 ) ) ( not ( = ?auto_1246 ?auto_1238 ) ) ( not ( = ?auto_1244 ?auto_1240 ) ) ( HOIST-AT ?auto_1242 ?auto_1244 ) ( not ( = ?auto_1243 ?auto_1242 ) ) ( SURFACE-AT ?auto_1238 ?auto_1244 ) ( ON ?auto_1238 ?auto_1245 ) ( CLEAR ?auto_1238 ) ( not ( = ?auto_1237 ?auto_1245 ) ) ( not ( = ?auto_1238 ?auto_1245 ) ) ( not ( = ?auto_1246 ?auto_1245 ) ) ( SURFACE-AT ?auto_1246 ?auto_1240 ) ( CLEAR ?auto_1246 ) ( IS-CRATE ?auto_1237 ) ( AVAILABLE ?auto_1243 ) ( AVAILABLE ?auto_1242 ) ( SURFACE-AT ?auto_1237 ?auto_1244 ) ( ON ?auto_1237 ?auto_1241 ) ( CLEAR ?auto_1237 ) ( not ( = ?auto_1237 ?auto_1241 ) ) ( not ( = ?auto_1238 ?auto_1241 ) ) ( not ( = ?auto_1246 ?auto_1241 ) ) ( not ( = ?auto_1245 ?auto_1241 ) ) ( TRUCK-AT ?auto_1239 ?auto_1240 ) )
    :subtasks
    ( ( !DRIVE ?auto_1239 ?auto_1240 ?auto_1244 )
      ( MAKE-2CRATE ?auto_1246 ?auto_1237 ?auto_1238 )
      ( MAKE-1CRATE-VERIFY ?auto_1237 ?auto_1238 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1247 - SURFACE
      ?auto_1248 - SURFACE
      ?auto_1249 - SURFACE
    )
    :vars
    (
      ?auto_1252 - HOIST
      ?auto_1255 - PLACE
      ?auto_1256 - PLACE
      ?auto_1251 - HOIST
      ?auto_1253 - SURFACE
      ?auto_1254 - SURFACE
      ?auto_1250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1252 ?auto_1255 ) ( IS-CRATE ?auto_1249 ) ( not ( = ?auto_1248 ?auto_1249 ) ) ( not ( = ?auto_1247 ?auto_1248 ) ) ( not ( = ?auto_1247 ?auto_1249 ) ) ( not ( = ?auto_1256 ?auto_1255 ) ) ( HOIST-AT ?auto_1251 ?auto_1256 ) ( not ( = ?auto_1252 ?auto_1251 ) ) ( SURFACE-AT ?auto_1249 ?auto_1256 ) ( ON ?auto_1249 ?auto_1253 ) ( CLEAR ?auto_1249 ) ( not ( = ?auto_1248 ?auto_1253 ) ) ( not ( = ?auto_1249 ?auto_1253 ) ) ( not ( = ?auto_1247 ?auto_1253 ) ) ( SURFACE-AT ?auto_1247 ?auto_1255 ) ( CLEAR ?auto_1247 ) ( IS-CRATE ?auto_1248 ) ( AVAILABLE ?auto_1252 ) ( AVAILABLE ?auto_1251 ) ( SURFACE-AT ?auto_1248 ?auto_1256 ) ( ON ?auto_1248 ?auto_1254 ) ( CLEAR ?auto_1248 ) ( not ( = ?auto_1248 ?auto_1254 ) ) ( not ( = ?auto_1249 ?auto_1254 ) ) ( not ( = ?auto_1247 ?auto_1254 ) ) ( not ( = ?auto_1253 ?auto_1254 ) ) ( TRUCK-AT ?auto_1250 ?auto_1255 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1248 ?auto_1249 )
      ( MAKE-2CRATE-VERIFY ?auto_1247 ?auto_1248 ?auto_1249 ) )
  )

)

