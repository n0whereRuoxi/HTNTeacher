( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1356 - DIRECTION
      ?auto_1357 - MODE
    )
    :vars
    (
      ?auto_1358 - INSTRUMENT
      ?auto_1359 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1358 ) ( ON_BOARD ?auto_1358 ?auto_1359 ) ( SUPPORTS ?auto_1358 ?auto_1357 ) ( POWER_ON ?auto_1358 ) ( POINTING ?auto_1359 ?auto_1356 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1359 ?auto_1356 ?auto_1358 ?auto_1357 )
      ( GET-1IMAGE-VERIFY ?auto_1356 ?auto_1357 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1366 - DIRECTION
      ?auto_1367 - MODE
    )
    :vars
    (
      ?auto_1368 - INSTRUMENT
      ?auto_1369 - SATELLITE
      ?auto_1370 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1368 ) ( ON_BOARD ?auto_1368 ?auto_1369 ) ( SUPPORTS ?auto_1368 ?auto_1367 ) ( POWER_ON ?auto_1368 ) ( POINTING ?auto_1369 ?auto_1370 ) ( not ( = ?auto_1366 ?auto_1370 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1369 ?auto_1366 ?auto_1370 )
      ( GET-1IMAGE ?auto_1366 ?auto_1367 )
      ( GET-1IMAGE-VERIFY ?auto_1366 ?auto_1367 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1378 - DIRECTION
      ?auto_1379 - MODE
    )
    :vars
    (
      ?auto_1380 - INSTRUMENT
      ?auto_1382 - SATELLITE
      ?auto_1381 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1380 ?auto_1382 ) ( SUPPORTS ?auto_1380 ?auto_1379 ) ( POWER_ON ?auto_1380 ) ( POINTING ?auto_1382 ?auto_1381 ) ( not ( = ?auto_1378 ?auto_1381 ) ) ( CALIBRATION_TARGET ?auto_1380 ?auto_1381 ) ( NOT_CALIBRATED ?auto_1380 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1382 ?auto_1380 ?auto_1381 )
      ( GET-1IMAGE ?auto_1378 ?auto_1379 )
      ( GET-1IMAGE-VERIFY ?auto_1378 ?auto_1379 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1390 - DIRECTION
      ?auto_1391 - MODE
    )
    :vars
    (
      ?auto_1393 - INSTRUMENT
      ?auto_1392 - SATELLITE
      ?auto_1394 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1393 ?auto_1392 ) ( SUPPORTS ?auto_1393 ?auto_1391 ) ( POINTING ?auto_1392 ?auto_1394 ) ( not ( = ?auto_1390 ?auto_1394 ) ) ( CALIBRATION_TARGET ?auto_1393 ?auto_1394 ) ( POWER_AVAIL ?auto_1392 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1393 ?auto_1392 )
      ( GET-1IMAGE ?auto_1390 ?auto_1391 )
      ( GET-1IMAGE-VERIFY ?auto_1390 ?auto_1391 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1402 - DIRECTION
      ?auto_1403 - MODE
    )
    :vars
    (
      ?auto_1404 - INSTRUMENT
      ?auto_1405 - SATELLITE
      ?auto_1406 - DIRECTION
      ?auto_1407 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1404 ?auto_1405 ) ( SUPPORTS ?auto_1404 ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1406 ) ) ( CALIBRATION_TARGET ?auto_1404 ?auto_1406 ) ( POWER_AVAIL ?auto_1405 ) ( POINTING ?auto_1405 ?auto_1407 ) ( not ( = ?auto_1406 ?auto_1407 ) ) ( not ( = ?auto_1402 ?auto_1407 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1405 ?auto_1406 ?auto_1407 )
      ( GET-1IMAGE ?auto_1402 ?auto_1403 )
      ( GET-1IMAGE-VERIFY ?auto_1402 ?auto_1403 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1435 - DIRECTION
      ?auto_1436 - MODE
      ?auto_1437 - DIRECTION
      ?auto_1434 - MODE
    )
    :vars
    (
      ?auto_1438 - INSTRUMENT
      ?auto_1439 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1437 ?auto_1435 ) ) ( CALIBRATED ?auto_1438 ) ( ON_BOARD ?auto_1438 ?auto_1439 ) ( SUPPORTS ?auto_1438 ?auto_1434 ) ( POWER_ON ?auto_1438 ) ( POINTING ?auto_1439 ?auto_1437 ) ( HAVE_IMAGE ?auto_1435 ?auto_1436 ) ( not ( = ?auto_1436 ?auto_1434 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1437 ?auto_1434 )
      ( GET-2IMAGE-VERIFY ?auto_1435 ?auto_1436 ?auto_1437 ?auto_1434 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1441 - DIRECTION
      ?auto_1442 - MODE
      ?auto_1443 - DIRECTION
      ?auto_1440 - MODE
    )
    :vars
    (
      ?auto_1444 - INSTRUMENT
      ?auto_1445 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1443 ?auto_1441 ) ) ( CALIBRATED ?auto_1444 ) ( ON_BOARD ?auto_1444 ?auto_1445 ) ( SUPPORTS ?auto_1444 ?auto_1442 ) ( POWER_ON ?auto_1444 ) ( POINTING ?auto_1445 ?auto_1441 ) ( HAVE_IMAGE ?auto_1443 ?auto_1440 ) ( not ( = ?auto_1442 ?auto_1440 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1441 ?auto_1442 )
      ( GET-2IMAGE-VERIFY ?auto_1441 ?auto_1442 ?auto_1443 ?auto_1440 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1458 - DIRECTION
      ?auto_1459 - MODE
      ?auto_1460 - DIRECTION
      ?auto_1457 - MODE
    )
    :vars
    (
      ?auto_1461 - INSTRUMENT
      ?auto_1463 - SATELLITE
      ?auto_1462 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1460 ?auto_1458 ) ) ( CALIBRATED ?auto_1461 ) ( ON_BOARD ?auto_1461 ?auto_1463 ) ( SUPPORTS ?auto_1461 ?auto_1457 ) ( POWER_ON ?auto_1461 ) ( POINTING ?auto_1463 ?auto_1462 ) ( not ( = ?auto_1460 ?auto_1462 ) ) ( HAVE_IMAGE ?auto_1458 ?auto_1459 ) ( not ( = ?auto_1458 ?auto_1462 ) ) ( not ( = ?auto_1459 ?auto_1457 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1460 ?auto_1457 )
      ( GET-2IMAGE-VERIFY ?auto_1458 ?auto_1459 ?auto_1460 ?auto_1457 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1465 - DIRECTION
      ?auto_1466 - MODE
      ?auto_1467 - DIRECTION
      ?auto_1464 - MODE
    )
    :vars
    (
      ?auto_1469 - INSTRUMENT
      ?auto_1470 - SATELLITE
      ?auto_1468 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1467 ?auto_1465 ) ) ( CALIBRATED ?auto_1469 ) ( ON_BOARD ?auto_1469 ?auto_1470 ) ( SUPPORTS ?auto_1469 ?auto_1466 ) ( POWER_ON ?auto_1469 ) ( POINTING ?auto_1470 ?auto_1468 ) ( not ( = ?auto_1465 ?auto_1468 ) ) ( HAVE_IMAGE ?auto_1467 ?auto_1464 ) ( not ( = ?auto_1467 ?auto_1468 ) ) ( not ( = ?auto_1464 ?auto_1466 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1467 ?auto_1464 ?auto_1465 ?auto_1466 )
      ( GET-2IMAGE-VERIFY ?auto_1465 ?auto_1466 ?auto_1467 ?auto_1464 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1480 - DIRECTION
      ?auto_1481 - MODE
    )
    :vars
    (
      ?auto_1485 - DIRECTION
      ?auto_1484 - INSTRUMENT
      ?auto_1486 - SATELLITE
      ?auto_1482 - DIRECTION
      ?auto_1483 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1480 ?auto_1485 ) ) ( ON_BOARD ?auto_1484 ?auto_1486 ) ( SUPPORTS ?auto_1484 ?auto_1481 ) ( POWER_ON ?auto_1484 ) ( POINTING ?auto_1486 ?auto_1482 ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( HAVE_IMAGE ?auto_1485 ?auto_1483 ) ( not ( = ?auto_1485 ?auto_1482 ) ) ( not ( = ?auto_1483 ?auto_1481 ) ) ( CALIBRATION_TARGET ?auto_1484 ?auto_1482 ) ( NOT_CALIBRATED ?auto_1484 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1486 ?auto_1484 ?auto_1482 )
      ( GET-2IMAGE ?auto_1485 ?auto_1483 ?auto_1480 ?auto_1481 )
      ( GET-1IMAGE-VERIFY ?auto_1480 ?auto_1481 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1488 - DIRECTION
      ?auto_1489 - MODE
      ?auto_1490 - DIRECTION
      ?auto_1487 - MODE
    )
    :vars
    (
      ?auto_1493 - INSTRUMENT
      ?auto_1491 - SATELLITE
      ?auto_1492 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1490 ?auto_1488 ) ) ( ON_BOARD ?auto_1493 ?auto_1491 ) ( SUPPORTS ?auto_1493 ?auto_1487 ) ( POWER_ON ?auto_1493 ) ( POINTING ?auto_1491 ?auto_1492 ) ( not ( = ?auto_1490 ?auto_1492 ) ) ( HAVE_IMAGE ?auto_1488 ?auto_1489 ) ( not ( = ?auto_1488 ?auto_1492 ) ) ( not ( = ?auto_1489 ?auto_1487 ) ) ( CALIBRATION_TARGET ?auto_1493 ?auto_1492 ) ( NOT_CALIBRATED ?auto_1493 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1490 ?auto_1487 )
      ( GET-2IMAGE-VERIFY ?auto_1488 ?auto_1489 ?auto_1490 ?auto_1487 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1495 - DIRECTION
      ?auto_1496 - MODE
      ?auto_1497 - DIRECTION
      ?auto_1494 - MODE
    )
    :vars
    (
      ?auto_1498 - INSTRUMENT
      ?auto_1499 - SATELLITE
      ?auto_1500 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1497 ?auto_1495 ) ) ( ON_BOARD ?auto_1498 ?auto_1499 ) ( SUPPORTS ?auto_1498 ?auto_1496 ) ( POWER_ON ?auto_1498 ) ( POINTING ?auto_1499 ?auto_1500 ) ( not ( = ?auto_1495 ?auto_1500 ) ) ( HAVE_IMAGE ?auto_1497 ?auto_1494 ) ( not ( = ?auto_1497 ?auto_1500 ) ) ( not ( = ?auto_1494 ?auto_1496 ) ) ( CALIBRATION_TARGET ?auto_1498 ?auto_1500 ) ( NOT_CALIBRATED ?auto_1498 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1497 ?auto_1494 ?auto_1495 ?auto_1496 )
      ( GET-2IMAGE-VERIFY ?auto_1495 ?auto_1496 ?auto_1497 ?auto_1494 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1510 - DIRECTION
      ?auto_1511 - MODE
    )
    :vars
    (
      ?auto_1514 - DIRECTION
      ?auto_1512 - INSTRUMENT
      ?auto_1513 - SATELLITE
      ?auto_1516 - DIRECTION
      ?auto_1515 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1510 ?auto_1514 ) ) ( ON_BOARD ?auto_1512 ?auto_1513 ) ( SUPPORTS ?auto_1512 ?auto_1511 ) ( POINTING ?auto_1513 ?auto_1516 ) ( not ( = ?auto_1510 ?auto_1516 ) ) ( HAVE_IMAGE ?auto_1514 ?auto_1515 ) ( not ( = ?auto_1514 ?auto_1516 ) ) ( not ( = ?auto_1515 ?auto_1511 ) ) ( CALIBRATION_TARGET ?auto_1512 ?auto_1516 ) ( POWER_AVAIL ?auto_1513 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1512 ?auto_1513 )
      ( GET-2IMAGE ?auto_1514 ?auto_1515 ?auto_1510 ?auto_1511 )
      ( GET-1IMAGE-VERIFY ?auto_1510 ?auto_1511 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1518 - DIRECTION
      ?auto_1519 - MODE
      ?auto_1520 - DIRECTION
      ?auto_1517 - MODE
    )
    :vars
    (
      ?auto_1523 - INSTRUMENT
      ?auto_1522 - SATELLITE
      ?auto_1521 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1520 ?auto_1518 ) ) ( ON_BOARD ?auto_1523 ?auto_1522 ) ( SUPPORTS ?auto_1523 ?auto_1517 ) ( POINTING ?auto_1522 ?auto_1521 ) ( not ( = ?auto_1520 ?auto_1521 ) ) ( HAVE_IMAGE ?auto_1518 ?auto_1519 ) ( not ( = ?auto_1518 ?auto_1521 ) ) ( not ( = ?auto_1519 ?auto_1517 ) ) ( CALIBRATION_TARGET ?auto_1523 ?auto_1521 ) ( POWER_AVAIL ?auto_1522 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1520 ?auto_1517 )
      ( GET-2IMAGE-VERIFY ?auto_1518 ?auto_1519 ?auto_1520 ?auto_1517 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1525 - DIRECTION
      ?auto_1526 - MODE
      ?auto_1527 - DIRECTION
      ?auto_1524 - MODE
    )
    :vars
    (
      ?auto_1530 - INSTRUMENT
      ?auto_1528 - SATELLITE
      ?auto_1529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1527 ?auto_1525 ) ) ( ON_BOARD ?auto_1530 ?auto_1528 ) ( SUPPORTS ?auto_1530 ?auto_1526 ) ( POINTING ?auto_1528 ?auto_1529 ) ( not ( = ?auto_1525 ?auto_1529 ) ) ( HAVE_IMAGE ?auto_1527 ?auto_1524 ) ( not ( = ?auto_1527 ?auto_1529 ) ) ( not ( = ?auto_1524 ?auto_1526 ) ) ( CALIBRATION_TARGET ?auto_1530 ?auto_1529 ) ( POWER_AVAIL ?auto_1528 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1527 ?auto_1524 ?auto_1525 ?auto_1526 )
      ( GET-2IMAGE-VERIFY ?auto_1525 ?auto_1526 ?auto_1527 ?auto_1524 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1540 - DIRECTION
      ?auto_1541 - MODE
    )
    :vars
    (
      ?auto_1545 - DIRECTION
      ?auto_1546 - INSTRUMENT
      ?auto_1542 - SATELLITE
      ?auto_1544 - DIRECTION
      ?auto_1543 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1540 ?auto_1545 ) ) ( ON_BOARD ?auto_1546 ?auto_1542 ) ( SUPPORTS ?auto_1546 ?auto_1541 ) ( not ( = ?auto_1540 ?auto_1544 ) ) ( HAVE_IMAGE ?auto_1545 ?auto_1543 ) ( not ( = ?auto_1545 ?auto_1544 ) ) ( not ( = ?auto_1543 ?auto_1541 ) ) ( CALIBRATION_TARGET ?auto_1546 ?auto_1544 ) ( POWER_AVAIL ?auto_1542 ) ( POINTING ?auto_1542 ?auto_1545 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1542 ?auto_1544 ?auto_1545 )
      ( GET-2IMAGE ?auto_1545 ?auto_1543 ?auto_1540 ?auto_1541 )
      ( GET-1IMAGE-VERIFY ?auto_1540 ?auto_1541 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1548 - DIRECTION
      ?auto_1549 - MODE
      ?auto_1550 - DIRECTION
      ?auto_1547 - MODE
    )
    :vars
    (
      ?auto_1553 - INSTRUMENT
      ?auto_1552 - SATELLITE
      ?auto_1551 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1550 ?auto_1548 ) ) ( ON_BOARD ?auto_1553 ?auto_1552 ) ( SUPPORTS ?auto_1553 ?auto_1547 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( HAVE_IMAGE ?auto_1548 ?auto_1549 ) ( not ( = ?auto_1548 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1547 ) ) ( CALIBRATION_TARGET ?auto_1553 ?auto_1551 ) ( POWER_AVAIL ?auto_1552 ) ( POINTING ?auto_1552 ?auto_1548 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1550 ?auto_1547 )
      ( GET-2IMAGE-VERIFY ?auto_1548 ?auto_1549 ?auto_1550 ?auto_1547 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1555 - DIRECTION
      ?auto_1556 - MODE
      ?auto_1557 - DIRECTION
      ?auto_1554 - MODE
    )
    :vars
    (
      ?auto_1560 - INSTRUMENT
      ?auto_1558 - SATELLITE
      ?auto_1559 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1557 ?auto_1555 ) ) ( ON_BOARD ?auto_1560 ?auto_1558 ) ( SUPPORTS ?auto_1560 ?auto_1556 ) ( not ( = ?auto_1555 ?auto_1559 ) ) ( HAVE_IMAGE ?auto_1557 ?auto_1554 ) ( not ( = ?auto_1557 ?auto_1559 ) ) ( not ( = ?auto_1554 ?auto_1556 ) ) ( CALIBRATION_TARGET ?auto_1560 ?auto_1559 ) ( POWER_AVAIL ?auto_1558 ) ( POINTING ?auto_1558 ?auto_1557 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1557 ?auto_1554 ?auto_1555 ?auto_1556 )
      ( GET-2IMAGE-VERIFY ?auto_1555 ?auto_1556 ?auto_1557 ?auto_1554 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1570 - DIRECTION
      ?auto_1571 - MODE
    )
    :vars
    (
      ?auto_1572 - DIRECTION
      ?auto_1576 - INSTRUMENT
      ?auto_1574 - SATELLITE
      ?auto_1575 - DIRECTION
      ?auto_1573 - MODE
      ?auto_1577 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1570 ?auto_1572 ) ) ( ON_BOARD ?auto_1576 ?auto_1574 ) ( SUPPORTS ?auto_1576 ?auto_1571 ) ( not ( = ?auto_1570 ?auto_1575 ) ) ( HAVE_IMAGE ?auto_1572 ?auto_1573 ) ( not ( = ?auto_1572 ?auto_1575 ) ) ( not ( = ?auto_1573 ?auto_1571 ) ) ( CALIBRATION_TARGET ?auto_1576 ?auto_1575 ) ( POINTING ?auto_1574 ?auto_1572 ) ( ON_BOARD ?auto_1577 ?auto_1574 ) ( POWER_ON ?auto_1577 ) ( not ( = ?auto_1576 ?auto_1577 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1577 ?auto_1574 )
      ( GET-2IMAGE ?auto_1572 ?auto_1573 ?auto_1570 ?auto_1571 )
      ( GET-1IMAGE-VERIFY ?auto_1570 ?auto_1571 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1579 - DIRECTION
      ?auto_1580 - MODE
      ?auto_1581 - DIRECTION
      ?auto_1578 - MODE
    )
    :vars
    (
      ?auto_1583 - INSTRUMENT
      ?auto_1585 - SATELLITE
      ?auto_1584 - DIRECTION
      ?auto_1582 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1581 ?auto_1579 ) ) ( ON_BOARD ?auto_1583 ?auto_1585 ) ( SUPPORTS ?auto_1583 ?auto_1578 ) ( not ( = ?auto_1581 ?auto_1584 ) ) ( HAVE_IMAGE ?auto_1579 ?auto_1580 ) ( not ( = ?auto_1579 ?auto_1584 ) ) ( not ( = ?auto_1580 ?auto_1578 ) ) ( CALIBRATION_TARGET ?auto_1583 ?auto_1584 ) ( POINTING ?auto_1585 ?auto_1579 ) ( ON_BOARD ?auto_1582 ?auto_1585 ) ( POWER_ON ?auto_1582 ) ( not ( = ?auto_1583 ?auto_1582 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1581 ?auto_1578 )
      ( GET-2IMAGE-VERIFY ?auto_1579 ?auto_1580 ?auto_1581 ?auto_1578 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1587 - DIRECTION
      ?auto_1588 - MODE
      ?auto_1589 - DIRECTION
      ?auto_1586 - MODE
    )
    :vars
    (
      ?auto_1591 - INSTRUMENT
      ?auto_1592 - SATELLITE
      ?auto_1590 - DIRECTION
      ?auto_1593 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1589 ?auto_1587 ) ) ( ON_BOARD ?auto_1591 ?auto_1592 ) ( SUPPORTS ?auto_1591 ?auto_1588 ) ( not ( = ?auto_1587 ?auto_1590 ) ) ( HAVE_IMAGE ?auto_1589 ?auto_1586 ) ( not ( = ?auto_1589 ?auto_1590 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( CALIBRATION_TARGET ?auto_1591 ?auto_1590 ) ( POINTING ?auto_1592 ?auto_1589 ) ( ON_BOARD ?auto_1593 ?auto_1592 ) ( POWER_ON ?auto_1593 ) ( not ( = ?auto_1591 ?auto_1593 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1589 ?auto_1586 ?auto_1587 ?auto_1588 )
      ( GET-2IMAGE-VERIFY ?auto_1587 ?auto_1588 ?auto_1589 ?auto_1586 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1604 - DIRECTION
      ?auto_1605 - MODE
    )
    :vars
    (
      ?auto_1609 - DIRECTION
      ?auto_1608 - INSTRUMENT
      ?auto_1610 - SATELLITE
      ?auto_1606 - DIRECTION
      ?auto_1607 - MODE
      ?auto_1611 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1604 ?auto_1609 ) ) ( ON_BOARD ?auto_1608 ?auto_1610 ) ( SUPPORTS ?auto_1608 ?auto_1605 ) ( not ( = ?auto_1604 ?auto_1606 ) ) ( not ( = ?auto_1609 ?auto_1606 ) ) ( not ( = ?auto_1607 ?auto_1605 ) ) ( CALIBRATION_TARGET ?auto_1608 ?auto_1606 ) ( POINTING ?auto_1610 ?auto_1609 ) ( ON_BOARD ?auto_1611 ?auto_1610 ) ( POWER_ON ?auto_1611 ) ( not ( = ?auto_1608 ?auto_1611 ) ) ( CALIBRATED ?auto_1611 ) ( SUPPORTS ?auto_1611 ?auto_1607 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1609 ?auto_1607 )
      ( GET-2IMAGE ?auto_1609 ?auto_1607 ?auto_1604 ?auto_1605 )
      ( GET-1IMAGE-VERIFY ?auto_1604 ?auto_1605 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1613 - DIRECTION
      ?auto_1614 - MODE
      ?auto_1615 - DIRECTION
      ?auto_1612 - MODE
    )
    :vars
    (
      ?auto_1619 - INSTRUMENT
      ?auto_1617 - SATELLITE
      ?auto_1618 - DIRECTION
      ?auto_1616 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1615 ?auto_1613 ) ) ( ON_BOARD ?auto_1619 ?auto_1617 ) ( SUPPORTS ?auto_1619 ?auto_1612 ) ( not ( = ?auto_1615 ?auto_1618 ) ) ( not ( = ?auto_1613 ?auto_1618 ) ) ( not ( = ?auto_1614 ?auto_1612 ) ) ( CALIBRATION_TARGET ?auto_1619 ?auto_1618 ) ( POINTING ?auto_1617 ?auto_1613 ) ( ON_BOARD ?auto_1616 ?auto_1617 ) ( POWER_ON ?auto_1616 ) ( not ( = ?auto_1619 ?auto_1616 ) ) ( CALIBRATED ?auto_1616 ) ( SUPPORTS ?auto_1616 ?auto_1614 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1615 ?auto_1612 )
      ( GET-2IMAGE-VERIFY ?auto_1613 ?auto_1614 ?auto_1615 ?auto_1612 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1621 - DIRECTION
      ?auto_1622 - MODE
      ?auto_1623 - DIRECTION
      ?auto_1620 - MODE
    )
    :vars
    (
      ?auto_1627 - INSTRUMENT
      ?auto_1625 - SATELLITE
      ?auto_1626 - DIRECTION
      ?auto_1624 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1623 ?auto_1621 ) ) ( ON_BOARD ?auto_1627 ?auto_1625 ) ( SUPPORTS ?auto_1627 ?auto_1622 ) ( not ( = ?auto_1621 ?auto_1626 ) ) ( not ( = ?auto_1623 ?auto_1626 ) ) ( not ( = ?auto_1620 ?auto_1622 ) ) ( CALIBRATION_TARGET ?auto_1627 ?auto_1626 ) ( POINTING ?auto_1625 ?auto_1623 ) ( ON_BOARD ?auto_1624 ?auto_1625 ) ( POWER_ON ?auto_1624 ) ( not ( = ?auto_1627 ?auto_1624 ) ) ( CALIBRATED ?auto_1624 ) ( SUPPORTS ?auto_1624 ?auto_1620 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1623 ?auto_1620 ?auto_1621 ?auto_1622 )
      ( GET-2IMAGE-VERIFY ?auto_1621 ?auto_1622 ?auto_1623 ?auto_1620 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1638 - DIRECTION
      ?auto_1639 - MODE
    )
    :vars
    (
      ?auto_1640 - DIRECTION
      ?auto_1644 - INSTRUMENT
      ?auto_1642 - SATELLITE
      ?auto_1643 - DIRECTION
      ?auto_1645 - MODE
      ?auto_1641 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1638 ?auto_1640 ) ) ( ON_BOARD ?auto_1644 ?auto_1642 ) ( SUPPORTS ?auto_1644 ?auto_1639 ) ( not ( = ?auto_1638 ?auto_1643 ) ) ( not ( = ?auto_1640 ?auto_1643 ) ) ( not ( = ?auto_1645 ?auto_1639 ) ) ( CALIBRATION_TARGET ?auto_1644 ?auto_1643 ) ( ON_BOARD ?auto_1641 ?auto_1642 ) ( POWER_ON ?auto_1641 ) ( not ( = ?auto_1644 ?auto_1641 ) ) ( CALIBRATED ?auto_1641 ) ( SUPPORTS ?auto_1641 ?auto_1645 ) ( POINTING ?auto_1642 ?auto_1643 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1642 ?auto_1640 ?auto_1643 )
      ( GET-2IMAGE ?auto_1640 ?auto_1645 ?auto_1638 ?auto_1639 )
      ( GET-1IMAGE-VERIFY ?auto_1638 ?auto_1639 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1647 - DIRECTION
      ?auto_1648 - MODE
      ?auto_1649 - DIRECTION
      ?auto_1646 - MODE
    )
    :vars
    (
      ?auto_1653 - INSTRUMENT
      ?auto_1651 - SATELLITE
      ?auto_1650 - DIRECTION
      ?auto_1652 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1649 ?auto_1647 ) ) ( ON_BOARD ?auto_1653 ?auto_1651 ) ( SUPPORTS ?auto_1653 ?auto_1646 ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1647 ?auto_1650 ) ) ( not ( = ?auto_1648 ?auto_1646 ) ) ( CALIBRATION_TARGET ?auto_1653 ?auto_1650 ) ( ON_BOARD ?auto_1652 ?auto_1651 ) ( POWER_ON ?auto_1652 ) ( not ( = ?auto_1653 ?auto_1652 ) ) ( CALIBRATED ?auto_1652 ) ( SUPPORTS ?auto_1652 ?auto_1648 ) ( POINTING ?auto_1651 ?auto_1650 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1649 ?auto_1646 )
      ( GET-2IMAGE-VERIFY ?auto_1647 ?auto_1648 ?auto_1649 ?auto_1646 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1655 - DIRECTION
      ?auto_1656 - MODE
      ?auto_1657 - DIRECTION
      ?auto_1654 - MODE
    )
    :vars
    (
      ?auto_1659 - INSTRUMENT
      ?auto_1660 - SATELLITE
      ?auto_1658 - DIRECTION
      ?auto_1661 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1657 ?auto_1655 ) ) ( ON_BOARD ?auto_1659 ?auto_1660 ) ( SUPPORTS ?auto_1659 ?auto_1656 ) ( not ( = ?auto_1655 ?auto_1658 ) ) ( not ( = ?auto_1657 ?auto_1658 ) ) ( not ( = ?auto_1654 ?auto_1656 ) ) ( CALIBRATION_TARGET ?auto_1659 ?auto_1658 ) ( ON_BOARD ?auto_1661 ?auto_1660 ) ( POWER_ON ?auto_1661 ) ( not ( = ?auto_1659 ?auto_1661 ) ) ( CALIBRATED ?auto_1661 ) ( SUPPORTS ?auto_1661 ?auto_1654 ) ( POINTING ?auto_1660 ?auto_1658 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1657 ?auto_1654 ?auto_1655 ?auto_1656 )
      ( GET-2IMAGE-VERIFY ?auto_1655 ?auto_1656 ?auto_1657 ?auto_1654 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1672 - DIRECTION
      ?auto_1673 - MODE
    )
    :vars
    (
      ?auto_1678 - DIRECTION
      ?auto_1675 - INSTRUMENT
      ?auto_1676 - SATELLITE
      ?auto_1674 - DIRECTION
      ?auto_1677 - MODE
      ?auto_1679 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1672 ?auto_1678 ) ) ( ON_BOARD ?auto_1675 ?auto_1676 ) ( SUPPORTS ?auto_1675 ?auto_1673 ) ( not ( = ?auto_1672 ?auto_1674 ) ) ( not ( = ?auto_1678 ?auto_1674 ) ) ( not ( = ?auto_1677 ?auto_1673 ) ) ( CALIBRATION_TARGET ?auto_1675 ?auto_1674 ) ( ON_BOARD ?auto_1679 ?auto_1676 ) ( POWER_ON ?auto_1679 ) ( not ( = ?auto_1675 ?auto_1679 ) ) ( SUPPORTS ?auto_1679 ?auto_1677 ) ( POINTING ?auto_1676 ?auto_1674 ) ( CALIBRATION_TARGET ?auto_1679 ?auto_1674 ) ( NOT_CALIBRATED ?auto_1679 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1676 ?auto_1679 ?auto_1674 )
      ( GET-2IMAGE ?auto_1678 ?auto_1677 ?auto_1672 ?auto_1673 )
      ( GET-1IMAGE-VERIFY ?auto_1672 ?auto_1673 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1681 - DIRECTION
      ?auto_1682 - MODE
      ?auto_1683 - DIRECTION
      ?auto_1680 - MODE
    )
    :vars
    (
      ?auto_1684 - INSTRUMENT
      ?auto_1685 - SATELLITE
      ?auto_1686 - DIRECTION
      ?auto_1687 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1683 ?auto_1681 ) ) ( ON_BOARD ?auto_1684 ?auto_1685 ) ( SUPPORTS ?auto_1684 ?auto_1680 ) ( not ( = ?auto_1683 ?auto_1686 ) ) ( not ( = ?auto_1681 ?auto_1686 ) ) ( not ( = ?auto_1682 ?auto_1680 ) ) ( CALIBRATION_TARGET ?auto_1684 ?auto_1686 ) ( ON_BOARD ?auto_1687 ?auto_1685 ) ( POWER_ON ?auto_1687 ) ( not ( = ?auto_1684 ?auto_1687 ) ) ( SUPPORTS ?auto_1687 ?auto_1682 ) ( POINTING ?auto_1685 ?auto_1686 ) ( CALIBRATION_TARGET ?auto_1687 ?auto_1686 ) ( NOT_CALIBRATED ?auto_1687 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1683 ?auto_1680 )
      ( GET-2IMAGE-VERIFY ?auto_1681 ?auto_1682 ?auto_1683 ?auto_1680 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1689 - DIRECTION
      ?auto_1690 - MODE
      ?auto_1691 - DIRECTION
      ?auto_1688 - MODE
    )
    :vars
    (
      ?auto_1693 - INSTRUMENT
      ?auto_1694 - SATELLITE
      ?auto_1695 - DIRECTION
      ?auto_1692 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1691 ?auto_1689 ) ) ( ON_BOARD ?auto_1693 ?auto_1694 ) ( SUPPORTS ?auto_1693 ?auto_1690 ) ( not ( = ?auto_1689 ?auto_1695 ) ) ( not ( = ?auto_1691 ?auto_1695 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( CALIBRATION_TARGET ?auto_1693 ?auto_1695 ) ( ON_BOARD ?auto_1692 ?auto_1694 ) ( POWER_ON ?auto_1692 ) ( not ( = ?auto_1693 ?auto_1692 ) ) ( SUPPORTS ?auto_1692 ?auto_1688 ) ( POINTING ?auto_1694 ?auto_1695 ) ( CALIBRATION_TARGET ?auto_1692 ?auto_1695 ) ( NOT_CALIBRATED ?auto_1692 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1691 ?auto_1688 ?auto_1689 ?auto_1690 )
      ( GET-2IMAGE-VERIFY ?auto_1689 ?auto_1690 ?auto_1691 ?auto_1688 ) )
  )

)

