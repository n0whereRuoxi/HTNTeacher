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
      ?auto_1469 - OBJ
      ?auto_1470 - LOCATION
    )
    :vars
    (
      ?auto_1471 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1471 ?auto_1470 ) ( IN-TRUCK ?auto_1469 ?auto_1471 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1469 ?auto_1471 ?auto_1470 )
      ( DELIVER-1PKG-VERIFY ?auto_1469 ?auto_1470 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1474 - OBJ
      ?auto_1475 - LOCATION
    )
    :vars
    (
      ?auto_1476 - TRUCK
      ?auto_1477 - LOCATION
      ?auto_1478 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1474 ?auto_1476 ) ( TRUCK-AT ?auto_1476 ?auto_1477 ) ( IN-CITY ?auto_1477 ?auto_1478 ) ( IN-CITY ?auto_1475 ?auto_1478 ) ( not ( = ?auto_1475 ?auto_1477 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1476 ?auto_1477 ?auto_1475 ?auto_1478 )
      ( DELIVER-1PKG ?auto_1474 ?auto_1475 )
      ( DELIVER-1PKG-VERIFY ?auto_1474 ?auto_1475 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1481 - OBJ
      ?auto_1482 - LOCATION
    )
    :vars
    (
      ?auto_1485 - TRUCK
      ?auto_1484 - LOCATION
      ?auto_1483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1485 ?auto_1484 ) ( IN-CITY ?auto_1484 ?auto_1483 ) ( IN-CITY ?auto_1482 ?auto_1483 ) ( not ( = ?auto_1482 ?auto_1484 ) ) ( OBJ-AT ?auto_1481 ?auto_1484 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1481 ?auto_1485 ?auto_1484 )
      ( DELIVER-1PKG ?auto_1481 ?auto_1482 )
      ( DELIVER-1PKG-VERIFY ?auto_1481 ?auto_1482 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1488 - OBJ
      ?auto_1489 - LOCATION
    )
    :vars
    (
      ?auto_1490 - LOCATION
      ?auto_1492 - CITY
      ?auto_1491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1490 ?auto_1492 ) ( IN-CITY ?auto_1489 ?auto_1492 ) ( not ( = ?auto_1489 ?auto_1490 ) ) ( OBJ-AT ?auto_1488 ?auto_1490 ) ( TRUCK-AT ?auto_1491 ?auto_1489 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1491 ?auto_1489 ?auto_1490 ?auto_1492 )
      ( DELIVER-1PKG ?auto_1488 ?auto_1489 )
      ( DELIVER-1PKG-VERIFY ?auto_1488 ?auto_1489 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1495 - OBJ
      ?auto_1496 - LOCATION
    )
    :vars
    (
      ?auto_1497 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1497 ?auto_1496 ) ( IN-TRUCK ?auto_1495 ?auto_1497 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1495 ?auto_1497 ?auto_1496 )
      ( DELIVER-1PKG-VERIFY ?auto_1495 ?auto_1496 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1500 - OBJ
      ?auto_1501 - LOCATION
    )
    :vars
    (
      ?auto_1502 - TRUCK
      ?auto_1503 - LOCATION
      ?auto_1504 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1500 ?auto_1502 ) ( TRUCK-AT ?auto_1502 ?auto_1503 ) ( IN-CITY ?auto_1503 ?auto_1504 ) ( IN-CITY ?auto_1501 ?auto_1504 ) ( not ( = ?auto_1501 ?auto_1503 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1502 ?auto_1503 ?auto_1501 ?auto_1504 )
      ( DELIVER-1PKG ?auto_1500 ?auto_1501 )
      ( DELIVER-1PKG-VERIFY ?auto_1500 ?auto_1501 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1507 - OBJ
      ?auto_1508 - LOCATION
    )
    :vars
    (
      ?auto_1510 - TRUCK
      ?auto_1509 - LOCATION
      ?auto_1511 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1510 ?auto_1509 ) ( IN-CITY ?auto_1509 ?auto_1511 ) ( IN-CITY ?auto_1508 ?auto_1511 ) ( not ( = ?auto_1508 ?auto_1509 ) ) ( OBJ-AT ?auto_1507 ?auto_1509 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1507 ?auto_1510 ?auto_1509 )
      ( DELIVER-1PKG ?auto_1507 ?auto_1508 )
      ( DELIVER-1PKG-VERIFY ?auto_1507 ?auto_1508 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1514 - OBJ
      ?auto_1515 - LOCATION
    )
    :vars
    (
      ?auto_1518 - LOCATION
      ?auto_1516 - CITY
      ?auto_1517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1518 ?auto_1516 ) ( IN-CITY ?auto_1515 ?auto_1516 ) ( not ( = ?auto_1515 ?auto_1518 ) ) ( OBJ-AT ?auto_1514 ?auto_1518 ) ( TRUCK-AT ?auto_1517 ?auto_1515 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1517 ?auto_1515 ?auto_1518 ?auto_1516 )
      ( DELIVER-1PKG ?auto_1514 ?auto_1515 )
      ( DELIVER-1PKG-VERIFY ?auto_1514 ?auto_1515 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1522 - OBJ
      ?auto_1524 - OBJ
      ?auto_1523 - LOCATION
    )
    :vars
    (
      ?auto_1525 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1524 ?auto_1522 ) ( TRUCK-AT ?auto_1525 ?auto_1523 ) ( IN-TRUCK ?auto_1524 ?auto_1525 ) ( OBJ-AT ?auto_1522 ?auto_1523 ) ( not ( = ?auto_1522 ?auto_1524 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1524 ?auto_1523 )
      ( DELIVER-2PKG-VERIFY ?auto_1522 ?auto_1524 ?auto_1523 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1529 - OBJ
      ?auto_1531 - OBJ
      ?auto_1530 - LOCATION
    )
    :vars
    (
      ?auto_1533 - TRUCK
      ?auto_1532 - LOCATION
      ?auto_1534 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1531 ?auto_1529 ) ( IN-TRUCK ?auto_1531 ?auto_1533 ) ( TRUCK-AT ?auto_1533 ?auto_1532 ) ( IN-CITY ?auto_1532 ?auto_1534 ) ( IN-CITY ?auto_1530 ?auto_1534 ) ( not ( = ?auto_1530 ?auto_1532 ) ) ( OBJ-AT ?auto_1529 ?auto_1530 ) ( not ( = ?auto_1529 ?auto_1531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1531 ?auto_1530 )
      ( DELIVER-2PKG-VERIFY ?auto_1529 ?auto_1531 ?auto_1530 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1538 - OBJ
      ?auto_1540 - OBJ
      ?auto_1539 - LOCATION
    )
    :vars
    (
      ?auto_1542 - TRUCK
      ?auto_1543 - LOCATION
      ?auto_1541 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1540 ?auto_1538 ) ( TRUCK-AT ?auto_1542 ?auto_1543 ) ( IN-CITY ?auto_1543 ?auto_1541 ) ( IN-CITY ?auto_1539 ?auto_1541 ) ( not ( = ?auto_1539 ?auto_1543 ) ) ( OBJ-AT ?auto_1540 ?auto_1543 ) ( OBJ-AT ?auto_1538 ?auto_1539 ) ( not ( = ?auto_1538 ?auto_1540 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1540 ?auto_1539 )
      ( DELIVER-2PKG-VERIFY ?auto_1538 ?auto_1540 ?auto_1539 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1547 - OBJ
      ?auto_1549 - OBJ
      ?auto_1548 - LOCATION
    )
    :vars
    (
      ?auto_1552 - LOCATION
      ?auto_1551 - CITY
      ?auto_1550 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1549 ?auto_1547 ) ( IN-CITY ?auto_1552 ?auto_1551 ) ( IN-CITY ?auto_1548 ?auto_1551 ) ( not ( = ?auto_1548 ?auto_1552 ) ) ( OBJ-AT ?auto_1549 ?auto_1552 ) ( TRUCK-AT ?auto_1550 ?auto_1548 ) ( OBJ-AT ?auto_1547 ?auto_1548 ) ( not ( = ?auto_1547 ?auto_1549 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1549 ?auto_1548 )
      ( DELIVER-2PKG-VERIFY ?auto_1547 ?auto_1549 ?auto_1548 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1556 - OBJ
      ?auto_1558 - OBJ
      ?auto_1557 - LOCATION
    )
    :vars
    (
      ?auto_1560 - LOCATION
      ?auto_1561 - CITY
      ?auto_1559 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1558 ?auto_1556 ) ( IN-CITY ?auto_1560 ?auto_1561 ) ( IN-CITY ?auto_1557 ?auto_1561 ) ( not ( = ?auto_1557 ?auto_1560 ) ) ( OBJ-AT ?auto_1558 ?auto_1560 ) ( TRUCK-AT ?auto_1559 ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1558 ) ) ( IN-TRUCK ?auto_1556 ?auto_1559 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1556 ?auto_1557 )
      ( DELIVER-2PKG ?auto_1556 ?auto_1558 ?auto_1557 )
      ( DELIVER-2PKG-VERIFY ?auto_1556 ?auto_1558 ?auto_1557 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1565 - OBJ
      ?auto_1567 - OBJ
      ?auto_1566 - LOCATION
    )
    :vars
    (
      ?auto_1568 - LOCATION
      ?auto_1569 - CITY
      ?auto_1570 - TRUCK
      ?auto_1571 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1567 ?auto_1565 ) ( IN-CITY ?auto_1568 ?auto_1569 ) ( IN-CITY ?auto_1566 ?auto_1569 ) ( not ( = ?auto_1566 ?auto_1568 ) ) ( OBJ-AT ?auto_1567 ?auto_1568 ) ( not ( = ?auto_1565 ?auto_1567 ) ) ( IN-TRUCK ?auto_1565 ?auto_1570 ) ( TRUCK-AT ?auto_1570 ?auto_1571 ) ( IN-CITY ?auto_1571 ?auto_1569 ) ( not ( = ?auto_1566 ?auto_1571 ) ) ( not ( = ?auto_1568 ?auto_1571 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1570 ?auto_1571 ?auto_1566 ?auto_1569 )
      ( DELIVER-2PKG ?auto_1565 ?auto_1567 ?auto_1566 )
      ( DELIVER-2PKG-VERIFY ?auto_1565 ?auto_1567 ?auto_1566 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1575 - OBJ
      ?auto_1577 - OBJ
      ?auto_1576 - LOCATION
    )
    :vars
    (
      ?auto_1578 - LOCATION
      ?auto_1581 - CITY
      ?auto_1580 - TRUCK
      ?auto_1579 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1577 ?auto_1575 ) ( IN-CITY ?auto_1578 ?auto_1581 ) ( IN-CITY ?auto_1576 ?auto_1581 ) ( not ( = ?auto_1576 ?auto_1578 ) ) ( OBJ-AT ?auto_1577 ?auto_1578 ) ( not ( = ?auto_1575 ?auto_1577 ) ) ( TRUCK-AT ?auto_1580 ?auto_1579 ) ( IN-CITY ?auto_1579 ?auto_1581 ) ( not ( = ?auto_1576 ?auto_1579 ) ) ( not ( = ?auto_1578 ?auto_1579 ) ) ( OBJ-AT ?auto_1575 ?auto_1579 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1575 ?auto_1580 ?auto_1579 )
      ( DELIVER-2PKG ?auto_1575 ?auto_1577 ?auto_1576 )
      ( DELIVER-2PKG-VERIFY ?auto_1575 ?auto_1577 ?auto_1576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1585 - OBJ
      ?auto_1587 - OBJ
      ?auto_1586 - LOCATION
    )
    :vars
    (
      ?auto_1588 - LOCATION
      ?auto_1590 - CITY
      ?auto_1591 - LOCATION
      ?auto_1589 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1587 ?auto_1585 ) ( IN-CITY ?auto_1588 ?auto_1590 ) ( IN-CITY ?auto_1586 ?auto_1590 ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( OBJ-AT ?auto_1587 ?auto_1588 ) ( not ( = ?auto_1585 ?auto_1587 ) ) ( IN-CITY ?auto_1591 ?auto_1590 ) ( not ( = ?auto_1586 ?auto_1591 ) ) ( not ( = ?auto_1588 ?auto_1591 ) ) ( OBJ-AT ?auto_1585 ?auto_1591 ) ( TRUCK-AT ?auto_1589 ?auto_1586 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1589 ?auto_1586 ?auto_1591 ?auto_1590 )
      ( DELIVER-2PKG ?auto_1585 ?auto_1587 ?auto_1586 )
      ( DELIVER-2PKG-VERIFY ?auto_1585 ?auto_1587 ?auto_1586 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1594 - OBJ
      ?auto_1595 - LOCATION
    )
    :vars
    (
      ?auto_1596 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1596 ?auto_1595 ) ( IN-TRUCK ?auto_1594 ?auto_1596 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1594 ?auto_1596 ?auto_1595 )
      ( DELIVER-1PKG-VERIFY ?auto_1594 ?auto_1595 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1599 - OBJ
      ?auto_1600 - LOCATION
    )
    :vars
    (
      ?auto_1601 - TRUCK
      ?auto_1602 - LOCATION
      ?auto_1603 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1599 ?auto_1601 ) ( TRUCK-AT ?auto_1601 ?auto_1602 ) ( IN-CITY ?auto_1602 ?auto_1603 ) ( IN-CITY ?auto_1600 ?auto_1603 ) ( not ( = ?auto_1600 ?auto_1602 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1601 ?auto_1602 ?auto_1600 ?auto_1603 )
      ( DELIVER-1PKG ?auto_1599 ?auto_1600 )
      ( DELIVER-1PKG-VERIFY ?auto_1599 ?auto_1600 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1606 - OBJ
      ?auto_1607 - LOCATION
    )
    :vars
    (
      ?auto_1608 - TRUCK
      ?auto_1609 - LOCATION
      ?auto_1610 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1608 ?auto_1609 ) ( IN-CITY ?auto_1609 ?auto_1610 ) ( IN-CITY ?auto_1607 ?auto_1610 ) ( not ( = ?auto_1607 ?auto_1609 ) ) ( OBJ-AT ?auto_1606 ?auto_1609 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1606 ?auto_1608 ?auto_1609 )
      ( DELIVER-1PKG ?auto_1606 ?auto_1607 )
      ( DELIVER-1PKG-VERIFY ?auto_1606 ?auto_1607 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1613 - OBJ
      ?auto_1614 - LOCATION
    )
    :vars
    (
      ?auto_1617 - LOCATION
      ?auto_1615 - CITY
      ?auto_1616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1617 ?auto_1615 ) ( IN-CITY ?auto_1614 ?auto_1615 ) ( not ( = ?auto_1614 ?auto_1617 ) ) ( OBJ-AT ?auto_1613 ?auto_1617 ) ( TRUCK-AT ?auto_1616 ?auto_1614 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1616 ?auto_1614 ?auto_1617 ?auto_1615 )
      ( DELIVER-1PKG ?auto_1613 ?auto_1614 )
      ( DELIVER-1PKG-VERIFY ?auto_1613 ?auto_1614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1622 - OBJ
      ?auto_1624 - OBJ
      ?auto_1625 - OBJ
      ?auto_1623 - LOCATION
    )
    :vars
    (
      ?auto_1626 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1624 ?auto_1622 ) ( GREATER-THAN ?auto_1625 ?auto_1622 ) ( GREATER-THAN ?auto_1625 ?auto_1624 ) ( TRUCK-AT ?auto_1626 ?auto_1623 ) ( IN-TRUCK ?auto_1625 ?auto_1626 ) ( OBJ-AT ?auto_1622 ?auto_1623 ) ( OBJ-AT ?auto_1624 ?auto_1623 ) ( not ( = ?auto_1622 ?auto_1624 ) ) ( not ( = ?auto_1622 ?auto_1625 ) ) ( not ( = ?auto_1624 ?auto_1625 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1625 ?auto_1623 )
      ( DELIVER-3PKG-VERIFY ?auto_1622 ?auto_1624 ?auto_1625 ?auto_1623 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1631 - OBJ
      ?auto_1633 - OBJ
      ?auto_1634 - OBJ
      ?auto_1632 - LOCATION
    )
    :vars
    (
      ?auto_1635 - TRUCK
      ?auto_1636 - LOCATION
      ?auto_1637 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1633 ?auto_1631 ) ( GREATER-THAN ?auto_1634 ?auto_1631 ) ( GREATER-THAN ?auto_1634 ?auto_1633 ) ( IN-TRUCK ?auto_1634 ?auto_1635 ) ( TRUCK-AT ?auto_1635 ?auto_1636 ) ( IN-CITY ?auto_1636 ?auto_1637 ) ( IN-CITY ?auto_1632 ?auto_1637 ) ( not ( = ?auto_1632 ?auto_1636 ) ) ( OBJ-AT ?auto_1631 ?auto_1632 ) ( OBJ-AT ?auto_1633 ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1633 ) ) ( not ( = ?auto_1631 ?auto_1634 ) ) ( not ( = ?auto_1633 ?auto_1634 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1634 ?auto_1632 )
      ( DELIVER-3PKG-VERIFY ?auto_1631 ?auto_1633 ?auto_1634 ?auto_1632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1642 - OBJ
      ?auto_1644 - OBJ
      ?auto_1645 - OBJ
      ?auto_1643 - LOCATION
    )
    :vars
    (
      ?auto_1647 - TRUCK
      ?auto_1648 - LOCATION
      ?auto_1646 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1644 ?auto_1642 ) ( GREATER-THAN ?auto_1645 ?auto_1642 ) ( GREATER-THAN ?auto_1645 ?auto_1644 ) ( TRUCK-AT ?auto_1647 ?auto_1648 ) ( IN-CITY ?auto_1648 ?auto_1646 ) ( IN-CITY ?auto_1643 ?auto_1646 ) ( not ( = ?auto_1643 ?auto_1648 ) ) ( OBJ-AT ?auto_1645 ?auto_1648 ) ( OBJ-AT ?auto_1642 ?auto_1643 ) ( OBJ-AT ?auto_1644 ?auto_1643 ) ( not ( = ?auto_1642 ?auto_1644 ) ) ( not ( = ?auto_1642 ?auto_1645 ) ) ( not ( = ?auto_1644 ?auto_1645 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1645 ?auto_1643 )
      ( DELIVER-3PKG-VERIFY ?auto_1642 ?auto_1644 ?auto_1645 ?auto_1643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1653 - OBJ
      ?auto_1655 - OBJ
      ?auto_1656 - OBJ
      ?auto_1654 - LOCATION
    )
    :vars
    (
      ?auto_1657 - LOCATION
      ?auto_1658 - CITY
      ?auto_1659 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1655 ?auto_1653 ) ( GREATER-THAN ?auto_1656 ?auto_1653 ) ( GREATER-THAN ?auto_1656 ?auto_1655 ) ( IN-CITY ?auto_1657 ?auto_1658 ) ( IN-CITY ?auto_1654 ?auto_1658 ) ( not ( = ?auto_1654 ?auto_1657 ) ) ( OBJ-AT ?auto_1656 ?auto_1657 ) ( TRUCK-AT ?auto_1659 ?auto_1654 ) ( OBJ-AT ?auto_1653 ?auto_1654 ) ( OBJ-AT ?auto_1655 ?auto_1654 ) ( not ( = ?auto_1653 ?auto_1655 ) ) ( not ( = ?auto_1653 ?auto_1656 ) ) ( not ( = ?auto_1655 ?auto_1656 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1656 ?auto_1654 )
      ( DELIVER-3PKG-VERIFY ?auto_1653 ?auto_1655 ?auto_1656 ?auto_1654 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1664 - OBJ
      ?auto_1666 - OBJ
      ?auto_1667 - OBJ
      ?auto_1665 - LOCATION
    )
    :vars
    (
      ?auto_1669 - LOCATION
      ?auto_1670 - CITY
      ?auto_1668 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1666 ?auto_1664 ) ( GREATER-THAN ?auto_1667 ?auto_1664 ) ( GREATER-THAN ?auto_1667 ?auto_1666 ) ( IN-CITY ?auto_1669 ?auto_1670 ) ( IN-CITY ?auto_1665 ?auto_1670 ) ( not ( = ?auto_1665 ?auto_1669 ) ) ( OBJ-AT ?auto_1667 ?auto_1669 ) ( TRUCK-AT ?auto_1668 ?auto_1665 ) ( OBJ-AT ?auto_1664 ?auto_1665 ) ( not ( = ?auto_1664 ?auto_1666 ) ) ( not ( = ?auto_1664 ?auto_1667 ) ) ( not ( = ?auto_1666 ?auto_1667 ) ) ( IN-TRUCK ?auto_1666 ?auto_1668 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1666 ?auto_1665 )
      ( DELIVER-3PKG ?auto_1664 ?auto_1666 ?auto_1667 ?auto_1665 )
      ( DELIVER-3PKG-VERIFY ?auto_1664 ?auto_1666 ?auto_1667 ?auto_1665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1675 - OBJ
      ?auto_1677 - OBJ
      ?auto_1678 - OBJ
      ?auto_1676 - LOCATION
    )
    :vars
    (
      ?auto_1680 - LOCATION
      ?auto_1681 - CITY
      ?auto_1679 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1677 ?auto_1675 ) ( GREATER-THAN ?auto_1678 ?auto_1675 ) ( GREATER-THAN ?auto_1678 ?auto_1677 ) ( IN-CITY ?auto_1680 ?auto_1681 ) ( IN-CITY ?auto_1676 ?auto_1681 ) ( not ( = ?auto_1676 ?auto_1680 ) ) ( OBJ-AT ?auto_1678 ?auto_1680 ) ( OBJ-AT ?auto_1675 ?auto_1676 ) ( not ( = ?auto_1675 ?auto_1677 ) ) ( not ( = ?auto_1675 ?auto_1678 ) ) ( not ( = ?auto_1677 ?auto_1678 ) ) ( IN-TRUCK ?auto_1677 ?auto_1679 ) ( TRUCK-AT ?auto_1679 ?auto_1680 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1679 ?auto_1680 ?auto_1676 ?auto_1681 )
      ( DELIVER-3PKG ?auto_1675 ?auto_1677 ?auto_1678 ?auto_1676 )
      ( DELIVER-3PKG-VERIFY ?auto_1675 ?auto_1677 ?auto_1678 ?auto_1676 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1686 - OBJ
      ?auto_1688 - OBJ
      ?auto_1689 - OBJ
      ?auto_1687 - LOCATION
    )
    :vars
    (
      ?auto_1692 - LOCATION
      ?auto_1690 - CITY
      ?auto_1691 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1688 ?auto_1686 ) ( GREATER-THAN ?auto_1689 ?auto_1686 ) ( GREATER-THAN ?auto_1689 ?auto_1688 ) ( IN-CITY ?auto_1692 ?auto_1690 ) ( IN-CITY ?auto_1687 ?auto_1690 ) ( not ( = ?auto_1687 ?auto_1692 ) ) ( OBJ-AT ?auto_1689 ?auto_1692 ) ( OBJ-AT ?auto_1686 ?auto_1687 ) ( not ( = ?auto_1686 ?auto_1688 ) ) ( not ( = ?auto_1686 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( TRUCK-AT ?auto_1691 ?auto_1692 ) ( OBJ-AT ?auto_1688 ?auto_1692 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1688 ?auto_1691 ?auto_1692 )
      ( DELIVER-3PKG ?auto_1686 ?auto_1688 ?auto_1689 ?auto_1687 )
      ( DELIVER-3PKG-VERIFY ?auto_1686 ?auto_1688 ?auto_1689 ?auto_1687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1697 - OBJ
      ?auto_1699 - OBJ
      ?auto_1700 - OBJ
      ?auto_1698 - LOCATION
    )
    :vars
    (
      ?auto_1703 - LOCATION
      ?auto_1702 - CITY
      ?auto_1701 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1699 ?auto_1697 ) ( GREATER-THAN ?auto_1700 ?auto_1697 ) ( GREATER-THAN ?auto_1700 ?auto_1699 ) ( IN-CITY ?auto_1703 ?auto_1702 ) ( IN-CITY ?auto_1698 ?auto_1702 ) ( not ( = ?auto_1698 ?auto_1703 ) ) ( OBJ-AT ?auto_1700 ?auto_1703 ) ( OBJ-AT ?auto_1697 ?auto_1698 ) ( not ( = ?auto_1697 ?auto_1699 ) ) ( not ( = ?auto_1697 ?auto_1700 ) ) ( not ( = ?auto_1699 ?auto_1700 ) ) ( OBJ-AT ?auto_1699 ?auto_1703 ) ( TRUCK-AT ?auto_1701 ?auto_1698 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1701 ?auto_1698 ?auto_1703 ?auto_1702 )
      ( DELIVER-3PKG ?auto_1697 ?auto_1699 ?auto_1700 ?auto_1698 )
      ( DELIVER-3PKG-VERIFY ?auto_1697 ?auto_1699 ?auto_1700 ?auto_1698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1708 - OBJ
      ?auto_1710 - OBJ
      ?auto_1711 - OBJ
      ?auto_1709 - LOCATION
    )
    :vars
    (
      ?auto_1714 - LOCATION
      ?auto_1713 - CITY
      ?auto_1712 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1710 ?auto_1708 ) ( GREATER-THAN ?auto_1711 ?auto_1708 ) ( GREATER-THAN ?auto_1711 ?auto_1710 ) ( IN-CITY ?auto_1714 ?auto_1713 ) ( IN-CITY ?auto_1709 ?auto_1713 ) ( not ( = ?auto_1709 ?auto_1714 ) ) ( OBJ-AT ?auto_1711 ?auto_1714 ) ( not ( = ?auto_1708 ?auto_1710 ) ) ( not ( = ?auto_1708 ?auto_1711 ) ) ( not ( = ?auto_1710 ?auto_1711 ) ) ( OBJ-AT ?auto_1710 ?auto_1714 ) ( TRUCK-AT ?auto_1712 ?auto_1709 ) ( IN-TRUCK ?auto_1708 ?auto_1712 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1708 ?auto_1709 )
      ( DELIVER-3PKG ?auto_1708 ?auto_1710 ?auto_1711 ?auto_1709 )
      ( DELIVER-3PKG-VERIFY ?auto_1708 ?auto_1710 ?auto_1711 ?auto_1709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1719 - OBJ
      ?auto_1721 - OBJ
      ?auto_1722 - OBJ
      ?auto_1720 - LOCATION
    )
    :vars
    (
      ?auto_1725 - LOCATION
      ?auto_1724 - CITY
      ?auto_1723 - TRUCK
      ?auto_1726 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1721 ?auto_1719 ) ( GREATER-THAN ?auto_1722 ?auto_1719 ) ( GREATER-THAN ?auto_1722 ?auto_1721 ) ( IN-CITY ?auto_1725 ?auto_1724 ) ( IN-CITY ?auto_1720 ?auto_1724 ) ( not ( = ?auto_1720 ?auto_1725 ) ) ( OBJ-AT ?auto_1722 ?auto_1725 ) ( not ( = ?auto_1719 ?auto_1721 ) ) ( not ( = ?auto_1719 ?auto_1722 ) ) ( not ( = ?auto_1721 ?auto_1722 ) ) ( OBJ-AT ?auto_1721 ?auto_1725 ) ( IN-TRUCK ?auto_1719 ?auto_1723 ) ( TRUCK-AT ?auto_1723 ?auto_1726 ) ( IN-CITY ?auto_1726 ?auto_1724 ) ( not ( = ?auto_1720 ?auto_1726 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1723 ?auto_1726 ?auto_1720 ?auto_1724 )
      ( DELIVER-3PKG ?auto_1719 ?auto_1721 ?auto_1722 ?auto_1720 )
      ( DELIVER-3PKG-VERIFY ?auto_1719 ?auto_1721 ?auto_1722 ?auto_1720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1731 - OBJ
      ?auto_1733 - OBJ
      ?auto_1734 - OBJ
      ?auto_1732 - LOCATION
    )
    :vars
    (
      ?auto_1738 - LOCATION
      ?auto_1736 - CITY
      ?auto_1737 - TRUCK
      ?auto_1735 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1733 ?auto_1731 ) ( GREATER-THAN ?auto_1734 ?auto_1731 ) ( GREATER-THAN ?auto_1734 ?auto_1733 ) ( IN-CITY ?auto_1738 ?auto_1736 ) ( IN-CITY ?auto_1732 ?auto_1736 ) ( not ( = ?auto_1732 ?auto_1738 ) ) ( OBJ-AT ?auto_1734 ?auto_1738 ) ( not ( = ?auto_1731 ?auto_1733 ) ) ( not ( = ?auto_1731 ?auto_1734 ) ) ( not ( = ?auto_1733 ?auto_1734 ) ) ( OBJ-AT ?auto_1733 ?auto_1738 ) ( TRUCK-AT ?auto_1737 ?auto_1735 ) ( IN-CITY ?auto_1735 ?auto_1736 ) ( not ( = ?auto_1732 ?auto_1735 ) ) ( not ( = ?auto_1738 ?auto_1735 ) ) ( OBJ-AT ?auto_1731 ?auto_1735 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1731 ?auto_1737 ?auto_1735 )
      ( DELIVER-3PKG ?auto_1731 ?auto_1733 ?auto_1734 ?auto_1732 )
      ( DELIVER-3PKG-VERIFY ?auto_1731 ?auto_1733 ?auto_1734 ?auto_1732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1743 - OBJ
      ?auto_1745 - OBJ
      ?auto_1746 - OBJ
      ?auto_1744 - LOCATION
    )
    :vars
    (
      ?auto_1748 - LOCATION
      ?auto_1749 - CITY
      ?auto_1747 - LOCATION
      ?auto_1750 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1745 ?auto_1743 ) ( GREATER-THAN ?auto_1746 ?auto_1743 ) ( GREATER-THAN ?auto_1746 ?auto_1745 ) ( IN-CITY ?auto_1748 ?auto_1749 ) ( IN-CITY ?auto_1744 ?auto_1749 ) ( not ( = ?auto_1744 ?auto_1748 ) ) ( OBJ-AT ?auto_1746 ?auto_1748 ) ( not ( = ?auto_1743 ?auto_1745 ) ) ( not ( = ?auto_1743 ?auto_1746 ) ) ( not ( = ?auto_1745 ?auto_1746 ) ) ( OBJ-AT ?auto_1745 ?auto_1748 ) ( IN-CITY ?auto_1747 ?auto_1749 ) ( not ( = ?auto_1744 ?auto_1747 ) ) ( not ( = ?auto_1748 ?auto_1747 ) ) ( OBJ-AT ?auto_1743 ?auto_1747 ) ( TRUCK-AT ?auto_1750 ?auto_1744 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1750 ?auto_1744 ?auto_1747 ?auto_1749 )
      ( DELIVER-3PKG ?auto_1743 ?auto_1745 ?auto_1746 ?auto_1744 )
      ( DELIVER-3PKG-VERIFY ?auto_1743 ?auto_1745 ?auto_1746 ?auto_1744 ) )
  )

)

