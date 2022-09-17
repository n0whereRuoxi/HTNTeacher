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
      ?auto_1369 - INSTRUMENT
      ?auto_1368 - SATELLITE
      ?auto_1370 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1369 ) ( ON_BOARD ?auto_1369 ?auto_1368 ) ( SUPPORTS ?auto_1369 ?auto_1367 ) ( POWER_ON ?auto_1369 ) ( POINTING ?auto_1368 ?auto_1370 ) ( not ( = ?auto_1366 ?auto_1370 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1368 ?auto_1366 ?auto_1370 )
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
      ?auto_1394 - INSTRUMENT
      ?auto_1392 - SATELLITE
      ?auto_1393 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1394 ?auto_1392 ) ( SUPPORTS ?auto_1394 ?auto_1391 ) ( POINTING ?auto_1392 ?auto_1393 ) ( not ( = ?auto_1390 ?auto_1393 ) ) ( CALIBRATION_TARGET ?auto_1394 ?auto_1393 ) ( POWER_AVAIL ?auto_1392 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1394 ?auto_1392 )
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
      ?auto_1406 - INSTRUMENT
      ?auto_1405 - SATELLITE
      ?auto_1404 - DIRECTION
      ?auto_1407 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1406 ?auto_1405 ) ( SUPPORTS ?auto_1406 ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( CALIBRATION_TARGET ?auto_1406 ?auto_1404 ) ( POWER_AVAIL ?auto_1405 ) ( POINTING ?auto_1405 ?auto_1407 ) ( not ( = ?auto_1404 ?auto_1407 ) ) ( not ( = ?auto_1402 ?auto_1407 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1405 ?auto_1404 ?auto_1407 )
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
    ( and ( CALIBRATED ?auto_1438 ) ( ON_BOARD ?auto_1438 ?auto_1439 ) ( SUPPORTS ?auto_1438 ?auto_1434 ) ( POWER_ON ?auto_1438 ) ( POINTING ?auto_1439 ?auto_1437 ) ( HAVE_IMAGE ?auto_1435 ?auto_1436 ) ( not ( = ?auto_1435 ?auto_1437 ) ) ( not ( = ?auto_1436 ?auto_1434 ) ) )
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
    ( and ( CALIBRATED ?auto_1444 ) ( ON_BOARD ?auto_1444 ?auto_1445 ) ( SUPPORTS ?auto_1444 ?auto_1442 ) ( POWER_ON ?auto_1444 ) ( POINTING ?auto_1445 ?auto_1441 ) ( HAVE_IMAGE ?auto_1443 ?auto_1440 ) ( not ( = ?auto_1441 ?auto_1443 ) ) ( not ( = ?auto_1442 ?auto_1440 ) ) )
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
    ( and ( CALIBRATED ?auto_1461 ) ( ON_BOARD ?auto_1461 ?auto_1463 ) ( SUPPORTS ?auto_1461 ?auto_1457 ) ( POWER_ON ?auto_1461 ) ( POINTING ?auto_1463 ?auto_1462 ) ( not ( = ?auto_1460 ?auto_1462 ) ) ( HAVE_IMAGE ?auto_1458 ?auto_1459 ) ( not ( = ?auto_1458 ?auto_1460 ) ) ( not ( = ?auto_1458 ?auto_1462 ) ) ( not ( = ?auto_1459 ?auto_1457 ) ) )
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
    ( and ( CALIBRATED ?auto_1469 ) ( ON_BOARD ?auto_1469 ?auto_1470 ) ( SUPPORTS ?auto_1469 ?auto_1466 ) ( POWER_ON ?auto_1469 ) ( POINTING ?auto_1470 ?auto_1468 ) ( not ( = ?auto_1465 ?auto_1468 ) ) ( HAVE_IMAGE ?auto_1467 ?auto_1464 ) ( not ( = ?auto_1467 ?auto_1465 ) ) ( not ( = ?auto_1467 ?auto_1468 ) ) ( not ( = ?auto_1464 ?auto_1466 ) ) )
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
      ?auto_1483 - INSTRUMENT
      ?auto_1486 - SATELLITE
      ?auto_1482 - DIRECTION
      ?auto_1485 - DIRECTION
      ?auto_1484 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1483 ?auto_1486 ) ( SUPPORTS ?auto_1483 ?auto_1481 ) ( POWER_ON ?auto_1483 ) ( POINTING ?auto_1486 ?auto_1482 ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( HAVE_IMAGE ?auto_1485 ?auto_1484 ) ( not ( = ?auto_1485 ?auto_1480 ) ) ( not ( = ?auto_1485 ?auto_1482 ) ) ( not ( = ?auto_1484 ?auto_1481 ) ) ( CALIBRATION_TARGET ?auto_1483 ?auto_1482 ) ( NOT_CALIBRATED ?auto_1483 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1486 ?auto_1483 ?auto_1482 )
      ( GET-2IMAGE ?auto_1485 ?auto_1484 ?auto_1480 ?auto_1481 )
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
      ?auto_1491 - INSTRUMENT
      ?auto_1492 - SATELLITE
      ?auto_1493 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1491 ?auto_1492 ) ( SUPPORTS ?auto_1491 ?auto_1487 ) ( POWER_ON ?auto_1491 ) ( POINTING ?auto_1492 ?auto_1493 ) ( not ( = ?auto_1490 ?auto_1493 ) ) ( HAVE_IMAGE ?auto_1488 ?auto_1489 ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( not ( = ?auto_1488 ?auto_1493 ) ) ( not ( = ?auto_1489 ?auto_1487 ) ) ( CALIBRATION_TARGET ?auto_1491 ?auto_1493 ) ( NOT_CALIBRATED ?auto_1491 ) )
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
      ?auto_1500 - INSTRUMENT
      ?auto_1498 - SATELLITE
      ?auto_1499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1500 ?auto_1498 ) ( SUPPORTS ?auto_1500 ?auto_1496 ) ( POWER_ON ?auto_1500 ) ( POINTING ?auto_1498 ?auto_1499 ) ( not ( = ?auto_1495 ?auto_1499 ) ) ( HAVE_IMAGE ?auto_1497 ?auto_1494 ) ( not ( = ?auto_1497 ?auto_1495 ) ) ( not ( = ?auto_1497 ?auto_1499 ) ) ( not ( = ?auto_1494 ?auto_1496 ) ) ( CALIBRATION_TARGET ?auto_1500 ?auto_1499 ) ( NOT_CALIBRATED ?auto_1500 ) )
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
      ?auto_1515 - INSTRUMENT
      ?auto_1513 - SATELLITE
      ?auto_1514 - DIRECTION
      ?auto_1516 - DIRECTION
      ?auto_1512 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1515 ?auto_1513 ) ( SUPPORTS ?auto_1515 ?auto_1511 ) ( POINTING ?auto_1513 ?auto_1514 ) ( not ( = ?auto_1510 ?auto_1514 ) ) ( HAVE_IMAGE ?auto_1516 ?auto_1512 ) ( not ( = ?auto_1516 ?auto_1510 ) ) ( not ( = ?auto_1516 ?auto_1514 ) ) ( not ( = ?auto_1512 ?auto_1511 ) ) ( CALIBRATION_TARGET ?auto_1515 ?auto_1514 ) ( POWER_AVAIL ?auto_1513 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1515 ?auto_1513 )
      ( GET-2IMAGE ?auto_1516 ?auto_1512 ?auto_1510 ?auto_1511 )
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
    ( and ( ON_BOARD ?auto_1523 ?auto_1522 ) ( SUPPORTS ?auto_1523 ?auto_1517 ) ( POINTING ?auto_1522 ?auto_1521 ) ( not ( = ?auto_1520 ?auto_1521 ) ) ( HAVE_IMAGE ?auto_1518 ?auto_1519 ) ( not ( = ?auto_1518 ?auto_1520 ) ) ( not ( = ?auto_1518 ?auto_1521 ) ) ( not ( = ?auto_1519 ?auto_1517 ) ) ( CALIBRATION_TARGET ?auto_1523 ?auto_1521 ) ( POWER_AVAIL ?auto_1522 ) )
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
      ?auto_1529 - INSTRUMENT
      ?auto_1528 - SATELLITE
      ?auto_1530 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1529 ?auto_1528 ) ( SUPPORTS ?auto_1529 ?auto_1526 ) ( POINTING ?auto_1528 ?auto_1530 ) ( not ( = ?auto_1525 ?auto_1530 ) ) ( HAVE_IMAGE ?auto_1527 ?auto_1524 ) ( not ( = ?auto_1527 ?auto_1525 ) ) ( not ( = ?auto_1527 ?auto_1530 ) ) ( not ( = ?auto_1524 ?auto_1526 ) ) ( CALIBRATION_TARGET ?auto_1529 ?auto_1530 ) ( POWER_AVAIL ?auto_1528 ) )
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
      ?auto_1545 - INSTRUMENT
      ?auto_1543 - SATELLITE
      ?auto_1546 - DIRECTION
      ?auto_1544 - DIRECTION
      ?auto_1542 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1545 ?auto_1543 ) ( SUPPORTS ?auto_1545 ?auto_1541 ) ( not ( = ?auto_1540 ?auto_1546 ) ) ( HAVE_IMAGE ?auto_1544 ?auto_1542 ) ( not ( = ?auto_1544 ?auto_1540 ) ) ( not ( = ?auto_1544 ?auto_1546 ) ) ( not ( = ?auto_1542 ?auto_1541 ) ) ( CALIBRATION_TARGET ?auto_1545 ?auto_1546 ) ( POWER_AVAIL ?auto_1543 ) ( POINTING ?auto_1543 ?auto_1544 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1543 ?auto_1546 ?auto_1544 )
      ( GET-2IMAGE ?auto_1544 ?auto_1542 ?auto_1540 ?auto_1541 )
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
    ( and ( ON_BOARD ?auto_1553 ?auto_1552 ) ( SUPPORTS ?auto_1553 ?auto_1547 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( HAVE_IMAGE ?auto_1548 ?auto_1549 ) ( not ( = ?auto_1548 ?auto_1550 ) ) ( not ( = ?auto_1548 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1547 ) ) ( CALIBRATION_TARGET ?auto_1553 ?auto_1551 ) ( POWER_AVAIL ?auto_1552 ) ( POINTING ?auto_1552 ?auto_1548 ) )
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
      ?auto_1558 - INSTRUMENT
      ?auto_1559 - SATELLITE
      ?auto_1560 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1558 ?auto_1559 ) ( SUPPORTS ?auto_1558 ?auto_1556 ) ( not ( = ?auto_1555 ?auto_1560 ) ) ( HAVE_IMAGE ?auto_1557 ?auto_1554 ) ( not ( = ?auto_1557 ?auto_1555 ) ) ( not ( = ?auto_1557 ?auto_1560 ) ) ( not ( = ?auto_1554 ?auto_1556 ) ) ( CALIBRATION_TARGET ?auto_1558 ?auto_1560 ) ( POWER_AVAIL ?auto_1559 ) ( POINTING ?auto_1559 ?auto_1557 ) )
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
      ?auto_1572 - INSTRUMENT
      ?auto_1573 - SATELLITE
      ?auto_1576 - DIRECTION
      ?auto_1575 - DIRECTION
      ?auto_1574 - MODE
      ?auto_1577 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1572 ?auto_1573 ) ( SUPPORTS ?auto_1572 ?auto_1571 ) ( not ( = ?auto_1570 ?auto_1576 ) ) ( HAVE_IMAGE ?auto_1575 ?auto_1574 ) ( not ( = ?auto_1575 ?auto_1570 ) ) ( not ( = ?auto_1575 ?auto_1576 ) ) ( not ( = ?auto_1574 ?auto_1571 ) ) ( CALIBRATION_TARGET ?auto_1572 ?auto_1576 ) ( POINTING ?auto_1573 ?auto_1575 ) ( ON_BOARD ?auto_1577 ?auto_1573 ) ( POWER_ON ?auto_1577 ) ( not ( = ?auto_1572 ?auto_1577 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1577 ?auto_1573 )
      ( GET-2IMAGE ?auto_1575 ?auto_1574 ?auto_1570 ?auto_1571 )
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
      ?auto_1585 - INSTRUMENT
      ?auto_1583 - SATELLITE
      ?auto_1582 - DIRECTION
      ?auto_1584 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1585 ?auto_1583 ) ( SUPPORTS ?auto_1585 ?auto_1578 ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( HAVE_IMAGE ?auto_1579 ?auto_1580 ) ( not ( = ?auto_1579 ?auto_1581 ) ) ( not ( = ?auto_1579 ?auto_1582 ) ) ( not ( = ?auto_1580 ?auto_1578 ) ) ( CALIBRATION_TARGET ?auto_1585 ?auto_1582 ) ( POINTING ?auto_1583 ?auto_1579 ) ( ON_BOARD ?auto_1584 ?auto_1583 ) ( POWER_ON ?auto_1584 ) ( not ( = ?auto_1585 ?auto_1584 ) ) )
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
      ?auto_1592 - INSTRUMENT
      ?auto_1593 - SATELLITE
      ?auto_1591 - DIRECTION
      ?auto_1590 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1592 ?auto_1593 ) ( SUPPORTS ?auto_1592 ?auto_1588 ) ( not ( = ?auto_1587 ?auto_1591 ) ) ( HAVE_IMAGE ?auto_1589 ?auto_1586 ) ( not ( = ?auto_1589 ?auto_1587 ) ) ( not ( = ?auto_1589 ?auto_1591 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( CALIBRATION_TARGET ?auto_1592 ?auto_1591 ) ( POINTING ?auto_1593 ?auto_1589 ) ( ON_BOARD ?auto_1590 ?auto_1593 ) ( POWER_ON ?auto_1590 ) ( not ( = ?auto_1592 ?auto_1590 ) ) )
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
      ?auto_1610 - INSTRUMENT
      ?auto_1611 - SATELLITE
      ?auto_1607 - DIRECTION
      ?auto_1608 - DIRECTION
      ?auto_1609 - MODE
      ?auto_1606 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1610 ?auto_1611 ) ( SUPPORTS ?auto_1610 ?auto_1605 ) ( not ( = ?auto_1604 ?auto_1607 ) ) ( not ( = ?auto_1608 ?auto_1604 ) ) ( not ( = ?auto_1608 ?auto_1607 ) ) ( not ( = ?auto_1609 ?auto_1605 ) ) ( CALIBRATION_TARGET ?auto_1610 ?auto_1607 ) ( POINTING ?auto_1611 ?auto_1608 ) ( ON_BOARD ?auto_1606 ?auto_1611 ) ( POWER_ON ?auto_1606 ) ( not ( = ?auto_1610 ?auto_1606 ) ) ( CALIBRATED ?auto_1606 ) ( SUPPORTS ?auto_1606 ?auto_1609 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1608 ?auto_1609 )
      ( GET-2IMAGE ?auto_1608 ?auto_1609 ?auto_1604 ?auto_1605 )
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
      ?auto_1616 - INSTRUMENT
      ?auto_1619 - SATELLITE
      ?auto_1617 - DIRECTION
      ?auto_1618 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1616 ?auto_1619 ) ( SUPPORTS ?auto_1616 ?auto_1612 ) ( not ( = ?auto_1615 ?auto_1617 ) ) ( not ( = ?auto_1613 ?auto_1615 ) ) ( not ( = ?auto_1613 ?auto_1617 ) ) ( not ( = ?auto_1614 ?auto_1612 ) ) ( CALIBRATION_TARGET ?auto_1616 ?auto_1617 ) ( POINTING ?auto_1619 ?auto_1613 ) ( ON_BOARD ?auto_1618 ?auto_1619 ) ( POWER_ON ?auto_1618 ) ( not ( = ?auto_1616 ?auto_1618 ) ) ( CALIBRATED ?auto_1618 ) ( SUPPORTS ?auto_1618 ?auto_1614 ) )
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
      ?auto_1626 - SATELLITE
      ?auto_1625 - DIRECTION
      ?auto_1624 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1627 ?auto_1626 ) ( SUPPORTS ?auto_1627 ?auto_1622 ) ( not ( = ?auto_1621 ?auto_1625 ) ) ( not ( = ?auto_1623 ?auto_1621 ) ) ( not ( = ?auto_1623 ?auto_1625 ) ) ( not ( = ?auto_1620 ?auto_1622 ) ) ( CALIBRATION_TARGET ?auto_1627 ?auto_1625 ) ( POINTING ?auto_1626 ?auto_1623 ) ( ON_BOARD ?auto_1624 ?auto_1626 ) ( POWER_ON ?auto_1624 ) ( not ( = ?auto_1627 ?auto_1624 ) ) ( CALIBRATED ?auto_1624 ) ( SUPPORTS ?auto_1624 ?auto_1620 ) )
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
      ?auto_1644 - INSTRUMENT
      ?auto_1643 - SATELLITE
      ?auto_1642 - DIRECTION
      ?auto_1645 - DIRECTION
      ?auto_1640 - MODE
      ?auto_1641 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1644 ?auto_1643 ) ( SUPPORTS ?auto_1644 ?auto_1639 ) ( not ( = ?auto_1638 ?auto_1642 ) ) ( not ( = ?auto_1645 ?auto_1638 ) ) ( not ( = ?auto_1645 ?auto_1642 ) ) ( not ( = ?auto_1640 ?auto_1639 ) ) ( CALIBRATION_TARGET ?auto_1644 ?auto_1642 ) ( ON_BOARD ?auto_1641 ?auto_1643 ) ( POWER_ON ?auto_1641 ) ( not ( = ?auto_1644 ?auto_1641 ) ) ( CALIBRATED ?auto_1641 ) ( SUPPORTS ?auto_1641 ?auto_1640 ) ( POINTING ?auto_1643 ?auto_1642 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1643 ?auto_1645 ?auto_1642 )
      ( GET-2IMAGE ?auto_1645 ?auto_1640 ?auto_1638 ?auto_1639 )
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
      ?auto_1652 - INSTRUMENT
      ?auto_1650 - SATELLITE
      ?auto_1651 - DIRECTION
      ?auto_1653 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1652 ?auto_1650 ) ( SUPPORTS ?auto_1652 ?auto_1646 ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1647 ?auto_1649 ) ) ( not ( = ?auto_1647 ?auto_1651 ) ) ( not ( = ?auto_1648 ?auto_1646 ) ) ( CALIBRATION_TARGET ?auto_1652 ?auto_1651 ) ( ON_BOARD ?auto_1653 ?auto_1650 ) ( POWER_ON ?auto_1653 ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( CALIBRATED ?auto_1653 ) ( SUPPORTS ?auto_1653 ?auto_1648 ) ( POINTING ?auto_1650 ?auto_1651 ) )
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
      ?auto_1661 - INSTRUMENT
      ?auto_1659 - SATELLITE
      ?auto_1660 - DIRECTION
      ?auto_1658 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1661 ?auto_1659 ) ( SUPPORTS ?auto_1661 ?auto_1656 ) ( not ( = ?auto_1655 ?auto_1660 ) ) ( not ( = ?auto_1657 ?auto_1655 ) ) ( not ( = ?auto_1657 ?auto_1660 ) ) ( not ( = ?auto_1654 ?auto_1656 ) ) ( CALIBRATION_TARGET ?auto_1661 ?auto_1660 ) ( ON_BOARD ?auto_1658 ?auto_1659 ) ( POWER_ON ?auto_1658 ) ( not ( = ?auto_1661 ?auto_1658 ) ) ( CALIBRATED ?auto_1658 ) ( SUPPORTS ?auto_1658 ?auto_1654 ) ( POINTING ?auto_1659 ?auto_1660 ) )
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
      ?auto_1679 - INSTRUMENT
      ?auto_1675 - SATELLITE
      ?auto_1676 - DIRECTION
      ?auto_1677 - DIRECTION
      ?auto_1678 - MODE
      ?auto_1674 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1679 ?auto_1675 ) ( SUPPORTS ?auto_1679 ?auto_1673 ) ( not ( = ?auto_1672 ?auto_1676 ) ) ( not ( = ?auto_1677 ?auto_1672 ) ) ( not ( = ?auto_1677 ?auto_1676 ) ) ( not ( = ?auto_1678 ?auto_1673 ) ) ( CALIBRATION_TARGET ?auto_1679 ?auto_1676 ) ( ON_BOARD ?auto_1674 ?auto_1675 ) ( POWER_ON ?auto_1674 ) ( not ( = ?auto_1679 ?auto_1674 ) ) ( SUPPORTS ?auto_1674 ?auto_1678 ) ( POINTING ?auto_1675 ?auto_1676 ) ( CALIBRATION_TARGET ?auto_1674 ?auto_1676 ) ( NOT_CALIBRATED ?auto_1674 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1675 ?auto_1674 ?auto_1676 )
      ( GET-2IMAGE ?auto_1677 ?auto_1678 ?auto_1672 ?auto_1673 )
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
      ?auto_1685 - INSTRUMENT
      ?auto_1686 - SATELLITE
      ?auto_1687 - DIRECTION
      ?auto_1684 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1685 ?auto_1686 ) ( SUPPORTS ?auto_1685 ?auto_1680 ) ( not ( = ?auto_1683 ?auto_1687 ) ) ( not ( = ?auto_1681 ?auto_1683 ) ) ( not ( = ?auto_1681 ?auto_1687 ) ) ( not ( = ?auto_1682 ?auto_1680 ) ) ( CALIBRATION_TARGET ?auto_1685 ?auto_1687 ) ( ON_BOARD ?auto_1684 ?auto_1686 ) ( POWER_ON ?auto_1684 ) ( not ( = ?auto_1685 ?auto_1684 ) ) ( SUPPORTS ?auto_1684 ?auto_1682 ) ( POINTING ?auto_1686 ?auto_1687 ) ( CALIBRATION_TARGET ?auto_1684 ?auto_1687 ) ( NOT_CALIBRATED ?auto_1684 ) )
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
      ?auto_1692 - INSTRUMENT
      ?auto_1695 - SATELLITE
      ?auto_1694 - DIRECTION
      ?auto_1693 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1692 ?auto_1695 ) ( SUPPORTS ?auto_1692 ?auto_1690 ) ( not ( = ?auto_1689 ?auto_1694 ) ) ( not ( = ?auto_1691 ?auto_1689 ) ) ( not ( = ?auto_1691 ?auto_1694 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( CALIBRATION_TARGET ?auto_1692 ?auto_1694 ) ( ON_BOARD ?auto_1693 ?auto_1695 ) ( POWER_ON ?auto_1693 ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( SUPPORTS ?auto_1693 ?auto_1688 ) ( POINTING ?auto_1695 ?auto_1694 ) ( CALIBRATION_TARGET ?auto_1693 ?auto_1694 ) ( NOT_CALIBRATED ?auto_1693 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1691 ?auto_1688 ?auto_1689 ?auto_1690 )
      ( GET-2IMAGE-VERIFY ?auto_1689 ?auto_1690 ?auto_1691 ?auto_1688 ) )
  )

)

