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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1208 - OBJ
      ?auto_1209 - LOCATION
    )
    :vars
    (
      ?auto_1210 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1210 ?auto_1209 ) ( IN-TRUCK ?auto_1208 ?auto_1210 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1208 ?auto_1210 ?auto_1209 )
      ( DELIVER-1PKG-VERIFY ?auto_1208 ?auto_1209 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1219 - OBJ
      ?auto_1220 - LOCATION
    )
    :vars
    (
      ?auto_1222 - TRUCK
      ?auto_1225 - LOCATION
      ?auto_1226 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1219 ?auto_1222 ) ( TRUCK-AT ?auto_1222 ?auto_1225 ) ( IN-CITY ?auto_1225 ?auto_1226 ) ( IN-CITY ?auto_1220 ?auto_1226 ) ( not ( = ?auto_1220 ?auto_1225 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1222 ?auto_1225 ?auto_1220 ?auto_1226 )
      ( DELIVER-1PKG ?auto_1219 ?auto_1220 )
      ( DELIVER-1PKG-VERIFY ?auto_1219 ?auto_1220 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1236 - OBJ
      ?auto_1237 - LOCATION
    )
    :vars
    (
      ?auto_1240 - TRUCK
      ?auto_1239 - LOCATION
      ?auto_1241 - CITY
      ?auto_1244 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1240 ?auto_1239 ) ( IN-CITY ?auto_1239 ?auto_1241 ) ( IN-CITY ?auto_1237 ?auto_1241 ) ( not ( = ?auto_1237 ?auto_1239 ) ) ( TRUCK-AT ?auto_1240 ?auto_1244 ) ( OBJ-AT ?auto_1236 ?auto_1244 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1236 ?auto_1240 ?auto_1244 )
      ( DELIVER-1PKG ?auto_1236 ?auto_1237 )
      ( DELIVER-1PKG-VERIFY ?auto_1236 ?auto_1237 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1255 - OBJ
      ?auto_1256 - LOCATION
    )
    :vars
    (
      ?auto_1262 - LOCATION
      ?auto_1258 - CITY
      ?auto_1261 - TRUCK
      ?auto_1264 - LOCATION
      ?auto_1265 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1262 ?auto_1258 ) ( IN-CITY ?auto_1256 ?auto_1258 ) ( not ( = ?auto_1256 ?auto_1262 ) ) ( OBJ-AT ?auto_1255 ?auto_1262 ) ( TRUCK-AT ?auto_1261 ?auto_1264 ) ( IN-CITY ?auto_1264 ?auto_1265 ) ( IN-CITY ?auto_1262 ?auto_1265 ) ( not ( = ?auto_1262 ?auto_1264 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1261 ?auto_1264 ?auto_1262 ?auto_1265 )
      ( DELIVER-1PKG ?auto_1255 ?auto_1256 )
      ( DELIVER-1PKG-VERIFY ?auto_1255 ?auto_1256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1293 - OBJ
      ?auto_1295 - OBJ
      ?auto_1294 - LOCATION
    )
    :vars
    (
      ?auto_1298 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1295 ?auto_1293 ) ( TRUCK-AT ?auto_1298 ?auto_1294 ) ( IN-TRUCK ?auto_1295 ?auto_1298 ) ( OBJ-AT ?auto_1293 ?auto_1294 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1295 ?auto_1294 )
      ( DELIVER-2PKG-VERIFY ?auto_1293 ?auto_1295 ?auto_1294 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1320 - OBJ
      ?auto_1322 - OBJ
      ?auto_1321 - LOCATION
    )
    :vars
    (
      ?auto_1325 - TRUCK
      ?auto_1324 - LOCATION
      ?auto_1326 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1322 ?auto_1320 ) ( IN-TRUCK ?auto_1322 ?auto_1325 ) ( TRUCK-AT ?auto_1325 ?auto_1324 ) ( IN-CITY ?auto_1324 ?auto_1326 ) ( IN-CITY ?auto_1321 ?auto_1326 ) ( not ( = ?auto_1321 ?auto_1324 ) ) ( OBJ-AT ?auto_1320 ?auto_1321 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1322 ?auto_1321 )
      ( DELIVER-2PKG-VERIFY ?auto_1320 ?auto_1322 ?auto_1321 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1346 - OBJ
      ?auto_1347 - LOCATION
    )
    :vars
    (
      ?auto_1352 - OBJ
      ?auto_1349 - TRUCK
      ?auto_1350 - LOCATION
      ?auto_1348 - CITY
      ?auto_1355 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1346 ?auto_1352 ) ( TRUCK-AT ?auto_1349 ?auto_1350 ) ( IN-CITY ?auto_1350 ?auto_1348 ) ( IN-CITY ?auto_1347 ?auto_1348 ) ( not ( = ?auto_1347 ?auto_1350 ) ) ( OBJ-AT ?auto_1352 ?auto_1347 ) ( TRUCK-AT ?auto_1349 ?auto_1355 ) ( OBJ-AT ?auto_1346 ?auto_1355 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1346 ?auto_1349 ?auto_1355 )
      ( DELIVER-2PKG ?auto_1352 ?auto_1346 ?auto_1347 )
      ( DELIVER-1PKG-VERIFY ?auto_1346 ?auto_1347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1357 - OBJ
      ?auto_1359 - OBJ
      ?auto_1358 - LOCATION
    )
    :vars
    (
      ?auto_1365 - OBJ
      ?auto_1363 - TRUCK
      ?auto_1361 - LOCATION
      ?auto_1364 - CITY
      ?auto_1360 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1359 ?auto_1357 ) ( GREATER-THAN ?auto_1359 ?auto_1365 ) ( TRUCK-AT ?auto_1363 ?auto_1361 ) ( IN-CITY ?auto_1361 ?auto_1364 ) ( IN-CITY ?auto_1358 ?auto_1364 ) ( not ( = ?auto_1358 ?auto_1361 ) ) ( OBJ-AT ?auto_1365 ?auto_1358 ) ( TRUCK-AT ?auto_1363 ?auto_1360 ) ( OBJ-AT ?auto_1359 ?auto_1360 ) ( OBJ-AT ?auto_1357 ?auto_1358 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1359 ?auto_1358 )
      ( DELIVER-2PKG-VERIFY ?auto_1357 ?auto_1359 ?auto_1358 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1389 - OBJ
      ?auto_1390 - LOCATION
    )
    :vars
    (
      ?auto_1393 - OBJ
      ?auto_1394 - OBJ
      ?auto_1395 - LOCATION
      ?auto_1392 - CITY
      ?auto_1391 - TRUCK
      ?auto_1400 - LOCATION
      ?auto_1401 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1389 ?auto_1393 ) ( GREATER-THAN ?auto_1389 ?auto_1394 ) ( IN-CITY ?auto_1395 ?auto_1392 ) ( IN-CITY ?auto_1390 ?auto_1392 ) ( not ( = ?auto_1390 ?auto_1395 ) ) ( OBJ-AT ?auto_1394 ?auto_1390 ) ( OBJ-AT ?auto_1389 ?auto_1395 ) ( OBJ-AT ?auto_1393 ?auto_1390 ) ( TRUCK-AT ?auto_1391 ?auto_1400 ) ( IN-CITY ?auto_1400 ?auto_1401 ) ( IN-CITY ?auto_1395 ?auto_1401 ) ( not ( = ?auto_1395 ?auto_1400 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1391 ?auto_1400 ?auto_1395 ?auto_1401 )
      ( DELIVER-2PKG ?auto_1393 ?auto_1389 ?auto_1390 )
      ( DELIVER-1PKG-VERIFY ?auto_1389 ?auto_1390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1403 - OBJ
      ?auto_1405 - OBJ
      ?auto_1404 - LOCATION
    )
    :vars
    (
      ?auto_1409 - OBJ
      ?auto_1406 - OBJ
      ?auto_1413 - LOCATION
      ?auto_1414 - CITY
      ?auto_1411 - TRUCK
      ?auto_1412 - LOCATION
      ?auto_1410 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1405 ?auto_1403 ) ( GREATER-THAN ?auto_1405 ?auto_1409 ) ( GREATER-THAN ?auto_1405 ?auto_1406 ) ( IN-CITY ?auto_1413 ?auto_1414 ) ( IN-CITY ?auto_1404 ?auto_1414 ) ( not ( = ?auto_1404 ?auto_1413 ) ) ( OBJ-AT ?auto_1406 ?auto_1404 ) ( OBJ-AT ?auto_1405 ?auto_1413 ) ( OBJ-AT ?auto_1409 ?auto_1404 ) ( TRUCK-AT ?auto_1411 ?auto_1412 ) ( IN-CITY ?auto_1412 ?auto_1410 ) ( IN-CITY ?auto_1413 ?auto_1410 ) ( not ( = ?auto_1413 ?auto_1412 ) ) ( OBJ-AT ?auto_1403 ?auto_1404 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1405 ?auto_1404 )
      ( DELIVER-2PKG-VERIFY ?auto_1403 ?auto_1405 ?auto_1404 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1441 - OBJ
      ?auto_1442 - LOCATION
    )
    :vars
    (
      ?auto_1444 - OBJ
      ?auto_1448 - LOCATION
      ?auto_1449 - CITY
      ?auto_1451 - TRUCK
      ?auto_1452 - LOCATION
      ?auto_1450 - CITY
      ?auto_1454 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1441 ?auto_1444 ) ( IN-CITY ?auto_1448 ?auto_1449 ) ( IN-CITY ?auto_1442 ?auto_1449 ) ( not ( = ?auto_1442 ?auto_1448 ) ) ( OBJ-AT ?auto_1441 ?auto_1448 ) ( TRUCK-AT ?auto_1451 ?auto_1452 ) ( IN-CITY ?auto_1452 ?auto_1450 ) ( IN-CITY ?auto_1448 ?auto_1450 ) ( not ( = ?auto_1448 ?auto_1452 ) ) ( TRUCK-AT ?auto_1454 ?auto_1442 ) ( IN-TRUCK ?auto_1444 ?auto_1454 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1444 ?auto_1442 )
      ( DELIVER-2PKG ?auto_1444 ?auto_1441 ?auto_1442 )
      ( DELIVER-1PKG-VERIFY ?auto_1441 ?auto_1442 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1456 - OBJ
      ?auto_1458 - OBJ
      ?auto_1457 - LOCATION
    )
    :vars
    (
      ?auto_1466 - LOCATION
      ?auto_1464 - CITY
      ?auto_1461 - TRUCK
      ?auto_1460 - LOCATION
      ?auto_1465 - CITY
      ?auto_1459 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1458 ?auto_1456 ) ( IN-CITY ?auto_1466 ?auto_1464 ) ( IN-CITY ?auto_1457 ?auto_1464 ) ( not ( = ?auto_1457 ?auto_1466 ) ) ( OBJ-AT ?auto_1458 ?auto_1466 ) ( TRUCK-AT ?auto_1461 ?auto_1460 ) ( IN-CITY ?auto_1460 ?auto_1465 ) ( IN-CITY ?auto_1466 ?auto_1465 ) ( not ( = ?auto_1466 ?auto_1460 ) ) ( TRUCK-AT ?auto_1459 ?auto_1457 ) ( IN-TRUCK ?auto_1456 ?auto_1459 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1458 ?auto_1457 )
      ( DELIVER-2PKG-VERIFY ?auto_1456 ?auto_1458 ?auto_1457 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1492 - OBJ
      ?auto_1493 - LOCATION
    )
    :vars
    (
      ?auto_1501 - OBJ
      ?auto_1498 - LOCATION
      ?auto_1497 - CITY
      ?auto_1496 - CITY
      ?auto_1495 - TRUCK
      ?auto_1504 - LOCATION
      ?auto_1505 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1492 ?auto_1501 ) ( IN-CITY ?auto_1498 ?auto_1497 ) ( IN-CITY ?auto_1493 ?auto_1497 ) ( not ( = ?auto_1493 ?auto_1498 ) ) ( OBJ-AT ?auto_1492 ?auto_1498 ) ( IN-CITY ?auto_1493 ?auto_1496 ) ( IN-CITY ?auto_1498 ?auto_1496 ) ( IN-TRUCK ?auto_1501 ?auto_1495 ) ( TRUCK-AT ?auto_1495 ?auto_1504 ) ( IN-CITY ?auto_1504 ?auto_1505 ) ( IN-CITY ?auto_1493 ?auto_1505 ) ( not ( = ?auto_1493 ?auto_1504 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1495 ?auto_1504 ?auto_1493 ?auto_1505 )
      ( DELIVER-2PKG ?auto_1501 ?auto_1492 ?auto_1493 )
      ( DELIVER-1PKG-VERIFY ?auto_1492 ?auto_1493 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1507 - OBJ
      ?auto_1509 - OBJ
      ?auto_1508 - LOCATION
    )
    :vars
    (
      ?auto_1511 - LOCATION
      ?auto_1518 - CITY
      ?auto_1517 - CITY
      ?auto_1512 - TRUCK
      ?auto_1513 - LOCATION
      ?auto_1514 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1509 ?auto_1507 ) ( IN-CITY ?auto_1511 ?auto_1518 ) ( IN-CITY ?auto_1508 ?auto_1518 ) ( not ( = ?auto_1508 ?auto_1511 ) ) ( OBJ-AT ?auto_1509 ?auto_1511 ) ( IN-CITY ?auto_1508 ?auto_1517 ) ( IN-CITY ?auto_1511 ?auto_1517 ) ( IN-TRUCK ?auto_1507 ?auto_1512 ) ( TRUCK-AT ?auto_1512 ?auto_1513 ) ( IN-CITY ?auto_1513 ?auto_1514 ) ( IN-CITY ?auto_1508 ?auto_1514 ) ( not ( = ?auto_1508 ?auto_1513 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1509 ?auto_1508 )
      ( DELIVER-2PKG-VERIFY ?auto_1507 ?auto_1509 ?auto_1508 ) )
  )

)

