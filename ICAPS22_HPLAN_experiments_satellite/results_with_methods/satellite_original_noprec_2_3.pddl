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
      ?auto_1425 - DIRECTION
      ?auto_1426 - MODE
    )
    :vars
    (
      ?auto_1427 - INSTRUMENT
      ?auto_1428 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1427 ) ( ON_BOARD ?auto_1427 ?auto_1428 ) ( SUPPORTS ?auto_1427 ?auto_1426 ) ( POWER_ON ?auto_1427 ) ( POINTING ?auto_1428 ?auto_1425 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1428 ?auto_1425 ?auto_1427 ?auto_1426 )
      ( GET-1IMAGE-VERIFY ?auto_1425 ?auto_1426 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1435 - DIRECTION
      ?auto_1436 - MODE
    )
    :vars
    (
      ?auto_1438 - INSTRUMENT
      ?auto_1437 - SATELLITE
      ?auto_1439 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1438 ) ( ON_BOARD ?auto_1438 ?auto_1437 ) ( SUPPORTS ?auto_1438 ?auto_1436 ) ( POWER_ON ?auto_1438 ) ( POINTING ?auto_1437 ?auto_1439 ) ( not ( = ?auto_1435 ?auto_1439 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1437 ?auto_1435 ?auto_1439 )
      ( GET-1IMAGE ?auto_1435 ?auto_1436 )
      ( GET-1IMAGE-VERIFY ?auto_1435 ?auto_1436 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1447 - DIRECTION
      ?auto_1448 - MODE
    )
    :vars
    (
      ?auto_1450 - INSTRUMENT
      ?auto_1451 - SATELLITE
      ?auto_1449 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1450 ?auto_1451 ) ( SUPPORTS ?auto_1450 ?auto_1448 ) ( POWER_ON ?auto_1450 ) ( POINTING ?auto_1451 ?auto_1449 ) ( not ( = ?auto_1447 ?auto_1449 ) ) ( CALIBRATION_TARGET ?auto_1450 ?auto_1449 ) ( NOT_CALIBRATED ?auto_1450 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1451 ?auto_1450 ?auto_1449 )
      ( GET-1IMAGE ?auto_1447 ?auto_1448 )
      ( GET-1IMAGE-VERIFY ?auto_1447 ?auto_1448 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1459 - DIRECTION
      ?auto_1460 - MODE
    )
    :vars
    (
      ?auto_1462 - INSTRUMENT
      ?auto_1463 - SATELLITE
      ?auto_1461 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1462 ?auto_1463 ) ( SUPPORTS ?auto_1462 ?auto_1460 ) ( POINTING ?auto_1463 ?auto_1461 ) ( not ( = ?auto_1459 ?auto_1461 ) ) ( CALIBRATION_TARGET ?auto_1462 ?auto_1461 ) ( POWER_AVAIL ?auto_1463 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1462 ?auto_1463 )
      ( GET-1IMAGE ?auto_1459 ?auto_1460 )
      ( GET-1IMAGE-VERIFY ?auto_1459 ?auto_1460 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1471 - DIRECTION
      ?auto_1472 - MODE
    )
    :vars
    (
      ?auto_1475 - INSTRUMENT
      ?auto_1473 - SATELLITE
      ?auto_1474 - DIRECTION
      ?auto_1476 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1475 ?auto_1473 ) ( SUPPORTS ?auto_1475 ?auto_1472 ) ( not ( = ?auto_1471 ?auto_1474 ) ) ( CALIBRATION_TARGET ?auto_1475 ?auto_1474 ) ( POWER_AVAIL ?auto_1473 ) ( POINTING ?auto_1473 ?auto_1476 ) ( not ( = ?auto_1474 ?auto_1476 ) ) ( not ( = ?auto_1471 ?auto_1476 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1473 ?auto_1474 ?auto_1476 )
      ( GET-1IMAGE ?auto_1471 ?auto_1472 )
      ( GET-1IMAGE-VERIFY ?auto_1471 ?auto_1472 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1499 - DIRECTION
      ?auto_1500 - MODE
    )
    :vars
    (
      ?auto_1501 - INSTRUMENT
      ?auto_1502 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1501 ) ( ON_BOARD ?auto_1501 ?auto_1502 ) ( SUPPORTS ?auto_1501 ?auto_1500 ) ( POWER_ON ?auto_1501 ) ( POINTING ?auto_1502 ?auto_1499 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1502 ?auto_1499 ?auto_1501 ?auto_1500 )
      ( GET-1IMAGE-VERIFY ?auto_1499 ?auto_1500 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1503 - DIRECTION
      ?auto_1504 - MODE
      ?auto_1506 - DIRECTION
      ?auto_1505 - MODE
    )
    :vars
    (
      ?auto_1507 - INSTRUMENT
      ?auto_1508 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1507 ) ( ON_BOARD ?auto_1507 ?auto_1508 ) ( SUPPORTS ?auto_1507 ?auto_1505 ) ( POWER_ON ?auto_1507 ) ( POINTING ?auto_1508 ?auto_1506 ) ( HAVE_IMAGE ?auto_1503 ?auto_1504 ) ( not ( = ?auto_1503 ?auto_1506 ) ) ( not ( = ?auto_1504 ?auto_1505 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1506 ?auto_1505 )
      ( GET-2IMAGE-VERIFY ?auto_1503 ?auto_1504 ?auto_1506 ?auto_1505 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1509 - DIRECTION
      ?auto_1510 - MODE
      ?auto_1512 - DIRECTION
      ?auto_1511 - MODE
    )
    :vars
    (
      ?auto_1513 - INSTRUMENT
      ?auto_1514 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1513 ) ( ON_BOARD ?auto_1513 ?auto_1514 ) ( SUPPORTS ?auto_1513 ?auto_1510 ) ( POWER_ON ?auto_1513 ) ( POINTING ?auto_1514 ?auto_1509 ) ( HAVE_IMAGE ?auto_1512 ?auto_1511 ) ( not ( = ?auto_1509 ?auto_1512 ) ) ( not ( = ?auto_1510 ?auto_1511 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1509 ?auto_1510 )
      ( GET-2IMAGE-VERIFY ?auto_1509 ?auto_1510 ?auto_1512 ?auto_1511 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1521 - DIRECTION
      ?auto_1522 - MODE
    )
    :vars
    (
      ?auto_1523 - INSTRUMENT
      ?auto_1524 - SATELLITE
      ?auto_1525 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1523 ) ( ON_BOARD ?auto_1523 ?auto_1524 ) ( SUPPORTS ?auto_1523 ?auto_1522 ) ( POWER_ON ?auto_1523 ) ( POINTING ?auto_1524 ?auto_1525 ) ( not ( = ?auto_1521 ?auto_1525 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1524 ?auto_1521 ?auto_1525 )
      ( GET-1IMAGE ?auto_1521 ?auto_1522 )
      ( GET-1IMAGE-VERIFY ?auto_1521 ?auto_1522 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1526 - DIRECTION
      ?auto_1527 - MODE
      ?auto_1529 - DIRECTION
      ?auto_1528 - MODE
    )
    :vars
    (
      ?auto_1532 - INSTRUMENT
      ?auto_1531 - SATELLITE
      ?auto_1530 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1532 ) ( ON_BOARD ?auto_1532 ?auto_1531 ) ( SUPPORTS ?auto_1532 ?auto_1528 ) ( POWER_ON ?auto_1532 ) ( POINTING ?auto_1531 ?auto_1530 ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( HAVE_IMAGE ?auto_1526 ?auto_1527 ) ( not ( = ?auto_1526 ?auto_1529 ) ) ( not ( = ?auto_1526 ?auto_1530 ) ) ( not ( = ?auto_1527 ?auto_1528 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1529 ?auto_1528 )
      ( GET-2IMAGE-VERIFY ?auto_1526 ?auto_1527 ?auto_1529 ?auto_1528 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1533 - DIRECTION
      ?auto_1534 - MODE
      ?auto_1536 - DIRECTION
      ?auto_1535 - MODE
    )
    :vars
    (
      ?auto_1537 - INSTRUMENT
      ?auto_1538 - SATELLITE
      ?auto_1539 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1537 ) ( ON_BOARD ?auto_1537 ?auto_1538 ) ( SUPPORTS ?auto_1537 ?auto_1534 ) ( POWER_ON ?auto_1537 ) ( POINTING ?auto_1538 ?auto_1539 ) ( not ( = ?auto_1533 ?auto_1539 ) ) ( HAVE_IMAGE ?auto_1536 ?auto_1535 ) ( not ( = ?auto_1536 ?auto_1533 ) ) ( not ( = ?auto_1536 ?auto_1539 ) ) ( not ( = ?auto_1535 ?auto_1534 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1536 ?auto_1535 ?auto_1533 ?auto_1534 )
      ( GET-2IMAGE-VERIFY ?auto_1533 ?auto_1534 ?auto_1536 ?auto_1535 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1549 - DIRECTION
      ?auto_1550 - MODE
    )
    :vars
    (
      ?auto_1552 - INSTRUMENT
      ?auto_1554 - SATELLITE
      ?auto_1555 - DIRECTION
      ?auto_1551 - DIRECTION
      ?auto_1553 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1552 ?auto_1554 ) ( SUPPORTS ?auto_1552 ?auto_1550 ) ( POWER_ON ?auto_1552 ) ( POINTING ?auto_1554 ?auto_1555 ) ( not ( = ?auto_1549 ?auto_1555 ) ) ( HAVE_IMAGE ?auto_1551 ?auto_1553 ) ( not ( = ?auto_1551 ?auto_1549 ) ) ( not ( = ?auto_1551 ?auto_1555 ) ) ( not ( = ?auto_1553 ?auto_1550 ) ) ( CALIBRATION_TARGET ?auto_1552 ?auto_1555 ) ( NOT_CALIBRATED ?auto_1552 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1554 ?auto_1552 ?auto_1555 )
      ( GET-2IMAGE ?auto_1551 ?auto_1553 ?auto_1549 ?auto_1550 )
      ( GET-1IMAGE-VERIFY ?auto_1549 ?auto_1550 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1556 - DIRECTION
      ?auto_1557 - MODE
      ?auto_1559 - DIRECTION
      ?auto_1558 - MODE
    )
    :vars
    (
      ?auto_1560 - INSTRUMENT
      ?auto_1562 - SATELLITE
      ?auto_1561 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1560 ?auto_1562 ) ( SUPPORTS ?auto_1560 ?auto_1558 ) ( POWER_ON ?auto_1560 ) ( POINTING ?auto_1562 ?auto_1561 ) ( not ( = ?auto_1559 ?auto_1561 ) ) ( HAVE_IMAGE ?auto_1556 ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1559 ) ) ( not ( = ?auto_1556 ?auto_1561 ) ) ( not ( = ?auto_1557 ?auto_1558 ) ) ( CALIBRATION_TARGET ?auto_1560 ?auto_1561 ) ( NOT_CALIBRATED ?auto_1560 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1559 ?auto_1558 )
      ( GET-2IMAGE-VERIFY ?auto_1556 ?auto_1557 ?auto_1559 ?auto_1558 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1563 - DIRECTION
      ?auto_1564 - MODE
      ?auto_1566 - DIRECTION
      ?auto_1565 - MODE
    )
    :vars
    (
      ?auto_1569 - INSTRUMENT
      ?auto_1567 - SATELLITE
      ?auto_1568 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1569 ?auto_1567 ) ( SUPPORTS ?auto_1569 ?auto_1564 ) ( POWER_ON ?auto_1569 ) ( POINTING ?auto_1567 ?auto_1568 ) ( not ( = ?auto_1563 ?auto_1568 ) ) ( HAVE_IMAGE ?auto_1566 ?auto_1565 ) ( not ( = ?auto_1566 ?auto_1563 ) ) ( not ( = ?auto_1566 ?auto_1568 ) ) ( not ( = ?auto_1565 ?auto_1564 ) ) ( CALIBRATION_TARGET ?auto_1569 ?auto_1568 ) ( NOT_CALIBRATED ?auto_1569 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1566 ?auto_1565 ?auto_1563 ?auto_1564 )
      ( GET-2IMAGE-VERIFY ?auto_1563 ?auto_1564 ?auto_1566 ?auto_1565 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1579 - DIRECTION
      ?auto_1580 - MODE
    )
    :vars
    (
      ?auto_1585 - INSTRUMENT
      ?auto_1583 - SATELLITE
      ?auto_1584 - DIRECTION
      ?auto_1582 - DIRECTION
      ?auto_1581 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1585 ?auto_1583 ) ( SUPPORTS ?auto_1585 ?auto_1580 ) ( POINTING ?auto_1583 ?auto_1584 ) ( not ( = ?auto_1579 ?auto_1584 ) ) ( HAVE_IMAGE ?auto_1582 ?auto_1581 ) ( not ( = ?auto_1582 ?auto_1579 ) ) ( not ( = ?auto_1582 ?auto_1584 ) ) ( not ( = ?auto_1581 ?auto_1580 ) ) ( CALIBRATION_TARGET ?auto_1585 ?auto_1584 ) ( POWER_AVAIL ?auto_1583 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1585 ?auto_1583 )
      ( GET-2IMAGE ?auto_1582 ?auto_1581 ?auto_1579 ?auto_1580 )
      ( GET-1IMAGE-VERIFY ?auto_1579 ?auto_1580 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1586 - DIRECTION
      ?auto_1587 - MODE
      ?auto_1589 - DIRECTION
      ?auto_1588 - MODE
    )
    :vars
    (
      ?auto_1592 - INSTRUMENT
      ?auto_1591 - SATELLITE
      ?auto_1590 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1592 ?auto_1591 ) ( SUPPORTS ?auto_1592 ?auto_1588 ) ( POINTING ?auto_1591 ?auto_1590 ) ( not ( = ?auto_1589 ?auto_1590 ) ) ( HAVE_IMAGE ?auto_1586 ?auto_1587 ) ( not ( = ?auto_1586 ?auto_1589 ) ) ( not ( = ?auto_1586 ?auto_1590 ) ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( CALIBRATION_TARGET ?auto_1592 ?auto_1590 ) ( POWER_AVAIL ?auto_1591 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1589 ?auto_1588 )
      ( GET-2IMAGE-VERIFY ?auto_1586 ?auto_1587 ?auto_1589 ?auto_1588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1593 - DIRECTION
      ?auto_1594 - MODE
      ?auto_1596 - DIRECTION
      ?auto_1595 - MODE
    )
    :vars
    (
      ?auto_1599 - INSTRUMENT
      ?auto_1598 - SATELLITE
      ?auto_1597 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1599 ?auto_1598 ) ( SUPPORTS ?auto_1599 ?auto_1594 ) ( POINTING ?auto_1598 ?auto_1597 ) ( not ( = ?auto_1593 ?auto_1597 ) ) ( HAVE_IMAGE ?auto_1596 ?auto_1595 ) ( not ( = ?auto_1596 ?auto_1593 ) ) ( not ( = ?auto_1596 ?auto_1597 ) ) ( not ( = ?auto_1595 ?auto_1594 ) ) ( CALIBRATION_TARGET ?auto_1599 ?auto_1597 ) ( POWER_AVAIL ?auto_1598 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1596 ?auto_1595 ?auto_1593 ?auto_1594 )
      ( GET-2IMAGE-VERIFY ?auto_1593 ?auto_1594 ?auto_1596 ?auto_1595 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1609 - DIRECTION
      ?auto_1610 - MODE
    )
    :vars
    (
      ?auto_1614 - INSTRUMENT
      ?auto_1613 - SATELLITE
      ?auto_1611 - DIRECTION
      ?auto_1612 - DIRECTION
      ?auto_1615 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1614 ?auto_1613 ) ( SUPPORTS ?auto_1614 ?auto_1610 ) ( not ( = ?auto_1609 ?auto_1611 ) ) ( HAVE_IMAGE ?auto_1612 ?auto_1615 ) ( not ( = ?auto_1612 ?auto_1609 ) ) ( not ( = ?auto_1612 ?auto_1611 ) ) ( not ( = ?auto_1615 ?auto_1610 ) ) ( CALIBRATION_TARGET ?auto_1614 ?auto_1611 ) ( POWER_AVAIL ?auto_1613 ) ( POINTING ?auto_1613 ?auto_1612 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1613 ?auto_1611 ?auto_1612 )
      ( GET-2IMAGE ?auto_1612 ?auto_1615 ?auto_1609 ?auto_1610 )
      ( GET-1IMAGE-VERIFY ?auto_1609 ?auto_1610 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1616 - DIRECTION
      ?auto_1617 - MODE
      ?auto_1619 - DIRECTION
      ?auto_1618 - MODE
    )
    :vars
    (
      ?auto_1621 - INSTRUMENT
      ?auto_1620 - SATELLITE
      ?auto_1622 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1621 ?auto_1620 ) ( SUPPORTS ?auto_1621 ?auto_1618 ) ( not ( = ?auto_1619 ?auto_1622 ) ) ( HAVE_IMAGE ?auto_1616 ?auto_1617 ) ( not ( = ?auto_1616 ?auto_1619 ) ) ( not ( = ?auto_1616 ?auto_1622 ) ) ( not ( = ?auto_1617 ?auto_1618 ) ) ( CALIBRATION_TARGET ?auto_1621 ?auto_1622 ) ( POWER_AVAIL ?auto_1620 ) ( POINTING ?auto_1620 ?auto_1616 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1619 ?auto_1618 )
      ( GET-2IMAGE-VERIFY ?auto_1616 ?auto_1617 ?auto_1619 ?auto_1618 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1623 - DIRECTION
      ?auto_1624 - MODE
      ?auto_1626 - DIRECTION
      ?auto_1625 - MODE
    )
    :vars
    (
      ?auto_1629 - INSTRUMENT
      ?auto_1628 - SATELLITE
      ?auto_1627 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1629 ?auto_1628 ) ( SUPPORTS ?auto_1629 ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1627 ) ) ( HAVE_IMAGE ?auto_1626 ?auto_1625 ) ( not ( = ?auto_1626 ?auto_1623 ) ) ( not ( = ?auto_1626 ?auto_1627 ) ) ( not ( = ?auto_1625 ?auto_1624 ) ) ( CALIBRATION_TARGET ?auto_1629 ?auto_1627 ) ( POWER_AVAIL ?auto_1628 ) ( POINTING ?auto_1628 ?auto_1626 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1626 ?auto_1625 ?auto_1623 ?auto_1624 )
      ( GET-2IMAGE-VERIFY ?auto_1623 ?auto_1624 ?auto_1626 ?auto_1625 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1639 - DIRECTION
      ?auto_1640 - MODE
    )
    :vars
    (
      ?auto_1645 - INSTRUMENT
      ?auto_1642 - SATELLITE
      ?auto_1641 - DIRECTION
      ?auto_1644 - DIRECTION
      ?auto_1643 - MODE
      ?auto_1646 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1645 ?auto_1642 ) ( SUPPORTS ?auto_1645 ?auto_1640 ) ( not ( = ?auto_1639 ?auto_1641 ) ) ( HAVE_IMAGE ?auto_1644 ?auto_1643 ) ( not ( = ?auto_1644 ?auto_1639 ) ) ( not ( = ?auto_1644 ?auto_1641 ) ) ( not ( = ?auto_1643 ?auto_1640 ) ) ( CALIBRATION_TARGET ?auto_1645 ?auto_1641 ) ( POINTING ?auto_1642 ?auto_1644 ) ( ON_BOARD ?auto_1646 ?auto_1642 ) ( POWER_ON ?auto_1646 ) ( not ( = ?auto_1645 ?auto_1646 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1646 ?auto_1642 )
      ( GET-2IMAGE ?auto_1644 ?auto_1643 ?auto_1639 ?auto_1640 )
      ( GET-1IMAGE-VERIFY ?auto_1639 ?auto_1640 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1647 - DIRECTION
      ?auto_1648 - MODE
      ?auto_1650 - DIRECTION
      ?auto_1649 - MODE
    )
    :vars
    (
      ?auto_1652 - INSTRUMENT
      ?auto_1654 - SATELLITE
      ?auto_1653 - DIRECTION
      ?auto_1651 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1652 ?auto_1654 ) ( SUPPORTS ?auto_1652 ?auto_1649 ) ( not ( = ?auto_1650 ?auto_1653 ) ) ( HAVE_IMAGE ?auto_1647 ?auto_1648 ) ( not ( = ?auto_1647 ?auto_1650 ) ) ( not ( = ?auto_1647 ?auto_1653 ) ) ( not ( = ?auto_1648 ?auto_1649 ) ) ( CALIBRATION_TARGET ?auto_1652 ?auto_1653 ) ( POINTING ?auto_1654 ?auto_1647 ) ( ON_BOARD ?auto_1651 ?auto_1654 ) ( POWER_ON ?auto_1651 ) ( not ( = ?auto_1652 ?auto_1651 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1650 ?auto_1649 )
      ( GET-2IMAGE-VERIFY ?auto_1647 ?auto_1648 ?auto_1650 ?auto_1649 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1655 - DIRECTION
      ?auto_1656 - MODE
      ?auto_1658 - DIRECTION
      ?auto_1657 - MODE
    )
    :vars
    (
      ?auto_1662 - INSTRUMENT
      ?auto_1661 - SATELLITE
      ?auto_1659 - DIRECTION
      ?auto_1660 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1662 ?auto_1661 ) ( SUPPORTS ?auto_1662 ?auto_1656 ) ( not ( = ?auto_1655 ?auto_1659 ) ) ( HAVE_IMAGE ?auto_1658 ?auto_1657 ) ( not ( = ?auto_1658 ?auto_1655 ) ) ( not ( = ?auto_1658 ?auto_1659 ) ) ( not ( = ?auto_1657 ?auto_1656 ) ) ( CALIBRATION_TARGET ?auto_1662 ?auto_1659 ) ( POINTING ?auto_1661 ?auto_1658 ) ( ON_BOARD ?auto_1660 ?auto_1661 ) ( POWER_ON ?auto_1660 ) ( not ( = ?auto_1662 ?auto_1660 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1658 ?auto_1657 ?auto_1655 ?auto_1656 )
      ( GET-2IMAGE-VERIFY ?auto_1655 ?auto_1656 ?auto_1658 ?auto_1657 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1673 - DIRECTION
      ?auto_1674 - MODE
    )
    :vars
    (
      ?auto_1680 - INSTRUMENT
      ?auto_1679 - SATELLITE
      ?auto_1677 - DIRECTION
      ?auto_1675 - DIRECTION
      ?auto_1676 - MODE
      ?auto_1678 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1680 ?auto_1679 ) ( SUPPORTS ?auto_1680 ?auto_1674 ) ( not ( = ?auto_1673 ?auto_1677 ) ) ( not ( = ?auto_1675 ?auto_1673 ) ) ( not ( = ?auto_1675 ?auto_1677 ) ) ( not ( = ?auto_1676 ?auto_1674 ) ) ( CALIBRATION_TARGET ?auto_1680 ?auto_1677 ) ( POINTING ?auto_1679 ?auto_1675 ) ( ON_BOARD ?auto_1678 ?auto_1679 ) ( POWER_ON ?auto_1678 ) ( not ( = ?auto_1680 ?auto_1678 ) ) ( CALIBRATED ?auto_1678 ) ( SUPPORTS ?auto_1678 ?auto_1676 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1675 ?auto_1676 )
      ( GET-2IMAGE ?auto_1675 ?auto_1676 ?auto_1673 ?auto_1674 )
      ( GET-1IMAGE-VERIFY ?auto_1673 ?auto_1674 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1681 - DIRECTION
      ?auto_1682 - MODE
      ?auto_1684 - DIRECTION
      ?auto_1683 - MODE
    )
    :vars
    (
      ?auto_1687 - INSTRUMENT
      ?auto_1685 - SATELLITE
      ?auto_1688 - DIRECTION
      ?auto_1686 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1687 ?auto_1685 ) ( SUPPORTS ?auto_1687 ?auto_1683 ) ( not ( = ?auto_1684 ?auto_1688 ) ) ( not ( = ?auto_1681 ?auto_1684 ) ) ( not ( = ?auto_1681 ?auto_1688 ) ) ( not ( = ?auto_1682 ?auto_1683 ) ) ( CALIBRATION_TARGET ?auto_1687 ?auto_1688 ) ( POINTING ?auto_1685 ?auto_1681 ) ( ON_BOARD ?auto_1686 ?auto_1685 ) ( POWER_ON ?auto_1686 ) ( not ( = ?auto_1687 ?auto_1686 ) ) ( CALIBRATED ?auto_1686 ) ( SUPPORTS ?auto_1686 ?auto_1682 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1684 ?auto_1683 )
      ( GET-2IMAGE-VERIFY ?auto_1681 ?auto_1682 ?auto_1684 ?auto_1683 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1689 - DIRECTION
      ?auto_1690 - MODE
      ?auto_1692 - DIRECTION
      ?auto_1691 - MODE
    )
    :vars
    (
      ?auto_1696 - INSTRUMENT
      ?auto_1695 - SATELLITE
      ?auto_1693 - DIRECTION
      ?auto_1694 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1696 ?auto_1695 ) ( SUPPORTS ?auto_1696 ?auto_1690 ) ( not ( = ?auto_1689 ?auto_1693 ) ) ( not ( = ?auto_1692 ?auto_1689 ) ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( not ( = ?auto_1691 ?auto_1690 ) ) ( CALIBRATION_TARGET ?auto_1696 ?auto_1693 ) ( POINTING ?auto_1695 ?auto_1692 ) ( ON_BOARD ?auto_1694 ?auto_1695 ) ( POWER_ON ?auto_1694 ) ( not ( = ?auto_1696 ?auto_1694 ) ) ( CALIBRATED ?auto_1694 ) ( SUPPORTS ?auto_1694 ?auto_1691 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1692 ?auto_1691 ?auto_1689 ?auto_1690 )
      ( GET-2IMAGE-VERIFY ?auto_1689 ?auto_1690 ?auto_1692 ?auto_1691 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1707 - DIRECTION
      ?auto_1708 - MODE
    )
    :vars
    (
      ?auto_1714 - INSTRUMENT
      ?auto_1713 - SATELLITE
      ?auto_1709 - DIRECTION
      ?auto_1712 - DIRECTION
      ?auto_1711 - MODE
      ?auto_1710 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1714 ?auto_1713 ) ( SUPPORTS ?auto_1714 ?auto_1708 ) ( not ( = ?auto_1707 ?auto_1709 ) ) ( not ( = ?auto_1712 ?auto_1707 ) ) ( not ( = ?auto_1712 ?auto_1709 ) ) ( not ( = ?auto_1711 ?auto_1708 ) ) ( CALIBRATION_TARGET ?auto_1714 ?auto_1709 ) ( ON_BOARD ?auto_1710 ?auto_1713 ) ( POWER_ON ?auto_1710 ) ( not ( = ?auto_1714 ?auto_1710 ) ) ( CALIBRATED ?auto_1710 ) ( SUPPORTS ?auto_1710 ?auto_1711 ) ( POINTING ?auto_1713 ?auto_1709 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1713 ?auto_1712 ?auto_1709 )
      ( GET-2IMAGE ?auto_1712 ?auto_1711 ?auto_1707 ?auto_1708 )
      ( GET-1IMAGE-VERIFY ?auto_1707 ?auto_1708 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1715 - DIRECTION
      ?auto_1716 - MODE
      ?auto_1718 - DIRECTION
      ?auto_1717 - MODE
    )
    :vars
    (
      ?auto_1719 - INSTRUMENT
      ?auto_1721 - SATELLITE
      ?auto_1720 - DIRECTION
      ?auto_1722 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1719 ?auto_1721 ) ( SUPPORTS ?auto_1719 ?auto_1717 ) ( not ( = ?auto_1718 ?auto_1720 ) ) ( not ( = ?auto_1715 ?auto_1718 ) ) ( not ( = ?auto_1715 ?auto_1720 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( CALIBRATION_TARGET ?auto_1719 ?auto_1720 ) ( ON_BOARD ?auto_1722 ?auto_1721 ) ( POWER_ON ?auto_1722 ) ( not ( = ?auto_1719 ?auto_1722 ) ) ( CALIBRATED ?auto_1722 ) ( SUPPORTS ?auto_1722 ?auto_1716 ) ( POINTING ?auto_1721 ?auto_1720 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1718 ?auto_1717 )
      ( GET-2IMAGE-VERIFY ?auto_1715 ?auto_1716 ?auto_1718 ?auto_1717 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1723 - DIRECTION
      ?auto_1724 - MODE
      ?auto_1726 - DIRECTION
      ?auto_1725 - MODE
    )
    :vars
    (
      ?auto_1727 - INSTRUMENT
      ?auto_1730 - SATELLITE
      ?auto_1728 - DIRECTION
      ?auto_1729 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1727 ?auto_1730 ) ( SUPPORTS ?auto_1727 ?auto_1724 ) ( not ( = ?auto_1723 ?auto_1728 ) ) ( not ( = ?auto_1726 ?auto_1723 ) ) ( not ( = ?auto_1726 ?auto_1728 ) ) ( not ( = ?auto_1725 ?auto_1724 ) ) ( CALIBRATION_TARGET ?auto_1727 ?auto_1728 ) ( ON_BOARD ?auto_1729 ?auto_1730 ) ( POWER_ON ?auto_1729 ) ( not ( = ?auto_1727 ?auto_1729 ) ) ( CALIBRATED ?auto_1729 ) ( SUPPORTS ?auto_1729 ?auto_1725 ) ( POINTING ?auto_1730 ?auto_1728 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1726 ?auto_1725 ?auto_1723 ?auto_1724 )
      ( GET-2IMAGE-VERIFY ?auto_1723 ?auto_1724 ?auto_1726 ?auto_1725 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1741 - DIRECTION
      ?auto_1742 - MODE
    )
    :vars
    (
      ?auto_1745 - INSTRUMENT
      ?auto_1748 - SATELLITE
      ?auto_1746 - DIRECTION
      ?auto_1744 - DIRECTION
      ?auto_1743 - MODE
      ?auto_1747 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1745 ?auto_1748 ) ( SUPPORTS ?auto_1745 ?auto_1742 ) ( not ( = ?auto_1741 ?auto_1746 ) ) ( not ( = ?auto_1744 ?auto_1741 ) ) ( not ( = ?auto_1744 ?auto_1746 ) ) ( not ( = ?auto_1743 ?auto_1742 ) ) ( CALIBRATION_TARGET ?auto_1745 ?auto_1746 ) ( ON_BOARD ?auto_1747 ?auto_1748 ) ( POWER_ON ?auto_1747 ) ( not ( = ?auto_1745 ?auto_1747 ) ) ( SUPPORTS ?auto_1747 ?auto_1743 ) ( POINTING ?auto_1748 ?auto_1746 ) ( CALIBRATION_TARGET ?auto_1747 ?auto_1746 ) ( NOT_CALIBRATED ?auto_1747 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1748 ?auto_1747 ?auto_1746 )
      ( GET-2IMAGE ?auto_1744 ?auto_1743 ?auto_1741 ?auto_1742 )
      ( GET-1IMAGE-VERIFY ?auto_1741 ?auto_1742 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1749 - DIRECTION
      ?auto_1750 - MODE
      ?auto_1752 - DIRECTION
      ?auto_1751 - MODE
    )
    :vars
    (
      ?auto_1753 - INSTRUMENT
      ?auto_1754 - SATELLITE
      ?auto_1755 - DIRECTION
      ?auto_1756 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1753 ?auto_1754 ) ( SUPPORTS ?auto_1753 ?auto_1751 ) ( not ( = ?auto_1752 ?auto_1755 ) ) ( not ( = ?auto_1749 ?auto_1752 ) ) ( not ( = ?auto_1749 ?auto_1755 ) ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( CALIBRATION_TARGET ?auto_1753 ?auto_1755 ) ( ON_BOARD ?auto_1756 ?auto_1754 ) ( POWER_ON ?auto_1756 ) ( not ( = ?auto_1753 ?auto_1756 ) ) ( SUPPORTS ?auto_1756 ?auto_1750 ) ( POINTING ?auto_1754 ?auto_1755 ) ( CALIBRATION_TARGET ?auto_1756 ?auto_1755 ) ( NOT_CALIBRATED ?auto_1756 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1752 ?auto_1751 )
      ( GET-2IMAGE-VERIFY ?auto_1749 ?auto_1750 ?auto_1752 ?auto_1751 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1757 - DIRECTION
      ?auto_1758 - MODE
      ?auto_1760 - DIRECTION
      ?auto_1759 - MODE
    )
    :vars
    (
      ?auto_1764 - INSTRUMENT
      ?auto_1761 - SATELLITE
      ?auto_1763 - DIRECTION
      ?auto_1762 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1764 ?auto_1761 ) ( SUPPORTS ?auto_1764 ?auto_1758 ) ( not ( = ?auto_1757 ?auto_1763 ) ) ( not ( = ?auto_1760 ?auto_1757 ) ) ( not ( = ?auto_1760 ?auto_1763 ) ) ( not ( = ?auto_1759 ?auto_1758 ) ) ( CALIBRATION_TARGET ?auto_1764 ?auto_1763 ) ( ON_BOARD ?auto_1762 ?auto_1761 ) ( POWER_ON ?auto_1762 ) ( not ( = ?auto_1764 ?auto_1762 ) ) ( SUPPORTS ?auto_1762 ?auto_1759 ) ( POINTING ?auto_1761 ?auto_1763 ) ( CALIBRATION_TARGET ?auto_1762 ?auto_1763 ) ( NOT_CALIBRATED ?auto_1762 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1760 ?auto_1759 ?auto_1757 ?auto_1758 )
      ( GET-2IMAGE-VERIFY ?auto_1757 ?auto_1758 ?auto_1760 ?auto_1759 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1775 - DIRECTION
      ?auto_1776 - MODE
    )
    :vars
    (
      ?auto_1780 - INSTRUMENT
      ?auto_1777 - SATELLITE
      ?auto_1779 - DIRECTION
      ?auto_1782 - DIRECTION
      ?auto_1781 - MODE
      ?auto_1778 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1780 ?auto_1777 ) ( SUPPORTS ?auto_1780 ?auto_1776 ) ( not ( = ?auto_1775 ?auto_1779 ) ) ( not ( = ?auto_1782 ?auto_1775 ) ) ( not ( = ?auto_1782 ?auto_1779 ) ) ( not ( = ?auto_1781 ?auto_1776 ) ) ( CALIBRATION_TARGET ?auto_1780 ?auto_1779 ) ( ON_BOARD ?auto_1778 ?auto_1777 ) ( not ( = ?auto_1780 ?auto_1778 ) ) ( SUPPORTS ?auto_1778 ?auto_1781 ) ( POINTING ?auto_1777 ?auto_1779 ) ( CALIBRATION_TARGET ?auto_1778 ?auto_1779 ) ( POWER_AVAIL ?auto_1777 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1778 ?auto_1777 )
      ( GET-2IMAGE ?auto_1782 ?auto_1781 ?auto_1775 ?auto_1776 )
      ( GET-1IMAGE-VERIFY ?auto_1775 ?auto_1776 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1783 - DIRECTION
      ?auto_1784 - MODE
      ?auto_1786 - DIRECTION
      ?auto_1785 - MODE
    )
    :vars
    (
      ?auto_1787 - INSTRUMENT
      ?auto_1790 - SATELLITE
      ?auto_1789 - DIRECTION
      ?auto_1788 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1787 ?auto_1790 ) ( SUPPORTS ?auto_1787 ?auto_1785 ) ( not ( = ?auto_1786 ?auto_1789 ) ) ( not ( = ?auto_1783 ?auto_1786 ) ) ( not ( = ?auto_1783 ?auto_1789 ) ) ( not ( = ?auto_1784 ?auto_1785 ) ) ( CALIBRATION_TARGET ?auto_1787 ?auto_1789 ) ( ON_BOARD ?auto_1788 ?auto_1790 ) ( not ( = ?auto_1787 ?auto_1788 ) ) ( SUPPORTS ?auto_1788 ?auto_1784 ) ( POINTING ?auto_1790 ?auto_1789 ) ( CALIBRATION_TARGET ?auto_1788 ?auto_1789 ) ( POWER_AVAIL ?auto_1790 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1786 ?auto_1785 )
      ( GET-2IMAGE-VERIFY ?auto_1783 ?auto_1784 ?auto_1786 ?auto_1785 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1791 - DIRECTION
      ?auto_1792 - MODE
      ?auto_1794 - DIRECTION
      ?auto_1793 - MODE
    )
    :vars
    (
      ?auto_1798 - INSTRUMENT
      ?auto_1797 - SATELLITE
      ?auto_1796 - DIRECTION
      ?auto_1795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1798 ?auto_1797 ) ( SUPPORTS ?auto_1798 ?auto_1792 ) ( not ( = ?auto_1791 ?auto_1796 ) ) ( not ( = ?auto_1794 ?auto_1791 ) ) ( not ( = ?auto_1794 ?auto_1796 ) ) ( not ( = ?auto_1793 ?auto_1792 ) ) ( CALIBRATION_TARGET ?auto_1798 ?auto_1796 ) ( ON_BOARD ?auto_1795 ?auto_1797 ) ( not ( = ?auto_1798 ?auto_1795 ) ) ( SUPPORTS ?auto_1795 ?auto_1793 ) ( POINTING ?auto_1797 ?auto_1796 ) ( CALIBRATION_TARGET ?auto_1795 ?auto_1796 ) ( POWER_AVAIL ?auto_1797 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1794 ?auto_1793 ?auto_1791 ?auto_1792 )
      ( GET-2IMAGE-VERIFY ?auto_1791 ?auto_1792 ?auto_1794 ?auto_1793 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1809 - DIRECTION
      ?auto_1810 - MODE
    )
    :vars
    (
      ?auto_1814 - INSTRUMENT
      ?auto_1813 - SATELLITE
      ?auto_1812 - DIRECTION
      ?auto_1816 - DIRECTION
      ?auto_1815 - MODE
      ?auto_1811 - INSTRUMENT
      ?auto_1817 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1814 ?auto_1813 ) ( SUPPORTS ?auto_1814 ?auto_1810 ) ( not ( = ?auto_1809 ?auto_1812 ) ) ( not ( = ?auto_1816 ?auto_1809 ) ) ( not ( = ?auto_1816 ?auto_1812 ) ) ( not ( = ?auto_1815 ?auto_1810 ) ) ( CALIBRATION_TARGET ?auto_1814 ?auto_1812 ) ( ON_BOARD ?auto_1811 ?auto_1813 ) ( not ( = ?auto_1814 ?auto_1811 ) ) ( SUPPORTS ?auto_1811 ?auto_1815 ) ( CALIBRATION_TARGET ?auto_1811 ?auto_1812 ) ( POWER_AVAIL ?auto_1813 ) ( POINTING ?auto_1813 ?auto_1817 ) ( not ( = ?auto_1812 ?auto_1817 ) ) ( not ( = ?auto_1809 ?auto_1817 ) ) ( not ( = ?auto_1816 ?auto_1817 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1813 ?auto_1812 ?auto_1817 )
      ( GET-2IMAGE ?auto_1816 ?auto_1815 ?auto_1809 ?auto_1810 )
      ( GET-1IMAGE-VERIFY ?auto_1809 ?auto_1810 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1818 - DIRECTION
      ?auto_1819 - MODE
      ?auto_1821 - DIRECTION
      ?auto_1820 - MODE
    )
    :vars
    (
      ?auto_1822 - INSTRUMENT
      ?auto_1824 - SATELLITE
      ?auto_1823 - DIRECTION
      ?auto_1826 - INSTRUMENT
      ?auto_1825 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1822 ?auto_1824 ) ( SUPPORTS ?auto_1822 ?auto_1820 ) ( not ( = ?auto_1821 ?auto_1823 ) ) ( not ( = ?auto_1818 ?auto_1821 ) ) ( not ( = ?auto_1818 ?auto_1823 ) ) ( not ( = ?auto_1819 ?auto_1820 ) ) ( CALIBRATION_TARGET ?auto_1822 ?auto_1823 ) ( ON_BOARD ?auto_1826 ?auto_1824 ) ( not ( = ?auto_1822 ?auto_1826 ) ) ( SUPPORTS ?auto_1826 ?auto_1819 ) ( CALIBRATION_TARGET ?auto_1826 ?auto_1823 ) ( POWER_AVAIL ?auto_1824 ) ( POINTING ?auto_1824 ?auto_1825 ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( not ( = ?auto_1821 ?auto_1825 ) ) ( not ( = ?auto_1818 ?auto_1825 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1821 ?auto_1820 )
      ( GET-2IMAGE-VERIFY ?auto_1818 ?auto_1819 ?auto_1821 ?auto_1820 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1827 - DIRECTION
      ?auto_1828 - MODE
      ?auto_1830 - DIRECTION
      ?auto_1829 - MODE
    )
    :vars
    (
      ?auto_1831 - INSTRUMENT
      ?auto_1832 - SATELLITE
      ?auto_1835 - DIRECTION
      ?auto_1834 - INSTRUMENT
      ?auto_1833 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1831 ?auto_1832 ) ( SUPPORTS ?auto_1831 ?auto_1828 ) ( not ( = ?auto_1827 ?auto_1835 ) ) ( not ( = ?auto_1830 ?auto_1827 ) ) ( not ( = ?auto_1830 ?auto_1835 ) ) ( not ( = ?auto_1829 ?auto_1828 ) ) ( CALIBRATION_TARGET ?auto_1831 ?auto_1835 ) ( ON_BOARD ?auto_1834 ?auto_1832 ) ( not ( = ?auto_1831 ?auto_1834 ) ) ( SUPPORTS ?auto_1834 ?auto_1829 ) ( CALIBRATION_TARGET ?auto_1834 ?auto_1835 ) ( POWER_AVAIL ?auto_1832 ) ( POINTING ?auto_1832 ?auto_1833 ) ( not ( = ?auto_1835 ?auto_1833 ) ) ( not ( = ?auto_1827 ?auto_1833 ) ) ( not ( = ?auto_1830 ?auto_1833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1830 ?auto_1829 ?auto_1827 ?auto_1828 )
      ( GET-2IMAGE-VERIFY ?auto_1827 ?auto_1828 ?auto_1830 ?auto_1829 ) )
  )

)

