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
      ?auto_1232 - OBJ
      ?auto_1233 - LOCATION
    )
    :vars
    (
      ?auto_1242 - LOCATION
      ?auto_1239 - CITY
      ?auto_1234 - TRUCK
      ?auto_1245 - LOCATION
      ?auto_1246 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1242 ?auto_1239 ) ( IN-CITY ?auto_1233 ?auto_1239 ) ( not ( = ?auto_1233 ?auto_1242 ) ) ( OBJ-AT ?auto_1232 ?auto_1242 ) ( TRUCK-AT ?auto_1234 ?auto_1245 ) ( IN-CITY ?auto_1245 ?auto_1246 ) ( IN-CITY ?auto_1242 ?auto_1246 ) ( not ( = ?auto_1242 ?auto_1245 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1234 ?auto_1245 ?auto_1242 ?auto_1246 )
      ( !LOAD-TRUCK ?auto_1232 ?auto_1234 ?auto_1242 )
      ( !DRIVE-TRUCK ?auto_1234 ?auto_1242 ?auto_1233 ?auto_1239 )
      ( !UNLOAD-TRUCK ?auto_1232 ?auto_1234 ?auto_1233 )
      ( DELIVER-1PKG-VERIFY ?auto_1232 ?auto_1233 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1269 - OBJ
      ?auto_1271 - OBJ
      ?auto_1276 - LOCATION
    )
    :vars
    (
      ?auto_1272 - LOCATION
      ?auto_1277 - CITY
      ?auto_1278 - CITY
      ?auto_1279 - LOCATION
      ?auto_1285 - CITY
      ?auto_1274 - TRUCK
      ?auto_1282 - LOCATION
      ?auto_1280 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1271 ?auto_1269 ) ( IN-CITY ?auto_1272 ?auto_1277 ) ( IN-CITY ?auto_1276 ?auto_1277 ) ( not ( = ?auto_1276 ?auto_1272 ) ) ( OBJ-AT ?auto_1271 ?auto_1272 ) ( IN-CITY ?auto_1276 ?auto_1278 ) ( IN-CITY ?auto_1272 ?auto_1278 ) ( IN-CITY ?auto_1279 ?auto_1285 ) ( IN-CITY ?auto_1276 ?auto_1285 ) ( not ( = ?auto_1276 ?auto_1279 ) ) ( OBJ-AT ?auto_1269 ?auto_1279 ) ( TRUCK-AT ?auto_1274 ?auto_1282 ) ( IN-CITY ?auto_1282 ?auto_1280 ) ( IN-CITY ?auto_1279 ?auto_1280 ) ( not ( = ?auto_1279 ?auto_1282 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1269 ?auto_1276 )
      ( DELIVER-1PKG ?auto_1271 ?auto_1276 )
      ( DELIVER-2PKG-VERIFY ?auto_1269 ?auto_1271 ?auto_1276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1308 - OBJ
      ?auto_1310 - OBJ
      ?auto_1311 - OBJ
      ?auto_1313 - LOCATION
    )
    :vars
    (
      ?auto_1312 - LOCATION
      ?auto_1315 - CITY
      ?auto_1316 - CITY
      ?auto_1320 - LOCATION
      ?auto_1329 - CITY
      ?auto_1321 - CITY
      ?auto_1326 - LOCATION
      ?auto_1327 - CITY
      ?auto_1317 - TRUCK
      ?auto_1328 - LOCATION
      ?auto_1325 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1310 ?auto_1308 ) ( GREATER-THAN ?auto_1311 ?auto_1308 ) ( GREATER-THAN ?auto_1311 ?auto_1310 ) ( IN-CITY ?auto_1312 ?auto_1315 ) ( IN-CITY ?auto_1313 ?auto_1315 ) ( not ( = ?auto_1313 ?auto_1312 ) ) ( OBJ-AT ?auto_1311 ?auto_1312 ) ( IN-CITY ?auto_1313 ?auto_1316 ) ( IN-CITY ?auto_1312 ?auto_1316 ) ( IN-CITY ?auto_1320 ?auto_1329 ) ( IN-CITY ?auto_1313 ?auto_1329 ) ( not ( = ?auto_1313 ?auto_1320 ) ) ( OBJ-AT ?auto_1310 ?auto_1320 ) ( IN-CITY ?auto_1313 ?auto_1321 ) ( IN-CITY ?auto_1320 ?auto_1321 ) ( IN-CITY ?auto_1326 ?auto_1327 ) ( IN-CITY ?auto_1313 ?auto_1327 ) ( not ( = ?auto_1313 ?auto_1326 ) ) ( OBJ-AT ?auto_1308 ?auto_1326 ) ( TRUCK-AT ?auto_1317 ?auto_1328 ) ( IN-CITY ?auto_1328 ?auto_1325 ) ( IN-CITY ?auto_1326 ?auto_1325 ) ( not ( = ?auto_1326 ?auto_1328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1308 ?auto_1310 ?auto_1313 )
      ( DELIVER-1PKG ?auto_1311 ?auto_1313 )
      ( DELIVER-3PKG-VERIFY ?auto_1308 ?auto_1310 ?auto_1311 ?auto_1313 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1353 - OBJ
      ?auto_1355 - OBJ
      ?auto_1356 - OBJ
      ?auto_1357 - OBJ
      ?auto_1362 - LOCATION
    )
    :vars
    (
      ?auto_1358 - LOCATION
      ?auto_1359 - CITY
      ?auto_1364 - CITY
      ?auto_1377 - LOCATION
      ?auto_1369 - CITY
      ?auto_1368 - CITY
      ?auto_1374 - LOCATION
      ?auto_1366 - CITY
      ?auto_1373 - CITY
      ?auto_1376 - LOCATION
      ?auto_1371 - CITY
      ?auto_1363 - TRUCK
      ?auto_1370 - LOCATION
      ?auto_1375 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1355 ?auto_1353 ) ( GREATER-THAN ?auto_1356 ?auto_1353 ) ( GREATER-THAN ?auto_1356 ?auto_1355 ) ( GREATER-THAN ?auto_1357 ?auto_1353 ) ( GREATER-THAN ?auto_1357 ?auto_1355 ) ( GREATER-THAN ?auto_1357 ?auto_1356 ) ( IN-CITY ?auto_1358 ?auto_1359 ) ( IN-CITY ?auto_1362 ?auto_1359 ) ( not ( = ?auto_1362 ?auto_1358 ) ) ( OBJ-AT ?auto_1357 ?auto_1358 ) ( IN-CITY ?auto_1362 ?auto_1364 ) ( IN-CITY ?auto_1358 ?auto_1364 ) ( IN-CITY ?auto_1377 ?auto_1369 ) ( IN-CITY ?auto_1362 ?auto_1369 ) ( not ( = ?auto_1362 ?auto_1377 ) ) ( OBJ-AT ?auto_1356 ?auto_1377 ) ( IN-CITY ?auto_1362 ?auto_1368 ) ( IN-CITY ?auto_1377 ?auto_1368 ) ( IN-CITY ?auto_1374 ?auto_1366 ) ( IN-CITY ?auto_1362 ?auto_1366 ) ( not ( = ?auto_1362 ?auto_1374 ) ) ( OBJ-AT ?auto_1355 ?auto_1374 ) ( IN-CITY ?auto_1362 ?auto_1373 ) ( IN-CITY ?auto_1374 ?auto_1373 ) ( IN-CITY ?auto_1376 ?auto_1371 ) ( IN-CITY ?auto_1362 ?auto_1371 ) ( not ( = ?auto_1362 ?auto_1376 ) ) ( OBJ-AT ?auto_1353 ?auto_1376 ) ( TRUCK-AT ?auto_1363 ?auto_1370 ) ( IN-CITY ?auto_1370 ?auto_1375 ) ( IN-CITY ?auto_1376 ?auto_1375 ) ( not ( = ?auto_1376 ?auto_1370 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1353 ?auto_1355 ?auto_1356 ?auto_1362 )
      ( DELIVER-1PKG ?auto_1357 ?auto_1362 )
      ( DELIVER-4PKG-VERIFY ?auto_1353 ?auto_1355 ?auto_1356 ?auto_1357 ?auto_1362 ) )
  )

)

