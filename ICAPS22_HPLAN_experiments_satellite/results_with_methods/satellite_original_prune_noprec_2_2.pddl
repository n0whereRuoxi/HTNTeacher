( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_951 - DIRECTION
      ?auto_952 - MODE
    )
    :vars
    (
      ?auto_953 - INSTRUMENT
      ?auto_954 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_953 ) ( ON_BOARD ?auto_953 ?auto_954 ) ( SUPPORTS ?auto_953 ?auto_952 ) ( POWER_ON ?auto_953 ) ( POINTING ?auto_954 ?auto_951 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_954 ?auto_951 ?auto_953 ?auto_952 )
      ( GET-1IMAGE-VERIFY ?auto_951 ?auto_952 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_961 - DIRECTION
      ?auto_962 - MODE
    )
    :vars
    (
      ?auto_964 - INSTRUMENT
      ?auto_963 - SATELLITE
      ?auto_965 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_964 ) ( ON_BOARD ?auto_964 ?auto_963 ) ( SUPPORTS ?auto_964 ?auto_962 ) ( POWER_ON ?auto_964 ) ( POINTING ?auto_963 ?auto_965 ) ( not ( = ?auto_961 ?auto_965 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_963 ?auto_961 ?auto_965 )
      ( GET-1IMAGE ?auto_961 ?auto_962 )
      ( GET-1IMAGE-VERIFY ?auto_961 ?auto_962 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_973 - DIRECTION
      ?auto_974 - MODE
    )
    :vars
    (
      ?auto_977 - INSTRUMENT
      ?auto_976 - SATELLITE
      ?auto_975 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_977 ?auto_976 ) ( SUPPORTS ?auto_977 ?auto_974 ) ( POWER_ON ?auto_977 ) ( POINTING ?auto_976 ?auto_975 ) ( not ( = ?auto_973 ?auto_975 ) ) ( CALIBRATION_TARGET ?auto_977 ?auto_975 ) ( NOT_CALIBRATED ?auto_977 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_976 ?auto_977 ?auto_975 )
      ( GET-1IMAGE ?auto_973 ?auto_974 )
      ( GET-1IMAGE-VERIFY ?auto_973 ?auto_974 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_985 - DIRECTION
      ?auto_986 - MODE
    )
    :vars
    (
      ?auto_988 - INSTRUMENT
      ?auto_989 - SATELLITE
      ?auto_987 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_988 ?auto_989 ) ( SUPPORTS ?auto_988 ?auto_986 ) ( POINTING ?auto_989 ?auto_987 ) ( not ( = ?auto_985 ?auto_987 ) ) ( CALIBRATION_TARGET ?auto_988 ?auto_987 ) ( POWER_AVAIL ?auto_989 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_988 ?auto_989 )
      ( GET-1IMAGE ?auto_985 ?auto_986 )
      ( GET-1IMAGE-VERIFY ?auto_985 ?auto_986 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_997 - DIRECTION
      ?auto_998 - MODE
    )
    :vars
    (
      ?auto_1000 - INSTRUMENT
      ?auto_999 - SATELLITE
      ?auto_1001 - DIRECTION
      ?auto_1002 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1000 ?auto_999 ) ( SUPPORTS ?auto_1000 ?auto_998 ) ( not ( = ?auto_997 ?auto_1001 ) ) ( CALIBRATION_TARGET ?auto_1000 ?auto_1001 ) ( POWER_AVAIL ?auto_999 ) ( POINTING ?auto_999 ?auto_1002 ) ( not ( = ?auto_1001 ?auto_1002 ) ) ( not ( = ?auto_997 ?auto_1002 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_999 ?auto_1001 ?auto_1002 )
      ( GET-1IMAGE ?auto_997 ?auto_998 )
      ( GET-1IMAGE-VERIFY ?auto_997 ?auto_998 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1030 - DIRECTION
      ?auto_1031 - MODE
      ?auto_1032 - DIRECTION
      ?auto_1029 - MODE
    )
    :vars
    (
      ?auto_1033 - INSTRUMENT
      ?auto_1034 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1033 ) ( ON_BOARD ?auto_1033 ?auto_1034 ) ( SUPPORTS ?auto_1033 ?auto_1029 ) ( POWER_ON ?auto_1033 ) ( POINTING ?auto_1034 ?auto_1032 ) ( HAVE_IMAGE ?auto_1030 ?auto_1031 ) ( not ( = ?auto_1030 ?auto_1032 ) ) ( not ( = ?auto_1031 ?auto_1029 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1032 ?auto_1029 )
      ( GET-2IMAGE-VERIFY ?auto_1030 ?auto_1031 ?auto_1032 ?auto_1029 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1036 - DIRECTION
      ?auto_1037 - MODE
      ?auto_1038 - DIRECTION
      ?auto_1035 - MODE
    )
    :vars
    (
      ?auto_1039 - INSTRUMENT
      ?auto_1040 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1039 ) ( ON_BOARD ?auto_1039 ?auto_1040 ) ( SUPPORTS ?auto_1039 ?auto_1037 ) ( POWER_ON ?auto_1039 ) ( POINTING ?auto_1040 ?auto_1036 ) ( HAVE_IMAGE ?auto_1038 ?auto_1035 ) ( not ( = ?auto_1036 ?auto_1038 ) ) ( not ( = ?auto_1037 ?auto_1035 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1036 ?auto_1037 )
      ( GET-2IMAGE-VERIFY ?auto_1036 ?auto_1037 ?auto_1038 ?auto_1035 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1053 - DIRECTION
      ?auto_1054 - MODE
      ?auto_1055 - DIRECTION
      ?auto_1052 - MODE
    )
    :vars
    (
      ?auto_1057 - INSTRUMENT
      ?auto_1058 - SATELLITE
      ?auto_1056 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1057 ) ( ON_BOARD ?auto_1057 ?auto_1058 ) ( SUPPORTS ?auto_1057 ?auto_1052 ) ( POWER_ON ?auto_1057 ) ( POINTING ?auto_1058 ?auto_1056 ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( HAVE_IMAGE ?auto_1053 ?auto_1054 ) ( not ( = ?auto_1053 ?auto_1055 ) ) ( not ( = ?auto_1053 ?auto_1056 ) ) ( not ( = ?auto_1054 ?auto_1052 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1055 ?auto_1052 )
      ( GET-2IMAGE-VERIFY ?auto_1053 ?auto_1054 ?auto_1055 ?auto_1052 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1060 - DIRECTION
      ?auto_1061 - MODE
      ?auto_1062 - DIRECTION
      ?auto_1059 - MODE
    )
    :vars
    (
      ?auto_1064 - INSTRUMENT
      ?auto_1063 - SATELLITE
      ?auto_1065 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1064 ) ( ON_BOARD ?auto_1064 ?auto_1063 ) ( SUPPORTS ?auto_1064 ?auto_1061 ) ( POWER_ON ?auto_1064 ) ( POINTING ?auto_1063 ?auto_1065 ) ( not ( = ?auto_1060 ?auto_1065 ) ) ( HAVE_IMAGE ?auto_1062 ?auto_1059 ) ( not ( = ?auto_1062 ?auto_1060 ) ) ( not ( = ?auto_1062 ?auto_1065 ) ) ( not ( = ?auto_1059 ?auto_1061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1062 ?auto_1059 ?auto_1060 ?auto_1061 )
      ( GET-2IMAGE-VERIFY ?auto_1060 ?auto_1061 ?auto_1062 ?auto_1059 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1075 - DIRECTION
      ?auto_1076 - MODE
    )
    :vars
    (
      ?auto_1078 - INSTRUMENT
      ?auto_1077 - SATELLITE
      ?auto_1081 - DIRECTION
      ?auto_1079 - DIRECTION
      ?auto_1080 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1078 ?auto_1077 ) ( SUPPORTS ?auto_1078 ?auto_1076 ) ( POWER_ON ?auto_1078 ) ( POINTING ?auto_1077 ?auto_1081 ) ( not ( = ?auto_1075 ?auto_1081 ) ) ( HAVE_IMAGE ?auto_1079 ?auto_1080 ) ( not ( = ?auto_1079 ?auto_1075 ) ) ( not ( = ?auto_1079 ?auto_1081 ) ) ( not ( = ?auto_1080 ?auto_1076 ) ) ( CALIBRATION_TARGET ?auto_1078 ?auto_1081 ) ( NOT_CALIBRATED ?auto_1078 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1077 ?auto_1078 ?auto_1081 )
      ( GET-2IMAGE ?auto_1079 ?auto_1080 ?auto_1075 ?auto_1076 )
      ( GET-1IMAGE-VERIFY ?auto_1075 ?auto_1076 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1083 - DIRECTION
      ?auto_1084 - MODE
      ?auto_1085 - DIRECTION
      ?auto_1082 - MODE
    )
    :vars
    (
      ?auto_1088 - INSTRUMENT
      ?auto_1087 - SATELLITE
      ?auto_1086 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1088 ?auto_1087 ) ( SUPPORTS ?auto_1088 ?auto_1082 ) ( POWER_ON ?auto_1088 ) ( POINTING ?auto_1087 ?auto_1086 ) ( not ( = ?auto_1085 ?auto_1086 ) ) ( HAVE_IMAGE ?auto_1083 ?auto_1084 ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1083 ?auto_1086 ) ) ( not ( = ?auto_1084 ?auto_1082 ) ) ( CALIBRATION_TARGET ?auto_1088 ?auto_1086 ) ( NOT_CALIBRATED ?auto_1088 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1085 ?auto_1082 )
      ( GET-2IMAGE-VERIFY ?auto_1083 ?auto_1084 ?auto_1085 ?auto_1082 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1090 - DIRECTION
      ?auto_1091 - MODE
      ?auto_1092 - DIRECTION
      ?auto_1089 - MODE
    )
    :vars
    (
      ?auto_1094 - INSTRUMENT
      ?auto_1093 - SATELLITE
      ?auto_1095 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1094 ?auto_1093 ) ( SUPPORTS ?auto_1094 ?auto_1091 ) ( POWER_ON ?auto_1094 ) ( POINTING ?auto_1093 ?auto_1095 ) ( not ( = ?auto_1090 ?auto_1095 ) ) ( HAVE_IMAGE ?auto_1092 ?auto_1089 ) ( not ( = ?auto_1092 ?auto_1090 ) ) ( not ( = ?auto_1092 ?auto_1095 ) ) ( not ( = ?auto_1089 ?auto_1091 ) ) ( CALIBRATION_TARGET ?auto_1094 ?auto_1095 ) ( NOT_CALIBRATED ?auto_1094 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1092 ?auto_1089 ?auto_1090 ?auto_1091 )
      ( GET-2IMAGE-VERIFY ?auto_1090 ?auto_1091 ?auto_1092 ?auto_1089 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1105 - DIRECTION
      ?auto_1106 - MODE
    )
    :vars
    (
      ?auto_1108 - INSTRUMENT
      ?auto_1107 - SATELLITE
      ?auto_1111 - DIRECTION
      ?auto_1109 - DIRECTION
      ?auto_1110 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1108 ?auto_1107 ) ( SUPPORTS ?auto_1108 ?auto_1106 ) ( POINTING ?auto_1107 ?auto_1111 ) ( not ( = ?auto_1105 ?auto_1111 ) ) ( HAVE_IMAGE ?auto_1109 ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1105 ) ) ( not ( = ?auto_1109 ?auto_1111 ) ) ( not ( = ?auto_1110 ?auto_1106 ) ) ( CALIBRATION_TARGET ?auto_1108 ?auto_1111 ) ( POWER_AVAIL ?auto_1107 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1108 ?auto_1107 )
      ( GET-2IMAGE ?auto_1109 ?auto_1110 ?auto_1105 ?auto_1106 )
      ( GET-1IMAGE-VERIFY ?auto_1105 ?auto_1106 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1113 - DIRECTION
      ?auto_1114 - MODE
      ?auto_1115 - DIRECTION
      ?auto_1112 - MODE
    )
    :vars
    (
      ?auto_1117 - INSTRUMENT
      ?auto_1118 - SATELLITE
      ?auto_1116 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1117 ?auto_1118 ) ( SUPPORTS ?auto_1117 ?auto_1112 ) ( POINTING ?auto_1118 ?auto_1116 ) ( not ( = ?auto_1115 ?auto_1116 ) ) ( HAVE_IMAGE ?auto_1113 ?auto_1114 ) ( not ( = ?auto_1113 ?auto_1115 ) ) ( not ( = ?auto_1113 ?auto_1116 ) ) ( not ( = ?auto_1114 ?auto_1112 ) ) ( CALIBRATION_TARGET ?auto_1117 ?auto_1116 ) ( POWER_AVAIL ?auto_1118 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1115 ?auto_1112 )
      ( GET-2IMAGE-VERIFY ?auto_1113 ?auto_1114 ?auto_1115 ?auto_1112 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1120 - DIRECTION
      ?auto_1121 - MODE
      ?auto_1122 - DIRECTION
      ?auto_1119 - MODE
    )
    :vars
    (
      ?auto_1124 - INSTRUMENT
      ?auto_1125 - SATELLITE
      ?auto_1123 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1124 ?auto_1125 ) ( SUPPORTS ?auto_1124 ?auto_1121 ) ( POINTING ?auto_1125 ?auto_1123 ) ( not ( = ?auto_1120 ?auto_1123 ) ) ( HAVE_IMAGE ?auto_1122 ?auto_1119 ) ( not ( = ?auto_1122 ?auto_1120 ) ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( not ( = ?auto_1119 ?auto_1121 ) ) ( CALIBRATION_TARGET ?auto_1124 ?auto_1123 ) ( POWER_AVAIL ?auto_1125 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1122 ?auto_1119 ?auto_1120 ?auto_1121 )
      ( GET-2IMAGE-VERIFY ?auto_1120 ?auto_1121 ?auto_1122 ?auto_1119 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1135 - DIRECTION
      ?auto_1136 - MODE
    )
    :vars
    (
      ?auto_1138 - INSTRUMENT
      ?auto_1140 - SATELLITE
      ?auto_1137 - DIRECTION
      ?auto_1141 - DIRECTION
      ?auto_1139 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1138 ?auto_1140 ) ( SUPPORTS ?auto_1138 ?auto_1136 ) ( not ( = ?auto_1135 ?auto_1137 ) ) ( HAVE_IMAGE ?auto_1141 ?auto_1139 ) ( not ( = ?auto_1141 ?auto_1135 ) ) ( not ( = ?auto_1141 ?auto_1137 ) ) ( not ( = ?auto_1139 ?auto_1136 ) ) ( CALIBRATION_TARGET ?auto_1138 ?auto_1137 ) ( POWER_AVAIL ?auto_1140 ) ( POINTING ?auto_1140 ?auto_1141 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1140 ?auto_1137 ?auto_1141 )
      ( GET-2IMAGE ?auto_1141 ?auto_1139 ?auto_1135 ?auto_1136 )
      ( GET-1IMAGE-VERIFY ?auto_1135 ?auto_1136 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1143 - DIRECTION
      ?auto_1144 - MODE
      ?auto_1145 - DIRECTION
      ?auto_1142 - MODE
    )
    :vars
    (
      ?auto_1147 - INSTRUMENT
      ?auto_1146 - SATELLITE
      ?auto_1148 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1147 ?auto_1146 ) ( SUPPORTS ?auto_1147 ?auto_1142 ) ( not ( = ?auto_1145 ?auto_1148 ) ) ( HAVE_IMAGE ?auto_1143 ?auto_1144 ) ( not ( = ?auto_1143 ?auto_1145 ) ) ( not ( = ?auto_1143 ?auto_1148 ) ) ( not ( = ?auto_1144 ?auto_1142 ) ) ( CALIBRATION_TARGET ?auto_1147 ?auto_1148 ) ( POWER_AVAIL ?auto_1146 ) ( POINTING ?auto_1146 ?auto_1143 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1145 ?auto_1142 )
      ( GET-2IMAGE-VERIFY ?auto_1143 ?auto_1144 ?auto_1145 ?auto_1142 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1150 - DIRECTION
      ?auto_1151 - MODE
      ?auto_1152 - DIRECTION
      ?auto_1149 - MODE
    )
    :vars
    (
      ?auto_1153 - INSTRUMENT
      ?auto_1155 - SATELLITE
      ?auto_1154 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1153 ?auto_1155 ) ( SUPPORTS ?auto_1153 ?auto_1151 ) ( not ( = ?auto_1150 ?auto_1154 ) ) ( HAVE_IMAGE ?auto_1152 ?auto_1149 ) ( not ( = ?auto_1152 ?auto_1150 ) ) ( not ( = ?auto_1152 ?auto_1154 ) ) ( not ( = ?auto_1149 ?auto_1151 ) ) ( CALIBRATION_TARGET ?auto_1153 ?auto_1154 ) ( POWER_AVAIL ?auto_1155 ) ( POINTING ?auto_1155 ?auto_1152 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1152 ?auto_1149 ?auto_1150 ?auto_1151 )
      ( GET-2IMAGE-VERIFY ?auto_1150 ?auto_1151 ?auto_1152 ?auto_1149 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1165 - DIRECTION
      ?auto_1166 - MODE
    )
    :vars
    (
      ?auto_1167 - INSTRUMENT
      ?auto_1171 - SATELLITE
      ?auto_1170 - DIRECTION
      ?auto_1169 - DIRECTION
      ?auto_1168 - MODE
      ?auto_1172 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1167 ?auto_1171 ) ( SUPPORTS ?auto_1167 ?auto_1166 ) ( not ( = ?auto_1165 ?auto_1170 ) ) ( HAVE_IMAGE ?auto_1169 ?auto_1168 ) ( not ( = ?auto_1169 ?auto_1165 ) ) ( not ( = ?auto_1169 ?auto_1170 ) ) ( not ( = ?auto_1168 ?auto_1166 ) ) ( CALIBRATION_TARGET ?auto_1167 ?auto_1170 ) ( POINTING ?auto_1171 ?auto_1169 ) ( ON_BOARD ?auto_1172 ?auto_1171 ) ( POWER_ON ?auto_1172 ) ( not ( = ?auto_1167 ?auto_1172 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1172 ?auto_1171 )
      ( GET-2IMAGE ?auto_1169 ?auto_1168 ?auto_1165 ?auto_1166 )
      ( GET-1IMAGE-VERIFY ?auto_1165 ?auto_1166 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1174 - DIRECTION
      ?auto_1175 - MODE
      ?auto_1176 - DIRECTION
      ?auto_1173 - MODE
    )
    :vars
    (
      ?auto_1177 - INSTRUMENT
      ?auto_1180 - SATELLITE
      ?auto_1179 - DIRECTION
      ?auto_1178 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1177 ?auto_1180 ) ( SUPPORTS ?auto_1177 ?auto_1173 ) ( not ( = ?auto_1176 ?auto_1179 ) ) ( HAVE_IMAGE ?auto_1174 ?auto_1175 ) ( not ( = ?auto_1174 ?auto_1176 ) ) ( not ( = ?auto_1174 ?auto_1179 ) ) ( not ( = ?auto_1175 ?auto_1173 ) ) ( CALIBRATION_TARGET ?auto_1177 ?auto_1179 ) ( POINTING ?auto_1180 ?auto_1174 ) ( ON_BOARD ?auto_1178 ?auto_1180 ) ( POWER_ON ?auto_1178 ) ( not ( = ?auto_1177 ?auto_1178 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1176 ?auto_1173 )
      ( GET-2IMAGE-VERIFY ?auto_1174 ?auto_1175 ?auto_1176 ?auto_1173 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1182 - DIRECTION
      ?auto_1183 - MODE
      ?auto_1184 - DIRECTION
      ?auto_1181 - MODE
    )
    :vars
    (
      ?auto_1187 - INSTRUMENT
      ?auto_1188 - SATELLITE
      ?auto_1186 - DIRECTION
      ?auto_1185 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1187 ?auto_1188 ) ( SUPPORTS ?auto_1187 ?auto_1183 ) ( not ( = ?auto_1182 ?auto_1186 ) ) ( HAVE_IMAGE ?auto_1184 ?auto_1181 ) ( not ( = ?auto_1184 ?auto_1182 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( not ( = ?auto_1181 ?auto_1183 ) ) ( CALIBRATION_TARGET ?auto_1187 ?auto_1186 ) ( POINTING ?auto_1188 ?auto_1184 ) ( ON_BOARD ?auto_1185 ?auto_1188 ) ( POWER_ON ?auto_1185 ) ( not ( = ?auto_1187 ?auto_1185 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1184 ?auto_1181 ?auto_1182 ?auto_1183 )
      ( GET-2IMAGE-VERIFY ?auto_1182 ?auto_1183 ?auto_1184 ?auto_1181 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1199 - DIRECTION
      ?auto_1200 - MODE
    )
    :vars
    (
      ?auto_1203 - INSTRUMENT
      ?auto_1204 - SATELLITE
      ?auto_1202 - DIRECTION
      ?auto_1205 - DIRECTION
      ?auto_1206 - MODE
      ?auto_1201 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1203 ?auto_1204 ) ( SUPPORTS ?auto_1203 ?auto_1200 ) ( not ( = ?auto_1199 ?auto_1202 ) ) ( not ( = ?auto_1205 ?auto_1199 ) ) ( not ( = ?auto_1205 ?auto_1202 ) ) ( not ( = ?auto_1206 ?auto_1200 ) ) ( CALIBRATION_TARGET ?auto_1203 ?auto_1202 ) ( POINTING ?auto_1204 ?auto_1205 ) ( ON_BOARD ?auto_1201 ?auto_1204 ) ( POWER_ON ?auto_1201 ) ( not ( = ?auto_1203 ?auto_1201 ) ) ( CALIBRATED ?auto_1201 ) ( SUPPORTS ?auto_1201 ?auto_1206 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1205 ?auto_1206 )
      ( GET-2IMAGE ?auto_1205 ?auto_1206 ?auto_1199 ?auto_1200 )
      ( GET-1IMAGE-VERIFY ?auto_1199 ?auto_1200 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1208 - DIRECTION
      ?auto_1209 - MODE
      ?auto_1210 - DIRECTION
      ?auto_1207 - MODE
    )
    :vars
    (
      ?auto_1212 - INSTRUMENT
      ?auto_1214 - SATELLITE
      ?auto_1213 - DIRECTION
      ?auto_1211 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1212 ?auto_1214 ) ( SUPPORTS ?auto_1212 ?auto_1207 ) ( not ( = ?auto_1210 ?auto_1213 ) ) ( not ( = ?auto_1208 ?auto_1210 ) ) ( not ( = ?auto_1208 ?auto_1213 ) ) ( not ( = ?auto_1209 ?auto_1207 ) ) ( CALIBRATION_TARGET ?auto_1212 ?auto_1213 ) ( POINTING ?auto_1214 ?auto_1208 ) ( ON_BOARD ?auto_1211 ?auto_1214 ) ( POWER_ON ?auto_1211 ) ( not ( = ?auto_1212 ?auto_1211 ) ) ( CALIBRATED ?auto_1211 ) ( SUPPORTS ?auto_1211 ?auto_1209 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1210 ?auto_1207 )
      ( GET-2IMAGE-VERIFY ?auto_1208 ?auto_1209 ?auto_1210 ?auto_1207 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1216 - DIRECTION
      ?auto_1217 - MODE
      ?auto_1218 - DIRECTION
      ?auto_1215 - MODE
    )
    :vars
    (
      ?auto_1220 - INSTRUMENT
      ?auto_1221 - SATELLITE
      ?auto_1219 - DIRECTION
      ?auto_1222 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1220 ?auto_1221 ) ( SUPPORTS ?auto_1220 ?auto_1217 ) ( not ( = ?auto_1216 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1216 ) ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( not ( = ?auto_1215 ?auto_1217 ) ) ( CALIBRATION_TARGET ?auto_1220 ?auto_1219 ) ( POINTING ?auto_1221 ?auto_1218 ) ( ON_BOARD ?auto_1222 ?auto_1221 ) ( POWER_ON ?auto_1222 ) ( not ( = ?auto_1220 ?auto_1222 ) ) ( CALIBRATED ?auto_1222 ) ( SUPPORTS ?auto_1222 ?auto_1215 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1218 ?auto_1215 ?auto_1216 ?auto_1217 )
      ( GET-2IMAGE-VERIFY ?auto_1216 ?auto_1217 ?auto_1218 ?auto_1215 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1233 - DIRECTION
      ?auto_1234 - MODE
    )
    :vars
    (
      ?auto_1236 - INSTRUMENT
      ?auto_1237 - SATELLITE
      ?auto_1235 - DIRECTION
      ?auto_1240 - DIRECTION
      ?auto_1239 - MODE
      ?auto_1238 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1236 ?auto_1237 ) ( SUPPORTS ?auto_1236 ?auto_1234 ) ( not ( = ?auto_1233 ?auto_1235 ) ) ( not ( = ?auto_1240 ?auto_1233 ) ) ( not ( = ?auto_1240 ?auto_1235 ) ) ( not ( = ?auto_1239 ?auto_1234 ) ) ( CALIBRATION_TARGET ?auto_1236 ?auto_1235 ) ( ON_BOARD ?auto_1238 ?auto_1237 ) ( POWER_ON ?auto_1238 ) ( not ( = ?auto_1236 ?auto_1238 ) ) ( CALIBRATED ?auto_1238 ) ( SUPPORTS ?auto_1238 ?auto_1239 ) ( POINTING ?auto_1237 ?auto_1235 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1237 ?auto_1240 ?auto_1235 )
      ( GET-2IMAGE ?auto_1240 ?auto_1239 ?auto_1233 ?auto_1234 )
      ( GET-1IMAGE-VERIFY ?auto_1233 ?auto_1234 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1242 - DIRECTION
      ?auto_1243 - MODE
      ?auto_1244 - DIRECTION
      ?auto_1241 - MODE
    )
    :vars
    (
      ?auto_1245 - INSTRUMENT
      ?auto_1247 - SATELLITE
      ?auto_1246 - DIRECTION
      ?auto_1248 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1245 ?auto_1247 ) ( SUPPORTS ?auto_1245 ?auto_1241 ) ( not ( = ?auto_1244 ?auto_1246 ) ) ( not ( = ?auto_1242 ?auto_1244 ) ) ( not ( = ?auto_1242 ?auto_1246 ) ) ( not ( = ?auto_1243 ?auto_1241 ) ) ( CALIBRATION_TARGET ?auto_1245 ?auto_1246 ) ( ON_BOARD ?auto_1248 ?auto_1247 ) ( POWER_ON ?auto_1248 ) ( not ( = ?auto_1245 ?auto_1248 ) ) ( CALIBRATED ?auto_1248 ) ( SUPPORTS ?auto_1248 ?auto_1243 ) ( POINTING ?auto_1247 ?auto_1246 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1244 ?auto_1241 )
      ( GET-2IMAGE-VERIFY ?auto_1242 ?auto_1243 ?auto_1244 ?auto_1241 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1250 - DIRECTION
      ?auto_1251 - MODE
      ?auto_1252 - DIRECTION
      ?auto_1249 - MODE
    )
    :vars
    (
      ?auto_1253 - INSTRUMENT
      ?auto_1256 - SATELLITE
      ?auto_1255 - DIRECTION
      ?auto_1254 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1253 ?auto_1256 ) ( SUPPORTS ?auto_1253 ?auto_1251 ) ( not ( = ?auto_1250 ?auto_1255 ) ) ( not ( = ?auto_1252 ?auto_1250 ) ) ( not ( = ?auto_1252 ?auto_1255 ) ) ( not ( = ?auto_1249 ?auto_1251 ) ) ( CALIBRATION_TARGET ?auto_1253 ?auto_1255 ) ( ON_BOARD ?auto_1254 ?auto_1256 ) ( POWER_ON ?auto_1254 ) ( not ( = ?auto_1253 ?auto_1254 ) ) ( CALIBRATED ?auto_1254 ) ( SUPPORTS ?auto_1254 ?auto_1249 ) ( POINTING ?auto_1256 ?auto_1255 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1252 ?auto_1249 ?auto_1250 ?auto_1251 )
      ( GET-2IMAGE-VERIFY ?auto_1250 ?auto_1251 ?auto_1252 ?auto_1249 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1267 - DIRECTION
      ?auto_1268 - MODE
    )
    :vars
    (
      ?auto_1271 - INSTRUMENT
      ?auto_1274 - SATELLITE
      ?auto_1273 - DIRECTION
      ?auto_1270 - DIRECTION
      ?auto_1269 - MODE
      ?auto_1272 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1271 ?auto_1274 ) ( SUPPORTS ?auto_1271 ?auto_1268 ) ( not ( = ?auto_1267 ?auto_1273 ) ) ( not ( = ?auto_1270 ?auto_1267 ) ) ( not ( = ?auto_1270 ?auto_1273 ) ) ( not ( = ?auto_1269 ?auto_1268 ) ) ( CALIBRATION_TARGET ?auto_1271 ?auto_1273 ) ( ON_BOARD ?auto_1272 ?auto_1274 ) ( POWER_ON ?auto_1272 ) ( not ( = ?auto_1271 ?auto_1272 ) ) ( SUPPORTS ?auto_1272 ?auto_1269 ) ( POINTING ?auto_1274 ?auto_1273 ) ( CALIBRATION_TARGET ?auto_1272 ?auto_1273 ) ( NOT_CALIBRATED ?auto_1272 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1274 ?auto_1272 ?auto_1273 )
      ( GET-2IMAGE ?auto_1270 ?auto_1269 ?auto_1267 ?auto_1268 )
      ( GET-1IMAGE-VERIFY ?auto_1267 ?auto_1268 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1276 - DIRECTION
      ?auto_1277 - MODE
      ?auto_1278 - DIRECTION
      ?auto_1275 - MODE
    )
    :vars
    (
      ?auto_1281 - INSTRUMENT
      ?auto_1282 - SATELLITE
      ?auto_1279 - DIRECTION
      ?auto_1280 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1281 ?auto_1282 ) ( SUPPORTS ?auto_1281 ?auto_1275 ) ( not ( = ?auto_1278 ?auto_1279 ) ) ( not ( = ?auto_1276 ?auto_1278 ) ) ( not ( = ?auto_1276 ?auto_1279 ) ) ( not ( = ?auto_1277 ?auto_1275 ) ) ( CALIBRATION_TARGET ?auto_1281 ?auto_1279 ) ( ON_BOARD ?auto_1280 ?auto_1282 ) ( POWER_ON ?auto_1280 ) ( not ( = ?auto_1281 ?auto_1280 ) ) ( SUPPORTS ?auto_1280 ?auto_1277 ) ( POINTING ?auto_1282 ?auto_1279 ) ( CALIBRATION_TARGET ?auto_1280 ?auto_1279 ) ( NOT_CALIBRATED ?auto_1280 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1278 ?auto_1275 )
      ( GET-2IMAGE-VERIFY ?auto_1276 ?auto_1277 ?auto_1278 ?auto_1275 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1284 - DIRECTION
      ?auto_1285 - MODE
      ?auto_1286 - DIRECTION
      ?auto_1283 - MODE
    )
    :vars
    (
      ?auto_1290 - INSTRUMENT
      ?auto_1289 - SATELLITE
      ?auto_1287 - DIRECTION
      ?auto_1288 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1290 ?auto_1289 ) ( SUPPORTS ?auto_1290 ?auto_1285 ) ( not ( = ?auto_1284 ?auto_1287 ) ) ( not ( = ?auto_1286 ?auto_1284 ) ) ( not ( = ?auto_1286 ?auto_1287 ) ) ( not ( = ?auto_1283 ?auto_1285 ) ) ( CALIBRATION_TARGET ?auto_1290 ?auto_1287 ) ( ON_BOARD ?auto_1288 ?auto_1289 ) ( POWER_ON ?auto_1288 ) ( not ( = ?auto_1290 ?auto_1288 ) ) ( SUPPORTS ?auto_1288 ?auto_1283 ) ( POINTING ?auto_1289 ?auto_1287 ) ( CALIBRATION_TARGET ?auto_1288 ?auto_1287 ) ( NOT_CALIBRATED ?auto_1288 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1286 ?auto_1283 ?auto_1284 ?auto_1285 )
      ( GET-2IMAGE-VERIFY ?auto_1284 ?auto_1285 ?auto_1286 ?auto_1283 ) )
  )

)

