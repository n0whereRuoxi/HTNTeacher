( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1182 - OBJ
      ?auto_1183 - LOCATION
    )
    :vars
    (
      ?auto_1184 - TRUCK
      ?auto_1185 - LOCATION
      ?auto_1186 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1184 ?auto_1185 ) ( IN-CITY ?auto_1185 ?auto_1186 ) ( IN-CITY ?auto_1183 ?auto_1186 ) ( not ( = ?auto_1183 ?auto_1185 ) ) ( OBJ-AT ?auto_1182 ?auto_1185 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1182 ?auto_1184 ?auto_1185 )
      ( !DRIVE-TRUCK ?auto_1184 ?auto_1185 ?auto_1183 ?auto_1186 )
      ( !UNLOAD-TRUCK ?auto_1182 ?auto_1184 ?auto_1183 )
      ( DELIVER-1PKG-VERIFY ?auto_1182 ?auto_1183 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1189 - OBJ
      ?auto_1190 - LOCATION
    )
    :vars
    (
      ?auto_1191 - LOCATION
      ?auto_1192 - CITY
      ?auto_1193 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1191 ?auto_1192 ) ( IN-CITY ?auto_1190 ?auto_1192 ) ( not ( = ?auto_1190 ?auto_1191 ) ) ( OBJ-AT ?auto_1189 ?auto_1191 ) ( TRUCK-AT ?auto_1193 ?auto_1190 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1193 ?auto_1190 ?auto_1191 ?auto_1192 )
      ( DELIVER-1PKG ?auto_1189 ?auto_1190 )
      ( DELIVER-1PKG-VERIFY ?auto_1189 ?auto_1190 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1196 - OBJ
      ?auto_1197 - LOCATION
    )
    :vars
    (
      ?auto_1198 - TRUCK
      ?auto_1199 - LOCATION
      ?auto_1200 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1198 ?auto_1199 ) ( IN-CITY ?auto_1199 ?auto_1200 ) ( IN-CITY ?auto_1197 ?auto_1200 ) ( not ( = ?auto_1197 ?auto_1199 ) ) ( OBJ-AT ?auto_1196 ?auto_1199 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1196 ?auto_1198 ?auto_1199 )
      ( !DRIVE-TRUCK ?auto_1198 ?auto_1199 ?auto_1197 ?auto_1200 )
      ( !UNLOAD-TRUCK ?auto_1196 ?auto_1198 ?auto_1197 )
      ( DELIVER-1PKG-VERIFY ?auto_1196 ?auto_1197 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1203 - OBJ
      ?auto_1204 - LOCATION
    )
    :vars
    (
      ?auto_1205 - LOCATION
      ?auto_1207 - CITY
      ?auto_1206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1205 ?auto_1207 ) ( IN-CITY ?auto_1204 ?auto_1207 ) ( not ( = ?auto_1204 ?auto_1205 ) ) ( OBJ-AT ?auto_1203 ?auto_1205 ) ( TRUCK-AT ?auto_1206 ?auto_1204 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1206 ?auto_1204 ?auto_1205 ?auto_1207 )
      ( DELIVER-1PKG ?auto_1203 ?auto_1204 )
      ( DELIVER-1PKG-VERIFY ?auto_1203 ?auto_1204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1211 - OBJ
      ?auto_1213 - OBJ
      ?auto_1212 - LOCATION
    )
    :vars
    (
      ?auto_1215 - LOCATION
      ?auto_1216 - CITY
      ?auto_1214 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1213 ?auto_1211 ) ( IN-CITY ?auto_1215 ?auto_1216 ) ( IN-CITY ?auto_1212 ?auto_1216 ) ( not ( = ?auto_1212 ?auto_1215 ) ) ( OBJ-AT ?auto_1213 ?auto_1215 ) ( TRUCK-AT ?auto_1214 ?auto_1215 ) ( OBJ-AT ?auto_1211 ?auto_1215 ) ( not ( = ?auto_1211 ?auto_1213 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1211 ?auto_1212 )
      ( DELIVER-1PKG ?auto_1213 ?auto_1212 )
      ( DELIVER-2PKG-VERIFY ?auto_1211 ?auto_1213 ?auto_1212 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1220 - OBJ
      ?auto_1222 - OBJ
      ?auto_1221 - LOCATION
    )
    :vars
    (
      ?auto_1224 - LOCATION
      ?auto_1225 - CITY
      ?auto_1223 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1222 ?auto_1220 ) ( IN-CITY ?auto_1224 ?auto_1225 ) ( IN-CITY ?auto_1221 ?auto_1225 ) ( not ( = ?auto_1221 ?auto_1224 ) ) ( OBJ-AT ?auto_1222 ?auto_1224 ) ( OBJ-AT ?auto_1220 ?auto_1224 ) ( not ( = ?auto_1220 ?auto_1222 ) ) ( TRUCK-AT ?auto_1223 ?auto_1221 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1223 ?auto_1221 ?auto_1224 ?auto_1225 )
      ( DELIVER-2PKG ?auto_1220 ?auto_1222 ?auto_1221 )
      ( DELIVER-2PKG-VERIFY ?auto_1220 ?auto_1222 ?auto_1221 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1228 - OBJ
      ?auto_1229 - LOCATION
    )
    :vars
    (
      ?auto_1230 - TRUCK
      ?auto_1231 - LOCATION
      ?auto_1232 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1230 ?auto_1231 ) ( IN-CITY ?auto_1231 ?auto_1232 ) ( IN-CITY ?auto_1229 ?auto_1232 ) ( not ( = ?auto_1229 ?auto_1231 ) ) ( OBJ-AT ?auto_1228 ?auto_1231 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1228 ?auto_1230 ?auto_1231 )
      ( !DRIVE-TRUCK ?auto_1230 ?auto_1231 ?auto_1229 ?auto_1232 )
      ( !UNLOAD-TRUCK ?auto_1228 ?auto_1230 ?auto_1229 )
      ( DELIVER-1PKG-VERIFY ?auto_1228 ?auto_1229 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1235 - OBJ
      ?auto_1236 - LOCATION
    )
    :vars
    (
      ?auto_1237 - LOCATION
      ?auto_1238 - CITY
      ?auto_1239 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1237 ?auto_1238 ) ( IN-CITY ?auto_1236 ?auto_1238 ) ( not ( = ?auto_1236 ?auto_1237 ) ) ( OBJ-AT ?auto_1235 ?auto_1237 ) ( TRUCK-AT ?auto_1239 ?auto_1236 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1239 ?auto_1236 ?auto_1237 ?auto_1238 )
      ( DELIVER-1PKG ?auto_1235 ?auto_1236 )
      ( DELIVER-1PKG-VERIFY ?auto_1235 ?auto_1236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1244 - OBJ
      ?auto_1246 - OBJ
      ?auto_1247 - OBJ
      ?auto_1245 - LOCATION
    )
    :vars
    (
      ?auto_1248 - LOCATION
      ?auto_1250 - CITY
      ?auto_1251 - LOCATION
      ?auto_1249 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1246 ?auto_1244 ) ( GREATER-THAN ?auto_1247 ?auto_1244 ) ( GREATER-THAN ?auto_1247 ?auto_1246 ) ( IN-CITY ?auto_1248 ?auto_1250 ) ( IN-CITY ?auto_1245 ?auto_1250 ) ( not ( = ?auto_1245 ?auto_1248 ) ) ( OBJ-AT ?auto_1247 ?auto_1248 ) ( IN-CITY ?auto_1251 ?auto_1250 ) ( not ( = ?auto_1245 ?auto_1251 ) ) ( OBJ-AT ?auto_1246 ?auto_1251 ) ( TRUCK-AT ?auto_1249 ?auto_1251 ) ( OBJ-AT ?auto_1244 ?auto_1251 ) ( not ( = ?auto_1244 ?auto_1246 ) ) ( not ( = ?auto_1244 ?auto_1247 ) ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( not ( = ?auto_1248 ?auto_1251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1244 ?auto_1246 ?auto_1245 )
      ( DELIVER-1PKG ?auto_1247 ?auto_1245 )
      ( DELIVER-3PKG-VERIFY ?auto_1244 ?auto_1246 ?auto_1247 ?auto_1245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1256 - OBJ
      ?auto_1258 - OBJ
      ?auto_1259 - OBJ
      ?auto_1257 - LOCATION
    )
    :vars
    (
      ?auto_1262 - LOCATION
      ?auto_1261 - CITY
      ?auto_1260 - LOCATION
      ?auto_1263 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1258 ?auto_1256 ) ( GREATER-THAN ?auto_1259 ?auto_1256 ) ( GREATER-THAN ?auto_1259 ?auto_1258 ) ( IN-CITY ?auto_1262 ?auto_1261 ) ( IN-CITY ?auto_1257 ?auto_1261 ) ( not ( = ?auto_1257 ?auto_1262 ) ) ( OBJ-AT ?auto_1259 ?auto_1262 ) ( IN-CITY ?auto_1260 ?auto_1261 ) ( not ( = ?auto_1257 ?auto_1260 ) ) ( OBJ-AT ?auto_1258 ?auto_1260 ) ( OBJ-AT ?auto_1256 ?auto_1260 ) ( not ( = ?auto_1256 ?auto_1258 ) ) ( not ( = ?auto_1256 ?auto_1259 ) ) ( not ( = ?auto_1258 ?auto_1259 ) ) ( not ( = ?auto_1262 ?auto_1260 ) ) ( TRUCK-AT ?auto_1263 ?auto_1257 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1263 ?auto_1257 ?auto_1260 ?auto_1261 )
      ( DELIVER-3PKG ?auto_1256 ?auto_1258 ?auto_1259 ?auto_1257 )
      ( DELIVER-3PKG-VERIFY ?auto_1256 ?auto_1258 ?auto_1259 ?auto_1257 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1266 - OBJ
      ?auto_1267 - LOCATION
    )
    :vars
    (
      ?auto_1268 - TRUCK
      ?auto_1269 - LOCATION
      ?auto_1270 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1268 ?auto_1269 ) ( IN-CITY ?auto_1269 ?auto_1270 ) ( IN-CITY ?auto_1267 ?auto_1270 ) ( not ( = ?auto_1267 ?auto_1269 ) ) ( OBJ-AT ?auto_1266 ?auto_1269 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1266 ?auto_1268 ?auto_1269 )
      ( !DRIVE-TRUCK ?auto_1268 ?auto_1269 ?auto_1267 ?auto_1270 )
      ( !UNLOAD-TRUCK ?auto_1266 ?auto_1268 ?auto_1267 )
      ( DELIVER-1PKG-VERIFY ?auto_1266 ?auto_1267 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1273 - OBJ
      ?auto_1274 - LOCATION
    )
    :vars
    (
      ?auto_1277 - LOCATION
      ?auto_1276 - CITY
      ?auto_1275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1277 ?auto_1276 ) ( IN-CITY ?auto_1274 ?auto_1276 ) ( not ( = ?auto_1274 ?auto_1277 ) ) ( OBJ-AT ?auto_1273 ?auto_1277 ) ( TRUCK-AT ?auto_1275 ?auto_1274 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1275 ?auto_1274 ?auto_1277 ?auto_1276 )
      ( DELIVER-1PKG ?auto_1273 ?auto_1274 )
      ( DELIVER-1PKG-VERIFY ?auto_1273 ?auto_1274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1283 - OBJ
      ?auto_1285 - OBJ
      ?auto_1286 - OBJ
      ?auto_1287 - OBJ
      ?auto_1284 - LOCATION
    )
    :vars
    (
      ?auto_1290 - LOCATION
      ?auto_1288 - CITY
      ?auto_1291 - LOCATION
      ?auto_1289 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1285 ?auto_1283 ) ( GREATER-THAN ?auto_1286 ?auto_1283 ) ( GREATER-THAN ?auto_1286 ?auto_1285 ) ( GREATER-THAN ?auto_1287 ?auto_1283 ) ( GREATER-THAN ?auto_1287 ?auto_1285 ) ( GREATER-THAN ?auto_1287 ?auto_1286 ) ( IN-CITY ?auto_1290 ?auto_1288 ) ( IN-CITY ?auto_1284 ?auto_1288 ) ( not ( = ?auto_1284 ?auto_1290 ) ) ( OBJ-AT ?auto_1287 ?auto_1290 ) ( IN-CITY ?auto_1291 ?auto_1288 ) ( not ( = ?auto_1284 ?auto_1291 ) ) ( OBJ-AT ?auto_1286 ?auto_1291 ) ( OBJ-AT ?auto_1285 ?auto_1290 ) ( TRUCK-AT ?auto_1289 ?auto_1290 ) ( OBJ-AT ?auto_1283 ?auto_1290 ) ( not ( = ?auto_1283 ?auto_1285 ) ) ( not ( = ?auto_1283 ?auto_1286 ) ) ( not ( = ?auto_1285 ?auto_1286 ) ) ( not ( = ?auto_1291 ?auto_1290 ) ) ( not ( = ?auto_1283 ?auto_1287 ) ) ( not ( = ?auto_1285 ?auto_1287 ) ) ( not ( = ?auto_1286 ?auto_1287 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1283 ?auto_1285 ?auto_1286 ?auto_1284 )
      ( DELIVER-1PKG ?auto_1287 ?auto_1284 )
      ( DELIVER-4PKG-VERIFY ?auto_1283 ?auto_1285 ?auto_1286 ?auto_1287 ?auto_1284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1297 - OBJ
      ?auto_1299 - OBJ
      ?auto_1300 - OBJ
      ?auto_1301 - OBJ
      ?auto_1298 - LOCATION
    )
    :vars
    (
      ?auto_1305 - LOCATION
      ?auto_1303 - CITY
      ?auto_1304 - LOCATION
      ?auto_1302 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1299 ?auto_1297 ) ( GREATER-THAN ?auto_1300 ?auto_1297 ) ( GREATER-THAN ?auto_1300 ?auto_1299 ) ( GREATER-THAN ?auto_1301 ?auto_1297 ) ( GREATER-THAN ?auto_1301 ?auto_1299 ) ( GREATER-THAN ?auto_1301 ?auto_1300 ) ( IN-CITY ?auto_1305 ?auto_1303 ) ( IN-CITY ?auto_1298 ?auto_1303 ) ( not ( = ?auto_1298 ?auto_1305 ) ) ( OBJ-AT ?auto_1301 ?auto_1305 ) ( IN-CITY ?auto_1304 ?auto_1303 ) ( not ( = ?auto_1298 ?auto_1304 ) ) ( OBJ-AT ?auto_1300 ?auto_1304 ) ( OBJ-AT ?auto_1299 ?auto_1305 ) ( OBJ-AT ?auto_1297 ?auto_1305 ) ( not ( = ?auto_1297 ?auto_1299 ) ) ( not ( = ?auto_1297 ?auto_1300 ) ) ( not ( = ?auto_1299 ?auto_1300 ) ) ( not ( = ?auto_1304 ?auto_1305 ) ) ( not ( = ?auto_1297 ?auto_1301 ) ) ( not ( = ?auto_1299 ?auto_1301 ) ) ( not ( = ?auto_1300 ?auto_1301 ) ) ( TRUCK-AT ?auto_1302 ?auto_1298 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1302 ?auto_1298 ?auto_1305 ?auto_1303 )
      ( DELIVER-4PKG ?auto_1297 ?auto_1299 ?auto_1300 ?auto_1301 ?auto_1298 )
      ( DELIVER-4PKG-VERIFY ?auto_1297 ?auto_1299 ?auto_1300 ?auto_1301 ?auto_1298 ) )
  )

)

