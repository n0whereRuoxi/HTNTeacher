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
      ?auto_1010 - SURFACE
      ?auto_1011 - SURFACE
    )
    :vars
    (
      ?auto_1012 - HOIST
      ?auto_1013 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1012 ?auto_1013 ) ( SURFACE-AT ?auto_1011 ?auto_1013 ) ( CLEAR ?auto_1011 ) ( LIFTING ?auto_1012 ?auto_1010 ) ( IS-CRATE ?auto_1010 ) ( not ( = ?auto_1010 ?auto_1011 ) ) )
    :subtasks
    ( ( !DROP ?auto_1012 ?auto_1010 ?auto_1011 ?auto_1013 )
      ( MAKE-ON-VERIFY ?auto_1010 ?auto_1011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1014 - SURFACE
      ?auto_1015 - SURFACE
    )
    :vars
    (
      ?auto_1016 - HOIST
      ?auto_1017 - PLACE
      ?auto_1018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016 ?auto_1017 ) ( SURFACE-AT ?auto_1015 ?auto_1017 ) ( CLEAR ?auto_1015 ) ( IS-CRATE ?auto_1014 ) ( not ( = ?auto_1014 ?auto_1015 ) ) ( TRUCK-AT ?auto_1018 ?auto_1017 ) ( AVAILABLE ?auto_1016 ) ( IN ?auto_1014 ?auto_1018 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1016 ?auto_1014 ?auto_1018 ?auto_1017 )
      ( MAKE-ON ?auto_1014 ?auto_1015 )
      ( MAKE-ON-VERIFY ?auto_1014 ?auto_1015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1019 - SURFACE
      ?auto_1020 - SURFACE
    )
    :vars
    (
      ?auto_1023 - HOIST
      ?auto_1022 - PLACE
      ?auto_1021 - TRUCK
      ?auto_1024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1023 ?auto_1022 ) ( SURFACE-AT ?auto_1020 ?auto_1022 ) ( CLEAR ?auto_1020 ) ( IS-CRATE ?auto_1019 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( AVAILABLE ?auto_1023 ) ( IN ?auto_1019 ?auto_1021 ) ( TRUCK-AT ?auto_1021 ?auto_1024 ) ( not ( = ?auto_1024 ?auto_1022 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1021 ?auto_1024 ?auto_1022 )
      ( MAKE-ON ?auto_1019 ?auto_1020 )
      ( MAKE-ON-VERIFY ?auto_1019 ?auto_1020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1025 - SURFACE
      ?auto_1026 - SURFACE
    )
    :vars
    (
      ?auto_1028 - HOIST
      ?auto_1030 - PLACE
      ?auto_1027 - TRUCK
      ?auto_1029 - PLACE
      ?auto_1031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028 ?auto_1030 ) ( SURFACE-AT ?auto_1026 ?auto_1030 ) ( CLEAR ?auto_1026 ) ( IS-CRATE ?auto_1025 ) ( not ( = ?auto_1025 ?auto_1026 ) ) ( AVAILABLE ?auto_1028 ) ( TRUCK-AT ?auto_1027 ?auto_1029 ) ( not ( = ?auto_1029 ?auto_1030 ) ) ( HOIST-AT ?auto_1031 ?auto_1029 ) ( LIFTING ?auto_1031 ?auto_1025 ) ( not ( = ?auto_1028 ?auto_1031 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1031 ?auto_1025 ?auto_1027 ?auto_1029 )
      ( MAKE-ON ?auto_1025 ?auto_1026 )
      ( MAKE-ON-VERIFY ?auto_1025 ?auto_1026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1032 - SURFACE
      ?auto_1033 - SURFACE
    )
    :vars
    (
      ?auto_1036 - HOIST
      ?auto_1034 - PLACE
      ?auto_1037 - TRUCK
      ?auto_1035 - PLACE
      ?auto_1038 - HOIST
      ?auto_1039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1036 ?auto_1034 ) ( SURFACE-AT ?auto_1033 ?auto_1034 ) ( CLEAR ?auto_1033 ) ( IS-CRATE ?auto_1032 ) ( not ( = ?auto_1032 ?auto_1033 ) ) ( AVAILABLE ?auto_1036 ) ( TRUCK-AT ?auto_1037 ?auto_1035 ) ( not ( = ?auto_1035 ?auto_1034 ) ) ( HOIST-AT ?auto_1038 ?auto_1035 ) ( not ( = ?auto_1036 ?auto_1038 ) ) ( AVAILABLE ?auto_1038 ) ( SURFACE-AT ?auto_1032 ?auto_1035 ) ( ON ?auto_1032 ?auto_1039 ) ( CLEAR ?auto_1032 ) ( not ( = ?auto_1032 ?auto_1039 ) ) ( not ( = ?auto_1033 ?auto_1039 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1038 ?auto_1032 ?auto_1039 ?auto_1035 )
      ( MAKE-ON ?auto_1032 ?auto_1033 )
      ( MAKE-ON-VERIFY ?auto_1032 ?auto_1033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1040 - SURFACE
      ?auto_1041 - SURFACE
    )
    :vars
    (
      ?auto_1042 - HOIST
      ?auto_1046 - PLACE
      ?auto_1044 - PLACE
      ?auto_1045 - HOIST
      ?auto_1043 - SURFACE
      ?auto_1047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042 ?auto_1046 ) ( SURFACE-AT ?auto_1041 ?auto_1046 ) ( CLEAR ?auto_1041 ) ( IS-CRATE ?auto_1040 ) ( not ( = ?auto_1040 ?auto_1041 ) ) ( AVAILABLE ?auto_1042 ) ( not ( = ?auto_1044 ?auto_1046 ) ) ( HOIST-AT ?auto_1045 ?auto_1044 ) ( not ( = ?auto_1042 ?auto_1045 ) ) ( AVAILABLE ?auto_1045 ) ( SURFACE-AT ?auto_1040 ?auto_1044 ) ( ON ?auto_1040 ?auto_1043 ) ( CLEAR ?auto_1040 ) ( not ( = ?auto_1040 ?auto_1043 ) ) ( not ( = ?auto_1041 ?auto_1043 ) ) ( TRUCK-AT ?auto_1047 ?auto_1046 ) )
    :subtasks
    ( ( !DRIVE ?auto_1047 ?auto_1046 ?auto_1044 )
      ( MAKE-ON ?auto_1040 ?auto_1041 )
      ( MAKE-ON-VERIFY ?auto_1040 ?auto_1041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1050 - SURFACE
      ?auto_1051 - SURFACE
    )
    :vars
    (
      ?auto_1052 - HOIST
      ?auto_1053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052 ?auto_1053 ) ( SURFACE-AT ?auto_1051 ?auto_1053 ) ( CLEAR ?auto_1051 ) ( LIFTING ?auto_1052 ?auto_1050 ) ( IS-CRATE ?auto_1050 ) ( not ( = ?auto_1050 ?auto_1051 ) ) )
    :subtasks
    ( ( !DROP ?auto_1052 ?auto_1050 ?auto_1051 ?auto_1053 )
      ( MAKE-ON-VERIFY ?auto_1050 ?auto_1051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1054 - SURFACE
      ?auto_1055 - SURFACE
    )
    :vars
    (
      ?auto_1057 - HOIST
      ?auto_1056 - PLACE
      ?auto_1058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057 ?auto_1056 ) ( SURFACE-AT ?auto_1055 ?auto_1056 ) ( CLEAR ?auto_1055 ) ( IS-CRATE ?auto_1054 ) ( not ( = ?auto_1054 ?auto_1055 ) ) ( TRUCK-AT ?auto_1058 ?auto_1056 ) ( AVAILABLE ?auto_1057 ) ( IN ?auto_1054 ?auto_1058 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1057 ?auto_1054 ?auto_1058 ?auto_1056 )
      ( MAKE-ON ?auto_1054 ?auto_1055 )
      ( MAKE-ON-VERIFY ?auto_1054 ?auto_1055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1059 - SURFACE
      ?auto_1060 - SURFACE
    )
    :vars
    (
      ?auto_1062 - HOIST
      ?auto_1061 - PLACE
      ?auto_1063 - TRUCK
      ?auto_1064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062 ?auto_1061 ) ( SURFACE-AT ?auto_1060 ?auto_1061 ) ( CLEAR ?auto_1060 ) ( IS-CRATE ?auto_1059 ) ( not ( = ?auto_1059 ?auto_1060 ) ) ( AVAILABLE ?auto_1062 ) ( IN ?auto_1059 ?auto_1063 ) ( TRUCK-AT ?auto_1063 ?auto_1064 ) ( not ( = ?auto_1064 ?auto_1061 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1063 ?auto_1064 ?auto_1061 )
      ( MAKE-ON ?auto_1059 ?auto_1060 )
      ( MAKE-ON-VERIFY ?auto_1059 ?auto_1060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1065 - SURFACE
      ?auto_1066 - SURFACE
    )
    :vars
    (
      ?auto_1070 - HOIST
      ?auto_1067 - PLACE
      ?auto_1068 - TRUCK
      ?auto_1069 - PLACE
      ?auto_1071 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070 ?auto_1067 ) ( SURFACE-AT ?auto_1066 ?auto_1067 ) ( CLEAR ?auto_1066 ) ( IS-CRATE ?auto_1065 ) ( not ( = ?auto_1065 ?auto_1066 ) ) ( AVAILABLE ?auto_1070 ) ( TRUCK-AT ?auto_1068 ?auto_1069 ) ( not ( = ?auto_1069 ?auto_1067 ) ) ( HOIST-AT ?auto_1071 ?auto_1069 ) ( LIFTING ?auto_1071 ?auto_1065 ) ( not ( = ?auto_1070 ?auto_1071 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1071 ?auto_1065 ?auto_1068 ?auto_1069 )
      ( MAKE-ON ?auto_1065 ?auto_1066 )
      ( MAKE-ON-VERIFY ?auto_1065 ?auto_1066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1072 - SURFACE
      ?auto_1073 - SURFACE
    )
    :vars
    (
      ?auto_1078 - HOIST
      ?auto_1076 - PLACE
      ?auto_1074 - TRUCK
      ?auto_1077 - PLACE
      ?auto_1075 - HOIST
      ?auto_1079 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1078 ?auto_1076 ) ( SURFACE-AT ?auto_1073 ?auto_1076 ) ( CLEAR ?auto_1073 ) ( IS-CRATE ?auto_1072 ) ( not ( = ?auto_1072 ?auto_1073 ) ) ( AVAILABLE ?auto_1078 ) ( TRUCK-AT ?auto_1074 ?auto_1077 ) ( not ( = ?auto_1077 ?auto_1076 ) ) ( HOIST-AT ?auto_1075 ?auto_1077 ) ( not ( = ?auto_1078 ?auto_1075 ) ) ( AVAILABLE ?auto_1075 ) ( SURFACE-AT ?auto_1072 ?auto_1077 ) ( ON ?auto_1072 ?auto_1079 ) ( CLEAR ?auto_1072 ) ( not ( = ?auto_1072 ?auto_1079 ) ) ( not ( = ?auto_1073 ?auto_1079 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1075 ?auto_1072 ?auto_1079 ?auto_1077 )
      ( MAKE-ON ?auto_1072 ?auto_1073 )
      ( MAKE-ON-VERIFY ?auto_1072 ?auto_1073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1080 - SURFACE
      ?auto_1081 - SURFACE
    )
    :vars
    (
      ?auto_1082 - HOIST
      ?auto_1086 - PLACE
      ?auto_1083 - PLACE
      ?auto_1084 - HOIST
      ?auto_1085 - SURFACE
      ?auto_1087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082 ?auto_1086 ) ( SURFACE-AT ?auto_1081 ?auto_1086 ) ( CLEAR ?auto_1081 ) ( IS-CRATE ?auto_1080 ) ( not ( = ?auto_1080 ?auto_1081 ) ) ( AVAILABLE ?auto_1082 ) ( not ( = ?auto_1083 ?auto_1086 ) ) ( HOIST-AT ?auto_1084 ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1084 ) ) ( AVAILABLE ?auto_1084 ) ( SURFACE-AT ?auto_1080 ?auto_1083 ) ( ON ?auto_1080 ?auto_1085 ) ( CLEAR ?auto_1080 ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( not ( = ?auto_1081 ?auto_1085 ) ) ( TRUCK-AT ?auto_1087 ?auto_1086 ) )
    :subtasks
    ( ( !DRIVE ?auto_1087 ?auto_1086 ?auto_1083 )
      ( MAKE-ON ?auto_1080 ?auto_1081 )
      ( MAKE-ON-VERIFY ?auto_1080 ?auto_1081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1088 - SURFACE
      ?auto_1089 - SURFACE
    )
    :vars
    (
      ?auto_1093 - HOIST
      ?auto_1095 - PLACE
      ?auto_1094 - PLACE
      ?auto_1091 - HOIST
      ?auto_1092 - SURFACE
      ?auto_1090 - TRUCK
      ?auto_1096 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093 ?auto_1095 ) ( IS-CRATE ?auto_1088 ) ( not ( = ?auto_1088 ?auto_1089 ) ) ( not ( = ?auto_1094 ?auto_1095 ) ) ( HOIST-AT ?auto_1091 ?auto_1094 ) ( not ( = ?auto_1093 ?auto_1091 ) ) ( AVAILABLE ?auto_1091 ) ( SURFACE-AT ?auto_1088 ?auto_1094 ) ( ON ?auto_1088 ?auto_1092 ) ( CLEAR ?auto_1088 ) ( not ( = ?auto_1088 ?auto_1092 ) ) ( not ( = ?auto_1089 ?auto_1092 ) ) ( TRUCK-AT ?auto_1090 ?auto_1095 ) ( SURFACE-AT ?auto_1096 ?auto_1095 ) ( CLEAR ?auto_1096 ) ( LIFTING ?auto_1093 ?auto_1089 ) ( IS-CRATE ?auto_1089 ) ( not ( = ?auto_1088 ?auto_1096 ) ) ( not ( = ?auto_1089 ?auto_1096 ) ) ( not ( = ?auto_1092 ?auto_1096 ) ) )
    :subtasks
    ( ( !DROP ?auto_1093 ?auto_1089 ?auto_1096 ?auto_1095 )
      ( MAKE-ON ?auto_1088 ?auto_1089 )
      ( MAKE-ON-VERIFY ?auto_1088 ?auto_1089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1097 - SURFACE
      ?auto_1098 - SURFACE
    )
    :vars
    (
      ?auto_1101 - HOIST
      ?auto_1100 - PLACE
      ?auto_1099 - PLACE
      ?auto_1102 - HOIST
      ?auto_1103 - SURFACE
      ?auto_1105 - TRUCK
      ?auto_1104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1101 ?auto_1100 ) ( IS-CRATE ?auto_1097 ) ( not ( = ?auto_1097 ?auto_1098 ) ) ( not ( = ?auto_1099 ?auto_1100 ) ) ( HOIST-AT ?auto_1102 ?auto_1099 ) ( not ( = ?auto_1101 ?auto_1102 ) ) ( AVAILABLE ?auto_1102 ) ( SURFACE-AT ?auto_1097 ?auto_1099 ) ( ON ?auto_1097 ?auto_1103 ) ( CLEAR ?auto_1097 ) ( not ( = ?auto_1097 ?auto_1103 ) ) ( not ( = ?auto_1098 ?auto_1103 ) ) ( TRUCK-AT ?auto_1105 ?auto_1100 ) ( SURFACE-AT ?auto_1104 ?auto_1100 ) ( CLEAR ?auto_1104 ) ( IS-CRATE ?auto_1098 ) ( not ( = ?auto_1097 ?auto_1104 ) ) ( not ( = ?auto_1098 ?auto_1104 ) ) ( not ( = ?auto_1103 ?auto_1104 ) ) ( AVAILABLE ?auto_1101 ) ( IN ?auto_1098 ?auto_1105 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1101 ?auto_1098 ?auto_1105 ?auto_1100 )
      ( MAKE-ON ?auto_1097 ?auto_1098 )
      ( MAKE-ON-VERIFY ?auto_1097 ?auto_1098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1106 - SURFACE
      ?auto_1107 - SURFACE
    )
    :vars
    (
      ?auto_1114 - HOIST
      ?auto_1113 - PLACE
      ?auto_1111 - PLACE
      ?auto_1108 - HOIST
      ?auto_1109 - SURFACE
      ?auto_1112 - SURFACE
      ?auto_1110 - TRUCK
      ?auto_1115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114 ?auto_1113 ) ( IS-CRATE ?auto_1106 ) ( not ( = ?auto_1106 ?auto_1107 ) ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( HOIST-AT ?auto_1108 ?auto_1111 ) ( not ( = ?auto_1114 ?auto_1108 ) ) ( AVAILABLE ?auto_1108 ) ( SURFACE-AT ?auto_1106 ?auto_1111 ) ( ON ?auto_1106 ?auto_1109 ) ( CLEAR ?auto_1106 ) ( not ( = ?auto_1106 ?auto_1109 ) ) ( not ( = ?auto_1107 ?auto_1109 ) ) ( SURFACE-AT ?auto_1112 ?auto_1113 ) ( CLEAR ?auto_1112 ) ( IS-CRATE ?auto_1107 ) ( not ( = ?auto_1106 ?auto_1112 ) ) ( not ( = ?auto_1107 ?auto_1112 ) ) ( not ( = ?auto_1109 ?auto_1112 ) ) ( AVAILABLE ?auto_1114 ) ( IN ?auto_1107 ?auto_1110 ) ( TRUCK-AT ?auto_1110 ?auto_1115 ) ( not ( = ?auto_1115 ?auto_1113 ) ) ( not ( = ?auto_1111 ?auto_1115 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1110 ?auto_1115 ?auto_1113 )
      ( MAKE-ON ?auto_1106 ?auto_1107 )
      ( MAKE-ON-VERIFY ?auto_1106 ?auto_1107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1116 - SURFACE
      ?auto_1117 - SURFACE
    )
    :vars
    (
      ?auto_1118 - HOIST
      ?auto_1124 - PLACE
      ?auto_1121 - PLACE
      ?auto_1122 - HOIST
      ?auto_1119 - SURFACE
      ?auto_1125 - SURFACE
      ?auto_1120 - TRUCK
      ?auto_1123 - PLACE
      ?auto_1126 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118 ?auto_1124 ) ( IS-CRATE ?auto_1116 ) ( not ( = ?auto_1116 ?auto_1117 ) ) ( not ( = ?auto_1121 ?auto_1124 ) ) ( HOIST-AT ?auto_1122 ?auto_1121 ) ( not ( = ?auto_1118 ?auto_1122 ) ) ( AVAILABLE ?auto_1122 ) ( SURFACE-AT ?auto_1116 ?auto_1121 ) ( ON ?auto_1116 ?auto_1119 ) ( CLEAR ?auto_1116 ) ( not ( = ?auto_1116 ?auto_1119 ) ) ( not ( = ?auto_1117 ?auto_1119 ) ) ( SURFACE-AT ?auto_1125 ?auto_1124 ) ( CLEAR ?auto_1125 ) ( IS-CRATE ?auto_1117 ) ( not ( = ?auto_1116 ?auto_1125 ) ) ( not ( = ?auto_1117 ?auto_1125 ) ) ( not ( = ?auto_1119 ?auto_1125 ) ) ( AVAILABLE ?auto_1118 ) ( TRUCK-AT ?auto_1120 ?auto_1123 ) ( not ( = ?auto_1123 ?auto_1124 ) ) ( not ( = ?auto_1121 ?auto_1123 ) ) ( HOIST-AT ?auto_1126 ?auto_1123 ) ( LIFTING ?auto_1126 ?auto_1117 ) ( not ( = ?auto_1118 ?auto_1126 ) ) ( not ( = ?auto_1122 ?auto_1126 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1126 ?auto_1117 ?auto_1120 ?auto_1123 )
      ( MAKE-ON ?auto_1116 ?auto_1117 )
      ( MAKE-ON-VERIFY ?auto_1116 ?auto_1117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1127 - SURFACE
      ?auto_1128 - SURFACE
    )
    :vars
    (
      ?auto_1137 - HOIST
      ?auto_1132 - PLACE
      ?auto_1129 - PLACE
      ?auto_1130 - HOIST
      ?auto_1131 - SURFACE
      ?auto_1135 - SURFACE
      ?auto_1134 - TRUCK
      ?auto_1133 - PLACE
      ?auto_1136 - HOIST
      ?auto_1138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137 ?auto_1132 ) ( IS-CRATE ?auto_1127 ) ( not ( = ?auto_1127 ?auto_1128 ) ) ( not ( = ?auto_1129 ?auto_1132 ) ) ( HOIST-AT ?auto_1130 ?auto_1129 ) ( not ( = ?auto_1137 ?auto_1130 ) ) ( AVAILABLE ?auto_1130 ) ( SURFACE-AT ?auto_1127 ?auto_1129 ) ( ON ?auto_1127 ?auto_1131 ) ( CLEAR ?auto_1127 ) ( not ( = ?auto_1127 ?auto_1131 ) ) ( not ( = ?auto_1128 ?auto_1131 ) ) ( SURFACE-AT ?auto_1135 ?auto_1132 ) ( CLEAR ?auto_1135 ) ( IS-CRATE ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1135 ) ) ( not ( = ?auto_1128 ?auto_1135 ) ) ( not ( = ?auto_1131 ?auto_1135 ) ) ( AVAILABLE ?auto_1137 ) ( TRUCK-AT ?auto_1134 ?auto_1133 ) ( not ( = ?auto_1133 ?auto_1132 ) ) ( not ( = ?auto_1129 ?auto_1133 ) ) ( HOIST-AT ?auto_1136 ?auto_1133 ) ( not ( = ?auto_1137 ?auto_1136 ) ) ( not ( = ?auto_1130 ?auto_1136 ) ) ( AVAILABLE ?auto_1136 ) ( SURFACE-AT ?auto_1128 ?auto_1133 ) ( ON ?auto_1128 ?auto_1138 ) ( CLEAR ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1138 ) ) ( not ( = ?auto_1128 ?auto_1138 ) ) ( not ( = ?auto_1131 ?auto_1138 ) ) ( not ( = ?auto_1135 ?auto_1138 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1136 ?auto_1128 ?auto_1138 ?auto_1133 )
      ( MAKE-ON ?auto_1127 ?auto_1128 )
      ( MAKE-ON-VERIFY ?auto_1127 ?auto_1128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1139 - SURFACE
      ?auto_1140 - SURFACE
    )
    :vars
    (
      ?auto_1147 - HOIST
      ?auto_1149 - PLACE
      ?auto_1148 - PLACE
      ?auto_1141 - HOIST
      ?auto_1146 - SURFACE
      ?auto_1144 - SURFACE
      ?auto_1145 - PLACE
      ?auto_1142 - HOIST
      ?auto_1150 - SURFACE
      ?auto_1143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147 ?auto_1149 ) ( IS-CRATE ?auto_1139 ) ( not ( = ?auto_1139 ?auto_1140 ) ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( HOIST-AT ?auto_1141 ?auto_1148 ) ( not ( = ?auto_1147 ?auto_1141 ) ) ( AVAILABLE ?auto_1141 ) ( SURFACE-AT ?auto_1139 ?auto_1148 ) ( ON ?auto_1139 ?auto_1146 ) ( CLEAR ?auto_1139 ) ( not ( = ?auto_1139 ?auto_1146 ) ) ( not ( = ?auto_1140 ?auto_1146 ) ) ( SURFACE-AT ?auto_1144 ?auto_1149 ) ( CLEAR ?auto_1144 ) ( IS-CRATE ?auto_1140 ) ( not ( = ?auto_1139 ?auto_1144 ) ) ( not ( = ?auto_1140 ?auto_1144 ) ) ( not ( = ?auto_1146 ?auto_1144 ) ) ( AVAILABLE ?auto_1147 ) ( not ( = ?auto_1145 ?auto_1149 ) ) ( not ( = ?auto_1148 ?auto_1145 ) ) ( HOIST-AT ?auto_1142 ?auto_1145 ) ( not ( = ?auto_1147 ?auto_1142 ) ) ( not ( = ?auto_1141 ?auto_1142 ) ) ( AVAILABLE ?auto_1142 ) ( SURFACE-AT ?auto_1140 ?auto_1145 ) ( ON ?auto_1140 ?auto_1150 ) ( CLEAR ?auto_1140 ) ( not ( = ?auto_1139 ?auto_1150 ) ) ( not ( = ?auto_1140 ?auto_1150 ) ) ( not ( = ?auto_1146 ?auto_1150 ) ) ( not ( = ?auto_1144 ?auto_1150 ) ) ( TRUCK-AT ?auto_1143 ?auto_1149 ) )
    :subtasks
    ( ( !DRIVE ?auto_1143 ?auto_1149 ?auto_1145 )
      ( MAKE-ON ?auto_1139 ?auto_1140 )
      ( MAKE-ON-VERIFY ?auto_1139 ?auto_1140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1153 - SURFACE
      ?auto_1154 - SURFACE
    )
    :vars
    (
      ?auto_1155 - HOIST
      ?auto_1156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1155 ?auto_1156 ) ( SURFACE-AT ?auto_1154 ?auto_1156 ) ( CLEAR ?auto_1154 ) ( LIFTING ?auto_1155 ?auto_1153 ) ( IS-CRATE ?auto_1153 ) ( not ( = ?auto_1153 ?auto_1154 ) ) )
    :subtasks
    ( ( !DROP ?auto_1155 ?auto_1153 ?auto_1154 ?auto_1156 )
      ( MAKE-ON-VERIFY ?auto_1153 ?auto_1154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1157 - SURFACE
      ?auto_1158 - SURFACE
    )
    :vars
    (
      ?auto_1159 - HOIST
      ?auto_1160 - PLACE
      ?auto_1161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159 ?auto_1160 ) ( SURFACE-AT ?auto_1158 ?auto_1160 ) ( CLEAR ?auto_1158 ) ( IS-CRATE ?auto_1157 ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( TRUCK-AT ?auto_1161 ?auto_1160 ) ( AVAILABLE ?auto_1159 ) ( IN ?auto_1157 ?auto_1161 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1159 ?auto_1157 ?auto_1161 ?auto_1160 )
      ( MAKE-ON ?auto_1157 ?auto_1158 )
      ( MAKE-ON-VERIFY ?auto_1157 ?auto_1158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1162 - SURFACE
      ?auto_1163 - SURFACE
    )
    :vars
    (
      ?auto_1164 - HOIST
      ?auto_1165 - PLACE
      ?auto_1166 - TRUCK
      ?auto_1167 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1164 ?auto_1165 ) ( SURFACE-AT ?auto_1163 ?auto_1165 ) ( CLEAR ?auto_1163 ) ( IS-CRATE ?auto_1162 ) ( not ( = ?auto_1162 ?auto_1163 ) ) ( AVAILABLE ?auto_1164 ) ( IN ?auto_1162 ?auto_1166 ) ( TRUCK-AT ?auto_1166 ?auto_1167 ) ( not ( = ?auto_1167 ?auto_1165 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1166 ?auto_1167 ?auto_1165 )
      ( MAKE-ON ?auto_1162 ?auto_1163 )
      ( MAKE-ON-VERIFY ?auto_1162 ?auto_1163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1168 - SURFACE
      ?auto_1169 - SURFACE
    )
    :vars
    (
      ?auto_1172 - HOIST
      ?auto_1171 - PLACE
      ?auto_1173 - TRUCK
      ?auto_1170 - PLACE
      ?auto_1174 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1172 ?auto_1171 ) ( SURFACE-AT ?auto_1169 ?auto_1171 ) ( CLEAR ?auto_1169 ) ( IS-CRATE ?auto_1168 ) ( not ( = ?auto_1168 ?auto_1169 ) ) ( AVAILABLE ?auto_1172 ) ( TRUCK-AT ?auto_1173 ?auto_1170 ) ( not ( = ?auto_1170 ?auto_1171 ) ) ( HOIST-AT ?auto_1174 ?auto_1170 ) ( LIFTING ?auto_1174 ?auto_1168 ) ( not ( = ?auto_1172 ?auto_1174 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1174 ?auto_1168 ?auto_1173 ?auto_1170 )
      ( MAKE-ON ?auto_1168 ?auto_1169 )
      ( MAKE-ON-VERIFY ?auto_1168 ?auto_1169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1175 - SURFACE
      ?auto_1176 - SURFACE
    )
    :vars
    (
      ?auto_1180 - HOIST
      ?auto_1181 - PLACE
      ?auto_1178 - TRUCK
      ?auto_1179 - PLACE
      ?auto_1177 - HOIST
      ?auto_1182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180 ?auto_1181 ) ( SURFACE-AT ?auto_1176 ?auto_1181 ) ( CLEAR ?auto_1176 ) ( IS-CRATE ?auto_1175 ) ( not ( = ?auto_1175 ?auto_1176 ) ) ( AVAILABLE ?auto_1180 ) ( TRUCK-AT ?auto_1178 ?auto_1179 ) ( not ( = ?auto_1179 ?auto_1181 ) ) ( HOIST-AT ?auto_1177 ?auto_1179 ) ( not ( = ?auto_1180 ?auto_1177 ) ) ( AVAILABLE ?auto_1177 ) ( SURFACE-AT ?auto_1175 ?auto_1179 ) ( ON ?auto_1175 ?auto_1182 ) ( CLEAR ?auto_1175 ) ( not ( = ?auto_1175 ?auto_1182 ) ) ( not ( = ?auto_1176 ?auto_1182 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1177 ?auto_1175 ?auto_1182 ?auto_1179 )
      ( MAKE-ON ?auto_1175 ?auto_1176 )
      ( MAKE-ON-VERIFY ?auto_1175 ?auto_1176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1183 - SURFACE
      ?auto_1184 - SURFACE
    )
    :vars
    (
      ?auto_1188 - HOIST
      ?auto_1189 - PLACE
      ?auto_1187 - PLACE
      ?auto_1185 - HOIST
      ?auto_1186 - SURFACE
      ?auto_1190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188 ?auto_1189 ) ( SURFACE-AT ?auto_1184 ?auto_1189 ) ( CLEAR ?auto_1184 ) ( IS-CRATE ?auto_1183 ) ( not ( = ?auto_1183 ?auto_1184 ) ) ( AVAILABLE ?auto_1188 ) ( not ( = ?auto_1187 ?auto_1189 ) ) ( HOIST-AT ?auto_1185 ?auto_1187 ) ( not ( = ?auto_1188 ?auto_1185 ) ) ( AVAILABLE ?auto_1185 ) ( SURFACE-AT ?auto_1183 ?auto_1187 ) ( ON ?auto_1183 ?auto_1186 ) ( CLEAR ?auto_1183 ) ( not ( = ?auto_1183 ?auto_1186 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( TRUCK-AT ?auto_1190 ?auto_1189 ) )
    :subtasks
    ( ( !DRIVE ?auto_1190 ?auto_1189 ?auto_1187 )
      ( MAKE-ON ?auto_1183 ?auto_1184 )
      ( MAKE-ON-VERIFY ?auto_1183 ?auto_1184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1191 - SURFACE
      ?auto_1192 - SURFACE
    )
    :vars
    (
      ?auto_1196 - HOIST
      ?auto_1197 - PLACE
      ?auto_1195 - PLACE
      ?auto_1194 - HOIST
      ?auto_1193 - SURFACE
      ?auto_1198 - TRUCK
      ?auto_1199 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1196 ?auto_1197 ) ( IS-CRATE ?auto_1191 ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( not ( = ?auto_1195 ?auto_1197 ) ) ( HOIST-AT ?auto_1194 ?auto_1195 ) ( not ( = ?auto_1196 ?auto_1194 ) ) ( AVAILABLE ?auto_1194 ) ( SURFACE-AT ?auto_1191 ?auto_1195 ) ( ON ?auto_1191 ?auto_1193 ) ( CLEAR ?auto_1191 ) ( not ( = ?auto_1191 ?auto_1193 ) ) ( not ( = ?auto_1192 ?auto_1193 ) ) ( TRUCK-AT ?auto_1198 ?auto_1197 ) ( SURFACE-AT ?auto_1199 ?auto_1197 ) ( CLEAR ?auto_1199 ) ( LIFTING ?auto_1196 ?auto_1192 ) ( IS-CRATE ?auto_1192 ) ( not ( = ?auto_1191 ?auto_1199 ) ) ( not ( = ?auto_1192 ?auto_1199 ) ) ( not ( = ?auto_1193 ?auto_1199 ) ) )
    :subtasks
    ( ( !DROP ?auto_1196 ?auto_1192 ?auto_1199 ?auto_1197 )
      ( MAKE-ON ?auto_1191 ?auto_1192 )
      ( MAKE-ON-VERIFY ?auto_1191 ?auto_1192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1200 - SURFACE
      ?auto_1201 - SURFACE
    )
    :vars
    (
      ?auto_1205 - HOIST
      ?auto_1202 - PLACE
      ?auto_1206 - PLACE
      ?auto_1207 - HOIST
      ?auto_1204 - SURFACE
      ?auto_1208 - TRUCK
      ?auto_1203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1205 ?auto_1202 ) ( IS-CRATE ?auto_1200 ) ( not ( = ?auto_1200 ?auto_1201 ) ) ( not ( = ?auto_1206 ?auto_1202 ) ) ( HOIST-AT ?auto_1207 ?auto_1206 ) ( not ( = ?auto_1205 ?auto_1207 ) ) ( AVAILABLE ?auto_1207 ) ( SURFACE-AT ?auto_1200 ?auto_1206 ) ( ON ?auto_1200 ?auto_1204 ) ( CLEAR ?auto_1200 ) ( not ( = ?auto_1200 ?auto_1204 ) ) ( not ( = ?auto_1201 ?auto_1204 ) ) ( TRUCK-AT ?auto_1208 ?auto_1202 ) ( SURFACE-AT ?auto_1203 ?auto_1202 ) ( CLEAR ?auto_1203 ) ( IS-CRATE ?auto_1201 ) ( not ( = ?auto_1200 ?auto_1203 ) ) ( not ( = ?auto_1201 ?auto_1203 ) ) ( not ( = ?auto_1204 ?auto_1203 ) ) ( AVAILABLE ?auto_1205 ) ( IN ?auto_1201 ?auto_1208 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1205 ?auto_1201 ?auto_1208 ?auto_1202 )
      ( MAKE-ON ?auto_1200 ?auto_1201 )
      ( MAKE-ON-VERIFY ?auto_1200 ?auto_1201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1209 - SURFACE
      ?auto_1210 - SURFACE
    )
    :vars
    (
      ?auto_1211 - HOIST
      ?auto_1216 - PLACE
      ?auto_1212 - PLACE
      ?auto_1217 - HOIST
      ?auto_1213 - SURFACE
      ?auto_1215 - SURFACE
      ?auto_1214 - TRUCK
      ?auto_1218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1211 ?auto_1216 ) ( IS-CRATE ?auto_1209 ) ( not ( = ?auto_1209 ?auto_1210 ) ) ( not ( = ?auto_1212 ?auto_1216 ) ) ( HOIST-AT ?auto_1217 ?auto_1212 ) ( not ( = ?auto_1211 ?auto_1217 ) ) ( AVAILABLE ?auto_1217 ) ( SURFACE-AT ?auto_1209 ?auto_1212 ) ( ON ?auto_1209 ?auto_1213 ) ( CLEAR ?auto_1209 ) ( not ( = ?auto_1209 ?auto_1213 ) ) ( not ( = ?auto_1210 ?auto_1213 ) ) ( SURFACE-AT ?auto_1215 ?auto_1216 ) ( CLEAR ?auto_1215 ) ( IS-CRATE ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1215 ) ) ( not ( = ?auto_1210 ?auto_1215 ) ) ( not ( = ?auto_1213 ?auto_1215 ) ) ( AVAILABLE ?auto_1211 ) ( IN ?auto_1210 ?auto_1214 ) ( TRUCK-AT ?auto_1214 ?auto_1218 ) ( not ( = ?auto_1218 ?auto_1216 ) ) ( not ( = ?auto_1212 ?auto_1218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1214 ?auto_1218 ?auto_1216 )
      ( MAKE-ON ?auto_1209 ?auto_1210 )
      ( MAKE-ON-VERIFY ?auto_1209 ?auto_1210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1219 - SURFACE
      ?auto_1220 - SURFACE
    )
    :vars
    (
      ?auto_1224 - HOIST
      ?auto_1228 - PLACE
      ?auto_1226 - PLACE
      ?auto_1223 - HOIST
      ?auto_1221 - SURFACE
      ?auto_1227 - SURFACE
      ?auto_1222 - TRUCK
      ?auto_1225 - PLACE
      ?auto_1229 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224 ?auto_1228 ) ( IS-CRATE ?auto_1219 ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( not ( = ?auto_1226 ?auto_1228 ) ) ( HOIST-AT ?auto_1223 ?auto_1226 ) ( not ( = ?auto_1224 ?auto_1223 ) ) ( AVAILABLE ?auto_1223 ) ( SURFACE-AT ?auto_1219 ?auto_1226 ) ( ON ?auto_1219 ?auto_1221 ) ( CLEAR ?auto_1219 ) ( not ( = ?auto_1219 ?auto_1221 ) ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( SURFACE-AT ?auto_1227 ?auto_1228 ) ( CLEAR ?auto_1227 ) ( IS-CRATE ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1227 ) ) ( not ( = ?auto_1220 ?auto_1227 ) ) ( not ( = ?auto_1221 ?auto_1227 ) ) ( AVAILABLE ?auto_1224 ) ( TRUCK-AT ?auto_1222 ?auto_1225 ) ( not ( = ?auto_1225 ?auto_1228 ) ) ( not ( = ?auto_1226 ?auto_1225 ) ) ( HOIST-AT ?auto_1229 ?auto_1225 ) ( LIFTING ?auto_1229 ?auto_1220 ) ( not ( = ?auto_1224 ?auto_1229 ) ) ( not ( = ?auto_1223 ?auto_1229 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1229 ?auto_1220 ?auto_1222 ?auto_1225 )
      ( MAKE-ON ?auto_1219 ?auto_1220 )
      ( MAKE-ON-VERIFY ?auto_1219 ?auto_1220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1230 - SURFACE
      ?auto_1231 - SURFACE
    )
    :vars
    (
      ?auto_1232 - HOIST
      ?auto_1234 - PLACE
      ?auto_1238 - PLACE
      ?auto_1233 - HOIST
      ?auto_1240 - SURFACE
      ?auto_1235 - SURFACE
      ?auto_1237 - TRUCK
      ?auto_1236 - PLACE
      ?auto_1239 - HOIST
      ?auto_1241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1232 ?auto_1234 ) ( IS-CRATE ?auto_1230 ) ( not ( = ?auto_1230 ?auto_1231 ) ) ( not ( = ?auto_1238 ?auto_1234 ) ) ( HOIST-AT ?auto_1233 ?auto_1238 ) ( not ( = ?auto_1232 ?auto_1233 ) ) ( AVAILABLE ?auto_1233 ) ( SURFACE-AT ?auto_1230 ?auto_1238 ) ( ON ?auto_1230 ?auto_1240 ) ( CLEAR ?auto_1230 ) ( not ( = ?auto_1230 ?auto_1240 ) ) ( not ( = ?auto_1231 ?auto_1240 ) ) ( SURFACE-AT ?auto_1235 ?auto_1234 ) ( CLEAR ?auto_1235 ) ( IS-CRATE ?auto_1231 ) ( not ( = ?auto_1230 ?auto_1235 ) ) ( not ( = ?auto_1231 ?auto_1235 ) ) ( not ( = ?auto_1240 ?auto_1235 ) ) ( AVAILABLE ?auto_1232 ) ( TRUCK-AT ?auto_1237 ?auto_1236 ) ( not ( = ?auto_1236 ?auto_1234 ) ) ( not ( = ?auto_1238 ?auto_1236 ) ) ( HOIST-AT ?auto_1239 ?auto_1236 ) ( not ( = ?auto_1232 ?auto_1239 ) ) ( not ( = ?auto_1233 ?auto_1239 ) ) ( AVAILABLE ?auto_1239 ) ( SURFACE-AT ?auto_1231 ?auto_1236 ) ( ON ?auto_1231 ?auto_1241 ) ( CLEAR ?auto_1231 ) ( not ( = ?auto_1230 ?auto_1241 ) ) ( not ( = ?auto_1231 ?auto_1241 ) ) ( not ( = ?auto_1240 ?auto_1241 ) ) ( not ( = ?auto_1235 ?auto_1241 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1239 ?auto_1231 ?auto_1241 ?auto_1236 )
      ( MAKE-ON ?auto_1230 ?auto_1231 )
      ( MAKE-ON-VERIFY ?auto_1230 ?auto_1231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1242 - SURFACE
      ?auto_1243 - SURFACE
    )
    :vars
    (
      ?auto_1248 - HOIST
      ?auto_1249 - PLACE
      ?auto_1246 - PLACE
      ?auto_1244 - HOIST
      ?auto_1247 - SURFACE
      ?auto_1252 - SURFACE
      ?auto_1245 - PLACE
      ?auto_1251 - HOIST
      ?auto_1250 - SURFACE
      ?auto_1253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1248 ?auto_1249 ) ( IS-CRATE ?auto_1242 ) ( not ( = ?auto_1242 ?auto_1243 ) ) ( not ( = ?auto_1246 ?auto_1249 ) ) ( HOIST-AT ?auto_1244 ?auto_1246 ) ( not ( = ?auto_1248 ?auto_1244 ) ) ( AVAILABLE ?auto_1244 ) ( SURFACE-AT ?auto_1242 ?auto_1246 ) ( ON ?auto_1242 ?auto_1247 ) ( CLEAR ?auto_1242 ) ( not ( = ?auto_1242 ?auto_1247 ) ) ( not ( = ?auto_1243 ?auto_1247 ) ) ( SURFACE-AT ?auto_1252 ?auto_1249 ) ( CLEAR ?auto_1252 ) ( IS-CRATE ?auto_1243 ) ( not ( = ?auto_1242 ?auto_1252 ) ) ( not ( = ?auto_1243 ?auto_1252 ) ) ( not ( = ?auto_1247 ?auto_1252 ) ) ( AVAILABLE ?auto_1248 ) ( not ( = ?auto_1245 ?auto_1249 ) ) ( not ( = ?auto_1246 ?auto_1245 ) ) ( HOIST-AT ?auto_1251 ?auto_1245 ) ( not ( = ?auto_1248 ?auto_1251 ) ) ( not ( = ?auto_1244 ?auto_1251 ) ) ( AVAILABLE ?auto_1251 ) ( SURFACE-AT ?auto_1243 ?auto_1245 ) ( ON ?auto_1243 ?auto_1250 ) ( CLEAR ?auto_1243 ) ( not ( = ?auto_1242 ?auto_1250 ) ) ( not ( = ?auto_1243 ?auto_1250 ) ) ( not ( = ?auto_1247 ?auto_1250 ) ) ( not ( = ?auto_1252 ?auto_1250 ) ) ( TRUCK-AT ?auto_1253 ?auto_1249 ) )
    :subtasks
    ( ( !DRIVE ?auto_1253 ?auto_1249 ?auto_1245 )
      ( MAKE-ON ?auto_1242 ?auto_1243 )
      ( MAKE-ON-VERIFY ?auto_1242 ?auto_1243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1254 - SURFACE
      ?auto_1255 - SURFACE
    )
    :vars
    (
      ?auto_1258 - HOIST
      ?auto_1265 - PLACE
      ?auto_1264 - PLACE
      ?auto_1256 - HOIST
      ?auto_1259 - SURFACE
      ?auto_1263 - SURFACE
      ?auto_1262 - PLACE
      ?auto_1260 - HOIST
      ?auto_1261 - SURFACE
      ?auto_1257 - TRUCK
      ?auto_1266 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258 ?auto_1265 ) ( IS-CRATE ?auto_1254 ) ( not ( = ?auto_1254 ?auto_1255 ) ) ( not ( = ?auto_1264 ?auto_1265 ) ) ( HOIST-AT ?auto_1256 ?auto_1264 ) ( not ( = ?auto_1258 ?auto_1256 ) ) ( AVAILABLE ?auto_1256 ) ( SURFACE-AT ?auto_1254 ?auto_1264 ) ( ON ?auto_1254 ?auto_1259 ) ( CLEAR ?auto_1254 ) ( not ( = ?auto_1254 ?auto_1259 ) ) ( not ( = ?auto_1255 ?auto_1259 ) ) ( IS-CRATE ?auto_1255 ) ( not ( = ?auto_1254 ?auto_1263 ) ) ( not ( = ?auto_1255 ?auto_1263 ) ) ( not ( = ?auto_1259 ?auto_1263 ) ) ( not ( = ?auto_1262 ?auto_1265 ) ) ( not ( = ?auto_1264 ?auto_1262 ) ) ( HOIST-AT ?auto_1260 ?auto_1262 ) ( not ( = ?auto_1258 ?auto_1260 ) ) ( not ( = ?auto_1256 ?auto_1260 ) ) ( AVAILABLE ?auto_1260 ) ( SURFACE-AT ?auto_1255 ?auto_1262 ) ( ON ?auto_1255 ?auto_1261 ) ( CLEAR ?auto_1255 ) ( not ( = ?auto_1254 ?auto_1261 ) ) ( not ( = ?auto_1255 ?auto_1261 ) ) ( not ( = ?auto_1259 ?auto_1261 ) ) ( not ( = ?auto_1263 ?auto_1261 ) ) ( TRUCK-AT ?auto_1257 ?auto_1265 ) ( SURFACE-AT ?auto_1266 ?auto_1265 ) ( CLEAR ?auto_1266 ) ( LIFTING ?auto_1258 ?auto_1263 ) ( IS-CRATE ?auto_1263 ) ( not ( = ?auto_1254 ?auto_1266 ) ) ( not ( = ?auto_1255 ?auto_1266 ) ) ( not ( = ?auto_1259 ?auto_1266 ) ) ( not ( = ?auto_1263 ?auto_1266 ) ) ( not ( = ?auto_1261 ?auto_1266 ) ) )
    :subtasks
    ( ( !DROP ?auto_1258 ?auto_1263 ?auto_1266 ?auto_1265 )
      ( MAKE-ON ?auto_1254 ?auto_1255 )
      ( MAKE-ON-VERIFY ?auto_1254 ?auto_1255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1267 - SURFACE
      ?auto_1268 - SURFACE
    )
    :vars
    (
      ?auto_1273 - HOIST
      ?auto_1270 - PLACE
      ?auto_1276 - PLACE
      ?auto_1277 - HOIST
      ?auto_1274 - SURFACE
      ?auto_1269 - SURFACE
      ?auto_1271 - PLACE
      ?auto_1275 - HOIST
      ?auto_1272 - SURFACE
      ?auto_1278 - TRUCK
      ?auto_1279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273 ?auto_1270 ) ( IS-CRATE ?auto_1267 ) ( not ( = ?auto_1267 ?auto_1268 ) ) ( not ( = ?auto_1276 ?auto_1270 ) ) ( HOIST-AT ?auto_1277 ?auto_1276 ) ( not ( = ?auto_1273 ?auto_1277 ) ) ( AVAILABLE ?auto_1277 ) ( SURFACE-AT ?auto_1267 ?auto_1276 ) ( ON ?auto_1267 ?auto_1274 ) ( CLEAR ?auto_1267 ) ( not ( = ?auto_1267 ?auto_1274 ) ) ( not ( = ?auto_1268 ?auto_1274 ) ) ( IS-CRATE ?auto_1268 ) ( not ( = ?auto_1267 ?auto_1269 ) ) ( not ( = ?auto_1268 ?auto_1269 ) ) ( not ( = ?auto_1274 ?auto_1269 ) ) ( not ( = ?auto_1271 ?auto_1270 ) ) ( not ( = ?auto_1276 ?auto_1271 ) ) ( HOIST-AT ?auto_1275 ?auto_1271 ) ( not ( = ?auto_1273 ?auto_1275 ) ) ( not ( = ?auto_1277 ?auto_1275 ) ) ( AVAILABLE ?auto_1275 ) ( SURFACE-AT ?auto_1268 ?auto_1271 ) ( ON ?auto_1268 ?auto_1272 ) ( CLEAR ?auto_1268 ) ( not ( = ?auto_1267 ?auto_1272 ) ) ( not ( = ?auto_1268 ?auto_1272 ) ) ( not ( = ?auto_1274 ?auto_1272 ) ) ( not ( = ?auto_1269 ?auto_1272 ) ) ( TRUCK-AT ?auto_1278 ?auto_1270 ) ( SURFACE-AT ?auto_1279 ?auto_1270 ) ( CLEAR ?auto_1279 ) ( IS-CRATE ?auto_1269 ) ( not ( = ?auto_1267 ?auto_1279 ) ) ( not ( = ?auto_1268 ?auto_1279 ) ) ( not ( = ?auto_1274 ?auto_1279 ) ) ( not ( = ?auto_1269 ?auto_1279 ) ) ( not ( = ?auto_1272 ?auto_1279 ) ) ( AVAILABLE ?auto_1273 ) ( IN ?auto_1269 ?auto_1278 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1273 ?auto_1269 ?auto_1278 ?auto_1270 )
      ( MAKE-ON ?auto_1267 ?auto_1268 )
      ( MAKE-ON-VERIFY ?auto_1267 ?auto_1268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1280 - SURFACE
      ?auto_1281 - SURFACE
    )
    :vars
    (
      ?auto_1285 - HOIST
      ?auto_1283 - PLACE
      ?auto_1292 - PLACE
      ?auto_1282 - HOIST
      ?auto_1288 - SURFACE
      ?auto_1289 - SURFACE
      ?auto_1284 - PLACE
      ?auto_1290 - HOIST
      ?auto_1287 - SURFACE
      ?auto_1286 - SURFACE
      ?auto_1291 - TRUCK
      ?auto_1293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1285 ?auto_1283 ) ( IS-CRATE ?auto_1280 ) ( not ( = ?auto_1280 ?auto_1281 ) ) ( not ( = ?auto_1292 ?auto_1283 ) ) ( HOIST-AT ?auto_1282 ?auto_1292 ) ( not ( = ?auto_1285 ?auto_1282 ) ) ( AVAILABLE ?auto_1282 ) ( SURFACE-AT ?auto_1280 ?auto_1292 ) ( ON ?auto_1280 ?auto_1288 ) ( CLEAR ?auto_1280 ) ( not ( = ?auto_1280 ?auto_1288 ) ) ( not ( = ?auto_1281 ?auto_1288 ) ) ( IS-CRATE ?auto_1281 ) ( not ( = ?auto_1280 ?auto_1289 ) ) ( not ( = ?auto_1281 ?auto_1289 ) ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( not ( = ?auto_1284 ?auto_1283 ) ) ( not ( = ?auto_1292 ?auto_1284 ) ) ( HOIST-AT ?auto_1290 ?auto_1284 ) ( not ( = ?auto_1285 ?auto_1290 ) ) ( not ( = ?auto_1282 ?auto_1290 ) ) ( AVAILABLE ?auto_1290 ) ( SURFACE-AT ?auto_1281 ?auto_1284 ) ( ON ?auto_1281 ?auto_1287 ) ( CLEAR ?auto_1281 ) ( not ( = ?auto_1280 ?auto_1287 ) ) ( not ( = ?auto_1281 ?auto_1287 ) ) ( not ( = ?auto_1288 ?auto_1287 ) ) ( not ( = ?auto_1289 ?auto_1287 ) ) ( SURFACE-AT ?auto_1286 ?auto_1283 ) ( CLEAR ?auto_1286 ) ( IS-CRATE ?auto_1289 ) ( not ( = ?auto_1280 ?auto_1286 ) ) ( not ( = ?auto_1281 ?auto_1286 ) ) ( not ( = ?auto_1288 ?auto_1286 ) ) ( not ( = ?auto_1289 ?auto_1286 ) ) ( not ( = ?auto_1287 ?auto_1286 ) ) ( AVAILABLE ?auto_1285 ) ( IN ?auto_1289 ?auto_1291 ) ( TRUCK-AT ?auto_1291 ?auto_1293 ) ( not ( = ?auto_1293 ?auto_1283 ) ) ( not ( = ?auto_1292 ?auto_1293 ) ) ( not ( = ?auto_1284 ?auto_1293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1291 ?auto_1293 ?auto_1283 )
      ( MAKE-ON ?auto_1280 ?auto_1281 )
      ( MAKE-ON-VERIFY ?auto_1280 ?auto_1281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1294 - SURFACE
      ?auto_1295 - SURFACE
    )
    :vars
    (
      ?auto_1303 - HOIST
      ?auto_1304 - PLACE
      ?auto_1302 - PLACE
      ?auto_1299 - HOIST
      ?auto_1307 - SURFACE
      ?auto_1300 - SURFACE
      ?auto_1306 - PLACE
      ?auto_1298 - HOIST
      ?auto_1297 - SURFACE
      ?auto_1296 - SURFACE
      ?auto_1301 - TRUCK
      ?auto_1305 - PLACE
      ?auto_1308 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1303 ?auto_1304 ) ( IS-CRATE ?auto_1294 ) ( not ( = ?auto_1294 ?auto_1295 ) ) ( not ( = ?auto_1302 ?auto_1304 ) ) ( HOIST-AT ?auto_1299 ?auto_1302 ) ( not ( = ?auto_1303 ?auto_1299 ) ) ( AVAILABLE ?auto_1299 ) ( SURFACE-AT ?auto_1294 ?auto_1302 ) ( ON ?auto_1294 ?auto_1307 ) ( CLEAR ?auto_1294 ) ( not ( = ?auto_1294 ?auto_1307 ) ) ( not ( = ?auto_1295 ?auto_1307 ) ) ( IS-CRATE ?auto_1295 ) ( not ( = ?auto_1294 ?auto_1300 ) ) ( not ( = ?auto_1295 ?auto_1300 ) ) ( not ( = ?auto_1307 ?auto_1300 ) ) ( not ( = ?auto_1306 ?auto_1304 ) ) ( not ( = ?auto_1302 ?auto_1306 ) ) ( HOIST-AT ?auto_1298 ?auto_1306 ) ( not ( = ?auto_1303 ?auto_1298 ) ) ( not ( = ?auto_1299 ?auto_1298 ) ) ( AVAILABLE ?auto_1298 ) ( SURFACE-AT ?auto_1295 ?auto_1306 ) ( ON ?auto_1295 ?auto_1297 ) ( CLEAR ?auto_1295 ) ( not ( = ?auto_1294 ?auto_1297 ) ) ( not ( = ?auto_1295 ?auto_1297 ) ) ( not ( = ?auto_1307 ?auto_1297 ) ) ( not ( = ?auto_1300 ?auto_1297 ) ) ( SURFACE-AT ?auto_1296 ?auto_1304 ) ( CLEAR ?auto_1296 ) ( IS-CRATE ?auto_1300 ) ( not ( = ?auto_1294 ?auto_1296 ) ) ( not ( = ?auto_1295 ?auto_1296 ) ) ( not ( = ?auto_1307 ?auto_1296 ) ) ( not ( = ?auto_1300 ?auto_1296 ) ) ( not ( = ?auto_1297 ?auto_1296 ) ) ( AVAILABLE ?auto_1303 ) ( TRUCK-AT ?auto_1301 ?auto_1305 ) ( not ( = ?auto_1305 ?auto_1304 ) ) ( not ( = ?auto_1302 ?auto_1305 ) ) ( not ( = ?auto_1306 ?auto_1305 ) ) ( HOIST-AT ?auto_1308 ?auto_1305 ) ( LIFTING ?auto_1308 ?auto_1300 ) ( not ( = ?auto_1303 ?auto_1308 ) ) ( not ( = ?auto_1299 ?auto_1308 ) ) ( not ( = ?auto_1298 ?auto_1308 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1308 ?auto_1300 ?auto_1301 ?auto_1305 )
      ( MAKE-ON ?auto_1294 ?auto_1295 )
      ( MAKE-ON-VERIFY ?auto_1294 ?auto_1295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1309 - SURFACE
      ?auto_1310 - SURFACE
    )
    :vars
    (
      ?auto_1313 - HOIST
      ?auto_1320 - PLACE
      ?auto_1319 - PLACE
      ?auto_1316 - HOIST
      ?auto_1311 - SURFACE
      ?auto_1314 - SURFACE
      ?auto_1315 - PLACE
      ?auto_1323 - HOIST
      ?auto_1317 - SURFACE
      ?auto_1312 - SURFACE
      ?auto_1321 - TRUCK
      ?auto_1322 - PLACE
      ?auto_1318 - HOIST
      ?auto_1324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1313 ?auto_1320 ) ( IS-CRATE ?auto_1309 ) ( not ( = ?auto_1309 ?auto_1310 ) ) ( not ( = ?auto_1319 ?auto_1320 ) ) ( HOIST-AT ?auto_1316 ?auto_1319 ) ( not ( = ?auto_1313 ?auto_1316 ) ) ( AVAILABLE ?auto_1316 ) ( SURFACE-AT ?auto_1309 ?auto_1319 ) ( ON ?auto_1309 ?auto_1311 ) ( CLEAR ?auto_1309 ) ( not ( = ?auto_1309 ?auto_1311 ) ) ( not ( = ?auto_1310 ?auto_1311 ) ) ( IS-CRATE ?auto_1310 ) ( not ( = ?auto_1309 ?auto_1314 ) ) ( not ( = ?auto_1310 ?auto_1314 ) ) ( not ( = ?auto_1311 ?auto_1314 ) ) ( not ( = ?auto_1315 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1315 ) ) ( HOIST-AT ?auto_1323 ?auto_1315 ) ( not ( = ?auto_1313 ?auto_1323 ) ) ( not ( = ?auto_1316 ?auto_1323 ) ) ( AVAILABLE ?auto_1323 ) ( SURFACE-AT ?auto_1310 ?auto_1315 ) ( ON ?auto_1310 ?auto_1317 ) ( CLEAR ?auto_1310 ) ( not ( = ?auto_1309 ?auto_1317 ) ) ( not ( = ?auto_1310 ?auto_1317 ) ) ( not ( = ?auto_1311 ?auto_1317 ) ) ( not ( = ?auto_1314 ?auto_1317 ) ) ( SURFACE-AT ?auto_1312 ?auto_1320 ) ( CLEAR ?auto_1312 ) ( IS-CRATE ?auto_1314 ) ( not ( = ?auto_1309 ?auto_1312 ) ) ( not ( = ?auto_1310 ?auto_1312 ) ) ( not ( = ?auto_1311 ?auto_1312 ) ) ( not ( = ?auto_1314 ?auto_1312 ) ) ( not ( = ?auto_1317 ?auto_1312 ) ) ( AVAILABLE ?auto_1313 ) ( TRUCK-AT ?auto_1321 ?auto_1322 ) ( not ( = ?auto_1322 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1322 ) ) ( not ( = ?auto_1315 ?auto_1322 ) ) ( HOIST-AT ?auto_1318 ?auto_1322 ) ( not ( = ?auto_1313 ?auto_1318 ) ) ( not ( = ?auto_1316 ?auto_1318 ) ) ( not ( = ?auto_1323 ?auto_1318 ) ) ( AVAILABLE ?auto_1318 ) ( SURFACE-AT ?auto_1314 ?auto_1322 ) ( ON ?auto_1314 ?auto_1324 ) ( CLEAR ?auto_1314 ) ( not ( = ?auto_1309 ?auto_1324 ) ) ( not ( = ?auto_1310 ?auto_1324 ) ) ( not ( = ?auto_1311 ?auto_1324 ) ) ( not ( = ?auto_1314 ?auto_1324 ) ) ( not ( = ?auto_1317 ?auto_1324 ) ) ( not ( = ?auto_1312 ?auto_1324 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1318 ?auto_1314 ?auto_1324 ?auto_1322 )
      ( MAKE-ON ?auto_1309 ?auto_1310 )
      ( MAKE-ON-VERIFY ?auto_1309 ?auto_1310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1325 - SURFACE
      ?auto_1326 - SURFACE
    )
    :vars
    (
      ?auto_1329 - HOIST
      ?auto_1328 - PLACE
      ?auto_1338 - PLACE
      ?auto_1334 - HOIST
      ?auto_1339 - SURFACE
      ?auto_1337 - SURFACE
      ?auto_1327 - PLACE
      ?auto_1332 - HOIST
      ?auto_1331 - SURFACE
      ?auto_1333 - SURFACE
      ?auto_1335 - PLACE
      ?auto_1330 - HOIST
      ?auto_1340 - SURFACE
      ?auto_1336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1329 ?auto_1328 ) ( IS-CRATE ?auto_1325 ) ( not ( = ?auto_1325 ?auto_1326 ) ) ( not ( = ?auto_1338 ?auto_1328 ) ) ( HOIST-AT ?auto_1334 ?auto_1338 ) ( not ( = ?auto_1329 ?auto_1334 ) ) ( AVAILABLE ?auto_1334 ) ( SURFACE-AT ?auto_1325 ?auto_1338 ) ( ON ?auto_1325 ?auto_1339 ) ( CLEAR ?auto_1325 ) ( not ( = ?auto_1325 ?auto_1339 ) ) ( not ( = ?auto_1326 ?auto_1339 ) ) ( IS-CRATE ?auto_1326 ) ( not ( = ?auto_1325 ?auto_1337 ) ) ( not ( = ?auto_1326 ?auto_1337 ) ) ( not ( = ?auto_1339 ?auto_1337 ) ) ( not ( = ?auto_1327 ?auto_1328 ) ) ( not ( = ?auto_1338 ?auto_1327 ) ) ( HOIST-AT ?auto_1332 ?auto_1327 ) ( not ( = ?auto_1329 ?auto_1332 ) ) ( not ( = ?auto_1334 ?auto_1332 ) ) ( AVAILABLE ?auto_1332 ) ( SURFACE-AT ?auto_1326 ?auto_1327 ) ( ON ?auto_1326 ?auto_1331 ) ( CLEAR ?auto_1326 ) ( not ( = ?auto_1325 ?auto_1331 ) ) ( not ( = ?auto_1326 ?auto_1331 ) ) ( not ( = ?auto_1339 ?auto_1331 ) ) ( not ( = ?auto_1337 ?auto_1331 ) ) ( SURFACE-AT ?auto_1333 ?auto_1328 ) ( CLEAR ?auto_1333 ) ( IS-CRATE ?auto_1337 ) ( not ( = ?auto_1325 ?auto_1333 ) ) ( not ( = ?auto_1326 ?auto_1333 ) ) ( not ( = ?auto_1339 ?auto_1333 ) ) ( not ( = ?auto_1337 ?auto_1333 ) ) ( not ( = ?auto_1331 ?auto_1333 ) ) ( AVAILABLE ?auto_1329 ) ( not ( = ?auto_1335 ?auto_1328 ) ) ( not ( = ?auto_1338 ?auto_1335 ) ) ( not ( = ?auto_1327 ?auto_1335 ) ) ( HOIST-AT ?auto_1330 ?auto_1335 ) ( not ( = ?auto_1329 ?auto_1330 ) ) ( not ( = ?auto_1334 ?auto_1330 ) ) ( not ( = ?auto_1332 ?auto_1330 ) ) ( AVAILABLE ?auto_1330 ) ( SURFACE-AT ?auto_1337 ?auto_1335 ) ( ON ?auto_1337 ?auto_1340 ) ( CLEAR ?auto_1337 ) ( not ( = ?auto_1325 ?auto_1340 ) ) ( not ( = ?auto_1326 ?auto_1340 ) ) ( not ( = ?auto_1339 ?auto_1340 ) ) ( not ( = ?auto_1337 ?auto_1340 ) ) ( not ( = ?auto_1331 ?auto_1340 ) ) ( not ( = ?auto_1333 ?auto_1340 ) ) ( TRUCK-AT ?auto_1336 ?auto_1328 ) )
    :subtasks
    ( ( !DRIVE ?auto_1336 ?auto_1328 ?auto_1335 )
      ( MAKE-ON ?auto_1325 ?auto_1326 )
      ( MAKE-ON-VERIFY ?auto_1325 ?auto_1326 ) )
  )

)

