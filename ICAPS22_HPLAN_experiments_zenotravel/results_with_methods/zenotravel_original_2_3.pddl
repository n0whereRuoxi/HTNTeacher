( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1309 - PERSON
      ?auto_1308 - CITY
    )
    :vars
    (
      ?auto_1310 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1309 ?auto_1310 ) ( AIRCRAFT-AT ?auto_1310 ?auto_1308 ) )
    :subtasks
    ( ( !DEBARK ?auto_1309 ?auto_1310 ?auto_1308 )
      ( FLY-1PPL-VERIFY ?auto_1309 ?auto_1308 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1316 - PERSON
      ?auto_1315 - CITY
    )
    :vars
    (
      ?auto_1317 - AIRCRAFT
      ?auto_1320 - CITY
      ?auto_1318 - FLEVEL
      ?auto_1319 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1316 ?auto_1317 ) ( AIRCRAFT-AT ?auto_1317 ?auto_1320 ) ( FUEL-LEVEL ?auto_1317 ?auto_1318 ) ( NEXT ?auto_1319 ?auto_1318 ) ( not ( = ?auto_1315 ?auto_1320 ) ) ( not ( = ?auto_1318 ?auto_1319 ) ) )
    :subtasks
    ( ( !FLY ?auto_1317 ?auto_1320 ?auto_1315 ?auto_1318 ?auto_1319 )
      ( FLY-1PPL ?auto_1316 ?auto_1315 )
      ( FLY-1PPL-VERIFY ?auto_1316 ?auto_1315 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1329 - PERSON
      ?auto_1328 - CITY
    )
    :vars
    (
      ?auto_1330 - AIRCRAFT
      ?auto_1331 - CITY
      ?auto_1332 - FLEVEL
      ?auto_1333 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1330 ?auto_1331 ) ( FUEL-LEVEL ?auto_1330 ?auto_1332 ) ( NEXT ?auto_1333 ?auto_1332 ) ( not ( = ?auto_1328 ?auto_1331 ) ) ( not ( = ?auto_1332 ?auto_1333 ) ) ( PERSON-AT ?auto_1329 ?auto_1331 ) )
    :subtasks
    ( ( !BOARD ?auto_1329 ?auto_1330 ?auto_1331 )
      ( FLY-1PPL ?auto_1329 ?auto_1328 )
      ( FLY-1PPL-VERIFY ?auto_1329 ?auto_1328 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1342 - PERSON
      ?auto_1341 - CITY
    )
    :vars
    (
      ?auto_1343 - AIRCRAFT
      ?auto_1344 - CITY
      ?auto_1345 - FLEVEL
      ?auto_1346 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1343 ?auto_1344 ) ( NEXT ?auto_1345 ?auto_1346 ) ( not ( = ?auto_1341 ?auto_1344 ) ) ( not ( = ?auto_1346 ?auto_1345 ) ) ( PERSON-AT ?auto_1342 ?auto_1344 ) ( FUEL-LEVEL ?auto_1343 ?auto_1345 ) )
    :subtasks
    ( ( !REFUEL ?auto_1343 ?auto_1344 ?auto_1345 ?auto_1346 )
      ( FLY-1PPL ?auto_1342 ?auto_1341 )
      ( FLY-1PPL-VERIFY ?auto_1342 ?auto_1341 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1355 - PERSON
      ?auto_1354 - CITY
    )
    :vars
    (
      ?auto_1358 - FLEVEL
      ?auto_1359 - FLEVEL
      ?auto_1356 - CITY
      ?auto_1357 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1358 ?auto_1359 ) ( not ( = ?auto_1354 ?auto_1356 ) ) ( not ( = ?auto_1359 ?auto_1358 ) ) ( PERSON-AT ?auto_1355 ?auto_1356 ) ( AIRCRAFT-AT ?auto_1357 ?auto_1354 ) ( FUEL-LEVEL ?auto_1357 ?auto_1359 ) )
    :subtasks
    ( ( !FLY ?auto_1357 ?auto_1354 ?auto_1356 ?auto_1359 ?auto_1358 )
      ( FLY-1PPL ?auto_1355 ?auto_1354 )
      ( FLY-1PPL-VERIFY ?auto_1355 ?auto_1354 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1368 - PERSON
      ?auto_1367 - CITY
    )
    :vars
    (
      ?auto_1369 - FLEVEL
      ?auto_1370 - FLEVEL
      ?auto_1372 - CITY
      ?auto_1371 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1369 ?auto_1370 ) ( not ( = ?auto_1367 ?auto_1372 ) ) ( not ( = ?auto_1370 ?auto_1369 ) ) ( PERSON-AT ?auto_1368 ?auto_1372 ) ( AIRCRAFT-AT ?auto_1371 ?auto_1367 ) ( FUEL-LEVEL ?auto_1371 ?auto_1369 ) )
    :subtasks
    ( ( !REFUEL ?auto_1371 ?auto_1367 ?auto_1369 ?auto_1370 )
      ( FLY-1PPL ?auto_1368 ?auto_1367 )
      ( FLY-1PPL-VERIFY ?auto_1368 ?auto_1367 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1392 - PERSON
      ?auto_1391 - CITY
    )
    :vars
    (
      ?auto_1393 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1392 ?auto_1393 ) ( AIRCRAFT-AT ?auto_1393 ?auto_1391 ) )
    :subtasks
    ( ( !DEBARK ?auto_1392 ?auto_1393 ?auto_1391 )
      ( FLY-1PPL-VERIFY ?auto_1392 ?auto_1391 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1395 - PERSON
      ?auto_1396 - PERSON
      ?auto_1394 - CITY
    )
    :vars
    (
      ?auto_1397 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1396 ?auto_1397 ) ( AIRCRAFT-AT ?auto_1397 ?auto_1394 ) ( PERSON-AT ?auto_1395 ?auto_1394 ) ( not ( = ?auto_1395 ?auto_1396 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1396 ?auto_1394 )
      ( FLY-2PPL-VERIFY ?auto_1395 ?auto_1396 ?auto_1394 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1399 - PERSON
      ?auto_1400 - PERSON
      ?auto_1398 - CITY
    )
    :vars
    (
      ?auto_1401 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1399 ?auto_1401 ) ( AIRCRAFT-AT ?auto_1401 ?auto_1398 ) ( PERSON-AT ?auto_1400 ?auto_1398 ) ( not ( = ?auto_1399 ?auto_1400 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1399 ?auto_1398 )
      ( FLY-2PPL-VERIFY ?auto_1399 ?auto_1400 ?auto_1398 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1407 - PERSON
      ?auto_1406 - CITY
    )
    :vars
    (
      ?auto_1408 - AIRCRAFT
      ?auto_1411 - CITY
      ?auto_1409 - FLEVEL
      ?auto_1410 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1407 ?auto_1408 ) ( AIRCRAFT-AT ?auto_1408 ?auto_1411 ) ( FUEL-LEVEL ?auto_1408 ?auto_1409 ) ( NEXT ?auto_1410 ?auto_1409 ) ( not ( = ?auto_1406 ?auto_1411 ) ) ( not ( = ?auto_1409 ?auto_1410 ) ) )
    :subtasks
    ( ( !FLY ?auto_1408 ?auto_1411 ?auto_1406 ?auto_1409 ?auto_1410 )
      ( FLY-1PPL ?auto_1407 ?auto_1406 )
      ( FLY-1PPL-VERIFY ?auto_1407 ?auto_1406 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1413 - PERSON
      ?auto_1414 - PERSON
      ?auto_1412 - CITY
    )
    :vars
    (
      ?auto_1415 - AIRCRAFT
      ?auto_1416 - CITY
      ?auto_1418 - FLEVEL
      ?auto_1417 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1414 ?auto_1415 ) ( AIRCRAFT-AT ?auto_1415 ?auto_1416 ) ( FUEL-LEVEL ?auto_1415 ?auto_1418 ) ( NEXT ?auto_1417 ?auto_1418 ) ( not ( = ?auto_1412 ?auto_1416 ) ) ( not ( = ?auto_1418 ?auto_1417 ) ) ( PERSON-AT ?auto_1413 ?auto_1412 ) ( not ( = ?auto_1413 ?auto_1414 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1414 ?auto_1412 )
      ( FLY-2PPL-VERIFY ?auto_1413 ?auto_1414 ?auto_1412 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1420 - PERSON
      ?auto_1421 - PERSON
      ?auto_1419 - CITY
    )
    :vars
    (
      ?auto_1422 - AIRCRAFT
      ?auto_1423 - CITY
      ?auto_1425 - FLEVEL
      ?auto_1424 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1420 ?auto_1422 ) ( AIRCRAFT-AT ?auto_1422 ?auto_1423 ) ( FUEL-LEVEL ?auto_1422 ?auto_1425 ) ( NEXT ?auto_1424 ?auto_1425 ) ( not ( = ?auto_1419 ?auto_1423 ) ) ( not ( = ?auto_1425 ?auto_1424 ) ) ( PERSON-AT ?auto_1421 ?auto_1419 ) ( not ( = ?auto_1421 ?auto_1420 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1421 ?auto_1420 ?auto_1419 )
      ( FLY-2PPL-VERIFY ?auto_1420 ?auto_1421 ?auto_1419 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1435 - PERSON
      ?auto_1434 - CITY
    )
    :vars
    (
      ?auto_1436 - AIRCRAFT
      ?auto_1437 - CITY
      ?auto_1439 - FLEVEL
      ?auto_1438 - FLEVEL
      ?auto_1440 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1436 ?auto_1437 ) ( FUEL-LEVEL ?auto_1436 ?auto_1439 ) ( NEXT ?auto_1438 ?auto_1439 ) ( not ( = ?auto_1434 ?auto_1437 ) ) ( not ( = ?auto_1439 ?auto_1438 ) ) ( PERSON-AT ?auto_1440 ?auto_1434 ) ( not ( = ?auto_1440 ?auto_1435 ) ) ( PERSON-AT ?auto_1435 ?auto_1437 ) )
    :subtasks
    ( ( !BOARD ?auto_1435 ?auto_1436 ?auto_1437 )
      ( FLY-2PPL ?auto_1440 ?auto_1435 ?auto_1434 )
      ( FLY-1PPL-VERIFY ?auto_1435 ?auto_1434 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1442 - PERSON
      ?auto_1443 - PERSON
      ?auto_1441 - CITY
    )
    :vars
    (
      ?auto_1446 - AIRCRAFT
      ?auto_1444 - CITY
      ?auto_1445 - FLEVEL
      ?auto_1447 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1446 ?auto_1444 ) ( FUEL-LEVEL ?auto_1446 ?auto_1445 ) ( NEXT ?auto_1447 ?auto_1445 ) ( not ( = ?auto_1441 ?auto_1444 ) ) ( not ( = ?auto_1445 ?auto_1447 ) ) ( PERSON-AT ?auto_1442 ?auto_1441 ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( PERSON-AT ?auto_1443 ?auto_1444 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1443 ?auto_1441 )
      ( FLY-2PPL-VERIFY ?auto_1442 ?auto_1443 ?auto_1441 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1449 - PERSON
      ?auto_1450 - PERSON
      ?auto_1448 - CITY
    )
    :vars
    (
      ?auto_1454 - AIRCRAFT
      ?auto_1452 - CITY
      ?auto_1451 - FLEVEL
      ?auto_1453 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1454 ?auto_1452 ) ( FUEL-LEVEL ?auto_1454 ?auto_1451 ) ( NEXT ?auto_1453 ?auto_1451 ) ( not ( = ?auto_1448 ?auto_1452 ) ) ( not ( = ?auto_1451 ?auto_1453 ) ) ( PERSON-AT ?auto_1450 ?auto_1448 ) ( not ( = ?auto_1450 ?auto_1449 ) ) ( PERSON-AT ?auto_1449 ?auto_1452 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1450 ?auto_1449 ?auto_1448 )
      ( FLY-2PPL-VERIFY ?auto_1449 ?auto_1450 ?auto_1448 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1464 - PERSON
      ?auto_1463 - CITY
    )
    :vars
    (
      ?auto_1469 - AIRCRAFT
      ?auto_1466 - CITY
      ?auto_1468 - FLEVEL
      ?auto_1465 - FLEVEL
      ?auto_1467 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1469 ?auto_1466 ) ( NEXT ?auto_1468 ?auto_1465 ) ( not ( = ?auto_1463 ?auto_1466 ) ) ( not ( = ?auto_1465 ?auto_1468 ) ) ( PERSON-AT ?auto_1467 ?auto_1463 ) ( not ( = ?auto_1467 ?auto_1464 ) ) ( PERSON-AT ?auto_1464 ?auto_1466 ) ( FUEL-LEVEL ?auto_1469 ?auto_1468 ) )
    :subtasks
    ( ( !REFUEL ?auto_1469 ?auto_1466 ?auto_1468 ?auto_1465 )
      ( FLY-2PPL ?auto_1467 ?auto_1464 ?auto_1463 )
      ( FLY-1PPL-VERIFY ?auto_1464 ?auto_1463 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1471 - PERSON
      ?auto_1472 - PERSON
      ?auto_1470 - CITY
    )
    :vars
    (
      ?auto_1476 - AIRCRAFT
      ?auto_1475 - CITY
      ?auto_1473 - FLEVEL
      ?auto_1474 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1476 ?auto_1475 ) ( NEXT ?auto_1473 ?auto_1474 ) ( not ( = ?auto_1470 ?auto_1475 ) ) ( not ( = ?auto_1474 ?auto_1473 ) ) ( PERSON-AT ?auto_1471 ?auto_1470 ) ( not ( = ?auto_1471 ?auto_1472 ) ) ( PERSON-AT ?auto_1472 ?auto_1475 ) ( FUEL-LEVEL ?auto_1476 ?auto_1473 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1472 ?auto_1470 )
      ( FLY-2PPL-VERIFY ?auto_1471 ?auto_1472 ?auto_1470 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1478 - PERSON
      ?auto_1479 - PERSON
      ?auto_1477 - CITY
    )
    :vars
    (
      ?auto_1480 - AIRCRAFT
      ?auto_1483 - CITY
      ?auto_1481 - FLEVEL
      ?auto_1482 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1480 ?auto_1483 ) ( NEXT ?auto_1481 ?auto_1482 ) ( not ( = ?auto_1477 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1481 ) ) ( PERSON-AT ?auto_1479 ?auto_1477 ) ( not ( = ?auto_1479 ?auto_1478 ) ) ( PERSON-AT ?auto_1478 ?auto_1483 ) ( FUEL-LEVEL ?auto_1480 ?auto_1481 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1479 ?auto_1478 ?auto_1477 )
      ( FLY-2PPL-VERIFY ?auto_1478 ?auto_1479 ?auto_1477 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1493 - PERSON
      ?auto_1492 - CITY
    )
    :vars
    (
      ?auto_1496 - FLEVEL
      ?auto_1497 - FLEVEL
      ?auto_1498 - CITY
      ?auto_1495 - PERSON
      ?auto_1494 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1496 ?auto_1497 ) ( not ( = ?auto_1492 ?auto_1498 ) ) ( not ( = ?auto_1497 ?auto_1496 ) ) ( PERSON-AT ?auto_1495 ?auto_1492 ) ( not ( = ?auto_1495 ?auto_1493 ) ) ( PERSON-AT ?auto_1493 ?auto_1498 ) ( AIRCRAFT-AT ?auto_1494 ?auto_1492 ) ( FUEL-LEVEL ?auto_1494 ?auto_1497 ) )
    :subtasks
    ( ( !FLY ?auto_1494 ?auto_1492 ?auto_1498 ?auto_1497 ?auto_1496 )
      ( FLY-2PPL ?auto_1495 ?auto_1493 ?auto_1492 )
      ( FLY-1PPL-VERIFY ?auto_1493 ?auto_1492 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1500 - PERSON
      ?auto_1501 - PERSON
      ?auto_1499 - CITY
    )
    :vars
    (
      ?auto_1503 - FLEVEL
      ?auto_1502 - FLEVEL
      ?auto_1505 - CITY
      ?auto_1504 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1503 ?auto_1502 ) ( not ( = ?auto_1499 ?auto_1505 ) ) ( not ( = ?auto_1502 ?auto_1503 ) ) ( PERSON-AT ?auto_1500 ?auto_1499 ) ( not ( = ?auto_1500 ?auto_1501 ) ) ( PERSON-AT ?auto_1501 ?auto_1505 ) ( AIRCRAFT-AT ?auto_1504 ?auto_1499 ) ( FUEL-LEVEL ?auto_1504 ?auto_1502 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1501 ?auto_1499 )
      ( FLY-2PPL-VERIFY ?auto_1500 ?auto_1501 ?auto_1499 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1507 - PERSON
      ?auto_1508 - PERSON
      ?auto_1506 - CITY
    )
    :vars
    (
      ?auto_1511 - FLEVEL
      ?auto_1512 - FLEVEL
      ?auto_1509 - CITY
      ?auto_1510 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1511 ?auto_1512 ) ( not ( = ?auto_1506 ?auto_1509 ) ) ( not ( = ?auto_1512 ?auto_1511 ) ) ( PERSON-AT ?auto_1508 ?auto_1506 ) ( not ( = ?auto_1508 ?auto_1507 ) ) ( PERSON-AT ?auto_1507 ?auto_1509 ) ( AIRCRAFT-AT ?auto_1510 ?auto_1506 ) ( FUEL-LEVEL ?auto_1510 ?auto_1512 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1508 ?auto_1507 ?auto_1506 )
      ( FLY-2PPL-VERIFY ?auto_1507 ?auto_1508 ?auto_1506 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1522 - PERSON
      ?auto_1521 - CITY
    )
    :vars
    (
      ?auto_1525 - FLEVEL
      ?auto_1527 - FLEVEL
      ?auto_1523 - CITY
      ?auto_1526 - PERSON
      ?auto_1524 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1525 ?auto_1527 ) ( not ( = ?auto_1521 ?auto_1523 ) ) ( not ( = ?auto_1527 ?auto_1525 ) ) ( PERSON-AT ?auto_1526 ?auto_1521 ) ( not ( = ?auto_1526 ?auto_1522 ) ) ( PERSON-AT ?auto_1522 ?auto_1523 ) ( AIRCRAFT-AT ?auto_1524 ?auto_1521 ) ( FUEL-LEVEL ?auto_1524 ?auto_1525 ) )
    :subtasks
    ( ( !REFUEL ?auto_1524 ?auto_1521 ?auto_1525 ?auto_1527 )
      ( FLY-2PPL ?auto_1526 ?auto_1522 ?auto_1521 )
      ( FLY-1PPL-VERIFY ?auto_1522 ?auto_1521 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1529 - PERSON
      ?auto_1530 - PERSON
      ?auto_1528 - CITY
    )
    :vars
    (
      ?auto_1532 - FLEVEL
      ?auto_1531 - FLEVEL
      ?auto_1534 - CITY
      ?auto_1533 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1532 ?auto_1531 ) ( not ( = ?auto_1528 ?auto_1534 ) ) ( not ( = ?auto_1531 ?auto_1532 ) ) ( PERSON-AT ?auto_1529 ?auto_1528 ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( PERSON-AT ?auto_1530 ?auto_1534 ) ( AIRCRAFT-AT ?auto_1533 ?auto_1528 ) ( FUEL-LEVEL ?auto_1533 ?auto_1532 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1530 ?auto_1528 )
      ( FLY-2PPL-VERIFY ?auto_1529 ?auto_1530 ?auto_1528 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1536 - PERSON
      ?auto_1537 - PERSON
      ?auto_1535 - CITY
    )
    :vars
    (
      ?auto_1541 - FLEVEL
      ?auto_1538 - FLEVEL
      ?auto_1539 - CITY
      ?auto_1540 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1541 ?auto_1538 ) ( not ( = ?auto_1535 ?auto_1539 ) ) ( not ( = ?auto_1538 ?auto_1541 ) ) ( PERSON-AT ?auto_1537 ?auto_1535 ) ( not ( = ?auto_1537 ?auto_1536 ) ) ( PERSON-AT ?auto_1536 ?auto_1539 ) ( AIRCRAFT-AT ?auto_1540 ?auto_1535 ) ( FUEL-LEVEL ?auto_1540 ?auto_1541 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1537 ?auto_1536 ?auto_1535 )
      ( FLY-2PPL-VERIFY ?auto_1536 ?auto_1537 ?auto_1535 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1551 - PERSON
      ?auto_1550 - CITY
    )
    :vars
    (
      ?auto_1555 - FLEVEL
      ?auto_1552 - FLEVEL
      ?auto_1553 - CITY
      ?auto_1556 - PERSON
      ?auto_1554 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1555 ?auto_1552 ) ( not ( = ?auto_1550 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1555 ) ) ( not ( = ?auto_1556 ?auto_1551 ) ) ( PERSON-AT ?auto_1551 ?auto_1553 ) ( AIRCRAFT-AT ?auto_1554 ?auto_1550 ) ( FUEL-LEVEL ?auto_1554 ?auto_1555 ) ( IN ?auto_1556 ?auto_1554 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1556 ?auto_1550 )
      ( FLY-2PPL ?auto_1556 ?auto_1551 ?auto_1550 )
      ( FLY-1PPL-VERIFY ?auto_1551 ?auto_1550 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1558 - PERSON
      ?auto_1559 - PERSON
      ?auto_1557 - CITY
    )
    :vars
    (
      ?auto_1563 - FLEVEL
      ?auto_1561 - FLEVEL
      ?auto_1562 - CITY
      ?auto_1560 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1563 ?auto_1561 ) ( not ( = ?auto_1557 ?auto_1562 ) ) ( not ( = ?auto_1561 ?auto_1563 ) ) ( not ( = ?auto_1558 ?auto_1559 ) ) ( PERSON-AT ?auto_1559 ?auto_1562 ) ( AIRCRAFT-AT ?auto_1560 ?auto_1557 ) ( FUEL-LEVEL ?auto_1560 ?auto_1563 ) ( IN ?auto_1558 ?auto_1560 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1559 ?auto_1557 )
      ( FLY-2PPL-VERIFY ?auto_1558 ?auto_1559 ?auto_1557 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1565 - PERSON
      ?auto_1566 - PERSON
      ?auto_1564 - CITY
    )
    :vars
    (
      ?auto_1567 - FLEVEL
      ?auto_1570 - FLEVEL
      ?auto_1569 - CITY
      ?auto_1568 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1567 ?auto_1570 ) ( not ( = ?auto_1564 ?auto_1569 ) ) ( not ( = ?auto_1570 ?auto_1567 ) ) ( not ( = ?auto_1566 ?auto_1565 ) ) ( PERSON-AT ?auto_1565 ?auto_1569 ) ( AIRCRAFT-AT ?auto_1568 ?auto_1564 ) ( FUEL-LEVEL ?auto_1568 ?auto_1567 ) ( IN ?auto_1566 ?auto_1568 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1566 ?auto_1565 ?auto_1564 )
      ( FLY-2PPL-VERIFY ?auto_1565 ?auto_1566 ?auto_1564 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1580 - PERSON
      ?auto_1579 - CITY
    )
    :vars
    (
      ?auto_1581 - FLEVEL
      ?auto_1584 - FLEVEL
      ?auto_1583 - CITY
      ?auto_1585 - PERSON
      ?auto_1582 - AIRCRAFT
      ?auto_1586 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1581 ?auto_1584 ) ( not ( = ?auto_1579 ?auto_1583 ) ) ( not ( = ?auto_1584 ?auto_1581 ) ) ( not ( = ?auto_1585 ?auto_1580 ) ) ( PERSON-AT ?auto_1580 ?auto_1583 ) ( IN ?auto_1585 ?auto_1582 ) ( AIRCRAFT-AT ?auto_1582 ?auto_1586 ) ( FUEL-LEVEL ?auto_1582 ?auto_1584 ) ( not ( = ?auto_1579 ?auto_1586 ) ) ( not ( = ?auto_1583 ?auto_1586 ) ) )
    :subtasks
    ( ( !FLY ?auto_1582 ?auto_1586 ?auto_1579 ?auto_1584 ?auto_1581 )
      ( FLY-2PPL ?auto_1585 ?auto_1580 ?auto_1579 )
      ( FLY-1PPL-VERIFY ?auto_1580 ?auto_1579 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1588 - PERSON
      ?auto_1589 - PERSON
      ?auto_1587 - CITY
    )
    :vars
    (
      ?auto_1592 - FLEVEL
      ?auto_1593 - FLEVEL
      ?auto_1594 - CITY
      ?auto_1590 - AIRCRAFT
      ?auto_1591 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1592 ?auto_1593 ) ( not ( = ?auto_1587 ?auto_1594 ) ) ( not ( = ?auto_1593 ?auto_1592 ) ) ( not ( = ?auto_1588 ?auto_1589 ) ) ( PERSON-AT ?auto_1589 ?auto_1594 ) ( IN ?auto_1588 ?auto_1590 ) ( AIRCRAFT-AT ?auto_1590 ?auto_1591 ) ( FUEL-LEVEL ?auto_1590 ?auto_1593 ) ( not ( = ?auto_1587 ?auto_1591 ) ) ( not ( = ?auto_1594 ?auto_1591 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1589 ?auto_1587 )
      ( FLY-2PPL-VERIFY ?auto_1588 ?auto_1589 ?auto_1587 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1596 - PERSON
      ?auto_1597 - PERSON
      ?auto_1595 - CITY
    )
    :vars
    (
      ?auto_1602 - FLEVEL
      ?auto_1599 - FLEVEL
      ?auto_1600 - CITY
      ?auto_1601 - AIRCRAFT
      ?auto_1598 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1602 ?auto_1599 ) ( not ( = ?auto_1595 ?auto_1600 ) ) ( not ( = ?auto_1599 ?auto_1602 ) ) ( not ( = ?auto_1597 ?auto_1596 ) ) ( PERSON-AT ?auto_1596 ?auto_1600 ) ( IN ?auto_1597 ?auto_1601 ) ( AIRCRAFT-AT ?auto_1601 ?auto_1598 ) ( FUEL-LEVEL ?auto_1601 ?auto_1599 ) ( not ( = ?auto_1595 ?auto_1598 ) ) ( not ( = ?auto_1600 ?auto_1598 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1597 ?auto_1596 ?auto_1595 )
      ( FLY-2PPL-VERIFY ?auto_1596 ?auto_1597 ?auto_1595 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1613 - PERSON
      ?auto_1612 - CITY
    )
    :vars
    (
      ?auto_1618 - FLEVEL
      ?auto_1615 - FLEVEL
      ?auto_1616 - CITY
      ?auto_1619 - PERSON
      ?auto_1617 - AIRCRAFT
      ?auto_1614 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1618 ?auto_1615 ) ( not ( = ?auto_1612 ?auto_1616 ) ) ( not ( = ?auto_1615 ?auto_1618 ) ) ( not ( = ?auto_1619 ?auto_1613 ) ) ( PERSON-AT ?auto_1613 ?auto_1616 ) ( AIRCRAFT-AT ?auto_1617 ?auto_1614 ) ( FUEL-LEVEL ?auto_1617 ?auto_1615 ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( not ( = ?auto_1616 ?auto_1614 ) ) ( PERSON-AT ?auto_1619 ?auto_1614 ) )
    :subtasks
    ( ( !BOARD ?auto_1619 ?auto_1617 ?auto_1614 )
      ( FLY-2PPL ?auto_1619 ?auto_1613 ?auto_1612 )
      ( FLY-1PPL-VERIFY ?auto_1613 ?auto_1612 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1621 - PERSON
      ?auto_1622 - PERSON
      ?auto_1620 - CITY
    )
    :vars
    (
      ?auto_1627 - FLEVEL
      ?auto_1625 - FLEVEL
      ?auto_1623 - CITY
      ?auto_1626 - AIRCRAFT
      ?auto_1624 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1627 ?auto_1625 ) ( not ( = ?auto_1620 ?auto_1623 ) ) ( not ( = ?auto_1625 ?auto_1627 ) ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( PERSON-AT ?auto_1622 ?auto_1623 ) ( AIRCRAFT-AT ?auto_1626 ?auto_1624 ) ( FUEL-LEVEL ?auto_1626 ?auto_1625 ) ( not ( = ?auto_1620 ?auto_1624 ) ) ( not ( = ?auto_1623 ?auto_1624 ) ) ( PERSON-AT ?auto_1621 ?auto_1624 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1622 ?auto_1620 )
      ( FLY-2PPL-VERIFY ?auto_1621 ?auto_1622 ?auto_1620 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1629 - PERSON
      ?auto_1630 - PERSON
      ?auto_1628 - CITY
    )
    :vars
    (
      ?auto_1633 - FLEVEL
      ?auto_1634 - FLEVEL
      ?auto_1631 - CITY
      ?auto_1632 - AIRCRAFT
      ?auto_1635 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1633 ?auto_1634 ) ( not ( = ?auto_1628 ?auto_1631 ) ) ( not ( = ?auto_1634 ?auto_1633 ) ) ( not ( = ?auto_1630 ?auto_1629 ) ) ( PERSON-AT ?auto_1629 ?auto_1631 ) ( AIRCRAFT-AT ?auto_1632 ?auto_1635 ) ( FUEL-LEVEL ?auto_1632 ?auto_1634 ) ( not ( = ?auto_1628 ?auto_1635 ) ) ( not ( = ?auto_1631 ?auto_1635 ) ) ( PERSON-AT ?auto_1630 ?auto_1635 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1630 ?auto_1629 ?auto_1628 )
      ( FLY-2PPL-VERIFY ?auto_1629 ?auto_1630 ?auto_1628 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1646 - PERSON
      ?auto_1645 - CITY
    )
    :vars
    (
      ?auto_1649 - FLEVEL
      ?auto_1650 - FLEVEL
      ?auto_1647 - CITY
      ?auto_1652 - PERSON
      ?auto_1648 - AIRCRAFT
      ?auto_1651 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1649 ?auto_1650 ) ( not ( = ?auto_1645 ?auto_1647 ) ) ( not ( = ?auto_1650 ?auto_1649 ) ) ( not ( = ?auto_1652 ?auto_1646 ) ) ( PERSON-AT ?auto_1646 ?auto_1647 ) ( AIRCRAFT-AT ?auto_1648 ?auto_1651 ) ( not ( = ?auto_1645 ?auto_1651 ) ) ( not ( = ?auto_1647 ?auto_1651 ) ) ( PERSON-AT ?auto_1652 ?auto_1651 ) ( FUEL-LEVEL ?auto_1648 ?auto_1649 ) )
    :subtasks
    ( ( !REFUEL ?auto_1648 ?auto_1651 ?auto_1649 ?auto_1650 )
      ( FLY-2PPL ?auto_1652 ?auto_1646 ?auto_1645 )
      ( FLY-1PPL-VERIFY ?auto_1646 ?auto_1645 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1654 - PERSON
      ?auto_1655 - PERSON
      ?auto_1653 - CITY
    )
    :vars
    (
      ?auto_1659 - FLEVEL
      ?auto_1658 - FLEVEL
      ?auto_1660 - CITY
      ?auto_1656 - AIRCRAFT
      ?auto_1657 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1659 ?auto_1658 ) ( not ( = ?auto_1653 ?auto_1660 ) ) ( not ( = ?auto_1658 ?auto_1659 ) ) ( not ( = ?auto_1654 ?auto_1655 ) ) ( PERSON-AT ?auto_1655 ?auto_1660 ) ( AIRCRAFT-AT ?auto_1656 ?auto_1657 ) ( not ( = ?auto_1653 ?auto_1657 ) ) ( not ( = ?auto_1660 ?auto_1657 ) ) ( PERSON-AT ?auto_1654 ?auto_1657 ) ( FUEL-LEVEL ?auto_1656 ?auto_1659 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1655 ?auto_1653 )
      ( FLY-2PPL-VERIFY ?auto_1654 ?auto_1655 ?auto_1653 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1662 - PERSON
      ?auto_1663 - PERSON
      ?auto_1661 - CITY
    )
    :vars
    (
      ?auto_1668 - FLEVEL
      ?auto_1666 - FLEVEL
      ?auto_1667 - CITY
      ?auto_1664 - AIRCRAFT
      ?auto_1665 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1668 ?auto_1666 ) ( not ( = ?auto_1661 ?auto_1667 ) ) ( not ( = ?auto_1666 ?auto_1668 ) ) ( not ( = ?auto_1663 ?auto_1662 ) ) ( PERSON-AT ?auto_1662 ?auto_1667 ) ( AIRCRAFT-AT ?auto_1664 ?auto_1665 ) ( not ( = ?auto_1661 ?auto_1665 ) ) ( not ( = ?auto_1667 ?auto_1665 ) ) ( PERSON-AT ?auto_1663 ?auto_1665 ) ( FUEL-LEVEL ?auto_1664 ?auto_1668 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1663 ?auto_1662 ?auto_1661 )
      ( FLY-2PPL-VERIFY ?auto_1662 ?auto_1663 ?auto_1661 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1679 - PERSON
      ?auto_1678 - CITY
    )
    :vars
    (
      ?auto_1684 - FLEVEL
      ?auto_1682 - FLEVEL
      ?auto_1683 - CITY
      ?auto_1685 - PERSON
      ?auto_1681 - CITY
      ?auto_1680 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1684 ?auto_1682 ) ( not ( = ?auto_1678 ?auto_1683 ) ) ( not ( = ?auto_1682 ?auto_1684 ) ) ( not ( = ?auto_1685 ?auto_1679 ) ) ( PERSON-AT ?auto_1679 ?auto_1683 ) ( not ( = ?auto_1678 ?auto_1681 ) ) ( not ( = ?auto_1683 ?auto_1681 ) ) ( PERSON-AT ?auto_1685 ?auto_1681 ) ( AIRCRAFT-AT ?auto_1680 ?auto_1678 ) ( FUEL-LEVEL ?auto_1680 ?auto_1682 ) )
    :subtasks
    ( ( !FLY ?auto_1680 ?auto_1678 ?auto_1681 ?auto_1682 ?auto_1684 )
      ( FLY-2PPL ?auto_1685 ?auto_1679 ?auto_1678 )
      ( FLY-1PPL-VERIFY ?auto_1679 ?auto_1678 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1687 - PERSON
      ?auto_1688 - PERSON
      ?auto_1686 - CITY
    )
    :vars
    (
      ?auto_1691 - FLEVEL
      ?auto_1692 - FLEVEL
      ?auto_1689 - CITY
      ?auto_1693 - CITY
      ?auto_1690 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1691 ?auto_1692 ) ( not ( = ?auto_1686 ?auto_1689 ) ) ( not ( = ?auto_1692 ?auto_1691 ) ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( PERSON-AT ?auto_1688 ?auto_1689 ) ( not ( = ?auto_1686 ?auto_1693 ) ) ( not ( = ?auto_1689 ?auto_1693 ) ) ( PERSON-AT ?auto_1687 ?auto_1693 ) ( AIRCRAFT-AT ?auto_1690 ?auto_1686 ) ( FUEL-LEVEL ?auto_1690 ?auto_1692 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1688 ?auto_1686 )
      ( FLY-2PPL-VERIFY ?auto_1687 ?auto_1688 ?auto_1686 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1695 - PERSON
      ?auto_1696 - PERSON
      ?auto_1694 - CITY
    )
    :vars
    (
      ?auto_1701 - FLEVEL
      ?auto_1697 - FLEVEL
      ?auto_1698 - CITY
      ?auto_1699 - CITY
      ?auto_1700 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1701 ?auto_1697 ) ( not ( = ?auto_1694 ?auto_1698 ) ) ( not ( = ?auto_1697 ?auto_1701 ) ) ( not ( = ?auto_1696 ?auto_1695 ) ) ( PERSON-AT ?auto_1695 ?auto_1698 ) ( not ( = ?auto_1694 ?auto_1699 ) ) ( not ( = ?auto_1698 ?auto_1699 ) ) ( PERSON-AT ?auto_1696 ?auto_1699 ) ( AIRCRAFT-AT ?auto_1700 ?auto_1694 ) ( FUEL-LEVEL ?auto_1700 ?auto_1697 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1696 ?auto_1695 ?auto_1694 )
      ( FLY-2PPL-VERIFY ?auto_1695 ?auto_1696 ?auto_1694 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1712 - PERSON
      ?auto_1711 - CITY
    )
    :vars
    (
      ?auto_1717 - FLEVEL
      ?auto_1713 - FLEVEL
      ?auto_1714 - CITY
      ?auto_1718 - PERSON
      ?auto_1715 - CITY
      ?auto_1716 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1717 ?auto_1713 ) ( not ( = ?auto_1711 ?auto_1714 ) ) ( not ( = ?auto_1713 ?auto_1717 ) ) ( not ( = ?auto_1718 ?auto_1712 ) ) ( PERSON-AT ?auto_1712 ?auto_1714 ) ( not ( = ?auto_1711 ?auto_1715 ) ) ( not ( = ?auto_1714 ?auto_1715 ) ) ( PERSON-AT ?auto_1718 ?auto_1715 ) ( AIRCRAFT-AT ?auto_1716 ?auto_1711 ) ( FUEL-LEVEL ?auto_1716 ?auto_1717 ) )
    :subtasks
    ( ( !REFUEL ?auto_1716 ?auto_1711 ?auto_1717 ?auto_1713 )
      ( FLY-2PPL ?auto_1718 ?auto_1712 ?auto_1711 )
      ( FLY-1PPL-VERIFY ?auto_1712 ?auto_1711 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1720 - PERSON
      ?auto_1721 - PERSON
      ?auto_1719 - CITY
    )
    :vars
    (
      ?auto_1726 - FLEVEL
      ?auto_1725 - FLEVEL
      ?auto_1723 - CITY
      ?auto_1722 - CITY
      ?auto_1724 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1726 ?auto_1725 ) ( not ( = ?auto_1719 ?auto_1723 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( not ( = ?auto_1720 ?auto_1721 ) ) ( PERSON-AT ?auto_1721 ?auto_1723 ) ( not ( = ?auto_1719 ?auto_1722 ) ) ( not ( = ?auto_1723 ?auto_1722 ) ) ( PERSON-AT ?auto_1720 ?auto_1722 ) ( AIRCRAFT-AT ?auto_1724 ?auto_1719 ) ( FUEL-LEVEL ?auto_1724 ?auto_1726 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1721 ?auto_1719 )
      ( FLY-2PPL-VERIFY ?auto_1720 ?auto_1721 ?auto_1719 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1728 - PERSON
      ?auto_1729 - PERSON
      ?auto_1727 - CITY
    )
    :vars
    (
      ?auto_1731 - FLEVEL
      ?auto_1733 - FLEVEL
      ?auto_1730 - CITY
      ?auto_1734 - CITY
      ?auto_1732 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1731 ?auto_1733 ) ( not ( = ?auto_1727 ?auto_1730 ) ) ( not ( = ?auto_1733 ?auto_1731 ) ) ( not ( = ?auto_1729 ?auto_1728 ) ) ( PERSON-AT ?auto_1728 ?auto_1730 ) ( not ( = ?auto_1727 ?auto_1734 ) ) ( not ( = ?auto_1730 ?auto_1734 ) ) ( PERSON-AT ?auto_1729 ?auto_1734 ) ( AIRCRAFT-AT ?auto_1732 ?auto_1727 ) ( FUEL-LEVEL ?auto_1732 ?auto_1731 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1729 ?auto_1728 ?auto_1727 )
      ( FLY-2PPL-VERIFY ?auto_1728 ?auto_1729 ?auto_1727 ) )
  )

)

