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
      ?auto_1271 - OBJ
      ?auto_1270 - LOCATION
    )
    :vars
    (
      ?auto_1272 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1272 ?auto_1270 ) ( IN-TRUCK ?auto_1271 ?auto_1272 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1271 ?auto_1272 ?auto_1270 )
      ( DELIVER-1PKG-VERIFY ?auto_1271 ?auto_1270 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1283 - OBJ
      ?auto_1282 - LOCATION
    )
    :vars
    (
      ?auto_1284 - TRUCK
      ?auto_1285 - LOCATION
      ?auto_1286 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1283 ?auto_1284 ) ( TRUCK-AT ?auto_1284 ?auto_1285 ) ( IN-CITY ?auto_1285 ?auto_1286 ) ( IN-CITY ?auto_1282 ?auto_1286 ) ( not ( = ?auto_1282 ?auto_1285 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1284 ?auto_1285 ?auto_1282 ?auto_1286 )
      ( DELIVER-1PKG ?auto_1283 ?auto_1282 )
      ( DELIVER-1PKG-VERIFY ?auto_1283 ?auto_1282 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1301 - OBJ
      ?auto_1300 - LOCATION
    )
    :vars
    (
      ?auto_1304 - TRUCK
      ?auto_1303 - LOCATION
      ?auto_1302 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1304 ?auto_1303 ) ( IN-CITY ?auto_1303 ?auto_1302 ) ( IN-CITY ?auto_1300 ?auto_1302 ) ( not ( = ?auto_1300 ?auto_1303 ) ) ( OBJ-AT ?auto_1301 ?auto_1303 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1301 ?auto_1304 ?auto_1303 )
      ( DELIVER-1PKG ?auto_1301 ?auto_1300 )
      ( DELIVER-1PKG-VERIFY ?auto_1301 ?auto_1300 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1319 - OBJ
      ?auto_1318 - LOCATION
    )
    :vars
    (
      ?auto_1322 - LOCATION
      ?auto_1321 - CITY
      ?auto_1320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1322 ?auto_1321 ) ( IN-CITY ?auto_1318 ?auto_1321 ) ( not ( = ?auto_1318 ?auto_1322 ) ) ( OBJ-AT ?auto_1319 ?auto_1322 ) ( TRUCK-AT ?auto_1320 ?auto_1318 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1320 ?auto_1318 ?auto_1322 ?auto_1321 )
      ( DELIVER-1PKG ?auto_1319 ?auto_1318 )
      ( DELIVER-1PKG-VERIFY ?auto_1319 ?auto_1318 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1376 - OBJ
      ?auto_1375 - LOCATION
    )
    :vars
    (
      ?auto_1377 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1377 ?auto_1375 ) ( IN-TRUCK ?auto_1376 ?auto_1377 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1376 ?auto_1377 ?auto_1375 )
      ( DELIVER-1PKG-VERIFY ?auto_1376 ?auto_1375 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1379 - OBJ
      ?auto_1380 - OBJ
      ?auto_1378 - LOCATION
    )
    :vars
    (
      ?auto_1381 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1381 ?auto_1378 ) ( IN-TRUCK ?auto_1380 ?auto_1381 ) ( OBJ-AT ?auto_1379 ?auto_1378 ) ( not ( = ?auto_1379 ?auto_1380 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1380 ?auto_1378 )
      ( DELIVER-2PKG-VERIFY ?auto_1379 ?auto_1380 ?auto_1378 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1383 - OBJ
      ?auto_1384 - OBJ
      ?auto_1382 - LOCATION
    )
    :vars
    (
      ?auto_1385 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1385 ?auto_1382 ) ( IN-TRUCK ?auto_1383 ?auto_1385 ) ( OBJ-AT ?auto_1384 ?auto_1382 ) ( not ( = ?auto_1383 ?auto_1384 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1383 ?auto_1382 )
      ( DELIVER-2PKG-VERIFY ?auto_1383 ?auto_1384 ?auto_1382 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1391 - OBJ
      ?auto_1392 - OBJ
      ?auto_1393 - OBJ
      ?auto_1390 - LOCATION
    )
    :vars
    (
      ?auto_1394 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1394 ?auto_1390 ) ( IN-TRUCK ?auto_1393 ?auto_1394 ) ( OBJ-AT ?auto_1391 ?auto_1390 ) ( OBJ-AT ?auto_1392 ?auto_1390 ) ( not ( = ?auto_1391 ?auto_1392 ) ) ( not ( = ?auto_1391 ?auto_1393 ) ) ( not ( = ?auto_1392 ?auto_1393 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1393 ?auto_1390 )
      ( DELIVER-3PKG-VERIFY ?auto_1391 ?auto_1392 ?auto_1393 ?auto_1390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1396 - OBJ
      ?auto_1397 - OBJ
      ?auto_1398 - OBJ
      ?auto_1395 - LOCATION
    )
    :vars
    (
      ?auto_1399 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1399 ?auto_1395 ) ( IN-TRUCK ?auto_1397 ?auto_1399 ) ( OBJ-AT ?auto_1396 ?auto_1395 ) ( OBJ-AT ?auto_1398 ?auto_1395 ) ( not ( = ?auto_1396 ?auto_1397 ) ) ( not ( = ?auto_1396 ?auto_1398 ) ) ( not ( = ?auto_1397 ?auto_1398 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1397 ?auto_1395 )
      ( DELIVER-3PKG-VERIFY ?auto_1396 ?auto_1397 ?auto_1398 ?auto_1395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1406 - OBJ
      ?auto_1407 - OBJ
      ?auto_1408 - OBJ
      ?auto_1405 - LOCATION
    )
    :vars
    (
      ?auto_1409 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1409 ?auto_1405 ) ( IN-TRUCK ?auto_1406 ?auto_1409 ) ( OBJ-AT ?auto_1407 ?auto_1405 ) ( OBJ-AT ?auto_1408 ?auto_1405 ) ( not ( = ?auto_1406 ?auto_1407 ) ) ( not ( = ?auto_1406 ?auto_1408 ) ) ( not ( = ?auto_1407 ?auto_1408 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1406 ?auto_1405 )
      ( DELIVER-3PKG-VERIFY ?auto_1406 ?auto_1407 ?auto_1408 ?auto_1405 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1426 - OBJ
      ?auto_1425 - LOCATION
    )
    :vars
    (
      ?auto_1427 - TRUCK
      ?auto_1428 - LOCATION
      ?auto_1429 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1426 ?auto_1427 ) ( TRUCK-AT ?auto_1427 ?auto_1428 ) ( IN-CITY ?auto_1428 ?auto_1429 ) ( IN-CITY ?auto_1425 ?auto_1429 ) ( not ( = ?auto_1425 ?auto_1428 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1427 ?auto_1428 ?auto_1425 ?auto_1429 )
      ( DELIVER-1PKG ?auto_1426 ?auto_1425 )
      ( DELIVER-1PKG-VERIFY ?auto_1426 ?auto_1425 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1431 - OBJ
      ?auto_1432 - OBJ
      ?auto_1430 - LOCATION
    )
    :vars
    (
      ?auto_1435 - TRUCK
      ?auto_1434 - LOCATION
      ?auto_1433 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1432 ?auto_1435 ) ( TRUCK-AT ?auto_1435 ?auto_1434 ) ( IN-CITY ?auto_1434 ?auto_1433 ) ( IN-CITY ?auto_1430 ?auto_1433 ) ( not ( = ?auto_1430 ?auto_1434 ) ) ( OBJ-AT ?auto_1431 ?auto_1430 ) ( not ( = ?auto_1431 ?auto_1432 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1432 ?auto_1430 )
      ( DELIVER-2PKG-VERIFY ?auto_1431 ?auto_1432 ?auto_1430 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1437 - OBJ
      ?auto_1438 - OBJ
      ?auto_1436 - LOCATION
    )
    :vars
    (
      ?auto_1440 - TRUCK
      ?auto_1439 - LOCATION
      ?auto_1441 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1437 ?auto_1440 ) ( TRUCK-AT ?auto_1440 ?auto_1439 ) ( IN-CITY ?auto_1439 ?auto_1441 ) ( IN-CITY ?auto_1436 ?auto_1441 ) ( not ( = ?auto_1436 ?auto_1439 ) ) ( OBJ-AT ?auto_1438 ?auto_1436 ) ( not ( = ?auto_1438 ?auto_1437 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1438 ?auto_1437 ?auto_1436 )
      ( DELIVER-2PKG-VERIFY ?auto_1437 ?auto_1438 ?auto_1436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1450 - OBJ
      ?auto_1451 - OBJ
      ?auto_1452 - OBJ
      ?auto_1449 - LOCATION
    )
    :vars
    (
      ?auto_1454 - TRUCK
      ?auto_1453 - LOCATION
      ?auto_1455 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1452 ?auto_1454 ) ( TRUCK-AT ?auto_1454 ?auto_1453 ) ( IN-CITY ?auto_1453 ?auto_1455 ) ( IN-CITY ?auto_1449 ?auto_1455 ) ( not ( = ?auto_1449 ?auto_1453 ) ) ( OBJ-AT ?auto_1451 ?auto_1449 ) ( not ( = ?auto_1451 ?auto_1452 ) ) ( OBJ-AT ?auto_1450 ?auto_1449 ) ( not ( = ?auto_1450 ?auto_1451 ) ) ( not ( = ?auto_1450 ?auto_1452 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1451 ?auto_1452 ?auto_1449 )
      ( DELIVER-3PKG-VERIFY ?auto_1450 ?auto_1451 ?auto_1452 ?auto_1449 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1457 - OBJ
      ?auto_1458 - OBJ
      ?auto_1459 - OBJ
      ?auto_1456 - LOCATION
    )
    :vars
    (
      ?auto_1461 - TRUCK
      ?auto_1460 - LOCATION
      ?auto_1462 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1458 ?auto_1461 ) ( TRUCK-AT ?auto_1461 ?auto_1460 ) ( IN-CITY ?auto_1460 ?auto_1462 ) ( IN-CITY ?auto_1456 ?auto_1462 ) ( not ( = ?auto_1456 ?auto_1460 ) ) ( OBJ-AT ?auto_1459 ?auto_1456 ) ( not ( = ?auto_1459 ?auto_1458 ) ) ( OBJ-AT ?auto_1457 ?auto_1456 ) ( not ( = ?auto_1457 ?auto_1458 ) ) ( not ( = ?auto_1457 ?auto_1459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1459 ?auto_1458 ?auto_1456 )
      ( DELIVER-3PKG-VERIFY ?auto_1457 ?auto_1458 ?auto_1459 ?auto_1456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1471 - OBJ
      ?auto_1472 - OBJ
      ?auto_1473 - OBJ
      ?auto_1470 - LOCATION
    )
    :vars
    (
      ?auto_1475 - TRUCK
      ?auto_1474 - LOCATION
      ?auto_1476 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1471 ?auto_1475 ) ( TRUCK-AT ?auto_1475 ?auto_1474 ) ( IN-CITY ?auto_1474 ?auto_1476 ) ( IN-CITY ?auto_1470 ?auto_1476 ) ( not ( = ?auto_1470 ?auto_1474 ) ) ( OBJ-AT ?auto_1472 ?auto_1470 ) ( not ( = ?auto_1472 ?auto_1471 ) ) ( OBJ-AT ?auto_1473 ?auto_1470 ) ( not ( = ?auto_1471 ?auto_1473 ) ) ( not ( = ?auto_1472 ?auto_1473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1472 ?auto_1471 ?auto_1470 )
      ( DELIVER-3PKG-VERIFY ?auto_1471 ?auto_1472 ?auto_1473 ?auto_1470 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1500 - OBJ
      ?auto_1499 - LOCATION
    )
    :vars
    (
      ?auto_1502 - TRUCK
      ?auto_1501 - LOCATION
      ?auto_1503 - CITY
      ?auto_1504 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1502 ?auto_1501 ) ( IN-CITY ?auto_1501 ?auto_1503 ) ( IN-CITY ?auto_1499 ?auto_1503 ) ( not ( = ?auto_1499 ?auto_1501 ) ) ( OBJ-AT ?auto_1504 ?auto_1499 ) ( not ( = ?auto_1504 ?auto_1500 ) ) ( OBJ-AT ?auto_1500 ?auto_1501 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1500 ?auto_1502 ?auto_1501 )
      ( DELIVER-2PKG ?auto_1504 ?auto_1500 ?auto_1499 )
      ( DELIVER-1PKG-VERIFY ?auto_1500 ?auto_1499 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1506 - OBJ
      ?auto_1507 - OBJ
      ?auto_1505 - LOCATION
    )
    :vars
    (
      ?auto_1510 - TRUCK
      ?auto_1509 - LOCATION
      ?auto_1508 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1510 ?auto_1509 ) ( IN-CITY ?auto_1509 ?auto_1508 ) ( IN-CITY ?auto_1505 ?auto_1508 ) ( not ( = ?auto_1505 ?auto_1509 ) ) ( OBJ-AT ?auto_1506 ?auto_1505 ) ( not ( = ?auto_1506 ?auto_1507 ) ) ( OBJ-AT ?auto_1507 ?auto_1509 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1507 ?auto_1505 )
      ( DELIVER-2PKG-VERIFY ?auto_1506 ?auto_1507 ?auto_1505 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1512 - OBJ
      ?auto_1513 - OBJ
      ?auto_1511 - LOCATION
    )
    :vars
    (
      ?auto_1515 - TRUCK
      ?auto_1514 - LOCATION
      ?auto_1516 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1515 ?auto_1514 ) ( IN-CITY ?auto_1514 ?auto_1516 ) ( IN-CITY ?auto_1511 ?auto_1516 ) ( not ( = ?auto_1511 ?auto_1514 ) ) ( OBJ-AT ?auto_1513 ?auto_1511 ) ( not ( = ?auto_1513 ?auto_1512 ) ) ( OBJ-AT ?auto_1512 ?auto_1514 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1513 ?auto_1512 ?auto_1511 )
      ( DELIVER-2PKG-VERIFY ?auto_1512 ?auto_1513 ?auto_1511 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1525 - OBJ
      ?auto_1526 - OBJ
      ?auto_1527 - OBJ
      ?auto_1524 - LOCATION
    )
    :vars
    (
      ?auto_1529 - TRUCK
      ?auto_1528 - LOCATION
      ?auto_1530 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1529 ?auto_1528 ) ( IN-CITY ?auto_1528 ?auto_1530 ) ( IN-CITY ?auto_1524 ?auto_1530 ) ( not ( = ?auto_1524 ?auto_1528 ) ) ( OBJ-AT ?auto_1526 ?auto_1524 ) ( not ( = ?auto_1526 ?auto_1527 ) ) ( OBJ-AT ?auto_1527 ?auto_1528 ) ( OBJ-AT ?auto_1525 ?auto_1524 ) ( not ( = ?auto_1525 ?auto_1526 ) ) ( not ( = ?auto_1525 ?auto_1527 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1526 ?auto_1527 ?auto_1524 )
      ( DELIVER-3PKG-VERIFY ?auto_1525 ?auto_1526 ?auto_1527 ?auto_1524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1532 - OBJ
      ?auto_1533 - OBJ
      ?auto_1534 - OBJ
      ?auto_1531 - LOCATION
    )
    :vars
    (
      ?auto_1536 - TRUCK
      ?auto_1535 - LOCATION
      ?auto_1537 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1536 ?auto_1535 ) ( IN-CITY ?auto_1535 ?auto_1537 ) ( IN-CITY ?auto_1531 ?auto_1537 ) ( not ( = ?auto_1531 ?auto_1535 ) ) ( OBJ-AT ?auto_1534 ?auto_1531 ) ( not ( = ?auto_1534 ?auto_1533 ) ) ( OBJ-AT ?auto_1533 ?auto_1535 ) ( OBJ-AT ?auto_1532 ?auto_1531 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1534 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1534 ?auto_1533 ?auto_1531 )
      ( DELIVER-3PKG-VERIFY ?auto_1532 ?auto_1533 ?auto_1534 ?auto_1531 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1546 - OBJ
      ?auto_1547 - OBJ
      ?auto_1548 - OBJ
      ?auto_1545 - LOCATION
    )
    :vars
    (
      ?auto_1550 - TRUCK
      ?auto_1549 - LOCATION
      ?auto_1551 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1550 ?auto_1549 ) ( IN-CITY ?auto_1549 ?auto_1551 ) ( IN-CITY ?auto_1545 ?auto_1551 ) ( not ( = ?auto_1545 ?auto_1549 ) ) ( OBJ-AT ?auto_1547 ?auto_1545 ) ( not ( = ?auto_1547 ?auto_1546 ) ) ( OBJ-AT ?auto_1546 ?auto_1549 ) ( OBJ-AT ?auto_1548 ?auto_1545 ) ( not ( = ?auto_1546 ?auto_1548 ) ) ( not ( = ?auto_1547 ?auto_1548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1547 ?auto_1546 ?auto_1545 )
      ( DELIVER-3PKG-VERIFY ?auto_1546 ?auto_1547 ?auto_1548 ?auto_1545 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1575 - OBJ
      ?auto_1574 - LOCATION
    )
    :vars
    (
      ?auto_1576 - LOCATION
      ?auto_1578 - CITY
      ?auto_1579 - OBJ
      ?auto_1577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1576 ?auto_1578 ) ( IN-CITY ?auto_1574 ?auto_1578 ) ( not ( = ?auto_1574 ?auto_1576 ) ) ( OBJ-AT ?auto_1579 ?auto_1574 ) ( not ( = ?auto_1579 ?auto_1575 ) ) ( OBJ-AT ?auto_1575 ?auto_1576 ) ( TRUCK-AT ?auto_1577 ?auto_1574 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1577 ?auto_1574 ?auto_1576 ?auto_1578 )
      ( DELIVER-2PKG ?auto_1579 ?auto_1575 ?auto_1574 )
      ( DELIVER-1PKG-VERIFY ?auto_1575 ?auto_1574 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1581 - OBJ
      ?auto_1582 - OBJ
      ?auto_1580 - LOCATION
    )
    :vars
    (
      ?auto_1585 - LOCATION
      ?auto_1584 - CITY
      ?auto_1583 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1585 ?auto_1584 ) ( IN-CITY ?auto_1580 ?auto_1584 ) ( not ( = ?auto_1580 ?auto_1585 ) ) ( OBJ-AT ?auto_1581 ?auto_1580 ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( OBJ-AT ?auto_1582 ?auto_1585 ) ( TRUCK-AT ?auto_1583 ?auto_1580 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1582 ?auto_1580 )
      ( DELIVER-2PKG-VERIFY ?auto_1581 ?auto_1582 ?auto_1580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1587 - OBJ
      ?auto_1588 - OBJ
      ?auto_1586 - LOCATION
    )
    :vars
    (
      ?auto_1591 - LOCATION
      ?auto_1589 - CITY
      ?auto_1590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1591 ?auto_1589 ) ( IN-CITY ?auto_1586 ?auto_1589 ) ( not ( = ?auto_1586 ?auto_1591 ) ) ( OBJ-AT ?auto_1588 ?auto_1586 ) ( not ( = ?auto_1588 ?auto_1587 ) ) ( OBJ-AT ?auto_1587 ?auto_1591 ) ( TRUCK-AT ?auto_1590 ?auto_1586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1588 ?auto_1587 ?auto_1586 )
      ( DELIVER-2PKG-VERIFY ?auto_1587 ?auto_1588 ?auto_1586 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1600 - OBJ
      ?auto_1601 - OBJ
      ?auto_1602 - OBJ
      ?auto_1599 - LOCATION
    )
    :vars
    (
      ?auto_1605 - LOCATION
      ?auto_1603 - CITY
      ?auto_1604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1605 ?auto_1603 ) ( IN-CITY ?auto_1599 ?auto_1603 ) ( not ( = ?auto_1599 ?auto_1605 ) ) ( OBJ-AT ?auto_1601 ?auto_1599 ) ( not ( = ?auto_1601 ?auto_1602 ) ) ( OBJ-AT ?auto_1602 ?auto_1605 ) ( TRUCK-AT ?auto_1604 ?auto_1599 ) ( OBJ-AT ?auto_1600 ?auto_1599 ) ( not ( = ?auto_1600 ?auto_1601 ) ) ( not ( = ?auto_1600 ?auto_1602 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1601 ?auto_1602 ?auto_1599 )
      ( DELIVER-3PKG-VERIFY ?auto_1600 ?auto_1601 ?auto_1602 ?auto_1599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1607 - OBJ
      ?auto_1608 - OBJ
      ?auto_1609 - OBJ
      ?auto_1606 - LOCATION
    )
    :vars
    (
      ?auto_1612 - LOCATION
      ?auto_1610 - CITY
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1612 ?auto_1610 ) ( IN-CITY ?auto_1606 ?auto_1610 ) ( not ( = ?auto_1606 ?auto_1612 ) ) ( OBJ-AT ?auto_1609 ?auto_1606 ) ( not ( = ?auto_1609 ?auto_1608 ) ) ( OBJ-AT ?auto_1608 ?auto_1612 ) ( TRUCK-AT ?auto_1611 ?auto_1606 ) ( OBJ-AT ?auto_1607 ?auto_1606 ) ( not ( = ?auto_1607 ?auto_1608 ) ) ( not ( = ?auto_1607 ?auto_1609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1609 ?auto_1608 ?auto_1606 )
      ( DELIVER-3PKG-VERIFY ?auto_1607 ?auto_1608 ?auto_1609 ?auto_1606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1621 - OBJ
      ?auto_1622 - OBJ
      ?auto_1623 - OBJ
      ?auto_1620 - LOCATION
    )
    :vars
    (
      ?auto_1626 - LOCATION
      ?auto_1624 - CITY
      ?auto_1625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1626 ?auto_1624 ) ( IN-CITY ?auto_1620 ?auto_1624 ) ( not ( = ?auto_1620 ?auto_1626 ) ) ( OBJ-AT ?auto_1622 ?auto_1620 ) ( not ( = ?auto_1622 ?auto_1621 ) ) ( OBJ-AT ?auto_1621 ?auto_1626 ) ( TRUCK-AT ?auto_1625 ?auto_1620 ) ( OBJ-AT ?auto_1623 ?auto_1620 ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1623 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1622 ?auto_1621 ?auto_1620 )
      ( DELIVER-3PKG-VERIFY ?auto_1621 ?auto_1622 ?auto_1623 ?auto_1620 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1650 - OBJ
      ?auto_1649 - LOCATION
    )
    :vars
    (
      ?auto_1653 - LOCATION
      ?auto_1651 - CITY
      ?auto_1654 - OBJ
      ?auto_1652 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1653 ?auto_1651 ) ( IN-CITY ?auto_1649 ?auto_1651 ) ( not ( = ?auto_1649 ?auto_1653 ) ) ( not ( = ?auto_1654 ?auto_1650 ) ) ( OBJ-AT ?auto_1650 ?auto_1653 ) ( TRUCK-AT ?auto_1652 ?auto_1649 ) ( IN-TRUCK ?auto_1654 ?auto_1652 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1654 ?auto_1649 )
      ( DELIVER-2PKG ?auto_1654 ?auto_1650 ?auto_1649 )
      ( DELIVER-1PKG-VERIFY ?auto_1650 ?auto_1649 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1656 - OBJ
      ?auto_1657 - OBJ
      ?auto_1655 - LOCATION
    )
    :vars
    (
      ?auto_1658 - LOCATION
      ?auto_1659 - CITY
      ?auto_1660 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1658 ?auto_1659 ) ( IN-CITY ?auto_1655 ?auto_1659 ) ( not ( = ?auto_1655 ?auto_1658 ) ) ( not ( = ?auto_1656 ?auto_1657 ) ) ( OBJ-AT ?auto_1657 ?auto_1658 ) ( TRUCK-AT ?auto_1660 ?auto_1655 ) ( IN-TRUCK ?auto_1656 ?auto_1660 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1657 ?auto_1655 )
      ( DELIVER-2PKG-VERIFY ?auto_1656 ?auto_1657 ?auto_1655 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1662 - OBJ
      ?auto_1663 - OBJ
      ?auto_1661 - LOCATION
    )
    :vars
    (
      ?auto_1665 - LOCATION
      ?auto_1666 - CITY
      ?auto_1664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1665 ?auto_1666 ) ( IN-CITY ?auto_1661 ?auto_1666 ) ( not ( = ?auto_1661 ?auto_1665 ) ) ( not ( = ?auto_1663 ?auto_1662 ) ) ( OBJ-AT ?auto_1662 ?auto_1665 ) ( TRUCK-AT ?auto_1664 ?auto_1661 ) ( IN-TRUCK ?auto_1663 ?auto_1664 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1663 ?auto_1662 ?auto_1661 )
      ( DELIVER-2PKG-VERIFY ?auto_1662 ?auto_1663 ?auto_1661 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1725 - OBJ
      ?auto_1724 - LOCATION
    )
    :vars
    (
      ?auto_1727 - LOCATION
      ?auto_1728 - CITY
      ?auto_1729 - OBJ
      ?auto_1726 - TRUCK
      ?auto_1730 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1727 ?auto_1728 ) ( IN-CITY ?auto_1724 ?auto_1728 ) ( not ( = ?auto_1724 ?auto_1727 ) ) ( not ( = ?auto_1729 ?auto_1725 ) ) ( OBJ-AT ?auto_1725 ?auto_1727 ) ( IN-TRUCK ?auto_1729 ?auto_1726 ) ( TRUCK-AT ?auto_1726 ?auto_1730 ) ( IN-CITY ?auto_1730 ?auto_1728 ) ( not ( = ?auto_1724 ?auto_1730 ) ) ( not ( = ?auto_1727 ?auto_1730 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1726 ?auto_1730 ?auto_1724 ?auto_1728 )
      ( DELIVER-2PKG ?auto_1729 ?auto_1725 ?auto_1724 )
      ( DELIVER-1PKG-VERIFY ?auto_1725 ?auto_1724 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1732 - OBJ
      ?auto_1733 - OBJ
      ?auto_1731 - LOCATION
    )
    :vars
    (
      ?auto_1734 - LOCATION
      ?auto_1735 - CITY
      ?auto_1736 - TRUCK
      ?auto_1737 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1734 ?auto_1735 ) ( IN-CITY ?auto_1731 ?auto_1735 ) ( not ( = ?auto_1731 ?auto_1734 ) ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( OBJ-AT ?auto_1733 ?auto_1734 ) ( IN-TRUCK ?auto_1732 ?auto_1736 ) ( TRUCK-AT ?auto_1736 ?auto_1737 ) ( IN-CITY ?auto_1737 ?auto_1735 ) ( not ( = ?auto_1731 ?auto_1737 ) ) ( not ( = ?auto_1734 ?auto_1737 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1733 ?auto_1731 )
      ( DELIVER-2PKG-VERIFY ?auto_1732 ?auto_1733 ?auto_1731 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1739 - OBJ
      ?auto_1740 - OBJ
      ?auto_1738 - LOCATION
    )
    :vars
    (
      ?auto_1742 - LOCATION
      ?auto_1744 - CITY
      ?auto_1741 - TRUCK
      ?auto_1743 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1742 ?auto_1744 ) ( IN-CITY ?auto_1738 ?auto_1744 ) ( not ( = ?auto_1738 ?auto_1742 ) ) ( not ( = ?auto_1740 ?auto_1739 ) ) ( OBJ-AT ?auto_1739 ?auto_1742 ) ( IN-TRUCK ?auto_1740 ?auto_1741 ) ( TRUCK-AT ?auto_1741 ?auto_1743 ) ( IN-CITY ?auto_1743 ?auto_1744 ) ( not ( = ?auto_1738 ?auto_1743 ) ) ( not ( = ?auto_1742 ?auto_1743 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1740 ?auto_1739 ?auto_1738 )
      ( DELIVER-2PKG-VERIFY ?auto_1739 ?auto_1740 ?auto_1738 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1811 - OBJ
      ?auto_1810 - LOCATION
    )
    :vars
    (
      ?auto_1813 - LOCATION
      ?auto_1815 - CITY
      ?auto_1816 - OBJ
      ?auto_1812 - TRUCK
      ?auto_1814 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1813 ?auto_1815 ) ( IN-CITY ?auto_1810 ?auto_1815 ) ( not ( = ?auto_1810 ?auto_1813 ) ) ( not ( = ?auto_1816 ?auto_1811 ) ) ( OBJ-AT ?auto_1811 ?auto_1813 ) ( TRUCK-AT ?auto_1812 ?auto_1814 ) ( IN-CITY ?auto_1814 ?auto_1815 ) ( not ( = ?auto_1810 ?auto_1814 ) ) ( not ( = ?auto_1813 ?auto_1814 ) ) ( OBJ-AT ?auto_1816 ?auto_1814 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1816 ?auto_1812 ?auto_1814 )
      ( DELIVER-2PKG ?auto_1816 ?auto_1811 ?auto_1810 )
      ( DELIVER-1PKG-VERIFY ?auto_1811 ?auto_1810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1818 - OBJ
      ?auto_1819 - OBJ
      ?auto_1817 - LOCATION
    )
    :vars
    (
      ?auto_1821 - LOCATION
      ?auto_1820 - CITY
      ?auto_1822 - TRUCK
      ?auto_1823 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1821 ?auto_1820 ) ( IN-CITY ?auto_1817 ?auto_1820 ) ( not ( = ?auto_1817 ?auto_1821 ) ) ( not ( = ?auto_1818 ?auto_1819 ) ) ( OBJ-AT ?auto_1819 ?auto_1821 ) ( TRUCK-AT ?auto_1822 ?auto_1823 ) ( IN-CITY ?auto_1823 ?auto_1820 ) ( not ( = ?auto_1817 ?auto_1823 ) ) ( not ( = ?auto_1821 ?auto_1823 ) ) ( OBJ-AT ?auto_1818 ?auto_1823 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1819 ?auto_1817 )
      ( DELIVER-2PKG-VERIFY ?auto_1818 ?auto_1819 ?auto_1817 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1825 - OBJ
      ?auto_1826 - OBJ
      ?auto_1824 - LOCATION
    )
    :vars
    (
      ?auto_1830 - LOCATION
      ?auto_1828 - CITY
      ?auto_1827 - TRUCK
      ?auto_1829 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1830 ?auto_1828 ) ( IN-CITY ?auto_1824 ?auto_1828 ) ( not ( = ?auto_1824 ?auto_1830 ) ) ( not ( = ?auto_1826 ?auto_1825 ) ) ( OBJ-AT ?auto_1825 ?auto_1830 ) ( TRUCK-AT ?auto_1827 ?auto_1829 ) ( IN-CITY ?auto_1829 ?auto_1828 ) ( not ( = ?auto_1824 ?auto_1829 ) ) ( not ( = ?auto_1830 ?auto_1829 ) ) ( OBJ-AT ?auto_1826 ?auto_1829 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1826 ?auto_1825 ?auto_1824 )
      ( DELIVER-2PKG-VERIFY ?auto_1825 ?auto_1826 ?auto_1824 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1897 - OBJ
      ?auto_1896 - LOCATION
    )
    :vars
    (
      ?auto_1901 - LOCATION
      ?auto_1899 - CITY
      ?auto_1902 - OBJ
      ?auto_1900 - LOCATION
      ?auto_1898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1901 ?auto_1899 ) ( IN-CITY ?auto_1896 ?auto_1899 ) ( not ( = ?auto_1896 ?auto_1901 ) ) ( not ( = ?auto_1902 ?auto_1897 ) ) ( OBJ-AT ?auto_1897 ?auto_1901 ) ( IN-CITY ?auto_1900 ?auto_1899 ) ( not ( = ?auto_1896 ?auto_1900 ) ) ( not ( = ?auto_1901 ?auto_1900 ) ) ( OBJ-AT ?auto_1902 ?auto_1900 ) ( TRUCK-AT ?auto_1898 ?auto_1896 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1898 ?auto_1896 ?auto_1900 ?auto_1899 )
      ( DELIVER-2PKG ?auto_1902 ?auto_1897 ?auto_1896 )
      ( DELIVER-1PKG-VERIFY ?auto_1897 ?auto_1896 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1904 - OBJ
      ?auto_1905 - OBJ
      ?auto_1903 - LOCATION
    )
    :vars
    (
      ?auto_1908 - LOCATION
      ?auto_1909 - CITY
      ?auto_1906 - LOCATION
      ?auto_1907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1908 ?auto_1909 ) ( IN-CITY ?auto_1903 ?auto_1909 ) ( not ( = ?auto_1903 ?auto_1908 ) ) ( not ( = ?auto_1904 ?auto_1905 ) ) ( OBJ-AT ?auto_1905 ?auto_1908 ) ( IN-CITY ?auto_1906 ?auto_1909 ) ( not ( = ?auto_1903 ?auto_1906 ) ) ( not ( = ?auto_1908 ?auto_1906 ) ) ( OBJ-AT ?auto_1904 ?auto_1906 ) ( TRUCK-AT ?auto_1907 ?auto_1903 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1905 ?auto_1903 )
      ( DELIVER-2PKG-VERIFY ?auto_1904 ?auto_1905 ?auto_1903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1911 - OBJ
      ?auto_1912 - OBJ
      ?auto_1910 - LOCATION
    )
    :vars
    (
      ?auto_1916 - LOCATION
      ?auto_1915 - CITY
      ?auto_1914 - LOCATION
      ?auto_1913 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1916 ?auto_1915 ) ( IN-CITY ?auto_1910 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1916 ) ) ( not ( = ?auto_1912 ?auto_1911 ) ) ( OBJ-AT ?auto_1911 ?auto_1916 ) ( IN-CITY ?auto_1914 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1914 ) ) ( not ( = ?auto_1916 ?auto_1914 ) ) ( OBJ-AT ?auto_1912 ?auto_1914 ) ( TRUCK-AT ?auto_1913 ?auto_1910 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1912 ?auto_1911 ?auto_1910 )
      ( DELIVER-2PKG-VERIFY ?auto_1911 ?auto_1912 ?auto_1910 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2076 - OBJ
      ?auto_2075 - LOCATION
    )
    :vars
    (
      ?auto_2077 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2077 ?auto_2075 ) ( IN-TRUCK ?auto_2076 ?auto_2077 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2076 ?auto_2077 ?auto_2075 )
      ( DELIVER-1PKG-VERIFY ?auto_2076 ?auto_2075 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2079 - OBJ
      ?auto_2080 - OBJ
      ?auto_2078 - LOCATION
    )
    :vars
    (
      ?auto_2081 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2081 ?auto_2078 ) ( IN-TRUCK ?auto_2080 ?auto_2081 ) ( OBJ-AT ?auto_2079 ?auto_2078 ) ( not ( = ?auto_2079 ?auto_2080 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2080 ?auto_2078 )
      ( DELIVER-2PKG-VERIFY ?auto_2079 ?auto_2080 ?auto_2078 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2083 - OBJ
      ?auto_2084 - OBJ
      ?auto_2082 - LOCATION
    )
    :vars
    (
      ?auto_2085 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2085 ?auto_2082 ) ( IN-TRUCK ?auto_2084 ?auto_2085 ) ( OBJ-AT ?auto_2083 ?auto_2082 ) ( not ( = ?auto_2083 ?auto_2084 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2084 ?auto_2082 )
      ( DELIVER-2PKG-VERIFY ?auto_2083 ?auto_2084 ?auto_2082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2087 - OBJ
      ?auto_2088 - OBJ
      ?auto_2086 - LOCATION
    )
    :vars
    (
      ?auto_2089 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2089 ?auto_2086 ) ( IN-TRUCK ?auto_2087 ?auto_2089 ) ( OBJ-AT ?auto_2088 ?auto_2086 ) ( not ( = ?auto_2087 ?auto_2088 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2087 ?auto_2086 )
      ( DELIVER-2PKG-VERIFY ?auto_2087 ?auto_2088 ?auto_2086 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2091 - OBJ
      ?auto_2092 - OBJ
      ?auto_2090 - LOCATION
    )
    :vars
    (
      ?auto_2093 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2093 ?auto_2090 ) ( IN-TRUCK ?auto_2091 ?auto_2093 ) ( OBJ-AT ?auto_2092 ?auto_2090 ) ( not ( = ?auto_2091 ?auto_2092 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2091 ?auto_2090 )
      ( DELIVER-2PKG-VERIFY ?auto_2091 ?auto_2092 ?auto_2090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2099 - OBJ
      ?auto_2100 - OBJ
      ?auto_2101 - OBJ
      ?auto_2098 - LOCATION
    )
    :vars
    (
      ?auto_2102 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2102 ?auto_2098 ) ( IN-TRUCK ?auto_2101 ?auto_2102 ) ( OBJ-AT ?auto_2099 ?auto_2098 ) ( OBJ-AT ?auto_2100 ?auto_2098 ) ( not ( = ?auto_2099 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2101 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2101 ?auto_2098 )
      ( DELIVER-3PKG-VERIFY ?auto_2099 ?auto_2100 ?auto_2101 ?auto_2098 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2104 - OBJ
      ?auto_2105 - OBJ
      ?auto_2106 - OBJ
      ?auto_2103 - LOCATION
    )
    :vars
    (
      ?auto_2107 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2107 ?auto_2103 ) ( IN-TRUCK ?auto_2106 ?auto_2107 ) ( OBJ-AT ?auto_2104 ?auto_2103 ) ( OBJ-AT ?auto_2105 ?auto_2103 ) ( not ( = ?auto_2104 ?auto_2105 ) ) ( not ( = ?auto_2104 ?auto_2106 ) ) ( not ( = ?auto_2105 ?auto_2106 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2106 ?auto_2103 )
      ( DELIVER-3PKG-VERIFY ?auto_2104 ?auto_2105 ?auto_2106 ?auto_2103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2109 - OBJ
      ?auto_2110 - OBJ
      ?auto_2111 - OBJ
      ?auto_2108 - LOCATION
    )
    :vars
    (
      ?auto_2112 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2112 ?auto_2108 ) ( IN-TRUCK ?auto_2110 ?auto_2112 ) ( OBJ-AT ?auto_2109 ?auto_2108 ) ( OBJ-AT ?auto_2111 ?auto_2108 ) ( not ( = ?auto_2109 ?auto_2110 ) ) ( not ( = ?auto_2109 ?auto_2111 ) ) ( not ( = ?auto_2110 ?auto_2111 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2110 ?auto_2108 )
      ( DELIVER-3PKG-VERIFY ?auto_2109 ?auto_2110 ?auto_2111 ?auto_2108 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2114 - OBJ
      ?auto_2115 - OBJ
      ?auto_2116 - OBJ
      ?auto_2113 - LOCATION
    )
    :vars
    (
      ?auto_2117 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2117 ?auto_2113 ) ( IN-TRUCK ?auto_2115 ?auto_2117 ) ( OBJ-AT ?auto_2114 ?auto_2113 ) ( OBJ-AT ?auto_2116 ?auto_2113 ) ( not ( = ?auto_2114 ?auto_2115 ) ) ( not ( = ?auto_2114 ?auto_2116 ) ) ( not ( = ?auto_2115 ?auto_2116 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2115 ?auto_2113 )
      ( DELIVER-3PKG-VERIFY ?auto_2114 ?auto_2115 ?auto_2116 ?auto_2113 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2124 - OBJ
      ?auto_2125 - OBJ
      ?auto_2126 - OBJ
      ?auto_2123 - LOCATION
    )
    :vars
    (
      ?auto_2127 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2127 ?auto_2123 ) ( IN-TRUCK ?auto_2126 ?auto_2127 ) ( OBJ-AT ?auto_2124 ?auto_2123 ) ( OBJ-AT ?auto_2125 ?auto_2123 ) ( not ( = ?auto_2124 ?auto_2125 ) ) ( not ( = ?auto_2124 ?auto_2126 ) ) ( not ( = ?auto_2125 ?auto_2126 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2126 ?auto_2123 )
      ( DELIVER-3PKG-VERIFY ?auto_2124 ?auto_2125 ?auto_2126 ?auto_2123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2129 - OBJ
      ?auto_2130 - OBJ
      ?auto_2131 - OBJ
      ?auto_2128 - LOCATION
    )
    :vars
    (
      ?auto_2132 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2132 ?auto_2128 ) ( IN-TRUCK ?auto_2131 ?auto_2132 ) ( OBJ-AT ?auto_2129 ?auto_2128 ) ( OBJ-AT ?auto_2130 ?auto_2128 ) ( not ( = ?auto_2129 ?auto_2130 ) ) ( not ( = ?auto_2129 ?auto_2131 ) ) ( not ( = ?auto_2130 ?auto_2131 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2131 ?auto_2128 )
      ( DELIVER-3PKG-VERIFY ?auto_2129 ?auto_2130 ?auto_2131 ?auto_2128 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2134 - OBJ
      ?auto_2135 - OBJ
      ?auto_2136 - OBJ
      ?auto_2133 - LOCATION
    )
    :vars
    (
      ?auto_2137 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2137 ?auto_2133 ) ( IN-TRUCK ?auto_2135 ?auto_2137 ) ( OBJ-AT ?auto_2134 ?auto_2133 ) ( OBJ-AT ?auto_2136 ?auto_2133 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2136 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2135 ?auto_2133 )
      ( DELIVER-3PKG-VERIFY ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2139 - OBJ
      ?auto_2140 - OBJ
      ?auto_2141 - OBJ
      ?auto_2138 - LOCATION
    )
    :vars
    (
      ?auto_2142 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2142 ?auto_2138 ) ( IN-TRUCK ?auto_2140 ?auto_2142 ) ( OBJ-AT ?auto_2139 ?auto_2138 ) ( OBJ-AT ?auto_2141 ?auto_2138 ) ( not ( = ?auto_2139 ?auto_2140 ) ) ( not ( = ?auto_2139 ?auto_2141 ) ) ( not ( = ?auto_2140 ?auto_2141 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2140 ?auto_2138 )
      ( DELIVER-3PKG-VERIFY ?auto_2139 ?auto_2140 ?auto_2141 ?auto_2138 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2149 - OBJ
      ?auto_2150 - OBJ
      ?auto_2151 - OBJ
      ?auto_2148 - LOCATION
    )
    :vars
    (
      ?auto_2152 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2152 ?auto_2148 ) ( IN-TRUCK ?auto_2149 ?auto_2152 ) ( OBJ-AT ?auto_2150 ?auto_2148 ) ( OBJ-AT ?auto_2151 ?auto_2148 ) ( not ( = ?auto_2149 ?auto_2150 ) ) ( not ( = ?auto_2149 ?auto_2151 ) ) ( not ( = ?auto_2150 ?auto_2151 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2149 ?auto_2148 )
      ( DELIVER-3PKG-VERIFY ?auto_2149 ?auto_2150 ?auto_2151 ?auto_2148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2154 - OBJ
      ?auto_2155 - OBJ
      ?auto_2156 - OBJ
      ?auto_2153 - LOCATION
    )
    :vars
    (
      ?auto_2157 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2157 ?auto_2153 ) ( IN-TRUCK ?auto_2154 ?auto_2157 ) ( OBJ-AT ?auto_2155 ?auto_2153 ) ( OBJ-AT ?auto_2156 ?auto_2153 ) ( not ( = ?auto_2154 ?auto_2155 ) ) ( not ( = ?auto_2154 ?auto_2156 ) ) ( not ( = ?auto_2155 ?auto_2156 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2154 ?auto_2153 )
      ( DELIVER-3PKG-VERIFY ?auto_2154 ?auto_2155 ?auto_2156 ?auto_2153 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2164 - OBJ
      ?auto_2165 - OBJ
      ?auto_2166 - OBJ
      ?auto_2163 - LOCATION
    )
    :vars
    (
      ?auto_2167 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2167 ?auto_2163 ) ( IN-TRUCK ?auto_2164 ?auto_2167 ) ( OBJ-AT ?auto_2165 ?auto_2163 ) ( OBJ-AT ?auto_2166 ?auto_2163 ) ( not ( = ?auto_2164 ?auto_2165 ) ) ( not ( = ?auto_2164 ?auto_2166 ) ) ( not ( = ?auto_2165 ?auto_2166 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2164 ?auto_2163 )
      ( DELIVER-3PKG-VERIFY ?auto_2164 ?auto_2165 ?auto_2166 ?auto_2163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2169 - OBJ
      ?auto_2170 - OBJ
      ?auto_2171 - OBJ
      ?auto_2168 - LOCATION
    )
    :vars
    (
      ?auto_2172 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2172 ?auto_2168 ) ( IN-TRUCK ?auto_2169 ?auto_2172 ) ( OBJ-AT ?auto_2170 ?auto_2168 ) ( OBJ-AT ?auto_2171 ?auto_2168 ) ( not ( = ?auto_2169 ?auto_2170 ) ) ( not ( = ?auto_2169 ?auto_2171 ) ) ( not ( = ?auto_2170 ?auto_2171 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2169 ?auto_2168 )
      ( DELIVER-3PKG-VERIFY ?auto_2169 ?auto_2170 ?auto_2171 ?auto_2168 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2194 - OBJ
      ?auto_2193 - LOCATION
    )
    :vars
    (
      ?auto_2195 - TRUCK
      ?auto_2196 - LOCATION
      ?auto_2197 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2194 ?auto_2195 ) ( TRUCK-AT ?auto_2195 ?auto_2196 ) ( IN-CITY ?auto_2196 ?auto_2197 ) ( IN-CITY ?auto_2193 ?auto_2197 ) ( not ( = ?auto_2193 ?auto_2196 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2195 ?auto_2196 ?auto_2193 ?auto_2197 )
      ( DELIVER-1PKG ?auto_2194 ?auto_2193 )
      ( DELIVER-1PKG-VERIFY ?auto_2194 ?auto_2193 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2199 - OBJ
      ?auto_2200 - OBJ
      ?auto_2198 - LOCATION
    )
    :vars
    (
      ?auto_2202 - TRUCK
      ?auto_2201 - LOCATION
      ?auto_2203 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2200 ?auto_2202 ) ( TRUCK-AT ?auto_2202 ?auto_2201 ) ( IN-CITY ?auto_2201 ?auto_2203 ) ( IN-CITY ?auto_2198 ?auto_2203 ) ( not ( = ?auto_2198 ?auto_2201 ) ) ( OBJ-AT ?auto_2199 ?auto_2198 ) ( not ( = ?auto_2199 ?auto_2200 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2200 ?auto_2198 )
      ( DELIVER-2PKG-VERIFY ?auto_2199 ?auto_2200 ?auto_2198 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2205 - OBJ
      ?auto_2206 - OBJ
      ?auto_2204 - LOCATION
    )
    :vars
    (
      ?auto_2209 - TRUCK
      ?auto_2208 - LOCATION
      ?auto_2207 - CITY
      ?auto_2210 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2206 ?auto_2209 ) ( TRUCK-AT ?auto_2209 ?auto_2208 ) ( IN-CITY ?auto_2208 ?auto_2207 ) ( IN-CITY ?auto_2204 ?auto_2207 ) ( not ( = ?auto_2204 ?auto_2208 ) ) ( OBJ-AT ?auto_2210 ?auto_2204 ) ( not ( = ?auto_2210 ?auto_2206 ) ) ( OBJ-AT ?auto_2205 ?auto_2204 ) ( not ( = ?auto_2205 ?auto_2206 ) ) ( not ( = ?auto_2205 ?auto_2210 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2210 ?auto_2206 ?auto_2204 )
      ( DELIVER-2PKG-VERIFY ?auto_2205 ?auto_2206 ?auto_2204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2212 - OBJ
      ?auto_2213 - OBJ
      ?auto_2211 - LOCATION
    )
    :vars
    (
      ?auto_2216 - TRUCK
      ?auto_2215 - LOCATION
      ?auto_2214 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2212 ?auto_2216 ) ( TRUCK-AT ?auto_2216 ?auto_2215 ) ( IN-CITY ?auto_2215 ?auto_2214 ) ( IN-CITY ?auto_2211 ?auto_2214 ) ( not ( = ?auto_2211 ?auto_2215 ) ) ( OBJ-AT ?auto_2213 ?auto_2211 ) ( not ( = ?auto_2213 ?auto_2212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2213 ?auto_2212 ?auto_2211 )
      ( DELIVER-2PKG-VERIFY ?auto_2212 ?auto_2213 ?auto_2211 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2218 - OBJ
      ?auto_2219 - OBJ
      ?auto_2217 - LOCATION
    )
    :vars
    (
      ?auto_2222 - TRUCK
      ?auto_2221 - LOCATION
      ?auto_2220 - CITY
      ?auto_2223 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2218 ?auto_2222 ) ( TRUCK-AT ?auto_2222 ?auto_2221 ) ( IN-CITY ?auto_2221 ?auto_2220 ) ( IN-CITY ?auto_2217 ?auto_2220 ) ( not ( = ?auto_2217 ?auto_2221 ) ) ( OBJ-AT ?auto_2223 ?auto_2217 ) ( not ( = ?auto_2223 ?auto_2218 ) ) ( OBJ-AT ?auto_2219 ?auto_2217 ) ( not ( = ?auto_2218 ?auto_2219 ) ) ( not ( = ?auto_2219 ?auto_2223 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2223 ?auto_2218 ?auto_2217 )
      ( DELIVER-2PKG-VERIFY ?auto_2218 ?auto_2219 ?auto_2217 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2232 - OBJ
      ?auto_2233 - OBJ
      ?auto_2234 - OBJ
      ?auto_2231 - LOCATION
    )
    :vars
    (
      ?auto_2237 - TRUCK
      ?auto_2236 - LOCATION
      ?auto_2235 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2234 ?auto_2237 ) ( TRUCK-AT ?auto_2237 ?auto_2236 ) ( IN-CITY ?auto_2236 ?auto_2235 ) ( IN-CITY ?auto_2231 ?auto_2235 ) ( not ( = ?auto_2231 ?auto_2236 ) ) ( OBJ-AT ?auto_2233 ?auto_2231 ) ( not ( = ?auto_2233 ?auto_2234 ) ) ( OBJ-AT ?auto_2232 ?auto_2231 ) ( not ( = ?auto_2232 ?auto_2233 ) ) ( not ( = ?auto_2232 ?auto_2234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2233 ?auto_2234 ?auto_2231 )
      ( DELIVER-3PKG-VERIFY ?auto_2232 ?auto_2233 ?auto_2234 ?auto_2231 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2239 - OBJ
      ?auto_2240 - OBJ
      ?auto_2241 - OBJ
      ?auto_2238 - LOCATION
    )
    :vars
    (
      ?auto_2244 - TRUCK
      ?auto_2243 - LOCATION
      ?auto_2242 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2241 ?auto_2244 ) ( TRUCK-AT ?auto_2244 ?auto_2243 ) ( IN-CITY ?auto_2243 ?auto_2242 ) ( IN-CITY ?auto_2238 ?auto_2242 ) ( not ( = ?auto_2238 ?auto_2243 ) ) ( OBJ-AT ?auto_2239 ?auto_2238 ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( OBJ-AT ?auto_2240 ?auto_2238 ) ( not ( = ?auto_2239 ?auto_2240 ) ) ( not ( = ?auto_2240 ?auto_2241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2239 ?auto_2241 ?auto_2238 )
      ( DELIVER-3PKG-VERIFY ?auto_2239 ?auto_2240 ?auto_2241 ?auto_2238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2246 - OBJ
      ?auto_2247 - OBJ
      ?auto_2248 - OBJ
      ?auto_2245 - LOCATION
    )
    :vars
    (
      ?auto_2251 - TRUCK
      ?auto_2250 - LOCATION
      ?auto_2249 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2247 ?auto_2251 ) ( TRUCK-AT ?auto_2251 ?auto_2250 ) ( IN-CITY ?auto_2250 ?auto_2249 ) ( IN-CITY ?auto_2245 ?auto_2249 ) ( not ( = ?auto_2245 ?auto_2250 ) ) ( OBJ-AT ?auto_2248 ?auto_2245 ) ( not ( = ?auto_2248 ?auto_2247 ) ) ( OBJ-AT ?auto_2246 ?auto_2245 ) ( not ( = ?auto_2246 ?auto_2247 ) ) ( not ( = ?auto_2246 ?auto_2248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2248 ?auto_2247 ?auto_2245 )
      ( DELIVER-3PKG-VERIFY ?auto_2246 ?auto_2247 ?auto_2248 ?auto_2245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2253 - OBJ
      ?auto_2254 - OBJ
      ?auto_2255 - OBJ
      ?auto_2252 - LOCATION
    )
    :vars
    (
      ?auto_2258 - TRUCK
      ?auto_2257 - LOCATION
      ?auto_2256 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2254 ?auto_2258 ) ( TRUCK-AT ?auto_2258 ?auto_2257 ) ( IN-CITY ?auto_2257 ?auto_2256 ) ( IN-CITY ?auto_2252 ?auto_2256 ) ( not ( = ?auto_2252 ?auto_2257 ) ) ( OBJ-AT ?auto_2253 ?auto_2252 ) ( not ( = ?auto_2253 ?auto_2254 ) ) ( OBJ-AT ?auto_2255 ?auto_2252 ) ( not ( = ?auto_2253 ?auto_2255 ) ) ( not ( = ?auto_2254 ?auto_2255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2253 ?auto_2254 ?auto_2252 )
      ( DELIVER-3PKG-VERIFY ?auto_2253 ?auto_2254 ?auto_2255 ?auto_2252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2267 - OBJ
      ?auto_2268 - OBJ
      ?auto_2269 - OBJ
      ?auto_2266 - LOCATION
    )
    :vars
    (
      ?auto_2272 - TRUCK
      ?auto_2271 - LOCATION
      ?auto_2270 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2269 ?auto_2272 ) ( TRUCK-AT ?auto_2272 ?auto_2271 ) ( IN-CITY ?auto_2271 ?auto_2270 ) ( IN-CITY ?auto_2266 ?auto_2270 ) ( not ( = ?auto_2266 ?auto_2271 ) ) ( OBJ-AT ?auto_2268 ?auto_2266 ) ( not ( = ?auto_2268 ?auto_2269 ) ) ( OBJ-AT ?auto_2267 ?auto_2266 ) ( not ( = ?auto_2267 ?auto_2268 ) ) ( not ( = ?auto_2267 ?auto_2269 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2268 ?auto_2269 ?auto_2266 )
      ( DELIVER-3PKG-VERIFY ?auto_2267 ?auto_2268 ?auto_2269 ?auto_2266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2274 - OBJ
      ?auto_2275 - OBJ
      ?auto_2276 - OBJ
      ?auto_2273 - LOCATION
    )
    :vars
    (
      ?auto_2279 - TRUCK
      ?auto_2278 - LOCATION
      ?auto_2277 - CITY
      ?auto_2280 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2276 ?auto_2279 ) ( TRUCK-AT ?auto_2279 ?auto_2278 ) ( IN-CITY ?auto_2278 ?auto_2277 ) ( IN-CITY ?auto_2273 ?auto_2277 ) ( not ( = ?auto_2273 ?auto_2278 ) ) ( OBJ-AT ?auto_2280 ?auto_2273 ) ( not ( = ?auto_2280 ?auto_2276 ) ) ( OBJ-AT ?auto_2274 ?auto_2273 ) ( OBJ-AT ?auto_2275 ?auto_2273 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2280 ) ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2280 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2280 ?auto_2276 ?auto_2273 )
      ( DELIVER-3PKG-VERIFY ?auto_2274 ?auto_2275 ?auto_2276 ?auto_2273 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2282 - OBJ
      ?auto_2283 - OBJ
      ?auto_2284 - OBJ
      ?auto_2281 - LOCATION
    )
    :vars
    (
      ?auto_2287 - TRUCK
      ?auto_2286 - LOCATION
      ?auto_2285 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2283 ?auto_2287 ) ( TRUCK-AT ?auto_2287 ?auto_2286 ) ( IN-CITY ?auto_2286 ?auto_2285 ) ( IN-CITY ?auto_2281 ?auto_2285 ) ( not ( = ?auto_2281 ?auto_2286 ) ) ( OBJ-AT ?auto_2284 ?auto_2281 ) ( not ( = ?auto_2284 ?auto_2283 ) ) ( OBJ-AT ?auto_2282 ?auto_2281 ) ( not ( = ?auto_2282 ?auto_2283 ) ) ( not ( = ?auto_2282 ?auto_2284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2284 ?auto_2283 ?auto_2281 )
      ( DELIVER-3PKG-VERIFY ?auto_2282 ?auto_2283 ?auto_2284 ?auto_2281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2289 - OBJ
      ?auto_2290 - OBJ
      ?auto_2291 - OBJ
      ?auto_2288 - LOCATION
    )
    :vars
    (
      ?auto_2294 - TRUCK
      ?auto_2293 - LOCATION
      ?auto_2292 - CITY
      ?auto_2295 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2290 ?auto_2294 ) ( TRUCK-AT ?auto_2294 ?auto_2293 ) ( IN-CITY ?auto_2293 ?auto_2292 ) ( IN-CITY ?auto_2288 ?auto_2292 ) ( not ( = ?auto_2288 ?auto_2293 ) ) ( OBJ-AT ?auto_2295 ?auto_2288 ) ( not ( = ?auto_2295 ?auto_2290 ) ) ( OBJ-AT ?auto_2289 ?auto_2288 ) ( OBJ-AT ?auto_2291 ?auto_2288 ) ( not ( = ?auto_2289 ?auto_2290 ) ) ( not ( = ?auto_2289 ?auto_2291 ) ) ( not ( = ?auto_2289 ?auto_2295 ) ) ( not ( = ?auto_2290 ?auto_2291 ) ) ( not ( = ?auto_2291 ?auto_2295 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2295 ?auto_2290 ?auto_2288 )
      ( DELIVER-3PKG-VERIFY ?auto_2289 ?auto_2290 ?auto_2291 ?auto_2288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2305 - OBJ
      ?auto_2306 - OBJ
      ?auto_2307 - OBJ
      ?auto_2304 - LOCATION
    )
    :vars
    (
      ?auto_2310 - TRUCK
      ?auto_2309 - LOCATION
      ?auto_2308 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2305 ?auto_2310 ) ( TRUCK-AT ?auto_2310 ?auto_2309 ) ( IN-CITY ?auto_2309 ?auto_2308 ) ( IN-CITY ?auto_2304 ?auto_2308 ) ( not ( = ?auto_2304 ?auto_2309 ) ) ( OBJ-AT ?auto_2307 ?auto_2304 ) ( not ( = ?auto_2307 ?auto_2305 ) ) ( OBJ-AT ?auto_2306 ?auto_2304 ) ( not ( = ?auto_2305 ?auto_2306 ) ) ( not ( = ?auto_2306 ?auto_2307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2307 ?auto_2305 ?auto_2304 )
      ( DELIVER-3PKG-VERIFY ?auto_2305 ?auto_2306 ?auto_2307 ?auto_2304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2312 - OBJ
      ?auto_2313 - OBJ
      ?auto_2314 - OBJ
      ?auto_2311 - LOCATION
    )
    :vars
    (
      ?auto_2317 - TRUCK
      ?auto_2316 - LOCATION
      ?auto_2315 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2312 ?auto_2317 ) ( TRUCK-AT ?auto_2317 ?auto_2316 ) ( IN-CITY ?auto_2316 ?auto_2315 ) ( IN-CITY ?auto_2311 ?auto_2315 ) ( not ( = ?auto_2311 ?auto_2316 ) ) ( OBJ-AT ?auto_2313 ?auto_2311 ) ( not ( = ?auto_2313 ?auto_2312 ) ) ( OBJ-AT ?auto_2314 ?auto_2311 ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2313 ?auto_2314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2313 ?auto_2312 ?auto_2311 )
      ( DELIVER-3PKG-VERIFY ?auto_2312 ?auto_2313 ?auto_2314 ?auto_2311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2326 - OBJ
      ?auto_2327 - OBJ
      ?auto_2328 - OBJ
      ?auto_2325 - LOCATION
    )
    :vars
    (
      ?auto_2331 - TRUCK
      ?auto_2330 - LOCATION
      ?auto_2329 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2326 ?auto_2331 ) ( TRUCK-AT ?auto_2331 ?auto_2330 ) ( IN-CITY ?auto_2330 ?auto_2329 ) ( IN-CITY ?auto_2325 ?auto_2329 ) ( not ( = ?auto_2325 ?auto_2330 ) ) ( OBJ-AT ?auto_2328 ?auto_2325 ) ( not ( = ?auto_2328 ?auto_2326 ) ) ( OBJ-AT ?auto_2327 ?auto_2325 ) ( not ( = ?auto_2326 ?auto_2327 ) ) ( not ( = ?auto_2327 ?auto_2328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2328 ?auto_2326 ?auto_2325 )
      ( DELIVER-3PKG-VERIFY ?auto_2326 ?auto_2327 ?auto_2328 ?auto_2325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2333 - OBJ
      ?auto_2334 - OBJ
      ?auto_2335 - OBJ
      ?auto_2332 - LOCATION
    )
    :vars
    (
      ?auto_2338 - TRUCK
      ?auto_2337 - LOCATION
      ?auto_2336 - CITY
      ?auto_2339 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2333 ?auto_2338 ) ( TRUCK-AT ?auto_2338 ?auto_2337 ) ( IN-CITY ?auto_2337 ?auto_2336 ) ( IN-CITY ?auto_2332 ?auto_2336 ) ( not ( = ?auto_2332 ?auto_2337 ) ) ( OBJ-AT ?auto_2339 ?auto_2332 ) ( not ( = ?auto_2339 ?auto_2333 ) ) ( OBJ-AT ?auto_2334 ?auto_2332 ) ( OBJ-AT ?auto_2335 ?auto_2332 ) ( not ( = ?auto_2333 ?auto_2334 ) ) ( not ( = ?auto_2333 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2339 ) ) ( not ( = ?auto_2335 ?auto_2339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2339 ?auto_2333 ?auto_2332 )
      ( DELIVER-3PKG-VERIFY ?auto_2333 ?auto_2334 ?auto_2335 ?auto_2332 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2372 - OBJ
      ?auto_2371 - LOCATION
    )
    :vars
    (
      ?auto_2375 - TRUCK
      ?auto_2374 - LOCATION
      ?auto_2373 - CITY
      ?auto_2376 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2375 ?auto_2374 ) ( IN-CITY ?auto_2374 ?auto_2373 ) ( IN-CITY ?auto_2371 ?auto_2373 ) ( not ( = ?auto_2371 ?auto_2374 ) ) ( OBJ-AT ?auto_2376 ?auto_2371 ) ( not ( = ?auto_2376 ?auto_2372 ) ) ( OBJ-AT ?auto_2372 ?auto_2374 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2372 ?auto_2375 ?auto_2374 )
      ( DELIVER-2PKG ?auto_2376 ?auto_2372 ?auto_2371 )
      ( DELIVER-1PKG-VERIFY ?auto_2372 ?auto_2371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2378 - OBJ
      ?auto_2379 - OBJ
      ?auto_2377 - LOCATION
    )
    :vars
    (
      ?auto_2380 - TRUCK
      ?auto_2381 - LOCATION
      ?auto_2382 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2380 ?auto_2381 ) ( IN-CITY ?auto_2381 ?auto_2382 ) ( IN-CITY ?auto_2377 ?auto_2382 ) ( not ( = ?auto_2377 ?auto_2381 ) ) ( OBJ-AT ?auto_2378 ?auto_2377 ) ( not ( = ?auto_2378 ?auto_2379 ) ) ( OBJ-AT ?auto_2379 ?auto_2381 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2379 ?auto_2377 )
      ( DELIVER-2PKG-VERIFY ?auto_2378 ?auto_2379 ?auto_2377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2384 - OBJ
      ?auto_2385 - OBJ
      ?auto_2383 - LOCATION
    )
    :vars
    (
      ?auto_2388 - TRUCK
      ?auto_2387 - LOCATION
      ?auto_2386 - CITY
      ?auto_2389 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2388 ?auto_2387 ) ( IN-CITY ?auto_2387 ?auto_2386 ) ( IN-CITY ?auto_2383 ?auto_2386 ) ( not ( = ?auto_2383 ?auto_2387 ) ) ( OBJ-AT ?auto_2389 ?auto_2383 ) ( not ( = ?auto_2389 ?auto_2385 ) ) ( OBJ-AT ?auto_2385 ?auto_2387 ) ( OBJ-AT ?auto_2384 ?auto_2383 ) ( not ( = ?auto_2384 ?auto_2385 ) ) ( not ( = ?auto_2384 ?auto_2389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2389 ?auto_2385 ?auto_2383 )
      ( DELIVER-2PKG-VERIFY ?auto_2384 ?auto_2385 ?auto_2383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2391 - OBJ
      ?auto_2392 - OBJ
      ?auto_2390 - LOCATION
    )
    :vars
    (
      ?auto_2395 - TRUCK
      ?auto_2394 - LOCATION
      ?auto_2393 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2395 ?auto_2394 ) ( IN-CITY ?auto_2394 ?auto_2393 ) ( IN-CITY ?auto_2390 ?auto_2393 ) ( not ( = ?auto_2390 ?auto_2394 ) ) ( OBJ-AT ?auto_2392 ?auto_2390 ) ( not ( = ?auto_2392 ?auto_2391 ) ) ( OBJ-AT ?auto_2391 ?auto_2394 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2392 ?auto_2391 ?auto_2390 )
      ( DELIVER-2PKG-VERIFY ?auto_2391 ?auto_2392 ?auto_2390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2397 - OBJ
      ?auto_2398 - OBJ
      ?auto_2396 - LOCATION
    )
    :vars
    (
      ?auto_2401 - TRUCK
      ?auto_2400 - LOCATION
      ?auto_2399 - CITY
      ?auto_2402 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2401 ?auto_2400 ) ( IN-CITY ?auto_2400 ?auto_2399 ) ( IN-CITY ?auto_2396 ?auto_2399 ) ( not ( = ?auto_2396 ?auto_2400 ) ) ( OBJ-AT ?auto_2402 ?auto_2396 ) ( not ( = ?auto_2402 ?auto_2397 ) ) ( OBJ-AT ?auto_2397 ?auto_2400 ) ( OBJ-AT ?auto_2398 ?auto_2396 ) ( not ( = ?auto_2397 ?auto_2398 ) ) ( not ( = ?auto_2398 ?auto_2402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2402 ?auto_2397 ?auto_2396 )
      ( DELIVER-2PKG-VERIFY ?auto_2397 ?auto_2398 ?auto_2396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2411 - OBJ
      ?auto_2412 - OBJ
      ?auto_2413 - OBJ
      ?auto_2410 - LOCATION
    )
    :vars
    (
      ?auto_2416 - TRUCK
      ?auto_2415 - LOCATION
      ?auto_2414 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2416 ?auto_2415 ) ( IN-CITY ?auto_2415 ?auto_2414 ) ( IN-CITY ?auto_2410 ?auto_2414 ) ( not ( = ?auto_2410 ?auto_2415 ) ) ( OBJ-AT ?auto_2412 ?auto_2410 ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( OBJ-AT ?auto_2413 ?auto_2415 ) ( OBJ-AT ?auto_2411 ?auto_2410 ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( not ( = ?auto_2411 ?auto_2413 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2412 ?auto_2413 ?auto_2410 )
      ( DELIVER-3PKG-VERIFY ?auto_2411 ?auto_2412 ?auto_2413 ?auto_2410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2418 - OBJ
      ?auto_2419 - OBJ
      ?auto_2420 - OBJ
      ?auto_2417 - LOCATION
    )
    :vars
    (
      ?auto_2423 - TRUCK
      ?auto_2422 - LOCATION
      ?auto_2421 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2423 ?auto_2422 ) ( IN-CITY ?auto_2422 ?auto_2421 ) ( IN-CITY ?auto_2417 ?auto_2421 ) ( not ( = ?auto_2417 ?auto_2422 ) ) ( OBJ-AT ?auto_2418 ?auto_2417 ) ( not ( = ?auto_2418 ?auto_2420 ) ) ( OBJ-AT ?auto_2420 ?auto_2422 ) ( OBJ-AT ?auto_2419 ?auto_2417 ) ( not ( = ?auto_2418 ?auto_2419 ) ) ( not ( = ?auto_2419 ?auto_2420 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2418 ?auto_2420 ?auto_2417 )
      ( DELIVER-3PKG-VERIFY ?auto_2418 ?auto_2419 ?auto_2420 ?auto_2417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2425 - OBJ
      ?auto_2426 - OBJ
      ?auto_2427 - OBJ
      ?auto_2424 - LOCATION
    )
    :vars
    (
      ?auto_2430 - TRUCK
      ?auto_2429 - LOCATION
      ?auto_2428 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2430 ?auto_2429 ) ( IN-CITY ?auto_2429 ?auto_2428 ) ( IN-CITY ?auto_2424 ?auto_2428 ) ( not ( = ?auto_2424 ?auto_2429 ) ) ( OBJ-AT ?auto_2427 ?auto_2424 ) ( not ( = ?auto_2427 ?auto_2426 ) ) ( OBJ-AT ?auto_2426 ?auto_2429 ) ( OBJ-AT ?auto_2425 ?auto_2424 ) ( not ( = ?auto_2425 ?auto_2426 ) ) ( not ( = ?auto_2425 ?auto_2427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2427 ?auto_2426 ?auto_2424 )
      ( DELIVER-3PKG-VERIFY ?auto_2425 ?auto_2426 ?auto_2427 ?auto_2424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2432 - OBJ
      ?auto_2433 - OBJ
      ?auto_2434 - OBJ
      ?auto_2431 - LOCATION
    )
    :vars
    (
      ?auto_2437 - TRUCK
      ?auto_2436 - LOCATION
      ?auto_2435 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2437 ?auto_2436 ) ( IN-CITY ?auto_2436 ?auto_2435 ) ( IN-CITY ?auto_2431 ?auto_2435 ) ( not ( = ?auto_2431 ?auto_2436 ) ) ( OBJ-AT ?auto_2432 ?auto_2431 ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( OBJ-AT ?auto_2433 ?auto_2436 ) ( OBJ-AT ?auto_2434 ?auto_2431 ) ( not ( = ?auto_2432 ?auto_2434 ) ) ( not ( = ?auto_2433 ?auto_2434 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2432 ?auto_2433 ?auto_2431 )
      ( DELIVER-3PKG-VERIFY ?auto_2432 ?auto_2433 ?auto_2434 ?auto_2431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2446 - OBJ
      ?auto_2447 - OBJ
      ?auto_2448 - OBJ
      ?auto_2445 - LOCATION
    )
    :vars
    (
      ?auto_2451 - TRUCK
      ?auto_2450 - LOCATION
      ?auto_2449 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2451 ?auto_2450 ) ( IN-CITY ?auto_2450 ?auto_2449 ) ( IN-CITY ?auto_2445 ?auto_2449 ) ( not ( = ?auto_2445 ?auto_2450 ) ) ( OBJ-AT ?auto_2447 ?auto_2445 ) ( not ( = ?auto_2447 ?auto_2448 ) ) ( OBJ-AT ?auto_2448 ?auto_2450 ) ( OBJ-AT ?auto_2446 ?auto_2445 ) ( not ( = ?auto_2446 ?auto_2447 ) ) ( not ( = ?auto_2446 ?auto_2448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2447 ?auto_2448 ?auto_2445 )
      ( DELIVER-3PKG-VERIFY ?auto_2446 ?auto_2447 ?auto_2448 ?auto_2445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2453 - OBJ
      ?auto_2454 - OBJ
      ?auto_2455 - OBJ
      ?auto_2452 - LOCATION
    )
    :vars
    (
      ?auto_2458 - TRUCK
      ?auto_2457 - LOCATION
      ?auto_2456 - CITY
      ?auto_2459 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2458 ?auto_2457 ) ( IN-CITY ?auto_2457 ?auto_2456 ) ( IN-CITY ?auto_2452 ?auto_2456 ) ( not ( = ?auto_2452 ?auto_2457 ) ) ( OBJ-AT ?auto_2459 ?auto_2452 ) ( not ( = ?auto_2459 ?auto_2455 ) ) ( OBJ-AT ?auto_2455 ?auto_2457 ) ( OBJ-AT ?auto_2453 ?auto_2452 ) ( OBJ-AT ?auto_2454 ?auto_2452 ) ( not ( = ?auto_2453 ?auto_2454 ) ) ( not ( = ?auto_2453 ?auto_2455 ) ) ( not ( = ?auto_2453 ?auto_2459 ) ) ( not ( = ?auto_2454 ?auto_2455 ) ) ( not ( = ?auto_2454 ?auto_2459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2459 ?auto_2455 ?auto_2452 )
      ( DELIVER-3PKG-VERIFY ?auto_2453 ?auto_2454 ?auto_2455 ?auto_2452 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2461 - OBJ
      ?auto_2462 - OBJ
      ?auto_2463 - OBJ
      ?auto_2460 - LOCATION
    )
    :vars
    (
      ?auto_2466 - TRUCK
      ?auto_2465 - LOCATION
      ?auto_2464 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2466 ?auto_2465 ) ( IN-CITY ?auto_2465 ?auto_2464 ) ( IN-CITY ?auto_2460 ?auto_2464 ) ( not ( = ?auto_2460 ?auto_2465 ) ) ( OBJ-AT ?auto_2463 ?auto_2460 ) ( not ( = ?auto_2463 ?auto_2462 ) ) ( OBJ-AT ?auto_2462 ?auto_2465 ) ( OBJ-AT ?auto_2461 ?auto_2460 ) ( not ( = ?auto_2461 ?auto_2462 ) ) ( not ( = ?auto_2461 ?auto_2463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2463 ?auto_2462 ?auto_2460 )
      ( DELIVER-3PKG-VERIFY ?auto_2461 ?auto_2462 ?auto_2463 ?auto_2460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2468 - OBJ
      ?auto_2469 - OBJ
      ?auto_2470 - OBJ
      ?auto_2467 - LOCATION
    )
    :vars
    (
      ?auto_2473 - TRUCK
      ?auto_2472 - LOCATION
      ?auto_2471 - CITY
      ?auto_2474 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2473 ?auto_2472 ) ( IN-CITY ?auto_2472 ?auto_2471 ) ( IN-CITY ?auto_2467 ?auto_2471 ) ( not ( = ?auto_2467 ?auto_2472 ) ) ( OBJ-AT ?auto_2474 ?auto_2467 ) ( not ( = ?auto_2474 ?auto_2469 ) ) ( OBJ-AT ?auto_2469 ?auto_2472 ) ( OBJ-AT ?auto_2468 ?auto_2467 ) ( OBJ-AT ?auto_2470 ?auto_2467 ) ( not ( = ?auto_2468 ?auto_2469 ) ) ( not ( = ?auto_2468 ?auto_2470 ) ) ( not ( = ?auto_2468 ?auto_2474 ) ) ( not ( = ?auto_2469 ?auto_2470 ) ) ( not ( = ?auto_2470 ?auto_2474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2474 ?auto_2469 ?auto_2467 )
      ( DELIVER-3PKG-VERIFY ?auto_2468 ?auto_2469 ?auto_2470 ?auto_2467 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2484 - OBJ
      ?auto_2485 - OBJ
      ?auto_2486 - OBJ
      ?auto_2483 - LOCATION
    )
    :vars
    (
      ?auto_2489 - TRUCK
      ?auto_2488 - LOCATION
      ?auto_2487 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2489 ?auto_2488 ) ( IN-CITY ?auto_2488 ?auto_2487 ) ( IN-CITY ?auto_2483 ?auto_2487 ) ( not ( = ?auto_2483 ?auto_2488 ) ) ( OBJ-AT ?auto_2486 ?auto_2483 ) ( not ( = ?auto_2486 ?auto_2484 ) ) ( OBJ-AT ?auto_2484 ?auto_2488 ) ( OBJ-AT ?auto_2485 ?auto_2483 ) ( not ( = ?auto_2484 ?auto_2485 ) ) ( not ( = ?auto_2485 ?auto_2486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2486 ?auto_2484 ?auto_2483 )
      ( DELIVER-3PKG-VERIFY ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2483 ) )
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
      ?auto_2496 - TRUCK
      ?auto_2495 - LOCATION
      ?auto_2494 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2496 ?auto_2495 ) ( IN-CITY ?auto_2495 ?auto_2494 ) ( IN-CITY ?auto_2490 ?auto_2494 ) ( not ( = ?auto_2490 ?auto_2495 ) ) ( OBJ-AT ?auto_2492 ?auto_2490 ) ( not ( = ?auto_2492 ?auto_2491 ) ) ( OBJ-AT ?auto_2491 ?auto_2495 ) ( OBJ-AT ?auto_2493 ?auto_2490 ) ( not ( = ?auto_2491 ?auto_2493 ) ) ( not ( = ?auto_2492 ?auto_2493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2492 ?auto_2491 ?auto_2490 )
      ( DELIVER-3PKG-VERIFY ?auto_2491 ?auto_2492 ?auto_2493 ?auto_2490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2505 - OBJ
      ?auto_2506 - OBJ
      ?auto_2507 - OBJ
      ?auto_2504 - LOCATION
    )
    :vars
    (
      ?auto_2510 - TRUCK
      ?auto_2509 - LOCATION
      ?auto_2508 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2510 ?auto_2509 ) ( IN-CITY ?auto_2509 ?auto_2508 ) ( IN-CITY ?auto_2504 ?auto_2508 ) ( not ( = ?auto_2504 ?auto_2509 ) ) ( OBJ-AT ?auto_2507 ?auto_2504 ) ( not ( = ?auto_2507 ?auto_2505 ) ) ( OBJ-AT ?auto_2505 ?auto_2509 ) ( OBJ-AT ?auto_2506 ?auto_2504 ) ( not ( = ?auto_2505 ?auto_2506 ) ) ( not ( = ?auto_2506 ?auto_2507 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2507 ?auto_2505 ?auto_2504 )
      ( DELIVER-3PKG-VERIFY ?auto_2505 ?auto_2506 ?auto_2507 ?auto_2504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2512 - OBJ
      ?auto_2513 - OBJ
      ?auto_2514 - OBJ
      ?auto_2511 - LOCATION
    )
    :vars
    (
      ?auto_2517 - TRUCK
      ?auto_2516 - LOCATION
      ?auto_2515 - CITY
      ?auto_2518 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2517 ?auto_2516 ) ( IN-CITY ?auto_2516 ?auto_2515 ) ( IN-CITY ?auto_2511 ?auto_2515 ) ( not ( = ?auto_2511 ?auto_2516 ) ) ( OBJ-AT ?auto_2518 ?auto_2511 ) ( not ( = ?auto_2518 ?auto_2512 ) ) ( OBJ-AT ?auto_2512 ?auto_2516 ) ( OBJ-AT ?auto_2513 ?auto_2511 ) ( OBJ-AT ?auto_2514 ?auto_2511 ) ( not ( = ?auto_2512 ?auto_2513 ) ) ( not ( = ?auto_2512 ?auto_2514 ) ) ( not ( = ?auto_2513 ?auto_2514 ) ) ( not ( = ?auto_2513 ?auto_2518 ) ) ( not ( = ?auto_2514 ?auto_2518 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2518 ?auto_2512 ?auto_2511 )
      ( DELIVER-3PKG-VERIFY ?auto_2512 ?auto_2513 ?auto_2514 ?auto_2511 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2551 - OBJ
      ?auto_2550 - LOCATION
    )
    :vars
    (
      ?auto_2553 - LOCATION
      ?auto_2552 - CITY
      ?auto_2555 - OBJ
      ?auto_2554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2553 ?auto_2552 ) ( IN-CITY ?auto_2550 ?auto_2552 ) ( not ( = ?auto_2550 ?auto_2553 ) ) ( OBJ-AT ?auto_2555 ?auto_2550 ) ( not ( = ?auto_2555 ?auto_2551 ) ) ( OBJ-AT ?auto_2551 ?auto_2553 ) ( TRUCK-AT ?auto_2554 ?auto_2550 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2554 ?auto_2550 ?auto_2553 ?auto_2552 )
      ( DELIVER-2PKG ?auto_2555 ?auto_2551 ?auto_2550 )
      ( DELIVER-1PKG-VERIFY ?auto_2551 ?auto_2550 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2557 - OBJ
      ?auto_2558 - OBJ
      ?auto_2556 - LOCATION
    )
    :vars
    (
      ?auto_2559 - LOCATION
      ?auto_2561 - CITY
      ?auto_2560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2559 ?auto_2561 ) ( IN-CITY ?auto_2556 ?auto_2561 ) ( not ( = ?auto_2556 ?auto_2559 ) ) ( OBJ-AT ?auto_2557 ?auto_2556 ) ( not ( = ?auto_2557 ?auto_2558 ) ) ( OBJ-AT ?auto_2558 ?auto_2559 ) ( TRUCK-AT ?auto_2560 ?auto_2556 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2558 ?auto_2556 )
      ( DELIVER-2PKG-VERIFY ?auto_2557 ?auto_2558 ?auto_2556 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2563 - OBJ
      ?auto_2564 - OBJ
      ?auto_2562 - LOCATION
    )
    :vars
    (
      ?auto_2565 - LOCATION
      ?auto_2566 - CITY
      ?auto_2568 - OBJ
      ?auto_2567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2565 ?auto_2566 ) ( IN-CITY ?auto_2562 ?auto_2566 ) ( not ( = ?auto_2562 ?auto_2565 ) ) ( OBJ-AT ?auto_2568 ?auto_2562 ) ( not ( = ?auto_2568 ?auto_2564 ) ) ( OBJ-AT ?auto_2564 ?auto_2565 ) ( TRUCK-AT ?auto_2567 ?auto_2562 ) ( OBJ-AT ?auto_2563 ?auto_2562 ) ( not ( = ?auto_2563 ?auto_2564 ) ) ( not ( = ?auto_2563 ?auto_2568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2568 ?auto_2564 ?auto_2562 )
      ( DELIVER-2PKG-VERIFY ?auto_2563 ?auto_2564 ?auto_2562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2570 - OBJ
      ?auto_2571 - OBJ
      ?auto_2569 - LOCATION
    )
    :vars
    (
      ?auto_2572 - LOCATION
      ?auto_2573 - CITY
      ?auto_2574 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2572 ?auto_2573 ) ( IN-CITY ?auto_2569 ?auto_2573 ) ( not ( = ?auto_2569 ?auto_2572 ) ) ( OBJ-AT ?auto_2571 ?auto_2569 ) ( not ( = ?auto_2571 ?auto_2570 ) ) ( OBJ-AT ?auto_2570 ?auto_2572 ) ( TRUCK-AT ?auto_2574 ?auto_2569 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2571 ?auto_2570 ?auto_2569 )
      ( DELIVER-2PKG-VERIFY ?auto_2570 ?auto_2571 ?auto_2569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2576 - OBJ
      ?auto_2577 - OBJ
      ?auto_2575 - LOCATION
    )
    :vars
    (
      ?auto_2578 - LOCATION
      ?auto_2579 - CITY
      ?auto_2581 - OBJ
      ?auto_2580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2578 ?auto_2579 ) ( IN-CITY ?auto_2575 ?auto_2579 ) ( not ( = ?auto_2575 ?auto_2578 ) ) ( OBJ-AT ?auto_2581 ?auto_2575 ) ( not ( = ?auto_2581 ?auto_2576 ) ) ( OBJ-AT ?auto_2576 ?auto_2578 ) ( TRUCK-AT ?auto_2580 ?auto_2575 ) ( OBJ-AT ?auto_2577 ?auto_2575 ) ( not ( = ?auto_2576 ?auto_2577 ) ) ( not ( = ?auto_2577 ?auto_2581 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2581 ?auto_2576 ?auto_2575 )
      ( DELIVER-2PKG-VERIFY ?auto_2576 ?auto_2577 ?auto_2575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2590 - OBJ
      ?auto_2591 - OBJ
      ?auto_2592 - OBJ
      ?auto_2589 - LOCATION
    )
    :vars
    (
      ?auto_2593 - LOCATION
      ?auto_2594 - CITY
      ?auto_2595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2593 ?auto_2594 ) ( IN-CITY ?auto_2589 ?auto_2594 ) ( not ( = ?auto_2589 ?auto_2593 ) ) ( OBJ-AT ?auto_2591 ?auto_2589 ) ( not ( = ?auto_2591 ?auto_2592 ) ) ( OBJ-AT ?auto_2592 ?auto_2593 ) ( TRUCK-AT ?auto_2595 ?auto_2589 ) ( OBJ-AT ?auto_2590 ?auto_2589 ) ( not ( = ?auto_2590 ?auto_2591 ) ) ( not ( = ?auto_2590 ?auto_2592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2591 ?auto_2592 ?auto_2589 )
      ( DELIVER-3PKG-VERIFY ?auto_2590 ?auto_2591 ?auto_2592 ?auto_2589 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2597 - OBJ
      ?auto_2598 - OBJ
      ?auto_2599 - OBJ
      ?auto_2596 - LOCATION
    )
    :vars
    (
      ?auto_2600 - LOCATION
      ?auto_2601 - CITY
      ?auto_2602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2600 ?auto_2601 ) ( IN-CITY ?auto_2596 ?auto_2601 ) ( not ( = ?auto_2596 ?auto_2600 ) ) ( OBJ-AT ?auto_2597 ?auto_2596 ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( OBJ-AT ?auto_2599 ?auto_2600 ) ( TRUCK-AT ?auto_2602 ?auto_2596 ) ( OBJ-AT ?auto_2598 ?auto_2596 ) ( not ( = ?auto_2597 ?auto_2598 ) ) ( not ( = ?auto_2598 ?auto_2599 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2597 ?auto_2599 ?auto_2596 )
      ( DELIVER-3PKG-VERIFY ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2604 - OBJ
      ?auto_2605 - OBJ
      ?auto_2606 - OBJ
      ?auto_2603 - LOCATION
    )
    :vars
    (
      ?auto_2607 - LOCATION
      ?auto_2608 - CITY
      ?auto_2609 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2607 ?auto_2608 ) ( IN-CITY ?auto_2603 ?auto_2608 ) ( not ( = ?auto_2603 ?auto_2607 ) ) ( OBJ-AT ?auto_2606 ?auto_2603 ) ( not ( = ?auto_2606 ?auto_2605 ) ) ( OBJ-AT ?auto_2605 ?auto_2607 ) ( TRUCK-AT ?auto_2609 ?auto_2603 ) ( OBJ-AT ?auto_2604 ?auto_2603 ) ( not ( = ?auto_2604 ?auto_2605 ) ) ( not ( = ?auto_2604 ?auto_2606 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2606 ?auto_2605 ?auto_2603 )
      ( DELIVER-3PKG-VERIFY ?auto_2604 ?auto_2605 ?auto_2606 ?auto_2603 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2611 - OBJ
      ?auto_2612 - OBJ
      ?auto_2613 - OBJ
      ?auto_2610 - LOCATION
    )
    :vars
    (
      ?auto_2614 - LOCATION
      ?auto_2615 - CITY
      ?auto_2616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2614 ?auto_2615 ) ( IN-CITY ?auto_2610 ?auto_2615 ) ( not ( = ?auto_2610 ?auto_2614 ) ) ( OBJ-AT ?auto_2611 ?auto_2610 ) ( not ( = ?auto_2611 ?auto_2612 ) ) ( OBJ-AT ?auto_2612 ?auto_2614 ) ( TRUCK-AT ?auto_2616 ?auto_2610 ) ( OBJ-AT ?auto_2613 ?auto_2610 ) ( not ( = ?auto_2611 ?auto_2613 ) ) ( not ( = ?auto_2612 ?auto_2613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2611 ?auto_2612 ?auto_2610 )
      ( DELIVER-3PKG-VERIFY ?auto_2611 ?auto_2612 ?auto_2613 ?auto_2610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2625 - OBJ
      ?auto_2626 - OBJ
      ?auto_2627 - OBJ
      ?auto_2624 - LOCATION
    )
    :vars
    (
      ?auto_2628 - LOCATION
      ?auto_2629 - CITY
      ?auto_2630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2628 ?auto_2629 ) ( IN-CITY ?auto_2624 ?auto_2629 ) ( not ( = ?auto_2624 ?auto_2628 ) ) ( OBJ-AT ?auto_2626 ?auto_2624 ) ( not ( = ?auto_2626 ?auto_2627 ) ) ( OBJ-AT ?auto_2627 ?auto_2628 ) ( TRUCK-AT ?auto_2630 ?auto_2624 ) ( OBJ-AT ?auto_2625 ?auto_2624 ) ( not ( = ?auto_2625 ?auto_2626 ) ) ( not ( = ?auto_2625 ?auto_2627 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2626 ?auto_2627 ?auto_2624 )
      ( DELIVER-3PKG-VERIFY ?auto_2625 ?auto_2626 ?auto_2627 ?auto_2624 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2632 - OBJ
      ?auto_2633 - OBJ
      ?auto_2634 - OBJ
      ?auto_2631 - LOCATION
    )
    :vars
    (
      ?auto_2635 - LOCATION
      ?auto_2636 - CITY
      ?auto_2638 - OBJ
      ?auto_2637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2635 ?auto_2636 ) ( IN-CITY ?auto_2631 ?auto_2636 ) ( not ( = ?auto_2631 ?auto_2635 ) ) ( OBJ-AT ?auto_2638 ?auto_2631 ) ( not ( = ?auto_2638 ?auto_2634 ) ) ( OBJ-AT ?auto_2634 ?auto_2635 ) ( TRUCK-AT ?auto_2637 ?auto_2631 ) ( OBJ-AT ?auto_2632 ?auto_2631 ) ( OBJ-AT ?auto_2633 ?auto_2631 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2632 ?auto_2634 ) ) ( not ( = ?auto_2632 ?auto_2638 ) ) ( not ( = ?auto_2633 ?auto_2634 ) ) ( not ( = ?auto_2633 ?auto_2638 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2638 ?auto_2634 ?auto_2631 )
      ( DELIVER-3PKG-VERIFY ?auto_2632 ?auto_2633 ?auto_2634 ?auto_2631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2640 - OBJ
      ?auto_2641 - OBJ
      ?auto_2642 - OBJ
      ?auto_2639 - LOCATION
    )
    :vars
    (
      ?auto_2643 - LOCATION
      ?auto_2644 - CITY
      ?auto_2645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2643 ?auto_2644 ) ( IN-CITY ?auto_2639 ?auto_2644 ) ( not ( = ?auto_2639 ?auto_2643 ) ) ( OBJ-AT ?auto_2642 ?auto_2639 ) ( not ( = ?auto_2642 ?auto_2641 ) ) ( OBJ-AT ?auto_2641 ?auto_2643 ) ( TRUCK-AT ?auto_2645 ?auto_2639 ) ( OBJ-AT ?auto_2640 ?auto_2639 ) ( not ( = ?auto_2640 ?auto_2641 ) ) ( not ( = ?auto_2640 ?auto_2642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2642 ?auto_2641 ?auto_2639 )
      ( DELIVER-3PKG-VERIFY ?auto_2640 ?auto_2641 ?auto_2642 ?auto_2639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2647 - OBJ
      ?auto_2648 - OBJ
      ?auto_2649 - OBJ
      ?auto_2646 - LOCATION
    )
    :vars
    (
      ?auto_2650 - LOCATION
      ?auto_2651 - CITY
      ?auto_2653 - OBJ
      ?auto_2652 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2650 ?auto_2651 ) ( IN-CITY ?auto_2646 ?auto_2651 ) ( not ( = ?auto_2646 ?auto_2650 ) ) ( OBJ-AT ?auto_2653 ?auto_2646 ) ( not ( = ?auto_2653 ?auto_2648 ) ) ( OBJ-AT ?auto_2648 ?auto_2650 ) ( TRUCK-AT ?auto_2652 ?auto_2646 ) ( OBJ-AT ?auto_2647 ?auto_2646 ) ( OBJ-AT ?auto_2649 ?auto_2646 ) ( not ( = ?auto_2647 ?auto_2648 ) ) ( not ( = ?auto_2647 ?auto_2649 ) ) ( not ( = ?auto_2647 ?auto_2653 ) ) ( not ( = ?auto_2648 ?auto_2649 ) ) ( not ( = ?auto_2649 ?auto_2653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2653 ?auto_2648 ?auto_2646 )
      ( DELIVER-3PKG-VERIFY ?auto_2647 ?auto_2648 ?auto_2649 ?auto_2646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2663 - OBJ
      ?auto_2664 - OBJ
      ?auto_2665 - OBJ
      ?auto_2662 - LOCATION
    )
    :vars
    (
      ?auto_2666 - LOCATION
      ?auto_2667 - CITY
      ?auto_2668 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2666 ?auto_2667 ) ( IN-CITY ?auto_2662 ?auto_2667 ) ( not ( = ?auto_2662 ?auto_2666 ) ) ( OBJ-AT ?auto_2665 ?auto_2662 ) ( not ( = ?auto_2665 ?auto_2663 ) ) ( OBJ-AT ?auto_2663 ?auto_2666 ) ( TRUCK-AT ?auto_2668 ?auto_2662 ) ( OBJ-AT ?auto_2664 ?auto_2662 ) ( not ( = ?auto_2663 ?auto_2664 ) ) ( not ( = ?auto_2664 ?auto_2665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2665 ?auto_2663 ?auto_2662 )
      ( DELIVER-3PKG-VERIFY ?auto_2663 ?auto_2664 ?auto_2665 ?auto_2662 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2670 - OBJ
      ?auto_2671 - OBJ
      ?auto_2672 - OBJ
      ?auto_2669 - LOCATION
    )
    :vars
    (
      ?auto_2673 - LOCATION
      ?auto_2674 - CITY
      ?auto_2675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2673 ?auto_2674 ) ( IN-CITY ?auto_2669 ?auto_2674 ) ( not ( = ?auto_2669 ?auto_2673 ) ) ( OBJ-AT ?auto_2671 ?auto_2669 ) ( not ( = ?auto_2671 ?auto_2670 ) ) ( OBJ-AT ?auto_2670 ?auto_2673 ) ( TRUCK-AT ?auto_2675 ?auto_2669 ) ( OBJ-AT ?auto_2672 ?auto_2669 ) ( not ( = ?auto_2670 ?auto_2672 ) ) ( not ( = ?auto_2671 ?auto_2672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2671 ?auto_2670 ?auto_2669 )
      ( DELIVER-3PKG-VERIFY ?auto_2670 ?auto_2671 ?auto_2672 ?auto_2669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2684 - OBJ
      ?auto_2685 - OBJ
      ?auto_2686 - OBJ
      ?auto_2683 - LOCATION
    )
    :vars
    (
      ?auto_2687 - LOCATION
      ?auto_2688 - CITY
      ?auto_2689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2687 ?auto_2688 ) ( IN-CITY ?auto_2683 ?auto_2688 ) ( not ( = ?auto_2683 ?auto_2687 ) ) ( OBJ-AT ?auto_2686 ?auto_2683 ) ( not ( = ?auto_2686 ?auto_2684 ) ) ( OBJ-AT ?auto_2684 ?auto_2687 ) ( TRUCK-AT ?auto_2689 ?auto_2683 ) ( OBJ-AT ?auto_2685 ?auto_2683 ) ( not ( = ?auto_2684 ?auto_2685 ) ) ( not ( = ?auto_2685 ?auto_2686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2686 ?auto_2684 ?auto_2683 )
      ( DELIVER-3PKG-VERIFY ?auto_2684 ?auto_2685 ?auto_2686 ?auto_2683 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2691 - OBJ
      ?auto_2692 - OBJ
      ?auto_2693 - OBJ
      ?auto_2690 - LOCATION
    )
    :vars
    (
      ?auto_2694 - LOCATION
      ?auto_2695 - CITY
      ?auto_2697 - OBJ
      ?auto_2696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2694 ?auto_2695 ) ( IN-CITY ?auto_2690 ?auto_2695 ) ( not ( = ?auto_2690 ?auto_2694 ) ) ( OBJ-AT ?auto_2697 ?auto_2690 ) ( not ( = ?auto_2697 ?auto_2691 ) ) ( OBJ-AT ?auto_2691 ?auto_2694 ) ( TRUCK-AT ?auto_2696 ?auto_2690 ) ( OBJ-AT ?auto_2692 ?auto_2690 ) ( OBJ-AT ?auto_2693 ?auto_2690 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2691 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2697 ) ) ( not ( = ?auto_2693 ?auto_2697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2697 ?auto_2691 ?auto_2690 )
      ( DELIVER-3PKG-VERIFY ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2690 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2730 - OBJ
      ?auto_2729 - LOCATION
    )
    :vars
    (
      ?auto_2731 - LOCATION
      ?auto_2732 - CITY
      ?auto_2734 - OBJ
      ?auto_2733 - TRUCK
      ?auto_2735 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2731 ?auto_2732 ) ( IN-CITY ?auto_2729 ?auto_2732 ) ( not ( = ?auto_2729 ?auto_2731 ) ) ( OBJ-AT ?auto_2734 ?auto_2729 ) ( not ( = ?auto_2734 ?auto_2730 ) ) ( OBJ-AT ?auto_2730 ?auto_2731 ) ( TRUCK-AT ?auto_2733 ?auto_2729 ) ( IN-TRUCK ?auto_2735 ?auto_2733 ) ( not ( = ?auto_2734 ?auto_2735 ) ) ( not ( = ?auto_2730 ?auto_2735 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2734 ?auto_2735 ?auto_2729 )
      ( DELIVER-2PKG ?auto_2734 ?auto_2730 ?auto_2729 )
      ( DELIVER-1PKG-VERIFY ?auto_2730 ?auto_2729 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2737 - OBJ
      ?auto_2738 - OBJ
      ?auto_2736 - LOCATION
    )
    :vars
    (
      ?auto_2739 - LOCATION
      ?auto_2741 - CITY
      ?auto_2740 - TRUCK
      ?auto_2742 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2739 ?auto_2741 ) ( IN-CITY ?auto_2736 ?auto_2741 ) ( not ( = ?auto_2736 ?auto_2739 ) ) ( OBJ-AT ?auto_2737 ?auto_2736 ) ( not ( = ?auto_2737 ?auto_2738 ) ) ( OBJ-AT ?auto_2738 ?auto_2739 ) ( TRUCK-AT ?auto_2740 ?auto_2736 ) ( IN-TRUCK ?auto_2742 ?auto_2740 ) ( not ( = ?auto_2737 ?auto_2742 ) ) ( not ( = ?auto_2738 ?auto_2742 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2738 ?auto_2736 )
      ( DELIVER-2PKG-VERIFY ?auto_2737 ?auto_2738 ?auto_2736 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2744 - OBJ
      ?auto_2745 - OBJ
      ?auto_2743 - LOCATION
    )
    :vars
    (
      ?auto_2747 - LOCATION
      ?auto_2748 - CITY
      ?auto_2749 - OBJ
      ?auto_2746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2747 ?auto_2748 ) ( IN-CITY ?auto_2743 ?auto_2748 ) ( not ( = ?auto_2743 ?auto_2747 ) ) ( OBJ-AT ?auto_2749 ?auto_2743 ) ( not ( = ?auto_2749 ?auto_2745 ) ) ( OBJ-AT ?auto_2745 ?auto_2747 ) ( TRUCK-AT ?auto_2746 ?auto_2743 ) ( IN-TRUCK ?auto_2744 ?auto_2746 ) ( not ( = ?auto_2749 ?auto_2744 ) ) ( not ( = ?auto_2745 ?auto_2744 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2749 ?auto_2745 ?auto_2743 )
      ( DELIVER-2PKG-VERIFY ?auto_2744 ?auto_2745 ?auto_2743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2751 - OBJ
      ?auto_2752 - OBJ
      ?auto_2750 - LOCATION
    )
    :vars
    (
      ?auto_2755 - LOCATION
      ?auto_2756 - CITY
      ?auto_2753 - TRUCK
      ?auto_2754 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2755 ?auto_2756 ) ( IN-CITY ?auto_2750 ?auto_2756 ) ( not ( = ?auto_2750 ?auto_2755 ) ) ( OBJ-AT ?auto_2752 ?auto_2750 ) ( not ( = ?auto_2752 ?auto_2751 ) ) ( OBJ-AT ?auto_2751 ?auto_2755 ) ( TRUCK-AT ?auto_2753 ?auto_2750 ) ( IN-TRUCK ?auto_2754 ?auto_2753 ) ( not ( = ?auto_2752 ?auto_2754 ) ) ( not ( = ?auto_2751 ?auto_2754 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2752 ?auto_2751 ?auto_2750 )
      ( DELIVER-2PKG-VERIFY ?auto_2751 ?auto_2752 ?auto_2750 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2758 - OBJ
      ?auto_2759 - OBJ
      ?auto_2757 - LOCATION
    )
    :vars
    (
      ?auto_2761 - LOCATION
      ?auto_2762 - CITY
      ?auto_2763 - OBJ
      ?auto_2760 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2761 ?auto_2762 ) ( IN-CITY ?auto_2757 ?auto_2762 ) ( not ( = ?auto_2757 ?auto_2761 ) ) ( OBJ-AT ?auto_2763 ?auto_2757 ) ( not ( = ?auto_2763 ?auto_2758 ) ) ( OBJ-AT ?auto_2758 ?auto_2761 ) ( TRUCK-AT ?auto_2760 ?auto_2757 ) ( IN-TRUCK ?auto_2759 ?auto_2760 ) ( not ( = ?auto_2763 ?auto_2759 ) ) ( not ( = ?auto_2758 ?auto_2759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2763 ?auto_2758 ?auto_2757 )
      ( DELIVER-2PKG-VERIFY ?auto_2758 ?auto_2759 ?auto_2757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2773 - OBJ
      ?auto_2774 - OBJ
      ?auto_2775 - OBJ
      ?auto_2772 - LOCATION
    )
    :vars
    (
      ?auto_2778 - LOCATION
      ?auto_2779 - CITY
      ?auto_2776 - TRUCK
      ?auto_2777 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2778 ?auto_2779 ) ( IN-CITY ?auto_2772 ?auto_2779 ) ( not ( = ?auto_2772 ?auto_2778 ) ) ( OBJ-AT ?auto_2773 ?auto_2772 ) ( not ( = ?auto_2773 ?auto_2775 ) ) ( OBJ-AT ?auto_2775 ?auto_2778 ) ( TRUCK-AT ?auto_2776 ?auto_2772 ) ( IN-TRUCK ?auto_2777 ?auto_2776 ) ( not ( = ?auto_2773 ?auto_2777 ) ) ( not ( = ?auto_2775 ?auto_2777 ) ) ( OBJ-AT ?auto_2774 ?auto_2772 ) ( not ( = ?auto_2773 ?auto_2774 ) ) ( not ( = ?auto_2774 ?auto_2775 ) ) ( not ( = ?auto_2774 ?auto_2777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2773 ?auto_2775 ?auto_2772 )
      ( DELIVER-3PKG-VERIFY ?auto_2773 ?auto_2774 ?auto_2775 ?auto_2772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2781 - OBJ
      ?auto_2782 - OBJ
      ?auto_2783 - OBJ
      ?auto_2780 - LOCATION
    )
    :vars
    (
      ?auto_2785 - LOCATION
      ?auto_2786 - CITY
      ?auto_2784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2785 ?auto_2786 ) ( IN-CITY ?auto_2780 ?auto_2786 ) ( not ( = ?auto_2780 ?auto_2785 ) ) ( OBJ-AT ?auto_2781 ?auto_2780 ) ( not ( = ?auto_2781 ?auto_2783 ) ) ( OBJ-AT ?auto_2783 ?auto_2785 ) ( TRUCK-AT ?auto_2784 ?auto_2780 ) ( IN-TRUCK ?auto_2782 ?auto_2784 ) ( not ( = ?auto_2781 ?auto_2782 ) ) ( not ( = ?auto_2783 ?auto_2782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2781 ?auto_2783 ?auto_2780 )
      ( DELIVER-3PKG-VERIFY ?auto_2781 ?auto_2782 ?auto_2783 ?auto_2780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2788 - OBJ
      ?auto_2789 - OBJ
      ?auto_2790 - OBJ
      ?auto_2787 - LOCATION
    )
    :vars
    (
      ?auto_2793 - LOCATION
      ?auto_2794 - CITY
      ?auto_2791 - TRUCK
      ?auto_2792 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2793 ?auto_2794 ) ( IN-CITY ?auto_2787 ?auto_2794 ) ( not ( = ?auto_2787 ?auto_2793 ) ) ( OBJ-AT ?auto_2790 ?auto_2787 ) ( not ( = ?auto_2790 ?auto_2789 ) ) ( OBJ-AT ?auto_2789 ?auto_2793 ) ( TRUCK-AT ?auto_2791 ?auto_2787 ) ( IN-TRUCK ?auto_2792 ?auto_2791 ) ( not ( = ?auto_2790 ?auto_2792 ) ) ( not ( = ?auto_2789 ?auto_2792 ) ) ( OBJ-AT ?auto_2788 ?auto_2787 ) ( not ( = ?auto_2788 ?auto_2789 ) ) ( not ( = ?auto_2788 ?auto_2790 ) ) ( not ( = ?auto_2788 ?auto_2792 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2790 ?auto_2789 ?auto_2787 )
      ( DELIVER-3PKG-VERIFY ?auto_2788 ?auto_2789 ?auto_2790 ?auto_2787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2796 - OBJ
      ?auto_2797 - OBJ
      ?auto_2798 - OBJ
      ?auto_2795 - LOCATION
    )
    :vars
    (
      ?auto_2800 - LOCATION
      ?auto_2801 - CITY
      ?auto_2799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2800 ?auto_2801 ) ( IN-CITY ?auto_2795 ?auto_2801 ) ( not ( = ?auto_2795 ?auto_2800 ) ) ( OBJ-AT ?auto_2796 ?auto_2795 ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( OBJ-AT ?auto_2797 ?auto_2800 ) ( TRUCK-AT ?auto_2799 ?auto_2795 ) ( IN-TRUCK ?auto_2798 ?auto_2799 ) ( not ( = ?auto_2796 ?auto_2798 ) ) ( not ( = ?auto_2797 ?auto_2798 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2796 ?auto_2797 ?auto_2795 )
      ( DELIVER-3PKG-VERIFY ?auto_2796 ?auto_2797 ?auto_2798 ?auto_2795 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2811 - OBJ
      ?auto_2812 - OBJ
      ?auto_2813 - OBJ
      ?auto_2810 - LOCATION
    )
    :vars
    (
      ?auto_2815 - LOCATION
      ?auto_2816 - CITY
      ?auto_2814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2815 ?auto_2816 ) ( IN-CITY ?auto_2810 ?auto_2816 ) ( not ( = ?auto_2810 ?auto_2815 ) ) ( OBJ-AT ?auto_2812 ?auto_2810 ) ( not ( = ?auto_2812 ?auto_2813 ) ) ( OBJ-AT ?auto_2813 ?auto_2815 ) ( TRUCK-AT ?auto_2814 ?auto_2810 ) ( IN-TRUCK ?auto_2811 ?auto_2814 ) ( not ( = ?auto_2812 ?auto_2811 ) ) ( not ( = ?auto_2813 ?auto_2811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2812 ?auto_2813 ?auto_2810 )
      ( DELIVER-3PKG-VERIFY ?auto_2811 ?auto_2812 ?auto_2813 ?auto_2810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2826 - OBJ
      ?auto_2827 - OBJ
      ?auto_2828 - OBJ
      ?auto_2825 - LOCATION
    )
    :vars
    (
      ?auto_2830 - LOCATION
      ?auto_2831 - CITY
      ?auto_2829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2830 ?auto_2831 ) ( IN-CITY ?auto_2825 ?auto_2831 ) ( not ( = ?auto_2825 ?auto_2830 ) ) ( OBJ-AT ?auto_2828 ?auto_2825 ) ( not ( = ?auto_2828 ?auto_2827 ) ) ( OBJ-AT ?auto_2827 ?auto_2830 ) ( TRUCK-AT ?auto_2829 ?auto_2825 ) ( IN-TRUCK ?auto_2826 ?auto_2829 ) ( not ( = ?auto_2828 ?auto_2826 ) ) ( not ( = ?auto_2827 ?auto_2826 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2828 ?auto_2827 ?auto_2825 )
      ( DELIVER-3PKG-VERIFY ?auto_2826 ?auto_2827 ?auto_2828 ?auto_2825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2849 - OBJ
      ?auto_2850 - OBJ
      ?auto_2851 - OBJ
      ?auto_2848 - LOCATION
    )
    :vars
    (
      ?auto_2854 - LOCATION
      ?auto_2855 - CITY
      ?auto_2852 - TRUCK
      ?auto_2853 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2854 ?auto_2855 ) ( IN-CITY ?auto_2848 ?auto_2855 ) ( not ( = ?auto_2848 ?auto_2854 ) ) ( OBJ-AT ?auto_2850 ?auto_2848 ) ( not ( = ?auto_2850 ?auto_2849 ) ) ( OBJ-AT ?auto_2849 ?auto_2854 ) ( TRUCK-AT ?auto_2852 ?auto_2848 ) ( IN-TRUCK ?auto_2853 ?auto_2852 ) ( not ( = ?auto_2850 ?auto_2853 ) ) ( not ( = ?auto_2849 ?auto_2853 ) ) ( OBJ-AT ?auto_2851 ?auto_2848 ) ( not ( = ?auto_2849 ?auto_2851 ) ) ( not ( = ?auto_2850 ?auto_2851 ) ) ( not ( = ?auto_2851 ?auto_2853 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2850 ?auto_2849 ?auto_2848 )
      ( DELIVER-3PKG-VERIFY ?auto_2849 ?auto_2850 ?auto_2851 ?auto_2848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2857 - OBJ
      ?auto_2858 - OBJ
      ?auto_2859 - OBJ
      ?auto_2856 - LOCATION
    )
    :vars
    (
      ?auto_2861 - LOCATION
      ?auto_2862 - CITY
      ?auto_2860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2861 ?auto_2862 ) ( IN-CITY ?auto_2856 ?auto_2862 ) ( not ( = ?auto_2856 ?auto_2861 ) ) ( OBJ-AT ?auto_2858 ?auto_2856 ) ( not ( = ?auto_2858 ?auto_2857 ) ) ( OBJ-AT ?auto_2857 ?auto_2861 ) ( TRUCK-AT ?auto_2860 ?auto_2856 ) ( IN-TRUCK ?auto_2859 ?auto_2860 ) ( not ( = ?auto_2858 ?auto_2859 ) ) ( not ( = ?auto_2857 ?auto_2859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2858 ?auto_2857 ?auto_2856 )
      ( DELIVER-3PKG-VERIFY ?auto_2857 ?auto_2858 ?auto_2859 ?auto_2856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2872 - OBJ
      ?auto_2873 - OBJ
      ?auto_2874 - OBJ
      ?auto_2871 - LOCATION
    )
    :vars
    (
      ?auto_2876 - LOCATION
      ?auto_2877 - CITY
      ?auto_2875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2876 ?auto_2877 ) ( IN-CITY ?auto_2871 ?auto_2877 ) ( not ( = ?auto_2871 ?auto_2876 ) ) ( OBJ-AT ?auto_2874 ?auto_2871 ) ( not ( = ?auto_2874 ?auto_2872 ) ) ( OBJ-AT ?auto_2872 ?auto_2876 ) ( TRUCK-AT ?auto_2875 ?auto_2871 ) ( IN-TRUCK ?auto_2873 ?auto_2875 ) ( not ( = ?auto_2874 ?auto_2873 ) ) ( not ( = ?auto_2872 ?auto_2873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2874 ?auto_2872 ?auto_2871 )
      ( DELIVER-3PKG-VERIFY ?auto_2872 ?auto_2873 ?auto_2874 ?auto_2871 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2920 - OBJ
      ?auto_2919 - LOCATION
    )
    :vars
    (
      ?auto_2923 - LOCATION
      ?auto_2924 - CITY
      ?auto_2925 - OBJ
      ?auto_2922 - OBJ
      ?auto_2921 - TRUCK
      ?auto_2926 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2923 ?auto_2924 ) ( IN-CITY ?auto_2919 ?auto_2924 ) ( not ( = ?auto_2919 ?auto_2923 ) ) ( OBJ-AT ?auto_2925 ?auto_2919 ) ( not ( = ?auto_2925 ?auto_2920 ) ) ( OBJ-AT ?auto_2920 ?auto_2923 ) ( IN-TRUCK ?auto_2922 ?auto_2921 ) ( not ( = ?auto_2925 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( TRUCK-AT ?auto_2921 ?auto_2926 ) ( IN-CITY ?auto_2926 ?auto_2924 ) ( not ( = ?auto_2919 ?auto_2926 ) ) ( not ( = ?auto_2923 ?auto_2926 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2921 ?auto_2926 ?auto_2919 ?auto_2924 )
      ( DELIVER-2PKG ?auto_2925 ?auto_2920 ?auto_2919 )
      ( DELIVER-1PKG-VERIFY ?auto_2920 ?auto_2919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2928 - OBJ
      ?auto_2929 - OBJ
      ?auto_2927 - LOCATION
    )
    :vars
    (
      ?auto_2932 - LOCATION
      ?auto_2934 - CITY
      ?auto_2933 - OBJ
      ?auto_2930 - TRUCK
      ?auto_2931 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2932 ?auto_2934 ) ( IN-CITY ?auto_2927 ?auto_2934 ) ( not ( = ?auto_2927 ?auto_2932 ) ) ( OBJ-AT ?auto_2928 ?auto_2927 ) ( not ( = ?auto_2928 ?auto_2929 ) ) ( OBJ-AT ?auto_2929 ?auto_2932 ) ( IN-TRUCK ?auto_2933 ?auto_2930 ) ( not ( = ?auto_2928 ?auto_2933 ) ) ( not ( = ?auto_2929 ?auto_2933 ) ) ( TRUCK-AT ?auto_2930 ?auto_2931 ) ( IN-CITY ?auto_2931 ?auto_2934 ) ( not ( = ?auto_2927 ?auto_2931 ) ) ( not ( = ?auto_2932 ?auto_2931 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2929 ?auto_2927 )
      ( DELIVER-2PKG-VERIFY ?auto_2928 ?auto_2929 ?auto_2927 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2936 - OBJ
      ?auto_2937 - OBJ
      ?auto_2935 - LOCATION
    )
    :vars
    (
      ?auto_2940 - LOCATION
      ?auto_2941 - CITY
      ?auto_2942 - OBJ
      ?auto_2939 - TRUCK
      ?auto_2938 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2940 ?auto_2941 ) ( IN-CITY ?auto_2935 ?auto_2941 ) ( not ( = ?auto_2935 ?auto_2940 ) ) ( OBJ-AT ?auto_2942 ?auto_2935 ) ( not ( = ?auto_2942 ?auto_2937 ) ) ( OBJ-AT ?auto_2937 ?auto_2940 ) ( IN-TRUCK ?auto_2936 ?auto_2939 ) ( not ( = ?auto_2942 ?auto_2936 ) ) ( not ( = ?auto_2937 ?auto_2936 ) ) ( TRUCK-AT ?auto_2939 ?auto_2938 ) ( IN-CITY ?auto_2938 ?auto_2941 ) ( not ( = ?auto_2935 ?auto_2938 ) ) ( not ( = ?auto_2940 ?auto_2938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2942 ?auto_2937 ?auto_2935 )
      ( DELIVER-2PKG-VERIFY ?auto_2936 ?auto_2937 ?auto_2935 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2944 - OBJ
      ?auto_2945 - OBJ
      ?auto_2943 - LOCATION
    )
    :vars
    (
      ?auto_2949 - LOCATION
      ?auto_2950 - CITY
      ?auto_2947 - OBJ
      ?auto_2948 - TRUCK
      ?auto_2946 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2949 ?auto_2950 ) ( IN-CITY ?auto_2943 ?auto_2950 ) ( not ( = ?auto_2943 ?auto_2949 ) ) ( OBJ-AT ?auto_2945 ?auto_2943 ) ( not ( = ?auto_2945 ?auto_2944 ) ) ( OBJ-AT ?auto_2944 ?auto_2949 ) ( IN-TRUCK ?auto_2947 ?auto_2948 ) ( not ( = ?auto_2945 ?auto_2947 ) ) ( not ( = ?auto_2944 ?auto_2947 ) ) ( TRUCK-AT ?auto_2948 ?auto_2946 ) ( IN-CITY ?auto_2946 ?auto_2950 ) ( not ( = ?auto_2943 ?auto_2946 ) ) ( not ( = ?auto_2949 ?auto_2946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2945 ?auto_2944 ?auto_2943 )
      ( DELIVER-2PKG-VERIFY ?auto_2944 ?auto_2945 ?auto_2943 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2952 - OBJ
      ?auto_2953 - OBJ
      ?auto_2951 - LOCATION
    )
    :vars
    (
      ?auto_2956 - LOCATION
      ?auto_2957 - CITY
      ?auto_2958 - OBJ
      ?auto_2955 - TRUCK
      ?auto_2954 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2956 ?auto_2957 ) ( IN-CITY ?auto_2951 ?auto_2957 ) ( not ( = ?auto_2951 ?auto_2956 ) ) ( OBJ-AT ?auto_2958 ?auto_2951 ) ( not ( = ?auto_2958 ?auto_2952 ) ) ( OBJ-AT ?auto_2952 ?auto_2956 ) ( IN-TRUCK ?auto_2953 ?auto_2955 ) ( not ( = ?auto_2958 ?auto_2953 ) ) ( not ( = ?auto_2952 ?auto_2953 ) ) ( TRUCK-AT ?auto_2955 ?auto_2954 ) ( IN-CITY ?auto_2954 ?auto_2957 ) ( not ( = ?auto_2951 ?auto_2954 ) ) ( not ( = ?auto_2956 ?auto_2954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2958 ?auto_2952 ?auto_2951 )
      ( DELIVER-2PKG-VERIFY ?auto_2952 ?auto_2953 ?auto_2951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2969 - OBJ
      ?auto_2970 - OBJ
      ?auto_2971 - OBJ
      ?auto_2968 - LOCATION
    )
    :vars
    (
      ?auto_2975 - LOCATION
      ?auto_2976 - CITY
      ?auto_2973 - OBJ
      ?auto_2974 - TRUCK
      ?auto_2972 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2975 ?auto_2976 ) ( IN-CITY ?auto_2968 ?auto_2976 ) ( not ( = ?auto_2968 ?auto_2975 ) ) ( OBJ-AT ?auto_2970 ?auto_2968 ) ( not ( = ?auto_2970 ?auto_2971 ) ) ( OBJ-AT ?auto_2971 ?auto_2975 ) ( IN-TRUCK ?auto_2973 ?auto_2974 ) ( not ( = ?auto_2970 ?auto_2973 ) ) ( not ( = ?auto_2971 ?auto_2973 ) ) ( TRUCK-AT ?auto_2974 ?auto_2972 ) ( IN-CITY ?auto_2972 ?auto_2976 ) ( not ( = ?auto_2968 ?auto_2972 ) ) ( not ( = ?auto_2975 ?auto_2972 ) ) ( OBJ-AT ?auto_2969 ?auto_2968 ) ( not ( = ?auto_2969 ?auto_2970 ) ) ( not ( = ?auto_2969 ?auto_2971 ) ) ( not ( = ?auto_2969 ?auto_2973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2970 ?auto_2971 ?auto_2968 )
      ( DELIVER-3PKG-VERIFY ?auto_2969 ?auto_2970 ?auto_2971 ?auto_2968 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2978 - OBJ
      ?auto_2979 - OBJ
      ?auto_2980 - OBJ
      ?auto_2977 - LOCATION
    )
    :vars
    (
      ?auto_2983 - LOCATION
      ?auto_2984 - CITY
      ?auto_2982 - TRUCK
      ?auto_2981 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2983 ?auto_2984 ) ( IN-CITY ?auto_2977 ?auto_2984 ) ( not ( = ?auto_2977 ?auto_2983 ) ) ( OBJ-AT ?auto_2978 ?auto_2977 ) ( not ( = ?auto_2978 ?auto_2980 ) ) ( OBJ-AT ?auto_2980 ?auto_2983 ) ( IN-TRUCK ?auto_2979 ?auto_2982 ) ( not ( = ?auto_2978 ?auto_2979 ) ) ( not ( = ?auto_2980 ?auto_2979 ) ) ( TRUCK-AT ?auto_2982 ?auto_2981 ) ( IN-CITY ?auto_2981 ?auto_2984 ) ( not ( = ?auto_2977 ?auto_2981 ) ) ( not ( = ?auto_2983 ?auto_2981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2978 ?auto_2980 ?auto_2977 )
      ( DELIVER-3PKG-VERIFY ?auto_2978 ?auto_2979 ?auto_2980 ?auto_2977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2986 - OBJ
      ?auto_2987 - OBJ
      ?auto_2988 - OBJ
      ?auto_2985 - LOCATION
    )
    :vars
    (
      ?auto_2992 - LOCATION
      ?auto_2993 - CITY
      ?auto_2990 - OBJ
      ?auto_2991 - TRUCK
      ?auto_2989 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2992 ?auto_2993 ) ( IN-CITY ?auto_2985 ?auto_2993 ) ( not ( = ?auto_2985 ?auto_2992 ) ) ( OBJ-AT ?auto_2988 ?auto_2985 ) ( not ( = ?auto_2988 ?auto_2987 ) ) ( OBJ-AT ?auto_2987 ?auto_2992 ) ( IN-TRUCK ?auto_2990 ?auto_2991 ) ( not ( = ?auto_2988 ?auto_2990 ) ) ( not ( = ?auto_2987 ?auto_2990 ) ) ( TRUCK-AT ?auto_2991 ?auto_2989 ) ( IN-CITY ?auto_2989 ?auto_2993 ) ( not ( = ?auto_2985 ?auto_2989 ) ) ( not ( = ?auto_2992 ?auto_2989 ) ) ( OBJ-AT ?auto_2986 ?auto_2985 ) ( not ( = ?auto_2986 ?auto_2987 ) ) ( not ( = ?auto_2986 ?auto_2988 ) ) ( not ( = ?auto_2986 ?auto_2990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2988 ?auto_2987 ?auto_2985 )
      ( DELIVER-3PKG-VERIFY ?auto_2986 ?auto_2987 ?auto_2988 ?auto_2985 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2995 - OBJ
      ?auto_2996 - OBJ
      ?auto_2997 - OBJ
      ?auto_2994 - LOCATION
    )
    :vars
    (
      ?auto_3000 - LOCATION
      ?auto_3001 - CITY
      ?auto_2999 - TRUCK
      ?auto_2998 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3000 ?auto_3001 ) ( IN-CITY ?auto_2994 ?auto_3001 ) ( not ( = ?auto_2994 ?auto_3000 ) ) ( OBJ-AT ?auto_2995 ?auto_2994 ) ( not ( = ?auto_2995 ?auto_2996 ) ) ( OBJ-AT ?auto_2996 ?auto_3000 ) ( IN-TRUCK ?auto_2997 ?auto_2999 ) ( not ( = ?auto_2995 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( TRUCK-AT ?auto_2999 ?auto_2998 ) ( IN-CITY ?auto_2998 ?auto_3001 ) ( not ( = ?auto_2994 ?auto_2998 ) ) ( not ( = ?auto_3000 ?auto_2998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2995 ?auto_2996 ?auto_2994 )
      ( DELIVER-3PKG-VERIFY ?auto_2995 ?auto_2996 ?auto_2997 ?auto_2994 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3012 - OBJ
      ?auto_3013 - OBJ
      ?auto_3014 - OBJ
      ?auto_3011 - LOCATION
    )
    :vars
    (
      ?auto_3017 - LOCATION
      ?auto_3018 - CITY
      ?auto_3016 - TRUCK
      ?auto_3015 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3017 ?auto_3018 ) ( IN-CITY ?auto_3011 ?auto_3018 ) ( not ( = ?auto_3011 ?auto_3017 ) ) ( OBJ-AT ?auto_3013 ?auto_3011 ) ( not ( = ?auto_3013 ?auto_3014 ) ) ( OBJ-AT ?auto_3014 ?auto_3017 ) ( IN-TRUCK ?auto_3012 ?auto_3016 ) ( not ( = ?auto_3013 ?auto_3012 ) ) ( not ( = ?auto_3014 ?auto_3012 ) ) ( TRUCK-AT ?auto_3016 ?auto_3015 ) ( IN-CITY ?auto_3015 ?auto_3018 ) ( not ( = ?auto_3011 ?auto_3015 ) ) ( not ( = ?auto_3017 ?auto_3015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3013 ?auto_3014 ?auto_3011 )
      ( DELIVER-3PKG-VERIFY ?auto_3012 ?auto_3013 ?auto_3014 ?auto_3011 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3029 - OBJ
      ?auto_3030 - OBJ
      ?auto_3031 - OBJ
      ?auto_3028 - LOCATION
    )
    :vars
    (
      ?auto_3034 - LOCATION
      ?auto_3035 - CITY
      ?auto_3033 - TRUCK
      ?auto_3032 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3034 ?auto_3035 ) ( IN-CITY ?auto_3028 ?auto_3035 ) ( not ( = ?auto_3028 ?auto_3034 ) ) ( OBJ-AT ?auto_3031 ?auto_3028 ) ( not ( = ?auto_3031 ?auto_3030 ) ) ( OBJ-AT ?auto_3030 ?auto_3034 ) ( IN-TRUCK ?auto_3029 ?auto_3033 ) ( not ( = ?auto_3031 ?auto_3029 ) ) ( not ( = ?auto_3030 ?auto_3029 ) ) ( TRUCK-AT ?auto_3033 ?auto_3032 ) ( IN-CITY ?auto_3032 ?auto_3035 ) ( not ( = ?auto_3028 ?auto_3032 ) ) ( not ( = ?auto_3034 ?auto_3032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3031 ?auto_3030 ?auto_3028 )
      ( DELIVER-3PKG-VERIFY ?auto_3029 ?auto_3030 ?auto_3031 ?auto_3028 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3055 - OBJ
      ?auto_3056 - OBJ
      ?auto_3057 - OBJ
      ?auto_3054 - LOCATION
    )
    :vars
    (
      ?auto_3061 - LOCATION
      ?auto_3062 - CITY
      ?auto_3059 - OBJ
      ?auto_3060 - TRUCK
      ?auto_3058 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3061 ?auto_3062 ) ( IN-CITY ?auto_3054 ?auto_3062 ) ( not ( = ?auto_3054 ?auto_3061 ) ) ( OBJ-AT ?auto_3057 ?auto_3054 ) ( not ( = ?auto_3057 ?auto_3055 ) ) ( OBJ-AT ?auto_3055 ?auto_3061 ) ( IN-TRUCK ?auto_3059 ?auto_3060 ) ( not ( = ?auto_3057 ?auto_3059 ) ) ( not ( = ?auto_3055 ?auto_3059 ) ) ( TRUCK-AT ?auto_3060 ?auto_3058 ) ( IN-CITY ?auto_3058 ?auto_3062 ) ( not ( = ?auto_3054 ?auto_3058 ) ) ( not ( = ?auto_3061 ?auto_3058 ) ) ( OBJ-AT ?auto_3056 ?auto_3054 ) ( not ( = ?auto_3055 ?auto_3056 ) ) ( not ( = ?auto_3056 ?auto_3057 ) ) ( not ( = ?auto_3056 ?auto_3059 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3057 ?auto_3055 ?auto_3054 )
      ( DELIVER-3PKG-VERIFY ?auto_3055 ?auto_3056 ?auto_3057 ?auto_3054 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3064 - OBJ
      ?auto_3065 - OBJ
      ?auto_3066 - OBJ
      ?auto_3063 - LOCATION
    )
    :vars
    (
      ?auto_3069 - LOCATION
      ?auto_3070 - CITY
      ?auto_3068 - TRUCK
      ?auto_3067 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3069 ?auto_3070 ) ( IN-CITY ?auto_3063 ?auto_3070 ) ( not ( = ?auto_3063 ?auto_3069 ) ) ( OBJ-AT ?auto_3065 ?auto_3063 ) ( not ( = ?auto_3065 ?auto_3064 ) ) ( OBJ-AT ?auto_3064 ?auto_3069 ) ( IN-TRUCK ?auto_3066 ?auto_3068 ) ( not ( = ?auto_3065 ?auto_3066 ) ) ( not ( = ?auto_3064 ?auto_3066 ) ) ( TRUCK-AT ?auto_3068 ?auto_3067 ) ( IN-CITY ?auto_3067 ?auto_3070 ) ( not ( = ?auto_3063 ?auto_3067 ) ) ( not ( = ?auto_3069 ?auto_3067 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3065 ?auto_3064 ?auto_3063 )
      ( DELIVER-3PKG-VERIFY ?auto_3064 ?auto_3065 ?auto_3066 ?auto_3063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3081 - OBJ
      ?auto_3082 - OBJ
      ?auto_3083 - OBJ
      ?auto_3080 - LOCATION
    )
    :vars
    (
      ?auto_3086 - LOCATION
      ?auto_3087 - CITY
      ?auto_3085 - TRUCK
      ?auto_3084 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3086 ?auto_3087 ) ( IN-CITY ?auto_3080 ?auto_3087 ) ( not ( = ?auto_3080 ?auto_3086 ) ) ( OBJ-AT ?auto_3083 ?auto_3080 ) ( not ( = ?auto_3083 ?auto_3081 ) ) ( OBJ-AT ?auto_3081 ?auto_3086 ) ( IN-TRUCK ?auto_3082 ?auto_3085 ) ( not ( = ?auto_3083 ?auto_3082 ) ) ( not ( = ?auto_3081 ?auto_3082 ) ) ( TRUCK-AT ?auto_3085 ?auto_3084 ) ( IN-CITY ?auto_3084 ?auto_3087 ) ( not ( = ?auto_3080 ?auto_3084 ) ) ( not ( = ?auto_3086 ?auto_3084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3083 ?auto_3081 ?auto_3080 )
      ( DELIVER-3PKG-VERIFY ?auto_3081 ?auto_3082 ?auto_3083 ?auto_3080 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3135 - OBJ
      ?auto_3134 - LOCATION
    )
    :vars
    (
      ?auto_3139 - LOCATION
      ?auto_3140 - CITY
      ?auto_3141 - OBJ
      ?auto_3137 - OBJ
      ?auto_3138 - TRUCK
      ?auto_3136 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3139 ?auto_3140 ) ( IN-CITY ?auto_3134 ?auto_3140 ) ( not ( = ?auto_3134 ?auto_3139 ) ) ( OBJ-AT ?auto_3141 ?auto_3134 ) ( not ( = ?auto_3141 ?auto_3135 ) ) ( OBJ-AT ?auto_3135 ?auto_3139 ) ( not ( = ?auto_3141 ?auto_3137 ) ) ( not ( = ?auto_3135 ?auto_3137 ) ) ( TRUCK-AT ?auto_3138 ?auto_3136 ) ( IN-CITY ?auto_3136 ?auto_3140 ) ( not ( = ?auto_3134 ?auto_3136 ) ) ( not ( = ?auto_3139 ?auto_3136 ) ) ( OBJ-AT ?auto_3137 ?auto_3136 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3137 ?auto_3138 ?auto_3136 )
      ( DELIVER-2PKG ?auto_3141 ?auto_3135 ?auto_3134 )
      ( DELIVER-1PKG-VERIFY ?auto_3135 ?auto_3134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3143 - OBJ
      ?auto_3144 - OBJ
      ?auto_3142 - LOCATION
    )
    :vars
    (
      ?auto_3149 - LOCATION
      ?auto_3148 - CITY
      ?auto_3147 - OBJ
      ?auto_3145 - TRUCK
      ?auto_3146 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3149 ?auto_3148 ) ( IN-CITY ?auto_3142 ?auto_3148 ) ( not ( = ?auto_3142 ?auto_3149 ) ) ( OBJ-AT ?auto_3143 ?auto_3142 ) ( not ( = ?auto_3143 ?auto_3144 ) ) ( OBJ-AT ?auto_3144 ?auto_3149 ) ( not ( = ?auto_3143 ?auto_3147 ) ) ( not ( = ?auto_3144 ?auto_3147 ) ) ( TRUCK-AT ?auto_3145 ?auto_3146 ) ( IN-CITY ?auto_3146 ?auto_3148 ) ( not ( = ?auto_3142 ?auto_3146 ) ) ( not ( = ?auto_3149 ?auto_3146 ) ) ( OBJ-AT ?auto_3147 ?auto_3146 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3144 ?auto_3142 )
      ( DELIVER-2PKG-VERIFY ?auto_3143 ?auto_3144 ?auto_3142 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3151 - OBJ
      ?auto_3152 - OBJ
      ?auto_3150 - LOCATION
    )
    :vars
    (
      ?auto_3154 - LOCATION
      ?auto_3156 - CITY
      ?auto_3157 - OBJ
      ?auto_3155 - TRUCK
      ?auto_3153 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3154 ?auto_3156 ) ( IN-CITY ?auto_3150 ?auto_3156 ) ( not ( = ?auto_3150 ?auto_3154 ) ) ( OBJ-AT ?auto_3157 ?auto_3150 ) ( not ( = ?auto_3157 ?auto_3152 ) ) ( OBJ-AT ?auto_3152 ?auto_3154 ) ( not ( = ?auto_3157 ?auto_3151 ) ) ( not ( = ?auto_3152 ?auto_3151 ) ) ( TRUCK-AT ?auto_3155 ?auto_3153 ) ( IN-CITY ?auto_3153 ?auto_3156 ) ( not ( = ?auto_3150 ?auto_3153 ) ) ( not ( = ?auto_3154 ?auto_3153 ) ) ( OBJ-AT ?auto_3151 ?auto_3153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3157 ?auto_3152 ?auto_3150 )
      ( DELIVER-2PKG-VERIFY ?auto_3151 ?auto_3152 ?auto_3150 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3159 - OBJ
      ?auto_3160 - OBJ
      ?auto_3158 - LOCATION
    )
    :vars
    (
      ?auto_3162 - LOCATION
      ?auto_3165 - CITY
      ?auto_3163 - OBJ
      ?auto_3164 - TRUCK
      ?auto_3161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3162 ?auto_3165 ) ( IN-CITY ?auto_3158 ?auto_3165 ) ( not ( = ?auto_3158 ?auto_3162 ) ) ( OBJ-AT ?auto_3160 ?auto_3158 ) ( not ( = ?auto_3160 ?auto_3159 ) ) ( OBJ-AT ?auto_3159 ?auto_3162 ) ( not ( = ?auto_3160 ?auto_3163 ) ) ( not ( = ?auto_3159 ?auto_3163 ) ) ( TRUCK-AT ?auto_3164 ?auto_3161 ) ( IN-CITY ?auto_3161 ?auto_3165 ) ( not ( = ?auto_3158 ?auto_3161 ) ) ( not ( = ?auto_3162 ?auto_3161 ) ) ( OBJ-AT ?auto_3163 ?auto_3161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3160 ?auto_3159 ?auto_3158 )
      ( DELIVER-2PKG-VERIFY ?auto_3159 ?auto_3160 ?auto_3158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3167 - OBJ
      ?auto_3168 - OBJ
      ?auto_3166 - LOCATION
    )
    :vars
    (
      ?auto_3170 - LOCATION
      ?auto_3172 - CITY
      ?auto_3173 - OBJ
      ?auto_3171 - TRUCK
      ?auto_3169 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3170 ?auto_3172 ) ( IN-CITY ?auto_3166 ?auto_3172 ) ( not ( = ?auto_3166 ?auto_3170 ) ) ( OBJ-AT ?auto_3173 ?auto_3166 ) ( not ( = ?auto_3173 ?auto_3167 ) ) ( OBJ-AT ?auto_3167 ?auto_3170 ) ( not ( = ?auto_3173 ?auto_3168 ) ) ( not ( = ?auto_3167 ?auto_3168 ) ) ( TRUCK-AT ?auto_3171 ?auto_3169 ) ( IN-CITY ?auto_3169 ?auto_3172 ) ( not ( = ?auto_3166 ?auto_3169 ) ) ( not ( = ?auto_3170 ?auto_3169 ) ) ( OBJ-AT ?auto_3168 ?auto_3169 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3173 ?auto_3167 ?auto_3166 )
      ( DELIVER-2PKG-VERIFY ?auto_3167 ?auto_3168 ?auto_3166 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3184 - OBJ
      ?auto_3185 - OBJ
      ?auto_3186 - OBJ
      ?auto_3183 - LOCATION
    )
    :vars
    (
      ?auto_3188 - LOCATION
      ?auto_3191 - CITY
      ?auto_3189 - OBJ
      ?auto_3190 - TRUCK
      ?auto_3187 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3188 ?auto_3191 ) ( IN-CITY ?auto_3183 ?auto_3191 ) ( not ( = ?auto_3183 ?auto_3188 ) ) ( OBJ-AT ?auto_3185 ?auto_3183 ) ( not ( = ?auto_3185 ?auto_3186 ) ) ( OBJ-AT ?auto_3186 ?auto_3188 ) ( not ( = ?auto_3185 ?auto_3189 ) ) ( not ( = ?auto_3186 ?auto_3189 ) ) ( TRUCK-AT ?auto_3190 ?auto_3187 ) ( IN-CITY ?auto_3187 ?auto_3191 ) ( not ( = ?auto_3183 ?auto_3187 ) ) ( not ( = ?auto_3188 ?auto_3187 ) ) ( OBJ-AT ?auto_3189 ?auto_3187 ) ( OBJ-AT ?auto_3184 ?auto_3183 ) ( not ( = ?auto_3184 ?auto_3185 ) ) ( not ( = ?auto_3184 ?auto_3186 ) ) ( not ( = ?auto_3184 ?auto_3189 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3185 ?auto_3186 ?auto_3183 )
      ( DELIVER-3PKG-VERIFY ?auto_3184 ?auto_3185 ?auto_3186 ?auto_3183 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3193 - OBJ
      ?auto_3194 - OBJ
      ?auto_3195 - OBJ
      ?auto_3192 - LOCATION
    )
    :vars
    (
      ?auto_3197 - LOCATION
      ?auto_3199 - CITY
      ?auto_3198 - TRUCK
      ?auto_3196 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3197 ?auto_3199 ) ( IN-CITY ?auto_3192 ?auto_3199 ) ( not ( = ?auto_3192 ?auto_3197 ) ) ( OBJ-AT ?auto_3193 ?auto_3192 ) ( not ( = ?auto_3193 ?auto_3195 ) ) ( OBJ-AT ?auto_3195 ?auto_3197 ) ( not ( = ?auto_3193 ?auto_3194 ) ) ( not ( = ?auto_3195 ?auto_3194 ) ) ( TRUCK-AT ?auto_3198 ?auto_3196 ) ( IN-CITY ?auto_3196 ?auto_3199 ) ( not ( = ?auto_3192 ?auto_3196 ) ) ( not ( = ?auto_3197 ?auto_3196 ) ) ( OBJ-AT ?auto_3194 ?auto_3196 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3193 ?auto_3195 ?auto_3192 )
      ( DELIVER-3PKG-VERIFY ?auto_3193 ?auto_3194 ?auto_3195 ?auto_3192 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3201 - OBJ
      ?auto_3202 - OBJ
      ?auto_3203 - OBJ
      ?auto_3200 - LOCATION
    )
    :vars
    (
      ?auto_3205 - LOCATION
      ?auto_3208 - CITY
      ?auto_3206 - OBJ
      ?auto_3207 - TRUCK
      ?auto_3204 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3205 ?auto_3208 ) ( IN-CITY ?auto_3200 ?auto_3208 ) ( not ( = ?auto_3200 ?auto_3205 ) ) ( OBJ-AT ?auto_3203 ?auto_3200 ) ( not ( = ?auto_3203 ?auto_3202 ) ) ( OBJ-AT ?auto_3202 ?auto_3205 ) ( not ( = ?auto_3203 ?auto_3206 ) ) ( not ( = ?auto_3202 ?auto_3206 ) ) ( TRUCK-AT ?auto_3207 ?auto_3204 ) ( IN-CITY ?auto_3204 ?auto_3208 ) ( not ( = ?auto_3200 ?auto_3204 ) ) ( not ( = ?auto_3205 ?auto_3204 ) ) ( OBJ-AT ?auto_3206 ?auto_3204 ) ( OBJ-AT ?auto_3201 ?auto_3200 ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( not ( = ?auto_3201 ?auto_3206 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3203 ?auto_3202 ?auto_3200 )
      ( DELIVER-3PKG-VERIFY ?auto_3201 ?auto_3202 ?auto_3203 ?auto_3200 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3210 - OBJ
      ?auto_3211 - OBJ
      ?auto_3212 - OBJ
      ?auto_3209 - LOCATION
    )
    :vars
    (
      ?auto_3214 - LOCATION
      ?auto_3216 - CITY
      ?auto_3215 - TRUCK
      ?auto_3213 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3214 ?auto_3216 ) ( IN-CITY ?auto_3209 ?auto_3216 ) ( not ( = ?auto_3209 ?auto_3214 ) ) ( OBJ-AT ?auto_3210 ?auto_3209 ) ( not ( = ?auto_3210 ?auto_3211 ) ) ( OBJ-AT ?auto_3211 ?auto_3214 ) ( not ( = ?auto_3210 ?auto_3212 ) ) ( not ( = ?auto_3211 ?auto_3212 ) ) ( TRUCK-AT ?auto_3215 ?auto_3213 ) ( IN-CITY ?auto_3213 ?auto_3216 ) ( not ( = ?auto_3209 ?auto_3213 ) ) ( not ( = ?auto_3214 ?auto_3213 ) ) ( OBJ-AT ?auto_3212 ?auto_3213 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3210 ?auto_3211 ?auto_3209 )
      ( DELIVER-3PKG-VERIFY ?auto_3210 ?auto_3211 ?auto_3212 ?auto_3209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3227 - OBJ
      ?auto_3228 - OBJ
      ?auto_3229 - OBJ
      ?auto_3226 - LOCATION
    )
    :vars
    (
      ?auto_3231 - LOCATION
      ?auto_3233 - CITY
      ?auto_3232 - TRUCK
      ?auto_3230 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3231 ?auto_3233 ) ( IN-CITY ?auto_3226 ?auto_3233 ) ( not ( = ?auto_3226 ?auto_3231 ) ) ( OBJ-AT ?auto_3228 ?auto_3226 ) ( not ( = ?auto_3228 ?auto_3229 ) ) ( OBJ-AT ?auto_3229 ?auto_3231 ) ( not ( = ?auto_3228 ?auto_3227 ) ) ( not ( = ?auto_3229 ?auto_3227 ) ) ( TRUCK-AT ?auto_3232 ?auto_3230 ) ( IN-CITY ?auto_3230 ?auto_3233 ) ( not ( = ?auto_3226 ?auto_3230 ) ) ( not ( = ?auto_3231 ?auto_3230 ) ) ( OBJ-AT ?auto_3227 ?auto_3230 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3228 ?auto_3229 ?auto_3226 )
      ( DELIVER-3PKG-VERIFY ?auto_3227 ?auto_3228 ?auto_3229 ?auto_3226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3244 - OBJ
      ?auto_3245 - OBJ
      ?auto_3246 - OBJ
      ?auto_3243 - LOCATION
    )
    :vars
    (
      ?auto_3248 - LOCATION
      ?auto_3250 - CITY
      ?auto_3249 - TRUCK
      ?auto_3247 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3248 ?auto_3250 ) ( IN-CITY ?auto_3243 ?auto_3250 ) ( not ( = ?auto_3243 ?auto_3248 ) ) ( OBJ-AT ?auto_3246 ?auto_3243 ) ( not ( = ?auto_3246 ?auto_3245 ) ) ( OBJ-AT ?auto_3245 ?auto_3248 ) ( not ( = ?auto_3246 ?auto_3244 ) ) ( not ( = ?auto_3245 ?auto_3244 ) ) ( TRUCK-AT ?auto_3249 ?auto_3247 ) ( IN-CITY ?auto_3247 ?auto_3250 ) ( not ( = ?auto_3243 ?auto_3247 ) ) ( not ( = ?auto_3248 ?auto_3247 ) ) ( OBJ-AT ?auto_3244 ?auto_3247 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3246 ?auto_3245 ?auto_3243 )
      ( DELIVER-3PKG-VERIFY ?auto_3244 ?auto_3245 ?auto_3246 ?auto_3243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3270 - OBJ
      ?auto_3271 - OBJ
      ?auto_3272 - OBJ
      ?auto_3269 - LOCATION
    )
    :vars
    (
      ?auto_3274 - LOCATION
      ?auto_3277 - CITY
      ?auto_3275 - OBJ
      ?auto_3276 - TRUCK
      ?auto_3273 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3274 ?auto_3277 ) ( IN-CITY ?auto_3269 ?auto_3277 ) ( not ( = ?auto_3269 ?auto_3274 ) ) ( OBJ-AT ?auto_3272 ?auto_3269 ) ( not ( = ?auto_3272 ?auto_3270 ) ) ( OBJ-AT ?auto_3270 ?auto_3274 ) ( not ( = ?auto_3272 ?auto_3275 ) ) ( not ( = ?auto_3270 ?auto_3275 ) ) ( TRUCK-AT ?auto_3276 ?auto_3273 ) ( IN-CITY ?auto_3273 ?auto_3277 ) ( not ( = ?auto_3269 ?auto_3273 ) ) ( not ( = ?auto_3274 ?auto_3273 ) ) ( OBJ-AT ?auto_3275 ?auto_3273 ) ( OBJ-AT ?auto_3271 ?auto_3269 ) ( not ( = ?auto_3270 ?auto_3271 ) ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( not ( = ?auto_3271 ?auto_3275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3272 ?auto_3270 ?auto_3269 )
      ( DELIVER-3PKG-VERIFY ?auto_3270 ?auto_3271 ?auto_3272 ?auto_3269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3279 - OBJ
      ?auto_3280 - OBJ
      ?auto_3281 - OBJ
      ?auto_3278 - LOCATION
    )
    :vars
    (
      ?auto_3283 - LOCATION
      ?auto_3285 - CITY
      ?auto_3284 - TRUCK
      ?auto_3282 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3283 ?auto_3285 ) ( IN-CITY ?auto_3278 ?auto_3285 ) ( not ( = ?auto_3278 ?auto_3283 ) ) ( OBJ-AT ?auto_3280 ?auto_3278 ) ( not ( = ?auto_3280 ?auto_3279 ) ) ( OBJ-AT ?auto_3279 ?auto_3283 ) ( not ( = ?auto_3280 ?auto_3281 ) ) ( not ( = ?auto_3279 ?auto_3281 ) ) ( TRUCK-AT ?auto_3284 ?auto_3282 ) ( IN-CITY ?auto_3282 ?auto_3285 ) ( not ( = ?auto_3278 ?auto_3282 ) ) ( not ( = ?auto_3283 ?auto_3282 ) ) ( OBJ-AT ?auto_3281 ?auto_3282 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3280 ?auto_3279 ?auto_3278 )
      ( DELIVER-3PKG-VERIFY ?auto_3279 ?auto_3280 ?auto_3281 ?auto_3278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3296 - OBJ
      ?auto_3297 - OBJ
      ?auto_3298 - OBJ
      ?auto_3295 - LOCATION
    )
    :vars
    (
      ?auto_3300 - LOCATION
      ?auto_3302 - CITY
      ?auto_3301 - TRUCK
      ?auto_3299 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3300 ?auto_3302 ) ( IN-CITY ?auto_3295 ?auto_3302 ) ( not ( = ?auto_3295 ?auto_3300 ) ) ( OBJ-AT ?auto_3298 ?auto_3295 ) ( not ( = ?auto_3298 ?auto_3296 ) ) ( OBJ-AT ?auto_3296 ?auto_3300 ) ( not ( = ?auto_3298 ?auto_3297 ) ) ( not ( = ?auto_3296 ?auto_3297 ) ) ( TRUCK-AT ?auto_3301 ?auto_3299 ) ( IN-CITY ?auto_3299 ?auto_3302 ) ( not ( = ?auto_3295 ?auto_3299 ) ) ( not ( = ?auto_3300 ?auto_3299 ) ) ( OBJ-AT ?auto_3297 ?auto_3299 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3298 ?auto_3296 ?auto_3295 )
      ( DELIVER-3PKG-VERIFY ?auto_3296 ?auto_3297 ?auto_3298 ?auto_3295 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3350 - OBJ
      ?auto_3349 - LOCATION
    )
    :vars
    (
      ?auto_3352 - LOCATION
      ?auto_3355 - CITY
      ?auto_3356 - OBJ
      ?auto_3353 - OBJ
      ?auto_3351 - LOCATION
      ?auto_3354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3352 ?auto_3355 ) ( IN-CITY ?auto_3349 ?auto_3355 ) ( not ( = ?auto_3349 ?auto_3352 ) ) ( OBJ-AT ?auto_3356 ?auto_3349 ) ( not ( = ?auto_3356 ?auto_3350 ) ) ( OBJ-AT ?auto_3350 ?auto_3352 ) ( not ( = ?auto_3356 ?auto_3353 ) ) ( not ( = ?auto_3350 ?auto_3353 ) ) ( IN-CITY ?auto_3351 ?auto_3355 ) ( not ( = ?auto_3349 ?auto_3351 ) ) ( not ( = ?auto_3352 ?auto_3351 ) ) ( OBJ-AT ?auto_3353 ?auto_3351 ) ( TRUCK-AT ?auto_3354 ?auto_3349 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3354 ?auto_3349 ?auto_3351 ?auto_3355 )
      ( DELIVER-2PKG ?auto_3356 ?auto_3350 ?auto_3349 )
      ( DELIVER-1PKG-VERIFY ?auto_3350 ?auto_3349 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3358 - OBJ
      ?auto_3359 - OBJ
      ?auto_3357 - LOCATION
    )
    :vars
    (
      ?auto_3364 - LOCATION
      ?auto_3362 - CITY
      ?auto_3360 - OBJ
      ?auto_3361 - LOCATION
      ?auto_3363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3364 ?auto_3362 ) ( IN-CITY ?auto_3357 ?auto_3362 ) ( not ( = ?auto_3357 ?auto_3364 ) ) ( OBJ-AT ?auto_3358 ?auto_3357 ) ( not ( = ?auto_3358 ?auto_3359 ) ) ( OBJ-AT ?auto_3359 ?auto_3364 ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3359 ?auto_3360 ) ) ( IN-CITY ?auto_3361 ?auto_3362 ) ( not ( = ?auto_3357 ?auto_3361 ) ) ( not ( = ?auto_3364 ?auto_3361 ) ) ( OBJ-AT ?auto_3360 ?auto_3361 ) ( TRUCK-AT ?auto_3363 ?auto_3357 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3359 ?auto_3357 )
      ( DELIVER-2PKG-VERIFY ?auto_3358 ?auto_3359 ?auto_3357 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3366 - OBJ
      ?auto_3367 - OBJ
      ?auto_3365 - LOCATION
    )
    :vars
    (
      ?auto_3368 - LOCATION
      ?auto_3371 - CITY
      ?auto_3372 - OBJ
      ?auto_3369 - LOCATION
      ?auto_3370 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3368 ?auto_3371 ) ( IN-CITY ?auto_3365 ?auto_3371 ) ( not ( = ?auto_3365 ?auto_3368 ) ) ( OBJ-AT ?auto_3372 ?auto_3365 ) ( not ( = ?auto_3372 ?auto_3367 ) ) ( OBJ-AT ?auto_3367 ?auto_3368 ) ( not ( = ?auto_3372 ?auto_3366 ) ) ( not ( = ?auto_3367 ?auto_3366 ) ) ( IN-CITY ?auto_3369 ?auto_3371 ) ( not ( = ?auto_3365 ?auto_3369 ) ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( OBJ-AT ?auto_3366 ?auto_3369 ) ( TRUCK-AT ?auto_3370 ?auto_3365 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3372 ?auto_3367 ?auto_3365 )
      ( DELIVER-2PKG-VERIFY ?auto_3366 ?auto_3367 ?auto_3365 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3374 - OBJ
      ?auto_3375 - OBJ
      ?auto_3373 - LOCATION
    )
    :vars
    (
      ?auto_3377 - LOCATION
      ?auto_3380 - CITY
      ?auto_3376 - OBJ
      ?auto_3378 - LOCATION
      ?auto_3379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3377 ?auto_3380 ) ( IN-CITY ?auto_3373 ?auto_3380 ) ( not ( = ?auto_3373 ?auto_3377 ) ) ( OBJ-AT ?auto_3375 ?auto_3373 ) ( not ( = ?auto_3375 ?auto_3374 ) ) ( OBJ-AT ?auto_3374 ?auto_3377 ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( IN-CITY ?auto_3378 ?auto_3380 ) ( not ( = ?auto_3373 ?auto_3378 ) ) ( not ( = ?auto_3377 ?auto_3378 ) ) ( OBJ-AT ?auto_3376 ?auto_3378 ) ( TRUCK-AT ?auto_3379 ?auto_3373 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3375 ?auto_3374 ?auto_3373 )
      ( DELIVER-2PKG-VERIFY ?auto_3374 ?auto_3375 ?auto_3373 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3382 - OBJ
      ?auto_3383 - OBJ
      ?auto_3381 - LOCATION
    )
    :vars
    (
      ?auto_3384 - LOCATION
      ?auto_3387 - CITY
      ?auto_3388 - OBJ
      ?auto_3385 - LOCATION
      ?auto_3386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3384 ?auto_3387 ) ( IN-CITY ?auto_3381 ?auto_3387 ) ( not ( = ?auto_3381 ?auto_3384 ) ) ( OBJ-AT ?auto_3388 ?auto_3381 ) ( not ( = ?auto_3388 ?auto_3382 ) ) ( OBJ-AT ?auto_3382 ?auto_3384 ) ( not ( = ?auto_3388 ?auto_3383 ) ) ( not ( = ?auto_3382 ?auto_3383 ) ) ( IN-CITY ?auto_3385 ?auto_3387 ) ( not ( = ?auto_3381 ?auto_3385 ) ) ( not ( = ?auto_3384 ?auto_3385 ) ) ( OBJ-AT ?auto_3383 ?auto_3385 ) ( TRUCK-AT ?auto_3386 ?auto_3381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3388 ?auto_3382 ?auto_3381 )
      ( DELIVER-2PKG-VERIFY ?auto_3382 ?auto_3383 ?auto_3381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3399 - OBJ
      ?auto_3400 - OBJ
      ?auto_3401 - OBJ
      ?auto_3398 - LOCATION
    )
    :vars
    (
      ?auto_3403 - LOCATION
      ?auto_3406 - CITY
      ?auto_3402 - OBJ
      ?auto_3404 - LOCATION
      ?auto_3405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3403 ?auto_3406 ) ( IN-CITY ?auto_3398 ?auto_3406 ) ( not ( = ?auto_3398 ?auto_3403 ) ) ( OBJ-AT ?auto_3400 ?auto_3398 ) ( not ( = ?auto_3400 ?auto_3401 ) ) ( OBJ-AT ?auto_3401 ?auto_3403 ) ( not ( = ?auto_3400 ?auto_3402 ) ) ( not ( = ?auto_3401 ?auto_3402 ) ) ( IN-CITY ?auto_3404 ?auto_3406 ) ( not ( = ?auto_3398 ?auto_3404 ) ) ( not ( = ?auto_3403 ?auto_3404 ) ) ( OBJ-AT ?auto_3402 ?auto_3404 ) ( TRUCK-AT ?auto_3405 ?auto_3398 ) ( OBJ-AT ?auto_3399 ?auto_3398 ) ( not ( = ?auto_3399 ?auto_3400 ) ) ( not ( = ?auto_3399 ?auto_3401 ) ) ( not ( = ?auto_3399 ?auto_3402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3400 ?auto_3401 ?auto_3398 )
      ( DELIVER-3PKG-VERIFY ?auto_3399 ?auto_3400 ?auto_3401 ?auto_3398 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3408 - OBJ
      ?auto_3409 - OBJ
      ?auto_3410 - OBJ
      ?auto_3407 - LOCATION
    )
    :vars
    (
      ?auto_3411 - LOCATION
      ?auto_3414 - CITY
      ?auto_3412 - LOCATION
      ?auto_3413 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3411 ?auto_3414 ) ( IN-CITY ?auto_3407 ?auto_3414 ) ( not ( = ?auto_3407 ?auto_3411 ) ) ( OBJ-AT ?auto_3408 ?auto_3407 ) ( not ( = ?auto_3408 ?auto_3410 ) ) ( OBJ-AT ?auto_3410 ?auto_3411 ) ( not ( = ?auto_3408 ?auto_3409 ) ) ( not ( = ?auto_3410 ?auto_3409 ) ) ( IN-CITY ?auto_3412 ?auto_3414 ) ( not ( = ?auto_3407 ?auto_3412 ) ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( OBJ-AT ?auto_3409 ?auto_3412 ) ( TRUCK-AT ?auto_3413 ?auto_3407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3408 ?auto_3410 ?auto_3407 )
      ( DELIVER-3PKG-VERIFY ?auto_3408 ?auto_3409 ?auto_3410 ?auto_3407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3416 - OBJ
      ?auto_3417 - OBJ
      ?auto_3418 - OBJ
      ?auto_3415 - LOCATION
    )
    :vars
    (
      ?auto_3420 - LOCATION
      ?auto_3423 - CITY
      ?auto_3419 - OBJ
      ?auto_3421 - LOCATION
      ?auto_3422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3420 ?auto_3423 ) ( IN-CITY ?auto_3415 ?auto_3423 ) ( not ( = ?auto_3415 ?auto_3420 ) ) ( OBJ-AT ?auto_3418 ?auto_3415 ) ( not ( = ?auto_3418 ?auto_3417 ) ) ( OBJ-AT ?auto_3417 ?auto_3420 ) ( not ( = ?auto_3418 ?auto_3419 ) ) ( not ( = ?auto_3417 ?auto_3419 ) ) ( IN-CITY ?auto_3421 ?auto_3423 ) ( not ( = ?auto_3415 ?auto_3421 ) ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( OBJ-AT ?auto_3419 ?auto_3421 ) ( TRUCK-AT ?auto_3422 ?auto_3415 ) ( OBJ-AT ?auto_3416 ?auto_3415 ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( not ( = ?auto_3416 ?auto_3418 ) ) ( not ( = ?auto_3416 ?auto_3419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3418 ?auto_3417 ?auto_3415 )
      ( DELIVER-3PKG-VERIFY ?auto_3416 ?auto_3417 ?auto_3418 ?auto_3415 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3425 - OBJ
      ?auto_3426 - OBJ
      ?auto_3427 - OBJ
      ?auto_3424 - LOCATION
    )
    :vars
    (
      ?auto_3428 - LOCATION
      ?auto_3431 - CITY
      ?auto_3429 - LOCATION
      ?auto_3430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3428 ?auto_3431 ) ( IN-CITY ?auto_3424 ?auto_3431 ) ( not ( = ?auto_3424 ?auto_3428 ) ) ( OBJ-AT ?auto_3425 ?auto_3424 ) ( not ( = ?auto_3425 ?auto_3426 ) ) ( OBJ-AT ?auto_3426 ?auto_3428 ) ( not ( = ?auto_3425 ?auto_3427 ) ) ( not ( = ?auto_3426 ?auto_3427 ) ) ( IN-CITY ?auto_3429 ?auto_3431 ) ( not ( = ?auto_3424 ?auto_3429 ) ) ( not ( = ?auto_3428 ?auto_3429 ) ) ( OBJ-AT ?auto_3427 ?auto_3429 ) ( TRUCK-AT ?auto_3430 ?auto_3424 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3425 ?auto_3426 ?auto_3424 )
      ( DELIVER-3PKG-VERIFY ?auto_3425 ?auto_3426 ?auto_3427 ?auto_3424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3442 - OBJ
      ?auto_3443 - OBJ
      ?auto_3444 - OBJ
      ?auto_3441 - LOCATION
    )
    :vars
    (
      ?auto_3445 - LOCATION
      ?auto_3448 - CITY
      ?auto_3446 - LOCATION
      ?auto_3447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3445 ?auto_3448 ) ( IN-CITY ?auto_3441 ?auto_3448 ) ( not ( = ?auto_3441 ?auto_3445 ) ) ( OBJ-AT ?auto_3443 ?auto_3441 ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( OBJ-AT ?auto_3444 ?auto_3445 ) ( not ( = ?auto_3443 ?auto_3442 ) ) ( not ( = ?auto_3444 ?auto_3442 ) ) ( IN-CITY ?auto_3446 ?auto_3448 ) ( not ( = ?auto_3441 ?auto_3446 ) ) ( not ( = ?auto_3445 ?auto_3446 ) ) ( OBJ-AT ?auto_3442 ?auto_3446 ) ( TRUCK-AT ?auto_3447 ?auto_3441 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3443 ?auto_3444 ?auto_3441 )
      ( DELIVER-3PKG-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3459 - OBJ
      ?auto_3460 - OBJ
      ?auto_3461 - OBJ
      ?auto_3458 - LOCATION
    )
    :vars
    (
      ?auto_3462 - LOCATION
      ?auto_3465 - CITY
      ?auto_3463 - LOCATION
      ?auto_3464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3462 ?auto_3465 ) ( IN-CITY ?auto_3458 ?auto_3465 ) ( not ( = ?auto_3458 ?auto_3462 ) ) ( OBJ-AT ?auto_3461 ?auto_3458 ) ( not ( = ?auto_3461 ?auto_3460 ) ) ( OBJ-AT ?auto_3460 ?auto_3462 ) ( not ( = ?auto_3461 ?auto_3459 ) ) ( not ( = ?auto_3460 ?auto_3459 ) ) ( IN-CITY ?auto_3463 ?auto_3465 ) ( not ( = ?auto_3458 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3463 ) ) ( OBJ-AT ?auto_3459 ?auto_3463 ) ( TRUCK-AT ?auto_3464 ?auto_3458 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3461 ?auto_3460 ?auto_3458 )
      ( DELIVER-3PKG-VERIFY ?auto_3459 ?auto_3460 ?auto_3461 ?auto_3458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3485 - OBJ
      ?auto_3486 - OBJ
      ?auto_3487 - OBJ
      ?auto_3484 - LOCATION
    )
    :vars
    (
      ?auto_3489 - LOCATION
      ?auto_3492 - CITY
      ?auto_3488 - OBJ
      ?auto_3490 - LOCATION
      ?auto_3491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3489 ?auto_3492 ) ( IN-CITY ?auto_3484 ?auto_3492 ) ( not ( = ?auto_3484 ?auto_3489 ) ) ( OBJ-AT ?auto_3487 ?auto_3484 ) ( not ( = ?auto_3487 ?auto_3485 ) ) ( OBJ-AT ?auto_3485 ?auto_3489 ) ( not ( = ?auto_3487 ?auto_3488 ) ) ( not ( = ?auto_3485 ?auto_3488 ) ) ( IN-CITY ?auto_3490 ?auto_3492 ) ( not ( = ?auto_3484 ?auto_3490 ) ) ( not ( = ?auto_3489 ?auto_3490 ) ) ( OBJ-AT ?auto_3488 ?auto_3490 ) ( TRUCK-AT ?auto_3491 ?auto_3484 ) ( OBJ-AT ?auto_3486 ?auto_3484 ) ( not ( = ?auto_3485 ?auto_3486 ) ) ( not ( = ?auto_3486 ?auto_3487 ) ) ( not ( = ?auto_3486 ?auto_3488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3487 ?auto_3485 ?auto_3484 )
      ( DELIVER-3PKG-VERIFY ?auto_3485 ?auto_3486 ?auto_3487 ?auto_3484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3494 - OBJ
      ?auto_3495 - OBJ
      ?auto_3496 - OBJ
      ?auto_3493 - LOCATION
    )
    :vars
    (
      ?auto_3497 - LOCATION
      ?auto_3500 - CITY
      ?auto_3498 - LOCATION
      ?auto_3499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3497 ?auto_3500 ) ( IN-CITY ?auto_3493 ?auto_3500 ) ( not ( = ?auto_3493 ?auto_3497 ) ) ( OBJ-AT ?auto_3495 ?auto_3493 ) ( not ( = ?auto_3495 ?auto_3494 ) ) ( OBJ-AT ?auto_3494 ?auto_3497 ) ( not ( = ?auto_3495 ?auto_3496 ) ) ( not ( = ?auto_3494 ?auto_3496 ) ) ( IN-CITY ?auto_3498 ?auto_3500 ) ( not ( = ?auto_3493 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( OBJ-AT ?auto_3496 ?auto_3498 ) ( TRUCK-AT ?auto_3499 ?auto_3493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3495 ?auto_3494 ?auto_3493 )
      ( DELIVER-3PKG-VERIFY ?auto_3494 ?auto_3495 ?auto_3496 ?auto_3493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3511 - OBJ
      ?auto_3512 - OBJ
      ?auto_3513 - OBJ
      ?auto_3510 - LOCATION
    )
    :vars
    (
      ?auto_3514 - LOCATION
      ?auto_3517 - CITY
      ?auto_3515 - LOCATION
      ?auto_3516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3514 ?auto_3517 ) ( IN-CITY ?auto_3510 ?auto_3517 ) ( not ( = ?auto_3510 ?auto_3514 ) ) ( OBJ-AT ?auto_3513 ?auto_3510 ) ( not ( = ?auto_3513 ?auto_3511 ) ) ( OBJ-AT ?auto_3511 ?auto_3514 ) ( not ( = ?auto_3513 ?auto_3512 ) ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( IN-CITY ?auto_3515 ?auto_3517 ) ( not ( = ?auto_3510 ?auto_3515 ) ) ( not ( = ?auto_3514 ?auto_3515 ) ) ( OBJ-AT ?auto_3512 ?auto_3515 ) ( TRUCK-AT ?auto_3516 ?auto_3510 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3513 ?auto_3511 ?auto_3510 )
      ( DELIVER-3PKG-VERIFY ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3510 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3565 - OBJ
      ?auto_3564 - LOCATION
    )
    :vars
    (
      ?auto_3567 - LOCATION
      ?auto_3570 - CITY
      ?auto_3571 - OBJ
      ?auto_3566 - OBJ
      ?auto_3568 - LOCATION
      ?auto_3569 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3567 ?auto_3570 ) ( IN-CITY ?auto_3564 ?auto_3570 ) ( not ( = ?auto_3564 ?auto_3567 ) ) ( not ( = ?auto_3571 ?auto_3565 ) ) ( OBJ-AT ?auto_3565 ?auto_3567 ) ( not ( = ?auto_3571 ?auto_3566 ) ) ( not ( = ?auto_3565 ?auto_3566 ) ) ( IN-CITY ?auto_3568 ?auto_3570 ) ( not ( = ?auto_3564 ?auto_3568 ) ) ( not ( = ?auto_3567 ?auto_3568 ) ) ( OBJ-AT ?auto_3566 ?auto_3568 ) ( TRUCK-AT ?auto_3569 ?auto_3564 ) ( IN-TRUCK ?auto_3571 ?auto_3569 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3571 ?auto_3564 )
      ( DELIVER-2PKG ?auto_3571 ?auto_3565 ?auto_3564 )
      ( DELIVER-1PKG-VERIFY ?auto_3565 ?auto_3564 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3573 - OBJ
      ?auto_3574 - OBJ
      ?auto_3572 - LOCATION
    )
    :vars
    (
      ?auto_3575 - LOCATION
      ?auto_3579 - CITY
      ?auto_3578 - OBJ
      ?auto_3576 - LOCATION
      ?auto_3577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3575 ?auto_3579 ) ( IN-CITY ?auto_3572 ?auto_3579 ) ( not ( = ?auto_3572 ?auto_3575 ) ) ( not ( = ?auto_3573 ?auto_3574 ) ) ( OBJ-AT ?auto_3574 ?auto_3575 ) ( not ( = ?auto_3573 ?auto_3578 ) ) ( not ( = ?auto_3574 ?auto_3578 ) ) ( IN-CITY ?auto_3576 ?auto_3579 ) ( not ( = ?auto_3572 ?auto_3576 ) ) ( not ( = ?auto_3575 ?auto_3576 ) ) ( OBJ-AT ?auto_3578 ?auto_3576 ) ( TRUCK-AT ?auto_3577 ?auto_3572 ) ( IN-TRUCK ?auto_3573 ?auto_3577 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3574 ?auto_3572 )
      ( DELIVER-2PKG-VERIFY ?auto_3573 ?auto_3574 ?auto_3572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3581 - OBJ
      ?auto_3582 - OBJ
      ?auto_3580 - LOCATION
    )
    :vars
    (
      ?auto_3586 - LOCATION
      ?auto_3583 - CITY
      ?auto_3587 - OBJ
      ?auto_3585 - LOCATION
      ?auto_3584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3586 ?auto_3583 ) ( IN-CITY ?auto_3580 ?auto_3583 ) ( not ( = ?auto_3580 ?auto_3586 ) ) ( not ( = ?auto_3587 ?auto_3582 ) ) ( OBJ-AT ?auto_3582 ?auto_3586 ) ( not ( = ?auto_3587 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3581 ) ) ( IN-CITY ?auto_3585 ?auto_3583 ) ( not ( = ?auto_3580 ?auto_3585 ) ) ( not ( = ?auto_3586 ?auto_3585 ) ) ( OBJ-AT ?auto_3581 ?auto_3585 ) ( TRUCK-AT ?auto_3584 ?auto_3580 ) ( IN-TRUCK ?auto_3587 ?auto_3584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3587 ?auto_3582 ?auto_3580 )
      ( DELIVER-2PKG-VERIFY ?auto_3581 ?auto_3582 ?auto_3580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3589 - OBJ
      ?auto_3590 - OBJ
      ?auto_3588 - LOCATION
    )
    :vars
    (
      ?auto_3595 - LOCATION
      ?auto_3591 - CITY
      ?auto_3592 - OBJ
      ?auto_3594 - LOCATION
      ?auto_3593 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3595 ?auto_3591 ) ( IN-CITY ?auto_3588 ?auto_3591 ) ( not ( = ?auto_3588 ?auto_3595 ) ) ( not ( = ?auto_3590 ?auto_3589 ) ) ( OBJ-AT ?auto_3589 ?auto_3595 ) ( not ( = ?auto_3590 ?auto_3592 ) ) ( not ( = ?auto_3589 ?auto_3592 ) ) ( IN-CITY ?auto_3594 ?auto_3591 ) ( not ( = ?auto_3588 ?auto_3594 ) ) ( not ( = ?auto_3595 ?auto_3594 ) ) ( OBJ-AT ?auto_3592 ?auto_3594 ) ( TRUCK-AT ?auto_3593 ?auto_3588 ) ( IN-TRUCK ?auto_3590 ?auto_3593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3590 ?auto_3589 ?auto_3588 )
      ( DELIVER-2PKG-VERIFY ?auto_3589 ?auto_3590 ?auto_3588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3597 - OBJ
      ?auto_3598 - OBJ
      ?auto_3596 - LOCATION
    )
    :vars
    (
      ?auto_3602 - LOCATION
      ?auto_3599 - CITY
      ?auto_3603 - OBJ
      ?auto_3601 - LOCATION
      ?auto_3600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3602 ?auto_3599 ) ( IN-CITY ?auto_3596 ?auto_3599 ) ( not ( = ?auto_3596 ?auto_3602 ) ) ( not ( = ?auto_3603 ?auto_3597 ) ) ( OBJ-AT ?auto_3597 ?auto_3602 ) ( not ( = ?auto_3603 ?auto_3598 ) ) ( not ( = ?auto_3597 ?auto_3598 ) ) ( IN-CITY ?auto_3601 ?auto_3599 ) ( not ( = ?auto_3596 ?auto_3601 ) ) ( not ( = ?auto_3602 ?auto_3601 ) ) ( OBJ-AT ?auto_3598 ?auto_3601 ) ( TRUCK-AT ?auto_3600 ?auto_3596 ) ( IN-TRUCK ?auto_3603 ?auto_3600 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3603 ?auto_3597 ?auto_3596 )
      ( DELIVER-2PKG-VERIFY ?auto_3597 ?auto_3598 ?auto_3596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3623 - OBJ
      ?auto_3624 - OBJ
      ?auto_3625 - OBJ
      ?auto_3622 - LOCATION
    )
    :vars
    (
      ?auto_3629 - LOCATION
      ?auto_3626 - CITY
      ?auto_3628 - LOCATION
      ?auto_3627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3629 ?auto_3626 ) ( IN-CITY ?auto_3622 ?auto_3626 ) ( not ( = ?auto_3622 ?auto_3629 ) ) ( not ( = ?auto_3623 ?auto_3625 ) ) ( OBJ-AT ?auto_3625 ?auto_3629 ) ( not ( = ?auto_3623 ?auto_3624 ) ) ( not ( = ?auto_3625 ?auto_3624 ) ) ( IN-CITY ?auto_3628 ?auto_3626 ) ( not ( = ?auto_3622 ?auto_3628 ) ) ( not ( = ?auto_3629 ?auto_3628 ) ) ( OBJ-AT ?auto_3624 ?auto_3628 ) ( TRUCK-AT ?auto_3627 ?auto_3622 ) ( IN-TRUCK ?auto_3623 ?auto_3627 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3623 ?auto_3625 ?auto_3622 )
      ( DELIVER-3PKG-VERIFY ?auto_3623 ?auto_3624 ?auto_3625 ?auto_3622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3640 - OBJ
      ?auto_3641 - OBJ
      ?auto_3642 - OBJ
      ?auto_3639 - LOCATION
    )
    :vars
    (
      ?auto_3646 - LOCATION
      ?auto_3643 - CITY
      ?auto_3645 - LOCATION
      ?auto_3644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3646 ?auto_3643 ) ( IN-CITY ?auto_3639 ?auto_3643 ) ( not ( = ?auto_3639 ?auto_3646 ) ) ( not ( = ?auto_3640 ?auto_3641 ) ) ( OBJ-AT ?auto_3641 ?auto_3646 ) ( not ( = ?auto_3640 ?auto_3642 ) ) ( not ( = ?auto_3641 ?auto_3642 ) ) ( IN-CITY ?auto_3645 ?auto_3643 ) ( not ( = ?auto_3639 ?auto_3645 ) ) ( not ( = ?auto_3646 ?auto_3645 ) ) ( OBJ-AT ?auto_3642 ?auto_3645 ) ( TRUCK-AT ?auto_3644 ?auto_3639 ) ( IN-TRUCK ?auto_3640 ?auto_3644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3640 ?auto_3641 ?auto_3639 )
      ( DELIVER-3PKG-VERIFY ?auto_3640 ?auto_3641 ?auto_3642 ?auto_3639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3657 - OBJ
      ?auto_3658 - OBJ
      ?auto_3659 - OBJ
      ?auto_3656 - LOCATION
    )
    :vars
    (
      ?auto_3663 - LOCATION
      ?auto_3660 - CITY
      ?auto_3662 - LOCATION
      ?auto_3661 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3663 ?auto_3660 ) ( IN-CITY ?auto_3656 ?auto_3660 ) ( not ( = ?auto_3656 ?auto_3663 ) ) ( not ( = ?auto_3658 ?auto_3659 ) ) ( OBJ-AT ?auto_3659 ?auto_3663 ) ( not ( = ?auto_3658 ?auto_3657 ) ) ( not ( = ?auto_3659 ?auto_3657 ) ) ( IN-CITY ?auto_3662 ?auto_3660 ) ( not ( = ?auto_3656 ?auto_3662 ) ) ( not ( = ?auto_3663 ?auto_3662 ) ) ( OBJ-AT ?auto_3657 ?auto_3662 ) ( TRUCK-AT ?auto_3661 ?auto_3656 ) ( IN-TRUCK ?auto_3658 ?auto_3661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3658 ?auto_3659 ?auto_3656 )
      ( DELIVER-3PKG-VERIFY ?auto_3657 ?auto_3658 ?auto_3659 ?auto_3656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3674 - OBJ
      ?auto_3675 - OBJ
      ?auto_3676 - OBJ
      ?auto_3673 - LOCATION
    )
    :vars
    (
      ?auto_3680 - LOCATION
      ?auto_3677 - CITY
      ?auto_3679 - LOCATION
      ?auto_3678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3680 ?auto_3677 ) ( IN-CITY ?auto_3673 ?auto_3677 ) ( not ( = ?auto_3673 ?auto_3680 ) ) ( not ( = ?auto_3676 ?auto_3675 ) ) ( OBJ-AT ?auto_3675 ?auto_3680 ) ( not ( = ?auto_3676 ?auto_3674 ) ) ( not ( = ?auto_3675 ?auto_3674 ) ) ( IN-CITY ?auto_3679 ?auto_3677 ) ( not ( = ?auto_3673 ?auto_3679 ) ) ( not ( = ?auto_3680 ?auto_3679 ) ) ( OBJ-AT ?auto_3674 ?auto_3679 ) ( TRUCK-AT ?auto_3678 ?auto_3673 ) ( IN-TRUCK ?auto_3676 ?auto_3678 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3676 ?auto_3675 ?auto_3673 )
      ( DELIVER-3PKG-VERIFY ?auto_3674 ?auto_3675 ?auto_3676 ?auto_3673 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3709 - OBJ
      ?auto_3710 - OBJ
      ?auto_3711 - OBJ
      ?auto_3708 - LOCATION
    )
    :vars
    (
      ?auto_3715 - LOCATION
      ?auto_3712 - CITY
      ?auto_3714 - LOCATION
      ?auto_3713 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3715 ?auto_3712 ) ( IN-CITY ?auto_3708 ?auto_3712 ) ( not ( = ?auto_3708 ?auto_3715 ) ) ( not ( = ?auto_3710 ?auto_3709 ) ) ( OBJ-AT ?auto_3709 ?auto_3715 ) ( not ( = ?auto_3710 ?auto_3711 ) ) ( not ( = ?auto_3709 ?auto_3711 ) ) ( IN-CITY ?auto_3714 ?auto_3712 ) ( not ( = ?auto_3708 ?auto_3714 ) ) ( not ( = ?auto_3715 ?auto_3714 ) ) ( OBJ-AT ?auto_3711 ?auto_3714 ) ( TRUCK-AT ?auto_3713 ?auto_3708 ) ( IN-TRUCK ?auto_3710 ?auto_3713 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3710 ?auto_3709 ?auto_3708 )
      ( DELIVER-3PKG-VERIFY ?auto_3709 ?auto_3710 ?auto_3711 ?auto_3708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3726 - OBJ
      ?auto_3727 - OBJ
      ?auto_3728 - OBJ
      ?auto_3725 - LOCATION
    )
    :vars
    (
      ?auto_3732 - LOCATION
      ?auto_3729 - CITY
      ?auto_3731 - LOCATION
      ?auto_3730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3732 ?auto_3729 ) ( IN-CITY ?auto_3725 ?auto_3729 ) ( not ( = ?auto_3725 ?auto_3732 ) ) ( not ( = ?auto_3728 ?auto_3726 ) ) ( OBJ-AT ?auto_3726 ?auto_3732 ) ( not ( = ?auto_3728 ?auto_3727 ) ) ( not ( = ?auto_3726 ?auto_3727 ) ) ( IN-CITY ?auto_3731 ?auto_3729 ) ( not ( = ?auto_3725 ?auto_3731 ) ) ( not ( = ?auto_3732 ?auto_3731 ) ) ( OBJ-AT ?auto_3727 ?auto_3731 ) ( TRUCK-AT ?auto_3730 ?auto_3725 ) ( IN-TRUCK ?auto_3728 ?auto_3730 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3728 ?auto_3726 ?auto_3725 )
      ( DELIVER-3PKG-VERIFY ?auto_3726 ?auto_3727 ?auto_3728 ?auto_3725 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3780 - OBJ
      ?auto_3779 - LOCATION
    )
    :vars
    (
      ?auto_3785 - LOCATION
      ?auto_3781 - CITY
      ?auto_3786 - OBJ
      ?auto_3782 - OBJ
      ?auto_3784 - LOCATION
      ?auto_3783 - TRUCK
      ?auto_3787 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3785 ?auto_3781 ) ( IN-CITY ?auto_3779 ?auto_3781 ) ( not ( = ?auto_3779 ?auto_3785 ) ) ( not ( = ?auto_3786 ?auto_3780 ) ) ( OBJ-AT ?auto_3780 ?auto_3785 ) ( not ( = ?auto_3786 ?auto_3782 ) ) ( not ( = ?auto_3780 ?auto_3782 ) ) ( IN-CITY ?auto_3784 ?auto_3781 ) ( not ( = ?auto_3779 ?auto_3784 ) ) ( not ( = ?auto_3785 ?auto_3784 ) ) ( OBJ-AT ?auto_3782 ?auto_3784 ) ( IN-TRUCK ?auto_3786 ?auto_3783 ) ( TRUCK-AT ?auto_3783 ?auto_3787 ) ( IN-CITY ?auto_3787 ?auto_3781 ) ( not ( = ?auto_3779 ?auto_3787 ) ) ( not ( = ?auto_3785 ?auto_3787 ) ) ( not ( = ?auto_3784 ?auto_3787 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3783 ?auto_3787 ?auto_3779 ?auto_3781 )
      ( DELIVER-2PKG ?auto_3786 ?auto_3780 ?auto_3779 )
      ( DELIVER-1PKG-VERIFY ?auto_3780 ?auto_3779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3789 - OBJ
      ?auto_3790 - OBJ
      ?auto_3788 - LOCATION
    )
    :vars
    (
      ?auto_3793 - LOCATION
      ?auto_3792 - CITY
      ?auto_3795 - OBJ
      ?auto_3796 - LOCATION
      ?auto_3791 - TRUCK
      ?auto_3794 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3793 ?auto_3792 ) ( IN-CITY ?auto_3788 ?auto_3792 ) ( not ( = ?auto_3788 ?auto_3793 ) ) ( not ( = ?auto_3789 ?auto_3790 ) ) ( OBJ-AT ?auto_3790 ?auto_3793 ) ( not ( = ?auto_3789 ?auto_3795 ) ) ( not ( = ?auto_3790 ?auto_3795 ) ) ( IN-CITY ?auto_3796 ?auto_3792 ) ( not ( = ?auto_3788 ?auto_3796 ) ) ( not ( = ?auto_3793 ?auto_3796 ) ) ( OBJ-AT ?auto_3795 ?auto_3796 ) ( IN-TRUCK ?auto_3789 ?auto_3791 ) ( TRUCK-AT ?auto_3791 ?auto_3794 ) ( IN-CITY ?auto_3794 ?auto_3792 ) ( not ( = ?auto_3788 ?auto_3794 ) ) ( not ( = ?auto_3793 ?auto_3794 ) ) ( not ( = ?auto_3796 ?auto_3794 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3790 ?auto_3788 )
      ( DELIVER-2PKG-VERIFY ?auto_3789 ?auto_3790 ?auto_3788 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3798 - OBJ
      ?auto_3799 - OBJ
      ?auto_3797 - LOCATION
    )
    :vars
    (
      ?auto_3804 - LOCATION
      ?auto_3802 - CITY
      ?auto_3805 - OBJ
      ?auto_3803 - LOCATION
      ?auto_3801 - TRUCK
      ?auto_3800 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3804 ?auto_3802 ) ( IN-CITY ?auto_3797 ?auto_3802 ) ( not ( = ?auto_3797 ?auto_3804 ) ) ( not ( = ?auto_3805 ?auto_3799 ) ) ( OBJ-AT ?auto_3799 ?auto_3804 ) ( not ( = ?auto_3805 ?auto_3798 ) ) ( not ( = ?auto_3799 ?auto_3798 ) ) ( IN-CITY ?auto_3803 ?auto_3802 ) ( not ( = ?auto_3797 ?auto_3803 ) ) ( not ( = ?auto_3804 ?auto_3803 ) ) ( OBJ-AT ?auto_3798 ?auto_3803 ) ( IN-TRUCK ?auto_3805 ?auto_3801 ) ( TRUCK-AT ?auto_3801 ?auto_3800 ) ( IN-CITY ?auto_3800 ?auto_3802 ) ( not ( = ?auto_3797 ?auto_3800 ) ) ( not ( = ?auto_3804 ?auto_3800 ) ) ( not ( = ?auto_3803 ?auto_3800 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3805 ?auto_3799 ?auto_3797 )
      ( DELIVER-2PKG-VERIFY ?auto_3798 ?auto_3799 ?auto_3797 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3807 - OBJ
      ?auto_3808 - OBJ
      ?auto_3806 - LOCATION
    )
    :vars
    (
      ?auto_3814 - LOCATION
      ?auto_3811 - CITY
      ?auto_3813 - OBJ
      ?auto_3812 - LOCATION
      ?auto_3810 - TRUCK
      ?auto_3809 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3814 ?auto_3811 ) ( IN-CITY ?auto_3806 ?auto_3811 ) ( not ( = ?auto_3806 ?auto_3814 ) ) ( not ( = ?auto_3808 ?auto_3807 ) ) ( OBJ-AT ?auto_3807 ?auto_3814 ) ( not ( = ?auto_3808 ?auto_3813 ) ) ( not ( = ?auto_3807 ?auto_3813 ) ) ( IN-CITY ?auto_3812 ?auto_3811 ) ( not ( = ?auto_3806 ?auto_3812 ) ) ( not ( = ?auto_3814 ?auto_3812 ) ) ( OBJ-AT ?auto_3813 ?auto_3812 ) ( IN-TRUCK ?auto_3808 ?auto_3810 ) ( TRUCK-AT ?auto_3810 ?auto_3809 ) ( IN-CITY ?auto_3809 ?auto_3811 ) ( not ( = ?auto_3806 ?auto_3809 ) ) ( not ( = ?auto_3814 ?auto_3809 ) ) ( not ( = ?auto_3812 ?auto_3809 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3808 ?auto_3807 ?auto_3806 )
      ( DELIVER-2PKG-VERIFY ?auto_3807 ?auto_3808 ?auto_3806 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3816 - OBJ
      ?auto_3817 - OBJ
      ?auto_3815 - LOCATION
    )
    :vars
    (
      ?auto_3822 - LOCATION
      ?auto_3820 - CITY
      ?auto_3823 - OBJ
      ?auto_3821 - LOCATION
      ?auto_3819 - TRUCK
      ?auto_3818 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3822 ?auto_3820 ) ( IN-CITY ?auto_3815 ?auto_3820 ) ( not ( = ?auto_3815 ?auto_3822 ) ) ( not ( = ?auto_3823 ?auto_3816 ) ) ( OBJ-AT ?auto_3816 ?auto_3822 ) ( not ( = ?auto_3823 ?auto_3817 ) ) ( not ( = ?auto_3816 ?auto_3817 ) ) ( IN-CITY ?auto_3821 ?auto_3820 ) ( not ( = ?auto_3815 ?auto_3821 ) ) ( not ( = ?auto_3822 ?auto_3821 ) ) ( OBJ-AT ?auto_3817 ?auto_3821 ) ( IN-TRUCK ?auto_3823 ?auto_3819 ) ( TRUCK-AT ?auto_3819 ?auto_3818 ) ( IN-CITY ?auto_3818 ?auto_3820 ) ( not ( = ?auto_3815 ?auto_3818 ) ) ( not ( = ?auto_3822 ?auto_3818 ) ) ( not ( = ?auto_3821 ?auto_3818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3823 ?auto_3816 ?auto_3815 )
      ( DELIVER-2PKG-VERIFY ?auto_3816 ?auto_3817 ?auto_3815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3845 - OBJ
      ?auto_3846 - OBJ
      ?auto_3847 - OBJ
      ?auto_3844 - LOCATION
    )
    :vars
    (
      ?auto_3852 - LOCATION
      ?auto_3850 - CITY
      ?auto_3851 - LOCATION
      ?auto_3849 - TRUCK
      ?auto_3848 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3852 ?auto_3850 ) ( IN-CITY ?auto_3844 ?auto_3850 ) ( not ( = ?auto_3844 ?auto_3852 ) ) ( not ( = ?auto_3845 ?auto_3847 ) ) ( OBJ-AT ?auto_3847 ?auto_3852 ) ( not ( = ?auto_3845 ?auto_3846 ) ) ( not ( = ?auto_3847 ?auto_3846 ) ) ( IN-CITY ?auto_3851 ?auto_3850 ) ( not ( = ?auto_3844 ?auto_3851 ) ) ( not ( = ?auto_3852 ?auto_3851 ) ) ( OBJ-AT ?auto_3846 ?auto_3851 ) ( IN-TRUCK ?auto_3845 ?auto_3849 ) ( TRUCK-AT ?auto_3849 ?auto_3848 ) ( IN-CITY ?auto_3848 ?auto_3850 ) ( not ( = ?auto_3844 ?auto_3848 ) ) ( not ( = ?auto_3852 ?auto_3848 ) ) ( not ( = ?auto_3851 ?auto_3848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3845 ?auto_3847 ?auto_3844 )
      ( DELIVER-3PKG-VERIFY ?auto_3845 ?auto_3846 ?auto_3847 ?auto_3844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3864 - OBJ
      ?auto_3865 - OBJ
      ?auto_3866 - OBJ
      ?auto_3863 - LOCATION
    )
    :vars
    (
      ?auto_3871 - LOCATION
      ?auto_3869 - CITY
      ?auto_3870 - LOCATION
      ?auto_3868 - TRUCK
      ?auto_3867 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3871 ?auto_3869 ) ( IN-CITY ?auto_3863 ?auto_3869 ) ( not ( = ?auto_3863 ?auto_3871 ) ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( OBJ-AT ?auto_3865 ?auto_3871 ) ( not ( = ?auto_3864 ?auto_3866 ) ) ( not ( = ?auto_3865 ?auto_3866 ) ) ( IN-CITY ?auto_3870 ?auto_3869 ) ( not ( = ?auto_3863 ?auto_3870 ) ) ( not ( = ?auto_3871 ?auto_3870 ) ) ( OBJ-AT ?auto_3866 ?auto_3870 ) ( IN-TRUCK ?auto_3864 ?auto_3868 ) ( TRUCK-AT ?auto_3868 ?auto_3867 ) ( IN-CITY ?auto_3867 ?auto_3869 ) ( not ( = ?auto_3863 ?auto_3867 ) ) ( not ( = ?auto_3871 ?auto_3867 ) ) ( not ( = ?auto_3870 ?auto_3867 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3864 ?auto_3865 ?auto_3863 )
      ( DELIVER-3PKG-VERIFY ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3863 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3883 - OBJ
      ?auto_3884 - OBJ
      ?auto_3885 - OBJ
      ?auto_3882 - LOCATION
    )
    :vars
    (
      ?auto_3890 - LOCATION
      ?auto_3888 - CITY
      ?auto_3889 - LOCATION
      ?auto_3887 - TRUCK
      ?auto_3886 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3890 ?auto_3888 ) ( IN-CITY ?auto_3882 ?auto_3888 ) ( not ( = ?auto_3882 ?auto_3890 ) ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( OBJ-AT ?auto_3885 ?auto_3890 ) ( not ( = ?auto_3884 ?auto_3883 ) ) ( not ( = ?auto_3885 ?auto_3883 ) ) ( IN-CITY ?auto_3889 ?auto_3888 ) ( not ( = ?auto_3882 ?auto_3889 ) ) ( not ( = ?auto_3890 ?auto_3889 ) ) ( OBJ-AT ?auto_3883 ?auto_3889 ) ( IN-TRUCK ?auto_3884 ?auto_3887 ) ( TRUCK-AT ?auto_3887 ?auto_3886 ) ( IN-CITY ?auto_3886 ?auto_3888 ) ( not ( = ?auto_3882 ?auto_3886 ) ) ( not ( = ?auto_3890 ?auto_3886 ) ) ( not ( = ?auto_3889 ?auto_3886 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3884 ?auto_3885 ?auto_3882 )
      ( DELIVER-3PKG-VERIFY ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3902 - OBJ
      ?auto_3903 - OBJ
      ?auto_3904 - OBJ
      ?auto_3901 - LOCATION
    )
    :vars
    (
      ?auto_3909 - LOCATION
      ?auto_3907 - CITY
      ?auto_3908 - LOCATION
      ?auto_3906 - TRUCK
      ?auto_3905 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3909 ?auto_3907 ) ( IN-CITY ?auto_3901 ?auto_3907 ) ( not ( = ?auto_3901 ?auto_3909 ) ) ( not ( = ?auto_3904 ?auto_3903 ) ) ( OBJ-AT ?auto_3903 ?auto_3909 ) ( not ( = ?auto_3904 ?auto_3902 ) ) ( not ( = ?auto_3903 ?auto_3902 ) ) ( IN-CITY ?auto_3908 ?auto_3907 ) ( not ( = ?auto_3901 ?auto_3908 ) ) ( not ( = ?auto_3909 ?auto_3908 ) ) ( OBJ-AT ?auto_3902 ?auto_3908 ) ( IN-TRUCK ?auto_3904 ?auto_3906 ) ( TRUCK-AT ?auto_3906 ?auto_3905 ) ( IN-CITY ?auto_3905 ?auto_3907 ) ( not ( = ?auto_3901 ?auto_3905 ) ) ( not ( = ?auto_3909 ?auto_3905 ) ) ( not ( = ?auto_3908 ?auto_3905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3904 ?auto_3903 ?auto_3901 )
      ( DELIVER-3PKG-VERIFY ?auto_3902 ?auto_3903 ?auto_3904 ?auto_3901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3941 - OBJ
      ?auto_3942 - OBJ
      ?auto_3943 - OBJ
      ?auto_3940 - LOCATION
    )
    :vars
    (
      ?auto_3948 - LOCATION
      ?auto_3946 - CITY
      ?auto_3947 - LOCATION
      ?auto_3945 - TRUCK
      ?auto_3944 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3948 ?auto_3946 ) ( IN-CITY ?auto_3940 ?auto_3946 ) ( not ( = ?auto_3940 ?auto_3948 ) ) ( not ( = ?auto_3942 ?auto_3941 ) ) ( OBJ-AT ?auto_3941 ?auto_3948 ) ( not ( = ?auto_3942 ?auto_3943 ) ) ( not ( = ?auto_3941 ?auto_3943 ) ) ( IN-CITY ?auto_3947 ?auto_3946 ) ( not ( = ?auto_3940 ?auto_3947 ) ) ( not ( = ?auto_3948 ?auto_3947 ) ) ( OBJ-AT ?auto_3943 ?auto_3947 ) ( IN-TRUCK ?auto_3942 ?auto_3945 ) ( TRUCK-AT ?auto_3945 ?auto_3944 ) ( IN-CITY ?auto_3944 ?auto_3946 ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( not ( = ?auto_3948 ?auto_3944 ) ) ( not ( = ?auto_3947 ?auto_3944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3942 ?auto_3941 ?auto_3940 )
      ( DELIVER-3PKG-VERIFY ?auto_3941 ?auto_3942 ?auto_3943 ?auto_3940 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3960 - OBJ
      ?auto_3961 - OBJ
      ?auto_3962 - OBJ
      ?auto_3959 - LOCATION
    )
    :vars
    (
      ?auto_3967 - LOCATION
      ?auto_3965 - CITY
      ?auto_3966 - LOCATION
      ?auto_3964 - TRUCK
      ?auto_3963 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3967 ?auto_3965 ) ( IN-CITY ?auto_3959 ?auto_3965 ) ( not ( = ?auto_3959 ?auto_3967 ) ) ( not ( = ?auto_3962 ?auto_3960 ) ) ( OBJ-AT ?auto_3960 ?auto_3967 ) ( not ( = ?auto_3962 ?auto_3961 ) ) ( not ( = ?auto_3960 ?auto_3961 ) ) ( IN-CITY ?auto_3966 ?auto_3965 ) ( not ( = ?auto_3959 ?auto_3966 ) ) ( not ( = ?auto_3967 ?auto_3966 ) ) ( OBJ-AT ?auto_3961 ?auto_3966 ) ( IN-TRUCK ?auto_3962 ?auto_3964 ) ( TRUCK-AT ?auto_3964 ?auto_3963 ) ( IN-CITY ?auto_3963 ?auto_3965 ) ( not ( = ?auto_3959 ?auto_3963 ) ) ( not ( = ?auto_3967 ?auto_3963 ) ) ( not ( = ?auto_3966 ?auto_3963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3962 ?auto_3960 ?auto_3959 )
      ( DELIVER-3PKG-VERIFY ?auto_3960 ?auto_3961 ?auto_3962 ?auto_3959 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4020 - OBJ
      ?auto_4019 - LOCATION
    )
    :vars
    (
      ?auto_4026 - LOCATION
      ?auto_4023 - CITY
      ?auto_4027 - OBJ
      ?auto_4025 - OBJ
      ?auto_4024 - LOCATION
      ?auto_4022 - TRUCK
      ?auto_4021 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4026 ?auto_4023 ) ( IN-CITY ?auto_4019 ?auto_4023 ) ( not ( = ?auto_4019 ?auto_4026 ) ) ( not ( = ?auto_4027 ?auto_4020 ) ) ( OBJ-AT ?auto_4020 ?auto_4026 ) ( not ( = ?auto_4027 ?auto_4025 ) ) ( not ( = ?auto_4020 ?auto_4025 ) ) ( IN-CITY ?auto_4024 ?auto_4023 ) ( not ( = ?auto_4019 ?auto_4024 ) ) ( not ( = ?auto_4026 ?auto_4024 ) ) ( OBJ-AT ?auto_4025 ?auto_4024 ) ( TRUCK-AT ?auto_4022 ?auto_4021 ) ( IN-CITY ?auto_4021 ?auto_4023 ) ( not ( = ?auto_4019 ?auto_4021 ) ) ( not ( = ?auto_4026 ?auto_4021 ) ) ( not ( = ?auto_4024 ?auto_4021 ) ) ( OBJ-AT ?auto_4027 ?auto_4021 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4027 ?auto_4022 ?auto_4021 )
      ( DELIVER-2PKG ?auto_4027 ?auto_4020 ?auto_4019 )
      ( DELIVER-1PKG-VERIFY ?auto_4020 ?auto_4019 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4029 - OBJ
      ?auto_4030 - OBJ
      ?auto_4028 - LOCATION
    )
    :vars
    (
      ?auto_4031 - LOCATION
      ?auto_4034 - CITY
      ?auto_4035 - OBJ
      ?auto_4036 - LOCATION
      ?auto_4032 - TRUCK
      ?auto_4033 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4031 ?auto_4034 ) ( IN-CITY ?auto_4028 ?auto_4034 ) ( not ( = ?auto_4028 ?auto_4031 ) ) ( not ( = ?auto_4029 ?auto_4030 ) ) ( OBJ-AT ?auto_4030 ?auto_4031 ) ( not ( = ?auto_4029 ?auto_4035 ) ) ( not ( = ?auto_4030 ?auto_4035 ) ) ( IN-CITY ?auto_4036 ?auto_4034 ) ( not ( = ?auto_4028 ?auto_4036 ) ) ( not ( = ?auto_4031 ?auto_4036 ) ) ( OBJ-AT ?auto_4035 ?auto_4036 ) ( TRUCK-AT ?auto_4032 ?auto_4033 ) ( IN-CITY ?auto_4033 ?auto_4034 ) ( not ( = ?auto_4028 ?auto_4033 ) ) ( not ( = ?auto_4031 ?auto_4033 ) ) ( not ( = ?auto_4036 ?auto_4033 ) ) ( OBJ-AT ?auto_4029 ?auto_4033 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4030 ?auto_4028 )
      ( DELIVER-2PKG-VERIFY ?auto_4029 ?auto_4030 ?auto_4028 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4038 - OBJ
      ?auto_4039 - OBJ
      ?auto_4037 - LOCATION
    )
    :vars
    (
      ?auto_4044 - LOCATION
      ?auto_4043 - CITY
      ?auto_4045 - OBJ
      ?auto_4042 - LOCATION
      ?auto_4040 - TRUCK
      ?auto_4041 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4044 ?auto_4043 ) ( IN-CITY ?auto_4037 ?auto_4043 ) ( not ( = ?auto_4037 ?auto_4044 ) ) ( not ( = ?auto_4045 ?auto_4039 ) ) ( OBJ-AT ?auto_4039 ?auto_4044 ) ( not ( = ?auto_4045 ?auto_4038 ) ) ( not ( = ?auto_4039 ?auto_4038 ) ) ( IN-CITY ?auto_4042 ?auto_4043 ) ( not ( = ?auto_4037 ?auto_4042 ) ) ( not ( = ?auto_4044 ?auto_4042 ) ) ( OBJ-AT ?auto_4038 ?auto_4042 ) ( TRUCK-AT ?auto_4040 ?auto_4041 ) ( IN-CITY ?auto_4041 ?auto_4043 ) ( not ( = ?auto_4037 ?auto_4041 ) ) ( not ( = ?auto_4044 ?auto_4041 ) ) ( not ( = ?auto_4042 ?auto_4041 ) ) ( OBJ-AT ?auto_4045 ?auto_4041 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4045 ?auto_4039 ?auto_4037 )
      ( DELIVER-2PKG-VERIFY ?auto_4038 ?auto_4039 ?auto_4037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4047 - OBJ
      ?auto_4048 - OBJ
      ?auto_4046 - LOCATION
    )
    :vars
    (
      ?auto_4054 - LOCATION
      ?auto_4053 - CITY
      ?auto_4049 - OBJ
      ?auto_4052 - LOCATION
      ?auto_4050 - TRUCK
      ?auto_4051 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4054 ?auto_4053 ) ( IN-CITY ?auto_4046 ?auto_4053 ) ( not ( = ?auto_4046 ?auto_4054 ) ) ( not ( = ?auto_4048 ?auto_4047 ) ) ( OBJ-AT ?auto_4047 ?auto_4054 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( IN-CITY ?auto_4052 ?auto_4053 ) ( not ( = ?auto_4046 ?auto_4052 ) ) ( not ( = ?auto_4054 ?auto_4052 ) ) ( OBJ-AT ?auto_4049 ?auto_4052 ) ( TRUCK-AT ?auto_4050 ?auto_4051 ) ( IN-CITY ?auto_4051 ?auto_4053 ) ( not ( = ?auto_4046 ?auto_4051 ) ) ( not ( = ?auto_4054 ?auto_4051 ) ) ( not ( = ?auto_4052 ?auto_4051 ) ) ( OBJ-AT ?auto_4048 ?auto_4051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4048 ?auto_4047 ?auto_4046 )
      ( DELIVER-2PKG-VERIFY ?auto_4047 ?auto_4048 ?auto_4046 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4056 - OBJ
      ?auto_4057 - OBJ
      ?auto_4055 - LOCATION
    )
    :vars
    (
      ?auto_4062 - LOCATION
      ?auto_4061 - CITY
      ?auto_4063 - OBJ
      ?auto_4060 - LOCATION
      ?auto_4058 - TRUCK
      ?auto_4059 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4062 ?auto_4061 ) ( IN-CITY ?auto_4055 ?auto_4061 ) ( not ( = ?auto_4055 ?auto_4062 ) ) ( not ( = ?auto_4063 ?auto_4056 ) ) ( OBJ-AT ?auto_4056 ?auto_4062 ) ( not ( = ?auto_4063 ?auto_4057 ) ) ( not ( = ?auto_4056 ?auto_4057 ) ) ( IN-CITY ?auto_4060 ?auto_4061 ) ( not ( = ?auto_4055 ?auto_4060 ) ) ( not ( = ?auto_4062 ?auto_4060 ) ) ( OBJ-AT ?auto_4057 ?auto_4060 ) ( TRUCK-AT ?auto_4058 ?auto_4059 ) ( IN-CITY ?auto_4059 ?auto_4061 ) ( not ( = ?auto_4055 ?auto_4059 ) ) ( not ( = ?auto_4062 ?auto_4059 ) ) ( not ( = ?auto_4060 ?auto_4059 ) ) ( OBJ-AT ?auto_4063 ?auto_4059 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4063 ?auto_4056 ?auto_4055 )
      ( DELIVER-2PKG-VERIFY ?auto_4056 ?auto_4057 ?auto_4055 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4085 - OBJ
      ?auto_4086 - OBJ
      ?auto_4087 - OBJ
      ?auto_4084 - LOCATION
    )
    :vars
    (
      ?auto_4092 - LOCATION
      ?auto_4091 - CITY
      ?auto_4090 - LOCATION
      ?auto_4088 - TRUCK
      ?auto_4089 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4092 ?auto_4091 ) ( IN-CITY ?auto_4084 ?auto_4091 ) ( not ( = ?auto_4084 ?auto_4092 ) ) ( not ( = ?auto_4085 ?auto_4087 ) ) ( OBJ-AT ?auto_4087 ?auto_4092 ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( not ( = ?auto_4087 ?auto_4086 ) ) ( IN-CITY ?auto_4090 ?auto_4091 ) ( not ( = ?auto_4084 ?auto_4090 ) ) ( not ( = ?auto_4092 ?auto_4090 ) ) ( OBJ-AT ?auto_4086 ?auto_4090 ) ( TRUCK-AT ?auto_4088 ?auto_4089 ) ( IN-CITY ?auto_4089 ?auto_4091 ) ( not ( = ?auto_4084 ?auto_4089 ) ) ( not ( = ?auto_4092 ?auto_4089 ) ) ( not ( = ?auto_4090 ?auto_4089 ) ) ( OBJ-AT ?auto_4085 ?auto_4089 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4085 ?auto_4087 ?auto_4084 )
      ( DELIVER-3PKG-VERIFY ?auto_4085 ?auto_4086 ?auto_4087 ?auto_4084 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4104 - OBJ
      ?auto_4105 - OBJ
      ?auto_4106 - OBJ
      ?auto_4103 - LOCATION
    )
    :vars
    (
      ?auto_4111 - LOCATION
      ?auto_4110 - CITY
      ?auto_4109 - LOCATION
      ?auto_4107 - TRUCK
      ?auto_4108 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4111 ?auto_4110 ) ( IN-CITY ?auto_4103 ?auto_4110 ) ( not ( = ?auto_4103 ?auto_4111 ) ) ( not ( = ?auto_4104 ?auto_4105 ) ) ( OBJ-AT ?auto_4105 ?auto_4111 ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( not ( = ?auto_4105 ?auto_4106 ) ) ( IN-CITY ?auto_4109 ?auto_4110 ) ( not ( = ?auto_4103 ?auto_4109 ) ) ( not ( = ?auto_4111 ?auto_4109 ) ) ( OBJ-AT ?auto_4106 ?auto_4109 ) ( TRUCK-AT ?auto_4107 ?auto_4108 ) ( IN-CITY ?auto_4108 ?auto_4110 ) ( not ( = ?auto_4103 ?auto_4108 ) ) ( not ( = ?auto_4111 ?auto_4108 ) ) ( not ( = ?auto_4109 ?auto_4108 ) ) ( OBJ-AT ?auto_4104 ?auto_4108 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4104 ?auto_4105 ?auto_4103 )
      ( DELIVER-3PKG-VERIFY ?auto_4104 ?auto_4105 ?auto_4106 ?auto_4103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4123 - OBJ
      ?auto_4124 - OBJ
      ?auto_4125 - OBJ
      ?auto_4122 - LOCATION
    )
    :vars
    (
      ?auto_4130 - LOCATION
      ?auto_4129 - CITY
      ?auto_4128 - LOCATION
      ?auto_4126 - TRUCK
      ?auto_4127 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4130 ?auto_4129 ) ( IN-CITY ?auto_4122 ?auto_4129 ) ( not ( = ?auto_4122 ?auto_4130 ) ) ( not ( = ?auto_4124 ?auto_4125 ) ) ( OBJ-AT ?auto_4125 ?auto_4130 ) ( not ( = ?auto_4124 ?auto_4123 ) ) ( not ( = ?auto_4125 ?auto_4123 ) ) ( IN-CITY ?auto_4128 ?auto_4129 ) ( not ( = ?auto_4122 ?auto_4128 ) ) ( not ( = ?auto_4130 ?auto_4128 ) ) ( OBJ-AT ?auto_4123 ?auto_4128 ) ( TRUCK-AT ?auto_4126 ?auto_4127 ) ( IN-CITY ?auto_4127 ?auto_4129 ) ( not ( = ?auto_4122 ?auto_4127 ) ) ( not ( = ?auto_4130 ?auto_4127 ) ) ( not ( = ?auto_4128 ?auto_4127 ) ) ( OBJ-AT ?auto_4124 ?auto_4127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4124 ?auto_4125 ?auto_4122 )
      ( DELIVER-3PKG-VERIFY ?auto_4123 ?auto_4124 ?auto_4125 ?auto_4122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4142 - OBJ
      ?auto_4143 - OBJ
      ?auto_4144 - OBJ
      ?auto_4141 - LOCATION
    )
    :vars
    (
      ?auto_4149 - LOCATION
      ?auto_4148 - CITY
      ?auto_4147 - LOCATION
      ?auto_4145 - TRUCK
      ?auto_4146 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4149 ?auto_4148 ) ( IN-CITY ?auto_4141 ?auto_4148 ) ( not ( = ?auto_4141 ?auto_4149 ) ) ( not ( = ?auto_4144 ?auto_4143 ) ) ( OBJ-AT ?auto_4143 ?auto_4149 ) ( not ( = ?auto_4144 ?auto_4142 ) ) ( not ( = ?auto_4143 ?auto_4142 ) ) ( IN-CITY ?auto_4147 ?auto_4148 ) ( not ( = ?auto_4141 ?auto_4147 ) ) ( not ( = ?auto_4149 ?auto_4147 ) ) ( OBJ-AT ?auto_4142 ?auto_4147 ) ( TRUCK-AT ?auto_4145 ?auto_4146 ) ( IN-CITY ?auto_4146 ?auto_4148 ) ( not ( = ?auto_4141 ?auto_4146 ) ) ( not ( = ?auto_4149 ?auto_4146 ) ) ( not ( = ?auto_4147 ?auto_4146 ) ) ( OBJ-AT ?auto_4144 ?auto_4146 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4144 ?auto_4143 ?auto_4141 )
      ( DELIVER-3PKG-VERIFY ?auto_4142 ?auto_4143 ?auto_4144 ?auto_4141 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4181 - OBJ
      ?auto_4182 - OBJ
      ?auto_4183 - OBJ
      ?auto_4180 - LOCATION
    )
    :vars
    (
      ?auto_4188 - LOCATION
      ?auto_4187 - CITY
      ?auto_4186 - LOCATION
      ?auto_4184 - TRUCK
      ?auto_4185 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4188 ?auto_4187 ) ( IN-CITY ?auto_4180 ?auto_4187 ) ( not ( = ?auto_4180 ?auto_4188 ) ) ( not ( = ?auto_4182 ?auto_4181 ) ) ( OBJ-AT ?auto_4181 ?auto_4188 ) ( not ( = ?auto_4182 ?auto_4183 ) ) ( not ( = ?auto_4181 ?auto_4183 ) ) ( IN-CITY ?auto_4186 ?auto_4187 ) ( not ( = ?auto_4180 ?auto_4186 ) ) ( not ( = ?auto_4188 ?auto_4186 ) ) ( OBJ-AT ?auto_4183 ?auto_4186 ) ( TRUCK-AT ?auto_4184 ?auto_4185 ) ( IN-CITY ?auto_4185 ?auto_4187 ) ( not ( = ?auto_4180 ?auto_4185 ) ) ( not ( = ?auto_4188 ?auto_4185 ) ) ( not ( = ?auto_4186 ?auto_4185 ) ) ( OBJ-AT ?auto_4182 ?auto_4185 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4182 ?auto_4181 ?auto_4180 )
      ( DELIVER-3PKG-VERIFY ?auto_4181 ?auto_4182 ?auto_4183 ?auto_4180 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4200 - OBJ
      ?auto_4201 - OBJ
      ?auto_4202 - OBJ
      ?auto_4199 - LOCATION
    )
    :vars
    (
      ?auto_4207 - LOCATION
      ?auto_4206 - CITY
      ?auto_4205 - LOCATION
      ?auto_4203 - TRUCK
      ?auto_4204 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4207 ?auto_4206 ) ( IN-CITY ?auto_4199 ?auto_4206 ) ( not ( = ?auto_4199 ?auto_4207 ) ) ( not ( = ?auto_4202 ?auto_4200 ) ) ( OBJ-AT ?auto_4200 ?auto_4207 ) ( not ( = ?auto_4202 ?auto_4201 ) ) ( not ( = ?auto_4200 ?auto_4201 ) ) ( IN-CITY ?auto_4205 ?auto_4206 ) ( not ( = ?auto_4199 ?auto_4205 ) ) ( not ( = ?auto_4207 ?auto_4205 ) ) ( OBJ-AT ?auto_4201 ?auto_4205 ) ( TRUCK-AT ?auto_4203 ?auto_4204 ) ( IN-CITY ?auto_4204 ?auto_4206 ) ( not ( = ?auto_4199 ?auto_4204 ) ) ( not ( = ?auto_4207 ?auto_4204 ) ) ( not ( = ?auto_4205 ?auto_4204 ) ) ( OBJ-AT ?auto_4202 ?auto_4204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4202 ?auto_4200 ?auto_4199 )
      ( DELIVER-3PKG-VERIFY ?auto_4200 ?auto_4201 ?auto_4202 ?auto_4199 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4260 - OBJ
      ?auto_4259 - LOCATION
    )
    :vars
    (
      ?auto_4266 - LOCATION
      ?auto_4265 - CITY
      ?auto_4267 - OBJ
      ?auto_4261 - OBJ
      ?auto_4264 - LOCATION
      ?auto_4263 - LOCATION
      ?auto_4262 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4266 ?auto_4265 ) ( IN-CITY ?auto_4259 ?auto_4265 ) ( not ( = ?auto_4259 ?auto_4266 ) ) ( not ( = ?auto_4267 ?auto_4260 ) ) ( OBJ-AT ?auto_4260 ?auto_4266 ) ( not ( = ?auto_4267 ?auto_4261 ) ) ( not ( = ?auto_4260 ?auto_4261 ) ) ( IN-CITY ?auto_4264 ?auto_4265 ) ( not ( = ?auto_4259 ?auto_4264 ) ) ( not ( = ?auto_4266 ?auto_4264 ) ) ( OBJ-AT ?auto_4261 ?auto_4264 ) ( IN-CITY ?auto_4263 ?auto_4265 ) ( not ( = ?auto_4259 ?auto_4263 ) ) ( not ( = ?auto_4266 ?auto_4263 ) ) ( not ( = ?auto_4264 ?auto_4263 ) ) ( OBJ-AT ?auto_4267 ?auto_4263 ) ( TRUCK-AT ?auto_4262 ?auto_4259 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4262 ?auto_4259 ?auto_4263 ?auto_4265 )
      ( DELIVER-2PKG ?auto_4267 ?auto_4260 ?auto_4259 )
      ( DELIVER-1PKG-VERIFY ?auto_4260 ?auto_4259 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4269 - OBJ
      ?auto_4270 - OBJ
      ?auto_4268 - LOCATION
    )
    :vars
    (
      ?auto_4275 - LOCATION
      ?auto_4272 - CITY
      ?auto_4273 - OBJ
      ?auto_4276 - LOCATION
      ?auto_4271 - LOCATION
      ?auto_4274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4275 ?auto_4272 ) ( IN-CITY ?auto_4268 ?auto_4272 ) ( not ( = ?auto_4268 ?auto_4275 ) ) ( not ( = ?auto_4269 ?auto_4270 ) ) ( OBJ-AT ?auto_4270 ?auto_4275 ) ( not ( = ?auto_4269 ?auto_4273 ) ) ( not ( = ?auto_4270 ?auto_4273 ) ) ( IN-CITY ?auto_4276 ?auto_4272 ) ( not ( = ?auto_4268 ?auto_4276 ) ) ( not ( = ?auto_4275 ?auto_4276 ) ) ( OBJ-AT ?auto_4273 ?auto_4276 ) ( IN-CITY ?auto_4271 ?auto_4272 ) ( not ( = ?auto_4268 ?auto_4271 ) ) ( not ( = ?auto_4275 ?auto_4271 ) ) ( not ( = ?auto_4276 ?auto_4271 ) ) ( OBJ-AT ?auto_4269 ?auto_4271 ) ( TRUCK-AT ?auto_4274 ?auto_4268 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4270 ?auto_4268 )
      ( DELIVER-2PKG-VERIFY ?auto_4269 ?auto_4270 ?auto_4268 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4278 - OBJ
      ?auto_4279 - OBJ
      ?auto_4277 - LOCATION
    )
    :vars
    (
      ?auto_4283 - LOCATION
      ?auto_4284 - CITY
      ?auto_4285 - OBJ
      ?auto_4281 - LOCATION
      ?auto_4282 - LOCATION
      ?auto_4280 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4283 ?auto_4284 ) ( IN-CITY ?auto_4277 ?auto_4284 ) ( not ( = ?auto_4277 ?auto_4283 ) ) ( not ( = ?auto_4285 ?auto_4279 ) ) ( OBJ-AT ?auto_4279 ?auto_4283 ) ( not ( = ?auto_4285 ?auto_4278 ) ) ( not ( = ?auto_4279 ?auto_4278 ) ) ( IN-CITY ?auto_4281 ?auto_4284 ) ( not ( = ?auto_4277 ?auto_4281 ) ) ( not ( = ?auto_4283 ?auto_4281 ) ) ( OBJ-AT ?auto_4278 ?auto_4281 ) ( IN-CITY ?auto_4282 ?auto_4284 ) ( not ( = ?auto_4277 ?auto_4282 ) ) ( not ( = ?auto_4283 ?auto_4282 ) ) ( not ( = ?auto_4281 ?auto_4282 ) ) ( OBJ-AT ?auto_4285 ?auto_4282 ) ( TRUCK-AT ?auto_4280 ?auto_4277 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4285 ?auto_4279 ?auto_4277 )
      ( DELIVER-2PKG-VERIFY ?auto_4278 ?auto_4279 ?auto_4277 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4287 - OBJ
      ?auto_4288 - OBJ
      ?auto_4286 - LOCATION
    )
    :vars
    (
      ?auto_4293 - LOCATION
      ?auto_4294 - CITY
      ?auto_4292 - OBJ
      ?auto_4290 - LOCATION
      ?auto_4291 - LOCATION
      ?auto_4289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4293 ?auto_4294 ) ( IN-CITY ?auto_4286 ?auto_4294 ) ( not ( = ?auto_4286 ?auto_4293 ) ) ( not ( = ?auto_4288 ?auto_4287 ) ) ( OBJ-AT ?auto_4287 ?auto_4293 ) ( not ( = ?auto_4288 ?auto_4292 ) ) ( not ( = ?auto_4287 ?auto_4292 ) ) ( IN-CITY ?auto_4290 ?auto_4294 ) ( not ( = ?auto_4286 ?auto_4290 ) ) ( not ( = ?auto_4293 ?auto_4290 ) ) ( OBJ-AT ?auto_4292 ?auto_4290 ) ( IN-CITY ?auto_4291 ?auto_4294 ) ( not ( = ?auto_4286 ?auto_4291 ) ) ( not ( = ?auto_4293 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( OBJ-AT ?auto_4288 ?auto_4291 ) ( TRUCK-AT ?auto_4289 ?auto_4286 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4288 ?auto_4287 ?auto_4286 )
      ( DELIVER-2PKG-VERIFY ?auto_4287 ?auto_4288 ?auto_4286 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4296 - OBJ
      ?auto_4297 - OBJ
      ?auto_4295 - LOCATION
    )
    :vars
    (
      ?auto_4301 - LOCATION
      ?auto_4302 - CITY
      ?auto_4303 - OBJ
      ?auto_4299 - LOCATION
      ?auto_4300 - LOCATION
      ?auto_4298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4301 ?auto_4302 ) ( IN-CITY ?auto_4295 ?auto_4302 ) ( not ( = ?auto_4295 ?auto_4301 ) ) ( not ( = ?auto_4303 ?auto_4296 ) ) ( OBJ-AT ?auto_4296 ?auto_4301 ) ( not ( = ?auto_4303 ?auto_4297 ) ) ( not ( = ?auto_4296 ?auto_4297 ) ) ( IN-CITY ?auto_4299 ?auto_4302 ) ( not ( = ?auto_4295 ?auto_4299 ) ) ( not ( = ?auto_4301 ?auto_4299 ) ) ( OBJ-AT ?auto_4297 ?auto_4299 ) ( IN-CITY ?auto_4300 ?auto_4302 ) ( not ( = ?auto_4295 ?auto_4300 ) ) ( not ( = ?auto_4301 ?auto_4300 ) ) ( not ( = ?auto_4299 ?auto_4300 ) ) ( OBJ-AT ?auto_4303 ?auto_4300 ) ( TRUCK-AT ?auto_4298 ?auto_4295 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4303 ?auto_4296 ?auto_4295 )
      ( DELIVER-2PKG-VERIFY ?auto_4296 ?auto_4297 ?auto_4295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4325 - OBJ
      ?auto_4326 - OBJ
      ?auto_4327 - OBJ
      ?auto_4324 - LOCATION
    )
    :vars
    (
      ?auto_4331 - LOCATION
      ?auto_4332 - CITY
      ?auto_4329 - LOCATION
      ?auto_4330 - LOCATION
      ?auto_4328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4331 ?auto_4332 ) ( IN-CITY ?auto_4324 ?auto_4332 ) ( not ( = ?auto_4324 ?auto_4331 ) ) ( not ( = ?auto_4325 ?auto_4327 ) ) ( OBJ-AT ?auto_4327 ?auto_4331 ) ( not ( = ?auto_4325 ?auto_4326 ) ) ( not ( = ?auto_4327 ?auto_4326 ) ) ( IN-CITY ?auto_4329 ?auto_4332 ) ( not ( = ?auto_4324 ?auto_4329 ) ) ( not ( = ?auto_4331 ?auto_4329 ) ) ( OBJ-AT ?auto_4326 ?auto_4329 ) ( IN-CITY ?auto_4330 ?auto_4332 ) ( not ( = ?auto_4324 ?auto_4330 ) ) ( not ( = ?auto_4331 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( OBJ-AT ?auto_4325 ?auto_4330 ) ( TRUCK-AT ?auto_4328 ?auto_4324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4325 ?auto_4327 ?auto_4324 )
      ( DELIVER-3PKG-VERIFY ?auto_4325 ?auto_4326 ?auto_4327 ?auto_4324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4344 - OBJ
      ?auto_4345 - OBJ
      ?auto_4346 - OBJ
      ?auto_4343 - LOCATION
    )
    :vars
    (
      ?auto_4350 - LOCATION
      ?auto_4351 - CITY
      ?auto_4348 - LOCATION
      ?auto_4349 - LOCATION
      ?auto_4347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4350 ?auto_4351 ) ( IN-CITY ?auto_4343 ?auto_4351 ) ( not ( = ?auto_4343 ?auto_4350 ) ) ( not ( = ?auto_4344 ?auto_4345 ) ) ( OBJ-AT ?auto_4345 ?auto_4350 ) ( not ( = ?auto_4344 ?auto_4346 ) ) ( not ( = ?auto_4345 ?auto_4346 ) ) ( IN-CITY ?auto_4348 ?auto_4351 ) ( not ( = ?auto_4343 ?auto_4348 ) ) ( not ( = ?auto_4350 ?auto_4348 ) ) ( OBJ-AT ?auto_4346 ?auto_4348 ) ( IN-CITY ?auto_4349 ?auto_4351 ) ( not ( = ?auto_4343 ?auto_4349 ) ) ( not ( = ?auto_4350 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( OBJ-AT ?auto_4344 ?auto_4349 ) ( TRUCK-AT ?auto_4347 ?auto_4343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4344 ?auto_4345 ?auto_4343 )
      ( DELIVER-3PKG-VERIFY ?auto_4344 ?auto_4345 ?auto_4346 ?auto_4343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4363 - OBJ
      ?auto_4364 - OBJ
      ?auto_4365 - OBJ
      ?auto_4362 - LOCATION
    )
    :vars
    (
      ?auto_4369 - LOCATION
      ?auto_4370 - CITY
      ?auto_4367 - LOCATION
      ?auto_4368 - LOCATION
      ?auto_4366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4369 ?auto_4370 ) ( IN-CITY ?auto_4362 ?auto_4370 ) ( not ( = ?auto_4362 ?auto_4369 ) ) ( not ( = ?auto_4364 ?auto_4365 ) ) ( OBJ-AT ?auto_4365 ?auto_4369 ) ( not ( = ?auto_4364 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4363 ) ) ( IN-CITY ?auto_4367 ?auto_4370 ) ( not ( = ?auto_4362 ?auto_4367 ) ) ( not ( = ?auto_4369 ?auto_4367 ) ) ( OBJ-AT ?auto_4363 ?auto_4367 ) ( IN-CITY ?auto_4368 ?auto_4370 ) ( not ( = ?auto_4362 ?auto_4368 ) ) ( not ( = ?auto_4369 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( OBJ-AT ?auto_4364 ?auto_4368 ) ( TRUCK-AT ?auto_4366 ?auto_4362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4364 ?auto_4365 ?auto_4362 )
      ( DELIVER-3PKG-VERIFY ?auto_4363 ?auto_4364 ?auto_4365 ?auto_4362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4382 - OBJ
      ?auto_4383 - OBJ
      ?auto_4384 - OBJ
      ?auto_4381 - LOCATION
    )
    :vars
    (
      ?auto_4388 - LOCATION
      ?auto_4389 - CITY
      ?auto_4386 - LOCATION
      ?auto_4387 - LOCATION
      ?auto_4385 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4388 ?auto_4389 ) ( IN-CITY ?auto_4381 ?auto_4389 ) ( not ( = ?auto_4381 ?auto_4388 ) ) ( not ( = ?auto_4384 ?auto_4383 ) ) ( OBJ-AT ?auto_4383 ?auto_4388 ) ( not ( = ?auto_4384 ?auto_4382 ) ) ( not ( = ?auto_4383 ?auto_4382 ) ) ( IN-CITY ?auto_4386 ?auto_4389 ) ( not ( = ?auto_4381 ?auto_4386 ) ) ( not ( = ?auto_4388 ?auto_4386 ) ) ( OBJ-AT ?auto_4382 ?auto_4386 ) ( IN-CITY ?auto_4387 ?auto_4389 ) ( not ( = ?auto_4381 ?auto_4387 ) ) ( not ( = ?auto_4388 ?auto_4387 ) ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( OBJ-AT ?auto_4384 ?auto_4387 ) ( TRUCK-AT ?auto_4385 ?auto_4381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4384 ?auto_4383 ?auto_4381 )
      ( DELIVER-3PKG-VERIFY ?auto_4382 ?auto_4383 ?auto_4384 ?auto_4381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4421 - OBJ
      ?auto_4422 - OBJ
      ?auto_4423 - OBJ
      ?auto_4420 - LOCATION
    )
    :vars
    (
      ?auto_4427 - LOCATION
      ?auto_4428 - CITY
      ?auto_4425 - LOCATION
      ?auto_4426 - LOCATION
      ?auto_4424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4427 ?auto_4428 ) ( IN-CITY ?auto_4420 ?auto_4428 ) ( not ( = ?auto_4420 ?auto_4427 ) ) ( not ( = ?auto_4422 ?auto_4421 ) ) ( OBJ-AT ?auto_4421 ?auto_4427 ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( not ( = ?auto_4421 ?auto_4423 ) ) ( IN-CITY ?auto_4425 ?auto_4428 ) ( not ( = ?auto_4420 ?auto_4425 ) ) ( not ( = ?auto_4427 ?auto_4425 ) ) ( OBJ-AT ?auto_4423 ?auto_4425 ) ( IN-CITY ?auto_4426 ?auto_4428 ) ( not ( = ?auto_4420 ?auto_4426 ) ) ( not ( = ?auto_4427 ?auto_4426 ) ) ( not ( = ?auto_4425 ?auto_4426 ) ) ( OBJ-AT ?auto_4422 ?auto_4426 ) ( TRUCK-AT ?auto_4424 ?auto_4420 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4422 ?auto_4421 ?auto_4420 )
      ( DELIVER-3PKG-VERIFY ?auto_4421 ?auto_4422 ?auto_4423 ?auto_4420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4440 - OBJ
      ?auto_4441 - OBJ
      ?auto_4442 - OBJ
      ?auto_4439 - LOCATION
    )
    :vars
    (
      ?auto_4446 - LOCATION
      ?auto_4447 - CITY
      ?auto_4444 - LOCATION
      ?auto_4445 - LOCATION
      ?auto_4443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4446 ?auto_4447 ) ( IN-CITY ?auto_4439 ?auto_4447 ) ( not ( = ?auto_4439 ?auto_4446 ) ) ( not ( = ?auto_4442 ?auto_4440 ) ) ( OBJ-AT ?auto_4440 ?auto_4446 ) ( not ( = ?auto_4442 ?auto_4441 ) ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( IN-CITY ?auto_4444 ?auto_4447 ) ( not ( = ?auto_4439 ?auto_4444 ) ) ( not ( = ?auto_4446 ?auto_4444 ) ) ( OBJ-AT ?auto_4441 ?auto_4444 ) ( IN-CITY ?auto_4445 ?auto_4447 ) ( not ( = ?auto_4439 ?auto_4445 ) ) ( not ( = ?auto_4446 ?auto_4445 ) ) ( not ( = ?auto_4444 ?auto_4445 ) ) ( OBJ-AT ?auto_4442 ?auto_4445 ) ( TRUCK-AT ?auto_4443 ?auto_4439 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4442 ?auto_4440 ?auto_4439 )
      ( DELIVER-3PKG-VERIFY ?auto_4440 ?auto_4441 ?auto_4442 ?auto_4439 ) )
  )

)

