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
      ?auto_1224 - OBJ
      ?auto_1223 - LOCATION
    )
    :vars
    (
      ?auto_1225 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1225 ?auto_1223 ) ( IN-TRUCK ?auto_1224 ?auto_1225 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1224 ?auto_1225 ?auto_1223 )
      ( DELIVER-1PKG-VERIFY ?auto_1224 ?auto_1223 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1236 - OBJ
      ?auto_1235 - LOCATION
    )
    :vars
    (
      ?auto_1237 - TRUCK
      ?auto_1238 - LOCATION
      ?auto_1239 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1236 ?auto_1237 ) ( TRUCK-AT ?auto_1237 ?auto_1238 ) ( IN-CITY ?auto_1238 ?auto_1239 ) ( IN-CITY ?auto_1235 ?auto_1239 ) ( not ( = ?auto_1235 ?auto_1238 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1237 ?auto_1238 ?auto_1235 ?auto_1239 )
      ( DELIVER-1PKG ?auto_1236 ?auto_1235 )
      ( DELIVER-1PKG-VERIFY ?auto_1236 ?auto_1235 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1254 - OBJ
      ?auto_1253 - LOCATION
    )
    :vars
    (
      ?auto_1257 - TRUCK
      ?auto_1255 - LOCATION
      ?auto_1256 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1257 ?auto_1255 ) ( IN-CITY ?auto_1255 ?auto_1256 ) ( IN-CITY ?auto_1253 ?auto_1256 ) ( not ( = ?auto_1253 ?auto_1255 ) ) ( OBJ-AT ?auto_1254 ?auto_1255 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1254 ?auto_1257 ?auto_1255 )
      ( DELIVER-1PKG ?auto_1254 ?auto_1253 )
      ( DELIVER-1PKG-VERIFY ?auto_1254 ?auto_1253 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1272 - OBJ
      ?auto_1271 - LOCATION
    )
    :vars
    (
      ?auto_1274 - LOCATION
      ?auto_1273 - CITY
      ?auto_1275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1274 ?auto_1273 ) ( IN-CITY ?auto_1271 ?auto_1273 ) ( not ( = ?auto_1271 ?auto_1274 ) ) ( OBJ-AT ?auto_1272 ?auto_1274 ) ( TRUCK-AT ?auto_1275 ?auto_1271 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1275 ?auto_1271 ?auto_1274 ?auto_1273 )
      ( DELIVER-1PKG ?auto_1272 ?auto_1271 )
      ( DELIVER-1PKG-VERIFY ?auto_1272 ?auto_1271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1332 - OBJ
      ?auto_1333 - OBJ
      ?auto_1331 - LOCATION
    )
    :vars
    (
      ?auto_1334 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1334 ?auto_1331 ) ( IN-TRUCK ?auto_1333 ?auto_1334 ) ( OBJ-AT ?auto_1332 ?auto_1331 ) ( not ( = ?auto_1332 ?auto_1333 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1333 ?auto_1331 )
      ( DELIVER-2PKG-VERIFY ?auto_1332 ?auto_1333 ?auto_1331 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1336 - OBJ
      ?auto_1337 - OBJ
      ?auto_1335 - LOCATION
    )
    :vars
    (
      ?auto_1338 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1338 ?auto_1335 ) ( IN-TRUCK ?auto_1336 ?auto_1338 ) ( OBJ-AT ?auto_1337 ?auto_1335 ) ( not ( = ?auto_1336 ?auto_1337 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1336 ?auto_1335 )
      ( DELIVER-2PKG-VERIFY ?auto_1336 ?auto_1337 ?auto_1335 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1344 - OBJ
      ?auto_1345 - OBJ
      ?auto_1346 - OBJ
      ?auto_1343 - LOCATION
    )
    :vars
    (
      ?auto_1347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1347 ?auto_1343 ) ( IN-TRUCK ?auto_1346 ?auto_1347 ) ( OBJ-AT ?auto_1344 ?auto_1343 ) ( OBJ-AT ?auto_1345 ?auto_1343 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( not ( = ?auto_1344 ?auto_1346 ) ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1346 ?auto_1343 )
      ( DELIVER-3PKG-VERIFY ?auto_1344 ?auto_1345 ?auto_1346 ?auto_1343 ) )
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
      ?auto_1352 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1352 ?auto_1348 ) ( IN-TRUCK ?auto_1350 ?auto_1352 ) ( OBJ-AT ?auto_1349 ?auto_1348 ) ( OBJ-AT ?auto_1351 ?auto_1348 ) ( not ( = ?auto_1349 ?auto_1350 ) ) ( not ( = ?auto_1349 ?auto_1351 ) ) ( not ( = ?auto_1350 ?auto_1351 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1350 ?auto_1348 )
      ( DELIVER-3PKG-VERIFY ?auto_1349 ?auto_1350 ?auto_1351 ?auto_1348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1359 - OBJ
      ?auto_1360 - OBJ
      ?auto_1361 - OBJ
      ?auto_1358 - LOCATION
    )
    :vars
    (
      ?auto_1362 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1362 ?auto_1358 ) ( IN-TRUCK ?auto_1359 ?auto_1362 ) ( OBJ-AT ?auto_1360 ?auto_1358 ) ( OBJ-AT ?auto_1361 ?auto_1358 ) ( not ( = ?auto_1359 ?auto_1360 ) ) ( not ( = ?auto_1359 ?auto_1361 ) ) ( not ( = ?auto_1360 ?auto_1361 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1359 ?auto_1358 )
      ( DELIVER-3PKG-VERIFY ?auto_1359 ?auto_1360 ?auto_1361 ?auto_1358 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1384 - OBJ
      ?auto_1385 - OBJ
      ?auto_1383 - LOCATION
    )
    :vars
    (
      ?auto_1387 - TRUCK
      ?auto_1386 - LOCATION
      ?auto_1388 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1385 ?auto_1387 ) ( TRUCK-AT ?auto_1387 ?auto_1386 ) ( IN-CITY ?auto_1386 ?auto_1388 ) ( IN-CITY ?auto_1383 ?auto_1388 ) ( not ( = ?auto_1383 ?auto_1386 ) ) ( OBJ-AT ?auto_1384 ?auto_1383 ) ( not ( = ?auto_1384 ?auto_1385 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1385 ?auto_1383 )
      ( DELIVER-2PKG-VERIFY ?auto_1384 ?auto_1385 ?auto_1383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1390 - OBJ
      ?auto_1391 - OBJ
      ?auto_1389 - LOCATION
    )
    :vars
    (
      ?auto_1392 - TRUCK
      ?auto_1393 - LOCATION
      ?auto_1394 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1390 ?auto_1392 ) ( TRUCK-AT ?auto_1392 ?auto_1393 ) ( IN-CITY ?auto_1393 ?auto_1394 ) ( IN-CITY ?auto_1389 ?auto_1394 ) ( not ( = ?auto_1389 ?auto_1393 ) ) ( OBJ-AT ?auto_1391 ?auto_1389 ) ( not ( = ?auto_1391 ?auto_1390 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1391 ?auto_1390 ?auto_1389 )
      ( DELIVER-2PKG-VERIFY ?auto_1390 ?auto_1391 ?auto_1389 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1403 - OBJ
      ?auto_1404 - OBJ
      ?auto_1405 - OBJ
      ?auto_1402 - LOCATION
    )
    :vars
    (
      ?auto_1406 - TRUCK
      ?auto_1407 - LOCATION
      ?auto_1408 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1405 ?auto_1406 ) ( TRUCK-AT ?auto_1406 ?auto_1407 ) ( IN-CITY ?auto_1407 ?auto_1408 ) ( IN-CITY ?auto_1402 ?auto_1408 ) ( not ( = ?auto_1402 ?auto_1407 ) ) ( OBJ-AT ?auto_1404 ?auto_1402 ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( OBJ-AT ?auto_1403 ?auto_1402 ) ( not ( = ?auto_1403 ?auto_1404 ) ) ( not ( = ?auto_1403 ?auto_1405 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1404 ?auto_1405 ?auto_1402 )
      ( DELIVER-3PKG-VERIFY ?auto_1403 ?auto_1404 ?auto_1405 ?auto_1402 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1410 - OBJ
      ?auto_1411 - OBJ
      ?auto_1412 - OBJ
      ?auto_1409 - LOCATION
    )
    :vars
    (
      ?auto_1413 - TRUCK
      ?auto_1414 - LOCATION
      ?auto_1415 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1411 ?auto_1413 ) ( TRUCK-AT ?auto_1413 ?auto_1414 ) ( IN-CITY ?auto_1414 ?auto_1415 ) ( IN-CITY ?auto_1409 ?auto_1415 ) ( not ( = ?auto_1409 ?auto_1414 ) ) ( OBJ-AT ?auto_1412 ?auto_1409 ) ( not ( = ?auto_1412 ?auto_1411 ) ) ( OBJ-AT ?auto_1410 ?auto_1409 ) ( not ( = ?auto_1410 ?auto_1411 ) ) ( not ( = ?auto_1410 ?auto_1412 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1412 ?auto_1411 ?auto_1409 )
      ( DELIVER-3PKG-VERIFY ?auto_1410 ?auto_1411 ?auto_1412 ?auto_1409 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1424 - OBJ
      ?auto_1425 - OBJ
      ?auto_1426 - OBJ
      ?auto_1423 - LOCATION
    )
    :vars
    (
      ?auto_1427 - TRUCK
      ?auto_1428 - LOCATION
      ?auto_1429 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1424 ?auto_1427 ) ( TRUCK-AT ?auto_1427 ?auto_1428 ) ( IN-CITY ?auto_1428 ?auto_1429 ) ( IN-CITY ?auto_1423 ?auto_1429 ) ( not ( = ?auto_1423 ?auto_1428 ) ) ( OBJ-AT ?auto_1425 ?auto_1423 ) ( not ( = ?auto_1425 ?auto_1424 ) ) ( OBJ-AT ?auto_1426 ?auto_1423 ) ( not ( = ?auto_1424 ?auto_1426 ) ) ( not ( = ?auto_1425 ?auto_1426 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1425 ?auto_1424 ?auto_1423 )
      ( DELIVER-3PKG-VERIFY ?auto_1424 ?auto_1425 ?auto_1426 ?auto_1423 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1453 - OBJ
      ?auto_1452 - LOCATION
    )
    :vars
    (
      ?auto_1454 - TRUCK
      ?auto_1455 - LOCATION
      ?auto_1456 - CITY
      ?auto_1457 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1454 ?auto_1455 ) ( IN-CITY ?auto_1455 ?auto_1456 ) ( IN-CITY ?auto_1452 ?auto_1456 ) ( not ( = ?auto_1452 ?auto_1455 ) ) ( OBJ-AT ?auto_1457 ?auto_1452 ) ( not ( = ?auto_1457 ?auto_1453 ) ) ( OBJ-AT ?auto_1453 ?auto_1455 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1453 ?auto_1454 ?auto_1455 )
      ( DELIVER-2PKG ?auto_1457 ?auto_1453 ?auto_1452 )
      ( DELIVER-1PKG-VERIFY ?auto_1453 ?auto_1452 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1459 - OBJ
      ?auto_1460 - OBJ
      ?auto_1458 - LOCATION
    )
    :vars
    (
      ?auto_1463 - TRUCK
      ?auto_1462 - LOCATION
      ?auto_1461 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1463 ?auto_1462 ) ( IN-CITY ?auto_1462 ?auto_1461 ) ( IN-CITY ?auto_1458 ?auto_1461 ) ( not ( = ?auto_1458 ?auto_1462 ) ) ( OBJ-AT ?auto_1459 ?auto_1458 ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( OBJ-AT ?auto_1460 ?auto_1462 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1460 ?auto_1458 )
      ( DELIVER-2PKG-VERIFY ?auto_1459 ?auto_1460 ?auto_1458 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1465 - OBJ
      ?auto_1466 - OBJ
      ?auto_1464 - LOCATION
    )
    :vars
    (
      ?auto_1467 - TRUCK
      ?auto_1468 - LOCATION
      ?auto_1469 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1467 ?auto_1468 ) ( IN-CITY ?auto_1468 ?auto_1469 ) ( IN-CITY ?auto_1464 ?auto_1469 ) ( not ( = ?auto_1464 ?auto_1468 ) ) ( OBJ-AT ?auto_1466 ?auto_1464 ) ( not ( = ?auto_1466 ?auto_1465 ) ) ( OBJ-AT ?auto_1465 ?auto_1468 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1466 ?auto_1465 ?auto_1464 )
      ( DELIVER-2PKG-VERIFY ?auto_1465 ?auto_1466 ?auto_1464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1478 - OBJ
      ?auto_1479 - OBJ
      ?auto_1480 - OBJ
      ?auto_1477 - LOCATION
    )
    :vars
    (
      ?auto_1481 - TRUCK
      ?auto_1482 - LOCATION
      ?auto_1483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1481 ?auto_1482 ) ( IN-CITY ?auto_1482 ?auto_1483 ) ( IN-CITY ?auto_1477 ?auto_1483 ) ( not ( = ?auto_1477 ?auto_1482 ) ) ( OBJ-AT ?auto_1478 ?auto_1477 ) ( not ( = ?auto_1478 ?auto_1480 ) ) ( OBJ-AT ?auto_1480 ?auto_1482 ) ( OBJ-AT ?auto_1479 ?auto_1477 ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( not ( = ?auto_1479 ?auto_1480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1478 ?auto_1480 ?auto_1477 )
      ( DELIVER-3PKG-VERIFY ?auto_1478 ?auto_1479 ?auto_1480 ?auto_1477 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1485 - OBJ
      ?auto_1486 - OBJ
      ?auto_1487 - OBJ
      ?auto_1484 - LOCATION
    )
    :vars
    (
      ?auto_1488 - TRUCK
      ?auto_1489 - LOCATION
      ?auto_1490 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1488 ?auto_1489 ) ( IN-CITY ?auto_1489 ?auto_1490 ) ( IN-CITY ?auto_1484 ?auto_1490 ) ( not ( = ?auto_1484 ?auto_1489 ) ) ( OBJ-AT ?auto_1485 ?auto_1484 ) ( not ( = ?auto_1485 ?auto_1486 ) ) ( OBJ-AT ?auto_1486 ?auto_1489 ) ( OBJ-AT ?auto_1487 ?auto_1484 ) ( not ( = ?auto_1485 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1487 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1485 ?auto_1486 ?auto_1484 )
      ( DELIVER-3PKG-VERIFY ?auto_1485 ?auto_1486 ?auto_1487 ?auto_1484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1499 - OBJ
      ?auto_1500 - OBJ
      ?auto_1501 - OBJ
      ?auto_1498 - LOCATION
    )
    :vars
    (
      ?auto_1502 - TRUCK
      ?auto_1503 - LOCATION
      ?auto_1504 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1502 ?auto_1503 ) ( IN-CITY ?auto_1503 ?auto_1504 ) ( IN-CITY ?auto_1498 ?auto_1504 ) ( not ( = ?auto_1498 ?auto_1503 ) ) ( OBJ-AT ?auto_1500 ?auto_1498 ) ( not ( = ?auto_1500 ?auto_1499 ) ) ( OBJ-AT ?auto_1499 ?auto_1503 ) ( OBJ-AT ?auto_1501 ?auto_1498 ) ( not ( = ?auto_1499 ?auto_1501 ) ) ( not ( = ?auto_1500 ?auto_1501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1500 ?auto_1499 ?auto_1498 )
      ( DELIVER-3PKG-VERIFY ?auto_1499 ?auto_1500 ?auto_1501 ?auto_1498 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1528 - OBJ
      ?auto_1527 - LOCATION
    )
    :vars
    (
      ?auto_1530 - LOCATION
      ?auto_1531 - CITY
      ?auto_1532 - OBJ
      ?auto_1529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1530 ?auto_1531 ) ( IN-CITY ?auto_1527 ?auto_1531 ) ( not ( = ?auto_1527 ?auto_1530 ) ) ( OBJ-AT ?auto_1532 ?auto_1527 ) ( not ( = ?auto_1532 ?auto_1528 ) ) ( OBJ-AT ?auto_1528 ?auto_1530 ) ( TRUCK-AT ?auto_1529 ?auto_1527 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1529 ?auto_1527 ?auto_1530 ?auto_1531 )
      ( DELIVER-2PKG ?auto_1532 ?auto_1528 ?auto_1527 )
      ( DELIVER-1PKG-VERIFY ?auto_1528 ?auto_1527 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1534 - OBJ
      ?auto_1535 - OBJ
      ?auto_1533 - LOCATION
    )
    :vars
    (
      ?auto_1537 - LOCATION
      ?auto_1538 - CITY
      ?auto_1536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1537 ?auto_1538 ) ( IN-CITY ?auto_1533 ?auto_1538 ) ( not ( = ?auto_1533 ?auto_1537 ) ) ( OBJ-AT ?auto_1534 ?auto_1533 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( OBJ-AT ?auto_1535 ?auto_1537 ) ( TRUCK-AT ?auto_1536 ?auto_1533 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1535 ?auto_1533 )
      ( DELIVER-2PKG-VERIFY ?auto_1534 ?auto_1535 ?auto_1533 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1540 - OBJ
      ?auto_1541 - OBJ
      ?auto_1539 - LOCATION
    )
    :vars
    (
      ?auto_1543 - LOCATION
      ?auto_1544 - CITY
      ?auto_1542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1543 ?auto_1544 ) ( IN-CITY ?auto_1539 ?auto_1544 ) ( not ( = ?auto_1539 ?auto_1543 ) ) ( OBJ-AT ?auto_1541 ?auto_1539 ) ( not ( = ?auto_1541 ?auto_1540 ) ) ( OBJ-AT ?auto_1540 ?auto_1543 ) ( TRUCK-AT ?auto_1542 ?auto_1539 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1541 ?auto_1540 ?auto_1539 )
      ( DELIVER-2PKG-VERIFY ?auto_1540 ?auto_1541 ?auto_1539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1553 - OBJ
      ?auto_1554 - OBJ
      ?auto_1555 - OBJ
      ?auto_1552 - LOCATION
    )
    :vars
    (
      ?auto_1557 - LOCATION
      ?auto_1558 - CITY
      ?auto_1556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1557 ?auto_1558 ) ( IN-CITY ?auto_1552 ?auto_1558 ) ( not ( = ?auto_1552 ?auto_1557 ) ) ( OBJ-AT ?auto_1554 ?auto_1552 ) ( not ( = ?auto_1554 ?auto_1555 ) ) ( OBJ-AT ?auto_1555 ?auto_1557 ) ( TRUCK-AT ?auto_1556 ?auto_1552 ) ( OBJ-AT ?auto_1553 ?auto_1552 ) ( not ( = ?auto_1553 ?auto_1554 ) ) ( not ( = ?auto_1553 ?auto_1555 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1554 ?auto_1555 ?auto_1552 )
      ( DELIVER-3PKG-VERIFY ?auto_1553 ?auto_1554 ?auto_1555 ?auto_1552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1560 - OBJ
      ?auto_1561 - OBJ
      ?auto_1562 - OBJ
      ?auto_1559 - LOCATION
    )
    :vars
    (
      ?auto_1564 - LOCATION
      ?auto_1565 - CITY
      ?auto_1563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1564 ?auto_1565 ) ( IN-CITY ?auto_1559 ?auto_1565 ) ( not ( = ?auto_1559 ?auto_1564 ) ) ( OBJ-AT ?auto_1560 ?auto_1559 ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( OBJ-AT ?auto_1561 ?auto_1564 ) ( TRUCK-AT ?auto_1563 ?auto_1559 ) ( OBJ-AT ?auto_1562 ?auto_1559 ) ( not ( = ?auto_1560 ?auto_1562 ) ) ( not ( = ?auto_1561 ?auto_1562 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1560 ?auto_1561 ?auto_1559 )
      ( DELIVER-3PKG-VERIFY ?auto_1560 ?auto_1561 ?auto_1562 ?auto_1559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1574 - OBJ
      ?auto_1575 - OBJ
      ?auto_1576 - OBJ
      ?auto_1573 - LOCATION
    )
    :vars
    (
      ?auto_1578 - LOCATION
      ?auto_1579 - CITY
      ?auto_1577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1578 ?auto_1579 ) ( IN-CITY ?auto_1573 ?auto_1579 ) ( not ( = ?auto_1573 ?auto_1578 ) ) ( OBJ-AT ?auto_1575 ?auto_1573 ) ( not ( = ?auto_1575 ?auto_1574 ) ) ( OBJ-AT ?auto_1574 ?auto_1578 ) ( TRUCK-AT ?auto_1577 ?auto_1573 ) ( OBJ-AT ?auto_1576 ?auto_1573 ) ( not ( = ?auto_1574 ?auto_1576 ) ) ( not ( = ?auto_1575 ?auto_1576 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1575 ?auto_1574 ?auto_1573 )
      ( DELIVER-3PKG-VERIFY ?auto_1574 ?auto_1575 ?auto_1576 ?auto_1573 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1603 - OBJ
      ?auto_1602 - LOCATION
    )
    :vars
    (
      ?auto_1605 - LOCATION
      ?auto_1606 - CITY
      ?auto_1607 - OBJ
      ?auto_1604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1605 ?auto_1606 ) ( IN-CITY ?auto_1602 ?auto_1606 ) ( not ( = ?auto_1602 ?auto_1605 ) ) ( not ( = ?auto_1607 ?auto_1603 ) ) ( OBJ-AT ?auto_1603 ?auto_1605 ) ( TRUCK-AT ?auto_1604 ?auto_1602 ) ( IN-TRUCK ?auto_1607 ?auto_1604 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1607 ?auto_1602 )
      ( DELIVER-2PKG ?auto_1607 ?auto_1603 ?auto_1602 )
      ( DELIVER-1PKG-VERIFY ?auto_1603 ?auto_1602 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1609 - OBJ
      ?auto_1610 - OBJ
      ?auto_1608 - LOCATION
    )
    :vars
    (
      ?auto_1613 - LOCATION
      ?auto_1612 - CITY
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1613 ?auto_1612 ) ( IN-CITY ?auto_1608 ?auto_1612 ) ( not ( = ?auto_1608 ?auto_1613 ) ) ( not ( = ?auto_1609 ?auto_1610 ) ) ( OBJ-AT ?auto_1610 ?auto_1613 ) ( TRUCK-AT ?auto_1611 ?auto_1608 ) ( IN-TRUCK ?auto_1609 ?auto_1611 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1610 ?auto_1608 )
      ( DELIVER-2PKG-VERIFY ?auto_1609 ?auto_1610 ?auto_1608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1615 - OBJ
      ?auto_1616 - OBJ
      ?auto_1614 - LOCATION
    )
    :vars
    (
      ?auto_1619 - LOCATION
      ?auto_1617 - CITY
      ?auto_1618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1619 ?auto_1617 ) ( IN-CITY ?auto_1614 ?auto_1617 ) ( not ( = ?auto_1614 ?auto_1619 ) ) ( not ( = ?auto_1616 ?auto_1615 ) ) ( OBJ-AT ?auto_1615 ?auto_1619 ) ( TRUCK-AT ?auto_1618 ?auto_1614 ) ( IN-TRUCK ?auto_1616 ?auto_1618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1616 ?auto_1615 ?auto_1614 )
      ( DELIVER-2PKG-VERIFY ?auto_1615 ?auto_1616 ?auto_1614 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1678 - OBJ
      ?auto_1677 - LOCATION
    )
    :vars
    (
      ?auto_1681 - LOCATION
      ?auto_1679 - CITY
      ?auto_1682 - OBJ
      ?auto_1680 - TRUCK
      ?auto_1683 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1681 ?auto_1679 ) ( IN-CITY ?auto_1677 ?auto_1679 ) ( not ( = ?auto_1677 ?auto_1681 ) ) ( not ( = ?auto_1682 ?auto_1678 ) ) ( OBJ-AT ?auto_1678 ?auto_1681 ) ( IN-TRUCK ?auto_1682 ?auto_1680 ) ( TRUCK-AT ?auto_1680 ?auto_1683 ) ( IN-CITY ?auto_1683 ?auto_1679 ) ( not ( = ?auto_1677 ?auto_1683 ) ) ( not ( = ?auto_1681 ?auto_1683 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1680 ?auto_1683 ?auto_1677 ?auto_1679 )
      ( DELIVER-2PKG ?auto_1682 ?auto_1678 ?auto_1677 )
      ( DELIVER-1PKG-VERIFY ?auto_1678 ?auto_1677 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1685 - OBJ
      ?auto_1686 - OBJ
      ?auto_1684 - LOCATION
    )
    :vars
    (
      ?auto_1688 - LOCATION
      ?auto_1689 - CITY
      ?auto_1687 - TRUCK
      ?auto_1690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1688 ?auto_1689 ) ( IN-CITY ?auto_1684 ?auto_1689 ) ( not ( = ?auto_1684 ?auto_1688 ) ) ( not ( = ?auto_1685 ?auto_1686 ) ) ( OBJ-AT ?auto_1686 ?auto_1688 ) ( IN-TRUCK ?auto_1685 ?auto_1687 ) ( TRUCK-AT ?auto_1687 ?auto_1690 ) ( IN-CITY ?auto_1690 ?auto_1689 ) ( not ( = ?auto_1684 ?auto_1690 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1686 ?auto_1684 )
      ( DELIVER-2PKG-VERIFY ?auto_1685 ?auto_1686 ?auto_1684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1692 - OBJ
      ?auto_1693 - OBJ
      ?auto_1691 - LOCATION
    )
    :vars
    (
      ?auto_1697 - LOCATION
      ?auto_1695 - CITY
      ?auto_1694 - TRUCK
      ?auto_1696 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1697 ?auto_1695 ) ( IN-CITY ?auto_1691 ?auto_1695 ) ( not ( = ?auto_1691 ?auto_1697 ) ) ( not ( = ?auto_1693 ?auto_1692 ) ) ( OBJ-AT ?auto_1692 ?auto_1697 ) ( IN-TRUCK ?auto_1693 ?auto_1694 ) ( TRUCK-AT ?auto_1694 ?auto_1696 ) ( IN-CITY ?auto_1696 ?auto_1695 ) ( not ( = ?auto_1691 ?auto_1696 ) ) ( not ( = ?auto_1697 ?auto_1696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1693 ?auto_1692 ?auto_1691 )
      ( DELIVER-2PKG-VERIFY ?auto_1692 ?auto_1693 ?auto_1691 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1764 - OBJ
      ?auto_1763 - LOCATION
    )
    :vars
    (
      ?auto_1768 - LOCATION
      ?auto_1766 - CITY
      ?auto_1769 - OBJ
      ?auto_1765 - TRUCK
      ?auto_1767 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1768 ?auto_1766 ) ( IN-CITY ?auto_1763 ?auto_1766 ) ( not ( = ?auto_1763 ?auto_1768 ) ) ( not ( = ?auto_1769 ?auto_1764 ) ) ( OBJ-AT ?auto_1764 ?auto_1768 ) ( TRUCK-AT ?auto_1765 ?auto_1767 ) ( IN-CITY ?auto_1767 ?auto_1766 ) ( not ( = ?auto_1763 ?auto_1767 ) ) ( not ( = ?auto_1768 ?auto_1767 ) ) ( OBJ-AT ?auto_1769 ?auto_1767 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1769 ?auto_1765 ?auto_1767 )
      ( DELIVER-2PKG ?auto_1769 ?auto_1764 ?auto_1763 )
      ( DELIVER-1PKG-VERIFY ?auto_1764 ?auto_1763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1771 - OBJ
      ?auto_1772 - OBJ
      ?auto_1770 - LOCATION
    )
    :vars
    (
      ?auto_1775 - LOCATION
      ?auto_1773 - CITY
      ?auto_1774 - TRUCK
      ?auto_1776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1775 ?auto_1773 ) ( IN-CITY ?auto_1770 ?auto_1773 ) ( not ( = ?auto_1770 ?auto_1775 ) ) ( not ( = ?auto_1771 ?auto_1772 ) ) ( OBJ-AT ?auto_1772 ?auto_1775 ) ( TRUCK-AT ?auto_1774 ?auto_1776 ) ( IN-CITY ?auto_1776 ?auto_1773 ) ( not ( = ?auto_1770 ?auto_1776 ) ) ( not ( = ?auto_1775 ?auto_1776 ) ) ( OBJ-AT ?auto_1771 ?auto_1776 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1772 ?auto_1770 )
      ( DELIVER-2PKG-VERIFY ?auto_1771 ?auto_1772 ?auto_1770 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1778 - OBJ
      ?auto_1779 - OBJ
      ?auto_1777 - LOCATION
    )
    :vars
    (
      ?auto_1780 - LOCATION
      ?auto_1782 - CITY
      ?auto_1781 - TRUCK
      ?auto_1783 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1780 ?auto_1782 ) ( IN-CITY ?auto_1777 ?auto_1782 ) ( not ( = ?auto_1777 ?auto_1780 ) ) ( not ( = ?auto_1779 ?auto_1778 ) ) ( OBJ-AT ?auto_1778 ?auto_1780 ) ( TRUCK-AT ?auto_1781 ?auto_1783 ) ( IN-CITY ?auto_1783 ?auto_1782 ) ( not ( = ?auto_1777 ?auto_1783 ) ) ( not ( = ?auto_1780 ?auto_1783 ) ) ( OBJ-AT ?auto_1779 ?auto_1783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1779 ?auto_1778 ?auto_1777 )
      ( DELIVER-2PKG-VERIFY ?auto_1778 ?auto_1779 ?auto_1777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2163 - OBJ
      ?auto_2164 - OBJ
      ?auto_2165 - OBJ
      ?auto_2162 - LOCATION
    )
    :vars
    (
      ?auto_2168 - TRUCK
      ?auto_2167 - LOCATION
      ?auto_2166 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2164 ?auto_2168 ) ( TRUCK-AT ?auto_2168 ?auto_2167 ) ( IN-CITY ?auto_2167 ?auto_2166 ) ( IN-CITY ?auto_2162 ?auto_2166 ) ( not ( = ?auto_2162 ?auto_2167 ) ) ( OBJ-AT ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2163 ?auto_2164 ) ) ( OBJ-AT ?auto_2165 ?auto_2162 ) ( not ( = ?auto_2163 ?auto_2165 ) ) ( not ( = ?auto_2164 ?auto_2165 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2163 ?auto_2164 ?auto_2162 )
      ( DELIVER-3PKG-VERIFY ?auto_2163 ?auto_2164 ?auto_2165 ?auto_2162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2185 - OBJ
      ?auto_2186 - OBJ
      ?auto_2187 - OBJ
      ?auto_2184 - LOCATION
    )
    :vars
    (
      ?auto_2191 - TRUCK
      ?auto_2189 - LOCATION
      ?auto_2188 - CITY
      ?auto_2190 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2187 ?auto_2191 ) ( TRUCK-AT ?auto_2191 ?auto_2189 ) ( IN-CITY ?auto_2189 ?auto_2188 ) ( IN-CITY ?auto_2184 ?auto_2188 ) ( not ( = ?auto_2184 ?auto_2189 ) ) ( OBJ-AT ?auto_2190 ?auto_2184 ) ( not ( = ?auto_2190 ?auto_2187 ) ) ( OBJ-AT ?auto_2185 ?auto_2184 ) ( OBJ-AT ?auto_2186 ?auto_2184 ) ( not ( = ?auto_2185 ?auto_2186 ) ) ( not ( = ?auto_2185 ?auto_2187 ) ) ( not ( = ?auto_2185 ?auto_2190 ) ) ( not ( = ?auto_2186 ?auto_2187 ) ) ( not ( = ?auto_2186 ?auto_2190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2190 ?auto_2187 ?auto_2184 )
      ( DELIVER-3PKG-VERIFY ?auto_2185 ?auto_2186 ?auto_2187 ?auto_2184 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2197 - OBJ
      ?auto_2198 - OBJ
      ?auto_2199 - OBJ
      ?auto_2196 - LOCATION
    )
    :vars
    (
      ?auto_2203 - TRUCK
      ?auto_2201 - LOCATION
      ?auto_2200 - CITY
      ?auto_2202 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2198 ?auto_2203 ) ( TRUCK-AT ?auto_2203 ?auto_2201 ) ( IN-CITY ?auto_2201 ?auto_2200 ) ( IN-CITY ?auto_2196 ?auto_2200 ) ( not ( = ?auto_2196 ?auto_2201 ) ) ( OBJ-AT ?auto_2202 ?auto_2196 ) ( not ( = ?auto_2202 ?auto_2198 ) ) ( OBJ-AT ?auto_2197 ?auto_2196 ) ( OBJ-AT ?auto_2199 ?auto_2196 ) ( not ( = ?auto_2197 ?auto_2198 ) ) ( not ( = ?auto_2197 ?auto_2199 ) ) ( not ( = ?auto_2197 ?auto_2202 ) ) ( not ( = ?auto_2198 ?auto_2199 ) ) ( not ( = ?auto_2199 ?auto_2202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2202 ?auto_2198 ?auto_2196 )
      ( DELIVER-3PKG-VERIFY ?auto_2197 ?auto_2198 ?auto_2199 ?auto_2196 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2235 - OBJ
      ?auto_2236 - OBJ
      ?auto_2237 - OBJ
      ?auto_2234 - LOCATION
    )
    :vars
    (
      ?auto_2241 - TRUCK
      ?auto_2239 - LOCATION
      ?auto_2238 - CITY
      ?auto_2240 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2235 ?auto_2241 ) ( TRUCK-AT ?auto_2241 ?auto_2239 ) ( IN-CITY ?auto_2239 ?auto_2238 ) ( IN-CITY ?auto_2234 ?auto_2238 ) ( not ( = ?auto_2234 ?auto_2239 ) ) ( OBJ-AT ?auto_2240 ?auto_2234 ) ( not ( = ?auto_2240 ?auto_2235 ) ) ( OBJ-AT ?auto_2236 ?auto_2234 ) ( OBJ-AT ?auto_2237 ?auto_2234 ) ( not ( = ?auto_2235 ?auto_2236 ) ) ( not ( = ?auto_2235 ?auto_2237 ) ) ( not ( = ?auto_2236 ?auto_2237 ) ) ( not ( = ?auto_2236 ?auto_2240 ) ) ( not ( = ?auto_2237 ?auto_2240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2240 ?auto_2235 ?auto_2234 )
      ( DELIVER-3PKG-VERIFY ?auto_2235 ?auto_2236 ?auto_2237 ?auto_2234 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2338 - OBJ
      ?auto_2339 - OBJ
      ?auto_2340 - OBJ
      ?auto_2337 - LOCATION
    )
    :vars
    (
      ?auto_2341 - TRUCK
      ?auto_2342 - LOCATION
      ?auto_2343 - CITY
      ?auto_2344 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2341 ?auto_2342 ) ( IN-CITY ?auto_2342 ?auto_2343 ) ( IN-CITY ?auto_2337 ?auto_2343 ) ( not ( = ?auto_2337 ?auto_2342 ) ) ( OBJ-AT ?auto_2344 ?auto_2337 ) ( not ( = ?auto_2344 ?auto_2340 ) ) ( OBJ-AT ?auto_2340 ?auto_2342 ) ( OBJ-AT ?auto_2338 ?auto_2337 ) ( OBJ-AT ?auto_2339 ?auto_2337 ) ( not ( = ?auto_2338 ?auto_2339 ) ) ( not ( = ?auto_2338 ?auto_2340 ) ) ( not ( = ?auto_2338 ?auto_2344 ) ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2344 ?auto_2340 ?auto_2337 )
      ( DELIVER-3PKG-VERIFY ?auto_2338 ?auto_2339 ?auto_2340 ?auto_2337 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2350 - OBJ
      ?auto_2351 - OBJ
      ?auto_2352 - OBJ
      ?auto_2349 - LOCATION
    )
    :vars
    (
      ?auto_2353 - TRUCK
      ?auto_2354 - LOCATION
      ?auto_2355 - CITY
      ?auto_2356 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2353 ?auto_2354 ) ( IN-CITY ?auto_2354 ?auto_2355 ) ( IN-CITY ?auto_2349 ?auto_2355 ) ( not ( = ?auto_2349 ?auto_2354 ) ) ( OBJ-AT ?auto_2356 ?auto_2349 ) ( not ( = ?auto_2356 ?auto_2351 ) ) ( OBJ-AT ?auto_2351 ?auto_2354 ) ( OBJ-AT ?auto_2350 ?auto_2349 ) ( OBJ-AT ?auto_2352 ?auto_2349 ) ( not ( = ?auto_2350 ?auto_2351 ) ) ( not ( = ?auto_2350 ?auto_2352 ) ) ( not ( = ?auto_2350 ?auto_2356 ) ) ( not ( = ?auto_2351 ?auto_2352 ) ) ( not ( = ?auto_2352 ?auto_2356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2356 ?auto_2351 ?auto_2349 )
      ( DELIVER-3PKG-VERIFY ?auto_2350 ?auto_2351 ?auto_2352 ?auto_2349 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2388 - OBJ
      ?auto_2389 - OBJ
      ?auto_2390 - OBJ
      ?auto_2387 - LOCATION
    )
    :vars
    (
      ?auto_2391 - TRUCK
      ?auto_2392 - LOCATION
      ?auto_2393 - CITY
      ?auto_2394 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2391 ?auto_2392 ) ( IN-CITY ?auto_2392 ?auto_2393 ) ( IN-CITY ?auto_2387 ?auto_2393 ) ( not ( = ?auto_2387 ?auto_2392 ) ) ( OBJ-AT ?auto_2394 ?auto_2387 ) ( not ( = ?auto_2394 ?auto_2388 ) ) ( OBJ-AT ?auto_2388 ?auto_2392 ) ( OBJ-AT ?auto_2389 ?auto_2387 ) ( OBJ-AT ?auto_2390 ?auto_2387 ) ( not ( = ?auto_2388 ?auto_2389 ) ) ( not ( = ?auto_2388 ?auto_2390 ) ) ( not ( = ?auto_2389 ?auto_2390 ) ) ( not ( = ?auto_2389 ?auto_2394 ) ) ( not ( = ?auto_2390 ?auto_2394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2394 ?auto_2388 ?auto_2387 )
      ( DELIVER-3PKG-VERIFY ?auto_2388 ?auto_2389 ?auto_2390 ?auto_2387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2458 - OBJ
      ?auto_2459 - OBJ
      ?auto_2460 - OBJ
      ?auto_2457 - LOCATION
    )
    :vars
    (
      ?auto_2462 - LOCATION
      ?auto_2463 - CITY
      ?auto_2461 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2462 ?auto_2463 ) ( IN-CITY ?auto_2457 ?auto_2463 ) ( not ( = ?auto_2457 ?auto_2462 ) ) ( OBJ-AT ?auto_2458 ?auto_2457 ) ( not ( = ?auto_2458 ?auto_2460 ) ) ( OBJ-AT ?auto_2460 ?auto_2462 ) ( TRUCK-AT ?auto_2461 ?auto_2457 ) ( OBJ-AT ?auto_2459 ?auto_2457 ) ( not ( = ?auto_2458 ?auto_2459 ) ) ( not ( = ?auto_2459 ?auto_2460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2458 ?auto_2460 ?auto_2457 )
      ( DELIVER-3PKG-VERIFY ?auto_2458 ?auto_2459 ?auto_2460 ?auto_2457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2469 - OBJ
      ?auto_2470 - OBJ
      ?auto_2471 - OBJ
      ?auto_2468 - LOCATION
    )
    :vars
    (
      ?auto_2473 - LOCATION
      ?auto_2474 - CITY
      ?auto_2472 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2473 ?auto_2474 ) ( IN-CITY ?auto_2468 ?auto_2474 ) ( not ( = ?auto_2468 ?auto_2473 ) ) ( OBJ-AT ?auto_2471 ?auto_2468 ) ( not ( = ?auto_2471 ?auto_2470 ) ) ( OBJ-AT ?auto_2470 ?auto_2473 ) ( TRUCK-AT ?auto_2472 ?auto_2468 ) ( OBJ-AT ?auto_2469 ?auto_2468 ) ( not ( = ?auto_2469 ?auto_2470 ) ) ( not ( = ?auto_2469 ?auto_2471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2471 ?auto_2470 ?auto_2468 )
      ( DELIVER-3PKG-VERIFY ?auto_2469 ?auto_2470 ?auto_2471 ?auto_2468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2491 - OBJ
      ?auto_2492 - OBJ
      ?auto_2493 - OBJ
      ?auto_2490 - LOCATION
    )
    :vars
    (
      ?auto_2495 - LOCATION
      ?auto_2496 - CITY
      ?auto_2497 - OBJ
      ?auto_2494 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2495 ?auto_2496 ) ( IN-CITY ?auto_2490 ?auto_2496 ) ( not ( = ?auto_2490 ?auto_2495 ) ) ( OBJ-AT ?auto_2497 ?auto_2490 ) ( not ( = ?auto_2497 ?auto_2493 ) ) ( OBJ-AT ?auto_2493 ?auto_2495 ) ( TRUCK-AT ?auto_2494 ?auto_2490 ) ( OBJ-AT ?auto_2491 ?auto_2490 ) ( OBJ-AT ?auto_2492 ?auto_2490 ) ( not ( = ?auto_2491 ?auto_2492 ) ) ( not ( = ?auto_2491 ?auto_2493 ) ) ( not ( = ?auto_2491 ?auto_2497 ) ) ( not ( = ?auto_2492 ?auto_2493 ) ) ( not ( = ?auto_2492 ?auto_2497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2497 ?auto_2493 ?auto_2490 )
      ( DELIVER-3PKG-VERIFY ?auto_2491 ?auto_2492 ?auto_2493 ?auto_2490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2503 - OBJ
      ?auto_2504 - OBJ
      ?auto_2505 - OBJ
      ?auto_2502 - LOCATION
    )
    :vars
    (
      ?auto_2507 - LOCATION
      ?auto_2508 - CITY
      ?auto_2509 - OBJ
      ?auto_2506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2507 ?auto_2508 ) ( IN-CITY ?auto_2502 ?auto_2508 ) ( not ( = ?auto_2502 ?auto_2507 ) ) ( OBJ-AT ?auto_2509 ?auto_2502 ) ( not ( = ?auto_2509 ?auto_2504 ) ) ( OBJ-AT ?auto_2504 ?auto_2507 ) ( TRUCK-AT ?auto_2506 ?auto_2502 ) ( OBJ-AT ?auto_2503 ?auto_2502 ) ( OBJ-AT ?auto_2505 ?auto_2502 ) ( not ( = ?auto_2503 ?auto_2504 ) ) ( not ( = ?auto_2503 ?auto_2505 ) ) ( not ( = ?auto_2503 ?auto_2509 ) ) ( not ( = ?auto_2504 ?auto_2505 ) ) ( not ( = ?auto_2505 ?auto_2509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2509 ?auto_2504 ?auto_2502 )
      ( DELIVER-3PKG-VERIFY ?auto_2503 ?auto_2504 ?auto_2505 ?auto_2502 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2541 - OBJ
      ?auto_2542 - OBJ
      ?auto_2543 - OBJ
      ?auto_2540 - LOCATION
    )
    :vars
    (
      ?auto_2545 - LOCATION
      ?auto_2546 - CITY
      ?auto_2547 - OBJ
      ?auto_2544 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2545 ?auto_2546 ) ( IN-CITY ?auto_2540 ?auto_2546 ) ( not ( = ?auto_2540 ?auto_2545 ) ) ( OBJ-AT ?auto_2547 ?auto_2540 ) ( not ( = ?auto_2547 ?auto_2541 ) ) ( OBJ-AT ?auto_2541 ?auto_2545 ) ( TRUCK-AT ?auto_2544 ?auto_2540 ) ( OBJ-AT ?auto_2542 ?auto_2540 ) ( OBJ-AT ?auto_2543 ?auto_2540 ) ( not ( = ?auto_2541 ?auto_2542 ) ) ( not ( = ?auto_2541 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2547 ) ) ( not ( = ?auto_2543 ?auto_2547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2547 ?auto_2541 ?auto_2540 )
      ( DELIVER-3PKG-VERIFY ?auto_2541 ?auto_2542 ?auto_2543 ?auto_2540 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2682 - OBJ
      ?auto_2683 - OBJ
      ?auto_2684 - OBJ
      ?auto_2681 - LOCATION
    )
    :vars
    (
      ?auto_2686 - LOCATION
      ?auto_2685 - CITY
      ?auto_2687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2686 ?auto_2685 ) ( IN-CITY ?auto_2681 ?auto_2685 ) ( not ( = ?auto_2681 ?auto_2686 ) ) ( OBJ-AT ?auto_2684 ?auto_2681 ) ( not ( = ?auto_2684 ?auto_2682 ) ) ( OBJ-AT ?auto_2682 ?auto_2686 ) ( TRUCK-AT ?auto_2687 ?auto_2681 ) ( OBJ-AT ?auto_2683 ?auto_2681 ) ( not ( = ?auto_2682 ?auto_2683 ) ) ( not ( = ?auto_2683 ?auto_2684 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2684 ?auto_2682 ?auto_2681 )
      ( DELIVER-3PKG-VERIFY ?auto_2682 ?auto_2683 ?auto_2684 ?auto_2681 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2749 - OBJ
      ?auto_2748 - LOCATION
    )
    :vars
    (
      ?auto_2751 - LOCATION
      ?auto_2750 - CITY
      ?auto_2753 - OBJ
      ?auto_2752 - TRUCK
      ?auto_2754 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2751 ?auto_2750 ) ( IN-CITY ?auto_2748 ?auto_2750 ) ( not ( = ?auto_2748 ?auto_2751 ) ) ( OBJ-AT ?auto_2753 ?auto_2748 ) ( not ( = ?auto_2753 ?auto_2749 ) ) ( OBJ-AT ?auto_2749 ?auto_2751 ) ( TRUCK-AT ?auto_2752 ?auto_2754 ) ( IN-CITY ?auto_2754 ?auto_2750 ) ( not ( = ?auto_2748 ?auto_2754 ) ) ( not ( = ?auto_2751 ?auto_2754 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2752 ?auto_2754 ?auto_2748 ?auto_2750 )
      ( DELIVER-2PKG ?auto_2753 ?auto_2749 ?auto_2748 )
      ( DELIVER-1PKG-VERIFY ?auto_2749 ?auto_2748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2756 - OBJ
      ?auto_2757 - OBJ
      ?auto_2755 - LOCATION
    )
    :vars
    (
      ?auto_2758 - LOCATION
      ?auto_2759 - CITY
      ?auto_2760 - TRUCK
      ?auto_2761 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2758 ?auto_2759 ) ( IN-CITY ?auto_2755 ?auto_2759 ) ( not ( = ?auto_2755 ?auto_2758 ) ) ( OBJ-AT ?auto_2756 ?auto_2755 ) ( not ( = ?auto_2756 ?auto_2757 ) ) ( OBJ-AT ?auto_2757 ?auto_2758 ) ( TRUCK-AT ?auto_2760 ?auto_2761 ) ( IN-CITY ?auto_2761 ?auto_2759 ) ( not ( = ?auto_2755 ?auto_2761 ) ) ( not ( = ?auto_2758 ?auto_2761 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2757 ?auto_2755 )
      ( DELIVER-2PKG-VERIFY ?auto_2756 ?auto_2757 ?auto_2755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2771 - OBJ
      ?auto_2772 - OBJ
      ?auto_2770 - LOCATION
    )
    :vars
    (
      ?auto_2773 - LOCATION
      ?auto_2774 - CITY
      ?auto_2775 - TRUCK
      ?auto_2776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2773 ?auto_2774 ) ( IN-CITY ?auto_2770 ?auto_2774 ) ( not ( = ?auto_2770 ?auto_2773 ) ) ( OBJ-AT ?auto_2772 ?auto_2770 ) ( not ( = ?auto_2772 ?auto_2771 ) ) ( OBJ-AT ?auto_2771 ?auto_2773 ) ( TRUCK-AT ?auto_2775 ?auto_2776 ) ( IN-CITY ?auto_2776 ?auto_2774 ) ( not ( = ?auto_2770 ?auto_2776 ) ) ( not ( = ?auto_2773 ?auto_2776 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2772 ?auto_2771 ?auto_2770 )
      ( DELIVER-2PKG-VERIFY ?auto_2771 ?auto_2772 ?auto_2770 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2794 - OBJ
      ?auto_2795 - OBJ
      ?auto_2796 - OBJ
      ?auto_2793 - LOCATION
    )
    :vars
    (
      ?auto_2797 - LOCATION
      ?auto_2798 - CITY
      ?auto_2799 - TRUCK
      ?auto_2800 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2797 ?auto_2798 ) ( IN-CITY ?auto_2793 ?auto_2798 ) ( not ( = ?auto_2793 ?auto_2797 ) ) ( OBJ-AT ?auto_2795 ?auto_2793 ) ( not ( = ?auto_2795 ?auto_2796 ) ) ( OBJ-AT ?auto_2796 ?auto_2797 ) ( TRUCK-AT ?auto_2799 ?auto_2800 ) ( IN-CITY ?auto_2800 ?auto_2798 ) ( not ( = ?auto_2793 ?auto_2800 ) ) ( not ( = ?auto_2797 ?auto_2800 ) ) ( OBJ-AT ?auto_2794 ?auto_2793 ) ( not ( = ?auto_2794 ?auto_2795 ) ) ( not ( = ?auto_2794 ?auto_2796 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2795 ?auto_2796 ?auto_2793 )
      ( DELIVER-3PKG-VERIFY ?auto_2794 ?auto_2795 ?auto_2796 ?auto_2793 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2810 - OBJ
      ?auto_2811 - OBJ
      ?auto_2812 - OBJ
      ?auto_2809 - LOCATION
    )
    :vars
    (
      ?auto_2813 - LOCATION
      ?auto_2814 - CITY
      ?auto_2815 - TRUCK
      ?auto_2816 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2813 ?auto_2814 ) ( IN-CITY ?auto_2809 ?auto_2814 ) ( not ( = ?auto_2809 ?auto_2813 ) ) ( OBJ-AT ?auto_2812 ?auto_2809 ) ( not ( = ?auto_2812 ?auto_2811 ) ) ( OBJ-AT ?auto_2811 ?auto_2813 ) ( TRUCK-AT ?auto_2815 ?auto_2816 ) ( IN-CITY ?auto_2816 ?auto_2814 ) ( not ( = ?auto_2809 ?auto_2816 ) ) ( not ( = ?auto_2813 ?auto_2816 ) ) ( OBJ-AT ?auto_2810 ?auto_2809 ) ( not ( = ?auto_2810 ?auto_2811 ) ) ( not ( = ?auto_2810 ?auto_2812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2812 ?auto_2811 ?auto_2809 )
      ( DELIVER-3PKG-VERIFY ?auto_2810 ?auto_2811 ?auto_2812 ?auto_2809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2877 - OBJ
      ?auto_2878 - OBJ
      ?auto_2879 - OBJ
      ?auto_2876 - LOCATION
    )
    :vars
    (
      ?auto_2880 - LOCATION
      ?auto_2881 - CITY
      ?auto_2882 - TRUCK
      ?auto_2883 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2880 ?auto_2881 ) ( IN-CITY ?auto_2876 ?auto_2881 ) ( not ( = ?auto_2876 ?auto_2880 ) ) ( OBJ-AT ?auto_2878 ?auto_2876 ) ( not ( = ?auto_2878 ?auto_2877 ) ) ( OBJ-AT ?auto_2877 ?auto_2880 ) ( TRUCK-AT ?auto_2882 ?auto_2883 ) ( IN-CITY ?auto_2883 ?auto_2881 ) ( not ( = ?auto_2876 ?auto_2883 ) ) ( not ( = ?auto_2880 ?auto_2883 ) ) ( OBJ-AT ?auto_2879 ?auto_2876 ) ( not ( = ?auto_2877 ?auto_2879 ) ) ( not ( = ?auto_2878 ?auto_2879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2878 ?auto_2877 ?auto_2876 )
      ( DELIVER-3PKG-VERIFY ?auto_2877 ?auto_2878 ?auto_2879 ?auto_2876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2985 - OBJ
      ?auto_2986 - OBJ
      ?auto_2987 - OBJ
      ?auto_2984 - LOCATION
    )
    :vars
    (
      ?auto_2989 - LOCATION
      ?auto_2988 - CITY
      ?auto_2991 - TRUCK
      ?auto_2990 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2989 ?auto_2988 ) ( IN-CITY ?auto_2984 ?auto_2988 ) ( not ( = ?auto_2984 ?auto_2989 ) ) ( OBJ-AT ?auto_2985 ?auto_2984 ) ( not ( = ?auto_2985 ?auto_2987 ) ) ( OBJ-AT ?auto_2987 ?auto_2989 ) ( TRUCK-AT ?auto_2991 ?auto_2990 ) ( IN-CITY ?auto_2990 ?auto_2988 ) ( not ( = ?auto_2984 ?auto_2990 ) ) ( not ( = ?auto_2989 ?auto_2990 ) ) ( OBJ-AT ?auto_2986 ?auto_2984 ) ( not ( = ?auto_2985 ?auto_2986 ) ) ( not ( = ?auto_2986 ?auto_2987 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2985 ?auto_2987 ?auto_2984 )
      ( DELIVER-3PKG-VERIFY ?auto_2985 ?auto_2986 ?auto_2987 ?auto_2984 ) )
  )

)

