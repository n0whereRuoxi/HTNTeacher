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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1184 - OBJ
      ?auto_1185 - LOCATION
    )
    :vars
    (
      ?auto_1186 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1186 ?auto_1185 ) ( IN-TRUCK ?auto_1184 ?auto_1186 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1184 ?auto_1186 ?auto_1185 )
      ( DELIVER-1PKG-VERIFY ?auto_1184 ?auto_1185 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1189 - OBJ
      ?auto_1190 - LOCATION
    )
    :vars
    (
      ?auto_1191 - TRUCK
      ?auto_1192 - LOCATION
      ?auto_1193 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1189 ?auto_1191 ) ( TRUCK-AT ?auto_1191 ?auto_1192 ) ( IN-CITY ?auto_1192 ?auto_1193 ) ( IN-CITY ?auto_1190 ?auto_1193 ) ( not ( = ?auto_1190 ?auto_1192 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1191 ?auto_1192 ?auto_1190 ?auto_1193 )
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
      ?auto_1200 - TRUCK
      ?auto_1199 - LOCATION
      ?auto_1198 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1200 ?auto_1199 ) ( IN-CITY ?auto_1199 ?auto_1198 ) ( IN-CITY ?auto_1197 ?auto_1198 ) ( not ( = ?auto_1197 ?auto_1199 ) ) ( OBJ-AT ?auto_1196 ?auto_1199 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1196 ?auto_1200 ?auto_1199 )
      ( DELIVER-1PKG ?auto_1196 ?auto_1197 )
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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1210 - OBJ
      ?auto_1211 - LOCATION
    )
    :vars
    (
      ?auto_1212 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1212 ?auto_1211 ) ( IN-TRUCK ?auto_1210 ?auto_1212 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1210 ?auto_1212 ?auto_1211 )
      ( DELIVER-1PKG-VERIFY ?auto_1210 ?auto_1211 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1215 - OBJ
      ?auto_1216 - LOCATION
    )
    :vars
    (
      ?auto_1217 - TRUCK
      ?auto_1218 - LOCATION
      ?auto_1219 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1215 ?auto_1217 ) ( TRUCK-AT ?auto_1217 ?auto_1218 ) ( IN-CITY ?auto_1218 ?auto_1219 ) ( IN-CITY ?auto_1216 ?auto_1219 ) ( not ( = ?auto_1216 ?auto_1218 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1217 ?auto_1218 ?auto_1216 ?auto_1219 )
      ( DELIVER-1PKG ?auto_1215 ?auto_1216 )
      ( DELIVER-1PKG-VERIFY ?auto_1215 ?auto_1216 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1222 - OBJ
      ?auto_1223 - LOCATION
    )
    :vars
    (
      ?auto_1226 - TRUCK
      ?auto_1224 - LOCATION
      ?auto_1225 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1226 ?auto_1224 ) ( IN-CITY ?auto_1224 ?auto_1225 ) ( IN-CITY ?auto_1223 ?auto_1225 ) ( not ( = ?auto_1223 ?auto_1224 ) ) ( OBJ-AT ?auto_1222 ?auto_1224 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1222 ?auto_1226 ?auto_1224 )
      ( DELIVER-1PKG ?auto_1222 ?auto_1223 )
      ( DELIVER-1PKG-VERIFY ?auto_1222 ?auto_1223 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1229 - OBJ
      ?auto_1230 - LOCATION
    )
    :vars
    (
      ?auto_1232 - LOCATION
      ?auto_1233 - CITY
      ?auto_1231 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1232 ?auto_1233 ) ( IN-CITY ?auto_1230 ?auto_1233 ) ( not ( = ?auto_1230 ?auto_1232 ) ) ( OBJ-AT ?auto_1229 ?auto_1232 ) ( TRUCK-AT ?auto_1231 ?auto_1230 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1231 ?auto_1230 ?auto_1232 ?auto_1233 )
      ( DELIVER-1PKG ?auto_1229 ?auto_1230 )
      ( DELIVER-1PKG-VERIFY ?auto_1229 ?auto_1230 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1237 - OBJ
      ?auto_1239 - OBJ
      ?auto_1238 - LOCATION
    )
    :vars
    (
      ?auto_1240 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1239 ?auto_1237 ) ( TRUCK-AT ?auto_1240 ?auto_1238 ) ( IN-TRUCK ?auto_1239 ?auto_1240 ) ( OBJ-AT ?auto_1237 ?auto_1238 ) ( not ( = ?auto_1237 ?auto_1239 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1239 ?auto_1238 )
      ( DELIVER-2PKG-VERIFY ?auto_1237 ?auto_1239 ?auto_1238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1244 - OBJ
      ?auto_1246 - OBJ
      ?auto_1245 - LOCATION
    )
    :vars
    (
      ?auto_1249 - TRUCK
      ?auto_1247 - LOCATION
      ?auto_1248 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1246 ?auto_1244 ) ( IN-TRUCK ?auto_1246 ?auto_1249 ) ( TRUCK-AT ?auto_1249 ?auto_1247 ) ( IN-CITY ?auto_1247 ?auto_1248 ) ( IN-CITY ?auto_1245 ?auto_1248 ) ( not ( = ?auto_1245 ?auto_1247 ) ) ( OBJ-AT ?auto_1244 ?auto_1245 ) ( not ( = ?auto_1244 ?auto_1246 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1246 ?auto_1245 )
      ( DELIVER-2PKG-VERIFY ?auto_1244 ?auto_1246 ?auto_1245 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1253 - OBJ
      ?auto_1255 - OBJ
      ?auto_1254 - LOCATION
    )
    :vars
    (
      ?auto_1256 - TRUCK
      ?auto_1257 - LOCATION
      ?auto_1258 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1255 ?auto_1253 ) ( TRUCK-AT ?auto_1256 ?auto_1257 ) ( IN-CITY ?auto_1257 ?auto_1258 ) ( IN-CITY ?auto_1254 ?auto_1258 ) ( not ( = ?auto_1254 ?auto_1257 ) ) ( OBJ-AT ?auto_1255 ?auto_1257 ) ( OBJ-AT ?auto_1253 ?auto_1254 ) ( not ( = ?auto_1253 ?auto_1255 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1255 ?auto_1254 )
      ( DELIVER-2PKG-VERIFY ?auto_1253 ?auto_1255 ?auto_1254 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1262 - OBJ
      ?auto_1264 - OBJ
      ?auto_1263 - LOCATION
    )
    :vars
    (
      ?auto_1265 - LOCATION
      ?auto_1266 - CITY
      ?auto_1267 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1264 ?auto_1262 ) ( IN-CITY ?auto_1265 ?auto_1266 ) ( IN-CITY ?auto_1263 ?auto_1266 ) ( not ( = ?auto_1263 ?auto_1265 ) ) ( OBJ-AT ?auto_1264 ?auto_1265 ) ( TRUCK-AT ?auto_1267 ?auto_1263 ) ( OBJ-AT ?auto_1262 ?auto_1263 ) ( not ( = ?auto_1262 ?auto_1264 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1264 ?auto_1263 )
      ( DELIVER-2PKG-VERIFY ?auto_1262 ?auto_1264 ?auto_1263 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1271 - OBJ
      ?auto_1273 - OBJ
      ?auto_1272 - LOCATION
    )
    :vars
    (
      ?auto_1276 - LOCATION
      ?auto_1275 - CITY
      ?auto_1274 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1273 ?auto_1271 ) ( IN-CITY ?auto_1276 ?auto_1275 ) ( IN-CITY ?auto_1272 ?auto_1275 ) ( not ( = ?auto_1272 ?auto_1276 ) ) ( OBJ-AT ?auto_1273 ?auto_1276 ) ( TRUCK-AT ?auto_1274 ?auto_1272 ) ( not ( = ?auto_1271 ?auto_1273 ) ) ( IN-TRUCK ?auto_1271 ?auto_1274 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1271 ?auto_1272 )
      ( DELIVER-2PKG ?auto_1271 ?auto_1273 ?auto_1272 )
      ( DELIVER-2PKG-VERIFY ?auto_1271 ?auto_1273 ?auto_1272 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1280 - OBJ
      ?auto_1282 - OBJ
      ?auto_1281 - LOCATION
    )
    :vars
    (
      ?auto_1285 - LOCATION
      ?auto_1284 - CITY
      ?auto_1283 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1282 ?auto_1280 ) ( IN-CITY ?auto_1285 ?auto_1284 ) ( IN-CITY ?auto_1281 ?auto_1284 ) ( not ( = ?auto_1281 ?auto_1285 ) ) ( OBJ-AT ?auto_1282 ?auto_1285 ) ( not ( = ?auto_1280 ?auto_1282 ) ) ( IN-TRUCK ?auto_1280 ?auto_1283 ) ( TRUCK-AT ?auto_1283 ?auto_1285 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1283 ?auto_1285 ?auto_1281 ?auto_1284 )
      ( DELIVER-2PKG ?auto_1280 ?auto_1282 ?auto_1281 )
      ( DELIVER-2PKG-VERIFY ?auto_1280 ?auto_1282 ?auto_1281 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1289 - OBJ
      ?auto_1291 - OBJ
      ?auto_1290 - LOCATION
    )
    :vars
    (
      ?auto_1292 - LOCATION
      ?auto_1294 - CITY
      ?auto_1293 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1291 ?auto_1289 ) ( IN-CITY ?auto_1292 ?auto_1294 ) ( IN-CITY ?auto_1290 ?auto_1294 ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( OBJ-AT ?auto_1291 ?auto_1292 ) ( not ( = ?auto_1289 ?auto_1291 ) ) ( TRUCK-AT ?auto_1293 ?auto_1292 ) ( OBJ-AT ?auto_1289 ?auto_1292 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1289 ?auto_1293 ?auto_1292 )
      ( DELIVER-2PKG ?auto_1289 ?auto_1291 ?auto_1290 )
      ( DELIVER-2PKG-VERIFY ?auto_1289 ?auto_1291 ?auto_1290 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1298 - OBJ
      ?auto_1300 - OBJ
      ?auto_1299 - LOCATION
    )
    :vars
    (
      ?auto_1303 - LOCATION
      ?auto_1301 - CITY
      ?auto_1302 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1300 ?auto_1298 ) ( IN-CITY ?auto_1303 ?auto_1301 ) ( IN-CITY ?auto_1299 ?auto_1301 ) ( not ( = ?auto_1299 ?auto_1303 ) ) ( OBJ-AT ?auto_1300 ?auto_1303 ) ( not ( = ?auto_1298 ?auto_1300 ) ) ( OBJ-AT ?auto_1298 ?auto_1303 ) ( TRUCK-AT ?auto_1302 ?auto_1299 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1302 ?auto_1299 ?auto_1303 ?auto_1301 )
      ( DELIVER-2PKG ?auto_1298 ?auto_1300 ?auto_1299 )
      ( DELIVER-2PKG-VERIFY ?auto_1298 ?auto_1300 ?auto_1299 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1306 - OBJ
      ?auto_1307 - LOCATION
    )
    :vars
    (
      ?auto_1308 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1308 ?auto_1307 ) ( IN-TRUCK ?auto_1306 ?auto_1308 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1306 ?auto_1308 ?auto_1307 )
      ( DELIVER-1PKG-VERIFY ?auto_1306 ?auto_1307 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1311 - OBJ
      ?auto_1312 - LOCATION
    )
    :vars
    (
      ?auto_1313 - TRUCK
      ?auto_1314 - LOCATION
      ?auto_1315 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1311 ?auto_1313 ) ( TRUCK-AT ?auto_1313 ?auto_1314 ) ( IN-CITY ?auto_1314 ?auto_1315 ) ( IN-CITY ?auto_1312 ?auto_1315 ) ( not ( = ?auto_1312 ?auto_1314 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1313 ?auto_1314 ?auto_1312 ?auto_1315 )
      ( DELIVER-1PKG ?auto_1311 ?auto_1312 )
      ( DELIVER-1PKG-VERIFY ?auto_1311 ?auto_1312 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1318 - OBJ
      ?auto_1319 - LOCATION
    )
    :vars
    (
      ?auto_1322 - TRUCK
      ?auto_1320 - LOCATION
      ?auto_1321 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1322 ?auto_1320 ) ( IN-CITY ?auto_1320 ?auto_1321 ) ( IN-CITY ?auto_1319 ?auto_1321 ) ( not ( = ?auto_1319 ?auto_1320 ) ) ( OBJ-AT ?auto_1318 ?auto_1320 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1318 ?auto_1322 ?auto_1320 )
      ( DELIVER-1PKG ?auto_1318 ?auto_1319 )
      ( DELIVER-1PKG-VERIFY ?auto_1318 ?auto_1319 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1325 - OBJ
      ?auto_1326 - LOCATION
    )
    :vars
    (
      ?auto_1327 - LOCATION
      ?auto_1328 - CITY
      ?auto_1329 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1327 ?auto_1328 ) ( IN-CITY ?auto_1326 ?auto_1328 ) ( not ( = ?auto_1326 ?auto_1327 ) ) ( OBJ-AT ?auto_1325 ?auto_1327 ) ( TRUCK-AT ?auto_1329 ?auto_1326 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1329 ?auto_1326 ?auto_1327 ?auto_1328 )
      ( DELIVER-1PKG ?auto_1325 ?auto_1326 )
      ( DELIVER-1PKG-VERIFY ?auto_1325 ?auto_1326 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1334 - OBJ
      ?auto_1336 - OBJ
      ?auto_1337 - OBJ
      ?auto_1335 - LOCATION
    )
    :vars
    (
      ?auto_1338 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1336 ?auto_1334 ) ( GREATER-THAN ?auto_1337 ?auto_1334 ) ( GREATER-THAN ?auto_1337 ?auto_1336 ) ( TRUCK-AT ?auto_1338 ?auto_1335 ) ( IN-TRUCK ?auto_1337 ?auto_1338 ) ( OBJ-AT ?auto_1334 ?auto_1335 ) ( OBJ-AT ?auto_1336 ?auto_1335 ) ( not ( = ?auto_1334 ?auto_1336 ) ) ( not ( = ?auto_1334 ?auto_1337 ) ) ( not ( = ?auto_1336 ?auto_1337 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1337 ?auto_1335 )
      ( DELIVER-3PKG-VERIFY ?auto_1334 ?auto_1336 ?auto_1337 ?auto_1335 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1343 - OBJ
      ?auto_1345 - OBJ
      ?auto_1346 - OBJ
      ?auto_1344 - LOCATION
    )
    :vars
    (
      ?auto_1349 - TRUCK
      ?auto_1347 - LOCATION
      ?auto_1348 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1345 ?auto_1343 ) ( GREATER-THAN ?auto_1346 ?auto_1343 ) ( GREATER-THAN ?auto_1346 ?auto_1345 ) ( IN-TRUCK ?auto_1346 ?auto_1349 ) ( TRUCK-AT ?auto_1349 ?auto_1347 ) ( IN-CITY ?auto_1347 ?auto_1348 ) ( IN-CITY ?auto_1344 ?auto_1348 ) ( not ( = ?auto_1344 ?auto_1347 ) ) ( OBJ-AT ?auto_1343 ?auto_1344 ) ( OBJ-AT ?auto_1345 ?auto_1344 ) ( not ( = ?auto_1343 ?auto_1345 ) ) ( not ( = ?auto_1343 ?auto_1346 ) ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1346 ?auto_1344 )
      ( DELIVER-3PKG-VERIFY ?auto_1343 ?auto_1345 ?auto_1346 ?auto_1344 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1354 - OBJ
      ?auto_1356 - OBJ
      ?auto_1357 - OBJ
      ?auto_1355 - LOCATION
    )
    :vars
    (
      ?auto_1360 - TRUCK
      ?auto_1358 - LOCATION
      ?auto_1359 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1356 ?auto_1354 ) ( GREATER-THAN ?auto_1357 ?auto_1354 ) ( GREATER-THAN ?auto_1357 ?auto_1356 ) ( TRUCK-AT ?auto_1360 ?auto_1358 ) ( IN-CITY ?auto_1358 ?auto_1359 ) ( IN-CITY ?auto_1355 ?auto_1359 ) ( not ( = ?auto_1355 ?auto_1358 ) ) ( OBJ-AT ?auto_1357 ?auto_1358 ) ( OBJ-AT ?auto_1354 ?auto_1355 ) ( OBJ-AT ?auto_1356 ?auto_1355 ) ( not ( = ?auto_1354 ?auto_1356 ) ) ( not ( = ?auto_1354 ?auto_1357 ) ) ( not ( = ?auto_1356 ?auto_1357 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1357 ?auto_1355 )
      ( DELIVER-3PKG-VERIFY ?auto_1354 ?auto_1356 ?auto_1357 ?auto_1355 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1365 - OBJ
      ?auto_1367 - OBJ
      ?auto_1368 - OBJ
      ?auto_1366 - LOCATION
    )
    :vars
    (
      ?auto_1369 - LOCATION
      ?auto_1370 - CITY
      ?auto_1371 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1367 ?auto_1365 ) ( GREATER-THAN ?auto_1368 ?auto_1365 ) ( GREATER-THAN ?auto_1368 ?auto_1367 ) ( IN-CITY ?auto_1369 ?auto_1370 ) ( IN-CITY ?auto_1366 ?auto_1370 ) ( not ( = ?auto_1366 ?auto_1369 ) ) ( OBJ-AT ?auto_1368 ?auto_1369 ) ( TRUCK-AT ?auto_1371 ?auto_1366 ) ( OBJ-AT ?auto_1365 ?auto_1366 ) ( OBJ-AT ?auto_1367 ?auto_1366 ) ( not ( = ?auto_1365 ?auto_1367 ) ) ( not ( = ?auto_1365 ?auto_1368 ) ) ( not ( = ?auto_1367 ?auto_1368 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1368 ?auto_1366 )
      ( DELIVER-3PKG-VERIFY ?auto_1365 ?auto_1367 ?auto_1368 ?auto_1366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1376 - OBJ
      ?auto_1378 - OBJ
      ?auto_1379 - OBJ
      ?auto_1377 - LOCATION
    )
    :vars
    (
      ?auto_1381 - LOCATION
      ?auto_1382 - CITY
      ?auto_1380 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1378 ?auto_1376 ) ( GREATER-THAN ?auto_1379 ?auto_1376 ) ( GREATER-THAN ?auto_1379 ?auto_1378 ) ( IN-CITY ?auto_1381 ?auto_1382 ) ( IN-CITY ?auto_1377 ?auto_1382 ) ( not ( = ?auto_1377 ?auto_1381 ) ) ( OBJ-AT ?auto_1379 ?auto_1381 ) ( TRUCK-AT ?auto_1380 ?auto_1377 ) ( OBJ-AT ?auto_1376 ?auto_1377 ) ( not ( = ?auto_1376 ?auto_1378 ) ) ( not ( = ?auto_1376 ?auto_1379 ) ) ( not ( = ?auto_1378 ?auto_1379 ) ) ( IN-TRUCK ?auto_1378 ?auto_1380 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1378 ?auto_1377 )
      ( DELIVER-3PKG ?auto_1376 ?auto_1378 ?auto_1379 ?auto_1377 )
      ( DELIVER-3PKG-VERIFY ?auto_1376 ?auto_1378 ?auto_1379 ?auto_1377 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1387 - OBJ
      ?auto_1389 - OBJ
      ?auto_1390 - OBJ
      ?auto_1388 - LOCATION
    )
    :vars
    (
      ?auto_1391 - LOCATION
      ?auto_1392 - CITY
      ?auto_1393 - TRUCK
      ?auto_1394 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1389 ?auto_1387 ) ( GREATER-THAN ?auto_1390 ?auto_1387 ) ( GREATER-THAN ?auto_1390 ?auto_1389 ) ( IN-CITY ?auto_1391 ?auto_1392 ) ( IN-CITY ?auto_1388 ?auto_1392 ) ( not ( = ?auto_1388 ?auto_1391 ) ) ( OBJ-AT ?auto_1390 ?auto_1391 ) ( OBJ-AT ?auto_1387 ?auto_1388 ) ( not ( = ?auto_1387 ?auto_1389 ) ) ( not ( = ?auto_1387 ?auto_1390 ) ) ( not ( = ?auto_1389 ?auto_1390 ) ) ( IN-TRUCK ?auto_1389 ?auto_1393 ) ( TRUCK-AT ?auto_1393 ?auto_1394 ) ( IN-CITY ?auto_1394 ?auto_1392 ) ( not ( = ?auto_1388 ?auto_1394 ) ) ( not ( = ?auto_1391 ?auto_1394 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1393 ?auto_1394 ?auto_1388 ?auto_1392 )
      ( DELIVER-3PKG ?auto_1387 ?auto_1389 ?auto_1390 ?auto_1388 )
      ( DELIVER-3PKG-VERIFY ?auto_1387 ?auto_1389 ?auto_1390 ?auto_1388 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1399 - OBJ
      ?auto_1401 - OBJ
      ?auto_1402 - OBJ
      ?auto_1400 - LOCATION
    )
    :vars
    (
      ?auto_1405 - LOCATION
      ?auto_1404 - CITY
      ?auto_1403 - TRUCK
      ?auto_1406 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1401 ?auto_1399 ) ( GREATER-THAN ?auto_1402 ?auto_1399 ) ( GREATER-THAN ?auto_1402 ?auto_1401 ) ( IN-CITY ?auto_1405 ?auto_1404 ) ( IN-CITY ?auto_1400 ?auto_1404 ) ( not ( = ?auto_1400 ?auto_1405 ) ) ( OBJ-AT ?auto_1402 ?auto_1405 ) ( OBJ-AT ?auto_1399 ?auto_1400 ) ( not ( = ?auto_1399 ?auto_1401 ) ) ( not ( = ?auto_1399 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( TRUCK-AT ?auto_1403 ?auto_1406 ) ( IN-CITY ?auto_1406 ?auto_1404 ) ( not ( = ?auto_1400 ?auto_1406 ) ) ( not ( = ?auto_1405 ?auto_1406 ) ) ( OBJ-AT ?auto_1401 ?auto_1406 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1401 ?auto_1403 ?auto_1406 )
      ( DELIVER-3PKG ?auto_1399 ?auto_1401 ?auto_1402 ?auto_1400 )
      ( DELIVER-3PKG-VERIFY ?auto_1399 ?auto_1401 ?auto_1402 ?auto_1400 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1411 - OBJ
      ?auto_1413 - OBJ
      ?auto_1414 - OBJ
      ?auto_1412 - LOCATION
    )
    :vars
    (
      ?auto_1418 - LOCATION
      ?auto_1416 - CITY
      ?auto_1415 - LOCATION
      ?auto_1417 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1413 ?auto_1411 ) ( GREATER-THAN ?auto_1414 ?auto_1411 ) ( GREATER-THAN ?auto_1414 ?auto_1413 ) ( IN-CITY ?auto_1418 ?auto_1416 ) ( IN-CITY ?auto_1412 ?auto_1416 ) ( not ( = ?auto_1412 ?auto_1418 ) ) ( OBJ-AT ?auto_1414 ?auto_1418 ) ( OBJ-AT ?auto_1411 ?auto_1412 ) ( not ( = ?auto_1411 ?auto_1413 ) ) ( not ( = ?auto_1411 ?auto_1414 ) ) ( not ( = ?auto_1413 ?auto_1414 ) ) ( IN-CITY ?auto_1415 ?auto_1416 ) ( not ( = ?auto_1412 ?auto_1415 ) ) ( not ( = ?auto_1418 ?auto_1415 ) ) ( OBJ-AT ?auto_1413 ?auto_1415 ) ( TRUCK-AT ?auto_1417 ?auto_1412 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1417 ?auto_1412 ?auto_1415 ?auto_1416 )
      ( DELIVER-3PKG ?auto_1411 ?auto_1413 ?auto_1414 ?auto_1412 )
      ( DELIVER-3PKG-VERIFY ?auto_1411 ?auto_1413 ?auto_1414 ?auto_1412 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1423 - OBJ
      ?auto_1425 - OBJ
      ?auto_1426 - OBJ
      ?auto_1424 - LOCATION
    )
    :vars
    (
      ?auto_1429 - LOCATION
      ?auto_1427 - CITY
      ?auto_1428 - LOCATION
      ?auto_1430 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1425 ?auto_1423 ) ( GREATER-THAN ?auto_1426 ?auto_1423 ) ( GREATER-THAN ?auto_1426 ?auto_1425 ) ( IN-CITY ?auto_1429 ?auto_1427 ) ( IN-CITY ?auto_1424 ?auto_1427 ) ( not ( = ?auto_1424 ?auto_1429 ) ) ( OBJ-AT ?auto_1426 ?auto_1429 ) ( not ( = ?auto_1423 ?auto_1425 ) ) ( not ( = ?auto_1423 ?auto_1426 ) ) ( not ( = ?auto_1425 ?auto_1426 ) ) ( IN-CITY ?auto_1428 ?auto_1427 ) ( not ( = ?auto_1424 ?auto_1428 ) ) ( not ( = ?auto_1429 ?auto_1428 ) ) ( OBJ-AT ?auto_1425 ?auto_1428 ) ( TRUCK-AT ?auto_1430 ?auto_1424 ) ( IN-TRUCK ?auto_1423 ?auto_1430 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1423 ?auto_1424 )
      ( DELIVER-3PKG ?auto_1423 ?auto_1425 ?auto_1426 ?auto_1424 )
      ( DELIVER-3PKG-VERIFY ?auto_1423 ?auto_1425 ?auto_1426 ?auto_1424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1435 - OBJ
      ?auto_1437 - OBJ
      ?auto_1438 - OBJ
      ?auto_1436 - LOCATION
    )
    :vars
    (
      ?auto_1441 - LOCATION
      ?auto_1442 - CITY
      ?auto_1440 - LOCATION
      ?auto_1439 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1437 ?auto_1435 ) ( GREATER-THAN ?auto_1438 ?auto_1435 ) ( GREATER-THAN ?auto_1438 ?auto_1437 ) ( IN-CITY ?auto_1441 ?auto_1442 ) ( IN-CITY ?auto_1436 ?auto_1442 ) ( not ( = ?auto_1436 ?auto_1441 ) ) ( OBJ-AT ?auto_1438 ?auto_1441 ) ( not ( = ?auto_1435 ?auto_1437 ) ) ( not ( = ?auto_1435 ?auto_1438 ) ) ( not ( = ?auto_1437 ?auto_1438 ) ) ( IN-CITY ?auto_1440 ?auto_1442 ) ( not ( = ?auto_1436 ?auto_1440 ) ) ( not ( = ?auto_1441 ?auto_1440 ) ) ( OBJ-AT ?auto_1437 ?auto_1440 ) ( IN-TRUCK ?auto_1435 ?auto_1439 ) ( TRUCK-AT ?auto_1439 ?auto_1440 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1439 ?auto_1440 ?auto_1436 ?auto_1442 )
      ( DELIVER-3PKG ?auto_1435 ?auto_1437 ?auto_1438 ?auto_1436 )
      ( DELIVER-3PKG-VERIFY ?auto_1435 ?auto_1437 ?auto_1438 ?auto_1436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1447 - OBJ
      ?auto_1449 - OBJ
      ?auto_1450 - OBJ
      ?auto_1448 - LOCATION
    )
    :vars
    (
      ?auto_1452 - LOCATION
      ?auto_1451 - CITY
      ?auto_1453 - LOCATION
      ?auto_1454 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1449 ?auto_1447 ) ( GREATER-THAN ?auto_1450 ?auto_1447 ) ( GREATER-THAN ?auto_1450 ?auto_1449 ) ( IN-CITY ?auto_1452 ?auto_1451 ) ( IN-CITY ?auto_1448 ?auto_1451 ) ( not ( = ?auto_1448 ?auto_1452 ) ) ( OBJ-AT ?auto_1450 ?auto_1452 ) ( not ( = ?auto_1447 ?auto_1449 ) ) ( not ( = ?auto_1447 ?auto_1450 ) ) ( not ( = ?auto_1449 ?auto_1450 ) ) ( IN-CITY ?auto_1453 ?auto_1451 ) ( not ( = ?auto_1448 ?auto_1453 ) ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( OBJ-AT ?auto_1449 ?auto_1453 ) ( TRUCK-AT ?auto_1454 ?auto_1453 ) ( OBJ-AT ?auto_1447 ?auto_1453 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1447 ?auto_1454 ?auto_1453 )
      ( DELIVER-3PKG ?auto_1447 ?auto_1449 ?auto_1450 ?auto_1448 )
      ( DELIVER-3PKG-VERIFY ?auto_1447 ?auto_1449 ?auto_1450 ?auto_1448 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1459 - OBJ
      ?auto_1461 - OBJ
      ?auto_1462 - OBJ
      ?auto_1460 - LOCATION
    )
    :vars
    (
      ?auto_1464 - LOCATION
      ?auto_1465 - CITY
      ?auto_1463 - LOCATION
      ?auto_1466 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1461 ?auto_1459 ) ( GREATER-THAN ?auto_1462 ?auto_1459 ) ( GREATER-THAN ?auto_1462 ?auto_1461 ) ( IN-CITY ?auto_1464 ?auto_1465 ) ( IN-CITY ?auto_1460 ?auto_1465 ) ( not ( = ?auto_1460 ?auto_1464 ) ) ( OBJ-AT ?auto_1462 ?auto_1464 ) ( not ( = ?auto_1459 ?auto_1461 ) ) ( not ( = ?auto_1459 ?auto_1462 ) ) ( not ( = ?auto_1461 ?auto_1462 ) ) ( IN-CITY ?auto_1463 ?auto_1465 ) ( not ( = ?auto_1460 ?auto_1463 ) ) ( not ( = ?auto_1464 ?auto_1463 ) ) ( OBJ-AT ?auto_1461 ?auto_1463 ) ( OBJ-AT ?auto_1459 ?auto_1463 ) ( TRUCK-AT ?auto_1466 ?auto_1460 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1466 ?auto_1460 ?auto_1463 ?auto_1465 )
      ( DELIVER-3PKG ?auto_1459 ?auto_1461 ?auto_1462 ?auto_1460 )
      ( DELIVER-3PKG-VERIFY ?auto_1459 ?auto_1461 ?auto_1462 ?auto_1460 ) )
  )

)

