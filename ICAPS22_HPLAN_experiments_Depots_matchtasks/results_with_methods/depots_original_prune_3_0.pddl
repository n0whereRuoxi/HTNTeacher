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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1160 - SURFACE
      ?auto_1161 - SURFACE
    )
    :vars
    (
      ?auto_1162 - HOIST
      ?auto_1163 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1162 ?auto_1163 ) ( SURFACE-AT ?auto_1160 ?auto_1163 ) ( CLEAR ?auto_1160 ) ( LIFTING ?auto_1162 ?auto_1161 ) ( IS-CRATE ?auto_1161 ) ( not ( = ?auto_1160 ?auto_1161 ) ) )
    :subtasks
    ( ( !DROP ?auto_1162 ?auto_1161 ?auto_1160 ?auto_1163 )
      ( MAKE-1CRATE-VERIFY ?auto_1160 ?auto_1161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1164 - SURFACE
      ?auto_1165 - SURFACE
    )
    :vars
    (
      ?auto_1166 - HOIST
      ?auto_1167 - PLACE
      ?auto_1168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1166 ?auto_1167 ) ( SURFACE-AT ?auto_1164 ?auto_1167 ) ( CLEAR ?auto_1164 ) ( IS-CRATE ?auto_1165 ) ( not ( = ?auto_1164 ?auto_1165 ) ) ( TRUCK-AT ?auto_1168 ?auto_1167 ) ( AVAILABLE ?auto_1166 ) ( IN ?auto_1165 ?auto_1168 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1166 ?auto_1165 ?auto_1168 ?auto_1167 )
      ( MAKE-1CRATE ?auto_1164 ?auto_1165 )
      ( MAKE-1CRATE-VERIFY ?auto_1164 ?auto_1165 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1169 - SURFACE
      ?auto_1170 - SURFACE
    )
    :vars
    (
      ?auto_1171 - HOIST
      ?auto_1173 - PLACE
      ?auto_1172 - TRUCK
      ?auto_1174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1171 ?auto_1173 ) ( SURFACE-AT ?auto_1169 ?auto_1173 ) ( CLEAR ?auto_1169 ) ( IS-CRATE ?auto_1170 ) ( not ( = ?auto_1169 ?auto_1170 ) ) ( AVAILABLE ?auto_1171 ) ( IN ?auto_1170 ?auto_1172 ) ( TRUCK-AT ?auto_1172 ?auto_1174 ) ( not ( = ?auto_1174 ?auto_1173 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1172 ?auto_1174 ?auto_1173 )
      ( MAKE-1CRATE ?auto_1169 ?auto_1170 )
      ( MAKE-1CRATE-VERIFY ?auto_1169 ?auto_1170 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1175 - SURFACE
      ?auto_1176 - SURFACE
    )
    :vars
    (
      ?auto_1180 - HOIST
      ?auto_1177 - PLACE
      ?auto_1179 - TRUCK
      ?auto_1178 - PLACE
      ?auto_1181 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180 ?auto_1177 ) ( SURFACE-AT ?auto_1175 ?auto_1177 ) ( CLEAR ?auto_1175 ) ( IS-CRATE ?auto_1176 ) ( not ( = ?auto_1175 ?auto_1176 ) ) ( AVAILABLE ?auto_1180 ) ( TRUCK-AT ?auto_1179 ?auto_1178 ) ( not ( = ?auto_1178 ?auto_1177 ) ) ( HOIST-AT ?auto_1181 ?auto_1178 ) ( LIFTING ?auto_1181 ?auto_1176 ) ( not ( = ?auto_1180 ?auto_1181 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1181 ?auto_1176 ?auto_1179 ?auto_1178 )
      ( MAKE-1CRATE ?auto_1175 ?auto_1176 )
      ( MAKE-1CRATE-VERIFY ?auto_1175 ?auto_1176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1182 - SURFACE
      ?auto_1183 - SURFACE
    )
    :vars
    (
      ?auto_1186 - HOIST
      ?auto_1184 - PLACE
      ?auto_1187 - TRUCK
      ?auto_1185 - PLACE
      ?auto_1188 - HOIST
      ?auto_1189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1186 ?auto_1184 ) ( SURFACE-AT ?auto_1182 ?auto_1184 ) ( CLEAR ?auto_1182 ) ( IS-CRATE ?auto_1183 ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( AVAILABLE ?auto_1186 ) ( TRUCK-AT ?auto_1187 ?auto_1185 ) ( not ( = ?auto_1185 ?auto_1184 ) ) ( HOIST-AT ?auto_1188 ?auto_1185 ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( AVAILABLE ?auto_1188 ) ( SURFACE-AT ?auto_1183 ?auto_1185 ) ( ON ?auto_1183 ?auto_1189 ) ( CLEAR ?auto_1183 ) ( not ( = ?auto_1182 ?auto_1189 ) ) ( not ( = ?auto_1183 ?auto_1189 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1188 ?auto_1183 ?auto_1189 ?auto_1185 )
      ( MAKE-1CRATE ?auto_1182 ?auto_1183 )
      ( MAKE-1CRATE-VERIFY ?auto_1182 ?auto_1183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1190 - SURFACE
      ?auto_1191 - SURFACE
    )
    :vars
    (
      ?auto_1197 - HOIST
      ?auto_1195 - PLACE
      ?auto_1196 - PLACE
      ?auto_1194 - HOIST
      ?auto_1192 - SURFACE
      ?auto_1193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1197 ?auto_1195 ) ( SURFACE-AT ?auto_1190 ?auto_1195 ) ( CLEAR ?auto_1190 ) ( IS-CRATE ?auto_1191 ) ( not ( = ?auto_1190 ?auto_1191 ) ) ( AVAILABLE ?auto_1197 ) ( not ( = ?auto_1196 ?auto_1195 ) ) ( HOIST-AT ?auto_1194 ?auto_1196 ) ( not ( = ?auto_1197 ?auto_1194 ) ) ( AVAILABLE ?auto_1194 ) ( SURFACE-AT ?auto_1191 ?auto_1196 ) ( ON ?auto_1191 ?auto_1192 ) ( CLEAR ?auto_1191 ) ( not ( = ?auto_1190 ?auto_1192 ) ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( TRUCK-AT ?auto_1193 ?auto_1195 ) )
    :subtasks
    ( ( !DRIVE ?auto_1193 ?auto_1195 ?auto_1196 )
      ( MAKE-1CRATE ?auto_1190 ?auto_1191 )
      ( MAKE-1CRATE-VERIFY ?auto_1190 ?auto_1191 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1207 - SURFACE
      ?auto_1208 - SURFACE
      ?auto_1209 - SURFACE
    )
    :vars
    (
      ?auto_1211 - HOIST
      ?auto_1210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1211 ?auto_1210 ) ( SURFACE-AT ?auto_1208 ?auto_1210 ) ( CLEAR ?auto_1208 ) ( LIFTING ?auto_1211 ?auto_1209 ) ( IS-CRATE ?auto_1209 ) ( not ( = ?auto_1208 ?auto_1209 ) ) ( ON ?auto_1208 ?auto_1207 ) ( not ( = ?auto_1207 ?auto_1208 ) ) ( not ( = ?auto_1207 ?auto_1209 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1208 ?auto_1209 )
      ( MAKE-2CRATE-VERIFY ?auto_1207 ?auto_1208 ?auto_1209 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1217 - SURFACE
      ?auto_1218 - SURFACE
      ?auto_1219 - SURFACE
    )
    :vars
    (
      ?auto_1222 - HOIST
      ?auto_1220 - PLACE
      ?auto_1221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1222 ?auto_1220 ) ( SURFACE-AT ?auto_1218 ?auto_1220 ) ( CLEAR ?auto_1218 ) ( IS-CRATE ?auto_1219 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( TRUCK-AT ?auto_1221 ?auto_1220 ) ( AVAILABLE ?auto_1222 ) ( IN ?auto_1219 ?auto_1221 ) ( ON ?auto_1218 ?auto_1217 ) ( not ( = ?auto_1217 ?auto_1218 ) ) ( not ( = ?auto_1217 ?auto_1219 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1218 ?auto_1219 )
      ( MAKE-2CRATE-VERIFY ?auto_1217 ?auto_1218 ?auto_1219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1223 - SURFACE
      ?auto_1224 - SURFACE
    )
    :vars
    (
      ?auto_1228 - HOIST
      ?auto_1225 - PLACE
      ?auto_1226 - TRUCK
      ?auto_1227 - SURFACE
      ?auto_1229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1228 ?auto_1225 ) ( SURFACE-AT ?auto_1223 ?auto_1225 ) ( CLEAR ?auto_1223 ) ( IS-CRATE ?auto_1224 ) ( not ( = ?auto_1223 ?auto_1224 ) ) ( AVAILABLE ?auto_1228 ) ( IN ?auto_1224 ?auto_1226 ) ( ON ?auto_1223 ?auto_1227 ) ( not ( = ?auto_1227 ?auto_1223 ) ) ( not ( = ?auto_1227 ?auto_1224 ) ) ( TRUCK-AT ?auto_1226 ?auto_1229 ) ( not ( = ?auto_1229 ?auto_1225 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1226 ?auto_1229 ?auto_1225 )
      ( MAKE-2CRATE ?auto_1227 ?auto_1223 ?auto_1224 )
      ( MAKE-1CRATE-VERIFY ?auto_1223 ?auto_1224 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1230 - SURFACE
      ?auto_1231 - SURFACE
      ?auto_1232 - SURFACE
    )
    :vars
    (
      ?auto_1234 - HOIST
      ?auto_1235 - PLACE
      ?auto_1233 - TRUCK
      ?auto_1236 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1234 ?auto_1235 ) ( SURFACE-AT ?auto_1231 ?auto_1235 ) ( CLEAR ?auto_1231 ) ( IS-CRATE ?auto_1232 ) ( not ( = ?auto_1231 ?auto_1232 ) ) ( AVAILABLE ?auto_1234 ) ( IN ?auto_1232 ?auto_1233 ) ( ON ?auto_1231 ?auto_1230 ) ( not ( = ?auto_1230 ?auto_1231 ) ) ( not ( = ?auto_1230 ?auto_1232 ) ) ( TRUCK-AT ?auto_1233 ?auto_1236 ) ( not ( = ?auto_1236 ?auto_1235 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1231 ?auto_1232 )
      ( MAKE-2CRATE-VERIFY ?auto_1230 ?auto_1231 ?auto_1232 ) )
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
      ?auto_1242 - SURFACE
      ?auto_1239 - TRUCK
      ?auto_1241 - PLACE
      ?auto_1244 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1243 ?auto_1240 ) ( SURFACE-AT ?auto_1237 ?auto_1240 ) ( CLEAR ?auto_1237 ) ( IS-CRATE ?auto_1238 ) ( not ( = ?auto_1237 ?auto_1238 ) ) ( AVAILABLE ?auto_1243 ) ( ON ?auto_1237 ?auto_1242 ) ( not ( = ?auto_1242 ?auto_1237 ) ) ( not ( = ?auto_1242 ?auto_1238 ) ) ( TRUCK-AT ?auto_1239 ?auto_1241 ) ( not ( = ?auto_1241 ?auto_1240 ) ) ( HOIST-AT ?auto_1244 ?auto_1241 ) ( LIFTING ?auto_1244 ?auto_1238 ) ( not ( = ?auto_1243 ?auto_1244 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1244 ?auto_1238 ?auto_1239 ?auto_1241 )
      ( MAKE-2CRATE ?auto_1242 ?auto_1237 ?auto_1238 )
      ( MAKE-1CRATE-VERIFY ?auto_1237 ?auto_1238 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1245 - SURFACE
      ?auto_1246 - SURFACE
      ?auto_1247 - SURFACE
    )
    :vars
    (
      ?auto_1248 - HOIST
      ?auto_1252 - PLACE
      ?auto_1250 - TRUCK
      ?auto_1249 - PLACE
      ?auto_1251 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1248 ?auto_1252 ) ( SURFACE-AT ?auto_1246 ?auto_1252 ) ( CLEAR ?auto_1246 ) ( IS-CRATE ?auto_1247 ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( AVAILABLE ?auto_1248 ) ( ON ?auto_1246 ?auto_1245 ) ( not ( = ?auto_1245 ?auto_1246 ) ) ( not ( = ?auto_1245 ?auto_1247 ) ) ( TRUCK-AT ?auto_1250 ?auto_1249 ) ( not ( = ?auto_1249 ?auto_1252 ) ) ( HOIST-AT ?auto_1251 ?auto_1249 ) ( LIFTING ?auto_1251 ?auto_1247 ) ( not ( = ?auto_1248 ?auto_1251 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1246 ?auto_1247 )
      ( MAKE-2CRATE-VERIFY ?auto_1245 ?auto_1246 ?auto_1247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1253 - SURFACE
      ?auto_1254 - SURFACE
    )
    :vars
    (
      ?auto_1259 - HOIST
      ?auto_1260 - PLACE
      ?auto_1258 - SURFACE
      ?auto_1256 - TRUCK
      ?auto_1257 - PLACE
      ?auto_1255 - HOIST
      ?auto_1261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259 ?auto_1260 ) ( SURFACE-AT ?auto_1253 ?auto_1260 ) ( CLEAR ?auto_1253 ) ( IS-CRATE ?auto_1254 ) ( not ( = ?auto_1253 ?auto_1254 ) ) ( AVAILABLE ?auto_1259 ) ( ON ?auto_1253 ?auto_1258 ) ( not ( = ?auto_1258 ?auto_1253 ) ) ( not ( = ?auto_1258 ?auto_1254 ) ) ( TRUCK-AT ?auto_1256 ?auto_1257 ) ( not ( = ?auto_1257 ?auto_1260 ) ) ( HOIST-AT ?auto_1255 ?auto_1257 ) ( not ( = ?auto_1259 ?auto_1255 ) ) ( AVAILABLE ?auto_1255 ) ( SURFACE-AT ?auto_1254 ?auto_1257 ) ( ON ?auto_1254 ?auto_1261 ) ( CLEAR ?auto_1254 ) ( not ( = ?auto_1253 ?auto_1261 ) ) ( not ( = ?auto_1254 ?auto_1261 ) ) ( not ( = ?auto_1258 ?auto_1261 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1255 ?auto_1254 ?auto_1261 ?auto_1257 )
      ( MAKE-2CRATE ?auto_1258 ?auto_1253 ?auto_1254 )
      ( MAKE-1CRATE-VERIFY ?auto_1253 ?auto_1254 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1262 - SURFACE
      ?auto_1263 - SURFACE
      ?auto_1264 - SURFACE
    )
    :vars
    (
      ?auto_1265 - HOIST
      ?auto_1266 - PLACE
      ?auto_1269 - TRUCK
      ?auto_1267 - PLACE
      ?auto_1270 - HOIST
      ?auto_1268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265 ?auto_1266 ) ( SURFACE-AT ?auto_1263 ?auto_1266 ) ( CLEAR ?auto_1263 ) ( IS-CRATE ?auto_1264 ) ( not ( = ?auto_1263 ?auto_1264 ) ) ( AVAILABLE ?auto_1265 ) ( ON ?auto_1263 ?auto_1262 ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( not ( = ?auto_1262 ?auto_1264 ) ) ( TRUCK-AT ?auto_1269 ?auto_1267 ) ( not ( = ?auto_1267 ?auto_1266 ) ) ( HOIST-AT ?auto_1270 ?auto_1267 ) ( not ( = ?auto_1265 ?auto_1270 ) ) ( AVAILABLE ?auto_1270 ) ( SURFACE-AT ?auto_1264 ?auto_1267 ) ( ON ?auto_1264 ?auto_1268 ) ( CLEAR ?auto_1264 ) ( not ( = ?auto_1263 ?auto_1268 ) ) ( not ( = ?auto_1264 ?auto_1268 ) ) ( not ( = ?auto_1262 ?auto_1268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1263 ?auto_1264 )
      ( MAKE-2CRATE-VERIFY ?auto_1262 ?auto_1263 ?auto_1264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1271 - SURFACE
      ?auto_1272 - SURFACE
    )
    :vars
    (
      ?auto_1277 - HOIST
      ?auto_1273 - PLACE
      ?auto_1278 - SURFACE
      ?auto_1275 - PLACE
      ?auto_1274 - HOIST
      ?auto_1279 - SURFACE
      ?auto_1276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1277 ?auto_1273 ) ( SURFACE-AT ?auto_1271 ?auto_1273 ) ( CLEAR ?auto_1271 ) ( IS-CRATE ?auto_1272 ) ( not ( = ?auto_1271 ?auto_1272 ) ) ( AVAILABLE ?auto_1277 ) ( ON ?auto_1271 ?auto_1278 ) ( not ( = ?auto_1278 ?auto_1271 ) ) ( not ( = ?auto_1278 ?auto_1272 ) ) ( not ( = ?auto_1275 ?auto_1273 ) ) ( HOIST-AT ?auto_1274 ?auto_1275 ) ( not ( = ?auto_1277 ?auto_1274 ) ) ( AVAILABLE ?auto_1274 ) ( SURFACE-AT ?auto_1272 ?auto_1275 ) ( ON ?auto_1272 ?auto_1279 ) ( CLEAR ?auto_1272 ) ( not ( = ?auto_1271 ?auto_1279 ) ) ( not ( = ?auto_1272 ?auto_1279 ) ) ( not ( = ?auto_1278 ?auto_1279 ) ) ( TRUCK-AT ?auto_1276 ?auto_1273 ) )
    :subtasks
    ( ( !DRIVE ?auto_1276 ?auto_1273 ?auto_1275 )
      ( MAKE-2CRATE ?auto_1278 ?auto_1271 ?auto_1272 )
      ( MAKE-1CRATE-VERIFY ?auto_1271 ?auto_1272 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1280 - SURFACE
      ?auto_1281 - SURFACE
      ?auto_1282 - SURFACE
    )
    :vars
    (
      ?auto_1285 - HOIST
      ?auto_1283 - PLACE
      ?auto_1284 - PLACE
      ?auto_1288 - HOIST
      ?auto_1286 - SURFACE
      ?auto_1287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1285 ?auto_1283 ) ( SURFACE-AT ?auto_1281 ?auto_1283 ) ( CLEAR ?auto_1281 ) ( IS-CRATE ?auto_1282 ) ( not ( = ?auto_1281 ?auto_1282 ) ) ( AVAILABLE ?auto_1285 ) ( ON ?auto_1281 ?auto_1280 ) ( not ( = ?auto_1280 ?auto_1281 ) ) ( not ( = ?auto_1280 ?auto_1282 ) ) ( not ( = ?auto_1284 ?auto_1283 ) ) ( HOIST-AT ?auto_1288 ?auto_1284 ) ( not ( = ?auto_1285 ?auto_1288 ) ) ( AVAILABLE ?auto_1288 ) ( SURFACE-AT ?auto_1282 ?auto_1284 ) ( ON ?auto_1282 ?auto_1286 ) ( CLEAR ?auto_1282 ) ( not ( = ?auto_1281 ?auto_1286 ) ) ( not ( = ?auto_1282 ?auto_1286 ) ) ( not ( = ?auto_1280 ?auto_1286 ) ) ( TRUCK-AT ?auto_1287 ?auto_1283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1281 ?auto_1282 )
      ( MAKE-2CRATE-VERIFY ?auto_1280 ?auto_1281 ?auto_1282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1289 - SURFACE
      ?auto_1290 - SURFACE
    )
    :vars
    (
      ?auto_1293 - HOIST
      ?auto_1292 - PLACE
      ?auto_1296 - SURFACE
      ?auto_1291 - PLACE
      ?auto_1297 - HOIST
      ?auto_1294 - SURFACE
      ?auto_1295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1293 ?auto_1292 ) ( IS-CRATE ?auto_1290 ) ( not ( = ?auto_1289 ?auto_1290 ) ) ( not ( = ?auto_1296 ?auto_1289 ) ) ( not ( = ?auto_1296 ?auto_1290 ) ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( HOIST-AT ?auto_1297 ?auto_1291 ) ( not ( = ?auto_1293 ?auto_1297 ) ) ( AVAILABLE ?auto_1297 ) ( SURFACE-AT ?auto_1290 ?auto_1291 ) ( ON ?auto_1290 ?auto_1294 ) ( CLEAR ?auto_1290 ) ( not ( = ?auto_1289 ?auto_1294 ) ) ( not ( = ?auto_1290 ?auto_1294 ) ) ( not ( = ?auto_1296 ?auto_1294 ) ) ( TRUCK-AT ?auto_1295 ?auto_1292 ) ( SURFACE-AT ?auto_1296 ?auto_1292 ) ( CLEAR ?auto_1296 ) ( LIFTING ?auto_1293 ?auto_1289 ) ( IS-CRATE ?auto_1289 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1296 ?auto_1289 )
      ( MAKE-2CRATE ?auto_1296 ?auto_1289 ?auto_1290 )
      ( MAKE-1CRATE-VERIFY ?auto_1289 ?auto_1290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1298 - SURFACE
      ?auto_1299 - SURFACE
      ?auto_1300 - SURFACE
    )
    :vars
    (
      ?auto_1301 - HOIST
      ?auto_1302 - PLACE
      ?auto_1306 - PLACE
      ?auto_1304 - HOIST
      ?auto_1305 - SURFACE
      ?auto_1303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1301 ?auto_1302 ) ( IS-CRATE ?auto_1300 ) ( not ( = ?auto_1299 ?auto_1300 ) ) ( not ( = ?auto_1298 ?auto_1299 ) ) ( not ( = ?auto_1298 ?auto_1300 ) ) ( not ( = ?auto_1306 ?auto_1302 ) ) ( HOIST-AT ?auto_1304 ?auto_1306 ) ( not ( = ?auto_1301 ?auto_1304 ) ) ( AVAILABLE ?auto_1304 ) ( SURFACE-AT ?auto_1300 ?auto_1306 ) ( ON ?auto_1300 ?auto_1305 ) ( CLEAR ?auto_1300 ) ( not ( = ?auto_1299 ?auto_1305 ) ) ( not ( = ?auto_1300 ?auto_1305 ) ) ( not ( = ?auto_1298 ?auto_1305 ) ) ( TRUCK-AT ?auto_1303 ?auto_1302 ) ( SURFACE-AT ?auto_1298 ?auto_1302 ) ( CLEAR ?auto_1298 ) ( LIFTING ?auto_1301 ?auto_1299 ) ( IS-CRATE ?auto_1299 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1299 ?auto_1300 )
      ( MAKE-2CRATE-VERIFY ?auto_1298 ?auto_1299 ?auto_1300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1307 - SURFACE
      ?auto_1308 - SURFACE
    )
    :vars
    (
      ?auto_1311 - HOIST
      ?auto_1309 - PLACE
      ?auto_1314 - SURFACE
      ?auto_1312 - PLACE
      ?auto_1315 - HOIST
      ?auto_1310 - SURFACE
      ?auto_1313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311 ?auto_1309 ) ( IS-CRATE ?auto_1308 ) ( not ( = ?auto_1307 ?auto_1308 ) ) ( not ( = ?auto_1314 ?auto_1307 ) ) ( not ( = ?auto_1314 ?auto_1308 ) ) ( not ( = ?auto_1312 ?auto_1309 ) ) ( HOIST-AT ?auto_1315 ?auto_1312 ) ( not ( = ?auto_1311 ?auto_1315 ) ) ( AVAILABLE ?auto_1315 ) ( SURFACE-AT ?auto_1308 ?auto_1312 ) ( ON ?auto_1308 ?auto_1310 ) ( CLEAR ?auto_1308 ) ( not ( = ?auto_1307 ?auto_1310 ) ) ( not ( = ?auto_1308 ?auto_1310 ) ) ( not ( = ?auto_1314 ?auto_1310 ) ) ( TRUCK-AT ?auto_1313 ?auto_1309 ) ( SURFACE-AT ?auto_1314 ?auto_1309 ) ( CLEAR ?auto_1314 ) ( IS-CRATE ?auto_1307 ) ( AVAILABLE ?auto_1311 ) ( IN ?auto_1307 ?auto_1313 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1311 ?auto_1307 ?auto_1313 ?auto_1309 )
      ( MAKE-2CRATE ?auto_1314 ?auto_1307 ?auto_1308 )
      ( MAKE-1CRATE-VERIFY ?auto_1307 ?auto_1308 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1316 - SURFACE
      ?auto_1317 - SURFACE
      ?auto_1318 - SURFACE
    )
    :vars
    (
      ?auto_1323 - HOIST
      ?auto_1322 - PLACE
      ?auto_1320 - PLACE
      ?auto_1324 - HOIST
      ?auto_1321 - SURFACE
      ?auto_1319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1323 ?auto_1322 ) ( IS-CRATE ?auto_1318 ) ( not ( = ?auto_1317 ?auto_1318 ) ) ( not ( = ?auto_1316 ?auto_1317 ) ) ( not ( = ?auto_1316 ?auto_1318 ) ) ( not ( = ?auto_1320 ?auto_1322 ) ) ( HOIST-AT ?auto_1324 ?auto_1320 ) ( not ( = ?auto_1323 ?auto_1324 ) ) ( AVAILABLE ?auto_1324 ) ( SURFACE-AT ?auto_1318 ?auto_1320 ) ( ON ?auto_1318 ?auto_1321 ) ( CLEAR ?auto_1318 ) ( not ( = ?auto_1317 ?auto_1321 ) ) ( not ( = ?auto_1318 ?auto_1321 ) ) ( not ( = ?auto_1316 ?auto_1321 ) ) ( TRUCK-AT ?auto_1319 ?auto_1322 ) ( SURFACE-AT ?auto_1316 ?auto_1322 ) ( CLEAR ?auto_1316 ) ( IS-CRATE ?auto_1317 ) ( AVAILABLE ?auto_1323 ) ( IN ?auto_1317 ?auto_1319 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1317 ?auto_1318 )
      ( MAKE-2CRATE-VERIFY ?auto_1316 ?auto_1317 ?auto_1318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1361 - SURFACE
      ?auto_1362 - SURFACE
    )
    :vars
    (
      ?auto_1369 - HOIST
      ?auto_1366 - PLACE
      ?auto_1367 - SURFACE
      ?auto_1365 - PLACE
      ?auto_1364 - HOIST
      ?auto_1368 - SURFACE
      ?auto_1363 - TRUCK
      ?auto_1370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1369 ?auto_1366 ) ( SURFACE-AT ?auto_1361 ?auto_1366 ) ( CLEAR ?auto_1361 ) ( IS-CRATE ?auto_1362 ) ( not ( = ?auto_1361 ?auto_1362 ) ) ( AVAILABLE ?auto_1369 ) ( ON ?auto_1361 ?auto_1367 ) ( not ( = ?auto_1367 ?auto_1361 ) ) ( not ( = ?auto_1367 ?auto_1362 ) ) ( not ( = ?auto_1365 ?auto_1366 ) ) ( HOIST-AT ?auto_1364 ?auto_1365 ) ( not ( = ?auto_1369 ?auto_1364 ) ) ( AVAILABLE ?auto_1364 ) ( SURFACE-AT ?auto_1362 ?auto_1365 ) ( ON ?auto_1362 ?auto_1368 ) ( CLEAR ?auto_1362 ) ( not ( = ?auto_1361 ?auto_1368 ) ) ( not ( = ?auto_1362 ?auto_1368 ) ) ( not ( = ?auto_1367 ?auto_1368 ) ) ( TRUCK-AT ?auto_1363 ?auto_1370 ) ( not ( = ?auto_1370 ?auto_1366 ) ) ( not ( = ?auto_1365 ?auto_1370 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1363 ?auto_1370 ?auto_1366 )
      ( MAKE-1CRATE ?auto_1361 ?auto_1362 )
      ( MAKE-1CRATE-VERIFY ?auto_1361 ?auto_1362 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1401 - SURFACE
      ?auto_1402 - SURFACE
      ?auto_1403 - SURFACE
      ?auto_1400 - SURFACE
    )
    :vars
    (
      ?auto_1404 - HOIST
      ?auto_1405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1404 ?auto_1405 ) ( SURFACE-AT ?auto_1403 ?auto_1405 ) ( CLEAR ?auto_1403 ) ( LIFTING ?auto_1404 ?auto_1400 ) ( IS-CRATE ?auto_1400 ) ( not ( = ?auto_1403 ?auto_1400 ) ) ( ON ?auto_1402 ?auto_1401 ) ( ON ?auto_1403 ?auto_1402 ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1403 ) ) ( not ( = ?auto_1401 ?auto_1400 ) ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( not ( = ?auto_1402 ?auto_1400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1403 ?auto_1400 )
      ( MAKE-3CRATE-VERIFY ?auto_1401 ?auto_1402 ?auto_1403 ?auto_1400 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1418 - SURFACE
      ?auto_1419 - SURFACE
      ?auto_1420 - SURFACE
      ?auto_1417 - SURFACE
    )
    :vars
    (
      ?auto_1422 - HOIST
      ?auto_1421 - PLACE
      ?auto_1423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1422 ?auto_1421 ) ( SURFACE-AT ?auto_1420 ?auto_1421 ) ( CLEAR ?auto_1420 ) ( IS-CRATE ?auto_1417 ) ( not ( = ?auto_1420 ?auto_1417 ) ) ( TRUCK-AT ?auto_1423 ?auto_1421 ) ( AVAILABLE ?auto_1422 ) ( IN ?auto_1417 ?auto_1423 ) ( ON ?auto_1420 ?auto_1419 ) ( not ( = ?auto_1419 ?auto_1420 ) ) ( not ( = ?auto_1419 ?auto_1417 ) ) ( ON ?auto_1419 ?auto_1418 ) ( not ( = ?auto_1418 ?auto_1419 ) ) ( not ( = ?auto_1418 ?auto_1420 ) ) ( not ( = ?auto_1418 ?auto_1417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1419 ?auto_1420 ?auto_1417 )
      ( MAKE-3CRATE-VERIFY ?auto_1418 ?auto_1419 ?auto_1420 ?auto_1417 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1439 - SURFACE
      ?auto_1440 - SURFACE
      ?auto_1441 - SURFACE
      ?auto_1438 - SURFACE
    )
    :vars
    (
      ?auto_1442 - HOIST
      ?auto_1443 - PLACE
      ?auto_1445 - TRUCK
      ?auto_1444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442 ?auto_1443 ) ( SURFACE-AT ?auto_1441 ?auto_1443 ) ( CLEAR ?auto_1441 ) ( IS-CRATE ?auto_1438 ) ( not ( = ?auto_1441 ?auto_1438 ) ) ( AVAILABLE ?auto_1442 ) ( IN ?auto_1438 ?auto_1445 ) ( ON ?auto_1441 ?auto_1440 ) ( not ( = ?auto_1440 ?auto_1441 ) ) ( not ( = ?auto_1440 ?auto_1438 ) ) ( TRUCK-AT ?auto_1445 ?auto_1444 ) ( not ( = ?auto_1444 ?auto_1443 ) ) ( ON ?auto_1440 ?auto_1439 ) ( not ( = ?auto_1439 ?auto_1440 ) ) ( not ( = ?auto_1439 ?auto_1441 ) ) ( not ( = ?auto_1439 ?auto_1438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440 ?auto_1441 ?auto_1438 )
      ( MAKE-3CRATE-VERIFY ?auto_1439 ?auto_1440 ?auto_1441 ?auto_1438 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1463 - SURFACE
      ?auto_1464 - SURFACE
      ?auto_1465 - SURFACE
      ?auto_1462 - SURFACE
    )
    :vars
    (
      ?auto_1468 - HOIST
      ?auto_1466 - PLACE
      ?auto_1467 - TRUCK
      ?auto_1469 - PLACE
      ?auto_1470 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1468 ?auto_1466 ) ( SURFACE-AT ?auto_1465 ?auto_1466 ) ( CLEAR ?auto_1465 ) ( IS-CRATE ?auto_1462 ) ( not ( = ?auto_1465 ?auto_1462 ) ) ( AVAILABLE ?auto_1468 ) ( ON ?auto_1465 ?auto_1464 ) ( not ( = ?auto_1464 ?auto_1465 ) ) ( not ( = ?auto_1464 ?auto_1462 ) ) ( TRUCK-AT ?auto_1467 ?auto_1469 ) ( not ( = ?auto_1469 ?auto_1466 ) ) ( HOIST-AT ?auto_1470 ?auto_1469 ) ( LIFTING ?auto_1470 ?auto_1462 ) ( not ( = ?auto_1468 ?auto_1470 ) ) ( ON ?auto_1464 ?auto_1463 ) ( not ( = ?auto_1463 ?auto_1464 ) ) ( not ( = ?auto_1463 ?auto_1465 ) ) ( not ( = ?auto_1463 ?auto_1462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1464 ?auto_1465 ?auto_1462 )
      ( MAKE-3CRATE-VERIFY ?auto_1463 ?auto_1464 ?auto_1465 ?auto_1462 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1490 - SURFACE
      ?auto_1491 - SURFACE
      ?auto_1492 - SURFACE
      ?auto_1489 - SURFACE
    )
    :vars
    (
      ?auto_1498 - HOIST
      ?auto_1497 - PLACE
      ?auto_1495 - TRUCK
      ?auto_1496 - PLACE
      ?auto_1493 - HOIST
      ?auto_1494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1498 ?auto_1497 ) ( SURFACE-AT ?auto_1492 ?auto_1497 ) ( CLEAR ?auto_1492 ) ( IS-CRATE ?auto_1489 ) ( not ( = ?auto_1492 ?auto_1489 ) ) ( AVAILABLE ?auto_1498 ) ( ON ?auto_1492 ?auto_1491 ) ( not ( = ?auto_1491 ?auto_1492 ) ) ( not ( = ?auto_1491 ?auto_1489 ) ) ( TRUCK-AT ?auto_1495 ?auto_1496 ) ( not ( = ?auto_1496 ?auto_1497 ) ) ( HOIST-AT ?auto_1493 ?auto_1496 ) ( not ( = ?auto_1498 ?auto_1493 ) ) ( AVAILABLE ?auto_1493 ) ( SURFACE-AT ?auto_1489 ?auto_1496 ) ( ON ?auto_1489 ?auto_1494 ) ( CLEAR ?auto_1489 ) ( not ( = ?auto_1492 ?auto_1494 ) ) ( not ( = ?auto_1489 ?auto_1494 ) ) ( not ( = ?auto_1491 ?auto_1494 ) ) ( ON ?auto_1491 ?auto_1490 ) ( not ( = ?auto_1490 ?auto_1491 ) ) ( not ( = ?auto_1490 ?auto_1492 ) ) ( not ( = ?auto_1490 ?auto_1489 ) ) ( not ( = ?auto_1490 ?auto_1494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1491 ?auto_1492 ?auto_1489 )
      ( MAKE-3CRATE-VERIFY ?auto_1490 ?auto_1491 ?auto_1492 ?auto_1489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1518 - SURFACE
      ?auto_1519 - SURFACE
      ?auto_1520 - SURFACE
      ?auto_1517 - SURFACE
    )
    :vars
    (
      ?auto_1525 - HOIST
      ?auto_1522 - PLACE
      ?auto_1521 - PLACE
      ?auto_1523 - HOIST
      ?auto_1526 - SURFACE
      ?auto_1524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525 ?auto_1522 ) ( SURFACE-AT ?auto_1520 ?auto_1522 ) ( CLEAR ?auto_1520 ) ( IS-CRATE ?auto_1517 ) ( not ( = ?auto_1520 ?auto_1517 ) ) ( AVAILABLE ?auto_1525 ) ( ON ?auto_1520 ?auto_1519 ) ( not ( = ?auto_1519 ?auto_1520 ) ) ( not ( = ?auto_1519 ?auto_1517 ) ) ( not ( = ?auto_1521 ?auto_1522 ) ) ( HOIST-AT ?auto_1523 ?auto_1521 ) ( not ( = ?auto_1525 ?auto_1523 ) ) ( AVAILABLE ?auto_1523 ) ( SURFACE-AT ?auto_1517 ?auto_1521 ) ( ON ?auto_1517 ?auto_1526 ) ( CLEAR ?auto_1517 ) ( not ( = ?auto_1520 ?auto_1526 ) ) ( not ( = ?auto_1517 ?auto_1526 ) ) ( not ( = ?auto_1519 ?auto_1526 ) ) ( TRUCK-AT ?auto_1524 ?auto_1522 ) ( ON ?auto_1519 ?auto_1518 ) ( not ( = ?auto_1518 ?auto_1519 ) ) ( not ( = ?auto_1518 ?auto_1520 ) ) ( not ( = ?auto_1518 ?auto_1517 ) ) ( not ( = ?auto_1518 ?auto_1526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1519 ?auto_1520 ?auto_1517 )
      ( MAKE-3CRATE-VERIFY ?auto_1518 ?auto_1519 ?auto_1520 ?auto_1517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1546 - SURFACE
      ?auto_1547 - SURFACE
      ?auto_1548 - SURFACE
      ?auto_1545 - SURFACE
    )
    :vars
    (
      ?auto_1550 - HOIST
      ?auto_1551 - PLACE
      ?auto_1549 - PLACE
      ?auto_1553 - HOIST
      ?auto_1554 - SURFACE
      ?auto_1552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550 ?auto_1551 ) ( IS-CRATE ?auto_1545 ) ( not ( = ?auto_1548 ?auto_1545 ) ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( not ( = ?auto_1547 ?auto_1545 ) ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( HOIST-AT ?auto_1553 ?auto_1549 ) ( not ( = ?auto_1550 ?auto_1553 ) ) ( AVAILABLE ?auto_1553 ) ( SURFACE-AT ?auto_1545 ?auto_1549 ) ( ON ?auto_1545 ?auto_1554 ) ( CLEAR ?auto_1545 ) ( not ( = ?auto_1548 ?auto_1554 ) ) ( not ( = ?auto_1545 ?auto_1554 ) ) ( not ( = ?auto_1547 ?auto_1554 ) ) ( TRUCK-AT ?auto_1552 ?auto_1551 ) ( SURFACE-AT ?auto_1547 ?auto_1551 ) ( CLEAR ?auto_1547 ) ( LIFTING ?auto_1550 ?auto_1548 ) ( IS-CRATE ?auto_1548 ) ( ON ?auto_1547 ?auto_1546 ) ( not ( = ?auto_1546 ?auto_1547 ) ) ( not ( = ?auto_1546 ?auto_1548 ) ) ( not ( = ?auto_1546 ?auto_1545 ) ) ( not ( = ?auto_1546 ?auto_1554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1547 ?auto_1548 ?auto_1545 )
      ( MAKE-3CRATE-VERIFY ?auto_1546 ?auto_1547 ?auto_1548 ?auto_1545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1574 - SURFACE
      ?auto_1575 - SURFACE
      ?auto_1576 - SURFACE
      ?auto_1573 - SURFACE
    )
    :vars
    (
      ?auto_1577 - HOIST
      ?auto_1582 - PLACE
      ?auto_1578 - PLACE
      ?auto_1580 - HOIST
      ?auto_1581 - SURFACE
      ?auto_1579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1577 ?auto_1582 ) ( IS-CRATE ?auto_1573 ) ( not ( = ?auto_1576 ?auto_1573 ) ) ( not ( = ?auto_1575 ?auto_1576 ) ) ( not ( = ?auto_1575 ?auto_1573 ) ) ( not ( = ?auto_1578 ?auto_1582 ) ) ( HOIST-AT ?auto_1580 ?auto_1578 ) ( not ( = ?auto_1577 ?auto_1580 ) ) ( AVAILABLE ?auto_1580 ) ( SURFACE-AT ?auto_1573 ?auto_1578 ) ( ON ?auto_1573 ?auto_1581 ) ( CLEAR ?auto_1573 ) ( not ( = ?auto_1576 ?auto_1581 ) ) ( not ( = ?auto_1573 ?auto_1581 ) ) ( not ( = ?auto_1575 ?auto_1581 ) ) ( TRUCK-AT ?auto_1579 ?auto_1582 ) ( SURFACE-AT ?auto_1575 ?auto_1582 ) ( CLEAR ?auto_1575 ) ( IS-CRATE ?auto_1576 ) ( AVAILABLE ?auto_1577 ) ( IN ?auto_1576 ?auto_1579 ) ( ON ?auto_1575 ?auto_1574 ) ( not ( = ?auto_1574 ?auto_1575 ) ) ( not ( = ?auto_1574 ?auto_1576 ) ) ( not ( = ?auto_1574 ?auto_1573 ) ) ( not ( = ?auto_1574 ?auto_1581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1575 ?auto_1576 ?auto_1573 )
      ( MAKE-3CRATE-VERIFY ?auto_1574 ?auto_1575 ?auto_1576 ?auto_1573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1583 - SURFACE
      ?auto_1584 - SURFACE
    )
    :vars
    (
      ?auto_1585 - HOIST
      ?auto_1590 - PLACE
      ?auto_1591 - SURFACE
      ?auto_1586 - PLACE
      ?auto_1588 - HOIST
      ?auto_1589 - SURFACE
      ?auto_1587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1585 ?auto_1590 ) ( IS-CRATE ?auto_1584 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( not ( = ?auto_1591 ?auto_1583 ) ) ( not ( = ?auto_1591 ?auto_1584 ) ) ( not ( = ?auto_1586 ?auto_1590 ) ) ( HOIST-AT ?auto_1588 ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1588 ) ) ( AVAILABLE ?auto_1588 ) ( SURFACE-AT ?auto_1584 ?auto_1586 ) ( ON ?auto_1584 ?auto_1589 ) ( CLEAR ?auto_1584 ) ( not ( = ?auto_1583 ?auto_1589 ) ) ( not ( = ?auto_1584 ?auto_1589 ) ) ( not ( = ?auto_1591 ?auto_1589 ) ) ( SURFACE-AT ?auto_1591 ?auto_1590 ) ( CLEAR ?auto_1591 ) ( IS-CRATE ?auto_1583 ) ( AVAILABLE ?auto_1585 ) ( IN ?auto_1583 ?auto_1587 ) ( TRUCK-AT ?auto_1587 ?auto_1586 ) )
    :subtasks
    ( ( !DRIVE ?auto_1587 ?auto_1586 ?auto_1590 )
      ( MAKE-2CRATE ?auto_1591 ?auto_1583 ?auto_1584 )
      ( MAKE-1CRATE-VERIFY ?auto_1583 ?auto_1584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1592 - SURFACE
      ?auto_1593 - SURFACE
      ?auto_1594 - SURFACE
    )
    :vars
    (
      ?auto_1599 - HOIST
      ?auto_1598 - PLACE
      ?auto_1597 - PLACE
      ?auto_1596 - HOIST
      ?auto_1595 - SURFACE
      ?auto_1600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599 ?auto_1598 ) ( IS-CRATE ?auto_1594 ) ( not ( = ?auto_1593 ?auto_1594 ) ) ( not ( = ?auto_1592 ?auto_1593 ) ) ( not ( = ?auto_1592 ?auto_1594 ) ) ( not ( = ?auto_1597 ?auto_1598 ) ) ( HOIST-AT ?auto_1596 ?auto_1597 ) ( not ( = ?auto_1599 ?auto_1596 ) ) ( AVAILABLE ?auto_1596 ) ( SURFACE-AT ?auto_1594 ?auto_1597 ) ( ON ?auto_1594 ?auto_1595 ) ( CLEAR ?auto_1594 ) ( not ( = ?auto_1593 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1592 ?auto_1595 ) ) ( SURFACE-AT ?auto_1592 ?auto_1598 ) ( CLEAR ?auto_1592 ) ( IS-CRATE ?auto_1593 ) ( AVAILABLE ?auto_1599 ) ( IN ?auto_1593 ?auto_1600 ) ( TRUCK-AT ?auto_1600 ?auto_1597 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1593 ?auto_1594 )
      ( MAKE-2CRATE-VERIFY ?auto_1592 ?auto_1593 ?auto_1594 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1602 - SURFACE
      ?auto_1603 - SURFACE
      ?auto_1604 - SURFACE
      ?auto_1601 - SURFACE
    )
    :vars
    (
      ?auto_1610 - HOIST
      ?auto_1609 - PLACE
      ?auto_1605 - PLACE
      ?auto_1608 - HOIST
      ?auto_1607 - SURFACE
      ?auto_1606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610 ?auto_1609 ) ( IS-CRATE ?auto_1601 ) ( not ( = ?auto_1604 ?auto_1601 ) ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( not ( = ?auto_1603 ?auto_1601 ) ) ( not ( = ?auto_1605 ?auto_1609 ) ) ( HOIST-AT ?auto_1608 ?auto_1605 ) ( not ( = ?auto_1610 ?auto_1608 ) ) ( AVAILABLE ?auto_1608 ) ( SURFACE-AT ?auto_1601 ?auto_1605 ) ( ON ?auto_1601 ?auto_1607 ) ( CLEAR ?auto_1601 ) ( not ( = ?auto_1604 ?auto_1607 ) ) ( not ( = ?auto_1601 ?auto_1607 ) ) ( not ( = ?auto_1603 ?auto_1607 ) ) ( SURFACE-AT ?auto_1603 ?auto_1609 ) ( CLEAR ?auto_1603 ) ( IS-CRATE ?auto_1604 ) ( AVAILABLE ?auto_1610 ) ( IN ?auto_1604 ?auto_1606 ) ( TRUCK-AT ?auto_1606 ?auto_1605 ) ( ON ?auto_1603 ?auto_1602 ) ( not ( = ?auto_1602 ?auto_1603 ) ) ( not ( = ?auto_1602 ?auto_1604 ) ) ( not ( = ?auto_1602 ?auto_1601 ) ) ( not ( = ?auto_1602 ?auto_1607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1603 ?auto_1604 ?auto_1601 )
      ( MAKE-3CRATE-VERIFY ?auto_1602 ?auto_1603 ?auto_1604 ?auto_1601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1611 - SURFACE
      ?auto_1612 - SURFACE
    )
    :vars
    (
      ?auto_1619 - HOIST
      ?auto_1618 - PLACE
      ?auto_1613 - SURFACE
      ?auto_1614 - PLACE
      ?auto_1617 - HOIST
      ?auto_1616 - SURFACE
      ?auto_1615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1619 ?auto_1618 ) ( IS-CRATE ?auto_1612 ) ( not ( = ?auto_1611 ?auto_1612 ) ) ( not ( = ?auto_1613 ?auto_1611 ) ) ( not ( = ?auto_1613 ?auto_1612 ) ) ( not ( = ?auto_1614 ?auto_1618 ) ) ( HOIST-AT ?auto_1617 ?auto_1614 ) ( not ( = ?auto_1619 ?auto_1617 ) ) ( SURFACE-AT ?auto_1612 ?auto_1614 ) ( ON ?auto_1612 ?auto_1616 ) ( CLEAR ?auto_1612 ) ( not ( = ?auto_1611 ?auto_1616 ) ) ( not ( = ?auto_1612 ?auto_1616 ) ) ( not ( = ?auto_1613 ?auto_1616 ) ) ( SURFACE-AT ?auto_1613 ?auto_1618 ) ( CLEAR ?auto_1613 ) ( IS-CRATE ?auto_1611 ) ( AVAILABLE ?auto_1619 ) ( TRUCK-AT ?auto_1615 ?auto_1614 ) ( LIFTING ?auto_1617 ?auto_1611 ) )
    :subtasks
    ( ( !LOAD ?auto_1617 ?auto_1611 ?auto_1615 ?auto_1614 )
      ( MAKE-2CRATE ?auto_1613 ?auto_1611 ?auto_1612 )
      ( MAKE-1CRATE-VERIFY ?auto_1611 ?auto_1612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1620 - SURFACE
      ?auto_1621 - SURFACE
      ?auto_1622 - SURFACE
    )
    :vars
    (
      ?auto_1625 - HOIST
      ?auto_1627 - PLACE
      ?auto_1628 - PLACE
      ?auto_1623 - HOIST
      ?auto_1624 - SURFACE
      ?auto_1626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625 ?auto_1627 ) ( IS-CRATE ?auto_1622 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1622 ) ) ( not ( = ?auto_1628 ?auto_1627 ) ) ( HOIST-AT ?auto_1623 ?auto_1628 ) ( not ( = ?auto_1625 ?auto_1623 ) ) ( SURFACE-AT ?auto_1622 ?auto_1628 ) ( ON ?auto_1622 ?auto_1624 ) ( CLEAR ?auto_1622 ) ( not ( = ?auto_1621 ?auto_1624 ) ) ( not ( = ?auto_1622 ?auto_1624 ) ) ( not ( = ?auto_1620 ?auto_1624 ) ) ( SURFACE-AT ?auto_1620 ?auto_1627 ) ( CLEAR ?auto_1620 ) ( IS-CRATE ?auto_1621 ) ( AVAILABLE ?auto_1625 ) ( TRUCK-AT ?auto_1626 ?auto_1628 ) ( LIFTING ?auto_1623 ?auto_1621 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1621 ?auto_1622 )
      ( MAKE-2CRATE-VERIFY ?auto_1620 ?auto_1621 ?auto_1622 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1630 - SURFACE
      ?auto_1631 - SURFACE
      ?auto_1632 - SURFACE
      ?auto_1629 - SURFACE
    )
    :vars
    (
      ?auto_1633 - HOIST
      ?auto_1637 - PLACE
      ?auto_1634 - PLACE
      ?auto_1635 - HOIST
      ?auto_1636 - SURFACE
      ?auto_1638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1633 ?auto_1637 ) ( IS-CRATE ?auto_1629 ) ( not ( = ?auto_1632 ?auto_1629 ) ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( not ( = ?auto_1631 ?auto_1629 ) ) ( not ( = ?auto_1634 ?auto_1637 ) ) ( HOIST-AT ?auto_1635 ?auto_1634 ) ( not ( = ?auto_1633 ?auto_1635 ) ) ( SURFACE-AT ?auto_1629 ?auto_1634 ) ( ON ?auto_1629 ?auto_1636 ) ( CLEAR ?auto_1629 ) ( not ( = ?auto_1632 ?auto_1636 ) ) ( not ( = ?auto_1629 ?auto_1636 ) ) ( not ( = ?auto_1631 ?auto_1636 ) ) ( SURFACE-AT ?auto_1631 ?auto_1637 ) ( CLEAR ?auto_1631 ) ( IS-CRATE ?auto_1632 ) ( AVAILABLE ?auto_1633 ) ( TRUCK-AT ?auto_1638 ?auto_1634 ) ( LIFTING ?auto_1635 ?auto_1632 ) ( ON ?auto_1631 ?auto_1630 ) ( not ( = ?auto_1630 ?auto_1631 ) ) ( not ( = ?auto_1630 ?auto_1632 ) ) ( not ( = ?auto_1630 ?auto_1629 ) ) ( not ( = ?auto_1630 ?auto_1636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1631 ?auto_1632 ?auto_1629 )
      ( MAKE-3CRATE-VERIFY ?auto_1630 ?auto_1631 ?auto_1632 ?auto_1629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1639 - SURFACE
      ?auto_1640 - SURFACE
    )
    :vars
    (
      ?auto_1641 - HOIST
      ?auto_1646 - PLACE
      ?auto_1642 - SURFACE
      ?auto_1643 - PLACE
      ?auto_1644 - HOIST
      ?auto_1645 - SURFACE
      ?auto_1647 - TRUCK
      ?auto_1648 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1641 ?auto_1646 ) ( IS-CRATE ?auto_1640 ) ( not ( = ?auto_1639 ?auto_1640 ) ) ( not ( = ?auto_1642 ?auto_1639 ) ) ( not ( = ?auto_1642 ?auto_1640 ) ) ( not ( = ?auto_1643 ?auto_1646 ) ) ( HOIST-AT ?auto_1644 ?auto_1643 ) ( not ( = ?auto_1641 ?auto_1644 ) ) ( SURFACE-AT ?auto_1640 ?auto_1643 ) ( ON ?auto_1640 ?auto_1645 ) ( CLEAR ?auto_1640 ) ( not ( = ?auto_1639 ?auto_1645 ) ) ( not ( = ?auto_1640 ?auto_1645 ) ) ( not ( = ?auto_1642 ?auto_1645 ) ) ( SURFACE-AT ?auto_1642 ?auto_1646 ) ( CLEAR ?auto_1642 ) ( IS-CRATE ?auto_1639 ) ( AVAILABLE ?auto_1641 ) ( TRUCK-AT ?auto_1647 ?auto_1643 ) ( AVAILABLE ?auto_1644 ) ( SURFACE-AT ?auto_1639 ?auto_1643 ) ( ON ?auto_1639 ?auto_1648 ) ( CLEAR ?auto_1639 ) ( not ( = ?auto_1639 ?auto_1648 ) ) ( not ( = ?auto_1640 ?auto_1648 ) ) ( not ( = ?auto_1642 ?auto_1648 ) ) ( not ( = ?auto_1645 ?auto_1648 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1644 ?auto_1639 ?auto_1648 ?auto_1643 )
      ( MAKE-2CRATE ?auto_1642 ?auto_1639 ?auto_1640 )
      ( MAKE-1CRATE-VERIFY ?auto_1639 ?auto_1640 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1649 - SURFACE
      ?auto_1650 - SURFACE
      ?auto_1651 - SURFACE
    )
    :vars
    (
      ?auto_1656 - HOIST
      ?auto_1652 - PLACE
      ?auto_1653 - PLACE
      ?auto_1655 - HOIST
      ?auto_1654 - SURFACE
      ?auto_1657 - TRUCK
      ?auto_1658 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1656 ?auto_1652 ) ( IS-CRATE ?auto_1651 ) ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1653 ?auto_1652 ) ) ( HOIST-AT ?auto_1655 ?auto_1653 ) ( not ( = ?auto_1656 ?auto_1655 ) ) ( SURFACE-AT ?auto_1651 ?auto_1653 ) ( ON ?auto_1651 ?auto_1654 ) ( CLEAR ?auto_1651 ) ( not ( = ?auto_1650 ?auto_1654 ) ) ( not ( = ?auto_1651 ?auto_1654 ) ) ( not ( = ?auto_1649 ?auto_1654 ) ) ( SURFACE-AT ?auto_1649 ?auto_1652 ) ( CLEAR ?auto_1649 ) ( IS-CRATE ?auto_1650 ) ( AVAILABLE ?auto_1656 ) ( TRUCK-AT ?auto_1657 ?auto_1653 ) ( AVAILABLE ?auto_1655 ) ( SURFACE-AT ?auto_1650 ?auto_1653 ) ( ON ?auto_1650 ?auto_1658 ) ( CLEAR ?auto_1650 ) ( not ( = ?auto_1650 ?auto_1658 ) ) ( not ( = ?auto_1651 ?auto_1658 ) ) ( not ( = ?auto_1649 ?auto_1658 ) ) ( not ( = ?auto_1654 ?auto_1658 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1650 ?auto_1651 )
      ( MAKE-2CRATE-VERIFY ?auto_1649 ?auto_1650 ?auto_1651 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1660 - SURFACE
      ?auto_1661 - SURFACE
      ?auto_1662 - SURFACE
      ?auto_1659 - SURFACE
    )
    :vars
    (
      ?auto_1666 - HOIST
      ?auto_1665 - PLACE
      ?auto_1664 - PLACE
      ?auto_1669 - HOIST
      ?auto_1663 - SURFACE
      ?auto_1668 - TRUCK
      ?auto_1667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1666 ?auto_1665 ) ( IS-CRATE ?auto_1659 ) ( not ( = ?auto_1662 ?auto_1659 ) ) ( not ( = ?auto_1661 ?auto_1662 ) ) ( not ( = ?auto_1661 ?auto_1659 ) ) ( not ( = ?auto_1664 ?auto_1665 ) ) ( HOIST-AT ?auto_1669 ?auto_1664 ) ( not ( = ?auto_1666 ?auto_1669 ) ) ( SURFACE-AT ?auto_1659 ?auto_1664 ) ( ON ?auto_1659 ?auto_1663 ) ( CLEAR ?auto_1659 ) ( not ( = ?auto_1662 ?auto_1663 ) ) ( not ( = ?auto_1659 ?auto_1663 ) ) ( not ( = ?auto_1661 ?auto_1663 ) ) ( SURFACE-AT ?auto_1661 ?auto_1665 ) ( CLEAR ?auto_1661 ) ( IS-CRATE ?auto_1662 ) ( AVAILABLE ?auto_1666 ) ( TRUCK-AT ?auto_1668 ?auto_1664 ) ( AVAILABLE ?auto_1669 ) ( SURFACE-AT ?auto_1662 ?auto_1664 ) ( ON ?auto_1662 ?auto_1667 ) ( CLEAR ?auto_1662 ) ( not ( = ?auto_1662 ?auto_1667 ) ) ( not ( = ?auto_1659 ?auto_1667 ) ) ( not ( = ?auto_1661 ?auto_1667 ) ) ( not ( = ?auto_1663 ?auto_1667 ) ) ( ON ?auto_1661 ?auto_1660 ) ( not ( = ?auto_1660 ?auto_1661 ) ) ( not ( = ?auto_1660 ?auto_1662 ) ) ( not ( = ?auto_1660 ?auto_1659 ) ) ( not ( = ?auto_1660 ?auto_1663 ) ) ( not ( = ?auto_1660 ?auto_1667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1661 ?auto_1662 ?auto_1659 )
      ( MAKE-3CRATE-VERIFY ?auto_1660 ?auto_1661 ?auto_1662 ?auto_1659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1670 - SURFACE
      ?auto_1671 - SURFACE
    )
    :vars
    (
      ?auto_1675 - HOIST
      ?auto_1674 - PLACE
      ?auto_1679 - SURFACE
      ?auto_1673 - PLACE
      ?auto_1678 - HOIST
      ?auto_1672 - SURFACE
      ?auto_1676 - SURFACE
      ?auto_1677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1675 ?auto_1674 ) ( IS-CRATE ?auto_1671 ) ( not ( = ?auto_1670 ?auto_1671 ) ) ( not ( = ?auto_1679 ?auto_1670 ) ) ( not ( = ?auto_1679 ?auto_1671 ) ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( HOIST-AT ?auto_1678 ?auto_1673 ) ( not ( = ?auto_1675 ?auto_1678 ) ) ( SURFACE-AT ?auto_1671 ?auto_1673 ) ( ON ?auto_1671 ?auto_1672 ) ( CLEAR ?auto_1671 ) ( not ( = ?auto_1670 ?auto_1672 ) ) ( not ( = ?auto_1671 ?auto_1672 ) ) ( not ( = ?auto_1679 ?auto_1672 ) ) ( SURFACE-AT ?auto_1679 ?auto_1674 ) ( CLEAR ?auto_1679 ) ( IS-CRATE ?auto_1670 ) ( AVAILABLE ?auto_1675 ) ( AVAILABLE ?auto_1678 ) ( SURFACE-AT ?auto_1670 ?auto_1673 ) ( ON ?auto_1670 ?auto_1676 ) ( CLEAR ?auto_1670 ) ( not ( = ?auto_1670 ?auto_1676 ) ) ( not ( = ?auto_1671 ?auto_1676 ) ) ( not ( = ?auto_1679 ?auto_1676 ) ) ( not ( = ?auto_1672 ?auto_1676 ) ) ( TRUCK-AT ?auto_1677 ?auto_1674 ) )
    :subtasks
    ( ( !DRIVE ?auto_1677 ?auto_1674 ?auto_1673 )
      ( MAKE-2CRATE ?auto_1679 ?auto_1670 ?auto_1671 )
      ( MAKE-1CRATE-VERIFY ?auto_1670 ?auto_1671 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1680 - SURFACE
      ?auto_1681 - SURFACE
      ?auto_1682 - SURFACE
    )
    :vars
    (
      ?auto_1686 - HOIST
      ?auto_1683 - PLACE
      ?auto_1688 - PLACE
      ?auto_1684 - HOIST
      ?auto_1687 - SURFACE
      ?auto_1685 - SURFACE
      ?auto_1689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1686 ?auto_1683 ) ( IS-CRATE ?auto_1682 ) ( not ( = ?auto_1681 ?auto_1682 ) ) ( not ( = ?auto_1680 ?auto_1681 ) ) ( not ( = ?auto_1680 ?auto_1682 ) ) ( not ( = ?auto_1688 ?auto_1683 ) ) ( HOIST-AT ?auto_1684 ?auto_1688 ) ( not ( = ?auto_1686 ?auto_1684 ) ) ( SURFACE-AT ?auto_1682 ?auto_1688 ) ( ON ?auto_1682 ?auto_1687 ) ( CLEAR ?auto_1682 ) ( not ( = ?auto_1681 ?auto_1687 ) ) ( not ( = ?auto_1682 ?auto_1687 ) ) ( not ( = ?auto_1680 ?auto_1687 ) ) ( SURFACE-AT ?auto_1680 ?auto_1683 ) ( CLEAR ?auto_1680 ) ( IS-CRATE ?auto_1681 ) ( AVAILABLE ?auto_1686 ) ( AVAILABLE ?auto_1684 ) ( SURFACE-AT ?auto_1681 ?auto_1688 ) ( ON ?auto_1681 ?auto_1685 ) ( CLEAR ?auto_1681 ) ( not ( = ?auto_1681 ?auto_1685 ) ) ( not ( = ?auto_1682 ?auto_1685 ) ) ( not ( = ?auto_1680 ?auto_1685 ) ) ( not ( = ?auto_1687 ?auto_1685 ) ) ( TRUCK-AT ?auto_1689 ?auto_1683 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1681 ?auto_1682 )
      ( MAKE-2CRATE-VERIFY ?auto_1680 ?auto_1681 ?auto_1682 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1691 - SURFACE
      ?auto_1692 - SURFACE
      ?auto_1693 - SURFACE
      ?auto_1690 - SURFACE
    )
    :vars
    (
      ?auto_1694 - HOIST
      ?auto_1700 - PLACE
      ?auto_1696 - PLACE
      ?auto_1699 - HOIST
      ?auto_1695 - SURFACE
      ?auto_1698 - SURFACE
      ?auto_1697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1694 ?auto_1700 ) ( IS-CRATE ?auto_1690 ) ( not ( = ?auto_1693 ?auto_1690 ) ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( not ( = ?auto_1692 ?auto_1690 ) ) ( not ( = ?auto_1696 ?auto_1700 ) ) ( HOIST-AT ?auto_1699 ?auto_1696 ) ( not ( = ?auto_1694 ?auto_1699 ) ) ( SURFACE-AT ?auto_1690 ?auto_1696 ) ( ON ?auto_1690 ?auto_1695 ) ( CLEAR ?auto_1690 ) ( not ( = ?auto_1693 ?auto_1695 ) ) ( not ( = ?auto_1690 ?auto_1695 ) ) ( not ( = ?auto_1692 ?auto_1695 ) ) ( SURFACE-AT ?auto_1692 ?auto_1700 ) ( CLEAR ?auto_1692 ) ( IS-CRATE ?auto_1693 ) ( AVAILABLE ?auto_1694 ) ( AVAILABLE ?auto_1699 ) ( SURFACE-AT ?auto_1693 ?auto_1696 ) ( ON ?auto_1693 ?auto_1698 ) ( CLEAR ?auto_1693 ) ( not ( = ?auto_1693 ?auto_1698 ) ) ( not ( = ?auto_1690 ?auto_1698 ) ) ( not ( = ?auto_1692 ?auto_1698 ) ) ( not ( = ?auto_1695 ?auto_1698 ) ) ( TRUCK-AT ?auto_1697 ?auto_1700 ) ( ON ?auto_1692 ?auto_1691 ) ( not ( = ?auto_1691 ?auto_1692 ) ) ( not ( = ?auto_1691 ?auto_1693 ) ) ( not ( = ?auto_1691 ?auto_1690 ) ) ( not ( = ?auto_1691 ?auto_1695 ) ) ( not ( = ?auto_1691 ?auto_1698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1692 ?auto_1693 ?auto_1690 )
      ( MAKE-3CRATE-VERIFY ?auto_1691 ?auto_1692 ?auto_1693 ?auto_1690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1701 - SURFACE
      ?auto_1702 - SURFACE
    )
    :vars
    (
      ?auto_1703 - HOIST
      ?auto_1710 - PLACE
      ?auto_1706 - SURFACE
      ?auto_1705 - PLACE
      ?auto_1709 - HOIST
      ?auto_1704 - SURFACE
      ?auto_1708 - SURFACE
      ?auto_1707 - TRUCK
      ?auto_1711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703 ?auto_1710 ) ( IS-CRATE ?auto_1702 ) ( not ( = ?auto_1701 ?auto_1702 ) ) ( not ( = ?auto_1706 ?auto_1701 ) ) ( not ( = ?auto_1706 ?auto_1702 ) ) ( not ( = ?auto_1705 ?auto_1710 ) ) ( HOIST-AT ?auto_1709 ?auto_1705 ) ( not ( = ?auto_1703 ?auto_1709 ) ) ( SURFACE-AT ?auto_1702 ?auto_1705 ) ( ON ?auto_1702 ?auto_1704 ) ( CLEAR ?auto_1702 ) ( not ( = ?auto_1701 ?auto_1704 ) ) ( not ( = ?auto_1702 ?auto_1704 ) ) ( not ( = ?auto_1706 ?auto_1704 ) ) ( IS-CRATE ?auto_1701 ) ( AVAILABLE ?auto_1709 ) ( SURFACE-AT ?auto_1701 ?auto_1705 ) ( ON ?auto_1701 ?auto_1708 ) ( CLEAR ?auto_1701 ) ( not ( = ?auto_1701 ?auto_1708 ) ) ( not ( = ?auto_1702 ?auto_1708 ) ) ( not ( = ?auto_1706 ?auto_1708 ) ) ( not ( = ?auto_1704 ?auto_1708 ) ) ( TRUCK-AT ?auto_1707 ?auto_1710 ) ( SURFACE-AT ?auto_1711 ?auto_1710 ) ( CLEAR ?auto_1711 ) ( LIFTING ?auto_1703 ?auto_1706 ) ( IS-CRATE ?auto_1706 ) ( not ( = ?auto_1711 ?auto_1706 ) ) ( not ( = ?auto_1701 ?auto_1711 ) ) ( not ( = ?auto_1702 ?auto_1711 ) ) ( not ( = ?auto_1704 ?auto_1711 ) ) ( not ( = ?auto_1708 ?auto_1711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1711 ?auto_1706 )
      ( MAKE-2CRATE ?auto_1706 ?auto_1701 ?auto_1702 )
      ( MAKE-1CRATE-VERIFY ?auto_1701 ?auto_1702 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1712 - SURFACE
      ?auto_1713 - SURFACE
      ?auto_1714 - SURFACE
    )
    :vars
    (
      ?auto_1718 - HOIST
      ?auto_1720 - PLACE
      ?auto_1719 - PLACE
      ?auto_1717 - HOIST
      ?auto_1716 - SURFACE
      ?auto_1722 - SURFACE
      ?auto_1715 - TRUCK
      ?auto_1721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1718 ?auto_1720 ) ( IS-CRATE ?auto_1714 ) ( not ( = ?auto_1713 ?auto_1714 ) ) ( not ( = ?auto_1712 ?auto_1713 ) ) ( not ( = ?auto_1712 ?auto_1714 ) ) ( not ( = ?auto_1719 ?auto_1720 ) ) ( HOIST-AT ?auto_1717 ?auto_1719 ) ( not ( = ?auto_1718 ?auto_1717 ) ) ( SURFACE-AT ?auto_1714 ?auto_1719 ) ( ON ?auto_1714 ?auto_1716 ) ( CLEAR ?auto_1714 ) ( not ( = ?auto_1713 ?auto_1716 ) ) ( not ( = ?auto_1714 ?auto_1716 ) ) ( not ( = ?auto_1712 ?auto_1716 ) ) ( IS-CRATE ?auto_1713 ) ( AVAILABLE ?auto_1717 ) ( SURFACE-AT ?auto_1713 ?auto_1719 ) ( ON ?auto_1713 ?auto_1722 ) ( CLEAR ?auto_1713 ) ( not ( = ?auto_1713 ?auto_1722 ) ) ( not ( = ?auto_1714 ?auto_1722 ) ) ( not ( = ?auto_1712 ?auto_1722 ) ) ( not ( = ?auto_1716 ?auto_1722 ) ) ( TRUCK-AT ?auto_1715 ?auto_1720 ) ( SURFACE-AT ?auto_1721 ?auto_1720 ) ( CLEAR ?auto_1721 ) ( LIFTING ?auto_1718 ?auto_1712 ) ( IS-CRATE ?auto_1712 ) ( not ( = ?auto_1721 ?auto_1712 ) ) ( not ( = ?auto_1713 ?auto_1721 ) ) ( not ( = ?auto_1714 ?auto_1721 ) ) ( not ( = ?auto_1716 ?auto_1721 ) ) ( not ( = ?auto_1722 ?auto_1721 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1713 ?auto_1714 )
      ( MAKE-2CRATE-VERIFY ?auto_1712 ?auto_1713 ?auto_1714 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1724 - SURFACE
      ?auto_1725 - SURFACE
      ?auto_1726 - SURFACE
      ?auto_1723 - SURFACE
    )
    :vars
    (
      ?auto_1729 - HOIST
      ?auto_1728 - PLACE
      ?auto_1727 - PLACE
      ?auto_1732 - HOIST
      ?auto_1731 - SURFACE
      ?auto_1733 - SURFACE
      ?auto_1730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1729 ?auto_1728 ) ( IS-CRATE ?auto_1723 ) ( not ( = ?auto_1726 ?auto_1723 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( not ( = ?auto_1725 ?auto_1723 ) ) ( not ( = ?auto_1727 ?auto_1728 ) ) ( HOIST-AT ?auto_1732 ?auto_1727 ) ( not ( = ?auto_1729 ?auto_1732 ) ) ( SURFACE-AT ?auto_1723 ?auto_1727 ) ( ON ?auto_1723 ?auto_1731 ) ( CLEAR ?auto_1723 ) ( not ( = ?auto_1726 ?auto_1731 ) ) ( not ( = ?auto_1723 ?auto_1731 ) ) ( not ( = ?auto_1725 ?auto_1731 ) ) ( IS-CRATE ?auto_1726 ) ( AVAILABLE ?auto_1732 ) ( SURFACE-AT ?auto_1726 ?auto_1727 ) ( ON ?auto_1726 ?auto_1733 ) ( CLEAR ?auto_1726 ) ( not ( = ?auto_1726 ?auto_1733 ) ) ( not ( = ?auto_1723 ?auto_1733 ) ) ( not ( = ?auto_1725 ?auto_1733 ) ) ( not ( = ?auto_1731 ?auto_1733 ) ) ( TRUCK-AT ?auto_1730 ?auto_1728 ) ( SURFACE-AT ?auto_1724 ?auto_1728 ) ( CLEAR ?auto_1724 ) ( LIFTING ?auto_1729 ?auto_1725 ) ( IS-CRATE ?auto_1725 ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( not ( = ?auto_1726 ?auto_1724 ) ) ( not ( = ?auto_1723 ?auto_1724 ) ) ( not ( = ?auto_1731 ?auto_1724 ) ) ( not ( = ?auto_1733 ?auto_1724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1725 ?auto_1726 ?auto_1723 )
      ( MAKE-3CRATE-VERIFY ?auto_1724 ?auto_1725 ?auto_1726 ?auto_1723 ) )
  )

)

