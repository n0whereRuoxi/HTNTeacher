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
      ?auto_1064 - SURFACE
      ?auto_1065 - SURFACE
    )
    :vars
    (
      ?auto_1066 - HOIST
      ?auto_1067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1066 ?auto_1067 ) ( SURFACE-AT ?auto_1065 ?auto_1067 ) ( CLEAR ?auto_1065 ) ( LIFTING ?auto_1066 ?auto_1064 ) ( IS-CRATE ?auto_1064 ) ( not ( = ?auto_1064 ?auto_1065 ) ) )
    :subtasks
    ( ( !DROP ?auto_1066 ?auto_1064 ?auto_1065 ?auto_1067 )
      ( MAKE-ON-VERIFY ?auto_1064 ?auto_1065 ) )
  )

  ( :method MAKE-ON
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
    ( and ( HOIST-AT ?auto_1070 ?auto_1071 ) ( SURFACE-AT ?auto_1069 ?auto_1071 ) ( CLEAR ?auto_1069 ) ( IS-CRATE ?auto_1068 ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( TRUCK-AT ?auto_1072 ?auto_1071 ) ( AVAILABLE ?auto_1070 ) ( IN ?auto_1068 ?auto_1072 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1070 ?auto_1068 ?auto_1072 ?auto_1071 )
      ( MAKE-ON ?auto_1068 ?auto_1069 )
      ( MAKE-ON-VERIFY ?auto_1068 ?auto_1069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1073 - SURFACE
      ?auto_1074 - SURFACE
    )
    :vars
    (
      ?auto_1077 - HOIST
      ?auto_1076 - PLACE
      ?auto_1075 - TRUCK
      ?auto_1078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1077 ?auto_1076 ) ( SURFACE-AT ?auto_1074 ?auto_1076 ) ( CLEAR ?auto_1074 ) ( IS-CRATE ?auto_1073 ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( AVAILABLE ?auto_1077 ) ( IN ?auto_1073 ?auto_1075 ) ( TRUCK-AT ?auto_1075 ?auto_1078 ) ( not ( = ?auto_1078 ?auto_1076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1075 ?auto_1078 ?auto_1076 )
      ( MAKE-ON ?auto_1073 ?auto_1074 )
      ( MAKE-ON-VERIFY ?auto_1073 ?auto_1074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1079 - SURFACE
      ?auto_1080 - SURFACE
    )
    :vars
    (
      ?auto_1081 - HOIST
      ?auto_1082 - PLACE
      ?auto_1084 - TRUCK
      ?auto_1083 - PLACE
      ?auto_1085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081 ?auto_1082 ) ( SURFACE-AT ?auto_1080 ?auto_1082 ) ( CLEAR ?auto_1080 ) ( IS-CRATE ?auto_1079 ) ( not ( = ?auto_1079 ?auto_1080 ) ) ( AVAILABLE ?auto_1081 ) ( TRUCK-AT ?auto_1084 ?auto_1083 ) ( not ( = ?auto_1083 ?auto_1082 ) ) ( HOIST-AT ?auto_1085 ?auto_1083 ) ( LIFTING ?auto_1085 ?auto_1079 ) ( not ( = ?auto_1081 ?auto_1085 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1085 ?auto_1079 ?auto_1084 ?auto_1083 )
      ( MAKE-ON ?auto_1079 ?auto_1080 )
      ( MAKE-ON-VERIFY ?auto_1079 ?auto_1080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1086 - SURFACE
      ?auto_1087 - SURFACE
    )
    :vars
    (
      ?auto_1090 - HOIST
      ?auto_1088 - PLACE
      ?auto_1089 - TRUCK
      ?auto_1092 - PLACE
      ?auto_1091 - HOIST
      ?auto_1093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1090 ?auto_1088 ) ( SURFACE-AT ?auto_1087 ?auto_1088 ) ( CLEAR ?auto_1087 ) ( IS-CRATE ?auto_1086 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( AVAILABLE ?auto_1090 ) ( TRUCK-AT ?auto_1089 ?auto_1092 ) ( not ( = ?auto_1092 ?auto_1088 ) ) ( HOIST-AT ?auto_1091 ?auto_1092 ) ( not ( = ?auto_1090 ?auto_1091 ) ) ( AVAILABLE ?auto_1091 ) ( SURFACE-AT ?auto_1086 ?auto_1092 ) ( ON ?auto_1086 ?auto_1093 ) ( CLEAR ?auto_1086 ) ( not ( = ?auto_1086 ?auto_1093 ) ) ( not ( = ?auto_1087 ?auto_1093 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1091 ?auto_1086 ?auto_1093 ?auto_1092 )
      ( MAKE-ON ?auto_1086 ?auto_1087 )
      ( MAKE-ON-VERIFY ?auto_1086 ?auto_1087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1094 - SURFACE
      ?auto_1095 - SURFACE
    )
    :vars
    (
      ?auto_1098 - HOIST
      ?auto_1101 - PLACE
      ?auto_1097 - PLACE
      ?auto_1096 - HOIST
      ?auto_1099 - SURFACE
      ?auto_1100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1098 ?auto_1101 ) ( SURFACE-AT ?auto_1095 ?auto_1101 ) ( CLEAR ?auto_1095 ) ( IS-CRATE ?auto_1094 ) ( not ( = ?auto_1094 ?auto_1095 ) ) ( AVAILABLE ?auto_1098 ) ( not ( = ?auto_1097 ?auto_1101 ) ) ( HOIST-AT ?auto_1096 ?auto_1097 ) ( not ( = ?auto_1098 ?auto_1096 ) ) ( AVAILABLE ?auto_1096 ) ( SURFACE-AT ?auto_1094 ?auto_1097 ) ( ON ?auto_1094 ?auto_1099 ) ( CLEAR ?auto_1094 ) ( not ( = ?auto_1094 ?auto_1099 ) ) ( not ( = ?auto_1095 ?auto_1099 ) ) ( TRUCK-AT ?auto_1100 ?auto_1101 ) )
    :subtasks
    ( ( !DRIVE ?auto_1100 ?auto_1101 ?auto_1097 )
      ( MAKE-ON ?auto_1094 ?auto_1095 )
      ( MAKE-ON-VERIFY ?auto_1094 ?auto_1095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1142 - SURFACE
      ?auto_1143 - SURFACE
    )
    :vars
    (
      ?auto_1149 - HOIST
      ?auto_1147 - PLACE
      ?auto_1148 - PLACE
      ?auto_1144 - HOIST
      ?auto_1145 - SURFACE
      ?auto_1146 - TRUCK
      ?auto_1150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1149 ?auto_1147 ) ( IS-CRATE ?auto_1142 ) ( not ( = ?auto_1142 ?auto_1143 ) ) ( not ( = ?auto_1148 ?auto_1147 ) ) ( HOIST-AT ?auto_1144 ?auto_1148 ) ( not ( = ?auto_1149 ?auto_1144 ) ) ( AVAILABLE ?auto_1144 ) ( SURFACE-AT ?auto_1142 ?auto_1148 ) ( ON ?auto_1142 ?auto_1145 ) ( CLEAR ?auto_1142 ) ( not ( = ?auto_1142 ?auto_1145 ) ) ( not ( = ?auto_1143 ?auto_1145 ) ) ( TRUCK-AT ?auto_1146 ?auto_1147 ) ( SURFACE-AT ?auto_1150 ?auto_1147 ) ( CLEAR ?auto_1150 ) ( LIFTING ?auto_1149 ?auto_1143 ) ( IS-CRATE ?auto_1143 ) ( not ( = ?auto_1142 ?auto_1150 ) ) ( not ( = ?auto_1143 ?auto_1150 ) ) ( not ( = ?auto_1145 ?auto_1150 ) ) )
    :subtasks
    ( ( !DROP ?auto_1149 ?auto_1143 ?auto_1150 ?auto_1147 )
      ( MAKE-ON ?auto_1142 ?auto_1143 )
      ( MAKE-ON-VERIFY ?auto_1142 ?auto_1143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1151 - SURFACE
      ?auto_1152 - SURFACE
    )
    :vars
    (
      ?auto_1157 - HOIST
      ?auto_1156 - PLACE
      ?auto_1154 - PLACE
      ?auto_1158 - HOIST
      ?auto_1155 - SURFACE
      ?auto_1159 - TRUCK
      ?auto_1153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1157 ?auto_1156 ) ( IS-CRATE ?auto_1151 ) ( not ( = ?auto_1151 ?auto_1152 ) ) ( not ( = ?auto_1154 ?auto_1156 ) ) ( HOIST-AT ?auto_1158 ?auto_1154 ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( AVAILABLE ?auto_1158 ) ( SURFACE-AT ?auto_1151 ?auto_1154 ) ( ON ?auto_1151 ?auto_1155 ) ( CLEAR ?auto_1151 ) ( not ( = ?auto_1151 ?auto_1155 ) ) ( not ( = ?auto_1152 ?auto_1155 ) ) ( TRUCK-AT ?auto_1159 ?auto_1156 ) ( SURFACE-AT ?auto_1153 ?auto_1156 ) ( CLEAR ?auto_1153 ) ( IS-CRATE ?auto_1152 ) ( not ( = ?auto_1151 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1153 ) ) ( not ( = ?auto_1155 ?auto_1153 ) ) ( AVAILABLE ?auto_1157 ) ( IN ?auto_1152 ?auto_1159 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1157 ?auto_1152 ?auto_1159 ?auto_1156 )
      ( MAKE-ON ?auto_1151 ?auto_1152 )
      ( MAKE-ON-VERIFY ?auto_1151 ?auto_1152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1160 - SURFACE
      ?auto_1161 - SURFACE
    )
    :vars
    (
      ?auto_1162 - HOIST
      ?auto_1166 - PLACE
      ?auto_1165 - PLACE
      ?auto_1168 - HOIST
      ?auto_1164 - SURFACE
      ?auto_1167 - SURFACE
      ?auto_1163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1162 ?auto_1166 ) ( IS-CRATE ?auto_1160 ) ( not ( = ?auto_1160 ?auto_1161 ) ) ( not ( = ?auto_1165 ?auto_1166 ) ) ( HOIST-AT ?auto_1168 ?auto_1165 ) ( not ( = ?auto_1162 ?auto_1168 ) ) ( AVAILABLE ?auto_1168 ) ( SURFACE-AT ?auto_1160 ?auto_1165 ) ( ON ?auto_1160 ?auto_1164 ) ( CLEAR ?auto_1160 ) ( not ( = ?auto_1160 ?auto_1164 ) ) ( not ( = ?auto_1161 ?auto_1164 ) ) ( SURFACE-AT ?auto_1167 ?auto_1166 ) ( CLEAR ?auto_1167 ) ( IS-CRATE ?auto_1161 ) ( not ( = ?auto_1160 ?auto_1167 ) ) ( not ( = ?auto_1161 ?auto_1167 ) ) ( not ( = ?auto_1164 ?auto_1167 ) ) ( AVAILABLE ?auto_1162 ) ( IN ?auto_1161 ?auto_1163 ) ( TRUCK-AT ?auto_1163 ?auto_1165 ) )
    :subtasks
    ( ( !DRIVE ?auto_1163 ?auto_1165 ?auto_1166 )
      ( MAKE-ON ?auto_1160 ?auto_1161 )
      ( MAKE-ON-VERIFY ?auto_1160 ?auto_1161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1169 - SURFACE
      ?auto_1170 - SURFACE
    )
    :vars
    (
      ?auto_1171 - HOIST
      ?auto_1172 - PLACE
      ?auto_1175 - PLACE
      ?auto_1173 - HOIST
      ?auto_1177 - SURFACE
      ?auto_1176 - SURFACE
      ?auto_1174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1171 ?auto_1172 ) ( IS-CRATE ?auto_1169 ) ( not ( = ?auto_1169 ?auto_1170 ) ) ( not ( = ?auto_1175 ?auto_1172 ) ) ( HOIST-AT ?auto_1173 ?auto_1175 ) ( not ( = ?auto_1171 ?auto_1173 ) ) ( SURFACE-AT ?auto_1169 ?auto_1175 ) ( ON ?auto_1169 ?auto_1177 ) ( CLEAR ?auto_1169 ) ( not ( = ?auto_1169 ?auto_1177 ) ) ( not ( = ?auto_1170 ?auto_1177 ) ) ( SURFACE-AT ?auto_1176 ?auto_1172 ) ( CLEAR ?auto_1176 ) ( IS-CRATE ?auto_1170 ) ( not ( = ?auto_1169 ?auto_1176 ) ) ( not ( = ?auto_1170 ?auto_1176 ) ) ( not ( = ?auto_1177 ?auto_1176 ) ) ( AVAILABLE ?auto_1171 ) ( TRUCK-AT ?auto_1174 ?auto_1175 ) ( LIFTING ?auto_1173 ?auto_1170 ) )
    :subtasks
    ( ( !LOAD ?auto_1173 ?auto_1170 ?auto_1174 ?auto_1175 )
      ( MAKE-ON ?auto_1169 ?auto_1170 )
      ( MAKE-ON-VERIFY ?auto_1169 ?auto_1170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1178 - SURFACE
      ?auto_1179 - SURFACE
    )
    :vars
    (
      ?auto_1185 - HOIST
      ?auto_1186 - PLACE
      ?auto_1184 - PLACE
      ?auto_1182 - HOIST
      ?auto_1181 - SURFACE
      ?auto_1180 - SURFACE
      ?auto_1183 - TRUCK
      ?auto_1187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1185 ?auto_1186 ) ( IS-CRATE ?auto_1178 ) ( not ( = ?auto_1178 ?auto_1179 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( HOIST-AT ?auto_1182 ?auto_1184 ) ( not ( = ?auto_1185 ?auto_1182 ) ) ( SURFACE-AT ?auto_1178 ?auto_1184 ) ( ON ?auto_1178 ?auto_1181 ) ( CLEAR ?auto_1178 ) ( not ( = ?auto_1178 ?auto_1181 ) ) ( not ( = ?auto_1179 ?auto_1181 ) ) ( SURFACE-AT ?auto_1180 ?auto_1186 ) ( CLEAR ?auto_1180 ) ( IS-CRATE ?auto_1179 ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1180 ) ) ( not ( = ?auto_1181 ?auto_1180 ) ) ( AVAILABLE ?auto_1185 ) ( TRUCK-AT ?auto_1183 ?auto_1184 ) ( AVAILABLE ?auto_1182 ) ( SURFACE-AT ?auto_1179 ?auto_1184 ) ( ON ?auto_1179 ?auto_1187 ) ( CLEAR ?auto_1179 ) ( not ( = ?auto_1178 ?auto_1187 ) ) ( not ( = ?auto_1179 ?auto_1187 ) ) ( not ( = ?auto_1181 ?auto_1187 ) ) ( not ( = ?auto_1180 ?auto_1187 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1182 ?auto_1179 ?auto_1187 ?auto_1184 )
      ( MAKE-ON ?auto_1178 ?auto_1179 )
      ( MAKE-ON-VERIFY ?auto_1178 ?auto_1179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1188 - SURFACE
      ?auto_1189 - SURFACE
    )
    :vars
    (
      ?auto_1197 - HOIST
      ?auto_1191 - PLACE
      ?auto_1196 - PLACE
      ?auto_1190 - HOIST
      ?auto_1193 - SURFACE
      ?auto_1192 - SURFACE
      ?auto_1195 - SURFACE
      ?auto_1194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1197 ?auto_1191 ) ( IS-CRATE ?auto_1188 ) ( not ( = ?auto_1188 ?auto_1189 ) ) ( not ( = ?auto_1196 ?auto_1191 ) ) ( HOIST-AT ?auto_1190 ?auto_1196 ) ( not ( = ?auto_1197 ?auto_1190 ) ) ( SURFACE-AT ?auto_1188 ?auto_1196 ) ( ON ?auto_1188 ?auto_1193 ) ( CLEAR ?auto_1188 ) ( not ( = ?auto_1188 ?auto_1193 ) ) ( not ( = ?auto_1189 ?auto_1193 ) ) ( SURFACE-AT ?auto_1192 ?auto_1191 ) ( CLEAR ?auto_1192 ) ( IS-CRATE ?auto_1189 ) ( not ( = ?auto_1188 ?auto_1192 ) ) ( not ( = ?auto_1189 ?auto_1192 ) ) ( not ( = ?auto_1193 ?auto_1192 ) ) ( AVAILABLE ?auto_1197 ) ( AVAILABLE ?auto_1190 ) ( SURFACE-AT ?auto_1189 ?auto_1196 ) ( ON ?auto_1189 ?auto_1195 ) ( CLEAR ?auto_1189 ) ( not ( = ?auto_1188 ?auto_1195 ) ) ( not ( = ?auto_1189 ?auto_1195 ) ) ( not ( = ?auto_1193 ?auto_1195 ) ) ( not ( = ?auto_1192 ?auto_1195 ) ) ( TRUCK-AT ?auto_1194 ?auto_1191 ) )
    :subtasks
    ( ( !DRIVE ?auto_1194 ?auto_1191 ?auto_1196 )
      ( MAKE-ON ?auto_1188 ?auto_1189 )
      ( MAKE-ON-VERIFY ?auto_1188 ?auto_1189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1262 - SURFACE
      ?auto_1263 - SURFACE
    )
    :vars
    (
      ?auto_1265 - HOIST
      ?auto_1267 - PLACE
      ?auto_1266 - PLACE
      ?auto_1269 - HOIST
      ?auto_1264 - SURFACE
      ?auto_1268 - TRUCK
      ?auto_1270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265 ?auto_1267 ) ( SURFACE-AT ?auto_1263 ?auto_1267 ) ( CLEAR ?auto_1263 ) ( IS-CRATE ?auto_1262 ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( AVAILABLE ?auto_1265 ) ( not ( = ?auto_1266 ?auto_1267 ) ) ( HOIST-AT ?auto_1269 ?auto_1266 ) ( not ( = ?auto_1265 ?auto_1269 ) ) ( AVAILABLE ?auto_1269 ) ( SURFACE-AT ?auto_1262 ?auto_1266 ) ( ON ?auto_1262 ?auto_1264 ) ( CLEAR ?auto_1262 ) ( not ( = ?auto_1262 ?auto_1264 ) ) ( not ( = ?auto_1263 ?auto_1264 ) ) ( TRUCK-AT ?auto_1268 ?auto_1270 ) ( not ( = ?auto_1270 ?auto_1267 ) ) ( not ( = ?auto_1266 ?auto_1270 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1268 ?auto_1270 ?auto_1267 )
      ( MAKE-ON ?auto_1262 ?auto_1263 )
      ( MAKE-ON-VERIFY ?auto_1262 ?auto_1263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1277 - SURFACE
      ?auto_1278 - SURFACE
    )
    :vars
    (
      ?auto_1283 - HOIST
      ?auto_1284 - PLACE
      ?auto_1282 - PLACE
      ?auto_1279 - HOIST
      ?auto_1280 - SURFACE
      ?auto_1281 - TRUCK
      ?auto_1285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1283 ?auto_1284 ) ( SURFACE-AT ?auto_1278 ?auto_1284 ) ( CLEAR ?auto_1278 ) ( IS-CRATE ?auto_1277 ) ( not ( = ?auto_1277 ?auto_1278 ) ) ( not ( = ?auto_1282 ?auto_1284 ) ) ( HOIST-AT ?auto_1279 ?auto_1282 ) ( not ( = ?auto_1283 ?auto_1279 ) ) ( AVAILABLE ?auto_1279 ) ( SURFACE-AT ?auto_1277 ?auto_1282 ) ( ON ?auto_1277 ?auto_1280 ) ( CLEAR ?auto_1277 ) ( not ( = ?auto_1277 ?auto_1280 ) ) ( not ( = ?auto_1278 ?auto_1280 ) ) ( TRUCK-AT ?auto_1281 ?auto_1284 ) ( LIFTING ?auto_1283 ?auto_1285 ) ( IS-CRATE ?auto_1285 ) ( not ( = ?auto_1277 ?auto_1285 ) ) ( not ( = ?auto_1278 ?auto_1285 ) ) ( not ( = ?auto_1280 ?auto_1285 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1283 ?auto_1285 ?auto_1281 ?auto_1284 )
      ( MAKE-ON ?auto_1277 ?auto_1278 )
      ( MAKE-ON-VERIFY ?auto_1277 ?auto_1278 ) )
  )

)

