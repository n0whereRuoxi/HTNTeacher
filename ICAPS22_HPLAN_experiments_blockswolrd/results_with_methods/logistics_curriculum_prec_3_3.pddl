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
      ?auto_1142 - OBJ
      ?auto_1141 - LOCATION
    )
    :vars
    (
      ?auto_1144 - LOCATION
      ?auto_1145 - CITY
      ?auto_1143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1144 ?auto_1145 ) ( IN-CITY ?auto_1141 ?auto_1145 ) ( not ( = ?auto_1141 ?auto_1144 ) ) ( OBJ-AT ?auto_1142 ?auto_1144 ) ( TRUCK-AT ?auto_1143 ?auto_1141 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1143 ?auto_1141 ?auto_1144 ?auto_1145 )
      ( !LOAD-TRUCK ?auto_1142 ?auto_1143 ?auto_1144 )
      ( !DRIVE-TRUCK ?auto_1143 ?auto_1144 ?auto_1141 ?auto_1145 )
      ( !UNLOAD-TRUCK ?auto_1142 ?auto_1143 ?auto_1141 )
      ( DELIVER-1PKG-VERIFY ?auto_1142 ?auto_1141 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1149 - OBJ
      ?auto_1148 - LOCATION
    )
    :vars
    (
      ?auto_1151 - LOCATION
      ?auto_1152 - CITY
      ?auto_1150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1151 ?auto_1152 ) ( IN-CITY ?auto_1148 ?auto_1152 ) ( not ( = ?auto_1148 ?auto_1151 ) ) ( OBJ-AT ?auto_1149 ?auto_1151 ) ( TRUCK-AT ?auto_1150 ?auto_1148 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1150 ?auto_1148 ?auto_1151 ?auto_1152 )
      ( !LOAD-TRUCK ?auto_1149 ?auto_1150 ?auto_1151 )
      ( !DRIVE-TRUCK ?auto_1150 ?auto_1151 ?auto_1148 ?auto_1152 )
      ( !UNLOAD-TRUCK ?auto_1149 ?auto_1150 ?auto_1148 )
      ( DELIVER-1PKG-VERIFY ?auto_1149 ?auto_1148 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1163 - OBJ
      ?auto_1164 - OBJ
      ?auto_1162 - LOCATION
    )
    :vars
    (
      ?auto_1167 - LOCATION
      ?auto_1165 - CITY
      ?auto_1166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1167 ?auto_1165 ) ( IN-CITY ?auto_1162 ?auto_1165 ) ( not ( = ?auto_1162 ?auto_1167 ) ) ( OBJ-AT ?auto_1164 ?auto_1167 ) ( OBJ-AT ?auto_1163 ?auto_1167 ) ( TRUCK-AT ?auto_1166 ?auto_1162 ) ( not ( = ?auto_1163 ?auto_1164 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1163 ?auto_1162 )
      ( DELIVER-1PKG ?auto_1164 ?auto_1162 )
      ( DELIVER-2PKG-VERIFY ?auto_1163 ?auto_1164 ?auto_1162 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1169 - OBJ
      ?auto_1170 - OBJ
      ?auto_1168 - LOCATION
    )
    :vars
    (
      ?auto_1171 - LOCATION
      ?auto_1173 - CITY
      ?auto_1172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1171 ?auto_1173 ) ( IN-CITY ?auto_1168 ?auto_1173 ) ( not ( = ?auto_1168 ?auto_1171 ) ) ( OBJ-AT ?auto_1169 ?auto_1171 ) ( OBJ-AT ?auto_1170 ?auto_1171 ) ( TRUCK-AT ?auto_1172 ?auto_1168 ) ( not ( = ?auto_1170 ?auto_1169 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1170 ?auto_1169 ?auto_1168 )
      ( DELIVER-2PKG-VERIFY ?auto_1169 ?auto_1170 ?auto_1168 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1184 - OBJ
      ?auto_1183 - LOCATION
    )
    :vars
    (
      ?auto_1186 - LOCATION
      ?auto_1187 - CITY
      ?auto_1185 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1186 ?auto_1187 ) ( IN-CITY ?auto_1183 ?auto_1187 ) ( not ( = ?auto_1183 ?auto_1186 ) ) ( OBJ-AT ?auto_1184 ?auto_1186 ) ( TRUCK-AT ?auto_1185 ?auto_1183 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1185 ?auto_1183 ?auto_1186 ?auto_1187 )
      ( !LOAD-TRUCK ?auto_1184 ?auto_1185 ?auto_1186 )
      ( !DRIVE-TRUCK ?auto_1185 ?auto_1186 ?auto_1183 ?auto_1187 )
      ( !UNLOAD-TRUCK ?auto_1184 ?auto_1185 ?auto_1183 )
      ( DELIVER-1PKG-VERIFY ?auto_1184 ?auto_1183 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1273 - OBJ
      ?auto_1274 - OBJ
      ?auto_1275 - OBJ
      ?auto_1272 - LOCATION
    )
    :vars
    (
      ?auto_1277 - LOCATION
      ?auto_1278 - CITY
      ?auto_1276 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1277 ?auto_1278 ) ( IN-CITY ?auto_1272 ?auto_1278 ) ( not ( = ?auto_1272 ?auto_1277 ) ) ( OBJ-AT ?auto_1275 ?auto_1277 ) ( OBJ-AT ?auto_1274 ?auto_1277 ) ( OBJ-AT ?auto_1273 ?auto_1277 ) ( TRUCK-AT ?auto_1276 ?auto_1272 ) ( not ( = ?auto_1273 ?auto_1274 ) ) ( not ( = ?auto_1273 ?auto_1275 ) ) ( not ( = ?auto_1274 ?auto_1275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1274 ?auto_1273 ?auto_1272 )
      ( DELIVER-1PKG ?auto_1275 ?auto_1272 )
      ( DELIVER-3PKG-VERIFY ?auto_1273 ?auto_1274 ?auto_1275 ?auto_1272 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1288 - OBJ
      ?auto_1289 - OBJ
      ?auto_1290 - OBJ
      ?auto_1287 - LOCATION
    )
    :vars
    (
      ?auto_1293 - LOCATION
      ?auto_1292 - CITY
      ?auto_1291 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1293 ?auto_1292 ) ( IN-CITY ?auto_1287 ?auto_1292 ) ( not ( = ?auto_1287 ?auto_1293 ) ) ( OBJ-AT ?auto_1289 ?auto_1293 ) ( OBJ-AT ?auto_1290 ?auto_1293 ) ( OBJ-AT ?auto_1288 ?auto_1293 ) ( TRUCK-AT ?auto_1291 ?auto_1287 ) ( not ( = ?auto_1288 ?auto_1290 ) ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( not ( = ?auto_1290 ?auto_1289 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1288 ?auto_1290 ?auto_1289 ?auto_1287 )
      ( DELIVER-3PKG-VERIFY ?auto_1288 ?auto_1289 ?auto_1290 ?auto_1287 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1303 - OBJ
      ?auto_1304 - OBJ
      ?auto_1305 - OBJ
      ?auto_1302 - LOCATION
    )
    :vars
    (
      ?auto_1308 - LOCATION
      ?auto_1307 - CITY
      ?auto_1306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1308 ?auto_1307 ) ( IN-CITY ?auto_1302 ?auto_1307 ) ( not ( = ?auto_1302 ?auto_1308 ) ) ( OBJ-AT ?auto_1305 ?auto_1308 ) ( OBJ-AT ?auto_1303 ?auto_1308 ) ( OBJ-AT ?auto_1304 ?auto_1308 ) ( TRUCK-AT ?auto_1306 ?auto_1302 ) ( not ( = ?auto_1304 ?auto_1303 ) ) ( not ( = ?auto_1304 ?auto_1305 ) ) ( not ( = ?auto_1303 ?auto_1305 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1304 ?auto_1305 ?auto_1303 ?auto_1302 )
      ( DELIVER-3PKG-VERIFY ?auto_1303 ?auto_1304 ?auto_1305 ?auto_1302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1318 - OBJ
      ?auto_1319 - OBJ
      ?auto_1320 - OBJ
      ?auto_1317 - LOCATION
    )
    :vars
    (
      ?auto_1323 - LOCATION
      ?auto_1322 - CITY
      ?auto_1321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1323 ?auto_1322 ) ( IN-CITY ?auto_1317 ?auto_1322 ) ( not ( = ?auto_1317 ?auto_1323 ) ) ( OBJ-AT ?auto_1319 ?auto_1323 ) ( OBJ-AT ?auto_1318 ?auto_1323 ) ( OBJ-AT ?auto_1320 ?auto_1323 ) ( TRUCK-AT ?auto_1321 ?auto_1317 ) ( not ( = ?auto_1320 ?auto_1318 ) ) ( not ( = ?auto_1320 ?auto_1319 ) ) ( not ( = ?auto_1318 ?auto_1319 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1320 ?auto_1319 ?auto_1318 ?auto_1317 )
      ( DELIVER-3PKG-VERIFY ?auto_1318 ?auto_1319 ?auto_1320 ?auto_1317 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1349 - OBJ
      ?auto_1350 - OBJ
      ?auto_1351 - OBJ
      ?auto_1348 - LOCATION
    )
    :vars
    (
      ?auto_1354 - LOCATION
      ?auto_1353 - CITY
      ?auto_1352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1354 ?auto_1353 ) ( IN-CITY ?auto_1348 ?auto_1353 ) ( not ( = ?auto_1348 ?auto_1354 ) ) ( OBJ-AT ?auto_1349 ?auto_1354 ) ( OBJ-AT ?auto_1351 ?auto_1354 ) ( OBJ-AT ?auto_1350 ?auto_1354 ) ( TRUCK-AT ?auto_1352 ?auto_1348 ) ( not ( = ?auto_1350 ?auto_1351 ) ) ( not ( = ?auto_1350 ?auto_1349 ) ) ( not ( = ?auto_1351 ?auto_1349 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1350 ?auto_1349 ?auto_1351 ?auto_1348 )
      ( DELIVER-3PKG-VERIFY ?auto_1349 ?auto_1350 ?auto_1351 ?auto_1348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1364 - OBJ
      ?auto_1365 - OBJ
      ?auto_1366 - OBJ
      ?auto_1363 - LOCATION
    )
    :vars
    (
      ?auto_1369 - LOCATION
      ?auto_1368 - CITY
      ?auto_1367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1369 ?auto_1368 ) ( IN-CITY ?auto_1363 ?auto_1368 ) ( not ( = ?auto_1363 ?auto_1369 ) ) ( OBJ-AT ?auto_1364 ?auto_1369 ) ( OBJ-AT ?auto_1365 ?auto_1369 ) ( OBJ-AT ?auto_1366 ?auto_1369 ) ( TRUCK-AT ?auto_1367 ?auto_1363 ) ( not ( = ?auto_1366 ?auto_1365 ) ) ( not ( = ?auto_1366 ?auto_1364 ) ) ( not ( = ?auto_1365 ?auto_1364 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1366 ?auto_1364 ?auto_1365 ?auto_1363 )
      ( DELIVER-3PKG-VERIFY ?auto_1364 ?auto_1365 ?auto_1366 ?auto_1363 ) )
  )

)

