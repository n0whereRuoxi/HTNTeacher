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
      ?auto_997 - DIRECTION
      ?auto_998 - MODE
    )
    :vars
    (
      ?auto_999 - INSTRUMENT
      ?auto_1000 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_999 ) ( ON_BOARD ?auto_999 ?auto_1000 ) ( SUPPORTS ?auto_999 ?auto_998 ) ( POWER_ON ?auto_999 ) ( POINTING ?auto_1000 ?auto_997 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1000 ?auto_997 ?auto_999 ?auto_998 )
      ( GET-1IMAGE-VERIFY ?auto_997 ?auto_998 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1007 - DIRECTION
      ?auto_1008 - MODE
    )
    :vars
    (
      ?auto_1009 - INSTRUMENT
      ?auto_1010 - SATELLITE
      ?auto_1011 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1009 ) ( ON_BOARD ?auto_1009 ?auto_1010 ) ( SUPPORTS ?auto_1009 ?auto_1008 ) ( POWER_ON ?auto_1009 ) ( POINTING ?auto_1010 ?auto_1011 ) ( not ( = ?auto_1007 ?auto_1011 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1010 ?auto_1007 ?auto_1011 )
      ( GET-1IMAGE ?auto_1007 ?auto_1008 )
      ( GET-1IMAGE-VERIFY ?auto_1007 ?auto_1008 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1019 - DIRECTION
      ?auto_1020 - MODE
    )
    :vars
    (
      ?auto_1023 - INSTRUMENT
      ?auto_1022 - SATELLITE
      ?auto_1021 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1023 ?auto_1022 ) ( SUPPORTS ?auto_1023 ?auto_1020 ) ( POWER_ON ?auto_1023 ) ( POINTING ?auto_1022 ?auto_1021 ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( CALIBRATION_TARGET ?auto_1023 ?auto_1021 ) ( NOT_CALIBRATED ?auto_1023 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1022 ?auto_1023 ?auto_1021 )
      ( GET-1IMAGE ?auto_1019 ?auto_1020 )
      ( GET-1IMAGE-VERIFY ?auto_1019 ?auto_1020 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1031 - DIRECTION
      ?auto_1032 - MODE
    )
    :vars
    (
      ?auto_1033 - INSTRUMENT
      ?auto_1034 - SATELLITE
      ?auto_1035 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1033 ?auto_1034 ) ( SUPPORTS ?auto_1033 ?auto_1032 ) ( POINTING ?auto_1034 ?auto_1035 ) ( not ( = ?auto_1031 ?auto_1035 ) ) ( CALIBRATION_TARGET ?auto_1033 ?auto_1035 ) ( POWER_AVAIL ?auto_1034 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1033 ?auto_1034 )
      ( GET-1IMAGE ?auto_1031 ?auto_1032 )
      ( GET-1IMAGE-VERIFY ?auto_1031 ?auto_1032 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1043 - DIRECTION
      ?auto_1044 - MODE
    )
    :vars
    (
      ?auto_1045 - INSTRUMENT
      ?auto_1047 - SATELLITE
      ?auto_1046 - DIRECTION
      ?auto_1048 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1045 ?auto_1047 ) ( SUPPORTS ?auto_1045 ?auto_1044 ) ( not ( = ?auto_1043 ?auto_1046 ) ) ( CALIBRATION_TARGET ?auto_1045 ?auto_1046 ) ( POWER_AVAIL ?auto_1047 ) ( POINTING ?auto_1047 ?auto_1048 ) ( not ( = ?auto_1046 ?auto_1048 ) ) ( not ( = ?auto_1043 ?auto_1048 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1047 ?auto_1046 ?auto_1048 )
      ( GET-1IMAGE ?auto_1043 ?auto_1044 )
      ( GET-1IMAGE-VERIFY ?auto_1043 ?auto_1044 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1071 - DIRECTION
      ?auto_1072 - MODE
    )
    :vars
    (
      ?auto_1073 - INSTRUMENT
      ?auto_1074 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1073 ) ( ON_BOARD ?auto_1073 ?auto_1074 ) ( SUPPORTS ?auto_1073 ?auto_1072 ) ( POWER_ON ?auto_1073 ) ( POINTING ?auto_1074 ?auto_1071 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1074 ?auto_1071 ?auto_1073 ?auto_1072 )
      ( GET-1IMAGE-VERIFY ?auto_1071 ?auto_1072 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1075 - DIRECTION
      ?auto_1076 - MODE
      ?auto_1078 - DIRECTION
      ?auto_1077 - MODE
    )
    :vars
    (
      ?auto_1080 - INSTRUMENT
      ?auto_1079 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1078 ?auto_1075 ) ) ( CALIBRATED ?auto_1080 ) ( ON_BOARD ?auto_1080 ?auto_1079 ) ( SUPPORTS ?auto_1080 ?auto_1077 ) ( POWER_ON ?auto_1080 ) ( POINTING ?auto_1079 ?auto_1078 ) ( HAVE_IMAGE ?auto_1075 ?auto_1076 ) ( not ( = ?auto_1076 ?auto_1077 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1078 ?auto_1077 )
      ( GET-2IMAGE-VERIFY ?auto_1075 ?auto_1076 ?auto_1078 ?auto_1077 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1081 - DIRECTION
      ?auto_1082 - MODE
      ?auto_1084 - DIRECTION
      ?auto_1083 - MODE
    )
    :vars
    (
      ?auto_1086 - INSTRUMENT
      ?auto_1085 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1084 ?auto_1081 ) ) ( CALIBRATED ?auto_1086 ) ( ON_BOARD ?auto_1086 ?auto_1085 ) ( SUPPORTS ?auto_1086 ?auto_1082 ) ( POWER_ON ?auto_1086 ) ( POINTING ?auto_1085 ?auto_1081 ) ( HAVE_IMAGE ?auto_1084 ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1081 ?auto_1082 )
      ( GET-2IMAGE-VERIFY ?auto_1081 ?auto_1082 ?auto_1084 ?auto_1083 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1093 - DIRECTION
      ?auto_1094 - MODE
    )
    :vars
    (
      ?auto_1096 - INSTRUMENT
      ?auto_1095 - SATELLITE
      ?auto_1097 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1096 ) ( ON_BOARD ?auto_1096 ?auto_1095 ) ( SUPPORTS ?auto_1096 ?auto_1094 ) ( POWER_ON ?auto_1096 ) ( POINTING ?auto_1095 ?auto_1097 ) ( not ( = ?auto_1093 ?auto_1097 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1095 ?auto_1093 ?auto_1097 )
      ( GET-1IMAGE ?auto_1093 ?auto_1094 )
      ( GET-1IMAGE-VERIFY ?auto_1093 ?auto_1094 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1098 - DIRECTION
      ?auto_1099 - MODE
      ?auto_1101 - DIRECTION
      ?auto_1100 - MODE
    )
    :vars
    (
      ?auto_1102 - INSTRUMENT
      ?auto_1104 - SATELLITE
      ?auto_1103 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1101 ?auto_1098 ) ) ( CALIBRATED ?auto_1102 ) ( ON_BOARD ?auto_1102 ?auto_1104 ) ( SUPPORTS ?auto_1102 ?auto_1100 ) ( POWER_ON ?auto_1102 ) ( POINTING ?auto_1104 ?auto_1103 ) ( not ( = ?auto_1101 ?auto_1103 ) ) ( HAVE_IMAGE ?auto_1098 ?auto_1099 ) ( not ( = ?auto_1098 ?auto_1103 ) ) ( not ( = ?auto_1099 ?auto_1100 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1101 ?auto_1100 )
      ( GET-2IMAGE-VERIFY ?auto_1098 ?auto_1099 ?auto_1101 ?auto_1100 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1105 - DIRECTION
      ?auto_1106 - MODE
      ?auto_1108 - DIRECTION
      ?auto_1107 - MODE
    )
    :vars
    (
      ?auto_1110 - INSTRUMENT
      ?auto_1109 - SATELLITE
      ?auto_1111 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1108 ?auto_1105 ) ) ( CALIBRATED ?auto_1110 ) ( ON_BOARD ?auto_1110 ?auto_1109 ) ( SUPPORTS ?auto_1110 ?auto_1106 ) ( POWER_ON ?auto_1110 ) ( POINTING ?auto_1109 ?auto_1111 ) ( not ( = ?auto_1105 ?auto_1111 ) ) ( HAVE_IMAGE ?auto_1108 ?auto_1107 ) ( not ( = ?auto_1108 ?auto_1111 ) ) ( not ( = ?auto_1107 ?auto_1106 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1108 ?auto_1107 ?auto_1105 ?auto_1106 )
      ( GET-2IMAGE-VERIFY ?auto_1105 ?auto_1106 ?auto_1108 ?auto_1107 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1121 - DIRECTION
      ?auto_1122 - MODE
    )
    :vars
    (
      ?auto_1123 - DIRECTION
      ?auto_1126 - INSTRUMENT
      ?auto_1125 - SATELLITE
      ?auto_1127 - DIRECTION
      ?auto_1124 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1121 ?auto_1123 ) ) ( ON_BOARD ?auto_1126 ?auto_1125 ) ( SUPPORTS ?auto_1126 ?auto_1122 ) ( POWER_ON ?auto_1126 ) ( POINTING ?auto_1125 ?auto_1127 ) ( not ( = ?auto_1121 ?auto_1127 ) ) ( HAVE_IMAGE ?auto_1123 ?auto_1124 ) ( not ( = ?auto_1123 ?auto_1127 ) ) ( not ( = ?auto_1124 ?auto_1122 ) ) ( CALIBRATION_TARGET ?auto_1126 ?auto_1127 ) ( NOT_CALIBRATED ?auto_1126 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1125 ?auto_1126 ?auto_1127 )
      ( GET-2IMAGE ?auto_1123 ?auto_1124 ?auto_1121 ?auto_1122 )
      ( GET-1IMAGE-VERIFY ?auto_1121 ?auto_1122 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1128 - DIRECTION
      ?auto_1129 - MODE
      ?auto_1131 - DIRECTION
      ?auto_1130 - MODE
    )
    :vars
    (
      ?auto_1132 - INSTRUMENT
      ?auto_1133 - SATELLITE
      ?auto_1134 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1131 ?auto_1128 ) ) ( ON_BOARD ?auto_1132 ?auto_1133 ) ( SUPPORTS ?auto_1132 ?auto_1130 ) ( POWER_ON ?auto_1132 ) ( POINTING ?auto_1133 ?auto_1134 ) ( not ( = ?auto_1131 ?auto_1134 ) ) ( HAVE_IMAGE ?auto_1128 ?auto_1129 ) ( not ( = ?auto_1128 ?auto_1134 ) ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( CALIBRATION_TARGET ?auto_1132 ?auto_1134 ) ( NOT_CALIBRATED ?auto_1132 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1131 ?auto_1130 )
      ( GET-2IMAGE-VERIFY ?auto_1128 ?auto_1129 ?auto_1131 ?auto_1130 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1135 - DIRECTION
      ?auto_1136 - MODE
      ?auto_1138 - DIRECTION
      ?auto_1137 - MODE
    )
    :vars
    (
      ?auto_1140 - INSTRUMENT
      ?auto_1139 - SATELLITE
      ?auto_1141 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1138 ?auto_1135 ) ) ( ON_BOARD ?auto_1140 ?auto_1139 ) ( SUPPORTS ?auto_1140 ?auto_1136 ) ( POWER_ON ?auto_1140 ) ( POINTING ?auto_1139 ?auto_1141 ) ( not ( = ?auto_1135 ?auto_1141 ) ) ( HAVE_IMAGE ?auto_1138 ?auto_1137 ) ( not ( = ?auto_1138 ?auto_1141 ) ) ( not ( = ?auto_1137 ?auto_1136 ) ) ( CALIBRATION_TARGET ?auto_1140 ?auto_1141 ) ( NOT_CALIBRATED ?auto_1140 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1138 ?auto_1137 ?auto_1135 ?auto_1136 )
      ( GET-2IMAGE-VERIFY ?auto_1135 ?auto_1136 ?auto_1138 ?auto_1137 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1151 - DIRECTION
      ?auto_1152 - MODE
    )
    :vars
    (
      ?auto_1157 - DIRECTION
      ?auto_1154 - INSTRUMENT
      ?auto_1153 - SATELLITE
      ?auto_1156 - DIRECTION
      ?auto_1155 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1151 ?auto_1157 ) ) ( ON_BOARD ?auto_1154 ?auto_1153 ) ( SUPPORTS ?auto_1154 ?auto_1152 ) ( POINTING ?auto_1153 ?auto_1156 ) ( not ( = ?auto_1151 ?auto_1156 ) ) ( HAVE_IMAGE ?auto_1157 ?auto_1155 ) ( not ( = ?auto_1157 ?auto_1156 ) ) ( not ( = ?auto_1155 ?auto_1152 ) ) ( CALIBRATION_TARGET ?auto_1154 ?auto_1156 ) ( POWER_AVAIL ?auto_1153 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1154 ?auto_1153 )
      ( GET-2IMAGE ?auto_1157 ?auto_1155 ?auto_1151 ?auto_1152 )
      ( GET-1IMAGE-VERIFY ?auto_1151 ?auto_1152 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1158 - DIRECTION
      ?auto_1159 - MODE
      ?auto_1161 - DIRECTION
      ?auto_1160 - MODE
    )
    :vars
    (
      ?auto_1164 - INSTRUMENT
      ?auto_1162 - SATELLITE
      ?auto_1163 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1161 ?auto_1158 ) ) ( ON_BOARD ?auto_1164 ?auto_1162 ) ( SUPPORTS ?auto_1164 ?auto_1160 ) ( POINTING ?auto_1162 ?auto_1163 ) ( not ( = ?auto_1161 ?auto_1163 ) ) ( HAVE_IMAGE ?auto_1158 ?auto_1159 ) ( not ( = ?auto_1158 ?auto_1163 ) ) ( not ( = ?auto_1159 ?auto_1160 ) ) ( CALIBRATION_TARGET ?auto_1164 ?auto_1163 ) ( POWER_AVAIL ?auto_1162 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1161 ?auto_1160 )
      ( GET-2IMAGE-VERIFY ?auto_1158 ?auto_1159 ?auto_1161 ?auto_1160 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1165 - DIRECTION
      ?auto_1166 - MODE
      ?auto_1168 - DIRECTION
      ?auto_1167 - MODE
    )
    :vars
    (
      ?auto_1170 - INSTRUMENT
      ?auto_1171 - SATELLITE
      ?auto_1169 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1168 ?auto_1165 ) ) ( ON_BOARD ?auto_1170 ?auto_1171 ) ( SUPPORTS ?auto_1170 ?auto_1166 ) ( POINTING ?auto_1171 ?auto_1169 ) ( not ( = ?auto_1165 ?auto_1169 ) ) ( HAVE_IMAGE ?auto_1168 ?auto_1167 ) ( not ( = ?auto_1168 ?auto_1169 ) ) ( not ( = ?auto_1167 ?auto_1166 ) ) ( CALIBRATION_TARGET ?auto_1170 ?auto_1169 ) ( POWER_AVAIL ?auto_1171 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1168 ?auto_1167 ?auto_1165 ?auto_1166 )
      ( GET-2IMAGE-VERIFY ?auto_1165 ?auto_1166 ?auto_1168 ?auto_1167 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1181 - DIRECTION
      ?auto_1182 - MODE
    )
    :vars
    (
      ?auto_1183 - DIRECTION
      ?auto_1185 - INSTRUMENT
      ?auto_1186 - SATELLITE
      ?auto_1184 - DIRECTION
      ?auto_1187 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1181 ?auto_1183 ) ) ( ON_BOARD ?auto_1185 ?auto_1186 ) ( SUPPORTS ?auto_1185 ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1184 ) ) ( HAVE_IMAGE ?auto_1183 ?auto_1187 ) ( not ( = ?auto_1183 ?auto_1184 ) ) ( not ( = ?auto_1187 ?auto_1182 ) ) ( CALIBRATION_TARGET ?auto_1185 ?auto_1184 ) ( POWER_AVAIL ?auto_1186 ) ( POINTING ?auto_1186 ?auto_1183 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1186 ?auto_1184 ?auto_1183 )
      ( GET-2IMAGE ?auto_1183 ?auto_1187 ?auto_1181 ?auto_1182 )
      ( GET-1IMAGE-VERIFY ?auto_1181 ?auto_1182 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1188 - DIRECTION
      ?auto_1189 - MODE
      ?auto_1191 - DIRECTION
      ?auto_1190 - MODE
    )
    :vars
    (
      ?auto_1192 - INSTRUMENT
      ?auto_1193 - SATELLITE
      ?auto_1194 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1191 ?auto_1188 ) ) ( ON_BOARD ?auto_1192 ?auto_1193 ) ( SUPPORTS ?auto_1192 ?auto_1190 ) ( not ( = ?auto_1191 ?auto_1194 ) ) ( HAVE_IMAGE ?auto_1188 ?auto_1189 ) ( not ( = ?auto_1188 ?auto_1194 ) ) ( not ( = ?auto_1189 ?auto_1190 ) ) ( CALIBRATION_TARGET ?auto_1192 ?auto_1194 ) ( POWER_AVAIL ?auto_1193 ) ( POINTING ?auto_1193 ?auto_1188 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1191 ?auto_1190 )
      ( GET-2IMAGE-VERIFY ?auto_1188 ?auto_1189 ?auto_1191 ?auto_1190 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1195 - DIRECTION
      ?auto_1196 - MODE
      ?auto_1198 - DIRECTION
      ?auto_1197 - MODE
    )
    :vars
    (
      ?auto_1200 - INSTRUMENT
      ?auto_1201 - SATELLITE
      ?auto_1199 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1198 ?auto_1195 ) ) ( ON_BOARD ?auto_1200 ?auto_1201 ) ( SUPPORTS ?auto_1200 ?auto_1196 ) ( not ( = ?auto_1195 ?auto_1199 ) ) ( HAVE_IMAGE ?auto_1198 ?auto_1197 ) ( not ( = ?auto_1198 ?auto_1199 ) ) ( not ( = ?auto_1197 ?auto_1196 ) ) ( CALIBRATION_TARGET ?auto_1200 ?auto_1199 ) ( POWER_AVAIL ?auto_1201 ) ( POINTING ?auto_1201 ?auto_1198 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1198 ?auto_1197 ?auto_1195 ?auto_1196 )
      ( GET-2IMAGE-VERIFY ?auto_1195 ?auto_1196 ?auto_1198 ?auto_1197 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1211 - DIRECTION
      ?auto_1212 - MODE
    )
    :vars
    (
      ?auto_1216 - DIRECTION
      ?auto_1214 - INSTRUMENT
      ?auto_1217 - SATELLITE
      ?auto_1213 - DIRECTION
      ?auto_1215 - MODE
      ?auto_1218 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1211 ?auto_1216 ) ) ( ON_BOARD ?auto_1214 ?auto_1217 ) ( SUPPORTS ?auto_1214 ?auto_1212 ) ( not ( = ?auto_1211 ?auto_1213 ) ) ( HAVE_IMAGE ?auto_1216 ?auto_1215 ) ( not ( = ?auto_1216 ?auto_1213 ) ) ( not ( = ?auto_1215 ?auto_1212 ) ) ( CALIBRATION_TARGET ?auto_1214 ?auto_1213 ) ( POINTING ?auto_1217 ?auto_1216 ) ( ON_BOARD ?auto_1218 ?auto_1217 ) ( POWER_ON ?auto_1218 ) ( not ( = ?auto_1214 ?auto_1218 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1218 ?auto_1217 )
      ( GET-2IMAGE ?auto_1216 ?auto_1215 ?auto_1211 ?auto_1212 )
      ( GET-1IMAGE-VERIFY ?auto_1211 ?auto_1212 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1219 - DIRECTION
      ?auto_1220 - MODE
      ?auto_1222 - DIRECTION
      ?auto_1221 - MODE
    )
    :vars
    (
      ?auto_1225 - INSTRUMENT
      ?auto_1224 - SATELLITE
      ?auto_1226 - DIRECTION
      ?auto_1223 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1222 ?auto_1219 ) ) ( ON_BOARD ?auto_1225 ?auto_1224 ) ( SUPPORTS ?auto_1225 ?auto_1221 ) ( not ( = ?auto_1222 ?auto_1226 ) ) ( HAVE_IMAGE ?auto_1219 ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1226 ) ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( CALIBRATION_TARGET ?auto_1225 ?auto_1226 ) ( POINTING ?auto_1224 ?auto_1219 ) ( ON_BOARD ?auto_1223 ?auto_1224 ) ( POWER_ON ?auto_1223 ) ( not ( = ?auto_1225 ?auto_1223 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1222 ?auto_1221 )
      ( GET-2IMAGE-VERIFY ?auto_1219 ?auto_1220 ?auto_1222 ?auto_1221 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1227 - DIRECTION
      ?auto_1228 - MODE
      ?auto_1230 - DIRECTION
      ?auto_1229 - MODE
    )
    :vars
    (
      ?auto_1233 - INSTRUMENT
      ?auto_1234 - SATELLITE
      ?auto_1231 - DIRECTION
      ?auto_1232 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1230 ?auto_1227 ) ) ( ON_BOARD ?auto_1233 ?auto_1234 ) ( SUPPORTS ?auto_1233 ?auto_1228 ) ( not ( = ?auto_1227 ?auto_1231 ) ) ( HAVE_IMAGE ?auto_1230 ?auto_1229 ) ( not ( = ?auto_1230 ?auto_1231 ) ) ( not ( = ?auto_1229 ?auto_1228 ) ) ( CALIBRATION_TARGET ?auto_1233 ?auto_1231 ) ( POINTING ?auto_1234 ?auto_1230 ) ( ON_BOARD ?auto_1232 ?auto_1234 ) ( POWER_ON ?auto_1232 ) ( not ( = ?auto_1233 ?auto_1232 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1230 ?auto_1229 ?auto_1227 ?auto_1228 )
      ( GET-2IMAGE-VERIFY ?auto_1227 ?auto_1228 ?auto_1230 ?auto_1229 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1245 - DIRECTION
      ?auto_1246 - MODE
    )
    :vars
    (
      ?auto_1252 - DIRECTION
      ?auto_1249 - INSTRUMENT
      ?auto_1250 - SATELLITE
      ?auto_1247 - DIRECTION
      ?auto_1251 - MODE
      ?auto_1248 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1245 ?auto_1252 ) ) ( ON_BOARD ?auto_1249 ?auto_1250 ) ( SUPPORTS ?auto_1249 ?auto_1246 ) ( not ( = ?auto_1245 ?auto_1247 ) ) ( not ( = ?auto_1252 ?auto_1247 ) ) ( not ( = ?auto_1251 ?auto_1246 ) ) ( CALIBRATION_TARGET ?auto_1249 ?auto_1247 ) ( POINTING ?auto_1250 ?auto_1252 ) ( ON_BOARD ?auto_1248 ?auto_1250 ) ( POWER_ON ?auto_1248 ) ( not ( = ?auto_1249 ?auto_1248 ) ) ( CALIBRATED ?auto_1248 ) ( SUPPORTS ?auto_1248 ?auto_1251 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1252 ?auto_1251 )
      ( GET-2IMAGE ?auto_1252 ?auto_1251 ?auto_1245 ?auto_1246 )
      ( GET-1IMAGE-VERIFY ?auto_1245 ?auto_1246 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1253 - DIRECTION
      ?auto_1254 - MODE
      ?auto_1256 - DIRECTION
      ?auto_1255 - MODE
    )
    :vars
    (
      ?auto_1258 - INSTRUMENT
      ?auto_1260 - SATELLITE
      ?auto_1259 - DIRECTION
      ?auto_1257 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1256 ?auto_1253 ) ) ( ON_BOARD ?auto_1258 ?auto_1260 ) ( SUPPORTS ?auto_1258 ?auto_1255 ) ( not ( = ?auto_1256 ?auto_1259 ) ) ( not ( = ?auto_1253 ?auto_1259 ) ) ( not ( = ?auto_1254 ?auto_1255 ) ) ( CALIBRATION_TARGET ?auto_1258 ?auto_1259 ) ( POINTING ?auto_1260 ?auto_1253 ) ( ON_BOARD ?auto_1257 ?auto_1260 ) ( POWER_ON ?auto_1257 ) ( not ( = ?auto_1258 ?auto_1257 ) ) ( CALIBRATED ?auto_1257 ) ( SUPPORTS ?auto_1257 ?auto_1254 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1256 ?auto_1255 )
      ( GET-2IMAGE-VERIFY ?auto_1253 ?auto_1254 ?auto_1256 ?auto_1255 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1261 - DIRECTION
      ?auto_1262 - MODE
      ?auto_1264 - DIRECTION
      ?auto_1263 - MODE
    )
    :vars
    (
      ?auto_1267 - INSTRUMENT
      ?auto_1265 - SATELLITE
      ?auto_1266 - DIRECTION
      ?auto_1268 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1264 ?auto_1261 ) ) ( ON_BOARD ?auto_1267 ?auto_1265 ) ( SUPPORTS ?auto_1267 ?auto_1262 ) ( not ( = ?auto_1261 ?auto_1266 ) ) ( not ( = ?auto_1264 ?auto_1266 ) ) ( not ( = ?auto_1263 ?auto_1262 ) ) ( CALIBRATION_TARGET ?auto_1267 ?auto_1266 ) ( POINTING ?auto_1265 ?auto_1264 ) ( ON_BOARD ?auto_1268 ?auto_1265 ) ( POWER_ON ?auto_1268 ) ( not ( = ?auto_1267 ?auto_1268 ) ) ( CALIBRATED ?auto_1268 ) ( SUPPORTS ?auto_1268 ?auto_1263 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1264 ?auto_1263 ?auto_1261 ?auto_1262 )
      ( GET-2IMAGE-VERIFY ?auto_1261 ?auto_1262 ?auto_1264 ?auto_1263 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1279 - DIRECTION
      ?auto_1280 - MODE
    )
    :vars
    (
      ?auto_1282 - DIRECTION
      ?auto_1285 - INSTRUMENT
      ?auto_1283 - SATELLITE
      ?auto_1284 - DIRECTION
      ?auto_1281 - MODE
      ?auto_1286 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1279 ?auto_1282 ) ) ( ON_BOARD ?auto_1285 ?auto_1283 ) ( SUPPORTS ?auto_1285 ?auto_1280 ) ( not ( = ?auto_1279 ?auto_1284 ) ) ( not ( = ?auto_1282 ?auto_1284 ) ) ( not ( = ?auto_1281 ?auto_1280 ) ) ( CALIBRATION_TARGET ?auto_1285 ?auto_1284 ) ( ON_BOARD ?auto_1286 ?auto_1283 ) ( POWER_ON ?auto_1286 ) ( not ( = ?auto_1285 ?auto_1286 ) ) ( CALIBRATED ?auto_1286 ) ( SUPPORTS ?auto_1286 ?auto_1281 ) ( POINTING ?auto_1283 ?auto_1284 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1283 ?auto_1282 ?auto_1284 )
      ( GET-2IMAGE ?auto_1282 ?auto_1281 ?auto_1279 ?auto_1280 )
      ( GET-1IMAGE-VERIFY ?auto_1279 ?auto_1280 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1287 - DIRECTION
      ?auto_1288 - MODE
      ?auto_1290 - DIRECTION
      ?auto_1289 - MODE
    )
    :vars
    (
      ?auto_1292 - INSTRUMENT
      ?auto_1291 - SATELLITE
      ?auto_1293 - DIRECTION
      ?auto_1294 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1290 ?auto_1287 ) ) ( ON_BOARD ?auto_1292 ?auto_1291 ) ( SUPPORTS ?auto_1292 ?auto_1289 ) ( not ( = ?auto_1290 ?auto_1293 ) ) ( not ( = ?auto_1287 ?auto_1293 ) ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( CALIBRATION_TARGET ?auto_1292 ?auto_1293 ) ( ON_BOARD ?auto_1294 ?auto_1291 ) ( POWER_ON ?auto_1294 ) ( not ( = ?auto_1292 ?auto_1294 ) ) ( CALIBRATED ?auto_1294 ) ( SUPPORTS ?auto_1294 ?auto_1288 ) ( POINTING ?auto_1291 ?auto_1293 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1290 ?auto_1289 )
      ( GET-2IMAGE-VERIFY ?auto_1287 ?auto_1288 ?auto_1290 ?auto_1289 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1295 - DIRECTION
      ?auto_1296 - MODE
      ?auto_1298 - DIRECTION
      ?auto_1297 - MODE
    )
    :vars
    (
      ?auto_1301 - INSTRUMENT
      ?auto_1300 - SATELLITE
      ?auto_1302 - DIRECTION
      ?auto_1299 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1298 ?auto_1295 ) ) ( ON_BOARD ?auto_1301 ?auto_1300 ) ( SUPPORTS ?auto_1301 ?auto_1296 ) ( not ( = ?auto_1295 ?auto_1302 ) ) ( not ( = ?auto_1298 ?auto_1302 ) ) ( not ( = ?auto_1297 ?auto_1296 ) ) ( CALIBRATION_TARGET ?auto_1301 ?auto_1302 ) ( ON_BOARD ?auto_1299 ?auto_1300 ) ( POWER_ON ?auto_1299 ) ( not ( = ?auto_1301 ?auto_1299 ) ) ( CALIBRATED ?auto_1299 ) ( SUPPORTS ?auto_1299 ?auto_1297 ) ( POINTING ?auto_1300 ?auto_1302 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1298 ?auto_1297 ?auto_1295 ?auto_1296 )
      ( GET-2IMAGE-VERIFY ?auto_1295 ?auto_1296 ?auto_1298 ?auto_1297 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1313 - DIRECTION
      ?auto_1314 - MODE
    )
    :vars
    (
      ?auto_1320 - DIRECTION
      ?auto_1317 - INSTRUMENT
      ?auto_1316 - SATELLITE
      ?auto_1318 - DIRECTION
      ?auto_1319 - MODE
      ?auto_1315 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1313 ?auto_1320 ) ) ( ON_BOARD ?auto_1317 ?auto_1316 ) ( SUPPORTS ?auto_1317 ?auto_1314 ) ( not ( = ?auto_1313 ?auto_1318 ) ) ( not ( = ?auto_1320 ?auto_1318 ) ) ( not ( = ?auto_1319 ?auto_1314 ) ) ( CALIBRATION_TARGET ?auto_1317 ?auto_1318 ) ( ON_BOARD ?auto_1315 ?auto_1316 ) ( POWER_ON ?auto_1315 ) ( not ( = ?auto_1317 ?auto_1315 ) ) ( SUPPORTS ?auto_1315 ?auto_1319 ) ( POINTING ?auto_1316 ?auto_1318 ) ( CALIBRATION_TARGET ?auto_1315 ?auto_1318 ) ( NOT_CALIBRATED ?auto_1315 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1316 ?auto_1315 ?auto_1318 )
      ( GET-2IMAGE ?auto_1320 ?auto_1319 ?auto_1313 ?auto_1314 )
      ( GET-1IMAGE-VERIFY ?auto_1313 ?auto_1314 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1321 - DIRECTION
      ?auto_1322 - MODE
      ?auto_1324 - DIRECTION
      ?auto_1323 - MODE
    )
    :vars
    (
      ?auto_1325 - INSTRUMENT
      ?auto_1327 - SATELLITE
      ?auto_1328 - DIRECTION
      ?auto_1326 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1324 ?auto_1321 ) ) ( ON_BOARD ?auto_1325 ?auto_1327 ) ( SUPPORTS ?auto_1325 ?auto_1323 ) ( not ( = ?auto_1324 ?auto_1328 ) ) ( not ( = ?auto_1321 ?auto_1328 ) ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( CALIBRATION_TARGET ?auto_1325 ?auto_1328 ) ( ON_BOARD ?auto_1326 ?auto_1327 ) ( POWER_ON ?auto_1326 ) ( not ( = ?auto_1325 ?auto_1326 ) ) ( SUPPORTS ?auto_1326 ?auto_1322 ) ( POINTING ?auto_1327 ?auto_1328 ) ( CALIBRATION_TARGET ?auto_1326 ?auto_1328 ) ( NOT_CALIBRATED ?auto_1326 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1324 ?auto_1323 )
      ( GET-2IMAGE-VERIFY ?auto_1321 ?auto_1322 ?auto_1324 ?auto_1323 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1329 - DIRECTION
      ?auto_1330 - MODE
      ?auto_1332 - DIRECTION
      ?auto_1331 - MODE
    )
    :vars
    (
      ?auto_1335 - INSTRUMENT
      ?auto_1336 - SATELLITE
      ?auto_1334 - DIRECTION
      ?auto_1333 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1332 ?auto_1329 ) ) ( ON_BOARD ?auto_1335 ?auto_1336 ) ( SUPPORTS ?auto_1335 ?auto_1330 ) ( not ( = ?auto_1329 ?auto_1334 ) ) ( not ( = ?auto_1332 ?auto_1334 ) ) ( not ( = ?auto_1331 ?auto_1330 ) ) ( CALIBRATION_TARGET ?auto_1335 ?auto_1334 ) ( ON_BOARD ?auto_1333 ?auto_1336 ) ( POWER_ON ?auto_1333 ) ( not ( = ?auto_1335 ?auto_1333 ) ) ( SUPPORTS ?auto_1333 ?auto_1331 ) ( POINTING ?auto_1336 ?auto_1334 ) ( CALIBRATION_TARGET ?auto_1333 ?auto_1334 ) ( NOT_CALIBRATED ?auto_1333 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1332 ?auto_1331 ?auto_1329 ?auto_1330 )
      ( GET-2IMAGE-VERIFY ?auto_1329 ?auto_1330 ?auto_1332 ?auto_1331 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1347 - DIRECTION
      ?auto_1348 - MODE
    )
    :vars
    (
      ?auto_1351 - DIRECTION
      ?auto_1353 - INSTRUMENT
      ?auto_1354 - SATELLITE
      ?auto_1352 - DIRECTION
      ?auto_1350 - MODE
      ?auto_1349 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1347 ?auto_1351 ) ) ( ON_BOARD ?auto_1353 ?auto_1354 ) ( SUPPORTS ?auto_1353 ?auto_1348 ) ( not ( = ?auto_1347 ?auto_1352 ) ) ( not ( = ?auto_1351 ?auto_1352 ) ) ( not ( = ?auto_1350 ?auto_1348 ) ) ( CALIBRATION_TARGET ?auto_1353 ?auto_1352 ) ( ON_BOARD ?auto_1349 ?auto_1354 ) ( not ( = ?auto_1353 ?auto_1349 ) ) ( SUPPORTS ?auto_1349 ?auto_1350 ) ( POINTING ?auto_1354 ?auto_1352 ) ( CALIBRATION_TARGET ?auto_1349 ?auto_1352 ) ( POWER_AVAIL ?auto_1354 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1349 ?auto_1354 )
      ( GET-2IMAGE ?auto_1351 ?auto_1350 ?auto_1347 ?auto_1348 )
      ( GET-1IMAGE-VERIFY ?auto_1347 ?auto_1348 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1355 - DIRECTION
      ?auto_1356 - MODE
      ?auto_1358 - DIRECTION
      ?auto_1357 - MODE
    )
    :vars
    (
      ?auto_1360 - INSTRUMENT
      ?auto_1362 - SATELLITE
      ?auto_1359 - DIRECTION
      ?auto_1361 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1358 ?auto_1355 ) ) ( ON_BOARD ?auto_1360 ?auto_1362 ) ( SUPPORTS ?auto_1360 ?auto_1357 ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( not ( = ?auto_1355 ?auto_1359 ) ) ( not ( = ?auto_1356 ?auto_1357 ) ) ( CALIBRATION_TARGET ?auto_1360 ?auto_1359 ) ( ON_BOARD ?auto_1361 ?auto_1362 ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( SUPPORTS ?auto_1361 ?auto_1356 ) ( POINTING ?auto_1362 ?auto_1359 ) ( CALIBRATION_TARGET ?auto_1361 ?auto_1359 ) ( POWER_AVAIL ?auto_1362 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1358 ?auto_1357 )
      ( GET-2IMAGE-VERIFY ?auto_1355 ?auto_1356 ?auto_1358 ?auto_1357 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1363 - DIRECTION
      ?auto_1364 - MODE
      ?auto_1366 - DIRECTION
      ?auto_1365 - MODE
    )
    :vars
    (
      ?auto_1368 - INSTRUMENT
      ?auto_1367 - SATELLITE
      ?auto_1370 - DIRECTION
      ?auto_1369 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1366 ?auto_1363 ) ) ( ON_BOARD ?auto_1368 ?auto_1367 ) ( SUPPORTS ?auto_1368 ?auto_1364 ) ( not ( = ?auto_1363 ?auto_1370 ) ) ( not ( = ?auto_1366 ?auto_1370 ) ) ( not ( = ?auto_1365 ?auto_1364 ) ) ( CALIBRATION_TARGET ?auto_1368 ?auto_1370 ) ( ON_BOARD ?auto_1369 ?auto_1367 ) ( not ( = ?auto_1368 ?auto_1369 ) ) ( SUPPORTS ?auto_1369 ?auto_1365 ) ( POINTING ?auto_1367 ?auto_1370 ) ( CALIBRATION_TARGET ?auto_1369 ?auto_1370 ) ( POWER_AVAIL ?auto_1367 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1366 ?auto_1365 ?auto_1363 ?auto_1364 )
      ( GET-2IMAGE-VERIFY ?auto_1363 ?auto_1364 ?auto_1366 ?auto_1365 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1381 - DIRECTION
      ?auto_1382 - MODE
    )
    :vars
    (
      ?auto_1388 - DIRECTION
      ?auto_1384 - INSTRUMENT
      ?auto_1383 - SATELLITE
      ?auto_1386 - DIRECTION
      ?auto_1387 - MODE
      ?auto_1385 - INSTRUMENT
      ?auto_1389 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1381 ?auto_1388 ) ) ( ON_BOARD ?auto_1384 ?auto_1383 ) ( SUPPORTS ?auto_1384 ?auto_1382 ) ( not ( = ?auto_1381 ?auto_1386 ) ) ( not ( = ?auto_1388 ?auto_1386 ) ) ( not ( = ?auto_1387 ?auto_1382 ) ) ( CALIBRATION_TARGET ?auto_1384 ?auto_1386 ) ( ON_BOARD ?auto_1385 ?auto_1383 ) ( not ( = ?auto_1384 ?auto_1385 ) ) ( SUPPORTS ?auto_1385 ?auto_1387 ) ( CALIBRATION_TARGET ?auto_1385 ?auto_1386 ) ( POWER_AVAIL ?auto_1383 ) ( POINTING ?auto_1383 ?auto_1389 ) ( not ( = ?auto_1386 ?auto_1389 ) ) ( not ( = ?auto_1381 ?auto_1389 ) ) ( not ( = ?auto_1388 ?auto_1389 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1383 ?auto_1386 ?auto_1389 )
      ( GET-2IMAGE ?auto_1388 ?auto_1387 ?auto_1381 ?auto_1382 )
      ( GET-1IMAGE-VERIFY ?auto_1381 ?auto_1382 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1390 - DIRECTION
      ?auto_1391 - MODE
      ?auto_1393 - DIRECTION
      ?auto_1392 - MODE
    )
    :vars
    (
      ?auto_1394 - INSTRUMENT
      ?auto_1398 - SATELLITE
      ?auto_1396 - DIRECTION
      ?auto_1395 - INSTRUMENT
      ?auto_1397 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1393 ?auto_1390 ) ) ( ON_BOARD ?auto_1394 ?auto_1398 ) ( SUPPORTS ?auto_1394 ?auto_1392 ) ( not ( = ?auto_1393 ?auto_1396 ) ) ( not ( = ?auto_1390 ?auto_1396 ) ) ( not ( = ?auto_1391 ?auto_1392 ) ) ( CALIBRATION_TARGET ?auto_1394 ?auto_1396 ) ( ON_BOARD ?auto_1395 ?auto_1398 ) ( not ( = ?auto_1394 ?auto_1395 ) ) ( SUPPORTS ?auto_1395 ?auto_1391 ) ( CALIBRATION_TARGET ?auto_1395 ?auto_1396 ) ( POWER_AVAIL ?auto_1398 ) ( POINTING ?auto_1398 ?auto_1397 ) ( not ( = ?auto_1396 ?auto_1397 ) ) ( not ( = ?auto_1393 ?auto_1397 ) ) ( not ( = ?auto_1390 ?auto_1397 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1393 ?auto_1392 )
      ( GET-2IMAGE-VERIFY ?auto_1390 ?auto_1391 ?auto_1393 ?auto_1392 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1399 - DIRECTION
      ?auto_1400 - MODE
      ?auto_1402 - DIRECTION
      ?auto_1401 - MODE
    )
    :vars
    (
      ?auto_1403 - INSTRUMENT
      ?auto_1406 - SATELLITE
      ?auto_1404 - DIRECTION
      ?auto_1407 - INSTRUMENT
      ?auto_1405 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1402 ?auto_1399 ) ) ( ON_BOARD ?auto_1403 ?auto_1406 ) ( SUPPORTS ?auto_1403 ?auto_1400 ) ( not ( = ?auto_1399 ?auto_1404 ) ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( not ( = ?auto_1401 ?auto_1400 ) ) ( CALIBRATION_TARGET ?auto_1403 ?auto_1404 ) ( ON_BOARD ?auto_1407 ?auto_1406 ) ( not ( = ?auto_1403 ?auto_1407 ) ) ( SUPPORTS ?auto_1407 ?auto_1401 ) ( CALIBRATION_TARGET ?auto_1407 ?auto_1404 ) ( POWER_AVAIL ?auto_1406 ) ( POINTING ?auto_1406 ?auto_1405 ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( not ( = ?auto_1399 ?auto_1405 ) ) ( not ( = ?auto_1402 ?auto_1405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1402 ?auto_1401 ?auto_1399 ?auto_1400 )
      ( GET-2IMAGE-VERIFY ?auto_1399 ?auto_1400 ?auto_1402 ?auto_1401 ) )
  )

)

