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
      ?auto_1010 - INSTRUMENT
      ?auto_1009 - SATELLITE
      ?auto_1011 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1010 ) ( ON_BOARD ?auto_1010 ?auto_1009 ) ( SUPPORTS ?auto_1010 ?auto_1008 ) ( POWER_ON ?auto_1010 ) ( POINTING ?auto_1009 ?auto_1011 ) ( not ( = ?auto_1007 ?auto_1011 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1009 ?auto_1007 ?auto_1011 )
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
      ?auto_1021 - SATELLITE
      ?auto_1022 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1023 ?auto_1021 ) ( SUPPORTS ?auto_1023 ?auto_1020 ) ( POWER_ON ?auto_1023 ) ( POINTING ?auto_1021 ?auto_1022 ) ( not ( = ?auto_1019 ?auto_1022 ) ) ( CALIBRATION_TARGET ?auto_1023 ?auto_1022 ) ( NOT_CALIBRATED ?auto_1023 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1021 ?auto_1023 ?auto_1022 )
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
      ?auto_1046 - SATELLITE
      ?auto_1047 - DIRECTION
      ?auto_1048 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1045 ?auto_1046 ) ( SUPPORTS ?auto_1045 ?auto_1044 ) ( not ( = ?auto_1043 ?auto_1047 ) ) ( CALIBRATION_TARGET ?auto_1045 ?auto_1047 ) ( POWER_AVAIL ?auto_1046 ) ( POINTING ?auto_1046 ?auto_1048 ) ( not ( = ?auto_1047 ?auto_1048 ) ) ( not ( = ?auto_1043 ?auto_1048 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1046 ?auto_1047 ?auto_1048 )
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
      ?auto_1079 - INSTRUMENT
      ?auto_1080 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1079 ) ( ON_BOARD ?auto_1079 ?auto_1080 ) ( SUPPORTS ?auto_1079 ?auto_1077 ) ( POWER_ON ?auto_1079 ) ( POINTING ?auto_1080 ?auto_1078 ) ( HAVE_IMAGE ?auto_1075 ?auto_1076 ) ( not ( = ?auto_1075 ?auto_1078 ) ) ( not ( = ?auto_1076 ?auto_1077 ) ) )
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
      ?auto_1085 - INSTRUMENT
      ?auto_1086 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1085 ) ( ON_BOARD ?auto_1085 ?auto_1086 ) ( SUPPORTS ?auto_1085 ?auto_1082 ) ( POWER_ON ?auto_1085 ) ( POINTING ?auto_1086 ?auto_1081 ) ( HAVE_IMAGE ?auto_1084 ?auto_1083 ) ( not ( = ?auto_1081 ?auto_1084 ) ) ( not ( = ?auto_1082 ?auto_1083 ) ) )
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
      ?auto_1095 - INSTRUMENT
      ?auto_1096 - SATELLITE
      ?auto_1097 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1095 ) ( ON_BOARD ?auto_1095 ?auto_1096 ) ( SUPPORTS ?auto_1095 ?auto_1094 ) ( POWER_ON ?auto_1095 ) ( POINTING ?auto_1096 ?auto_1097 ) ( not ( = ?auto_1093 ?auto_1097 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1096 ?auto_1093 ?auto_1097 )
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
      ?auto_1103 - INSTRUMENT
      ?auto_1102 - SATELLITE
      ?auto_1104 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1103 ) ( ON_BOARD ?auto_1103 ?auto_1102 ) ( SUPPORTS ?auto_1103 ?auto_1100 ) ( POWER_ON ?auto_1103 ) ( POINTING ?auto_1102 ?auto_1104 ) ( not ( = ?auto_1101 ?auto_1104 ) ) ( HAVE_IMAGE ?auto_1098 ?auto_1099 ) ( not ( = ?auto_1098 ?auto_1101 ) ) ( not ( = ?auto_1098 ?auto_1104 ) ) ( not ( = ?auto_1099 ?auto_1100 ) ) )
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
      ?auto_1111 - SATELLITE
      ?auto_1109 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1110 ) ( ON_BOARD ?auto_1110 ?auto_1111 ) ( SUPPORTS ?auto_1110 ?auto_1106 ) ( POWER_ON ?auto_1110 ) ( POINTING ?auto_1111 ?auto_1109 ) ( not ( = ?auto_1105 ?auto_1109 ) ) ( HAVE_IMAGE ?auto_1108 ?auto_1107 ) ( not ( = ?auto_1108 ?auto_1105 ) ) ( not ( = ?auto_1108 ?auto_1109 ) ) ( not ( = ?auto_1107 ?auto_1106 ) ) )
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
      ?auto_1126 - INSTRUMENT
      ?auto_1127 - SATELLITE
      ?auto_1124 - DIRECTION
      ?auto_1125 - DIRECTION
      ?auto_1123 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1126 ?auto_1127 ) ( SUPPORTS ?auto_1126 ?auto_1122 ) ( POWER_ON ?auto_1126 ) ( POINTING ?auto_1127 ?auto_1124 ) ( not ( = ?auto_1121 ?auto_1124 ) ) ( HAVE_IMAGE ?auto_1125 ?auto_1123 ) ( not ( = ?auto_1125 ?auto_1121 ) ) ( not ( = ?auto_1125 ?auto_1124 ) ) ( not ( = ?auto_1123 ?auto_1122 ) ) ( CALIBRATION_TARGET ?auto_1126 ?auto_1124 ) ( NOT_CALIBRATED ?auto_1126 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1127 ?auto_1126 ?auto_1124 )
      ( GET-2IMAGE ?auto_1125 ?auto_1123 ?auto_1121 ?auto_1122 )
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
    ( and ( ON_BOARD ?auto_1132 ?auto_1133 ) ( SUPPORTS ?auto_1132 ?auto_1130 ) ( POWER_ON ?auto_1132 ) ( POINTING ?auto_1133 ?auto_1134 ) ( not ( = ?auto_1131 ?auto_1134 ) ) ( HAVE_IMAGE ?auto_1128 ?auto_1129 ) ( not ( = ?auto_1128 ?auto_1131 ) ) ( not ( = ?auto_1128 ?auto_1134 ) ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( CALIBRATION_TARGET ?auto_1132 ?auto_1134 ) ( NOT_CALIBRATED ?auto_1132 ) )
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
    ( and ( ON_BOARD ?auto_1140 ?auto_1139 ) ( SUPPORTS ?auto_1140 ?auto_1136 ) ( POWER_ON ?auto_1140 ) ( POINTING ?auto_1139 ?auto_1141 ) ( not ( = ?auto_1135 ?auto_1141 ) ) ( HAVE_IMAGE ?auto_1138 ?auto_1137 ) ( not ( = ?auto_1138 ?auto_1135 ) ) ( not ( = ?auto_1138 ?auto_1141 ) ) ( not ( = ?auto_1137 ?auto_1136 ) ) ( CALIBRATION_TARGET ?auto_1140 ?auto_1141 ) ( NOT_CALIBRATED ?auto_1140 ) )
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
      ?auto_1156 - INSTRUMENT
      ?auto_1153 - SATELLITE
      ?auto_1157 - DIRECTION
      ?auto_1155 - DIRECTION
      ?auto_1154 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1156 ?auto_1153 ) ( SUPPORTS ?auto_1156 ?auto_1152 ) ( POINTING ?auto_1153 ?auto_1157 ) ( not ( = ?auto_1151 ?auto_1157 ) ) ( HAVE_IMAGE ?auto_1155 ?auto_1154 ) ( not ( = ?auto_1155 ?auto_1151 ) ) ( not ( = ?auto_1155 ?auto_1157 ) ) ( not ( = ?auto_1154 ?auto_1152 ) ) ( CALIBRATION_TARGET ?auto_1156 ?auto_1157 ) ( POWER_AVAIL ?auto_1153 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1156 ?auto_1153 )
      ( GET-2IMAGE ?auto_1155 ?auto_1154 ?auto_1151 ?auto_1152 )
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
      ?auto_1163 - INSTRUMENT
      ?auto_1162 - SATELLITE
      ?auto_1164 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1163 ?auto_1162 ) ( SUPPORTS ?auto_1163 ?auto_1160 ) ( POINTING ?auto_1162 ?auto_1164 ) ( not ( = ?auto_1161 ?auto_1164 ) ) ( HAVE_IMAGE ?auto_1158 ?auto_1159 ) ( not ( = ?auto_1158 ?auto_1161 ) ) ( not ( = ?auto_1158 ?auto_1164 ) ) ( not ( = ?auto_1159 ?auto_1160 ) ) ( CALIBRATION_TARGET ?auto_1163 ?auto_1164 ) ( POWER_AVAIL ?auto_1162 ) )
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
      ?auto_1169 - SATELLITE
      ?auto_1171 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1170 ?auto_1169 ) ( SUPPORTS ?auto_1170 ?auto_1166 ) ( POINTING ?auto_1169 ?auto_1171 ) ( not ( = ?auto_1165 ?auto_1171 ) ) ( HAVE_IMAGE ?auto_1168 ?auto_1167 ) ( not ( = ?auto_1168 ?auto_1165 ) ) ( not ( = ?auto_1168 ?auto_1171 ) ) ( not ( = ?auto_1167 ?auto_1166 ) ) ( CALIBRATION_TARGET ?auto_1170 ?auto_1171 ) ( POWER_AVAIL ?auto_1169 ) )
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
      ?auto_1184 - INSTRUMENT
      ?auto_1183 - SATELLITE
      ?auto_1187 - DIRECTION
      ?auto_1186 - DIRECTION
      ?auto_1185 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1184 ?auto_1183 ) ( SUPPORTS ?auto_1184 ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1187 ) ) ( HAVE_IMAGE ?auto_1186 ?auto_1185 ) ( not ( = ?auto_1186 ?auto_1181 ) ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( not ( = ?auto_1185 ?auto_1182 ) ) ( CALIBRATION_TARGET ?auto_1184 ?auto_1187 ) ( POWER_AVAIL ?auto_1183 ) ( POINTING ?auto_1183 ?auto_1186 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1183 ?auto_1187 ?auto_1186 )
      ( GET-2IMAGE ?auto_1186 ?auto_1185 ?auto_1181 ?auto_1182 )
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
      ?auto_1194 - INSTRUMENT
      ?auto_1192 - SATELLITE
      ?auto_1193 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1194 ?auto_1192 ) ( SUPPORTS ?auto_1194 ?auto_1190 ) ( not ( = ?auto_1191 ?auto_1193 ) ) ( HAVE_IMAGE ?auto_1188 ?auto_1189 ) ( not ( = ?auto_1188 ?auto_1191 ) ) ( not ( = ?auto_1188 ?auto_1193 ) ) ( not ( = ?auto_1189 ?auto_1190 ) ) ( CALIBRATION_TARGET ?auto_1194 ?auto_1193 ) ( POWER_AVAIL ?auto_1192 ) ( POINTING ?auto_1192 ?auto_1188 ) )
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
      ?auto_1199 - SATELLITE
      ?auto_1201 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1200 ?auto_1199 ) ( SUPPORTS ?auto_1200 ?auto_1196 ) ( not ( = ?auto_1195 ?auto_1201 ) ) ( HAVE_IMAGE ?auto_1198 ?auto_1197 ) ( not ( = ?auto_1198 ?auto_1195 ) ) ( not ( = ?auto_1198 ?auto_1201 ) ) ( not ( = ?auto_1197 ?auto_1196 ) ) ( CALIBRATION_TARGET ?auto_1200 ?auto_1201 ) ( POWER_AVAIL ?auto_1199 ) ( POINTING ?auto_1199 ?auto_1198 ) )
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
      ?auto_1216 - INSTRUMENT
      ?auto_1213 - SATELLITE
      ?auto_1217 - DIRECTION
      ?auto_1215 - DIRECTION
      ?auto_1214 - MODE
      ?auto_1218 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1216 ?auto_1213 ) ( SUPPORTS ?auto_1216 ?auto_1212 ) ( not ( = ?auto_1211 ?auto_1217 ) ) ( HAVE_IMAGE ?auto_1215 ?auto_1214 ) ( not ( = ?auto_1215 ?auto_1211 ) ) ( not ( = ?auto_1215 ?auto_1217 ) ) ( not ( = ?auto_1214 ?auto_1212 ) ) ( CALIBRATION_TARGET ?auto_1216 ?auto_1217 ) ( POINTING ?auto_1213 ?auto_1215 ) ( ON_BOARD ?auto_1218 ?auto_1213 ) ( POWER_ON ?auto_1218 ) ( not ( = ?auto_1216 ?auto_1218 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1218 ?auto_1213 )
      ( GET-2IMAGE ?auto_1215 ?auto_1214 ?auto_1211 ?auto_1212 )
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
      ?auto_1226 - SATELLITE
      ?auto_1223 - DIRECTION
      ?auto_1224 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1225 ?auto_1226 ) ( SUPPORTS ?auto_1225 ?auto_1221 ) ( not ( = ?auto_1222 ?auto_1223 ) ) ( HAVE_IMAGE ?auto_1219 ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1222 ) ) ( not ( = ?auto_1219 ?auto_1223 ) ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( CALIBRATION_TARGET ?auto_1225 ?auto_1223 ) ( POINTING ?auto_1226 ?auto_1219 ) ( ON_BOARD ?auto_1224 ?auto_1226 ) ( POWER_ON ?auto_1224 ) ( not ( = ?auto_1225 ?auto_1224 ) ) )
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
      ?auto_1232 - INSTRUMENT
      ?auto_1231 - SATELLITE
      ?auto_1233 - DIRECTION
      ?auto_1234 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1232 ?auto_1231 ) ( SUPPORTS ?auto_1232 ?auto_1228 ) ( not ( = ?auto_1227 ?auto_1233 ) ) ( HAVE_IMAGE ?auto_1230 ?auto_1229 ) ( not ( = ?auto_1230 ?auto_1227 ) ) ( not ( = ?auto_1230 ?auto_1233 ) ) ( not ( = ?auto_1229 ?auto_1228 ) ) ( CALIBRATION_TARGET ?auto_1232 ?auto_1233 ) ( POINTING ?auto_1231 ?auto_1230 ) ( ON_BOARD ?auto_1234 ?auto_1231 ) ( POWER_ON ?auto_1234 ) ( not ( = ?auto_1232 ?auto_1234 ) ) )
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
      ?auto_1250 - INSTRUMENT
      ?auto_1249 - SATELLITE
      ?auto_1251 - DIRECTION
      ?auto_1248 - DIRECTION
      ?auto_1247 - MODE
      ?auto_1252 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1250 ?auto_1249 ) ( SUPPORTS ?auto_1250 ?auto_1246 ) ( not ( = ?auto_1245 ?auto_1251 ) ) ( not ( = ?auto_1248 ?auto_1245 ) ) ( not ( = ?auto_1248 ?auto_1251 ) ) ( not ( = ?auto_1247 ?auto_1246 ) ) ( CALIBRATION_TARGET ?auto_1250 ?auto_1251 ) ( POINTING ?auto_1249 ?auto_1248 ) ( ON_BOARD ?auto_1252 ?auto_1249 ) ( POWER_ON ?auto_1252 ) ( not ( = ?auto_1250 ?auto_1252 ) ) ( CALIBRATED ?auto_1252 ) ( SUPPORTS ?auto_1252 ?auto_1247 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1248 ?auto_1247 )
      ( GET-2IMAGE ?auto_1248 ?auto_1247 ?auto_1245 ?auto_1246 )
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
      ?auto_1260 - INSTRUMENT
      ?auto_1257 - SATELLITE
      ?auto_1259 - DIRECTION
      ?auto_1258 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1260 ?auto_1257 ) ( SUPPORTS ?auto_1260 ?auto_1255 ) ( not ( = ?auto_1256 ?auto_1259 ) ) ( not ( = ?auto_1253 ?auto_1256 ) ) ( not ( = ?auto_1253 ?auto_1259 ) ) ( not ( = ?auto_1254 ?auto_1255 ) ) ( CALIBRATION_TARGET ?auto_1260 ?auto_1259 ) ( POINTING ?auto_1257 ?auto_1253 ) ( ON_BOARD ?auto_1258 ?auto_1257 ) ( POWER_ON ?auto_1258 ) ( not ( = ?auto_1260 ?auto_1258 ) ) ( CALIBRATED ?auto_1258 ) ( SUPPORTS ?auto_1258 ?auto_1254 ) )
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
      ?auto_1265 - INSTRUMENT
      ?auto_1268 - SATELLITE
      ?auto_1267 - DIRECTION
      ?auto_1266 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1265 ?auto_1268 ) ( SUPPORTS ?auto_1265 ?auto_1262 ) ( not ( = ?auto_1261 ?auto_1267 ) ) ( not ( = ?auto_1264 ?auto_1261 ) ) ( not ( = ?auto_1264 ?auto_1267 ) ) ( not ( = ?auto_1263 ?auto_1262 ) ) ( CALIBRATION_TARGET ?auto_1265 ?auto_1267 ) ( POINTING ?auto_1268 ?auto_1264 ) ( ON_BOARD ?auto_1266 ?auto_1268 ) ( POWER_ON ?auto_1266 ) ( not ( = ?auto_1265 ?auto_1266 ) ) ( CALIBRATED ?auto_1266 ) ( SUPPORTS ?auto_1266 ?auto_1263 ) )
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
      ?auto_1281 - INSTRUMENT
      ?auto_1286 - SATELLITE
      ?auto_1283 - DIRECTION
      ?auto_1285 - DIRECTION
      ?auto_1284 - MODE
      ?auto_1282 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1281 ?auto_1286 ) ( SUPPORTS ?auto_1281 ?auto_1280 ) ( not ( = ?auto_1279 ?auto_1283 ) ) ( not ( = ?auto_1285 ?auto_1279 ) ) ( not ( = ?auto_1285 ?auto_1283 ) ) ( not ( = ?auto_1284 ?auto_1280 ) ) ( CALIBRATION_TARGET ?auto_1281 ?auto_1283 ) ( ON_BOARD ?auto_1282 ?auto_1286 ) ( POWER_ON ?auto_1282 ) ( not ( = ?auto_1281 ?auto_1282 ) ) ( CALIBRATED ?auto_1282 ) ( SUPPORTS ?auto_1282 ?auto_1284 ) ( POINTING ?auto_1286 ?auto_1283 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1286 ?auto_1285 ?auto_1283 )
      ( GET-2IMAGE ?auto_1285 ?auto_1284 ?auto_1279 ?auto_1280 )
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
    ( and ( ON_BOARD ?auto_1292 ?auto_1291 ) ( SUPPORTS ?auto_1292 ?auto_1289 ) ( not ( = ?auto_1290 ?auto_1293 ) ) ( not ( = ?auto_1287 ?auto_1290 ) ) ( not ( = ?auto_1287 ?auto_1293 ) ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( CALIBRATION_TARGET ?auto_1292 ?auto_1293 ) ( ON_BOARD ?auto_1294 ?auto_1291 ) ( POWER_ON ?auto_1294 ) ( not ( = ?auto_1292 ?auto_1294 ) ) ( CALIBRATED ?auto_1294 ) ( SUPPORTS ?auto_1294 ?auto_1288 ) ( POINTING ?auto_1291 ?auto_1293 ) )
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
      ?auto_1300 - INSTRUMENT
      ?auto_1301 - SATELLITE
      ?auto_1302 - DIRECTION
      ?auto_1299 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1300 ?auto_1301 ) ( SUPPORTS ?auto_1300 ?auto_1296 ) ( not ( = ?auto_1295 ?auto_1302 ) ) ( not ( = ?auto_1298 ?auto_1295 ) ) ( not ( = ?auto_1298 ?auto_1302 ) ) ( not ( = ?auto_1297 ?auto_1296 ) ) ( CALIBRATION_TARGET ?auto_1300 ?auto_1302 ) ( ON_BOARD ?auto_1299 ?auto_1301 ) ( POWER_ON ?auto_1299 ) ( not ( = ?auto_1300 ?auto_1299 ) ) ( CALIBRATED ?auto_1299 ) ( SUPPORTS ?auto_1299 ?auto_1297 ) ( POINTING ?auto_1301 ?auto_1302 ) )
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
      ?auto_1316 - INSTRUMENT
      ?auto_1317 - SATELLITE
      ?auto_1318 - DIRECTION
      ?auto_1320 - DIRECTION
      ?auto_1319 - MODE
      ?auto_1315 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1316 ?auto_1317 ) ( SUPPORTS ?auto_1316 ?auto_1314 ) ( not ( = ?auto_1313 ?auto_1318 ) ) ( not ( = ?auto_1320 ?auto_1313 ) ) ( not ( = ?auto_1320 ?auto_1318 ) ) ( not ( = ?auto_1319 ?auto_1314 ) ) ( CALIBRATION_TARGET ?auto_1316 ?auto_1318 ) ( ON_BOARD ?auto_1315 ?auto_1317 ) ( POWER_ON ?auto_1315 ) ( not ( = ?auto_1316 ?auto_1315 ) ) ( SUPPORTS ?auto_1315 ?auto_1319 ) ( POINTING ?auto_1317 ?auto_1318 ) ( CALIBRATION_TARGET ?auto_1315 ?auto_1318 ) ( NOT_CALIBRATED ?auto_1315 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1317 ?auto_1315 ?auto_1318 )
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
      ?auto_1328 - INSTRUMENT
      ?auto_1327 - SATELLITE
      ?auto_1325 - DIRECTION
      ?auto_1326 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1328 ?auto_1327 ) ( SUPPORTS ?auto_1328 ?auto_1323 ) ( not ( = ?auto_1324 ?auto_1325 ) ) ( not ( = ?auto_1321 ?auto_1324 ) ) ( not ( = ?auto_1321 ?auto_1325 ) ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( CALIBRATION_TARGET ?auto_1328 ?auto_1325 ) ( ON_BOARD ?auto_1326 ?auto_1327 ) ( POWER_ON ?auto_1326 ) ( not ( = ?auto_1328 ?auto_1326 ) ) ( SUPPORTS ?auto_1326 ?auto_1322 ) ( POINTING ?auto_1327 ?auto_1325 ) ( CALIBRATION_TARGET ?auto_1326 ?auto_1325 ) ( NOT_CALIBRATED ?auto_1326 ) )
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
    ( and ( ON_BOARD ?auto_1335 ?auto_1336 ) ( SUPPORTS ?auto_1335 ?auto_1330 ) ( not ( = ?auto_1329 ?auto_1334 ) ) ( not ( = ?auto_1332 ?auto_1329 ) ) ( not ( = ?auto_1332 ?auto_1334 ) ) ( not ( = ?auto_1331 ?auto_1330 ) ) ( CALIBRATION_TARGET ?auto_1335 ?auto_1334 ) ( ON_BOARD ?auto_1333 ?auto_1336 ) ( POWER_ON ?auto_1333 ) ( not ( = ?auto_1335 ?auto_1333 ) ) ( SUPPORTS ?auto_1333 ?auto_1331 ) ( POINTING ?auto_1336 ?auto_1334 ) ( CALIBRATION_TARGET ?auto_1333 ?auto_1334 ) ( NOT_CALIBRATED ?auto_1333 ) )
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
      ?auto_1353 - INSTRUMENT
      ?auto_1354 - SATELLITE
      ?auto_1352 - DIRECTION
      ?auto_1351 - DIRECTION
      ?auto_1350 - MODE
      ?auto_1349 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1353 ?auto_1354 ) ( SUPPORTS ?auto_1353 ?auto_1348 ) ( not ( = ?auto_1347 ?auto_1352 ) ) ( not ( = ?auto_1351 ?auto_1347 ) ) ( not ( = ?auto_1351 ?auto_1352 ) ) ( not ( = ?auto_1350 ?auto_1348 ) ) ( CALIBRATION_TARGET ?auto_1353 ?auto_1352 ) ( ON_BOARD ?auto_1349 ?auto_1354 ) ( not ( = ?auto_1353 ?auto_1349 ) ) ( SUPPORTS ?auto_1349 ?auto_1350 ) ( POINTING ?auto_1354 ?auto_1352 ) ( CALIBRATION_TARGET ?auto_1349 ?auto_1352 ) ( POWER_AVAIL ?auto_1354 ) )
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
    ( and ( ON_BOARD ?auto_1360 ?auto_1362 ) ( SUPPORTS ?auto_1360 ?auto_1357 ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( not ( = ?auto_1355 ?auto_1358 ) ) ( not ( = ?auto_1355 ?auto_1359 ) ) ( not ( = ?auto_1356 ?auto_1357 ) ) ( CALIBRATION_TARGET ?auto_1360 ?auto_1359 ) ( ON_BOARD ?auto_1361 ?auto_1362 ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( SUPPORTS ?auto_1361 ?auto_1356 ) ( POINTING ?auto_1362 ?auto_1359 ) ( CALIBRATION_TARGET ?auto_1361 ?auto_1359 ) ( POWER_AVAIL ?auto_1362 ) )
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
      ?auto_1369 - INSTRUMENT
      ?auto_1367 - SATELLITE
      ?auto_1370 - DIRECTION
      ?auto_1368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1369 ?auto_1367 ) ( SUPPORTS ?auto_1369 ?auto_1364 ) ( not ( = ?auto_1363 ?auto_1370 ) ) ( not ( = ?auto_1366 ?auto_1363 ) ) ( not ( = ?auto_1366 ?auto_1370 ) ) ( not ( = ?auto_1365 ?auto_1364 ) ) ( CALIBRATION_TARGET ?auto_1369 ?auto_1370 ) ( ON_BOARD ?auto_1368 ?auto_1367 ) ( not ( = ?auto_1369 ?auto_1368 ) ) ( SUPPORTS ?auto_1368 ?auto_1365 ) ( POINTING ?auto_1367 ?auto_1370 ) ( CALIBRATION_TARGET ?auto_1368 ?auto_1370 ) ( POWER_AVAIL ?auto_1367 ) )
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
      ?auto_1385 - INSTRUMENT
      ?auto_1383 - SATELLITE
      ?auto_1386 - DIRECTION
      ?auto_1388 - DIRECTION
      ?auto_1387 - MODE
      ?auto_1384 - INSTRUMENT
      ?auto_1389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1385 ?auto_1383 ) ( SUPPORTS ?auto_1385 ?auto_1382 ) ( not ( = ?auto_1381 ?auto_1386 ) ) ( not ( = ?auto_1388 ?auto_1381 ) ) ( not ( = ?auto_1388 ?auto_1386 ) ) ( not ( = ?auto_1387 ?auto_1382 ) ) ( CALIBRATION_TARGET ?auto_1385 ?auto_1386 ) ( ON_BOARD ?auto_1384 ?auto_1383 ) ( not ( = ?auto_1385 ?auto_1384 ) ) ( SUPPORTS ?auto_1384 ?auto_1387 ) ( CALIBRATION_TARGET ?auto_1384 ?auto_1386 ) ( POWER_AVAIL ?auto_1383 ) ( POINTING ?auto_1383 ?auto_1389 ) ( not ( = ?auto_1386 ?auto_1389 ) ) ( not ( = ?auto_1381 ?auto_1389 ) ) ( not ( = ?auto_1388 ?auto_1389 ) ) )
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
      ?auto_1396 - INSTRUMENT
      ?auto_1398 - SATELLITE
      ?auto_1394 - DIRECTION
      ?auto_1395 - INSTRUMENT
      ?auto_1397 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1396 ?auto_1398 ) ( SUPPORTS ?auto_1396 ?auto_1392 ) ( not ( = ?auto_1393 ?auto_1394 ) ) ( not ( = ?auto_1390 ?auto_1393 ) ) ( not ( = ?auto_1390 ?auto_1394 ) ) ( not ( = ?auto_1391 ?auto_1392 ) ) ( CALIBRATION_TARGET ?auto_1396 ?auto_1394 ) ( ON_BOARD ?auto_1395 ?auto_1398 ) ( not ( = ?auto_1396 ?auto_1395 ) ) ( SUPPORTS ?auto_1395 ?auto_1391 ) ( CALIBRATION_TARGET ?auto_1395 ?auto_1394 ) ( POWER_AVAIL ?auto_1398 ) ( POINTING ?auto_1398 ?auto_1397 ) ( not ( = ?auto_1394 ?auto_1397 ) ) ( not ( = ?auto_1393 ?auto_1397 ) ) ( not ( = ?auto_1390 ?auto_1397 ) ) )
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
    ( and ( ON_BOARD ?auto_1403 ?auto_1406 ) ( SUPPORTS ?auto_1403 ?auto_1400 ) ( not ( = ?auto_1399 ?auto_1404 ) ) ( not ( = ?auto_1402 ?auto_1399 ) ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( not ( = ?auto_1401 ?auto_1400 ) ) ( CALIBRATION_TARGET ?auto_1403 ?auto_1404 ) ( ON_BOARD ?auto_1407 ?auto_1406 ) ( not ( = ?auto_1403 ?auto_1407 ) ) ( SUPPORTS ?auto_1407 ?auto_1401 ) ( CALIBRATION_TARGET ?auto_1407 ?auto_1404 ) ( POWER_AVAIL ?auto_1406 ) ( POINTING ?auto_1406 ?auto_1405 ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( not ( = ?auto_1399 ?auto_1405 ) ) ( not ( = ?auto_1402 ?auto_1405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1402 ?auto_1401 ?auto_1399 ?auto_1400 )
      ( GET-2IMAGE-VERIFY ?auto_1399 ?auto_1400 ?auto_1402 ?auto_1401 ) )
  )

)

